---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.968251, -0.525166, -2.024323, 1, 0, 0, 1,
-2.857914, -0.3539546, -1.609722, 1, 0.007843138, 0, 1,
-2.646551, 0.4831843, -3.091429, 1, 0.01176471, 0, 1,
-2.557139, 1.300228, -1.454734, 1, 0.01960784, 0, 1,
-2.367864, 0.5065445, -0.5712026, 1, 0.02352941, 0, 1,
-2.357092, 1.809201, -0.2033976, 1, 0.03137255, 0, 1,
-2.334957, -0.7474725, -1.584304, 1, 0.03529412, 0, 1,
-2.330188, -0.3786561, -0.1979107, 1, 0.04313726, 0, 1,
-2.23666, 0.103138, 0.3261755, 1, 0.04705882, 0, 1,
-2.224236, 0.9748569, 0.5011637, 1, 0.05490196, 0, 1,
-2.197907, 0.5292045, -2.753977, 1, 0.05882353, 0, 1,
-2.188438, -0.344517, -1.003513, 1, 0.06666667, 0, 1,
-2.136858, 0.3260461, -0.3870818, 1, 0.07058824, 0, 1,
-2.100038, -0.5535012, -3.664165, 1, 0.07843138, 0, 1,
-2.075752, -1.045499, -0.2826919, 1, 0.08235294, 0, 1,
-1.992898, 0.8182666, 0.04608842, 1, 0.09019608, 0, 1,
-1.988483, -0.4944893, -3.777746, 1, 0.09411765, 0, 1,
-1.958229, 0.9724473, -2.882918, 1, 0.1019608, 0, 1,
-1.956955, -0.134972, -1.505526, 1, 0.1098039, 0, 1,
-1.945413, 0.5196756, -1.72918, 1, 0.1137255, 0, 1,
-1.907092, -0.1162115, -1.761974, 1, 0.1215686, 0, 1,
-1.900022, -1.178239, -1.720944, 1, 0.1254902, 0, 1,
-1.88924, 0.7791393, -0.9010444, 1, 0.1333333, 0, 1,
-1.854963, 0.09314215, -0.8512655, 1, 0.1372549, 0, 1,
-1.851167, -0.5031585, -1.852783, 1, 0.145098, 0, 1,
-1.802708, 0.1909332, -1.485107, 1, 0.1490196, 0, 1,
-1.795321, -0.05137677, -1.216946, 1, 0.1568628, 0, 1,
-1.795279, -0.4867586, -1.075071, 1, 0.1607843, 0, 1,
-1.791459, 1.743794, -0.2267171, 1, 0.1686275, 0, 1,
-1.765349, -0.3792755, -3.015753, 1, 0.172549, 0, 1,
-1.737749, -0.121204, -1.962723, 1, 0.1803922, 0, 1,
-1.725584, -0.621933, -3.329817, 1, 0.1843137, 0, 1,
-1.725119, -1.249462, -1.782455, 1, 0.1921569, 0, 1,
-1.711734, -0.4805893, -3.455445, 1, 0.1960784, 0, 1,
-1.710778, 0.315516, -1.746303, 1, 0.2039216, 0, 1,
-1.70585, -0.07537013, -1.402609, 1, 0.2117647, 0, 1,
-1.687305, -0.5740901, -3.010278, 1, 0.2156863, 0, 1,
-1.680406, -1.208743, -2.390085, 1, 0.2235294, 0, 1,
-1.67714, 1.267865, 0.3290528, 1, 0.227451, 0, 1,
-1.670849, 1.753595, 0.4692551, 1, 0.2352941, 0, 1,
-1.647191, -0.5352207, -1.544843, 1, 0.2392157, 0, 1,
-1.636452, -0.5880158, -1.482267, 1, 0.2470588, 0, 1,
-1.635115, 0.05807334, -2.74922, 1, 0.2509804, 0, 1,
-1.62997, -1.894781, -1.376181, 1, 0.2588235, 0, 1,
-1.629349, -1.466636, -1.611587, 1, 0.2627451, 0, 1,
-1.615215, -0.5530998, -3.030832, 1, 0.2705882, 0, 1,
-1.612073, -0.6614603, -1.099862, 1, 0.2745098, 0, 1,
-1.599525, -0.5002079, -1.953897, 1, 0.282353, 0, 1,
-1.597651, 0.9043592, -2.4995, 1, 0.2862745, 0, 1,
-1.582538, 0.7514464, -0.9206727, 1, 0.2941177, 0, 1,
-1.566792, 0.01367715, -2.502307, 1, 0.3019608, 0, 1,
-1.562222, -0.5236207, -0.8528802, 1, 0.3058824, 0, 1,
-1.558138, -1.163012, -3.031337, 1, 0.3137255, 0, 1,
-1.548831, -0.5689431, -1.731309, 1, 0.3176471, 0, 1,
-1.541157, 0.3033163, -1.545739, 1, 0.3254902, 0, 1,
-1.538529, 0.4516596, -1.212462, 1, 0.3294118, 0, 1,
-1.537864, -0.2839447, -3.059462, 1, 0.3372549, 0, 1,
-1.534557, -1.777987, -0.5113118, 1, 0.3411765, 0, 1,
-1.530097, 1.116451, -0.4499288, 1, 0.3490196, 0, 1,
-1.526734, -0.04515341, -3.236562, 1, 0.3529412, 0, 1,
-1.522511, 0.06597118, -1.325359, 1, 0.3607843, 0, 1,
-1.51952, -1.005054, -1.637532, 1, 0.3647059, 0, 1,
-1.51269, 0.4350303, -1.132615, 1, 0.372549, 0, 1,
-1.510486, -1.043423, -1.235186, 1, 0.3764706, 0, 1,
-1.50575, 1.359307, -0.3421099, 1, 0.3843137, 0, 1,
-1.504857, -0.03100889, -2.837094, 1, 0.3882353, 0, 1,
-1.482475, -0.03382624, -2.175651, 1, 0.3960784, 0, 1,
-1.478293, -1.976655, -1.43777, 1, 0.4039216, 0, 1,
-1.471749, -0.3864342, -0.5645124, 1, 0.4078431, 0, 1,
-1.465616, 0.5168591, 1.093409, 1, 0.4156863, 0, 1,
-1.451168, -1.185167, -0.8494641, 1, 0.4196078, 0, 1,
-1.446698, -0.0867536, -1.078741, 1, 0.427451, 0, 1,
-1.443431, -0.1772657, -2.113645, 1, 0.4313726, 0, 1,
-1.438634, 0.6195462, -1.378739, 1, 0.4392157, 0, 1,
-1.421549, -2.171175, -3.306431, 1, 0.4431373, 0, 1,
-1.421127, 0.1254107, -2.481102, 1, 0.4509804, 0, 1,
-1.409286, -1.533921, -3.075582, 1, 0.454902, 0, 1,
-1.408413, 1.284472, -1.317063, 1, 0.4627451, 0, 1,
-1.404999, 0.2062768, 0.1721031, 1, 0.4666667, 0, 1,
-1.398807, -0.4982505, -0.8440449, 1, 0.4745098, 0, 1,
-1.397543, 1.200035, -2.005137, 1, 0.4784314, 0, 1,
-1.389165, -0.2814789, -1.949465, 1, 0.4862745, 0, 1,
-1.382434, -0.3644414, -0.005966593, 1, 0.4901961, 0, 1,
-1.382188, 0.5846959, -1.822569, 1, 0.4980392, 0, 1,
-1.374604, 0.7060618, -2.222222, 1, 0.5058824, 0, 1,
-1.370745, -0.1266913, -1.838735, 1, 0.509804, 0, 1,
-1.367757, -1.110694, -2.015821, 1, 0.5176471, 0, 1,
-1.350039, -0.3592176, -0.9116344, 1, 0.5215687, 0, 1,
-1.349043, 1.086051, -1.111692, 1, 0.5294118, 0, 1,
-1.33965, -0.496795, -3.263091, 1, 0.5333334, 0, 1,
-1.326678, 1.756294, -1.273632, 1, 0.5411765, 0, 1,
-1.323378, -0.8254017, -2.520208, 1, 0.5450981, 0, 1,
-1.322777, 2.627276, -0.5447696, 1, 0.5529412, 0, 1,
-1.313949, -0.8704042, -3.462365, 1, 0.5568628, 0, 1,
-1.289416, -1.950996, -3.976565, 1, 0.5647059, 0, 1,
-1.288693, -0.7203674, -3.916569, 1, 0.5686275, 0, 1,
-1.287993, 1.422085, -0.9474529, 1, 0.5764706, 0, 1,
-1.287787, -0.8535944, -3.201863, 1, 0.5803922, 0, 1,
-1.279531, -1.219409, -1.389339, 1, 0.5882353, 0, 1,
-1.279104, 0.158407, -1.632677, 1, 0.5921569, 0, 1,
-1.276268, 0.234128, -1.574013, 1, 0.6, 0, 1,
-1.274902, -0.6396999, -3.648271, 1, 0.6078432, 0, 1,
-1.270888, -0.3000687, -1.923056, 1, 0.6117647, 0, 1,
-1.270858, 0.1901746, -1.651521, 1, 0.6196079, 0, 1,
-1.27081, -1.001615, -1.951437, 1, 0.6235294, 0, 1,
-1.270335, -0.4819039, -1.048979, 1, 0.6313726, 0, 1,
-1.268187, 1.451761, -1.311767, 1, 0.6352941, 0, 1,
-1.263185, -1.125587, -1.51352, 1, 0.6431373, 0, 1,
-1.259996, -0.1549649, -1.276083, 1, 0.6470588, 0, 1,
-1.25628, 0.5824392, -0.6763484, 1, 0.654902, 0, 1,
-1.254924, -0.8752389, -2.191398, 1, 0.6588235, 0, 1,
-1.25478, -1.606795, -4.098893, 1, 0.6666667, 0, 1,
-1.247667, -1.525801, -2.713121, 1, 0.6705883, 0, 1,
-1.238891, -0.7670841, -1.525248, 1, 0.6784314, 0, 1,
-1.230582, -0.8257958, -0.782177, 1, 0.682353, 0, 1,
-1.227011, 0.7755429, -0.4687085, 1, 0.6901961, 0, 1,
-1.221215, -1.741829, -2.114318, 1, 0.6941177, 0, 1,
-1.212209, 1.091472, 0.4635036, 1, 0.7019608, 0, 1,
-1.211249, -1.190787, -3.614874, 1, 0.7098039, 0, 1,
-1.20509, -0.5805637, -1.882556, 1, 0.7137255, 0, 1,
-1.203868, -0.4417788, -1.688558, 1, 0.7215686, 0, 1,
-1.201292, 0.4588625, -0.7440985, 1, 0.7254902, 0, 1,
-1.198092, -2.822021, -2.976782, 1, 0.7333333, 0, 1,
-1.196216, 2.643818, 0.04428358, 1, 0.7372549, 0, 1,
-1.191922, 0.1074336, -2.683665, 1, 0.7450981, 0, 1,
-1.191659, -1.003604, -4.008636, 1, 0.7490196, 0, 1,
-1.184691, 1.767002, -1.87459, 1, 0.7568628, 0, 1,
-1.180662, -0.8997319, -2.134477, 1, 0.7607843, 0, 1,
-1.171041, 0.6164297, -1.585393, 1, 0.7686275, 0, 1,
-1.169018, -0.04489793, -1.062279, 1, 0.772549, 0, 1,
-1.165343, 0.9174852, 0.110709, 1, 0.7803922, 0, 1,
-1.162942, 0.9470236, 0.8683817, 1, 0.7843137, 0, 1,
-1.161999, -0.808594, -1.410554, 1, 0.7921569, 0, 1,
-1.15669, -0.8073596, -2.844568, 1, 0.7960784, 0, 1,
-1.152992, -0.6344742, -5.39128, 1, 0.8039216, 0, 1,
-1.151442, 0.1457113, -1.377847, 1, 0.8117647, 0, 1,
-1.134224, -0.488729, 0.04651184, 1, 0.8156863, 0, 1,
-1.134008, 1.689343, -0.3898634, 1, 0.8235294, 0, 1,
-1.13084, 1.357462, -0.7902412, 1, 0.827451, 0, 1,
-1.130041, 0.1399288, -1.283675, 1, 0.8352941, 0, 1,
-1.129176, -0.02411653, -1.261065, 1, 0.8392157, 0, 1,
-1.128101, -0.2263782, -2.700527, 1, 0.8470588, 0, 1,
-1.126701, 1.477985, -0.1781461, 1, 0.8509804, 0, 1,
-1.124554, 1.833406, 0.4308925, 1, 0.8588235, 0, 1,
-1.120785, 0.6765542, 0.2821132, 1, 0.8627451, 0, 1,
-1.119791, 0.5452368, -2.136764, 1, 0.8705882, 0, 1,
-1.11934, 0.3667441, -1.161088, 1, 0.8745098, 0, 1,
-1.11572, 1.992854, -0.4689889, 1, 0.8823529, 0, 1,
-1.112772, 1.076563, 0.03308644, 1, 0.8862745, 0, 1,
-1.111178, -0.4879886, -2.206388, 1, 0.8941177, 0, 1,
-1.10572, -0.9254436, -2.93171, 1, 0.8980392, 0, 1,
-1.101236, -0.1745266, -0.8632599, 1, 0.9058824, 0, 1,
-1.095485, -0.9527829, -1.883283, 1, 0.9137255, 0, 1,
-1.095035, 0.6620011, -0.8730423, 1, 0.9176471, 0, 1,
-1.090394, 2.073231, -0.03566933, 1, 0.9254902, 0, 1,
-1.086061, -1.818534, -2.554129, 1, 0.9294118, 0, 1,
-1.084773, 1.242222, 0.001816726, 1, 0.9372549, 0, 1,
-1.083298, 1.928721, -2.80777, 1, 0.9411765, 0, 1,
-1.075557, 0.5298045, -1.45914, 1, 0.9490196, 0, 1,
-1.066943, 0.5581247, -1.611547, 1, 0.9529412, 0, 1,
-1.058641, -0.4464777, -1.906202, 1, 0.9607843, 0, 1,
-1.054283, -0.2276628, -1.059703, 1, 0.9647059, 0, 1,
-1.049044, -1.473747, -5.387128, 1, 0.972549, 0, 1,
-1.044303, -0.282716, -3.043443, 1, 0.9764706, 0, 1,
-1.041078, 0.3141578, -2.504818, 1, 0.9843137, 0, 1,
-1.040459, -1.093316, -1.003209, 1, 0.9882353, 0, 1,
-1.040384, 0.9482679, -0.7515939, 1, 0.9960784, 0, 1,
-1.039477, -0.5411447, -2.080927, 0.9960784, 1, 0, 1,
-1.031169, -0.6489578, -2.998179, 0.9921569, 1, 0, 1,
-1.030716, -0.1408798, -2.497124, 0.9843137, 1, 0, 1,
-1.023549, -0.4359908, -0.1391155, 0.9803922, 1, 0, 1,
-1.012667, -0.6517461, -0.6231315, 0.972549, 1, 0, 1,
-1.012021, 1.039162, 0.5482037, 0.9686275, 1, 0, 1,
-1.00302, 0.9684478, -1.854651, 0.9607843, 1, 0, 1,
-1.000793, 0.4821151, -2.669986, 0.9568627, 1, 0, 1,
-1.000219, 0.1572812, -1.47209, 0.9490196, 1, 0, 1,
-0.9969462, 0.7694901, -1.773182, 0.945098, 1, 0, 1,
-0.9936849, 0.06656592, -0.4433178, 0.9372549, 1, 0, 1,
-0.9903571, 0.5288683, -0.5797308, 0.9333333, 1, 0, 1,
-0.9895465, 0.7148408, -0.7764478, 0.9254902, 1, 0, 1,
-0.9680839, 0.04601693, -2.604779, 0.9215686, 1, 0, 1,
-0.9678645, -2.724812, -2.542032, 0.9137255, 1, 0, 1,
-0.9654627, -1.222795, -2.648952, 0.9098039, 1, 0, 1,
-0.9636385, -0.3599662, -2.195233, 0.9019608, 1, 0, 1,
-0.9602594, -0.3510957, 0.2414239, 0.8941177, 1, 0, 1,
-0.9540783, -0.1955784, -1.460219, 0.8901961, 1, 0, 1,
-0.9528014, 0.3779479, -1.253378, 0.8823529, 1, 0, 1,
-0.9527982, -0.9003171, -1.19427, 0.8784314, 1, 0, 1,
-0.9464109, 0.2558245, -1.426372, 0.8705882, 1, 0, 1,
-0.9409841, 0.8308876, 0.8507684, 0.8666667, 1, 0, 1,
-0.9359707, -1.284938, -3.324051, 0.8588235, 1, 0, 1,
-0.9347592, 0.5731223, 0.2270555, 0.854902, 1, 0, 1,
-0.9318804, 0.756848, -1.455068, 0.8470588, 1, 0, 1,
-0.928593, 1.252915, 0.01220383, 0.8431373, 1, 0, 1,
-0.9126515, 0.4330377, -1.419295, 0.8352941, 1, 0, 1,
-0.907012, 0.2932151, -1.96799, 0.8313726, 1, 0, 1,
-0.9029424, -0.4688087, -3.873134, 0.8235294, 1, 0, 1,
-0.9026219, -0.5819559, -2.839434, 0.8196079, 1, 0, 1,
-0.9020382, 0.05835095, -1.281702, 0.8117647, 1, 0, 1,
-0.8949939, 0.7936588, -0.7827059, 0.8078431, 1, 0, 1,
-0.8936332, 2.929801, 0.7261958, 0.8, 1, 0, 1,
-0.8901163, -1.096709, -2.800581, 0.7921569, 1, 0, 1,
-0.8853304, -0.7225026, -2.984624, 0.7882353, 1, 0, 1,
-0.8828686, 0.4500157, -0.8666111, 0.7803922, 1, 0, 1,
-0.878209, -0.09057776, -1.9006, 0.7764706, 1, 0, 1,
-0.8777618, -0.619638, -0.9682319, 0.7686275, 1, 0, 1,
-0.8728997, 0.02429391, -0.4275808, 0.7647059, 1, 0, 1,
-0.8690873, -0.6925296, -2.83383, 0.7568628, 1, 0, 1,
-0.8688286, -0.1322263, -2.023037, 0.7529412, 1, 0, 1,
-0.8664621, -0.9291173, -3.338382, 0.7450981, 1, 0, 1,
-0.8642515, -0.9779427, -2.216346, 0.7411765, 1, 0, 1,
-0.8631843, 0.2623091, -1.474475, 0.7333333, 1, 0, 1,
-0.8610924, -0.1223408, -2.367724, 0.7294118, 1, 0, 1,
-0.8610671, 0.5887849, 0.6099221, 0.7215686, 1, 0, 1,
-0.855678, 1.417272, -2.150299, 0.7176471, 1, 0, 1,
-0.8489735, 0.259922, -1.787834, 0.7098039, 1, 0, 1,
-0.8435381, 2.393681, 0.02784222, 0.7058824, 1, 0, 1,
-0.8420229, -0.3945347, -1.958522, 0.6980392, 1, 0, 1,
-0.8401008, -1.258527, -3.148812, 0.6901961, 1, 0, 1,
-0.8355525, -0.257354, -2.102423, 0.6862745, 1, 0, 1,
-0.8289368, 0.1081079, -0.9888985, 0.6784314, 1, 0, 1,
-0.8283619, 0.4304719, 0.04802982, 0.6745098, 1, 0, 1,
-0.8248709, -1.479106, -1.621059, 0.6666667, 1, 0, 1,
-0.822879, 0.1384362, -2.052569, 0.6627451, 1, 0, 1,
-0.8040422, 1.006759, 0.007495802, 0.654902, 1, 0, 1,
-0.7872037, 1.937424, -0.8658048, 0.6509804, 1, 0, 1,
-0.780576, -0.171693, -0.6182845, 0.6431373, 1, 0, 1,
-0.7761902, 1.298241, 0.8635736, 0.6392157, 1, 0, 1,
-0.7731718, -1.71122, -3.301721, 0.6313726, 1, 0, 1,
-0.769976, 1.759319, 0.2778152, 0.627451, 1, 0, 1,
-0.7693983, 0.2215742, -0.8211177, 0.6196079, 1, 0, 1,
-0.7673864, -1.622699, -2.502993, 0.6156863, 1, 0, 1,
-0.7595128, 0.2448709, -2.958438, 0.6078432, 1, 0, 1,
-0.7575272, -3.026211, -3.809508, 0.6039216, 1, 0, 1,
-0.7559242, -0.8068381, -1.015368, 0.5960785, 1, 0, 1,
-0.7546997, 0.9618623, -0.5898613, 0.5882353, 1, 0, 1,
-0.7494535, -0.8446617, -2.176045, 0.5843138, 1, 0, 1,
-0.7346634, 0.4784507, -0.3437852, 0.5764706, 1, 0, 1,
-0.7326254, 0.3402612, -1.18319, 0.572549, 1, 0, 1,
-0.7323732, -0.5653387, -2.516775, 0.5647059, 1, 0, 1,
-0.7308813, 0.2109276, -0.5480808, 0.5607843, 1, 0, 1,
-0.728988, 0.1271726, -1.062599, 0.5529412, 1, 0, 1,
-0.7289104, 0.8076845, -0.2443465, 0.5490196, 1, 0, 1,
-0.7285979, 0.937668, -1.311247, 0.5411765, 1, 0, 1,
-0.7274662, -0.328379, -2.102089, 0.5372549, 1, 0, 1,
-0.727213, 0.7746089, -1.858931, 0.5294118, 1, 0, 1,
-0.727145, -1.672894, -3.986693, 0.5254902, 1, 0, 1,
-0.7249302, 0.1843051, -1.171672, 0.5176471, 1, 0, 1,
-0.7234257, 1.622605, 0.5452747, 0.5137255, 1, 0, 1,
-0.7194617, -0.8068631, -2.541339, 0.5058824, 1, 0, 1,
-0.7136787, -1.435474, -2.532629, 0.5019608, 1, 0, 1,
-0.7098569, 0.3809246, -2.42022, 0.4941176, 1, 0, 1,
-0.7095577, 1.544369, 0.1224657, 0.4862745, 1, 0, 1,
-0.70066, -0.1388004, -3.531919, 0.4823529, 1, 0, 1,
-0.6982873, -0.6446651, -2.119568, 0.4745098, 1, 0, 1,
-0.6970551, 1.303541, 0.7426406, 0.4705882, 1, 0, 1,
-0.6965531, 0.9475132, -1.464788, 0.4627451, 1, 0, 1,
-0.6937628, -2.379282, -2.451641, 0.4588235, 1, 0, 1,
-0.6934404, -0.154247, -2.915639, 0.4509804, 1, 0, 1,
-0.6932155, 0.1311257, -1.855122, 0.4470588, 1, 0, 1,
-0.6877051, 0.2517399, 0.086529, 0.4392157, 1, 0, 1,
-0.6860444, -0.5244243, -2.676948, 0.4352941, 1, 0, 1,
-0.6838179, 0.01713192, -1.605599, 0.427451, 1, 0, 1,
-0.6812689, -0.7191302, -4.405059, 0.4235294, 1, 0, 1,
-0.6783382, 0.7022616, -2.446541, 0.4156863, 1, 0, 1,
-0.6764202, -0.7712517, -3.530373, 0.4117647, 1, 0, 1,
-0.6701258, -1.521663, -3.050194, 0.4039216, 1, 0, 1,
-0.669558, -0.6196862, -2.266489, 0.3960784, 1, 0, 1,
-0.6635429, -1.855482, -3.111646, 0.3921569, 1, 0, 1,
-0.6618686, 1.378906, -0.5078357, 0.3843137, 1, 0, 1,
-0.6593366, 1.163225, 0.01451162, 0.3803922, 1, 0, 1,
-0.6593301, -0.2789865, -0.9918705, 0.372549, 1, 0, 1,
-0.6519821, 1.395809, -0.7005228, 0.3686275, 1, 0, 1,
-0.6443022, -1.299239, -2.2438, 0.3607843, 1, 0, 1,
-0.635999, 0.5178153, -0.8818867, 0.3568628, 1, 0, 1,
-0.629612, -0.3187597, -0.3744414, 0.3490196, 1, 0, 1,
-0.6289782, -2.146612, -2.455079, 0.345098, 1, 0, 1,
-0.6276754, 1.59779, 0.1854554, 0.3372549, 1, 0, 1,
-0.6264006, 1.305732, -1.311972, 0.3333333, 1, 0, 1,
-0.6243344, 0.2261567, -0.5310215, 0.3254902, 1, 0, 1,
-0.6217802, 1.919978, -0.9613493, 0.3215686, 1, 0, 1,
-0.6164341, 0.747941, -1.049304, 0.3137255, 1, 0, 1,
-0.6140296, 0.9155555, -0.6514219, 0.3098039, 1, 0, 1,
-0.5902756, 0.2762612, -2.462128, 0.3019608, 1, 0, 1,
-0.5902012, -2.065524, -3.924029, 0.2941177, 1, 0, 1,
-0.5858738, -0.01486259, -0.9420157, 0.2901961, 1, 0, 1,
-0.5845894, 0.9728801, -0.8969051, 0.282353, 1, 0, 1,
-0.5840191, -0.1296551, -0.6843548, 0.2784314, 1, 0, 1,
-0.5764533, 1.367783, -0.9593584, 0.2705882, 1, 0, 1,
-0.5751302, -1.745523, -3.004879, 0.2666667, 1, 0, 1,
-0.5724003, -0.7984892, -2.297291, 0.2588235, 1, 0, 1,
-0.5637713, -1.365412, -3.648458, 0.254902, 1, 0, 1,
-0.5634864, 0.2803201, -0.8966853, 0.2470588, 1, 0, 1,
-0.5595197, -0.7116984, -1.697426, 0.2431373, 1, 0, 1,
-0.5552931, 0.8082579, -1.414506, 0.2352941, 1, 0, 1,
-0.5505726, -0.5114263, -3.054581, 0.2313726, 1, 0, 1,
-0.5420808, -0.01530071, -1.444819, 0.2235294, 1, 0, 1,
-0.5403732, 0.4863002, -0.5540114, 0.2196078, 1, 0, 1,
-0.5372679, -0.006808093, -0.02011589, 0.2117647, 1, 0, 1,
-0.53342, -1.843841, -2.692494, 0.2078431, 1, 0, 1,
-0.5252287, -0.4063759, -2.754587, 0.2, 1, 0, 1,
-0.5238557, -0.5369169, -1.921725, 0.1921569, 1, 0, 1,
-0.523375, -0.2697325, -2.496256, 0.1882353, 1, 0, 1,
-0.5210195, -1.049327, -2.198692, 0.1803922, 1, 0, 1,
-0.5185685, -0.3768713, -3.229998, 0.1764706, 1, 0, 1,
-0.5146499, 2.336355, -0.2419617, 0.1686275, 1, 0, 1,
-0.5145772, -1.433666, -3.008729, 0.1647059, 1, 0, 1,
-0.5130361, -0.2034267, -2.132627, 0.1568628, 1, 0, 1,
-0.5125284, -0.1600926, -2.045454, 0.1529412, 1, 0, 1,
-0.5105843, 0.7692291, -2.495842, 0.145098, 1, 0, 1,
-0.4964089, 0.1357534, -1.732425, 0.1411765, 1, 0, 1,
-0.4957926, -0.2937518, -0.4571785, 0.1333333, 1, 0, 1,
-0.4835042, 1.036278, -0.1758917, 0.1294118, 1, 0, 1,
-0.4788771, -0.05888735, -2.228211, 0.1215686, 1, 0, 1,
-0.4750211, 0.7656395, -1.359039, 0.1176471, 1, 0, 1,
-0.4621052, -0.06040966, -1.731388, 0.1098039, 1, 0, 1,
-0.4573296, 1.601373, -0.8927042, 0.1058824, 1, 0, 1,
-0.4567512, 0.5938026, 1.087221, 0.09803922, 1, 0, 1,
-0.4562393, -0.9193884, -1.695407, 0.09019608, 1, 0, 1,
-0.4562275, -0.6888195, -2.248697, 0.08627451, 1, 0, 1,
-0.455523, -0.321953, -4.298279, 0.07843138, 1, 0, 1,
-0.4554591, -0.1162554, -1.54509, 0.07450981, 1, 0, 1,
-0.4551265, 0.8094083, 0.7772348, 0.06666667, 1, 0, 1,
-0.4550425, -0.517116, -0.4201957, 0.0627451, 1, 0, 1,
-0.452471, 0.4525228, -1.120481, 0.05490196, 1, 0, 1,
-0.4523134, 1.618857, 0.936555, 0.05098039, 1, 0, 1,
-0.4507453, -0.02796119, -4.231115, 0.04313726, 1, 0, 1,
-0.4487282, 0.4030334, -2.114362, 0.03921569, 1, 0, 1,
-0.4443257, 0.09077932, -1.525737, 0.03137255, 1, 0, 1,
-0.4434873, 1.113984, -0.26929, 0.02745098, 1, 0, 1,
-0.4429452, -0.8598678, -2.354204, 0.01960784, 1, 0, 1,
-0.4415506, 1.031512, -0.4971852, 0.01568628, 1, 0, 1,
-0.4385883, 1.801988, -0.02368154, 0.007843138, 1, 0, 1,
-0.4315188, -0.00502729, -0.6765569, 0.003921569, 1, 0, 1,
-0.4310066, 0.5818592, -0.9675593, 0, 1, 0.003921569, 1,
-0.4279259, 1.868872, -1.352829, 0, 1, 0.01176471, 1,
-0.4276693, 1.284761, 0.6290374, 0, 1, 0.01568628, 1,
-0.4272085, 1.31999, 1.738908, 0, 1, 0.02352941, 1,
-0.4265549, -1.087528, -1.850631, 0, 1, 0.02745098, 1,
-0.4240737, 1.710826, 1.595703, 0, 1, 0.03529412, 1,
-0.4186284, 0.2684208, -1.049603, 0, 1, 0.03921569, 1,
-0.4112082, -1.01879, -2.265215, 0, 1, 0.04705882, 1,
-0.4067936, 0.9984275, 0.874596, 0, 1, 0.05098039, 1,
-0.4010086, 0.3714585, -1.111385, 0, 1, 0.05882353, 1,
-0.4003996, -0.9498911, -2.780245, 0, 1, 0.0627451, 1,
-0.4000115, -1.295051, -2.008202, 0, 1, 0.07058824, 1,
-0.398621, 0.1835723, -0.05617658, 0, 1, 0.07450981, 1,
-0.3982667, -1.078286, -3.591735, 0, 1, 0.08235294, 1,
-0.3871577, -2.33254, -3.298992, 0, 1, 0.08627451, 1,
-0.3865004, -0.7537682, -2.351852, 0, 1, 0.09411765, 1,
-0.3863146, 0.597964, -0.1664947, 0, 1, 0.1019608, 1,
-0.3815259, -0.8334591, -1.600842, 0, 1, 0.1058824, 1,
-0.3814646, 1.361117, -0.08192977, 0, 1, 0.1137255, 1,
-0.3739007, 0.04420483, -1.894237, 0, 1, 0.1176471, 1,
-0.3733244, 1.108864, -0.3796422, 0, 1, 0.1254902, 1,
-0.3721439, -0.08952571, -1.69399, 0, 1, 0.1294118, 1,
-0.3689444, 0.7187529, -0.4371351, 0, 1, 0.1372549, 1,
-0.3682956, -0.7303837, -1.650749, 0, 1, 0.1411765, 1,
-0.3680912, 1.104781, -1.179281, 0, 1, 0.1490196, 1,
-0.3645205, 2.498774, 0.04780337, 0, 1, 0.1529412, 1,
-0.3630555, 0.8852227, 0.1711897, 0, 1, 0.1607843, 1,
-0.3601751, 1.636505, -2.933345, 0, 1, 0.1647059, 1,
-0.3594152, -1.531716, -3.450574, 0, 1, 0.172549, 1,
-0.358474, -0.06825327, -2.06654, 0, 1, 0.1764706, 1,
-0.355409, -0.9493112, -4.152497, 0, 1, 0.1843137, 1,
-0.354537, -0.7793048, -1.460907, 0, 1, 0.1882353, 1,
-0.3542998, -0.4211679, -2.860425, 0, 1, 0.1960784, 1,
-0.3507029, -0.556968, -1.875519, 0, 1, 0.2039216, 1,
-0.3466112, 1.080235, -0.5939196, 0, 1, 0.2078431, 1,
-0.3453105, -1.049132, -2.722801, 0, 1, 0.2156863, 1,
-0.344545, 0.8219274, -2.582134, 0, 1, 0.2196078, 1,
-0.3440534, -2.461143, -2.947046, 0, 1, 0.227451, 1,
-0.3357542, 0.4948218, -0.5193034, 0, 1, 0.2313726, 1,
-0.3340242, 0.009817444, -1.261258, 0, 1, 0.2392157, 1,
-0.3334333, 0.6654516, -0.9709759, 0, 1, 0.2431373, 1,
-0.3333615, -0.0076639, -0.979111, 0, 1, 0.2509804, 1,
-0.3332501, -0.1167791, -1.977717, 0, 1, 0.254902, 1,
-0.3328638, -0.8472385, -3.469132, 0, 1, 0.2627451, 1,
-0.3327627, -1.366906, -2.834114, 0, 1, 0.2666667, 1,
-0.3310141, 0.7637331, 0.5562462, 0, 1, 0.2745098, 1,
-0.3280758, -0.5238627, -2.627374, 0, 1, 0.2784314, 1,
-0.3247793, -0.5176648, -1.417625, 0, 1, 0.2862745, 1,
-0.3240497, 2.124886, 0.2406066, 0, 1, 0.2901961, 1,
-0.3214543, 1.390644, -0.6099688, 0, 1, 0.2980392, 1,
-0.316914, -0.1811399, -0.5009496, 0, 1, 0.3058824, 1,
-0.3167067, -0.2125314, -2.012756, 0, 1, 0.3098039, 1,
-0.3116919, 0.6779202, -0.4770155, 0, 1, 0.3176471, 1,
-0.3105234, 0.2657355, 0.9035035, 0, 1, 0.3215686, 1,
-0.2988911, 2.64319, 0.5480757, 0, 1, 0.3294118, 1,
-0.2960771, 0.9996507, -0.1197058, 0, 1, 0.3333333, 1,
-0.2940838, 0.06336077, -3.258433, 0, 1, 0.3411765, 1,
-0.2932956, -0.01252325, -0.7455525, 0, 1, 0.345098, 1,
-0.2918504, -0.1501796, -2.756141, 0, 1, 0.3529412, 1,
-0.2859082, -0.8124881, -3.174448, 0, 1, 0.3568628, 1,
-0.2790848, 0.5906021, -0.2236531, 0, 1, 0.3647059, 1,
-0.2788445, -0.5687307, -1.348896, 0, 1, 0.3686275, 1,
-0.2737995, 0.4888827, 1.156957, 0, 1, 0.3764706, 1,
-0.2724646, -0.3247762, -2.867296, 0, 1, 0.3803922, 1,
-0.2721368, -0.01534484, -2.912521, 0, 1, 0.3882353, 1,
-0.2719539, 1.252693, -0.05939998, 0, 1, 0.3921569, 1,
-0.2684407, 1.517521, 1.046847, 0, 1, 0.4, 1,
-0.2673294, 0.5513963, -0.2728152, 0, 1, 0.4078431, 1,
-0.2655637, 0.3810763, -0.9340647, 0, 1, 0.4117647, 1,
-0.2629191, -0.8564012, -2.623955, 0, 1, 0.4196078, 1,
-0.2615127, -0.5339913, -1.654341, 0, 1, 0.4235294, 1,
-0.2588951, -0.6834871, -1.570306, 0, 1, 0.4313726, 1,
-0.25384, -0.5805678, -2.682753, 0, 1, 0.4352941, 1,
-0.2533301, 0.1645288, -1.467462, 0, 1, 0.4431373, 1,
-0.2530513, -0.4666694, -2.785564, 0, 1, 0.4470588, 1,
-0.2508374, 1.221197, 1.5301, 0, 1, 0.454902, 1,
-0.2497263, -0.28714, -2.859802, 0, 1, 0.4588235, 1,
-0.2470043, 1.050173, -0.8786885, 0, 1, 0.4666667, 1,
-0.2430296, -0.4720947, -2.674791, 0, 1, 0.4705882, 1,
-0.2403963, -1.514285, -1.732264, 0, 1, 0.4784314, 1,
-0.238783, -0.603429, -3.862193, 0, 1, 0.4823529, 1,
-0.2353966, -1.79904, -3.50989, 0, 1, 0.4901961, 1,
-0.2339525, -1.573999, -3.512099, 0, 1, 0.4941176, 1,
-0.229692, -0.1281509, -2.982507, 0, 1, 0.5019608, 1,
-0.2293439, 0.8081378, -1.612304, 0, 1, 0.509804, 1,
-0.2277866, -0.9069912, -3.914044, 0, 1, 0.5137255, 1,
-0.226643, 0.9162436, -1.094646, 0, 1, 0.5215687, 1,
-0.2261025, -0.695338, -3.150539, 0, 1, 0.5254902, 1,
-0.2251215, 1.341684, 1.363275, 0, 1, 0.5333334, 1,
-0.2238078, 0.4012074, 0.9477854, 0, 1, 0.5372549, 1,
-0.2233896, -0.9807851, -2.843846, 0, 1, 0.5450981, 1,
-0.2182316, -0.3324141, -2.369915, 0, 1, 0.5490196, 1,
-0.2172269, 0.4037665, -1.183618, 0, 1, 0.5568628, 1,
-0.2149902, -0.05441736, -2.762222, 0, 1, 0.5607843, 1,
-0.2078678, 1.151134, 0.6784897, 0, 1, 0.5686275, 1,
-0.2042642, 0.2914827, -2.844458, 0, 1, 0.572549, 1,
-0.2036372, 0.08564052, -1.141973, 0, 1, 0.5803922, 1,
-0.199774, 0.179262, 0.2886, 0, 1, 0.5843138, 1,
-0.1994276, 0.1213654, -2.190437, 0, 1, 0.5921569, 1,
-0.1975347, -0.0500447, 0.5957515, 0, 1, 0.5960785, 1,
-0.1961237, -0.6385667, -2.93987, 0, 1, 0.6039216, 1,
-0.1955021, 1.27275, -0.471772, 0, 1, 0.6117647, 1,
-0.1937611, -0.4232055, -2.293667, 0, 1, 0.6156863, 1,
-0.1850292, 0.4327231, -1.594246, 0, 1, 0.6235294, 1,
-0.1807127, -0.0869446, -1.757653, 0, 1, 0.627451, 1,
-0.1762183, 0.6933692, -0.7191764, 0, 1, 0.6352941, 1,
-0.1729769, -0.6647291, -4.268968, 0, 1, 0.6392157, 1,
-0.1714133, 1.18872, 0.3979074, 0, 1, 0.6470588, 1,
-0.1686567, -2.183203, -3.160054, 0, 1, 0.6509804, 1,
-0.1635917, 0.001432158, -2.483329, 0, 1, 0.6588235, 1,
-0.1548721, 1.093864, 1.266413, 0, 1, 0.6627451, 1,
-0.1494705, -0.5360203, -2.780741, 0, 1, 0.6705883, 1,
-0.1489915, -0.9309806, -2.545319, 0, 1, 0.6745098, 1,
-0.1470858, 0.7648618, -2.041711, 0, 1, 0.682353, 1,
-0.1428202, 0.6916779, 0.08878632, 0, 1, 0.6862745, 1,
-0.1408731, -0.4328565, -2.998358, 0, 1, 0.6941177, 1,
-0.1395217, 0.8305227, 0.8959399, 0, 1, 0.7019608, 1,
-0.1388976, -0.3103505, -2.445871, 0, 1, 0.7058824, 1,
-0.135834, 0.7052825, -1.09452, 0, 1, 0.7137255, 1,
-0.1340537, -0.3460632, -3.252866, 0, 1, 0.7176471, 1,
-0.1270793, -0.8087808, -2.230321, 0, 1, 0.7254902, 1,
-0.1243288, 1.626886, -0.8642181, 0, 1, 0.7294118, 1,
-0.1225782, -0.4194099, -2.084806, 0, 1, 0.7372549, 1,
-0.1204379, 0.4888662, 0.9005215, 0, 1, 0.7411765, 1,
-0.1158724, -0.03912365, -0.1312865, 0, 1, 0.7490196, 1,
-0.1120542, -0.7251456, -2.348094, 0, 1, 0.7529412, 1,
-0.1102119, 1.218847, 0.2910442, 0, 1, 0.7607843, 1,
-0.1027919, -0.09474492, -3.753667, 0, 1, 0.7647059, 1,
-0.1016622, 1.45817, 1.203244, 0, 1, 0.772549, 1,
-0.09993667, -0.2463322, -0.5712165, 0, 1, 0.7764706, 1,
-0.09732882, 0.05775434, 0.6871485, 0, 1, 0.7843137, 1,
-0.09299471, 0.1192479, -1.536378, 0, 1, 0.7882353, 1,
-0.08597041, -1.607444, -2.310987, 0, 1, 0.7960784, 1,
-0.08324696, -0.3916524, -2.455417, 0, 1, 0.8039216, 1,
-0.08124201, 0.08431966, -0.7236732, 0, 1, 0.8078431, 1,
-0.07669967, 0.1825544, -0.2506757, 0, 1, 0.8156863, 1,
-0.07562477, 0.2872878, 0.1174972, 0, 1, 0.8196079, 1,
-0.07509953, -0.238496, -3.146029, 0, 1, 0.827451, 1,
-0.07335059, -0.8727239, -2.951211, 0, 1, 0.8313726, 1,
-0.07219346, -1.767353, -3.089264, 0, 1, 0.8392157, 1,
-0.07146157, -0.00224259, -0.1128819, 0, 1, 0.8431373, 1,
-0.07076965, -0.3134786, -2.574037, 0, 1, 0.8509804, 1,
-0.06970315, 1.448542, -0.04398515, 0, 1, 0.854902, 1,
-0.06330394, -0.2644432, -2.610759, 0, 1, 0.8627451, 1,
-0.0626577, 0.661131, -2.511239, 0, 1, 0.8666667, 1,
-0.06131661, -0.534046, -4.353476, 0, 1, 0.8745098, 1,
-0.05668179, -0.7728893, -3.520554, 0, 1, 0.8784314, 1,
-0.0525602, -0.8916441, -4.959985, 0, 1, 0.8862745, 1,
-0.05109611, -0.1027305, -4.085147, 0, 1, 0.8901961, 1,
-0.04999312, 1.068549, -0.7811533, 0, 1, 0.8980392, 1,
-0.04812785, 1.583233, -1.231536, 0, 1, 0.9058824, 1,
-0.04781755, 0.2446073, -1.286748, 0, 1, 0.9098039, 1,
-0.04611868, 1.423091, 0.2104824, 0, 1, 0.9176471, 1,
-0.0401694, 0.9353259, -0.1327578, 0, 1, 0.9215686, 1,
-0.02667513, -2.235405, -3.401532, 0, 1, 0.9294118, 1,
-0.01920632, -1.427472, -2.245002, 0, 1, 0.9333333, 1,
-0.01641532, -0.4121058, -3.07941, 0, 1, 0.9411765, 1,
-0.01345724, -1.421607, -1.071308, 0, 1, 0.945098, 1,
-0.01136639, 0.6898296, 0.701561, 0, 1, 0.9529412, 1,
-0.007780529, 0.8631458, 0.5011494, 0, 1, 0.9568627, 1,
-0.003608936, 1.040465, 0.09694497, 0, 1, 0.9647059, 1,
-0.002845887, 1.283471, 0.4202555, 0, 1, 0.9686275, 1,
0.00125531, 1.348065, -0.3047389, 0, 1, 0.9764706, 1,
0.007314961, 1.364033, -0.8555797, 0, 1, 0.9803922, 1,
0.01143583, 1.124516, 0.3839759, 0, 1, 0.9882353, 1,
0.01308662, 0.6161851, 0.03039555, 0, 1, 0.9921569, 1,
0.01589315, 1.817267, 1.540532, 0, 1, 1, 1,
0.02085805, -0.8622014, 2.135386, 0, 0.9921569, 1, 1,
0.02485426, 1.019791, 1.978153, 0, 0.9882353, 1, 1,
0.02631898, -0.1611971, 3.385534, 0, 0.9803922, 1, 1,
0.0288978, -0.7500217, 2.930423, 0, 0.9764706, 1, 1,
0.03489411, -1.885917, 0.7113906, 0, 0.9686275, 1, 1,
0.03495294, 1.534757, 1.050666, 0, 0.9647059, 1, 1,
0.03590992, 1.080521, 0.4313422, 0, 0.9568627, 1, 1,
0.03722817, -0.4594264, 2.994186, 0, 0.9529412, 1, 1,
0.04271469, -0.8151218, 3.500291, 0, 0.945098, 1, 1,
0.0479728, 1.152032, -0.2761083, 0, 0.9411765, 1, 1,
0.05044859, 0.543332, -0.4319132, 0, 0.9333333, 1, 1,
0.05299329, 0.584161, -0.3990458, 0, 0.9294118, 1, 1,
0.05312333, -1.143222, 1.433693, 0, 0.9215686, 1, 1,
0.05452664, 1.76616, 0.5439203, 0, 0.9176471, 1, 1,
0.05812519, -0.2225923, 4.254084, 0, 0.9098039, 1, 1,
0.06094447, 0.06260625, 2.507123, 0, 0.9058824, 1, 1,
0.06494046, 1.160201, -0.02399918, 0, 0.8980392, 1, 1,
0.07406977, -1.700812, 2.979225, 0, 0.8901961, 1, 1,
0.07462738, -0.3991179, 3.68039, 0, 0.8862745, 1, 1,
0.07738069, 0.5876406, 0.02017967, 0, 0.8784314, 1, 1,
0.08451638, 1.446557, 0.3651654, 0, 0.8745098, 1, 1,
0.0852145, 1.229685, 0.2998083, 0, 0.8666667, 1, 1,
0.08568629, -0.9312251, 3.408281, 0, 0.8627451, 1, 1,
0.08785351, 0.1508631, 0.7018158, 0, 0.854902, 1, 1,
0.09078109, 0.3517616, 0.322454, 0, 0.8509804, 1, 1,
0.09393501, 0.8279427, 1.164048, 0, 0.8431373, 1, 1,
0.09707778, 0.1119689, 0.1773375, 0, 0.8392157, 1, 1,
0.0999654, 0.05934223, 1.882452, 0, 0.8313726, 1, 1,
0.1075184, 0.1902539, -0.7777018, 0, 0.827451, 1, 1,
0.1077876, 0.02503248, 2.368473, 0, 0.8196079, 1, 1,
0.1091295, 0.73089, -0.4332601, 0, 0.8156863, 1, 1,
0.1129828, 0.916694, 2.088852, 0, 0.8078431, 1, 1,
0.1154587, -0.2912202, 2.201735, 0, 0.8039216, 1, 1,
0.1212486, -1.286413, 3.398258, 0, 0.7960784, 1, 1,
0.1227126, 0.1193874, 0.9638112, 0, 0.7882353, 1, 1,
0.1234179, 2.419456, -0.3363244, 0, 0.7843137, 1, 1,
0.125619, -0.08149998, 1.468715, 0, 0.7764706, 1, 1,
0.1319934, -0.7328483, 2.961356, 0, 0.772549, 1, 1,
0.1343105, 0.6567383, 0.9121241, 0, 0.7647059, 1, 1,
0.1365633, -1.138843, 2.391079, 0, 0.7607843, 1, 1,
0.1384309, -0.8235008, 3.767261, 0, 0.7529412, 1, 1,
0.1449606, -1.543187, 2.767113, 0, 0.7490196, 1, 1,
0.1453549, -0.5803674, 2.186346, 0, 0.7411765, 1, 1,
0.1468147, -0.0869226, 1.8155, 0, 0.7372549, 1, 1,
0.1486331, -0.4941985, 3.037971, 0, 0.7294118, 1, 1,
0.1501169, 0.4609986, -0.8743654, 0, 0.7254902, 1, 1,
0.1520459, -0.5938028, 1.251809, 0, 0.7176471, 1, 1,
0.1524549, -0.859389, 2.367647, 0, 0.7137255, 1, 1,
0.1546701, -0.3540379, 1.585273, 0, 0.7058824, 1, 1,
0.1551128, 0.5043366, 1.633429, 0, 0.6980392, 1, 1,
0.1555139, 0.2887425, 2.510623, 0, 0.6941177, 1, 1,
0.1612307, 0.1358007, 0.3697268, 0, 0.6862745, 1, 1,
0.1632094, 0.9962945, -0.4310765, 0, 0.682353, 1, 1,
0.166143, 0.4555068, -0.1478342, 0, 0.6745098, 1, 1,
0.1682833, 0.2862807, 0.2209581, 0, 0.6705883, 1, 1,
0.1755538, -0.9388835, 5.115201, 0, 0.6627451, 1, 1,
0.1762486, -0.4903674, -0.2707894, 0, 0.6588235, 1, 1,
0.1804748, 2.614937, 2.716369, 0, 0.6509804, 1, 1,
0.1818945, -0.2850755, 2.993225, 0, 0.6470588, 1, 1,
0.1844833, -0.3192332, 2.859359, 0, 0.6392157, 1, 1,
0.1874361, -1.28145, 2.408427, 0, 0.6352941, 1, 1,
0.1907073, -0.665273, 2.812492, 0, 0.627451, 1, 1,
0.1922093, 1.437053, 1.204827, 0, 0.6235294, 1, 1,
0.1956883, -0.3275193, 3.223449, 0, 0.6156863, 1, 1,
0.1976878, 0.4366345, -0.7825996, 0, 0.6117647, 1, 1,
0.1986772, 1.282945, 1.508031, 0, 0.6039216, 1, 1,
0.199374, 1.729387, 0.5616423, 0, 0.5960785, 1, 1,
0.1999261, 0.8050288, 0.1309111, 0, 0.5921569, 1, 1,
0.2017858, -0.3624847, 1.913367, 0, 0.5843138, 1, 1,
0.2061076, 0.2639612, 0.7442731, 0, 0.5803922, 1, 1,
0.2079613, 2.554438, 0.09348954, 0, 0.572549, 1, 1,
0.2101727, 0.7417774, -0.4103117, 0, 0.5686275, 1, 1,
0.2108889, -1.33749, 1.806535, 0, 0.5607843, 1, 1,
0.2132318, -0.4653712, 3.208549, 0, 0.5568628, 1, 1,
0.213351, 0.2396009, 1.528717, 0, 0.5490196, 1, 1,
0.2147061, 0.09866138, 4.211203, 0, 0.5450981, 1, 1,
0.2155363, -0.7890906, 3.253822, 0, 0.5372549, 1, 1,
0.215854, -1.084568, 2.141051, 0, 0.5333334, 1, 1,
0.216323, -1.050558, 3.698126, 0, 0.5254902, 1, 1,
0.2169607, -0.5736582, 1.20067, 0, 0.5215687, 1, 1,
0.2210695, 1.405637, 0.1106315, 0, 0.5137255, 1, 1,
0.2224538, 0.2496364, 0.9169211, 0, 0.509804, 1, 1,
0.2226562, -2.163671, 2.858652, 0, 0.5019608, 1, 1,
0.2259011, -1.080309, 0.6855465, 0, 0.4941176, 1, 1,
0.2265277, -0.3723764, 2.918386, 0, 0.4901961, 1, 1,
0.2337011, 0.6886938, -0.4612782, 0, 0.4823529, 1, 1,
0.2349744, -0.1897669, 2.42032, 0, 0.4784314, 1, 1,
0.2373631, 0.4638064, -1.044283, 0, 0.4705882, 1, 1,
0.2377585, 1.395637, -0.04813208, 0, 0.4666667, 1, 1,
0.2386224, 1.48054, 0.3207071, 0, 0.4588235, 1, 1,
0.2420704, -1.368784, 1.163979, 0, 0.454902, 1, 1,
0.2472856, -0.760562, 3.099963, 0, 0.4470588, 1, 1,
0.2494992, 0.03230091, 1.065026, 0, 0.4431373, 1, 1,
0.2502819, -1.495087, 3.237763, 0, 0.4352941, 1, 1,
0.2509652, 0.1262208, 2.451555, 0, 0.4313726, 1, 1,
0.2524731, -0.9638341, 3.058869, 0, 0.4235294, 1, 1,
0.2531919, -1.041943, 4.666379, 0, 0.4196078, 1, 1,
0.2568182, 0.214305, 0.9172943, 0, 0.4117647, 1, 1,
0.2578284, 0.3056462, 1.226238, 0, 0.4078431, 1, 1,
0.258218, -1.131516, 3.331641, 0, 0.4, 1, 1,
0.260212, -0.6004978, 2.7372, 0, 0.3921569, 1, 1,
0.2637208, 0.3643962, 1.530067, 0, 0.3882353, 1, 1,
0.2645168, 0.3598699, 0.467758, 0, 0.3803922, 1, 1,
0.265417, -0.8074548, 2.627672, 0, 0.3764706, 1, 1,
0.2655615, -1.856362, 1.549612, 0, 0.3686275, 1, 1,
0.2669308, -0.9023486, 0.5447128, 0, 0.3647059, 1, 1,
0.2707232, 0.4462183, 0.654092, 0, 0.3568628, 1, 1,
0.2722517, 0.6751037, 0.3321395, 0, 0.3529412, 1, 1,
0.2730552, 0.172427, 1.085756, 0, 0.345098, 1, 1,
0.2731599, 0.04946077, 0.01225885, 0, 0.3411765, 1, 1,
0.2741989, -0.01127118, 0.724488, 0, 0.3333333, 1, 1,
0.2854942, 1.768996, -1.464271, 0, 0.3294118, 1, 1,
0.2857702, -2.203646, 2.286189, 0, 0.3215686, 1, 1,
0.2924639, -0.1713672, 2.313282, 0, 0.3176471, 1, 1,
0.2948094, -0.160657, 2.737721, 0, 0.3098039, 1, 1,
0.2952733, 0.8692272, -0.6839782, 0, 0.3058824, 1, 1,
0.2992498, 0.9156758, -0.0205128, 0, 0.2980392, 1, 1,
0.2994153, -0.99265, 4.594992, 0, 0.2901961, 1, 1,
0.2997643, -1.012629, 3.858071, 0, 0.2862745, 1, 1,
0.3028441, 0.2895017, 1.398521, 0, 0.2784314, 1, 1,
0.3076377, -1.392941, 2.066852, 0, 0.2745098, 1, 1,
0.3094523, 1.032664, -0.9116402, 0, 0.2666667, 1, 1,
0.3157434, -0.7775564, 1.4872, 0, 0.2627451, 1, 1,
0.3233073, -0.6219537, 5.667458, 0, 0.254902, 1, 1,
0.3349201, -0.07606001, 1.680002, 0, 0.2509804, 1, 1,
0.3374897, -0.6964164, 2.257974, 0, 0.2431373, 1, 1,
0.3408977, -0.1217851, 1.443818, 0, 0.2392157, 1, 1,
0.3415529, -1.875218, 3.161141, 0, 0.2313726, 1, 1,
0.3421564, 0.5805135, 1.109144, 0, 0.227451, 1, 1,
0.3438865, -0.3168569, 1.511869, 0, 0.2196078, 1, 1,
0.3512123, -0.8232317, 1.155492, 0, 0.2156863, 1, 1,
0.3512184, -1.332869, 3.433363, 0, 0.2078431, 1, 1,
0.3555989, -0.9181799, 0.947369, 0, 0.2039216, 1, 1,
0.3575694, -0.8734354, 1.030948, 0, 0.1960784, 1, 1,
0.3601255, -1.291947, 3.017087, 0, 0.1882353, 1, 1,
0.3605954, -0.8309082, 3.517334, 0, 0.1843137, 1, 1,
0.3622165, -0.7471291, 2.464347, 0, 0.1764706, 1, 1,
0.3646964, -0.7847343, 2.252126, 0, 0.172549, 1, 1,
0.365021, -0.7026364, 0.9151924, 0, 0.1647059, 1, 1,
0.3721074, -0.1809552, 1.438819, 0, 0.1607843, 1, 1,
0.3727029, 0.2588838, 0.8661494, 0, 0.1529412, 1, 1,
0.37302, 1.128083, 0.4094211, 0, 0.1490196, 1, 1,
0.3758079, -0.1185665, 1.713149, 0, 0.1411765, 1, 1,
0.3818582, 0.2027256, 0.2848427, 0, 0.1372549, 1, 1,
0.3824647, 0.3040744, 0.6147813, 0, 0.1294118, 1, 1,
0.3867652, 0.5855678, 0.3229692, 0, 0.1254902, 1, 1,
0.3904414, 0.5525743, -0.2147651, 0, 0.1176471, 1, 1,
0.3910646, -0.8166543, 3.735716, 0, 0.1137255, 1, 1,
0.3916776, 1.343121, -0.7721606, 0, 0.1058824, 1, 1,
0.3953401, -1.296167, 3.517538, 0, 0.09803922, 1, 1,
0.398668, -1.179121, 5.154118, 0, 0.09411765, 1, 1,
0.4007599, 0.5401335, -1.862394, 0, 0.08627451, 1, 1,
0.4015874, -0.9022675, 0.9109657, 0, 0.08235294, 1, 1,
0.4021496, -0.318719, 0.4022028, 0, 0.07450981, 1, 1,
0.4025981, 0.8268372, 1.837154, 0, 0.07058824, 1, 1,
0.4054649, 0.1333568, -0.433769, 0, 0.0627451, 1, 1,
0.4062477, 1.903144, -0.5340015, 0, 0.05882353, 1, 1,
0.4135809, 0.04536341, 0.6079496, 0, 0.05098039, 1, 1,
0.4226709, 0.5519062, -2.578147, 0, 0.04705882, 1, 1,
0.4241144, 1.231675, -0.3893487, 0, 0.03921569, 1, 1,
0.4271338, -0.7182071, 1.02603, 0, 0.03529412, 1, 1,
0.4302151, -0.4505494, 2.869443, 0, 0.02745098, 1, 1,
0.4307362, 0.9571066, 1.246319, 0, 0.02352941, 1, 1,
0.433327, -1.129234, 2.101747, 0, 0.01568628, 1, 1,
0.4336255, -0.2361139, 1.28796, 0, 0.01176471, 1, 1,
0.4337163, 1.079329, 1.006359, 0, 0.003921569, 1, 1,
0.4340601, -0.1223796, 2.923995, 0.003921569, 0, 1, 1,
0.447445, 0.8002029, 0.4635677, 0.007843138, 0, 1, 1,
0.4534883, -0.402, 1.749351, 0.01568628, 0, 1, 1,
0.4545418, -0.1077064, 1.639561, 0.01960784, 0, 1, 1,
0.4579285, 0.9145685, -1.512061, 0.02745098, 0, 1, 1,
0.4614608, 1.500408, -0.8593104, 0.03137255, 0, 1, 1,
0.464822, -1.700035, 3.029171, 0.03921569, 0, 1, 1,
0.4665374, 2.168314, 1.308727, 0.04313726, 0, 1, 1,
0.4667465, -1.273459, 3.4541, 0.05098039, 0, 1, 1,
0.4677361, 0.1249405, 1.345331, 0.05490196, 0, 1, 1,
0.4719198, -0.9052286, 2.892482, 0.0627451, 0, 1, 1,
0.4731772, -1.061098, 1.270599, 0.06666667, 0, 1, 1,
0.4735843, -0.08899343, 1.867897, 0.07450981, 0, 1, 1,
0.4736513, -1.44778, 4.137823, 0.07843138, 0, 1, 1,
0.4773715, -1.071223, 2.065651, 0.08627451, 0, 1, 1,
0.478792, 0.469123, -0.03595341, 0.09019608, 0, 1, 1,
0.4791043, -1.430475, 3.33211, 0.09803922, 0, 1, 1,
0.4818605, 0.7020885, -0.4887686, 0.1058824, 0, 1, 1,
0.4842147, -0.2659208, 3.284246, 0.1098039, 0, 1, 1,
0.4860699, -0.001016367, 2.046663, 0.1176471, 0, 1, 1,
0.4861157, 0.4649294, 0.7873094, 0.1215686, 0, 1, 1,
0.4927973, -1.299159, 3.450634, 0.1294118, 0, 1, 1,
0.4950912, 1.339607, -0.4013286, 0.1333333, 0, 1, 1,
0.4982068, -0.9424595, 1.33752, 0.1411765, 0, 1, 1,
0.5037589, 0.501632, -0.3876587, 0.145098, 0, 1, 1,
0.5063621, -0.1686236, 1.448172, 0.1529412, 0, 1, 1,
0.5089227, -2.485866, 1.396574, 0.1568628, 0, 1, 1,
0.509023, -0.3932476, 0.8081681, 0.1647059, 0, 1, 1,
0.5127432, 1.330353, -0.07977372, 0.1686275, 0, 1, 1,
0.5148276, -1.052077, 2.620938, 0.1764706, 0, 1, 1,
0.5150568, 0.1710733, 1.147044, 0.1803922, 0, 1, 1,
0.5191463, -1.43984, 0.3697316, 0.1882353, 0, 1, 1,
0.5223537, 0.2470732, 1.378027, 0.1921569, 0, 1, 1,
0.5241617, -0.6224951, 2.319622, 0.2, 0, 1, 1,
0.5293565, -0.3757435, 2.677348, 0.2078431, 0, 1, 1,
0.536608, 0.8058032, 0.4432227, 0.2117647, 0, 1, 1,
0.5405363, -0.09233163, 0.6925419, 0.2196078, 0, 1, 1,
0.5409598, -0.08390066, 1.872947, 0.2235294, 0, 1, 1,
0.5413541, -1.565302, 1.243148, 0.2313726, 0, 1, 1,
0.5420961, -1.644756, 2.647011, 0.2352941, 0, 1, 1,
0.5425375, 0.4922816, 0.3851852, 0.2431373, 0, 1, 1,
0.5436574, 0.6719698, 0.04123855, 0.2470588, 0, 1, 1,
0.543753, -0.9891707, 3.847302, 0.254902, 0, 1, 1,
0.5448613, -0.8614851, 1.915551, 0.2588235, 0, 1, 1,
0.5520803, 0.1728541, 2.479512, 0.2666667, 0, 1, 1,
0.5532841, 0.1076185, 3.137876, 0.2705882, 0, 1, 1,
0.5568296, 0.1969772, 0.7844366, 0.2784314, 0, 1, 1,
0.5631384, -1.153419, 1.880023, 0.282353, 0, 1, 1,
0.5781123, 0.08465109, 0.7476448, 0.2901961, 0, 1, 1,
0.5821429, -0.5835825, 3.555011, 0.2941177, 0, 1, 1,
0.5859029, 0.2105606, 0.971275, 0.3019608, 0, 1, 1,
0.5921166, -0.6393297, 2.655212, 0.3098039, 0, 1, 1,
0.5993906, 0.1972993, 1.854812, 0.3137255, 0, 1, 1,
0.6022052, 2.026179, -0.5647605, 0.3215686, 0, 1, 1,
0.6052115, 0.6184903, 3.068683, 0.3254902, 0, 1, 1,
0.6053143, -0.2016592, 3.851895, 0.3333333, 0, 1, 1,
0.608024, -1.474896, 2.500252, 0.3372549, 0, 1, 1,
0.611412, -0.7259225, 2.219898, 0.345098, 0, 1, 1,
0.6123837, 0.7127244, 1.886605, 0.3490196, 0, 1, 1,
0.6143177, 1.269931, 1.592365, 0.3568628, 0, 1, 1,
0.6197572, -0.5092009, 1.463621, 0.3607843, 0, 1, 1,
0.6223962, -0.03866542, 1.589743, 0.3686275, 0, 1, 1,
0.6271317, -0.06323043, 0.2560276, 0.372549, 0, 1, 1,
0.6332974, -0.9089655, 1.568543, 0.3803922, 0, 1, 1,
0.6379451, -1.276449, 1.88789, 0.3843137, 0, 1, 1,
0.6400303, 0.4695022, 1.37908, 0.3921569, 0, 1, 1,
0.6402246, 0.3392848, 1.296819, 0.3960784, 0, 1, 1,
0.6419579, -0.7022282, 2.384342, 0.4039216, 0, 1, 1,
0.6471292, 1.394761, -0.5694393, 0.4117647, 0, 1, 1,
0.6480074, -1.691507, 3.8318, 0.4156863, 0, 1, 1,
0.6482275, -0.3201541, 0.7477841, 0.4235294, 0, 1, 1,
0.6485012, 0.04093916, 2.067266, 0.427451, 0, 1, 1,
0.650996, -0.02675475, 1.597994, 0.4352941, 0, 1, 1,
0.6519775, 0.9495263, -0.2090065, 0.4392157, 0, 1, 1,
0.6530566, 0.2006006, 1.721261, 0.4470588, 0, 1, 1,
0.6558993, -0.07905129, 0.2282576, 0.4509804, 0, 1, 1,
0.6608642, -0.5282423, 3.228997, 0.4588235, 0, 1, 1,
0.6644992, -0.7212536, 2.463519, 0.4627451, 0, 1, 1,
0.6662531, -1.211339, 2.542706, 0.4705882, 0, 1, 1,
0.669545, 0.4339105, 0.26671, 0.4745098, 0, 1, 1,
0.6695949, -1.191934, 3.428427, 0.4823529, 0, 1, 1,
0.6707059, 0.71097, 0.4483856, 0.4862745, 0, 1, 1,
0.6715955, -0.4417355, 2.581823, 0.4941176, 0, 1, 1,
0.672991, 1.021514, 0.8845829, 0.5019608, 0, 1, 1,
0.6741173, -0.4807241, 1.514442, 0.5058824, 0, 1, 1,
0.6768788, 3.032445, 0.4286371, 0.5137255, 0, 1, 1,
0.6787538, -0.001587515, 3.045344, 0.5176471, 0, 1, 1,
0.6846414, -0.460141, 2.623265, 0.5254902, 0, 1, 1,
0.6848972, -1.744196, 2.347962, 0.5294118, 0, 1, 1,
0.6854783, 1.757886, -0.4303574, 0.5372549, 0, 1, 1,
0.6928795, 0.84552, 0.3875532, 0.5411765, 0, 1, 1,
0.6935046, 0.3770958, 1.003915, 0.5490196, 0, 1, 1,
0.694836, -1.170545, 1.905735, 0.5529412, 0, 1, 1,
0.6975464, -0.7724169, 1.506414, 0.5607843, 0, 1, 1,
0.7021345, 0.879745, 1.59844, 0.5647059, 0, 1, 1,
0.7057382, 1.311055, 1.815603, 0.572549, 0, 1, 1,
0.7071549, -0.8043481, 2.205254, 0.5764706, 0, 1, 1,
0.7089095, -0.9195126, 1.063306, 0.5843138, 0, 1, 1,
0.7089881, 1.649345, -0.295048, 0.5882353, 0, 1, 1,
0.7111906, 0.3477095, 2.676242, 0.5960785, 0, 1, 1,
0.712203, 1.003046, 0.02418778, 0.6039216, 0, 1, 1,
0.715481, -0.5529253, 3.024911, 0.6078432, 0, 1, 1,
0.72193, -0.740479, 1.190263, 0.6156863, 0, 1, 1,
0.7292078, 2.306487, -0.06927864, 0.6196079, 0, 1, 1,
0.7326731, 0.9338669, 0.6464749, 0.627451, 0, 1, 1,
0.7347493, -0.5855549, 2.759958, 0.6313726, 0, 1, 1,
0.7434152, 0.4401321, 1.856169, 0.6392157, 0, 1, 1,
0.7444644, 0.868367, -0.2543484, 0.6431373, 0, 1, 1,
0.7450045, -0.4726127, 2.186604, 0.6509804, 0, 1, 1,
0.7466249, -0.4451282, 2.929169, 0.654902, 0, 1, 1,
0.7471517, -0.5019331, 3.251473, 0.6627451, 0, 1, 1,
0.753976, -1.857556, 3.029088, 0.6666667, 0, 1, 1,
0.7657879, 1.317786, -0.8411565, 0.6745098, 0, 1, 1,
0.7691467, 0.1645266, 3.083454, 0.6784314, 0, 1, 1,
0.775938, 1.252407, 0.2656866, 0.6862745, 0, 1, 1,
0.7761653, -0.5457062, 3.091172, 0.6901961, 0, 1, 1,
0.7766359, -1.464227, 0.4157401, 0.6980392, 0, 1, 1,
0.7784333, 1.16382, 0.5632694, 0.7058824, 0, 1, 1,
0.7835792, -1.564071, 2.634253, 0.7098039, 0, 1, 1,
0.7846593, 0.9869711, -0.2896418, 0.7176471, 0, 1, 1,
0.7886367, -0.5504839, 2.002894, 0.7215686, 0, 1, 1,
0.7894143, -0.7256093, 3.224032, 0.7294118, 0, 1, 1,
0.7916456, -0.2786487, 1.837254, 0.7333333, 0, 1, 1,
0.7959797, 0.268705, 1.521626, 0.7411765, 0, 1, 1,
0.8011476, -0.5757809, 1.790813, 0.7450981, 0, 1, 1,
0.8016081, -0.4793271, 1.530971, 0.7529412, 0, 1, 1,
0.8027648, -1.357741, 1.410037, 0.7568628, 0, 1, 1,
0.8038648, -0.33186, 2.520183, 0.7647059, 0, 1, 1,
0.8100439, -1.473801, 2.900487, 0.7686275, 0, 1, 1,
0.8136364, -0.2604071, 3.180378, 0.7764706, 0, 1, 1,
0.8169472, 1.706738, 0.5634465, 0.7803922, 0, 1, 1,
0.8204312, -0.08976958, 3.147588, 0.7882353, 0, 1, 1,
0.821858, 0.5145015, 1.869236, 0.7921569, 0, 1, 1,
0.8244541, 0.5649741, 1.234274, 0.8, 0, 1, 1,
0.8306087, -0.2921319, 1.951144, 0.8078431, 0, 1, 1,
0.8384267, -0.5348659, 2.666698, 0.8117647, 0, 1, 1,
0.8420954, -1.625812, 1.73432, 0.8196079, 0, 1, 1,
0.8463938, -0.4707952, 3.322356, 0.8235294, 0, 1, 1,
0.8504546, 0.4226607, 0.6128783, 0.8313726, 0, 1, 1,
0.8531967, 0.08507162, 1.747419, 0.8352941, 0, 1, 1,
0.8534718, -1.8749, 2.093546, 0.8431373, 0, 1, 1,
0.854847, 0.6870185, 1.016003, 0.8470588, 0, 1, 1,
0.8550914, -0.1944012, 2.585432, 0.854902, 0, 1, 1,
0.8562684, 0.7713728, 0.7605091, 0.8588235, 0, 1, 1,
0.8566152, 1.049893, 0.02664118, 0.8666667, 0, 1, 1,
0.8615016, 0.89305, -0.2015634, 0.8705882, 0, 1, 1,
0.8618265, 0.3204831, 1.50775, 0.8784314, 0, 1, 1,
0.8671747, -0.2500245, -0.5053805, 0.8823529, 0, 1, 1,
0.8721034, -0.1187178, 2.642187, 0.8901961, 0, 1, 1,
0.8737081, -0.5312036, 1.080285, 0.8941177, 0, 1, 1,
0.8779692, -1.028825, 1.024384, 0.9019608, 0, 1, 1,
0.8898507, 0.00525177, 3.009294, 0.9098039, 0, 1, 1,
0.8900392, -1.270097, 0.7095425, 0.9137255, 0, 1, 1,
0.8939831, 0.831955, 2.036547, 0.9215686, 0, 1, 1,
0.900142, 0.08547241, 2.758398, 0.9254902, 0, 1, 1,
0.902289, -0.09016078, 2.572677, 0.9333333, 0, 1, 1,
0.9103422, -1.440748, 2.102015, 0.9372549, 0, 1, 1,
0.9123755, 0.4074089, 1.817199, 0.945098, 0, 1, 1,
0.9142169, 1.713961, -0.3888859, 0.9490196, 0, 1, 1,
0.9158434, 0.7713376, 0.705719, 0.9568627, 0, 1, 1,
0.9170299, 1.203516, -0.5710956, 0.9607843, 0, 1, 1,
0.9180815, 0.7139613, -0.2301524, 0.9686275, 0, 1, 1,
0.9255382, -0.553779, 2.565314, 0.972549, 0, 1, 1,
0.9414548, -1.37121, 2.949792, 0.9803922, 0, 1, 1,
0.9520479, 1.318308, 1.422512, 0.9843137, 0, 1, 1,
0.9558382, 0.9888455, -0.3647634, 0.9921569, 0, 1, 1,
0.9575627, 1.345687, 2.132771, 0.9960784, 0, 1, 1,
0.9640713, -0.273698, 2.717057, 1, 0, 0.9960784, 1,
0.9669575, -1.275396, 3.598071, 1, 0, 0.9882353, 1,
0.9722347, 1.12509, -0.3171223, 1, 0, 0.9843137, 1,
0.9730448, -2.241194, 3.091881, 1, 0, 0.9764706, 1,
0.9750593, -0.5397072, 0.7687109, 1, 0, 0.972549, 1,
0.9753028, -0.2766, 2.086017, 1, 0, 0.9647059, 1,
0.9782627, -0.4010394, 1.818651, 1, 0, 0.9607843, 1,
0.9796624, 1.471857, 1.42816, 1, 0, 0.9529412, 1,
0.9803393, 0.5534326, 0.8859673, 1, 0, 0.9490196, 1,
0.9946561, 1.198296, 0.07374493, 1, 0, 0.9411765, 1,
0.9989235, 0.791014, 0.8587409, 1, 0, 0.9372549, 1,
1.006315, 0.9021206, -0.1523955, 1, 0, 0.9294118, 1,
1.00736, -0.1967265, 2.521111, 1, 0, 0.9254902, 1,
1.008639, 1.382323, 1.765761, 1, 0, 0.9176471, 1,
1.012018, -0.8160932, 0.2128787, 1, 0, 0.9137255, 1,
1.012569, -0.682155, 3.349957, 1, 0, 0.9058824, 1,
1.01599, 1.398813, -0.4670038, 1, 0, 0.9019608, 1,
1.016803, -1.50732, 3.310984, 1, 0, 0.8941177, 1,
1.01959, -0.8806467, 1.664353, 1, 0, 0.8862745, 1,
1.020447, -0.02974767, 0.649877, 1, 0, 0.8823529, 1,
1.026883, 0.8925397, 1.250252, 1, 0, 0.8745098, 1,
1.03471, 2.544206, 0.6697471, 1, 0, 0.8705882, 1,
1.037673, -0.1518467, 3.294378, 1, 0, 0.8627451, 1,
1.044812, -2.769118, 3.102074, 1, 0, 0.8588235, 1,
1.045006, 0.1799498, 0.3039861, 1, 0, 0.8509804, 1,
1.053358, 2.148544, -0.5892255, 1, 0, 0.8470588, 1,
1.064151, -0.1530379, 2.671852, 1, 0, 0.8392157, 1,
1.070054, -0.7220266, 1.637583, 1, 0, 0.8352941, 1,
1.07044, 0.5599345, 0.7484697, 1, 0, 0.827451, 1,
1.071426, 0.3196159, 0.01685343, 1, 0, 0.8235294, 1,
1.071431, 0.1871928, 0.8937678, 1, 0, 0.8156863, 1,
1.075375, 1.069577, 0.3102884, 1, 0, 0.8117647, 1,
1.075875, -0.05646661, 1.506956, 1, 0, 0.8039216, 1,
1.078612, 0.9709293, 0.9621325, 1, 0, 0.7960784, 1,
1.08345, 1.640929, 0.8247154, 1, 0, 0.7921569, 1,
1.083827, 0.7786954, 0.5146082, 1, 0, 0.7843137, 1,
1.084119, 0.3643912, 2.772939, 1, 0, 0.7803922, 1,
1.084994, 0.4230489, 1.914449, 1, 0, 0.772549, 1,
1.088416, 0.0106198, 0.6661063, 1, 0, 0.7686275, 1,
1.094594, -1.389122, 2.844032, 1, 0, 0.7607843, 1,
1.098816, -0.3512122, 1.484037, 1, 0, 0.7568628, 1,
1.099907, 0.4345216, 1.099997, 1, 0, 0.7490196, 1,
1.104429, -1.222467, 0.7172671, 1, 0, 0.7450981, 1,
1.107241, 0.008603636, 1.819606, 1, 0, 0.7372549, 1,
1.109918, -0.2821683, 2.686346, 1, 0, 0.7333333, 1,
1.130632, -0.4683683, 2.738683, 1, 0, 0.7254902, 1,
1.133432, -2.539256, 1.476796, 1, 0, 0.7215686, 1,
1.134848, -0.0365893, 2.526725, 1, 0, 0.7137255, 1,
1.140296, -0.1796988, 1.095222, 1, 0, 0.7098039, 1,
1.142836, 0.1799547, 2.437608, 1, 0, 0.7019608, 1,
1.147457, 1.87618, 2.336669, 1, 0, 0.6941177, 1,
1.154253, -0.1494886, 1.834208, 1, 0, 0.6901961, 1,
1.155795, -0.03522385, 0.6129663, 1, 0, 0.682353, 1,
1.156657, -0.208087, 0.7519166, 1, 0, 0.6784314, 1,
1.159247, -1.658746, 2.458, 1, 0, 0.6705883, 1,
1.164457, -0.07203527, 1.191689, 1, 0, 0.6666667, 1,
1.176219, -0.9317895, 1.922219, 1, 0, 0.6588235, 1,
1.176767, -0.2246464, 2.173326, 1, 0, 0.654902, 1,
1.177047, -0.4968008, 1.930579, 1, 0, 0.6470588, 1,
1.184063, 1.166669, 2.027622, 1, 0, 0.6431373, 1,
1.192074, -0.1941221, 1.645136, 1, 0, 0.6352941, 1,
1.194626, -0.3526975, 0.9484966, 1, 0, 0.6313726, 1,
1.203465, 0.2653146, 0.9598452, 1, 0, 0.6235294, 1,
1.205449, 0.4981572, 0.4201881, 1, 0, 0.6196079, 1,
1.206638, -0.3335143, 2.988909, 1, 0, 0.6117647, 1,
1.207204, 0.7914409, 0.7623192, 1, 0, 0.6078432, 1,
1.211247, 1.068261, 0.9426031, 1, 0, 0.6, 1,
1.213625, 1.290223, 0.9036078, 1, 0, 0.5921569, 1,
1.221763, -0.5436977, 1.699904, 1, 0, 0.5882353, 1,
1.222216, -0.5375749, 0.6071794, 1, 0, 0.5803922, 1,
1.227369, 2.04824, 0.6002069, 1, 0, 0.5764706, 1,
1.237637, -0.9461107, 3.793526, 1, 0, 0.5686275, 1,
1.242133, -0.3329458, 1.893121, 1, 0, 0.5647059, 1,
1.246781, 0.5045902, 3.635606, 1, 0, 0.5568628, 1,
1.253684, 1.628132, 1.453925, 1, 0, 0.5529412, 1,
1.255342, -0.7456767, 1.677875, 1, 0, 0.5450981, 1,
1.258852, -0.2717525, 1.312329, 1, 0, 0.5411765, 1,
1.269171, -0.5817683, 3.008885, 1, 0, 0.5333334, 1,
1.276208, 1.013743, -0.2082035, 1, 0, 0.5294118, 1,
1.278991, -0.6935382, 2.034866, 1, 0, 0.5215687, 1,
1.289996, -2.865537, 3.53301, 1, 0, 0.5176471, 1,
1.293362, -0.8797388, 2.346038, 1, 0, 0.509804, 1,
1.306041, -0.4595092, 0.9542171, 1, 0, 0.5058824, 1,
1.31241, -0.1843781, 2.325636, 1, 0, 0.4980392, 1,
1.315829, -1.959036, 4.473439, 1, 0, 0.4901961, 1,
1.31699, -0.4307375, 2.442816, 1, 0, 0.4862745, 1,
1.317044, 0.7527378, 0.9976898, 1, 0, 0.4784314, 1,
1.324677, -0.6953817, 2.830904, 1, 0, 0.4745098, 1,
1.332534, 0.4878818, 1.09229, 1, 0, 0.4666667, 1,
1.343589, -0.3583085, 0.5540148, 1, 0, 0.4627451, 1,
1.347936, 0.8616765, 0.5243037, 1, 0, 0.454902, 1,
1.369158, 0.1249322, 2.237824, 1, 0, 0.4509804, 1,
1.375451, 1.640278, 0.6475103, 1, 0, 0.4431373, 1,
1.402996, 0.4100541, 0.7839248, 1, 0, 0.4392157, 1,
1.411572, -0.3448284, 1.97626, 1, 0, 0.4313726, 1,
1.429887, 0.1535263, 1.322858, 1, 0, 0.427451, 1,
1.43799, 0.4930433, 1.329932, 1, 0, 0.4196078, 1,
1.439093, -0.9947611, 3.47215, 1, 0, 0.4156863, 1,
1.478601, -0.708299, 2.747955, 1, 0, 0.4078431, 1,
1.490985, -2.169641, 2.413393, 1, 0, 0.4039216, 1,
1.509717, 0.6936636, 1.419361, 1, 0, 0.3960784, 1,
1.512572, 1.115773, 1.98164, 1, 0, 0.3882353, 1,
1.513919, -0.1937152, 1.290401, 1, 0, 0.3843137, 1,
1.515724, -1.391267, 1.254507, 1, 0, 0.3764706, 1,
1.517055, 0.1037542, 4.218893, 1, 0, 0.372549, 1,
1.526545, 1.033576, 1.238472, 1, 0, 0.3647059, 1,
1.538859, -1.739585, 1.394136, 1, 0, 0.3607843, 1,
1.553727, 0.419888, 3.342346, 1, 0, 0.3529412, 1,
1.560227, -0.4867559, 0.5832961, 1, 0, 0.3490196, 1,
1.560856, 1.783792, 1.217481, 1, 0, 0.3411765, 1,
1.564261, 0.8372771, 0.1412046, 1, 0, 0.3372549, 1,
1.56565, -0.297847, 2.242631, 1, 0, 0.3294118, 1,
1.573234, 0.4884159, 1.136756, 1, 0, 0.3254902, 1,
1.579404, -0.2133756, 0.5681007, 1, 0, 0.3176471, 1,
1.591975, 0.4147923, 2.199693, 1, 0, 0.3137255, 1,
1.592205, -0.6918734, 1.607095, 1, 0, 0.3058824, 1,
1.601924, -0.04192808, 0.6993837, 1, 0, 0.2980392, 1,
1.603499, -0.3340294, 2.122155, 1, 0, 0.2941177, 1,
1.611164, 0.4064495, 2.241528, 1, 0, 0.2862745, 1,
1.617842, 0.8525658, 1.957484, 1, 0, 0.282353, 1,
1.64885, -0.6562772, 2.008769, 1, 0, 0.2745098, 1,
1.65251, -0.9689028, 1.041028, 1, 0, 0.2705882, 1,
1.659781, 1.316134, 1.592752, 1, 0, 0.2627451, 1,
1.671145, -0.7623295, 0.2968425, 1, 0, 0.2588235, 1,
1.672483, -0.8782424, 1.431932, 1, 0, 0.2509804, 1,
1.673903, -1.389616, 1.989655, 1, 0, 0.2470588, 1,
1.675966, -1.025438, 1.825812, 1, 0, 0.2392157, 1,
1.67782, -0.5003811, -0.9195493, 1, 0, 0.2352941, 1,
1.700225, -0.6896149, 2.012882, 1, 0, 0.227451, 1,
1.701021, 0.5961699, 0.5642184, 1, 0, 0.2235294, 1,
1.706179, 0.6117029, 0.9775176, 1, 0, 0.2156863, 1,
1.712161, -0.02129051, 2.822298, 1, 0, 0.2117647, 1,
1.72797, -0.9495974, 0.6101784, 1, 0, 0.2039216, 1,
1.740761, -1.183683, 2.488483, 1, 0, 0.1960784, 1,
1.742556, -0.04510864, 0.2678578, 1, 0, 0.1921569, 1,
1.804255, -0.149263, 0.324341, 1, 0, 0.1843137, 1,
1.827343, 2.026394, 1.73687, 1, 0, 0.1803922, 1,
1.833271, -2.590181, 4.839432, 1, 0, 0.172549, 1,
1.836044, -2.579616, 2.15905, 1, 0, 0.1686275, 1,
1.85038, -0.2845904, 0.7679758, 1, 0, 0.1607843, 1,
1.850924, -0.007265676, 3.346674, 1, 0, 0.1568628, 1,
1.852388, -0.4160654, 0.6677283, 1, 0, 0.1490196, 1,
1.874091, -0.7014354, 2.680226, 1, 0, 0.145098, 1,
1.87684, 1.874997, -0.1728737, 1, 0, 0.1372549, 1,
1.899993, -0.3800706, 0.01874638, 1, 0, 0.1333333, 1,
1.903157, 0.6585012, 2.313536, 1, 0, 0.1254902, 1,
1.923837, -0.3718501, 0.7594019, 1, 0, 0.1215686, 1,
1.964507, 1.679273, 1.18681, 1, 0, 0.1137255, 1,
1.999264, 1.703782, 1.044842, 1, 0, 0.1098039, 1,
2.054915, -0.9628608, 2.380976, 1, 0, 0.1019608, 1,
2.115375, 0.638463, 1.212385, 1, 0, 0.09411765, 1,
2.122416, -2.056968, 1.944467, 1, 0, 0.09019608, 1,
2.150314, -0.1845535, 0.5621478, 1, 0, 0.08235294, 1,
2.160469, 1.525784, 0.1309047, 1, 0, 0.07843138, 1,
2.164564, 0.2292774, 1.84058, 1, 0, 0.07058824, 1,
2.174278, 0.4162102, 0.2994595, 1, 0, 0.06666667, 1,
2.270925, 1.423576, 0.744836, 1, 0, 0.05882353, 1,
2.271891, -0.9368059, 0.8281398, 1, 0, 0.05490196, 1,
2.337023, -1.692647, 2.615336, 1, 0, 0.04705882, 1,
2.342655, -0.17142, 0.6912645, 1, 0, 0.04313726, 1,
2.36607, 1.043714, 2.004501, 1, 0, 0.03529412, 1,
2.411319, 1.296117, 1.408228, 1, 0, 0.03137255, 1,
2.411424, -0.9101467, 3.366641, 1, 0, 0.02352941, 1,
2.516715, -0.5611092, 2.926522, 1, 0, 0.01960784, 1,
2.550176, 0.9138887, 0.5294155, 1, 0, 0.01176471, 1,
2.551767, -1.079456, 2.549213, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.2082418, -4.053153, -7.265736, 0, -0.5, 0.5, 0.5,
-0.2082418, -4.053153, -7.265736, 1, -0.5, 0.5, 0.5,
-0.2082418, -4.053153, -7.265736, 1, 1.5, 0.5, 0.5,
-0.2082418, -4.053153, -7.265736, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.903893, 0.003117085, -7.265736, 0, -0.5, 0.5, 0.5,
-3.903893, 0.003117085, -7.265736, 1, -0.5, 0.5, 0.5,
-3.903893, 0.003117085, -7.265736, 1, 1.5, 0.5, 0.5,
-3.903893, 0.003117085, -7.265736, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.903893, -4.053153, 0.1380887, 0, -0.5, 0.5, 0.5,
-3.903893, -4.053153, 0.1380887, 1, -0.5, 0.5, 0.5,
-3.903893, -4.053153, 0.1380887, 1, 1.5, 0.5, 0.5,
-3.903893, -4.053153, 0.1380887, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.11709, -5.557161,
2, -3.11709, -5.557161,
-2, -3.11709, -5.557161,
-2, -3.273101, -5.841924,
-1, -3.11709, -5.557161,
-1, -3.273101, -5.841924,
0, -3.11709, -5.557161,
0, -3.273101, -5.841924,
1, -3.11709, -5.557161,
1, -3.273101, -5.841924,
2, -3.11709, -5.557161,
2, -3.273101, -5.841924
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.585121, -6.411449, 0, -0.5, 0.5, 0.5,
-2, -3.585121, -6.411449, 1, -0.5, 0.5, 0.5,
-2, -3.585121, -6.411449, 1, 1.5, 0.5, 0.5,
-2, -3.585121, -6.411449, 0, 1.5, 0.5, 0.5,
-1, -3.585121, -6.411449, 0, -0.5, 0.5, 0.5,
-1, -3.585121, -6.411449, 1, -0.5, 0.5, 0.5,
-1, -3.585121, -6.411449, 1, 1.5, 0.5, 0.5,
-1, -3.585121, -6.411449, 0, 1.5, 0.5, 0.5,
0, -3.585121, -6.411449, 0, -0.5, 0.5, 0.5,
0, -3.585121, -6.411449, 1, -0.5, 0.5, 0.5,
0, -3.585121, -6.411449, 1, 1.5, 0.5, 0.5,
0, -3.585121, -6.411449, 0, 1.5, 0.5, 0.5,
1, -3.585121, -6.411449, 0, -0.5, 0.5, 0.5,
1, -3.585121, -6.411449, 1, -0.5, 0.5, 0.5,
1, -3.585121, -6.411449, 1, 1.5, 0.5, 0.5,
1, -3.585121, -6.411449, 0, 1.5, 0.5, 0.5,
2, -3.585121, -6.411449, 0, -0.5, 0.5, 0.5,
2, -3.585121, -6.411449, 1, -0.5, 0.5, 0.5,
2, -3.585121, -6.411449, 1, 1.5, 0.5, 0.5,
2, -3.585121, -6.411449, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.051051, -3, -5.557161,
-3.051051, 3, -5.557161,
-3.051051, -3, -5.557161,
-3.193191, -3, -5.841924,
-3.051051, -2, -5.557161,
-3.193191, -2, -5.841924,
-3.051051, -1, -5.557161,
-3.193191, -1, -5.841924,
-3.051051, 0, -5.557161,
-3.193191, 0, -5.841924,
-3.051051, 1, -5.557161,
-3.193191, 1, -5.841924,
-3.051051, 2, -5.557161,
-3.193191, 2, -5.841924,
-3.051051, 3, -5.557161,
-3.193191, 3, -5.841924
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.477472, -3, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, -3, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, -3, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, -3, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, -2, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, -2, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, -2, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, -2, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, -1, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, -1, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, -1, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, -1, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, 0, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, 0, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, 0, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, 0, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, 1, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, 1, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, 1, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, 1, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, 2, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, 2, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, 2, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, 2, -6.411449, 0, 1.5, 0.5, 0.5,
-3.477472, 3, -6.411449, 0, -0.5, 0.5, 0.5,
-3.477472, 3, -6.411449, 1, -0.5, 0.5, 0.5,
-3.477472, 3, -6.411449, 1, 1.5, 0.5, 0.5,
-3.477472, 3, -6.411449, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.051051, -3.11709, -4,
-3.051051, -3.11709, 4,
-3.051051, -3.11709, -4,
-3.193191, -3.273101, -4,
-3.051051, -3.11709, -2,
-3.193191, -3.273101, -2,
-3.051051, -3.11709, 0,
-3.193191, -3.273101, 0,
-3.051051, -3.11709, 2,
-3.193191, -3.273101, 2,
-3.051051, -3.11709, 4,
-3.193191, -3.273101, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.477472, -3.585121, -4, 0, -0.5, 0.5, 0.5,
-3.477472, -3.585121, -4, 1, -0.5, 0.5, 0.5,
-3.477472, -3.585121, -4, 1, 1.5, 0.5, 0.5,
-3.477472, -3.585121, -4, 0, 1.5, 0.5, 0.5,
-3.477472, -3.585121, -2, 0, -0.5, 0.5, 0.5,
-3.477472, -3.585121, -2, 1, -0.5, 0.5, 0.5,
-3.477472, -3.585121, -2, 1, 1.5, 0.5, 0.5,
-3.477472, -3.585121, -2, 0, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 0, 0, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 0, 1, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 0, 1, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 0, 0, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 2, 0, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 2, 1, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 2, 1, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 2, 0, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 4, 0, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 4, 1, -0.5, 0.5, 0.5,
-3.477472, -3.585121, 4, 1, 1.5, 0.5, 0.5,
-3.477472, -3.585121, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.051051, -3.11709, -5.557161,
-3.051051, 3.123325, -5.557161,
-3.051051, -3.11709, 5.833339,
-3.051051, 3.123325, 5.833339,
-3.051051, -3.11709, -5.557161,
-3.051051, -3.11709, 5.833339,
-3.051051, 3.123325, -5.557161,
-3.051051, 3.123325, 5.833339,
-3.051051, -3.11709, -5.557161,
2.634567, -3.11709, -5.557161,
-3.051051, -3.11709, 5.833339,
2.634567, -3.11709, 5.833339,
-3.051051, 3.123325, -5.557161,
2.634567, 3.123325, -5.557161,
-3.051051, 3.123325, 5.833339,
2.634567, 3.123325, 5.833339,
2.634567, -3.11709, -5.557161,
2.634567, 3.123325, -5.557161,
2.634567, -3.11709, 5.833339,
2.634567, 3.123325, 5.833339,
2.634567, -3.11709, -5.557161,
2.634567, -3.11709, 5.833339,
2.634567, 3.123325, -5.557161,
2.634567, 3.123325, 5.833339
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.570717;
var distance = 33.68298;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2082418, -0.003117085, -0.1380887 );
mvMatrix.scale( 1.439704, 1.311709, 0.7186346 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.68298);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
sec-butylamine_2-chl<-read.table("sec-butylamine_2-chl.xyz", skip=1)
```

```
## Error in read.table("sec-butylamine_2-chl.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-sec-butylamine_2-chl$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-chl$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-chl$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.968251, -0.525166, -2.024323, 0, 0, 1, 1, 1,
-2.857914, -0.3539546, -1.609722, 1, 0, 0, 1, 1,
-2.646551, 0.4831843, -3.091429, 1, 0, 0, 1, 1,
-2.557139, 1.300228, -1.454734, 1, 0, 0, 1, 1,
-2.367864, 0.5065445, -0.5712026, 1, 0, 0, 1, 1,
-2.357092, 1.809201, -0.2033976, 1, 0, 0, 1, 1,
-2.334957, -0.7474725, -1.584304, 0, 0, 0, 1, 1,
-2.330188, -0.3786561, -0.1979107, 0, 0, 0, 1, 1,
-2.23666, 0.103138, 0.3261755, 0, 0, 0, 1, 1,
-2.224236, 0.9748569, 0.5011637, 0, 0, 0, 1, 1,
-2.197907, 0.5292045, -2.753977, 0, 0, 0, 1, 1,
-2.188438, -0.344517, -1.003513, 0, 0, 0, 1, 1,
-2.136858, 0.3260461, -0.3870818, 0, 0, 0, 1, 1,
-2.100038, -0.5535012, -3.664165, 1, 1, 1, 1, 1,
-2.075752, -1.045499, -0.2826919, 1, 1, 1, 1, 1,
-1.992898, 0.8182666, 0.04608842, 1, 1, 1, 1, 1,
-1.988483, -0.4944893, -3.777746, 1, 1, 1, 1, 1,
-1.958229, 0.9724473, -2.882918, 1, 1, 1, 1, 1,
-1.956955, -0.134972, -1.505526, 1, 1, 1, 1, 1,
-1.945413, 0.5196756, -1.72918, 1, 1, 1, 1, 1,
-1.907092, -0.1162115, -1.761974, 1, 1, 1, 1, 1,
-1.900022, -1.178239, -1.720944, 1, 1, 1, 1, 1,
-1.88924, 0.7791393, -0.9010444, 1, 1, 1, 1, 1,
-1.854963, 0.09314215, -0.8512655, 1, 1, 1, 1, 1,
-1.851167, -0.5031585, -1.852783, 1, 1, 1, 1, 1,
-1.802708, 0.1909332, -1.485107, 1, 1, 1, 1, 1,
-1.795321, -0.05137677, -1.216946, 1, 1, 1, 1, 1,
-1.795279, -0.4867586, -1.075071, 1, 1, 1, 1, 1,
-1.791459, 1.743794, -0.2267171, 0, 0, 1, 1, 1,
-1.765349, -0.3792755, -3.015753, 1, 0, 0, 1, 1,
-1.737749, -0.121204, -1.962723, 1, 0, 0, 1, 1,
-1.725584, -0.621933, -3.329817, 1, 0, 0, 1, 1,
-1.725119, -1.249462, -1.782455, 1, 0, 0, 1, 1,
-1.711734, -0.4805893, -3.455445, 1, 0, 0, 1, 1,
-1.710778, 0.315516, -1.746303, 0, 0, 0, 1, 1,
-1.70585, -0.07537013, -1.402609, 0, 0, 0, 1, 1,
-1.687305, -0.5740901, -3.010278, 0, 0, 0, 1, 1,
-1.680406, -1.208743, -2.390085, 0, 0, 0, 1, 1,
-1.67714, 1.267865, 0.3290528, 0, 0, 0, 1, 1,
-1.670849, 1.753595, 0.4692551, 0, 0, 0, 1, 1,
-1.647191, -0.5352207, -1.544843, 0, 0, 0, 1, 1,
-1.636452, -0.5880158, -1.482267, 1, 1, 1, 1, 1,
-1.635115, 0.05807334, -2.74922, 1, 1, 1, 1, 1,
-1.62997, -1.894781, -1.376181, 1, 1, 1, 1, 1,
-1.629349, -1.466636, -1.611587, 1, 1, 1, 1, 1,
-1.615215, -0.5530998, -3.030832, 1, 1, 1, 1, 1,
-1.612073, -0.6614603, -1.099862, 1, 1, 1, 1, 1,
-1.599525, -0.5002079, -1.953897, 1, 1, 1, 1, 1,
-1.597651, 0.9043592, -2.4995, 1, 1, 1, 1, 1,
-1.582538, 0.7514464, -0.9206727, 1, 1, 1, 1, 1,
-1.566792, 0.01367715, -2.502307, 1, 1, 1, 1, 1,
-1.562222, -0.5236207, -0.8528802, 1, 1, 1, 1, 1,
-1.558138, -1.163012, -3.031337, 1, 1, 1, 1, 1,
-1.548831, -0.5689431, -1.731309, 1, 1, 1, 1, 1,
-1.541157, 0.3033163, -1.545739, 1, 1, 1, 1, 1,
-1.538529, 0.4516596, -1.212462, 1, 1, 1, 1, 1,
-1.537864, -0.2839447, -3.059462, 0, 0, 1, 1, 1,
-1.534557, -1.777987, -0.5113118, 1, 0, 0, 1, 1,
-1.530097, 1.116451, -0.4499288, 1, 0, 0, 1, 1,
-1.526734, -0.04515341, -3.236562, 1, 0, 0, 1, 1,
-1.522511, 0.06597118, -1.325359, 1, 0, 0, 1, 1,
-1.51952, -1.005054, -1.637532, 1, 0, 0, 1, 1,
-1.51269, 0.4350303, -1.132615, 0, 0, 0, 1, 1,
-1.510486, -1.043423, -1.235186, 0, 0, 0, 1, 1,
-1.50575, 1.359307, -0.3421099, 0, 0, 0, 1, 1,
-1.504857, -0.03100889, -2.837094, 0, 0, 0, 1, 1,
-1.482475, -0.03382624, -2.175651, 0, 0, 0, 1, 1,
-1.478293, -1.976655, -1.43777, 0, 0, 0, 1, 1,
-1.471749, -0.3864342, -0.5645124, 0, 0, 0, 1, 1,
-1.465616, 0.5168591, 1.093409, 1, 1, 1, 1, 1,
-1.451168, -1.185167, -0.8494641, 1, 1, 1, 1, 1,
-1.446698, -0.0867536, -1.078741, 1, 1, 1, 1, 1,
-1.443431, -0.1772657, -2.113645, 1, 1, 1, 1, 1,
-1.438634, 0.6195462, -1.378739, 1, 1, 1, 1, 1,
-1.421549, -2.171175, -3.306431, 1, 1, 1, 1, 1,
-1.421127, 0.1254107, -2.481102, 1, 1, 1, 1, 1,
-1.409286, -1.533921, -3.075582, 1, 1, 1, 1, 1,
-1.408413, 1.284472, -1.317063, 1, 1, 1, 1, 1,
-1.404999, 0.2062768, 0.1721031, 1, 1, 1, 1, 1,
-1.398807, -0.4982505, -0.8440449, 1, 1, 1, 1, 1,
-1.397543, 1.200035, -2.005137, 1, 1, 1, 1, 1,
-1.389165, -0.2814789, -1.949465, 1, 1, 1, 1, 1,
-1.382434, -0.3644414, -0.005966593, 1, 1, 1, 1, 1,
-1.382188, 0.5846959, -1.822569, 1, 1, 1, 1, 1,
-1.374604, 0.7060618, -2.222222, 0, 0, 1, 1, 1,
-1.370745, -0.1266913, -1.838735, 1, 0, 0, 1, 1,
-1.367757, -1.110694, -2.015821, 1, 0, 0, 1, 1,
-1.350039, -0.3592176, -0.9116344, 1, 0, 0, 1, 1,
-1.349043, 1.086051, -1.111692, 1, 0, 0, 1, 1,
-1.33965, -0.496795, -3.263091, 1, 0, 0, 1, 1,
-1.326678, 1.756294, -1.273632, 0, 0, 0, 1, 1,
-1.323378, -0.8254017, -2.520208, 0, 0, 0, 1, 1,
-1.322777, 2.627276, -0.5447696, 0, 0, 0, 1, 1,
-1.313949, -0.8704042, -3.462365, 0, 0, 0, 1, 1,
-1.289416, -1.950996, -3.976565, 0, 0, 0, 1, 1,
-1.288693, -0.7203674, -3.916569, 0, 0, 0, 1, 1,
-1.287993, 1.422085, -0.9474529, 0, 0, 0, 1, 1,
-1.287787, -0.8535944, -3.201863, 1, 1, 1, 1, 1,
-1.279531, -1.219409, -1.389339, 1, 1, 1, 1, 1,
-1.279104, 0.158407, -1.632677, 1, 1, 1, 1, 1,
-1.276268, 0.234128, -1.574013, 1, 1, 1, 1, 1,
-1.274902, -0.6396999, -3.648271, 1, 1, 1, 1, 1,
-1.270888, -0.3000687, -1.923056, 1, 1, 1, 1, 1,
-1.270858, 0.1901746, -1.651521, 1, 1, 1, 1, 1,
-1.27081, -1.001615, -1.951437, 1, 1, 1, 1, 1,
-1.270335, -0.4819039, -1.048979, 1, 1, 1, 1, 1,
-1.268187, 1.451761, -1.311767, 1, 1, 1, 1, 1,
-1.263185, -1.125587, -1.51352, 1, 1, 1, 1, 1,
-1.259996, -0.1549649, -1.276083, 1, 1, 1, 1, 1,
-1.25628, 0.5824392, -0.6763484, 1, 1, 1, 1, 1,
-1.254924, -0.8752389, -2.191398, 1, 1, 1, 1, 1,
-1.25478, -1.606795, -4.098893, 1, 1, 1, 1, 1,
-1.247667, -1.525801, -2.713121, 0, 0, 1, 1, 1,
-1.238891, -0.7670841, -1.525248, 1, 0, 0, 1, 1,
-1.230582, -0.8257958, -0.782177, 1, 0, 0, 1, 1,
-1.227011, 0.7755429, -0.4687085, 1, 0, 0, 1, 1,
-1.221215, -1.741829, -2.114318, 1, 0, 0, 1, 1,
-1.212209, 1.091472, 0.4635036, 1, 0, 0, 1, 1,
-1.211249, -1.190787, -3.614874, 0, 0, 0, 1, 1,
-1.20509, -0.5805637, -1.882556, 0, 0, 0, 1, 1,
-1.203868, -0.4417788, -1.688558, 0, 0, 0, 1, 1,
-1.201292, 0.4588625, -0.7440985, 0, 0, 0, 1, 1,
-1.198092, -2.822021, -2.976782, 0, 0, 0, 1, 1,
-1.196216, 2.643818, 0.04428358, 0, 0, 0, 1, 1,
-1.191922, 0.1074336, -2.683665, 0, 0, 0, 1, 1,
-1.191659, -1.003604, -4.008636, 1, 1, 1, 1, 1,
-1.184691, 1.767002, -1.87459, 1, 1, 1, 1, 1,
-1.180662, -0.8997319, -2.134477, 1, 1, 1, 1, 1,
-1.171041, 0.6164297, -1.585393, 1, 1, 1, 1, 1,
-1.169018, -0.04489793, -1.062279, 1, 1, 1, 1, 1,
-1.165343, 0.9174852, 0.110709, 1, 1, 1, 1, 1,
-1.162942, 0.9470236, 0.8683817, 1, 1, 1, 1, 1,
-1.161999, -0.808594, -1.410554, 1, 1, 1, 1, 1,
-1.15669, -0.8073596, -2.844568, 1, 1, 1, 1, 1,
-1.152992, -0.6344742, -5.39128, 1, 1, 1, 1, 1,
-1.151442, 0.1457113, -1.377847, 1, 1, 1, 1, 1,
-1.134224, -0.488729, 0.04651184, 1, 1, 1, 1, 1,
-1.134008, 1.689343, -0.3898634, 1, 1, 1, 1, 1,
-1.13084, 1.357462, -0.7902412, 1, 1, 1, 1, 1,
-1.130041, 0.1399288, -1.283675, 1, 1, 1, 1, 1,
-1.129176, -0.02411653, -1.261065, 0, 0, 1, 1, 1,
-1.128101, -0.2263782, -2.700527, 1, 0, 0, 1, 1,
-1.126701, 1.477985, -0.1781461, 1, 0, 0, 1, 1,
-1.124554, 1.833406, 0.4308925, 1, 0, 0, 1, 1,
-1.120785, 0.6765542, 0.2821132, 1, 0, 0, 1, 1,
-1.119791, 0.5452368, -2.136764, 1, 0, 0, 1, 1,
-1.11934, 0.3667441, -1.161088, 0, 0, 0, 1, 1,
-1.11572, 1.992854, -0.4689889, 0, 0, 0, 1, 1,
-1.112772, 1.076563, 0.03308644, 0, 0, 0, 1, 1,
-1.111178, -0.4879886, -2.206388, 0, 0, 0, 1, 1,
-1.10572, -0.9254436, -2.93171, 0, 0, 0, 1, 1,
-1.101236, -0.1745266, -0.8632599, 0, 0, 0, 1, 1,
-1.095485, -0.9527829, -1.883283, 0, 0, 0, 1, 1,
-1.095035, 0.6620011, -0.8730423, 1, 1, 1, 1, 1,
-1.090394, 2.073231, -0.03566933, 1, 1, 1, 1, 1,
-1.086061, -1.818534, -2.554129, 1, 1, 1, 1, 1,
-1.084773, 1.242222, 0.001816726, 1, 1, 1, 1, 1,
-1.083298, 1.928721, -2.80777, 1, 1, 1, 1, 1,
-1.075557, 0.5298045, -1.45914, 1, 1, 1, 1, 1,
-1.066943, 0.5581247, -1.611547, 1, 1, 1, 1, 1,
-1.058641, -0.4464777, -1.906202, 1, 1, 1, 1, 1,
-1.054283, -0.2276628, -1.059703, 1, 1, 1, 1, 1,
-1.049044, -1.473747, -5.387128, 1, 1, 1, 1, 1,
-1.044303, -0.282716, -3.043443, 1, 1, 1, 1, 1,
-1.041078, 0.3141578, -2.504818, 1, 1, 1, 1, 1,
-1.040459, -1.093316, -1.003209, 1, 1, 1, 1, 1,
-1.040384, 0.9482679, -0.7515939, 1, 1, 1, 1, 1,
-1.039477, -0.5411447, -2.080927, 1, 1, 1, 1, 1,
-1.031169, -0.6489578, -2.998179, 0, 0, 1, 1, 1,
-1.030716, -0.1408798, -2.497124, 1, 0, 0, 1, 1,
-1.023549, -0.4359908, -0.1391155, 1, 0, 0, 1, 1,
-1.012667, -0.6517461, -0.6231315, 1, 0, 0, 1, 1,
-1.012021, 1.039162, 0.5482037, 1, 0, 0, 1, 1,
-1.00302, 0.9684478, -1.854651, 1, 0, 0, 1, 1,
-1.000793, 0.4821151, -2.669986, 0, 0, 0, 1, 1,
-1.000219, 0.1572812, -1.47209, 0, 0, 0, 1, 1,
-0.9969462, 0.7694901, -1.773182, 0, 0, 0, 1, 1,
-0.9936849, 0.06656592, -0.4433178, 0, 0, 0, 1, 1,
-0.9903571, 0.5288683, -0.5797308, 0, 0, 0, 1, 1,
-0.9895465, 0.7148408, -0.7764478, 0, 0, 0, 1, 1,
-0.9680839, 0.04601693, -2.604779, 0, 0, 0, 1, 1,
-0.9678645, -2.724812, -2.542032, 1, 1, 1, 1, 1,
-0.9654627, -1.222795, -2.648952, 1, 1, 1, 1, 1,
-0.9636385, -0.3599662, -2.195233, 1, 1, 1, 1, 1,
-0.9602594, -0.3510957, 0.2414239, 1, 1, 1, 1, 1,
-0.9540783, -0.1955784, -1.460219, 1, 1, 1, 1, 1,
-0.9528014, 0.3779479, -1.253378, 1, 1, 1, 1, 1,
-0.9527982, -0.9003171, -1.19427, 1, 1, 1, 1, 1,
-0.9464109, 0.2558245, -1.426372, 1, 1, 1, 1, 1,
-0.9409841, 0.8308876, 0.8507684, 1, 1, 1, 1, 1,
-0.9359707, -1.284938, -3.324051, 1, 1, 1, 1, 1,
-0.9347592, 0.5731223, 0.2270555, 1, 1, 1, 1, 1,
-0.9318804, 0.756848, -1.455068, 1, 1, 1, 1, 1,
-0.928593, 1.252915, 0.01220383, 1, 1, 1, 1, 1,
-0.9126515, 0.4330377, -1.419295, 1, 1, 1, 1, 1,
-0.907012, 0.2932151, -1.96799, 1, 1, 1, 1, 1,
-0.9029424, -0.4688087, -3.873134, 0, 0, 1, 1, 1,
-0.9026219, -0.5819559, -2.839434, 1, 0, 0, 1, 1,
-0.9020382, 0.05835095, -1.281702, 1, 0, 0, 1, 1,
-0.8949939, 0.7936588, -0.7827059, 1, 0, 0, 1, 1,
-0.8936332, 2.929801, 0.7261958, 1, 0, 0, 1, 1,
-0.8901163, -1.096709, -2.800581, 1, 0, 0, 1, 1,
-0.8853304, -0.7225026, -2.984624, 0, 0, 0, 1, 1,
-0.8828686, 0.4500157, -0.8666111, 0, 0, 0, 1, 1,
-0.878209, -0.09057776, -1.9006, 0, 0, 0, 1, 1,
-0.8777618, -0.619638, -0.9682319, 0, 0, 0, 1, 1,
-0.8728997, 0.02429391, -0.4275808, 0, 0, 0, 1, 1,
-0.8690873, -0.6925296, -2.83383, 0, 0, 0, 1, 1,
-0.8688286, -0.1322263, -2.023037, 0, 0, 0, 1, 1,
-0.8664621, -0.9291173, -3.338382, 1, 1, 1, 1, 1,
-0.8642515, -0.9779427, -2.216346, 1, 1, 1, 1, 1,
-0.8631843, 0.2623091, -1.474475, 1, 1, 1, 1, 1,
-0.8610924, -0.1223408, -2.367724, 1, 1, 1, 1, 1,
-0.8610671, 0.5887849, 0.6099221, 1, 1, 1, 1, 1,
-0.855678, 1.417272, -2.150299, 1, 1, 1, 1, 1,
-0.8489735, 0.259922, -1.787834, 1, 1, 1, 1, 1,
-0.8435381, 2.393681, 0.02784222, 1, 1, 1, 1, 1,
-0.8420229, -0.3945347, -1.958522, 1, 1, 1, 1, 1,
-0.8401008, -1.258527, -3.148812, 1, 1, 1, 1, 1,
-0.8355525, -0.257354, -2.102423, 1, 1, 1, 1, 1,
-0.8289368, 0.1081079, -0.9888985, 1, 1, 1, 1, 1,
-0.8283619, 0.4304719, 0.04802982, 1, 1, 1, 1, 1,
-0.8248709, -1.479106, -1.621059, 1, 1, 1, 1, 1,
-0.822879, 0.1384362, -2.052569, 1, 1, 1, 1, 1,
-0.8040422, 1.006759, 0.007495802, 0, 0, 1, 1, 1,
-0.7872037, 1.937424, -0.8658048, 1, 0, 0, 1, 1,
-0.780576, -0.171693, -0.6182845, 1, 0, 0, 1, 1,
-0.7761902, 1.298241, 0.8635736, 1, 0, 0, 1, 1,
-0.7731718, -1.71122, -3.301721, 1, 0, 0, 1, 1,
-0.769976, 1.759319, 0.2778152, 1, 0, 0, 1, 1,
-0.7693983, 0.2215742, -0.8211177, 0, 0, 0, 1, 1,
-0.7673864, -1.622699, -2.502993, 0, 0, 0, 1, 1,
-0.7595128, 0.2448709, -2.958438, 0, 0, 0, 1, 1,
-0.7575272, -3.026211, -3.809508, 0, 0, 0, 1, 1,
-0.7559242, -0.8068381, -1.015368, 0, 0, 0, 1, 1,
-0.7546997, 0.9618623, -0.5898613, 0, 0, 0, 1, 1,
-0.7494535, -0.8446617, -2.176045, 0, 0, 0, 1, 1,
-0.7346634, 0.4784507, -0.3437852, 1, 1, 1, 1, 1,
-0.7326254, 0.3402612, -1.18319, 1, 1, 1, 1, 1,
-0.7323732, -0.5653387, -2.516775, 1, 1, 1, 1, 1,
-0.7308813, 0.2109276, -0.5480808, 1, 1, 1, 1, 1,
-0.728988, 0.1271726, -1.062599, 1, 1, 1, 1, 1,
-0.7289104, 0.8076845, -0.2443465, 1, 1, 1, 1, 1,
-0.7285979, 0.937668, -1.311247, 1, 1, 1, 1, 1,
-0.7274662, -0.328379, -2.102089, 1, 1, 1, 1, 1,
-0.727213, 0.7746089, -1.858931, 1, 1, 1, 1, 1,
-0.727145, -1.672894, -3.986693, 1, 1, 1, 1, 1,
-0.7249302, 0.1843051, -1.171672, 1, 1, 1, 1, 1,
-0.7234257, 1.622605, 0.5452747, 1, 1, 1, 1, 1,
-0.7194617, -0.8068631, -2.541339, 1, 1, 1, 1, 1,
-0.7136787, -1.435474, -2.532629, 1, 1, 1, 1, 1,
-0.7098569, 0.3809246, -2.42022, 1, 1, 1, 1, 1,
-0.7095577, 1.544369, 0.1224657, 0, 0, 1, 1, 1,
-0.70066, -0.1388004, -3.531919, 1, 0, 0, 1, 1,
-0.6982873, -0.6446651, -2.119568, 1, 0, 0, 1, 1,
-0.6970551, 1.303541, 0.7426406, 1, 0, 0, 1, 1,
-0.6965531, 0.9475132, -1.464788, 1, 0, 0, 1, 1,
-0.6937628, -2.379282, -2.451641, 1, 0, 0, 1, 1,
-0.6934404, -0.154247, -2.915639, 0, 0, 0, 1, 1,
-0.6932155, 0.1311257, -1.855122, 0, 0, 0, 1, 1,
-0.6877051, 0.2517399, 0.086529, 0, 0, 0, 1, 1,
-0.6860444, -0.5244243, -2.676948, 0, 0, 0, 1, 1,
-0.6838179, 0.01713192, -1.605599, 0, 0, 0, 1, 1,
-0.6812689, -0.7191302, -4.405059, 0, 0, 0, 1, 1,
-0.6783382, 0.7022616, -2.446541, 0, 0, 0, 1, 1,
-0.6764202, -0.7712517, -3.530373, 1, 1, 1, 1, 1,
-0.6701258, -1.521663, -3.050194, 1, 1, 1, 1, 1,
-0.669558, -0.6196862, -2.266489, 1, 1, 1, 1, 1,
-0.6635429, -1.855482, -3.111646, 1, 1, 1, 1, 1,
-0.6618686, 1.378906, -0.5078357, 1, 1, 1, 1, 1,
-0.6593366, 1.163225, 0.01451162, 1, 1, 1, 1, 1,
-0.6593301, -0.2789865, -0.9918705, 1, 1, 1, 1, 1,
-0.6519821, 1.395809, -0.7005228, 1, 1, 1, 1, 1,
-0.6443022, -1.299239, -2.2438, 1, 1, 1, 1, 1,
-0.635999, 0.5178153, -0.8818867, 1, 1, 1, 1, 1,
-0.629612, -0.3187597, -0.3744414, 1, 1, 1, 1, 1,
-0.6289782, -2.146612, -2.455079, 1, 1, 1, 1, 1,
-0.6276754, 1.59779, 0.1854554, 1, 1, 1, 1, 1,
-0.6264006, 1.305732, -1.311972, 1, 1, 1, 1, 1,
-0.6243344, 0.2261567, -0.5310215, 1, 1, 1, 1, 1,
-0.6217802, 1.919978, -0.9613493, 0, 0, 1, 1, 1,
-0.6164341, 0.747941, -1.049304, 1, 0, 0, 1, 1,
-0.6140296, 0.9155555, -0.6514219, 1, 0, 0, 1, 1,
-0.5902756, 0.2762612, -2.462128, 1, 0, 0, 1, 1,
-0.5902012, -2.065524, -3.924029, 1, 0, 0, 1, 1,
-0.5858738, -0.01486259, -0.9420157, 1, 0, 0, 1, 1,
-0.5845894, 0.9728801, -0.8969051, 0, 0, 0, 1, 1,
-0.5840191, -0.1296551, -0.6843548, 0, 0, 0, 1, 1,
-0.5764533, 1.367783, -0.9593584, 0, 0, 0, 1, 1,
-0.5751302, -1.745523, -3.004879, 0, 0, 0, 1, 1,
-0.5724003, -0.7984892, -2.297291, 0, 0, 0, 1, 1,
-0.5637713, -1.365412, -3.648458, 0, 0, 0, 1, 1,
-0.5634864, 0.2803201, -0.8966853, 0, 0, 0, 1, 1,
-0.5595197, -0.7116984, -1.697426, 1, 1, 1, 1, 1,
-0.5552931, 0.8082579, -1.414506, 1, 1, 1, 1, 1,
-0.5505726, -0.5114263, -3.054581, 1, 1, 1, 1, 1,
-0.5420808, -0.01530071, -1.444819, 1, 1, 1, 1, 1,
-0.5403732, 0.4863002, -0.5540114, 1, 1, 1, 1, 1,
-0.5372679, -0.006808093, -0.02011589, 1, 1, 1, 1, 1,
-0.53342, -1.843841, -2.692494, 1, 1, 1, 1, 1,
-0.5252287, -0.4063759, -2.754587, 1, 1, 1, 1, 1,
-0.5238557, -0.5369169, -1.921725, 1, 1, 1, 1, 1,
-0.523375, -0.2697325, -2.496256, 1, 1, 1, 1, 1,
-0.5210195, -1.049327, -2.198692, 1, 1, 1, 1, 1,
-0.5185685, -0.3768713, -3.229998, 1, 1, 1, 1, 1,
-0.5146499, 2.336355, -0.2419617, 1, 1, 1, 1, 1,
-0.5145772, -1.433666, -3.008729, 1, 1, 1, 1, 1,
-0.5130361, -0.2034267, -2.132627, 1, 1, 1, 1, 1,
-0.5125284, -0.1600926, -2.045454, 0, 0, 1, 1, 1,
-0.5105843, 0.7692291, -2.495842, 1, 0, 0, 1, 1,
-0.4964089, 0.1357534, -1.732425, 1, 0, 0, 1, 1,
-0.4957926, -0.2937518, -0.4571785, 1, 0, 0, 1, 1,
-0.4835042, 1.036278, -0.1758917, 1, 0, 0, 1, 1,
-0.4788771, -0.05888735, -2.228211, 1, 0, 0, 1, 1,
-0.4750211, 0.7656395, -1.359039, 0, 0, 0, 1, 1,
-0.4621052, -0.06040966, -1.731388, 0, 0, 0, 1, 1,
-0.4573296, 1.601373, -0.8927042, 0, 0, 0, 1, 1,
-0.4567512, 0.5938026, 1.087221, 0, 0, 0, 1, 1,
-0.4562393, -0.9193884, -1.695407, 0, 0, 0, 1, 1,
-0.4562275, -0.6888195, -2.248697, 0, 0, 0, 1, 1,
-0.455523, -0.321953, -4.298279, 0, 0, 0, 1, 1,
-0.4554591, -0.1162554, -1.54509, 1, 1, 1, 1, 1,
-0.4551265, 0.8094083, 0.7772348, 1, 1, 1, 1, 1,
-0.4550425, -0.517116, -0.4201957, 1, 1, 1, 1, 1,
-0.452471, 0.4525228, -1.120481, 1, 1, 1, 1, 1,
-0.4523134, 1.618857, 0.936555, 1, 1, 1, 1, 1,
-0.4507453, -0.02796119, -4.231115, 1, 1, 1, 1, 1,
-0.4487282, 0.4030334, -2.114362, 1, 1, 1, 1, 1,
-0.4443257, 0.09077932, -1.525737, 1, 1, 1, 1, 1,
-0.4434873, 1.113984, -0.26929, 1, 1, 1, 1, 1,
-0.4429452, -0.8598678, -2.354204, 1, 1, 1, 1, 1,
-0.4415506, 1.031512, -0.4971852, 1, 1, 1, 1, 1,
-0.4385883, 1.801988, -0.02368154, 1, 1, 1, 1, 1,
-0.4315188, -0.00502729, -0.6765569, 1, 1, 1, 1, 1,
-0.4310066, 0.5818592, -0.9675593, 1, 1, 1, 1, 1,
-0.4279259, 1.868872, -1.352829, 1, 1, 1, 1, 1,
-0.4276693, 1.284761, 0.6290374, 0, 0, 1, 1, 1,
-0.4272085, 1.31999, 1.738908, 1, 0, 0, 1, 1,
-0.4265549, -1.087528, -1.850631, 1, 0, 0, 1, 1,
-0.4240737, 1.710826, 1.595703, 1, 0, 0, 1, 1,
-0.4186284, 0.2684208, -1.049603, 1, 0, 0, 1, 1,
-0.4112082, -1.01879, -2.265215, 1, 0, 0, 1, 1,
-0.4067936, 0.9984275, 0.874596, 0, 0, 0, 1, 1,
-0.4010086, 0.3714585, -1.111385, 0, 0, 0, 1, 1,
-0.4003996, -0.9498911, -2.780245, 0, 0, 0, 1, 1,
-0.4000115, -1.295051, -2.008202, 0, 0, 0, 1, 1,
-0.398621, 0.1835723, -0.05617658, 0, 0, 0, 1, 1,
-0.3982667, -1.078286, -3.591735, 0, 0, 0, 1, 1,
-0.3871577, -2.33254, -3.298992, 0, 0, 0, 1, 1,
-0.3865004, -0.7537682, -2.351852, 1, 1, 1, 1, 1,
-0.3863146, 0.597964, -0.1664947, 1, 1, 1, 1, 1,
-0.3815259, -0.8334591, -1.600842, 1, 1, 1, 1, 1,
-0.3814646, 1.361117, -0.08192977, 1, 1, 1, 1, 1,
-0.3739007, 0.04420483, -1.894237, 1, 1, 1, 1, 1,
-0.3733244, 1.108864, -0.3796422, 1, 1, 1, 1, 1,
-0.3721439, -0.08952571, -1.69399, 1, 1, 1, 1, 1,
-0.3689444, 0.7187529, -0.4371351, 1, 1, 1, 1, 1,
-0.3682956, -0.7303837, -1.650749, 1, 1, 1, 1, 1,
-0.3680912, 1.104781, -1.179281, 1, 1, 1, 1, 1,
-0.3645205, 2.498774, 0.04780337, 1, 1, 1, 1, 1,
-0.3630555, 0.8852227, 0.1711897, 1, 1, 1, 1, 1,
-0.3601751, 1.636505, -2.933345, 1, 1, 1, 1, 1,
-0.3594152, -1.531716, -3.450574, 1, 1, 1, 1, 1,
-0.358474, -0.06825327, -2.06654, 1, 1, 1, 1, 1,
-0.355409, -0.9493112, -4.152497, 0, 0, 1, 1, 1,
-0.354537, -0.7793048, -1.460907, 1, 0, 0, 1, 1,
-0.3542998, -0.4211679, -2.860425, 1, 0, 0, 1, 1,
-0.3507029, -0.556968, -1.875519, 1, 0, 0, 1, 1,
-0.3466112, 1.080235, -0.5939196, 1, 0, 0, 1, 1,
-0.3453105, -1.049132, -2.722801, 1, 0, 0, 1, 1,
-0.344545, 0.8219274, -2.582134, 0, 0, 0, 1, 1,
-0.3440534, -2.461143, -2.947046, 0, 0, 0, 1, 1,
-0.3357542, 0.4948218, -0.5193034, 0, 0, 0, 1, 1,
-0.3340242, 0.009817444, -1.261258, 0, 0, 0, 1, 1,
-0.3334333, 0.6654516, -0.9709759, 0, 0, 0, 1, 1,
-0.3333615, -0.0076639, -0.979111, 0, 0, 0, 1, 1,
-0.3332501, -0.1167791, -1.977717, 0, 0, 0, 1, 1,
-0.3328638, -0.8472385, -3.469132, 1, 1, 1, 1, 1,
-0.3327627, -1.366906, -2.834114, 1, 1, 1, 1, 1,
-0.3310141, 0.7637331, 0.5562462, 1, 1, 1, 1, 1,
-0.3280758, -0.5238627, -2.627374, 1, 1, 1, 1, 1,
-0.3247793, -0.5176648, -1.417625, 1, 1, 1, 1, 1,
-0.3240497, 2.124886, 0.2406066, 1, 1, 1, 1, 1,
-0.3214543, 1.390644, -0.6099688, 1, 1, 1, 1, 1,
-0.316914, -0.1811399, -0.5009496, 1, 1, 1, 1, 1,
-0.3167067, -0.2125314, -2.012756, 1, 1, 1, 1, 1,
-0.3116919, 0.6779202, -0.4770155, 1, 1, 1, 1, 1,
-0.3105234, 0.2657355, 0.9035035, 1, 1, 1, 1, 1,
-0.2988911, 2.64319, 0.5480757, 1, 1, 1, 1, 1,
-0.2960771, 0.9996507, -0.1197058, 1, 1, 1, 1, 1,
-0.2940838, 0.06336077, -3.258433, 1, 1, 1, 1, 1,
-0.2932956, -0.01252325, -0.7455525, 1, 1, 1, 1, 1,
-0.2918504, -0.1501796, -2.756141, 0, 0, 1, 1, 1,
-0.2859082, -0.8124881, -3.174448, 1, 0, 0, 1, 1,
-0.2790848, 0.5906021, -0.2236531, 1, 0, 0, 1, 1,
-0.2788445, -0.5687307, -1.348896, 1, 0, 0, 1, 1,
-0.2737995, 0.4888827, 1.156957, 1, 0, 0, 1, 1,
-0.2724646, -0.3247762, -2.867296, 1, 0, 0, 1, 1,
-0.2721368, -0.01534484, -2.912521, 0, 0, 0, 1, 1,
-0.2719539, 1.252693, -0.05939998, 0, 0, 0, 1, 1,
-0.2684407, 1.517521, 1.046847, 0, 0, 0, 1, 1,
-0.2673294, 0.5513963, -0.2728152, 0, 0, 0, 1, 1,
-0.2655637, 0.3810763, -0.9340647, 0, 0, 0, 1, 1,
-0.2629191, -0.8564012, -2.623955, 0, 0, 0, 1, 1,
-0.2615127, -0.5339913, -1.654341, 0, 0, 0, 1, 1,
-0.2588951, -0.6834871, -1.570306, 1, 1, 1, 1, 1,
-0.25384, -0.5805678, -2.682753, 1, 1, 1, 1, 1,
-0.2533301, 0.1645288, -1.467462, 1, 1, 1, 1, 1,
-0.2530513, -0.4666694, -2.785564, 1, 1, 1, 1, 1,
-0.2508374, 1.221197, 1.5301, 1, 1, 1, 1, 1,
-0.2497263, -0.28714, -2.859802, 1, 1, 1, 1, 1,
-0.2470043, 1.050173, -0.8786885, 1, 1, 1, 1, 1,
-0.2430296, -0.4720947, -2.674791, 1, 1, 1, 1, 1,
-0.2403963, -1.514285, -1.732264, 1, 1, 1, 1, 1,
-0.238783, -0.603429, -3.862193, 1, 1, 1, 1, 1,
-0.2353966, -1.79904, -3.50989, 1, 1, 1, 1, 1,
-0.2339525, -1.573999, -3.512099, 1, 1, 1, 1, 1,
-0.229692, -0.1281509, -2.982507, 1, 1, 1, 1, 1,
-0.2293439, 0.8081378, -1.612304, 1, 1, 1, 1, 1,
-0.2277866, -0.9069912, -3.914044, 1, 1, 1, 1, 1,
-0.226643, 0.9162436, -1.094646, 0, 0, 1, 1, 1,
-0.2261025, -0.695338, -3.150539, 1, 0, 0, 1, 1,
-0.2251215, 1.341684, 1.363275, 1, 0, 0, 1, 1,
-0.2238078, 0.4012074, 0.9477854, 1, 0, 0, 1, 1,
-0.2233896, -0.9807851, -2.843846, 1, 0, 0, 1, 1,
-0.2182316, -0.3324141, -2.369915, 1, 0, 0, 1, 1,
-0.2172269, 0.4037665, -1.183618, 0, 0, 0, 1, 1,
-0.2149902, -0.05441736, -2.762222, 0, 0, 0, 1, 1,
-0.2078678, 1.151134, 0.6784897, 0, 0, 0, 1, 1,
-0.2042642, 0.2914827, -2.844458, 0, 0, 0, 1, 1,
-0.2036372, 0.08564052, -1.141973, 0, 0, 0, 1, 1,
-0.199774, 0.179262, 0.2886, 0, 0, 0, 1, 1,
-0.1994276, 0.1213654, -2.190437, 0, 0, 0, 1, 1,
-0.1975347, -0.0500447, 0.5957515, 1, 1, 1, 1, 1,
-0.1961237, -0.6385667, -2.93987, 1, 1, 1, 1, 1,
-0.1955021, 1.27275, -0.471772, 1, 1, 1, 1, 1,
-0.1937611, -0.4232055, -2.293667, 1, 1, 1, 1, 1,
-0.1850292, 0.4327231, -1.594246, 1, 1, 1, 1, 1,
-0.1807127, -0.0869446, -1.757653, 1, 1, 1, 1, 1,
-0.1762183, 0.6933692, -0.7191764, 1, 1, 1, 1, 1,
-0.1729769, -0.6647291, -4.268968, 1, 1, 1, 1, 1,
-0.1714133, 1.18872, 0.3979074, 1, 1, 1, 1, 1,
-0.1686567, -2.183203, -3.160054, 1, 1, 1, 1, 1,
-0.1635917, 0.001432158, -2.483329, 1, 1, 1, 1, 1,
-0.1548721, 1.093864, 1.266413, 1, 1, 1, 1, 1,
-0.1494705, -0.5360203, -2.780741, 1, 1, 1, 1, 1,
-0.1489915, -0.9309806, -2.545319, 1, 1, 1, 1, 1,
-0.1470858, 0.7648618, -2.041711, 1, 1, 1, 1, 1,
-0.1428202, 0.6916779, 0.08878632, 0, 0, 1, 1, 1,
-0.1408731, -0.4328565, -2.998358, 1, 0, 0, 1, 1,
-0.1395217, 0.8305227, 0.8959399, 1, 0, 0, 1, 1,
-0.1388976, -0.3103505, -2.445871, 1, 0, 0, 1, 1,
-0.135834, 0.7052825, -1.09452, 1, 0, 0, 1, 1,
-0.1340537, -0.3460632, -3.252866, 1, 0, 0, 1, 1,
-0.1270793, -0.8087808, -2.230321, 0, 0, 0, 1, 1,
-0.1243288, 1.626886, -0.8642181, 0, 0, 0, 1, 1,
-0.1225782, -0.4194099, -2.084806, 0, 0, 0, 1, 1,
-0.1204379, 0.4888662, 0.9005215, 0, 0, 0, 1, 1,
-0.1158724, -0.03912365, -0.1312865, 0, 0, 0, 1, 1,
-0.1120542, -0.7251456, -2.348094, 0, 0, 0, 1, 1,
-0.1102119, 1.218847, 0.2910442, 0, 0, 0, 1, 1,
-0.1027919, -0.09474492, -3.753667, 1, 1, 1, 1, 1,
-0.1016622, 1.45817, 1.203244, 1, 1, 1, 1, 1,
-0.09993667, -0.2463322, -0.5712165, 1, 1, 1, 1, 1,
-0.09732882, 0.05775434, 0.6871485, 1, 1, 1, 1, 1,
-0.09299471, 0.1192479, -1.536378, 1, 1, 1, 1, 1,
-0.08597041, -1.607444, -2.310987, 1, 1, 1, 1, 1,
-0.08324696, -0.3916524, -2.455417, 1, 1, 1, 1, 1,
-0.08124201, 0.08431966, -0.7236732, 1, 1, 1, 1, 1,
-0.07669967, 0.1825544, -0.2506757, 1, 1, 1, 1, 1,
-0.07562477, 0.2872878, 0.1174972, 1, 1, 1, 1, 1,
-0.07509953, -0.238496, -3.146029, 1, 1, 1, 1, 1,
-0.07335059, -0.8727239, -2.951211, 1, 1, 1, 1, 1,
-0.07219346, -1.767353, -3.089264, 1, 1, 1, 1, 1,
-0.07146157, -0.00224259, -0.1128819, 1, 1, 1, 1, 1,
-0.07076965, -0.3134786, -2.574037, 1, 1, 1, 1, 1,
-0.06970315, 1.448542, -0.04398515, 0, 0, 1, 1, 1,
-0.06330394, -0.2644432, -2.610759, 1, 0, 0, 1, 1,
-0.0626577, 0.661131, -2.511239, 1, 0, 0, 1, 1,
-0.06131661, -0.534046, -4.353476, 1, 0, 0, 1, 1,
-0.05668179, -0.7728893, -3.520554, 1, 0, 0, 1, 1,
-0.0525602, -0.8916441, -4.959985, 1, 0, 0, 1, 1,
-0.05109611, -0.1027305, -4.085147, 0, 0, 0, 1, 1,
-0.04999312, 1.068549, -0.7811533, 0, 0, 0, 1, 1,
-0.04812785, 1.583233, -1.231536, 0, 0, 0, 1, 1,
-0.04781755, 0.2446073, -1.286748, 0, 0, 0, 1, 1,
-0.04611868, 1.423091, 0.2104824, 0, 0, 0, 1, 1,
-0.0401694, 0.9353259, -0.1327578, 0, 0, 0, 1, 1,
-0.02667513, -2.235405, -3.401532, 0, 0, 0, 1, 1,
-0.01920632, -1.427472, -2.245002, 1, 1, 1, 1, 1,
-0.01641532, -0.4121058, -3.07941, 1, 1, 1, 1, 1,
-0.01345724, -1.421607, -1.071308, 1, 1, 1, 1, 1,
-0.01136639, 0.6898296, 0.701561, 1, 1, 1, 1, 1,
-0.007780529, 0.8631458, 0.5011494, 1, 1, 1, 1, 1,
-0.003608936, 1.040465, 0.09694497, 1, 1, 1, 1, 1,
-0.002845887, 1.283471, 0.4202555, 1, 1, 1, 1, 1,
0.00125531, 1.348065, -0.3047389, 1, 1, 1, 1, 1,
0.007314961, 1.364033, -0.8555797, 1, 1, 1, 1, 1,
0.01143583, 1.124516, 0.3839759, 1, 1, 1, 1, 1,
0.01308662, 0.6161851, 0.03039555, 1, 1, 1, 1, 1,
0.01589315, 1.817267, 1.540532, 1, 1, 1, 1, 1,
0.02085805, -0.8622014, 2.135386, 1, 1, 1, 1, 1,
0.02485426, 1.019791, 1.978153, 1, 1, 1, 1, 1,
0.02631898, -0.1611971, 3.385534, 1, 1, 1, 1, 1,
0.0288978, -0.7500217, 2.930423, 0, 0, 1, 1, 1,
0.03489411, -1.885917, 0.7113906, 1, 0, 0, 1, 1,
0.03495294, 1.534757, 1.050666, 1, 0, 0, 1, 1,
0.03590992, 1.080521, 0.4313422, 1, 0, 0, 1, 1,
0.03722817, -0.4594264, 2.994186, 1, 0, 0, 1, 1,
0.04271469, -0.8151218, 3.500291, 1, 0, 0, 1, 1,
0.0479728, 1.152032, -0.2761083, 0, 0, 0, 1, 1,
0.05044859, 0.543332, -0.4319132, 0, 0, 0, 1, 1,
0.05299329, 0.584161, -0.3990458, 0, 0, 0, 1, 1,
0.05312333, -1.143222, 1.433693, 0, 0, 0, 1, 1,
0.05452664, 1.76616, 0.5439203, 0, 0, 0, 1, 1,
0.05812519, -0.2225923, 4.254084, 0, 0, 0, 1, 1,
0.06094447, 0.06260625, 2.507123, 0, 0, 0, 1, 1,
0.06494046, 1.160201, -0.02399918, 1, 1, 1, 1, 1,
0.07406977, -1.700812, 2.979225, 1, 1, 1, 1, 1,
0.07462738, -0.3991179, 3.68039, 1, 1, 1, 1, 1,
0.07738069, 0.5876406, 0.02017967, 1, 1, 1, 1, 1,
0.08451638, 1.446557, 0.3651654, 1, 1, 1, 1, 1,
0.0852145, 1.229685, 0.2998083, 1, 1, 1, 1, 1,
0.08568629, -0.9312251, 3.408281, 1, 1, 1, 1, 1,
0.08785351, 0.1508631, 0.7018158, 1, 1, 1, 1, 1,
0.09078109, 0.3517616, 0.322454, 1, 1, 1, 1, 1,
0.09393501, 0.8279427, 1.164048, 1, 1, 1, 1, 1,
0.09707778, 0.1119689, 0.1773375, 1, 1, 1, 1, 1,
0.0999654, 0.05934223, 1.882452, 1, 1, 1, 1, 1,
0.1075184, 0.1902539, -0.7777018, 1, 1, 1, 1, 1,
0.1077876, 0.02503248, 2.368473, 1, 1, 1, 1, 1,
0.1091295, 0.73089, -0.4332601, 1, 1, 1, 1, 1,
0.1129828, 0.916694, 2.088852, 0, 0, 1, 1, 1,
0.1154587, -0.2912202, 2.201735, 1, 0, 0, 1, 1,
0.1212486, -1.286413, 3.398258, 1, 0, 0, 1, 1,
0.1227126, 0.1193874, 0.9638112, 1, 0, 0, 1, 1,
0.1234179, 2.419456, -0.3363244, 1, 0, 0, 1, 1,
0.125619, -0.08149998, 1.468715, 1, 0, 0, 1, 1,
0.1319934, -0.7328483, 2.961356, 0, 0, 0, 1, 1,
0.1343105, 0.6567383, 0.9121241, 0, 0, 0, 1, 1,
0.1365633, -1.138843, 2.391079, 0, 0, 0, 1, 1,
0.1384309, -0.8235008, 3.767261, 0, 0, 0, 1, 1,
0.1449606, -1.543187, 2.767113, 0, 0, 0, 1, 1,
0.1453549, -0.5803674, 2.186346, 0, 0, 0, 1, 1,
0.1468147, -0.0869226, 1.8155, 0, 0, 0, 1, 1,
0.1486331, -0.4941985, 3.037971, 1, 1, 1, 1, 1,
0.1501169, 0.4609986, -0.8743654, 1, 1, 1, 1, 1,
0.1520459, -0.5938028, 1.251809, 1, 1, 1, 1, 1,
0.1524549, -0.859389, 2.367647, 1, 1, 1, 1, 1,
0.1546701, -0.3540379, 1.585273, 1, 1, 1, 1, 1,
0.1551128, 0.5043366, 1.633429, 1, 1, 1, 1, 1,
0.1555139, 0.2887425, 2.510623, 1, 1, 1, 1, 1,
0.1612307, 0.1358007, 0.3697268, 1, 1, 1, 1, 1,
0.1632094, 0.9962945, -0.4310765, 1, 1, 1, 1, 1,
0.166143, 0.4555068, -0.1478342, 1, 1, 1, 1, 1,
0.1682833, 0.2862807, 0.2209581, 1, 1, 1, 1, 1,
0.1755538, -0.9388835, 5.115201, 1, 1, 1, 1, 1,
0.1762486, -0.4903674, -0.2707894, 1, 1, 1, 1, 1,
0.1804748, 2.614937, 2.716369, 1, 1, 1, 1, 1,
0.1818945, -0.2850755, 2.993225, 1, 1, 1, 1, 1,
0.1844833, -0.3192332, 2.859359, 0, 0, 1, 1, 1,
0.1874361, -1.28145, 2.408427, 1, 0, 0, 1, 1,
0.1907073, -0.665273, 2.812492, 1, 0, 0, 1, 1,
0.1922093, 1.437053, 1.204827, 1, 0, 0, 1, 1,
0.1956883, -0.3275193, 3.223449, 1, 0, 0, 1, 1,
0.1976878, 0.4366345, -0.7825996, 1, 0, 0, 1, 1,
0.1986772, 1.282945, 1.508031, 0, 0, 0, 1, 1,
0.199374, 1.729387, 0.5616423, 0, 0, 0, 1, 1,
0.1999261, 0.8050288, 0.1309111, 0, 0, 0, 1, 1,
0.2017858, -0.3624847, 1.913367, 0, 0, 0, 1, 1,
0.2061076, 0.2639612, 0.7442731, 0, 0, 0, 1, 1,
0.2079613, 2.554438, 0.09348954, 0, 0, 0, 1, 1,
0.2101727, 0.7417774, -0.4103117, 0, 0, 0, 1, 1,
0.2108889, -1.33749, 1.806535, 1, 1, 1, 1, 1,
0.2132318, -0.4653712, 3.208549, 1, 1, 1, 1, 1,
0.213351, 0.2396009, 1.528717, 1, 1, 1, 1, 1,
0.2147061, 0.09866138, 4.211203, 1, 1, 1, 1, 1,
0.2155363, -0.7890906, 3.253822, 1, 1, 1, 1, 1,
0.215854, -1.084568, 2.141051, 1, 1, 1, 1, 1,
0.216323, -1.050558, 3.698126, 1, 1, 1, 1, 1,
0.2169607, -0.5736582, 1.20067, 1, 1, 1, 1, 1,
0.2210695, 1.405637, 0.1106315, 1, 1, 1, 1, 1,
0.2224538, 0.2496364, 0.9169211, 1, 1, 1, 1, 1,
0.2226562, -2.163671, 2.858652, 1, 1, 1, 1, 1,
0.2259011, -1.080309, 0.6855465, 1, 1, 1, 1, 1,
0.2265277, -0.3723764, 2.918386, 1, 1, 1, 1, 1,
0.2337011, 0.6886938, -0.4612782, 1, 1, 1, 1, 1,
0.2349744, -0.1897669, 2.42032, 1, 1, 1, 1, 1,
0.2373631, 0.4638064, -1.044283, 0, 0, 1, 1, 1,
0.2377585, 1.395637, -0.04813208, 1, 0, 0, 1, 1,
0.2386224, 1.48054, 0.3207071, 1, 0, 0, 1, 1,
0.2420704, -1.368784, 1.163979, 1, 0, 0, 1, 1,
0.2472856, -0.760562, 3.099963, 1, 0, 0, 1, 1,
0.2494992, 0.03230091, 1.065026, 1, 0, 0, 1, 1,
0.2502819, -1.495087, 3.237763, 0, 0, 0, 1, 1,
0.2509652, 0.1262208, 2.451555, 0, 0, 0, 1, 1,
0.2524731, -0.9638341, 3.058869, 0, 0, 0, 1, 1,
0.2531919, -1.041943, 4.666379, 0, 0, 0, 1, 1,
0.2568182, 0.214305, 0.9172943, 0, 0, 0, 1, 1,
0.2578284, 0.3056462, 1.226238, 0, 0, 0, 1, 1,
0.258218, -1.131516, 3.331641, 0, 0, 0, 1, 1,
0.260212, -0.6004978, 2.7372, 1, 1, 1, 1, 1,
0.2637208, 0.3643962, 1.530067, 1, 1, 1, 1, 1,
0.2645168, 0.3598699, 0.467758, 1, 1, 1, 1, 1,
0.265417, -0.8074548, 2.627672, 1, 1, 1, 1, 1,
0.2655615, -1.856362, 1.549612, 1, 1, 1, 1, 1,
0.2669308, -0.9023486, 0.5447128, 1, 1, 1, 1, 1,
0.2707232, 0.4462183, 0.654092, 1, 1, 1, 1, 1,
0.2722517, 0.6751037, 0.3321395, 1, 1, 1, 1, 1,
0.2730552, 0.172427, 1.085756, 1, 1, 1, 1, 1,
0.2731599, 0.04946077, 0.01225885, 1, 1, 1, 1, 1,
0.2741989, -0.01127118, 0.724488, 1, 1, 1, 1, 1,
0.2854942, 1.768996, -1.464271, 1, 1, 1, 1, 1,
0.2857702, -2.203646, 2.286189, 1, 1, 1, 1, 1,
0.2924639, -0.1713672, 2.313282, 1, 1, 1, 1, 1,
0.2948094, -0.160657, 2.737721, 1, 1, 1, 1, 1,
0.2952733, 0.8692272, -0.6839782, 0, 0, 1, 1, 1,
0.2992498, 0.9156758, -0.0205128, 1, 0, 0, 1, 1,
0.2994153, -0.99265, 4.594992, 1, 0, 0, 1, 1,
0.2997643, -1.012629, 3.858071, 1, 0, 0, 1, 1,
0.3028441, 0.2895017, 1.398521, 1, 0, 0, 1, 1,
0.3076377, -1.392941, 2.066852, 1, 0, 0, 1, 1,
0.3094523, 1.032664, -0.9116402, 0, 0, 0, 1, 1,
0.3157434, -0.7775564, 1.4872, 0, 0, 0, 1, 1,
0.3233073, -0.6219537, 5.667458, 0, 0, 0, 1, 1,
0.3349201, -0.07606001, 1.680002, 0, 0, 0, 1, 1,
0.3374897, -0.6964164, 2.257974, 0, 0, 0, 1, 1,
0.3408977, -0.1217851, 1.443818, 0, 0, 0, 1, 1,
0.3415529, -1.875218, 3.161141, 0, 0, 0, 1, 1,
0.3421564, 0.5805135, 1.109144, 1, 1, 1, 1, 1,
0.3438865, -0.3168569, 1.511869, 1, 1, 1, 1, 1,
0.3512123, -0.8232317, 1.155492, 1, 1, 1, 1, 1,
0.3512184, -1.332869, 3.433363, 1, 1, 1, 1, 1,
0.3555989, -0.9181799, 0.947369, 1, 1, 1, 1, 1,
0.3575694, -0.8734354, 1.030948, 1, 1, 1, 1, 1,
0.3601255, -1.291947, 3.017087, 1, 1, 1, 1, 1,
0.3605954, -0.8309082, 3.517334, 1, 1, 1, 1, 1,
0.3622165, -0.7471291, 2.464347, 1, 1, 1, 1, 1,
0.3646964, -0.7847343, 2.252126, 1, 1, 1, 1, 1,
0.365021, -0.7026364, 0.9151924, 1, 1, 1, 1, 1,
0.3721074, -0.1809552, 1.438819, 1, 1, 1, 1, 1,
0.3727029, 0.2588838, 0.8661494, 1, 1, 1, 1, 1,
0.37302, 1.128083, 0.4094211, 1, 1, 1, 1, 1,
0.3758079, -0.1185665, 1.713149, 1, 1, 1, 1, 1,
0.3818582, 0.2027256, 0.2848427, 0, 0, 1, 1, 1,
0.3824647, 0.3040744, 0.6147813, 1, 0, 0, 1, 1,
0.3867652, 0.5855678, 0.3229692, 1, 0, 0, 1, 1,
0.3904414, 0.5525743, -0.2147651, 1, 0, 0, 1, 1,
0.3910646, -0.8166543, 3.735716, 1, 0, 0, 1, 1,
0.3916776, 1.343121, -0.7721606, 1, 0, 0, 1, 1,
0.3953401, -1.296167, 3.517538, 0, 0, 0, 1, 1,
0.398668, -1.179121, 5.154118, 0, 0, 0, 1, 1,
0.4007599, 0.5401335, -1.862394, 0, 0, 0, 1, 1,
0.4015874, -0.9022675, 0.9109657, 0, 0, 0, 1, 1,
0.4021496, -0.318719, 0.4022028, 0, 0, 0, 1, 1,
0.4025981, 0.8268372, 1.837154, 0, 0, 0, 1, 1,
0.4054649, 0.1333568, -0.433769, 0, 0, 0, 1, 1,
0.4062477, 1.903144, -0.5340015, 1, 1, 1, 1, 1,
0.4135809, 0.04536341, 0.6079496, 1, 1, 1, 1, 1,
0.4226709, 0.5519062, -2.578147, 1, 1, 1, 1, 1,
0.4241144, 1.231675, -0.3893487, 1, 1, 1, 1, 1,
0.4271338, -0.7182071, 1.02603, 1, 1, 1, 1, 1,
0.4302151, -0.4505494, 2.869443, 1, 1, 1, 1, 1,
0.4307362, 0.9571066, 1.246319, 1, 1, 1, 1, 1,
0.433327, -1.129234, 2.101747, 1, 1, 1, 1, 1,
0.4336255, -0.2361139, 1.28796, 1, 1, 1, 1, 1,
0.4337163, 1.079329, 1.006359, 1, 1, 1, 1, 1,
0.4340601, -0.1223796, 2.923995, 1, 1, 1, 1, 1,
0.447445, 0.8002029, 0.4635677, 1, 1, 1, 1, 1,
0.4534883, -0.402, 1.749351, 1, 1, 1, 1, 1,
0.4545418, -0.1077064, 1.639561, 1, 1, 1, 1, 1,
0.4579285, 0.9145685, -1.512061, 1, 1, 1, 1, 1,
0.4614608, 1.500408, -0.8593104, 0, 0, 1, 1, 1,
0.464822, -1.700035, 3.029171, 1, 0, 0, 1, 1,
0.4665374, 2.168314, 1.308727, 1, 0, 0, 1, 1,
0.4667465, -1.273459, 3.4541, 1, 0, 0, 1, 1,
0.4677361, 0.1249405, 1.345331, 1, 0, 0, 1, 1,
0.4719198, -0.9052286, 2.892482, 1, 0, 0, 1, 1,
0.4731772, -1.061098, 1.270599, 0, 0, 0, 1, 1,
0.4735843, -0.08899343, 1.867897, 0, 0, 0, 1, 1,
0.4736513, -1.44778, 4.137823, 0, 0, 0, 1, 1,
0.4773715, -1.071223, 2.065651, 0, 0, 0, 1, 1,
0.478792, 0.469123, -0.03595341, 0, 0, 0, 1, 1,
0.4791043, -1.430475, 3.33211, 0, 0, 0, 1, 1,
0.4818605, 0.7020885, -0.4887686, 0, 0, 0, 1, 1,
0.4842147, -0.2659208, 3.284246, 1, 1, 1, 1, 1,
0.4860699, -0.001016367, 2.046663, 1, 1, 1, 1, 1,
0.4861157, 0.4649294, 0.7873094, 1, 1, 1, 1, 1,
0.4927973, -1.299159, 3.450634, 1, 1, 1, 1, 1,
0.4950912, 1.339607, -0.4013286, 1, 1, 1, 1, 1,
0.4982068, -0.9424595, 1.33752, 1, 1, 1, 1, 1,
0.5037589, 0.501632, -0.3876587, 1, 1, 1, 1, 1,
0.5063621, -0.1686236, 1.448172, 1, 1, 1, 1, 1,
0.5089227, -2.485866, 1.396574, 1, 1, 1, 1, 1,
0.509023, -0.3932476, 0.8081681, 1, 1, 1, 1, 1,
0.5127432, 1.330353, -0.07977372, 1, 1, 1, 1, 1,
0.5148276, -1.052077, 2.620938, 1, 1, 1, 1, 1,
0.5150568, 0.1710733, 1.147044, 1, 1, 1, 1, 1,
0.5191463, -1.43984, 0.3697316, 1, 1, 1, 1, 1,
0.5223537, 0.2470732, 1.378027, 1, 1, 1, 1, 1,
0.5241617, -0.6224951, 2.319622, 0, 0, 1, 1, 1,
0.5293565, -0.3757435, 2.677348, 1, 0, 0, 1, 1,
0.536608, 0.8058032, 0.4432227, 1, 0, 0, 1, 1,
0.5405363, -0.09233163, 0.6925419, 1, 0, 0, 1, 1,
0.5409598, -0.08390066, 1.872947, 1, 0, 0, 1, 1,
0.5413541, -1.565302, 1.243148, 1, 0, 0, 1, 1,
0.5420961, -1.644756, 2.647011, 0, 0, 0, 1, 1,
0.5425375, 0.4922816, 0.3851852, 0, 0, 0, 1, 1,
0.5436574, 0.6719698, 0.04123855, 0, 0, 0, 1, 1,
0.543753, -0.9891707, 3.847302, 0, 0, 0, 1, 1,
0.5448613, -0.8614851, 1.915551, 0, 0, 0, 1, 1,
0.5520803, 0.1728541, 2.479512, 0, 0, 0, 1, 1,
0.5532841, 0.1076185, 3.137876, 0, 0, 0, 1, 1,
0.5568296, 0.1969772, 0.7844366, 1, 1, 1, 1, 1,
0.5631384, -1.153419, 1.880023, 1, 1, 1, 1, 1,
0.5781123, 0.08465109, 0.7476448, 1, 1, 1, 1, 1,
0.5821429, -0.5835825, 3.555011, 1, 1, 1, 1, 1,
0.5859029, 0.2105606, 0.971275, 1, 1, 1, 1, 1,
0.5921166, -0.6393297, 2.655212, 1, 1, 1, 1, 1,
0.5993906, 0.1972993, 1.854812, 1, 1, 1, 1, 1,
0.6022052, 2.026179, -0.5647605, 1, 1, 1, 1, 1,
0.6052115, 0.6184903, 3.068683, 1, 1, 1, 1, 1,
0.6053143, -0.2016592, 3.851895, 1, 1, 1, 1, 1,
0.608024, -1.474896, 2.500252, 1, 1, 1, 1, 1,
0.611412, -0.7259225, 2.219898, 1, 1, 1, 1, 1,
0.6123837, 0.7127244, 1.886605, 1, 1, 1, 1, 1,
0.6143177, 1.269931, 1.592365, 1, 1, 1, 1, 1,
0.6197572, -0.5092009, 1.463621, 1, 1, 1, 1, 1,
0.6223962, -0.03866542, 1.589743, 0, 0, 1, 1, 1,
0.6271317, -0.06323043, 0.2560276, 1, 0, 0, 1, 1,
0.6332974, -0.9089655, 1.568543, 1, 0, 0, 1, 1,
0.6379451, -1.276449, 1.88789, 1, 0, 0, 1, 1,
0.6400303, 0.4695022, 1.37908, 1, 0, 0, 1, 1,
0.6402246, 0.3392848, 1.296819, 1, 0, 0, 1, 1,
0.6419579, -0.7022282, 2.384342, 0, 0, 0, 1, 1,
0.6471292, 1.394761, -0.5694393, 0, 0, 0, 1, 1,
0.6480074, -1.691507, 3.8318, 0, 0, 0, 1, 1,
0.6482275, -0.3201541, 0.7477841, 0, 0, 0, 1, 1,
0.6485012, 0.04093916, 2.067266, 0, 0, 0, 1, 1,
0.650996, -0.02675475, 1.597994, 0, 0, 0, 1, 1,
0.6519775, 0.9495263, -0.2090065, 0, 0, 0, 1, 1,
0.6530566, 0.2006006, 1.721261, 1, 1, 1, 1, 1,
0.6558993, -0.07905129, 0.2282576, 1, 1, 1, 1, 1,
0.6608642, -0.5282423, 3.228997, 1, 1, 1, 1, 1,
0.6644992, -0.7212536, 2.463519, 1, 1, 1, 1, 1,
0.6662531, -1.211339, 2.542706, 1, 1, 1, 1, 1,
0.669545, 0.4339105, 0.26671, 1, 1, 1, 1, 1,
0.6695949, -1.191934, 3.428427, 1, 1, 1, 1, 1,
0.6707059, 0.71097, 0.4483856, 1, 1, 1, 1, 1,
0.6715955, -0.4417355, 2.581823, 1, 1, 1, 1, 1,
0.672991, 1.021514, 0.8845829, 1, 1, 1, 1, 1,
0.6741173, -0.4807241, 1.514442, 1, 1, 1, 1, 1,
0.6768788, 3.032445, 0.4286371, 1, 1, 1, 1, 1,
0.6787538, -0.001587515, 3.045344, 1, 1, 1, 1, 1,
0.6846414, -0.460141, 2.623265, 1, 1, 1, 1, 1,
0.6848972, -1.744196, 2.347962, 1, 1, 1, 1, 1,
0.6854783, 1.757886, -0.4303574, 0, 0, 1, 1, 1,
0.6928795, 0.84552, 0.3875532, 1, 0, 0, 1, 1,
0.6935046, 0.3770958, 1.003915, 1, 0, 0, 1, 1,
0.694836, -1.170545, 1.905735, 1, 0, 0, 1, 1,
0.6975464, -0.7724169, 1.506414, 1, 0, 0, 1, 1,
0.7021345, 0.879745, 1.59844, 1, 0, 0, 1, 1,
0.7057382, 1.311055, 1.815603, 0, 0, 0, 1, 1,
0.7071549, -0.8043481, 2.205254, 0, 0, 0, 1, 1,
0.7089095, -0.9195126, 1.063306, 0, 0, 0, 1, 1,
0.7089881, 1.649345, -0.295048, 0, 0, 0, 1, 1,
0.7111906, 0.3477095, 2.676242, 0, 0, 0, 1, 1,
0.712203, 1.003046, 0.02418778, 0, 0, 0, 1, 1,
0.715481, -0.5529253, 3.024911, 0, 0, 0, 1, 1,
0.72193, -0.740479, 1.190263, 1, 1, 1, 1, 1,
0.7292078, 2.306487, -0.06927864, 1, 1, 1, 1, 1,
0.7326731, 0.9338669, 0.6464749, 1, 1, 1, 1, 1,
0.7347493, -0.5855549, 2.759958, 1, 1, 1, 1, 1,
0.7434152, 0.4401321, 1.856169, 1, 1, 1, 1, 1,
0.7444644, 0.868367, -0.2543484, 1, 1, 1, 1, 1,
0.7450045, -0.4726127, 2.186604, 1, 1, 1, 1, 1,
0.7466249, -0.4451282, 2.929169, 1, 1, 1, 1, 1,
0.7471517, -0.5019331, 3.251473, 1, 1, 1, 1, 1,
0.753976, -1.857556, 3.029088, 1, 1, 1, 1, 1,
0.7657879, 1.317786, -0.8411565, 1, 1, 1, 1, 1,
0.7691467, 0.1645266, 3.083454, 1, 1, 1, 1, 1,
0.775938, 1.252407, 0.2656866, 1, 1, 1, 1, 1,
0.7761653, -0.5457062, 3.091172, 1, 1, 1, 1, 1,
0.7766359, -1.464227, 0.4157401, 1, 1, 1, 1, 1,
0.7784333, 1.16382, 0.5632694, 0, 0, 1, 1, 1,
0.7835792, -1.564071, 2.634253, 1, 0, 0, 1, 1,
0.7846593, 0.9869711, -0.2896418, 1, 0, 0, 1, 1,
0.7886367, -0.5504839, 2.002894, 1, 0, 0, 1, 1,
0.7894143, -0.7256093, 3.224032, 1, 0, 0, 1, 1,
0.7916456, -0.2786487, 1.837254, 1, 0, 0, 1, 1,
0.7959797, 0.268705, 1.521626, 0, 0, 0, 1, 1,
0.8011476, -0.5757809, 1.790813, 0, 0, 0, 1, 1,
0.8016081, -0.4793271, 1.530971, 0, 0, 0, 1, 1,
0.8027648, -1.357741, 1.410037, 0, 0, 0, 1, 1,
0.8038648, -0.33186, 2.520183, 0, 0, 0, 1, 1,
0.8100439, -1.473801, 2.900487, 0, 0, 0, 1, 1,
0.8136364, -0.2604071, 3.180378, 0, 0, 0, 1, 1,
0.8169472, 1.706738, 0.5634465, 1, 1, 1, 1, 1,
0.8204312, -0.08976958, 3.147588, 1, 1, 1, 1, 1,
0.821858, 0.5145015, 1.869236, 1, 1, 1, 1, 1,
0.8244541, 0.5649741, 1.234274, 1, 1, 1, 1, 1,
0.8306087, -0.2921319, 1.951144, 1, 1, 1, 1, 1,
0.8384267, -0.5348659, 2.666698, 1, 1, 1, 1, 1,
0.8420954, -1.625812, 1.73432, 1, 1, 1, 1, 1,
0.8463938, -0.4707952, 3.322356, 1, 1, 1, 1, 1,
0.8504546, 0.4226607, 0.6128783, 1, 1, 1, 1, 1,
0.8531967, 0.08507162, 1.747419, 1, 1, 1, 1, 1,
0.8534718, -1.8749, 2.093546, 1, 1, 1, 1, 1,
0.854847, 0.6870185, 1.016003, 1, 1, 1, 1, 1,
0.8550914, -0.1944012, 2.585432, 1, 1, 1, 1, 1,
0.8562684, 0.7713728, 0.7605091, 1, 1, 1, 1, 1,
0.8566152, 1.049893, 0.02664118, 1, 1, 1, 1, 1,
0.8615016, 0.89305, -0.2015634, 0, 0, 1, 1, 1,
0.8618265, 0.3204831, 1.50775, 1, 0, 0, 1, 1,
0.8671747, -0.2500245, -0.5053805, 1, 0, 0, 1, 1,
0.8721034, -0.1187178, 2.642187, 1, 0, 0, 1, 1,
0.8737081, -0.5312036, 1.080285, 1, 0, 0, 1, 1,
0.8779692, -1.028825, 1.024384, 1, 0, 0, 1, 1,
0.8898507, 0.00525177, 3.009294, 0, 0, 0, 1, 1,
0.8900392, -1.270097, 0.7095425, 0, 0, 0, 1, 1,
0.8939831, 0.831955, 2.036547, 0, 0, 0, 1, 1,
0.900142, 0.08547241, 2.758398, 0, 0, 0, 1, 1,
0.902289, -0.09016078, 2.572677, 0, 0, 0, 1, 1,
0.9103422, -1.440748, 2.102015, 0, 0, 0, 1, 1,
0.9123755, 0.4074089, 1.817199, 0, 0, 0, 1, 1,
0.9142169, 1.713961, -0.3888859, 1, 1, 1, 1, 1,
0.9158434, 0.7713376, 0.705719, 1, 1, 1, 1, 1,
0.9170299, 1.203516, -0.5710956, 1, 1, 1, 1, 1,
0.9180815, 0.7139613, -0.2301524, 1, 1, 1, 1, 1,
0.9255382, -0.553779, 2.565314, 1, 1, 1, 1, 1,
0.9414548, -1.37121, 2.949792, 1, 1, 1, 1, 1,
0.9520479, 1.318308, 1.422512, 1, 1, 1, 1, 1,
0.9558382, 0.9888455, -0.3647634, 1, 1, 1, 1, 1,
0.9575627, 1.345687, 2.132771, 1, 1, 1, 1, 1,
0.9640713, -0.273698, 2.717057, 1, 1, 1, 1, 1,
0.9669575, -1.275396, 3.598071, 1, 1, 1, 1, 1,
0.9722347, 1.12509, -0.3171223, 1, 1, 1, 1, 1,
0.9730448, -2.241194, 3.091881, 1, 1, 1, 1, 1,
0.9750593, -0.5397072, 0.7687109, 1, 1, 1, 1, 1,
0.9753028, -0.2766, 2.086017, 1, 1, 1, 1, 1,
0.9782627, -0.4010394, 1.818651, 0, 0, 1, 1, 1,
0.9796624, 1.471857, 1.42816, 1, 0, 0, 1, 1,
0.9803393, 0.5534326, 0.8859673, 1, 0, 0, 1, 1,
0.9946561, 1.198296, 0.07374493, 1, 0, 0, 1, 1,
0.9989235, 0.791014, 0.8587409, 1, 0, 0, 1, 1,
1.006315, 0.9021206, -0.1523955, 1, 0, 0, 1, 1,
1.00736, -0.1967265, 2.521111, 0, 0, 0, 1, 1,
1.008639, 1.382323, 1.765761, 0, 0, 0, 1, 1,
1.012018, -0.8160932, 0.2128787, 0, 0, 0, 1, 1,
1.012569, -0.682155, 3.349957, 0, 0, 0, 1, 1,
1.01599, 1.398813, -0.4670038, 0, 0, 0, 1, 1,
1.016803, -1.50732, 3.310984, 0, 0, 0, 1, 1,
1.01959, -0.8806467, 1.664353, 0, 0, 0, 1, 1,
1.020447, -0.02974767, 0.649877, 1, 1, 1, 1, 1,
1.026883, 0.8925397, 1.250252, 1, 1, 1, 1, 1,
1.03471, 2.544206, 0.6697471, 1, 1, 1, 1, 1,
1.037673, -0.1518467, 3.294378, 1, 1, 1, 1, 1,
1.044812, -2.769118, 3.102074, 1, 1, 1, 1, 1,
1.045006, 0.1799498, 0.3039861, 1, 1, 1, 1, 1,
1.053358, 2.148544, -0.5892255, 1, 1, 1, 1, 1,
1.064151, -0.1530379, 2.671852, 1, 1, 1, 1, 1,
1.070054, -0.7220266, 1.637583, 1, 1, 1, 1, 1,
1.07044, 0.5599345, 0.7484697, 1, 1, 1, 1, 1,
1.071426, 0.3196159, 0.01685343, 1, 1, 1, 1, 1,
1.071431, 0.1871928, 0.8937678, 1, 1, 1, 1, 1,
1.075375, 1.069577, 0.3102884, 1, 1, 1, 1, 1,
1.075875, -0.05646661, 1.506956, 1, 1, 1, 1, 1,
1.078612, 0.9709293, 0.9621325, 1, 1, 1, 1, 1,
1.08345, 1.640929, 0.8247154, 0, 0, 1, 1, 1,
1.083827, 0.7786954, 0.5146082, 1, 0, 0, 1, 1,
1.084119, 0.3643912, 2.772939, 1, 0, 0, 1, 1,
1.084994, 0.4230489, 1.914449, 1, 0, 0, 1, 1,
1.088416, 0.0106198, 0.6661063, 1, 0, 0, 1, 1,
1.094594, -1.389122, 2.844032, 1, 0, 0, 1, 1,
1.098816, -0.3512122, 1.484037, 0, 0, 0, 1, 1,
1.099907, 0.4345216, 1.099997, 0, 0, 0, 1, 1,
1.104429, -1.222467, 0.7172671, 0, 0, 0, 1, 1,
1.107241, 0.008603636, 1.819606, 0, 0, 0, 1, 1,
1.109918, -0.2821683, 2.686346, 0, 0, 0, 1, 1,
1.130632, -0.4683683, 2.738683, 0, 0, 0, 1, 1,
1.133432, -2.539256, 1.476796, 0, 0, 0, 1, 1,
1.134848, -0.0365893, 2.526725, 1, 1, 1, 1, 1,
1.140296, -0.1796988, 1.095222, 1, 1, 1, 1, 1,
1.142836, 0.1799547, 2.437608, 1, 1, 1, 1, 1,
1.147457, 1.87618, 2.336669, 1, 1, 1, 1, 1,
1.154253, -0.1494886, 1.834208, 1, 1, 1, 1, 1,
1.155795, -0.03522385, 0.6129663, 1, 1, 1, 1, 1,
1.156657, -0.208087, 0.7519166, 1, 1, 1, 1, 1,
1.159247, -1.658746, 2.458, 1, 1, 1, 1, 1,
1.164457, -0.07203527, 1.191689, 1, 1, 1, 1, 1,
1.176219, -0.9317895, 1.922219, 1, 1, 1, 1, 1,
1.176767, -0.2246464, 2.173326, 1, 1, 1, 1, 1,
1.177047, -0.4968008, 1.930579, 1, 1, 1, 1, 1,
1.184063, 1.166669, 2.027622, 1, 1, 1, 1, 1,
1.192074, -0.1941221, 1.645136, 1, 1, 1, 1, 1,
1.194626, -0.3526975, 0.9484966, 1, 1, 1, 1, 1,
1.203465, 0.2653146, 0.9598452, 0, 0, 1, 1, 1,
1.205449, 0.4981572, 0.4201881, 1, 0, 0, 1, 1,
1.206638, -0.3335143, 2.988909, 1, 0, 0, 1, 1,
1.207204, 0.7914409, 0.7623192, 1, 0, 0, 1, 1,
1.211247, 1.068261, 0.9426031, 1, 0, 0, 1, 1,
1.213625, 1.290223, 0.9036078, 1, 0, 0, 1, 1,
1.221763, -0.5436977, 1.699904, 0, 0, 0, 1, 1,
1.222216, -0.5375749, 0.6071794, 0, 0, 0, 1, 1,
1.227369, 2.04824, 0.6002069, 0, 0, 0, 1, 1,
1.237637, -0.9461107, 3.793526, 0, 0, 0, 1, 1,
1.242133, -0.3329458, 1.893121, 0, 0, 0, 1, 1,
1.246781, 0.5045902, 3.635606, 0, 0, 0, 1, 1,
1.253684, 1.628132, 1.453925, 0, 0, 0, 1, 1,
1.255342, -0.7456767, 1.677875, 1, 1, 1, 1, 1,
1.258852, -0.2717525, 1.312329, 1, 1, 1, 1, 1,
1.269171, -0.5817683, 3.008885, 1, 1, 1, 1, 1,
1.276208, 1.013743, -0.2082035, 1, 1, 1, 1, 1,
1.278991, -0.6935382, 2.034866, 1, 1, 1, 1, 1,
1.289996, -2.865537, 3.53301, 1, 1, 1, 1, 1,
1.293362, -0.8797388, 2.346038, 1, 1, 1, 1, 1,
1.306041, -0.4595092, 0.9542171, 1, 1, 1, 1, 1,
1.31241, -0.1843781, 2.325636, 1, 1, 1, 1, 1,
1.315829, -1.959036, 4.473439, 1, 1, 1, 1, 1,
1.31699, -0.4307375, 2.442816, 1, 1, 1, 1, 1,
1.317044, 0.7527378, 0.9976898, 1, 1, 1, 1, 1,
1.324677, -0.6953817, 2.830904, 1, 1, 1, 1, 1,
1.332534, 0.4878818, 1.09229, 1, 1, 1, 1, 1,
1.343589, -0.3583085, 0.5540148, 1, 1, 1, 1, 1,
1.347936, 0.8616765, 0.5243037, 0, 0, 1, 1, 1,
1.369158, 0.1249322, 2.237824, 1, 0, 0, 1, 1,
1.375451, 1.640278, 0.6475103, 1, 0, 0, 1, 1,
1.402996, 0.4100541, 0.7839248, 1, 0, 0, 1, 1,
1.411572, -0.3448284, 1.97626, 1, 0, 0, 1, 1,
1.429887, 0.1535263, 1.322858, 1, 0, 0, 1, 1,
1.43799, 0.4930433, 1.329932, 0, 0, 0, 1, 1,
1.439093, -0.9947611, 3.47215, 0, 0, 0, 1, 1,
1.478601, -0.708299, 2.747955, 0, 0, 0, 1, 1,
1.490985, -2.169641, 2.413393, 0, 0, 0, 1, 1,
1.509717, 0.6936636, 1.419361, 0, 0, 0, 1, 1,
1.512572, 1.115773, 1.98164, 0, 0, 0, 1, 1,
1.513919, -0.1937152, 1.290401, 0, 0, 0, 1, 1,
1.515724, -1.391267, 1.254507, 1, 1, 1, 1, 1,
1.517055, 0.1037542, 4.218893, 1, 1, 1, 1, 1,
1.526545, 1.033576, 1.238472, 1, 1, 1, 1, 1,
1.538859, -1.739585, 1.394136, 1, 1, 1, 1, 1,
1.553727, 0.419888, 3.342346, 1, 1, 1, 1, 1,
1.560227, -0.4867559, 0.5832961, 1, 1, 1, 1, 1,
1.560856, 1.783792, 1.217481, 1, 1, 1, 1, 1,
1.564261, 0.8372771, 0.1412046, 1, 1, 1, 1, 1,
1.56565, -0.297847, 2.242631, 1, 1, 1, 1, 1,
1.573234, 0.4884159, 1.136756, 1, 1, 1, 1, 1,
1.579404, -0.2133756, 0.5681007, 1, 1, 1, 1, 1,
1.591975, 0.4147923, 2.199693, 1, 1, 1, 1, 1,
1.592205, -0.6918734, 1.607095, 1, 1, 1, 1, 1,
1.601924, -0.04192808, 0.6993837, 1, 1, 1, 1, 1,
1.603499, -0.3340294, 2.122155, 1, 1, 1, 1, 1,
1.611164, 0.4064495, 2.241528, 0, 0, 1, 1, 1,
1.617842, 0.8525658, 1.957484, 1, 0, 0, 1, 1,
1.64885, -0.6562772, 2.008769, 1, 0, 0, 1, 1,
1.65251, -0.9689028, 1.041028, 1, 0, 0, 1, 1,
1.659781, 1.316134, 1.592752, 1, 0, 0, 1, 1,
1.671145, -0.7623295, 0.2968425, 1, 0, 0, 1, 1,
1.672483, -0.8782424, 1.431932, 0, 0, 0, 1, 1,
1.673903, -1.389616, 1.989655, 0, 0, 0, 1, 1,
1.675966, -1.025438, 1.825812, 0, 0, 0, 1, 1,
1.67782, -0.5003811, -0.9195493, 0, 0, 0, 1, 1,
1.700225, -0.6896149, 2.012882, 0, 0, 0, 1, 1,
1.701021, 0.5961699, 0.5642184, 0, 0, 0, 1, 1,
1.706179, 0.6117029, 0.9775176, 0, 0, 0, 1, 1,
1.712161, -0.02129051, 2.822298, 1, 1, 1, 1, 1,
1.72797, -0.9495974, 0.6101784, 1, 1, 1, 1, 1,
1.740761, -1.183683, 2.488483, 1, 1, 1, 1, 1,
1.742556, -0.04510864, 0.2678578, 1, 1, 1, 1, 1,
1.804255, -0.149263, 0.324341, 1, 1, 1, 1, 1,
1.827343, 2.026394, 1.73687, 1, 1, 1, 1, 1,
1.833271, -2.590181, 4.839432, 1, 1, 1, 1, 1,
1.836044, -2.579616, 2.15905, 1, 1, 1, 1, 1,
1.85038, -0.2845904, 0.7679758, 1, 1, 1, 1, 1,
1.850924, -0.007265676, 3.346674, 1, 1, 1, 1, 1,
1.852388, -0.4160654, 0.6677283, 1, 1, 1, 1, 1,
1.874091, -0.7014354, 2.680226, 1, 1, 1, 1, 1,
1.87684, 1.874997, -0.1728737, 1, 1, 1, 1, 1,
1.899993, -0.3800706, 0.01874638, 1, 1, 1, 1, 1,
1.903157, 0.6585012, 2.313536, 1, 1, 1, 1, 1,
1.923837, -0.3718501, 0.7594019, 0, 0, 1, 1, 1,
1.964507, 1.679273, 1.18681, 1, 0, 0, 1, 1,
1.999264, 1.703782, 1.044842, 1, 0, 0, 1, 1,
2.054915, -0.9628608, 2.380976, 1, 0, 0, 1, 1,
2.115375, 0.638463, 1.212385, 1, 0, 0, 1, 1,
2.122416, -2.056968, 1.944467, 1, 0, 0, 1, 1,
2.150314, -0.1845535, 0.5621478, 0, 0, 0, 1, 1,
2.160469, 1.525784, 0.1309047, 0, 0, 0, 1, 1,
2.164564, 0.2292774, 1.84058, 0, 0, 0, 1, 1,
2.174278, 0.4162102, 0.2994595, 0, 0, 0, 1, 1,
2.270925, 1.423576, 0.744836, 0, 0, 0, 1, 1,
2.271891, -0.9368059, 0.8281398, 0, 0, 0, 1, 1,
2.337023, -1.692647, 2.615336, 0, 0, 0, 1, 1,
2.342655, -0.17142, 0.6912645, 1, 1, 1, 1, 1,
2.36607, 1.043714, 2.004501, 1, 1, 1, 1, 1,
2.411319, 1.296117, 1.408228, 1, 1, 1, 1, 1,
2.411424, -0.9101467, 3.366641, 1, 1, 1, 1, 1,
2.516715, -0.5611092, 2.926522, 1, 1, 1, 1, 1,
2.550176, 0.9138887, 0.5294155, 1, 1, 1, 1, 1,
2.551767, -1.079456, 2.549213, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.398778;
var distance = 33.01281;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2082418, -0.003117085, -0.1380887 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01281);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
