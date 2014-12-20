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
-3.358541, 2.606232, -1.901637, 1, 0, 0, 1,
-3.150388, -0.2739518, -1.444288, 1, 0.007843138, 0, 1,
-3.090507, 0.9450306, -1.358611, 1, 0.01176471, 0, 1,
-2.980189, 0.2755616, -3.000617, 1, 0.01960784, 0, 1,
-2.973802, -1.358241, -2.808569, 1, 0.02352941, 0, 1,
-2.967913, -0.7281753, -2.868148, 1, 0.03137255, 0, 1,
-2.747169, -0.3301551, -0.3916553, 1, 0.03529412, 0, 1,
-2.674478, 1.243809, -0.01161316, 1, 0.04313726, 0, 1,
-2.508153, -1.68816, -1.807516, 1, 0.04705882, 0, 1,
-2.453347, -0.1009746, -1.566331, 1, 0.05490196, 0, 1,
-2.299547, 0.3462194, -2.082365, 1, 0.05882353, 0, 1,
-2.271551, 0.3150218, -3.18292, 1, 0.06666667, 0, 1,
-2.218702, -0.3174869, -1.227591, 1, 0.07058824, 0, 1,
-2.154976, 0.2869217, 0.2278457, 1, 0.07843138, 0, 1,
-2.1148, 0.582085, -1.199613, 1, 0.08235294, 0, 1,
-2.082568, 0.3344384, -2.296018, 1, 0.09019608, 0, 1,
-1.993453, -0.7153898, -1.884626, 1, 0.09411765, 0, 1,
-1.990833, -0.4024316, -1.925517, 1, 0.1019608, 0, 1,
-1.94829, 0.5577905, -2.007493, 1, 0.1098039, 0, 1,
-1.935515, 0.2929774, -0.8558576, 1, 0.1137255, 0, 1,
-1.93529, -0.4668579, -2.41136, 1, 0.1215686, 0, 1,
-1.838259, -0.2818277, -1.127753, 1, 0.1254902, 0, 1,
-1.836404, 1.157786, -1.018047, 1, 0.1333333, 0, 1,
-1.803816, -0.577686, -0.3396682, 1, 0.1372549, 0, 1,
-1.794625, 0.5973771, -0.3293439, 1, 0.145098, 0, 1,
-1.760002, -0.18763, -2.594356, 1, 0.1490196, 0, 1,
-1.747292, 0.827123, -1.047545, 1, 0.1568628, 0, 1,
-1.713861, 0.008877731, -2.620528, 1, 0.1607843, 0, 1,
-1.697483, 0.8650848, 0.06401716, 1, 0.1686275, 0, 1,
-1.673509, 1.974229, -0.2608739, 1, 0.172549, 0, 1,
-1.65271, 1.190485, -2.137741, 1, 0.1803922, 0, 1,
-1.63956, 0.1055093, -0.159083, 1, 0.1843137, 0, 1,
-1.63889, -0.6540224, -0.3352097, 1, 0.1921569, 0, 1,
-1.630527, -1.714242, -2.328085, 1, 0.1960784, 0, 1,
-1.624803, 0.2460272, -0.08115696, 1, 0.2039216, 0, 1,
-1.611901, -1.407193, -2.261214, 1, 0.2117647, 0, 1,
-1.611296, 1.309438, 0.3598796, 1, 0.2156863, 0, 1,
-1.583498, 0.2028584, -2.342463, 1, 0.2235294, 0, 1,
-1.567212, -0.05859224, 0.6864054, 1, 0.227451, 0, 1,
-1.564412, -1.434941, -2.069912, 1, 0.2352941, 0, 1,
-1.550654, 0.4497069, -1.258245, 1, 0.2392157, 0, 1,
-1.521117, 1.175638, -2.902325, 1, 0.2470588, 0, 1,
-1.518711, -0.6019484, -3.037943, 1, 0.2509804, 0, 1,
-1.51754, -0.2849586, -2.066622, 1, 0.2588235, 0, 1,
-1.513239, -0.610503, -1.955795, 1, 0.2627451, 0, 1,
-1.511703, -0.4677786, -2.347171, 1, 0.2705882, 0, 1,
-1.496026, -0.9370769, -1.778411, 1, 0.2745098, 0, 1,
-1.461954, 0.620236, -0.9016941, 1, 0.282353, 0, 1,
-1.461444, -0.718408, -3.512794, 1, 0.2862745, 0, 1,
-1.434745, 0.6728866, -1.234475, 1, 0.2941177, 0, 1,
-1.427088, -0.2491382, -1.33903, 1, 0.3019608, 0, 1,
-1.426014, 1.321727, -0.1830794, 1, 0.3058824, 0, 1,
-1.423982, -0.5801892, -1.643574, 1, 0.3137255, 0, 1,
-1.420592, 0.6820588, -4.15309, 1, 0.3176471, 0, 1,
-1.415253, -0.2671385, 0.2974903, 1, 0.3254902, 0, 1,
-1.41435, 0.2015427, -1.768409, 1, 0.3294118, 0, 1,
-1.412547, 0.339309, -0.5051828, 1, 0.3372549, 0, 1,
-1.395066, -1.884973, -3.761961, 1, 0.3411765, 0, 1,
-1.39035, 0.9620546, 0.6926153, 1, 0.3490196, 0, 1,
-1.386489, -0.1314612, -1.472234, 1, 0.3529412, 0, 1,
-1.382619, -1.78011, -3.886866, 1, 0.3607843, 0, 1,
-1.375077, 0.939974, 0.2101995, 1, 0.3647059, 0, 1,
-1.371585, -0.1988069, 0.03242582, 1, 0.372549, 0, 1,
-1.368283, -0.4245881, -1.170583, 1, 0.3764706, 0, 1,
-1.367039, -0.3693567, -3.167402, 1, 0.3843137, 0, 1,
-1.353875, -0.9306297, -2.426009, 1, 0.3882353, 0, 1,
-1.353355, 0.4895583, -1.245872, 1, 0.3960784, 0, 1,
-1.338434, 0.5829534, -1.578895, 1, 0.4039216, 0, 1,
-1.329589, 0.9561573, -0.5596418, 1, 0.4078431, 0, 1,
-1.320796, -0.3743525, -2.816935, 1, 0.4156863, 0, 1,
-1.307115, -0.1098353, -2.017342, 1, 0.4196078, 0, 1,
-1.303547, -2.310999, -1.391955, 1, 0.427451, 0, 1,
-1.297208, 0.5218024, -1.44087, 1, 0.4313726, 0, 1,
-1.288832, -0.396006, -2.257586, 1, 0.4392157, 0, 1,
-1.285938, 0.7693668, 0.8614631, 1, 0.4431373, 0, 1,
-1.278862, 0.5244194, -1.461012, 1, 0.4509804, 0, 1,
-1.27537, 1.047539, -1.532626, 1, 0.454902, 0, 1,
-1.270128, 0.1093716, -3.142158, 1, 0.4627451, 0, 1,
-1.259806, -1.638943, -1.5456, 1, 0.4666667, 0, 1,
-1.252285, 1.421922, -0.6796671, 1, 0.4745098, 0, 1,
-1.249752, 1.263067, -1.950695, 1, 0.4784314, 0, 1,
-1.246316, -0.6012429, -2.989552, 1, 0.4862745, 0, 1,
-1.228212, -0.8169603, -3.784163, 1, 0.4901961, 0, 1,
-1.226696, 0.8848792, 0.2806244, 1, 0.4980392, 0, 1,
-1.224728, 0.6706671, -0.7323822, 1, 0.5058824, 0, 1,
-1.212961, 1.251965, -1.732151, 1, 0.509804, 0, 1,
-1.208104, 0.4379515, -1.215968, 1, 0.5176471, 0, 1,
-1.20681, 0.5091558, -1.803801, 1, 0.5215687, 0, 1,
-1.20293, -3.071759, -1.890253, 1, 0.5294118, 0, 1,
-1.197814, 0.8547197, -2.057262, 1, 0.5333334, 0, 1,
-1.180637, 0.4027852, -1.174795, 1, 0.5411765, 0, 1,
-1.170672, -0.8146753, -3.87928, 1, 0.5450981, 0, 1,
-1.169607, 0.09132075, -0.5616491, 1, 0.5529412, 0, 1,
-1.169188, -0.538642, -0.1828884, 1, 0.5568628, 0, 1,
-1.158954, -0.2802826, -1.960795, 1, 0.5647059, 0, 1,
-1.154642, 0.655368, -0.407345, 1, 0.5686275, 0, 1,
-1.153326, 1.937256, 0.1798559, 1, 0.5764706, 0, 1,
-1.14943, -0.04757881, -3.748227, 1, 0.5803922, 0, 1,
-1.142085, 0.02131096, -0.3931468, 1, 0.5882353, 0, 1,
-1.138038, -1.079806, -0.5014346, 1, 0.5921569, 0, 1,
-1.132603, -0.6443483, -2.950237, 1, 0.6, 0, 1,
-1.125176, 0.05883902, -3.405837, 1, 0.6078432, 0, 1,
-1.120907, -1.299907, -3.484479, 1, 0.6117647, 0, 1,
-1.117869, 1.732579, -1.521542, 1, 0.6196079, 0, 1,
-1.110062, -0.840337, -2.436057, 1, 0.6235294, 0, 1,
-1.108811, -0.1590469, -2.893498, 1, 0.6313726, 0, 1,
-1.108389, -0.4365695, -2.288724, 1, 0.6352941, 0, 1,
-1.106953, 1.207962, 0.1162246, 1, 0.6431373, 0, 1,
-1.104376, 1.380989, -0.4949148, 1, 0.6470588, 0, 1,
-1.099881, 1.202862, -0.8531991, 1, 0.654902, 0, 1,
-1.091136, 0.4414833, -1.819176, 1, 0.6588235, 0, 1,
-1.072262, 0.7216687, -0.5392017, 1, 0.6666667, 0, 1,
-1.067937, -1.189464, -3.519078, 1, 0.6705883, 0, 1,
-1.065844, 0.1341315, -3.853739, 1, 0.6784314, 0, 1,
-1.059436, -0.9429109, -3.622054, 1, 0.682353, 0, 1,
-1.058236, -0.7120215, 0.007985144, 1, 0.6901961, 0, 1,
-1.0523, -0.3607572, -4.386456, 1, 0.6941177, 0, 1,
-1.044254, 0.6942242, -2.851731, 1, 0.7019608, 0, 1,
-1.040392, 1.059616, -2.017114, 1, 0.7098039, 0, 1,
-1.038912, 0.2566039, -2.610773, 1, 0.7137255, 0, 1,
-1.03702, 0.4808338, -1.267855, 1, 0.7215686, 0, 1,
-1.035537, -0.3565084, -2.248908, 1, 0.7254902, 0, 1,
-1.034824, 0.1767983, -2.39192, 1, 0.7333333, 0, 1,
-1.030289, 0.4963904, -2.738488, 1, 0.7372549, 0, 1,
-1.02311, 0.3640553, -1.243724, 1, 0.7450981, 0, 1,
-1.021438, -0.6410604, -2.603033, 1, 0.7490196, 0, 1,
-1.005691, -0.3031633, -3.928298, 1, 0.7568628, 0, 1,
-1.00477, 1.897635, -2.250307, 1, 0.7607843, 0, 1,
-1.004421, 0.2483651, -1.496217, 1, 0.7686275, 0, 1,
-1.003705, 1.610906, -0.1433536, 1, 0.772549, 0, 1,
-0.9839028, 1.741542, -0.8246089, 1, 0.7803922, 0, 1,
-0.9807318, 0.5844449, -1.553441, 1, 0.7843137, 0, 1,
-0.9789845, 0.6776778, -0.7703065, 1, 0.7921569, 0, 1,
-0.9786766, 0.9082463, 0.06040424, 1, 0.7960784, 0, 1,
-0.9781436, -0.6970438, -2.916498, 1, 0.8039216, 0, 1,
-0.9747306, 1.116028, -1.706713, 1, 0.8117647, 0, 1,
-0.9633529, -1.276443, -3.565341, 1, 0.8156863, 0, 1,
-0.9611591, -0.3094112, -2.227808, 1, 0.8235294, 0, 1,
-0.9461164, -0.05284529, -2.861826, 1, 0.827451, 0, 1,
-0.9443647, -0.820962, -4.005912, 1, 0.8352941, 0, 1,
-0.9406732, 0.5816277, -1.403057, 1, 0.8392157, 0, 1,
-0.9395626, -0.9507295, -2.531997, 1, 0.8470588, 0, 1,
-0.9391533, 0.1377303, -1.464877, 1, 0.8509804, 0, 1,
-0.9372422, -1.626795, -2.915164, 1, 0.8588235, 0, 1,
-0.9350883, 1.056124, -1.989823, 1, 0.8627451, 0, 1,
-0.9213201, 0.8635415, -2.180035, 1, 0.8705882, 0, 1,
-0.9210513, -1.508092, -2.691291, 1, 0.8745098, 0, 1,
-0.9200338, 0.7038291, -1.894619, 1, 0.8823529, 0, 1,
-0.9149719, -1.405021, -0.09227648, 1, 0.8862745, 0, 1,
-0.9095247, 0.4368543, -1.053302, 1, 0.8941177, 0, 1,
-0.9081772, -0.01781011, -1.673544, 1, 0.8980392, 0, 1,
-0.9055982, 0.4067063, -1.033737, 1, 0.9058824, 0, 1,
-0.8913319, -1.226075, -3.592773, 1, 0.9137255, 0, 1,
-0.8910725, -0.971194, -3.116974, 1, 0.9176471, 0, 1,
-0.8717176, 0.6146386, -0.4358817, 1, 0.9254902, 0, 1,
-0.8713471, -1.35893, -1.877262, 1, 0.9294118, 0, 1,
-0.8701115, -0.2197932, -1.750419, 1, 0.9372549, 0, 1,
-0.8698111, 0.7727207, -1.621507, 1, 0.9411765, 0, 1,
-0.8670998, -0.3010142, -2.620855, 1, 0.9490196, 0, 1,
-0.8596795, -1.201523, -2.33647, 1, 0.9529412, 0, 1,
-0.8531696, 0.8435063, 0.652622, 1, 0.9607843, 0, 1,
-0.8522232, -1.954441, -3.541323, 1, 0.9647059, 0, 1,
-0.8470504, 1.69627, -1.897979, 1, 0.972549, 0, 1,
-0.8433282, 0.616953, -1.428323, 1, 0.9764706, 0, 1,
-0.8406096, 0.03501944, -0.8684026, 1, 0.9843137, 0, 1,
-0.8216842, -1.319512, -2.44027, 1, 0.9882353, 0, 1,
-0.8200241, 0.7668368, 1.346787, 1, 0.9960784, 0, 1,
-0.818861, -0.0005779543, -1.376817, 0.9960784, 1, 0, 1,
-0.8176298, 0.4677616, -1.521569, 0.9921569, 1, 0, 1,
-0.8147174, -0.7637126, -2.528269, 0.9843137, 1, 0, 1,
-0.8141589, -0.4318717, -0.6356379, 0.9803922, 1, 0, 1,
-0.8076205, -0.8089186, -4.860365, 0.972549, 1, 0, 1,
-0.8015752, 0.6454525, -0.06377152, 0.9686275, 1, 0, 1,
-0.7963229, -0.2025924, -0.7398933, 0.9607843, 1, 0, 1,
-0.7894266, -0.5380036, -1.190186, 0.9568627, 1, 0, 1,
-0.7892667, -0.3164187, -1.424379, 0.9490196, 1, 0, 1,
-0.7887149, -0.1893284, -0.6615381, 0.945098, 1, 0, 1,
-0.7833981, 2.584247, 0.6309296, 0.9372549, 1, 0, 1,
-0.7693405, 0.5698758, 0.5792447, 0.9333333, 1, 0, 1,
-0.7663555, -0.5844834, -1.573852, 0.9254902, 1, 0, 1,
-0.764858, -0.5919837, -0.4703366, 0.9215686, 1, 0, 1,
-0.7638832, -0.4307046, -1.19235, 0.9137255, 1, 0, 1,
-0.7604145, 1.857938, -0.08670735, 0.9098039, 1, 0, 1,
-0.7581823, 0.1381047, -0.6613514, 0.9019608, 1, 0, 1,
-0.7519549, -0.01739222, -1.105333, 0.8941177, 1, 0, 1,
-0.7430875, 0.5527844, -0.3489963, 0.8901961, 1, 0, 1,
-0.7418088, -0.3249465, -0.6248094, 0.8823529, 1, 0, 1,
-0.741028, 0.5705706, 0.7432377, 0.8784314, 1, 0, 1,
-0.7380691, -0.1093215, -1.535045, 0.8705882, 1, 0, 1,
-0.7361158, 0.4942507, -1.49509, 0.8666667, 1, 0, 1,
-0.7225038, -1.5714, -1.955751, 0.8588235, 1, 0, 1,
-0.7220598, 0.03798717, 0.7829052, 0.854902, 1, 0, 1,
-0.7178068, -1.256081, -3.507062, 0.8470588, 1, 0, 1,
-0.7141439, -1.057516, -3.057409, 0.8431373, 1, 0, 1,
-0.7088445, -1.728087, -2.466548, 0.8352941, 1, 0, 1,
-0.7011349, -0.3650354, -1.023822, 0.8313726, 1, 0, 1,
-0.6996003, -0.3029553, -0.4078492, 0.8235294, 1, 0, 1,
-0.6985172, -0.3996492, -3.186659, 0.8196079, 1, 0, 1,
-0.690872, 0.5226231, -2.190734, 0.8117647, 1, 0, 1,
-0.6838605, 0.9196723, -0.9595004, 0.8078431, 1, 0, 1,
-0.6824859, -0.3115982, -0.5294101, 0.8, 1, 0, 1,
-0.676845, -1.127862, -1.808262, 0.7921569, 1, 0, 1,
-0.6737985, -0.3968656, -1.203658, 0.7882353, 1, 0, 1,
-0.6733179, -2.154862, -2.629233, 0.7803922, 1, 0, 1,
-0.6691141, -0.9153311, -3.383179, 0.7764706, 1, 0, 1,
-0.6675012, 0.1685168, -1.153376, 0.7686275, 1, 0, 1,
-0.6607358, 1.536219, -1.470654, 0.7647059, 1, 0, 1,
-0.6513569, 0.05561219, -1.131673, 0.7568628, 1, 0, 1,
-0.6465819, 0.782439, -0.2654406, 0.7529412, 1, 0, 1,
-0.6460659, -0.9065345, -2.312196, 0.7450981, 1, 0, 1,
-0.6456085, -0.1349469, -1.200025, 0.7411765, 1, 0, 1,
-0.6440843, 1.561048, -1.137249, 0.7333333, 1, 0, 1,
-0.6414315, -0.212692, -3.197306, 0.7294118, 1, 0, 1,
-0.6413679, 1.652117, 1.83852, 0.7215686, 1, 0, 1,
-0.6368181, -0.4789158, -3.674767, 0.7176471, 1, 0, 1,
-0.6362011, 1.627556, -0.3683457, 0.7098039, 1, 0, 1,
-0.6319592, 0.3233027, -0.3471133, 0.7058824, 1, 0, 1,
-0.6311265, -0.8888309, -3.265112, 0.6980392, 1, 0, 1,
-0.6279653, -2.934598, -1.85048, 0.6901961, 1, 0, 1,
-0.6268393, 0.5994318, -0.3606434, 0.6862745, 1, 0, 1,
-0.618817, -0.5871264, -2.103445, 0.6784314, 1, 0, 1,
-0.6176505, 0.8703447, -0.4496793, 0.6745098, 1, 0, 1,
-0.6162359, 3.378704, -0.07579125, 0.6666667, 1, 0, 1,
-0.6145263, -1.643844, -3.093703, 0.6627451, 1, 0, 1,
-0.6142879, -0.1385268, -1.569918, 0.654902, 1, 0, 1,
-0.61408, 0.723221, -2.131915, 0.6509804, 1, 0, 1,
-0.612442, -0.4187355, -2.973741, 0.6431373, 1, 0, 1,
-0.6090218, -1.081227, -3.520553, 0.6392157, 1, 0, 1,
-0.6058376, 1.030247, -0.06815355, 0.6313726, 1, 0, 1,
-0.6049456, -1.142456, -2.536614, 0.627451, 1, 0, 1,
-0.6013919, -1.444383, -3.805513, 0.6196079, 1, 0, 1,
-0.5960727, -0.3858528, -1.66891, 0.6156863, 1, 0, 1,
-0.5950728, 0.6038358, -0.2884576, 0.6078432, 1, 0, 1,
-0.5936129, 0.3268145, 0.2799219, 0.6039216, 1, 0, 1,
-0.5920442, 0.5794844, 0.3619163, 0.5960785, 1, 0, 1,
-0.5912453, 0.7378732, 0.5990735, 0.5882353, 1, 0, 1,
-0.5797542, -1.182721, -3.691023, 0.5843138, 1, 0, 1,
-0.5793833, 1.099696, 0.4871725, 0.5764706, 1, 0, 1,
-0.5774086, -0.9103419, -2.059792, 0.572549, 1, 0, 1,
-0.576445, -1.608291, -2.30962, 0.5647059, 1, 0, 1,
-0.5761226, -0.3174555, -1.236716, 0.5607843, 1, 0, 1,
-0.5691251, -1.728459, -1.910706, 0.5529412, 1, 0, 1,
-0.5676283, 0.8403324, -1.907709, 0.5490196, 1, 0, 1,
-0.5505414, -0.02785142, -3.174202, 0.5411765, 1, 0, 1,
-0.5500754, 0.72367, 0.231324, 0.5372549, 1, 0, 1,
-0.5473474, -1.201617, -3.838487, 0.5294118, 1, 0, 1,
-0.5463085, -0.4643064, -1.058584, 0.5254902, 1, 0, 1,
-0.5412344, -0.9609809, -3.706886, 0.5176471, 1, 0, 1,
-0.5407403, -0.5059064, -1.88828, 0.5137255, 1, 0, 1,
-0.5396487, 0.008857834, -1.706675, 0.5058824, 1, 0, 1,
-0.5372086, 0.7122554, -0.5343838, 0.5019608, 1, 0, 1,
-0.5367159, -1.723803, -3.265075, 0.4941176, 1, 0, 1,
-0.536579, -0.08758704, -2.481527, 0.4862745, 1, 0, 1,
-0.5337683, 1.215212, -1.632608, 0.4823529, 1, 0, 1,
-0.5304438, 0.8828338, -1.609864, 0.4745098, 1, 0, 1,
-0.5297155, -1.423949, -4.150771, 0.4705882, 1, 0, 1,
-0.5265, 2.372478, -0.3058778, 0.4627451, 1, 0, 1,
-0.5258102, 1.593132, -1.400177, 0.4588235, 1, 0, 1,
-0.5177032, 1.773349, -0.3324432, 0.4509804, 1, 0, 1,
-0.5175924, 1.949839, 2.452306, 0.4470588, 1, 0, 1,
-0.5151719, 1.498177, -0.8458074, 0.4392157, 1, 0, 1,
-0.510617, -0.6040277, -1.429807, 0.4352941, 1, 0, 1,
-0.5085675, -0.8809692, -2.018902, 0.427451, 1, 0, 1,
-0.5055327, -0.7321062, -0.6109762, 0.4235294, 1, 0, 1,
-0.5052568, -0.8082712, -2.669804, 0.4156863, 1, 0, 1,
-0.5044, -0.1162122, -1.232805, 0.4117647, 1, 0, 1,
-0.5034013, 0.1576114, -2.516237, 0.4039216, 1, 0, 1,
-0.5023928, -1.899608, -1.796357, 0.3960784, 1, 0, 1,
-0.5017558, 0.01512772, -1.721846, 0.3921569, 1, 0, 1,
-0.5007572, 1.060328, 0.8002128, 0.3843137, 1, 0, 1,
-0.5002872, -1.983347, -3.565024, 0.3803922, 1, 0, 1,
-0.4967664, -1.126669, -4.140459, 0.372549, 1, 0, 1,
-0.491848, 0.1280406, -1.77877, 0.3686275, 1, 0, 1,
-0.4895825, -2.506567, -2.072922, 0.3607843, 1, 0, 1,
-0.4845475, -1.624214, -2.045323, 0.3568628, 1, 0, 1,
-0.4826664, 0.05570079, -0.4247533, 0.3490196, 1, 0, 1,
-0.4798364, 0.1595249, -2.043741, 0.345098, 1, 0, 1,
-0.4738118, 0.9171398, -0.3058753, 0.3372549, 1, 0, 1,
-0.4718685, 0.1383492, 0.6651972, 0.3333333, 1, 0, 1,
-0.4693118, 0.156281, -0.7180038, 0.3254902, 1, 0, 1,
-0.4683898, -0.7369382, -3.543171, 0.3215686, 1, 0, 1,
-0.4677765, -0.8486488, -2.247401, 0.3137255, 1, 0, 1,
-0.4607387, 2.027623, -1.750685, 0.3098039, 1, 0, 1,
-0.4562328, -0.6358312, -2.699388, 0.3019608, 1, 0, 1,
-0.4556222, 0.2208748, -0.8736292, 0.2941177, 1, 0, 1,
-0.4543865, -0.3787231, -0.7874519, 0.2901961, 1, 0, 1,
-0.4539014, 0.6757209, -0.09134875, 0.282353, 1, 0, 1,
-0.4520269, -0.560329, -2.514935, 0.2784314, 1, 0, 1,
-0.4515585, -1.179672, -2.383445, 0.2705882, 1, 0, 1,
-0.4495609, 0.00545342, -1.641892, 0.2666667, 1, 0, 1,
-0.4442269, -1.413723, -4.059908, 0.2588235, 1, 0, 1,
-0.4407918, 0.3908404, -0.8736259, 0.254902, 1, 0, 1,
-0.4360213, 1.360644, 0.4477587, 0.2470588, 1, 0, 1,
-0.4357814, -1.318475, -2.140374, 0.2431373, 1, 0, 1,
-0.4319673, -1.315228, -4.052006, 0.2352941, 1, 0, 1,
-0.4298412, 1.162193, -1.040169, 0.2313726, 1, 0, 1,
-0.4291705, 0.7181285, -1.076496, 0.2235294, 1, 0, 1,
-0.4230812, -0.1779141, -1.594884, 0.2196078, 1, 0, 1,
-0.4171571, -0.5450508, -2.327368, 0.2117647, 1, 0, 1,
-0.4163134, -1.55786, -2.692919, 0.2078431, 1, 0, 1,
-0.4149581, 0.2627726, -0.3026007, 0.2, 1, 0, 1,
-0.4119842, -0.6117989, -1.759882, 0.1921569, 1, 0, 1,
-0.4094872, -0.1724345, -2.716931, 0.1882353, 1, 0, 1,
-0.408564, 1.65015, -1.586419, 0.1803922, 1, 0, 1,
-0.4049915, -0.2995716, -3.738213, 0.1764706, 1, 0, 1,
-0.4015387, 0.7859988, -0.4840472, 0.1686275, 1, 0, 1,
-0.4006954, 0.3694018, -0.2091409, 0.1647059, 1, 0, 1,
-0.396998, -1.811367, -2.971467, 0.1568628, 1, 0, 1,
-0.3930686, 1.722826, -1.249553, 0.1529412, 1, 0, 1,
-0.3930682, 1.805745, 0.1566061, 0.145098, 1, 0, 1,
-0.3929987, -0.02564636, -3.315521, 0.1411765, 1, 0, 1,
-0.3826455, -0.004904145, -0.8080881, 0.1333333, 1, 0, 1,
-0.3825925, 0.4836176, -1.556672, 0.1294118, 1, 0, 1,
-0.3797044, 1.505105, -1.517624, 0.1215686, 1, 0, 1,
-0.3795609, 1.2834, 0.09949026, 0.1176471, 1, 0, 1,
-0.3790389, -1.057924, -2.700853, 0.1098039, 1, 0, 1,
-0.3763711, -0.04123217, -2.486186, 0.1058824, 1, 0, 1,
-0.3744688, 0.2001615, -1.665236, 0.09803922, 1, 0, 1,
-0.3740888, -0.5050064, -1.873723, 0.09019608, 1, 0, 1,
-0.372901, 0.1193926, 0.4407914, 0.08627451, 1, 0, 1,
-0.3669432, -0.1562927, -2.114731, 0.07843138, 1, 0, 1,
-0.3601685, 1.807236, -1.322288, 0.07450981, 1, 0, 1,
-0.3571885, -0.8999952, -0.7954496, 0.06666667, 1, 0, 1,
-0.3523508, -0.08599705, -2.034723, 0.0627451, 1, 0, 1,
-0.3493517, 0.242123, -0.5740148, 0.05490196, 1, 0, 1,
-0.3479235, 0.7375665, 1.212446, 0.05098039, 1, 0, 1,
-0.3431618, 0.2731767, -1.14887, 0.04313726, 1, 0, 1,
-0.3416904, 1.729188, -0.1814808, 0.03921569, 1, 0, 1,
-0.3402882, -0.3451644, -3.084584, 0.03137255, 1, 0, 1,
-0.3401213, -0.5701709, -2.035997, 0.02745098, 1, 0, 1,
-0.3365654, 1.115263, 1.207658, 0.01960784, 1, 0, 1,
-0.3327204, 0.2816629, -0.02200306, 0.01568628, 1, 0, 1,
-0.3308454, -0.7216201, -2.638811, 0.007843138, 1, 0, 1,
-0.3295542, -0.750051, -2.69222, 0.003921569, 1, 0, 1,
-0.3248715, 1.007148, 0.4728985, 0, 1, 0.003921569, 1,
-0.3181271, -1.476988, -2.817791, 0, 1, 0.01176471, 1,
-0.3180416, -0.7912059, -2.749571, 0, 1, 0.01568628, 1,
-0.3178479, -0.1710551, -2.061113, 0, 1, 0.02352941, 1,
-0.3160938, -1.444967, -3.784352, 0, 1, 0.02745098, 1,
-0.3142014, 0.5800709, -1.627042, 0, 1, 0.03529412, 1,
-0.3141465, -1.168234, -2.032884, 0, 1, 0.03921569, 1,
-0.3107219, -0.3489938, -2.251117, 0, 1, 0.04705882, 1,
-0.3081525, 0.766332, -0.04685001, 0, 1, 0.05098039, 1,
-0.300699, -0.7650824, -4.067222, 0, 1, 0.05882353, 1,
-0.3000658, -0.7339804, -3.295362, 0, 1, 0.0627451, 1,
-0.2914146, 0.1148162, -3.155707, 0, 1, 0.07058824, 1,
-0.2867348, 1.027997, -0.3670089, 0, 1, 0.07450981, 1,
-0.285473, 1.170798, -1.450395, 0, 1, 0.08235294, 1,
-0.2818775, -1.107782, -1.303929, 0, 1, 0.08627451, 1,
-0.277201, -0.7024896, -3.209855, 0, 1, 0.09411765, 1,
-0.2763816, -3.266685, -3.348557, 0, 1, 0.1019608, 1,
-0.275979, 1.623973, 1.198578, 0, 1, 0.1058824, 1,
-0.2755298, -0.5784938, -2.136832, 0, 1, 0.1137255, 1,
-0.2734981, 1.215283, -0.7217604, 0, 1, 0.1176471, 1,
-0.2727829, 1.003299, 0.687921, 0, 1, 0.1254902, 1,
-0.2667862, 0.4520808, -1.448131, 0, 1, 0.1294118, 1,
-0.263929, -0.0465571, 0.742745, 0, 1, 0.1372549, 1,
-0.2636589, -0.5987513, -1.315066, 0, 1, 0.1411765, 1,
-0.2597884, 1.929667, -0.6934084, 0, 1, 0.1490196, 1,
-0.258324, -0.2565623, -2.653157, 0, 1, 0.1529412, 1,
-0.2571359, 0.8600347, 0.1518361, 0, 1, 0.1607843, 1,
-0.2526832, -1.914964, -4.374647, 0, 1, 0.1647059, 1,
-0.2509234, -0.4635094, -2.709393, 0, 1, 0.172549, 1,
-0.2504849, -1.190313, -4.413413, 0, 1, 0.1764706, 1,
-0.2471751, -1.213521, -3.668795, 0, 1, 0.1843137, 1,
-0.2447443, -0.5406669, -3.442667, 0, 1, 0.1882353, 1,
-0.2436874, -1.547849, -3.431032, 0, 1, 0.1960784, 1,
-0.2406085, 0.004367683, -1.336962, 0, 1, 0.2039216, 1,
-0.2345738, 0.224628, -0.6042165, 0, 1, 0.2078431, 1,
-0.2344291, 2.121873, 1.186285, 0, 1, 0.2156863, 1,
-0.2337264, -0.6750962, -1.147054, 0, 1, 0.2196078, 1,
-0.2283884, 1.374006, 0.6547618, 0, 1, 0.227451, 1,
-0.2264745, 0.6075709, -0.2006214, 0, 1, 0.2313726, 1,
-0.2264304, -0.1417405, -0.6055357, 0, 1, 0.2392157, 1,
-0.2233058, 0.4829688, -2.011662, 0, 1, 0.2431373, 1,
-0.2205782, 0.5194589, -1.507916, 0, 1, 0.2509804, 1,
-0.2200476, 0.1077014, -1.252345, 0, 1, 0.254902, 1,
-0.2194501, 1.012107, 0.6970644, 0, 1, 0.2627451, 1,
-0.2156716, 2.325511, -0.7581434, 0, 1, 0.2666667, 1,
-0.2083202, -0.6814325, -3.799086, 0, 1, 0.2745098, 1,
-0.2075417, 0.2168998, -1.359247, 0, 1, 0.2784314, 1,
-0.205248, 0.8711964, -0.209941, 0, 1, 0.2862745, 1,
-0.2003404, 1.610374, 0.8288695, 0, 1, 0.2901961, 1,
-0.1957825, -0.9285894, -1.726094, 0, 1, 0.2980392, 1,
-0.1937124, -0.8055074, -3.030387, 0, 1, 0.3058824, 1,
-0.1913827, -1.216199, -3.078416, 0, 1, 0.3098039, 1,
-0.1895467, 0.1757383, -2.774969, 0, 1, 0.3176471, 1,
-0.1892284, -1.310892, -2.935407, 0, 1, 0.3215686, 1,
-0.1888654, -0.6244665, -3.250511, 0, 1, 0.3294118, 1,
-0.1888291, 0.7393854, 1.775978, 0, 1, 0.3333333, 1,
-0.1876993, 0.5763962, 1.087519, 0, 1, 0.3411765, 1,
-0.1868138, 1.158088, -1.184957, 0, 1, 0.345098, 1,
-0.1837843, -2.61163, -3.493505, 0, 1, 0.3529412, 1,
-0.1799891, 1.09603, -0.4685251, 0, 1, 0.3568628, 1,
-0.1721412, -0.3817785, -1.46402, 0, 1, 0.3647059, 1,
-0.1705074, -1.100237, -3.818799, 0, 1, 0.3686275, 1,
-0.1657243, -1.994147, -4.563262, 0, 1, 0.3764706, 1,
-0.1628643, -0.6419939, -2.557801, 0, 1, 0.3803922, 1,
-0.1626399, -1.163793, -3.3411, 0, 1, 0.3882353, 1,
-0.1603685, 0.08369806, -1.070999, 0, 1, 0.3921569, 1,
-0.1577722, -0.6832678, -2.159503, 0, 1, 0.4, 1,
-0.1549878, 1.203254, -1.306047, 0, 1, 0.4078431, 1,
-0.1537504, 0.6555491, -0.6535468, 0, 1, 0.4117647, 1,
-0.1524503, 1.293157, -0.1106252, 0, 1, 0.4196078, 1,
-0.151439, -0.6198671, -3.078912, 0, 1, 0.4235294, 1,
-0.1510618, -0.2771021, -4.311105, 0, 1, 0.4313726, 1,
-0.149618, -0.6056807, -3.123085, 0, 1, 0.4352941, 1,
-0.146279, -0.7464898, -4.882645, 0, 1, 0.4431373, 1,
-0.1456506, -0.1381462, -5.181929, 0, 1, 0.4470588, 1,
-0.1455927, 1.061735, -1.168579, 0, 1, 0.454902, 1,
-0.1447316, 0.2607904, -1.639164, 0, 1, 0.4588235, 1,
-0.1438056, 0.6365849, -0.2772098, 0, 1, 0.4666667, 1,
-0.1405682, 0.2171126, 0.4496715, 0, 1, 0.4705882, 1,
-0.1386421, -0.2801786, -1.220182, 0, 1, 0.4784314, 1,
-0.131253, 0.6381347, -0.7586619, 0, 1, 0.4823529, 1,
-0.1159277, -0.331754, -1.211406, 0, 1, 0.4901961, 1,
-0.1154451, -1.110343, -3.157005, 0, 1, 0.4941176, 1,
-0.1144529, 0.3590311, -0.4643587, 0, 1, 0.5019608, 1,
-0.1142048, -0.02796294, -2.546455, 0, 1, 0.509804, 1,
-0.1139484, -0.1524134, -1.545931, 0, 1, 0.5137255, 1,
-0.1136083, 0.2420128, -2.138695, 0, 1, 0.5215687, 1,
-0.1115609, -0.7254431, -3.417968, 0, 1, 0.5254902, 1,
-0.1066002, 1.229944, 0.1905383, 0, 1, 0.5333334, 1,
-0.1047863, 0.9555245, 0.4763423, 0, 1, 0.5372549, 1,
-0.1021828, 1.687923, -0.8123207, 0, 1, 0.5450981, 1,
-0.09868782, 0.7440209, -0.563739, 0, 1, 0.5490196, 1,
-0.09596839, -1.802874, -4.420023, 0, 1, 0.5568628, 1,
-0.09450845, -0.7775875, -2.777141, 0, 1, 0.5607843, 1,
-0.08417565, -0.3194686, -2.121198, 0, 1, 0.5686275, 1,
-0.07892767, 0.5416082, -1.830075, 0, 1, 0.572549, 1,
-0.07608823, -1.184202, -3.161833, 0, 1, 0.5803922, 1,
-0.0760078, -0.2539464, -2.754332, 0, 1, 0.5843138, 1,
-0.0728683, -0.172644, -3.69416, 0, 1, 0.5921569, 1,
-0.0721973, 0.208823, 0.4753959, 0, 1, 0.5960785, 1,
-0.06905225, -0.5335422, -2.341093, 0, 1, 0.6039216, 1,
-0.06759357, 0.73618, 0.5947796, 0, 1, 0.6117647, 1,
-0.06714114, 2.29689, -0.7774413, 0, 1, 0.6156863, 1,
-0.0667116, 0.4254212, 0.3579114, 0, 1, 0.6235294, 1,
-0.06651177, 1.38275, -1.379543, 0, 1, 0.627451, 1,
-0.0662736, -0.7016171, -4.040118, 0, 1, 0.6352941, 1,
-0.0596045, 0.6959295, -1.080747, 0, 1, 0.6392157, 1,
-0.05515512, -0.02761893, -0.3443342, 0, 1, 0.6470588, 1,
-0.05442832, -1.689501, -2.381974, 0, 1, 0.6509804, 1,
-0.05285537, -1.814066, -5.313396, 0, 1, 0.6588235, 1,
-0.04995107, -2.088667, -3.429163, 0, 1, 0.6627451, 1,
-0.04508657, 0.0646214, -0.2487755, 0, 1, 0.6705883, 1,
-0.03739083, 0.1003192, -1.422395, 0, 1, 0.6745098, 1,
-0.03734171, -1.448421, -3.982349, 0, 1, 0.682353, 1,
-0.03662793, 0.3518756, -0.0738005, 0, 1, 0.6862745, 1,
-0.03551313, -0.9509593, -4.363609, 0, 1, 0.6941177, 1,
-0.0327286, 1.389129, -0.04257585, 0, 1, 0.7019608, 1,
-0.02783581, 0.9345218, 0.2908177, 0, 1, 0.7058824, 1,
-0.02762671, -1.283826, -2.969593, 0, 1, 0.7137255, 1,
-0.02284215, -1.297124, -2.096735, 0, 1, 0.7176471, 1,
-0.02181706, -0.4512732, -1.878389, 0, 1, 0.7254902, 1,
-0.02118046, -0.4669002, -4.854729, 0, 1, 0.7294118, 1,
-0.02001301, -0.8334633, -2.704618, 0, 1, 0.7372549, 1,
-0.01855143, -0.1072962, -2.849196, 0, 1, 0.7411765, 1,
-0.01456428, -0.4947982, -2.594684, 0, 1, 0.7490196, 1,
-0.01319894, 0.7139575, -0.5477968, 0, 1, 0.7529412, 1,
-0.01170962, 0.8022697, 0.7275497, 0, 1, 0.7607843, 1,
-0.009709443, 1.94304, 0.8645977, 0, 1, 0.7647059, 1,
0.0009247178, 0.218647, -2.152267, 0, 1, 0.772549, 1,
0.00237921, 0.8798984, -0.4918117, 0, 1, 0.7764706, 1,
0.004241449, -0.2969931, 4.892253, 0, 1, 0.7843137, 1,
0.007332403, 0.19604, 2.522525, 0, 1, 0.7882353, 1,
0.008331449, 0.5215119, -0.3771221, 0, 1, 0.7960784, 1,
0.009264966, 0.1669993, -0.9565018, 0, 1, 0.8039216, 1,
0.01060292, -0.5524761, 3.184915, 0, 1, 0.8078431, 1,
0.01404773, -0.7662812, 3.403634, 0, 1, 0.8156863, 1,
0.0146471, -1.010115, 2.24059, 0, 1, 0.8196079, 1,
0.01769738, 0.4496782, -0.3125257, 0, 1, 0.827451, 1,
0.02051498, -0.8954562, 3.083709, 0, 1, 0.8313726, 1,
0.02196819, -2.74678, 2.988246, 0, 1, 0.8392157, 1,
0.0297529, -0.8500457, 2.358228, 0, 1, 0.8431373, 1,
0.03132858, 0.05643107, -0.4131943, 0, 1, 0.8509804, 1,
0.03686797, 0.3938263, 0.6562723, 0, 1, 0.854902, 1,
0.0375261, -0.6085534, 1.612677, 0, 1, 0.8627451, 1,
0.03755655, 0.1816649, 0.8514818, 0, 1, 0.8666667, 1,
0.03879064, 0.8625131, -0.44255, 0, 1, 0.8745098, 1,
0.04324492, 0.6909082, -0.6741107, 0, 1, 0.8784314, 1,
0.04493887, -0.0473155, 2.729485, 0, 1, 0.8862745, 1,
0.04847799, 0.285725, -1.654746, 0, 1, 0.8901961, 1,
0.04868176, 1.166852, -0.7603093, 0, 1, 0.8980392, 1,
0.0550057, 1.465141, -0.4768091, 0, 1, 0.9058824, 1,
0.05808876, -1.519284, 1.957133, 0, 1, 0.9098039, 1,
0.05869933, 0.8202261, 0.904068, 0, 1, 0.9176471, 1,
0.0603923, 0.173007, 0.1557471, 0, 1, 0.9215686, 1,
0.06152232, -0.2221737, 4.405468, 0, 1, 0.9294118, 1,
0.0627325, -0.8106917, 3.43523, 0, 1, 0.9333333, 1,
0.06349667, 0.6770437, 0.4427162, 0, 1, 0.9411765, 1,
0.06415299, -1.252645, 3.299118, 0, 1, 0.945098, 1,
0.06600264, 0.6386641, 1.683832, 0, 1, 0.9529412, 1,
0.06690583, -0.6021808, 2.783886, 0, 1, 0.9568627, 1,
0.06755545, -0.102552, 2.857236, 0, 1, 0.9647059, 1,
0.06784532, 0.8124058, -0.4517362, 0, 1, 0.9686275, 1,
0.06941863, 0.3523668, -0.5030813, 0, 1, 0.9764706, 1,
0.07113522, -1.131678, 2.971436, 0, 1, 0.9803922, 1,
0.07256, 0.6437604, 3.249498, 0, 1, 0.9882353, 1,
0.07360848, 2.083396, -0.9439799, 0, 1, 0.9921569, 1,
0.07482589, 0.3307208, 2.122908, 0, 1, 1, 1,
0.07552323, 0.1978068, -0.5807162, 0, 0.9921569, 1, 1,
0.07856481, -1.363039, 4.965301, 0, 0.9882353, 1, 1,
0.08134997, 0.39916, 0.4919043, 0, 0.9803922, 1, 1,
0.08184242, -0.6984151, 4.225124, 0, 0.9764706, 1, 1,
0.08371048, 1.408257, 0.4355019, 0, 0.9686275, 1, 1,
0.08375644, -0.7393824, 2.262622, 0, 0.9647059, 1, 1,
0.08465974, -0.9027423, 4.30107, 0, 0.9568627, 1, 1,
0.08969523, 0.1429256, 0.9919603, 0, 0.9529412, 1, 1,
0.09175234, 0.09989257, -0.1463128, 0, 0.945098, 1, 1,
0.09211326, 2.217225, -0.137688, 0, 0.9411765, 1, 1,
0.0927265, 1.624067, 0.6828291, 0, 0.9333333, 1, 1,
0.09288925, 0.1619226, 1.694593, 0, 0.9294118, 1, 1,
0.09417615, 0.2449939, 1.434468, 0, 0.9215686, 1, 1,
0.1009542, -0.3026058, 2.284412, 0, 0.9176471, 1, 1,
0.1016924, -0.08107392, 1.362131, 0, 0.9098039, 1, 1,
0.1036633, 0.3412916, 0.718313, 0, 0.9058824, 1, 1,
0.1040082, -1.035764, 1.835538, 0, 0.8980392, 1, 1,
0.104939, 0.9592123, -0.05940888, 0, 0.8901961, 1, 1,
0.1074414, 0.9088765, 0.3726266, 0, 0.8862745, 1, 1,
0.1105847, -0.1079363, 1.990135, 0, 0.8784314, 1, 1,
0.1145442, -0.7519776, 1.80036, 0, 0.8745098, 1, 1,
0.1204911, 0.7867689, -1.349865, 0, 0.8666667, 1, 1,
0.1216149, -1.17906, 3.396943, 0, 0.8627451, 1, 1,
0.1225785, -0.1442954, 2.973886, 0, 0.854902, 1, 1,
0.1239391, 0.08092685, 2.70551, 0, 0.8509804, 1, 1,
0.125112, 0.6966335, -1.296525, 0, 0.8431373, 1, 1,
0.1256048, 2.17293, 0.5507139, 0, 0.8392157, 1, 1,
0.1316608, 0.6623936, 0.04410698, 0, 0.8313726, 1, 1,
0.132392, 0.9263273, 2.187055, 0, 0.827451, 1, 1,
0.1391599, -1.026655, 4.168585, 0, 0.8196079, 1, 1,
0.1392165, -0.1046798, 2.525776, 0, 0.8156863, 1, 1,
0.140301, -0.3878398, 2.096105, 0, 0.8078431, 1, 1,
0.1416662, 0.3095236, 0.07425477, 0, 0.8039216, 1, 1,
0.1423616, 0.4046192, -0.1528075, 0, 0.7960784, 1, 1,
0.1425462, -0.8651441, 1.842382, 0, 0.7882353, 1, 1,
0.1444854, 0.7775712, -0.5958025, 0, 0.7843137, 1, 1,
0.146318, -1.612118, 2.512447, 0, 0.7764706, 1, 1,
0.146917, 0.3541551, 0.5257447, 0, 0.772549, 1, 1,
0.1528013, -1.675112, 3.823138, 0, 0.7647059, 1, 1,
0.1533525, 1.220323, -0.2272074, 0, 0.7607843, 1, 1,
0.1562491, 0.8533541, -0.4329743, 0, 0.7529412, 1, 1,
0.1578818, 0.528507, 0.3718964, 0, 0.7490196, 1, 1,
0.1597425, -1.714875, 3.205945, 0, 0.7411765, 1, 1,
0.1658104, 0.9365816, 1.283256, 0, 0.7372549, 1, 1,
0.1663695, 1.121199, 0.1416992, 0, 0.7294118, 1, 1,
0.1667975, 0.4265757, 0.001722599, 0, 0.7254902, 1, 1,
0.1735051, 0.2973908, 1.45347, 0, 0.7176471, 1, 1,
0.1737305, -1.709119, 4.304318, 0, 0.7137255, 1, 1,
0.1739956, -1.945453, 3.159559, 0, 0.7058824, 1, 1,
0.1768847, -1.201061, 1.519776, 0, 0.6980392, 1, 1,
0.1948671, 0.5129533, -1.492718, 0, 0.6941177, 1, 1,
0.2027751, 1.307517, 0.1199133, 0, 0.6862745, 1, 1,
0.204177, 0.09807923, 1.536169, 0, 0.682353, 1, 1,
0.2092318, 0.24223, 0.3054169, 0, 0.6745098, 1, 1,
0.2195352, -2.579632, 2.68546, 0, 0.6705883, 1, 1,
0.2207922, 0.03507816, 1.305408, 0, 0.6627451, 1, 1,
0.2221265, 0.2539731, 0.604288, 0, 0.6588235, 1, 1,
0.2238925, -0.5744019, 3.278402, 0, 0.6509804, 1, 1,
0.2252719, -0.7739317, 1.687269, 0, 0.6470588, 1, 1,
0.2263965, -1.991223, 2.404792, 0, 0.6392157, 1, 1,
0.2272843, 0.8965274, 0.5512083, 0, 0.6352941, 1, 1,
0.2279083, 0.2407677, 1.823844, 0, 0.627451, 1, 1,
0.2293981, -0.1004332, 1.785395, 0, 0.6235294, 1, 1,
0.2332652, -1.859066, 4.271389, 0, 0.6156863, 1, 1,
0.2332863, -1.386857, 1.770968, 0, 0.6117647, 1, 1,
0.2360037, 0.8366289, 0.2625262, 0, 0.6039216, 1, 1,
0.2360474, -1.995803, 3.018239, 0, 0.5960785, 1, 1,
0.2409672, 0.8024645, 1.500035, 0, 0.5921569, 1, 1,
0.2424824, -0.1121781, 3.384693, 0, 0.5843138, 1, 1,
0.2467947, 0.01386174, 2.567557, 0, 0.5803922, 1, 1,
0.2478629, 0.5308282, 0.2698022, 0, 0.572549, 1, 1,
0.2522404, 1.847794, -0.1336915, 0, 0.5686275, 1, 1,
0.2598251, 1.579252, 1.131008, 0, 0.5607843, 1, 1,
0.2601973, 1.105529, 0.8225839, 0, 0.5568628, 1, 1,
0.2635049, 0.05318315, 4.787937, 0, 0.5490196, 1, 1,
0.2671747, 1.543364, -0.4172995, 0, 0.5450981, 1, 1,
0.2700146, 0.7352344, 0.7354887, 0, 0.5372549, 1, 1,
0.2735048, -1.041321, 4.420226, 0, 0.5333334, 1, 1,
0.2738691, 1.232542, 0.4543881, 0, 0.5254902, 1, 1,
0.2747436, -0.5174077, 1.895998, 0, 0.5215687, 1, 1,
0.2772379, 1.306026, -1.766399, 0, 0.5137255, 1, 1,
0.2781186, 0.2962948, -1.488735, 0, 0.509804, 1, 1,
0.2796424, -0.3075141, 2.181453, 0, 0.5019608, 1, 1,
0.2831732, -1.116443, 2.078941, 0, 0.4941176, 1, 1,
0.2868686, 0.8647117, 1.000186, 0, 0.4901961, 1, 1,
0.2978195, 0.6781034, -0.893772, 0, 0.4823529, 1, 1,
0.2995771, -1.491277, 2.555847, 0, 0.4784314, 1, 1,
0.2998367, -0.5076633, 2.646363, 0, 0.4705882, 1, 1,
0.3000752, -0.6258891, 0.7557244, 0, 0.4666667, 1, 1,
0.3009298, 0.4453925, 2.564376, 0, 0.4588235, 1, 1,
0.3014663, -1.415017, 3.243948, 0, 0.454902, 1, 1,
0.3015734, 1.013269, 2.530985, 0, 0.4470588, 1, 1,
0.3027914, 2.413295, -0.8620068, 0, 0.4431373, 1, 1,
0.3032597, 0.5411575, 1.786297, 0, 0.4352941, 1, 1,
0.3037725, -1.65054, 3.563379, 0, 0.4313726, 1, 1,
0.3042965, -1.160563, 3.608549, 0, 0.4235294, 1, 1,
0.3048962, 0.9666709, 1.54387, 0, 0.4196078, 1, 1,
0.3071363, -0.3119982, 1.27561, 0, 0.4117647, 1, 1,
0.3087032, 0.646201, -0.1076524, 0, 0.4078431, 1, 1,
0.3101635, 1.247139, -0.1953199, 0, 0.4, 1, 1,
0.3104029, -1.577061, 3.925642, 0, 0.3921569, 1, 1,
0.3129714, 0.6430312, 1.571293, 0, 0.3882353, 1, 1,
0.3160077, -0.3681287, 3.793191, 0, 0.3803922, 1, 1,
0.3173713, 1.410386, -0.8958095, 0, 0.3764706, 1, 1,
0.3210348, -0.02053691, -0.8835466, 0, 0.3686275, 1, 1,
0.3237683, -1.375959, 2.277874, 0, 0.3647059, 1, 1,
0.3278814, -0.08012473, 2.958605, 0, 0.3568628, 1, 1,
0.3283317, -1.517903, 3.340627, 0, 0.3529412, 1, 1,
0.3350824, -0.358575, 2.083373, 0, 0.345098, 1, 1,
0.335592, 0.03657247, 2.32234, 0, 0.3411765, 1, 1,
0.3361593, 1.034808, 0.5202579, 0, 0.3333333, 1, 1,
0.3361895, -1.764945, 1.323257, 0, 0.3294118, 1, 1,
0.3363713, -0.1344587, 1.61056, 0, 0.3215686, 1, 1,
0.3368115, 1.714223, -1.10375, 0, 0.3176471, 1, 1,
0.3388435, 1.546638, 0.8990064, 0, 0.3098039, 1, 1,
0.3423585, 0.3924687, 0.6001126, 0, 0.3058824, 1, 1,
0.3475148, 1.565488, 1.282451, 0, 0.2980392, 1, 1,
0.3499066, 2.560364, 1.076299, 0, 0.2901961, 1, 1,
0.3513328, 0.9629915, -1.162399, 0, 0.2862745, 1, 1,
0.3599884, 0.4609908, 1.572711, 0, 0.2784314, 1, 1,
0.3606668, 0.5972553, -1.519118, 0, 0.2745098, 1, 1,
0.3618515, -0.5816945, 2.271027, 0, 0.2666667, 1, 1,
0.3631701, 0.9497318, 1.731332, 0, 0.2627451, 1, 1,
0.3671238, -0.06820863, -0.7409603, 0, 0.254902, 1, 1,
0.3737817, 1.039825, -0.5436294, 0, 0.2509804, 1, 1,
0.3779136, -0.0512158, 4.4937, 0, 0.2431373, 1, 1,
0.3802693, -2.525219, 2.508174, 0, 0.2392157, 1, 1,
0.3811552, 0.8408273, 0.3477689, 0, 0.2313726, 1, 1,
0.3815667, 1.131329, 0.6159336, 0, 0.227451, 1, 1,
0.3930214, 0.09569251, 0.9543384, 0, 0.2196078, 1, 1,
0.4033757, 0.5618629, 0.4950715, 0, 0.2156863, 1, 1,
0.4059478, 0.1754758, 2.076705, 0, 0.2078431, 1, 1,
0.4077184, -0.2496969, 1.730889, 0, 0.2039216, 1, 1,
0.4102662, -0.1117822, 1.635346, 0, 0.1960784, 1, 1,
0.4114884, -0.1782821, 4.893942, 0, 0.1882353, 1, 1,
0.4121229, 2.062978, 0.002823542, 0, 0.1843137, 1, 1,
0.4123091, -1.100588, 3.583285, 0, 0.1764706, 1, 1,
0.4138354, -1.514341, 2.190713, 0, 0.172549, 1, 1,
0.417537, 0.9296579, 1.866408, 0, 0.1647059, 1, 1,
0.4196452, 1.746958, -0.9603865, 0, 0.1607843, 1, 1,
0.4200083, -0.30696, 2.830863, 0, 0.1529412, 1, 1,
0.4209892, -0.2075337, 2.102095, 0, 0.1490196, 1, 1,
0.4213072, 1.019694, 1.023105, 0, 0.1411765, 1, 1,
0.4225097, 1.146458, -1.331402, 0, 0.1372549, 1, 1,
0.4238352, -0.8505542, 1.944776, 0, 0.1294118, 1, 1,
0.4244772, 0.2564288, 0.3638943, 0, 0.1254902, 1, 1,
0.4246559, -0.4493424, 2.097821, 0, 0.1176471, 1, 1,
0.4305627, 0.1184322, 0.162296, 0, 0.1137255, 1, 1,
0.4316757, 0.2724994, 2.166425, 0, 0.1058824, 1, 1,
0.4321217, 0.3821723, 0.5306003, 0, 0.09803922, 1, 1,
0.4353934, 0.4599756, -0.1918087, 0, 0.09411765, 1, 1,
0.4372883, 0.173147, 1.245527, 0, 0.08627451, 1, 1,
0.439652, -0.3242217, 0.8378611, 0, 0.08235294, 1, 1,
0.4403791, 1.068371, 0.5893897, 0, 0.07450981, 1, 1,
0.441993, 0.5271064, 0.7769175, 0, 0.07058824, 1, 1,
0.4552694, 0.1955053, 0.3252981, 0, 0.0627451, 1, 1,
0.457168, -1.239517, 2.023659, 0, 0.05882353, 1, 1,
0.4573328, 1.604261, -0.8298571, 0, 0.05098039, 1, 1,
0.457486, 0.02658146, 1.840685, 0, 0.04705882, 1, 1,
0.458042, 0.1434012, 1.913975, 0, 0.03921569, 1, 1,
0.458517, -1.470797, 2.570706, 0, 0.03529412, 1, 1,
0.4759509, 0.4364128, 0.08173466, 0, 0.02745098, 1, 1,
0.4786749, 0.367474, 0.7796767, 0, 0.02352941, 1, 1,
0.4797965, -0.3187744, 2.129292, 0, 0.01568628, 1, 1,
0.48545, -0.3598884, 3.164743, 0, 0.01176471, 1, 1,
0.4862745, -0.5288817, 1.805207, 0, 0.003921569, 1, 1,
0.4944032, 0.8226104, -0.821573, 0.003921569, 0, 1, 1,
0.4983623, 0.6834599, -0.2713014, 0.007843138, 0, 1, 1,
0.5034324, 0.6303471, 1.935788, 0.01568628, 0, 1, 1,
0.506223, -1.15024, 3.004327, 0.01960784, 0, 1, 1,
0.5119142, -0.1962588, 1.646286, 0.02745098, 0, 1, 1,
0.5133399, -1.236011, 2.593949, 0.03137255, 0, 1, 1,
0.5138469, -0.1474887, 3.031621, 0.03921569, 0, 1, 1,
0.5149697, -1.29667, 2.513456, 0.04313726, 0, 1, 1,
0.5179601, -0.01916653, 0.8572874, 0.05098039, 0, 1, 1,
0.5197437, 0.6093871, 0.5423016, 0.05490196, 0, 1, 1,
0.5241343, 0.2724726, -0.2208295, 0.0627451, 0, 1, 1,
0.5243671, -0.8171109, 2.302001, 0.06666667, 0, 1, 1,
0.5278158, 2.268676, 0.5348204, 0.07450981, 0, 1, 1,
0.5299983, 0.1413313, 3.117264, 0.07843138, 0, 1, 1,
0.543467, -0.2062349, 0.792204, 0.08627451, 0, 1, 1,
0.5439118, -0.5707238, 1.647716, 0.09019608, 0, 1, 1,
0.5479825, 0.4622586, -0.1527179, 0.09803922, 0, 1, 1,
0.5585628, 0.7950724, 0.3843248, 0.1058824, 0, 1, 1,
0.5618565, 0.214085, 2.108573, 0.1098039, 0, 1, 1,
0.5619021, 2.073028, 0.5927287, 0.1176471, 0, 1, 1,
0.5625336, -0.5415023, 2.76868, 0.1215686, 0, 1, 1,
0.5640042, 1.261056, 0.3415207, 0.1294118, 0, 1, 1,
0.5641137, -1.828464, 3.57507, 0.1333333, 0, 1, 1,
0.5660387, -0.6757965, 3.868529, 0.1411765, 0, 1, 1,
0.5692891, 0.1832525, 1.353741, 0.145098, 0, 1, 1,
0.5776368, 0.202329, 0.8647405, 0.1529412, 0, 1, 1,
0.58134, -0.3830541, 2.806138, 0.1568628, 0, 1, 1,
0.5818308, -0.4117379, 2.179716, 0.1647059, 0, 1, 1,
0.5852953, -0.1684259, 2.26827, 0.1686275, 0, 1, 1,
0.5904161, -0.2290422, 1.218377, 0.1764706, 0, 1, 1,
0.5919537, -0.6103305, 3.365021, 0.1803922, 0, 1, 1,
0.5998245, -1.371755, 3.391501, 0.1882353, 0, 1, 1,
0.6036052, -1.037482, 0.8246388, 0.1921569, 0, 1, 1,
0.6135665, -0.001384476, 2.248718, 0.2, 0, 1, 1,
0.6150542, 0.9850591, -1.382118, 0.2078431, 0, 1, 1,
0.6210417, -0.7714599, 1.068722, 0.2117647, 0, 1, 1,
0.6310939, 0.8420736, 1.475597, 0.2196078, 0, 1, 1,
0.6322631, 0.451921, 0.4401662, 0.2235294, 0, 1, 1,
0.6338984, -0.4235513, 2.062541, 0.2313726, 0, 1, 1,
0.6371509, -0.02443628, 0.4737866, 0.2352941, 0, 1, 1,
0.6376058, -0.5424417, 2.342064, 0.2431373, 0, 1, 1,
0.6385717, 1.195275, -0.8128269, 0.2470588, 0, 1, 1,
0.646138, 1.353481, -0.7695385, 0.254902, 0, 1, 1,
0.6464733, -0.6125956, 3.890065, 0.2588235, 0, 1, 1,
0.6491491, 0.6692504, 2.27954, 0.2666667, 0, 1, 1,
0.6579905, 0.074442, 1.243474, 0.2705882, 0, 1, 1,
0.6583449, -0.6061494, 2.285905, 0.2784314, 0, 1, 1,
0.6659023, 1.32041, 1.139662, 0.282353, 0, 1, 1,
0.6666182, -2.799551, 2.797655, 0.2901961, 0, 1, 1,
0.6717246, -0.1779291, 1.676068, 0.2941177, 0, 1, 1,
0.6754189, 0.8477033, 1.610615, 0.3019608, 0, 1, 1,
0.6762108, 0.05771513, 0.56231, 0.3098039, 0, 1, 1,
0.6766269, 1.99466, 1.225743, 0.3137255, 0, 1, 1,
0.6777389, 0.6202275, -0.001902339, 0.3215686, 0, 1, 1,
0.681223, 1.216947, 1.512776, 0.3254902, 0, 1, 1,
0.6816475, 1.105661, -0.4365096, 0.3333333, 0, 1, 1,
0.683327, 1.488047, -0.481225, 0.3372549, 0, 1, 1,
0.6850443, -0.8918276, 3.144095, 0.345098, 0, 1, 1,
0.6863974, -0.6884609, 3.748641, 0.3490196, 0, 1, 1,
0.6864024, 1.929268, 1.107434, 0.3568628, 0, 1, 1,
0.6864827, -0.8170483, 1.862288, 0.3607843, 0, 1, 1,
0.6869208, -0.8076906, 2.150719, 0.3686275, 0, 1, 1,
0.6919605, -0.9192048, 2.989406, 0.372549, 0, 1, 1,
0.6922695, 2.30865, -0.2598601, 0.3803922, 0, 1, 1,
0.6941482, 0.1243365, 0.4402569, 0.3843137, 0, 1, 1,
0.694577, -1.633395, 2.169385, 0.3921569, 0, 1, 1,
0.6945906, 0.7195095, 0.3975435, 0.3960784, 0, 1, 1,
0.6956093, -0.9889403, 3.116347, 0.4039216, 0, 1, 1,
0.6963891, 2.714566, 0.5013818, 0.4117647, 0, 1, 1,
0.6979929, 1.009023, 0.3687778, 0.4156863, 0, 1, 1,
0.7000708, -0.6701722, 2.051283, 0.4235294, 0, 1, 1,
0.7049291, -0.3034595, 1.665769, 0.427451, 0, 1, 1,
0.7077342, -1.540976, 3.346283, 0.4352941, 0, 1, 1,
0.7104099, 1.058317, 2.068768, 0.4392157, 0, 1, 1,
0.7111591, -0.2060453, 0.8077862, 0.4470588, 0, 1, 1,
0.7115032, -2.985718, 2.794621, 0.4509804, 0, 1, 1,
0.7123823, -1.137894, 3.434051, 0.4588235, 0, 1, 1,
0.7152624, -0.6313149, 3.281356, 0.4627451, 0, 1, 1,
0.7210315, 0.4567714, -0.544375, 0.4705882, 0, 1, 1,
0.7235064, -0.3775403, 2.848521, 0.4745098, 0, 1, 1,
0.7235453, 0.2649646, 0.9930322, 0.4823529, 0, 1, 1,
0.7285432, -0.3972814, 2.961136, 0.4862745, 0, 1, 1,
0.7325281, -0.8471485, 3.658688, 0.4941176, 0, 1, 1,
0.735904, -0.4830545, 0.06120084, 0.5019608, 0, 1, 1,
0.7359582, 0.6205182, -0.05655552, 0.5058824, 0, 1, 1,
0.7362185, 2.004966, 0.4418695, 0.5137255, 0, 1, 1,
0.7363639, 1.053984, 0.9350503, 0.5176471, 0, 1, 1,
0.736883, 0.6359223, 1.247015, 0.5254902, 0, 1, 1,
0.7371262, -0.023077, 0.4938135, 0.5294118, 0, 1, 1,
0.7436923, -2.01002, 1.83752, 0.5372549, 0, 1, 1,
0.7461043, 1.377409, 0.7023239, 0.5411765, 0, 1, 1,
0.7512293, -0.8991822, 0.9441697, 0.5490196, 0, 1, 1,
0.7592351, -1.147676, 2.043612, 0.5529412, 0, 1, 1,
0.7619821, -1.777458, 2.356152, 0.5607843, 0, 1, 1,
0.763221, 0.6718593, 0.3427255, 0.5647059, 0, 1, 1,
0.7647646, 2.182349, -0.265095, 0.572549, 0, 1, 1,
0.7665107, -1.120949, 2.652186, 0.5764706, 0, 1, 1,
0.7738229, -1.507482, 2.773505, 0.5843138, 0, 1, 1,
0.779909, 0.4045262, 0.7717041, 0.5882353, 0, 1, 1,
0.7884781, 1.127906, 0.5717224, 0.5960785, 0, 1, 1,
0.7887014, 0.505444, -0.5637939, 0.6039216, 0, 1, 1,
0.7915018, -1.674196, 3.068361, 0.6078432, 0, 1, 1,
0.8043939, 0.2779641, 1.609938, 0.6156863, 0, 1, 1,
0.8058015, 0.9814561, 1.500953, 0.6196079, 0, 1, 1,
0.8103558, -0.5026081, 2.883711, 0.627451, 0, 1, 1,
0.8220779, -0.8641601, 1.59571, 0.6313726, 0, 1, 1,
0.8260191, 0.2992614, 0.6102463, 0.6392157, 0, 1, 1,
0.8276617, 0.3420467, 0.6074443, 0.6431373, 0, 1, 1,
0.830462, 0.5887952, 0.238355, 0.6509804, 0, 1, 1,
0.832104, -0.9304517, 2.207024, 0.654902, 0, 1, 1,
0.8321699, -0.9786053, 1.437663, 0.6627451, 0, 1, 1,
0.8330138, -0.6466364, 0.70323, 0.6666667, 0, 1, 1,
0.8330246, -0.06090129, 1.290318, 0.6745098, 0, 1, 1,
0.8396257, 0.8587716, 2.081892, 0.6784314, 0, 1, 1,
0.8419258, -0.5441325, 2.352677, 0.6862745, 0, 1, 1,
0.8471022, -0.6555023, 1.645085, 0.6901961, 0, 1, 1,
0.8475949, 0.02811501, 2.253928, 0.6980392, 0, 1, 1,
0.8613665, 1.590834, 0.5135506, 0.7058824, 0, 1, 1,
0.8662205, 0.6108902, 1.384126, 0.7098039, 0, 1, 1,
0.8663149, 0.2267496, 2.608427, 0.7176471, 0, 1, 1,
0.8681147, -0.3262706, -0.05504883, 0.7215686, 0, 1, 1,
0.8688096, 0.3657454, 1.856401, 0.7294118, 0, 1, 1,
0.876184, -0.6885383, 3.061122, 0.7333333, 0, 1, 1,
0.8781405, 1.143285, -1.230725, 0.7411765, 0, 1, 1,
0.8831975, -0.1008158, 0.9848767, 0.7450981, 0, 1, 1,
0.8882865, 2.343436, -0.8127964, 0.7529412, 0, 1, 1,
0.8890395, -0.1590568, 3.642651, 0.7568628, 0, 1, 1,
0.8946126, 0.4282433, -0.9016765, 0.7647059, 0, 1, 1,
0.8947256, 0.9459768, 1.101584, 0.7686275, 0, 1, 1,
0.8950066, -0.2505401, 1.714016, 0.7764706, 0, 1, 1,
0.8963752, -0.2495272, 3.027027, 0.7803922, 0, 1, 1,
0.9026327, 0.09452488, 0.6119632, 0.7882353, 0, 1, 1,
0.9078316, 1.14764, -0.7258976, 0.7921569, 0, 1, 1,
0.9088638, -0.8322322, 1.287737, 0.8, 0, 1, 1,
0.9138061, 0.5588644, 0.5744299, 0.8078431, 0, 1, 1,
0.9203233, -0.2159582, -0.271577, 0.8117647, 0, 1, 1,
0.923662, -2.351796, 1.401043, 0.8196079, 0, 1, 1,
0.9320594, 0.6398978, 1.98969, 0.8235294, 0, 1, 1,
0.9321947, -0.1946515, 3.074891, 0.8313726, 0, 1, 1,
0.934343, -1.187084, 2.387293, 0.8352941, 0, 1, 1,
0.9357768, -0.7753029, 3.756153, 0.8431373, 0, 1, 1,
0.9473141, -0.8062989, 2.182292, 0.8470588, 0, 1, 1,
0.9651849, -0.9725178, 1.169816, 0.854902, 0, 1, 1,
0.9652494, 1.270513, 0.9210669, 0.8588235, 0, 1, 1,
0.9680046, 0.3371923, 1.322465, 0.8666667, 0, 1, 1,
0.9693361, -1.725675, 1.474106, 0.8705882, 0, 1, 1,
0.9723333, -0.7299324, 1.069884, 0.8784314, 0, 1, 1,
0.9759414, -0.1987001, 2.235212, 0.8823529, 0, 1, 1,
0.9778406, -0.58795, -0.1000872, 0.8901961, 0, 1, 1,
0.9899369, 1.695719, 1.528059, 0.8941177, 0, 1, 1,
0.9944136, 1.052691, 1.302969, 0.9019608, 0, 1, 1,
0.9984822, 0.0849229, 0.1397369, 0.9098039, 0, 1, 1,
0.999832, -0.5076284, 1.874448, 0.9137255, 0, 1, 1,
1.000391, 0.05400573, 0.5323297, 0.9215686, 0, 1, 1,
1.001404, 0.6522496, 0.8403506, 0.9254902, 0, 1, 1,
1.004687, -1.092985, 3.140924, 0.9333333, 0, 1, 1,
1.011314, 2.759725, -0.01140462, 0.9372549, 0, 1, 1,
1.015332, -0.3275258, 1.730945, 0.945098, 0, 1, 1,
1.018038, 0.835227, 1.251753, 0.9490196, 0, 1, 1,
1.025752, -0.7640908, 2.315059, 0.9568627, 0, 1, 1,
1.034136, -1.417675, 1.851895, 0.9607843, 0, 1, 1,
1.038851, -0.2954149, 0.5550104, 0.9686275, 0, 1, 1,
1.043783, -0.5875323, 1.814788, 0.972549, 0, 1, 1,
1.044745, 0.05777588, 1.597165, 0.9803922, 0, 1, 1,
1.051078, -0.9527529, 1.276259, 0.9843137, 0, 1, 1,
1.053337, -2.809765, 2.14075, 0.9921569, 0, 1, 1,
1.056263, 0.9593065, 0.6612643, 0.9960784, 0, 1, 1,
1.05842, -0.0213644, 2.369895, 1, 0, 0.9960784, 1,
1.067405, 0.4186903, 1.488811, 1, 0, 0.9882353, 1,
1.070012, -0.08920559, 1.286296, 1, 0, 0.9843137, 1,
1.074614, 0.2279256, 1.598146, 1, 0, 0.9764706, 1,
1.079431, 1.322706, 1.704649, 1, 0, 0.972549, 1,
1.086058, -1.806602, 4.040353, 1, 0, 0.9647059, 1,
1.096099, 0.6516442, 1.402644, 1, 0, 0.9607843, 1,
1.105953, -0.7557839, 2.7728, 1, 0, 0.9529412, 1,
1.106123, -2.252911, 2.243414, 1, 0, 0.9490196, 1,
1.106657, 0.3584001, 1.149702, 1, 0, 0.9411765, 1,
1.107784, 1.449652, 0.7972199, 1, 0, 0.9372549, 1,
1.114459, -0.2339714, 1.704702, 1, 0, 0.9294118, 1,
1.114956, 1.31345, 2.285249, 1, 0, 0.9254902, 1,
1.115283, 0.5717019, 1.559468, 1, 0, 0.9176471, 1,
1.117728, -0.01097704, 1.342547, 1, 0, 0.9137255, 1,
1.119133, 2.747843, -0.08223599, 1, 0, 0.9058824, 1,
1.125761, 1.100849, 0.8183438, 1, 0, 0.9019608, 1,
1.126871, 0.9463958, 0.6711664, 1, 0, 0.8941177, 1,
1.14107, -1.475924, 1.500523, 1, 0, 0.8862745, 1,
1.143803, 0.5983379, 2.716537, 1, 0, 0.8823529, 1,
1.144885, 0.1562819, 1.056127, 1, 0, 0.8745098, 1,
1.146066, 0.1105507, 1.178226, 1, 0, 0.8705882, 1,
1.14956, 0.456058, 1.564329, 1, 0, 0.8627451, 1,
1.150191, -1.505028, 1.931677, 1, 0, 0.8588235, 1,
1.155672, -0.1274848, 1.482475, 1, 0, 0.8509804, 1,
1.158359, -1.351826, 3.208067, 1, 0, 0.8470588, 1,
1.159157, 0.8130479, -1.081985, 1, 0, 0.8392157, 1,
1.161858, 0.05196275, 2.85029, 1, 0, 0.8352941, 1,
1.167535, -0.3403857, 1.25554, 1, 0, 0.827451, 1,
1.168762, 0.1170714, 3.19128, 1, 0, 0.8235294, 1,
1.178592, 1.861691, 0.2139659, 1, 0, 0.8156863, 1,
1.192902, 1.232775, 1.096842, 1, 0, 0.8117647, 1,
1.195199, -0.6225011, 2.501468, 1, 0, 0.8039216, 1,
1.196012, -0.08800641, 1.783021, 1, 0, 0.7960784, 1,
1.196042, 0.8337858, 0.3400709, 1, 0, 0.7921569, 1,
1.197048, 0.6004218, -0.7245352, 1, 0, 0.7843137, 1,
1.197461, 0.9616529, 0.6318074, 1, 0, 0.7803922, 1,
1.198655, 0.1502373, 2.941052, 1, 0, 0.772549, 1,
1.200371, 0.6999496, 2.11624, 1, 0, 0.7686275, 1,
1.209016, -1.071013, 1.775908, 1, 0, 0.7607843, 1,
1.209645, 1.796069, 0.5736607, 1, 0, 0.7568628, 1,
1.219378, 0.3743507, -0.6260338, 1, 0, 0.7490196, 1,
1.223905, -0.7724838, 1.882612, 1, 0, 0.7450981, 1,
1.231532, -0.08337235, 2.004569, 1, 0, 0.7372549, 1,
1.238309, 1.137505, 0.01703114, 1, 0, 0.7333333, 1,
1.242916, -0.08075945, 2.277363, 1, 0, 0.7254902, 1,
1.244518, -1.97964, -0.005010594, 1, 0, 0.7215686, 1,
1.245515, 0.9008403, 0.2329692, 1, 0, 0.7137255, 1,
1.252963, -1.724764, 2.820727, 1, 0, 0.7098039, 1,
1.25356, 0.2508639, 0.2819069, 1, 0, 0.7019608, 1,
1.254183, -1.326965, 2.708113, 1, 0, 0.6941177, 1,
1.266205, 0.2047714, 2.759672, 1, 0, 0.6901961, 1,
1.274598, -0.7670905, 1.700399, 1, 0, 0.682353, 1,
1.279204, -0.0460791, 1.742288, 1, 0, 0.6784314, 1,
1.281904, 0.8405504, -1.083809, 1, 0, 0.6705883, 1,
1.2852, -0.6198214, 1.939225, 1, 0, 0.6666667, 1,
1.285663, -1.058711, 1.39533, 1, 0, 0.6588235, 1,
1.303744, -1.057415, 2.561633, 1, 0, 0.654902, 1,
1.318184, 0.2002999, 1.656027, 1, 0, 0.6470588, 1,
1.318828, 1.099914, 3.252675, 1, 0, 0.6431373, 1,
1.323141, 1.588136, 1.373914, 1, 0, 0.6352941, 1,
1.323564, -0.3174549, 1.443901, 1, 0, 0.6313726, 1,
1.329822, -0.5353399, 1.273657, 1, 0, 0.6235294, 1,
1.340385, -0.2851088, 3.549699, 1, 0, 0.6196079, 1,
1.355997, 0.1037932, 1.294014, 1, 0, 0.6117647, 1,
1.357153, 0.799376, 0.09922901, 1, 0, 0.6078432, 1,
1.357459, -1.485349, 2.107985, 1, 0, 0.6, 1,
1.366033, 0.6232966, 1.15776, 1, 0, 0.5921569, 1,
1.373172, -0.03056562, 3.029353, 1, 0, 0.5882353, 1,
1.389973, 0.5870275, 0.9198279, 1, 0, 0.5803922, 1,
1.392074, 2.322879, -0.9024465, 1, 0, 0.5764706, 1,
1.411864, -1.528614, 1.9046, 1, 0, 0.5686275, 1,
1.41442, 1.668538, -0.4273517, 1, 0, 0.5647059, 1,
1.439241, 0.4726034, 0.9302608, 1, 0, 0.5568628, 1,
1.442025, 0.9842254, 0.232377, 1, 0, 0.5529412, 1,
1.450597, -0.05149747, 2.005731, 1, 0, 0.5450981, 1,
1.454165, 0.2185751, 0.4837427, 1, 0, 0.5411765, 1,
1.4546, -0.211775, 0.8172144, 1, 0, 0.5333334, 1,
1.460453, 1.595177, -0.3928208, 1, 0, 0.5294118, 1,
1.483535, -1.929005, 2.28866, 1, 0, 0.5215687, 1,
1.500576, -1.204538, 4.446193, 1, 0, 0.5176471, 1,
1.504351, -1.254399, 2.469612, 1, 0, 0.509804, 1,
1.508232, -0.7255542, 2.084543, 1, 0, 0.5058824, 1,
1.508326, 1.501196, 2.178573, 1, 0, 0.4980392, 1,
1.521436, 0.4707099, 2.196016, 1, 0, 0.4901961, 1,
1.524192, -1.362839, 2.19735, 1, 0, 0.4862745, 1,
1.535216, -0.6144346, 1.50232, 1, 0, 0.4784314, 1,
1.548914, -1.054123, 2.741352, 1, 0, 0.4745098, 1,
1.561968, -0.3084751, 1.685567, 1, 0, 0.4666667, 1,
1.562453, -2.441334, 2.860177, 1, 0, 0.4627451, 1,
1.570005, -0.5384921, 1.97452, 1, 0, 0.454902, 1,
1.570681, -0.4952575, 2.640568, 1, 0, 0.4509804, 1,
1.574176, 0.600657, 2.016271, 1, 0, 0.4431373, 1,
1.591403, -1.045396, 1.321371, 1, 0, 0.4392157, 1,
1.602183, -0.9177551, 2.079872, 1, 0, 0.4313726, 1,
1.609727, -0.804162, 3.016498, 1, 0, 0.427451, 1,
1.630868, 0.1014927, 1.672205, 1, 0, 0.4196078, 1,
1.650981, -1.160716, 1.805426, 1, 0, 0.4156863, 1,
1.655377, -0.1157501, 2.583704, 1, 0, 0.4078431, 1,
1.664041, 0.883058, 0.8492516, 1, 0, 0.4039216, 1,
1.677405, -1.386642, 3.6062, 1, 0, 0.3960784, 1,
1.68609, -0.09325615, 3.803164, 1, 0, 0.3882353, 1,
1.697908, -1.674949, 1.230322, 1, 0, 0.3843137, 1,
1.702435, 1.041981, 2.047909, 1, 0, 0.3764706, 1,
1.70567, -0.2153383, -1.944851, 1, 0, 0.372549, 1,
1.728883, -0.2824925, -0.06279007, 1, 0, 0.3647059, 1,
1.734366, 0.6723863, 1.15959, 1, 0, 0.3607843, 1,
1.734727, 0.5168233, -1.315338, 1, 0, 0.3529412, 1,
1.745212, -0.7689372, 0.2897704, 1, 0, 0.3490196, 1,
1.748481, -0.5567177, 2.651258, 1, 0, 0.3411765, 1,
1.75327, -1.105081, 2.902873, 1, 0, 0.3372549, 1,
1.757937, -0.3595425, 1.201355, 1, 0, 0.3294118, 1,
1.766699, -1.288549, 2.510855, 1, 0, 0.3254902, 1,
1.790395, -0.198018, 0.6025701, 1, 0, 0.3176471, 1,
1.801582, -0.4901581, 4.303951, 1, 0, 0.3137255, 1,
1.816151, -0.2776646, 2.449085, 1, 0, 0.3058824, 1,
1.824941, 1.14188, 1.053753, 1, 0, 0.2980392, 1,
1.825029, 0.03017553, 1.146207, 1, 0, 0.2941177, 1,
1.83863, 0.366826, 3.471323, 1, 0, 0.2862745, 1,
1.859336, 1.484943, -0.1763206, 1, 0, 0.282353, 1,
1.885413, -0.1206945, 0.7135201, 1, 0, 0.2745098, 1,
1.888401, -0.7565361, 1.68331, 1, 0, 0.2705882, 1,
1.90067, -0.4743426, 1.585189, 1, 0, 0.2627451, 1,
1.916508, 0.8908969, 1.716423, 1, 0, 0.2588235, 1,
1.917144, 0.1009794, 0.09727155, 1, 0, 0.2509804, 1,
1.920001, -0.2577466, 1.268542, 1, 0, 0.2470588, 1,
1.920074, -0.3764378, 3.535167, 1, 0, 0.2392157, 1,
1.935657, 0.5869628, 0.5773271, 1, 0, 0.2352941, 1,
1.938174, -1.629611, 1.113811, 1, 0, 0.227451, 1,
1.940908, 0.248785, 4.312922, 1, 0, 0.2235294, 1,
1.943961, 1.154892, 0.6295393, 1, 0, 0.2156863, 1,
1.944249, 0.4965416, 0.4392461, 1, 0, 0.2117647, 1,
1.954903, -0.690684, 2.245419, 1, 0, 0.2039216, 1,
1.955061, 0.5110825, 1.199559, 1, 0, 0.1960784, 1,
1.957931, -0.8092309, -0.05911933, 1, 0, 0.1921569, 1,
2.010831, -0.1282247, 3.984821, 1, 0, 0.1843137, 1,
2.010961, -1.678739, 1.682835, 1, 0, 0.1803922, 1,
2.01842, -1.072448, 1.927084, 1, 0, 0.172549, 1,
2.047407, -0.1156007, 1.464819, 1, 0, 0.1686275, 1,
2.078377, 0.8128446, 1.850858, 1, 0, 0.1607843, 1,
2.107044, 0.8395491, 1.561023, 1, 0, 0.1568628, 1,
2.116568, 0.9207444, 0.9747043, 1, 0, 0.1490196, 1,
2.131883, -0.9971974, 2.931324, 1, 0, 0.145098, 1,
2.164343, 0.6782597, 1.82531, 1, 0, 0.1372549, 1,
2.182835, 0.4775058, 1.241461, 1, 0, 0.1333333, 1,
2.203738, -0.6939335, 2.298943, 1, 0, 0.1254902, 1,
2.249743, 0.723778, 1.319395, 1, 0, 0.1215686, 1,
2.310778, -0.7881985, 2.37528, 1, 0, 0.1137255, 1,
2.411021, -0.933813, 1.913976, 1, 0, 0.1098039, 1,
2.413024, 0.6781626, 0.5283791, 1, 0, 0.1019608, 1,
2.461963, -1.087457, 1.659976, 1, 0, 0.09411765, 1,
2.484381, -0.3427086, 2.540542, 1, 0, 0.09019608, 1,
2.571481, 0.2772807, 1.527709, 1, 0, 0.08235294, 1,
2.622428, -2.146804, 3.805554, 1, 0, 0.07843138, 1,
2.633334, -0.5841376, 1.542366, 1, 0, 0.07058824, 1,
2.677905, 1.031566, -1.165, 1, 0, 0.06666667, 1,
2.76104, -1.062645, -0.5487288, 1, 0, 0.05882353, 1,
2.808079, -0.9107284, 0.4643053, 1, 0, 0.05490196, 1,
2.87736, -1.815826, 2.988014, 1, 0, 0.04705882, 1,
2.953573, 2.328917, 1.367233, 1, 0, 0.04313726, 1,
2.995975, -0.8996674, 1.251029, 1, 0, 0.03529412, 1,
3.057766, 0.9668822, 2.529157, 1, 0, 0.03137255, 1,
3.142448, 0.6513475, 0.05059986, 1, 0, 0.02352941, 1,
3.16065, 0.7507737, 1.462086, 1, 0, 0.01960784, 1,
3.293615, -1.657571, 0.9918752, 1, 0, 0.01176471, 1,
3.627071, 0.03031444, -0.4243695, 1, 0, 0.007843138, 1
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
0.1342649, -4.393079, -7.055635, 0, -0.5, 0.5, 0.5,
0.1342649, -4.393079, -7.055635, 1, -0.5, 0.5, 0.5,
0.1342649, -4.393079, -7.055635, 1, 1.5, 0.5, 0.5,
0.1342649, -4.393079, -7.055635, 0, 1.5, 0.5, 0.5
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
-4.542602, 0.05600941, -7.055635, 0, -0.5, 0.5, 0.5,
-4.542602, 0.05600941, -7.055635, 1, -0.5, 0.5, 0.5,
-4.542602, 0.05600941, -7.055635, 1, 1.5, 0.5, 0.5,
-4.542602, 0.05600941, -7.055635, 0, 1.5, 0.5, 0.5
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
-4.542602, -4.393079, -0.1740477, 0, -0.5, 0.5, 0.5,
-4.542602, -4.393079, -0.1740477, 1, -0.5, 0.5, 0.5,
-4.542602, -4.393079, -0.1740477, 1, 1.5, 0.5, 0.5,
-4.542602, -4.393079, -0.1740477, 0, 1.5, 0.5, 0.5
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
-3, -3.366366, -5.467577,
3, -3.366366, -5.467577,
-3, -3.366366, -5.467577,
-3, -3.537485, -5.732253,
-2, -3.366366, -5.467577,
-2, -3.537485, -5.732253,
-1, -3.366366, -5.467577,
-1, -3.537485, -5.732253,
0, -3.366366, -5.467577,
0, -3.537485, -5.732253,
1, -3.366366, -5.467577,
1, -3.537485, -5.732253,
2, -3.366366, -5.467577,
2, -3.537485, -5.732253,
3, -3.366366, -5.467577,
3, -3.537485, -5.732253
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
-3, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
-3, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
-3, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
-3, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
-2, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
-2, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
-2, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
-2, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
-1, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
-1, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
-1, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
-1, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
0, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
0, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
0, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
0, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
1, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
1, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
1, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
1, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
2, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
2, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
2, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
2, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5,
3, -3.879722, -6.261606, 0, -0.5, 0.5, 0.5,
3, -3.879722, -6.261606, 1, -0.5, 0.5, 0.5,
3, -3.879722, -6.261606, 1, 1.5, 0.5, 0.5,
3, -3.879722, -6.261606, 0, 1.5, 0.5, 0.5
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
-3.463325, -3, -5.467577,
-3.463325, 3, -5.467577,
-3.463325, -3, -5.467577,
-3.643204, -3, -5.732253,
-3.463325, -2, -5.467577,
-3.643204, -2, -5.732253,
-3.463325, -1, -5.467577,
-3.643204, -1, -5.732253,
-3.463325, 0, -5.467577,
-3.643204, 0, -5.732253,
-3.463325, 1, -5.467577,
-3.643204, 1, -5.732253,
-3.463325, 2, -5.467577,
-3.643204, 2, -5.732253,
-3.463325, 3, -5.467577,
-3.643204, 3, -5.732253
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
-4.002964, -3, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, -3, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, -3, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, -3, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, -2, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, -2, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, -2, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, -2, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, -1, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, -1, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, -1, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, -1, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, 0, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, 0, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, 0, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, 0, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, 1, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, 1, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, 1, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, 1, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, 2, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, 2, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, 2, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, 2, -6.261606, 0, 1.5, 0.5, 0.5,
-4.002964, 3, -6.261606, 0, -0.5, 0.5, 0.5,
-4.002964, 3, -6.261606, 1, -0.5, 0.5, 0.5,
-4.002964, 3, -6.261606, 1, 1.5, 0.5, 0.5,
-4.002964, 3, -6.261606, 0, 1.5, 0.5, 0.5
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
-3.463325, -3.366366, -4,
-3.463325, -3.366366, 4,
-3.463325, -3.366366, -4,
-3.643204, -3.537485, -4,
-3.463325, -3.366366, -2,
-3.643204, -3.537485, -2,
-3.463325, -3.366366, 0,
-3.643204, -3.537485, 0,
-3.463325, -3.366366, 2,
-3.643204, -3.537485, 2,
-3.463325, -3.366366, 4,
-3.643204, -3.537485, 4
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
-4.002964, -3.879722, -4, 0, -0.5, 0.5, 0.5,
-4.002964, -3.879722, -4, 1, -0.5, 0.5, 0.5,
-4.002964, -3.879722, -4, 1, 1.5, 0.5, 0.5,
-4.002964, -3.879722, -4, 0, 1.5, 0.5, 0.5,
-4.002964, -3.879722, -2, 0, -0.5, 0.5, 0.5,
-4.002964, -3.879722, -2, 1, -0.5, 0.5, 0.5,
-4.002964, -3.879722, -2, 1, 1.5, 0.5, 0.5,
-4.002964, -3.879722, -2, 0, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 0, 0, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 0, 1, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 0, 1, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 0, 0, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 2, 0, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 2, 1, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 2, 1, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 2, 0, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 4, 0, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 4, 1, -0.5, 0.5, 0.5,
-4.002964, -3.879722, 4, 1, 1.5, 0.5, 0.5,
-4.002964, -3.879722, 4, 0, 1.5, 0.5, 0.5
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
-3.463325, -3.366366, -5.467577,
-3.463325, 3.478385, -5.467577,
-3.463325, -3.366366, 5.119481,
-3.463325, 3.478385, 5.119481,
-3.463325, -3.366366, -5.467577,
-3.463325, -3.366366, 5.119481,
-3.463325, 3.478385, -5.467577,
-3.463325, 3.478385, 5.119481,
-3.463325, -3.366366, -5.467577,
3.731855, -3.366366, -5.467577,
-3.463325, -3.366366, 5.119481,
3.731855, -3.366366, 5.119481,
-3.463325, 3.478385, -5.467577,
3.731855, 3.478385, -5.467577,
-3.463325, 3.478385, 5.119481,
3.731855, 3.478385, 5.119481,
3.731855, -3.366366, -5.467577,
3.731855, 3.478385, -5.467577,
3.731855, -3.366366, 5.119481,
3.731855, 3.478385, 5.119481,
3.731855, -3.366366, -5.467577,
3.731855, -3.366366, 5.119481,
3.731855, 3.478385, -5.467577,
3.731855, 3.478385, 5.119481
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
var radius = 7.751129;
var distance = 34.48565;
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
mvMatrix.translate( -0.1342649, -0.05600941, 0.1740477 );
mvMatrix.scale( 1.164762, 1.224394, 0.791596 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48565);
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


