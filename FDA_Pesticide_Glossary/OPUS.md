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
-3.057293, -0.2939951, 0.2005601, 1, 0, 0, 1,
-2.655833, -0.5917007, -3.848094, 1, 0.007843138, 0, 1,
-2.586897, 0.1111558, -1.088882, 1, 0.01176471, 0, 1,
-2.579479, 0.1878525, -0.9719329, 1, 0.01960784, 0, 1,
-2.518018, -1.638697, -3.897096, 1, 0.02352941, 0, 1,
-2.487122, 0.6032851, -1.228156, 1, 0.03137255, 0, 1,
-2.332914, -0.4894891, -1.252032, 1, 0.03529412, 0, 1,
-2.239054, 1.008983, -0.5300285, 1, 0.04313726, 0, 1,
-2.21052, -0.7039081, -2.567911, 1, 0.04705882, 0, 1,
-2.200961, -0.5211123, -1.303336, 1, 0.05490196, 0, 1,
-2.147568, -0.3370325, -0.3689147, 1, 0.05882353, 0, 1,
-1.994444, -2.171087, -4.615699, 1, 0.06666667, 0, 1,
-1.980948, 0.1098894, -2.532156, 1, 0.07058824, 0, 1,
-1.977553, -2.927605, -2.732094, 1, 0.07843138, 0, 1,
-1.975353, 1.439587, -1.126286, 1, 0.08235294, 0, 1,
-1.952353, -1.112062, -1.411749, 1, 0.09019608, 0, 1,
-1.880249, 1.418611, -2.116242, 1, 0.09411765, 0, 1,
-1.875145, 0.6482748, -0.2291742, 1, 0.1019608, 0, 1,
-1.874953, 0.8363459, -3.913897, 1, 0.1098039, 0, 1,
-1.865364, -1.57518, -1.566116, 1, 0.1137255, 0, 1,
-1.861725, -1.435997, -1.76673, 1, 0.1215686, 0, 1,
-1.858376, 1.217133, -1.893495, 1, 0.1254902, 0, 1,
-1.847236, 0.2413829, -2.794201, 1, 0.1333333, 0, 1,
-1.838699, -1.491028, -3.051401, 1, 0.1372549, 0, 1,
-1.829253, 1.74748, 0.2451394, 1, 0.145098, 0, 1,
-1.824812, 0.3991389, -0.02611938, 1, 0.1490196, 0, 1,
-1.823215, 0.2446714, -1.314954, 1, 0.1568628, 0, 1,
-1.822728, 0.06606802, -2.784745, 1, 0.1607843, 0, 1,
-1.780632, 0.8479779, 1.441794, 1, 0.1686275, 0, 1,
-1.775625, -1.092876, -2.480197, 1, 0.172549, 0, 1,
-1.769503, 0.7953737, -0.6600829, 1, 0.1803922, 0, 1,
-1.747671, 1.544063, 0.2651848, 1, 0.1843137, 0, 1,
-1.735482, 0.2429192, -1.015753, 1, 0.1921569, 0, 1,
-1.730071, 0.2652854, -0.6131091, 1, 0.1960784, 0, 1,
-1.72431, 0.6838488, -1.516198, 1, 0.2039216, 0, 1,
-1.708542, 0.05249165, -2.003657, 1, 0.2117647, 0, 1,
-1.702856, -0.897507, -2.746361, 1, 0.2156863, 0, 1,
-1.70204, -0.792467, -2.881397, 1, 0.2235294, 0, 1,
-1.69498, -0.2530645, -2.660366, 1, 0.227451, 0, 1,
-1.683661, 0.05826213, -0.412985, 1, 0.2352941, 0, 1,
-1.67085, 0.8465514, -2.163819, 1, 0.2392157, 0, 1,
-1.66255, -1.075354, -2.862535, 1, 0.2470588, 0, 1,
-1.643407, -1.504311, -2.718079, 1, 0.2509804, 0, 1,
-1.638416, 0.4507583, 0.01727979, 1, 0.2588235, 0, 1,
-1.626871, -0.8661435, -0.464983, 1, 0.2627451, 0, 1,
-1.607625, -0.3893367, -0.1944208, 1, 0.2705882, 0, 1,
-1.606008, -1.050852, -1.637463, 1, 0.2745098, 0, 1,
-1.594458, -0.004816607, -3.359923, 1, 0.282353, 0, 1,
-1.591184, -1.466515, -1.813495, 1, 0.2862745, 0, 1,
-1.581534, -1.267623, -1.205708, 1, 0.2941177, 0, 1,
-1.576901, -0.9484564, -2.73419, 1, 0.3019608, 0, 1,
-1.576282, -0.7465705, -3.406446, 1, 0.3058824, 0, 1,
-1.572101, -0.8356835, -1.622887, 1, 0.3137255, 0, 1,
-1.560579, -0.2008159, -3.293458, 1, 0.3176471, 0, 1,
-1.555434, -1.469942, -3.676224, 1, 0.3254902, 0, 1,
-1.536777, 0.5641581, -1.616783, 1, 0.3294118, 0, 1,
-1.52101, -0.5444114, -0.4920073, 1, 0.3372549, 0, 1,
-1.513061, -0.6442037, -2.186747, 1, 0.3411765, 0, 1,
-1.508842, 0.2311465, -1.652026, 1, 0.3490196, 0, 1,
-1.503335, 0.7246804, -1.335739, 1, 0.3529412, 0, 1,
-1.497098, -0.1465018, -0.927503, 1, 0.3607843, 0, 1,
-1.496245, 0.2313398, -2.784411, 1, 0.3647059, 0, 1,
-1.495495, -0.153005, -1.849449, 1, 0.372549, 0, 1,
-1.47198, -0.1030594, -2.018576, 1, 0.3764706, 0, 1,
-1.463459, 0.2581321, -2.387902, 1, 0.3843137, 0, 1,
-1.462567, 0.5295826, -1.932686, 1, 0.3882353, 0, 1,
-1.452158, 0.5536003, -2.911429, 1, 0.3960784, 0, 1,
-1.449804, -1.22108, -1.036334, 1, 0.4039216, 0, 1,
-1.442177, -0.4433866, -3.267633, 1, 0.4078431, 0, 1,
-1.426929, -0.03881836, -1.363577, 1, 0.4156863, 0, 1,
-1.410138, -0.3969354, -2.871961, 1, 0.4196078, 0, 1,
-1.402096, 1.50547, -1.343399, 1, 0.427451, 0, 1,
-1.398015, -1.277385, -0.929342, 1, 0.4313726, 0, 1,
-1.397827, -0.06780053, -1.103524, 1, 0.4392157, 0, 1,
-1.397472, -0.3190677, -0.3226177, 1, 0.4431373, 0, 1,
-1.392261, 1.265622, -2.315318, 1, 0.4509804, 0, 1,
-1.388785, 2.534871, -0.4066656, 1, 0.454902, 0, 1,
-1.384009, 2.398094, -1.805491, 1, 0.4627451, 0, 1,
-1.375152, -1.213005, -3.069767, 1, 0.4666667, 0, 1,
-1.373463, -1.609888, -2.266375, 1, 0.4745098, 0, 1,
-1.371585, 0.3357249, -1.037048, 1, 0.4784314, 0, 1,
-1.36933, -0.5927414, -0.3955427, 1, 0.4862745, 0, 1,
-1.34609, -1.315913, -1.916243, 1, 0.4901961, 0, 1,
-1.338539, 0.8249336, 1.234413, 1, 0.4980392, 0, 1,
-1.328301, 1.380312, -2.361193, 1, 0.5058824, 0, 1,
-1.313762, -0.281038, -1.619311, 1, 0.509804, 0, 1,
-1.303239, -0.6104693, -2.436924, 1, 0.5176471, 0, 1,
-1.301997, 0.5448493, -0.8005681, 1, 0.5215687, 0, 1,
-1.293396, 0.6955155, -0.6597579, 1, 0.5294118, 0, 1,
-1.291506, -0.6539096, -2.822654, 1, 0.5333334, 0, 1,
-1.290159, 1.540161, 0.0645816, 1, 0.5411765, 0, 1,
-1.286925, -0.6045387, -0.9003248, 1, 0.5450981, 0, 1,
-1.267838, 0.7681382, -2.782349, 1, 0.5529412, 0, 1,
-1.267771, 0.6103062, -0.8279086, 1, 0.5568628, 0, 1,
-1.249356, -0.4315863, -0.08764802, 1, 0.5647059, 0, 1,
-1.242772, -1.116371, -3.928391, 1, 0.5686275, 0, 1,
-1.241875, 0.825094, -0.8587706, 1, 0.5764706, 0, 1,
-1.237586, 0.1358264, -4.071674, 1, 0.5803922, 0, 1,
-1.236126, -0.5912661, 0.4004996, 1, 0.5882353, 0, 1,
-1.233239, 2.164381, -1.507375, 1, 0.5921569, 0, 1,
-1.22956, -0.9319633, -3.467122, 1, 0.6, 0, 1,
-1.225832, -0.005145609, -0.5972859, 1, 0.6078432, 0, 1,
-1.207844, 1.390011, -1.550295, 1, 0.6117647, 0, 1,
-1.205101, -0.03913138, -0.6008181, 1, 0.6196079, 0, 1,
-1.202983, -0.3009643, -0.751725, 1, 0.6235294, 0, 1,
-1.199349, 0.9392409, -2.423419, 1, 0.6313726, 0, 1,
-1.196758, 1.022124, 0.09939098, 1, 0.6352941, 0, 1,
-1.192593, -0.6408713, -2.388885, 1, 0.6431373, 0, 1,
-1.186478, -1.388808, -2.297565, 1, 0.6470588, 0, 1,
-1.158965, 1.896059, -0.5894932, 1, 0.654902, 0, 1,
-1.15881, 0.2067872, -0.4763058, 1, 0.6588235, 0, 1,
-1.151296, 0.9133175, 0.9119301, 1, 0.6666667, 0, 1,
-1.147967, 0.8850113, -1.093958, 1, 0.6705883, 0, 1,
-1.144168, -0.7131565, -3.092862, 1, 0.6784314, 0, 1,
-1.143448, -1.764731, -4.012149, 1, 0.682353, 0, 1,
-1.135705, -1.00432, -2.285989, 1, 0.6901961, 0, 1,
-1.134432, -0.2033829, -2.026752, 1, 0.6941177, 0, 1,
-1.122526, 0.7092381, -0.08453523, 1, 0.7019608, 0, 1,
-1.115458, -1.159864, -0.5867264, 1, 0.7098039, 0, 1,
-1.107044, -0.2758193, -2.772008, 1, 0.7137255, 0, 1,
-1.100595, -0.2323198, -1.926992, 1, 0.7215686, 0, 1,
-1.099937, -0.535739, -2.794237, 1, 0.7254902, 0, 1,
-1.084244, -0.8802613, -1.584083, 1, 0.7333333, 0, 1,
-1.082218, -0.4355879, 0.6344083, 1, 0.7372549, 0, 1,
-1.07985, -0.6607242, -0.3278125, 1, 0.7450981, 0, 1,
-1.07805, 0.9320979, 0.04843052, 1, 0.7490196, 0, 1,
-1.068171, 0.2576422, -2.074986, 1, 0.7568628, 0, 1,
-1.065001, -0.009625365, -0.7897148, 1, 0.7607843, 0, 1,
-1.061432, 1.037499, 0.1457908, 1, 0.7686275, 0, 1,
-1.057338, 1.225926, -0.7029971, 1, 0.772549, 0, 1,
-1.055548, -0.5734066, -2.86791, 1, 0.7803922, 0, 1,
-1.048745, 1.476887, -0.09270944, 1, 0.7843137, 0, 1,
-1.048549, -0.06304052, 0.03703352, 1, 0.7921569, 0, 1,
-1.042693, -2.310421, -4.612065, 1, 0.7960784, 0, 1,
-1.030489, 0.1351319, -4.084496, 1, 0.8039216, 0, 1,
-1.015727, -0.4316593, -3.047279, 1, 0.8117647, 0, 1,
-1.014434, 0.1472557, -1.777329, 1, 0.8156863, 0, 1,
-1.010273, -0.349071, -1.133876, 1, 0.8235294, 0, 1,
-1.008916, -1.302395, -0.391899, 1, 0.827451, 0, 1,
-1.007323, -0.7298627, -1.354991, 1, 0.8352941, 0, 1,
-1.003942, -1.049235, -2.538539, 1, 0.8392157, 0, 1,
-1.002596, -0.05265696, -2.168219, 1, 0.8470588, 0, 1,
-1.000061, 0.2023688, -1.323957, 1, 0.8509804, 0, 1,
-0.9991623, -1.411136, -2.05531, 1, 0.8588235, 0, 1,
-0.9944792, 2.047151, -0.2912599, 1, 0.8627451, 0, 1,
-0.9923198, 0.1544569, -0.1857788, 1, 0.8705882, 0, 1,
-0.9891616, -2.451779, -2.109386, 1, 0.8745098, 0, 1,
-0.983412, -1.134933, -2.28383, 1, 0.8823529, 0, 1,
-0.9814193, -0.2171516, -2.411154, 1, 0.8862745, 0, 1,
-0.9789283, -0.6154243, -1.934565, 1, 0.8941177, 0, 1,
-0.9775941, 1.198682, -0.5183492, 1, 0.8980392, 0, 1,
-0.97496, -1.416437, -1.491931, 1, 0.9058824, 0, 1,
-0.9695761, -0.7339313, -2.9661, 1, 0.9137255, 0, 1,
-0.9664339, 0.294713, -0.9438904, 1, 0.9176471, 0, 1,
-0.9579927, -1.453233, -4.084015, 1, 0.9254902, 0, 1,
-0.9519061, -1.018707, 0.2330161, 1, 0.9294118, 0, 1,
-0.9504159, -1.305931, -3.219828, 1, 0.9372549, 0, 1,
-0.9453876, -0.07128873, -1.474348, 1, 0.9411765, 0, 1,
-0.9409754, -0.4387661, -2.818635, 1, 0.9490196, 0, 1,
-0.9399732, 0.1529363, -0.4951635, 1, 0.9529412, 0, 1,
-0.9377021, -0.6082534, -0.8129413, 1, 0.9607843, 0, 1,
-0.9364783, 1.331594, -0.1521935, 1, 0.9647059, 0, 1,
-0.9349067, -0.6667867, -2.337667, 1, 0.972549, 0, 1,
-0.9322664, -0.5289554, -3.133981, 1, 0.9764706, 0, 1,
-0.9319764, 0.1097992, -1.972346, 1, 0.9843137, 0, 1,
-0.9303873, -0.01139238, -1.931435, 1, 0.9882353, 0, 1,
-0.9279007, 0.5512789, -0.02474243, 1, 0.9960784, 0, 1,
-0.9225816, -2.199312, -3.395046, 0.9960784, 1, 0, 1,
-0.9184771, 0.757292, -0.812118, 0.9921569, 1, 0, 1,
-0.9073179, -2.006305, -3.04777, 0.9843137, 1, 0, 1,
-0.9029202, -0.8010804, -2.673504, 0.9803922, 1, 0, 1,
-0.8874252, -1.375242, -3.281203, 0.972549, 1, 0, 1,
-0.8837224, -0.05119349, -1.5507, 0.9686275, 1, 0, 1,
-0.8774908, 0.4871386, -0.6342422, 0.9607843, 1, 0, 1,
-0.8740739, -0.08757357, -1.967671, 0.9568627, 1, 0, 1,
-0.8740295, 0.1554912, 1.62216, 0.9490196, 1, 0, 1,
-0.8638783, 1.011526, 0.3851382, 0.945098, 1, 0, 1,
-0.8575008, -0.3920448, 0.3069487, 0.9372549, 1, 0, 1,
-0.8515534, -1.464772, -1.592778, 0.9333333, 1, 0, 1,
-0.8500947, -0.5504833, -0.7451106, 0.9254902, 1, 0, 1,
-0.8487687, -0.1366782, -1.91852, 0.9215686, 1, 0, 1,
-0.8486923, 0.6553962, 0.5596791, 0.9137255, 1, 0, 1,
-0.8477233, -1.413074, -3.239697, 0.9098039, 1, 0, 1,
-0.8404225, -0.7197407, -1.212826, 0.9019608, 1, 0, 1,
-0.839076, -0.2183118, -0.6361185, 0.8941177, 1, 0, 1,
-0.8355956, -1.292306, -2.549671, 0.8901961, 1, 0, 1,
-0.8349179, 0.03785265, -1.306486, 0.8823529, 1, 0, 1,
-0.8298247, -1.029363, -4.152123, 0.8784314, 1, 0, 1,
-0.8162527, -0.249059, -2.702102, 0.8705882, 1, 0, 1,
-0.8086753, -0.126091, -2.88996, 0.8666667, 1, 0, 1,
-0.8080325, 0.1523237, -0.9793736, 0.8588235, 1, 0, 1,
-0.8048235, 1.119557, 0.7770998, 0.854902, 1, 0, 1,
-0.8003966, -0.4220634, -2.117192, 0.8470588, 1, 0, 1,
-0.7989246, -0.359362, -0.8796523, 0.8431373, 1, 0, 1,
-0.7977644, 0.3249977, -1.698756, 0.8352941, 1, 0, 1,
-0.7959425, 0.01503998, -1.334348, 0.8313726, 1, 0, 1,
-0.7885708, -0.4208448, -0.329203, 0.8235294, 1, 0, 1,
-0.785953, 0.7093133, -0.4266222, 0.8196079, 1, 0, 1,
-0.7846738, -0.8222679, -0.3474645, 0.8117647, 1, 0, 1,
-0.7820196, -0.1317321, -2.211868, 0.8078431, 1, 0, 1,
-0.7786182, 0.04489367, -0.4439743, 0.8, 1, 0, 1,
-0.7778949, -1.40644, -1.797225, 0.7921569, 1, 0, 1,
-0.7749292, 0.5548569, -3.615864, 0.7882353, 1, 0, 1,
-0.7725643, 0.2649118, -0.3521197, 0.7803922, 1, 0, 1,
-0.7643692, -1.528321, -2.086741, 0.7764706, 1, 0, 1,
-0.7606316, -0.9177701, -2.489428, 0.7686275, 1, 0, 1,
-0.7602946, 0.9446697, -0.5380439, 0.7647059, 1, 0, 1,
-0.7598557, 0.5991591, -1.821314, 0.7568628, 1, 0, 1,
-0.7526233, 1.65384, -0.06431659, 0.7529412, 1, 0, 1,
-0.7497959, 0.01783975, -1.374054, 0.7450981, 1, 0, 1,
-0.7456162, 1.811069, 1.425648, 0.7411765, 1, 0, 1,
-0.7454613, 1.150049, 0.879149, 0.7333333, 1, 0, 1,
-0.7452544, -1.438837, -3.928624, 0.7294118, 1, 0, 1,
-0.7439784, -1.315931, -2.198995, 0.7215686, 1, 0, 1,
-0.7411341, 1.069053, 0.1285978, 0.7176471, 1, 0, 1,
-0.7408603, -1.188533, -3.018658, 0.7098039, 1, 0, 1,
-0.7404678, -0.1290446, -2.13938, 0.7058824, 1, 0, 1,
-0.7389512, -0.5375035, -3.115289, 0.6980392, 1, 0, 1,
-0.7339433, -0.128471, -3.491627, 0.6901961, 1, 0, 1,
-0.7329225, -0.5482485, -1.459889, 0.6862745, 1, 0, 1,
-0.7276056, 1.007743, 0.004055268, 0.6784314, 1, 0, 1,
-0.726455, 0.6782404, -1.163726, 0.6745098, 1, 0, 1,
-0.7218614, -0.4489791, -0.9593055, 0.6666667, 1, 0, 1,
-0.7213718, -0.5511229, -0.4921208, 0.6627451, 1, 0, 1,
-0.7176369, -0.8489829, -3.105291, 0.654902, 1, 0, 1,
-0.7152173, -1.582868, -3.124713, 0.6509804, 1, 0, 1,
-0.7143048, 0.4463142, -0.01365141, 0.6431373, 1, 0, 1,
-0.7132263, 2.397909, -2.522228, 0.6392157, 1, 0, 1,
-0.7125645, 0.1203277, -1.764246, 0.6313726, 1, 0, 1,
-0.7083014, 0.5857223, 0.7150053, 0.627451, 1, 0, 1,
-0.7077745, 0.1702505, -1.954542, 0.6196079, 1, 0, 1,
-0.7045842, 0.8013356, -1.39279, 0.6156863, 1, 0, 1,
-0.7020273, 0.5150494, 0.6972568, 0.6078432, 1, 0, 1,
-0.6995233, -0.6115822, -3.027397, 0.6039216, 1, 0, 1,
-0.6969292, 0.2136235, -2.087321, 0.5960785, 1, 0, 1,
-0.6951349, 0.6895342, 0.08144137, 0.5882353, 1, 0, 1,
-0.6945648, -0.7601031, -3.389344, 0.5843138, 1, 0, 1,
-0.6939893, 0.5899343, 0.2546311, 0.5764706, 1, 0, 1,
-0.6884741, 1.2973, -1.94854, 0.572549, 1, 0, 1,
-0.6818379, -0.1848374, -2.667975, 0.5647059, 1, 0, 1,
-0.6817558, -0.5363654, -2.282597, 0.5607843, 1, 0, 1,
-0.678041, -0.1027911, -3.559487, 0.5529412, 1, 0, 1,
-0.6773227, -0.3425799, -1.759992, 0.5490196, 1, 0, 1,
-0.6764631, -2.729048, -3.023685, 0.5411765, 1, 0, 1,
-0.6747311, -0.08530344, 0.2629569, 0.5372549, 1, 0, 1,
-0.6724093, 0.6713398, -0.536769, 0.5294118, 1, 0, 1,
-0.6651664, -0.1979196, -2.166107, 0.5254902, 1, 0, 1,
-0.6623828, 0.03696167, -3.507516, 0.5176471, 1, 0, 1,
-0.6572794, -0.1315288, 0.8344458, 0.5137255, 1, 0, 1,
-0.6521049, -0.3555863, -1.829001, 0.5058824, 1, 0, 1,
-0.6499396, 0.309054, -1.611147, 0.5019608, 1, 0, 1,
-0.6442568, 0.5929762, -4.508097, 0.4941176, 1, 0, 1,
-0.6349525, 1.641685, -0.08612722, 0.4862745, 1, 0, 1,
-0.6327068, 1.105804, -1.493566, 0.4823529, 1, 0, 1,
-0.6281148, -1.431168, -2.31661, 0.4745098, 1, 0, 1,
-0.6277347, 1.249094, -1.580422, 0.4705882, 1, 0, 1,
-0.6271394, -0.9980614, -3.413295, 0.4627451, 1, 0, 1,
-0.6265207, 0.08601321, -0.9157051, 0.4588235, 1, 0, 1,
-0.6225062, -0.7640361, -2.400244, 0.4509804, 1, 0, 1,
-0.621608, 0.5584093, -0.9784263, 0.4470588, 1, 0, 1,
-0.6214542, -0.4170243, -3.671523, 0.4392157, 1, 0, 1,
-0.6192831, -1.378645, -3.978123, 0.4352941, 1, 0, 1,
-0.6021264, -0.3098603, -2.802444, 0.427451, 1, 0, 1,
-0.5967566, 0.927948, -0.04007154, 0.4235294, 1, 0, 1,
-0.5932378, 0.5826976, -1.376752, 0.4156863, 1, 0, 1,
-0.5918099, -0.04187081, -1.010129, 0.4117647, 1, 0, 1,
-0.5915221, -0.3172203, -1.583661, 0.4039216, 1, 0, 1,
-0.5893328, -1.774763, -4.093806, 0.3960784, 1, 0, 1,
-0.5877495, 0.7117913, -1.123927, 0.3921569, 1, 0, 1,
-0.5863285, -1.384585, -2.283669, 0.3843137, 1, 0, 1,
-0.5814685, 2.684143, -0.8503125, 0.3803922, 1, 0, 1,
-0.5789126, -0.1148692, -1.825949, 0.372549, 1, 0, 1,
-0.5776066, -0.5565239, -2.507918, 0.3686275, 1, 0, 1,
-0.576816, -0.8790432, -4.128012, 0.3607843, 1, 0, 1,
-0.5728339, 0.5520247, -0.3306181, 0.3568628, 1, 0, 1,
-0.5688381, 2.493402, -0.6298704, 0.3490196, 1, 0, 1,
-0.5680576, 0.4690981, 0.2057258, 0.345098, 1, 0, 1,
-0.5621238, -1.230536, -2.361287, 0.3372549, 1, 0, 1,
-0.5615962, 1.136184, -0.9206067, 0.3333333, 1, 0, 1,
-0.5580872, -1.739864, -1.428821, 0.3254902, 1, 0, 1,
-0.5580183, -0.2383614, -1.433312, 0.3215686, 1, 0, 1,
-0.5578835, 2.379916, -0.06117981, 0.3137255, 1, 0, 1,
-0.5569301, 1.055815, 1.491386, 0.3098039, 1, 0, 1,
-0.5529616, 0.2455151, -1.508688, 0.3019608, 1, 0, 1,
-0.5509151, 2.099855, -2.40008, 0.2941177, 1, 0, 1,
-0.5440041, -0.9406284, -5.419869, 0.2901961, 1, 0, 1,
-0.5430354, 0.2234066, 0.140766, 0.282353, 1, 0, 1,
-0.5429065, -1.183628, -2.473744, 0.2784314, 1, 0, 1,
-0.5361974, -0.5509186, -2.471645, 0.2705882, 1, 0, 1,
-0.5341786, 3.302762, 2.030576, 0.2666667, 1, 0, 1,
-0.5327157, 0.4038398, -0.9739223, 0.2588235, 1, 0, 1,
-0.5296244, -2.110651, -1.68783, 0.254902, 1, 0, 1,
-0.5237892, -0.640147, -2.402716, 0.2470588, 1, 0, 1,
-0.5234328, 0.1252264, -0.9912245, 0.2431373, 1, 0, 1,
-0.5179068, 0.7370616, -0.5821952, 0.2352941, 1, 0, 1,
-0.5157993, 1.095541, -1.53775, 0.2313726, 1, 0, 1,
-0.5151973, -0.3722502, -2.283224, 0.2235294, 1, 0, 1,
-0.5141093, 0.2160034, -2.838433, 0.2196078, 1, 0, 1,
-0.5135889, -0.6775023, -3.30544, 0.2117647, 1, 0, 1,
-0.5093378, -1.678009, -3.945835, 0.2078431, 1, 0, 1,
-0.5028182, -0.0424171, -1.423457, 0.2, 1, 0, 1,
-0.49806, 0.4038802, -1.219462, 0.1921569, 1, 0, 1,
-0.4980241, -0.5876725, -2.210039, 0.1882353, 1, 0, 1,
-0.4957791, -0.3320133, -2.214753, 0.1803922, 1, 0, 1,
-0.4937327, 0.7144335, 0.2157466, 0.1764706, 1, 0, 1,
-0.4883146, 1.475993, -0.2407994, 0.1686275, 1, 0, 1,
-0.4863895, 0.9926134, -2.003821, 0.1647059, 1, 0, 1,
-0.4857399, -0.8481374, -1.735475, 0.1568628, 1, 0, 1,
-0.4844057, -0.08140884, -0.05837521, 0.1529412, 1, 0, 1,
-0.4805123, -0.1988465, -1.847572, 0.145098, 1, 0, 1,
-0.4773585, 0.485071, -0.940961, 0.1411765, 1, 0, 1,
-0.4674467, 1.206357, -0.652128, 0.1333333, 1, 0, 1,
-0.4634549, -1.445093, -3.902493, 0.1294118, 1, 0, 1,
-0.4630842, -1.64947, -5.116442, 0.1215686, 1, 0, 1,
-0.4630352, -0.167311, -3.417263, 0.1176471, 1, 0, 1,
-0.4610346, -0.3840675, -2.999305, 0.1098039, 1, 0, 1,
-0.4595902, 0.2406353, -0.01683825, 0.1058824, 1, 0, 1,
-0.452152, 0.7120229, -1.101231, 0.09803922, 1, 0, 1,
-0.44908, -1.832833, -3.307179, 0.09019608, 1, 0, 1,
-0.4468469, -1.200464, -2.075873, 0.08627451, 1, 0, 1,
-0.4464099, -0.8811876, -4.384305, 0.07843138, 1, 0, 1,
-0.4446006, -1.029842, -4.385738, 0.07450981, 1, 0, 1,
-0.4401706, -0.5116867, -1.65882, 0.06666667, 1, 0, 1,
-0.4395363, -0.145645, -0.4799117, 0.0627451, 1, 0, 1,
-0.4395354, 0.6064833, 0.01430701, 0.05490196, 1, 0, 1,
-0.4391317, 0.03968085, -1.590319, 0.05098039, 1, 0, 1,
-0.437102, 0.3560091, -1.618526, 0.04313726, 1, 0, 1,
-0.4337547, 0.45486, 0.3090953, 0.03921569, 1, 0, 1,
-0.4333625, 0.2839865, -2.32307, 0.03137255, 1, 0, 1,
-0.4311873, -0.6484483, -2.21245, 0.02745098, 1, 0, 1,
-0.4298188, 2.439086, 0.9127659, 0.01960784, 1, 0, 1,
-0.4275169, -1.522879, -2.586213, 0.01568628, 1, 0, 1,
-0.4256334, 0.3814512, -1.608914, 0.007843138, 1, 0, 1,
-0.4241365, 0.3351764, 0.2063437, 0.003921569, 1, 0, 1,
-0.4221097, 0.4507378, 0.008494429, 0, 1, 0.003921569, 1,
-0.4158062, 0.6273007, -0.510371, 0, 1, 0.01176471, 1,
-0.4149731, -1.010209, -2.39758, 0, 1, 0.01568628, 1,
-0.4091338, 1.848346, 0.6513431, 0, 1, 0.02352941, 1,
-0.4045543, -0.123586, -2.709285, 0, 1, 0.02745098, 1,
-0.4022878, 2.221241, 0.6080402, 0, 1, 0.03529412, 1,
-0.4019888, -0.9162495, -1.822733, 0, 1, 0.03921569, 1,
-0.4018902, 1.471686, 0.07662982, 0, 1, 0.04705882, 1,
-0.3978708, -0.6345496, -3.322623, 0, 1, 0.05098039, 1,
-0.3918853, -0.3627534, -2.904768, 0, 1, 0.05882353, 1,
-0.3901799, -0.6950483, -5.942988, 0, 1, 0.0627451, 1,
-0.3876039, 0.3995344, -0.7596005, 0, 1, 0.07058824, 1,
-0.3831567, 0.2647012, -2.73361, 0, 1, 0.07450981, 1,
-0.3823429, -0.02351686, -0.8216984, 0, 1, 0.08235294, 1,
-0.3820332, -0.3485345, -2.111233, 0, 1, 0.08627451, 1,
-0.379455, -0.624869, -2.164656, 0, 1, 0.09411765, 1,
-0.3785998, 1.448853, -0.7589355, 0, 1, 0.1019608, 1,
-0.3748676, 1.383628, -0.4787216, 0, 1, 0.1058824, 1,
-0.3672746, -0.6940511, -1.321143, 0, 1, 0.1137255, 1,
-0.3672049, 0.2306356, -1.201115, 0, 1, 0.1176471, 1,
-0.3637288, -0.7614125, -1.932333, 0, 1, 0.1254902, 1,
-0.3594715, 0.8063868, -0.6569507, 0, 1, 0.1294118, 1,
-0.3587054, -0.9079239, -2.389553, 0, 1, 0.1372549, 1,
-0.3565725, -1.086768, -3.271526, 0, 1, 0.1411765, 1,
-0.3536694, -0.7711427, -2.095277, 0, 1, 0.1490196, 1,
-0.352265, -2.082433, -2.031325, 0, 1, 0.1529412, 1,
-0.3508483, 1.892697, -0.4445067, 0, 1, 0.1607843, 1,
-0.3473514, -0.0726018, -3.18688, 0, 1, 0.1647059, 1,
-0.3459935, 0.3975025, -1.61254, 0, 1, 0.172549, 1,
-0.3458259, -0.5952875, -3.111729, 0, 1, 0.1764706, 1,
-0.3442437, -1.152976, -2.681417, 0, 1, 0.1843137, 1,
-0.344088, -0.8050273, -3.247363, 0, 1, 0.1882353, 1,
-0.3404803, -0.4691844, -1.745374, 0, 1, 0.1960784, 1,
-0.3366617, 1.533771, -1.174009, 0, 1, 0.2039216, 1,
-0.3352786, 0.4506084, -1.099669, 0, 1, 0.2078431, 1,
-0.3336954, -1.372199, -5.234486, 0, 1, 0.2156863, 1,
-0.3335037, -0.7080965, -2.852477, 0, 1, 0.2196078, 1,
-0.3277097, 1.023607, 1.506184, 0, 1, 0.227451, 1,
-0.3276432, 1.585151, 0.1290597, 0, 1, 0.2313726, 1,
-0.3241692, -1.348411, -3.452275, 0, 1, 0.2392157, 1,
-0.3161575, -0.9799678, -3.559656, 0, 1, 0.2431373, 1,
-0.3104485, 1.959314, -0.3358169, 0, 1, 0.2509804, 1,
-0.3100636, 1.097602, -1.62647, 0, 1, 0.254902, 1,
-0.3049591, -3.411948, -3.344178, 0, 1, 0.2627451, 1,
-0.3021787, -0.6963319, -1.617496, 0, 1, 0.2666667, 1,
-0.2954698, 0.4514831, -0.2850638, 0, 1, 0.2745098, 1,
-0.2905083, -0.6772323, -2.610034, 0, 1, 0.2784314, 1,
-0.2878284, -0.3786416, -2.931623, 0, 1, 0.2862745, 1,
-0.2859319, 1.765199, -0.3413518, 0, 1, 0.2901961, 1,
-0.2841546, -0.4638453, -4.40927, 0, 1, 0.2980392, 1,
-0.28257, -0.004914396, -0.5241161, 0, 1, 0.3058824, 1,
-0.2800305, 2.040476, -0.06850186, 0, 1, 0.3098039, 1,
-0.2795396, 0.4393246, -2.352356, 0, 1, 0.3176471, 1,
-0.2773368, -1.521247, -1.976674, 0, 1, 0.3215686, 1,
-0.2734187, -2.465162, -2.838018, 0, 1, 0.3294118, 1,
-0.2686265, 0.4371168, -0.412651, 0, 1, 0.3333333, 1,
-0.2643819, -0.654786, -1.097836, 0, 1, 0.3411765, 1,
-0.2640101, 0.9215194, -1.367321, 0, 1, 0.345098, 1,
-0.2609027, -1.273903, -1.712713, 0, 1, 0.3529412, 1,
-0.2590407, 0.4656938, -0.7576604, 0, 1, 0.3568628, 1,
-0.2518979, 0.2710135, -1.660502, 0, 1, 0.3647059, 1,
-0.2455527, 0.423053, -1.086692, 0, 1, 0.3686275, 1,
-0.2400389, -1.127109, -2.352886, 0, 1, 0.3764706, 1,
-0.2400211, 0.8087995, 0.4144788, 0, 1, 0.3803922, 1,
-0.2393587, -1.9299, -3.208088, 0, 1, 0.3882353, 1,
-0.2378839, -2.874208, -1.673422, 0, 1, 0.3921569, 1,
-0.2367294, 1.014664, -1.105977, 0, 1, 0.4, 1,
-0.2344962, 1.025195, -0.3067175, 0, 1, 0.4078431, 1,
-0.2324037, 1.619454, 0.663372, 0, 1, 0.4117647, 1,
-0.2272992, -1.422815, -5.010849, 0, 1, 0.4196078, 1,
-0.2262872, -0.9094646, -2.826543, 0, 1, 0.4235294, 1,
-0.2228085, -1.249689, -2.907319, 0, 1, 0.4313726, 1,
-0.2192294, 1.11289, -1.022952, 0, 1, 0.4352941, 1,
-0.2160837, -0.2231132, -3.368669, 0, 1, 0.4431373, 1,
-0.2115678, 2.439245, -0.8625965, 0, 1, 0.4470588, 1,
-0.2094835, -0.2182485, -2.95001, 0, 1, 0.454902, 1,
-0.2048663, 0.2357567, -1.364599, 0, 1, 0.4588235, 1,
-0.2029138, 0.2000772, -0.0872971, 0, 1, 0.4666667, 1,
-0.1974893, -2.475675, -5.842955, 0, 1, 0.4705882, 1,
-0.1953577, 0.2127223, -0.5923361, 0, 1, 0.4784314, 1,
-0.1946224, -0.06302784, -2.818108, 0, 1, 0.4823529, 1,
-0.1889334, -0.4227594, -2.297282, 0, 1, 0.4901961, 1,
-0.1861438, -1.75834, -3.270175, 0, 1, 0.4941176, 1,
-0.1837643, -0.9476314, -2.953145, 0, 1, 0.5019608, 1,
-0.1753321, -0.5680063, -1.28862, 0, 1, 0.509804, 1,
-0.1744439, 2.345796, 0.8648861, 0, 1, 0.5137255, 1,
-0.1732255, -1.656857, -3.093093, 0, 1, 0.5215687, 1,
-0.1686472, 0.0992882, -1.080103, 0, 1, 0.5254902, 1,
-0.1670863, -0.9953373, -3.720816, 0, 1, 0.5333334, 1,
-0.1621232, 0.1555509, -0.1123299, 0, 1, 0.5372549, 1,
-0.160679, -0.6196626, -3.572482, 0, 1, 0.5450981, 1,
-0.1589863, -0.5106087, -1.725893, 0, 1, 0.5490196, 1,
-0.1574699, 0.6118661, 0.1991386, 0, 1, 0.5568628, 1,
-0.1511494, -0.7939468, -3.990647, 0, 1, 0.5607843, 1,
-0.1469273, 0.3227952, -0.6306809, 0, 1, 0.5686275, 1,
-0.1447268, 0.806822, -0.8462536, 0, 1, 0.572549, 1,
-0.143418, -2.040528, -2.539304, 0, 1, 0.5803922, 1,
-0.1409763, -1.56316, -4.58723, 0, 1, 0.5843138, 1,
-0.140672, 0.6945906, -2.279085, 0, 1, 0.5921569, 1,
-0.1404406, 0.2188095, 0.09161314, 0, 1, 0.5960785, 1,
-0.1391954, -0.9899703, -2.712146, 0, 1, 0.6039216, 1,
-0.1374274, 0.6597075, -1.42608, 0, 1, 0.6117647, 1,
-0.1300766, 0.9338179, 2.071121, 0, 1, 0.6156863, 1,
-0.1258759, 0.5447285, -0.6506712, 0, 1, 0.6235294, 1,
-0.1254685, 2.345398, 0.4555865, 0, 1, 0.627451, 1,
-0.1226211, 0.4847636, -1.694272, 0, 1, 0.6352941, 1,
-0.1221907, 0.08781133, -0.625913, 0, 1, 0.6392157, 1,
-0.1175862, 0.1654178, -0.4907131, 0, 1, 0.6470588, 1,
-0.1150784, 0.5419191, -1.145684, 0, 1, 0.6509804, 1,
-0.1147223, 0.6974103, -1.176713, 0, 1, 0.6588235, 1,
-0.1135497, 0.2100728, -1.27887, 0, 1, 0.6627451, 1,
-0.1115482, 1.312807, -1.143116, 0, 1, 0.6705883, 1,
-0.1086076, 0.965745, 0.7850187, 0, 1, 0.6745098, 1,
-0.1061686, 0.09887763, -0.5472832, 0, 1, 0.682353, 1,
-0.105422, 0.6918901, -0.1164686, 0, 1, 0.6862745, 1,
-0.1052976, -0.7540649, -2.078243, 0, 1, 0.6941177, 1,
-0.1033279, -2.502219, -3.557577, 0, 1, 0.7019608, 1,
-0.0895038, -1.142604, -1.703173, 0, 1, 0.7058824, 1,
-0.08310279, -0.8089172, -3.559979, 0, 1, 0.7137255, 1,
-0.0801259, 0.6733803, -0.8841522, 0, 1, 0.7176471, 1,
-0.07715155, 0.584774, 2.014327, 0, 1, 0.7254902, 1,
-0.0748317, 1.012055, 1.580558, 0, 1, 0.7294118, 1,
-0.07097908, 0.0281731, -0.3033912, 0, 1, 0.7372549, 1,
-0.06686226, -0.4223634, -0.9115043, 0, 1, 0.7411765, 1,
-0.06658176, 1.971847, 0.5727124, 0, 1, 0.7490196, 1,
-0.06378973, -0.03649157, -2.495328, 0, 1, 0.7529412, 1,
-0.06194806, 1.204656, -0.3311418, 0, 1, 0.7607843, 1,
-0.06188925, -2.204599, -3.819566, 0, 1, 0.7647059, 1,
-0.05520475, -1.849631, -3.059119, 0, 1, 0.772549, 1,
-0.0522517, -0.8242719, -2.568415, 0, 1, 0.7764706, 1,
-0.04548261, -0.6558021, -1.85486, 0, 1, 0.7843137, 1,
-0.04143392, -2.121749, -0.5097802, 0, 1, 0.7882353, 1,
-0.04075985, 0.7198937, -1.204013, 0, 1, 0.7960784, 1,
-0.03977483, -0.05695269, -2.302852, 0, 1, 0.8039216, 1,
-0.03772986, -0.3443743, -5.071539, 0, 1, 0.8078431, 1,
-0.03543812, -1.0147, -2.626737, 0, 1, 0.8156863, 1,
-0.0352139, 1.040665, -0.6197619, 0, 1, 0.8196079, 1,
-0.03508866, 0.6075669, -0.9162869, 0, 1, 0.827451, 1,
-0.03138612, -0.8206423, -3.273475, 0, 1, 0.8313726, 1,
-0.02821007, -0.8002226, -2.00264, 0, 1, 0.8392157, 1,
-0.02349037, -2.6925, -2.940325, 0, 1, 0.8431373, 1,
-0.02324839, -0.5012091, -1.758832, 0, 1, 0.8509804, 1,
-0.02169898, 1.261716, -1.278999, 0, 1, 0.854902, 1,
-0.02075671, -0.7657186, -4.007401, 0, 1, 0.8627451, 1,
-0.02042894, 0.4539993, -1.63102, 0, 1, 0.8666667, 1,
-0.01918922, -0.6154252, -2.977343, 0, 1, 0.8745098, 1,
-0.01078624, 1.254397, -0.3854855, 0, 1, 0.8784314, 1,
-0.005700381, 0.03501661, -0.4915362, 0, 1, 0.8862745, 1,
-0.004783019, -1.112507, -3.257769, 0, 1, 0.8901961, 1,
-0.004462357, 0.3078956, -0.9163448, 0, 1, 0.8980392, 1,
-0.0008312674, 0.1455902, 0.4118104, 0, 1, 0.9058824, 1,
0.0005341037, -0.5172167, 1.981568, 0, 1, 0.9098039, 1,
0.0006058624, -0.8759838, 2.734608, 0, 1, 0.9176471, 1,
0.003222805, 0.2147777, 0.5179357, 0, 1, 0.9215686, 1,
0.003674671, -2.135255, 3.105178, 0, 1, 0.9294118, 1,
0.004629026, -0.2618977, 4.169752, 0, 1, 0.9333333, 1,
0.006651853, 0.01838175, 1.081911, 0, 1, 0.9411765, 1,
0.009575296, -0.117626, 3.541982, 0, 1, 0.945098, 1,
0.01270663, 0.1328287, 0.2436055, 0, 1, 0.9529412, 1,
0.01877616, -0.5952015, 3.408686, 0, 1, 0.9568627, 1,
0.02615582, 1.144302, -1.486911, 0, 1, 0.9647059, 1,
0.02678068, 1.33444, 1.726221, 0, 1, 0.9686275, 1,
0.03071002, -0.626937, 3.041817, 0, 1, 0.9764706, 1,
0.03261043, -0.2549842, 3.856485, 0, 1, 0.9803922, 1,
0.03274576, 0.2787779, 0.08287895, 0, 1, 0.9882353, 1,
0.03647924, 0.01792131, 2.731099, 0, 1, 0.9921569, 1,
0.04273772, 1.820383, 2.424756, 0, 1, 1, 1,
0.04357679, 0.5151854, 0.2313541, 0, 0.9921569, 1, 1,
0.04493666, 1.479563, 1.426896, 0, 0.9882353, 1, 1,
0.04535332, 0.3882785, 0.05098368, 0, 0.9803922, 1, 1,
0.04552779, 1.259881, 0.3991902, 0, 0.9764706, 1, 1,
0.04929612, 0.2717669, -0.3506751, 0, 0.9686275, 1, 1,
0.05014868, 1.165935, -0.446287, 0, 0.9647059, 1, 1,
0.05079271, 0.1940307, -0.3996128, 0, 0.9568627, 1, 1,
0.05185885, 0.5630996, 0.6358478, 0, 0.9529412, 1, 1,
0.05363081, -0.7836469, 3.373127, 0, 0.945098, 1, 1,
0.06448655, 0.2025691, -0.3025711, 0, 0.9411765, 1, 1,
0.07726186, 0.9844677, -0.4722253, 0, 0.9333333, 1, 1,
0.07938113, 0.5702429, 0.4892415, 0, 0.9294118, 1, 1,
0.07952742, 0.06394111, 1.632039, 0, 0.9215686, 1, 1,
0.079997, 0.7855814, 0.7810268, 0, 0.9176471, 1, 1,
0.08248609, 0.3939011, -0.4152555, 0, 0.9098039, 1, 1,
0.08602284, -0.4686752, 1.545092, 0, 0.9058824, 1, 1,
0.0913462, 0.4839873, 0.4319109, 0, 0.8980392, 1, 1,
0.09457123, 0.9534948, -0.2595906, 0, 0.8901961, 1, 1,
0.09642623, 0.1630783, 0.8275864, 0, 0.8862745, 1, 1,
0.0966886, -0.4251573, 2.625162, 0, 0.8784314, 1, 1,
0.09856908, 0.03238495, 1.295449, 0, 0.8745098, 1, 1,
0.1024284, 0.1621168, 0.1728758, 0, 0.8666667, 1, 1,
0.102739, 0.5923575, 0.4799651, 0, 0.8627451, 1, 1,
0.1098779, -0.8115435, 1.769622, 0, 0.854902, 1, 1,
0.1108784, -0.2125089, 3.555552, 0, 0.8509804, 1, 1,
0.1142138, -0.8907968, 2.049037, 0, 0.8431373, 1, 1,
0.1160242, 0.1535356, 0.9904469, 0, 0.8392157, 1, 1,
0.117451, 0.4852709, -1.751283, 0, 0.8313726, 1, 1,
0.1245029, -1.331261, 2.732991, 0, 0.827451, 1, 1,
0.1408112, -0.8154186, 5.880603, 0, 0.8196079, 1, 1,
0.1411095, -1.597534, 1.54214, 0, 0.8156863, 1, 1,
0.1456115, -1.805525, 1.520382, 0, 0.8078431, 1, 1,
0.1470246, -0.940349, 3.005328, 0, 0.8039216, 1, 1,
0.1533365, 0.0795003, 1.624012, 0, 0.7960784, 1, 1,
0.1538044, -1.699431, 2.046966, 0, 0.7882353, 1, 1,
0.1602096, -0.5003399, 2.880673, 0, 0.7843137, 1, 1,
0.1627404, -0.570411, 3.635734, 0, 0.7764706, 1, 1,
0.1665078, -1.173229, 2.158849, 0, 0.772549, 1, 1,
0.1680479, -0.3590347, 3.910643, 0, 0.7647059, 1, 1,
0.1717916, 0.2488428, 0.1967322, 0, 0.7607843, 1, 1,
0.1721272, 0.5509515, 2.005199, 0, 0.7529412, 1, 1,
0.1732329, -0.2225265, 2.71283, 0, 0.7490196, 1, 1,
0.1783161, -0.03810517, 1.715845, 0, 0.7411765, 1, 1,
0.1807926, -1.49342, 3.511591, 0, 0.7372549, 1, 1,
0.1849, -3.055284, 2.823484, 0, 0.7294118, 1, 1,
0.1857636, -0.3162359, 2.446845, 0, 0.7254902, 1, 1,
0.1862078, -0.1176052, 2.723837, 0, 0.7176471, 1, 1,
0.1870977, -0.5895563, 2.703954, 0, 0.7137255, 1, 1,
0.1919053, 0.6915146, 1.452443, 0, 0.7058824, 1, 1,
0.1942071, -0.6386629, 2.37627, 0, 0.6980392, 1, 1,
0.1947309, 1.152558, 1.608328, 0, 0.6941177, 1, 1,
0.1953203, -0.4920948, 3.885849, 0, 0.6862745, 1, 1,
0.1985871, 0.1488389, 2.459403, 0, 0.682353, 1, 1,
0.2008838, 1.608611, 0.9999159, 0, 0.6745098, 1, 1,
0.2023445, 0.2921997, -0.6684788, 0, 0.6705883, 1, 1,
0.2027747, -0.2132103, 2.53845, 0, 0.6627451, 1, 1,
0.2052062, 0.1412473, 2.056291, 0, 0.6588235, 1, 1,
0.2064536, 0.03472648, 2.663335, 0, 0.6509804, 1, 1,
0.2098507, 0.1756798, 0.3089224, 0, 0.6470588, 1, 1,
0.2159506, 0.3270301, 0.7936781, 0, 0.6392157, 1, 1,
0.2167099, 1.874544, 2.387086, 0, 0.6352941, 1, 1,
0.2249941, -1.190125, 4.340325, 0, 0.627451, 1, 1,
0.2282066, 0.08551563, 1.03793, 0, 0.6235294, 1, 1,
0.2286604, -0.7123906, 3.960198, 0, 0.6156863, 1, 1,
0.2306789, -1.154626, 3.941258, 0, 0.6117647, 1, 1,
0.2339453, 2.590766, 1.912467, 0, 0.6039216, 1, 1,
0.2361027, 0.9451917, 0.6378296, 0, 0.5960785, 1, 1,
0.2384828, -0.8500674, 4.254854, 0, 0.5921569, 1, 1,
0.238892, -0.4170426, 3.539206, 0, 0.5843138, 1, 1,
0.2426144, 1.421953, 0.01923696, 0, 0.5803922, 1, 1,
0.2432221, -1.503157, 3.217029, 0, 0.572549, 1, 1,
0.2447059, -0.9456668, 1.035672, 0, 0.5686275, 1, 1,
0.2516797, -0.7736703, 2.448244, 0, 0.5607843, 1, 1,
0.2532065, -0.2598854, 1.761101, 0, 0.5568628, 1, 1,
0.2542725, -1.179715, 1.216445, 0, 0.5490196, 1, 1,
0.2586212, -1.756283, 4.330018, 0, 0.5450981, 1, 1,
0.2594348, 0.4247852, 0.7492838, 0, 0.5372549, 1, 1,
0.2597395, 1.128805, -0.2392265, 0, 0.5333334, 1, 1,
0.2608662, 0.7571377, 1.432314, 0, 0.5254902, 1, 1,
0.2668602, 0.2153031, 0.9926723, 0, 0.5215687, 1, 1,
0.2672848, 0.04911842, 2.407269, 0, 0.5137255, 1, 1,
0.2706549, -0.2936992, 1.831945, 0, 0.509804, 1, 1,
0.282645, -1.35808, 1.031458, 0, 0.5019608, 1, 1,
0.2856373, -1.582208, 3.533605, 0, 0.4941176, 1, 1,
0.2874987, -0.61418, 2.457255, 0, 0.4901961, 1, 1,
0.2918278, -1.111819, 3.968835, 0, 0.4823529, 1, 1,
0.2949032, -0.3887313, 3.551426, 0, 0.4784314, 1, 1,
0.2960544, 0.03869922, 2.766572, 0, 0.4705882, 1, 1,
0.2961989, 1.256744, -0.3601159, 0, 0.4666667, 1, 1,
0.3013855, -0.2872989, 2.914067, 0, 0.4588235, 1, 1,
0.30684, 0.5292625, 0.5269992, 0, 0.454902, 1, 1,
0.3089603, -1.464515, 3.093107, 0, 0.4470588, 1, 1,
0.3124018, -1.434711, 2.259482, 0, 0.4431373, 1, 1,
0.313884, 0.2133852, 0.6765465, 0, 0.4352941, 1, 1,
0.315923, -1.597831, 3.277579, 0, 0.4313726, 1, 1,
0.316026, 0.712474, 0.03004081, 0, 0.4235294, 1, 1,
0.3162881, -1.84725, 3.321362, 0, 0.4196078, 1, 1,
0.318227, -0.7351493, 2.742681, 0, 0.4117647, 1, 1,
0.3210661, 0.6295873, 1.860002, 0, 0.4078431, 1, 1,
0.3216363, -0.7972199, 1.898343, 0, 0.4, 1, 1,
0.3241461, 2.217277, -0.1408523, 0, 0.3921569, 1, 1,
0.3248246, -0.782009, 2.930233, 0, 0.3882353, 1, 1,
0.3250726, 1.057751, 0.3692137, 0, 0.3803922, 1, 1,
0.3258846, -0.327111, 2.552544, 0, 0.3764706, 1, 1,
0.3269114, -0.1033319, 2.129171, 0, 0.3686275, 1, 1,
0.3294206, -0.6633694, 2.034764, 0, 0.3647059, 1, 1,
0.3318866, 0.4149507, -0.7099692, 0, 0.3568628, 1, 1,
0.3319358, -0.5804912, 3.47628, 0, 0.3529412, 1, 1,
0.3340119, -0.4021987, 0.3841528, 0, 0.345098, 1, 1,
0.3354849, -0.9028311, 2.662747, 0, 0.3411765, 1, 1,
0.3372703, 0.04156819, 1.228256, 0, 0.3333333, 1, 1,
0.3402005, -0.4679499, 0.2429617, 0, 0.3294118, 1, 1,
0.3427404, 0.9931564, -0.09240189, 0, 0.3215686, 1, 1,
0.3451768, 1.118202, 1.285776, 0, 0.3176471, 1, 1,
0.3466197, 1.599823, 0.8713265, 0, 0.3098039, 1, 1,
0.3529239, 0.793756, 0.7003911, 0, 0.3058824, 1, 1,
0.3561044, 0.1660189, 0.5250479, 0, 0.2980392, 1, 1,
0.3637421, 0.4103336, 0.3265848, 0, 0.2901961, 1, 1,
0.3674935, -1.487301, 2.8669, 0, 0.2862745, 1, 1,
0.3693196, -0.5180972, 2.907931, 0, 0.2784314, 1, 1,
0.3695804, 0.003678626, 1.160397, 0, 0.2745098, 1, 1,
0.3715459, -1.097668, 2.264814, 0, 0.2666667, 1, 1,
0.371572, -0.1958701, 2.399669, 0, 0.2627451, 1, 1,
0.374343, 0.2190583, 0.9881108, 0, 0.254902, 1, 1,
0.3750367, -2.362082, 2.147899, 0, 0.2509804, 1, 1,
0.3771352, 2.2992, 0.3840233, 0, 0.2431373, 1, 1,
0.3772669, -0.3349915, 1.496521, 0, 0.2392157, 1, 1,
0.3820927, -1.920718, 2.451949, 0, 0.2313726, 1, 1,
0.3823979, -1.018057, 1.169562, 0, 0.227451, 1, 1,
0.3850082, 0.5940244, -0.2650903, 0, 0.2196078, 1, 1,
0.3858609, -0.8398643, 4.441717, 0, 0.2156863, 1, 1,
0.38878, -1.94104, 2.73113, 0, 0.2078431, 1, 1,
0.3893245, 2.218254, -0.05430968, 0, 0.2039216, 1, 1,
0.3896412, 1.64508, 1.092394, 0, 0.1960784, 1, 1,
0.3898492, 0.9568228, -0.4415683, 0, 0.1882353, 1, 1,
0.3902701, 1.480907, -0.4186154, 0, 0.1843137, 1, 1,
0.3967487, 0.4990735, 0.6554069, 0, 0.1764706, 1, 1,
0.3975385, 1.236521, -1.689615, 0, 0.172549, 1, 1,
0.397553, 0.4229282, 2.096319, 0, 0.1647059, 1, 1,
0.3993523, -0.2893141, 2.844127, 0, 0.1607843, 1, 1,
0.3997258, -0.3370009, 1.714825, 0, 0.1529412, 1, 1,
0.4009939, -0.7781128, 3.868737, 0, 0.1490196, 1, 1,
0.4030778, -0.5395045, 1.5464, 0, 0.1411765, 1, 1,
0.4043804, -1.846154, 4.040521, 0, 0.1372549, 1, 1,
0.4084057, 0.4567367, -0.8481872, 0, 0.1294118, 1, 1,
0.4104844, 0.6065422, -0.1081164, 0, 0.1254902, 1, 1,
0.411748, 1.266261, 0.139656, 0, 0.1176471, 1, 1,
0.4154102, 1.392734, 0.8862351, 0, 0.1137255, 1, 1,
0.4166216, 0.614679, 1.396608, 0, 0.1058824, 1, 1,
0.4178566, 0.1534993, 1.148431, 0, 0.09803922, 1, 1,
0.4202871, -0.4525922, 3.291801, 0, 0.09411765, 1, 1,
0.4224888, 0.4216882, -0.03631756, 0, 0.08627451, 1, 1,
0.4261154, 0.8553588, 0.4847111, 0, 0.08235294, 1, 1,
0.4273348, 0.1442873, 0.7458068, 0, 0.07450981, 1, 1,
0.4285896, 1.387513, 0.7032627, 0, 0.07058824, 1, 1,
0.4335452, -0.7241824, 3.531564, 0, 0.0627451, 1, 1,
0.4363898, 0.5907202, 1.77368, 0, 0.05882353, 1, 1,
0.4379625, 1.825821, 0.4962614, 0, 0.05098039, 1, 1,
0.4469774, -0.6888742, 3.13038, 0, 0.04705882, 1, 1,
0.4472469, -1.75983, 2.794132, 0, 0.03921569, 1, 1,
0.4486794, -0.9595804, 1.659131, 0, 0.03529412, 1, 1,
0.449866, -0.9505013, 2.741496, 0, 0.02745098, 1, 1,
0.4541012, -0.5125234, 1.382589, 0, 0.02352941, 1, 1,
0.4543279, 1.82299, -0.5948434, 0, 0.01568628, 1, 1,
0.4548528, -0.3549768, 2.319462, 0, 0.01176471, 1, 1,
0.4591875, 1.472131, 1.228286, 0, 0.003921569, 1, 1,
0.4601474, -0.119035, -0.597141, 0.003921569, 0, 1, 1,
0.460299, -0.836206, 2.126062, 0.007843138, 0, 1, 1,
0.4612931, -2.033879, 2.936272, 0.01568628, 0, 1, 1,
0.4622091, -0.2024722, 0.5038569, 0.01960784, 0, 1, 1,
0.4643679, -0.6527669, 3.215019, 0.02745098, 0, 1, 1,
0.4654458, 0.7280694, 0.8631811, 0.03137255, 0, 1, 1,
0.4730676, -0.9448723, 2.146282, 0.03921569, 0, 1, 1,
0.4761596, 0.2128765, -1.142346, 0.04313726, 0, 1, 1,
0.4774448, 0.4373992, 0.5816243, 0.05098039, 0, 1, 1,
0.4808521, 0.9712022, -0.568149, 0.05490196, 0, 1, 1,
0.4834633, 0.753213, -0.7920753, 0.0627451, 0, 1, 1,
0.4882214, -1.141476, 1.043416, 0.06666667, 0, 1, 1,
0.4905878, -0.06693694, 2.108946, 0.07450981, 0, 1, 1,
0.4928902, -0.4210428, 2.432326, 0.07843138, 0, 1, 1,
0.4963848, 0.6635892, 3.452348, 0.08627451, 0, 1, 1,
0.5040851, 0.8083676, 0.03476138, 0.09019608, 0, 1, 1,
0.5070129, -0.1782643, 3.019633, 0.09803922, 0, 1, 1,
0.5094583, 2.269073, 0.7324842, 0.1058824, 0, 1, 1,
0.5115331, -0.1711247, 0.4227628, 0.1098039, 0, 1, 1,
0.5122676, 2.041321, -0.3438578, 0.1176471, 0, 1, 1,
0.5136352, -0.723087, 2.600949, 0.1215686, 0, 1, 1,
0.5166234, 1.151734, 2.827728, 0.1294118, 0, 1, 1,
0.5189294, -0.6001931, 1.482082, 0.1333333, 0, 1, 1,
0.5195963, -0.6867324, 1.939797, 0.1411765, 0, 1, 1,
0.5224306, 0.9377748, 0.4834896, 0.145098, 0, 1, 1,
0.5269402, -0.9493954, 1.143608, 0.1529412, 0, 1, 1,
0.5316056, 0.2633773, -0.5742413, 0.1568628, 0, 1, 1,
0.5351757, -0.4459034, 1.768602, 0.1647059, 0, 1, 1,
0.5402062, -0.9499428, 1.658534, 0.1686275, 0, 1, 1,
0.5452858, 1.033959, -0.183725, 0.1764706, 0, 1, 1,
0.5490556, -1.029717, 1.340707, 0.1803922, 0, 1, 1,
0.5564324, -1.124188, 1.729554, 0.1882353, 0, 1, 1,
0.5584753, 1.168246, 0.8854246, 0.1921569, 0, 1, 1,
0.5586179, -0.03463718, 2.373512, 0.2, 0, 1, 1,
0.5651511, -0.1724875, 2.813287, 0.2078431, 0, 1, 1,
0.5655566, -0.7691805, 1.797391, 0.2117647, 0, 1, 1,
0.5657393, 1.543945, 0.7945265, 0.2196078, 0, 1, 1,
0.5668241, -0.1792658, 1.429053, 0.2235294, 0, 1, 1,
0.5674263, -0.2214736, 2.478087, 0.2313726, 0, 1, 1,
0.569496, 0.8403928, 0.1306673, 0.2352941, 0, 1, 1,
0.5696976, -0.8854246, 0.9038878, 0.2431373, 0, 1, 1,
0.5713419, 1.410932, 0.2323658, 0.2470588, 0, 1, 1,
0.5721279, 0.9661632, 1.711377, 0.254902, 0, 1, 1,
0.5731918, 1.373085, 0.4169007, 0.2588235, 0, 1, 1,
0.5757877, -0.5690519, 2.204622, 0.2666667, 0, 1, 1,
0.5790523, 0.7028424, 0.6838889, 0.2705882, 0, 1, 1,
0.5805079, 0.06853794, 2.641408, 0.2784314, 0, 1, 1,
0.5813479, 0.956483, 0.9194439, 0.282353, 0, 1, 1,
0.5822548, 0.1966198, 1.144794, 0.2901961, 0, 1, 1,
0.5828738, -0.946628, 2.643497, 0.2941177, 0, 1, 1,
0.5838387, -0.06140652, 2.608653, 0.3019608, 0, 1, 1,
0.5840036, -0.2833807, 1.889266, 0.3098039, 0, 1, 1,
0.5904111, -0.3989919, 0.8894448, 0.3137255, 0, 1, 1,
0.5950949, 0.08455648, 2.229585, 0.3215686, 0, 1, 1,
0.5966581, -0.9558982, 3.317529, 0.3254902, 0, 1, 1,
0.5972952, 1.064779, 1.779004, 0.3333333, 0, 1, 1,
0.5974644, 2.026399, 0.6202017, 0.3372549, 0, 1, 1,
0.5984966, -0.07948869, 0.5276334, 0.345098, 0, 1, 1,
0.5992932, -0.7631871, 1.908236, 0.3490196, 0, 1, 1,
0.5997754, 3.899656, -1.468829, 0.3568628, 0, 1, 1,
0.6035114, 0.7878795, 0.6972836, 0.3607843, 0, 1, 1,
0.6128027, -0.886328, 2.424162, 0.3686275, 0, 1, 1,
0.6149466, 1.207141, 0.5884901, 0.372549, 0, 1, 1,
0.6212847, 0.05802834, 1.879167, 0.3803922, 0, 1, 1,
0.6223776, -0.3052461, 1.610401, 0.3843137, 0, 1, 1,
0.6230947, -2.21598, 1.483667, 0.3921569, 0, 1, 1,
0.6254707, -0.0205132, -0.09501127, 0.3960784, 0, 1, 1,
0.628612, 0.3779544, 0.5706769, 0.4039216, 0, 1, 1,
0.6307482, -1.208563, 0.923492, 0.4117647, 0, 1, 1,
0.6316361, -0.6791188, 3.357093, 0.4156863, 0, 1, 1,
0.6326429, 0.6838199, 0.4768257, 0.4235294, 0, 1, 1,
0.6336871, 1.00144, -0.3529289, 0.427451, 0, 1, 1,
0.6544068, -1.652165, 2.426036, 0.4352941, 0, 1, 1,
0.656579, -1.708659, 3.218515, 0.4392157, 0, 1, 1,
0.6677027, 0.5828453, 0.1799724, 0.4470588, 0, 1, 1,
0.6722973, 1.083002, 1.637271, 0.4509804, 0, 1, 1,
0.6734985, -1.080976, 2.177162, 0.4588235, 0, 1, 1,
0.6747815, -0.2110815, 2.58011, 0.4627451, 0, 1, 1,
0.6836233, 0.08864798, 2.086911, 0.4705882, 0, 1, 1,
0.6852306, 1.234104, 1.481212, 0.4745098, 0, 1, 1,
0.6876516, -0.9758047, 1.714092, 0.4823529, 0, 1, 1,
0.6905167, 0.2965661, 1.67254, 0.4862745, 0, 1, 1,
0.7036426, 0.04020999, 2.360175, 0.4941176, 0, 1, 1,
0.7038391, -0.1651422, 2.936916, 0.5019608, 0, 1, 1,
0.7064742, -0.6449668, 2.492242, 0.5058824, 0, 1, 1,
0.7081333, 0.2908918, 1.249981, 0.5137255, 0, 1, 1,
0.7086253, -0.8334832, 1.776195, 0.5176471, 0, 1, 1,
0.7178443, 0.02063389, 2.750102, 0.5254902, 0, 1, 1,
0.7191758, 0.132202, 1.185086, 0.5294118, 0, 1, 1,
0.7199442, 1.53386, -0.02430221, 0.5372549, 0, 1, 1,
0.7222407, 1.695338, 1.632166, 0.5411765, 0, 1, 1,
0.7239733, -0.3154876, 1.032272, 0.5490196, 0, 1, 1,
0.7252537, -0.6124654, 3.057033, 0.5529412, 0, 1, 1,
0.7258067, 0.04896206, 0.8461385, 0.5607843, 0, 1, 1,
0.7275472, -0.9281461, 0.7633764, 0.5647059, 0, 1, 1,
0.7424299, -0.3656099, 1.958125, 0.572549, 0, 1, 1,
0.7438229, -0.08115924, 0.6130102, 0.5764706, 0, 1, 1,
0.7460419, 0.3999128, 0.8448688, 0.5843138, 0, 1, 1,
0.7471676, 0.4602176, 2.488629, 0.5882353, 0, 1, 1,
0.7472433, -0.3839531, 1.132825, 0.5960785, 0, 1, 1,
0.7490057, 0.5828552, 2.208525, 0.6039216, 0, 1, 1,
0.7522262, -0.001593448, 2.086097, 0.6078432, 0, 1, 1,
0.7525252, 0.7357816, 1.135508, 0.6156863, 0, 1, 1,
0.75256, -0.6266922, 1.896673, 0.6196079, 0, 1, 1,
0.7531082, -0.6808762, 0.6570981, 0.627451, 0, 1, 1,
0.7539331, 1.050768, 0.1187278, 0.6313726, 0, 1, 1,
0.7662694, 0.5591255, 0.4419654, 0.6392157, 0, 1, 1,
0.7675468, 0.5310469, 2.16391, 0.6431373, 0, 1, 1,
0.7683259, 2.048819, 0.6324415, 0.6509804, 0, 1, 1,
0.7689742, 0.09428179, 1.081629, 0.654902, 0, 1, 1,
0.7692814, -0.1890299, 1.81616, 0.6627451, 0, 1, 1,
0.7740225, -0.8454754, 2.494003, 0.6666667, 0, 1, 1,
0.7869436, 0.5733755, 1.89875, 0.6745098, 0, 1, 1,
0.787083, -0.794001, 0.929185, 0.6784314, 0, 1, 1,
0.7917299, -0.1232164, 2.142512, 0.6862745, 0, 1, 1,
0.7931846, -2.526626, 3.009467, 0.6901961, 0, 1, 1,
0.7962309, 0.7258207, 1.685008, 0.6980392, 0, 1, 1,
0.8023075, 2.57061, -0.1346978, 0.7058824, 0, 1, 1,
0.806399, -0.003914285, 3.696698, 0.7098039, 0, 1, 1,
0.8099766, -0.3379644, 3.698228, 0.7176471, 0, 1, 1,
0.8135849, -0.04627975, 2.291115, 0.7215686, 0, 1, 1,
0.8207191, 0.5627987, -0.2167828, 0.7294118, 0, 1, 1,
0.8241251, -1.2056, 1.420915, 0.7333333, 0, 1, 1,
0.8247244, -0.8211502, 2.18352, 0.7411765, 0, 1, 1,
0.825367, 1.152905, 0.3465474, 0.7450981, 0, 1, 1,
0.8329804, -1.141953, 1.411548, 0.7529412, 0, 1, 1,
0.833899, 0.5336748, 2.605868, 0.7568628, 0, 1, 1,
0.8350207, -0.3893893, 2.105461, 0.7647059, 0, 1, 1,
0.8387054, 0.5818889, 0.5030956, 0.7686275, 0, 1, 1,
0.8412561, -0.5495398, 2.529588, 0.7764706, 0, 1, 1,
0.843845, 1.598722, 1.647146, 0.7803922, 0, 1, 1,
0.8439552, -1.339929, 2.744669, 0.7882353, 0, 1, 1,
0.8455843, 0.1283625, 1.041867, 0.7921569, 0, 1, 1,
0.8465991, 1.688026, 1.061812, 0.8, 0, 1, 1,
0.8502479, -0.08306894, 2.385201, 0.8078431, 0, 1, 1,
0.8575392, -1.008915, 1.619807, 0.8117647, 0, 1, 1,
0.8575602, 0.8822353, 0.1252577, 0.8196079, 0, 1, 1,
0.8613874, 0.3176278, -1.510771, 0.8235294, 0, 1, 1,
0.8627266, 0.750833, 1.334908, 0.8313726, 0, 1, 1,
0.8630447, 0.1792656, -0.5479429, 0.8352941, 0, 1, 1,
0.8631302, -0.7358589, 2.905324, 0.8431373, 0, 1, 1,
0.8674038, -0.9206881, 2.983284, 0.8470588, 0, 1, 1,
0.8813924, -1.079678, 1.791682, 0.854902, 0, 1, 1,
0.8907859, 0.8229432, 2.315872, 0.8588235, 0, 1, 1,
0.8969507, 0.8580657, 0.04145198, 0.8666667, 0, 1, 1,
0.899851, -1.383296, 1.272717, 0.8705882, 0, 1, 1,
0.9018542, 0.02812269, 2.25604, 0.8784314, 0, 1, 1,
0.9063792, -2.171173, 2.945983, 0.8823529, 0, 1, 1,
0.9086226, -0.2376486, 2.5748, 0.8901961, 0, 1, 1,
0.9093339, -0.1947575, 0.9484257, 0.8941177, 0, 1, 1,
0.9099885, 1.561279, 1.029196, 0.9019608, 0, 1, 1,
0.9103929, 0.1765193, 2.498604, 0.9098039, 0, 1, 1,
0.9109436, 0.1460801, 2.45193, 0.9137255, 0, 1, 1,
0.9127294, 0.2561089, -0.3336275, 0.9215686, 0, 1, 1,
0.9166706, -0.281727, 1.172697, 0.9254902, 0, 1, 1,
0.9195907, -0.5841634, 0.5585687, 0.9333333, 0, 1, 1,
0.9334123, 0.4042761, 0.5372091, 0.9372549, 0, 1, 1,
0.9389355, -0.04501312, 2.128005, 0.945098, 0, 1, 1,
0.9441795, -1.042541, 1.879926, 0.9490196, 0, 1, 1,
0.9449933, 1.006953, -0.2541426, 0.9568627, 0, 1, 1,
0.9485897, -0.05139677, -0.307926, 0.9607843, 0, 1, 1,
0.9562746, 0.8514532, 0.8213118, 0.9686275, 0, 1, 1,
0.9614518, 0.9408405, 1.884636, 0.972549, 0, 1, 1,
0.9634053, 2.900599, 0.1063147, 0.9803922, 0, 1, 1,
0.9652912, -0.2989007, 2.843748, 0.9843137, 0, 1, 1,
0.9681711, -0.8550927, 1.7559, 0.9921569, 0, 1, 1,
0.9711818, -0.7415981, -0.2355197, 0.9960784, 0, 1, 1,
0.9718022, -0.5045501, 2.142217, 1, 0, 0.9960784, 1,
0.9730252, 0.4247246, 1.098933, 1, 0, 0.9882353, 1,
0.9748371, 0.02172312, 1.511601, 1, 0, 0.9843137, 1,
0.9757823, 1.860423, -0.703079, 1, 0, 0.9764706, 1,
0.977691, 1.317731, 1.4648, 1, 0, 0.972549, 1,
0.983489, 0.5541325, 1.298712, 1, 0, 0.9647059, 1,
0.9847398, -0.5758992, 2.543984, 1, 0, 0.9607843, 1,
0.9892879, -0.7360649, 4.062392, 1, 0, 0.9529412, 1,
0.9966279, 1.226513, 1.771331, 1, 0, 0.9490196, 1,
0.9994991, -0.1655518, 1.691992, 1, 0, 0.9411765, 1,
1.003983, -1.866841, 2.673132, 1, 0, 0.9372549, 1,
1.008016, -0.4510277, 2.305046, 1, 0, 0.9294118, 1,
1.013713, 2.797497, 1.816301, 1, 0, 0.9254902, 1,
1.016768, -2.601271, 2.156555, 1, 0, 0.9176471, 1,
1.024315, -0.9492107, 0.432287, 1, 0, 0.9137255, 1,
1.027989, -1.182257, 3.549304, 1, 0, 0.9058824, 1,
1.02838, -1.091551, 2.359748, 1, 0, 0.9019608, 1,
1.031381, 1.020915, 1.149441, 1, 0, 0.8941177, 1,
1.040663, -1.109797, 2.326618, 1, 0, 0.8862745, 1,
1.046182, 0.3540575, 1.250962, 1, 0, 0.8823529, 1,
1.057698, -1.367013, 1.687605, 1, 0, 0.8745098, 1,
1.060231, 0.3339787, 1.750679, 1, 0, 0.8705882, 1,
1.062297, -1.837207, 2.257888, 1, 0, 0.8627451, 1,
1.074796, 0.3179101, 1.774117, 1, 0, 0.8588235, 1,
1.076808, 0.5791085, -0.7008423, 1, 0, 0.8509804, 1,
1.082222, 3.229716, 0.5047138, 1, 0, 0.8470588, 1,
1.084845, 1.507513, 0.3599478, 1, 0, 0.8392157, 1,
1.085722, -0.5682219, 1.588133, 1, 0, 0.8352941, 1,
1.095362, -0.1746277, 1.963504, 1, 0, 0.827451, 1,
1.098315, 0.4007889, 1.683955, 1, 0, 0.8235294, 1,
1.111191, 0.1829077, -0.5436044, 1, 0, 0.8156863, 1,
1.114658, 1.352154, 1.246583, 1, 0, 0.8117647, 1,
1.116168, 0.9940091, 1.996597, 1, 0, 0.8039216, 1,
1.122618, 0.5254771, -0.01891404, 1, 0, 0.7960784, 1,
1.128206, 2.066311, 0.9307976, 1, 0, 0.7921569, 1,
1.138665, -0.8368101, 3.169057, 1, 0, 0.7843137, 1,
1.146177, -0.4716167, 1.552087, 1, 0, 0.7803922, 1,
1.146528, -2.032928, 3.710189, 1, 0, 0.772549, 1,
1.149554, -0.02005076, 1.295209, 1, 0, 0.7686275, 1,
1.154137, -1.543114, 4.012559, 1, 0, 0.7607843, 1,
1.158654, 0.5043043, 2.94735, 1, 0, 0.7568628, 1,
1.158693, -0.7588693, 1.414366, 1, 0, 0.7490196, 1,
1.161352, -0.1582416, 1.088502, 1, 0, 0.7450981, 1,
1.161793, 0.5043102, 1.253581, 1, 0, 0.7372549, 1,
1.164916, 0.01898781, 1.752815, 1, 0, 0.7333333, 1,
1.175869, -2.076262, 3.244576, 1, 0, 0.7254902, 1,
1.180531, -0.6267001, 0.887567, 1, 0, 0.7215686, 1,
1.180806, -1.107536, 1.434186, 1, 0, 0.7137255, 1,
1.181488, -1.396124, -0.1424311, 1, 0, 0.7098039, 1,
1.208253, 1.188846, -1.566042, 1, 0, 0.7019608, 1,
1.212771, -0.3529469, 1.901751, 1, 0, 0.6941177, 1,
1.216035, -1.408664, 3.2293, 1, 0, 0.6901961, 1,
1.233638, -0.9572006, 1.515634, 1, 0, 0.682353, 1,
1.237141, -0.8076148, 1.138724, 1, 0, 0.6784314, 1,
1.245944, -0.08304052, 1.644683, 1, 0, 0.6705883, 1,
1.258146, 0.4450364, 1.198041, 1, 0, 0.6666667, 1,
1.260751, -0.6274368, 1.590477, 1, 0, 0.6588235, 1,
1.26292, 0.5098633, 0.5995287, 1, 0, 0.654902, 1,
1.26696, -1.328691, 1.157523, 1, 0, 0.6470588, 1,
1.277101, -0.1842097, 1.158727, 1, 0, 0.6431373, 1,
1.282368, 1.409958, 0.3777958, 1, 0, 0.6352941, 1,
1.286763, -0.3113313, 1.885759, 1, 0, 0.6313726, 1,
1.297541, -0.30058, 0.4993562, 1, 0, 0.6235294, 1,
1.30135, -0.380476, 0.571886, 1, 0, 0.6196079, 1,
1.306434, -0.7225909, 2.632749, 1, 0, 0.6117647, 1,
1.30961, -1.071767, 1.065568, 1, 0, 0.6078432, 1,
1.311113, -0.5679271, 3.158092, 1, 0, 0.6, 1,
1.315998, 0.8602916, 1.098444, 1, 0, 0.5921569, 1,
1.316764, -0.261299, 0.8993759, 1, 0, 0.5882353, 1,
1.318704, 0.1113605, 3.465343, 1, 0, 0.5803922, 1,
1.323981, 1.130702, -0.3931193, 1, 0, 0.5764706, 1,
1.324859, 0.3149531, 1.283124, 1, 0, 0.5686275, 1,
1.348966, 0.6642883, 0.8764663, 1, 0, 0.5647059, 1,
1.353575, -0.3251962, 0.5571003, 1, 0, 0.5568628, 1,
1.35659, -0.6148883, 0.2086919, 1, 0, 0.5529412, 1,
1.363844, 0.1512477, 1.71406, 1, 0, 0.5450981, 1,
1.366487, -0.03788852, 3.174133, 1, 0, 0.5411765, 1,
1.368142, 0.20187, 2.978567, 1, 0, 0.5333334, 1,
1.372927, -0.7989528, 2.506618, 1, 0, 0.5294118, 1,
1.378771, -0.4682022, 2.9159, 1, 0, 0.5215687, 1,
1.379678, 0.1270382, 0.318471, 1, 0, 0.5176471, 1,
1.382839, 1.771309, 1.616866, 1, 0, 0.509804, 1,
1.386507, 0.4268091, 1.437486, 1, 0, 0.5058824, 1,
1.390162, -0.5078592, 3.432722, 1, 0, 0.4980392, 1,
1.393116, -0.1013198, 0.6103999, 1, 0, 0.4901961, 1,
1.394227, 1.235474, 2.0221, 1, 0, 0.4862745, 1,
1.43058, -0.9703882, 1.519393, 1, 0, 0.4784314, 1,
1.451773, -1.455784, 2.810769, 1, 0, 0.4745098, 1,
1.469795, 1.383235, 1.134507, 1, 0, 0.4666667, 1,
1.479679, 1.088958, -0.7735053, 1, 0, 0.4627451, 1,
1.512086, 0.02300828, 2.372568, 1, 0, 0.454902, 1,
1.525633, 0.3333043, 1.133814, 1, 0, 0.4509804, 1,
1.532029, -0.4422767, 1.271254, 1, 0, 0.4431373, 1,
1.540575, 0.5340878, 2.432441, 1, 0, 0.4392157, 1,
1.547283, -0.7988626, 1.411744, 1, 0, 0.4313726, 1,
1.549965, -0.8360444, 2.050946, 1, 0, 0.427451, 1,
1.555304, -0.7006365, 1.675463, 1, 0, 0.4196078, 1,
1.565621, -1.585668, 1.720316, 1, 0, 0.4156863, 1,
1.580407, -0.1643221, 0.7363127, 1, 0, 0.4078431, 1,
1.580522, 0.7746869, 0.7208366, 1, 0, 0.4039216, 1,
1.589608, 1.309943, 0.4840357, 1, 0, 0.3960784, 1,
1.595031, -0.1394274, 2.263187, 1, 0, 0.3882353, 1,
1.603848, -0.5264155, 2.228184, 1, 0, 0.3843137, 1,
1.60658, -0.482904, 2.818251, 1, 0, 0.3764706, 1,
1.613022, 1.081264, 1.440901, 1, 0, 0.372549, 1,
1.613084, 0.5462655, 1.637608, 1, 0, 0.3647059, 1,
1.61569, 1.291864, 1.373299, 1, 0, 0.3607843, 1,
1.61649, -0.7072008, 2.996461, 1, 0, 0.3529412, 1,
1.623101, 1.585997, 0.9971181, 1, 0, 0.3490196, 1,
1.633155, -0.5292125, 1.479093, 1, 0, 0.3411765, 1,
1.643682, -0.9422362, 1.93306, 1, 0, 0.3372549, 1,
1.653834, 0.7102101, 3.768353, 1, 0, 0.3294118, 1,
1.663935, -1.070944, 2.780807, 1, 0, 0.3254902, 1,
1.670844, -1.173159, 1.627798, 1, 0, 0.3176471, 1,
1.685372, 0.2792815, 1.872724, 1, 0, 0.3137255, 1,
1.697129, -2.462882, 3.461965, 1, 0, 0.3058824, 1,
1.702105, 1.583781, 0.5647698, 1, 0, 0.2980392, 1,
1.770445, -0.02750493, 0.9797616, 1, 0, 0.2941177, 1,
1.791503, 0.6367765, 1.706271, 1, 0, 0.2862745, 1,
1.802454, 0.8771529, 0.8361678, 1, 0, 0.282353, 1,
1.813168, 2.014552, 0.7015417, 1, 0, 0.2745098, 1,
1.829537, -1.034863, 2.131588, 1, 0, 0.2705882, 1,
1.867426, -1.237072, 2.2633, 1, 0, 0.2627451, 1,
1.873851, -0.9992593, 2.33285, 1, 0, 0.2588235, 1,
1.877552, -0.2512313, 1.682719, 1, 0, 0.2509804, 1,
1.900218, -0.1965983, 2.795029, 1, 0, 0.2470588, 1,
1.921225, -1.034645, 1.480564, 1, 0, 0.2392157, 1,
1.931397, -0.2012949, 1.99516, 1, 0, 0.2352941, 1,
1.959912, 1.008235, -0.8268805, 1, 0, 0.227451, 1,
1.978041, -0.2638346, 2.406087, 1, 0, 0.2235294, 1,
1.978887, 0.7365733, 0.5345216, 1, 0, 0.2156863, 1,
2.025818, 0.8733616, 2.656285, 1, 0, 0.2117647, 1,
2.033244, 0.7213542, 1.216226, 1, 0, 0.2039216, 1,
2.035751, 0.3601068, 1.337362, 1, 0, 0.1960784, 1,
2.064354, -0.4673699, 2.162685, 1, 0, 0.1921569, 1,
2.064594, 1.207019, 0.3873632, 1, 0, 0.1843137, 1,
2.083047, -1.470625, 2.361737, 1, 0, 0.1803922, 1,
2.095294, 0.9077141, 0.2245172, 1, 0, 0.172549, 1,
2.102159, -0.1795848, 1.712099, 1, 0, 0.1686275, 1,
2.107017, -0.2014133, 1.912107, 1, 0, 0.1607843, 1,
2.120686, -0.2826352, 0.04180822, 1, 0, 0.1568628, 1,
2.124673, 0.7065954, 1.606735, 1, 0, 0.1490196, 1,
2.155703, -0.2220695, 2.506674, 1, 0, 0.145098, 1,
2.189444, 1.010337, 1.899121, 1, 0, 0.1372549, 1,
2.216842, -0.8934944, 3.010968, 1, 0, 0.1333333, 1,
2.221761, 1.030511, 0.5278229, 1, 0, 0.1254902, 1,
2.229627, -0.7129961, 2.409195, 1, 0, 0.1215686, 1,
2.242291, 1.054887, 1.734677, 1, 0, 0.1137255, 1,
2.254009, -0.4916216, 2.69718, 1, 0, 0.1098039, 1,
2.254401, 1.125409, 0.4473478, 1, 0, 0.1019608, 1,
2.257671, 0.2850922, 2.123768, 1, 0, 0.09411765, 1,
2.274422, -0.9579757, 0.5402651, 1, 0, 0.09019608, 1,
2.310362, -1.209806, 0.5637447, 1, 0, 0.08235294, 1,
2.319054, -0.09694448, 2.250428, 1, 0, 0.07843138, 1,
2.490399, 0.211594, 1.514726, 1, 0, 0.07058824, 1,
2.583772, 1.381398, 1.735583, 1, 0, 0.06666667, 1,
2.586139, -1.366016, 0.6701289, 1, 0, 0.05882353, 1,
2.652597, 0.969594, 1.212999, 1, 0, 0.05490196, 1,
2.745943, -0.6508451, 2.485452, 1, 0, 0.04705882, 1,
2.893138, -1.056664, 0.7713475, 1, 0, 0.04313726, 1,
3.009959, 0.5677914, 1.441542, 1, 0, 0.03529412, 1,
3.157601, 0.8238975, 2.337253, 1, 0, 0.03137255, 1,
3.171212, 1.063569, 0.2119859, 1, 0, 0.02352941, 1,
3.173502, -0.3157831, 1.010552, 1, 0, 0.01960784, 1,
3.339599, 1.452553, 1.997054, 1, 0, 0.01176471, 1,
3.633521, -0.8438799, 1.418088, 1, 0, 0.007843138, 1
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
0.288114, -4.651266, -7.947087, 0, -0.5, 0.5, 0.5,
0.288114, -4.651266, -7.947087, 1, -0.5, 0.5, 0.5,
0.288114, -4.651266, -7.947087, 1, 1.5, 0.5, 0.5,
0.288114, -4.651266, -7.947087, 0, 1.5, 0.5, 0.5
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
-4.191386, 0.2438538, -7.947087, 0, -0.5, 0.5, 0.5,
-4.191386, 0.2438538, -7.947087, 1, -0.5, 0.5, 0.5,
-4.191386, 0.2438538, -7.947087, 1, 1.5, 0.5, 0.5,
-4.191386, 0.2438538, -7.947087, 0, 1.5, 0.5, 0.5
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
-4.191386, -4.651266, -0.03119278, 0, -0.5, 0.5, 0.5,
-4.191386, -4.651266, -0.03119278, 1, -0.5, 0.5, 0.5,
-4.191386, -4.651266, -0.03119278, 1, 1.5, 0.5, 0.5,
-4.191386, -4.651266, -0.03119278, 0, 1.5, 0.5, 0.5
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
-3, -3.521622, -6.120342,
3, -3.521622, -6.120342,
-3, -3.521622, -6.120342,
-3, -3.709896, -6.4248,
-2, -3.521622, -6.120342,
-2, -3.709896, -6.4248,
-1, -3.521622, -6.120342,
-1, -3.709896, -6.4248,
0, -3.521622, -6.120342,
0, -3.709896, -6.4248,
1, -3.521622, -6.120342,
1, -3.709896, -6.4248,
2, -3.521622, -6.120342,
2, -3.709896, -6.4248,
3, -3.521622, -6.120342,
3, -3.709896, -6.4248
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
-3, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
-3, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
-3, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
-3, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
-2, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
-2, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
-2, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
-2, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
-1, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
-1, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
-1, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
-1, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
0, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
0, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
0, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
0, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
1, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
1, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
1, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
1, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
2, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
2, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
2, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
2, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5,
3, -4.086444, -7.033715, 0, -0.5, 0.5, 0.5,
3, -4.086444, -7.033715, 1, -0.5, 0.5, 0.5,
3, -4.086444, -7.033715, 1, 1.5, 0.5, 0.5,
3, -4.086444, -7.033715, 0, 1.5, 0.5, 0.5
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
-3.157655, -2, -6.120342,
-3.157655, 2, -6.120342,
-3.157655, -2, -6.120342,
-3.329944, -2, -6.4248,
-3.157655, 0, -6.120342,
-3.329944, 0, -6.4248,
-3.157655, 2, -6.120342,
-3.329944, 2, -6.4248
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
-3.67452, -2, -7.033715, 0, -0.5, 0.5, 0.5,
-3.67452, -2, -7.033715, 1, -0.5, 0.5, 0.5,
-3.67452, -2, -7.033715, 1, 1.5, 0.5, 0.5,
-3.67452, -2, -7.033715, 0, 1.5, 0.5, 0.5,
-3.67452, 0, -7.033715, 0, -0.5, 0.5, 0.5,
-3.67452, 0, -7.033715, 1, -0.5, 0.5, 0.5,
-3.67452, 0, -7.033715, 1, 1.5, 0.5, 0.5,
-3.67452, 0, -7.033715, 0, 1.5, 0.5, 0.5,
-3.67452, 2, -7.033715, 0, -0.5, 0.5, 0.5,
-3.67452, 2, -7.033715, 1, -0.5, 0.5, 0.5,
-3.67452, 2, -7.033715, 1, 1.5, 0.5, 0.5,
-3.67452, 2, -7.033715, 0, 1.5, 0.5, 0.5
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
-3.157655, -3.521622, -4,
-3.157655, -3.521622, 4,
-3.157655, -3.521622, -4,
-3.329944, -3.709896, -4,
-3.157655, -3.521622, -2,
-3.329944, -3.709896, -2,
-3.157655, -3.521622, 0,
-3.329944, -3.709896, 0,
-3.157655, -3.521622, 2,
-3.329944, -3.709896, 2,
-3.157655, -3.521622, 4,
-3.329944, -3.709896, 4
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
-3.67452, -4.086444, -4, 0, -0.5, 0.5, 0.5,
-3.67452, -4.086444, -4, 1, -0.5, 0.5, 0.5,
-3.67452, -4.086444, -4, 1, 1.5, 0.5, 0.5,
-3.67452, -4.086444, -4, 0, 1.5, 0.5, 0.5,
-3.67452, -4.086444, -2, 0, -0.5, 0.5, 0.5,
-3.67452, -4.086444, -2, 1, -0.5, 0.5, 0.5,
-3.67452, -4.086444, -2, 1, 1.5, 0.5, 0.5,
-3.67452, -4.086444, -2, 0, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 0, 0, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 0, 1, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 0, 1, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 0, 0, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 2, 0, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 2, 1, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 2, 1, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 2, 0, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 4, 0, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 4, 1, -0.5, 0.5, 0.5,
-3.67452, -4.086444, 4, 1, 1.5, 0.5, 0.5,
-3.67452, -4.086444, 4, 0, 1.5, 0.5, 0.5
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
-3.157655, -3.521622, -6.120342,
-3.157655, 4.00933, -6.120342,
-3.157655, -3.521622, 6.057957,
-3.157655, 4.00933, 6.057957,
-3.157655, -3.521622, -6.120342,
-3.157655, -3.521622, 6.057957,
-3.157655, 4.00933, -6.120342,
-3.157655, 4.00933, 6.057957,
-3.157655, -3.521622, -6.120342,
3.733883, -3.521622, -6.120342,
-3.157655, -3.521622, 6.057957,
3.733883, -3.521622, 6.057957,
-3.157655, 4.00933, -6.120342,
3.733883, 4.00933, -6.120342,
-3.157655, 4.00933, 6.057957,
3.733883, 4.00933, 6.057957,
3.733883, -3.521622, -6.120342,
3.733883, 4.00933, -6.120342,
3.733883, -3.521622, 6.057957,
3.733883, 4.00933, 6.057957,
3.733883, -3.521622, -6.120342,
3.733883, -3.521622, 6.057957,
3.733883, 4.00933, -6.120342,
3.733883, 4.00933, 6.057957
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
var radius = 8.485412;
var distance = 37.75256;
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
mvMatrix.translate( -0.288114, -0.2438538, 0.03119278 );
mvMatrix.scale( 1.331284, 1.218251, 0.7533559 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.75256);
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
OPUS<-read.table("OPUS.xyz")
```

```
## Error in read.table("OPUS.xyz"): no lines available in input
```

```r
x<-OPUS$V2
```

```
## Error in eval(expr, envir, enclos): object 'OPUS' not found
```

```r
y<-OPUS$V3
```

```
## Error in eval(expr, envir, enclos): object 'OPUS' not found
```

```r
z<-OPUS$V4
```

```
## Error in eval(expr, envir, enclos): object 'OPUS' not found
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
-3.057293, -0.2939951, 0.2005601, 0, 0, 1, 1, 1,
-2.655833, -0.5917007, -3.848094, 1, 0, 0, 1, 1,
-2.586897, 0.1111558, -1.088882, 1, 0, 0, 1, 1,
-2.579479, 0.1878525, -0.9719329, 1, 0, 0, 1, 1,
-2.518018, -1.638697, -3.897096, 1, 0, 0, 1, 1,
-2.487122, 0.6032851, -1.228156, 1, 0, 0, 1, 1,
-2.332914, -0.4894891, -1.252032, 0, 0, 0, 1, 1,
-2.239054, 1.008983, -0.5300285, 0, 0, 0, 1, 1,
-2.21052, -0.7039081, -2.567911, 0, 0, 0, 1, 1,
-2.200961, -0.5211123, -1.303336, 0, 0, 0, 1, 1,
-2.147568, -0.3370325, -0.3689147, 0, 0, 0, 1, 1,
-1.994444, -2.171087, -4.615699, 0, 0, 0, 1, 1,
-1.980948, 0.1098894, -2.532156, 0, 0, 0, 1, 1,
-1.977553, -2.927605, -2.732094, 1, 1, 1, 1, 1,
-1.975353, 1.439587, -1.126286, 1, 1, 1, 1, 1,
-1.952353, -1.112062, -1.411749, 1, 1, 1, 1, 1,
-1.880249, 1.418611, -2.116242, 1, 1, 1, 1, 1,
-1.875145, 0.6482748, -0.2291742, 1, 1, 1, 1, 1,
-1.874953, 0.8363459, -3.913897, 1, 1, 1, 1, 1,
-1.865364, -1.57518, -1.566116, 1, 1, 1, 1, 1,
-1.861725, -1.435997, -1.76673, 1, 1, 1, 1, 1,
-1.858376, 1.217133, -1.893495, 1, 1, 1, 1, 1,
-1.847236, 0.2413829, -2.794201, 1, 1, 1, 1, 1,
-1.838699, -1.491028, -3.051401, 1, 1, 1, 1, 1,
-1.829253, 1.74748, 0.2451394, 1, 1, 1, 1, 1,
-1.824812, 0.3991389, -0.02611938, 1, 1, 1, 1, 1,
-1.823215, 0.2446714, -1.314954, 1, 1, 1, 1, 1,
-1.822728, 0.06606802, -2.784745, 1, 1, 1, 1, 1,
-1.780632, 0.8479779, 1.441794, 0, 0, 1, 1, 1,
-1.775625, -1.092876, -2.480197, 1, 0, 0, 1, 1,
-1.769503, 0.7953737, -0.6600829, 1, 0, 0, 1, 1,
-1.747671, 1.544063, 0.2651848, 1, 0, 0, 1, 1,
-1.735482, 0.2429192, -1.015753, 1, 0, 0, 1, 1,
-1.730071, 0.2652854, -0.6131091, 1, 0, 0, 1, 1,
-1.72431, 0.6838488, -1.516198, 0, 0, 0, 1, 1,
-1.708542, 0.05249165, -2.003657, 0, 0, 0, 1, 1,
-1.702856, -0.897507, -2.746361, 0, 0, 0, 1, 1,
-1.70204, -0.792467, -2.881397, 0, 0, 0, 1, 1,
-1.69498, -0.2530645, -2.660366, 0, 0, 0, 1, 1,
-1.683661, 0.05826213, -0.412985, 0, 0, 0, 1, 1,
-1.67085, 0.8465514, -2.163819, 0, 0, 0, 1, 1,
-1.66255, -1.075354, -2.862535, 1, 1, 1, 1, 1,
-1.643407, -1.504311, -2.718079, 1, 1, 1, 1, 1,
-1.638416, 0.4507583, 0.01727979, 1, 1, 1, 1, 1,
-1.626871, -0.8661435, -0.464983, 1, 1, 1, 1, 1,
-1.607625, -0.3893367, -0.1944208, 1, 1, 1, 1, 1,
-1.606008, -1.050852, -1.637463, 1, 1, 1, 1, 1,
-1.594458, -0.004816607, -3.359923, 1, 1, 1, 1, 1,
-1.591184, -1.466515, -1.813495, 1, 1, 1, 1, 1,
-1.581534, -1.267623, -1.205708, 1, 1, 1, 1, 1,
-1.576901, -0.9484564, -2.73419, 1, 1, 1, 1, 1,
-1.576282, -0.7465705, -3.406446, 1, 1, 1, 1, 1,
-1.572101, -0.8356835, -1.622887, 1, 1, 1, 1, 1,
-1.560579, -0.2008159, -3.293458, 1, 1, 1, 1, 1,
-1.555434, -1.469942, -3.676224, 1, 1, 1, 1, 1,
-1.536777, 0.5641581, -1.616783, 1, 1, 1, 1, 1,
-1.52101, -0.5444114, -0.4920073, 0, 0, 1, 1, 1,
-1.513061, -0.6442037, -2.186747, 1, 0, 0, 1, 1,
-1.508842, 0.2311465, -1.652026, 1, 0, 0, 1, 1,
-1.503335, 0.7246804, -1.335739, 1, 0, 0, 1, 1,
-1.497098, -0.1465018, -0.927503, 1, 0, 0, 1, 1,
-1.496245, 0.2313398, -2.784411, 1, 0, 0, 1, 1,
-1.495495, -0.153005, -1.849449, 0, 0, 0, 1, 1,
-1.47198, -0.1030594, -2.018576, 0, 0, 0, 1, 1,
-1.463459, 0.2581321, -2.387902, 0, 0, 0, 1, 1,
-1.462567, 0.5295826, -1.932686, 0, 0, 0, 1, 1,
-1.452158, 0.5536003, -2.911429, 0, 0, 0, 1, 1,
-1.449804, -1.22108, -1.036334, 0, 0, 0, 1, 1,
-1.442177, -0.4433866, -3.267633, 0, 0, 0, 1, 1,
-1.426929, -0.03881836, -1.363577, 1, 1, 1, 1, 1,
-1.410138, -0.3969354, -2.871961, 1, 1, 1, 1, 1,
-1.402096, 1.50547, -1.343399, 1, 1, 1, 1, 1,
-1.398015, -1.277385, -0.929342, 1, 1, 1, 1, 1,
-1.397827, -0.06780053, -1.103524, 1, 1, 1, 1, 1,
-1.397472, -0.3190677, -0.3226177, 1, 1, 1, 1, 1,
-1.392261, 1.265622, -2.315318, 1, 1, 1, 1, 1,
-1.388785, 2.534871, -0.4066656, 1, 1, 1, 1, 1,
-1.384009, 2.398094, -1.805491, 1, 1, 1, 1, 1,
-1.375152, -1.213005, -3.069767, 1, 1, 1, 1, 1,
-1.373463, -1.609888, -2.266375, 1, 1, 1, 1, 1,
-1.371585, 0.3357249, -1.037048, 1, 1, 1, 1, 1,
-1.36933, -0.5927414, -0.3955427, 1, 1, 1, 1, 1,
-1.34609, -1.315913, -1.916243, 1, 1, 1, 1, 1,
-1.338539, 0.8249336, 1.234413, 1, 1, 1, 1, 1,
-1.328301, 1.380312, -2.361193, 0, 0, 1, 1, 1,
-1.313762, -0.281038, -1.619311, 1, 0, 0, 1, 1,
-1.303239, -0.6104693, -2.436924, 1, 0, 0, 1, 1,
-1.301997, 0.5448493, -0.8005681, 1, 0, 0, 1, 1,
-1.293396, 0.6955155, -0.6597579, 1, 0, 0, 1, 1,
-1.291506, -0.6539096, -2.822654, 1, 0, 0, 1, 1,
-1.290159, 1.540161, 0.0645816, 0, 0, 0, 1, 1,
-1.286925, -0.6045387, -0.9003248, 0, 0, 0, 1, 1,
-1.267838, 0.7681382, -2.782349, 0, 0, 0, 1, 1,
-1.267771, 0.6103062, -0.8279086, 0, 0, 0, 1, 1,
-1.249356, -0.4315863, -0.08764802, 0, 0, 0, 1, 1,
-1.242772, -1.116371, -3.928391, 0, 0, 0, 1, 1,
-1.241875, 0.825094, -0.8587706, 0, 0, 0, 1, 1,
-1.237586, 0.1358264, -4.071674, 1, 1, 1, 1, 1,
-1.236126, -0.5912661, 0.4004996, 1, 1, 1, 1, 1,
-1.233239, 2.164381, -1.507375, 1, 1, 1, 1, 1,
-1.22956, -0.9319633, -3.467122, 1, 1, 1, 1, 1,
-1.225832, -0.005145609, -0.5972859, 1, 1, 1, 1, 1,
-1.207844, 1.390011, -1.550295, 1, 1, 1, 1, 1,
-1.205101, -0.03913138, -0.6008181, 1, 1, 1, 1, 1,
-1.202983, -0.3009643, -0.751725, 1, 1, 1, 1, 1,
-1.199349, 0.9392409, -2.423419, 1, 1, 1, 1, 1,
-1.196758, 1.022124, 0.09939098, 1, 1, 1, 1, 1,
-1.192593, -0.6408713, -2.388885, 1, 1, 1, 1, 1,
-1.186478, -1.388808, -2.297565, 1, 1, 1, 1, 1,
-1.158965, 1.896059, -0.5894932, 1, 1, 1, 1, 1,
-1.15881, 0.2067872, -0.4763058, 1, 1, 1, 1, 1,
-1.151296, 0.9133175, 0.9119301, 1, 1, 1, 1, 1,
-1.147967, 0.8850113, -1.093958, 0, 0, 1, 1, 1,
-1.144168, -0.7131565, -3.092862, 1, 0, 0, 1, 1,
-1.143448, -1.764731, -4.012149, 1, 0, 0, 1, 1,
-1.135705, -1.00432, -2.285989, 1, 0, 0, 1, 1,
-1.134432, -0.2033829, -2.026752, 1, 0, 0, 1, 1,
-1.122526, 0.7092381, -0.08453523, 1, 0, 0, 1, 1,
-1.115458, -1.159864, -0.5867264, 0, 0, 0, 1, 1,
-1.107044, -0.2758193, -2.772008, 0, 0, 0, 1, 1,
-1.100595, -0.2323198, -1.926992, 0, 0, 0, 1, 1,
-1.099937, -0.535739, -2.794237, 0, 0, 0, 1, 1,
-1.084244, -0.8802613, -1.584083, 0, 0, 0, 1, 1,
-1.082218, -0.4355879, 0.6344083, 0, 0, 0, 1, 1,
-1.07985, -0.6607242, -0.3278125, 0, 0, 0, 1, 1,
-1.07805, 0.9320979, 0.04843052, 1, 1, 1, 1, 1,
-1.068171, 0.2576422, -2.074986, 1, 1, 1, 1, 1,
-1.065001, -0.009625365, -0.7897148, 1, 1, 1, 1, 1,
-1.061432, 1.037499, 0.1457908, 1, 1, 1, 1, 1,
-1.057338, 1.225926, -0.7029971, 1, 1, 1, 1, 1,
-1.055548, -0.5734066, -2.86791, 1, 1, 1, 1, 1,
-1.048745, 1.476887, -0.09270944, 1, 1, 1, 1, 1,
-1.048549, -0.06304052, 0.03703352, 1, 1, 1, 1, 1,
-1.042693, -2.310421, -4.612065, 1, 1, 1, 1, 1,
-1.030489, 0.1351319, -4.084496, 1, 1, 1, 1, 1,
-1.015727, -0.4316593, -3.047279, 1, 1, 1, 1, 1,
-1.014434, 0.1472557, -1.777329, 1, 1, 1, 1, 1,
-1.010273, -0.349071, -1.133876, 1, 1, 1, 1, 1,
-1.008916, -1.302395, -0.391899, 1, 1, 1, 1, 1,
-1.007323, -0.7298627, -1.354991, 1, 1, 1, 1, 1,
-1.003942, -1.049235, -2.538539, 0, 0, 1, 1, 1,
-1.002596, -0.05265696, -2.168219, 1, 0, 0, 1, 1,
-1.000061, 0.2023688, -1.323957, 1, 0, 0, 1, 1,
-0.9991623, -1.411136, -2.05531, 1, 0, 0, 1, 1,
-0.9944792, 2.047151, -0.2912599, 1, 0, 0, 1, 1,
-0.9923198, 0.1544569, -0.1857788, 1, 0, 0, 1, 1,
-0.9891616, -2.451779, -2.109386, 0, 0, 0, 1, 1,
-0.983412, -1.134933, -2.28383, 0, 0, 0, 1, 1,
-0.9814193, -0.2171516, -2.411154, 0, 0, 0, 1, 1,
-0.9789283, -0.6154243, -1.934565, 0, 0, 0, 1, 1,
-0.9775941, 1.198682, -0.5183492, 0, 0, 0, 1, 1,
-0.97496, -1.416437, -1.491931, 0, 0, 0, 1, 1,
-0.9695761, -0.7339313, -2.9661, 0, 0, 0, 1, 1,
-0.9664339, 0.294713, -0.9438904, 1, 1, 1, 1, 1,
-0.9579927, -1.453233, -4.084015, 1, 1, 1, 1, 1,
-0.9519061, -1.018707, 0.2330161, 1, 1, 1, 1, 1,
-0.9504159, -1.305931, -3.219828, 1, 1, 1, 1, 1,
-0.9453876, -0.07128873, -1.474348, 1, 1, 1, 1, 1,
-0.9409754, -0.4387661, -2.818635, 1, 1, 1, 1, 1,
-0.9399732, 0.1529363, -0.4951635, 1, 1, 1, 1, 1,
-0.9377021, -0.6082534, -0.8129413, 1, 1, 1, 1, 1,
-0.9364783, 1.331594, -0.1521935, 1, 1, 1, 1, 1,
-0.9349067, -0.6667867, -2.337667, 1, 1, 1, 1, 1,
-0.9322664, -0.5289554, -3.133981, 1, 1, 1, 1, 1,
-0.9319764, 0.1097992, -1.972346, 1, 1, 1, 1, 1,
-0.9303873, -0.01139238, -1.931435, 1, 1, 1, 1, 1,
-0.9279007, 0.5512789, -0.02474243, 1, 1, 1, 1, 1,
-0.9225816, -2.199312, -3.395046, 1, 1, 1, 1, 1,
-0.9184771, 0.757292, -0.812118, 0, 0, 1, 1, 1,
-0.9073179, -2.006305, -3.04777, 1, 0, 0, 1, 1,
-0.9029202, -0.8010804, -2.673504, 1, 0, 0, 1, 1,
-0.8874252, -1.375242, -3.281203, 1, 0, 0, 1, 1,
-0.8837224, -0.05119349, -1.5507, 1, 0, 0, 1, 1,
-0.8774908, 0.4871386, -0.6342422, 1, 0, 0, 1, 1,
-0.8740739, -0.08757357, -1.967671, 0, 0, 0, 1, 1,
-0.8740295, 0.1554912, 1.62216, 0, 0, 0, 1, 1,
-0.8638783, 1.011526, 0.3851382, 0, 0, 0, 1, 1,
-0.8575008, -0.3920448, 0.3069487, 0, 0, 0, 1, 1,
-0.8515534, -1.464772, -1.592778, 0, 0, 0, 1, 1,
-0.8500947, -0.5504833, -0.7451106, 0, 0, 0, 1, 1,
-0.8487687, -0.1366782, -1.91852, 0, 0, 0, 1, 1,
-0.8486923, 0.6553962, 0.5596791, 1, 1, 1, 1, 1,
-0.8477233, -1.413074, -3.239697, 1, 1, 1, 1, 1,
-0.8404225, -0.7197407, -1.212826, 1, 1, 1, 1, 1,
-0.839076, -0.2183118, -0.6361185, 1, 1, 1, 1, 1,
-0.8355956, -1.292306, -2.549671, 1, 1, 1, 1, 1,
-0.8349179, 0.03785265, -1.306486, 1, 1, 1, 1, 1,
-0.8298247, -1.029363, -4.152123, 1, 1, 1, 1, 1,
-0.8162527, -0.249059, -2.702102, 1, 1, 1, 1, 1,
-0.8086753, -0.126091, -2.88996, 1, 1, 1, 1, 1,
-0.8080325, 0.1523237, -0.9793736, 1, 1, 1, 1, 1,
-0.8048235, 1.119557, 0.7770998, 1, 1, 1, 1, 1,
-0.8003966, -0.4220634, -2.117192, 1, 1, 1, 1, 1,
-0.7989246, -0.359362, -0.8796523, 1, 1, 1, 1, 1,
-0.7977644, 0.3249977, -1.698756, 1, 1, 1, 1, 1,
-0.7959425, 0.01503998, -1.334348, 1, 1, 1, 1, 1,
-0.7885708, -0.4208448, -0.329203, 0, 0, 1, 1, 1,
-0.785953, 0.7093133, -0.4266222, 1, 0, 0, 1, 1,
-0.7846738, -0.8222679, -0.3474645, 1, 0, 0, 1, 1,
-0.7820196, -0.1317321, -2.211868, 1, 0, 0, 1, 1,
-0.7786182, 0.04489367, -0.4439743, 1, 0, 0, 1, 1,
-0.7778949, -1.40644, -1.797225, 1, 0, 0, 1, 1,
-0.7749292, 0.5548569, -3.615864, 0, 0, 0, 1, 1,
-0.7725643, 0.2649118, -0.3521197, 0, 0, 0, 1, 1,
-0.7643692, -1.528321, -2.086741, 0, 0, 0, 1, 1,
-0.7606316, -0.9177701, -2.489428, 0, 0, 0, 1, 1,
-0.7602946, 0.9446697, -0.5380439, 0, 0, 0, 1, 1,
-0.7598557, 0.5991591, -1.821314, 0, 0, 0, 1, 1,
-0.7526233, 1.65384, -0.06431659, 0, 0, 0, 1, 1,
-0.7497959, 0.01783975, -1.374054, 1, 1, 1, 1, 1,
-0.7456162, 1.811069, 1.425648, 1, 1, 1, 1, 1,
-0.7454613, 1.150049, 0.879149, 1, 1, 1, 1, 1,
-0.7452544, -1.438837, -3.928624, 1, 1, 1, 1, 1,
-0.7439784, -1.315931, -2.198995, 1, 1, 1, 1, 1,
-0.7411341, 1.069053, 0.1285978, 1, 1, 1, 1, 1,
-0.7408603, -1.188533, -3.018658, 1, 1, 1, 1, 1,
-0.7404678, -0.1290446, -2.13938, 1, 1, 1, 1, 1,
-0.7389512, -0.5375035, -3.115289, 1, 1, 1, 1, 1,
-0.7339433, -0.128471, -3.491627, 1, 1, 1, 1, 1,
-0.7329225, -0.5482485, -1.459889, 1, 1, 1, 1, 1,
-0.7276056, 1.007743, 0.004055268, 1, 1, 1, 1, 1,
-0.726455, 0.6782404, -1.163726, 1, 1, 1, 1, 1,
-0.7218614, -0.4489791, -0.9593055, 1, 1, 1, 1, 1,
-0.7213718, -0.5511229, -0.4921208, 1, 1, 1, 1, 1,
-0.7176369, -0.8489829, -3.105291, 0, 0, 1, 1, 1,
-0.7152173, -1.582868, -3.124713, 1, 0, 0, 1, 1,
-0.7143048, 0.4463142, -0.01365141, 1, 0, 0, 1, 1,
-0.7132263, 2.397909, -2.522228, 1, 0, 0, 1, 1,
-0.7125645, 0.1203277, -1.764246, 1, 0, 0, 1, 1,
-0.7083014, 0.5857223, 0.7150053, 1, 0, 0, 1, 1,
-0.7077745, 0.1702505, -1.954542, 0, 0, 0, 1, 1,
-0.7045842, 0.8013356, -1.39279, 0, 0, 0, 1, 1,
-0.7020273, 0.5150494, 0.6972568, 0, 0, 0, 1, 1,
-0.6995233, -0.6115822, -3.027397, 0, 0, 0, 1, 1,
-0.6969292, 0.2136235, -2.087321, 0, 0, 0, 1, 1,
-0.6951349, 0.6895342, 0.08144137, 0, 0, 0, 1, 1,
-0.6945648, -0.7601031, -3.389344, 0, 0, 0, 1, 1,
-0.6939893, 0.5899343, 0.2546311, 1, 1, 1, 1, 1,
-0.6884741, 1.2973, -1.94854, 1, 1, 1, 1, 1,
-0.6818379, -0.1848374, -2.667975, 1, 1, 1, 1, 1,
-0.6817558, -0.5363654, -2.282597, 1, 1, 1, 1, 1,
-0.678041, -0.1027911, -3.559487, 1, 1, 1, 1, 1,
-0.6773227, -0.3425799, -1.759992, 1, 1, 1, 1, 1,
-0.6764631, -2.729048, -3.023685, 1, 1, 1, 1, 1,
-0.6747311, -0.08530344, 0.2629569, 1, 1, 1, 1, 1,
-0.6724093, 0.6713398, -0.536769, 1, 1, 1, 1, 1,
-0.6651664, -0.1979196, -2.166107, 1, 1, 1, 1, 1,
-0.6623828, 0.03696167, -3.507516, 1, 1, 1, 1, 1,
-0.6572794, -0.1315288, 0.8344458, 1, 1, 1, 1, 1,
-0.6521049, -0.3555863, -1.829001, 1, 1, 1, 1, 1,
-0.6499396, 0.309054, -1.611147, 1, 1, 1, 1, 1,
-0.6442568, 0.5929762, -4.508097, 1, 1, 1, 1, 1,
-0.6349525, 1.641685, -0.08612722, 0, 0, 1, 1, 1,
-0.6327068, 1.105804, -1.493566, 1, 0, 0, 1, 1,
-0.6281148, -1.431168, -2.31661, 1, 0, 0, 1, 1,
-0.6277347, 1.249094, -1.580422, 1, 0, 0, 1, 1,
-0.6271394, -0.9980614, -3.413295, 1, 0, 0, 1, 1,
-0.6265207, 0.08601321, -0.9157051, 1, 0, 0, 1, 1,
-0.6225062, -0.7640361, -2.400244, 0, 0, 0, 1, 1,
-0.621608, 0.5584093, -0.9784263, 0, 0, 0, 1, 1,
-0.6214542, -0.4170243, -3.671523, 0, 0, 0, 1, 1,
-0.6192831, -1.378645, -3.978123, 0, 0, 0, 1, 1,
-0.6021264, -0.3098603, -2.802444, 0, 0, 0, 1, 1,
-0.5967566, 0.927948, -0.04007154, 0, 0, 0, 1, 1,
-0.5932378, 0.5826976, -1.376752, 0, 0, 0, 1, 1,
-0.5918099, -0.04187081, -1.010129, 1, 1, 1, 1, 1,
-0.5915221, -0.3172203, -1.583661, 1, 1, 1, 1, 1,
-0.5893328, -1.774763, -4.093806, 1, 1, 1, 1, 1,
-0.5877495, 0.7117913, -1.123927, 1, 1, 1, 1, 1,
-0.5863285, -1.384585, -2.283669, 1, 1, 1, 1, 1,
-0.5814685, 2.684143, -0.8503125, 1, 1, 1, 1, 1,
-0.5789126, -0.1148692, -1.825949, 1, 1, 1, 1, 1,
-0.5776066, -0.5565239, -2.507918, 1, 1, 1, 1, 1,
-0.576816, -0.8790432, -4.128012, 1, 1, 1, 1, 1,
-0.5728339, 0.5520247, -0.3306181, 1, 1, 1, 1, 1,
-0.5688381, 2.493402, -0.6298704, 1, 1, 1, 1, 1,
-0.5680576, 0.4690981, 0.2057258, 1, 1, 1, 1, 1,
-0.5621238, -1.230536, -2.361287, 1, 1, 1, 1, 1,
-0.5615962, 1.136184, -0.9206067, 1, 1, 1, 1, 1,
-0.5580872, -1.739864, -1.428821, 1, 1, 1, 1, 1,
-0.5580183, -0.2383614, -1.433312, 0, 0, 1, 1, 1,
-0.5578835, 2.379916, -0.06117981, 1, 0, 0, 1, 1,
-0.5569301, 1.055815, 1.491386, 1, 0, 0, 1, 1,
-0.5529616, 0.2455151, -1.508688, 1, 0, 0, 1, 1,
-0.5509151, 2.099855, -2.40008, 1, 0, 0, 1, 1,
-0.5440041, -0.9406284, -5.419869, 1, 0, 0, 1, 1,
-0.5430354, 0.2234066, 0.140766, 0, 0, 0, 1, 1,
-0.5429065, -1.183628, -2.473744, 0, 0, 0, 1, 1,
-0.5361974, -0.5509186, -2.471645, 0, 0, 0, 1, 1,
-0.5341786, 3.302762, 2.030576, 0, 0, 0, 1, 1,
-0.5327157, 0.4038398, -0.9739223, 0, 0, 0, 1, 1,
-0.5296244, -2.110651, -1.68783, 0, 0, 0, 1, 1,
-0.5237892, -0.640147, -2.402716, 0, 0, 0, 1, 1,
-0.5234328, 0.1252264, -0.9912245, 1, 1, 1, 1, 1,
-0.5179068, 0.7370616, -0.5821952, 1, 1, 1, 1, 1,
-0.5157993, 1.095541, -1.53775, 1, 1, 1, 1, 1,
-0.5151973, -0.3722502, -2.283224, 1, 1, 1, 1, 1,
-0.5141093, 0.2160034, -2.838433, 1, 1, 1, 1, 1,
-0.5135889, -0.6775023, -3.30544, 1, 1, 1, 1, 1,
-0.5093378, -1.678009, -3.945835, 1, 1, 1, 1, 1,
-0.5028182, -0.0424171, -1.423457, 1, 1, 1, 1, 1,
-0.49806, 0.4038802, -1.219462, 1, 1, 1, 1, 1,
-0.4980241, -0.5876725, -2.210039, 1, 1, 1, 1, 1,
-0.4957791, -0.3320133, -2.214753, 1, 1, 1, 1, 1,
-0.4937327, 0.7144335, 0.2157466, 1, 1, 1, 1, 1,
-0.4883146, 1.475993, -0.2407994, 1, 1, 1, 1, 1,
-0.4863895, 0.9926134, -2.003821, 1, 1, 1, 1, 1,
-0.4857399, -0.8481374, -1.735475, 1, 1, 1, 1, 1,
-0.4844057, -0.08140884, -0.05837521, 0, 0, 1, 1, 1,
-0.4805123, -0.1988465, -1.847572, 1, 0, 0, 1, 1,
-0.4773585, 0.485071, -0.940961, 1, 0, 0, 1, 1,
-0.4674467, 1.206357, -0.652128, 1, 0, 0, 1, 1,
-0.4634549, -1.445093, -3.902493, 1, 0, 0, 1, 1,
-0.4630842, -1.64947, -5.116442, 1, 0, 0, 1, 1,
-0.4630352, -0.167311, -3.417263, 0, 0, 0, 1, 1,
-0.4610346, -0.3840675, -2.999305, 0, 0, 0, 1, 1,
-0.4595902, 0.2406353, -0.01683825, 0, 0, 0, 1, 1,
-0.452152, 0.7120229, -1.101231, 0, 0, 0, 1, 1,
-0.44908, -1.832833, -3.307179, 0, 0, 0, 1, 1,
-0.4468469, -1.200464, -2.075873, 0, 0, 0, 1, 1,
-0.4464099, -0.8811876, -4.384305, 0, 0, 0, 1, 1,
-0.4446006, -1.029842, -4.385738, 1, 1, 1, 1, 1,
-0.4401706, -0.5116867, -1.65882, 1, 1, 1, 1, 1,
-0.4395363, -0.145645, -0.4799117, 1, 1, 1, 1, 1,
-0.4395354, 0.6064833, 0.01430701, 1, 1, 1, 1, 1,
-0.4391317, 0.03968085, -1.590319, 1, 1, 1, 1, 1,
-0.437102, 0.3560091, -1.618526, 1, 1, 1, 1, 1,
-0.4337547, 0.45486, 0.3090953, 1, 1, 1, 1, 1,
-0.4333625, 0.2839865, -2.32307, 1, 1, 1, 1, 1,
-0.4311873, -0.6484483, -2.21245, 1, 1, 1, 1, 1,
-0.4298188, 2.439086, 0.9127659, 1, 1, 1, 1, 1,
-0.4275169, -1.522879, -2.586213, 1, 1, 1, 1, 1,
-0.4256334, 0.3814512, -1.608914, 1, 1, 1, 1, 1,
-0.4241365, 0.3351764, 0.2063437, 1, 1, 1, 1, 1,
-0.4221097, 0.4507378, 0.008494429, 1, 1, 1, 1, 1,
-0.4158062, 0.6273007, -0.510371, 1, 1, 1, 1, 1,
-0.4149731, -1.010209, -2.39758, 0, 0, 1, 1, 1,
-0.4091338, 1.848346, 0.6513431, 1, 0, 0, 1, 1,
-0.4045543, -0.123586, -2.709285, 1, 0, 0, 1, 1,
-0.4022878, 2.221241, 0.6080402, 1, 0, 0, 1, 1,
-0.4019888, -0.9162495, -1.822733, 1, 0, 0, 1, 1,
-0.4018902, 1.471686, 0.07662982, 1, 0, 0, 1, 1,
-0.3978708, -0.6345496, -3.322623, 0, 0, 0, 1, 1,
-0.3918853, -0.3627534, -2.904768, 0, 0, 0, 1, 1,
-0.3901799, -0.6950483, -5.942988, 0, 0, 0, 1, 1,
-0.3876039, 0.3995344, -0.7596005, 0, 0, 0, 1, 1,
-0.3831567, 0.2647012, -2.73361, 0, 0, 0, 1, 1,
-0.3823429, -0.02351686, -0.8216984, 0, 0, 0, 1, 1,
-0.3820332, -0.3485345, -2.111233, 0, 0, 0, 1, 1,
-0.379455, -0.624869, -2.164656, 1, 1, 1, 1, 1,
-0.3785998, 1.448853, -0.7589355, 1, 1, 1, 1, 1,
-0.3748676, 1.383628, -0.4787216, 1, 1, 1, 1, 1,
-0.3672746, -0.6940511, -1.321143, 1, 1, 1, 1, 1,
-0.3672049, 0.2306356, -1.201115, 1, 1, 1, 1, 1,
-0.3637288, -0.7614125, -1.932333, 1, 1, 1, 1, 1,
-0.3594715, 0.8063868, -0.6569507, 1, 1, 1, 1, 1,
-0.3587054, -0.9079239, -2.389553, 1, 1, 1, 1, 1,
-0.3565725, -1.086768, -3.271526, 1, 1, 1, 1, 1,
-0.3536694, -0.7711427, -2.095277, 1, 1, 1, 1, 1,
-0.352265, -2.082433, -2.031325, 1, 1, 1, 1, 1,
-0.3508483, 1.892697, -0.4445067, 1, 1, 1, 1, 1,
-0.3473514, -0.0726018, -3.18688, 1, 1, 1, 1, 1,
-0.3459935, 0.3975025, -1.61254, 1, 1, 1, 1, 1,
-0.3458259, -0.5952875, -3.111729, 1, 1, 1, 1, 1,
-0.3442437, -1.152976, -2.681417, 0, 0, 1, 1, 1,
-0.344088, -0.8050273, -3.247363, 1, 0, 0, 1, 1,
-0.3404803, -0.4691844, -1.745374, 1, 0, 0, 1, 1,
-0.3366617, 1.533771, -1.174009, 1, 0, 0, 1, 1,
-0.3352786, 0.4506084, -1.099669, 1, 0, 0, 1, 1,
-0.3336954, -1.372199, -5.234486, 1, 0, 0, 1, 1,
-0.3335037, -0.7080965, -2.852477, 0, 0, 0, 1, 1,
-0.3277097, 1.023607, 1.506184, 0, 0, 0, 1, 1,
-0.3276432, 1.585151, 0.1290597, 0, 0, 0, 1, 1,
-0.3241692, -1.348411, -3.452275, 0, 0, 0, 1, 1,
-0.3161575, -0.9799678, -3.559656, 0, 0, 0, 1, 1,
-0.3104485, 1.959314, -0.3358169, 0, 0, 0, 1, 1,
-0.3100636, 1.097602, -1.62647, 0, 0, 0, 1, 1,
-0.3049591, -3.411948, -3.344178, 1, 1, 1, 1, 1,
-0.3021787, -0.6963319, -1.617496, 1, 1, 1, 1, 1,
-0.2954698, 0.4514831, -0.2850638, 1, 1, 1, 1, 1,
-0.2905083, -0.6772323, -2.610034, 1, 1, 1, 1, 1,
-0.2878284, -0.3786416, -2.931623, 1, 1, 1, 1, 1,
-0.2859319, 1.765199, -0.3413518, 1, 1, 1, 1, 1,
-0.2841546, -0.4638453, -4.40927, 1, 1, 1, 1, 1,
-0.28257, -0.004914396, -0.5241161, 1, 1, 1, 1, 1,
-0.2800305, 2.040476, -0.06850186, 1, 1, 1, 1, 1,
-0.2795396, 0.4393246, -2.352356, 1, 1, 1, 1, 1,
-0.2773368, -1.521247, -1.976674, 1, 1, 1, 1, 1,
-0.2734187, -2.465162, -2.838018, 1, 1, 1, 1, 1,
-0.2686265, 0.4371168, -0.412651, 1, 1, 1, 1, 1,
-0.2643819, -0.654786, -1.097836, 1, 1, 1, 1, 1,
-0.2640101, 0.9215194, -1.367321, 1, 1, 1, 1, 1,
-0.2609027, -1.273903, -1.712713, 0, 0, 1, 1, 1,
-0.2590407, 0.4656938, -0.7576604, 1, 0, 0, 1, 1,
-0.2518979, 0.2710135, -1.660502, 1, 0, 0, 1, 1,
-0.2455527, 0.423053, -1.086692, 1, 0, 0, 1, 1,
-0.2400389, -1.127109, -2.352886, 1, 0, 0, 1, 1,
-0.2400211, 0.8087995, 0.4144788, 1, 0, 0, 1, 1,
-0.2393587, -1.9299, -3.208088, 0, 0, 0, 1, 1,
-0.2378839, -2.874208, -1.673422, 0, 0, 0, 1, 1,
-0.2367294, 1.014664, -1.105977, 0, 0, 0, 1, 1,
-0.2344962, 1.025195, -0.3067175, 0, 0, 0, 1, 1,
-0.2324037, 1.619454, 0.663372, 0, 0, 0, 1, 1,
-0.2272992, -1.422815, -5.010849, 0, 0, 0, 1, 1,
-0.2262872, -0.9094646, -2.826543, 0, 0, 0, 1, 1,
-0.2228085, -1.249689, -2.907319, 1, 1, 1, 1, 1,
-0.2192294, 1.11289, -1.022952, 1, 1, 1, 1, 1,
-0.2160837, -0.2231132, -3.368669, 1, 1, 1, 1, 1,
-0.2115678, 2.439245, -0.8625965, 1, 1, 1, 1, 1,
-0.2094835, -0.2182485, -2.95001, 1, 1, 1, 1, 1,
-0.2048663, 0.2357567, -1.364599, 1, 1, 1, 1, 1,
-0.2029138, 0.2000772, -0.0872971, 1, 1, 1, 1, 1,
-0.1974893, -2.475675, -5.842955, 1, 1, 1, 1, 1,
-0.1953577, 0.2127223, -0.5923361, 1, 1, 1, 1, 1,
-0.1946224, -0.06302784, -2.818108, 1, 1, 1, 1, 1,
-0.1889334, -0.4227594, -2.297282, 1, 1, 1, 1, 1,
-0.1861438, -1.75834, -3.270175, 1, 1, 1, 1, 1,
-0.1837643, -0.9476314, -2.953145, 1, 1, 1, 1, 1,
-0.1753321, -0.5680063, -1.28862, 1, 1, 1, 1, 1,
-0.1744439, 2.345796, 0.8648861, 1, 1, 1, 1, 1,
-0.1732255, -1.656857, -3.093093, 0, 0, 1, 1, 1,
-0.1686472, 0.0992882, -1.080103, 1, 0, 0, 1, 1,
-0.1670863, -0.9953373, -3.720816, 1, 0, 0, 1, 1,
-0.1621232, 0.1555509, -0.1123299, 1, 0, 0, 1, 1,
-0.160679, -0.6196626, -3.572482, 1, 0, 0, 1, 1,
-0.1589863, -0.5106087, -1.725893, 1, 0, 0, 1, 1,
-0.1574699, 0.6118661, 0.1991386, 0, 0, 0, 1, 1,
-0.1511494, -0.7939468, -3.990647, 0, 0, 0, 1, 1,
-0.1469273, 0.3227952, -0.6306809, 0, 0, 0, 1, 1,
-0.1447268, 0.806822, -0.8462536, 0, 0, 0, 1, 1,
-0.143418, -2.040528, -2.539304, 0, 0, 0, 1, 1,
-0.1409763, -1.56316, -4.58723, 0, 0, 0, 1, 1,
-0.140672, 0.6945906, -2.279085, 0, 0, 0, 1, 1,
-0.1404406, 0.2188095, 0.09161314, 1, 1, 1, 1, 1,
-0.1391954, -0.9899703, -2.712146, 1, 1, 1, 1, 1,
-0.1374274, 0.6597075, -1.42608, 1, 1, 1, 1, 1,
-0.1300766, 0.9338179, 2.071121, 1, 1, 1, 1, 1,
-0.1258759, 0.5447285, -0.6506712, 1, 1, 1, 1, 1,
-0.1254685, 2.345398, 0.4555865, 1, 1, 1, 1, 1,
-0.1226211, 0.4847636, -1.694272, 1, 1, 1, 1, 1,
-0.1221907, 0.08781133, -0.625913, 1, 1, 1, 1, 1,
-0.1175862, 0.1654178, -0.4907131, 1, 1, 1, 1, 1,
-0.1150784, 0.5419191, -1.145684, 1, 1, 1, 1, 1,
-0.1147223, 0.6974103, -1.176713, 1, 1, 1, 1, 1,
-0.1135497, 0.2100728, -1.27887, 1, 1, 1, 1, 1,
-0.1115482, 1.312807, -1.143116, 1, 1, 1, 1, 1,
-0.1086076, 0.965745, 0.7850187, 1, 1, 1, 1, 1,
-0.1061686, 0.09887763, -0.5472832, 1, 1, 1, 1, 1,
-0.105422, 0.6918901, -0.1164686, 0, 0, 1, 1, 1,
-0.1052976, -0.7540649, -2.078243, 1, 0, 0, 1, 1,
-0.1033279, -2.502219, -3.557577, 1, 0, 0, 1, 1,
-0.0895038, -1.142604, -1.703173, 1, 0, 0, 1, 1,
-0.08310279, -0.8089172, -3.559979, 1, 0, 0, 1, 1,
-0.0801259, 0.6733803, -0.8841522, 1, 0, 0, 1, 1,
-0.07715155, 0.584774, 2.014327, 0, 0, 0, 1, 1,
-0.0748317, 1.012055, 1.580558, 0, 0, 0, 1, 1,
-0.07097908, 0.0281731, -0.3033912, 0, 0, 0, 1, 1,
-0.06686226, -0.4223634, -0.9115043, 0, 0, 0, 1, 1,
-0.06658176, 1.971847, 0.5727124, 0, 0, 0, 1, 1,
-0.06378973, -0.03649157, -2.495328, 0, 0, 0, 1, 1,
-0.06194806, 1.204656, -0.3311418, 0, 0, 0, 1, 1,
-0.06188925, -2.204599, -3.819566, 1, 1, 1, 1, 1,
-0.05520475, -1.849631, -3.059119, 1, 1, 1, 1, 1,
-0.0522517, -0.8242719, -2.568415, 1, 1, 1, 1, 1,
-0.04548261, -0.6558021, -1.85486, 1, 1, 1, 1, 1,
-0.04143392, -2.121749, -0.5097802, 1, 1, 1, 1, 1,
-0.04075985, 0.7198937, -1.204013, 1, 1, 1, 1, 1,
-0.03977483, -0.05695269, -2.302852, 1, 1, 1, 1, 1,
-0.03772986, -0.3443743, -5.071539, 1, 1, 1, 1, 1,
-0.03543812, -1.0147, -2.626737, 1, 1, 1, 1, 1,
-0.0352139, 1.040665, -0.6197619, 1, 1, 1, 1, 1,
-0.03508866, 0.6075669, -0.9162869, 1, 1, 1, 1, 1,
-0.03138612, -0.8206423, -3.273475, 1, 1, 1, 1, 1,
-0.02821007, -0.8002226, -2.00264, 1, 1, 1, 1, 1,
-0.02349037, -2.6925, -2.940325, 1, 1, 1, 1, 1,
-0.02324839, -0.5012091, -1.758832, 1, 1, 1, 1, 1,
-0.02169898, 1.261716, -1.278999, 0, 0, 1, 1, 1,
-0.02075671, -0.7657186, -4.007401, 1, 0, 0, 1, 1,
-0.02042894, 0.4539993, -1.63102, 1, 0, 0, 1, 1,
-0.01918922, -0.6154252, -2.977343, 1, 0, 0, 1, 1,
-0.01078624, 1.254397, -0.3854855, 1, 0, 0, 1, 1,
-0.005700381, 0.03501661, -0.4915362, 1, 0, 0, 1, 1,
-0.004783019, -1.112507, -3.257769, 0, 0, 0, 1, 1,
-0.004462357, 0.3078956, -0.9163448, 0, 0, 0, 1, 1,
-0.0008312674, 0.1455902, 0.4118104, 0, 0, 0, 1, 1,
0.0005341037, -0.5172167, 1.981568, 0, 0, 0, 1, 1,
0.0006058624, -0.8759838, 2.734608, 0, 0, 0, 1, 1,
0.003222805, 0.2147777, 0.5179357, 0, 0, 0, 1, 1,
0.003674671, -2.135255, 3.105178, 0, 0, 0, 1, 1,
0.004629026, -0.2618977, 4.169752, 1, 1, 1, 1, 1,
0.006651853, 0.01838175, 1.081911, 1, 1, 1, 1, 1,
0.009575296, -0.117626, 3.541982, 1, 1, 1, 1, 1,
0.01270663, 0.1328287, 0.2436055, 1, 1, 1, 1, 1,
0.01877616, -0.5952015, 3.408686, 1, 1, 1, 1, 1,
0.02615582, 1.144302, -1.486911, 1, 1, 1, 1, 1,
0.02678068, 1.33444, 1.726221, 1, 1, 1, 1, 1,
0.03071002, -0.626937, 3.041817, 1, 1, 1, 1, 1,
0.03261043, -0.2549842, 3.856485, 1, 1, 1, 1, 1,
0.03274576, 0.2787779, 0.08287895, 1, 1, 1, 1, 1,
0.03647924, 0.01792131, 2.731099, 1, 1, 1, 1, 1,
0.04273772, 1.820383, 2.424756, 1, 1, 1, 1, 1,
0.04357679, 0.5151854, 0.2313541, 1, 1, 1, 1, 1,
0.04493666, 1.479563, 1.426896, 1, 1, 1, 1, 1,
0.04535332, 0.3882785, 0.05098368, 1, 1, 1, 1, 1,
0.04552779, 1.259881, 0.3991902, 0, 0, 1, 1, 1,
0.04929612, 0.2717669, -0.3506751, 1, 0, 0, 1, 1,
0.05014868, 1.165935, -0.446287, 1, 0, 0, 1, 1,
0.05079271, 0.1940307, -0.3996128, 1, 0, 0, 1, 1,
0.05185885, 0.5630996, 0.6358478, 1, 0, 0, 1, 1,
0.05363081, -0.7836469, 3.373127, 1, 0, 0, 1, 1,
0.06448655, 0.2025691, -0.3025711, 0, 0, 0, 1, 1,
0.07726186, 0.9844677, -0.4722253, 0, 0, 0, 1, 1,
0.07938113, 0.5702429, 0.4892415, 0, 0, 0, 1, 1,
0.07952742, 0.06394111, 1.632039, 0, 0, 0, 1, 1,
0.079997, 0.7855814, 0.7810268, 0, 0, 0, 1, 1,
0.08248609, 0.3939011, -0.4152555, 0, 0, 0, 1, 1,
0.08602284, -0.4686752, 1.545092, 0, 0, 0, 1, 1,
0.0913462, 0.4839873, 0.4319109, 1, 1, 1, 1, 1,
0.09457123, 0.9534948, -0.2595906, 1, 1, 1, 1, 1,
0.09642623, 0.1630783, 0.8275864, 1, 1, 1, 1, 1,
0.0966886, -0.4251573, 2.625162, 1, 1, 1, 1, 1,
0.09856908, 0.03238495, 1.295449, 1, 1, 1, 1, 1,
0.1024284, 0.1621168, 0.1728758, 1, 1, 1, 1, 1,
0.102739, 0.5923575, 0.4799651, 1, 1, 1, 1, 1,
0.1098779, -0.8115435, 1.769622, 1, 1, 1, 1, 1,
0.1108784, -0.2125089, 3.555552, 1, 1, 1, 1, 1,
0.1142138, -0.8907968, 2.049037, 1, 1, 1, 1, 1,
0.1160242, 0.1535356, 0.9904469, 1, 1, 1, 1, 1,
0.117451, 0.4852709, -1.751283, 1, 1, 1, 1, 1,
0.1245029, -1.331261, 2.732991, 1, 1, 1, 1, 1,
0.1408112, -0.8154186, 5.880603, 1, 1, 1, 1, 1,
0.1411095, -1.597534, 1.54214, 1, 1, 1, 1, 1,
0.1456115, -1.805525, 1.520382, 0, 0, 1, 1, 1,
0.1470246, -0.940349, 3.005328, 1, 0, 0, 1, 1,
0.1533365, 0.0795003, 1.624012, 1, 0, 0, 1, 1,
0.1538044, -1.699431, 2.046966, 1, 0, 0, 1, 1,
0.1602096, -0.5003399, 2.880673, 1, 0, 0, 1, 1,
0.1627404, -0.570411, 3.635734, 1, 0, 0, 1, 1,
0.1665078, -1.173229, 2.158849, 0, 0, 0, 1, 1,
0.1680479, -0.3590347, 3.910643, 0, 0, 0, 1, 1,
0.1717916, 0.2488428, 0.1967322, 0, 0, 0, 1, 1,
0.1721272, 0.5509515, 2.005199, 0, 0, 0, 1, 1,
0.1732329, -0.2225265, 2.71283, 0, 0, 0, 1, 1,
0.1783161, -0.03810517, 1.715845, 0, 0, 0, 1, 1,
0.1807926, -1.49342, 3.511591, 0, 0, 0, 1, 1,
0.1849, -3.055284, 2.823484, 1, 1, 1, 1, 1,
0.1857636, -0.3162359, 2.446845, 1, 1, 1, 1, 1,
0.1862078, -0.1176052, 2.723837, 1, 1, 1, 1, 1,
0.1870977, -0.5895563, 2.703954, 1, 1, 1, 1, 1,
0.1919053, 0.6915146, 1.452443, 1, 1, 1, 1, 1,
0.1942071, -0.6386629, 2.37627, 1, 1, 1, 1, 1,
0.1947309, 1.152558, 1.608328, 1, 1, 1, 1, 1,
0.1953203, -0.4920948, 3.885849, 1, 1, 1, 1, 1,
0.1985871, 0.1488389, 2.459403, 1, 1, 1, 1, 1,
0.2008838, 1.608611, 0.9999159, 1, 1, 1, 1, 1,
0.2023445, 0.2921997, -0.6684788, 1, 1, 1, 1, 1,
0.2027747, -0.2132103, 2.53845, 1, 1, 1, 1, 1,
0.2052062, 0.1412473, 2.056291, 1, 1, 1, 1, 1,
0.2064536, 0.03472648, 2.663335, 1, 1, 1, 1, 1,
0.2098507, 0.1756798, 0.3089224, 1, 1, 1, 1, 1,
0.2159506, 0.3270301, 0.7936781, 0, 0, 1, 1, 1,
0.2167099, 1.874544, 2.387086, 1, 0, 0, 1, 1,
0.2249941, -1.190125, 4.340325, 1, 0, 0, 1, 1,
0.2282066, 0.08551563, 1.03793, 1, 0, 0, 1, 1,
0.2286604, -0.7123906, 3.960198, 1, 0, 0, 1, 1,
0.2306789, -1.154626, 3.941258, 1, 0, 0, 1, 1,
0.2339453, 2.590766, 1.912467, 0, 0, 0, 1, 1,
0.2361027, 0.9451917, 0.6378296, 0, 0, 0, 1, 1,
0.2384828, -0.8500674, 4.254854, 0, 0, 0, 1, 1,
0.238892, -0.4170426, 3.539206, 0, 0, 0, 1, 1,
0.2426144, 1.421953, 0.01923696, 0, 0, 0, 1, 1,
0.2432221, -1.503157, 3.217029, 0, 0, 0, 1, 1,
0.2447059, -0.9456668, 1.035672, 0, 0, 0, 1, 1,
0.2516797, -0.7736703, 2.448244, 1, 1, 1, 1, 1,
0.2532065, -0.2598854, 1.761101, 1, 1, 1, 1, 1,
0.2542725, -1.179715, 1.216445, 1, 1, 1, 1, 1,
0.2586212, -1.756283, 4.330018, 1, 1, 1, 1, 1,
0.2594348, 0.4247852, 0.7492838, 1, 1, 1, 1, 1,
0.2597395, 1.128805, -0.2392265, 1, 1, 1, 1, 1,
0.2608662, 0.7571377, 1.432314, 1, 1, 1, 1, 1,
0.2668602, 0.2153031, 0.9926723, 1, 1, 1, 1, 1,
0.2672848, 0.04911842, 2.407269, 1, 1, 1, 1, 1,
0.2706549, -0.2936992, 1.831945, 1, 1, 1, 1, 1,
0.282645, -1.35808, 1.031458, 1, 1, 1, 1, 1,
0.2856373, -1.582208, 3.533605, 1, 1, 1, 1, 1,
0.2874987, -0.61418, 2.457255, 1, 1, 1, 1, 1,
0.2918278, -1.111819, 3.968835, 1, 1, 1, 1, 1,
0.2949032, -0.3887313, 3.551426, 1, 1, 1, 1, 1,
0.2960544, 0.03869922, 2.766572, 0, 0, 1, 1, 1,
0.2961989, 1.256744, -0.3601159, 1, 0, 0, 1, 1,
0.3013855, -0.2872989, 2.914067, 1, 0, 0, 1, 1,
0.30684, 0.5292625, 0.5269992, 1, 0, 0, 1, 1,
0.3089603, -1.464515, 3.093107, 1, 0, 0, 1, 1,
0.3124018, -1.434711, 2.259482, 1, 0, 0, 1, 1,
0.313884, 0.2133852, 0.6765465, 0, 0, 0, 1, 1,
0.315923, -1.597831, 3.277579, 0, 0, 0, 1, 1,
0.316026, 0.712474, 0.03004081, 0, 0, 0, 1, 1,
0.3162881, -1.84725, 3.321362, 0, 0, 0, 1, 1,
0.318227, -0.7351493, 2.742681, 0, 0, 0, 1, 1,
0.3210661, 0.6295873, 1.860002, 0, 0, 0, 1, 1,
0.3216363, -0.7972199, 1.898343, 0, 0, 0, 1, 1,
0.3241461, 2.217277, -0.1408523, 1, 1, 1, 1, 1,
0.3248246, -0.782009, 2.930233, 1, 1, 1, 1, 1,
0.3250726, 1.057751, 0.3692137, 1, 1, 1, 1, 1,
0.3258846, -0.327111, 2.552544, 1, 1, 1, 1, 1,
0.3269114, -0.1033319, 2.129171, 1, 1, 1, 1, 1,
0.3294206, -0.6633694, 2.034764, 1, 1, 1, 1, 1,
0.3318866, 0.4149507, -0.7099692, 1, 1, 1, 1, 1,
0.3319358, -0.5804912, 3.47628, 1, 1, 1, 1, 1,
0.3340119, -0.4021987, 0.3841528, 1, 1, 1, 1, 1,
0.3354849, -0.9028311, 2.662747, 1, 1, 1, 1, 1,
0.3372703, 0.04156819, 1.228256, 1, 1, 1, 1, 1,
0.3402005, -0.4679499, 0.2429617, 1, 1, 1, 1, 1,
0.3427404, 0.9931564, -0.09240189, 1, 1, 1, 1, 1,
0.3451768, 1.118202, 1.285776, 1, 1, 1, 1, 1,
0.3466197, 1.599823, 0.8713265, 1, 1, 1, 1, 1,
0.3529239, 0.793756, 0.7003911, 0, 0, 1, 1, 1,
0.3561044, 0.1660189, 0.5250479, 1, 0, 0, 1, 1,
0.3637421, 0.4103336, 0.3265848, 1, 0, 0, 1, 1,
0.3674935, -1.487301, 2.8669, 1, 0, 0, 1, 1,
0.3693196, -0.5180972, 2.907931, 1, 0, 0, 1, 1,
0.3695804, 0.003678626, 1.160397, 1, 0, 0, 1, 1,
0.3715459, -1.097668, 2.264814, 0, 0, 0, 1, 1,
0.371572, -0.1958701, 2.399669, 0, 0, 0, 1, 1,
0.374343, 0.2190583, 0.9881108, 0, 0, 0, 1, 1,
0.3750367, -2.362082, 2.147899, 0, 0, 0, 1, 1,
0.3771352, 2.2992, 0.3840233, 0, 0, 0, 1, 1,
0.3772669, -0.3349915, 1.496521, 0, 0, 0, 1, 1,
0.3820927, -1.920718, 2.451949, 0, 0, 0, 1, 1,
0.3823979, -1.018057, 1.169562, 1, 1, 1, 1, 1,
0.3850082, 0.5940244, -0.2650903, 1, 1, 1, 1, 1,
0.3858609, -0.8398643, 4.441717, 1, 1, 1, 1, 1,
0.38878, -1.94104, 2.73113, 1, 1, 1, 1, 1,
0.3893245, 2.218254, -0.05430968, 1, 1, 1, 1, 1,
0.3896412, 1.64508, 1.092394, 1, 1, 1, 1, 1,
0.3898492, 0.9568228, -0.4415683, 1, 1, 1, 1, 1,
0.3902701, 1.480907, -0.4186154, 1, 1, 1, 1, 1,
0.3967487, 0.4990735, 0.6554069, 1, 1, 1, 1, 1,
0.3975385, 1.236521, -1.689615, 1, 1, 1, 1, 1,
0.397553, 0.4229282, 2.096319, 1, 1, 1, 1, 1,
0.3993523, -0.2893141, 2.844127, 1, 1, 1, 1, 1,
0.3997258, -0.3370009, 1.714825, 1, 1, 1, 1, 1,
0.4009939, -0.7781128, 3.868737, 1, 1, 1, 1, 1,
0.4030778, -0.5395045, 1.5464, 1, 1, 1, 1, 1,
0.4043804, -1.846154, 4.040521, 0, 0, 1, 1, 1,
0.4084057, 0.4567367, -0.8481872, 1, 0, 0, 1, 1,
0.4104844, 0.6065422, -0.1081164, 1, 0, 0, 1, 1,
0.411748, 1.266261, 0.139656, 1, 0, 0, 1, 1,
0.4154102, 1.392734, 0.8862351, 1, 0, 0, 1, 1,
0.4166216, 0.614679, 1.396608, 1, 0, 0, 1, 1,
0.4178566, 0.1534993, 1.148431, 0, 0, 0, 1, 1,
0.4202871, -0.4525922, 3.291801, 0, 0, 0, 1, 1,
0.4224888, 0.4216882, -0.03631756, 0, 0, 0, 1, 1,
0.4261154, 0.8553588, 0.4847111, 0, 0, 0, 1, 1,
0.4273348, 0.1442873, 0.7458068, 0, 0, 0, 1, 1,
0.4285896, 1.387513, 0.7032627, 0, 0, 0, 1, 1,
0.4335452, -0.7241824, 3.531564, 0, 0, 0, 1, 1,
0.4363898, 0.5907202, 1.77368, 1, 1, 1, 1, 1,
0.4379625, 1.825821, 0.4962614, 1, 1, 1, 1, 1,
0.4469774, -0.6888742, 3.13038, 1, 1, 1, 1, 1,
0.4472469, -1.75983, 2.794132, 1, 1, 1, 1, 1,
0.4486794, -0.9595804, 1.659131, 1, 1, 1, 1, 1,
0.449866, -0.9505013, 2.741496, 1, 1, 1, 1, 1,
0.4541012, -0.5125234, 1.382589, 1, 1, 1, 1, 1,
0.4543279, 1.82299, -0.5948434, 1, 1, 1, 1, 1,
0.4548528, -0.3549768, 2.319462, 1, 1, 1, 1, 1,
0.4591875, 1.472131, 1.228286, 1, 1, 1, 1, 1,
0.4601474, -0.119035, -0.597141, 1, 1, 1, 1, 1,
0.460299, -0.836206, 2.126062, 1, 1, 1, 1, 1,
0.4612931, -2.033879, 2.936272, 1, 1, 1, 1, 1,
0.4622091, -0.2024722, 0.5038569, 1, 1, 1, 1, 1,
0.4643679, -0.6527669, 3.215019, 1, 1, 1, 1, 1,
0.4654458, 0.7280694, 0.8631811, 0, 0, 1, 1, 1,
0.4730676, -0.9448723, 2.146282, 1, 0, 0, 1, 1,
0.4761596, 0.2128765, -1.142346, 1, 0, 0, 1, 1,
0.4774448, 0.4373992, 0.5816243, 1, 0, 0, 1, 1,
0.4808521, 0.9712022, -0.568149, 1, 0, 0, 1, 1,
0.4834633, 0.753213, -0.7920753, 1, 0, 0, 1, 1,
0.4882214, -1.141476, 1.043416, 0, 0, 0, 1, 1,
0.4905878, -0.06693694, 2.108946, 0, 0, 0, 1, 1,
0.4928902, -0.4210428, 2.432326, 0, 0, 0, 1, 1,
0.4963848, 0.6635892, 3.452348, 0, 0, 0, 1, 1,
0.5040851, 0.8083676, 0.03476138, 0, 0, 0, 1, 1,
0.5070129, -0.1782643, 3.019633, 0, 0, 0, 1, 1,
0.5094583, 2.269073, 0.7324842, 0, 0, 0, 1, 1,
0.5115331, -0.1711247, 0.4227628, 1, 1, 1, 1, 1,
0.5122676, 2.041321, -0.3438578, 1, 1, 1, 1, 1,
0.5136352, -0.723087, 2.600949, 1, 1, 1, 1, 1,
0.5166234, 1.151734, 2.827728, 1, 1, 1, 1, 1,
0.5189294, -0.6001931, 1.482082, 1, 1, 1, 1, 1,
0.5195963, -0.6867324, 1.939797, 1, 1, 1, 1, 1,
0.5224306, 0.9377748, 0.4834896, 1, 1, 1, 1, 1,
0.5269402, -0.9493954, 1.143608, 1, 1, 1, 1, 1,
0.5316056, 0.2633773, -0.5742413, 1, 1, 1, 1, 1,
0.5351757, -0.4459034, 1.768602, 1, 1, 1, 1, 1,
0.5402062, -0.9499428, 1.658534, 1, 1, 1, 1, 1,
0.5452858, 1.033959, -0.183725, 1, 1, 1, 1, 1,
0.5490556, -1.029717, 1.340707, 1, 1, 1, 1, 1,
0.5564324, -1.124188, 1.729554, 1, 1, 1, 1, 1,
0.5584753, 1.168246, 0.8854246, 1, 1, 1, 1, 1,
0.5586179, -0.03463718, 2.373512, 0, 0, 1, 1, 1,
0.5651511, -0.1724875, 2.813287, 1, 0, 0, 1, 1,
0.5655566, -0.7691805, 1.797391, 1, 0, 0, 1, 1,
0.5657393, 1.543945, 0.7945265, 1, 0, 0, 1, 1,
0.5668241, -0.1792658, 1.429053, 1, 0, 0, 1, 1,
0.5674263, -0.2214736, 2.478087, 1, 0, 0, 1, 1,
0.569496, 0.8403928, 0.1306673, 0, 0, 0, 1, 1,
0.5696976, -0.8854246, 0.9038878, 0, 0, 0, 1, 1,
0.5713419, 1.410932, 0.2323658, 0, 0, 0, 1, 1,
0.5721279, 0.9661632, 1.711377, 0, 0, 0, 1, 1,
0.5731918, 1.373085, 0.4169007, 0, 0, 0, 1, 1,
0.5757877, -0.5690519, 2.204622, 0, 0, 0, 1, 1,
0.5790523, 0.7028424, 0.6838889, 0, 0, 0, 1, 1,
0.5805079, 0.06853794, 2.641408, 1, 1, 1, 1, 1,
0.5813479, 0.956483, 0.9194439, 1, 1, 1, 1, 1,
0.5822548, 0.1966198, 1.144794, 1, 1, 1, 1, 1,
0.5828738, -0.946628, 2.643497, 1, 1, 1, 1, 1,
0.5838387, -0.06140652, 2.608653, 1, 1, 1, 1, 1,
0.5840036, -0.2833807, 1.889266, 1, 1, 1, 1, 1,
0.5904111, -0.3989919, 0.8894448, 1, 1, 1, 1, 1,
0.5950949, 0.08455648, 2.229585, 1, 1, 1, 1, 1,
0.5966581, -0.9558982, 3.317529, 1, 1, 1, 1, 1,
0.5972952, 1.064779, 1.779004, 1, 1, 1, 1, 1,
0.5974644, 2.026399, 0.6202017, 1, 1, 1, 1, 1,
0.5984966, -0.07948869, 0.5276334, 1, 1, 1, 1, 1,
0.5992932, -0.7631871, 1.908236, 1, 1, 1, 1, 1,
0.5997754, 3.899656, -1.468829, 1, 1, 1, 1, 1,
0.6035114, 0.7878795, 0.6972836, 1, 1, 1, 1, 1,
0.6128027, -0.886328, 2.424162, 0, 0, 1, 1, 1,
0.6149466, 1.207141, 0.5884901, 1, 0, 0, 1, 1,
0.6212847, 0.05802834, 1.879167, 1, 0, 0, 1, 1,
0.6223776, -0.3052461, 1.610401, 1, 0, 0, 1, 1,
0.6230947, -2.21598, 1.483667, 1, 0, 0, 1, 1,
0.6254707, -0.0205132, -0.09501127, 1, 0, 0, 1, 1,
0.628612, 0.3779544, 0.5706769, 0, 0, 0, 1, 1,
0.6307482, -1.208563, 0.923492, 0, 0, 0, 1, 1,
0.6316361, -0.6791188, 3.357093, 0, 0, 0, 1, 1,
0.6326429, 0.6838199, 0.4768257, 0, 0, 0, 1, 1,
0.6336871, 1.00144, -0.3529289, 0, 0, 0, 1, 1,
0.6544068, -1.652165, 2.426036, 0, 0, 0, 1, 1,
0.656579, -1.708659, 3.218515, 0, 0, 0, 1, 1,
0.6677027, 0.5828453, 0.1799724, 1, 1, 1, 1, 1,
0.6722973, 1.083002, 1.637271, 1, 1, 1, 1, 1,
0.6734985, -1.080976, 2.177162, 1, 1, 1, 1, 1,
0.6747815, -0.2110815, 2.58011, 1, 1, 1, 1, 1,
0.6836233, 0.08864798, 2.086911, 1, 1, 1, 1, 1,
0.6852306, 1.234104, 1.481212, 1, 1, 1, 1, 1,
0.6876516, -0.9758047, 1.714092, 1, 1, 1, 1, 1,
0.6905167, 0.2965661, 1.67254, 1, 1, 1, 1, 1,
0.7036426, 0.04020999, 2.360175, 1, 1, 1, 1, 1,
0.7038391, -0.1651422, 2.936916, 1, 1, 1, 1, 1,
0.7064742, -0.6449668, 2.492242, 1, 1, 1, 1, 1,
0.7081333, 0.2908918, 1.249981, 1, 1, 1, 1, 1,
0.7086253, -0.8334832, 1.776195, 1, 1, 1, 1, 1,
0.7178443, 0.02063389, 2.750102, 1, 1, 1, 1, 1,
0.7191758, 0.132202, 1.185086, 1, 1, 1, 1, 1,
0.7199442, 1.53386, -0.02430221, 0, 0, 1, 1, 1,
0.7222407, 1.695338, 1.632166, 1, 0, 0, 1, 1,
0.7239733, -0.3154876, 1.032272, 1, 0, 0, 1, 1,
0.7252537, -0.6124654, 3.057033, 1, 0, 0, 1, 1,
0.7258067, 0.04896206, 0.8461385, 1, 0, 0, 1, 1,
0.7275472, -0.9281461, 0.7633764, 1, 0, 0, 1, 1,
0.7424299, -0.3656099, 1.958125, 0, 0, 0, 1, 1,
0.7438229, -0.08115924, 0.6130102, 0, 0, 0, 1, 1,
0.7460419, 0.3999128, 0.8448688, 0, 0, 0, 1, 1,
0.7471676, 0.4602176, 2.488629, 0, 0, 0, 1, 1,
0.7472433, -0.3839531, 1.132825, 0, 0, 0, 1, 1,
0.7490057, 0.5828552, 2.208525, 0, 0, 0, 1, 1,
0.7522262, -0.001593448, 2.086097, 0, 0, 0, 1, 1,
0.7525252, 0.7357816, 1.135508, 1, 1, 1, 1, 1,
0.75256, -0.6266922, 1.896673, 1, 1, 1, 1, 1,
0.7531082, -0.6808762, 0.6570981, 1, 1, 1, 1, 1,
0.7539331, 1.050768, 0.1187278, 1, 1, 1, 1, 1,
0.7662694, 0.5591255, 0.4419654, 1, 1, 1, 1, 1,
0.7675468, 0.5310469, 2.16391, 1, 1, 1, 1, 1,
0.7683259, 2.048819, 0.6324415, 1, 1, 1, 1, 1,
0.7689742, 0.09428179, 1.081629, 1, 1, 1, 1, 1,
0.7692814, -0.1890299, 1.81616, 1, 1, 1, 1, 1,
0.7740225, -0.8454754, 2.494003, 1, 1, 1, 1, 1,
0.7869436, 0.5733755, 1.89875, 1, 1, 1, 1, 1,
0.787083, -0.794001, 0.929185, 1, 1, 1, 1, 1,
0.7917299, -0.1232164, 2.142512, 1, 1, 1, 1, 1,
0.7931846, -2.526626, 3.009467, 1, 1, 1, 1, 1,
0.7962309, 0.7258207, 1.685008, 1, 1, 1, 1, 1,
0.8023075, 2.57061, -0.1346978, 0, 0, 1, 1, 1,
0.806399, -0.003914285, 3.696698, 1, 0, 0, 1, 1,
0.8099766, -0.3379644, 3.698228, 1, 0, 0, 1, 1,
0.8135849, -0.04627975, 2.291115, 1, 0, 0, 1, 1,
0.8207191, 0.5627987, -0.2167828, 1, 0, 0, 1, 1,
0.8241251, -1.2056, 1.420915, 1, 0, 0, 1, 1,
0.8247244, -0.8211502, 2.18352, 0, 0, 0, 1, 1,
0.825367, 1.152905, 0.3465474, 0, 0, 0, 1, 1,
0.8329804, -1.141953, 1.411548, 0, 0, 0, 1, 1,
0.833899, 0.5336748, 2.605868, 0, 0, 0, 1, 1,
0.8350207, -0.3893893, 2.105461, 0, 0, 0, 1, 1,
0.8387054, 0.5818889, 0.5030956, 0, 0, 0, 1, 1,
0.8412561, -0.5495398, 2.529588, 0, 0, 0, 1, 1,
0.843845, 1.598722, 1.647146, 1, 1, 1, 1, 1,
0.8439552, -1.339929, 2.744669, 1, 1, 1, 1, 1,
0.8455843, 0.1283625, 1.041867, 1, 1, 1, 1, 1,
0.8465991, 1.688026, 1.061812, 1, 1, 1, 1, 1,
0.8502479, -0.08306894, 2.385201, 1, 1, 1, 1, 1,
0.8575392, -1.008915, 1.619807, 1, 1, 1, 1, 1,
0.8575602, 0.8822353, 0.1252577, 1, 1, 1, 1, 1,
0.8613874, 0.3176278, -1.510771, 1, 1, 1, 1, 1,
0.8627266, 0.750833, 1.334908, 1, 1, 1, 1, 1,
0.8630447, 0.1792656, -0.5479429, 1, 1, 1, 1, 1,
0.8631302, -0.7358589, 2.905324, 1, 1, 1, 1, 1,
0.8674038, -0.9206881, 2.983284, 1, 1, 1, 1, 1,
0.8813924, -1.079678, 1.791682, 1, 1, 1, 1, 1,
0.8907859, 0.8229432, 2.315872, 1, 1, 1, 1, 1,
0.8969507, 0.8580657, 0.04145198, 1, 1, 1, 1, 1,
0.899851, -1.383296, 1.272717, 0, 0, 1, 1, 1,
0.9018542, 0.02812269, 2.25604, 1, 0, 0, 1, 1,
0.9063792, -2.171173, 2.945983, 1, 0, 0, 1, 1,
0.9086226, -0.2376486, 2.5748, 1, 0, 0, 1, 1,
0.9093339, -0.1947575, 0.9484257, 1, 0, 0, 1, 1,
0.9099885, 1.561279, 1.029196, 1, 0, 0, 1, 1,
0.9103929, 0.1765193, 2.498604, 0, 0, 0, 1, 1,
0.9109436, 0.1460801, 2.45193, 0, 0, 0, 1, 1,
0.9127294, 0.2561089, -0.3336275, 0, 0, 0, 1, 1,
0.9166706, -0.281727, 1.172697, 0, 0, 0, 1, 1,
0.9195907, -0.5841634, 0.5585687, 0, 0, 0, 1, 1,
0.9334123, 0.4042761, 0.5372091, 0, 0, 0, 1, 1,
0.9389355, -0.04501312, 2.128005, 0, 0, 0, 1, 1,
0.9441795, -1.042541, 1.879926, 1, 1, 1, 1, 1,
0.9449933, 1.006953, -0.2541426, 1, 1, 1, 1, 1,
0.9485897, -0.05139677, -0.307926, 1, 1, 1, 1, 1,
0.9562746, 0.8514532, 0.8213118, 1, 1, 1, 1, 1,
0.9614518, 0.9408405, 1.884636, 1, 1, 1, 1, 1,
0.9634053, 2.900599, 0.1063147, 1, 1, 1, 1, 1,
0.9652912, -0.2989007, 2.843748, 1, 1, 1, 1, 1,
0.9681711, -0.8550927, 1.7559, 1, 1, 1, 1, 1,
0.9711818, -0.7415981, -0.2355197, 1, 1, 1, 1, 1,
0.9718022, -0.5045501, 2.142217, 1, 1, 1, 1, 1,
0.9730252, 0.4247246, 1.098933, 1, 1, 1, 1, 1,
0.9748371, 0.02172312, 1.511601, 1, 1, 1, 1, 1,
0.9757823, 1.860423, -0.703079, 1, 1, 1, 1, 1,
0.977691, 1.317731, 1.4648, 1, 1, 1, 1, 1,
0.983489, 0.5541325, 1.298712, 1, 1, 1, 1, 1,
0.9847398, -0.5758992, 2.543984, 0, 0, 1, 1, 1,
0.9892879, -0.7360649, 4.062392, 1, 0, 0, 1, 1,
0.9966279, 1.226513, 1.771331, 1, 0, 0, 1, 1,
0.9994991, -0.1655518, 1.691992, 1, 0, 0, 1, 1,
1.003983, -1.866841, 2.673132, 1, 0, 0, 1, 1,
1.008016, -0.4510277, 2.305046, 1, 0, 0, 1, 1,
1.013713, 2.797497, 1.816301, 0, 0, 0, 1, 1,
1.016768, -2.601271, 2.156555, 0, 0, 0, 1, 1,
1.024315, -0.9492107, 0.432287, 0, 0, 0, 1, 1,
1.027989, -1.182257, 3.549304, 0, 0, 0, 1, 1,
1.02838, -1.091551, 2.359748, 0, 0, 0, 1, 1,
1.031381, 1.020915, 1.149441, 0, 0, 0, 1, 1,
1.040663, -1.109797, 2.326618, 0, 0, 0, 1, 1,
1.046182, 0.3540575, 1.250962, 1, 1, 1, 1, 1,
1.057698, -1.367013, 1.687605, 1, 1, 1, 1, 1,
1.060231, 0.3339787, 1.750679, 1, 1, 1, 1, 1,
1.062297, -1.837207, 2.257888, 1, 1, 1, 1, 1,
1.074796, 0.3179101, 1.774117, 1, 1, 1, 1, 1,
1.076808, 0.5791085, -0.7008423, 1, 1, 1, 1, 1,
1.082222, 3.229716, 0.5047138, 1, 1, 1, 1, 1,
1.084845, 1.507513, 0.3599478, 1, 1, 1, 1, 1,
1.085722, -0.5682219, 1.588133, 1, 1, 1, 1, 1,
1.095362, -0.1746277, 1.963504, 1, 1, 1, 1, 1,
1.098315, 0.4007889, 1.683955, 1, 1, 1, 1, 1,
1.111191, 0.1829077, -0.5436044, 1, 1, 1, 1, 1,
1.114658, 1.352154, 1.246583, 1, 1, 1, 1, 1,
1.116168, 0.9940091, 1.996597, 1, 1, 1, 1, 1,
1.122618, 0.5254771, -0.01891404, 1, 1, 1, 1, 1,
1.128206, 2.066311, 0.9307976, 0, 0, 1, 1, 1,
1.138665, -0.8368101, 3.169057, 1, 0, 0, 1, 1,
1.146177, -0.4716167, 1.552087, 1, 0, 0, 1, 1,
1.146528, -2.032928, 3.710189, 1, 0, 0, 1, 1,
1.149554, -0.02005076, 1.295209, 1, 0, 0, 1, 1,
1.154137, -1.543114, 4.012559, 1, 0, 0, 1, 1,
1.158654, 0.5043043, 2.94735, 0, 0, 0, 1, 1,
1.158693, -0.7588693, 1.414366, 0, 0, 0, 1, 1,
1.161352, -0.1582416, 1.088502, 0, 0, 0, 1, 1,
1.161793, 0.5043102, 1.253581, 0, 0, 0, 1, 1,
1.164916, 0.01898781, 1.752815, 0, 0, 0, 1, 1,
1.175869, -2.076262, 3.244576, 0, 0, 0, 1, 1,
1.180531, -0.6267001, 0.887567, 0, 0, 0, 1, 1,
1.180806, -1.107536, 1.434186, 1, 1, 1, 1, 1,
1.181488, -1.396124, -0.1424311, 1, 1, 1, 1, 1,
1.208253, 1.188846, -1.566042, 1, 1, 1, 1, 1,
1.212771, -0.3529469, 1.901751, 1, 1, 1, 1, 1,
1.216035, -1.408664, 3.2293, 1, 1, 1, 1, 1,
1.233638, -0.9572006, 1.515634, 1, 1, 1, 1, 1,
1.237141, -0.8076148, 1.138724, 1, 1, 1, 1, 1,
1.245944, -0.08304052, 1.644683, 1, 1, 1, 1, 1,
1.258146, 0.4450364, 1.198041, 1, 1, 1, 1, 1,
1.260751, -0.6274368, 1.590477, 1, 1, 1, 1, 1,
1.26292, 0.5098633, 0.5995287, 1, 1, 1, 1, 1,
1.26696, -1.328691, 1.157523, 1, 1, 1, 1, 1,
1.277101, -0.1842097, 1.158727, 1, 1, 1, 1, 1,
1.282368, 1.409958, 0.3777958, 1, 1, 1, 1, 1,
1.286763, -0.3113313, 1.885759, 1, 1, 1, 1, 1,
1.297541, -0.30058, 0.4993562, 0, 0, 1, 1, 1,
1.30135, -0.380476, 0.571886, 1, 0, 0, 1, 1,
1.306434, -0.7225909, 2.632749, 1, 0, 0, 1, 1,
1.30961, -1.071767, 1.065568, 1, 0, 0, 1, 1,
1.311113, -0.5679271, 3.158092, 1, 0, 0, 1, 1,
1.315998, 0.8602916, 1.098444, 1, 0, 0, 1, 1,
1.316764, -0.261299, 0.8993759, 0, 0, 0, 1, 1,
1.318704, 0.1113605, 3.465343, 0, 0, 0, 1, 1,
1.323981, 1.130702, -0.3931193, 0, 0, 0, 1, 1,
1.324859, 0.3149531, 1.283124, 0, 0, 0, 1, 1,
1.348966, 0.6642883, 0.8764663, 0, 0, 0, 1, 1,
1.353575, -0.3251962, 0.5571003, 0, 0, 0, 1, 1,
1.35659, -0.6148883, 0.2086919, 0, 0, 0, 1, 1,
1.363844, 0.1512477, 1.71406, 1, 1, 1, 1, 1,
1.366487, -0.03788852, 3.174133, 1, 1, 1, 1, 1,
1.368142, 0.20187, 2.978567, 1, 1, 1, 1, 1,
1.372927, -0.7989528, 2.506618, 1, 1, 1, 1, 1,
1.378771, -0.4682022, 2.9159, 1, 1, 1, 1, 1,
1.379678, 0.1270382, 0.318471, 1, 1, 1, 1, 1,
1.382839, 1.771309, 1.616866, 1, 1, 1, 1, 1,
1.386507, 0.4268091, 1.437486, 1, 1, 1, 1, 1,
1.390162, -0.5078592, 3.432722, 1, 1, 1, 1, 1,
1.393116, -0.1013198, 0.6103999, 1, 1, 1, 1, 1,
1.394227, 1.235474, 2.0221, 1, 1, 1, 1, 1,
1.43058, -0.9703882, 1.519393, 1, 1, 1, 1, 1,
1.451773, -1.455784, 2.810769, 1, 1, 1, 1, 1,
1.469795, 1.383235, 1.134507, 1, 1, 1, 1, 1,
1.479679, 1.088958, -0.7735053, 1, 1, 1, 1, 1,
1.512086, 0.02300828, 2.372568, 0, 0, 1, 1, 1,
1.525633, 0.3333043, 1.133814, 1, 0, 0, 1, 1,
1.532029, -0.4422767, 1.271254, 1, 0, 0, 1, 1,
1.540575, 0.5340878, 2.432441, 1, 0, 0, 1, 1,
1.547283, -0.7988626, 1.411744, 1, 0, 0, 1, 1,
1.549965, -0.8360444, 2.050946, 1, 0, 0, 1, 1,
1.555304, -0.7006365, 1.675463, 0, 0, 0, 1, 1,
1.565621, -1.585668, 1.720316, 0, 0, 0, 1, 1,
1.580407, -0.1643221, 0.7363127, 0, 0, 0, 1, 1,
1.580522, 0.7746869, 0.7208366, 0, 0, 0, 1, 1,
1.589608, 1.309943, 0.4840357, 0, 0, 0, 1, 1,
1.595031, -0.1394274, 2.263187, 0, 0, 0, 1, 1,
1.603848, -0.5264155, 2.228184, 0, 0, 0, 1, 1,
1.60658, -0.482904, 2.818251, 1, 1, 1, 1, 1,
1.613022, 1.081264, 1.440901, 1, 1, 1, 1, 1,
1.613084, 0.5462655, 1.637608, 1, 1, 1, 1, 1,
1.61569, 1.291864, 1.373299, 1, 1, 1, 1, 1,
1.61649, -0.7072008, 2.996461, 1, 1, 1, 1, 1,
1.623101, 1.585997, 0.9971181, 1, 1, 1, 1, 1,
1.633155, -0.5292125, 1.479093, 1, 1, 1, 1, 1,
1.643682, -0.9422362, 1.93306, 1, 1, 1, 1, 1,
1.653834, 0.7102101, 3.768353, 1, 1, 1, 1, 1,
1.663935, -1.070944, 2.780807, 1, 1, 1, 1, 1,
1.670844, -1.173159, 1.627798, 1, 1, 1, 1, 1,
1.685372, 0.2792815, 1.872724, 1, 1, 1, 1, 1,
1.697129, -2.462882, 3.461965, 1, 1, 1, 1, 1,
1.702105, 1.583781, 0.5647698, 1, 1, 1, 1, 1,
1.770445, -0.02750493, 0.9797616, 1, 1, 1, 1, 1,
1.791503, 0.6367765, 1.706271, 0, 0, 1, 1, 1,
1.802454, 0.8771529, 0.8361678, 1, 0, 0, 1, 1,
1.813168, 2.014552, 0.7015417, 1, 0, 0, 1, 1,
1.829537, -1.034863, 2.131588, 1, 0, 0, 1, 1,
1.867426, -1.237072, 2.2633, 1, 0, 0, 1, 1,
1.873851, -0.9992593, 2.33285, 1, 0, 0, 1, 1,
1.877552, -0.2512313, 1.682719, 0, 0, 0, 1, 1,
1.900218, -0.1965983, 2.795029, 0, 0, 0, 1, 1,
1.921225, -1.034645, 1.480564, 0, 0, 0, 1, 1,
1.931397, -0.2012949, 1.99516, 0, 0, 0, 1, 1,
1.959912, 1.008235, -0.8268805, 0, 0, 0, 1, 1,
1.978041, -0.2638346, 2.406087, 0, 0, 0, 1, 1,
1.978887, 0.7365733, 0.5345216, 0, 0, 0, 1, 1,
2.025818, 0.8733616, 2.656285, 1, 1, 1, 1, 1,
2.033244, 0.7213542, 1.216226, 1, 1, 1, 1, 1,
2.035751, 0.3601068, 1.337362, 1, 1, 1, 1, 1,
2.064354, -0.4673699, 2.162685, 1, 1, 1, 1, 1,
2.064594, 1.207019, 0.3873632, 1, 1, 1, 1, 1,
2.083047, -1.470625, 2.361737, 1, 1, 1, 1, 1,
2.095294, 0.9077141, 0.2245172, 1, 1, 1, 1, 1,
2.102159, -0.1795848, 1.712099, 1, 1, 1, 1, 1,
2.107017, -0.2014133, 1.912107, 1, 1, 1, 1, 1,
2.120686, -0.2826352, 0.04180822, 1, 1, 1, 1, 1,
2.124673, 0.7065954, 1.606735, 1, 1, 1, 1, 1,
2.155703, -0.2220695, 2.506674, 1, 1, 1, 1, 1,
2.189444, 1.010337, 1.899121, 1, 1, 1, 1, 1,
2.216842, -0.8934944, 3.010968, 1, 1, 1, 1, 1,
2.221761, 1.030511, 0.5278229, 1, 1, 1, 1, 1,
2.229627, -0.7129961, 2.409195, 0, 0, 1, 1, 1,
2.242291, 1.054887, 1.734677, 1, 0, 0, 1, 1,
2.254009, -0.4916216, 2.69718, 1, 0, 0, 1, 1,
2.254401, 1.125409, 0.4473478, 1, 0, 0, 1, 1,
2.257671, 0.2850922, 2.123768, 1, 0, 0, 1, 1,
2.274422, -0.9579757, 0.5402651, 1, 0, 0, 1, 1,
2.310362, -1.209806, 0.5637447, 0, 0, 0, 1, 1,
2.319054, -0.09694448, 2.250428, 0, 0, 0, 1, 1,
2.490399, 0.211594, 1.514726, 0, 0, 0, 1, 1,
2.583772, 1.381398, 1.735583, 0, 0, 0, 1, 1,
2.586139, -1.366016, 0.6701289, 0, 0, 0, 1, 1,
2.652597, 0.969594, 1.212999, 0, 0, 0, 1, 1,
2.745943, -0.6508451, 2.485452, 0, 0, 0, 1, 1,
2.893138, -1.056664, 0.7713475, 1, 1, 1, 1, 1,
3.009959, 0.5677914, 1.441542, 1, 1, 1, 1, 1,
3.157601, 0.8238975, 2.337253, 1, 1, 1, 1, 1,
3.171212, 1.063569, 0.2119859, 1, 1, 1, 1, 1,
3.173502, -0.3157831, 1.010552, 1, 1, 1, 1, 1,
3.339599, 1.452553, 1.997054, 1, 1, 1, 1, 1,
3.633521, -0.8438799, 1.418088, 1, 1, 1, 1, 1
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
var radius = 10.33836;
var distance = 36.31305;
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
mvMatrix.translate( -0.2881141, -0.243854, 0.03119278 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.31305);
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
