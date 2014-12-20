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
-3.42776, -0.9942124, -2.122124, 1, 0, 0, 1,
-2.893001, -0.02076457, -1.473584, 1, 0.007843138, 0, 1,
-2.791805, 2.160163, 0.7710292, 1, 0.01176471, 0, 1,
-2.778333, -1.25157, -1.812834, 1, 0.01960784, 0, 1,
-2.713255, 0.6753848, -1.510966, 1, 0.02352941, 0, 1,
-2.622516, 0.1806434, -2.878103, 1, 0.03137255, 0, 1,
-2.552657, -1.196746, -1.867582, 1, 0.03529412, 0, 1,
-2.508441, -0.1018577, -2.063139, 1, 0.04313726, 0, 1,
-2.46235, 0.02198648, 0.01521445, 1, 0.04705882, 0, 1,
-2.447171, 0.3232152, -2.278496, 1, 0.05490196, 0, 1,
-2.417463, -0.2693959, -0.2929109, 1, 0.05882353, 0, 1,
-2.401313, -0.233128, -2.268033, 1, 0.06666667, 0, 1,
-2.242707, -0.2076472, -1.537686, 1, 0.07058824, 0, 1,
-2.226916, 0.1849564, 0.2859793, 1, 0.07843138, 0, 1,
-2.196777, 0.02497279, -1.306917, 1, 0.08235294, 0, 1,
-2.180091, 0.07224438, -2.27029, 1, 0.09019608, 0, 1,
-2.139915, -1.256185, -2.829331, 1, 0.09411765, 0, 1,
-2.131107, 0.8031412, -1.524572, 1, 0.1019608, 0, 1,
-2.093405, 0.6174315, -0.5650024, 1, 0.1098039, 0, 1,
-2.058095, 1.302342, -0.4061235, 1, 0.1137255, 0, 1,
-2.023437, 0.6428874, -3.307011, 1, 0.1215686, 0, 1,
-2.019542, -2.18991, -1.429854, 1, 0.1254902, 0, 1,
-1.997252, -1.513476, -0.7714715, 1, 0.1333333, 0, 1,
-1.986105, 0.1717826, -2.842609, 1, 0.1372549, 0, 1,
-1.979516, 0.5031228, -1.065019, 1, 0.145098, 0, 1,
-1.972003, 0.7936046, -2.058707, 1, 0.1490196, 0, 1,
-1.915155, -1.666361, -3.401324, 1, 0.1568628, 0, 1,
-1.903378, -0.5875986, -2.323054, 1, 0.1607843, 0, 1,
-1.88726, -1.010692, -2.826748, 1, 0.1686275, 0, 1,
-1.875031, 0.5730199, -2.132201, 1, 0.172549, 0, 1,
-1.872638, -0.1933755, -1.299822, 1, 0.1803922, 0, 1,
-1.839803, 0.8998041, -0.2880387, 1, 0.1843137, 0, 1,
-1.821077, -1.312244, -1.396388, 1, 0.1921569, 0, 1,
-1.81953, 0.757524, -1.458316, 1, 0.1960784, 0, 1,
-1.799265, -0.2911856, -2.150978, 1, 0.2039216, 0, 1,
-1.796116, 0.9039049, -1.307378, 1, 0.2117647, 0, 1,
-1.784256, -0.491556, -3.101532, 1, 0.2156863, 0, 1,
-1.777742, -0.8465924, -1.685858, 1, 0.2235294, 0, 1,
-1.767886, 1.006515, -1.027762, 1, 0.227451, 0, 1,
-1.752327, -0.6638622, -1.388296, 1, 0.2352941, 0, 1,
-1.751696, -0.5176371, -2.009224, 1, 0.2392157, 0, 1,
-1.743592, -0.1741267, -1.682082, 1, 0.2470588, 0, 1,
-1.739624, -1.127535, -2.087583, 1, 0.2509804, 0, 1,
-1.713624, -0.2226045, -2.192275, 1, 0.2588235, 0, 1,
-1.702412, 1.072106, -3.357392, 1, 0.2627451, 0, 1,
-1.650615, 0.3979835, -0.2247503, 1, 0.2705882, 0, 1,
-1.649004, 0.6458732, -0.6283303, 1, 0.2745098, 0, 1,
-1.642105, -1.222464, -3.945235, 1, 0.282353, 0, 1,
-1.62845, 0.768688, -2.40572, 1, 0.2862745, 0, 1,
-1.628426, 1.067701, -0.4228384, 1, 0.2941177, 0, 1,
-1.622714, -1.254077, -3.741944, 1, 0.3019608, 0, 1,
-1.614787, 0.8254014, -1.282999, 1, 0.3058824, 0, 1,
-1.601485, -1.799416, -3.08144, 1, 0.3137255, 0, 1,
-1.593981, -0.02665101, -0.3900867, 1, 0.3176471, 0, 1,
-1.559143, -0.5208895, -2.42624, 1, 0.3254902, 0, 1,
-1.557289, 0.1198259, -1.430524, 1, 0.3294118, 0, 1,
-1.550304, 0.9844879, -1.529396, 1, 0.3372549, 0, 1,
-1.538223, 0.7251211, -0.7928957, 1, 0.3411765, 0, 1,
-1.51434, -0.7295894, -1.772778, 1, 0.3490196, 0, 1,
-1.488843, 0.4920246, -1.292832, 1, 0.3529412, 0, 1,
-1.48549, 0.8525844, -0.7592392, 1, 0.3607843, 0, 1,
-1.480024, -0.4736041, -2.265445, 1, 0.3647059, 0, 1,
-1.476796, 0.3064768, -2.078494, 1, 0.372549, 0, 1,
-1.456973, -1.462631, -2.615178, 1, 0.3764706, 0, 1,
-1.45024, -0.8155189, -3.600318, 1, 0.3843137, 0, 1,
-1.448221, -0.3988684, -1.439253, 1, 0.3882353, 0, 1,
-1.445102, -1.017692, -3.177905, 1, 0.3960784, 0, 1,
-1.443403, 0.1570411, -1.521052, 1, 0.4039216, 0, 1,
-1.442917, 0.006153335, -3.195285, 1, 0.4078431, 0, 1,
-1.433085, 1.250446, -1.818014, 1, 0.4156863, 0, 1,
-1.432283, 0.3025086, 0.3510215, 1, 0.4196078, 0, 1,
-1.432252, -0.3433366, -1.831186, 1, 0.427451, 0, 1,
-1.426879, -1.634919, -2.112256, 1, 0.4313726, 0, 1,
-1.423217, -0.03735835, -2.432819, 1, 0.4392157, 0, 1,
-1.383827, -0.3830566, -4.322955, 1, 0.4431373, 0, 1,
-1.376153, -0.002828608, -1.406262, 1, 0.4509804, 0, 1,
-1.368198, 1.02145, 0.5478848, 1, 0.454902, 0, 1,
-1.362588, -1.064297, -1.015307, 1, 0.4627451, 0, 1,
-1.358238, 1.703534, 0.7416875, 1, 0.4666667, 0, 1,
-1.341211, -0.5443046, -2.839497, 1, 0.4745098, 0, 1,
-1.337301, -0.4994182, -3.28983, 1, 0.4784314, 0, 1,
-1.335342, 0.1907205, -0.9037919, 1, 0.4862745, 0, 1,
-1.333874, 2.294172, 0.6373988, 1, 0.4901961, 0, 1,
-1.322208, -1.350791, -1.698964, 1, 0.4980392, 0, 1,
-1.304996, 0.4964266, -1.278171, 1, 0.5058824, 0, 1,
-1.298158, 1.097846, 0.4184771, 1, 0.509804, 0, 1,
-1.295252, 0.4644858, -2.451625, 1, 0.5176471, 0, 1,
-1.293002, 0.1321518, -1.728346, 1, 0.5215687, 0, 1,
-1.27774, 1.419349, -2.006511, 1, 0.5294118, 0, 1,
-1.275367, -1.155967, 0.002416994, 1, 0.5333334, 0, 1,
-1.271231, -1.388314, -2.407079, 1, 0.5411765, 0, 1,
-1.263874, 0.9682475, -1.553425, 1, 0.5450981, 0, 1,
-1.260218, 0.8923132, -0.4121424, 1, 0.5529412, 0, 1,
-1.248616, -0.3645933, -1.821289, 1, 0.5568628, 0, 1,
-1.23474, -0.1177927, -3.861491, 1, 0.5647059, 0, 1,
-1.233376, -1.821777, -1.80259, 1, 0.5686275, 0, 1,
-1.226874, 1.724388, -0.2728225, 1, 0.5764706, 0, 1,
-1.224329, 1.688059, -1.018833, 1, 0.5803922, 0, 1,
-1.221527, -0.467647, -2.147055, 1, 0.5882353, 0, 1,
-1.217562, -0.5349057, -0.6643397, 1, 0.5921569, 0, 1,
-1.187934, 1.061247, -0.9596719, 1, 0.6, 0, 1,
-1.187179, -0.1507664, -0.575425, 1, 0.6078432, 0, 1,
-1.177745, 0.4852635, -0.8572244, 1, 0.6117647, 0, 1,
-1.163059, -0.142771, -2.866889, 1, 0.6196079, 0, 1,
-1.149015, 0.9521331, -0.4602071, 1, 0.6235294, 0, 1,
-1.146077, -0.4050862, -0.9211968, 1, 0.6313726, 0, 1,
-1.140468, -2.984134, -2.492937, 1, 0.6352941, 0, 1,
-1.132653, -0.5017087, -0.8341701, 1, 0.6431373, 0, 1,
-1.131036, -1.039383, -2.432873, 1, 0.6470588, 0, 1,
-1.129127, -1.446582, -2.299087, 1, 0.654902, 0, 1,
-1.127177, -0.3888432, -1.572038, 1, 0.6588235, 0, 1,
-1.119063, 0.8485931, -0.1288807, 1, 0.6666667, 0, 1,
-1.116787, 2.950324, -1.145722, 1, 0.6705883, 0, 1,
-1.115773, 0.6919011, 0.577019, 1, 0.6784314, 0, 1,
-1.115434, 0.684531, -2.6036, 1, 0.682353, 0, 1,
-1.111689, -1.111167, -3.266165, 1, 0.6901961, 0, 1,
-1.109864, 0.2365894, 1.628821, 1, 0.6941177, 0, 1,
-1.107371, -0.01491539, -2.769432, 1, 0.7019608, 0, 1,
-1.104622, -0.1989687, 0.1446416, 1, 0.7098039, 0, 1,
-1.10348, 0.4166094, 0.9050933, 1, 0.7137255, 0, 1,
-1.100723, 0.346379, -1.492857, 1, 0.7215686, 0, 1,
-1.098989, 1.537786, -1.147444, 1, 0.7254902, 0, 1,
-1.094154, -0.01931726, -2.765581, 1, 0.7333333, 0, 1,
-1.087852, -1.477389, -1.164552, 1, 0.7372549, 0, 1,
-1.087294, -0.008473114, -1.990939, 1, 0.7450981, 0, 1,
-1.083422, 1.917262, 0.1955073, 1, 0.7490196, 0, 1,
-1.081154, 1.3494, -0.5100428, 1, 0.7568628, 0, 1,
-1.076281, -0.8389037, -2.322901, 1, 0.7607843, 0, 1,
-1.075891, -0.5532947, -2.089661, 1, 0.7686275, 0, 1,
-1.067936, -2.543497, -3.425788, 1, 0.772549, 0, 1,
-1.058475, -1.030274, -2.734721, 1, 0.7803922, 0, 1,
-1.054207, -0.06921833, -2.242278, 1, 0.7843137, 0, 1,
-1.047938, -0.8575616, -1.289609, 1, 0.7921569, 0, 1,
-1.043642, -1.234923, -2.818616, 1, 0.7960784, 0, 1,
-1.043508, 2.465586, 0.632724, 1, 0.8039216, 0, 1,
-1.041623, -0.3627669, -3.34052, 1, 0.8117647, 0, 1,
-1.040378, -1.323608, -3.175505, 1, 0.8156863, 0, 1,
-1.036657, 1.784385, 1.210826, 1, 0.8235294, 0, 1,
-1.03401, 0.5093256, -2.172939, 1, 0.827451, 0, 1,
-1.022414, 1.006865, 0.6478807, 1, 0.8352941, 0, 1,
-1.020888, -0.8012265, -2.622143, 1, 0.8392157, 0, 1,
-1.017931, -0.3177216, -1.7015, 1, 0.8470588, 0, 1,
-1.014218, -1.911788, -3.21318, 1, 0.8509804, 0, 1,
-1.003042, -0.6581677, -1.831082, 1, 0.8588235, 0, 1,
-1.002013, 0.2623877, -2.674024, 1, 0.8627451, 0, 1,
-0.9955761, -1.084174, -1.832558, 1, 0.8705882, 0, 1,
-0.9917102, 1.075298, -1.409094, 1, 0.8745098, 0, 1,
-0.9901815, -0.5190851, -0.3666099, 1, 0.8823529, 0, 1,
-0.9854633, -1.960287, -4.481512, 1, 0.8862745, 0, 1,
-0.9827638, 1.314696, -2.096541, 1, 0.8941177, 0, 1,
-0.9811394, -0.7833579, -4.120996, 1, 0.8980392, 0, 1,
-0.9810098, 0.3894539, -2.122162, 1, 0.9058824, 0, 1,
-0.9768255, 0.4186362, -1.570079, 1, 0.9137255, 0, 1,
-0.9739907, 0.6816398, -0.8877077, 1, 0.9176471, 0, 1,
-0.9687136, 0.349179, -0.5892858, 1, 0.9254902, 0, 1,
-0.9685649, 0.06908171, -1.728451, 1, 0.9294118, 0, 1,
-0.9676108, -0.2810296, -2.63366, 1, 0.9372549, 0, 1,
-0.9664319, 0.6386035, -0.5613227, 1, 0.9411765, 0, 1,
-0.9621271, -0.03461898, -2.851718, 1, 0.9490196, 0, 1,
-0.9545926, -1.046647, -3.811483, 1, 0.9529412, 0, 1,
-0.9473457, -0.2604943, -1.194045, 1, 0.9607843, 0, 1,
-0.9461004, -0.9539952, -2.719268, 1, 0.9647059, 0, 1,
-0.9456226, 0.1806554, -1.384628, 1, 0.972549, 0, 1,
-0.9434715, -0.71662, -1.568366, 1, 0.9764706, 0, 1,
-0.9364905, -2.273057, -3.066178, 1, 0.9843137, 0, 1,
-0.9309059, 0.02286079, -1.039188, 1, 0.9882353, 0, 1,
-0.9303708, 0.126905, -0.5815979, 1, 0.9960784, 0, 1,
-0.9269392, 0.8672517, -2.540182, 0.9960784, 1, 0, 1,
-0.9124184, -1.159272, -2.874862, 0.9921569, 1, 0, 1,
-0.9105615, -0.2623111, -2.165443, 0.9843137, 1, 0, 1,
-0.8977091, 0.861421, -2.105901, 0.9803922, 1, 0, 1,
-0.8969221, 0.9284177, -1.584402, 0.972549, 1, 0, 1,
-0.8951651, 0.717558, -0.3431112, 0.9686275, 1, 0, 1,
-0.8925835, 0.19697, -2.860172, 0.9607843, 1, 0, 1,
-0.8918601, 1.802656, -0.7962578, 0.9568627, 1, 0, 1,
-0.88212, 0.02174897, -2.029238, 0.9490196, 1, 0, 1,
-0.8816882, 0.04120735, -0.54934, 0.945098, 1, 0, 1,
-0.8813016, -0.2350965, -1.205346, 0.9372549, 1, 0, 1,
-0.8769534, 0.7753218, 0.2781268, 0.9333333, 1, 0, 1,
-0.8747897, 0.2034884, -2.369712, 0.9254902, 1, 0, 1,
-0.8606634, 2.093954, 0.2060231, 0.9215686, 1, 0, 1,
-0.8592895, 0.1458311, -1.917391, 0.9137255, 1, 0, 1,
-0.8578326, -0.2683961, -2.179874, 0.9098039, 1, 0, 1,
-0.8571057, -0.2137735, -2.410589, 0.9019608, 1, 0, 1,
-0.8560157, -0.3648742, -2.195796, 0.8941177, 1, 0, 1,
-0.8548447, 0.03492849, -0.6888967, 0.8901961, 1, 0, 1,
-0.8470706, -1.129159, -1.754928, 0.8823529, 1, 0, 1,
-0.8391635, -0.6097839, -2.22646, 0.8784314, 1, 0, 1,
-0.8362758, 0.3397929, -1.664771, 0.8705882, 1, 0, 1,
-0.8350143, 0.3404453, -1.984624, 0.8666667, 1, 0, 1,
-0.8346027, 0.3732249, -1.590372, 0.8588235, 1, 0, 1,
-0.8284736, 0.5409532, -1.506888, 0.854902, 1, 0, 1,
-0.8151803, -0.7188427, -1.456318, 0.8470588, 1, 0, 1,
-0.8098212, 2.562523, 0.5470923, 0.8431373, 1, 0, 1,
-0.804565, -0.5630111, -2.918077, 0.8352941, 1, 0, 1,
-0.8022614, 0.1682999, -2.313555, 0.8313726, 1, 0, 1,
-0.8003558, 0.6318238, 0.1012915, 0.8235294, 1, 0, 1,
-0.7981907, 0.8024968, -0.7920621, 0.8196079, 1, 0, 1,
-0.7948224, 0.6424784, -2.12339, 0.8117647, 1, 0, 1,
-0.7894313, 0.2244891, -1.520417, 0.8078431, 1, 0, 1,
-0.7893957, 1.764073, -1.677216, 0.8, 1, 0, 1,
-0.7893642, -0.5117954, -0.9573029, 0.7921569, 1, 0, 1,
-0.7872756, -0.6338764, -0.9630286, 0.7882353, 1, 0, 1,
-0.7855835, 0.09779523, -4.379444, 0.7803922, 1, 0, 1,
-0.785053, 0.9456075, 0.01816754, 0.7764706, 1, 0, 1,
-0.7768776, 0.6486744, -0.6053886, 0.7686275, 1, 0, 1,
-0.774936, -0.3968816, -1.492792, 0.7647059, 1, 0, 1,
-0.7740475, 0.3609129, -0.5339302, 0.7568628, 1, 0, 1,
-0.7738544, -1.061816, -1.715744, 0.7529412, 1, 0, 1,
-0.7690275, -0.7305065, -1.393565, 0.7450981, 1, 0, 1,
-0.76227, -0.179488, -0.4424929, 0.7411765, 1, 0, 1,
-0.7598978, 1.216707, 0.9627434, 0.7333333, 1, 0, 1,
-0.759221, 0.0773636, -1.382207, 0.7294118, 1, 0, 1,
-0.7590439, 0.2727841, -1.292192, 0.7215686, 1, 0, 1,
-0.7474828, 1.426674, -0.4585485, 0.7176471, 1, 0, 1,
-0.7452844, -1.035381, -2.076057, 0.7098039, 1, 0, 1,
-0.7419387, 0.3560039, -2.708809, 0.7058824, 1, 0, 1,
-0.7414692, -0.05987388, -0.8805314, 0.6980392, 1, 0, 1,
-0.7408042, -0.457507, -1.649593, 0.6901961, 1, 0, 1,
-0.738435, -2.874651, -1.064867, 0.6862745, 1, 0, 1,
-0.7352757, -0.40388, -2.993007, 0.6784314, 1, 0, 1,
-0.7343828, -1.496503, -2.444447, 0.6745098, 1, 0, 1,
-0.7335765, 0.1465411, -1.15369, 0.6666667, 1, 0, 1,
-0.7316987, -0.6095417, -4.657483, 0.6627451, 1, 0, 1,
-0.7303462, -0.7537531, -2.179125, 0.654902, 1, 0, 1,
-0.7181167, 1.374979, -1.778174, 0.6509804, 1, 0, 1,
-0.7171709, -0.7892767, -1.339855, 0.6431373, 1, 0, 1,
-0.7142981, 2.05009, -1.459752, 0.6392157, 1, 0, 1,
-0.713681, 0.002107808, -2.365511, 0.6313726, 1, 0, 1,
-0.7135441, -1.098061, -1.578849, 0.627451, 1, 0, 1,
-0.7040676, -0.9659767, -1.708369, 0.6196079, 1, 0, 1,
-0.7016296, 0.02536326, -2.811756, 0.6156863, 1, 0, 1,
-0.7012514, 0.3460699, -1.095571, 0.6078432, 1, 0, 1,
-0.700957, 0.4821972, -0.09337197, 0.6039216, 1, 0, 1,
-0.6999655, -0.3004174, -2.295141, 0.5960785, 1, 0, 1,
-0.6968953, 0.4679027, -1.105272, 0.5882353, 1, 0, 1,
-0.6963128, -0.8129048, -1.816728, 0.5843138, 1, 0, 1,
-0.6961969, -0.8829522, -1.757708, 0.5764706, 1, 0, 1,
-0.6950925, -0.7065516, -3.161638, 0.572549, 1, 0, 1,
-0.6949289, -1.021282, -2.968295, 0.5647059, 1, 0, 1,
-0.6918607, -1.828114, -4.960264, 0.5607843, 1, 0, 1,
-0.6873405, -0.2464148, -1.399748, 0.5529412, 1, 0, 1,
-0.6841099, 0.2421112, -2.106009, 0.5490196, 1, 0, 1,
-0.6832129, 0.7216425, -1.128647, 0.5411765, 1, 0, 1,
-0.6772349, 2.460801, -0.4208716, 0.5372549, 1, 0, 1,
-0.6731155, -0.8596885, -4.81352, 0.5294118, 1, 0, 1,
-0.6695885, -0.9482917, -1.545984, 0.5254902, 1, 0, 1,
-0.6668074, -0.6670343, -2.577896, 0.5176471, 1, 0, 1,
-0.6551827, 1.222836, -0.4264686, 0.5137255, 1, 0, 1,
-0.6545334, 0.2418272, -1.419805, 0.5058824, 1, 0, 1,
-0.6526373, 0.772924, 0.8801947, 0.5019608, 1, 0, 1,
-0.6497705, -1.517946, -1.638237, 0.4941176, 1, 0, 1,
-0.649511, 0.7684465, -0.06789078, 0.4862745, 1, 0, 1,
-0.6466304, -1.200508, -3.146864, 0.4823529, 1, 0, 1,
-0.6430978, 1.443656, 0.9584914, 0.4745098, 1, 0, 1,
-0.6430125, -0.4624358, -2.518623, 0.4705882, 1, 0, 1,
-0.6411206, -1.602569, -2.618882, 0.4627451, 1, 0, 1,
-0.6362734, -2.816757, -1.798778, 0.4588235, 1, 0, 1,
-0.6236167, -0.5207334, -3.374804, 0.4509804, 1, 0, 1,
-0.6231586, 1.73892, 0.3826462, 0.4470588, 1, 0, 1,
-0.6183386, 1.341271, -0.7162516, 0.4392157, 1, 0, 1,
-0.6177339, 0.1223919, -2.257577, 0.4352941, 1, 0, 1,
-0.6139644, 0.5503711, -0.1426507, 0.427451, 1, 0, 1,
-0.6134983, 1.070185, -0.1108696, 0.4235294, 1, 0, 1,
-0.6132444, -0.04555598, -1.566001, 0.4156863, 1, 0, 1,
-0.6130114, -0.5402398, -1.698667, 0.4117647, 1, 0, 1,
-0.6126401, 0.2439006, -2.454661, 0.4039216, 1, 0, 1,
-0.6105846, 1.001527, 0.3870014, 0.3960784, 1, 0, 1,
-0.610238, 0.1208902, -0.1938531, 0.3921569, 1, 0, 1,
-0.6064705, 1.037257, 0.7130327, 0.3843137, 1, 0, 1,
-0.6042429, 0.770681, 0.936798, 0.3803922, 1, 0, 1,
-0.596077, -1.075124, -2.670651, 0.372549, 1, 0, 1,
-0.5943918, 2.294266, -0.07785755, 0.3686275, 1, 0, 1,
-0.5935667, 0.8905808, -0.885924, 0.3607843, 1, 0, 1,
-0.5909646, 0.1872264, -1.221376, 0.3568628, 1, 0, 1,
-0.5905508, -0.3335057, -3.28385, 0.3490196, 1, 0, 1,
-0.5876268, 0.2393803, -1.206253, 0.345098, 1, 0, 1,
-0.5814081, -0.632926, -1.865065, 0.3372549, 1, 0, 1,
-0.5802052, -0.5798264, -1.420876, 0.3333333, 1, 0, 1,
-0.5753686, 0.9272801, -0.2100901, 0.3254902, 1, 0, 1,
-0.5720415, 1.660709, -1.45891, 0.3215686, 1, 0, 1,
-0.5693312, 1.151586, -0.1656814, 0.3137255, 1, 0, 1,
-0.5642073, -0.5085092, -1.26163, 0.3098039, 1, 0, 1,
-0.5637607, 0.2056685, -0.337775, 0.3019608, 1, 0, 1,
-0.5634978, 1.205735, -0.8152438, 0.2941177, 1, 0, 1,
-0.5583792, -0.3462383, -1.311531, 0.2901961, 1, 0, 1,
-0.5567954, 0.4111542, 0.5136187, 0.282353, 1, 0, 1,
-0.5529726, 0.8400815, -2.27076, 0.2784314, 1, 0, 1,
-0.5515035, -1.085528, -2.387723, 0.2705882, 1, 0, 1,
-0.5416996, -1.256429, -2.357927, 0.2666667, 1, 0, 1,
-0.5369214, 1.072993, 1.226406, 0.2588235, 1, 0, 1,
-0.5354707, 0.031489, -3.24677, 0.254902, 1, 0, 1,
-0.5350031, -0.2123268, -2.456097, 0.2470588, 1, 0, 1,
-0.5329509, 0.2828896, -1.770898, 0.2431373, 1, 0, 1,
-0.5315219, -0.7380448, -2.641146, 0.2352941, 1, 0, 1,
-0.5233012, -1.545049, -3.493016, 0.2313726, 1, 0, 1,
-0.5162673, 0.1900492, -0.177192, 0.2235294, 1, 0, 1,
-0.507919, -0.8703258, -2.439631, 0.2196078, 1, 0, 1,
-0.506746, -1.117653, -1.689722, 0.2117647, 1, 0, 1,
-0.5066154, -0.7705632, -1.368277, 0.2078431, 1, 0, 1,
-0.5063118, -0.128286, -2.362827, 0.2, 1, 0, 1,
-0.505888, -0.8434109, -2.776828, 0.1921569, 1, 0, 1,
-0.5009364, -0.2918867, -2.974709, 0.1882353, 1, 0, 1,
-0.4999553, 0.8050646, -1.127647, 0.1803922, 1, 0, 1,
-0.4954418, 0.2751786, -2.122409, 0.1764706, 1, 0, 1,
-0.4831354, 0.9637496, -0.7906537, 0.1686275, 1, 0, 1,
-0.4817535, 0.7414845, 0.8532543, 0.1647059, 1, 0, 1,
-0.4815654, 0.8193505, -0.08964533, 0.1568628, 1, 0, 1,
-0.4801986, 1.518715, 0.2571496, 0.1529412, 1, 0, 1,
-0.4785582, -0.9660609, -1.055507, 0.145098, 1, 0, 1,
-0.4759087, 0.4343785, -0.9525244, 0.1411765, 1, 0, 1,
-0.4755908, 1.458386, 0.7545739, 0.1333333, 1, 0, 1,
-0.472647, 1.150558, 1.577428, 0.1294118, 1, 0, 1,
-0.4721713, -0.3074947, -0.8612052, 0.1215686, 1, 0, 1,
-0.4643385, -0.05674115, 0.1967889, 0.1176471, 1, 0, 1,
-0.4577042, 0.2819691, 1.426188, 0.1098039, 1, 0, 1,
-0.4569521, 1.485825, 0.6727753, 0.1058824, 1, 0, 1,
-0.4549333, 1.389625, 0.1279891, 0.09803922, 1, 0, 1,
-0.4547862, -0.2940137, -2.190674, 0.09019608, 1, 0, 1,
-0.4505827, 1.029229, -0.6481648, 0.08627451, 1, 0, 1,
-0.4473036, 0.7295905, -0.475905, 0.07843138, 1, 0, 1,
-0.4462452, 0.108083, -1.986819, 0.07450981, 1, 0, 1,
-0.4437879, 0.7541423, -0.2013143, 0.06666667, 1, 0, 1,
-0.4435498, -1.614571, -3.872324, 0.0627451, 1, 0, 1,
-0.4426366, -0.008944199, -3.456868, 0.05490196, 1, 0, 1,
-0.4407191, -1.061357, -4.12984, 0.05098039, 1, 0, 1,
-0.4399482, -0.7175918, -3.184465, 0.04313726, 1, 0, 1,
-0.4363102, -0.1120085, -2.127398, 0.03921569, 1, 0, 1,
-0.4357815, -0.8007837, -1.972042, 0.03137255, 1, 0, 1,
-0.4227574, -0.3787858, -0.05501259, 0.02745098, 1, 0, 1,
-0.4219633, -0.4903871, -2.275243, 0.01960784, 1, 0, 1,
-0.4191178, -0.1853096, -1.892426, 0.01568628, 1, 0, 1,
-0.4162198, 0.9622282, -1.282712, 0.007843138, 1, 0, 1,
-0.4117848, 0.9404864, 1.250042, 0.003921569, 1, 0, 1,
-0.4110074, 1.492266, 1.431528, 0, 1, 0.003921569, 1,
-0.4102685, -0.04181848, -1.561749, 0, 1, 0.01176471, 1,
-0.3998986, -0.5673267, -3.656572, 0, 1, 0.01568628, 1,
-0.3993798, 1.202329, -0.7486117, 0, 1, 0.02352941, 1,
-0.3989323, 1.272125, -0.1446419, 0, 1, 0.02745098, 1,
-0.3985826, -0.7646295, -2.880824, 0, 1, 0.03529412, 1,
-0.3962038, 1.944128, -0.6322451, 0, 1, 0.03921569, 1,
-0.3961666, 1.06011, 0.3351883, 0, 1, 0.04705882, 1,
-0.3960333, 0.03061878, -1.101747, 0, 1, 0.05098039, 1,
-0.3945063, 0.58057, -0.4050763, 0, 1, 0.05882353, 1,
-0.3934872, -0.008798148, -2.034525, 0, 1, 0.0627451, 1,
-0.3911404, -0.03767186, -0.9085544, 0, 1, 0.07058824, 1,
-0.39089, -0.8687045, -3.071179, 0, 1, 0.07450981, 1,
-0.3901216, 1.938646, -2.074323, 0, 1, 0.08235294, 1,
-0.3887663, -0.2068154, 0.344312, 0, 1, 0.08627451, 1,
-0.388043, 0.1907019, -2.297619, 0, 1, 0.09411765, 1,
-0.3837274, 1.012686, -1.160433, 0, 1, 0.1019608, 1,
-0.3800654, -1.106618, -3.31275, 0, 1, 0.1058824, 1,
-0.3787884, -0.8799039, -2.651787, 0, 1, 0.1137255, 1,
-0.37853, 1.205313, 0.8635174, 0, 1, 0.1176471, 1,
-0.3762982, -1.395416, -4.370135, 0, 1, 0.1254902, 1,
-0.3722028, 0.4377205, -1.731756, 0, 1, 0.1294118, 1,
-0.3710857, 0.3085709, -0.373094, 0, 1, 0.1372549, 1,
-0.370915, -0.5205777, -2.444763, 0, 1, 0.1411765, 1,
-0.3702201, 0.2500192, -2.764886, 0, 1, 0.1490196, 1,
-0.3691924, -0.9291216, -2.566903, 0, 1, 0.1529412, 1,
-0.3677437, -0.4957852, -2.876141, 0, 1, 0.1607843, 1,
-0.3669082, -1.135273, -3.182186, 0, 1, 0.1647059, 1,
-0.3618201, -2.211399, -3.798203, 0, 1, 0.172549, 1,
-0.3571838, -1.720159, -3.806368, 0, 1, 0.1764706, 1,
-0.3564637, -1.521792, -2.655252, 0, 1, 0.1843137, 1,
-0.3562511, 2.287083, -0.01850495, 0, 1, 0.1882353, 1,
-0.3540967, 0.4768246, 0.7922335, 0, 1, 0.1960784, 1,
-0.3522874, 0.9224709, -0.1950373, 0, 1, 0.2039216, 1,
-0.3522195, 0.7413253, -1.309722, 0, 1, 0.2078431, 1,
-0.3489476, -0.174633, -4.580833, 0, 1, 0.2156863, 1,
-0.344949, -0.6572279, -3.218295, 0, 1, 0.2196078, 1,
-0.3425162, 0.04792395, -1.286825, 0, 1, 0.227451, 1,
-0.3420535, -0.0462914, -0.6682384, 0, 1, 0.2313726, 1,
-0.3396804, 0.6949102, -0.4483033, 0, 1, 0.2392157, 1,
-0.3394911, -0.2983649, -1.441966, 0, 1, 0.2431373, 1,
-0.3390962, -0.5399287, -1.507737, 0, 1, 0.2509804, 1,
-0.3285459, 0.9551566, 0.9707745, 0, 1, 0.254902, 1,
-0.322975, -0.142971, -3.390577, 0, 1, 0.2627451, 1,
-0.3226318, -0.7076058, -2.921597, 0, 1, 0.2666667, 1,
-0.3177464, -0.02380924, 0.2972532, 0, 1, 0.2745098, 1,
-0.3158647, 1.094687, -0.9571115, 0, 1, 0.2784314, 1,
-0.3150866, -0.7288724, -3.412577, 0, 1, 0.2862745, 1,
-0.3139123, 0.5578474, -1.030483, 0, 1, 0.2901961, 1,
-0.3137699, -0.6284252, -3.84423, 0, 1, 0.2980392, 1,
-0.3111514, -0.641091, -2.878069, 0, 1, 0.3058824, 1,
-0.3103522, 0.5968926, -0.4690858, 0, 1, 0.3098039, 1,
-0.2895382, -0.04543592, -2.972548, 0, 1, 0.3176471, 1,
-0.2820571, -2.426194, -3.372379, 0, 1, 0.3215686, 1,
-0.2768049, 1.978462, 0.8387493, 0, 1, 0.3294118, 1,
-0.2721691, 1.117756, -0.6878924, 0, 1, 0.3333333, 1,
-0.2685592, -0.2133593, -3.205231, 0, 1, 0.3411765, 1,
-0.2661126, -0.1243809, -1.502826, 0, 1, 0.345098, 1,
-0.2621947, 0.6163603, -0.655636, 0, 1, 0.3529412, 1,
-0.2590421, 0.5268077, 1.142972, 0, 1, 0.3568628, 1,
-0.2542691, -0.6529921, -4.149358, 0, 1, 0.3647059, 1,
-0.2538078, 0.4292453, 0.1031575, 0, 1, 0.3686275, 1,
-0.2521202, -0.9154752, -3.574758, 0, 1, 0.3764706, 1,
-0.2478838, 0.3089967, -0.09356555, 0, 1, 0.3803922, 1,
-0.2457633, -0.4175865, -0.7963277, 0, 1, 0.3882353, 1,
-0.2431539, 0.5715584, -0.0543251, 0, 1, 0.3921569, 1,
-0.2429904, 0.6863394, -1.085639, 0, 1, 0.4, 1,
-0.2375812, -1.055352, -4.060816, 0, 1, 0.4078431, 1,
-0.2368061, -1.331993, -2.119195, 0, 1, 0.4117647, 1,
-0.2239536, 1.210391, 0.3194125, 0, 1, 0.4196078, 1,
-0.2212926, -0.4512083, -3.751382, 0, 1, 0.4235294, 1,
-0.2203836, 1.751176, -1.051286, 0, 1, 0.4313726, 1,
-0.218582, 0.1194281, -2.02125, 0, 1, 0.4352941, 1,
-0.2159014, 0.3318424, -0.3510276, 0, 1, 0.4431373, 1,
-0.2133377, 0.1644477, -1.193051, 0, 1, 0.4470588, 1,
-0.2132191, -0.4424684, -2.261151, 0, 1, 0.454902, 1,
-0.2127383, 0.6483663, -0.6423303, 0, 1, 0.4588235, 1,
-0.2099093, 0.5849309, -2.550886, 0, 1, 0.4666667, 1,
-0.2084959, 1.337436, -0.6352175, 0, 1, 0.4705882, 1,
-0.2084096, -2.099433, -2.051038, 0, 1, 0.4784314, 1,
-0.2071929, -0.7125734, -2.786594, 0, 1, 0.4823529, 1,
-0.2067006, -0.1783841, -1.854453, 0, 1, 0.4901961, 1,
-0.2061263, -0.6166303, -5.251097, 0, 1, 0.4941176, 1,
-0.2048166, -0.6051416, -2.682896, 0, 1, 0.5019608, 1,
-0.2038753, 0.8086656, 0.4463287, 0, 1, 0.509804, 1,
-0.2003438, 1.122975, 1.404644, 0, 1, 0.5137255, 1,
-0.197043, -0.446539, -3.65072, 0, 1, 0.5215687, 1,
-0.1946991, 0.4853389, 0.5118873, 0, 1, 0.5254902, 1,
-0.1918108, 0.01333234, -2.74495, 0, 1, 0.5333334, 1,
-0.1900135, -1.243197, -2.325693, 0, 1, 0.5372549, 1,
-0.1843424, 0.7777791, 0.09867464, 0, 1, 0.5450981, 1,
-0.178932, 0.7408486, -1.364837, 0, 1, 0.5490196, 1,
-0.1706168, 0.3295677, -1.140022, 0, 1, 0.5568628, 1,
-0.1598062, 0.845427, -1.645144, 0, 1, 0.5607843, 1,
-0.1583105, -0.6451036, -4.324378, 0, 1, 0.5686275, 1,
-0.1574695, -0.8289782, -3.056787, 0, 1, 0.572549, 1,
-0.1558061, 1.673094, -0.7261041, 0, 1, 0.5803922, 1,
-0.1545552, -0.8245001, -4.083094, 0, 1, 0.5843138, 1,
-0.1543429, 0.1997646, -0.4323907, 0, 1, 0.5921569, 1,
-0.151475, -0.8772097, -1.037661, 0, 1, 0.5960785, 1,
-0.1494229, -0.9848804, -4.849888, 0, 1, 0.6039216, 1,
-0.1462044, 0.128279, -1.362002, 0, 1, 0.6117647, 1,
-0.1459931, 0.2016807, -0.6480091, 0, 1, 0.6156863, 1,
-0.1457199, 0.9141934, 0.3549701, 0, 1, 0.6235294, 1,
-0.142415, -0.5360851, -1.669335, 0, 1, 0.627451, 1,
-0.1420146, 0.5750342, -1.485693, 0, 1, 0.6352941, 1,
-0.1414723, 0.256669, 0.3219554, 0, 1, 0.6392157, 1,
-0.1395099, -0.5191234, -2.336046, 0, 1, 0.6470588, 1,
-0.137346, 0.5728222, -1.652847, 0, 1, 0.6509804, 1,
-0.1373317, -0.6217739, -1.950621, 0, 1, 0.6588235, 1,
-0.1371909, 1.094083, -1.00373, 0, 1, 0.6627451, 1,
-0.130584, 0.1519106, -1.062961, 0, 1, 0.6705883, 1,
-0.1297789, -0.2858017, -2.179812, 0, 1, 0.6745098, 1,
-0.1296671, -1.386974, -2.913729, 0, 1, 0.682353, 1,
-0.1283935, 1.802572, -0.1705038, 0, 1, 0.6862745, 1,
-0.126167, 1.193802, 0.5884924, 0, 1, 0.6941177, 1,
-0.1229117, -2.096033, -4.397987, 0, 1, 0.7019608, 1,
-0.1206739, 0.03607059, -1.003984, 0, 1, 0.7058824, 1,
-0.1162831, 0.1939408, -0.5956334, 0, 1, 0.7137255, 1,
-0.110813, -1.442175, -0.2007692, 0, 1, 0.7176471, 1,
-0.1069278, -0.04315102, -0.905215, 0, 1, 0.7254902, 1,
-0.08891412, -1.343879, -3.997057, 0, 1, 0.7294118, 1,
-0.08818706, 0.8102267, -0.483128, 0, 1, 0.7372549, 1,
-0.0831557, -1.34934, -1.455357, 0, 1, 0.7411765, 1,
-0.08225556, 0.3243959, -1.876135, 0, 1, 0.7490196, 1,
-0.08070987, -0.3555238, -1.384763, 0, 1, 0.7529412, 1,
-0.07901375, -1.006814, -2.63817, 0, 1, 0.7607843, 1,
-0.07852156, -0.9504535, -1.760507, 0, 1, 0.7647059, 1,
-0.07841451, -0.2940762, -3.023412, 0, 1, 0.772549, 1,
-0.07724924, -1.182538, -4.16328, 0, 1, 0.7764706, 1,
-0.0755313, -0.3060085, -2.13026, 0, 1, 0.7843137, 1,
-0.07418085, 0.6792864, -1.585399, 0, 1, 0.7882353, 1,
-0.07210989, 0.4381917, -0.9646105, 0, 1, 0.7960784, 1,
-0.06907701, -1.159394, -1.414777, 0, 1, 0.8039216, 1,
-0.06825914, -0.1122516, -4.151574, 0, 1, 0.8078431, 1,
-0.06485969, -0.3339037, -3.717898, 0, 1, 0.8156863, 1,
-0.0600479, -1.402725, -3.427814, 0, 1, 0.8196079, 1,
-0.0558724, 0.5755436, 0.6765877, 0, 1, 0.827451, 1,
-0.04974496, -1.1868, -2.738928, 0, 1, 0.8313726, 1,
-0.04962588, -0.4932208, -2.877147, 0, 1, 0.8392157, 1,
-0.04638411, 0.06596996, -2.708797, 0, 1, 0.8431373, 1,
-0.04414934, -0.6646566, -4.533077, 0, 1, 0.8509804, 1,
-0.04383751, 0.4077921, -0.9835913, 0, 1, 0.854902, 1,
-0.03679267, -0.3282754, -4.441073, 0, 1, 0.8627451, 1,
-0.03677174, 1.073035, -0.2857464, 0, 1, 0.8666667, 1,
-0.03033861, 0.2129828, -0.7417753, 0, 1, 0.8745098, 1,
-0.02826172, -2.216588, -4.706622, 0, 1, 0.8784314, 1,
-0.02562097, -1.212512, -2.696437, 0, 1, 0.8862745, 1,
-0.0217349, -2.350485, -3.425536, 0, 1, 0.8901961, 1,
-0.01769586, 3.31193, 1.76855, 0, 1, 0.8980392, 1,
-0.01212995, -0.1841488, -3.524513, 0, 1, 0.9058824, 1,
-0.004440682, 0.8172632, -0.542555, 0, 1, 0.9098039, 1,
-0.003667529, 2.066822, -0.7285756, 0, 1, 0.9176471, 1,
-0.002540564, -0.1568676, -2.66474, 0, 1, 0.9215686, 1,
0.0007403085, 0.6768575, 0.9189317, 0, 1, 0.9294118, 1,
0.004426573, -1.474515, 4.492857, 0, 1, 0.9333333, 1,
0.005733676, -1.18988, 2.50615, 0, 1, 0.9411765, 1,
0.01103819, 0.2317989, -0.8485323, 0, 1, 0.945098, 1,
0.01238219, -0.4083772, 1.891387, 0, 1, 0.9529412, 1,
0.01747181, 1.463834, 0.07438783, 0, 1, 0.9568627, 1,
0.01826354, 2.193249, -1.457859, 0, 1, 0.9647059, 1,
0.01834177, -0.7437193, 2.051593, 0, 1, 0.9686275, 1,
0.01929069, -0.5183486, 2.857531, 0, 1, 0.9764706, 1,
0.02759616, -0.6522036, 2.560504, 0, 1, 0.9803922, 1,
0.02948592, 0.05498105, 0.7845123, 0, 1, 0.9882353, 1,
0.03046189, 1.744628, 1.114164, 0, 1, 0.9921569, 1,
0.03691067, 0.4919036, 0.0372457, 0, 1, 1, 1,
0.03791285, -1.052664, 1.741709, 0, 0.9921569, 1, 1,
0.03875555, 1.687435, 0.2609401, 0, 0.9882353, 1, 1,
0.05529562, -0.1007267, 3.369697, 0, 0.9803922, 1, 1,
0.05713632, -0.4932479, 2.29736, 0, 0.9764706, 1, 1,
0.05738708, 1.679518, 0.4161799, 0, 0.9686275, 1, 1,
0.06271207, 0.2340849, 1.103291, 0, 0.9647059, 1, 1,
0.06417407, -0.7790107, 3.482994, 0, 0.9568627, 1, 1,
0.06614629, -1.130102, 2.67481, 0, 0.9529412, 1, 1,
0.06710485, 0.825827, -0.6241134, 0, 0.945098, 1, 1,
0.0682249, 0.1314768, 0.06344435, 0, 0.9411765, 1, 1,
0.06869397, -0.2916141, 2.617908, 0, 0.9333333, 1, 1,
0.07122979, -1.03343, 2.898135, 0, 0.9294118, 1, 1,
0.07692436, 0.4288034, 0.6225196, 0, 0.9215686, 1, 1,
0.07703858, 0.2437152, 0.7110392, 0, 0.9176471, 1, 1,
0.08166856, -0.8296446, 4.010451, 0, 0.9098039, 1, 1,
0.08373498, 0.2253683, -0.2433005, 0, 0.9058824, 1, 1,
0.08790217, -0.8343723, 3.727183, 0, 0.8980392, 1, 1,
0.08972592, 0.06107144, -0.3933555, 0, 0.8901961, 1, 1,
0.09168853, 0.2890329, -0.2475189, 0, 0.8862745, 1, 1,
0.09734698, 1.499931, -0.6458309, 0, 0.8784314, 1, 1,
0.100097, 0.3612592, -1.424635, 0, 0.8745098, 1, 1,
0.1007965, 1.193266, -0.5388804, 0, 0.8666667, 1, 1,
0.1010366, 0.1729081, 2.185557, 0, 0.8627451, 1, 1,
0.1011253, 1.963045, 1.259335, 0, 0.854902, 1, 1,
0.105015, 0.2490694, -0.05303898, 0, 0.8509804, 1, 1,
0.1063979, -0.1187767, 2.290731, 0, 0.8431373, 1, 1,
0.1155761, 2.201586, 0.252886, 0, 0.8392157, 1, 1,
0.1167664, 0.520401, 0.060231, 0, 0.8313726, 1, 1,
0.1185962, -0.6163786, 1.83528, 0, 0.827451, 1, 1,
0.1220639, 0.2777138, -0.5531238, 0, 0.8196079, 1, 1,
0.1257506, 0.7857265, 2.310232, 0, 0.8156863, 1, 1,
0.1269101, -0.4962928, 4.426432, 0, 0.8078431, 1, 1,
0.1351565, -0.07178952, 2.400095, 0, 0.8039216, 1, 1,
0.1361071, -0.5442246, 3.768716, 0, 0.7960784, 1, 1,
0.1388216, -1.214586, 3.973293, 0, 0.7882353, 1, 1,
0.1393576, 2.116513, 0.9101917, 0, 0.7843137, 1, 1,
0.1411359, 0.2170067, 3.173406, 0, 0.7764706, 1, 1,
0.1524824, 0.2207807, 0.7854088, 0, 0.772549, 1, 1,
0.1574764, -0.7921008, 3.793881, 0, 0.7647059, 1, 1,
0.1608152, -1.088539, 1.268656, 0, 0.7607843, 1, 1,
0.1660955, -0.9685603, 2.999987, 0, 0.7529412, 1, 1,
0.1665924, -1.1816, 2.590913, 0, 0.7490196, 1, 1,
0.166614, 0.4077034, 1.455761, 0, 0.7411765, 1, 1,
0.1727277, 0.3640394, 1.39367, 0, 0.7372549, 1, 1,
0.1740057, 0.3300664, 2.147177, 0, 0.7294118, 1, 1,
0.1744037, -0.2638794, 2.483295, 0, 0.7254902, 1, 1,
0.1752327, 0.7242276, 0.829019, 0, 0.7176471, 1, 1,
0.175716, 0.5768899, -0.8352968, 0, 0.7137255, 1, 1,
0.1768613, -0.1788854, 4.298907, 0, 0.7058824, 1, 1,
0.1776432, 1.512265, -0.1915178, 0, 0.6980392, 1, 1,
0.1822027, -0.0225045, 1.041028, 0, 0.6941177, 1, 1,
0.1835684, -1.316259, 2.637728, 0, 0.6862745, 1, 1,
0.1863196, -0.4778987, 2.501532, 0, 0.682353, 1, 1,
0.1915357, 0.8928063, 0.1753903, 0, 0.6745098, 1, 1,
0.2004022, -0.3473725, 2.507354, 0, 0.6705883, 1, 1,
0.2013297, 2.39333, -0.8427868, 0, 0.6627451, 1, 1,
0.2019629, -0.7540714, 4.162558, 0, 0.6588235, 1, 1,
0.2036467, 0.01780904, 2.00557, 0, 0.6509804, 1, 1,
0.2068518, 0.9804693, -0.8130878, 0, 0.6470588, 1, 1,
0.2089407, -0.8177078, 3.634647, 0, 0.6392157, 1, 1,
0.2100804, 3.021144, -0.2963733, 0, 0.6352941, 1, 1,
0.211189, -0.111879, 2.159145, 0, 0.627451, 1, 1,
0.2139102, -1.78077, 0.5471739, 0, 0.6235294, 1, 1,
0.2147785, -1.506261, 2.081579, 0, 0.6156863, 1, 1,
0.2162116, 2.258689, -2.004532, 0, 0.6117647, 1, 1,
0.2191553, 1.514657, -0.04626283, 0, 0.6039216, 1, 1,
0.2222361, -0.2434683, 0.9422408, 0, 0.5960785, 1, 1,
0.2223985, -2.123214, 2.316881, 0, 0.5921569, 1, 1,
0.2274652, 1.239843, -0.5586036, 0, 0.5843138, 1, 1,
0.2299064, 0.1578805, 2.166397, 0, 0.5803922, 1, 1,
0.2301213, -1.14222, 1.554102, 0, 0.572549, 1, 1,
0.2312711, -0.8749751, 2.428384, 0, 0.5686275, 1, 1,
0.2314234, 1.037169, -0.5377595, 0, 0.5607843, 1, 1,
0.2321372, 0.6808485, 1.630945, 0, 0.5568628, 1, 1,
0.2322106, -0.5253258, 1.639257, 0, 0.5490196, 1, 1,
0.235788, -0.90544, 4.116095, 0, 0.5450981, 1, 1,
0.2401138, -0.60553, 3.082657, 0, 0.5372549, 1, 1,
0.2407211, 0.08434898, 2.655975, 0, 0.5333334, 1, 1,
0.2474128, -1.45674, 1.881548, 0, 0.5254902, 1, 1,
0.2531318, 1.564504, 1.018547, 0, 0.5215687, 1, 1,
0.2538401, -0.1152752, 4.582859, 0, 0.5137255, 1, 1,
0.2603486, 1.021025, 0.313795, 0, 0.509804, 1, 1,
0.261179, 1.122656, -0.6944787, 0, 0.5019608, 1, 1,
0.2619247, -1.037349, 3.131657, 0, 0.4941176, 1, 1,
0.2635505, 0.4871734, 0.2693425, 0, 0.4901961, 1, 1,
0.2635873, -0.5033984, 2.514225, 0, 0.4823529, 1, 1,
0.2696489, -0.8161063, 4.710731, 0, 0.4784314, 1, 1,
0.269717, 0.3880203, 0.2278566, 0, 0.4705882, 1, 1,
0.2719269, 0.4436739, -0.9919226, 0, 0.4666667, 1, 1,
0.2724265, -0.4403217, 2.607997, 0, 0.4588235, 1, 1,
0.2741196, 1.179227, 1.282999, 0, 0.454902, 1, 1,
0.2741347, -0.5089082, 1.737643, 0, 0.4470588, 1, 1,
0.2758898, -0.219634, 2.886361, 0, 0.4431373, 1, 1,
0.2820095, 0.2829401, 1.765076, 0, 0.4352941, 1, 1,
0.2861121, -0.4484335, 3.175591, 0, 0.4313726, 1, 1,
0.2877328, -0.3928332, 2.064207, 0, 0.4235294, 1, 1,
0.2949474, -1.248526, 3.951121, 0, 0.4196078, 1, 1,
0.2999958, -0.9921491, 2.847925, 0, 0.4117647, 1, 1,
0.3034758, 0.7099237, 1.007035, 0, 0.4078431, 1, 1,
0.3040746, 0.4855014, 0.07852892, 0, 0.4, 1, 1,
0.3053638, 2.431386, -0.9518408, 0, 0.3921569, 1, 1,
0.3092737, 0.8795053, 1.469621, 0, 0.3882353, 1, 1,
0.3096389, -1.970247, 0.230079, 0, 0.3803922, 1, 1,
0.3109562, -1.115579, 2.224441, 0, 0.3764706, 1, 1,
0.3111504, -0.9210358, 3.183157, 0, 0.3686275, 1, 1,
0.3130336, 0.1873391, 2.679289, 0, 0.3647059, 1, 1,
0.3160052, -0.774928, 4.48914, 0, 0.3568628, 1, 1,
0.3177334, 0.9555491, -0.8446383, 0, 0.3529412, 1, 1,
0.3194609, 0.2916137, 1.027689, 0, 0.345098, 1, 1,
0.3224353, -0.4849675, 4.304422, 0, 0.3411765, 1, 1,
0.3227225, 0.2832676, 1.532248, 0, 0.3333333, 1, 1,
0.3245338, -0.2322036, 1.572998, 0, 0.3294118, 1, 1,
0.3283192, 0.726829, 0.444716, 0, 0.3215686, 1, 1,
0.329248, 0.9802339, -0.6159369, 0, 0.3176471, 1, 1,
0.3317586, 1.318075, 1.135675, 0, 0.3098039, 1, 1,
0.3363787, 1.036235, 0.2340103, 0, 0.3058824, 1, 1,
0.3375725, -0.1675824, 1.564658, 0, 0.2980392, 1, 1,
0.3472459, 1.77109, 0.1958264, 0, 0.2901961, 1, 1,
0.3480493, 0.5515105, 0.7039014, 0, 0.2862745, 1, 1,
0.3483352, 0.1466562, 0.5803833, 0, 0.2784314, 1, 1,
0.3507635, -0.5808016, 1.74007, 0, 0.2745098, 1, 1,
0.3538371, 0.1395859, 1.943408, 0, 0.2666667, 1, 1,
0.3566589, 0.02676912, 1.443148, 0, 0.2627451, 1, 1,
0.3569095, 0.8294626, 1.272183, 0, 0.254902, 1, 1,
0.3624117, 0.7033424, -1.105011, 0, 0.2509804, 1, 1,
0.3669108, 1.855088, 1.844988, 0, 0.2431373, 1, 1,
0.3713666, 1.275324, 1.798257, 0, 0.2392157, 1, 1,
0.3726242, -1.24643, 1.341932, 0, 0.2313726, 1, 1,
0.3752549, 0.4734923, 1.203292, 0, 0.227451, 1, 1,
0.3768905, 1.279999, 0.6239675, 0, 0.2196078, 1, 1,
0.3820916, -1.167711, 5.125286, 0, 0.2156863, 1, 1,
0.3833968, -0.7322261, 3.141473, 0, 0.2078431, 1, 1,
0.3838383, -1.656571, 2.857223, 0, 0.2039216, 1, 1,
0.3848483, -1.003727, 2.379138, 0, 0.1960784, 1, 1,
0.3873344, -1.150187, 2.56577, 0, 0.1882353, 1, 1,
0.3949186, -0.1104425, 0.8080512, 0, 0.1843137, 1, 1,
0.4002139, -1.230947, 3.678165, 0, 0.1764706, 1, 1,
0.4003816, 0.8406197, -1.713831, 0, 0.172549, 1, 1,
0.4008409, -1.177554, 4.682827, 0, 0.1647059, 1, 1,
0.4012114, 0.2367534, 0.5446863, 0, 0.1607843, 1, 1,
0.4047138, -0.8172737, 3.285819, 0, 0.1529412, 1, 1,
0.4065959, -0.04319629, 3.088017, 0, 0.1490196, 1, 1,
0.4081708, 0.4119786, 0.3844756, 0, 0.1411765, 1, 1,
0.4088067, 1.55548, -0.1780608, 0, 0.1372549, 1, 1,
0.4105135, 0.2843676, 1.901779, 0, 0.1294118, 1, 1,
0.4138076, 0.9854708, -2.11764, 0, 0.1254902, 1, 1,
0.4170955, 1.232499, 0.4659551, 0, 0.1176471, 1, 1,
0.420693, -0.7830007, 3.051431, 0, 0.1137255, 1, 1,
0.4213394, -1.665622, 3.822673, 0, 0.1058824, 1, 1,
0.422976, 0.2827632, 1.135157, 0, 0.09803922, 1, 1,
0.4271399, 1.609168, -0.8873711, 0, 0.09411765, 1, 1,
0.4282199, -1.141587, 2.092526, 0, 0.08627451, 1, 1,
0.4307778, -0.4389284, 4.09398, 0, 0.08235294, 1, 1,
0.4315215, -0.4339164, 2.84222, 0, 0.07450981, 1, 1,
0.4378859, 0.618364, -0.3231839, 0, 0.07058824, 1, 1,
0.43874, -0.5204857, 1.318122, 0, 0.0627451, 1, 1,
0.4408139, 1.237592, 0.8672007, 0, 0.05882353, 1, 1,
0.4414694, 0.2210892, 0.3999628, 0, 0.05098039, 1, 1,
0.4420308, -0.005229712, -0.9147084, 0, 0.04705882, 1, 1,
0.4484762, -0.1495215, 2.049755, 0, 0.03921569, 1, 1,
0.4494459, 0.3152735, 0.1778749, 0, 0.03529412, 1, 1,
0.451243, -1.214742, 3.048872, 0, 0.02745098, 1, 1,
0.4523045, 0.4307919, 2.180915, 0, 0.02352941, 1, 1,
0.4577479, 1.12648, 1.794755, 0, 0.01568628, 1, 1,
0.4599954, -0.1568366, 1.62446, 0, 0.01176471, 1, 1,
0.465246, -0.7401049, 2.094534, 0, 0.003921569, 1, 1,
0.465614, -0.02411184, 2.375688, 0.003921569, 0, 1, 1,
0.4691925, -0.5439276, 3.368772, 0.007843138, 0, 1, 1,
0.4714118, -1.525912, 2.24202, 0.01568628, 0, 1, 1,
0.4742953, 1.007046, 0.7451718, 0.01960784, 0, 1, 1,
0.4752288, 0.6663064, -2.055, 0.02745098, 0, 1, 1,
0.4754017, -1.708451, 2.657295, 0.03137255, 0, 1, 1,
0.4834507, -1.156805, 1.869214, 0.03921569, 0, 1, 1,
0.4895755, 0.8096913, -0.3930591, 0.04313726, 0, 1, 1,
0.4968554, -0.09116536, 2.169797, 0.05098039, 0, 1, 1,
0.5041429, -1.17778, 4.458102, 0.05490196, 0, 1, 1,
0.505842, -0.8802346, 3.098011, 0.0627451, 0, 1, 1,
0.5060837, -0.9171426, 3.242156, 0.06666667, 0, 1, 1,
0.5123624, 0.6348913, 1.035794, 0.07450981, 0, 1, 1,
0.5129938, 2.134201, 1.138947, 0.07843138, 0, 1, 1,
0.5154935, -0.5761507, 2.365886, 0.08627451, 0, 1, 1,
0.5176266, 0.7662761, -0.208794, 0.09019608, 0, 1, 1,
0.5178025, 0.5742877, 1.884522, 0.09803922, 0, 1, 1,
0.5182914, 1.642246, -0.3007716, 0.1058824, 0, 1, 1,
0.5204435, -1.377523, 3.046116, 0.1098039, 0, 1, 1,
0.5228798, -0.414133, 3.424464, 0.1176471, 0, 1, 1,
0.5231409, -0.8033212, 3.762666, 0.1215686, 0, 1, 1,
0.5238814, 0.938821, 1.023874, 0.1294118, 0, 1, 1,
0.5240609, 0.0826169, 1.461608, 0.1333333, 0, 1, 1,
0.525017, 0.0567485, 0.4249522, 0.1411765, 0, 1, 1,
0.5282374, 0.2340959, 0.6972548, 0.145098, 0, 1, 1,
0.5292936, 2.159224, 0.7591493, 0.1529412, 0, 1, 1,
0.531738, -0.8525363, 4.950216, 0.1568628, 0, 1, 1,
0.5386653, 0.7404978, 0.9925705, 0.1647059, 0, 1, 1,
0.5442632, -0.7572207, 4.241143, 0.1686275, 0, 1, 1,
0.5464281, -0.05033601, 0.2384948, 0.1764706, 0, 1, 1,
0.5466841, 0.1980362, 0.9970636, 0.1803922, 0, 1, 1,
0.5476035, 0.003951684, 1.146988, 0.1882353, 0, 1, 1,
0.5507503, 1.128557, 1.036396, 0.1921569, 0, 1, 1,
0.5549303, 0.3700638, 1.181378, 0.2, 0, 1, 1,
0.5555745, 0.1394636, 4.568262, 0.2078431, 0, 1, 1,
0.5557625, 1.632803, 0.1559465, 0.2117647, 0, 1, 1,
0.5565509, 0.5177687, 2.152608, 0.2196078, 0, 1, 1,
0.5567132, -0.2014033, 3.811043, 0.2235294, 0, 1, 1,
0.5580704, 0.3009834, -0.4294503, 0.2313726, 0, 1, 1,
0.5612039, -0.6158473, 2.826355, 0.2352941, 0, 1, 1,
0.5616068, 0.4081834, 1.547234, 0.2431373, 0, 1, 1,
0.563443, 0.1787744, 2.704468, 0.2470588, 0, 1, 1,
0.5660045, -0.1083079, 1.67758, 0.254902, 0, 1, 1,
0.5737394, -0.4291964, 1.783769, 0.2588235, 0, 1, 1,
0.5781271, -0.2175842, 2.406895, 0.2666667, 0, 1, 1,
0.5817972, 0.5243402, 0.7059714, 0.2705882, 0, 1, 1,
0.5911748, -1.216034, 2.838135, 0.2784314, 0, 1, 1,
0.5920619, 0.1888539, 1.61949, 0.282353, 0, 1, 1,
0.5954666, -1.659907, 3.095007, 0.2901961, 0, 1, 1,
0.6023557, -0.1902912, 1.139597, 0.2941177, 0, 1, 1,
0.6038396, -0.5656556, 2.826944, 0.3019608, 0, 1, 1,
0.6109457, -0.6413413, 1.560165, 0.3098039, 0, 1, 1,
0.6127302, -0.2042177, 1.071965, 0.3137255, 0, 1, 1,
0.6129798, -1.245681, 4.169183, 0.3215686, 0, 1, 1,
0.6130412, 1.198641, 1.224087, 0.3254902, 0, 1, 1,
0.6162847, -0.3637689, 2.220105, 0.3333333, 0, 1, 1,
0.6177842, -2.053266, 5.020745, 0.3372549, 0, 1, 1,
0.625668, 0.3972239, -0.3161672, 0.345098, 0, 1, 1,
0.6265098, -0.1060836, 0.4873751, 0.3490196, 0, 1, 1,
0.632097, -0.8398678, 3.221555, 0.3568628, 0, 1, 1,
0.6349811, -1.517054, 2.925222, 0.3607843, 0, 1, 1,
0.6357712, -0.8294435, 3.164782, 0.3686275, 0, 1, 1,
0.6395929, -1.036496, 2.388504, 0.372549, 0, 1, 1,
0.64044, -0.07662578, 3.392356, 0.3803922, 0, 1, 1,
0.6423603, 0.2768221, 0.0211063, 0.3843137, 0, 1, 1,
0.6440638, 0.9198619, 2.183894, 0.3921569, 0, 1, 1,
0.6504474, 0.3504719, 1.641642, 0.3960784, 0, 1, 1,
0.6510672, -1.455318, 2.228375, 0.4039216, 0, 1, 1,
0.6610689, -0.138164, 1.699681, 0.4117647, 0, 1, 1,
0.6618169, -0.4833987, 1.154749, 0.4156863, 0, 1, 1,
0.6657519, -0.6819088, 3.030232, 0.4235294, 0, 1, 1,
0.6728253, 0.1242491, 0.843203, 0.427451, 0, 1, 1,
0.6765174, -0.7934924, 2.046355, 0.4352941, 0, 1, 1,
0.6774372, 0.1631537, 1.814928, 0.4392157, 0, 1, 1,
0.6782153, 0.08774506, 0.5941642, 0.4470588, 0, 1, 1,
0.6796646, -0.6571931, 2.431883, 0.4509804, 0, 1, 1,
0.6837077, -1.709074, 1.139268, 0.4588235, 0, 1, 1,
0.6846928, -0.192148, 2.806864, 0.4627451, 0, 1, 1,
0.691504, -2.160665, 3.084471, 0.4705882, 0, 1, 1,
0.6967278, -1.192503, 2.976389, 0.4745098, 0, 1, 1,
0.6984637, 0.3292469, 0.3881353, 0.4823529, 0, 1, 1,
0.6994924, -1.145284, 2.329564, 0.4862745, 0, 1, 1,
0.7031825, 0.4719741, 0.6991908, 0.4941176, 0, 1, 1,
0.7046428, 0.5814649, 2.446962, 0.5019608, 0, 1, 1,
0.7088206, -0.7681132, 3.072027, 0.5058824, 0, 1, 1,
0.7091978, 1.144094, 2.12626, 0.5137255, 0, 1, 1,
0.7103684, -0.4737704, 1.410904, 0.5176471, 0, 1, 1,
0.7119594, 0.09236587, 1.57233, 0.5254902, 0, 1, 1,
0.7157128, -0.4088888, 1.703876, 0.5294118, 0, 1, 1,
0.7177079, -0.1144364, 1.509382, 0.5372549, 0, 1, 1,
0.7182549, 0.00866155, 3.381071, 0.5411765, 0, 1, 1,
0.7188656, 0.04784233, -0.6749781, 0.5490196, 0, 1, 1,
0.7241846, -1.079345, 2.087282, 0.5529412, 0, 1, 1,
0.7243827, -0.947726, 1.273111, 0.5607843, 0, 1, 1,
0.7277472, -1.441014, 3.635332, 0.5647059, 0, 1, 1,
0.7281714, 0.3356269, 1.41667, 0.572549, 0, 1, 1,
0.7287947, -0.06209486, 2.499248, 0.5764706, 0, 1, 1,
0.7340846, -0.1481414, -0.1465526, 0.5843138, 0, 1, 1,
0.7374135, -0.766387, 0.8914742, 0.5882353, 0, 1, 1,
0.741245, -1.196104, 2.229993, 0.5960785, 0, 1, 1,
0.7500035, -0.7127724, 0.9092985, 0.6039216, 0, 1, 1,
0.7531484, 0.7814486, 1.301547, 0.6078432, 0, 1, 1,
0.7577763, 0.7212822, 0.7958393, 0.6156863, 0, 1, 1,
0.7591447, -1.310777, 3.045737, 0.6196079, 0, 1, 1,
0.7680755, -0.5187139, 2.894872, 0.627451, 0, 1, 1,
0.7700235, 1.593547, 0.8731046, 0.6313726, 0, 1, 1,
0.7704543, -0.1898676, 2.899686, 0.6392157, 0, 1, 1,
0.7846805, -0.3334067, 0.5373679, 0.6431373, 0, 1, 1,
0.7926095, -0.706744, 2.045389, 0.6509804, 0, 1, 1,
0.7931821, 0.5861837, -0.1236636, 0.654902, 0, 1, 1,
0.7960862, -0.4704393, 1.384604, 0.6627451, 0, 1, 1,
0.8005924, 0.212301, 0.5060179, 0.6666667, 0, 1, 1,
0.8041159, 1.955612, 1.881317, 0.6745098, 0, 1, 1,
0.8080639, -0.2087379, 1.179068, 0.6784314, 0, 1, 1,
0.8091293, -0.07333368, -0.1901063, 0.6862745, 0, 1, 1,
0.809322, -0.2279166, 3.162589, 0.6901961, 0, 1, 1,
0.8152283, 0.001952906, 3.370767, 0.6980392, 0, 1, 1,
0.8193356, 0.577098, 0.852918, 0.7058824, 0, 1, 1,
0.8193651, 2.098408, 1.679566, 0.7098039, 0, 1, 1,
0.8234832, -0.8486539, 2.45048, 0.7176471, 0, 1, 1,
0.8327129, -0.1557092, 1.801366, 0.7215686, 0, 1, 1,
0.8359738, 1.937717, 0.7760646, 0.7294118, 0, 1, 1,
0.838642, 0.7785276, 0.1428925, 0.7333333, 0, 1, 1,
0.8391638, 0.08404341, 2.70076, 0.7411765, 0, 1, 1,
0.8413336, -1.053464, 3.597627, 0.7450981, 0, 1, 1,
0.8414201, -2.155492, 2.68021, 0.7529412, 0, 1, 1,
0.8434133, 0.8521205, 0.05693465, 0.7568628, 0, 1, 1,
0.8474914, 1.374374, 0.7864026, 0.7647059, 0, 1, 1,
0.8477578, -0.2985374, 1.023759, 0.7686275, 0, 1, 1,
0.8578632, -1.685665, 1.313071, 0.7764706, 0, 1, 1,
0.8582198, 0.2182631, 0.9375355, 0.7803922, 0, 1, 1,
0.8599333, -0.2122034, 1.524218, 0.7882353, 0, 1, 1,
0.860209, -1.760345, 5.828574, 0.7921569, 0, 1, 1,
0.8639581, -1.447921, -0.2298759, 0.8, 0, 1, 1,
0.8671708, -0.4918302, 1.846848, 0.8078431, 0, 1, 1,
0.870564, -0.5114835, 1.897631, 0.8117647, 0, 1, 1,
0.8752416, 0.9828865, 0.3004507, 0.8196079, 0, 1, 1,
0.8827965, 0.1658874, 2.023897, 0.8235294, 0, 1, 1,
0.8858482, 0.6311972, 0.04767941, 0.8313726, 0, 1, 1,
0.888509, 1.639659, -0.784395, 0.8352941, 0, 1, 1,
0.8925244, 0.7525624, -0.4784516, 0.8431373, 0, 1, 1,
0.9140621, -0.09503264, -0.923396, 0.8470588, 0, 1, 1,
0.9187657, 2.061859, 0.3004014, 0.854902, 0, 1, 1,
0.9240437, 1.065051, 1.998258, 0.8588235, 0, 1, 1,
0.9245653, -2.263956, 1.004145, 0.8666667, 0, 1, 1,
0.9262753, 0.2805899, 0.6242678, 0.8705882, 0, 1, 1,
0.9293293, -0.4336811, 1.857486, 0.8784314, 0, 1, 1,
0.9332399, -0.4277847, 2.940506, 0.8823529, 0, 1, 1,
0.9366463, -0.4226335, 0.0397661, 0.8901961, 0, 1, 1,
0.9371635, -0.2462549, 2.321405, 0.8941177, 0, 1, 1,
0.9374005, 0.3301196, 2.90352, 0.9019608, 0, 1, 1,
0.9425583, 0.8053529, 0.6002987, 0.9098039, 0, 1, 1,
0.9425862, 0.4826925, 1.959017, 0.9137255, 0, 1, 1,
0.9433014, -0.9507934, 0.5913947, 0.9215686, 0, 1, 1,
0.9466941, -0.6744721, 3.462294, 0.9254902, 0, 1, 1,
0.9553831, 1.130288, 0.9850136, 0.9333333, 0, 1, 1,
0.9617473, -0.7136478, 1.07247, 0.9372549, 0, 1, 1,
0.9658465, 0.4499398, 1.763614, 0.945098, 0, 1, 1,
0.9666602, -0.1873469, 1.452437, 0.9490196, 0, 1, 1,
0.9712707, 0.01670314, 1.459876, 0.9568627, 0, 1, 1,
0.9715186, -0.2964919, 2.848812, 0.9607843, 0, 1, 1,
0.9722319, -0.1069963, 2.494617, 0.9686275, 0, 1, 1,
0.9771296, -0.919028, 2.60625, 0.972549, 0, 1, 1,
0.9815575, 0.9247841, 0.5265741, 0.9803922, 0, 1, 1,
0.985877, -1.220352, 1.810974, 0.9843137, 0, 1, 1,
0.9978446, 2.500328, 1.510058, 0.9921569, 0, 1, 1,
0.9999127, 0.7898823, 0.534441, 0.9960784, 0, 1, 1,
1.001225, -0.8573127, 3.778714, 1, 0, 0.9960784, 1,
1.008327, 0.9522845, 0.7175767, 1, 0, 0.9882353, 1,
1.009337, 1.155465, 0.6947021, 1, 0, 0.9843137, 1,
1.021478, 0.1308402, 2.724101, 1, 0, 0.9764706, 1,
1.023361, -2.647302, 1.798026, 1, 0, 0.972549, 1,
1.02387, -0.02794034, 1.74578, 1, 0, 0.9647059, 1,
1.037534, -1.010196, 2.386364, 1, 0, 0.9607843, 1,
1.040714, -0.6139172, 1.900849, 1, 0, 0.9529412, 1,
1.042097, -0.1694962, 1.133789, 1, 0, 0.9490196, 1,
1.049935, 0.2495233, 0.9430824, 1, 0, 0.9411765, 1,
1.054379, -0.6918091, 1.155753, 1, 0, 0.9372549, 1,
1.054443, -1.569998, 2.875214, 1, 0, 0.9294118, 1,
1.057991, -0.3848547, 2.845721, 1, 0, 0.9254902, 1,
1.058126, 0.2381946, 1.005828, 1, 0, 0.9176471, 1,
1.059209, 0.1297568, 0.4037043, 1, 0, 0.9137255, 1,
1.061911, 0.6278122, 1.864111, 1, 0, 0.9058824, 1,
1.065457, -0.006375643, 1.3499, 1, 0, 0.9019608, 1,
1.069379, -0.5430502, 1.151403, 1, 0, 0.8941177, 1,
1.072214, -2.105422, 3.285722, 1, 0, 0.8862745, 1,
1.072402, -0.5057628, 0.1655138, 1, 0, 0.8823529, 1,
1.072456, -2.089179, 3.915007, 1, 0, 0.8745098, 1,
1.074902, -0.1894012, 3.563839, 1, 0, 0.8705882, 1,
1.075085, 0.5698866, 0.9382062, 1, 0, 0.8627451, 1,
1.078431, -0.3906476, 1.618741, 1, 0, 0.8588235, 1,
1.085935, 0.4696705, -0.240467, 1, 0, 0.8509804, 1,
1.097083, 1.506361, 2.185033, 1, 0, 0.8470588, 1,
1.097197, -1.452279, 2.338987, 1, 0, 0.8392157, 1,
1.104675, -0.6853926, 4.290504, 1, 0, 0.8352941, 1,
1.114466, -0.8345494, 1.373376, 1, 0, 0.827451, 1,
1.120231, 0.7301975, 1.568848, 1, 0, 0.8235294, 1,
1.125311, 0.1644328, 2.29699, 1, 0, 0.8156863, 1,
1.128217, 0.6868486, 3.35557, 1, 0, 0.8117647, 1,
1.135498, -1.961408, 2.135026, 1, 0, 0.8039216, 1,
1.145113, 1.555301, 0.5276442, 1, 0, 0.7960784, 1,
1.146843, 0.7475213, 1.344963, 1, 0, 0.7921569, 1,
1.150011, 0.717431, 0.1663881, 1, 0, 0.7843137, 1,
1.153915, 1.300347, 2.110958, 1, 0, 0.7803922, 1,
1.155939, 1.915165, -0.07834547, 1, 0, 0.772549, 1,
1.157272, -0.4041225, 2.233235, 1, 0, 0.7686275, 1,
1.158893, 1.526878, 0.21852, 1, 0, 0.7607843, 1,
1.162193, 1.581471, -1.342864, 1, 0, 0.7568628, 1,
1.163483, 0.03854085, 0.8349436, 1, 0, 0.7490196, 1,
1.170238, -0.236792, 3.914648, 1, 0, 0.7450981, 1,
1.170332, -0.8855446, 2.589458, 1, 0, 0.7372549, 1,
1.174536, 0.2168535, 2.167465, 1, 0, 0.7333333, 1,
1.181085, 1.383361, 0.793259, 1, 0, 0.7254902, 1,
1.181724, -1.003358, 1.1073, 1, 0, 0.7215686, 1,
1.186136, -0.04076738, 2.269072, 1, 0, 0.7137255, 1,
1.192857, -2.170734, 2.307362, 1, 0, 0.7098039, 1,
1.197485, -1.535702, 2.886451, 1, 0, 0.7019608, 1,
1.200176, -0.4964346, 1.427014, 1, 0, 0.6941177, 1,
1.204289, -0.918175, 2.734427, 1, 0, 0.6901961, 1,
1.205136, -0.05397412, 2.609664, 1, 0, 0.682353, 1,
1.212058, -0.3727251, 0.6697347, 1, 0, 0.6784314, 1,
1.212189, 0.8709815, 0.6847868, 1, 0, 0.6705883, 1,
1.213235, 2.010736, 0.0311837, 1, 0, 0.6666667, 1,
1.215652, 0.1969246, 1.910525, 1, 0, 0.6588235, 1,
1.225558, -0.9565184, 1.755986, 1, 0, 0.654902, 1,
1.236195, -1.451049, 3.140972, 1, 0, 0.6470588, 1,
1.254207, -0.9199536, 1.36377, 1, 0, 0.6431373, 1,
1.261655, 1.419734, 0.7559864, 1, 0, 0.6352941, 1,
1.262264, 1.210814, 0.3469239, 1, 0, 0.6313726, 1,
1.272319, -0.1395483, 2.134395, 1, 0, 0.6235294, 1,
1.277269, -0.869809, 2.177845, 1, 0, 0.6196079, 1,
1.285705, 1.296374, -0.2687062, 1, 0, 0.6117647, 1,
1.285747, 0.5917547, 2.227448, 1, 0, 0.6078432, 1,
1.291647, -0.4850505, 2.817195, 1, 0, 0.6, 1,
1.298877, 0.8144927, 1.763809, 1, 0, 0.5921569, 1,
1.306441, -0.1056136, 0.7311434, 1, 0, 0.5882353, 1,
1.314403, -0.0120435, 1.736896, 1, 0, 0.5803922, 1,
1.325535, 0.545093, 0.03857721, 1, 0, 0.5764706, 1,
1.328358, 0.1653164, -0.07453184, 1, 0, 0.5686275, 1,
1.346287, -1.724, 3.835358, 1, 0, 0.5647059, 1,
1.348163, 0.3723072, 1.667458, 1, 0, 0.5568628, 1,
1.350913, -0.2529016, 2.383259, 1, 0, 0.5529412, 1,
1.364509, 0.5096549, 0.6233493, 1, 0, 0.5450981, 1,
1.364553, 0.4241537, 0.6879514, 1, 0, 0.5411765, 1,
1.370143, -0.6815197, 2.024439, 1, 0, 0.5333334, 1,
1.379016, 0.8969823, 1.980972, 1, 0, 0.5294118, 1,
1.379514, 0.8182875, 1.648034, 1, 0, 0.5215687, 1,
1.401044, 0.07043513, 1.473269, 1, 0, 0.5176471, 1,
1.403501, -0.0100997, -0.8959895, 1, 0, 0.509804, 1,
1.415194, -1.145781, 2.543983, 1, 0, 0.5058824, 1,
1.416399, -0.8954507, 3.462363, 1, 0, 0.4980392, 1,
1.419165, -2.225356, 2.195349, 1, 0, 0.4901961, 1,
1.434855, -1.939892, 4.756721, 1, 0, 0.4862745, 1,
1.435633, 1.504977, 0.2462613, 1, 0, 0.4784314, 1,
1.440068, -0.8563907, 1.461604, 1, 0, 0.4745098, 1,
1.443563, -0.9614148, 0.5027207, 1, 0, 0.4666667, 1,
1.453398, -0.3337557, 2.248377, 1, 0, 0.4627451, 1,
1.455659, -0.432957, 0.9921108, 1, 0, 0.454902, 1,
1.462387, -0.07188205, 1.706101, 1, 0, 0.4509804, 1,
1.47802, -2.004238, 2.597135, 1, 0, 0.4431373, 1,
1.512495, -0.2427363, 2.592373, 1, 0, 0.4392157, 1,
1.513546, 0.4404071, 1.567327, 1, 0, 0.4313726, 1,
1.518461, 0.3919218, 2.625104, 1, 0, 0.427451, 1,
1.536487, 0.4590768, 1.765838, 1, 0, 0.4196078, 1,
1.539534, -0.4239683, 0.7858866, 1, 0, 0.4156863, 1,
1.549934, -0.2063001, 1.136195, 1, 0, 0.4078431, 1,
1.550102, 0.8443255, 0.3051191, 1, 0, 0.4039216, 1,
1.552795, -0.8512881, 2.434308, 1, 0, 0.3960784, 1,
1.572669, 0.1855271, 2.021685, 1, 0, 0.3882353, 1,
1.575701, 2.002739, 0.7928448, 1, 0, 0.3843137, 1,
1.579377, 0.5538459, 2.361944, 1, 0, 0.3764706, 1,
1.580951, 2.063448, 1.671968, 1, 0, 0.372549, 1,
1.594893, 0.4583911, 1.179849, 1, 0, 0.3647059, 1,
1.599386, -0.05267581, 1.300746, 1, 0, 0.3607843, 1,
1.602513, -1.930504, 1.518265, 1, 0, 0.3529412, 1,
1.612216, 0.1280863, 0.875397, 1, 0, 0.3490196, 1,
1.612974, 0.1514647, 0.8985026, 1, 0, 0.3411765, 1,
1.622094, 1.827569, -0.3327135, 1, 0, 0.3372549, 1,
1.626139, -0.8556334, 1.764976, 1, 0, 0.3294118, 1,
1.632555, 1.520311, -0.2560991, 1, 0, 0.3254902, 1,
1.636045, -0.04854069, 2.633261, 1, 0, 0.3176471, 1,
1.63805, 1.029969, 0.3772781, 1, 0, 0.3137255, 1,
1.648471, -0.5340784, 3.148903, 1, 0, 0.3058824, 1,
1.655762, 0.1918189, 2.243261, 1, 0, 0.2980392, 1,
1.677669, -0.818805, 3.209841, 1, 0, 0.2941177, 1,
1.688321, -1.139983, 2.224128, 1, 0, 0.2862745, 1,
1.713559, 0.2551477, 2.019091, 1, 0, 0.282353, 1,
1.729649, 0.3507805, 1.447927, 1, 0, 0.2745098, 1,
1.732769, -0.3374644, 1.385974, 1, 0, 0.2705882, 1,
1.739687, 0.5349262, 2.253709, 1, 0, 0.2627451, 1,
1.74412, -0.383773, 1.062881, 1, 0, 0.2588235, 1,
1.754465, -1.209941, 3.088211, 1, 0, 0.2509804, 1,
1.800666, 1.332741, 1.218854, 1, 0, 0.2470588, 1,
1.802996, -0.6697527, 2.556679, 1, 0, 0.2392157, 1,
1.804238, 1.178401, 0.8952195, 1, 0, 0.2352941, 1,
1.810404, -0.1565683, 0.176644, 1, 0, 0.227451, 1,
1.81519, 1.976311, -0.6910084, 1, 0, 0.2235294, 1,
1.840092, 0.4335939, 0.6777984, 1, 0, 0.2156863, 1,
1.852851, 0.2815145, 2.04387, 1, 0, 0.2117647, 1,
1.861064, 0.2457875, -0.5648935, 1, 0, 0.2039216, 1,
1.862983, 0.2901215, 1.051931, 1, 0, 0.1960784, 1,
1.917872, 0.1418197, 1.292588, 1, 0, 0.1921569, 1,
1.924197, -1.618407, 2.670861, 1, 0, 0.1843137, 1,
1.932736, 1.324799, 1.373961, 1, 0, 0.1803922, 1,
1.937792, 0.3312995, 2.36891, 1, 0, 0.172549, 1,
1.948797, -0.213677, 0.4321992, 1, 0, 0.1686275, 1,
1.951603, 1.461056, 1.067969, 1, 0, 0.1607843, 1,
1.967748, 0.7821755, 2.260587, 1, 0, 0.1568628, 1,
1.975354, -0.1554487, 1.884764, 1, 0, 0.1490196, 1,
1.983808, -0.4319637, -0.1842016, 1, 0, 0.145098, 1,
1.986236, -0.8524566, 1.087959, 1, 0, 0.1372549, 1,
1.986313, -0.884774, 2.703378, 1, 0, 0.1333333, 1,
1.99903, -1.183067, 2.532066, 1, 0, 0.1254902, 1,
1.999547, 0.5375805, 0.494111, 1, 0, 0.1215686, 1,
2.047757, 0.7228717, 0.04091975, 1, 0, 0.1137255, 1,
2.061743, -0.5486879, 1.661509, 1, 0, 0.1098039, 1,
2.069689, -0.3752661, -0.03317285, 1, 0, 0.1019608, 1,
2.08024, -1.457317, 1.401403, 1, 0, 0.09411765, 1,
2.091724, -0.9783832, 1.505929, 1, 0, 0.09019608, 1,
2.093838, -0.3957929, 0.7731401, 1, 0, 0.08235294, 1,
2.094194, 0.5977796, 2.266646, 1, 0, 0.07843138, 1,
2.102947, 0.0874105, 3.05969, 1, 0, 0.07058824, 1,
2.137093, 0.6357378, 0.8420735, 1, 0, 0.06666667, 1,
2.167038, -0.2919801, 1.685316, 1, 0, 0.05882353, 1,
2.180493, -0.3066094, 0.4508543, 1, 0, 0.05490196, 1,
2.237273, 0.4061697, 0.6675023, 1, 0, 0.04705882, 1,
2.389013, 1.288391, 0.4560807, 1, 0, 0.04313726, 1,
2.538231, -0.2716676, 2.816629, 1, 0, 0.03529412, 1,
2.637616, -0.4771412, 1.480368, 1, 0, 0.03137255, 1,
2.664726, -0.3300152, 1.343177, 1, 0, 0.02352941, 1,
2.754642, -0.8078033, 2.17221, 1, 0, 0.01960784, 1,
2.784156, 2.321264, 1.196179, 1, 0, 0.01176471, 1,
3.181198, 0.2683522, 2.456147, 1, 0, 0.007843138, 1
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
-0.1232812, -4.051317, -7.129101, 0, -0.5, 0.5, 0.5,
-0.1232812, -4.051317, -7.129101, 1, -0.5, 0.5, 0.5,
-0.1232812, -4.051317, -7.129101, 1, 1.5, 0.5, 0.5,
-0.1232812, -4.051317, -7.129101, 0, 1.5, 0.5, 0.5
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
-4.547979, 0.1638981, -7.129101, 0, -0.5, 0.5, 0.5,
-4.547979, 0.1638981, -7.129101, 1, -0.5, 0.5, 0.5,
-4.547979, 0.1638981, -7.129101, 1, 1.5, 0.5, 0.5,
-4.547979, 0.1638981, -7.129101, 0, 1.5, 0.5, 0.5
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
-4.547979, -4.051317, 0.2887387, 0, -0.5, 0.5, 0.5,
-4.547979, -4.051317, 0.2887387, 1, -0.5, 0.5, 0.5,
-4.547979, -4.051317, 0.2887387, 1, 1.5, 0.5, 0.5,
-4.547979, -4.051317, 0.2887387, 0, 1.5, 0.5, 0.5
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
-3, -3.078575, -5.417292,
3, -3.078575, -5.417292,
-3, -3.078575, -5.417292,
-3, -3.240699, -5.702593,
-2, -3.078575, -5.417292,
-2, -3.240699, -5.702593,
-1, -3.078575, -5.417292,
-1, -3.240699, -5.702593,
0, -3.078575, -5.417292,
0, -3.240699, -5.702593,
1, -3.078575, -5.417292,
1, -3.240699, -5.702593,
2, -3.078575, -5.417292,
2, -3.240699, -5.702593,
3, -3.078575, -5.417292,
3, -3.240699, -5.702593
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
-3, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
-3, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
-3, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
-3, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
-2, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
-2, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
-2, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
-2, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
-1, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
-1, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
-1, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
-1, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
0, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
0, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
0, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
0, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
1, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
1, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
1, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
1, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
2, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
2, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
2, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
2, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5,
3, -3.564946, -6.273196, 0, -0.5, 0.5, 0.5,
3, -3.564946, -6.273196, 1, -0.5, 0.5, 0.5,
3, -3.564946, -6.273196, 1, 1.5, 0.5, 0.5,
3, -3.564946, -6.273196, 0, 1.5, 0.5, 0.5
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
-3.526895, -2, -5.417292,
-3.526895, 3, -5.417292,
-3.526895, -2, -5.417292,
-3.697075, -2, -5.702593,
-3.526895, -1, -5.417292,
-3.697075, -1, -5.702593,
-3.526895, 0, -5.417292,
-3.697075, 0, -5.702593,
-3.526895, 1, -5.417292,
-3.697075, 1, -5.702593,
-3.526895, 2, -5.417292,
-3.697075, 2, -5.702593,
-3.526895, 3, -5.417292,
-3.697075, 3, -5.702593
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
-4.037437, -2, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, -2, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, -2, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, -2, -6.273196, 0, 1.5, 0.5, 0.5,
-4.037437, -1, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, -1, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, -1, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, -1, -6.273196, 0, 1.5, 0.5, 0.5,
-4.037437, 0, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, 0, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, 0, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, 0, -6.273196, 0, 1.5, 0.5, 0.5,
-4.037437, 1, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, 1, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, 1, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, 1, -6.273196, 0, 1.5, 0.5, 0.5,
-4.037437, 2, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, 2, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, 2, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, 2, -6.273196, 0, 1.5, 0.5, 0.5,
-4.037437, 3, -6.273196, 0, -0.5, 0.5, 0.5,
-4.037437, 3, -6.273196, 1, -0.5, 0.5, 0.5,
-4.037437, 3, -6.273196, 1, 1.5, 0.5, 0.5,
-4.037437, 3, -6.273196, 0, 1.5, 0.5, 0.5
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
-3.526895, -3.078575, -4,
-3.526895, -3.078575, 4,
-3.526895, -3.078575, -4,
-3.697075, -3.240699, -4,
-3.526895, -3.078575, -2,
-3.697075, -3.240699, -2,
-3.526895, -3.078575, 0,
-3.697075, -3.240699, 0,
-3.526895, -3.078575, 2,
-3.697075, -3.240699, 2,
-3.526895, -3.078575, 4,
-3.697075, -3.240699, 4
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
-4.037437, -3.564946, -4, 0, -0.5, 0.5, 0.5,
-4.037437, -3.564946, -4, 1, -0.5, 0.5, 0.5,
-4.037437, -3.564946, -4, 1, 1.5, 0.5, 0.5,
-4.037437, -3.564946, -4, 0, 1.5, 0.5, 0.5,
-4.037437, -3.564946, -2, 0, -0.5, 0.5, 0.5,
-4.037437, -3.564946, -2, 1, -0.5, 0.5, 0.5,
-4.037437, -3.564946, -2, 1, 1.5, 0.5, 0.5,
-4.037437, -3.564946, -2, 0, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 0, 0, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 0, 1, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 0, 1, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 0, 0, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 2, 0, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 2, 1, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 2, 1, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 2, 0, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 4, 0, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 4, 1, -0.5, 0.5, 0.5,
-4.037437, -3.564946, 4, 1, 1.5, 0.5, 0.5,
-4.037437, -3.564946, 4, 0, 1.5, 0.5, 0.5
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
-3.526895, -3.078575, -5.417292,
-3.526895, 3.406371, -5.417292,
-3.526895, -3.078575, 5.994769,
-3.526895, 3.406371, 5.994769,
-3.526895, -3.078575, -5.417292,
-3.526895, -3.078575, 5.994769,
-3.526895, 3.406371, -5.417292,
-3.526895, 3.406371, 5.994769,
-3.526895, -3.078575, -5.417292,
3.280332, -3.078575, -5.417292,
-3.526895, -3.078575, 5.994769,
3.280332, -3.078575, 5.994769,
-3.526895, 3.406371, -5.417292,
3.280332, 3.406371, -5.417292,
-3.526895, 3.406371, 5.994769,
3.280332, 3.406371, 5.994769,
3.280332, -3.078575, -5.417292,
3.280332, 3.406371, -5.417292,
3.280332, -3.078575, 5.994769,
3.280332, 3.406371, 5.994769,
3.280332, -3.078575, -5.417292,
3.280332, -3.078575, 5.994769,
3.280332, 3.406371, -5.417292,
3.280332, 3.406371, 5.994769
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
var radius = 7.895477;
var distance = 35.12787;
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
mvMatrix.translate( 0.1232812, -0.1638981, -0.2887387 );
mvMatrix.scale( 1.254071, 1.316394, 0.7480458 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12787);
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
Terbacil<-read.table("Terbacil.xyz")
```

```
## Error in read.table("Terbacil.xyz"): no lines available in input
```

```r
x<-Terbacil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
```

```r
y<-Terbacil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
```

```r
z<-Terbacil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
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
-3.42776, -0.9942124, -2.122124, 0, 0, 1, 1, 1,
-2.893001, -0.02076457, -1.473584, 1, 0, 0, 1, 1,
-2.791805, 2.160163, 0.7710292, 1, 0, 0, 1, 1,
-2.778333, -1.25157, -1.812834, 1, 0, 0, 1, 1,
-2.713255, 0.6753848, -1.510966, 1, 0, 0, 1, 1,
-2.622516, 0.1806434, -2.878103, 1, 0, 0, 1, 1,
-2.552657, -1.196746, -1.867582, 0, 0, 0, 1, 1,
-2.508441, -0.1018577, -2.063139, 0, 0, 0, 1, 1,
-2.46235, 0.02198648, 0.01521445, 0, 0, 0, 1, 1,
-2.447171, 0.3232152, -2.278496, 0, 0, 0, 1, 1,
-2.417463, -0.2693959, -0.2929109, 0, 0, 0, 1, 1,
-2.401313, -0.233128, -2.268033, 0, 0, 0, 1, 1,
-2.242707, -0.2076472, -1.537686, 0, 0, 0, 1, 1,
-2.226916, 0.1849564, 0.2859793, 1, 1, 1, 1, 1,
-2.196777, 0.02497279, -1.306917, 1, 1, 1, 1, 1,
-2.180091, 0.07224438, -2.27029, 1, 1, 1, 1, 1,
-2.139915, -1.256185, -2.829331, 1, 1, 1, 1, 1,
-2.131107, 0.8031412, -1.524572, 1, 1, 1, 1, 1,
-2.093405, 0.6174315, -0.5650024, 1, 1, 1, 1, 1,
-2.058095, 1.302342, -0.4061235, 1, 1, 1, 1, 1,
-2.023437, 0.6428874, -3.307011, 1, 1, 1, 1, 1,
-2.019542, -2.18991, -1.429854, 1, 1, 1, 1, 1,
-1.997252, -1.513476, -0.7714715, 1, 1, 1, 1, 1,
-1.986105, 0.1717826, -2.842609, 1, 1, 1, 1, 1,
-1.979516, 0.5031228, -1.065019, 1, 1, 1, 1, 1,
-1.972003, 0.7936046, -2.058707, 1, 1, 1, 1, 1,
-1.915155, -1.666361, -3.401324, 1, 1, 1, 1, 1,
-1.903378, -0.5875986, -2.323054, 1, 1, 1, 1, 1,
-1.88726, -1.010692, -2.826748, 0, 0, 1, 1, 1,
-1.875031, 0.5730199, -2.132201, 1, 0, 0, 1, 1,
-1.872638, -0.1933755, -1.299822, 1, 0, 0, 1, 1,
-1.839803, 0.8998041, -0.2880387, 1, 0, 0, 1, 1,
-1.821077, -1.312244, -1.396388, 1, 0, 0, 1, 1,
-1.81953, 0.757524, -1.458316, 1, 0, 0, 1, 1,
-1.799265, -0.2911856, -2.150978, 0, 0, 0, 1, 1,
-1.796116, 0.9039049, -1.307378, 0, 0, 0, 1, 1,
-1.784256, -0.491556, -3.101532, 0, 0, 0, 1, 1,
-1.777742, -0.8465924, -1.685858, 0, 0, 0, 1, 1,
-1.767886, 1.006515, -1.027762, 0, 0, 0, 1, 1,
-1.752327, -0.6638622, -1.388296, 0, 0, 0, 1, 1,
-1.751696, -0.5176371, -2.009224, 0, 0, 0, 1, 1,
-1.743592, -0.1741267, -1.682082, 1, 1, 1, 1, 1,
-1.739624, -1.127535, -2.087583, 1, 1, 1, 1, 1,
-1.713624, -0.2226045, -2.192275, 1, 1, 1, 1, 1,
-1.702412, 1.072106, -3.357392, 1, 1, 1, 1, 1,
-1.650615, 0.3979835, -0.2247503, 1, 1, 1, 1, 1,
-1.649004, 0.6458732, -0.6283303, 1, 1, 1, 1, 1,
-1.642105, -1.222464, -3.945235, 1, 1, 1, 1, 1,
-1.62845, 0.768688, -2.40572, 1, 1, 1, 1, 1,
-1.628426, 1.067701, -0.4228384, 1, 1, 1, 1, 1,
-1.622714, -1.254077, -3.741944, 1, 1, 1, 1, 1,
-1.614787, 0.8254014, -1.282999, 1, 1, 1, 1, 1,
-1.601485, -1.799416, -3.08144, 1, 1, 1, 1, 1,
-1.593981, -0.02665101, -0.3900867, 1, 1, 1, 1, 1,
-1.559143, -0.5208895, -2.42624, 1, 1, 1, 1, 1,
-1.557289, 0.1198259, -1.430524, 1, 1, 1, 1, 1,
-1.550304, 0.9844879, -1.529396, 0, 0, 1, 1, 1,
-1.538223, 0.7251211, -0.7928957, 1, 0, 0, 1, 1,
-1.51434, -0.7295894, -1.772778, 1, 0, 0, 1, 1,
-1.488843, 0.4920246, -1.292832, 1, 0, 0, 1, 1,
-1.48549, 0.8525844, -0.7592392, 1, 0, 0, 1, 1,
-1.480024, -0.4736041, -2.265445, 1, 0, 0, 1, 1,
-1.476796, 0.3064768, -2.078494, 0, 0, 0, 1, 1,
-1.456973, -1.462631, -2.615178, 0, 0, 0, 1, 1,
-1.45024, -0.8155189, -3.600318, 0, 0, 0, 1, 1,
-1.448221, -0.3988684, -1.439253, 0, 0, 0, 1, 1,
-1.445102, -1.017692, -3.177905, 0, 0, 0, 1, 1,
-1.443403, 0.1570411, -1.521052, 0, 0, 0, 1, 1,
-1.442917, 0.006153335, -3.195285, 0, 0, 0, 1, 1,
-1.433085, 1.250446, -1.818014, 1, 1, 1, 1, 1,
-1.432283, 0.3025086, 0.3510215, 1, 1, 1, 1, 1,
-1.432252, -0.3433366, -1.831186, 1, 1, 1, 1, 1,
-1.426879, -1.634919, -2.112256, 1, 1, 1, 1, 1,
-1.423217, -0.03735835, -2.432819, 1, 1, 1, 1, 1,
-1.383827, -0.3830566, -4.322955, 1, 1, 1, 1, 1,
-1.376153, -0.002828608, -1.406262, 1, 1, 1, 1, 1,
-1.368198, 1.02145, 0.5478848, 1, 1, 1, 1, 1,
-1.362588, -1.064297, -1.015307, 1, 1, 1, 1, 1,
-1.358238, 1.703534, 0.7416875, 1, 1, 1, 1, 1,
-1.341211, -0.5443046, -2.839497, 1, 1, 1, 1, 1,
-1.337301, -0.4994182, -3.28983, 1, 1, 1, 1, 1,
-1.335342, 0.1907205, -0.9037919, 1, 1, 1, 1, 1,
-1.333874, 2.294172, 0.6373988, 1, 1, 1, 1, 1,
-1.322208, -1.350791, -1.698964, 1, 1, 1, 1, 1,
-1.304996, 0.4964266, -1.278171, 0, 0, 1, 1, 1,
-1.298158, 1.097846, 0.4184771, 1, 0, 0, 1, 1,
-1.295252, 0.4644858, -2.451625, 1, 0, 0, 1, 1,
-1.293002, 0.1321518, -1.728346, 1, 0, 0, 1, 1,
-1.27774, 1.419349, -2.006511, 1, 0, 0, 1, 1,
-1.275367, -1.155967, 0.002416994, 1, 0, 0, 1, 1,
-1.271231, -1.388314, -2.407079, 0, 0, 0, 1, 1,
-1.263874, 0.9682475, -1.553425, 0, 0, 0, 1, 1,
-1.260218, 0.8923132, -0.4121424, 0, 0, 0, 1, 1,
-1.248616, -0.3645933, -1.821289, 0, 0, 0, 1, 1,
-1.23474, -0.1177927, -3.861491, 0, 0, 0, 1, 1,
-1.233376, -1.821777, -1.80259, 0, 0, 0, 1, 1,
-1.226874, 1.724388, -0.2728225, 0, 0, 0, 1, 1,
-1.224329, 1.688059, -1.018833, 1, 1, 1, 1, 1,
-1.221527, -0.467647, -2.147055, 1, 1, 1, 1, 1,
-1.217562, -0.5349057, -0.6643397, 1, 1, 1, 1, 1,
-1.187934, 1.061247, -0.9596719, 1, 1, 1, 1, 1,
-1.187179, -0.1507664, -0.575425, 1, 1, 1, 1, 1,
-1.177745, 0.4852635, -0.8572244, 1, 1, 1, 1, 1,
-1.163059, -0.142771, -2.866889, 1, 1, 1, 1, 1,
-1.149015, 0.9521331, -0.4602071, 1, 1, 1, 1, 1,
-1.146077, -0.4050862, -0.9211968, 1, 1, 1, 1, 1,
-1.140468, -2.984134, -2.492937, 1, 1, 1, 1, 1,
-1.132653, -0.5017087, -0.8341701, 1, 1, 1, 1, 1,
-1.131036, -1.039383, -2.432873, 1, 1, 1, 1, 1,
-1.129127, -1.446582, -2.299087, 1, 1, 1, 1, 1,
-1.127177, -0.3888432, -1.572038, 1, 1, 1, 1, 1,
-1.119063, 0.8485931, -0.1288807, 1, 1, 1, 1, 1,
-1.116787, 2.950324, -1.145722, 0, 0, 1, 1, 1,
-1.115773, 0.6919011, 0.577019, 1, 0, 0, 1, 1,
-1.115434, 0.684531, -2.6036, 1, 0, 0, 1, 1,
-1.111689, -1.111167, -3.266165, 1, 0, 0, 1, 1,
-1.109864, 0.2365894, 1.628821, 1, 0, 0, 1, 1,
-1.107371, -0.01491539, -2.769432, 1, 0, 0, 1, 1,
-1.104622, -0.1989687, 0.1446416, 0, 0, 0, 1, 1,
-1.10348, 0.4166094, 0.9050933, 0, 0, 0, 1, 1,
-1.100723, 0.346379, -1.492857, 0, 0, 0, 1, 1,
-1.098989, 1.537786, -1.147444, 0, 0, 0, 1, 1,
-1.094154, -0.01931726, -2.765581, 0, 0, 0, 1, 1,
-1.087852, -1.477389, -1.164552, 0, 0, 0, 1, 1,
-1.087294, -0.008473114, -1.990939, 0, 0, 0, 1, 1,
-1.083422, 1.917262, 0.1955073, 1, 1, 1, 1, 1,
-1.081154, 1.3494, -0.5100428, 1, 1, 1, 1, 1,
-1.076281, -0.8389037, -2.322901, 1, 1, 1, 1, 1,
-1.075891, -0.5532947, -2.089661, 1, 1, 1, 1, 1,
-1.067936, -2.543497, -3.425788, 1, 1, 1, 1, 1,
-1.058475, -1.030274, -2.734721, 1, 1, 1, 1, 1,
-1.054207, -0.06921833, -2.242278, 1, 1, 1, 1, 1,
-1.047938, -0.8575616, -1.289609, 1, 1, 1, 1, 1,
-1.043642, -1.234923, -2.818616, 1, 1, 1, 1, 1,
-1.043508, 2.465586, 0.632724, 1, 1, 1, 1, 1,
-1.041623, -0.3627669, -3.34052, 1, 1, 1, 1, 1,
-1.040378, -1.323608, -3.175505, 1, 1, 1, 1, 1,
-1.036657, 1.784385, 1.210826, 1, 1, 1, 1, 1,
-1.03401, 0.5093256, -2.172939, 1, 1, 1, 1, 1,
-1.022414, 1.006865, 0.6478807, 1, 1, 1, 1, 1,
-1.020888, -0.8012265, -2.622143, 0, 0, 1, 1, 1,
-1.017931, -0.3177216, -1.7015, 1, 0, 0, 1, 1,
-1.014218, -1.911788, -3.21318, 1, 0, 0, 1, 1,
-1.003042, -0.6581677, -1.831082, 1, 0, 0, 1, 1,
-1.002013, 0.2623877, -2.674024, 1, 0, 0, 1, 1,
-0.9955761, -1.084174, -1.832558, 1, 0, 0, 1, 1,
-0.9917102, 1.075298, -1.409094, 0, 0, 0, 1, 1,
-0.9901815, -0.5190851, -0.3666099, 0, 0, 0, 1, 1,
-0.9854633, -1.960287, -4.481512, 0, 0, 0, 1, 1,
-0.9827638, 1.314696, -2.096541, 0, 0, 0, 1, 1,
-0.9811394, -0.7833579, -4.120996, 0, 0, 0, 1, 1,
-0.9810098, 0.3894539, -2.122162, 0, 0, 0, 1, 1,
-0.9768255, 0.4186362, -1.570079, 0, 0, 0, 1, 1,
-0.9739907, 0.6816398, -0.8877077, 1, 1, 1, 1, 1,
-0.9687136, 0.349179, -0.5892858, 1, 1, 1, 1, 1,
-0.9685649, 0.06908171, -1.728451, 1, 1, 1, 1, 1,
-0.9676108, -0.2810296, -2.63366, 1, 1, 1, 1, 1,
-0.9664319, 0.6386035, -0.5613227, 1, 1, 1, 1, 1,
-0.9621271, -0.03461898, -2.851718, 1, 1, 1, 1, 1,
-0.9545926, -1.046647, -3.811483, 1, 1, 1, 1, 1,
-0.9473457, -0.2604943, -1.194045, 1, 1, 1, 1, 1,
-0.9461004, -0.9539952, -2.719268, 1, 1, 1, 1, 1,
-0.9456226, 0.1806554, -1.384628, 1, 1, 1, 1, 1,
-0.9434715, -0.71662, -1.568366, 1, 1, 1, 1, 1,
-0.9364905, -2.273057, -3.066178, 1, 1, 1, 1, 1,
-0.9309059, 0.02286079, -1.039188, 1, 1, 1, 1, 1,
-0.9303708, 0.126905, -0.5815979, 1, 1, 1, 1, 1,
-0.9269392, 0.8672517, -2.540182, 1, 1, 1, 1, 1,
-0.9124184, -1.159272, -2.874862, 0, 0, 1, 1, 1,
-0.9105615, -0.2623111, -2.165443, 1, 0, 0, 1, 1,
-0.8977091, 0.861421, -2.105901, 1, 0, 0, 1, 1,
-0.8969221, 0.9284177, -1.584402, 1, 0, 0, 1, 1,
-0.8951651, 0.717558, -0.3431112, 1, 0, 0, 1, 1,
-0.8925835, 0.19697, -2.860172, 1, 0, 0, 1, 1,
-0.8918601, 1.802656, -0.7962578, 0, 0, 0, 1, 1,
-0.88212, 0.02174897, -2.029238, 0, 0, 0, 1, 1,
-0.8816882, 0.04120735, -0.54934, 0, 0, 0, 1, 1,
-0.8813016, -0.2350965, -1.205346, 0, 0, 0, 1, 1,
-0.8769534, 0.7753218, 0.2781268, 0, 0, 0, 1, 1,
-0.8747897, 0.2034884, -2.369712, 0, 0, 0, 1, 1,
-0.8606634, 2.093954, 0.2060231, 0, 0, 0, 1, 1,
-0.8592895, 0.1458311, -1.917391, 1, 1, 1, 1, 1,
-0.8578326, -0.2683961, -2.179874, 1, 1, 1, 1, 1,
-0.8571057, -0.2137735, -2.410589, 1, 1, 1, 1, 1,
-0.8560157, -0.3648742, -2.195796, 1, 1, 1, 1, 1,
-0.8548447, 0.03492849, -0.6888967, 1, 1, 1, 1, 1,
-0.8470706, -1.129159, -1.754928, 1, 1, 1, 1, 1,
-0.8391635, -0.6097839, -2.22646, 1, 1, 1, 1, 1,
-0.8362758, 0.3397929, -1.664771, 1, 1, 1, 1, 1,
-0.8350143, 0.3404453, -1.984624, 1, 1, 1, 1, 1,
-0.8346027, 0.3732249, -1.590372, 1, 1, 1, 1, 1,
-0.8284736, 0.5409532, -1.506888, 1, 1, 1, 1, 1,
-0.8151803, -0.7188427, -1.456318, 1, 1, 1, 1, 1,
-0.8098212, 2.562523, 0.5470923, 1, 1, 1, 1, 1,
-0.804565, -0.5630111, -2.918077, 1, 1, 1, 1, 1,
-0.8022614, 0.1682999, -2.313555, 1, 1, 1, 1, 1,
-0.8003558, 0.6318238, 0.1012915, 0, 0, 1, 1, 1,
-0.7981907, 0.8024968, -0.7920621, 1, 0, 0, 1, 1,
-0.7948224, 0.6424784, -2.12339, 1, 0, 0, 1, 1,
-0.7894313, 0.2244891, -1.520417, 1, 0, 0, 1, 1,
-0.7893957, 1.764073, -1.677216, 1, 0, 0, 1, 1,
-0.7893642, -0.5117954, -0.9573029, 1, 0, 0, 1, 1,
-0.7872756, -0.6338764, -0.9630286, 0, 0, 0, 1, 1,
-0.7855835, 0.09779523, -4.379444, 0, 0, 0, 1, 1,
-0.785053, 0.9456075, 0.01816754, 0, 0, 0, 1, 1,
-0.7768776, 0.6486744, -0.6053886, 0, 0, 0, 1, 1,
-0.774936, -0.3968816, -1.492792, 0, 0, 0, 1, 1,
-0.7740475, 0.3609129, -0.5339302, 0, 0, 0, 1, 1,
-0.7738544, -1.061816, -1.715744, 0, 0, 0, 1, 1,
-0.7690275, -0.7305065, -1.393565, 1, 1, 1, 1, 1,
-0.76227, -0.179488, -0.4424929, 1, 1, 1, 1, 1,
-0.7598978, 1.216707, 0.9627434, 1, 1, 1, 1, 1,
-0.759221, 0.0773636, -1.382207, 1, 1, 1, 1, 1,
-0.7590439, 0.2727841, -1.292192, 1, 1, 1, 1, 1,
-0.7474828, 1.426674, -0.4585485, 1, 1, 1, 1, 1,
-0.7452844, -1.035381, -2.076057, 1, 1, 1, 1, 1,
-0.7419387, 0.3560039, -2.708809, 1, 1, 1, 1, 1,
-0.7414692, -0.05987388, -0.8805314, 1, 1, 1, 1, 1,
-0.7408042, -0.457507, -1.649593, 1, 1, 1, 1, 1,
-0.738435, -2.874651, -1.064867, 1, 1, 1, 1, 1,
-0.7352757, -0.40388, -2.993007, 1, 1, 1, 1, 1,
-0.7343828, -1.496503, -2.444447, 1, 1, 1, 1, 1,
-0.7335765, 0.1465411, -1.15369, 1, 1, 1, 1, 1,
-0.7316987, -0.6095417, -4.657483, 1, 1, 1, 1, 1,
-0.7303462, -0.7537531, -2.179125, 0, 0, 1, 1, 1,
-0.7181167, 1.374979, -1.778174, 1, 0, 0, 1, 1,
-0.7171709, -0.7892767, -1.339855, 1, 0, 0, 1, 1,
-0.7142981, 2.05009, -1.459752, 1, 0, 0, 1, 1,
-0.713681, 0.002107808, -2.365511, 1, 0, 0, 1, 1,
-0.7135441, -1.098061, -1.578849, 1, 0, 0, 1, 1,
-0.7040676, -0.9659767, -1.708369, 0, 0, 0, 1, 1,
-0.7016296, 0.02536326, -2.811756, 0, 0, 0, 1, 1,
-0.7012514, 0.3460699, -1.095571, 0, 0, 0, 1, 1,
-0.700957, 0.4821972, -0.09337197, 0, 0, 0, 1, 1,
-0.6999655, -0.3004174, -2.295141, 0, 0, 0, 1, 1,
-0.6968953, 0.4679027, -1.105272, 0, 0, 0, 1, 1,
-0.6963128, -0.8129048, -1.816728, 0, 0, 0, 1, 1,
-0.6961969, -0.8829522, -1.757708, 1, 1, 1, 1, 1,
-0.6950925, -0.7065516, -3.161638, 1, 1, 1, 1, 1,
-0.6949289, -1.021282, -2.968295, 1, 1, 1, 1, 1,
-0.6918607, -1.828114, -4.960264, 1, 1, 1, 1, 1,
-0.6873405, -0.2464148, -1.399748, 1, 1, 1, 1, 1,
-0.6841099, 0.2421112, -2.106009, 1, 1, 1, 1, 1,
-0.6832129, 0.7216425, -1.128647, 1, 1, 1, 1, 1,
-0.6772349, 2.460801, -0.4208716, 1, 1, 1, 1, 1,
-0.6731155, -0.8596885, -4.81352, 1, 1, 1, 1, 1,
-0.6695885, -0.9482917, -1.545984, 1, 1, 1, 1, 1,
-0.6668074, -0.6670343, -2.577896, 1, 1, 1, 1, 1,
-0.6551827, 1.222836, -0.4264686, 1, 1, 1, 1, 1,
-0.6545334, 0.2418272, -1.419805, 1, 1, 1, 1, 1,
-0.6526373, 0.772924, 0.8801947, 1, 1, 1, 1, 1,
-0.6497705, -1.517946, -1.638237, 1, 1, 1, 1, 1,
-0.649511, 0.7684465, -0.06789078, 0, 0, 1, 1, 1,
-0.6466304, -1.200508, -3.146864, 1, 0, 0, 1, 1,
-0.6430978, 1.443656, 0.9584914, 1, 0, 0, 1, 1,
-0.6430125, -0.4624358, -2.518623, 1, 0, 0, 1, 1,
-0.6411206, -1.602569, -2.618882, 1, 0, 0, 1, 1,
-0.6362734, -2.816757, -1.798778, 1, 0, 0, 1, 1,
-0.6236167, -0.5207334, -3.374804, 0, 0, 0, 1, 1,
-0.6231586, 1.73892, 0.3826462, 0, 0, 0, 1, 1,
-0.6183386, 1.341271, -0.7162516, 0, 0, 0, 1, 1,
-0.6177339, 0.1223919, -2.257577, 0, 0, 0, 1, 1,
-0.6139644, 0.5503711, -0.1426507, 0, 0, 0, 1, 1,
-0.6134983, 1.070185, -0.1108696, 0, 0, 0, 1, 1,
-0.6132444, -0.04555598, -1.566001, 0, 0, 0, 1, 1,
-0.6130114, -0.5402398, -1.698667, 1, 1, 1, 1, 1,
-0.6126401, 0.2439006, -2.454661, 1, 1, 1, 1, 1,
-0.6105846, 1.001527, 0.3870014, 1, 1, 1, 1, 1,
-0.610238, 0.1208902, -0.1938531, 1, 1, 1, 1, 1,
-0.6064705, 1.037257, 0.7130327, 1, 1, 1, 1, 1,
-0.6042429, 0.770681, 0.936798, 1, 1, 1, 1, 1,
-0.596077, -1.075124, -2.670651, 1, 1, 1, 1, 1,
-0.5943918, 2.294266, -0.07785755, 1, 1, 1, 1, 1,
-0.5935667, 0.8905808, -0.885924, 1, 1, 1, 1, 1,
-0.5909646, 0.1872264, -1.221376, 1, 1, 1, 1, 1,
-0.5905508, -0.3335057, -3.28385, 1, 1, 1, 1, 1,
-0.5876268, 0.2393803, -1.206253, 1, 1, 1, 1, 1,
-0.5814081, -0.632926, -1.865065, 1, 1, 1, 1, 1,
-0.5802052, -0.5798264, -1.420876, 1, 1, 1, 1, 1,
-0.5753686, 0.9272801, -0.2100901, 1, 1, 1, 1, 1,
-0.5720415, 1.660709, -1.45891, 0, 0, 1, 1, 1,
-0.5693312, 1.151586, -0.1656814, 1, 0, 0, 1, 1,
-0.5642073, -0.5085092, -1.26163, 1, 0, 0, 1, 1,
-0.5637607, 0.2056685, -0.337775, 1, 0, 0, 1, 1,
-0.5634978, 1.205735, -0.8152438, 1, 0, 0, 1, 1,
-0.5583792, -0.3462383, -1.311531, 1, 0, 0, 1, 1,
-0.5567954, 0.4111542, 0.5136187, 0, 0, 0, 1, 1,
-0.5529726, 0.8400815, -2.27076, 0, 0, 0, 1, 1,
-0.5515035, -1.085528, -2.387723, 0, 0, 0, 1, 1,
-0.5416996, -1.256429, -2.357927, 0, 0, 0, 1, 1,
-0.5369214, 1.072993, 1.226406, 0, 0, 0, 1, 1,
-0.5354707, 0.031489, -3.24677, 0, 0, 0, 1, 1,
-0.5350031, -0.2123268, -2.456097, 0, 0, 0, 1, 1,
-0.5329509, 0.2828896, -1.770898, 1, 1, 1, 1, 1,
-0.5315219, -0.7380448, -2.641146, 1, 1, 1, 1, 1,
-0.5233012, -1.545049, -3.493016, 1, 1, 1, 1, 1,
-0.5162673, 0.1900492, -0.177192, 1, 1, 1, 1, 1,
-0.507919, -0.8703258, -2.439631, 1, 1, 1, 1, 1,
-0.506746, -1.117653, -1.689722, 1, 1, 1, 1, 1,
-0.5066154, -0.7705632, -1.368277, 1, 1, 1, 1, 1,
-0.5063118, -0.128286, -2.362827, 1, 1, 1, 1, 1,
-0.505888, -0.8434109, -2.776828, 1, 1, 1, 1, 1,
-0.5009364, -0.2918867, -2.974709, 1, 1, 1, 1, 1,
-0.4999553, 0.8050646, -1.127647, 1, 1, 1, 1, 1,
-0.4954418, 0.2751786, -2.122409, 1, 1, 1, 1, 1,
-0.4831354, 0.9637496, -0.7906537, 1, 1, 1, 1, 1,
-0.4817535, 0.7414845, 0.8532543, 1, 1, 1, 1, 1,
-0.4815654, 0.8193505, -0.08964533, 1, 1, 1, 1, 1,
-0.4801986, 1.518715, 0.2571496, 0, 0, 1, 1, 1,
-0.4785582, -0.9660609, -1.055507, 1, 0, 0, 1, 1,
-0.4759087, 0.4343785, -0.9525244, 1, 0, 0, 1, 1,
-0.4755908, 1.458386, 0.7545739, 1, 0, 0, 1, 1,
-0.472647, 1.150558, 1.577428, 1, 0, 0, 1, 1,
-0.4721713, -0.3074947, -0.8612052, 1, 0, 0, 1, 1,
-0.4643385, -0.05674115, 0.1967889, 0, 0, 0, 1, 1,
-0.4577042, 0.2819691, 1.426188, 0, 0, 0, 1, 1,
-0.4569521, 1.485825, 0.6727753, 0, 0, 0, 1, 1,
-0.4549333, 1.389625, 0.1279891, 0, 0, 0, 1, 1,
-0.4547862, -0.2940137, -2.190674, 0, 0, 0, 1, 1,
-0.4505827, 1.029229, -0.6481648, 0, 0, 0, 1, 1,
-0.4473036, 0.7295905, -0.475905, 0, 0, 0, 1, 1,
-0.4462452, 0.108083, -1.986819, 1, 1, 1, 1, 1,
-0.4437879, 0.7541423, -0.2013143, 1, 1, 1, 1, 1,
-0.4435498, -1.614571, -3.872324, 1, 1, 1, 1, 1,
-0.4426366, -0.008944199, -3.456868, 1, 1, 1, 1, 1,
-0.4407191, -1.061357, -4.12984, 1, 1, 1, 1, 1,
-0.4399482, -0.7175918, -3.184465, 1, 1, 1, 1, 1,
-0.4363102, -0.1120085, -2.127398, 1, 1, 1, 1, 1,
-0.4357815, -0.8007837, -1.972042, 1, 1, 1, 1, 1,
-0.4227574, -0.3787858, -0.05501259, 1, 1, 1, 1, 1,
-0.4219633, -0.4903871, -2.275243, 1, 1, 1, 1, 1,
-0.4191178, -0.1853096, -1.892426, 1, 1, 1, 1, 1,
-0.4162198, 0.9622282, -1.282712, 1, 1, 1, 1, 1,
-0.4117848, 0.9404864, 1.250042, 1, 1, 1, 1, 1,
-0.4110074, 1.492266, 1.431528, 1, 1, 1, 1, 1,
-0.4102685, -0.04181848, -1.561749, 1, 1, 1, 1, 1,
-0.3998986, -0.5673267, -3.656572, 0, 0, 1, 1, 1,
-0.3993798, 1.202329, -0.7486117, 1, 0, 0, 1, 1,
-0.3989323, 1.272125, -0.1446419, 1, 0, 0, 1, 1,
-0.3985826, -0.7646295, -2.880824, 1, 0, 0, 1, 1,
-0.3962038, 1.944128, -0.6322451, 1, 0, 0, 1, 1,
-0.3961666, 1.06011, 0.3351883, 1, 0, 0, 1, 1,
-0.3960333, 0.03061878, -1.101747, 0, 0, 0, 1, 1,
-0.3945063, 0.58057, -0.4050763, 0, 0, 0, 1, 1,
-0.3934872, -0.008798148, -2.034525, 0, 0, 0, 1, 1,
-0.3911404, -0.03767186, -0.9085544, 0, 0, 0, 1, 1,
-0.39089, -0.8687045, -3.071179, 0, 0, 0, 1, 1,
-0.3901216, 1.938646, -2.074323, 0, 0, 0, 1, 1,
-0.3887663, -0.2068154, 0.344312, 0, 0, 0, 1, 1,
-0.388043, 0.1907019, -2.297619, 1, 1, 1, 1, 1,
-0.3837274, 1.012686, -1.160433, 1, 1, 1, 1, 1,
-0.3800654, -1.106618, -3.31275, 1, 1, 1, 1, 1,
-0.3787884, -0.8799039, -2.651787, 1, 1, 1, 1, 1,
-0.37853, 1.205313, 0.8635174, 1, 1, 1, 1, 1,
-0.3762982, -1.395416, -4.370135, 1, 1, 1, 1, 1,
-0.3722028, 0.4377205, -1.731756, 1, 1, 1, 1, 1,
-0.3710857, 0.3085709, -0.373094, 1, 1, 1, 1, 1,
-0.370915, -0.5205777, -2.444763, 1, 1, 1, 1, 1,
-0.3702201, 0.2500192, -2.764886, 1, 1, 1, 1, 1,
-0.3691924, -0.9291216, -2.566903, 1, 1, 1, 1, 1,
-0.3677437, -0.4957852, -2.876141, 1, 1, 1, 1, 1,
-0.3669082, -1.135273, -3.182186, 1, 1, 1, 1, 1,
-0.3618201, -2.211399, -3.798203, 1, 1, 1, 1, 1,
-0.3571838, -1.720159, -3.806368, 1, 1, 1, 1, 1,
-0.3564637, -1.521792, -2.655252, 0, 0, 1, 1, 1,
-0.3562511, 2.287083, -0.01850495, 1, 0, 0, 1, 1,
-0.3540967, 0.4768246, 0.7922335, 1, 0, 0, 1, 1,
-0.3522874, 0.9224709, -0.1950373, 1, 0, 0, 1, 1,
-0.3522195, 0.7413253, -1.309722, 1, 0, 0, 1, 1,
-0.3489476, -0.174633, -4.580833, 1, 0, 0, 1, 1,
-0.344949, -0.6572279, -3.218295, 0, 0, 0, 1, 1,
-0.3425162, 0.04792395, -1.286825, 0, 0, 0, 1, 1,
-0.3420535, -0.0462914, -0.6682384, 0, 0, 0, 1, 1,
-0.3396804, 0.6949102, -0.4483033, 0, 0, 0, 1, 1,
-0.3394911, -0.2983649, -1.441966, 0, 0, 0, 1, 1,
-0.3390962, -0.5399287, -1.507737, 0, 0, 0, 1, 1,
-0.3285459, 0.9551566, 0.9707745, 0, 0, 0, 1, 1,
-0.322975, -0.142971, -3.390577, 1, 1, 1, 1, 1,
-0.3226318, -0.7076058, -2.921597, 1, 1, 1, 1, 1,
-0.3177464, -0.02380924, 0.2972532, 1, 1, 1, 1, 1,
-0.3158647, 1.094687, -0.9571115, 1, 1, 1, 1, 1,
-0.3150866, -0.7288724, -3.412577, 1, 1, 1, 1, 1,
-0.3139123, 0.5578474, -1.030483, 1, 1, 1, 1, 1,
-0.3137699, -0.6284252, -3.84423, 1, 1, 1, 1, 1,
-0.3111514, -0.641091, -2.878069, 1, 1, 1, 1, 1,
-0.3103522, 0.5968926, -0.4690858, 1, 1, 1, 1, 1,
-0.2895382, -0.04543592, -2.972548, 1, 1, 1, 1, 1,
-0.2820571, -2.426194, -3.372379, 1, 1, 1, 1, 1,
-0.2768049, 1.978462, 0.8387493, 1, 1, 1, 1, 1,
-0.2721691, 1.117756, -0.6878924, 1, 1, 1, 1, 1,
-0.2685592, -0.2133593, -3.205231, 1, 1, 1, 1, 1,
-0.2661126, -0.1243809, -1.502826, 1, 1, 1, 1, 1,
-0.2621947, 0.6163603, -0.655636, 0, 0, 1, 1, 1,
-0.2590421, 0.5268077, 1.142972, 1, 0, 0, 1, 1,
-0.2542691, -0.6529921, -4.149358, 1, 0, 0, 1, 1,
-0.2538078, 0.4292453, 0.1031575, 1, 0, 0, 1, 1,
-0.2521202, -0.9154752, -3.574758, 1, 0, 0, 1, 1,
-0.2478838, 0.3089967, -0.09356555, 1, 0, 0, 1, 1,
-0.2457633, -0.4175865, -0.7963277, 0, 0, 0, 1, 1,
-0.2431539, 0.5715584, -0.0543251, 0, 0, 0, 1, 1,
-0.2429904, 0.6863394, -1.085639, 0, 0, 0, 1, 1,
-0.2375812, -1.055352, -4.060816, 0, 0, 0, 1, 1,
-0.2368061, -1.331993, -2.119195, 0, 0, 0, 1, 1,
-0.2239536, 1.210391, 0.3194125, 0, 0, 0, 1, 1,
-0.2212926, -0.4512083, -3.751382, 0, 0, 0, 1, 1,
-0.2203836, 1.751176, -1.051286, 1, 1, 1, 1, 1,
-0.218582, 0.1194281, -2.02125, 1, 1, 1, 1, 1,
-0.2159014, 0.3318424, -0.3510276, 1, 1, 1, 1, 1,
-0.2133377, 0.1644477, -1.193051, 1, 1, 1, 1, 1,
-0.2132191, -0.4424684, -2.261151, 1, 1, 1, 1, 1,
-0.2127383, 0.6483663, -0.6423303, 1, 1, 1, 1, 1,
-0.2099093, 0.5849309, -2.550886, 1, 1, 1, 1, 1,
-0.2084959, 1.337436, -0.6352175, 1, 1, 1, 1, 1,
-0.2084096, -2.099433, -2.051038, 1, 1, 1, 1, 1,
-0.2071929, -0.7125734, -2.786594, 1, 1, 1, 1, 1,
-0.2067006, -0.1783841, -1.854453, 1, 1, 1, 1, 1,
-0.2061263, -0.6166303, -5.251097, 1, 1, 1, 1, 1,
-0.2048166, -0.6051416, -2.682896, 1, 1, 1, 1, 1,
-0.2038753, 0.8086656, 0.4463287, 1, 1, 1, 1, 1,
-0.2003438, 1.122975, 1.404644, 1, 1, 1, 1, 1,
-0.197043, -0.446539, -3.65072, 0, 0, 1, 1, 1,
-0.1946991, 0.4853389, 0.5118873, 1, 0, 0, 1, 1,
-0.1918108, 0.01333234, -2.74495, 1, 0, 0, 1, 1,
-0.1900135, -1.243197, -2.325693, 1, 0, 0, 1, 1,
-0.1843424, 0.7777791, 0.09867464, 1, 0, 0, 1, 1,
-0.178932, 0.7408486, -1.364837, 1, 0, 0, 1, 1,
-0.1706168, 0.3295677, -1.140022, 0, 0, 0, 1, 1,
-0.1598062, 0.845427, -1.645144, 0, 0, 0, 1, 1,
-0.1583105, -0.6451036, -4.324378, 0, 0, 0, 1, 1,
-0.1574695, -0.8289782, -3.056787, 0, 0, 0, 1, 1,
-0.1558061, 1.673094, -0.7261041, 0, 0, 0, 1, 1,
-0.1545552, -0.8245001, -4.083094, 0, 0, 0, 1, 1,
-0.1543429, 0.1997646, -0.4323907, 0, 0, 0, 1, 1,
-0.151475, -0.8772097, -1.037661, 1, 1, 1, 1, 1,
-0.1494229, -0.9848804, -4.849888, 1, 1, 1, 1, 1,
-0.1462044, 0.128279, -1.362002, 1, 1, 1, 1, 1,
-0.1459931, 0.2016807, -0.6480091, 1, 1, 1, 1, 1,
-0.1457199, 0.9141934, 0.3549701, 1, 1, 1, 1, 1,
-0.142415, -0.5360851, -1.669335, 1, 1, 1, 1, 1,
-0.1420146, 0.5750342, -1.485693, 1, 1, 1, 1, 1,
-0.1414723, 0.256669, 0.3219554, 1, 1, 1, 1, 1,
-0.1395099, -0.5191234, -2.336046, 1, 1, 1, 1, 1,
-0.137346, 0.5728222, -1.652847, 1, 1, 1, 1, 1,
-0.1373317, -0.6217739, -1.950621, 1, 1, 1, 1, 1,
-0.1371909, 1.094083, -1.00373, 1, 1, 1, 1, 1,
-0.130584, 0.1519106, -1.062961, 1, 1, 1, 1, 1,
-0.1297789, -0.2858017, -2.179812, 1, 1, 1, 1, 1,
-0.1296671, -1.386974, -2.913729, 1, 1, 1, 1, 1,
-0.1283935, 1.802572, -0.1705038, 0, 0, 1, 1, 1,
-0.126167, 1.193802, 0.5884924, 1, 0, 0, 1, 1,
-0.1229117, -2.096033, -4.397987, 1, 0, 0, 1, 1,
-0.1206739, 0.03607059, -1.003984, 1, 0, 0, 1, 1,
-0.1162831, 0.1939408, -0.5956334, 1, 0, 0, 1, 1,
-0.110813, -1.442175, -0.2007692, 1, 0, 0, 1, 1,
-0.1069278, -0.04315102, -0.905215, 0, 0, 0, 1, 1,
-0.08891412, -1.343879, -3.997057, 0, 0, 0, 1, 1,
-0.08818706, 0.8102267, -0.483128, 0, 0, 0, 1, 1,
-0.0831557, -1.34934, -1.455357, 0, 0, 0, 1, 1,
-0.08225556, 0.3243959, -1.876135, 0, 0, 0, 1, 1,
-0.08070987, -0.3555238, -1.384763, 0, 0, 0, 1, 1,
-0.07901375, -1.006814, -2.63817, 0, 0, 0, 1, 1,
-0.07852156, -0.9504535, -1.760507, 1, 1, 1, 1, 1,
-0.07841451, -0.2940762, -3.023412, 1, 1, 1, 1, 1,
-0.07724924, -1.182538, -4.16328, 1, 1, 1, 1, 1,
-0.0755313, -0.3060085, -2.13026, 1, 1, 1, 1, 1,
-0.07418085, 0.6792864, -1.585399, 1, 1, 1, 1, 1,
-0.07210989, 0.4381917, -0.9646105, 1, 1, 1, 1, 1,
-0.06907701, -1.159394, -1.414777, 1, 1, 1, 1, 1,
-0.06825914, -0.1122516, -4.151574, 1, 1, 1, 1, 1,
-0.06485969, -0.3339037, -3.717898, 1, 1, 1, 1, 1,
-0.0600479, -1.402725, -3.427814, 1, 1, 1, 1, 1,
-0.0558724, 0.5755436, 0.6765877, 1, 1, 1, 1, 1,
-0.04974496, -1.1868, -2.738928, 1, 1, 1, 1, 1,
-0.04962588, -0.4932208, -2.877147, 1, 1, 1, 1, 1,
-0.04638411, 0.06596996, -2.708797, 1, 1, 1, 1, 1,
-0.04414934, -0.6646566, -4.533077, 1, 1, 1, 1, 1,
-0.04383751, 0.4077921, -0.9835913, 0, 0, 1, 1, 1,
-0.03679267, -0.3282754, -4.441073, 1, 0, 0, 1, 1,
-0.03677174, 1.073035, -0.2857464, 1, 0, 0, 1, 1,
-0.03033861, 0.2129828, -0.7417753, 1, 0, 0, 1, 1,
-0.02826172, -2.216588, -4.706622, 1, 0, 0, 1, 1,
-0.02562097, -1.212512, -2.696437, 1, 0, 0, 1, 1,
-0.0217349, -2.350485, -3.425536, 0, 0, 0, 1, 1,
-0.01769586, 3.31193, 1.76855, 0, 0, 0, 1, 1,
-0.01212995, -0.1841488, -3.524513, 0, 0, 0, 1, 1,
-0.004440682, 0.8172632, -0.542555, 0, 0, 0, 1, 1,
-0.003667529, 2.066822, -0.7285756, 0, 0, 0, 1, 1,
-0.002540564, -0.1568676, -2.66474, 0, 0, 0, 1, 1,
0.0007403085, 0.6768575, 0.9189317, 0, 0, 0, 1, 1,
0.004426573, -1.474515, 4.492857, 1, 1, 1, 1, 1,
0.005733676, -1.18988, 2.50615, 1, 1, 1, 1, 1,
0.01103819, 0.2317989, -0.8485323, 1, 1, 1, 1, 1,
0.01238219, -0.4083772, 1.891387, 1, 1, 1, 1, 1,
0.01747181, 1.463834, 0.07438783, 1, 1, 1, 1, 1,
0.01826354, 2.193249, -1.457859, 1, 1, 1, 1, 1,
0.01834177, -0.7437193, 2.051593, 1, 1, 1, 1, 1,
0.01929069, -0.5183486, 2.857531, 1, 1, 1, 1, 1,
0.02759616, -0.6522036, 2.560504, 1, 1, 1, 1, 1,
0.02948592, 0.05498105, 0.7845123, 1, 1, 1, 1, 1,
0.03046189, 1.744628, 1.114164, 1, 1, 1, 1, 1,
0.03691067, 0.4919036, 0.0372457, 1, 1, 1, 1, 1,
0.03791285, -1.052664, 1.741709, 1, 1, 1, 1, 1,
0.03875555, 1.687435, 0.2609401, 1, 1, 1, 1, 1,
0.05529562, -0.1007267, 3.369697, 1, 1, 1, 1, 1,
0.05713632, -0.4932479, 2.29736, 0, 0, 1, 1, 1,
0.05738708, 1.679518, 0.4161799, 1, 0, 0, 1, 1,
0.06271207, 0.2340849, 1.103291, 1, 0, 0, 1, 1,
0.06417407, -0.7790107, 3.482994, 1, 0, 0, 1, 1,
0.06614629, -1.130102, 2.67481, 1, 0, 0, 1, 1,
0.06710485, 0.825827, -0.6241134, 1, 0, 0, 1, 1,
0.0682249, 0.1314768, 0.06344435, 0, 0, 0, 1, 1,
0.06869397, -0.2916141, 2.617908, 0, 0, 0, 1, 1,
0.07122979, -1.03343, 2.898135, 0, 0, 0, 1, 1,
0.07692436, 0.4288034, 0.6225196, 0, 0, 0, 1, 1,
0.07703858, 0.2437152, 0.7110392, 0, 0, 0, 1, 1,
0.08166856, -0.8296446, 4.010451, 0, 0, 0, 1, 1,
0.08373498, 0.2253683, -0.2433005, 0, 0, 0, 1, 1,
0.08790217, -0.8343723, 3.727183, 1, 1, 1, 1, 1,
0.08972592, 0.06107144, -0.3933555, 1, 1, 1, 1, 1,
0.09168853, 0.2890329, -0.2475189, 1, 1, 1, 1, 1,
0.09734698, 1.499931, -0.6458309, 1, 1, 1, 1, 1,
0.100097, 0.3612592, -1.424635, 1, 1, 1, 1, 1,
0.1007965, 1.193266, -0.5388804, 1, 1, 1, 1, 1,
0.1010366, 0.1729081, 2.185557, 1, 1, 1, 1, 1,
0.1011253, 1.963045, 1.259335, 1, 1, 1, 1, 1,
0.105015, 0.2490694, -0.05303898, 1, 1, 1, 1, 1,
0.1063979, -0.1187767, 2.290731, 1, 1, 1, 1, 1,
0.1155761, 2.201586, 0.252886, 1, 1, 1, 1, 1,
0.1167664, 0.520401, 0.060231, 1, 1, 1, 1, 1,
0.1185962, -0.6163786, 1.83528, 1, 1, 1, 1, 1,
0.1220639, 0.2777138, -0.5531238, 1, 1, 1, 1, 1,
0.1257506, 0.7857265, 2.310232, 1, 1, 1, 1, 1,
0.1269101, -0.4962928, 4.426432, 0, 0, 1, 1, 1,
0.1351565, -0.07178952, 2.400095, 1, 0, 0, 1, 1,
0.1361071, -0.5442246, 3.768716, 1, 0, 0, 1, 1,
0.1388216, -1.214586, 3.973293, 1, 0, 0, 1, 1,
0.1393576, 2.116513, 0.9101917, 1, 0, 0, 1, 1,
0.1411359, 0.2170067, 3.173406, 1, 0, 0, 1, 1,
0.1524824, 0.2207807, 0.7854088, 0, 0, 0, 1, 1,
0.1574764, -0.7921008, 3.793881, 0, 0, 0, 1, 1,
0.1608152, -1.088539, 1.268656, 0, 0, 0, 1, 1,
0.1660955, -0.9685603, 2.999987, 0, 0, 0, 1, 1,
0.1665924, -1.1816, 2.590913, 0, 0, 0, 1, 1,
0.166614, 0.4077034, 1.455761, 0, 0, 0, 1, 1,
0.1727277, 0.3640394, 1.39367, 0, 0, 0, 1, 1,
0.1740057, 0.3300664, 2.147177, 1, 1, 1, 1, 1,
0.1744037, -0.2638794, 2.483295, 1, 1, 1, 1, 1,
0.1752327, 0.7242276, 0.829019, 1, 1, 1, 1, 1,
0.175716, 0.5768899, -0.8352968, 1, 1, 1, 1, 1,
0.1768613, -0.1788854, 4.298907, 1, 1, 1, 1, 1,
0.1776432, 1.512265, -0.1915178, 1, 1, 1, 1, 1,
0.1822027, -0.0225045, 1.041028, 1, 1, 1, 1, 1,
0.1835684, -1.316259, 2.637728, 1, 1, 1, 1, 1,
0.1863196, -0.4778987, 2.501532, 1, 1, 1, 1, 1,
0.1915357, 0.8928063, 0.1753903, 1, 1, 1, 1, 1,
0.2004022, -0.3473725, 2.507354, 1, 1, 1, 1, 1,
0.2013297, 2.39333, -0.8427868, 1, 1, 1, 1, 1,
0.2019629, -0.7540714, 4.162558, 1, 1, 1, 1, 1,
0.2036467, 0.01780904, 2.00557, 1, 1, 1, 1, 1,
0.2068518, 0.9804693, -0.8130878, 1, 1, 1, 1, 1,
0.2089407, -0.8177078, 3.634647, 0, 0, 1, 1, 1,
0.2100804, 3.021144, -0.2963733, 1, 0, 0, 1, 1,
0.211189, -0.111879, 2.159145, 1, 0, 0, 1, 1,
0.2139102, -1.78077, 0.5471739, 1, 0, 0, 1, 1,
0.2147785, -1.506261, 2.081579, 1, 0, 0, 1, 1,
0.2162116, 2.258689, -2.004532, 1, 0, 0, 1, 1,
0.2191553, 1.514657, -0.04626283, 0, 0, 0, 1, 1,
0.2222361, -0.2434683, 0.9422408, 0, 0, 0, 1, 1,
0.2223985, -2.123214, 2.316881, 0, 0, 0, 1, 1,
0.2274652, 1.239843, -0.5586036, 0, 0, 0, 1, 1,
0.2299064, 0.1578805, 2.166397, 0, 0, 0, 1, 1,
0.2301213, -1.14222, 1.554102, 0, 0, 0, 1, 1,
0.2312711, -0.8749751, 2.428384, 0, 0, 0, 1, 1,
0.2314234, 1.037169, -0.5377595, 1, 1, 1, 1, 1,
0.2321372, 0.6808485, 1.630945, 1, 1, 1, 1, 1,
0.2322106, -0.5253258, 1.639257, 1, 1, 1, 1, 1,
0.235788, -0.90544, 4.116095, 1, 1, 1, 1, 1,
0.2401138, -0.60553, 3.082657, 1, 1, 1, 1, 1,
0.2407211, 0.08434898, 2.655975, 1, 1, 1, 1, 1,
0.2474128, -1.45674, 1.881548, 1, 1, 1, 1, 1,
0.2531318, 1.564504, 1.018547, 1, 1, 1, 1, 1,
0.2538401, -0.1152752, 4.582859, 1, 1, 1, 1, 1,
0.2603486, 1.021025, 0.313795, 1, 1, 1, 1, 1,
0.261179, 1.122656, -0.6944787, 1, 1, 1, 1, 1,
0.2619247, -1.037349, 3.131657, 1, 1, 1, 1, 1,
0.2635505, 0.4871734, 0.2693425, 1, 1, 1, 1, 1,
0.2635873, -0.5033984, 2.514225, 1, 1, 1, 1, 1,
0.2696489, -0.8161063, 4.710731, 1, 1, 1, 1, 1,
0.269717, 0.3880203, 0.2278566, 0, 0, 1, 1, 1,
0.2719269, 0.4436739, -0.9919226, 1, 0, 0, 1, 1,
0.2724265, -0.4403217, 2.607997, 1, 0, 0, 1, 1,
0.2741196, 1.179227, 1.282999, 1, 0, 0, 1, 1,
0.2741347, -0.5089082, 1.737643, 1, 0, 0, 1, 1,
0.2758898, -0.219634, 2.886361, 1, 0, 0, 1, 1,
0.2820095, 0.2829401, 1.765076, 0, 0, 0, 1, 1,
0.2861121, -0.4484335, 3.175591, 0, 0, 0, 1, 1,
0.2877328, -0.3928332, 2.064207, 0, 0, 0, 1, 1,
0.2949474, -1.248526, 3.951121, 0, 0, 0, 1, 1,
0.2999958, -0.9921491, 2.847925, 0, 0, 0, 1, 1,
0.3034758, 0.7099237, 1.007035, 0, 0, 0, 1, 1,
0.3040746, 0.4855014, 0.07852892, 0, 0, 0, 1, 1,
0.3053638, 2.431386, -0.9518408, 1, 1, 1, 1, 1,
0.3092737, 0.8795053, 1.469621, 1, 1, 1, 1, 1,
0.3096389, -1.970247, 0.230079, 1, 1, 1, 1, 1,
0.3109562, -1.115579, 2.224441, 1, 1, 1, 1, 1,
0.3111504, -0.9210358, 3.183157, 1, 1, 1, 1, 1,
0.3130336, 0.1873391, 2.679289, 1, 1, 1, 1, 1,
0.3160052, -0.774928, 4.48914, 1, 1, 1, 1, 1,
0.3177334, 0.9555491, -0.8446383, 1, 1, 1, 1, 1,
0.3194609, 0.2916137, 1.027689, 1, 1, 1, 1, 1,
0.3224353, -0.4849675, 4.304422, 1, 1, 1, 1, 1,
0.3227225, 0.2832676, 1.532248, 1, 1, 1, 1, 1,
0.3245338, -0.2322036, 1.572998, 1, 1, 1, 1, 1,
0.3283192, 0.726829, 0.444716, 1, 1, 1, 1, 1,
0.329248, 0.9802339, -0.6159369, 1, 1, 1, 1, 1,
0.3317586, 1.318075, 1.135675, 1, 1, 1, 1, 1,
0.3363787, 1.036235, 0.2340103, 0, 0, 1, 1, 1,
0.3375725, -0.1675824, 1.564658, 1, 0, 0, 1, 1,
0.3472459, 1.77109, 0.1958264, 1, 0, 0, 1, 1,
0.3480493, 0.5515105, 0.7039014, 1, 0, 0, 1, 1,
0.3483352, 0.1466562, 0.5803833, 1, 0, 0, 1, 1,
0.3507635, -0.5808016, 1.74007, 1, 0, 0, 1, 1,
0.3538371, 0.1395859, 1.943408, 0, 0, 0, 1, 1,
0.3566589, 0.02676912, 1.443148, 0, 0, 0, 1, 1,
0.3569095, 0.8294626, 1.272183, 0, 0, 0, 1, 1,
0.3624117, 0.7033424, -1.105011, 0, 0, 0, 1, 1,
0.3669108, 1.855088, 1.844988, 0, 0, 0, 1, 1,
0.3713666, 1.275324, 1.798257, 0, 0, 0, 1, 1,
0.3726242, -1.24643, 1.341932, 0, 0, 0, 1, 1,
0.3752549, 0.4734923, 1.203292, 1, 1, 1, 1, 1,
0.3768905, 1.279999, 0.6239675, 1, 1, 1, 1, 1,
0.3820916, -1.167711, 5.125286, 1, 1, 1, 1, 1,
0.3833968, -0.7322261, 3.141473, 1, 1, 1, 1, 1,
0.3838383, -1.656571, 2.857223, 1, 1, 1, 1, 1,
0.3848483, -1.003727, 2.379138, 1, 1, 1, 1, 1,
0.3873344, -1.150187, 2.56577, 1, 1, 1, 1, 1,
0.3949186, -0.1104425, 0.8080512, 1, 1, 1, 1, 1,
0.4002139, -1.230947, 3.678165, 1, 1, 1, 1, 1,
0.4003816, 0.8406197, -1.713831, 1, 1, 1, 1, 1,
0.4008409, -1.177554, 4.682827, 1, 1, 1, 1, 1,
0.4012114, 0.2367534, 0.5446863, 1, 1, 1, 1, 1,
0.4047138, -0.8172737, 3.285819, 1, 1, 1, 1, 1,
0.4065959, -0.04319629, 3.088017, 1, 1, 1, 1, 1,
0.4081708, 0.4119786, 0.3844756, 1, 1, 1, 1, 1,
0.4088067, 1.55548, -0.1780608, 0, 0, 1, 1, 1,
0.4105135, 0.2843676, 1.901779, 1, 0, 0, 1, 1,
0.4138076, 0.9854708, -2.11764, 1, 0, 0, 1, 1,
0.4170955, 1.232499, 0.4659551, 1, 0, 0, 1, 1,
0.420693, -0.7830007, 3.051431, 1, 0, 0, 1, 1,
0.4213394, -1.665622, 3.822673, 1, 0, 0, 1, 1,
0.422976, 0.2827632, 1.135157, 0, 0, 0, 1, 1,
0.4271399, 1.609168, -0.8873711, 0, 0, 0, 1, 1,
0.4282199, -1.141587, 2.092526, 0, 0, 0, 1, 1,
0.4307778, -0.4389284, 4.09398, 0, 0, 0, 1, 1,
0.4315215, -0.4339164, 2.84222, 0, 0, 0, 1, 1,
0.4378859, 0.618364, -0.3231839, 0, 0, 0, 1, 1,
0.43874, -0.5204857, 1.318122, 0, 0, 0, 1, 1,
0.4408139, 1.237592, 0.8672007, 1, 1, 1, 1, 1,
0.4414694, 0.2210892, 0.3999628, 1, 1, 1, 1, 1,
0.4420308, -0.005229712, -0.9147084, 1, 1, 1, 1, 1,
0.4484762, -0.1495215, 2.049755, 1, 1, 1, 1, 1,
0.4494459, 0.3152735, 0.1778749, 1, 1, 1, 1, 1,
0.451243, -1.214742, 3.048872, 1, 1, 1, 1, 1,
0.4523045, 0.4307919, 2.180915, 1, 1, 1, 1, 1,
0.4577479, 1.12648, 1.794755, 1, 1, 1, 1, 1,
0.4599954, -0.1568366, 1.62446, 1, 1, 1, 1, 1,
0.465246, -0.7401049, 2.094534, 1, 1, 1, 1, 1,
0.465614, -0.02411184, 2.375688, 1, 1, 1, 1, 1,
0.4691925, -0.5439276, 3.368772, 1, 1, 1, 1, 1,
0.4714118, -1.525912, 2.24202, 1, 1, 1, 1, 1,
0.4742953, 1.007046, 0.7451718, 1, 1, 1, 1, 1,
0.4752288, 0.6663064, -2.055, 1, 1, 1, 1, 1,
0.4754017, -1.708451, 2.657295, 0, 0, 1, 1, 1,
0.4834507, -1.156805, 1.869214, 1, 0, 0, 1, 1,
0.4895755, 0.8096913, -0.3930591, 1, 0, 0, 1, 1,
0.4968554, -0.09116536, 2.169797, 1, 0, 0, 1, 1,
0.5041429, -1.17778, 4.458102, 1, 0, 0, 1, 1,
0.505842, -0.8802346, 3.098011, 1, 0, 0, 1, 1,
0.5060837, -0.9171426, 3.242156, 0, 0, 0, 1, 1,
0.5123624, 0.6348913, 1.035794, 0, 0, 0, 1, 1,
0.5129938, 2.134201, 1.138947, 0, 0, 0, 1, 1,
0.5154935, -0.5761507, 2.365886, 0, 0, 0, 1, 1,
0.5176266, 0.7662761, -0.208794, 0, 0, 0, 1, 1,
0.5178025, 0.5742877, 1.884522, 0, 0, 0, 1, 1,
0.5182914, 1.642246, -0.3007716, 0, 0, 0, 1, 1,
0.5204435, -1.377523, 3.046116, 1, 1, 1, 1, 1,
0.5228798, -0.414133, 3.424464, 1, 1, 1, 1, 1,
0.5231409, -0.8033212, 3.762666, 1, 1, 1, 1, 1,
0.5238814, 0.938821, 1.023874, 1, 1, 1, 1, 1,
0.5240609, 0.0826169, 1.461608, 1, 1, 1, 1, 1,
0.525017, 0.0567485, 0.4249522, 1, 1, 1, 1, 1,
0.5282374, 0.2340959, 0.6972548, 1, 1, 1, 1, 1,
0.5292936, 2.159224, 0.7591493, 1, 1, 1, 1, 1,
0.531738, -0.8525363, 4.950216, 1, 1, 1, 1, 1,
0.5386653, 0.7404978, 0.9925705, 1, 1, 1, 1, 1,
0.5442632, -0.7572207, 4.241143, 1, 1, 1, 1, 1,
0.5464281, -0.05033601, 0.2384948, 1, 1, 1, 1, 1,
0.5466841, 0.1980362, 0.9970636, 1, 1, 1, 1, 1,
0.5476035, 0.003951684, 1.146988, 1, 1, 1, 1, 1,
0.5507503, 1.128557, 1.036396, 1, 1, 1, 1, 1,
0.5549303, 0.3700638, 1.181378, 0, 0, 1, 1, 1,
0.5555745, 0.1394636, 4.568262, 1, 0, 0, 1, 1,
0.5557625, 1.632803, 0.1559465, 1, 0, 0, 1, 1,
0.5565509, 0.5177687, 2.152608, 1, 0, 0, 1, 1,
0.5567132, -0.2014033, 3.811043, 1, 0, 0, 1, 1,
0.5580704, 0.3009834, -0.4294503, 1, 0, 0, 1, 1,
0.5612039, -0.6158473, 2.826355, 0, 0, 0, 1, 1,
0.5616068, 0.4081834, 1.547234, 0, 0, 0, 1, 1,
0.563443, 0.1787744, 2.704468, 0, 0, 0, 1, 1,
0.5660045, -0.1083079, 1.67758, 0, 0, 0, 1, 1,
0.5737394, -0.4291964, 1.783769, 0, 0, 0, 1, 1,
0.5781271, -0.2175842, 2.406895, 0, 0, 0, 1, 1,
0.5817972, 0.5243402, 0.7059714, 0, 0, 0, 1, 1,
0.5911748, -1.216034, 2.838135, 1, 1, 1, 1, 1,
0.5920619, 0.1888539, 1.61949, 1, 1, 1, 1, 1,
0.5954666, -1.659907, 3.095007, 1, 1, 1, 1, 1,
0.6023557, -0.1902912, 1.139597, 1, 1, 1, 1, 1,
0.6038396, -0.5656556, 2.826944, 1, 1, 1, 1, 1,
0.6109457, -0.6413413, 1.560165, 1, 1, 1, 1, 1,
0.6127302, -0.2042177, 1.071965, 1, 1, 1, 1, 1,
0.6129798, -1.245681, 4.169183, 1, 1, 1, 1, 1,
0.6130412, 1.198641, 1.224087, 1, 1, 1, 1, 1,
0.6162847, -0.3637689, 2.220105, 1, 1, 1, 1, 1,
0.6177842, -2.053266, 5.020745, 1, 1, 1, 1, 1,
0.625668, 0.3972239, -0.3161672, 1, 1, 1, 1, 1,
0.6265098, -0.1060836, 0.4873751, 1, 1, 1, 1, 1,
0.632097, -0.8398678, 3.221555, 1, 1, 1, 1, 1,
0.6349811, -1.517054, 2.925222, 1, 1, 1, 1, 1,
0.6357712, -0.8294435, 3.164782, 0, 0, 1, 1, 1,
0.6395929, -1.036496, 2.388504, 1, 0, 0, 1, 1,
0.64044, -0.07662578, 3.392356, 1, 0, 0, 1, 1,
0.6423603, 0.2768221, 0.0211063, 1, 0, 0, 1, 1,
0.6440638, 0.9198619, 2.183894, 1, 0, 0, 1, 1,
0.6504474, 0.3504719, 1.641642, 1, 0, 0, 1, 1,
0.6510672, -1.455318, 2.228375, 0, 0, 0, 1, 1,
0.6610689, -0.138164, 1.699681, 0, 0, 0, 1, 1,
0.6618169, -0.4833987, 1.154749, 0, 0, 0, 1, 1,
0.6657519, -0.6819088, 3.030232, 0, 0, 0, 1, 1,
0.6728253, 0.1242491, 0.843203, 0, 0, 0, 1, 1,
0.6765174, -0.7934924, 2.046355, 0, 0, 0, 1, 1,
0.6774372, 0.1631537, 1.814928, 0, 0, 0, 1, 1,
0.6782153, 0.08774506, 0.5941642, 1, 1, 1, 1, 1,
0.6796646, -0.6571931, 2.431883, 1, 1, 1, 1, 1,
0.6837077, -1.709074, 1.139268, 1, 1, 1, 1, 1,
0.6846928, -0.192148, 2.806864, 1, 1, 1, 1, 1,
0.691504, -2.160665, 3.084471, 1, 1, 1, 1, 1,
0.6967278, -1.192503, 2.976389, 1, 1, 1, 1, 1,
0.6984637, 0.3292469, 0.3881353, 1, 1, 1, 1, 1,
0.6994924, -1.145284, 2.329564, 1, 1, 1, 1, 1,
0.7031825, 0.4719741, 0.6991908, 1, 1, 1, 1, 1,
0.7046428, 0.5814649, 2.446962, 1, 1, 1, 1, 1,
0.7088206, -0.7681132, 3.072027, 1, 1, 1, 1, 1,
0.7091978, 1.144094, 2.12626, 1, 1, 1, 1, 1,
0.7103684, -0.4737704, 1.410904, 1, 1, 1, 1, 1,
0.7119594, 0.09236587, 1.57233, 1, 1, 1, 1, 1,
0.7157128, -0.4088888, 1.703876, 1, 1, 1, 1, 1,
0.7177079, -0.1144364, 1.509382, 0, 0, 1, 1, 1,
0.7182549, 0.00866155, 3.381071, 1, 0, 0, 1, 1,
0.7188656, 0.04784233, -0.6749781, 1, 0, 0, 1, 1,
0.7241846, -1.079345, 2.087282, 1, 0, 0, 1, 1,
0.7243827, -0.947726, 1.273111, 1, 0, 0, 1, 1,
0.7277472, -1.441014, 3.635332, 1, 0, 0, 1, 1,
0.7281714, 0.3356269, 1.41667, 0, 0, 0, 1, 1,
0.7287947, -0.06209486, 2.499248, 0, 0, 0, 1, 1,
0.7340846, -0.1481414, -0.1465526, 0, 0, 0, 1, 1,
0.7374135, -0.766387, 0.8914742, 0, 0, 0, 1, 1,
0.741245, -1.196104, 2.229993, 0, 0, 0, 1, 1,
0.7500035, -0.7127724, 0.9092985, 0, 0, 0, 1, 1,
0.7531484, 0.7814486, 1.301547, 0, 0, 0, 1, 1,
0.7577763, 0.7212822, 0.7958393, 1, 1, 1, 1, 1,
0.7591447, -1.310777, 3.045737, 1, 1, 1, 1, 1,
0.7680755, -0.5187139, 2.894872, 1, 1, 1, 1, 1,
0.7700235, 1.593547, 0.8731046, 1, 1, 1, 1, 1,
0.7704543, -0.1898676, 2.899686, 1, 1, 1, 1, 1,
0.7846805, -0.3334067, 0.5373679, 1, 1, 1, 1, 1,
0.7926095, -0.706744, 2.045389, 1, 1, 1, 1, 1,
0.7931821, 0.5861837, -0.1236636, 1, 1, 1, 1, 1,
0.7960862, -0.4704393, 1.384604, 1, 1, 1, 1, 1,
0.8005924, 0.212301, 0.5060179, 1, 1, 1, 1, 1,
0.8041159, 1.955612, 1.881317, 1, 1, 1, 1, 1,
0.8080639, -0.2087379, 1.179068, 1, 1, 1, 1, 1,
0.8091293, -0.07333368, -0.1901063, 1, 1, 1, 1, 1,
0.809322, -0.2279166, 3.162589, 1, 1, 1, 1, 1,
0.8152283, 0.001952906, 3.370767, 1, 1, 1, 1, 1,
0.8193356, 0.577098, 0.852918, 0, 0, 1, 1, 1,
0.8193651, 2.098408, 1.679566, 1, 0, 0, 1, 1,
0.8234832, -0.8486539, 2.45048, 1, 0, 0, 1, 1,
0.8327129, -0.1557092, 1.801366, 1, 0, 0, 1, 1,
0.8359738, 1.937717, 0.7760646, 1, 0, 0, 1, 1,
0.838642, 0.7785276, 0.1428925, 1, 0, 0, 1, 1,
0.8391638, 0.08404341, 2.70076, 0, 0, 0, 1, 1,
0.8413336, -1.053464, 3.597627, 0, 0, 0, 1, 1,
0.8414201, -2.155492, 2.68021, 0, 0, 0, 1, 1,
0.8434133, 0.8521205, 0.05693465, 0, 0, 0, 1, 1,
0.8474914, 1.374374, 0.7864026, 0, 0, 0, 1, 1,
0.8477578, -0.2985374, 1.023759, 0, 0, 0, 1, 1,
0.8578632, -1.685665, 1.313071, 0, 0, 0, 1, 1,
0.8582198, 0.2182631, 0.9375355, 1, 1, 1, 1, 1,
0.8599333, -0.2122034, 1.524218, 1, 1, 1, 1, 1,
0.860209, -1.760345, 5.828574, 1, 1, 1, 1, 1,
0.8639581, -1.447921, -0.2298759, 1, 1, 1, 1, 1,
0.8671708, -0.4918302, 1.846848, 1, 1, 1, 1, 1,
0.870564, -0.5114835, 1.897631, 1, 1, 1, 1, 1,
0.8752416, 0.9828865, 0.3004507, 1, 1, 1, 1, 1,
0.8827965, 0.1658874, 2.023897, 1, 1, 1, 1, 1,
0.8858482, 0.6311972, 0.04767941, 1, 1, 1, 1, 1,
0.888509, 1.639659, -0.784395, 1, 1, 1, 1, 1,
0.8925244, 0.7525624, -0.4784516, 1, 1, 1, 1, 1,
0.9140621, -0.09503264, -0.923396, 1, 1, 1, 1, 1,
0.9187657, 2.061859, 0.3004014, 1, 1, 1, 1, 1,
0.9240437, 1.065051, 1.998258, 1, 1, 1, 1, 1,
0.9245653, -2.263956, 1.004145, 1, 1, 1, 1, 1,
0.9262753, 0.2805899, 0.6242678, 0, 0, 1, 1, 1,
0.9293293, -0.4336811, 1.857486, 1, 0, 0, 1, 1,
0.9332399, -0.4277847, 2.940506, 1, 0, 0, 1, 1,
0.9366463, -0.4226335, 0.0397661, 1, 0, 0, 1, 1,
0.9371635, -0.2462549, 2.321405, 1, 0, 0, 1, 1,
0.9374005, 0.3301196, 2.90352, 1, 0, 0, 1, 1,
0.9425583, 0.8053529, 0.6002987, 0, 0, 0, 1, 1,
0.9425862, 0.4826925, 1.959017, 0, 0, 0, 1, 1,
0.9433014, -0.9507934, 0.5913947, 0, 0, 0, 1, 1,
0.9466941, -0.6744721, 3.462294, 0, 0, 0, 1, 1,
0.9553831, 1.130288, 0.9850136, 0, 0, 0, 1, 1,
0.9617473, -0.7136478, 1.07247, 0, 0, 0, 1, 1,
0.9658465, 0.4499398, 1.763614, 0, 0, 0, 1, 1,
0.9666602, -0.1873469, 1.452437, 1, 1, 1, 1, 1,
0.9712707, 0.01670314, 1.459876, 1, 1, 1, 1, 1,
0.9715186, -0.2964919, 2.848812, 1, 1, 1, 1, 1,
0.9722319, -0.1069963, 2.494617, 1, 1, 1, 1, 1,
0.9771296, -0.919028, 2.60625, 1, 1, 1, 1, 1,
0.9815575, 0.9247841, 0.5265741, 1, 1, 1, 1, 1,
0.985877, -1.220352, 1.810974, 1, 1, 1, 1, 1,
0.9978446, 2.500328, 1.510058, 1, 1, 1, 1, 1,
0.9999127, 0.7898823, 0.534441, 1, 1, 1, 1, 1,
1.001225, -0.8573127, 3.778714, 1, 1, 1, 1, 1,
1.008327, 0.9522845, 0.7175767, 1, 1, 1, 1, 1,
1.009337, 1.155465, 0.6947021, 1, 1, 1, 1, 1,
1.021478, 0.1308402, 2.724101, 1, 1, 1, 1, 1,
1.023361, -2.647302, 1.798026, 1, 1, 1, 1, 1,
1.02387, -0.02794034, 1.74578, 1, 1, 1, 1, 1,
1.037534, -1.010196, 2.386364, 0, 0, 1, 1, 1,
1.040714, -0.6139172, 1.900849, 1, 0, 0, 1, 1,
1.042097, -0.1694962, 1.133789, 1, 0, 0, 1, 1,
1.049935, 0.2495233, 0.9430824, 1, 0, 0, 1, 1,
1.054379, -0.6918091, 1.155753, 1, 0, 0, 1, 1,
1.054443, -1.569998, 2.875214, 1, 0, 0, 1, 1,
1.057991, -0.3848547, 2.845721, 0, 0, 0, 1, 1,
1.058126, 0.2381946, 1.005828, 0, 0, 0, 1, 1,
1.059209, 0.1297568, 0.4037043, 0, 0, 0, 1, 1,
1.061911, 0.6278122, 1.864111, 0, 0, 0, 1, 1,
1.065457, -0.006375643, 1.3499, 0, 0, 0, 1, 1,
1.069379, -0.5430502, 1.151403, 0, 0, 0, 1, 1,
1.072214, -2.105422, 3.285722, 0, 0, 0, 1, 1,
1.072402, -0.5057628, 0.1655138, 1, 1, 1, 1, 1,
1.072456, -2.089179, 3.915007, 1, 1, 1, 1, 1,
1.074902, -0.1894012, 3.563839, 1, 1, 1, 1, 1,
1.075085, 0.5698866, 0.9382062, 1, 1, 1, 1, 1,
1.078431, -0.3906476, 1.618741, 1, 1, 1, 1, 1,
1.085935, 0.4696705, -0.240467, 1, 1, 1, 1, 1,
1.097083, 1.506361, 2.185033, 1, 1, 1, 1, 1,
1.097197, -1.452279, 2.338987, 1, 1, 1, 1, 1,
1.104675, -0.6853926, 4.290504, 1, 1, 1, 1, 1,
1.114466, -0.8345494, 1.373376, 1, 1, 1, 1, 1,
1.120231, 0.7301975, 1.568848, 1, 1, 1, 1, 1,
1.125311, 0.1644328, 2.29699, 1, 1, 1, 1, 1,
1.128217, 0.6868486, 3.35557, 1, 1, 1, 1, 1,
1.135498, -1.961408, 2.135026, 1, 1, 1, 1, 1,
1.145113, 1.555301, 0.5276442, 1, 1, 1, 1, 1,
1.146843, 0.7475213, 1.344963, 0, 0, 1, 1, 1,
1.150011, 0.717431, 0.1663881, 1, 0, 0, 1, 1,
1.153915, 1.300347, 2.110958, 1, 0, 0, 1, 1,
1.155939, 1.915165, -0.07834547, 1, 0, 0, 1, 1,
1.157272, -0.4041225, 2.233235, 1, 0, 0, 1, 1,
1.158893, 1.526878, 0.21852, 1, 0, 0, 1, 1,
1.162193, 1.581471, -1.342864, 0, 0, 0, 1, 1,
1.163483, 0.03854085, 0.8349436, 0, 0, 0, 1, 1,
1.170238, -0.236792, 3.914648, 0, 0, 0, 1, 1,
1.170332, -0.8855446, 2.589458, 0, 0, 0, 1, 1,
1.174536, 0.2168535, 2.167465, 0, 0, 0, 1, 1,
1.181085, 1.383361, 0.793259, 0, 0, 0, 1, 1,
1.181724, -1.003358, 1.1073, 0, 0, 0, 1, 1,
1.186136, -0.04076738, 2.269072, 1, 1, 1, 1, 1,
1.192857, -2.170734, 2.307362, 1, 1, 1, 1, 1,
1.197485, -1.535702, 2.886451, 1, 1, 1, 1, 1,
1.200176, -0.4964346, 1.427014, 1, 1, 1, 1, 1,
1.204289, -0.918175, 2.734427, 1, 1, 1, 1, 1,
1.205136, -0.05397412, 2.609664, 1, 1, 1, 1, 1,
1.212058, -0.3727251, 0.6697347, 1, 1, 1, 1, 1,
1.212189, 0.8709815, 0.6847868, 1, 1, 1, 1, 1,
1.213235, 2.010736, 0.0311837, 1, 1, 1, 1, 1,
1.215652, 0.1969246, 1.910525, 1, 1, 1, 1, 1,
1.225558, -0.9565184, 1.755986, 1, 1, 1, 1, 1,
1.236195, -1.451049, 3.140972, 1, 1, 1, 1, 1,
1.254207, -0.9199536, 1.36377, 1, 1, 1, 1, 1,
1.261655, 1.419734, 0.7559864, 1, 1, 1, 1, 1,
1.262264, 1.210814, 0.3469239, 1, 1, 1, 1, 1,
1.272319, -0.1395483, 2.134395, 0, 0, 1, 1, 1,
1.277269, -0.869809, 2.177845, 1, 0, 0, 1, 1,
1.285705, 1.296374, -0.2687062, 1, 0, 0, 1, 1,
1.285747, 0.5917547, 2.227448, 1, 0, 0, 1, 1,
1.291647, -0.4850505, 2.817195, 1, 0, 0, 1, 1,
1.298877, 0.8144927, 1.763809, 1, 0, 0, 1, 1,
1.306441, -0.1056136, 0.7311434, 0, 0, 0, 1, 1,
1.314403, -0.0120435, 1.736896, 0, 0, 0, 1, 1,
1.325535, 0.545093, 0.03857721, 0, 0, 0, 1, 1,
1.328358, 0.1653164, -0.07453184, 0, 0, 0, 1, 1,
1.346287, -1.724, 3.835358, 0, 0, 0, 1, 1,
1.348163, 0.3723072, 1.667458, 0, 0, 0, 1, 1,
1.350913, -0.2529016, 2.383259, 0, 0, 0, 1, 1,
1.364509, 0.5096549, 0.6233493, 1, 1, 1, 1, 1,
1.364553, 0.4241537, 0.6879514, 1, 1, 1, 1, 1,
1.370143, -0.6815197, 2.024439, 1, 1, 1, 1, 1,
1.379016, 0.8969823, 1.980972, 1, 1, 1, 1, 1,
1.379514, 0.8182875, 1.648034, 1, 1, 1, 1, 1,
1.401044, 0.07043513, 1.473269, 1, 1, 1, 1, 1,
1.403501, -0.0100997, -0.8959895, 1, 1, 1, 1, 1,
1.415194, -1.145781, 2.543983, 1, 1, 1, 1, 1,
1.416399, -0.8954507, 3.462363, 1, 1, 1, 1, 1,
1.419165, -2.225356, 2.195349, 1, 1, 1, 1, 1,
1.434855, -1.939892, 4.756721, 1, 1, 1, 1, 1,
1.435633, 1.504977, 0.2462613, 1, 1, 1, 1, 1,
1.440068, -0.8563907, 1.461604, 1, 1, 1, 1, 1,
1.443563, -0.9614148, 0.5027207, 1, 1, 1, 1, 1,
1.453398, -0.3337557, 2.248377, 1, 1, 1, 1, 1,
1.455659, -0.432957, 0.9921108, 0, 0, 1, 1, 1,
1.462387, -0.07188205, 1.706101, 1, 0, 0, 1, 1,
1.47802, -2.004238, 2.597135, 1, 0, 0, 1, 1,
1.512495, -0.2427363, 2.592373, 1, 0, 0, 1, 1,
1.513546, 0.4404071, 1.567327, 1, 0, 0, 1, 1,
1.518461, 0.3919218, 2.625104, 1, 0, 0, 1, 1,
1.536487, 0.4590768, 1.765838, 0, 0, 0, 1, 1,
1.539534, -0.4239683, 0.7858866, 0, 0, 0, 1, 1,
1.549934, -0.2063001, 1.136195, 0, 0, 0, 1, 1,
1.550102, 0.8443255, 0.3051191, 0, 0, 0, 1, 1,
1.552795, -0.8512881, 2.434308, 0, 0, 0, 1, 1,
1.572669, 0.1855271, 2.021685, 0, 0, 0, 1, 1,
1.575701, 2.002739, 0.7928448, 0, 0, 0, 1, 1,
1.579377, 0.5538459, 2.361944, 1, 1, 1, 1, 1,
1.580951, 2.063448, 1.671968, 1, 1, 1, 1, 1,
1.594893, 0.4583911, 1.179849, 1, 1, 1, 1, 1,
1.599386, -0.05267581, 1.300746, 1, 1, 1, 1, 1,
1.602513, -1.930504, 1.518265, 1, 1, 1, 1, 1,
1.612216, 0.1280863, 0.875397, 1, 1, 1, 1, 1,
1.612974, 0.1514647, 0.8985026, 1, 1, 1, 1, 1,
1.622094, 1.827569, -0.3327135, 1, 1, 1, 1, 1,
1.626139, -0.8556334, 1.764976, 1, 1, 1, 1, 1,
1.632555, 1.520311, -0.2560991, 1, 1, 1, 1, 1,
1.636045, -0.04854069, 2.633261, 1, 1, 1, 1, 1,
1.63805, 1.029969, 0.3772781, 1, 1, 1, 1, 1,
1.648471, -0.5340784, 3.148903, 1, 1, 1, 1, 1,
1.655762, 0.1918189, 2.243261, 1, 1, 1, 1, 1,
1.677669, -0.818805, 3.209841, 1, 1, 1, 1, 1,
1.688321, -1.139983, 2.224128, 0, 0, 1, 1, 1,
1.713559, 0.2551477, 2.019091, 1, 0, 0, 1, 1,
1.729649, 0.3507805, 1.447927, 1, 0, 0, 1, 1,
1.732769, -0.3374644, 1.385974, 1, 0, 0, 1, 1,
1.739687, 0.5349262, 2.253709, 1, 0, 0, 1, 1,
1.74412, -0.383773, 1.062881, 1, 0, 0, 1, 1,
1.754465, -1.209941, 3.088211, 0, 0, 0, 1, 1,
1.800666, 1.332741, 1.218854, 0, 0, 0, 1, 1,
1.802996, -0.6697527, 2.556679, 0, 0, 0, 1, 1,
1.804238, 1.178401, 0.8952195, 0, 0, 0, 1, 1,
1.810404, -0.1565683, 0.176644, 0, 0, 0, 1, 1,
1.81519, 1.976311, -0.6910084, 0, 0, 0, 1, 1,
1.840092, 0.4335939, 0.6777984, 0, 0, 0, 1, 1,
1.852851, 0.2815145, 2.04387, 1, 1, 1, 1, 1,
1.861064, 0.2457875, -0.5648935, 1, 1, 1, 1, 1,
1.862983, 0.2901215, 1.051931, 1, 1, 1, 1, 1,
1.917872, 0.1418197, 1.292588, 1, 1, 1, 1, 1,
1.924197, -1.618407, 2.670861, 1, 1, 1, 1, 1,
1.932736, 1.324799, 1.373961, 1, 1, 1, 1, 1,
1.937792, 0.3312995, 2.36891, 1, 1, 1, 1, 1,
1.948797, -0.213677, 0.4321992, 1, 1, 1, 1, 1,
1.951603, 1.461056, 1.067969, 1, 1, 1, 1, 1,
1.967748, 0.7821755, 2.260587, 1, 1, 1, 1, 1,
1.975354, -0.1554487, 1.884764, 1, 1, 1, 1, 1,
1.983808, -0.4319637, -0.1842016, 1, 1, 1, 1, 1,
1.986236, -0.8524566, 1.087959, 1, 1, 1, 1, 1,
1.986313, -0.884774, 2.703378, 1, 1, 1, 1, 1,
1.99903, -1.183067, 2.532066, 1, 1, 1, 1, 1,
1.999547, 0.5375805, 0.494111, 0, 0, 1, 1, 1,
2.047757, 0.7228717, 0.04091975, 1, 0, 0, 1, 1,
2.061743, -0.5486879, 1.661509, 1, 0, 0, 1, 1,
2.069689, -0.3752661, -0.03317285, 1, 0, 0, 1, 1,
2.08024, -1.457317, 1.401403, 1, 0, 0, 1, 1,
2.091724, -0.9783832, 1.505929, 1, 0, 0, 1, 1,
2.093838, -0.3957929, 0.7731401, 0, 0, 0, 1, 1,
2.094194, 0.5977796, 2.266646, 0, 0, 0, 1, 1,
2.102947, 0.0874105, 3.05969, 0, 0, 0, 1, 1,
2.137093, 0.6357378, 0.8420735, 0, 0, 0, 1, 1,
2.167038, -0.2919801, 1.685316, 0, 0, 0, 1, 1,
2.180493, -0.3066094, 0.4508543, 0, 0, 0, 1, 1,
2.237273, 0.4061697, 0.6675023, 0, 0, 0, 1, 1,
2.389013, 1.288391, 0.4560807, 1, 1, 1, 1, 1,
2.538231, -0.2716676, 2.816629, 1, 1, 1, 1, 1,
2.637616, -0.4771412, 1.480368, 1, 1, 1, 1, 1,
2.664726, -0.3300152, 1.343177, 1, 1, 1, 1, 1,
2.754642, -0.8078033, 2.17221, 1, 1, 1, 1, 1,
2.784156, 2.321264, 1.196179, 1, 1, 1, 1, 1,
3.181198, 0.2683522, 2.456147, 1, 1, 1, 1, 1
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
var radius = 9.746283;
var distance = 34.23341;
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
mvMatrix.translate( 0.123281, -0.1638981, -0.2887387 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23341);
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
