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
-3.060975, -1.1595, -1.161995, 1, 0, 0, 1,
-2.951656, -0.4173912, -0.8487712, 1, 0.007843138, 0, 1,
-2.851054, -0.1902222, -2.297989, 1, 0.01176471, 0, 1,
-2.728393, -0.3069382, -1.297561, 1, 0.01960784, 0, 1,
-2.713196, -0.5739924, -0.3629372, 1, 0.02352941, 0, 1,
-2.695255, -1.278964, -2.604742, 1, 0.03137255, 0, 1,
-2.662589, -0.3983983, -1.923887, 1, 0.03529412, 0, 1,
-2.575475, -1.254092, 0.04835086, 1, 0.04313726, 0, 1,
-2.486276, 0.4103915, -2.092204, 1, 0.04705882, 0, 1,
-2.40046, 2.063797, -0.2897998, 1, 0.05490196, 0, 1,
-2.36714, 0.6576692, -1.729868, 1, 0.05882353, 0, 1,
-2.349335, -0.1961111, -1.858445, 1, 0.06666667, 0, 1,
-2.342435, 1.515423, -1.129572, 1, 0.07058824, 0, 1,
-2.315515, -1.707049, -2.928313, 1, 0.07843138, 0, 1,
-2.248349, -0.8378771, -3.777153, 1, 0.08235294, 0, 1,
-2.24768, -0.3155186, -1.970219, 1, 0.09019608, 0, 1,
-2.149682, -2.064135, -3.872721, 1, 0.09411765, 0, 1,
-2.1441, -0.2241351, -2.181309, 1, 0.1019608, 0, 1,
-2.138899, 1.482358, 0.7344369, 1, 0.1098039, 0, 1,
-2.12154, -0.5678991, 0.2636857, 1, 0.1137255, 0, 1,
-2.120353, -0.9144045, -1.744326, 1, 0.1215686, 0, 1,
-2.076961, 1.255047, -1.37105, 1, 0.1254902, 0, 1,
-2.050294, -1.888824, -2.459023, 1, 0.1333333, 0, 1,
-2.035273, 0.9098707, -1.30402, 1, 0.1372549, 0, 1,
-2.033393, 0.1073071, -2.268603, 1, 0.145098, 0, 1,
-2.012613, -0.3881688, -0.3103194, 1, 0.1490196, 0, 1,
-1.994451, -1.720914, -2.189018, 1, 0.1568628, 0, 1,
-1.9795, -0.282893, -1.389909, 1, 0.1607843, 0, 1,
-1.935303, 0.7649878, -1.9937, 1, 0.1686275, 0, 1,
-1.924946, 1.995623, -0.88908, 1, 0.172549, 0, 1,
-1.909215, 0.1025795, -0.6397048, 1, 0.1803922, 0, 1,
-1.898828, 0.1262299, -3.340263, 1, 0.1843137, 0, 1,
-1.876325, -0.2230048, -1.956149, 1, 0.1921569, 0, 1,
-1.85617, 0.615214, -2.245961, 1, 0.1960784, 0, 1,
-1.854841, -1.197347, -3.504761, 1, 0.2039216, 0, 1,
-1.854074, -0.7857203, -0.7496932, 1, 0.2117647, 0, 1,
-1.826669, -3.061253, -2.637989, 1, 0.2156863, 0, 1,
-1.815142, -0.9328532, -2.885466, 1, 0.2235294, 0, 1,
-1.812136, -0.03426058, -0.9016117, 1, 0.227451, 0, 1,
-1.803777, 0.7679905, -2.058291, 1, 0.2352941, 0, 1,
-1.770761, 0.563353, -1.692782, 1, 0.2392157, 0, 1,
-1.768696, -0.6447665, -3.932221, 1, 0.2470588, 0, 1,
-1.722622, -0.898863, -1.644479, 1, 0.2509804, 0, 1,
-1.679873, 1.31644, -1.530956, 1, 0.2588235, 0, 1,
-1.67891, -0.4291848, -2.061468, 1, 0.2627451, 0, 1,
-1.674959, 0.4711048, 0.008407979, 1, 0.2705882, 0, 1,
-1.67396, -0.1751503, -4.047868, 1, 0.2745098, 0, 1,
-1.611632, 1.005729, -1.706084, 1, 0.282353, 0, 1,
-1.595155, -1.256613, -3.264097, 1, 0.2862745, 0, 1,
-1.592903, -0.608435, -0.2209839, 1, 0.2941177, 0, 1,
-1.586215, -0.0007919202, 0.03479326, 1, 0.3019608, 0, 1,
-1.573207, 1.282208, -0.2762833, 1, 0.3058824, 0, 1,
-1.572949, -0.07056998, 0.02850247, 1, 0.3137255, 0, 1,
-1.551607, -0.1492197, -2.008147, 1, 0.3176471, 0, 1,
-1.54542, -0.691388, -2.96951, 1, 0.3254902, 0, 1,
-1.544061, -0.5951789, -0.9665858, 1, 0.3294118, 0, 1,
-1.544, 1.514937, -1.803608, 1, 0.3372549, 0, 1,
-1.535127, 0.5613438, 0.1383534, 1, 0.3411765, 0, 1,
-1.512499, -1.188185, -2.132658, 1, 0.3490196, 0, 1,
-1.496551, -0.781393, -2.351615, 1, 0.3529412, 0, 1,
-1.495436, -0.3609479, -2.132462, 1, 0.3607843, 0, 1,
-1.493251, 0.4734843, -2.008398, 1, 0.3647059, 0, 1,
-1.492117, -0.01327403, -2.396601, 1, 0.372549, 0, 1,
-1.491132, -0.1285613, -2.200394, 1, 0.3764706, 0, 1,
-1.489216, 2.469731, -1.903832, 1, 0.3843137, 0, 1,
-1.474083, 0.425263, -2.220917, 1, 0.3882353, 0, 1,
-1.464088, 0.7212724, 0.07225238, 1, 0.3960784, 0, 1,
-1.462401, 0.2797389, -1.634961, 1, 0.4039216, 0, 1,
-1.445443, -0.544162, -2.554074, 1, 0.4078431, 0, 1,
-1.443067, 1.572194, -0.694008, 1, 0.4156863, 0, 1,
-1.439281, -0.9718137, -1.8111, 1, 0.4196078, 0, 1,
-1.431977, 1.247631, -0.08730184, 1, 0.427451, 0, 1,
-1.43149, 0.5427817, -0.1349106, 1, 0.4313726, 0, 1,
-1.419595, 1.25383, -0.9952214, 1, 0.4392157, 0, 1,
-1.392925, -0.2076802, -0.9838055, 1, 0.4431373, 0, 1,
-1.384251, -0.1656373, -1.088239, 1, 0.4509804, 0, 1,
-1.377349, 0.4194374, -2.001045, 1, 0.454902, 0, 1,
-1.377054, 1.030983, -0.7791576, 1, 0.4627451, 0, 1,
-1.365671, 0.5761583, -2.331294, 1, 0.4666667, 0, 1,
-1.353942, -0.2297239, -2.082169, 1, 0.4745098, 0, 1,
-1.348936, -1.041647, -2.73938, 1, 0.4784314, 0, 1,
-1.346574, 1.25739, -0.03548138, 1, 0.4862745, 0, 1,
-1.344534, -0.8555216, -1.917302, 1, 0.4901961, 0, 1,
-1.336833, 0.3837295, -1.124999, 1, 0.4980392, 0, 1,
-1.334052, 0.5253146, -1.755659, 1, 0.5058824, 0, 1,
-1.326652, 0.1046984, -2.676014, 1, 0.509804, 0, 1,
-1.316199, -0.8848218, -1.665067, 1, 0.5176471, 0, 1,
-1.309063, 0.3398548, -0.8542398, 1, 0.5215687, 0, 1,
-1.305733, -0.6017169, -1.513786, 1, 0.5294118, 0, 1,
-1.305503, -0.1801625, -1.365772, 1, 0.5333334, 0, 1,
-1.299534, 0.00281009, -0.636741, 1, 0.5411765, 0, 1,
-1.298168, -0.01447309, -1.585471, 1, 0.5450981, 0, 1,
-1.282498, 1.245784, -0.7604969, 1, 0.5529412, 0, 1,
-1.278376, -0.5637789, -2.054702, 1, 0.5568628, 0, 1,
-1.27779, 0.7987055, -1.795154, 1, 0.5647059, 0, 1,
-1.258815, -0.3128296, -0.6754874, 1, 0.5686275, 0, 1,
-1.258277, 0.9484892, 1.156945, 1, 0.5764706, 0, 1,
-1.247649, 0.1453851, -1.999674, 1, 0.5803922, 0, 1,
-1.238976, -0.1935261, -2.221988, 1, 0.5882353, 0, 1,
-1.238293, -1.079207, -2.923776, 1, 0.5921569, 0, 1,
-1.229476, -0.9195507, -1.597607, 1, 0.6, 0, 1,
-1.228303, 0.2717766, -1.343701, 1, 0.6078432, 0, 1,
-1.227783, -1.079871, -2.104622, 1, 0.6117647, 0, 1,
-1.224459, 1.602687, -1.50919, 1, 0.6196079, 0, 1,
-1.203246, 1.297404, 0.0530832, 1, 0.6235294, 0, 1,
-1.201783, -0.03070345, -2.255545, 1, 0.6313726, 0, 1,
-1.194482, 1.017563, -1.483616, 1, 0.6352941, 0, 1,
-1.188727, -0.1794801, -1.688603, 1, 0.6431373, 0, 1,
-1.187209, 0.005073295, -1.896312, 1, 0.6470588, 0, 1,
-1.167491, -0.3502013, -1.057032, 1, 0.654902, 0, 1,
-1.166736, 0.06893227, -1.435243, 1, 0.6588235, 0, 1,
-1.161855, -0.1081126, -1.688369, 1, 0.6666667, 0, 1,
-1.158231, -0.4028908, -0.7138997, 1, 0.6705883, 0, 1,
-1.152204, -1.608665, -2.335368, 1, 0.6784314, 0, 1,
-1.151, 1.749612, 1.486898, 1, 0.682353, 0, 1,
-1.138702, -0.5118029, -1.66342, 1, 0.6901961, 0, 1,
-1.136221, 1.441137, -0.6879767, 1, 0.6941177, 0, 1,
-1.133672, -0.02605865, -1.577887, 1, 0.7019608, 0, 1,
-1.130054, 0.1970152, -1.844391, 1, 0.7098039, 0, 1,
-1.10892, 1.224327, 0.2491896, 1, 0.7137255, 0, 1,
-1.107361, -0.2405254, 0.8682511, 1, 0.7215686, 0, 1,
-1.105881, 0.5483822, -1.927832, 1, 0.7254902, 0, 1,
-1.105354, 0.943585, -1.483901, 1, 0.7333333, 0, 1,
-1.105068, -2.123274, -2.520923, 1, 0.7372549, 0, 1,
-1.104818, 0.1549453, -1.967153, 1, 0.7450981, 0, 1,
-1.102617, 1.061835, -1.010183, 1, 0.7490196, 0, 1,
-1.100463, -0.1871812, -0.6771477, 1, 0.7568628, 0, 1,
-1.09005, -1.429239, -1.535201, 1, 0.7607843, 0, 1,
-1.084556, 0.3243365, -1.596598, 1, 0.7686275, 0, 1,
-1.066962, -0.8556577, -2.194957, 1, 0.772549, 0, 1,
-1.064725, 0.07867768, -2.567843, 1, 0.7803922, 0, 1,
-1.062521, 0.3243693, -1.475705, 1, 0.7843137, 0, 1,
-1.059072, 0.1867465, -1.863344, 1, 0.7921569, 0, 1,
-1.057299, -0.6269441, -2.522288, 1, 0.7960784, 0, 1,
-1.05084, 1.522142, 0.4327715, 1, 0.8039216, 0, 1,
-1.04997, -0.6675905, -4.629735, 1, 0.8117647, 0, 1,
-1.044647, 0.6989946, 0.1506151, 1, 0.8156863, 0, 1,
-1.035262, -1.019613, -3.234324, 1, 0.8235294, 0, 1,
-1.034079, -0.3567251, -1.208577, 1, 0.827451, 0, 1,
-1.026438, 1.318853, -0.7287619, 1, 0.8352941, 0, 1,
-1.022855, -0.1487511, -0.4238164, 1, 0.8392157, 0, 1,
-1.020483, -0.1969074, -0.7331344, 1, 0.8470588, 0, 1,
-1.001263, -1.634044, -2.648078, 1, 0.8509804, 0, 1,
-1.001031, -1.544441, -1.609118, 1, 0.8588235, 0, 1,
-1.000087, -0.3460454, -2.956871, 1, 0.8627451, 0, 1,
-0.9817559, -0.2767954, -3.371803, 1, 0.8705882, 0, 1,
-0.9798892, 0.4124126, -3.288554, 1, 0.8745098, 0, 1,
-0.9774432, 0.661675, 0.1299516, 1, 0.8823529, 0, 1,
-0.9757213, -1.793223, -3.047704, 1, 0.8862745, 0, 1,
-0.9726996, -3.058433, -1.642376, 1, 0.8941177, 0, 1,
-0.9687625, -0.2517394, -2.698225, 1, 0.8980392, 0, 1,
-0.9663844, -0.2486937, -1.185449, 1, 0.9058824, 0, 1,
-0.9628736, 0.1844591, 0.1705341, 1, 0.9137255, 0, 1,
-0.9519522, 0.151815, -1.368798, 1, 0.9176471, 0, 1,
-0.9465218, 0.958562, -2.547011, 1, 0.9254902, 0, 1,
-0.9430318, -0.4020267, -2.252017, 1, 0.9294118, 0, 1,
-0.9423023, -1.084177, -3.777829, 1, 0.9372549, 0, 1,
-0.9418761, -0.4025356, -1.972875, 1, 0.9411765, 0, 1,
-0.9374329, -1.137768, -0.8498738, 1, 0.9490196, 0, 1,
-0.9297515, -1.143555, -4.808855, 1, 0.9529412, 0, 1,
-0.9248888, 0.05026224, -0.3719047, 1, 0.9607843, 0, 1,
-0.9236271, -0.938402, -0.6441037, 1, 0.9647059, 0, 1,
-0.9176803, 0.4081766, -2.723193, 1, 0.972549, 0, 1,
-0.9170229, -1.556165, -2.158452, 1, 0.9764706, 0, 1,
-0.9126803, -1.421323, -3.516957, 1, 0.9843137, 0, 1,
-0.9073684, -0.4210804, -2.317072, 1, 0.9882353, 0, 1,
-0.9030401, -0.833328, -1.325523, 1, 0.9960784, 0, 1,
-0.8958818, -1.253808, -2.277619, 0.9960784, 1, 0, 1,
-0.895797, -0.5662175, -1.980678, 0.9921569, 1, 0, 1,
-0.8945937, -0.4671277, -2.379793, 0.9843137, 1, 0, 1,
-0.8865473, 0.08017204, -0.2270266, 0.9803922, 1, 0, 1,
-0.8852349, -1.026719, -2.555207, 0.972549, 1, 0, 1,
-0.8778046, 1.084136, -2.308599, 0.9686275, 1, 0, 1,
-0.8763583, -0.05374708, -0.9147482, 0.9607843, 1, 0, 1,
-0.8740981, 0.286512, -0.7913421, 0.9568627, 1, 0, 1,
-0.8657734, 0.7995978, -0.2522693, 0.9490196, 1, 0, 1,
-0.8595585, -0.5865327, -2.478402, 0.945098, 1, 0, 1,
-0.8591331, -0.6364646, -1.271098, 0.9372549, 1, 0, 1,
-0.8537652, -0.7136763, -1.510182, 0.9333333, 1, 0, 1,
-0.8531834, -0.460552, -1.072225, 0.9254902, 1, 0, 1,
-0.84797, 0.2401898, -0.1133687, 0.9215686, 1, 0, 1,
-0.8436123, 0.202648, -0.9800101, 0.9137255, 1, 0, 1,
-0.842209, -0.6692058, -0.8824725, 0.9098039, 1, 0, 1,
-0.8257272, 0.1824647, -1.288918, 0.9019608, 1, 0, 1,
-0.8246612, 0.9044876, 0.3716652, 0.8941177, 1, 0, 1,
-0.8232849, -2.109154, -4.308176, 0.8901961, 1, 0, 1,
-0.8227175, 1.501271, 1.848889, 0.8823529, 1, 0, 1,
-0.8181838, 0.1988556, -2.134971, 0.8784314, 1, 0, 1,
-0.8179819, 0.3737834, -0.1373581, 0.8705882, 1, 0, 1,
-0.811597, -1.119769, -2.973441, 0.8666667, 1, 0, 1,
-0.8113899, 0.2907439, 0.1645309, 0.8588235, 1, 0, 1,
-0.8105739, 0.7365416, -1.630607, 0.854902, 1, 0, 1,
-0.8095706, 0.2464044, -2.063964, 0.8470588, 1, 0, 1,
-0.8045382, 0.09494983, 0.1054439, 0.8431373, 1, 0, 1,
-0.8013846, -1.059244, -2.287534, 0.8352941, 1, 0, 1,
-0.7997975, 1.146121, 1.757568, 0.8313726, 1, 0, 1,
-0.7987504, 1.378752, -0.604195, 0.8235294, 1, 0, 1,
-0.7953264, -2.220067, -3.164804, 0.8196079, 1, 0, 1,
-0.7911721, 0.8120443, -2.07728, 0.8117647, 1, 0, 1,
-0.7858943, -0.05434745, -0.3224032, 0.8078431, 1, 0, 1,
-0.7856444, -1.751868, -1.588061, 0.8, 1, 0, 1,
-0.7808136, -0.05298727, -0.8243485, 0.7921569, 1, 0, 1,
-0.7799149, -1.374134, -3.067698, 0.7882353, 1, 0, 1,
-0.7789893, -0.7446592, -1.453967, 0.7803922, 1, 0, 1,
-0.778071, -0.5293417, -1.892408, 0.7764706, 1, 0, 1,
-0.7764566, 0.2221972, -1.516319, 0.7686275, 1, 0, 1,
-0.7725809, 1.660986, -0.5120189, 0.7647059, 1, 0, 1,
-0.7667649, 0.9243112, 0.9350422, 0.7568628, 1, 0, 1,
-0.7590035, 0.4990447, -1.695745, 0.7529412, 1, 0, 1,
-0.7545782, 2.159718, -1.436403, 0.7450981, 1, 0, 1,
-0.7538689, -1.421573, -4.241695, 0.7411765, 1, 0, 1,
-0.7507629, 0.08886766, -2.625873, 0.7333333, 1, 0, 1,
-0.7474922, -0.0702529, -2.231344, 0.7294118, 1, 0, 1,
-0.7454486, 1.278579, 1.186349, 0.7215686, 1, 0, 1,
-0.7441569, 0.2429482, 0.2378094, 0.7176471, 1, 0, 1,
-0.7436426, -0.01927943, -2.330842, 0.7098039, 1, 0, 1,
-0.7383925, -0.587826, -2.395937, 0.7058824, 1, 0, 1,
-0.7334464, 0.5424852, -1.349661, 0.6980392, 1, 0, 1,
-0.7287265, -0.1053424, -1.535622, 0.6901961, 1, 0, 1,
-0.7167476, -0.4986886, -1.713898, 0.6862745, 1, 0, 1,
-0.7151606, 0.6556351, -0.8282062, 0.6784314, 1, 0, 1,
-0.7114415, 0.60522, -0.7531222, 0.6745098, 1, 0, 1,
-0.6972407, -0.825529, -2.401174, 0.6666667, 1, 0, 1,
-0.6933219, -0.1914256, -0.5746381, 0.6627451, 1, 0, 1,
-0.6909637, 1.051084, -0.1100421, 0.654902, 1, 0, 1,
-0.6885347, -0.6899484, -2.114014, 0.6509804, 1, 0, 1,
-0.6815212, -0.5205352, -2.795856, 0.6431373, 1, 0, 1,
-0.6802217, 1.159211, 0.5879495, 0.6392157, 1, 0, 1,
-0.6785214, -0.257247, -3.409103, 0.6313726, 1, 0, 1,
-0.6766158, -0.1289681, -2.581854, 0.627451, 1, 0, 1,
-0.6757749, -0.1842037, -2.587179, 0.6196079, 1, 0, 1,
-0.6755587, 1.504961, -0.1702501, 0.6156863, 1, 0, 1,
-0.6718401, -0.4686921, -4.826903, 0.6078432, 1, 0, 1,
-0.6666766, -0.8154721, -3.496608, 0.6039216, 1, 0, 1,
-0.6561994, -1.502492, -2.327335, 0.5960785, 1, 0, 1,
-0.6544743, 0.6581231, -0.4125576, 0.5882353, 1, 0, 1,
-0.647494, 0.05805056, -1.261219, 0.5843138, 1, 0, 1,
-0.6359245, 1.434099, 0.354521, 0.5764706, 1, 0, 1,
-0.63542, -0.6943402, -1.424629, 0.572549, 1, 0, 1,
-0.6337138, 0.4118118, -0.4855657, 0.5647059, 1, 0, 1,
-0.6315637, -0.7670519, -1.29889, 0.5607843, 1, 0, 1,
-0.6183711, 1.189114, 0.5694262, 0.5529412, 1, 0, 1,
-0.6166095, -1.034451, -1.807207, 0.5490196, 1, 0, 1,
-0.6147712, -0.8705747, -3.044122, 0.5411765, 1, 0, 1,
-0.6101764, -1.183469, -2.744951, 0.5372549, 1, 0, 1,
-0.6096724, 1.401238, -0.6523883, 0.5294118, 1, 0, 1,
-0.6088609, 0.6107756, -0.9091148, 0.5254902, 1, 0, 1,
-0.6050221, 0.1781455, -1.990024, 0.5176471, 1, 0, 1,
-0.6045594, 0.1914452, -1.885139, 0.5137255, 1, 0, 1,
-0.5995506, 2.107751, -0.9671576, 0.5058824, 1, 0, 1,
-0.5989724, 0.4757012, -0.1377351, 0.5019608, 1, 0, 1,
-0.5922625, 1.030908, 0.3273907, 0.4941176, 1, 0, 1,
-0.5883661, -1.254162, -2.810863, 0.4862745, 1, 0, 1,
-0.5848933, -0.3812301, -1.752433, 0.4823529, 1, 0, 1,
-0.5821068, 0.06756717, -1.840691, 0.4745098, 1, 0, 1,
-0.5806836, 0.06783442, -2.559673, 0.4705882, 1, 0, 1,
-0.5786471, -0.6481884, -2.55155, 0.4627451, 1, 0, 1,
-0.5785857, 0.2068236, -2.393784, 0.4588235, 1, 0, 1,
-0.577177, 1.207503, -0.982237, 0.4509804, 1, 0, 1,
-0.5731912, 0.8676747, 0.5607389, 0.4470588, 1, 0, 1,
-0.5722913, -1.064707, -3.346421, 0.4392157, 1, 0, 1,
-0.5720142, -1.524603, -3.414946, 0.4352941, 1, 0, 1,
-0.5704374, 1.464726, -0.1225476, 0.427451, 1, 0, 1,
-0.5672415, -0.2514199, -0.4704834, 0.4235294, 1, 0, 1,
-0.567146, 1.084175, -0.5029059, 0.4156863, 1, 0, 1,
-0.566869, -0.3883696, -2.435557, 0.4117647, 1, 0, 1,
-0.5584752, 1.050893, 0.267099, 0.4039216, 1, 0, 1,
-0.5583965, -0.5746788, -2.597198, 0.3960784, 1, 0, 1,
-0.5548193, 0.5705335, -1.045171, 0.3921569, 1, 0, 1,
-0.5525832, 0.3578965, -2.893223, 0.3843137, 1, 0, 1,
-0.5524492, 0.4940202, -0.7113295, 0.3803922, 1, 0, 1,
-0.5505925, -2.196615, -3.198227, 0.372549, 1, 0, 1,
-0.5480714, -0.4715276, -3.888206, 0.3686275, 1, 0, 1,
-0.5472742, -0.3792852, -3.385901, 0.3607843, 1, 0, 1,
-0.5419229, 0.3254724, -0.8515183, 0.3568628, 1, 0, 1,
-0.538529, 1.638771, -1.472069, 0.3490196, 1, 0, 1,
-0.5373344, 0.7604908, -0.4332525, 0.345098, 1, 0, 1,
-0.5349471, -0.8935034, -4.767594, 0.3372549, 1, 0, 1,
-0.5267069, -0.7207994, -4.542757, 0.3333333, 1, 0, 1,
-0.5213104, -0.8629359, -3.467235, 0.3254902, 1, 0, 1,
-0.5190619, 0.6257534, -0.5663991, 0.3215686, 1, 0, 1,
-0.5177125, -1.140278, -3.492134, 0.3137255, 1, 0, 1,
-0.5174956, 0.4578962, -0.6969571, 0.3098039, 1, 0, 1,
-0.5139967, -0.2818532, -1.636412, 0.3019608, 1, 0, 1,
-0.5127913, -1.588982, -4.705098, 0.2941177, 1, 0, 1,
-0.5120243, 2.75688, 0.3803634, 0.2901961, 1, 0, 1,
-0.5115006, 0.1624809, -0.1119069, 0.282353, 1, 0, 1,
-0.5056463, -0.4072843, -2.634293, 0.2784314, 1, 0, 1,
-0.5050157, -0.4098693, -2.730494, 0.2705882, 1, 0, 1,
-0.5018584, 0.05894779, 0.5068159, 0.2666667, 1, 0, 1,
-0.5001302, -0.9296845, -1.105237, 0.2588235, 1, 0, 1,
-0.4990271, -1.718766, -3.440489, 0.254902, 1, 0, 1,
-0.4979155, 1.532357, -0.3703119, 0.2470588, 1, 0, 1,
-0.4906614, 0.3587976, -1.128598, 0.2431373, 1, 0, 1,
-0.4899282, -0.2044625, -2.08999, 0.2352941, 1, 0, 1,
-0.485278, -0.9743924, -2.187596, 0.2313726, 1, 0, 1,
-0.4846235, -0.4930711, -2.365526, 0.2235294, 1, 0, 1,
-0.483872, 1.254181, -0.2613424, 0.2196078, 1, 0, 1,
-0.4826123, -1.282635, -2.723476, 0.2117647, 1, 0, 1,
-0.4825552, 0.171484, -0.6379351, 0.2078431, 1, 0, 1,
-0.4772442, 0.9975341, -0.9603755, 0.2, 1, 0, 1,
-0.4751741, -0.6676242, -2.436097, 0.1921569, 1, 0, 1,
-0.4727056, 0.1013722, -4.049139, 0.1882353, 1, 0, 1,
-0.4712821, -0.9805614, -2.264801, 0.1803922, 1, 0, 1,
-0.4685471, 0.2026026, -0.952182, 0.1764706, 1, 0, 1,
-0.4664023, 0.1215688, -0.7711574, 0.1686275, 1, 0, 1,
-0.4659049, 2.828725, 0.0321802, 0.1647059, 1, 0, 1,
-0.463467, -1.24964, -3.365863, 0.1568628, 1, 0, 1,
-0.4613893, 0.5238957, -2.119567, 0.1529412, 1, 0, 1,
-0.4589738, 1.086321, -0.4504521, 0.145098, 1, 0, 1,
-0.4560201, -0.4022927, -3.519653, 0.1411765, 1, 0, 1,
-0.4559864, 1.571942, -0.8980022, 0.1333333, 1, 0, 1,
-0.4549871, -1.213213, -2.634504, 0.1294118, 1, 0, 1,
-0.4522932, -1.161762, -4.099826, 0.1215686, 1, 0, 1,
-0.4468891, -0.6884192, -4.112173, 0.1176471, 1, 0, 1,
-0.4424637, -0.2389598, -2.027261, 0.1098039, 1, 0, 1,
-0.4405662, -0.3980158, -2.76295, 0.1058824, 1, 0, 1,
-0.4324915, 3.243256, -0.07471748, 0.09803922, 1, 0, 1,
-0.4315518, 0.8596525, -0.1393604, 0.09019608, 1, 0, 1,
-0.4311004, 1.966388, -1.410068, 0.08627451, 1, 0, 1,
-0.429761, -0.7440947, -0.7094669, 0.07843138, 1, 0, 1,
-0.418901, 0.8753513, -1.867465, 0.07450981, 1, 0, 1,
-0.4173155, -1.017946, -4.555955, 0.06666667, 1, 0, 1,
-0.4165331, -1.074829, -2.849426, 0.0627451, 1, 0, 1,
-0.4149558, -0.3217653, -0.1676109, 0.05490196, 1, 0, 1,
-0.414286, -0.2324278, -4.330218, 0.05098039, 1, 0, 1,
-0.4048092, 0.3636934, 0.8702123, 0.04313726, 1, 0, 1,
-0.4038944, -0.189278, 0.2487189, 0.03921569, 1, 0, 1,
-0.4035759, -0.1626112, -1.348696, 0.03137255, 1, 0, 1,
-0.4032691, -0.03903139, -2.121678, 0.02745098, 1, 0, 1,
-0.4017316, 0.4659636, -1.156483, 0.01960784, 1, 0, 1,
-0.401552, -0.8758538, -6.43435, 0.01568628, 1, 0, 1,
-0.3995373, 0.9900618, 1.024714, 0.007843138, 1, 0, 1,
-0.39701, 0.1315674, -1.926449, 0.003921569, 1, 0, 1,
-0.3950463, 0.09932824, -1.491783, 0, 1, 0.003921569, 1,
-0.3948878, 0.7305028, -0.3640052, 0, 1, 0.01176471, 1,
-0.389852, 0.1610136, -1.040116, 0, 1, 0.01568628, 1,
-0.3849356, 0.331389, 2.369147, 0, 1, 0.02352941, 1,
-0.3803654, -0.5193343, -2.618957, 0, 1, 0.02745098, 1,
-0.3802122, -0.565807, -2.029999, 0, 1, 0.03529412, 1,
-0.3783947, 0.09480402, 0.8624906, 0, 1, 0.03921569, 1,
-0.3764183, 2.58935, -0.9052044, 0, 1, 0.04705882, 1,
-0.375926, -0.1625868, -1.270691, 0, 1, 0.05098039, 1,
-0.3727573, 0.7634945, -0.5158579, 0, 1, 0.05882353, 1,
-0.3720606, -0.3175481, -1.244903, 0, 1, 0.0627451, 1,
-0.3684295, 1.167692, 1.833139, 0, 1, 0.07058824, 1,
-0.3680611, 0.7497667, 0.9649209, 0, 1, 0.07450981, 1,
-0.3637093, 0.9184838, -0.06252358, 0, 1, 0.08235294, 1,
-0.3632268, -0.8060367, -3.417071, 0, 1, 0.08627451, 1,
-0.3627525, 0.8795031, 1.014941, 0, 1, 0.09411765, 1,
-0.3612286, 1.979136, -1.005553, 0, 1, 0.1019608, 1,
-0.3583717, 1.372753, 0.02765948, 0, 1, 0.1058824, 1,
-0.3552253, -0.2907446, -3.008098, 0, 1, 0.1137255, 1,
-0.3521915, 0.9433106, 0.03165859, 0, 1, 0.1176471, 1,
-0.3500171, -1.103605, -2.077485, 0, 1, 0.1254902, 1,
-0.3487333, 0.668884, -1.857352, 0, 1, 0.1294118, 1,
-0.3482836, -0.9843579, -2.590005, 0, 1, 0.1372549, 1,
-0.3417988, -2.24686, -2.771624, 0, 1, 0.1411765, 1,
-0.3404351, -0.6095031, -2.986407, 0, 1, 0.1490196, 1,
-0.3357925, 0.305475, -0.8572599, 0, 1, 0.1529412, 1,
-0.335679, -0.6115176, -2.399992, 0, 1, 0.1607843, 1,
-0.3328732, 1.285798, 0.03311267, 0, 1, 0.1647059, 1,
-0.3322886, 0.08870946, -2.198875, 0, 1, 0.172549, 1,
-0.3263079, 0.06750324, -0.3623145, 0, 1, 0.1764706, 1,
-0.3243679, 1.405422, 0.1665456, 0, 1, 0.1843137, 1,
-0.3203231, 0.8253561, -0.308295, 0, 1, 0.1882353, 1,
-0.3191546, 0.3027174, -2.212596, 0, 1, 0.1960784, 1,
-0.3189952, 0.6849654, -0.07373235, 0, 1, 0.2039216, 1,
-0.3121476, 0.04443588, -1.502485, 0, 1, 0.2078431, 1,
-0.3115038, 1.460245, 0.7669572, 0, 1, 0.2156863, 1,
-0.3040148, 0.4433642, -1.17297, 0, 1, 0.2196078, 1,
-0.2998318, -0.00422168, -2.62626, 0, 1, 0.227451, 1,
-0.2977422, 0.165492, -1.345434, 0, 1, 0.2313726, 1,
-0.2890037, -0.8158327, -1.614261, 0, 1, 0.2392157, 1,
-0.2859143, -0.9241093, -1.810905, 0, 1, 0.2431373, 1,
-0.2814153, 1.228473, -0.6291652, 0, 1, 0.2509804, 1,
-0.2804992, -0.2302899, -2.695679, 0, 1, 0.254902, 1,
-0.2797401, -0.08269082, -1.836386, 0, 1, 0.2627451, 1,
-0.2794084, 1.470566, 0.2314487, 0, 1, 0.2666667, 1,
-0.2779227, -1.145012, -1.748061, 0, 1, 0.2745098, 1,
-0.2741745, 1.383058, -0.8284917, 0, 1, 0.2784314, 1,
-0.2733113, -1.803074, -3.020463, 0, 1, 0.2862745, 1,
-0.2726695, 0.420341, 0.2163849, 0, 1, 0.2901961, 1,
-0.2696419, 1.002898, -0.8804483, 0, 1, 0.2980392, 1,
-0.262394, 0.04553872, -0.7295828, 0, 1, 0.3058824, 1,
-0.2623359, -0.938715, -2.477703, 0, 1, 0.3098039, 1,
-0.2592654, 1.05297, 1.416219, 0, 1, 0.3176471, 1,
-0.2591917, -1.276434, -2.719308, 0, 1, 0.3215686, 1,
-0.2549745, 0.5229382, 1.197741, 0, 1, 0.3294118, 1,
-0.2495811, 0.00101686, -3.025743, 0, 1, 0.3333333, 1,
-0.2427277, 0.5206581, -1.585992, 0, 1, 0.3411765, 1,
-0.2397852, -0.08459084, -2.602968, 0, 1, 0.345098, 1,
-0.2375159, -1.427822, -4.201556, 0, 1, 0.3529412, 1,
-0.2346313, -1.698323, -3.482519, 0, 1, 0.3568628, 1,
-0.2342741, 2.851585, -0.1315526, 0, 1, 0.3647059, 1,
-0.2331578, 0.3295026, 0.02394145, 0, 1, 0.3686275, 1,
-0.2324741, -0.7550795, -3.514744, 0, 1, 0.3764706, 1,
-0.2323287, -0.5658863, -2.738039, 0, 1, 0.3803922, 1,
-0.2316251, 1.984357, -0.9442542, 0, 1, 0.3882353, 1,
-0.2284453, 1.202207, 0.7654296, 0, 1, 0.3921569, 1,
-0.2284067, 0.4408098, -0.6604292, 0, 1, 0.4, 1,
-0.2248355, -0.1439916, -2.478032, 0, 1, 0.4078431, 1,
-0.2242611, 0.6831266, 0.9857463, 0, 1, 0.4117647, 1,
-0.2239641, 0.7491931, 0.742241, 0, 1, 0.4196078, 1,
-0.2224311, 0.6620348, 2.369782, 0, 1, 0.4235294, 1,
-0.2221055, -0.1552709, -2.16692, 0, 1, 0.4313726, 1,
-0.2202152, 0.2823093, -0.2223943, 0, 1, 0.4352941, 1,
-0.211577, 0.2481263, 1.201132, 0, 1, 0.4431373, 1,
-0.2106314, -0.6740527, -3.36238, 0, 1, 0.4470588, 1,
-0.2105772, 0.5591087, -0.2064908, 0, 1, 0.454902, 1,
-0.2079612, -0.1747194, -3.090743, 0, 1, 0.4588235, 1,
-0.2062788, 0.7478811, 0.9243591, 0, 1, 0.4666667, 1,
-0.200709, 0.9602883, -0.2336569, 0, 1, 0.4705882, 1,
-0.1977644, 1.257502, 0.8351253, 0, 1, 0.4784314, 1,
-0.1976787, 2.397297, -1.677234, 0, 1, 0.4823529, 1,
-0.1971758, -0.6169565, -1.686048, 0, 1, 0.4901961, 1,
-0.1923924, -0.589896, -1.793126, 0, 1, 0.4941176, 1,
-0.1910418, -0.6470336, -4.772234, 0, 1, 0.5019608, 1,
-0.1816252, 1.148864, 0.1951687, 0, 1, 0.509804, 1,
-0.179832, 2.600468, -0.2521619, 0, 1, 0.5137255, 1,
-0.1792434, 0.5111558, 0.4797503, 0, 1, 0.5215687, 1,
-0.1777864, 0.8982924, 1.98167, 0, 1, 0.5254902, 1,
-0.1755968, 1.03152, 0.1579497, 0, 1, 0.5333334, 1,
-0.1718786, 1.263403, -0.3018677, 0, 1, 0.5372549, 1,
-0.1701438, -0.9555149, -3.848513, 0, 1, 0.5450981, 1,
-0.1643351, 0.9019741, 0.3004089, 0, 1, 0.5490196, 1,
-0.1633778, 0.4010196, 1.066828, 0, 1, 0.5568628, 1,
-0.1629075, -0.2537153, -3.018454, 0, 1, 0.5607843, 1,
-0.1578151, 2.962048, -1.393515, 0, 1, 0.5686275, 1,
-0.1561683, 1.261261, -0.6517097, 0, 1, 0.572549, 1,
-0.1413043, -0.9040668, -2.32102, 0, 1, 0.5803922, 1,
-0.140708, 1.330908, 0.9025412, 0, 1, 0.5843138, 1,
-0.1406394, 0.5087733, 0.5653908, 0, 1, 0.5921569, 1,
-0.1334439, 0.1203918, -1.385852, 0, 1, 0.5960785, 1,
-0.1311332, 1.950741, 0.602606, 0, 1, 0.6039216, 1,
-0.130156, 0.165913, -1.121512, 0, 1, 0.6117647, 1,
-0.1291078, -0.5651159, -1.03363, 0, 1, 0.6156863, 1,
-0.1269629, -0.03072053, 1.001582, 0, 1, 0.6235294, 1,
-0.1223058, 1.17926, -0.1032482, 0, 1, 0.627451, 1,
-0.1216197, -0.9280684, -3.763147, 0, 1, 0.6352941, 1,
-0.1214079, 0.1199578, -1.560196, 0, 1, 0.6392157, 1,
-0.1199956, -0.3830389, -4.349925, 0, 1, 0.6470588, 1,
-0.118535, 0.5296996, 0.07799038, 0, 1, 0.6509804, 1,
-0.1177413, 1.216481, 0.7596504, 0, 1, 0.6588235, 1,
-0.1177316, 0.6283504, -1.303789, 0, 1, 0.6627451, 1,
-0.1177265, -0.5744667, -2.962946, 0, 1, 0.6705883, 1,
-0.1170019, 0.2393802, -0.3592623, 0, 1, 0.6745098, 1,
-0.1122605, -0.7429592, -3.767228, 0, 1, 0.682353, 1,
-0.1093838, 1.994638, -1.945981, 0, 1, 0.6862745, 1,
-0.1090503, 0.5433775, -1.214541, 0, 1, 0.6941177, 1,
-0.1073053, -0.9531152, -3.657774, 0, 1, 0.7019608, 1,
-0.1057895, -0.3012323, -4.833386, 0, 1, 0.7058824, 1,
-0.104196, 1.600812, 0.6307499, 0, 1, 0.7137255, 1,
-0.1034858, 0.4730512, 0.3964216, 0, 1, 0.7176471, 1,
-0.1032337, -0.1328367, -2.598492, 0, 1, 0.7254902, 1,
-0.0899056, -1.09062, -3.495779, 0, 1, 0.7294118, 1,
-0.086702, -0.5992889, -3.799988, 0, 1, 0.7372549, 1,
-0.08208966, 0.09391551, -0.3924315, 0, 1, 0.7411765, 1,
-0.08061109, 0.6068843, 1.195357, 0, 1, 0.7490196, 1,
-0.08053089, -0.7627095, -2.464661, 0, 1, 0.7529412, 1,
-0.07678452, 0.2411951, 0.07146375, 0, 1, 0.7607843, 1,
-0.07596125, 1.619862, -0.170447, 0, 1, 0.7647059, 1,
-0.07314287, -1.124171, -5.035722, 0, 1, 0.772549, 1,
-0.07308258, 0.1855425, 0.8741449, 0, 1, 0.7764706, 1,
-0.07192144, -1.771148, -3.240275, 0, 1, 0.7843137, 1,
-0.07190803, -0.6358819, -3.612487, 0, 1, 0.7882353, 1,
-0.07019523, -0.5957341, -4.247139, 0, 1, 0.7960784, 1,
-0.06926821, 0.3968109, -1.037255, 0, 1, 0.8039216, 1,
-0.0683987, 2.384881, 1.073986, 0, 1, 0.8078431, 1,
-0.06525788, 0.4705406, -0.6825492, 0, 1, 0.8156863, 1,
-0.06495292, 0.1606777, -0.1190153, 0, 1, 0.8196079, 1,
-0.06485808, -0.1514221, -1.854473, 0, 1, 0.827451, 1,
-0.06453744, 0.2738765, -0.08755502, 0, 1, 0.8313726, 1,
-0.06094233, -0.8593742, -2.781729, 0, 1, 0.8392157, 1,
-0.05859329, 0.8036875, -0.05870547, 0, 1, 0.8431373, 1,
-0.05637523, -1.09068, -4.873798, 0, 1, 0.8509804, 1,
-0.05373469, -0.5799184, -3.215051, 0, 1, 0.854902, 1,
-0.05120334, 0.1213309, -0.6327716, 0, 1, 0.8627451, 1,
-0.042507, -0.9431695, -4.198821, 0, 1, 0.8666667, 1,
-0.03959469, -0.5571253, -2.593915, 0, 1, 0.8745098, 1,
-0.03682387, 0.0687858, 0.3992243, 0, 1, 0.8784314, 1,
-0.03675862, -0.3523376, -3.012901, 0, 1, 0.8862745, 1,
-0.03608272, -0.5090802, -2.095622, 0, 1, 0.8901961, 1,
-0.03364544, 1.238785, -1.123556, 0, 1, 0.8980392, 1,
-0.03341458, -1.622184, -1.733221, 0, 1, 0.9058824, 1,
-0.03267151, 2.578533, 2.087762, 0, 1, 0.9098039, 1,
-0.03265188, -1.222419, -4.282197, 0, 1, 0.9176471, 1,
-0.03095256, 1.725778, 1.309733, 0, 1, 0.9215686, 1,
-0.0299974, 0.6892015, -0.576425, 0, 1, 0.9294118, 1,
-0.0284768, -1.009066, -3.433174, 0, 1, 0.9333333, 1,
-0.02796713, -0.1969606, -3.65234, 0, 1, 0.9411765, 1,
-0.02543506, 0.2598009, 0.2653308, 0, 1, 0.945098, 1,
-0.02521911, -1.436872, -2.361657, 0, 1, 0.9529412, 1,
-0.02360539, 0.3129581, 0.3803255, 0, 1, 0.9568627, 1,
-0.02190817, 0.7580202, 1.140886, 0, 1, 0.9647059, 1,
-0.01443712, 1.366664, 1.083852, 0, 1, 0.9686275, 1,
-0.01409602, 1.121399, -0.5910534, 0, 1, 0.9764706, 1,
-0.005127844, 0.2602318, 0.9750912, 0, 1, 0.9803922, 1,
0.00204367, 1.300089, 0.7110744, 0, 1, 0.9882353, 1,
0.007731895, -0.07216424, 4.88801, 0, 1, 0.9921569, 1,
0.00964143, -0.1899634, 3.14964, 0, 1, 1, 1,
0.0109612, 1.882979, 1.453968, 0, 0.9921569, 1, 1,
0.01283391, 2.120953, 0.6486816, 0, 0.9882353, 1, 1,
0.01653445, 0.5037337, 1.441095, 0, 0.9803922, 1, 1,
0.01656268, 0.1562386, -1.413002, 0, 0.9764706, 1, 1,
0.01763885, 0.960697, -0.4866186, 0, 0.9686275, 1, 1,
0.01940397, 0.2002046, 0.916701, 0, 0.9647059, 1, 1,
0.01972503, 0.1483554, -0.3612567, 0, 0.9568627, 1, 1,
0.02018334, 1.070968, -0.3262762, 0, 0.9529412, 1, 1,
0.02599738, -0.06574925, 3.229054, 0, 0.945098, 1, 1,
0.03014806, 1.446936, 0.8670464, 0, 0.9411765, 1, 1,
0.03045037, -1.353981, 4.329786, 0, 0.9333333, 1, 1,
0.03598107, -0.907629, 3.587079, 0, 0.9294118, 1, 1,
0.03793615, -0.3540082, 2.698602, 0, 0.9215686, 1, 1,
0.0386856, -0.2552427, 3.773948, 0, 0.9176471, 1, 1,
0.04076834, -1.395693, 3.117265, 0, 0.9098039, 1, 1,
0.04217266, -1.901323, 4.357135, 0, 0.9058824, 1, 1,
0.04562983, 0.2520005, 0.718574, 0, 0.8980392, 1, 1,
0.04990282, -0.5255275, 4.647641, 0, 0.8901961, 1, 1,
0.05310781, 1.407297, -2.345476, 0, 0.8862745, 1, 1,
0.0556352, 0.05633188, 2.058601, 0, 0.8784314, 1, 1,
0.06155868, -0.4604285, 4.454671, 0, 0.8745098, 1, 1,
0.06200871, 0.154644, -0.1144906, 0, 0.8666667, 1, 1,
0.06493312, 1.2762, 1.194971, 0, 0.8627451, 1, 1,
0.0669027, 1.648321, -1.226892, 0, 0.854902, 1, 1,
0.07155422, 1.038818, 0.4869053, 0, 0.8509804, 1, 1,
0.07290448, -1.233888, 2.661755, 0, 0.8431373, 1, 1,
0.07734463, 0.2721134, 0.08029936, 0, 0.8392157, 1, 1,
0.07803766, 1.571689, -0.4509395, 0, 0.8313726, 1, 1,
0.07882115, -1.917498, 4.285498, 0, 0.827451, 1, 1,
0.07935593, -1.268196, 2.232199, 0, 0.8196079, 1, 1,
0.08201329, 1.100194, 1.099288, 0, 0.8156863, 1, 1,
0.08299029, -0.0900667, 2.44257, 0, 0.8078431, 1, 1,
0.09092315, -0.1036029, 3.590266, 0, 0.8039216, 1, 1,
0.09265307, 0.5404332, 0.1249379, 0, 0.7960784, 1, 1,
0.09405481, 0.1500553, 1.479691, 0, 0.7882353, 1, 1,
0.0951741, 0.4247528, -0.4061175, 0, 0.7843137, 1, 1,
0.09694527, -1.25481, 3.690009, 0, 0.7764706, 1, 1,
0.1069024, 0.4051153, -0.2318507, 0, 0.772549, 1, 1,
0.1089976, -0.4371476, 3.151087, 0, 0.7647059, 1, 1,
0.1122574, 0.3710417, 0.3607482, 0, 0.7607843, 1, 1,
0.1138826, -0.2103084, 3.228217, 0, 0.7529412, 1, 1,
0.1205351, 0.7649518, -2.02341, 0, 0.7490196, 1, 1,
0.1205622, 1.576325, -0.02732171, 0, 0.7411765, 1, 1,
0.1240894, 0.3002701, 0.3529159, 0, 0.7372549, 1, 1,
0.1272886, 0.6055356, -0.7029308, 0, 0.7294118, 1, 1,
0.1304049, -0.1903009, 3.637007, 0, 0.7254902, 1, 1,
0.1326482, -0.1893969, 1.898044, 0, 0.7176471, 1, 1,
0.132996, -0.2388184, 0.9614868, 0, 0.7137255, 1, 1,
0.1400161, -0.7660689, 3.479094, 0, 0.7058824, 1, 1,
0.140668, 0.3998192, -0.3150954, 0, 0.6980392, 1, 1,
0.1432134, 0.8199605, 1.57855, 0, 0.6941177, 1, 1,
0.1444652, -0.3395093, 2.349338, 0, 0.6862745, 1, 1,
0.1475437, -1.811968, 3.141292, 0, 0.682353, 1, 1,
0.148529, -1.600141, 3.46723, 0, 0.6745098, 1, 1,
0.1502059, -2.146912, 5.018704, 0, 0.6705883, 1, 1,
0.155081, 0.1740369, -0.1014658, 0, 0.6627451, 1, 1,
0.1554527, -0.544531, 2.182532, 0, 0.6588235, 1, 1,
0.1694713, 0.2724278, 2.198299, 0, 0.6509804, 1, 1,
0.1699691, -0.212613, 2.559207, 0, 0.6470588, 1, 1,
0.1708625, 1.024935, -0.3218079, 0, 0.6392157, 1, 1,
0.1713582, -0.8398237, 4.065454, 0, 0.6352941, 1, 1,
0.1751859, 0.4934197, 0.180837, 0, 0.627451, 1, 1,
0.1765641, 1.103131, -0.513006, 0, 0.6235294, 1, 1,
0.1767151, -0.8424599, 3.154071, 0, 0.6156863, 1, 1,
0.1770837, 1.251304, 1.460476, 0, 0.6117647, 1, 1,
0.1781495, 1.741094, -0.2328827, 0, 0.6039216, 1, 1,
0.1796604, -0.7813024, 1.727301, 0, 0.5960785, 1, 1,
0.1845063, -0.3354527, 3.255849, 0, 0.5921569, 1, 1,
0.1884126, 0.6117849, 0.2662118, 0, 0.5843138, 1, 1,
0.1918819, -0.07588497, 1.720889, 0, 0.5803922, 1, 1,
0.1922446, -1.257039, 3.75361, 0, 0.572549, 1, 1,
0.193765, 0.06235855, 2.194516, 0, 0.5686275, 1, 1,
0.1949132, 0.8624184, 0.4245025, 0, 0.5607843, 1, 1,
0.1954765, 0.2839834, 1.087417, 0, 0.5568628, 1, 1,
0.1988578, -1.807813, 1.391957, 0, 0.5490196, 1, 1,
0.199047, 0.3593418, 0.6031954, 0, 0.5450981, 1, 1,
0.1991553, 0.8098366, -0.9541801, 0, 0.5372549, 1, 1,
0.1995007, 0.5275933, 1.135853, 0, 0.5333334, 1, 1,
0.2008469, 0.1001035, 0.3667137, 0, 0.5254902, 1, 1,
0.2019908, 0.4839482, 0.8814794, 0, 0.5215687, 1, 1,
0.2044045, 0.4174755, 0.7837211, 0, 0.5137255, 1, 1,
0.2054089, 1.958318, -0.611566, 0, 0.509804, 1, 1,
0.2074833, 0.3905536, 1.034048, 0, 0.5019608, 1, 1,
0.20922, 0.7213869, -1.160334, 0, 0.4941176, 1, 1,
0.2109026, -0.4733002, 3.073786, 0, 0.4901961, 1, 1,
0.2114336, -0.04903813, 1.979924, 0, 0.4823529, 1, 1,
0.2118315, -0.8490371, 1.411279, 0, 0.4784314, 1, 1,
0.2138246, 0.8623818, -0.2804833, 0, 0.4705882, 1, 1,
0.2186692, -0.09557585, 3.009031, 0, 0.4666667, 1, 1,
0.2241266, 0.3767363, 0.6594964, 0, 0.4588235, 1, 1,
0.2271658, -0.3315321, 2.50812, 0, 0.454902, 1, 1,
0.2280673, -0.07006647, 1.233375, 0, 0.4470588, 1, 1,
0.2298565, -0.7082114, 1.477289, 0, 0.4431373, 1, 1,
0.2309224, -0.3881257, 4.213186, 0, 0.4352941, 1, 1,
0.2342673, 0.3312825, 1.491984, 0, 0.4313726, 1, 1,
0.2355124, -1.024416, 4.692464, 0, 0.4235294, 1, 1,
0.2380341, 0.08531064, 0.315121, 0, 0.4196078, 1, 1,
0.2387427, -0.3161702, 2.917049, 0, 0.4117647, 1, 1,
0.2439317, 0.6204029, 1.125095, 0, 0.4078431, 1, 1,
0.2466462, -0.4387829, 1.778318, 0, 0.4, 1, 1,
0.249203, 1.621626, 0.6154938, 0, 0.3921569, 1, 1,
0.2493903, 0.3517011, 0.1936168, 0, 0.3882353, 1, 1,
0.250199, -0.1706315, 2.221866, 0, 0.3803922, 1, 1,
0.2544491, 0.04874782, 2.042064, 0, 0.3764706, 1, 1,
0.2604949, 1.246319, 0.5009398, 0, 0.3686275, 1, 1,
0.2611246, -0.7617014, 2.822652, 0, 0.3647059, 1, 1,
0.2612914, 0.8832356, -1.027303, 0, 0.3568628, 1, 1,
0.2643261, 1.291675, -0.02771794, 0, 0.3529412, 1, 1,
0.2649834, 1.507364, 0.8687417, 0, 0.345098, 1, 1,
0.2650429, -0.8254583, 2.061945, 0, 0.3411765, 1, 1,
0.2709099, -0.02284597, 1.693105, 0, 0.3333333, 1, 1,
0.2790339, 0.2155726, -0.2065939, 0, 0.3294118, 1, 1,
0.2828721, 0.1347926, -0.8742216, 0, 0.3215686, 1, 1,
0.2838371, -2.577323, 3.046287, 0, 0.3176471, 1, 1,
0.2847573, 0.1388013, -1.479997, 0, 0.3098039, 1, 1,
0.2892462, 0.9069816, 1.759814, 0, 0.3058824, 1, 1,
0.2909238, 1.21563, -0.3554066, 0, 0.2980392, 1, 1,
0.2975867, 1.0203, 0.3952708, 0, 0.2901961, 1, 1,
0.2999933, 0.8835887, -0.09901088, 0, 0.2862745, 1, 1,
0.3089136, -1.707352, 3.062209, 0, 0.2784314, 1, 1,
0.3127051, -0.8861702, 1.844863, 0, 0.2745098, 1, 1,
0.3144607, -0.1076438, 2.020432, 0, 0.2666667, 1, 1,
0.3186499, -1.670436, 3.062336, 0, 0.2627451, 1, 1,
0.3206451, -1.834397, 2.713046, 0, 0.254902, 1, 1,
0.3233431, -1.668746, 3.994986, 0, 0.2509804, 1, 1,
0.3235218, -0.6758395, 4.384214, 0, 0.2431373, 1, 1,
0.3236797, -0.9686134, 3.296945, 0, 0.2392157, 1, 1,
0.3271326, 0.004550214, 2.112574, 0, 0.2313726, 1, 1,
0.3297683, -0.9575366, 1.832001, 0, 0.227451, 1, 1,
0.3327117, -0.2611067, 3.843586, 0, 0.2196078, 1, 1,
0.3351229, -0.6459516, 1.5471, 0, 0.2156863, 1, 1,
0.3352863, -0.2037793, 2.134826, 0, 0.2078431, 1, 1,
0.3359638, 2.590228, 1.615211, 0, 0.2039216, 1, 1,
0.3394843, -0.8497865, 2.415111, 0, 0.1960784, 1, 1,
0.3413234, 0.9349898, -1.262557, 0, 0.1882353, 1, 1,
0.3416095, -0.3773042, 3.118095, 0, 0.1843137, 1, 1,
0.3420975, -0.1192097, 2.41907, 0, 0.1764706, 1, 1,
0.3430468, 1.038645, -0.3126481, 0, 0.172549, 1, 1,
0.3484623, -0.5380673, 2.056565, 0, 0.1647059, 1, 1,
0.3512372, -0.4291552, 4.73945, 0, 0.1607843, 1, 1,
0.3523439, -0.9062403, 2.053969, 0, 0.1529412, 1, 1,
0.3527521, -0.3605467, 2.616662, 0, 0.1490196, 1, 1,
0.3528033, 0.5662858, 1.632805, 0, 0.1411765, 1, 1,
0.3544429, 0.454955, -0.3788649, 0, 0.1372549, 1, 1,
0.3544782, -0.4388762, 5.00784, 0, 0.1294118, 1, 1,
0.3553887, -0.4279974, 1.386788, 0, 0.1254902, 1, 1,
0.3566448, 0.6661029, 1.850985, 0, 0.1176471, 1, 1,
0.3672735, 1.220561, -0.1927291, 0, 0.1137255, 1, 1,
0.3699876, 0.3863365, 1.68113, 0, 0.1058824, 1, 1,
0.3735977, -0.7058654, 1.923263, 0, 0.09803922, 1, 1,
0.3780797, -1.9163, 3.475345, 0, 0.09411765, 1, 1,
0.3781405, 2.718871, 0.5802603, 0, 0.08627451, 1, 1,
0.3794544, 0.09625838, 1.164224, 0, 0.08235294, 1, 1,
0.383476, 0.3071219, 1.989759, 0, 0.07450981, 1, 1,
0.3848757, 0.07189407, 2.296422, 0, 0.07058824, 1, 1,
0.3864478, 0.1040481, 1.062317, 0, 0.0627451, 1, 1,
0.3865715, 0.3564042, 0.3042381, 0, 0.05882353, 1, 1,
0.3877759, 0.3969658, -0.5246779, 0, 0.05098039, 1, 1,
0.3921291, -0.6574164, 4.234461, 0, 0.04705882, 1, 1,
0.393313, 1.312583, 0.3617324, 0, 0.03921569, 1, 1,
0.3962893, 0.7401146, -0.4827463, 0, 0.03529412, 1, 1,
0.3964866, 0.05746621, 0.8438707, 0, 0.02745098, 1, 1,
0.3969941, 1.183685, 2.8694, 0, 0.02352941, 1, 1,
0.4051101, 0.483174, 0.2001325, 0, 0.01568628, 1, 1,
0.4051123, -2.412504, 3.474391, 0, 0.01176471, 1, 1,
0.4089836, 0.4279562, 2.052795, 0, 0.003921569, 1, 1,
0.413299, -2.683852, 2.603026, 0.003921569, 0, 1, 1,
0.4172207, 0.3193006, -0.3951064, 0.007843138, 0, 1, 1,
0.4198621, 0.9274973, -1.165359, 0.01568628, 0, 1, 1,
0.420878, -1.06086, 3.159415, 0.01960784, 0, 1, 1,
0.4255609, -1.75272, 3.012078, 0.02745098, 0, 1, 1,
0.4273263, -0.7086717, 0.7139737, 0.03137255, 0, 1, 1,
0.432392, 0.0472068, 0.6079925, 0.03921569, 0, 1, 1,
0.4330977, 1.059114, -0.08913101, 0.04313726, 0, 1, 1,
0.4405837, 0.4942337, 0.264672, 0.05098039, 0, 1, 1,
0.4407772, 0.9105331, 0.4425408, 0.05490196, 0, 1, 1,
0.4413275, -1.005903, 2.271066, 0.0627451, 0, 1, 1,
0.4451826, -0.01818315, 3.035491, 0.06666667, 0, 1, 1,
0.449646, -1.119955, 3.128082, 0.07450981, 0, 1, 1,
0.4512925, 0.4029136, 0.5073531, 0.07843138, 0, 1, 1,
0.4521545, -2.468486, 4.387632, 0.08627451, 0, 1, 1,
0.4539172, 0.9124355, 1.429225, 0.09019608, 0, 1, 1,
0.4577732, -0.7487419, 4.109138, 0.09803922, 0, 1, 1,
0.4623906, 0.4538622, 0.3778962, 0.1058824, 0, 1, 1,
0.4671716, -1.187162, 2.69556, 0.1098039, 0, 1, 1,
0.4712425, 0.1574208, 0.6795191, 0.1176471, 0, 1, 1,
0.4712495, -0.0503408, 1.411916, 0.1215686, 0, 1, 1,
0.4721612, -0.8170075, 1.455469, 0.1294118, 0, 1, 1,
0.4728127, -0.992717, 4.073501, 0.1333333, 0, 1, 1,
0.4729858, 0.1183159, -0.07940011, 0.1411765, 0, 1, 1,
0.4741634, 1.041505, 0.6125042, 0.145098, 0, 1, 1,
0.4792033, -0.7782618, 2.753059, 0.1529412, 0, 1, 1,
0.4805817, 1.707645, 0.07627536, 0.1568628, 0, 1, 1,
0.4848076, 0.679387, -1.195919, 0.1647059, 0, 1, 1,
0.4952724, -0.3413166, 3.535227, 0.1686275, 0, 1, 1,
0.499971, -1.835505, 2.782319, 0.1764706, 0, 1, 1,
0.5105897, -2.328333, 3.908755, 0.1803922, 0, 1, 1,
0.5107764, -1.169602, 1.829506, 0.1882353, 0, 1, 1,
0.5137994, 0.9188139, 0.4987406, 0.1921569, 0, 1, 1,
0.5170453, -0.498989, 2.826547, 0.2, 0, 1, 1,
0.5347253, -0.5071195, 1.119934, 0.2078431, 0, 1, 1,
0.5363904, 0.2996273, -0.5251719, 0.2117647, 0, 1, 1,
0.5486993, 0.2815421, 2.31753, 0.2196078, 0, 1, 1,
0.5512182, 1.711394, 1.147246, 0.2235294, 0, 1, 1,
0.5526604, 0.3600746, 0.1697087, 0.2313726, 0, 1, 1,
0.5571368, 0.1065619, 0.5373952, 0.2352941, 0, 1, 1,
0.5607863, -0.2090644, 1.530024, 0.2431373, 0, 1, 1,
0.565623, -1.404041, 2.084795, 0.2470588, 0, 1, 1,
0.5661658, 0.08192182, 2.0333, 0.254902, 0, 1, 1,
0.5666841, -0.725454, 3.948326, 0.2588235, 0, 1, 1,
0.5691481, 0.2929952, 0.8289096, 0.2666667, 0, 1, 1,
0.5730798, 0.01693236, 1.447414, 0.2705882, 0, 1, 1,
0.5739118, 0.8812429, 0.3635676, 0.2784314, 0, 1, 1,
0.5755957, -1.186776, 1.645743, 0.282353, 0, 1, 1,
0.5780066, 0.4086313, 0.1125353, 0.2901961, 0, 1, 1,
0.5781816, -2.025296, 2.634818, 0.2941177, 0, 1, 1,
0.5783666, 0.7882736, -0.1172414, 0.3019608, 0, 1, 1,
0.5805914, -0.7499485, 1.786346, 0.3098039, 0, 1, 1,
0.5820433, -1.502495, 1.900324, 0.3137255, 0, 1, 1,
0.5821522, -0.1572556, 1.687368, 0.3215686, 0, 1, 1,
0.5829811, 1.331857, 1.787504, 0.3254902, 0, 1, 1,
0.5836353, -1.928957, 2.773782, 0.3333333, 0, 1, 1,
0.5841832, -1.389029, 2.35392, 0.3372549, 0, 1, 1,
0.5843282, -1.258862, 2.557542, 0.345098, 0, 1, 1,
0.5859434, -1.889603, 1.708992, 0.3490196, 0, 1, 1,
0.5885004, -0.966823, 2.034295, 0.3568628, 0, 1, 1,
0.5989913, -0.3754405, 0.6951126, 0.3607843, 0, 1, 1,
0.6018446, 0.2065839, 2.068126, 0.3686275, 0, 1, 1,
0.6081801, -0.8499895, 1.828224, 0.372549, 0, 1, 1,
0.6082287, 1.244099, 0.4910133, 0.3803922, 0, 1, 1,
0.6178361, 0.9083768, 0.586848, 0.3843137, 0, 1, 1,
0.6182079, 0.2272084, 1.870304, 0.3921569, 0, 1, 1,
0.6206021, -0.06522034, 1.130615, 0.3960784, 0, 1, 1,
0.6227505, -0.05249643, 1.911515, 0.4039216, 0, 1, 1,
0.6253669, -1.615602, 2.940649, 0.4117647, 0, 1, 1,
0.629952, 0.4936299, -0.600018, 0.4156863, 0, 1, 1,
0.6307687, -2.377737, 3.634322, 0.4235294, 0, 1, 1,
0.6364217, 1.317819, -0.9799168, 0.427451, 0, 1, 1,
0.6377005, -0.6668587, 2.600844, 0.4352941, 0, 1, 1,
0.6410247, 0.4752425, 0.2684492, 0.4392157, 0, 1, 1,
0.643672, 0.582081, -0.6662221, 0.4470588, 0, 1, 1,
0.6559881, 0.02717127, 2.166654, 0.4509804, 0, 1, 1,
0.6579284, 0.7686831, -0.131435, 0.4588235, 0, 1, 1,
0.6622252, -0.6486265, 2.420001, 0.4627451, 0, 1, 1,
0.6648583, 0.6256757, 1.514924, 0.4705882, 0, 1, 1,
0.6662259, -1.167388, 3.289055, 0.4745098, 0, 1, 1,
0.670316, -0.4418028, 2.256176, 0.4823529, 0, 1, 1,
0.6710209, -0.8734061, 1.997914, 0.4862745, 0, 1, 1,
0.671454, -0.7869577, 2.268933, 0.4941176, 0, 1, 1,
0.6723782, -1.167884, 1.435854, 0.5019608, 0, 1, 1,
0.6733902, -0.6959203, 2.002318, 0.5058824, 0, 1, 1,
0.6737496, -0.2742423, 1.73998, 0.5137255, 0, 1, 1,
0.6772153, 0.8553328, 0.6591202, 0.5176471, 0, 1, 1,
0.6823847, 1.134289, 0.1520975, 0.5254902, 0, 1, 1,
0.6837754, 1.427714, 0.2435023, 0.5294118, 0, 1, 1,
0.6870068, 0.1999633, 0.6486447, 0.5372549, 0, 1, 1,
0.6876004, 0.1581472, -0.7324576, 0.5411765, 0, 1, 1,
0.694196, 0.3612559, 2.136856, 0.5490196, 0, 1, 1,
0.6954889, -0.4696255, 2.014978, 0.5529412, 0, 1, 1,
0.6967092, 0.2786216, 2.888338, 0.5607843, 0, 1, 1,
0.6969755, 0.8901347, 2.519471, 0.5647059, 0, 1, 1,
0.6995951, -0.1383643, 1.988268, 0.572549, 0, 1, 1,
0.6998261, -1.89279, 3.717927, 0.5764706, 0, 1, 1,
0.7020751, 2.142972, -0.8614209, 0.5843138, 0, 1, 1,
0.7096847, 0.1450638, 1.401286, 0.5882353, 0, 1, 1,
0.7241902, -0.6177639, 1.88581, 0.5960785, 0, 1, 1,
0.7295696, -0.747301, 3.529035, 0.6039216, 0, 1, 1,
0.7301519, -1.949962, 3.543466, 0.6078432, 0, 1, 1,
0.7330557, -0.3805092, 1.421514, 0.6156863, 0, 1, 1,
0.7334716, 0.6130299, 0.522213, 0.6196079, 0, 1, 1,
0.7435498, -0.7861267, 1.080889, 0.627451, 0, 1, 1,
0.7459927, 0.237364, 1.101199, 0.6313726, 0, 1, 1,
0.7464516, 0.4083963, 2.743612, 0.6392157, 0, 1, 1,
0.750997, 0.4731081, 1.181432, 0.6431373, 0, 1, 1,
0.7546307, 0.1733637, 2.427755, 0.6509804, 0, 1, 1,
0.7551629, 1.303484, -0.3938193, 0.654902, 0, 1, 1,
0.7572595, -0.4410212, 1.917488, 0.6627451, 0, 1, 1,
0.7577608, 1.440422, 1.019154, 0.6666667, 0, 1, 1,
0.757778, -1.742509, 3.822961, 0.6745098, 0, 1, 1,
0.7845881, -0.4009801, 3.357894, 0.6784314, 0, 1, 1,
0.7884997, 0.7236075, -0.03430826, 0.6862745, 0, 1, 1,
0.7939669, 0.688514, 1.152121, 0.6901961, 0, 1, 1,
0.7985594, -0.6332983, 3.434413, 0.6980392, 0, 1, 1,
0.7993288, -0.3189619, 2.012711, 0.7058824, 0, 1, 1,
0.8043862, 0.2415707, 1.746075, 0.7098039, 0, 1, 1,
0.8071492, -0.247955, 1.49292, 0.7176471, 0, 1, 1,
0.8075817, 1.215983, 0.04606976, 0.7215686, 0, 1, 1,
0.8130727, -0.6207049, 2.508814, 0.7294118, 0, 1, 1,
0.8254292, 1.205533, 1.518944, 0.7333333, 0, 1, 1,
0.8291712, 0.6007316, 1.366425, 0.7411765, 0, 1, 1,
0.8298447, -0.9283425, 2.250147, 0.7450981, 0, 1, 1,
0.8397178, 0.3230794, 0.7530303, 0.7529412, 0, 1, 1,
0.8401563, -1.975733, 2.207391, 0.7568628, 0, 1, 1,
0.8475909, 1.14588, 0.1773405, 0.7647059, 0, 1, 1,
0.8489062, 0.4857756, 1.917539, 0.7686275, 0, 1, 1,
0.8634385, -0.3463037, 1.568785, 0.7764706, 0, 1, 1,
0.8654386, -0.9313087, 2.243664, 0.7803922, 0, 1, 1,
0.8720459, -0.4831423, 2.320384, 0.7882353, 0, 1, 1,
0.8724082, -0.5893495, 0.9897491, 0.7921569, 0, 1, 1,
0.8758572, -0.05839689, 1.038355, 0.8, 0, 1, 1,
0.8764939, 0.09944763, 2.435737, 0.8078431, 0, 1, 1,
0.8799766, -0.9950781, 1.332973, 0.8117647, 0, 1, 1,
0.880399, 0.7444056, 0.7121272, 0.8196079, 0, 1, 1,
0.8846891, 1.209265, 1.956735, 0.8235294, 0, 1, 1,
0.8871306, -0.3941303, 1.404486, 0.8313726, 0, 1, 1,
0.8874669, 0.5903191, 0.7772816, 0.8352941, 0, 1, 1,
0.8942935, 0.5808924, 0.3745724, 0.8431373, 0, 1, 1,
0.9015319, 1.564903, -0.1307873, 0.8470588, 0, 1, 1,
0.9068133, -0.06190655, 1.627675, 0.854902, 0, 1, 1,
0.9086925, -0.6933302, 0.8816509, 0.8588235, 0, 1, 1,
0.9104565, -0.06205722, 1.178811, 0.8666667, 0, 1, 1,
0.9115694, 0.1181228, 1.046273, 0.8705882, 0, 1, 1,
0.9131395, 0.4113864, 1.688757, 0.8784314, 0, 1, 1,
0.9150373, 0.3421329, 1.817668, 0.8823529, 0, 1, 1,
0.9281185, 0.2153134, 0.3990119, 0.8901961, 0, 1, 1,
0.9289951, 1.031768, 0.6794685, 0.8941177, 0, 1, 1,
0.9295068, 0.08299818, 0.701519, 0.9019608, 0, 1, 1,
0.9438282, 0.7461851, 0.06850779, 0.9098039, 0, 1, 1,
0.9452069, -0.2513927, 1.808711, 0.9137255, 0, 1, 1,
0.9487225, -0.001884813, 1.645358, 0.9215686, 0, 1, 1,
0.9498844, 0.9129642, -0.09256678, 0.9254902, 0, 1, 1,
0.9574233, -1.374952, 2.974093, 0.9333333, 0, 1, 1,
0.9579193, -0.02042219, 0.6163286, 0.9372549, 0, 1, 1,
0.9630765, -0.738513, 2.198728, 0.945098, 0, 1, 1,
0.967925, 0.1268347, 1.191211, 0.9490196, 0, 1, 1,
0.9679899, 0.2273367, 1.389155, 0.9568627, 0, 1, 1,
0.9709211, 0.4955881, 1.808203, 0.9607843, 0, 1, 1,
0.9758054, 1.632321, 0.4027187, 0.9686275, 0, 1, 1,
0.9789599, -1.145535, 3.883223, 0.972549, 0, 1, 1,
0.9792055, 0.9695551, 1.376179, 0.9803922, 0, 1, 1,
0.9817246, -0.8211202, 3.067336, 0.9843137, 0, 1, 1,
0.9891388, -1.776505, 1.936845, 0.9921569, 0, 1, 1,
0.9928147, 0.8251524, 1.850113, 0.9960784, 0, 1, 1,
1.001048, 0.4634531, 1.702849, 1, 0, 0.9960784, 1,
1.003613, -1.509097, 2.281856, 1, 0, 0.9882353, 1,
1.006846, 1.284099, 1.11145, 1, 0, 0.9843137, 1,
1.010178, -1.030783, 1.896699, 1, 0, 0.9764706, 1,
1.010542, 1.491222, 1.504107, 1, 0, 0.972549, 1,
1.01186, -0.7384144, 2.742743, 1, 0, 0.9647059, 1,
1.02308, -0.3647361, 1.576737, 1, 0, 0.9607843, 1,
1.024111, 1.544611, 2.280229, 1, 0, 0.9529412, 1,
1.026194, 0.7161946, 0.5862953, 1, 0, 0.9490196, 1,
1.029697, -1.01196, 2.362776, 1, 0, 0.9411765, 1,
1.033218, 1.435208, -0.5481793, 1, 0, 0.9372549, 1,
1.038639, -0.005022123, 2.392373, 1, 0, 0.9294118, 1,
1.053391, 0.6648589, 1.776698, 1, 0, 0.9254902, 1,
1.060754, -0.4164449, 2.228456, 1, 0, 0.9176471, 1,
1.061028, 0.5112152, 0.6408929, 1, 0, 0.9137255, 1,
1.061217, -0.9393418, 3.50534, 1, 0, 0.9058824, 1,
1.06123, 1.936006, 0.1941667, 1, 0, 0.9019608, 1,
1.06241, -1.698275, 3.232258, 1, 0, 0.8941177, 1,
1.074192, 1.443809, -0.1402857, 1, 0, 0.8862745, 1,
1.080921, -0.7313106, 2.556008, 1, 0, 0.8823529, 1,
1.081564, -0.4398646, 1.550193, 1, 0, 0.8745098, 1,
1.087311, -0.7676044, 2.610836, 1, 0, 0.8705882, 1,
1.089287, -0.6288896, 2.108532, 1, 0, 0.8627451, 1,
1.092326, 0.4075333, 2.01872, 1, 0, 0.8588235, 1,
1.095585, 0.2051948, 2.575071, 1, 0, 0.8509804, 1,
1.099495, 0.8511967, 0.9680517, 1, 0, 0.8470588, 1,
1.101014, 0.8181263, 0.5744723, 1, 0, 0.8392157, 1,
1.103276, 2.299258, 1.620512, 1, 0, 0.8352941, 1,
1.104753, -1.055611, 1.427266, 1, 0, 0.827451, 1,
1.110234, -0.5163302, 1.364352, 1, 0, 0.8235294, 1,
1.118021, 0.4649135, 2.723696, 1, 0, 0.8156863, 1,
1.12587, 0.8399003, 0.9101891, 1, 0, 0.8117647, 1,
1.12855, -1.603998, 2.588392, 1, 0, 0.8039216, 1,
1.131471, -0.02075558, 2.531106, 1, 0, 0.7960784, 1,
1.132513, 0.06334704, 2.49032, 1, 0, 0.7921569, 1,
1.134658, -0.06598742, 2.38556, 1, 0, 0.7843137, 1,
1.143893, 0.772135, 1.333562, 1, 0, 0.7803922, 1,
1.149913, -0.1291499, 2.228861, 1, 0, 0.772549, 1,
1.150705, -1.602397, 0.7822083, 1, 0, 0.7686275, 1,
1.155087, -0.8797656, 3.924726, 1, 0, 0.7607843, 1,
1.1644, 1.023536, 1.597166, 1, 0, 0.7568628, 1,
1.179327, 0.06860039, 1.607693, 1, 0, 0.7490196, 1,
1.179375, 0.6134425, 1.52316, 1, 0, 0.7450981, 1,
1.181945, 0.898711, 0.03409759, 1, 0, 0.7372549, 1,
1.191564, -0.4659834, 1.684179, 1, 0, 0.7333333, 1,
1.193525, 0.8139767, 1.333169, 1, 0, 0.7254902, 1,
1.195233, -1.350306, 1.413404, 1, 0, 0.7215686, 1,
1.198265, -0.2926342, 0.2589637, 1, 0, 0.7137255, 1,
1.198928, -0.8089652, 2.57246, 1, 0, 0.7098039, 1,
1.210129, 0.03267149, 1.585139, 1, 0, 0.7019608, 1,
1.210318, 0.1699738, 0.4634417, 1, 0, 0.6941177, 1,
1.211181, -0.7661346, 3.685089, 1, 0, 0.6901961, 1,
1.218686, -0.3210717, -0.002227321, 1, 0, 0.682353, 1,
1.222058, 0.8872523, -0.07229934, 1, 0, 0.6784314, 1,
1.223658, -0.1466033, 1.799707, 1, 0, 0.6705883, 1,
1.225128, 0.3979229, 0.2961916, 1, 0, 0.6666667, 1,
1.228319, -0.1354095, 1.616128, 1, 0, 0.6588235, 1,
1.229407, 0.7274158, 1.371621, 1, 0, 0.654902, 1,
1.23677, -1.424846, 3.202604, 1, 0, 0.6470588, 1,
1.237845, 0.2724932, 2.956487, 1, 0, 0.6431373, 1,
1.238642, 0.2482243, 2.452447, 1, 0, 0.6352941, 1,
1.240537, 0.5560722, 1.505963, 1, 0, 0.6313726, 1,
1.248287, 0.839341, 0.7979528, 1, 0, 0.6235294, 1,
1.252612, -0.7110523, 2.691604, 1, 0, 0.6196079, 1,
1.258202, 0.4535659, -0.2255939, 1, 0, 0.6117647, 1,
1.259737, 0.7819396, 1.404244, 1, 0, 0.6078432, 1,
1.276548, 0.9056239, -0.089636, 1, 0, 0.6, 1,
1.283562, -0.2070411, 1.856911, 1, 0, 0.5921569, 1,
1.29242, -0.170191, 1.470722, 1, 0, 0.5882353, 1,
1.297934, 1.273157, 0.4169921, 1, 0, 0.5803922, 1,
1.302637, -0.1986736, 1.744994, 1, 0, 0.5764706, 1,
1.303886, 1.996208, -0.03377437, 1, 0, 0.5686275, 1,
1.307567, 1.001432, 0.4065606, 1, 0, 0.5647059, 1,
1.315603, 1.963117, 0.4606734, 1, 0, 0.5568628, 1,
1.317952, -0.6361138, 2.624896, 1, 0, 0.5529412, 1,
1.327528, 1.277335, -0.04659669, 1, 0, 0.5450981, 1,
1.328084, 1.137694, 1.282587, 1, 0, 0.5411765, 1,
1.328592, -1.429206, 1.261588, 1, 0, 0.5333334, 1,
1.328882, -0.01256245, 1.133193, 1, 0, 0.5294118, 1,
1.334472, -0.1264078, 1.722039, 1, 0, 0.5215687, 1,
1.341553, -0.3144261, 1.50144, 1, 0, 0.5176471, 1,
1.344664, 0.4044253, 1.587785, 1, 0, 0.509804, 1,
1.34763, -0.743325, 3.012375, 1, 0, 0.5058824, 1,
1.348817, 2.175553, 0.8840167, 1, 0, 0.4980392, 1,
1.353817, -2.020703, 2.958717, 1, 0, 0.4901961, 1,
1.354096, -0.5095197, 1.835598, 1, 0, 0.4862745, 1,
1.359659, -1.04811, 3.239655, 1, 0, 0.4784314, 1,
1.379429, -0.8757553, 3.16749, 1, 0, 0.4745098, 1,
1.396192, -0.3783556, 2.939063, 1, 0, 0.4666667, 1,
1.399194, 0.6025515, 3.389888, 1, 0, 0.4627451, 1,
1.400382, 0.1827597, 2.006916, 1, 0, 0.454902, 1,
1.403729, 0.7791772, 0.4232115, 1, 0, 0.4509804, 1,
1.405496, 0.5821345, 1.043878, 1, 0, 0.4431373, 1,
1.412498, -0.2670746, 2.104923, 1, 0, 0.4392157, 1,
1.41441, -0.8127463, 0.02634493, 1, 0, 0.4313726, 1,
1.414419, 0.5281709, 1.615419, 1, 0, 0.427451, 1,
1.414981, 1.714773, -1.272107, 1, 0, 0.4196078, 1,
1.418775, -1.089837, 1.767477, 1, 0, 0.4156863, 1,
1.422267, 0.6477894, 2.053176, 1, 0, 0.4078431, 1,
1.429258, 1.273054, 0.3989822, 1, 0, 0.4039216, 1,
1.432159, 1.063655, -0.002552044, 1, 0, 0.3960784, 1,
1.433856, 1.153024, 1.36799, 1, 0, 0.3882353, 1,
1.451481, 0.1076834, 2.128135, 1, 0, 0.3843137, 1,
1.468608, 1.18736, 0.7100885, 1, 0, 0.3764706, 1,
1.473831, 0.3958385, 1.155992, 1, 0, 0.372549, 1,
1.486959, -0.3096454, 1.733138, 1, 0, 0.3647059, 1,
1.490125, -0.3518485, 1.602933, 1, 0, 0.3607843, 1,
1.492172, 1.195195, -0.6693124, 1, 0, 0.3529412, 1,
1.512506, -0.9088077, 3.103504, 1, 0, 0.3490196, 1,
1.548457, -1.026244, 2.95954, 1, 0, 0.3411765, 1,
1.568622, -0.6876235, 1.10444, 1, 0, 0.3372549, 1,
1.574017, 0.462184, 1.160123, 1, 0, 0.3294118, 1,
1.581796, -0.6251622, 1.677278, 1, 0, 0.3254902, 1,
1.592813, -0.5862084, 1.553072, 1, 0, 0.3176471, 1,
1.60193, 0.06334969, 2.041353, 1, 0, 0.3137255, 1,
1.624926, 1.224065, 0.4523275, 1, 0, 0.3058824, 1,
1.62916, -0.8248127, 2.156315, 1, 0, 0.2980392, 1,
1.637694, 0.822827, 1.310985, 1, 0, 0.2941177, 1,
1.6441, 0.006962469, -0.2044758, 1, 0, 0.2862745, 1,
1.662194, 0.3122766, 2.592974, 1, 0, 0.282353, 1,
1.676048, 0.9092463, 2.778788, 1, 0, 0.2745098, 1,
1.680574, 0.7693743, 0.2863898, 1, 0, 0.2705882, 1,
1.68626, 0.9199493, 2.491545, 1, 0, 0.2627451, 1,
1.703454, -0.3601318, 1.793918, 1, 0, 0.2588235, 1,
1.736084, 1.299569, 1.190749, 1, 0, 0.2509804, 1,
1.740286, 0.1811953, 1.659093, 1, 0, 0.2470588, 1,
1.747032, 0.2652287, 1.803214, 1, 0, 0.2392157, 1,
1.781122, 0.2790382, 1.31909, 1, 0, 0.2352941, 1,
1.825541, -0.3551256, 2.576217, 1, 0, 0.227451, 1,
1.828709, -0.3928482, 1.575751, 1, 0, 0.2235294, 1,
1.82894, 0.584389, 0.9014793, 1, 0, 0.2156863, 1,
1.84999, -0.1713468, 3.816582, 1, 0, 0.2117647, 1,
1.850328, -0.1292578, 2.097021, 1, 0, 0.2039216, 1,
1.864926, 1.447401, 0.9265277, 1, 0, 0.1960784, 1,
1.870794, 0.5087929, 1.648095, 1, 0, 0.1921569, 1,
1.883251, 0.9449314, -1.112947, 1, 0, 0.1843137, 1,
1.883826, 0.8775809, 1.372253, 1, 0, 0.1803922, 1,
1.887169, -1.22819, 1.105257, 1, 0, 0.172549, 1,
1.908932, -0.3707101, 2.57595, 1, 0, 0.1686275, 1,
1.950713, -0.6735863, 1.983759, 1, 0, 0.1607843, 1,
1.958761, -0.2182523, 2.676383, 1, 0, 0.1568628, 1,
1.994902, 1.491777, 1.503249, 1, 0, 0.1490196, 1,
2.005738, 1.753698, 0.8568078, 1, 0, 0.145098, 1,
2.026949, 0.8751242, 2.09405, 1, 0, 0.1372549, 1,
2.045542, 0.2084821, 0.616977, 1, 0, 0.1333333, 1,
2.080325, 0.6741337, 0.2890619, 1, 0, 0.1254902, 1,
2.109095, 0.2778409, 1.116244, 1, 0, 0.1215686, 1,
2.111106, 2.118573, 2.998631, 1, 0, 0.1137255, 1,
2.126659, 1.68232, -1.391839, 1, 0, 0.1098039, 1,
2.182211, 0.9902987, 2.022099, 1, 0, 0.1019608, 1,
2.186016, -1.563865, 1.049999, 1, 0, 0.09411765, 1,
2.235828, -1.767212, 2.849425, 1, 0, 0.09019608, 1,
2.253033, 0.3900964, 1.544924, 1, 0, 0.08235294, 1,
2.255356, 1.53178, 0.5476072, 1, 0, 0.07843138, 1,
2.305891, -1.196106, 3.491944, 1, 0, 0.07058824, 1,
2.328627, 0.5872023, 2.316449, 1, 0, 0.06666667, 1,
2.34924, -0.08270381, 2.37857, 1, 0, 0.05882353, 1,
2.383902, -1.302325, 2.486955, 1, 0, 0.05490196, 1,
2.402048, 0.2978486, 1.520048, 1, 0, 0.04705882, 1,
2.419698, -0.3802832, 1.796496, 1, 0, 0.04313726, 1,
2.467355, -1.870671, 1.209392, 1, 0, 0.03529412, 1,
2.490012, 0.3894029, 1.533945, 1, 0, 0.03137255, 1,
2.519156, -0.06018341, 1.382003, 1, 0, 0.02352941, 1,
2.53954, 0.03799358, 3.279874, 1, 0, 0.01960784, 1,
2.605686, -1.031094, 3.573653, 1, 0, 0.01176471, 1,
3.395307, 1.325822, 1.75754, 1, 0, 0.007843138, 1
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
0.167166, -4.129868, -8.375643, 0, -0.5, 0.5, 0.5,
0.167166, -4.129868, -8.375643, 1, -0.5, 0.5, 0.5,
0.167166, -4.129868, -8.375643, 1, 1.5, 0.5, 0.5,
0.167166, -4.129868, -8.375643, 0, 1.5, 0.5, 0.5
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
-4.155315, 0.09100139, -8.375643, 0, -0.5, 0.5, 0.5,
-4.155315, 0.09100139, -8.375643, 1, -0.5, 0.5, 0.5,
-4.155315, 0.09100139, -8.375643, 1, 1.5, 0.5, 0.5,
-4.155315, 0.09100139, -8.375643, 0, 1.5, 0.5, 0.5
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
-4.155315, -4.129868, -0.7078228, 0, -0.5, 0.5, 0.5,
-4.155315, -4.129868, -0.7078228, 1, -0.5, 0.5, 0.5,
-4.155315, -4.129868, -0.7078228, 1, 1.5, 0.5, 0.5,
-4.155315, -4.129868, -0.7078228, 0, 1.5, 0.5, 0.5
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
-3, -3.155821, -6.606146,
3, -3.155821, -6.606146,
-3, -3.155821, -6.606146,
-3, -3.318162, -6.901062,
-2, -3.155821, -6.606146,
-2, -3.318162, -6.901062,
-1, -3.155821, -6.606146,
-1, -3.318162, -6.901062,
0, -3.155821, -6.606146,
0, -3.318162, -6.901062,
1, -3.155821, -6.606146,
1, -3.318162, -6.901062,
2, -3.155821, -6.606146,
2, -3.318162, -6.901062,
3, -3.155821, -6.606146,
3, -3.318162, -6.901062
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
-3, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
-3, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
-3, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
-3, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
-2, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
-2, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
-2, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
-2, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
-1, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
-1, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
-1, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
-1, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
0, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
0, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
0, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
0, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
1, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
1, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
1, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
1, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
2, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
2, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
2, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
2, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5,
3, -3.642844, -7.490894, 0, -0.5, 0.5, 0.5,
3, -3.642844, -7.490894, 1, -0.5, 0.5, 0.5,
3, -3.642844, -7.490894, 1, 1.5, 0.5, 0.5,
3, -3.642844, -7.490894, 0, 1.5, 0.5, 0.5
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
-3.15782, -3, -6.606146,
-3.15782, 3, -6.606146,
-3.15782, -3, -6.606146,
-3.324069, -3, -6.901062,
-3.15782, -2, -6.606146,
-3.324069, -2, -6.901062,
-3.15782, -1, -6.606146,
-3.324069, -1, -6.901062,
-3.15782, 0, -6.606146,
-3.324069, 0, -6.901062,
-3.15782, 1, -6.606146,
-3.324069, 1, -6.901062,
-3.15782, 2, -6.606146,
-3.324069, 2, -6.901062,
-3.15782, 3, -6.606146,
-3.324069, 3, -6.901062
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
-3.656567, -3, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, -3, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, -3, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, -3, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, -2, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, -2, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, -2, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, -2, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, -1, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, -1, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, -1, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, -1, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, 0, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, 0, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, 0, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, 0, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, 1, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, 1, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, 1, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, 1, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, 2, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, 2, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, 2, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, 2, -7.490894, 0, 1.5, 0.5, 0.5,
-3.656567, 3, -7.490894, 0, -0.5, 0.5, 0.5,
-3.656567, 3, -7.490894, 1, -0.5, 0.5, 0.5,
-3.656567, 3, -7.490894, 1, 1.5, 0.5, 0.5,
-3.656567, 3, -7.490894, 0, 1.5, 0.5, 0.5
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
-3.15782, -3.155821, -6,
-3.15782, -3.155821, 4,
-3.15782, -3.155821, -6,
-3.324069, -3.318162, -6,
-3.15782, -3.155821, -4,
-3.324069, -3.318162, -4,
-3.15782, -3.155821, -2,
-3.324069, -3.318162, -2,
-3.15782, -3.155821, 0,
-3.324069, -3.318162, 0,
-3.15782, -3.155821, 2,
-3.324069, -3.318162, 2,
-3.15782, -3.155821, 4,
-3.324069, -3.318162, 4
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
"-6",
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
-3.656567, -3.642844, -6, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -6, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -6, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, -6, 0, 1.5, 0.5, 0.5,
-3.656567, -3.642844, -4, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -4, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -4, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, -4, 0, 1.5, 0.5, 0.5,
-3.656567, -3.642844, -2, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -2, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, -2, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, -2, 0, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 0, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 0, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 0, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 0, 0, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 2, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 2, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 2, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 2, 0, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 4, 0, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 4, 1, -0.5, 0.5, 0.5,
-3.656567, -3.642844, 4, 1, 1.5, 0.5, 0.5,
-3.656567, -3.642844, 4, 0, 1.5, 0.5, 0.5
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
-3.15782, -3.155821, -6.606146,
-3.15782, 3.337823, -6.606146,
-3.15782, -3.155821, 5.1905,
-3.15782, 3.337823, 5.1905,
-3.15782, -3.155821, -6.606146,
-3.15782, -3.155821, 5.1905,
-3.15782, 3.337823, -6.606146,
-3.15782, 3.337823, 5.1905,
-3.15782, -3.155821, -6.606146,
3.492151, -3.155821, -6.606146,
-3.15782, -3.155821, 5.1905,
3.492151, -3.155821, 5.1905,
-3.15782, 3.337823, -6.606146,
3.492151, 3.337823, -6.606146,
-3.15782, 3.337823, 5.1905,
3.492151, 3.337823, 5.1905,
3.492151, -3.155821, -6.606146,
3.492151, 3.337823, -6.606146,
3.492151, -3.155821, 5.1905,
3.492151, 3.337823, 5.1905,
3.492151, -3.155821, -6.606146,
3.492151, -3.155821, 5.1905,
3.492151, 3.337823, -6.606146,
3.492151, 3.337823, 5.1905
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
var radius = 8.019499;
var distance = 35.67966;
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
mvMatrix.translate( -0.167166, -0.09100139, 0.7078228 );
mvMatrix.scale( 1.303891, 1.335281, 0.7350258 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67966);
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
allophanate_dimethyl<-read.table("allophanate_dimethyl.xyz", skip=1)
```

```
## Error in read.table("allophanate_dimethyl.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-allophanate_dimethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
```

```r
y<-allophanate_dimethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
```

```r
z<-allophanate_dimethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
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
-3.060975, -1.1595, -1.161995, 0, 0, 1, 1, 1,
-2.951656, -0.4173912, -0.8487712, 1, 0, 0, 1, 1,
-2.851054, -0.1902222, -2.297989, 1, 0, 0, 1, 1,
-2.728393, -0.3069382, -1.297561, 1, 0, 0, 1, 1,
-2.713196, -0.5739924, -0.3629372, 1, 0, 0, 1, 1,
-2.695255, -1.278964, -2.604742, 1, 0, 0, 1, 1,
-2.662589, -0.3983983, -1.923887, 0, 0, 0, 1, 1,
-2.575475, -1.254092, 0.04835086, 0, 0, 0, 1, 1,
-2.486276, 0.4103915, -2.092204, 0, 0, 0, 1, 1,
-2.40046, 2.063797, -0.2897998, 0, 0, 0, 1, 1,
-2.36714, 0.6576692, -1.729868, 0, 0, 0, 1, 1,
-2.349335, -0.1961111, -1.858445, 0, 0, 0, 1, 1,
-2.342435, 1.515423, -1.129572, 0, 0, 0, 1, 1,
-2.315515, -1.707049, -2.928313, 1, 1, 1, 1, 1,
-2.248349, -0.8378771, -3.777153, 1, 1, 1, 1, 1,
-2.24768, -0.3155186, -1.970219, 1, 1, 1, 1, 1,
-2.149682, -2.064135, -3.872721, 1, 1, 1, 1, 1,
-2.1441, -0.2241351, -2.181309, 1, 1, 1, 1, 1,
-2.138899, 1.482358, 0.7344369, 1, 1, 1, 1, 1,
-2.12154, -0.5678991, 0.2636857, 1, 1, 1, 1, 1,
-2.120353, -0.9144045, -1.744326, 1, 1, 1, 1, 1,
-2.076961, 1.255047, -1.37105, 1, 1, 1, 1, 1,
-2.050294, -1.888824, -2.459023, 1, 1, 1, 1, 1,
-2.035273, 0.9098707, -1.30402, 1, 1, 1, 1, 1,
-2.033393, 0.1073071, -2.268603, 1, 1, 1, 1, 1,
-2.012613, -0.3881688, -0.3103194, 1, 1, 1, 1, 1,
-1.994451, -1.720914, -2.189018, 1, 1, 1, 1, 1,
-1.9795, -0.282893, -1.389909, 1, 1, 1, 1, 1,
-1.935303, 0.7649878, -1.9937, 0, 0, 1, 1, 1,
-1.924946, 1.995623, -0.88908, 1, 0, 0, 1, 1,
-1.909215, 0.1025795, -0.6397048, 1, 0, 0, 1, 1,
-1.898828, 0.1262299, -3.340263, 1, 0, 0, 1, 1,
-1.876325, -0.2230048, -1.956149, 1, 0, 0, 1, 1,
-1.85617, 0.615214, -2.245961, 1, 0, 0, 1, 1,
-1.854841, -1.197347, -3.504761, 0, 0, 0, 1, 1,
-1.854074, -0.7857203, -0.7496932, 0, 0, 0, 1, 1,
-1.826669, -3.061253, -2.637989, 0, 0, 0, 1, 1,
-1.815142, -0.9328532, -2.885466, 0, 0, 0, 1, 1,
-1.812136, -0.03426058, -0.9016117, 0, 0, 0, 1, 1,
-1.803777, 0.7679905, -2.058291, 0, 0, 0, 1, 1,
-1.770761, 0.563353, -1.692782, 0, 0, 0, 1, 1,
-1.768696, -0.6447665, -3.932221, 1, 1, 1, 1, 1,
-1.722622, -0.898863, -1.644479, 1, 1, 1, 1, 1,
-1.679873, 1.31644, -1.530956, 1, 1, 1, 1, 1,
-1.67891, -0.4291848, -2.061468, 1, 1, 1, 1, 1,
-1.674959, 0.4711048, 0.008407979, 1, 1, 1, 1, 1,
-1.67396, -0.1751503, -4.047868, 1, 1, 1, 1, 1,
-1.611632, 1.005729, -1.706084, 1, 1, 1, 1, 1,
-1.595155, -1.256613, -3.264097, 1, 1, 1, 1, 1,
-1.592903, -0.608435, -0.2209839, 1, 1, 1, 1, 1,
-1.586215, -0.0007919202, 0.03479326, 1, 1, 1, 1, 1,
-1.573207, 1.282208, -0.2762833, 1, 1, 1, 1, 1,
-1.572949, -0.07056998, 0.02850247, 1, 1, 1, 1, 1,
-1.551607, -0.1492197, -2.008147, 1, 1, 1, 1, 1,
-1.54542, -0.691388, -2.96951, 1, 1, 1, 1, 1,
-1.544061, -0.5951789, -0.9665858, 1, 1, 1, 1, 1,
-1.544, 1.514937, -1.803608, 0, 0, 1, 1, 1,
-1.535127, 0.5613438, 0.1383534, 1, 0, 0, 1, 1,
-1.512499, -1.188185, -2.132658, 1, 0, 0, 1, 1,
-1.496551, -0.781393, -2.351615, 1, 0, 0, 1, 1,
-1.495436, -0.3609479, -2.132462, 1, 0, 0, 1, 1,
-1.493251, 0.4734843, -2.008398, 1, 0, 0, 1, 1,
-1.492117, -0.01327403, -2.396601, 0, 0, 0, 1, 1,
-1.491132, -0.1285613, -2.200394, 0, 0, 0, 1, 1,
-1.489216, 2.469731, -1.903832, 0, 0, 0, 1, 1,
-1.474083, 0.425263, -2.220917, 0, 0, 0, 1, 1,
-1.464088, 0.7212724, 0.07225238, 0, 0, 0, 1, 1,
-1.462401, 0.2797389, -1.634961, 0, 0, 0, 1, 1,
-1.445443, -0.544162, -2.554074, 0, 0, 0, 1, 1,
-1.443067, 1.572194, -0.694008, 1, 1, 1, 1, 1,
-1.439281, -0.9718137, -1.8111, 1, 1, 1, 1, 1,
-1.431977, 1.247631, -0.08730184, 1, 1, 1, 1, 1,
-1.43149, 0.5427817, -0.1349106, 1, 1, 1, 1, 1,
-1.419595, 1.25383, -0.9952214, 1, 1, 1, 1, 1,
-1.392925, -0.2076802, -0.9838055, 1, 1, 1, 1, 1,
-1.384251, -0.1656373, -1.088239, 1, 1, 1, 1, 1,
-1.377349, 0.4194374, -2.001045, 1, 1, 1, 1, 1,
-1.377054, 1.030983, -0.7791576, 1, 1, 1, 1, 1,
-1.365671, 0.5761583, -2.331294, 1, 1, 1, 1, 1,
-1.353942, -0.2297239, -2.082169, 1, 1, 1, 1, 1,
-1.348936, -1.041647, -2.73938, 1, 1, 1, 1, 1,
-1.346574, 1.25739, -0.03548138, 1, 1, 1, 1, 1,
-1.344534, -0.8555216, -1.917302, 1, 1, 1, 1, 1,
-1.336833, 0.3837295, -1.124999, 1, 1, 1, 1, 1,
-1.334052, 0.5253146, -1.755659, 0, 0, 1, 1, 1,
-1.326652, 0.1046984, -2.676014, 1, 0, 0, 1, 1,
-1.316199, -0.8848218, -1.665067, 1, 0, 0, 1, 1,
-1.309063, 0.3398548, -0.8542398, 1, 0, 0, 1, 1,
-1.305733, -0.6017169, -1.513786, 1, 0, 0, 1, 1,
-1.305503, -0.1801625, -1.365772, 1, 0, 0, 1, 1,
-1.299534, 0.00281009, -0.636741, 0, 0, 0, 1, 1,
-1.298168, -0.01447309, -1.585471, 0, 0, 0, 1, 1,
-1.282498, 1.245784, -0.7604969, 0, 0, 0, 1, 1,
-1.278376, -0.5637789, -2.054702, 0, 0, 0, 1, 1,
-1.27779, 0.7987055, -1.795154, 0, 0, 0, 1, 1,
-1.258815, -0.3128296, -0.6754874, 0, 0, 0, 1, 1,
-1.258277, 0.9484892, 1.156945, 0, 0, 0, 1, 1,
-1.247649, 0.1453851, -1.999674, 1, 1, 1, 1, 1,
-1.238976, -0.1935261, -2.221988, 1, 1, 1, 1, 1,
-1.238293, -1.079207, -2.923776, 1, 1, 1, 1, 1,
-1.229476, -0.9195507, -1.597607, 1, 1, 1, 1, 1,
-1.228303, 0.2717766, -1.343701, 1, 1, 1, 1, 1,
-1.227783, -1.079871, -2.104622, 1, 1, 1, 1, 1,
-1.224459, 1.602687, -1.50919, 1, 1, 1, 1, 1,
-1.203246, 1.297404, 0.0530832, 1, 1, 1, 1, 1,
-1.201783, -0.03070345, -2.255545, 1, 1, 1, 1, 1,
-1.194482, 1.017563, -1.483616, 1, 1, 1, 1, 1,
-1.188727, -0.1794801, -1.688603, 1, 1, 1, 1, 1,
-1.187209, 0.005073295, -1.896312, 1, 1, 1, 1, 1,
-1.167491, -0.3502013, -1.057032, 1, 1, 1, 1, 1,
-1.166736, 0.06893227, -1.435243, 1, 1, 1, 1, 1,
-1.161855, -0.1081126, -1.688369, 1, 1, 1, 1, 1,
-1.158231, -0.4028908, -0.7138997, 0, 0, 1, 1, 1,
-1.152204, -1.608665, -2.335368, 1, 0, 0, 1, 1,
-1.151, 1.749612, 1.486898, 1, 0, 0, 1, 1,
-1.138702, -0.5118029, -1.66342, 1, 0, 0, 1, 1,
-1.136221, 1.441137, -0.6879767, 1, 0, 0, 1, 1,
-1.133672, -0.02605865, -1.577887, 1, 0, 0, 1, 1,
-1.130054, 0.1970152, -1.844391, 0, 0, 0, 1, 1,
-1.10892, 1.224327, 0.2491896, 0, 0, 0, 1, 1,
-1.107361, -0.2405254, 0.8682511, 0, 0, 0, 1, 1,
-1.105881, 0.5483822, -1.927832, 0, 0, 0, 1, 1,
-1.105354, 0.943585, -1.483901, 0, 0, 0, 1, 1,
-1.105068, -2.123274, -2.520923, 0, 0, 0, 1, 1,
-1.104818, 0.1549453, -1.967153, 0, 0, 0, 1, 1,
-1.102617, 1.061835, -1.010183, 1, 1, 1, 1, 1,
-1.100463, -0.1871812, -0.6771477, 1, 1, 1, 1, 1,
-1.09005, -1.429239, -1.535201, 1, 1, 1, 1, 1,
-1.084556, 0.3243365, -1.596598, 1, 1, 1, 1, 1,
-1.066962, -0.8556577, -2.194957, 1, 1, 1, 1, 1,
-1.064725, 0.07867768, -2.567843, 1, 1, 1, 1, 1,
-1.062521, 0.3243693, -1.475705, 1, 1, 1, 1, 1,
-1.059072, 0.1867465, -1.863344, 1, 1, 1, 1, 1,
-1.057299, -0.6269441, -2.522288, 1, 1, 1, 1, 1,
-1.05084, 1.522142, 0.4327715, 1, 1, 1, 1, 1,
-1.04997, -0.6675905, -4.629735, 1, 1, 1, 1, 1,
-1.044647, 0.6989946, 0.1506151, 1, 1, 1, 1, 1,
-1.035262, -1.019613, -3.234324, 1, 1, 1, 1, 1,
-1.034079, -0.3567251, -1.208577, 1, 1, 1, 1, 1,
-1.026438, 1.318853, -0.7287619, 1, 1, 1, 1, 1,
-1.022855, -0.1487511, -0.4238164, 0, 0, 1, 1, 1,
-1.020483, -0.1969074, -0.7331344, 1, 0, 0, 1, 1,
-1.001263, -1.634044, -2.648078, 1, 0, 0, 1, 1,
-1.001031, -1.544441, -1.609118, 1, 0, 0, 1, 1,
-1.000087, -0.3460454, -2.956871, 1, 0, 0, 1, 1,
-0.9817559, -0.2767954, -3.371803, 1, 0, 0, 1, 1,
-0.9798892, 0.4124126, -3.288554, 0, 0, 0, 1, 1,
-0.9774432, 0.661675, 0.1299516, 0, 0, 0, 1, 1,
-0.9757213, -1.793223, -3.047704, 0, 0, 0, 1, 1,
-0.9726996, -3.058433, -1.642376, 0, 0, 0, 1, 1,
-0.9687625, -0.2517394, -2.698225, 0, 0, 0, 1, 1,
-0.9663844, -0.2486937, -1.185449, 0, 0, 0, 1, 1,
-0.9628736, 0.1844591, 0.1705341, 0, 0, 0, 1, 1,
-0.9519522, 0.151815, -1.368798, 1, 1, 1, 1, 1,
-0.9465218, 0.958562, -2.547011, 1, 1, 1, 1, 1,
-0.9430318, -0.4020267, -2.252017, 1, 1, 1, 1, 1,
-0.9423023, -1.084177, -3.777829, 1, 1, 1, 1, 1,
-0.9418761, -0.4025356, -1.972875, 1, 1, 1, 1, 1,
-0.9374329, -1.137768, -0.8498738, 1, 1, 1, 1, 1,
-0.9297515, -1.143555, -4.808855, 1, 1, 1, 1, 1,
-0.9248888, 0.05026224, -0.3719047, 1, 1, 1, 1, 1,
-0.9236271, -0.938402, -0.6441037, 1, 1, 1, 1, 1,
-0.9176803, 0.4081766, -2.723193, 1, 1, 1, 1, 1,
-0.9170229, -1.556165, -2.158452, 1, 1, 1, 1, 1,
-0.9126803, -1.421323, -3.516957, 1, 1, 1, 1, 1,
-0.9073684, -0.4210804, -2.317072, 1, 1, 1, 1, 1,
-0.9030401, -0.833328, -1.325523, 1, 1, 1, 1, 1,
-0.8958818, -1.253808, -2.277619, 1, 1, 1, 1, 1,
-0.895797, -0.5662175, -1.980678, 0, 0, 1, 1, 1,
-0.8945937, -0.4671277, -2.379793, 1, 0, 0, 1, 1,
-0.8865473, 0.08017204, -0.2270266, 1, 0, 0, 1, 1,
-0.8852349, -1.026719, -2.555207, 1, 0, 0, 1, 1,
-0.8778046, 1.084136, -2.308599, 1, 0, 0, 1, 1,
-0.8763583, -0.05374708, -0.9147482, 1, 0, 0, 1, 1,
-0.8740981, 0.286512, -0.7913421, 0, 0, 0, 1, 1,
-0.8657734, 0.7995978, -0.2522693, 0, 0, 0, 1, 1,
-0.8595585, -0.5865327, -2.478402, 0, 0, 0, 1, 1,
-0.8591331, -0.6364646, -1.271098, 0, 0, 0, 1, 1,
-0.8537652, -0.7136763, -1.510182, 0, 0, 0, 1, 1,
-0.8531834, -0.460552, -1.072225, 0, 0, 0, 1, 1,
-0.84797, 0.2401898, -0.1133687, 0, 0, 0, 1, 1,
-0.8436123, 0.202648, -0.9800101, 1, 1, 1, 1, 1,
-0.842209, -0.6692058, -0.8824725, 1, 1, 1, 1, 1,
-0.8257272, 0.1824647, -1.288918, 1, 1, 1, 1, 1,
-0.8246612, 0.9044876, 0.3716652, 1, 1, 1, 1, 1,
-0.8232849, -2.109154, -4.308176, 1, 1, 1, 1, 1,
-0.8227175, 1.501271, 1.848889, 1, 1, 1, 1, 1,
-0.8181838, 0.1988556, -2.134971, 1, 1, 1, 1, 1,
-0.8179819, 0.3737834, -0.1373581, 1, 1, 1, 1, 1,
-0.811597, -1.119769, -2.973441, 1, 1, 1, 1, 1,
-0.8113899, 0.2907439, 0.1645309, 1, 1, 1, 1, 1,
-0.8105739, 0.7365416, -1.630607, 1, 1, 1, 1, 1,
-0.8095706, 0.2464044, -2.063964, 1, 1, 1, 1, 1,
-0.8045382, 0.09494983, 0.1054439, 1, 1, 1, 1, 1,
-0.8013846, -1.059244, -2.287534, 1, 1, 1, 1, 1,
-0.7997975, 1.146121, 1.757568, 1, 1, 1, 1, 1,
-0.7987504, 1.378752, -0.604195, 0, 0, 1, 1, 1,
-0.7953264, -2.220067, -3.164804, 1, 0, 0, 1, 1,
-0.7911721, 0.8120443, -2.07728, 1, 0, 0, 1, 1,
-0.7858943, -0.05434745, -0.3224032, 1, 0, 0, 1, 1,
-0.7856444, -1.751868, -1.588061, 1, 0, 0, 1, 1,
-0.7808136, -0.05298727, -0.8243485, 1, 0, 0, 1, 1,
-0.7799149, -1.374134, -3.067698, 0, 0, 0, 1, 1,
-0.7789893, -0.7446592, -1.453967, 0, 0, 0, 1, 1,
-0.778071, -0.5293417, -1.892408, 0, 0, 0, 1, 1,
-0.7764566, 0.2221972, -1.516319, 0, 0, 0, 1, 1,
-0.7725809, 1.660986, -0.5120189, 0, 0, 0, 1, 1,
-0.7667649, 0.9243112, 0.9350422, 0, 0, 0, 1, 1,
-0.7590035, 0.4990447, -1.695745, 0, 0, 0, 1, 1,
-0.7545782, 2.159718, -1.436403, 1, 1, 1, 1, 1,
-0.7538689, -1.421573, -4.241695, 1, 1, 1, 1, 1,
-0.7507629, 0.08886766, -2.625873, 1, 1, 1, 1, 1,
-0.7474922, -0.0702529, -2.231344, 1, 1, 1, 1, 1,
-0.7454486, 1.278579, 1.186349, 1, 1, 1, 1, 1,
-0.7441569, 0.2429482, 0.2378094, 1, 1, 1, 1, 1,
-0.7436426, -0.01927943, -2.330842, 1, 1, 1, 1, 1,
-0.7383925, -0.587826, -2.395937, 1, 1, 1, 1, 1,
-0.7334464, 0.5424852, -1.349661, 1, 1, 1, 1, 1,
-0.7287265, -0.1053424, -1.535622, 1, 1, 1, 1, 1,
-0.7167476, -0.4986886, -1.713898, 1, 1, 1, 1, 1,
-0.7151606, 0.6556351, -0.8282062, 1, 1, 1, 1, 1,
-0.7114415, 0.60522, -0.7531222, 1, 1, 1, 1, 1,
-0.6972407, -0.825529, -2.401174, 1, 1, 1, 1, 1,
-0.6933219, -0.1914256, -0.5746381, 1, 1, 1, 1, 1,
-0.6909637, 1.051084, -0.1100421, 0, 0, 1, 1, 1,
-0.6885347, -0.6899484, -2.114014, 1, 0, 0, 1, 1,
-0.6815212, -0.5205352, -2.795856, 1, 0, 0, 1, 1,
-0.6802217, 1.159211, 0.5879495, 1, 0, 0, 1, 1,
-0.6785214, -0.257247, -3.409103, 1, 0, 0, 1, 1,
-0.6766158, -0.1289681, -2.581854, 1, 0, 0, 1, 1,
-0.6757749, -0.1842037, -2.587179, 0, 0, 0, 1, 1,
-0.6755587, 1.504961, -0.1702501, 0, 0, 0, 1, 1,
-0.6718401, -0.4686921, -4.826903, 0, 0, 0, 1, 1,
-0.6666766, -0.8154721, -3.496608, 0, 0, 0, 1, 1,
-0.6561994, -1.502492, -2.327335, 0, 0, 0, 1, 1,
-0.6544743, 0.6581231, -0.4125576, 0, 0, 0, 1, 1,
-0.647494, 0.05805056, -1.261219, 0, 0, 0, 1, 1,
-0.6359245, 1.434099, 0.354521, 1, 1, 1, 1, 1,
-0.63542, -0.6943402, -1.424629, 1, 1, 1, 1, 1,
-0.6337138, 0.4118118, -0.4855657, 1, 1, 1, 1, 1,
-0.6315637, -0.7670519, -1.29889, 1, 1, 1, 1, 1,
-0.6183711, 1.189114, 0.5694262, 1, 1, 1, 1, 1,
-0.6166095, -1.034451, -1.807207, 1, 1, 1, 1, 1,
-0.6147712, -0.8705747, -3.044122, 1, 1, 1, 1, 1,
-0.6101764, -1.183469, -2.744951, 1, 1, 1, 1, 1,
-0.6096724, 1.401238, -0.6523883, 1, 1, 1, 1, 1,
-0.6088609, 0.6107756, -0.9091148, 1, 1, 1, 1, 1,
-0.6050221, 0.1781455, -1.990024, 1, 1, 1, 1, 1,
-0.6045594, 0.1914452, -1.885139, 1, 1, 1, 1, 1,
-0.5995506, 2.107751, -0.9671576, 1, 1, 1, 1, 1,
-0.5989724, 0.4757012, -0.1377351, 1, 1, 1, 1, 1,
-0.5922625, 1.030908, 0.3273907, 1, 1, 1, 1, 1,
-0.5883661, -1.254162, -2.810863, 0, 0, 1, 1, 1,
-0.5848933, -0.3812301, -1.752433, 1, 0, 0, 1, 1,
-0.5821068, 0.06756717, -1.840691, 1, 0, 0, 1, 1,
-0.5806836, 0.06783442, -2.559673, 1, 0, 0, 1, 1,
-0.5786471, -0.6481884, -2.55155, 1, 0, 0, 1, 1,
-0.5785857, 0.2068236, -2.393784, 1, 0, 0, 1, 1,
-0.577177, 1.207503, -0.982237, 0, 0, 0, 1, 1,
-0.5731912, 0.8676747, 0.5607389, 0, 0, 0, 1, 1,
-0.5722913, -1.064707, -3.346421, 0, 0, 0, 1, 1,
-0.5720142, -1.524603, -3.414946, 0, 0, 0, 1, 1,
-0.5704374, 1.464726, -0.1225476, 0, 0, 0, 1, 1,
-0.5672415, -0.2514199, -0.4704834, 0, 0, 0, 1, 1,
-0.567146, 1.084175, -0.5029059, 0, 0, 0, 1, 1,
-0.566869, -0.3883696, -2.435557, 1, 1, 1, 1, 1,
-0.5584752, 1.050893, 0.267099, 1, 1, 1, 1, 1,
-0.5583965, -0.5746788, -2.597198, 1, 1, 1, 1, 1,
-0.5548193, 0.5705335, -1.045171, 1, 1, 1, 1, 1,
-0.5525832, 0.3578965, -2.893223, 1, 1, 1, 1, 1,
-0.5524492, 0.4940202, -0.7113295, 1, 1, 1, 1, 1,
-0.5505925, -2.196615, -3.198227, 1, 1, 1, 1, 1,
-0.5480714, -0.4715276, -3.888206, 1, 1, 1, 1, 1,
-0.5472742, -0.3792852, -3.385901, 1, 1, 1, 1, 1,
-0.5419229, 0.3254724, -0.8515183, 1, 1, 1, 1, 1,
-0.538529, 1.638771, -1.472069, 1, 1, 1, 1, 1,
-0.5373344, 0.7604908, -0.4332525, 1, 1, 1, 1, 1,
-0.5349471, -0.8935034, -4.767594, 1, 1, 1, 1, 1,
-0.5267069, -0.7207994, -4.542757, 1, 1, 1, 1, 1,
-0.5213104, -0.8629359, -3.467235, 1, 1, 1, 1, 1,
-0.5190619, 0.6257534, -0.5663991, 0, 0, 1, 1, 1,
-0.5177125, -1.140278, -3.492134, 1, 0, 0, 1, 1,
-0.5174956, 0.4578962, -0.6969571, 1, 0, 0, 1, 1,
-0.5139967, -0.2818532, -1.636412, 1, 0, 0, 1, 1,
-0.5127913, -1.588982, -4.705098, 1, 0, 0, 1, 1,
-0.5120243, 2.75688, 0.3803634, 1, 0, 0, 1, 1,
-0.5115006, 0.1624809, -0.1119069, 0, 0, 0, 1, 1,
-0.5056463, -0.4072843, -2.634293, 0, 0, 0, 1, 1,
-0.5050157, -0.4098693, -2.730494, 0, 0, 0, 1, 1,
-0.5018584, 0.05894779, 0.5068159, 0, 0, 0, 1, 1,
-0.5001302, -0.9296845, -1.105237, 0, 0, 0, 1, 1,
-0.4990271, -1.718766, -3.440489, 0, 0, 0, 1, 1,
-0.4979155, 1.532357, -0.3703119, 0, 0, 0, 1, 1,
-0.4906614, 0.3587976, -1.128598, 1, 1, 1, 1, 1,
-0.4899282, -0.2044625, -2.08999, 1, 1, 1, 1, 1,
-0.485278, -0.9743924, -2.187596, 1, 1, 1, 1, 1,
-0.4846235, -0.4930711, -2.365526, 1, 1, 1, 1, 1,
-0.483872, 1.254181, -0.2613424, 1, 1, 1, 1, 1,
-0.4826123, -1.282635, -2.723476, 1, 1, 1, 1, 1,
-0.4825552, 0.171484, -0.6379351, 1, 1, 1, 1, 1,
-0.4772442, 0.9975341, -0.9603755, 1, 1, 1, 1, 1,
-0.4751741, -0.6676242, -2.436097, 1, 1, 1, 1, 1,
-0.4727056, 0.1013722, -4.049139, 1, 1, 1, 1, 1,
-0.4712821, -0.9805614, -2.264801, 1, 1, 1, 1, 1,
-0.4685471, 0.2026026, -0.952182, 1, 1, 1, 1, 1,
-0.4664023, 0.1215688, -0.7711574, 1, 1, 1, 1, 1,
-0.4659049, 2.828725, 0.0321802, 1, 1, 1, 1, 1,
-0.463467, -1.24964, -3.365863, 1, 1, 1, 1, 1,
-0.4613893, 0.5238957, -2.119567, 0, 0, 1, 1, 1,
-0.4589738, 1.086321, -0.4504521, 1, 0, 0, 1, 1,
-0.4560201, -0.4022927, -3.519653, 1, 0, 0, 1, 1,
-0.4559864, 1.571942, -0.8980022, 1, 0, 0, 1, 1,
-0.4549871, -1.213213, -2.634504, 1, 0, 0, 1, 1,
-0.4522932, -1.161762, -4.099826, 1, 0, 0, 1, 1,
-0.4468891, -0.6884192, -4.112173, 0, 0, 0, 1, 1,
-0.4424637, -0.2389598, -2.027261, 0, 0, 0, 1, 1,
-0.4405662, -0.3980158, -2.76295, 0, 0, 0, 1, 1,
-0.4324915, 3.243256, -0.07471748, 0, 0, 0, 1, 1,
-0.4315518, 0.8596525, -0.1393604, 0, 0, 0, 1, 1,
-0.4311004, 1.966388, -1.410068, 0, 0, 0, 1, 1,
-0.429761, -0.7440947, -0.7094669, 0, 0, 0, 1, 1,
-0.418901, 0.8753513, -1.867465, 1, 1, 1, 1, 1,
-0.4173155, -1.017946, -4.555955, 1, 1, 1, 1, 1,
-0.4165331, -1.074829, -2.849426, 1, 1, 1, 1, 1,
-0.4149558, -0.3217653, -0.1676109, 1, 1, 1, 1, 1,
-0.414286, -0.2324278, -4.330218, 1, 1, 1, 1, 1,
-0.4048092, 0.3636934, 0.8702123, 1, 1, 1, 1, 1,
-0.4038944, -0.189278, 0.2487189, 1, 1, 1, 1, 1,
-0.4035759, -0.1626112, -1.348696, 1, 1, 1, 1, 1,
-0.4032691, -0.03903139, -2.121678, 1, 1, 1, 1, 1,
-0.4017316, 0.4659636, -1.156483, 1, 1, 1, 1, 1,
-0.401552, -0.8758538, -6.43435, 1, 1, 1, 1, 1,
-0.3995373, 0.9900618, 1.024714, 1, 1, 1, 1, 1,
-0.39701, 0.1315674, -1.926449, 1, 1, 1, 1, 1,
-0.3950463, 0.09932824, -1.491783, 1, 1, 1, 1, 1,
-0.3948878, 0.7305028, -0.3640052, 1, 1, 1, 1, 1,
-0.389852, 0.1610136, -1.040116, 0, 0, 1, 1, 1,
-0.3849356, 0.331389, 2.369147, 1, 0, 0, 1, 1,
-0.3803654, -0.5193343, -2.618957, 1, 0, 0, 1, 1,
-0.3802122, -0.565807, -2.029999, 1, 0, 0, 1, 1,
-0.3783947, 0.09480402, 0.8624906, 1, 0, 0, 1, 1,
-0.3764183, 2.58935, -0.9052044, 1, 0, 0, 1, 1,
-0.375926, -0.1625868, -1.270691, 0, 0, 0, 1, 1,
-0.3727573, 0.7634945, -0.5158579, 0, 0, 0, 1, 1,
-0.3720606, -0.3175481, -1.244903, 0, 0, 0, 1, 1,
-0.3684295, 1.167692, 1.833139, 0, 0, 0, 1, 1,
-0.3680611, 0.7497667, 0.9649209, 0, 0, 0, 1, 1,
-0.3637093, 0.9184838, -0.06252358, 0, 0, 0, 1, 1,
-0.3632268, -0.8060367, -3.417071, 0, 0, 0, 1, 1,
-0.3627525, 0.8795031, 1.014941, 1, 1, 1, 1, 1,
-0.3612286, 1.979136, -1.005553, 1, 1, 1, 1, 1,
-0.3583717, 1.372753, 0.02765948, 1, 1, 1, 1, 1,
-0.3552253, -0.2907446, -3.008098, 1, 1, 1, 1, 1,
-0.3521915, 0.9433106, 0.03165859, 1, 1, 1, 1, 1,
-0.3500171, -1.103605, -2.077485, 1, 1, 1, 1, 1,
-0.3487333, 0.668884, -1.857352, 1, 1, 1, 1, 1,
-0.3482836, -0.9843579, -2.590005, 1, 1, 1, 1, 1,
-0.3417988, -2.24686, -2.771624, 1, 1, 1, 1, 1,
-0.3404351, -0.6095031, -2.986407, 1, 1, 1, 1, 1,
-0.3357925, 0.305475, -0.8572599, 1, 1, 1, 1, 1,
-0.335679, -0.6115176, -2.399992, 1, 1, 1, 1, 1,
-0.3328732, 1.285798, 0.03311267, 1, 1, 1, 1, 1,
-0.3322886, 0.08870946, -2.198875, 1, 1, 1, 1, 1,
-0.3263079, 0.06750324, -0.3623145, 1, 1, 1, 1, 1,
-0.3243679, 1.405422, 0.1665456, 0, 0, 1, 1, 1,
-0.3203231, 0.8253561, -0.308295, 1, 0, 0, 1, 1,
-0.3191546, 0.3027174, -2.212596, 1, 0, 0, 1, 1,
-0.3189952, 0.6849654, -0.07373235, 1, 0, 0, 1, 1,
-0.3121476, 0.04443588, -1.502485, 1, 0, 0, 1, 1,
-0.3115038, 1.460245, 0.7669572, 1, 0, 0, 1, 1,
-0.3040148, 0.4433642, -1.17297, 0, 0, 0, 1, 1,
-0.2998318, -0.00422168, -2.62626, 0, 0, 0, 1, 1,
-0.2977422, 0.165492, -1.345434, 0, 0, 0, 1, 1,
-0.2890037, -0.8158327, -1.614261, 0, 0, 0, 1, 1,
-0.2859143, -0.9241093, -1.810905, 0, 0, 0, 1, 1,
-0.2814153, 1.228473, -0.6291652, 0, 0, 0, 1, 1,
-0.2804992, -0.2302899, -2.695679, 0, 0, 0, 1, 1,
-0.2797401, -0.08269082, -1.836386, 1, 1, 1, 1, 1,
-0.2794084, 1.470566, 0.2314487, 1, 1, 1, 1, 1,
-0.2779227, -1.145012, -1.748061, 1, 1, 1, 1, 1,
-0.2741745, 1.383058, -0.8284917, 1, 1, 1, 1, 1,
-0.2733113, -1.803074, -3.020463, 1, 1, 1, 1, 1,
-0.2726695, 0.420341, 0.2163849, 1, 1, 1, 1, 1,
-0.2696419, 1.002898, -0.8804483, 1, 1, 1, 1, 1,
-0.262394, 0.04553872, -0.7295828, 1, 1, 1, 1, 1,
-0.2623359, -0.938715, -2.477703, 1, 1, 1, 1, 1,
-0.2592654, 1.05297, 1.416219, 1, 1, 1, 1, 1,
-0.2591917, -1.276434, -2.719308, 1, 1, 1, 1, 1,
-0.2549745, 0.5229382, 1.197741, 1, 1, 1, 1, 1,
-0.2495811, 0.00101686, -3.025743, 1, 1, 1, 1, 1,
-0.2427277, 0.5206581, -1.585992, 1, 1, 1, 1, 1,
-0.2397852, -0.08459084, -2.602968, 1, 1, 1, 1, 1,
-0.2375159, -1.427822, -4.201556, 0, 0, 1, 1, 1,
-0.2346313, -1.698323, -3.482519, 1, 0, 0, 1, 1,
-0.2342741, 2.851585, -0.1315526, 1, 0, 0, 1, 1,
-0.2331578, 0.3295026, 0.02394145, 1, 0, 0, 1, 1,
-0.2324741, -0.7550795, -3.514744, 1, 0, 0, 1, 1,
-0.2323287, -0.5658863, -2.738039, 1, 0, 0, 1, 1,
-0.2316251, 1.984357, -0.9442542, 0, 0, 0, 1, 1,
-0.2284453, 1.202207, 0.7654296, 0, 0, 0, 1, 1,
-0.2284067, 0.4408098, -0.6604292, 0, 0, 0, 1, 1,
-0.2248355, -0.1439916, -2.478032, 0, 0, 0, 1, 1,
-0.2242611, 0.6831266, 0.9857463, 0, 0, 0, 1, 1,
-0.2239641, 0.7491931, 0.742241, 0, 0, 0, 1, 1,
-0.2224311, 0.6620348, 2.369782, 0, 0, 0, 1, 1,
-0.2221055, -0.1552709, -2.16692, 1, 1, 1, 1, 1,
-0.2202152, 0.2823093, -0.2223943, 1, 1, 1, 1, 1,
-0.211577, 0.2481263, 1.201132, 1, 1, 1, 1, 1,
-0.2106314, -0.6740527, -3.36238, 1, 1, 1, 1, 1,
-0.2105772, 0.5591087, -0.2064908, 1, 1, 1, 1, 1,
-0.2079612, -0.1747194, -3.090743, 1, 1, 1, 1, 1,
-0.2062788, 0.7478811, 0.9243591, 1, 1, 1, 1, 1,
-0.200709, 0.9602883, -0.2336569, 1, 1, 1, 1, 1,
-0.1977644, 1.257502, 0.8351253, 1, 1, 1, 1, 1,
-0.1976787, 2.397297, -1.677234, 1, 1, 1, 1, 1,
-0.1971758, -0.6169565, -1.686048, 1, 1, 1, 1, 1,
-0.1923924, -0.589896, -1.793126, 1, 1, 1, 1, 1,
-0.1910418, -0.6470336, -4.772234, 1, 1, 1, 1, 1,
-0.1816252, 1.148864, 0.1951687, 1, 1, 1, 1, 1,
-0.179832, 2.600468, -0.2521619, 1, 1, 1, 1, 1,
-0.1792434, 0.5111558, 0.4797503, 0, 0, 1, 1, 1,
-0.1777864, 0.8982924, 1.98167, 1, 0, 0, 1, 1,
-0.1755968, 1.03152, 0.1579497, 1, 0, 0, 1, 1,
-0.1718786, 1.263403, -0.3018677, 1, 0, 0, 1, 1,
-0.1701438, -0.9555149, -3.848513, 1, 0, 0, 1, 1,
-0.1643351, 0.9019741, 0.3004089, 1, 0, 0, 1, 1,
-0.1633778, 0.4010196, 1.066828, 0, 0, 0, 1, 1,
-0.1629075, -0.2537153, -3.018454, 0, 0, 0, 1, 1,
-0.1578151, 2.962048, -1.393515, 0, 0, 0, 1, 1,
-0.1561683, 1.261261, -0.6517097, 0, 0, 0, 1, 1,
-0.1413043, -0.9040668, -2.32102, 0, 0, 0, 1, 1,
-0.140708, 1.330908, 0.9025412, 0, 0, 0, 1, 1,
-0.1406394, 0.5087733, 0.5653908, 0, 0, 0, 1, 1,
-0.1334439, 0.1203918, -1.385852, 1, 1, 1, 1, 1,
-0.1311332, 1.950741, 0.602606, 1, 1, 1, 1, 1,
-0.130156, 0.165913, -1.121512, 1, 1, 1, 1, 1,
-0.1291078, -0.5651159, -1.03363, 1, 1, 1, 1, 1,
-0.1269629, -0.03072053, 1.001582, 1, 1, 1, 1, 1,
-0.1223058, 1.17926, -0.1032482, 1, 1, 1, 1, 1,
-0.1216197, -0.9280684, -3.763147, 1, 1, 1, 1, 1,
-0.1214079, 0.1199578, -1.560196, 1, 1, 1, 1, 1,
-0.1199956, -0.3830389, -4.349925, 1, 1, 1, 1, 1,
-0.118535, 0.5296996, 0.07799038, 1, 1, 1, 1, 1,
-0.1177413, 1.216481, 0.7596504, 1, 1, 1, 1, 1,
-0.1177316, 0.6283504, -1.303789, 1, 1, 1, 1, 1,
-0.1177265, -0.5744667, -2.962946, 1, 1, 1, 1, 1,
-0.1170019, 0.2393802, -0.3592623, 1, 1, 1, 1, 1,
-0.1122605, -0.7429592, -3.767228, 1, 1, 1, 1, 1,
-0.1093838, 1.994638, -1.945981, 0, 0, 1, 1, 1,
-0.1090503, 0.5433775, -1.214541, 1, 0, 0, 1, 1,
-0.1073053, -0.9531152, -3.657774, 1, 0, 0, 1, 1,
-0.1057895, -0.3012323, -4.833386, 1, 0, 0, 1, 1,
-0.104196, 1.600812, 0.6307499, 1, 0, 0, 1, 1,
-0.1034858, 0.4730512, 0.3964216, 1, 0, 0, 1, 1,
-0.1032337, -0.1328367, -2.598492, 0, 0, 0, 1, 1,
-0.0899056, -1.09062, -3.495779, 0, 0, 0, 1, 1,
-0.086702, -0.5992889, -3.799988, 0, 0, 0, 1, 1,
-0.08208966, 0.09391551, -0.3924315, 0, 0, 0, 1, 1,
-0.08061109, 0.6068843, 1.195357, 0, 0, 0, 1, 1,
-0.08053089, -0.7627095, -2.464661, 0, 0, 0, 1, 1,
-0.07678452, 0.2411951, 0.07146375, 0, 0, 0, 1, 1,
-0.07596125, 1.619862, -0.170447, 1, 1, 1, 1, 1,
-0.07314287, -1.124171, -5.035722, 1, 1, 1, 1, 1,
-0.07308258, 0.1855425, 0.8741449, 1, 1, 1, 1, 1,
-0.07192144, -1.771148, -3.240275, 1, 1, 1, 1, 1,
-0.07190803, -0.6358819, -3.612487, 1, 1, 1, 1, 1,
-0.07019523, -0.5957341, -4.247139, 1, 1, 1, 1, 1,
-0.06926821, 0.3968109, -1.037255, 1, 1, 1, 1, 1,
-0.0683987, 2.384881, 1.073986, 1, 1, 1, 1, 1,
-0.06525788, 0.4705406, -0.6825492, 1, 1, 1, 1, 1,
-0.06495292, 0.1606777, -0.1190153, 1, 1, 1, 1, 1,
-0.06485808, -0.1514221, -1.854473, 1, 1, 1, 1, 1,
-0.06453744, 0.2738765, -0.08755502, 1, 1, 1, 1, 1,
-0.06094233, -0.8593742, -2.781729, 1, 1, 1, 1, 1,
-0.05859329, 0.8036875, -0.05870547, 1, 1, 1, 1, 1,
-0.05637523, -1.09068, -4.873798, 1, 1, 1, 1, 1,
-0.05373469, -0.5799184, -3.215051, 0, 0, 1, 1, 1,
-0.05120334, 0.1213309, -0.6327716, 1, 0, 0, 1, 1,
-0.042507, -0.9431695, -4.198821, 1, 0, 0, 1, 1,
-0.03959469, -0.5571253, -2.593915, 1, 0, 0, 1, 1,
-0.03682387, 0.0687858, 0.3992243, 1, 0, 0, 1, 1,
-0.03675862, -0.3523376, -3.012901, 1, 0, 0, 1, 1,
-0.03608272, -0.5090802, -2.095622, 0, 0, 0, 1, 1,
-0.03364544, 1.238785, -1.123556, 0, 0, 0, 1, 1,
-0.03341458, -1.622184, -1.733221, 0, 0, 0, 1, 1,
-0.03267151, 2.578533, 2.087762, 0, 0, 0, 1, 1,
-0.03265188, -1.222419, -4.282197, 0, 0, 0, 1, 1,
-0.03095256, 1.725778, 1.309733, 0, 0, 0, 1, 1,
-0.0299974, 0.6892015, -0.576425, 0, 0, 0, 1, 1,
-0.0284768, -1.009066, -3.433174, 1, 1, 1, 1, 1,
-0.02796713, -0.1969606, -3.65234, 1, 1, 1, 1, 1,
-0.02543506, 0.2598009, 0.2653308, 1, 1, 1, 1, 1,
-0.02521911, -1.436872, -2.361657, 1, 1, 1, 1, 1,
-0.02360539, 0.3129581, 0.3803255, 1, 1, 1, 1, 1,
-0.02190817, 0.7580202, 1.140886, 1, 1, 1, 1, 1,
-0.01443712, 1.366664, 1.083852, 1, 1, 1, 1, 1,
-0.01409602, 1.121399, -0.5910534, 1, 1, 1, 1, 1,
-0.005127844, 0.2602318, 0.9750912, 1, 1, 1, 1, 1,
0.00204367, 1.300089, 0.7110744, 1, 1, 1, 1, 1,
0.007731895, -0.07216424, 4.88801, 1, 1, 1, 1, 1,
0.00964143, -0.1899634, 3.14964, 1, 1, 1, 1, 1,
0.0109612, 1.882979, 1.453968, 1, 1, 1, 1, 1,
0.01283391, 2.120953, 0.6486816, 1, 1, 1, 1, 1,
0.01653445, 0.5037337, 1.441095, 1, 1, 1, 1, 1,
0.01656268, 0.1562386, -1.413002, 0, 0, 1, 1, 1,
0.01763885, 0.960697, -0.4866186, 1, 0, 0, 1, 1,
0.01940397, 0.2002046, 0.916701, 1, 0, 0, 1, 1,
0.01972503, 0.1483554, -0.3612567, 1, 0, 0, 1, 1,
0.02018334, 1.070968, -0.3262762, 1, 0, 0, 1, 1,
0.02599738, -0.06574925, 3.229054, 1, 0, 0, 1, 1,
0.03014806, 1.446936, 0.8670464, 0, 0, 0, 1, 1,
0.03045037, -1.353981, 4.329786, 0, 0, 0, 1, 1,
0.03598107, -0.907629, 3.587079, 0, 0, 0, 1, 1,
0.03793615, -0.3540082, 2.698602, 0, 0, 0, 1, 1,
0.0386856, -0.2552427, 3.773948, 0, 0, 0, 1, 1,
0.04076834, -1.395693, 3.117265, 0, 0, 0, 1, 1,
0.04217266, -1.901323, 4.357135, 0, 0, 0, 1, 1,
0.04562983, 0.2520005, 0.718574, 1, 1, 1, 1, 1,
0.04990282, -0.5255275, 4.647641, 1, 1, 1, 1, 1,
0.05310781, 1.407297, -2.345476, 1, 1, 1, 1, 1,
0.0556352, 0.05633188, 2.058601, 1, 1, 1, 1, 1,
0.06155868, -0.4604285, 4.454671, 1, 1, 1, 1, 1,
0.06200871, 0.154644, -0.1144906, 1, 1, 1, 1, 1,
0.06493312, 1.2762, 1.194971, 1, 1, 1, 1, 1,
0.0669027, 1.648321, -1.226892, 1, 1, 1, 1, 1,
0.07155422, 1.038818, 0.4869053, 1, 1, 1, 1, 1,
0.07290448, -1.233888, 2.661755, 1, 1, 1, 1, 1,
0.07734463, 0.2721134, 0.08029936, 1, 1, 1, 1, 1,
0.07803766, 1.571689, -0.4509395, 1, 1, 1, 1, 1,
0.07882115, -1.917498, 4.285498, 1, 1, 1, 1, 1,
0.07935593, -1.268196, 2.232199, 1, 1, 1, 1, 1,
0.08201329, 1.100194, 1.099288, 1, 1, 1, 1, 1,
0.08299029, -0.0900667, 2.44257, 0, 0, 1, 1, 1,
0.09092315, -0.1036029, 3.590266, 1, 0, 0, 1, 1,
0.09265307, 0.5404332, 0.1249379, 1, 0, 0, 1, 1,
0.09405481, 0.1500553, 1.479691, 1, 0, 0, 1, 1,
0.0951741, 0.4247528, -0.4061175, 1, 0, 0, 1, 1,
0.09694527, -1.25481, 3.690009, 1, 0, 0, 1, 1,
0.1069024, 0.4051153, -0.2318507, 0, 0, 0, 1, 1,
0.1089976, -0.4371476, 3.151087, 0, 0, 0, 1, 1,
0.1122574, 0.3710417, 0.3607482, 0, 0, 0, 1, 1,
0.1138826, -0.2103084, 3.228217, 0, 0, 0, 1, 1,
0.1205351, 0.7649518, -2.02341, 0, 0, 0, 1, 1,
0.1205622, 1.576325, -0.02732171, 0, 0, 0, 1, 1,
0.1240894, 0.3002701, 0.3529159, 0, 0, 0, 1, 1,
0.1272886, 0.6055356, -0.7029308, 1, 1, 1, 1, 1,
0.1304049, -0.1903009, 3.637007, 1, 1, 1, 1, 1,
0.1326482, -0.1893969, 1.898044, 1, 1, 1, 1, 1,
0.132996, -0.2388184, 0.9614868, 1, 1, 1, 1, 1,
0.1400161, -0.7660689, 3.479094, 1, 1, 1, 1, 1,
0.140668, 0.3998192, -0.3150954, 1, 1, 1, 1, 1,
0.1432134, 0.8199605, 1.57855, 1, 1, 1, 1, 1,
0.1444652, -0.3395093, 2.349338, 1, 1, 1, 1, 1,
0.1475437, -1.811968, 3.141292, 1, 1, 1, 1, 1,
0.148529, -1.600141, 3.46723, 1, 1, 1, 1, 1,
0.1502059, -2.146912, 5.018704, 1, 1, 1, 1, 1,
0.155081, 0.1740369, -0.1014658, 1, 1, 1, 1, 1,
0.1554527, -0.544531, 2.182532, 1, 1, 1, 1, 1,
0.1694713, 0.2724278, 2.198299, 1, 1, 1, 1, 1,
0.1699691, -0.212613, 2.559207, 1, 1, 1, 1, 1,
0.1708625, 1.024935, -0.3218079, 0, 0, 1, 1, 1,
0.1713582, -0.8398237, 4.065454, 1, 0, 0, 1, 1,
0.1751859, 0.4934197, 0.180837, 1, 0, 0, 1, 1,
0.1765641, 1.103131, -0.513006, 1, 0, 0, 1, 1,
0.1767151, -0.8424599, 3.154071, 1, 0, 0, 1, 1,
0.1770837, 1.251304, 1.460476, 1, 0, 0, 1, 1,
0.1781495, 1.741094, -0.2328827, 0, 0, 0, 1, 1,
0.1796604, -0.7813024, 1.727301, 0, 0, 0, 1, 1,
0.1845063, -0.3354527, 3.255849, 0, 0, 0, 1, 1,
0.1884126, 0.6117849, 0.2662118, 0, 0, 0, 1, 1,
0.1918819, -0.07588497, 1.720889, 0, 0, 0, 1, 1,
0.1922446, -1.257039, 3.75361, 0, 0, 0, 1, 1,
0.193765, 0.06235855, 2.194516, 0, 0, 0, 1, 1,
0.1949132, 0.8624184, 0.4245025, 1, 1, 1, 1, 1,
0.1954765, 0.2839834, 1.087417, 1, 1, 1, 1, 1,
0.1988578, -1.807813, 1.391957, 1, 1, 1, 1, 1,
0.199047, 0.3593418, 0.6031954, 1, 1, 1, 1, 1,
0.1991553, 0.8098366, -0.9541801, 1, 1, 1, 1, 1,
0.1995007, 0.5275933, 1.135853, 1, 1, 1, 1, 1,
0.2008469, 0.1001035, 0.3667137, 1, 1, 1, 1, 1,
0.2019908, 0.4839482, 0.8814794, 1, 1, 1, 1, 1,
0.2044045, 0.4174755, 0.7837211, 1, 1, 1, 1, 1,
0.2054089, 1.958318, -0.611566, 1, 1, 1, 1, 1,
0.2074833, 0.3905536, 1.034048, 1, 1, 1, 1, 1,
0.20922, 0.7213869, -1.160334, 1, 1, 1, 1, 1,
0.2109026, -0.4733002, 3.073786, 1, 1, 1, 1, 1,
0.2114336, -0.04903813, 1.979924, 1, 1, 1, 1, 1,
0.2118315, -0.8490371, 1.411279, 1, 1, 1, 1, 1,
0.2138246, 0.8623818, -0.2804833, 0, 0, 1, 1, 1,
0.2186692, -0.09557585, 3.009031, 1, 0, 0, 1, 1,
0.2241266, 0.3767363, 0.6594964, 1, 0, 0, 1, 1,
0.2271658, -0.3315321, 2.50812, 1, 0, 0, 1, 1,
0.2280673, -0.07006647, 1.233375, 1, 0, 0, 1, 1,
0.2298565, -0.7082114, 1.477289, 1, 0, 0, 1, 1,
0.2309224, -0.3881257, 4.213186, 0, 0, 0, 1, 1,
0.2342673, 0.3312825, 1.491984, 0, 0, 0, 1, 1,
0.2355124, -1.024416, 4.692464, 0, 0, 0, 1, 1,
0.2380341, 0.08531064, 0.315121, 0, 0, 0, 1, 1,
0.2387427, -0.3161702, 2.917049, 0, 0, 0, 1, 1,
0.2439317, 0.6204029, 1.125095, 0, 0, 0, 1, 1,
0.2466462, -0.4387829, 1.778318, 0, 0, 0, 1, 1,
0.249203, 1.621626, 0.6154938, 1, 1, 1, 1, 1,
0.2493903, 0.3517011, 0.1936168, 1, 1, 1, 1, 1,
0.250199, -0.1706315, 2.221866, 1, 1, 1, 1, 1,
0.2544491, 0.04874782, 2.042064, 1, 1, 1, 1, 1,
0.2604949, 1.246319, 0.5009398, 1, 1, 1, 1, 1,
0.2611246, -0.7617014, 2.822652, 1, 1, 1, 1, 1,
0.2612914, 0.8832356, -1.027303, 1, 1, 1, 1, 1,
0.2643261, 1.291675, -0.02771794, 1, 1, 1, 1, 1,
0.2649834, 1.507364, 0.8687417, 1, 1, 1, 1, 1,
0.2650429, -0.8254583, 2.061945, 1, 1, 1, 1, 1,
0.2709099, -0.02284597, 1.693105, 1, 1, 1, 1, 1,
0.2790339, 0.2155726, -0.2065939, 1, 1, 1, 1, 1,
0.2828721, 0.1347926, -0.8742216, 1, 1, 1, 1, 1,
0.2838371, -2.577323, 3.046287, 1, 1, 1, 1, 1,
0.2847573, 0.1388013, -1.479997, 1, 1, 1, 1, 1,
0.2892462, 0.9069816, 1.759814, 0, 0, 1, 1, 1,
0.2909238, 1.21563, -0.3554066, 1, 0, 0, 1, 1,
0.2975867, 1.0203, 0.3952708, 1, 0, 0, 1, 1,
0.2999933, 0.8835887, -0.09901088, 1, 0, 0, 1, 1,
0.3089136, -1.707352, 3.062209, 1, 0, 0, 1, 1,
0.3127051, -0.8861702, 1.844863, 1, 0, 0, 1, 1,
0.3144607, -0.1076438, 2.020432, 0, 0, 0, 1, 1,
0.3186499, -1.670436, 3.062336, 0, 0, 0, 1, 1,
0.3206451, -1.834397, 2.713046, 0, 0, 0, 1, 1,
0.3233431, -1.668746, 3.994986, 0, 0, 0, 1, 1,
0.3235218, -0.6758395, 4.384214, 0, 0, 0, 1, 1,
0.3236797, -0.9686134, 3.296945, 0, 0, 0, 1, 1,
0.3271326, 0.004550214, 2.112574, 0, 0, 0, 1, 1,
0.3297683, -0.9575366, 1.832001, 1, 1, 1, 1, 1,
0.3327117, -0.2611067, 3.843586, 1, 1, 1, 1, 1,
0.3351229, -0.6459516, 1.5471, 1, 1, 1, 1, 1,
0.3352863, -0.2037793, 2.134826, 1, 1, 1, 1, 1,
0.3359638, 2.590228, 1.615211, 1, 1, 1, 1, 1,
0.3394843, -0.8497865, 2.415111, 1, 1, 1, 1, 1,
0.3413234, 0.9349898, -1.262557, 1, 1, 1, 1, 1,
0.3416095, -0.3773042, 3.118095, 1, 1, 1, 1, 1,
0.3420975, -0.1192097, 2.41907, 1, 1, 1, 1, 1,
0.3430468, 1.038645, -0.3126481, 1, 1, 1, 1, 1,
0.3484623, -0.5380673, 2.056565, 1, 1, 1, 1, 1,
0.3512372, -0.4291552, 4.73945, 1, 1, 1, 1, 1,
0.3523439, -0.9062403, 2.053969, 1, 1, 1, 1, 1,
0.3527521, -0.3605467, 2.616662, 1, 1, 1, 1, 1,
0.3528033, 0.5662858, 1.632805, 1, 1, 1, 1, 1,
0.3544429, 0.454955, -0.3788649, 0, 0, 1, 1, 1,
0.3544782, -0.4388762, 5.00784, 1, 0, 0, 1, 1,
0.3553887, -0.4279974, 1.386788, 1, 0, 0, 1, 1,
0.3566448, 0.6661029, 1.850985, 1, 0, 0, 1, 1,
0.3672735, 1.220561, -0.1927291, 1, 0, 0, 1, 1,
0.3699876, 0.3863365, 1.68113, 1, 0, 0, 1, 1,
0.3735977, -0.7058654, 1.923263, 0, 0, 0, 1, 1,
0.3780797, -1.9163, 3.475345, 0, 0, 0, 1, 1,
0.3781405, 2.718871, 0.5802603, 0, 0, 0, 1, 1,
0.3794544, 0.09625838, 1.164224, 0, 0, 0, 1, 1,
0.383476, 0.3071219, 1.989759, 0, 0, 0, 1, 1,
0.3848757, 0.07189407, 2.296422, 0, 0, 0, 1, 1,
0.3864478, 0.1040481, 1.062317, 0, 0, 0, 1, 1,
0.3865715, 0.3564042, 0.3042381, 1, 1, 1, 1, 1,
0.3877759, 0.3969658, -0.5246779, 1, 1, 1, 1, 1,
0.3921291, -0.6574164, 4.234461, 1, 1, 1, 1, 1,
0.393313, 1.312583, 0.3617324, 1, 1, 1, 1, 1,
0.3962893, 0.7401146, -0.4827463, 1, 1, 1, 1, 1,
0.3964866, 0.05746621, 0.8438707, 1, 1, 1, 1, 1,
0.3969941, 1.183685, 2.8694, 1, 1, 1, 1, 1,
0.4051101, 0.483174, 0.2001325, 1, 1, 1, 1, 1,
0.4051123, -2.412504, 3.474391, 1, 1, 1, 1, 1,
0.4089836, 0.4279562, 2.052795, 1, 1, 1, 1, 1,
0.413299, -2.683852, 2.603026, 1, 1, 1, 1, 1,
0.4172207, 0.3193006, -0.3951064, 1, 1, 1, 1, 1,
0.4198621, 0.9274973, -1.165359, 1, 1, 1, 1, 1,
0.420878, -1.06086, 3.159415, 1, 1, 1, 1, 1,
0.4255609, -1.75272, 3.012078, 1, 1, 1, 1, 1,
0.4273263, -0.7086717, 0.7139737, 0, 0, 1, 1, 1,
0.432392, 0.0472068, 0.6079925, 1, 0, 0, 1, 1,
0.4330977, 1.059114, -0.08913101, 1, 0, 0, 1, 1,
0.4405837, 0.4942337, 0.264672, 1, 0, 0, 1, 1,
0.4407772, 0.9105331, 0.4425408, 1, 0, 0, 1, 1,
0.4413275, -1.005903, 2.271066, 1, 0, 0, 1, 1,
0.4451826, -0.01818315, 3.035491, 0, 0, 0, 1, 1,
0.449646, -1.119955, 3.128082, 0, 0, 0, 1, 1,
0.4512925, 0.4029136, 0.5073531, 0, 0, 0, 1, 1,
0.4521545, -2.468486, 4.387632, 0, 0, 0, 1, 1,
0.4539172, 0.9124355, 1.429225, 0, 0, 0, 1, 1,
0.4577732, -0.7487419, 4.109138, 0, 0, 0, 1, 1,
0.4623906, 0.4538622, 0.3778962, 0, 0, 0, 1, 1,
0.4671716, -1.187162, 2.69556, 1, 1, 1, 1, 1,
0.4712425, 0.1574208, 0.6795191, 1, 1, 1, 1, 1,
0.4712495, -0.0503408, 1.411916, 1, 1, 1, 1, 1,
0.4721612, -0.8170075, 1.455469, 1, 1, 1, 1, 1,
0.4728127, -0.992717, 4.073501, 1, 1, 1, 1, 1,
0.4729858, 0.1183159, -0.07940011, 1, 1, 1, 1, 1,
0.4741634, 1.041505, 0.6125042, 1, 1, 1, 1, 1,
0.4792033, -0.7782618, 2.753059, 1, 1, 1, 1, 1,
0.4805817, 1.707645, 0.07627536, 1, 1, 1, 1, 1,
0.4848076, 0.679387, -1.195919, 1, 1, 1, 1, 1,
0.4952724, -0.3413166, 3.535227, 1, 1, 1, 1, 1,
0.499971, -1.835505, 2.782319, 1, 1, 1, 1, 1,
0.5105897, -2.328333, 3.908755, 1, 1, 1, 1, 1,
0.5107764, -1.169602, 1.829506, 1, 1, 1, 1, 1,
0.5137994, 0.9188139, 0.4987406, 1, 1, 1, 1, 1,
0.5170453, -0.498989, 2.826547, 0, 0, 1, 1, 1,
0.5347253, -0.5071195, 1.119934, 1, 0, 0, 1, 1,
0.5363904, 0.2996273, -0.5251719, 1, 0, 0, 1, 1,
0.5486993, 0.2815421, 2.31753, 1, 0, 0, 1, 1,
0.5512182, 1.711394, 1.147246, 1, 0, 0, 1, 1,
0.5526604, 0.3600746, 0.1697087, 1, 0, 0, 1, 1,
0.5571368, 0.1065619, 0.5373952, 0, 0, 0, 1, 1,
0.5607863, -0.2090644, 1.530024, 0, 0, 0, 1, 1,
0.565623, -1.404041, 2.084795, 0, 0, 0, 1, 1,
0.5661658, 0.08192182, 2.0333, 0, 0, 0, 1, 1,
0.5666841, -0.725454, 3.948326, 0, 0, 0, 1, 1,
0.5691481, 0.2929952, 0.8289096, 0, 0, 0, 1, 1,
0.5730798, 0.01693236, 1.447414, 0, 0, 0, 1, 1,
0.5739118, 0.8812429, 0.3635676, 1, 1, 1, 1, 1,
0.5755957, -1.186776, 1.645743, 1, 1, 1, 1, 1,
0.5780066, 0.4086313, 0.1125353, 1, 1, 1, 1, 1,
0.5781816, -2.025296, 2.634818, 1, 1, 1, 1, 1,
0.5783666, 0.7882736, -0.1172414, 1, 1, 1, 1, 1,
0.5805914, -0.7499485, 1.786346, 1, 1, 1, 1, 1,
0.5820433, -1.502495, 1.900324, 1, 1, 1, 1, 1,
0.5821522, -0.1572556, 1.687368, 1, 1, 1, 1, 1,
0.5829811, 1.331857, 1.787504, 1, 1, 1, 1, 1,
0.5836353, -1.928957, 2.773782, 1, 1, 1, 1, 1,
0.5841832, -1.389029, 2.35392, 1, 1, 1, 1, 1,
0.5843282, -1.258862, 2.557542, 1, 1, 1, 1, 1,
0.5859434, -1.889603, 1.708992, 1, 1, 1, 1, 1,
0.5885004, -0.966823, 2.034295, 1, 1, 1, 1, 1,
0.5989913, -0.3754405, 0.6951126, 1, 1, 1, 1, 1,
0.6018446, 0.2065839, 2.068126, 0, 0, 1, 1, 1,
0.6081801, -0.8499895, 1.828224, 1, 0, 0, 1, 1,
0.6082287, 1.244099, 0.4910133, 1, 0, 0, 1, 1,
0.6178361, 0.9083768, 0.586848, 1, 0, 0, 1, 1,
0.6182079, 0.2272084, 1.870304, 1, 0, 0, 1, 1,
0.6206021, -0.06522034, 1.130615, 1, 0, 0, 1, 1,
0.6227505, -0.05249643, 1.911515, 0, 0, 0, 1, 1,
0.6253669, -1.615602, 2.940649, 0, 0, 0, 1, 1,
0.629952, 0.4936299, -0.600018, 0, 0, 0, 1, 1,
0.6307687, -2.377737, 3.634322, 0, 0, 0, 1, 1,
0.6364217, 1.317819, -0.9799168, 0, 0, 0, 1, 1,
0.6377005, -0.6668587, 2.600844, 0, 0, 0, 1, 1,
0.6410247, 0.4752425, 0.2684492, 0, 0, 0, 1, 1,
0.643672, 0.582081, -0.6662221, 1, 1, 1, 1, 1,
0.6559881, 0.02717127, 2.166654, 1, 1, 1, 1, 1,
0.6579284, 0.7686831, -0.131435, 1, 1, 1, 1, 1,
0.6622252, -0.6486265, 2.420001, 1, 1, 1, 1, 1,
0.6648583, 0.6256757, 1.514924, 1, 1, 1, 1, 1,
0.6662259, -1.167388, 3.289055, 1, 1, 1, 1, 1,
0.670316, -0.4418028, 2.256176, 1, 1, 1, 1, 1,
0.6710209, -0.8734061, 1.997914, 1, 1, 1, 1, 1,
0.671454, -0.7869577, 2.268933, 1, 1, 1, 1, 1,
0.6723782, -1.167884, 1.435854, 1, 1, 1, 1, 1,
0.6733902, -0.6959203, 2.002318, 1, 1, 1, 1, 1,
0.6737496, -0.2742423, 1.73998, 1, 1, 1, 1, 1,
0.6772153, 0.8553328, 0.6591202, 1, 1, 1, 1, 1,
0.6823847, 1.134289, 0.1520975, 1, 1, 1, 1, 1,
0.6837754, 1.427714, 0.2435023, 1, 1, 1, 1, 1,
0.6870068, 0.1999633, 0.6486447, 0, 0, 1, 1, 1,
0.6876004, 0.1581472, -0.7324576, 1, 0, 0, 1, 1,
0.694196, 0.3612559, 2.136856, 1, 0, 0, 1, 1,
0.6954889, -0.4696255, 2.014978, 1, 0, 0, 1, 1,
0.6967092, 0.2786216, 2.888338, 1, 0, 0, 1, 1,
0.6969755, 0.8901347, 2.519471, 1, 0, 0, 1, 1,
0.6995951, -0.1383643, 1.988268, 0, 0, 0, 1, 1,
0.6998261, -1.89279, 3.717927, 0, 0, 0, 1, 1,
0.7020751, 2.142972, -0.8614209, 0, 0, 0, 1, 1,
0.7096847, 0.1450638, 1.401286, 0, 0, 0, 1, 1,
0.7241902, -0.6177639, 1.88581, 0, 0, 0, 1, 1,
0.7295696, -0.747301, 3.529035, 0, 0, 0, 1, 1,
0.7301519, -1.949962, 3.543466, 0, 0, 0, 1, 1,
0.7330557, -0.3805092, 1.421514, 1, 1, 1, 1, 1,
0.7334716, 0.6130299, 0.522213, 1, 1, 1, 1, 1,
0.7435498, -0.7861267, 1.080889, 1, 1, 1, 1, 1,
0.7459927, 0.237364, 1.101199, 1, 1, 1, 1, 1,
0.7464516, 0.4083963, 2.743612, 1, 1, 1, 1, 1,
0.750997, 0.4731081, 1.181432, 1, 1, 1, 1, 1,
0.7546307, 0.1733637, 2.427755, 1, 1, 1, 1, 1,
0.7551629, 1.303484, -0.3938193, 1, 1, 1, 1, 1,
0.7572595, -0.4410212, 1.917488, 1, 1, 1, 1, 1,
0.7577608, 1.440422, 1.019154, 1, 1, 1, 1, 1,
0.757778, -1.742509, 3.822961, 1, 1, 1, 1, 1,
0.7845881, -0.4009801, 3.357894, 1, 1, 1, 1, 1,
0.7884997, 0.7236075, -0.03430826, 1, 1, 1, 1, 1,
0.7939669, 0.688514, 1.152121, 1, 1, 1, 1, 1,
0.7985594, -0.6332983, 3.434413, 1, 1, 1, 1, 1,
0.7993288, -0.3189619, 2.012711, 0, 0, 1, 1, 1,
0.8043862, 0.2415707, 1.746075, 1, 0, 0, 1, 1,
0.8071492, -0.247955, 1.49292, 1, 0, 0, 1, 1,
0.8075817, 1.215983, 0.04606976, 1, 0, 0, 1, 1,
0.8130727, -0.6207049, 2.508814, 1, 0, 0, 1, 1,
0.8254292, 1.205533, 1.518944, 1, 0, 0, 1, 1,
0.8291712, 0.6007316, 1.366425, 0, 0, 0, 1, 1,
0.8298447, -0.9283425, 2.250147, 0, 0, 0, 1, 1,
0.8397178, 0.3230794, 0.7530303, 0, 0, 0, 1, 1,
0.8401563, -1.975733, 2.207391, 0, 0, 0, 1, 1,
0.8475909, 1.14588, 0.1773405, 0, 0, 0, 1, 1,
0.8489062, 0.4857756, 1.917539, 0, 0, 0, 1, 1,
0.8634385, -0.3463037, 1.568785, 0, 0, 0, 1, 1,
0.8654386, -0.9313087, 2.243664, 1, 1, 1, 1, 1,
0.8720459, -0.4831423, 2.320384, 1, 1, 1, 1, 1,
0.8724082, -0.5893495, 0.9897491, 1, 1, 1, 1, 1,
0.8758572, -0.05839689, 1.038355, 1, 1, 1, 1, 1,
0.8764939, 0.09944763, 2.435737, 1, 1, 1, 1, 1,
0.8799766, -0.9950781, 1.332973, 1, 1, 1, 1, 1,
0.880399, 0.7444056, 0.7121272, 1, 1, 1, 1, 1,
0.8846891, 1.209265, 1.956735, 1, 1, 1, 1, 1,
0.8871306, -0.3941303, 1.404486, 1, 1, 1, 1, 1,
0.8874669, 0.5903191, 0.7772816, 1, 1, 1, 1, 1,
0.8942935, 0.5808924, 0.3745724, 1, 1, 1, 1, 1,
0.9015319, 1.564903, -0.1307873, 1, 1, 1, 1, 1,
0.9068133, -0.06190655, 1.627675, 1, 1, 1, 1, 1,
0.9086925, -0.6933302, 0.8816509, 1, 1, 1, 1, 1,
0.9104565, -0.06205722, 1.178811, 1, 1, 1, 1, 1,
0.9115694, 0.1181228, 1.046273, 0, 0, 1, 1, 1,
0.9131395, 0.4113864, 1.688757, 1, 0, 0, 1, 1,
0.9150373, 0.3421329, 1.817668, 1, 0, 0, 1, 1,
0.9281185, 0.2153134, 0.3990119, 1, 0, 0, 1, 1,
0.9289951, 1.031768, 0.6794685, 1, 0, 0, 1, 1,
0.9295068, 0.08299818, 0.701519, 1, 0, 0, 1, 1,
0.9438282, 0.7461851, 0.06850779, 0, 0, 0, 1, 1,
0.9452069, -0.2513927, 1.808711, 0, 0, 0, 1, 1,
0.9487225, -0.001884813, 1.645358, 0, 0, 0, 1, 1,
0.9498844, 0.9129642, -0.09256678, 0, 0, 0, 1, 1,
0.9574233, -1.374952, 2.974093, 0, 0, 0, 1, 1,
0.9579193, -0.02042219, 0.6163286, 0, 0, 0, 1, 1,
0.9630765, -0.738513, 2.198728, 0, 0, 0, 1, 1,
0.967925, 0.1268347, 1.191211, 1, 1, 1, 1, 1,
0.9679899, 0.2273367, 1.389155, 1, 1, 1, 1, 1,
0.9709211, 0.4955881, 1.808203, 1, 1, 1, 1, 1,
0.9758054, 1.632321, 0.4027187, 1, 1, 1, 1, 1,
0.9789599, -1.145535, 3.883223, 1, 1, 1, 1, 1,
0.9792055, 0.9695551, 1.376179, 1, 1, 1, 1, 1,
0.9817246, -0.8211202, 3.067336, 1, 1, 1, 1, 1,
0.9891388, -1.776505, 1.936845, 1, 1, 1, 1, 1,
0.9928147, 0.8251524, 1.850113, 1, 1, 1, 1, 1,
1.001048, 0.4634531, 1.702849, 1, 1, 1, 1, 1,
1.003613, -1.509097, 2.281856, 1, 1, 1, 1, 1,
1.006846, 1.284099, 1.11145, 1, 1, 1, 1, 1,
1.010178, -1.030783, 1.896699, 1, 1, 1, 1, 1,
1.010542, 1.491222, 1.504107, 1, 1, 1, 1, 1,
1.01186, -0.7384144, 2.742743, 1, 1, 1, 1, 1,
1.02308, -0.3647361, 1.576737, 0, 0, 1, 1, 1,
1.024111, 1.544611, 2.280229, 1, 0, 0, 1, 1,
1.026194, 0.7161946, 0.5862953, 1, 0, 0, 1, 1,
1.029697, -1.01196, 2.362776, 1, 0, 0, 1, 1,
1.033218, 1.435208, -0.5481793, 1, 0, 0, 1, 1,
1.038639, -0.005022123, 2.392373, 1, 0, 0, 1, 1,
1.053391, 0.6648589, 1.776698, 0, 0, 0, 1, 1,
1.060754, -0.4164449, 2.228456, 0, 0, 0, 1, 1,
1.061028, 0.5112152, 0.6408929, 0, 0, 0, 1, 1,
1.061217, -0.9393418, 3.50534, 0, 0, 0, 1, 1,
1.06123, 1.936006, 0.1941667, 0, 0, 0, 1, 1,
1.06241, -1.698275, 3.232258, 0, 0, 0, 1, 1,
1.074192, 1.443809, -0.1402857, 0, 0, 0, 1, 1,
1.080921, -0.7313106, 2.556008, 1, 1, 1, 1, 1,
1.081564, -0.4398646, 1.550193, 1, 1, 1, 1, 1,
1.087311, -0.7676044, 2.610836, 1, 1, 1, 1, 1,
1.089287, -0.6288896, 2.108532, 1, 1, 1, 1, 1,
1.092326, 0.4075333, 2.01872, 1, 1, 1, 1, 1,
1.095585, 0.2051948, 2.575071, 1, 1, 1, 1, 1,
1.099495, 0.8511967, 0.9680517, 1, 1, 1, 1, 1,
1.101014, 0.8181263, 0.5744723, 1, 1, 1, 1, 1,
1.103276, 2.299258, 1.620512, 1, 1, 1, 1, 1,
1.104753, -1.055611, 1.427266, 1, 1, 1, 1, 1,
1.110234, -0.5163302, 1.364352, 1, 1, 1, 1, 1,
1.118021, 0.4649135, 2.723696, 1, 1, 1, 1, 1,
1.12587, 0.8399003, 0.9101891, 1, 1, 1, 1, 1,
1.12855, -1.603998, 2.588392, 1, 1, 1, 1, 1,
1.131471, -0.02075558, 2.531106, 1, 1, 1, 1, 1,
1.132513, 0.06334704, 2.49032, 0, 0, 1, 1, 1,
1.134658, -0.06598742, 2.38556, 1, 0, 0, 1, 1,
1.143893, 0.772135, 1.333562, 1, 0, 0, 1, 1,
1.149913, -0.1291499, 2.228861, 1, 0, 0, 1, 1,
1.150705, -1.602397, 0.7822083, 1, 0, 0, 1, 1,
1.155087, -0.8797656, 3.924726, 1, 0, 0, 1, 1,
1.1644, 1.023536, 1.597166, 0, 0, 0, 1, 1,
1.179327, 0.06860039, 1.607693, 0, 0, 0, 1, 1,
1.179375, 0.6134425, 1.52316, 0, 0, 0, 1, 1,
1.181945, 0.898711, 0.03409759, 0, 0, 0, 1, 1,
1.191564, -0.4659834, 1.684179, 0, 0, 0, 1, 1,
1.193525, 0.8139767, 1.333169, 0, 0, 0, 1, 1,
1.195233, -1.350306, 1.413404, 0, 0, 0, 1, 1,
1.198265, -0.2926342, 0.2589637, 1, 1, 1, 1, 1,
1.198928, -0.8089652, 2.57246, 1, 1, 1, 1, 1,
1.210129, 0.03267149, 1.585139, 1, 1, 1, 1, 1,
1.210318, 0.1699738, 0.4634417, 1, 1, 1, 1, 1,
1.211181, -0.7661346, 3.685089, 1, 1, 1, 1, 1,
1.218686, -0.3210717, -0.002227321, 1, 1, 1, 1, 1,
1.222058, 0.8872523, -0.07229934, 1, 1, 1, 1, 1,
1.223658, -0.1466033, 1.799707, 1, 1, 1, 1, 1,
1.225128, 0.3979229, 0.2961916, 1, 1, 1, 1, 1,
1.228319, -0.1354095, 1.616128, 1, 1, 1, 1, 1,
1.229407, 0.7274158, 1.371621, 1, 1, 1, 1, 1,
1.23677, -1.424846, 3.202604, 1, 1, 1, 1, 1,
1.237845, 0.2724932, 2.956487, 1, 1, 1, 1, 1,
1.238642, 0.2482243, 2.452447, 1, 1, 1, 1, 1,
1.240537, 0.5560722, 1.505963, 1, 1, 1, 1, 1,
1.248287, 0.839341, 0.7979528, 0, 0, 1, 1, 1,
1.252612, -0.7110523, 2.691604, 1, 0, 0, 1, 1,
1.258202, 0.4535659, -0.2255939, 1, 0, 0, 1, 1,
1.259737, 0.7819396, 1.404244, 1, 0, 0, 1, 1,
1.276548, 0.9056239, -0.089636, 1, 0, 0, 1, 1,
1.283562, -0.2070411, 1.856911, 1, 0, 0, 1, 1,
1.29242, -0.170191, 1.470722, 0, 0, 0, 1, 1,
1.297934, 1.273157, 0.4169921, 0, 0, 0, 1, 1,
1.302637, -0.1986736, 1.744994, 0, 0, 0, 1, 1,
1.303886, 1.996208, -0.03377437, 0, 0, 0, 1, 1,
1.307567, 1.001432, 0.4065606, 0, 0, 0, 1, 1,
1.315603, 1.963117, 0.4606734, 0, 0, 0, 1, 1,
1.317952, -0.6361138, 2.624896, 0, 0, 0, 1, 1,
1.327528, 1.277335, -0.04659669, 1, 1, 1, 1, 1,
1.328084, 1.137694, 1.282587, 1, 1, 1, 1, 1,
1.328592, -1.429206, 1.261588, 1, 1, 1, 1, 1,
1.328882, -0.01256245, 1.133193, 1, 1, 1, 1, 1,
1.334472, -0.1264078, 1.722039, 1, 1, 1, 1, 1,
1.341553, -0.3144261, 1.50144, 1, 1, 1, 1, 1,
1.344664, 0.4044253, 1.587785, 1, 1, 1, 1, 1,
1.34763, -0.743325, 3.012375, 1, 1, 1, 1, 1,
1.348817, 2.175553, 0.8840167, 1, 1, 1, 1, 1,
1.353817, -2.020703, 2.958717, 1, 1, 1, 1, 1,
1.354096, -0.5095197, 1.835598, 1, 1, 1, 1, 1,
1.359659, -1.04811, 3.239655, 1, 1, 1, 1, 1,
1.379429, -0.8757553, 3.16749, 1, 1, 1, 1, 1,
1.396192, -0.3783556, 2.939063, 1, 1, 1, 1, 1,
1.399194, 0.6025515, 3.389888, 1, 1, 1, 1, 1,
1.400382, 0.1827597, 2.006916, 0, 0, 1, 1, 1,
1.403729, 0.7791772, 0.4232115, 1, 0, 0, 1, 1,
1.405496, 0.5821345, 1.043878, 1, 0, 0, 1, 1,
1.412498, -0.2670746, 2.104923, 1, 0, 0, 1, 1,
1.41441, -0.8127463, 0.02634493, 1, 0, 0, 1, 1,
1.414419, 0.5281709, 1.615419, 1, 0, 0, 1, 1,
1.414981, 1.714773, -1.272107, 0, 0, 0, 1, 1,
1.418775, -1.089837, 1.767477, 0, 0, 0, 1, 1,
1.422267, 0.6477894, 2.053176, 0, 0, 0, 1, 1,
1.429258, 1.273054, 0.3989822, 0, 0, 0, 1, 1,
1.432159, 1.063655, -0.002552044, 0, 0, 0, 1, 1,
1.433856, 1.153024, 1.36799, 0, 0, 0, 1, 1,
1.451481, 0.1076834, 2.128135, 0, 0, 0, 1, 1,
1.468608, 1.18736, 0.7100885, 1, 1, 1, 1, 1,
1.473831, 0.3958385, 1.155992, 1, 1, 1, 1, 1,
1.486959, -0.3096454, 1.733138, 1, 1, 1, 1, 1,
1.490125, -0.3518485, 1.602933, 1, 1, 1, 1, 1,
1.492172, 1.195195, -0.6693124, 1, 1, 1, 1, 1,
1.512506, -0.9088077, 3.103504, 1, 1, 1, 1, 1,
1.548457, -1.026244, 2.95954, 1, 1, 1, 1, 1,
1.568622, -0.6876235, 1.10444, 1, 1, 1, 1, 1,
1.574017, 0.462184, 1.160123, 1, 1, 1, 1, 1,
1.581796, -0.6251622, 1.677278, 1, 1, 1, 1, 1,
1.592813, -0.5862084, 1.553072, 1, 1, 1, 1, 1,
1.60193, 0.06334969, 2.041353, 1, 1, 1, 1, 1,
1.624926, 1.224065, 0.4523275, 1, 1, 1, 1, 1,
1.62916, -0.8248127, 2.156315, 1, 1, 1, 1, 1,
1.637694, 0.822827, 1.310985, 1, 1, 1, 1, 1,
1.6441, 0.006962469, -0.2044758, 0, 0, 1, 1, 1,
1.662194, 0.3122766, 2.592974, 1, 0, 0, 1, 1,
1.676048, 0.9092463, 2.778788, 1, 0, 0, 1, 1,
1.680574, 0.7693743, 0.2863898, 1, 0, 0, 1, 1,
1.68626, 0.9199493, 2.491545, 1, 0, 0, 1, 1,
1.703454, -0.3601318, 1.793918, 1, 0, 0, 1, 1,
1.736084, 1.299569, 1.190749, 0, 0, 0, 1, 1,
1.740286, 0.1811953, 1.659093, 0, 0, 0, 1, 1,
1.747032, 0.2652287, 1.803214, 0, 0, 0, 1, 1,
1.781122, 0.2790382, 1.31909, 0, 0, 0, 1, 1,
1.825541, -0.3551256, 2.576217, 0, 0, 0, 1, 1,
1.828709, -0.3928482, 1.575751, 0, 0, 0, 1, 1,
1.82894, 0.584389, 0.9014793, 0, 0, 0, 1, 1,
1.84999, -0.1713468, 3.816582, 1, 1, 1, 1, 1,
1.850328, -0.1292578, 2.097021, 1, 1, 1, 1, 1,
1.864926, 1.447401, 0.9265277, 1, 1, 1, 1, 1,
1.870794, 0.5087929, 1.648095, 1, 1, 1, 1, 1,
1.883251, 0.9449314, -1.112947, 1, 1, 1, 1, 1,
1.883826, 0.8775809, 1.372253, 1, 1, 1, 1, 1,
1.887169, -1.22819, 1.105257, 1, 1, 1, 1, 1,
1.908932, -0.3707101, 2.57595, 1, 1, 1, 1, 1,
1.950713, -0.6735863, 1.983759, 1, 1, 1, 1, 1,
1.958761, -0.2182523, 2.676383, 1, 1, 1, 1, 1,
1.994902, 1.491777, 1.503249, 1, 1, 1, 1, 1,
2.005738, 1.753698, 0.8568078, 1, 1, 1, 1, 1,
2.026949, 0.8751242, 2.09405, 1, 1, 1, 1, 1,
2.045542, 0.2084821, 0.616977, 1, 1, 1, 1, 1,
2.080325, 0.6741337, 0.2890619, 1, 1, 1, 1, 1,
2.109095, 0.2778409, 1.116244, 0, 0, 1, 1, 1,
2.111106, 2.118573, 2.998631, 1, 0, 0, 1, 1,
2.126659, 1.68232, -1.391839, 1, 0, 0, 1, 1,
2.182211, 0.9902987, 2.022099, 1, 0, 0, 1, 1,
2.186016, -1.563865, 1.049999, 1, 0, 0, 1, 1,
2.235828, -1.767212, 2.849425, 1, 0, 0, 1, 1,
2.253033, 0.3900964, 1.544924, 0, 0, 0, 1, 1,
2.255356, 1.53178, 0.5476072, 0, 0, 0, 1, 1,
2.305891, -1.196106, 3.491944, 0, 0, 0, 1, 1,
2.328627, 0.5872023, 2.316449, 0, 0, 0, 1, 1,
2.34924, -0.08270381, 2.37857, 0, 0, 0, 1, 1,
2.383902, -1.302325, 2.486955, 0, 0, 0, 1, 1,
2.402048, 0.2978486, 1.520048, 0, 0, 0, 1, 1,
2.419698, -0.3802832, 1.796496, 1, 1, 1, 1, 1,
2.467355, -1.870671, 1.209392, 1, 1, 1, 1, 1,
2.490012, 0.3894029, 1.533945, 1, 1, 1, 1, 1,
2.519156, -0.06018341, 1.382003, 1, 1, 1, 1, 1,
2.53954, 0.03799358, 3.279874, 1, 1, 1, 1, 1,
2.605686, -1.031094, 3.573653, 1, 1, 1, 1, 1,
3.395307, 1.325822, 1.75754, 1, 1, 1, 1, 1
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
var radius = 9.861091;
var distance = 34.63667;
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
mvMatrix.translate( -0.1671662, -0.09100127, 0.7078228 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63667);
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
