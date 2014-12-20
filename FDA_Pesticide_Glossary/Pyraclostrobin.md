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
-2.940238, -0.2077142, -2.345079, 1, 0, 0, 1,
-2.791744, -0.6802437, -2.050599, 1, 0.007843138, 0, 1,
-2.630989, -0.0336353, -1.703502, 1, 0.01176471, 0, 1,
-2.577053, 1.580608, -0.5947424, 1, 0.01960784, 0, 1,
-2.514006, -0.299604, -0.02479086, 1, 0.02352941, 0, 1,
-2.441636, -0.8914356, -2.110263, 1, 0.03137255, 0, 1,
-2.41313, 0.5401524, -1.512273, 1, 0.03529412, 0, 1,
-2.335037, -0.6557473, -2.127926, 1, 0.04313726, 0, 1,
-2.297973, 0.2033598, -1.067655, 1, 0.04705882, 0, 1,
-2.291551, -1.358676, -1.751209, 1, 0.05490196, 0, 1,
-2.280434, 0.1187849, -1.449332, 1, 0.05882353, 0, 1,
-2.262522, -0.4426969, -2.479589, 1, 0.06666667, 0, 1,
-2.239068, -0.09108084, -1.435212, 1, 0.07058824, 0, 1,
-2.21828, -0.1439857, -1.75662, 1, 0.07843138, 0, 1,
-2.203806, -1.905079, -3.069225, 1, 0.08235294, 0, 1,
-2.201121, -0.6096959, -1.472338, 1, 0.09019608, 0, 1,
-2.181746, 0.5316399, -2.658271, 1, 0.09411765, 0, 1,
-2.159087, 0.01072397, -1.526053, 1, 0.1019608, 0, 1,
-2.088372, 0.0163195, -2.915738, 1, 0.1098039, 0, 1,
-2.061647, -0.9215903, -1.366961, 1, 0.1137255, 0, 1,
-2.059494, 0.4411145, -1.647243, 1, 0.1215686, 0, 1,
-2.053954, 1.987175, -0.9585567, 1, 0.1254902, 0, 1,
-2.024403, 0.4237221, -0.8231011, 1, 0.1333333, 0, 1,
-2.015814, -0.6315764, -2.397077, 1, 0.1372549, 0, 1,
-2.013728, 0.4531683, -2.306415, 1, 0.145098, 0, 1,
-1.923375, 0.9779313, 0.5009395, 1, 0.1490196, 0, 1,
-1.876784, -0.3707123, -2.103146, 1, 0.1568628, 0, 1,
-1.84966, 0.8784757, -0.5681511, 1, 0.1607843, 0, 1,
-1.840962, 0.3314227, -0.9999678, 1, 0.1686275, 0, 1,
-1.825664, 0.5665019, -0.3661085, 1, 0.172549, 0, 1,
-1.816744, -2.151259, -3.894941, 1, 0.1803922, 0, 1,
-1.811957, 2.367153, -1.485465, 1, 0.1843137, 0, 1,
-1.780881, 0.5374921, -1.89401, 1, 0.1921569, 0, 1,
-1.779263, -1.249199, -2.946579, 1, 0.1960784, 0, 1,
-1.760899, 1.408194, -1.23554, 1, 0.2039216, 0, 1,
-1.725614, 0.1561815, -2.676252, 1, 0.2117647, 0, 1,
-1.703569, -0.481544, -2.021701, 1, 0.2156863, 0, 1,
-1.6981, -1.008019, -2.36848, 1, 0.2235294, 0, 1,
-1.68906, 0.3406087, -3.226182, 1, 0.227451, 0, 1,
-1.686011, 0.4587977, -2.28311, 1, 0.2352941, 0, 1,
-1.684829, 0.3021706, -1.367885, 1, 0.2392157, 0, 1,
-1.682956, 0.3173197, -1.277864, 1, 0.2470588, 0, 1,
-1.654249, 0.02947254, -2.214593, 1, 0.2509804, 0, 1,
-1.648622, 1.782775, -1.892554, 1, 0.2588235, 0, 1,
-1.645072, 0.7847321, 0.01004997, 1, 0.2627451, 0, 1,
-1.644812, 0.9167351, -1.43478, 1, 0.2705882, 0, 1,
-1.640979, 0.2424225, -2.839737, 1, 0.2745098, 0, 1,
-1.633893, 0.1821331, -4.041087, 1, 0.282353, 0, 1,
-1.613127, 0.6264045, 0.1013442, 1, 0.2862745, 0, 1,
-1.608381, 0.6622698, -1.880833, 1, 0.2941177, 0, 1,
-1.607158, 0.8577657, -1.354736, 1, 0.3019608, 0, 1,
-1.599143, 1.653076, 0.6689721, 1, 0.3058824, 0, 1,
-1.594323, -0.1645024, -0.2486581, 1, 0.3137255, 0, 1,
-1.589095, -0.06853104, -2.514279, 1, 0.3176471, 0, 1,
-1.588183, -1.74479, -1.607168, 1, 0.3254902, 0, 1,
-1.582864, 1.38084, -2.060125, 1, 0.3294118, 0, 1,
-1.580509, -0.6508914, -0.6206076, 1, 0.3372549, 0, 1,
-1.575958, 0.5314331, -1.015681, 1, 0.3411765, 0, 1,
-1.575076, 0.5321658, -3.228401, 1, 0.3490196, 0, 1,
-1.573302, -2.222885, -3.18534, 1, 0.3529412, 0, 1,
-1.572666, 0.447926, -2.306123, 1, 0.3607843, 0, 1,
-1.567412, -0.2436127, -2.008532, 1, 0.3647059, 0, 1,
-1.565978, 0.3471902, -1.772759, 1, 0.372549, 0, 1,
-1.565579, 0.9548688, -1.754589, 1, 0.3764706, 0, 1,
-1.559459, 0.260012, -1.209332, 1, 0.3843137, 0, 1,
-1.550479, -0.7082392, -1.885948, 1, 0.3882353, 0, 1,
-1.542303, -0.2605699, -1.776726, 1, 0.3960784, 0, 1,
-1.538129, 0.6773, -3.009758, 1, 0.4039216, 0, 1,
-1.529887, -0.1733405, -2.472139, 1, 0.4078431, 0, 1,
-1.526593, 0.2909015, -0.3316258, 1, 0.4156863, 0, 1,
-1.507204, 0.7484317, -1.605157, 1, 0.4196078, 0, 1,
-1.506937, -0.8343249, -1.343798, 1, 0.427451, 0, 1,
-1.493249, 0.1758233, -0.7055373, 1, 0.4313726, 0, 1,
-1.484195, 0.4090129, -1.270754, 1, 0.4392157, 0, 1,
-1.474429, -0.06461918, -0.3261767, 1, 0.4431373, 0, 1,
-1.456688, -0.09062497, -2.704999, 1, 0.4509804, 0, 1,
-1.455684, -1.148017, -1.162361, 1, 0.454902, 0, 1,
-1.443086, 1.254455, 0.1207831, 1, 0.4627451, 0, 1,
-1.442153, -0.4848609, -3.477179, 1, 0.4666667, 0, 1,
-1.433521, -0.7585186, -1.734817, 1, 0.4745098, 0, 1,
-1.42438, -0.6289543, -2.430258, 1, 0.4784314, 0, 1,
-1.419686, 0.3031445, -1.350444, 1, 0.4862745, 0, 1,
-1.419455, 0.6623814, -0.9950532, 1, 0.4901961, 0, 1,
-1.418444, -0.7078504, 0.02036457, 1, 0.4980392, 0, 1,
-1.41637, -0.2327823, -0.5803496, 1, 0.5058824, 0, 1,
-1.414144, -1.041739, -1.426109, 1, 0.509804, 0, 1,
-1.413449, 0.08800959, -3.842746, 1, 0.5176471, 0, 1,
-1.409791, -0.3315592, -3.033447, 1, 0.5215687, 0, 1,
-1.404812, -0.1753285, -1.517018, 1, 0.5294118, 0, 1,
-1.396479, 0.2337747, -0.6614708, 1, 0.5333334, 0, 1,
-1.385198, -0.05562741, -2.280145, 1, 0.5411765, 0, 1,
-1.379791, -0.3708939, -1.053612, 1, 0.5450981, 0, 1,
-1.377926, -1.093307, -2.191621, 1, 0.5529412, 0, 1,
-1.360916, 0.3061306, -2.309137, 1, 0.5568628, 0, 1,
-1.35439, 0.4531465, -1.841925, 1, 0.5647059, 0, 1,
-1.3524, 0.08298723, -1.886818, 1, 0.5686275, 0, 1,
-1.306516, -0.3083768, -1.701182, 1, 0.5764706, 0, 1,
-1.305929, -0.3396619, -0.1295617, 1, 0.5803922, 0, 1,
-1.301354, 1.627487, -0.06549949, 1, 0.5882353, 0, 1,
-1.299187, 0.9812337, -2.065767, 1, 0.5921569, 0, 1,
-1.298537, -0.6588639, -2.838786, 1, 0.6, 0, 1,
-1.296981, -0.2814978, -1.828268, 1, 0.6078432, 0, 1,
-1.293377, 0.4742937, -1.65247, 1, 0.6117647, 0, 1,
-1.287614, -1.395169, -2.463029, 1, 0.6196079, 0, 1,
-1.279578, -1.557925, -4.137846, 1, 0.6235294, 0, 1,
-1.276729, -0.2516929, -2.714811, 1, 0.6313726, 0, 1,
-1.27414, 0.3633658, -2.208514, 1, 0.6352941, 0, 1,
-1.265543, -0.1250889, -1.722153, 1, 0.6431373, 0, 1,
-1.263121, -0.09859972, -1.726517, 1, 0.6470588, 0, 1,
-1.253615, -0.4851937, -2.904034, 1, 0.654902, 0, 1,
-1.246352, -1.789269, -3.373789, 1, 0.6588235, 0, 1,
-1.244035, 0.596586, -3.110205, 1, 0.6666667, 0, 1,
-1.2399, -0.1588526, -2.377429, 1, 0.6705883, 0, 1,
-1.225599, -0.7286373, -3.427936, 1, 0.6784314, 0, 1,
-1.224584, -0.7917171, -2.757908, 1, 0.682353, 0, 1,
-1.212606, 1.131754, -0.04765856, 1, 0.6901961, 0, 1,
-1.209274, 0.8135334, -3.121436, 1, 0.6941177, 0, 1,
-1.203321, -0.4549503, -2.956015, 1, 0.7019608, 0, 1,
-1.203259, 0.4876837, -2.340317, 1, 0.7098039, 0, 1,
-1.20227, 0.6292608, -0.9747542, 1, 0.7137255, 0, 1,
-1.201199, -0.3074276, -3.520017, 1, 0.7215686, 0, 1,
-1.197544, 0.2040316, -1.662416, 1, 0.7254902, 0, 1,
-1.192573, 0.1434098, -1.868919, 1, 0.7333333, 0, 1,
-1.180233, 0.6074849, -1.578803, 1, 0.7372549, 0, 1,
-1.160792, 1.448554, -0.05634471, 1, 0.7450981, 0, 1,
-1.152955, 0.7333754, -0.1178801, 1, 0.7490196, 0, 1,
-1.148243, -0.4306056, -2.019283, 1, 0.7568628, 0, 1,
-1.143521, 0.2054357, -2.537405, 1, 0.7607843, 0, 1,
-1.13614, 0.7804607, -1.409965, 1, 0.7686275, 0, 1,
-1.133769, -1.411522, -2.299447, 1, 0.772549, 0, 1,
-1.126853, -1.024904, -3.049752, 1, 0.7803922, 0, 1,
-1.124467, -0.5674822, -1.73541, 1, 0.7843137, 0, 1,
-1.123321, 0.02149768, -1.07238, 1, 0.7921569, 0, 1,
-1.123318, 0.2641866, -1.111094, 1, 0.7960784, 0, 1,
-1.122882, 0.7057358, -1.097097, 1, 0.8039216, 0, 1,
-1.121928, -0.3466292, -1.820514, 1, 0.8117647, 0, 1,
-1.114075, -1.871221, -4.185349, 1, 0.8156863, 0, 1,
-1.113683, -1.161834, -1.519882, 1, 0.8235294, 0, 1,
-1.113076, 1.184867, 1.117189, 1, 0.827451, 0, 1,
-1.111828, -1.317905, -1.855782, 1, 0.8352941, 0, 1,
-1.109437, 0.2981337, -1.325382, 1, 0.8392157, 0, 1,
-1.099706, 0.574143, -1.794548, 1, 0.8470588, 0, 1,
-1.099224, 0.264219, -1.651125, 1, 0.8509804, 0, 1,
-1.097096, -1.271987, -3.379569, 1, 0.8588235, 0, 1,
-1.090977, -0.8202347, -2.367937, 1, 0.8627451, 0, 1,
-1.086462, 0.8361694, -1.112551, 1, 0.8705882, 0, 1,
-1.075901, 0.2494696, -1.576518, 1, 0.8745098, 0, 1,
-1.07549, -2.109847, -2.298711, 1, 0.8823529, 0, 1,
-1.066813, 1.687753, -0.5999938, 1, 0.8862745, 0, 1,
-1.066156, -0.3328414, -1.538554, 1, 0.8941177, 0, 1,
-1.065907, -0.7438105, -1.629666, 1, 0.8980392, 0, 1,
-1.063917, -0.7676574, -3.375599, 1, 0.9058824, 0, 1,
-1.058938, -0.2994568, -1.281235, 1, 0.9137255, 0, 1,
-1.05668, -0.3767042, -1.723488, 1, 0.9176471, 0, 1,
-1.053731, -3.144483, -3.335522, 1, 0.9254902, 0, 1,
-1.048914, 0.6997573, -0.9501991, 1, 0.9294118, 0, 1,
-1.043157, 0.01839215, -2.496777, 1, 0.9372549, 0, 1,
-1.040691, 0.6567719, -1.054419, 1, 0.9411765, 0, 1,
-1.038656, 1.235635, -0.2557858, 1, 0.9490196, 0, 1,
-1.026917, 0.1247652, -2.277711, 1, 0.9529412, 0, 1,
-1.026643, -0.2568108, -1.243877, 1, 0.9607843, 0, 1,
-1.019276, -0.5368235, -2.45535, 1, 0.9647059, 0, 1,
-1.00921, -2.200696, -4.369122, 1, 0.972549, 0, 1,
-1.008806, 0.1153265, -1.352697, 1, 0.9764706, 0, 1,
-1.005286, -0.8117858, -1.432768, 1, 0.9843137, 0, 1,
-1.004824, 0.4152055, -1.790035, 1, 0.9882353, 0, 1,
-1.004092, -0.1699516, -2.715239, 1, 0.9960784, 0, 1,
-1.002185, 0.9862686, -0.3876432, 0.9960784, 1, 0, 1,
-1.002147, 0.3118303, -1.335244, 0.9921569, 1, 0, 1,
-1.000118, -0.2360054, -2.492039, 0.9843137, 1, 0, 1,
-0.9994025, -0.4094633, -2.983093, 0.9803922, 1, 0, 1,
-0.9984396, 1.207513, -0.4661329, 0.972549, 1, 0, 1,
-0.9977351, -0.3100288, -1.964147, 0.9686275, 1, 0, 1,
-0.9843754, 0.2160022, -1.831703, 0.9607843, 1, 0, 1,
-0.9818888, -0.2084566, -2.658992, 0.9568627, 1, 0, 1,
-0.9816127, 0.3958281, -1.513481, 0.9490196, 1, 0, 1,
-0.9765068, -0.9078832, -2.29829, 0.945098, 1, 0, 1,
-0.9730482, 0.6483678, -0.9996402, 0.9372549, 1, 0, 1,
-0.9718058, -0.009054068, -2.720602, 0.9333333, 1, 0, 1,
-0.9716662, -0.04912503, -1.557683, 0.9254902, 1, 0, 1,
-0.9711422, -0.3733227, -2.880647, 0.9215686, 1, 0, 1,
-0.9576578, 0.2365782, -2.578283, 0.9137255, 1, 0, 1,
-0.9565759, 0.5522461, -1.607327, 0.9098039, 1, 0, 1,
-0.9559275, 0.5195439, -1.710356, 0.9019608, 1, 0, 1,
-0.955475, 0.6421276, 1.635398, 0.8941177, 1, 0, 1,
-0.9473024, 1.109292, -0.9504393, 0.8901961, 1, 0, 1,
-0.9386027, 1.50294, -1.846012, 0.8823529, 1, 0, 1,
-0.9345488, -0.04678354, -1.20411, 0.8784314, 1, 0, 1,
-0.9291059, 1.206078, -1.370057, 0.8705882, 1, 0, 1,
-0.918767, 1.095425, -0.3347231, 0.8666667, 1, 0, 1,
-0.9121569, -1.200993, -1.281874, 0.8588235, 1, 0, 1,
-0.9120225, -0.3422398, -0.961252, 0.854902, 1, 0, 1,
-0.9045969, 0.03683425, -1.172721, 0.8470588, 1, 0, 1,
-0.9027913, 1.414972, -0.1511484, 0.8431373, 1, 0, 1,
-0.8984095, 1.527827, -1.815597, 0.8352941, 1, 0, 1,
-0.8966738, 1.007307, -2.226458, 0.8313726, 1, 0, 1,
-0.8958474, -0.2948771, -2.065859, 0.8235294, 1, 0, 1,
-0.879871, -0.5065616, -2.553162, 0.8196079, 1, 0, 1,
-0.8766294, 0.04247418, -1.764246, 0.8117647, 1, 0, 1,
-0.8730163, -1.064582, -1.794741, 0.8078431, 1, 0, 1,
-0.8721575, 0.2137094, -1.670345, 0.8, 1, 0, 1,
-0.8699453, -0.2114323, -0.2710911, 0.7921569, 1, 0, 1,
-0.8581106, -0.755836, -2.744157, 0.7882353, 1, 0, 1,
-0.8579419, 0.2933947, -0.2107424, 0.7803922, 1, 0, 1,
-0.8523607, -0.1458863, -2.030908, 0.7764706, 1, 0, 1,
-0.8511081, 1.368538, 0.7232964, 0.7686275, 1, 0, 1,
-0.8499838, 0.3096587, -1.901501, 0.7647059, 1, 0, 1,
-0.8497468, 0.289625, -0.07390889, 0.7568628, 1, 0, 1,
-0.8436687, -1.258033, -3.543306, 0.7529412, 1, 0, 1,
-0.8418742, -0.01733401, 0.05566341, 0.7450981, 1, 0, 1,
-0.8406996, 1.414782, -1.117256, 0.7411765, 1, 0, 1,
-0.8337098, -0.1391416, -1.858134, 0.7333333, 1, 0, 1,
-0.8287696, 0.926936, -1.124952, 0.7294118, 1, 0, 1,
-0.8209155, 1.210233, 0.1565571, 0.7215686, 1, 0, 1,
-0.8042825, 1.144138, -3.251474, 0.7176471, 1, 0, 1,
-0.8042152, 2.035488, 2.223782, 0.7098039, 1, 0, 1,
-0.7917621, -0.12201, -2.971132, 0.7058824, 1, 0, 1,
-0.7898582, 1.921544, -2.221515, 0.6980392, 1, 0, 1,
-0.788227, -0.7828881, -1.609696, 0.6901961, 1, 0, 1,
-0.786076, 0.586081, -1.272641, 0.6862745, 1, 0, 1,
-0.7834122, 0.1166162, -1.562419, 0.6784314, 1, 0, 1,
-0.783175, -1.498409, -2.112001, 0.6745098, 1, 0, 1,
-0.7801217, -0.7760425, -1.603319, 0.6666667, 1, 0, 1,
-0.7759259, -1.067264, -3.29057, 0.6627451, 1, 0, 1,
-0.7747828, 0.632652, 0.9360276, 0.654902, 1, 0, 1,
-0.7642935, 0.03303701, -2.189419, 0.6509804, 1, 0, 1,
-0.7632616, -1.89565, -2.197518, 0.6431373, 1, 0, 1,
-0.7617235, 0.778611, -1.167747, 0.6392157, 1, 0, 1,
-0.7583022, 0.1486595, -1.09042, 0.6313726, 1, 0, 1,
-0.7574033, -0.3174739, -1.014035, 0.627451, 1, 0, 1,
-0.7519692, -0.4905809, -3.115374, 0.6196079, 1, 0, 1,
-0.7442141, -0.6679016, -1.496901, 0.6156863, 1, 0, 1,
-0.7369037, -0.3031162, -1.615268, 0.6078432, 1, 0, 1,
-0.7345122, -0.7987884, -3.704933, 0.6039216, 1, 0, 1,
-0.7282485, 0.0900677, 1.337942, 0.5960785, 1, 0, 1,
-0.7262194, -1.333977, -2.749584, 0.5882353, 1, 0, 1,
-0.7260613, 0.5629976, -0.4113326, 0.5843138, 1, 0, 1,
-0.7236906, 0.2669501, 0.518492, 0.5764706, 1, 0, 1,
-0.7201896, -0.4801902, -3.274899, 0.572549, 1, 0, 1,
-0.7188865, 0.7972753, -1.147481, 0.5647059, 1, 0, 1,
-0.7184568, -0.6670047, -2.539434, 0.5607843, 1, 0, 1,
-0.7166679, -0.6793094, -1.007774, 0.5529412, 1, 0, 1,
-0.711055, 1.321888, -1.097452, 0.5490196, 1, 0, 1,
-0.7071632, 0.4765329, -0.6473429, 0.5411765, 1, 0, 1,
-0.7033547, 1.71396, -1.668106, 0.5372549, 1, 0, 1,
-0.6955816, 1.06311, -0.5229001, 0.5294118, 1, 0, 1,
-0.6900672, 0.1499663, -2.206055, 0.5254902, 1, 0, 1,
-0.6878454, -1.324722, -2.328868, 0.5176471, 1, 0, 1,
-0.6876159, 0.001297786, -0.7788193, 0.5137255, 1, 0, 1,
-0.6809846, -0.29944, -0.7533912, 0.5058824, 1, 0, 1,
-0.6770049, 0.7667982, -2.251481, 0.5019608, 1, 0, 1,
-0.6714774, -0.5102885, -3.945639, 0.4941176, 1, 0, 1,
-0.6708256, 1.736343, 0.06485984, 0.4862745, 1, 0, 1,
-0.6665136, -0.1136123, -2.857637, 0.4823529, 1, 0, 1,
-0.6638749, 0.0001007611, -1.091191, 0.4745098, 1, 0, 1,
-0.6636798, -0.275059, -3.579488, 0.4705882, 1, 0, 1,
-0.6617519, -0.3277553, 0.8718349, 0.4627451, 1, 0, 1,
-0.6601696, -0.9508411, -2.2094, 0.4588235, 1, 0, 1,
-0.6583249, 1.627449, -1.874289, 0.4509804, 1, 0, 1,
-0.6549945, 0.03820349, -2.122276, 0.4470588, 1, 0, 1,
-0.6541933, 0.5744728, -2.39731, 0.4392157, 1, 0, 1,
-0.6508034, 0.746563, -0.3979975, 0.4352941, 1, 0, 1,
-0.6485779, 0.480629, -1.784076, 0.427451, 1, 0, 1,
-0.6460965, 0.06093483, -1.283629, 0.4235294, 1, 0, 1,
-0.6419061, -0.9230501, -1.502694, 0.4156863, 1, 0, 1,
-0.6413902, -1.929472, -3.565545, 0.4117647, 1, 0, 1,
-0.6401114, 1.963593, 0.6061587, 0.4039216, 1, 0, 1,
-0.6385604, 0.07892589, -1.939896, 0.3960784, 1, 0, 1,
-0.6384045, 0.5049001, -0.1977564, 0.3921569, 1, 0, 1,
-0.6365475, 0.7456248, -1.222823, 0.3843137, 1, 0, 1,
-0.6349449, -0.8177974, -0.6685467, 0.3803922, 1, 0, 1,
-0.6344107, -2.082591, -2.419157, 0.372549, 1, 0, 1,
-0.6342627, 0.3144489, -0.6824576, 0.3686275, 1, 0, 1,
-0.6312178, 1.251155, -1.696381, 0.3607843, 1, 0, 1,
-0.6297271, 0.8673157, -0.9267999, 0.3568628, 1, 0, 1,
-0.6274743, -0.828046, -3.550506, 0.3490196, 1, 0, 1,
-0.6265659, -0.8333053, -3.71772, 0.345098, 1, 0, 1,
-0.6220093, -0.3683881, -0.8112338, 0.3372549, 1, 0, 1,
-0.6207249, -0.00895311, -1.848231, 0.3333333, 1, 0, 1,
-0.6176119, -0.2315961, -2.184144, 0.3254902, 1, 0, 1,
-0.613228, -0.1273082, -2.825999, 0.3215686, 1, 0, 1,
-0.6099218, 1.614536, -1.150433, 0.3137255, 1, 0, 1,
-0.605679, 0.003229527, -3.749369, 0.3098039, 1, 0, 1,
-0.60474, -1.005173, -3.672234, 0.3019608, 1, 0, 1,
-0.5974675, 1.202568, 0.3080496, 0.2941177, 1, 0, 1,
-0.5974494, 1.456129, -1.140151, 0.2901961, 1, 0, 1,
-0.596855, -0.3701839, -1.823355, 0.282353, 1, 0, 1,
-0.5941061, 0.07703992, -3.605541, 0.2784314, 1, 0, 1,
-0.5938438, 0.7830557, -0.7269732, 0.2705882, 1, 0, 1,
-0.5938255, 0.1389841, -2.249543, 0.2666667, 1, 0, 1,
-0.5935166, 0.01962706, -0.5816525, 0.2588235, 1, 0, 1,
-0.579577, -0.3798296, -2.164188, 0.254902, 1, 0, 1,
-0.5771495, 0.1872803, -2.008914, 0.2470588, 1, 0, 1,
-0.5770301, 1.325652, 0.06048949, 0.2431373, 1, 0, 1,
-0.5694898, 1.488964, 0.4141422, 0.2352941, 1, 0, 1,
-0.5665026, -1.918607, -3.349207, 0.2313726, 1, 0, 1,
-0.5618641, -1.278365, -2.536387, 0.2235294, 1, 0, 1,
-0.5614406, 1.239823, -0.7757446, 0.2196078, 1, 0, 1,
-0.5569279, 0.07606559, -1.783741, 0.2117647, 1, 0, 1,
-0.5544388, -1.314235, -2.656732, 0.2078431, 1, 0, 1,
-0.5502269, -1.14129, -1.809795, 0.2, 1, 0, 1,
-0.5494235, 1.195295, -0.6818013, 0.1921569, 1, 0, 1,
-0.5481339, 1.327314, 0.08960284, 0.1882353, 1, 0, 1,
-0.5473629, 1.172995, 0.897743, 0.1803922, 1, 0, 1,
-0.540724, -0.1719796, -2.741947, 0.1764706, 1, 0, 1,
-0.5400439, -1.740104, -2.850877, 0.1686275, 1, 0, 1,
-0.5369571, -0.7882729, -2.944981, 0.1647059, 1, 0, 1,
-0.5358235, -0.6326308, -2.726095, 0.1568628, 1, 0, 1,
-0.5339975, -0.3900759, -4.254316, 0.1529412, 1, 0, 1,
-0.5260729, -0.5608486, -3.730616, 0.145098, 1, 0, 1,
-0.5260045, 0.775578, -0.8914937, 0.1411765, 1, 0, 1,
-0.5256413, -1.738861, -2.687005, 0.1333333, 1, 0, 1,
-0.5202907, 0.3108552, -2.00937, 0.1294118, 1, 0, 1,
-0.5202407, -0.3882857, -1.430265, 0.1215686, 1, 0, 1,
-0.5142396, 0.6893768, -2.408536, 0.1176471, 1, 0, 1,
-0.5121741, 0.2368443, 0.1943308, 0.1098039, 1, 0, 1,
-0.506909, -0.5606378, -2.075745, 0.1058824, 1, 0, 1,
-0.5046557, -0.1446122, -1.951015, 0.09803922, 1, 0, 1,
-0.5043881, -0.4602921, -1.97541, 0.09019608, 1, 0, 1,
-0.5039901, -1.043268, -3.176376, 0.08627451, 1, 0, 1,
-0.5020382, -1.542351, -1.226403, 0.07843138, 1, 0, 1,
-0.5007055, -0.7967905, -2.035016, 0.07450981, 1, 0, 1,
-0.5004236, -1.561623, -4.569152, 0.06666667, 1, 0, 1,
-0.5002251, -0.3416424, -0.3496406, 0.0627451, 1, 0, 1,
-0.4952987, -0.1477348, -1.914051, 0.05490196, 1, 0, 1,
-0.4952945, 0.4302859, -1.559255, 0.05098039, 1, 0, 1,
-0.4908876, 1.120653, -0.3190496, 0.04313726, 1, 0, 1,
-0.489137, -1.732876, -2.347931, 0.03921569, 1, 0, 1,
-0.4810123, -0.09949565, -1.389473, 0.03137255, 1, 0, 1,
-0.4768499, 2.0762, 0.5009728, 0.02745098, 1, 0, 1,
-0.4763687, 0.616508, -1.862417, 0.01960784, 1, 0, 1,
-0.4747234, 1.226247, -1.211849, 0.01568628, 1, 0, 1,
-0.4738083, -0.2107251, -0.1379472, 0.007843138, 1, 0, 1,
-0.4673638, -1.316867, -2.701881, 0.003921569, 1, 0, 1,
-0.466528, 0.2423912, -1.233827, 0, 1, 0.003921569, 1,
-0.4648762, -0.1012038, -1.648362, 0, 1, 0.01176471, 1,
-0.46396, -2.516613, -4.577989, 0, 1, 0.01568628, 1,
-0.4608476, -1.403004, -2.125683, 0, 1, 0.02352941, 1,
-0.4595405, -0.0008429492, -3.652862, 0, 1, 0.02745098, 1,
-0.4584995, 0.3584853, -1.62602, 0, 1, 0.03529412, 1,
-0.4502046, -0.7239441, -2.743141, 0, 1, 0.03921569, 1,
-0.4472051, 1.652048, -1.239912, 0, 1, 0.04705882, 1,
-0.4423527, -0.09048354, -0.8827734, 0, 1, 0.05098039, 1,
-0.4402108, 0.7266303, -0.7015302, 0, 1, 0.05882353, 1,
-0.4358419, -1.082925, -2.550991, 0, 1, 0.0627451, 1,
-0.4354285, 1.691998, 0.4314975, 0, 1, 0.07058824, 1,
-0.4345997, -0.536985, -1.86565, 0, 1, 0.07450981, 1,
-0.4311841, -0.7689091, -3.36957, 0, 1, 0.08235294, 1,
-0.4310388, 0.0707115, -1.760106, 0, 1, 0.08627451, 1,
-0.4305642, 0.2481085, -1.313285, 0, 1, 0.09411765, 1,
-0.4302914, 0.9082421, 0.3921112, 0, 1, 0.1019608, 1,
-0.4296975, 0.7663174, 1.237864, 0, 1, 0.1058824, 1,
-0.4289153, 0.30025, -0.5798838, 0, 1, 0.1137255, 1,
-0.4246854, 1.088791, 0.6076695, 0, 1, 0.1176471, 1,
-0.4243496, -1.021852, -3.21647, 0, 1, 0.1254902, 1,
-0.419068, -0.69058, -3.659525, 0, 1, 0.1294118, 1,
-0.4189222, -1.233492, -2.13175, 0, 1, 0.1372549, 1,
-0.4169577, -1.382421, -3.961512, 0, 1, 0.1411765, 1,
-0.412429, -0.4856919, -2.489703, 0, 1, 0.1490196, 1,
-0.4087742, -1.036659, -1.381765, 0, 1, 0.1529412, 1,
-0.4079719, -0.3765256, -3.226312, 0, 1, 0.1607843, 1,
-0.4060684, -0.246851, -0.9956642, 0, 1, 0.1647059, 1,
-0.4045943, -1.519928, -5.938176, 0, 1, 0.172549, 1,
-0.3983053, -0.4955491, -2.266507, 0, 1, 0.1764706, 1,
-0.3872775, 1.281399, 0.04925639, 0, 1, 0.1843137, 1,
-0.3864704, -2.871153, -3.399507, 0, 1, 0.1882353, 1,
-0.3857774, -1.715677, -2.066095, 0, 1, 0.1960784, 1,
-0.3845671, 0.5390546, 0.7163086, 0, 1, 0.2039216, 1,
-0.377363, -1.525453, -4.090424, 0, 1, 0.2078431, 1,
-0.3758552, -0.7561218, -1.497563, 0, 1, 0.2156863, 1,
-0.3749398, 0.7351085, -1.5098, 0, 1, 0.2196078, 1,
-0.3690879, 0.6162764, -0.3983392, 0, 1, 0.227451, 1,
-0.3682528, 1.409461, -0.1547153, 0, 1, 0.2313726, 1,
-0.3640742, -1.430449, -3.223403, 0, 1, 0.2392157, 1,
-0.3623711, -0.7770928, -2.439632, 0, 1, 0.2431373, 1,
-0.3605017, 0.9842181, -0.4679269, 0, 1, 0.2509804, 1,
-0.3555721, -1.187362, -2.562196, 0, 1, 0.254902, 1,
-0.3546651, -0.7734299, -0.9770659, 0, 1, 0.2627451, 1,
-0.3535485, -0.07551082, -0.8947082, 0, 1, 0.2666667, 1,
-0.3531128, 0.2784243, -1.436228, 0, 1, 0.2745098, 1,
-0.3518226, 0.05362592, -2.31159, 0, 1, 0.2784314, 1,
-0.3505783, 0.5215796, -1.494042, 0, 1, 0.2862745, 1,
-0.3487811, 0.1956469, 0.6827814, 0, 1, 0.2901961, 1,
-0.3437621, -0.2013831, -2.787397, 0, 1, 0.2980392, 1,
-0.3426675, 0.4555576, -1.56225, 0, 1, 0.3058824, 1,
-0.3414001, -0.03091785, -3.578071, 0, 1, 0.3098039, 1,
-0.3365593, 1.336983, 0.8452896, 0, 1, 0.3176471, 1,
-0.3337047, -0.1011621, -3.799565, 0, 1, 0.3215686, 1,
-0.3335276, 1.177304, 0.0295682, 0, 1, 0.3294118, 1,
-0.3314718, -0.7167649, -4.240202, 0, 1, 0.3333333, 1,
-0.3250279, 0.3426997, -0.7481053, 0, 1, 0.3411765, 1,
-0.3229915, -0.9599633, -3.477401, 0, 1, 0.345098, 1,
-0.3218414, -0.3389432, -2.940094, 0, 1, 0.3529412, 1,
-0.3135218, -1.293731, -3.908329, 0, 1, 0.3568628, 1,
-0.3103667, 0.3652807, -0.511643, 0, 1, 0.3647059, 1,
-0.3082738, 0.8872671, -2.327449, 0, 1, 0.3686275, 1,
-0.3015529, -0.5300409, -2.560922, 0, 1, 0.3764706, 1,
-0.3003221, 0.5917507, 1.667424, 0, 1, 0.3803922, 1,
-0.3002397, 0.5010718, -0.6047945, 0, 1, 0.3882353, 1,
-0.299073, -1.64373, -2.343405, 0, 1, 0.3921569, 1,
-0.2947668, 1.097596, 0.4819062, 0, 1, 0.4, 1,
-0.2923285, -2.647142, -2.525715, 0, 1, 0.4078431, 1,
-0.2921042, 0.643364, 0.8495682, 0, 1, 0.4117647, 1,
-0.2899514, 1.004618, 0.2396936, 0, 1, 0.4196078, 1,
-0.2881859, -1.779042, -3.855766, 0, 1, 0.4235294, 1,
-0.2878111, -1.262999, -2.222751, 0, 1, 0.4313726, 1,
-0.2854871, -1.539908, -3.635201, 0, 1, 0.4352941, 1,
-0.2850228, -0.7924955, -2.250838, 0, 1, 0.4431373, 1,
-0.2838782, -0.001003637, -0.8678763, 0, 1, 0.4470588, 1,
-0.2814583, 0.7680655, 1.930735, 0, 1, 0.454902, 1,
-0.272801, 0.4529322, -1.251651, 0, 1, 0.4588235, 1,
-0.2714912, 0.04905545, -2.877265, 0, 1, 0.4666667, 1,
-0.2705287, -0.2021319, -3.446087, 0, 1, 0.4705882, 1,
-0.269529, -0.6387163, -1.947023, 0, 1, 0.4784314, 1,
-0.2695135, -0.1425018, -0.9002675, 0, 1, 0.4823529, 1,
-0.2693432, 0.04393313, -0.9962617, 0, 1, 0.4901961, 1,
-0.2660744, -1.498484, -4.266423, 0, 1, 0.4941176, 1,
-0.2625341, -1.486464, -3.77797, 0, 1, 0.5019608, 1,
-0.261461, -1.601573, -3.718124, 0, 1, 0.509804, 1,
-0.2563938, 1.176617, 0.02723471, 0, 1, 0.5137255, 1,
-0.2551976, 0.02338305, -1.048232, 0, 1, 0.5215687, 1,
-0.2545354, 0.7691045, 0.7499301, 0, 1, 0.5254902, 1,
-0.2481133, -0.09398174, -2.874172, 0, 1, 0.5333334, 1,
-0.2474182, 1.148786, -0.9134403, 0, 1, 0.5372549, 1,
-0.2441953, 0.6506067, -1.850602, 0, 1, 0.5450981, 1,
-0.2349649, 0.4162354, -1.293253, 0, 1, 0.5490196, 1,
-0.2311129, -0.8891092, -3.335628, 0, 1, 0.5568628, 1,
-0.2284402, 1.202127, -0.756769, 0, 1, 0.5607843, 1,
-0.2272711, 0.3735177, -1.74154, 0, 1, 0.5686275, 1,
-0.2250624, -0.09090817, -2.641599, 0, 1, 0.572549, 1,
-0.2225609, 0.3715738, -0.6128095, 0, 1, 0.5803922, 1,
-0.2205784, -0.07968003, -3.679168, 0, 1, 0.5843138, 1,
-0.2154949, -0.2681615, -1.747619, 0, 1, 0.5921569, 1,
-0.2147369, 0.3243646, 0.5184804, 0, 1, 0.5960785, 1,
-0.2140742, -0.254151, -3.782772, 0, 1, 0.6039216, 1,
-0.2119541, -0.6106855, -3.738385, 0, 1, 0.6117647, 1,
-0.210114, 0.1539554, -1.543845, 0, 1, 0.6156863, 1,
-0.2083212, -1.126053, -3.10882, 0, 1, 0.6235294, 1,
-0.2073056, -1.20135, -3.76581, 0, 1, 0.627451, 1,
-0.2046695, 1.74727, 1.244628, 0, 1, 0.6352941, 1,
-0.2045064, 0.5304961, -0.8355432, 0, 1, 0.6392157, 1,
-0.2014296, -0.501511, -1.841511, 0, 1, 0.6470588, 1,
-0.1994378, 0.7330292, 1.007838, 0, 1, 0.6509804, 1,
-0.1866988, 0.3302449, -1.220183, 0, 1, 0.6588235, 1,
-0.1784375, 1.125916, -0.3262904, 0, 1, 0.6627451, 1,
-0.1776296, -0.7691814, -1.472992, 0, 1, 0.6705883, 1,
-0.1749681, -1.008476, -1.433838, 0, 1, 0.6745098, 1,
-0.1745169, 0.2219211, -1.404525, 0, 1, 0.682353, 1,
-0.1705053, -0.7822412, -2.352835, 0, 1, 0.6862745, 1,
-0.167655, 0.04772639, -0.984602, 0, 1, 0.6941177, 1,
-0.1670785, -0.05157462, -1.741251, 0, 1, 0.7019608, 1,
-0.1657795, -0.1703841, -3.351009, 0, 1, 0.7058824, 1,
-0.1657319, 0.7657588, 0.6298415, 0, 1, 0.7137255, 1,
-0.1647598, 1.482954, 0.08967146, 0, 1, 0.7176471, 1,
-0.1641227, -0.4894392, -2.936949, 0, 1, 0.7254902, 1,
-0.1567583, -0.3698713, -2.57089, 0, 1, 0.7294118, 1,
-0.1502135, -0.0453529, -2.655971, 0, 1, 0.7372549, 1,
-0.1490463, 1.331098, -1.199577, 0, 1, 0.7411765, 1,
-0.1455904, 0.2144998, -1.299994, 0, 1, 0.7490196, 1,
-0.1400601, 1.422017, -0.7628547, 0, 1, 0.7529412, 1,
-0.1392691, -0.03060146, -1.598333, 0, 1, 0.7607843, 1,
-0.136049, -2.159807, -3.410658, 0, 1, 0.7647059, 1,
-0.1347119, -0.7151555, -3.97627, 0, 1, 0.772549, 1,
-0.132559, -0.2749528, -3.492486, 0, 1, 0.7764706, 1,
-0.1281718, 0.6444949, -1.419729, 0, 1, 0.7843137, 1,
-0.125853, -0.9589606, -2.785887, 0, 1, 0.7882353, 1,
-0.1249104, -0.22759, -3.049996, 0, 1, 0.7960784, 1,
-0.1212453, 0.7395523, -0.5395434, 0, 1, 0.8039216, 1,
-0.1143929, 0.1839203, -0.5905273, 0, 1, 0.8078431, 1,
-0.1134759, -0.4356108, -4.183868, 0, 1, 0.8156863, 1,
-0.1094234, 0.3716365, 0.2386026, 0, 1, 0.8196079, 1,
-0.107517, -1.071659, -3.275559, 0, 1, 0.827451, 1,
-0.1056478, -0.2955517, -2.407475, 0, 1, 0.8313726, 1,
-0.1033019, 1.059735, 0.436075, 0, 1, 0.8392157, 1,
-0.0950269, -0.3455245, -2.214233, 0, 1, 0.8431373, 1,
-0.08879948, 0.7527805, -0.2154883, 0, 1, 0.8509804, 1,
-0.08214267, 0.3976735, -0.6276779, 0, 1, 0.854902, 1,
-0.08097047, -0.4634878, -4.259171, 0, 1, 0.8627451, 1,
-0.07919398, 0.8920608, 0.2442504, 0, 1, 0.8666667, 1,
-0.07713726, -0.6837321, -1.634676, 0, 1, 0.8745098, 1,
-0.07672147, -0.5066223, -4.324805, 0, 1, 0.8784314, 1,
-0.07663653, -0.3633374, -4.28311, 0, 1, 0.8862745, 1,
-0.07239921, 2.11412, 0.6131068, 0, 1, 0.8901961, 1,
-0.06998366, 0.4425707, 1.201286, 0, 1, 0.8980392, 1,
-0.06921711, 1.519302, 1.771092, 0, 1, 0.9058824, 1,
-0.06633417, 0.3656594, 0.6426558, 0, 1, 0.9098039, 1,
-0.06595922, 0.09293376, -1.585247, 0, 1, 0.9176471, 1,
-0.0656374, 0.9768803, -0.8488899, 0, 1, 0.9215686, 1,
-0.06469183, 0.07796751, 1.06798, 0, 1, 0.9294118, 1,
-0.05396499, 0.8954418, 0.7501718, 0, 1, 0.9333333, 1,
-0.05326035, -0.7330883, -4.240911, 0, 1, 0.9411765, 1,
-0.0528831, 2.837893, 1.219016, 0, 1, 0.945098, 1,
-0.05217032, -1.74693, -2.823072, 0, 1, 0.9529412, 1,
-0.04618042, -1.066661, -2.867191, 0, 1, 0.9568627, 1,
-0.04548442, -0.2780182, -3.265165, 0, 1, 0.9647059, 1,
-0.04207641, 0.6983114, -0.09854945, 0, 1, 0.9686275, 1,
-0.03889436, 2.43323, -0.005807934, 0, 1, 0.9764706, 1,
-0.03873884, -1.468887, -3.301223, 0, 1, 0.9803922, 1,
-0.03483733, -0.4696062, -4.260659, 0, 1, 0.9882353, 1,
-0.0295777, -0.3234492, -2.401908, 0, 1, 0.9921569, 1,
-0.02525632, -0.5469003, -4.166953, 0, 1, 1, 1,
-0.02297789, 1.145588, -0.6470115, 0, 0.9921569, 1, 1,
-0.02030449, 0.1024837, -0.5124885, 0, 0.9882353, 1, 1,
-0.01885374, -1.68401, -2.133012, 0, 0.9803922, 1, 1,
-0.01835378, -1.086977, -1.589432, 0, 0.9764706, 1, 1,
-0.01757686, 1.117421, -0.3606643, 0, 0.9686275, 1, 1,
-0.01326052, -0.9370739, -2.903491, 0, 0.9647059, 1, 1,
-0.0128894, 0.3708368, -0.3030975, 0, 0.9568627, 1, 1,
-0.01024554, -0.2680831, -4.85267, 0, 0.9529412, 1, 1,
-0.01011575, -0.1481462, -2.701373, 0, 0.945098, 1, 1,
-0.00983021, 1.142984, -0.6019599, 0, 0.9411765, 1, 1,
-0.009758816, -0.2129709, -2.292022, 0, 0.9333333, 1, 1,
-0.004382403, 0.5582484, 0.2356262, 0, 0.9294118, 1, 1,
-0.0005239189, 0.8412401, -0.547164, 0, 0.9215686, 1, 1,
0.0003283325, 0.08683508, -0.3527383, 0, 0.9176471, 1, 1,
0.0009806069, -0.1267462, 2.254322, 0, 0.9098039, 1, 1,
0.001287011, 0.4480513, -1.392766, 0, 0.9058824, 1, 1,
0.001493412, -0.5021886, 2.910509, 0, 0.8980392, 1, 1,
0.005620291, -1.730989, 2.37933, 0, 0.8901961, 1, 1,
0.01297591, 1.920595, 0.6606793, 0, 0.8862745, 1, 1,
0.01964674, 1.369582, -1.887663, 0, 0.8784314, 1, 1,
0.03513423, 0.6981755, -0.4365945, 0, 0.8745098, 1, 1,
0.03769074, -0.4503495, 3.286234, 0, 0.8666667, 1, 1,
0.04829485, 0.2105091, 1.17188, 0, 0.8627451, 1, 1,
0.05378965, -2.548809, 2.610031, 0, 0.854902, 1, 1,
0.05501278, 1.126224, -1.00362, 0, 0.8509804, 1, 1,
0.06002752, 2.165437, 2.000792, 0, 0.8431373, 1, 1,
0.06180044, -0.9578169, 2.754861, 0, 0.8392157, 1, 1,
0.06209774, -0.9051733, 5.161319, 0, 0.8313726, 1, 1,
0.06263477, -0.117448, 3.43426, 0, 0.827451, 1, 1,
0.06300069, -1.083447, 4.538292, 0, 0.8196079, 1, 1,
0.06453131, -0.01594358, 0.5645666, 0, 0.8156863, 1, 1,
0.06514309, 0.575528, -1.359116, 0, 0.8078431, 1, 1,
0.06833889, 0.5948421, 0.6662875, 0, 0.8039216, 1, 1,
0.07884338, 1.628693, -1.537833, 0, 0.7960784, 1, 1,
0.0789274, -0.4909634, 1.506107, 0, 0.7882353, 1, 1,
0.08317397, 0.4978987, 1.281634, 0, 0.7843137, 1, 1,
0.09034652, -0.5609931, 4.971858, 0, 0.7764706, 1, 1,
0.09520893, 0.0120225, 0.1274081, 0, 0.772549, 1, 1,
0.09843194, 0.3644562, 0.06103435, 0, 0.7647059, 1, 1,
0.1056003, -0.02823477, 1.381345, 0, 0.7607843, 1, 1,
0.1056431, -1.690978, 4.043404, 0, 0.7529412, 1, 1,
0.1066425, 0.2653518, 1.299896, 0, 0.7490196, 1, 1,
0.1130183, 1.06385, 0.3013333, 0, 0.7411765, 1, 1,
0.1134673, -0.4685193, 0.4797053, 0, 0.7372549, 1, 1,
0.1164126, -1.067353, 4.047036, 0, 0.7294118, 1, 1,
0.1164626, -0.4646392, 1.882205, 0, 0.7254902, 1, 1,
0.1167696, 0.6510327, 0.7423643, 0, 0.7176471, 1, 1,
0.1171124, 1.110988, -0.8185678, 0, 0.7137255, 1, 1,
0.1175887, -2.259374, 4.825668, 0, 0.7058824, 1, 1,
0.1192539, -0.6424426, 3.164907, 0, 0.6980392, 1, 1,
0.1194013, -1.062385, 2.967227, 0, 0.6941177, 1, 1,
0.1258576, -1.301626, 2.084815, 0, 0.6862745, 1, 1,
0.1284506, 1.297738, 1.347538, 0, 0.682353, 1, 1,
0.1300455, -0.1365345, 1.912794, 0, 0.6745098, 1, 1,
0.1308758, -1.985562, 2.812133, 0, 0.6705883, 1, 1,
0.1363044, -2.198175, 2.719138, 0, 0.6627451, 1, 1,
0.1395938, 0.6398587, 2.312421, 0, 0.6588235, 1, 1,
0.1407263, 1.354552, 0.3239647, 0, 0.6509804, 1, 1,
0.1446448, -0.2984802, 5.040112, 0, 0.6470588, 1, 1,
0.1492642, 1.18286, 0.01926142, 0, 0.6392157, 1, 1,
0.149344, -1.233713, 1.944417, 0, 0.6352941, 1, 1,
0.1530577, 0.1630389, 1.750762, 0, 0.627451, 1, 1,
0.1623252, -1.388914, 2.225336, 0, 0.6235294, 1, 1,
0.1640949, 1.455506, -1.374534, 0, 0.6156863, 1, 1,
0.1643357, 0.2448123, 2.509706, 0, 0.6117647, 1, 1,
0.168123, 3.38508, 0.3024023, 0, 0.6039216, 1, 1,
0.169627, -0.3417613, 2.185846, 0, 0.5960785, 1, 1,
0.1717925, 0.07275761, 2.104014, 0, 0.5921569, 1, 1,
0.1731081, -1.078969, 2.116436, 0, 0.5843138, 1, 1,
0.1733569, -0.4007982, 3.167261, 0, 0.5803922, 1, 1,
0.1829749, 1.006824, 1.259897, 0, 0.572549, 1, 1,
0.1836439, -1.334051, 2.921458, 0, 0.5686275, 1, 1,
0.1851111, -0.847936, 3.984074, 0, 0.5607843, 1, 1,
0.1866675, -0.288724, 4.071893, 0, 0.5568628, 1, 1,
0.1880666, 1.939495, -0.180527, 0, 0.5490196, 1, 1,
0.188907, -1.052366, 3.010187, 0, 0.5450981, 1, 1,
0.1928374, -0.7163882, 0.4521392, 0, 0.5372549, 1, 1,
0.1928663, 0.9058561, 0.0190933, 0, 0.5333334, 1, 1,
0.1935363, -0.3658994, 2.95927, 0, 0.5254902, 1, 1,
0.1948597, -0.3815435, 4.562047, 0, 0.5215687, 1, 1,
0.19726, -0.784089, 1.778387, 0, 0.5137255, 1, 1,
0.2111901, 0.03804795, 1.079892, 0, 0.509804, 1, 1,
0.2151221, -0.2621931, 4.029003, 0, 0.5019608, 1, 1,
0.2225003, -0.5749123, 2.179553, 0, 0.4941176, 1, 1,
0.2241209, 0.6285677, 1.510434, 0, 0.4901961, 1, 1,
0.2259813, -0.6687947, 3.584327, 0, 0.4823529, 1, 1,
0.2354992, 1.30124, -0.03955162, 0, 0.4784314, 1, 1,
0.2355843, -1.948156, 4.359127, 0, 0.4705882, 1, 1,
0.2374193, 1.576074, 1.492968, 0, 0.4666667, 1, 1,
0.2377256, 2.158431, -0.06292597, 0, 0.4588235, 1, 1,
0.2422751, -0.5546784, 2.881033, 0, 0.454902, 1, 1,
0.243476, -0.6329326, 2.976399, 0, 0.4470588, 1, 1,
0.2512664, 0.282874, 0.1818281, 0, 0.4431373, 1, 1,
0.2553037, -1.253524, 2.932308, 0, 0.4352941, 1, 1,
0.2572936, 0.1452276, 0.4960836, 0, 0.4313726, 1, 1,
0.2591726, -0.4731452, 0.9311171, 0, 0.4235294, 1, 1,
0.2612202, -0.6083276, 3.559399, 0, 0.4196078, 1, 1,
0.2646563, 0.276854, 1.251083, 0, 0.4117647, 1, 1,
0.2684891, 0.6769074, 0.3790777, 0, 0.4078431, 1, 1,
0.2742845, -0.9942095, 4.716872, 0, 0.4, 1, 1,
0.2792932, 0.9997507, 0.6841007, 0, 0.3921569, 1, 1,
0.2857793, 0.7417708, 0.6032623, 0, 0.3882353, 1, 1,
0.286083, -0.584083, 1.683789, 0, 0.3803922, 1, 1,
0.2860904, 0.6433389, 0.5876927, 0, 0.3764706, 1, 1,
0.2869653, -1.137673, 4.579063, 0, 0.3686275, 1, 1,
0.2936979, -0.8677154, 4.07794, 0, 0.3647059, 1, 1,
0.2978743, 0.8534006, 0.533108, 0, 0.3568628, 1, 1,
0.2980393, 0.7637535, 1.763502, 0, 0.3529412, 1, 1,
0.3026502, -1.417087, 2.211149, 0, 0.345098, 1, 1,
0.3035272, 0.6051103, 1.018453, 0, 0.3411765, 1, 1,
0.3073144, 0.6274925, 1.711772, 0, 0.3333333, 1, 1,
0.3125178, 0.6259685, -0.7357346, 0, 0.3294118, 1, 1,
0.313628, -0.992338, 2.809939, 0, 0.3215686, 1, 1,
0.3140276, 2.336944, 0.7998888, 0, 0.3176471, 1, 1,
0.3156261, -0.7601566, 3.302427, 0, 0.3098039, 1, 1,
0.3204691, -2.559089, 3.348039, 0, 0.3058824, 1, 1,
0.3209041, 0.4798111, 0.3565655, 0, 0.2980392, 1, 1,
0.322502, -0.04222317, 2.157586, 0, 0.2901961, 1, 1,
0.3235563, -0.347185, 3.666914, 0, 0.2862745, 1, 1,
0.3246267, 0.1890729, 2.016605, 0, 0.2784314, 1, 1,
0.3251586, 0.7841507, 1.490175, 0, 0.2745098, 1, 1,
0.3257812, -0.4315842, 1.878921, 0, 0.2666667, 1, 1,
0.3338216, -0.5228469, 3.049199, 0, 0.2627451, 1, 1,
0.3361963, -0.8329537, 4.912968, 0, 0.254902, 1, 1,
0.3386224, 0.1542353, 1.206615, 0, 0.2509804, 1, 1,
0.3448319, -1.67949, 3.700006, 0, 0.2431373, 1, 1,
0.3500627, -0.361808, 4.353988, 0, 0.2392157, 1, 1,
0.351548, 0.1302392, 0.8365118, 0, 0.2313726, 1, 1,
0.3522887, 0.426348, -0.5417004, 0, 0.227451, 1, 1,
0.3558903, 2.202173, -1.891126, 0, 0.2196078, 1, 1,
0.3580973, 0.5698771, 0.6374451, 0, 0.2156863, 1, 1,
0.3606732, -0.2225834, 2.072732, 0, 0.2078431, 1, 1,
0.3618681, -1.11702, 1.073739, 0, 0.2039216, 1, 1,
0.3640995, -1.187365, 5.637635, 0, 0.1960784, 1, 1,
0.3666949, 0.4841954, 1.173123, 0, 0.1882353, 1, 1,
0.3700685, 0.3514132, 0.4774106, 0, 0.1843137, 1, 1,
0.3805847, 0.002874353, 2.553697, 0, 0.1764706, 1, 1,
0.3811834, -0.1810573, 1.041617, 0, 0.172549, 1, 1,
0.3824903, -0.00204757, 2.08918, 0, 0.1647059, 1, 1,
0.3827793, -1.224063, 3.388398, 0, 0.1607843, 1, 1,
0.3831303, -0.1363372, 1.351072, 0, 0.1529412, 1, 1,
0.3833595, -0.391861, 3.997609, 0, 0.1490196, 1, 1,
0.3841867, -0.8191381, 3.98211, 0, 0.1411765, 1, 1,
0.3860777, 1.163564, 0.2812753, 0, 0.1372549, 1, 1,
0.3910962, 1.84782, 0.7596065, 0, 0.1294118, 1, 1,
0.3957949, -0.2128211, 2.950909, 0, 0.1254902, 1, 1,
0.3969831, 0.6735893, -0.2708678, 0, 0.1176471, 1, 1,
0.3970238, 1.269771, 0.8286769, 0, 0.1137255, 1, 1,
0.3989873, -1.042718, 2.994691, 0, 0.1058824, 1, 1,
0.4022517, 0.2919191, -0.3597853, 0, 0.09803922, 1, 1,
0.4052356, -0.4664508, 2.98336, 0, 0.09411765, 1, 1,
0.4053343, -1.152166, 3.240131, 0, 0.08627451, 1, 1,
0.411307, -0.5059877, 1.446859, 0, 0.08235294, 1, 1,
0.4115398, 0.2318541, 3.49029, 0, 0.07450981, 1, 1,
0.413163, -0.7385444, 2.595891, 0, 0.07058824, 1, 1,
0.4140337, -1.022297, 1.320676, 0, 0.0627451, 1, 1,
0.4143128, -0.285213, 1.661831, 0, 0.05882353, 1, 1,
0.4209729, -1.635779, 3.348246, 0, 0.05098039, 1, 1,
0.422067, -0.5347399, 2.374776, 0, 0.04705882, 1, 1,
0.4223006, -1.176394, 2.50233, 0, 0.03921569, 1, 1,
0.42258, 0.3500558, 0.4425934, 0, 0.03529412, 1, 1,
0.4265828, 0.9458362, 0.9947519, 0, 0.02745098, 1, 1,
0.4317974, -0.9520149, 1.771818, 0, 0.02352941, 1, 1,
0.4379272, 0.422979, 0.4990625, 0, 0.01568628, 1, 1,
0.4398886, 2.026077, -0.7955442, 0, 0.01176471, 1, 1,
0.4401418, -0.3994126, 1.43328, 0, 0.003921569, 1, 1,
0.4411323, 1.199036, 1.355323, 0.003921569, 0, 1, 1,
0.4428894, -0.1274844, 1.09667, 0.007843138, 0, 1, 1,
0.4428914, -0.2088724, 2.932255, 0.01568628, 0, 1, 1,
0.4461098, 1.367438, 0.4585736, 0.01960784, 0, 1, 1,
0.4461318, -1.102773, 1.832607, 0.02745098, 0, 1, 1,
0.448714, -0.2989468, 1.714787, 0.03137255, 0, 1, 1,
0.4495101, 0.2327792, 0.546999, 0.03921569, 0, 1, 1,
0.4496586, 0.01010169, 1.409774, 0.04313726, 0, 1, 1,
0.4528549, -0.3964434, 2.611653, 0.05098039, 0, 1, 1,
0.4538507, 0.3524545, 2.127798, 0.05490196, 0, 1, 1,
0.4541471, -0.04071361, 2.591683, 0.0627451, 0, 1, 1,
0.4543457, 0.4947351, 0.7644755, 0.06666667, 0, 1, 1,
0.4552484, 0.6835915, 0.595125, 0.07450981, 0, 1, 1,
0.4578016, -0.0313478, 1.267823, 0.07843138, 0, 1, 1,
0.460237, -0.3818577, 3.24209, 0.08627451, 0, 1, 1,
0.4611787, -0.8176763, 1.612777, 0.09019608, 0, 1, 1,
0.4709185, -0.3679231, 2.305306, 0.09803922, 0, 1, 1,
0.4765641, -0.1225898, 2.213762, 0.1058824, 0, 1, 1,
0.477083, 0.03846576, 1.941342, 0.1098039, 0, 1, 1,
0.4783628, 0.07784564, 2.073293, 0.1176471, 0, 1, 1,
0.4809139, 0.5776572, 2.806555, 0.1215686, 0, 1, 1,
0.4810899, -0.4072698, 1.251422, 0.1294118, 0, 1, 1,
0.4812305, 0.3627063, 1.590073, 0.1333333, 0, 1, 1,
0.4824615, 0.5580509, -0.3457018, 0.1411765, 0, 1, 1,
0.4870442, -1.065979, 3.255494, 0.145098, 0, 1, 1,
0.4885249, -0.7345612, 2.910124, 0.1529412, 0, 1, 1,
0.4929604, 1.951156, 1.158181, 0.1568628, 0, 1, 1,
0.4940051, -0.01560809, 0.4950391, 0.1647059, 0, 1, 1,
0.5037228, 0.7358323, 0.9303433, 0.1686275, 0, 1, 1,
0.5052479, 0.7526913, -0.4713199, 0.1764706, 0, 1, 1,
0.5113484, -0.6241924, 3.261294, 0.1803922, 0, 1, 1,
0.5117227, 0.1612499, 1.709476, 0.1882353, 0, 1, 1,
0.5156921, -0.07125245, 1.13268, 0.1921569, 0, 1, 1,
0.518636, -0.250315, 2.938724, 0.2, 0, 1, 1,
0.5209039, 0.05481965, 1.715478, 0.2078431, 0, 1, 1,
0.5241845, -1.676124, 2.512224, 0.2117647, 0, 1, 1,
0.525553, 2.024143, 0.7564122, 0.2196078, 0, 1, 1,
0.5290811, 0.5534467, 0.1860238, 0.2235294, 0, 1, 1,
0.5293908, -0.001426336, 0.2767131, 0.2313726, 0, 1, 1,
0.5453762, 1.84428, -0.7310967, 0.2352941, 0, 1, 1,
0.5501587, -0.836676, 1.263503, 0.2431373, 0, 1, 1,
0.5659821, -0.8202389, 3.431093, 0.2470588, 0, 1, 1,
0.5677615, -0.4637688, 2.527682, 0.254902, 0, 1, 1,
0.5680901, 1.65422, 0.5973899, 0.2588235, 0, 1, 1,
0.5716038, 0.2339278, 4.271804, 0.2666667, 0, 1, 1,
0.5737814, 0.7956564, 0.6382174, 0.2705882, 0, 1, 1,
0.579704, 0.09325305, 0.7217447, 0.2784314, 0, 1, 1,
0.5839475, -0.2606367, 2.469901, 0.282353, 0, 1, 1,
0.5884393, 0.1875458, 0.6963893, 0.2901961, 0, 1, 1,
0.5942213, -1.877723, 1.906984, 0.2941177, 0, 1, 1,
0.5948849, 0.01702683, 0.4816482, 0.3019608, 0, 1, 1,
0.6020024, 0.1906071, 2.382039, 0.3098039, 0, 1, 1,
0.6026, 1.005263, 0.9333639, 0.3137255, 0, 1, 1,
0.6033217, -0.8288816, 2.104808, 0.3215686, 0, 1, 1,
0.6067557, -0.787867, 2.02281, 0.3254902, 0, 1, 1,
0.607938, -0.3306912, 3.422935, 0.3333333, 0, 1, 1,
0.6096175, -0.8875096, 2.405781, 0.3372549, 0, 1, 1,
0.6106408, 0.1378315, 0.8184897, 0.345098, 0, 1, 1,
0.6116621, 0.9379171, 0.2571814, 0.3490196, 0, 1, 1,
0.6144879, 1.319165, 0.6440396, 0.3568628, 0, 1, 1,
0.6200675, 0.8767704, 1.355799, 0.3607843, 0, 1, 1,
0.6211897, 1.14371, 0.5681767, 0.3686275, 0, 1, 1,
0.6263279, -0.4483744, 1.559852, 0.372549, 0, 1, 1,
0.6277804, 1.055071, 2.360003, 0.3803922, 0, 1, 1,
0.6291078, -0.4661492, 1.04901, 0.3843137, 0, 1, 1,
0.6353837, -0.3215902, 2.019786, 0.3921569, 0, 1, 1,
0.6384841, -0.1818362, 0.6081756, 0.3960784, 0, 1, 1,
0.6393775, -1.599282, 1.038666, 0.4039216, 0, 1, 1,
0.641713, 0.3711807, 2.389964, 0.4117647, 0, 1, 1,
0.6464429, -0.02059661, -0.1834944, 0.4156863, 0, 1, 1,
0.6485407, 0.6493393, 0.1844167, 0.4235294, 0, 1, 1,
0.6506883, 1.386478, 0.3145047, 0.427451, 0, 1, 1,
0.657464, -0.1589409, 1.346711, 0.4352941, 0, 1, 1,
0.6626371, -0.6943351, 3.210433, 0.4392157, 0, 1, 1,
0.6636531, 0.09480033, 0.9435222, 0.4470588, 0, 1, 1,
0.6647543, 0.3842379, 0.5196782, 0.4509804, 0, 1, 1,
0.6658581, -0.8163328, 4.624321, 0.4588235, 0, 1, 1,
0.6661101, -1.965809, 2.797538, 0.4627451, 0, 1, 1,
0.672534, -0.5258634, 2.588389, 0.4705882, 0, 1, 1,
0.6777341, -0.09359092, 2.550122, 0.4745098, 0, 1, 1,
0.6833638, -0.1239076, 2.878413, 0.4823529, 0, 1, 1,
0.68797, 0.9092728, 1.440794, 0.4862745, 0, 1, 1,
0.6948162, 1.265531, -0.5903987, 0.4941176, 0, 1, 1,
0.6976848, -0.08140843, 1.733722, 0.5019608, 0, 1, 1,
0.7042726, 0.314698, 0.9029961, 0.5058824, 0, 1, 1,
0.7057189, -0.341027, 2.451886, 0.5137255, 0, 1, 1,
0.708118, -1.632187, 1.571352, 0.5176471, 0, 1, 1,
0.7095503, -0.04854921, 1.772175, 0.5254902, 0, 1, 1,
0.7130291, -0.580622, 3.009378, 0.5294118, 0, 1, 1,
0.7140453, 1.77567, 0.2352451, 0.5372549, 0, 1, 1,
0.7166989, 0.6405264, 1.316897, 0.5411765, 0, 1, 1,
0.7180673, 0.6346477, 0.2407619, 0.5490196, 0, 1, 1,
0.7262598, -0.07198308, 2.543414, 0.5529412, 0, 1, 1,
0.7278319, -0.1472014, 0.9278772, 0.5607843, 0, 1, 1,
0.7306322, 0.9325381, 1.662698, 0.5647059, 0, 1, 1,
0.7312224, 1.318735, 0.3045087, 0.572549, 0, 1, 1,
0.7369964, 0.521512, 2.172748, 0.5764706, 0, 1, 1,
0.7392414, -1.891401, 2.110291, 0.5843138, 0, 1, 1,
0.7417847, -1.186417, 2.350138, 0.5882353, 0, 1, 1,
0.7467261, -0.9080889, 0.9590694, 0.5960785, 0, 1, 1,
0.7472919, 0.2414759, 0.562903, 0.6039216, 0, 1, 1,
0.7535654, 0.6448061, 0.3061556, 0.6078432, 0, 1, 1,
0.7551099, 0.6769661, 0.6173785, 0.6156863, 0, 1, 1,
0.7557404, -0.6120801, 1.364611, 0.6196079, 0, 1, 1,
0.7569517, -0.5635468, 1.883911, 0.627451, 0, 1, 1,
0.759243, 0.416152, 2.04756, 0.6313726, 0, 1, 1,
0.761239, -0.4608543, 0.6971083, 0.6392157, 0, 1, 1,
0.7622771, 0.8922737, 0.5283458, 0.6431373, 0, 1, 1,
0.7623103, -1.243741, 2.706741, 0.6509804, 0, 1, 1,
0.7634829, -0.923063, 0.9293309, 0.654902, 0, 1, 1,
0.7721237, 0.328284, 1.083819, 0.6627451, 0, 1, 1,
0.7726492, 1.727279, 1.22971, 0.6666667, 0, 1, 1,
0.7769225, 1.403766, -1.190354, 0.6745098, 0, 1, 1,
0.7793674, -0.3655268, 3.550527, 0.6784314, 0, 1, 1,
0.7797709, -2.216446, 2.922423, 0.6862745, 0, 1, 1,
0.7886887, -1.75152, 4.345047, 0.6901961, 0, 1, 1,
0.7931162, 0.02753821, 1.673886, 0.6980392, 0, 1, 1,
0.7936223, 0.1770936, 2.250294, 0.7058824, 0, 1, 1,
0.7975664, -1.570229, 3.463094, 0.7098039, 0, 1, 1,
0.8000234, 0.5504032, 0.9211292, 0.7176471, 0, 1, 1,
0.801514, 0.6149576, 1.046063, 0.7215686, 0, 1, 1,
0.8129263, -0.8312428, 1.68817, 0.7294118, 0, 1, 1,
0.8142473, -0.1737973, 1.169945, 0.7333333, 0, 1, 1,
0.8244357, 0.5614992, 1.386458, 0.7411765, 0, 1, 1,
0.8259493, 0.3998926, 2.189637, 0.7450981, 0, 1, 1,
0.8336362, 0.2363693, 0.4253216, 0.7529412, 0, 1, 1,
0.8418913, -1.113689, 1.854779, 0.7568628, 0, 1, 1,
0.8482071, -0.3855346, 3.422154, 0.7647059, 0, 1, 1,
0.8482966, 0.4360291, 0.4020063, 0.7686275, 0, 1, 1,
0.8507172, 0.4775617, 1.382511, 0.7764706, 0, 1, 1,
0.8516943, -1.362943, 3.855097, 0.7803922, 0, 1, 1,
0.8517021, 1.631771, 1.533746, 0.7882353, 0, 1, 1,
0.8552033, -1.440272, 2.939713, 0.7921569, 0, 1, 1,
0.8637531, -0.2801588, 2.642006, 0.8, 0, 1, 1,
0.8656133, 0.9654151, -0.01826291, 0.8078431, 0, 1, 1,
0.86577, -0.6077093, 3.52328, 0.8117647, 0, 1, 1,
0.8666186, -1.059103, 3.217607, 0.8196079, 0, 1, 1,
0.8673846, 0.4737504, -0.7367547, 0.8235294, 0, 1, 1,
0.8689954, -0.579429, 2.530405, 0.8313726, 0, 1, 1,
0.9022461, 0.8037636, 0.7682756, 0.8352941, 0, 1, 1,
0.9049022, 0.3302138, 2.742474, 0.8431373, 0, 1, 1,
0.9130588, -0.9324762, 2.456244, 0.8470588, 0, 1, 1,
0.9160736, -0.1516666, 1.046841, 0.854902, 0, 1, 1,
0.9199663, 2.566954, -0.6818837, 0.8588235, 0, 1, 1,
0.9201624, -0.9217922, 1.456432, 0.8666667, 0, 1, 1,
0.9208322, -0.01760379, 1.560736, 0.8705882, 0, 1, 1,
0.9229036, 0.4602188, 1.87621, 0.8784314, 0, 1, 1,
0.9239361, 0.8370868, 0.4314079, 0.8823529, 0, 1, 1,
0.9243276, 0.2332596, 0.7550715, 0.8901961, 0, 1, 1,
0.9266255, 0.2884198, 0.6620899, 0.8941177, 0, 1, 1,
0.9295565, -1.969943, 1.932299, 0.9019608, 0, 1, 1,
0.9371998, 0.1560992, 2.720269, 0.9098039, 0, 1, 1,
0.9377995, -1.122984, 2.128692, 0.9137255, 0, 1, 1,
0.9429594, 1.56474, 2.241454, 0.9215686, 0, 1, 1,
0.9429851, 1.181096, 0.2425487, 0.9254902, 0, 1, 1,
0.9472177, -0.3536801, 1.347005, 0.9333333, 0, 1, 1,
0.9483282, -0.6587835, 2.228997, 0.9372549, 0, 1, 1,
0.9492257, 0.3286183, 0.7241099, 0.945098, 0, 1, 1,
0.949687, 2.260247, -0.2292425, 0.9490196, 0, 1, 1,
0.951026, -0.8085448, 0.4833764, 0.9568627, 0, 1, 1,
0.9533886, 0.6459313, 0.5134515, 0.9607843, 0, 1, 1,
0.9574859, 0.170088, 1.216208, 0.9686275, 0, 1, 1,
0.9585624, -0.9997224, 3.161577, 0.972549, 0, 1, 1,
0.9644009, 0.1032106, 0.9730477, 0.9803922, 0, 1, 1,
0.9656483, -2.509936, 3.585814, 0.9843137, 0, 1, 1,
0.9720533, -1.104742, 3.925209, 0.9921569, 0, 1, 1,
0.9767627, 0.1237044, 0.2555765, 0.9960784, 0, 1, 1,
0.9775025, -0.6570125, 2.881843, 1, 0, 0.9960784, 1,
0.9821648, 0.849566, -0.8045036, 1, 0, 0.9882353, 1,
0.9835404, -0.6815151, 2.453006, 1, 0, 0.9843137, 1,
0.9843078, -1.441069, 1.959356, 1, 0, 0.9764706, 1,
0.9977736, 0.08982048, -0.3853305, 1, 0, 0.972549, 1,
0.9987296, -0.2450102, 0.6951153, 1, 0, 0.9647059, 1,
1.014821, 2.108681, 1.214583, 1, 0, 0.9607843, 1,
1.017175, -0.922668, 1.952303, 1, 0, 0.9529412, 1,
1.021115, -0.8955812, 2.172777, 1, 0, 0.9490196, 1,
1.021515, -1.067577, 3.300453, 1, 0, 0.9411765, 1,
1.025076, -0.5851244, 2.474761, 1, 0, 0.9372549, 1,
1.033641, 0.1466319, 0.7214975, 1, 0, 0.9294118, 1,
1.038159, 0.1030202, 2.303079, 1, 0, 0.9254902, 1,
1.046079, -0.804408, 1.212569, 1, 0, 0.9176471, 1,
1.048082, 0.1396638, 1.838532, 1, 0, 0.9137255, 1,
1.054446, 0.7503395, 1.697704, 1, 0, 0.9058824, 1,
1.056512, 1.434404, -1.223577, 1, 0, 0.9019608, 1,
1.063134, 0.4532788, 1.071956, 1, 0, 0.8941177, 1,
1.070904, 1.188502, 1.112967, 1, 0, 0.8862745, 1,
1.071732, -1.507723, 4.316068, 1, 0, 0.8823529, 1,
1.074189, 0.7830282, 0.8328524, 1, 0, 0.8745098, 1,
1.074191, 0.6499692, 0.790355, 1, 0, 0.8705882, 1,
1.074357, 1.427605, 1.264474, 1, 0, 0.8627451, 1,
1.076438, -1.334777, 1.548548, 1, 0, 0.8588235, 1,
1.080481, -0.2896318, 1.713142, 1, 0, 0.8509804, 1,
1.083574, 1.214102, 0.8302255, 1, 0, 0.8470588, 1,
1.089065, -0.393225, 1.889983, 1, 0, 0.8392157, 1,
1.096224, 0.8045532, 0.7508175, 1, 0, 0.8352941, 1,
1.098844, -0.3188427, 1.357831, 1, 0, 0.827451, 1,
1.103055, -0.2762132, 2.678084, 1, 0, 0.8235294, 1,
1.111565, 0.4834203, 1.417296, 1, 0, 0.8156863, 1,
1.122513, -0.02883737, 2.114787, 1, 0, 0.8117647, 1,
1.126738, -0.762028, 0.9544987, 1, 0, 0.8039216, 1,
1.129726, 0.265735, -0.7828224, 1, 0, 0.7960784, 1,
1.131395, 0.8731316, 2.18217, 1, 0, 0.7921569, 1,
1.136418, -0.2096978, 1.078284, 1, 0, 0.7843137, 1,
1.144417, 0.5631732, -1.4764, 1, 0, 0.7803922, 1,
1.162912, 1.754334, 1.388984, 1, 0, 0.772549, 1,
1.170382, 1.153094, 1.660518, 1, 0, 0.7686275, 1,
1.183092, -0.1516714, 1.692875, 1, 0, 0.7607843, 1,
1.186281, 0.1096606, 2.535223, 1, 0, 0.7568628, 1,
1.189768, 0.7268074, 0.6638958, 1, 0, 0.7490196, 1,
1.189843, -0.8818945, 2.773304, 1, 0, 0.7450981, 1,
1.191998, 1.005422, 1.563685, 1, 0, 0.7372549, 1,
1.192073, -2.121261, 3.223984, 1, 0, 0.7333333, 1,
1.19385, 0.2053971, 2.77702, 1, 0, 0.7254902, 1,
1.197653, 0.02518477, 0.8074924, 1, 0, 0.7215686, 1,
1.199719, 2.453604, -0.3154709, 1, 0, 0.7137255, 1,
1.212863, -0.82756, 2.040694, 1, 0, 0.7098039, 1,
1.214395, -0.4073232, 2.143308, 1, 0, 0.7019608, 1,
1.222242, 1.494213, 0.7253172, 1, 0, 0.6941177, 1,
1.227321, 0.3982855, -0.6357624, 1, 0, 0.6901961, 1,
1.227698, -0.7435656, 2.350877, 1, 0, 0.682353, 1,
1.245042, 1.051164, 2.046085, 1, 0, 0.6784314, 1,
1.24924, -1.187675, 2.445038, 1, 0, 0.6705883, 1,
1.251125, 0.1825692, 0.992003, 1, 0, 0.6666667, 1,
1.251919, -0.4103056, 3.336163, 1, 0, 0.6588235, 1,
1.254226, 0.8538551, 1.139921, 1, 0, 0.654902, 1,
1.254236, -0.6986915, 1.314495, 1, 0, 0.6470588, 1,
1.254371, 0.8931429, 2.534568, 1, 0, 0.6431373, 1,
1.266239, 0.9952267, 1.218786, 1, 0, 0.6352941, 1,
1.269296, -0.2800145, 2.130213, 1, 0, 0.6313726, 1,
1.270113, -1.2168, 2.944072, 1, 0, 0.6235294, 1,
1.275327, 0.6804431, 2.210363, 1, 0, 0.6196079, 1,
1.291259, 0.8319496, 2.4884, 1, 0, 0.6117647, 1,
1.298267, -0.01460247, 2.616603, 1, 0, 0.6078432, 1,
1.299622, 1.630022, 1.017816, 1, 0, 0.6, 1,
1.312993, -1.565636, 2.537352, 1, 0, 0.5921569, 1,
1.321174, 0.4530391, 1.185918, 1, 0, 0.5882353, 1,
1.338054, 1.244923, 0.8131912, 1, 0, 0.5803922, 1,
1.361015, -0.3661847, 2.2773, 1, 0, 0.5764706, 1,
1.364417, 1.911282, 0.6334016, 1, 0, 0.5686275, 1,
1.364529, 1.128193, 0.4276116, 1, 0, 0.5647059, 1,
1.365053, -1.949834, 2.415063, 1, 0, 0.5568628, 1,
1.37294, -0.4999663, 1.200466, 1, 0, 0.5529412, 1,
1.381992, 0.001303248, 1.763379, 1, 0, 0.5450981, 1,
1.398443, 1.001143, 1.917821, 1, 0, 0.5411765, 1,
1.410631, 0.1813351, 1.266927, 1, 0, 0.5333334, 1,
1.413715, -1.933164, 1.288066, 1, 0, 0.5294118, 1,
1.415285, 0.9034903, 2.076722, 1, 0, 0.5215687, 1,
1.42432, -0.7648118, 1.619579, 1, 0, 0.5176471, 1,
1.445787, -1.101333, 4.990118, 1, 0, 0.509804, 1,
1.449792, 0.03845019, -0.4447959, 1, 0, 0.5058824, 1,
1.45105, -2.622332, 4.444444, 1, 0, 0.4980392, 1,
1.457082, -1.356729, 1.938846, 1, 0, 0.4901961, 1,
1.46893, 0.4351102, 0.6239279, 1, 0, 0.4862745, 1,
1.510624, -0.882112, 0.9467172, 1, 0, 0.4784314, 1,
1.522152, -2.444148, 3.45821, 1, 0, 0.4745098, 1,
1.523286, 0.7939716, 1.112221, 1, 0, 0.4666667, 1,
1.524655, 2.28193, 1.335366, 1, 0, 0.4627451, 1,
1.533662, 0.3965892, 2.171306, 1, 0, 0.454902, 1,
1.537553, 0.8639528, -0.525767, 1, 0, 0.4509804, 1,
1.538097, 0.4370085, 0.9539421, 1, 0, 0.4431373, 1,
1.540867, 0.05884686, 1.408846, 1, 0, 0.4392157, 1,
1.541472, -1.159044, 1.567853, 1, 0, 0.4313726, 1,
1.542057, 0.6179199, 0.1336951, 1, 0, 0.427451, 1,
1.546429, 0.2132244, -0.3018739, 1, 0, 0.4196078, 1,
1.556391, -1.825433, 3.745815, 1, 0, 0.4156863, 1,
1.55973, -1.571078, 2.940643, 1, 0, 0.4078431, 1,
1.566832, -0.6105533, 3.296114, 1, 0, 0.4039216, 1,
1.583004, -1.076874, 0.4704377, 1, 0, 0.3960784, 1,
1.584378, 1.195759, 1.020364, 1, 0, 0.3882353, 1,
1.590424, 0.8265163, 0.3064071, 1, 0, 0.3843137, 1,
1.605645, 1.809697, 0.7954779, 1, 0, 0.3764706, 1,
1.607888, 0.07004284, 0.9870411, 1, 0, 0.372549, 1,
1.607996, 1.140192, 1.851012, 1, 0, 0.3647059, 1,
1.637834, 0.1800099, 2.21671, 1, 0, 0.3607843, 1,
1.67197, 0.4498473, 2.576266, 1, 0, 0.3529412, 1,
1.673163, -1.411956, 1.619596, 1, 0, 0.3490196, 1,
1.677065, 0.5967575, 0.7713534, 1, 0, 0.3411765, 1,
1.67765, -0.1902104, 3.722641, 1, 0, 0.3372549, 1,
1.700379, 0.6187682, 0.8462294, 1, 0, 0.3294118, 1,
1.704757, -0.9293083, 1.971515, 1, 0, 0.3254902, 1,
1.722514, 0.2838892, 1.829115, 1, 0, 0.3176471, 1,
1.736343, -0.5853024, 1.965647, 1, 0, 0.3137255, 1,
1.740091, -0.351065, 3.222264, 1, 0, 0.3058824, 1,
1.740261, 2.699981, 0.9999083, 1, 0, 0.2980392, 1,
1.741733, 1.155488, 1.47659, 1, 0, 0.2941177, 1,
1.781124, -0.7433632, 2.68394, 1, 0, 0.2862745, 1,
1.789788, -1.535234, 2.775238, 1, 0, 0.282353, 1,
1.802912, 0.895286, 1.030797, 1, 0, 0.2745098, 1,
1.805253, -0.3922876, 0.4801242, 1, 0, 0.2705882, 1,
1.863359, -0.5837287, 1.296867, 1, 0, 0.2627451, 1,
1.86746, -1.419693, 1.822627, 1, 0, 0.2588235, 1,
1.880951, -0.1032567, 1.590411, 1, 0, 0.2509804, 1,
1.886872, 0.1913624, 2.521533, 1, 0, 0.2470588, 1,
1.889206, 1.552472, 1.871766, 1, 0, 0.2392157, 1,
1.904863, 0.6744445, -0.7748559, 1, 0, 0.2352941, 1,
1.905251, 0.3413178, -0.4525057, 1, 0, 0.227451, 1,
1.908656, -0.5918506, 0.9683135, 1, 0, 0.2235294, 1,
1.926441, 1.426358, 1.541952, 1, 0, 0.2156863, 1,
1.92837, 0.03205525, 0.698968, 1, 0, 0.2117647, 1,
1.93106, 0.1874415, 2.112182, 1, 0, 0.2039216, 1,
1.932159, 0.6125852, 0.9970232, 1, 0, 0.1960784, 1,
1.937687, -1.218167, 2.78447, 1, 0, 0.1921569, 1,
1.94357, -0.1700834, 1.313922, 1, 0, 0.1843137, 1,
1.944295, -0.866199, 3.21742, 1, 0, 0.1803922, 1,
1.945531, -0.373974, 1.518534, 1, 0, 0.172549, 1,
1.962553, -0.284552, 1.50204, 1, 0, 0.1686275, 1,
1.974939, -0.9889196, 0.09149822, 1, 0, 0.1607843, 1,
1.980232, 1.097179, 0.7933964, 1, 0, 0.1568628, 1,
1.98165, -0.8879328, 2.604815, 1, 0, 0.1490196, 1,
2.030984, 1.162957, 2.887131, 1, 0, 0.145098, 1,
2.039869, 1.702526, 0.7230821, 1, 0, 0.1372549, 1,
2.063466, 0.8838646, 0.8937015, 1, 0, 0.1333333, 1,
2.064536, 0.1759422, 3.009537, 1, 0, 0.1254902, 1,
2.073074, 1.591773, 0.8965933, 1, 0, 0.1215686, 1,
2.079705, 0.5617483, 0.9631726, 1, 0, 0.1137255, 1,
2.109648, -1.008327, 2.908761, 1, 0, 0.1098039, 1,
2.134816, -0.2014026, 1.299765, 1, 0, 0.1019608, 1,
2.135169, 1.42161, 2.035464, 1, 0, 0.09411765, 1,
2.14385, -1.417283, 1.258031, 1, 0, 0.09019608, 1,
2.152177, -0.3176091, 3.540283, 1, 0, 0.08235294, 1,
2.177877, 0.3490966, 1.662147, 1, 0, 0.07843138, 1,
2.22904, 0.3340422, 0.2020532, 1, 0, 0.07058824, 1,
2.229153, 0.2969095, 0.6720342, 1, 0, 0.06666667, 1,
2.324147, -0.1406084, -0.3162422, 1, 0, 0.05882353, 1,
2.343075, 0.9910067, 1.917858, 1, 0, 0.05490196, 1,
2.354701, 0.3961483, 0.5612584, 1, 0, 0.04705882, 1,
2.477923, 1.063806, 1.647275, 1, 0, 0.04313726, 1,
2.567808, -1.182099, 1.335852, 1, 0, 0.03529412, 1,
2.5784, -1.123694, 2.329607, 1, 0, 0.03137255, 1,
2.597543, 0.8482795, 0.9481793, 1, 0, 0.02352941, 1,
2.645017, 0.4913064, 1.378441, 1, 0, 0.01960784, 1,
2.751984, 0.2950633, 2.173472, 1, 0, 0.01176471, 1,
3.052434, -0.2764689, 1.36327, 1, 0, 0.007843138, 1
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
0.05609775, -4.251244, -7.900276, 0, -0.5, 0.5, 0.5,
0.05609775, -4.251244, -7.900276, 1, -0.5, 0.5, 0.5,
0.05609775, -4.251244, -7.900276, 1, 1.5, 0.5, 0.5,
0.05609775, -4.251244, -7.900276, 0, 1.5, 0.5, 0.5
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
-3.955997, 0.1202985, -7.900276, 0, -0.5, 0.5, 0.5,
-3.955997, 0.1202985, -7.900276, 1, -0.5, 0.5, 0.5,
-3.955997, 0.1202985, -7.900276, 1, 1.5, 0.5, 0.5,
-3.955997, 0.1202985, -7.900276, 0, 1.5, 0.5, 0.5
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
-3.955997, -4.251244, -0.1502707, 0, -0.5, 0.5, 0.5,
-3.955997, -4.251244, -0.1502707, 1, -0.5, 0.5, 0.5,
-3.955997, -4.251244, -0.1502707, 1, 1.5, 0.5, 0.5,
-3.955997, -4.251244, -0.1502707, 0, 1.5, 0.5, 0.5
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
-2, -3.242427, -6.111814,
3, -3.242427, -6.111814,
-2, -3.242427, -6.111814,
-2, -3.410563, -6.409891,
-1, -3.242427, -6.111814,
-1, -3.410563, -6.409891,
0, -3.242427, -6.111814,
0, -3.410563, -6.409891,
1, -3.242427, -6.111814,
1, -3.410563, -6.409891,
2, -3.242427, -6.111814,
2, -3.410563, -6.409891,
3, -3.242427, -6.111814,
3, -3.410563, -6.409891
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
-2, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
-2, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
-2, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
-2, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5,
-1, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
-1, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
-1, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
-1, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5,
0, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
0, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
0, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
0, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5,
1, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
1, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
1, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
1, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5,
2, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
2, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
2, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
2, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5,
3, -3.746835, -7.006045, 0, -0.5, 0.5, 0.5,
3, -3.746835, -7.006045, 1, -0.5, 0.5, 0.5,
3, -3.746835, -7.006045, 1, 1.5, 0.5, 0.5,
3, -3.746835, -7.006045, 0, 1.5, 0.5, 0.5
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
-3.030128, -3, -6.111814,
-3.030128, 3, -6.111814,
-3.030128, -3, -6.111814,
-3.18444, -3, -6.409891,
-3.030128, -2, -6.111814,
-3.18444, -2, -6.409891,
-3.030128, -1, -6.111814,
-3.18444, -1, -6.409891,
-3.030128, 0, -6.111814,
-3.18444, 0, -6.409891,
-3.030128, 1, -6.111814,
-3.18444, 1, -6.409891,
-3.030128, 2, -6.111814,
-3.18444, 2, -6.409891,
-3.030128, 3, -6.111814,
-3.18444, 3, -6.409891
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
-3.493062, -3, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, -3, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, -3, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, -3, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, -2, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, -2, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, -2, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, -2, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, -1, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, -1, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, -1, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, -1, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, 0, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, 0, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, 0, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, 0, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, 1, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, 1, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, 1, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, 1, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, 2, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, 2, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, 2, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, 2, -7.006045, 0, 1.5, 0.5, 0.5,
-3.493062, 3, -7.006045, 0, -0.5, 0.5, 0.5,
-3.493062, 3, -7.006045, 1, -0.5, 0.5, 0.5,
-3.493062, 3, -7.006045, 1, 1.5, 0.5, 0.5,
-3.493062, 3, -7.006045, 0, 1.5, 0.5, 0.5
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
-3.030128, -3.242427, -4,
-3.030128, -3.242427, 4,
-3.030128, -3.242427, -4,
-3.18444, -3.410563, -4,
-3.030128, -3.242427, -2,
-3.18444, -3.410563, -2,
-3.030128, -3.242427, 0,
-3.18444, -3.410563, 0,
-3.030128, -3.242427, 2,
-3.18444, -3.410563, 2,
-3.030128, -3.242427, 4,
-3.18444, -3.410563, 4
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
-3.493062, -3.746835, -4, 0, -0.5, 0.5, 0.5,
-3.493062, -3.746835, -4, 1, -0.5, 0.5, 0.5,
-3.493062, -3.746835, -4, 1, 1.5, 0.5, 0.5,
-3.493062, -3.746835, -4, 0, 1.5, 0.5, 0.5,
-3.493062, -3.746835, -2, 0, -0.5, 0.5, 0.5,
-3.493062, -3.746835, -2, 1, -0.5, 0.5, 0.5,
-3.493062, -3.746835, -2, 1, 1.5, 0.5, 0.5,
-3.493062, -3.746835, -2, 0, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 0, 0, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 0, 1, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 0, 1, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 0, 0, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 2, 0, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 2, 1, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 2, 1, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 2, 0, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 4, 0, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 4, 1, -0.5, 0.5, 0.5,
-3.493062, -3.746835, 4, 1, 1.5, 0.5, 0.5,
-3.493062, -3.746835, 4, 0, 1.5, 0.5, 0.5
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
-3.030128, -3.242427, -6.111814,
-3.030128, 3.483024, -6.111814,
-3.030128, -3.242427, 5.811272,
-3.030128, 3.483024, 5.811272,
-3.030128, -3.242427, -6.111814,
-3.030128, -3.242427, 5.811272,
-3.030128, 3.483024, -6.111814,
-3.030128, 3.483024, 5.811272,
-3.030128, -3.242427, -6.111814,
3.142324, -3.242427, -6.111814,
-3.030128, -3.242427, 5.811272,
3.142324, -3.242427, 5.811272,
-3.030128, 3.483024, -6.111814,
3.142324, 3.483024, -6.111814,
-3.030128, 3.483024, 5.811272,
3.142324, 3.483024, 5.811272,
3.142324, -3.242427, -6.111814,
3.142324, 3.483024, -6.111814,
3.142324, -3.242427, 5.811272,
3.142324, 3.483024, 5.811272,
3.142324, -3.242427, -6.111814,
3.142324, -3.242427, 5.811272,
3.142324, 3.483024, -6.111814,
3.142324, 3.483024, 5.811272
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
var radius = 8.01844;
var distance = 35.67495;
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
mvMatrix.translate( -0.05609775, -0.1202985, 0.1502707 );
mvMatrix.scale( 1.404579, 1.289088, 0.7271352 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67495);
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
Pyraclostrobin<-read.table("Pyraclostrobin.xyz")
```

```
## Error in read.table("Pyraclostrobin.xyz"): no lines available in input
```

```r
x<-Pyraclostrobin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
y<-Pyraclostrobin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
z<-Pyraclostrobin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
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
-2.940238, -0.2077142, -2.345079, 0, 0, 1, 1, 1,
-2.791744, -0.6802437, -2.050599, 1, 0, 0, 1, 1,
-2.630989, -0.0336353, -1.703502, 1, 0, 0, 1, 1,
-2.577053, 1.580608, -0.5947424, 1, 0, 0, 1, 1,
-2.514006, -0.299604, -0.02479086, 1, 0, 0, 1, 1,
-2.441636, -0.8914356, -2.110263, 1, 0, 0, 1, 1,
-2.41313, 0.5401524, -1.512273, 0, 0, 0, 1, 1,
-2.335037, -0.6557473, -2.127926, 0, 0, 0, 1, 1,
-2.297973, 0.2033598, -1.067655, 0, 0, 0, 1, 1,
-2.291551, -1.358676, -1.751209, 0, 0, 0, 1, 1,
-2.280434, 0.1187849, -1.449332, 0, 0, 0, 1, 1,
-2.262522, -0.4426969, -2.479589, 0, 0, 0, 1, 1,
-2.239068, -0.09108084, -1.435212, 0, 0, 0, 1, 1,
-2.21828, -0.1439857, -1.75662, 1, 1, 1, 1, 1,
-2.203806, -1.905079, -3.069225, 1, 1, 1, 1, 1,
-2.201121, -0.6096959, -1.472338, 1, 1, 1, 1, 1,
-2.181746, 0.5316399, -2.658271, 1, 1, 1, 1, 1,
-2.159087, 0.01072397, -1.526053, 1, 1, 1, 1, 1,
-2.088372, 0.0163195, -2.915738, 1, 1, 1, 1, 1,
-2.061647, -0.9215903, -1.366961, 1, 1, 1, 1, 1,
-2.059494, 0.4411145, -1.647243, 1, 1, 1, 1, 1,
-2.053954, 1.987175, -0.9585567, 1, 1, 1, 1, 1,
-2.024403, 0.4237221, -0.8231011, 1, 1, 1, 1, 1,
-2.015814, -0.6315764, -2.397077, 1, 1, 1, 1, 1,
-2.013728, 0.4531683, -2.306415, 1, 1, 1, 1, 1,
-1.923375, 0.9779313, 0.5009395, 1, 1, 1, 1, 1,
-1.876784, -0.3707123, -2.103146, 1, 1, 1, 1, 1,
-1.84966, 0.8784757, -0.5681511, 1, 1, 1, 1, 1,
-1.840962, 0.3314227, -0.9999678, 0, 0, 1, 1, 1,
-1.825664, 0.5665019, -0.3661085, 1, 0, 0, 1, 1,
-1.816744, -2.151259, -3.894941, 1, 0, 0, 1, 1,
-1.811957, 2.367153, -1.485465, 1, 0, 0, 1, 1,
-1.780881, 0.5374921, -1.89401, 1, 0, 0, 1, 1,
-1.779263, -1.249199, -2.946579, 1, 0, 0, 1, 1,
-1.760899, 1.408194, -1.23554, 0, 0, 0, 1, 1,
-1.725614, 0.1561815, -2.676252, 0, 0, 0, 1, 1,
-1.703569, -0.481544, -2.021701, 0, 0, 0, 1, 1,
-1.6981, -1.008019, -2.36848, 0, 0, 0, 1, 1,
-1.68906, 0.3406087, -3.226182, 0, 0, 0, 1, 1,
-1.686011, 0.4587977, -2.28311, 0, 0, 0, 1, 1,
-1.684829, 0.3021706, -1.367885, 0, 0, 0, 1, 1,
-1.682956, 0.3173197, -1.277864, 1, 1, 1, 1, 1,
-1.654249, 0.02947254, -2.214593, 1, 1, 1, 1, 1,
-1.648622, 1.782775, -1.892554, 1, 1, 1, 1, 1,
-1.645072, 0.7847321, 0.01004997, 1, 1, 1, 1, 1,
-1.644812, 0.9167351, -1.43478, 1, 1, 1, 1, 1,
-1.640979, 0.2424225, -2.839737, 1, 1, 1, 1, 1,
-1.633893, 0.1821331, -4.041087, 1, 1, 1, 1, 1,
-1.613127, 0.6264045, 0.1013442, 1, 1, 1, 1, 1,
-1.608381, 0.6622698, -1.880833, 1, 1, 1, 1, 1,
-1.607158, 0.8577657, -1.354736, 1, 1, 1, 1, 1,
-1.599143, 1.653076, 0.6689721, 1, 1, 1, 1, 1,
-1.594323, -0.1645024, -0.2486581, 1, 1, 1, 1, 1,
-1.589095, -0.06853104, -2.514279, 1, 1, 1, 1, 1,
-1.588183, -1.74479, -1.607168, 1, 1, 1, 1, 1,
-1.582864, 1.38084, -2.060125, 1, 1, 1, 1, 1,
-1.580509, -0.6508914, -0.6206076, 0, 0, 1, 1, 1,
-1.575958, 0.5314331, -1.015681, 1, 0, 0, 1, 1,
-1.575076, 0.5321658, -3.228401, 1, 0, 0, 1, 1,
-1.573302, -2.222885, -3.18534, 1, 0, 0, 1, 1,
-1.572666, 0.447926, -2.306123, 1, 0, 0, 1, 1,
-1.567412, -0.2436127, -2.008532, 1, 0, 0, 1, 1,
-1.565978, 0.3471902, -1.772759, 0, 0, 0, 1, 1,
-1.565579, 0.9548688, -1.754589, 0, 0, 0, 1, 1,
-1.559459, 0.260012, -1.209332, 0, 0, 0, 1, 1,
-1.550479, -0.7082392, -1.885948, 0, 0, 0, 1, 1,
-1.542303, -0.2605699, -1.776726, 0, 0, 0, 1, 1,
-1.538129, 0.6773, -3.009758, 0, 0, 0, 1, 1,
-1.529887, -0.1733405, -2.472139, 0, 0, 0, 1, 1,
-1.526593, 0.2909015, -0.3316258, 1, 1, 1, 1, 1,
-1.507204, 0.7484317, -1.605157, 1, 1, 1, 1, 1,
-1.506937, -0.8343249, -1.343798, 1, 1, 1, 1, 1,
-1.493249, 0.1758233, -0.7055373, 1, 1, 1, 1, 1,
-1.484195, 0.4090129, -1.270754, 1, 1, 1, 1, 1,
-1.474429, -0.06461918, -0.3261767, 1, 1, 1, 1, 1,
-1.456688, -0.09062497, -2.704999, 1, 1, 1, 1, 1,
-1.455684, -1.148017, -1.162361, 1, 1, 1, 1, 1,
-1.443086, 1.254455, 0.1207831, 1, 1, 1, 1, 1,
-1.442153, -0.4848609, -3.477179, 1, 1, 1, 1, 1,
-1.433521, -0.7585186, -1.734817, 1, 1, 1, 1, 1,
-1.42438, -0.6289543, -2.430258, 1, 1, 1, 1, 1,
-1.419686, 0.3031445, -1.350444, 1, 1, 1, 1, 1,
-1.419455, 0.6623814, -0.9950532, 1, 1, 1, 1, 1,
-1.418444, -0.7078504, 0.02036457, 1, 1, 1, 1, 1,
-1.41637, -0.2327823, -0.5803496, 0, 0, 1, 1, 1,
-1.414144, -1.041739, -1.426109, 1, 0, 0, 1, 1,
-1.413449, 0.08800959, -3.842746, 1, 0, 0, 1, 1,
-1.409791, -0.3315592, -3.033447, 1, 0, 0, 1, 1,
-1.404812, -0.1753285, -1.517018, 1, 0, 0, 1, 1,
-1.396479, 0.2337747, -0.6614708, 1, 0, 0, 1, 1,
-1.385198, -0.05562741, -2.280145, 0, 0, 0, 1, 1,
-1.379791, -0.3708939, -1.053612, 0, 0, 0, 1, 1,
-1.377926, -1.093307, -2.191621, 0, 0, 0, 1, 1,
-1.360916, 0.3061306, -2.309137, 0, 0, 0, 1, 1,
-1.35439, 0.4531465, -1.841925, 0, 0, 0, 1, 1,
-1.3524, 0.08298723, -1.886818, 0, 0, 0, 1, 1,
-1.306516, -0.3083768, -1.701182, 0, 0, 0, 1, 1,
-1.305929, -0.3396619, -0.1295617, 1, 1, 1, 1, 1,
-1.301354, 1.627487, -0.06549949, 1, 1, 1, 1, 1,
-1.299187, 0.9812337, -2.065767, 1, 1, 1, 1, 1,
-1.298537, -0.6588639, -2.838786, 1, 1, 1, 1, 1,
-1.296981, -0.2814978, -1.828268, 1, 1, 1, 1, 1,
-1.293377, 0.4742937, -1.65247, 1, 1, 1, 1, 1,
-1.287614, -1.395169, -2.463029, 1, 1, 1, 1, 1,
-1.279578, -1.557925, -4.137846, 1, 1, 1, 1, 1,
-1.276729, -0.2516929, -2.714811, 1, 1, 1, 1, 1,
-1.27414, 0.3633658, -2.208514, 1, 1, 1, 1, 1,
-1.265543, -0.1250889, -1.722153, 1, 1, 1, 1, 1,
-1.263121, -0.09859972, -1.726517, 1, 1, 1, 1, 1,
-1.253615, -0.4851937, -2.904034, 1, 1, 1, 1, 1,
-1.246352, -1.789269, -3.373789, 1, 1, 1, 1, 1,
-1.244035, 0.596586, -3.110205, 1, 1, 1, 1, 1,
-1.2399, -0.1588526, -2.377429, 0, 0, 1, 1, 1,
-1.225599, -0.7286373, -3.427936, 1, 0, 0, 1, 1,
-1.224584, -0.7917171, -2.757908, 1, 0, 0, 1, 1,
-1.212606, 1.131754, -0.04765856, 1, 0, 0, 1, 1,
-1.209274, 0.8135334, -3.121436, 1, 0, 0, 1, 1,
-1.203321, -0.4549503, -2.956015, 1, 0, 0, 1, 1,
-1.203259, 0.4876837, -2.340317, 0, 0, 0, 1, 1,
-1.20227, 0.6292608, -0.9747542, 0, 0, 0, 1, 1,
-1.201199, -0.3074276, -3.520017, 0, 0, 0, 1, 1,
-1.197544, 0.2040316, -1.662416, 0, 0, 0, 1, 1,
-1.192573, 0.1434098, -1.868919, 0, 0, 0, 1, 1,
-1.180233, 0.6074849, -1.578803, 0, 0, 0, 1, 1,
-1.160792, 1.448554, -0.05634471, 0, 0, 0, 1, 1,
-1.152955, 0.7333754, -0.1178801, 1, 1, 1, 1, 1,
-1.148243, -0.4306056, -2.019283, 1, 1, 1, 1, 1,
-1.143521, 0.2054357, -2.537405, 1, 1, 1, 1, 1,
-1.13614, 0.7804607, -1.409965, 1, 1, 1, 1, 1,
-1.133769, -1.411522, -2.299447, 1, 1, 1, 1, 1,
-1.126853, -1.024904, -3.049752, 1, 1, 1, 1, 1,
-1.124467, -0.5674822, -1.73541, 1, 1, 1, 1, 1,
-1.123321, 0.02149768, -1.07238, 1, 1, 1, 1, 1,
-1.123318, 0.2641866, -1.111094, 1, 1, 1, 1, 1,
-1.122882, 0.7057358, -1.097097, 1, 1, 1, 1, 1,
-1.121928, -0.3466292, -1.820514, 1, 1, 1, 1, 1,
-1.114075, -1.871221, -4.185349, 1, 1, 1, 1, 1,
-1.113683, -1.161834, -1.519882, 1, 1, 1, 1, 1,
-1.113076, 1.184867, 1.117189, 1, 1, 1, 1, 1,
-1.111828, -1.317905, -1.855782, 1, 1, 1, 1, 1,
-1.109437, 0.2981337, -1.325382, 0, 0, 1, 1, 1,
-1.099706, 0.574143, -1.794548, 1, 0, 0, 1, 1,
-1.099224, 0.264219, -1.651125, 1, 0, 0, 1, 1,
-1.097096, -1.271987, -3.379569, 1, 0, 0, 1, 1,
-1.090977, -0.8202347, -2.367937, 1, 0, 0, 1, 1,
-1.086462, 0.8361694, -1.112551, 1, 0, 0, 1, 1,
-1.075901, 0.2494696, -1.576518, 0, 0, 0, 1, 1,
-1.07549, -2.109847, -2.298711, 0, 0, 0, 1, 1,
-1.066813, 1.687753, -0.5999938, 0, 0, 0, 1, 1,
-1.066156, -0.3328414, -1.538554, 0, 0, 0, 1, 1,
-1.065907, -0.7438105, -1.629666, 0, 0, 0, 1, 1,
-1.063917, -0.7676574, -3.375599, 0, 0, 0, 1, 1,
-1.058938, -0.2994568, -1.281235, 0, 0, 0, 1, 1,
-1.05668, -0.3767042, -1.723488, 1, 1, 1, 1, 1,
-1.053731, -3.144483, -3.335522, 1, 1, 1, 1, 1,
-1.048914, 0.6997573, -0.9501991, 1, 1, 1, 1, 1,
-1.043157, 0.01839215, -2.496777, 1, 1, 1, 1, 1,
-1.040691, 0.6567719, -1.054419, 1, 1, 1, 1, 1,
-1.038656, 1.235635, -0.2557858, 1, 1, 1, 1, 1,
-1.026917, 0.1247652, -2.277711, 1, 1, 1, 1, 1,
-1.026643, -0.2568108, -1.243877, 1, 1, 1, 1, 1,
-1.019276, -0.5368235, -2.45535, 1, 1, 1, 1, 1,
-1.00921, -2.200696, -4.369122, 1, 1, 1, 1, 1,
-1.008806, 0.1153265, -1.352697, 1, 1, 1, 1, 1,
-1.005286, -0.8117858, -1.432768, 1, 1, 1, 1, 1,
-1.004824, 0.4152055, -1.790035, 1, 1, 1, 1, 1,
-1.004092, -0.1699516, -2.715239, 1, 1, 1, 1, 1,
-1.002185, 0.9862686, -0.3876432, 1, 1, 1, 1, 1,
-1.002147, 0.3118303, -1.335244, 0, 0, 1, 1, 1,
-1.000118, -0.2360054, -2.492039, 1, 0, 0, 1, 1,
-0.9994025, -0.4094633, -2.983093, 1, 0, 0, 1, 1,
-0.9984396, 1.207513, -0.4661329, 1, 0, 0, 1, 1,
-0.9977351, -0.3100288, -1.964147, 1, 0, 0, 1, 1,
-0.9843754, 0.2160022, -1.831703, 1, 0, 0, 1, 1,
-0.9818888, -0.2084566, -2.658992, 0, 0, 0, 1, 1,
-0.9816127, 0.3958281, -1.513481, 0, 0, 0, 1, 1,
-0.9765068, -0.9078832, -2.29829, 0, 0, 0, 1, 1,
-0.9730482, 0.6483678, -0.9996402, 0, 0, 0, 1, 1,
-0.9718058, -0.009054068, -2.720602, 0, 0, 0, 1, 1,
-0.9716662, -0.04912503, -1.557683, 0, 0, 0, 1, 1,
-0.9711422, -0.3733227, -2.880647, 0, 0, 0, 1, 1,
-0.9576578, 0.2365782, -2.578283, 1, 1, 1, 1, 1,
-0.9565759, 0.5522461, -1.607327, 1, 1, 1, 1, 1,
-0.9559275, 0.5195439, -1.710356, 1, 1, 1, 1, 1,
-0.955475, 0.6421276, 1.635398, 1, 1, 1, 1, 1,
-0.9473024, 1.109292, -0.9504393, 1, 1, 1, 1, 1,
-0.9386027, 1.50294, -1.846012, 1, 1, 1, 1, 1,
-0.9345488, -0.04678354, -1.20411, 1, 1, 1, 1, 1,
-0.9291059, 1.206078, -1.370057, 1, 1, 1, 1, 1,
-0.918767, 1.095425, -0.3347231, 1, 1, 1, 1, 1,
-0.9121569, -1.200993, -1.281874, 1, 1, 1, 1, 1,
-0.9120225, -0.3422398, -0.961252, 1, 1, 1, 1, 1,
-0.9045969, 0.03683425, -1.172721, 1, 1, 1, 1, 1,
-0.9027913, 1.414972, -0.1511484, 1, 1, 1, 1, 1,
-0.8984095, 1.527827, -1.815597, 1, 1, 1, 1, 1,
-0.8966738, 1.007307, -2.226458, 1, 1, 1, 1, 1,
-0.8958474, -0.2948771, -2.065859, 0, 0, 1, 1, 1,
-0.879871, -0.5065616, -2.553162, 1, 0, 0, 1, 1,
-0.8766294, 0.04247418, -1.764246, 1, 0, 0, 1, 1,
-0.8730163, -1.064582, -1.794741, 1, 0, 0, 1, 1,
-0.8721575, 0.2137094, -1.670345, 1, 0, 0, 1, 1,
-0.8699453, -0.2114323, -0.2710911, 1, 0, 0, 1, 1,
-0.8581106, -0.755836, -2.744157, 0, 0, 0, 1, 1,
-0.8579419, 0.2933947, -0.2107424, 0, 0, 0, 1, 1,
-0.8523607, -0.1458863, -2.030908, 0, 0, 0, 1, 1,
-0.8511081, 1.368538, 0.7232964, 0, 0, 0, 1, 1,
-0.8499838, 0.3096587, -1.901501, 0, 0, 0, 1, 1,
-0.8497468, 0.289625, -0.07390889, 0, 0, 0, 1, 1,
-0.8436687, -1.258033, -3.543306, 0, 0, 0, 1, 1,
-0.8418742, -0.01733401, 0.05566341, 1, 1, 1, 1, 1,
-0.8406996, 1.414782, -1.117256, 1, 1, 1, 1, 1,
-0.8337098, -0.1391416, -1.858134, 1, 1, 1, 1, 1,
-0.8287696, 0.926936, -1.124952, 1, 1, 1, 1, 1,
-0.8209155, 1.210233, 0.1565571, 1, 1, 1, 1, 1,
-0.8042825, 1.144138, -3.251474, 1, 1, 1, 1, 1,
-0.8042152, 2.035488, 2.223782, 1, 1, 1, 1, 1,
-0.7917621, -0.12201, -2.971132, 1, 1, 1, 1, 1,
-0.7898582, 1.921544, -2.221515, 1, 1, 1, 1, 1,
-0.788227, -0.7828881, -1.609696, 1, 1, 1, 1, 1,
-0.786076, 0.586081, -1.272641, 1, 1, 1, 1, 1,
-0.7834122, 0.1166162, -1.562419, 1, 1, 1, 1, 1,
-0.783175, -1.498409, -2.112001, 1, 1, 1, 1, 1,
-0.7801217, -0.7760425, -1.603319, 1, 1, 1, 1, 1,
-0.7759259, -1.067264, -3.29057, 1, 1, 1, 1, 1,
-0.7747828, 0.632652, 0.9360276, 0, 0, 1, 1, 1,
-0.7642935, 0.03303701, -2.189419, 1, 0, 0, 1, 1,
-0.7632616, -1.89565, -2.197518, 1, 0, 0, 1, 1,
-0.7617235, 0.778611, -1.167747, 1, 0, 0, 1, 1,
-0.7583022, 0.1486595, -1.09042, 1, 0, 0, 1, 1,
-0.7574033, -0.3174739, -1.014035, 1, 0, 0, 1, 1,
-0.7519692, -0.4905809, -3.115374, 0, 0, 0, 1, 1,
-0.7442141, -0.6679016, -1.496901, 0, 0, 0, 1, 1,
-0.7369037, -0.3031162, -1.615268, 0, 0, 0, 1, 1,
-0.7345122, -0.7987884, -3.704933, 0, 0, 0, 1, 1,
-0.7282485, 0.0900677, 1.337942, 0, 0, 0, 1, 1,
-0.7262194, -1.333977, -2.749584, 0, 0, 0, 1, 1,
-0.7260613, 0.5629976, -0.4113326, 0, 0, 0, 1, 1,
-0.7236906, 0.2669501, 0.518492, 1, 1, 1, 1, 1,
-0.7201896, -0.4801902, -3.274899, 1, 1, 1, 1, 1,
-0.7188865, 0.7972753, -1.147481, 1, 1, 1, 1, 1,
-0.7184568, -0.6670047, -2.539434, 1, 1, 1, 1, 1,
-0.7166679, -0.6793094, -1.007774, 1, 1, 1, 1, 1,
-0.711055, 1.321888, -1.097452, 1, 1, 1, 1, 1,
-0.7071632, 0.4765329, -0.6473429, 1, 1, 1, 1, 1,
-0.7033547, 1.71396, -1.668106, 1, 1, 1, 1, 1,
-0.6955816, 1.06311, -0.5229001, 1, 1, 1, 1, 1,
-0.6900672, 0.1499663, -2.206055, 1, 1, 1, 1, 1,
-0.6878454, -1.324722, -2.328868, 1, 1, 1, 1, 1,
-0.6876159, 0.001297786, -0.7788193, 1, 1, 1, 1, 1,
-0.6809846, -0.29944, -0.7533912, 1, 1, 1, 1, 1,
-0.6770049, 0.7667982, -2.251481, 1, 1, 1, 1, 1,
-0.6714774, -0.5102885, -3.945639, 1, 1, 1, 1, 1,
-0.6708256, 1.736343, 0.06485984, 0, 0, 1, 1, 1,
-0.6665136, -0.1136123, -2.857637, 1, 0, 0, 1, 1,
-0.6638749, 0.0001007611, -1.091191, 1, 0, 0, 1, 1,
-0.6636798, -0.275059, -3.579488, 1, 0, 0, 1, 1,
-0.6617519, -0.3277553, 0.8718349, 1, 0, 0, 1, 1,
-0.6601696, -0.9508411, -2.2094, 1, 0, 0, 1, 1,
-0.6583249, 1.627449, -1.874289, 0, 0, 0, 1, 1,
-0.6549945, 0.03820349, -2.122276, 0, 0, 0, 1, 1,
-0.6541933, 0.5744728, -2.39731, 0, 0, 0, 1, 1,
-0.6508034, 0.746563, -0.3979975, 0, 0, 0, 1, 1,
-0.6485779, 0.480629, -1.784076, 0, 0, 0, 1, 1,
-0.6460965, 0.06093483, -1.283629, 0, 0, 0, 1, 1,
-0.6419061, -0.9230501, -1.502694, 0, 0, 0, 1, 1,
-0.6413902, -1.929472, -3.565545, 1, 1, 1, 1, 1,
-0.6401114, 1.963593, 0.6061587, 1, 1, 1, 1, 1,
-0.6385604, 0.07892589, -1.939896, 1, 1, 1, 1, 1,
-0.6384045, 0.5049001, -0.1977564, 1, 1, 1, 1, 1,
-0.6365475, 0.7456248, -1.222823, 1, 1, 1, 1, 1,
-0.6349449, -0.8177974, -0.6685467, 1, 1, 1, 1, 1,
-0.6344107, -2.082591, -2.419157, 1, 1, 1, 1, 1,
-0.6342627, 0.3144489, -0.6824576, 1, 1, 1, 1, 1,
-0.6312178, 1.251155, -1.696381, 1, 1, 1, 1, 1,
-0.6297271, 0.8673157, -0.9267999, 1, 1, 1, 1, 1,
-0.6274743, -0.828046, -3.550506, 1, 1, 1, 1, 1,
-0.6265659, -0.8333053, -3.71772, 1, 1, 1, 1, 1,
-0.6220093, -0.3683881, -0.8112338, 1, 1, 1, 1, 1,
-0.6207249, -0.00895311, -1.848231, 1, 1, 1, 1, 1,
-0.6176119, -0.2315961, -2.184144, 1, 1, 1, 1, 1,
-0.613228, -0.1273082, -2.825999, 0, 0, 1, 1, 1,
-0.6099218, 1.614536, -1.150433, 1, 0, 0, 1, 1,
-0.605679, 0.003229527, -3.749369, 1, 0, 0, 1, 1,
-0.60474, -1.005173, -3.672234, 1, 0, 0, 1, 1,
-0.5974675, 1.202568, 0.3080496, 1, 0, 0, 1, 1,
-0.5974494, 1.456129, -1.140151, 1, 0, 0, 1, 1,
-0.596855, -0.3701839, -1.823355, 0, 0, 0, 1, 1,
-0.5941061, 0.07703992, -3.605541, 0, 0, 0, 1, 1,
-0.5938438, 0.7830557, -0.7269732, 0, 0, 0, 1, 1,
-0.5938255, 0.1389841, -2.249543, 0, 0, 0, 1, 1,
-0.5935166, 0.01962706, -0.5816525, 0, 0, 0, 1, 1,
-0.579577, -0.3798296, -2.164188, 0, 0, 0, 1, 1,
-0.5771495, 0.1872803, -2.008914, 0, 0, 0, 1, 1,
-0.5770301, 1.325652, 0.06048949, 1, 1, 1, 1, 1,
-0.5694898, 1.488964, 0.4141422, 1, 1, 1, 1, 1,
-0.5665026, -1.918607, -3.349207, 1, 1, 1, 1, 1,
-0.5618641, -1.278365, -2.536387, 1, 1, 1, 1, 1,
-0.5614406, 1.239823, -0.7757446, 1, 1, 1, 1, 1,
-0.5569279, 0.07606559, -1.783741, 1, 1, 1, 1, 1,
-0.5544388, -1.314235, -2.656732, 1, 1, 1, 1, 1,
-0.5502269, -1.14129, -1.809795, 1, 1, 1, 1, 1,
-0.5494235, 1.195295, -0.6818013, 1, 1, 1, 1, 1,
-0.5481339, 1.327314, 0.08960284, 1, 1, 1, 1, 1,
-0.5473629, 1.172995, 0.897743, 1, 1, 1, 1, 1,
-0.540724, -0.1719796, -2.741947, 1, 1, 1, 1, 1,
-0.5400439, -1.740104, -2.850877, 1, 1, 1, 1, 1,
-0.5369571, -0.7882729, -2.944981, 1, 1, 1, 1, 1,
-0.5358235, -0.6326308, -2.726095, 1, 1, 1, 1, 1,
-0.5339975, -0.3900759, -4.254316, 0, 0, 1, 1, 1,
-0.5260729, -0.5608486, -3.730616, 1, 0, 0, 1, 1,
-0.5260045, 0.775578, -0.8914937, 1, 0, 0, 1, 1,
-0.5256413, -1.738861, -2.687005, 1, 0, 0, 1, 1,
-0.5202907, 0.3108552, -2.00937, 1, 0, 0, 1, 1,
-0.5202407, -0.3882857, -1.430265, 1, 0, 0, 1, 1,
-0.5142396, 0.6893768, -2.408536, 0, 0, 0, 1, 1,
-0.5121741, 0.2368443, 0.1943308, 0, 0, 0, 1, 1,
-0.506909, -0.5606378, -2.075745, 0, 0, 0, 1, 1,
-0.5046557, -0.1446122, -1.951015, 0, 0, 0, 1, 1,
-0.5043881, -0.4602921, -1.97541, 0, 0, 0, 1, 1,
-0.5039901, -1.043268, -3.176376, 0, 0, 0, 1, 1,
-0.5020382, -1.542351, -1.226403, 0, 0, 0, 1, 1,
-0.5007055, -0.7967905, -2.035016, 1, 1, 1, 1, 1,
-0.5004236, -1.561623, -4.569152, 1, 1, 1, 1, 1,
-0.5002251, -0.3416424, -0.3496406, 1, 1, 1, 1, 1,
-0.4952987, -0.1477348, -1.914051, 1, 1, 1, 1, 1,
-0.4952945, 0.4302859, -1.559255, 1, 1, 1, 1, 1,
-0.4908876, 1.120653, -0.3190496, 1, 1, 1, 1, 1,
-0.489137, -1.732876, -2.347931, 1, 1, 1, 1, 1,
-0.4810123, -0.09949565, -1.389473, 1, 1, 1, 1, 1,
-0.4768499, 2.0762, 0.5009728, 1, 1, 1, 1, 1,
-0.4763687, 0.616508, -1.862417, 1, 1, 1, 1, 1,
-0.4747234, 1.226247, -1.211849, 1, 1, 1, 1, 1,
-0.4738083, -0.2107251, -0.1379472, 1, 1, 1, 1, 1,
-0.4673638, -1.316867, -2.701881, 1, 1, 1, 1, 1,
-0.466528, 0.2423912, -1.233827, 1, 1, 1, 1, 1,
-0.4648762, -0.1012038, -1.648362, 1, 1, 1, 1, 1,
-0.46396, -2.516613, -4.577989, 0, 0, 1, 1, 1,
-0.4608476, -1.403004, -2.125683, 1, 0, 0, 1, 1,
-0.4595405, -0.0008429492, -3.652862, 1, 0, 0, 1, 1,
-0.4584995, 0.3584853, -1.62602, 1, 0, 0, 1, 1,
-0.4502046, -0.7239441, -2.743141, 1, 0, 0, 1, 1,
-0.4472051, 1.652048, -1.239912, 1, 0, 0, 1, 1,
-0.4423527, -0.09048354, -0.8827734, 0, 0, 0, 1, 1,
-0.4402108, 0.7266303, -0.7015302, 0, 0, 0, 1, 1,
-0.4358419, -1.082925, -2.550991, 0, 0, 0, 1, 1,
-0.4354285, 1.691998, 0.4314975, 0, 0, 0, 1, 1,
-0.4345997, -0.536985, -1.86565, 0, 0, 0, 1, 1,
-0.4311841, -0.7689091, -3.36957, 0, 0, 0, 1, 1,
-0.4310388, 0.0707115, -1.760106, 0, 0, 0, 1, 1,
-0.4305642, 0.2481085, -1.313285, 1, 1, 1, 1, 1,
-0.4302914, 0.9082421, 0.3921112, 1, 1, 1, 1, 1,
-0.4296975, 0.7663174, 1.237864, 1, 1, 1, 1, 1,
-0.4289153, 0.30025, -0.5798838, 1, 1, 1, 1, 1,
-0.4246854, 1.088791, 0.6076695, 1, 1, 1, 1, 1,
-0.4243496, -1.021852, -3.21647, 1, 1, 1, 1, 1,
-0.419068, -0.69058, -3.659525, 1, 1, 1, 1, 1,
-0.4189222, -1.233492, -2.13175, 1, 1, 1, 1, 1,
-0.4169577, -1.382421, -3.961512, 1, 1, 1, 1, 1,
-0.412429, -0.4856919, -2.489703, 1, 1, 1, 1, 1,
-0.4087742, -1.036659, -1.381765, 1, 1, 1, 1, 1,
-0.4079719, -0.3765256, -3.226312, 1, 1, 1, 1, 1,
-0.4060684, -0.246851, -0.9956642, 1, 1, 1, 1, 1,
-0.4045943, -1.519928, -5.938176, 1, 1, 1, 1, 1,
-0.3983053, -0.4955491, -2.266507, 1, 1, 1, 1, 1,
-0.3872775, 1.281399, 0.04925639, 0, 0, 1, 1, 1,
-0.3864704, -2.871153, -3.399507, 1, 0, 0, 1, 1,
-0.3857774, -1.715677, -2.066095, 1, 0, 0, 1, 1,
-0.3845671, 0.5390546, 0.7163086, 1, 0, 0, 1, 1,
-0.377363, -1.525453, -4.090424, 1, 0, 0, 1, 1,
-0.3758552, -0.7561218, -1.497563, 1, 0, 0, 1, 1,
-0.3749398, 0.7351085, -1.5098, 0, 0, 0, 1, 1,
-0.3690879, 0.6162764, -0.3983392, 0, 0, 0, 1, 1,
-0.3682528, 1.409461, -0.1547153, 0, 0, 0, 1, 1,
-0.3640742, -1.430449, -3.223403, 0, 0, 0, 1, 1,
-0.3623711, -0.7770928, -2.439632, 0, 0, 0, 1, 1,
-0.3605017, 0.9842181, -0.4679269, 0, 0, 0, 1, 1,
-0.3555721, -1.187362, -2.562196, 0, 0, 0, 1, 1,
-0.3546651, -0.7734299, -0.9770659, 1, 1, 1, 1, 1,
-0.3535485, -0.07551082, -0.8947082, 1, 1, 1, 1, 1,
-0.3531128, 0.2784243, -1.436228, 1, 1, 1, 1, 1,
-0.3518226, 0.05362592, -2.31159, 1, 1, 1, 1, 1,
-0.3505783, 0.5215796, -1.494042, 1, 1, 1, 1, 1,
-0.3487811, 0.1956469, 0.6827814, 1, 1, 1, 1, 1,
-0.3437621, -0.2013831, -2.787397, 1, 1, 1, 1, 1,
-0.3426675, 0.4555576, -1.56225, 1, 1, 1, 1, 1,
-0.3414001, -0.03091785, -3.578071, 1, 1, 1, 1, 1,
-0.3365593, 1.336983, 0.8452896, 1, 1, 1, 1, 1,
-0.3337047, -0.1011621, -3.799565, 1, 1, 1, 1, 1,
-0.3335276, 1.177304, 0.0295682, 1, 1, 1, 1, 1,
-0.3314718, -0.7167649, -4.240202, 1, 1, 1, 1, 1,
-0.3250279, 0.3426997, -0.7481053, 1, 1, 1, 1, 1,
-0.3229915, -0.9599633, -3.477401, 1, 1, 1, 1, 1,
-0.3218414, -0.3389432, -2.940094, 0, 0, 1, 1, 1,
-0.3135218, -1.293731, -3.908329, 1, 0, 0, 1, 1,
-0.3103667, 0.3652807, -0.511643, 1, 0, 0, 1, 1,
-0.3082738, 0.8872671, -2.327449, 1, 0, 0, 1, 1,
-0.3015529, -0.5300409, -2.560922, 1, 0, 0, 1, 1,
-0.3003221, 0.5917507, 1.667424, 1, 0, 0, 1, 1,
-0.3002397, 0.5010718, -0.6047945, 0, 0, 0, 1, 1,
-0.299073, -1.64373, -2.343405, 0, 0, 0, 1, 1,
-0.2947668, 1.097596, 0.4819062, 0, 0, 0, 1, 1,
-0.2923285, -2.647142, -2.525715, 0, 0, 0, 1, 1,
-0.2921042, 0.643364, 0.8495682, 0, 0, 0, 1, 1,
-0.2899514, 1.004618, 0.2396936, 0, 0, 0, 1, 1,
-0.2881859, -1.779042, -3.855766, 0, 0, 0, 1, 1,
-0.2878111, -1.262999, -2.222751, 1, 1, 1, 1, 1,
-0.2854871, -1.539908, -3.635201, 1, 1, 1, 1, 1,
-0.2850228, -0.7924955, -2.250838, 1, 1, 1, 1, 1,
-0.2838782, -0.001003637, -0.8678763, 1, 1, 1, 1, 1,
-0.2814583, 0.7680655, 1.930735, 1, 1, 1, 1, 1,
-0.272801, 0.4529322, -1.251651, 1, 1, 1, 1, 1,
-0.2714912, 0.04905545, -2.877265, 1, 1, 1, 1, 1,
-0.2705287, -0.2021319, -3.446087, 1, 1, 1, 1, 1,
-0.269529, -0.6387163, -1.947023, 1, 1, 1, 1, 1,
-0.2695135, -0.1425018, -0.9002675, 1, 1, 1, 1, 1,
-0.2693432, 0.04393313, -0.9962617, 1, 1, 1, 1, 1,
-0.2660744, -1.498484, -4.266423, 1, 1, 1, 1, 1,
-0.2625341, -1.486464, -3.77797, 1, 1, 1, 1, 1,
-0.261461, -1.601573, -3.718124, 1, 1, 1, 1, 1,
-0.2563938, 1.176617, 0.02723471, 1, 1, 1, 1, 1,
-0.2551976, 0.02338305, -1.048232, 0, 0, 1, 1, 1,
-0.2545354, 0.7691045, 0.7499301, 1, 0, 0, 1, 1,
-0.2481133, -0.09398174, -2.874172, 1, 0, 0, 1, 1,
-0.2474182, 1.148786, -0.9134403, 1, 0, 0, 1, 1,
-0.2441953, 0.6506067, -1.850602, 1, 0, 0, 1, 1,
-0.2349649, 0.4162354, -1.293253, 1, 0, 0, 1, 1,
-0.2311129, -0.8891092, -3.335628, 0, 0, 0, 1, 1,
-0.2284402, 1.202127, -0.756769, 0, 0, 0, 1, 1,
-0.2272711, 0.3735177, -1.74154, 0, 0, 0, 1, 1,
-0.2250624, -0.09090817, -2.641599, 0, 0, 0, 1, 1,
-0.2225609, 0.3715738, -0.6128095, 0, 0, 0, 1, 1,
-0.2205784, -0.07968003, -3.679168, 0, 0, 0, 1, 1,
-0.2154949, -0.2681615, -1.747619, 0, 0, 0, 1, 1,
-0.2147369, 0.3243646, 0.5184804, 1, 1, 1, 1, 1,
-0.2140742, -0.254151, -3.782772, 1, 1, 1, 1, 1,
-0.2119541, -0.6106855, -3.738385, 1, 1, 1, 1, 1,
-0.210114, 0.1539554, -1.543845, 1, 1, 1, 1, 1,
-0.2083212, -1.126053, -3.10882, 1, 1, 1, 1, 1,
-0.2073056, -1.20135, -3.76581, 1, 1, 1, 1, 1,
-0.2046695, 1.74727, 1.244628, 1, 1, 1, 1, 1,
-0.2045064, 0.5304961, -0.8355432, 1, 1, 1, 1, 1,
-0.2014296, -0.501511, -1.841511, 1, 1, 1, 1, 1,
-0.1994378, 0.7330292, 1.007838, 1, 1, 1, 1, 1,
-0.1866988, 0.3302449, -1.220183, 1, 1, 1, 1, 1,
-0.1784375, 1.125916, -0.3262904, 1, 1, 1, 1, 1,
-0.1776296, -0.7691814, -1.472992, 1, 1, 1, 1, 1,
-0.1749681, -1.008476, -1.433838, 1, 1, 1, 1, 1,
-0.1745169, 0.2219211, -1.404525, 1, 1, 1, 1, 1,
-0.1705053, -0.7822412, -2.352835, 0, 0, 1, 1, 1,
-0.167655, 0.04772639, -0.984602, 1, 0, 0, 1, 1,
-0.1670785, -0.05157462, -1.741251, 1, 0, 0, 1, 1,
-0.1657795, -0.1703841, -3.351009, 1, 0, 0, 1, 1,
-0.1657319, 0.7657588, 0.6298415, 1, 0, 0, 1, 1,
-0.1647598, 1.482954, 0.08967146, 1, 0, 0, 1, 1,
-0.1641227, -0.4894392, -2.936949, 0, 0, 0, 1, 1,
-0.1567583, -0.3698713, -2.57089, 0, 0, 0, 1, 1,
-0.1502135, -0.0453529, -2.655971, 0, 0, 0, 1, 1,
-0.1490463, 1.331098, -1.199577, 0, 0, 0, 1, 1,
-0.1455904, 0.2144998, -1.299994, 0, 0, 0, 1, 1,
-0.1400601, 1.422017, -0.7628547, 0, 0, 0, 1, 1,
-0.1392691, -0.03060146, -1.598333, 0, 0, 0, 1, 1,
-0.136049, -2.159807, -3.410658, 1, 1, 1, 1, 1,
-0.1347119, -0.7151555, -3.97627, 1, 1, 1, 1, 1,
-0.132559, -0.2749528, -3.492486, 1, 1, 1, 1, 1,
-0.1281718, 0.6444949, -1.419729, 1, 1, 1, 1, 1,
-0.125853, -0.9589606, -2.785887, 1, 1, 1, 1, 1,
-0.1249104, -0.22759, -3.049996, 1, 1, 1, 1, 1,
-0.1212453, 0.7395523, -0.5395434, 1, 1, 1, 1, 1,
-0.1143929, 0.1839203, -0.5905273, 1, 1, 1, 1, 1,
-0.1134759, -0.4356108, -4.183868, 1, 1, 1, 1, 1,
-0.1094234, 0.3716365, 0.2386026, 1, 1, 1, 1, 1,
-0.107517, -1.071659, -3.275559, 1, 1, 1, 1, 1,
-0.1056478, -0.2955517, -2.407475, 1, 1, 1, 1, 1,
-0.1033019, 1.059735, 0.436075, 1, 1, 1, 1, 1,
-0.0950269, -0.3455245, -2.214233, 1, 1, 1, 1, 1,
-0.08879948, 0.7527805, -0.2154883, 1, 1, 1, 1, 1,
-0.08214267, 0.3976735, -0.6276779, 0, 0, 1, 1, 1,
-0.08097047, -0.4634878, -4.259171, 1, 0, 0, 1, 1,
-0.07919398, 0.8920608, 0.2442504, 1, 0, 0, 1, 1,
-0.07713726, -0.6837321, -1.634676, 1, 0, 0, 1, 1,
-0.07672147, -0.5066223, -4.324805, 1, 0, 0, 1, 1,
-0.07663653, -0.3633374, -4.28311, 1, 0, 0, 1, 1,
-0.07239921, 2.11412, 0.6131068, 0, 0, 0, 1, 1,
-0.06998366, 0.4425707, 1.201286, 0, 0, 0, 1, 1,
-0.06921711, 1.519302, 1.771092, 0, 0, 0, 1, 1,
-0.06633417, 0.3656594, 0.6426558, 0, 0, 0, 1, 1,
-0.06595922, 0.09293376, -1.585247, 0, 0, 0, 1, 1,
-0.0656374, 0.9768803, -0.8488899, 0, 0, 0, 1, 1,
-0.06469183, 0.07796751, 1.06798, 0, 0, 0, 1, 1,
-0.05396499, 0.8954418, 0.7501718, 1, 1, 1, 1, 1,
-0.05326035, -0.7330883, -4.240911, 1, 1, 1, 1, 1,
-0.0528831, 2.837893, 1.219016, 1, 1, 1, 1, 1,
-0.05217032, -1.74693, -2.823072, 1, 1, 1, 1, 1,
-0.04618042, -1.066661, -2.867191, 1, 1, 1, 1, 1,
-0.04548442, -0.2780182, -3.265165, 1, 1, 1, 1, 1,
-0.04207641, 0.6983114, -0.09854945, 1, 1, 1, 1, 1,
-0.03889436, 2.43323, -0.005807934, 1, 1, 1, 1, 1,
-0.03873884, -1.468887, -3.301223, 1, 1, 1, 1, 1,
-0.03483733, -0.4696062, -4.260659, 1, 1, 1, 1, 1,
-0.0295777, -0.3234492, -2.401908, 1, 1, 1, 1, 1,
-0.02525632, -0.5469003, -4.166953, 1, 1, 1, 1, 1,
-0.02297789, 1.145588, -0.6470115, 1, 1, 1, 1, 1,
-0.02030449, 0.1024837, -0.5124885, 1, 1, 1, 1, 1,
-0.01885374, -1.68401, -2.133012, 1, 1, 1, 1, 1,
-0.01835378, -1.086977, -1.589432, 0, 0, 1, 1, 1,
-0.01757686, 1.117421, -0.3606643, 1, 0, 0, 1, 1,
-0.01326052, -0.9370739, -2.903491, 1, 0, 0, 1, 1,
-0.0128894, 0.3708368, -0.3030975, 1, 0, 0, 1, 1,
-0.01024554, -0.2680831, -4.85267, 1, 0, 0, 1, 1,
-0.01011575, -0.1481462, -2.701373, 1, 0, 0, 1, 1,
-0.00983021, 1.142984, -0.6019599, 0, 0, 0, 1, 1,
-0.009758816, -0.2129709, -2.292022, 0, 0, 0, 1, 1,
-0.004382403, 0.5582484, 0.2356262, 0, 0, 0, 1, 1,
-0.0005239189, 0.8412401, -0.547164, 0, 0, 0, 1, 1,
0.0003283325, 0.08683508, -0.3527383, 0, 0, 0, 1, 1,
0.0009806069, -0.1267462, 2.254322, 0, 0, 0, 1, 1,
0.001287011, 0.4480513, -1.392766, 0, 0, 0, 1, 1,
0.001493412, -0.5021886, 2.910509, 1, 1, 1, 1, 1,
0.005620291, -1.730989, 2.37933, 1, 1, 1, 1, 1,
0.01297591, 1.920595, 0.6606793, 1, 1, 1, 1, 1,
0.01964674, 1.369582, -1.887663, 1, 1, 1, 1, 1,
0.03513423, 0.6981755, -0.4365945, 1, 1, 1, 1, 1,
0.03769074, -0.4503495, 3.286234, 1, 1, 1, 1, 1,
0.04829485, 0.2105091, 1.17188, 1, 1, 1, 1, 1,
0.05378965, -2.548809, 2.610031, 1, 1, 1, 1, 1,
0.05501278, 1.126224, -1.00362, 1, 1, 1, 1, 1,
0.06002752, 2.165437, 2.000792, 1, 1, 1, 1, 1,
0.06180044, -0.9578169, 2.754861, 1, 1, 1, 1, 1,
0.06209774, -0.9051733, 5.161319, 1, 1, 1, 1, 1,
0.06263477, -0.117448, 3.43426, 1, 1, 1, 1, 1,
0.06300069, -1.083447, 4.538292, 1, 1, 1, 1, 1,
0.06453131, -0.01594358, 0.5645666, 1, 1, 1, 1, 1,
0.06514309, 0.575528, -1.359116, 0, 0, 1, 1, 1,
0.06833889, 0.5948421, 0.6662875, 1, 0, 0, 1, 1,
0.07884338, 1.628693, -1.537833, 1, 0, 0, 1, 1,
0.0789274, -0.4909634, 1.506107, 1, 0, 0, 1, 1,
0.08317397, 0.4978987, 1.281634, 1, 0, 0, 1, 1,
0.09034652, -0.5609931, 4.971858, 1, 0, 0, 1, 1,
0.09520893, 0.0120225, 0.1274081, 0, 0, 0, 1, 1,
0.09843194, 0.3644562, 0.06103435, 0, 0, 0, 1, 1,
0.1056003, -0.02823477, 1.381345, 0, 0, 0, 1, 1,
0.1056431, -1.690978, 4.043404, 0, 0, 0, 1, 1,
0.1066425, 0.2653518, 1.299896, 0, 0, 0, 1, 1,
0.1130183, 1.06385, 0.3013333, 0, 0, 0, 1, 1,
0.1134673, -0.4685193, 0.4797053, 0, 0, 0, 1, 1,
0.1164126, -1.067353, 4.047036, 1, 1, 1, 1, 1,
0.1164626, -0.4646392, 1.882205, 1, 1, 1, 1, 1,
0.1167696, 0.6510327, 0.7423643, 1, 1, 1, 1, 1,
0.1171124, 1.110988, -0.8185678, 1, 1, 1, 1, 1,
0.1175887, -2.259374, 4.825668, 1, 1, 1, 1, 1,
0.1192539, -0.6424426, 3.164907, 1, 1, 1, 1, 1,
0.1194013, -1.062385, 2.967227, 1, 1, 1, 1, 1,
0.1258576, -1.301626, 2.084815, 1, 1, 1, 1, 1,
0.1284506, 1.297738, 1.347538, 1, 1, 1, 1, 1,
0.1300455, -0.1365345, 1.912794, 1, 1, 1, 1, 1,
0.1308758, -1.985562, 2.812133, 1, 1, 1, 1, 1,
0.1363044, -2.198175, 2.719138, 1, 1, 1, 1, 1,
0.1395938, 0.6398587, 2.312421, 1, 1, 1, 1, 1,
0.1407263, 1.354552, 0.3239647, 1, 1, 1, 1, 1,
0.1446448, -0.2984802, 5.040112, 1, 1, 1, 1, 1,
0.1492642, 1.18286, 0.01926142, 0, 0, 1, 1, 1,
0.149344, -1.233713, 1.944417, 1, 0, 0, 1, 1,
0.1530577, 0.1630389, 1.750762, 1, 0, 0, 1, 1,
0.1623252, -1.388914, 2.225336, 1, 0, 0, 1, 1,
0.1640949, 1.455506, -1.374534, 1, 0, 0, 1, 1,
0.1643357, 0.2448123, 2.509706, 1, 0, 0, 1, 1,
0.168123, 3.38508, 0.3024023, 0, 0, 0, 1, 1,
0.169627, -0.3417613, 2.185846, 0, 0, 0, 1, 1,
0.1717925, 0.07275761, 2.104014, 0, 0, 0, 1, 1,
0.1731081, -1.078969, 2.116436, 0, 0, 0, 1, 1,
0.1733569, -0.4007982, 3.167261, 0, 0, 0, 1, 1,
0.1829749, 1.006824, 1.259897, 0, 0, 0, 1, 1,
0.1836439, -1.334051, 2.921458, 0, 0, 0, 1, 1,
0.1851111, -0.847936, 3.984074, 1, 1, 1, 1, 1,
0.1866675, -0.288724, 4.071893, 1, 1, 1, 1, 1,
0.1880666, 1.939495, -0.180527, 1, 1, 1, 1, 1,
0.188907, -1.052366, 3.010187, 1, 1, 1, 1, 1,
0.1928374, -0.7163882, 0.4521392, 1, 1, 1, 1, 1,
0.1928663, 0.9058561, 0.0190933, 1, 1, 1, 1, 1,
0.1935363, -0.3658994, 2.95927, 1, 1, 1, 1, 1,
0.1948597, -0.3815435, 4.562047, 1, 1, 1, 1, 1,
0.19726, -0.784089, 1.778387, 1, 1, 1, 1, 1,
0.2111901, 0.03804795, 1.079892, 1, 1, 1, 1, 1,
0.2151221, -0.2621931, 4.029003, 1, 1, 1, 1, 1,
0.2225003, -0.5749123, 2.179553, 1, 1, 1, 1, 1,
0.2241209, 0.6285677, 1.510434, 1, 1, 1, 1, 1,
0.2259813, -0.6687947, 3.584327, 1, 1, 1, 1, 1,
0.2354992, 1.30124, -0.03955162, 1, 1, 1, 1, 1,
0.2355843, -1.948156, 4.359127, 0, 0, 1, 1, 1,
0.2374193, 1.576074, 1.492968, 1, 0, 0, 1, 1,
0.2377256, 2.158431, -0.06292597, 1, 0, 0, 1, 1,
0.2422751, -0.5546784, 2.881033, 1, 0, 0, 1, 1,
0.243476, -0.6329326, 2.976399, 1, 0, 0, 1, 1,
0.2512664, 0.282874, 0.1818281, 1, 0, 0, 1, 1,
0.2553037, -1.253524, 2.932308, 0, 0, 0, 1, 1,
0.2572936, 0.1452276, 0.4960836, 0, 0, 0, 1, 1,
0.2591726, -0.4731452, 0.9311171, 0, 0, 0, 1, 1,
0.2612202, -0.6083276, 3.559399, 0, 0, 0, 1, 1,
0.2646563, 0.276854, 1.251083, 0, 0, 0, 1, 1,
0.2684891, 0.6769074, 0.3790777, 0, 0, 0, 1, 1,
0.2742845, -0.9942095, 4.716872, 0, 0, 0, 1, 1,
0.2792932, 0.9997507, 0.6841007, 1, 1, 1, 1, 1,
0.2857793, 0.7417708, 0.6032623, 1, 1, 1, 1, 1,
0.286083, -0.584083, 1.683789, 1, 1, 1, 1, 1,
0.2860904, 0.6433389, 0.5876927, 1, 1, 1, 1, 1,
0.2869653, -1.137673, 4.579063, 1, 1, 1, 1, 1,
0.2936979, -0.8677154, 4.07794, 1, 1, 1, 1, 1,
0.2978743, 0.8534006, 0.533108, 1, 1, 1, 1, 1,
0.2980393, 0.7637535, 1.763502, 1, 1, 1, 1, 1,
0.3026502, -1.417087, 2.211149, 1, 1, 1, 1, 1,
0.3035272, 0.6051103, 1.018453, 1, 1, 1, 1, 1,
0.3073144, 0.6274925, 1.711772, 1, 1, 1, 1, 1,
0.3125178, 0.6259685, -0.7357346, 1, 1, 1, 1, 1,
0.313628, -0.992338, 2.809939, 1, 1, 1, 1, 1,
0.3140276, 2.336944, 0.7998888, 1, 1, 1, 1, 1,
0.3156261, -0.7601566, 3.302427, 1, 1, 1, 1, 1,
0.3204691, -2.559089, 3.348039, 0, 0, 1, 1, 1,
0.3209041, 0.4798111, 0.3565655, 1, 0, 0, 1, 1,
0.322502, -0.04222317, 2.157586, 1, 0, 0, 1, 1,
0.3235563, -0.347185, 3.666914, 1, 0, 0, 1, 1,
0.3246267, 0.1890729, 2.016605, 1, 0, 0, 1, 1,
0.3251586, 0.7841507, 1.490175, 1, 0, 0, 1, 1,
0.3257812, -0.4315842, 1.878921, 0, 0, 0, 1, 1,
0.3338216, -0.5228469, 3.049199, 0, 0, 0, 1, 1,
0.3361963, -0.8329537, 4.912968, 0, 0, 0, 1, 1,
0.3386224, 0.1542353, 1.206615, 0, 0, 0, 1, 1,
0.3448319, -1.67949, 3.700006, 0, 0, 0, 1, 1,
0.3500627, -0.361808, 4.353988, 0, 0, 0, 1, 1,
0.351548, 0.1302392, 0.8365118, 0, 0, 0, 1, 1,
0.3522887, 0.426348, -0.5417004, 1, 1, 1, 1, 1,
0.3558903, 2.202173, -1.891126, 1, 1, 1, 1, 1,
0.3580973, 0.5698771, 0.6374451, 1, 1, 1, 1, 1,
0.3606732, -0.2225834, 2.072732, 1, 1, 1, 1, 1,
0.3618681, -1.11702, 1.073739, 1, 1, 1, 1, 1,
0.3640995, -1.187365, 5.637635, 1, 1, 1, 1, 1,
0.3666949, 0.4841954, 1.173123, 1, 1, 1, 1, 1,
0.3700685, 0.3514132, 0.4774106, 1, 1, 1, 1, 1,
0.3805847, 0.002874353, 2.553697, 1, 1, 1, 1, 1,
0.3811834, -0.1810573, 1.041617, 1, 1, 1, 1, 1,
0.3824903, -0.00204757, 2.08918, 1, 1, 1, 1, 1,
0.3827793, -1.224063, 3.388398, 1, 1, 1, 1, 1,
0.3831303, -0.1363372, 1.351072, 1, 1, 1, 1, 1,
0.3833595, -0.391861, 3.997609, 1, 1, 1, 1, 1,
0.3841867, -0.8191381, 3.98211, 1, 1, 1, 1, 1,
0.3860777, 1.163564, 0.2812753, 0, 0, 1, 1, 1,
0.3910962, 1.84782, 0.7596065, 1, 0, 0, 1, 1,
0.3957949, -0.2128211, 2.950909, 1, 0, 0, 1, 1,
0.3969831, 0.6735893, -0.2708678, 1, 0, 0, 1, 1,
0.3970238, 1.269771, 0.8286769, 1, 0, 0, 1, 1,
0.3989873, -1.042718, 2.994691, 1, 0, 0, 1, 1,
0.4022517, 0.2919191, -0.3597853, 0, 0, 0, 1, 1,
0.4052356, -0.4664508, 2.98336, 0, 0, 0, 1, 1,
0.4053343, -1.152166, 3.240131, 0, 0, 0, 1, 1,
0.411307, -0.5059877, 1.446859, 0, 0, 0, 1, 1,
0.4115398, 0.2318541, 3.49029, 0, 0, 0, 1, 1,
0.413163, -0.7385444, 2.595891, 0, 0, 0, 1, 1,
0.4140337, -1.022297, 1.320676, 0, 0, 0, 1, 1,
0.4143128, -0.285213, 1.661831, 1, 1, 1, 1, 1,
0.4209729, -1.635779, 3.348246, 1, 1, 1, 1, 1,
0.422067, -0.5347399, 2.374776, 1, 1, 1, 1, 1,
0.4223006, -1.176394, 2.50233, 1, 1, 1, 1, 1,
0.42258, 0.3500558, 0.4425934, 1, 1, 1, 1, 1,
0.4265828, 0.9458362, 0.9947519, 1, 1, 1, 1, 1,
0.4317974, -0.9520149, 1.771818, 1, 1, 1, 1, 1,
0.4379272, 0.422979, 0.4990625, 1, 1, 1, 1, 1,
0.4398886, 2.026077, -0.7955442, 1, 1, 1, 1, 1,
0.4401418, -0.3994126, 1.43328, 1, 1, 1, 1, 1,
0.4411323, 1.199036, 1.355323, 1, 1, 1, 1, 1,
0.4428894, -0.1274844, 1.09667, 1, 1, 1, 1, 1,
0.4428914, -0.2088724, 2.932255, 1, 1, 1, 1, 1,
0.4461098, 1.367438, 0.4585736, 1, 1, 1, 1, 1,
0.4461318, -1.102773, 1.832607, 1, 1, 1, 1, 1,
0.448714, -0.2989468, 1.714787, 0, 0, 1, 1, 1,
0.4495101, 0.2327792, 0.546999, 1, 0, 0, 1, 1,
0.4496586, 0.01010169, 1.409774, 1, 0, 0, 1, 1,
0.4528549, -0.3964434, 2.611653, 1, 0, 0, 1, 1,
0.4538507, 0.3524545, 2.127798, 1, 0, 0, 1, 1,
0.4541471, -0.04071361, 2.591683, 1, 0, 0, 1, 1,
0.4543457, 0.4947351, 0.7644755, 0, 0, 0, 1, 1,
0.4552484, 0.6835915, 0.595125, 0, 0, 0, 1, 1,
0.4578016, -0.0313478, 1.267823, 0, 0, 0, 1, 1,
0.460237, -0.3818577, 3.24209, 0, 0, 0, 1, 1,
0.4611787, -0.8176763, 1.612777, 0, 0, 0, 1, 1,
0.4709185, -0.3679231, 2.305306, 0, 0, 0, 1, 1,
0.4765641, -0.1225898, 2.213762, 0, 0, 0, 1, 1,
0.477083, 0.03846576, 1.941342, 1, 1, 1, 1, 1,
0.4783628, 0.07784564, 2.073293, 1, 1, 1, 1, 1,
0.4809139, 0.5776572, 2.806555, 1, 1, 1, 1, 1,
0.4810899, -0.4072698, 1.251422, 1, 1, 1, 1, 1,
0.4812305, 0.3627063, 1.590073, 1, 1, 1, 1, 1,
0.4824615, 0.5580509, -0.3457018, 1, 1, 1, 1, 1,
0.4870442, -1.065979, 3.255494, 1, 1, 1, 1, 1,
0.4885249, -0.7345612, 2.910124, 1, 1, 1, 1, 1,
0.4929604, 1.951156, 1.158181, 1, 1, 1, 1, 1,
0.4940051, -0.01560809, 0.4950391, 1, 1, 1, 1, 1,
0.5037228, 0.7358323, 0.9303433, 1, 1, 1, 1, 1,
0.5052479, 0.7526913, -0.4713199, 1, 1, 1, 1, 1,
0.5113484, -0.6241924, 3.261294, 1, 1, 1, 1, 1,
0.5117227, 0.1612499, 1.709476, 1, 1, 1, 1, 1,
0.5156921, -0.07125245, 1.13268, 1, 1, 1, 1, 1,
0.518636, -0.250315, 2.938724, 0, 0, 1, 1, 1,
0.5209039, 0.05481965, 1.715478, 1, 0, 0, 1, 1,
0.5241845, -1.676124, 2.512224, 1, 0, 0, 1, 1,
0.525553, 2.024143, 0.7564122, 1, 0, 0, 1, 1,
0.5290811, 0.5534467, 0.1860238, 1, 0, 0, 1, 1,
0.5293908, -0.001426336, 0.2767131, 1, 0, 0, 1, 1,
0.5453762, 1.84428, -0.7310967, 0, 0, 0, 1, 1,
0.5501587, -0.836676, 1.263503, 0, 0, 0, 1, 1,
0.5659821, -0.8202389, 3.431093, 0, 0, 0, 1, 1,
0.5677615, -0.4637688, 2.527682, 0, 0, 0, 1, 1,
0.5680901, 1.65422, 0.5973899, 0, 0, 0, 1, 1,
0.5716038, 0.2339278, 4.271804, 0, 0, 0, 1, 1,
0.5737814, 0.7956564, 0.6382174, 0, 0, 0, 1, 1,
0.579704, 0.09325305, 0.7217447, 1, 1, 1, 1, 1,
0.5839475, -0.2606367, 2.469901, 1, 1, 1, 1, 1,
0.5884393, 0.1875458, 0.6963893, 1, 1, 1, 1, 1,
0.5942213, -1.877723, 1.906984, 1, 1, 1, 1, 1,
0.5948849, 0.01702683, 0.4816482, 1, 1, 1, 1, 1,
0.6020024, 0.1906071, 2.382039, 1, 1, 1, 1, 1,
0.6026, 1.005263, 0.9333639, 1, 1, 1, 1, 1,
0.6033217, -0.8288816, 2.104808, 1, 1, 1, 1, 1,
0.6067557, -0.787867, 2.02281, 1, 1, 1, 1, 1,
0.607938, -0.3306912, 3.422935, 1, 1, 1, 1, 1,
0.6096175, -0.8875096, 2.405781, 1, 1, 1, 1, 1,
0.6106408, 0.1378315, 0.8184897, 1, 1, 1, 1, 1,
0.6116621, 0.9379171, 0.2571814, 1, 1, 1, 1, 1,
0.6144879, 1.319165, 0.6440396, 1, 1, 1, 1, 1,
0.6200675, 0.8767704, 1.355799, 1, 1, 1, 1, 1,
0.6211897, 1.14371, 0.5681767, 0, 0, 1, 1, 1,
0.6263279, -0.4483744, 1.559852, 1, 0, 0, 1, 1,
0.6277804, 1.055071, 2.360003, 1, 0, 0, 1, 1,
0.6291078, -0.4661492, 1.04901, 1, 0, 0, 1, 1,
0.6353837, -0.3215902, 2.019786, 1, 0, 0, 1, 1,
0.6384841, -0.1818362, 0.6081756, 1, 0, 0, 1, 1,
0.6393775, -1.599282, 1.038666, 0, 0, 0, 1, 1,
0.641713, 0.3711807, 2.389964, 0, 0, 0, 1, 1,
0.6464429, -0.02059661, -0.1834944, 0, 0, 0, 1, 1,
0.6485407, 0.6493393, 0.1844167, 0, 0, 0, 1, 1,
0.6506883, 1.386478, 0.3145047, 0, 0, 0, 1, 1,
0.657464, -0.1589409, 1.346711, 0, 0, 0, 1, 1,
0.6626371, -0.6943351, 3.210433, 0, 0, 0, 1, 1,
0.6636531, 0.09480033, 0.9435222, 1, 1, 1, 1, 1,
0.6647543, 0.3842379, 0.5196782, 1, 1, 1, 1, 1,
0.6658581, -0.8163328, 4.624321, 1, 1, 1, 1, 1,
0.6661101, -1.965809, 2.797538, 1, 1, 1, 1, 1,
0.672534, -0.5258634, 2.588389, 1, 1, 1, 1, 1,
0.6777341, -0.09359092, 2.550122, 1, 1, 1, 1, 1,
0.6833638, -0.1239076, 2.878413, 1, 1, 1, 1, 1,
0.68797, 0.9092728, 1.440794, 1, 1, 1, 1, 1,
0.6948162, 1.265531, -0.5903987, 1, 1, 1, 1, 1,
0.6976848, -0.08140843, 1.733722, 1, 1, 1, 1, 1,
0.7042726, 0.314698, 0.9029961, 1, 1, 1, 1, 1,
0.7057189, -0.341027, 2.451886, 1, 1, 1, 1, 1,
0.708118, -1.632187, 1.571352, 1, 1, 1, 1, 1,
0.7095503, -0.04854921, 1.772175, 1, 1, 1, 1, 1,
0.7130291, -0.580622, 3.009378, 1, 1, 1, 1, 1,
0.7140453, 1.77567, 0.2352451, 0, 0, 1, 1, 1,
0.7166989, 0.6405264, 1.316897, 1, 0, 0, 1, 1,
0.7180673, 0.6346477, 0.2407619, 1, 0, 0, 1, 1,
0.7262598, -0.07198308, 2.543414, 1, 0, 0, 1, 1,
0.7278319, -0.1472014, 0.9278772, 1, 0, 0, 1, 1,
0.7306322, 0.9325381, 1.662698, 1, 0, 0, 1, 1,
0.7312224, 1.318735, 0.3045087, 0, 0, 0, 1, 1,
0.7369964, 0.521512, 2.172748, 0, 0, 0, 1, 1,
0.7392414, -1.891401, 2.110291, 0, 0, 0, 1, 1,
0.7417847, -1.186417, 2.350138, 0, 0, 0, 1, 1,
0.7467261, -0.9080889, 0.9590694, 0, 0, 0, 1, 1,
0.7472919, 0.2414759, 0.562903, 0, 0, 0, 1, 1,
0.7535654, 0.6448061, 0.3061556, 0, 0, 0, 1, 1,
0.7551099, 0.6769661, 0.6173785, 1, 1, 1, 1, 1,
0.7557404, -0.6120801, 1.364611, 1, 1, 1, 1, 1,
0.7569517, -0.5635468, 1.883911, 1, 1, 1, 1, 1,
0.759243, 0.416152, 2.04756, 1, 1, 1, 1, 1,
0.761239, -0.4608543, 0.6971083, 1, 1, 1, 1, 1,
0.7622771, 0.8922737, 0.5283458, 1, 1, 1, 1, 1,
0.7623103, -1.243741, 2.706741, 1, 1, 1, 1, 1,
0.7634829, -0.923063, 0.9293309, 1, 1, 1, 1, 1,
0.7721237, 0.328284, 1.083819, 1, 1, 1, 1, 1,
0.7726492, 1.727279, 1.22971, 1, 1, 1, 1, 1,
0.7769225, 1.403766, -1.190354, 1, 1, 1, 1, 1,
0.7793674, -0.3655268, 3.550527, 1, 1, 1, 1, 1,
0.7797709, -2.216446, 2.922423, 1, 1, 1, 1, 1,
0.7886887, -1.75152, 4.345047, 1, 1, 1, 1, 1,
0.7931162, 0.02753821, 1.673886, 1, 1, 1, 1, 1,
0.7936223, 0.1770936, 2.250294, 0, 0, 1, 1, 1,
0.7975664, -1.570229, 3.463094, 1, 0, 0, 1, 1,
0.8000234, 0.5504032, 0.9211292, 1, 0, 0, 1, 1,
0.801514, 0.6149576, 1.046063, 1, 0, 0, 1, 1,
0.8129263, -0.8312428, 1.68817, 1, 0, 0, 1, 1,
0.8142473, -0.1737973, 1.169945, 1, 0, 0, 1, 1,
0.8244357, 0.5614992, 1.386458, 0, 0, 0, 1, 1,
0.8259493, 0.3998926, 2.189637, 0, 0, 0, 1, 1,
0.8336362, 0.2363693, 0.4253216, 0, 0, 0, 1, 1,
0.8418913, -1.113689, 1.854779, 0, 0, 0, 1, 1,
0.8482071, -0.3855346, 3.422154, 0, 0, 0, 1, 1,
0.8482966, 0.4360291, 0.4020063, 0, 0, 0, 1, 1,
0.8507172, 0.4775617, 1.382511, 0, 0, 0, 1, 1,
0.8516943, -1.362943, 3.855097, 1, 1, 1, 1, 1,
0.8517021, 1.631771, 1.533746, 1, 1, 1, 1, 1,
0.8552033, -1.440272, 2.939713, 1, 1, 1, 1, 1,
0.8637531, -0.2801588, 2.642006, 1, 1, 1, 1, 1,
0.8656133, 0.9654151, -0.01826291, 1, 1, 1, 1, 1,
0.86577, -0.6077093, 3.52328, 1, 1, 1, 1, 1,
0.8666186, -1.059103, 3.217607, 1, 1, 1, 1, 1,
0.8673846, 0.4737504, -0.7367547, 1, 1, 1, 1, 1,
0.8689954, -0.579429, 2.530405, 1, 1, 1, 1, 1,
0.9022461, 0.8037636, 0.7682756, 1, 1, 1, 1, 1,
0.9049022, 0.3302138, 2.742474, 1, 1, 1, 1, 1,
0.9130588, -0.9324762, 2.456244, 1, 1, 1, 1, 1,
0.9160736, -0.1516666, 1.046841, 1, 1, 1, 1, 1,
0.9199663, 2.566954, -0.6818837, 1, 1, 1, 1, 1,
0.9201624, -0.9217922, 1.456432, 1, 1, 1, 1, 1,
0.9208322, -0.01760379, 1.560736, 0, 0, 1, 1, 1,
0.9229036, 0.4602188, 1.87621, 1, 0, 0, 1, 1,
0.9239361, 0.8370868, 0.4314079, 1, 0, 0, 1, 1,
0.9243276, 0.2332596, 0.7550715, 1, 0, 0, 1, 1,
0.9266255, 0.2884198, 0.6620899, 1, 0, 0, 1, 1,
0.9295565, -1.969943, 1.932299, 1, 0, 0, 1, 1,
0.9371998, 0.1560992, 2.720269, 0, 0, 0, 1, 1,
0.9377995, -1.122984, 2.128692, 0, 0, 0, 1, 1,
0.9429594, 1.56474, 2.241454, 0, 0, 0, 1, 1,
0.9429851, 1.181096, 0.2425487, 0, 0, 0, 1, 1,
0.9472177, -0.3536801, 1.347005, 0, 0, 0, 1, 1,
0.9483282, -0.6587835, 2.228997, 0, 0, 0, 1, 1,
0.9492257, 0.3286183, 0.7241099, 0, 0, 0, 1, 1,
0.949687, 2.260247, -0.2292425, 1, 1, 1, 1, 1,
0.951026, -0.8085448, 0.4833764, 1, 1, 1, 1, 1,
0.9533886, 0.6459313, 0.5134515, 1, 1, 1, 1, 1,
0.9574859, 0.170088, 1.216208, 1, 1, 1, 1, 1,
0.9585624, -0.9997224, 3.161577, 1, 1, 1, 1, 1,
0.9644009, 0.1032106, 0.9730477, 1, 1, 1, 1, 1,
0.9656483, -2.509936, 3.585814, 1, 1, 1, 1, 1,
0.9720533, -1.104742, 3.925209, 1, 1, 1, 1, 1,
0.9767627, 0.1237044, 0.2555765, 1, 1, 1, 1, 1,
0.9775025, -0.6570125, 2.881843, 1, 1, 1, 1, 1,
0.9821648, 0.849566, -0.8045036, 1, 1, 1, 1, 1,
0.9835404, -0.6815151, 2.453006, 1, 1, 1, 1, 1,
0.9843078, -1.441069, 1.959356, 1, 1, 1, 1, 1,
0.9977736, 0.08982048, -0.3853305, 1, 1, 1, 1, 1,
0.9987296, -0.2450102, 0.6951153, 1, 1, 1, 1, 1,
1.014821, 2.108681, 1.214583, 0, 0, 1, 1, 1,
1.017175, -0.922668, 1.952303, 1, 0, 0, 1, 1,
1.021115, -0.8955812, 2.172777, 1, 0, 0, 1, 1,
1.021515, -1.067577, 3.300453, 1, 0, 0, 1, 1,
1.025076, -0.5851244, 2.474761, 1, 0, 0, 1, 1,
1.033641, 0.1466319, 0.7214975, 1, 0, 0, 1, 1,
1.038159, 0.1030202, 2.303079, 0, 0, 0, 1, 1,
1.046079, -0.804408, 1.212569, 0, 0, 0, 1, 1,
1.048082, 0.1396638, 1.838532, 0, 0, 0, 1, 1,
1.054446, 0.7503395, 1.697704, 0, 0, 0, 1, 1,
1.056512, 1.434404, -1.223577, 0, 0, 0, 1, 1,
1.063134, 0.4532788, 1.071956, 0, 0, 0, 1, 1,
1.070904, 1.188502, 1.112967, 0, 0, 0, 1, 1,
1.071732, -1.507723, 4.316068, 1, 1, 1, 1, 1,
1.074189, 0.7830282, 0.8328524, 1, 1, 1, 1, 1,
1.074191, 0.6499692, 0.790355, 1, 1, 1, 1, 1,
1.074357, 1.427605, 1.264474, 1, 1, 1, 1, 1,
1.076438, -1.334777, 1.548548, 1, 1, 1, 1, 1,
1.080481, -0.2896318, 1.713142, 1, 1, 1, 1, 1,
1.083574, 1.214102, 0.8302255, 1, 1, 1, 1, 1,
1.089065, -0.393225, 1.889983, 1, 1, 1, 1, 1,
1.096224, 0.8045532, 0.7508175, 1, 1, 1, 1, 1,
1.098844, -0.3188427, 1.357831, 1, 1, 1, 1, 1,
1.103055, -0.2762132, 2.678084, 1, 1, 1, 1, 1,
1.111565, 0.4834203, 1.417296, 1, 1, 1, 1, 1,
1.122513, -0.02883737, 2.114787, 1, 1, 1, 1, 1,
1.126738, -0.762028, 0.9544987, 1, 1, 1, 1, 1,
1.129726, 0.265735, -0.7828224, 1, 1, 1, 1, 1,
1.131395, 0.8731316, 2.18217, 0, 0, 1, 1, 1,
1.136418, -0.2096978, 1.078284, 1, 0, 0, 1, 1,
1.144417, 0.5631732, -1.4764, 1, 0, 0, 1, 1,
1.162912, 1.754334, 1.388984, 1, 0, 0, 1, 1,
1.170382, 1.153094, 1.660518, 1, 0, 0, 1, 1,
1.183092, -0.1516714, 1.692875, 1, 0, 0, 1, 1,
1.186281, 0.1096606, 2.535223, 0, 0, 0, 1, 1,
1.189768, 0.7268074, 0.6638958, 0, 0, 0, 1, 1,
1.189843, -0.8818945, 2.773304, 0, 0, 0, 1, 1,
1.191998, 1.005422, 1.563685, 0, 0, 0, 1, 1,
1.192073, -2.121261, 3.223984, 0, 0, 0, 1, 1,
1.19385, 0.2053971, 2.77702, 0, 0, 0, 1, 1,
1.197653, 0.02518477, 0.8074924, 0, 0, 0, 1, 1,
1.199719, 2.453604, -0.3154709, 1, 1, 1, 1, 1,
1.212863, -0.82756, 2.040694, 1, 1, 1, 1, 1,
1.214395, -0.4073232, 2.143308, 1, 1, 1, 1, 1,
1.222242, 1.494213, 0.7253172, 1, 1, 1, 1, 1,
1.227321, 0.3982855, -0.6357624, 1, 1, 1, 1, 1,
1.227698, -0.7435656, 2.350877, 1, 1, 1, 1, 1,
1.245042, 1.051164, 2.046085, 1, 1, 1, 1, 1,
1.24924, -1.187675, 2.445038, 1, 1, 1, 1, 1,
1.251125, 0.1825692, 0.992003, 1, 1, 1, 1, 1,
1.251919, -0.4103056, 3.336163, 1, 1, 1, 1, 1,
1.254226, 0.8538551, 1.139921, 1, 1, 1, 1, 1,
1.254236, -0.6986915, 1.314495, 1, 1, 1, 1, 1,
1.254371, 0.8931429, 2.534568, 1, 1, 1, 1, 1,
1.266239, 0.9952267, 1.218786, 1, 1, 1, 1, 1,
1.269296, -0.2800145, 2.130213, 1, 1, 1, 1, 1,
1.270113, -1.2168, 2.944072, 0, 0, 1, 1, 1,
1.275327, 0.6804431, 2.210363, 1, 0, 0, 1, 1,
1.291259, 0.8319496, 2.4884, 1, 0, 0, 1, 1,
1.298267, -0.01460247, 2.616603, 1, 0, 0, 1, 1,
1.299622, 1.630022, 1.017816, 1, 0, 0, 1, 1,
1.312993, -1.565636, 2.537352, 1, 0, 0, 1, 1,
1.321174, 0.4530391, 1.185918, 0, 0, 0, 1, 1,
1.338054, 1.244923, 0.8131912, 0, 0, 0, 1, 1,
1.361015, -0.3661847, 2.2773, 0, 0, 0, 1, 1,
1.364417, 1.911282, 0.6334016, 0, 0, 0, 1, 1,
1.364529, 1.128193, 0.4276116, 0, 0, 0, 1, 1,
1.365053, -1.949834, 2.415063, 0, 0, 0, 1, 1,
1.37294, -0.4999663, 1.200466, 0, 0, 0, 1, 1,
1.381992, 0.001303248, 1.763379, 1, 1, 1, 1, 1,
1.398443, 1.001143, 1.917821, 1, 1, 1, 1, 1,
1.410631, 0.1813351, 1.266927, 1, 1, 1, 1, 1,
1.413715, -1.933164, 1.288066, 1, 1, 1, 1, 1,
1.415285, 0.9034903, 2.076722, 1, 1, 1, 1, 1,
1.42432, -0.7648118, 1.619579, 1, 1, 1, 1, 1,
1.445787, -1.101333, 4.990118, 1, 1, 1, 1, 1,
1.449792, 0.03845019, -0.4447959, 1, 1, 1, 1, 1,
1.45105, -2.622332, 4.444444, 1, 1, 1, 1, 1,
1.457082, -1.356729, 1.938846, 1, 1, 1, 1, 1,
1.46893, 0.4351102, 0.6239279, 1, 1, 1, 1, 1,
1.510624, -0.882112, 0.9467172, 1, 1, 1, 1, 1,
1.522152, -2.444148, 3.45821, 1, 1, 1, 1, 1,
1.523286, 0.7939716, 1.112221, 1, 1, 1, 1, 1,
1.524655, 2.28193, 1.335366, 1, 1, 1, 1, 1,
1.533662, 0.3965892, 2.171306, 0, 0, 1, 1, 1,
1.537553, 0.8639528, -0.525767, 1, 0, 0, 1, 1,
1.538097, 0.4370085, 0.9539421, 1, 0, 0, 1, 1,
1.540867, 0.05884686, 1.408846, 1, 0, 0, 1, 1,
1.541472, -1.159044, 1.567853, 1, 0, 0, 1, 1,
1.542057, 0.6179199, 0.1336951, 1, 0, 0, 1, 1,
1.546429, 0.2132244, -0.3018739, 0, 0, 0, 1, 1,
1.556391, -1.825433, 3.745815, 0, 0, 0, 1, 1,
1.55973, -1.571078, 2.940643, 0, 0, 0, 1, 1,
1.566832, -0.6105533, 3.296114, 0, 0, 0, 1, 1,
1.583004, -1.076874, 0.4704377, 0, 0, 0, 1, 1,
1.584378, 1.195759, 1.020364, 0, 0, 0, 1, 1,
1.590424, 0.8265163, 0.3064071, 0, 0, 0, 1, 1,
1.605645, 1.809697, 0.7954779, 1, 1, 1, 1, 1,
1.607888, 0.07004284, 0.9870411, 1, 1, 1, 1, 1,
1.607996, 1.140192, 1.851012, 1, 1, 1, 1, 1,
1.637834, 0.1800099, 2.21671, 1, 1, 1, 1, 1,
1.67197, 0.4498473, 2.576266, 1, 1, 1, 1, 1,
1.673163, -1.411956, 1.619596, 1, 1, 1, 1, 1,
1.677065, 0.5967575, 0.7713534, 1, 1, 1, 1, 1,
1.67765, -0.1902104, 3.722641, 1, 1, 1, 1, 1,
1.700379, 0.6187682, 0.8462294, 1, 1, 1, 1, 1,
1.704757, -0.9293083, 1.971515, 1, 1, 1, 1, 1,
1.722514, 0.2838892, 1.829115, 1, 1, 1, 1, 1,
1.736343, -0.5853024, 1.965647, 1, 1, 1, 1, 1,
1.740091, -0.351065, 3.222264, 1, 1, 1, 1, 1,
1.740261, 2.699981, 0.9999083, 1, 1, 1, 1, 1,
1.741733, 1.155488, 1.47659, 1, 1, 1, 1, 1,
1.781124, -0.7433632, 2.68394, 0, 0, 1, 1, 1,
1.789788, -1.535234, 2.775238, 1, 0, 0, 1, 1,
1.802912, 0.895286, 1.030797, 1, 0, 0, 1, 1,
1.805253, -0.3922876, 0.4801242, 1, 0, 0, 1, 1,
1.863359, -0.5837287, 1.296867, 1, 0, 0, 1, 1,
1.86746, -1.419693, 1.822627, 1, 0, 0, 1, 1,
1.880951, -0.1032567, 1.590411, 0, 0, 0, 1, 1,
1.886872, 0.1913624, 2.521533, 0, 0, 0, 1, 1,
1.889206, 1.552472, 1.871766, 0, 0, 0, 1, 1,
1.904863, 0.6744445, -0.7748559, 0, 0, 0, 1, 1,
1.905251, 0.3413178, -0.4525057, 0, 0, 0, 1, 1,
1.908656, -0.5918506, 0.9683135, 0, 0, 0, 1, 1,
1.926441, 1.426358, 1.541952, 0, 0, 0, 1, 1,
1.92837, 0.03205525, 0.698968, 1, 1, 1, 1, 1,
1.93106, 0.1874415, 2.112182, 1, 1, 1, 1, 1,
1.932159, 0.6125852, 0.9970232, 1, 1, 1, 1, 1,
1.937687, -1.218167, 2.78447, 1, 1, 1, 1, 1,
1.94357, -0.1700834, 1.313922, 1, 1, 1, 1, 1,
1.944295, -0.866199, 3.21742, 1, 1, 1, 1, 1,
1.945531, -0.373974, 1.518534, 1, 1, 1, 1, 1,
1.962553, -0.284552, 1.50204, 1, 1, 1, 1, 1,
1.974939, -0.9889196, 0.09149822, 1, 1, 1, 1, 1,
1.980232, 1.097179, 0.7933964, 1, 1, 1, 1, 1,
1.98165, -0.8879328, 2.604815, 1, 1, 1, 1, 1,
2.030984, 1.162957, 2.887131, 1, 1, 1, 1, 1,
2.039869, 1.702526, 0.7230821, 1, 1, 1, 1, 1,
2.063466, 0.8838646, 0.8937015, 1, 1, 1, 1, 1,
2.064536, 0.1759422, 3.009537, 1, 1, 1, 1, 1,
2.073074, 1.591773, 0.8965933, 0, 0, 1, 1, 1,
2.079705, 0.5617483, 0.9631726, 1, 0, 0, 1, 1,
2.109648, -1.008327, 2.908761, 1, 0, 0, 1, 1,
2.134816, -0.2014026, 1.299765, 1, 0, 0, 1, 1,
2.135169, 1.42161, 2.035464, 1, 0, 0, 1, 1,
2.14385, -1.417283, 1.258031, 1, 0, 0, 1, 1,
2.152177, -0.3176091, 3.540283, 0, 0, 0, 1, 1,
2.177877, 0.3490966, 1.662147, 0, 0, 0, 1, 1,
2.22904, 0.3340422, 0.2020532, 0, 0, 0, 1, 1,
2.229153, 0.2969095, 0.6720342, 0, 0, 0, 1, 1,
2.324147, -0.1406084, -0.3162422, 0, 0, 0, 1, 1,
2.343075, 0.9910067, 1.917858, 0, 0, 0, 1, 1,
2.354701, 0.3961483, 0.5612584, 0, 0, 0, 1, 1,
2.477923, 1.063806, 1.647275, 1, 1, 1, 1, 1,
2.567808, -1.182099, 1.335852, 1, 1, 1, 1, 1,
2.5784, -1.123694, 2.329607, 1, 1, 1, 1, 1,
2.597543, 0.8482795, 0.9481793, 1, 1, 1, 1, 1,
2.645017, 0.4913064, 1.378441, 1, 1, 1, 1, 1,
2.751984, 0.2950633, 2.173472, 1, 1, 1, 1, 1,
3.052434, -0.2764689, 1.36327, 1, 1, 1, 1, 1
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
var radius = 9.853122;
var distance = 34.60867;
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
mvMatrix.translate( -0.05609775, -0.1202986, 0.1502707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.60867);
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
