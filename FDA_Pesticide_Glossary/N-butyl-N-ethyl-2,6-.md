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
-3.532074, 0.3515978, -0.4625079, 1, 0, 0, 1,
-2.752865, 1.214012, -1.756223, 1, 0.007843138, 0, 1,
-2.733406, 0.7673658, -1.693052, 1, 0.01176471, 0, 1,
-2.63731, 0.07492907, -0.9872258, 1, 0.01960784, 0, 1,
-2.604672, -0.04612742, -1.038426, 1, 0.02352941, 0, 1,
-2.550553, 1.797637, 0.5473294, 1, 0.03137255, 0, 1,
-2.449754, 2.055643, -0.5408902, 1, 0.03529412, 0, 1,
-2.430642, 0.1535579, -0.4442842, 1, 0.04313726, 0, 1,
-2.421775, 0.6080759, -0.1734264, 1, 0.04705882, 0, 1,
-2.337212, -0.09011698, -3.104668, 1, 0.05490196, 0, 1,
-2.251796, 1.185081, -0.7646289, 1, 0.05882353, 0, 1,
-2.243307, 1.542243, -0.6679118, 1, 0.06666667, 0, 1,
-2.232557, 0.3831258, -1.676797, 1, 0.07058824, 0, 1,
-2.217187, 0.1701669, -1.056431, 1, 0.07843138, 0, 1,
-2.209378, 0.3588772, -1.602115, 1, 0.08235294, 0, 1,
-2.197892, 0.1036548, -2.321699, 1, 0.09019608, 0, 1,
-2.182638, 0.03809183, -0.8402913, 1, 0.09411765, 0, 1,
-2.163274, 1.153126, 0.301886, 1, 0.1019608, 0, 1,
-2.122895, -0.5475691, -3.78828, 1, 0.1098039, 0, 1,
-2.113198, 0.2722117, -3.05967, 1, 0.1137255, 0, 1,
-2.059075, 0.09266365, 0.8047101, 1, 0.1215686, 0, 1,
-2.034635, 0.4686638, -0.3842818, 1, 0.1254902, 0, 1,
-2.014847, 0.2556502, -2.116747, 1, 0.1333333, 0, 1,
-2.009199, 0.08455837, -0.5710387, 1, 0.1372549, 0, 1,
-1.987036, -0.5064743, 0.4099415, 1, 0.145098, 0, 1,
-1.97476, -0.2741388, -2.387066, 1, 0.1490196, 0, 1,
-1.9307, -0.1038887, -0.7410333, 1, 0.1568628, 0, 1,
-1.926524, -0.5356085, -2.414614, 1, 0.1607843, 0, 1,
-1.901835, 0.2843787, -1.990391, 1, 0.1686275, 0, 1,
-1.889095, 1.410812, -0.6421421, 1, 0.172549, 0, 1,
-1.866368, 1.354057, -0.4175304, 1, 0.1803922, 0, 1,
-1.865991, 2.565956, 0.2950182, 1, 0.1843137, 0, 1,
-1.865331, -3.197842, -4.167711, 1, 0.1921569, 0, 1,
-1.834099, 0.6568266, -0.4373795, 1, 0.1960784, 0, 1,
-1.817262, -0.0107706, -2.238949, 1, 0.2039216, 0, 1,
-1.805339, -1.728684, -2.145163, 1, 0.2117647, 0, 1,
-1.800887, 0.9730319, -2.207232, 1, 0.2156863, 0, 1,
-1.785625, 1.112285, 0.03019665, 1, 0.2235294, 0, 1,
-1.783829, -1.020384, -3.812842, 1, 0.227451, 0, 1,
-1.769587, 1.470752, -0.4736764, 1, 0.2352941, 0, 1,
-1.749306, -0.7440982, -4.180082, 1, 0.2392157, 0, 1,
-1.738724, 0.1878291, -1.030795, 1, 0.2470588, 0, 1,
-1.725256, -1.785173, -0.7608254, 1, 0.2509804, 0, 1,
-1.699357, 1.256077, -1.350505, 1, 0.2588235, 0, 1,
-1.698888, 0.5725617, -0.04589745, 1, 0.2627451, 0, 1,
-1.693702, -1.118995, -2.019052, 1, 0.2705882, 0, 1,
-1.691843, -0.168877, -1.544983, 1, 0.2745098, 0, 1,
-1.68271, -0.598412, -3.649829, 1, 0.282353, 0, 1,
-1.671675, 0.1331386, 0.5780785, 1, 0.2862745, 0, 1,
-1.671399, 0.3208549, -2.458866, 1, 0.2941177, 0, 1,
-1.664933, 0.7497882, 0.9621745, 1, 0.3019608, 0, 1,
-1.647424, -1.330414, -2.1888, 1, 0.3058824, 0, 1,
-1.64101, 0.006977821, -0.9011629, 1, 0.3137255, 0, 1,
-1.639486, -0.2847525, -1.861589, 1, 0.3176471, 0, 1,
-1.627503, -0.8614944, -0.8194676, 1, 0.3254902, 0, 1,
-1.618067, -0.4994484, -2.441632, 1, 0.3294118, 0, 1,
-1.616709, 0.5264293, -3.29446, 1, 0.3372549, 0, 1,
-1.611196, 0.3851417, -1.281551, 1, 0.3411765, 0, 1,
-1.607816, -1.575986, -2.922878, 1, 0.3490196, 0, 1,
-1.597472, -0.87014, -2.66581, 1, 0.3529412, 0, 1,
-1.573488, 0.5522765, -1.761118, 1, 0.3607843, 0, 1,
-1.569651, -0.2596851, -3.096428, 1, 0.3647059, 0, 1,
-1.564145, 1.000611, -0.971364, 1, 0.372549, 0, 1,
-1.538728, 1.471713, -0.05893402, 1, 0.3764706, 0, 1,
-1.538211, 1.183062, -1.186551, 1, 0.3843137, 0, 1,
-1.533662, -0.5382892, -2.445342, 1, 0.3882353, 0, 1,
-1.521753, -0.8567956, -2.227069, 1, 0.3960784, 0, 1,
-1.510793, -0.8066983, -0.7115481, 1, 0.4039216, 0, 1,
-1.509051, 1.464741, -1.042822, 1, 0.4078431, 0, 1,
-1.503163, 1.165386, 0.7048657, 1, 0.4156863, 0, 1,
-1.501047, 0.08393851, -1.514055, 1, 0.4196078, 0, 1,
-1.496026, -0.9900771, -3.130243, 1, 0.427451, 0, 1,
-1.483983, -1.521349, -2.047663, 1, 0.4313726, 0, 1,
-1.481413, -1.109086, -5.116799, 1, 0.4392157, 0, 1,
-1.47214, -0.3766981, -1.464704, 1, 0.4431373, 0, 1,
-1.464426, -0.01463803, -2.950213, 1, 0.4509804, 0, 1,
-1.463579, -0.4304381, -1.413654, 1, 0.454902, 0, 1,
-1.453794, 0.775394, -1.23654, 1, 0.4627451, 0, 1,
-1.453142, -1.67091, -3.494779, 1, 0.4666667, 0, 1,
-1.443868, -0.03023632, -0.190269, 1, 0.4745098, 0, 1,
-1.421088, 0.5619168, -0.9440983, 1, 0.4784314, 0, 1,
-1.411585, 0.1745883, -1.698852, 1, 0.4862745, 0, 1,
-1.409159, -0.3741976, -2.661636, 1, 0.4901961, 0, 1,
-1.402894, 0.9483826, -0.9071382, 1, 0.4980392, 0, 1,
-1.392009, -2.426571, -2.04151, 1, 0.5058824, 0, 1,
-1.383477, -0.5219758, -2.077434, 1, 0.509804, 0, 1,
-1.373395, -0.8270171, -2.587875, 1, 0.5176471, 0, 1,
-1.359457, -0.01116425, -2.593258, 1, 0.5215687, 0, 1,
-1.355122, 1.073519, -0.5236, 1, 0.5294118, 0, 1,
-1.352943, 0.01597196, -2.320117, 1, 0.5333334, 0, 1,
-1.326764, -1.171693, -2.704899, 1, 0.5411765, 0, 1,
-1.32147, -0.07021722, -1.723088, 1, 0.5450981, 0, 1,
-1.314141, 0.8766665, 0.6688896, 1, 0.5529412, 0, 1,
-1.308467, -1.077037, -2.858338, 1, 0.5568628, 0, 1,
-1.307573, 2.092667, 1.297111, 1, 0.5647059, 0, 1,
-1.298959, 0.5928863, -1.512674, 1, 0.5686275, 0, 1,
-1.293652, -0.05605671, -2.184751, 1, 0.5764706, 0, 1,
-1.282823, 0.8305354, -1.11604, 1, 0.5803922, 0, 1,
-1.276012, -0.3220568, -1.787268, 1, 0.5882353, 0, 1,
-1.267597, -0.9151289, -3.474837, 1, 0.5921569, 0, 1,
-1.266866, -0.552301, -4.603652, 1, 0.6, 0, 1,
-1.25837, 0.3618424, -0.2852801, 1, 0.6078432, 0, 1,
-1.257224, 0.2323288, -1.451226, 1, 0.6117647, 0, 1,
-1.253125, -0.7673551, -2.809073, 1, 0.6196079, 0, 1,
-1.247327, 0.6935979, -1.06734, 1, 0.6235294, 0, 1,
-1.243315, 0.7080804, -1.504048, 1, 0.6313726, 0, 1,
-1.239802, 0.9556771, -1.029828, 1, 0.6352941, 0, 1,
-1.234115, 0.6863207, -1.260297, 1, 0.6431373, 0, 1,
-1.21806, -0.8855867, -3.995396, 1, 0.6470588, 0, 1,
-1.202318, 0.08610542, -2.060057, 1, 0.654902, 0, 1,
-1.193572, 2.085219, 0.9381548, 1, 0.6588235, 0, 1,
-1.182889, 0.5031541, -2.967008, 1, 0.6666667, 0, 1,
-1.182157, -0.9965293, -3.972911, 1, 0.6705883, 0, 1,
-1.178205, 2.016196, 0.490332, 1, 0.6784314, 0, 1,
-1.1648, 0.1034272, 0.2342325, 1, 0.682353, 0, 1,
-1.160555, 0.7993738, -0.4408551, 1, 0.6901961, 0, 1,
-1.153692, 0.9222164, 0.9974011, 1, 0.6941177, 0, 1,
-1.14944, 0.3682933, -2.062211, 1, 0.7019608, 0, 1,
-1.134108, 0.2071832, -3.193481, 1, 0.7098039, 0, 1,
-1.134019, 0.7951955, -2.555283, 1, 0.7137255, 0, 1,
-1.127324, 0.8128775, -2.660113, 1, 0.7215686, 0, 1,
-1.124474, -0.7049423, -2.707954, 1, 0.7254902, 0, 1,
-1.110018, 0.4226537, -2.078777, 1, 0.7333333, 0, 1,
-1.098797, -0.7069383, 1.012518, 1, 0.7372549, 0, 1,
-1.080289, 0.2470322, -1.2038, 1, 0.7450981, 0, 1,
-1.078249, -0.3715652, -1.819295, 1, 0.7490196, 0, 1,
-1.064363, 1.54277, -0.9659098, 1, 0.7568628, 0, 1,
-1.052711, -1.002689, -2.001019, 1, 0.7607843, 0, 1,
-1.050768, 2.151056, 0.9034808, 1, 0.7686275, 0, 1,
-1.049731, 0.01819597, -1.785449, 1, 0.772549, 0, 1,
-1.042376, 0.3526826, -1.30382, 1, 0.7803922, 0, 1,
-1.042054, -1.980285, -0.9493201, 1, 0.7843137, 0, 1,
-1.039331, 0.2265484, -1.716447, 1, 0.7921569, 0, 1,
-1.031555, -0.8033344, -2.434259, 1, 0.7960784, 0, 1,
-1.030238, 0.6019848, -0.1422357, 1, 0.8039216, 0, 1,
-1.027513, 0.2829726, -2.844546, 1, 0.8117647, 0, 1,
-1.027052, -0.9815603, -1.496365, 1, 0.8156863, 0, 1,
-1.021815, 0.01555167, -0.8452453, 1, 0.8235294, 0, 1,
-1.016296, -1.285449, -3.027085, 1, 0.827451, 0, 1,
-1.015992, 0.652918, -1.613539, 1, 0.8352941, 0, 1,
-1.013865, -0.1810619, -2.764627, 1, 0.8392157, 0, 1,
-1.010089, -0.8575782, -3.42921, 1, 0.8470588, 0, 1,
-1.009412, -0.7902212, -3.294443, 1, 0.8509804, 0, 1,
-1.008142, -0.7055793, -2.904608, 1, 0.8588235, 0, 1,
-1.007047, 1.086051, 1.630403, 1, 0.8627451, 0, 1,
-1.003076, 1.158157, 0.09575125, 1, 0.8705882, 0, 1,
-1.002988, -0.10478, -2.727653, 1, 0.8745098, 0, 1,
-1.002194, 1.105496, -0.1114855, 1, 0.8823529, 0, 1,
-1.001102, 1.51096, -1.732085, 1, 0.8862745, 0, 1,
-0.9995205, 0.399183, -0.9247233, 1, 0.8941177, 0, 1,
-0.9989432, 0.9645452, -1.47451, 1, 0.8980392, 0, 1,
-0.9936259, -1.735331, -3.405144, 1, 0.9058824, 0, 1,
-0.9917135, -1.638256, -1.788839, 1, 0.9137255, 0, 1,
-0.9906166, -1.092342, -3.311118, 1, 0.9176471, 0, 1,
-0.9848279, -0.1720469, -1.359986, 1, 0.9254902, 0, 1,
-0.9839802, 0.4642573, -0.1542116, 1, 0.9294118, 0, 1,
-0.9821977, -1.079685, -3.338064, 1, 0.9372549, 0, 1,
-0.9808454, -0.2737635, -0.716104, 1, 0.9411765, 0, 1,
-0.9771921, -0.8156928, -2.342965, 1, 0.9490196, 0, 1,
-0.9708298, -0.7168699, -3.551897, 1, 0.9529412, 0, 1,
-0.9688259, -1.561686, -3.970332, 1, 0.9607843, 0, 1,
-0.9647557, -0.09572384, -1.894669, 1, 0.9647059, 0, 1,
-0.9643582, -0.5483016, -2.348106, 1, 0.972549, 0, 1,
-0.9631683, -0.1174537, -2.150057, 1, 0.9764706, 0, 1,
-0.9606832, -0.6297657, -1.613835, 1, 0.9843137, 0, 1,
-0.9599709, -0.5679355, -0.6044992, 1, 0.9882353, 0, 1,
-0.9581536, 0.1599813, -0.776517, 1, 0.9960784, 0, 1,
-0.9559507, 1.344623, -1.117996, 0.9960784, 1, 0, 1,
-0.9381382, 0.308678, -2.38572, 0.9921569, 1, 0, 1,
-0.9378374, 0.220928, -2.168923, 0.9843137, 1, 0, 1,
-0.9327158, 1.083381, -2.146027, 0.9803922, 1, 0, 1,
-0.9311979, -0.8909871, -0.8582295, 0.972549, 1, 0, 1,
-0.9271539, 1.810662, 0.8024682, 0.9686275, 1, 0, 1,
-0.9212947, -0.2031462, -0.4976861, 0.9607843, 1, 0, 1,
-0.9209354, 1.159109, -2.157192, 0.9568627, 1, 0, 1,
-0.9111356, -0.3719411, -1.858726, 0.9490196, 1, 0, 1,
-0.9089305, 0.2362355, -1.047493, 0.945098, 1, 0, 1,
-0.9042652, 0.1308114, -2.407049, 0.9372549, 1, 0, 1,
-0.8977181, 0.01777118, -2.183111, 0.9333333, 1, 0, 1,
-0.8945461, -1.310334, -5.264184, 0.9254902, 1, 0, 1,
-0.8938649, 0.6473187, 0.2239229, 0.9215686, 1, 0, 1,
-0.8866259, -0.8664916, -1.965793, 0.9137255, 1, 0, 1,
-0.8852929, -0.2990279, -1.944934, 0.9098039, 1, 0, 1,
-0.8819668, 0.01349365, -3.685159, 0.9019608, 1, 0, 1,
-0.8737724, -0.5358946, -1.079148, 0.8941177, 1, 0, 1,
-0.8700245, 0.5023082, -2.14469, 0.8901961, 1, 0, 1,
-0.8668151, -0.895345, -3.90946, 0.8823529, 1, 0, 1,
-0.8470031, 0.234125, -2.480242, 0.8784314, 1, 0, 1,
-0.843295, -1.073592, -1.956606, 0.8705882, 1, 0, 1,
-0.8423548, 1.118289, -1.336938, 0.8666667, 1, 0, 1,
-0.8411942, 2.03363, -1.260971, 0.8588235, 1, 0, 1,
-0.8386869, -1.820039, -3.886091, 0.854902, 1, 0, 1,
-0.8370314, -1.413475, -2.084146, 0.8470588, 1, 0, 1,
-0.8342037, 0.155093, -2.142144, 0.8431373, 1, 0, 1,
-0.8334594, 0.3410116, -1.227057, 0.8352941, 1, 0, 1,
-0.8333704, 0.09168456, -0.6008333, 0.8313726, 1, 0, 1,
-0.8314882, 1.898968, 0.3324008, 0.8235294, 1, 0, 1,
-0.8300421, 0.6214971, -1.148053, 0.8196079, 1, 0, 1,
-0.8291834, 0.3490154, -1.214976, 0.8117647, 1, 0, 1,
-0.8268085, -0.3293132, -2.608691, 0.8078431, 1, 0, 1,
-0.8221485, 0.3069755, -2.165849, 0.8, 1, 0, 1,
-0.8206458, 0.9001724, -1.417549, 0.7921569, 1, 0, 1,
-0.8199713, 2.0119, -0.8501151, 0.7882353, 1, 0, 1,
-0.8155014, 0.1616516, -2.487391, 0.7803922, 1, 0, 1,
-0.8115013, 0.8876883, -2.336327, 0.7764706, 1, 0, 1,
-0.8082067, -0.6290365, -1.717442, 0.7686275, 1, 0, 1,
-0.807265, 0.2808688, -0.3204556, 0.7647059, 1, 0, 1,
-0.8005719, 1.224961, -1.468699, 0.7568628, 1, 0, 1,
-0.7950629, -0.4982654, -3.048811, 0.7529412, 1, 0, 1,
-0.7832603, 0.1263926, -1.325655, 0.7450981, 1, 0, 1,
-0.7821276, -0.9354794, -3.215205, 0.7411765, 1, 0, 1,
-0.7817059, -0.8151565, -4.090492, 0.7333333, 1, 0, 1,
-0.7795421, 1.387381, -1.385912, 0.7294118, 1, 0, 1,
-0.7791901, 0.02816233, -3.147117, 0.7215686, 1, 0, 1,
-0.7774344, 0.1975164, -1.347096, 0.7176471, 1, 0, 1,
-0.7725134, 0.5941216, -0.1161666, 0.7098039, 1, 0, 1,
-0.7547252, -0.7222255, -1.082605, 0.7058824, 1, 0, 1,
-0.7541011, 0.2137703, -1.38265, 0.6980392, 1, 0, 1,
-0.7484153, 0.604311, 0.9161264, 0.6901961, 1, 0, 1,
-0.7482827, -0.1272713, -0.7661924, 0.6862745, 1, 0, 1,
-0.7465137, -0.03899688, -3.275052, 0.6784314, 1, 0, 1,
-0.7459953, 0.3670312, -0.7675493, 0.6745098, 1, 0, 1,
-0.7416066, -1.408171, -3.147495, 0.6666667, 1, 0, 1,
-0.7401333, 1.026613, -0.8018371, 0.6627451, 1, 0, 1,
-0.7397738, 1.517831, 0.09781177, 0.654902, 1, 0, 1,
-0.7347397, 0.1516373, -0.8769362, 0.6509804, 1, 0, 1,
-0.7347085, 0.4074251, -1.358243, 0.6431373, 1, 0, 1,
-0.7334511, 1.190833, 0.1008721, 0.6392157, 1, 0, 1,
-0.7325662, -0.08711064, -1.220472, 0.6313726, 1, 0, 1,
-0.7318791, -0.09523132, -0.9891665, 0.627451, 1, 0, 1,
-0.7317597, -0.4577414, -1.658414, 0.6196079, 1, 0, 1,
-0.7315623, 1.273061, -0.4169734, 0.6156863, 1, 0, 1,
-0.730984, -0.5567437, -2.141981, 0.6078432, 1, 0, 1,
-0.7290044, 1.105282, 0.3846275, 0.6039216, 1, 0, 1,
-0.7259507, -0.7377274, 0.6722535, 0.5960785, 1, 0, 1,
-0.7160751, 0.0110833, -3.287854, 0.5882353, 1, 0, 1,
-0.7140167, 1.306621, -1.891811, 0.5843138, 1, 0, 1,
-0.7119604, -0.1600288, -2.332218, 0.5764706, 1, 0, 1,
-0.7080976, -1.755337, -2.495119, 0.572549, 1, 0, 1,
-0.7034785, 0.3294543, -0.1467414, 0.5647059, 1, 0, 1,
-0.7005427, -2.561596, -2.033679, 0.5607843, 1, 0, 1,
-0.6994868, 3.317114, 0.1212691, 0.5529412, 1, 0, 1,
-0.6932665, -0.4747792, -1.300563, 0.5490196, 1, 0, 1,
-0.6927667, -0.5412072, -2.544484, 0.5411765, 1, 0, 1,
-0.691719, -1.047517, -3.777985, 0.5372549, 1, 0, 1,
-0.6912325, 0.5940825, -1.049094, 0.5294118, 1, 0, 1,
-0.6889997, 1.388815, 0.413896, 0.5254902, 1, 0, 1,
-0.6879308, -1.11152, -2.015363, 0.5176471, 1, 0, 1,
-0.686942, -1.24098, -1.623019, 0.5137255, 1, 0, 1,
-0.686785, 0.3408943, -2.000555, 0.5058824, 1, 0, 1,
-0.6831232, -0.4819854, -2.128798, 0.5019608, 1, 0, 1,
-0.678403, 0.7125619, -1.263886, 0.4941176, 1, 0, 1,
-0.6710146, 0.597765, 0.2767134, 0.4862745, 1, 0, 1,
-0.6709096, 0.5076063, -2.530617, 0.4823529, 1, 0, 1,
-0.6672166, 0.4980502, -1.483395, 0.4745098, 1, 0, 1,
-0.6658645, -0.775556, -1.221786, 0.4705882, 1, 0, 1,
-0.6623636, -0.8604497, -3.555944, 0.4627451, 1, 0, 1,
-0.6613987, 0.4482169, -0.1253763, 0.4588235, 1, 0, 1,
-0.6525807, -0.3731992, -3.122111, 0.4509804, 1, 0, 1,
-0.64297, -0.5640481, -1.623806, 0.4470588, 1, 0, 1,
-0.6422824, 0.1687157, -1.504168, 0.4392157, 1, 0, 1,
-0.6416357, -0.5288593, -0.7196177, 0.4352941, 1, 0, 1,
-0.6387342, -1.253387, -3.460541, 0.427451, 1, 0, 1,
-0.6384465, 0.2165664, -2.898415, 0.4235294, 1, 0, 1,
-0.6377652, 0.6550964, -0.4032866, 0.4156863, 1, 0, 1,
-0.6322558, -1.151794, -1.997078, 0.4117647, 1, 0, 1,
-0.6320989, 1.549345, -1.566132, 0.4039216, 1, 0, 1,
-0.6207055, 0.1402078, -3.386257, 0.3960784, 1, 0, 1,
-0.6193208, 0.2020102, -0.6407865, 0.3921569, 1, 0, 1,
-0.6179464, 2.028632, -0.08721368, 0.3843137, 1, 0, 1,
-0.61281, 1.293948, 1.612991, 0.3803922, 1, 0, 1,
-0.6118549, 0.08465056, -0.5626248, 0.372549, 1, 0, 1,
-0.6095763, -1.180442, -2.54334, 0.3686275, 1, 0, 1,
-0.6074013, 0.6014428, 1.110532, 0.3607843, 1, 0, 1,
-0.6043489, -0.4344265, -4.573199, 0.3568628, 1, 0, 1,
-0.5997318, 0.009463761, -1.498154, 0.3490196, 1, 0, 1,
-0.5991012, 0.3778996, -1.781405, 0.345098, 1, 0, 1,
-0.5958642, -1.940442, -3.437403, 0.3372549, 1, 0, 1,
-0.5947592, -0.6651363, -2.047926, 0.3333333, 1, 0, 1,
-0.5937436, 1.557624, -2.236742, 0.3254902, 1, 0, 1,
-0.5908049, 2.161013, -1.185194, 0.3215686, 1, 0, 1,
-0.5903263, 1.784728, 1.190589, 0.3137255, 1, 0, 1,
-0.5898491, -1.037818, -3.012778, 0.3098039, 1, 0, 1,
-0.5895958, -0.2291838, -0.2568227, 0.3019608, 1, 0, 1,
-0.5875391, -0.1613257, -2.21224, 0.2941177, 1, 0, 1,
-0.58257, -0.3579903, -1.122269, 0.2901961, 1, 0, 1,
-0.5825232, -0.5832192, -1.010995, 0.282353, 1, 0, 1,
-0.5815477, 0.3900402, -0.03035183, 0.2784314, 1, 0, 1,
-0.5812135, 0.9429828, -0.7761266, 0.2705882, 1, 0, 1,
-0.5798808, 1.165231, -1.413855, 0.2666667, 1, 0, 1,
-0.5797256, 1.775844, 0.7818884, 0.2588235, 1, 0, 1,
-0.5749745, -0.1420939, -1.463299, 0.254902, 1, 0, 1,
-0.5723314, -0.09114318, -1.235009, 0.2470588, 1, 0, 1,
-0.5699494, 0.523759, -2.239436, 0.2431373, 1, 0, 1,
-0.5600854, -0.1175916, -2.955952, 0.2352941, 1, 0, 1,
-0.5582829, -0.0857422, -2.931452, 0.2313726, 1, 0, 1,
-0.5570073, 0.07137267, -0.6852174, 0.2235294, 1, 0, 1,
-0.551066, 1.625757, -2.34725, 0.2196078, 1, 0, 1,
-0.5473633, 0.6418278, -0.578189, 0.2117647, 1, 0, 1,
-0.5441707, 0.7284676, -1.444106, 0.2078431, 1, 0, 1,
-0.5381644, -0.1184411, -2.216226, 0.2, 1, 0, 1,
-0.5374153, -1.258391, -2.168604, 0.1921569, 1, 0, 1,
-0.5374079, 0.9170699, 1.588882, 0.1882353, 1, 0, 1,
-0.5340325, 0.7632858, -0.5258753, 0.1803922, 1, 0, 1,
-0.5311803, 0.5358256, -0.5782806, 0.1764706, 1, 0, 1,
-0.5235251, 2.11802, 0.02368882, 0.1686275, 1, 0, 1,
-0.5199896, -1.879782, -2.484032, 0.1647059, 1, 0, 1,
-0.5174255, -0.5851008, -3.15972, 0.1568628, 1, 0, 1,
-0.5154227, -0.6181345, -3.873554, 0.1529412, 1, 0, 1,
-0.5127763, -0.08950768, -3.460873, 0.145098, 1, 0, 1,
-0.5119984, -0.7666872, -2.674638, 0.1411765, 1, 0, 1,
-0.5111039, -0.8259561, -3.947737, 0.1333333, 1, 0, 1,
-0.5076389, 1.500627, -1.129528, 0.1294118, 1, 0, 1,
-0.5000315, 2.165108, -0.08702078, 0.1215686, 1, 0, 1,
-0.4947751, 0.329391, -1.608538, 0.1176471, 1, 0, 1,
-0.4926289, 0.2503178, -0.1746884, 0.1098039, 1, 0, 1,
-0.4906619, 0.2383255, -0.07815296, 0.1058824, 1, 0, 1,
-0.4901747, -0.921931, -2.454144, 0.09803922, 1, 0, 1,
-0.4878833, -1.712341, -3.656116, 0.09019608, 1, 0, 1,
-0.485667, 0.6669233, -2.050309, 0.08627451, 1, 0, 1,
-0.4828501, 0.8574181, 1.018377, 0.07843138, 1, 0, 1,
-0.4707628, -1.307924, -1.922667, 0.07450981, 1, 0, 1,
-0.4699101, -1.52927, -4.983274, 0.06666667, 1, 0, 1,
-0.4680178, 0.3377737, -0.8177198, 0.0627451, 1, 0, 1,
-0.4657773, -0.08418647, -0.7242484, 0.05490196, 1, 0, 1,
-0.4612551, 0.2985026, -0.08189794, 0.05098039, 1, 0, 1,
-0.4564586, 0.5055253, -0.8142686, 0.04313726, 1, 0, 1,
-0.4541532, 1.620378, -1.280484, 0.03921569, 1, 0, 1,
-0.4532952, -0.3098547, -2.607733, 0.03137255, 1, 0, 1,
-0.4529315, -0.03888972, -1.13166, 0.02745098, 1, 0, 1,
-0.44836, 1.039685, 1.038653, 0.01960784, 1, 0, 1,
-0.4451725, 1.300841, 0.5511734, 0.01568628, 1, 0, 1,
-0.438031, -0.8436201, -2.193274, 0.007843138, 1, 0, 1,
-0.4348403, 1.337991, -0.1249064, 0.003921569, 1, 0, 1,
-0.4297906, -1.32951, -1.0664, 0, 1, 0.003921569, 1,
-0.4288355, -2.017458, -2.542203, 0, 1, 0.01176471, 1,
-0.4166103, -1.238645, -2.690989, 0, 1, 0.01568628, 1,
-0.4154358, -0.7164297, -2.750449, 0, 1, 0.02352941, 1,
-0.4111661, -0.7847288, -4.504239, 0, 1, 0.02745098, 1,
-0.4100469, -1.022589, -2.576859, 0, 1, 0.03529412, 1,
-0.4095145, 0.1861506, -1.240824, 0, 1, 0.03921569, 1,
-0.4044985, 1.060483, -0.3929323, 0, 1, 0.04705882, 1,
-0.40139, 0.7355347, -0.4108948, 0, 1, 0.05098039, 1,
-0.3968579, 0.04529286, -2.579925, 0, 1, 0.05882353, 1,
-0.390056, 0.2464668, -1.429328, 0, 1, 0.0627451, 1,
-0.3883611, -0.2980669, -2.534924, 0, 1, 0.07058824, 1,
-0.386232, 0.1923061, -1.806659, 0, 1, 0.07450981, 1,
-0.3840942, 0.006908429, -1.747711, 0, 1, 0.08235294, 1,
-0.3773393, -0.9226885, -2.109658, 0, 1, 0.08627451, 1,
-0.3762865, 0.2240632, -0.3820364, 0, 1, 0.09411765, 1,
-0.3761666, 0.9676063, -0.2134535, 0, 1, 0.1019608, 1,
-0.3749349, 1.640112, -0.638423, 0, 1, 0.1058824, 1,
-0.3698513, -0.8611244, -3.400117, 0, 1, 0.1137255, 1,
-0.3667018, -0.6845175, -2.071346, 0, 1, 0.1176471, 1,
-0.3635778, 0.9328875, 0.2879756, 0, 1, 0.1254902, 1,
-0.3596598, -0.871659, -2.52471, 0, 1, 0.1294118, 1,
-0.3592283, -0.4861097, -1.569428, 0, 1, 0.1372549, 1,
-0.358616, 0.8244408, -2.560834, 0, 1, 0.1411765, 1,
-0.354632, 1.225746, -1.393314, 0, 1, 0.1490196, 1,
-0.3519093, -0.1418839, 0.9929027, 0, 1, 0.1529412, 1,
-0.348658, 1.056846, -0.480836, 0, 1, 0.1607843, 1,
-0.3485033, 0.245077, -2.341053, 0, 1, 0.1647059, 1,
-0.3463464, 1.360727, -1.244418, 0, 1, 0.172549, 1,
-0.3417846, -1.110551, -3.777274, 0, 1, 0.1764706, 1,
-0.3394583, 0.5636763, 0.4379995, 0, 1, 0.1843137, 1,
-0.3383689, 1.380503, 0.4849707, 0, 1, 0.1882353, 1,
-0.3375641, -2.270869, -1.462017, 0, 1, 0.1960784, 1,
-0.3315779, 1.071622, 0.6257649, 0, 1, 0.2039216, 1,
-0.3308805, 0.9741221, -0.2341742, 0, 1, 0.2078431, 1,
-0.3291424, -0.5334005, -1.441038, 0, 1, 0.2156863, 1,
-0.3285247, -0.5813114, -3.383055, 0, 1, 0.2196078, 1,
-0.3284684, -1.403682, -3.263812, 0, 1, 0.227451, 1,
-0.3247311, 0.7292373, 1.294819, 0, 1, 0.2313726, 1,
-0.3239046, -0.9846419, -4.175344, 0, 1, 0.2392157, 1,
-0.3210132, 0.07518215, -1.148483, 0, 1, 0.2431373, 1,
-0.3195054, 0.9931234, -0.8267068, 0, 1, 0.2509804, 1,
-0.315922, 0.6026233, 0.3488288, 0, 1, 0.254902, 1,
-0.3155409, 0.2239577, -0.8427778, 0, 1, 0.2627451, 1,
-0.3137665, -0.8417398, -5.027453, 0, 1, 0.2666667, 1,
-0.3130462, -0.4928684, -2.800549, 0, 1, 0.2745098, 1,
-0.313032, -0.6908438, -1.808528, 0, 1, 0.2784314, 1,
-0.3127621, -0.3138265, -1.423838, 0, 1, 0.2862745, 1,
-0.310974, 0.4400612, -0.1197906, 0, 1, 0.2901961, 1,
-0.3103192, -0.7737306, -4.990448, 0, 1, 0.2980392, 1,
-0.3091919, -0.07218042, -3.622814, 0, 1, 0.3058824, 1,
-0.3087764, -0.3919002, -3.258025, 0, 1, 0.3098039, 1,
-0.3067035, 1.162142, -0.3715845, 0, 1, 0.3176471, 1,
-0.3044955, -0.02996378, -0.8520882, 0, 1, 0.3215686, 1,
-0.3009022, -0.2734562, -1.808595, 0, 1, 0.3294118, 1,
-0.2984844, -0.0803644, -1.535806, 0, 1, 0.3333333, 1,
-0.2961874, 0.9612467, -0.2279918, 0, 1, 0.3411765, 1,
-0.2934675, -1.189455, -3.323248, 0, 1, 0.345098, 1,
-0.2916556, -0.2767087, -1.47, 0, 1, 0.3529412, 1,
-0.2887618, 0.2577141, -0.006390843, 0, 1, 0.3568628, 1,
-0.2883501, 2.349028, -0.6058717, 0, 1, 0.3647059, 1,
-0.2859918, 0.3624124, 0.2010771, 0, 1, 0.3686275, 1,
-0.2848492, 0.8139999, -0.9680805, 0, 1, 0.3764706, 1,
-0.2846684, 1.126109, -1.247079, 0, 1, 0.3803922, 1,
-0.2823091, 2.378031, 0.4914526, 0, 1, 0.3882353, 1,
-0.2819144, -0.9222716, -1.522481, 0, 1, 0.3921569, 1,
-0.2772361, 1.476114, -0.0906404, 0, 1, 0.4, 1,
-0.2748397, 1.589079, 0.5862049, 0, 1, 0.4078431, 1,
-0.2748272, 0.6223886, -0.8172995, 0, 1, 0.4117647, 1,
-0.2733043, 0.5894338, -1.427293, 0, 1, 0.4196078, 1,
-0.2730632, 2.283917, 0.3825366, 0, 1, 0.4235294, 1,
-0.2679329, -1.219385, -3.837389, 0, 1, 0.4313726, 1,
-0.2620442, 0.696265, -0.7470656, 0, 1, 0.4352941, 1,
-0.2587372, -0.5729061, -2.590771, 0, 1, 0.4431373, 1,
-0.2584725, 0.9138885, 0.5101593, 0, 1, 0.4470588, 1,
-0.2566909, -1.596728, -0.9235374, 0, 1, 0.454902, 1,
-0.2559048, -0.2836664, -1.383248, 0, 1, 0.4588235, 1,
-0.2543056, -1.600989, -5.184627, 0, 1, 0.4666667, 1,
-0.2534443, -1.092692, -0.5992082, 0, 1, 0.4705882, 1,
-0.2529199, -1.431339, -4.436574, 0, 1, 0.4784314, 1,
-0.2516881, -0.7405918, -2.868609, 0, 1, 0.4823529, 1,
-0.2483375, 0.8688876, 0.1391123, 0, 1, 0.4901961, 1,
-0.2461977, 0.02264473, -2.830359, 0, 1, 0.4941176, 1,
-0.2437927, 0.9211357, 0.5463288, 0, 1, 0.5019608, 1,
-0.2366322, -0.6719604, -4.154836, 0, 1, 0.509804, 1,
-0.235403, -1.434666, -2.132332, 0, 1, 0.5137255, 1,
-0.2336668, 0.6939287, -0.3039413, 0, 1, 0.5215687, 1,
-0.231365, -2.657458, -3.26799, 0, 1, 0.5254902, 1,
-0.2305749, -1.923464, -2.058766, 0, 1, 0.5333334, 1,
-0.2272145, 0.5740973, 0.01296201, 0, 1, 0.5372549, 1,
-0.2254846, 0.1765877, -1.612732, 0, 1, 0.5450981, 1,
-0.2199311, -1.079276, -2.342677, 0, 1, 0.5490196, 1,
-0.2189505, 1.201783, -0.3288656, 0, 1, 0.5568628, 1,
-0.2183993, -0.1184766, -0.8640688, 0, 1, 0.5607843, 1,
-0.21814, 1.728838, -0.7273579, 0, 1, 0.5686275, 1,
-0.2160324, 0.02500117, -0.9779804, 0, 1, 0.572549, 1,
-0.2135676, -0.3728605, -2.146404, 0, 1, 0.5803922, 1,
-0.2122657, 0.5035577, -1.272582, 0, 1, 0.5843138, 1,
-0.2115605, -0.4197512, 0.5513549, 0, 1, 0.5921569, 1,
-0.2064178, 0.8777369, 0.5616977, 0, 1, 0.5960785, 1,
-0.203537, 0.3733782, 1.013182, 0, 1, 0.6039216, 1,
-0.2033341, 0.3227438, -0.6107892, 0, 1, 0.6117647, 1,
-0.1972904, -0.4295574, -2.508127, 0, 1, 0.6156863, 1,
-0.1961711, -0.7256128, -4.477933, 0, 1, 0.6235294, 1,
-0.1943692, -0.1851259, -1.038063, 0, 1, 0.627451, 1,
-0.189685, 1.087462, -3.303562, 0, 1, 0.6352941, 1,
-0.1892473, -0.01856738, -0.9059932, 0, 1, 0.6392157, 1,
-0.1879632, 1.449062, -0.6038287, 0, 1, 0.6470588, 1,
-0.1867921, -0.1035247, -2.147634, 0, 1, 0.6509804, 1,
-0.1853774, 0.5172392, -2.179857, 0, 1, 0.6588235, 1,
-0.1848624, 1.28558, -0.0565012, 0, 1, 0.6627451, 1,
-0.1824569, 0.05066351, -0.268426, 0, 1, 0.6705883, 1,
-0.1799655, 0.08132901, -0.9335286, 0, 1, 0.6745098, 1,
-0.1774725, 1.835185, 0.6803043, 0, 1, 0.682353, 1,
-0.1713185, -0.04785818, -1.744486, 0, 1, 0.6862745, 1,
-0.169917, 1.622959, -1.225133, 0, 1, 0.6941177, 1,
-0.1692443, 1.053423, -2.066471, 0, 1, 0.7019608, 1,
-0.1678592, 0.4893498, -1.718745, 0, 1, 0.7058824, 1,
-0.1583768, 1.008638, -0.5652829, 0, 1, 0.7137255, 1,
-0.1561965, -0.6105592, -1.42705, 0, 1, 0.7176471, 1,
-0.1506125, -0.1510945, -2.685171, 0, 1, 0.7254902, 1,
-0.1495548, 1.457191, 0.1184106, 0, 1, 0.7294118, 1,
-0.143272, 1.497415, 0.702833, 0, 1, 0.7372549, 1,
-0.1431125, -0.9621432, -3.866916, 0, 1, 0.7411765, 1,
-0.1409745, 0.5148547, -0.4749573, 0, 1, 0.7490196, 1,
-0.1406614, -1.853861, -2.614874, 0, 1, 0.7529412, 1,
-0.1309184, 0.1815105, -2.276478, 0, 1, 0.7607843, 1,
-0.1292118, 1.318917, 0.5006022, 0, 1, 0.7647059, 1,
-0.1292031, 0.06463294, -1.554797, 0, 1, 0.772549, 1,
-0.1290216, 0.9054708, -0.5481106, 0, 1, 0.7764706, 1,
-0.124889, -0.04037505, -1.28005, 0, 1, 0.7843137, 1,
-0.1245063, -0.4833017, -2.264694, 0, 1, 0.7882353, 1,
-0.1185892, -0.4446523, -4.227695, 0, 1, 0.7960784, 1,
-0.1178258, 0.3363346, 1.375182, 0, 1, 0.8039216, 1,
-0.114186, -0.3224871, -3.777038, 0, 1, 0.8078431, 1,
-0.1121168, 0.7196447, -1.356115, 0, 1, 0.8156863, 1,
-0.1106134, 0.003194421, -1.654779, 0, 1, 0.8196079, 1,
-0.1095558, 0.9352927, 0.1895927, 0, 1, 0.827451, 1,
-0.108291, 0.257112, 0.9723462, 0, 1, 0.8313726, 1,
-0.1003211, 1.921234, 1.089117, 0, 1, 0.8392157, 1,
-0.09927392, -1.065038, -2.406657, 0, 1, 0.8431373, 1,
-0.09785568, -1.047056, -4.371398, 0, 1, 0.8509804, 1,
-0.09530779, 0.01596991, -1.896486, 0, 1, 0.854902, 1,
-0.09517786, 0.4613141, 0.6703036, 0, 1, 0.8627451, 1,
-0.09513572, -1.349954, -3.990785, 0, 1, 0.8666667, 1,
-0.09004211, -0.07764717, -2.573857, 0, 1, 0.8745098, 1,
-0.08860789, 1.276223, -0.22476, 0, 1, 0.8784314, 1,
-0.08121939, -0.5138342, 0.1539551, 0, 1, 0.8862745, 1,
-0.07432929, 1.389273, 0.1917668, 0, 1, 0.8901961, 1,
-0.07275836, 2.456547, 0.5552, 0, 1, 0.8980392, 1,
-0.06830014, 1.28286, -1.469489, 0, 1, 0.9058824, 1,
-0.06776859, -0.3797102, -3.651748, 0, 1, 0.9098039, 1,
-0.06141633, -1.356569, -4.229699, 0, 1, 0.9176471, 1,
-0.05909922, -0.1721073, -2.504526, 0, 1, 0.9215686, 1,
-0.05610618, -1.223758, -5.857086, 0, 1, 0.9294118, 1,
-0.0560037, -0.9653654, -4.05084, 0, 1, 0.9333333, 1,
-0.05147664, -0.5618986, -4.158846, 0, 1, 0.9411765, 1,
-0.04471731, -0.6673678, -2.613624, 0, 1, 0.945098, 1,
-0.04175201, -1.00683, -4.111981, 0, 1, 0.9529412, 1,
-0.04164896, -0.1084612, -2.501109, 0, 1, 0.9568627, 1,
-0.0407927, 0.4158985, -0.2707103, 0, 1, 0.9647059, 1,
-0.04035999, -0.4406156, -2.872233, 0, 1, 0.9686275, 1,
-0.03968851, 0.2238196, 0.3175138, 0, 1, 0.9764706, 1,
-0.03650272, 1.005992, -0.5467892, 0, 1, 0.9803922, 1,
-0.03604747, 0.7795142, -1.905179, 0, 1, 0.9882353, 1,
-0.03602512, 1.683893, 0.01231723, 0, 1, 0.9921569, 1,
-0.03442243, -1.759599, -4.217144, 0, 1, 1, 1,
-0.02649582, 0.7541202, 0.9046982, 0, 0.9921569, 1, 1,
-0.02365637, -0.6253579, -5.155181, 0, 0.9882353, 1, 1,
-0.02211957, -1.17872, -3.345119, 0, 0.9803922, 1, 1,
-0.02146551, 0.5493749, -1.61653, 0, 0.9764706, 1, 1,
-0.01943654, 0.9570227, -0.6403509, 0, 0.9686275, 1, 1,
-0.01651945, 0.04978588, -2.009373, 0, 0.9647059, 1, 1,
-0.01434548, -0.8360736, -3.10605, 0, 0.9568627, 1, 1,
-0.01300351, -0.3704623, -1.779251, 0, 0.9529412, 1, 1,
-0.0115561, -0.1960467, -2.611687, 0, 0.945098, 1, 1,
-0.009366372, 0.3573378, -1.503305, 0, 0.9411765, 1, 1,
0.001961434, -0.03326911, 3.442342, 0, 0.9333333, 1, 1,
0.005313259, -1.295689, 3.566295, 0, 0.9294118, 1, 1,
0.01086716, -1.519683, 3.211869, 0, 0.9215686, 1, 1,
0.01724094, -0.8484248, 2.899333, 0, 0.9176471, 1, 1,
0.01743696, -0.9697088, 2.488585, 0, 0.9098039, 1, 1,
0.01810177, 0.8555254, -0.5840083, 0, 0.9058824, 1, 1,
0.01997299, -0.3300734, 3.604393, 0, 0.8980392, 1, 1,
0.02057622, 1.551928, -0.1823868, 0, 0.8901961, 1, 1,
0.02058869, -1.222981, 3.688699, 0, 0.8862745, 1, 1,
0.02249239, -0.06991211, 3.850461, 0, 0.8784314, 1, 1,
0.02261542, -0.9597183, 2.925065, 0, 0.8745098, 1, 1,
0.02605796, 0.5439419, -1.032056, 0, 0.8666667, 1, 1,
0.02902866, -0.6468903, 3.083648, 0, 0.8627451, 1, 1,
0.03034503, 0.8986862, 0.5317135, 0, 0.854902, 1, 1,
0.03196553, 2.763169, 1.122551, 0, 0.8509804, 1, 1,
0.0339771, 1.525239, -0.1931063, 0, 0.8431373, 1, 1,
0.03687943, -2.279826, 4.625787, 0, 0.8392157, 1, 1,
0.03730167, -2.420052, 2.35911, 0, 0.8313726, 1, 1,
0.03846812, -0.7291185, 2.362619, 0, 0.827451, 1, 1,
0.04553103, -0.4121189, 2.181785, 0, 0.8196079, 1, 1,
0.04691079, -1.059732, 3.544864, 0, 0.8156863, 1, 1,
0.04837919, -0.2364745, 1.639216, 0, 0.8078431, 1, 1,
0.0484742, 0.02009737, 0.1035864, 0, 0.8039216, 1, 1,
0.05134686, -0.01882524, 2.04551, 0, 0.7960784, 1, 1,
0.05436566, -0.9414157, 2.164389, 0, 0.7882353, 1, 1,
0.05567557, 0.8153394, 0.7518478, 0, 0.7843137, 1, 1,
0.06106148, -0.183459, 2.055469, 0, 0.7764706, 1, 1,
0.06207135, 0.3647126, 0.295718, 0, 0.772549, 1, 1,
0.06505102, 0.04336651, 0.7291585, 0, 0.7647059, 1, 1,
0.07299767, 1.107405, 0.2822624, 0, 0.7607843, 1, 1,
0.0760678, 0.5672665, -0.08255267, 0, 0.7529412, 1, 1,
0.07643986, -1.688876, 2.341933, 0, 0.7490196, 1, 1,
0.07768788, 1.371316, -0.3745867, 0, 0.7411765, 1, 1,
0.07924581, -0.1159545, 2.919927, 0, 0.7372549, 1, 1,
0.07933441, 0.909622, -0.1494803, 0, 0.7294118, 1, 1,
0.0794367, 1.191008, 0.03731431, 0, 0.7254902, 1, 1,
0.08249194, 2.718019, -0.4844988, 0, 0.7176471, 1, 1,
0.08601645, -0.1233805, 3.471144, 0, 0.7137255, 1, 1,
0.08703926, 0.2480925, 2.033506, 0, 0.7058824, 1, 1,
0.08982544, 0.7803194, 1.547443, 0, 0.6980392, 1, 1,
0.09326915, 0.6193448, 1.519501, 0, 0.6941177, 1, 1,
0.09530225, -1.352637, 2.359858, 0, 0.6862745, 1, 1,
0.09721548, 1.239023, 0.7011171, 0, 0.682353, 1, 1,
0.1029687, -0.2994102, 2.001806, 0, 0.6745098, 1, 1,
0.1063684, 1.520978, -0.1510588, 0, 0.6705883, 1, 1,
0.1082475, -0.6670223, 2.885951, 0, 0.6627451, 1, 1,
0.1083461, 1.042774, -0.9199558, 0, 0.6588235, 1, 1,
0.1119132, -1.854, 2.378307, 0, 0.6509804, 1, 1,
0.1162447, 0.1929885, 0.3510973, 0, 0.6470588, 1, 1,
0.1167294, 0.2494449, -0.3975479, 0, 0.6392157, 1, 1,
0.1232402, 0.9345652, 0.7188849, 0, 0.6352941, 1, 1,
0.1310262, -1.239503, 4.044036, 0, 0.627451, 1, 1,
0.1370539, -0.2053665, 2.657776, 0, 0.6235294, 1, 1,
0.1403052, 0.8727019, 0.07477563, 0, 0.6156863, 1, 1,
0.1483314, -0.5427501, 3.205823, 0, 0.6117647, 1, 1,
0.1497599, 0.7167437, -0.4714807, 0, 0.6039216, 1, 1,
0.1576575, 0.4397265, -0.2572504, 0, 0.5960785, 1, 1,
0.1585638, 0.1928895, 0.8237873, 0, 0.5921569, 1, 1,
0.1588482, 0.3124215, -0.2071928, 0, 0.5843138, 1, 1,
0.161159, -0.3916866, 3.351345, 0, 0.5803922, 1, 1,
0.1680073, -1.297154, 1.649547, 0, 0.572549, 1, 1,
0.1718294, -0.1193368, 1.768732, 0, 0.5686275, 1, 1,
0.1723129, 0.7332674, 1.864334, 0, 0.5607843, 1, 1,
0.1770547, -0.8525594, 4.034336, 0, 0.5568628, 1, 1,
0.1792783, -0.4866797, 3.401612, 0, 0.5490196, 1, 1,
0.183872, 1.47419, 0.2645915, 0, 0.5450981, 1, 1,
0.185379, 1.002312, 1.571107, 0, 0.5372549, 1, 1,
0.1854102, 1.21559, 0.124478, 0, 0.5333334, 1, 1,
0.1855031, 1.573472, 1.60118, 0, 0.5254902, 1, 1,
0.1873342, 0.9437761, 0.5147393, 0, 0.5215687, 1, 1,
0.1897959, 0.142489, -0.1271611, 0, 0.5137255, 1, 1,
0.1924063, 1.295543, -0.04245925, 0, 0.509804, 1, 1,
0.1960767, 1.160088, 0.6378148, 0, 0.5019608, 1, 1,
0.2010871, -0.0123579, 2.266534, 0, 0.4941176, 1, 1,
0.2027566, -0.3849186, 1.80179, 0, 0.4901961, 1, 1,
0.2033222, -0.2662587, 2.144769, 0, 0.4823529, 1, 1,
0.2057531, 0.04580009, 3.799844, 0, 0.4784314, 1, 1,
0.2098778, -0.5291336, 2.553878, 0, 0.4705882, 1, 1,
0.2104989, -0.1989304, 2.270636, 0, 0.4666667, 1, 1,
0.2119841, 0.4455502, -1.526921, 0, 0.4588235, 1, 1,
0.2132108, 0.1193702, 1.257862, 0, 0.454902, 1, 1,
0.2163473, -0.3074218, 1.321814, 0, 0.4470588, 1, 1,
0.2197481, -0.02488407, 0.962132, 0, 0.4431373, 1, 1,
0.2209089, -1.224899, 4.186955, 0, 0.4352941, 1, 1,
0.2209594, -2.294766, 2.77253, 0, 0.4313726, 1, 1,
0.2216644, -0.01232885, 0.991141, 0, 0.4235294, 1, 1,
0.2232459, -1.06917, 2.437207, 0, 0.4196078, 1, 1,
0.2294689, -0.1386297, 2.698302, 0, 0.4117647, 1, 1,
0.2327462, 0.7754223, 0.01811349, 0, 0.4078431, 1, 1,
0.2337579, -0.1267868, 0.02169498, 0, 0.4, 1, 1,
0.2383686, 2.024256, 0.3925643, 0, 0.3921569, 1, 1,
0.2418067, 1.540588, 1.046354, 0, 0.3882353, 1, 1,
0.2452237, 0.006841731, 2.436926, 0, 0.3803922, 1, 1,
0.2454377, 0.6674062, -0.6736803, 0, 0.3764706, 1, 1,
0.2589174, 1.264547, 1.138909, 0, 0.3686275, 1, 1,
0.2620403, -0.5467095, 3.216014, 0, 0.3647059, 1, 1,
0.2711566, 0.5579146, 1.311082, 0, 0.3568628, 1, 1,
0.2725624, -1.992159, 4.220503, 0, 0.3529412, 1, 1,
0.2792474, -1.86099, 2.170863, 0, 0.345098, 1, 1,
0.2861432, -1.057317, 2.009407, 0, 0.3411765, 1, 1,
0.2872762, 0.09979458, 0.8804718, 0, 0.3333333, 1, 1,
0.2895019, 0.528273, -0.3525163, 0, 0.3294118, 1, 1,
0.2895465, 1.726412, 1.599754, 0, 0.3215686, 1, 1,
0.2946061, -0.8405628, 1.831696, 0, 0.3176471, 1, 1,
0.3009582, 0.4644462, 0.6860638, 0, 0.3098039, 1, 1,
0.3010219, -1.342591, 3.727559, 0, 0.3058824, 1, 1,
0.3017392, 1.20019, 0.277799, 0, 0.2980392, 1, 1,
0.3078777, 0.2852086, 0.260455, 0, 0.2901961, 1, 1,
0.3091942, -1.839606, 2.283251, 0, 0.2862745, 1, 1,
0.3112376, 0.5425144, -0.5675971, 0, 0.2784314, 1, 1,
0.3160033, 0.6536821, -0.4708516, 0, 0.2745098, 1, 1,
0.3190992, -1.24999, 1.545205, 0, 0.2666667, 1, 1,
0.3212685, 0.38406, 0.2979985, 0, 0.2627451, 1, 1,
0.3232634, 0.2955986, 2.585542, 0, 0.254902, 1, 1,
0.323746, 0.8070943, 0.4478534, 0, 0.2509804, 1, 1,
0.3278107, 0.02943375, 2.546074, 0, 0.2431373, 1, 1,
0.3326221, 0.4941281, 0.7046743, 0, 0.2392157, 1, 1,
0.3342123, 0.03396399, 2.008183, 0, 0.2313726, 1, 1,
0.3352679, 0.7253183, -0.5014266, 0, 0.227451, 1, 1,
0.3353796, 0.8549851, 0.5680638, 0, 0.2196078, 1, 1,
0.3373362, 1.61979, 0.4632358, 0, 0.2156863, 1, 1,
0.3378639, 0.03468604, 1.505046, 0, 0.2078431, 1, 1,
0.3389626, 1.921644, 0.836731, 0, 0.2039216, 1, 1,
0.3392653, -0.1312064, 2.926796, 0, 0.1960784, 1, 1,
0.339757, -0.06620043, 2.664387, 0, 0.1882353, 1, 1,
0.340322, 0.1237862, 0.5803621, 0, 0.1843137, 1, 1,
0.3466461, 2.290035, -0.7102578, 0, 0.1764706, 1, 1,
0.3479534, -0.2065792, 0.6137622, 0, 0.172549, 1, 1,
0.3512231, 0.2455614, 0.8569015, 0, 0.1647059, 1, 1,
0.3524609, 0.2670056, -0.1141168, 0, 0.1607843, 1, 1,
0.3539929, 0.8297899, 1.804642, 0, 0.1529412, 1, 1,
0.3547036, 1.482623, -0.2995856, 0, 0.1490196, 1, 1,
0.3548622, 0.1085652, 1.807442, 0, 0.1411765, 1, 1,
0.3551782, 0.1619743, 1.166023, 0, 0.1372549, 1, 1,
0.356266, -0.7640949, 2.186511, 0, 0.1294118, 1, 1,
0.357343, -0.2099278, 3.008563, 0, 0.1254902, 1, 1,
0.3641954, -0.6830251, 3.004874, 0, 0.1176471, 1, 1,
0.3660979, -0.4199626, 3.124629, 0, 0.1137255, 1, 1,
0.3666671, 0.03204203, 1.024693, 0, 0.1058824, 1, 1,
0.368282, -0.4757068, 1.451222, 0, 0.09803922, 1, 1,
0.369128, 0.1279828, 0.2006244, 0, 0.09411765, 1, 1,
0.3700137, 0.8050896, -0.2125417, 0, 0.08627451, 1, 1,
0.3752148, -0.7451685, 3.45752, 0, 0.08235294, 1, 1,
0.3889746, -0.4939607, 2.533941, 0, 0.07450981, 1, 1,
0.3910863, -1.225135, 2.691989, 0, 0.07058824, 1, 1,
0.3946827, 0.8363249, 0.6558959, 0, 0.0627451, 1, 1,
0.397725, -0.04425323, 1.966689, 0, 0.05882353, 1, 1,
0.4006217, -2.047679, 5.526091, 0, 0.05098039, 1, 1,
0.4028766, -0.07350155, 1.411243, 0, 0.04705882, 1, 1,
0.4086777, -1.298174, 3.669914, 0, 0.03921569, 1, 1,
0.410353, 0.4481286, 1.130174, 0, 0.03529412, 1, 1,
0.4114225, 0.4018884, 1.673184, 0, 0.02745098, 1, 1,
0.4118134, 0.3776514, 1.860011, 0, 0.02352941, 1, 1,
0.4129404, -3.300108, 3.954482, 0, 0.01568628, 1, 1,
0.4150229, -2.033344, 3.127905, 0, 0.01176471, 1, 1,
0.4174958, -2.23721, 3.332857, 0, 0.003921569, 1, 1,
0.4184053, -1.043927, 3.281693, 0.003921569, 0, 1, 1,
0.4261421, 0.6664655, 1.749141, 0.007843138, 0, 1, 1,
0.4330481, 0.2898221, 3.137204, 0.01568628, 0, 1, 1,
0.4369541, 0.5576087, 1.346992, 0.01960784, 0, 1, 1,
0.4373381, -1.050429, 0.611069, 0.02745098, 0, 1, 1,
0.4420664, -0.5571905, 3.91133, 0.03137255, 0, 1, 1,
0.442435, -1.066857, 2.625026, 0.03921569, 0, 1, 1,
0.4431819, 0.4632751, 1.151853, 0.04313726, 0, 1, 1,
0.4432421, 2.313462, -1.587729, 0.05098039, 0, 1, 1,
0.4483415, 1.887632, 1.118128, 0.05490196, 0, 1, 1,
0.4552072, -0.02774402, 2.467111, 0.0627451, 0, 1, 1,
0.4572944, -0.4312137, 1.4741, 0.06666667, 0, 1, 1,
0.4582902, 0.2129696, 1.384761, 0.07450981, 0, 1, 1,
0.4637848, -0.299879, 1.970652, 0.07843138, 0, 1, 1,
0.4649134, 0.3216242, -0.4935385, 0.08627451, 0, 1, 1,
0.4650752, 0.3227485, 1.396271, 0.09019608, 0, 1, 1,
0.4662708, 1.110268, -0.2362428, 0.09803922, 0, 1, 1,
0.4681924, -0.2635351, 2.653513, 0.1058824, 0, 1, 1,
0.473961, 1.748813, 0.05204161, 0.1098039, 0, 1, 1,
0.4741901, -0.2532891, -0.3894115, 0.1176471, 0, 1, 1,
0.4777856, 0.315278, 1.493714, 0.1215686, 0, 1, 1,
0.4807741, -2.054905, 1.682701, 0.1294118, 0, 1, 1,
0.4950536, -0.2711785, 2.477523, 0.1333333, 0, 1, 1,
0.5020192, -0.03794475, 0.7423483, 0.1411765, 0, 1, 1,
0.5040289, -1.329595, 2.282774, 0.145098, 0, 1, 1,
0.5043589, -1.416577, 1.520833, 0.1529412, 0, 1, 1,
0.5104785, 0.4337121, 1.328798, 0.1568628, 0, 1, 1,
0.5129295, -1.105928, 4.083673, 0.1647059, 0, 1, 1,
0.5152029, 2.562177, 2.775105, 0.1686275, 0, 1, 1,
0.5172365, -0.9687811, 2.271849, 0.1764706, 0, 1, 1,
0.5221872, -0.1079834, 1.26506, 0.1803922, 0, 1, 1,
0.5227157, -0.42854, 1.499559, 0.1882353, 0, 1, 1,
0.527477, -0.8654547, 2.736704, 0.1921569, 0, 1, 1,
0.5287051, -0.06995842, 1.481089, 0.2, 0, 1, 1,
0.5287903, 1.373975, 0.6788279, 0.2078431, 0, 1, 1,
0.529191, -0.09934046, 0.5030165, 0.2117647, 0, 1, 1,
0.5319495, 0.4360842, -0.6290496, 0.2196078, 0, 1, 1,
0.5340424, -0.5491815, 2.855089, 0.2235294, 0, 1, 1,
0.538838, -1.413847, 2.791164, 0.2313726, 0, 1, 1,
0.5401378, -0.3773615, 1.581708, 0.2352941, 0, 1, 1,
0.5504265, 0.4557512, 2.748235, 0.2431373, 0, 1, 1,
0.5507136, -1.509528, 1.799, 0.2470588, 0, 1, 1,
0.5529507, -0.04810722, 1.296202, 0.254902, 0, 1, 1,
0.5655018, -2.047508, 4.051109, 0.2588235, 0, 1, 1,
0.5679614, 0.3273408, 1.445691, 0.2666667, 0, 1, 1,
0.5715457, -1.267084, 6.803843, 0.2705882, 0, 1, 1,
0.5731651, -2.052698, 1.54033, 0.2784314, 0, 1, 1,
0.5753913, -0.6766217, 3.366859, 0.282353, 0, 1, 1,
0.5756234, 1.002889, 1.438318, 0.2901961, 0, 1, 1,
0.578311, -0.6905909, 2.616461, 0.2941177, 0, 1, 1,
0.5888758, -0.2414788, 3.844397, 0.3019608, 0, 1, 1,
0.5889573, 0.5858342, 0.1905742, 0.3098039, 0, 1, 1,
0.5906502, -0.2754853, 1.250069, 0.3137255, 0, 1, 1,
0.593605, 0.0870555, 2.856591, 0.3215686, 0, 1, 1,
0.5943142, 0.6074539, 1.42683, 0.3254902, 0, 1, 1,
0.5947815, 1.921835, -0.06996655, 0.3333333, 0, 1, 1,
0.6019394, 0.5308524, 0.7221385, 0.3372549, 0, 1, 1,
0.6019927, -1.846964, 3.549335, 0.345098, 0, 1, 1,
0.6023869, 0.5365285, 1.250002, 0.3490196, 0, 1, 1,
0.6046175, -2.115918, 2.749447, 0.3568628, 0, 1, 1,
0.6053392, 0.5773719, 0.3105906, 0.3607843, 0, 1, 1,
0.6056444, 0.9707212, -1.425478, 0.3686275, 0, 1, 1,
0.6060556, -1.845532, 2.131641, 0.372549, 0, 1, 1,
0.606967, 0.5881355, -0.8126871, 0.3803922, 0, 1, 1,
0.6094339, -0.2529365, 1.566182, 0.3843137, 0, 1, 1,
0.6118006, -1.534767, 1.986914, 0.3921569, 0, 1, 1,
0.6150231, 1.869548, 1.371044, 0.3960784, 0, 1, 1,
0.6166036, -2.785444, 1.64227, 0.4039216, 0, 1, 1,
0.6217075, -0.8099123, 2.83647, 0.4117647, 0, 1, 1,
0.6218541, -0.3560148, 3.269919, 0.4156863, 0, 1, 1,
0.6248831, 0.2884598, 2.120105, 0.4235294, 0, 1, 1,
0.6249351, 0.1548057, -0.0007993835, 0.427451, 0, 1, 1,
0.6344857, -0.2569546, 2.028483, 0.4352941, 0, 1, 1,
0.6356788, 0.6946569, -1.11292, 0.4392157, 0, 1, 1,
0.636621, -1.788806, 3.681756, 0.4470588, 0, 1, 1,
0.6400002, -1.402306, 2.24032, 0.4509804, 0, 1, 1,
0.6464685, -0.2183478, 1.644748, 0.4588235, 0, 1, 1,
0.6473839, -1.41652, 2.821221, 0.4627451, 0, 1, 1,
0.6503971, 0.7035729, 2.454516, 0.4705882, 0, 1, 1,
0.6532758, -1.789441, 4.075004, 0.4745098, 0, 1, 1,
0.6563227, -0.6076351, 2.986011, 0.4823529, 0, 1, 1,
0.6629057, -0.6232933, 1.913269, 0.4862745, 0, 1, 1,
0.662989, 0.1548695, 1.653612, 0.4941176, 0, 1, 1,
0.6648048, -0.8168926, 4.333014, 0.5019608, 0, 1, 1,
0.6693144, -1.091838, 2.275857, 0.5058824, 0, 1, 1,
0.6696738, -0.650404, 3.131031, 0.5137255, 0, 1, 1,
0.6705052, -1.171241, 2.745528, 0.5176471, 0, 1, 1,
0.6733205, -0.3293763, 3.349242, 0.5254902, 0, 1, 1,
0.6770261, -0.5791794, 3.124535, 0.5294118, 0, 1, 1,
0.6787914, 0.4283192, 0.9108217, 0.5372549, 0, 1, 1,
0.6822551, 0.1750727, 0.759525, 0.5411765, 0, 1, 1,
0.685437, -1.350281, 3.878968, 0.5490196, 0, 1, 1,
0.685943, -0.6553072, 2.049257, 0.5529412, 0, 1, 1,
0.6940519, -0.8725626, 3.047334, 0.5607843, 0, 1, 1,
0.6965351, -1.365535, 4.170078, 0.5647059, 0, 1, 1,
0.6981453, -0.5684478, 2.170341, 0.572549, 0, 1, 1,
0.6997822, 0.6268898, 2.715499, 0.5764706, 0, 1, 1,
0.7001124, 1.333585, 1.27209, 0.5843138, 0, 1, 1,
0.7038805, 0.0828082, 0.4618862, 0.5882353, 0, 1, 1,
0.7060823, -0.7257924, 0.9657175, 0.5960785, 0, 1, 1,
0.7069402, 0.8663484, 0.9059184, 0.6039216, 0, 1, 1,
0.7088649, 0.5680138, 0.6907776, 0.6078432, 0, 1, 1,
0.7111359, -1.138409, 3.161566, 0.6156863, 0, 1, 1,
0.7119622, 1.162624, 0.4303142, 0.6196079, 0, 1, 1,
0.7150777, -0.7387428, 2.793317, 0.627451, 0, 1, 1,
0.7158744, -0.09205396, 2.891236, 0.6313726, 0, 1, 1,
0.7177813, -0.005746117, 2.996966, 0.6392157, 0, 1, 1,
0.7227878, -2.077328, 2.318546, 0.6431373, 0, 1, 1,
0.7236999, 0.05545432, 1.40547, 0.6509804, 0, 1, 1,
0.7264797, 0.008502757, 1.552738, 0.654902, 0, 1, 1,
0.7271359, 0.1345562, 1.149911, 0.6627451, 0, 1, 1,
0.7349737, -0.1874317, 2.267146, 0.6666667, 0, 1, 1,
0.7382286, -0.03390183, 1.284754, 0.6745098, 0, 1, 1,
0.7427689, 0.00470438, 2.797143, 0.6784314, 0, 1, 1,
0.7486525, -1.410804, 2.504355, 0.6862745, 0, 1, 1,
0.7500018, -1.6641, 3.069434, 0.6901961, 0, 1, 1,
0.7504029, 0.6831008, 0.6652547, 0.6980392, 0, 1, 1,
0.7529418, 1.194124, -0.8528403, 0.7058824, 0, 1, 1,
0.7602593, 0.2513338, 1.470527, 0.7098039, 0, 1, 1,
0.7608812, -1.038135, 2.880062, 0.7176471, 0, 1, 1,
0.7608814, -0.09887435, 1.602876, 0.7215686, 0, 1, 1,
0.7686266, -0.8825822, 1.952664, 0.7294118, 0, 1, 1,
0.7740192, -0.1548826, 1.176124, 0.7333333, 0, 1, 1,
0.7767496, 0.1397796, 1.366275, 0.7411765, 0, 1, 1,
0.7780344, -0.568154, 2.110039, 0.7450981, 0, 1, 1,
0.7782345, -0.5864626, 2.94501, 0.7529412, 0, 1, 1,
0.7874182, 0.08060465, 1.26455, 0.7568628, 0, 1, 1,
0.7882992, -1.032663, 3.839226, 0.7647059, 0, 1, 1,
0.7921498, -1.661379, 2.688347, 0.7686275, 0, 1, 1,
0.793569, -0.7453877, 2.716076, 0.7764706, 0, 1, 1,
0.8004982, 0.920103, 1.726756, 0.7803922, 0, 1, 1,
0.8009828, 0.4993875, 0.9114494, 0.7882353, 0, 1, 1,
0.8039812, -0.6459725, 1.792938, 0.7921569, 0, 1, 1,
0.8077546, -1.289929, 3.337025, 0.8, 0, 1, 1,
0.8173838, 0.1494402, 1.306458, 0.8078431, 0, 1, 1,
0.827845, 1.356992, -0.3950046, 0.8117647, 0, 1, 1,
0.8294035, 0.3554944, -0.1074478, 0.8196079, 0, 1, 1,
0.8294562, -0.6146241, 2.696464, 0.8235294, 0, 1, 1,
0.8307565, 0.1105318, 2.643944, 0.8313726, 0, 1, 1,
0.8333211, -0.8006058, 3.259227, 0.8352941, 0, 1, 1,
0.8363271, 0.1407497, 2.357091, 0.8431373, 0, 1, 1,
0.8432946, -1.066506, 1.785415, 0.8470588, 0, 1, 1,
0.8447118, -0.7437077, 0.7945212, 0.854902, 0, 1, 1,
0.8490998, -0.3280529, 1.997056, 0.8588235, 0, 1, 1,
0.8561421, -0.2667138, 2.106073, 0.8666667, 0, 1, 1,
0.861286, -0.4615517, 1.610074, 0.8705882, 0, 1, 1,
0.8625333, -0.4576919, 2.613344, 0.8784314, 0, 1, 1,
0.8626903, -0.6766741, 1.833991, 0.8823529, 0, 1, 1,
0.8662363, 0.4778682, 1.810344, 0.8901961, 0, 1, 1,
0.8757526, -0.1422956, 0.7805687, 0.8941177, 0, 1, 1,
0.8883098, -1.542429, 2.935978, 0.9019608, 0, 1, 1,
0.8899222, -1.043438, 1.384592, 0.9098039, 0, 1, 1,
0.8900064, 0.3279623, 2.078379, 0.9137255, 0, 1, 1,
0.8998491, -1.679476, 2.988642, 0.9215686, 0, 1, 1,
0.9014426, 0.5865861, 0.4584236, 0.9254902, 0, 1, 1,
0.9045435, 1.08324, 0.7651281, 0.9333333, 0, 1, 1,
0.9144617, 0.2060355, 0.5753122, 0.9372549, 0, 1, 1,
0.9181775, -0.7645488, 1.876513, 0.945098, 0, 1, 1,
0.9221972, 1.045737, -0.02912142, 0.9490196, 0, 1, 1,
0.9240047, 1.20934, 0.9912121, 0.9568627, 0, 1, 1,
0.9303384, 1.358163, 2.280368, 0.9607843, 0, 1, 1,
0.9358779, -0.7336016, 3.786272, 0.9686275, 0, 1, 1,
0.9364887, -0.8861813, 2.553994, 0.972549, 0, 1, 1,
0.9402313, -0.2202256, 2.156275, 0.9803922, 0, 1, 1,
0.9423558, -1.024766, 1.416892, 0.9843137, 0, 1, 1,
0.9470316, 0.9093488, -0.09940743, 0.9921569, 0, 1, 1,
0.9515015, -1.11852, 4.361807, 0.9960784, 0, 1, 1,
0.9553378, 0.1035801, 1.919231, 1, 0, 0.9960784, 1,
0.9568102, 0.3608318, -0.3507813, 1, 0, 0.9882353, 1,
0.9708879, -2.476863, 3.79792, 1, 0, 0.9843137, 1,
0.9720084, -0.9110495, 3.518929, 1, 0, 0.9764706, 1,
0.9800994, 0.5719775, 0.3842532, 1, 0, 0.972549, 1,
0.9835364, -0.5969476, 1.289461, 1, 0, 0.9647059, 1,
0.9835712, 0.1388605, 1.002646, 1, 0, 0.9607843, 1,
0.9903471, -1.0958, 1.483072, 1, 0, 0.9529412, 1,
0.9923219, 0.9819396, 1.60361, 1, 0, 0.9490196, 1,
0.9936225, 0.3171659, 1.619689, 1, 0, 0.9411765, 1,
0.9943414, -0.8001441, 2.191572, 1, 0, 0.9372549, 1,
0.9974502, 0.5663024, -0.001793648, 1, 0, 0.9294118, 1,
0.9981351, -0.8254045, 2.836349, 1, 0, 0.9254902, 1,
1.007741, -1.130305, 2.225364, 1, 0, 0.9176471, 1,
1.014886, -0.1449882, -0.04882546, 1, 0, 0.9137255, 1,
1.015788, 1.491794, -0.01259046, 1, 0, 0.9058824, 1,
1.01801, 1.449112, 0.4369012, 1, 0, 0.9019608, 1,
1.02039, -1.355898, 2.253246, 1, 0, 0.8941177, 1,
1.029314, -0.7071235, 2.289163, 1, 0, 0.8862745, 1,
1.036456, -0.1026338, 0.8078837, 1, 0, 0.8823529, 1,
1.038274, -2.457685, 2.791963, 1, 0, 0.8745098, 1,
1.04297, 1.557529, 0.604259, 1, 0, 0.8705882, 1,
1.04758, -1.382619, 3.684109, 1, 0, 0.8627451, 1,
1.048582, -0.8509986, 2.779623, 1, 0, 0.8588235, 1,
1.05139, 1.756445, 1.66207, 1, 0, 0.8509804, 1,
1.066333, -0.06436601, 1.884913, 1, 0, 0.8470588, 1,
1.088491, -0.4464109, 1.307197, 1, 0, 0.8392157, 1,
1.089716, -0.8528862, 2.311907, 1, 0, 0.8352941, 1,
1.091912, -0.7175388, 1.201632, 1, 0, 0.827451, 1,
1.093626, -0.9568104, 2.278659, 1, 0, 0.8235294, 1,
1.097222, 0.0677181, 1.86551, 1, 0, 0.8156863, 1,
1.100569, 0.9857878, 1.778692, 1, 0, 0.8117647, 1,
1.103661, 0.8075612, 1.780834, 1, 0, 0.8039216, 1,
1.112856, 1.791009, -0.9026768, 1, 0, 0.7960784, 1,
1.121111, -0.7033018, 2.930386, 1, 0, 0.7921569, 1,
1.121393, 0.7023342, 1.185812, 1, 0, 0.7843137, 1,
1.126696, 0.4077533, 1.256208, 1, 0, 0.7803922, 1,
1.131596, -1.395296, 2.148657, 1, 0, 0.772549, 1,
1.145885, -1.202708, 1.087771, 1, 0, 0.7686275, 1,
1.147069, -1.281169, 3.156238, 1, 0, 0.7607843, 1,
1.149703, 0.2070376, 3.820492, 1, 0, 0.7568628, 1,
1.149753, -1.677403, 4.407881, 1, 0, 0.7490196, 1,
1.150307, 0.07348945, 0.5850952, 1, 0, 0.7450981, 1,
1.153175, -0.9846693, 2.216449, 1, 0, 0.7372549, 1,
1.157052, -0.9609753, 3.45928, 1, 0, 0.7333333, 1,
1.162845, 0.7092109, 1.074217, 1, 0, 0.7254902, 1,
1.176195, -0.3540465, 0.2687846, 1, 0, 0.7215686, 1,
1.180851, -1.47478, 3.087715, 1, 0, 0.7137255, 1,
1.187541, -0.3841089, 1.481443, 1, 0, 0.7098039, 1,
1.190577, -0.500967, 2.334302, 1, 0, 0.7019608, 1,
1.19301, 0.5591151, -0.6393452, 1, 0, 0.6941177, 1,
1.194099, -0.2486421, 2.100991, 1, 0, 0.6901961, 1,
1.198123, -0.2366881, 1.481683, 1, 0, 0.682353, 1,
1.204553, 0.5771016, 0.7993674, 1, 0, 0.6784314, 1,
1.209195, 0.6089095, 1.169445, 1, 0, 0.6705883, 1,
1.220802, -0.223879, 0.2731664, 1, 0, 0.6666667, 1,
1.221034, -0.93381, 0.8473121, 1, 0, 0.6588235, 1,
1.226611, -1.010499, 2.261042, 1, 0, 0.654902, 1,
1.24347, -1.232176, 2.520219, 1, 0, 0.6470588, 1,
1.247456, -0.7701378, 1.79863, 1, 0, 0.6431373, 1,
1.250007, 0.7148301, -0.06381488, 1, 0, 0.6352941, 1,
1.251325, 0.3868271, 3.087817, 1, 0, 0.6313726, 1,
1.252905, 1.195627, 0.9052657, 1, 0, 0.6235294, 1,
1.254381, -0.2941756, 1.645356, 1, 0, 0.6196079, 1,
1.26625, 0.1381102, 0.9040943, 1, 0, 0.6117647, 1,
1.27104, -1.270255, 2.903357, 1, 0, 0.6078432, 1,
1.273482, 0.01315019, 1.490253, 1, 0, 0.6, 1,
1.284618, 0.67199, 1.367309, 1, 0, 0.5921569, 1,
1.296908, -0.3353468, 1.838091, 1, 0, 0.5882353, 1,
1.299158, 0.6187615, 0.3614771, 1, 0, 0.5803922, 1,
1.299883, -0.7889586, 2.009202, 1, 0, 0.5764706, 1,
1.307051, -0.5075837, 3.121047, 1, 0, 0.5686275, 1,
1.311549, 1.343375, 0.5251593, 1, 0, 0.5647059, 1,
1.32039, 0.7841339, -0.4886183, 1, 0, 0.5568628, 1,
1.331506, 1.162812, -2.466369, 1, 0, 0.5529412, 1,
1.331584, -0.2158694, 2.975516, 1, 0, 0.5450981, 1,
1.331608, 0.8326151, -0.4473217, 1, 0, 0.5411765, 1,
1.332807, -0.6905063, 2.17143, 1, 0, 0.5333334, 1,
1.336071, -0.06159541, 0.8317198, 1, 0, 0.5294118, 1,
1.352607, -0.1634453, -0.1430546, 1, 0, 0.5215687, 1,
1.35405, -0.5734502, 2.401052, 1, 0, 0.5176471, 1,
1.364016, 2.173734, 0.3442492, 1, 0, 0.509804, 1,
1.366433, 0.07414233, 1.269786, 1, 0, 0.5058824, 1,
1.388044, -1.688249, 1.303426, 1, 0, 0.4980392, 1,
1.388904, -2.359902, 2.633579, 1, 0, 0.4901961, 1,
1.390329, 1.167557, -0.2424565, 1, 0, 0.4862745, 1,
1.401072, -1.351229, 2.887326, 1, 0, 0.4784314, 1,
1.401288, 2.535262, -0.9131012, 1, 0, 0.4745098, 1,
1.406087, 0.659629, 2.449032, 1, 0, 0.4666667, 1,
1.409078, -1.127064, 3.712419, 1, 0, 0.4627451, 1,
1.416312, 0.2031155, 2.770584, 1, 0, 0.454902, 1,
1.421419, -0.3867937, 2.251422, 1, 0, 0.4509804, 1,
1.43067, -0.828315, 1.008821, 1, 0, 0.4431373, 1,
1.439296, -0.3718218, 0.3661116, 1, 0, 0.4392157, 1,
1.449661, -0.3580371, 0.08707619, 1, 0, 0.4313726, 1,
1.452323, -1.570369, 3.427762, 1, 0, 0.427451, 1,
1.460385, -0.2586962, 2.048576, 1, 0, 0.4196078, 1,
1.468771, -0.3892971, 2.848341, 1, 0, 0.4156863, 1,
1.477604, 0.5361231, -0.2568844, 1, 0, 0.4078431, 1,
1.492665, 0.813633, 2.301043, 1, 0, 0.4039216, 1,
1.492742, -0.9163125, 4.056512, 1, 0, 0.3960784, 1,
1.495969, -0.4520376, 2.334305, 1, 0, 0.3882353, 1,
1.49678, 0.1104646, 1.490328, 1, 0, 0.3843137, 1,
1.504465, -0.002464551, 0.8545873, 1, 0, 0.3764706, 1,
1.523697, 0.9797997, 1.412252, 1, 0, 0.372549, 1,
1.534591, 0.9995693, -0.2560452, 1, 0, 0.3647059, 1,
1.537455, -0.01089347, 0.7547171, 1, 0, 0.3607843, 1,
1.538973, 1.035943, 1.654061, 1, 0, 0.3529412, 1,
1.546664, -0.8159152, 2.145616, 1, 0, 0.3490196, 1,
1.557601, -1.359572, 2.292098, 1, 0, 0.3411765, 1,
1.580548, -0.9675494, 3.997815, 1, 0, 0.3372549, 1,
1.586219, 0.7506335, 1.287754, 1, 0, 0.3294118, 1,
1.602826, -0.08290404, 1.651221, 1, 0, 0.3254902, 1,
1.628462, 0.06987895, 0.4944687, 1, 0, 0.3176471, 1,
1.639512, -0.07683767, 0.994476, 1, 0, 0.3137255, 1,
1.650459, -0.9651172, 1.1081, 1, 0, 0.3058824, 1,
1.656286, -0.3727793, 1.862678, 1, 0, 0.2980392, 1,
1.657641, -0.05148776, 2.415864, 1, 0, 0.2941177, 1,
1.658591, 1.564663, -0.3678334, 1, 0, 0.2862745, 1,
1.674598, 0.9643524, 1.954836, 1, 0, 0.282353, 1,
1.680092, -3.706994, 3.346892, 1, 0, 0.2745098, 1,
1.690975, -0.08212069, 0.6284406, 1, 0, 0.2705882, 1,
1.69832, 0.4345948, 0.5249653, 1, 0, 0.2627451, 1,
1.710115, 0.6232123, 1.120169, 1, 0, 0.2588235, 1,
1.729504, 0.9049013, 0.7961423, 1, 0, 0.2509804, 1,
1.730831, 1.309385, 0.8809866, 1, 0, 0.2470588, 1,
1.748326, 0.7257949, 0.4176522, 1, 0, 0.2392157, 1,
1.753711, 0.1204243, -0.7604262, 1, 0, 0.2352941, 1,
1.756015, 0.05613284, 2.071784, 1, 0, 0.227451, 1,
1.757423, 1.056109, 1.697494, 1, 0, 0.2235294, 1,
1.759807, 0.9654287, 0.6693352, 1, 0, 0.2156863, 1,
1.768695, 2.00393, 0.05336947, 1, 0, 0.2117647, 1,
1.781415, 0.217598, 2.241503, 1, 0, 0.2039216, 1,
1.790318, -0.04955958, 0.5223792, 1, 0, 0.1960784, 1,
1.820706, -0.3975662, 0.8385733, 1, 0, 0.1921569, 1,
1.862402, -1.471008, 2.183146, 1, 0, 0.1843137, 1,
1.871282, 0.5827482, -0.6383457, 1, 0, 0.1803922, 1,
1.878037, -2.708802, 2.314244, 1, 0, 0.172549, 1,
1.883201, 1.104514, 0.5976083, 1, 0, 0.1686275, 1,
1.933573, -0.6958597, 0.7128923, 1, 0, 0.1607843, 1,
1.938714, 0.04496285, 1.357805, 1, 0, 0.1568628, 1,
1.983483, 1.077478, 0.8063256, 1, 0, 0.1490196, 1,
1.994342, -2.192737, 3.928892, 1, 0, 0.145098, 1,
2.057182, 0.04406317, 0.8899966, 1, 0, 0.1372549, 1,
2.061386, -0.8182577, 3.189435, 1, 0, 0.1333333, 1,
2.082825, 0.5189644, -0.1391602, 1, 0, 0.1254902, 1,
2.088639, 0.3464682, 0.06492914, 1, 0, 0.1215686, 1,
2.099221, -0.6883634, 3.461466, 1, 0, 0.1137255, 1,
2.101357, 0.008720068, 4.384614, 1, 0, 0.1098039, 1,
2.111693, -0.4625243, 1.141204, 1, 0, 0.1019608, 1,
2.129748, 0.4243242, 1.717194, 1, 0, 0.09411765, 1,
2.134633, 0.1128788, 0.8851712, 1, 0, 0.09019608, 1,
2.205266, -0.6899563, 2.279966, 1, 0, 0.08235294, 1,
2.240285, -0.04627434, 2.183874, 1, 0, 0.07843138, 1,
2.254513, 2.529689, 1.452385, 1, 0, 0.07058824, 1,
2.277142, 0.1869563, 1.203923, 1, 0, 0.06666667, 1,
2.299153, 0.05548563, 2.233713, 1, 0, 0.05882353, 1,
2.326001, -0.06849595, 2.104995, 1, 0, 0.05490196, 1,
2.348923, -1.160573, 2.650049, 1, 0, 0.04705882, 1,
2.370857, -0.3481289, 1.938573, 1, 0, 0.04313726, 1,
2.437671, -0.3612525, 3.54537, 1, 0, 0.03529412, 1,
2.516253, 0.4609836, 1.092945, 1, 0, 0.03137255, 1,
2.551653, -0.6734355, 2.938921, 1, 0, 0.02352941, 1,
2.562112, 1.620088, 1.423882, 1, 0, 0.01960784, 1,
2.844665, 0.3911545, 0.8037441, 1, 0, 0.01176471, 1,
3.090367, -1.119646, 1.422017, 1, 0, 0.007843138, 1
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
-0.2208532, -4.89758, -8.003113, 0, -0.5, 0.5, 0.5,
-0.2208532, -4.89758, -8.003113, 1, -0.5, 0.5, 0.5,
-0.2208532, -4.89758, -8.003113, 1, 1.5, 0.5, 0.5,
-0.2208532, -4.89758, -8.003113, 0, 1.5, 0.5, 0.5
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
-4.654578, -0.1949402, -8.003113, 0, -0.5, 0.5, 0.5,
-4.654578, -0.1949402, -8.003113, 1, -0.5, 0.5, 0.5,
-4.654578, -0.1949402, -8.003113, 1, 1.5, 0.5, 0.5,
-4.654578, -0.1949402, -8.003113, 0, 1.5, 0.5, 0.5
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
-4.654578, -4.89758, 0.4733789, 0, -0.5, 0.5, 0.5,
-4.654578, -4.89758, 0.4733789, 1, -0.5, 0.5, 0.5,
-4.654578, -4.89758, 0.4733789, 1, 1.5, 0.5, 0.5,
-4.654578, -4.89758, 0.4733789, 0, 1.5, 0.5, 0.5
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
-3, -3.812356, -6.046999,
3, -3.812356, -6.046999,
-3, -3.812356, -6.046999,
-3, -3.993227, -6.373019,
-2, -3.812356, -6.046999,
-2, -3.993227, -6.373019,
-1, -3.812356, -6.046999,
-1, -3.993227, -6.373019,
0, -3.812356, -6.046999,
0, -3.993227, -6.373019,
1, -3.812356, -6.046999,
1, -3.993227, -6.373019,
2, -3.812356, -6.046999,
2, -3.993227, -6.373019,
3, -3.812356, -6.046999,
3, -3.993227, -6.373019
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
-3, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
-3, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
-3, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
-2, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
-2, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
-2, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
-2, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
-1, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
-1, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
-1, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
-1, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
0, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
0, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
0, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
0, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
1, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
1, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
1, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
1, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
2, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
2, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
2, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
2, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5,
3, -4.354968, -7.025056, 0, -0.5, 0.5, 0.5,
3, -4.354968, -7.025056, 1, -0.5, 0.5, 0.5,
3, -4.354968, -7.025056, 1, 1.5, 0.5, 0.5,
3, -4.354968, -7.025056, 0, 1.5, 0.5, 0.5
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
-3.63141, -2, -6.046999,
-3.63141, 2, -6.046999,
-3.63141, -2, -6.046999,
-3.801938, -2, -6.373019,
-3.63141, 0, -6.046999,
-3.801938, 0, -6.373019,
-3.63141, 2, -6.046999,
-3.801938, 2, -6.373019
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
"-2",
"0",
"2"
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
-4.142994, -2, -7.025056, 0, -0.5, 0.5, 0.5,
-4.142994, -2, -7.025056, 1, -0.5, 0.5, 0.5,
-4.142994, -2, -7.025056, 1, 1.5, 0.5, 0.5,
-4.142994, -2, -7.025056, 0, 1.5, 0.5, 0.5,
-4.142994, 0, -7.025056, 0, -0.5, 0.5, 0.5,
-4.142994, 0, -7.025056, 1, -0.5, 0.5, 0.5,
-4.142994, 0, -7.025056, 1, 1.5, 0.5, 0.5,
-4.142994, 0, -7.025056, 0, 1.5, 0.5, 0.5,
-4.142994, 2, -7.025056, 0, -0.5, 0.5, 0.5,
-4.142994, 2, -7.025056, 1, -0.5, 0.5, 0.5,
-4.142994, 2, -7.025056, 1, 1.5, 0.5, 0.5,
-4.142994, 2, -7.025056, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.63141, -3.812356, -4,
-3.63141, -3.812356, 6,
-3.63141, -3.812356, -4,
-3.801938, -3.993227, -4,
-3.63141, -3.812356, -2,
-3.801938, -3.993227, -2,
-3.63141, -3.812356, 0,
-3.801938, -3.993227, 0,
-3.63141, -3.812356, 2,
-3.801938, -3.993227, 2,
-3.63141, -3.812356, 4,
-3.801938, -3.993227, 4,
-3.63141, -3.812356, 6,
-3.801938, -3.993227, 6
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
"4",
"6"
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
-4.142994, -4.354968, -4, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, -4, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, -4, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, -4, 0, 1.5, 0.5, 0.5,
-4.142994, -4.354968, -2, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, -2, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, -2, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, -2, 0, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 0, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 0, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 0, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 0, 0, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 2, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 2, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 2, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 2, 0, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 4, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 4, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 4, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 4, 0, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 6, 0, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 6, 1, -0.5, 0.5, 0.5,
-4.142994, -4.354968, 6, 1, 1.5, 0.5, 0.5,
-4.142994, -4.354968, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.63141, -3.812356, -6.046999,
-3.63141, 3.422475, -6.046999,
-3.63141, -3.812356, 6.993757,
-3.63141, 3.422475, 6.993757,
-3.63141, -3.812356, -6.046999,
-3.63141, -3.812356, 6.993757,
-3.63141, 3.422475, -6.046999,
-3.63141, 3.422475, 6.993757,
-3.63141, -3.812356, -6.046999,
3.189704, -3.812356, -6.046999,
-3.63141, -3.812356, 6.993757,
3.189704, -3.812356, 6.993757,
-3.63141, 3.422475, -6.046999,
3.189704, 3.422475, -6.046999,
-3.63141, 3.422475, 6.993757,
3.189704, 3.422475, 6.993757,
3.189704, -3.812356, -6.046999,
3.189704, 3.422475, -6.046999,
3.189704, -3.812356, 6.993757,
3.189704, 3.422475, 6.993757,
3.189704, -3.812356, -6.046999,
3.189704, -3.812356, 6.993757,
3.189704, 3.422475, -6.046999,
3.189704, 3.422475, 6.993757
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
var radius = 8.756821;
var distance = 38.96009;
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
mvMatrix.translate( 0.2208532, 0.1949402, -0.4733789 );
mvMatrix.scale( 1.38805, 1.308676, 0.7260351 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.96009);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


