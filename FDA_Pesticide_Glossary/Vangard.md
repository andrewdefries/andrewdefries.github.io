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
-3.001703, -0.5660866, -1.6267, 1, 0, 0, 1,
-2.980711, -0.702035, -4.006586, 1, 0.007843138, 0, 1,
-2.927662, -0.6090691, -1.485605, 1, 0.01176471, 0, 1,
-2.907162, 1.843871, -0.693816, 1, 0.01960784, 0, 1,
-2.82099, -1.626764, -2.148126, 1, 0.02352941, 0, 1,
-2.786655, 0.666544, -1.63674, 1, 0.03137255, 0, 1,
-2.748217, -0.9635192, -2.864035, 1, 0.03529412, 0, 1,
-2.703843, -2.200425, -2.347525, 1, 0.04313726, 0, 1,
-2.546432, 1.156507, -1.78831, 1, 0.04705882, 0, 1,
-2.507881, 1.312435, -1.817189, 1, 0.05490196, 0, 1,
-2.490053, 1.297245, -0.6759264, 1, 0.05882353, 0, 1,
-2.406513, 0.9255534, -0.3407818, 1, 0.06666667, 0, 1,
-2.348152, -2.638395, -3.760051, 1, 0.07058824, 0, 1,
-2.326788, -1.16409, -2.331444, 1, 0.07843138, 0, 1,
-2.281524, -0.8631733, -2.202552, 1, 0.08235294, 0, 1,
-2.265922, 0.8721383, -0.9456375, 1, 0.09019608, 0, 1,
-2.263288, -0.4632366, -1.340946, 1, 0.09411765, 0, 1,
-2.262802, 1.206588, 0.7294862, 1, 0.1019608, 0, 1,
-2.222014, -0.5555426, -2.73133, 1, 0.1098039, 0, 1,
-2.216891, 1.198675, -1.726043, 1, 0.1137255, 0, 1,
-2.199033, 0.463425, -2.018198, 1, 0.1215686, 0, 1,
-2.186942, -0.5417151, -1.613252, 1, 0.1254902, 0, 1,
-2.120144, -0.923451, -1.612245, 1, 0.1333333, 0, 1,
-2.115018, 0.09568406, -3.216305, 1, 0.1372549, 0, 1,
-2.088995, 0.5536864, -0.806506, 1, 0.145098, 0, 1,
-2.076386, 0.5513037, -0.8629293, 1, 0.1490196, 0, 1,
-2.069151, -1.373321, -2.808826, 1, 0.1568628, 0, 1,
-2.06483, -2.098007, -1.931751, 1, 0.1607843, 0, 1,
-2.039573, -0.8821555, -1.283881, 1, 0.1686275, 0, 1,
-2.037533, -0.7187693, -2.086206, 1, 0.172549, 0, 1,
-2.035308, -0.037856, -1.905349, 1, 0.1803922, 0, 1,
-2.035146, -0.3748881, -2.113345, 1, 0.1843137, 0, 1,
-2.034582, 0.4658195, 0.9690983, 1, 0.1921569, 0, 1,
-2.027311, 0.5887125, -1.17884, 1, 0.1960784, 0, 1,
-2.026895, 1.320622, -1.14593, 1, 0.2039216, 0, 1,
-1.970405, 0.5345834, -0.8935851, 1, 0.2117647, 0, 1,
-1.951422, 0.2111432, 0.001259299, 1, 0.2156863, 0, 1,
-1.940831, 0.02786682, -0.3755565, 1, 0.2235294, 0, 1,
-1.923847, -0.7912486, -1.872379, 1, 0.227451, 0, 1,
-1.913832, -0.102116, -0.3423919, 1, 0.2352941, 0, 1,
-1.912611, -1.475811, -2.2299, 1, 0.2392157, 0, 1,
-1.910274, -0.3741465, -1.126595, 1, 0.2470588, 0, 1,
-1.910041, 1.147434, -0.3615721, 1, 0.2509804, 0, 1,
-1.909928, 0.8226374, -1.323043, 1, 0.2588235, 0, 1,
-1.89982, 0.7913404, 0.8361245, 1, 0.2627451, 0, 1,
-1.890117, 1.775058, -1.792739, 1, 0.2705882, 0, 1,
-1.872169, 1.352238, -1.149254, 1, 0.2745098, 0, 1,
-1.853073, 0.9367241, -1.134787, 1, 0.282353, 0, 1,
-1.846612, 0.1454928, -0.9026021, 1, 0.2862745, 0, 1,
-1.817817, 0.5511492, -1.410645, 1, 0.2941177, 0, 1,
-1.796002, 0.2489575, -1.482925, 1, 0.3019608, 0, 1,
-1.79559, 0.03180746, -2.022502, 1, 0.3058824, 0, 1,
-1.784805, 0.2263483, -1.653394, 1, 0.3137255, 0, 1,
-1.772099, -0.8519944, -1.097166, 1, 0.3176471, 0, 1,
-1.769208, 0.08875699, -2.277391, 1, 0.3254902, 0, 1,
-1.75504, -0.4875588, -1.55404, 1, 0.3294118, 0, 1,
-1.733599, -0.7841781, -0.3101952, 1, 0.3372549, 0, 1,
-1.732397, -1.735479, -1.479745, 1, 0.3411765, 0, 1,
-1.715595, -0.4988928, -1.469124, 1, 0.3490196, 0, 1,
-1.70839, -0.5356984, -1.859214, 1, 0.3529412, 0, 1,
-1.659475, -0.5351576, -0.7451957, 1, 0.3607843, 0, 1,
-1.639347, -0.9341604, -1.693122, 1, 0.3647059, 0, 1,
-1.629714, 0.9913715, -1.703072, 1, 0.372549, 0, 1,
-1.598872, -1.430979, -2.580912, 1, 0.3764706, 0, 1,
-1.577158, 0.9074544, 0.238145, 1, 0.3843137, 0, 1,
-1.558588, -0.1710424, -2.375324, 1, 0.3882353, 0, 1,
-1.54101, 0.3043499, -1.260938, 1, 0.3960784, 0, 1,
-1.531584, 0.03892564, -1.787917, 1, 0.4039216, 0, 1,
-1.529304, 1.00066, -1.23846, 1, 0.4078431, 0, 1,
-1.494986, -0.8651916, -3.253835, 1, 0.4156863, 0, 1,
-1.492874, -0.1730964, -2.986764, 1, 0.4196078, 0, 1,
-1.485842, -0.2612936, -1.350827, 1, 0.427451, 0, 1,
-1.484334, 0.5336339, -1.947531, 1, 0.4313726, 0, 1,
-1.482527, -1.362729, -2.632883, 1, 0.4392157, 0, 1,
-1.482016, -0.6395121, -2.204662, 1, 0.4431373, 0, 1,
-1.482013, 0.7953985, -1.65215, 1, 0.4509804, 0, 1,
-1.479209, -0.9018753, -2.133454, 1, 0.454902, 0, 1,
-1.476144, -0.6735127, -2.625297, 1, 0.4627451, 0, 1,
-1.463323, 0.9389386, -2.080271, 1, 0.4666667, 0, 1,
-1.459225, -0.9560443, -1.854704, 1, 0.4745098, 0, 1,
-1.456526, -0.2101146, -2.516198, 1, 0.4784314, 0, 1,
-1.440591, 1.163707, -1.723777, 1, 0.4862745, 0, 1,
-1.440278, -2.249741, -4.02181, 1, 0.4901961, 0, 1,
-1.435651, -1.725217, -2.023736, 1, 0.4980392, 0, 1,
-1.433975, -1.624283, -2.993258, 1, 0.5058824, 0, 1,
-1.428806, 0.1426897, -1.954792, 1, 0.509804, 0, 1,
-1.42268, -0.4750421, -2.194481, 1, 0.5176471, 0, 1,
-1.418021, -0.5485739, -1.319906, 1, 0.5215687, 0, 1,
-1.407388, -0.685276, -1.819603, 1, 0.5294118, 0, 1,
-1.405926, 0.7204475, -0.3317083, 1, 0.5333334, 0, 1,
-1.380661, -1.705679, -2.530819, 1, 0.5411765, 0, 1,
-1.379704, 1.075079, -0.5000576, 1, 0.5450981, 0, 1,
-1.365098, 0.5499479, -0.7651764, 1, 0.5529412, 0, 1,
-1.359237, -0.05365105, -0.7602993, 1, 0.5568628, 0, 1,
-1.348693, -0.6196648, -2.555852, 1, 0.5647059, 0, 1,
-1.348258, -0.7772937, -2.980047, 1, 0.5686275, 0, 1,
-1.335768, -1.026614, -2.157916, 1, 0.5764706, 0, 1,
-1.335456, 1.91258, 0.1723533, 1, 0.5803922, 0, 1,
-1.335052, 2.038889, -1.226749, 1, 0.5882353, 0, 1,
-1.323531, 2.726798, -1.369083, 1, 0.5921569, 0, 1,
-1.322173, -0.3820682, -2.403517, 1, 0.6, 0, 1,
-1.322057, -0.2865094, -1.802846, 1, 0.6078432, 0, 1,
-1.316658, 0.7056288, -1.029159, 1, 0.6117647, 0, 1,
-1.3072, 1.850079, -2.684929, 1, 0.6196079, 0, 1,
-1.303203, -1.087272, -3.346107, 1, 0.6235294, 0, 1,
-1.278114, 0.6508504, -0.6172892, 1, 0.6313726, 0, 1,
-1.276009, 1.109688, 0.6998202, 1, 0.6352941, 0, 1,
-1.275353, 0.8897092, -1.384985, 1, 0.6431373, 0, 1,
-1.272931, 0.1543927, -2.011797, 1, 0.6470588, 0, 1,
-1.271338, -1.058624, -2.328733, 1, 0.654902, 0, 1,
-1.269601, 0.3568986, -0.1615773, 1, 0.6588235, 0, 1,
-1.266697, 1.127664, -0.798849, 1, 0.6666667, 0, 1,
-1.258946, 0.2135099, -1.574039, 1, 0.6705883, 0, 1,
-1.253666, 0.7479771, -0.7999616, 1, 0.6784314, 0, 1,
-1.241634, 0.6056865, -1.03747, 1, 0.682353, 0, 1,
-1.237157, 0.3447796, -0.8957933, 1, 0.6901961, 0, 1,
-1.235847, -0.8204945, 0.2152233, 1, 0.6941177, 0, 1,
-1.234684, -0.08519305, -1.405643, 1, 0.7019608, 0, 1,
-1.226696, 0.8836021, -0.7929834, 1, 0.7098039, 0, 1,
-1.210453, 0.7813058, 0.5636329, 1, 0.7137255, 0, 1,
-1.203761, -0.3121106, -2.121685, 1, 0.7215686, 0, 1,
-1.202364, 1.56078, -1.091083, 1, 0.7254902, 0, 1,
-1.191354, -0.02972041, -0.9108295, 1, 0.7333333, 0, 1,
-1.160142, 1.216053, -1.849532, 1, 0.7372549, 0, 1,
-1.154949, -0.5813972, -1.269645, 1, 0.7450981, 0, 1,
-1.152369, 0.1769496, -1.530303, 1, 0.7490196, 0, 1,
-1.149226, 0.6294335, -0.4013802, 1, 0.7568628, 0, 1,
-1.144656, 0.3963182, -1.023378, 1, 0.7607843, 0, 1,
-1.137662, 0.7001011, -1.375346, 1, 0.7686275, 0, 1,
-1.13378, -0.02074262, -1.765431, 1, 0.772549, 0, 1,
-1.132442, 1.594412, 1.715603, 1, 0.7803922, 0, 1,
-1.129097, -1.589555, -3.559299, 1, 0.7843137, 0, 1,
-1.12652, 1.220282, -1.15696, 1, 0.7921569, 0, 1,
-1.122415, -0.1403736, -0.9070328, 1, 0.7960784, 0, 1,
-1.11853, -0.9290668, -2.248837, 1, 0.8039216, 0, 1,
-1.117708, 0.03120091, -2.003847, 1, 0.8117647, 0, 1,
-1.110537, 2.495223, 1.379727, 1, 0.8156863, 0, 1,
-1.105944, -0.8618678, -3.380196, 1, 0.8235294, 0, 1,
-1.105762, 0.172034, -1.970674, 1, 0.827451, 0, 1,
-1.102573, 0.4154834, -1.461667, 1, 0.8352941, 0, 1,
-1.085237, -0.2905137, -2.380187, 1, 0.8392157, 0, 1,
-1.074662, 0.5410343, -0.5377492, 1, 0.8470588, 0, 1,
-1.071866, -0.3020748, -1.180555, 1, 0.8509804, 0, 1,
-1.064293, 0.7086536, 0.3591254, 1, 0.8588235, 0, 1,
-1.062091, 1.136286, -2.419482, 1, 0.8627451, 0, 1,
-1.051537, 0.7304998, -0.8740523, 1, 0.8705882, 0, 1,
-1.047226, -1.204128, -2.691189, 1, 0.8745098, 0, 1,
-1.044961, -0.1759809, -1.092336, 1, 0.8823529, 0, 1,
-1.044652, 1.263686, 0.4199852, 1, 0.8862745, 0, 1,
-1.020169, 0.1870857, -0.2868928, 1, 0.8941177, 0, 1,
-1.019957, -0.6845466, -3.307549, 1, 0.8980392, 0, 1,
-1.016719, 0.6544129, -1.113277, 1, 0.9058824, 0, 1,
-1.011352, 0.2495344, -2.276853, 1, 0.9137255, 0, 1,
-1.009343, 1.430477, -0.8933957, 1, 0.9176471, 0, 1,
-1.007286, 0.36074, -1.04691, 1, 0.9254902, 0, 1,
-1.003547, -0.3337796, -1.820964, 1, 0.9294118, 0, 1,
-1.003301, 0.06289717, 0.1554022, 1, 0.9372549, 0, 1,
-1.002815, -0.2088879, -1.693839, 1, 0.9411765, 0, 1,
-0.9991227, -0.7591347, -1.117335, 1, 0.9490196, 0, 1,
-0.996176, -1.461089, -3.045763, 1, 0.9529412, 0, 1,
-0.9844166, -0.585309, -1.390635, 1, 0.9607843, 0, 1,
-0.9842324, -0.7302648, -2.827638, 1, 0.9647059, 0, 1,
-0.9813846, -1.853626, -1.603069, 1, 0.972549, 0, 1,
-0.9676656, -1.058195, -2.719043, 1, 0.9764706, 0, 1,
-0.9671028, -0.7063104, -1.236924, 1, 0.9843137, 0, 1,
-0.9660218, 0.8639804, -1.115146, 1, 0.9882353, 0, 1,
-0.9621137, -0.2552943, 0.6459395, 1, 0.9960784, 0, 1,
-0.9507449, 0.03758758, -0.7810561, 0.9960784, 1, 0, 1,
-0.9490637, -1.169992, -1.09332, 0.9921569, 1, 0, 1,
-0.944843, 0.1378273, -2.102483, 0.9843137, 1, 0, 1,
-0.9445444, 0.9289998, -0.4129878, 0.9803922, 1, 0, 1,
-0.9320078, 1.371433, -0.002063547, 0.972549, 1, 0, 1,
-0.9316899, 0.9643487, -0.50857, 0.9686275, 1, 0, 1,
-0.9205689, 0.8485079, -1.147688, 0.9607843, 1, 0, 1,
-0.9205035, -1.050678, -5.201779, 0.9568627, 1, 0, 1,
-0.9147239, 1.25084, -1.537097, 0.9490196, 1, 0, 1,
-0.9140797, -0.9718987, -4.156524, 0.945098, 1, 0, 1,
-0.9136381, -0.5930693, -0.5433866, 0.9372549, 1, 0, 1,
-0.8979012, 1.200346, -2.472248, 0.9333333, 1, 0, 1,
-0.8866423, -0.2423455, -2.589809, 0.9254902, 1, 0, 1,
-0.8813322, -0.5130045, -0.9825611, 0.9215686, 1, 0, 1,
-0.8798699, -0.2675946, -1.320041, 0.9137255, 1, 0, 1,
-0.8749888, 0.9488333, 0.02672346, 0.9098039, 1, 0, 1,
-0.8611345, 0.1452953, 0.02034117, 0.9019608, 1, 0, 1,
-0.8581878, -0.5155134, -2.622906, 0.8941177, 1, 0, 1,
-0.8528174, -1.127551, -2.220722, 0.8901961, 1, 0, 1,
-0.8416509, 0.4037862, -0.5426651, 0.8823529, 1, 0, 1,
-0.8403326, -0.1399896, -2.103516, 0.8784314, 1, 0, 1,
-0.8357162, 2.019921, -0.3700368, 0.8705882, 1, 0, 1,
-0.8261247, 0.8406703, 1.074971, 0.8666667, 1, 0, 1,
-0.8249598, 0.7996334, -2.349442, 0.8588235, 1, 0, 1,
-0.8248986, 0.05218103, -1.394289, 0.854902, 1, 0, 1,
-0.8203345, -0.1451281, -1.909563, 0.8470588, 1, 0, 1,
-0.8082599, -0.3909485, -2.113239, 0.8431373, 1, 0, 1,
-0.8068773, -0.5363573, -1.056989, 0.8352941, 1, 0, 1,
-0.802667, -1.12829, -1.917133, 0.8313726, 1, 0, 1,
-0.7987391, 1.147132, 1.816878, 0.8235294, 1, 0, 1,
-0.797124, -0.06120688, -1.759599, 0.8196079, 1, 0, 1,
-0.7955452, 0.5973512, -1.952126, 0.8117647, 1, 0, 1,
-0.7871715, -0.367436, -2.134177, 0.8078431, 1, 0, 1,
-0.7862281, -0.6949066, -2.105861, 0.8, 1, 0, 1,
-0.7764597, 0.3792458, -0.1832201, 0.7921569, 1, 0, 1,
-0.774946, -0.4196941, -1.662423, 0.7882353, 1, 0, 1,
-0.7730572, 0.063022, -0.463391, 0.7803922, 1, 0, 1,
-0.7699704, 2.758041, -0.1304833, 0.7764706, 1, 0, 1,
-0.7599095, -1.452764, -3.177232, 0.7686275, 1, 0, 1,
-0.754729, 0.6908733, -1.261446, 0.7647059, 1, 0, 1,
-0.7478585, -1.147943, -4.890388, 0.7568628, 1, 0, 1,
-0.7413373, -1.302941, -3.197787, 0.7529412, 1, 0, 1,
-0.7411726, -0.3495804, -2.804112, 0.7450981, 1, 0, 1,
-0.7380469, 1.321534, -1.62392, 0.7411765, 1, 0, 1,
-0.7350414, 0.8423377, -0.6759764, 0.7333333, 1, 0, 1,
-0.7292489, -1.242903, -2.918883, 0.7294118, 1, 0, 1,
-0.7160707, -0.2628267, -2.683209, 0.7215686, 1, 0, 1,
-0.7128943, 1.324462, 0.619014, 0.7176471, 1, 0, 1,
-0.7110634, 0.5683407, -0.3107554, 0.7098039, 1, 0, 1,
-0.7098257, 0.4375797, -1.022224, 0.7058824, 1, 0, 1,
-0.7085353, -0.4437688, -2.691643, 0.6980392, 1, 0, 1,
-0.7076883, 0.5055036, -1.331919, 0.6901961, 1, 0, 1,
-0.7065852, -1.047873, -2.930554, 0.6862745, 1, 0, 1,
-0.7051547, 0.753786, -0.522138, 0.6784314, 1, 0, 1,
-0.7024511, 1.862651, -1.473122, 0.6745098, 1, 0, 1,
-0.6996223, 0.8653314, -1.20244, 0.6666667, 1, 0, 1,
-0.6954259, -1.281013, -2.069281, 0.6627451, 1, 0, 1,
-0.6951119, 1.132265, -0.7576175, 0.654902, 1, 0, 1,
-0.6921984, 0.2670907, -2.201906, 0.6509804, 1, 0, 1,
-0.6911536, -1.269637, -3.659114, 0.6431373, 1, 0, 1,
-0.6904608, 0.1328875, 0.6757965, 0.6392157, 1, 0, 1,
-0.6892377, 0.288136, -1.071636, 0.6313726, 1, 0, 1,
-0.6846013, -0.786289, -1.378471, 0.627451, 1, 0, 1,
-0.6755213, 0.4238786, -2.314556, 0.6196079, 1, 0, 1,
-0.6732306, -0.2929557, -0.7593259, 0.6156863, 1, 0, 1,
-0.6583192, -1.270074, -3.116775, 0.6078432, 1, 0, 1,
-0.65627, -0.04009542, -2.679462, 0.6039216, 1, 0, 1,
-0.6557231, -0.07905737, -2.520584, 0.5960785, 1, 0, 1,
-0.651785, -1.660587, -3.672249, 0.5882353, 1, 0, 1,
-0.6447189, -0.2505904, -2.797135, 0.5843138, 1, 0, 1,
-0.6427291, -1.050883, -2.849464, 0.5764706, 1, 0, 1,
-0.6350377, 1.480354, 0.9882385, 0.572549, 1, 0, 1,
-0.6303722, 0.9385723, 1.354872, 0.5647059, 1, 0, 1,
-0.6280497, -1.276259, -3.465853, 0.5607843, 1, 0, 1,
-0.6208212, 0.07982034, -1.588209, 0.5529412, 1, 0, 1,
-0.6172494, 0.4691113, -2.431371, 0.5490196, 1, 0, 1,
-0.6132401, 0.4970933, 0.572993, 0.5411765, 1, 0, 1,
-0.6125955, -0.7897172, -3.782367, 0.5372549, 1, 0, 1,
-0.6110985, -0.4426765, -2.528883, 0.5294118, 1, 0, 1,
-0.6108775, -0.2587499, -3.769871, 0.5254902, 1, 0, 1,
-0.6075822, -0.200372, -1.78732, 0.5176471, 1, 0, 1,
-0.6055501, -1.19891, -2.503336, 0.5137255, 1, 0, 1,
-0.6049557, -0.5930738, -3.870265, 0.5058824, 1, 0, 1,
-0.6033734, -0.1606069, -2.17768, 0.5019608, 1, 0, 1,
-0.5980107, -1.282881, -2.831248, 0.4941176, 1, 0, 1,
-0.5821493, -2.105469, -2.760013, 0.4862745, 1, 0, 1,
-0.5814115, 0.2991548, -1.649566, 0.4823529, 1, 0, 1,
-0.5778235, -0.4115028, -3.688826, 0.4745098, 1, 0, 1,
-0.5766175, 1.277553, 0.1778822, 0.4705882, 1, 0, 1,
-0.5742859, 0.3842511, -2.295363, 0.4627451, 1, 0, 1,
-0.569663, -0.4650678, -2.442637, 0.4588235, 1, 0, 1,
-0.5665688, -1.526058, -2.898541, 0.4509804, 1, 0, 1,
-0.5661415, 0.9660639, -0.80063, 0.4470588, 1, 0, 1,
-0.5659632, -0.4674863, -1.536269, 0.4392157, 1, 0, 1,
-0.5651923, -0.721962, -2.614877, 0.4352941, 1, 0, 1,
-0.5594615, 1.10373, -0.3562039, 0.427451, 1, 0, 1,
-0.5529922, -1.06975, -1.553086, 0.4235294, 1, 0, 1,
-0.5488141, -0.4042605, -2.011685, 0.4156863, 1, 0, 1,
-0.5441061, -1.405381, -2.343316, 0.4117647, 1, 0, 1,
-0.5429849, -0.6940118, -4.188076, 0.4039216, 1, 0, 1,
-0.5428559, 1.074867, -0.7321308, 0.3960784, 1, 0, 1,
-0.5396843, 0.2825534, 0.2382452, 0.3921569, 1, 0, 1,
-0.5371774, 1.165466, -2.163256, 0.3843137, 1, 0, 1,
-0.5339057, -1.057354, -2.502966, 0.3803922, 1, 0, 1,
-0.5326403, 1.810336, -0.1795308, 0.372549, 1, 0, 1,
-0.5283773, 0.0860569, -3.335604, 0.3686275, 1, 0, 1,
-0.5259005, -1.748578, -2.173936, 0.3607843, 1, 0, 1,
-0.5256925, -0.7509655, 0.6699889, 0.3568628, 1, 0, 1,
-0.5251064, -0.3167751, -2.723905, 0.3490196, 1, 0, 1,
-0.5241583, 0.3982216, -1.126407, 0.345098, 1, 0, 1,
-0.5234815, 0.3002794, 0.671301, 0.3372549, 1, 0, 1,
-0.5206264, 0.1409233, -2.717216, 0.3333333, 1, 0, 1,
-0.5154824, 0.9134445, -0.2429841, 0.3254902, 1, 0, 1,
-0.5150033, 0.5077659, -2.761781, 0.3215686, 1, 0, 1,
-0.5149279, -0.348954, -2.591252, 0.3137255, 1, 0, 1,
-0.5100843, 0.2073987, -1.723024, 0.3098039, 1, 0, 1,
-0.5057244, 0.0611142, -1.056942, 0.3019608, 1, 0, 1,
-0.5050029, 0.2068287, 0.1389385, 0.2941177, 1, 0, 1,
-0.5036023, 1.232778, -0.09343372, 0.2901961, 1, 0, 1,
-0.5029861, -2.313839, -4.776892, 0.282353, 1, 0, 1,
-0.4976164, 1.822295, -0.9941388, 0.2784314, 1, 0, 1,
-0.497497, 0.6071838, -1.520603, 0.2705882, 1, 0, 1,
-0.4957439, -0.3405818, -2.72268, 0.2666667, 1, 0, 1,
-0.4953991, 0.2883625, -1.847426, 0.2588235, 1, 0, 1,
-0.4951666, 0.8387803, 0.5255936, 0.254902, 1, 0, 1,
-0.4887979, 1.403132, -0.6850653, 0.2470588, 1, 0, 1,
-0.4855241, -0.2772809, -1.901444, 0.2431373, 1, 0, 1,
-0.4853403, -1.345537, -3.196147, 0.2352941, 1, 0, 1,
-0.4849356, -0.2187604, -4.625956, 0.2313726, 1, 0, 1,
-0.4840311, -1.917705, -2.579119, 0.2235294, 1, 0, 1,
-0.4839272, -0.5866683, -2.906425, 0.2196078, 1, 0, 1,
-0.4815207, 0.5571342, -2.334596, 0.2117647, 1, 0, 1,
-0.477846, -0.128289, -1.597364, 0.2078431, 1, 0, 1,
-0.4760809, -0.08618503, -1.510597, 0.2, 1, 0, 1,
-0.4747318, 0.7251211, 0.4020366, 0.1921569, 1, 0, 1,
-0.4728194, 0.8731608, -0.2736681, 0.1882353, 1, 0, 1,
-0.4719843, -1.357934, -1.816608, 0.1803922, 1, 0, 1,
-0.4702339, -0.5109795, -2.778836, 0.1764706, 1, 0, 1,
-0.4677183, 0.911649, 0.5232812, 0.1686275, 1, 0, 1,
-0.4653467, -1.00518, -2.464091, 0.1647059, 1, 0, 1,
-0.4625747, -1.035668, -3.733377, 0.1568628, 1, 0, 1,
-0.4570963, -1.368483, -3.980237, 0.1529412, 1, 0, 1,
-0.4548895, 0.03243672, -1.901269, 0.145098, 1, 0, 1,
-0.453095, 0.09515177, -2.189532, 0.1411765, 1, 0, 1,
-0.4473457, -0.6899437, -4.923933, 0.1333333, 1, 0, 1,
-0.4426617, -0.7144105, -3.356222, 0.1294118, 1, 0, 1,
-0.4417383, 0.8838485, -0.1885458, 0.1215686, 1, 0, 1,
-0.4373398, -1.564528, -2.13241, 0.1176471, 1, 0, 1,
-0.4370933, -2.087518, -3.871241, 0.1098039, 1, 0, 1,
-0.4366468, 0.2446607, -0.5196001, 0.1058824, 1, 0, 1,
-0.4282505, -1.451868, -4.106087, 0.09803922, 1, 0, 1,
-0.4241177, -0.8994929, -3.400704, 0.09019608, 1, 0, 1,
-0.4240881, -0.3776574, -1.795888, 0.08627451, 1, 0, 1,
-0.4226013, 1.634065, -0.6749315, 0.07843138, 1, 0, 1,
-0.4212593, 1.080901, -1.181174, 0.07450981, 1, 0, 1,
-0.4209034, 1.753474, -1.014913, 0.06666667, 1, 0, 1,
-0.4178526, 0.197918, -1.951129, 0.0627451, 1, 0, 1,
-0.4131725, -1.217538, -1.965116, 0.05490196, 1, 0, 1,
-0.4114821, 0.01694313, -2.869187, 0.05098039, 1, 0, 1,
-0.4092886, -0.1941224, -2.059793, 0.04313726, 1, 0, 1,
-0.405491, -0.05832126, -0.8939537, 0.03921569, 1, 0, 1,
-0.3934552, 0.9277665, -0.8568004, 0.03137255, 1, 0, 1,
-0.3909604, -0.4688791, -3.594084, 0.02745098, 1, 0, 1,
-0.3888697, 0.01997836, -1.029414, 0.01960784, 1, 0, 1,
-0.3874266, -0.1631734, -3.00808, 0.01568628, 1, 0, 1,
-0.3861009, -2.260478, -3.168453, 0.007843138, 1, 0, 1,
-0.3832757, 0.3841313, -0.7435527, 0.003921569, 1, 0, 1,
-0.3827705, 0.4156266, -1.358475, 0, 1, 0.003921569, 1,
-0.3767032, -0.1101189, -2.897981, 0, 1, 0.01176471, 1,
-0.375821, -0.2127219, -3.212476, 0, 1, 0.01568628, 1,
-0.3756703, 0.1811713, -1.589283, 0, 1, 0.02352941, 1,
-0.3744526, -0.6542879, -2.767346, 0, 1, 0.02745098, 1,
-0.3720253, 0.5153657, -0.7142171, 0, 1, 0.03529412, 1,
-0.3709447, 0.5029631, -0.2448719, 0, 1, 0.03921569, 1,
-0.3670964, -0.7272003, -1.715101, 0, 1, 0.04705882, 1,
-0.3663666, 1.875173, 1.304303, 0, 1, 0.05098039, 1,
-0.3610924, -0.8100946, -2.454179, 0, 1, 0.05882353, 1,
-0.3566474, -0.5974579, -3.653254, 0, 1, 0.0627451, 1,
-0.3545413, 0.8043687, -1.158325, 0, 1, 0.07058824, 1,
-0.3545209, 0.548502, -1.913817, 0, 1, 0.07450981, 1,
-0.3513446, -1.27851, -3.917702, 0, 1, 0.08235294, 1,
-0.3474411, 0.408683, -1.589957, 0, 1, 0.08627451, 1,
-0.341958, -0.4145488, -0.8917434, 0, 1, 0.09411765, 1,
-0.3414429, 1.683857, 0.8785663, 0, 1, 0.1019608, 1,
-0.3391011, -0.2847001, -2.814291, 0, 1, 0.1058824, 1,
-0.3322452, -0.6395158, -1.774292, 0, 1, 0.1137255, 1,
-0.326784, -1.564265, -4.654025, 0, 1, 0.1176471, 1,
-0.3228896, -0.2698427, -2.553659, 0, 1, 0.1254902, 1,
-0.3224519, -0.5274663, 0.05554843, 0, 1, 0.1294118, 1,
-0.3223133, -1.267464, -3.965074, 0, 1, 0.1372549, 1,
-0.3184477, -0.360753, -2.429121, 0, 1, 0.1411765, 1,
-0.3168904, -1.109767, -3.816853, 0, 1, 0.1490196, 1,
-0.3139289, 0.190427, -1.364335, 0, 1, 0.1529412, 1,
-0.3124132, -0.9527953, -2.754282, 0, 1, 0.1607843, 1,
-0.3116697, -0.3595405, -2.422409, 0, 1, 0.1647059, 1,
-0.3105078, -0.163452, -1.904622, 0, 1, 0.172549, 1,
-0.308266, 0.841451, -0.3446932, 0, 1, 0.1764706, 1,
-0.3064466, 0.09562793, -0.8023452, 0, 1, 0.1843137, 1,
-0.3061011, -3.294228, -1.239259, 0, 1, 0.1882353, 1,
-0.3042348, 1.403812, 0.7861623, 0, 1, 0.1960784, 1,
-0.3017846, -0.8525838, -3.00413, 0, 1, 0.2039216, 1,
-0.2953098, 1.07549, -0.679364, 0, 1, 0.2078431, 1,
-0.2947509, -0.7187519, -2.006007, 0, 1, 0.2156863, 1,
-0.29421, -0.1114086, -3.240333, 0, 1, 0.2196078, 1,
-0.2912579, -0.1151085, -1.319658, 0, 1, 0.227451, 1,
-0.2899912, 1.270757, 1.955952, 0, 1, 0.2313726, 1,
-0.2796217, -1.656028, -3.097391, 0, 1, 0.2392157, 1,
-0.2790032, -1.362906, -5.057592, 0, 1, 0.2431373, 1,
-0.277736, 0.6959856, -0.2057386, 0, 1, 0.2509804, 1,
-0.2772709, 0.605553, 0.03677066, 0, 1, 0.254902, 1,
-0.2767036, 0.6193078, 0.3100822, 0, 1, 0.2627451, 1,
-0.2748282, 1.387349, -1.371517, 0, 1, 0.2666667, 1,
-0.272662, -0.2097614, -1.115284, 0, 1, 0.2745098, 1,
-0.26949, 0.3925484, 1.31326, 0, 1, 0.2784314, 1,
-0.2661137, -0.9237413, -2.955877, 0, 1, 0.2862745, 1,
-0.2634556, 1.179952, 0.2152533, 0, 1, 0.2901961, 1,
-0.2605671, -0.9653282, -4.076763, 0, 1, 0.2980392, 1,
-0.2565889, -0.8787253, -0.7898507, 0, 1, 0.3058824, 1,
-0.2562706, 0.9461687, 1.201452, 0, 1, 0.3098039, 1,
-0.2546531, 0.4077145, -0.1003607, 0, 1, 0.3176471, 1,
-0.2544054, -0.7890124, -2.100429, 0, 1, 0.3215686, 1,
-0.2537673, -0.5352038, -3.335801, 0, 1, 0.3294118, 1,
-0.251317, -0.9305875, -4.922932, 0, 1, 0.3333333, 1,
-0.2507372, -0.01336421, -2.066121, 0, 1, 0.3411765, 1,
-0.2472964, 0.7634372, -0.6762971, 0, 1, 0.345098, 1,
-0.2469408, -0.5596578, -3.455936, 0, 1, 0.3529412, 1,
-0.2460403, 0.6150302, -1.181614, 0, 1, 0.3568628, 1,
-0.2431525, 0.8964829, 0.7837906, 0, 1, 0.3647059, 1,
-0.2394739, 0.8151103, -1.023, 0, 1, 0.3686275, 1,
-0.2382575, -0.2829371, -1.648488, 0, 1, 0.3764706, 1,
-0.2343174, 0.01284429, -0.08922072, 0, 1, 0.3803922, 1,
-0.2320988, -0.01455001, -1.718485, 0, 1, 0.3882353, 1,
-0.2286791, 0.4452146, -0.1094731, 0, 1, 0.3921569, 1,
-0.2280083, 1.052529, 0.02846594, 0, 1, 0.4, 1,
-0.226729, -0.3653273, -3.012838, 0, 1, 0.4078431, 1,
-0.2264295, -2.483459, -2.174662, 0, 1, 0.4117647, 1,
-0.2262071, 0.3380861, -0.1183466, 0, 1, 0.4196078, 1,
-0.2214492, 0.406729, -0.1134942, 0, 1, 0.4235294, 1,
-0.2212983, 0.6322895, -0.4249418, 0, 1, 0.4313726, 1,
-0.2166115, 0.8474159, 0.9907371, 0, 1, 0.4352941, 1,
-0.214685, 0.2166085, -0.6402352, 0, 1, 0.4431373, 1,
-0.2139389, -0.01826791, -2.176368, 0, 1, 0.4470588, 1,
-0.2130688, -0.6322951, -2.598277, 0, 1, 0.454902, 1,
-0.2121077, -1.866082, -3.02228, 0, 1, 0.4588235, 1,
-0.2118217, -0.09693895, -1.17392, 0, 1, 0.4666667, 1,
-0.2103703, 0.9236812, 0.9170881, 0, 1, 0.4705882, 1,
-0.2093532, -0.9381959, -5.472933, 0, 1, 0.4784314, 1,
-0.207774, 0.4785282, -0.5882607, 0, 1, 0.4823529, 1,
-0.2066862, 0.8321986, -0.2579874, 0, 1, 0.4901961, 1,
-0.2055924, -0.6362819, -2.897284, 0, 1, 0.4941176, 1,
-0.205162, -1.951529, -3.217486, 0, 1, 0.5019608, 1,
-0.2043689, 0.3146538, -0.1500796, 0, 1, 0.509804, 1,
-0.2028464, -1.039808, -2.371887, 0, 1, 0.5137255, 1,
-0.201274, 0.9455776, 0.2707373, 0, 1, 0.5215687, 1,
-0.1990986, 1.692708, -0.7690338, 0, 1, 0.5254902, 1,
-0.1942456, -0.01125988, -1.998519, 0, 1, 0.5333334, 1,
-0.1919164, -0.4041863, -3.000757, 0, 1, 0.5372549, 1,
-0.1914656, 0.1735766, -1.625935, 0, 1, 0.5450981, 1,
-0.191161, -0.3713223, -1.164289, 0, 1, 0.5490196, 1,
-0.1877269, 1.879152, 0.2810122, 0, 1, 0.5568628, 1,
-0.1826191, 1.309818, -0.07995516, 0, 1, 0.5607843, 1,
-0.1813873, -0.1683406, -4.079436, 0, 1, 0.5686275, 1,
-0.1813457, 2.297628, -0.5790461, 0, 1, 0.572549, 1,
-0.1799774, -1.064174, -2.934198, 0, 1, 0.5803922, 1,
-0.179977, 1.509701, -0.1278648, 0, 1, 0.5843138, 1,
-0.1798418, -0.5044532, -2.766723, 0, 1, 0.5921569, 1,
-0.1793782, -1.668134, -3.935166, 0, 1, 0.5960785, 1,
-0.1774114, 0.7506399, -0.5279239, 0, 1, 0.6039216, 1,
-0.1771378, -2.177532, -1.509946, 0, 1, 0.6117647, 1,
-0.1731341, 0.3600309, -1.400282, 0, 1, 0.6156863, 1,
-0.1727005, -0.1862809, -2.297827, 0, 1, 0.6235294, 1,
-0.1644921, -0.07992352, -1.847114, 0, 1, 0.627451, 1,
-0.1600525, -0.05967578, -1.856062, 0, 1, 0.6352941, 1,
-0.1583473, 0.413725, -2.442376, 0, 1, 0.6392157, 1,
-0.1557808, 0.5388021, 1.443787, 0, 1, 0.6470588, 1,
-0.1552214, 1.203475, -0.9799585, 0, 1, 0.6509804, 1,
-0.1504999, -0.7510061, -4.305958, 0, 1, 0.6588235, 1,
-0.1503782, 0.4327492, 0.04223547, 0, 1, 0.6627451, 1,
-0.1464166, -1.178139, -2.555315, 0, 1, 0.6705883, 1,
-0.1446394, -2.173638, -3.589178, 0, 1, 0.6745098, 1,
-0.1444336, 0.2968954, 0.5461477, 0, 1, 0.682353, 1,
-0.1438657, 0.4909529, -0.6673242, 0, 1, 0.6862745, 1,
-0.1420829, -1.755329, -0.9015598, 0, 1, 0.6941177, 1,
-0.1418463, 1.115623, 1.101315, 0, 1, 0.7019608, 1,
-0.1343704, -1.596146, -3.555216, 0, 1, 0.7058824, 1,
-0.134192, 1.524709, 0.4855508, 0, 1, 0.7137255, 1,
-0.1320062, 0.1292426, 0.3150764, 0, 1, 0.7176471, 1,
-0.1317814, -1.275185, -3.459736, 0, 1, 0.7254902, 1,
-0.1288352, 0.7431588, 0.5967737, 0, 1, 0.7294118, 1,
-0.127523, 0.5503585, -0.3705051, 0, 1, 0.7372549, 1,
-0.1248546, -0.398171, -1.326191, 0, 1, 0.7411765, 1,
-0.1232783, -0.09355906, -1.503958, 0, 1, 0.7490196, 1,
-0.121808, 1.645811, 0.2445008, 0, 1, 0.7529412, 1,
-0.1172271, -0.06023831, -3.383858, 0, 1, 0.7607843, 1,
-0.1150506, 2.388329, -0.01095339, 0, 1, 0.7647059, 1,
-0.1102198, -0.9194024, -3.819269, 0, 1, 0.772549, 1,
-0.1101379, -1.072716, -2.463565, 0, 1, 0.7764706, 1,
-0.1020978, 1.025399, -1.132994, 0, 1, 0.7843137, 1,
-0.1004055, 1.299215, -0.8390593, 0, 1, 0.7882353, 1,
-0.097739, 1.816643, 0.4799196, 0, 1, 0.7960784, 1,
-0.09012449, 0.08522768, -0.7044672, 0, 1, 0.8039216, 1,
-0.08929983, -0.4871724, -0.9985859, 0, 1, 0.8078431, 1,
-0.08899261, -1.085293, -4.535646, 0, 1, 0.8156863, 1,
-0.08736239, -0.1363164, -0.2550396, 0, 1, 0.8196079, 1,
-0.08506958, 0.8064619, 0.3802519, 0, 1, 0.827451, 1,
-0.08468602, -1.200545, -4.592424, 0, 1, 0.8313726, 1,
-0.08464119, -0.8635233, -3.444605, 0, 1, 0.8392157, 1,
-0.08427811, -0.01336442, -1.198719, 0, 1, 0.8431373, 1,
-0.07971895, 1.042673, -0.7529054, 0, 1, 0.8509804, 1,
-0.07669862, 1.556235, -0.9530494, 0, 1, 0.854902, 1,
-0.07582007, 1.52601, 0.2651654, 0, 1, 0.8627451, 1,
-0.07464372, 1.25262, -1.301557, 0, 1, 0.8666667, 1,
-0.07187706, 0.1471275, 0.563933, 0, 1, 0.8745098, 1,
-0.07081301, 0.9054481, 1.432861, 0, 1, 0.8784314, 1,
-0.06848119, 0.07135724, 0.8953096, 0, 1, 0.8862745, 1,
-0.06471241, 0.6544057, 0.08897202, 0, 1, 0.8901961, 1,
-0.06008472, 1.283926, 2.285103, 0, 1, 0.8980392, 1,
-0.05816865, -0.54141, -3.563701, 0, 1, 0.9058824, 1,
-0.05587657, 1.292394, -0.5579979, 0, 1, 0.9098039, 1,
-0.05577623, 0.3886015, -0.03264634, 0, 1, 0.9176471, 1,
-0.0548959, -0.1165445, -0.7654434, 0, 1, 0.9215686, 1,
-0.05122552, 0.7109396, -0.4522411, 0, 1, 0.9294118, 1,
-0.04556047, -0.7164612, -3.627481, 0, 1, 0.9333333, 1,
-0.03962289, -0.637897, -2.953649, 0, 1, 0.9411765, 1,
-0.03911452, 0.2182966, 0.622472, 0, 1, 0.945098, 1,
-0.03908617, -0.7054935, -4.274267, 0, 1, 0.9529412, 1,
-0.03861801, -0.5188688, -3.280638, 0, 1, 0.9568627, 1,
-0.03553975, 0.3355, 0.05394498, 0, 1, 0.9647059, 1,
-0.03319314, -0.5696022, -3.014563, 0, 1, 0.9686275, 1,
-0.0313346, -0.7919401, -3.138582, 0, 1, 0.9764706, 1,
-0.03090978, 0.3209612, 0.113916, 0, 1, 0.9803922, 1,
-0.02904461, -1.210678, -2.12229, 0, 1, 0.9882353, 1,
-0.02239733, -0.2811508, -2.970234, 0, 1, 0.9921569, 1,
-0.01538372, 0.02027117, 0.1039183, 0, 1, 1, 1,
-0.01472406, -0.4178885, -4.997472, 0, 0.9921569, 1, 1,
-0.0117739, -2.428983, -3.086513, 0, 0.9882353, 1, 1,
-0.004865159, 0.4557863, 1.240293, 0, 0.9803922, 1, 1,
-0.0007473506, -0.7151228, -3.938572, 0, 0.9764706, 1, 1,
-0.0005746008, -0.5092494, -3.82692, 0, 0.9686275, 1, 1,
-0.0004377901, -0.775155, -2.086779, 0, 0.9647059, 1, 1,
0.002861161, -0.9428195, 2.745836, 0, 0.9568627, 1, 1,
0.009034346, 0.7398012, -0.1426081, 0, 0.9529412, 1, 1,
0.009762358, -0.1143776, 4.155849, 0, 0.945098, 1, 1,
0.01167419, -2.013604, 3.106122, 0, 0.9411765, 1, 1,
0.01228601, -0.7061066, 0.664858, 0, 0.9333333, 1, 1,
0.01336592, -1.32171, 2.311808, 0, 0.9294118, 1, 1,
0.01343023, -0.05753914, 3.395883, 0, 0.9215686, 1, 1,
0.01470608, -0.6497275, 2.263644, 0, 0.9176471, 1, 1,
0.01991094, 0.0260154, -0.05957954, 0, 0.9098039, 1, 1,
0.02011288, 1.03408, -1.914438, 0, 0.9058824, 1, 1,
0.02664575, 0.4312886, -0.13408, 0, 0.8980392, 1, 1,
0.0266942, 0.7632027, 1.55016, 0, 0.8901961, 1, 1,
0.02961438, -0.4590016, 3.995326, 0, 0.8862745, 1, 1,
0.02965036, 0.6340623, 0.01035166, 0, 0.8784314, 1, 1,
0.03767863, 1.071781, 0.4098688, 0, 0.8745098, 1, 1,
0.04459935, 0.7575564, 0.7031508, 0, 0.8666667, 1, 1,
0.04659745, -1.896802, 2.617337, 0, 0.8627451, 1, 1,
0.04830001, -1.133156, 4.584526, 0, 0.854902, 1, 1,
0.05080437, 0.007433555, 1.152967, 0, 0.8509804, 1, 1,
0.0524612, -0.7045459, 4.38199, 0, 0.8431373, 1, 1,
0.05406239, 0.08340657, -1.093333, 0, 0.8392157, 1, 1,
0.05687371, 0.1891043, -0.4398235, 0, 0.8313726, 1, 1,
0.05726701, 0.3428274, -0.1079063, 0, 0.827451, 1, 1,
0.05919627, 1.076113, -1.910809, 0, 0.8196079, 1, 1,
0.06037424, 0.1958417, -1.509724, 0, 0.8156863, 1, 1,
0.06294128, -1.591371, 2.724978, 0, 0.8078431, 1, 1,
0.06385453, 1.000195, 0.2121359, 0, 0.8039216, 1, 1,
0.06788681, -0.8174172, 3.328027, 0, 0.7960784, 1, 1,
0.06955192, -0.8749584, 3.531444, 0, 0.7882353, 1, 1,
0.07367496, -0.3517298, 3.796453, 0, 0.7843137, 1, 1,
0.07650712, -1.299037, 4.768257, 0, 0.7764706, 1, 1,
0.08319344, 1.166272, 0.3003718, 0, 0.772549, 1, 1,
0.08423274, -0.1028436, 1.814395, 0, 0.7647059, 1, 1,
0.08782343, 0.1072086, 1.760732, 0, 0.7607843, 1, 1,
0.0883956, 0.1343931, 0.7612914, 0, 0.7529412, 1, 1,
0.08946894, -0.8939124, 3.060167, 0, 0.7490196, 1, 1,
0.09073281, -0.8297811, 3.49518, 0, 0.7411765, 1, 1,
0.09246971, -0.2644759, 3.43399, 0, 0.7372549, 1, 1,
0.1042661, -0.2925054, 2.573811, 0, 0.7294118, 1, 1,
0.1082127, 0.6355407, 0.4958534, 0, 0.7254902, 1, 1,
0.1094168, 0.1078569, 0.530599, 0, 0.7176471, 1, 1,
0.1163745, -0.4896271, 2.71203, 0, 0.7137255, 1, 1,
0.1163857, 2.264441, -2.09799, 0, 0.7058824, 1, 1,
0.1173574, -0.4477947, 2.116593, 0, 0.6980392, 1, 1,
0.1174207, -0.8405749, 3.367316, 0, 0.6941177, 1, 1,
0.1193618, -1.023451, 3.245919, 0, 0.6862745, 1, 1,
0.1228617, -1.689513, 3.638001, 0, 0.682353, 1, 1,
0.1259087, 0.1740697, -0.1875834, 0, 0.6745098, 1, 1,
0.1277987, 0.8595753, -0.3658407, 0, 0.6705883, 1, 1,
0.1324638, -0.1088096, 2.802058, 0, 0.6627451, 1, 1,
0.1332681, 2.696869, -1.906367, 0, 0.6588235, 1, 1,
0.1380242, 0.7346144, 0.1891459, 0, 0.6509804, 1, 1,
0.1402306, -0.3056162, 2.033542, 0, 0.6470588, 1, 1,
0.1411465, -0.4195405, 2.893653, 0, 0.6392157, 1, 1,
0.1418047, -0.07469978, 0.2589462, 0, 0.6352941, 1, 1,
0.1426817, -1.136557, 3.87842, 0, 0.627451, 1, 1,
0.1466002, 0.04929685, 1.863228, 0, 0.6235294, 1, 1,
0.1475241, -0.5130551, 2.563424, 0, 0.6156863, 1, 1,
0.1615668, -0.8083762, 3.135253, 0, 0.6117647, 1, 1,
0.1645121, -1.234105, 3.513332, 0, 0.6039216, 1, 1,
0.1664621, 1.176625, -0.186416, 0, 0.5960785, 1, 1,
0.1701491, 0.4452911, -0.1950619, 0, 0.5921569, 1, 1,
0.1706999, -0.3767376, 4.215785, 0, 0.5843138, 1, 1,
0.1721457, -1.757586, 3.365953, 0, 0.5803922, 1, 1,
0.1734444, 0.5905032, 0.357022, 0, 0.572549, 1, 1,
0.17804, -0.4965589, 3.17299, 0, 0.5686275, 1, 1,
0.1839635, 0.9179494, -0.211084, 0, 0.5607843, 1, 1,
0.1879996, -1.19465, 4.340893, 0, 0.5568628, 1, 1,
0.1884712, 0.4334288, 1.42121, 0, 0.5490196, 1, 1,
0.1888442, -1.106116, 4.256495, 0, 0.5450981, 1, 1,
0.1903966, -0.1972313, 2.871743, 0, 0.5372549, 1, 1,
0.1912721, -0.7722356, 3.064897, 0, 0.5333334, 1, 1,
0.1932968, -0.1130568, 1.281293, 0, 0.5254902, 1, 1,
0.1937507, -1.837946, 4.278607, 0, 0.5215687, 1, 1,
0.1969891, 1.18161, -0.9436909, 0, 0.5137255, 1, 1,
0.1980819, 0.6351491, 0.8329002, 0, 0.509804, 1, 1,
0.2065196, -1.415153, 3.321075, 0, 0.5019608, 1, 1,
0.2080707, 1.335425, -0.4677813, 0, 0.4941176, 1, 1,
0.2092801, 0.7790383, 1.822196, 0, 0.4901961, 1, 1,
0.2097667, 0.9835671, 0.5012546, 0, 0.4823529, 1, 1,
0.210536, 1.22248, -0.806489, 0, 0.4784314, 1, 1,
0.2120137, 0.5605322, -0.3180269, 0, 0.4705882, 1, 1,
0.2127899, -1.858084, 3.102101, 0, 0.4666667, 1, 1,
0.2142286, -1.789619, 3.503139, 0, 0.4588235, 1, 1,
0.2214262, 0.348694, 1.129695, 0, 0.454902, 1, 1,
0.2220346, -0.2321144, 3.786356, 0, 0.4470588, 1, 1,
0.2269104, -0.300853, 1.53959, 0, 0.4431373, 1, 1,
0.2269819, -1.534053, 3.099412, 0, 0.4352941, 1, 1,
0.2292353, 0.5046991, 0.8693033, 0, 0.4313726, 1, 1,
0.234196, 0.2942708, 0.554748, 0, 0.4235294, 1, 1,
0.2465566, -1.004099, 4.061244, 0, 0.4196078, 1, 1,
0.2517916, -3.461705, 2.843667, 0, 0.4117647, 1, 1,
0.2529139, -0.5575808, 2.986792, 0, 0.4078431, 1, 1,
0.258076, -0.2084257, 1.918189, 0, 0.4, 1, 1,
0.2587512, -0.34717, 4.366107, 0, 0.3921569, 1, 1,
0.2660815, 0.195753, 0.179178, 0, 0.3882353, 1, 1,
0.2675132, 0.5108724, -1.898432, 0, 0.3803922, 1, 1,
0.2702379, -0.5162604, 2.887049, 0, 0.3764706, 1, 1,
0.2745513, 0.5040249, 2.020558, 0, 0.3686275, 1, 1,
0.2783121, 0.08540365, 2.919327, 0, 0.3647059, 1, 1,
0.2795959, -1.850553, 2.399793, 0, 0.3568628, 1, 1,
0.2826542, -0.7656801, 3.206766, 0, 0.3529412, 1, 1,
0.2832928, 0.821249, -0.2735049, 0, 0.345098, 1, 1,
0.286515, 1.026337, -0.1562471, 0, 0.3411765, 1, 1,
0.2901367, 0.330355, -0.210288, 0, 0.3333333, 1, 1,
0.2935524, -0.7361381, 2.164712, 0, 0.3294118, 1, 1,
0.2935803, 0.2301824, 1.124677, 0, 0.3215686, 1, 1,
0.2964769, 1.355085, 0.110137, 0, 0.3176471, 1, 1,
0.3008242, -1.012225, 2.818932, 0, 0.3098039, 1, 1,
0.3098749, 0.7367979, 1.37315, 0, 0.3058824, 1, 1,
0.3112076, 0.6413628, -0.02654783, 0, 0.2980392, 1, 1,
0.3124241, 0.1078327, 0.793759, 0, 0.2901961, 1, 1,
0.313673, -0.023804, 1.159336, 0, 0.2862745, 1, 1,
0.313914, -0.123686, 0.2836421, 0, 0.2784314, 1, 1,
0.3139912, -0.8069187, 1.56434, 0, 0.2745098, 1, 1,
0.3155998, -0.1751742, 4.608882, 0, 0.2666667, 1, 1,
0.3198165, -1.445136, 3.680365, 0, 0.2627451, 1, 1,
0.3198786, 0.06675915, 1.98604, 0, 0.254902, 1, 1,
0.3277185, 0.1680679, 0.2536606, 0, 0.2509804, 1, 1,
0.329023, 0.4679275, 1.431709, 0, 0.2431373, 1, 1,
0.3292564, 0.1158107, 1.160771, 0, 0.2392157, 1, 1,
0.3330915, -0.2939559, 2.793725, 0, 0.2313726, 1, 1,
0.3332195, -0.528556, 3.584437, 0, 0.227451, 1, 1,
0.3362414, 0.6268887, -0.0313141, 0, 0.2196078, 1, 1,
0.3369595, -0.4058403, 1.077397, 0, 0.2156863, 1, 1,
0.3378617, 0.1900902, 0.8115644, 0, 0.2078431, 1, 1,
0.3434287, -0.1120061, 1.313414, 0, 0.2039216, 1, 1,
0.3501229, -0.4820936, 0.4121744, 0, 0.1960784, 1, 1,
0.3520631, -2.781062, 2.438239, 0, 0.1882353, 1, 1,
0.3540983, 0.3560496, 2.255592, 0, 0.1843137, 1, 1,
0.3578421, -1.028111, 1.100103, 0, 0.1764706, 1, 1,
0.3616151, 0.6162772, -1.316476, 0, 0.172549, 1, 1,
0.3624483, -0.1870755, 1.440665, 0, 0.1647059, 1, 1,
0.3629194, 0.8149126, 0.9195585, 0, 0.1607843, 1, 1,
0.3636448, 0.9242197, 0.8899114, 0, 0.1529412, 1, 1,
0.3652341, -0.08243616, 1.886086, 0, 0.1490196, 1, 1,
0.3683971, -0.7904792, 2.836014, 0, 0.1411765, 1, 1,
0.369074, 2.059148, 0.9187707, 0, 0.1372549, 1, 1,
0.3694952, -0.4004901, 2.361407, 0, 0.1294118, 1, 1,
0.3699001, 0.3613205, 0.603002, 0, 0.1254902, 1, 1,
0.3715367, -1.578439, 3.118539, 0, 0.1176471, 1, 1,
0.380195, -0.617843, 1.867915, 0, 0.1137255, 1, 1,
0.3815163, 0.7264496, 0.9850899, 0, 0.1058824, 1, 1,
0.3823106, 0.8698115, -0.4282758, 0, 0.09803922, 1, 1,
0.384993, 0.2208253, 1.127069, 0, 0.09411765, 1, 1,
0.3856375, -0.4352486, 0.867029, 0, 0.08627451, 1, 1,
0.3900536, 0.3131953, 0.7253879, 0, 0.08235294, 1, 1,
0.394395, -0.4759272, 3.242793, 0, 0.07450981, 1, 1,
0.3975224, 0.7443021, 1.50575, 0, 0.07058824, 1, 1,
0.4013267, -0.5022265, 1.287314, 0, 0.0627451, 1, 1,
0.4020056, 1.511087, 0.2365004, 0, 0.05882353, 1, 1,
0.4034191, -1.211437, 3.035061, 0, 0.05098039, 1, 1,
0.4048574, 0.3921714, 1.239767, 0, 0.04705882, 1, 1,
0.4086946, -0.269532, 2.180342, 0, 0.03921569, 1, 1,
0.4107272, 0.6045657, 0.7573119, 0, 0.03529412, 1, 1,
0.4129451, 1.093177, 0.9024256, 0, 0.02745098, 1, 1,
0.4134309, -0.1362811, 1.254603, 0, 0.02352941, 1, 1,
0.4134889, -0.3002371, 2.071613, 0, 0.01568628, 1, 1,
0.4178945, -2.472099, 3.285385, 0, 0.01176471, 1, 1,
0.4185886, 0.06602342, 2.138479, 0, 0.003921569, 1, 1,
0.4241034, -1.149269, 2.769686, 0.003921569, 0, 1, 1,
0.4259034, 0.3513722, -0.01289701, 0.007843138, 0, 1, 1,
0.4275594, 0.7124331, 0.4117836, 0.01568628, 0, 1, 1,
0.4278238, 1.904102, 0.04547384, 0.01960784, 0, 1, 1,
0.4302641, 0.1274697, 0.09554881, 0.02745098, 0, 1, 1,
0.4311267, -1.135479, 3.230797, 0.03137255, 0, 1, 1,
0.433791, -0.1052302, 2.451803, 0.03921569, 0, 1, 1,
0.4366424, -0.8225859, 1.805411, 0.04313726, 0, 1, 1,
0.4380616, 0.1390107, 0.3222204, 0.05098039, 0, 1, 1,
0.4383776, 1.423254, 0.5308498, 0.05490196, 0, 1, 1,
0.4508645, 0.1461883, 1.709491, 0.0627451, 0, 1, 1,
0.454751, 0.3912854, 0.6553892, 0.06666667, 0, 1, 1,
0.4564167, 0.02393048, 1.000221, 0.07450981, 0, 1, 1,
0.4584807, -3.37101, 1.936807, 0.07843138, 0, 1, 1,
0.4637566, -0.7921232, 2.418081, 0.08627451, 0, 1, 1,
0.4683801, -1.544467, 3.266658, 0.09019608, 0, 1, 1,
0.4694021, 0.3010436, 2.479368, 0.09803922, 0, 1, 1,
0.4767208, 2.692052, -0.05324788, 0.1058824, 0, 1, 1,
0.4779939, 0.5793436, 1.775255, 0.1098039, 0, 1, 1,
0.4846336, -0.5966113, 2.5871, 0.1176471, 0, 1, 1,
0.4871352, -1.46932, 2.622482, 0.1215686, 0, 1, 1,
0.4893332, 1.754012, 1.212648, 0.1294118, 0, 1, 1,
0.4914544, 0.8450487, -0.8926536, 0.1333333, 0, 1, 1,
0.4921559, 0.7604192, -0.01885164, 0.1411765, 0, 1, 1,
0.5017068, -0.06754731, 1.902703, 0.145098, 0, 1, 1,
0.5083712, -0.09727512, 2.320324, 0.1529412, 0, 1, 1,
0.5083981, -0.7162182, 2.360338, 0.1568628, 0, 1, 1,
0.5101839, 1.488474, 1.751853, 0.1647059, 0, 1, 1,
0.5114022, -0.6307287, 3.011026, 0.1686275, 0, 1, 1,
0.5121012, -1.362923, 4.822268, 0.1764706, 0, 1, 1,
0.5171898, -0.7548993, 3.453552, 0.1803922, 0, 1, 1,
0.5176938, -0.2544869, 4.205484, 0.1882353, 0, 1, 1,
0.5202504, 0.06872231, 2.404623, 0.1921569, 0, 1, 1,
0.5265528, -1.516995, 3.01028, 0.2, 0, 1, 1,
0.527532, -0.1418227, 1.692982, 0.2078431, 0, 1, 1,
0.5310705, -0.1391878, 1.872659, 0.2117647, 0, 1, 1,
0.539596, 0.4879606, 1.40859, 0.2196078, 0, 1, 1,
0.5417405, -1.132451, 4.115638, 0.2235294, 0, 1, 1,
0.5426705, -0.5529145, 2.175075, 0.2313726, 0, 1, 1,
0.5439894, -0.9246171, 4.19479, 0.2352941, 0, 1, 1,
0.5463549, 0.6211594, 1.526983, 0.2431373, 0, 1, 1,
0.5475126, -0.7519801, 4.074256, 0.2470588, 0, 1, 1,
0.5486039, 0.51532, 2.438448, 0.254902, 0, 1, 1,
0.5552192, -0.6061849, 2.637229, 0.2588235, 0, 1, 1,
0.5623388, 1.095137, 0.1198591, 0.2666667, 0, 1, 1,
0.5666207, 0.3477368, 1.334218, 0.2705882, 0, 1, 1,
0.5671505, -0.6940424, 3.862591, 0.2784314, 0, 1, 1,
0.5680912, 0.6815838, -0.09739728, 0.282353, 0, 1, 1,
0.5689287, -2.819622, 3.588658, 0.2901961, 0, 1, 1,
0.5747618, 0.8890188, 0.9068463, 0.2941177, 0, 1, 1,
0.5820156, 0.4623063, 1.048932, 0.3019608, 0, 1, 1,
0.5848821, -0.6121405, 3.125746, 0.3098039, 0, 1, 1,
0.5865735, 0.4705729, 1.434593, 0.3137255, 0, 1, 1,
0.586886, -1.149345, 1.970364, 0.3215686, 0, 1, 1,
0.5881753, 0.4441577, 3.145314, 0.3254902, 0, 1, 1,
0.5930668, -0.6878598, 2.600607, 0.3333333, 0, 1, 1,
0.5932222, -0.6563017, 2.831895, 0.3372549, 0, 1, 1,
0.5947804, -0.1125582, 1.532289, 0.345098, 0, 1, 1,
0.5959724, 0.1579558, 1.939552, 0.3490196, 0, 1, 1,
0.5976639, 0.5314695, 0.6617892, 0.3568628, 0, 1, 1,
0.6145103, -2.868457, 3.669717, 0.3607843, 0, 1, 1,
0.6155162, -0.8100758, 3.502485, 0.3686275, 0, 1, 1,
0.6175182, -1.305037, 3.050146, 0.372549, 0, 1, 1,
0.6201309, -0.4485765, 2.197964, 0.3803922, 0, 1, 1,
0.6229258, 0.881705, -0.6130173, 0.3843137, 0, 1, 1,
0.6246069, -0.2471204, 3.157975, 0.3921569, 0, 1, 1,
0.6261165, 0.9811113, 0.5440826, 0.3960784, 0, 1, 1,
0.626537, 0.421267, 0.7187687, 0.4039216, 0, 1, 1,
0.6288105, 2.07843, -0.3090993, 0.4117647, 0, 1, 1,
0.6371895, 1.261355, -0.15929, 0.4156863, 0, 1, 1,
0.6402235, 0.1856807, 0.5360256, 0.4235294, 0, 1, 1,
0.6507579, 0.7546556, -0.5769755, 0.427451, 0, 1, 1,
0.6713281, 0.8246238, 2.08567, 0.4352941, 0, 1, 1,
0.6724778, 0.1431476, 1.302744, 0.4392157, 0, 1, 1,
0.6725778, 1.880945, 2.510328, 0.4470588, 0, 1, 1,
0.6726113, -0.560742, 0.9582731, 0.4509804, 0, 1, 1,
0.6837524, 0.7765954, -0.07144463, 0.4588235, 0, 1, 1,
0.6857208, 1.909304, 1.357298, 0.4627451, 0, 1, 1,
0.6861788, 0.929992, -0.6285056, 0.4705882, 0, 1, 1,
0.6872653, -0.7977417, 1.800494, 0.4745098, 0, 1, 1,
0.6883975, -0.9484354, 1.66725, 0.4823529, 0, 1, 1,
0.6936789, 0.1512066, 1.20493, 0.4862745, 0, 1, 1,
0.6942762, 0.2363372, -0.9912107, 0.4941176, 0, 1, 1,
0.695818, 0.07200045, -0.05642005, 0.5019608, 0, 1, 1,
0.6965598, 0.7426182, 0.7668506, 0.5058824, 0, 1, 1,
0.696788, -0.4942099, 3.31294, 0.5137255, 0, 1, 1,
0.6982059, 1.186163, -0.1042643, 0.5176471, 0, 1, 1,
0.7042175, -1.242653, 2.713443, 0.5254902, 0, 1, 1,
0.7043092, -1.1538, 4.123938, 0.5294118, 0, 1, 1,
0.7044411, -1.210417, 2.188847, 0.5372549, 0, 1, 1,
0.7088413, 2.315779, -0.03000574, 0.5411765, 0, 1, 1,
0.7216406, 0.4685165, 1.220325, 0.5490196, 0, 1, 1,
0.7221853, -1.458086, 3.060249, 0.5529412, 0, 1, 1,
0.7247764, -0.9517511, 3.408731, 0.5607843, 0, 1, 1,
0.7255787, -2.017109, 3.660979, 0.5647059, 0, 1, 1,
0.7256005, 0.1212594, 2.284025, 0.572549, 0, 1, 1,
0.7271611, 0.2695081, 0.3312899, 0.5764706, 0, 1, 1,
0.7290133, 1.626554, 0.3419638, 0.5843138, 0, 1, 1,
0.7314347, -0.8777726, 1.891917, 0.5882353, 0, 1, 1,
0.7371343, 2.34893, -0.01703545, 0.5960785, 0, 1, 1,
0.7437803, -1.388638, 2.738015, 0.6039216, 0, 1, 1,
0.7438776, 0.0314153, 0.8202269, 0.6078432, 0, 1, 1,
0.7481085, 1.25001, 0.01818896, 0.6156863, 0, 1, 1,
0.7552943, -0.05355483, 2.220261, 0.6196079, 0, 1, 1,
0.756718, 1.118227, 0.2043994, 0.627451, 0, 1, 1,
0.757654, -1.238547, 1.965847, 0.6313726, 0, 1, 1,
0.7580377, 0.6033828, 2.411428, 0.6392157, 0, 1, 1,
0.7688857, -0.03627247, 1.363735, 0.6431373, 0, 1, 1,
0.770941, 1.196616, 0.1719367, 0.6509804, 0, 1, 1,
0.771212, 0.6716913, 0.7199611, 0.654902, 0, 1, 1,
0.7749089, -0.4793683, 2.502006, 0.6627451, 0, 1, 1,
0.774972, 0.2764157, 1.8912, 0.6666667, 0, 1, 1,
0.7788183, -0.4572235, 1.160242, 0.6745098, 0, 1, 1,
0.7794567, 0.5113439, -1.155821, 0.6784314, 0, 1, 1,
0.785454, -0.4341052, 0.8666294, 0.6862745, 0, 1, 1,
0.787479, 1.220452, 1.347066, 0.6901961, 0, 1, 1,
0.7886205, -0.4098763, 2.050496, 0.6980392, 0, 1, 1,
0.7957094, -0.3730874, 1.687146, 0.7058824, 0, 1, 1,
0.8048468, 0.68244, 1.757396, 0.7098039, 0, 1, 1,
0.8073411, -1.068934, 1.605766, 0.7176471, 0, 1, 1,
0.8082302, -1.660167, 1.79258, 0.7215686, 0, 1, 1,
0.8178533, 1.32702, 1.480865, 0.7294118, 0, 1, 1,
0.8196375, -0.2506053, 2.248572, 0.7333333, 0, 1, 1,
0.8218827, -0.8064132, 3.562301, 0.7411765, 0, 1, 1,
0.8229156, -0.8091576, 2.630491, 0.7450981, 0, 1, 1,
0.831566, 1.249702, 1.367321, 0.7529412, 0, 1, 1,
0.8324259, 1.872311, 0.8410398, 0.7568628, 0, 1, 1,
0.8324401, 0.9987657, 1.337626, 0.7647059, 0, 1, 1,
0.8410837, -0.1269109, 1.571742, 0.7686275, 0, 1, 1,
0.8460398, 0.5965941, 2.286763, 0.7764706, 0, 1, 1,
0.8470854, 1.645026, -1.272375, 0.7803922, 0, 1, 1,
0.8492222, -0.4711524, 3.55622, 0.7882353, 0, 1, 1,
0.8513362, 0.1797849, 0.6416494, 0.7921569, 0, 1, 1,
0.856862, -1.460871, 0.8498589, 0.8, 0, 1, 1,
0.8582637, -0.5287722, 0.7594047, 0.8078431, 0, 1, 1,
0.8626498, 0.6304593, 0.18175, 0.8117647, 0, 1, 1,
0.8636209, 0.08157998, 2.075544, 0.8196079, 0, 1, 1,
0.8646446, 0.5772532, 2.986376, 0.8235294, 0, 1, 1,
0.8657863, 0.200158, 2.470189, 0.8313726, 0, 1, 1,
0.8713049, -0.3911418, 1.03963, 0.8352941, 0, 1, 1,
0.8729249, -0.7406062, 3.887161, 0.8431373, 0, 1, 1,
0.8807141, -1.458908, 2.886906, 0.8470588, 0, 1, 1,
0.8808452, -0.9081269, 0.1996726, 0.854902, 0, 1, 1,
0.887822, 2.692736, 1.226658, 0.8588235, 0, 1, 1,
0.8938139, -0.7543316, 1.613633, 0.8666667, 0, 1, 1,
0.8943105, 0.2164161, 1.574834, 0.8705882, 0, 1, 1,
0.8999981, 2.21055, -0.08803622, 0.8784314, 0, 1, 1,
0.9008019, 2.105843, 0.4470212, 0.8823529, 0, 1, 1,
0.9118117, -0.7110751, 2.712782, 0.8901961, 0, 1, 1,
0.9171944, 0.09137386, 1.386979, 0.8941177, 0, 1, 1,
0.9209309, -0.08963352, 1.658276, 0.9019608, 0, 1, 1,
0.92237, 0.7494619, 1.097721, 0.9098039, 0, 1, 1,
0.9278141, -0.7760834, 2.500882, 0.9137255, 0, 1, 1,
0.9329056, -0.6346826, 0.6216758, 0.9215686, 0, 1, 1,
0.9333411, 0.07707943, 0.8935859, 0.9254902, 0, 1, 1,
0.9588097, -0.3933653, 3.073238, 0.9333333, 0, 1, 1,
0.9627366, -0.04695646, 2.964156, 0.9372549, 0, 1, 1,
0.9673473, -0.8072758, 1.759081, 0.945098, 0, 1, 1,
0.9711374, -1.088902, 2.183275, 0.9490196, 0, 1, 1,
0.9754189, 1.611382, 0.385676, 0.9568627, 0, 1, 1,
0.9798207, 0.1731137, 1.145115, 0.9607843, 0, 1, 1,
0.9812629, 0.3868416, 1.830686, 0.9686275, 0, 1, 1,
0.9823323, 0.2291037, 0.9280713, 0.972549, 0, 1, 1,
0.9890398, -0.7042565, 2.427393, 0.9803922, 0, 1, 1,
1.001285, 0.7318509, 1.977748, 0.9843137, 0, 1, 1,
1.00152, -1.112809, 3.077163, 0.9921569, 0, 1, 1,
1.00203, 1.500928, 1.070525, 0.9960784, 0, 1, 1,
1.002841, 0.4706042, -0.1281452, 1, 0, 0.9960784, 1,
1.003244, 0.6918288, 1.865327, 1, 0, 0.9882353, 1,
1.004004, 0.5446162, 1.22942, 1, 0, 0.9843137, 1,
1.008623, 0.5806645, 2.441647, 1, 0, 0.9764706, 1,
1.008837, -1.955963, 1.084536, 1, 0, 0.972549, 1,
1.00947, -1.385666, 0.3677712, 1, 0, 0.9647059, 1,
1.010243, 0.6977774, 1.205469, 1, 0, 0.9607843, 1,
1.014233, -1.740199, 3.876785, 1, 0, 0.9529412, 1,
1.016103, -1.209318, 4.573767, 1, 0, 0.9490196, 1,
1.024248, -0.09112492, 0.7153772, 1, 0, 0.9411765, 1,
1.03153, -0.7844248, 1.338289, 1, 0, 0.9372549, 1,
1.038363, 0.03314925, 2.353341, 1, 0, 0.9294118, 1,
1.038638, 0.9708372, 1.368949, 1, 0, 0.9254902, 1,
1.039238, 0.1727135, 1.242751, 1, 0, 0.9176471, 1,
1.044618, 0.341772, 3.23089, 1, 0, 0.9137255, 1,
1.045091, -0.8576179, 0.813673, 1, 0, 0.9058824, 1,
1.056211, 0.5716553, 0.8204212, 1, 0, 0.9019608, 1,
1.059706, 0.4896451, 2.261637, 1, 0, 0.8941177, 1,
1.067468, 0.541105, 0.5686076, 1, 0, 0.8862745, 1,
1.069365, 0.3283954, 1.951522, 1, 0, 0.8823529, 1,
1.072794, -1.883751, 2.578488, 1, 0, 0.8745098, 1,
1.076897, 2.190848, 1.338258, 1, 0, 0.8705882, 1,
1.083054, -0.5448393, 3.523972, 1, 0, 0.8627451, 1,
1.086903, 1.675042, -0.7334151, 1, 0, 0.8588235, 1,
1.098291, -0.1988529, 1.642629, 1, 0, 0.8509804, 1,
1.11385, -0.4850391, 4.408, 1, 0, 0.8470588, 1,
1.123993, 1.661556, -0.1046618, 1, 0, 0.8392157, 1,
1.124924, -0.7261401, 0.1794111, 1, 0, 0.8352941, 1,
1.125706, 0.6177291, 1.820812, 1, 0, 0.827451, 1,
1.136252, -0.112977, 2.42453, 1, 0, 0.8235294, 1,
1.145212, -0.5043776, 1.694285, 1, 0, 0.8156863, 1,
1.158858, -0.3681785, 2.259338, 1, 0, 0.8117647, 1,
1.1612, 1.390433, 1.457034, 1, 0, 0.8039216, 1,
1.165378, 0.3431055, 1.404906, 1, 0, 0.7960784, 1,
1.174366, 1.400879, -0.1573543, 1, 0, 0.7921569, 1,
1.177893, 0.5916903, 2.806237, 1, 0, 0.7843137, 1,
1.178709, -1.196678, 2.602509, 1, 0, 0.7803922, 1,
1.19692, 1.477076, 1.580105, 1, 0, 0.772549, 1,
1.198527, -1.970899, 2.218473, 1, 0, 0.7686275, 1,
1.2034, 0.1910714, 1.243762, 1, 0, 0.7607843, 1,
1.214301, 0.9909465, 0.3287573, 1, 0, 0.7568628, 1,
1.217829, -0.834774, 1.454956, 1, 0, 0.7490196, 1,
1.219184, -1.407494, 2.562577, 1, 0, 0.7450981, 1,
1.229961, -1.288599, 2.312962, 1, 0, 0.7372549, 1,
1.230363, -0.649452, 1.656256, 1, 0, 0.7333333, 1,
1.238242, 0.4835921, 1.411637, 1, 0, 0.7254902, 1,
1.247547, 1.123637, 0.6347266, 1, 0, 0.7215686, 1,
1.247555, -0.8391222, 1.886944, 1, 0, 0.7137255, 1,
1.248549, -0.2974753, 1.587829, 1, 0, 0.7098039, 1,
1.256351, -0.9071624, 1.824254, 1, 0, 0.7019608, 1,
1.259064, -0.8545997, 3.758972, 1, 0, 0.6941177, 1,
1.264673, -0.406557, 2.79331, 1, 0, 0.6901961, 1,
1.270761, -0.1631954, 2.289877, 1, 0, 0.682353, 1,
1.271225, -1.437804, 3.966458, 1, 0, 0.6784314, 1,
1.280314, -0.8379708, 2.005505, 1, 0, 0.6705883, 1,
1.287615, -0.1101277, 2.903908, 1, 0, 0.6666667, 1,
1.288979, 1.924882, 0.1406361, 1, 0, 0.6588235, 1,
1.290533, 0.7279404, 1.644024, 1, 0, 0.654902, 1,
1.292956, -2.191569, 1.412631, 1, 0, 0.6470588, 1,
1.294783, 2.029153, 1.260486, 1, 0, 0.6431373, 1,
1.302342, -2.273618, 1.945361, 1, 0, 0.6352941, 1,
1.315242, 0.9700957, 0.785046, 1, 0, 0.6313726, 1,
1.317619, -0.7031691, 1.69247, 1, 0, 0.6235294, 1,
1.320981, -1.573216, 3.197241, 1, 0, 0.6196079, 1,
1.321694, 0.5188213, -0.7397249, 1, 0, 0.6117647, 1,
1.333936, 1.007879, -0.5349805, 1, 0, 0.6078432, 1,
1.349209, -0.3984878, 1.367481, 1, 0, 0.6, 1,
1.364551, -0.9935352, 1.323243, 1, 0, 0.5921569, 1,
1.38129, -0.2857109, 2.348361, 1, 0, 0.5882353, 1,
1.38375, 0.2030066, 0.1247705, 1, 0, 0.5803922, 1,
1.384365, -0.6411064, 1.503286, 1, 0, 0.5764706, 1,
1.387115, -0.5440518, 1.956013, 1, 0, 0.5686275, 1,
1.397962, -0.59574, 2.157888, 1, 0, 0.5647059, 1,
1.399027, -0.03506068, -0.3376836, 1, 0, 0.5568628, 1,
1.399405, 1.444606, 0.5606094, 1, 0, 0.5529412, 1,
1.401163, -0.4600353, 4.002501, 1, 0, 0.5450981, 1,
1.403446, -0.9942288, 1.494987, 1, 0, 0.5411765, 1,
1.409087, 2.225859, 1.298159, 1, 0, 0.5333334, 1,
1.417141, 0.1060631, 1.776138, 1, 0, 0.5294118, 1,
1.422496, -0.3048928, 1.558371, 1, 0, 0.5215687, 1,
1.427535, 1.03003, -0.2383427, 1, 0, 0.5176471, 1,
1.434708, 0.8909428, 0.2452901, 1, 0, 0.509804, 1,
1.43884, 0.636278, 2.241629, 1, 0, 0.5058824, 1,
1.440199, 0.8690877, 1.483631, 1, 0, 0.4980392, 1,
1.445241, 0.6867883, 0.8196402, 1, 0, 0.4901961, 1,
1.445298, 0.5416525, 2.372441, 1, 0, 0.4862745, 1,
1.453368, -0.8843605, 2.299739, 1, 0, 0.4784314, 1,
1.464741, 0.915448, -1.349699, 1, 0, 0.4745098, 1,
1.476546, 2.09443, 0.2757217, 1, 0, 0.4666667, 1,
1.496629, -1.302995, 3.590936, 1, 0, 0.4627451, 1,
1.497864, -0.4852817, 2.590563, 1, 0, 0.454902, 1,
1.509428, -0.5054083, 2.23236, 1, 0, 0.4509804, 1,
1.51094, 0.2878293, 1.313108, 1, 0, 0.4431373, 1,
1.51428, 1.15606, -0.6086451, 1, 0, 0.4392157, 1,
1.522318, 1.056096, 4.382339, 1, 0, 0.4313726, 1,
1.53418, 0.1662775, 2.942362, 1, 0, 0.427451, 1,
1.538009, -0.386398, 0.5233307, 1, 0, 0.4196078, 1,
1.539902, 1.442929, -0.1567901, 1, 0, 0.4156863, 1,
1.547471, 0.5093933, 3.591922, 1, 0, 0.4078431, 1,
1.549246, -1.192698, 4.218503, 1, 0, 0.4039216, 1,
1.550041, -0.5600514, -0.2525499, 1, 0, 0.3960784, 1,
1.550048, -1.049549, 3.183296, 1, 0, 0.3882353, 1,
1.560202, -0.3384062, -0.1397709, 1, 0, 0.3843137, 1,
1.563144, -0.1085392, 1.619661, 1, 0, 0.3764706, 1,
1.571309, -0.1381726, 0.6408002, 1, 0, 0.372549, 1,
1.582638, -2.187193, 4.399103, 1, 0, 0.3647059, 1,
1.6113, 0.3032943, 1.119618, 1, 0, 0.3607843, 1,
1.615101, 0.3269381, 3.251714, 1, 0, 0.3529412, 1,
1.634686, -1.899145, 3.723865, 1, 0, 0.3490196, 1,
1.635028, 0.1095318, 1.023517, 1, 0, 0.3411765, 1,
1.660657, 0.7028015, 1.122817, 1, 0, 0.3372549, 1,
1.677921, 1.664518, 1.885897, 1, 0, 0.3294118, 1,
1.691939, -1.207252, 2.849316, 1, 0, 0.3254902, 1,
1.692273, 0.8183915, -0.4023485, 1, 0, 0.3176471, 1,
1.694587, 0.3964769, 1.304795, 1, 0, 0.3137255, 1,
1.704895, 0.2751368, 1.42604, 1, 0, 0.3058824, 1,
1.70755, 1.151478, -0.2968677, 1, 0, 0.2980392, 1,
1.710816, 0.5073754, 1.663011, 1, 0, 0.2941177, 1,
1.716065, -0.1388275, 2.220899, 1, 0, 0.2862745, 1,
1.737342, 0.8657581, 1.963657, 1, 0, 0.282353, 1,
1.747877, 1.186604, 0.5790157, 1, 0, 0.2745098, 1,
1.779061, -0.6028048, 3.703295, 1, 0, 0.2705882, 1,
1.794278, 0.023669, 1.266618, 1, 0, 0.2627451, 1,
1.800627, 0.4344366, 2.921548, 1, 0, 0.2588235, 1,
1.816619, -1.357017, 1.362546, 1, 0, 0.2509804, 1,
1.834442, -0.5823404, 2.709179, 1, 0, 0.2470588, 1,
1.846277, -2.724401, 3.029706, 1, 0, 0.2392157, 1,
1.85407, -2.318424, 3.10603, 1, 0, 0.2352941, 1,
1.858308, 0.2835002, 2.034609, 1, 0, 0.227451, 1,
1.882611, 0.335629, 1.927434, 1, 0, 0.2235294, 1,
1.896971, -1.522274, 2.388215, 1, 0, 0.2156863, 1,
1.904279, -0.4125704, 2.31342, 1, 0, 0.2117647, 1,
1.91088, 2.198228, 0.4196067, 1, 0, 0.2039216, 1,
1.917074, -0.1586612, 1.963935, 1, 0, 0.1960784, 1,
1.932412, -0.7930086, 1.720845, 1, 0, 0.1921569, 1,
1.937541, 0.2881185, -0.3004825, 1, 0, 0.1843137, 1,
1.943556, 1.097897, 0.989024, 1, 0, 0.1803922, 1,
1.98127, -1.315792, 2.70322, 1, 0, 0.172549, 1,
2.003409, -0.06550929, 3.378818, 1, 0, 0.1686275, 1,
2.006399, 0.4728235, -0.9369583, 1, 0, 0.1607843, 1,
2.019044, -1.933144, 2.677123, 1, 0, 0.1568628, 1,
2.045734, -0.2341018, 1.632562, 1, 0, 0.1490196, 1,
2.05497, -0.06737462, 2.652297, 1, 0, 0.145098, 1,
2.073179, 3.191671, 0.7170811, 1, 0, 0.1372549, 1,
2.103844, -0.08308452, 0.4445615, 1, 0, 0.1333333, 1,
2.146324, 0.8555665, 1.955156, 1, 0, 0.1254902, 1,
2.18522, 0.4210575, -0.6369162, 1, 0, 0.1215686, 1,
2.24787, -0.1825185, 2.555439, 1, 0, 0.1137255, 1,
2.29688, 0.3829685, 2.096429, 1, 0, 0.1098039, 1,
2.327292, 0.1771168, 1.474824, 1, 0, 0.1019608, 1,
2.33791, -0.7700092, 1.959448, 1, 0, 0.09411765, 1,
2.35214, 0.2226704, 0.9577492, 1, 0, 0.09019608, 1,
2.378806, 0.1321007, 2.124951, 1, 0, 0.08235294, 1,
2.401626, 0.3440478, 1.553285, 1, 0, 0.07843138, 1,
2.453971, 0.09080233, 1.606366, 1, 0, 0.07058824, 1,
2.490387, -1.171678, 1.03662, 1, 0, 0.06666667, 1,
2.534461, -0.2650661, 2.165849, 1, 0, 0.05882353, 1,
2.720051, -0.6754447, 1.63059, 1, 0, 0.05490196, 1,
2.808441, 0.147431, 0.389383, 1, 0, 0.04705882, 1,
2.81285, -0.6321054, 2.132368, 1, 0, 0.04313726, 1,
2.950761, 1.22733, 1.872419, 1, 0, 0.03529412, 1,
3.006009, 0.7975439, 1.103099, 1, 0, 0.03137255, 1,
3.008709, 0.8807543, 2.29573, 1, 0, 0.02352941, 1,
3.038004, -1.253126, 0.9415771, 1, 0, 0.01960784, 1,
3.354794, -0.8409519, 1.466222, 1, 0, 0.01176471, 1,
3.521753, -1.570505, 2.239843, 1, 0, 0.007843138, 1
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
0.2600249, -4.589453, -7.217969, 0, -0.5, 0.5, 0.5,
0.2600249, -4.589453, -7.217969, 1, -0.5, 0.5, 0.5,
0.2600249, -4.589453, -7.217969, 1, 1.5, 0.5, 0.5,
0.2600249, -4.589453, -7.217969, 0, 1.5, 0.5, 0.5
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
-4.107429, -0.135017, -7.217969, 0, -0.5, 0.5, 0.5,
-4.107429, -0.135017, -7.217969, 1, -0.5, 0.5, 0.5,
-4.107429, -0.135017, -7.217969, 1, 1.5, 0.5, 0.5,
-4.107429, -0.135017, -7.217969, 0, 1.5, 0.5, 0.5
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
-4.107429, -4.589453, -0.3253326, 0, -0.5, 0.5, 0.5,
-4.107429, -4.589453, -0.3253326, 1, -0.5, 0.5, 0.5,
-4.107429, -4.589453, -0.3253326, 1, 1.5, 0.5, 0.5,
-4.107429, -4.589453, -0.3253326, 0, 1.5, 0.5, 0.5
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
-3, -3.561506, -5.627361,
3, -3.561506, -5.627361,
-3, -3.561506, -5.627361,
-3, -3.732831, -5.892462,
-2, -3.561506, -5.627361,
-2, -3.732831, -5.892462,
-1, -3.561506, -5.627361,
-1, -3.732831, -5.892462,
0, -3.561506, -5.627361,
0, -3.732831, -5.892462,
1, -3.561506, -5.627361,
1, -3.732831, -5.892462,
2, -3.561506, -5.627361,
2, -3.732831, -5.892462,
3, -3.561506, -5.627361,
3, -3.732831, -5.892462
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
-3, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
-3, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
-3, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
-3, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
-2, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
-2, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
-2, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
-2, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
-1, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
-1, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
-1, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
-1, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
0, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
0, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
0, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
0, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
1, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
1, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
1, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
1, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
2, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
2, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
2, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
2, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5,
3, -4.07548, -6.422665, 0, -0.5, 0.5, 0.5,
3, -4.07548, -6.422665, 1, -0.5, 0.5, 0.5,
3, -4.07548, -6.422665, 1, 1.5, 0.5, 0.5,
3, -4.07548, -6.422665, 0, 1.5, 0.5, 0.5
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
-3.099555, -3, -5.627361,
-3.099555, 3, -5.627361,
-3.099555, -3, -5.627361,
-3.267534, -3, -5.892462,
-3.099555, -2, -5.627361,
-3.267534, -2, -5.892462,
-3.099555, -1, -5.627361,
-3.267534, -1, -5.892462,
-3.099555, 0, -5.627361,
-3.267534, 0, -5.892462,
-3.099555, 1, -5.627361,
-3.267534, 1, -5.892462,
-3.099555, 2, -5.627361,
-3.267534, 2, -5.892462,
-3.099555, 3, -5.627361,
-3.267534, 3, -5.892462
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
-3.603492, -3, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, -3, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, -3, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, -3, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, -2, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, -2, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, -2, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, -2, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, -1, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, -1, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, -1, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, -1, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, 0, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, 0, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, 0, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, 0, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, 1, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, 1, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, 1, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, 1, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, 2, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, 2, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, 2, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, 2, -6.422665, 0, 1.5, 0.5, 0.5,
-3.603492, 3, -6.422665, 0, -0.5, 0.5, 0.5,
-3.603492, 3, -6.422665, 1, -0.5, 0.5, 0.5,
-3.603492, 3, -6.422665, 1, 1.5, 0.5, 0.5,
-3.603492, 3, -6.422665, 0, 1.5, 0.5, 0.5
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
-3.099555, -3.561506, -4,
-3.099555, -3.561506, 4,
-3.099555, -3.561506, -4,
-3.267534, -3.732831, -4,
-3.099555, -3.561506, -2,
-3.267534, -3.732831, -2,
-3.099555, -3.561506, 0,
-3.267534, -3.732831, 0,
-3.099555, -3.561506, 2,
-3.267534, -3.732831, 2,
-3.099555, -3.561506, 4,
-3.267534, -3.732831, 4
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
-3.603492, -4.07548, -4, 0, -0.5, 0.5, 0.5,
-3.603492, -4.07548, -4, 1, -0.5, 0.5, 0.5,
-3.603492, -4.07548, -4, 1, 1.5, 0.5, 0.5,
-3.603492, -4.07548, -4, 0, 1.5, 0.5, 0.5,
-3.603492, -4.07548, -2, 0, -0.5, 0.5, 0.5,
-3.603492, -4.07548, -2, 1, -0.5, 0.5, 0.5,
-3.603492, -4.07548, -2, 1, 1.5, 0.5, 0.5,
-3.603492, -4.07548, -2, 0, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 0, 0, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 0, 1, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 0, 1, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 0, 0, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 2, 0, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 2, 1, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 2, 1, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 2, 0, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 4, 0, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 4, 1, -0.5, 0.5, 0.5,
-3.603492, -4.07548, 4, 1, 1.5, 0.5, 0.5,
-3.603492, -4.07548, 4, 0, 1.5, 0.5, 0.5
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
-3.099555, -3.561506, -5.627361,
-3.099555, 3.291472, -5.627361,
-3.099555, -3.561506, 4.976696,
-3.099555, 3.291472, 4.976696,
-3.099555, -3.561506, -5.627361,
-3.099555, -3.561506, 4.976696,
-3.099555, 3.291472, -5.627361,
-3.099555, 3.291472, 4.976696,
-3.099555, -3.561506, -5.627361,
3.619605, -3.561506, -5.627361,
-3.099555, -3.561506, 4.976696,
3.619605, -3.561506, 4.976696,
-3.099555, 3.291472, -5.627361,
3.619605, 3.291472, -5.627361,
-3.099555, 3.291472, 4.976696,
3.619605, 3.291472, 4.976696,
3.619605, -3.561506, -5.627361,
3.619605, 3.291472, -5.627361,
3.619605, -3.561506, 4.976696,
3.619605, 3.291472, 4.976696,
3.619605, -3.561506, -5.627361,
3.619605, -3.561506, 4.976696,
3.619605, 3.291472, -5.627361,
3.619605, 3.291472, 4.976696
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
var radius = 7.637163;
var distance = 33.9786;
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
mvMatrix.translate( -0.2600249, 0.135017, 0.3253326 );
mvMatrix.scale( 1.228941, 1.204943, 0.7787067 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9786);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Vangard<-read.table("Vangard.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Vangard$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
```

```r
y<-Vangard$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
```

```r
z<-Vangard$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
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
-3.001703, -0.5660866, -1.6267, 0, 0, 1, 1, 1,
-2.980711, -0.702035, -4.006586, 1, 0, 0, 1, 1,
-2.927662, -0.6090691, -1.485605, 1, 0, 0, 1, 1,
-2.907162, 1.843871, -0.693816, 1, 0, 0, 1, 1,
-2.82099, -1.626764, -2.148126, 1, 0, 0, 1, 1,
-2.786655, 0.666544, -1.63674, 1, 0, 0, 1, 1,
-2.748217, -0.9635192, -2.864035, 0, 0, 0, 1, 1,
-2.703843, -2.200425, -2.347525, 0, 0, 0, 1, 1,
-2.546432, 1.156507, -1.78831, 0, 0, 0, 1, 1,
-2.507881, 1.312435, -1.817189, 0, 0, 0, 1, 1,
-2.490053, 1.297245, -0.6759264, 0, 0, 0, 1, 1,
-2.406513, 0.9255534, -0.3407818, 0, 0, 0, 1, 1,
-2.348152, -2.638395, -3.760051, 0, 0, 0, 1, 1,
-2.326788, -1.16409, -2.331444, 1, 1, 1, 1, 1,
-2.281524, -0.8631733, -2.202552, 1, 1, 1, 1, 1,
-2.265922, 0.8721383, -0.9456375, 1, 1, 1, 1, 1,
-2.263288, -0.4632366, -1.340946, 1, 1, 1, 1, 1,
-2.262802, 1.206588, 0.7294862, 1, 1, 1, 1, 1,
-2.222014, -0.5555426, -2.73133, 1, 1, 1, 1, 1,
-2.216891, 1.198675, -1.726043, 1, 1, 1, 1, 1,
-2.199033, 0.463425, -2.018198, 1, 1, 1, 1, 1,
-2.186942, -0.5417151, -1.613252, 1, 1, 1, 1, 1,
-2.120144, -0.923451, -1.612245, 1, 1, 1, 1, 1,
-2.115018, 0.09568406, -3.216305, 1, 1, 1, 1, 1,
-2.088995, 0.5536864, -0.806506, 1, 1, 1, 1, 1,
-2.076386, 0.5513037, -0.8629293, 1, 1, 1, 1, 1,
-2.069151, -1.373321, -2.808826, 1, 1, 1, 1, 1,
-2.06483, -2.098007, -1.931751, 1, 1, 1, 1, 1,
-2.039573, -0.8821555, -1.283881, 0, 0, 1, 1, 1,
-2.037533, -0.7187693, -2.086206, 1, 0, 0, 1, 1,
-2.035308, -0.037856, -1.905349, 1, 0, 0, 1, 1,
-2.035146, -0.3748881, -2.113345, 1, 0, 0, 1, 1,
-2.034582, 0.4658195, 0.9690983, 1, 0, 0, 1, 1,
-2.027311, 0.5887125, -1.17884, 1, 0, 0, 1, 1,
-2.026895, 1.320622, -1.14593, 0, 0, 0, 1, 1,
-1.970405, 0.5345834, -0.8935851, 0, 0, 0, 1, 1,
-1.951422, 0.2111432, 0.001259299, 0, 0, 0, 1, 1,
-1.940831, 0.02786682, -0.3755565, 0, 0, 0, 1, 1,
-1.923847, -0.7912486, -1.872379, 0, 0, 0, 1, 1,
-1.913832, -0.102116, -0.3423919, 0, 0, 0, 1, 1,
-1.912611, -1.475811, -2.2299, 0, 0, 0, 1, 1,
-1.910274, -0.3741465, -1.126595, 1, 1, 1, 1, 1,
-1.910041, 1.147434, -0.3615721, 1, 1, 1, 1, 1,
-1.909928, 0.8226374, -1.323043, 1, 1, 1, 1, 1,
-1.89982, 0.7913404, 0.8361245, 1, 1, 1, 1, 1,
-1.890117, 1.775058, -1.792739, 1, 1, 1, 1, 1,
-1.872169, 1.352238, -1.149254, 1, 1, 1, 1, 1,
-1.853073, 0.9367241, -1.134787, 1, 1, 1, 1, 1,
-1.846612, 0.1454928, -0.9026021, 1, 1, 1, 1, 1,
-1.817817, 0.5511492, -1.410645, 1, 1, 1, 1, 1,
-1.796002, 0.2489575, -1.482925, 1, 1, 1, 1, 1,
-1.79559, 0.03180746, -2.022502, 1, 1, 1, 1, 1,
-1.784805, 0.2263483, -1.653394, 1, 1, 1, 1, 1,
-1.772099, -0.8519944, -1.097166, 1, 1, 1, 1, 1,
-1.769208, 0.08875699, -2.277391, 1, 1, 1, 1, 1,
-1.75504, -0.4875588, -1.55404, 1, 1, 1, 1, 1,
-1.733599, -0.7841781, -0.3101952, 0, 0, 1, 1, 1,
-1.732397, -1.735479, -1.479745, 1, 0, 0, 1, 1,
-1.715595, -0.4988928, -1.469124, 1, 0, 0, 1, 1,
-1.70839, -0.5356984, -1.859214, 1, 0, 0, 1, 1,
-1.659475, -0.5351576, -0.7451957, 1, 0, 0, 1, 1,
-1.639347, -0.9341604, -1.693122, 1, 0, 0, 1, 1,
-1.629714, 0.9913715, -1.703072, 0, 0, 0, 1, 1,
-1.598872, -1.430979, -2.580912, 0, 0, 0, 1, 1,
-1.577158, 0.9074544, 0.238145, 0, 0, 0, 1, 1,
-1.558588, -0.1710424, -2.375324, 0, 0, 0, 1, 1,
-1.54101, 0.3043499, -1.260938, 0, 0, 0, 1, 1,
-1.531584, 0.03892564, -1.787917, 0, 0, 0, 1, 1,
-1.529304, 1.00066, -1.23846, 0, 0, 0, 1, 1,
-1.494986, -0.8651916, -3.253835, 1, 1, 1, 1, 1,
-1.492874, -0.1730964, -2.986764, 1, 1, 1, 1, 1,
-1.485842, -0.2612936, -1.350827, 1, 1, 1, 1, 1,
-1.484334, 0.5336339, -1.947531, 1, 1, 1, 1, 1,
-1.482527, -1.362729, -2.632883, 1, 1, 1, 1, 1,
-1.482016, -0.6395121, -2.204662, 1, 1, 1, 1, 1,
-1.482013, 0.7953985, -1.65215, 1, 1, 1, 1, 1,
-1.479209, -0.9018753, -2.133454, 1, 1, 1, 1, 1,
-1.476144, -0.6735127, -2.625297, 1, 1, 1, 1, 1,
-1.463323, 0.9389386, -2.080271, 1, 1, 1, 1, 1,
-1.459225, -0.9560443, -1.854704, 1, 1, 1, 1, 1,
-1.456526, -0.2101146, -2.516198, 1, 1, 1, 1, 1,
-1.440591, 1.163707, -1.723777, 1, 1, 1, 1, 1,
-1.440278, -2.249741, -4.02181, 1, 1, 1, 1, 1,
-1.435651, -1.725217, -2.023736, 1, 1, 1, 1, 1,
-1.433975, -1.624283, -2.993258, 0, 0, 1, 1, 1,
-1.428806, 0.1426897, -1.954792, 1, 0, 0, 1, 1,
-1.42268, -0.4750421, -2.194481, 1, 0, 0, 1, 1,
-1.418021, -0.5485739, -1.319906, 1, 0, 0, 1, 1,
-1.407388, -0.685276, -1.819603, 1, 0, 0, 1, 1,
-1.405926, 0.7204475, -0.3317083, 1, 0, 0, 1, 1,
-1.380661, -1.705679, -2.530819, 0, 0, 0, 1, 1,
-1.379704, 1.075079, -0.5000576, 0, 0, 0, 1, 1,
-1.365098, 0.5499479, -0.7651764, 0, 0, 0, 1, 1,
-1.359237, -0.05365105, -0.7602993, 0, 0, 0, 1, 1,
-1.348693, -0.6196648, -2.555852, 0, 0, 0, 1, 1,
-1.348258, -0.7772937, -2.980047, 0, 0, 0, 1, 1,
-1.335768, -1.026614, -2.157916, 0, 0, 0, 1, 1,
-1.335456, 1.91258, 0.1723533, 1, 1, 1, 1, 1,
-1.335052, 2.038889, -1.226749, 1, 1, 1, 1, 1,
-1.323531, 2.726798, -1.369083, 1, 1, 1, 1, 1,
-1.322173, -0.3820682, -2.403517, 1, 1, 1, 1, 1,
-1.322057, -0.2865094, -1.802846, 1, 1, 1, 1, 1,
-1.316658, 0.7056288, -1.029159, 1, 1, 1, 1, 1,
-1.3072, 1.850079, -2.684929, 1, 1, 1, 1, 1,
-1.303203, -1.087272, -3.346107, 1, 1, 1, 1, 1,
-1.278114, 0.6508504, -0.6172892, 1, 1, 1, 1, 1,
-1.276009, 1.109688, 0.6998202, 1, 1, 1, 1, 1,
-1.275353, 0.8897092, -1.384985, 1, 1, 1, 1, 1,
-1.272931, 0.1543927, -2.011797, 1, 1, 1, 1, 1,
-1.271338, -1.058624, -2.328733, 1, 1, 1, 1, 1,
-1.269601, 0.3568986, -0.1615773, 1, 1, 1, 1, 1,
-1.266697, 1.127664, -0.798849, 1, 1, 1, 1, 1,
-1.258946, 0.2135099, -1.574039, 0, 0, 1, 1, 1,
-1.253666, 0.7479771, -0.7999616, 1, 0, 0, 1, 1,
-1.241634, 0.6056865, -1.03747, 1, 0, 0, 1, 1,
-1.237157, 0.3447796, -0.8957933, 1, 0, 0, 1, 1,
-1.235847, -0.8204945, 0.2152233, 1, 0, 0, 1, 1,
-1.234684, -0.08519305, -1.405643, 1, 0, 0, 1, 1,
-1.226696, 0.8836021, -0.7929834, 0, 0, 0, 1, 1,
-1.210453, 0.7813058, 0.5636329, 0, 0, 0, 1, 1,
-1.203761, -0.3121106, -2.121685, 0, 0, 0, 1, 1,
-1.202364, 1.56078, -1.091083, 0, 0, 0, 1, 1,
-1.191354, -0.02972041, -0.9108295, 0, 0, 0, 1, 1,
-1.160142, 1.216053, -1.849532, 0, 0, 0, 1, 1,
-1.154949, -0.5813972, -1.269645, 0, 0, 0, 1, 1,
-1.152369, 0.1769496, -1.530303, 1, 1, 1, 1, 1,
-1.149226, 0.6294335, -0.4013802, 1, 1, 1, 1, 1,
-1.144656, 0.3963182, -1.023378, 1, 1, 1, 1, 1,
-1.137662, 0.7001011, -1.375346, 1, 1, 1, 1, 1,
-1.13378, -0.02074262, -1.765431, 1, 1, 1, 1, 1,
-1.132442, 1.594412, 1.715603, 1, 1, 1, 1, 1,
-1.129097, -1.589555, -3.559299, 1, 1, 1, 1, 1,
-1.12652, 1.220282, -1.15696, 1, 1, 1, 1, 1,
-1.122415, -0.1403736, -0.9070328, 1, 1, 1, 1, 1,
-1.11853, -0.9290668, -2.248837, 1, 1, 1, 1, 1,
-1.117708, 0.03120091, -2.003847, 1, 1, 1, 1, 1,
-1.110537, 2.495223, 1.379727, 1, 1, 1, 1, 1,
-1.105944, -0.8618678, -3.380196, 1, 1, 1, 1, 1,
-1.105762, 0.172034, -1.970674, 1, 1, 1, 1, 1,
-1.102573, 0.4154834, -1.461667, 1, 1, 1, 1, 1,
-1.085237, -0.2905137, -2.380187, 0, 0, 1, 1, 1,
-1.074662, 0.5410343, -0.5377492, 1, 0, 0, 1, 1,
-1.071866, -0.3020748, -1.180555, 1, 0, 0, 1, 1,
-1.064293, 0.7086536, 0.3591254, 1, 0, 0, 1, 1,
-1.062091, 1.136286, -2.419482, 1, 0, 0, 1, 1,
-1.051537, 0.7304998, -0.8740523, 1, 0, 0, 1, 1,
-1.047226, -1.204128, -2.691189, 0, 0, 0, 1, 1,
-1.044961, -0.1759809, -1.092336, 0, 0, 0, 1, 1,
-1.044652, 1.263686, 0.4199852, 0, 0, 0, 1, 1,
-1.020169, 0.1870857, -0.2868928, 0, 0, 0, 1, 1,
-1.019957, -0.6845466, -3.307549, 0, 0, 0, 1, 1,
-1.016719, 0.6544129, -1.113277, 0, 0, 0, 1, 1,
-1.011352, 0.2495344, -2.276853, 0, 0, 0, 1, 1,
-1.009343, 1.430477, -0.8933957, 1, 1, 1, 1, 1,
-1.007286, 0.36074, -1.04691, 1, 1, 1, 1, 1,
-1.003547, -0.3337796, -1.820964, 1, 1, 1, 1, 1,
-1.003301, 0.06289717, 0.1554022, 1, 1, 1, 1, 1,
-1.002815, -0.2088879, -1.693839, 1, 1, 1, 1, 1,
-0.9991227, -0.7591347, -1.117335, 1, 1, 1, 1, 1,
-0.996176, -1.461089, -3.045763, 1, 1, 1, 1, 1,
-0.9844166, -0.585309, -1.390635, 1, 1, 1, 1, 1,
-0.9842324, -0.7302648, -2.827638, 1, 1, 1, 1, 1,
-0.9813846, -1.853626, -1.603069, 1, 1, 1, 1, 1,
-0.9676656, -1.058195, -2.719043, 1, 1, 1, 1, 1,
-0.9671028, -0.7063104, -1.236924, 1, 1, 1, 1, 1,
-0.9660218, 0.8639804, -1.115146, 1, 1, 1, 1, 1,
-0.9621137, -0.2552943, 0.6459395, 1, 1, 1, 1, 1,
-0.9507449, 0.03758758, -0.7810561, 1, 1, 1, 1, 1,
-0.9490637, -1.169992, -1.09332, 0, 0, 1, 1, 1,
-0.944843, 0.1378273, -2.102483, 1, 0, 0, 1, 1,
-0.9445444, 0.9289998, -0.4129878, 1, 0, 0, 1, 1,
-0.9320078, 1.371433, -0.002063547, 1, 0, 0, 1, 1,
-0.9316899, 0.9643487, -0.50857, 1, 0, 0, 1, 1,
-0.9205689, 0.8485079, -1.147688, 1, 0, 0, 1, 1,
-0.9205035, -1.050678, -5.201779, 0, 0, 0, 1, 1,
-0.9147239, 1.25084, -1.537097, 0, 0, 0, 1, 1,
-0.9140797, -0.9718987, -4.156524, 0, 0, 0, 1, 1,
-0.9136381, -0.5930693, -0.5433866, 0, 0, 0, 1, 1,
-0.8979012, 1.200346, -2.472248, 0, 0, 0, 1, 1,
-0.8866423, -0.2423455, -2.589809, 0, 0, 0, 1, 1,
-0.8813322, -0.5130045, -0.9825611, 0, 0, 0, 1, 1,
-0.8798699, -0.2675946, -1.320041, 1, 1, 1, 1, 1,
-0.8749888, 0.9488333, 0.02672346, 1, 1, 1, 1, 1,
-0.8611345, 0.1452953, 0.02034117, 1, 1, 1, 1, 1,
-0.8581878, -0.5155134, -2.622906, 1, 1, 1, 1, 1,
-0.8528174, -1.127551, -2.220722, 1, 1, 1, 1, 1,
-0.8416509, 0.4037862, -0.5426651, 1, 1, 1, 1, 1,
-0.8403326, -0.1399896, -2.103516, 1, 1, 1, 1, 1,
-0.8357162, 2.019921, -0.3700368, 1, 1, 1, 1, 1,
-0.8261247, 0.8406703, 1.074971, 1, 1, 1, 1, 1,
-0.8249598, 0.7996334, -2.349442, 1, 1, 1, 1, 1,
-0.8248986, 0.05218103, -1.394289, 1, 1, 1, 1, 1,
-0.8203345, -0.1451281, -1.909563, 1, 1, 1, 1, 1,
-0.8082599, -0.3909485, -2.113239, 1, 1, 1, 1, 1,
-0.8068773, -0.5363573, -1.056989, 1, 1, 1, 1, 1,
-0.802667, -1.12829, -1.917133, 1, 1, 1, 1, 1,
-0.7987391, 1.147132, 1.816878, 0, 0, 1, 1, 1,
-0.797124, -0.06120688, -1.759599, 1, 0, 0, 1, 1,
-0.7955452, 0.5973512, -1.952126, 1, 0, 0, 1, 1,
-0.7871715, -0.367436, -2.134177, 1, 0, 0, 1, 1,
-0.7862281, -0.6949066, -2.105861, 1, 0, 0, 1, 1,
-0.7764597, 0.3792458, -0.1832201, 1, 0, 0, 1, 1,
-0.774946, -0.4196941, -1.662423, 0, 0, 0, 1, 1,
-0.7730572, 0.063022, -0.463391, 0, 0, 0, 1, 1,
-0.7699704, 2.758041, -0.1304833, 0, 0, 0, 1, 1,
-0.7599095, -1.452764, -3.177232, 0, 0, 0, 1, 1,
-0.754729, 0.6908733, -1.261446, 0, 0, 0, 1, 1,
-0.7478585, -1.147943, -4.890388, 0, 0, 0, 1, 1,
-0.7413373, -1.302941, -3.197787, 0, 0, 0, 1, 1,
-0.7411726, -0.3495804, -2.804112, 1, 1, 1, 1, 1,
-0.7380469, 1.321534, -1.62392, 1, 1, 1, 1, 1,
-0.7350414, 0.8423377, -0.6759764, 1, 1, 1, 1, 1,
-0.7292489, -1.242903, -2.918883, 1, 1, 1, 1, 1,
-0.7160707, -0.2628267, -2.683209, 1, 1, 1, 1, 1,
-0.7128943, 1.324462, 0.619014, 1, 1, 1, 1, 1,
-0.7110634, 0.5683407, -0.3107554, 1, 1, 1, 1, 1,
-0.7098257, 0.4375797, -1.022224, 1, 1, 1, 1, 1,
-0.7085353, -0.4437688, -2.691643, 1, 1, 1, 1, 1,
-0.7076883, 0.5055036, -1.331919, 1, 1, 1, 1, 1,
-0.7065852, -1.047873, -2.930554, 1, 1, 1, 1, 1,
-0.7051547, 0.753786, -0.522138, 1, 1, 1, 1, 1,
-0.7024511, 1.862651, -1.473122, 1, 1, 1, 1, 1,
-0.6996223, 0.8653314, -1.20244, 1, 1, 1, 1, 1,
-0.6954259, -1.281013, -2.069281, 1, 1, 1, 1, 1,
-0.6951119, 1.132265, -0.7576175, 0, 0, 1, 1, 1,
-0.6921984, 0.2670907, -2.201906, 1, 0, 0, 1, 1,
-0.6911536, -1.269637, -3.659114, 1, 0, 0, 1, 1,
-0.6904608, 0.1328875, 0.6757965, 1, 0, 0, 1, 1,
-0.6892377, 0.288136, -1.071636, 1, 0, 0, 1, 1,
-0.6846013, -0.786289, -1.378471, 1, 0, 0, 1, 1,
-0.6755213, 0.4238786, -2.314556, 0, 0, 0, 1, 1,
-0.6732306, -0.2929557, -0.7593259, 0, 0, 0, 1, 1,
-0.6583192, -1.270074, -3.116775, 0, 0, 0, 1, 1,
-0.65627, -0.04009542, -2.679462, 0, 0, 0, 1, 1,
-0.6557231, -0.07905737, -2.520584, 0, 0, 0, 1, 1,
-0.651785, -1.660587, -3.672249, 0, 0, 0, 1, 1,
-0.6447189, -0.2505904, -2.797135, 0, 0, 0, 1, 1,
-0.6427291, -1.050883, -2.849464, 1, 1, 1, 1, 1,
-0.6350377, 1.480354, 0.9882385, 1, 1, 1, 1, 1,
-0.6303722, 0.9385723, 1.354872, 1, 1, 1, 1, 1,
-0.6280497, -1.276259, -3.465853, 1, 1, 1, 1, 1,
-0.6208212, 0.07982034, -1.588209, 1, 1, 1, 1, 1,
-0.6172494, 0.4691113, -2.431371, 1, 1, 1, 1, 1,
-0.6132401, 0.4970933, 0.572993, 1, 1, 1, 1, 1,
-0.6125955, -0.7897172, -3.782367, 1, 1, 1, 1, 1,
-0.6110985, -0.4426765, -2.528883, 1, 1, 1, 1, 1,
-0.6108775, -0.2587499, -3.769871, 1, 1, 1, 1, 1,
-0.6075822, -0.200372, -1.78732, 1, 1, 1, 1, 1,
-0.6055501, -1.19891, -2.503336, 1, 1, 1, 1, 1,
-0.6049557, -0.5930738, -3.870265, 1, 1, 1, 1, 1,
-0.6033734, -0.1606069, -2.17768, 1, 1, 1, 1, 1,
-0.5980107, -1.282881, -2.831248, 1, 1, 1, 1, 1,
-0.5821493, -2.105469, -2.760013, 0, 0, 1, 1, 1,
-0.5814115, 0.2991548, -1.649566, 1, 0, 0, 1, 1,
-0.5778235, -0.4115028, -3.688826, 1, 0, 0, 1, 1,
-0.5766175, 1.277553, 0.1778822, 1, 0, 0, 1, 1,
-0.5742859, 0.3842511, -2.295363, 1, 0, 0, 1, 1,
-0.569663, -0.4650678, -2.442637, 1, 0, 0, 1, 1,
-0.5665688, -1.526058, -2.898541, 0, 0, 0, 1, 1,
-0.5661415, 0.9660639, -0.80063, 0, 0, 0, 1, 1,
-0.5659632, -0.4674863, -1.536269, 0, 0, 0, 1, 1,
-0.5651923, -0.721962, -2.614877, 0, 0, 0, 1, 1,
-0.5594615, 1.10373, -0.3562039, 0, 0, 0, 1, 1,
-0.5529922, -1.06975, -1.553086, 0, 0, 0, 1, 1,
-0.5488141, -0.4042605, -2.011685, 0, 0, 0, 1, 1,
-0.5441061, -1.405381, -2.343316, 1, 1, 1, 1, 1,
-0.5429849, -0.6940118, -4.188076, 1, 1, 1, 1, 1,
-0.5428559, 1.074867, -0.7321308, 1, 1, 1, 1, 1,
-0.5396843, 0.2825534, 0.2382452, 1, 1, 1, 1, 1,
-0.5371774, 1.165466, -2.163256, 1, 1, 1, 1, 1,
-0.5339057, -1.057354, -2.502966, 1, 1, 1, 1, 1,
-0.5326403, 1.810336, -0.1795308, 1, 1, 1, 1, 1,
-0.5283773, 0.0860569, -3.335604, 1, 1, 1, 1, 1,
-0.5259005, -1.748578, -2.173936, 1, 1, 1, 1, 1,
-0.5256925, -0.7509655, 0.6699889, 1, 1, 1, 1, 1,
-0.5251064, -0.3167751, -2.723905, 1, 1, 1, 1, 1,
-0.5241583, 0.3982216, -1.126407, 1, 1, 1, 1, 1,
-0.5234815, 0.3002794, 0.671301, 1, 1, 1, 1, 1,
-0.5206264, 0.1409233, -2.717216, 1, 1, 1, 1, 1,
-0.5154824, 0.9134445, -0.2429841, 1, 1, 1, 1, 1,
-0.5150033, 0.5077659, -2.761781, 0, 0, 1, 1, 1,
-0.5149279, -0.348954, -2.591252, 1, 0, 0, 1, 1,
-0.5100843, 0.2073987, -1.723024, 1, 0, 0, 1, 1,
-0.5057244, 0.0611142, -1.056942, 1, 0, 0, 1, 1,
-0.5050029, 0.2068287, 0.1389385, 1, 0, 0, 1, 1,
-0.5036023, 1.232778, -0.09343372, 1, 0, 0, 1, 1,
-0.5029861, -2.313839, -4.776892, 0, 0, 0, 1, 1,
-0.4976164, 1.822295, -0.9941388, 0, 0, 0, 1, 1,
-0.497497, 0.6071838, -1.520603, 0, 0, 0, 1, 1,
-0.4957439, -0.3405818, -2.72268, 0, 0, 0, 1, 1,
-0.4953991, 0.2883625, -1.847426, 0, 0, 0, 1, 1,
-0.4951666, 0.8387803, 0.5255936, 0, 0, 0, 1, 1,
-0.4887979, 1.403132, -0.6850653, 0, 0, 0, 1, 1,
-0.4855241, -0.2772809, -1.901444, 1, 1, 1, 1, 1,
-0.4853403, -1.345537, -3.196147, 1, 1, 1, 1, 1,
-0.4849356, -0.2187604, -4.625956, 1, 1, 1, 1, 1,
-0.4840311, -1.917705, -2.579119, 1, 1, 1, 1, 1,
-0.4839272, -0.5866683, -2.906425, 1, 1, 1, 1, 1,
-0.4815207, 0.5571342, -2.334596, 1, 1, 1, 1, 1,
-0.477846, -0.128289, -1.597364, 1, 1, 1, 1, 1,
-0.4760809, -0.08618503, -1.510597, 1, 1, 1, 1, 1,
-0.4747318, 0.7251211, 0.4020366, 1, 1, 1, 1, 1,
-0.4728194, 0.8731608, -0.2736681, 1, 1, 1, 1, 1,
-0.4719843, -1.357934, -1.816608, 1, 1, 1, 1, 1,
-0.4702339, -0.5109795, -2.778836, 1, 1, 1, 1, 1,
-0.4677183, 0.911649, 0.5232812, 1, 1, 1, 1, 1,
-0.4653467, -1.00518, -2.464091, 1, 1, 1, 1, 1,
-0.4625747, -1.035668, -3.733377, 1, 1, 1, 1, 1,
-0.4570963, -1.368483, -3.980237, 0, 0, 1, 1, 1,
-0.4548895, 0.03243672, -1.901269, 1, 0, 0, 1, 1,
-0.453095, 0.09515177, -2.189532, 1, 0, 0, 1, 1,
-0.4473457, -0.6899437, -4.923933, 1, 0, 0, 1, 1,
-0.4426617, -0.7144105, -3.356222, 1, 0, 0, 1, 1,
-0.4417383, 0.8838485, -0.1885458, 1, 0, 0, 1, 1,
-0.4373398, -1.564528, -2.13241, 0, 0, 0, 1, 1,
-0.4370933, -2.087518, -3.871241, 0, 0, 0, 1, 1,
-0.4366468, 0.2446607, -0.5196001, 0, 0, 0, 1, 1,
-0.4282505, -1.451868, -4.106087, 0, 0, 0, 1, 1,
-0.4241177, -0.8994929, -3.400704, 0, 0, 0, 1, 1,
-0.4240881, -0.3776574, -1.795888, 0, 0, 0, 1, 1,
-0.4226013, 1.634065, -0.6749315, 0, 0, 0, 1, 1,
-0.4212593, 1.080901, -1.181174, 1, 1, 1, 1, 1,
-0.4209034, 1.753474, -1.014913, 1, 1, 1, 1, 1,
-0.4178526, 0.197918, -1.951129, 1, 1, 1, 1, 1,
-0.4131725, -1.217538, -1.965116, 1, 1, 1, 1, 1,
-0.4114821, 0.01694313, -2.869187, 1, 1, 1, 1, 1,
-0.4092886, -0.1941224, -2.059793, 1, 1, 1, 1, 1,
-0.405491, -0.05832126, -0.8939537, 1, 1, 1, 1, 1,
-0.3934552, 0.9277665, -0.8568004, 1, 1, 1, 1, 1,
-0.3909604, -0.4688791, -3.594084, 1, 1, 1, 1, 1,
-0.3888697, 0.01997836, -1.029414, 1, 1, 1, 1, 1,
-0.3874266, -0.1631734, -3.00808, 1, 1, 1, 1, 1,
-0.3861009, -2.260478, -3.168453, 1, 1, 1, 1, 1,
-0.3832757, 0.3841313, -0.7435527, 1, 1, 1, 1, 1,
-0.3827705, 0.4156266, -1.358475, 1, 1, 1, 1, 1,
-0.3767032, -0.1101189, -2.897981, 1, 1, 1, 1, 1,
-0.375821, -0.2127219, -3.212476, 0, 0, 1, 1, 1,
-0.3756703, 0.1811713, -1.589283, 1, 0, 0, 1, 1,
-0.3744526, -0.6542879, -2.767346, 1, 0, 0, 1, 1,
-0.3720253, 0.5153657, -0.7142171, 1, 0, 0, 1, 1,
-0.3709447, 0.5029631, -0.2448719, 1, 0, 0, 1, 1,
-0.3670964, -0.7272003, -1.715101, 1, 0, 0, 1, 1,
-0.3663666, 1.875173, 1.304303, 0, 0, 0, 1, 1,
-0.3610924, -0.8100946, -2.454179, 0, 0, 0, 1, 1,
-0.3566474, -0.5974579, -3.653254, 0, 0, 0, 1, 1,
-0.3545413, 0.8043687, -1.158325, 0, 0, 0, 1, 1,
-0.3545209, 0.548502, -1.913817, 0, 0, 0, 1, 1,
-0.3513446, -1.27851, -3.917702, 0, 0, 0, 1, 1,
-0.3474411, 0.408683, -1.589957, 0, 0, 0, 1, 1,
-0.341958, -0.4145488, -0.8917434, 1, 1, 1, 1, 1,
-0.3414429, 1.683857, 0.8785663, 1, 1, 1, 1, 1,
-0.3391011, -0.2847001, -2.814291, 1, 1, 1, 1, 1,
-0.3322452, -0.6395158, -1.774292, 1, 1, 1, 1, 1,
-0.326784, -1.564265, -4.654025, 1, 1, 1, 1, 1,
-0.3228896, -0.2698427, -2.553659, 1, 1, 1, 1, 1,
-0.3224519, -0.5274663, 0.05554843, 1, 1, 1, 1, 1,
-0.3223133, -1.267464, -3.965074, 1, 1, 1, 1, 1,
-0.3184477, -0.360753, -2.429121, 1, 1, 1, 1, 1,
-0.3168904, -1.109767, -3.816853, 1, 1, 1, 1, 1,
-0.3139289, 0.190427, -1.364335, 1, 1, 1, 1, 1,
-0.3124132, -0.9527953, -2.754282, 1, 1, 1, 1, 1,
-0.3116697, -0.3595405, -2.422409, 1, 1, 1, 1, 1,
-0.3105078, -0.163452, -1.904622, 1, 1, 1, 1, 1,
-0.308266, 0.841451, -0.3446932, 1, 1, 1, 1, 1,
-0.3064466, 0.09562793, -0.8023452, 0, 0, 1, 1, 1,
-0.3061011, -3.294228, -1.239259, 1, 0, 0, 1, 1,
-0.3042348, 1.403812, 0.7861623, 1, 0, 0, 1, 1,
-0.3017846, -0.8525838, -3.00413, 1, 0, 0, 1, 1,
-0.2953098, 1.07549, -0.679364, 1, 0, 0, 1, 1,
-0.2947509, -0.7187519, -2.006007, 1, 0, 0, 1, 1,
-0.29421, -0.1114086, -3.240333, 0, 0, 0, 1, 1,
-0.2912579, -0.1151085, -1.319658, 0, 0, 0, 1, 1,
-0.2899912, 1.270757, 1.955952, 0, 0, 0, 1, 1,
-0.2796217, -1.656028, -3.097391, 0, 0, 0, 1, 1,
-0.2790032, -1.362906, -5.057592, 0, 0, 0, 1, 1,
-0.277736, 0.6959856, -0.2057386, 0, 0, 0, 1, 1,
-0.2772709, 0.605553, 0.03677066, 0, 0, 0, 1, 1,
-0.2767036, 0.6193078, 0.3100822, 1, 1, 1, 1, 1,
-0.2748282, 1.387349, -1.371517, 1, 1, 1, 1, 1,
-0.272662, -0.2097614, -1.115284, 1, 1, 1, 1, 1,
-0.26949, 0.3925484, 1.31326, 1, 1, 1, 1, 1,
-0.2661137, -0.9237413, -2.955877, 1, 1, 1, 1, 1,
-0.2634556, 1.179952, 0.2152533, 1, 1, 1, 1, 1,
-0.2605671, -0.9653282, -4.076763, 1, 1, 1, 1, 1,
-0.2565889, -0.8787253, -0.7898507, 1, 1, 1, 1, 1,
-0.2562706, 0.9461687, 1.201452, 1, 1, 1, 1, 1,
-0.2546531, 0.4077145, -0.1003607, 1, 1, 1, 1, 1,
-0.2544054, -0.7890124, -2.100429, 1, 1, 1, 1, 1,
-0.2537673, -0.5352038, -3.335801, 1, 1, 1, 1, 1,
-0.251317, -0.9305875, -4.922932, 1, 1, 1, 1, 1,
-0.2507372, -0.01336421, -2.066121, 1, 1, 1, 1, 1,
-0.2472964, 0.7634372, -0.6762971, 1, 1, 1, 1, 1,
-0.2469408, -0.5596578, -3.455936, 0, 0, 1, 1, 1,
-0.2460403, 0.6150302, -1.181614, 1, 0, 0, 1, 1,
-0.2431525, 0.8964829, 0.7837906, 1, 0, 0, 1, 1,
-0.2394739, 0.8151103, -1.023, 1, 0, 0, 1, 1,
-0.2382575, -0.2829371, -1.648488, 1, 0, 0, 1, 1,
-0.2343174, 0.01284429, -0.08922072, 1, 0, 0, 1, 1,
-0.2320988, -0.01455001, -1.718485, 0, 0, 0, 1, 1,
-0.2286791, 0.4452146, -0.1094731, 0, 0, 0, 1, 1,
-0.2280083, 1.052529, 0.02846594, 0, 0, 0, 1, 1,
-0.226729, -0.3653273, -3.012838, 0, 0, 0, 1, 1,
-0.2264295, -2.483459, -2.174662, 0, 0, 0, 1, 1,
-0.2262071, 0.3380861, -0.1183466, 0, 0, 0, 1, 1,
-0.2214492, 0.406729, -0.1134942, 0, 0, 0, 1, 1,
-0.2212983, 0.6322895, -0.4249418, 1, 1, 1, 1, 1,
-0.2166115, 0.8474159, 0.9907371, 1, 1, 1, 1, 1,
-0.214685, 0.2166085, -0.6402352, 1, 1, 1, 1, 1,
-0.2139389, -0.01826791, -2.176368, 1, 1, 1, 1, 1,
-0.2130688, -0.6322951, -2.598277, 1, 1, 1, 1, 1,
-0.2121077, -1.866082, -3.02228, 1, 1, 1, 1, 1,
-0.2118217, -0.09693895, -1.17392, 1, 1, 1, 1, 1,
-0.2103703, 0.9236812, 0.9170881, 1, 1, 1, 1, 1,
-0.2093532, -0.9381959, -5.472933, 1, 1, 1, 1, 1,
-0.207774, 0.4785282, -0.5882607, 1, 1, 1, 1, 1,
-0.2066862, 0.8321986, -0.2579874, 1, 1, 1, 1, 1,
-0.2055924, -0.6362819, -2.897284, 1, 1, 1, 1, 1,
-0.205162, -1.951529, -3.217486, 1, 1, 1, 1, 1,
-0.2043689, 0.3146538, -0.1500796, 1, 1, 1, 1, 1,
-0.2028464, -1.039808, -2.371887, 1, 1, 1, 1, 1,
-0.201274, 0.9455776, 0.2707373, 0, 0, 1, 1, 1,
-0.1990986, 1.692708, -0.7690338, 1, 0, 0, 1, 1,
-0.1942456, -0.01125988, -1.998519, 1, 0, 0, 1, 1,
-0.1919164, -0.4041863, -3.000757, 1, 0, 0, 1, 1,
-0.1914656, 0.1735766, -1.625935, 1, 0, 0, 1, 1,
-0.191161, -0.3713223, -1.164289, 1, 0, 0, 1, 1,
-0.1877269, 1.879152, 0.2810122, 0, 0, 0, 1, 1,
-0.1826191, 1.309818, -0.07995516, 0, 0, 0, 1, 1,
-0.1813873, -0.1683406, -4.079436, 0, 0, 0, 1, 1,
-0.1813457, 2.297628, -0.5790461, 0, 0, 0, 1, 1,
-0.1799774, -1.064174, -2.934198, 0, 0, 0, 1, 1,
-0.179977, 1.509701, -0.1278648, 0, 0, 0, 1, 1,
-0.1798418, -0.5044532, -2.766723, 0, 0, 0, 1, 1,
-0.1793782, -1.668134, -3.935166, 1, 1, 1, 1, 1,
-0.1774114, 0.7506399, -0.5279239, 1, 1, 1, 1, 1,
-0.1771378, -2.177532, -1.509946, 1, 1, 1, 1, 1,
-0.1731341, 0.3600309, -1.400282, 1, 1, 1, 1, 1,
-0.1727005, -0.1862809, -2.297827, 1, 1, 1, 1, 1,
-0.1644921, -0.07992352, -1.847114, 1, 1, 1, 1, 1,
-0.1600525, -0.05967578, -1.856062, 1, 1, 1, 1, 1,
-0.1583473, 0.413725, -2.442376, 1, 1, 1, 1, 1,
-0.1557808, 0.5388021, 1.443787, 1, 1, 1, 1, 1,
-0.1552214, 1.203475, -0.9799585, 1, 1, 1, 1, 1,
-0.1504999, -0.7510061, -4.305958, 1, 1, 1, 1, 1,
-0.1503782, 0.4327492, 0.04223547, 1, 1, 1, 1, 1,
-0.1464166, -1.178139, -2.555315, 1, 1, 1, 1, 1,
-0.1446394, -2.173638, -3.589178, 1, 1, 1, 1, 1,
-0.1444336, 0.2968954, 0.5461477, 1, 1, 1, 1, 1,
-0.1438657, 0.4909529, -0.6673242, 0, 0, 1, 1, 1,
-0.1420829, -1.755329, -0.9015598, 1, 0, 0, 1, 1,
-0.1418463, 1.115623, 1.101315, 1, 0, 0, 1, 1,
-0.1343704, -1.596146, -3.555216, 1, 0, 0, 1, 1,
-0.134192, 1.524709, 0.4855508, 1, 0, 0, 1, 1,
-0.1320062, 0.1292426, 0.3150764, 1, 0, 0, 1, 1,
-0.1317814, -1.275185, -3.459736, 0, 0, 0, 1, 1,
-0.1288352, 0.7431588, 0.5967737, 0, 0, 0, 1, 1,
-0.127523, 0.5503585, -0.3705051, 0, 0, 0, 1, 1,
-0.1248546, -0.398171, -1.326191, 0, 0, 0, 1, 1,
-0.1232783, -0.09355906, -1.503958, 0, 0, 0, 1, 1,
-0.121808, 1.645811, 0.2445008, 0, 0, 0, 1, 1,
-0.1172271, -0.06023831, -3.383858, 0, 0, 0, 1, 1,
-0.1150506, 2.388329, -0.01095339, 1, 1, 1, 1, 1,
-0.1102198, -0.9194024, -3.819269, 1, 1, 1, 1, 1,
-0.1101379, -1.072716, -2.463565, 1, 1, 1, 1, 1,
-0.1020978, 1.025399, -1.132994, 1, 1, 1, 1, 1,
-0.1004055, 1.299215, -0.8390593, 1, 1, 1, 1, 1,
-0.097739, 1.816643, 0.4799196, 1, 1, 1, 1, 1,
-0.09012449, 0.08522768, -0.7044672, 1, 1, 1, 1, 1,
-0.08929983, -0.4871724, -0.9985859, 1, 1, 1, 1, 1,
-0.08899261, -1.085293, -4.535646, 1, 1, 1, 1, 1,
-0.08736239, -0.1363164, -0.2550396, 1, 1, 1, 1, 1,
-0.08506958, 0.8064619, 0.3802519, 1, 1, 1, 1, 1,
-0.08468602, -1.200545, -4.592424, 1, 1, 1, 1, 1,
-0.08464119, -0.8635233, -3.444605, 1, 1, 1, 1, 1,
-0.08427811, -0.01336442, -1.198719, 1, 1, 1, 1, 1,
-0.07971895, 1.042673, -0.7529054, 1, 1, 1, 1, 1,
-0.07669862, 1.556235, -0.9530494, 0, 0, 1, 1, 1,
-0.07582007, 1.52601, 0.2651654, 1, 0, 0, 1, 1,
-0.07464372, 1.25262, -1.301557, 1, 0, 0, 1, 1,
-0.07187706, 0.1471275, 0.563933, 1, 0, 0, 1, 1,
-0.07081301, 0.9054481, 1.432861, 1, 0, 0, 1, 1,
-0.06848119, 0.07135724, 0.8953096, 1, 0, 0, 1, 1,
-0.06471241, 0.6544057, 0.08897202, 0, 0, 0, 1, 1,
-0.06008472, 1.283926, 2.285103, 0, 0, 0, 1, 1,
-0.05816865, -0.54141, -3.563701, 0, 0, 0, 1, 1,
-0.05587657, 1.292394, -0.5579979, 0, 0, 0, 1, 1,
-0.05577623, 0.3886015, -0.03264634, 0, 0, 0, 1, 1,
-0.0548959, -0.1165445, -0.7654434, 0, 0, 0, 1, 1,
-0.05122552, 0.7109396, -0.4522411, 0, 0, 0, 1, 1,
-0.04556047, -0.7164612, -3.627481, 1, 1, 1, 1, 1,
-0.03962289, -0.637897, -2.953649, 1, 1, 1, 1, 1,
-0.03911452, 0.2182966, 0.622472, 1, 1, 1, 1, 1,
-0.03908617, -0.7054935, -4.274267, 1, 1, 1, 1, 1,
-0.03861801, -0.5188688, -3.280638, 1, 1, 1, 1, 1,
-0.03553975, 0.3355, 0.05394498, 1, 1, 1, 1, 1,
-0.03319314, -0.5696022, -3.014563, 1, 1, 1, 1, 1,
-0.0313346, -0.7919401, -3.138582, 1, 1, 1, 1, 1,
-0.03090978, 0.3209612, 0.113916, 1, 1, 1, 1, 1,
-0.02904461, -1.210678, -2.12229, 1, 1, 1, 1, 1,
-0.02239733, -0.2811508, -2.970234, 1, 1, 1, 1, 1,
-0.01538372, 0.02027117, 0.1039183, 1, 1, 1, 1, 1,
-0.01472406, -0.4178885, -4.997472, 1, 1, 1, 1, 1,
-0.0117739, -2.428983, -3.086513, 1, 1, 1, 1, 1,
-0.004865159, 0.4557863, 1.240293, 1, 1, 1, 1, 1,
-0.0007473506, -0.7151228, -3.938572, 0, 0, 1, 1, 1,
-0.0005746008, -0.5092494, -3.82692, 1, 0, 0, 1, 1,
-0.0004377901, -0.775155, -2.086779, 1, 0, 0, 1, 1,
0.002861161, -0.9428195, 2.745836, 1, 0, 0, 1, 1,
0.009034346, 0.7398012, -0.1426081, 1, 0, 0, 1, 1,
0.009762358, -0.1143776, 4.155849, 1, 0, 0, 1, 1,
0.01167419, -2.013604, 3.106122, 0, 0, 0, 1, 1,
0.01228601, -0.7061066, 0.664858, 0, 0, 0, 1, 1,
0.01336592, -1.32171, 2.311808, 0, 0, 0, 1, 1,
0.01343023, -0.05753914, 3.395883, 0, 0, 0, 1, 1,
0.01470608, -0.6497275, 2.263644, 0, 0, 0, 1, 1,
0.01991094, 0.0260154, -0.05957954, 0, 0, 0, 1, 1,
0.02011288, 1.03408, -1.914438, 0, 0, 0, 1, 1,
0.02664575, 0.4312886, -0.13408, 1, 1, 1, 1, 1,
0.0266942, 0.7632027, 1.55016, 1, 1, 1, 1, 1,
0.02961438, -0.4590016, 3.995326, 1, 1, 1, 1, 1,
0.02965036, 0.6340623, 0.01035166, 1, 1, 1, 1, 1,
0.03767863, 1.071781, 0.4098688, 1, 1, 1, 1, 1,
0.04459935, 0.7575564, 0.7031508, 1, 1, 1, 1, 1,
0.04659745, -1.896802, 2.617337, 1, 1, 1, 1, 1,
0.04830001, -1.133156, 4.584526, 1, 1, 1, 1, 1,
0.05080437, 0.007433555, 1.152967, 1, 1, 1, 1, 1,
0.0524612, -0.7045459, 4.38199, 1, 1, 1, 1, 1,
0.05406239, 0.08340657, -1.093333, 1, 1, 1, 1, 1,
0.05687371, 0.1891043, -0.4398235, 1, 1, 1, 1, 1,
0.05726701, 0.3428274, -0.1079063, 1, 1, 1, 1, 1,
0.05919627, 1.076113, -1.910809, 1, 1, 1, 1, 1,
0.06037424, 0.1958417, -1.509724, 1, 1, 1, 1, 1,
0.06294128, -1.591371, 2.724978, 0, 0, 1, 1, 1,
0.06385453, 1.000195, 0.2121359, 1, 0, 0, 1, 1,
0.06788681, -0.8174172, 3.328027, 1, 0, 0, 1, 1,
0.06955192, -0.8749584, 3.531444, 1, 0, 0, 1, 1,
0.07367496, -0.3517298, 3.796453, 1, 0, 0, 1, 1,
0.07650712, -1.299037, 4.768257, 1, 0, 0, 1, 1,
0.08319344, 1.166272, 0.3003718, 0, 0, 0, 1, 1,
0.08423274, -0.1028436, 1.814395, 0, 0, 0, 1, 1,
0.08782343, 0.1072086, 1.760732, 0, 0, 0, 1, 1,
0.0883956, 0.1343931, 0.7612914, 0, 0, 0, 1, 1,
0.08946894, -0.8939124, 3.060167, 0, 0, 0, 1, 1,
0.09073281, -0.8297811, 3.49518, 0, 0, 0, 1, 1,
0.09246971, -0.2644759, 3.43399, 0, 0, 0, 1, 1,
0.1042661, -0.2925054, 2.573811, 1, 1, 1, 1, 1,
0.1082127, 0.6355407, 0.4958534, 1, 1, 1, 1, 1,
0.1094168, 0.1078569, 0.530599, 1, 1, 1, 1, 1,
0.1163745, -0.4896271, 2.71203, 1, 1, 1, 1, 1,
0.1163857, 2.264441, -2.09799, 1, 1, 1, 1, 1,
0.1173574, -0.4477947, 2.116593, 1, 1, 1, 1, 1,
0.1174207, -0.8405749, 3.367316, 1, 1, 1, 1, 1,
0.1193618, -1.023451, 3.245919, 1, 1, 1, 1, 1,
0.1228617, -1.689513, 3.638001, 1, 1, 1, 1, 1,
0.1259087, 0.1740697, -0.1875834, 1, 1, 1, 1, 1,
0.1277987, 0.8595753, -0.3658407, 1, 1, 1, 1, 1,
0.1324638, -0.1088096, 2.802058, 1, 1, 1, 1, 1,
0.1332681, 2.696869, -1.906367, 1, 1, 1, 1, 1,
0.1380242, 0.7346144, 0.1891459, 1, 1, 1, 1, 1,
0.1402306, -0.3056162, 2.033542, 1, 1, 1, 1, 1,
0.1411465, -0.4195405, 2.893653, 0, 0, 1, 1, 1,
0.1418047, -0.07469978, 0.2589462, 1, 0, 0, 1, 1,
0.1426817, -1.136557, 3.87842, 1, 0, 0, 1, 1,
0.1466002, 0.04929685, 1.863228, 1, 0, 0, 1, 1,
0.1475241, -0.5130551, 2.563424, 1, 0, 0, 1, 1,
0.1615668, -0.8083762, 3.135253, 1, 0, 0, 1, 1,
0.1645121, -1.234105, 3.513332, 0, 0, 0, 1, 1,
0.1664621, 1.176625, -0.186416, 0, 0, 0, 1, 1,
0.1701491, 0.4452911, -0.1950619, 0, 0, 0, 1, 1,
0.1706999, -0.3767376, 4.215785, 0, 0, 0, 1, 1,
0.1721457, -1.757586, 3.365953, 0, 0, 0, 1, 1,
0.1734444, 0.5905032, 0.357022, 0, 0, 0, 1, 1,
0.17804, -0.4965589, 3.17299, 0, 0, 0, 1, 1,
0.1839635, 0.9179494, -0.211084, 1, 1, 1, 1, 1,
0.1879996, -1.19465, 4.340893, 1, 1, 1, 1, 1,
0.1884712, 0.4334288, 1.42121, 1, 1, 1, 1, 1,
0.1888442, -1.106116, 4.256495, 1, 1, 1, 1, 1,
0.1903966, -0.1972313, 2.871743, 1, 1, 1, 1, 1,
0.1912721, -0.7722356, 3.064897, 1, 1, 1, 1, 1,
0.1932968, -0.1130568, 1.281293, 1, 1, 1, 1, 1,
0.1937507, -1.837946, 4.278607, 1, 1, 1, 1, 1,
0.1969891, 1.18161, -0.9436909, 1, 1, 1, 1, 1,
0.1980819, 0.6351491, 0.8329002, 1, 1, 1, 1, 1,
0.2065196, -1.415153, 3.321075, 1, 1, 1, 1, 1,
0.2080707, 1.335425, -0.4677813, 1, 1, 1, 1, 1,
0.2092801, 0.7790383, 1.822196, 1, 1, 1, 1, 1,
0.2097667, 0.9835671, 0.5012546, 1, 1, 1, 1, 1,
0.210536, 1.22248, -0.806489, 1, 1, 1, 1, 1,
0.2120137, 0.5605322, -0.3180269, 0, 0, 1, 1, 1,
0.2127899, -1.858084, 3.102101, 1, 0, 0, 1, 1,
0.2142286, -1.789619, 3.503139, 1, 0, 0, 1, 1,
0.2214262, 0.348694, 1.129695, 1, 0, 0, 1, 1,
0.2220346, -0.2321144, 3.786356, 1, 0, 0, 1, 1,
0.2269104, -0.300853, 1.53959, 1, 0, 0, 1, 1,
0.2269819, -1.534053, 3.099412, 0, 0, 0, 1, 1,
0.2292353, 0.5046991, 0.8693033, 0, 0, 0, 1, 1,
0.234196, 0.2942708, 0.554748, 0, 0, 0, 1, 1,
0.2465566, -1.004099, 4.061244, 0, 0, 0, 1, 1,
0.2517916, -3.461705, 2.843667, 0, 0, 0, 1, 1,
0.2529139, -0.5575808, 2.986792, 0, 0, 0, 1, 1,
0.258076, -0.2084257, 1.918189, 0, 0, 0, 1, 1,
0.2587512, -0.34717, 4.366107, 1, 1, 1, 1, 1,
0.2660815, 0.195753, 0.179178, 1, 1, 1, 1, 1,
0.2675132, 0.5108724, -1.898432, 1, 1, 1, 1, 1,
0.2702379, -0.5162604, 2.887049, 1, 1, 1, 1, 1,
0.2745513, 0.5040249, 2.020558, 1, 1, 1, 1, 1,
0.2783121, 0.08540365, 2.919327, 1, 1, 1, 1, 1,
0.2795959, -1.850553, 2.399793, 1, 1, 1, 1, 1,
0.2826542, -0.7656801, 3.206766, 1, 1, 1, 1, 1,
0.2832928, 0.821249, -0.2735049, 1, 1, 1, 1, 1,
0.286515, 1.026337, -0.1562471, 1, 1, 1, 1, 1,
0.2901367, 0.330355, -0.210288, 1, 1, 1, 1, 1,
0.2935524, -0.7361381, 2.164712, 1, 1, 1, 1, 1,
0.2935803, 0.2301824, 1.124677, 1, 1, 1, 1, 1,
0.2964769, 1.355085, 0.110137, 1, 1, 1, 1, 1,
0.3008242, -1.012225, 2.818932, 1, 1, 1, 1, 1,
0.3098749, 0.7367979, 1.37315, 0, 0, 1, 1, 1,
0.3112076, 0.6413628, -0.02654783, 1, 0, 0, 1, 1,
0.3124241, 0.1078327, 0.793759, 1, 0, 0, 1, 1,
0.313673, -0.023804, 1.159336, 1, 0, 0, 1, 1,
0.313914, -0.123686, 0.2836421, 1, 0, 0, 1, 1,
0.3139912, -0.8069187, 1.56434, 1, 0, 0, 1, 1,
0.3155998, -0.1751742, 4.608882, 0, 0, 0, 1, 1,
0.3198165, -1.445136, 3.680365, 0, 0, 0, 1, 1,
0.3198786, 0.06675915, 1.98604, 0, 0, 0, 1, 1,
0.3277185, 0.1680679, 0.2536606, 0, 0, 0, 1, 1,
0.329023, 0.4679275, 1.431709, 0, 0, 0, 1, 1,
0.3292564, 0.1158107, 1.160771, 0, 0, 0, 1, 1,
0.3330915, -0.2939559, 2.793725, 0, 0, 0, 1, 1,
0.3332195, -0.528556, 3.584437, 1, 1, 1, 1, 1,
0.3362414, 0.6268887, -0.0313141, 1, 1, 1, 1, 1,
0.3369595, -0.4058403, 1.077397, 1, 1, 1, 1, 1,
0.3378617, 0.1900902, 0.8115644, 1, 1, 1, 1, 1,
0.3434287, -0.1120061, 1.313414, 1, 1, 1, 1, 1,
0.3501229, -0.4820936, 0.4121744, 1, 1, 1, 1, 1,
0.3520631, -2.781062, 2.438239, 1, 1, 1, 1, 1,
0.3540983, 0.3560496, 2.255592, 1, 1, 1, 1, 1,
0.3578421, -1.028111, 1.100103, 1, 1, 1, 1, 1,
0.3616151, 0.6162772, -1.316476, 1, 1, 1, 1, 1,
0.3624483, -0.1870755, 1.440665, 1, 1, 1, 1, 1,
0.3629194, 0.8149126, 0.9195585, 1, 1, 1, 1, 1,
0.3636448, 0.9242197, 0.8899114, 1, 1, 1, 1, 1,
0.3652341, -0.08243616, 1.886086, 1, 1, 1, 1, 1,
0.3683971, -0.7904792, 2.836014, 1, 1, 1, 1, 1,
0.369074, 2.059148, 0.9187707, 0, 0, 1, 1, 1,
0.3694952, -0.4004901, 2.361407, 1, 0, 0, 1, 1,
0.3699001, 0.3613205, 0.603002, 1, 0, 0, 1, 1,
0.3715367, -1.578439, 3.118539, 1, 0, 0, 1, 1,
0.380195, -0.617843, 1.867915, 1, 0, 0, 1, 1,
0.3815163, 0.7264496, 0.9850899, 1, 0, 0, 1, 1,
0.3823106, 0.8698115, -0.4282758, 0, 0, 0, 1, 1,
0.384993, 0.2208253, 1.127069, 0, 0, 0, 1, 1,
0.3856375, -0.4352486, 0.867029, 0, 0, 0, 1, 1,
0.3900536, 0.3131953, 0.7253879, 0, 0, 0, 1, 1,
0.394395, -0.4759272, 3.242793, 0, 0, 0, 1, 1,
0.3975224, 0.7443021, 1.50575, 0, 0, 0, 1, 1,
0.4013267, -0.5022265, 1.287314, 0, 0, 0, 1, 1,
0.4020056, 1.511087, 0.2365004, 1, 1, 1, 1, 1,
0.4034191, -1.211437, 3.035061, 1, 1, 1, 1, 1,
0.4048574, 0.3921714, 1.239767, 1, 1, 1, 1, 1,
0.4086946, -0.269532, 2.180342, 1, 1, 1, 1, 1,
0.4107272, 0.6045657, 0.7573119, 1, 1, 1, 1, 1,
0.4129451, 1.093177, 0.9024256, 1, 1, 1, 1, 1,
0.4134309, -0.1362811, 1.254603, 1, 1, 1, 1, 1,
0.4134889, -0.3002371, 2.071613, 1, 1, 1, 1, 1,
0.4178945, -2.472099, 3.285385, 1, 1, 1, 1, 1,
0.4185886, 0.06602342, 2.138479, 1, 1, 1, 1, 1,
0.4241034, -1.149269, 2.769686, 1, 1, 1, 1, 1,
0.4259034, 0.3513722, -0.01289701, 1, 1, 1, 1, 1,
0.4275594, 0.7124331, 0.4117836, 1, 1, 1, 1, 1,
0.4278238, 1.904102, 0.04547384, 1, 1, 1, 1, 1,
0.4302641, 0.1274697, 0.09554881, 1, 1, 1, 1, 1,
0.4311267, -1.135479, 3.230797, 0, 0, 1, 1, 1,
0.433791, -0.1052302, 2.451803, 1, 0, 0, 1, 1,
0.4366424, -0.8225859, 1.805411, 1, 0, 0, 1, 1,
0.4380616, 0.1390107, 0.3222204, 1, 0, 0, 1, 1,
0.4383776, 1.423254, 0.5308498, 1, 0, 0, 1, 1,
0.4508645, 0.1461883, 1.709491, 1, 0, 0, 1, 1,
0.454751, 0.3912854, 0.6553892, 0, 0, 0, 1, 1,
0.4564167, 0.02393048, 1.000221, 0, 0, 0, 1, 1,
0.4584807, -3.37101, 1.936807, 0, 0, 0, 1, 1,
0.4637566, -0.7921232, 2.418081, 0, 0, 0, 1, 1,
0.4683801, -1.544467, 3.266658, 0, 0, 0, 1, 1,
0.4694021, 0.3010436, 2.479368, 0, 0, 0, 1, 1,
0.4767208, 2.692052, -0.05324788, 0, 0, 0, 1, 1,
0.4779939, 0.5793436, 1.775255, 1, 1, 1, 1, 1,
0.4846336, -0.5966113, 2.5871, 1, 1, 1, 1, 1,
0.4871352, -1.46932, 2.622482, 1, 1, 1, 1, 1,
0.4893332, 1.754012, 1.212648, 1, 1, 1, 1, 1,
0.4914544, 0.8450487, -0.8926536, 1, 1, 1, 1, 1,
0.4921559, 0.7604192, -0.01885164, 1, 1, 1, 1, 1,
0.5017068, -0.06754731, 1.902703, 1, 1, 1, 1, 1,
0.5083712, -0.09727512, 2.320324, 1, 1, 1, 1, 1,
0.5083981, -0.7162182, 2.360338, 1, 1, 1, 1, 1,
0.5101839, 1.488474, 1.751853, 1, 1, 1, 1, 1,
0.5114022, -0.6307287, 3.011026, 1, 1, 1, 1, 1,
0.5121012, -1.362923, 4.822268, 1, 1, 1, 1, 1,
0.5171898, -0.7548993, 3.453552, 1, 1, 1, 1, 1,
0.5176938, -0.2544869, 4.205484, 1, 1, 1, 1, 1,
0.5202504, 0.06872231, 2.404623, 1, 1, 1, 1, 1,
0.5265528, -1.516995, 3.01028, 0, 0, 1, 1, 1,
0.527532, -0.1418227, 1.692982, 1, 0, 0, 1, 1,
0.5310705, -0.1391878, 1.872659, 1, 0, 0, 1, 1,
0.539596, 0.4879606, 1.40859, 1, 0, 0, 1, 1,
0.5417405, -1.132451, 4.115638, 1, 0, 0, 1, 1,
0.5426705, -0.5529145, 2.175075, 1, 0, 0, 1, 1,
0.5439894, -0.9246171, 4.19479, 0, 0, 0, 1, 1,
0.5463549, 0.6211594, 1.526983, 0, 0, 0, 1, 1,
0.5475126, -0.7519801, 4.074256, 0, 0, 0, 1, 1,
0.5486039, 0.51532, 2.438448, 0, 0, 0, 1, 1,
0.5552192, -0.6061849, 2.637229, 0, 0, 0, 1, 1,
0.5623388, 1.095137, 0.1198591, 0, 0, 0, 1, 1,
0.5666207, 0.3477368, 1.334218, 0, 0, 0, 1, 1,
0.5671505, -0.6940424, 3.862591, 1, 1, 1, 1, 1,
0.5680912, 0.6815838, -0.09739728, 1, 1, 1, 1, 1,
0.5689287, -2.819622, 3.588658, 1, 1, 1, 1, 1,
0.5747618, 0.8890188, 0.9068463, 1, 1, 1, 1, 1,
0.5820156, 0.4623063, 1.048932, 1, 1, 1, 1, 1,
0.5848821, -0.6121405, 3.125746, 1, 1, 1, 1, 1,
0.5865735, 0.4705729, 1.434593, 1, 1, 1, 1, 1,
0.586886, -1.149345, 1.970364, 1, 1, 1, 1, 1,
0.5881753, 0.4441577, 3.145314, 1, 1, 1, 1, 1,
0.5930668, -0.6878598, 2.600607, 1, 1, 1, 1, 1,
0.5932222, -0.6563017, 2.831895, 1, 1, 1, 1, 1,
0.5947804, -0.1125582, 1.532289, 1, 1, 1, 1, 1,
0.5959724, 0.1579558, 1.939552, 1, 1, 1, 1, 1,
0.5976639, 0.5314695, 0.6617892, 1, 1, 1, 1, 1,
0.6145103, -2.868457, 3.669717, 1, 1, 1, 1, 1,
0.6155162, -0.8100758, 3.502485, 0, 0, 1, 1, 1,
0.6175182, -1.305037, 3.050146, 1, 0, 0, 1, 1,
0.6201309, -0.4485765, 2.197964, 1, 0, 0, 1, 1,
0.6229258, 0.881705, -0.6130173, 1, 0, 0, 1, 1,
0.6246069, -0.2471204, 3.157975, 1, 0, 0, 1, 1,
0.6261165, 0.9811113, 0.5440826, 1, 0, 0, 1, 1,
0.626537, 0.421267, 0.7187687, 0, 0, 0, 1, 1,
0.6288105, 2.07843, -0.3090993, 0, 0, 0, 1, 1,
0.6371895, 1.261355, -0.15929, 0, 0, 0, 1, 1,
0.6402235, 0.1856807, 0.5360256, 0, 0, 0, 1, 1,
0.6507579, 0.7546556, -0.5769755, 0, 0, 0, 1, 1,
0.6713281, 0.8246238, 2.08567, 0, 0, 0, 1, 1,
0.6724778, 0.1431476, 1.302744, 0, 0, 0, 1, 1,
0.6725778, 1.880945, 2.510328, 1, 1, 1, 1, 1,
0.6726113, -0.560742, 0.9582731, 1, 1, 1, 1, 1,
0.6837524, 0.7765954, -0.07144463, 1, 1, 1, 1, 1,
0.6857208, 1.909304, 1.357298, 1, 1, 1, 1, 1,
0.6861788, 0.929992, -0.6285056, 1, 1, 1, 1, 1,
0.6872653, -0.7977417, 1.800494, 1, 1, 1, 1, 1,
0.6883975, -0.9484354, 1.66725, 1, 1, 1, 1, 1,
0.6936789, 0.1512066, 1.20493, 1, 1, 1, 1, 1,
0.6942762, 0.2363372, -0.9912107, 1, 1, 1, 1, 1,
0.695818, 0.07200045, -0.05642005, 1, 1, 1, 1, 1,
0.6965598, 0.7426182, 0.7668506, 1, 1, 1, 1, 1,
0.696788, -0.4942099, 3.31294, 1, 1, 1, 1, 1,
0.6982059, 1.186163, -0.1042643, 1, 1, 1, 1, 1,
0.7042175, -1.242653, 2.713443, 1, 1, 1, 1, 1,
0.7043092, -1.1538, 4.123938, 1, 1, 1, 1, 1,
0.7044411, -1.210417, 2.188847, 0, 0, 1, 1, 1,
0.7088413, 2.315779, -0.03000574, 1, 0, 0, 1, 1,
0.7216406, 0.4685165, 1.220325, 1, 0, 0, 1, 1,
0.7221853, -1.458086, 3.060249, 1, 0, 0, 1, 1,
0.7247764, -0.9517511, 3.408731, 1, 0, 0, 1, 1,
0.7255787, -2.017109, 3.660979, 1, 0, 0, 1, 1,
0.7256005, 0.1212594, 2.284025, 0, 0, 0, 1, 1,
0.7271611, 0.2695081, 0.3312899, 0, 0, 0, 1, 1,
0.7290133, 1.626554, 0.3419638, 0, 0, 0, 1, 1,
0.7314347, -0.8777726, 1.891917, 0, 0, 0, 1, 1,
0.7371343, 2.34893, -0.01703545, 0, 0, 0, 1, 1,
0.7437803, -1.388638, 2.738015, 0, 0, 0, 1, 1,
0.7438776, 0.0314153, 0.8202269, 0, 0, 0, 1, 1,
0.7481085, 1.25001, 0.01818896, 1, 1, 1, 1, 1,
0.7552943, -0.05355483, 2.220261, 1, 1, 1, 1, 1,
0.756718, 1.118227, 0.2043994, 1, 1, 1, 1, 1,
0.757654, -1.238547, 1.965847, 1, 1, 1, 1, 1,
0.7580377, 0.6033828, 2.411428, 1, 1, 1, 1, 1,
0.7688857, -0.03627247, 1.363735, 1, 1, 1, 1, 1,
0.770941, 1.196616, 0.1719367, 1, 1, 1, 1, 1,
0.771212, 0.6716913, 0.7199611, 1, 1, 1, 1, 1,
0.7749089, -0.4793683, 2.502006, 1, 1, 1, 1, 1,
0.774972, 0.2764157, 1.8912, 1, 1, 1, 1, 1,
0.7788183, -0.4572235, 1.160242, 1, 1, 1, 1, 1,
0.7794567, 0.5113439, -1.155821, 1, 1, 1, 1, 1,
0.785454, -0.4341052, 0.8666294, 1, 1, 1, 1, 1,
0.787479, 1.220452, 1.347066, 1, 1, 1, 1, 1,
0.7886205, -0.4098763, 2.050496, 1, 1, 1, 1, 1,
0.7957094, -0.3730874, 1.687146, 0, 0, 1, 1, 1,
0.8048468, 0.68244, 1.757396, 1, 0, 0, 1, 1,
0.8073411, -1.068934, 1.605766, 1, 0, 0, 1, 1,
0.8082302, -1.660167, 1.79258, 1, 0, 0, 1, 1,
0.8178533, 1.32702, 1.480865, 1, 0, 0, 1, 1,
0.8196375, -0.2506053, 2.248572, 1, 0, 0, 1, 1,
0.8218827, -0.8064132, 3.562301, 0, 0, 0, 1, 1,
0.8229156, -0.8091576, 2.630491, 0, 0, 0, 1, 1,
0.831566, 1.249702, 1.367321, 0, 0, 0, 1, 1,
0.8324259, 1.872311, 0.8410398, 0, 0, 0, 1, 1,
0.8324401, 0.9987657, 1.337626, 0, 0, 0, 1, 1,
0.8410837, -0.1269109, 1.571742, 0, 0, 0, 1, 1,
0.8460398, 0.5965941, 2.286763, 0, 0, 0, 1, 1,
0.8470854, 1.645026, -1.272375, 1, 1, 1, 1, 1,
0.8492222, -0.4711524, 3.55622, 1, 1, 1, 1, 1,
0.8513362, 0.1797849, 0.6416494, 1, 1, 1, 1, 1,
0.856862, -1.460871, 0.8498589, 1, 1, 1, 1, 1,
0.8582637, -0.5287722, 0.7594047, 1, 1, 1, 1, 1,
0.8626498, 0.6304593, 0.18175, 1, 1, 1, 1, 1,
0.8636209, 0.08157998, 2.075544, 1, 1, 1, 1, 1,
0.8646446, 0.5772532, 2.986376, 1, 1, 1, 1, 1,
0.8657863, 0.200158, 2.470189, 1, 1, 1, 1, 1,
0.8713049, -0.3911418, 1.03963, 1, 1, 1, 1, 1,
0.8729249, -0.7406062, 3.887161, 1, 1, 1, 1, 1,
0.8807141, -1.458908, 2.886906, 1, 1, 1, 1, 1,
0.8808452, -0.9081269, 0.1996726, 1, 1, 1, 1, 1,
0.887822, 2.692736, 1.226658, 1, 1, 1, 1, 1,
0.8938139, -0.7543316, 1.613633, 1, 1, 1, 1, 1,
0.8943105, 0.2164161, 1.574834, 0, 0, 1, 1, 1,
0.8999981, 2.21055, -0.08803622, 1, 0, 0, 1, 1,
0.9008019, 2.105843, 0.4470212, 1, 0, 0, 1, 1,
0.9118117, -0.7110751, 2.712782, 1, 0, 0, 1, 1,
0.9171944, 0.09137386, 1.386979, 1, 0, 0, 1, 1,
0.9209309, -0.08963352, 1.658276, 1, 0, 0, 1, 1,
0.92237, 0.7494619, 1.097721, 0, 0, 0, 1, 1,
0.9278141, -0.7760834, 2.500882, 0, 0, 0, 1, 1,
0.9329056, -0.6346826, 0.6216758, 0, 0, 0, 1, 1,
0.9333411, 0.07707943, 0.8935859, 0, 0, 0, 1, 1,
0.9588097, -0.3933653, 3.073238, 0, 0, 0, 1, 1,
0.9627366, -0.04695646, 2.964156, 0, 0, 0, 1, 1,
0.9673473, -0.8072758, 1.759081, 0, 0, 0, 1, 1,
0.9711374, -1.088902, 2.183275, 1, 1, 1, 1, 1,
0.9754189, 1.611382, 0.385676, 1, 1, 1, 1, 1,
0.9798207, 0.1731137, 1.145115, 1, 1, 1, 1, 1,
0.9812629, 0.3868416, 1.830686, 1, 1, 1, 1, 1,
0.9823323, 0.2291037, 0.9280713, 1, 1, 1, 1, 1,
0.9890398, -0.7042565, 2.427393, 1, 1, 1, 1, 1,
1.001285, 0.7318509, 1.977748, 1, 1, 1, 1, 1,
1.00152, -1.112809, 3.077163, 1, 1, 1, 1, 1,
1.00203, 1.500928, 1.070525, 1, 1, 1, 1, 1,
1.002841, 0.4706042, -0.1281452, 1, 1, 1, 1, 1,
1.003244, 0.6918288, 1.865327, 1, 1, 1, 1, 1,
1.004004, 0.5446162, 1.22942, 1, 1, 1, 1, 1,
1.008623, 0.5806645, 2.441647, 1, 1, 1, 1, 1,
1.008837, -1.955963, 1.084536, 1, 1, 1, 1, 1,
1.00947, -1.385666, 0.3677712, 1, 1, 1, 1, 1,
1.010243, 0.6977774, 1.205469, 0, 0, 1, 1, 1,
1.014233, -1.740199, 3.876785, 1, 0, 0, 1, 1,
1.016103, -1.209318, 4.573767, 1, 0, 0, 1, 1,
1.024248, -0.09112492, 0.7153772, 1, 0, 0, 1, 1,
1.03153, -0.7844248, 1.338289, 1, 0, 0, 1, 1,
1.038363, 0.03314925, 2.353341, 1, 0, 0, 1, 1,
1.038638, 0.9708372, 1.368949, 0, 0, 0, 1, 1,
1.039238, 0.1727135, 1.242751, 0, 0, 0, 1, 1,
1.044618, 0.341772, 3.23089, 0, 0, 0, 1, 1,
1.045091, -0.8576179, 0.813673, 0, 0, 0, 1, 1,
1.056211, 0.5716553, 0.8204212, 0, 0, 0, 1, 1,
1.059706, 0.4896451, 2.261637, 0, 0, 0, 1, 1,
1.067468, 0.541105, 0.5686076, 0, 0, 0, 1, 1,
1.069365, 0.3283954, 1.951522, 1, 1, 1, 1, 1,
1.072794, -1.883751, 2.578488, 1, 1, 1, 1, 1,
1.076897, 2.190848, 1.338258, 1, 1, 1, 1, 1,
1.083054, -0.5448393, 3.523972, 1, 1, 1, 1, 1,
1.086903, 1.675042, -0.7334151, 1, 1, 1, 1, 1,
1.098291, -0.1988529, 1.642629, 1, 1, 1, 1, 1,
1.11385, -0.4850391, 4.408, 1, 1, 1, 1, 1,
1.123993, 1.661556, -0.1046618, 1, 1, 1, 1, 1,
1.124924, -0.7261401, 0.1794111, 1, 1, 1, 1, 1,
1.125706, 0.6177291, 1.820812, 1, 1, 1, 1, 1,
1.136252, -0.112977, 2.42453, 1, 1, 1, 1, 1,
1.145212, -0.5043776, 1.694285, 1, 1, 1, 1, 1,
1.158858, -0.3681785, 2.259338, 1, 1, 1, 1, 1,
1.1612, 1.390433, 1.457034, 1, 1, 1, 1, 1,
1.165378, 0.3431055, 1.404906, 1, 1, 1, 1, 1,
1.174366, 1.400879, -0.1573543, 0, 0, 1, 1, 1,
1.177893, 0.5916903, 2.806237, 1, 0, 0, 1, 1,
1.178709, -1.196678, 2.602509, 1, 0, 0, 1, 1,
1.19692, 1.477076, 1.580105, 1, 0, 0, 1, 1,
1.198527, -1.970899, 2.218473, 1, 0, 0, 1, 1,
1.2034, 0.1910714, 1.243762, 1, 0, 0, 1, 1,
1.214301, 0.9909465, 0.3287573, 0, 0, 0, 1, 1,
1.217829, -0.834774, 1.454956, 0, 0, 0, 1, 1,
1.219184, -1.407494, 2.562577, 0, 0, 0, 1, 1,
1.229961, -1.288599, 2.312962, 0, 0, 0, 1, 1,
1.230363, -0.649452, 1.656256, 0, 0, 0, 1, 1,
1.238242, 0.4835921, 1.411637, 0, 0, 0, 1, 1,
1.247547, 1.123637, 0.6347266, 0, 0, 0, 1, 1,
1.247555, -0.8391222, 1.886944, 1, 1, 1, 1, 1,
1.248549, -0.2974753, 1.587829, 1, 1, 1, 1, 1,
1.256351, -0.9071624, 1.824254, 1, 1, 1, 1, 1,
1.259064, -0.8545997, 3.758972, 1, 1, 1, 1, 1,
1.264673, -0.406557, 2.79331, 1, 1, 1, 1, 1,
1.270761, -0.1631954, 2.289877, 1, 1, 1, 1, 1,
1.271225, -1.437804, 3.966458, 1, 1, 1, 1, 1,
1.280314, -0.8379708, 2.005505, 1, 1, 1, 1, 1,
1.287615, -0.1101277, 2.903908, 1, 1, 1, 1, 1,
1.288979, 1.924882, 0.1406361, 1, 1, 1, 1, 1,
1.290533, 0.7279404, 1.644024, 1, 1, 1, 1, 1,
1.292956, -2.191569, 1.412631, 1, 1, 1, 1, 1,
1.294783, 2.029153, 1.260486, 1, 1, 1, 1, 1,
1.302342, -2.273618, 1.945361, 1, 1, 1, 1, 1,
1.315242, 0.9700957, 0.785046, 1, 1, 1, 1, 1,
1.317619, -0.7031691, 1.69247, 0, 0, 1, 1, 1,
1.320981, -1.573216, 3.197241, 1, 0, 0, 1, 1,
1.321694, 0.5188213, -0.7397249, 1, 0, 0, 1, 1,
1.333936, 1.007879, -0.5349805, 1, 0, 0, 1, 1,
1.349209, -0.3984878, 1.367481, 1, 0, 0, 1, 1,
1.364551, -0.9935352, 1.323243, 1, 0, 0, 1, 1,
1.38129, -0.2857109, 2.348361, 0, 0, 0, 1, 1,
1.38375, 0.2030066, 0.1247705, 0, 0, 0, 1, 1,
1.384365, -0.6411064, 1.503286, 0, 0, 0, 1, 1,
1.387115, -0.5440518, 1.956013, 0, 0, 0, 1, 1,
1.397962, -0.59574, 2.157888, 0, 0, 0, 1, 1,
1.399027, -0.03506068, -0.3376836, 0, 0, 0, 1, 1,
1.399405, 1.444606, 0.5606094, 0, 0, 0, 1, 1,
1.401163, -0.4600353, 4.002501, 1, 1, 1, 1, 1,
1.403446, -0.9942288, 1.494987, 1, 1, 1, 1, 1,
1.409087, 2.225859, 1.298159, 1, 1, 1, 1, 1,
1.417141, 0.1060631, 1.776138, 1, 1, 1, 1, 1,
1.422496, -0.3048928, 1.558371, 1, 1, 1, 1, 1,
1.427535, 1.03003, -0.2383427, 1, 1, 1, 1, 1,
1.434708, 0.8909428, 0.2452901, 1, 1, 1, 1, 1,
1.43884, 0.636278, 2.241629, 1, 1, 1, 1, 1,
1.440199, 0.8690877, 1.483631, 1, 1, 1, 1, 1,
1.445241, 0.6867883, 0.8196402, 1, 1, 1, 1, 1,
1.445298, 0.5416525, 2.372441, 1, 1, 1, 1, 1,
1.453368, -0.8843605, 2.299739, 1, 1, 1, 1, 1,
1.464741, 0.915448, -1.349699, 1, 1, 1, 1, 1,
1.476546, 2.09443, 0.2757217, 1, 1, 1, 1, 1,
1.496629, -1.302995, 3.590936, 1, 1, 1, 1, 1,
1.497864, -0.4852817, 2.590563, 0, 0, 1, 1, 1,
1.509428, -0.5054083, 2.23236, 1, 0, 0, 1, 1,
1.51094, 0.2878293, 1.313108, 1, 0, 0, 1, 1,
1.51428, 1.15606, -0.6086451, 1, 0, 0, 1, 1,
1.522318, 1.056096, 4.382339, 1, 0, 0, 1, 1,
1.53418, 0.1662775, 2.942362, 1, 0, 0, 1, 1,
1.538009, -0.386398, 0.5233307, 0, 0, 0, 1, 1,
1.539902, 1.442929, -0.1567901, 0, 0, 0, 1, 1,
1.547471, 0.5093933, 3.591922, 0, 0, 0, 1, 1,
1.549246, -1.192698, 4.218503, 0, 0, 0, 1, 1,
1.550041, -0.5600514, -0.2525499, 0, 0, 0, 1, 1,
1.550048, -1.049549, 3.183296, 0, 0, 0, 1, 1,
1.560202, -0.3384062, -0.1397709, 0, 0, 0, 1, 1,
1.563144, -0.1085392, 1.619661, 1, 1, 1, 1, 1,
1.571309, -0.1381726, 0.6408002, 1, 1, 1, 1, 1,
1.582638, -2.187193, 4.399103, 1, 1, 1, 1, 1,
1.6113, 0.3032943, 1.119618, 1, 1, 1, 1, 1,
1.615101, 0.3269381, 3.251714, 1, 1, 1, 1, 1,
1.634686, -1.899145, 3.723865, 1, 1, 1, 1, 1,
1.635028, 0.1095318, 1.023517, 1, 1, 1, 1, 1,
1.660657, 0.7028015, 1.122817, 1, 1, 1, 1, 1,
1.677921, 1.664518, 1.885897, 1, 1, 1, 1, 1,
1.691939, -1.207252, 2.849316, 1, 1, 1, 1, 1,
1.692273, 0.8183915, -0.4023485, 1, 1, 1, 1, 1,
1.694587, 0.3964769, 1.304795, 1, 1, 1, 1, 1,
1.704895, 0.2751368, 1.42604, 1, 1, 1, 1, 1,
1.70755, 1.151478, -0.2968677, 1, 1, 1, 1, 1,
1.710816, 0.5073754, 1.663011, 1, 1, 1, 1, 1,
1.716065, -0.1388275, 2.220899, 0, 0, 1, 1, 1,
1.737342, 0.8657581, 1.963657, 1, 0, 0, 1, 1,
1.747877, 1.186604, 0.5790157, 1, 0, 0, 1, 1,
1.779061, -0.6028048, 3.703295, 1, 0, 0, 1, 1,
1.794278, 0.023669, 1.266618, 1, 0, 0, 1, 1,
1.800627, 0.4344366, 2.921548, 1, 0, 0, 1, 1,
1.816619, -1.357017, 1.362546, 0, 0, 0, 1, 1,
1.834442, -0.5823404, 2.709179, 0, 0, 0, 1, 1,
1.846277, -2.724401, 3.029706, 0, 0, 0, 1, 1,
1.85407, -2.318424, 3.10603, 0, 0, 0, 1, 1,
1.858308, 0.2835002, 2.034609, 0, 0, 0, 1, 1,
1.882611, 0.335629, 1.927434, 0, 0, 0, 1, 1,
1.896971, -1.522274, 2.388215, 0, 0, 0, 1, 1,
1.904279, -0.4125704, 2.31342, 1, 1, 1, 1, 1,
1.91088, 2.198228, 0.4196067, 1, 1, 1, 1, 1,
1.917074, -0.1586612, 1.963935, 1, 1, 1, 1, 1,
1.932412, -0.7930086, 1.720845, 1, 1, 1, 1, 1,
1.937541, 0.2881185, -0.3004825, 1, 1, 1, 1, 1,
1.943556, 1.097897, 0.989024, 1, 1, 1, 1, 1,
1.98127, -1.315792, 2.70322, 1, 1, 1, 1, 1,
2.003409, -0.06550929, 3.378818, 1, 1, 1, 1, 1,
2.006399, 0.4728235, -0.9369583, 1, 1, 1, 1, 1,
2.019044, -1.933144, 2.677123, 1, 1, 1, 1, 1,
2.045734, -0.2341018, 1.632562, 1, 1, 1, 1, 1,
2.05497, -0.06737462, 2.652297, 1, 1, 1, 1, 1,
2.073179, 3.191671, 0.7170811, 1, 1, 1, 1, 1,
2.103844, -0.08308452, 0.4445615, 1, 1, 1, 1, 1,
2.146324, 0.8555665, 1.955156, 1, 1, 1, 1, 1,
2.18522, 0.4210575, -0.6369162, 0, 0, 1, 1, 1,
2.24787, -0.1825185, 2.555439, 1, 0, 0, 1, 1,
2.29688, 0.3829685, 2.096429, 1, 0, 0, 1, 1,
2.327292, 0.1771168, 1.474824, 1, 0, 0, 1, 1,
2.33791, -0.7700092, 1.959448, 1, 0, 0, 1, 1,
2.35214, 0.2226704, 0.9577492, 1, 0, 0, 1, 1,
2.378806, 0.1321007, 2.124951, 0, 0, 0, 1, 1,
2.401626, 0.3440478, 1.553285, 0, 0, 0, 1, 1,
2.453971, 0.09080233, 1.606366, 0, 0, 0, 1, 1,
2.490387, -1.171678, 1.03662, 0, 0, 0, 1, 1,
2.534461, -0.2650661, 2.165849, 0, 0, 0, 1, 1,
2.720051, -0.6754447, 1.63059, 0, 0, 0, 1, 1,
2.808441, 0.147431, 0.389383, 0, 0, 0, 1, 1,
2.81285, -0.6321054, 2.132368, 1, 1, 1, 1, 1,
2.950761, 1.22733, 1.872419, 1, 1, 1, 1, 1,
3.006009, 0.7975439, 1.103099, 1, 1, 1, 1, 1,
3.008709, 0.8807543, 2.29573, 1, 1, 1, 1, 1,
3.038004, -1.253126, 0.9415771, 1, 1, 1, 1, 1,
3.354794, -0.8409519, 1.466222, 1, 1, 1, 1, 1,
3.521753, -1.570505, 2.239843, 1, 1, 1, 1, 1
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
var radius = 9.505652;
var distance = 33.3882;
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
mvMatrix.translate( -0.260025, 0.1350169, 0.3253326 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.3882);
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
