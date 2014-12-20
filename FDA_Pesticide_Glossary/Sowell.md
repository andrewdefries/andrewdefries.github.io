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
-3.22263, 0.3165663, -2.383991, 1, 0, 0, 1,
-2.679112, 2.062121, -0.1873796, 1, 0.007843138, 0, 1,
-2.653018, 0.634864, -2.922945, 1, 0.01176471, 0, 1,
-2.652231, 1.177202, -3.20076, 1, 0.01960784, 0, 1,
-2.624056, -0.5804185, -2.003117, 1, 0.02352941, 0, 1,
-2.539252, -1.65924, -3.121651, 1, 0.03137255, 0, 1,
-2.404454, 1.269843, -0.8700888, 1, 0.03529412, 0, 1,
-2.35393, -1.32914, -1.801821, 1, 0.04313726, 0, 1,
-2.276913, -0.7868983, -2.445657, 1, 0.04705882, 0, 1,
-2.267821, 0.3233441, -0.7194003, 1, 0.05490196, 0, 1,
-2.262197, 0.3729647, 1.381569, 1, 0.05882353, 0, 1,
-2.231789, 2.36394, -1.495458, 1, 0.06666667, 0, 1,
-2.206895, -0.944033, -0.4348382, 1, 0.07058824, 0, 1,
-2.160634, -1.673935, -2.474929, 1, 0.07843138, 0, 1,
-2.108828, 0.7651198, -1.281936, 1, 0.08235294, 0, 1,
-2.04744, -1.841016, -2.11264, 1, 0.09019608, 0, 1,
-2.037201, -0.9615169, -2.417738, 1, 0.09411765, 0, 1,
-2.015367, 0.2772522, -1.878136, 1, 0.1019608, 0, 1,
-1.986799, -0.686534, -2.269263, 1, 0.1098039, 0, 1,
-1.98558, -1.37265, -1.202059, 1, 0.1137255, 0, 1,
-1.962687, -2.213018, -2.16422, 1, 0.1215686, 0, 1,
-1.958197, -0.1403411, -1.245598, 1, 0.1254902, 0, 1,
-1.957339, 1.868203, -1.974363, 1, 0.1333333, 0, 1,
-1.9544, -1.588174, -2.516309, 1, 0.1372549, 0, 1,
-1.952466, 1.671764, -1.419099, 1, 0.145098, 0, 1,
-1.940211, -0.5744931, -1.373215, 1, 0.1490196, 0, 1,
-1.936482, -2.076731, -3.574004, 1, 0.1568628, 0, 1,
-1.9241, 1.413816, -1.023953, 1, 0.1607843, 0, 1,
-1.906262, 0.4132298, -0.2555869, 1, 0.1686275, 0, 1,
-1.891802, 0.3234331, -1.829436, 1, 0.172549, 0, 1,
-1.890767, 0.5007778, 0.8065939, 1, 0.1803922, 0, 1,
-1.880677, -0.1312865, -2.421499, 1, 0.1843137, 0, 1,
-1.867394, 0.4810978, -1.57967, 1, 0.1921569, 0, 1,
-1.853761, -0.8442813, -2.687919, 1, 0.1960784, 0, 1,
-1.820322, 0.5400528, 0.04994469, 1, 0.2039216, 0, 1,
-1.81787, 0.4781745, -1.931648, 1, 0.2117647, 0, 1,
-1.809427, 1.135474, -0.8345336, 1, 0.2156863, 0, 1,
-1.77344, -1.546436, -1.611701, 1, 0.2235294, 0, 1,
-1.769402, 1.430538, -1.490001, 1, 0.227451, 0, 1,
-1.75772, 0.2176731, -1.275136, 1, 0.2352941, 0, 1,
-1.757265, -0.6989492, -1.927056, 1, 0.2392157, 0, 1,
-1.717106, 1.172786, -0.7660889, 1, 0.2470588, 0, 1,
-1.712894, -0.4874191, -3.063668, 1, 0.2509804, 0, 1,
-1.701596, -0.4107996, -1.94748, 1, 0.2588235, 0, 1,
-1.696378, -0.1962959, -1.049754, 1, 0.2627451, 0, 1,
-1.681596, 1.425267, -1.404868, 1, 0.2705882, 0, 1,
-1.674447, 0.274924, -2.431891, 1, 0.2745098, 0, 1,
-1.661651, 0.4486507, -3.167411, 1, 0.282353, 0, 1,
-1.654534, 0.6084805, -2.674175, 1, 0.2862745, 0, 1,
-1.642315, 0.5660785, -1.101308, 1, 0.2941177, 0, 1,
-1.639826, -0.3779412, -2.497493, 1, 0.3019608, 0, 1,
-1.636296, 0.4440184, -2.703551, 1, 0.3058824, 0, 1,
-1.631418, 1.258601, -3.466039, 1, 0.3137255, 0, 1,
-1.62108, 0.1130372, -1.841621, 1, 0.3176471, 0, 1,
-1.60611, 0.6479975, -1.245739, 1, 0.3254902, 0, 1,
-1.604061, 1.073006, -0.9530519, 1, 0.3294118, 0, 1,
-1.602776, -0.06231066, -2.192036, 1, 0.3372549, 0, 1,
-1.602213, 0.788062, 0.1903356, 1, 0.3411765, 0, 1,
-1.599783, -0.2643996, -1.958372, 1, 0.3490196, 0, 1,
-1.594701, 0.5025379, -2.852571, 1, 0.3529412, 0, 1,
-1.593428, -0.7212, -2.142945, 1, 0.3607843, 0, 1,
-1.570485, 1.378814, -1.170539, 1, 0.3647059, 0, 1,
-1.570235, 0.1696778, -0.7036911, 1, 0.372549, 0, 1,
-1.554494, 0.4333822, -0.02885192, 1, 0.3764706, 0, 1,
-1.550931, -0.1237113, -0.2311082, 1, 0.3843137, 0, 1,
-1.54012, -0.0789236, -2.187953, 1, 0.3882353, 0, 1,
-1.530524, 0.6762769, -1.463617, 1, 0.3960784, 0, 1,
-1.524998, -0.3351597, -2.731584, 1, 0.4039216, 0, 1,
-1.524148, -0.3428855, -2.942468, 1, 0.4078431, 0, 1,
-1.50679, 1.013855, -1.441534, 1, 0.4156863, 0, 1,
-1.505424, -0.6884995, -1.161366, 1, 0.4196078, 0, 1,
-1.504739, 0.2970804, -1.029935, 1, 0.427451, 0, 1,
-1.492896, 1.312142, -1.772141, 1, 0.4313726, 0, 1,
-1.490358, -1.042198, -3.030107, 1, 0.4392157, 0, 1,
-1.487315, 0.1649957, -0.7761121, 1, 0.4431373, 0, 1,
-1.475146, 0.07096045, -2.283977, 1, 0.4509804, 0, 1,
-1.470623, -0.6751825, -2.970521, 1, 0.454902, 0, 1,
-1.469047, -0.6159493, -0.501422, 1, 0.4627451, 0, 1,
-1.467512, 1.129198, -0.7198145, 1, 0.4666667, 0, 1,
-1.458604, -0.7298498, -0.5077676, 1, 0.4745098, 0, 1,
-1.446292, 0.2621337, -0.5588503, 1, 0.4784314, 0, 1,
-1.435064, 1.440529, -1.148718, 1, 0.4862745, 0, 1,
-1.419854, 1.287167, -1.917213, 1, 0.4901961, 0, 1,
-1.417229, -0.4137346, -2.877682, 1, 0.4980392, 0, 1,
-1.411518, -1.248874, -3.258152, 1, 0.5058824, 0, 1,
-1.409951, -0.8820521, -1.66596, 1, 0.509804, 0, 1,
-1.408301, 2.250454, -1.417619, 1, 0.5176471, 0, 1,
-1.403819, -0.9844314, -0.6759316, 1, 0.5215687, 0, 1,
-1.401942, 0.3958135, -2.136416, 1, 0.5294118, 0, 1,
-1.38942, 1.051775, -2.547244, 1, 0.5333334, 0, 1,
-1.389151, 0.6526216, 0.4255331, 1, 0.5411765, 0, 1,
-1.388651, 0.6552795, -1.046374, 1, 0.5450981, 0, 1,
-1.381041, 0.7625735, -1.573213, 1, 0.5529412, 0, 1,
-1.370331, 0.2543184, -0.4755827, 1, 0.5568628, 0, 1,
-1.368222, -0.4969315, -1.536981, 1, 0.5647059, 0, 1,
-1.367727, -1.444909, -2.46026, 1, 0.5686275, 0, 1,
-1.360479, -0.4967222, -2.406904, 1, 0.5764706, 0, 1,
-1.350867, -0.1976704, -2.595161, 1, 0.5803922, 0, 1,
-1.345454, 0.05343413, 0.5074188, 1, 0.5882353, 0, 1,
-1.338796, 0.729873, 1.085326, 1, 0.5921569, 0, 1,
-1.317344, -2.862902, -2.48945, 1, 0.6, 0, 1,
-1.290861, -0.6832222, -1.476295, 1, 0.6078432, 0, 1,
-1.290722, 0.3617828, -0.3907664, 1, 0.6117647, 0, 1,
-1.289327, -0.7221134, -2.919613, 1, 0.6196079, 0, 1,
-1.279014, 0.01859212, -1.954242, 1, 0.6235294, 0, 1,
-1.273658, 0.1218563, -2.258509, 1, 0.6313726, 0, 1,
-1.272903, 0.9978746, 0.7861846, 1, 0.6352941, 0, 1,
-1.26581, -0.2123879, -2.187892, 1, 0.6431373, 0, 1,
-1.263376, 1.02586, -0.2579215, 1, 0.6470588, 0, 1,
-1.24535, -1.100682, -2.514413, 1, 0.654902, 0, 1,
-1.242914, 0.1375061, -1.982887, 1, 0.6588235, 0, 1,
-1.238478, -0.769314, -2.222761, 1, 0.6666667, 0, 1,
-1.237876, 1.354219, -1.170341, 1, 0.6705883, 0, 1,
-1.226924, -0.474151, -1.457604, 1, 0.6784314, 0, 1,
-1.226077, 1.095203, -0.9152955, 1, 0.682353, 0, 1,
-1.225553, 1.09957, -2.830735, 1, 0.6901961, 0, 1,
-1.225227, -0.1256302, -1.499894, 1, 0.6941177, 0, 1,
-1.206483, 0.6539772, -2.383918, 1, 0.7019608, 0, 1,
-1.196599, 1.172544, -1.842521, 1, 0.7098039, 0, 1,
-1.186859, 0.1050412, -1.483366, 1, 0.7137255, 0, 1,
-1.185385, -0.646923, -1.78344, 1, 0.7215686, 0, 1,
-1.184774, -1.390044, -1.677252, 1, 0.7254902, 0, 1,
-1.1711, 1.228627, -1.517166, 1, 0.7333333, 0, 1,
-1.171062, -0.516792, -2.920052, 1, 0.7372549, 0, 1,
-1.16973, -0.09852652, -1.380035, 1, 0.7450981, 0, 1,
-1.163624, 0.2819166, -1.555909, 1, 0.7490196, 0, 1,
-1.162608, 0.02946825, -0.6338202, 1, 0.7568628, 0, 1,
-1.161471, -0.8529224, -2.018474, 1, 0.7607843, 0, 1,
-1.158287, 0.4429905, -1.32331, 1, 0.7686275, 0, 1,
-1.157112, 0.8044266, -0.8973067, 1, 0.772549, 0, 1,
-1.153942, -0.8739849, -2.783732, 1, 0.7803922, 0, 1,
-1.152394, -0.3188955, -0.6371058, 1, 0.7843137, 0, 1,
-1.151924, -1.307676, -0.1714971, 1, 0.7921569, 0, 1,
-1.149954, -1.286382, -1.876189, 1, 0.7960784, 0, 1,
-1.14946, 0.08589557, 0.4924023, 1, 0.8039216, 0, 1,
-1.147293, 2.15327, 1.112624, 1, 0.8117647, 0, 1,
-1.145716, -0.830826, -0.9805928, 1, 0.8156863, 0, 1,
-1.145308, 1.204379, -1.968258, 1, 0.8235294, 0, 1,
-1.139441, -0.1293171, -1.079477, 1, 0.827451, 0, 1,
-1.129157, 0.8580744, -1.167111, 1, 0.8352941, 0, 1,
-1.128732, 0.2837036, -0.4209219, 1, 0.8392157, 0, 1,
-1.1269, 0.02615254, -1.39624, 1, 0.8470588, 0, 1,
-1.117728, 1.027539, -1.606095, 1, 0.8509804, 0, 1,
-1.107957, 0.03659138, -2.694141, 1, 0.8588235, 0, 1,
-1.106655, 1.540141, 1.426125, 1, 0.8627451, 0, 1,
-1.099819, 1.373745, -0.1960118, 1, 0.8705882, 0, 1,
-1.097023, -1.72825, -2.487496, 1, 0.8745098, 0, 1,
-1.087012, -0.4022149, -1.247876, 1, 0.8823529, 0, 1,
-1.080263, -0.5384107, -1.909034, 1, 0.8862745, 0, 1,
-1.078086, 0.7227533, -0.1159286, 1, 0.8941177, 0, 1,
-1.072735, -0.5522212, -2.153004, 1, 0.8980392, 0, 1,
-1.069839, -1.158448, -3.185594, 1, 0.9058824, 0, 1,
-1.064785, -0.4857821, -1.804231, 1, 0.9137255, 0, 1,
-1.064134, 1.625116, -1.120777, 1, 0.9176471, 0, 1,
-1.061806, 0.2630683, -3.285879, 1, 0.9254902, 0, 1,
-1.061426, -0.6420684, -2.34415, 1, 0.9294118, 0, 1,
-1.058877, -1.459429, -3.805005, 1, 0.9372549, 0, 1,
-1.057231, 0.4779368, -1.736974, 1, 0.9411765, 0, 1,
-1.054181, -1.078746, -1.33193, 1, 0.9490196, 0, 1,
-1.050947, 0.04599172, 0.7197747, 1, 0.9529412, 0, 1,
-1.050598, -1.590769, -1.741564, 1, 0.9607843, 0, 1,
-1.044638, 0.4988585, -1.009707, 1, 0.9647059, 0, 1,
-1.043817, -1.441295, -2.117019, 1, 0.972549, 0, 1,
-1.041387, -0.5401954, -1.969058, 1, 0.9764706, 0, 1,
-1.036165, -0.9843824, -1.021404, 1, 0.9843137, 0, 1,
-1.030078, 1.348873, -1.882, 1, 0.9882353, 0, 1,
-1.029553, -1.0388, -2.172728, 1, 0.9960784, 0, 1,
-1.025177, 0.252183, -1.314433, 0.9960784, 1, 0, 1,
-1.007983, -0.108105, -2.731317, 0.9921569, 1, 0, 1,
-1.003888, 0.3464114, -1.2483, 0.9843137, 1, 0, 1,
-1.003688, 2.193647, -0.7984303, 0.9803922, 1, 0, 1,
-1.003348, -0.3322968, -1.370726, 0.972549, 1, 0, 1,
-0.9995665, -0.7926615, -2.796185, 0.9686275, 1, 0, 1,
-0.9970582, 0.8388848, -2.183552, 0.9607843, 1, 0, 1,
-0.9904947, -1.597731, -2.072067, 0.9568627, 1, 0, 1,
-0.9901454, 0.2484595, -2.563544, 0.9490196, 1, 0, 1,
-0.9899213, 1.717123, 0.1398668, 0.945098, 1, 0, 1,
-0.9839048, -0.8292843, -2.478686, 0.9372549, 1, 0, 1,
-0.9747562, 0.02951618, -1.676724, 0.9333333, 1, 0, 1,
-0.9745631, -0.5088174, -0.8682387, 0.9254902, 1, 0, 1,
-0.9730834, -0.1003438, -3.193179, 0.9215686, 1, 0, 1,
-0.9655477, -0.3597464, -1.980072, 0.9137255, 1, 0, 1,
-0.9633689, 0.02292504, -0.9407867, 0.9098039, 1, 0, 1,
-0.9557802, -1.978091, -3.97176, 0.9019608, 1, 0, 1,
-0.9531257, -0.33074, -3.614654, 0.8941177, 1, 0, 1,
-0.9361174, -1.956741, -2.816759, 0.8901961, 1, 0, 1,
-0.9276047, 1.42964, 0.0406103, 0.8823529, 1, 0, 1,
-0.9191331, 0.3359522, -2.111212, 0.8784314, 1, 0, 1,
-0.9182704, 0.8365406, -1.156134, 0.8705882, 1, 0, 1,
-0.9122343, -0.9107552, -1.02628, 0.8666667, 1, 0, 1,
-0.9090328, -0.3193322, -2.9159, 0.8588235, 1, 0, 1,
-0.9069099, -2.085571, -0.2698294, 0.854902, 1, 0, 1,
-0.8924217, 0.413945, 0.1580307, 0.8470588, 1, 0, 1,
-0.8862318, 1.595949, -1.224868, 0.8431373, 1, 0, 1,
-0.8830341, -0.8851036, -3.488059, 0.8352941, 1, 0, 1,
-0.869875, -0.2626891, -1.956464, 0.8313726, 1, 0, 1,
-0.8675955, 0.3073848, -1.023955, 0.8235294, 1, 0, 1,
-0.866618, -1.106537, -2.60235, 0.8196079, 1, 0, 1,
-0.8653659, -0.8404896, -1.834858, 0.8117647, 1, 0, 1,
-0.8630479, 0.08252002, -2.297219, 0.8078431, 1, 0, 1,
-0.8540276, -2.821313, -2.546429, 0.8, 1, 0, 1,
-0.8530923, 0.5068737, -1.065118, 0.7921569, 1, 0, 1,
-0.8519035, 1.435209, 0.03496931, 0.7882353, 1, 0, 1,
-0.8511685, -0.3913952, -1.928249, 0.7803922, 1, 0, 1,
-0.8489957, -0.1739402, -2.3174, 0.7764706, 1, 0, 1,
-0.8456203, -0.9586184, -1.252812, 0.7686275, 1, 0, 1,
-0.8387694, 0.6481892, -0.1842039, 0.7647059, 1, 0, 1,
-0.8377505, 0.1686158, -0.9837604, 0.7568628, 1, 0, 1,
-0.8356383, 1.420812, -1.498348, 0.7529412, 1, 0, 1,
-0.8350309, -1.15849, -2.513813, 0.7450981, 1, 0, 1,
-0.83336, 0.5094091, -1.155103, 0.7411765, 1, 0, 1,
-0.8325647, 0.9969058, -0.3620147, 0.7333333, 1, 0, 1,
-0.8293452, -0.3633411, -3.325684, 0.7294118, 1, 0, 1,
-0.8277883, 1.461221, 2.309511, 0.7215686, 1, 0, 1,
-0.8276751, -0.3096711, -1.561056, 0.7176471, 1, 0, 1,
-0.8186298, 1.447102, -1.111838, 0.7098039, 1, 0, 1,
-0.8166036, -0.09455319, -0.812568, 0.7058824, 1, 0, 1,
-0.816062, 1.682171, -1.549194, 0.6980392, 1, 0, 1,
-0.8142011, 0.5825061, -1.908959, 0.6901961, 1, 0, 1,
-0.8113752, -0.2134852, -1.543464, 0.6862745, 1, 0, 1,
-0.8061122, 0.5395085, -2.233815, 0.6784314, 1, 0, 1,
-0.8054455, -0.3800869, -3.723146, 0.6745098, 1, 0, 1,
-0.7929618, 0.4238535, -0.6619042, 0.6666667, 1, 0, 1,
-0.7928056, -0.01045389, -1.650492, 0.6627451, 1, 0, 1,
-0.7927922, 0.2819063, -1.062148, 0.654902, 1, 0, 1,
-0.7914779, 0.1180418, -2.116703, 0.6509804, 1, 0, 1,
-0.7885164, 0.6257517, -1.010502, 0.6431373, 1, 0, 1,
-0.7864245, -0.177308, -1.27901, 0.6392157, 1, 0, 1,
-0.7813278, 0.3533455, -2.291682, 0.6313726, 1, 0, 1,
-0.780167, 0.262727, -1.050393, 0.627451, 1, 0, 1,
-0.7787321, -0.4848071, -0.09848776, 0.6196079, 1, 0, 1,
-0.7772868, -0.3053083, -2.99872, 0.6156863, 1, 0, 1,
-0.7718607, 1.311046, -0.3541282, 0.6078432, 1, 0, 1,
-0.7703174, -0.2846512, -2.340347, 0.6039216, 1, 0, 1,
-0.7658199, 0.7689261, -0.1567541, 0.5960785, 1, 0, 1,
-0.7580639, 2.960472, -0.6169237, 0.5882353, 1, 0, 1,
-0.7574965, -1.772957, -3.210583, 0.5843138, 1, 0, 1,
-0.7428393, -0.08544976, -2.062597, 0.5764706, 1, 0, 1,
-0.738587, -0.07990088, -2.277309, 0.572549, 1, 0, 1,
-0.7352671, -0.4755204, -1.322828, 0.5647059, 1, 0, 1,
-0.7347597, -0.3817383, -2.155482, 0.5607843, 1, 0, 1,
-0.731537, -1.358173, -3.375427, 0.5529412, 1, 0, 1,
-0.7285486, -0.6318491, -3.156045, 0.5490196, 1, 0, 1,
-0.7241845, -0.4259045, -2.039793, 0.5411765, 1, 0, 1,
-0.7222325, 0.2987083, -1.614424, 0.5372549, 1, 0, 1,
-0.7191488, 0.2262369, -3.123719, 0.5294118, 1, 0, 1,
-0.7189006, -0.5467807, -2.584943, 0.5254902, 1, 0, 1,
-0.7176868, 0.7794434, -1.329279, 0.5176471, 1, 0, 1,
-0.7145793, -0.9620118, -2.707812, 0.5137255, 1, 0, 1,
-0.7141709, -0.4871233, -2.251873, 0.5058824, 1, 0, 1,
-0.7088089, 0.7732694, -1.941812, 0.5019608, 1, 0, 1,
-0.706211, -0.4124907, -4.201525, 0.4941176, 1, 0, 1,
-0.7044213, 1.489033, 0.04030096, 0.4862745, 1, 0, 1,
-0.7009846, -1.139155, -2.577916, 0.4823529, 1, 0, 1,
-0.6983662, -1.173787, -2.035152, 0.4745098, 1, 0, 1,
-0.6978825, -0.1437408, -1.865289, 0.4705882, 1, 0, 1,
-0.694442, 0.2429073, -0.9636828, 0.4627451, 1, 0, 1,
-0.686579, 2.085469, 0.825964, 0.4588235, 1, 0, 1,
-0.6839347, -1.369092, -3.789434, 0.4509804, 1, 0, 1,
-0.6809367, 0.6941894, -2.564168, 0.4470588, 1, 0, 1,
-0.6797069, 1.007246, -1.151031, 0.4392157, 1, 0, 1,
-0.6774005, 0.1113168, 1.256701, 0.4352941, 1, 0, 1,
-0.6733867, -0.05307237, -0.08363713, 0.427451, 1, 0, 1,
-0.6629676, -0.7711178, -2.817486, 0.4235294, 1, 0, 1,
-0.6617808, 0.4018698, -0.9245702, 0.4156863, 1, 0, 1,
-0.6599155, -0.0366108, -1.059246, 0.4117647, 1, 0, 1,
-0.6592966, -1.44184, -3.813984, 0.4039216, 1, 0, 1,
-0.6419893, 0.0947936, -2.442091, 0.3960784, 1, 0, 1,
-0.6397243, -1.131225, -3.206027, 0.3921569, 1, 0, 1,
-0.6375445, -1.269065, -3.708877, 0.3843137, 1, 0, 1,
-0.6328301, -0.02595945, -0.4164976, 0.3803922, 1, 0, 1,
-0.6327551, -0.3893636, -1.820065, 0.372549, 1, 0, 1,
-0.631462, 2.5116, -1.438324, 0.3686275, 1, 0, 1,
-0.621367, -0.9263938, -2.839791, 0.3607843, 1, 0, 1,
-0.6198401, -0.6749077, -1.570139, 0.3568628, 1, 0, 1,
-0.6159753, -2.128891, -2.923222, 0.3490196, 1, 0, 1,
-0.6156408, -2.5996, -2.816278, 0.345098, 1, 0, 1,
-0.6152816, 0.7560716, -1.048966, 0.3372549, 1, 0, 1,
-0.6140777, -0.2163817, -1.322154, 0.3333333, 1, 0, 1,
-0.6128888, 0.4100972, 0.3052623, 0.3254902, 1, 0, 1,
-0.6116991, -0.8382596, -1.725121, 0.3215686, 1, 0, 1,
-0.6114504, -0.6150896, -0.9655483, 0.3137255, 1, 0, 1,
-0.6085476, 0.06953453, -2.360471, 0.3098039, 1, 0, 1,
-0.6038672, 1.021757, 0.5443618, 0.3019608, 1, 0, 1,
-0.6028367, -0.09782704, -1.789768, 0.2941177, 1, 0, 1,
-0.600886, -0.4925482, -2.279845, 0.2901961, 1, 0, 1,
-0.5991093, 1.1323, 2.146683, 0.282353, 1, 0, 1,
-0.5959257, -0.226133, -2.177935, 0.2784314, 1, 0, 1,
-0.5932934, -0.3387348, -1.20614, 0.2705882, 1, 0, 1,
-0.5926234, -0.9139072, -1.422066, 0.2666667, 1, 0, 1,
-0.5842854, 0.888338, -1.144864, 0.2588235, 1, 0, 1,
-0.5837879, -0.05092659, -1.421323, 0.254902, 1, 0, 1,
-0.5776005, 1.829966, 0.1087273, 0.2470588, 1, 0, 1,
-0.5775523, -0.5623736, -1.158735, 0.2431373, 1, 0, 1,
-0.5721198, -0.5662342, -2.047959, 0.2352941, 1, 0, 1,
-0.5700323, 1.03966, -1.119434, 0.2313726, 1, 0, 1,
-0.5700112, 0.03278425, -1.695111, 0.2235294, 1, 0, 1,
-0.565445, -0.2448806, -2.898676, 0.2196078, 1, 0, 1,
-0.5535536, -0.08282669, -1.82824, 0.2117647, 1, 0, 1,
-0.5520678, 0.2305242, -0.4933286, 0.2078431, 1, 0, 1,
-0.5490743, -1.236116, -3.373425, 0.2, 1, 0, 1,
-0.5488528, -0.7117429, -1.693541, 0.1921569, 1, 0, 1,
-0.5465477, 1.058664, -1.896391, 0.1882353, 1, 0, 1,
-0.5370511, 0.3737682, 1.506538, 0.1803922, 1, 0, 1,
-0.5310848, -0.5929949, -1.543254, 0.1764706, 1, 0, 1,
-0.5298839, -1.358543, -2.2729, 0.1686275, 1, 0, 1,
-0.5264097, 0.827417, -0.7684034, 0.1647059, 1, 0, 1,
-0.5262979, -0.6983892, -5.010652, 0.1568628, 1, 0, 1,
-0.5262734, 1.907076, -0.6826078, 0.1529412, 1, 0, 1,
-0.5251383, 0.4012107, 0.03417965, 0.145098, 1, 0, 1,
-0.5223929, 0.03506782, -1.175384, 0.1411765, 1, 0, 1,
-0.5158474, 1.063613, 1.278453, 0.1333333, 1, 0, 1,
-0.5010527, 0.729163, 0.8117912, 0.1294118, 1, 0, 1,
-0.499893, 1.64814, 1.676742, 0.1215686, 1, 0, 1,
-0.4932904, -0.2274492, -0.535762, 0.1176471, 1, 0, 1,
-0.4849377, 0.2558967, -0.7386234, 0.1098039, 1, 0, 1,
-0.4815274, 2.882918, -1.443088, 0.1058824, 1, 0, 1,
-0.4788393, -0.1745277, -1.079533, 0.09803922, 1, 0, 1,
-0.478125, -1.292925, -1.649996, 0.09019608, 1, 0, 1,
-0.4736207, -0.2357277, -2.213647, 0.08627451, 1, 0, 1,
-0.4734289, -1.102679, -2.901718, 0.07843138, 1, 0, 1,
-0.4713466, 1.381126, -1.229227, 0.07450981, 1, 0, 1,
-0.4697994, -0.3815909, -3.968807, 0.06666667, 1, 0, 1,
-0.4680478, -0.9724281, -2.034037, 0.0627451, 1, 0, 1,
-0.4633239, 0.3212108, -2.074038, 0.05490196, 1, 0, 1,
-0.4629357, 0.1753901, -1.599556, 0.05098039, 1, 0, 1,
-0.4614044, -0.8369138, -3.305931, 0.04313726, 1, 0, 1,
-0.4585461, 2.392467, -0.6871331, 0.03921569, 1, 0, 1,
-0.4572306, -1.256799, -2.95217, 0.03137255, 1, 0, 1,
-0.4558044, -1.104177, -3.22406, 0.02745098, 1, 0, 1,
-0.454808, 0.5864223, -0.2779768, 0.01960784, 1, 0, 1,
-0.4515098, 0.7230427, -2.039388, 0.01568628, 1, 0, 1,
-0.4496817, -0.7492911, -3.331217, 0.007843138, 1, 0, 1,
-0.4481883, 0.4028758, -0.6745517, 0.003921569, 1, 0, 1,
-0.4430023, 0.518375, -3.95492, 0, 1, 0.003921569, 1,
-0.4408957, 0.5976718, -0.9411961, 0, 1, 0.01176471, 1,
-0.4398219, -2.024903, -1.346371, 0, 1, 0.01568628, 1,
-0.4376735, 0.1651472, -0.5121098, 0, 1, 0.02352941, 1,
-0.4305044, -0.02482995, 0.07789928, 0, 1, 0.02745098, 1,
-0.4304988, 0.8012097, -0.5212104, 0, 1, 0.03529412, 1,
-0.4302327, 0.663402, 2.047227, 0, 1, 0.03921569, 1,
-0.4269356, -0.2557444, -1.57599, 0, 1, 0.04705882, 1,
-0.4156936, -0.05551666, 0.4293408, 0, 1, 0.05098039, 1,
-0.4125875, 1.381468, -0.7933844, 0, 1, 0.05882353, 1,
-0.4114611, 0.4083953, 0.62653, 0, 1, 0.0627451, 1,
-0.4014863, -2.657411, -4.297227, 0, 1, 0.07058824, 1,
-0.3945228, -0.1155695, -2.532097, 0, 1, 0.07450981, 1,
-0.3942053, 1.128764, -1.213699, 0, 1, 0.08235294, 1,
-0.3924961, -0.4382106, -3.764529, 0, 1, 0.08627451, 1,
-0.3921151, 1.415291, -1.29239, 0, 1, 0.09411765, 1,
-0.3886786, 1.057743, -0.9251413, 0, 1, 0.1019608, 1,
-0.3865638, -1.138828, -2.514404, 0, 1, 0.1058824, 1,
-0.3838174, -0.9754233, -2.709008, 0, 1, 0.1137255, 1,
-0.3833738, -0.003805883, -0.2678794, 0, 1, 0.1176471, 1,
-0.3818876, 1.626788, 2.451204, 0, 1, 0.1254902, 1,
-0.377785, 1.85683, 0.08830892, 0, 1, 0.1294118, 1,
-0.374588, 0.6389635, -0.899497, 0, 1, 0.1372549, 1,
-0.3744611, 0.4608, 0.8541685, 0, 1, 0.1411765, 1,
-0.3686189, 0.4990864, -0.5514944, 0, 1, 0.1490196, 1,
-0.3666398, -1.044641, -3.610687, 0, 1, 0.1529412, 1,
-0.3664842, 0.3649979, -0.9918205, 0, 1, 0.1607843, 1,
-0.3623868, 0.5704782, -0.728234, 0, 1, 0.1647059, 1,
-0.3599891, 0.9761382, -0.4437602, 0, 1, 0.172549, 1,
-0.356617, -0.3829684, -2.197971, 0, 1, 0.1764706, 1,
-0.3547335, -0.1213878, -1.995342, 0, 1, 0.1843137, 1,
-0.3500765, -0.6667867, -3.229201, 0, 1, 0.1882353, 1,
-0.3473922, 1.116429, -0.9717981, 0, 1, 0.1960784, 1,
-0.3462491, -0.6584866, -2.796317, 0, 1, 0.2039216, 1,
-0.3442269, 1.299992, -0.631469, 0, 1, 0.2078431, 1,
-0.3409684, -0.8184798, -3.800403, 0, 1, 0.2156863, 1,
-0.3392024, 0.4430853, 0.3478729, 0, 1, 0.2196078, 1,
-0.3391784, 1.597565, 0.3651003, 0, 1, 0.227451, 1,
-0.333535, 0.3172689, -0.8709304, 0, 1, 0.2313726, 1,
-0.3316936, -0.9062093, -3.955234, 0, 1, 0.2392157, 1,
-0.3306372, -0.7669109, -3.803932, 0, 1, 0.2431373, 1,
-0.330615, 0.6436256, -0.08908479, 0, 1, 0.2509804, 1,
-0.3230187, -0.953084, -0.887364, 0, 1, 0.254902, 1,
-0.3180019, -0.5987984, -3.133718, 0, 1, 0.2627451, 1,
-0.3176401, 0.6210622, 0.4940445, 0, 1, 0.2666667, 1,
-0.3162506, 0.3799087, -2.110589, 0, 1, 0.2745098, 1,
-0.3156331, 0.757769, -1.210379, 0, 1, 0.2784314, 1,
-0.3141899, 1.174248, -1.279336, 0, 1, 0.2862745, 1,
-0.3117193, -0.006779544, -2.515882, 0, 1, 0.2901961, 1,
-0.3088919, 1.219939, -0.3296826, 0, 1, 0.2980392, 1,
-0.3087302, -0.2249124, -3.674776, 0, 1, 0.3058824, 1,
-0.3086288, -0.2895508, -2.467722, 0, 1, 0.3098039, 1,
-0.3059377, -1.954588, -3.193519, 0, 1, 0.3176471, 1,
-0.3057336, 0.7707831, -0.9671988, 0, 1, 0.3215686, 1,
-0.3051801, -1.002156, -2.32139, 0, 1, 0.3294118, 1,
-0.3023664, 0.4133554, -0.7799389, 0, 1, 0.3333333, 1,
-0.2986535, 0.1511451, -0.07573339, 0, 1, 0.3411765, 1,
-0.2952914, -0.9527885, -2.553891, 0, 1, 0.345098, 1,
-0.2886778, -0.3388366, -2.663529, 0, 1, 0.3529412, 1,
-0.2876563, 1.437111, -1.515237, 0, 1, 0.3568628, 1,
-0.2876436, -1.137846, -3.25194, 0, 1, 0.3647059, 1,
-0.2832655, 1.501901, 0.179455, 0, 1, 0.3686275, 1,
-0.2777224, -0.1186781, -1.316035, 0, 1, 0.3764706, 1,
-0.2666133, -0.1780408, -1.03039, 0, 1, 0.3803922, 1,
-0.2660826, 0.2838157, 1.271444, 0, 1, 0.3882353, 1,
-0.265667, -0.08028601, -3.063114, 0, 1, 0.3921569, 1,
-0.2609608, -2.944608, -3.849536, 0, 1, 0.4, 1,
-0.2589389, 0.7076182, -0.8775659, 0, 1, 0.4078431, 1,
-0.2566325, 0.9727467, 0.1499342, 0, 1, 0.4117647, 1,
-0.2552181, -0.1216451, -2.79895, 0, 1, 0.4196078, 1,
-0.2550211, -0.6772279, -2.222389, 0, 1, 0.4235294, 1,
-0.2533277, -1.129624, -2.261714, 0, 1, 0.4313726, 1,
-0.2527951, -0.3566705, -2.233693, 0, 1, 0.4352941, 1,
-0.2446036, -0.1914961, -1.824914, 0, 1, 0.4431373, 1,
-0.2395162, -0.6435322, -2.586627, 0, 1, 0.4470588, 1,
-0.2367076, -0.4102514, -3.113736, 0, 1, 0.454902, 1,
-0.2312893, 0.3330124, -0.8013511, 0, 1, 0.4588235, 1,
-0.2310625, 0.4645403, -0.3193047, 0, 1, 0.4666667, 1,
-0.2272604, 1.371507, 1.446764, 0, 1, 0.4705882, 1,
-0.2257989, 0.47987, -0.1041302, 0, 1, 0.4784314, 1,
-0.2245352, 0.8344606, 0.4671645, 0, 1, 0.4823529, 1,
-0.2235024, -0.969113, -3.269368, 0, 1, 0.4901961, 1,
-0.2227917, 0.27441, -0.7472692, 0, 1, 0.4941176, 1,
-0.2218775, 1.015056, -1.037452, 0, 1, 0.5019608, 1,
-0.2208916, 0.386231, -1.011855, 0, 1, 0.509804, 1,
-0.2176083, -0.669459, -1.308486, 0, 1, 0.5137255, 1,
-0.2080327, 1.122861, -0.1972877, 0, 1, 0.5215687, 1,
-0.2052891, -0.4951557, -3.534906, 0, 1, 0.5254902, 1,
-0.2029317, 1.299203, 0.3664698, 0, 1, 0.5333334, 1,
-0.2001049, 0.8610653, 0.7755024, 0, 1, 0.5372549, 1,
-0.1993829, -1.717031, -3.643167, 0, 1, 0.5450981, 1,
-0.1982105, 0.731451, -2.362884, 0, 1, 0.5490196, 1,
-0.1907494, -1.282184, -4.305604, 0, 1, 0.5568628, 1,
-0.1901952, -0.9093839, -3.702949, 0, 1, 0.5607843, 1,
-0.1868822, -0.2793628, -1.555955, 0, 1, 0.5686275, 1,
-0.1867791, -0.4891901, -2.718629, 0, 1, 0.572549, 1,
-0.1839392, -0.5498086, -4.655791, 0, 1, 0.5803922, 1,
-0.1778292, -0.3065382, -1.790717, 0, 1, 0.5843138, 1,
-0.1733388, -1.895627, -1.809013, 0, 1, 0.5921569, 1,
-0.1711978, 0.1616713, -1.365452, 0, 1, 0.5960785, 1,
-0.1682745, -0.7305372, -2.704229, 0, 1, 0.6039216, 1,
-0.1671759, -0.6746451, -2.16878, 0, 1, 0.6117647, 1,
-0.1658397, -0.4402754, -3.599786, 0, 1, 0.6156863, 1,
-0.1639755, 0.3646511, -1.189487, 0, 1, 0.6235294, 1,
-0.1623136, -0.7614141, -3.57842, 0, 1, 0.627451, 1,
-0.1620316, -0.3417639, -3.280355, 0, 1, 0.6352941, 1,
-0.1612256, 2.139224, -0.3218197, 0, 1, 0.6392157, 1,
-0.1586585, 1.18688, 0.271567, 0, 1, 0.6470588, 1,
-0.1541173, -0.03368556, -1.615384, 0, 1, 0.6509804, 1,
-0.1515462, 0.9561556, -0.9852025, 0, 1, 0.6588235, 1,
-0.1507928, -0.2450694, -2.177343, 0, 1, 0.6627451, 1,
-0.1493539, -0.2776516, -2.997268, 0, 1, 0.6705883, 1,
-0.147254, -0.5188445, -4.314682, 0, 1, 0.6745098, 1,
-0.145697, 0.03805845, -0.06137275, 0, 1, 0.682353, 1,
-0.1416002, 0.2278388, -0.9069239, 0, 1, 0.6862745, 1,
-0.1407501, -0.9278641, -3.720578, 0, 1, 0.6941177, 1,
-0.1406626, -0.297016, -2.749758, 0, 1, 0.7019608, 1,
-0.1373955, 0.6664752, -0.3718413, 0, 1, 0.7058824, 1,
-0.1353729, 0.5652447, -0.1895934, 0, 1, 0.7137255, 1,
-0.1350952, -0.4762377, -1.786767, 0, 1, 0.7176471, 1,
-0.1329695, 0.1651252, -0.5332551, 0, 1, 0.7254902, 1,
-0.132635, 1.30151, 0.2483432, 0, 1, 0.7294118, 1,
-0.1320176, 0.6750128, 1.359322, 0, 1, 0.7372549, 1,
-0.1310943, 0.6922489, 0.6726889, 0, 1, 0.7411765, 1,
-0.1295531, -1.920779, -2.572479, 0, 1, 0.7490196, 1,
-0.1290959, 1.03604, -0.6465551, 0, 1, 0.7529412, 1,
-0.1272745, 1.21492, 1.400891, 0, 1, 0.7607843, 1,
-0.1226912, 1.452183, -0.2831275, 0, 1, 0.7647059, 1,
-0.1214074, -0.2395604, -4.632584, 0, 1, 0.772549, 1,
-0.1195979, -1.492854, -4.585022, 0, 1, 0.7764706, 1,
-0.1191985, -0.4950103, -2.481503, 0, 1, 0.7843137, 1,
-0.1133061, -0.1443171, -2.639638, 0, 1, 0.7882353, 1,
-0.1122522, -1.011652, -4.042521, 0, 1, 0.7960784, 1,
-0.1102458, 0.8563306, 0.2117508, 0, 1, 0.8039216, 1,
-0.1099019, 2.0157, -1.721122, 0, 1, 0.8078431, 1,
-0.1084394, -0.2232603, -2.81965, 0, 1, 0.8156863, 1,
-0.1079979, -1.111222, -2.348128, 0, 1, 0.8196079, 1,
-0.1073338, 1.921415, -0.2779638, 0, 1, 0.827451, 1,
-0.1051547, -0.1777627, -2.944467, 0, 1, 0.8313726, 1,
-0.1044225, 1.077532, 0.1359798, 0, 1, 0.8392157, 1,
-0.09497485, -1.126788, -4.087753, 0, 1, 0.8431373, 1,
-0.09341946, -0.9417495, -2.729772, 0, 1, 0.8509804, 1,
-0.09102795, 1.836365, -0.8583961, 0, 1, 0.854902, 1,
-0.08961327, -1.290158, -0.3388153, 0, 1, 0.8627451, 1,
-0.08579909, 0.5804303, -1.824108, 0, 1, 0.8666667, 1,
-0.0854822, -0.07892194, -1.598998, 0, 1, 0.8745098, 1,
-0.08483525, -1.280368, -4.228845, 0, 1, 0.8784314, 1,
-0.0809785, -0.09995984, -5.527119, 0, 1, 0.8862745, 1,
-0.08001848, 1.125261, -0.531055, 0, 1, 0.8901961, 1,
-0.07751403, 0.3269629, -0.6871017, 0, 1, 0.8980392, 1,
-0.07002948, -0.8895022, -2.987499, 0, 1, 0.9058824, 1,
-0.0680981, -0.3571825, -3.806573, 0, 1, 0.9098039, 1,
-0.06770244, -0.4340627, -3.251303, 0, 1, 0.9176471, 1,
-0.06217477, -0.1483946, -3.19805, 0, 1, 0.9215686, 1,
-0.05890201, -0.7476431, -3.272393, 0, 1, 0.9294118, 1,
-0.05533095, -0.4923901, -1.907197, 0, 1, 0.9333333, 1,
-0.04973302, 0.1000574, -0.4859985, 0, 1, 0.9411765, 1,
-0.04812824, 0.2656521, -0.3169568, 0, 1, 0.945098, 1,
-0.0439108, -1.194764, -2.739744, 0, 1, 0.9529412, 1,
-0.03945165, -1.07086, -4.563154, 0, 1, 0.9568627, 1,
-0.0386057, -0.5969426, -3.884244, 0, 1, 0.9647059, 1,
-0.03492927, -1.337297, -4.682514, 0, 1, 0.9686275, 1,
-0.03418653, -0.3197307, -0.6279221, 0, 1, 0.9764706, 1,
-0.03410817, -0.705618, -1.834553, 0, 1, 0.9803922, 1,
-0.03396837, 1.543254, 0.3286021, 0, 1, 0.9882353, 1,
-0.03268111, 0.2287788, -0.01966138, 0, 1, 0.9921569, 1,
-0.0316758, 0.8186967, 1.240813, 0, 1, 1, 1,
-0.03068651, -1.111107, -2.570851, 0, 0.9921569, 1, 1,
-0.02824162, -1.110625, -2.505064, 0, 0.9882353, 1, 1,
-0.02638846, -1.010329, -3.357256, 0, 0.9803922, 1, 1,
-0.02427618, -0.3845229, -2.807398, 0, 0.9764706, 1, 1,
-0.02425415, -0.2469026, -5.068823, 0, 0.9686275, 1, 1,
-0.01802371, -1.630218, -2.092425, 0, 0.9647059, 1, 1,
-0.01692347, 0.612393, -0.2058569, 0, 0.9568627, 1, 1,
-0.01676724, -0.9718559, -1.996496, 0, 0.9529412, 1, 1,
-0.01545151, -0.6166407, -1.364088, 0, 0.945098, 1, 1,
-0.01543578, -0.4945017, -4.227392, 0, 0.9411765, 1, 1,
-0.01472331, 0.02783347, 0.08953118, 0, 0.9333333, 1, 1,
-0.0125884, 1.183613, 0.7281763, 0, 0.9294118, 1, 1,
-0.01258793, -1.033654, -2.860087, 0, 0.9215686, 1, 1,
-0.008400586, 1.255082, -0.5945175, 0, 0.9176471, 1, 1,
-0.006551261, -1.152715, -2.82092, 0, 0.9098039, 1, 1,
4.410897e-05, -0.6734068, 2.512715, 0, 0.9058824, 1, 1,
0.002657169, 0.553169, 0.2598482, 0, 0.8980392, 1, 1,
0.003837378, 1.271015, -0.1395896, 0, 0.8901961, 1, 1,
0.01381983, 0.02827639, 0.9992749, 0, 0.8862745, 1, 1,
0.01386117, 0.5340252, -0.5584944, 0, 0.8784314, 1, 1,
0.01637737, -1.117757, 2.968356, 0, 0.8745098, 1, 1,
0.01794672, -0.2213833, 1.115024, 0, 0.8666667, 1, 1,
0.02197938, 1.534359, -0.9585859, 0, 0.8627451, 1, 1,
0.03337059, -0.227651, 0.7641221, 0, 0.854902, 1, 1,
0.03809857, 0.1145925, 0.04822915, 0, 0.8509804, 1, 1,
0.04154866, 0.4058839, -0.8198264, 0, 0.8431373, 1, 1,
0.04370792, -0.7531322, 4.464575, 0, 0.8392157, 1, 1,
0.04495587, 0.9059303, -0.6545781, 0, 0.8313726, 1, 1,
0.04697348, -0.3379012, 3.922497, 0, 0.827451, 1, 1,
0.05101907, 0.7086456, 0.7168505, 0, 0.8196079, 1, 1,
0.05340829, 1.179335, 0.3119172, 0, 0.8156863, 1, 1,
0.05720603, -0.7599043, 3.415683, 0, 0.8078431, 1, 1,
0.05743969, -1.202769, 2.776271, 0, 0.8039216, 1, 1,
0.05794492, -0.7613352, 2.920796, 0, 0.7960784, 1, 1,
0.072915, -0.03225242, 1.79709, 0, 0.7882353, 1, 1,
0.07548773, -1.223809, 4.473184, 0, 0.7843137, 1, 1,
0.07684833, 2.627749, -2.774972, 0, 0.7764706, 1, 1,
0.08137839, 1.126971, 1.83708, 0, 0.772549, 1, 1,
0.08141309, 0.9889412, 1.191268, 0, 0.7647059, 1, 1,
0.08230701, -0.9401415, 4.935831, 0, 0.7607843, 1, 1,
0.08387729, -0.7908958, 3.445724, 0, 0.7529412, 1, 1,
0.08826255, 0.9480624, -0.633684, 0, 0.7490196, 1, 1,
0.09596422, -0.2596681, 3.168228, 0, 0.7411765, 1, 1,
0.09910917, 1.136711, 2.240525, 0, 0.7372549, 1, 1,
0.1007382, -1.004534, 2.786192, 0, 0.7294118, 1, 1,
0.1047129, -0.3254591, 4.046712, 0, 0.7254902, 1, 1,
0.1057298, 0.8611833, 1.222674, 0, 0.7176471, 1, 1,
0.1074185, -0.1960731, 2.002879, 0, 0.7137255, 1, 1,
0.1086777, -0.5647284, 3.3318, 0, 0.7058824, 1, 1,
0.1124496, -0.1128474, 3.075574, 0, 0.6980392, 1, 1,
0.1166974, -0.9772033, 2.852817, 0, 0.6941177, 1, 1,
0.1176608, -0.2078304, 2.157613, 0, 0.6862745, 1, 1,
0.1207951, 0.2386005, 0.2774036, 0, 0.682353, 1, 1,
0.1227927, 0.02332204, 1.201339, 0, 0.6745098, 1, 1,
0.122832, 0.5821736, 2.156864, 0, 0.6705883, 1, 1,
0.1240432, 0.3721298, -0.6816258, 0, 0.6627451, 1, 1,
0.1260023, -0.2790717, 3.903383, 0, 0.6588235, 1, 1,
0.1280521, 0.03564364, 1.618536, 0, 0.6509804, 1, 1,
0.1283525, -0.425068, 1.845993, 0, 0.6470588, 1, 1,
0.1299914, -0.6575366, 2.823871, 0, 0.6392157, 1, 1,
0.1339927, -0.3316128, 3.394461, 0, 0.6352941, 1, 1,
0.135953, -2.050128, 3.398275, 0, 0.627451, 1, 1,
0.1413962, 0.2695042, -0.8323226, 0, 0.6235294, 1, 1,
0.1460142, -1.96826, 3.137902, 0, 0.6156863, 1, 1,
0.157314, 0.699089, -0.4130619, 0, 0.6117647, 1, 1,
0.1576725, -0.6097455, 2.866804, 0, 0.6039216, 1, 1,
0.1605774, 0.8535137, 0.1243306, 0, 0.5960785, 1, 1,
0.1637484, -0.7200062, 3.2899, 0, 0.5921569, 1, 1,
0.1678996, -0.9650511, 1.483714, 0, 0.5843138, 1, 1,
0.1708279, -0.6241263, 2.879013, 0, 0.5803922, 1, 1,
0.1715626, 0.5334166, 1.000737, 0, 0.572549, 1, 1,
0.1734053, -1.088061, 1.91391, 0, 0.5686275, 1, 1,
0.1738068, 1.096442, 1.618869, 0, 0.5607843, 1, 1,
0.1797806, -1.038986, 2.296373, 0, 0.5568628, 1, 1,
0.1905112, -0.4966285, 3.265675, 0, 0.5490196, 1, 1,
0.1927147, 0.822382, 0.6434068, 0, 0.5450981, 1, 1,
0.1964565, -0.2470621, 2.283283, 0, 0.5372549, 1, 1,
0.2020375, 2.073424, -0.4587519, 0, 0.5333334, 1, 1,
0.2062799, -0.5877308, 3.940305, 0, 0.5254902, 1, 1,
0.2080043, 0.3927076, 0.004184422, 0, 0.5215687, 1, 1,
0.2081379, 0.5090618, 0.6806926, 0, 0.5137255, 1, 1,
0.208167, -0.7482792, 2.8306, 0, 0.509804, 1, 1,
0.2103115, 1.907622, -1.243629, 0, 0.5019608, 1, 1,
0.2110988, 0.4026691, 1.373036, 0, 0.4941176, 1, 1,
0.2136088, 1.043826, 1.190064, 0, 0.4901961, 1, 1,
0.2158959, 1.006474, -0.4059775, 0, 0.4823529, 1, 1,
0.2206851, 1.687886, -0.2144421, 0, 0.4784314, 1, 1,
0.2242239, 0.5136858, 2.376044, 0, 0.4705882, 1, 1,
0.224494, 0.007105287, 1.294753, 0, 0.4666667, 1, 1,
0.2257966, -0.05743649, 0.9055607, 0, 0.4588235, 1, 1,
0.232986, 1.389627, 1.435071, 0, 0.454902, 1, 1,
0.2333514, 0.4126003, -0.4356152, 0, 0.4470588, 1, 1,
0.2352385, 1.187259, -0.8586375, 0, 0.4431373, 1, 1,
0.2358132, 0.7602008, 0.8836512, 0, 0.4352941, 1, 1,
0.2358826, -0.5512754, 1.82668, 0, 0.4313726, 1, 1,
0.236438, 0.3601915, 0.5723553, 0, 0.4235294, 1, 1,
0.2400557, -0.1134809, 3.800424, 0, 0.4196078, 1, 1,
0.24281, 0.7377085, 1.463495, 0, 0.4117647, 1, 1,
0.2498585, -1.111919, 4.80321, 0, 0.4078431, 1, 1,
0.2509731, -1.234328, 4.268916, 0, 0.4, 1, 1,
0.2537594, -1.527999, 3.416062, 0, 0.3921569, 1, 1,
0.2586133, -0.2770706, 3.59193, 0, 0.3882353, 1, 1,
0.2608792, -0.5940185, 2.680523, 0, 0.3803922, 1, 1,
0.2617055, 0.4694359, 1.54271, 0, 0.3764706, 1, 1,
0.2650752, 2.044037, 0.2259306, 0, 0.3686275, 1, 1,
0.2657435, -1.170272, 4.108184, 0, 0.3647059, 1, 1,
0.2682522, 1.234638, -0.5683585, 0, 0.3568628, 1, 1,
0.2790746, 0.7366061, -1.234437, 0, 0.3529412, 1, 1,
0.2828165, 0.3302777, 0.6384664, 0, 0.345098, 1, 1,
0.2846251, -0.1552895, 3.036403, 0, 0.3411765, 1, 1,
0.2849109, 1.144045, -0.7874099, 0, 0.3333333, 1, 1,
0.2849952, 0.4378537, 0.04451078, 0, 0.3294118, 1, 1,
0.285007, 0.105559, -0.6912754, 0, 0.3215686, 1, 1,
0.2861187, -1.244027, 2.640293, 0, 0.3176471, 1, 1,
0.2867718, 0.09164127, 1.639221, 0, 0.3098039, 1, 1,
0.2873034, -0.3676615, 3.471149, 0, 0.3058824, 1, 1,
0.2874772, -0.5666065, 2.618376, 0, 0.2980392, 1, 1,
0.2933042, 0.7875159, 0.8485256, 0, 0.2901961, 1, 1,
0.2970898, -0.7390711, 3.333975, 0, 0.2862745, 1, 1,
0.2981078, -0.3507305, 1.810844, 0, 0.2784314, 1, 1,
0.3006826, -0.5212426, 2.65362, 0, 0.2745098, 1, 1,
0.3069536, 1.01371, 0.8248302, 0, 0.2666667, 1, 1,
0.3078221, 1.07725, -1.178435, 0, 0.2627451, 1, 1,
0.3136925, -0.8283845, 3.355072, 0, 0.254902, 1, 1,
0.3154126, -0.1945869, 1.622934, 0, 0.2509804, 1, 1,
0.3170083, 0.3965226, 1.278568, 0, 0.2431373, 1, 1,
0.3285701, 0.8546206, 1.021884, 0, 0.2392157, 1, 1,
0.3350983, -0.4463158, 5.224243, 0, 0.2313726, 1, 1,
0.3422956, -0.1514147, 2.877334, 0, 0.227451, 1, 1,
0.3430183, -0.2743289, 2.64905, 0, 0.2196078, 1, 1,
0.3508325, 0.8270052, 0.7734147, 0, 0.2156863, 1, 1,
0.3624441, 0.9515219, -1.117505, 0, 0.2078431, 1, 1,
0.3627429, -0.3862763, 2.645539, 0, 0.2039216, 1, 1,
0.3628502, -0.397058, 0.1933393, 0, 0.1960784, 1, 1,
0.3639138, 0.3571907, -0.9318122, 0, 0.1882353, 1, 1,
0.3648556, 0.4452656, -0.9474711, 0, 0.1843137, 1, 1,
0.3652413, 0.9205233, 1.147813, 0, 0.1764706, 1, 1,
0.3659937, -0.1845243, 1.449032, 0, 0.172549, 1, 1,
0.3679948, 1.292014, -0.3514103, 0, 0.1647059, 1, 1,
0.3688433, 0.7926332, 0.9752446, 0, 0.1607843, 1, 1,
0.369568, -0.54519, 1.78051, 0, 0.1529412, 1, 1,
0.3711685, -0.1194075, 1.517019, 0, 0.1490196, 1, 1,
0.3769791, -1.421696, 2.362885, 0, 0.1411765, 1, 1,
0.3801228, 1.14241, 1.53347, 0, 0.1372549, 1, 1,
0.3805666, 1.087783, -0.2839089, 0, 0.1294118, 1, 1,
0.3820085, 0.5805364, -0.8804366, 0, 0.1254902, 1, 1,
0.3820147, 0.6889673, -0.5889102, 0, 0.1176471, 1, 1,
0.3858969, 0.4295454, -0.102223, 0, 0.1137255, 1, 1,
0.387851, 2.039365, -2.076923, 0, 0.1058824, 1, 1,
0.3888424, 0.8407485, 1.16426, 0, 0.09803922, 1, 1,
0.3979759, 1.355471, 0.4680288, 0, 0.09411765, 1, 1,
0.3999494, -0.6608265, 1.380715, 0, 0.08627451, 1, 1,
0.4003877, 0.3951801, -0.2852804, 0, 0.08235294, 1, 1,
0.4030956, -0.04748326, 3.730808, 0, 0.07450981, 1, 1,
0.4056288, -0.3825842, 1.460959, 0, 0.07058824, 1, 1,
0.406286, -0.3660173, 2.627144, 0, 0.0627451, 1, 1,
0.4068846, -0.09294446, 3.940293, 0, 0.05882353, 1, 1,
0.4081115, 0.3455141, 1.724116, 0, 0.05098039, 1, 1,
0.4095976, -1.042633, 2.159378, 0, 0.04705882, 1, 1,
0.4154005, -0.6669915, 2.214386, 0, 0.03921569, 1, 1,
0.4164746, -1.575582, 3.492525, 0, 0.03529412, 1, 1,
0.4169354, -0.500238, 2.484884, 0, 0.02745098, 1, 1,
0.4243433, 0.2924232, 0.2409105, 0, 0.02352941, 1, 1,
0.4264509, 0.9892679, 0.775622, 0, 0.01568628, 1, 1,
0.4353382, -1.188943, 2.470413, 0, 0.01176471, 1, 1,
0.4403037, 1.014668, 0.8628137, 0, 0.003921569, 1, 1,
0.4417589, 0.4091659, 0.7162156, 0.003921569, 0, 1, 1,
0.4457712, 0.6327113, 1.316493, 0.007843138, 0, 1, 1,
0.4504848, 0.7577559, -1.38469, 0.01568628, 0, 1, 1,
0.4534153, 0.6810725, 0.7309837, 0.01960784, 0, 1, 1,
0.4560204, 1.719291, 0.5951478, 0.02745098, 0, 1, 1,
0.4570836, -0.01814482, 0.5901687, 0.03137255, 0, 1, 1,
0.459734, 1.045684, -0.2983291, 0.03921569, 0, 1, 1,
0.4632658, 0.8735303, 1.152172, 0.04313726, 0, 1, 1,
0.4665665, 1.137622, 0.09069775, 0.05098039, 0, 1, 1,
0.4666317, -0.2097795, 1.442443, 0.05490196, 0, 1, 1,
0.4742962, 0.7540879, 0.5301592, 0.0627451, 0, 1, 1,
0.4768511, -0.6209093, 2.274236, 0.06666667, 0, 1, 1,
0.4789441, -0.9082539, 2.338978, 0.07450981, 0, 1, 1,
0.4912211, 0.264425, -0.06154551, 0.07843138, 0, 1, 1,
0.4924097, 0.8415427, -1.423931, 0.08627451, 0, 1, 1,
0.4928224, -0.1265675, 1.050151, 0.09019608, 0, 1, 1,
0.4947128, -1.699053, 3.610478, 0.09803922, 0, 1, 1,
0.4952143, -0.189566, 3.021966, 0.1058824, 0, 1, 1,
0.4962659, -1.750879, 2.166953, 0.1098039, 0, 1, 1,
0.496989, 0.3782777, 0.02982701, 0.1176471, 0, 1, 1,
0.4973707, -0.4617883, 2.009425, 0.1215686, 0, 1, 1,
0.4977899, -0.4530182, 1.369867, 0.1294118, 0, 1, 1,
0.4988052, 0.9184793, 2.505921, 0.1333333, 0, 1, 1,
0.5046152, 0.5117746, 0.6608317, 0.1411765, 0, 1, 1,
0.5067106, -0.709837, 3.228552, 0.145098, 0, 1, 1,
0.510483, 1.942001, 2.34094, 0.1529412, 0, 1, 1,
0.5106119, 0.4174848, -0.2748399, 0.1568628, 0, 1, 1,
0.5120594, 0.3616248, 0.19771, 0.1647059, 0, 1, 1,
0.5134192, 0.01377637, 2.481017, 0.1686275, 0, 1, 1,
0.5161945, -1.173156, 2.766324, 0.1764706, 0, 1, 1,
0.5175808, 1.523287, -0.5784274, 0.1803922, 0, 1, 1,
0.51939, 0.5487623, 0.7360308, 0.1882353, 0, 1, 1,
0.5202568, 1.130191, 1.764207, 0.1921569, 0, 1, 1,
0.5243887, -0.01325338, 1.649699, 0.2, 0, 1, 1,
0.5245408, 0.5805726, -0.2763632, 0.2078431, 0, 1, 1,
0.5261171, -1.324247, 3.577262, 0.2117647, 0, 1, 1,
0.5268626, 0.4015744, 0.6302789, 0.2196078, 0, 1, 1,
0.5319822, -1.086986, 2.383725, 0.2235294, 0, 1, 1,
0.5336708, -0.4709683, 3.275238, 0.2313726, 0, 1, 1,
0.5341638, -0.6431615, 2.978666, 0.2352941, 0, 1, 1,
0.5359133, 1.361095, -0.7388013, 0.2431373, 0, 1, 1,
0.53686, -1.213468, 2.572481, 0.2470588, 0, 1, 1,
0.5400147, -0.4380477, 2.188472, 0.254902, 0, 1, 1,
0.5402446, 0.3097303, 1.874295, 0.2588235, 0, 1, 1,
0.541572, 0.3403315, 0.6162881, 0.2666667, 0, 1, 1,
0.5436164, -0.7350661, 2.840898, 0.2705882, 0, 1, 1,
0.5463336, 0.9771612, -0.3686246, 0.2784314, 0, 1, 1,
0.5487448, -0.4319102, 2.894207, 0.282353, 0, 1, 1,
0.5497609, -1.182063, 1.586025, 0.2901961, 0, 1, 1,
0.5507004, -0.6250213, 1.984369, 0.2941177, 0, 1, 1,
0.5531516, 0.1508658, 1.150609, 0.3019608, 0, 1, 1,
0.5537282, 1.498303, 0.9150602, 0.3098039, 0, 1, 1,
0.5562046, 0.8689111, -0.6601461, 0.3137255, 0, 1, 1,
0.5562714, -0.22198, 2.733768, 0.3215686, 0, 1, 1,
0.5648649, -0.2462002, 2.719146, 0.3254902, 0, 1, 1,
0.5680454, -0.7603481, 2.379203, 0.3333333, 0, 1, 1,
0.5695287, 0.3599627, 1.723914, 0.3372549, 0, 1, 1,
0.5749124, -0.7226549, 0.9635758, 0.345098, 0, 1, 1,
0.5775801, 0.1449608, 2.533498, 0.3490196, 0, 1, 1,
0.5794751, -2.760179, 2.176854, 0.3568628, 0, 1, 1,
0.5802758, 0.6568618, 0.6161705, 0.3607843, 0, 1, 1,
0.5805519, -0.8312464, 3.428272, 0.3686275, 0, 1, 1,
0.5818586, 0.3398658, 1.390367, 0.372549, 0, 1, 1,
0.582052, -3.237316, 2.227995, 0.3803922, 0, 1, 1,
0.5839453, 1.231561, 1.874265, 0.3843137, 0, 1, 1,
0.590057, -0.2144564, 2.41836, 0.3921569, 0, 1, 1,
0.5998457, 0.2338154, 1.287306, 0.3960784, 0, 1, 1,
0.6029874, -0.2029567, 3.309175, 0.4039216, 0, 1, 1,
0.6085824, 0.2621175, 1.940244, 0.4117647, 0, 1, 1,
0.6114824, -0.8912514, 0.4835434, 0.4156863, 0, 1, 1,
0.6164247, -1.396535, 2.431302, 0.4235294, 0, 1, 1,
0.6329242, 2.340779, 0.2596596, 0.427451, 0, 1, 1,
0.6346919, -1.651668, 1.753839, 0.4352941, 0, 1, 1,
0.6370101, 0.03964352, 1.753817, 0.4392157, 0, 1, 1,
0.639295, -1.199951, 2.565952, 0.4470588, 0, 1, 1,
0.6559467, 0.4669769, 1.084557, 0.4509804, 0, 1, 1,
0.6568307, -0.6178014, 2.915687, 0.4588235, 0, 1, 1,
0.6590742, -0.7338386, 3.907197, 0.4627451, 0, 1, 1,
0.6616939, -1.18572, 1.681839, 0.4705882, 0, 1, 1,
0.6664131, 1.215229, 0.6328064, 0.4745098, 0, 1, 1,
0.6683271, 0.08362065, 2.963768, 0.4823529, 0, 1, 1,
0.6719874, -0.8363618, 0.3880707, 0.4862745, 0, 1, 1,
0.6721192, 0.0930251, -0.03724965, 0.4941176, 0, 1, 1,
0.6735394, -0.6582311, 3.888211, 0.5019608, 0, 1, 1,
0.6783179, 0.7659387, 1.263442, 0.5058824, 0, 1, 1,
0.6789124, -0.7063586, 2.179163, 0.5137255, 0, 1, 1,
0.6796829, 0.3857254, -0.1774316, 0.5176471, 0, 1, 1,
0.6818, 2.223412, 0.75796, 0.5254902, 0, 1, 1,
0.6881397, -1.304353, 3.431744, 0.5294118, 0, 1, 1,
0.6936045, 1.623153, 0.9104363, 0.5372549, 0, 1, 1,
0.694757, -0.2579255, 0.7475492, 0.5411765, 0, 1, 1,
0.6972576, 0.8641443, -0.009508158, 0.5490196, 0, 1, 1,
0.697657, 0.2378384, 1.311224, 0.5529412, 0, 1, 1,
0.6996545, -0.1907916, 2.030114, 0.5607843, 0, 1, 1,
0.7058054, -0.0458875, 3.6616, 0.5647059, 0, 1, 1,
0.7081532, -0.03844576, 2.836365, 0.572549, 0, 1, 1,
0.7339097, 0.7144023, 0.6925448, 0.5764706, 0, 1, 1,
0.7346957, -0.005541888, 2.121918, 0.5843138, 0, 1, 1,
0.7380003, -0.6704903, 3.829291, 0.5882353, 0, 1, 1,
0.741787, -0.3126112, 3.085958, 0.5960785, 0, 1, 1,
0.7449524, 2.68671, 2.377459, 0.6039216, 0, 1, 1,
0.7552077, 0.03159289, 2.500133, 0.6078432, 0, 1, 1,
0.7568033, -0.1414057, 1.359714, 0.6156863, 0, 1, 1,
0.7665248, 0.1923307, 2.733679, 0.6196079, 0, 1, 1,
0.7679067, 0.1753233, 1.156618, 0.627451, 0, 1, 1,
0.7684116, -0.3308038, 3.444132, 0.6313726, 0, 1, 1,
0.7684767, -0.01507602, 1.615384, 0.6392157, 0, 1, 1,
0.768584, 0.2672842, 0.2757542, 0.6431373, 0, 1, 1,
0.7687351, -0.7701471, 1.4621, 0.6509804, 0, 1, 1,
0.7702534, -0.7176855, 0.917369, 0.654902, 0, 1, 1,
0.77125, -0.4213136, 3.244769, 0.6627451, 0, 1, 1,
0.7718808, 0.5244359, 2.070073, 0.6666667, 0, 1, 1,
0.7720526, -0.1005865, 3.106231, 0.6745098, 0, 1, 1,
0.7731333, 0.3078718, 0.5986494, 0.6784314, 0, 1, 1,
0.7760961, -0.5528091, 2.256588, 0.6862745, 0, 1, 1,
0.7772433, 0.5617703, 2.18548, 0.6901961, 0, 1, 1,
0.7883819, 0.4047202, 1.650519, 0.6980392, 0, 1, 1,
0.7940818, 2.543838, -0.1290793, 0.7058824, 0, 1, 1,
0.7948827, 0.5123631, 2.307454, 0.7098039, 0, 1, 1,
0.7972507, -0.8072547, 3.672913, 0.7176471, 0, 1, 1,
0.7973272, 0.7462255, 1.389857, 0.7215686, 0, 1, 1,
0.7982965, -0.9289837, 1.530437, 0.7294118, 0, 1, 1,
0.8012589, -1.612786, 2.605174, 0.7333333, 0, 1, 1,
0.8023709, 2.248669, -0.3234155, 0.7411765, 0, 1, 1,
0.8026356, 1.043406, 1.08758, 0.7450981, 0, 1, 1,
0.8036852, 2.113404, 2.450716, 0.7529412, 0, 1, 1,
0.8058705, -1.305785, 1.752358, 0.7568628, 0, 1, 1,
0.8127662, -0.3741827, 2.083388, 0.7647059, 0, 1, 1,
0.8131052, 1.618236, -0.006010768, 0.7686275, 0, 1, 1,
0.8164999, -0.3217612, 0.7300246, 0.7764706, 0, 1, 1,
0.8176955, 0.9230617, 1.3051, 0.7803922, 0, 1, 1,
0.818496, -0.5903305, 2.618017, 0.7882353, 0, 1, 1,
0.8193712, 1.183617, 1.166524, 0.7921569, 0, 1, 1,
0.8263931, 0.407674, 0.3428754, 0.8, 0, 1, 1,
0.8268616, 0.895536, 0.7624108, 0.8078431, 0, 1, 1,
0.8326063, 0.8036801, -0.1605835, 0.8117647, 0, 1, 1,
0.8376803, 0.4842037, 1.486566, 0.8196079, 0, 1, 1,
0.839695, -0.6273714, 3.367856, 0.8235294, 0, 1, 1,
0.840751, 0.4667249, 2.158403, 0.8313726, 0, 1, 1,
0.8436226, 0.4556365, -0.3573764, 0.8352941, 0, 1, 1,
0.8464618, -0.6506619, 1.735624, 0.8431373, 0, 1, 1,
0.8512533, 1.43973, -1.221623, 0.8470588, 0, 1, 1,
0.8539919, -0.09778448, 1.475527, 0.854902, 0, 1, 1,
0.8543072, -0.4060893, 1.485906, 0.8588235, 0, 1, 1,
0.8609536, 0.3262382, 1.647346, 0.8666667, 0, 1, 1,
0.867074, 0.829981, -0.1293489, 0.8705882, 0, 1, 1,
0.8733757, -1.076771, 2.49498, 0.8784314, 0, 1, 1,
0.876316, 1.628988, -0.5381681, 0.8823529, 0, 1, 1,
0.8763636, -0.8704072, 1.450134, 0.8901961, 0, 1, 1,
0.8838264, -0.9020466, 0.2881979, 0.8941177, 0, 1, 1,
0.8856285, -1.384604, 1.724742, 0.9019608, 0, 1, 1,
0.8874798, 0.571147, 1.38685, 0.9098039, 0, 1, 1,
0.8891624, 0.9684847, 2.94194, 0.9137255, 0, 1, 1,
0.8903811, 0.3302169, 2.615584, 0.9215686, 0, 1, 1,
0.8908828, -0.1005771, 3.727746, 0.9254902, 0, 1, 1,
0.8917668, -1.041342, 0.4675478, 0.9333333, 0, 1, 1,
0.8923516, -1.583981, 1.878435, 0.9372549, 0, 1, 1,
0.8937181, -0.1704916, 2.280046, 0.945098, 0, 1, 1,
0.8978736, -2.422557, 1.738733, 0.9490196, 0, 1, 1,
0.9012526, -0.5033233, 0.3116484, 0.9568627, 0, 1, 1,
0.9040676, -0.3528332, 2.738408, 0.9607843, 0, 1, 1,
0.9056084, 2.29637, 0.9415526, 0.9686275, 0, 1, 1,
0.9080353, 1.462951, 0.4755966, 0.972549, 0, 1, 1,
0.90826, 0.08870975, 1.873409, 0.9803922, 0, 1, 1,
0.9084783, -0.1952787, 3.200937, 0.9843137, 0, 1, 1,
0.914579, -0.5235376, 1.891654, 0.9921569, 0, 1, 1,
0.9171611, 0.2332168, 2.017437, 0.9960784, 0, 1, 1,
0.9181727, -1.357118, 2.701988, 1, 0, 0.9960784, 1,
0.9184834, 0.09106257, 1.687349, 1, 0, 0.9882353, 1,
0.9215118, -1.033654, 2.548435, 1, 0, 0.9843137, 1,
0.9252715, -0.824632, 1.218344, 1, 0, 0.9764706, 1,
0.9285087, -0.1889495, 2.411679, 1, 0, 0.972549, 1,
0.9296941, 0.4587391, 1.34472, 1, 0, 0.9647059, 1,
0.9301566, -0.4777298, 1.46336, 1, 0, 0.9607843, 1,
0.9305234, 0.3483672, 0.2649181, 1, 0, 0.9529412, 1,
0.9365798, -0.9735034, 1.772333, 1, 0, 0.9490196, 1,
0.9369485, 1.310307, 2.315852, 1, 0, 0.9411765, 1,
0.9430774, 1.387119, 0.2252349, 1, 0, 0.9372549, 1,
0.9447424, 0.1031485, 0.2454114, 1, 0, 0.9294118, 1,
0.9469076, 1.439749, 1.228191, 1, 0, 0.9254902, 1,
0.948769, -0.5761365, 3.978563, 1, 0, 0.9176471, 1,
0.9494615, 1.396484, 1.493962, 1, 0, 0.9137255, 1,
0.9510133, 1.096008, 0.7049237, 1, 0, 0.9058824, 1,
0.9533214, -0.7414199, 2.399521, 1, 0, 0.9019608, 1,
0.955318, -0.8938835, 1.702205, 1, 0, 0.8941177, 1,
0.9556947, 0.1667276, 2.010953, 1, 0, 0.8862745, 1,
0.9607793, -0.4779094, 2.171979, 1, 0, 0.8823529, 1,
0.9632294, -0.5148268, 2.786887, 1, 0, 0.8745098, 1,
0.9645108, -1.560761, 3.054061, 1, 0, 0.8705882, 1,
0.9655932, -1.030174, 2.660393, 1, 0, 0.8627451, 1,
0.9657484, 1.223712, -0.006003675, 1, 0, 0.8588235, 1,
0.9672614, 0.194494, 1.699049, 1, 0, 0.8509804, 1,
0.9698582, 0.4947519, -0.3338448, 1, 0, 0.8470588, 1,
0.9728359, -1.097023, 3.866038, 1, 0, 0.8392157, 1,
0.9737813, 0.1994255, 1.452293, 1, 0, 0.8352941, 1,
0.9754046, -1.190416, 0.718447, 1, 0, 0.827451, 1,
1.002601, 1.663946, 0.06550656, 1, 0, 0.8235294, 1,
1.004295, 0.2937382, 0.0172239, 1, 0, 0.8156863, 1,
1.007321, 1.010407, 0.07258432, 1, 0, 0.8117647, 1,
1.008251, -0.3452519, 0.8012689, 1, 0, 0.8039216, 1,
1.008517, -0.3054695, -1.066384, 1, 0, 0.7960784, 1,
1.017234, 3.296884, 0.06778741, 1, 0, 0.7921569, 1,
1.021255, 0.2476157, 1.962574, 1, 0, 0.7843137, 1,
1.022744, -0.3222122, 3.334887, 1, 0, 0.7803922, 1,
1.029383, 0.4239176, 0.5714099, 1, 0, 0.772549, 1,
1.031996, -0.7956126, 2.449884, 1, 0, 0.7686275, 1,
1.032301, 1.756853, 0.7100577, 1, 0, 0.7607843, 1,
1.045181, 0.6081322, 2.045197, 1, 0, 0.7568628, 1,
1.088094, -0.6543391, 2.798112, 1, 0, 0.7490196, 1,
1.092327, -1.224648, 1.265356, 1, 0, 0.7450981, 1,
1.093339, -0.5280532, 1.439681, 1, 0, 0.7372549, 1,
1.09756, 0.362606, 0.1289981, 1, 0, 0.7333333, 1,
1.101637, -0.8048924, 1.831488, 1, 0, 0.7254902, 1,
1.10229, -1.869638, 4.724193, 1, 0, 0.7215686, 1,
1.106824, 0.09599329, 1.676041, 1, 0, 0.7137255, 1,
1.108888, -0.129884, 1.801559, 1, 0, 0.7098039, 1,
1.110849, -0.2436246, 1.458722, 1, 0, 0.7019608, 1,
1.110911, -1.023865, 1.745984, 1, 0, 0.6941177, 1,
1.113116, 0.3215632, 0.6405264, 1, 0, 0.6901961, 1,
1.113365, -0.1294166, 0.5192691, 1, 0, 0.682353, 1,
1.117539, 0.3264199, 1.483094, 1, 0, 0.6784314, 1,
1.121742, -0.06580413, 2.830976, 1, 0, 0.6705883, 1,
1.129239, -0.02959119, 2.125587, 1, 0, 0.6666667, 1,
1.131274, 1.119643, -1.573176, 1, 0, 0.6588235, 1,
1.13407, -0.4242968, 1.236744, 1, 0, 0.654902, 1,
1.134805, -0.2044157, 2.87642, 1, 0, 0.6470588, 1,
1.138001, -0.1346871, -0.4732537, 1, 0, 0.6431373, 1,
1.147517, -1.802209, 3.480361, 1, 0, 0.6352941, 1,
1.154292, -0.05529862, 3.070259, 1, 0, 0.6313726, 1,
1.160161, -0.368241, 1.989974, 1, 0, 0.6235294, 1,
1.160822, -0.1449527, 0.9558179, 1, 0, 0.6196079, 1,
1.163702, 0.9187678, 0.7619922, 1, 0, 0.6117647, 1,
1.164845, -0.3804564, 0.7424653, 1, 0, 0.6078432, 1,
1.179009, -0.9403979, 2.96265, 1, 0, 0.6, 1,
1.184738, 0.05637494, 1.824149, 1, 0, 0.5921569, 1,
1.189139, -0.103584, 1.573279, 1, 0, 0.5882353, 1,
1.191055, 0.2642513, 1.912955, 1, 0, 0.5803922, 1,
1.203092, -1.172308, 1.138271, 1, 0, 0.5764706, 1,
1.218831, 0.7791346, 0.7937329, 1, 0, 0.5686275, 1,
1.222207, 0.1043155, 1.320519, 1, 0, 0.5647059, 1,
1.222569, 0.5243319, 2.581541, 1, 0, 0.5568628, 1,
1.232536, 0.03528783, 1.564752, 1, 0, 0.5529412, 1,
1.234203, 0.2984098, 1.473899, 1, 0, 0.5450981, 1,
1.234523, -0.4704201, 1.607804, 1, 0, 0.5411765, 1,
1.240532, -1.327681, 2.627995, 1, 0, 0.5333334, 1,
1.249498, 0.5908107, 1.553736, 1, 0, 0.5294118, 1,
1.272218, 0.250332, 2.651751, 1, 0, 0.5215687, 1,
1.276397, 0.3433183, 1.151383, 1, 0, 0.5176471, 1,
1.280136, -0.8189277, 2.626289, 1, 0, 0.509804, 1,
1.283029, -0.6953413, 2.800324, 1, 0, 0.5058824, 1,
1.293027, -0.1621845, 0.934797, 1, 0, 0.4980392, 1,
1.313732, -1.0123, 1.667065, 1, 0, 0.4901961, 1,
1.318759, 1.556129, 1.15539, 1, 0, 0.4862745, 1,
1.320813, 0.8423026, 0.448648, 1, 0, 0.4784314, 1,
1.323798, -1.442522, 0.2346156, 1, 0, 0.4745098, 1,
1.324015, -1.517848, 1.13343, 1, 0, 0.4666667, 1,
1.3244, 1.352929, 0.6816671, 1, 0, 0.4627451, 1,
1.325389, 0.1827241, 3.34416, 1, 0, 0.454902, 1,
1.335786, 0.1381015, 2.889977, 1, 0, 0.4509804, 1,
1.344374, -0.2746398, 2.032223, 1, 0, 0.4431373, 1,
1.352201, -0.01448437, 0.529768, 1, 0, 0.4392157, 1,
1.353191, -0.886642, 0.5230623, 1, 0, 0.4313726, 1,
1.355964, -1.029061, 3.184882, 1, 0, 0.427451, 1,
1.372952, -0.5443214, 3.02833, 1, 0, 0.4196078, 1,
1.374089, -2.460057, 3.118014, 1, 0, 0.4156863, 1,
1.375676, 0.6918652, 0.2511205, 1, 0, 0.4078431, 1,
1.387188, 0.9736398, 1.860585, 1, 0, 0.4039216, 1,
1.389517, -0.1733943, 2.636158, 1, 0, 0.3960784, 1,
1.389582, 0.3585131, 0.6548492, 1, 0, 0.3882353, 1,
1.391355, 0.4740175, 2.742485, 1, 0, 0.3843137, 1,
1.392169, 0.1052337, 1.514946, 1, 0, 0.3764706, 1,
1.409793, 3.004193, 0.3842149, 1, 0, 0.372549, 1,
1.412947, 1.033788, 0.1825311, 1, 0, 0.3647059, 1,
1.421893, -0.4948012, 0.05908774, 1, 0, 0.3607843, 1,
1.422965, -0.6551774, 0.253228, 1, 0, 0.3529412, 1,
1.425546, 0.3376759, 1.402213, 1, 0, 0.3490196, 1,
1.439367, -0.9167294, 3.515386, 1, 0, 0.3411765, 1,
1.444395, -0.1503277, 2.022186, 1, 0, 0.3372549, 1,
1.450845, -0.8844485, 2.309621, 1, 0, 0.3294118, 1,
1.451123, -0.5870023, 2.861115, 1, 0, 0.3254902, 1,
1.451936, 1.343814, 0.3214046, 1, 0, 0.3176471, 1,
1.454288, -0.337417, 3.252624, 1, 0, 0.3137255, 1,
1.458401, -0.6548184, 2.781139, 1, 0, 0.3058824, 1,
1.465975, -0.3934056, 1.961336, 1, 0, 0.2980392, 1,
1.466425, 1.025381, -0.1399232, 1, 0, 0.2941177, 1,
1.475981, -2.038836, 2.945481, 1, 0, 0.2862745, 1,
1.479775, -1.121426, 3.049646, 1, 0, 0.282353, 1,
1.482866, 0.07292601, 1.446917, 1, 0, 0.2745098, 1,
1.495922, -0.3802548, -0.006653921, 1, 0, 0.2705882, 1,
1.506235, -0.9896188, 1.518331, 1, 0, 0.2627451, 1,
1.522385, 0.8854376, -0.5396839, 1, 0, 0.2588235, 1,
1.524714, -2.387523, 3.672574, 1, 0, 0.2509804, 1,
1.531795, 0.004821203, 1.758199, 1, 0, 0.2470588, 1,
1.535383, -0.7358073, 0.3791981, 1, 0, 0.2392157, 1,
1.541875, -1.434388, 1.757152, 1, 0, 0.2352941, 1,
1.557247, -0.1371965, 1.787442, 1, 0, 0.227451, 1,
1.566435, 0.7350134, -1.034086, 1, 0, 0.2235294, 1,
1.56857, -2.447109, 1.84022, 1, 0, 0.2156863, 1,
1.582007, 1.290121, -0.09395389, 1, 0, 0.2117647, 1,
1.587251, 0.06239291, 3.002713, 1, 0, 0.2039216, 1,
1.595209, -0.0252083, 1.808721, 1, 0, 0.1960784, 1,
1.635346, 0.9024276, 0.2627905, 1, 0, 0.1921569, 1,
1.638802, -0.07136603, 0.9907365, 1, 0, 0.1843137, 1,
1.640934, 0.1918633, 3.04907, 1, 0, 0.1803922, 1,
1.651795, -0.08209983, 1.023825, 1, 0, 0.172549, 1,
1.657711, -2.848763, 1.328285, 1, 0, 0.1686275, 1,
1.674958, -0.1751453, -0.112667, 1, 0, 0.1607843, 1,
1.724954, 0.6126364, 0.41347, 1, 0, 0.1568628, 1,
1.728326, -0.702524, 1.473317, 1, 0, 0.1490196, 1,
1.739134, -0.4671115, 1.558439, 1, 0, 0.145098, 1,
1.79287, 1.017648, -0.1748327, 1, 0, 0.1372549, 1,
1.8138, -0.7357143, 1.493126, 1, 0, 0.1333333, 1,
1.816078, 0.6201116, 0.887237, 1, 0, 0.1254902, 1,
1.820843, -0.9847231, 1.289086, 1, 0, 0.1215686, 1,
1.826497, -0.3602705, 2.305663, 1, 0, 0.1137255, 1,
1.830927, 1.753462, -1.073397, 1, 0, 0.1098039, 1,
1.930777, -0.5072424, 1.276616, 1, 0, 0.1019608, 1,
1.934304, 0.3813176, 2.295506, 1, 0, 0.09411765, 1,
1.94039, 0.4777848, 0.7518374, 1, 0, 0.09019608, 1,
1.94436, 1.061883, 1.31506, 1, 0, 0.08235294, 1,
1.993079, -0.3918378, 1.949876, 1, 0, 0.07843138, 1,
1.997984, 0.907296, 1.332563, 1, 0, 0.07058824, 1,
1.999377, 0.8133093, 0.7406403, 1, 0, 0.06666667, 1,
2.015617, 0.6367052, 2.055131, 1, 0, 0.05882353, 1,
2.023266, 0.828141, 0.7747873, 1, 0, 0.05490196, 1,
2.043634, -1.083972, 3.854309, 1, 0, 0.04705882, 1,
2.102986, 0.5449655, 2.14502, 1, 0, 0.04313726, 1,
2.214154, -0.6016567, 1.993111, 1, 0, 0.03529412, 1,
2.248153, 2.166752, 0.1975528, 1, 0, 0.03137255, 1,
2.282331, -0.09049232, -1.044615, 1, 0, 0.02352941, 1,
2.288485, -1.39167, 3.34227, 1, 0, 0.01960784, 1,
2.397151, -0.7124488, 1.875586, 1, 0, 0.01176471, 1,
2.738146, -0.4506972, 1.552716, 1, 0, 0.007843138, 1
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
-0.2422419, -4.344863, -7.349474, 0, -0.5, 0.5, 0.5,
-0.2422419, -4.344863, -7.349474, 1, -0.5, 0.5, 0.5,
-0.2422419, -4.344863, -7.349474, 1, 1.5, 0.5, 0.5,
-0.2422419, -4.344863, -7.349474, 0, 1.5, 0.5, 0.5
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
-4.232982, 0.02978408, -7.349474, 0, -0.5, 0.5, 0.5,
-4.232982, 0.02978408, -7.349474, 1, -0.5, 0.5, 0.5,
-4.232982, 0.02978408, -7.349474, 1, 1.5, 0.5, 0.5,
-4.232982, 0.02978408, -7.349474, 0, 1.5, 0.5, 0.5
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
-4.232982, -4.344863, -0.1514378, 0, -0.5, 0.5, 0.5,
-4.232982, -4.344863, -0.1514378, 1, -0.5, 0.5, 0.5,
-4.232982, -4.344863, -0.1514378, 1, 1.5, 0.5, 0.5,
-4.232982, -4.344863, -0.1514378, 0, 1.5, 0.5, 0.5
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
-3, -3.335329, -5.688389,
2, -3.335329, -5.688389,
-3, -3.335329, -5.688389,
-3, -3.503585, -5.965237,
-2, -3.335329, -5.688389,
-2, -3.503585, -5.965237,
-1, -3.335329, -5.688389,
-1, -3.503585, -5.965237,
0, -3.335329, -5.688389,
0, -3.503585, -5.965237,
1, -3.335329, -5.688389,
1, -3.503585, -5.965237,
2, -3.335329, -5.688389,
2, -3.503585, -5.965237
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
-3, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
-3, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
-3, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
-3, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5,
-2, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
-2, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
-2, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
-2, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5,
-1, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
-1, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
-1, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
-1, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5,
0, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
0, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
0, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
0, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5,
1, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
1, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
1, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
1, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5,
2, -3.840096, -6.518932, 0, -0.5, 0.5, 0.5,
2, -3.840096, -6.518932, 1, -0.5, 0.5, 0.5,
2, -3.840096, -6.518932, 1, 1.5, 0.5, 0.5,
2, -3.840096, -6.518932, 0, 1.5, 0.5, 0.5
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
-3.312042, -3, -5.688389,
-3.312042, 3, -5.688389,
-3.312042, -3, -5.688389,
-3.465532, -3, -5.965237,
-3.312042, -2, -5.688389,
-3.465532, -2, -5.965237,
-3.312042, -1, -5.688389,
-3.465532, -1, -5.965237,
-3.312042, 0, -5.688389,
-3.465532, 0, -5.965237,
-3.312042, 1, -5.688389,
-3.465532, 1, -5.965237,
-3.312042, 2, -5.688389,
-3.465532, 2, -5.965237,
-3.312042, 3, -5.688389,
-3.465532, 3, -5.965237
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
-3.772512, -3, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, -3, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, -3, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, -3, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, -2, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, -2, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, -2, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, -2, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, -1, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, -1, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, -1, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, -1, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, 0, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, 0, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, 0, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, 0, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, 1, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, 1, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, 1, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, 1, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, 2, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, 2, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, 2, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, 2, -6.518932, 0, 1.5, 0.5, 0.5,
-3.772512, 3, -6.518932, 0, -0.5, 0.5, 0.5,
-3.772512, 3, -6.518932, 1, -0.5, 0.5, 0.5,
-3.772512, 3, -6.518932, 1, 1.5, 0.5, 0.5,
-3.772512, 3, -6.518932, 0, 1.5, 0.5, 0.5
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
-3.312042, -3.335329, -4,
-3.312042, -3.335329, 4,
-3.312042, -3.335329, -4,
-3.465532, -3.503585, -4,
-3.312042, -3.335329, -2,
-3.465532, -3.503585, -2,
-3.312042, -3.335329, 0,
-3.465532, -3.503585, 0,
-3.312042, -3.335329, 2,
-3.465532, -3.503585, 2,
-3.312042, -3.335329, 4,
-3.465532, -3.503585, 4
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
-3.772512, -3.840096, -4, 0, -0.5, 0.5, 0.5,
-3.772512, -3.840096, -4, 1, -0.5, 0.5, 0.5,
-3.772512, -3.840096, -4, 1, 1.5, 0.5, 0.5,
-3.772512, -3.840096, -4, 0, 1.5, 0.5, 0.5,
-3.772512, -3.840096, -2, 0, -0.5, 0.5, 0.5,
-3.772512, -3.840096, -2, 1, -0.5, 0.5, 0.5,
-3.772512, -3.840096, -2, 1, 1.5, 0.5, 0.5,
-3.772512, -3.840096, -2, 0, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 0, 0, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 0, 1, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 0, 1, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 0, 0, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 2, 0, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 2, 1, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 2, 1, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 2, 0, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 4, 0, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 4, 1, -0.5, 0.5, 0.5,
-3.772512, -3.840096, 4, 1, 1.5, 0.5, 0.5,
-3.772512, -3.840096, 4, 0, 1.5, 0.5, 0.5
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
-3.312042, -3.335329, -5.688389,
-3.312042, 3.394897, -5.688389,
-3.312042, -3.335329, 5.385514,
-3.312042, 3.394897, 5.385514,
-3.312042, -3.335329, -5.688389,
-3.312042, -3.335329, 5.385514,
-3.312042, 3.394897, -5.688389,
-3.312042, 3.394897, 5.385514,
-3.312042, -3.335329, -5.688389,
2.827558, -3.335329, -5.688389,
-3.312042, -3.335329, 5.385514,
2.827558, -3.335329, 5.385514,
-3.312042, 3.394897, -5.688389,
2.827558, 3.394897, -5.688389,
-3.312042, 3.394897, 5.385514,
2.827558, 3.394897, 5.385514,
2.827558, -3.335329, -5.688389,
2.827558, 3.394897, -5.688389,
2.827558, -3.335329, 5.385514,
2.827558, 3.394897, 5.385514,
2.827558, -3.335329, -5.688389,
2.827558, -3.335329, 5.385514,
2.827558, 3.394897, -5.688389,
2.827558, 3.394897, 5.385514
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
var radius = 7.657027;
var distance = 34.06698;
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
mvMatrix.translate( 0.2422419, -0.02978408, 0.1514378 );
mvMatrix.scale( 1.348448, 1.230111, 0.7476071 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06698);
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
Sowell<-read.table("Sowell.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sowell$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
```

```r
y<-Sowell$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
```

```r
z<-Sowell$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
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
-3.22263, 0.3165663, -2.383991, 0, 0, 1, 1, 1,
-2.679112, 2.062121, -0.1873796, 1, 0, 0, 1, 1,
-2.653018, 0.634864, -2.922945, 1, 0, 0, 1, 1,
-2.652231, 1.177202, -3.20076, 1, 0, 0, 1, 1,
-2.624056, -0.5804185, -2.003117, 1, 0, 0, 1, 1,
-2.539252, -1.65924, -3.121651, 1, 0, 0, 1, 1,
-2.404454, 1.269843, -0.8700888, 0, 0, 0, 1, 1,
-2.35393, -1.32914, -1.801821, 0, 0, 0, 1, 1,
-2.276913, -0.7868983, -2.445657, 0, 0, 0, 1, 1,
-2.267821, 0.3233441, -0.7194003, 0, 0, 0, 1, 1,
-2.262197, 0.3729647, 1.381569, 0, 0, 0, 1, 1,
-2.231789, 2.36394, -1.495458, 0, 0, 0, 1, 1,
-2.206895, -0.944033, -0.4348382, 0, 0, 0, 1, 1,
-2.160634, -1.673935, -2.474929, 1, 1, 1, 1, 1,
-2.108828, 0.7651198, -1.281936, 1, 1, 1, 1, 1,
-2.04744, -1.841016, -2.11264, 1, 1, 1, 1, 1,
-2.037201, -0.9615169, -2.417738, 1, 1, 1, 1, 1,
-2.015367, 0.2772522, -1.878136, 1, 1, 1, 1, 1,
-1.986799, -0.686534, -2.269263, 1, 1, 1, 1, 1,
-1.98558, -1.37265, -1.202059, 1, 1, 1, 1, 1,
-1.962687, -2.213018, -2.16422, 1, 1, 1, 1, 1,
-1.958197, -0.1403411, -1.245598, 1, 1, 1, 1, 1,
-1.957339, 1.868203, -1.974363, 1, 1, 1, 1, 1,
-1.9544, -1.588174, -2.516309, 1, 1, 1, 1, 1,
-1.952466, 1.671764, -1.419099, 1, 1, 1, 1, 1,
-1.940211, -0.5744931, -1.373215, 1, 1, 1, 1, 1,
-1.936482, -2.076731, -3.574004, 1, 1, 1, 1, 1,
-1.9241, 1.413816, -1.023953, 1, 1, 1, 1, 1,
-1.906262, 0.4132298, -0.2555869, 0, 0, 1, 1, 1,
-1.891802, 0.3234331, -1.829436, 1, 0, 0, 1, 1,
-1.890767, 0.5007778, 0.8065939, 1, 0, 0, 1, 1,
-1.880677, -0.1312865, -2.421499, 1, 0, 0, 1, 1,
-1.867394, 0.4810978, -1.57967, 1, 0, 0, 1, 1,
-1.853761, -0.8442813, -2.687919, 1, 0, 0, 1, 1,
-1.820322, 0.5400528, 0.04994469, 0, 0, 0, 1, 1,
-1.81787, 0.4781745, -1.931648, 0, 0, 0, 1, 1,
-1.809427, 1.135474, -0.8345336, 0, 0, 0, 1, 1,
-1.77344, -1.546436, -1.611701, 0, 0, 0, 1, 1,
-1.769402, 1.430538, -1.490001, 0, 0, 0, 1, 1,
-1.75772, 0.2176731, -1.275136, 0, 0, 0, 1, 1,
-1.757265, -0.6989492, -1.927056, 0, 0, 0, 1, 1,
-1.717106, 1.172786, -0.7660889, 1, 1, 1, 1, 1,
-1.712894, -0.4874191, -3.063668, 1, 1, 1, 1, 1,
-1.701596, -0.4107996, -1.94748, 1, 1, 1, 1, 1,
-1.696378, -0.1962959, -1.049754, 1, 1, 1, 1, 1,
-1.681596, 1.425267, -1.404868, 1, 1, 1, 1, 1,
-1.674447, 0.274924, -2.431891, 1, 1, 1, 1, 1,
-1.661651, 0.4486507, -3.167411, 1, 1, 1, 1, 1,
-1.654534, 0.6084805, -2.674175, 1, 1, 1, 1, 1,
-1.642315, 0.5660785, -1.101308, 1, 1, 1, 1, 1,
-1.639826, -0.3779412, -2.497493, 1, 1, 1, 1, 1,
-1.636296, 0.4440184, -2.703551, 1, 1, 1, 1, 1,
-1.631418, 1.258601, -3.466039, 1, 1, 1, 1, 1,
-1.62108, 0.1130372, -1.841621, 1, 1, 1, 1, 1,
-1.60611, 0.6479975, -1.245739, 1, 1, 1, 1, 1,
-1.604061, 1.073006, -0.9530519, 1, 1, 1, 1, 1,
-1.602776, -0.06231066, -2.192036, 0, 0, 1, 1, 1,
-1.602213, 0.788062, 0.1903356, 1, 0, 0, 1, 1,
-1.599783, -0.2643996, -1.958372, 1, 0, 0, 1, 1,
-1.594701, 0.5025379, -2.852571, 1, 0, 0, 1, 1,
-1.593428, -0.7212, -2.142945, 1, 0, 0, 1, 1,
-1.570485, 1.378814, -1.170539, 1, 0, 0, 1, 1,
-1.570235, 0.1696778, -0.7036911, 0, 0, 0, 1, 1,
-1.554494, 0.4333822, -0.02885192, 0, 0, 0, 1, 1,
-1.550931, -0.1237113, -0.2311082, 0, 0, 0, 1, 1,
-1.54012, -0.0789236, -2.187953, 0, 0, 0, 1, 1,
-1.530524, 0.6762769, -1.463617, 0, 0, 0, 1, 1,
-1.524998, -0.3351597, -2.731584, 0, 0, 0, 1, 1,
-1.524148, -0.3428855, -2.942468, 0, 0, 0, 1, 1,
-1.50679, 1.013855, -1.441534, 1, 1, 1, 1, 1,
-1.505424, -0.6884995, -1.161366, 1, 1, 1, 1, 1,
-1.504739, 0.2970804, -1.029935, 1, 1, 1, 1, 1,
-1.492896, 1.312142, -1.772141, 1, 1, 1, 1, 1,
-1.490358, -1.042198, -3.030107, 1, 1, 1, 1, 1,
-1.487315, 0.1649957, -0.7761121, 1, 1, 1, 1, 1,
-1.475146, 0.07096045, -2.283977, 1, 1, 1, 1, 1,
-1.470623, -0.6751825, -2.970521, 1, 1, 1, 1, 1,
-1.469047, -0.6159493, -0.501422, 1, 1, 1, 1, 1,
-1.467512, 1.129198, -0.7198145, 1, 1, 1, 1, 1,
-1.458604, -0.7298498, -0.5077676, 1, 1, 1, 1, 1,
-1.446292, 0.2621337, -0.5588503, 1, 1, 1, 1, 1,
-1.435064, 1.440529, -1.148718, 1, 1, 1, 1, 1,
-1.419854, 1.287167, -1.917213, 1, 1, 1, 1, 1,
-1.417229, -0.4137346, -2.877682, 1, 1, 1, 1, 1,
-1.411518, -1.248874, -3.258152, 0, 0, 1, 1, 1,
-1.409951, -0.8820521, -1.66596, 1, 0, 0, 1, 1,
-1.408301, 2.250454, -1.417619, 1, 0, 0, 1, 1,
-1.403819, -0.9844314, -0.6759316, 1, 0, 0, 1, 1,
-1.401942, 0.3958135, -2.136416, 1, 0, 0, 1, 1,
-1.38942, 1.051775, -2.547244, 1, 0, 0, 1, 1,
-1.389151, 0.6526216, 0.4255331, 0, 0, 0, 1, 1,
-1.388651, 0.6552795, -1.046374, 0, 0, 0, 1, 1,
-1.381041, 0.7625735, -1.573213, 0, 0, 0, 1, 1,
-1.370331, 0.2543184, -0.4755827, 0, 0, 0, 1, 1,
-1.368222, -0.4969315, -1.536981, 0, 0, 0, 1, 1,
-1.367727, -1.444909, -2.46026, 0, 0, 0, 1, 1,
-1.360479, -0.4967222, -2.406904, 0, 0, 0, 1, 1,
-1.350867, -0.1976704, -2.595161, 1, 1, 1, 1, 1,
-1.345454, 0.05343413, 0.5074188, 1, 1, 1, 1, 1,
-1.338796, 0.729873, 1.085326, 1, 1, 1, 1, 1,
-1.317344, -2.862902, -2.48945, 1, 1, 1, 1, 1,
-1.290861, -0.6832222, -1.476295, 1, 1, 1, 1, 1,
-1.290722, 0.3617828, -0.3907664, 1, 1, 1, 1, 1,
-1.289327, -0.7221134, -2.919613, 1, 1, 1, 1, 1,
-1.279014, 0.01859212, -1.954242, 1, 1, 1, 1, 1,
-1.273658, 0.1218563, -2.258509, 1, 1, 1, 1, 1,
-1.272903, 0.9978746, 0.7861846, 1, 1, 1, 1, 1,
-1.26581, -0.2123879, -2.187892, 1, 1, 1, 1, 1,
-1.263376, 1.02586, -0.2579215, 1, 1, 1, 1, 1,
-1.24535, -1.100682, -2.514413, 1, 1, 1, 1, 1,
-1.242914, 0.1375061, -1.982887, 1, 1, 1, 1, 1,
-1.238478, -0.769314, -2.222761, 1, 1, 1, 1, 1,
-1.237876, 1.354219, -1.170341, 0, 0, 1, 1, 1,
-1.226924, -0.474151, -1.457604, 1, 0, 0, 1, 1,
-1.226077, 1.095203, -0.9152955, 1, 0, 0, 1, 1,
-1.225553, 1.09957, -2.830735, 1, 0, 0, 1, 1,
-1.225227, -0.1256302, -1.499894, 1, 0, 0, 1, 1,
-1.206483, 0.6539772, -2.383918, 1, 0, 0, 1, 1,
-1.196599, 1.172544, -1.842521, 0, 0, 0, 1, 1,
-1.186859, 0.1050412, -1.483366, 0, 0, 0, 1, 1,
-1.185385, -0.646923, -1.78344, 0, 0, 0, 1, 1,
-1.184774, -1.390044, -1.677252, 0, 0, 0, 1, 1,
-1.1711, 1.228627, -1.517166, 0, 0, 0, 1, 1,
-1.171062, -0.516792, -2.920052, 0, 0, 0, 1, 1,
-1.16973, -0.09852652, -1.380035, 0, 0, 0, 1, 1,
-1.163624, 0.2819166, -1.555909, 1, 1, 1, 1, 1,
-1.162608, 0.02946825, -0.6338202, 1, 1, 1, 1, 1,
-1.161471, -0.8529224, -2.018474, 1, 1, 1, 1, 1,
-1.158287, 0.4429905, -1.32331, 1, 1, 1, 1, 1,
-1.157112, 0.8044266, -0.8973067, 1, 1, 1, 1, 1,
-1.153942, -0.8739849, -2.783732, 1, 1, 1, 1, 1,
-1.152394, -0.3188955, -0.6371058, 1, 1, 1, 1, 1,
-1.151924, -1.307676, -0.1714971, 1, 1, 1, 1, 1,
-1.149954, -1.286382, -1.876189, 1, 1, 1, 1, 1,
-1.14946, 0.08589557, 0.4924023, 1, 1, 1, 1, 1,
-1.147293, 2.15327, 1.112624, 1, 1, 1, 1, 1,
-1.145716, -0.830826, -0.9805928, 1, 1, 1, 1, 1,
-1.145308, 1.204379, -1.968258, 1, 1, 1, 1, 1,
-1.139441, -0.1293171, -1.079477, 1, 1, 1, 1, 1,
-1.129157, 0.8580744, -1.167111, 1, 1, 1, 1, 1,
-1.128732, 0.2837036, -0.4209219, 0, 0, 1, 1, 1,
-1.1269, 0.02615254, -1.39624, 1, 0, 0, 1, 1,
-1.117728, 1.027539, -1.606095, 1, 0, 0, 1, 1,
-1.107957, 0.03659138, -2.694141, 1, 0, 0, 1, 1,
-1.106655, 1.540141, 1.426125, 1, 0, 0, 1, 1,
-1.099819, 1.373745, -0.1960118, 1, 0, 0, 1, 1,
-1.097023, -1.72825, -2.487496, 0, 0, 0, 1, 1,
-1.087012, -0.4022149, -1.247876, 0, 0, 0, 1, 1,
-1.080263, -0.5384107, -1.909034, 0, 0, 0, 1, 1,
-1.078086, 0.7227533, -0.1159286, 0, 0, 0, 1, 1,
-1.072735, -0.5522212, -2.153004, 0, 0, 0, 1, 1,
-1.069839, -1.158448, -3.185594, 0, 0, 0, 1, 1,
-1.064785, -0.4857821, -1.804231, 0, 0, 0, 1, 1,
-1.064134, 1.625116, -1.120777, 1, 1, 1, 1, 1,
-1.061806, 0.2630683, -3.285879, 1, 1, 1, 1, 1,
-1.061426, -0.6420684, -2.34415, 1, 1, 1, 1, 1,
-1.058877, -1.459429, -3.805005, 1, 1, 1, 1, 1,
-1.057231, 0.4779368, -1.736974, 1, 1, 1, 1, 1,
-1.054181, -1.078746, -1.33193, 1, 1, 1, 1, 1,
-1.050947, 0.04599172, 0.7197747, 1, 1, 1, 1, 1,
-1.050598, -1.590769, -1.741564, 1, 1, 1, 1, 1,
-1.044638, 0.4988585, -1.009707, 1, 1, 1, 1, 1,
-1.043817, -1.441295, -2.117019, 1, 1, 1, 1, 1,
-1.041387, -0.5401954, -1.969058, 1, 1, 1, 1, 1,
-1.036165, -0.9843824, -1.021404, 1, 1, 1, 1, 1,
-1.030078, 1.348873, -1.882, 1, 1, 1, 1, 1,
-1.029553, -1.0388, -2.172728, 1, 1, 1, 1, 1,
-1.025177, 0.252183, -1.314433, 1, 1, 1, 1, 1,
-1.007983, -0.108105, -2.731317, 0, 0, 1, 1, 1,
-1.003888, 0.3464114, -1.2483, 1, 0, 0, 1, 1,
-1.003688, 2.193647, -0.7984303, 1, 0, 0, 1, 1,
-1.003348, -0.3322968, -1.370726, 1, 0, 0, 1, 1,
-0.9995665, -0.7926615, -2.796185, 1, 0, 0, 1, 1,
-0.9970582, 0.8388848, -2.183552, 1, 0, 0, 1, 1,
-0.9904947, -1.597731, -2.072067, 0, 0, 0, 1, 1,
-0.9901454, 0.2484595, -2.563544, 0, 0, 0, 1, 1,
-0.9899213, 1.717123, 0.1398668, 0, 0, 0, 1, 1,
-0.9839048, -0.8292843, -2.478686, 0, 0, 0, 1, 1,
-0.9747562, 0.02951618, -1.676724, 0, 0, 0, 1, 1,
-0.9745631, -0.5088174, -0.8682387, 0, 0, 0, 1, 1,
-0.9730834, -0.1003438, -3.193179, 0, 0, 0, 1, 1,
-0.9655477, -0.3597464, -1.980072, 1, 1, 1, 1, 1,
-0.9633689, 0.02292504, -0.9407867, 1, 1, 1, 1, 1,
-0.9557802, -1.978091, -3.97176, 1, 1, 1, 1, 1,
-0.9531257, -0.33074, -3.614654, 1, 1, 1, 1, 1,
-0.9361174, -1.956741, -2.816759, 1, 1, 1, 1, 1,
-0.9276047, 1.42964, 0.0406103, 1, 1, 1, 1, 1,
-0.9191331, 0.3359522, -2.111212, 1, 1, 1, 1, 1,
-0.9182704, 0.8365406, -1.156134, 1, 1, 1, 1, 1,
-0.9122343, -0.9107552, -1.02628, 1, 1, 1, 1, 1,
-0.9090328, -0.3193322, -2.9159, 1, 1, 1, 1, 1,
-0.9069099, -2.085571, -0.2698294, 1, 1, 1, 1, 1,
-0.8924217, 0.413945, 0.1580307, 1, 1, 1, 1, 1,
-0.8862318, 1.595949, -1.224868, 1, 1, 1, 1, 1,
-0.8830341, -0.8851036, -3.488059, 1, 1, 1, 1, 1,
-0.869875, -0.2626891, -1.956464, 1, 1, 1, 1, 1,
-0.8675955, 0.3073848, -1.023955, 0, 0, 1, 1, 1,
-0.866618, -1.106537, -2.60235, 1, 0, 0, 1, 1,
-0.8653659, -0.8404896, -1.834858, 1, 0, 0, 1, 1,
-0.8630479, 0.08252002, -2.297219, 1, 0, 0, 1, 1,
-0.8540276, -2.821313, -2.546429, 1, 0, 0, 1, 1,
-0.8530923, 0.5068737, -1.065118, 1, 0, 0, 1, 1,
-0.8519035, 1.435209, 0.03496931, 0, 0, 0, 1, 1,
-0.8511685, -0.3913952, -1.928249, 0, 0, 0, 1, 1,
-0.8489957, -0.1739402, -2.3174, 0, 0, 0, 1, 1,
-0.8456203, -0.9586184, -1.252812, 0, 0, 0, 1, 1,
-0.8387694, 0.6481892, -0.1842039, 0, 0, 0, 1, 1,
-0.8377505, 0.1686158, -0.9837604, 0, 0, 0, 1, 1,
-0.8356383, 1.420812, -1.498348, 0, 0, 0, 1, 1,
-0.8350309, -1.15849, -2.513813, 1, 1, 1, 1, 1,
-0.83336, 0.5094091, -1.155103, 1, 1, 1, 1, 1,
-0.8325647, 0.9969058, -0.3620147, 1, 1, 1, 1, 1,
-0.8293452, -0.3633411, -3.325684, 1, 1, 1, 1, 1,
-0.8277883, 1.461221, 2.309511, 1, 1, 1, 1, 1,
-0.8276751, -0.3096711, -1.561056, 1, 1, 1, 1, 1,
-0.8186298, 1.447102, -1.111838, 1, 1, 1, 1, 1,
-0.8166036, -0.09455319, -0.812568, 1, 1, 1, 1, 1,
-0.816062, 1.682171, -1.549194, 1, 1, 1, 1, 1,
-0.8142011, 0.5825061, -1.908959, 1, 1, 1, 1, 1,
-0.8113752, -0.2134852, -1.543464, 1, 1, 1, 1, 1,
-0.8061122, 0.5395085, -2.233815, 1, 1, 1, 1, 1,
-0.8054455, -0.3800869, -3.723146, 1, 1, 1, 1, 1,
-0.7929618, 0.4238535, -0.6619042, 1, 1, 1, 1, 1,
-0.7928056, -0.01045389, -1.650492, 1, 1, 1, 1, 1,
-0.7927922, 0.2819063, -1.062148, 0, 0, 1, 1, 1,
-0.7914779, 0.1180418, -2.116703, 1, 0, 0, 1, 1,
-0.7885164, 0.6257517, -1.010502, 1, 0, 0, 1, 1,
-0.7864245, -0.177308, -1.27901, 1, 0, 0, 1, 1,
-0.7813278, 0.3533455, -2.291682, 1, 0, 0, 1, 1,
-0.780167, 0.262727, -1.050393, 1, 0, 0, 1, 1,
-0.7787321, -0.4848071, -0.09848776, 0, 0, 0, 1, 1,
-0.7772868, -0.3053083, -2.99872, 0, 0, 0, 1, 1,
-0.7718607, 1.311046, -0.3541282, 0, 0, 0, 1, 1,
-0.7703174, -0.2846512, -2.340347, 0, 0, 0, 1, 1,
-0.7658199, 0.7689261, -0.1567541, 0, 0, 0, 1, 1,
-0.7580639, 2.960472, -0.6169237, 0, 0, 0, 1, 1,
-0.7574965, -1.772957, -3.210583, 0, 0, 0, 1, 1,
-0.7428393, -0.08544976, -2.062597, 1, 1, 1, 1, 1,
-0.738587, -0.07990088, -2.277309, 1, 1, 1, 1, 1,
-0.7352671, -0.4755204, -1.322828, 1, 1, 1, 1, 1,
-0.7347597, -0.3817383, -2.155482, 1, 1, 1, 1, 1,
-0.731537, -1.358173, -3.375427, 1, 1, 1, 1, 1,
-0.7285486, -0.6318491, -3.156045, 1, 1, 1, 1, 1,
-0.7241845, -0.4259045, -2.039793, 1, 1, 1, 1, 1,
-0.7222325, 0.2987083, -1.614424, 1, 1, 1, 1, 1,
-0.7191488, 0.2262369, -3.123719, 1, 1, 1, 1, 1,
-0.7189006, -0.5467807, -2.584943, 1, 1, 1, 1, 1,
-0.7176868, 0.7794434, -1.329279, 1, 1, 1, 1, 1,
-0.7145793, -0.9620118, -2.707812, 1, 1, 1, 1, 1,
-0.7141709, -0.4871233, -2.251873, 1, 1, 1, 1, 1,
-0.7088089, 0.7732694, -1.941812, 1, 1, 1, 1, 1,
-0.706211, -0.4124907, -4.201525, 1, 1, 1, 1, 1,
-0.7044213, 1.489033, 0.04030096, 0, 0, 1, 1, 1,
-0.7009846, -1.139155, -2.577916, 1, 0, 0, 1, 1,
-0.6983662, -1.173787, -2.035152, 1, 0, 0, 1, 1,
-0.6978825, -0.1437408, -1.865289, 1, 0, 0, 1, 1,
-0.694442, 0.2429073, -0.9636828, 1, 0, 0, 1, 1,
-0.686579, 2.085469, 0.825964, 1, 0, 0, 1, 1,
-0.6839347, -1.369092, -3.789434, 0, 0, 0, 1, 1,
-0.6809367, 0.6941894, -2.564168, 0, 0, 0, 1, 1,
-0.6797069, 1.007246, -1.151031, 0, 0, 0, 1, 1,
-0.6774005, 0.1113168, 1.256701, 0, 0, 0, 1, 1,
-0.6733867, -0.05307237, -0.08363713, 0, 0, 0, 1, 1,
-0.6629676, -0.7711178, -2.817486, 0, 0, 0, 1, 1,
-0.6617808, 0.4018698, -0.9245702, 0, 0, 0, 1, 1,
-0.6599155, -0.0366108, -1.059246, 1, 1, 1, 1, 1,
-0.6592966, -1.44184, -3.813984, 1, 1, 1, 1, 1,
-0.6419893, 0.0947936, -2.442091, 1, 1, 1, 1, 1,
-0.6397243, -1.131225, -3.206027, 1, 1, 1, 1, 1,
-0.6375445, -1.269065, -3.708877, 1, 1, 1, 1, 1,
-0.6328301, -0.02595945, -0.4164976, 1, 1, 1, 1, 1,
-0.6327551, -0.3893636, -1.820065, 1, 1, 1, 1, 1,
-0.631462, 2.5116, -1.438324, 1, 1, 1, 1, 1,
-0.621367, -0.9263938, -2.839791, 1, 1, 1, 1, 1,
-0.6198401, -0.6749077, -1.570139, 1, 1, 1, 1, 1,
-0.6159753, -2.128891, -2.923222, 1, 1, 1, 1, 1,
-0.6156408, -2.5996, -2.816278, 1, 1, 1, 1, 1,
-0.6152816, 0.7560716, -1.048966, 1, 1, 1, 1, 1,
-0.6140777, -0.2163817, -1.322154, 1, 1, 1, 1, 1,
-0.6128888, 0.4100972, 0.3052623, 1, 1, 1, 1, 1,
-0.6116991, -0.8382596, -1.725121, 0, 0, 1, 1, 1,
-0.6114504, -0.6150896, -0.9655483, 1, 0, 0, 1, 1,
-0.6085476, 0.06953453, -2.360471, 1, 0, 0, 1, 1,
-0.6038672, 1.021757, 0.5443618, 1, 0, 0, 1, 1,
-0.6028367, -0.09782704, -1.789768, 1, 0, 0, 1, 1,
-0.600886, -0.4925482, -2.279845, 1, 0, 0, 1, 1,
-0.5991093, 1.1323, 2.146683, 0, 0, 0, 1, 1,
-0.5959257, -0.226133, -2.177935, 0, 0, 0, 1, 1,
-0.5932934, -0.3387348, -1.20614, 0, 0, 0, 1, 1,
-0.5926234, -0.9139072, -1.422066, 0, 0, 0, 1, 1,
-0.5842854, 0.888338, -1.144864, 0, 0, 0, 1, 1,
-0.5837879, -0.05092659, -1.421323, 0, 0, 0, 1, 1,
-0.5776005, 1.829966, 0.1087273, 0, 0, 0, 1, 1,
-0.5775523, -0.5623736, -1.158735, 1, 1, 1, 1, 1,
-0.5721198, -0.5662342, -2.047959, 1, 1, 1, 1, 1,
-0.5700323, 1.03966, -1.119434, 1, 1, 1, 1, 1,
-0.5700112, 0.03278425, -1.695111, 1, 1, 1, 1, 1,
-0.565445, -0.2448806, -2.898676, 1, 1, 1, 1, 1,
-0.5535536, -0.08282669, -1.82824, 1, 1, 1, 1, 1,
-0.5520678, 0.2305242, -0.4933286, 1, 1, 1, 1, 1,
-0.5490743, -1.236116, -3.373425, 1, 1, 1, 1, 1,
-0.5488528, -0.7117429, -1.693541, 1, 1, 1, 1, 1,
-0.5465477, 1.058664, -1.896391, 1, 1, 1, 1, 1,
-0.5370511, 0.3737682, 1.506538, 1, 1, 1, 1, 1,
-0.5310848, -0.5929949, -1.543254, 1, 1, 1, 1, 1,
-0.5298839, -1.358543, -2.2729, 1, 1, 1, 1, 1,
-0.5264097, 0.827417, -0.7684034, 1, 1, 1, 1, 1,
-0.5262979, -0.6983892, -5.010652, 1, 1, 1, 1, 1,
-0.5262734, 1.907076, -0.6826078, 0, 0, 1, 1, 1,
-0.5251383, 0.4012107, 0.03417965, 1, 0, 0, 1, 1,
-0.5223929, 0.03506782, -1.175384, 1, 0, 0, 1, 1,
-0.5158474, 1.063613, 1.278453, 1, 0, 0, 1, 1,
-0.5010527, 0.729163, 0.8117912, 1, 0, 0, 1, 1,
-0.499893, 1.64814, 1.676742, 1, 0, 0, 1, 1,
-0.4932904, -0.2274492, -0.535762, 0, 0, 0, 1, 1,
-0.4849377, 0.2558967, -0.7386234, 0, 0, 0, 1, 1,
-0.4815274, 2.882918, -1.443088, 0, 0, 0, 1, 1,
-0.4788393, -0.1745277, -1.079533, 0, 0, 0, 1, 1,
-0.478125, -1.292925, -1.649996, 0, 0, 0, 1, 1,
-0.4736207, -0.2357277, -2.213647, 0, 0, 0, 1, 1,
-0.4734289, -1.102679, -2.901718, 0, 0, 0, 1, 1,
-0.4713466, 1.381126, -1.229227, 1, 1, 1, 1, 1,
-0.4697994, -0.3815909, -3.968807, 1, 1, 1, 1, 1,
-0.4680478, -0.9724281, -2.034037, 1, 1, 1, 1, 1,
-0.4633239, 0.3212108, -2.074038, 1, 1, 1, 1, 1,
-0.4629357, 0.1753901, -1.599556, 1, 1, 1, 1, 1,
-0.4614044, -0.8369138, -3.305931, 1, 1, 1, 1, 1,
-0.4585461, 2.392467, -0.6871331, 1, 1, 1, 1, 1,
-0.4572306, -1.256799, -2.95217, 1, 1, 1, 1, 1,
-0.4558044, -1.104177, -3.22406, 1, 1, 1, 1, 1,
-0.454808, 0.5864223, -0.2779768, 1, 1, 1, 1, 1,
-0.4515098, 0.7230427, -2.039388, 1, 1, 1, 1, 1,
-0.4496817, -0.7492911, -3.331217, 1, 1, 1, 1, 1,
-0.4481883, 0.4028758, -0.6745517, 1, 1, 1, 1, 1,
-0.4430023, 0.518375, -3.95492, 1, 1, 1, 1, 1,
-0.4408957, 0.5976718, -0.9411961, 1, 1, 1, 1, 1,
-0.4398219, -2.024903, -1.346371, 0, 0, 1, 1, 1,
-0.4376735, 0.1651472, -0.5121098, 1, 0, 0, 1, 1,
-0.4305044, -0.02482995, 0.07789928, 1, 0, 0, 1, 1,
-0.4304988, 0.8012097, -0.5212104, 1, 0, 0, 1, 1,
-0.4302327, 0.663402, 2.047227, 1, 0, 0, 1, 1,
-0.4269356, -0.2557444, -1.57599, 1, 0, 0, 1, 1,
-0.4156936, -0.05551666, 0.4293408, 0, 0, 0, 1, 1,
-0.4125875, 1.381468, -0.7933844, 0, 0, 0, 1, 1,
-0.4114611, 0.4083953, 0.62653, 0, 0, 0, 1, 1,
-0.4014863, -2.657411, -4.297227, 0, 0, 0, 1, 1,
-0.3945228, -0.1155695, -2.532097, 0, 0, 0, 1, 1,
-0.3942053, 1.128764, -1.213699, 0, 0, 0, 1, 1,
-0.3924961, -0.4382106, -3.764529, 0, 0, 0, 1, 1,
-0.3921151, 1.415291, -1.29239, 1, 1, 1, 1, 1,
-0.3886786, 1.057743, -0.9251413, 1, 1, 1, 1, 1,
-0.3865638, -1.138828, -2.514404, 1, 1, 1, 1, 1,
-0.3838174, -0.9754233, -2.709008, 1, 1, 1, 1, 1,
-0.3833738, -0.003805883, -0.2678794, 1, 1, 1, 1, 1,
-0.3818876, 1.626788, 2.451204, 1, 1, 1, 1, 1,
-0.377785, 1.85683, 0.08830892, 1, 1, 1, 1, 1,
-0.374588, 0.6389635, -0.899497, 1, 1, 1, 1, 1,
-0.3744611, 0.4608, 0.8541685, 1, 1, 1, 1, 1,
-0.3686189, 0.4990864, -0.5514944, 1, 1, 1, 1, 1,
-0.3666398, -1.044641, -3.610687, 1, 1, 1, 1, 1,
-0.3664842, 0.3649979, -0.9918205, 1, 1, 1, 1, 1,
-0.3623868, 0.5704782, -0.728234, 1, 1, 1, 1, 1,
-0.3599891, 0.9761382, -0.4437602, 1, 1, 1, 1, 1,
-0.356617, -0.3829684, -2.197971, 1, 1, 1, 1, 1,
-0.3547335, -0.1213878, -1.995342, 0, 0, 1, 1, 1,
-0.3500765, -0.6667867, -3.229201, 1, 0, 0, 1, 1,
-0.3473922, 1.116429, -0.9717981, 1, 0, 0, 1, 1,
-0.3462491, -0.6584866, -2.796317, 1, 0, 0, 1, 1,
-0.3442269, 1.299992, -0.631469, 1, 0, 0, 1, 1,
-0.3409684, -0.8184798, -3.800403, 1, 0, 0, 1, 1,
-0.3392024, 0.4430853, 0.3478729, 0, 0, 0, 1, 1,
-0.3391784, 1.597565, 0.3651003, 0, 0, 0, 1, 1,
-0.333535, 0.3172689, -0.8709304, 0, 0, 0, 1, 1,
-0.3316936, -0.9062093, -3.955234, 0, 0, 0, 1, 1,
-0.3306372, -0.7669109, -3.803932, 0, 0, 0, 1, 1,
-0.330615, 0.6436256, -0.08908479, 0, 0, 0, 1, 1,
-0.3230187, -0.953084, -0.887364, 0, 0, 0, 1, 1,
-0.3180019, -0.5987984, -3.133718, 1, 1, 1, 1, 1,
-0.3176401, 0.6210622, 0.4940445, 1, 1, 1, 1, 1,
-0.3162506, 0.3799087, -2.110589, 1, 1, 1, 1, 1,
-0.3156331, 0.757769, -1.210379, 1, 1, 1, 1, 1,
-0.3141899, 1.174248, -1.279336, 1, 1, 1, 1, 1,
-0.3117193, -0.006779544, -2.515882, 1, 1, 1, 1, 1,
-0.3088919, 1.219939, -0.3296826, 1, 1, 1, 1, 1,
-0.3087302, -0.2249124, -3.674776, 1, 1, 1, 1, 1,
-0.3086288, -0.2895508, -2.467722, 1, 1, 1, 1, 1,
-0.3059377, -1.954588, -3.193519, 1, 1, 1, 1, 1,
-0.3057336, 0.7707831, -0.9671988, 1, 1, 1, 1, 1,
-0.3051801, -1.002156, -2.32139, 1, 1, 1, 1, 1,
-0.3023664, 0.4133554, -0.7799389, 1, 1, 1, 1, 1,
-0.2986535, 0.1511451, -0.07573339, 1, 1, 1, 1, 1,
-0.2952914, -0.9527885, -2.553891, 1, 1, 1, 1, 1,
-0.2886778, -0.3388366, -2.663529, 0, 0, 1, 1, 1,
-0.2876563, 1.437111, -1.515237, 1, 0, 0, 1, 1,
-0.2876436, -1.137846, -3.25194, 1, 0, 0, 1, 1,
-0.2832655, 1.501901, 0.179455, 1, 0, 0, 1, 1,
-0.2777224, -0.1186781, -1.316035, 1, 0, 0, 1, 1,
-0.2666133, -0.1780408, -1.03039, 1, 0, 0, 1, 1,
-0.2660826, 0.2838157, 1.271444, 0, 0, 0, 1, 1,
-0.265667, -0.08028601, -3.063114, 0, 0, 0, 1, 1,
-0.2609608, -2.944608, -3.849536, 0, 0, 0, 1, 1,
-0.2589389, 0.7076182, -0.8775659, 0, 0, 0, 1, 1,
-0.2566325, 0.9727467, 0.1499342, 0, 0, 0, 1, 1,
-0.2552181, -0.1216451, -2.79895, 0, 0, 0, 1, 1,
-0.2550211, -0.6772279, -2.222389, 0, 0, 0, 1, 1,
-0.2533277, -1.129624, -2.261714, 1, 1, 1, 1, 1,
-0.2527951, -0.3566705, -2.233693, 1, 1, 1, 1, 1,
-0.2446036, -0.1914961, -1.824914, 1, 1, 1, 1, 1,
-0.2395162, -0.6435322, -2.586627, 1, 1, 1, 1, 1,
-0.2367076, -0.4102514, -3.113736, 1, 1, 1, 1, 1,
-0.2312893, 0.3330124, -0.8013511, 1, 1, 1, 1, 1,
-0.2310625, 0.4645403, -0.3193047, 1, 1, 1, 1, 1,
-0.2272604, 1.371507, 1.446764, 1, 1, 1, 1, 1,
-0.2257989, 0.47987, -0.1041302, 1, 1, 1, 1, 1,
-0.2245352, 0.8344606, 0.4671645, 1, 1, 1, 1, 1,
-0.2235024, -0.969113, -3.269368, 1, 1, 1, 1, 1,
-0.2227917, 0.27441, -0.7472692, 1, 1, 1, 1, 1,
-0.2218775, 1.015056, -1.037452, 1, 1, 1, 1, 1,
-0.2208916, 0.386231, -1.011855, 1, 1, 1, 1, 1,
-0.2176083, -0.669459, -1.308486, 1, 1, 1, 1, 1,
-0.2080327, 1.122861, -0.1972877, 0, 0, 1, 1, 1,
-0.2052891, -0.4951557, -3.534906, 1, 0, 0, 1, 1,
-0.2029317, 1.299203, 0.3664698, 1, 0, 0, 1, 1,
-0.2001049, 0.8610653, 0.7755024, 1, 0, 0, 1, 1,
-0.1993829, -1.717031, -3.643167, 1, 0, 0, 1, 1,
-0.1982105, 0.731451, -2.362884, 1, 0, 0, 1, 1,
-0.1907494, -1.282184, -4.305604, 0, 0, 0, 1, 1,
-0.1901952, -0.9093839, -3.702949, 0, 0, 0, 1, 1,
-0.1868822, -0.2793628, -1.555955, 0, 0, 0, 1, 1,
-0.1867791, -0.4891901, -2.718629, 0, 0, 0, 1, 1,
-0.1839392, -0.5498086, -4.655791, 0, 0, 0, 1, 1,
-0.1778292, -0.3065382, -1.790717, 0, 0, 0, 1, 1,
-0.1733388, -1.895627, -1.809013, 0, 0, 0, 1, 1,
-0.1711978, 0.1616713, -1.365452, 1, 1, 1, 1, 1,
-0.1682745, -0.7305372, -2.704229, 1, 1, 1, 1, 1,
-0.1671759, -0.6746451, -2.16878, 1, 1, 1, 1, 1,
-0.1658397, -0.4402754, -3.599786, 1, 1, 1, 1, 1,
-0.1639755, 0.3646511, -1.189487, 1, 1, 1, 1, 1,
-0.1623136, -0.7614141, -3.57842, 1, 1, 1, 1, 1,
-0.1620316, -0.3417639, -3.280355, 1, 1, 1, 1, 1,
-0.1612256, 2.139224, -0.3218197, 1, 1, 1, 1, 1,
-0.1586585, 1.18688, 0.271567, 1, 1, 1, 1, 1,
-0.1541173, -0.03368556, -1.615384, 1, 1, 1, 1, 1,
-0.1515462, 0.9561556, -0.9852025, 1, 1, 1, 1, 1,
-0.1507928, -0.2450694, -2.177343, 1, 1, 1, 1, 1,
-0.1493539, -0.2776516, -2.997268, 1, 1, 1, 1, 1,
-0.147254, -0.5188445, -4.314682, 1, 1, 1, 1, 1,
-0.145697, 0.03805845, -0.06137275, 1, 1, 1, 1, 1,
-0.1416002, 0.2278388, -0.9069239, 0, 0, 1, 1, 1,
-0.1407501, -0.9278641, -3.720578, 1, 0, 0, 1, 1,
-0.1406626, -0.297016, -2.749758, 1, 0, 0, 1, 1,
-0.1373955, 0.6664752, -0.3718413, 1, 0, 0, 1, 1,
-0.1353729, 0.5652447, -0.1895934, 1, 0, 0, 1, 1,
-0.1350952, -0.4762377, -1.786767, 1, 0, 0, 1, 1,
-0.1329695, 0.1651252, -0.5332551, 0, 0, 0, 1, 1,
-0.132635, 1.30151, 0.2483432, 0, 0, 0, 1, 1,
-0.1320176, 0.6750128, 1.359322, 0, 0, 0, 1, 1,
-0.1310943, 0.6922489, 0.6726889, 0, 0, 0, 1, 1,
-0.1295531, -1.920779, -2.572479, 0, 0, 0, 1, 1,
-0.1290959, 1.03604, -0.6465551, 0, 0, 0, 1, 1,
-0.1272745, 1.21492, 1.400891, 0, 0, 0, 1, 1,
-0.1226912, 1.452183, -0.2831275, 1, 1, 1, 1, 1,
-0.1214074, -0.2395604, -4.632584, 1, 1, 1, 1, 1,
-0.1195979, -1.492854, -4.585022, 1, 1, 1, 1, 1,
-0.1191985, -0.4950103, -2.481503, 1, 1, 1, 1, 1,
-0.1133061, -0.1443171, -2.639638, 1, 1, 1, 1, 1,
-0.1122522, -1.011652, -4.042521, 1, 1, 1, 1, 1,
-0.1102458, 0.8563306, 0.2117508, 1, 1, 1, 1, 1,
-0.1099019, 2.0157, -1.721122, 1, 1, 1, 1, 1,
-0.1084394, -0.2232603, -2.81965, 1, 1, 1, 1, 1,
-0.1079979, -1.111222, -2.348128, 1, 1, 1, 1, 1,
-0.1073338, 1.921415, -0.2779638, 1, 1, 1, 1, 1,
-0.1051547, -0.1777627, -2.944467, 1, 1, 1, 1, 1,
-0.1044225, 1.077532, 0.1359798, 1, 1, 1, 1, 1,
-0.09497485, -1.126788, -4.087753, 1, 1, 1, 1, 1,
-0.09341946, -0.9417495, -2.729772, 1, 1, 1, 1, 1,
-0.09102795, 1.836365, -0.8583961, 0, 0, 1, 1, 1,
-0.08961327, -1.290158, -0.3388153, 1, 0, 0, 1, 1,
-0.08579909, 0.5804303, -1.824108, 1, 0, 0, 1, 1,
-0.0854822, -0.07892194, -1.598998, 1, 0, 0, 1, 1,
-0.08483525, -1.280368, -4.228845, 1, 0, 0, 1, 1,
-0.0809785, -0.09995984, -5.527119, 1, 0, 0, 1, 1,
-0.08001848, 1.125261, -0.531055, 0, 0, 0, 1, 1,
-0.07751403, 0.3269629, -0.6871017, 0, 0, 0, 1, 1,
-0.07002948, -0.8895022, -2.987499, 0, 0, 0, 1, 1,
-0.0680981, -0.3571825, -3.806573, 0, 0, 0, 1, 1,
-0.06770244, -0.4340627, -3.251303, 0, 0, 0, 1, 1,
-0.06217477, -0.1483946, -3.19805, 0, 0, 0, 1, 1,
-0.05890201, -0.7476431, -3.272393, 0, 0, 0, 1, 1,
-0.05533095, -0.4923901, -1.907197, 1, 1, 1, 1, 1,
-0.04973302, 0.1000574, -0.4859985, 1, 1, 1, 1, 1,
-0.04812824, 0.2656521, -0.3169568, 1, 1, 1, 1, 1,
-0.0439108, -1.194764, -2.739744, 1, 1, 1, 1, 1,
-0.03945165, -1.07086, -4.563154, 1, 1, 1, 1, 1,
-0.0386057, -0.5969426, -3.884244, 1, 1, 1, 1, 1,
-0.03492927, -1.337297, -4.682514, 1, 1, 1, 1, 1,
-0.03418653, -0.3197307, -0.6279221, 1, 1, 1, 1, 1,
-0.03410817, -0.705618, -1.834553, 1, 1, 1, 1, 1,
-0.03396837, 1.543254, 0.3286021, 1, 1, 1, 1, 1,
-0.03268111, 0.2287788, -0.01966138, 1, 1, 1, 1, 1,
-0.0316758, 0.8186967, 1.240813, 1, 1, 1, 1, 1,
-0.03068651, -1.111107, -2.570851, 1, 1, 1, 1, 1,
-0.02824162, -1.110625, -2.505064, 1, 1, 1, 1, 1,
-0.02638846, -1.010329, -3.357256, 1, 1, 1, 1, 1,
-0.02427618, -0.3845229, -2.807398, 0, 0, 1, 1, 1,
-0.02425415, -0.2469026, -5.068823, 1, 0, 0, 1, 1,
-0.01802371, -1.630218, -2.092425, 1, 0, 0, 1, 1,
-0.01692347, 0.612393, -0.2058569, 1, 0, 0, 1, 1,
-0.01676724, -0.9718559, -1.996496, 1, 0, 0, 1, 1,
-0.01545151, -0.6166407, -1.364088, 1, 0, 0, 1, 1,
-0.01543578, -0.4945017, -4.227392, 0, 0, 0, 1, 1,
-0.01472331, 0.02783347, 0.08953118, 0, 0, 0, 1, 1,
-0.0125884, 1.183613, 0.7281763, 0, 0, 0, 1, 1,
-0.01258793, -1.033654, -2.860087, 0, 0, 0, 1, 1,
-0.008400586, 1.255082, -0.5945175, 0, 0, 0, 1, 1,
-0.006551261, -1.152715, -2.82092, 0, 0, 0, 1, 1,
4.410897e-05, -0.6734068, 2.512715, 0, 0, 0, 1, 1,
0.002657169, 0.553169, 0.2598482, 1, 1, 1, 1, 1,
0.003837378, 1.271015, -0.1395896, 1, 1, 1, 1, 1,
0.01381983, 0.02827639, 0.9992749, 1, 1, 1, 1, 1,
0.01386117, 0.5340252, -0.5584944, 1, 1, 1, 1, 1,
0.01637737, -1.117757, 2.968356, 1, 1, 1, 1, 1,
0.01794672, -0.2213833, 1.115024, 1, 1, 1, 1, 1,
0.02197938, 1.534359, -0.9585859, 1, 1, 1, 1, 1,
0.03337059, -0.227651, 0.7641221, 1, 1, 1, 1, 1,
0.03809857, 0.1145925, 0.04822915, 1, 1, 1, 1, 1,
0.04154866, 0.4058839, -0.8198264, 1, 1, 1, 1, 1,
0.04370792, -0.7531322, 4.464575, 1, 1, 1, 1, 1,
0.04495587, 0.9059303, -0.6545781, 1, 1, 1, 1, 1,
0.04697348, -0.3379012, 3.922497, 1, 1, 1, 1, 1,
0.05101907, 0.7086456, 0.7168505, 1, 1, 1, 1, 1,
0.05340829, 1.179335, 0.3119172, 1, 1, 1, 1, 1,
0.05720603, -0.7599043, 3.415683, 0, 0, 1, 1, 1,
0.05743969, -1.202769, 2.776271, 1, 0, 0, 1, 1,
0.05794492, -0.7613352, 2.920796, 1, 0, 0, 1, 1,
0.072915, -0.03225242, 1.79709, 1, 0, 0, 1, 1,
0.07548773, -1.223809, 4.473184, 1, 0, 0, 1, 1,
0.07684833, 2.627749, -2.774972, 1, 0, 0, 1, 1,
0.08137839, 1.126971, 1.83708, 0, 0, 0, 1, 1,
0.08141309, 0.9889412, 1.191268, 0, 0, 0, 1, 1,
0.08230701, -0.9401415, 4.935831, 0, 0, 0, 1, 1,
0.08387729, -0.7908958, 3.445724, 0, 0, 0, 1, 1,
0.08826255, 0.9480624, -0.633684, 0, 0, 0, 1, 1,
0.09596422, -0.2596681, 3.168228, 0, 0, 0, 1, 1,
0.09910917, 1.136711, 2.240525, 0, 0, 0, 1, 1,
0.1007382, -1.004534, 2.786192, 1, 1, 1, 1, 1,
0.1047129, -0.3254591, 4.046712, 1, 1, 1, 1, 1,
0.1057298, 0.8611833, 1.222674, 1, 1, 1, 1, 1,
0.1074185, -0.1960731, 2.002879, 1, 1, 1, 1, 1,
0.1086777, -0.5647284, 3.3318, 1, 1, 1, 1, 1,
0.1124496, -0.1128474, 3.075574, 1, 1, 1, 1, 1,
0.1166974, -0.9772033, 2.852817, 1, 1, 1, 1, 1,
0.1176608, -0.2078304, 2.157613, 1, 1, 1, 1, 1,
0.1207951, 0.2386005, 0.2774036, 1, 1, 1, 1, 1,
0.1227927, 0.02332204, 1.201339, 1, 1, 1, 1, 1,
0.122832, 0.5821736, 2.156864, 1, 1, 1, 1, 1,
0.1240432, 0.3721298, -0.6816258, 1, 1, 1, 1, 1,
0.1260023, -0.2790717, 3.903383, 1, 1, 1, 1, 1,
0.1280521, 0.03564364, 1.618536, 1, 1, 1, 1, 1,
0.1283525, -0.425068, 1.845993, 1, 1, 1, 1, 1,
0.1299914, -0.6575366, 2.823871, 0, 0, 1, 1, 1,
0.1339927, -0.3316128, 3.394461, 1, 0, 0, 1, 1,
0.135953, -2.050128, 3.398275, 1, 0, 0, 1, 1,
0.1413962, 0.2695042, -0.8323226, 1, 0, 0, 1, 1,
0.1460142, -1.96826, 3.137902, 1, 0, 0, 1, 1,
0.157314, 0.699089, -0.4130619, 1, 0, 0, 1, 1,
0.1576725, -0.6097455, 2.866804, 0, 0, 0, 1, 1,
0.1605774, 0.8535137, 0.1243306, 0, 0, 0, 1, 1,
0.1637484, -0.7200062, 3.2899, 0, 0, 0, 1, 1,
0.1678996, -0.9650511, 1.483714, 0, 0, 0, 1, 1,
0.1708279, -0.6241263, 2.879013, 0, 0, 0, 1, 1,
0.1715626, 0.5334166, 1.000737, 0, 0, 0, 1, 1,
0.1734053, -1.088061, 1.91391, 0, 0, 0, 1, 1,
0.1738068, 1.096442, 1.618869, 1, 1, 1, 1, 1,
0.1797806, -1.038986, 2.296373, 1, 1, 1, 1, 1,
0.1905112, -0.4966285, 3.265675, 1, 1, 1, 1, 1,
0.1927147, 0.822382, 0.6434068, 1, 1, 1, 1, 1,
0.1964565, -0.2470621, 2.283283, 1, 1, 1, 1, 1,
0.2020375, 2.073424, -0.4587519, 1, 1, 1, 1, 1,
0.2062799, -0.5877308, 3.940305, 1, 1, 1, 1, 1,
0.2080043, 0.3927076, 0.004184422, 1, 1, 1, 1, 1,
0.2081379, 0.5090618, 0.6806926, 1, 1, 1, 1, 1,
0.208167, -0.7482792, 2.8306, 1, 1, 1, 1, 1,
0.2103115, 1.907622, -1.243629, 1, 1, 1, 1, 1,
0.2110988, 0.4026691, 1.373036, 1, 1, 1, 1, 1,
0.2136088, 1.043826, 1.190064, 1, 1, 1, 1, 1,
0.2158959, 1.006474, -0.4059775, 1, 1, 1, 1, 1,
0.2206851, 1.687886, -0.2144421, 1, 1, 1, 1, 1,
0.2242239, 0.5136858, 2.376044, 0, 0, 1, 1, 1,
0.224494, 0.007105287, 1.294753, 1, 0, 0, 1, 1,
0.2257966, -0.05743649, 0.9055607, 1, 0, 0, 1, 1,
0.232986, 1.389627, 1.435071, 1, 0, 0, 1, 1,
0.2333514, 0.4126003, -0.4356152, 1, 0, 0, 1, 1,
0.2352385, 1.187259, -0.8586375, 1, 0, 0, 1, 1,
0.2358132, 0.7602008, 0.8836512, 0, 0, 0, 1, 1,
0.2358826, -0.5512754, 1.82668, 0, 0, 0, 1, 1,
0.236438, 0.3601915, 0.5723553, 0, 0, 0, 1, 1,
0.2400557, -0.1134809, 3.800424, 0, 0, 0, 1, 1,
0.24281, 0.7377085, 1.463495, 0, 0, 0, 1, 1,
0.2498585, -1.111919, 4.80321, 0, 0, 0, 1, 1,
0.2509731, -1.234328, 4.268916, 0, 0, 0, 1, 1,
0.2537594, -1.527999, 3.416062, 1, 1, 1, 1, 1,
0.2586133, -0.2770706, 3.59193, 1, 1, 1, 1, 1,
0.2608792, -0.5940185, 2.680523, 1, 1, 1, 1, 1,
0.2617055, 0.4694359, 1.54271, 1, 1, 1, 1, 1,
0.2650752, 2.044037, 0.2259306, 1, 1, 1, 1, 1,
0.2657435, -1.170272, 4.108184, 1, 1, 1, 1, 1,
0.2682522, 1.234638, -0.5683585, 1, 1, 1, 1, 1,
0.2790746, 0.7366061, -1.234437, 1, 1, 1, 1, 1,
0.2828165, 0.3302777, 0.6384664, 1, 1, 1, 1, 1,
0.2846251, -0.1552895, 3.036403, 1, 1, 1, 1, 1,
0.2849109, 1.144045, -0.7874099, 1, 1, 1, 1, 1,
0.2849952, 0.4378537, 0.04451078, 1, 1, 1, 1, 1,
0.285007, 0.105559, -0.6912754, 1, 1, 1, 1, 1,
0.2861187, -1.244027, 2.640293, 1, 1, 1, 1, 1,
0.2867718, 0.09164127, 1.639221, 1, 1, 1, 1, 1,
0.2873034, -0.3676615, 3.471149, 0, 0, 1, 1, 1,
0.2874772, -0.5666065, 2.618376, 1, 0, 0, 1, 1,
0.2933042, 0.7875159, 0.8485256, 1, 0, 0, 1, 1,
0.2970898, -0.7390711, 3.333975, 1, 0, 0, 1, 1,
0.2981078, -0.3507305, 1.810844, 1, 0, 0, 1, 1,
0.3006826, -0.5212426, 2.65362, 1, 0, 0, 1, 1,
0.3069536, 1.01371, 0.8248302, 0, 0, 0, 1, 1,
0.3078221, 1.07725, -1.178435, 0, 0, 0, 1, 1,
0.3136925, -0.8283845, 3.355072, 0, 0, 0, 1, 1,
0.3154126, -0.1945869, 1.622934, 0, 0, 0, 1, 1,
0.3170083, 0.3965226, 1.278568, 0, 0, 0, 1, 1,
0.3285701, 0.8546206, 1.021884, 0, 0, 0, 1, 1,
0.3350983, -0.4463158, 5.224243, 0, 0, 0, 1, 1,
0.3422956, -0.1514147, 2.877334, 1, 1, 1, 1, 1,
0.3430183, -0.2743289, 2.64905, 1, 1, 1, 1, 1,
0.3508325, 0.8270052, 0.7734147, 1, 1, 1, 1, 1,
0.3624441, 0.9515219, -1.117505, 1, 1, 1, 1, 1,
0.3627429, -0.3862763, 2.645539, 1, 1, 1, 1, 1,
0.3628502, -0.397058, 0.1933393, 1, 1, 1, 1, 1,
0.3639138, 0.3571907, -0.9318122, 1, 1, 1, 1, 1,
0.3648556, 0.4452656, -0.9474711, 1, 1, 1, 1, 1,
0.3652413, 0.9205233, 1.147813, 1, 1, 1, 1, 1,
0.3659937, -0.1845243, 1.449032, 1, 1, 1, 1, 1,
0.3679948, 1.292014, -0.3514103, 1, 1, 1, 1, 1,
0.3688433, 0.7926332, 0.9752446, 1, 1, 1, 1, 1,
0.369568, -0.54519, 1.78051, 1, 1, 1, 1, 1,
0.3711685, -0.1194075, 1.517019, 1, 1, 1, 1, 1,
0.3769791, -1.421696, 2.362885, 1, 1, 1, 1, 1,
0.3801228, 1.14241, 1.53347, 0, 0, 1, 1, 1,
0.3805666, 1.087783, -0.2839089, 1, 0, 0, 1, 1,
0.3820085, 0.5805364, -0.8804366, 1, 0, 0, 1, 1,
0.3820147, 0.6889673, -0.5889102, 1, 0, 0, 1, 1,
0.3858969, 0.4295454, -0.102223, 1, 0, 0, 1, 1,
0.387851, 2.039365, -2.076923, 1, 0, 0, 1, 1,
0.3888424, 0.8407485, 1.16426, 0, 0, 0, 1, 1,
0.3979759, 1.355471, 0.4680288, 0, 0, 0, 1, 1,
0.3999494, -0.6608265, 1.380715, 0, 0, 0, 1, 1,
0.4003877, 0.3951801, -0.2852804, 0, 0, 0, 1, 1,
0.4030956, -0.04748326, 3.730808, 0, 0, 0, 1, 1,
0.4056288, -0.3825842, 1.460959, 0, 0, 0, 1, 1,
0.406286, -0.3660173, 2.627144, 0, 0, 0, 1, 1,
0.4068846, -0.09294446, 3.940293, 1, 1, 1, 1, 1,
0.4081115, 0.3455141, 1.724116, 1, 1, 1, 1, 1,
0.4095976, -1.042633, 2.159378, 1, 1, 1, 1, 1,
0.4154005, -0.6669915, 2.214386, 1, 1, 1, 1, 1,
0.4164746, -1.575582, 3.492525, 1, 1, 1, 1, 1,
0.4169354, -0.500238, 2.484884, 1, 1, 1, 1, 1,
0.4243433, 0.2924232, 0.2409105, 1, 1, 1, 1, 1,
0.4264509, 0.9892679, 0.775622, 1, 1, 1, 1, 1,
0.4353382, -1.188943, 2.470413, 1, 1, 1, 1, 1,
0.4403037, 1.014668, 0.8628137, 1, 1, 1, 1, 1,
0.4417589, 0.4091659, 0.7162156, 1, 1, 1, 1, 1,
0.4457712, 0.6327113, 1.316493, 1, 1, 1, 1, 1,
0.4504848, 0.7577559, -1.38469, 1, 1, 1, 1, 1,
0.4534153, 0.6810725, 0.7309837, 1, 1, 1, 1, 1,
0.4560204, 1.719291, 0.5951478, 1, 1, 1, 1, 1,
0.4570836, -0.01814482, 0.5901687, 0, 0, 1, 1, 1,
0.459734, 1.045684, -0.2983291, 1, 0, 0, 1, 1,
0.4632658, 0.8735303, 1.152172, 1, 0, 0, 1, 1,
0.4665665, 1.137622, 0.09069775, 1, 0, 0, 1, 1,
0.4666317, -0.2097795, 1.442443, 1, 0, 0, 1, 1,
0.4742962, 0.7540879, 0.5301592, 1, 0, 0, 1, 1,
0.4768511, -0.6209093, 2.274236, 0, 0, 0, 1, 1,
0.4789441, -0.9082539, 2.338978, 0, 0, 0, 1, 1,
0.4912211, 0.264425, -0.06154551, 0, 0, 0, 1, 1,
0.4924097, 0.8415427, -1.423931, 0, 0, 0, 1, 1,
0.4928224, -0.1265675, 1.050151, 0, 0, 0, 1, 1,
0.4947128, -1.699053, 3.610478, 0, 0, 0, 1, 1,
0.4952143, -0.189566, 3.021966, 0, 0, 0, 1, 1,
0.4962659, -1.750879, 2.166953, 1, 1, 1, 1, 1,
0.496989, 0.3782777, 0.02982701, 1, 1, 1, 1, 1,
0.4973707, -0.4617883, 2.009425, 1, 1, 1, 1, 1,
0.4977899, -0.4530182, 1.369867, 1, 1, 1, 1, 1,
0.4988052, 0.9184793, 2.505921, 1, 1, 1, 1, 1,
0.5046152, 0.5117746, 0.6608317, 1, 1, 1, 1, 1,
0.5067106, -0.709837, 3.228552, 1, 1, 1, 1, 1,
0.510483, 1.942001, 2.34094, 1, 1, 1, 1, 1,
0.5106119, 0.4174848, -0.2748399, 1, 1, 1, 1, 1,
0.5120594, 0.3616248, 0.19771, 1, 1, 1, 1, 1,
0.5134192, 0.01377637, 2.481017, 1, 1, 1, 1, 1,
0.5161945, -1.173156, 2.766324, 1, 1, 1, 1, 1,
0.5175808, 1.523287, -0.5784274, 1, 1, 1, 1, 1,
0.51939, 0.5487623, 0.7360308, 1, 1, 1, 1, 1,
0.5202568, 1.130191, 1.764207, 1, 1, 1, 1, 1,
0.5243887, -0.01325338, 1.649699, 0, 0, 1, 1, 1,
0.5245408, 0.5805726, -0.2763632, 1, 0, 0, 1, 1,
0.5261171, -1.324247, 3.577262, 1, 0, 0, 1, 1,
0.5268626, 0.4015744, 0.6302789, 1, 0, 0, 1, 1,
0.5319822, -1.086986, 2.383725, 1, 0, 0, 1, 1,
0.5336708, -0.4709683, 3.275238, 1, 0, 0, 1, 1,
0.5341638, -0.6431615, 2.978666, 0, 0, 0, 1, 1,
0.5359133, 1.361095, -0.7388013, 0, 0, 0, 1, 1,
0.53686, -1.213468, 2.572481, 0, 0, 0, 1, 1,
0.5400147, -0.4380477, 2.188472, 0, 0, 0, 1, 1,
0.5402446, 0.3097303, 1.874295, 0, 0, 0, 1, 1,
0.541572, 0.3403315, 0.6162881, 0, 0, 0, 1, 1,
0.5436164, -0.7350661, 2.840898, 0, 0, 0, 1, 1,
0.5463336, 0.9771612, -0.3686246, 1, 1, 1, 1, 1,
0.5487448, -0.4319102, 2.894207, 1, 1, 1, 1, 1,
0.5497609, -1.182063, 1.586025, 1, 1, 1, 1, 1,
0.5507004, -0.6250213, 1.984369, 1, 1, 1, 1, 1,
0.5531516, 0.1508658, 1.150609, 1, 1, 1, 1, 1,
0.5537282, 1.498303, 0.9150602, 1, 1, 1, 1, 1,
0.5562046, 0.8689111, -0.6601461, 1, 1, 1, 1, 1,
0.5562714, -0.22198, 2.733768, 1, 1, 1, 1, 1,
0.5648649, -0.2462002, 2.719146, 1, 1, 1, 1, 1,
0.5680454, -0.7603481, 2.379203, 1, 1, 1, 1, 1,
0.5695287, 0.3599627, 1.723914, 1, 1, 1, 1, 1,
0.5749124, -0.7226549, 0.9635758, 1, 1, 1, 1, 1,
0.5775801, 0.1449608, 2.533498, 1, 1, 1, 1, 1,
0.5794751, -2.760179, 2.176854, 1, 1, 1, 1, 1,
0.5802758, 0.6568618, 0.6161705, 1, 1, 1, 1, 1,
0.5805519, -0.8312464, 3.428272, 0, 0, 1, 1, 1,
0.5818586, 0.3398658, 1.390367, 1, 0, 0, 1, 1,
0.582052, -3.237316, 2.227995, 1, 0, 0, 1, 1,
0.5839453, 1.231561, 1.874265, 1, 0, 0, 1, 1,
0.590057, -0.2144564, 2.41836, 1, 0, 0, 1, 1,
0.5998457, 0.2338154, 1.287306, 1, 0, 0, 1, 1,
0.6029874, -0.2029567, 3.309175, 0, 0, 0, 1, 1,
0.6085824, 0.2621175, 1.940244, 0, 0, 0, 1, 1,
0.6114824, -0.8912514, 0.4835434, 0, 0, 0, 1, 1,
0.6164247, -1.396535, 2.431302, 0, 0, 0, 1, 1,
0.6329242, 2.340779, 0.2596596, 0, 0, 0, 1, 1,
0.6346919, -1.651668, 1.753839, 0, 0, 0, 1, 1,
0.6370101, 0.03964352, 1.753817, 0, 0, 0, 1, 1,
0.639295, -1.199951, 2.565952, 1, 1, 1, 1, 1,
0.6559467, 0.4669769, 1.084557, 1, 1, 1, 1, 1,
0.6568307, -0.6178014, 2.915687, 1, 1, 1, 1, 1,
0.6590742, -0.7338386, 3.907197, 1, 1, 1, 1, 1,
0.6616939, -1.18572, 1.681839, 1, 1, 1, 1, 1,
0.6664131, 1.215229, 0.6328064, 1, 1, 1, 1, 1,
0.6683271, 0.08362065, 2.963768, 1, 1, 1, 1, 1,
0.6719874, -0.8363618, 0.3880707, 1, 1, 1, 1, 1,
0.6721192, 0.0930251, -0.03724965, 1, 1, 1, 1, 1,
0.6735394, -0.6582311, 3.888211, 1, 1, 1, 1, 1,
0.6783179, 0.7659387, 1.263442, 1, 1, 1, 1, 1,
0.6789124, -0.7063586, 2.179163, 1, 1, 1, 1, 1,
0.6796829, 0.3857254, -0.1774316, 1, 1, 1, 1, 1,
0.6818, 2.223412, 0.75796, 1, 1, 1, 1, 1,
0.6881397, -1.304353, 3.431744, 1, 1, 1, 1, 1,
0.6936045, 1.623153, 0.9104363, 0, 0, 1, 1, 1,
0.694757, -0.2579255, 0.7475492, 1, 0, 0, 1, 1,
0.6972576, 0.8641443, -0.009508158, 1, 0, 0, 1, 1,
0.697657, 0.2378384, 1.311224, 1, 0, 0, 1, 1,
0.6996545, -0.1907916, 2.030114, 1, 0, 0, 1, 1,
0.7058054, -0.0458875, 3.6616, 1, 0, 0, 1, 1,
0.7081532, -0.03844576, 2.836365, 0, 0, 0, 1, 1,
0.7339097, 0.7144023, 0.6925448, 0, 0, 0, 1, 1,
0.7346957, -0.005541888, 2.121918, 0, 0, 0, 1, 1,
0.7380003, -0.6704903, 3.829291, 0, 0, 0, 1, 1,
0.741787, -0.3126112, 3.085958, 0, 0, 0, 1, 1,
0.7449524, 2.68671, 2.377459, 0, 0, 0, 1, 1,
0.7552077, 0.03159289, 2.500133, 0, 0, 0, 1, 1,
0.7568033, -0.1414057, 1.359714, 1, 1, 1, 1, 1,
0.7665248, 0.1923307, 2.733679, 1, 1, 1, 1, 1,
0.7679067, 0.1753233, 1.156618, 1, 1, 1, 1, 1,
0.7684116, -0.3308038, 3.444132, 1, 1, 1, 1, 1,
0.7684767, -0.01507602, 1.615384, 1, 1, 1, 1, 1,
0.768584, 0.2672842, 0.2757542, 1, 1, 1, 1, 1,
0.7687351, -0.7701471, 1.4621, 1, 1, 1, 1, 1,
0.7702534, -0.7176855, 0.917369, 1, 1, 1, 1, 1,
0.77125, -0.4213136, 3.244769, 1, 1, 1, 1, 1,
0.7718808, 0.5244359, 2.070073, 1, 1, 1, 1, 1,
0.7720526, -0.1005865, 3.106231, 1, 1, 1, 1, 1,
0.7731333, 0.3078718, 0.5986494, 1, 1, 1, 1, 1,
0.7760961, -0.5528091, 2.256588, 1, 1, 1, 1, 1,
0.7772433, 0.5617703, 2.18548, 1, 1, 1, 1, 1,
0.7883819, 0.4047202, 1.650519, 1, 1, 1, 1, 1,
0.7940818, 2.543838, -0.1290793, 0, 0, 1, 1, 1,
0.7948827, 0.5123631, 2.307454, 1, 0, 0, 1, 1,
0.7972507, -0.8072547, 3.672913, 1, 0, 0, 1, 1,
0.7973272, 0.7462255, 1.389857, 1, 0, 0, 1, 1,
0.7982965, -0.9289837, 1.530437, 1, 0, 0, 1, 1,
0.8012589, -1.612786, 2.605174, 1, 0, 0, 1, 1,
0.8023709, 2.248669, -0.3234155, 0, 0, 0, 1, 1,
0.8026356, 1.043406, 1.08758, 0, 0, 0, 1, 1,
0.8036852, 2.113404, 2.450716, 0, 0, 0, 1, 1,
0.8058705, -1.305785, 1.752358, 0, 0, 0, 1, 1,
0.8127662, -0.3741827, 2.083388, 0, 0, 0, 1, 1,
0.8131052, 1.618236, -0.006010768, 0, 0, 0, 1, 1,
0.8164999, -0.3217612, 0.7300246, 0, 0, 0, 1, 1,
0.8176955, 0.9230617, 1.3051, 1, 1, 1, 1, 1,
0.818496, -0.5903305, 2.618017, 1, 1, 1, 1, 1,
0.8193712, 1.183617, 1.166524, 1, 1, 1, 1, 1,
0.8263931, 0.407674, 0.3428754, 1, 1, 1, 1, 1,
0.8268616, 0.895536, 0.7624108, 1, 1, 1, 1, 1,
0.8326063, 0.8036801, -0.1605835, 1, 1, 1, 1, 1,
0.8376803, 0.4842037, 1.486566, 1, 1, 1, 1, 1,
0.839695, -0.6273714, 3.367856, 1, 1, 1, 1, 1,
0.840751, 0.4667249, 2.158403, 1, 1, 1, 1, 1,
0.8436226, 0.4556365, -0.3573764, 1, 1, 1, 1, 1,
0.8464618, -0.6506619, 1.735624, 1, 1, 1, 1, 1,
0.8512533, 1.43973, -1.221623, 1, 1, 1, 1, 1,
0.8539919, -0.09778448, 1.475527, 1, 1, 1, 1, 1,
0.8543072, -0.4060893, 1.485906, 1, 1, 1, 1, 1,
0.8609536, 0.3262382, 1.647346, 1, 1, 1, 1, 1,
0.867074, 0.829981, -0.1293489, 0, 0, 1, 1, 1,
0.8733757, -1.076771, 2.49498, 1, 0, 0, 1, 1,
0.876316, 1.628988, -0.5381681, 1, 0, 0, 1, 1,
0.8763636, -0.8704072, 1.450134, 1, 0, 0, 1, 1,
0.8838264, -0.9020466, 0.2881979, 1, 0, 0, 1, 1,
0.8856285, -1.384604, 1.724742, 1, 0, 0, 1, 1,
0.8874798, 0.571147, 1.38685, 0, 0, 0, 1, 1,
0.8891624, 0.9684847, 2.94194, 0, 0, 0, 1, 1,
0.8903811, 0.3302169, 2.615584, 0, 0, 0, 1, 1,
0.8908828, -0.1005771, 3.727746, 0, 0, 0, 1, 1,
0.8917668, -1.041342, 0.4675478, 0, 0, 0, 1, 1,
0.8923516, -1.583981, 1.878435, 0, 0, 0, 1, 1,
0.8937181, -0.1704916, 2.280046, 0, 0, 0, 1, 1,
0.8978736, -2.422557, 1.738733, 1, 1, 1, 1, 1,
0.9012526, -0.5033233, 0.3116484, 1, 1, 1, 1, 1,
0.9040676, -0.3528332, 2.738408, 1, 1, 1, 1, 1,
0.9056084, 2.29637, 0.9415526, 1, 1, 1, 1, 1,
0.9080353, 1.462951, 0.4755966, 1, 1, 1, 1, 1,
0.90826, 0.08870975, 1.873409, 1, 1, 1, 1, 1,
0.9084783, -0.1952787, 3.200937, 1, 1, 1, 1, 1,
0.914579, -0.5235376, 1.891654, 1, 1, 1, 1, 1,
0.9171611, 0.2332168, 2.017437, 1, 1, 1, 1, 1,
0.9181727, -1.357118, 2.701988, 1, 1, 1, 1, 1,
0.9184834, 0.09106257, 1.687349, 1, 1, 1, 1, 1,
0.9215118, -1.033654, 2.548435, 1, 1, 1, 1, 1,
0.9252715, -0.824632, 1.218344, 1, 1, 1, 1, 1,
0.9285087, -0.1889495, 2.411679, 1, 1, 1, 1, 1,
0.9296941, 0.4587391, 1.34472, 1, 1, 1, 1, 1,
0.9301566, -0.4777298, 1.46336, 0, 0, 1, 1, 1,
0.9305234, 0.3483672, 0.2649181, 1, 0, 0, 1, 1,
0.9365798, -0.9735034, 1.772333, 1, 0, 0, 1, 1,
0.9369485, 1.310307, 2.315852, 1, 0, 0, 1, 1,
0.9430774, 1.387119, 0.2252349, 1, 0, 0, 1, 1,
0.9447424, 0.1031485, 0.2454114, 1, 0, 0, 1, 1,
0.9469076, 1.439749, 1.228191, 0, 0, 0, 1, 1,
0.948769, -0.5761365, 3.978563, 0, 0, 0, 1, 1,
0.9494615, 1.396484, 1.493962, 0, 0, 0, 1, 1,
0.9510133, 1.096008, 0.7049237, 0, 0, 0, 1, 1,
0.9533214, -0.7414199, 2.399521, 0, 0, 0, 1, 1,
0.955318, -0.8938835, 1.702205, 0, 0, 0, 1, 1,
0.9556947, 0.1667276, 2.010953, 0, 0, 0, 1, 1,
0.9607793, -0.4779094, 2.171979, 1, 1, 1, 1, 1,
0.9632294, -0.5148268, 2.786887, 1, 1, 1, 1, 1,
0.9645108, -1.560761, 3.054061, 1, 1, 1, 1, 1,
0.9655932, -1.030174, 2.660393, 1, 1, 1, 1, 1,
0.9657484, 1.223712, -0.006003675, 1, 1, 1, 1, 1,
0.9672614, 0.194494, 1.699049, 1, 1, 1, 1, 1,
0.9698582, 0.4947519, -0.3338448, 1, 1, 1, 1, 1,
0.9728359, -1.097023, 3.866038, 1, 1, 1, 1, 1,
0.9737813, 0.1994255, 1.452293, 1, 1, 1, 1, 1,
0.9754046, -1.190416, 0.718447, 1, 1, 1, 1, 1,
1.002601, 1.663946, 0.06550656, 1, 1, 1, 1, 1,
1.004295, 0.2937382, 0.0172239, 1, 1, 1, 1, 1,
1.007321, 1.010407, 0.07258432, 1, 1, 1, 1, 1,
1.008251, -0.3452519, 0.8012689, 1, 1, 1, 1, 1,
1.008517, -0.3054695, -1.066384, 1, 1, 1, 1, 1,
1.017234, 3.296884, 0.06778741, 0, 0, 1, 1, 1,
1.021255, 0.2476157, 1.962574, 1, 0, 0, 1, 1,
1.022744, -0.3222122, 3.334887, 1, 0, 0, 1, 1,
1.029383, 0.4239176, 0.5714099, 1, 0, 0, 1, 1,
1.031996, -0.7956126, 2.449884, 1, 0, 0, 1, 1,
1.032301, 1.756853, 0.7100577, 1, 0, 0, 1, 1,
1.045181, 0.6081322, 2.045197, 0, 0, 0, 1, 1,
1.088094, -0.6543391, 2.798112, 0, 0, 0, 1, 1,
1.092327, -1.224648, 1.265356, 0, 0, 0, 1, 1,
1.093339, -0.5280532, 1.439681, 0, 0, 0, 1, 1,
1.09756, 0.362606, 0.1289981, 0, 0, 0, 1, 1,
1.101637, -0.8048924, 1.831488, 0, 0, 0, 1, 1,
1.10229, -1.869638, 4.724193, 0, 0, 0, 1, 1,
1.106824, 0.09599329, 1.676041, 1, 1, 1, 1, 1,
1.108888, -0.129884, 1.801559, 1, 1, 1, 1, 1,
1.110849, -0.2436246, 1.458722, 1, 1, 1, 1, 1,
1.110911, -1.023865, 1.745984, 1, 1, 1, 1, 1,
1.113116, 0.3215632, 0.6405264, 1, 1, 1, 1, 1,
1.113365, -0.1294166, 0.5192691, 1, 1, 1, 1, 1,
1.117539, 0.3264199, 1.483094, 1, 1, 1, 1, 1,
1.121742, -0.06580413, 2.830976, 1, 1, 1, 1, 1,
1.129239, -0.02959119, 2.125587, 1, 1, 1, 1, 1,
1.131274, 1.119643, -1.573176, 1, 1, 1, 1, 1,
1.13407, -0.4242968, 1.236744, 1, 1, 1, 1, 1,
1.134805, -0.2044157, 2.87642, 1, 1, 1, 1, 1,
1.138001, -0.1346871, -0.4732537, 1, 1, 1, 1, 1,
1.147517, -1.802209, 3.480361, 1, 1, 1, 1, 1,
1.154292, -0.05529862, 3.070259, 1, 1, 1, 1, 1,
1.160161, -0.368241, 1.989974, 0, 0, 1, 1, 1,
1.160822, -0.1449527, 0.9558179, 1, 0, 0, 1, 1,
1.163702, 0.9187678, 0.7619922, 1, 0, 0, 1, 1,
1.164845, -0.3804564, 0.7424653, 1, 0, 0, 1, 1,
1.179009, -0.9403979, 2.96265, 1, 0, 0, 1, 1,
1.184738, 0.05637494, 1.824149, 1, 0, 0, 1, 1,
1.189139, -0.103584, 1.573279, 0, 0, 0, 1, 1,
1.191055, 0.2642513, 1.912955, 0, 0, 0, 1, 1,
1.203092, -1.172308, 1.138271, 0, 0, 0, 1, 1,
1.218831, 0.7791346, 0.7937329, 0, 0, 0, 1, 1,
1.222207, 0.1043155, 1.320519, 0, 0, 0, 1, 1,
1.222569, 0.5243319, 2.581541, 0, 0, 0, 1, 1,
1.232536, 0.03528783, 1.564752, 0, 0, 0, 1, 1,
1.234203, 0.2984098, 1.473899, 1, 1, 1, 1, 1,
1.234523, -0.4704201, 1.607804, 1, 1, 1, 1, 1,
1.240532, -1.327681, 2.627995, 1, 1, 1, 1, 1,
1.249498, 0.5908107, 1.553736, 1, 1, 1, 1, 1,
1.272218, 0.250332, 2.651751, 1, 1, 1, 1, 1,
1.276397, 0.3433183, 1.151383, 1, 1, 1, 1, 1,
1.280136, -0.8189277, 2.626289, 1, 1, 1, 1, 1,
1.283029, -0.6953413, 2.800324, 1, 1, 1, 1, 1,
1.293027, -0.1621845, 0.934797, 1, 1, 1, 1, 1,
1.313732, -1.0123, 1.667065, 1, 1, 1, 1, 1,
1.318759, 1.556129, 1.15539, 1, 1, 1, 1, 1,
1.320813, 0.8423026, 0.448648, 1, 1, 1, 1, 1,
1.323798, -1.442522, 0.2346156, 1, 1, 1, 1, 1,
1.324015, -1.517848, 1.13343, 1, 1, 1, 1, 1,
1.3244, 1.352929, 0.6816671, 1, 1, 1, 1, 1,
1.325389, 0.1827241, 3.34416, 0, 0, 1, 1, 1,
1.335786, 0.1381015, 2.889977, 1, 0, 0, 1, 1,
1.344374, -0.2746398, 2.032223, 1, 0, 0, 1, 1,
1.352201, -0.01448437, 0.529768, 1, 0, 0, 1, 1,
1.353191, -0.886642, 0.5230623, 1, 0, 0, 1, 1,
1.355964, -1.029061, 3.184882, 1, 0, 0, 1, 1,
1.372952, -0.5443214, 3.02833, 0, 0, 0, 1, 1,
1.374089, -2.460057, 3.118014, 0, 0, 0, 1, 1,
1.375676, 0.6918652, 0.2511205, 0, 0, 0, 1, 1,
1.387188, 0.9736398, 1.860585, 0, 0, 0, 1, 1,
1.389517, -0.1733943, 2.636158, 0, 0, 0, 1, 1,
1.389582, 0.3585131, 0.6548492, 0, 0, 0, 1, 1,
1.391355, 0.4740175, 2.742485, 0, 0, 0, 1, 1,
1.392169, 0.1052337, 1.514946, 1, 1, 1, 1, 1,
1.409793, 3.004193, 0.3842149, 1, 1, 1, 1, 1,
1.412947, 1.033788, 0.1825311, 1, 1, 1, 1, 1,
1.421893, -0.4948012, 0.05908774, 1, 1, 1, 1, 1,
1.422965, -0.6551774, 0.253228, 1, 1, 1, 1, 1,
1.425546, 0.3376759, 1.402213, 1, 1, 1, 1, 1,
1.439367, -0.9167294, 3.515386, 1, 1, 1, 1, 1,
1.444395, -0.1503277, 2.022186, 1, 1, 1, 1, 1,
1.450845, -0.8844485, 2.309621, 1, 1, 1, 1, 1,
1.451123, -0.5870023, 2.861115, 1, 1, 1, 1, 1,
1.451936, 1.343814, 0.3214046, 1, 1, 1, 1, 1,
1.454288, -0.337417, 3.252624, 1, 1, 1, 1, 1,
1.458401, -0.6548184, 2.781139, 1, 1, 1, 1, 1,
1.465975, -0.3934056, 1.961336, 1, 1, 1, 1, 1,
1.466425, 1.025381, -0.1399232, 1, 1, 1, 1, 1,
1.475981, -2.038836, 2.945481, 0, 0, 1, 1, 1,
1.479775, -1.121426, 3.049646, 1, 0, 0, 1, 1,
1.482866, 0.07292601, 1.446917, 1, 0, 0, 1, 1,
1.495922, -0.3802548, -0.006653921, 1, 0, 0, 1, 1,
1.506235, -0.9896188, 1.518331, 1, 0, 0, 1, 1,
1.522385, 0.8854376, -0.5396839, 1, 0, 0, 1, 1,
1.524714, -2.387523, 3.672574, 0, 0, 0, 1, 1,
1.531795, 0.004821203, 1.758199, 0, 0, 0, 1, 1,
1.535383, -0.7358073, 0.3791981, 0, 0, 0, 1, 1,
1.541875, -1.434388, 1.757152, 0, 0, 0, 1, 1,
1.557247, -0.1371965, 1.787442, 0, 0, 0, 1, 1,
1.566435, 0.7350134, -1.034086, 0, 0, 0, 1, 1,
1.56857, -2.447109, 1.84022, 0, 0, 0, 1, 1,
1.582007, 1.290121, -0.09395389, 1, 1, 1, 1, 1,
1.587251, 0.06239291, 3.002713, 1, 1, 1, 1, 1,
1.595209, -0.0252083, 1.808721, 1, 1, 1, 1, 1,
1.635346, 0.9024276, 0.2627905, 1, 1, 1, 1, 1,
1.638802, -0.07136603, 0.9907365, 1, 1, 1, 1, 1,
1.640934, 0.1918633, 3.04907, 1, 1, 1, 1, 1,
1.651795, -0.08209983, 1.023825, 1, 1, 1, 1, 1,
1.657711, -2.848763, 1.328285, 1, 1, 1, 1, 1,
1.674958, -0.1751453, -0.112667, 1, 1, 1, 1, 1,
1.724954, 0.6126364, 0.41347, 1, 1, 1, 1, 1,
1.728326, -0.702524, 1.473317, 1, 1, 1, 1, 1,
1.739134, -0.4671115, 1.558439, 1, 1, 1, 1, 1,
1.79287, 1.017648, -0.1748327, 1, 1, 1, 1, 1,
1.8138, -0.7357143, 1.493126, 1, 1, 1, 1, 1,
1.816078, 0.6201116, 0.887237, 1, 1, 1, 1, 1,
1.820843, -0.9847231, 1.289086, 0, 0, 1, 1, 1,
1.826497, -0.3602705, 2.305663, 1, 0, 0, 1, 1,
1.830927, 1.753462, -1.073397, 1, 0, 0, 1, 1,
1.930777, -0.5072424, 1.276616, 1, 0, 0, 1, 1,
1.934304, 0.3813176, 2.295506, 1, 0, 0, 1, 1,
1.94039, 0.4777848, 0.7518374, 1, 0, 0, 1, 1,
1.94436, 1.061883, 1.31506, 0, 0, 0, 1, 1,
1.993079, -0.3918378, 1.949876, 0, 0, 0, 1, 1,
1.997984, 0.907296, 1.332563, 0, 0, 0, 1, 1,
1.999377, 0.8133093, 0.7406403, 0, 0, 0, 1, 1,
2.015617, 0.6367052, 2.055131, 0, 0, 0, 1, 1,
2.023266, 0.828141, 0.7747873, 0, 0, 0, 1, 1,
2.043634, -1.083972, 3.854309, 0, 0, 0, 1, 1,
2.102986, 0.5449655, 2.14502, 1, 1, 1, 1, 1,
2.214154, -0.6016567, 1.993111, 1, 1, 1, 1, 1,
2.248153, 2.166752, 0.1975528, 1, 1, 1, 1, 1,
2.282331, -0.09049232, -1.044615, 1, 1, 1, 1, 1,
2.288485, -1.39167, 3.34227, 1, 1, 1, 1, 1,
2.397151, -0.7124488, 1.875586, 1, 1, 1, 1, 1,
2.738146, -0.4506972, 1.552716, 1, 1, 1, 1, 1
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
var radius = 9.507268;
var distance = 33.39388;
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
mvMatrix.translate( 0.2422419, -0.02978396, 0.1514378 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39388);
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
