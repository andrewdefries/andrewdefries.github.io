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
-3.223351, 0.4909253, -1.093195, 1, 0, 0, 1,
-2.971665, 0.5265439, 1.649519, 1, 0.007843138, 0, 1,
-2.754881, -2.037875, -2.056448, 1, 0.01176471, 0, 1,
-2.540965, -0.04280755, -0.824024, 1, 0.01960784, 0, 1,
-2.507335, -0.498906, -0.6774309, 1, 0.02352941, 0, 1,
-2.490669, 0.3108367, 0.002265897, 1, 0.03137255, 0, 1,
-2.39119, 0.1196167, -0.4862616, 1, 0.03529412, 0, 1,
-2.334678, 0.6075476, -0.3342411, 1, 0.04313726, 0, 1,
-2.260219, -0.4291705, -1.067705, 1, 0.04705882, 0, 1,
-2.237373, 0.4009138, -0.3506398, 1, 0.05490196, 0, 1,
-2.204541, -0.4879166, -3.087358, 1, 0.05882353, 0, 1,
-2.178687, 1.014476, -1.888532, 1, 0.06666667, 0, 1,
-2.131541, 1.493972, -1.662989, 1, 0.07058824, 0, 1,
-2.069948, 0.907906, -0.9628789, 1, 0.07843138, 0, 1,
-2.031838, -0.1593821, 0.03532425, 1, 0.08235294, 0, 1,
-2.00783, 0.03115588, -3.241365, 1, 0.09019608, 0, 1,
-1.970263, 1.181163, 1.021898, 1, 0.09411765, 0, 1,
-1.94345, -1.518635, -2.163638, 1, 0.1019608, 0, 1,
-1.940881, -1.645594, -2.310913, 1, 0.1098039, 0, 1,
-1.937435, -0.5074567, -2.383982, 1, 0.1137255, 0, 1,
-1.925979, -1.00837, -2.901082, 1, 0.1215686, 0, 1,
-1.918159, 1.5378, 1.359967, 1, 0.1254902, 0, 1,
-1.909817, 0.7513536, -2.075111, 1, 0.1333333, 0, 1,
-1.900031, 0.9024806, 0.2292996, 1, 0.1372549, 0, 1,
-1.832513, -0.08693852, 0.1465352, 1, 0.145098, 0, 1,
-1.790409, -0.01510619, -1.692315, 1, 0.1490196, 0, 1,
-1.771629, -0.498274, -2.454648, 1, 0.1568628, 0, 1,
-1.768283, -2.339543, -3.640885, 1, 0.1607843, 0, 1,
-1.762567, 1.785172, -2.219116, 1, 0.1686275, 0, 1,
-1.751789, 0.2395253, -3.8684, 1, 0.172549, 0, 1,
-1.74888, 0.1884725, -1.653859, 1, 0.1803922, 0, 1,
-1.722642, -1.509218, -3.810673, 1, 0.1843137, 0, 1,
-1.702446, 1.026318, -0.2855952, 1, 0.1921569, 0, 1,
-1.691961, -0.7660154, -0.771844, 1, 0.1960784, 0, 1,
-1.681504, 1.126934, 0.336718, 1, 0.2039216, 0, 1,
-1.680676, -1.731295, -2.58896, 1, 0.2117647, 0, 1,
-1.665392, -0.3864226, -1.657815, 1, 0.2156863, 0, 1,
-1.659603, -1.157268, -0.8460145, 1, 0.2235294, 0, 1,
-1.656384, 0.1792229, -2.807483, 1, 0.227451, 0, 1,
-1.655445, 1.64956, -1.921292, 1, 0.2352941, 0, 1,
-1.654354, -1.439795, -2.786361, 1, 0.2392157, 0, 1,
-1.646608, -1.077704, -1.886829, 1, 0.2470588, 0, 1,
-1.641953, -1.824715, -1.866377, 1, 0.2509804, 0, 1,
-1.636249, 0.765086, -1.091322, 1, 0.2588235, 0, 1,
-1.620479, -0.3966744, -1.454185, 1, 0.2627451, 0, 1,
-1.615527, 1.863775, -0.5340339, 1, 0.2705882, 0, 1,
-1.612067, 1.476336, -1.183445, 1, 0.2745098, 0, 1,
-1.604887, -1.831766, -1.384055, 1, 0.282353, 0, 1,
-1.599049, 1.552799, -1.481749, 1, 0.2862745, 0, 1,
-1.585079, 0.6098862, -2.334425, 1, 0.2941177, 0, 1,
-1.579057, -1.403042, -0.8843274, 1, 0.3019608, 0, 1,
-1.565954, -0.2716587, -1.585227, 1, 0.3058824, 0, 1,
-1.565942, -0.8830031, -3.125587, 1, 0.3137255, 0, 1,
-1.56366, 0.4108071, -3.487159, 1, 0.3176471, 0, 1,
-1.558453, 0.9638775, -1.281462, 1, 0.3254902, 0, 1,
-1.558043, 2.02763, -2.332273, 1, 0.3294118, 0, 1,
-1.556652, 0.08817251, -2.891107, 1, 0.3372549, 0, 1,
-1.553232, -0.6957166, -1.913937, 1, 0.3411765, 0, 1,
-1.550468, -1.101787, -2.151475, 1, 0.3490196, 0, 1,
-1.541351, -1.512057, -3.199356, 1, 0.3529412, 0, 1,
-1.537971, -1.563236, -0.7485754, 1, 0.3607843, 0, 1,
-1.534329, -0.4777092, -1.874963, 1, 0.3647059, 0, 1,
-1.49505, -2.92488, -2.365432, 1, 0.372549, 0, 1,
-1.489018, 1.290978, -0.4233737, 1, 0.3764706, 0, 1,
-1.480813, -0.3346442, 0.03729161, 1, 0.3843137, 0, 1,
-1.480375, -1.058051, -2.292768, 1, 0.3882353, 0, 1,
-1.455942, 0.9269471, -1.540582, 1, 0.3960784, 0, 1,
-1.447059, 0.3972929, -2.761026, 1, 0.4039216, 0, 1,
-1.446825, 0.7557949, -0.7995568, 1, 0.4078431, 0, 1,
-1.439145, -0.6907653, -1.378176, 1, 0.4156863, 0, 1,
-1.434237, -0.3597955, -2.61182, 1, 0.4196078, 0, 1,
-1.430443, -0.07672788, -3.010242, 1, 0.427451, 0, 1,
-1.430113, -0.1216513, -0.7431707, 1, 0.4313726, 0, 1,
-1.405799, 1.175142, 0.2158554, 1, 0.4392157, 0, 1,
-1.403098, 0.1152549, -1.0864, 1, 0.4431373, 0, 1,
-1.378854, -0.717346, -3.09385, 1, 0.4509804, 0, 1,
-1.37785, 0.2771356, -2.282176, 1, 0.454902, 0, 1,
-1.372736, 0.7706729, -2.045983, 1, 0.4627451, 0, 1,
-1.369294, -0.4846631, -3.936345, 1, 0.4666667, 0, 1,
-1.354767, 0.1441167, -2.307391, 1, 0.4745098, 0, 1,
-1.349921, 0.1274223, -1.105545, 1, 0.4784314, 0, 1,
-1.330943, -1.05036, -1.468751, 1, 0.4862745, 0, 1,
-1.312575, 0.2018029, -0.8030666, 1, 0.4901961, 0, 1,
-1.304334, -0.4876916, -3.064056, 1, 0.4980392, 0, 1,
-1.302806, -0.3675092, -2.365625, 1, 0.5058824, 0, 1,
-1.301871, -0.6472469, -3.089407, 1, 0.509804, 0, 1,
-1.293019, -1.909818, -0.500301, 1, 0.5176471, 0, 1,
-1.281507, 0.7425638, -2.641863, 1, 0.5215687, 0, 1,
-1.281111, -2.104723, -0.9988156, 1, 0.5294118, 0, 1,
-1.262127, -2.235922, -2.447458, 1, 0.5333334, 0, 1,
-1.260936, 0.6636974, -2.712916, 1, 0.5411765, 0, 1,
-1.252723, 1.026472, -0.2957306, 1, 0.5450981, 0, 1,
-1.236251, 0.007292311, -2.165883, 1, 0.5529412, 0, 1,
-1.224019, 2.934482, 0.9347951, 1, 0.5568628, 0, 1,
-1.213387, 0.5412546, -0.7109506, 1, 0.5647059, 0, 1,
-1.192419, 0.5584314, -1.390495, 1, 0.5686275, 0, 1,
-1.18749, 0.4597557, -0.1392311, 1, 0.5764706, 0, 1,
-1.181764, -0.1585395, -1.341061, 1, 0.5803922, 0, 1,
-1.180793, 0.829662, -0.997154, 1, 0.5882353, 0, 1,
-1.17817, 1.47263, -0.6885343, 1, 0.5921569, 0, 1,
-1.174484, -0.4482062, -0.7912496, 1, 0.6, 0, 1,
-1.174106, 1.680297, 0.622139, 1, 0.6078432, 0, 1,
-1.171251, -0.4502366, -0.3354919, 1, 0.6117647, 0, 1,
-1.170005, 0.7590082, 0.4353707, 1, 0.6196079, 0, 1,
-1.169562, -0.3900507, -1.794535, 1, 0.6235294, 0, 1,
-1.168429, 0.9833402, 0.1972782, 1, 0.6313726, 0, 1,
-1.164561, 0.2635768, -0.4486181, 1, 0.6352941, 0, 1,
-1.159136, 1.046679, -2.146891, 1, 0.6431373, 0, 1,
-1.157476, 1.001923, -1.967906, 1, 0.6470588, 0, 1,
-1.147401, -0.4930899, -0.6308216, 1, 0.654902, 0, 1,
-1.144558, 0.198014, -0.1284716, 1, 0.6588235, 0, 1,
-1.143992, 0.907654, 0.009306799, 1, 0.6666667, 0, 1,
-1.142276, -0.00979348, -2.002002, 1, 0.6705883, 0, 1,
-1.138037, -0.9289876, -2.913155, 1, 0.6784314, 0, 1,
-1.13591, 0.4190832, -1.419218, 1, 0.682353, 0, 1,
-1.134945, 1.020756, 0.3184071, 1, 0.6901961, 0, 1,
-1.133881, 0.3122051, -0.1088039, 1, 0.6941177, 0, 1,
-1.131927, -1.914389, -2.425114, 1, 0.7019608, 0, 1,
-1.129556, 0.1707745, -1.403062, 1, 0.7098039, 0, 1,
-1.128496, -0.4634612, -3.235554, 1, 0.7137255, 0, 1,
-1.126554, 0.8780885, -0.2940415, 1, 0.7215686, 0, 1,
-1.125656, -0.4446248, -1.768947, 1, 0.7254902, 0, 1,
-1.124063, -0.04204044, -0.6609848, 1, 0.7333333, 0, 1,
-1.12131, -0.3648901, -1.798309, 1, 0.7372549, 0, 1,
-1.119995, 1.839377, -1.070049, 1, 0.7450981, 0, 1,
-1.114254, -1.06811, -2.926944, 1, 0.7490196, 0, 1,
-1.111599, 2.194294, -0.8967736, 1, 0.7568628, 0, 1,
-1.110294, -2.341547, -4.08968, 1, 0.7607843, 0, 1,
-1.109416, 1.129076, -1.467473, 1, 0.7686275, 0, 1,
-1.104552, 0.5314926, -1.505633, 1, 0.772549, 0, 1,
-1.10236, 1.557758, -0.9006371, 1, 0.7803922, 0, 1,
-1.09864, -0.8509904, -2.559133, 1, 0.7843137, 0, 1,
-1.093482, 0.2408845, 0.08034743, 1, 0.7921569, 0, 1,
-1.093306, -1.650805, -3.851083, 1, 0.7960784, 0, 1,
-1.083277, -0.0322918, -2.526024, 1, 0.8039216, 0, 1,
-1.082, 0.9432083, -0.8734528, 1, 0.8117647, 0, 1,
-1.081069, -0.695437, -0.7760189, 1, 0.8156863, 0, 1,
-1.080966, -0.8067271, -3.323081, 1, 0.8235294, 0, 1,
-1.063888, -0.4947302, -2.54933, 1, 0.827451, 0, 1,
-1.06247, -0.3271669, -1.447343, 1, 0.8352941, 0, 1,
-1.060756, -1.068869, -2.40101, 1, 0.8392157, 0, 1,
-1.054731, 0.7601818, -1.72416, 1, 0.8470588, 0, 1,
-1.052843, 0.4300604, -1.567377, 1, 0.8509804, 0, 1,
-1.038023, 1.484667, 0.5297215, 1, 0.8588235, 0, 1,
-1.033185, -1.851403, -2.659635, 1, 0.8627451, 0, 1,
-1.032587, -0.6015787, -0.4516633, 1, 0.8705882, 0, 1,
-1.028204, -0.820103, -1.544986, 1, 0.8745098, 0, 1,
-1.027791, 2.141064, 0.6776304, 1, 0.8823529, 0, 1,
-1.026297, -0.01359445, -2.267647, 1, 0.8862745, 0, 1,
-1.023681, -0.9297417, -2.679752, 1, 0.8941177, 0, 1,
-1.022406, -0.6257495, -2.54718, 1, 0.8980392, 0, 1,
-1.017395, 1.067207, -0.6015372, 1, 0.9058824, 0, 1,
-1.016381, 1.142628, -0.5275413, 1, 0.9137255, 0, 1,
-1.005638, -0.3134894, -0.8960848, 1, 0.9176471, 0, 1,
-1.004844, 1.577464, 0.9457647, 1, 0.9254902, 0, 1,
-0.9967126, 0.0210255, -0.8215488, 1, 0.9294118, 0, 1,
-0.995334, 0.8697015, -1.218585, 1, 0.9372549, 0, 1,
-0.9944553, -0.739068, -3.616687, 1, 0.9411765, 0, 1,
-0.9873151, 0.3462052, -0.7933912, 1, 0.9490196, 0, 1,
-0.9853966, -1.347645, -2.099952, 1, 0.9529412, 0, 1,
-0.9812002, -1.696941, -1.51848, 1, 0.9607843, 0, 1,
-0.9803043, -0.1363132, -2.893546, 1, 0.9647059, 0, 1,
-0.9783148, 2.308178, 0.9529761, 1, 0.972549, 0, 1,
-0.9720819, 0.1073248, -1.045454, 1, 0.9764706, 0, 1,
-0.9531546, -1.468424, -4.102378, 1, 0.9843137, 0, 1,
-0.9529825, 0.6114894, 0.328412, 1, 0.9882353, 0, 1,
-0.9518157, 0.5569994, -0.1588439, 1, 0.9960784, 0, 1,
-0.943436, -0.4698728, -4.138961, 0.9960784, 1, 0, 1,
-0.9380664, 0.4364826, -0.8317704, 0.9921569, 1, 0, 1,
-0.9323727, 0.6598306, -1.286874, 0.9843137, 1, 0, 1,
-0.9310243, 0.2459841, -2.124871, 0.9803922, 1, 0, 1,
-0.9299645, 0.9537972, -1.330509, 0.972549, 1, 0, 1,
-0.9279258, -0.1052947, -2.500466, 0.9686275, 1, 0, 1,
-0.9226603, 1.579806, 0.3218825, 0.9607843, 1, 0, 1,
-0.90412, -0.516948, -0.8135392, 0.9568627, 1, 0, 1,
-0.903925, -0.8391547, -3.261929, 0.9490196, 1, 0, 1,
-0.8985627, 0.6047021, -0.8330268, 0.945098, 1, 0, 1,
-0.8984007, -0.8548242, -2.773726, 0.9372549, 1, 0, 1,
-0.8972951, 0.4880942, -1.041418, 0.9333333, 1, 0, 1,
-0.8969659, -0.8778802, -2.718715, 0.9254902, 1, 0, 1,
-0.8945589, -0.2304932, -2.392607, 0.9215686, 1, 0, 1,
-0.8922534, 0.7054471, -0.9413072, 0.9137255, 1, 0, 1,
-0.8918093, 0.3197701, -1.018609, 0.9098039, 1, 0, 1,
-0.889964, 0.2088456, -3.254384, 0.9019608, 1, 0, 1,
-0.8723509, 0.4101422, -1.085612, 0.8941177, 1, 0, 1,
-0.8713277, -0.05572386, -1.285918, 0.8901961, 1, 0, 1,
-0.8642021, -1.034459, -2.469491, 0.8823529, 1, 0, 1,
-0.8640345, -0.26839, -4.152122, 0.8784314, 1, 0, 1,
-0.8617374, -0.2922201, -1.885358, 0.8705882, 1, 0, 1,
-0.8601034, 1.141863, 0.295618, 0.8666667, 1, 0, 1,
-0.8599573, 2.127267, -1.765907, 0.8588235, 1, 0, 1,
-0.8598139, -0.3545971, -0.2947098, 0.854902, 1, 0, 1,
-0.8498725, -0.9308333, -2.833898, 0.8470588, 1, 0, 1,
-0.8489674, 0.1617004, -0.2505592, 0.8431373, 1, 0, 1,
-0.848204, -0.1585565, -2.900826, 0.8352941, 1, 0, 1,
-0.8466125, -0.3933248, -2.624099, 0.8313726, 1, 0, 1,
-0.8444718, 0.01691184, -2.248825, 0.8235294, 1, 0, 1,
-0.8439085, -0.4383531, -0.9577249, 0.8196079, 1, 0, 1,
-0.8437322, 1.498695, -0.9668229, 0.8117647, 1, 0, 1,
-0.8365064, -1.618985, -2.46323, 0.8078431, 1, 0, 1,
-0.8348249, 2.724673, -0.429624, 0.8, 1, 0, 1,
-0.8327045, -2.159737, -1.498077, 0.7921569, 1, 0, 1,
-0.8323813, -0.2812926, -2.137656, 0.7882353, 1, 0, 1,
-0.8252037, 1.491361, -1.498266, 0.7803922, 1, 0, 1,
-0.8242301, -0.7238205, -2.482358, 0.7764706, 1, 0, 1,
-0.8242247, -1.676183, -4.495809, 0.7686275, 1, 0, 1,
-0.8218418, -0.2215409, -2.725474, 0.7647059, 1, 0, 1,
-0.8216723, -1.590052, -3.066287, 0.7568628, 1, 0, 1,
-0.8181998, -0.006014005, -1.90437, 0.7529412, 1, 0, 1,
-0.8169342, -1.618759, -2.827684, 0.7450981, 1, 0, 1,
-0.8094027, -0.1907361, -2.47365, 0.7411765, 1, 0, 1,
-0.8057786, -0.04563198, -1.050646, 0.7333333, 1, 0, 1,
-0.8046185, -2.386566, -4.050045, 0.7294118, 1, 0, 1,
-0.7977552, -0.4511856, -0.9044321, 0.7215686, 1, 0, 1,
-0.7880292, 0.8046141, 0.7652349, 0.7176471, 1, 0, 1,
-0.7741532, 0.9245813, -0.2203424, 0.7098039, 1, 0, 1,
-0.7693434, 1.335555, -0.641714, 0.7058824, 1, 0, 1,
-0.7575014, -0.09263548, -0.5541432, 0.6980392, 1, 0, 1,
-0.7374877, -0.5236401, -2.298419, 0.6901961, 1, 0, 1,
-0.7368772, 0.4271689, -1.293473, 0.6862745, 1, 0, 1,
-0.7366985, -1.170936, -2.736395, 0.6784314, 1, 0, 1,
-0.7320512, 1.915804, -1.356785, 0.6745098, 1, 0, 1,
-0.7301751, -0.8530738, -3.631374, 0.6666667, 1, 0, 1,
-0.7202874, -0.006588574, -0.9827603, 0.6627451, 1, 0, 1,
-0.7177513, 0.9029357, -2.123348, 0.654902, 1, 0, 1,
-0.7145655, -0.2112919, -1.855877, 0.6509804, 1, 0, 1,
-0.7101193, 0.4084927, -1.086268, 0.6431373, 1, 0, 1,
-0.7067889, 0.5127689, 1.16922, 0.6392157, 1, 0, 1,
-0.7058639, 0.2204113, -0.9660835, 0.6313726, 1, 0, 1,
-0.7054323, 0.4107651, 1.364967, 0.627451, 1, 0, 1,
-0.7010589, -0.4943987, -1.239854, 0.6196079, 1, 0, 1,
-0.6995293, 0.2219711, -2.601451, 0.6156863, 1, 0, 1,
-0.6970229, -0.8771249, -4.236872, 0.6078432, 1, 0, 1,
-0.6957835, 0.3025849, -1.879258, 0.6039216, 1, 0, 1,
-0.6915116, -0.1464373, -2.088456, 0.5960785, 1, 0, 1,
-0.6836965, 0.09079856, -2.135726, 0.5882353, 1, 0, 1,
-0.6813318, 0.358741, -2.488919, 0.5843138, 1, 0, 1,
-0.6599545, 0.09617218, -2.413678, 0.5764706, 1, 0, 1,
-0.6569174, 1.109453, -1.071968, 0.572549, 1, 0, 1,
-0.6569054, 0.9602513, -1.221393, 0.5647059, 1, 0, 1,
-0.6552129, -1.157659, -1.441321, 0.5607843, 1, 0, 1,
-0.654154, -1.673791, -2.757468, 0.5529412, 1, 0, 1,
-0.650601, -1.014042, -2.700348, 0.5490196, 1, 0, 1,
-0.6478897, -0.9717342, -0.9821977, 0.5411765, 1, 0, 1,
-0.6472498, -1.331997, -3.65568, 0.5372549, 1, 0, 1,
-0.645233, 0.9855167, -0.8204276, 0.5294118, 1, 0, 1,
-0.6448411, 0.1748339, -1.448308, 0.5254902, 1, 0, 1,
-0.6406941, 0.07453758, -0.03105371, 0.5176471, 1, 0, 1,
-0.6395698, 0.8609563, -1.137051, 0.5137255, 1, 0, 1,
-0.6379635, 0.3900345, 0.1461592, 0.5058824, 1, 0, 1,
-0.6356775, -0.115133, -1.154954, 0.5019608, 1, 0, 1,
-0.6343054, 0.6745652, 0.3776353, 0.4941176, 1, 0, 1,
-0.6340787, -0.2138351, -1.966679, 0.4862745, 1, 0, 1,
-0.6327633, 0.5786203, -1.468355, 0.4823529, 1, 0, 1,
-0.6295062, 2.337399, -1.610849, 0.4745098, 1, 0, 1,
-0.6263469, -1.179723, -2.826409, 0.4705882, 1, 0, 1,
-0.6226934, -0.9276425, -3.379735, 0.4627451, 1, 0, 1,
-0.6176358, -0.2062423, -1.457391, 0.4588235, 1, 0, 1,
-0.6166915, 1.214162, -0.6834089, 0.4509804, 1, 0, 1,
-0.6143044, 0.3454573, -2.568719, 0.4470588, 1, 0, 1,
-0.6136401, -1.728799, -2.749214, 0.4392157, 1, 0, 1,
-0.6126758, -0.09450852, -4.14133, 0.4352941, 1, 0, 1,
-0.6126134, -1.340705, -0.5365102, 0.427451, 1, 0, 1,
-0.6051317, -1.330961, -2.671442, 0.4235294, 1, 0, 1,
-0.6029219, -0.9792901, -2.838573, 0.4156863, 1, 0, 1,
-0.6024023, 0.02232816, -2.911769, 0.4117647, 1, 0, 1,
-0.5996793, 0.1617213, 0.06194178, 0.4039216, 1, 0, 1,
-0.5911307, 0.3787055, -1.223267, 0.3960784, 1, 0, 1,
-0.5906053, -0.3841168, -4.001524, 0.3921569, 1, 0, 1,
-0.5881389, 0.8841219, 1.202384, 0.3843137, 1, 0, 1,
-0.5796916, 0.3065603, -1.196377, 0.3803922, 1, 0, 1,
-0.5785972, -0.9691086, -3.239374, 0.372549, 1, 0, 1,
-0.5729244, -0.8522127, -3.553405, 0.3686275, 1, 0, 1,
-0.5679808, -0.7729552, -2.417494, 0.3607843, 1, 0, 1,
-0.5604352, -0.01694005, -1.025409, 0.3568628, 1, 0, 1,
-0.5585404, -0.8245443, -1.645308, 0.3490196, 1, 0, 1,
-0.5534436, 1.236678, -1.119628, 0.345098, 1, 0, 1,
-0.550476, -0.4455318, -1.469402, 0.3372549, 1, 0, 1,
-0.5495913, -1.340796, -2.383613, 0.3333333, 1, 0, 1,
-0.548103, -0.7328803, -2.486171, 0.3254902, 1, 0, 1,
-0.5435359, -0.2103337, -1.192514, 0.3215686, 1, 0, 1,
-0.5412338, -0.9299948, -1.292561, 0.3137255, 1, 0, 1,
-0.537872, 0.6575587, 1.234751, 0.3098039, 1, 0, 1,
-0.5332243, -0.3219609, -2.792574, 0.3019608, 1, 0, 1,
-0.5323212, -0.0240539, -2.251122, 0.2941177, 1, 0, 1,
-0.5305371, -3.196236, -3.121849, 0.2901961, 1, 0, 1,
-0.5271651, 0.2947898, -0.6949859, 0.282353, 1, 0, 1,
-0.5235403, 0.4200941, -0.9092374, 0.2784314, 1, 0, 1,
-0.5191864, -1.326508, -1.580763, 0.2705882, 1, 0, 1,
-0.5166108, -1.468846, -3.532168, 0.2666667, 1, 0, 1,
-0.5075842, 0.3619505, -0.2738484, 0.2588235, 1, 0, 1,
-0.5031266, 0.08336148, -0.7857141, 0.254902, 1, 0, 1,
-0.4991646, 1.544941, -0.4354962, 0.2470588, 1, 0, 1,
-0.4989265, 0.2508106, -0.6482381, 0.2431373, 1, 0, 1,
-0.4970135, -0.8951141, -4.032712, 0.2352941, 1, 0, 1,
-0.4910746, 0.8013791, 0.455728, 0.2313726, 1, 0, 1,
-0.4887315, 0.8867868, -0.7125001, 0.2235294, 1, 0, 1,
-0.4856853, -0.4319947, -3.974946, 0.2196078, 1, 0, 1,
-0.4856355, -1.659518, -2.996547, 0.2117647, 1, 0, 1,
-0.4764439, -1.080395, -2.116404, 0.2078431, 1, 0, 1,
-0.4740226, -1.408472, -2.506822, 0.2, 1, 0, 1,
-0.4694743, 1.155775, 1.529184, 0.1921569, 1, 0, 1,
-0.4689158, 2.254293, -0.3593104, 0.1882353, 1, 0, 1,
-0.4679433, -0.8698818, -3.13685, 0.1803922, 1, 0, 1,
-0.4644173, -1.55334, -2.538683, 0.1764706, 1, 0, 1,
-0.4638462, 0.01648968, -2.121856, 0.1686275, 1, 0, 1,
-0.4566521, -0.8246253, -2.208074, 0.1647059, 1, 0, 1,
-0.4561188, -0.4109545, -2.927775, 0.1568628, 1, 0, 1,
-0.4554588, -1.405582, -4.045534, 0.1529412, 1, 0, 1,
-0.4503059, -0.7748162, -3.107845, 0.145098, 1, 0, 1,
-0.4502516, 0.2697147, -0.2055508, 0.1411765, 1, 0, 1,
-0.4480231, -0.2513125, -2.73787, 0.1333333, 1, 0, 1,
-0.4450034, 1.435478, 1.30088, 0.1294118, 1, 0, 1,
-0.4435946, 0.3425392, 0.5624033, 0.1215686, 1, 0, 1,
-0.4424225, -0.7680628, -2.549003, 0.1176471, 1, 0, 1,
-0.4411035, 1.289411, -2.663518, 0.1098039, 1, 0, 1,
-0.4400248, -0.1061846, -1.669158, 0.1058824, 1, 0, 1,
-0.4391641, -0.6698778, -4.285817, 0.09803922, 1, 0, 1,
-0.4378699, 1.081301, 0.580752, 0.09019608, 1, 0, 1,
-0.4271516, 1.307444, 0.9602988, 0.08627451, 1, 0, 1,
-0.4236909, -1.142297, -2.454851, 0.07843138, 1, 0, 1,
-0.4227977, -0.709689, -3.052631, 0.07450981, 1, 0, 1,
-0.4220845, -0.9943427, -2.570919, 0.06666667, 1, 0, 1,
-0.4219856, 0.3420445, -1.887655, 0.0627451, 1, 0, 1,
-0.4213825, 0.3544202, -0.5803221, 0.05490196, 1, 0, 1,
-0.4192495, 0.05915417, -0.7558971, 0.05098039, 1, 0, 1,
-0.4156206, 0.6642585, -1.689223, 0.04313726, 1, 0, 1,
-0.4113856, -1.259819, -2.733416, 0.03921569, 1, 0, 1,
-0.4102224, 1.109502, -0.9447766, 0.03137255, 1, 0, 1,
-0.4090717, 0.1870147, -1.654108, 0.02745098, 1, 0, 1,
-0.4086275, 0.8875479, -0.9633631, 0.01960784, 1, 0, 1,
-0.4079273, 0.5057928, -1.162401, 0.01568628, 1, 0, 1,
-0.4035821, 0.9361559, 0.394081, 0.007843138, 1, 0, 1,
-0.3985761, -0.04095653, -1.243904, 0.003921569, 1, 0, 1,
-0.3891163, -0.09265054, -0.9218929, 0, 1, 0.003921569, 1,
-0.3865738, -2.045977, -2.971285, 0, 1, 0.01176471, 1,
-0.3862564, 0.8866752, -1.612738, 0, 1, 0.01568628, 1,
-0.3832416, -0.2990887, -1.81731, 0, 1, 0.02352941, 1,
-0.3830669, 0.200688, -0.4231166, 0, 1, 0.02745098, 1,
-0.3785955, 2.029237, 0.6645633, 0, 1, 0.03529412, 1,
-0.3782496, 1.739296, 0.08230983, 0, 1, 0.03921569, 1,
-0.377867, 0.3199527, -0.3905334, 0, 1, 0.04705882, 1,
-0.3768061, 2.28966, -1.249899, 0, 1, 0.05098039, 1,
-0.3712205, -1.84475, -3.250538, 0, 1, 0.05882353, 1,
-0.367635, -1.57287, -1.774833, 0, 1, 0.0627451, 1,
-0.362523, 0.07195404, -0.4987217, 0, 1, 0.07058824, 1,
-0.3607073, 0.747464, -1.474446, 0, 1, 0.07450981, 1,
-0.3481153, 0.4750426, 0.5689251, 0, 1, 0.08235294, 1,
-0.3453015, -1.310116, -3.802887, 0, 1, 0.08627451, 1,
-0.3432829, 0.8142943, -0.8645894, 0, 1, 0.09411765, 1,
-0.3403789, -1.071243, -2.753427, 0, 1, 0.1019608, 1,
-0.3371535, 0.3591454, -0.6491485, 0, 1, 0.1058824, 1,
-0.3370996, -0.364938, -1.120672, 0, 1, 0.1137255, 1,
-0.3355291, 0.7202075, 1.493369, 0, 1, 0.1176471, 1,
-0.3343541, 0.2312789, -0.3258853, 0, 1, 0.1254902, 1,
-0.3339265, -0.2936778, -2.056561, 0, 1, 0.1294118, 1,
-0.3330938, -0.6726068, -3.1281, 0, 1, 0.1372549, 1,
-0.3297491, 0.6602277, -2.072132, 0, 1, 0.1411765, 1,
-0.3273335, 0.356905, -1.852151, 0, 1, 0.1490196, 1,
-0.3259802, 0.0982703, -0.06621671, 0, 1, 0.1529412, 1,
-0.3230695, -1.617947, -3.226733, 0, 1, 0.1607843, 1,
-0.3216903, 0.1369004, -2.6385, 0, 1, 0.1647059, 1,
-0.3203699, -0.4695316, -3.326597, 0, 1, 0.172549, 1,
-0.3184174, -1.530254, -3.680562, 0, 1, 0.1764706, 1,
-0.3153658, 1.514349, 1.143567, 0, 1, 0.1843137, 1,
-0.3142973, -0.1707287, -2.812844, 0, 1, 0.1882353, 1,
-0.3091967, 0.3279774, -0.4584727, 0, 1, 0.1960784, 1,
-0.3072205, -0.6769949, -1.586699, 0, 1, 0.2039216, 1,
-0.3056554, 1.816538, -1.446631, 0, 1, 0.2078431, 1,
-0.3007891, 0.6058034, -0.567648, 0, 1, 0.2156863, 1,
-0.2988293, 1.409754, -1.25701, 0, 1, 0.2196078, 1,
-0.2983729, -0.4771677, -3.082609, 0, 1, 0.227451, 1,
-0.294891, -0.3544489, -2.525759, 0, 1, 0.2313726, 1,
-0.286352, 0.5042894, -0.8208967, 0, 1, 0.2392157, 1,
-0.2842009, -0.4350043, -3.685403, 0, 1, 0.2431373, 1,
-0.2824982, -0.4826174, -2.591295, 0, 1, 0.2509804, 1,
-0.2820314, -1.190701, -0.9296327, 0, 1, 0.254902, 1,
-0.2798553, -0.1760348, -0.5444839, 0, 1, 0.2627451, 1,
-0.2774627, -0.4892211, -3.35363, 0, 1, 0.2666667, 1,
-0.2678947, 0.2567126, -0.5001466, 0, 1, 0.2745098, 1,
-0.2662862, 0.5483981, 0.3525889, 0, 1, 0.2784314, 1,
-0.2642736, 0.4194376, -1.880326, 0, 1, 0.2862745, 1,
-0.253661, -0.8390092, -1.713553, 0, 1, 0.2901961, 1,
-0.2514977, -0.5335958, -2.333898, 0, 1, 0.2980392, 1,
-0.2413591, 0.6170995, -0.3281384, 0, 1, 0.3058824, 1,
-0.2403724, 0.1611052, -0.932617, 0, 1, 0.3098039, 1,
-0.237121, 1.014491, 0.1468845, 0, 1, 0.3176471, 1,
-0.2329157, 1.054759, -0.7451386, 0, 1, 0.3215686, 1,
-0.2315615, 0.2686336, -1.390368, 0, 1, 0.3294118, 1,
-0.2285198, 1.912609, -0.2326142, 0, 1, 0.3333333, 1,
-0.2263613, 0.3090374, 0.3966531, 0, 1, 0.3411765, 1,
-0.2255505, 0.5665696, -0.6039686, 0, 1, 0.345098, 1,
-0.2255094, -0.8560371, -2.548571, 0, 1, 0.3529412, 1,
-0.2242767, -0.1715482, -0.4696927, 0, 1, 0.3568628, 1,
-0.2203075, 1.668526, 0.3166758, 0, 1, 0.3647059, 1,
-0.2191138, -0.9195259, -1.514151, 0, 1, 0.3686275, 1,
-0.2117676, 0.6570596, 0.05651001, 0, 1, 0.3764706, 1,
-0.202995, 0.1718512, -0.2804928, 0, 1, 0.3803922, 1,
-0.1958693, -1.161036, -2.811645, 0, 1, 0.3882353, 1,
-0.1858999, 0.5339802, -0.6936628, 0, 1, 0.3921569, 1,
-0.1825339, -0.2324715, -0.9080162, 0, 1, 0.4, 1,
-0.1813322, 1.580814, 0.03384717, 0, 1, 0.4078431, 1,
-0.176433, 0.940219, -0.01190821, 0, 1, 0.4117647, 1,
-0.1720604, -0.5015327, -3.690982, 0, 1, 0.4196078, 1,
-0.1695695, -0.1379205, -0.7076918, 0, 1, 0.4235294, 1,
-0.1678708, -0.1869878, -2.405092, 0, 1, 0.4313726, 1,
-0.1676265, -0.06976936, -1.249063, 0, 1, 0.4352941, 1,
-0.1659619, 0.1726266, -1.256436, 0, 1, 0.4431373, 1,
-0.1613092, 0.8925369, 1.631341, 0, 1, 0.4470588, 1,
-0.1601872, -1.909463, -4.879634, 0, 1, 0.454902, 1,
-0.1557144, -0.2802349, -2.188706, 0, 1, 0.4588235, 1,
-0.1539392, 1.145372, 1.20287, 0, 1, 0.4666667, 1,
-0.1521881, 2.492106, 1.663558, 0, 1, 0.4705882, 1,
-0.1515146, -1.090142, -3.263872, 0, 1, 0.4784314, 1,
-0.1505555, -1.892196, -3.080238, 0, 1, 0.4823529, 1,
-0.147539, -0.9830531, -4.271327, 0, 1, 0.4901961, 1,
-0.1446584, -1.177817, -2.229274, 0, 1, 0.4941176, 1,
-0.1421243, -1.577824, -4.062275, 0, 1, 0.5019608, 1,
-0.1385609, 0.6455787, 0.4705023, 0, 1, 0.509804, 1,
-0.1351638, -0.938288, -3.013607, 0, 1, 0.5137255, 1,
-0.1341623, 0.933354, 0.8603163, 0, 1, 0.5215687, 1,
-0.1317476, -0.8025817, -3.957819, 0, 1, 0.5254902, 1,
-0.1307122, -1.377141, -2.46972, 0, 1, 0.5333334, 1,
-0.1291925, 0.4001823, -1.044788, 0, 1, 0.5372549, 1,
-0.1267286, -0.6745982, -3.239487, 0, 1, 0.5450981, 1,
-0.1255382, -0.6616396, -2.686397, 0, 1, 0.5490196, 1,
-0.1251126, 0.9379246, -0.3333401, 0, 1, 0.5568628, 1,
-0.1247592, -0.0003360875, -1.177534, 0, 1, 0.5607843, 1,
-0.1245516, -0.9869218, -3.966797, 0, 1, 0.5686275, 1,
-0.1211632, -1.213846, -2.020511, 0, 1, 0.572549, 1,
-0.1205274, 0.01337428, -1.550261, 0, 1, 0.5803922, 1,
-0.1085204, 1.432257, -1.187805, 0, 1, 0.5843138, 1,
-0.1084206, 1.896259, -0.4094605, 0, 1, 0.5921569, 1,
-0.107367, -0.02316636, -0.4669651, 0, 1, 0.5960785, 1,
-0.1054464, -1.178532, -3.328843, 0, 1, 0.6039216, 1,
-0.0993526, 0.2521668, -1.770002, 0, 1, 0.6117647, 1,
-0.09805135, -1.949814, -2.39113, 0, 1, 0.6156863, 1,
-0.09578951, -0.07774676, -2.463158, 0, 1, 0.6235294, 1,
-0.09046111, -0.6532467, -3.434468, 0, 1, 0.627451, 1,
-0.08505137, 0.1866323, -0.9278209, 0, 1, 0.6352941, 1,
-0.08382782, 0.3475851, 0.1136809, 0, 1, 0.6392157, 1,
-0.08025173, 1.601953, 1.406981, 0, 1, 0.6470588, 1,
-0.07873289, 0.5438018, -0.7875798, 0, 1, 0.6509804, 1,
-0.07870125, -0.4104936, -2.840222, 0, 1, 0.6588235, 1,
-0.07465896, 1.61344, -0.7642424, 0, 1, 0.6627451, 1,
-0.0733474, -0.4794993, -1.974753, 0, 1, 0.6705883, 1,
-0.07257874, 0.5984061, -0.1928325, 0, 1, 0.6745098, 1,
-0.07008864, -0.6846812, -2.803261, 0, 1, 0.682353, 1,
-0.06679498, 0.09479534, 0.697412, 0, 1, 0.6862745, 1,
-0.0655762, -1.299198, -3.048007, 0, 1, 0.6941177, 1,
-0.06551315, 0.2433594, -1.439836, 0, 1, 0.7019608, 1,
-0.05573962, 1.506454, -0.3422746, 0, 1, 0.7058824, 1,
-0.05548723, 0.480785, 0.8503173, 0, 1, 0.7137255, 1,
-0.0534494, 0.5591993, -0.5284215, 0, 1, 0.7176471, 1,
-0.05260336, 0.2564602, 0.6568317, 0, 1, 0.7254902, 1,
-0.05140817, -0.02401925, -2.442575, 0, 1, 0.7294118, 1,
-0.05133655, -0.7881461, -1.847789, 0, 1, 0.7372549, 1,
-0.04827242, -0.2147693, -1.456906, 0, 1, 0.7411765, 1,
-0.04676031, 0.2045534, -0.6372447, 0, 1, 0.7490196, 1,
-0.04451159, 1.952335, -0.4342841, 0, 1, 0.7529412, 1,
-0.0430699, 0.6317757, -0.6075183, 0, 1, 0.7607843, 1,
-0.04183706, -1.437333, -2.024812, 0, 1, 0.7647059, 1,
-0.04089726, -0.9065769, -2.532812, 0, 1, 0.772549, 1,
-0.04054108, 0.2896071, 0.4836516, 0, 1, 0.7764706, 1,
-0.03923642, -1.322383, -4.198454, 0, 1, 0.7843137, 1,
-0.03427751, -1.022312, -2.358114, 0, 1, 0.7882353, 1,
-0.03061044, -1.527488, -2.555993, 0, 1, 0.7960784, 1,
-0.02508882, 1.060709, -0.8815372, 0, 1, 0.8039216, 1,
-0.02398772, -1.001365, -2.546905, 0, 1, 0.8078431, 1,
-0.01102699, -0.400035, -3.979225, 0, 1, 0.8156863, 1,
-0.009094509, 0.6141942, -0.460132, 0, 1, 0.8196079, 1,
-0.007416357, 0.3827412, 1.322679, 0, 1, 0.827451, 1,
0.01061113, 0.7512934, 0.8484818, 0, 1, 0.8313726, 1,
0.01355358, 1.821564, -0.7014943, 0, 1, 0.8392157, 1,
0.01366629, -0.809834, 4.848471, 0, 1, 0.8431373, 1,
0.01737426, 0.3315421, 1.48336, 0, 1, 0.8509804, 1,
0.02166041, 1.113298, 1.037735, 0, 1, 0.854902, 1,
0.02460463, 0.5273353, 1.44426, 0, 1, 0.8627451, 1,
0.02585928, -0.2692999, 1.81851, 0, 1, 0.8666667, 1,
0.02770422, 0.3115167, 0.5377562, 0, 1, 0.8745098, 1,
0.02996389, -2.060123, 2.868104, 0, 1, 0.8784314, 1,
0.03122908, 0.2105352, -1.870531, 0, 1, 0.8862745, 1,
0.03510199, 1.421089, 0.09070949, 0, 1, 0.8901961, 1,
0.03574648, -1.598731, 4.660844, 0, 1, 0.8980392, 1,
0.03704754, -0.9109415, 2.554543, 0, 1, 0.9058824, 1,
0.03751395, -0.07875212, 4.549541, 0, 1, 0.9098039, 1,
0.04052529, 1.517824, 0.4440161, 0, 1, 0.9176471, 1,
0.040548, 0.9412726, 1.168342, 0, 1, 0.9215686, 1,
0.0448426, 0.6765044, 1.505961, 0, 1, 0.9294118, 1,
0.04715763, 0.8742957, -1.063632, 0, 1, 0.9333333, 1,
0.04754425, -1.065663, 1.797539, 0, 1, 0.9411765, 1,
0.04892118, -0.1605034, 1.568316, 0, 1, 0.945098, 1,
0.05105256, -2.217804, 2.898993, 0, 1, 0.9529412, 1,
0.05182912, 0.7310775, -0.2623304, 0, 1, 0.9568627, 1,
0.05356225, 1.411239, 1.442434, 0, 1, 0.9647059, 1,
0.05383787, 1.882218, 1.232875, 0, 1, 0.9686275, 1,
0.05524404, -0.6281085, 4.363731, 0, 1, 0.9764706, 1,
0.05736288, 0.1268161, 0.8586184, 0, 1, 0.9803922, 1,
0.05828381, -1.270902, 1.234954, 0, 1, 0.9882353, 1,
0.06009587, 0.7719817, -1.015244, 0, 1, 0.9921569, 1,
0.06111081, -0.0667309, 1.697291, 0, 1, 1, 1,
0.06141731, -0.145441, 3.191977, 0, 0.9921569, 1, 1,
0.06280614, -0.9868516, 4.335414, 0, 0.9882353, 1, 1,
0.06499822, 0.6923504, 1.945108, 0, 0.9803922, 1, 1,
0.06539965, 0.3229351, 0.3938498, 0, 0.9764706, 1, 1,
0.06621948, -0.2616682, 2.81197, 0, 0.9686275, 1, 1,
0.07089927, -0.4339106, 2.799984, 0, 0.9647059, 1, 1,
0.0743261, 0.8434927, 0.4178274, 0, 0.9568627, 1, 1,
0.0764112, 1.183541, 1.586293, 0, 0.9529412, 1, 1,
0.07983637, -0.5836891, 2.195507, 0, 0.945098, 1, 1,
0.08016752, -2.622894, 1.986835, 0, 0.9411765, 1, 1,
0.08404255, 1.87955, -1.131756, 0, 0.9333333, 1, 1,
0.0902373, 0.7613694, -1.989989, 0, 0.9294118, 1, 1,
0.09266149, -1.349773, 2.946512, 0, 0.9215686, 1, 1,
0.09610517, -0.1792487, 3.021207, 0, 0.9176471, 1, 1,
0.1011195, -0.3114291, 2.175287, 0, 0.9098039, 1, 1,
0.1067501, -0.8322594, 3.133613, 0, 0.9058824, 1, 1,
0.1109706, -1.694602, 3.746946, 0, 0.8980392, 1, 1,
0.1118285, 0.06973093, 0.3389608, 0, 0.8901961, 1, 1,
0.112823, 0.6921105, -0.3079942, 0, 0.8862745, 1, 1,
0.1130228, -0.3155016, 1.341905, 0, 0.8784314, 1, 1,
0.1131563, -0.2784237, 2.045585, 0, 0.8745098, 1, 1,
0.1138539, 1.121746, -0.1925787, 0, 0.8666667, 1, 1,
0.1204341, 1.414313, 0.8672501, 0, 0.8627451, 1, 1,
0.1215173, -1.548388, 3.306714, 0, 0.854902, 1, 1,
0.1250692, 1.222873, 0.2837281, 0, 0.8509804, 1, 1,
0.1259023, 0.0638244, 0.7009658, 0, 0.8431373, 1, 1,
0.1293287, 1.470667, -0.2912902, 0, 0.8392157, 1, 1,
0.1317996, 0.5135906, -0.04400021, 0, 0.8313726, 1, 1,
0.1360592, 0.5191268, -1.107396, 0, 0.827451, 1, 1,
0.1380339, 0.2252129, 0.9074363, 0, 0.8196079, 1, 1,
0.1381845, -0.9844317, 2.344124, 0, 0.8156863, 1, 1,
0.1384811, -1.284554, 3.303376, 0, 0.8078431, 1, 1,
0.1391724, -0.5820395, 1.955867, 0, 0.8039216, 1, 1,
0.1473492, -0.2010845, 3.228079, 0, 0.7960784, 1, 1,
0.1503968, -0.05015107, 2.64794, 0, 0.7882353, 1, 1,
0.1505469, -0.7695609, 1.775076, 0, 0.7843137, 1, 1,
0.1508756, 0.4935705, -0.5395445, 0, 0.7764706, 1, 1,
0.1533676, 0.3468118, 1.189545, 0, 0.772549, 1, 1,
0.1549707, 0.3848481, -1.010104, 0, 0.7647059, 1, 1,
0.1561021, 0.4963849, 0.2109807, 0, 0.7607843, 1, 1,
0.161705, -0.3558349, 2.587024, 0, 0.7529412, 1, 1,
0.1622739, 0.1348811, 1.310174, 0, 0.7490196, 1, 1,
0.1727384, -0.8655186, 4.314119, 0, 0.7411765, 1, 1,
0.1750224, 0.386234, -0.3377267, 0, 0.7372549, 1, 1,
0.1780912, -0.2934608, 1.2256, 0, 0.7294118, 1, 1,
0.1790425, 1.402057, -0.1081221, 0, 0.7254902, 1, 1,
0.1795317, 0.4178209, 0.171005, 0, 0.7176471, 1, 1,
0.1800609, 0.1035502, 1.423225, 0, 0.7137255, 1, 1,
0.1829174, 0.6513565, -0.06217292, 0, 0.7058824, 1, 1,
0.1831074, 1.775545, 0.9779023, 0, 0.6980392, 1, 1,
0.1849559, -2.05087, 4.838968, 0, 0.6941177, 1, 1,
0.1890068, 0.09294613, 2.190898, 0, 0.6862745, 1, 1,
0.1921186, -0.3002772, 1.928579, 0, 0.682353, 1, 1,
0.1946733, -1.099129, 3.995007, 0, 0.6745098, 1, 1,
0.195294, 0.1397877, 1.12295, 0, 0.6705883, 1, 1,
0.1958258, 0.7791297, -0.9955258, 0, 0.6627451, 1, 1,
0.1961021, 1.034821, -0.1795474, 0, 0.6588235, 1, 1,
0.1981688, -0.2267409, 2.340672, 0, 0.6509804, 1, 1,
0.1999696, -1.156449, 2.069737, 0, 0.6470588, 1, 1,
0.2012724, 1.243051, 0.02595448, 0, 0.6392157, 1, 1,
0.2047977, -0.6500309, 3.804648, 0, 0.6352941, 1, 1,
0.211024, -0.6082646, 2.778715, 0, 0.627451, 1, 1,
0.2126864, 0.4407753, -0.8805142, 0, 0.6235294, 1, 1,
0.2139089, 0.450171, -0.8956046, 0, 0.6156863, 1, 1,
0.2139538, 0.3640035, 0.9672453, 0, 0.6117647, 1, 1,
0.2151568, 0.4334244, 0.703127, 0, 0.6039216, 1, 1,
0.2157573, 0.3556629, -0.5154036, 0, 0.5960785, 1, 1,
0.2201561, 0.4204092, -0.4414048, 0, 0.5921569, 1, 1,
0.2221979, 1.657877, 1.045807, 0, 0.5843138, 1, 1,
0.2238574, -0.6154838, 2.311923, 0, 0.5803922, 1, 1,
0.2281902, -1.714029, 3.777409, 0, 0.572549, 1, 1,
0.229543, -0.2043804, 2.043504, 0, 0.5686275, 1, 1,
0.2310563, -0.06573912, 2.022744, 0, 0.5607843, 1, 1,
0.233405, -1.657094, 3.431763, 0, 0.5568628, 1, 1,
0.2356227, 1.812583, -0.4062076, 0, 0.5490196, 1, 1,
0.2508727, 1.145596, -1.079705, 0, 0.5450981, 1, 1,
0.2532446, 0.670744, -0.3868172, 0, 0.5372549, 1, 1,
0.2547717, -1.425616, 1.58326, 0, 0.5333334, 1, 1,
0.2573622, -0.9074684, 2.522927, 0, 0.5254902, 1, 1,
0.2603772, 0.8828219, 2.260952, 0, 0.5215687, 1, 1,
0.2637114, -0.5941468, 2.472709, 0, 0.5137255, 1, 1,
0.2657218, 0.0281705, 0.9034232, 0, 0.509804, 1, 1,
0.2702882, -0.9985834, 4.712784, 0, 0.5019608, 1, 1,
0.2772451, 0.4621101, 1.461302, 0, 0.4941176, 1, 1,
0.2782193, 1.030784, 0.5507406, 0, 0.4901961, 1, 1,
0.2806837, 2.135807, -0.5201387, 0, 0.4823529, 1, 1,
0.2822977, 0.07467942, 1.07027, 0, 0.4784314, 1, 1,
0.2866717, -0.7791516, 2.390541, 0, 0.4705882, 1, 1,
0.2876417, 0.8796995, 1.540318, 0, 0.4666667, 1, 1,
0.2888747, 0.7428131, 1.275494, 0, 0.4588235, 1, 1,
0.2898082, 0.1381688, 0.8550751, 0, 0.454902, 1, 1,
0.2901956, 0.8417414, 0.2287249, 0, 0.4470588, 1, 1,
0.294393, 0.4697874, 0.107904, 0, 0.4431373, 1, 1,
0.3009306, -0.1735508, 2.896477, 0, 0.4352941, 1, 1,
0.3057893, -0.03344402, 2.017755, 0, 0.4313726, 1, 1,
0.3088312, -0.1534993, 2.147295, 0, 0.4235294, 1, 1,
0.3094407, -1.168374, 2.394905, 0, 0.4196078, 1, 1,
0.3144652, -0.5804152, 2.370318, 0, 0.4117647, 1, 1,
0.3186494, 0.4956133, -0.4627916, 0, 0.4078431, 1, 1,
0.3196713, 0.3932205, 2.484721, 0, 0.4, 1, 1,
0.3211955, 1.493072, 0.02472698, 0, 0.3921569, 1, 1,
0.3230439, 0.4770319, 0.9142612, 0, 0.3882353, 1, 1,
0.3231809, 1.279892, 0.3514185, 0, 0.3803922, 1, 1,
0.3267105, 1.10217, -1.581849, 0, 0.3764706, 1, 1,
0.3270519, -0.7278939, 1.911111, 0, 0.3686275, 1, 1,
0.3327116, 0.6404021, 3.100991, 0, 0.3647059, 1, 1,
0.3342131, 0.3030852, 1.845751, 0, 0.3568628, 1, 1,
0.3344349, 0.9522393, -0.7407345, 0, 0.3529412, 1, 1,
0.3351316, -0.6434605, 2.453094, 0, 0.345098, 1, 1,
0.3365623, 0.230613, 1.833718, 0, 0.3411765, 1, 1,
0.3409196, 2.725466, 0.9622131, 0, 0.3333333, 1, 1,
0.3483932, 0.2554801, 0.5221148, 0, 0.3294118, 1, 1,
0.3519738, -0.9840496, 3.444165, 0, 0.3215686, 1, 1,
0.3552334, 0.4542018, -0.7327911, 0, 0.3176471, 1, 1,
0.356352, 1.363387, -0.02738152, 0, 0.3098039, 1, 1,
0.3591558, 1.530116, 1.328839, 0, 0.3058824, 1, 1,
0.3628745, 1.371668, -0.0435393, 0, 0.2980392, 1, 1,
0.3652953, 0.4832457, 1.191691, 0, 0.2901961, 1, 1,
0.3668323, 0.5926974, -0.8298085, 0, 0.2862745, 1, 1,
0.3672693, 1.050978, -0.5128377, 0, 0.2784314, 1, 1,
0.3715116, 1.537839, -1.879515, 0, 0.2745098, 1, 1,
0.3723514, 0.9509552, -0.04202164, 0, 0.2666667, 1, 1,
0.373818, -0.08505569, 2.672872, 0, 0.2627451, 1, 1,
0.3767672, -0.9819023, 2.398198, 0, 0.254902, 1, 1,
0.3815996, -0.3921382, 2.179939, 0, 0.2509804, 1, 1,
0.382261, -3.143211, 4.163869, 0, 0.2431373, 1, 1,
0.384182, -1.403807, 1.866298, 0, 0.2392157, 1, 1,
0.3853092, 0.7859259, -0.4230092, 0, 0.2313726, 1, 1,
0.3924585, 0.8905749, 1.36603, 0, 0.227451, 1, 1,
0.3928998, 0.3287773, 0.02641607, 0, 0.2196078, 1, 1,
0.3955263, -1.578915, 2.922507, 0, 0.2156863, 1, 1,
0.4024587, 1.229926, 0.1536612, 0, 0.2078431, 1, 1,
0.406181, -0.6941072, 2.817467, 0, 0.2039216, 1, 1,
0.4101326, 1.051202, -0.4455878, 0, 0.1960784, 1, 1,
0.4103254, -1.843416, 2.443228, 0, 0.1882353, 1, 1,
0.4135395, 0.9440109, 1.626213, 0, 0.1843137, 1, 1,
0.4162429, -1.361386, 3.912762, 0, 0.1764706, 1, 1,
0.4175447, -0.05295055, 2.801299, 0, 0.172549, 1, 1,
0.4220372, -0.9464341, 4.599862, 0, 0.1647059, 1, 1,
0.4244348, 0.04295205, 2.253699, 0, 0.1607843, 1, 1,
0.425444, -0.6335869, 1.12603, 0, 0.1529412, 1, 1,
0.4266447, 0.1596714, 0.9100668, 0, 0.1490196, 1, 1,
0.4281507, -0.452221, 1.079955, 0, 0.1411765, 1, 1,
0.4287444, 0.6407852, 1.134684, 0, 0.1372549, 1, 1,
0.4364566, 2.185824, -0.913082, 0, 0.1294118, 1, 1,
0.4387316, -0.2524719, 0.673754, 0, 0.1254902, 1, 1,
0.441669, 2.390717, -0.6715987, 0, 0.1176471, 1, 1,
0.4419439, 0.3126295, 1.06053, 0, 0.1137255, 1, 1,
0.4491244, -0.73815, 1.678923, 0, 0.1058824, 1, 1,
0.4506996, -1.436908, 1.355998, 0, 0.09803922, 1, 1,
0.4507252, 2.085627, 0.4243052, 0, 0.09411765, 1, 1,
0.4561779, 0.003872265, 3.258015, 0, 0.08627451, 1, 1,
0.4576745, 0.4285928, 2.604237, 0, 0.08235294, 1, 1,
0.4591045, -0.8702052, 2.897092, 0, 0.07450981, 1, 1,
0.4609877, -0.304819, 1.52961, 0, 0.07058824, 1, 1,
0.4630792, 0.9587991, -0.2745614, 0, 0.0627451, 1, 1,
0.463488, -0.4970595, 2.972555, 0, 0.05882353, 1, 1,
0.465947, 0.3758307, 1.278248, 0, 0.05098039, 1, 1,
0.4685753, 0.1964407, 0.9562089, 0, 0.04705882, 1, 1,
0.4712553, 0.1728654, -0.2195266, 0, 0.03921569, 1, 1,
0.4780498, -1.522526, 2.383994, 0, 0.03529412, 1, 1,
0.4787109, -0.5924614, 3.18645, 0, 0.02745098, 1, 1,
0.4908012, -0.4309699, 2.26943, 0, 0.02352941, 1, 1,
0.498709, -0.9444442, 1.958532, 0, 0.01568628, 1, 1,
0.501192, 1.595664, 1.52141, 0, 0.01176471, 1, 1,
0.5017299, -1.636652, 1.962519, 0, 0.003921569, 1, 1,
0.5024679, -2.187791, 1.188993, 0.003921569, 0, 1, 1,
0.5049341, -0.2003643, 2.416748, 0.007843138, 0, 1, 1,
0.5064265, -0.1549621, 2.225432, 0.01568628, 0, 1, 1,
0.5083929, 0.272645, 0.6870527, 0.01960784, 0, 1, 1,
0.5126429, 0.8495101, 1.796719, 0.02745098, 0, 1, 1,
0.5141111, -0.2420008, 2.059773, 0.03137255, 0, 1, 1,
0.5165423, -0.1759201, 1.017951, 0.03921569, 0, 1, 1,
0.5170062, 0.600556, 1.775141, 0.04313726, 0, 1, 1,
0.517713, -0.2456647, 2.476517, 0.05098039, 0, 1, 1,
0.5224121, -1.680693, 1.855432, 0.05490196, 0, 1, 1,
0.5298978, 0.3512436, 0.2978108, 0.0627451, 0, 1, 1,
0.5301251, -0.5291014, 4.085624, 0.06666667, 0, 1, 1,
0.5339569, -0.2488898, 2.429416, 0.07450981, 0, 1, 1,
0.5340421, 0.8638617, 0.2947817, 0.07843138, 0, 1, 1,
0.534392, 0.3276794, 1.409556, 0.08627451, 0, 1, 1,
0.537526, -0.6416138, 1.306403, 0.09019608, 0, 1, 1,
0.5431859, -1.148171, 2.400496, 0.09803922, 0, 1, 1,
0.5463434, -0.2339982, 0.8632474, 0.1058824, 0, 1, 1,
0.5490193, -1.552541, 2.888462, 0.1098039, 0, 1, 1,
0.5499601, -0.1006821, 4.733387, 0.1176471, 0, 1, 1,
0.5529518, 2.032041, 1.636402, 0.1215686, 0, 1, 1,
0.5558848, 0.3072675, 0.6956742, 0.1294118, 0, 1, 1,
0.5591118, 0.8070016, -0.368261, 0.1333333, 0, 1, 1,
0.5591238, -0.8756877, 3.469611, 0.1411765, 0, 1, 1,
0.5602869, -1.1419, 3.100217, 0.145098, 0, 1, 1,
0.5623316, 1.992233, -0.3107059, 0.1529412, 0, 1, 1,
0.5624004, -1.716614, 2.97931, 0.1568628, 0, 1, 1,
0.566591, 0.6465418, -0.4310458, 0.1647059, 0, 1, 1,
0.5669299, 0.5889174, 0.9773819, 0.1686275, 0, 1, 1,
0.5703804, 1.418918, 1.256546, 0.1764706, 0, 1, 1,
0.5709643, 1.187871, 1.461574, 0.1803922, 0, 1, 1,
0.5745869, -0.4564806, 2.866176, 0.1882353, 0, 1, 1,
0.5753568, -2.989023, 2.565983, 0.1921569, 0, 1, 1,
0.5753911, -1.154273, 1.43688, 0.2, 0, 1, 1,
0.5767482, 0.02590201, 3.578888, 0.2078431, 0, 1, 1,
0.5771295, 2.096844, 0.1941883, 0.2117647, 0, 1, 1,
0.5780516, 2.142324, 1.982499, 0.2196078, 0, 1, 1,
0.587458, 1.440605, 0.362129, 0.2235294, 0, 1, 1,
0.589149, -0.0767562, 1.289788, 0.2313726, 0, 1, 1,
0.5907221, 2.21289, -0.697028, 0.2352941, 0, 1, 1,
0.5922856, 0.523649, -1.779352, 0.2431373, 0, 1, 1,
0.5953683, -1.736287, 3.87984, 0.2470588, 0, 1, 1,
0.5958362, 0.8334559, 0.2030289, 0.254902, 0, 1, 1,
0.5973159, 0.926679, 0.6421651, 0.2588235, 0, 1, 1,
0.5979413, 0.6758253, 0.9126931, 0.2666667, 0, 1, 1,
0.5994969, -0.5807037, 2.271913, 0.2705882, 0, 1, 1,
0.6002804, 0.5684463, 1.827181, 0.2784314, 0, 1, 1,
0.6067712, 2.692996, -0.9438153, 0.282353, 0, 1, 1,
0.6093329, -2.233786, 4.714681, 0.2901961, 0, 1, 1,
0.6121902, 0.6520405, -0.4121987, 0.2941177, 0, 1, 1,
0.6153503, 0.4158844, 0.3570121, 0.3019608, 0, 1, 1,
0.6162998, -0.06022092, 1.207468, 0.3098039, 0, 1, 1,
0.6206628, 0.02530785, 3.346107, 0.3137255, 0, 1, 1,
0.6253905, 0.9769835, 3.688484, 0.3215686, 0, 1, 1,
0.625775, 1.519849, -1.816839, 0.3254902, 0, 1, 1,
0.6265276, -0.41691, 1.827698, 0.3333333, 0, 1, 1,
0.6277492, 0.8412201, -0.1365308, 0.3372549, 0, 1, 1,
0.632851, 0.9491572, 1.747876, 0.345098, 0, 1, 1,
0.6373248, -0.6915801, 2.636596, 0.3490196, 0, 1, 1,
0.6416456, -1.008645, 3.487545, 0.3568628, 0, 1, 1,
0.6421896, 1.479279, 0.939069, 0.3607843, 0, 1, 1,
0.6482322, 0.8382176, 0.1172543, 0.3686275, 0, 1, 1,
0.6639221, 0.627747, -0.7876563, 0.372549, 0, 1, 1,
0.6651627, 1.078022, -0.4494033, 0.3803922, 0, 1, 1,
0.6653646, -0.1975315, 1.689252, 0.3843137, 0, 1, 1,
0.6723245, 0.8119469, 0.5185626, 0.3921569, 0, 1, 1,
0.6778078, 1.441598, -1.00431, 0.3960784, 0, 1, 1,
0.6783294, -0.8825256, 1.279913, 0.4039216, 0, 1, 1,
0.6951812, -0.5437627, 2.981723, 0.4117647, 0, 1, 1,
0.6953899, 1.792302, 2.1069, 0.4156863, 0, 1, 1,
0.6979297, 2.022076, 0.06328642, 0.4235294, 0, 1, 1,
0.7000856, -0.5220138, 2.011594, 0.427451, 0, 1, 1,
0.7020137, -0.1403714, 3.003645, 0.4352941, 0, 1, 1,
0.704815, -0.9802459, 2.696128, 0.4392157, 0, 1, 1,
0.7097993, -0.3430001, 1.472244, 0.4470588, 0, 1, 1,
0.7132544, -1.003542, 2.121626, 0.4509804, 0, 1, 1,
0.7208706, -0.7388454, 2.441179, 0.4588235, 0, 1, 1,
0.7240666, -0.4173478, 4.466763, 0.4627451, 0, 1, 1,
0.7250678, -0.7557724, 2.212167, 0.4705882, 0, 1, 1,
0.7256377, -0.006676716, 1.747121, 0.4745098, 0, 1, 1,
0.7270069, 0.3752832, 1.616013, 0.4823529, 0, 1, 1,
0.7321563, -0.0873895, 2.074604, 0.4862745, 0, 1, 1,
0.7375202, 0.3010364, 1.281164, 0.4941176, 0, 1, 1,
0.7381397, -0.07404029, -0.0936252, 0.5019608, 0, 1, 1,
0.7407164, 0.2068379, 0.7613353, 0.5058824, 0, 1, 1,
0.7426137, -1.354099, 3.058444, 0.5137255, 0, 1, 1,
0.7444866, 0.7915851, 2.279334, 0.5176471, 0, 1, 1,
0.7480714, -0.1887116, 0.563628, 0.5254902, 0, 1, 1,
0.7487041, 0.9658479, 1.681728, 0.5294118, 0, 1, 1,
0.7525184, 0.3362303, 0.05761601, 0.5372549, 0, 1, 1,
0.7553979, 0.2680899, 2.729741, 0.5411765, 0, 1, 1,
0.7556114, 1.652201, 2.057857, 0.5490196, 0, 1, 1,
0.7607689, 1.219287, 0.8712298, 0.5529412, 0, 1, 1,
0.7626721, -1.589079, 2.078403, 0.5607843, 0, 1, 1,
0.7635351, 0.2446022, 1.478468, 0.5647059, 0, 1, 1,
0.7781871, 0.9368398, 2.115914, 0.572549, 0, 1, 1,
0.7797618, -0.9681917, 3.090594, 0.5764706, 0, 1, 1,
0.7806187, 0.8879381, -0.06844284, 0.5843138, 0, 1, 1,
0.7807483, -0.7701319, 2.458114, 0.5882353, 0, 1, 1,
0.7815438, -0.9155925, 3.759791, 0.5960785, 0, 1, 1,
0.7816528, 0.3415625, 0.9302145, 0.6039216, 0, 1, 1,
0.7828667, 1.288228, -0.05769809, 0.6078432, 0, 1, 1,
0.7844544, 0.2104231, 1.829536, 0.6156863, 0, 1, 1,
0.7847459, 0.0342245, 1.413878, 0.6196079, 0, 1, 1,
0.7914606, 0.5155772, 0.08612286, 0.627451, 0, 1, 1,
0.7926514, 0.5975015, 1.124303, 0.6313726, 0, 1, 1,
0.794107, 0.1635002, 2.555644, 0.6392157, 0, 1, 1,
0.7975693, -0.1604012, 0.9848603, 0.6431373, 0, 1, 1,
0.7990804, 0.6832247, 1.80559, 0.6509804, 0, 1, 1,
0.7994671, 1.621809, 0.6627094, 0.654902, 0, 1, 1,
0.800959, -0.7179686, 2.537847, 0.6627451, 0, 1, 1,
0.8013673, 1.011438, 2.553975, 0.6666667, 0, 1, 1,
0.8020267, -0.9134569, 2.083815, 0.6745098, 0, 1, 1,
0.8033729, 0.5928221, 0.8884149, 0.6784314, 0, 1, 1,
0.8053862, -0.220661, 1.714414, 0.6862745, 0, 1, 1,
0.8086612, -1.589089, 3.534559, 0.6901961, 0, 1, 1,
0.8092096, 0.6605282, 2.707985, 0.6980392, 0, 1, 1,
0.8101584, 0.1139917, 2.818146, 0.7058824, 0, 1, 1,
0.8184887, 0.06868353, 3.429193, 0.7098039, 0, 1, 1,
0.8302481, 1.028588, 0.04245749, 0.7176471, 0, 1, 1,
0.831311, 0.8683774, 1.502725, 0.7215686, 0, 1, 1,
0.8315882, 0.4116131, 1.395744, 0.7294118, 0, 1, 1,
0.8432674, 0.9294382, 3.042125, 0.7333333, 0, 1, 1,
0.8438123, 1.387138, 1.7353, 0.7411765, 0, 1, 1,
0.8443323, -0.1832793, -0.06833725, 0.7450981, 0, 1, 1,
0.8466299, -1.819391, 2.161632, 0.7529412, 0, 1, 1,
0.8472189, -1.066795, 2.27447, 0.7568628, 0, 1, 1,
0.8514179, 2.208007, 0.9945195, 0.7647059, 0, 1, 1,
0.8612331, 0.4457538, 1.377204, 0.7686275, 0, 1, 1,
0.8623276, 1.641077, 0.1854545, 0.7764706, 0, 1, 1,
0.8646436, 0.06412775, 2.155468, 0.7803922, 0, 1, 1,
0.8752947, -0.04509716, 0.4150146, 0.7882353, 0, 1, 1,
0.8759797, -0.1484507, -0.3018991, 0.7921569, 0, 1, 1,
0.8787594, 0.992115, 1.521039, 0.8, 0, 1, 1,
0.8823532, -0.4712249, 0.7852043, 0.8078431, 0, 1, 1,
0.8860957, -0.03250303, 2.69594, 0.8117647, 0, 1, 1,
0.887953, -0.08514259, 1.32529, 0.8196079, 0, 1, 1,
0.9022117, -1.647829, 1.608897, 0.8235294, 0, 1, 1,
0.9073142, -0.616956, 2.280566, 0.8313726, 0, 1, 1,
0.9143848, 1.001998, 0.2425577, 0.8352941, 0, 1, 1,
0.9190133, 0.08707735, 1.240731, 0.8431373, 0, 1, 1,
0.9206173, -0.3447946, 0.545001, 0.8470588, 0, 1, 1,
0.9222573, -1.38978, 1.749754, 0.854902, 0, 1, 1,
0.9231212, 0.6787671, 1.069901, 0.8588235, 0, 1, 1,
0.9307469, -0.3234628, 1.915494, 0.8666667, 0, 1, 1,
0.9315861, -0.8552224, 1.667602, 0.8705882, 0, 1, 1,
0.9324759, -0.7887393, 1.084857, 0.8784314, 0, 1, 1,
0.9362579, 0.8171933, 1.898707, 0.8823529, 0, 1, 1,
0.9371643, -1.125536, 2.822363, 0.8901961, 0, 1, 1,
0.9401239, 1.036587, -0.1647875, 0.8941177, 0, 1, 1,
0.9431735, 0.3757014, 0.410357, 0.9019608, 0, 1, 1,
0.9435381, 0.9470217, 0.6157249, 0.9098039, 0, 1, 1,
0.9452369, -1.027364, 2.61494, 0.9137255, 0, 1, 1,
0.9465029, -0.3430115, 1.371502, 0.9215686, 0, 1, 1,
0.9488128, 1.441684, -0.1272441, 0.9254902, 0, 1, 1,
0.9523591, -1.013418, 1.295137, 0.9333333, 0, 1, 1,
0.953375, 1.27253, -0.8644031, 0.9372549, 0, 1, 1,
0.9557433, 1.176416, -1.003904, 0.945098, 0, 1, 1,
0.9569204, -1.176408, 0.6361234, 0.9490196, 0, 1, 1,
0.9592174, -0.4164796, 3.085286, 0.9568627, 0, 1, 1,
0.9730076, -1.098327, 1.973223, 0.9607843, 0, 1, 1,
0.97333, 0.005988144, 1.453626, 0.9686275, 0, 1, 1,
0.9741278, -0.4887035, -0.03119379, 0.972549, 0, 1, 1,
0.9748377, 0.793573, 1.738673, 0.9803922, 0, 1, 1,
0.9825845, 0.6630943, 1.062234, 0.9843137, 0, 1, 1,
0.9847268, 0.2545312, 2.289244, 0.9921569, 0, 1, 1,
0.986192, 1.645419, -0.9055651, 0.9960784, 0, 1, 1,
0.9917916, -0.8862303, 1.091946, 1, 0, 0.9960784, 1,
0.9923005, -1.613663, 2.486035, 1, 0, 0.9882353, 1,
0.9975272, -0.2481859, 1.702093, 1, 0, 0.9843137, 1,
0.9988599, 0.213171, 1.778785, 1, 0, 0.9764706, 1,
1.001279, -1.091778, 3.743071, 1, 0, 0.972549, 1,
1.008469, -0.1998688, 2.661638, 1, 0, 0.9647059, 1,
1.01504, -0.9908225, 2.466, 1, 0, 0.9607843, 1,
1.015787, 1.14953, 0.04520907, 1, 0, 0.9529412, 1,
1.01771, -0.373682, 2.304024, 1, 0, 0.9490196, 1,
1.021318, -1.120019, 1.984555, 1, 0, 0.9411765, 1,
1.026073, 0.9484461, 0.9456829, 1, 0, 0.9372549, 1,
1.028893, -1.219102, 0.2862978, 1, 0, 0.9294118, 1,
1.029537, 0.3706402, 1.505938, 1, 0, 0.9254902, 1,
1.033683, -0.2732824, 0.1041361, 1, 0, 0.9176471, 1,
1.04234, 0.3228308, 0.4303315, 1, 0, 0.9137255, 1,
1.049084, 1.288553, 3.133039, 1, 0, 0.9058824, 1,
1.050557, -0.5649022, 2.103635, 1, 0, 0.9019608, 1,
1.062572, 0.8283821, 2.035807, 1, 0, 0.8941177, 1,
1.063874, -0.776763, 3.440592, 1, 0, 0.8862745, 1,
1.082079, 1.389529, 1.820826, 1, 0, 0.8823529, 1,
1.09428, 0.1312621, 2.410469, 1, 0, 0.8745098, 1,
1.096925, 0.3465462, 2.338364, 1, 0, 0.8705882, 1,
1.09802, -0.2371518, 0.1835363, 1, 0, 0.8627451, 1,
1.102215, -0.3645927, 2.574936, 1, 0, 0.8588235, 1,
1.112749, 0.2309077, 1.091581, 1, 0, 0.8509804, 1,
1.118629, 0.683193, 0.5938514, 1, 0, 0.8470588, 1,
1.119461, 0.002235103, 1.366445, 1, 0, 0.8392157, 1,
1.130854, 0.6137007, -1.908506, 1, 0, 0.8352941, 1,
1.131479, 0.4987302, 0.8484749, 1, 0, 0.827451, 1,
1.139096, -0.2230641, -0.4664008, 1, 0, 0.8235294, 1,
1.140012, -0.5672053, 2.422055, 1, 0, 0.8156863, 1,
1.144625, 0.5489752, 1.546853, 1, 0, 0.8117647, 1,
1.149698, 0.1636409, 1.39479, 1, 0, 0.8039216, 1,
1.149948, -0.1036281, 3.399729, 1, 0, 0.7960784, 1,
1.156365, 1.115692, 0.4785807, 1, 0, 0.7921569, 1,
1.157595, 2.778411, 0.447018, 1, 0, 0.7843137, 1,
1.162032, 0.6251023, -0.5673874, 1, 0, 0.7803922, 1,
1.166655, -0.5436035, 2.514246, 1, 0, 0.772549, 1,
1.169845, -0.3128869, 2.19204, 1, 0, 0.7686275, 1,
1.175276, 2.884873, 0.4822448, 1, 0, 0.7607843, 1,
1.17554, -1.101406, 4.250397, 1, 0, 0.7568628, 1,
1.189278, -0.09272747, 2.00212, 1, 0, 0.7490196, 1,
1.194341, -0.1374031, 2.664696, 1, 0, 0.7450981, 1,
1.196205, -0.6473442, 0.7754111, 1, 0, 0.7372549, 1,
1.196766, 0.3796954, 0.4478736, 1, 0, 0.7333333, 1,
1.210456, -0.08604465, 0.5802504, 1, 0, 0.7254902, 1,
1.213448, -0.004518184, 3.444613, 1, 0, 0.7215686, 1,
1.218547, 0.2283975, 0.5424381, 1, 0, 0.7137255, 1,
1.232383, 0.6238768, 1.373023, 1, 0, 0.7098039, 1,
1.24734, -1.516586, 2.342547, 1, 0, 0.7019608, 1,
1.256395, 0.5624407, 1.90043, 1, 0, 0.6941177, 1,
1.262141, 1.255071, 1.889432, 1, 0, 0.6901961, 1,
1.264028, -0.2420048, 1.03668, 1, 0, 0.682353, 1,
1.264264, -0.3092022, 0.86175, 1, 0, 0.6784314, 1,
1.265482, -0.4348091, 2.968987, 1, 0, 0.6705883, 1,
1.266489, -1.003386, 1.407057, 1, 0, 0.6666667, 1,
1.266754, -0.1133729, 3.529587, 1, 0, 0.6588235, 1,
1.268703, -1.819577, 3.02042, 1, 0, 0.654902, 1,
1.271126, -0.7007356, 2.206453, 1, 0, 0.6470588, 1,
1.272226, 1.11845, 0.002630554, 1, 0, 0.6431373, 1,
1.272479, 0.5856016, 0.3595314, 1, 0, 0.6352941, 1,
1.272719, -0.3120016, 1.963293, 1, 0, 0.6313726, 1,
1.286531, -1.194265, 1.476972, 1, 0, 0.6235294, 1,
1.286616, 1.993852, -0.1984145, 1, 0, 0.6196079, 1,
1.289288, -0.3036519, 1.78964, 1, 0, 0.6117647, 1,
1.298656, 0.3482869, 2.197268, 1, 0, 0.6078432, 1,
1.314705, -0.3634374, 1.627102, 1, 0, 0.6, 1,
1.316167, -1.197351, 0.9981015, 1, 0, 0.5921569, 1,
1.323227, 1.507606, 0.1752314, 1, 0, 0.5882353, 1,
1.341202, -1.177105, 4.268339, 1, 0, 0.5803922, 1,
1.346422, -1.059065, 3.460074, 1, 0, 0.5764706, 1,
1.354945, 0.6677085, 2.019624, 1, 0, 0.5686275, 1,
1.356139, 0.3757491, 3.004355, 1, 0, 0.5647059, 1,
1.363241, -0.3381114, 0.65884, 1, 0, 0.5568628, 1,
1.367373, -1.667952, 1.988624, 1, 0, 0.5529412, 1,
1.368326, -1.5697, 2.8309, 1, 0, 0.5450981, 1,
1.373735, -0.1101158, 1.134457, 1, 0, 0.5411765, 1,
1.37643, 0.5553114, 0.4711393, 1, 0, 0.5333334, 1,
1.38077, 1.080312, 1.504159, 1, 0, 0.5294118, 1,
1.381003, -1.506698, 2.034564, 1, 0, 0.5215687, 1,
1.392991, 0.1665903, 2.000787, 1, 0, 0.5176471, 1,
1.39804, -1.581005, 2.233706, 1, 0, 0.509804, 1,
1.410705, 0.4223394, 0.8981033, 1, 0, 0.5058824, 1,
1.414695, 1.260999, -0.7249237, 1, 0, 0.4980392, 1,
1.415664, -1.080353, 2.930904, 1, 0, 0.4901961, 1,
1.420697, -0.4974782, 2.296395, 1, 0, 0.4862745, 1,
1.421702, 1.516018, 1.311141, 1, 0, 0.4784314, 1,
1.423955, 0.3934308, 0.9736831, 1, 0, 0.4745098, 1,
1.438433, 0.7485712, 2.415816, 1, 0, 0.4666667, 1,
1.442958, -1.20605, 2.380802, 1, 0, 0.4627451, 1,
1.446261, -1.645806, 4.75978, 1, 0, 0.454902, 1,
1.455402, 0.8046023, 2.349289, 1, 0, 0.4509804, 1,
1.458628, 1.513016, 1.488798, 1, 0, 0.4431373, 1,
1.460232, -0.05238752, 0.7177904, 1, 0, 0.4392157, 1,
1.473089, 0.04188943, 2.358896, 1, 0, 0.4313726, 1,
1.480982, -0.3905644, 0.2518734, 1, 0, 0.427451, 1,
1.508577, 1.999054, 1.223049, 1, 0, 0.4196078, 1,
1.509764, 0.6194555, 0.3903708, 1, 0, 0.4156863, 1,
1.511547, -1.013936, 0.807632, 1, 0, 0.4078431, 1,
1.52355, -0.4172929, 1.381792, 1, 0, 0.4039216, 1,
1.529508, -0.7865124, 2.866448, 1, 0, 0.3960784, 1,
1.533184, -0.4758507, 1.418055, 1, 0, 0.3882353, 1,
1.542887, -1.234153, 2.477431, 1, 0, 0.3843137, 1,
1.547803, 0.5583495, 0.3708979, 1, 0, 0.3764706, 1,
1.56202, -0.3868525, 0.07714949, 1, 0, 0.372549, 1,
1.572625, 1.904577, 0.974652, 1, 0, 0.3647059, 1,
1.578119, 1.507737, 0.1650964, 1, 0, 0.3607843, 1,
1.582792, -0.5750406, 1.328633, 1, 0, 0.3529412, 1,
1.607557, 0.5951858, 1.585568, 1, 0, 0.3490196, 1,
1.614695, -0.8584369, 0.9578464, 1, 0, 0.3411765, 1,
1.620867, 1.719441, 0.5948616, 1, 0, 0.3372549, 1,
1.684494, -0.1978953, 0.3922225, 1, 0, 0.3294118, 1,
1.684619, 0.7640597, 0.248216, 1, 0, 0.3254902, 1,
1.692875, -0.331564, 2.259248, 1, 0, 0.3176471, 1,
1.695185, -1.870119, 2.156255, 1, 0, 0.3137255, 1,
1.702935, -0.4857383, 2.790357, 1, 0, 0.3058824, 1,
1.703456, -0.8340746, 1.923204, 1, 0, 0.2980392, 1,
1.713958, 0.3908935, 0.8053392, 1, 0, 0.2941177, 1,
1.726755, -1.686036, 3.114263, 1, 0, 0.2862745, 1,
1.736665, 0.3555433, 1.463247, 1, 0, 0.282353, 1,
1.737413, -0.1668163, 2.503785, 1, 0, 0.2745098, 1,
1.74636, 1.275388, 2.512394, 1, 0, 0.2705882, 1,
1.784834, -0.02250902, 2.226253, 1, 0, 0.2627451, 1,
1.811983, 0.2989808, 1.288822, 1, 0, 0.2588235, 1,
1.814106, -1.462149, 2.505824, 1, 0, 0.2509804, 1,
1.814885, -2.024809, 2.719381, 1, 0, 0.2470588, 1,
1.845128, 0.5659577, 0.4163326, 1, 0, 0.2392157, 1,
1.855417, 1.232223, 4.020983, 1, 0, 0.2352941, 1,
1.864208, 1.171589, 0.1625854, 1, 0, 0.227451, 1,
1.874128, -0.5987179, 2.161833, 1, 0, 0.2235294, 1,
1.88976, -0.5318144, 3.756495, 1, 0, 0.2156863, 1,
1.893061, -0.1275768, 1.524957, 1, 0, 0.2117647, 1,
1.905958, -1.166851, 2.354823, 1, 0, 0.2039216, 1,
1.914511, 0.3815469, -0.3251204, 1, 0, 0.1960784, 1,
1.915648, 1.545835, 2.598293, 1, 0, 0.1921569, 1,
1.93585, 0.436303, 1.933668, 1, 0, 0.1843137, 1,
1.941984, 1.004409, 1.654697, 1, 0, 0.1803922, 1,
1.956895, -0.5864376, 2.597342, 1, 0, 0.172549, 1,
1.960317, -0.8108419, 1.272725, 1, 0, 0.1686275, 1,
1.961298, -0.9579961, 2.5894, 1, 0, 0.1607843, 1,
1.966044, 0.2534904, 1.089424, 1, 0, 0.1568628, 1,
1.967776, 0.608752, 1.522834, 1, 0, 0.1490196, 1,
1.982678, 0.4007417, 2.386312, 1, 0, 0.145098, 1,
2.002375, -0.8080574, 2.739501, 1, 0, 0.1372549, 1,
2.028044, -0.2875573, 3.438307, 1, 0, 0.1333333, 1,
2.032759, 1.34562, 2.687249, 1, 0, 0.1254902, 1,
2.035934, -0.7507088, 1.566297, 1, 0, 0.1215686, 1,
2.044551, -0.3731996, 1.780218, 1, 0, 0.1137255, 1,
2.0878, 0.2906564, 0.7723619, 1, 0, 0.1098039, 1,
2.131575, -0.7614793, 1.875444, 1, 0, 0.1019608, 1,
2.135706, 0.2922676, 2.352371, 1, 0, 0.09411765, 1,
2.161771, -0.6076371, 1.927513, 1, 0, 0.09019608, 1,
2.16276, -0.5927615, 2.537194, 1, 0, 0.08235294, 1,
2.210464, -0.5119481, -0.4929287, 1, 0, 0.07843138, 1,
2.212335, -1.132253, 5.060851, 1, 0, 0.07058824, 1,
2.219935, 0.9469775, 1.679512, 1, 0, 0.06666667, 1,
2.24358, 1.176082, 1.359968, 1, 0, 0.05882353, 1,
2.290272, 0.7578686, 1.720576, 1, 0, 0.05490196, 1,
2.35691, -0.4754277, 2.55965, 1, 0, 0.04705882, 1,
2.43618, -0.973282, 4.077079, 1, 0, 0.04313726, 1,
2.586398, -0.6057137, 0.906204, 1, 0, 0.03529412, 1,
2.666011, -0.06231032, 1.520752, 1, 0, 0.03137255, 1,
2.853064, 1.092924, 2.143744, 1, 0, 0.02352941, 1,
2.992428, -0.04608125, 1.182855, 1, 0, 0.01960784, 1,
3.096265, -0.2724141, 1.913403, 1, 0, 0.01176471, 1,
3.207448, 0.9322208, 0.7613033, 1, 0, 0.007843138, 1
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
-0.007951617, -4.235393, -6.564547, 0, -0.5, 0.5, 0.5,
-0.007951617, -4.235393, -6.564547, 1, -0.5, 0.5, 0.5,
-0.007951617, -4.235393, -6.564547, 1, 1.5, 0.5, 0.5,
-0.007951617, -4.235393, -6.564547, 0, 1.5, 0.5, 0.5
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
-4.313372, -0.1308771, -6.564547, 0, -0.5, 0.5, 0.5,
-4.313372, -0.1308771, -6.564547, 1, -0.5, 0.5, 0.5,
-4.313372, -0.1308771, -6.564547, 1, 1.5, 0.5, 0.5,
-4.313372, -0.1308771, -6.564547, 0, 1.5, 0.5, 0.5
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
-4.313372, -4.235393, 0.09060836, 0, -0.5, 0.5, 0.5,
-4.313372, -4.235393, 0.09060836, 1, -0.5, 0.5, 0.5,
-4.313372, -4.235393, 0.09060836, 1, 1.5, 0.5, 0.5,
-4.313372, -4.235393, 0.09060836, 0, 1.5, 0.5, 0.5
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
-3, -3.288197, -5.028742,
3, -3.288197, -5.028742,
-3, -3.288197, -5.028742,
-3, -3.446063, -5.284709,
-2, -3.288197, -5.028742,
-2, -3.446063, -5.284709,
-1, -3.288197, -5.028742,
-1, -3.446063, -5.284709,
0, -3.288197, -5.028742,
0, -3.446063, -5.284709,
1, -3.288197, -5.028742,
1, -3.446063, -5.284709,
2, -3.288197, -5.028742,
2, -3.446063, -5.284709,
3, -3.288197, -5.028742,
3, -3.446063, -5.284709
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
-3, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
-3, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
-3, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
-3, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
-2, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
-2, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
-2, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
-2, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
-1, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
-1, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
-1, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
-1, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
0, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
0, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
0, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
0, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
1, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
1, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
1, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
1, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
2, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
2, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
2, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
2, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5,
3, -3.761795, -5.796644, 0, -0.5, 0.5, 0.5,
3, -3.761795, -5.796644, 1, -0.5, 0.5, 0.5,
3, -3.761795, -5.796644, 1, 1.5, 0.5, 0.5,
3, -3.761795, -5.796644, 0, 1.5, 0.5, 0.5
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
-3.319813, -3, -5.028742,
-3.319813, 2, -5.028742,
-3.319813, -3, -5.028742,
-3.485407, -3, -5.284709,
-3.319813, -2, -5.028742,
-3.485407, -2, -5.284709,
-3.319813, -1, -5.028742,
-3.485407, -1, -5.284709,
-3.319813, 0, -5.028742,
-3.485407, 0, -5.284709,
-3.319813, 1, -5.028742,
-3.485407, 1, -5.284709,
-3.319813, 2, -5.028742,
-3.485407, 2, -5.284709
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
-3.816593, -3, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, -3, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, -3, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, -3, -5.796644, 0, 1.5, 0.5, 0.5,
-3.816593, -2, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, -2, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, -2, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, -2, -5.796644, 0, 1.5, 0.5, 0.5,
-3.816593, -1, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, -1, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, -1, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, -1, -5.796644, 0, 1.5, 0.5, 0.5,
-3.816593, 0, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, 0, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, 0, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, 0, -5.796644, 0, 1.5, 0.5, 0.5,
-3.816593, 1, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, 1, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, 1, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, 1, -5.796644, 0, 1.5, 0.5, 0.5,
-3.816593, 2, -5.796644, 0, -0.5, 0.5, 0.5,
-3.816593, 2, -5.796644, 1, -0.5, 0.5, 0.5,
-3.816593, 2, -5.796644, 1, 1.5, 0.5, 0.5,
-3.816593, 2, -5.796644, 0, 1.5, 0.5, 0.5
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
-3.319813, -3.288197, -4,
-3.319813, -3.288197, 4,
-3.319813, -3.288197, -4,
-3.485407, -3.446063, -4,
-3.319813, -3.288197, -2,
-3.485407, -3.446063, -2,
-3.319813, -3.288197, 0,
-3.485407, -3.446063, 0,
-3.319813, -3.288197, 2,
-3.485407, -3.446063, 2,
-3.319813, -3.288197, 4,
-3.485407, -3.446063, 4
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
-3.816593, -3.761795, -4, 0, -0.5, 0.5, 0.5,
-3.816593, -3.761795, -4, 1, -0.5, 0.5, 0.5,
-3.816593, -3.761795, -4, 1, 1.5, 0.5, 0.5,
-3.816593, -3.761795, -4, 0, 1.5, 0.5, 0.5,
-3.816593, -3.761795, -2, 0, -0.5, 0.5, 0.5,
-3.816593, -3.761795, -2, 1, -0.5, 0.5, 0.5,
-3.816593, -3.761795, -2, 1, 1.5, 0.5, 0.5,
-3.816593, -3.761795, -2, 0, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 0, 0, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 0, 1, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 0, 1, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 0, 0, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 2, 0, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 2, 1, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 2, 1, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 2, 0, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 4, 0, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 4, 1, -0.5, 0.5, 0.5,
-3.816593, -3.761795, 4, 1, 1.5, 0.5, 0.5,
-3.816593, -3.761795, 4, 0, 1.5, 0.5, 0.5
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
-3.319813, -3.288197, -5.028742,
-3.319813, 3.026443, -5.028742,
-3.319813, -3.288197, 5.209959,
-3.319813, 3.026443, 5.209959,
-3.319813, -3.288197, -5.028742,
-3.319813, -3.288197, 5.209959,
-3.319813, 3.026443, -5.028742,
-3.319813, 3.026443, 5.209959,
-3.319813, -3.288197, -5.028742,
3.30391, -3.288197, -5.028742,
-3.319813, -3.288197, 5.209959,
3.30391, -3.288197, 5.209959,
-3.319813, 3.026443, -5.028742,
3.30391, 3.026443, -5.028742,
-3.319813, 3.026443, 5.209959,
3.30391, 3.026443, 5.209959,
3.30391, -3.288197, -5.028742,
3.30391, 3.026443, -5.028742,
3.30391, -3.288197, 5.209959,
3.30391, 3.026443, 5.209959,
3.30391, -3.288197, -5.028742,
3.30391, -3.288197, 5.209959,
3.30391, 3.026443, -5.028742,
3.30391, 3.026443, 5.209959
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
var radius = 7.332846;
var distance = 32.62466;
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
mvMatrix.translate( 0.007951617, 0.1308771, -0.09060836 );
mvMatrix.scale( 1.196973, 1.255561, 0.7743577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.62466);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Phenmedipham<-read.table("Phenmedipham.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenmedipham$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
```

```r
y<-Phenmedipham$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
```

```r
z<-Phenmedipham$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
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
-3.223351, 0.4909253, -1.093195, 0, 0, 1, 1, 1,
-2.971665, 0.5265439, 1.649519, 1, 0, 0, 1, 1,
-2.754881, -2.037875, -2.056448, 1, 0, 0, 1, 1,
-2.540965, -0.04280755, -0.824024, 1, 0, 0, 1, 1,
-2.507335, -0.498906, -0.6774309, 1, 0, 0, 1, 1,
-2.490669, 0.3108367, 0.002265897, 1, 0, 0, 1, 1,
-2.39119, 0.1196167, -0.4862616, 0, 0, 0, 1, 1,
-2.334678, 0.6075476, -0.3342411, 0, 0, 0, 1, 1,
-2.260219, -0.4291705, -1.067705, 0, 0, 0, 1, 1,
-2.237373, 0.4009138, -0.3506398, 0, 0, 0, 1, 1,
-2.204541, -0.4879166, -3.087358, 0, 0, 0, 1, 1,
-2.178687, 1.014476, -1.888532, 0, 0, 0, 1, 1,
-2.131541, 1.493972, -1.662989, 0, 0, 0, 1, 1,
-2.069948, 0.907906, -0.9628789, 1, 1, 1, 1, 1,
-2.031838, -0.1593821, 0.03532425, 1, 1, 1, 1, 1,
-2.00783, 0.03115588, -3.241365, 1, 1, 1, 1, 1,
-1.970263, 1.181163, 1.021898, 1, 1, 1, 1, 1,
-1.94345, -1.518635, -2.163638, 1, 1, 1, 1, 1,
-1.940881, -1.645594, -2.310913, 1, 1, 1, 1, 1,
-1.937435, -0.5074567, -2.383982, 1, 1, 1, 1, 1,
-1.925979, -1.00837, -2.901082, 1, 1, 1, 1, 1,
-1.918159, 1.5378, 1.359967, 1, 1, 1, 1, 1,
-1.909817, 0.7513536, -2.075111, 1, 1, 1, 1, 1,
-1.900031, 0.9024806, 0.2292996, 1, 1, 1, 1, 1,
-1.832513, -0.08693852, 0.1465352, 1, 1, 1, 1, 1,
-1.790409, -0.01510619, -1.692315, 1, 1, 1, 1, 1,
-1.771629, -0.498274, -2.454648, 1, 1, 1, 1, 1,
-1.768283, -2.339543, -3.640885, 1, 1, 1, 1, 1,
-1.762567, 1.785172, -2.219116, 0, 0, 1, 1, 1,
-1.751789, 0.2395253, -3.8684, 1, 0, 0, 1, 1,
-1.74888, 0.1884725, -1.653859, 1, 0, 0, 1, 1,
-1.722642, -1.509218, -3.810673, 1, 0, 0, 1, 1,
-1.702446, 1.026318, -0.2855952, 1, 0, 0, 1, 1,
-1.691961, -0.7660154, -0.771844, 1, 0, 0, 1, 1,
-1.681504, 1.126934, 0.336718, 0, 0, 0, 1, 1,
-1.680676, -1.731295, -2.58896, 0, 0, 0, 1, 1,
-1.665392, -0.3864226, -1.657815, 0, 0, 0, 1, 1,
-1.659603, -1.157268, -0.8460145, 0, 0, 0, 1, 1,
-1.656384, 0.1792229, -2.807483, 0, 0, 0, 1, 1,
-1.655445, 1.64956, -1.921292, 0, 0, 0, 1, 1,
-1.654354, -1.439795, -2.786361, 0, 0, 0, 1, 1,
-1.646608, -1.077704, -1.886829, 1, 1, 1, 1, 1,
-1.641953, -1.824715, -1.866377, 1, 1, 1, 1, 1,
-1.636249, 0.765086, -1.091322, 1, 1, 1, 1, 1,
-1.620479, -0.3966744, -1.454185, 1, 1, 1, 1, 1,
-1.615527, 1.863775, -0.5340339, 1, 1, 1, 1, 1,
-1.612067, 1.476336, -1.183445, 1, 1, 1, 1, 1,
-1.604887, -1.831766, -1.384055, 1, 1, 1, 1, 1,
-1.599049, 1.552799, -1.481749, 1, 1, 1, 1, 1,
-1.585079, 0.6098862, -2.334425, 1, 1, 1, 1, 1,
-1.579057, -1.403042, -0.8843274, 1, 1, 1, 1, 1,
-1.565954, -0.2716587, -1.585227, 1, 1, 1, 1, 1,
-1.565942, -0.8830031, -3.125587, 1, 1, 1, 1, 1,
-1.56366, 0.4108071, -3.487159, 1, 1, 1, 1, 1,
-1.558453, 0.9638775, -1.281462, 1, 1, 1, 1, 1,
-1.558043, 2.02763, -2.332273, 1, 1, 1, 1, 1,
-1.556652, 0.08817251, -2.891107, 0, 0, 1, 1, 1,
-1.553232, -0.6957166, -1.913937, 1, 0, 0, 1, 1,
-1.550468, -1.101787, -2.151475, 1, 0, 0, 1, 1,
-1.541351, -1.512057, -3.199356, 1, 0, 0, 1, 1,
-1.537971, -1.563236, -0.7485754, 1, 0, 0, 1, 1,
-1.534329, -0.4777092, -1.874963, 1, 0, 0, 1, 1,
-1.49505, -2.92488, -2.365432, 0, 0, 0, 1, 1,
-1.489018, 1.290978, -0.4233737, 0, 0, 0, 1, 1,
-1.480813, -0.3346442, 0.03729161, 0, 0, 0, 1, 1,
-1.480375, -1.058051, -2.292768, 0, 0, 0, 1, 1,
-1.455942, 0.9269471, -1.540582, 0, 0, 0, 1, 1,
-1.447059, 0.3972929, -2.761026, 0, 0, 0, 1, 1,
-1.446825, 0.7557949, -0.7995568, 0, 0, 0, 1, 1,
-1.439145, -0.6907653, -1.378176, 1, 1, 1, 1, 1,
-1.434237, -0.3597955, -2.61182, 1, 1, 1, 1, 1,
-1.430443, -0.07672788, -3.010242, 1, 1, 1, 1, 1,
-1.430113, -0.1216513, -0.7431707, 1, 1, 1, 1, 1,
-1.405799, 1.175142, 0.2158554, 1, 1, 1, 1, 1,
-1.403098, 0.1152549, -1.0864, 1, 1, 1, 1, 1,
-1.378854, -0.717346, -3.09385, 1, 1, 1, 1, 1,
-1.37785, 0.2771356, -2.282176, 1, 1, 1, 1, 1,
-1.372736, 0.7706729, -2.045983, 1, 1, 1, 1, 1,
-1.369294, -0.4846631, -3.936345, 1, 1, 1, 1, 1,
-1.354767, 0.1441167, -2.307391, 1, 1, 1, 1, 1,
-1.349921, 0.1274223, -1.105545, 1, 1, 1, 1, 1,
-1.330943, -1.05036, -1.468751, 1, 1, 1, 1, 1,
-1.312575, 0.2018029, -0.8030666, 1, 1, 1, 1, 1,
-1.304334, -0.4876916, -3.064056, 1, 1, 1, 1, 1,
-1.302806, -0.3675092, -2.365625, 0, 0, 1, 1, 1,
-1.301871, -0.6472469, -3.089407, 1, 0, 0, 1, 1,
-1.293019, -1.909818, -0.500301, 1, 0, 0, 1, 1,
-1.281507, 0.7425638, -2.641863, 1, 0, 0, 1, 1,
-1.281111, -2.104723, -0.9988156, 1, 0, 0, 1, 1,
-1.262127, -2.235922, -2.447458, 1, 0, 0, 1, 1,
-1.260936, 0.6636974, -2.712916, 0, 0, 0, 1, 1,
-1.252723, 1.026472, -0.2957306, 0, 0, 0, 1, 1,
-1.236251, 0.007292311, -2.165883, 0, 0, 0, 1, 1,
-1.224019, 2.934482, 0.9347951, 0, 0, 0, 1, 1,
-1.213387, 0.5412546, -0.7109506, 0, 0, 0, 1, 1,
-1.192419, 0.5584314, -1.390495, 0, 0, 0, 1, 1,
-1.18749, 0.4597557, -0.1392311, 0, 0, 0, 1, 1,
-1.181764, -0.1585395, -1.341061, 1, 1, 1, 1, 1,
-1.180793, 0.829662, -0.997154, 1, 1, 1, 1, 1,
-1.17817, 1.47263, -0.6885343, 1, 1, 1, 1, 1,
-1.174484, -0.4482062, -0.7912496, 1, 1, 1, 1, 1,
-1.174106, 1.680297, 0.622139, 1, 1, 1, 1, 1,
-1.171251, -0.4502366, -0.3354919, 1, 1, 1, 1, 1,
-1.170005, 0.7590082, 0.4353707, 1, 1, 1, 1, 1,
-1.169562, -0.3900507, -1.794535, 1, 1, 1, 1, 1,
-1.168429, 0.9833402, 0.1972782, 1, 1, 1, 1, 1,
-1.164561, 0.2635768, -0.4486181, 1, 1, 1, 1, 1,
-1.159136, 1.046679, -2.146891, 1, 1, 1, 1, 1,
-1.157476, 1.001923, -1.967906, 1, 1, 1, 1, 1,
-1.147401, -0.4930899, -0.6308216, 1, 1, 1, 1, 1,
-1.144558, 0.198014, -0.1284716, 1, 1, 1, 1, 1,
-1.143992, 0.907654, 0.009306799, 1, 1, 1, 1, 1,
-1.142276, -0.00979348, -2.002002, 0, 0, 1, 1, 1,
-1.138037, -0.9289876, -2.913155, 1, 0, 0, 1, 1,
-1.13591, 0.4190832, -1.419218, 1, 0, 0, 1, 1,
-1.134945, 1.020756, 0.3184071, 1, 0, 0, 1, 1,
-1.133881, 0.3122051, -0.1088039, 1, 0, 0, 1, 1,
-1.131927, -1.914389, -2.425114, 1, 0, 0, 1, 1,
-1.129556, 0.1707745, -1.403062, 0, 0, 0, 1, 1,
-1.128496, -0.4634612, -3.235554, 0, 0, 0, 1, 1,
-1.126554, 0.8780885, -0.2940415, 0, 0, 0, 1, 1,
-1.125656, -0.4446248, -1.768947, 0, 0, 0, 1, 1,
-1.124063, -0.04204044, -0.6609848, 0, 0, 0, 1, 1,
-1.12131, -0.3648901, -1.798309, 0, 0, 0, 1, 1,
-1.119995, 1.839377, -1.070049, 0, 0, 0, 1, 1,
-1.114254, -1.06811, -2.926944, 1, 1, 1, 1, 1,
-1.111599, 2.194294, -0.8967736, 1, 1, 1, 1, 1,
-1.110294, -2.341547, -4.08968, 1, 1, 1, 1, 1,
-1.109416, 1.129076, -1.467473, 1, 1, 1, 1, 1,
-1.104552, 0.5314926, -1.505633, 1, 1, 1, 1, 1,
-1.10236, 1.557758, -0.9006371, 1, 1, 1, 1, 1,
-1.09864, -0.8509904, -2.559133, 1, 1, 1, 1, 1,
-1.093482, 0.2408845, 0.08034743, 1, 1, 1, 1, 1,
-1.093306, -1.650805, -3.851083, 1, 1, 1, 1, 1,
-1.083277, -0.0322918, -2.526024, 1, 1, 1, 1, 1,
-1.082, 0.9432083, -0.8734528, 1, 1, 1, 1, 1,
-1.081069, -0.695437, -0.7760189, 1, 1, 1, 1, 1,
-1.080966, -0.8067271, -3.323081, 1, 1, 1, 1, 1,
-1.063888, -0.4947302, -2.54933, 1, 1, 1, 1, 1,
-1.06247, -0.3271669, -1.447343, 1, 1, 1, 1, 1,
-1.060756, -1.068869, -2.40101, 0, 0, 1, 1, 1,
-1.054731, 0.7601818, -1.72416, 1, 0, 0, 1, 1,
-1.052843, 0.4300604, -1.567377, 1, 0, 0, 1, 1,
-1.038023, 1.484667, 0.5297215, 1, 0, 0, 1, 1,
-1.033185, -1.851403, -2.659635, 1, 0, 0, 1, 1,
-1.032587, -0.6015787, -0.4516633, 1, 0, 0, 1, 1,
-1.028204, -0.820103, -1.544986, 0, 0, 0, 1, 1,
-1.027791, 2.141064, 0.6776304, 0, 0, 0, 1, 1,
-1.026297, -0.01359445, -2.267647, 0, 0, 0, 1, 1,
-1.023681, -0.9297417, -2.679752, 0, 0, 0, 1, 1,
-1.022406, -0.6257495, -2.54718, 0, 0, 0, 1, 1,
-1.017395, 1.067207, -0.6015372, 0, 0, 0, 1, 1,
-1.016381, 1.142628, -0.5275413, 0, 0, 0, 1, 1,
-1.005638, -0.3134894, -0.8960848, 1, 1, 1, 1, 1,
-1.004844, 1.577464, 0.9457647, 1, 1, 1, 1, 1,
-0.9967126, 0.0210255, -0.8215488, 1, 1, 1, 1, 1,
-0.995334, 0.8697015, -1.218585, 1, 1, 1, 1, 1,
-0.9944553, -0.739068, -3.616687, 1, 1, 1, 1, 1,
-0.9873151, 0.3462052, -0.7933912, 1, 1, 1, 1, 1,
-0.9853966, -1.347645, -2.099952, 1, 1, 1, 1, 1,
-0.9812002, -1.696941, -1.51848, 1, 1, 1, 1, 1,
-0.9803043, -0.1363132, -2.893546, 1, 1, 1, 1, 1,
-0.9783148, 2.308178, 0.9529761, 1, 1, 1, 1, 1,
-0.9720819, 0.1073248, -1.045454, 1, 1, 1, 1, 1,
-0.9531546, -1.468424, -4.102378, 1, 1, 1, 1, 1,
-0.9529825, 0.6114894, 0.328412, 1, 1, 1, 1, 1,
-0.9518157, 0.5569994, -0.1588439, 1, 1, 1, 1, 1,
-0.943436, -0.4698728, -4.138961, 1, 1, 1, 1, 1,
-0.9380664, 0.4364826, -0.8317704, 0, 0, 1, 1, 1,
-0.9323727, 0.6598306, -1.286874, 1, 0, 0, 1, 1,
-0.9310243, 0.2459841, -2.124871, 1, 0, 0, 1, 1,
-0.9299645, 0.9537972, -1.330509, 1, 0, 0, 1, 1,
-0.9279258, -0.1052947, -2.500466, 1, 0, 0, 1, 1,
-0.9226603, 1.579806, 0.3218825, 1, 0, 0, 1, 1,
-0.90412, -0.516948, -0.8135392, 0, 0, 0, 1, 1,
-0.903925, -0.8391547, -3.261929, 0, 0, 0, 1, 1,
-0.8985627, 0.6047021, -0.8330268, 0, 0, 0, 1, 1,
-0.8984007, -0.8548242, -2.773726, 0, 0, 0, 1, 1,
-0.8972951, 0.4880942, -1.041418, 0, 0, 0, 1, 1,
-0.8969659, -0.8778802, -2.718715, 0, 0, 0, 1, 1,
-0.8945589, -0.2304932, -2.392607, 0, 0, 0, 1, 1,
-0.8922534, 0.7054471, -0.9413072, 1, 1, 1, 1, 1,
-0.8918093, 0.3197701, -1.018609, 1, 1, 1, 1, 1,
-0.889964, 0.2088456, -3.254384, 1, 1, 1, 1, 1,
-0.8723509, 0.4101422, -1.085612, 1, 1, 1, 1, 1,
-0.8713277, -0.05572386, -1.285918, 1, 1, 1, 1, 1,
-0.8642021, -1.034459, -2.469491, 1, 1, 1, 1, 1,
-0.8640345, -0.26839, -4.152122, 1, 1, 1, 1, 1,
-0.8617374, -0.2922201, -1.885358, 1, 1, 1, 1, 1,
-0.8601034, 1.141863, 0.295618, 1, 1, 1, 1, 1,
-0.8599573, 2.127267, -1.765907, 1, 1, 1, 1, 1,
-0.8598139, -0.3545971, -0.2947098, 1, 1, 1, 1, 1,
-0.8498725, -0.9308333, -2.833898, 1, 1, 1, 1, 1,
-0.8489674, 0.1617004, -0.2505592, 1, 1, 1, 1, 1,
-0.848204, -0.1585565, -2.900826, 1, 1, 1, 1, 1,
-0.8466125, -0.3933248, -2.624099, 1, 1, 1, 1, 1,
-0.8444718, 0.01691184, -2.248825, 0, 0, 1, 1, 1,
-0.8439085, -0.4383531, -0.9577249, 1, 0, 0, 1, 1,
-0.8437322, 1.498695, -0.9668229, 1, 0, 0, 1, 1,
-0.8365064, -1.618985, -2.46323, 1, 0, 0, 1, 1,
-0.8348249, 2.724673, -0.429624, 1, 0, 0, 1, 1,
-0.8327045, -2.159737, -1.498077, 1, 0, 0, 1, 1,
-0.8323813, -0.2812926, -2.137656, 0, 0, 0, 1, 1,
-0.8252037, 1.491361, -1.498266, 0, 0, 0, 1, 1,
-0.8242301, -0.7238205, -2.482358, 0, 0, 0, 1, 1,
-0.8242247, -1.676183, -4.495809, 0, 0, 0, 1, 1,
-0.8218418, -0.2215409, -2.725474, 0, 0, 0, 1, 1,
-0.8216723, -1.590052, -3.066287, 0, 0, 0, 1, 1,
-0.8181998, -0.006014005, -1.90437, 0, 0, 0, 1, 1,
-0.8169342, -1.618759, -2.827684, 1, 1, 1, 1, 1,
-0.8094027, -0.1907361, -2.47365, 1, 1, 1, 1, 1,
-0.8057786, -0.04563198, -1.050646, 1, 1, 1, 1, 1,
-0.8046185, -2.386566, -4.050045, 1, 1, 1, 1, 1,
-0.7977552, -0.4511856, -0.9044321, 1, 1, 1, 1, 1,
-0.7880292, 0.8046141, 0.7652349, 1, 1, 1, 1, 1,
-0.7741532, 0.9245813, -0.2203424, 1, 1, 1, 1, 1,
-0.7693434, 1.335555, -0.641714, 1, 1, 1, 1, 1,
-0.7575014, -0.09263548, -0.5541432, 1, 1, 1, 1, 1,
-0.7374877, -0.5236401, -2.298419, 1, 1, 1, 1, 1,
-0.7368772, 0.4271689, -1.293473, 1, 1, 1, 1, 1,
-0.7366985, -1.170936, -2.736395, 1, 1, 1, 1, 1,
-0.7320512, 1.915804, -1.356785, 1, 1, 1, 1, 1,
-0.7301751, -0.8530738, -3.631374, 1, 1, 1, 1, 1,
-0.7202874, -0.006588574, -0.9827603, 1, 1, 1, 1, 1,
-0.7177513, 0.9029357, -2.123348, 0, 0, 1, 1, 1,
-0.7145655, -0.2112919, -1.855877, 1, 0, 0, 1, 1,
-0.7101193, 0.4084927, -1.086268, 1, 0, 0, 1, 1,
-0.7067889, 0.5127689, 1.16922, 1, 0, 0, 1, 1,
-0.7058639, 0.2204113, -0.9660835, 1, 0, 0, 1, 1,
-0.7054323, 0.4107651, 1.364967, 1, 0, 0, 1, 1,
-0.7010589, -0.4943987, -1.239854, 0, 0, 0, 1, 1,
-0.6995293, 0.2219711, -2.601451, 0, 0, 0, 1, 1,
-0.6970229, -0.8771249, -4.236872, 0, 0, 0, 1, 1,
-0.6957835, 0.3025849, -1.879258, 0, 0, 0, 1, 1,
-0.6915116, -0.1464373, -2.088456, 0, 0, 0, 1, 1,
-0.6836965, 0.09079856, -2.135726, 0, 0, 0, 1, 1,
-0.6813318, 0.358741, -2.488919, 0, 0, 0, 1, 1,
-0.6599545, 0.09617218, -2.413678, 1, 1, 1, 1, 1,
-0.6569174, 1.109453, -1.071968, 1, 1, 1, 1, 1,
-0.6569054, 0.9602513, -1.221393, 1, 1, 1, 1, 1,
-0.6552129, -1.157659, -1.441321, 1, 1, 1, 1, 1,
-0.654154, -1.673791, -2.757468, 1, 1, 1, 1, 1,
-0.650601, -1.014042, -2.700348, 1, 1, 1, 1, 1,
-0.6478897, -0.9717342, -0.9821977, 1, 1, 1, 1, 1,
-0.6472498, -1.331997, -3.65568, 1, 1, 1, 1, 1,
-0.645233, 0.9855167, -0.8204276, 1, 1, 1, 1, 1,
-0.6448411, 0.1748339, -1.448308, 1, 1, 1, 1, 1,
-0.6406941, 0.07453758, -0.03105371, 1, 1, 1, 1, 1,
-0.6395698, 0.8609563, -1.137051, 1, 1, 1, 1, 1,
-0.6379635, 0.3900345, 0.1461592, 1, 1, 1, 1, 1,
-0.6356775, -0.115133, -1.154954, 1, 1, 1, 1, 1,
-0.6343054, 0.6745652, 0.3776353, 1, 1, 1, 1, 1,
-0.6340787, -0.2138351, -1.966679, 0, 0, 1, 1, 1,
-0.6327633, 0.5786203, -1.468355, 1, 0, 0, 1, 1,
-0.6295062, 2.337399, -1.610849, 1, 0, 0, 1, 1,
-0.6263469, -1.179723, -2.826409, 1, 0, 0, 1, 1,
-0.6226934, -0.9276425, -3.379735, 1, 0, 0, 1, 1,
-0.6176358, -0.2062423, -1.457391, 1, 0, 0, 1, 1,
-0.6166915, 1.214162, -0.6834089, 0, 0, 0, 1, 1,
-0.6143044, 0.3454573, -2.568719, 0, 0, 0, 1, 1,
-0.6136401, -1.728799, -2.749214, 0, 0, 0, 1, 1,
-0.6126758, -0.09450852, -4.14133, 0, 0, 0, 1, 1,
-0.6126134, -1.340705, -0.5365102, 0, 0, 0, 1, 1,
-0.6051317, -1.330961, -2.671442, 0, 0, 0, 1, 1,
-0.6029219, -0.9792901, -2.838573, 0, 0, 0, 1, 1,
-0.6024023, 0.02232816, -2.911769, 1, 1, 1, 1, 1,
-0.5996793, 0.1617213, 0.06194178, 1, 1, 1, 1, 1,
-0.5911307, 0.3787055, -1.223267, 1, 1, 1, 1, 1,
-0.5906053, -0.3841168, -4.001524, 1, 1, 1, 1, 1,
-0.5881389, 0.8841219, 1.202384, 1, 1, 1, 1, 1,
-0.5796916, 0.3065603, -1.196377, 1, 1, 1, 1, 1,
-0.5785972, -0.9691086, -3.239374, 1, 1, 1, 1, 1,
-0.5729244, -0.8522127, -3.553405, 1, 1, 1, 1, 1,
-0.5679808, -0.7729552, -2.417494, 1, 1, 1, 1, 1,
-0.5604352, -0.01694005, -1.025409, 1, 1, 1, 1, 1,
-0.5585404, -0.8245443, -1.645308, 1, 1, 1, 1, 1,
-0.5534436, 1.236678, -1.119628, 1, 1, 1, 1, 1,
-0.550476, -0.4455318, -1.469402, 1, 1, 1, 1, 1,
-0.5495913, -1.340796, -2.383613, 1, 1, 1, 1, 1,
-0.548103, -0.7328803, -2.486171, 1, 1, 1, 1, 1,
-0.5435359, -0.2103337, -1.192514, 0, 0, 1, 1, 1,
-0.5412338, -0.9299948, -1.292561, 1, 0, 0, 1, 1,
-0.537872, 0.6575587, 1.234751, 1, 0, 0, 1, 1,
-0.5332243, -0.3219609, -2.792574, 1, 0, 0, 1, 1,
-0.5323212, -0.0240539, -2.251122, 1, 0, 0, 1, 1,
-0.5305371, -3.196236, -3.121849, 1, 0, 0, 1, 1,
-0.5271651, 0.2947898, -0.6949859, 0, 0, 0, 1, 1,
-0.5235403, 0.4200941, -0.9092374, 0, 0, 0, 1, 1,
-0.5191864, -1.326508, -1.580763, 0, 0, 0, 1, 1,
-0.5166108, -1.468846, -3.532168, 0, 0, 0, 1, 1,
-0.5075842, 0.3619505, -0.2738484, 0, 0, 0, 1, 1,
-0.5031266, 0.08336148, -0.7857141, 0, 0, 0, 1, 1,
-0.4991646, 1.544941, -0.4354962, 0, 0, 0, 1, 1,
-0.4989265, 0.2508106, -0.6482381, 1, 1, 1, 1, 1,
-0.4970135, -0.8951141, -4.032712, 1, 1, 1, 1, 1,
-0.4910746, 0.8013791, 0.455728, 1, 1, 1, 1, 1,
-0.4887315, 0.8867868, -0.7125001, 1, 1, 1, 1, 1,
-0.4856853, -0.4319947, -3.974946, 1, 1, 1, 1, 1,
-0.4856355, -1.659518, -2.996547, 1, 1, 1, 1, 1,
-0.4764439, -1.080395, -2.116404, 1, 1, 1, 1, 1,
-0.4740226, -1.408472, -2.506822, 1, 1, 1, 1, 1,
-0.4694743, 1.155775, 1.529184, 1, 1, 1, 1, 1,
-0.4689158, 2.254293, -0.3593104, 1, 1, 1, 1, 1,
-0.4679433, -0.8698818, -3.13685, 1, 1, 1, 1, 1,
-0.4644173, -1.55334, -2.538683, 1, 1, 1, 1, 1,
-0.4638462, 0.01648968, -2.121856, 1, 1, 1, 1, 1,
-0.4566521, -0.8246253, -2.208074, 1, 1, 1, 1, 1,
-0.4561188, -0.4109545, -2.927775, 1, 1, 1, 1, 1,
-0.4554588, -1.405582, -4.045534, 0, 0, 1, 1, 1,
-0.4503059, -0.7748162, -3.107845, 1, 0, 0, 1, 1,
-0.4502516, 0.2697147, -0.2055508, 1, 0, 0, 1, 1,
-0.4480231, -0.2513125, -2.73787, 1, 0, 0, 1, 1,
-0.4450034, 1.435478, 1.30088, 1, 0, 0, 1, 1,
-0.4435946, 0.3425392, 0.5624033, 1, 0, 0, 1, 1,
-0.4424225, -0.7680628, -2.549003, 0, 0, 0, 1, 1,
-0.4411035, 1.289411, -2.663518, 0, 0, 0, 1, 1,
-0.4400248, -0.1061846, -1.669158, 0, 0, 0, 1, 1,
-0.4391641, -0.6698778, -4.285817, 0, 0, 0, 1, 1,
-0.4378699, 1.081301, 0.580752, 0, 0, 0, 1, 1,
-0.4271516, 1.307444, 0.9602988, 0, 0, 0, 1, 1,
-0.4236909, -1.142297, -2.454851, 0, 0, 0, 1, 1,
-0.4227977, -0.709689, -3.052631, 1, 1, 1, 1, 1,
-0.4220845, -0.9943427, -2.570919, 1, 1, 1, 1, 1,
-0.4219856, 0.3420445, -1.887655, 1, 1, 1, 1, 1,
-0.4213825, 0.3544202, -0.5803221, 1, 1, 1, 1, 1,
-0.4192495, 0.05915417, -0.7558971, 1, 1, 1, 1, 1,
-0.4156206, 0.6642585, -1.689223, 1, 1, 1, 1, 1,
-0.4113856, -1.259819, -2.733416, 1, 1, 1, 1, 1,
-0.4102224, 1.109502, -0.9447766, 1, 1, 1, 1, 1,
-0.4090717, 0.1870147, -1.654108, 1, 1, 1, 1, 1,
-0.4086275, 0.8875479, -0.9633631, 1, 1, 1, 1, 1,
-0.4079273, 0.5057928, -1.162401, 1, 1, 1, 1, 1,
-0.4035821, 0.9361559, 0.394081, 1, 1, 1, 1, 1,
-0.3985761, -0.04095653, -1.243904, 1, 1, 1, 1, 1,
-0.3891163, -0.09265054, -0.9218929, 1, 1, 1, 1, 1,
-0.3865738, -2.045977, -2.971285, 1, 1, 1, 1, 1,
-0.3862564, 0.8866752, -1.612738, 0, 0, 1, 1, 1,
-0.3832416, -0.2990887, -1.81731, 1, 0, 0, 1, 1,
-0.3830669, 0.200688, -0.4231166, 1, 0, 0, 1, 1,
-0.3785955, 2.029237, 0.6645633, 1, 0, 0, 1, 1,
-0.3782496, 1.739296, 0.08230983, 1, 0, 0, 1, 1,
-0.377867, 0.3199527, -0.3905334, 1, 0, 0, 1, 1,
-0.3768061, 2.28966, -1.249899, 0, 0, 0, 1, 1,
-0.3712205, -1.84475, -3.250538, 0, 0, 0, 1, 1,
-0.367635, -1.57287, -1.774833, 0, 0, 0, 1, 1,
-0.362523, 0.07195404, -0.4987217, 0, 0, 0, 1, 1,
-0.3607073, 0.747464, -1.474446, 0, 0, 0, 1, 1,
-0.3481153, 0.4750426, 0.5689251, 0, 0, 0, 1, 1,
-0.3453015, -1.310116, -3.802887, 0, 0, 0, 1, 1,
-0.3432829, 0.8142943, -0.8645894, 1, 1, 1, 1, 1,
-0.3403789, -1.071243, -2.753427, 1, 1, 1, 1, 1,
-0.3371535, 0.3591454, -0.6491485, 1, 1, 1, 1, 1,
-0.3370996, -0.364938, -1.120672, 1, 1, 1, 1, 1,
-0.3355291, 0.7202075, 1.493369, 1, 1, 1, 1, 1,
-0.3343541, 0.2312789, -0.3258853, 1, 1, 1, 1, 1,
-0.3339265, -0.2936778, -2.056561, 1, 1, 1, 1, 1,
-0.3330938, -0.6726068, -3.1281, 1, 1, 1, 1, 1,
-0.3297491, 0.6602277, -2.072132, 1, 1, 1, 1, 1,
-0.3273335, 0.356905, -1.852151, 1, 1, 1, 1, 1,
-0.3259802, 0.0982703, -0.06621671, 1, 1, 1, 1, 1,
-0.3230695, -1.617947, -3.226733, 1, 1, 1, 1, 1,
-0.3216903, 0.1369004, -2.6385, 1, 1, 1, 1, 1,
-0.3203699, -0.4695316, -3.326597, 1, 1, 1, 1, 1,
-0.3184174, -1.530254, -3.680562, 1, 1, 1, 1, 1,
-0.3153658, 1.514349, 1.143567, 0, 0, 1, 1, 1,
-0.3142973, -0.1707287, -2.812844, 1, 0, 0, 1, 1,
-0.3091967, 0.3279774, -0.4584727, 1, 0, 0, 1, 1,
-0.3072205, -0.6769949, -1.586699, 1, 0, 0, 1, 1,
-0.3056554, 1.816538, -1.446631, 1, 0, 0, 1, 1,
-0.3007891, 0.6058034, -0.567648, 1, 0, 0, 1, 1,
-0.2988293, 1.409754, -1.25701, 0, 0, 0, 1, 1,
-0.2983729, -0.4771677, -3.082609, 0, 0, 0, 1, 1,
-0.294891, -0.3544489, -2.525759, 0, 0, 0, 1, 1,
-0.286352, 0.5042894, -0.8208967, 0, 0, 0, 1, 1,
-0.2842009, -0.4350043, -3.685403, 0, 0, 0, 1, 1,
-0.2824982, -0.4826174, -2.591295, 0, 0, 0, 1, 1,
-0.2820314, -1.190701, -0.9296327, 0, 0, 0, 1, 1,
-0.2798553, -0.1760348, -0.5444839, 1, 1, 1, 1, 1,
-0.2774627, -0.4892211, -3.35363, 1, 1, 1, 1, 1,
-0.2678947, 0.2567126, -0.5001466, 1, 1, 1, 1, 1,
-0.2662862, 0.5483981, 0.3525889, 1, 1, 1, 1, 1,
-0.2642736, 0.4194376, -1.880326, 1, 1, 1, 1, 1,
-0.253661, -0.8390092, -1.713553, 1, 1, 1, 1, 1,
-0.2514977, -0.5335958, -2.333898, 1, 1, 1, 1, 1,
-0.2413591, 0.6170995, -0.3281384, 1, 1, 1, 1, 1,
-0.2403724, 0.1611052, -0.932617, 1, 1, 1, 1, 1,
-0.237121, 1.014491, 0.1468845, 1, 1, 1, 1, 1,
-0.2329157, 1.054759, -0.7451386, 1, 1, 1, 1, 1,
-0.2315615, 0.2686336, -1.390368, 1, 1, 1, 1, 1,
-0.2285198, 1.912609, -0.2326142, 1, 1, 1, 1, 1,
-0.2263613, 0.3090374, 0.3966531, 1, 1, 1, 1, 1,
-0.2255505, 0.5665696, -0.6039686, 1, 1, 1, 1, 1,
-0.2255094, -0.8560371, -2.548571, 0, 0, 1, 1, 1,
-0.2242767, -0.1715482, -0.4696927, 1, 0, 0, 1, 1,
-0.2203075, 1.668526, 0.3166758, 1, 0, 0, 1, 1,
-0.2191138, -0.9195259, -1.514151, 1, 0, 0, 1, 1,
-0.2117676, 0.6570596, 0.05651001, 1, 0, 0, 1, 1,
-0.202995, 0.1718512, -0.2804928, 1, 0, 0, 1, 1,
-0.1958693, -1.161036, -2.811645, 0, 0, 0, 1, 1,
-0.1858999, 0.5339802, -0.6936628, 0, 0, 0, 1, 1,
-0.1825339, -0.2324715, -0.9080162, 0, 0, 0, 1, 1,
-0.1813322, 1.580814, 0.03384717, 0, 0, 0, 1, 1,
-0.176433, 0.940219, -0.01190821, 0, 0, 0, 1, 1,
-0.1720604, -0.5015327, -3.690982, 0, 0, 0, 1, 1,
-0.1695695, -0.1379205, -0.7076918, 0, 0, 0, 1, 1,
-0.1678708, -0.1869878, -2.405092, 1, 1, 1, 1, 1,
-0.1676265, -0.06976936, -1.249063, 1, 1, 1, 1, 1,
-0.1659619, 0.1726266, -1.256436, 1, 1, 1, 1, 1,
-0.1613092, 0.8925369, 1.631341, 1, 1, 1, 1, 1,
-0.1601872, -1.909463, -4.879634, 1, 1, 1, 1, 1,
-0.1557144, -0.2802349, -2.188706, 1, 1, 1, 1, 1,
-0.1539392, 1.145372, 1.20287, 1, 1, 1, 1, 1,
-0.1521881, 2.492106, 1.663558, 1, 1, 1, 1, 1,
-0.1515146, -1.090142, -3.263872, 1, 1, 1, 1, 1,
-0.1505555, -1.892196, -3.080238, 1, 1, 1, 1, 1,
-0.147539, -0.9830531, -4.271327, 1, 1, 1, 1, 1,
-0.1446584, -1.177817, -2.229274, 1, 1, 1, 1, 1,
-0.1421243, -1.577824, -4.062275, 1, 1, 1, 1, 1,
-0.1385609, 0.6455787, 0.4705023, 1, 1, 1, 1, 1,
-0.1351638, -0.938288, -3.013607, 1, 1, 1, 1, 1,
-0.1341623, 0.933354, 0.8603163, 0, 0, 1, 1, 1,
-0.1317476, -0.8025817, -3.957819, 1, 0, 0, 1, 1,
-0.1307122, -1.377141, -2.46972, 1, 0, 0, 1, 1,
-0.1291925, 0.4001823, -1.044788, 1, 0, 0, 1, 1,
-0.1267286, -0.6745982, -3.239487, 1, 0, 0, 1, 1,
-0.1255382, -0.6616396, -2.686397, 1, 0, 0, 1, 1,
-0.1251126, 0.9379246, -0.3333401, 0, 0, 0, 1, 1,
-0.1247592, -0.0003360875, -1.177534, 0, 0, 0, 1, 1,
-0.1245516, -0.9869218, -3.966797, 0, 0, 0, 1, 1,
-0.1211632, -1.213846, -2.020511, 0, 0, 0, 1, 1,
-0.1205274, 0.01337428, -1.550261, 0, 0, 0, 1, 1,
-0.1085204, 1.432257, -1.187805, 0, 0, 0, 1, 1,
-0.1084206, 1.896259, -0.4094605, 0, 0, 0, 1, 1,
-0.107367, -0.02316636, -0.4669651, 1, 1, 1, 1, 1,
-0.1054464, -1.178532, -3.328843, 1, 1, 1, 1, 1,
-0.0993526, 0.2521668, -1.770002, 1, 1, 1, 1, 1,
-0.09805135, -1.949814, -2.39113, 1, 1, 1, 1, 1,
-0.09578951, -0.07774676, -2.463158, 1, 1, 1, 1, 1,
-0.09046111, -0.6532467, -3.434468, 1, 1, 1, 1, 1,
-0.08505137, 0.1866323, -0.9278209, 1, 1, 1, 1, 1,
-0.08382782, 0.3475851, 0.1136809, 1, 1, 1, 1, 1,
-0.08025173, 1.601953, 1.406981, 1, 1, 1, 1, 1,
-0.07873289, 0.5438018, -0.7875798, 1, 1, 1, 1, 1,
-0.07870125, -0.4104936, -2.840222, 1, 1, 1, 1, 1,
-0.07465896, 1.61344, -0.7642424, 1, 1, 1, 1, 1,
-0.0733474, -0.4794993, -1.974753, 1, 1, 1, 1, 1,
-0.07257874, 0.5984061, -0.1928325, 1, 1, 1, 1, 1,
-0.07008864, -0.6846812, -2.803261, 1, 1, 1, 1, 1,
-0.06679498, 0.09479534, 0.697412, 0, 0, 1, 1, 1,
-0.0655762, -1.299198, -3.048007, 1, 0, 0, 1, 1,
-0.06551315, 0.2433594, -1.439836, 1, 0, 0, 1, 1,
-0.05573962, 1.506454, -0.3422746, 1, 0, 0, 1, 1,
-0.05548723, 0.480785, 0.8503173, 1, 0, 0, 1, 1,
-0.0534494, 0.5591993, -0.5284215, 1, 0, 0, 1, 1,
-0.05260336, 0.2564602, 0.6568317, 0, 0, 0, 1, 1,
-0.05140817, -0.02401925, -2.442575, 0, 0, 0, 1, 1,
-0.05133655, -0.7881461, -1.847789, 0, 0, 0, 1, 1,
-0.04827242, -0.2147693, -1.456906, 0, 0, 0, 1, 1,
-0.04676031, 0.2045534, -0.6372447, 0, 0, 0, 1, 1,
-0.04451159, 1.952335, -0.4342841, 0, 0, 0, 1, 1,
-0.0430699, 0.6317757, -0.6075183, 0, 0, 0, 1, 1,
-0.04183706, -1.437333, -2.024812, 1, 1, 1, 1, 1,
-0.04089726, -0.9065769, -2.532812, 1, 1, 1, 1, 1,
-0.04054108, 0.2896071, 0.4836516, 1, 1, 1, 1, 1,
-0.03923642, -1.322383, -4.198454, 1, 1, 1, 1, 1,
-0.03427751, -1.022312, -2.358114, 1, 1, 1, 1, 1,
-0.03061044, -1.527488, -2.555993, 1, 1, 1, 1, 1,
-0.02508882, 1.060709, -0.8815372, 1, 1, 1, 1, 1,
-0.02398772, -1.001365, -2.546905, 1, 1, 1, 1, 1,
-0.01102699, -0.400035, -3.979225, 1, 1, 1, 1, 1,
-0.009094509, 0.6141942, -0.460132, 1, 1, 1, 1, 1,
-0.007416357, 0.3827412, 1.322679, 1, 1, 1, 1, 1,
0.01061113, 0.7512934, 0.8484818, 1, 1, 1, 1, 1,
0.01355358, 1.821564, -0.7014943, 1, 1, 1, 1, 1,
0.01366629, -0.809834, 4.848471, 1, 1, 1, 1, 1,
0.01737426, 0.3315421, 1.48336, 1, 1, 1, 1, 1,
0.02166041, 1.113298, 1.037735, 0, 0, 1, 1, 1,
0.02460463, 0.5273353, 1.44426, 1, 0, 0, 1, 1,
0.02585928, -0.2692999, 1.81851, 1, 0, 0, 1, 1,
0.02770422, 0.3115167, 0.5377562, 1, 0, 0, 1, 1,
0.02996389, -2.060123, 2.868104, 1, 0, 0, 1, 1,
0.03122908, 0.2105352, -1.870531, 1, 0, 0, 1, 1,
0.03510199, 1.421089, 0.09070949, 0, 0, 0, 1, 1,
0.03574648, -1.598731, 4.660844, 0, 0, 0, 1, 1,
0.03704754, -0.9109415, 2.554543, 0, 0, 0, 1, 1,
0.03751395, -0.07875212, 4.549541, 0, 0, 0, 1, 1,
0.04052529, 1.517824, 0.4440161, 0, 0, 0, 1, 1,
0.040548, 0.9412726, 1.168342, 0, 0, 0, 1, 1,
0.0448426, 0.6765044, 1.505961, 0, 0, 0, 1, 1,
0.04715763, 0.8742957, -1.063632, 1, 1, 1, 1, 1,
0.04754425, -1.065663, 1.797539, 1, 1, 1, 1, 1,
0.04892118, -0.1605034, 1.568316, 1, 1, 1, 1, 1,
0.05105256, -2.217804, 2.898993, 1, 1, 1, 1, 1,
0.05182912, 0.7310775, -0.2623304, 1, 1, 1, 1, 1,
0.05356225, 1.411239, 1.442434, 1, 1, 1, 1, 1,
0.05383787, 1.882218, 1.232875, 1, 1, 1, 1, 1,
0.05524404, -0.6281085, 4.363731, 1, 1, 1, 1, 1,
0.05736288, 0.1268161, 0.8586184, 1, 1, 1, 1, 1,
0.05828381, -1.270902, 1.234954, 1, 1, 1, 1, 1,
0.06009587, 0.7719817, -1.015244, 1, 1, 1, 1, 1,
0.06111081, -0.0667309, 1.697291, 1, 1, 1, 1, 1,
0.06141731, -0.145441, 3.191977, 1, 1, 1, 1, 1,
0.06280614, -0.9868516, 4.335414, 1, 1, 1, 1, 1,
0.06499822, 0.6923504, 1.945108, 1, 1, 1, 1, 1,
0.06539965, 0.3229351, 0.3938498, 0, 0, 1, 1, 1,
0.06621948, -0.2616682, 2.81197, 1, 0, 0, 1, 1,
0.07089927, -0.4339106, 2.799984, 1, 0, 0, 1, 1,
0.0743261, 0.8434927, 0.4178274, 1, 0, 0, 1, 1,
0.0764112, 1.183541, 1.586293, 1, 0, 0, 1, 1,
0.07983637, -0.5836891, 2.195507, 1, 0, 0, 1, 1,
0.08016752, -2.622894, 1.986835, 0, 0, 0, 1, 1,
0.08404255, 1.87955, -1.131756, 0, 0, 0, 1, 1,
0.0902373, 0.7613694, -1.989989, 0, 0, 0, 1, 1,
0.09266149, -1.349773, 2.946512, 0, 0, 0, 1, 1,
0.09610517, -0.1792487, 3.021207, 0, 0, 0, 1, 1,
0.1011195, -0.3114291, 2.175287, 0, 0, 0, 1, 1,
0.1067501, -0.8322594, 3.133613, 0, 0, 0, 1, 1,
0.1109706, -1.694602, 3.746946, 1, 1, 1, 1, 1,
0.1118285, 0.06973093, 0.3389608, 1, 1, 1, 1, 1,
0.112823, 0.6921105, -0.3079942, 1, 1, 1, 1, 1,
0.1130228, -0.3155016, 1.341905, 1, 1, 1, 1, 1,
0.1131563, -0.2784237, 2.045585, 1, 1, 1, 1, 1,
0.1138539, 1.121746, -0.1925787, 1, 1, 1, 1, 1,
0.1204341, 1.414313, 0.8672501, 1, 1, 1, 1, 1,
0.1215173, -1.548388, 3.306714, 1, 1, 1, 1, 1,
0.1250692, 1.222873, 0.2837281, 1, 1, 1, 1, 1,
0.1259023, 0.0638244, 0.7009658, 1, 1, 1, 1, 1,
0.1293287, 1.470667, -0.2912902, 1, 1, 1, 1, 1,
0.1317996, 0.5135906, -0.04400021, 1, 1, 1, 1, 1,
0.1360592, 0.5191268, -1.107396, 1, 1, 1, 1, 1,
0.1380339, 0.2252129, 0.9074363, 1, 1, 1, 1, 1,
0.1381845, -0.9844317, 2.344124, 1, 1, 1, 1, 1,
0.1384811, -1.284554, 3.303376, 0, 0, 1, 1, 1,
0.1391724, -0.5820395, 1.955867, 1, 0, 0, 1, 1,
0.1473492, -0.2010845, 3.228079, 1, 0, 0, 1, 1,
0.1503968, -0.05015107, 2.64794, 1, 0, 0, 1, 1,
0.1505469, -0.7695609, 1.775076, 1, 0, 0, 1, 1,
0.1508756, 0.4935705, -0.5395445, 1, 0, 0, 1, 1,
0.1533676, 0.3468118, 1.189545, 0, 0, 0, 1, 1,
0.1549707, 0.3848481, -1.010104, 0, 0, 0, 1, 1,
0.1561021, 0.4963849, 0.2109807, 0, 0, 0, 1, 1,
0.161705, -0.3558349, 2.587024, 0, 0, 0, 1, 1,
0.1622739, 0.1348811, 1.310174, 0, 0, 0, 1, 1,
0.1727384, -0.8655186, 4.314119, 0, 0, 0, 1, 1,
0.1750224, 0.386234, -0.3377267, 0, 0, 0, 1, 1,
0.1780912, -0.2934608, 1.2256, 1, 1, 1, 1, 1,
0.1790425, 1.402057, -0.1081221, 1, 1, 1, 1, 1,
0.1795317, 0.4178209, 0.171005, 1, 1, 1, 1, 1,
0.1800609, 0.1035502, 1.423225, 1, 1, 1, 1, 1,
0.1829174, 0.6513565, -0.06217292, 1, 1, 1, 1, 1,
0.1831074, 1.775545, 0.9779023, 1, 1, 1, 1, 1,
0.1849559, -2.05087, 4.838968, 1, 1, 1, 1, 1,
0.1890068, 0.09294613, 2.190898, 1, 1, 1, 1, 1,
0.1921186, -0.3002772, 1.928579, 1, 1, 1, 1, 1,
0.1946733, -1.099129, 3.995007, 1, 1, 1, 1, 1,
0.195294, 0.1397877, 1.12295, 1, 1, 1, 1, 1,
0.1958258, 0.7791297, -0.9955258, 1, 1, 1, 1, 1,
0.1961021, 1.034821, -0.1795474, 1, 1, 1, 1, 1,
0.1981688, -0.2267409, 2.340672, 1, 1, 1, 1, 1,
0.1999696, -1.156449, 2.069737, 1, 1, 1, 1, 1,
0.2012724, 1.243051, 0.02595448, 0, 0, 1, 1, 1,
0.2047977, -0.6500309, 3.804648, 1, 0, 0, 1, 1,
0.211024, -0.6082646, 2.778715, 1, 0, 0, 1, 1,
0.2126864, 0.4407753, -0.8805142, 1, 0, 0, 1, 1,
0.2139089, 0.450171, -0.8956046, 1, 0, 0, 1, 1,
0.2139538, 0.3640035, 0.9672453, 1, 0, 0, 1, 1,
0.2151568, 0.4334244, 0.703127, 0, 0, 0, 1, 1,
0.2157573, 0.3556629, -0.5154036, 0, 0, 0, 1, 1,
0.2201561, 0.4204092, -0.4414048, 0, 0, 0, 1, 1,
0.2221979, 1.657877, 1.045807, 0, 0, 0, 1, 1,
0.2238574, -0.6154838, 2.311923, 0, 0, 0, 1, 1,
0.2281902, -1.714029, 3.777409, 0, 0, 0, 1, 1,
0.229543, -0.2043804, 2.043504, 0, 0, 0, 1, 1,
0.2310563, -0.06573912, 2.022744, 1, 1, 1, 1, 1,
0.233405, -1.657094, 3.431763, 1, 1, 1, 1, 1,
0.2356227, 1.812583, -0.4062076, 1, 1, 1, 1, 1,
0.2508727, 1.145596, -1.079705, 1, 1, 1, 1, 1,
0.2532446, 0.670744, -0.3868172, 1, 1, 1, 1, 1,
0.2547717, -1.425616, 1.58326, 1, 1, 1, 1, 1,
0.2573622, -0.9074684, 2.522927, 1, 1, 1, 1, 1,
0.2603772, 0.8828219, 2.260952, 1, 1, 1, 1, 1,
0.2637114, -0.5941468, 2.472709, 1, 1, 1, 1, 1,
0.2657218, 0.0281705, 0.9034232, 1, 1, 1, 1, 1,
0.2702882, -0.9985834, 4.712784, 1, 1, 1, 1, 1,
0.2772451, 0.4621101, 1.461302, 1, 1, 1, 1, 1,
0.2782193, 1.030784, 0.5507406, 1, 1, 1, 1, 1,
0.2806837, 2.135807, -0.5201387, 1, 1, 1, 1, 1,
0.2822977, 0.07467942, 1.07027, 1, 1, 1, 1, 1,
0.2866717, -0.7791516, 2.390541, 0, 0, 1, 1, 1,
0.2876417, 0.8796995, 1.540318, 1, 0, 0, 1, 1,
0.2888747, 0.7428131, 1.275494, 1, 0, 0, 1, 1,
0.2898082, 0.1381688, 0.8550751, 1, 0, 0, 1, 1,
0.2901956, 0.8417414, 0.2287249, 1, 0, 0, 1, 1,
0.294393, 0.4697874, 0.107904, 1, 0, 0, 1, 1,
0.3009306, -0.1735508, 2.896477, 0, 0, 0, 1, 1,
0.3057893, -0.03344402, 2.017755, 0, 0, 0, 1, 1,
0.3088312, -0.1534993, 2.147295, 0, 0, 0, 1, 1,
0.3094407, -1.168374, 2.394905, 0, 0, 0, 1, 1,
0.3144652, -0.5804152, 2.370318, 0, 0, 0, 1, 1,
0.3186494, 0.4956133, -0.4627916, 0, 0, 0, 1, 1,
0.3196713, 0.3932205, 2.484721, 0, 0, 0, 1, 1,
0.3211955, 1.493072, 0.02472698, 1, 1, 1, 1, 1,
0.3230439, 0.4770319, 0.9142612, 1, 1, 1, 1, 1,
0.3231809, 1.279892, 0.3514185, 1, 1, 1, 1, 1,
0.3267105, 1.10217, -1.581849, 1, 1, 1, 1, 1,
0.3270519, -0.7278939, 1.911111, 1, 1, 1, 1, 1,
0.3327116, 0.6404021, 3.100991, 1, 1, 1, 1, 1,
0.3342131, 0.3030852, 1.845751, 1, 1, 1, 1, 1,
0.3344349, 0.9522393, -0.7407345, 1, 1, 1, 1, 1,
0.3351316, -0.6434605, 2.453094, 1, 1, 1, 1, 1,
0.3365623, 0.230613, 1.833718, 1, 1, 1, 1, 1,
0.3409196, 2.725466, 0.9622131, 1, 1, 1, 1, 1,
0.3483932, 0.2554801, 0.5221148, 1, 1, 1, 1, 1,
0.3519738, -0.9840496, 3.444165, 1, 1, 1, 1, 1,
0.3552334, 0.4542018, -0.7327911, 1, 1, 1, 1, 1,
0.356352, 1.363387, -0.02738152, 1, 1, 1, 1, 1,
0.3591558, 1.530116, 1.328839, 0, 0, 1, 1, 1,
0.3628745, 1.371668, -0.0435393, 1, 0, 0, 1, 1,
0.3652953, 0.4832457, 1.191691, 1, 0, 0, 1, 1,
0.3668323, 0.5926974, -0.8298085, 1, 0, 0, 1, 1,
0.3672693, 1.050978, -0.5128377, 1, 0, 0, 1, 1,
0.3715116, 1.537839, -1.879515, 1, 0, 0, 1, 1,
0.3723514, 0.9509552, -0.04202164, 0, 0, 0, 1, 1,
0.373818, -0.08505569, 2.672872, 0, 0, 0, 1, 1,
0.3767672, -0.9819023, 2.398198, 0, 0, 0, 1, 1,
0.3815996, -0.3921382, 2.179939, 0, 0, 0, 1, 1,
0.382261, -3.143211, 4.163869, 0, 0, 0, 1, 1,
0.384182, -1.403807, 1.866298, 0, 0, 0, 1, 1,
0.3853092, 0.7859259, -0.4230092, 0, 0, 0, 1, 1,
0.3924585, 0.8905749, 1.36603, 1, 1, 1, 1, 1,
0.3928998, 0.3287773, 0.02641607, 1, 1, 1, 1, 1,
0.3955263, -1.578915, 2.922507, 1, 1, 1, 1, 1,
0.4024587, 1.229926, 0.1536612, 1, 1, 1, 1, 1,
0.406181, -0.6941072, 2.817467, 1, 1, 1, 1, 1,
0.4101326, 1.051202, -0.4455878, 1, 1, 1, 1, 1,
0.4103254, -1.843416, 2.443228, 1, 1, 1, 1, 1,
0.4135395, 0.9440109, 1.626213, 1, 1, 1, 1, 1,
0.4162429, -1.361386, 3.912762, 1, 1, 1, 1, 1,
0.4175447, -0.05295055, 2.801299, 1, 1, 1, 1, 1,
0.4220372, -0.9464341, 4.599862, 1, 1, 1, 1, 1,
0.4244348, 0.04295205, 2.253699, 1, 1, 1, 1, 1,
0.425444, -0.6335869, 1.12603, 1, 1, 1, 1, 1,
0.4266447, 0.1596714, 0.9100668, 1, 1, 1, 1, 1,
0.4281507, -0.452221, 1.079955, 1, 1, 1, 1, 1,
0.4287444, 0.6407852, 1.134684, 0, 0, 1, 1, 1,
0.4364566, 2.185824, -0.913082, 1, 0, 0, 1, 1,
0.4387316, -0.2524719, 0.673754, 1, 0, 0, 1, 1,
0.441669, 2.390717, -0.6715987, 1, 0, 0, 1, 1,
0.4419439, 0.3126295, 1.06053, 1, 0, 0, 1, 1,
0.4491244, -0.73815, 1.678923, 1, 0, 0, 1, 1,
0.4506996, -1.436908, 1.355998, 0, 0, 0, 1, 1,
0.4507252, 2.085627, 0.4243052, 0, 0, 0, 1, 1,
0.4561779, 0.003872265, 3.258015, 0, 0, 0, 1, 1,
0.4576745, 0.4285928, 2.604237, 0, 0, 0, 1, 1,
0.4591045, -0.8702052, 2.897092, 0, 0, 0, 1, 1,
0.4609877, -0.304819, 1.52961, 0, 0, 0, 1, 1,
0.4630792, 0.9587991, -0.2745614, 0, 0, 0, 1, 1,
0.463488, -0.4970595, 2.972555, 1, 1, 1, 1, 1,
0.465947, 0.3758307, 1.278248, 1, 1, 1, 1, 1,
0.4685753, 0.1964407, 0.9562089, 1, 1, 1, 1, 1,
0.4712553, 0.1728654, -0.2195266, 1, 1, 1, 1, 1,
0.4780498, -1.522526, 2.383994, 1, 1, 1, 1, 1,
0.4787109, -0.5924614, 3.18645, 1, 1, 1, 1, 1,
0.4908012, -0.4309699, 2.26943, 1, 1, 1, 1, 1,
0.498709, -0.9444442, 1.958532, 1, 1, 1, 1, 1,
0.501192, 1.595664, 1.52141, 1, 1, 1, 1, 1,
0.5017299, -1.636652, 1.962519, 1, 1, 1, 1, 1,
0.5024679, -2.187791, 1.188993, 1, 1, 1, 1, 1,
0.5049341, -0.2003643, 2.416748, 1, 1, 1, 1, 1,
0.5064265, -0.1549621, 2.225432, 1, 1, 1, 1, 1,
0.5083929, 0.272645, 0.6870527, 1, 1, 1, 1, 1,
0.5126429, 0.8495101, 1.796719, 1, 1, 1, 1, 1,
0.5141111, -0.2420008, 2.059773, 0, 0, 1, 1, 1,
0.5165423, -0.1759201, 1.017951, 1, 0, 0, 1, 1,
0.5170062, 0.600556, 1.775141, 1, 0, 0, 1, 1,
0.517713, -0.2456647, 2.476517, 1, 0, 0, 1, 1,
0.5224121, -1.680693, 1.855432, 1, 0, 0, 1, 1,
0.5298978, 0.3512436, 0.2978108, 1, 0, 0, 1, 1,
0.5301251, -0.5291014, 4.085624, 0, 0, 0, 1, 1,
0.5339569, -0.2488898, 2.429416, 0, 0, 0, 1, 1,
0.5340421, 0.8638617, 0.2947817, 0, 0, 0, 1, 1,
0.534392, 0.3276794, 1.409556, 0, 0, 0, 1, 1,
0.537526, -0.6416138, 1.306403, 0, 0, 0, 1, 1,
0.5431859, -1.148171, 2.400496, 0, 0, 0, 1, 1,
0.5463434, -0.2339982, 0.8632474, 0, 0, 0, 1, 1,
0.5490193, -1.552541, 2.888462, 1, 1, 1, 1, 1,
0.5499601, -0.1006821, 4.733387, 1, 1, 1, 1, 1,
0.5529518, 2.032041, 1.636402, 1, 1, 1, 1, 1,
0.5558848, 0.3072675, 0.6956742, 1, 1, 1, 1, 1,
0.5591118, 0.8070016, -0.368261, 1, 1, 1, 1, 1,
0.5591238, -0.8756877, 3.469611, 1, 1, 1, 1, 1,
0.5602869, -1.1419, 3.100217, 1, 1, 1, 1, 1,
0.5623316, 1.992233, -0.3107059, 1, 1, 1, 1, 1,
0.5624004, -1.716614, 2.97931, 1, 1, 1, 1, 1,
0.566591, 0.6465418, -0.4310458, 1, 1, 1, 1, 1,
0.5669299, 0.5889174, 0.9773819, 1, 1, 1, 1, 1,
0.5703804, 1.418918, 1.256546, 1, 1, 1, 1, 1,
0.5709643, 1.187871, 1.461574, 1, 1, 1, 1, 1,
0.5745869, -0.4564806, 2.866176, 1, 1, 1, 1, 1,
0.5753568, -2.989023, 2.565983, 1, 1, 1, 1, 1,
0.5753911, -1.154273, 1.43688, 0, 0, 1, 1, 1,
0.5767482, 0.02590201, 3.578888, 1, 0, 0, 1, 1,
0.5771295, 2.096844, 0.1941883, 1, 0, 0, 1, 1,
0.5780516, 2.142324, 1.982499, 1, 0, 0, 1, 1,
0.587458, 1.440605, 0.362129, 1, 0, 0, 1, 1,
0.589149, -0.0767562, 1.289788, 1, 0, 0, 1, 1,
0.5907221, 2.21289, -0.697028, 0, 0, 0, 1, 1,
0.5922856, 0.523649, -1.779352, 0, 0, 0, 1, 1,
0.5953683, -1.736287, 3.87984, 0, 0, 0, 1, 1,
0.5958362, 0.8334559, 0.2030289, 0, 0, 0, 1, 1,
0.5973159, 0.926679, 0.6421651, 0, 0, 0, 1, 1,
0.5979413, 0.6758253, 0.9126931, 0, 0, 0, 1, 1,
0.5994969, -0.5807037, 2.271913, 0, 0, 0, 1, 1,
0.6002804, 0.5684463, 1.827181, 1, 1, 1, 1, 1,
0.6067712, 2.692996, -0.9438153, 1, 1, 1, 1, 1,
0.6093329, -2.233786, 4.714681, 1, 1, 1, 1, 1,
0.6121902, 0.6520405, -0.4121987, 1, 1, 1, 1, 1,
0.6153503, 0.4158844, 0.3570121, 1, 1, 1, 1, 1,
0.6162998, -0.06022092, 1.207468, 1, 1, 1, 1, 1,
0.6206628, 0.02530785, 3.346107, 1, 1, 1, 1, 1,
0.6253905, 0.9769835, 3.688484, 1, 1, 1, 1, 1,
0.625775, 1.519849, -1.816839, 1, 1, 1, 1, 1,
0.6265276, -0.41691, 1.827698, 1, 1, 1, 1, 1,
0.6277492, 0.8412201, -0.1365308, 1, 1, 1, 1, 1,
0.632851, 0.9491572, 1.747876, 1, 1, 1, 1, 1,
0.6373248, -0.6915801, 2.636596, 1, 1, 1, 1, 1,
0.6416456, -1.008645, 3.487545, 1, 1, 1, 1, 1,
0.6421896, 1.479279, 0.939069, 1, 1, 1, 1, 1,
0.6482322, 0.8382176, 0.1172543, 0, 0, 1, 1, 1,
0.6639221, 0.627747, -0.7876563, 1, 0, 0, 1, 1,
0.6651627, 1.078022, -0.4494033, 1, 0, 0, 1, 1,
0.6653646, -0.1975315, 1.689252, 1, 0, 0, 1, 1,
0.6723245, 0.8119469, 0.5185626, 1, 0, 0, 1, 1,
0.6778078, 1.441598, -1.00431, 1, 0, 0, 1, 1,
0.6783294, -0.8825256, 1.279913, 0, 0, 0, 1, 1,
0.6951812, -0.5437627, 2.981723, 0, 0, 0, 1, 1,
0.6953899, 1.792302, 2.1069, 0, 0, 0, 1, 1,
0.6979297, 2.022076, 0.06328642, 0, 0, 0, 1, 1,
0.7000856, -0.5220138, 2.011594, 0, 0, 0, 1, 1,
0.7020137, -0.1403714, 3.003645, 0, 0, 0, 1, 1,
0.704815, -0.9802459, 2.696128, 0, 0, 0, 1, 1,
0.7097993, -0.3430001, 1.472244, 1, 1, 1, 1, 1,
0.7132544, -1.003542, 2.121626, 1, 1, 1, 1, 1,
0.7208706, -0.7388454, 2.441179, 1, 1, 1, 1, 1,
0.7240666, -0.4173478, 4.466763, 1, 1, 1, 1, 1,
0.7250678, -0.7557724, 2.212167, 1, 1, 1, 1, 1,
0.7256377, -0.006676716, 1.747121, 1, 1, 1, 1, 1,
0.7270069, 0.3752832, 1.616013, 1, 1, 1, 1, 1,
0.7321563, -0.0873895, 2.074604, 1, 1, 1, 1, 1,
0.7375202, 0.3010364, 1.281164, 1, 1, 1, 1, 1,
0.7381397, -0.07404029, -0.0936252, 1, 1, 1, 1, 1,
0.7407164, 0.2068379, 0.7613353, 1, 1, 1, 1, 1,
0.7426137, -1.354099, 3.058444, 1, 1, 1, 1, 1,
0.7444866, 0.7915851, 2.279334, 1, 1, 1, 1, 1,
0.7480714, -0.1887116, 0.563628, 1, 1, 1, 1, 1,
0.7487041, 0.9658479, 1.681728, 1, 1, 1, 1, 1,
0.7525184, 0.3362303, 0.05761601, 0, 0, 1, 1, 1,
0.7553979, 0.2680899, 2.729741, 1, 0, 0, 1, 1,
0.7556114, 1.652201, 2.057857, 1, 0, 0, 1, 1,
0.7607689, 1.219287, 0.8712298, 1, 0, 0, 1, 1,
0.7626721, -1.589079, 2.078403, 1, 0, 0, 1, 1,
0.7635351, 0.2446022, 1.478468, 1, 0, 0, 1, 1,
0.7781871, 0.9368398, 2.115914, 0, 0, 0, 1, 1,
0.7797618, -0.9681917, 3.090594, 0, 0, 0, 1, 1,
0.7806187, 0.8879381, -0.06844284, 0, 0, 0, 1, 1,
0.7807483, -0.7701319, 2.458114, 0, 0, 0, 1, 1,
0.7815438, -0.9155925, 3.759791, 0, 0, 0, 1, 1,
0.7816528, 0.3415625, 0.9302145, 0, 0, 0, 1, 1,
0.7828667, 1.288228, -0.05769809, 0, 0, 0, 1, 1,
0.7844544, 0.2104231, 1.829536, 1, 1, 1, 1, 1,
0.7847459, 0.0342245, 1.413878, 1, 1, 1, 1, 1,
0.7914606, 0.5155772, 0.08612286, 1, 1, 1, 1, 1,
0.7926514, 0.5975015, 1.124303, 1, 1, 1, 1, 1,
0.794107, 0.1635002, 2.555644, 1, 1, 1, 1, 1,
0.7975693, -0.1604012, 0.9848603, 1, 1, 1, 1, 1,
0.7990804, 0.6832247, 1.80559, 1, 1, 1, 1, 1,
0.7994671, 1.621809, 0.6627094, 1, 1, 1, 1, 1,
0.800959, -0.7179686, 2.537847, 1, 1, 1, 1, 1,
0.8013673, 1.011438, 2.553975, 1, 1, 1, 1, 1,
0.8020267, -0.9134569, 2.083815, 1, 1, 1, 1, 1,
0.8033729, 0.5928221, 0.8884149, 1, 1, 1, 1, 1,
0.8053862, -0.220661, 1.714414, 1, 1, 1, 1, 1,
0.8086612, -1.589089, 3.534559, 1, 1, 1, 1, 1,
0.8092096, 0.6605282, 2.707985, 1, 1, 1, 1, 1,
0.8101584, 0.1139917, 2.818146, 0, 0, 1, 1, 1,
0.8184887, 0.06868353, 3.429193, 1, 0, 0, 1, 1,
0.8302481, 1.028588, 0.04245749, 1, 0, 0, 1, 1,
0.831311, 0.8683774, 1.502725, 1, 0, 0, 1, 1,
0.8315882, 0.4116131, 1.395744, 1, 0, 0, 1, 1,
0.8432674, 0.9294382, 3.042125, 1, 0, 0, 1, 1,
0.8438123, 1.387138, 1.7353, 0, 0, 0, 1, 1,
0.8443323, -0.1832793, -0.06833725, 0, 0, 0, 1, 1,
0.8466299, -1.819391, 2.161632, 0, 0, 0, 1, 1,
0.8472189, -1.066795, 2.27447, 0, 0, 0, 1, 1,
0.8514179, 2.208007, 0.9945195, 0, 0, 0, 1, 1,
0.8612331, 0.4457538, 1.377204, 0, 0, 0, 1, 1,
0.8623276, 1.641077, 0.1854545, 0, 0, 0, 1, 1,
0.8646436, 0.06412775, 2.155468, 1, 1, 1, 1, 1,
0.8752947, -0.04509716, 0.4150146, 1, 1, 1, 1, 1,
0.8759797, -0.1484507, -0.3018991, 1, 1, 1, 1, 1,
0.8787594, 0.992115, 1.521039, 1, 1, 1, 1, 1,
0.8823532, -0.4712249, 0.7852043, 1, 1, 1, 1, 1,
0.8860957, -0.03250303, 2.69594, 1, 1, 1, 1, 1,
0.887953, -0.08514259, 1.32529, 1, 1, 1, 1, 1,
0.9022117, -1.647829, 1.608897, 1, 1, 1, 1, 1,
0.9073142, -0.616956, 2.280566, 1, 1, 1, 1, 1,
0.9143848, 1.001998, 0.2425577, 1, 1, 1, 1, 1,
0.9190133, 0.08707735, 1.240731, 1, 1, 1, 1, 1,
0.9206173, -0.3447946, 0.545001, 1, 1, 1, 1, 1,
0.9222573, -1.38978, 1.749754, 1, 1, 1, 1, 1,
0.9231212, 0.6787671, 1.069901, 1, 1, 1, 1, 1,
0.9307469, -0.3234628, 1.915494, 1, 1, 1, 1, 1,
0.9315861, -0.8552224, 1.667602, 0, 0, 1, 1, 1,
0.9324759, -0.7887393, 1.084857, 1, 0, 0, 1, 1,
0.9362579, 0.8171933, 1.898707, 1, 0, 0, 1, 1,
0.9371643, -1.125536, 2.822363, 1, 0, 0, 1, 1,
0.9401239, 1.036587, -0.1647875, 1, 0, 0, 1, 1,
0.9431735, 0.3757014, 0.410357, 1, 0, 0, 1, 1,
0.9435381, 0.9470217, 0.6157249, 0, 0, 0, 1, 1,
0.9452369, -1.027364, 2.61494, 0, 0, 0, 1, 1,
0.9465029, -0.3430115, 1.371502, 0, 0, 0, 1, 1,
0.9488128, 1.441684, -0.1272441, 0, 0, 0, 1, 1,
0.9523591, -1.013418, 1.295137, 0, 0, 0, 1, 1,
0.953375, 1.27253, -0.8644031, 0, 0, 0, 1, 1,
0.9557433, 1.176416, -1.003904, 0, 0, 0, 1, 1,
0.9569204, -1.176408, 0.6361234, 1, 1, 1, 1, 1,
0.9592174, -0.4164796, 3.085286, 1, 1, 1, 1, 1,
0.9730076, -1.098327, 1.973223, 1, 1, 1, 1, 1,
0.97333, 0.005988144, 1.453626, 1, 1, 1, 1, 1,
0.9741278, -0.4887035, -0.03119379, 1, 1, 1, 1, 1,
0.9748377, 0.793573, 1.738673, 1, 1, 1, 1, 1,
0.9825845, 0.6630943, 1.062234, 1, 1, 1, 1, 1,
0.9847268, 0.2545312, 2.289244, 1, 1, 1, 1, 1,
0.986192, 1.645419, -0.9055651, 1, 1, 1, 1, 1,
0.9917916, -0.8862303, 1.091946, 1, 1, 1, 1, 1,
0.9923005, -1.613663, 2.486035, 1, 1, 1, 1, 1,
0.9975272, -0.2481859, 1.702093, 1, 1, 1, 1, 1,
0.9988599, 0.213171, 1.778785, 1, 1, 1, 1, 1,
1.001279, -1.091778, 3.743071, 1, 1, 1, 1, 1,
1.008469, -0.1998688, 2.661638, 1, 1, 1, 1, 1,
1.01504, -0.9908225, 2.466, 0, 0, 1, 1, 1,
1.015787, 1.14953, 0.04520907, 1, 0, 0, 1, 1,
1.01771, -0.373682, 2.304024, 1, 0, 0, 1, 1,
1.021318, -1.120019, 1.984555, 1, 0, 0, 1, 1,
1.026073, 0.9484461, 0.9456829, 1, 0, 0, 1, 1,
1.028893, -1.219102, 0.2862978, 1, 0, 0, 1, 1,
1.029537, 0.3706402, 1.505938, 0, 0, 0, 1, 1,
1.033683, -0.2732824, 0.1041361, 0, 0, 0, 1, 1,
1.04234, 0.3228308, 0.4303315, 0, 0, 0, 1, 1,
1.049084, 1.288553, 3.133039, 0, 0, 0, 1, 1,
1.050557, -0.5649022, 2.103635, 0, 0, 0, 1, 1,
1.062572, 0.8283821, 2.035807, 0, 0, 0, 1, 1,
1.063874, -0.776763, 3.440592, 0, 0, 0, 1, 1,
1.082079, 1.389529, 1.820826, 1, 1, 1, 1, 1,
1.09428, 0.1312621, 2.410469, 1, 1, 1, 1, 1,
1.096925, 0.3465462, 2.338364, 1, 1, 1, 1, 1,
1.09802, -0.2371518, 0.1835363, 1, 1, 1, 1, 1,
1.102215, -0.3645927, 2.574936, 1, 1, 1, 1, 1,
1.112749, 0.2309077, 1.091581, 1, 1, 1, 1, 1,
1.118629, 0.683193, 0.5938514, 1, 1, 1, 1, 1,
1.119461, 0.002235103, 1.366445, 1, 1, 1, 1, 1,
1.130854, 0.6137007, -1.908506, 1, 1, 1, 1, 1,
1.131479, 0.4987302, 0.8484749, 1, 1, 1, 1, 1,
1.139096, -0.2230641, -0.4664008, 1, 1, 1, 1, 1,
1.140012, -0.5672053, 2.422055, 1, 1, 1, 1, 1,
1.144625, 0.5489752, 1.546853, 1, 1, 1, 1, 1,
1.149698, 0.1636409, 1.39479, 1, 1, 1, 1, 1,
1.149948, -0.1036281, 3.399729, 1, 1, 1, 1, 1,
1.156365, 1.115692, 0.4785807, 0, 0, 1, 1, 1,
1.157595, 2.778411, 0.447018, 1, 0, 0, 1, 1,
1.162032, 0.6251023, -0.5673874, 1, 0, 0, 1, 1,
1.166655, -0.5436035, 2.514246, 1, 0, 0, 1, 1,
1.169845, -0.3128869, 2.19204, 1, 0, 0, 1, 1,
1.175276, 2.884873, 0.4822448, 1, 0, 0, 1, 1,
1.17554, -1.101406, 4.250397, 0, 0, 0, 1, 1,
1.189278, -0.09272747, 2.00212, 0, 0, 0, 1, 1,
1.194341, -0.1374031, 2.664696, 0, 0, 0, 1, 1,
1.196205, -0.6473442, 0.7754111, 0, 0, 0, 1, 1,
1.196766, 0.3796954, 0.4478736, 0, 0, 0, 1, 1,
1.210456, -0.08604465, 0.5802504, 0, 0, 0, 1, 1,
1.213448, -0.004518184, 3.444613, 0, 0, 0, 1, 1,
1.218547, 0.2283975, 0.5424381, 1, 1, 1, 1, 1,
1.232383, 0.6238768, 1.373023, 1, 1, 1, 1, 1,
1.24734, -1.516586, 2.342547, 1, 1, 1, 1, 1,
1.256395, 0.5624407, 1.90043, 1, 1, 1, 1, 1,
1.262141, 1.255071, 1.889432, 1, 1, 1, 1, 1,
1.264028, -0.2420048, 1.03668, 1, 1, 1, 1, 1,
1.264264, -0.3092022, 0.86175, 1, 1, 1, 1, 1,
1.265482, -0.4348091, 2.968987, 1, 1, 1, 1, 1,
1.266489, -1.003386, 1.407057, 1, 1, 1, 1, 1,
1.266754, -0.1133729, 3.529587, 1, 1, 1, 1, 1,
1.268703, -1.819577, 3.02042, 1, 1, 1, 1, 1,
1.271126, -0.7007356, 2.206453, 1, 1, 1, 1, 1,
1.272226, 1.11845, 0.002630554, 1, 1, 1, 1, 1,
1.272479, 0.5856016, 0.3595314, 1, 1, 1, 1, 1,
1.272719, -0.3120016, 1.963293, 1, 1, 1, 1, 1,
1.286531, -1.194265, 1.476972, 0, 0, 1, 1, 1,
1.286616, 1.993852, -0.1984145, 1, 0, 0, 1, 1,
1.289288, -0.3036519, 1.78964, 1, 0, 0, 1, 1,
1.298656, 0.3482869, 2.197268, 1, 0, 0, 1, 1,
1.314705, -0.3634374, 1.627102, 1, 0, 0, 1, 1,
1.316167, -1.197351, 0.9981015, 1, 0, 0, 1, 1,
1.323227, 1.507606, 0.1752314, 0, 0, 0, 1, 1,
1.341202, -1.177105, 4.268339, 0, 0, 0, 1, 1,
1.346422, -1.059065, 3.460074, 0, 0, 0, 1, 1,
1.354945, 0.6677085, 2.019624, 0, 0, 0, 1, 1,
1.356139, 0.3757491, 3.004355, 0, 0, 0, 1, 1,
1.363241, -0.3381114, 0.65884, 0, 0, 0, 1, 1,
1.367373, -1.667952, 1.988624, 0, 0, 0, 1, 1,
1.368326, -1.5697, 2.8309, 1, 1, 1, 1, 1,
1.373735, -0.1101158, 1.134457, 1, 1, 1, 1, 1,
1.37643, 0.5553114, 0.4711393, 1, 1, 1, 1, 1,
1.38077, 1.080312, 1.504159, 1, 1, 1, 1, 1,
1.381003, -1.506698, 2.034564, 1, 1, 1, 1, 1,
1.392991, 0.1665903, 2.000787, 1, 1, 1, 1, 1,
1.39804, -1.581005, 2.233706, 1, 1, 1, 1, 1,
1.410705, 0.4223394, 0.8981033, 1, 1, 1, 1, 1,
1.414695, 1.260999, -0.7249237, 1, 1, 1, 1, 1,
1.415664, -1.080353, 2.930904, 1, 1, 1, 1, 1,
1.420697, -0.4974782, 2.296395, 1, 1, 1, 1, 1,
1.421702, 1.516018, 1.311141, 1, 1, 1, 1, 1,
1.423955, 0.3934308, 0.9736831, 1, 1, 1, 1, 1,
1.438433, 0.7485712, 2.415816, 1, 1, 1, 1, 1,
1.442958, -1.20605, 2.380802, 1, 1, 1, 1, 1,
1.446261, -1.645806, 4.75978, 0, 0, 1, 1, 1,
1.455402, 0.8046023, 2.349289, 1, 0, 0, 1, 1,
1.458628, 1.513016, 1.488798, 1, 0, 0, 1, 1,
1.460232, -0.05238752, 0.7177904, 1, 0, 0, 1, 1,
1.473089, 0.04188943, 2.358896, 1, 0, 0, 1, 1,
1.480982, -0.3905644, 0.2518734, 1, 0, 0, 1, 1,
1.508577, 1.999054, 1.223049, 0, 0, 0, 1, 1,
1.509764, 0.6194555, 0.3903708, 0, 0, 0, 1, 1,
1.511547, -1.013936, 0.807632, 0, 0, 0, 1, 1,
1.52355, -0.4172929, 1.381792, 0, 0, 0, 1, 1,
1.529508, -0.7865124, 2.866448, 0, 0, 0, 1, 1,
1.533184, -0.4758507, 1.418055, 0, 0, 0, 1, 1,
1.542887, -1.234153, 2.477431, 0, 0, 0, 1, 1,
1.547803, 0.5583495, 0.3708979, 1, 1, 1, 1, 1,
1.56202, -0.3868525, 0.07714949, 1, 1, 1, 1, 1,
1.572625, 1.904577, 0.974652, 1, 1, 1, 1, 1,
1.578119, 1.507737, 0.1650964, 1, 1, 1, 1, 1,
1.582792, -0.5750406, 1.328633, 1, 1, 1, 1, 1,
1.607557, 0.5951858, 1.585568, 1, 1, 1, 1, 1,
1.614695, -0.8584369, 0.9578464, 1, 1, 1, 1, 1,
1.620867, 1.719441, 0.5948616, 1, 1, 1, 1, 1,
1.684494, -0.1978953, 0.3922225, 1, 1, 1, 1, 1,
1.684619, 0.7640597, 0.248216, 1, 1, 1, 1, 1,
1.692875, -0.331564, 2.259248, 1, 1, 1, 1, 1,
1.695185, -1.870119, 2.156255, 1, 1, 1, 1, 1,
1.702935, -0.4857383, 2.790357, 1, 1, 1, 1, 1,
1.703456, -0.8340746, 1.923204, 1, 1, 1, 1, 1,
1.713958, 0.3908935, 0.8053392, 1, 1, 1, 1, 1,
1.726755, -1.686036, 3.114263, 0, 0, 1, 1, 1,
1.736665, 0.3555433, 1.463247, 1, 0, 0, 1, 1,
1.737413, -0.1668163, 2.503785, 1, 0, 0, 1, 1,
1.74636, 1.275388, 2.512394, 1, 0, 0, 1, 1,
1.784834, -0.02250902, 2.226253, 1, 0, 0, 1, 1,
1.811983, 0.2989808, 1.288822, 1, 0, 0, 1, 1,
1.814106, -1.462149, 2.505824, 0, 0, 0, 1, 1,
1.814885, -2.024809, 2.719381, 0, 0, 0, 1, 1,
1.845128, 0.5659577, 0.4163326, 0, 0, 0, 1, 1,
1.855417, 1.232223, 4.020983, 0, 0, 0, 1, 1,
1.864208, 1.171589, 0.1625854, 0, 0, 0, 1, 1,
1.874128, -0.5987179, 2.161833, 0, 0, 0, 1, 1,
1.88976, -0.5318144, 3.756495, 0, 0, 0, 1, 1,
1.893061, -0.1275768, 1.524957, 1, 1, 1, 1, 1,
1.905958, -1.166851, 2.354823, 1, 1, 1, 1, 1,
1.914511, 0.3815469, -0.3251204, 1, 1, 1, 1, 1,
1.915648, 1.545835, 2.598293, 1, 1, 1, 1, 1,
1.93585, 0.436303, 1.933668, 1, 1, 1, 1, 1,
1.941984, 1.004409, 1.654697, 1, 1, 1, 1, 1,
1.956895, -0.5864376, 2.597342, 1, 1, 1, 1, 1,
1.960317, -0.8108419, 1.272725, 1, 1, 1, 1, 1,
1.961298, -0.9579961, 2.5894, 1, 1, 1, 1, 1,
1.966044, 0.2534904, 1.089424, 1, 1, 1, 1, 1,
1.967776, 0.608752, 1.522834, 1, 1, 1, 1, 1,
1.982678, 0.4007417, 2.386312, 1, 1, 1, 1, 1,
2.002375, -0.8080574, 2.739501, 1, 1, 1, 1, 1,
2.028044, -0.2875573, 3.438307, 1, 1, 1, 1, 1,
2.032759, 1.34562, 2.687249, 1, 1, 1, 1, 1,
2.035934, -0.7507088, 1.566297, 0, 0, 1, 1, 1,
2.044551, -0.3731996, 1.780218, 1, 0, 0, 1, 1,
2.0878, 0.2906564, 0.7723619, 1, 0, 0, 1, 1,
2.131575, -0.7614793, 1.875444, 1, 0, 0, 1, 1,
2.135706, 0.2922676, 2.352371, 1, 0, 0, 1, 1,
2.161771, -0.6076371, 1.927513, 1, 0, 0, 1, 1,
2.16276, -0.5927615, 2.537194, 0, 0, 0, 1, 1,
2.210464, -0.5119481, -0.4929287, 0, 0, 0, 1, 1,
2.212335, -1.132253, 5.060851, 0, 0, 0, 1, 1,
2.219935, 0.9469775, 1.679512, 0, 0, 0, 1, 1,
2.24358, 1.176082, 1.359968, 0, 0, 0, 1, 1,
2.290272, 0.7578686, 1.720576, 0, 0, 0, 1, 1,
2.35691, -0.4754277, 2.55965, 0, 0, 0, 1, 1,
2.43618, -0.973282, 4.077079, 1, 1, 1, 1, 1,
2.586398, -0.6057137, 0.906204, 1, 1, 1, 1, 1,
2.666011, -0.06231032, 1.520752, 1, 1, 1, 1, 1,
2.853064, 1.092924, 2.143744, 1, 1, 1, 1, 1,
2.992428, -0.04608125, 1.182855, 1, 1, 1, 1, 1,
3.096265, -0.2724141, 1.913403, 1, 1, 1, 1, 1,
3.207448, 0.9322208, 0.7613033, 1, 1, 1, 1, 1
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
var radius = 9.199351;
var distance = 32.31233;
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
mvMatrix.translate( 0.007951736, 0.1308773, -0.09060836 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.31233);
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
