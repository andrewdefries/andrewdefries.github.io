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
-3.74653, -0.254631, -0.8897196, 1, 0, 0, 1,
-3.169329, -0.1574741, -0.2764191, 1, 0.007843138, 0, 1,
-3.094436, -1.047461, -0.8030645, 1, 0.01176471, 0, 1,
-2.940406, -1.11325, -1.680325, 1, 0.01960784, 0, 1,
-2.83757, -0.09175084, -2.144159, 1, 0.02352941, 0, 1,
-2.640257, -0.7844765, -1.837479, 1, 0.03137255, 0, 1,
-2.498001, -0.8969618, -1.539458, 1, 0.03529412, 0, 1,
-2.450859, -0.8643963, -1.54405, 1, 0.04313726, 0, 1,
-2.388101, -0.1610505, -1.169257, 1, 0.04705882, 0, 1,
-2.353698, -0.4690368, -1.221188, 1, 0.05490196, 0, 1,
-2.343125, -0.2423006, -1.216992, 1, 0.05882353, 0, 1,
-2.338693, -0.1311654, -1.357189, 1, 0.06666667, 0, 1,
-2.308029, 1.00196, -0.7239816, 1, 0.07058824, 0, 1,
-2.301523, -0.1771647, 0.5564418, 1, 0.07843138, 0, 1,
-2.220327, -1.219337, -3.194239, 1, 0.08235294, 0, 1,
-2.215545, 1.406047, -0.1516968, 1, 0.09019608, 0, 1,
-2.192562, -0.3753019, -1.268628, 1, 0.09411765, 0, 1,
-2.170442, 0.3014368, -1.27781, 1, 0.1019608, 0, 1,
-2.152474, -0.2159648, -0.2005032, 1, 0.1098039, 0, 1,
-2.140608, -0.2877921, -1.91041, 1, 0.1137255, 0, 1,
-2.12719, -0.2757453, -0.1219944, 1, 0.1215686, 0, 1,
-2.083978, -0.6279227, -0.7778996, 1, 0.1254902, 0, 1,
-2.016279, 0.05566083, -1.104376, 1, 0.1333333, 0, 1,
-2.013427, -0.6789225, -1.462683, 1, 0.1372549, 0, 1,
-2.00809, -0.2259848, -2.140115, 1, 0.145098, 0, 1,
-1.995323, -0.4894492, -2.779042, 1, 0.1490196, 0, 1,
-1.974108, 0.2679206, -1.271926, 1, 0.1568628, 0, 1,
-1.972638, -1.767256, -3.03945, 1, 0.1607843, 0, 1,
-1.941107, 2.272834, -1.875402, 1, 0.1686275, 0, 1,
-1.940998, 0.07431819, -1.568852, 1, 0.172549, 0, 1,
-1.939957, -1.1658, -1.735096, 1, 0.1803922, 0, 1,
-1.914362, 0.60172, -1.421775, 1, 0.1843137, 0, 1,
-1.901398, -1.309421, -0.1236771, 1, 0.1921569, 0, 1,
-1.893721, 0.8591888, 0.01194518, 1, 0.1960784, 0, 1,
-1.88105, -1.258267, -0.6031945, 1, 0.2039216, 0, 1,
-1.849785, 0.2214653, -0.9798132, 1, 0.2117647, 0, 1,
-1.832722, -0.3213283, -2.40907, 1, 0.2156863, 0, 1,
-1.824435, -0.04348072, -1.799052, 1, 0.2235294, 0, 1,
-1.822346, 0.3416072, -0.6602896, 1, 0.227451, 0, 1,
-1.81223, 0.7698948, -0.3748136, 1, 0.2352941, 0, 1,
-1.797794, -0.6805695, -0.6813353, 1, 0.2392157, 0, 1,
-1.796822, -0.5056035, -1.728568, 1, 0.2470588, 0, 1,
-1.788146, -0.1472717, -2.305479, 1, 0.2509804, 0, 1,
-1.77252, -0.4193856, 0.2561584, 1, 0.2588235, 0, 1,
-1.768872, -0.1947069, -1.292904, 1, 0.2627451, 0, 1,
-1.756709, -0.007327276, -2.825351, 1, 0.2705882, 0, 1,
-1.741948, 0.6090144, -0.5490691, 1, 0.2745098, 0, 1,
-1.739241, -1.218624, -2.811776, 1, 0.282353, 0, 1,
-1.698908, -0.992191, -0.9454357, 1, 0.2862745, 0, 1,
-1.695094, 0.06553943, -2.085271, 1, 0.2941177, 0, 1,
-1.690564, -2.465166, -3.054901, 1, 0.3019608, 0, 1,
-1.687719, 0.7992236, -1.461882, 1, 0.3058824, 0, 1,
-1.671538, -0.1595521, -1.045993, 1, 0.3137255, 0, 1,
-1.669416, -0.4554058, -1.839497, 1, 0.3176471, 0, 1,
-1.656289, 0.02421933, -0.3309347, 1, 0.3254902, 0, 1,
-1.651844, 0.02175552, -1.523348, 1, 0.3294118, 0, 1,
-1.641916, 0.8506902, -0.805503, 1, 0.3372549, 0, 1,
-1.634668, 0.2910642, -0.1145077, 1, 0.3411765, 0, 1,
-1.624675, 0.0940813, -2.039587, 1, 0.3490196, 0, 1,
-1.6155, 0.0421691, -2.607901, 1, 0.3529412, 0, 1,
-1.606964, 1.602241, -1.984294, 1, 0.3607843, 0, 1,
-1.577711, 1.079967, -2.059918, 1, 0.3647059, 0, 1,
-1.566843, 0.9944094, -1.480428, 1, 0.372549, 0, 1,
-1.558567, 1.076678, -1.488554, 1, 0.3764706, 0, 1,
-1.543835, -0.02532199, -2.375068, 1, 0.3843137, 0, 1,
-1.543267, 1.865155, -0.9739454, 1, 0.3882353, 0, 1,
-1.533923, -1.218719, -1.939541, 1, 0.3960784, 0, 1,
-1.523021, -1.081532, -0.1554785, 1, 0.4039216, 0, 1,
-1.519353, -0.5785424, -1.574316, 1, 0.4078431, 0, 1,
-1.508476, 0.6003702, -0.385933, 1, 0.4156863, 0, 1,
-1.465666, 1.19126, -2.415629, 1, 0.4196078, 0, 1,
-1.461425, 1.179394, 1.221028, 1, 0.427451, 0, 1,
-1.448306, -0.01376661, -1.80851, 1, 0.4313726, 0, 1,
-1.444263, -0.8863225, -2.029392, 1, 0.4392157, 0, 1,
-1.441082, -0.009338847, -1.305283, 1, 0.4431373, 0, 1,
-1.439101, 2.010108, 0.2472879, 1, 0.4509804, 0, 1,
-1.418696, -1.57005, -1.628972, 1, 0.454902, 0, 1,
-1.416988, 0.07324576, -1.241105, 1, 0.4627451, 0, 1,
-1.410588, -1.036845, -1.970361, 1, 0.4666667, 0, 1,
-1.385917, -1.098743, -1.626801, 1, 0.4745098, 0, 1,
-1.376723, 1.000681, -1.271501, 1, 0.4784314, 0, 1,
-1.373282, 0.5718763, -0.5799427, 1, 0.4862745, 0, 1,
-1.364684, -0.8469858, -1.028242, 1, 0.4901961, 0, 1,
-1.359673, 1.166074, -0.5273031, 1, 0.4980392, 0, 1,
-1.342453, 0.6025149, -0.1083215, 1, 0.5058824, 0, 1,
-1.338277, 1.268356, -0.0147266, 1, 0.509804, 0, 1,
-1.336782, -0.2859888, -0.4718222, 1, 0.5176471, 0, 1,
-1.331271, -1.649119, -2.905249, 1, 0.5215687, 0, 1,
-1.327833, -1.143619, -2.122302, 1, 0.5294118, 0, 1,
-1.325486, 0.5919536, -1.032069, 1, 0.5333334, 0, 1,
-1.324378, -0.01773074, -1.184078, 1, 0.5411765, 0, 1,
-1.315762, -0.732491, -2.360075, 1, 0.5450981, 0, 1,
-1.314223, 0.5301281, 0.5198652, 1, 0.5529412, 0, 1,
-1.309258, 1.435825, -0.7819672, 1, 0.5568628, 0, 1,
-1.309126, 0.3436954, -1.887333, 1, 0.5647059, 0, 1,
-1.308914, 0.1800244, -1.294547, 1, 0.5686275, 0, 1,
-1.307464, -0.5385051, -2.419166, 1, 0.5764706, 0, 1,
-1.304697, -0.9884919, -3.15616, 1, 0.5803922, 0, 1,
-1.301647, 0.02788903, -1.702647, 1, 0.5882353, 0, 1,
-1.282322, 1.298442, 0.4196243, 1, 0.5921569, 0, 1,
-1.281168, -1.104742, -3.845124, 1, 0.6, 0, 1,
-1.271851, -0.1801635, -1.23386, 1, 0.6078432, 0, 1,
-1.263124, -0.7583793, -2.02666, 1, 0.6117647, 0, 1,
-1.239949, -0.4769898, -2.018071, 1, 0.6196079, 0, 1,
-1.237159, -0.09018718, -1.263931, 1, 0.6235294, 0, 1,
-1.236666, -0.2553985, -1.560246, 1, 0.6313726, 0, 1,
-1.22892, 2.066257, -1.313187, 1, 0.6352941, 0, 1,
-1.225478, 1.118494, -2.007298, 1, 0.6431373, 0, 1,
-1.225148, 0.5653781, -0.7276633, 1, 0.6470588, 0, 1,
-1.225071, 0.01408372, -0.4303864, 1, 0.654902, 0, 1,
-1.222189, 0.5520912, -0.05857064, 1, 0.6588235, 0, 1,
-1.220619, -1.342446, -1.916753, 1, 0.6666667, 0, 1,
-1.217623, 0.568233, -0.9388241, 1, 0.6705883, 0, 1,
-1.216812, 0.6377476, -1.875677, 1, 0.6784314, 0, 1,
-1.199098, -0.3918145, -1.526539, 1, 0.682353, 0, 1,
-1.19369, -0.5432509, -3.713255, 1, 0.6901961, 0, 1,
-1.19174, -1.443016, -2.129445, 1, 0.6941177, 0, 1,
-1.175272, -0.3823417, -1.893471, 1, 0.7019608, 0, 1,
-1.174168, -0.315067, -1.665706, 1, 0.7098039, 0, 1,
-1.170942, -0.08292438, -2.246975, 1, 0.7137255, 0, 1,
-1.170843, 0.02850836, -1.682819, 1, 0.7215686, 0, 1,
-1.169184, -1.67231, -1.898173, 1, 0.7254902, 0, 1,
-1.167352, 0.5754735, -0.6678793, 1, 0.7333333, 0, 1,
-1.166895, 1.639804, 0.4568533, 1, 0.7372549, 0, 1,
-1.16399, -1.549464, -0.945923, 1, 0.7450981, 0, 1,
-1.125056, 1.747054, -1.309074, 1, 0.7490196, 0, 1,
-1.118723, 1.49363, -0.0575727, 1, 0.7568628, 0, 1,
-1.116564, 2.417783, -1.814753, 1, 0.7607843, 0, 1,
-1.115681, -0.7312341, -1.759455, 1, 0.7686275, 0, 1,
-1.113627, -0.6237013, -1.06266, 1, 0.772549, 0, 1,
-1.109292, -0.9763607, -1.331425, 1, 0.7803922, 0, 1,
-1.109025, -0.4637961, -1.858732, 1, 0.7843137, 0, 1,
-1.108524, -0.1606898, -3.64058, 1, 0.7921569, 0, 1,
-1.107904, -0.3077752, -1.030931, 1, 0.7960784, 0, 1,
-1.102163, -0.4089436, -2.7494, 1, 0.8039216, 0, 1,
-1.100909, -0.2254004, -0.8818242, 1, 0.8117647, 0, 1,
-1.099959, -0.8297431, -2.191808, 1, 0.8156863, 0, 1,
-1.095619, 1.605682, -0.478264, 1, 0.8235294, 0, 1,
-1.094639, 1.127415, -1.012373, 1, 0.827451, 0, 1,
-1.088847, 1.552068, 0.7011679, 1, 0.8352941, 0, 1,
-1.084434, 0.4550253, -0.3183165, 1, 0.8392157, 0, 1,
-1.083028, 0.2104852, 0.2586435, 1, 0.8470588, 0, 1,
-1.082495, 1.119876, -1.298229, 1, 0.8509804, 0, 1,
-1.081264, 0.0978772, -0.8629181, 1, 0.8588235, 0, 1,
-1.072308, 0.9570621, -1.694366, 1, 0.8627451, 0, 1,
-1.057558, -0.6714331, -3.089693, 1, 0.8705882, 0, 1,
-1.05753, -0.6683282, -2.819374, 1, 0.8745098, 0, 1,
-1.056568, -0.445162, -3.32736, 1, 0.8823529, 0, 1,
-1.056156, 0.6294003, -2.544972, 1, 0.8862745, 0, 1,
-1.05408, 1.600894, -1.988174, 1, 0.8941177, 0, 1,
-1.042039, 1.014982, -1.316483, 1, 0.8980392, 0, 1,
-1.036119, 0.1370216, -1.634119, 1, 0.9058824, 0, 1,
-1.028665, -0.8753514, -0.466926, 1, 0.9137255, 0, 1,
-1.0129, 1.912192, -0.1435268, 1, 0.9176471, 0, 1,
-1.008414, -0.3975765, -3.358363, 1, 0.9254902, 0, 1,
-1.005004, -1.03702, -3.216565, 1, 0.9294118, 0, 1,
-1.002178, 1.089916, -1.233685, 1, 0.9372549, 0, 1,
-1.001059, -0.9041746, -4.995486, 1, 0.9411765, 0, 1,
-1.000582, 0.5282261, -2.744469, 1, 0.9490196, 0, 1,
-0.9964586, 0.02278093, -2.707516, 1, 0.9529412, 0, 1,
-0.9943517, -1.705208, -1.844691, 1, 0.9607843, 0, 1,
-0.9900566, -0.9357471, -3.479668, 1, 0.9647059, 0, 1,
-0.9764947, -0.0584965, 0.2109562, 1, 0.972549, 0, 1,
-0.9754665, -0.25113, -2.965163, 1, 0.9764706, 0, 1,
-0.9738852, -0.067991, -2.937452, 1, 0.9843137, 0, 1,
-0.9651394, -0.6091339, -2.710235, 1, 0.9882353, 0, 1,
-0.9575408, -0.2277659, -1.33453, 1, 0.9960784, 0, 1,
-0.9573092, 1.074418, -2.42536, 0.9960784, 1, 0, 1,
-0.9527469, -0.9385912, -1.327598, 0.9921569, 1, 0, 1,
-0.952723, 0.1132078, -1.629575, 0.9843137, 1, 0, 1,
-0.9526264, -0.5292023, -3.22447, 0.9803922, 1, 0, 1,
-0.946467, -0.7932827, -1.767483, 0.972549, 1, 0, 1,
-0.9409822, -0.2711297, -2.36464, 0.9686275, 1, 0, 1,
-0.9407194, -0.7860162, -2.395871, 0.9607843, 1, 0, 1,
-0.9400311, 1.120182, 0.8142302, 0.9568627, 1, 0, 1,
-0.9371891, 0.5313653, -0.9321973, 0.9490196, 1, 0, 1,
-0.9333528, 1.4703, -0.7704827, 0.945098, 1, 0, 1,
-0.9294976, 2.865987, -0.2666954, 0.9372549, 1, 0, 1,
-0.9262896, -0.3039824, -4.239001, 0.9333333, 1, 0, 1,
-0.9235797, -0.3306179, -1.935612, 0.9254902, 1, 0, 1,
-0.9209566, 1.237509, -0.6268241, 0.9215686, 1, 0, 1,
-0.9134524, -0.1645665, -1.552038, 0.9137255, 1, 0, 1,
-0.9071781, 1.592889, -0.6945012, 0.9098039, 1, 0, 1,
-0.8994418, -0.3075448, -1.300685, 0.9019608, 1, 0, 1,
-0.8986401, -1.525638, -3.558531, 0.8941177, 1, 0, 1,
-0.897392, 0.9633505, -1.007262, 0.8901961, 1, 0, 1,
-0.8922777, -1.209811, -2.759054, 0.8823529, 1, 0, 1,
-0.891308, 1.926304, -1.752726, 0.8784314, 1, 0, 1,
-0.8867232, 0.80731, -0.2700445, 0.8705882, 1, 0, 1,
-0.8731343, 1.171264, -2.319839, 0.8666667, 1, 0, 1,
-0.8712987, -0.3110364, -1.702827, 0.8588235, 1, 0, 1,
-0.8685008, 0.5071708, 0.854145, 0.854902, 1, 0, 1,
-0.8615122, -0.6896211, -3.045534, 0.8470588, 1, 0, 1,
-0.8495556, 0.4894195, -0.8799739, 0.8431373, 1, 0, 1,
-0.8482462, -0.2976078, -2.265436, 0.8352941, 1, 0, 1,
-0.8471588, -0.7179643, -2.325646, 0.8313726, 1, 0, 1,
-0.8450946, 1.175656, -1.553508, 0.8235294, 1, 0, 1,
-0.8413099, -0.1930513, -1.098569, 0.8196079, 1, 0, 1,
-0.8393934, -0.3318899, -2.318714, 0.8117647, 1, 0, 1,
-0.8336504, 0.2814221, -1.333802, 0.8078431, 1, 0, 1,
-0.8270009, 0.9744011, -1.475383, 0.8, 1, 0, 1,
-0.8233315, -0.9021924, -2.057528, 0.7921569, 1, 0, 1,
-0.8043401, -0.7445955, -1.846234, 0.7882353, 1, 0, 1,
-0.8033818, -0.1389257, -0.3468451, 0.7803922, 1, 0, 1,
-0.8026421, -0.7356485, -2.952502, 0.7764706, 1, 0, 1,
-0.7999259, 1.619215, 0.2305767, 0.7686275, 1, 0, 1,
-0.7998315, -1.072298, -4.360965, 0.7647059, 1, 0, 1,
-0.7987663, 1.429001, 0.4952133, 0.7568628, 1, 0, 1,
-0.7950242, 0.6116816, -1.403283, 0.7529412, 1, 0, 1,
-0.7886766, 0.7314364, -0.4937322, 0.7450981, 1, 0, 1,
-0.7839493, 0.9465469, -2.156755, 0.7411765, 1, 0, 1,
-0.7764791, 1.221596, -1.122613, 0.7333333, 1, 0, 1,
-0.7708858, 3.024605, -1.918187, 0.7294118, 1, 0, 1,
-0.7602994, 0.1275834, -1.548273, 0.7215686, 1, 0, 1,
-0.7585899, -0.2370939, -2.027249, 0.7176471, 1, 0, 1,
-0.7541025, 0.1058604, 0.05264989, 0.7098039, 1, 0, 1,
-0.7516456, 0.140875, -1.265638, 0.7058824, 1, 0, 1,
-0.7516382, -4.069369, -3.345028, 0.6980392, 1, 0, 1,
-0.7500846, 1.533008, -1.657211, 0.6901961, 1, 0, 1,
-0.7497247, 0.8115406, -1.033617, 0.6862745, 1, 0, 1,
-0.7440351, -0.02785877, -1.166866, 0.6784314, 1, 0, 1,
-0.7436236, -0.4592332, -1.579354, 0.6745098, 1, 0, 1,
-0.7434896, -0.6046879, -3.349742, 0.6666667, 1, 0, 1,
-0.731823, -0.3495228, -3.540831, 0.6627451, 1, 0, 1,
-0.7316089, -0.6533723, -3.870076, 0.654902, 1, 0, 1,
-0.7311335, 1.810659, -1.408304, 0.6509804, 1, 0, 1,
-0.7287259, -1.182156, -0.9430787, 0.6431373, 1, 0, 1,
-0.7283735, -0.263243, -1.645726, 0.6392157, 1, 0, 1,
-0.7228144, -0.4216816, -2.946292, 0.6313726, 1, 0, 1,
-0.7185866, 0.2558821, -0.878617, 0.627451, 1, 0, 1,
-0.718123, -0.01687954, 0.2580245, 0.6196079, 1, 0, 1,
-0.7179465, -1.520415, -2.582932, 0.6156863, 1, 0, 1,
-0.7175837, 0.3268386, 0.3264508, 0.6078432, 1, 0, 1,
-0.7130438, -0.2331313, -2.070272, 0.6039216, 1, 0, 1,
-0.7049343, 1.184285, -0.2310362, 0.5960785, 1, 0, 1,
-0.7024528, -0.185834, -2.116323, 0.5882353, 1, 0, 1,
-0.6973184, -1.170461, -1.182085, 0.5843138, 1, 0, 1,
-0.6959628, -0.3171042, -1.416665, 0.5764706, 1, 0, 1,
-0.6918054, 0.9463987, -0.6782238, 0.572549, 1, 0, 1,
-0.6808571, -0.04562255, -2.35381, 0.5647059, 1, 0, 1,
-0.6791227, 1.222057, -0.3944871, 0.5607843, 1, 0, 1,
-0.6735775, 0.1863431, -1.085745, 0.5529412, 1, 0, 1,
-0.6684487, -0.6756192, -3.122221, 0.5490196, 1, 0, 1,
-0.656803, -0.2001695, -1.978963, 0.5411765, 1, 0, 1,
-0.6501923, 0.01748367, -1.953768, 0.5372549, 1, 0, 1,
-0.6441495, -1.516322, -2.501456, 0.5294118, 1, 0, 1,
-0.6419174, 0.1519206, -0.2339515, 0.5254902, 1, 0, 1,
-0.6375915, 0.4899675, -0.2098553, 0.5176471, 1, 0, 1,
-0.6362761, -1.199807, -1.399223, 0.5137255, 1, 0, 1,
-0.6347443, 0.1574714, -2.119564, 0.5058824, 1, 0, 1,
-0.6311341, -1.535201, -3.051861, 0.5019608, 1, 0, 1,
-0.6216559, 0.6107864, -2.215125, 0.4941176, 1, 0, 1,
-0.6206213, 0.3075559, -1.102973, 0.4862745, 1, 0, 1,
-0.6183096, 0.03020609, -1.429343, 0.4823529, 1, 0, 1,
-0.6142269, 0.7727298, -0.3571337, 0.4745098, 1, 0, 1,
-0.6135761, 1.057905, -2.946796, 0.4705882, 1, 0, 1,
-0.6127528, 0.635382, -1.394611, 0.4627451, 1, 0, 1,
-0.612318, 1.526528, 0.9398239, 0.4588235, 1, 0, 1,
-0.6049255, -0.9137707, -0.3116148, 0.4509804, 1, 0, 1,
-0.6048732, -0.9145388, -2.106011, 0.4470588, 1, 0, 1,
-0.603789, -0.7317322, -2.96311, 0.4392157, 1, 0, 1,
-0.6027797, -0.01664717, -1.649301, 0.4352941, 1, 0, 1,
-0.6014095, 0.2100952, -1.023648, 0.427451, 1, 0, 1,
-0.5994649, 0.8027111, -1.273274, 0.4235294, 1, 0, 1,
-0.5968521, -0.3645665, -4.204428, 0.4156863, 1, 0, 1,
-0.5958791, 1.719983, -1.31191, 0.4117647, 1, 0, 1,
-0.5933237, 0.6078803, 0.493258, 0.4039216, 1, 0, 1,
-0.5920546, -0.9515622, -3.333148, 0.3960784, 1, 0, 1,
-0.5890731, -0.7037952, -1.673611, 0.3921569, 1, 0, 1,
-0.5864061, -1.494667, -3.495559, 0.3843137, 1, 0, 1,
-0.5808228, 0.5977204, -0.09719954, 0.3803922, 1, 0, 1,
-0.5752081, -0.2211337, -1.828423, 0.372549, 1, 0, 1,
-0.5746535, 0.3461944, -1.239647, 0.3686275, 1, 0, 1,
-0.5702489, -0.4438849, -2.22432, 0.3607843, 1, 0, 1,
-0.5679775, -0.1287236, -3.064684, 0.3568628, 1, 0, 1,
-0.5641215, -1.161533, -1.238658, 0.3490196, 1, 0, 1,
-0.5600255, -0.4102343, -2.740919, 0.345098, 1, 0, 1,
-0.5569952, -0.2619109, -2.569935, 0.3372549, 1, 0, 1,
-0.5519371, -0.4037493, -3.741388, 0.3333333, 1, 0, 1,
-0.551114, 0.7372524, 1.66677, 0.3254902, 1, 0, 1,
-0.5487157, -1.171665, -3.284492, 0.3215686, 1, 0, 1,
-0.548042, 1.598943, 1.060488, 0.3137255, 1, 0, 1,
-0.5469946, -0.8401254, -1.536912, 0.3098039, 1, 0, 1,
-0.5457345, -0.09209669, -1.693637, 0.3019608, 1, 0, 1,
-0.5354518, 1.241468, -0.08641626, 0.2941177, 1, 0, 1,
-0.5342653, -0.2587014, -1.775365, 0.2901961, 1, 0, 1,
-0.5321879, -1.878964, -1.692447, 0.282353, 1, 0, 1,
-0.5264966, -2.369925, -3.795524, 0.2784314, 1, 0, 1,
-0.5261098, 0.6598797, -0.4196579, 0.2705882, 1, 0, 1,
-0.5227552, 0.7422705, -0.4169037, 0.2666667, 1, 0, 1,
-0.5221472, -0.4502381, -1.546412, 0.2588235, 1, 0, 1,
-0.5175666, -1.787084, -3.292017, 0.254902, 1, 0, 1,
-0.5140767, 1.228997, 0.008158804, 0.2470588, 1, 0, 1,
-0.5121485, 0.733215, -0.08810265, 0.2431373, 1, 0, 1,
-0.5119023, 0.4971777, -0.7831005, 0.2352941, 1, 0, 1,
-0.5087811, 1.197777, -0.8913074, 0.2313726, 1, 0, 1,
-0.5080956, 0.0551872, -1.045818, 0.2235294, 1, 0, 1,
-0.5060108, -0.420765, -2.085424, 0.2196078, 1, 0, 1,
-0.5049179, 0.8399605, -1.561602, 0.2117647, 1, 0, 1,
-0.5039226, -0.437234, -4.204883, 0.2078431, 1, 0, 1,
-0.5038573, -0.6787626, -4.924074, 0.2, 1, 0, 1,
-0.501489, -0.1653262, -1.226362, 0.1921569, 1, 0, 1,
-0.4995549, -1.130978, -2.511158, 0.1882353, 1, 0, 1,
-0.4964599, 0.05631708, -1.369848, 0.1803922, 1, 0, 1,
-0.4955401, -0.2456294, -1.254812, 0.1764706, 1, 0, 1,
-0.4942837, 0.1716454, -0.740861, 0.1686275, 1, 0, 1,
-0.4940014, -1.377666, -2.953661, 0.1647059, 1, 0, 1,
-0.4938001, 0.1233764, -0.9123189, 0.1568628, 1, 0, 1,
-0.4926883, -0.2071294, -1.330385, 0.1529412, 1, 0, 1,
-0.4921567, 0.06806833, -0.4799381, 0.145098, 1, 0, 1,
-0.4917565, -0.8028129, -2.31845, 0.1411765, 1, 0, 1,
-0.4866075, -0.6269054, -2.809474, 0.1333333, 1, 0, 1,
-0.4665495, 0.7635198, -0.9712249, 0.1294118, 1, 0, 1,
-0.4553418, 0.7834409, 2.298599, 0.1215686, 1, 0, 1,
-0.4532023, 0.2436019, -0.2884783, 0.1176471, 1, 0, 1,
-0.452565, 0.3107144, 0.5089607, 0.1098039, 1, 0, 1,
-0.448449, -0.5790909, -2.543823, 0.1058824, 1, 0, 1,
-0.4427298, -0.7427575, -1.698195, 0.09803922, 1, 0, 1,
-0.4419278, -2.229113, -3.193, 0.09019608, 1, 0, 1,
-0.4409105, 0.4894704, -0.4610426, 0.08627451, 1, 0, 1,
-0.4323947, -0.05214269, -1.440434, 0.07843138, 1, 0, 1,
-0.4308671, -1.705433, -3.588156, 0.07450981, 1, 0, 1,
-0.4303632, -0.2121293, -0.9703085, 0.06666667, 1, 0, 1,
-0.4285548, 2.023916, -0.1768814, 0.0627451, 1, 0, 1,
-0.4252567, -0.01270826, -0.8070465, 0.05490196, 1, 0, 1,
-0.4219319, -1.140848, -2.7773, 0.05098039, 1, 0, 1,
-0.4173634, 0.5770679, -0.09441394, 0.04313726, 1, 0, 1,
-0.4157247, -0.01937784, -0.43147, 0.03921569, 1, 0, 1,
-0.4143556, -0.1137863, -3.16017, 0.03137255, 1, 0, 1,
-0.4137647, -1.069242, -2.837561, 0.02745098, 1, 0, 1,
-0.4137461, -0.7156699, -2.927438, 0.01960784, 1, 0, 1,
-0.4109564, 0.1627525, -0.9557119, 0.01568628, 1, 0, 1,
-0.4074511, -0.01053341, -1.568402, 0.007843138, 1, 0, 1,
-0.4073614, -1.020016, -2.118151, 0.003921569, 1, 0, 1,
-0.4037475, 1.511833, -0.1485807, 0, 1, 0.003921569, 1,
-0.4031233, 3.472806, 0.4532171, 0, 1, 0.01176471, 1,
-0.3984676, -2.237708, -2.233818, 0, 1, 0.01568628, 1,
-0.396309, 0.143759, -2.022766, 0, 1, 0.02352941, 1,
-0.3960005, -2.380552, -4.402004, 0, 1, 0.02745098, 1,
-0.3958057, -0.4073242, -2.745611, 0, 1, 0.03529412, 1,
-0.393606, -2.792745, -2.488844, 0, 1, 0.03921569, 1,
-0.3852999, -0.4220523, -1.703287, 0, 1, 0.04705882, 1,
-0.3843111, 0.3345702, 0.07340435, 0, 1, 0.05098039, 1,
-0.3841731, 0.9740993, -1.198731, 0, 1, 0.05882353, 1,
-0.3836423, 0.5014613, -1.067089, 0, 1, 0.0627451, 1,
-0.3792504, 0.4029121, 0.5979041, 0, 1, 0.07058824, 1,
-0.3784657, -2.214889, -2.724784, 0, 1, 0.07450981, 1,
-0.3764087, -0.3429737, -3.366843, 0, 1, 0.08235294, 1,
-0.3763122, 1.753214, 0.1456199, 0, 1, 0.08627451, 1,
-0.3758356, -1.777321, -3.095843, 0, 1, 0.09411765, 1,
-0.3755988, -0.2759297, -2.096399, 0, 1, 0.1019608, 1,
-0.373618, -0.8238036, -2.146775, 0, 1, 0.1058824, 1,
-0.3730379, -0.3065309, -0.4868892, 0, 1, 0.1137255, 1,
-0.3712843, 0.2082135, -3.380624, 0, 1, 0.1176471, 1,
-0.3669417, -0.3877003, -2.084385, 0, 1, 0.1254902, 1,
-0.363149, 1.178905, -1.244976, 0, 1, 0.1294118, 1,
-0.3600134, 0.4653615, -0.5516728, 0, 1, 0.1372549, 1,
-0.359992, 1.413914, 0.9156083, 0, 1, 0.1411765, 1,
-0.3581216, 1.987726, -1.723541, 0, 1, 0.1490196, 1,
-0.3553698, -0.2360173, -3.178016, 0, 1, 0.1529412, 1,
-0.354034, 0.7849666, -0.04748811, 0, 1, 0.1607843, 1,
-0.3523021, -3.021962, -2.076583, 0, 1, 0.1647059, 1,
-0.3505728, -0.5581382, -1.268596, 0, 1, 0.172549, 1,
-0.3502493, 1.245014, -1.46417, 0, 1, 0.1764706, 1,
-0.3446302, 0.1204433, -2.064574, 0, 1, 0.1843137, 1,
-0.3438238, -0.4885798, -4.037682, 0, 1, 0.1882353, 1,
-0.3433965, 0.4763532, -0.9617701, 0, 1, 0.1960784, 1,
-0.3415697, -0.4265802, -2.063186, 0, 1, 0.2039216, 1,
-0.3384906, 1.429491, 0.4298317, 0, 1, 0.2078431, 1,
-0.3361544, -0.4264976, -1.938385, 0, 1, 0.2156863, 1,
-0.3334733, -1.413502, -3.222023, 0, 1, 0.2196078, 1,
-0.3259018, -0.3453138, -1.430898, 0, 1, 0.227451, 1,
-0.3256788, 0.07862993, -0.410272, 0, 1, 0.2313726, 1,
-0.3252079, 0.3339385, -1.014872, 0, 1, 0.2392157, 1,
-0.3229925, -1.53052, -0.003001605, 0, 1, 0.2431373, 1,
-0.3223074, 0.7716331, -1.724549, 0, 1, 0.2509804, 1,
-0.3188067, 0.5757011, 0.003497811, 0, 1, 0.254902, 1,
-0.3166771, 0.3077132, -0.03976525, 0, 1, 0.2627451, 1,
-0.316537, 0.03943565, -1.41391, 0, 1, 0.2666667, 1,
-0.3115339, 1.909496, 0.3658637, 0, 1, 0.2745098, 1,
-0.3106351, -1.368512, -3.243026, 0, 1, 0.2784314, 1,
-0.3101941, -1.970191, -4.104567, 0, 1, 0.2862745, 1,
-0.309993, 1.172654, -1.398844, 0, 1, 0.2901961, 1,
-0.3062589, -2.658554, -1.978022, 0, 1, 0.2980392, 1,
-0.305424, -0.9342178, 0.04703233, 0, 1, 0.3058824, 1,
-0.3029404, 0.2326846, -1.699008, 0, 1, 0.3098039, 1,
-0.3024353, 0.9645783, 0.6720446, 0, 1, 0.3176471, 1,
-0.299776, 1.39344, 0.1142626, 0, 1, 0.3215686, 1,
-0.299355, -0.7370961, -3.343394, 0, 1, 0.3294118, 1,
-0.2981002, -0.1382217, -1.492335, 0, 1, 0.3333333, 1,
-0.2967221, 0.3067336, -0.4897448, 0, 1, 0.3411765, 1,
-0.2939346, -0.6109853, -1.309578, 0, 1, 0.345098, 1,
-0.2926236, 1.035153, 0.9905765, 0, 1, 0.3529412, 1,
-0.2904016, 0.7223715, -0.9926884, 0, 1, 0.3568628, 1,
-0.2804014, 0.7173939, -1.267269, 0, 1, 0.3647059, 1,
-0.2749832, -0.2878132, -2.205669, 0, 1, 0.3686275, 1,
-0.2749544, 0.1846604, -1.55425, 0, 1, 0.3764706, 1,
-0.2747139, 0.1369033, -2.354659, 0, 1, 0.3803922, 1,
-0.2726548, 0.4171711, -1.753256, 0, 1, 0.3882353, 1,
-0.2725627, -1.108716, -2.181978, 0, 1, 0.3921569, 1,
-0.2723381, -1.85514, -3.21323, 0, 1, 0.4, 1,
-0.2715106, 0.2917505, -1.228982, 0, 1, 0.4078431, 1,
-0.2711009, 0.9183933, -0.1269995, 0, 1, 0.4117647, 1,
-0.2597885, -0.3405338, -3.270901, 0, 1, 0.4196078, 1,
-0.2578197, -0.2167953, -3.139436, 0, 1, 0.4235294, 1,
-0.254787, 0.534193, -0.04841232, 0, 1, 0.4313726, 1,
-0.2528511, -0.7358693, -3.493265, 0, 1, 0.4352941, 1,
-0.2502626, 0.1604948, -0.3177829, 0, 1, 0.4431373, 1,
-0.2493511, 0.1560393, -2.192801, 0, 1, 0.4470588, 1,
-0.248414, 0.3221217, 0.2326105, 0, 1, 0.454902, 1,
-0.2480976, 0.1458453, -0.5101001, 0, 1, 0.4588235, 1,
-0.2418714, -0.1260947, -2.705749, 0, 1, 0.4666667, 1,
-0.2414694, 0.5930459, 0.1045055, 0, 1, 0.4705882, 1,
-0.2401965, 0.6573314, -0.8756349, 0, 1, 0.4784314, 1,
-0.2397926, 0.1241275, -0.6772196, 0, 1, 0.4823529, 1,
-0.2354968, -0.08509972, -2.891883, 0, 1, 0.4901961, 1,
-0.2328666, -1.501862, -3.29406, 0, 1, 0.4941176, 1,
-0.2273537, 2.175946, 0.3858691, 0, 1, 0.5019608, 1,
-0.2234837, 0.7292565, 0.03205921, 0, 1, 0.509804, 1,
-0.2232223, 2.676906, -0.6203906, 0, 1, 0.5137255, 1,
-0.2165597, -0.2510423, -3.579102, 0, 1, 0.5215687, 1,
-0.2133221, -0.07289896, -2.961236, 0, 1, 0.5254902, 1,
-0.2126597, 0.06518786, -2.387483, 0, 1, 0.5333334, 1,
-0.2095449, -0.37948, -1.891038, 0, 1, 0.5372549, 1,
-0.209201, -1.442668, -3.32794, 0, 1, 0.5450981, 1,
-0.2081986, -1.384003, -3.474529, 0, 1, 0.5490196, 1,
-0.2071109, 1.66003, -1.158081, 0, 1, 0.5568628, 1,
-0.2035335, -1.355355, -3.579831, 0, 1, 0.5607843, 1,
-0.2007402, 1.310698, 1.206014, 0, 1, 0.5686275, 1,
-0.1993449, -0.2054664, -2.703207, 0, 1, 0.572549, 1,
-0.1897754, 0.09881753, -1.141514, 0, 1, 0.5803922, 1,
-0.1870814, 0.4273621, -0.5846718, 0, 1, 0.5843138, 1,
-0.1869892, 1.939249, -0.03432036, 0, 1, 0.5921569, 1,
-0.1855201, 0.005945278, -1.92162, 0, 1, 0.5960785, 1,
-0.1832768, 0.8294326, -0.119522, 0, 1, 0.6039216, 1,
-0.1789715, 0.8440215, -0.1115241, 0, 1, 0.6117647, 1,
-0.178783, 0.2531227, 0.1153488, 0, 1, 0.6156863, 1,
-0.1760591, 1.177067, -0.1656457, 0, 1, 0.6235294, 1,
-0.1722181, 2.201822, 0.5359905, 0, 1, 0.627451, 1,
-0.1708775, 1.659969, -0.7837065, 0, 1, 0.6352941, 1,
-0.1703874, -1.535861, -3.256516, 0, 1, 0.6392157, 1,
-0.1693306, -2.308468, -2.973566, 0, 1, 0.6470588, 1,
-0.1667776, -0.7410177, -5.002038, 0, 1, 0.6509804, 1,
-0.1661258, -1.399426, -0.7092804, 0, 1, 0.6588235, 1,
-0.1611418, -0.1041446, -2.030653, 0, 1, 0.6627451, 1,
-0.1608172, 0.09592887, -2.343994, 0, 1, 0.6705883, 1,
-0.1607192, 1.026874, -1.006055, 0, 1, 0.6745098, 1,
-0.1600056, -0.6326783, -3.011338, 0, 1, 0.682353, 1,
-0.1596381, 0.1064575, -1.582223, 0, 1, 0.6862745, 1,
-0.1558366, -0.2925892, -3.487965, 0, 1, 0.6941177, 1,
-0.1553454, 0.1792983, 1.164628, 0, 1, 0.7019608, 1,
-0.1535388, 0.3058747, 0.3093242, 0, 1, 0.7058824, 1,
-0.1512733, -0.678178, -2.111992, 0, 1, 0.7137255, 1,
-0.1482476, -0.5835967, -2.271952, 0, 1, 0.7176471, 1,
-0.1431331, -1.076174, -2.715557, 0, 1, 0.7254902, 1,
-0.1410806, 0.8664235, -0.1474082, 0, 1, 0.7294118, 1,
-0.1409166, -0.2435569, -2.74121, 0, 1, 0.7372549, 1,
-0.1408918, -0.1818295, -3.133168, 0, 1, 0.7411765, 1,
-0.138401, 0.02745324, -1.107476, 0, 1, 0.7490196, 1,
-0.1374792, 0.802206, -0.2185521, 0, 1, 0.7529412, 1,
-0.1358372, -0.1470918, -2.976325, 0, 1, 0.7607843, 1,
-0.1326219, -0.7086171, -2.20763, 0, 1, 0.7647059, 1,
-0.1318504, 0.6725174, 0.05220369, 0, 1, 0.772549, 1,
-0.1314188, 0.6513426, 1.78848, 0, 1, 0.7764706, 1,
-0.1311473, -0.1362545, -1.477512, 0, 1, 0.7843137, 1,
-0.1294467, -0.7568538, -4.044899, 0, 1, 0.7882353, 1,
-0.1233806, -0.7529086, -0.4427266, 0, 1, 0.7960784, 1,
-0.1232858, -0.257978, -2.442513, 0, 1, 0.8039216, 1,
-0.1216442, -1.61933, -5.461137, 0, 1, 0.8078431, 1,
-0.1211821, 0.6927382, -0.5887081, 0, 1, 0.8156863, 1,
-0.1158488, 0.1285681, -1.8469, 0, 1, 0.8196079, 1,
-0.1134143, 1.180792, 0.5225745, 0, 1, 0.827451, 1,
-0.1131948, -0.5867706, -4.108409, 0, 1, 0.8313726, 1,
-0.1123707, -0.1611789, -2.24911, 0, 1, 0.8392157, 1,
-0.1122426, -1.120364, -2.585495, 0, 1, 0.8431373, 1,
-0.104587, 0.7568326, 1.334365, 0, 1, 0.8509804, 1,
-0.1044392, -0.5631978, -2.507803, 0, 1, 0.854902, 1,
-0.1034185, -2.149504, -2.466222, 0, 1, 0.8627451, 1,
-0.1032049, 0.02958765, -0.3046515, 0, 1, 0.8666667, 1,
-0.1009114, -1.627496, -2.818867, 0, 1, 0.8745098, 1,
-0.0977389, 0.5011035, -1.060695, 0, 1, 0.8784314, 1,
-0.09355816, 0.9074343, -0.4950197, 0, 1, 0.8862745, 1,
-0.08582351, -0.7738481, -3.320651, 0, 1, 0.8901961, 1,
-0.07516859, -1.2902, -3.668625, 0, 1, 0.8980392, 1,
-0.07048526, -0.1173125, -3.107512, 0, 1, 0.9058824, 1,
-0.06331792, 0.1935635, 1.216231, 0, 1, 0.9098039, 1,
-0.06014823, -0.8312577, -1.867469, 0, 1, 0.9176471, 1,
-0.0588662, 0.7248496, 0.5161605, 0, 1, 0.9215686, 1,
-0.05207443, 0.4714071, -0.4419984, 0, 1, 0.9294118, 1,
-0.04854858, -0.8881013, -3.226411, 0, 1, 0.9333333, 1,
-0.04782508, -0.1636948, -1.227273, 0, 1, 0.9411765, 1,
-0.04627683, 0.4361086, -0.1831616, 0, 1, 0.945098, 1,
-0.04465842, 0.03490961, 1.246146, 0, 1, 0.9529412, 1,
-0.04207672, -0.05203253, -2.878584, 0, 1, 0.9568627, 1,
-0.04152219, -0.2709667, -4.442576, 0, 1, 0.9647059, 1,
-0.03953718, -0.266427, -3.326409, 0, 1, 0.9686275, 1,
-0.03824474, 0.8432336, -0.6768542, 0, 1, 0.9764706, 1,
-0.03549311, -0.7786555, -2.179336, 0, 1, 0.9803922, 1,
-0.02703895, 0.2982387, -0.6258875, 0, 1, 0.9882353, 1,
-0.02541703, 1.072692, -0.9513635, 0, 1, 0.9921569, 1,
-0.02434076, -0.1309754, -4.210624, 0, 1, 1, 1,
-0.02242801, 0.1021848, -0.4023428, 0, 0.9921569, 1, 1,
-0.02048045, -0.4385241, -2.752705, 0, 0.9882353, 1, 1,
-0.01830207, 0.2400464, -1.210833, 0, 0.9803922, 1, 1,
-0.01737125, -0.8134509, -5.50064, 0, 0.9764706, 1, 1,
-0.01675749, 0.8056558, 1.809715, 0, 0.9686275, 1, 1,
-0.01584965, 0.1187796, 0.1762197, 0, 0.9647059, 1, 1,
-0.01577098, 0.1943143, -0.2030887, 0, 0.9568627, 1, 1,
-0.01576933, -0.09636371, -2.147494, 0, 0.9529412, 1, 1,
-0.01439549, 0.2898032, -1.818102, 0, 0.945098, 1, 1,
-0.011735, -0.6907838, -2.978006, 0, 0.9411765, 1, 1,
-0.01080599, 0.2565486, 0.9740471, 0, 0.9333333, 1, 1,
-0.009088289, -1.443846, -2.513699, 0, 0.9294118, 1, 1,
-0.005347372, 0.04057549, 1.155709, 0, 0.9215686, 1, 1,
-0.004642799, 1.42368, 0.6412364, 0, 0.9176471, 1, 1,
-1.289568e-05, -0.5482881, -1.767566, 0, 0.9098039, 1, 1,
0.002868089, 0.1220143, 0.90236, 0, 0.9058824, 1, 1,
0.003131763, -0.5141542, 3.484171, 0, 0.8980392, 1, 1,
0.01473955, 0.5606719, -0.3321154, 0, 0.8901961, 1, 1,
0.01561129, 1.394059, -0.4944317, 0, 0.8862745, 1, 1,
0.01612178, -0.06054633, 1.889938, 0, 0.8784314, 1, 1,
0.01745076, 0.5078207, 0.425768, 0, 0.8745098, 1, 1,
0.01955364, -0.9160689, 3.93681, 0, 0.8666667, 1, 1,
0.01991069, 0.1801582, 0.5053095, 0, 0.8627451, 1, 1,
0.02528014, -0.7405525, 3.689448, 0, 0.854902, 1, 1,
0.02555313, -0.9684792, 3.560547, 0, 0.8509804, 1, 1,
0.02590215, 0.9438938, 0.5844285, 0, 0.8431373, 1, 1,
0.02676962, -0.5545111, 2.347521, 0, 0.8392157, 1, 1,
0.02716902, -2.026455, 1.893902, 0, 0.8313726, 1, 1,
0.02880728, -1.588528, 2.651146, 0, 0.827451, 1, 1,
0.02974175, -0.1768119, 3.139669, 0, 0.8196079, 1, 1,
0.03296012, -0.4760815, 2.354689, 0, 0.8156863, 1, 1,
0.03762607, -0.8709646, 1.141311, 0, 0.8078431, 1, 1,
0.03899674, 0.5678791, 2.578161, 0, 0.8039216, 1, 1,
0.03964568, 1.189978, -0.4922049, 0, 0.7960784, 1, 1,
0.04026414, 1.527138, 0.242653, 0, 0.7882353, 1, 1,
0.04246915, -0.5627349, 4.656976, 0, 0.7843137, 1, 1,
0.04757339, 2.5459, 2.309788, 0, 0.7764706, 1, 1,
0.04972966, -0.3032646, 3.744602, 0, 0.772549, 1, 1,
0.05493382, 0.02107022, 2.01723, 0, 0.7647059, 1, 1,
0.05616195, -0.2718835, 3.905912, 0, 0.7607843, 1, 1,
0.05638371, 1.318335, 1.563825, 0, 0.7529412, 1, 1,
0.06141827, -0.008140605, 2.184425, 0, 0.7490196, 1, 1,
0.06260853, -0.4982032, 3.331338, 0, 0.7411765, 1, 1,
0.06438554, 1.908544, 0.877694, 0, 0.7372549, 1, 1,
0.06551065, -0.4475127, 3.430139, 0, 0.7294118, 1, 1,
0.06789021, -0.5031707, 2.105101, 0, 0.7254902, 1, 1,
0.07013299, -0.5638102, 3.393298, 0, 0.7176471, 1, 1,
0.07142743, -0.504401, 3.03529, 0, 0.7137255, 1, 1,
0.07377987, 1.265189, 2.346384, 0, 0.7058824, 1, 1,
0.07455275, -0.06631105, 1.860307, 0, 0.6980392, 1, 1,
0.07903244, -0.2902471, 3.675839, 0, 0.6941177, 1, 1,
0.079418, -1.529964, 3.015747, 0, 0.6862745, 1, 1,
0.0870558, 1.350283, -0.2509321, 0, 0.682353, 1, 1,
0.09791707, -0.1841589, 2.947161, 0, 0.6745098, 1, 1,
0.0999295, 0.5124025, -0.7662796, 0, 0.6705883, 1, 1,
0.1008748, -0.9086865, 2.333933, 0, 0.6627451, 1, 1,
0.1022742, -1.479791, 4.138819, 0, 0.6588235, 1, 1,
0.1079063, 0.8734107, 1.357085, 0, 0.6509804, 1, 1,
0.1147923, 0.1619938, 0.3599272, 0, 0.6470588, 1, 1,
0.1156803, 0.0009098204, 2.160984, 0, 0.6392157, 1, 1,
0.1183095, -1.646667, 4.720562, 0, 0.6352941, 1, 1,
0.1260422, 0.4992286, 1.425941, 0, 0.627451, 1, 1,
0.1444432, -0.4426827, 3.767811, 0, 0.6235294, 1, 1,
0.1460853, -2.520799, 2.184273, 0, 0.6156863, 1, 1,
0.1470501, 0.4774291, -0.3917607, 0, 0.6117647, 1, 1,
0.1494198, 0.09101286, -0.8829192, 0, 0.6039216, 1, 1,
0.1503089, 2.117222, 1.787576, 0, 0.5960785, 1, 1,
0.1529665, -0.865844, 2.706455, 0, 0.5921569, 1, 1,
0.1585992, -0.4666781, 3.500902, 0, 0.5843138, 1, 1,
0.1678497, -0.8826268, 1.610505, 0, 0.5803922, 1, 1,
0.1690223, 0.08311708, -1.532615, 0, 0.572549, 1, 1,
0.1691288, 0.08223297, 1.581845, 0, 0.5686275, 1, 1,
0.1717898, -1.168909, 3.626163, 0, 0.5607843, 1, 1,
0.1739266, -0.1995113, 2.588466, 0, 0.5568628, 1, 1,
0.1751165, 0.7072104, 1.091968, 0, 0.5490196, 1, 1,
0.1858532, 0.9861436, 0.5074978, 0, 0.5450981, 1, 1,
0.1868218, 0.1080431, 1.596586, 0, 0.5372549, 1, 1,
0.1890015, -0.5312096, 3.11593, 0, 0.5333334, 1, 1,
0.1894003, 1.040456, 2.527624, 0, 0.5254902, 1, 1,
0.1898571, -0.7025812, 1.96003, 0, 0.5215687, 1, 1,
0.1917253, 1.01436, -0.1715321, 0, 0.5137255, 1, 1,
0.1923175, -1.003358, 2.443344, 0, 0.509804, 1, 1,
0.1938084, 0.9150172, -0.9206654, 0, 0.5019608, 1, 1,
0.1977025, -0.9385493, 2.971209, 0, 0.4941176, 1, 1,
0.1985645, -1.766334, 2.756609, 0, 0.4901961, 1, 1,
0.2001671, -0.004278024, 1.409219, 0, 0.4823529, 1, 1,
0.2028214, -0.0194287, 0.2093759, 0, 0.4784314, 1, 1,
0.2071706, 1.191798, -0.8551003, 0, 0.4705882, 1, 1,
0.2099687, 0.1296635, 2.202379, 0, 0.4666667, 1, 1,
0.2114483, -1.596187, 3.152194, 0, 0.4588235, 1, 1,
0.2115037, 0.498787, 0.5968207, 0, 0.454902, 1, 1,
0.2126218, -0.4118952, 2.542694, 0, 0.4470588, 1, 1,
0.2144824, -0.8655041, 2.272499, 0, 0.4431373, 1, 1,
0.2151549, -0.9600793, 2.263559, 0, 0.4352941, 1, 1,
0.2161557, 2.783998, -0.2637828, 0, 0.4313726, 1, 1,
0.2203622, 1.205261, -0.4567665, 0, 0.4235294, 1, 1,
0.2210615, 1.238613, 0.6928928, 0, 0.4196078, 1, 1,
0.2235507, 0.9494971, -0.9456867, 0, 0.4117647, 1, 1,
0.2303287, 0.1322448, 2.805383, 0, 0.4078431, 1, 1,
0.2332876, 0.898355, -0.573511, 0, 0.4, 1, 1,
0.2352596, -0.3629347, 3.384978, 0, 0.3921569, 1, 1,
0.2361311, -0.24148, 1.806052, 0, 0.3882353, 1, 1,
0.2416327, 0.5777166, -1.079227, 0, 0.3803922, 1, 1,
0.244562, 1.893531, 0.01152931, 0, 0.3764706, 1, 1,
0.246762, -1.675272, 3.360536, 0, 0.3686275, 1, 1,
0.2492708, -1.278209, 1.668889, 0, 0.3647059, 1, 1,
0.2499315, -0.1840792, 2.013557, 0, 0.3568628, 1, 1,
0.2503708, -0.3534722, 0.4304998, 0, 0.3529412, 1, 1,
0.2542281, -2.021669, 3.599111, 0, 0.345098, 1, 1,
0.2549236, 0.8220901, -0.8213305, 0, 0.3411765, 1, 1,
0.255018, 1.395313, -0.2222689, 0, 0.3333333, 1, 1,
0.2575323, 2.297168, -0.5837879, 0, 0.3294118, 1, 1,
0.2575496, -0.09950624, 3.086641, 0, 0.3215686, 1, 1,
0.2594416, 0.8799973, 1.532865, 0, 0.3176471, 1, 1,
0.260534, -0.3434111, 2.56329, 0, 0.3098039, 1, 1,
0.2632977, -0.440888, 1.743683, 0, 0.3058824, 1, 1,
0.2633648, -1.387863, 3.634181, 0, 0.2980392, 1, 1,
0.2634118, 0.6871613, 0.09462588, 0, 0.2901961, 1, 1,
0.2663186, 1.29543, 1.279737, 0, 0.2862745, 1, 1,
0.2700015, -1.160692, -0.1468609, 0, 0.2784314, 1, 1,
0.2728249, 0.424267, -0.1191153, 0, 0.2745098, 1, 1,
0.2748188, -0.8738703, 2.986859, 0, 0.2666667, 1, 1,
0.275007, 1.651009, 1.010642, 0, 0.2627451, 1, 1,
0.2753419, -0.02648478, 1.441072, 0, 0.254902, 1, 1,
0.2764787, 0.3180785, 1.420369, 0, 0.2509804, 1, 1,
0.2795993, 1.142991, -0.1661696, 0, 0.2431373, 1, 1,
0.2821553, -0.06658555, 1.613601, 0, 0.2392157, 1, 1,
0.2833775, -1.197216, 2.086629, 0, 0.2313726, 1, 1,
0.2851086, 2.177412, 0.726798, 0, 0.227451, 1, 1,
0.2859793, -0.4152124, 3.699889, 0, 0.2196078, 1, 1,
0.2860094, -0.05168059, 1.034024, 0, 0.2156863, 1, 1,
0.2879852, 0.7223467, 2.332258, 0, 0.2078431, 1, 1,
0.2893319, 1.566649, -1.48331, 0, 0.2039216, 1, 1,
0.2936537, 0.7557345, 1.963726, 0, 0.1960784, 1, 1,
0.2981932, -0.5263785, 1.347247, 0, 0.1882353, 1, 1,
0.2995137, -0.6135796, 2.300154, 0, 0.1843137, 1, 1,
0.3053698, 1.326219, -1.538373, 0, 0.1764706, 1, 1,
0.3101047, -0.3522016, 2.660609, 0, 0.172549, 1, 1,
0.3124646, -1.17523, 3.269599, 0, 0.1647059, 1, 1,
0.3141722, 0.7357389, -0.3974022, 0, 0.1607843, 1, 1,
0.3169345, -0.4060814, 3.060776, 0, 0.1529412, 1, 1,
0.3185999, 0.2508596, 1.582541, 0, 0.1490196, 1, 1,
0.3199403, -0.1265801, 2.385767, 0, 0.1411765, 1, 1,
0.320131, -0.2212799, 2.998017, 0, 0.1372549, 1, 1,
0.3216211, -1.073534, 3.77028, 0, 0.1294118, 1, 1,
0.3225855, -2.069496, 2.763576, 0, 0.1254902, 1, 1,
0.3235877, -0.4953514, 4.197268, 0, 0.1176471, 1, 1,
0.3260969, 0.04492275, 2.972488, 0, 0.1137255, 1, 1,
0.3311399, 1.278707, 1.316248, 0, 0.1058824, 1, 1,
0.3317088, -1.297432, 2.792606, 0, 0.09803922, 1, 1,
0.3408565, 0.6421053, 0.314459, 0, 0.09411765, 1, 1,
0.3494956, -0.8420463, 3.401049, 0, 0.08627451, 1, 1,
0.3502373, 0.4714293, -0.1625658, 0, 0.08235294, 1, 1,
0.3543952, 1.000457, 0.3926839, 0, 0.07450981, 1, 1,
0.3555318, -0.414026, 3.511432, 0, 0.07058824, 1, 1,
0.3575477, -1.561177, 3.362111, 0, 0.0627451, 1, 1,
0.3612837, -1.153016, 4.498644, 0, 0.05882353, 1, 1,
0.3614568, 0.2698171, 1.570526, 0, 0.05098039, 1, 1,
0.3658055, 0.1668118, 1.024089, 0, 0.04705882, 1, 1,
0.3663344, 1.032446, 1.519276, 0, 0.03921569, 1, 1,
0.3668585, 0.2209462, 1.347448, 0, 0.03529412, 1, 1,
0.3702754, -0.0270473, 4.40147, 0, 0.02745098, 1, 1,
0.3728804, 1.200982, -1.309198, 0, 0.02352941, 1, 1,
0.373071, -1.403076, 4.234502, 0, 0.01568628, 1, 1,
0.378145, -0.8038116, 1.578059, 0, 0.01176471, 1, 1,
0.3786417, 0.07462653, 0.1541795, 0, 0.003921569, 1, 1,
0.3786472, -0.4222595, 2.242881, 0.003921569, 0, 1, 1,
0.3802147, 0.2091065, 2.297129, 0.007843138, 0, 1, 1,
0.3830802, 0.9953107, 1.677744, 0.01568628, 0, 1, 1,
0.386502, 1.328025, -0.9186562, 0.01960784, 0, 1, 1,
0.3942457, -0.6805187, 2.743383, 0.02745098, 0, 1, 1,
0.3945068, -0.8049375, 2.929896, 0.03137255, 0, 1, 1,
0.4048432, 1.003385, 0.0554555, 0.03921569, 0, 1, 1,
0.4097356, 0.3063939, -0.03962166, 0.04313726, 0, 1, 1,
0.4134018, 0.6460131, 0.7955408, 0.05098039, 0, 1, 1,
0.4204566, -1.147908, 0.938313, 0.05490196, 0, 1, 1,
0.4224887, -0.2192072, 2.387563, 0.0627451, 0, 1, 1,
0.4235241, -0.1644136, 0.616452, 0.06666667, 0, 1, 1,
0.4240037, -0.1726873, 1.763432, 0.07450981, 0, 1, 1,
0.4249493, 0.2704217, 0.8645552, 0.07843138, 0, 1, 1,
0.4292196, -0.4578687, 4.023177, 0.08627451, 0, 1, 1,
0.4295295, 1.431606, -0.6230417, 0.09019608, 0, 1, 1,
0.4354117, 0.9942757, 0.1131331, 0.09803922, 0, 1, 1,
0.4418427, -0.5688323, 6.176179, 0.1058824, 0, 1, 1,
0.4425694, 0.4513648, 0.2105781, 0.1098039, 0, 1, 1,
0.4427421, 1.372537, 1.601056, 0.1176471, 0, 1, 1,
0.4455272, 0.7847416, 0.5306183, 0.1215686, 0, 1, 1,
0.4477235, -0.6440201, 3.033343, 0.1294118, 0, 1, 1,
0.4614963, -0.7297145, 3.257468, 0.1333333, 0, 1, 1,
0.4657101, 0.3571922, 1.699145, 0.1411765, 0, 1, 1,
0.4688417, -0.08079925, 2.018737, 0.145098, 0, 1, 1,
0.4699595, -2.055831, 2.764854, 0.1529412, 0, 1, 1,
0.4763191, 0.5633449, 0.6797829, 0.1568628, 0, 1, 1,
0.4790795, 0.1612929, 0.7989727, 0.1647059, 0, 1, 1,
0.4811177, -1.435962, 2.468778, 0.1686275, 0, 1, 1,
0.4882871, -0.483044, 1.480149, 0.1764706, 0, 1, 1,
0.488434, -0.5616151, 2.975884, 0.1803922, 0, 1, 1,
0.4957553, -0.6646714, 2.125697, 0.1882353, 0, 1, 1,
0.4976522, -0.05715216, 0.9703559, 0.1921569, 0, 1, 1,
0.5046308, -1.30171, 2.198343, 0.2, 0, 1, 1,
0.5046538, -0.5582651, 3.984991, 0.2078431, 0, 1, 1,
0.5110807, 0.03877696, 1.531607, 0.2117647, 0, 1, 1,
0.5174764, -0.3875193, 0.4734686, 0.2196078, 0, 1, 1,
0.5208984, 1.541, -0.1020285, 0.2235294, 0, 1, 1,
0.5223662, -0.2613724, 2.807725, 0.2313726, 0, 1, 1,
0.5313975, 0.5536355, -0.4513187, 0.2352941, 0, 1, 1,
0.5319135, -0.3997412, 1.702947, 0.2431373, 0, 1, 1,
0.5338011, -0.2278382, 1.796781, 0.2470588, 0, 1, 1,
0.5357168, 0.3257478, 0.6783621, 0.254902, 0, 1, 1,
0.5410569, 1.366137, 1.138449, 0.2588235, 0, 1, 1,
0.5441074, -0.01704275, 1.535964, 0.2666667, 0, 1, 1,
0.5480161, -1.902038, 3.956069, 0.2705882, 0, 1, 1,
0.5481128, 0.1017335, 1.386195, 0.2784314, 0, 1, 1,
0.5494534, -0.9519368, 3.858794, 0.282353, 0, 1, 1,
0.5570783, 0.5102645, 2.014852, 0.2901961, 0, 1, 1,
0.5579357, 0.4584621, 0.3382864, 0.2941177, 0, 1, 1,
0.5589108, 0.04861698, 0.2372381, 0.3019608, 0, 1, 1,
0.5610646, -0.7933596, 3.172911, 0.3098039, 0, 1, 1,
0.5616102, 1.590823, 1.112769, 0.3137255, 0, 1, 1,
0.5644143, 0.1856091, 2.379704, 0.3215686, 0, 1, 1,
0.5682569, -1.016105, 3.487573, 0.3254902, 0, 1, 1,
0.5695281, 0.1575539, 1.78715, 0.3333333, 0, 1, 1,
0.569671, 1.087432, 1.455411, 0.3372549, 0, 1, 1,
0.5730049, 0.6037254, 0.6311272, 0.345098, 0, 1, 1,
0.5738987, 0.4828864, 0.6686885, 0.3490196, 0, 1, 1,
0.5774919, 0.7027993, 0.5265018, 0.3568628, 0, 1, 1,
0.5775251, 1.357297, -0.229206, 0.3607843, 0, 1, 1,
0.5776403, 1.096796, -1.029096, 0.3686275, 0, 1, 1,
0.5807602, 0.06766076, 1.633978, 0.372549, 0, 1, 1,
0.5845867, 0.9931455, 1.07604, 0.3803922, 0, 1, 1,
0.5910485, 0.5166676, 0.5625303, 0.3843137, 0, 1, 1,
0.5968337, 0.1594192, 0.04966133, 0.3921569, 0, 1, 1,
0.6079176, -1.344742, 0.8894265, 0.3960784, 0, 1, 1,
0.6092737, -0.402261, 3.129678, 0.4039216, 0, 1, 1,
0.6185763, 0.778768, 1.227882, 0.4117647, 0, 1, 1,
0.6218899, -0.05948174, 2.158829, 0.4156863, 0, 1, 1,
0.622627, 0.7292929, 0.4000801, 0.4235294, 0, 1, 1,
0.6231081, 0.240022, -0.3383794, 0.427451, 0, 1, 1,
0.6252492, 0.3523385, 0.9221023, 0.4352941, 0, 1, 1,
0.6292948, -0.9765344, 3.158803, 0.4392157, 0, 1, 1,
0.630088, 1.361401, 3.857687, 0.4470588, 0, 1, 1,
0.6312751, -0.4074632, 1.679557, 0.4509804, 0, 1, 1,
0.634828, 0.2043853, 1.635659, 0.4588235, 0, 1, 1,
0.6378047, 1.204396, 0.8584641, 0.4627451, 0, 1, 1,
0.6393061, 1.200699, 0.8815531, 0.4705882, 0, 1, 1,
0.6394079, 0.4375641, 0.7456993, 0.4745098, 0, 1, 1,
0.6397613, 0.5520308, 0.171477, 0.4823529, 0, 1, 1,
0.6398407, 0.04832531, 0.9066445, 0.4862745, 0, 1, 1,
0.64024, 0.5906059, 0.3462783, 0.4941176, 0, 1, 1,
0.6420417, -0.3416692, 0.1826657, 0.5019608, 0, 1, 1,
0.6451132, 3.142726, 0.5625608, 0.5058824, 0, 1, 1,
0.6459653, -0.08309847, 1.235321, 0.5137255, 0, 1, 1,
0.6482916, -2.145502, 1.65164, 0.5176471, 0, 1, 1,
0.6505778, -0.776073, 2.862868, 0.5254902, 0, 1, 1,
0.6520619, -0.1274087, -0.1818443, 0.5294118, 0, 1, 1,
0.6522114, -1.456204, 3.556717, 0.5372549, 0, 1, 1,
0.6541035, -0.2142967, 2.370592, 0.5411765, 0, 1, 1,
0.6563028, -0.6846721, 1.283937, 0.5490196, 0, 1, 1,
0.6650274, -1.146931, 1.597799, 0.5529412, 0, 1, 1,
0.66721, 1.102108, -0.2704493, 0.5607843, 0, 1, 1,
0.669364, 1.053216, 1.280694, 0.5647059, 0, 1, 1,
0.6741733, 1.026225, 0.9226182, 0.572549, 0, 1, 1,
0.6757668, 0.6997703, 2.053862, 0.5764706, 0, 1, 1,
0.675923, 2.003643, -0.6463779, 0.5843138, 0, 1, 1,
0.6791391, 0.4737887, 1.007385, 0.5882353, 0, 1, 1,
0.679718, -0.005360453, 0.556204, 0.5960785, 0, 1, 1,
0.6862229, -0.233405, 0.8535537, 0.6039216, 0, 1, 1,
0.6934645, 0.3699816, 1.360085, 0.6078432, 0, 1, 1,
0.6943543, 0.4199357, -0.2763247, 0.6156863, 0, 1, 1,
0.6997018, -0.4007955, 1.9377, 0.6196079, 0, 1, 1,
0.7037598, -0.6664233, 1.810449, 0.627451, 0, 1, 1,
0.7072984, 0.07802582, -0.5517886, 0.6313726, 0, 1, 1,
0.710568, -0.03431579, 1.756132, 0.6392157, 0, 1, 1,
0.7109808, 0.4613245, 2.575484, 0.6431373, 0, 1, 1,
0.7110263, -1.8929, 2.616855, 0.6509804, 0, 1, 1,
0.7115108, -0.03380834, 1.976204, 0.654902, 0, 1, 1,
0.7133615, -0.3001326, 1.005534, 0.6627451, 0, 1, 1,
0.7136828, 0.9034849, 1.212503, 0.6666667, 0, 1, 1,
0.7220987, 1.371883, 1.164085, 0.6745098, 0, 1, 1,
0.7227708, -0.3649999, 1.964278, 0.6784314, 0, 1, 1,
0.7235126, -0.9528469, 1.754761, 0.6862745, 0, 1, 1,
0.7247794, -0.9438592, 1.877588, 0.6901961, 0, 1, 1,
0.7330922, 0.3034607, 0.704025, 0.6980392, 0, 1, 1,
0.7395219, -1.086538, 2.524305, 0.7058824, 0, 1, 1,
0.7481245, 0.2598049, 3.884788, 0.7098039, 0, 1, 1,
0.7487891, -0.7525742, 2.69453, 0.7176471, 0, 1, 1,
0.7565951, 0.3721096, 0.2782677, 0.7215686, 0, 1, 1,
0.7616581, 0.8955981, 0.4254511, 0.7294118, 0, 1, 1,
0.7702225, -1.063755, 2.170194, 0.7333333, 0, 1, 1,
0.7729198, -0.08998162, 0.5739998, 0.7411765, 0, 1, 1,
0.7732701, -0.5550472, 4.863698, 0.7450981, 0, 1, 1,
0.7743903, -0.3765029, 0.7350657, 0.7529412, 0, 1, 1,
0.7792716, -1.72213, 3.033517, 0.7568628, 0, 1, 1,
0.7793245, -0.8053759, 2.17276, 0.7647059, 0, 1, 1,
0.7795883, -1.534523, 2.700701, 0.7686275, 0, 1, 1,
0.7797503, 3.335675, 2.201762, 0.7764706, 0, 1, 1,
0.7802979, 0.4757992, 2.165488, 0.7803922, 0, 1, 1,
0.7900119, 0.03167347, 1.609908, 0.7882353, 0, 1, 1,
0.8060178, 1.740439, 0.4142341, 0.7921569, 0, 1, 1,
0.8106163, -3.775302, 1.752746, 0.8, 0, 1, 1,
0.8267865, 1.112931, 0.3241901, 0.8078431, 0, 1, 1,
0.8333839, 1.131393, -1.159547, 0.8117647, 0, 1, 1,
0.8360978, 2.153884, 0.4331072, 0.8196079, 0, 1, 1,
0.8422946, 0.292634, 1.014402, 0.8235294, 0, 1, 1,
0.8490657, 0.7577865, -1.241914, 0.8313726, 0, 1, 1,
0.8609434, -0.2293964, 0.5889112, 0.8352941, 0, 1, 1,
0.8709149, -0.1900188, 1.722695, 0.8431373, 0, 1, 1,
0.8725378, 0.06963266, 1.019424, 0.8470588, 0, 1, 1,
0.8758465, 0.6660034, -0.1332535, 0.854902, 0, 1, 1,
0.8839558, -0.094692, 0.7059188, 0.8588235, 0, 1, 1,
0.8885528, 0.6071668, 1.623238, 0.8666667, 0, 1, 1,
0.890631, -0.3016661, 0.03740711, 0.8705882, 0, 1, 1,
0.9030424, -0.0007174225, 1.234011, 0.8784314, 0, 1, 1,
0.905815, -0.5722623, 2.202987, 0.8823529, 0, 1, 1,
0.906633, 0.09562162, 2.197047, 0.8901961, 0, 1, 1,
0.9071566, -1.010972, 3.719918, 0.8941177, 0, 1, 1,
0.9107249, -0.5479197, 3.516826, 0.9019608, 0, 1, 1,
0.9239754, -0.6759884, 3.567664, 0.9098039, 0, 1, 1,
0.9303747, 0.2899551, -0.6157233, 0.9137255, 0, 1, 1,
0.931703, -1.280834, 3.58897, 0.9215686, 0, 1, 1,
0.9343478, -0.2232175, 1.231574, 0.9254902, 0, 1, 1,
0.9489788, -0.07265421, 3.625693, 0.9333333, 0, 1, 1,
0.9541941, 0.8673517, 1.526868, 0.9372549, 0, 1, 1,
0.9575749, 1.893533, 1.076351, 0.945098, 0, 1, 1,
0.9653848, 0.01165073, 0.5916044, 0.9490196, 0, 1, 1,
0.966496, 0.6939522, 1.732805, 0.9568627, 0, 1, 1,
0.9749442, -0.01298271, 2.35533, 0.9607843, 0, 1, 1,
0.980157, 0.9014943, 1.072253, 0.9686275, 0, 1, 1,
0.9815925, -1.518309, 3.496818, 0.972549, 0, 1, 1,
0.9858025, -0.5792971, 3.034409, 0.9803922, 0, 1, 1,
0.9871819, 0.4691823, -0.4099654, 0.9843137, 0, 1, 1,
0.9882172, -1.537336, 4.672514, 0.9921569, 0, 1, 1,
0.9910826, -0.03733894, 2.260352, 0.9960784, 0, 1, 1,
0.9939308, -0.1520649, 0.05755024, 1, 0, 0.9960784, 1,
0.9968025, -0.4112822, 0.1299571, 1, 0, 0.9882353, 1,
1.002706, -0.1678195, 0.1682981, 1, 0, 0.9843137, 1,
1.003453, 1.145003, 0.815372, 1, 0, 0.9764706, 1,
1.009597, 1.720927, 0.4029057, 1, 0, 0.972549, 1,
1.012772, -0.6855577, 3.612558, 1, 0, 0.9647059, 1,
1.0157, 0.8837167, 2.295957, 1, 0, 0.9607843, 1,
1.024517, -0.01882761, 2.814017, 1, 0, 0.9529412, 1,
1.03487, -1.356467, 2.700087, 1, 0, 0.9490196, 1,
1.035735, -0.2981188, 1.770814, 1, 0, 0.9411765, 1,
1.036201, 0.7380644, 0.7781734, 1, 0, 0.9372549, 1,
1.038988, 0.2421962, 0.5336881, 1, 0, 0.9294118, 1,
1.041232, -0.4315521, 2.981224, 1, 0, 0.9254902, 1,
1.048635, 0.6167195, 0.1029701, 1, 0, 0.9176471, 1,
1.051754, -1.152297, 3.810612, 1, 0, 0.9137255, 1,
1.060303, 1.858274, 0.6312888, 1, 0, 0.9058824, 1,
1.066715, 0.6424508, 1.507704, 1, 0, 0.9019608, 1,
1.067527, 1.519129, 0.7752402, 1, 0, 0.8941177, 1,
1.07324, 0.7138751, 2.751865, 1, 0, 0.8862745, 1,
1.074129, -0.04128097, 1.855241, 1, 0, 0.8823529, 1,
1.075834, -1.762249, 3.216276, 1, 0, 0.8745098, 1,
1.075896, -0.8680776, 1.939219, 1, 0, 0.8705882, 1,
1.087406, -0.4425579, 2.423549, 1, 0, 0.8627451, 1,
1.089255, 2.565109, -0.7097319, 1, 0, 0.8588235, 1,
1.091955, 0.7366551, 1.943061, 1, 0, 0.8509804, 1,
1.09352, -1.680943, 3.216529, 1, 0, 0.8470588, 1,
1.102454, 0.6528454, 0.1336142, 1, 0, 0.8392157, 1,
1.103272, -0.9918754, 3.512051, 1, 0, 0.8352941, 1,
1.112371, 0.2855632, 2.474478, 1, 0, 0.827451, 1,
1.13349, -0.5586401, 1.216233, 1, 0, 0.8235294, 1,
1.141458, 0.5152043, 1.787908, 1, 0, 0.8156863, 1,
1.148374, 1.240452, 2.36892, 1, 0, 0.8117647, 1,
1.149264, -1.170867, 3.513821, 1, 0, 0.8039216, 1,
1.166784, 0.9767892, 1.031522, 1, 0, 0.7960784, 1,
1.173755, -1.02154, 3.549263, 1, 0, 0.7921569, 1,
1.174124, 0.6961811, -0.4608551, 1, 0, 0.7843137, 1,
1.174824, 0.1787465, 0.4218746, 1, 0, 0.7803922, 1,
1.176244, -0.6453496, 1.782508, 1, 0, 0.772549, 1,
1.176664, -0.01913549, 0.5759891, 1, 0, 0.7686275, 1,
1.17728, -1.215274, 2.98091, 1, 0, 0.7607843, 1,
1.179287, -0.408274, 1.77567, 1, 0, 0.7568628, 1,
1.1805, -0.7449685, 2.250192, 1, 0, 0.7490196, 1,
1.183048, -0.8297085, 2.320396, 1, 0, 0.7450981, 1,
1.185447, 1.242854, -1.219748, 1, 0, 0.7372549, 1,
1.187761, -1.620391, 3.819232, 1, 0, 0.7333333, 1,
1.189588, 0.1292738, 1.134368, 1, 0, 0.7254902, 1,
1.192966, -1.02414, 2.073867, 1, 0, 0.7215686, 1,
1.195636, 1.29714, 0.9647825, 1, 0, 0.7137255, 1,
1.199089, 0.1301798, 2.041255, 1, 0, 0.7098039, 1,
1.202739, 1.525406, 2.322777, 1, 0, 0.7019608, 1,
1.203453, 1.553495, 0.2048355, 1, 0, 0.6941177, 1,
1.204872, -1.521683, 2.187888, 1, 0, 0.6901961, 1,
1.207296, 0.1765853, 1.814675, 1, 0, 0.682353, 1,
1.208086, 0.5225071, 1.928582, 1, 0, 0.6784314, 1,
1.211621, 0.09969197, 1.865433, 1, 0, 0.6705883, 1,
1.212988, -1.132654, 1.288032, 1, 0, 0.6666667, 1,
1.214225, -0.5461757, 2.557647, 1, 0, 0.6588235, 1,
1.21587, -0.7578924, 1.018321, 1, 0, 0.654902, 1,
1.21751, -0.1205787, 1.730508, 1, 0, 0.6470588, 1,
1.24483, 0.06383882, 0.9115431, 1, 0, 0.6431373, 1,
1.259733, -0.3537916, 2.582532, 1, 0, 0.6352941, 1,
1.27293, -0.2746568, 3.019589, 1, 0, 0.6313726, 1,
1.274272, 0.9813838, 1.739654, 1, 0, 0.6235294, 1,
1.275323, -1.542233, 2.636821, 1, 0, 0.6196079, 1,
1.28033, -1.17578, 2.910233, 1, 0, 0.6117647, 1,
1.286681, 0.6202397, 1.096097, 1, 0, 0.6078432, 1,
1.291057, -0.1885898, 0.03826682, 1, 0, 0.6, 1,
1.317809, 2.910201, 0.8016879, 1, 0, 0.5921569, 1,
1.321637, 1.018688, 1.887864, 1, 0, 0.5882353, 1,
1.328392, -0.8419127, 1.648643, 1, 0, 0.5803922, 1,
1.329697, -0.2572724, 2.341348, 1, 0, 0.5764706, 1,
1.332984, -0.6452894, 3.706983, 1, 0, 0.5686275, 1,
1.350585, -0.4613917, 2.109543, 1, 0, 0.5647059, 1,
1.355006, 1.625086, 0.7043698, 1, 0, 0.5568628, 1,
1.357001, -0.3865179, 4.259894, 1, 0, 0.5529412, 1,
1.361948, 0.4784303, 2.884629, 1, 0, 0.5450981, 1,
1.363358, 1.851147, 1.53496, 1, 0, 0.5411765, 1,
1.373016, -1.460993, 2.948235, 1, 0, 0.5333334, 1,
1.383066, 0.5265239, 0.6461979, 1, 0, 0.5294118, 1,
1.395422, -0.6970067, 3.813213, 1, 0, 0.5215687, 1,
1.398681, 0.6802729, 1.154345, 1, 0, 0.5176471, 1,
1.405432, -1.64182, 2.918186, 1, 0, 0.509804, 1,
1.41623, -0.1765235, 1.861434, 1, 0, 0.5058824, 1,
1.419698, 0.1149498, 0.1699023, 1, 0, 0.4980392, 1,
1.434016, -2.132649, 1.569216, 1, 0, 0.4901961, 1,
1.434573, -0.3046474, 0.778851, 1, 0, 0.4862745, 1,
1.434951, -0.7456332, 2.693816, 1, 0, 0.4784314, 1,
1.458886, -1.75768, 3.223804, 1, 0, 0.4745098, 1,
1.461296, 1.124722, 0.2388803, 1, 0, 0.4666667, 1,
1.46218, -1.334119, 1.15441, 1, 0, 0.4627451, 1,
1.463721, -1.158301, 1.677686, 1, 0, 0.454902, 1,
1.473474, -0.2040383, 2.271908, 1, 0, 0.4509804, 1,
1.486625, -1.174078, 3.492573, 1, 0, 0.4431373, 1,
1.489804, 1.076244, 2.814334, 1, 0, 0.4392157, 1,
1.503507, 0.130808, 1.421441, 1, 0, 0.4313726, 1,
1.513468, 0.03768651, -0.1893781, 1, 0, 0.427451, 1,
1.517105, -2.159416, 2.049524, 1, 0, 0.4196078, 1,
1.518358, -0.9228567, 2.563087, 1, 0, 0.4156863, 1,
1.520565, 0.5216517, 0.7897743, 1, 0, 0.4078431, 1,
1.53677, 0.5328174, 1.726711, 1, 0, 0.4039216, 1,
1.543107, -0.1325356, 2.785771, 1, 0, 0.3960784, 1,
1.544468, -0.2742803, 2.678218, 1, 0, 0.3882353, 1,
1.549726, 2.450212, 1.25489, 1, 0, 0.3843137, 1,
1.558897, -1.381378, 1.182019, 1, 0, 0.3764706, 1,
1.561921, -0.9541651, 2.419898, 1, 0, 0.372549, 1,
1.571151, -0.6307071, 2.085641, 1, 0, 0.3647059, 1,
1.57221, -0.4980297, 0.03827808, 1, 0, 0.3607843, 1,
1.574174, 0.07432852, -0.09787217, 1, 0, 0.3529412, 1,
1.621724, 0.4387163, 0.1842476, 1, 0, 0.3490196, 1,
1.625564, -0.224201, 3.592347, 1, 0, 0.3411765, 1,
1.639728, -0.1404013, 1.730464, 1, 0, 0.3372549, 1,
1.643525, 0.408662, -0.2535559, 1, 0, 0.3294118, 1,
1.657517, -1.936288, 3.623379, 1, 0, 0.3254902, 1,
1.658967, 0.4190303, 1.027095, 1, 0, 0.3176471, 1,
1.666011, 1.064541, 0.05719066, 1, 0, 0.3137255, 1,
1.667354, 0.1441522, 1.631589, 1, 0, 0.3058824, 1,
1.670966, 2.226, 2.09972, 1, 0, 0.2980392, 1,
1.690293, 0.9439151, 0.7302182, 1, 0, 0.2941177, 1,
1.708635, -0.975406, 2.645325, 1, 0, 0.2862745, 1,
1.722206, -1.64024, 1.739348, 1, 0, 0.282353, 1,
1.742904, -1.800975, 3.436682, 1, 0, 0.2745098, 1,
1.750182, 1.48094, 1.516716, 1, 0, 0.2705882, 1,
1.753369, -0.1180391, 2.430367, 1, 0, 0.2627451, 1,
1.759622, 0.05545461, 1.902014, 1, 0, 0.2588235, 1,
1.762044, 0.3980539, 2.076115, 1, 0, 0.2509804, 1,
1.771686, 2.241443, 2.679068, 1, 0, 0.2470588, 1,
1.772667, 0.7173828, 3.837898, 1, 0, 0.2392157, 1,
1.777602, -0.3222657, 0.4747414, 1, 0, 0.2352941, 1,
1.783206, 0.7544633, 0.6566954, 1, 0, 0.227451, 1,
1.792358, -1.865503, 3.144596, 1, 0, 0.2235294, 1,
1.805607, 2.034707, -0.1029258, 1, 0, 0.2156863, 1,
1.810032, 0.4869497, 3.518825, 1, 0, 0.2117647, 1,
1.814643, 0.5665731, 1.901019, 1, 0, 0.2039216, 1,
1.816137, -2.068202, 3.431846, 1, 0, 0.1960784, 1,
1.838764, 0.5422835, 1.778372, 1, 0, 0.1921569, 1,
1.842118, -0.4812412, 0.6915902, 1, 0, 0.1843137, 1,
1.842142, -0.01321553, 0.9646649, 1, 0, 0.1803922, 1,
1.847509, 0.190625, 1.345604, 1, 0, 0.172549, 1,
1.850646, -0.3701226, 1.410858, 1, 0, 0.1686275, 1,
1.854679, -0.7444382, 2.680782, 1, 0, 0.1607843, 1,
1.858018, 0.6043808, 0.02388363, 1, 0, 0.1568628, 1,
1.89479, -1.009954, 3.781237, 1, 0, 0.1490196, 1,
1.898823, -2.571786, 1.555229, 1, 0, 0.145098, 1,
1.926769, -0.414725, 1.77443, 1, 0, 0.1372549, 1,
1.942432, 1.844774, 0.2431573, 1, 0, 0.1333333, 1,
1.947196, -0.6867701, 1.745229, 1, 0, 0.1254902, 1,
1.963788, -0.9685736, 0.4491718, 1, 0, 0.1215686, 1,
1.97703, 1.165574, 1.051756, 1, 0, 0.1137255, 1,
1.984198, -0.3899982, 1.824163, 1, 0, 0.1098039, 1,
2.013506, 1.058849, 1.356484, 1, 0, 0.1019608, 1,
2.019839, 0.8293853, -0.05218716, 1, 0, 0.09411765, 1,
2.025266, 0.6955637, 1.932217, 1, 0, 0.09019608, 1,
2.065653, -0.9710137, 1.24744, 1, 0, 0.08235294, 1,
2.076963, 0.9832405, 1.915378, 1, 0, 0.07843138, 1,
2.078624, 0.7029128, 2.410747, 1, 0, 0.07058824, 1,
2.08327, -1.586536, 0.7715775, 1, 0, 0.06666667, 1,
2.09137, 1.49063, 0.2970097, 1, 0, 0.05882353, 1,
2.115909, -0.0622432, 1.802579, 1, 0, 0.05490196, 1,
2.240657, -0.2041741, 0.3979346, 1, 0, 0.04705882, 1,
2.351081, -1.683217, 3.50738, 1, 0, 0.04313726, 1,
2.420679, 0.8205749, 0.8002592, 1, 0, 0.03529412, 1,
2.42146, -1.108977, 1.160708, 1, 0, 0.03137255, 1,
2.450113, -0.7793431, 1.692302, 1, 0, 0.02352941, 1,
2.532636, 1.721919, 2.34756, 1, 0, 0.01960784, 1,
2.692584, -1.426265, 2.984591, 1, 0, 0.01176471, 1,
2.898868, 0.2556605, 1.332932, 1, 0, 0.007843138, 1
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
-0.4238306, -5.347768, -7.479861, 0, -0.5, 0.5, 0.5,
-0.4238306, -5.347768, -7.479861, 1, -0.5, 0.5, 0.5,
-0.4238306, -5.347768, -7.479861, 1, 1.5, 0.5, 0.5,
-0.4238306, -5.347768, -7.479861, 0, 1.5, 0.5, 0.5
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
-4.872924, -0.2982816, -7.479861, 0, -0.5, 0.5, 0.5,
-4.872924, -0.2982816, -7.479861, 1, -0.5, 0.5, 0.5,
-4.872924, -0.2982816, -7.479861, 1, 1.5, 0.5, 0.5,
-4.872924, -0.2982816, -7.479861, 0, 1.5, 0.5, 0.5
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
-4.872924, -5.347768, 0.3377697, 0, -0.5, 0.5, 0.5,
-4.872924, -5.347768, 0.3377697, 1, -0.5, 0.5, 0.5,
-4.872924, -5.347768, 0.3377697, 1, 1.5, 0.5, 0.5,
-4.872924, -5.347768, 0.3377697, 0, 1.5, 0.5, 0.5
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
-3, -4.182502, -5.675792,
2, -4.182502, -5.675792,
-3, -4.182502, -5.675792,
-3, -4.376713, -5.97647,
-2, -4.182502, -5.675792,
-2, -4.376713, -5.97647,
-1, -4.182502, -5.675792,
-1, -4.376713, -5.97647,
0, -4.182502, -5.675792,
0, -4.376713, -5.97647,
1, -4.182502, -5.675792,
1, -4.376713, -5.97647,
2, -4.182502, -5.675792,
2, -4.376713, -5.97647
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
-3, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
-3, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
-3, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
-3, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5,
-2, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
-2, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
-2, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
-2, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5,
-1, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
-1, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
-1, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
-1, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5,
0, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
0, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
0, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
0, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5,
1, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
1, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
1, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
1, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5,
2, -4.765135, -6.577826, 0, -0.5, 0.5, 0.5,
2, -4.765135, -6.577826, 1, -0.5, 0.5, 0.5,
2, -4.765135, -6.577826, 1, 1.5, 0.5, 0.5,
2, -4.765135, -6.577826, 0, 1.5, 0.5, 0.5
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
-3.84621, -4, -5.675792,
-3.84621, 2, -5.675792,
-3.84621, -4, -5.675792,
-4.01733, -4, -5.97647,
-3.84621, -2, -5.675792,
-4.01733, -2, -5.97647,
-3.84621, 0, -5.675792,
-4.01733, 0, -5.97647,
-3.84621, 2, -5.675792,
-4.01733, 2, -5.97647
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
"-4",
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
-4.359568, -4, -6.577826, 0, -0.5, 0.5, 0.5,
-4.359568, -4, -6.577826, 1, -0.5, 0.5, 0.5,
-4.359568, -4, -6.577826, 1, 1.5, 0.5, 0.5,
-4.359568, -4, -6.577826, 0, 1.5, 0.5, 0.5,
-4.359568, -2, -6.577826, 0, -0.5, 0.5, 0.5,
-4.359568, -2, -6.577826, 1, -0.5, 0.5, 0.5,
-4.359568, -2, -6.577826, 1, 1.5, 0.5, 0.5,
-4.359568, -2, -6.577826, 0, 1.5, 0.5, 0.5,
-4.359568, 0, -6.577826, 0, -0.5, 0.5, 0.5,
-4.359568, 0, -6.577826, 1, -0.5, 0.5, 0.5,
-4.359568, 0, -6.577826, 1, 1.5, 0.5, 0.5,
-4.359568, 0, -6.577826, 0, 1.5, 0.5, 0.5,
-4.359568, 2, -6.577826, 0, -0.5, 0.5, 0.5,
-4.359568, 2, -6.577826, 1, -0.5, 0.5, 0.5,
-4.359568, 2, -6.577826, 1, 1.5, 0.5, 0.5,
-4.359568, 2, -6.577826, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.84621, -4.182502, -4,
-3.84621, -4.182502, 6,
-3.84621, -4.182502, -4,
-4.01733, -4.376713, -4,
-3.84621, -4.182502, -2,
-4.01733, -4.376713, -2,
-3.84621, -4.182502, 0,
-4.01733, -4.376713, 0,
-3.84621, -4.182502, 2,
-4.01733, -4.376713, 2,
-3.84621, -4.182502, 4,
-4.01733, -4.376713, 4,
-3.84621, -4.182502, 6,
-4.01733, -4.376713, 6
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
-4.359568, -4.765135, -4, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, -4, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, -4, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, -4, 0, 1.5, 0.5, 0.5,
-4.359568, -4.765135, -2, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, -2, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, -2, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, -2, 0, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 0, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 0, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 0, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 0, 0, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 2, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 2, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 2, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 2, 0, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 4, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 4, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 4, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 4, 0, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 6, 0, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 6, 1, -0.5, 0.5, 0.5,
-4.359568, -4.765135, 6, 1, 1.5, 0.5, 0.5,
-4.359568, -4.765135, 6, 0, 1.5, 0.5, 0.5
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
-3.84621, -4.182502, -5.675792,
-3.84621, 3.585939, -5.675792,
-3.84621, -4.182502, 6.351332,
-3.84621, 3.585939, 6.351332,
-3.84621, -4.182502, -5.675792,
-3.84621, -4.182502, 6.351332,
-3.84621, 3.585939, -5.675792,
-3.84621, 3.585939, 6.351332,
-3.84621, -4.182502, -5.675792,
2.998549, -4.182502, -5.675792,
-3.84621, -4.182502, 6.351332,
2.998549, -4.182502, 6.351332,
-3.84621, 3.585939, -5.675792,
2.998549, 3.585939, -5.675792,
-3.84621, 3.585939, 6.351332,
2.998549, 3.585939, 6.351332,
2.998549, -4.182502, -5.675792,
2.998549, 3.585939, -5.675792,
2.998549, -4.182502, 6.351332,
2.998549, 3.585939, 6.351332,
2.998549, -4.182502, -5.675792,
2.998549, -4.182502, 6.351332,
2.998549, 3.585939, -5.675792,
2.998549, 3.585939, 6.351332
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
var radius = 8.474175;
var distance = 37.70256;
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
mvMatrix.translate( 0.4238306, 0.2982816, -0.3377697 );
mvMatrix.scale( 1.338607, 1.179444, 0.761815 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.70256);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
acequinocyl<-read.table("acequinocyl.xyz")
```

```
## Error in read.table("acequinocyl.xyz"): no lines available in input
```

```r
x<-acequinocyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
y<-acequinocyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
z<-acequinocyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
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
-3.74653, -0.254631, -0.8897196, 0, 0, 1, 1, 1,
-3.169329, -0.1574741, -0.2764191, 1, 0, 0, 1, 1,
-3.094436, -1.047461, -0.8030645, 1, 0, 0, 1, 1,
-2.940406, -1.11325, -1.680325, 1, 0, 0, 1, 1,
-2.83757, -0.09175084, -2.144159, 1, 0, 0, 1, 1,
-2.640257, -0.7844765, -1.837479, 1, 0, 0, 1, 1,
-2.498001, -0.8969618, -1.539458, 0, 0, 0, 1, 1,
-2.450859, -0.8643963, -1.54405, 0, 0, 0, 1, 1,
-2.388101, -0.1610505, -1.169257, 0, 0, 0, 1, 1,
-2.353698, -0.4690368, -1.221188, 0, 0, 0, 1, 1,
-2.343125, -0.2423006, -1.216992, 0, 0, 0, 1, 1,
-2.338693, -0.1311654, -1.357189, 0, 0, 0, 1, 1,
-2.308029, 1.00196, -0.7239816, 0, 0, 0, 1, 1,
-2.301523, -0.1771647, 0.5564418, 1, 1, 1, 1, 1,
-2.220327, -1.219337, -3.194239, 1, 1, 1, 1, 1,
-2.215545, 1.406047, -0.1516968, 1, 1, 1, 1, 1,
-2.192562, -0.3753019, -1.268628, 1, 1, 1, 1, 1,
-2.170442, 0.3014368, -1.27781, 1, 1, 1, 1, 1,
-2.152474, -0.2159648, -0.2005032, 1, 1, 1, 1, 1,
-2.140608, -0.2877921, -1.91041, 1, 1, 1, 1, 1,
-2.12719, -0.2757453, -0.1219944, 1, 1, 1, 1, 1,
-2.083978, -0.6279227, -0.7778996, 1, 1, 1, 1, 1,
-2.016279, 0.05566083, -1.104376, 1, 1, 1, 1, 1,
-2.013427, -0.6789225, -1.462683, 1, 1, 1, 1, 1,
-2.00809, -0.2259848, -2.140115, 1, 1, 1, 1, 1,
-1.995323, -0.4894492, -2.779042, 1, 1, 1, 1, 1,
-1.974108, 0.2679206, -1.271926, 1, 1, 1, 1, 1,
-1.972638, -1.767256, -3.03945, 1, 1, 1, 1, 1,
-1.941107, 2.272834, -1.875402, 0, 0, 1, 1, 1,
-1.940998, 0.07431819, -1.568852, 1, 0, 0, 1, 1,
-1.939957, -1.1658, -1.735096, 1, 0, 0, 1, 1,
-1.914362, 0.60172, -1.421775, 1, 0, 0, 1, 1,
-1.901398, -1.309421, -0.1236771, 1, 0, 0, 1, 1,
-1.893721, 0.8591888, 0.01194518, 1, 0, 0, 1, 1,
-1.88105, -1.258267, -0.6031945, 0, 0, 0, 1, 1,
-1.849785, 0.2214653, -0.9798132, 0, 0, 0, 1, 1,
-1.832722, -0.3213283, -2.40907, 0, 0, 0, 1, 1,
-1.824435, -0.04348072, -1.799052, 0, 0, 0, 1, 1,
-1.822346, 0.3416072, -0.6602896, 0, 0, 0, 1, 1,
-1.81223, 0.7698948, -0.3748136, 0, 0, 0, 1, 1,
-1.797794, -0.6805695, -0.6813353, 0, 0, 0, 1, 1,
-1.796822, -0.5056035, -1.728568, 1, 1, 1, 1, 1,
-1.788146, -0.1472717, -2.305479, 1, 1, 1, 1, 1,
-1.77252, -0.4193856, 0.2561584, 1, 1, 1, 1, 1,
-1.768872, -0.1947069, -1.292904, 1, 1, 1, 1, 1,
-1.756709, -0.007327276, -2.825351, 1, 1, 1, 1, 1,
-1.741948, 0.6090144, -0.5490691, 1, 1, 1, 1, 1,
-1.739241, -1.218624, -2.811776, 1, 1, 1, 1, 1,
-1.698908, -0.992191, -0.9454357, 1, 1, 1, 1, 1,
-1.695094, 0.06553943, -2.085271, 1, 1, 1, 1, 1,
-1.690564, -2.465166, -3.054901, 1, 1, 1, 1, 1,
-1.687719, 0.7992236, -1.461882, 1, 1, 1, 1, 1,
-1.671538, -0.1595521, -1.045993, 1, 1, 1, 1, 1,
-1.669416, -0.4554058, -1.839497, 1, 1, 1, 1, 1,
-1.656289, 0.02421933, -0.3309347, 1, 1, 1, 1, 1,
-1.651844, 0.02175552, -1.523348, 1, 1, 1, 1, 1,
-1.641916, 0.8506902, -0.805503, 0, 0, 1, 1, 1,
-1.634668, 0.2910642, -0.1145077, 1, 0, 0, 1, 1,
-1.624675, 0.0940813, -2.039587, 1, 0, 0, 1, 1,
-1.6155, 0.0421691, -2.607901, 1, 0, 0, 1, 1,
-1.606964, 1.602241, -1.984294, 1, 0, 0, 1, 1,
-1.577711, 1.079967, -2.059918, 1, 0, 0, 1, 1,
-1.566843, 0.9944094, -1.480428, 0, 0, 0, 1, 1,
-1.558567, 1.076678, -1.488554, 0, 0, 0, 1, 1,
-1.543835, -0.02532199, -2.375068, 0, 0, 0, 1, 1,
-1.543267, 1.865155, -0.9739454, 0, 0, 0, 1, 1,
-1.533923, -1.218719, -1.939541, 0, 0, 0, 1, 1,
-1.523021, -1.081532, -0.1554785, 0, 0, 0, 1, 1,
-1.519353, -0.5785424, -1.574316, 0, 0, 0, 1, 1,
-1.508476, 0.6003702, -0.385933, 1, 1, 1, 1, 1,
-1.465666, 1.19126, -2.415629, 1, 1, 1, 1, 1,
-1.461425, 1.179394, 1.221028, 1, 1, 1, 1, 1,
-1.448306, -0.01376661, -1.80851, 1, 1, 1, 1, 1,
-1.444263, -0.8863225, -2.029392, 1, 1, 1, 1, 1,
-1.441082, -0.009338847, -1.305283, 1, 1, 1, 1, 1,
-1.439101, 2.010108, 0.2472879, 1, 1, 1, 1, 1,
-1.418696, -1.57005, -1.628972, 1, 1, 1, 1, 1,
-1.416988, 0.07324576, -1.241105, 1, 1, 1, 1, 1,
-1.410588, -1.036845, -1.970361, 1, 1, 1, 1, 1,
-1.385917, -1.098743, -1.626801, 1, 1, 1, 1, 1,
-1.376723, 1.000681, -1.271501, 1, 1, 1, 1, 1,
-1.373282, 0.5718763, -0.5799427, 1, 1, 1, 1, 1,
-1.364684, -0.8469858, -1.028242, 1, 1, 1, 1, 1,
-1.359673, 1.166074, -0.5273031, 1, 1, 1, 1, 1,
-1.342453, 0.6025149, -0.1083215, 0, 0, 1, 1, 1,
-1.338277, 1.268356, -0.0147266, 1, 0, 0, 1, 1,
-1.336782, -0.2859888, -0.4718222, 1, 0, 0, 1, 1,
-1.331271, -1.649119, -2.905249, 1, 0, 0, 1, 1,
-1.327833, -1.143619, -2.122302, 1, 0, 0, 1, 1,
-1.325486, 0.5919536, -1.032069, 1, 0, 0, 1, 1,
-1.324378, -0.01773074, -1.184078, 0, 0, 0, 1, 1,
-1.315762, -0.732491, -2.360075, 0, 0, 0, 1, 1,
-1.314223, 0.5301281, 0.5198652, 0, 0, 0, 1, 1,
-1.309258, 1.435825, -0.7819672, 0, 0, 0, 1, 1,
-1.309126, 0.3436954, -1.887333, 0, 0, 0, 1, 1,
-1.308914, 0.1800244, -1.294547, 0, 0, 0, 1, 1,
-1.307464, -0.5385051, -2.419166, 0, 0, 0, 1, 1,
-1.304697, -0.9884919, -3.15616, 1, 1, 1, 1, 1,
-1.301647, 0.02788903, -1.702647, 1, 1, 1, 1, 1,
-1.282322, 1.298442, 0.4196243, 1, 1, 1, 1, 1,
-1.281168, -1.104742, -3.845124, 1, 1, 1, 1, 1,
-1.271851, -0.1801635, -1.23386, 1, 1, 1, 1, 1,
-1.263124, -0.7583793, -2.02666, 1, 1, 1, 1, 1,
-1.239949, -0.4769898, -2.018071, 1, 1, 1, 1, 1,
-1.237159, -0.09018718, -1.263931, 1, 1, 1, 1, 1,
-1.236666, -0.2553985, -1.560246, 1, 1, 1, 1, 1,
-1.22892, 2.066257, -1.313187, 1, 1, 1, 1, 1,
-1.225478, 1.118494, -2.007298, 1, 1, 1, 1, 1,
-1.225148, 0.5653781, -0.7276633, 1, 1, 1, 1, 1,
-1.225071, 0.01408372, -0.4303864, 1, 1, 1, 1, 1,
-1.222189, 0.5520912, -0.05857064, 1, 1, 1, 1, 1,
-1.220619, -1.342446, -1.916753, 1, 1, 1, 1, 1,
-1.217623, 0.568233, -0.9388241, 0, 0, 1, 1, 1,
-1.216812, 0.6377476, -1.875677, 1, 0, 0, 1, 1,
-1.199098, -0.3918145, -1.526539, 1, 0, 0, 1, 1,
-1.19369, -0.5432509, -3.713255, 1, 0, 0, 1, 1,
-1.19174, -1.443016, -2.129445, 1, 0, 0, 1, 1,
-1.175272, -0.3823417, -1.893471, 1, 0, 0, 1, 1,
-1.174168, -0.315067, -1.665706, 0, 0, 0, 1, 1,
-1.170942, -0.08292438, -2.246975, 0, 0, 0, 1, 1,
-1.170843, 0.02850836, -1.682819, 0, 0, 0, 1, 1,
-1.169184, -1.67231, -1.898173, 0, 0, 0, 1, 1,
-1.167352, 0.5754735, -0.6678793, 0, 0, 0, 1, 1,
-1.166895, 1.639804, 0.4568533, 0, 0, 0, 1, 1,
-1.16399, -1.549464, -0.945923, 0, 0, 0, 1, 1,
-1.125056, 1.747054, -1.309074, 1, 1, 1, 1, 1,
-1.118723, 1.49363, -0.0575727, 1, 1, 1, 1, 1,
-1.116564, 2.417783, -1.814753, 1, 1, 1, 1, 1,
-1.115681, -0.7312341, -1.759455, 1, 1, 1, 1, 1,
-1.113627, -0.6237013, -1.06266, 1, 1, 1, 1, 1,
-1.109292, -0.9763607, -1.331425, 1, 1, 1, 1, 1,
-1.109025, -0.4637961, -1.858732, 1, 1, 1, 1, 1,
-1.108524, -0.1606898, -3.64058, 1, 1, 1, 1, 1,
-1.107904, -0.3077752, -1.030931, 1, 1, 1, 1, 1,
-1.102163, -0.4089436, -2.7494, 1, 1, 1, 1, 1,
-1.100909, -0.2254004, -0.8818242, 1, 1, 1, 1, 1,
-1.099959, -0.8297431, -2.191808, 1, 1, 1, 1, 1,
-1.095619, 1.605682, -0.478264, 1, 1, 1, 1, 1,
-1.094639, 1.127415, -1.012373, 1, 1, 1, 1, 1,
-1.088847, 1.552068, 0.7011679, 1, 1, 1, 1, 1,
-1.084434, 0.4550253, -0.3183165, 0, 0, 1, 1, 1,
-1.083028, 0.2104852, 0.2586435, 1, 0, 0, 1, 1,
-1.082495, 1.119876, -1.298229, 1, 0, 0, 1, 1,
-1.081264, 0.0978772, -0.8629181, 1, 0, 0, 1, 1,
-1.072308, 0.9570621, -1.694366, 1, 0, 0, 1, 1,
-1.057558, -0.6714331, -3.089693, 1, 0, 0, 1, 1,
-1.05753, -0.6683282, -2.819374, 0, 0, 0, 1, 1,
-1.056568, -0.445162, -3.32736, 0, 0, 0, 1, 1,
-1.056156, 0.6294003, -2.544972, 0, 0, 0, 1, 1,
-1.05408, 1.600894, -1.988174, 0, 0, 0, 1, 1,
-1.042039, 1.014982, -1.316483, 0, 0, 0, 1, 1,
-1.036119, 0.1370216, -1.634119, 0, 0, 0, 1, 1,
-1.028665, -0.8753514, -0.466926, 0, 0, 0, 1, 1,
-1.0129, 1.912192, -0.1435268, 1, 1, 1, 1, 1,
-1.008414, -0.3975765, -3.358363, 1, 1, 1, 1, 1,
-1.005004, -1.03702, -3.216565, 1, 1, 1, 1, 1,
-1.002178, 1.089916, -1.233685, 1, 1, 1, 1, 1,
-1.001059, -0.9041746, -4.995486, 1, 1, 1, 1, 1,
-1.000582, 0.5282261, -2.744469, 1, 1, 1, 1, 1,
-0.9964586, 0.02278093, -2.707516, 1, 1, 1, 1, 1,
-0.9943517, -1.705208, -1.844691, 1, 1, 1, 1, 1,
-0.9900566, -0.9357471, -3.479668, 1, 1, 1, 1, 1,
-0.9764947, -0.0584965, 0.2109562, 1, 1, 1, 1, 1,
-0.9754665, -0.25113, -2.965163, 1, 1, 1, 1, 1,
-0.9738852, -0.067991, -2.937452, 1, 1, 1, 1, 1,
-0.9651394, -0.6091339, -2.710235, 1, 1, 1, 1, 1,
-0.9575408, -0.2277659, -1.33453, 1, 1, 1, 1, 1,
-0.9573092, 1.074418, -2.42536, 1, 1, 1, 1, 1,
-0.9527469, -0.9385912, -1.327598, 0, 0, 1, 1, 1,
-0.952723, 0.1132078, -1.629575, 1, 0, 0, 1, 1,
-0.9526264, -0.5292023, -3.22447, 1, 0, 0, 1, 1,
-0.946467, -0.7932827, -1.767483, 1, 0, 0, 1, 1,
-0.9409822, -0.2711297, -2.36464, 1, 0, 0, 1, 1,
-0.9407194, -0.7860162, -2.395871, 1, 0, 0, 1, 1,
-0.9400311, 1.120182, 0.8142302, 0, 0, 0, 1, 1,
-0.9371891, 0.5313653, -0.9321973, 0, 0, 0, 1, 1,
-0.9333528, 1.4703, -0.7704827, 0, 0, 0, 1, 1,
-0.9294976, 2.865987, -0.2666954, 0, 0, 0, 1, 1,
-0.9262896, -0.3039824, -4.239001, 0, 0, 0, 1, 1,
-0.9235797, -0.3306179, -1.935612, 0, 0, 0, 1, 1,
-0.9209566, 1.237509, -0.6268241, 0, 0, 0, 1, 1,
-0.9134524, -0.1645665, -1.552038, 1, 1, 1, 1, 1,
-0.9071781, 1.592889, -0.6945012, 1, 1, 1, 1, 1,
-0.8994418, -0.3075448, -1.300685, 1, 1, 1, 1, 1,
-0.8986401, -1.525638, -3.558531, 1, 1, 1, 1, 1,
-0.897392, 0.9633505, -1.007262, 1, 1, 1, 1, 1,
-0.8922777, -1.209811, -2.759054, 1, 1, 1, 1, 1,
-0.891308, 1.926304, -1.752726, 1, 1, 1, 1, 1,
-0.8867232, 0.80731, -0.2700445, 1, 1, 1, 1, 1,
-0.8731343, 1.171264, -2.319839, 1, 1, 1, 1, 1,
-0.8712987, -0.3110364, -1.702827, 1, 1, 1, 1, 1,
-0.8685008, 0.5071708, 0.854145, 1, 1, 1, 1, 1,
-0.8615122, -0.6896211, -3.045534, 1, 1, 1, 1, 1,
-0.8495556, 0.4894195, -0.8799739, 1, 1, 1, 1, 1,
-0.8482462, -0.2976078, -2.265436, 1, 1, 1, 1, 1,
-0.8471588, -0.7179643, -2.325646, 1, 1, 1, 1, 1,
-0.8450946, 1.175656, -1.553508, 0, 0, 1, 1, 1,
-0.8413099, -0.1930513, -1.098569, 1, 0, 0, 1, 1,
-0.8393934, -0.3318899, -2.318714, 1, 0, 0, 1, 1,
-0.8336504, 0.2814221, -1.333802, 1, 0, 0, 1, 1,
-0.8270009, 0.9744011, -1.475383, 1, 0, 0, 1, 1,
-0.8233315, -0.9021924, -2.057528, 1, 0, 0, 1, 1,
-0.8043401, -0.7445955, -1.846234, 0, 0, 0, 1, 1,
-0.8033818, -0.1389257, -0.3468451, 0, 0, 0, 1, 1,
-0.8026421, -0.7356485, -2.952502, 0, 0, 0, 1, 1,
-0.7999259, 1.619215, 0.2305767, 0, 0, 0, 1, 1,
-0.7998315, -1.072298, -4.360965, 0, 0, 0, 1, 1,
-0.7987663, 1.429001, 0.4952133, 0, 0, 0, 1, 1,
-0.7950242, 0.6116816, -1.403283, 0, 0, 0, 1, 1,
-0.7886766, 0.7314364, -0.4937322, 1, 1, 1, 1, 1,
-0.7839493, 0.9465469, -2.156755, 1, 1, 1, 1, 1,
-0.7764791, 1.221596, -1.122613, 1, 1, 1, 1, 1,
-0.7708858, 3.024605, -1.918187, 1, 1, 1, 1, 1,
-0.7602994, 0.1275834, -1.548273, 1, 1, 1, 1, 1,
-0.7585899, -0.2370939, -2.027249, 1, 1, 1, 1, 1,
-0.7541025, 0.1058604, 0.05264989, 1, 1, 1, 1, 1,
-0.7516456, 0.140875, -1.265638, 1, 1, 1, 1, 1,
-0.7516382, -4.069369, -3.345028, 1, 1, 1, 1, 1,
-0.7500846, 1.533008, -1.657211, 1, 1, 1, 1, 1,
-0.7497247, 0.8115406, -1.033617, 1, 1, 1, 1, 1,
-0.7440351, -0.02785877, -1.166866, 1, 1, 1, 1, 1,
-0.7436236, -0.4592332, -1.579354, 1, 1, 1, 1, 1,
-0.7434896, -0.6046879, -3.349742, 1, 1, 1, 1, 1,
-0.731823, -0.3495228, -3.540831, 1, 1, 1, 1, 1,
-0.7316089, -0.6533723, -3.870076, 0, 0, 1, 1, 1,
-0.7311335, 1.810659, -1.408304, 1, 0, 0, 1, 1,
-0.7287259, -1.182156, -0.9430787, 1, 0, 0, 1, 1,
-0.7283735, -0.263243, -1.645726, 1, 0, 0, 1, 1,
-0.7228144, -0.4216816, -2.946292, 1, 0, 0, 1, 1,
-0.7185866, 0.2558821, -0.878617, 1, 0, 0, 1, 1,
-0.718123, -0.01687954, 0.2580245, 0, 0, 0, 1, 1,
-0.7179465, -1.520415, -2.582932, 0, 0, 0, 1, 1,
-0.7175837, 0.3268386, 0.3264508, 0, 0, 0, 1, 1,
-0.7130438, -0.2331313, -2.070272, 0, 0, 0, 1, 1,
-0.7049343, 1.184285, -0.2310362, 0, 0, 0, 1, 1,
-0.7024528, -0.185834, -2.116323, 0, 0, 0, 1, 1,
-0.6973184, -1.170461, -1.182085, 0, 0, 0, 1, 1,
-0.6959628, -0.3171042, -1.416665, 1, 1, 1, 1, 1,
-0.6918054, 0.9463987, -0.6782238, 1, 1, 1, 1, 1,
-0.6808571, -0.04562255, -2.35381, 1, 1, 1, 1, 1,
-0.6791227, 1.222057, -0.3944871, 1, 1, 1, 1, 1,
-0.6735775, 0.1863431, -1.085745, 1, 1, 1, 1, 1,
-0.6684487, -0.6756192, -3.122221, 1, 1, 1, 1, 1,
-0.656803, -0.2001695, -1.978963, 1, 1, 1, 1, 1,
-0.6501923, 0.01748367, -1.953768, 1, 1, 1, 1, 1,
-0.6441495, -1.516322, -2.501456, 1, 1, 1, 1, 1,
-0.6419174, 0.1519206, -0.2339515, 1, 1, 1, 1, 1,
-0.6375915, 0.4899675, -0.2098553, 1, 1, 1, 1, 1,
-0.6362761, -1.199807, -1.399223, 1, 1, 1, 1, 1,
-0.6347443, 0.1574714, -2.119564, 1, 1, 1, 1, 1,
-0.6311341, -1.535201, -3.051861, 1, 1, 1, 1, 1,
-0.6216559, 0.6107864, -2.215125, 1, 1, 1, 1, 1,
-0.6206213, 0.3075559, -1.102973, 0, 0, 1, 1, 1,
-0.6183096, 0.03020609, -1.429343, 1, 0, 0, 1, 1,
-0.6142269, 0.7727298, -0.3571337, 1, 0, 0, 1, 1,
-0.6135761, 1.057905, -2.946796, 1, 0, 0, 1, 1,
-0.6127528, 0.635382, -1.394611, 1, 0, 0, 1, 1,
-0.612318, 1.526528, 0.9398239, 1, 0, 0, 1, 1,
-0.6049255, -0.9137707, -0.3116148, 0, 0, 0, 1, 1,
-0.6048732, -0.9145388, -2.106011, 0, 0, 0, 1, 1,
-0.603789, -0.7317322, -2.96311, 0, 0, 0, 1, 1,
-0.6027797, -0.01664717, -1.649301, 0, 0, 0, 1, 1,
-0.6014095, 0.2100952, -1.023648, 0, 0, 0, 1, 1,
-0.5994649, 0.8027111, -1.273274, 0, 0, 0, 1, 1,
-0.5968521, -0.3645665, -4.204428, 0, 0, 0, 1, 1,
-0.5958791, 1.719983, -1.31191, 1, 1, 1, 1, 1,
-0.5933237, 0.6078803, 0.493258, 1, 1, 1, 1, 1,
-0.5920546, -0.9515622, -3.333148, 1, 1, 1, 1, 1,
-0.5890731, -0.7037952, -1.673611, 1, 1, 1, 1, 1,
-0.5864061, -1.494667, -3.495559, 1, 1, 1, 1, 1,
-0.5808228, 0.5977204, -0.09719954, 1, 1, 1, 1, 1,
-0.5752081, -0.2211337, -1.828423, 1, 1, 1, 1, 1,
-0.5746535, 0.3461944, -1.239647, 1, 1, 1, 1, 1,
-0.5702489, -0.4438849, -2.22432, 1, 1, 1, 1, 1,
-0.5679775, -0.1287236, -3.064684, 1, 1, 1, 1, 1,
-0.5641215, -1.161533, -1.238658, 1, 1, 1, 1, 1,
-0.5600255, -0.4102343, -2.740919, 1, 1, 1, 1, 1,
-0.5569952, -0.2619109, -2.569935, 1, 1, 1, 1, 1,
-0.5519371, -0.4037493, -3.741388, 1, 1, 1, 1, 1,
-0.551114, 0.7372524, 1.66677, 1, 1, 1, 1, 1,
-0.5487157, -1.171665, -3.284492, 0, 0, 1, 1, 1,
-0.548042, 1.598943, 1.060488, 1, 0, 0, 1, 1,
-0.5469946, -0.8401254, -1.536912, 1, 0, 0, 1, 1,
-0.5457345, -0.09209669, -1.693637, 1, 0, 0, 1, 1,
-0.5354518, 1.241468, -0.08641626, 1, 0, 0, 1, 1,
-0.5342653, -0.2587014, -1.775365, 1, 0, 0, 1, 1,
-0.5321879, -1.878964, -1.692447, 0, 0, 0, 1, 1,
-0.5264966, -2.369925, -3.795524, 0, 0, 0, 1, 1,
-0.5261098, 0.6598797, -0.4196579, 0, 0, 0, 1, 1,
-0.5227552, 0.7422705, -0.4169037, 0, 0, 0, 1, 1,
-0.5221472, -0.4502381, -1.546412, 0, 0, 0, 1, 1,
-0.5175666, -1.787084, -3.292017, 0, 0, 0, 1, 1,
-0.5140767, 1.228997, 0.008158804, 0, 0, 0, 1, 1,
-0.5121485, 0.733215, -0.08810265, 1, 1, 1, 1, 1,
-0.5119023, 0.4971777, -0.7831005, 1, 1, 1, 1, 1,
-0.5087811, 1.197777, -0.8913074, 1, 1, 1, 1, 1,
-0.5080956, 0.0551872, -1.045818, 1, 1, 1, 1, 1,
-0.5060108, -0.420765, -2.085424, 1, 1, 1, 1, 1,
-0.5049179, 0.8399605, -1.561602, 1, 1, 1, 1, 1,
-0.5039226, -0.437234, -4.204883, 1, 1, 1, 1, 1,
-0.5038573, -0.6787626, -4.924074, 1, 1, 1, 1, 1,
-0.501489, -0.1653262, -1.226362, 1, 1, 1, 1, 1,
-0.4995549, -1.130978, -2.511158, 1, 1, 1, 1, 1,
-0.4964599, 0.05631708, -1.369848, 1, 1, 1, 1, 1,
-0.4955401, -0.2456294, -1.254812, 1, 1, 1, 1, 1,
-0.4942837, 0.1716454, -0.740861, 1, 1, 1, 1, 1,
-0.4940014, -1.377666, -2.953661, 1, 1, 1, 1, 1,
-0.4938001, 0.1233764, -0.9123189, 1, 1, 1, 1, 1,
-0.4926883, -0.2071294, -1.330385, 0, 0, 1, 1, 1,
-0.4921567, 0.06806833, -0.4799381, 1, 0, 0, 1, 1,
-0.4917565, -0.8028129, -2.31845, 1, 0, 0, 1, 1,
-0.4866075, -0.6269054, -2.809474, 1, 0, 0, 1, 1,
-0.4665495, 0.7635198, -0.9712249, 1, 0, 0, 1, 1,
-0.4553418, 0.7834409, 2.298599, 1, 0, 0, 1, 1,
-0.4532023, 0.2436019, -0.2884783, 0, 0, 0, 1, 1,
-0.452565, 0.3107144, 0.5089607, 0, 0, 0, 1, 1,
-0.448449, -0.5790909, -2.543823, 0, 0, 0, 1, 1,
-0.4427298, -0.7427575, -1.698195, 0, 0, 0, 1, 1,
-0.4419278, -2.229113, -3.193, 0, 0, 0, 1, 1,
-0.4409105, 0.4894704, -0.4610426, 0, 0, 0, 1, 1,
-0.4323947, -0.05214269, -1.440434, 0, 0, 0, 1, 1,
-0.4308671, -1.705433, -3.588156, 1, 1, 1, 1, 1,
-0.4303632, -0.2121293, -0.9703085, 1, 1, 1, 1, 1,
-0.4285548, 2.023916, -0.1768814, 1, 1, 1, 1, 1,
-0.4252567, -0.01270826, -0.8070465, 1, 1, 1, 1, 1,
-0.4219319, -1.140848, -2.7773, 1, 1, 1, 1, 1,
-0.4173634, 0.5770679, -0.09441394, 1, 1, 1, 1, 1,
-0.4157247, -0.01937784, -0.43147, 1, 1, 1, 1, 1,
-0.4143556, -0.1137863, -3.16017, 1, 1, 1, 1, 1,
-0.4137647, -1.069242, -2.837561, 1, 1, 1, 1, 1,
-0.4137461, -0.7156699, -2.927438, 1, 1, 1, 1, 1,
-0.4109564, 0.1627525, -0.9557119, 1, 1, 1, 1, 1,
-0.4074511, -0.01053341, -1.568402, 1, 1, 1, 1, 1,
-0.4073614, -1.020016, -2.118151, 1, 1, 1, 1, 1,
-0.4037475, 1.511833, -0.1485807, 1, 1, 1, 1, 1,
-0.4031233, 3.472806, 0.4532171, 1, 1, 1, 1, 1,
-0.3984676, -2.237708, -2.233818, 0, 0, 1, 1, 1,
-0.396309, 0.143759, -2.022766, 1, 0, 0, 1, 1,
-0.3960005, -2.380552, -4.402004, 1, 0, 0, 1, 1,
-0.3958057, -0.4073242, -2.745611, 1, 0, 0, 1, 1,
-0.393606, -2.792745, -2.488844, 1, 0, 0, 1, 1,
-0.3852999, -0.4220523, -1.703287, 1, 0, 0, 1, 1,
-0.3843111, 0.3345702, 0.07340435, 0, 0, 0, 1, 1,
-0.3841731, 0.9740993, -1.198731, 0, 0, 0, 1, 1,
-0.3836423, 0.5014613, -1.067089, 0, 0, 0, 1, 1,
-0.3792504, 0.4029121, 0.5979041, 0, 0, 0, 1, 1,
-0.3784657, -2.214889, -2.724784, 0, 0, 0, 1, 1,
-0.3764087, -0.3429737, -3.366843, 0, 0, 0, 1, 1,
-0.3763122, 1.753214, 0.1456199, 0, 0, 0, 1, 1,
-0.3758356, -1.777321, -3.095843, 1, 1, 1, 1, 1,
-0.3755988, -0.2759297, -2.096399, 1, 1, 1, 1, 1,
-0.373618, -0.8238036, -2.146775, 1, 1, 1, 1, 1,
-0.3730379, -0.3065309, -0.4868892, 1, 1, 1, 1, 1,
-0.3712843, 0.2082135, -3.380624, 1, 1, 1, 1, 1,
-0.3669417, -0.3877003, -2.084385, 1, 1, 1, 1, 1,
-0.363149, 1.178905, -1.244976, 1, 1, 1, 1, 1,
-0.3600134, 0.4653615, -0.5516728, 1, 1, 1, 1, 1,
-0.359992, 1.413914, 0.9156083, 1, 1, 1, 1, 1,
-0.3581216, 1.987726, -1.723541, 1, 1, 1, 1, 1,
-0.3553698, -0.2360173, -3.178016, 1, 1, 1, 1, 1,
-0.354034, 0.7849666, -0.04748811, 1, 1, 1, 1, 1,
-0.3523021, -3.021962, -2.076583, 1, 1, 1, 1, 1,
-0.3505728, -0.5581382, -1.268596, 1, 1, 1, 1, 1,
-0.3502493, 1.245014, -1.46417, 1, 1, 1, 1, 1,
-0.3446302, 0.1204433, -2.064574, 0, 0, 1, 1, 1,
-0.3438238, -0.4885798, -4.037682, 1, 0, 0, 1, 1,
-0.3433965, 0.4763532, -0.9617701, 1, 0, 0, 1, 1,
-0.3415697, -0.4265802, -2.063186, 1, 0, 0, 1, 1,
-0.3384906, 1.429491, 0.4298317, 1, 0, 0, 1, 1,
-0.3361544, -0.4264976, -1.938385, 1, 0, 0, 1, 1,
-0.3334733, -1.413502, -3.222023, 0, 0, 0, 1, 1,
-0.3259018, -0.3453138, -1.430898, 0, 0, 0, 1, 1,
-0.3256788, 0.07862993, -0.410272, 0, 0, 0, 1, 1,
-0.3252079, 0.3339385, -1.014872, 0, 0, 0, 1, 1,
-0.3229925, -1.53052, -0.003001605, 0, 0, 0, 1, 1,
-0.3223074, 0.7716331, -1.724549, 0, 0, 0, 1, 1,
-0.3188067, 0.5757011, 0.003497811, 0, 0, 0, 1, 1,
-0.3166771, 0.3077132, -0.03976525, 1, 1, 1, 1, 1,
-0.316537, 0.03943565, -1.41391, 1, 1, 1, 1, 1,
-0.3115339, 1.909496, 0.3658637, 1, 1, 1, 1, 1,
-0.3106351, -1.368512, -3.243026, 1, 1, 1, 1, 1,
-0.3101941, -1.970191, -4.104567, 1, 1, 1, 1, 1,
-0.309993, 1.172654, -1.398844, 1, 1, 1, 1, 1,
-0.3062589, -2.658554, -1.978022, 1, 1, 1, 1, 1,
-0.305424, -0.9342178, 0.04703233, 1, 1, 1, 1, 1,
-0.3029404, 0.2326846, -1.699008, 1, 1, 1, 1, 1,
-0.3024353, 0.9645783, 0.6720446, 1, 1, 1, 1, 1,
-0.299776, 1.39344, 0.1142626, 1, 1, 1, 1, 1,
-0.299355, -0.7370961, -3.343394, 1, 1, 1, 1, 1,
-0.2981002, -0.1382217, -1.492335, 1, 1, 1, 1, 1,
-0.2967221, 0.3067336, -0.4897448, 1, 1, 1, 1, 1,
-0.2939346, -0.6109853, -1.309578, 1, 1, 1, 1, 1,
-0.2926236, 1.035153, 0.9905765, 0, 0, 1, 1, 1,
-0.2904016, 0.7223715, -0.9926884, 1, 0, 0, 1, 1,
-0.2804014, 0.7173939, -1.267269, 1, 0, 0, 1, 1,
-0.2749832, -0.2878132, -2.205669, 1, 0, 0, 1, 1,
-0.2749544, 0.1846604, -1.55425, 1, 0, 0, 1, 1,
-0.2747139, 0.1369033, -2.354659, 1, 0, 0, 1, 1,
-0.2726548, 0.4171711, -1.753256, 0, 0, 0, 1, 1,
-0.2725627, -1.108716, -2.181978, 0, 0, 0, 1, 1,
-0.2723381, -1.85514, -3.21323, 0, 0, 0, 1, 1,
-0.2715106, 0.2917505, -1.228982, 0, 0, 0, 1, 1,
-0.2711009, 0.9183933, -0.1269995, 0, 0, 0, 1, 1,
-0.2597885, -0.3405338, -3.270901, 0, 0, 0, 1, 1,
-0.2578197, -0.2167953, -3.139436, 0, 0, 0, 1, 1,
-0.254787, 0.534193, -0.04841232, 1, 1, 1, 1, 1,
-0.2528511, -0.7358693, -3.493265, 1, 1, 1, 1, 1,
-0.2502626, 0.1604948, -0.3177829, 1, 1, 1, 1, 1,
-0.2493511, 0.1560393, -2.192801, 1, 1, 1, 1, 1,
-0.248414, 0.3221217, 0.2326105, 1, 1, 1, 1, 1,
-0.2480976, 0.1458453, -0.5101001, 1, 1, 1, 1, 1,
-0.2418714, -0.1260947, -2.705749, 1, 1, 1, 1, 1,
-0.2414694, 0.5930459, 0.1045055, 1, 1, 1, 1, 1,
-0.2401965, 0.6573314, -0.8756349, 1, 1, 1, 1, 1,
-0.2397926, 0.1241275, -0.6772196, 1, 1, 1, 1, 1,
-0.2354968, -0.08509972, -2.891883, 1, 1, 1, 1, 1,
-0.2328666, -1.501862, -3.29406, 1, 1, 1, 1, 1,
-0.2273537, 2.175946, 0.3858691, 1, 1, 1, 1, 1,
-0.2234837, 0.7292565, 0.03205921, 1, 1, 1, 1, 1,
-0.2232223, 2.676906, -0.6203906, 1, 1, 1, 1, 1,
-0.2165597, -0.2510423, -3.579102, 0, 0, 1, 1, 1,
-0.2133221, -0.07289896, -2.961236, 1, 0, 0, 1, 1,
-0.2126597, 0.06518786, -2.387483, 1, 0, 0, 1, 1,
-0.2095449, -0.37948, -1.891038, 1, 0, 0, 1, 1,
-0.209201, -1.442668, -3.32794, 1, 0, 0, 1, 1,
-0.2081986, -1.384003, -3.474529, 1, 0, 0, 1, 1,
-0.2071109, 1.66003, -1.158081, 0, 0, 0, 1, 1,
-0.2035335, -1.355355, -3.579831, 0, 0, 0, 1, 1,
-0.2007402, 1.310698, 1.206014, 0, 0, 0, 1, 1,
-0.1993449, -0.2054664, -2.703207, 0, 0, 0, 1, 1,
-0.1897754, 0.09881753, -1.141514, 0, 0, 0, 1, 1,
-0.1870814, 0.4273621, -0.5846718, 0, 0, 0, 1, 1,
-0.1869892, 1.939249, -0.03432036, 0, 0, 0, 1, 1,
-0.1855201, 0.005945278, -1.92162, 1, 1, 1, 1, 1,
-0.1832768, 0.8294326, -0.119522, 1, 1, 1, 1, 1,
-0.1789715, 0.8440215, -0.1115241, 1, 1, 1, 1, 1,
-0.178783, 0.2531227, 0.1153488, 1, 1, 1, 1, 1,
-0.1760591, 1.177067, -0.1656457, 1, 1, 1, 1, 1,
-0.1722181, 2.201822, 0.5359905, 1, 1, 1, 1, 1,
-0.1708775, 1.659969, -0.7837065, 1, 1, 1, 1, 1,
-0.1703874, -1.535861, -3.256516, 1, 1, 1, 1, 1,
-0.1693306, -2.308468, -2.973566, 1, 1, 1, 1, 1,
-0.1667776, -0.7410177, -5.002038, 1, 1, 1, 1, 1,
-0.1661258, -1.399426, -0.7092804, 1, 1, 1, 1, 1,
-0.1611418, -0.1041446, -2.030653, 1, 1, 1, 1, 1,
-0.1608172, 0.09592887, -2.343994, 1, 1, 1, 1, 1,
-0.1607192, 1.026874, -1.006055, 1, 1, 1, 1, 1,
-0.1600056, -0.6326783, -3.011338, 1, 1, 1, 1, 1,
-0.1596381, 0.1064575, -1.582223, 0, 0, 1, 1, 1,
-0.1558366, -0.2925892, -3.487965, 1, 0, 0, 1, 1,
-0.1553454, 0.1792983, 1.164628, 1, 0, 0, 1, 1,
-0.1535388, 0.3058747, 0.3093242, 1, 0, 0, 1, 1,
-0.1512733, -0.678178, -2.111992, 1, 0, 0, 1, 1,
-0.1482476, -0.5835967, -2.271952, 1, 0, 0, 1, 1,
-0.1431331, -1.076174, -2.715557, 0, 0, 0, 1, 1,
-0.1410806, 0.8664235, -0.1474082, 0, 0, 0, 1, 1,
-0.1409166, -0.2435569, -2.74121, 0, 0, 0, 1, 1,
-0.1408918, -0.1818295, -3.133168, 0, 0, 0, 1, 1,
-0.138401, 0.02745324, -1.107476, 0, 0, 0, 1, 1,
-0.1374792, 0.802206, -0.2185521, 0, 0, 0, 1, 1,
-0.1358372, -0.1470918, -2.976325, 0, 0, 0, 1, 1,
-0.1326219, -0.7086171, -2.20763, 1, 1, 1, 1, 1,
-0.1318504, 0.6725174, 0.05220369, 1, 1, 1, 1, 1,
-0.1314188, 0.6513426, 1.78848, 1, 1, 1, 1, 1,
-0.1311473, -0.1362545, -1.477512, 1, 1, 1, 1, 1,
-0.1294467, -0.7568538, -4.044899, 1, 1, 1, 1, 1,
-0.1233806, -0.7529086, -0.4427266, 1, 1, 1, 1, 1,
-0.1232858, -0.257978, -2.442513, 1, 1, 1, 1, 1,
-0.1216442, -1.61933, -5.461137, 1, 1, 1, 1, 1,
-0.1211821, 0.6927382, -0.5887081, 1, 1, 1, 1, 1,
-0.1158488, 0.1285681, -1.8469, 1, 1, 1, 1, 1,
-0.1134143, 1.180792, 0.5225745, 1, 1, 1, 1, 1,
-0.1131948, -0.5867706, -4.108409, 1, 1, 1, 1, 1,
-0.1123707, -0.1611789, -2.24911, 1, 1, 1, 1, 1,
-0.1122426, -1.120364, -2.585495, 1, 1, 1, 1, 1,
-0.104587, 0.7568326, 1.334365, 1, 1, 1, 1, 1,
-0.1044392, -0.5631978, -2.507803, 0, 0, 1, 1, 1,
-0.1034185, -2.149504, -2.466222, 1, 0, 0, 1, 1,
-0.1032049, 0.02958765, -0.3046515, 1, 0, 0, 1, 1,
-0.1009114, -1.627496, -2.818867, 1, 0, 0, 1, 1,
-0.0977389, 0.5011035, -1.060695, 1, 0, 0, 1, 1,
-0.09355816, 0.9074343, -0.4950197, 1, 0, 0, 1, 1,
-0.08582351, -0.7738481, -3.320651, 0, 0, 0, 1, 1,
-0.07516859, -1.2902, -3.668625, 0, 0, 0, 1, 1,
-0.07048526, -0.1173125, -3.107512, 0, 0, 0, 1, 1,
-0.06331792, 0.1935635, 1.216231, 0, 0, 0, 1, 1,
-0.06014823, -0.8312577, -1.867469, 0, 0, 0, 1, 1,
-0.0588662, 0.7248496, 0.5161605, 0, 0, 0, 1, 1,
-0.05207443, 0.4714071, -0.4419984, 0, 0, 0, 1, 1,
-0.04854858, -0.8881013, -3.226411, 1, 1, 1, 1, 1,
-0.04782508, -0.1636948, -1.227273, 1, 1, 1, 1, 1,
-0.04627683, 0.4361086, -0.1831616, 1, 1, 1, 1, 1,
-0.04465842, 0.03490961, 1.246146, 1, 1, 1, 1, 1,
-0.04207672, -0.05203253, -2.878584, 1, 1, 1, 1, 1,
-0.04152219, -0.2709667, -4.442576, 1, 1, 1, 1, 1,
-0.03953718, -0.266427, -3.326409, 1, 1, 1, 1, 1,
-0.03824474, 0.8432336, -0.6768542, 1, 1, 1, 1, 1,
-0.03549311, -0.7786555, -2.179336, 1, 1, 1, 1, 1,
-0.02703895, 0.2982387, -0.6258875, 1, 1, 1, 1, 1,
-0.02541703, 1.072692, -0.9513635, 1, 1, 1, 1, 1,
-0.02434076, -0.1309754, -4.210624, 1, 1, 1, 1, 1,
-0.02242801, 0.1021848, -0.4023428, 1, 1, 1, 1, 1,
-0.02048045, -0.4385241, -2.752705, 1, 1, 1, 1, 1,
-0.01830207, 0.2400464, -1.210833, 1, 1, 1, 1, 1,
-0.01737125, -0.8134509, -5.50064, 0, 0, 1, 1, 1,
-0.01675749, 0.8056558, 1.809715, 1, 0, 0, 1, 1,
-0.01584965, 0.1187796, 0.1762197, 1, 0, 0, 1, 1,
-0.01577098, 0.1943143, -0.2030887, 1, 0, 0, 1, 1,
-0.01576933, -0.09636371, -2.147494, 1, 0, 0, 1, 1,
-0.01439549, 0.2898032, -1.818102, 1, 0, 0, 1, 1,
-0.011735, -0.6907838, -2.978006, 0, 0, 0, 1, 1,
-0.01080599, 0.2565486, 0.9740471, 0, 0, 0, 1, 1,
-0.009088289, -1.443846, -2.513699, 0, 0, 0, 1, 1,
-0.005347372, 0.04057549, 1.155709, 0, 0, 0, 1, 1,
-0.004642799, 1.42368, 0.6412364, 0, 0, 0, 1, 1,
-1.289568e-05, -0.5482881, -1.767566, 0, 0, 0, 1, 1,
0.002868089, 0.1220143, 0.90236, 0, 0, 0, 1, 1,
0.003131763, -0.5141542, 3.484171, 1, 1, 1, 1, 1,
0.01473955, 0.5606719, -0.3321154, 1, 1, 1, 1, 1,
0.01561129, 1.394059, -0.4944317, 1, 1, 1, 1, 1,
0.01612178, -0.06054633, 1.889938, 1, 1, 1, 1, 1,
0.01745076, 0.5078207, 0.425768, 1, 1, 1, 1, 1,
0.01955364, -0.9160689, 3.93681, 1, 1, 1, 1, 1,
0.01991069, 0.1801582, 0.5053095, 1, 1, 1, 1, 1,
0.02528014, -0.7405525, 3.689448, 1, 1, 1, 1, 1,
0.02555313, -0.9684792, 3.560547, 1, 1, 1, 1, 1,
0.02590215, 0.9438938, 0.5844285, 1, 1, 1, 1, 1,
0.02676962, -0.5545111, 2.347521, 1, 1, 1, 1, 1,
0.02716902, -2.026455, 1.893902, 1, 1, 1, 1, 1,
0.02880728, -1.588528, 2.651146, 1, 1, 1, 1, 1,
0.02974175, -0.1768119, 3.139669, 1, 1, 1, 1, 1,
0.03296012, -0.4760815, 2.354689, 1, 1, 1, 1, 1,
0.03762607, -0.8709646, 1.141311, 0, 0, 1, 1, 1,
0.03899674, 0.5678791, 2.578161, 1, 0, 0, 1, 1,
0.03964568, 1.189978, -0.4922049, 1, 0, 0, 1, 1,
0.04026414, 1.527138, 0.242653, 1, 0, 0, 1, 1,
0.04246915, -0.5627349, 4.656976, 1, 0, 0, 1, 1,
0.04757339, 2.5459, 2.309788, 1, 0, 0, 1, 1,
0.04972966, -0.3032646, 3.744602, 0, 0, 0, 1, 1,
0.05493382, 0.02107022, 2.01723, 0, 0, 0, 1, 1,
0.05616195, -0.2718835, 3.905912, 0, 0, 0, 1, 1,
0.05638371, 1.318335, 1.563825, 0, 0, 0, 1, 1,
0.06141827, -0.008140605, 2.184425, 0, 0, 0, 1, 1,
0.06260853, -0.4982032, 3.331338, 0, 0, 0, 1, 1,
0.06438554, 1.908544, 0.877694, 0, 0, 0, 1, 1,
0.06551065, -0.4475127, 3.430139, 1, 1, 1, 1, 1,
0.06789021, -0.5031707, 2.105101, 1, 1, 1, 1, 1,
0.07013299, -0.5638102, 3.393298, 1, 1, 1, 1, 1,
0.07142743, -0.504401, 3.03529, 1, 1, 1, 1, 1,
0.07377987, 1.265189, 2.346384, 1, 1, 1, 1, 1,
0.07455275, -0.06631105, 1.860307, 1, 1, 1, 1, 1,
0.07903244, -0.2902471, 3.675839, 1, 1, 1, 1, 1,
0.079418, -1.529964, 3.015747, 1, 1, 1, 1, 1,
0.0870558, 1.350283, -0.2509321, 1, 1, 1, 1, 1,
0.09791707, -0.1841589, 2.947161, 1, 1, 1, 1, 1,
0.0999295, 0.5124025, -0.7662796, 1, 1, 1, 1, 1,
0.1008748, -0.9086865, 2.333933, 1, 1, 1, 1, 1,
0.1022742, -1.479791, 4.138819, 1, 1, 1, 1, 1,
0.1079063, 0.8734107, 1.357085, 1, 1, 1, 1, 1,
0.1147923, 0.1619938, 0.3599272, 1, 1, 1, 1, 1,
0.1156803, 0.0009098204, 2.160984, 0, 0, 1, 1, 1,
0.1183095, -1.646667, 4.720562, 1, 0, 0, 1, 1,
0.1260422, 0.4992286, 1.425941, 1, 0, 0, 1, 1,
0.1444432, -0.4426827, 3.767811, 1, 0, 0, 1, 1,
0.1460853, -2.520799, 2.184273, 1, 0, 0, 1, 1,
0.1470501, 0.4774291, -0.3917607, 1, 0, 0, 1, 1,
0.1494198, 0.09101286, -0.8829192, 0, 0, 0, 1, 1,
0.1503089, 2.117222, 1.787576, 0, 0, 0, 1, 1,
0.1529665, -0.865844, 2.706455, 0, 0, 0, 1, 1,
0.1585992, -0.4666781, 3.500902, 0, 0, 0, 1, 1,
0.1678497, -0.8826268, 1.610505, 0, 0, 0, 1, 1,
0.1690223, 0.08311708, -1.532615, 0, 0, 0, 1, 1,
0.1691288, 0.08223297, 1.581845, 0, 0, 0, 1, 1,
0.1717898, -1.168909, 3.626163, 1, 1, 1, 1, 1,
0.1739266, -0.1995113, 2.588466, 1, 1, 1, 1, 1,
0.1751165, 0.7072104, 1.091968, 1, 1, 1, 1, 1,
0.1858532, 0.9861436, 0.5074978, 1, 1, 1, 1, 1,
0.1868218, 0.1080431, 1.596586, 1, 1, 1, 1, 1,
0.1890015, -0.5312096, 3.11593, 1, 1, 1, 1, 1,
0.1894003, 1.040456, 2.527624, 1, 1, 1, 1, 1,
0.1898571, -0.7025812, 1.96003, 1, 1, 1, 1, 1,
0.1917253, 1.01436, -0.1715321, 1, 1, 1, 1, 1,
0.1923175, -1.003358, 2.443344, 1, 1, 1, 1, 1,
0.1938084, 0.9150172, -0.9206654, 1, 1, 1, 1, 1,
0.1977025, -0.9385493, 2.971209, 1, 1, 1, 1, 1,
0.1985645, -1.766334, 2.756609, 1, 1, 1, 1, 1,
0.2001671, -0.004278024, 1.409219, 1, 1, 1, 1, 1,
0.2028214, -0.0194287, 0.2093759, 1, 1, 1, 1, 1,
0.2071706, 1.191798, -0.8551003, 0, 0, 1, 1, 1,
0.2099687, 0.1296635, 2.202379, 1, 0, 0, 1, 1,
0.2114483, -1.596187, 3.152194, 1, 0, 0, 1, 1,
0.2115037, 0.498787, 0.5968207, 1, 0, 0, 1, 1,
0.2126218, -0.4118952, 2.542694, 1, 0, 0, 1, 1,
0.2144824, -0.8655041, 2.272499, 1, 0, 0, 1, 1,
0.2151549, -0.9600793, 2.263559, 0, 0, 0, 1, 1,
0.2161557, 2.783998, -0.2637828, 0, 0, 0, 1, 1,
0.2203622, 1.205261, -0.4567665, 0, 0, 0, 1, 1,
0.2210615, 1.238613, 0.6928928, 0, 0, 0, 1, 1,
0.2235507, 0.9494971, -0.9456867, 0, 0, 0, 1, 1,
0.2303287, 0.1322448, 2.805383, 0, 0, 0, 1, 1,
0.2332876, 0.898355, -0.573511, 0, 0, 0, 1, 1,
0.2352596, -0.3629347, 3.384978, 1, 1, 1, 1, 1,
0.2361311, -0.24148, 1.806052, 1, 1, 1, 1, 1,
0.2416327, 0.5777166, -1.079227, 1, 1, 1, 1, 1,
0.244562, 1.893531, 0.01152931, 1, 1, 1, 1, 1,
0.246762, -1.675272, 3.360536, 1, 1, 1, 1, 1,
0.2492708, -1.278209, 1.668889, 1, 1, 1, 1, 1,
0.2499315, -0.1840792, 2.013557, 1, 1, 1, 1, 1,
0.2503708, -0.3534722, 0.4304998, 1, 1, 1, 1, 1,
0.2542281, -2.021669, 3.599111, 1, 1, 1, 1, 1,
0.2549236, 0.8220901, -0.8213305, 1, 1, 1, 1, 1,
0.255018, 1.395313, -0.2222689, 1, 1, 1, 1, 1,
0.2575323, 2.297168, -0.5837879, 1, 1, 1, 1, 1,
0.2575496, -0.09950624, 3.086641, 1, 1, 1, 1, 1,
0.2594416, 0.8799973, 1.532865, 1, 1, 1, 1, 1,
0.260534, -0.3434111, 2.56329, 1, 1, 1, 1, 1,
0.2632977, -0.440888, 1.743683, 0, 0, 1, 1, 1,
0.2633648, -1.387863, 3.634181, 1, 0, 0, 1, 1,
0.2634118, 0.6871613, 0.09462588, 1, 0, 0, 1, 1,
0.2663186, 1.29543, 1.279737, 1, 0, 0, 1, 1,
0.2700015, -1.160692, -0.1468609, 1, 0, 0, 1, 1,
0.2728249, 0.424267, -0.1191153, 1, 0, 0, 1, 1,
0.2748188, -0.8738703, 2.986859, 0, 0, 0, 1, 1,
0.275007, 1.651009, 1.010642, 0, 0, 0, 1, 1,
0.2753419, -0.02648478, 1.441072, 0, 0, 0, 1, 1,
0.2764787, 0.3180785, 1.420369, 0, 0, 0, 1, 1,
0.2795993, 1.142991, -0.1661696, 0, 0, 0, 1, 1,
0.2821553, -0.06658555, 1.613601, 0, 0, 0, 1, 1,
0.2833775, -1.197216, 2.086629, 0, 0, 0, 1, 1,
0.2851086, 2.177412, 0.726798, 1, 1, 1, 1, 1,
0.2859793, -0.4152124, 3.699889, 1, 1, 1, 1, 1,
0.2860094, -0.05168059, 1.034024, 1, 1, 1, 1, 1,
0.2879852, 0.7223467, 2.332258, 1, 1, 1, 1, 1,
0.2893319, 1.566649, -1.48331, 1, 1, 1, 1, 1,
0.2936537, 0.7557345, 1.963726, 1, 1, 1, 1, 1,
0.2981932, -0.5263785, 1.347247, 1, 1, 1, 1, 1,
0.2995137, -0.6135796, 2.300154, 1, 1, 1, 1, 1,
0.3053698, 1.326219, -1.538373, 1, 1, 1, 1, 1,
0.3101047, -0.3522016, 2.660609, 1, 1, 1, 1, 1,
0.3124646, -1.17523, 3.269599, 1, 1, 1, 1, 1,
0.3141722, 0.7357389, -0.3974022, 1, 1, 1, 1, 1,
0.3169345, -0.4060814, 3.060776, 1, 1, 1, 1, 1,
0.3185999, 0.2508596, 1.582541, 1, 1, 1, 1, 1,
0.3199403, -0.1265801, 2.385767, 1, 1, 1, 1, 1,
0.320131, -0.2212799, 2.998017, 0, 0, 1, 1, 1,
0.3216211, -1.073534, 3.77028, 1, 0, 0, 1, 1,
0.3225855, -2.069496, 2.763576, 1, 0, 0, 1, 1,
0.3235877, -0.4953514, 4.197268, 1, 0, 0, 1, 1,
0.3260969, 0.04492275, 2.972488, 1, 0, 0, 1, 1,
0.3311399, 1.278707, 1.316248, 1, 0, 0, 1, 1,
0.3317088, -1.297432, 2.792606, 0, 0, 0, 1, 1,
0.3408565, 0.6421053, 0.314459, 0, 0, 0, 1, 1,
0.3494956, -0.8420463, 3.401049, 0, 0, 0, 1, 1,
0.3502373, 0.4714293, -0.1625658, 0, 0, 0, 1, 1,
0.3543952, 1.000457, 0.3926839, 0, 0, 0, 1, 1,
0.3555318, -0.414026, 3.511432, 0, 0, 0, 1, 1,
0.3575477, -1.561177, 3.362111, 0, 0, 0, 1, 1,
0.3612837, -1.153016, 4.498644, 1, 1, 1, 1, 1,
0.3614568, 0.2698171, 1.570526, 1, 1, 1, 1, 1,
0.3658055, 0.1668118, 1.024089, 1, 1, 1, 1, 1,
0.3663344, 1.032446, 1.519276, 1, 1, 1, 1, 1,
0.3668585, 0.2209462, 1.347448, 1, 1, 1, 1, 1,
0.3702754, -0.0270473, 4.40147, 1, 1, 1, 1, 1,
0.3728804, 1.200982, -1.309198, 1, 1, 1, 1, 1,
0.373071, -1.403076, 4.234502, 1, 1, 1, 1, 1,
0.378145, -0.8038116, 1.578059, 1, 1, 1, 1, 1,
0.3786417, 0.07462653, 0.1541795, 1, 1, 1, 1, 1,
0.3786472, -0.4222595, 2.242881, 1, 1, 1, 1, 1,
0.3802147, 0.2091065, 2.297129, 1, 1, 1, 1, 1,
0.3830802, 0.9953107, 1.677744, 1, 1, 1, 1, 1,
0.386502, 1.328025, -0.9186562, 1, 1, 1, 1, 1,
0.3942457, -0.6805187, 2.743383, 1, 1, 1, 1, 1,
0.3945068, -0.8049375, 2.929896, 0, 0, 1, 1, 1,
0.4048432, 1.003385, 0.0554555, 1, 0, 0, 1, 1,
0.4097356, 0.3063939, -0.03962166, 1, 0, 0, 1, 1,
0.4134018, 0.6460131, 0.7955408, 1, 0, 0, 1, 1,
0.4204566, -1.147908, 0.938313, 1, 0, 0, 1, 1,
0.4224887, -0.2192072, 2.387563, 1, 0, 0, 1, 1,
0.4235241, -0.1644136, 0.616452, 0, 0, 0, 1, 1,
0.4240037, -0.1726873, 1.763432, 0, 0, 0, 1, 1,
0.4249493, 0.2704217, 0.8645552, 0, 0, 0, 1, 1,
0.4292196, -0.4578687, 4.023177, 0, 0, 0, 1, 1,
0.4295295, 1.431606, -0.6230417, 0, 0, 0, 1, 1,
0.4354117, 0.9942757, 0.1131331, 0, 0, 0, 1, 1,
0.4418427, -0.5688323, 6.176179, 0, 0, 0, 1, 1,
0.4425694, 0.4513648, 0.2105781, 1, 1, 1, 1, 1,
0.4427421, 1.372537, 1.601056, 1, 1, 1, 1, 1,
0.4455272, 0.7847416, 0.5306183, 1, 1, 1, 1, 1,
0.4477235, -0.6440201, 3.033343, 1, 1, 1, 1, 1,
0.4614963, -0.7297145, 3.257468, 1, 1, 1, 1, 1,
0.4657101, 0.3571922, 1.699145, 1, 1, 1, 1, 1,
0.4688417, -0.08079925, 2.018737, 1, 1, 1, 1, 1,
0.4699595, -2.055831, 2.764854, 1, 1, 1, 1, 1,
0.4763191, 0.5633449, 0.6797829, 1, 1, 1, 1, 1,
0.4790795, 0.1612929, 0.7989727, 1, 1, 1, 1, 1,
0.4811177, -1.435962, 2.468778, 1, 1, 1, 1, 1,
0.4882871, -0.483044, 1.480149, 1, 1, 1, 1, 1,
0.488434, -0.5616151, 2.975884, 1, 1, 1, 1, 1,
0.4957553, -0.6646714, 2.125697, 1, 1, 1, 1, 1,
0.4976522, -0.05715216, 0.9703559, 1, 1, 1, 1, 1,
0.5046308, -1.30171, 2.198343, 0, 0, 1, 1, 1,
0.5046538, -0.5582651, 3.984991, 1, 0, 0, 1, 1,
0.5110807, 0.03877696, 1.531607, 1, 0, 0, 1, 1,
0.5174764, -0.3875193, 0.4734686, 1, 0, 0, 1, 1,
0.5208984, 1.541, -0.1020285, 1, 0, 0, 1, 1,
0.5223662, -0.2613724, 2.807725, 1, 0, 0, 1, 1,
0.5313975, 0.5536355, -0.4513187, 0, 0, 0, 1, 1,
0.5319135, -0.3997412, 1.702947, 0, 0, 0, 1, 1,
0.5338011, -0.2278382, 1.796781, 0, 0, 0, 1, 1,
0.5357168, 0.3257478, 0.6783621, 0, 0, 0, 1, 1,
0.5410569, 1.366137, 1.138449, 0, 0, 0, 1, 1,
0.5441074, -0.01704275, 1.535964, 0, 0, 0, 1, 1,
0.5480161, -1.902038, 3.956069, 0, 0, 0, 1, 1,
0.5481128, 0.1017335, 1.386195, 1, 1, 1, 1, 1,
0.5494534, -0.9519368, 3.858794, 1, 1, 1, 1, 1,
0.5570783, 0.5102645, 2.014852, 1, 1, 1, 1, 1,
0.5579357, 0.4584621, 0.3382864, 1, 1, 1, 1, 1,
0.5589108, 0.04861698, 0.2372381, 1, 1, 1, 1, 1,
0.5610646, -0.7933596, 3.172911, 1, 1, 1, 1, 1,
0.5616102, 1.590823, 1.112769, 1, 1, 1, 1, 1,
0.5644143, 0.1856091, 2.379704, 1, 1, 1, 1, 1,
0.5682569, -1.016105, 3.487573, 1, 1, 1, 1, 1,
0.5695281, 0.1575539, 1.78715, 1, 1, 1, 1, 1,
0.569671, 1.087432, 1.455411, 1, 1, 1, 1, 1,
0.5730049, 0.6037254, 0.6311272, 1, 1, 1, 1, 1,
0.5738987, 0.4828864, 0.6686885, 1, 1, 1, 1, 1,
0.5774919, 0.7027993, 0.5265018, 1, 1, 1, 1, 1,
0.5775251, 1.357297, -0.229206, 1, 1, 1, 1, 1,
0.5776403, 1.096796, -1.029096, 0, 0, 1, 1, 1,
0.5807602, 0.06766076, 1.633978, 1, 0, 0, 1, 1,
0.5845867, 0.9931455, 1.07604, 1, 0, 0, 1, 1,
0.5910485, 0.5166676, 0.5625303, 1, 0, 0, 1, 1,
0.5968337, 0.1594192, 0.04966133, 1, 0, 0, 1, 1,
0.6079176, -1.344742, 0.8894265, 1, 0, 0, 1, 1,
0.6092737, -0.402261, 3.129678, 0, 0, 0, 1, 1,
0.6185763, 0.778768, 1.227882, 0, 0, 0, 1, 1,
0.6218899, -0.05948174, 2.158829, 0, 0, 0, 1, 1,
0.622627, 0.7292929, 0.4000801, 0, 0, 0, 1, 1,
0.6231081, 0.240022, -0.3383794, 0, 0, 0, 1, 1,
0.6252492, 0.3523385, 0.9221023, 0, 0, 0, 1, 1,
0.6292948, -0.9765344, 3.158803, 0, 0, 0, 1, 1,
0.630088, 1.361401, 3.857687, 1, 1, 1, 1, 1,
0.6312751, -0.4074632, 1.679557, 1, 1, 1, 1, 1,
0.634828, 0.2043853, 1.635659, 1, 1, 1, 1, 1,
0.6378047, 1.204396, 0.8584641, 1, 1, 1, 1, 1,
0.6393061, 1.200699, 0.8815531, 1, 1, 1, 1, 1,
0.6394079, 0.4375641, 0.7456993, 1, 1, 1, 1, 1,
0.6397613, 0.5520308, 0.171477, 1, 1, 1, 1, 1,
0.6398407, 0.04832531, 0.9066445, 1, 1, 1, 1, 1,
0.64024, 0.5906059, 0.3462783, 1, 1, 1, 1, 1,
0.6420417, -0.3416692, 0.1826657, 1, 1, 1, 1, 1,
0.6451132, 3.142726, 0.5625608, 1, 1, 1, 1, 1,
0.6459653, -0.08309847, 1.235321, 1, 1, 1, 1, 1,
0.6482916, -2.145502, 1.65164, 1, 1, 1, 1, 1,
0.6505778, -0.776073, 2.862868, 1, 1, 1, 1, 1,
0.6520619, -0.1274087, -0.1818443, 1, 1, 1, 1, 1,
0.6522114, -1.456204, 3.556717, 0, 0, 1, 1, 1,
0.6541035, -0.2142967, 2.370592, 1, 0, 0, 1, 1,
0.6563028, -0.6846721, 1.283937, 1, 0, 0, 1, 1,
0.6650274, -1.146931, 1.597799, 1, 0, 0, 1, 1,
0.66721, 1.102108, -0.2704493, 1, 0, 0, 1, 1,
0.669364, 1.053216, 1.280694, 1, 0, 0, 1, 1,
0.6741733, 1.026225, 0.9226182, 0, 0, 0, 1, 1,
0.6757668, 0.6997703, 2.053862, 0, 0, 0, 1, 1,
0.675923, 2.003643, -0.6463779, 0, 0, 0, 1, 1,
0.6791391, 0.4737887, 1.007385, 0, 0, 0, 1, 1,
0.679718, -0.005360453, 0.556204, 0, 0, 0, 1, 1,
0.6862229, -0.233405, 0.8535537, 0, 0, 0, 1, 1,
0.6934645, 0.3699816, 1.360085, 0, 0, 0, 1, 1,
0.6943543, 0.4199357, -0.2763247, 1, 1, 1, 1, 1,
0.6997018, -0.4007955, 1.9377, 1, 1, 1, 1, 1,
0.7037598, -0.6664233, 1.810449, 1, 1, 1, 1, 1,
0.7072984, 0.07802582, -0.5517886, 1, 1, 1, 1, 1,
0.710568, -0.03431579, 1.756132, 1, 1, 1, 1, 1,
0.7109808, 0.4613245, 2.575484, 1, 1, 1, 1, 1,
0.7110263, -1.8929, 2.616855, 1, 1, 1, 1, 1,
0.7115108, -0.03380834, 1.976204, 1, 1, 1, 1, 1,
0.7133615, -0.3001326, 1.005534, 1, 1, 1, 1, 1,
0.7136828, 0.9034849, 1.212503, 1, 1, 1, 1, 1,
0.7220987, 1.371883, 1.164085, 1, 1, 1, 1, 1,
0.7227708, -0.3649999, 1.964278, 1, 1, 1, 1, 1,
0.7235126, -0.9528469, 1.754761, 1, 1, 1, 1, 1,
0.7247794, -0.9438592, 1.877588, 1, 1, 1, 1, 1,
0.7330922, 0.3034607, 0.704025, 1, 1, 1, 1, 1,
0.7395219, -1.086538, 2.524305, 0, 0, 1, 1, 1,
0.7481245, 0.2598049, 3.884788, 1, 0, 0, 1, 1,
0.7487891, -0.7525742, 2.69453, 1, 0, 0, 1, 1,
0.7565951, 0.3721096, 0.2782677, 1, 0, 0, 1, 1,
0.7616581, 0.8955981, 0.4254511, 1, 0, 0, 1, 1,
0.7702225, -1.063755, 2.170194, 1, 0, 0, 1, 1,
0.7729198, -0.08998162, 0.5739998, 0, 0, 0, 1, 1,
0.7732701, -0.5550472, 4.863698, 0, 0, 0, 1, 1,
0.7743903, -0.3765029, 0.7350657, 0, 0, 0, 1, 1,
0.7792716, -1.72213, 3.033517, 0, 0, 0, 1, 1,
0.7793245, -0.8053759, 2.17276, 0, 0, 0, 1, 1,
0.7795883, -1.534523, 2.700701, 0, 0, 0, 1, 1,
0.7797503, 3.335675, 2.201762, 0, 0, 0, 1, 1,
0.7802979, 0.4757992, 2.165488, 1, 1, 1, 1, 1,
0.7900119, 0.03167347, 1.609908, 1, 1, 1, 1, 1,
0.8060178, 1.740439, 0.4142341, 1, 1, 1, 1, 1,
0.8106163, -3.775302, 1.752746, 1, 1, 1, 1, 1,
0.8267865, 1.112931, 0.3241901, 1, 1, 1, 1, 1,
0.8333839, 1.131393, -1.159547, 1, 1, 1, 1, 1,
0.8360978, 2.153884, 0.4331072, 1, 1, 1, 1, 1,
0.8422946, 0.292634, 1.014402, 1, 1, 1, 1, 1,
0.8490657, 0.7577865, -1.241914, 1, 1, 1, 1, 1,
0.8609434, -0.2293964, 0.5889112, 1, 1, 1, 1, 1,
0.8709149, -0.1900188, 1.722695, 1, 1, 1, 1, 1,
0.8725378, 0.06963266, 1.019424, 1, 1, 1, 1, 1,
0.8758465, 0.6660034, -0.1332535, 1, 1, 1, 1, 1,
0.8839558, -0.094692, 0.7059188, 1, 1, 1, 1, 1,
0.8885528, 0.6071668, 1.623238, 1, 1, 1, 1, 1,
0.890631, -0.3016661, 0.03740711, 0, 0, 1, 1, 1,
0.9030424, -0.0007174225, 1.234011, 1, 0, 0, 1, 1,
0.905815, -0.5722623, 2.202987, 1, 0, 0, 1, 1,
0.906633, 0.09562162, 2.197047, 1, 0, 0, 1, 1,
0.9071566, -1.010972, 3.719918, 1, 0, 0, 1, 1,
0.9107249, -0.5479197, 3.516826, 1, 0, 0, 1, 1,
0.9239754, -0.6759884, 3.567664, 0, 0, 0, 1, 1,
0.9303747, 0.2899551, -0.6157233, 0, 0, 0, 1, 1,
0.931703, -1.280834, 3.58897, 0, 0, 0, 1, 1,
0.9343478, -0.2232175, 1.231574, 0, 0, 0, 1, 1,
0.9489788, -0.07265421, 3.625693, 0, 0, 0, 1, 1,
0.9541941, 0.8673517, 1.526868, 0, 0, 0, 1, 1,
0.9575749, 1.893533, 1.076351, 0, 0, 0, 1, 1,
0.9653848, 0.01165073, 0.5916044, 1, 1, 1, 1, 1,
0.966496, 0.6939522, 1.732805, 1, 1, 1, 1, 1,
0.9749442, -0.01298271, 2.35533, 1, 1, 1, 1, 1,
0.980157, 0.9014943, 1.072253, 1, 1, 1, 1, 1,
0.9815925, -1.518309, 3.496818, 1, 1, 1, 1, 1,
0.9858025, -0.5792971, 3.034409, 1, 1, 1, 1, 1,
0.9871819, 0.4691823, -0.4099654, 1, 1, 1, 1, 1,
0.9882172, -1.537336, 4.672514, 1, 1, 1, 1, 1,
0.9910826, -0.03733894, 2.260352, 1, 1, 1, 1, 1,
0.9939308, -0.1520649, 0.05755024, 1, 1, 1, 1, 1,
0.9968025, -0.4112822, 0.1299571, 1, 1, 1, 1, 1,
1.002706, -0.1678195, 0.1682981, 1, 1, 1, 1, 1,
1.003453, 1.145003, 0.815372, 1, 1, 1, 1, 1,
1.009597, 1.720927, 0.4029057, 1, 1, 1, 1, 1,
1.012772, -0.6855577, 3.612558, 1, 1, 1, 1, 1,
1.0157, 0.8837167, 2.295957, 0, 0, 1, 1, 1,
1.024517, -0.01882761, 2.814017, 1, 0, 0, 1, 1,
1.03487, -1.356467, 2.700087, 1, 0, 0, 1, 1,
1.035735, -0.2981188, 1.770814, 1, 0, 0, 1, 1,
1.036201, 0.7380644, 0.7781734, 1, 0, 0, 1, 1,
1.038988, 0.2421962, 0.5336881, 1, 0, 0, 1, 1,
1.041232, -0.4315521, 2.981224, 0, 0, 0, 1, 1,
1.048635, 0.6167195, 0.1029701, 0, 0, 0, 1, 1,
1.051754, -1.152297, 3.810612, 0, 0, 0, 1, 1,
1.060303, 1.858274, 0.6312888, 0, 0, 0, 1, 1,
1.066715, 0.6424508, 1.507704, 0, 0, 0, 1, 1,
1.067527, 1.519129, 0.7752402, 0, 0, 0, 1, 1,
1.07324, 0.7138751, 2.751865, 0, 0, 0, 1, 1,
1.074129, -0.04128097, 1.855241, 1, 1, 1, 1, 1,
1.075834, -1.762249, 3.216276, 1, 1, 1, 1, 1,
1.075896, -0.8680776, 1.939219, 1, 1, 1, 1, 1,
1.087406, -0.4425579, 2.423549, 1, 1, 1, 1, 1,
1.089255, 2.565109, -0.7097319, 1, 1, 1, 1, 1,
1.091955, 0.7366551, 1.943061, 1, 1, 1, 1, 1,
1.09352, -1.680943, 3.216529, 1, 1, 1, 1, 1,
1.102454, 0.6528454, 0.1336142, 1, 1, 1, 1, 1,
1.103272, -0.9918754, 3.512051, 1, 1, 1, 1, 1,
1.112371, 0.2855632, 2.474478, 1, 1, 1, 1, 1,
1.13349, -0.5586401, 1.216233, 1, 1, 1, 1, 1,
1.141458, 0.5152043, 1.787908, 1, 1, 1, 1, 1,
1.148374, 1.240452, 2.36892, 1, 1, 1, 1, 1,
1.149264, -1.170867, 3.513821, 1, 1, 1, 1, 1,
1.166784, 0.9767892, 1.031522, 1, 1, 1, 1, 1,
1.173755, -1.02154, 3.549263, 0, 0, 1, 1, 1,
1.174124, 0.6961811, -0.4608551, 1, 0, 0, 1, 1,
1.174824, 0.1787465, 0.4218746, 1, 0, 0, 1, 1,
1.176244, -0.6453496, 1.782508, 1, 0, 0, 1, 1,
1.176664, -0.01913549, 0.5759891, 1, 0, 0, 1, 1,
1.17728, -1.215274, 2.98091, 1, 0, 0, 1, 1,
1.179287, -0.408274, 1.77567, 0, 0, 0, 1, 1,
1.1805, -0.7449685, 2.250192, 0, 0, 0, 1, 1,
1.183048, -0.8297085, 2.320396, 0, 0, 0, 1, 1,
1.185447, 1.242854, -1.219748, 0, 0, 0, 1, 1,
1.187761, -1.620391, 3.819232, 0, 0, 0, 1, 1,
1.189588, 0.1292738, 1.134368, 0, 0, 0, 1, 1,
1.192966, -1.02414, 2.073867, 0, 0, 0, 1, 1,
1.195636, 1.29714, 0.9647825, 1, 1, 1, 1, 1,
1.199089, 0.1301798, 2.041255, 1, 1, 1, 1, 1,
1.202739, 1.525406, 2.322777, 1, 1, 1, 1, 1,
1.203453, 1.553495, 0.2048355, 1, 1, 1, 1, 1,
1.204872, -1.521683, 2.187888, 1, 1, 1, 1, 1,
1.207296, 0.1765853, 1.814675, 1, 1, 1, 1, 1,
1.208086, 0.5225071, 1.928582, 1, 1, 1, 1, 1,
1.211621, 0.09969197, 1.865433, 1, 1, 1, 1, 1,
1.212988, -1.132654, 1.288032, 1, 1, 1, 1, 1,
1.214225, -0.5461757, 2.557647, 1, 1, 1, 1, 1,
1.21587, -0.7578924, 1.018321, 1, 1, 1, 1, 1,
1.21751, -0.1205787, 1.730508, 1, 1, 1, 1, 1,
1.24483, 0.06383882, 0.9115431, 1, 1, 1, 1, 1,
1.259733, -0.3537916, 2.582532, 1, 1, 1, 1, 1,
1.27293, -0.2746568, 3.019589, 1, 1, 1, 1, 1,
1.274272, 0.9813838, 1.739654, 0, 0, 1, 1, 1,
1.275323, -1.542233, 2.636821, 1, 0, 0, 1, 1,
1.28033, -1.17578, 2.910233, 1, 0, 0, 1, 1,
1.286681, 0.6202397, 1.096097, 1, 0, 0, 1, 1,
1.291057, -0.1885898, 0.03826682, 1, 0, 0, 1, 1,
1.317809, 2.910201, 0.8016879, 1, 0, 0, 1, 1,
1.321637, 1.018688, 1.887864, 0, 0, 0, 1, 1,
1.328392, -0.8419127, 1.648643, 0, 0, 0, 1, 1,
1.329697, -0.2572724, 2.341348, 0, 0, 0, 1, 1,
1.332984, -0.6452894, 3.706983, 0, 0, 0, 1, 1,
1.350585, -0.4613917, 2.109543, 0, 0, 0, 1, 1,
1.355006, 1.625086, 0.7043698, 0, 0, 0, 1, 1,
1.357001, -0.3865179, 4.259894, 0, 0, 0, 1, 1,
1.361948, 0.4784303, 2.884629, 1, 1, 1, 1, 1,
1.363358, 1.851147, 1.53496, 1, 1, 1, 1, 1,
1.373016, -1.460993, 2.948235, 1, 1, 1, 1, 1,
1.383066, 0.5265239, 0.6461979, 1, 1, 1, 1, 1,
1.395422, -0.6970067, 3.813213, 1, 1, 1, 1, 1,
1.398681, 0.6802729, 1.154345, 1, 1, 1, 1, 1,
1.405432, -1.64182, 2.918186, 1, 1, 1, 1, 1,
1.41623, -0.1765235, 1.861434, 1, 1, 1, 1, 1,
1.419698, 0.1149498, 0.1699023, 1, 1, 1, 1, 1,
1.434016, -2.132649, 1.569216, 1, 1, 1, 1, 1,
1.434573, -0.3046474, 0.778851, 1, 1, 1, 1, 1,
1.434951, -0.7456332, 2.693816, 1, 1, 1, 1, 1,
1.458886, -1.75768, 3.223804, 1, 1, 1, 1, 1,
1.461296, 1.124722, 0.2388803, 1, 1, 1, 1, 1,
1.46218, -1.334119, 1.15441, 1, 1, 1, 1, 1,
1.463721, -1.158301, 1.677686, 0, 0, 1, 1, 1,
1.473474, -0.2040383, 2.271908, 1, 0, 0, 1, 1,
1.486625, -1.174078, 3.492573, 1, 0, 0, 1, 1,
1.489804, 1.076244, 2.814334, 1, 0, 0, 1, 1,
1.503507, 0.130808, 1.421441, 1, 0, 0, 1, 1,
1.513468, 0.03768651, -0.1893781, 1, 0, 0, 1, 1,
1.517105, -2.159416, 2.049524, 0, 0, 0, 1, 1,
1.518358, -0.9228567, 2.563087, 0, 0, 0, 1, 1,
1.520565, 0.5216517, 0.7897743, 0, 0, 0, 1, 1,
1.53677, 0.5328174, 1.726711, 0, 0, 0, 1, 1,
1.543107, -0.1325356, 2.785771, 0, 0, 0, 1, 1,
1.544468, -0.2742803, 2.678218, 0, 0, 0, 1, 1,
1.549726, 2.450212, 1.25489, 0, 0, 0, 1, 1,
1.558897, -1.381378, 1.182019, 1, 1, 1, 1, 1,
1.561921, -0.9541651, 2.419898, 1, 1, 1, 1, 1,
1.571151, -0.6307071, 2.085641, 1, 1, 1, 1, 1,
1.57221, -0.4980297, 0.03827808, 1, 1, 1, 1, 1,
1.574174, 0.07432852, -0.09787217, 1, 1, 1, 1, 1,
1.621724, 0.4387163, 0.1842476, 1, 1, 1, 1, 1,
1.625564, -0.224201, 3.592347, 1, 1, 1, 1, 1,
1.639728, -0.1404013, 1.730464, 1, 1, 1, 1, 1,
1.643525, 0.408662, -0.2535559, 1, 1, 1, 1, 1,
1.657517, -1.936288, 3.623379, 1, 1, 1, 1, 1,
1.658967, 0.4190303, 1.027095, 1, 1, 1, 1, 1,
1.666011, 1.064541, 0.05719066, 1, 1, 1, 1, 1,
1.667354, 0.1441522, 1.631589, 1, 1, 1, 1, 1,
1.670966, 2.226, 2.09972, 1, 1, 1, 1, 1,
1.690293, 0.9439151, 0.7302182, 1, 1, 1, 1, 1,
1.708635, -0.975406, 2.645325, 0, 0, 1, 1, 1,
1.722206, -1.64024, 1.739348, 1, 0, 0, 1, 1,
1.742904, -1.800975, 3.436682, 1, 0, 0, 1, 1,
1.750182, 1.48094, 1.516716, 1, 0, 0, 1, 1,
1.753369, -0.1180391, 2.430367, 1, 0, 0, 1, 1,
1.759622, 0.05545461, 1.902014, 1, 0, 0, 1, 1,
1.762044, 0.3980539, 2.076115, 0, 0, 0, 1, 1,
1.771686, 2.241443, 2.679068, 0, 0, 0, 1, 1,
1.772667, 0.7173828, 3.837898, 0, 0, 0, 1, 1,
1.777602, -0.3222657, 0.4747414, 0, 0, 0, 1, 1,
1.783206, 0.7544633, 0.6566954, 0, 0, 0, 1, 1,
1.792358, -1.865503, 3.144596, 0, 0, 0, 1, 1,
1.805607, 2.034707, -0.1029258, 0, 0, 0, 1, 1,
1.810032, 0.4869497, 3.518825, 1, 1, 1, 1, 1,
1.814643, 0.5665731, 1.901019, 1, 1, 1, 1, 1,
1.816137, -2.068202, 3.431846, 1, 1, 1, 1, 1,
1.838764, 0.5422835, 1.778372, 1, 1, 1, 1, 1,
1.842118, -0.4812412, 0.6915902, 1, 1, 1, 1, 1,
1.842142, -0.01321553, 0.9646649, 1, 1, 1, 1, 1,
1.847509, 0.190625, 1.345604, 1, 1, 1, 1, 1,
1.850646, -0.3701226, 1.410858, 1, 1, 1, 1, 1,
1.854679, -0.7444382, 2.680782, 1, 1, 1, 1, 1,
1.858018, 0.6043808, 0.02388363, 1, 1, 1, 1, 1,
1.89479, -1.009954, 3.781237, 1, 1, 1, 1, 1,
1.898823, -2.571786, 1.555229, 1, 1, 1, 1, 1,
1.926769, -0.414725, 1.77443, 1, 1, 1, 1, 1,
1.942432, 1.844774, 0.2431573, 1, 1, 1, 1, 1,
1.947196, -0.6867701, 1.745229, 1, 1, 1, 1, 1,
1.963788, -0.9685736, 0.4491718, 0, 0, 1, 1, 1,
1.97703, 1.165574, 1.051756, 1, 0, 0, 1, 1,
1.984198, -0.3899982, 1.824163, 1, 0, 0, 1, 1,
2.013506, 1.058849, 1.356484, 1, 0, 0, 1, 1,
2.019839, 0.8293853, -0.05218716, 1, 0, 0, 1, 1,
2.025266, 0.6955637, 1.932217, 1, 0, 0, 1, 1,
2.065653, -0.9710137, 1.24744, 0, 0, 0, 1, 1,
2.076963, 0.9832405, 1.915378, 0, 0, 0, 1, 1,
2.078624, 0.7029128, 2.410747, 0, 0, 0, 1, 1,
2.08327, -1.586536, 0.7715775, 0, 0, 0, 1, 1,
2.09137, 1.49063, 0.2970097, 0, 0, 0, 1, 1,
2.115909, -0.0622432, 1.802579, 0, 0, 0, 1, 1,
2.240657, -0.2041741, 0.3979346, 0, 0, 0, 1, 1,
2.351081, -1.683217, 3.50738, 1, 1, 1, 1, 1,
2.420679, 0.8205749, 0.8002592, 1, 1, 1, 1, 1,
2.42146, -1.108977, 1.160708, 1, 1, 1, 1, 1,
2.450113, -0.7793431, 1.692302, 1, 1, 1, 1, 1,
2.532636, 1.721919, 2.34756, 1, 1, 1, 1, 1,
2.692584, -1.426265, 2.984591, 1, 1, 1, 1, 1,
2.898868, 0.2556605, 1.332932, 1, 1, 1, 1, 1
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
var radius = 10.33139;
var distance = 36.28856;
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
mvMatrix.translate( 0.4238306, 0.2982817, -0.3377697 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.28856);
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
