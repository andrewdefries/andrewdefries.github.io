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
-3.104536, -0.349555, -1.369486, 1, 0, 0, 1,
-3.100161, 0.09161934, -2.93815, 1, 0.007843138, 0, 1,
-2.887557, 0.4165881, -2.684247, 1, 0.01176471, 0, 1,
-2.845493, 0.02824076, -1.619818, 1, 0.01960784, 0, 1,
-2.735986, -0.2147856, -1.222877, 1, 0.02352941, 0, 1,
-2.730353, 0.2856672, -1.755418, 1, 0.03137255, 0, 1,
-2.718565, 0.9434097, -0.8014782, 1, 0.03529412, 0, 1,
-2.654764, 0.1909101, -0.2676849, 1, 0.04313726, 0, 1,
-2.608938, -0.4659865, -1.445517, 1, 0.04705882, 0, 1,
-2.573544, 0.9946523, -0.3208369, 1, 0.05490196, 0, 1,
-2.501676, 1.46305, -1.555644, 1, 0.05882353, 0, 1,
-2.484884, -0.6785396, -2.924324, 1, 0.06666667, 0, 1,
-2.483218, -1.049372, -3.88793, 1, 0.07058824, 0, 1,
-2.470516, -0.398728, -1.96173, 1, 0.07843138, 0, 1,
-2.415595, 1.612683, -0.7521333, 1, 0.08235294, 0, 1,
-2.415483, -0.2754606, -0.8335629, 1, 0.09019608, 0, 1,
-2.318288, -0.3287126, -3.639452, 1, 0.09411765, 0, 1,
-2.309021, -0.7159848, -2.463722, 1, 0.1019608, 0, 1,
-2.290462, -0.01402139, 0.2049527, 1, 0.1098039, 0, 1,
-2.251111, -0.8600554, -3.033095, 1, 0.1137255, 0, 1,
-2.220895, 0.8116618, -1.487308, 1, 0.1215686, 0, 1,
-2.201697, 0.9959653, -1.630837, 1, 0.1254902, 0, 1,
-2.158362, 0.9953654, -3.548535, 1, 0.1333333, 0, 1,
-2.146441, 0.8291966, -1.21884, 1, 0.1372549, 0, 1,
-2.102437, 0.6581541, 1.203005, 1, 0.145098, 0, 1,
-2.087978, -0.4697675, -2.563746, 1, 0.1490196, 0, 1,
-2.063679, -1.299736, -2.653432, 1, 0.1568628, 0, 1,
-2.032594, -1.000932, -3.30425, 1, 0.1607843, 0, 1,
-2.029397, 0.2905963, -2.35798, 1, 0.1686275, 0, 1,
-2.001723, -0.9074441, -3.165742, 1, 0.172549, 0, 1,
-1.9729, 0.6047069, -1.238104, 1, 0.1803922, 0, 1,
-1.968386, 0.5923268, -1.8651, 1, 0.1843137, 0, 1,
-1.965893, 0.6307531, -3.231627, 1, 0.1921569, 0, 1,
-1.961572, -0.365828, -2.310244, 1, 0.1960784, 0, 1,
-1.946317, -1.030398, -0.4503366, 1, 0.2039216, 0, 1,
-1.909433, 2.074716, 0.3421105, 1, 0.2117647, 0, 1,
-1.897639, -0.4929022, -2.110163, 1, 0.2156863, 0, 1,
-1.891556, 0.01008373, -1.121738, 1, 0.2235294, 0, 1,
-1.853291, 0.3217831, -0.999329, 1, 0.227451, 0, 1,
-1.837094, 0.1128975, -1.180459, 1, 0.2352941, 0, 1,
-1.827961, 0.1780904, -1.689477, 1, 0.2392157, 0, 1,
-1.827441, 0.1458958, -1.322329, 1, 0.2470588, 0, 1,
-1.821923, -0.455008, -1.990914, 1, 0.2509804, 0, 1,
-1.816791, -0.3367316, -1.846982, 1, 0.2588235, 0, 1,
-1.806198, -0.4672447, -1.329606, 1, 0.2627451, 0, 1,
-1.804023, -0.3978126, -1.120527, 1, 0.2705882, 0, 1,
-1.793934, 0.09708201, -3.023233, 1, 0.2745098, 0, 1,
-1.79183, -0.5261829, -2.283815, 1, 0.282353, 0, 1,
-1.791357, -0.05218485, -2.45169, 1, 0.2862745, 0, 1,
-1.761664, -0.8928314, -0.4959852, 1, 0.2941177, 0, 1,
-1.754564, -1.004626, -0.002745981, 1, 0.3019608, 0, 1,
-1.74406, 1.040487, 0.934306, 1, 0.3058824, 0, 1,
-1.72397, -0.2009863, -2.579445, 1, 0.3137255, 0, 1,
-1.70825, -1.772883, -3.057601, 1, 0.3176471, 0, 1,
-1.690477, 0.4127501, -0.6052958, 1, 0.3254902, 0, 1,
-1.68977, -0.819539, -1.143489, 1, 0.3294118, 0, 1,
-1.68018, -0.5664026, -0.1397456, 1, 0.3372549, 0, 1,
-1.673801, 1.205467, -0.70557, 1, 0.3411765, 0, 1,
-1.671237, 0.08099518, -1.390118, 1, 0.3490196, 0, 1,
-1.650526, -0.3555977, -1.173656, 1, 0.3529412, 0, 1,
-1.643628, 0.7521498, 0.2389907, 1, 0.3607843, 0, 1,
-1.620843, -0.02468462, -0.6282286, 1, 0.3647059, 0, 1,
-1.619073, -0.5727487, -0.8945214, 1, 0.372549, 0, 1,
-1.604627, -0.8133447, -2.80968, 1, 0.3764706, 0, 1,
-1.589986, -0.2541252, -0.1058295, 1, 0.3843137, 0, 1,
-1.58726, -0.9329539, -0.5577099, 1, 0.3882353, 0, 1,
-1.57862, -0.6647891, -2.415844, 1, 0.3960784, 0, 1,
-1.570777, 0.1889966, -2.480263, 1, 0.4039216, 0, 1,
-1.563333, 0.4219475, -1.108362, 1, 0.4078431, 0, 1,
-1.549781, -0.7589052, -2.325325, 1, 0.4156863, 0, 1,
-1.544053, -2.797645, -5.144249, 1, 0.4196078, 0, 1,
-1.535233, 0.1807645, -2.635321, 1, 0.427451, 0, 1,
-1.532256, 0.7193925, -2.4797, 1, 0.4313726, 0, 1,
-1.528057, -1.169363, -2.73579, 1, 0.4392157, 0, 1,
-1.525851, 0.1521114, -2.848263, 1, 0.4431373, 0, 1,
-1.523226, 1.832098, -1.868203, 1, 0.4509804, 0, 1,
-1.50917, 3.666199, -1.347994, 1, 0.454902, 0, 1,
-1.504668, -0.318572, -2.94152, 1, 0.4627451, 0, 1,
-1.493648, 1.546609, -3.621057, 1, 0.4666667, 0, 1,
-1.490383, -0.8581127, -2.808014, 1, 0.4745098, 0, 1,
-1.488993, -0.2320572, -1.284729, 1, 0.4784314, 0, 1,
-1.48613, 0.3325844, -1.909622, 1, 0.4862745, 0, 1,
-1.484122, 0.2796634, -2.238, 1, 0.4901961, 0, 1,
-1.461022, -1.329612, -1.042266, 1, 0.4980392, 0, 1,
-1.455175, -0.3192382, -3.402832, 1, 0.5058824, 0, 1,
-1.451367, -0.01747813, -2.982962, 1, 0.509804, 0, 1,
-1.447986, 0.0144986, -1.776563, 1, 0.5176471, 0, 1,
-1.440851, -0.9383715, -1.257594, 1, 0.5215687, 0, 1,
-1.438113, -1.004333, -2.760465, 1, 0.5294118, 0, 1,
-1.436921, -0.4972179, -2.265206, 1, 0.5333334, 0, 1,
-1.429523, -0.4286989, -2.950567, 1, 0.5411765, 0, 1,
-1.405395, -0.1000226, -1.230825, 1, 0.5450981, 0, 1,
-1.404099, 0.2397722, 2.223595, 1, 0.5529412, 0, 1,
-1.389369, -1.868477, -3.717807, 1, 0.5568628, 0, 1,
-1.381209, 0.3868096, -1.377493, 1, 0.5647059, 0, 1,
-1.372372, -0.6633655, -1.292937, 1, 0.5686275, 0, 1,
-1.367863, -1.349297, -3.299799, 1, 0.5764706, 0, 1,
-1.365881, 1.413564, -0.4283382, 1, 0.5803922, 0, 1,
-1.355671, 0.7827591, -2.104713, 1, 0.5882353, 0, 1,
-1.349915, 1.024854, -2.056058, 1, 0.5921569, 0, 1,
-1.346564, -0.8580463, -2.195027, 1, 0.6, 0, 1,
-1.343719, 0.5954458, -0.1664013, 1, 0.6078432, 0, 1,
-1.340853, 0.9133263, -0.7487698, 1, 0.6117647, 0, 1,
-1.337126, -1.40138, -2.539502, 1, 0.6196079, 0, 1,
-1.33099, 0.3362339, -1.44065, 1, 0.6235294, 0, 1,
-1.326012, -1.764139, -2.304726, 1, 0.6313726, 0, 1,
-1.323139, -0.4459286, 0.1087809, 1, 0.6352941, 0, 1,
-1.322137, -0.8358073, -2.294795, 1, 0.6431373, 0, 1,
-1.311904, 0.2460661, -0.4613833, 1, 0.6470588, 0, 1,
-1.310417, -0.8798292, -2.438332, 1, 0.654902, 0, 1,
-1.309161, -0.6812489, -1.967759, 1, 0.6588235, 0, 1,
-1.308964, 0.585939, 1.034612, 1, 0.6666667, 0, 1,
-1.308848, -0.6539909, -1.801949, 1, 0.6705883, 0, 1,
-1.295913, -1.03527, -3.051987, 1, 0.6784314, 0, 1,
-1.277715, 1.020756, 1.293876, 1, 0.682353, 0, 1,
-1.272538, 1.202944, -0.9822562, 1, 0.6901961, 0, 1,
-1.267054, -0.02908706, 0.1355551, 1, 0.6941177, 0, 1,
-1.266567, 0.9919685, 0.524561, 1, 0.7019608, 0, 1,
-1.266193, 0.8697904, -0.3079608, 1, 0.7098039, 0, 1,
-1.261729, -0.1223478, -1.907688, 1, 0.7137255, 0, 1,
-1.260599, -0.5532497, -0.3863316, 1, 0.7215686, 0, 1,
-1.245535, 0.5869297, -0.3671521, 1, 0.7254902, 0, 1,
-1.243377, 0.0883198, -1.699667, 1, 0.7333333, 0, 1,
-1.237769, -0.837643, -2.048287, 1, 0.7372549, 0, 1,
-1.226032, -0.9585342, -2.07332, 1, 0.7450981, 0, 1,
-1.218086, 0.04820785, -1.77247, 1, 0.7490196, 0, 1,
-1.204156, 0.4533776, -0.1417036, 1, 0.7568628, 0, 1,
-1.182705, -0.8021565, -2.414318, 1, 0.7607843, 0, 1,
-1.173538, 0.4764906, -1.310397, 1, 0.7686275, 0, 1,
-1.162901, 0.59972, -1.077897, 1, 0.772549, 0, 1,
-1.149069, 1.205854, 1.275144, 1, 0.7803922, 0, 1,
-1.1439, 0.2646385, -0.6638461, 1, 0.7843137, 0, 1,
-1.134516, -1.056262, -1.059388, 1, 0.7921569, 0, 1,
-1.125024, 0.2868718, -3.027459, 1, 0.7960784, 0, 1,
-1.11029, 0.8241572, -2.175715, 1, 0.8039216, 0, 1,
-1.097256, -0.9529291, -1.34826, 1, 0.8117647, 0, 1,
-1.092443, -0.7140824, -2.298224, 1, 0.8156863, 0, 1,
-1.090586, 0.9746089, -0.1791837, 1, 0.8235294, 0, 1,
-1.08436, 0.9788186, -0.3243727, 1, 0.827451, 0, 1,
-1.08164, -0.9922109, -1.7999, 1, 0.8352941, 0, 1,
-1.076378, -0.7207718, -1.960638, 1, 0.8392157, 0, 1,
-1.068461, 1.060121, -0.8493038, 1, 0.8470588, 0, 1,
-1.065067, 0.8131456, 0.1775326, 1, 0.8509804, 0, 1,
-1.061959, -0.6034579, 0.4413278, 1, 0.8588235, 0, 1,
-1.059005, 1.197832, -1.235232, 1, 0.8627451, 0, 1,
-1.057788, -0.3295136, -1.819504, 1, 0.8705882, 0, 1,
-1.057506, -0.8437244, -0.9035161, 1, 0.8745098, 0, 1,
-1.051483, 0.5118655, 0.3318639, 1, 0.8823529, 0, 1,
-1.039628, 0.4007384, -2.116011, 1, 0.8862745, 0, 1,
-1.03823, -1.388272, -3.179792, 1, 0.8941177, 0, 1,
-1.035311, -0.268549, -3.446724, 1, 0.8980392, 0, 1,
-1.03103, -0.3678894, -2.012721, 1, 0.9058824, 0, 1,
-1.030313, -0.1122308, -1.807683, 1, 0.9137255, 0, 1,
-1.029634, -0.3031838, -1.342489, 1, 0.9176471, 0, 1,
-1.018383, -0.402323, -1.891883, 1, 0.9254902, 0, 1,
-1.010139, -0.8716102, -1.415403, 1, 0.9294118, 0, 1,
-1.009196, -0.5482204, -0.9861066, 1, 0.9372549, 0, 1,
-1.005738, 0.05699969, -1.031065, 1, 0.9411765, 0, 1,
-1.001121, 0.2622945, -1.590227, 1, 0.9490196, 0, 1,
-0.9906592, 0.2445385, -3.621552, 1, 0.9529412, 0, 1,
-0.9865835, 0.7534907, -2.071514, 1, 0.9607843, 0, 1,
-0.9809427, -0.02496197, -0.7018351, 1, 0.9647059, 0, 1,
-0.9694502, 0.09854452, -2.82027, 1, 0.972549, 0, 1,
-0.9692881, 1.844798, 0.2856193, 1, 0.9764706, 0, 1,
-0.9645664, 2.251239, -1.263911, 1, 0.9843137, 0, 1,
-0.9563836, -0.8161452, -2.621002, 1, 0.9882353, 0, 1,
-0.9553584, 1.220118, -0.002874824, 1, 0.9960784, 0, 1,
-0.9550503, -0.2549393, -2.399521, 0.9960784, 1, 0, 1,
-0.9534901, 0.4703009, -0.5835249, 0.9921569, 1, 0, 1,
-0.948023, -0.0382649, -1.059213, 0.9843137, 1, 0, 1,
-0.9456995, 1.401227, 1.908393, 0.9803922, 1, 0, 1,
-0.9335479, -0.1030428, -0.888769, 0.972549, 1, 0, 1,
-0.9303579, -0.1375272, -0.9174215, 0.9686275, 1, 0, 1,
-0.9275359, -1.566418, -2.086947, 0.9607843, 1, 0, 1,
-0.9268182, -0.05250683, -3.148524, 0.9568627, 1, 0, 1,
-0.926105, 1.294219, 1.162087, 0.9490196, 1, 0, 1,
-0.9244409, 1.00413, -1.509146, 0.945098, 1, 0, 1,
-0.9227101, -1.450713, -3.700936, 0.9372549, 1, 0, 1,
-0.9223004, 1.256906, -1.025975, 0.9333333, 1, 0, 1,
-0.9210349, -0.3851018, -2.727234, 0.9254902, 1, 0, 1,
-0.9206119, 0.9769182, -0.5738081, 0.9215686, 1, 0, 1,
-0.9200076, 0.4472287, -1.912071, 0.9137255, 1, 0, 1,
-0.9187432, -1.681843, -3.429241, 0.9098039, 1, 0, 1,
-0.9181948, 0.2883441, -2.718709, 0.9019608, 1, 0, 1,
-0.9181063, -0.6495407, -1.911374, 0.8941177, 1, 0, 1,
-0.9160953, 0.1205322, -0.5001676, 0.8901961, 1, 0, 1,
-0.9125285, -0.4042152, -1.578128, 0.8823529, 1, 0, 1,
-0.9114963, -0.4250886, -0.7165644, 0.8784314, 1, 0, 1,
-0.9107393, -1.887957, -4.238193, 0.8705882, 1, 0, 1,
-0.9061383, 0.1870685, -2.543188, 0.8666667, 1, 0, 1,
-0.9010329, 0.4193128, -0.1083879, 0.8588235, 1, 0, 1,
-0.8961698, -1.516504, -2.888636, 0.854902, 1, 0, 1,
-0.8869686, 0.5445538, -2.927996, 0.8470588, 1, 0, 1,
-0.8797815, 0.3020678, -2.135901, 0.8431373, 1, 0, 1,
-0.879487, 0.1240662, -1.656288, 0.8352941, 1, 0, 1,
-0.877519, 0.7967426, -1.05094, 0.8313726, 1, 0, 1,
-0.8769644, 0.1296953, 0.1377975, 0.8235294, 1, 0, 1,
-0.8738093, -0.4186442, -4.252502, 0.8196079, 1, 0, 1,
-0.8733225, -1.244425, -3.229029, 0.8117647, 1, 0, 1,
-0.8684407, 1.558915, -2.029075, 0.8078431, 1, 0, 1,
-0.8676901, 1.196752, -1.370472, 0.8, 1, 0, 1,
-0.8661855, 0.3300583, -1.898406, 0.7921569, 1, 0, 1,
-0.8602419, -0.5809315, -2.510949, 0.7882353, 1, 0, 1,
-0.8567665, 0.1704618, 0.1573369, 0.7803922, 1, 0, 1,
-0.8549706, 0.2127631, -2.696676, 0.7764706, 1, 0, 1,
-0.85233, 0.4309025, 0.00986266, 0.7686275, 1, 0, 1,
-0.8502514, 0.6037132, -0.7542726, 0.7647059, 1, 0, 1,
-0.8489885, 0.4219167, -1.948605, 0.7568628, 1, 0, 1,
-0.8448374, 0.5489128, -0.6856539, 0.7529412, 1, 0, 1,
-0.8412374, 0.3939621, -1.262756, 0.7450981, 1, 0, 1,
-0.8359894, -1.893545, -2.22829, 0.7411765, 1, 0, 1,
-0.8303851, -0.5491912, -1.75587, 0.7333333, 1, 0, 1,
-0.8292741, -0.211807, -0.4657139, 0.7294118, 1, 0, 1,
-0.8264266, 1.516155, -0.5817372, 0.7215686, 1, 0, 1,
-0.8242744, 1.689658, -0.01054584, 0.7176471, 1, 0, 1,
-0.8234806, -1.376188, -4.59376, 0.7098039, 1, 0, 1,
-0.821669, 1.432168, -0.2683874, 0.7058824, 1, 0, 1,
-0.819275, -0.6977751, -2.771595, 0.6980392, 1, 0, 1,
-0.817442, -0.4396523, -2.764734, 0.6901961, 1, 0, 1,
-0.8167687, 0.08619956, -0.07144315, 0.6862745, 1, 0, 1,
-0.8166411, -0.8211998, -2.18853, 0.6784314, 1, 0, 1,
-0.8150452, 1.541494, 0.05333906, 0.6745098, 1, 0, 1,
-0.8082911, 0.3065028, -1.61531, 0.6666667, 1, 0, 1,
-0.8038346, 2.075643, -1.621042, 0.6627451, 1, 0, 1,
-0.8010583, -0.9560593, -3.494518, 0.654902, 1, 0, 1,
-0.8007527, -0.02318567, -1.796802, 0.6509804, 1, 0, 1,
-0.7983907, 0.2777424, -1.404141, 0.6431373, 1, 0, 1,
-0.7843934, -0.7686096, -1.072542, 0.6392157, 1, 0, 1,
-0.7841119, -1.260028, -2.548638, 0.6313726, 1, 0, 1,
-0.7831059, 0.9298287, -1.892451, 0.627451, 1, 0, 1,
-0.7824313, -1.633555, -4.921169, 0.6196079, 1, 0, 1,
-0.7823781, -0.1720973, -0.9561064, 0.6156863, 1, 0, 1,
-0.7816713, -0.3508303, -3.108889, 0.6078432, 1, 0, 1,
-0.7802893, 1.289682, -0.5304357, 0.6039216, 1, 0, 1,
-0.7790047, -0.538765, -1.436439, 0.5960785, 1, 0, 1,
-0.7742211, -2.076181, -2.667604, 0.5882353, 1, 0, 1,
-0.771592, 1.46612, -0.1523708, 0.5843138, 1, 0, 1,
-0.770399, -1.372461, -2.354226, 0.5764706, 1, 0, 1,
-0.7594473, -1.04664, -2.216554, 0.572549, 1, 0, 1,
-0.7591405, -0.2346504, -1.473578, 0.5647059, 1, 0, 1,
-0.7525831, 1.073242, -0.9660909, 0.5607843, 1, 0, 1,
-0.7506604, 1.800826, -0.9614841, 0.5529412, 1, 0, 1,
-0.7429692, 0.4344167, -1.830339, 0.5490196, 1, 0, 1,
-0.7382209, 0.1942898, -2.187111, 0.5411765, 1, 0, 1,
-0.7369194, 0.6675642, -1.938311, 0.5372549, 1, 0, 1,
-0.736712, -0.586472, -2.294656, 0.5294118, 1, 0, 1,
-0.7353331, -0.3356005, -2.020227, 0.5254902, 1, 0, 1,
-0.7352399, -1.974597, -4.050858, 0.5176471, 1, 0, 1,
-0.7317688, 0.4509286, -1.427529, 0.5137255, 1, 0, 1,
-0.7311208, 0.3987729, -0.9619113, 0.5058824, 1, 0, 1,
-0.7254728, -1.334314, -0.4253049, 0.5019608, 1, 0, 1,
-0.7187241, -0.760529, -1.329508, 0.4941176, 1, 0, 1,
-0.7178621, 0.5722405, 0.4000412, 0.4862745, 1, 0, 1,
-0.7176934, -1.572728, -3.598518, 0.4823529, 1, 0, 1,
-0.7146145, -1.195279, -1.185002, 0.4745098, 1, 0, 1,
-0.7127484, -1.488663, -2.79559, 0.4705882, 1, 0, 1,
-0.7001991, -1.753216, -4.532121, 0.4627451, 1, 0, 1,
-0.6992294, 0.3810916, -1.424494, 0.4588235, 1, 0, 1,
-0.6973662, -0.8761401, -4.729471, 0.4509804, 1, 0, 1,
-0.6952132, 0.2998273, -2.600243, 0.4470588, 1, 0, 1,
-0.6920563, 0.9016856, -0.8718649, 0.4392157, 1, 0, 1,
-0.6832802, -0.07202753, -0.4911369, 0.4352941, 1, 0, 1,
-0.6823393, -0.6919391, -2.451244, 0.427451, 1, 0, 1,
-0.676703, -0.2964729, -3.292507, 0.4235294, 1, 0, 1,
-0.6766381, -0.9333404, -3.821724, 0.4156863, 1, 0, 1,
-0.6756756, -0.5783348, -1.812767, 0.4117647, 1, 0, 1,
-0.672703, -0.8280684, -2.524373, 0.4039216, 1, 0, 1,
-0.6700121, -0.4807289, -1.777788, 0.3960784, 1, 0, 1,
-0.6611284, -1.005546, -1.968712, 0.3921569, 1, 0, 1,
-0.6608843, -1.554397, -2.226573, 0.3843137, 1, 0, 1,
-0.6582388, -0.7261346, -1.085636, 0.3803922, 1, 0, 1,
-0.6550863, -0.5031904, -3.890083, 0.372549, 1, 0, 1,
-0.6542379, 0.08071179, -1.670975, 0.3686275, 1, 0, 1,
-0.6502976, -1.152906, -1.677653, 0.3607843, 1, 0, 1,
-0.6479222, 0.6017302, -0.7131507, 0.3568628, 1, 0, 1,
-0.6442516, 0.559352, 0.3271735, 0.3490196, 1, 0, 1,
-0.6404132, -0.1359122, -1.656031, 0.345098, 1, 0, 1,
-0.6358892, 2.133895, -0.04563892, 0.3372549, 1, 0, 1,
-0.6327707, -1.087712, -3.625479, 0.3333333, 1, 0, 1,
-0.6206028, 0.4376538, 0.8473706, 0.3254902, 1, 0, 1,
-0.6183452, -1.622471, -3.435316, 0.3215686, 1, 0, 1,
-0.6080121, 0.03555439, -1.308759, 0.3137255, 1, 0, 1,
-0.6079191, -2.400912, -3.416008, 0.3098039, 1, 0, 1,
-0.6066455, 1.605841, -2.142529, 0.3019608, 1, 0, 1,
-0.6060165, -0.07470395, -1.534859, 0.2941177, 1, 0, 1,
-0.6052402, 0.0415176, -1.072653, 0.2901961, 1, 0, 1,
-0.600676, -2.706749, -3.402804, 0.282353, 1, 0, 1,
-0.6005322, -0.04664388, -1.004526, 0.2784314, 1, 0, 1,
-0.5944167, 1.740702, 0.2774075, 0.2705882, 1, 0, 1,
-0.5943001, -0.4365206, -2.318523, 0.2666667, 1, 0, 1,
-0.592819, -1.308144, -3.382074, 0.2588235, 1, 0, 1,
-0.5922046, -0.7504298, -1.355147, 0.254902, 1, 0, 1,
-0.5897455, -0.04289411, -2.201446, 0.2470588, 1, 0, 1,
-0.5877842, 0.7650146, 0.2776988, 0.2431373, 1, 0, 1,
-0.5861484, -0.07433435, -1.217302, 0.2352941, 1, 0, 1,
-0.5850286, -1.272065, -2.45577, 0.2313726, 1, 0, 1,
-0.5838839, -0.4633196, -3.36939, 0.2235294, 1, 0, 1,
-0.582567, -0.9418945, -1.913046, 0.2196078, 1, 0, 1,
-0.581898, -0.5647526, -2.159408, 0.2117647, 1, 0, 1,
-0.5818535, -0.9162938, -1.78071, 0.2078431, 1, 0, 1,
-0.5816035, -0.3770272, -3.366411, 0.2, 1, 0, 1,
-0.5754157, -0.7722936, -4.792961, 0.1921569, 1, 0, 1,
-0.5745934, 0.1961287, -0.0977064, 0.1882353, 1, 0, 1,
-0.5723163, 0.6988978, -0.5704482, 0.1803922, 1, 0, 1,
-0.566245, -0.8068706, -5.28173, 0.1764706, 1, 0, 1,
-0.5656701, -1.097153, -3.006599, 0.1686275, 1, 0, 1,
-0.5611818, -0.3249981, -1.214969, 0.1647059, 1, 0, 1,
-0.5478952, -0.5967407, -2.025634, 0.1568628, 1, 0, 1,
-0.542918, -1.586436, -2.599978, 0.1529412, 1, 0, 1,
-0.5423536, 1.049717, -0.8442983, 0.145098, 1, 0, 1,
-0.5398492, 1.003657, -0.6638339, 0.1411765, 1, 0, 1,
-0.5379001, -0.1105463, -1.73048, 0.1333333, 1, 0, 1,
-0.5349897, 0.5620281, -1.311947, 0.1294118, 1, 0, 1,
-0.5338057, 0.3349951, -1.167548, 0.1215686, 1, 0, 1,
-0.5328252, -1.425758, -1.601688, 0.1176471, 1, 0, 1,
-0.5310861, -0.006116503, -2.547605, 0.1098039, 1, 0, 1,
-0.52869, -0.03019526, -1.87037, 0.1058824, 1, 0, 1,
-0.5204428, 0.1034341, -2.834747, 0.09803922, 1, 0, 1,
-0.5172937, -1.89477, -3.331517, 0.09019608, 1, 0, 1,
-0.5171437, -2.598487, -3.422348, 0.08627451, 1, 0, 1,
-0.5165633, -0.4805232, -2.262925, 0.07843138, 1, 0, 1,
-0.5155178, -0.8753809, -2.055612, 0.07450981, 1, 0, 1,
-0.5154878, 0.1779141, -0.3671701, 0.06666667, 1, 0, 1,
-0.5145929, 1.229776, -0.08928154, 0.0627451, 1, 0, 1,
-0.5132455, -0.1820202, -1.150658, 0.05490196, 1, 0, 1,
-0.5113088, -0.2433952, -3.359425, 0.05098039, 1, 0, 1,
-0.5105947, -0.5771402, -3.59095, 0.04313726, 1, 0, 1,
-0.5087283, 0.5166679, 1.293799, 0.03921569, 1, 0, 1,
-0.5080677, 1.132497, 0.1624712, 0.03137255, 1, 0, 1,
-0.5013368, -0.8764999, -2.826776, 0.02745098, 1, 0, 1,
-0.4965505, -0.4752927, -2.302295, 0.01960784, 1, 0, 1,
-0.4940647, -0.7659003, -2.490281, 0.01568628, 1, 0, 1,
-0.493707, 1.360098, 0.9837344, 0.007843138, 1, 0, 1,
-0.4854293, -1.033403, -4.236317, 0.003921569, 1, 0, 1,
-0.4772767, -0.2636355, -2.554353, 0, 1, 0.003921569, 1,
-0.4761091, -0.343285, -3.749182, 0, 1, 0.01176471, 1,
-0.4715061, -0.9821865, -2.685767, 0, 1, 0.01568628, 1,
-0.4667339, -0.6927077, -0.8795711, 0, 1, 0.02352941, 1,
-0.4653557, 0.3718847, -1.487831, 0, 1, 0.02745098, 1,
-0.4646632, -0.6157004, -4.775329, 0, 1, 0.03529412, 1,
-0.4626622, 1.324312, -0.7656595, 0, 1, 0.03921569, 1,
-0.4625047, 0.4332177, -0.7507541, 0, 1, 0.04705882, 1,
-0.4622951, 0.2491698, -1.176453, 0, 1, 0.05098039, 1,
-0.4612259, -1.463151, -2.982162, 0, 1, 0.05882353, 1,
-0.460924, 0.0834335, -3.405991, 0, 1, 0.0627451, 1,
-0.4602638, -1.28632, -2.584851, 0, 1, 0.07058824, 1,
-0.4589215, -0.58621, -3.433788, 0, 1, 0.07450981, 1,
-0.4580784, -0.6201493, -2.162839, 0, 1, 0.08235294, 1,
-0.4505879, 0.02238559, -1.319241, 0, 1, 0.08627451, 1,
-0.4503613, 1.685309, 0.5182016, 0, 1, 0.09411765, 1,
-0.4471152, 1.552058, -0.5226076, 0, 1, 0.1019608, 1,
-0.4432352, 0.6035711, -1.40526, 0, 1, 0.1058824, 1,
-0.4381936, -0.07063051, -0.5597941, 0, 1, 0.1137255, 1,
-0.4347071, -1.126435, -3.125954, 0, 1, 0.1176471, 1,
-0.4342947, 0.3512718, -0.9957435, 0, 1, 0.1254902, 1,
-0.4295772, 0.8220892, -2.05338, 0, 1, 0.1294118, 1,
-0.4254596, -0.735252, -2.608594, 0, 1, 0.1372549, 1,
-0.4132555, -1.260145, -3.476361, 0, 1, 0.1411765, 1,
-0.4074692, -1.029895, -1.289867, 0, 1, 0.1490196, 1,
-0.4074194, 1.382508, -1.139128, 0, 1, 0.1529412, 1,
-0.4051925, -1.068564, -1.4122, 0, 1, 0.1607843, 1,
-0.4029263, 0.8007549, 0.07677703, 0, 1, 0.1647059, 1,
-0.4004377, 1.903534, -1.13071, 0, 1, 0.172549, 1,
-0.3982403, -0.05919724, -1.451858, 0, 1, 0.1764706, 1,
-0.3965118, 0.1207507, -1.047941, 0, 1, 0.1843137, 1,
-0.392004, -0.3158764, -1.085516, 0, 1, 0.1882353, 1,
-0.3904884, 0.6660378, -0.4572369, 0, 1, 0.1960784, 1,
-0.3870209, -0.9787865, -1.140414, 0, 1, 0.2039216, 1,
-0.3859113, -1.617059, -3.626064, 0, 1, 0.2078431, 1,
-0.3786442, -2.283511, -3.993761, 0, 1, 0.2156863, 1,
-0.3772276, -0.4431407, -3.0693, 0, 1, 0.2196078, 1,
-0.3764949, 0.4823892, -2.791954, 0, 1, 0.227451, 1,
-0.376103, -1.518842, -2.622736, 0, 1, 0.2313726, 1,
-0.3744327, 1.288265, 0.7787802, 0, 1, 0.2392157, 1,
-0.3730593, 0.009600877, -2.245258, 0, 1, 0.2431373, 1,
-0.3683843, -1.120884, -3.515469, 0, 1, 0.2509804, 1,
-0.3655869, 0.1196087, -2.065597, 0, 1, 0.254902, 1,
-0.344769, 0.2634751, -2.429282, 0, 1, 0.2627451, 1,
-0.338679, -1.203332, -2.713265, 0, 1, 0.2666667, 1,
-0.3335284, 0.8180256, -0.4694475, 0, 1, 0.2745098, 1,
-0.3311383, -0.6125326, -2.40419, 0, 1, 0.2784314, 1,
-0.3306293, -0.3094803, -4.11346, 0, 1, 0.2862745, 1,
-0.3300309, 1.047739, -0.9534925, 0, 1, 0.2901961, 1,
-0.3290912, 0.5640868, -0.8614687, 0, 1, 0.2980392, 1,
-0.3268152, 0.3934554, -1.576314, 0, 1, 0.3058824, 1,
-0.3246197, 1.54078, 0.2951933, 0, 1, 0.3098039, 1,
-0.3239163, 0.4432452, -2.429719, 0, 1, 0.3176471, 1,
-0.319111, 0.07151294, -1.860292, 0, 1, 0.3215686, 1,
-0.3157393, -0.1515705, -2.592, 0, 1, 0.3294118, 1,
-0.3152176, 0.1805538, -0.8696942, 0, 1, 0.3333333, 1,
-0.3126273, 0.7765226, -1.532715, 0, 1, 0.3411765, 1,
-0.3121073, -0.6682703, -0.2384428, 0, 1, 0.345098, 1,
-0.3088055, -1.467442, -3.649741, 0, 1, 0.3529412, 1,
-0.3073825, 0.3369408, 0.4240456, 0, 1, 0.3568628, 1,
-0.3063944, -0.220342, -2.73239, 0, 1, 0.3647059, 1,
-0.305539, 1.708646, -0.152037, 0, 1, 0.3686275, 1,
-0.3018271, 1.1134, 0.1974775, 0, 1, 0.3764706, 1,
-0.2999971, -0.1583572, -3.294668, 0, 1, 0.3803922, 1,
-0.2980711, 1.015839, -0.2562306, 0, 1, 0.3882353, 1,
-0.2961387, 0.5167188, -1.571252, 0, 1, 0.3921569, 1,
-0.295536, -0.1760076, -1.20258, 0, 1, 0.4, 1,
-0.2939576, 0.9606579, 0.1241978, 0, 1, 0.4078431, 1,
-0.2906774, 0.8415291, -1.003518, 0, 1, 0.4117647, 1,
-0.288412, 1.382426, 1.683114, 0, 1, 0.4196078, 1,
-0.2870371, 0.5648844, 0.5416601, 0, 1, 0.4235294, 1,
-0.2827612, 1.060689, -1.285512, 0, 1, 0.4313726, 1,
-0.2812538, -1.11867, -2.053593, 0, 1, 0.4352941, 1,
-0.2804613, 0.5400982, 0.2505595, 0, 1, 0.4431373, 1,
-0.2748598, 1.64178, -0.4226589, 0, 1, 0.4470588, 1,
-0.2706292, -0.09913082, -0.8744492, 0, 1, 0.454902, 1,
-0.2682084, 1.387938, 1.222595, 0, 1, 0.4588235, 1,
-0.265911, 0.6044934, -0.4849326, 0, 1, 0.4666667, 1,
-0.2629966, 0.4584757, -2.244425, 0, 1, 0.4705882, 1,
-0.2561857, -1.16085, -1.488189, 0, 1, 0.4784314, 1,
-0.2548688, 0.2930271, -1.196519, 0, 1, 0.4823529, 1,
-0.2484119, 0.5762166, 1.554906, 0, 1, 0.4901961, 1,
-0.2456937, -0.5943037, -5.509413, 0, 1, 0.4941176, 1,
-0.2438555, -1.11334, -4.469084, 0, 1, 0.5019608, 1,
-0.2384416, 0.7840663, -2.432592, 0, 1, 0.509804, 1,
-0.2337919, 0.1956493, 0.2350283, 0, 1, 0.5137255, 1,
-0.2336025, 0.01148784, -1.608946, 0, 1, 0.5215687, 1,
-0.2279222, -0.1559173, -2.096287, 0, 1, 0.5254902, 1,
-0.2213398, 0.7857672, 0.2361901, 0, 1, 0.5333334, 1,
-0.22099, -0.07949661, -1.238315, 0, 1, 0.5372549, 1,
-0.2061931, 1.007045, 0.5263365, 0, 1, 0.5450981, 1,
-0.2032619, -0.9942718, -2.665857, 0, 1, 0.5490196, 1,
-0.2009773, -0.5098289, -3.646274, 0, 1, 0.5568628, 1,
-0.2002575, -0.3806979, -4.211351, 0, 1, 0.5607843, 1,
-0.1968516, 0.1012829, -0.05067662, 0, 1, 0.5686275, 1,
-0.1966719, -1.860719, -4.803664, 0, 1, 0.572549, 1,
-0.1933757, -0.5120337, -3.950444, 0, 1, 0.5803922, 1,
-0.1900339, 0.4023208, 0.1191679, 0, 1, 0.5843138, 1,
-0.1898408, -0.9889246, -2.631353, 0, 1, 0.5921569, 1,
-0.1867753, -0.400087, -0.6852914, 0, 1, 0.5960785, 1,
-0.1824926, 0.881765, 0.5701419, 0, 1, 0.6039216, 1,
-0.1818152, 0.005808752, -2.508489, 0, 1, 0.6117647, 1,
-0.1785601, -0.2194076, -2.585229, 0, 1, 0.6156863, 1,
-0.1785075, -0.3728484, -3.688606, 0, 1, 0.6235294, 1,
-0.1767445, 0.7908022, -0.8378183, 0, 1, 0.627451, 1,
-0.1759662, 0.6964332, 0.06391868, 0, 1, 0.6352941, 1,
-0.1720488, 1.470017, 0.8040295, 0, 1, 0.6392157, 1,
-0.168183, 0.5190169, -2.874537, 0, 1, 0.6470588, 1,
-0.1623359, -0.324729, -2.921119, 0, 1, 0.6509804, 1,
-0.161853, -0.1146463, -1.437639, 0, 1, 0.6588235, 1,
-0.1585084, -0.3016417, -3.574894, 0, 1, 0.6627451, 1,
-0.1579771, -0.05187676, -1.092674, 0, 1, 0.6705883, 1,
-0.1574237, -0.2823876, -1.821264, 0, 1, 0.6745098, 1,
-0.1572377, 0.3936962, -1.468671, 0, 1, 0.682353, 1,
-0.1546873, 2.02841, 0.4907534, 0, 1, 0.6862745, 1,
-0.1531065, 0.5793115, 0.3065805, 0, 1, 0.6941177, 1,
-0.1527415, -0.6583344, -3.414435, 0, 1, 0.7019608, 1,
-0.1490563, -1.116558, -2.965512, 0, 1, 0.7058824, 1,
-0.1397274, -1.911782, -1.561796, 0, 1, 0.7137255, 1,
-0.1362608, -0.4026867, -2.3132, 0, 1, 0.7176471, 1,
-0.1357409, 0.4152748, -0.08594014, 0, 1, 0.7254902, 1,
-0.1356179, 1.170284, -1.386255, 0, 1, 0.7294118, 1,
-0.1330282, 0.8509456, 0.5457395, 0, 1, 0.7372549, 1,
-0.1314397, -0.6039831, -4.240198, 0, 1, 0.7411765, 1,
-0.128411, -2.388924, -2.618776, 0, 1, 0.7490196, 1,
-0.1274419, -0.2881649, -5.024435, 0, 1, 0.7529412, 1,
-0.1204568, 1.782882, 0.5850843, 0, 1, 0.7607843, 1,
-0.1184899, -0.1790553, -4.419973, 0, 1, 0.7647059, 1,
-0.1178763, 0.7123612, 1.235173, 0, 1, 0.772549, 1,
-0.1177828, 1.726113, -0.004500418, 0, 1, 0.7764706, 1,
-0.1166731, -0.1124787, -2.842841, 0, 1, 0.7843137, 1,
-0.1158535, -0.9010457, -1.219253, 0, 1, 0.7882353, 1,
-0.1134725, -0.4478668, -4.114349, 0, 1, 0.7960784, 1,
-0.1126657, 0.02895023, -0.1401919, 0, 1, 0.8039216, 1,
-0.1103131, 0.9432181, 0.0215417, 0, 1, 0.8078431, 1,
-0.1103026, 0.6401486, 0.04550611, 0, 1, 0.8156863, 1,
-0.1095983, -0.5840504, -3.388994, 0, 1, 0.8196079, 1,
-0.1094297, -0.2183741, -1.587075, 0, 1, 0.827451, 1,
-0.09733126, -0.4166486, -3.96467, 0, 1, 0.8313726, 1,
-0.09201006, 1.660327, 1.1739, 0, 1, 0.8392157, 1,
-0.09051782, -0.01020801, -0.5894906, 0, 1, 0.8431373, 1,
-0.09042142, -2.1562, -2.150609, 0, 1, 0.8509804, 1,
-0.08976234, -1.683513, -3.671172, 0, 1, 0.854902, 1,
-0.08118648, -0.216794, -1.028319, 0, 1, 0.8627451, 1,
-0.07763685, 1.156455, 0.004371798, 0, 1, 0.8666667, 1,
-0.07275531, 0.7444988, -2.352679, 0, 1, 0.8745098, 1,
-0.06643985, -1.413502, -3.098206, 0, 1, 0.8784314, 1,
-0.0603305, 0.5992494, -0.2562638, 0, 1, 0.8862745, 1,
-0.06019291, 0.4101179, -1.330127, 0, 1, 0.8901961, 1,
-0.05570184, -1.133276, -3.347251, 0, 1, 0.8980392, 1,
-0.05211994, -0.4309692, -4.616928, 0, 1, 0.9058824, 1,
-0.04897555, -0.6280048, -4.110487, 0, 1, 0.9098039, 1,
-0.04666198, -0.8787674, -3.908375, 0, 1, 0.9176471, 1,
-0.04504862, -1.129275, -3.383872, 0, 1, 0.9215686, 1,
-0.04437589, 0.8648499, 1.113303, 0, 1, 0.9294118, 1,
-0.03522547, 0.3677411, -0.9965323, 0, 1, 0.9333333, 1,
-0.03309282, -0.738705, -2.944427, 0, 1, 0.9411765, 1,
-0.03284383, 1.624468, 0.3749484, 0, 1, 0.945098, 1,
-0.0312253, 0.2338714, 0.9239391, 0, 1, 0.9529412, 1,
-0.03047382, -0.455587, -2.314657, 0, 1, 0.9568627, 1,
-0.02686112, 0.4940729, -0.6276414, 0, 1, 0.9647059, 1,
-0.02242465, -0.679581, -3.307078, 0, 1, 0.9686275, 1,
-0.01976367, -0.07681222, -3.156985, 0, 1, 0.9764706, 1,
-0.01848204, -0.7219002, -3.251878, 0, 1, 0.9803922, 1,
-0.01830709, 0.6276858, -0.1288401, 0, 1, 0.9882353, 1,
-0.01713806, -0.9753804, -3.451157, 0, 1, 0.9921569, 1,
-0.01483842, 0.5385203, -0.2639498, 0, 1, 1, 1,
-0.01320968, -1.666233, -3.872759, 0, 0.9921569, 1, 1,
-0.01296647, 2.014188, -0.3047211, 0, 0.9882353, 1, 1,
-0.01187635, 1.258666, -0.02843774, 0, 0.9803922, 1, 1,
-0.01149612, 1.437311, 1.150734, 0, 0.9764706, 1, 1,
-0.003930351, -1.033448, -3.094415, 0, 0.9686275, 1, 1,
0.001470216, -0.6411463, 2.01691, 0, 0.9647059, 1, 1,
0.001917053, -2.882581, 4.050979, 0, 0.9568627, 1, 1,
0.003848044, 0.2194329, -0.08135682, 0, 0.9529412, 1, 1,
0.004434986, 0.4794905, 0.5731704, 0, 0.945098, 1, 1,
0.005366107, 0.2919742, 0.2402861, 0, 0.9411765, 1, 1,
0.005708152, -0.3038388, 3.868501, 0, 0.9333333, 1, 1,
0.01275082, 0.8339916, -0.4721932, 0, 0.9294118, 1, 1,
0.0129378, 0.8532068, 0.3997997, 0, 0.9215686, 1, 1,
0.02721473, -0.5143461, 3.424971, 0, 0.9176471, 1, 1,
0.03076007, -0.4150177, 3.635482, 0, 0.9098039, 1, 1,
0.0309301, 0.3839788, -1.806702, 0, 0.9058824, 1, 1,
0.03181151, 0.9789772, -1.423349, 0, 0.8980392, 1, 1,
0.04727369, -1.233878, 2.484154, 0, 0.8901961, 1, 1,
0.04939848, -1.525619, 3.195011, 0, 0.8862745, 1, 1,
0.05021563, -1.079991, 3.91827, 0, 0.8784314, 1, 1,
0.052215, -1.572984, 3.873095, 0, 0.8745098, 1, 1,
0.05451645, -1.232531, 3.262021, 0, 0.8666667, 1, 1,
0.05513202, -2.335041, 2.589701, 0, 0.8627451, 1, 1,
0.05603725, -0.9419275, 3.664976, 0, 0.854902, 1, 1,
0.06686891, -0.9221301, 2.197851, 0, 0.8509804, 1, 1,
0.06837014, 0.02970905, 2.469423, 0, 0.8431373, 1, 1,
0.07260349, 0.120381, -1.062923, 0, 0.8392157, 1, 1,
0.07462808, 0.1630554, 0.5550025, 0, 0.8313726, 1, 1,
0.07922965, -0.2823257, 3.24133, 0, 0.827451, 1, 1,
0.08201861, 0.2694263, 0.2658932, 0, 0.8196079, 1, 1,
0.08623665, -0.6876914, 1.282343, 0, 0.8156863, 1, 1,
0.08803, 0.8170928, -0.544746, 0, 0.8078431, 1, 1,
0.09179909, 0.446716, 0.3767217, 0, 0.8039216, 1, 1,
0.09272734, 0.1537877, 0.8496808, 0, 0.7960784, 1, 1,
0.09571411, -0.8066505, 1.366983, 0, 0.7882353, 1, 1,
0.1001636, 1.731683, -1.965994, 0, 0.7843137, 1, 1,
0.1012388, -0.523499, 2.995499, 0, 0.7764706, 1, 1,
0.1028166, 0.8172969, 0.6505628, 0, 0.772549, 1, 1,
0.104398, -0.4932388, 3.22969, 0, 0.7647059, 1, 1,
0.1053683, 0.2576838, 2.111099, 0, 0.7607843, 1, 1,
0.10671, -1.436701, 4.588893, 0, 0.7529412, 1, 1,
0.1132142, -0.4757071, 4.771462, 0, 0.7490196, 1, 1,
0.1140455, -0.8731294, 4.345409, 0, 0.7411765, 1, 1,
0.1167968, -0.8409421, 0.6312927, 0, 0.7372549, 1, 1,
0.1293905, 1.494963, -0.6145157, 0, 0.7294118, 1, 1,
0.1402833, -1.256315, 3.61153, 0, 0.7254902, 1, 1,
0.1438827, -0.4622231, 4.337542, 0, 0.7176471, 1, 1,
0.1498083, -0.447871, 4.582026, 0, 0.7137255, 1, 1,
0.1544387, 0.4709848, -0.01950564, 0, 0.7058824, 1, 1,
0.1554371, 0.3976019, 1.72151, 0, 0.6980392, 1, 1,
0.1555388, -0.3651813, 3.35454, 0, 0.6941177, 1, 1,
0.1562987, -0.7018879, 1.379898, 0, 0.6862745, 1, 1,
0.1563065, -0.3347582, 4.596731, 0, 0.682353, 1, 1,
0.1581877, 0.5862426, -0.142942, 0, 0.6745098, 1, 1,
0.1607927, -0.5121825, 1.719987, 0, 0.6705883, 1, 1,
0.1649928, 1.137788, 1.046211, 0, 0.6627451, 1, 1,
0.1674856, 0.2780865, 0.4200578, 0, 0.6588235, 1, 1,
0.171679, 0.2104352, 1.081177, 0, 0.6509804, 1, 1,
0.1723979, 1.496035, 0.1783043, 0, 0.6470588, 1, 1,
0.1769032, 0.9912064, 0.09778442, 0, 0.6392157, 1, 1,
0.1771584, -1.337011, 3.937117, 0, 0.6352941, 1, 1,
0.1772571, -0.5336906, 2.424216, 0, 0.627451, 1, 1,
0.1773819, -0.6787958, 4.122021, 0, 0.6235294, 1, 1,
0.1798455, 1.484043, 0.7278984, 0, 0.6156863, 1, 1,
0.1815486, -0.979716, 2.546185, 0, 0.6117647, 1, 1,
0.1855046, -1.71261, 5.522201, 0, 0.6039216, 1, 1,
0.1872234, -0.4247778, 1.593263, 0, 0.5960785, 1, 1,
0.1881315, 0.6243324, -0.6545601, 0, 0.5921569, 1, 1,
0.1883433, -1.116797, 2.490731, 0, 0.5843138, 1, 1,
0.1966397, 1.248569, -0.4144749, 0, 0.5803922, 1, 1,
0.199907, -1.314231, 4.264678, 0, 0.572549, 1, 1,
0.2018903, 0.9079928, 1.134379, 0, 0.5686275, 1, 1,
0.2025427, -1.771869, 2.424196, 0, 0.5607843, 1, 1,
0.2067391, -0.5058901, 4.212852, 0, 0.5568628, 1, 1,
0.2083607, 0.09049515, 0.6669589, 0, 0.5490196, 1, 1,
0.208546, -0.4748756, 2.387896, 0, 0.5450981, 1, 1,
0.2090666, -1.10446, 3.62897, 0, 0.5372549, 1, 1,
0.2099261, 0.3969505, 0.6938352, 0, 0.5333334, 1, 1,
0.2107834, -1.184206, 2.701464, 0, 0.5254902, 1, 1,
0.2134453, -0.9776828, 3.888674, 0, 0.5215687, 1, 1,
0.2193019, 0.376525, 0.7244831, 0, 0.5137255, 1, 1,
0.2208967, 0.593342, -1.480361, 0, 0.509804, 1, 1,
0.2221792, -1.341139, 3.309817, 0, 0.5019608, 1, 1,
0.2238942, 1.207968, 1.132962, 0, 0.4941176, 1, 1,
0.2240258, 0.5552727, 0.8790036, 0, 0.4901961, 1, 1,
0.2242222, 0.4740735, 0.8818809, 0, 0.4823529, 1, 1,
0.2266988, 0.5921776, 1.341642, 0, 0.4784314, 1, 1,
0.2276418, 0.8297424, -1.697227, 0, 0.4705882, 1, 1,
0.2364967, -1.163075, 2.741216, 0, 0.4666667, 1, 1,
0.2400212, 0.9072136, 0.4855388, 0, 0.4588235, 1, 1,
0.2400853, 0.5867087, 0.5342838, 0, 0.454902, 1, 1,
0.2456465, -1.141999, 3.470547, 0, 0.4470588, 1, 1,
0.2480739, 0.3041012, -0.1101795, 0, 0.4431373, 1, 1,
0.250812, 0.2686037, 1.686572, 0, 0.4352941, 1, 1,
0.2547857, 0.6866967, -0.04089612, 0, 0.4313726, 1, 1,
0.2587929, -0.233971, 5.162057, 0, 0.4235294, 1, 1,
0.2603818, -0.7729215, 2.742218, 0, 0.4196078, 1, 1,
0.2629356, 0.6231713, 0.475014, 0, 0.4117647, 1, 1,
0.2659068, 0.8965684, 0.2098926, 0, 0.4078431, 1, 1,
0.2703951, -0.2534468, 1.689813, 0, 0.4, 1, 1,
0.2713077, 1.4153, 1.254814, 0, 0.3921569, 1, 1,
0.2714259, 0.1293124, 1.618418, 0, 0.3882353, 1, 1,
0.2724895, -0.9226077, 4.581766, 0, 0.3803922, 1, 1,
0.2767639, 0.8521894, -0.8631489, 0, 0.3764706, 1, 1,
0.2780843, -0.800644, 2.949696, 0, 0.3686275, 1, 1,
0.2781302, -1.238286, 4.870814, 0, 0.3647059, 1, 1,
0.2822267, -0.7206136, 2.249801, 0, 0.3568628, 1, 1,
0.2920093, -0.5859591, 3.338721, 0, 0.3529412, 1, 1,
0.2939475, 1.503685, 1.962928, 0, 0.345098, 1, 1,
0.2962257, 0.7678792, 0.1615238, 0, 0.3411765, 1, 1,
0.2996559, 0.6293069, -0.04258281, 0, 0.3333333, 1, 1,
0.3000613, 0.7698179, 0.8828169, 0, 0.3294118, 1, 1,
0.3042601, -0.5064077, 3.181206, 0, 0.3215686, 1, 1,
0.3064705, -0.4403272, 0.7142449, 0, 0.3176471, 1, 1,
0.3094428, -1.171826, 1.672224, 0, 0.3098039, 1, 1,
0.3170385, 0.6683319, 1.222993, 0, 0.3058824, 1, 1,
0.3190926, 0.3208949, 1.767549, 0, 0.2980392, 1, 1,
0.3225059, -1.53498, 1.995227, 0, 0.2901961, 1, 1,
0.3257407, -0.1811568, 1.803727, 0, 0.2862745, 1, 1,
0.3278477, -0.634132, 2.324292, 0, 0.2784314, 1, 1,
0.3280178, -0.2934092, 1.619506, 0, 0.2745098, 1, 1,
0.3314613, -0.5049032, 1.55892, 0, 0.2666667, 1, 1,
0.3386411, -0.4560964, 3.569466, 0, 0.2627451, 1, 1,
0.3400369, 1.035352, 1.502012, 0, 0.254902, 1, 1,
0.3406609, 0.05582929, 0.4811077, 0, 0.2509804, 1, 1,
0.3418607, -0.03597383, 2.476162, 0, 0.2431373, 1, 1,
0.3429434, 1.594949, 0.02314248, 0, 0.2392157, 1, 1,
0.343972, 1.837528, 0.8813079, 0, 0.2313726, 1, 1,
0.3444453, 2.212827, -0.9704565, 0, 0.227451, 1, 1,
0.3474514, 1.481751, 0.007529061, 0, 0.2196078, 1, 1,
0.3481419, 1.042879, 0.6367368, 0, 0.2156863, 1, 1,
0.3509714, -0.03788547, 0.8067828, 0, 0.2078431, 1, 1,
0.3593067, 0.7639988, -0.08671875, 0, 0.2039216, 1, 1,
0.3616437, 0.3971038, 2.825528, 0, 0.1960784, 1, 1,
0.3647857, -0.3038841, 2.666815, 0, 0.1882353, 1, 1,
0.3759306, 0.5250465, -0.6276364, 0, 0.1843137, 1, 1,
0.3790549, -2.722221, 2.418435, 0, 0.1764706, 1, 1,
0.3809871, -0.3883356, 0.008192629, 0, 0.172549, 1, 1,
0.3829062, 0.1900757, 1.16042, 0, 0.1647059, 1, 1,
0.3833913, 2.375236, 2.020622, 0, 0.1607843, 1, 1,
0.3845619, -0.5015084, 1.442315, 0, 0.1529412, 1, 1,
0.386031, 0.0221127, 2.075943, 0, 0.1490196, 1, 1,
0.3893679, 0.8309522, -0.06511179, 0, 0.1411765, 1, 1,
0.3939773, -0.1180507, 3.146145, 0, 0.1372549, 1, 1,
0.3966137, 0.5562956, 0.341689, 0, 0.1294118, 1, 1,
0.3969122, 2.36343, -1.316309, 0, 0.1254902, 1, 1,
0.3991909, 0.990999, 1.176954, 0, 0.1176471, 1, 1,
0.3998053, -1.015406, 3.066972, 0, 0.1137255, 1, 1,
0.4000124, 0.1234234, 2.824607, 0, 0.1058824, 1, 1,
0.4041779, 0.4228544, 0.190233, 0, 0.09803922, 1, 1,
0.4072069, 1.669275, 0.5220982, 0, 0.09411765, 1, 1,
0.4077638, -1.512131, 3.190838, 0, 0.08627451, 1, 1,
0.409339, -2.058139, 2.640125, 0, 0.08235294, 1, 1,
0.4223691, -2.070478, 2.394873, 0, 0.07450981, 1, 1,
0.4230428, -0.05579018, 2.529988, 0, 0.07058824, 1, 1,
0.423545, 0.4006147, 1.456001, 0, 0.0627451, 1, 1,
0.4269009, 0.3997755, 0.9488537, 0, 0.05882353, 1, 1,
0.4349707, -0.8584142, 3.677397, 0, 0.05098039, 1, 1,
0.4427283, 1.300535, -0.5631568, 0, 0.04705882, 1, 1,
0.4439217, 0.05802197, 2.527992, 0, 0.03921569, 1, 1,
0.4449406, 1.824515, -0.2597769, 0, 0.03529412, 1, 1,
0.4454987, -0.4131125, 3.400235, 0, 0.02745098, 1, 1,
0.4516523, 0.3731489, 0.3283096, 0, 0.02352941, 1, 1,
0.4530137, -0.4068684, 2.074372, 0, 0.01568628, 1, 1,
0.4551766, -0.1087868, 2.189088, 0, 0.01176471, 1, 1,
0.4609545, 0.8523856, 0.7361129, 0, 0.003921569, 1, 1,
0.4620311, -0.3336734, 1.480436, 0.003921569, 0, 1, 1,
0.4718671, -1.631736, 1.8673, 0.007843138, 0, 1, 1,
0.4737713, 1.159769, -0.1378449, 0.01568628, 0, 1, 1,
0.4750946, -1.871632, 3.473911, 0.01960784, 0, 1, 1,
0.4752753, -2.053872, 2.804765, 0.02745098, 0, 1, 1,
0.4753362, -1.650136, 4.344553, 0.03137255, 0, 1, 1,
0.4779642, -1.054367, 3.037647, 0.03921569, 0, 1, 1,
0.4842138, 0.2614038, -0.5447733, 0.04313726, 0, 1, 1,
0.484231, 0.840735, 0.8483086, 0.05098039, 0, 1, 1,
0.4872443, 0.2640897, 0.2959781, 0.05490196, 0, 1, 1,
0.488227, 0.4541959, 1.255932, 0.0627451, 0, 1, 1,
0.4899799, -0.7856532, 4.096982, 0.06666667, 0, 1, 1,
0.490085, 0.6284226, 0.6041323, 0.07450981, 0, 1, 1,
0.497743, 0.8950893, 1.193866, 0.07843138, 0, 1, 1,
0.5016831, 0.5906673, 1.147605, 0.08627451, 0, 1, 1,
0.5027828, 0.004230648, 0.4952445, 0.09019608, 0, 1, 1,
0.5073469, -0.3681769, 1.801321, 0.09803922, 0, 1, 1,
0.5086755, -1.149468, 3.544858, 0.1058824, 0, 1, 1,
0.5192805, -0.7508497, 4.340457, 0.1098039, 0, 1, 1,
0.520785, 1.147096, 0.3617783, 0.1176471, 0, 1, 1,
0.5291955, -0.3881463, 1.393645, 0.1215686, 0, 1, 1,
0.5363364, 0.7105659, 1.936666, 0.1294118, 0, 1, 1,
0.5374573, 0.4649066, 1.687266, 0.1333333, 0, 1, 1,
0.5385888, -0.2424886, 1.996689, 0.1411765, 0, 1, 1,
0.5393973, -0.7147312, 2.855946, 0.145098, 0, 1, 1,
0.5416721, 1.238433, 0.2565521, 0.1529412, 0, 1, 1,
0.551493, 0.1561366, 0.4285958, 0.1568628, 0, 1, 1,
0.5541626, 0.5386449, 0.2554391, 0.1647059, 0, 1, 1,
0.5543503, -0.7600073, 0.8853763, 0.1686275, 0, 1, 1,
0.5597109, 0.2981073, 2.031041, 0.1764706, 0, 1, 1,
0.5604998, -0.2858647, 2.20507, 0.1803922, 0, 1, 1,
0.5628703, -1.016809, 3.483506, 0.1882353, 0, 1, 1,
0.5629701, -0.8550398, 0.4224247, 0.1921569, 0, 1, 1,
0.5695218, 2.091838, -0.2176128, 0.2, 0, 1, 1,
0.5734184, -0.9051798, 2.797621, 0.2078431, 0, 1, 1,
0.57789, 0.1016573, 1.836789, 0.2117647, 0, 1, 1,
0.5934035, 0.2783363, 1.179783, 0.2196078, 0, 1, 1,
0.5943926, 0.7074007, 0.3810734, 0.2235294, 0, 1, 1,
0.5958237, -0.5640299, 0.9004838, 0.2313726, 0, 1, 1,
0.6031076, -0.6920754, 3.019741, 0.2352941, 0, 1, 1,
0.6057882, -0.4554461, 2.432054, 0.2431373, 0, 1, 1,
0.6085787, -1.032897, 2.89055, 0.2470588, 0, 1, 1,
0.6102892, 0.6918626, 0.9764978, 0.254902, 0, 1, 1,
0.6114663, -0.4359774, 0.655287, 0.2588235, 0, 1, 1,
0.6159606, -1.159304, 2.801887, 0.2666667, 0, 1, 1,
0.6271207, -0.4810759, 3.35359, 0.2705882, 0, 1, 1,
0.6271793, -0.7598584, 3.000168, 0.2784314, 0, 1, 1,
0.6321861, -0.916626, 2.230397, 0.282353, 0, 1, 1,
0.6334203, 0.7687599, 0.7831239, 0.2901961, 0, 1, 1,
0.6382687, -1.699465, 4.524709, 0.2941177, 0, 1, 1,
0.6418157, -0.5195208, 1.659236, 0.3019608, 0, 1, 1,
0.6450447, 0.3723164, 1.557982, 0.3098039, 0, 1, 1,
0.6463443, 0.2146082, 1.662786, 0.3137255, 0, 1, 1,
0.6495514, 0.2029248, 1.209633, 0.3215686, 0, 1, 1,
0.65119, -0.3872503, 0.556718, 0.3254902, 0, 1, 1,
0.6553484, -0.4142084, 1.570337, 0.3333333, 0, 1, 1,
0.655603, -2.218277, 2.97606, 0.3372549, 0, 1, 1,
0.6567413, 0.2756841, 2.308855, 0.345098, 0, 1, 1,
0.6580687, -0.01560997, 2.36701, 0.3490196, 0, 1, 1,
0.6596195, 0.2426668, 2.799457, 0.3568628, 0, 1, 1,
0.6612059, -1.325994, 2.546032, 0.3607843, 0, 1, 1,
0.6628243, 1.065647, 1.685689, 0.3686275, 0, 1, 1,
0.6640147, -0.427, 0.3949869, 0.372549, 0, 1, 1,
0.6665143, -0.974791, 2.665566, 0.3803922, 0, 1, 1,
0.6676136, 0.6725061, 0.4507284, 0.3843137, 0, 1, 1,
0.6679444, -0.9280548, 5.192427, 0.3921569, 0, 1, 1,
0.6716401, -1.696854, 2.396915, 0.3960784, 0, 1, 1,
0.6744902, 0.9402069, 0.9470701, 0.4039216, 0, 1, 1,
0.6846331, -0.186562, 1.316074, 0.4117647, 0, 1, 1,
0.6874849, 1.611992, 1.15144, 0.4156863, 0, 1, 1,
0.6884571, 0.2015868, -0.2648126, 0.4235294, 0, 1, 1,
0.6937114, -0.8724647, 1.713873, 0.427451, 0, 1, 1,
0.6945837, -0.8983551, 2.48992, 0.4352941, 0, 1, 1,
0.6960129, -0.1728402, 0.1059432, 0.4392157, 0, 1, 1,
0.6988069, -0.8109142, 0.6439432, 0.4470588, 0, 1, 1,
0.6991364, -1.760826, 1.817181, 0.4509804, 0, 1, 1,
0.6998767, -1.521588, 2.766962, 0.4588235, 0, 1, 1,
0.703196, -1.623511, 4.387063, 0.4627451, 0, 1, 1,
0.71215, 0.448033, 0.7953866, 0.4705882, 0, 1, 1,
0.7136424, 1.108787, 2.031347, 0.4745098, 0, 1, 1,
0.7182299, 0.3947589, 3.247402, 0.4823529, 0, 1, 1,
0.7273638, 0.05263021, 1.294769, 0.4862745, 0, 1, 1,
0.7289616, 1.4424, 0.8003387, 0.4941176, 0, 1, 1,
0.7305743, 0.2267968, -0.8289335, 0.5019608, 0, 1, 1,
0.7319182, 1.035226, 0.6373451, 0.5058824, 0, 1, 1,
0.7337207, -0.08027212, 1.428314, 0.5137255, 0, 1, 1,
0.7338572, -0.7953244, 4.693379, 0.5176471, 0, 1, 1,
0.7395536, 0.08965973, -0.2895595, 0.5254902, 0, 1, 1,
0.740963, -1.076471, 2.076271, 0.5294118, 0, 1, 1,
0.7478898, 2.967864, -0.1492164, 0.5372549, 0, 1, 1,
0.7488906, 1.906436, -1.6559, 0.5411765, 0, 1, 1,
0.7491949, -1.094248, 1.714807, 0.5490196, 0, 1, 1,
0.7497857, -1.487544, 3.351071, 0.5529412, 0, 1, 1,
0.7620612, 2.016358, 0.6429466, 0.5607843, 0, 1, 1,
0.7651578, 0.1128578, 1.053223, 0.5647059, 0, 1, 1,
0.7653564, 2.187966, -1.711649, 0.572549, 0, 1, 1,
0.7681318, -1.798009, 4.901884, 0.5764706, 0, 1, 1,
0.7721559, 0.9351926, 0.08111648, 0.5843138, 0, 1, 1,
0.7738723, -0.009692884, -1.266879, 0.5882353, 0, 1, 1,
0.7740864, -1.838297, 1.569512, 0.5960785, 0, 1, 1,
0.7750357, -0.008896137, 2.014983, 0.6039216, 0, 1, 1,
0.7756426, -0.4489699, 1.06716, 0.6078432, 0, 1, 1,
0.7771963, -0.5404856, 3.005043, 0.6156863, 0, 1, 1,
0.7846702, -0.36046, 2.070127, 0.6196079, 0, 1, 1,
0.7867689, -1.406751, 2.62937, 0.627451, 0, 1, 1,
0.7875884, -0.1065492, 2.569578, 0.6313726, 0, 1, 1,
0.7887251, 0.2954111, 0.7477614, 0.6392157, 0, 1, 1,
0.790879, 0.3773434, 2.025081, 0.6431373, 0, 1, 1,
0.792726, 0.2395829, 0.1014945, 0.6509804, 0, 1, 1,
0.8001856, 1.55504, 0.9699017, 0.654902, 0, 1, 1,
0.8011144, -0.1862222, 3.004974, 0.6627451, 0, 1, 1,
0.802423, 1.683283, 1.782674, 0.6666667, 0, 1, 1,
0.811476, 2.068331, 2.224248, 0.6745098, 0, 1, 1,
0.8188897, 0.1039082, 1.21323, 0.6784314, 0, 1, 1,
0.8190963, 0.1122573, 0.1558203, 0.6862745, 0, 1, 1,
0.8202162, 0.7436136, 1.211971, 0.6901961, 0, 1, 1,
0.8226931, -0.06865157, 1.769353, 0.6980392, 0, 1, 1,
0.8249699, -0.7790977, 3.168665, 0.7058824, 0, 1, 1,
0.828943, 0.6174014, 3.050474, 0.7098039, 0, 1, 1,
0.8392457, -0.7325711, 1.721214, 0.7176471, 0, 1, 1,
0.8412629, 0.3294271, 1.845874, 0.7215686, 0, 1, 1,
0.8478996, -0.4598622, 2.319036, 0.7294118, 0, 1, 1,
0.8533265, 0.1753784, 2.922517, 0.7333333, 0, 1, 1,
0.854271, 0.3592471, -0.7080508, 0.7411765, 0, 1, 1,
0.8548203, -0.7527493, 2.361589, 0.7450981, 0, 1, 1,
0.8554216, 0.9469087, -0.06122841, 0.7529412, 0, 1, 1,
0.8613685, -1.53018, 2.267981, 0.7568628, 0, 1, 1,
0.8633576, -0.2043312, 2.192827, 0.7647059, 0, 1, 1,
0.8636363, -0.9348265, 3.384431, 0.7686275, 0, 1, 1,
0.8655843, -1.898195, 2.258152, 0.7764706, 0, 1, 1,
0.8659309, 0.8820629, 1.693468, 0.7803922, 0, 1, 1,
0.8665742, 0.07650436, 0.9111717, 0.7882353, 0, 1, 1,
0.8681524, 1.632839, 0.8262568, 0.7921569, 0, 1, 1,
0.8699505, -0.2765463, 2.234336, 0.8, 0, 1, 1,
0.8699707, 0.3174114, 0.1790269, 0.8078431, 0, 1, 1,
0.8710298, 1.370954, 1.597665, 0.8117647, 0, 1, 1,
0.8856606, -1.043106, 3.559759, 0.8196079, 0, 1, 1,
0.8866847, 0.1171925, 3.155801, 0.8235294, 0, 1, 1,
0.898312, -0.6076761, 3.544942, 0.8313726, 0, 1, 1,
0.9013183, -0.8745757, 1.562839, 0.8352941, 0, 1, 1,
0.9082762, 1.345111, 1.440306, 0.8431373, 0, 1, 1,
0.9107044, 1.569099, 0.5052377, 0.8470588, 0, 1, 1,
0.9236324, -0.306767, 0.938957, 0.854902, 0, 1, 1,
0.9302896, -1.026088, 1.92888, 0.8588235, 0, 1, 1,
0.932385, -0.1272584, 0.32964, 0.8666667, 0, 1, 1,
0.9330722, -0.348453, 1.081931, 0.8705882, 0, 1, 1,
0.9331032, -0.8526595, 1.855102, 0.8784314, 0, 1, 1,
0.9358162, 1.911983, -0.3879549, 0.8823529, 0, 1, 1,
0.9382875, 0.4922668, 1.071997, 0.8901961, 0, 1, 1,
0.9429656, 0.1839615, 0.5351458, 0.8941177, 0, 1, 1,
0.9456664, -1.010077, 2.127117, 0.9019608, 0, 1, 1,
0.9456921, -0.09452163, 1.615377, 0.9098039, 0, 1, 1,
0.9461408, 3.025277, 0.2008965, 0.9137255, 0, 1, 1,
0.96676, 0.8988392, 0.3064418, 0.9215686, 0, 1, 1,
0.9689456, -0.843805, 1.764389, 0.9254902, 0, 1, 1,
0.9978316, 0.0665141, 3.177393, 0.9333333, 0, 1, 1,
1.006931, -1.082761, 2.358705, 0.9372549, 0, 1, 1,
1.009578, 0.8074812, -0.08629715, 0.945098, 0, 1, 1,
1.011346, -1.277377, 1.494433, 0.9490196, 0, 1, 1,
1.012857, 1.086103, 1.07323, 0.9568627, 0, 1, 1,
1.015086, -1.062305, 2.880143, 0.9607843, 0, 1, 1,
1.0151, 0.4918878, 0.653551, 0.9686275, 0, 1, 1,
1.024012, -1.057334, 1.962428, 0.972549, 0, 1, 1,
1.026816, -1.360582, 1.995064, 0.9803922, 0, 1, 1,
1.028308, -0.5858448, 2.748962, 0.9843137, 0, 1, 1,
1.031154, 1.333064, 2.263616, 0.9921569, 0, 1, 1,
1.035368, -1.038229, 2.547063, 0.9960784, 0, 1, 1,
1.037552, -0.2564861, 1.335043, 1, 0, 0.9960784, 1,
1.044718, -0.8502162, 1.373072, 1, 0, 0.9882353, 1,
1.045584, 0.4122496, 1.335595, 1, 0, 0.9843137, 1,
1.058546, 1.008001, -0.4922753, 1, 0, 0.9764706, 1,
1.063423, -0.8784248, 3.002442, 1, 0, 0.972549, 1,
1.069735, 0.2186318, 0.1284226, 1, 0, 0.9647059, 1,
1.069985, -1.051176, 2.478971, 1, 0, 0.9607843, 1,
1.074311, -0.01946702, 1.653745, 1, 0, 0.9529412, 1,
1.074851, 0.2016878, -0.4013861, 1, 0, 0.9490196, 1,
1.080524, -0.05358122, 3.16168, 1, 0, 0.9411765, 1,
1.085907, -0.5354001, 2.620769, 1, 0, 0.9372549, 1,
1.100752, -0.03220567, 3.15947, 1, 0, 0.9294118, 1,
1.114179, -0.967897, 2.239034, 1, 0, 0.9254902, 1,
1.115699, 0.8612009, 2.26013, 1, 0, 0.9176471, 1,
1.116491, 1.133301, -0.6617507, 1, 0, 0.9137255, 1,
1.122389, -0.9613869, 2.948724, 1, 0, 0.9058824, 1,
1.123464, -0.2431028, -0.1394028, 1, 0, 0.9019608, 1,
1.128741, 2.147476, -0.4708131, 1, 0, 0.8941177, 1,
1.135766, -0.3176765, 4.291041, 1, 0, 0.8862745, 1,
1.136302, -0.2350159, 0.2253062, 1, 0, 0.8823529, 1,
1.136847, 1.296035, 0.1438145, 1, 0, 0.8745098, 1,
1.139228, -1.528954, 2.523965, 1, 0, 0.8705882, 1,
1.140173, 1.135281, 2.062055, 1, 0, 0.8627451, 1,
1.140493, 0.5643592, 1.731451, 1, 0, 0.8588235, 1,
1.14265, 0.3095321, 0.8735709, 1, 0, 0.8509804, 1,
1.146676, -0.3658882, 1.066432, 1, 0, 0.8470588, 1,
1.146749, 1.850979, -0.09596285, 1, 0, 0.8392157, 1,
1.148136, -0.7563621, 3.609379, 1, 0, 0.8352941, 1,
1.151208, -2.558745, 2.005867, 1, 0, 0.827451, 1,
1.155613, 0.2246988, 1.06066, 1, 0, 0.8235294, 1,
1.156456, -1.630301, 0.7547824, 1, 0, 0.8156863, 1,
1.158309, 0.6370918, 0.05184499, 1, 0, 0.8117647, 1,
1.159997, -0.6978507, 1.609885, 1, 0, 0.8039216, 1,
1.165129, 0.1348705, 1.213902, 1, 0, 0.7960784, 1,
1.169742, 1.767931, 2.154732, 1, 0, 0.7921569, 1,
1.170417, 0.9338646, 1.597866, 1, 0, 0.7843137, 1,
1.17383, -1.297699, 4.003617, 1, 0, 0.7803922, 1,
1.17705, -0.1177174, 1.35367, 1, 0, 0.772549, 1,
1.182899, 0.6059274, 0.7858154, 1, 0, 0.7686275, 1,
1.186481, -0.6193148, 3.140806, 1, 0, 0.7607843, 1,
1.189477, -0.4297026, 3.207163, 1, 0, 0.7568628, 1,
1.18948, -0.5513366, 4.401699, 1, 0, 0.7490196, 1,
1.189888, -0.63297, 1.769748, 1, 0, 0.7450981, 1,
1.190392, -0.7694674, 1.531209, 1, 0, 0.7372549, 1,
1.198965, -0.07461239, 3.749503, 1, 0, 0.7333333, 1,
1.199645, 0.7563491, -0.5971369, 1, 0, 0.7254902, 1,
1.208202, 1.490906, 1.684699, 1, 0, 0.7215686, 1,
1.212438, 1.029124, 1.062678, 1, 0, 0.7137255, 1,
1.21859, 0.3673609, 2.030027, 1, 0, 0.7098039, 1,
1.22233, 0.5023324, 1.975316, 1, 0, 0.7019608, 1,
1.224262, 1.335755, 0.5183257, 1, 0, 0.6941177, 1,
1.246966, -0.5428618, 1.355178, 1, 0, 0.6901961, 1,
1.247637, 0.1004731, 0.7428425, 1, 0, 0.682353, 1,
1.25368, -1.078186, 1.264237, 1, 0, 0.6784314, 1,
1.261243, 0.1723723, 1.744876, 1, 0, 0.6705883, 1,
1.264485, 2.137298, 1.475093, 1, 0, 0.6666667, 1,
1.265399, -1.314308, 1.754562, 1, 0, 0.6588235, 1,
1.267274, -0.9964986, 0.3255891, 1, 0, 0.654902, 1,
1.27014, -0.5251338, 1.745728, 1, 0, 0.6470588, 1,
1.273213, -1.327458, 1.802971, 1, 0, 0.6431373, 1,
1.279834, 0.703858, 2.655476, 1, 0, 0.6352941, 1,
1.281852, 0.18582, 2.489949, 1, 0, 0.6313726, 1,
1.282663, -0.02761008, 3.821049, 1, 0, 0.6235294, 1,
1.308805, 1.344511, 1.712807, 1, 0, 0.6196079, 1,
1.312867, 1.026151, 0.7949536, 1, 0, 0.6117647, 1,
1.31493, 1.182856, 0.7998667, 1, 0, 0.6078432, 1,
1.332022, 1.774115, -0.9189276, 1, 0, 0.6, 1,
1.335981, 0.2175402, 1.343292, 1, 0, 0.5921569, 1,
1.342505, 0.8646669, 0.3082411, 1, 0, 0.5882353, 1,
1.34329, -2.622826, 2.096486, 1, 0, 0.5803922, 1,
1.352573, -0.4351963, 0.1503534, 1, 0, 0.5764706, 1,
1.359834, -0.2480066, 2.880337, 1, 0, 0.5686275, 1,
1.360963, -0.7196766, 2.144818, 1, 0, 0.5647059, 1,
1.362737, 0.6627675, 1.437965, 1, 0, 0.5568628, 1,
1.369577, -0.3737724, 2.484545, 1, 0, 0.5529412, 1,
1.373727, -0.03340167, 1.503897, 1, 0, 0.5450981, 1,
1.380124, 1.398525, 1.202426, 1, 0, 0.5411765, 1,
1.382276, 0.9485491, 1.394334, 1, 0, 0.5333334, 1,
1.404374, -0.8230823, 1.441597, 1, 0, 0.5294118, 1,
1.416374, 1.867015, 1.429289, 1, 0, 0.5215687, 1,
1.417023, 0.9737731, 0.8172632, 1, 0, 0.5176471, 1,
1.41761, -1.512337, 2.577009, 1, 0, 0.509804, 1,
1.422818, -0.216155, 0.9584802, 1, 0, 0.5058824, 1,
1.442961, 0.126203, 2.289126, 1, 0, 0.4980392, 1,
1.453833, -0.668883, 0.6026098, 1, 0, 0.4901961, 1,
1.459175, 0.08405087, 1.217461, 1, 0, 0.4862745, 1,
1.463585, -0.6062312, 1.088435, 1, 0, 0.4784314, 1,
1.463593, 0.6098514, 1.040891, 1, 0, 0.4745098, 1,
1.46367, 0.6670489, 0.6518025, 1, 0, 0.4666667, 1,
1.466314, -0.8307588, 1.302217, 1, 0, 0.4627451, 1,
1.487392, -0.7088069, 1.558236, 1, 0, 0.454902, 1,
1.497084, -1.367125, 3.125122, 1, 0, 0.4509804, 1,
1.498805, 0.2257518, 2.310379, 1, 0, 0.4431373, 1,
1.505259, 0.3795859, 1.344171, 1, 0, 0.4392157, 1,
1.507386, -0.9804565, 2.81892, 1, 0, 0.4313726, 1,
1.520049, 1.003992, 2.399616, 1, 0, 0.427451, 1,
1.520138, -1.151244, 1.296549, 1, 0, 0.4196078, 1,
1.53039, -0.3066892, 2.06596, 1, 0, 0.4156863, 1,
1.532784, -0.2319304, -0.02875945, 1, 0, 0.4078431, 1,
1.537081, 0.2199401, 3.188349, 1, 0, 0.4039216, 1,
1.543205, -0.2906817, 2.562032, 1, 0, 0.3960784, 1,
1.555979, 0.2198605, 2.279482, 1, 0, 0.3882353, 1,
1.562743, -0.9579167, 1.948217, 1, 0, 0.3843137, 1,
1.573032, -0.9563106, 2.100171, 1, 0, 0.3764706, 1,
1.575918, 1.61943, -0.5378171, 1, 0, 0.372549, 1,
1.591354, -0.4351263, 2.978799, 1, 0, 0.3647059, 1,
1.602139, 0.6276848, 1.874493, 1, 0, 0.3607843, 1,
1.62182, 0.8113089, 1.493318, 1, 0, 0.3529412, 1,
1.624895, -2.511126, 3.266984, 1, 0, 0.3490196, 1,
1.629154, -0.5458746, 3.472484, 1, 0, 0.3411765, 1,
1.632332, 1.240231, 2.996933, 1, 0, 0.3372549, 1,
1.633625, -1.128804, 1.398572, 1, 0, 0.3294118, 1,
1.634755, 2.396984, 0.7170343, 1, 0, 0.3254902, 1,
1.649972, -0.6616107, 1.916699, 1, 0, 0.3176471, 1,
1.652483, 0.1272889, 1.249472, 1, 0, 0.3137255, 1,
1.658219, 0.3381432, 2.302457, 1, 0, 0.3058824, 1,
1.658397, -0.8551074, 1.548143, 1, 0, 0.2980392, 1,
1.675177, 1.354327, 2.418604, 1, 0, 0.2941177, 1,
1.677283, -1.490958, 0.9766559, 1, 0, 0.2862745, 1,
1.680928, 0.9063814, 2.025922, 1, 0, 0.282353, 1,
1.686673, -2.028434, 2.744104, 1, 0, 0.2745098, 1,
1.687302, -0.4968741, 2.73722, 1, 0, 0.2705882, 1,
1.688172, -1.569093, 4.044766, 1, 0, 0.2627451, 1,
1.691795, -0.7851254, 2.213652, 1, 0, 0.2588235, 1,
1.695119, -0.263093, 1.157434, 1, 0, 0.2509804, 1,
1.695831, 0.1376984, 0.44406, 1, 0, 0.2470588, 1,
1.731376, 0.03373595, 0.1699828, 1, 0, 0.2392157, 1,
1.731685, -1.212216, 2.311929, 1, 0, 0.2352941, 1,
1.733469, -0.3353271, 0.4394444, 1, 0, 0.227451, 1,
1.735666, -0.9874871, -0.04646011, 1, 0, 0.2235294, 1,
1.745442, 1.433236, 2.068124, 1, 0, 0.2156863, 1,
1.756626, 0.1914042, 2.617636, 1, 0, 0.2117647, 1,
1.765153, -1.044827, 2.383279, 1, 0, 0.2039216, 1,
1.795453, -1.261152, 1.992915, 1, 0, 0.1960784, 1,
1.801731, -1.581247, 0.3731417, 1, 0, 0.1921569, 1,
1.888281, -0.8663056, 2.28316, 1, 0, 0.1843137, 1,
1.904855, 0.5026413, 3.53411, 1, 0, 0.1803922, 1,
1.970299, -1.896903, 4.207644, 1, 0, 0.172549, 1,
1.989799, -0.4539829, 1.786, 1, 0, 0.1686275, 1,
1.994587, 0.4694147, 0.4498223, 1, 0, 0.1607843, 1,
2.008531, -0.9498897, 1.929987, 1, 0, 0.1568628, 1,
2.023244, 0.3256191, 0.4687197, 1, 0, 0.1490196, 1,
2.054689, 1.225091, 0.8312528, 1, 0, 0.145098, 1,
2.05802, -0.7071984, 1.841641, 1, 0, 0.1372549, 1,
2.075417, -1.283668, 1.849511, 1, 0, 0.1333333, 1,
2.07632, 0.4877795, 1.0099, 1, 0, 0.1254902, 1,
2.100286, -0.2678313, 2.682143, 1, 0, 0.1215686, 1,
2.10291, 1.393755, 2.870859, 1, 0, 0.1137255, 1,
2.112115, 0.6160008, 0.5188973, 1, 0, 0.1098039, 1,
2.125378, -0.2397211, 1.429306, 1, 0, 0.1019608, 1,
2.27122, -0.4880013, 0.8808499, 1, 0, 0.09411765, 1,
2.295442, 0.7766716, 0.1034425, 1, 0, 0.09019608, 1,
2.362161, -1.335847, 2.232582, 1, 0, 0.08235294, 1,
2.392959, 1.878335, -0.7653442, 1, 0, 0.07843138, 1,
2.398348, -1.262311, 3.059032, 1, 0, 0.07058824, 1,
2.406806, -1.548761, 3.379647, 1, 0, 0.06666667, 1,
2.4622, 2.242013, 0.1681306, 1, 0, 0.05882353, 1,
2.484934, 0.242701, 1.775472, 1, 0, 0.05490196, 1,
2.510211, 2.085557, 0.4735541, 1, 0, 0.04705882, 1,
2.545513, -0.1497505, 1.442613, 1, 0, 0.04313726, 1,
2.548268, 0.4601579, 2.205086, 1, 0, 0.03529412, 1,
2.657844, -0.06047041, 1.773571, 1, 0, 0.03137255, 1,
2.780619, 1.13953, 0.912304, 1, 0, 0.02352941, 1,
2.784123, -0.536503, 2.280501, 1, 0, 0.01960784, 1,
2.807015, 1.045462, 0.9928765, 1, 0, 0.01176471, 1,
2.816945, 0.6301886, 2.592292, 1, 0, 0.007843138, 1
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
-0.1437958, -3.9926, -7.379272, 0, -0.5, 0.5, 0.5,
-0.1437958, -3.9926, -7.379272, 1, -0.5, 0.5, 0.5,
-0.1437958, -3.9926, -7.379272, 1, 1.5, 0.5, 0.5,
-0.1437958, -3.9926, -7.379272, 0, 1.5, 0.5, 0.5
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
-4.108227, 0.3918089, -7.379272, 0, -0.5, 0.5, 0.5,
-4.108227, 0.3918089, -7.379272, 1, -0.5, 0.5, 0.5,
-4.108227, 0.3918089, -7.379272, 1, 1.5, 0.5, 0.5,
-4.108227, 0.3918089, -7.379272, 0, 1.5, 0.5, 0.5
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
-4.108227, -3.9926, 0.006393909, 0, -0.5, 0.5, 0.5,
-4.108227, -3.9926, 0.006393909, 1, -0.5, 0.5, 0.5,
-4.108227, -3.9926, 0.006393909, 1, 1.5, 0.5, 0.5,
-4.108227, -3.9926, 0.006393909, 0, 1.5, 0.5, 0.5
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
-3, -2.980813, -5.674888,
2, -2.980813, -5.674888,
-3, -2.980813, -5.674888,
-3, -3.149444, -5.958951,
-2, -2.980813, -5.674888,
-2, -3.149444, -5.958951,
-1, -2.980813, -5.674888,
-1, -3.149444, -5.958951,
0, -2.980813, -5.674888,
0, -3.149444, -5.958951,
1, -2.980813, -5.674888,
1, -3.149444, -5.958951,
2, -2.980813, -5.674888,
2, -3.149444, -5.958951
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
-3, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
-3, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
-3, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
-3, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5,
-2, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
-2, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
-2, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
-2, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5,
-1, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
-1, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
-1, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
-1, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5,
0, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
0, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
0, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
0, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5,
1, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
1, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
1, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
1, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5,
2, -3.486706, -6.52708, 0, -0.5, 0.5, 0.5,
2, -3.486706, -6.52708, 1, -0.5, 0.5, 0.5,
2, -3.486706, -6.52708, 1, 1.5, 0.5, 0.5,
2, -3.486706, -6.52708, 0, 1.5, 0.5, 0.5
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
-3.193358, -2, -5.674888,
-3.193358, 3, -5.674888,
-3.193358, -2, -5.674888,
-3.345837, -2, -5.958951,
-3.193358, -1, -5.674888,
-3.345837, -1, -5.958951,
-3.193358, 0, -5.674888,
-3.345837, 0, -5.958951,
-3.193358, 1, -5.674888,
-3.345837, 1, -5.958951,
-3.193358, 2, -5.674888,
-3.345837, 2, -5.958951,
-3.193358, 3, -5.674888,
-3.345837, 3, -5.958951
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
-3.650793, -2, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, -2, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, -2, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, -2, -6.52708, 0, 1.5, 0.5, 0.5,
-3.650793, -1, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, -1, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, -1, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, -1, -6.52708, 0, 1.5, 0.5, 0.5,
-3.650793, 0, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, 0, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, 0, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, 0, -6.52708, 0, 1.5, 0.5, 0.5,
-3.650793, 1, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, 1, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, 1, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, 1, -6.52708, 0, 1.5, 0.5, 0.5,
-3.650793, 2, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, 2, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, 2, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, 2, -6.52708, 0, 1.5, 0.5, 0.5,
-3.650793, 3, -6.52708, 0, -0.5, 0.5, 0.5,
-3.650793, 3, -6.52708, 1, -0.5, 0.5, 0.5,
-3.650793, 3, -6.52708, 1, 1.5, 0.5, 0.5,
-3.650793, 3, -6.52708, 0, 1.5, 0.5, 0.5
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
-3.193358, -2.980813, -4,
-3.193358, -2.980813, 4,
-3.193358, -2.980813, -4,
-3.345837, -3.149444, -4,
-3.193358, -2.980813, -2,
-3.345837, -3.149444, -2,
-3.193358, -2.980813, 0,
-3.345837, -3.149444, 0,
-3.193358, -2.980813, 2,
-3.345837, -3.149444, 2,
-3.193358, -2.980813, 4,
-3.345837, -3.149444, 4
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
-3.650793, -3.486706, -4, 0, -0.5, 0.5, 0.5,
-3.650793, -3.486706, -4, 1, -0.5, 0.5, 0.5,
-3.650793, -3.486706, -4, 1, 1.5, 0.5, 0.5,
-3.650793, -3.486706, -4, 0, 1.5, 0.5, 0.5,
-3.650793, -3.486706, -2, 0, -0.5, 0.5, 0.5,
-3.650793, -3.486706, -2, 1, -0.5, 0.5, 0.5,
-3.650793, -3.486706, -2, 1, 1.5, 0.5, 0.5,
-3.650793, -3.486706, -2, 0, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 0, 0, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 0, 1, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 0, 1, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 0, 0, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 2, 0, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 2, 1, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 2, 1, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 2, 0, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 4, 0, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 4, 1, -0.5, 0.5, 0.5,
-3.650793, -3.486706, 4, 1, 1.5, 0.5, 0.5,
-3.650793, -3.486706, 4, 0, 1.5, 0.5, 0.5
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
-3.193358, -2.980813, -5.674888,
-3.193358, 3.764431, -5.674888,
-3.193358, -2.980813, 5.687675,
-3.193358, 3.764431, 5.687675,
-3.193358, -2.980813, -5.674888,
-3.193358, -2.980813, 5.687675,
-3.193358, 3.764431, -5.674888,
-3.193358, 3.764431, 5.687675,
-3.193358, -2.980813, -5.674888,
2.905767, -2.980813, -5.674888,
-3.193358, -2.980813, 5.687675,
2.905767, -2.980813, 5.687675,
-3.193358, 3.764431, -5.674888,
2.905767, 3.764431, -5.674888,
-3.193358, 3.764431, 5.687675,
2.905767, 3.764431, 5.687675,
2.905767, -2.980813, -5.674888,
2.905767, 3.764431, -5.674888,
2.905767, -2.980813, 5.687675,
2.905767, 3.764431, 5.687675,
2.905767, -2.980813, -5.674888,
2.905767, -2.980813, 5.687675,
2.905767, 3.764431, -5.674888,
2.905767, 3.764431, 5.687675
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
var radius = 7.771307;
var distance = 34.57542;
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
mvMatrix.translate( 0.1437958, -0.3918089, -0.006393909 );
mvMatrix.scale( 1.377655, 1.245691, 0.7394889 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57542);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Pirimiphos-Methyl<-read.table("Pirimiphos-Methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pirimiphos-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
y<-Pirimiphos-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
z<-Pirimiphos-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
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
-3.104536, -0.349555, -1.369486, 0, 0, 1, 1, 1,
-3.100161, 0.09161934, -2.93815, 1, 0, 0, 1, 1,
-2.887557, 0.4165881, -2.684247, 1, 0, 0, 1, 1,
-2.845493, 0.02824076, -1.619818, 1, 0, 0, 1, 1,
-2.735986, -0.2147856, -1.222877, 1, 0, 0, 1, 1,
-2.730353, 0.2856672, -1.755418, 1, 0, 0, 1, 1,
-2.718565, 0.9434097, -0.8014782, 0, 0, 0, 1, 1,
-2.654764, 0.1909101, -0.2676849, 0, 0, 0, 1, 1,
-2.608938, -0.4659865, -1.445517, 0, 0, 0, 1, 1,
-2.573544, 0.9946523, -0.3208369, 0, 0, 0, 1, 1,
-2.501676, 1.46305, -1.555644, 0, 0, 0, 1, 1,
-2.484884, -0.6785396, -2.924324, 0, 0, 0, 1, 1,
-2.483218, -1.049372, -3.88793, 0, 0, 0, 1, 1,
-2.470516, -0.398728, -1.96173, 1, 1, 1, 1, 1,
-2.415595, 1.612683, -0.7521333, 1, 1, 1, 1, 1,
-2.415483, -0.2754606, -0.8335629, 1, 1, 1, 1, 1,
-2.318288, -0.3287126, -3.639452, 1, 1, 1, 1, 1,
-2.309021, -0.7159848, -2.463722, 1, 1, 1, 1, 1,
-2.290462, -0.01402139, 0.2049527, 1, 1, 1, 1, 1,
-2.251111, -0.8600554, -3.033095, 1, 1, 1, 1, 1,
-2.220895, 0.8116618, -1.487308, 1, 1, 1, 1, 1,
-2.201697, 0.9959653, -1.630837, 1, 1, 1, 1, 1,
-2.158362, 0.9953654, -3.548535, 1, 1, 1, 1, 1,
-2.146441, 0.8291966, -1.21884, 1, 1, 1, 1, 1,
-2.102437, 0.6581541, 1.203005, 1, 1, 1, 1, 1,
-2.087978, -0.4697675, -2.563746, 1, 1, 1, 1, 1,
-2.063679, -1.299736, -2.653432, 1, 1, 1, 1, 1,
-2.032594, -1.000932, -3.30425, 1, 1, 1, 1, 1,
-2.029397, 0.2905963, -2.35798, 0, 0, 1, 1, 1,
-2.001723, -0.9074441, -3.165742, 1, 0, 0, 1, 1,
-1.9729, 0.6047069, -1.238104, 1, 0, 0, 1, 1,
-1.968386, 0.5923268, -1.8651, 1, 0, 0, 1, 1,
-1.965893, 0.6307531, -3.231627, 1, 0, 0, 1, 1,
-1.961572, -0.365828, -2.310244, 1, 0, 0, 1, 1,
-1.946317, -1.030398, -0.4503366, 0, 0, 0, 1, 1,
-1.909433, 2.074716, 0.3421105, 0, 0, 0, 1, 1,
-1.897639, -0.4929022, -2.110163, 0, 0, 0, 1, 1,
-1.891556, 0.01008373, -1.121738, 0, 0, 0, 1, 1,
-1.853291, 0.3217831, -0.999329, 0, 0, 0, 1, 1,
-1.837094, 0.1128975, -1.180459, 0, 0, 0, 1, 1,
-1.827961, 0.1780904, -1.689477, 0, 0, 0, 1, 1,
-1.827441, 0.1458958, -1.322329, 1, 1, 1, 1, 1,
-1.821923, -0.455008, -1.990914, 1, 1, 1, 1, 1,
-1.816791, -0.3367316, -1.846982, 1, 1, 1, 1, 1,
-1.806198, -0.4672447, -1.329606, 1, 1, 1, 1, 1,
-1.804023, -0.3978126, -1.120527, 1, 1, 1, 1, 1,
-1.793934, 0.09708201, -3.023233, 1, 1, 1, 1, 1,
-1.79183, -0.5261829, -2.283815, 1, 1, 1, 1, 1,
-1.791357, -0.05218485, -2.45169, 1, 1, 1, 1, 1,
-1.761664, -0.8928314, -0.4959852, 1, 1, 1, 1, 1,
-1.754564, -1.004626, -0.002745981, 1, 1, 1, 1, 1,
-1.74406, 1.040487, 0.934306, 1, 1, 1, 1, 1,
-1.72397, -0.2009863, -2.579445, 1, 1, 1, 1, 1,
-1.70825, -1.772883, -3.057601, 1, 1, 1, 1, 1,
-1.690477, 0.4127501, -0.6052958, 1, 1, 1, 1, 1,
-1.68977, -0.819539, -1.143489, 1, 1, 1, 1, 1,
-1.68018, -0.5664026, -0.1397456, 0, 0, 1, 1, 1,
-1.673801, 1.205467, -0.70557, 1, 0, 0, 1, 1,
-1.671237, 0.08099518, -1.390118, 1, 0, 0, 1, 1,
-1.650526, -0.3555977, -1.173656, 1, 0, 0, 1, 1,
-1.643628, 0.7521498, 0.2389907, 1, 0, 0, 1, 1,
-1.620843, -0.02468462, -0.6282286, 1, 0, 0, 1, 1,
-1.619073, -0.5727487, -0.8945214, 0, 0, 0, 1, 1,
-1.604627, -0.8133447, -2.80968, 0, 0, 0, 1, 1,
-1.589986, -0.2541252, -0.1058295, 0, 0, 0, 1, 1,
-1.58726, -0.9329539, -0.5577099, 0, 0, 0, 1, 1,
-1.57862, -0.6647891, -2.415844, 0, 0, 0, 1, 1,
-1.570777, 0.1889966, -2.480263, 0, 0, 0, 1, 1,
-1.563333, 0.4219475, -1.108362, 0, 0, 0, 1, 1,
-1.549781, -0.7589052, -2.325325, 1, 1, 1, 1, 1,
-1.544053, -2.797645, -5.144249, 1, 1, 1, 1, 1,
-1.535233, 0.1807645, -2.635321, 1, 1, 1, 1, 1,
-1.532256, 0.7193925, -2.4797, 1, 1, 1, 1, 1,
-1.528057, -1.169363, -2.73579, 1, 1, 1, 1, 1,
-1.525851, 0.1521114, -2.848263, 1, 1, 1, 1, 1,
-1.523226, 1.832098, -1.868203, 1, 1, 1, 1, 1,
-1.50917, 3.666199, -1.347994, 1, 1, 1, 1, 1,
-1.504668, -0.318572, -2.94152, 1, 1, 1, 1, 1,
-1.493648, 1.546609, -3.621057, 1, 1, 1, 1, 1,
-1.490383, -0.8581127, -2.808014, 1, 1, 1, 1, 1,
-1.488993, -0.2320572, -1.284729, 1, 1, 1, 1, 1,
-1.48613, 0.3325844, -1.909622, 1, 1, 1, 1, 1,
-1.484122, 0.2796634, -2.238, 1, 1, 1, 1, 1,
-1.461022, -1.329612, -1.042266, 1, 1, 1, 1, 1,
-1.455175, -0.3192382, -3.402832, 0, 0, 1, 1, 1,
-1.451367, -0.01747813, -2.982962, 1, 0, 0, 1, 1,
-1.447986, 0.0144986, -1.776563, 1, 0, 0, 1, 1,
-1.440851, -0.9383715, -1.257594, 1, 0, 0, 1, 1,
-1.438113, -1.004333, -2.760465, 1, 0, 0, 1, 1,
-1.436921, -0.4972179, -2.265206, 1, 0, 0, 1, 1,
-1.429523, -0.4286989, -2.950567, 0, 0, 0, 1, 1,
-1.405395, -0.1000226, -1.230825, 0, 0, 0, 1, 1,
-1.404099, 0.2397722, 2.223595, 0, 0, 0, 1, 1,
-1.389369, -1.868477, -3.717807, 0, 0, 0, 1, 1,
-1.381209, 0.3868096, -1.377493, 0, 0, 0, 1, 1,
-1.372372, -0.6633655, -1.292937, 0, 0, 0, 1, 1,
-1.367863, -1.349297, -3.299799, 0, 0, 0, 1, 1,
-1.365881, 1.413564, -0.4283382, 1, 1, 1, 1, 1,
-1.355671, 0.7827591, -2.104713, 1, 1, 1, 1, 1,
-1.349915, 1.024854, -2.056058, 1, 1, 1, 1, 1,
-1.346564, -0.8580463, -2.195027, 1, 1, 1, 1, 1,
-1.343719, 0.5954458, -0.1664013, 1, 1, 1, 1, 1,
-1.340853, 0.9133263, -0.7487698, 1, 1, 1, 1, 1,
-1.337126, -1.40138, -2.539502, 1, 1, 1, 1, 1,
-1.33099, 0.3362339, -1.44065, 1, 1, 1, 1, 1,
-1.326012, -1.764139, -2.304726, 1, 1, 1, 1, 1,
-1.323139, -0.4459286, 0.1087809, 1, 1, 1, 1, 1,
-1.322137, -0.8358073, -2.294795, 1, 1, 1, 1, 1,
-1.311904, 0.2460661, -0.4613833, 1, 1, 1, 1, 1,
-1.310417, -0.8798292, -2.438332, 1, 1, 1, 1, 1,
-1.309161, -0.6812489, -1.967759, 1, 1, 1, 1, 1,
-1.308964, 0.585939, 1.034612, 1, 1, 1, 1, 1,
-1.308848, -0.6539909, -1.801949, 0, 0, 1, 1, 1,
-1.295913, -1.03527, -3.051987, 1, 0, 0, 1, 1,
-1.277715, 1.020756, 1.293876, 1, 0, 0, 1, 1,
-1.272538, 1.202944, -0.9822562, 1, 0, 0, 1, 1,
-1.267054, -0.02908706, 0.1355551, 1, 0, 0, 1, 1,
-1.266567, 0.9919685, 0.524561, 1, 0, 0, 1, 1,
-1.266193, 0.8697904, -0.3079608, 0, 0, 0, 1, 1,
-1.261729, -0.1223478, -1.907688, 0, 0, 0, 1, 1,
-1.260599, -0.5532497, -0.3863316, 0, 0, 0, 1, 1,
-1.245535, 0.5869297, -0.3671521, 0, 0, 0, 1, 1,
-1.243377, 0.0883198, -1.699667, 0, 0, 0, 1, 1,
-1.237769, -0.837643, -2.048287, 0, 0, 0, 1, 1,
-1.226032, -0.9585342, -2.07332, 0, 0, 0, 1, 1,
-1.218086, 0.04820785, -1.77247, 1, 1, 1, 1, 1,
-1.204156, 0.4533776, -0.1417036, 1, 1, 1, 1, 1,
-1.182705, -0.8021565, -2.414318, 1, 1, 1, 1, 1,
-1.173538, 0.4764906, -1.310397, 1, 1, 1, 1, 1,
-1.162901, 0.59972, -1.077897, 1, 1, 1, 1, 1,
-1.149069, 1.205854, 1.275144, 1, 1, 1, 1, 1,
-1.1439, 0.2646385, -0.6638461, 1, 1, 1, 1, 1,
-1.134516, -1.056262, -1.059388, 1, 1, 1, 1, 1,
-1.125024, 0.2868718, -3.027459, 1, 1, 1, 1, 1,
-1.11029, 0.8241572, -2.175715, 1, 1, 1, 1, 1,
-1.097256, -0.9529291, -1.34826, 1, 1, 1, 1, 1,
-1.092443, -0.7140824, -2.298224, 1, 1, 1, 1, 1,
-1.090586, 0.9746089, -0.1791837, 1, 1, 1, 1, 1,
-1.08436, 0.9788186, -0.3243727, 1, 1, 1, 1, 1,
-1.08164, -0.9922109, -1.7999, 1, 1, 1, 1, 1,
-1.076378, -0.7207718, -1.960638, 0, 0, 1, 1, 1,
-1.068461, 1.060121, -0.8493038, 1, 0, 0, 1, 1,
-1.065067, 0.8131456, 0.1775326, 1, 0, 0, 1, 1,
-1.061959, -0.6034579, 0.4413278, 1, 0, 0, 1, 1,
-1.059005, 1.197832, -1.235232, 1, 0, 0, 1, 1,
-1.057788, -0.3295136, -1.819504, 1, 0, 0, 1, 1,
-1.057506, -0.8437244, -0.9035161, 0, 0, 0, 1, 1,
-1.051483, 0.5118655, 0.3318639, 0, 0, 0, 1, 1,
-1.039628, 0.4007384, -2.116011, 0, 0, 0, 1, 1,
-1.03823, -1.388272, -3.179792, 0, 0, 0, 1, 1,
-1.035311, -0.268549, -3.446724, 0, 0, 0, 1, 1,
-1.03103, -0.3678894, -2.012721, 0, 0, 0, 1, 1,
-1.030313, -0.1122308, -1.807683, 0, 0, 0, 1, 1,
-1.029634, -0.3031838, -1.342489, 1, 1, 1, 1, 1,
-1.018383, -0.402323, -1.891883, 1, 1, 1, 1, 1,
-1.010139, -0.8716102, -1.415403, 1, 1, 1, 1, 1,
-1.009196, -0.5482204, -0.9861066, 1, 1, 1, 1, 1,
-1.005738, 0.05699969, -1.031065, 1, 1, 1, 1, 1,
-1.001121, 0.2622945, -1.590227, 1, 1, 1, 1, 1,
-0.9906592, 0.2445385, -3.621552, 1, 1, 1, 1, 1,
-0.9865835, 0.7534907, -2.071514, 1, 1, 1, 1, 1,
-0.9809427, -0.02496197, -0.7018351, 1, 1, 1, 1, 1,
-0.9694502, 0.09854452, -2.82027, 1, 1, 1, 1, 1,
-0.9692881, 1.844798, 0.2856193, 1, 1, 1, 1, 1,
-0.9645664, 2.251239, -1.263911, 1, 1, 1, 1, 1,
-0.9563836, -0.8161452, -2.621002, 1, 1, 1, 1, 1,
-0.9553584, 1.220118, -0.002874824, 1, 1, 1, 1, 1,
-0.9550503, -0.2549393, -2.399521, 1, 1, 1, 1, 1,
-0.9534901, 0.4703009, -0.5835249, 0, 0, 1, 1, 1,
-0.948023, -0.0382649, -1.059213, 1, 0, 0, 1, 1,
-0.9456995, 1.401227, 1.908393, 1, 0, 0, 1, 1,
-0.9335479, -0.1030428, -0.888769, 1, 0, 0, 1, 1,
-0.9303579, -0.1375272, -0.9174215, 1, 0, 0, 1, 1,
-0.9275359, -1.566418, -2.086947, 1, 0, 0, 1, 1,
-0.9268182, -0.05250683, -3.148524, 0, 0, 0, 1, 1,
-0.926105, 1.294219, 1.162087, 0, 0, 0, 1, 1,
-0.9244409, 1.00413, -1.509146, 0, 0, 0, 1, 1,
-0.9227101, -1.450713, -3.700936, 0, 0, 0, 1, 1,
-0.9223004, 1.256906, -1.025975, 0, 0, 0, 1, 1,
-0.9210349, -0.3851018, -2.727234, 0, 0, 0, 1, 1,
-0.9206119, 0.9769182, -0.5738081, 0, 0, 0, 1, 1,
-0.9200076, 0.4472287, -1.912071, 1, 1, 1, 1, 1,
-0.9187432, -1.681843, -3.429241, 1, 1, 1, 1, 1,
-0.9181948, 0.2883441, -2.718709, 1, 1, 1, 1, 1,
-0.9181063, -0.6495407, -1.911374, 1, 1, 1, 1, 1,
-0.9160953, 0.1205322, -0.5001676, 1, 1, 1, 1, 1,
-0.9125285, -0.4042152, -1.578128, 1, 1, 1, 1, 1,
-0.9114963, -0.4250886, -0.7165644, 1, 1, 1, 1, 1,
-0.9107393, -1.887957, -4.238193, 1, 1, 1, 1, 1,
-0.9061383, 0.1870685, -2.543188, 1, 1, 1, 1, 1,
-0.9010329, 0.4193128, -0.1083879, 1, 1, 1, 1, 1,
-0.8961698, -1.516504, -2.888636, 1, 1, 1, 1, 1,
-0.8869686, 0.5445538, -2.927996, 1, 1, 1, 1, 1,
-0.8797815, 0.3020678, -2.135901, 1, 1, 1, 1, 1,
-0.879487, 0.1240662, -1.656288, 1, 1, 1, 1, 1,
-0.877519, 0.7967426, -1.05094, 1, 1, 1, 1, 1,
-0.8769644, 0.1296953, 0.1377975, 0, 0, 1, 1, 1,
-0.8738093, -0.4186442, -4.252502, 1, 0, 0, 1, 1,
-0.8733225, -1.244425, -3.229029, 1, 0, 0, 1, 1,
-0.8684407, 1.558915, -2.029075, 1, 0, 0, 1, 1,
-0.8676901, 1.196752, -1.370472, 1, 0, 0, 1, 1,
-0.8661855, 0.3300583, -1.898406, 1, 0, 0, 1, 1,
-0.8602419, -0.5809315, -2.510949, 0, 0, 0, 1, 1,
-0.8567665, 0.1704618, 0.1573369, 0, 0, 0, 1, 1,
-0.8549706, 0.2127631, -2.696676, 0, 0, 0, 1, 1,
-0.85233, 0.4309025, 0.00986266, 0, 0, 0, 1, 1,
-0.8502514, 0.6037132, -0.7542726, 0, 0, 0, 1, 1,
-0.8489885, 0.4219167, -1.948605, 0, 0, 0, 1, 1,
-0.8448374, 0.5489128, -0.6856539, 0, 0, 0, 1, 1,
-0.8412374, 0.3939621, -1.262756, 1, 1, 1, 1, 1,
-0.8359894, -1.893545, -2.22829, 1, 1, 1, 1, 1,
-0.8303851, -0.5491912, -1.75587, 1, 1, 1, 1, 1,
-0.8292741, -0.211807, -0.4657139, 1, 1, 1, 1, 1,
-0.8264266, 1.516155, -0.5817372, 1, 1, 1, 1, 1,
-0.8242744, 1.689658, -0.01054584, 1, 1, 1, 1, 1,
-0.8234806, -1.376188, -4.59376, 1, 1, 1, 1, 1,
-0.821669, 1.432168, -0.2683874, 1, 1, 1, 1, 1,
-0.819275, -0.6977751, -2.771595, 1, 1, 1, 1, 1,
-0.817442, -0.4396523, -2.764734, 1, 1, 1, 1, 1,
-0.8167687, 0.08619956, -0.07144315, 1, 1, 1, 1, 1,
-0.8166411, -0.8211998, -2.18853, 1, 1, 1, 1, 1,
-0.8150452, 1.541494, 0.05333906, 1, 1, 1, 1, 1,
-0.8082911, 0.3065028, -1.61531, 1, 1, 1, 1, 1,
-0.8038346, 2.075643, -1.621042, 1, 1, 1, 1, 1,
-0.8010583, -0.9560593, -3.494518, 0, 0, 1, 1, 1,
-0.8007527, -0.02318567, -1.796802, 1, 0, 0, 1, 1,
-0.7983907, 0.2777424, -1.404141, 1, 0, 0, 1, 1,
-0.7843934, -0.7686096, -1.072542, 1, 0, 0, 1, 1,
-0.7841119, -1.260028, -2.548638, 1, 0, 0, 1, 1,
-0.7831059, 0.9298287, -1.892451, 1, 0, 0, 1, 1,
-0.7824313, -1.633555, -4.921169, 0, 0, 0, 1, 1,
-0.7823781, -0.1720973, -0.9561064, 0, 0, 0, 1, 1,
-0.7816713, -0.3508303, -3.108889, 0, 0, 0, 1, 1,
-0.7802893, 1.289682, -0.5304357, 0, 0, 0, 1, 1,
-0.7790047, -0.538765, -1.436439, 0, 0, 0, 1, 1,
-0.7742211, -2.076181, -2.667604, 0, 0, 0, 1, 1,
-0.771592, 1.46612, -0.1523708, 0, 0, 0, 1, 1,
-0.770399, -1.372461, -2.354226, 1, 1, 1, 1, 1,
-0.7594473, -1.04664, -2.216554, 1, 1, 1, 1, 1,
-0.7591405, -0.2346504, -1.473578, 1, 1, 1, 1, 1,
-0.7525831, 1.073242, -0.9660909, 1, 1, 1, 1, 1,
-0.7506604, 1.800826, -0.9614841, 1, 1, 1, 1, 1,
-0.7429692, 0.4344167, -1.830339, 1, 1, 1, 1, 1,
-0.7382209, 0.1942898, -2.187111, 1, 1, 1, 1, 1,
-0.7369194, 0.6675642, -1.938311, 1, 1, 1, 1, 1,
-0.736712, -0.586472, -2.294656, 1, 1, 1, 1, 1,
-0.7353331, -0.3356005, -2.020227, 1, 1, 1, 1, 1,
-0.7352399, -1.974597, -4.050858, 1, 1, 1, 1, 1,
-0.7317688, 0.4509286, -1.427529, 1, 1, 1, 1, 1,
-0.7311208, 0.3987729, -0.9619113, 1, 1, 1, 1, 1,
-0.7254728, -1.334314, -0.4253049, 1, 1, 1, 1, 1,
-0.7187241, -0.760529, -1.329508, 1, 1, 1, 1, 1,
-0.7178621, 0.5722405, 0.4000412, 0, 0, 1, 1, 1,
-0.7176934, -1.572728, -3.598518, 1, 0, 0, 1, 1,
-0.7146145, -1.195279, -1.185002, 1, 0, 0, 1, 1,
-0.7127484, -1.488663, -2.79559, 1, 0, 0, 1, 1,
-0.7001991, -1.753216, -4.532121, 1, 0, 0, 1, 1,
-0.6992294, 0.3810916, -1.424494, 1, 0, 0, 1, 1,
-0.6973662, -0.8761401, -4.729471, 0, 0, 0, 1, 1,
-0.6952132, 0.2998273, -2.600243, 0, 0, 0, 1, 1,
-0.6920563, 0.9016856, -0.8718649, 0, 0, 0, 1, 1,
-0.6832802, -0.07202753, -0.4911369, 0, 0, 0, 1, 1,
-0.6823393, -0.6919391, -2.451244, 0, 0, 0, 1, 1,
-0.676703, -0.2964729, -3.292507, 0, 0, 0, 1, 1,
-0.6766381, -0.9333404, -3.821724, 0, 0, 0, 1, 1,
-0.6756756, -0.5783348, -1.812767, 1, 1, 1, 1, 1,
-0.672703, -0.8280684, -2.524373, 1, 1, 1, 1, 1,
-0.6700121, -0.4807289, -1.777788, 1, 1, 1, 1, 1,
-0.6611284, -1.005546, -1.968712, 1, 1, 1, 1, 1,
-0.6608843, -1.554397, -2.226573, 1, 1, 1, 1, 1,
-0.6582388, -0.7261346, -1.085636, 1, 1, 1, 1, 1,
-0.6550863, -0.5031904, -3.890083, 1, 1, 1, 1, 1,
-0.6542379, 0.08071179, -1.670975, 1, 1, 1, 1, 1,
-0.6502976, -1.152906, -1.677653, 1, 1, 1, 1, 1,
-0.6479222, 0.6017302, -0.7131507, 1, 1, 1, 1, 1,
-0.6442516, 0.559352, 0.3271735, 1, 1, 1, 1, 1,
-0.6404132, -0.1359122, -1.656031, 1, 1, 1, 1, 1,
-0.6358892, 2.133895, -0.04563892, 1, 1, 1, 1, 1,
-0.6327707, -1.087712, -3.625479, 1, 1, 1, 1, 1,
-0.6206028, 0.4376538, 0.8473706, 1, 1, 1, 1, 1,
-0.6183452, -1.622471, -3.435316, 0, 0, 1, 1, 1,
-0.6080121, 0.03555439, -1.308759, 1, 0, 0, 1, 1,
-0.6079191, -2.400912, -3.416008, 1, 0, 0, 1, 1,
-0.6066455, 1.605841, -2.142529, 1, 0, 0, 1, 1,
-0.6060165, -0.07470395, -1.534859, 1, 0, 0, 1, 1,
-0.6052402, 0.0415176, -1.072653, 1, 0, 0, 1, 1,
-0.600676, -2.706749, -3.402804, 0, 0, 0, 1, 1,
-0.6005322, -0.04664388, -1.004526, 0, 0, 0, 1, 1,
-0.5944167, 1.740702, 0.2774075, 0, 0, 0, 1, 1,
-0.5943001, -0.4365206, -2.318523, 0, 0, 0, 1, 1,
-0.592819, -1.308144, -3.382074, 0, 0, 0, 1, 1,
-0.5922046, -0.7504298, -1.355147, 0, 0, 0, 1, 1,
-0.5897455, -0.04289411, -2.201446, 0, 0, 0, 1, 1,
-0.5877842, 0.7650146, 0.2776988, 1, 1, 1, 1, 1,
-0.5861484, -0.07433435, -1.217302, 1, 1, 1, 1, 1,
-0.5850286, -1.272065, -2.45577, 1, 1, 1, 1, 1,
-0.5838839, -0.4633196, -3.36939, 1, 1, 1, 1, 1,
-0.582567, -0.9418945, -1.913046, 1, 1, 1, 1, 1,
-0.581898, -0.5647526, -2.159408, 1, 1, 1, 1, 1,
-0.5818535, -0.9162938, -1.78071, 1, 1, 1, 1, 1,
-0.5816035, -0.3770272, -3.366411, 1, 1, 1, 1, 1,
-0.5754157, -0.7722936, -4.792961, 1, 1, 1, 1, 1,
-0.5745934, 0.1961287, -0.0977064, 1, 1, 1, 1, 1,
-0.5723163, 0.6988978, -0.5704482, 1, 1, 1, 1, 1,
-0.566245, -0.8068706, -5.28173, 1, 1, 1, 1, 1,
-0.5656701, -1.097153, -3.006599, 1, 1, 1, 1, 1,
-0.5611818, -0.3249981, -1.214969, 1, 1, 1, 1, 1,
-0.5478952, -0.5967407, -2.025634, 1, 1, 1, 1, 1,
-0.542918, -1.586436, -2.599978, 0, 0, 1, 1, 1,
-0.5423536, 1.049717, -0.8442983, 1, 0, 0, 1, 1,
-0.5398492, 1.003657, -0.6638339, 1, 0, 0, 1, 1,
-0.5379001, -0.1105463, -1.73048, 1, 0, 0, 1, 1,
-0.5349897, 0.5620281, -1.311947, 1, 0, 0, 1, 1,
-0.5338057, 0.3349951, -1.167548, 1, 0, 0, 1, 1,
-0.5328252, -1.425758, -1.601688, 0, 0, 0, 1, 1,
-0.5310861, -0.006116503, -2.547605, 0, 0, 0, 1, 1,
-0.52869, -0.03019526, -1.87037, 0, 0, 0, 1, 1,
-0.5204428, 0.1034341, -2.834747, 0, 0, 0, 1, 1,
-0.5172937, -1.89477, -3.331517, 0, 0, 0, 1, 1,
-0.5171437, -2.598487, -3.422348, 0, 0, 0, 1, 1,
-0.5165633, -0.4805232, -2.262925, 0, 0, 0, 1, 1,
-0.5155178, -0.8753809, -2.055612, 1, 1, 1, 1, 1,
-0.5154878, 0.1779141, -0.3671701, 1, 1, 1, 1, 1,
-0.5145929, 1.229776, -0.08928154, 1, 1, 1, 1, 1,
-0.5132455, -0.1820202, -1.150658, 1, 1, 1, 1, 1,
-0.5113088, -0.2433952, -3.359425, 1, 1, 1, 1, 1,
-0.5105947, -0.5771402, -3.59095, 1, 1, 1, 1, 1,
-0.5087283, 0.5166679, 1.293799, 1, 1, 1, 1, 1,
-0.5080677, 1.132497, 0.1624712, 1, 1, 1, 1, 1,
-0.5013368, -0.8764999, -2.826776, 1, 1, 1, 1, 1,
-0.4965505, -0.4752927, -2.302295, 1, 1, 1, 1, 1,
-0.4940647, -0.7659003, -2.490281, 1, 1, 1, 1, 1,
-0.493707, 1.360098, 0.9837344, 1, 1, 1, 1, 1,
-0.4854293, -1.033403, -4.236317, 1, 1, 1, 1, 1,
-0.4772767, -0.2636355, -2.554353, 1, 1, 1, 1, 1,
-0.4761091, -0.343285, -3.749182, 1, 1, 1, 1, 1,
-0.4715061, -0.9821865, -2.685767, 0, 0, 1, 1, 1,
-0.4667339, -0.6927077, -0.8795711, 1, 0, 0, 1, 1,
-0.4653557, 0.3718847, -1.487831, 1, 0, 0, 1, 1,
-0.4646632, -0.6157004, -4.775329, 1, 0, 0, 1, 1,
-0.4626622, 1.324312, -0.7656595, 1, 0, 0, 1, 1,
-0.4625047, 0.4332177, -0.7507541, 1, 0, 0, 1, 1,
-0.4622951, 0.2491698, -1.176453, 0, 0, 0, 1, 1,
-0.4612259, -1.463151, -2.982162, 0, 0, 0, 1, 1,
-0.460924, 0.0834335, -3.405991, 0, 0, 0, 1, 1,
-0.4602638, -1.28632, -2.584851, 0, 0, 0, 1, 1,
-0.4589215, -0.58621, -3.433788, 0, 0, 0, 1, 1,
-0.4580784, -0.6201493, -2.162839, 0, 0, 0, 1, 1,
-0.4505879, 0.02238559, -1.319241, 0, 0, 0, 1, 1,
-0.4503613, 1.685309, 0.5182016, 1, 1, 1, 1, 1,
-0.4471152, 1.552058, -0.5226076, 1, 1, 1, 1, 1,
-0.4432352, 0.6035711, -1.40526, 1, 1, 1, 1, 1,
-0.4381936, -0.07063051, -0.5597941, 1, 1, 1, 1, 1,
-0.4347071, -1.126435, -3.125954, 1, 1, 1, 1, 1,
-0.4342947, 0.3512718, -0.9957435, 1, 1, 1, 1, 1,
-0.4295772, 0.8220892, -2.05338, 1, 1, 1, 1, 1,
-0.4254596, -0.735252, -2.608594, 1, 1, 1, 1, 1,
-0.4132555, -1.260145, -3.476361, 1, 1, 1, 1, 1,
-0.4074692, -1.029895, -1.289867, 1, 1, 1, 1, 1,
-0.4074194, 1.382508, -1.139128, 1, 1, 1, 1, 1,
-0.4051925, -1.068564, -1.4122, 1, 1, 1, 1, 1,
-0.4029263, 0.8007549, 0.07677703, 1, 1, 1, 1, 1,
-0.4004377, 1.903534, -1.13071, 1, 1, 1, 1, 1,
-0.3982403, -0.05919724, -1.451858, 1, 1, 1, 1, 1,
-0.3965118, 0.1207507, -1.047941, 0, 0, 1, 1, 1,
-0.392004, -0.3158764, -1.085516, 1, 0, 0, 1, 1,
-0.3904884, 0.6660378, -0.4572369, 1, 0, 0, 1, 1,
-0.3870209, -0.9787865, -1.140414, 1, 0, 0, 1, 1,
-0.3859113, -1.617059, -3.626064, 1, 0, 0, 1, 1,
-0.3786442, -2.283511, -3.993761, 1, 0, 0, 1, 1,
-0.3772276, -0.4431407, -3.0693, 0, 0, 0, 1, 1,
-0.3764949, 0.4823892, -2.791954, 0, 0, 0, 1, 1,
-0.376103, -1.518842, -2.622736, 0, 0, 0, 1, 1,
-0.3744327, 1.288265, 0.7787802, 0, 0, 0, 1, 1,
-0.3730593, 0.009600877, -2.245258, 0, 0, 0, 1, 1,
-0.3683843, -1.120884, -3.515469, 0, 0, 0, 1, 1,
-0.3655869, 0.1196087, -2.065597, 0, 0, 0, 1, 1,
-0.344769, 0.2634751, -2.429282, 1, 1, 1, 1, 1,
-0.338679, -1.203332, -2.713265, 1, 1, 1, 1, 1,
-0.3335284, 0.8180256, -0.4694475, 1, 1, 1, 1, 1,
-0.3311383, -0.6125326, -2.40419, 1, 1, 1, 1, 1,
-0.3306293, -0.3094803, -4.11346, 1, 1, 1, 1, 1,
-0.3300309, 1.047739, -0.9534925, 1, 1, 1, 1, 1,
-0.3290912, 0.5640868, -0.8614687, 1, 1, 1, 1, 1,
-0.3268152, 0.3934554, -1.576314, 1, 1, 1, 1, 1,
-0.3246197, 1.54078, 0.2951933, 1, 1, 1, 1, 1,
-0.3239163, 0.4432452, -2.429719, 1, 1, 1, 1, 1,
-0.319111, 0.07151294, -1.860292, 1, 1, 1, 1, 1,
-0.3157393, -0.1515705, -2.592, 1, 1, 1, 1, 1,
-0.3152176, 0.1805538, -0.8696942, 1, 1, 1, 1, 1,
-0.3126273, 0.7765226, -1.532715, 1, 1, 1, 1, 1,
-0.3121073, -0.6682703, -0.2384428, 1, 1, 1, 1, 1,
-0.3088055, -1.467442, -3.649741, 0, 0, 1, 1, 1,
-0.3073825, 0.3369408, 0.4240456, 1, 0, 0, 1, 1,
-0.3063944, -0.220342, -2.73239, 1, 0, 0, 1, 1,
-0.305539, 1.708646, -0.152037, 1, 0, 0, 1, 1,
-0.3018271, 1.1134, 0.1974775, 1, 0, 0, 1, 1,
-0.2999971, -0.1583572, -3.294668, 1, 0, 0, 1, 1,
-0.2980711, 1.015839, -0.2562306, 0, 0, 0, 1, 1,
-0.2961387, 0.5167188, -1.571252, 0, 0, 0, 1, 1,
-0.295536, -0.1760076, -1.20258, 0, 0, 0, 1, 1,
-0.2939576, 0.9606579, 0.1241978, 0, 0, 0, 1, 1,
-0.2906774, 0.8415291, -1.003518, 0, 0, 0, 1, 1,
-0.288412, 1.382426, 1.683114, 0, 0, 0, 1, 1,
-0.2870371, 0.5648844, 0.5416601, 0, 0, 0, 1, 1,
-0.2827612, 1.060689, -1.285512, 1, 1, 1, 1, 1,
-0.2812538, -1.11867, -2.053593, 1, 1, 1, 1, 1,
-0.2804613, 0.5400982, 0.2505595, 1, 1, 1, 1, 1,
-0.2748598, 1.64178, -0.4226589, 1, 1, 1, 1, 1,
-0.2706292, -0.09913082, -0.8744492, 1, 1, 1, 1, 1,
-0.2682084, 1.387938, 1.222595, 1, 1, 1, 1, 1,
-0.265911, 0.6044934, -0.4849326, 1, 1, 1, 1, 1,
-0.2629966, 0.4584757, -2.244425, 1, 1, 1, 1, 1,
-0.2561857, -1.16085, -1.488189, 1, 1, 1, 1, 1,
-0.2548688, 0.2930271, -1.196519, 1, 1, 1, 1, 1,
-0.2484119, 0.5762166, 1.554906, 1, 1, 1, 1, 1,
-0.2456937, -0.5943037, -5.509413, 1, 1, 1, 1, 1,
-0.2438555, -1.11334, -4.469084, 1, 1, 1, 1, 1,
-0.2384416, 0.7840663, -2.432592, 1, 1, 1, 1, 1,
-0.2337919, 0.1956493, 0.2350283, 1, 1, 1, 1, 1,
-0.2336025, 0.01148784, -1.608946, 0, 0, 1, 1, 1,
-0.2279222, -0.1559173, -2.096287, 1, 0, 0, 1, 1,
-0.2213398, 0.7857672, 0.2361901, 1, 0, 0, 1, 1,
-0.22099, -0.07949661, -1.238315, 1, 0, 0, 1, 1,
-0.2061931, 1.007045, 0.5263365, 1, 0, 0, 1, 1,
-0.2032619, -0.9942718, -2.665857, 1, 0, 0, 1, 1,
-0.2009773, -0.5098289, -3.646274, 0, 0, 0, 1, 1,
-0.2002575, -0.3806979, -4.211351, 0, 0, 0, 1, 1,
-0.1968516, 0.1012829, -0.05067662, 0, 0, 0, 1, 1,
-0.1966719, -1.860719, -4.803664, 0, 0, 0, 1, 1,
-0.1933757, -0.5120337, -3.950444, 0, 0, 0, 1, 1,
-0.1900339, 0.4023208, 0.1191679, 0, 0, 0, 1, 1,
-0.1898408, -0.9889246, -2.631353, 0, 0, 0, 1, 1,
-0.1867753, -0.400087, -0.6852914, 1, 1, 1, 1, 1,
-0.1824926, 0.881765, 0.5701419, 1, 1, 1, 1, 1,
-0.1818152, 0.005808752, -2.508489, 1, 1, 1, 1, 1,
-0.1785601, -0.2194076, -2.585229, 1, 1, 1, 1, 1,
-0.1785075, -0.3728484, -3.688606, 1, 1, 1, 1, 1,
-0.1767445, 0.7908022, -0.8378183, 1, 1, 1, 1, 1,
-0.1759662, 0.6964332, 0.06391868, 1, 1, 1, 1, 1,
-0.1720488, 1.470017, 0.8040295, 1, 1, 1, 1, 1,
-0.168183, 0.5190169, -2.874537, 1, 1, 1, 1, 1,
-0.1623359, -0.324729, -2.921119, 1, 1, 1, 1, 1,
-0.161853, -0.1146463, -1.437639, 1, 1, 1, 1, 1,
-0.1585084, -0.3016417, -3.574894, 1, 1, 1, 1, 1,
-0.1579771, -0.05187676, -1.092674, 1, 1, 1, 1, 1,
-0.1574237, -0.2823876, -1.821264, 1, 1, 1, 1, 1,
-0.1572377, 0.3936962, -1.468671, 1, 1, 1, 1, 1,
-0.1546873, 2.02841, 0.4907534, 0, 0, 1, 1, 1,
-0.1531065, 0.5793115, 0.3065805, 1, 0, 0, 1, 1,
-0.1527415, -0.6583344, -3.414435, 1, 0, 0, 1, 1,
-0.1490563, -1.116558, -2.965512, 1, 0, 0, 1, 1,
-0.1397274, -1.911782, -1.561796, 1, 0, 0, 1, 1,
-0.1362608, -0.4026867, -2.3132, 1, 0, 0, 1, 1,
-0.1357409, 0.4152748, -0.08594014, 0, 0, 0, 1, 1,
-0.1356179, 1.170284, -1.386255, 0, 0, 0, 1, 1,
-0.1330282, 0.8509456, 0.5457395, 0, 0, 0, 1, 1,
-0.1314397, -0.6039831, -4.240198, 0, 0, 0, 1, 1,
-0.128411, -2.388924, -2.618776, 0, 0, 0, 1, 1,
-0.1274419, -0.2881649, -5.024435, 0, 0, 0, 1, 1,
-0.1204568, 1.782882, 0.5850843, 0, 0, 0, 1, 1,
-0.1184899, -0.1790553, -4.419973, 1, 1, 1, 1, 1,
-0.1178763, 0.7123612, 1.235173, 1, 1, 1, 1, 1,
-0.1177828, 1.726113, -0.004500418, 1, 1, 1, 1, 1,
-0.1166731, -0.1124787, -2.842841, 1, 1, 1, 1, 1,
-0.1158535, -0.9010457, -1.219253, 1, 1, 1, 1, 1,
-0.1134725, -0.4478668, -4.114349, 1, 1, 1, 1, 1,
-0.1126657, 0.02895023, -0.1401919, 1, 1, 1, 1, 1,
-0.1103131, 0.9432181, 0.0215417, 1, 1, 1, 1, 1,
-0.1103026, 0.6401486, 0.04550611, 1, 1, 1, 1, 1,
-0.1095983, -0.5840504, -3.388994, 1, 1, 1, 1, 1,
-0.1094297, -0.2183741, -1.587075, 1, 1, 1, 1, 1,
-0.09733126, -0.4166486, -3.96467, 1, 1, 1, 1, 1,
-0.09201006, 1.660327, 1.1739, 1, 1, 1, 1, 1,
-0.09051782, -0.01020801, -0.5894906, 1, 1, 1, 1, 1,
-0.09042142, -2.1562, -2.150609, 1, 1, 1, 1, 1,
-0.08976234, -1.683513, -3.671172, 0, 0, 1, 1, 1,
-0.08118648, -0.216794, -1.028319, 1, 0, 0, 1, 1,
-0.07763685, 1.156455, 0.004371798, 1, 0, 0, 1, 1,
-0.07275531, 0.7444988, -2.352679, 1, 0, 0, 1, 1,
-0.06643985, -1.413502, -3.098206, 1, 0, 0, 1, 1,
-0.0603305, 0.5992494, -0.2562638, 1, 0, 0, 1, 1,
-0.06019291, 0.4101179, -1.330127, 0, 0, 0, 1, 1,
-0.05570184, -1.133276, -3.347251, 0, 0, 0, 1, 1,
-0.05211994, -0.4309692, -4.616928, 0, 0, 0, 1, 1,
-0.04897555, -0.6280048, -4.110487, 0, 0, 0, 1, 1,
-0.04666198, -0.8787674, -3.908375, 0, 0, 0, 1, 1,
-0.04504862, -1.129275, -3.383872, 0, 0, 0, 1, 1,
-0.04437589, 0.8648499, 1.113303, 0, 0, 0, 1, 1,
-0.03522547, 0.3677411, -0.9965323, 1, 1, 1, 1, 1,
-0.03309282, -0.738705, -2.944427, 1, 1, 1, 1, 1,
-0.03284383, 1.624468, 0.3749484, 1, 1, 1, 1, 1,
-0.0312253, 0.2338714, 0.9239391, 1, 1, 1, 1, 1,
-0.03047382, -0.455587, -2.314657, 1, 1, 1, 1, 1,
-0.02686112, 0.4940729, -0.6276414, 1, 1, 1, 1, 1,
-0.02242465, -0.679581, -3.307078, 1, 1, 1, 1, 1,
-0.01976367, -0.07681222, -3.156985, 1, 1, 1, 1, 1,
-0.01848204, -0.7219002, -3.251878, 1, 1, 1, 1, 1,
-0.01830709, 0.6276858, -0.1288401, 1, 1, 1, 1, 1,
-0.01713806, -0.9753804, -3.451157, 1, 1, 1, 1, 1,
-0.01483842, 0.5385203, -0.2639498, 1, 1, 1, 1, 1,
-0.01320968, -1.666233, -3.872759, 1, 1, 1, 1, 1,
-0.01296647, 2.014188, -0.3047211, 1, 1, 1, 1, 1,
-0.01187635, 1.258666, -0.02843774, 1, 1, 1, 1, 1,
-0.01149612, 1.437311, 1.150734, 0, 0, 1, 1, 1,
-0.003930351, -1.033448, -3.094415, 1, 0, 0, 1, 1,
0.001470216, -0.6411463, 2.01691, 1, 0, 0, 1, 1,
0.001917053, -2.882581, 4.050979, 1, 0, 0, 1, 1,
0.003848044, 0.2194329, -0.08135682, 1, 0, 0, 1, 1,
0.004434986, 0.4794905, 0.5731704, 1, 0, 0, 1, 1,
0.005366107, 0.2919742, 0.2402861, 0, 0, 0, 1, 1,
0.005708152, -0.3038388, 3.868501, 0, 0, 0, 1, 1,
0.01275082, 0.8339916, -0.4721932, 0, 0, 0, 1, 1,
0.0129378, 0.8532068, 0.3997997, 0, 0, 0, 1, 1,
0.02721473, -0.5143461, 3.424971, 0, 0, 0, 1, 1,
0.03076007, -0.4150177, 3.635482, 0, 0, 0, 1, 1,
0.0309301, 0.3839788, -1.806702, 0, 0, 0, 1, 1,
0.03181151, 0.9789772, -1.423349, 1, 1, 1, 1, 1,
0.04727369, -1.233878, 2.484154, 1, 1, 1, 1, 1,
0.04939848, -1.525619, 3.195011, 1, 1, 1, 1, 1,
0.05021563, -1.079991, 3.91827, 1, 1, 1, 1, 1,
0.052215, -1.572984, 3.873095, 1, 1, 1, 1, 1,
0.05451645, -1.232531, 3.262021, 1, 1, 1, 1, 1,
0.05513202, -2.335041, 2.589701, 1, 1, 1, 1, 1,
0.05603725, -0.9419275, 3.664976, 1, 1, 1, 1, 1,
0.06686891, -0.9221301, 2.197851, 1, 1, 1, 1, 1,
0.06837014, 0.02970905, 2.469423, 1, 1, 1, 1, 1,
0.07260349, 0.120381, -1.062923, 1, 1, 1, 1, 1,
0.07462808, 0.1630554, 0.5550025, 1, 1, 1, 1, 1,
0.07922965, -0.2823257, 3.24133, 1, 1, 1, 1, 1,
0.08201861, 0.2694263, 0.2658932, 1, 1, 1, 1, 1,
0.08623665, -0.6876914, 1.282343, 1, 1, 1, 1, 1,
0.08803, 0.8170928, -0.544746, 0, 0, 1, 1, 1,
0.09179909, 0.446716, 0.3767217, 1, 0, 0, 1, 1,
0.09272734, 0.1537877, 0.8496808, 1, 0, 0, 1, 1,
0.09571411, -0.8066505, 1.366983, 1, 0, 0, 1, 1,
0.1001636, 1.731683, -1.965994, 1, 0, 0, 1, 1,
0.1012388, -0.523499, 2.995499, 1, 0, 0, 1, 1,
0.1028166, 0.8172969, 0.6505628, 0, 0, 0, 1, 1,
0.104398, -0.4932388, 3.22969, 0, 0, 0, 1, 1,
0.1053683, 0.2576838, 2.111099, 0, 0, 0, 1, 1,
0.10671, -1.436701, 4.588893, 0, 0, 0, 1, 1,
0.1132142, -0.4757071, 4.771462, 0, 0, 0, 1, 1,
0.1140455, -0.8731294, 4.345409, 0, 0, 0, 1, 1,
0.1167968, -0.8409421, 0.6312927, 0, 0, 0, 1, 1,
0.1293905, 1.494963, -0.6145157, 1, 1, 1, 1, 1,
0.1402833, -1.256315, 3.61153, 1, 1, 1, 1, 1,
0.1438827, -0.4622231, 4.337542, 1, 1, 1, 1, 1,
0.1498083, -0.447871, 4.582026, 1, 1, 1, 1, 1,
0.1544387, 0.4709848, -0.01950564, 1, 1, 1, 1, 1,
0.1554371, 0.3976019, 1.72151, 1, 1, 1, 1, 1,
0.1555388, -0.3651813, 3.35454, 1, 1, 1, 1, 1,
0.1562987, -0.7018879, 1.379898, 1, 1, 1, 1, 1,
0.1563065, -0.3347582, 4.596731, 1, 1, 1, 1, 1,
0.1581877, 0.5862426, -0.142942, 1, 1, 1, 1, 1,
0.1607927, -0.5121825, 1.719987, 1, 1, 1, 1, 1,
0.1649928, 1.137788, 1.046211, 1, 1, 1, 1, 1,
0.1674856, 0.2780865, 0.4200578, 1, 1, 1, 1, 1,
0.171679, 0.2104352, 1.081177, 1, 1, 1, 1, 1,
0.1723979, 1.496035, 0.1783043, 1, 1, 1, 1, 1,
0.1769032, 0.9912064, 0.09778442, 0, 0, 1, 1, 1,
0.1771584, -1.337011, 3.937117, 1, 0, 0, 1, 1,
0.1772571, -0.5336906, 2.424216, 1, 0, 0, 1, 1,
0.1773819, -0.6787958, 4.122021, 1, 0, 0, 1, 1,
0.1798455, 1.484043, 0.7278984, 1, 0, 0, 1, 1,
0.1815486, -0.979716, 2.546185, 1, 0, 0, 1, 1,
0.1855046, -1.71261, 5.522201, 0, 0, 0, 1, 1,
0.1872234, -0.4247778, 1.593263, 0, 0, 0, 1, 1,
0.1881315, 0.6243324, -0.6545601, 0, 0, 0, 1, 1,
0.1883433, -1.116797, 2.490731, 0, 0, 0, 1, 1,
0.1966397, 1.248569, -0.4144749, 0, 0, 0, 1, 1,
0.199907, -1.314231, 4.264678, 0, 0, 0, 1, 1,
0.2018903, 0.9079928, 1.134379, 0, 0, 0, 1, 1,
0.2025427, -1.771869, 2.424196, 1, 1, 1, 1, 1,
0.2067391, -0.5058901, 4.212852, 1, 1, 1, 1, 1,
0.2083607, 0.09049515, 0.6669589, 1, 1, 1, 1, 1,
0.208546, -0.4748756, 2.387896, 1, 1, 1, 1, 1,
0.2090666, -1.10446, 3.62897, 1, 1, 1, 1, 1,
0.2099261, 0.3969505, 0.6938352, 1, 1, 1, 1, 1,
0.2107834, -1.184206, 2.701464, 1, 1, 1, 1, 1,
0.2134453, -0.9776828, 3.888674, 1, 1, 1, 1, 1,
0.2193019, 0.376525, 0.7244831, 1, 1, 1, 1, 1,
0.2208967, 0.593342, -1.480361, 1, 1, 1, 1, 1,
0.2221792, -1.341139, 3.309817, 1, 1, 1, 1, 1,
0.2238942, 1.207968, 1.132962, 1, 1, 1, 1, 1,
0.2240258, 0.5552727, 0.8790036, 1, 1, 1, 1, 1,
0.2242222, 0.4740735, 0.8818809, 1, 1, 1, 1, 1,
0.2266988, 0.5921776, 1.341642, 1, 1, 1, 1, 1,
0.2276418, 0.8297424, -1.697227, 0, 0, 1, 1, 1,
0.2364967, -1.163075, 2.741216, 1, 0, 0, 1, 1,
0.2400212, 0.9072136, 0.4855388, 1, 0, 0, 1, 1,
0.2400853, 0.5867087, 0.5342838, 1, 0, 0, 1, 1,
0.2456465, -1.141999, 3.470547, 1, 0, 0, 1, 1,
0.2480739, 0.3041012, -0.1101795, 1, 0, 0, 1, 1,
0.250812, 0.2686037, 1.686572, 0, 0, 0, 1, 1,
0.2547857, 0.6866967, -0.04089612, 0, 0, 0, 1, 1,
0.2587929, -0.233971, 5.162057, 0, 0, 0, 1, 1,
0.2603818, -0.7729215, 2.742218, 0, 0, 0, 1, 1,
0.2629356, 0.6231713, 0.475014, 0, 0, 0, 1, 1,
0.2659068, 0.8965684, 0.2098926, 0, 0, 0, 1, 1,
0.2703951, -0.2534468, 1.689813, 0, 0, 0, 1, 1,
0.2713077, 1.4153, 1.254814, 1, 1, 1, 1, 1,
0.2714259, 0.1293124, 1.618418, 1, 1, 1, 1, 1,
0.2724895, -0.9226077, 4.581766, 1, 1, 1, 1, 1,
0.2767639, 0.8521894, -0.8631489, 1, 1, 1, 1, 1,
0.2780843, -0.800644, 2.949696, 1, 1, 1, 1, 1,
0.2781302, -1.238286, 4.870814, 1, 1, 1, 1, 1,
0.2822267, -0.7206136, 2.249801, 1, 1, 1, 1, 1,
0.2920093, -0.5859591, 3.338721, 1, 1, 1, 1, 1,
0.2939475, 1.503685, 1.962928, 1, 1, 1, 1, 1,
0.2962257, 0.7678792, 0.1615238, 1, 1, 1, 1, 1,
0.2996559, 0.6293069, -0.04258281, 1, 1, 1, 1, 1,
0.3000613, 0.7698179, 0.8828169, 1, 1, 1, 1, 1,
0.3042601, -0.5064077, 3.181206, 1, 1, 1, 1, 1,
0.3064705, -0.4403272, 0.7142449, 1, 1, 1, 1, 1,
0.3094428, -1.171826, 1.672224, 1, 1, 1, 1, 1,
0.3170385, 0.6683319, 1.222993, 0, 0, 1, 1, 1,
0.3190926, 0.3208949, 1.767549, 1, 0, 0, 1, 1,
0.3225059, -1.53498, 1.995227, 1, 0, 0, 1, 1,
0.3257407, -0.1811568, 1.803727, 1, 0, 0, 1, 1,
0.3278477, -0.634132, 2.324292, 1, 0, 0, 1, 1,
0.3280178, -0.2934092, 1.619506, 1, 0, 0, 1, 1,
0.3314613, -0.5049032, 1.55892, 0, 0, 0, 1, 1,
0.3386411, -0.4560964, 3.569466, 0, 0, 0, 1, 1,
0.3400369, 1.035352, 1.502012, 0, 0, 0, 1, 1,
0.3406609, 0.05582929, 0.4811077, 0, 0, 0, 1, 1,
0.3418607, -0.03597383, 2.476162, 0, 0, 0, 1, 1,
0.3429434, 1.594949, 0.02314248, 0, 0, 0, 1, 1,
0.343972, 1.837528, 0.8813079, 0, 0, 0, 1, 1,
0.3444453, 2.212827, -0.9704565, 1, 1, 1, 1, 1,
0.3474514, 1.481751, 0.007529061, 1, 1, 1, 1, 1,
0.3481419, 1.042879, 0.6367368, 1, 1, 1, 1, 1,
0.3509714, -0.03788547, 0.8067828, 1, 1, 1, 1, 1,
0.3593067, 0.7639988, -0.08671875, 1, 1, 1, 1, 1,
0.3616437, 0.3971038, 2.825528, 1, 1, 1, 1, 1,
0.3647857, -0.3038841, 2.666815, 1, 1, 1, 1, 1,
0.3759306, 0.5250465, -0.6276364, 1, 1, 1, 1, 1,
0.3790549, -2.722221, 2.418435, 1, 1, 1, 1, 1,
0.3809871, -0.3883356, 0.008192629, 1, 1, 1, 1, 1,
0.3829062, 0.1900757, 1.16042, 1, 1, 1, 1, 1,
0.3833913, 2.375236, 2.020622, 1, 1, 1, 1, 1,
0.3845619, -0.5015084, 1.442315, 1, 1, 1, 1, 1,
0.386031, 0.0221127, 2.075943, 1, 1, 1, 1, 1,
0.3893679, 0.8309522, -0.06511179, 1, 1, 1, 1, 1,
0.3939773, -0.1180507, 3.146145, 0, 0, 1, 1, 1,
0.3966137, 0.5562956, 0.341689, 1, 0, 0, 1, 1,
0.3969122, 2.36343, -1.316309, 1, 0, 0, 1, 1,
0.3991909, 0.990999, 1.176954, 1, 0, 0, 1, 1,
0.3998053, -1.015406, 3.066972, 1, 0, 0, 1, 1,
0.4000124, 0.1234234, 2.824607, 1, 0, 0, 1, 1,
0.4041779, 0.4228544, 0.190233, 0, 0, 0, 1, 1,
0.4072069, 1.669275, 0.5220982, 0, 0, 0, 1, 1,
0.4077638, -1.512131, 3.190838, 0, 0, 0, 1, 1,
0.409339, -2.058139, 2.640125, 0, 0, 0, 1, 1,
0.4223691, -2.070478, 2.394873, 0, 0, 0, 1, 1,
0.4230428, -0.05579018, 2.529988, 0, 0, 0, 1, 1,
0.423545, 0.4006147, 1.456001, 0, 0, 0, 1, 1,
0.4269009, 0.3997755, 0.9488537, 1, 1, 1, 1, 1,
0.4349707, -0.8584142, 3.677397, 1, 1, 1, 1, 1,
0.4427283, 1.300535, -0.5631568, 1, 1, 1, 1, 1,
0.4439217, 0.05802197, 2.527992, 1, 1, 1, 1, 1,
0.4449406, 1.824515, -0.2597769, 1, 1, 1, 1, 1,
0.4454987, -0.4131125, 3.400235, 1, 1, 1, 1, 1,
0.4516523, 0.3731489, 0.3283096, 1, 1, 1, 1, 1,
0.4530137, -0.4068684, 2.074372, 1, 1, 1, 1, 1,
0.4551766, -0.1087868, 2.189088, 1, 1, 1, 1, 1,
0.4609545, 0.8523856, 0.7361129, 1, 1, 1, 1, 1,
0.4620311, -0.3336734, 1.480436, 1, 1, 1, 1, 1,
0.4718671, -1.631736, 1.8673, 1, 1, 1, 1, 1,
0.4737713, 1.159769, -0.1378449, 1, 1, 1, 1, 1,
0.4750946, -1.871632, 3.473911, 1, 1, 1, 1, 1,
0.4752753, -2.053872, 2.804765, 1, 1, 1, 1, 1,
0.4753362, -1.650136, 4.344553, 0, 0, 1, 1, 1,
0.4779642, -1.054367, 3.037647, 1, 0, 0, 1, 1,
0.4842138, 0.2614038, -0.5447733, 1, 0, 0, 1, 1,
0.484231, 0.840735, 0.8483086, 1, 0, 0, 1, 1,
0.4872443, 0.2640897, 0.2959781, 1, 0, 0, 1, 1,
0.488227, 0.4541959, 1.255932, 1, 0, 0, 1, 1,
0.4899799, -0.7856532, 4.096982, 0, 0, 0, 1, 1,
0.490085, 0.6284226, 0.6041323, 0, 0, 0, 1, 1,
0.497743, 0.8950893, 1.193866, 0, 0, 0, 1, 1,
0.5016831, 0.5906673, 1.147605, 0, 0, 0, 1, 1,
0.5027828, 0.004230648, 0.4952445, 0, 0, 0, 1, 1,
0.5073469, -0.3681769, 1.801321, 0, 0, 0, 1, 1,
0.5086755, -1.149468, 3.544858, 0, 0, 0, 1, 1,
0.5192805, -0.7508497, 4.340457, 1, 1, 1, 1, 1,
0.520785, 1.147096, 0.3617783, 1, 1, 1, 1, 1,
0.5291955, -0.3881463, 1.393645, 1, 1, 1, 1, 1,
0.5363364, 0.7105659, 1.936666, 1, 1, 1, 1, 1,
0.5374573, 0.4649066, 1.687266, 1, 1, 1, 1, 1,
0.5385888, -0.2424886, 1.996689, 1, 1, 1, 1, 1,
0.5393973, -0.7147312, 2.855946, 1, 1, 1, 1, 1,
0.5416721, 1.238433, 0.2565521, 1, 1, 1, 1, 1,
0.551493, 0.1561366, 0.4285958, 1, 1, 1, 1, 1,
0.5541626, 0.5386449, 0.2554391, 1, 1, 1, 1, 1,
0.5543503, -0.7600073, 0.8853763, 1, 1, 1, 1, 1,
0.5597109, 0.2981073, 2.031041, 1, 1, 1, 1, 1,
0.5604998, -0.2858647, 2.20507, 1, 1, 1, 1, 1,
0.5628703, -1.016809, 3.483506, 1, 1, 1, 1, 1,
0.5629701, -0.8550398, 0.4224247, 1, 1, 1, 1, 1,
0.5695218, 2.091838, -0.2176128, 0, 0, 1, 1, 1,
0.5734184, -0.9051798, 2.797621, 1, 0, 0, 1, 1,
0.57789, 0.1016573, 1.836789, 1, 0, 0, 1, 1,
0.5934035, 0.2783363, 1.179783, 1, 0, 0, 1, 1,
0.5943926, 0.7074007, 0.3810734, 1, 0, 0, 1, 1,
0.5958237, -0.5640299, 0.9004838, 1, 0, 0, 1, 1,
0.6031076, -0.6920754, 3.019741, 0, 0, 0, 1, 1,
0.6057882, -0.4554461, 2.432054, 0, 0, 0, 1, 1,
0.6085787, -1.032897, 2.89055, 0, 0, 0, 1, 1,
0.6102892, 0.6918626, 0.9764978, 0, 0, 0, 1, 1,
0.6114663, -0.4359774, 0.655287, 0, 0, 0, 1, 1,
0.6159606, -1.159304, 2.801887, 0, 0, 0, 1, 1,
0.6271207, -0.4810759, 3.35359, 0, 0, 0, 1, 1,
0.6271793, -0.7598584, 3.000168, 1, 1, 1, 1, 1,
0.6321861, -0.916626, 2.230397, 1, 1, 1, 1, 1,
0.6334203, 0.7687599, 0.7831239, 1, 1, 1, 1, 1,
0.6382687, -1.699465, 4.524709, 1, 1, 1, 1, 1,
0.6418157, -0.5195208, 1.659236, 1, 1, 1, 1, 1,
0.6450447, 0.3723164, 1.557982, 1, 1, 1, 1, 1,
0.6463443, 0.2146082, 1.662786, 1, 1, 1, 1, 1,
0.6495514, 0.2029248, 1.209633, 1, 1, 1, 1, 1,
0.65119, -0.3872503, 0.556718, 1, 1, 1, 1, 1,
0.6553484, -0.4142084, 1.570337, 1, 1, 1, 1, 1,
0.655603, -2.218277, 2.97606, 1, 1, 1, 1, 1,
0.6567413, 0.2756841, 2.308855, 1, 1, 1, 1, 1,
0.6580687, -0.01560997, 2.36701, 1, 1, 1, 1, 1,
0.6596195, 0.2426668, 2.799457, 1, 1, 1, 1, 1,
0.6612059, -1.325994, 2.546032, 1, 1, 1, 1, 1,
0.6628243, 1.065647, 1.685689, 0, 0, 1, 1, 1,
0.6640147, -0.427, 0.3949869, 1, 0, 0, 1, 1,
0.6665143, -0.974791, 2.665566, 1, 0, 0, 1, 1,
0.6676136, 0.6725061, 0.4507284, 1, 0, 0, 1, 1,
0.6679444, -0.9280548, 5.192427, 1, 0, 0, 1, 1,
0.6716401, -1.696854, 2.396915, 1, 0, 0, 1, 1,
0.6744902, 0.9402069, 0.9470701, 0, 0, 0, 1, 1,
0.6846331, -0.186562, 1.316074, 0, 0, 0, 1, 1,
0.6874849, 1.611992, 1.15144, 0, 0, 0, 1, 1,
0.6884571, 0.2015868, -0.2648126, 0, 0, 0, 1, 1,
0.6937114, -0.8724647, 1.713873, 0, 0, 0, 1, 1,
0.6945837, -0.8983551, 2.48992, 0, 0, 0, 1, 1,
0.6960129, -0.1728402, 0.1059432, 0, 0, 0, 1, 1,
0.6988069, -0.8109142, 0.6439432, 1, 1, 1, 1, 1,
0.6991364, -1.760826, 1.817181, 1, 1, 1, 1, 1,
0.6998767, -1.521588, 2.766962, 1, 1, 1, 1, 1,
0.703196, -1.623511, 4.387063, 1, 1, 1, 1, 1,
0.71215, 0.448033, 0.7953866, 1, 1, 1, 1, 1,
0.7136424, 1.108787, 2.031347, 1, 1, 1, 1, 1,
0.7182299, 0.3947589, 3.247402, 1, 1, 1, 1, 1,
0.7273638, 0.05263021, 1.294769, 1, 1, 1, 1, 1,
0.7289616, 1.4424, 0.8003387, 1, 1, 1, 1, 1,
0.7305743, 0.2267968, -0.8289335, 1, 1, 1, 1, 1,
0.7319182, 1.035226, 0.6373451, 1, 1, 1, 1, 1,
0.7337207, -0.08027212, 1.428314, 1, 1, 1, 1, 1,
0.7338572, -0.7953244, 4.693379, 1, 1, 1, 1, 1,
0.7395536, 0.08965973, -0.2895595, 1, 1, 1, 1, 1,
0.740963, -1.076471, 2.076271, 1, 1, 1, 1, 1,
0.7478898, 2.967864, -0.1492164, 0, 0, 1, 1, 1,
0.7488906, 1.906436, -1.6559, 1, 0, 0, 1, 1,
0.7491949, -1.094248, 1.714807, 1, 0, 0, 1, 1,
0.7497857, -1.487544, 3.351071, 1, 0, 0, 1, 1,
0.7620612, 2.016358, 0.6429466, 1, 0, 0, 1, 1,
0.7651578, 0.1128578, 1.053223, 1, 0, 0, 1, 1,
0.7653564, 2.187966, -1.711649, 0, 0, 0, 1, 1,
0.7681318, -1.798009, 4.901884, 0, 0, 0, 1, 1,
0.7721559, 0.9351926, 0.08111648, 0, 0, 0, 1, 1,
0.7738723, -0.009692884, -1.266879, 0, 0, 0, 1, 1,
0.7740864, -1.838297, 1.569512, 0, 0, 0, 1, 1,
0.7750357, -0.008896137, 2.014983, 0, 0, 0, 1, 1,
0.7756426, -0.4489699, 1.06716, 0, 0, 0, 1, 1,
0.7771963, -0.5404856, 3.005043, 1, 1, 1, 1, 1,
0.7846702, -0.36046, 2.070127, 1, 1, 1, 1, 1,
0.7867689, -1.406751, 2.62937, 1, 1, 1, 1, 1,
0.7875884, -0.1065492, 2.569578, 1, 1, 1, 1, 1,
0.7887251, 0.2954111, 0.7477614, 1, 1, 1, 1, 1,
0.790879, 0.3773434, 2.025081, 1, 1, 1, 1, 1,
0.792726, 0.2395829, 0.1014945, 1, 1, 1, 1, 1,
0.8001856, 1.55504, 0.9699017, 1, 1, 1, 1, 1,
0.8011144, -0.1862222, 3.004974, 1, 1, 1, 1, 1,
0.802423, 1.683283, 1.782674, 1, 1, 1, 1, 1,
0.811476, 2.068331, 2.224248, 1, 1, 1, 1, 1,
0.8188897, 0.1039082, 1.21323, 1, 1, 1, 1, 1,
0.8190963, 0.1122573, 0.1558203, 1, 1, 1, 1, 1,
0.8202162, 0.7436136, 1.211971, 1, 1, 1, 1, 1,
0.8226931, -0.06865157, 1.769353, 1, 1, 1, 1, 1,
0.8249699, -0.7790977, 3.168665, 0, 0, 1, 1, 1,
0.828943, 0.6174014, 3.050474, 1, 0, 0, 1, 1,
0.8392457, -0.7325711, 1.721214, 1, 0, 0, 1, 1,
0.8412629, 0.3294271, 1.845874, 1, 0, 0, 1, 1,
0.8478996, -0.4598622, 2.319036, 1, 0, 0, 1, 1,
0.8533265, 0.1753784, 2.922517, 1, 0, 0, 1, 1,
0.854271, 0.3592471, -0.7080508, 0, 0, 0, 1, 1,
0.8548203, -0.7527493, 2.361589, 0, 0, 0, 1, 1,
0.8554216, 0.9469087, -0.06122841, 0, 0, 0, 1, 1,
0.8613685, -1.53018, 2.267981, 0, 0, 0, 1, 1,
0.8633576, -0.2043312, 2.192827, 0, 0, 0, 1, 1,
0.8636363, -0.9348265, 3.384431, 0, 0, 0, 1, 1,
0.8655843, -1.898195, 2.258152, 0, 0, 0, 1, 1,
0.8659309, 0.8820629, 1.693468, 1, 1, 1, 1, 1,
0.8665742, 0.07650436, 0.9111717, 1, 1, 1, 1, 1,
0.8681524, 1.632839, 0.8262568, 1, 1, 1, 1, 1,
0.8699505, -0.2765463, 2.234336, 1, 1, 1, 1, 1,
0.8699707, 0.3174114, 0.1790269, 1, 1, 1, 1, 1,
0.8710298, 1.370954, 1.597665, 1, 1, 1, 1, 1,
0.8856606, -1.043106, 3.559759, 1, 1, 1, 1, 1,
0.8866847, 0.1171925, 3.155801, 1, 1, 1, 1, 1,
0.898312, -0.6076761, 3.544942, 1, 1, 1, 1, 1,
0.9013183, -0.8745757, 1.562839, 1, 1, 1, 1, 1,
0.9082762, 1.345111, 1.440306, 1, 1, 1, 1, 1,
0.9107044, 1.569099, 0.5052377, 1, 1, 1, 1, 1,
0.9236324, -0.306767, 0.938957, 1, 1, 1, 1, 1,
0.9302896, -1.026088, 1.92888, 1, 1, 1, 1, 1,
0.932385, -0.1272584, 0.32964, 1, 1, 1, 1, 1,
0.9330722, -0.348453, 1.081931, 0, 0, 1, 1, 1,
0.9331032, -0.8526595, 1.855102, 1, 0, 0, 1, 1,
0.9358162, 1.911983, -0.3879549, 1, 0, 0, 1, 1,
0.9382875, 0.4922668, 1.071997, 1, 0, 0, 1, 1,
0.9429656, 0.1839615, 0.5351458, 1, 0, 0, 1, 1,
0.9456664, -1.010077, 2.127117, 1, 0, 0, 1, 1,
0.9456921, -0.09452163, 1.615377, 0, 0, 0, 1, 1,
0.9461408, 3.025277, 0.2008965, 0, 0, 0, 1, 1,
0.96676, 0.8988392, 0.3064418, 0, 0, 0, 1, 1,
0.9689456, -0.843805, 1.764389, 0, 0, 0, 1, 1,
0.9978316, 0.0665141, 3.177393, 0, 0, 0, 1, 1,
1.006931, -1.082761, 2.358705, 0, 0, 0, 1, 1,
1.009578, 0.8074812, -0.08629715, 0, 0, 0, 1, 1,
1.011346, -1.277377, 1.494433, 1, 1, 1, 1, 1,
1.012857, 1.086103, 1.07323, 1, 1, 1, 1, 1,
1.015086, -1.062305, 2.880143, 1, 1, 1, 1, 1,
1.0151, 0.4918878, 0.653551, 1, 1, 1, 1, 1,
1.024012, -1.057334, 1.962428, 1, 1, 1, 1, 1,
1.026816, -1.360582, 1.995064, 1, 1, 1, 1, 1,
1.028308, -0.5858448, 2.748962, 1, 1, 1, 1, 1,
1.031154, 1.333064, 2.263616, 1, 1, 1, 1, 1,
1.035368, -1.038229, 2.547063, 1, 1, 1, 1, 1,
1.037552, -0.2564861, 1.335043, 1, 1, 1, 1, 1,
1.044718, -0.8502162, 1.373072, 1, 1, 1, 1, 1,
1.045584, 0.4122496, 1.335595, 1, 1, 1, 1, 1,
1.058546, 1.008001, -0.4922753, 1, 1, 1, 1, 1,
1.063423, -0.8784248, 3.002442, 1, 1, 1, 1, 1,
1.069735, 0.2186318, 0.1284226, 1, 1, 1, 1, 1,
1.069985, -1.051176, 2.478971, 0, 0, 1, 1, 1,
1.074311, -0.01946702, 1.653745, 1, 0, 0, 1, 1,
1.074851, 0.2016878, -0.4013861, 1, 0, 0, 1, 1,
1.080524, -0.05358122, 3.16168, 1, 0, 0, 1, 1,
1.085907, -0.5354001, 2.620769, 1, 0, 0, 1, 1,
1.100752, -0.03220567, 3.15947, 1, 0, 0, 1, 1,
1.114179, -0.967897, 2.239034, 0, 0, 0, 1, 1,
1.115699, 0.8612009, 2.26013, 0, 0, 0, 1, 1,
1.116491, 1.133301, -0.6617507, 0, 0, 0, 1, 1,
1.122389, -0.9613869, 2.948724, 0, 0, 0, 1, 1,
1.123464, -0.2431028, -0.1394028, 0, 0, 0, 1, 1,
1.128741, 2.147476, -0.4708131, 0, 0, 0, 1, 1,
1.135766, -0.3176765, 4.291041, 0, 0, 0, 1, 1,
1.136302, -0.2350159, 0.2253062, 1, 1, 1, 1, 1,
1.136847, 1.296035, 0.1438145, 1, 1, 1, 1, 1,
1.139228, -1.528954, 2.523965, 1, 1, 1, 1, 1,
1.140173, 1.135281, 2.062055, 1, 1, 1, 1, 1,
1.140493, 0.5643592, 1.731451, 1, 1, 1, 1, 1,
1.14265, 0.3095321, 0.8735709, 1, 1, 1, 1, 1,
1.146676, -0.3658882, 1.066432, 1, 1, 1, 1, 1,
1.146749, 1.850979, -0.09596285, 1, 1, 1, 1, 1,
1.148136, -0.7563621, 3.609379, 1, 1, 1, 1, 1,
1.151208, -2.558745, 2.005867, 1, 1, 1, 1, 1,
1.155613, 0.2246988, 1.06066, 1, 1, 1, 1, 1,
1.156456, -1.630301, 0.7547824, 1, 1, 1, 1, 1,
1.158309, 0.6370918, 0.05184499, 1, 1, 1, 1, 1,
1.159997, -0.6978507, 1.609885, 1, 1, 1, 1, 1,
1.165129, 0.1348705, 1.213902, 1, 1, 1, 1, 1,
1.169742, 1.767931, 2.154732, 0, 0, 1, 1, 1,
1.170417, 0.9338646, 1.597866, 1, 0, 0, 1, 1,
1.17383, -1.297699, 4.003617, 1, 0, 0, 1, 1,
1.17705, -0.1177174, 1.35367, 1, 0, 0, 1, 1,
1.182899, 0.6059274, 0.7858154, 1, 0, 0, 1, 1,
1.186481, -0.6193148, 3.140806, 1, 0, 0, 1, 1,
1.189477, -0.4297026, 3.207163, 0, 0, 0, 1, 1,
1.18948, -0.5513366, 4.401699, 0, 0, 0, 1, 1,
1.189888, -0.63297, 1.769748, 0, 0, 0, 1, 1,
1.190392, -0.7694674, 1.531209, 0, 0, 0, 1, 1,
1.198965, -0.07461239, 3.749503, 0, 0, 0, 1, 1,
1.199645, 0.7563491, -0.5971369, 0, 0, 0, 1, 1,
1.208202, 1.490906, 1.684699, 0, 0, 0, 1, 1,
1.212438, 1.029124, 1.062678, 1, 1, 1, 1, 1,
1.21859, 0.3673609, 2.030027, 1, 1, 1, 1, 1,
1.22233, 0.5023324, 1.975316, 1, 1, 1, 1, 1,
1.224262, 1.335755, 0.5183257, 1, 1, 1, 1, 1,
1.246966, -0.5428618, 1.355178, 1, 1, 1, 1, 1,
1.247637, 0.1004731, 0.7428425, 1, 1, 1, 1, 1,
1.25368, -1.078186, 1.264237, 1, 1, 1, 1, 1,
1.261243, 0.1723723, 1.744876, 1, 1, 1, 1, 1,
1.264485, 2.137298, 1.475093, 1, 1, 1, 1, 1,
1.265399, -1.314308, 1.754562, 1, 1, 1, 1, 1,
1.267274, -0.9964986, 0.3255891, 1, 1, 1, 1, 1,
1.27014, -0.5251338, 1.745728, 1, 1, 1, 1, 1,
1.273213, -1.327458, 1.802971, 1, 1, 1, 1, 1,
1.279834, 0.703858, 2.655476, 1, 1, 1, 1, 1,
1.281852, 0.18582, 2.489949, 1, 1, 1, 1, 1,
1.282663, -0.02761008, 3.821049, 0, 0, 1, 1, 1,
1.308805, 1.344511, 1.712807, 1, 0, 0, 1, 1,
1.312867, 1.026151, 0.7949536, 1, 0, 0, 1, 1,
1.31493, 1.182856, 0.7998667, 1, 0, 0, 1, 1,
1.332022, 1.774115, -0.9189276, 1, 0, 0, 1, 1,
1.335981, 0.2175402, 1.343292, 1, 0, 0, 1, 1,
1.342505, 0.8646669, 0.3082411, 0, 0, 0, 1, 1,
1.34329, -2.622826, 2.096486, 0, 0, 0, 1, 1,
1.352573, -0.4351963, 0.1503534, 0, 0, 0, 1, 1,
1.359834, -0.2480066, 2.880337, 0, 0, 0, 1, 1,
1.360963, -0.7196766, 2.144818, 0, 0, 0, 1, 1,
1.362737, 0.6627675, 1.437965, 0, 0, 0, 1, 1,
1.369577, -0.3737724, 2.484545, 0, 0, 0, 1, 1,
1.373727, -0.03340167, 1.503897, 1, 1, 1, 1, 1,
1.380124, 1.398525, 1.202426, 1, 1, 1, 1, 1,
1.382276, 0.9485491, 1.394334, 1, 1, 1, 1, 1,
1.404374, -0.8230823, 1.441597, 1, 1, 1, 1, 1,
1.416374, 1.867015, 1.429289, 1, 1, 1, 1, 1,
1.417023, 0.9737731, 0.8172632, 1, 1, 1, 1, 1,
1.41761, -1.512337, 2.577009, 1, 1, 1, 1, 1,
1.422818, -0.216155, 0.9584802, 1, 1, 1, 1, 1,
1.442961, 0.126203, 2.289126, 1, 1, 1, 1, 1,
1.453833, -0.668883, 0.6026098, 1, 1, 1, 1, 1,
1.459175, 0.08405087, 1.217461, 1, 1, 1, 1, 1,
1.463585, -0.6062312, 1.088435, 1, 1, 1, 1, 1,
1.463593, 0.6098514, 1.040891, 1, 1, 1, 1, 1,
1.46367, 0.6670489, 0.6518025, 1, 1, 1, 1, 1,
1.466314, -0.8307588, 1.302217, 1, 1, 1, 1, 1,
1.487392, -0.7088069, 1.558236, 0, 0, 1, 1, 1,
1.497084, -1.367125, 3.125122, 1, 0, 0, 1, 1,
1.498805, 0.2257518, 2.310379, 1, 0, 0, 1, 1,
1.505259, 0.3795859, 1.344171, 1, 0, 0, 1, 1,
1.507386, -0.9804565, 2.81892, 1, 0, 0, 1, 1,
1.520049, 1.003992, 2.399616, 1, 0, 0, 1, 1,
1.520138, -1.151244, 1.296549, 0, 0, 0, 1, 1,
1.53039, -0.3066892, 2.06596, 0, 0, 0, 1, 1,
1.532784, -0.2319304, -0.02875945, 0, 0, 0, 1, 1,
1.537081, 0.2199401, 3.188349, 0, 0, 0, 1, 1,
1.543205, -0.2906817, 2.562032, 0, 0, 0, 1, 1,
1.555979, 0.2198605, 2.279482, 0, 0, 0, 1, 1,
1.562743, -0.9579167, 1.948217, 0, 0, 0, 1, 1,
1.573032, -0.9563106, 2.100171, 1, 1, 1, 1, 1,
1.575918, 1.61943, -0.5378171, 1, 1, 1, 1, 1,
1.591354, -0.4351263, 2.978799, 1, 1, 1, 1, 1,
1.602139, 0.6276848, 1.874493, 1, 1, 1, 1, 1,
1.62182, 0.8113089, 1.493318, 1, 1, 1, 1, 1,
1.624895, -2.511126, 3.266984, 1, 1, 1, 1, 1,
1.629154, -0.5458746, 3.472484, 1, 1, 1, 1, 1,
1.632332, 1.240231, 2.996933, 1, 1, 1, 1, 1,
1.633625, -1.128804, 1.398572, 1, 1, 1, 1, 1,
1.634755, 2.396984, 0.7170343, 1, 1, 1, 1, 1,
1.649972, -0.6616107, 1.916699, 1, 1, 1, 1, 1,
1.652483, 0.1272889, 1.249472, 1, 1, 1, 1, 1,
1.658219, 0.3381432, 2.302457, 1, 1, 1, 1, 1,
1.658397, -0.8551074, 1.548143, 1, 1, 1, 1, 1,
1.675177, 1.354327, 2.418604, 1, 1, 1, 1, 1,
1.677283, -1.490958, 0.9766559, 0, 0, 1, 1, 1,
1.680928, 0.9063814, 2.025922, 1, 0, 0, 1, 1,
1.686673, -2.028434, 2.744104, 1, 0, 0, 1, 1,
1.687302, -0.4968741, 2.73722, 1, 0, 0, 1, 1,
1.688172, -1.569093, 4.044766, 1, 0, 0, 1, 1,
1.691795, -0.7851254, 2.213652, 1, 0, 0, 1, 1,
1.695119, -0.263093, 1.157434, 0, 0, 0, 1, 1,
1.695831, 0.1376984, 0.44406, 0, 0, 0, 1, 1,
1.731376, 0.03373595, 0.1699828, 0, 0, 0, 1, 1,
1.731685, -1.212216, 2.311929, 0, 0, 0, 1, 1,
1.733469, -0.3353271, 0.4394444, 0, 0, 0, 1, 1,
1.735666, -0.9874871, -0.04646011, 0, 0, 0, 1, 1,
1.745442, 1.433236, 2.068124, 0, 0, 0, 1, 1,
1.756626, 0.1914042, 2.617636, 1, 1, 1, 1, 1,
1.765153, -1.044827, 2.383279, 1, 1, 1, 1, 1,
1.795453, -1.261152, 1.992915, 1, 1, 1, 1, 1,
1.801731, -1.581247, 0.3731417, 1, 1, 1, 1, 1,
1.888281, -0.8663056, 2.28316, 1, 1, 1, 1, 1,
1.904855, 0.5026413, 3.53411, 1, 1, 1, 1, 1,
1.970299, -1.896903, 4.207644, 1, 1, 1, 1, 1,
1.989799, -0.4539829, 1.786, 1, 1, 1, 1, 1,
1.994587, 0.4694147, 0.4498223, 1, 1, 1, 1, 1,
2.008531, -0.9498897, 1.929987, 1, 1, 1, 1, 1,
2.023244, 0.3256191, 0.4687197, 1, 1, 1, 1, 1,
2.054689, 1.225091, 0.8312528, 1, 1, 1, 1, 1,
2.05802, -0.7071984, 1.841641, 1, 1, 1, 1, 1,
2.075417, -1.283668, 1.849511, 1, 1, 1, 1, 1,
2.07632, 0.4877795, 1.0099, 1, 1, 1, 1, 1,
2.100286, -0.2678313, 2.682143, 0, 0, 1, 1, 1,
2.10291, 1.393755, 2.870859, 1, 0, 0, 1, 1,
2.112115, 0.6160008, 0.5188973, 1, 0, 0, 1, 1,
2.125378, -0.2397211, 1.429306, 1, 0, 0, 1, 1,
2.27122, -0.4880013, 0.8808499, 1, 0, 0, 1, 1,
2.295442, 0.7766716, 0.1034425, 1, 0, 0, 1, 1,
2.362161, -1.335847, 2.232582, 0, 0, 0, 1, 1,
2.392959, 1.878335, -0.7653442, 0, 0, 0, 1, 1,
2.398348, -1.262311, 3.059032, 0, 0, 0, 1, 1,
2.406806, -1.548761, 3.379647, 0, 0, 0, 1, 1,
2.4622, 2.242013, 0.1681306, 0, 0, 0, 1, 1,
2.484934, 0.242701, 1.775472, 0, 0, 0, 1, 1,
2.510211, 2.085557, 0.4735541, 0, 0, 0, 1, 1,
2.545513, -0.1497505, 1.442613, 1, 1, 1, 1, 1,
2.548268, 0.4601579, 2.205086, 1, 1, 1, 1, 1,
2.657844, -0.06047041, 1.773571, 1, 1, 1, 1, 1,
2.780619, 1.13953, 0.912304, 1, 1, 1, 1, 1,
2.784123, -0.536503, 2.280501, 1, 1, 1, 1, 1,
2.807015, 1.045462, 0.9928765, 1, 1, 1, 1, 1,
2.816945, 0.6301886, 2.592292, 1, 1, 1, 1, 1
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
var radius = 9.615637;
var distance = 33.77452;
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
mvMatrix.translate( 0.1437957, -0.3918089, -0.006393909 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77452);
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
