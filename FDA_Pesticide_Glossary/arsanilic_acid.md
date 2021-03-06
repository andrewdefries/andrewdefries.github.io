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
-3.445154, -1.254833, -0.06843641, 1, 0, 0, 1,
-3.331198, 0.2758197, -2.115516, 1, 0.007843138, 0, 1,
-3.149503, 0.2818438, -1.875526, 1, 0.01176471, 0, 1,
-3.129228, -0.5441512, -1.355652, 1, 0.01960784, 0, 1,
-3.067287, -1.036222, -1.243587, 1, 0.02352941, 0, 1,
-2.990633, 2.721121, -2.278151, 1, 0.03137255, 0, 1,
-2.677717, 0.004044887, -2.072949, 1, 0.03529412, 0, 1,
-2.638998, 0.1462505, -0.5549834, 1, 0.04313726, 0, 1,
-2.456784, -0.5262769, -0.7674421, 1, 0.04705882, 0, 1,
-2.397273, -0.8739604, -2.74849, 1, 0.05490196, 0, 1,
-2.341438, 0.7028828, -2.330138, 1, 0.05882353, 0, 1,
-2.327631, -0.4431885, -1.755855, 1, 0.06666667, 0, 1,
-2.306685, -0.2998805, -1.893182, 1, 0.07058824, 0, 1,
-2.299527, -1.354186, -2.814651, 1, 0.07843138, 0, 1,
-2.27783, 0.7565202, 0.3412374, 1, 0.08235294, 0, 1,
-2.224372, -0.8265733, -3.232536, 1, 0.09019608, 0, 1,
-2.179296, 0.2678916, -0.1515044, 1, 0.09411765, 0, 1,
-2.16945, 2.250053, -0.8037156, 1, 0.1019608, 0, 1,
-2.079392, -1.157299, -1.868949, 1, 0.1098039, 0, 1,
-2.06191, 0.6158707, -2.411728, 1, 0.1137255, 0, 1,
-2.021399, 0.3464437, -3.039065, 1, 0.1215686, 0, 1,
-2.009511, 0.4406407, -0.163675, 1, 0.1254902, 0, 1,
-1.954799, 0.4925002, -0.3447032, 1, 0.1333333, 0, 1,
-1.953042, -0.9266094, -2.455149, 1, 0.1372549, 0, 1,
-1.950722, -0.4887401, -3.175865, 1, 0.145098, 0, 1,
-1.948843, -0.6469324, -3.342426, 1, 0.1490196, 0, 1,
-1.946645, -1.762743, -0.4201512, 1, 0.1568628, 0, 1,
-1.942282, -0.5118175, -1.918489, 1, 0.1607843, 0, 1,
-1.928802, -0.6007718, -0.7551591, 1, 0.1686275, 0, 1,
-1.914124, -0.0350472, -2.66469, 1, 0.172549, 0, 1,
-1.904481, -0.1343184, -0.8508886, 1, 0.1803922, 0, 1,
-1.870381, 0.2848045, -2.406164, 1, 0.1843137, 0, 1,
-1.866307, -0.3217512, -1.171031, 1, 0.1921569, 0, 1,
-1.826886, 1.132742, 0.5853857, 1, 0.1960784, 0, 1,
-1.826476, -0.06076494, 1.084546, 1, 0.2039216, 0, 1,
-1.805952, 0.4786972, -0.5318767, 1, 0.2117647, 0, 1,
-1.733518, 1.680396, -2.376154, 1, 0.2156863, 0, 1,
-1.681512, -1.000824, -0.3078198, 1, 0.2235294, 0, 1,
-1.658451, 0.6795989, -2.374066, 1, 0.227451, 0, 1,
-1.633456, 2.087615, 0.8751339, 1, 0.2352941, 0, 1,
-1.633032, 0.9814418, -3.139838, 1, 0.2392157, 0, 1,
-1.623822, -1.000516, -2.357046, 1, 0.2470588, 0, 1,
-1.619632, 0.421167, -0.4702817, 1, 0.2509804, 0, 1,
-1.610165, 0.7163829, -1.537841, 1, 0.2588235, 0, 1,
-1.608592, 0.1335792, -3.741518, 1, 0.2627451, 0, 1,
-1.592694, 1.48548, -1.336833, 1, 0.2705882, 0, 1,
-1.590467, 1.184029, -1.095645, 1, 0.2745098, 0, 1,
-1.576392, -0.5889265, -2.499251, 1, 0.282353, 0, 1,
-1.571113, 0.3756151, -1.410843, 1, 0.2862745, 0, 1,
-1.570493, 1.276556, -0.2275198, 1, 0.2941177, 0, 1,
-1.567373, 0.2024489, -0.3486349, 1, 0.3019608, 0, 1,
-1.539886, -0.4719266, -1.778421, 1, 0.3058824, 0, 1,
-1.537474, -1.642183, -2.073123, 1, 0.3137255, 0, 1,
-1.534927, -0.9000971, -1.491346, 1, 0.3176471, 0, 1,
-1.523869, 0.1747346, -1.288662, 1, 0.3254902, 0, 1,
-1.510385, 0.690415, -0.4316494, 1, 0.3294118, 0, 1,
-1.504555, -1.228714, -2.999479, 1, 0.3372549, 0, 1,
-1.488009, -0.3131993, -1.035622, 1, 0.3411765, 0, 1,
-1.485665, 0.7768689, -1.671774, 1, 0.3490196, 0, 1,
-1.483706, 0.9697016, -2.56156, 1, 0.3529412, 0, 1,
-1.477133, -1.08404, -2.881868, 1, 0.3607843, 0, 1,
-1.424002, 0.3936047, -2.140325, 1, 0.3647059, 0, 1,
-1.42216, 1.204299, -1.878626, 1, 0.372549, 0, 1,
-1.418335, -1.306618, -3.467432, 1, 0.3764706, 0, 1,
-1.416577, -0.1436947, -2.61147, 1, 0.3843137, 0, 1,
-1.414034, -0.2751593, -5.23755, 1, 0.3882353, 0, 1,
-1.403178, -0.3119656, -1.553796, 1, 0.3960784, 0, 1,
-1.390892, 0.273387, -0.6107155, 1, 0.4039216, 0, 1,
-1.387986, -1.682835, -3.20095, 1, 0.4078431, 0, 1,
-1.38689, 0.2536561, -1.281052, 1, 0.4156863, 0, 1,
-1.386887, -1.372873, -1.470114, 1, 0.4196078, 0, 1,
-1.381484, -1.216653, -2.388225, 1, 0.427451, 0, 1,
-1.373127, -0.7530356, -1.805465, 1, 0.4313726, 0, 1,
-1.349981, -1.846977, -4.14085, 1, 0.4392157, 0, 1,
-1.341906, 2.288835, -0.06459003, 1, 0.4431373, 0, 1,
-1.337383, -0.05686982, -2.994898, 1, 0.4509804, 0, 1,
-1.320386, -2.372036, -1.537388, 1, 0.454902, 0, 1,
-1.314061, -0.07442962, -2.95988, 1, 0.4627451, 0, 1,
-1.310098, -0.7609345, -3.686254, 1, 0.4666667, 0, 1,
-1.307598, 1.013987, -0.4170748, 1, 0.4745098, 0, 1,
-1.299597, -0.6323311, -2.752355, 1, 0.4784314, 0, 1,
-1.291391, 1.528724, -2.159791, 1, 0.4862745, 0, 1,
-1.273807, 1.165286, -1.766705, 1, 0.4901961, 0, 1,
-1.261832, 0.1888466, -3.617495, 1, 0.4980392, 0, 1,
-1.252588, 0.9275091, -1.408447, 1, 0.5058824, 0, 1,
-1.233312, 0.3701129, -0.4118969, 1, 0.509804, 0, 1,
-1.224694, -0.5892368, -3.279894, 1, 0.5176471, 0, 1,
-1.224619, -0.07977105, -1.653568, 1, 0.5215687, 0, 1,
-1.219321, -1.568262, -3.331263, 1, 0.5294118, 0, 1,
-1.208771, 0.4102077, -3.223627, 1, 0.5333334, 0, 1,
-1.201209, 1.110509, 0.06236616, 1, 0.5411765, 0, 1,
-1.200218, 1.204347, -0.8159602, 1, 0.5450981, 0, 1,
-1.200096, -1.255917, -2.959206, 1, 0.5529412, 0, 1,
-1.197741, -1.3672, -3.17717, 1, 0.5568628, 0, 1,
-1.193877, -0.1612955, -0.1486919, 1, 0.5647059, 0, 1,
-1.192345, -0.314749, -0.5032842, 1, 0.5686275, 0, 1,
-1.188504, 1.722105, 0.9283566, 1, 0.5764706, 0, 1,
-1.187493, -0.149525, -2.244669, 1, 0.5803922, 0, 1,
-1.174808, 0.2410058, -0.9123978, 1, 0.5882353, 0, 1,
-1.170389, 0.6736198, 0.07158069, 1, 0.5921569, 0, 1,
-1.163696, 0.4300173, -0.2347354, 1, 0.6, 0, 1,
-1.157004, -1.817696, -2.637143, 1, 0.6078432, 0, 1,
-1.156066, -1.564847, -3.850478, 1, 0.6117647, 0, 1,
-1.153186, -0.5349088, -2.64107, 1, 0.6196079, 0, 1,
-1.151151, 0.3631406, -1.678653, 1, 0.6235294, 0, 1,
-1.147746, 0.2076883, 0.5124701, 1, 0.6313726, 0, 1,
-1.145537, -0.1184164, -2.265046, 1, 0.6352941, 0, 1,
-1.124679, -0.5150249, -1.889269, 1, 0.6431373, 0, 1,
-1.123641, -1.97867, -3.085603, 1, 0.6470588, 0, 1,
-1.117404, 1.798705, -1.736651, 1, 0.654902, 0, 1,
-1.113823, -0.8941542, -2.07982, 1, 0.6588235, 0, 1,
-1.109318, -1.750685, -0.6271361, 1, 0.6666667, 0, 1,
-1.104782, 1.054484, -0.6464195, 1, 0.6705883, 0, 1,
-1.103143, 0.2973921, -1.521368, 1, 0.6784314, 0, 1,
-1.092008, -1.581297, -2.535993, 1, 0.682353, 0, 1,
-1.09097, 1.040834, -1.165882, 1, 0.6901961, 0, 1,
-1.089571, -1.548925, -2.854951, 1, 0.6941177, 0, 1,
-1.071929, 2.480605, -1.538895, 1, 0.7019608, 0, 1,
-1.060981, 1.346453, -0.6111693, 1, 0.7098039, 0, 1,
-1.059707, 0.6885802, -1.020968, 1, 0.7137255, 0, 1,
-1.057995, 0.2422053, -4.478711, 1, 0.7215686, 0, 1,
-1.054258, -0.3997974, -0.5168368, 1, 0.7254902, 0, 1,
-1.047387, 0.4671018, -0.818545, 1, 0.7333333, 0, 1,
-1.047159, -0.9940262, -3.167016, 1, 0.7372549, 0, 1,
-1.032857, 0.839151, -0.816765, 1, 0.7450981, 0, 1,
-1.031712, 0.9874636, -2.036123, 1, 0.7490196, 0, 1,
-1.018511, -0.8942221, -2.831753, 1, 0.7568628, 0, 1,
-1.013178, 0.07208835, 0.7003453, 1, 0.7607843, 0, 1,
-1.012855, 0.8191665, -1.441887, 1, 0.7686275, 0, 1,
-1.00368, 0.3316159, -1.359064, 1, 0.772549, 0, 1,
-1.002991, 1.781879, 1.685403, 1, 0.7803922, 0, 1,
-1.00179, 1.222607, 0.479127, 1, 0.7843137, 0, 1,
-1.000003, -0.4908119, -3.410454, 1, 0.7921569, 0, 1,
-0.9989553, 2.44948, -1.10025, 1, 0.7960784, 0, 1,
-0.9929865, 1.994804, 0.438826, 1, 0.8039216, 0, 1,
-0.9888747, 0.3708662, -2.018985, 1, 0.8117647, 0, 1,
-0.9883516, -0.5496008, -2.528703, 1, 0.8156863, 0, 1,
-0.9754412, -1.04915, -1.815814, 1, 0.8235294, 0, 1,
-0.9697266, 0.1561851, -1.502051, 1, 0.827451, 0, 1,
-0.9634417, 0.3618497, -0.09686039, 1, 0.8352941, 0, 1,
-0.9626797, -2.979352, -2.459506, 1, 0.8392157, 0, 1,
-0.9626125, 1.31616, -2.646276, 1, 0.8470588, 0, 1,
-0.9611602, -0.838966, 0.3891431, 1, 0.8509804, 0, 1,
-0.9577511, 0.09195117, -2.376625, 1, 0.8588235, 0, 1,
-0.9546084, -1.621807, -2.447126, 1, 0.8627451, 0, 1,
-0.9538726, 0.5709726, -0.8964075, 1, 0.8705882, 0, 1,
-0.9509914, -0.1136719, -0.948445, 1, 0.8745098, 0, 1,
-0.9457341, 0.2903931, -1.184887, 1, 0.8823529, 0, 1,
-0.9401786, -1.108924, -1.33914, 1, 0.8862745, 0, 1,
-0.9372178, 0.06390376, -0.1476094, 1, 0.8941177, 0, 1,
-0.9363818, -1.00904, -3.292537, 1, 0.8980392, 0, 1,
-0.9344493, 0.5896307, 0.1706248, 1, 0.9058824, 0, 1,
-0.9338611, 1.711434, -0.6286463, 1, 0.9137255, 0, 1,
-0.9241906, 1.176859, -0.5277787, 1, 0.9176471, 0, 1,
-0.9236115, -0.1469838, -2.80178, 1, 0.9254902, 0, 1,
-0.9232827, -0.1643962, -2.18013, 1, 0.9294118, 0, 1,
-0.9200578, -0.6710018, -3.586324, 1, 0.9372549, 0, 1,
-0.9129755, -2.413441, -3.300739, 1, 0.9411765, 0, 1,
-0.9095368, 0.8607885, -2.446345, 1, 0.9490196, 0, 1,
-0.9089935, -1.717133, -3.755937, 1, 0.9529412, 0, 1,
-0.9054679, -0.5607967, -4.908405, 1, 0.9607843, 0, 1,
-0.9010428, -1.542923, -0.8738724, 1, 0.9647059, 0, 1,
-0.9007306, 0.09614555, -3.041428, 1, 0.972549, 0, 1,
-0.8965819, -0.7145241, -2.937474, 1, 0.9764706, 0, 1,
-0.8944778, -1.7802, -2.927618, 1, 0.9843137, 0, 1,
-0.894407, 0.7921659, -2.053704, 1, 0.9882353, 0, 1,
-0.89345, -0.7641442, -1.69996, 1, 0.9960784, 0, 1,
-0.8881261, -0.08904374, -1.207039, 0.9960784, 1, 0, 1,
-0.8880238, -1.329277, -3.663612, 0.9921569, 1, 0, 1,
-0.8727529, 0.7170398, -1.801873, 0.9843137, 1, 0, 1,
-0.867561, -1.706555, -2.394362, 0.9803922, 1, 0, 1,
-0.8617615, 0.4347664, -0.9900721, 0.972549, 1, 0, 1,
-0.8592277, 2.811447, -1.165148, 0.9686275, 1, 0, 1,
-0.8529524, -1.250372, -2.365598, 0.9607843, 1, 0, 1,
-0.852735, 0.007953128, -2.937786, 0.9568627, 1, 0, 1,
-0.8522735, 0.1813679, 0.3873152, 0.9490196, 1, 0, 1,
-0.8503051, 1.109133, 0.03320907, 0.945098, 1, 0, 1,
-0.848494, -0.6624448, -2.440436, 0.9372549, 1, 0, 1,
-0.8461063, -0.180813, -2.658803, 0.9333333, 1, 0, 1,
-0.837298, -0.2314938, -2.047688, 0.9254902, 1, 0, 1,
-0.8326615, 0.6144801, -1.119656, 0.9215686, 1, 0, 1,
-0.8323392, 0.5318918, -1.343492, 0.9137255, 1, 0, 1,
-0.8310058, -0.04872153, -0.9486914, 0.9098039, 1, 0, 1,
-0.8295215, -0.7070875, -1.060822, 0.9019608, 1, 0, 1,
-0.8290481, 2.546199, 0.2162635, 0.8941177, 1, 0, 1,
-0.8284296, 0.3283885, -1.608984, 0.8901961, 1, 0, 1,
-0.8207586, 1.826743, -1.15632, 0.8823529, 1, 0, 1,
-0.820131, -1.301533, -2.16647, 0.8784314, 1, 0, 1,
-0.8137075, -1.652325, -2.545311, 0.8705882, 1, 0, 1,
-0.8083086, 0.4046658, -0.8341113, 0.8666667, 1, 0, 1,
-0.8038183, -1.153968, -3.301635, 0.8588235, 1, 0, 1,
-0.8025758, 0.06155775, -0.1283403, 0.854902, 1, 0, 1,
-0.8022358, -0.9292657, -0.2981847, 0.8470588, 1, 0, 1,
-0.7961532, 0.03268171, -2.977355, 0.8431373, 1, 0, 1,
-0.7956157, 0.4288229, 0.05843274, 0.8352941, 1, 0, 1,
-0.7893897, -0.59742, -2.086776, 0.8313726, 1, 0, 1,
-0.7862087, 0.7258716, -0.8291451, 0.8235294, 1, 0, 1,
-0.7836962, -0.1684553, -1.342972, 0.8196079, 1, 0, 1,
-0.7834479, -0.03029089, -0.5445028, 0.8117647, 1, 0, 1,
-0.7795359, -0.7635667, -1.991737, 0.8078431, 1, 0, 1,
-0.7789385, 0.1040884, -0.5007402, 0.8, 1, 0, 1,
-0.7716779, -1.025626, -1.218055, 0.7921569, 1, 0, 1,
-0.7655829, -0.02005149, -1.608977, 0.7882353, 1, 0, 1,
-0.7635363, -0.462952, -2.825165, 0.7803922, 1, 0, 1,
-0.7616068, 0.7035725, -1.229722, 0.7764706, 1, 0, 1,
-0.7600192, -0.1857118, -2.274333, 0.7686275, 1, 0, 1,
-0.7591825, -0.2527867, -1.027684, 0.7647059, 1, 0, 1,
-0.756376, 0.9507066, -1.915369, 0.7568628, 1, 0, 1,
-0.7518955, -0.3035912, -2.054992, 0.7529412, 1, 0, 1,
-0.7515794, 0.4638172, -0.1905493, 0.7450981, 1, 0, 1,
-0.745944, 1.45238, -1.274296, 0.7411765, 1, 0, 1,
-0.7374092, -0.5838014, -1.749196, 0.7333333, 1, 0, 1,
-0.7372876, 0.706798, -3.266962, 0.7294118, 1, 0, 1,
-0.73361, 0.5591764, -1.692571, 0.7215686, 1, 0, 1,
-0.7334443, -0.7765673, -1.25109, 0.7176471, 1, 0, 1,
-0.7288373, -1.231424, -2.809152, 0.7098039, 1, 0, 1,
-0.7277691, 0.008737214, -4.704749, 0.7058824, 1, 0, 1,
-0.7218271, -0.3023044, -0.5631568, 0.6980392, 1, 0, 1,
-0.7208952, 0.1912876, -1.344726, 0.6901961, 1, 0, 1,
-0.7113886, 1.232386, -0.8287259, 0.6862745, 1, 0, 1,
-0.6950483, 0.8194478, -1.670432, 0.6784314, 1, 0, 1,
-0.6939678, 0.2654199, -1.899103, 0.6745098, 1, 0, 1,
-0.6878723, -0.1084933, -1.255183, 0.6666667, 1, 0, 1,
-0.6852373, 0.3637913, 0.6911688, 0.6627451, 1, 0, 1,
-0.6782063, -0.2384246, 0.2098543, 0.654902, 1, 0, 1,
-0.6778145, 0.6071892, -0.9039526, 0.6509804, 1, 0, 1,
-0.673233, -1.766173, -2.04438, 0.6431373, 1, 0, 1,
-0.6727175, -1.144154, -1.350751, 0.6392157, 1, 0, 1,
-0.671982, -0.4173425, -2.660735, 0.6313726, 1, 0, 1,
-0.6688209, 0.4205035, 0.377379, 0.627451, 1, 0, 1,
-0.6668422, 1.207134, 0.1208571, 0.6196079, 1, 0, 1,
-0.6609519, 0.2622483, -1.913062, 0.6156863, 1, 0, 1,
-0.6606902, -1.418876, -1.86159, 0.6078432, 1, 0, 1,
-0.659595, 0.9314099, -2.994558, 0.6039216, 1, 0, 1,
-0.6461675, -0.86689, -1.530908, 0.5960785, 1, 0, 1,
-0.6422573, -0.7487933, -4.367881, 0.5882353, 1, 0, 1,
-0.6411187, -0.4990743, -4.570405, 0.5843138, 1, 0, 1,
-0.6312051, 1.554172, -0.4161633, 0.5764706, 1, 0, 1,
-0.6310828, -0.6527254, -1.164063, 0.572549, 1, 0, 1,
-0.6262202, -1.068671, -4.380615, 0.5647059, 1, 0, 1,
-0.6215, 1.234087, 0.18808, 0.5607843, 1, 0, 1,
-0.6188848, -0.4494847, 0.5611864, 0.5529412, 1, 0, 1,
-0.6120387, -0.216619, -0.5290485, 0.5490196, 1, 0, 1,
-0.608749, -0.3982272, -1.823648, 0.5411765, 1, 0, 1,
-0.604085, -0.3247424, -1.685302, 0.5372549, 1, 0, 1,
-0.603539, 1.71862, -1.241069, 0.5294118, 1, 0, 1,
-0.6034556, -0.6994743, -4.293924, 0.5254902, 1, 0, 1,
-0.59764, -0.08808661, -1.513359, 0.5176471, 1, 0, 1,
-0.5925656, 0.6593364, -1.777383, 0.5137255, 1, 0, 1,
-0.5884728, 0.06656438, -1.113586, 0.5058824, 1, 0, 1,
-0.5875468, 0.7076215, -1.499468, 0.5019608, 1, 0, 1,
-0.5866895, -0.6552133, -2.866896, 0.4941176, 1, 0, 1,
-0.58538, 0.35389, -1.290678, 0.4862745, 1, 0, 1,
-0.5852662, -0.4683069, -2.752344, 0.4823529, 1, 0, 1,
-0.5845058, 2.918456, -0.4794903, 0.4745098, 1, 0, 1,
-0.5835379, 0.2502329, -2.389735, 0.4705882, 1, 0, 1,
-0.5710949, -2.279856, -1.653611, 0.4627451, 1, 0, 1,
-0.5697199, 0.3210991, -1.66859, 0.4588235, 1, 0, 1,
-0.5689039, -0.7642453, -2.903081, 0.4509804, 1, 0, 1,
-0.5582425, -0.8372158, -2.495387, 0.4470588, 1, 0, 1,
-0.5578211, -0.4614267, -2.212736, 0.4392157, 1, 0, 1,
-0.5575717, 0.7046821, 0.2577839, 0.4352941, 1, 0, 1,
-0.557139, -1.11533, -2.961774, 0.427451, 1, 0, 1,
-0.5553073, -0.8737752, -1.995843, 0.4235294, 1, 0, 1,
-0.5527903, 0.6012604, -1.6349, 0.4156863, 1, 0, 1,
-0.5523137, 0.5603952, -0.9647868, 0.4117647, 1, 0, 1,
-0.5516267, -1.130413, -4.76278, 0.4039216, 1, 0, 1,
-0.5435019, -1.332158, -1.08923, 0.3960784, 1, 0, 1,
-0.5430555, 1.575812, 0.03837864, 0.3921569, 1, 0, 1,
-0.5424713, 0.06420366, -0.9155346, 0.3843137, 1, 0, 1,
-0.537204, 0.6054234, -0.76063, 0.3803922, 1, 0, 1,
-0.5366001, 0.9801821, 1.481423, 0.372549, 1, 0, 1,
-0.5347737, -0.5708402, -5.229234, 0.3686275, 1, 0, 1,
-0.5344345, 0.004150954, -2.249435, 0.3607843, 1, 0, 1,
-0.5326499, -1.149164, -4.02847, 0.3568628, 1, 0, 1,
-0.5271743, -1.056818, -3.093501, 0.3490196, 1, 0, 1,
-0.5247772, 0.216585, -0.9018178, 0.345098, 1, 0, 1,
-0.5225566, 1.513895, -1.628888, 0.3372549, 1, 0, 1,
-0.5200912, 0.1854765, -0.4340459, 0.3333333, 1, 0, 1,
-0.5150528, -0.08691978, -4.252684, 0.3254902, 1, 0, 1,
-0.5149469, -0.5812095, -3.323018, 0.3215686, 1, 0, 1,
-0.5128155, -1.172552, -2.494229, 0.3137255, 1, 0, 1,
-0.5123723, -0.1385508, -0.7865255, 0.3098039, 1, 0, 1,
-0.5117436, -1.416878, -2.165211, 0.3019608, 1, 0, 1,
-0.5107059, -1.05192, -4.829496, 0.2941177, 1, 0, 1,
-0.5069748, 0.7550254, 0.06442501, 0.2901961, 1, 0, 1,
-0.5038819, 0.6796457, -2.793344, 0.282353, 1, 0, 1,
-0.4970796, -0.1702993, -2.364277, 0.2784314, 1, 0, 1,
-0.4968838, 0.1105735, -0.5777817, 0.2705882, 1, 0, 1,
-0.4938909, 0.2813203, -0.9481346, 0.2666667, 1, 0, 1,
-0.4902814, -0.03729523, -0.5874788, 0.2588235, 1, 0, 1,
-0.4865785, -2.769211, -4.481712, 0.254902, 1, 0, 1,
-0.4820623, -0.2822718, -0.7634966, 0.2470588, 1, 0, 1,
-0.4810651, 0.7090074, -0.2207101, 0.2431373, 1, 0, 1,
-0.475863, 0.5284896, -0.4335698, 0.2352941, 1, 0, 1,
-0.4742436, 0.4005075, -0.05541119, 0.2313726, 1, 0, 1,
-0.4740885, -0.3490611, -4.471029, 0.2235294, 1, 0, 1,
-0.4694007, 0.07946274, -1.206162, 0.2196078, 1, 0, 1,
-0.4686907, -0.8614922, -2.047672, 0.2117647, 1, 0, 1,
-0.4680462, -0.7298672, -1.316031, 0.2078431, 1, 0, 1,
-0.4672163, 1.277914, -0.09419538, 0.2, 1, 0, 1,
-0.4636029, -0.9910356, -0.4867598, 0.1921569, 1, 0, 1,
-0.4590948, 0.09658691, -1.918347, 0.1882353, 1, 0, 1,
-0.4524855, 0.9115447, -1.017947, 0.1803922, 1, 0, 1,
-0.4502178, -1.512404, -4.327533, 0.1764706, 1, 0, 1,
-0.4484441, -0.6369616, -1.23745, 0.1686275, 1, 0, 1,
-0.4471571, -1.194887, -1.652797, 0.1647059, 1, 0, 1,
-0.4460262, -0.5794204, -3.991481, 0.1568628, 1, 0, 1,
-0.4451849, 0.8113534, -2.156301, 0.1529412, 1, 0, 1,
-0.4410091, 0.08396353, -1.158254, 0.145098, 1, 0, 1,
-0.4409723, -0.2721819, -2.411965, 0.1411765, 1, 0, 1,
-0.437894, -0.3311407, -2.185257, 0.1333333, 1, 0, 1,
-0.4347696, -0.1014699, -1.214685, 0.1294118, 1, 0, 1,
-0.4344239, -0.7989901, -2.830879, 0.1215686, 1, 0, 1,
-0.4308905, 0.7321154, 0.5695986, 0.1176471, 1, 0, 1,
-0.4285029, -0.6213678, -3.952548, 0.1098039, 1, 0, 1,
-0.425321, 0.7446818, -1.585037, 0.1058824, 1, 0, 1,
-0.4236403, -0.9862722, -2.575711, 0.09803922, 1, 0, 1,
-0.4222553, -1.470617, -2.842455, 0.09019608, 1, 0, 1,
-0.4130161, -0.417219, -0.7908266, 0.08627451, 1, 0, 1,
-0.411114, 2.365928, -0.6111732, 0.07843138, 1, 0, 1,
-0.4058505, -1.377465, -2.366082, 0.07450981, 1, 0, 1,
-0.4058363, 0.1733671, -1.207582, 0.06666667, 1, 0, 1,
-0.4046456, -1.596572, -2.048708, 0.0627451, 1, 0, 1,
-0.4040688, -0.531768, -4.57259, 0.05490196, 1, 0, 1,
-0.4031095, 0.9131871, 0.4615597, 0.05098039, 1, 0, 1,
-0.3974312, 1.036865, -0.8572128, 0.04313726, 1, 0, 1,
-0.3938968, -0.1336927, -0.02698192, 0.03921569, 1, 0, 1,
-0.3930572, -0.6243935, -2.5848, 0.03137255, 1, 0, 1,
-0.3930192, 0.6107615, -2.295891, 0.02745098, 1, 0, 1,
-0.3852715, -1.14609, -3.044817, 0.01960784, 1, 0, 1,
-0.3818858, -1.158241, -2.808088, 0.01568628, 1, 0, 1,
-0.3808948, 0.9491083, -0.3390747, 0.007843138, 1, 0, 1,
-0.3785184, 0.7286971, -0.5134086, 0.003921569, 1, 0, 1,
-0.374039, 1.266329, -0.4227176, 0, 1, 0.003921569, 1,
-0.3693039, -0.2006309, -2.202596, 0, 1, 0.01176471, 1,
-0.3690792, 0.08657154, -1.341712, 0, 1, 0.01568628, 1,
-0.3648509, -0.8181947, -3.314461, 0, 1, 0.02352941, 1,
-0.3633721, -0.5976745, -2.121147, 0, 1, 0.02745098, 1,
-0.3616056, -0.9775068, -3.077473, 0, 1, 0.03529412, 1,
-0.3603542, -0.4256655, -1.370239, 0, 1, 0.03921569, 1,
-0.357019, -0.5766733, -3.558717, 0, 1, 0.04705882, 1,
-0.35557, -1.47408, -4.403063, 0, 1, 0.05098039, 1,
-0.3510273, -0.2153945, -1.961798, 0, 1, 0.05882353, 1,
-0.3504521, -0.9426889, -3.236732, 0, 1, 0.0627451, 1,
-0.3458742, 1.05256, -0.4884577, 0, 1, 0.07058824, 1,
-0.3453472, -1.876266, -2.935929, 0, 1, 0.07450981, 1,
-0.3448404, -0.3633896, -2.975077, 0, 1, 0.08235294, 1,
-0.344605, 0.5291499, -0.06662989, 0, 1, 0.08627451, 1,
-0.3443491, 0.4481647, -1.136053, 0, 1, 0.09411765, 1,
-0.3428016, 0.3974855, -1.472792, 0, 1, 0.1019608, 1,
-0.3414602, 0.6512225, -1.893538, 0, 1, 0.1058824, 1,
-0.3406899, -0.3075007, -3.588282, 0, 1, 0.1137255, 1,
-0.3348661, -0.5045436, -2.346898, 0, 1, 0.1176471, 1,
-0.3342326, 1.567229, 0.9293526, 0, 1, 0.1254902, 1,
-0.3341273, -2.39546, -2.011493, 0, 1, 0.1294118, 1,
-0.3339515, 0.1337037, -1.589795, 0, 1, 0.1372549, 1,
-0.3334042, -0.3502561, -3.559403, 0, 1, 0.1411765, 1,
-0.3293009, -0.4021694, -1.519182, 0, 1, 0.1490196, 1,
-0.3277866, 1.74828, -0.8308731, 0, 1, 0.1529412, 1,
-0.324967, 0.2027851, -1.317956, 0, 1, 0.1607843, 1,
-0.3240875, -0.6876217, -2.325225, 0, 1, 0.1647059, 1,
-0.319829, 0.1741395, -0.1071759, 0, 1, 0.172549, 1,
-0.3186487, -0.326303, -0.6116176, 0, 1, 0.1764706, 1,
-0.3169001, 0.7812715, -1.374376, 0, 1, 0.1843137, 1,
-0.3165988, -0.09842856, -3.015321, 0, 1, 0.1882353, 1,
-0.3149661, -0.6519656, -3.39876, 0, 1, 0.1960784, 1,
-0.3108441, -0.1272546, 0.8903069, 0, 1, 0.2039216, 1,
-0.3098786, 0.3642042, -0.7808527, 0, 1, 0.2078431, 1,
-0.3067429, 0.2914884, -0.6898026, 0, 1, 0.2156863, 1,
-0.3052504, 0.1299574, 0.5366471, 0, 1, 0.2196078, 1,
-0.304134, -1.011405, -3.286703, 0, 1, 0.227451, 1,
-0.2964551, -0.3540874, -1.892013, 0, 1, 0.2313726, 1,
-0.2908394, -0.2941286, -2.799251, 0, 1, 0.2392157, 1,
-0.2796516, -0.4580929, -1.553904, 0, 1, 0.2431373, 1,
-0.2694886, 0.2825003, -0.7106614, 0, 1, 0.2509804, 1,
-0.2682895, 0.1996633, -0.7290327, 0, 1, 0.254902, 1,
-0.2656931, 0.6292461, -0.7965531, 0, 1, 0.2627451, 1,
-0.2641736, 0.7553818, 0.3302194, 0, 1, 0.2666667, 1,
-0.2640058, -0.4512052, -3.302247, 0, 1, 0.2745098, 1,
-0.261343, -0.5601072, -2.810643, 0, 1, 0.2784314, 1,
-0.2603908, -1.310779, -4.251019, 0, 1, 0.2862745, 1,
-0.2577817, -0.6195718, -2.992046, 0, 1, 0.2901961, 1,
-0.2571899, 1.66574, -1.107175, 0, 1, 0.2980392, 1,
-0.2534803, 0.3937669, 0.0261248, 0, 1, 0.3058824, 1,
-0.2504469, 1.739904, -0.9552503, 0, 1, 0.3098039, 1,
-0.2502047, -3.481598, -3.552415, 0, 1, 0.3176471, 1,
-0.2496891, 1.00483, -1.209767, 0, 1, 0.3215686, 1,
-0.2481334, 0.4198802, -0.726266, 0, 1, 0.3294118, 1,
-0.2372991, 0.2839915, -1.607201, 0, 1, 0.3333333, 1,
-0.2372798, -0.9606372, -2.869982, 0, 1, 0.3411765, 1,
-0.2370271, -0.5409483, -3.327793, 0, 1, 0.345098, 1,
-0.2307826, -0.9719009, -3.854464, 0, 1, 0.3529412, 1,
-0.2239225, 0.6126279, 2.125028, 0, 1, 0.3568628, 1,
-0.2206927, 1.815756, -1.432081, 0, 1, 0.3647059, 1,
-0.2111834, 0.7018192, -1.715317, 0, 1, 0.3686275, 1,
-0.2029887, 0.4163559, 1.71079, 0, 1, 0.3764706, 1,
-0.1983321, 0.2767712, 1.219168, 0, 1, 0.3803922, 1,
-0.1971036, -0.1501246, -3.620799, 0, 1, 0.3882353, 1,
-0.1951064, -1.306743, -3.587769, 0, 1, 0.3921569, 1,
-0.1936537, 1.208904, -1.398993, 0, 1, 0.4, 1,
-0.1914218, -0.1189828, -1.138651, 0, 1, 0.4078431, 1,
-0.1884178, 1.813285, -0.7325809, 0, 1, 0.4117647, 1,
-0.1848522, 0.7732285, 0.8411656, 0, 1, 0.4196078, 1,
-0.1841751, 0.7507112, -1.613037, 0, 1, 0.4235294, 1,
-0.1775654, -1.201465, -3.337763, 0, 1, 0.4313726, 1,
-0.1771388, 0.8614015, 0.03362094, 0, 1, 0.4352941, 1,
-0.1677287, -0.6046529, -2.72441, 0, 1, 0.4431373, 1,
-0.1648635, 1.624249, -1.639384, 0, 1, 0.4470588, 1,
-0.1573205, -0.8356187, -3.702114, 0, 1, 0.454902, 1,
-0.1548999, -0.2878531, -2.067929, 0, 1, 0.4588235, 1,
-0.1536947, 0.08272701, -0.8520935, 0, 1, 0.4666667, 1,
-0.1471788, 0.2867903, -0.6672988, 0, 1, 0.4705882, 1,
-0.1436069, 1.559564, -1.576725, 0, 1, 0.4784314, 1,
-0.1396302, 0.6983877, 1.749248, 0, 1, 0.4823529, 1,
-0.1382568, -0.5286728, -2.19201, 0, 1, 0.4901961, 1,
-0.1306951, -1.503169, -3.310745, 0, 1, 0.4941176, 1,
-0.1262499, -0.7581326, -2.40916, 0, 1, 0.5019608, 1,
-0.1209383, 1.475977, -0.232444, 0, 1, 0.509804, 1,
-0.119854, 0.9207189, 0.4542286, 0, 1, 0.5137255, 1,
-0.1173915, -0.1904794, -2.718552, 0, 1, 0.5215687, 1,
-0.1171378, 1.378724, 1.160058, 0, 1, 0.5254902, 1,
-0.114513, 0.2376983, 0.3118718, 0, 1, 0.5333334, 1,
-0.1115978, 0.1376689, -0.9232125, 0, 1, 0.5372549, 1,
-0.1113452, 0.1454226, -0.2083148, 0, 1, 0.5450981, 1,
-0.1080246, 0.7400118, -0.8061143, 0, 1, 0.5490196, 1,
-0.1073905, 0.3765448, -1.317128, 0, 1, 0.5568628, 1,
-0.1050206, -1.296114, -3.429433, 0, 1, 0.5607843, 1,
-0.1001123, 1.651755, -1.89485, 0, 1, 0.5686275, 1,
-0.09829705, -0.9824513, -3.222505, 0, 1, 0.572549, 1,
-0.09803288, 0.5739201, -1.982599, 0, 1, 0.5803922, 1,
-0.09421138, 0.6976474, -1.55267, 0, 1, 0.5843138, 1,
-0.0869154, 0.2179607, 0.1566607, 0, 1, 0.5921569, 1,
-0.08610959, 0.9461924, 1.291038, 0, 1, 0.5960785, 1,
-0.08437619, -1.384601, -3.831357, 0, 1, 0.6039216, 1,
-0.08399525, -0.3859912, -1.693454, 0, 1, 0.6117647, 1,
-0.0794636, 0.2474587, 0.2833825, 0, 1, 0.6156863, 1,
-0.07874715, -2.07371, -2.459402, 0, 1, 0.6235294, 1,
-0.07356093, -1.819872, -3.132571, 0, 1, 0.627451, 1,
-0.07313848, 0.2905079, 1.385475, 0, 1, 0.6352941, 1,
-0.07109973, 1.349614, -0.8903899, 0, 1, 0.6392157, 1,
-0.06918253, -1.164144, -3.386068, 0, 1, 0.6470588, 1,
-0.06901336, -0.8372858, -2.490949, 0, 1, 0.6509804, 1,
-0.06820347, 1.453799, 1.868092, 0, 1, 0.6588235, 1,
-0.06488638, 1.927932, -1.485168, 0, 1, 0.6627451, 1,
-0.06307329, -1.021313, -2.294033, 0, 1, 0.6705883, 1,
-0.06287728, 1.376184, -1.69219, 0, 1, 0.6745098, 1,
-0.06256499, 0.1202299, 0.1508155, 0, 1, 0.682353, 1,
-0.05997503, -0.5834212, -2.666218, 0, 1, 0.6862745, 1,
-0.04948335, 1.08645, 0.8475235, 0, 1, 0.6941177, 1,
-0.04839535, 0.01055762, 0.0319519, 0, 1, 0.7019608, 1,
-0.04364949, -0.4752534, -3.776559, 0, 1, 0.7058824, 1,
-0.04294004, 0.5617415, 1.82437, 0, 1, 0.7137255, 1,
-0.04069978, 0.9308653, 0.3506888, 0, 1, 0.7176471, 1,
-0.03871135, 0.6308811, 1.478303, 0, 1, 0.7254902, 1,
-0.03860679, 0.5881786, 1.910168, 0, 1, 0.7294118, 1,
-0.03858702, -0.8175473, -1.443591, 0, 1, 0.7372549, 1,
-0.03564676, 1.121843, 1.300135, 0, 1, 0.7411765, 1,
-0.03344698, 0.7408878, -0.01274426, 0, 1, 0.7490196, 1,
-0.03165469, 0.20094, -0.3085464, 0, 1, 0.7529412, 1,
-0.03151956, 0.807176, 0.8935549, 0, 1, 0.7607843, 1,
-0.02747253, 0.5117059, -0.02025423, 0, 1, 0.7647059, 1,
-0.02685853, -1.095848, -4.357183, 0, 1, 0.772549, 1,
-0.024439, 1.265963, -0.243498, 0, 1, 0.7764706, 1,
-0.02295038, 1.419412, 1.353574, 0, 1, 0.7843137, 1,
-0.01900981, 0.4892735, -0.2850697, 0, 1, 0.7882353, 1,
-0.01760253, -0.05470259, -2.487253, 0, 1, 0.7960784, 1,
-0.01759957, -0.7868617, -2.589912, 0, 1, 0.8039216, 1,
-0.01753371, -0.5109491, -3.439456, 0, 1, 0.8078431, 1,
-0.01495532, -1.215572, -3.642482, 0, 1, 0.8156863, 1,
-0.01318684, -1.469564, -2.676371, 0, 1, 0.8196079, 1,
-0.01098597, 0.6902832, 0.5395427, 0, 1, 0.827451, 1,
-0.008840441, -0.8966516, -2.625412, 0, 1, 0.8313726, 1,
-0.007291238, -0.7585505, -3.936692, 0, 1, 0.8392157, 1,
-0.005609915, 0.3099171, 0.8494418, 0, 1, 0.8431373, 1,
-0.002620963, -0.5793441, -2.948755, 0, 1, 0.8509804, 1,
-0.001792786, -1.442929, -2.900493, 0, 1, 0.854902, 1,
0.002268181, -0.9933817, 3.107303, 0, 1, 0.8627451, 1,
0.01047825, -0.4103131, 4.093782, 0, 1, 0.8666667, 1,
0.01310714, 0.05824703, -0.4541477, 0, 1, 0.8745098, 1,
0.01365109, 1.827168, 1.0404, 0, 1, 0.8784314, 1,
0.01621494, 1.583197, -0.255406, 0, 1, 0.8862745, 1,
0.02118627, 0.5385937, 3.468417, 0, 1, 0.8901961, 1,
0.02755379, -0.2630892, 2.595534, 0, 1, 0.8980392, 1,
0.03252175, -1.409522, 3.542106, 0, 1, 0.9058824, 1,
0.0381705, 1.128581, 2.673264, 0, 1, 0.9098039, 1,
0.04149238, 0.9925034, -0.4575011, 0, 1, 0.9176471, 1,
0.04153863, 0.7445253, 0.4681436, 0, 1, 0.9215686, 1,
0.04363483, -0.8377237, 3.968837, 0, 1, 0.9294118, 1,
0.0438837, -0.5066476, 3.801388, 0, 1, 0.9333333, 1,
0.04448029, 2.378321, 1.696181, 0, 1, 0.9411765, 1,
0.04831654, 1.510746, -0.02166147, 0, 1, 0.945098, 1,
0.05164782, 0.19116, 0.6866603, 0, 1, 0.9529412, 1,
0.05547566, -0.2779772, 1.784962, 0, 1, 0.9568627, 1,
0.05845062, 0.6283048, 2.005674, 0, 1, 0.9647059, 1,
0.0610042, -0.7063652, 2.386365, 0, 1, 0.9686275, 1,
0.06228231, 0.4745603, 0.3286828, 0, 1, 0.9764706, 1,
0.06361306, -0.2575416, 1.455684, 0, 1, 0.9803922, 1,
0.06366458, -1.163029, 3.053957, 0, 1, 0.9882353, 1,
0.06657106, -0.942227, 2.403256, 0, 1, 0.9921569, 1,
0.08201959, 0.4314143, 2.032359, 0, 1, 1, 1,
0.08218876, -0.03670434, 0.6711072, 0, 0.9921569, 1, 1,
0.08560715, -1.036717, 3.401497, 0, 0.9882353, 1, 1,
0.08569861, -0.5942311, 2.680401, 0, 0.9803922, 1, 1,
0.09496068, 0.09040897, 0.3456373, 0, 0.9764706, 1, 1,
0.0952948, 0.3764357, 1.528295, 0, 0.9686275, 1, 1,
0.09679408, -0.05324519, 2.699012, 0, 0.9647059, 1, 1,
0.09782615, -0.003567522, 3.267399, 0, 0.9568627, 1, 1,
0.1002908, 0.4179275, 0.3889295, 0, 0.9529412, 1, 1,
0.1012817, -0.2543559, 2.253806, 0, 0.945098, 1, 1,
0.1043744, -1.677828, 1.782059, 0, 0.9411765, 1, 1,
0.1047973, 0.4631862, 0.9429758, 0, 0.9333333, 1, 1,
0.1071838, -1.470996, 2.656608, 0, 0.9294118, 1, 1,
0.1130491, -0.02551991, 1.224293, 0, 0.9215686, 1, 1,
0.1138382, 0.563043, -0.2544755, 0, 0.9176471, 1, 1,
0.1138507, -0.5579278, 3.60653, 0, 0.9098039, 1, 1,
0.1144858, -0.713052, 2.088614, 0, 0.9058824, 1, 1,
0.1167642, -0.03531259, 1.583087, 0, 0.8980392, 1, 1,
0.1242924, 1.191711, 0.09728979, 0, 0.8901961, 1, 1,
0.1330064, -0.3916788, 2.176095, 0, 0.8862745, 1, 1,
0.1365741, -0.2642632, 3.228798, 0, 0.8784314, 1, 1,
0.136871, -0.6143273, 0.8767075, 0, 0.8745098, 1, 1,
0.1391875, 0.2794424, -0.04397624, 0, 0.8666667, 1, 1,
0.143378, 0.7944223, 0.003644936, 0, 0.8627451, 1, 1,
0.1447941, -0.9879155, 2.819598, 0, 0.854902, 1, 1,
0.1484498, -2.663355, 2.246268, 0, 0.8509804, 1, 1,
0.1487665, -1.46952, 4.198627, 0, 0.8431373, 1, 1,
0.1525889, 0.1207118, 0.7060434, 0, 0.8392157, 1, 1,
0.1631633, 1.806565, -0.5582179, 0, 0.8313726, 1, 1,
0.1686135, -1.273271, 4.216967, 0, 0.827451, 1, 1,
0.169159, 1.568153, -0.3338249, 0, 0.8196079, 1, 1,
0.1693479, -0.3902421, 4.471369, 0, 0.8156863, 1, 1,
0.1699779, -0.07529648, 2.283896, 0, 0.8078431, 1, 1,
0.1709652, -1.570322, 2.580164, 0, 0.8039216, 1, 1,
0.1734695, 1.647991, -1.256797, 0, 0.7960784, 1, 1,
0.1738683, -1.221278, 2.751234, 0, 0.7882353, 1, 1,
0.1807795, -0.6564081, 4.254783, 0, 0.7843137, 1, 1,
0.1829017, -0.2509978, 3.412242, 0, 0.7764706, 1, 1,
0.183414, -0.1970206, 2.453702, 0, 0.772549, 1, 1,
0.1835396, 1.453233, -0.8086854, 0, 0.7647059, 1, 1,
0.1837485, 0.9428223, -1.007762, 0, 0.7607843, 1, 1,
0.1909579, 2.040973, -1.046947, 0, 0.7529412, 1, 1,
0.1927505, 0.1072683, 0.8380397, 0, 0.7490196, 1, 1,
0.1940511, 0.6394238, -1.767952, 0, 0.7411765, 1, 1,
0.1958484, -0.20542, 2.147881, 0, 0.7372549, 1, 1,
0.198362, 0.1444472, 0.6210021, 0, 0.7294118, 1, 1,
0.2008179, -0.0284126, 1.731094, 0, 0.7254902, 1, 1,
0.2090861, -0.8540052, 4.809539, 0, 0.7176471, 1, 1,
0.2128724, 0.2466793, 0.7786345, 0, 0.7137255, 1, 1,
0.2140603, -1.572743, 3.056138, 0, 0.7058824, 1, 1,
0.2158328, 0.5655594, 0.5103454, 0, 0.6980392, 1, 1,
0.2162304, 2.072579, 0.6367649, 0, 0.6941177, 1, 1,
0.217577, 0.8249973, -0.2189867, 0, 0.6862745, 1, 1,
0.2235473, -0.4006742, 4.143589, 0, 0.682353, 1, 1,
0.2276209, 1.268481, 1.223325, 0, 0.6745098, 1, 1,
0.2298985, 0.3292535, -1.341472, 0, 0.6705883, 1, 1,
0.2345561, -0.2481292, 2.261206, 0, 0.6627451, 1, 1,
0.2397988, 1.634779, 1.427411, 0, 0.6588235, 1, 1,
0.2467913, -0.4863304, 4.824046, 0, 0.6509804, 1, 1,
0.2481021, 1.285343, 0.09803572, 0, 0.6470588, 1, 1,
0.2492275, 0.7273434, -1.320865, 0, 0.6392157, 1, 1,
0.2492506, -0.624298, 2.789913, 0, 0.6352941, 1, 1,
0.2496954, 0.2332965, 0.8054016, 0, 0.627451, 1, 1,
0.2541963, 0.06729494, 0.8695357, 0, 0.6235294, 1, 1,
0.2544841, 0.805845, 1.535636, 0, 0.6156863, 1, 1,
0.2564536, 0.5417739, 0.5320377, 0, 0.6117647, 1, 1,
0.256564, -0.1520872, 1.256462, 0, 0.6039216, 1, 1,
0.2573148, 0.03408289, 1.236623, 0, 0.5960785, 1, 1,
0.2607071, -0.5114169, 1.95025, 0, 0.5921569, 1, 1,
0.261215, -1.722824, 3.426445, 0, 0.5843138, 1, 1,
0.2629855, 0.2155833, 1.074242, 0, 0.5803922, 1, 1,
0.264727, 0.1867614, 0.4261278, 0, 0.572549, 1, 1,
0.2740114, -1.122796, 2.492747, 0, 0.5686275, 1, 1,
0.2751954, 0.2102725, 1.148015, 0, 0.5607843, 1, 1,
0.2772678, -0.01689042, 0.7698655, 0, 0.5568628, 1, 1,
0.2806005, -0.2459576, 1.717009, 0, 0.5490196, 1, 1,
0.2806579, -0.3294587, 2.285021, 0, 0.5450981, 1, 1,
0.2894426, 0.560467, -0.7588865, 0, 0.5372549, 1, 1,
0.2899139, -0.6556513, 4.420404, 0, 0.5333334, 1, 1,
0.2899635, 2.140552, 1.977499, 0, 0.5254902, 1, 1,
0.2917466, -2.043908, 4.253057, 0, 0.5215687, 1, 1,
0.294957, -0.2599206, 3.293803, 0, 0.5137255, 1, 1,
0.2951421, -0.5249667, 2.800008, 0, 0.509804, 1, 1,
0.2953853, 1.543308, 0.16209, 0, 0.5019608, 1, 1,
0.2984356, -0.1763659, 3.40184, 0, 0.4941176, 1, 1,
0.2994923, 0.2295988, 2.057872, 0, 0.4901961, 1, 1,
0.3055764, -1.634202, 2.87026, 0, 0.4823529, 1, 1,
0.3198114, 0.8567765, -0.6854817, 0, 0.4784314, 1, 1,
0.3209641, 1.679126, -1.995397, 0, 0.4705882, 1, 1,
0.3230922, -0.4345018, 2.776616, 0, 0.4666667, 1, 1,
0.3271338, -0.7798103, 2.953658, 0, 0.4588235, 1, 1,
0.3284236, -0.5436359, 3.258487, 0, 0.454902, 1, 1,
0.3295125, 0.07949769, -0.3272792, 0, 0.4470588, 1, 1,
0.3332607, -0.9833944, 4.208738, 0, 0.4431373, 1, 1,
0.3429145, -1.184995, 2.448499, 0, 0.4352941, 1, 1,
0.3435034, 0.05631659, 0.6173638, 0, 0.4313726, 1, 1,
0.344712, 0.09733883, 1.279526, 0, 0.4235294, 1, 1,
0.3448536, 1.777222, 0.5083526, 0, 0.4196078, 1, 1,
0.3451185, 0.2310155, 0.5827046, 0, 0.4117647, 1, 1,
0.3453746, -1.096302, 0.8420912, 0, 0.4078431, 1, 1,
0.3458055, 2.109589, 1.100304, 0, 0.4, 1, 1,
0.3485204, -0.7032445, 3.296507, 0, 0.3921569, 1, 1,
0.3566916, 1.621427, 0.09448911, 0, 0.3882353, 1, 1,
0.3572573, 0.1810414, 0.7935522, 0, 0.3803922, 1, 1,
0.3606591, -0.400441, 2.321234, 0, 0.3764706, 1, 1,
0.3633345, -0.852547, 4.127997, 0, 0.3686275, 1, 1,
0.36397, -0.8538224, 2.341451, 0, 0.3647059, 1, 1,
0.3709129, 0.6730717, 1.211073, 0, 0.3568628, 1, 1,
0.3756688, -0.637056, 2.505991, 0, 0.3529412, 1, 1,
0.3781408, -0.7382506, 1.916114, 0, 0.345098, 1, 1,
0.3805694, -0.6342999, 2.589456, 0, 0.3411765, 1, 1,
0.3809349, 0.7737991, 0.8277321, 0, 0.3333333, 1, 1,
0.3842591, 0.3892917, -0.2694568, 0, 0.3294118, 1, 1,
0.3885724, 0.5131515, -0.1613072, 0, 0.3215686, 1, 1,
0.3900322, -0.15623, 2.133529, 0, 0.3176471, 1, 1,
0.3911969, -0.5579075, 3.680885, 0, 0.3098039, 1, 1,
0.395606, 1.329115, 1.103276, 0, 0.3058824, 1, 1,
0.4017758, 1.479498, 1.776413, 0, 0.2980392, 1, 1,
0.4051137, 0.01417189, 3.01343, 0, 0.2901961, 1, 1,
0.4061123, -0.08902273, 1.675156, 0, 0.2862745, 1, 1,
0.4080468, -1.046622, 2.761614, 0, 0.2784314, 1, 1,
0.4135847, -1.143228, 2.530758, 0, 0.2745098, 1, 1,
0.4140491, 1.590551, 1.722481, 0, 0.2666667, 1, 1,
0.4142728, -0.9060658, 2.408072, 0, 0.2627451, 1, 1,
0.4191817, -0.4415596, 3.835761, 0, 0.254902, 1, 1,
0.4197424, -0.4726452, 2.104065, 0, 0.2509804, 1, 1,
0.4205173, 0.5536708, 1.568615, 0, 0.2431373, 1, 1,
0.4230548, 0.5887231, -0.6559983, 0, 0.2392157, 1, 1,
0.4232906, -1.675491, 2.64182, 0, 0.2313726, 1, 1,
0.4271607, -2.15672, 4.617194, 0, 0.227451, 1, 1,
0.4277125, 0.2660188, 1.469588, 0, 0.2196078, 1, 1,
0.4287562, -1.867806, 2.728464, 0, 0.2156863, 1, 1,
0.4299059, -0.09792224, 2.35271, 0, 0.2078431, 1, 1,
0.4306864, 0.1073416, 0.0627251, 0, 0.2039216, 1, 1,
0.4339916, 0.3589921, -0.5811487, 0, 0.1960784, 1, 1,
0.4364883, 0.8089111, 2.354973, 0, 0.1882353, 1, 1,
0.4392602, -0.3510278, 0.9747121, 0, 0.1843137, 1, 1,
0.4397819, 0.2199195, -0.204825, 0, 0.1764706, 1, 1,
0.4491534, -0.6941847, 0.3504746, 0, 0.172549, 1, 1,
0.4500115, -0.9330682, 2.938013, 0, 0.1647059, 1, 1,
0.4509293, -0.2258656, 1.907774, 0, 0.1607843, 1, 1,
0.4511647, -0.5579286, 2.791597, 0, 0.1529412, 1, 1,
0.4552743, -0.08416508, 1.650464, 0, 0.1490196, 1, 1,
0.4558494, 0.6316523, 1.666124, 0, 0.1411765, 1, 1,
0.4558506, 0.9380221, 0.6161641, 0, 0.1372549, 1, 1,
0.4581369, -0.03909001, 1.80694, 0, 0.1294118, 1, 1,
0.4624168, 1.303433, -1.852534, 0, 0.1254902, 1, 1,
0.4718697, 0.8860022, 2.106841, 0, 0.1176471, 1, 1,
0.4761514, 0.2325317, 1.331014, 0, 0.1137255, 1, 1,
0.4771598, 3.32802, -1.417485, 0, 0.1058824, 1, 1,
0.4776417, -0.1450961, 0.2197011, 0, 0.09803922, 1, 1,
0.4782707, 0.9156845, 2.207923, 0, 0.09411765, 1, 1,
0.4791916, 0.9943656, -0.4040034, 0, 0.08627451, 1, 1,
0.4806146, -0.8567122, 5.808721, 0, 0.08235294, 1, 1,
0.4835678, 1.101168, -0.6568935, 0, 0.07450981, 1, 1,
0.4858088, -0.1934797, 2.811827, 0, 0.07058824, 1, 1,
0.486906, -0.5167559, 2.904153, 0, 0.0627451, 1, 1,
0.4910963, -0.4078351, -0.2806668, 0, 0.05882353, 1, 1,
0.4926797, -0.1613502, 0.9137598, 0, 0.05098039, 1, 1,
0.4950789, -0.0176653, 3.291832, 0, 0.04705882, 1, 1,
0.495636, -0.2272361, 3.139407, 0, 0.03921569, 1, 1,
0.502075, 0.1507162, 1.098262, 0, 0.03529412, 1, 1,
0.5032327, -0.3433119, 2.481348, 0, 0.02745098, 1, 1,
0.5082878, -2.035398, 3.421783, 0, 0.02352941, 1, 1,
0.5158828, 0.6626074, -0.3748182, 0, 0.01568628, 1, 1,
0.5173926, -0.5832245, 3.091676, 0, 0.01176471, 1, 1,
0.5213271, -0.2153917, 1.573927, 0, 0.003921569, 1, 1,
0.5245324, -0.3141442, 2.582783, 0.003921569, 0, 1, 1,
0.5300087, 0.2001132, 2.032481, 0.007843138, 0, 1, 1,
0.5327305, -1.964976, 1.939265, 0.01568628, 0, 1, 1,
0.5333598, 0.01589506, 1.251296, 0.01960784, 0, 1, 1,
0.5406746, 0.1982966, 1.549163, 0.02745098, 0, 1, 1,
0.5456049, 1.51602, 0.112597, 0.03137255, 0, 1, 1,
0.5478246, 0.1892365, 1.458956, 0.03921569, 0, 1, 1,
0.5535622, 0.4988732, -1.464559, 0.04313726, 0, 1, 1,
0.5552967, 0.3922768, 0.6980752, 0.05098039, 0, 1, 1,
0.5574154, 1.393695, 1.272567, 0.05490196, 0, 1, 1,
0.5579826, -0.5133876, 3.32986, 0.0627451, 0, 1, 1,
0.5607485, -0.7462102, 2.160302, 0.06666667, 0, 1, 1,
0.5628241, -1.491875, 1.989913, 0.07450981, 0, 1, 1,
0.5683227, -0.5676119, 2.931842, 0.07843138, 0, 1, 1,
0.568371, 1.311427, -0.8262118, 0.08627451, 0, 1, 1,
0.5704048, 0.2554707, -0.1485006, 0.09019608, 0, 1, 1,
0.5717083, 0.4818205, 1.281741, 0.09803922, 0, 1, 1,
0.574275, -0.2127245, 1.358303, 0.1058824, 0, 1, 1,
0.5763403, -0.02395944, 0.8799044, 0.1098039, 0, 1, 1,
0.5810323, 0.1999104, 1.699094, 0.1176471, 0, 1, 1,
0.5833515, -1.186961, 3.917754, 0.1215686, 0, 1, 1,
0.5863266, -0.9062935, 3.006491, 0.1294118, 0, 1, 1,
0.5902923, 0.497268, 0.8636044, 0.1333333, 0, 1, 1,
0.5937098, 0.5851996, -1.706714, 0.1411765, 0, 1, 1,
0.5964321, -3.299766, 4.012133, 0.145098, 0, 1, 1,
0.5970007, 0.7505336, 1.082567, 0.1529412, 0, 1, 1,
0.6007605, 0.4210713, 1.901777, 0.1568628, 0, 1, 1,
0.6063308, 0.04991713, 1.368152, 0.1647059, 0, 1, 1,
0.6089258, 1.383827, -0.7004717, 0.1686275, 0, 1, 1,
0.6128666, 2.274474, -0.4339972, 0.1764706, 0, 1, 1,
0.6185209, 1.971131, 0.491404, 0.1803922, 0, 1, 1,
0.6186337, 1.385872, -1.983096, 0.1882353, 0, 1, 1,
0.6205884, -1.510127, 3.538471, 0.1921569, 0, 1, 1,
0.6303796, -1.108894, 2.602051, 0.2, 0, 1, 1,
0.6319531, 0.3706051, -1.27805, 0.2078431, 0, 1, 1,
0.6321546, -0.9557942, 2.06155, 0.2117647, 0, 1, 1,
0.6354463, 0.1720027, 2.370067, 0.2196078, 0, 1, 1,
0.6411183, 0.654522, 2.226682, 0.2235294, 0, 1, 1,
0.6415427, 1.92585, 2.58768, 0.2313726, 0, 1, 1,
0.6474534, -0.810378, 3.043032, 0.2352941, 0, 1, 1,
0.6519769, -1.272439, 2.175573, 0.2431373, 0, 1, 1,
0.6521153, 0.5112016, -0.08788925, 0.2470588, 0, 1, 1,
0.6547205, -0.2639314, 1.868136, 0.254902, 0, 1, 1,
0.6592571, -0.7649841, 2.190807, 0.2588235, 0, 1, 1,
0.6637648, -0.522341, 2.262459, 0.2666667, 0, 1, 1,
0.667573, 0.8138238, 0.5700044, 0.2705882, 0, 1, 1,
0.670463, 0.4529066, 0.3439641, 0.2784314, 0, 1, 1,
0.6770663, -0.2702197, 1.526536, 0.282353, 0, 1, 1,
0.6828798, 2.22445, 0.68443, 0.2901961, 0, 1, 1,
0.6848774, -0.03654248, 2.03551, 0.2941177, 0, 1, 1,
0.6873512, 0.502953, 0.7172983, 0.3019608, 0, 1, 1,
0.6905204, 0.3252103, 2.01367, 0.3098039, 0, 1, 1,
0.6938645, -0.08247111, -0.06713206, 0.3137255, 0, 1, 1,
0.6979762, -0.9394368, 3.096316, 0.3215686, 0, 1, 1,
0.6997241, 1.674495, -0.04523227, 0.3254902, 0, 1, 1,
0.7042334, -0.8046976, 3.531547, 0.3333333, 0, 1, 1,
0.7051632, 2.306535, 1.897166, 0.3372549, 0, 1, 1,
0.706108, -0.5066567, 1.766426, 0.345098, 0, 1, 1,
0.710459, -0.2708804, 1.206496, 0.3490196, 0, 1, 1,
0.7149498, -1.352165, 3.710234, 0.3568628, 0, 1, 1,
0.7177197, 1.242497, -0.8832304, 0.3607843, 0, 1, 1,
0.7181321, 1.481098, 0.1319198, 0.3686275, 0, 1, 1,
0.7187466, -0.3360882, 1.467114, 0.372549, 0, 1, 1,
0.7218787, 2.221285, -0.01576042, 0.3803922, 0, 1, 1,
0.7226516, 1.364777, -0.9831673, 0.3843137, 0, 1, 1,
0.7240795, -0.5385861, 1.963938, 0.3921569, 0, 1, 1,
0.7256483, -1.569931, 2.924471, 0.3960784, 0, 1, 1,
0.72782, 0.9598415, -0.9981224, 0.4039216, 0, 1, 1,
0.7281562, 0.4112445, 2.565578, 0.4117647, 0, 1, 1,
0.7334082, 1.369149, 0.5465035, 0.4156863, 0, 1, 1,
0.7414566, -0.4009253, 3.746448, 0.4235294, 0, 1, 1,
0.7498619, -0.5177103, 2.685034, 0.427451, 0, 1, 1,
0.7510571, 1.609151, 0.445521, 0.4352941, 0, 1, 1,
0.751191, -0.3655108, 2.635675, 0.4392157, 0, 1, 1,
0.7612677, 0.6318527, -2.053738, 0.4470588, 0, 1, 1,
0.7616942, 1.672495, 1.230541, 0.4509804, 0, 1, 1,
0.7622555, -0.3927616, 2.342506, 0.4588235, 0, 1, 1,
0.7650924, 0.06069237, 0.3758275, 0.4627451, 0, 1, 1,
0.7734169, -2.358666, 3.13232, 0.4705882, 0, 1, 1,
0.7756234, 1.382478, -0.1551835, 0.4745098, 0, 1, 1,
0.7787278, -1.721294, 1.800462, 0.4823529, 0, 1, 1,
0.7789605, 0.5643615, 2.359759, 0.4862745, 0, 1, 1,
0.7802103, 0.249579, 1.818056, 0.4941176, 0, 1, 1,
0.7845403, 1.310476, 0.5650876, 0.5019608, 0, 1, 1,
0.7872464, 0.4594787, 0.02494148, 0.5058824, 0, 1, 1,
0.7906166, -0.8332288, 1.840247, 0.5137255, 0, 1, 1,
0.7939158, 0.2842729, 0.8889484, 0.5176471, 0, 1, 1,
0.7942765, -0.1663494, 3.449553, 0.5254902, 0, 1, 1,
0.7955663, -0.2272488, 2.507856, 0.5294118, 0, 1, 1,
0.8006768, -0.01340438, 1.67252, 0.5372549, 0, 1, 1,
0.8047199, -1.937921, 2.50778, 0.5411765, 0, 1, 1,
0.8084905, -1.542984, 2.989944, 0.5490196, 0, 1, 1,
0.8133615, 0.5679964, 2.084335, 0.5529412, 0, 1, 1,
0.8165894, 1.138333, -0.08158389, 0.5607843, 0, 1, 1,
0.8207373, -1.06792, 1.609318, 0.5647059, 0, 1, 1,
0.8213952, 1.525947, 1.027079, 0.572549, 0, 1, 1,
0.8218432, -0.8658403, 2.091031, 0.5764706, 0, 1, 1,
0.8246883, 0.3236792, 2.307573, 0.5843138, 0, 1, 1,
0.8274512, -0.385524, 2.100304, 0.5882353, 0, 1, 1,
0.833809, -1.500831, 3.699085, 0.5960785, 0, 1, 1,
0.8344804, 0.1579818, 2.424227, 0.6039216, 0, 1, 1,
0.835516, -0.03152707, 4.217905, 0.6078432, 0, 1, 1,
0.8388895, -0.3117515, 0.2796347, 0.6156863, 0, 1, 1,
0.8423937, -0.1051002, 0.6886063, 0.6196079, 0, 1, 1,
0.8512158, -1.038243, 0.5944171, 0.627451, 0, 1, 1,
0.8530641, 1.729436, 0.7515913, 0.6313726, 0, 1, 1,
0.8589182, -1.252676, 4.037715, 0.6392157, 0, 1, 1,
0.8601489, 1.068642, 1.481797, 0.6431373, 0, 1, 1,
0.8602194, 0.6595336, 0.1880851, 0.6509804, 0, 1, 1,
0.8683679, -0.1082772, 1.021309, 0.654902, 0, 1, 1,
0.8703827, -0.2159101, 1.861534, 0.6627451, 0, 1, 1,
0.8757316, 1.272605, -0.7217333, 0.6666667, 0, 1, 1,
0.8790327, -0.7490048, 2.592882, 0.6745098, 0, 1, 1,
0.8828809, 1.860854, -0.3570212, 0.6784314, 0, 1, 1,
0.883158, -0.1996315, 1.870082, 0.6862745, 0, 1, 1,
0.8838034, -0.7092807, 2.445163, 0.6901961, 0, 1, 1,
0.8867257, 0.2060591, 0.9521342, 0.6980392, 0, 1, 1,
0.891123, -1.34968, 1.964083, 0.7058824, 0, 1, 1,
0.8945698, -0.7529941, 2.63353, 0.7098039, 0, 1, 1,
0.8952523, -0.1114978, 3.057943, 0.7176471, 0, 1, 1,
0.8977652, 1.457187, 0.9309265, 0.7215686, 0, 1, 1,
0.8989733, -1.252095, 5.597322, 0.7294118, 0, 1, 1,
0.90162, -1.85121, 2.87663, 0.7333333, 0, 1, 1,
0.9029108, 0.04059395, -0.2738922, 0.7411765, 0, 1, 1,
0.9038053, 1.189965, 3.04211, 0.7450981, 0, 1, 1,
0.9062143, -0.4007724, -0.2950199, 0.7529412, 0, 1, 1,
0.9072818, 0.2763326, 2.966307, 0.7568628, 0, 1, 1,
0.9109374, -0.8298281, 1.826729, 0.7647059, 0, 1, 1,
0.9112942, 0.3149411, 1.714956, 0.7686275, 0, 1, 1,
0.9201046, -1.150673, 3.678908, 0.7764706, 0, 1, 1,
0.9269412, 1.399099, 2.635556, 0.7803922, 0, 1, 1,
0.9279591, -2.131887, 1.658116, 0.7882353, 0, 1, 1,
0.9288521, 0.2942767, -1.178531, 0.7921569, 0, 1, 1,
0.9316749, -1.573075, 2.359533, 0.8, 0, 1, 1,
0.9343048, -0.817998, 1.086643, 0.8078431, 0, 1, 1,
0.9528286, 0.9994757, 0.9848394, 0.8117647, 0, 1, 1,
0.9566943, 0.5530328, -0.4463842, 0.8196079, 0, 1, 1,
0.9575238, -1.242387, 2.220201, 0.8235294, 0, 1, 1,
0.9650596, 1.373809, -0.6768984, 0.8313726, 0, 1, 1,
0.9764827, 0.985029, -0.4074397, 0.8352941, 0, 1, 1,
0.9780593, 0.6744534, -0.3011562, 0.8431373, 0, 1, 1,
0.983515, -0.8450986, 2.26181, 0.8470588, 0, 1, 1,
0.9844342, -0.06307832, 1.136088, 0.854902, 0, 1, 1,
0.9844888, 1.275948, 1.201254, 0.8588235, 0, 1, 1,
0.9858049, 0.68406, 0.08199439, 0.8666667, 0, 1, 1,
0.9987669, 1.63949, -0.0323233, 0.8705882, 0, 1, 1,
1.000389, 0.3146926, -0.5169784, 0.8784314, 0, 1, 1,
1.003197, -0.5447125, 1.806488, 0.8823529, 0, 1, 1,
1.006256, 0.1406907, 0.5447155, 0.8901961, 0, 1, 1,
1.014864, 0.5332254, 1.600184, 0.8941177, 0, 1, 1,
1.017474, -1.150719, 1.600062, 0.9019608, 0, 1, 1,
1.019152, 1.42991, 3.126929, 0.9098039, 0, 1, 1,
1.025264, -2.458263, 2.345575, 0.9137255, 0, 1, 1,
1.027294, -1.187273, 2.503996, 0.9215686, 0, 1, 1,
1.027691, -0.5540191, 3.555621, 0.9254902, 0, 1, 1,
1.031991, -0.5348303, 2.025698, 0.9333333, 0, 1, 1,
1.033629, 1.369974, 0.04901092, 0.9372549, 0, 1, 1,
1.036921, 1.64257, -0.4526172, 0.945098, 0, 1, 1,
1.038454, -0.8960239, 3.085548, 0.9490196, 0, 1, 1,
1.060867, 0.060457, 0.8936526, 0.9568627, 0, 1, 1,
1.062059, -1.632, 1.845867, 0.9607843, 0, 1, 1,
1.073322, -0.7280102, 3.653865, 0.9686275, 0, 1, 1,
1.073956, -1.167333, 1.640056, 0.972549, 0, 1, 1,
1.075385, 0.1151255, 2.90145, 0.9803922, 0, 1, 1,
1.078158, -0.6646618, 1.243646, 0.9843137, 0, 1, 1,
1.079662, -0.8174767, 2.235633, 0.9921569, 0, 1, 1,
1.092183, -0.7010165, 3.527158, 0.9960784, 0, 1, 1,
1.095548, -0.3338611, 0.9632912, 1, 0, 0.9960784, 1,
1.103793, 0.9522438, 1.976097, 1, 0, 0.9882353, 1,
1.104265, -1.509928, 2.80845, 1, 0, 0.9843137, 1,
1.104693, -1.47577, 2.753203, 1, 0, 0.9764706, 1,
1.109642, 0.04449822, 1.429477, 1, 0, 0.972549, 1,
1.110346, -0.8374248, 2.765803, 1, 0, 0.9647059, 1,
1.112525, 0.6920426, 0.6064064, 1, 0, 0.9607843, 1,
1.11274, 0.1019334, 0.7369263, 1, 0, 0.9529412, 1,
1.115141, -0.3340507, 2.986516, 1, 0, 0.9490196, 1,
1.120216, -0.6843141, 1.843026, 1, 0, 0.9411765, 1,
1.124075, 0.3134693, 0.351176, 1, 0, 0.9372549, 1,
1.127793, 1.454752, -0.4744181, 1, 0, 0.9294118, 1,
1.12894, 1.511004, 0.8531618, 1, 0, 0.9254902, 1,
1.132479, -0.1607795, 3.30164, 1, 0, 0.9176471, 1,
1.137111, 2.563834, 0.9819202, 1, 0, 0.9137255, 1,
1.143079, 1.099702, 1.146464, 1, 0, 0.9058824, 1,
1.15295, 0.3950078, 0.8013483, 1, 0, 0.9019608, 1,
1.155841, -0.07834092, 1.815359, 1, 0, 0.8941177, 1,
1.158389, 0.7875562, 2.31477, 1, 0, 0.8862745, 1,
1.159856, -0.8175259, 1.556511, 1, 0, 0.8823529, 1,
1.166504, -0.3922267, 1.36931, 1, 0, 0.8745098, 1,
1.168164, 0.523185, 1.617378, 1, 0, 0.8705882, 1,
1.168241, -1.000895, 3.912296, 1, 0, 0.8627451, 1,
1.169183, -1.748568, 3.789368, 1, 0, 0.8588235, 1,
1.172903, 1.318067, 0.3989543, 1, 0, 0.8509804, 1,
1.174031, 0.1640911, 1.331463, 1, 0, 0.8470588, 1,
1.178122, -1.732255, 0.569864, 1, 0, 0.8392157, 1,
1.182817, 0.4962438, 0.7357013, 1, 0, 0.8352941, 1,
1.185412, -0.9987089, 2.645212, 1, 0, 0.827451, 1,
1.195713, -0.8692998, 1.382425, 1, 0, 0.8235294, 1,
1.196703, 0.2238978, 3.588945, 1, 0, 0.8156863, 1,
1.199479, 1.33502, 1.855416, 1, 0, 0.8117647, 1,
1.202587, 1.237504, -0.01726448, 1, 0, 0.8039216, 1,
1.206024, 0.622352, 2.192156, 1, 0, 0.7960784, 1,
1.208553, 1.89182, 0.7193412, 1, 0, 0.7921569, 1,
1.211214, 0.6945875, -0.4572279, 1, 0, 0.7843137, 1,
1.213249, -0.3899428, 2.46764, 1, 0, 0.7803922, 1,
1.222987, -0.7899985, 0.4349126, 1, 0, 0.772549, 1,
1.229462, -0.6538346, 0.1806328, 1, 0, 0.7686275, 1,
1.231966, 0.8037202, -0.558257, 1, 0, 0.7607843, 1,
1.235693, -0.6002271, 1.663264, 1, 0, 0.7568628, 1,
1.237644, -1.785041, 3.341669, 1, 0, 0.7490196, 1,
1.245786, -0.6806053, 2.393434, 1, 0, 0.7450981, 1,
1.246926, 0.3973792, 1.379982, 1, 0, 0.7372549, 1,
1.248557, 0.9738916, 0.4629298, 1, 0, 0.7333333, 1,
1.249068, 1.403761, 0.4882392, 1, 0, 0.7254902, 1,
1.263644, 1.569719, 0.4849029, 1, 0, 0.7215686, 1,
1.266364, -1.346066, 2.380215, 1, 0, 0.7137255, 1,
1.272111, -1.129923, 2.280696, 1, 0, 0.7098039, 1,
1.27345, -0.7042163, 3.661351, 1, 0, 0.7019608, 1,
1.283755, -0.6118698, 1.539375, 1, 0, 0.6941177, 1,
1.290133, -0.3939978, 3.087127, 1, 0, 0.6901961, 1,
1.293154, -0.6976991, 1.939525, 1, 0, 0.682353, 1,
1.30067, -0.3690011, 0.9360747, 1, 0, 0.6784314, 1,
1.302418, -2.322646, 2.506441, 1, 0, 0.6705883, 1,
1.30584, -1.599789, 2.263514, 1, 0, 0.6666667, 1,
1.307797, -1.391955, 3.589952, 1, 0, 0.6588235, 1,
1.308385, 2.407284, 0.8853356, 1, 0, 0.654902, 1,
1.310499, -0.04065442, 4.152569, 1, 0, 0.6470588, 1,
1.31082, 1.191651, 2.619016, 1, 0, 0.6431373, 1,
1.315205, 0.9665362, 0.4034922, 1, 0, 0.6352941, 1,
1.320821, 0.151078, 2.108848, 1, 0, 0.6313726, 1,
1.325404, -0.5661327, 1.484471, 1, 0, 0.6235294, 1,
1.325435, 0.09747306, 1.766278, 1, 0, 0.6196079, 1,
1.325665, 0.8043993, 0.918358, 1, 0, 0.6117647, 1,
1.331038, -1.796711, 2.307146, 1, 0, 0.6078432, 1,
1.333964, 0.03918472, 0.732835, 1, 0, 0.6, 1,
1.336974, -0.2942308, 3.778347, 1, 0, 0.5921569, 1,
1.339077, -0.4131291, 3.209379, 1, 0, 0.5882353, 1,
1.344846, -0.6825979, 2.297752, 1, 0, 0.5803922, 1,
1.351612, 0.07878976, 2.906657, 1, 0, 0.5764706, 1,
1.36162, 0.9375728, 0.871221, 1, 0, 0.5686275, 1,
1.361784, -0.4941493, -0.2001806, 1, 0, 0.5647059, 1,
1.378848, 0.1728626, 2.185133, 1, 0, 0.5568628, 1,
1.384603, -0.2330354, 1.250851, 1, 0, 0.5529412, 1,
1.39267, 2.111171, -1.647815, 1, 0, 0.5450981, 1,
1.396938, 0.8767754, 0.8253203, 1, 0, 0.5411765, 1,
1.416448, 0.2592538, 2.266294, 1, 0, 0.5333334, 1,
1.419532, 0.9315402, 0.3874125, 1, 0, 0.5294118, 1,
1.43296, -0.6074581, 1.506816, 1, 0, 0.5215687, 1,
1.433382, 0.6318225, 1.19145, 1, 0, 0.5176471, 1,
1.435853, -0.9538236, 3.499417, 1, 0, 0.509804, 1,
1.441809, -0.1823542, 2.025803, 1, 0, 0.5058824, 1,
1.442914, -1.910725, 3.400191, 1, 0, 0.4980392, 1,
1.445138, 0.03362564, 0.8287042, 1, 0, 0.4901961, 1,
1.448586, 0.6484243, 1.026874, 1, 0, 0.4862745, 1,
1.450826, -1.772198, 1.020614, 1, 0, 0.4784314, 1,
1.461517, -0.2558697, 3.212955, 1, 0, 0.4745098, 1,
1.469123, 0.6399896, 1.025927, 1, 0, 0.4666667, 1,
1.474267, -0.2653979, 0.7222406, 1, 0, 0.4627451, 1,
1.479175, 1.423592, 0.7696385, 1, 0, 0.454902, 1,
1.480506, 0.8468965, 0.8916858, 1, 0, 0.4509804, 1,
1.491832, -0.1571617, 2.568301, 1, 0, 0.4431373, 1,
1.501804, 0.5729315, 1.363688, 1, 0, 0.4392157, 1,
1.50971, 0.4010568, 3.609403, 1, 0, 0.4313726, 1,
1.526586, -1.054417, 2.610368, 1, 0, 0.427451, 1,
1.54806, 1.126967, 1.128027, 1, 0, 0.4196078, 1,
1.549507, -2.262433, 3.156333, 1, 0, 0.4156863, 1,
1.563846, 1.092576, 0.6172355, 1, 0, 0.4078431, 1,
1.573547, 1.169947, 0.3951865, 1, 0, 0.4039216, 1,
1.575371, 0.1680185, 1.134323, 1, 0, 0.3960784, 1,
1.578015, -1.316717, 4.008148, 1, 0, 0.3882353, 1,
1.580617, -0.7014084, 0.7932871, 1, 0, 0.3843137, 1,
1.583186, 1.209943, -0.5335473, 1, 0, 0.3764706, 1,
1.583344, 0.3721985, 1.714491, 1, 0, 0.372549, 1,
1.583546, -0.138119, 3.141996, 1, 0, 0.3647059, 1,
1.585783, 0.5673836, -1.197968, 1, 0, 0.3607843, 1,
1.586856, -0.5458426, 2.911232, 1, 0, 0.3529412, 1,
1.598826, -1.183069, 3.532599, 1, 0, 0.3490196, 1,
1.607341, 1.119814, -1.118084, 1, 0, 0.3411765, 1,
1.616362, -0.8098987, 1.548519, 1, 0, 0.3372549, 1,
1.631618, 0.4747225, 1.25354, 1, 0, 0.3294118, 1,
1.639247, 0.6924862, -0.001955963, 1, 0, 0.3254902, 1,
1.6561, 1.170405, 1.424017, 1, 0, 0.3176471, 1,
1.656309, -0.6357791, 2.934334, 1, 0, 0.3137255, 1,
1.673829, -0.7279388, 4.381217, 1, 0, 0.3058824, 1,
1.684081, -0.4998561, 1.524601, 1, 0, 0.2980392, 1,
1.688064, -0.7304431, 2.92233, 1, 0, 0.2941177, 1,
1.716341, -0.6893048, 3.041767, 1, 0, 0.2862745, 1,
1.739647, -0.7309681, 0.2135406, 1, 0, 0.282353, 1,
1.763406, -0.9348972, 3.052364, 1, 0, 0.2745098, 1,
1.765298, -0.001874901, 2.378516, 1, 0, 0.2705882, 1,
1.767994, 0.3718405, 0.5798852, 1, 0, 0.2627451, 1,
1.772283, 1.592598, -0.6785443, 1, 0, 0.2588235, 1,
1.776713, -0.1330467, 1.750679, 1, 0, 0.2509804, 1,
1.831056, 0.955561, 1.129365, 1, 0, 0.2470588, 1,
1.852563, -2.332332, 0.7274441, 1, 0, 0.2392157, 1,
1.858263, 0.3101414, 0.2387868, 1, 0, 0.2352941, 1,
1.902396, 0.8417956, -0.4449143, 1, 0, 0.227451, 1,
1.917258, -0.324076, 1.183679, 1, 0, 0.2235294, 1,
1.920719, -0.2711781, 0.9525442, 1, 0, 0.2156863, 1,
1.925269, -0.253988, 3.613631, 1, 0, 0.2117647, 1,
1.935595, -1.011478, 2.032571, 1, 0, 0.2039216, 1,
1.94324, 0.3676794, 3.545584, 1, 0, 0.1960784, 1,
1.961725, 1.368915, 1.049932, 1, 0, 0.1921569, 1,
1.987427, 0.9323061, -0.5139419, 1, 0, 0.1843137, 1,
1.990544, 0.9109437, 2.000554, 1, 0, 0.1803922, 1,
1.991235, -0.412226, 1.816689, 1, 0, 0.172549, 1,
1.991277, 0.4044999, 1.395545, 1, 0, 0.1686275, 1,
1.995948, -1.548068, 2.243877, 1, 0, 0.1607843, 1,
2.005999, 0.7807837, 1.018919, 1, 0, 0.1568628, 1,
2.074137, -0.3384928, 3.273714, 1, 0, 0.1490196, 1,
2.10842, 0.7879406, 0.3557522, 1, 0, 0.145098, 1,
2.108653, -0.8697177, 0.9885787, 1, 0, 0.1372549, 1,
2.124545, -0.6917959, 1.937105, 1, 0, 0.1333333, 1,
2.138256, 0.3056197, 1.833166, 1, 0, 0.1254902, 1,
2.139896, -1.118322, 2.071518, 1, 0, 0.1215686, 1,
2.157155, -0.8871668, 1.416145, 1, 0, 0.1137255, 1,
2.157707, -0.3036971, 2.087088, 1, 0, 0.1098039, 1,
2.22346, -1.848355, -0.3127333, 1, 0, 0.1019608, 1,
2.37337, 0.4182025, 0.8509521, 1, 0, 0.09411765, 1,
2.383933, -0.1572381, 2.156826, 1, 0, 0.09019608, 1,
2.43544, 0.2073916, 1.502344, 1, 0, 0.08235294, 1,
2.438594, -0.4920947, 2.982089, 1, 0, 0.07843138, 1,
2.453269, 0.7386604, 2.217984, 1, 0, 0.07058824, 1,
2.465212, 0.8161848, 0.4713967, 1, 0, 0.06666667, 1,
2.500154, -0.2137747, 1.066783, 1, 0, 0.05882353, 1,
2.568538, 0.4486478, 0.7608901, 1, 0, 0.05490196, 1,
2.615663, -1.174554, 1.202962, 1, 0, 0.04705882, 1,
2.835089, 0.5399286, 0.9969801, 1, 0, 0.04313726, 1,
2.894014, -1.08848, 2.746849, 1, 0, 0.03529412, 1,
2.917495, -1.047973, 3.543251, 1, 0, 0.03137255, 1,
3.092086, 0.3505417, 1.011765, 1, 0, 0.02352941, 1,
3.143424, -0.3854293, 2.125473, 1, 0, 0.01960784, 1,
3.37951, 0.393601, 2.438543, 1, 0, 0.01176471, 1,
3.561574, -0.2953903, 2.105859, 1, 0, 0.007843138, 1
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
0.05821013, -4.635828, -7.109893, 0, -0.5, 0.5, 0.5,
0.05821013, -4.635828, -7.109893, 1, -0.5, 0.5, 0.5,
0.05821013, -4.635828, -7.109893, 1, 1.5, 0.5, 0.5,
0.05821013, -4.635828, -7.109893, 0, 1.5, 0.5, 0.5
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
-4.632795, -0.07678938, -7.109893, 0, -0.5, 0.5, 0.5,
-4.632795, -0.07678938, -7.109893, 1, -0.5, 0.5, 0.5,
-4.632795, -0.07678938, -7.109893, 1, 1.5, 0.5, 0.5,
-4.632795, -0.07678938, -7.109893, 0, 1.5, 0.5, 0.5
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
-4.632795, -4.635828, 0.2855856, 0, -0.5, 0.5, 0.5,
-4.632795, -4.635828, 0.2855856, 1, -0.5, 0.5, 0.5,
-4.632795, -4.635828, 0.2855856, 1, 1.5, 0.5, 0.5,
-4.632795, -4.635828, 0.2855856, 0, 1.5, 0.5, 0.5
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
-2, -3.583743, -5.403244,
2, -3.583743, -5.403244,
-2, -3.583743, -5.403244,
-2, -3.75909, -5.687685,
0, -3.583743, -5.403244,
0, -3.75909, -5.687685,
2, -3.583743, -5.403244,
2, -3.75909, -5.687685
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
"0",
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
-2, -4.109786, -6.256568, 0, -0.5, 0.5, 0.5,
-2, -4.109786, -6.256568, 1, -0.5, 0.5, 0.5,
-2, -4.109786, -6.256568, 1, 1.5, 0.5, 0.5,
-2, -4.109786, -6.256568, 0, 1.5, 0.5, 0.5,
0, -4.109786, -6.256568, 0, -0.5, 0.5, 0.5,
0, -4.109786, -6.256568, 1, -0.5, 0.5, 0.5,
0, -4.109786, -6.256568, 1, 1.5, 0.5, 0.5,
0, -4.109786, -6.256568, 0, 1.5, 0.5, 0.5,
2, -4.109786, -6.256568, 0, -0.5, 0.5, 0.5,
2, -4.109786, -6.256568, 1, -0.5, 0.5, 0.5,
2, -4.109786, -6.256568, 1, 1.5, 0.5, 0.5,
2, -4.109786, -6.256568, 0, 1.5, 0.5, 0.5
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
-3.550255, -3, -5.403244,
-3.550255, 3, -5.403244,
-3.550255, -3, -5.403244,
-3.730678, -3, -5.687685,
-3.550255, -2, -5.403244,
-3.730678, -2, -5.687685,
-3.550255, -1, -5.403244,
-3.730678, -1, -5.687685,
-3.550255, 0, -5.403244,
-3.730678, 0, -5.687685,
-3.550255, 1, -5.403244,
-3.730678, 1, -5.687685,
-3.550255, 2, -5.403244,
-3.730678, 2, -5.687685,
-3.550255, 3, -5.403244,
-3.730678, 3, -5.687685
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
-4.091525, -3, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, -3, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, -3, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, -3, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, -2, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, -2, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, -2, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, -2, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, -1, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, -1, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, -1, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, -1, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, 0, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, 0, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, 0, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, 0, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, 1, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, 1, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, 1, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, 1, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, 2, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, 2, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, 2, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, 2, -6.256568, 0, 1.5, 0.5, 0.5,
-4.091525, 3, -6.256568, 0, -0.5, 0.5, 0.5,
-4.091525, 3, -6.256568, 1, -0.5, 0.5, 0.5,
-4.091525, 3, -6.256568, 1, 1.5, 0.5, 0.5,
-4.091525, 3, -6.256568, 0, 1.5, 0.5, 0.5
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
-3.550255, -3.583743, -4,
-3.550255, -3.583743, 4,
-3.550255, -3.583743, -4,
-3.730678, -3.75909, -4,
-3.550255, -3.583743, -2,
-3.730678, -3.75909, -2,
-3.550255, -3.583743, 0,
-3.730678, -3.75909, 0,
-3.550255, -3.583743, 2,
-3.730678, -3.75909, 2,
-3.550255, -3.583743, 4,
-3.730678, -3.75909, 4
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
-4.091525, -4.109786, -4, 0, -0.5, 0.5, 0.5,
-4.091525, -4.109786, -4, 1, -0.5, 0.5, 0.5,
-4.091525, -4.109786, -4, 1, 1.5, 0.5, 0.5,
-4.091525, -4.109786, -4, 0, 1.5, 0.5, 0.5,
-4.091525, -4.109786, -2, 0, -0.5, 0.5, 0.5,
-4.091525, -4.109786, -2, 1, -0.5, 0.5, 0.5,
-4.091525, -4.109786, -2, 1, 1.5, 0.5, 0.5,
-4.091525, -4.109786, -2, 0, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 0, 0, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 0, 1, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 0, 1, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 0, 0, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 2, 0, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 2, 1, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 2, 1, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 2, 0, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 4, 0, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 4, 1, -0.5, 0.5, 0.5,
-4.091525, -4.109786, 4, 1, 1.5, 0.5, 0.5,
-4.091525, -4.109786, 4, 0, 1.5, 0.5, 0.5
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
-3.550255, -3.583743, -5.403244,
-3.550255, 3.430164, -5.403244,
-3.550255, -3.583743, 5.974415,
-3.550255, 3.430164, 5.974415,
-3.550255, -3.583743, -5.403244,
-3.550255, -3.583743, 5.974415,
-3.550255, 3.430164, -5.403244,
-3.550255, 3.430164, 5.974415,
-3.550255, -3.583743, -5.403244,
3.666675, -3.583743, -5.403244,
-3.550255, -3.583743, 5.974415,
3.666675, -3.583743, 5.974415,
-3.550255, 3.430164, -5.403244,
3.666675, 3.430164, -5.403244,
-3.550255, 3.430164, 5.974415,
3.666675, 3.430164, 5.974415,
3.666675, -3.583743, -5.403244,
3.666675, 3.430164, -5.403244,
3.666675, -3.583743, 5.974415,
3.666675, 3.430164, 5.974415,
3.666675, -3.583743, -5.403244,
3.666675, -3.583743, 5.974415,
3.666675, 3.430164, -5.403244,
3.666675, 3.430164, 5.974415
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
var radius = 8.111059;
var distance = 36.08702;
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
mvMatrix.translate( -0.05821013, 0.07678938, -0.2855856 );
mvMatrix.scale( 1.215175, 1.25035, 0.7707945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.08702);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
arsanilic_acid<-read.table("arsanilic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsanilic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsanilic_acid' not found
```

```r
y<-arsanilic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsanilic_acid' not found
```

```r
z<-arsanilic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsanilic_acid' not found
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
-3.445154, -1.254833, -0.06843641, 0, 0, 1, 1, 1,
-3.331198, 0.2758197, -2.115516, 1, 0, 0, 1, 1,
-3.149503, 0.2818438, -1.875526, 1, 0, 0, 1, 1,
-3.129228, -0.5441512, -1.355652, 1, 0, 0, 1, 1,
-3.067287, -1.036222, -1.243587, 1, 0, 0, 1, 1,
-2.990633, 2.721121, -2.278151, 1, 0, 0, 1, 1,
-2.677717, 0.004044887, -2.072949, 0, 0, 0, 1, 1,
-2.638998, 0.1462505, -0.5549834, 0, 0, 0, 1, 1,
-2.456784, -0.5262769, -0.7674421, 0, 0, 0, 1, 1,
-2.397273, -0.8739604, -2.74849, 0, 0, 0, 1, 1,
-2.341438, 0.7028828, -2.330138, 0, 0, 0, 1, 1,
-2.327631, -0.4431885, -1.755855, 0, 0, 0, 1, 1,
-2.306685, -0.2998805, -1.893182, 0, 0, 0, 1, 1,
-2.299527, -1.354186, -2.814651, 1, 1, 1, 1, 1,
-2.27783, 0.7565202, 0.3412374, 1, 1, 1, 1, 1,
-2.224372, -0.8265733, -3.232536, 1, 1, 1, 1, 1,
-2.179296, 0.2678916, -0.1515044, 1, 1, 1, 1, 1,
-2.16945, 2.250053, -0.8037156, 1, 1, 1, 1, 1,
-2.079392, -1.157299, -1.868949, 1, 1, 1, 1, 1,
-2.06191, 0.6158707, -2.411728, 1, 1, 1, 1, 1,
-2.021399, 0.3464437, -3.039065, 1, 1, 1, 1, 1,
-2.009511, 0.4406407, -0.163675, 1, 1, 1, 1, 1,
-1.954799, 0.4925002, -0.3447032, 1, 1, 1, 1, 1,
-1.953042, -0.9266094, -2.455149, 1, 1, 1, 1, 1,
-1.950722, -0.4887401, -3.175865, 1, 1, 1, 1, 1,
-1.948843, -0.6469324, -3.342426, 1, 1, 1, 1, 1,
-1.946645, -1.762743, -0.4201512, 1, 1, 1, 1, 1,
-1.942282, -0.5118175, -1.918489, 1, 1, 1, 1, 1,
-1.928802, -0.6007718, -0.7551591, 0, 0, 1, 1, 1,
-1.914124, -0.0350472, -2.66469, 1, 0, 0, 1, 1,
-1.904481, -0.1343184, -0.8508886, 1, 0, 0, 1, 1,
-1.870381, 0.2848045, -2.406164, 1, 0, 0, 1, 1,
-1.866307, -0.3217512, -1.171031, 1, 0, 0, 1, 1,
-1.826886, 1.132742, 0.5853857, 1, 0, 0, 1, 1,
-1.826476, -0.06076494, 1.084546, 0, 0, 0, 1, 1,
-1.805952, 0.4786972, -0.5318767, 0, 0, 0, 1, 1,
-1.733518, 1.680396, -2.376154, 0, 0, 0, 1, 1,
-1.681512, -1.000824, -0.3078198, 0, 0, 0, 1, 1,
-1.658451, 0.6795989, -2.374066, 0, 0, 0, 1, 1,
-1.633456, 2.087615, 0.8751339, 0, 0, 0, 1, 1,
-1.633032, 0.9814418, -3.139838, 0, 0, 0, 1, 1,
-1.623822, -1.000516, -2.357046, 1, 1, 1, 1, 1,
-1.619632, 0.421167, -0.4702817, 1, 1, 1, 1, 1,
-1.610165, 0.7163829, -1.537841, 1, 1, 1, 1, 1,
-1.608592, 0.1335792, -3.741518, 1, 1, 1, 1, 1,
-1.592694, 1.48548, -1.336833, 1, 1, 1, 1, 1,
-1.590467, 1.184029, -1.095645, 1, 1, 1, 1, 1,
-1.576392, -0.5889265, -2.499251, 1, 1, 1, 1, 1,
-1.571113, 0.3756151, -1.410843, 1, 1, 1, 1, 1,
-1.570493, 1.276556, -0.2275198, 1, 1, 1, 1, 1,
-1.567373, 0.2024489, -0.3486349, 1, 1, 1, 1, 1,
-1.539886, -0.4719266, -1.778421, 1, 1, 1, 1, 1,
-1.537474, -1.642183, -2.073123, 1, 1, 1, 1, 1,
-1.534927, -0.9000971, -1.491346, 1, 1, 1, 1, 1,
-1.523869, 0.1747346, -1.288662, 1, 1, 1, 1, 1,
-1.510385, 0.690415, -0.4316494, 1, 1, 1, 1, 1,
-1.504555, -1.228714, -2.999479, 0, 0, 1, 1, 1,
-1.488009, -0.3131993, -1.035622, 1, 0, 0, 1, 1,
-1.485665, 0.7768689, -1.671774, 1, 0, 0, 1, 1,
-1.483706, 0.9697016, -2.56156, 1, 0, 0, 1, 1,
-1.477133, -1.08404, -2.881868, 1, 0, 0, 1, 1,
-1.424002, 0.3936047, -2.140325, 1, 0, 0, 1, 1,
-1.42216, 1.204299, -1.878626, 0, 0, 0, 1, 1,
-1.418335, -1.306618, -3.467432, 0, 0, 0, 1, 1,
-1.416577, -0.1436947, -2.61147, 0, 0, 0, 1, 1,
-1.414034, -0.2751593, -5.23755, 0, 0, 0, 1, 1,
-1.403178, -0.3119656, -1.553796, 0, 0, 0, 1, 1,
-1.390892, 0.273387, -0.6107155, 0, 0, 0, 1, 1,
-1.387986, -1.682835, -3.20095, 0, 0, 0, 1, 1,
-1.38689, 0.2536561, -1.281052, 1, 1, 1, 1, 1,
-1.386887, -1.372873, -1.470114, 1, 1, 1, 1, 1,
-1.381484, -1.216653, -2.388225, 1, 1, 1, 1, 1,
-1.373127, -0.7530356, -1.805465, 1, 1, 1, 1, 1,
-1.349981, -1.846977, -4.14085, 1, 1, 1, 1, 1,
-1.341906, 2.288835, -0.06459003, 1, 1, 1, 1, 1,
-1.337383, -0.05686982, -2.994898, 1, 1, 1, 1, 1,
-1.320386, -2.372036, -1.537388, 1, 1, 1, 1, 1,
-1.314061, -0.07442962, -2.95988, 1, 1, 1, 1, 1,
-1.310098, -0.7609345, -3.686254, 1, 1, 1, 1, 1,
-1.307598, 1.013987, -0.4170748, 1, 1, 1, 1, 1,
-1.299597, -0.6323311, -2.752355, 1, 1, 1, 1, 1,
-1.291391, 1.528724, -2.159791, 1, 1, 1, 1, 1,
-1.273807, 1.165286, -1.766705, 1, 1, 1, 1, 1,
-1.261832, 0.1888466, -3.617495, 1, 1, 1, 1, 1,
-1.252588, 0.9275091, -1.408447, 0, 0, 1, 1, 1,
-1.233312, 0.3701129, -0.4118969, 1, 0, 0, 1, 1,
-1.224694, -0.5892368, -3.279894, 1, 0, 0, 1, 1,
-1.224619, -0.07977105, -1.653568, 1, 0, 0, 1, 1,
-1.219321, -1.568262, -3.331263, 1, 0, 0, 1, 1,
-1.208771, 0.4102077, -3.223627, 1, 0, 0, 1, 1,
-1.201209, 1.110509, 0.06236616, 0, 0, 0, 1, 1,
-1.200218, 1.204347, -0.8159602, 0, 0, 0, 1, 1,
-1.200096, -1.255917, -2.959206, 0, 0, 0, 1, 1,
-1.197741, -1.3672, -3.17717, 0, 0, 0, 1, 1,
-1.193877, -0.1612955, -0.1486919, 0, 0, 0, 1, 1,
-1.192345, -0.314749, -0.5032842, 0, 0, 0, 1, 1,
-1.188504, 1.722105, 0.9283566, 0, 0, 0, 1, 1,
-1.187493, -0.149525, -2.244669, 1, 1, 1, 1, 1,
-1.174808, 0.2410058, -0.9123978, 1, 1, 1, 1, 1,
-1.170389, 0.6736198, 0.07158069, 1, 1, 1, 1, 1,
-1.163696, 0.4300173, -0.2347354, 1, 1, 1, 1, 1,
-1.157004, -1.817696, -2.637143, 1, 1, 1, 1, 1,
-1.156066, -1.564847, -3.850478, 1, 1, 1, 1, 1,
-1.153186, -0.5349088, -2.64107, 1, 1, 1, 1, 1,
-1.151151, 0.3631406, -1.678653, 1, 1, 1, 1, 1,
-1.147746, 0.2076883, 0.5124701, 1, 1, 1, 1, 1,
-1.145537, -0.1184164, -2.265046, 1, 1, 1, 1, 1,
-1.124679, -0.5150249, -1.889269, 1, 1, 1, 1, 1,
-1.123641, -1.97867, -3.085603, 1, 1, 1, 1, 1,
-1.117404, 1.798705, -1.736651, 1, 1, 1, 1, 1,
-1.113823, -0.8941542, -2.07982, 1, 1, 1, 1, 1,
-1.109318, -1.750685, -0.6271361, 1, 1, 1, 1, 1,
-1.104782, 1.054484, -0.6464195, 0, 0, 1, 1, 1,
-1.103143, 0.2973921, -1.521368, 1, 0, 0, 1, 1,
-1.092008, -1.581297, -2.535993, 1, 0, 0, 1, 1,
-1.09097, 1.040834, -1.165882, 1, 0, 0, 1, 1,
-1.089571, -1.548925, -2.854951, 1, 0, 0, 1, 1,
-1.071929, 2.480605, -1.538895, 1, 0, 0, 1, 1,
-1.060981, 1.346453, -0.6111693, 0, 0, 0, 1, 1,
-1.059707, 0.6885802, -1.020968, 0, 0, 0, 1, 1,
-1.057995, 0.2422053, -4.478711, 0, 0, 0, 1, 1,
-1.054258, -0.3997974, -0.5168368, 0, 0, 0, 1, 1,
-1.047387, 0.4671018, -0.818545, 0, 0, 0, 1, 1,
-1.047159, -0.9940262, -3.167016, 0, 0, 0, 1, 1,
-1.032857, 0.839151, -0.816765, 0, 0, 0, 1, 1,
-1.031712, 0.9874636, -2.036123, 1, 1, 1, 1, 1,
-1.018511, -0.8942221, -2.831753, 1, 1, 1, 1, 1,
-1.013178, 0.07208835, 0.7003453, 1, 1, 1, 1, 1,
-1.012855, 0.8191665, -1.441887, 1, 1, 1, 1, 1,
-1.00368, 0.3316159, -1.359064, 1, 1, 1, 1, 1,
-1.002991, 1.781879, 1.685403, 1, 1, 1, 1, 1,
-1.00179, 1.222607, 0.479127, 1, 1, 1, 1, 1,
-1.000003, -0.4908119, -3.410454, 1, 1, 1, 1, 1,
-0.9989553, 2.44948, -1.10025, 1, 1, 1, 1, 1,
-0.9929865, 1.994804, 0.438826, 1, 1, 1, 1, 1,
-0.9888747, 0.3708662, -2.018985, 1, 1, 1, 1, 1,
-0.9883516, -0.5496008, -2.528703, 1, 1, 1, 1, 1,
-0.9754412, -1.04915, -1.815814, 1, 1, 1, 1, 1,
-0.9697266, 0.1561851, -1.502051, 1, 1, 1, 1, 1,
-0.9634417, 0.3618497, -0.09686039, 1, 1, 1, 1, 1,
-0.9626797, -2.979352, -2.459506, 0, 0, 1, 1, 1,
-0.9626125, 1.31616, -2.646276, 1, 0, 0, 1, 1,
-0.9611602, -0.838966, 0.3891431, 1, 0, 0, 1, 1,
-0.9577511, 0.09195117, -2.376625, 1, 0, 0, 1, 1,
-0.9546084, -1.621807, -2.447126, 1, 0, 0, 1, 1,
-0.9538726, 0.5709726, -0.8964075, 1, 0, 0, 1, 1,
-0.9509914, -0.1136719, -0.948445, 0, 0, 0, 1, 1,
-0.9457341, 0.2903931, -1.184887, 0, 0, 0, 1, 1,
-0.9401786, -1.108924, -1.33914, 0, 0, 0, 1, 1,
-0.9372178, 0.06390376, -0.1476094, 0, 0, 0, 1, 1,
-0.9363818, -1.00904, -3.292537, 0, 0, 0, 1, 1,
-0.9344493, 0.5896307, 0.1706248, 0, 0, 0, 1, 1,
-0.9338611, 1.711434, -0.6286463, 0, 0, 0, 1, 1,
-0.9241906, 1.176859, -0.5277787, 1, 1, 1, 1, 1,
-0.9236115, -0.1469838, -2.80178, 1, 1, 1, 1, 1,
-0.9232827, -0.1643962, -2.18013, 1, 1, 1, 1, 1,
-0.9200578, -0.6710018, -3.586324, 1, 1, 1, 1, 1,
-0.9129755, -2.413441, -3.300739, 1, 1, 1, 1, 1,
-0.9095368, 0.8607885, -2.446345, 1, 1, 1, 1, 1,
-0.9089935, -1.717133, -3.755937, 1, 1, 1, 1, 1,
-0.9054679, -0.5607967, -4.908405, 1, 1, 1, 1, 1,
-0.9010428, -1.542923, -0.8738724, 1, 1, 1, 1, 1,
-0.9007306, 0.09614555, -3.041428, 1, 1, 1, 1, 1,
-0.8965819, -0.7145241, -2.937474, 1, 1, 1, 1, 1,
-0.8944778, -1.7802, -2.927618, 1, 1, 1, 1, 1,
-0.894407, 0.7921659, -2.053704, 1, 1, 1, 1, 1,
-0.89345, -0.7641442, -1.69996, 1, 1, 1, 1, 1,
-0.8881261, -0.08904374, -1.207039, 1, 1, 1, 1, 1,
-0.8880238, -1.329277, -3.663612, 0, 0, 1, 1, 1,
-0.8727529, 0.7170398, -1.801873, 1, 0, 0, 1, 1,
-0.867561, -1.706555, -2.394362, 1, 0, 0, 1, 1,
-0.8617615, 0.4347664, -0.9900721, 1, 0, 0, 1, 1,
-0.8592277, 2.811447, -1.165148, 1, 0, 0, 1, 1,
-0.8529524, -1.250372, -2.365598, 1, 0, 0, 1, 1,
-0.852735, 0.007953128, -2.937786, 0, 0, 0, 1, 1,
-0.8522735, 0.1813679, 0.3873152, 0, 0, 0, 1, 1,
-0.8503051, 1.109133, 0.03320907, 0, 0, 0, 1, 1,
-0.848494, -0.6624448, -2.440436, 0, 0, 0, 1, 1,
-0.8461063, -0.180813, -2.658803, 0, 0, 0, 1, 1,
-0.837298, -0.2314938, -2.047688, 0, 0, 0, 1, 1,
-0.8326615, 0.6144801, -1.119656, 0, 0, 0, 1, 1,
-0.8323392, 0.5318918, -1.343492, 1, 1, 1, 1, 1,
-0.8310058, -0.04872153, -0.9486914, 1, 1, 1, 1, 1,
-0.8295215, -0.7070875, -1.060822, 1, 1, 1, 1, 1,
-0.8290481, 2.546199, 0.2162635, 1, 1, 1, 1, 1,
-0.8284296, 0.3283885, -1.608984, 1, 1, 1, 1, 1,
-0.8207586, 1.826743, -1.15632, 1, 1, 1, 1, 1,
-0.820131, -1.301533, -2.16647, 1, 1, 1, 1, 1,
-0.8137075, -1.652325, -2.545311, 1, 1, 1, 1, 1,
-0.8083086, 0.4046658, -0.8341113, 1, 1, 1, 1, 1,
-0.8038183, -1.153968, -3.301635, 1, 1, 1, 1, 1,
-0.8025758, 0.06155775, -0.1283403, 1, 1, 1, 1, 1,
-0.8022358, -0.9292657, -0.2981847, 1, 1, 1, 1, 1,
-0.7961532, 0.03268171, -2.977355, 1, 1, 1, 1, 1,
-0.7956157, 0.4288229, 0.05843274, 1, 1, 1, 1, 1,
-0.7893897, -0.59742, -2.086776, 1, 1, 1, 1, 1,
-0.7862087, 0.7258716, -0.8291451, 0, 0, 1, 1, 1,
-0.7836962, -0.1684553, -1.342972, 1, 0, 0, 1, 1,
-0.7834479, -0.03029089, -0.5445028, 1, 0, 0, 1, 1,
-0.7795359, -0.7635667, -1.991737, 1, 0, 0, 1, 1,
-0.7789385, 0.1040884, -0.5007402, 1, 0, 0, 1, 1,
-0.7716779, -1.025626, -1.218055, 1, 0, 0, 1, 1,
-0.7655829, -0.02005149, -1.608977, 0, 0, 0, 1, 1,
-0.7635363, -0.462952, -2.825165, 0, 0, 0, 1, 1,
-0.7616068, 0.7035725, -1.229722, 0, 0, 0, 1, 1,
-0.7600192, -0.1857118, -2.274333, 0, 0, 0, 1, 1,
-0.7591825, -0.2527867, -1.027684, 0, 0, 0, 1, 1,
-0.756376, 0.9507066, -1.915369, 0, 0, 0, 1, 1,
-0.7518955, -0.3035912, -2.054992, 0, 0, 0, 1, 1,
-0.7515794, 0.4638172, -0.1905493, 1, 1, 1, 1, 1,
-0.745944, 1.45238, -1.274296, 1, 1, 1, 1, 1,
-0.7374092, -0.5838014, -1.749196, 1, 1, 1, 1, 1,
-0.7372876, 0.706798, -3.266962, 1, 1, 1, 1, 1,
-0.73361, 0.5591764, -1.692571, 1, 1, 1, 1, 1,
-0.7334443, -0.7765673, -1.25109, 1, 1, 1, 1, 1,
-0.7288373, -1.231424, -2.809152, 1, 1, 1, 1, 1,
-0.7277691, 0.008737214, -4.704749, 1, 1, 1, 1, 1,
-0.7218271, -0.3023044, -0.5631568, 1, 1, 1, 1, 1,
-0.7208952, 0.1912876, -1.344726, 1, 1, 1, 1, 1,
-0.7113886, 1.232386, -0.8287259, 1, 1, 1, 1, 1,
-0.6950483, 0.8194478, -1.670432, 1, 1, 1, 1, 1,
-0.6939678, 0.2654199, -1.899103, 1, 1, 1, 1, 1,
-0.6878723, -0.1084933, -1.255183, 1, 1, 1, 1, 1,
-0.6852373, 0.3637913, 0.6911688, 1, 1, 1, 1, 1,
-0.6782063, -0.2384246, 0.2098543, 0, 0, 1, 1, 1,
-0.6778145, 0.6071892, -0.9039526, 1, 0, 0, 1, 1,
-0.673233, -1.766173, -2.04438, 1, 0, 0, 1, 1,
-0.6727175, -1.144154, -1.350751, 1, 0, 0, 1, 1,
-0.671982, -0.4173425, -2.660735, 1, 0, 0, 1, 1,
-0.6688209, 0.4205035, 0.377379, 1, 0, 0, 1, 1,
-0.6668422, 1.207134, 0.1208571, 0, 0, 0, 1, 1,
-0.6609519, 0.2622483, -1.913062, 0, 0, 0, 1, 1,
-0.6606902, -1.418876, -1.86159, 0, 0, 0, 1, 1,
-0.659595, 0.9314099, -2.994558, 0, 0, 0, 1, 1,
-0.6461675, -0.86689, -1.530908, 0, 0, 0, 1, 1,
-0.6422573, -0.7487933, -4.367881, 0, 0, 0, 1, 1,
-0.6411187, -0.4990743, -4.570405, 0, 0, 0, 1, 1,
-0.6312051, 1.554172, -0.4161633, 1, 1, 1, 1, 1,
-0.6310828, -0.6527254, -1.164063, 1, 1, 1, 1, 1,
-0.6262202, -1.068671, -4.380615, 1, 1, 1, 1, 1,
-0.6215, 1.234087, 0.18808, 1, 1, 1, 1, 1,
-0.6188848, -0.4494847, 0.5611864, 1, 1, 1, 1, 1,
-0.6120387, -0.216619, -0.5290485, 1, 1, 1, 1, 1,
-0.608749, -0.3982272, -1.823648, 1, 1, 1, 1, 1,
-0.604085, -0.3247424, -1.685302, 1, 1, 1, 1, 1,
-0.603539, 1.71862, -1.241069, 1, 1, 1, 1, 1,
-0.6034556, -0.6994743, -4.293924, 1, 1, 1, 1, 1,
-0.59764, -0.08808661, -1.513359, 1, 1, 1, 1, 1,
-0.5925656, 0.6593364, -1.777383, 1, 1, 1, 1, 1,
-0.5884728, 0.06656438, -1.113586, 1, 1, 1, 1, 1,
-0.5875468, 0.7076215, -1.499468, 1, 1, 1, 1, 1,
-0.5866895, -0.6552133, -2.866896, 1, 1, 1, 1, 1,
-0.58538, 0.35389, -1.290678, 0, 0, 1, 1, 1,
-0.5852662, -0.4683069, -2.752344, 1, 0, 0, 1, 1,
-0.5845058, 2.918456, -0.4794903, 1, 0, 0, 1, 1,
-0.5835379, 0.2502329, -2.389735, 1, 0, 0, 1, 1,
-0.5710949, -2.279856, -1.653611, 1, 0, 0, 1, 1,
-0.5697199, 0.3210991, -1.66859, 1, 0, 0, 1, 1,
-0.5689039, -0.7642453, -2.903081, 0, 0, 0, 1, 1,
-0.5582425, -0.8372158, -2.495387, 0, 0, 0, 1, 1,
-0.5578211, -0.4614267, -2.212736, 0, 0, 0, 1, 1,
-0.5575717, 0.7046821, 0.2577839, 0, 0, 0, 1, 1,
-0.557139, -1.11533, -2.961774, 0, 0, 0, 1, 1,
-0.5553073, -0.8737752, -1.995843, 0, 0, 0, 1, 1,
-0.5527903, 0.6012604, -1.6349, 0, 0, 0, 1, 1,
-0.5523137, 0.5603952, -0.9647868, 1, 1, 1, 1, 1,
-0.5516267, -1.130413, -4.76278, 1, 1, 1, 1, 1,
-0.5435019, -1.332158, -1.08923, 1, 1, 1, 1, 1,
-0.5430555, 1.575812, 0.03837864, 1, 1, 1, 1, 1,
-0.5424713, 0.06420366, -0.9155346, 1, 1, 1, 1, 1,
-0.537204, 0.6054234, -0.76063, 1, 1, 1, 1, 1,
-0.5366001, 0.9801821, 1.481423, 1, 1, 1, 1, 1,
-0.5347737, -0.5708402, -5.229234, 1, 1, 1, 1, 1,
-0.5344345, 0.004150954, -2.249435, 1, 1, 1, 1, 1,
-0.5326499, -1.149164, -4.02847, 1, 1, 1, 1, 1,
-0.5271743, -1.056818, -3.093501, 1, 1, 1, 1, 1,
-0.5247772, 0.216585, -0.9018178, 1, 1, 1, 1, 1,
-0.5225566, 1.513895, -1.628888, 1, 1, 1, 1, 1,
-0.5200912, 0.1854765, -0.4340459, 1, 1, 1, 1, 1,
-0.5150528, -0.08691978, -4.252684, 1, 1, 1, 1, 1,
-0.5149469, -0.5812095, -3.323018, 0, 0, 1, 1, 1,
-0.5128155, -1.172552, -2.494229, 1, 0, 0, 1, 1,
-0.5123723, -0.1385508, -0.7865255, 1, 0, 0, 1, 1,
-0.5117436, -1.416878, -2.165211, 1, 0, 0, 1, 1,
-0.5107059, -1.05192, -4.829496, 1, 0, 0, 1, 1,
-0.5069748, 0.7550254, 0.06442501, 1, 0, 0, 1, 1,
-0.5038819, 0.6796457, -2.793344, 0, 0, 0, 1, 1,
-0.4970796, -0.1702993, -2.364277, 0, 0, 0, 1, 1,
-0.4968838, 0.1105735, -0.5777817, 0, 0, 0, 1, 1,
-0.4938909, 0.2813203, -0.9481346, 0, 0, 0, 1, 1,
-0.4902814, -0.03729523, -0.5874788, 0, 0, 0, 1, 1,
-0.4865785, -2.769211, -4.481712, 0, 0, 0, 1, 1,
-0.4820623, -0.2822718, -0.7634966, 0, 0, 0, 1, 1,
-0.4810651, 0.7090074, -0.2207101, 1, 1, 1, 1, 1,
-0.475863, 0.5284896, -0.4335698, 1, 1, 1, 1, 1,
-0.4742436, 0.4005075, -0.05541119, 1, 1, 1, 1, 1,
-0.4740885, -0.3490611, -4.471029, 1, 1, 1, 1, 1,
-0.4694007, 0.07946274, -1.206162, 1, 1, 1, 1, 1,
-0.4686907, -0.8614922, -2.047672, 1, 1, 1, 1, 1,
-0.4680462, -0.7298672, -1.316031, 1, 1, 1, 1, 1,
-0.4672163, 1.277914, -0.09419538, 1, 1, 1, 1, 1,
-0.4636029, -0.9910356, -0.4867598, 1, 1, 1, 1, 1,
-0.4590948, 0.09658691, -1.918347, 1, 1, 1, 1, 1,
-0.4524855, 0.9115447, -1.017947, 1, 1, 1, 1, 1,
-0.4502178, -1.512404, -4.327533, 1, 1, 1, 1, 1,
-0.4484441, -0.6369616, -1.23745, 1, 1, 1, 1, 1,
-0.4471571, -1.194887, -1.652797, 1, 1, 1, 1, 1,
-0.4460262, -0.5794204, -3.991481, 1, 1, 1, 1, 1,
-0.4451849, 0.8113534, -2.156301, 0, 0, 1, 1, 1,
-0.4410091, 0.08396353, -1.158254, 1, 0, 0, 1, 1,
-0.4409723, -0.2721819, -2.411965, 1, 0, 0, 1, 1,
-0.437894, -0.3311407, -2.185257, 1, 0, 0, 1, 1,
-0.4347696, -0.1014699, -1.214685, 1, 0, 0, 1, 1,
-0.4344239, -0.7989901, -2.830879, 1, 0, 0, 1, 1,
-0.4308905, 0.7321154, 0.5695986, 0, 0, 0, 1, 1,
-0.4285029, -0.6213678, -3.952548, 0, 0, 0, 1, 1,
-0.425321, 0.7446818, -1.585037, 0, 0, 0, 1, 1,
-0.4236403, -0.9862722, -2.575711, 0, 0, 0, 1, 1,
-0.4222553, -1.470617, -2.842455, 0, 0, 0, 1, 1,
-0.4130161, -0.417219, -0.7908266, 0, 0, 0, 1, 1,
-0.411114, 2.365928, -0.6111732, 0, 0, 0, 1, 1,
-0.4058505, -1.377465, -2.366082, 1, 1, 1, 1, 1,
-0.4058363, 0.1733671, -1.207582, 1, 1, 1, 1, 1,
-0.4046456, -1.596572, -2.048708, 1, 1, 1, 1, 1,
-0.4040688, -0.531768, -4.57259, 1, 1, 1, 1, 1,
-0.4031095, 0.9131871, 0.4615597, 1, 1, 1, 1, 1,
-0.3974312, 1.036865, -0.8572128, 1, 1, 1, 1, 1,
-0.3938968, -0.1336927, -0.02698192, 1, 1, 1, 1, 1,
-0.3930572, -0.6243935, -2.5848, 1, 1, 1, 1, 1,
-0.3930192, 0.6107615, -2.295891, 1, 1, 1, 1, 1,
-0.3852715, -1.14609, -3.044817, 1, 1, 1, 1, 1,
-0.3818858, -1.158241, -2.808088, 1, 1, 1, 1, 1,
-0.3808948, 0.9491083, -0.3390747, 1, 1, 1, 1, 1,
-0.3785184, 0.7286971, -0.5134086, 1, 1, 1, 1, 1,
-0.374039, 1.266329, -0.4227176, 1, 1, 1, 1, 1,
-0.3693039, -0.2006309, -2.202596, 1, 1, 1, 1, 1,
-0.3690792, 0.08657154, -1.341712, 0, 0, 1, 1, 1,
-0.3648509, -0.8181947, -3.314461, 1, 0, 0, 1, 1,
-0.3633721, -0.5976745, -2.121147, 1, 0, 0, 1, 1,
-0.3616056, -0.9775068, -3.077473, 1, 0, 0, 1, 1,
-0.3603542, -0.4256655, -1.370239, 1, 0, 0, 1, 1,
-0.357019, -0.5766733, -3.558717, 1, 0, 0, 1, 1,
-0.35557, -1.47408, -4.403063, 0, 0, 0, 1, 1,
-0.3510273, -0.2153945, -1.961798, 0, 0, 0, 1, 1,
-0.3504521, -0.9426889, -3.236732, 0, 0, 0, 1, 1,
-0.3458742, 1.05256, -0.4884577, 0, 0, 0, 1, 1,
-0.3453472, -1.876266, -2.935929, 0, 0, 0, 1, 1,
-0.3448404, -0.3633896, -2.975077, 0, 0, 0, 1, 1,
-0.344605, 0.5291499, -0.06662989, 0, 0, 0, 1, 1,
-0.3443491, 0.4481647, -1.136053, 1, 1, 1, 1, 1,
-0.3428016, 0.3974855, -1.472792, 1, 1, 1, 1, 1,
-0.3414602, 0.6512225, -1.893538, 1, 1, 1, 1, 1,
-0.3406899, -0.3075007, -3.588282, 1, 1, 1, 1, 1,
-0.3348661, -0.5045436, -2.346898, 1, 1, 1, 1, 1,
-0.3342326, 1.567229, 0.9293526, 1, 1, 1, 1, 1,
-0.3341273, -2.39546, -2.011493, 1, 1, 1, 1, 1,
-0.3339515, 0.1337037, -1.589795, 1, 1, 1, 1, 1,
-0.3334042, -0.3502561, -3.559403, 1, 1, 1, 1, 1,
-0.3293009, -0.4021694, -1.519182, 1, 1, 1, 1, 1,
-0.3277866, 1.74828, -0.8308731, 1, 1, 1, 1, 1,
-0.324967, 0.2027851, -1.317956, 1, 1, 1, 1, 1,
-0.3240875, -0.6876217, -2.325225, 1, 1, 1, 1, 1,
-0.319829, 0.1741395, -0.1071759, 1, 1, 1, 1, 1,
-0.3186487, -0.326303, -0.6116176, 1, 1, 1, 1, 1,
-0.3169001, 0.7812715, -1.374376, 0, 0, 1, 1, 1,
-0.3165988, -0.09842856, -3.015321, 1, 0, 0, 1, 1,
-0.3149661, -0.6519656, -3.39876, 1, 0, 0, 1, 1,
-0.3108441, -0.1272546, 0.8903069, 1, 0, 0, 1, 1,
-0.3098786, 0.3642042, -0.7808527, 1, 0, 0, 1, 1,
-0.3067429, 0.2914884, -0.6898026, 1, 0, 0, 1, 1,
-0.3052504, 0.1299574, 0.5366471, 0, 0, 0, 1, 1,
-0.304134, -1.011405, -3.286703, 0, 0, 0, 1, 1,
-0.2964551, -0.3540874, -1.892013, 0, 0, 0, 1, 1,
-0.2908394, -0.2941286, -2.799251, 0, 0, 0, 1, 1,
-0.2796516, -0.4580929, -1.553904, 0, 0, 0, 1, 1,
-0.2694886, 0.2825003, -0.7106614, 0, 0, 0, 1, 1,
-0.2682895, 0.1996633, -0.7290327, 0, 0, 0, 1, 1,
-0.2656931, 0.6292461, -0.7965531, 1, 1, 1, 1, 1,
-0.2641736, 0.7553818, 0.3302194, 1, 1, 1, 1, 1,
-0.2640058, -0.4512052, -3.302247, 1, 1, 1, 1, 1,
-0.261343, -0.5601072, -2.810643, 1, 1, 1, 1, 1,
-0.2603908, -1.310779, -4.251019, 1, 1, 1, 1, 1,
-0.2577817, -0.6195718, -2.992046, 1, 1, 1, 1, 1,
-0.2571899, 1.66574, -1.107175, 1, 1, 1, 1, 1,
-0.2534803, 0.3937669, 0.0261248, 1, 1, 1, 1, 1,
-0.2504469, 1.739904, -0.9552503, 1, 1, 1, 1, 1,
-0.2502047, -3.481598, -3.552415, 1, 1, 1, 1, 1,
-0.2496891, 1.00483, -1.209767, 1, 1, 1, 1, 1,
-0.2481334, 0.4198802, -0.726266, 1, 1, 1, 1, 1,
-0.2372991, 0.2839915, -1.607201, 1, 1, 1, 1, 1,
-0.2372798, -0.9606372, -2.869982, 1, 1, 1, 1, 1,
-0.2370271, -0.5409483, -3.327793, 1, 1, 1, 1, 1,
-0.2307826, -0.9719009, -3.854464, 0, 0, 1, 1, 1,
-0.2239225, 0.6126279, 2.125028, 1, 0, 0, 1, 1,
-0.2206927, 1.815756, -1.432081, 1, 0, 0, 1, 1,
-0.2111834, 0.7018192, -1.715317, 1, 0, 0, 1, 1,
-0.2029887, 0.4163559, 1.71079, 1, 0, 0, 1, 1,
-0.1983321, 0.2767712, 1.219168, 1, 0, 0, 1, 1,
-0.1971036, -0.1501246, -3.620799, 0, 0, 0, 1, 1,
-0.1951064, -1.306743, -3.587769, 0, 0, 0, 1, 1,
-0.1936537, 1.208904, -1.398993, 0, 0, 0, 1, 1,
-0.1914218, -0.1189828, -1.138651, 0, 0, 0, 1, 1,
-0.1884178, 1.813285, -0.7325809, 0, 0, 0, 1, 1,
-0.1848522, 0.7732285, 0.8411656, 0, 0, 0, 1, 1,
-0.1841751, 0.7507112, -1.613037, 0, 0, 0, 1, 1,
-0.1775654, -1.201465, -3.337763, 1, 1, 1, 1, 1,
-0.1771388, 0.8614015, 0.03362094, 1, 1, 1, 1, 1,
-0.1677287, -0.6046529, -2.72441, 1, 1, 1, 1, 1,
-0.1648635, 1.624249, -1.639384, 1, 1, 1, 1, 1,
-0.1573205, -0.8356187, -3.702114, 1, 1, 1, 1, 1,
-0.1548999, -0.2878531, -2.067929, 1, 1, 1, 1, 1,
-0.1536947, 0.08272701, -0.8520935, 1, 1, 1, 1, 1,
-0.1471788, 0.2867903, -0.6672988, 1, 1, 1, 1, 1,
-0.1436069, 1.559564, -1.576725, 1, 1, 1, 1, 1,
-0.1396302, 0.6983877, 1.749248, 1, 1, 1, 1, 1,
-0.1382568, -0.5286728, -2.19201, 1, 1, 1, 1, 1,
-0.1306951, -1.503169, -3.310745, 1, 1, 1, 1, 1,
-0.1262499, -0.7581326, -2.40916, 1, 1, 1, 1, 1,
-0.1209383, 1.475977, -0.232444, 1, 1, 1, 1, 1,
-0.119854, 0.9207189, 0.4542286, 1, 1, 1, 1, 1,
-0.1173915, -0.1904794, -2.718552, 0, 0, 1, 1, 1,
-0.1171378, 1.378724, 1.160058, 1, 0, 0, 1, 1,
-0.114513, 0.2376983, 0.3118718, 1, 0, 0, 1, 1,
-0.1115978, 0.1376689, -0.9232125, 1, 0, 0, 1, 1,
-0.1113452, 0.1454226, -0.2083148, 1, 0, 0, 1, 1,
-0.1080246, 0.7400118, -0.8061143, 1, 0, 0, 1, 1,
-0.1073905, 0.3765448, -1.317128, 0, 0, 0, 1, 1,
-0.1050206, -1.296114, -3.429433, 0, 0, 0, 1, 1,
-0.1001123, 1.651755, -1.89485, 0, 0, 0, 1, 1,
-0.09829705, -0.9824513, -3.222505, 0, 0, 0, 1, 1,
-0.09803288, 0.5739201, -1.982599, 0, 0, 0, 1, 1,
-0.09421138, 0.6976474, -1.55267, 0, 0, 0, 1, 1,
-0.0869154, 0.2179607, 0.1566607, 0, 0, 0, 1, 1,
-0.08610959, 0.9461924, 1.291038, 1, 1, 1, 1, 1,
-0.08437619, -1.384601, -3.831357, 1, 1, 1, 1, 1,
-0.08399525, -0.3859912, -1.693454, 1, 1, 1, 1, 1,
-0.0794636, 0.2474587, 0.2833825, 1, 1, 1, 1, 1,
-0.07874715, -2.07371, -2.459402, 1, 1, 1, 1, 1,
-0.07356093, -1.819872, -3.132571, 1, 1, 1, 1, 1,
-0.07313848, 0.2905079, 1.385475, 1, 1, 1, 1, 1,
-0.07109973, 1.349614, -0.8903899, 1, 1, 1, 1, 1,
-0.06918253, -1.164144, -3.386068, 1, 1, 1, 1, 1,
-0.06901336, -0.8372858, -2.490949, 1, 1, 1, 1, 1,
-0.06820347, 1.453799, 1.868092, 1, 1, 1, 1, 1,
-0.06488638, 1.927932, -1.485168, 1, 1, 1, 1, 1,
-0.06307329, -1.021313, -2.294033, 1, 1, 1, 1, 1,
-0.06287728, 1.376184, -1.69219, 1, 1, 1, 1, 1,
-0.06256499, 0.1202299, 0.1508155, 1, 1, 1, 1, 1,
-0.05997503, -0.5834212, -2.666218, 0, 0, 1, 1, 1,
-0.04948335, 1.08645, 0.8475235, 1, 0, 0, 1, 1,
-0.04839535, 0.01055762, 0.0319519, 1, 0, 0, 1, 1,
-0.04364949, -0.4752534, -3.776559, 1, 0, 0, 1, 1,
-0.04294004, 0.5617415, 1.82437, 1, 0, 0, 1, 1,
-0.04069978, 0.9308653, 0.3506888, 1, 0, 0, 1, 1,
-0.03871135, 0.6308811, 1.478303, 0, 0, 0, 1, 1,
-0.03860679, 0.5881786, 1.910168, 0, 0, 0, 1, 1,
-0.03858702, -0.8175473, -1.443591, 0, 0, 0, 1, 1,
-0.03564676, 1.121843, 1.300135, 0, 0, 0, 1, 1,
-0.03344698, 0.7408878, -0.01274426, 0, 0, 0, 1, 1,
-0.03165469, 0.20094, -0.3085464, 0, 0, 0, 1, 1,
-0.03151956, 0.807176, 0.8935549, 0, 0, 0, 1, 1,
-0.02747253, 0.5117059, -0.02025423, 1, 1, 1, 1, 1,
-0.02685853, -1.095848, -4.357183, 1, 1, 1, 1, 1,
-0.024439, 1.265963, -0.243498, 1, 1, 1, 1, 1,
-0.02295038, 1.419412, 1.353574, 1, 1, 1, 1, 1,
-0.01900981, 0.4892735, -0.2850697, 1, 1, 1, 1, 1,
-0.01760253, -0.05470259, -2.487253, 1, 1, 1, 1, 1,
-0.01759957, -0.7868617, -2.589912, 1, 1, 1, 1, 1,
-0.01753371, -0.5109491, -3.439456, 1, 1, 1, 1, 1,
-0.01495532, -1.215572, -3.642482, 1, 1, 1, 1, 1,
-0.01318684, -1.469564, -2.676371, 1, 1, 1, 1, 1,
-0.01098597, 0.6902832, 0.5395427, 1, 1, 1, 1, 1,
-0.008840441, -0.8966516, -2.625412, 1, 1, 1, 1, 1,
-0.007291238, -0.7585505, -3.936692, 1, 1, 1, 1, 1,
-0.005609915, 0.3099171, 0.8494418, 1, 1, 1, 1, 1,
-0.002620963, -0.5793441, -2.948755, 1, 1, 1, 1, 1,
-0.001792786, -1.442929, -2.900493, 0, 0, 1, 1, 1,
0.002268181, -0.9933817, 3.107303, 1, 0, 0, 1, 1,
0.01047825, -0.4103131, 4.093782, 1, 0, 0, 1, 1,
0.01310714, 0.05824703, -0.4541477, 1, 0, 0, 1, 1,
0.01365109, 1.827168, 1.0404, 1, 0, 0, 1, 1,
0.01621494, 1.583197, -0.255406, 1, 0, 0, 1, 1,
0.02118627, 0.5385937, 3.468417, 0, 0, 0, 1, 1,
0.02755379, -0.2630892, 2.595534, 0, 0, 0, 1, 1,
0.03252175, -1.409522, 3.542106, 0, 0, 0, 1, 1,
0.0381705, 1.128581, 2.673264, 0, 0, 0, 1, 1,
0.04149238, 0.9925034, -0.4575011, 0, 0, 0, 1, 1,
0.04153863, 0.7445253, 0.4681436, 0, 0, 0, 1, 1,
0.04363483, -0.8377237, 3.968837, 0, 0, 0, 1, 1,
0.0438837, -0.5066476, 3.801388, 1, 1, 1, 1, 1,
0.04448029, 2.378321, 1.696181, 1, 1, 1, 1, 1,
0.04831654, 1.510746, -0.02166147, 1, 1, 1, 1, 1,
0.05164782, 0.19116, 0.6866603, 1, 1, 1, 1, 1,
0.05547566, -0.2779772, 1.784962, 1, 1, 1, 1, 1,
0.05845062, 0.6283048, 2.005674, 1, 1, 1, 1, 1,
0.0610042, -0.7063652, 2.386365, 1, 1, 1, 1, 1,
0.06228231, 0.4745603, 0.3286828, 1, 1, 1, 1, 1,
0.06361306, -0.2575416, 1.455684, 1, 1, 1, 1, 1,
0.06366458, -1.163029, 3.053957, 1, 1, 1, 1, 1,
0.06657106, -0.942227, 2.403256, 1, 1, 1, 1, 1,
0.08201959, 0.4314143, 2.032359, 1, 1, 1, 1, 1,
0.08218876, -0.03670434, 0.6711072, 1, 1, 1, 1, 1,
0.08560715, -1.036717, 3.401497, 1, 1, 1, 1, 1,
0.08569861, -0.5942311, 2.680401, 1, 1, 1, 1, 1,
0.09496068, 0.09040897, 0.3456373, 0, 0, 1, 1, 1,
0.0952948, 0.3764357, 1.528295, 1, 0, 0, 1, 1,
0.09679408, -0.05324519, 2.699012, 1, 0, 0, 1, 1,
0.09782615, -0.003567522, 3.267399, 1, 0, 0, 1, 1,
0.1002908, 0.4179275, 0.3889295, 1, 0, 0, 1, 1,
0.1012817, -0.2543559, 2.253806, 1, 0, 0, 1, 1,
0.1043744, -1.677828, 1.782059, 0, 0, 0, 1, 1,
0.1047973, 0.4631862, 0.9429758, 0, 0, 0, 1, 1,
0.1071838, -1.470996, 2.656608, 0, 0, 0, 1, 1,
0.1130491, -0.02551991, 1.224293, 0, 0, 0, 1, 1,
0.1138382, 0.563043, -0.2544755, 0, 0, 0, 1, 1,
0.1138507, -0.5579278, 3.60653, 0, 0, 0, 1, 1,
0.1144858, -0.713052, 2.088614, 0, 0, 0, 1, 1,
0.1167642, -0.03531259, 1.583087, 1, 1, 1, 1, 1,
0.1242924, 1.191711, 0.09728979, 1, 1, 1, 1, 1,
0.1330064, -0.3916788, 2.176095, 1, 1, 1, 1, 1,
0.1365741, -0.2642632, 3.228798, 1, 1, 1, 1, 1,
0.136871, -0.6143273, 0.8767075, 1, 1, 1, 1, 1,
0.1391875, 0.2794424, -0.04397624, 1, 1, 1, 1, 1,
0.143378, 0.7944223, 0.003644936, 1, 1, 1, 1, 1,
0.1447941, -0.9879155, 2.819598, 1, 1, 1, 1, 1,
0.1484498, -2.663355, 2.246268, 1, 1, 1, 1, 1,
0.1487665, -1.46952, 4.198627, 1, 1, 1, 1, 1,
0.1525889, 0.1207118, 0.7060434, 1, 1, 1, 1, 1,
0.1631633, 1.806565, -0.5582179, 1, 1, 1, 1, 1,
0.1686135, -1.273271, 4.216967, 1, 1, 1, 1, 1,
0.169159, 1.568153, -0.3338249, 1, 1, 1, 1, 1,
0.1693479, -0.3902421, 4.471369, 1, 1, 1, 1, 1,
0.1699779, -0.07529648, 2.283896, 0, 0, 1, 1, 1,
0.1709652, -1.570322, 2.580164, 1, 0, 0, 1, 1,
0.1734695, 1.647991, -1.256797, 1, 0, 0, 1, 1,
0.1738683, -1.221278, 2.751234, 1, 0, 0, 1, 1,
0.1807795, -0.6564081, 4.254783, 1, 0, 0, 1, 1,
0.1829017, -0.2509978, 3.412242, 1, 0, 0, 1, 1,
0.183414, -0.1970206, 2.453702, 0, 0, 0, 1, 1,
0.1835396, 1.453233, -0.8086854, 0, 0, 0, 1, 1,
0.1837485, 0.9428223, -1.007762, 0, 0, 0, 1, 1,
0.1909579, 2.040973, -1.046947, 0, 0, 0, 1, 1,
0.1927505, 0.1072683, 0.8380397, 0, 0, 0, 1, 1,
0.1940511, 0.6394238, -1.767952, 0, 0, 0, 1, 1,
0.1958484, -0.20542, 2.147881, 0, 0, 0, 1, 1,
0.198362, 0.1444472, 0.6210021, 1, 1, 1, 1, 1,
0.2008179, -0.0284126, 1.731094, 1, 1, 1, 1, 1,
0.2090861, -0.8540052, 4.809539, 1, 1, 1, 1, 1,
0.2128724, 0.2466793, 0.7786345, 1, 1, 1, 1, 1,
0.2140603, -1.572743, 3.056138, 1, 1, 1, 1, 1,
0.2158328, 0.5655594, 0.5103454, 1, 1, 1, 1, 1,
0.2162304, 2.072579, 0.6367649, 1, 1, 1, 1, 1,
0.217577, 0.8249973, -0.2189867, 1, 1, 1, 1, 1,
0.2235473, -0.4006742, 4.143589, 1, 1, 1, 1, 1,
0.2276209, 1.268481, 1.223325, 1, 1, 1, 1, 1,
0.2298985, 0.3292535, -1.341472, 1, 1, 1, 1, 1,
0.2345561, -0.2481292, 2.261206, 1, 1, 1, 1, 1,
0.2397988, 1.634779, 1.427411, 1, 1, 1, 1, 1,
0.2467913, -0.4863304, 4.824046, 1, 1, 1, 1, 1,
0.2481021, 1.285343, 0.09803572, 1, 1, 1, 1, 1,
0.2492275, 0.7273434, -1.320865, 0, 0, 1, 1, 1,
0.2492506, -0.624298, 2.789913, 1, 0, 0, 1, 1,
0.2496954, 0.2332965, 0.8054016, 1, 0, 0, 1, 1,
0.2541963, 0.06729494, 0.8695357, 1, 0, 0, 1, 1,
0.2544841, 0.805845, 1.535636, 1, 0, 0, 1, 1,
0.2564536, 0.5417739, 0.5320377, 1, 0, 0, 1, 1,
0.256564, -0.1520872, 1.256462, 0, 0, 0, 1, 1,
0.2573148, 0.03408289, 1.236623, 0, 0, 0, 1, 1,
0.2607071, -0.5114169, 1.95025, 0, 0, 0, 1, 1,
0.261215, -1.722824, 3.426445, 0, 0, 0, 1, 1,
0.2629855, 0.2155833, 1.074242, 0, 0, 0, 1, 1,
0.264727, 0.1867614, 0.4261278, 0, 0, 0, 1, 1,
0.2740114, -1.122796, 2.492747, 0, 0, 0, 1, 1,
0.2751954, 0.2102725, 1.148015, 1, 1, 1, 1, 1,
0.2772678, -0.01689042, 0.7698655, 1, 1, 1, 1, 1,
0.2806005, -0.2459576, 1.717009, 1, 1, 1, 1, 1,
0.2806579, -0.3294587, 2.285021, 1, 1, 1, 1, 1,
0.2894426, 0.560467, -0.7588865, 1, 1, 1, 1, 1,
0.2899139, -0.6556513, 4.420404, 1, 1, 1, 1, 1,
0.2899635, 2.140552, 1.977499, 1, 1, 1, 1, 1,
0.2917466, -2.043908, 4.253057, 1, 1, 1, 1, 1,
0.294957, -0.2599206, 3.293803, 1, 1, 1, 1, 1,
0.2951421, -0.5249667, 2.800008, 1, 1, 1, 1, 1,
0.2953853, 1.543308, 0.16209, 1, 1, 1, 1, 1,
0.2984356, -0.1763659, 3.40184, 1, 1, 1, 1, 1,
0.2994923, 0.2295988, 2.057872, 1, 1, 1, 1, 1,
0.3055764, -1.634202, 2.87026, 1, 1, 1, 1, 1,
0.3198114, 0.8567765, -0.6854817, 1, 1, 1, 1, 1,
0.3209641, 1.679126, -1.995397, 0, 0, 1, 1, 1,
0.3230922, -0.4345018, 2.776616, 1, 0, 0, 1, 1,
0.3271338, -0.7798103, 2.953658, 1, 0, 0, 1, 1,
0.3284236, -0.5436359, 3.258487, 1, 0, 0, 1, 1,
0.3295125, 0.07949769, -0.3272792, 1, 0, 0, 1, 1,
0.3332607, -0.9833944, 4.208738, 1, 0, 0, 1, 1,
0.3429145, -1.184995, 2.448499, 0, 0, 0, 1, 1,
0.3435034, 0.05631659, 0.6173638, 0, 0, 0, 1, 1,
0.344712, 0.09733883, 1.279526, 0, 0, 0, 1, 1,
0.3448536, 1.777222, 0.5083526, 0, 0, 0, 1, 1,
0.3451185, 0.2310155, 0.5827046, 0, 0, 0, 1, 1,
0.3453746, -1.096302, 0.8420912, 0, 0, 0, 1, 1,
0.3458055, 2.109589, 1.100304, 0, 0, 0, 1, 1,
0.3485204, -0.7032445, 3.296507, 1, 1, 1, 1, 1,
0.3566916, 1.621427, 0.09448911, 1, 1, 1, 1, 1,
0.3572573, 0.1810414, 0.7935522, 1, 1, 1, 1, 1,
0.3606591, -0.400441, 2.321234, 1, 1, 1, 1, 1,
0.3633345, -0.852547, 4.127997, 1, 1, 1, 1, 1,
0.36397, -0.8538224, 2.341451, 1, 1, 1, 1, 1,
0.3709129, 0.6730717, 1.211073, 1, 1, 1, 1, 1,
0.3756688, -0.637056, 2.505991, 1, 1, 1, 1, 1,
0.3781408, -0.7382506, 1.916114, 1, 1, 1, 1, 1,
0.3805694, -0.6342999, 2.589456, 1, 1, 1, 1, 1,
0.3809349, 0.7737991, 0.8277321, 1, 1, 1, 1, 1,
0.3842591, 0.3892917, -0.2694568, 1, 1, 1, 1, 1,
0.3885724, 0.5131515, -0.1613072, 1, 1, 1, 1, 1,
0.3900322, -0.15623, 2.133529, 1, 1, 1, 1, 1,
0.3911969, -0.5579075, 3.680885, 1, 1, 1, 1, 1,
0.395606, 1.329115, 1.103276, 0, 0, 1, 1, 1,
0.4017758, 1.479498, 1.776413, 1, 0, 0, 1, 1,
0.4051137, 0.01417189, 3.01343, 1, 0, 0, 1, 1,
0.4061123, -0.08902273, 1.675156, 1, 0, 0, 1, 1,
0.4080468, -1.046622, 2.761614, 1, 0, 0, 1, 1,
0.4135847, -1.143228, 2.530758, 1, 0, 0, 1, 1,
0.4140491, 1.590551, 1.722481, 0, 0, 0, 1, 1,
0.4142728, -0.9060658, 2.408072, 0, 0, 0, 1, 1,
0.4191817, -0.4415596, 3.835761, 0, 0, 0, 1, 1,
0.4197424, -0.4726452, 2.104065, 0, 0, 0, 1, 1,
0.4205173, 0.5536708, 1.568615, 0, 0, 0, 1, 1,
0.4230548, 0.5887231, -0.6559983, 0, 0, 0, 1, 1,
0.4232906, -1.675491, 2.64182, 0, 0, 0, 1, 1,
0.4271607, -2.15672, 4.617194, 1, 1, 1, 1, 1,
0.4277125, 0.2660188, 1.469588, 1, 1, 1, 1, 1,
0.4287562, -1.867806, 2.728464, 1, 1, 1, 1, 1,
0.4299059, -0.09792224, 2.35271, 1, 1, 1, 1, 1,
0.4306864, 0.1073416, 0.0627251, 1, 1, 1, 1, 1,
0.4339916, 0.3589921, -0.5811487, 1, 1, 1, 1, 1,
0.4364883, 0.8089111, 2.354973, 1, 1, 1, 1, 1,
0.4392602, -0.3510278, 0.9747121, 1, 1, 1, 1, 1,
0.4397819, 0.2199195, -0.204825, 1, 1, 1, 1, 1,
0.4491534, -0.6941847, 0.3504746, 1, 1, 1, 1, 1,
0.4500115, -0.9330682, 2.938013, 1, 1, 1, 1, 1,
0.4509293, -0.2258656, 1.907774, 1, 1, 1, 1, 1,
0.4511647, -0.5579286, 2.791597, 1, 1, 1, 1, 1,
0.4552743, -0.08416508, 1.650464, 1, 1, 1, 1, 1,
0.4558494, 0.6316523, 1.666124, 1, 1, 1, 1, 1,
0.4558506, 0.9380221, 0.6161641, 0, 0, 1, 1, 1,
0.4581369, -0.03909001, 1.80694, 1, 0, 0, 1, 1,
0.4624168, 1.303433, -1.852534, 1, 0, 0, 1, 1,
0.4718697, 0.8860022, 2.106841, 1, 0, 0, 1, 1,
0.4761514, 0.2325317, 1.331014, 1, 0, 0, 1, 1,
0.4771598, 3.32802, -1.417485, 1, 0, 0, 1, 1,
0.4776417, -0.1450961, 0.2197011, 0, 0, 0, 1, 1,
0.4782707, 0.9156845, 2.207923, 0, 0, 0, 1, 1,
0.4791916, 0.9943656, -0.4040034, 0, 0, 0, 1, 1,
0.4806146, -0.8567122, 5.808721, 0, 0, 0, 1, 1,
0.4835678, 1.101168, -0.6568935, 0, 0, 0, 1, 1,
0.4858088, -0.1934797, 2.811827, 0, 0, 0, 1, 1,
0.486906, -0.5167559, 2.904153, 0, 0, 0, 1, 1,
0.4910963, -0.4078351, -0.2806668, 1, 1, 1, 1, 1,
0.4926797, -0.1613502, 0.9137598, 1, 1, 1, 1, 1,
0.4950789, -0.0176653, 3.291832, 1, 1, 1, 1, 1,
0.495636, -0.2272361, 3.139407, 1, 1, 1, 1, 1,
0.502075, 0.1507162, 1.098262, 1, 1, 1, 1, 1,
0.5032327, -0.3433119, 2.481348, 1, 1, 1, 1, 1,
0.5082878, -2.035398, 3.421783, 1, 1, 1, 1, 1,
0.5158828, 0.6626074, -0.3748182, 1, 1, 1, 1, 1,
0.5173926, -0.5832245, 3.091676, 1, 1, 1, 1, 1,
0.5213271, -0.2153917, 1.573927, 1, 1, 1, 1, 1,
0.5245324, -0.3141442, 2.582783, 1, 1, 1, 1, 1,
0.5300087, 0.2001132, 2.032481, 1, 1, 1, 1, 1,
0.5327305, -1.964976, 1.939265, 1, 1, 1, 1, 1,
0.5333598, 0.01589506, 1.251296, 1, 1, 1, 1, 1,
0.5406746, 0.1982966, 1.549163, 1, 1, 1, 1, 1,
0.5456049, 1.51602, 0.112597, 0, 0, 1, 1, 1,
0.5478246, 0.1892365, 1.458956, 1, 0, 0, 1, 1,
0.5535622, 0.4988732, -1.464559, 1, 0, 0, 1, 1,
0.5552967, 0.3922768, 0.6980752, 1, 0, 0, 1, 1,
0.5574154, 1.393695, 1.272567, 1, 0, 0, 1, 1,
0.5579826, -0.5133876, 3.32986, 1, 0, 0, 1, 1,
0.5607485, -0.7462102, 2.160302, 0, 0, 0, 1, 1,
0.5628241, -1.491875, 1.989913, 0, 0, 0, 1, 1,
0.5683227, -0.5676119, 2.931842, 0, 0, 0, 1, 1,
0.568371, 1.311427, -0.8262118, 0, 0, 0, 1, 1,
0.5704048, 0.2554707, -0.1485006, 0, 0, 0, 1, 1,
0.5717083, 0.4818205, 1.281741, 0, 0, 0, 1, 1,
0.574275, -0.2127245, 1.358303, 0, 0, 0, 1, 1,
0.5763403, -0.02395944, 0.8799044, 1, 1, 1, 1, 1,
0.5810323, 0.1999104, 1.699094, 1, 1, 1, 1, 1,
0.5833515, -1.186961, 3.917754, 1, 1, 1, 1, 1,
0.5863266, -0.9062935, 3.006491, 1, 1, 1, 1, 1,
0.5902923, 0.497268, 0.8636044, 1, 1, 1, 1, 1,
0.5937098, 0.5851996, -1.706714, 1, 1, 1, 1, 1,
0.5964321, -3.299766, 4.012133, 1, 1, 1, 1, 1,
0.5970007, 0.7505336, 1.082567, 1, 1, 1, 1, 1,
0.6007605, 0.4210713, 1.901777, 1, 1, 1, 1, 1,
0.6063308, 0.04991713, 1.368152, 1, 1, 1, 1, 1,
0.6089258, 1.383827, -0.7004717, 1, 1, 1, 1, 1,
0.6128666, 2.274474, -0.4339972, 1, 1, 1, 1, 1,
0.6185209, 1.971131, 0.491404, 1, 1, 1, 1, 1,
0.6186337, 1.385872, -1.983096, 1, 1, 1, 1, 1,
0.6205884, -1.510127, 3.538471, 1, 1, 1, 1, 1,
0.6303796, -1.108894, 2.602051, 0, 0, 1, 1, 1,
0.6319531, 0.3706051, -1.27805, 1, 0, 0, 1, 1,
0.6321546, -0.9557942, 2.06155, 1, 0, 0, 1, 1,
0.6354463, 0.1720027, 2.370067, 1, 0, 0, 1, 1,
0.6411183, 0.654522, 2.226682, 1, 0, 0, 1, 1,
0.6415427, 1.92585, 2.58768, 1, 0, 0, 1, 1,
0.6474534, -0.810378, 3.043032, 0, 0, 0, 1, 1,
0.6519769, -1.272439, 2.175573, 0, 0, 0, 1, 1,
0.6521153, 0.5112016, -0.08788925, 0, 0, 0, 1, 1,
0.6547205, -0.2639314, 1.868136, 0, 0, 0, 1, 1,
0.6592571, -0.7649841, 2.190807, 0, 0, 0, 1, 1,
0.6637648, -0.522341, 2.262459, 0, 0, 0, 1, 1,
0.667573, 0.8138238, 0.5700044, 0, 0, 0, 1, 1,
0.670463, 0.4529066, 0.3439641, 1, 1, 1, 1, 1,
0.6770663, -0.2702197, 1.526536, 1, 1, 1, 1, 1,
0.6828798, 2.22445, 0.68443, 1, 1, 1, 1, 1,
0.6848774, -0.03654248, 2.03551, 1, 1, 1, 1, 1,
0.6873512, 0.502953, 0.7172983, 1, 1, 1, 1, 1,
0.6905204, 0.3252103, 2.01367, 1, 1, 1, 1, 1,
0.6938645, -0.08247111, -0.06713206, 1, 1, 1, 1, 1,
0.6979762, -0.9394368, 3.096316, 1, 1, 1, 1, 1,
0.6997241, 1.674495, -0.04523227, 1, 1, 1, 1, 1,
0.7042334, -0.8046976, 3.531547, 1, 1, 1, 1, 1,
0.7051632, 2.306535, 1.897166, 1, 1, 1, 1, 1,
0.706108, -0.5066567, 1.766426, 1, 1, 1, 1, 1,
0.710459, -0.2708804, 1.206496, 1, 1, 1, 1, 1,
0.7149498, -1.352165, 3.710234, 1, 1, 1, 1, 1,
0.7177197, 1.242497, -0.8832304, 1, 1, 1, 1, 1,
0.7181321, 1.481098, 0.1319198, 0, 0, 1, 1, 1,
0.7187466, -0.3360882, 1.467114, 1, 0, 0, 1, 1,
0.7218787, 2.221285, -0.01576042, 1, 0, 0, 1, 1,
0.7226516, 1.364777, -0.9831673, 1, 0, 0, 1, 1,
0.7240795, -0.5385861, 1.963938, 1, 0, 0, 1, 1,
0.7256483, -1.569931, 2.924471, 1, 0, 0, 1, 1,
0.72782, 0.9598415, -0.9981224, 0, 0, 0, 1, 1,
0.7281562, 0.4112445, 2.565578, 0, 0, 0, 1, 1,
0.7334082, 1.369149, 0.5465035, 0, 0, 0, 1, 1,
0.7414566, -0.4009253, 3.746448, 0, 0, 0, 1, 1,
0.7498619, -0.5177103, 2.685034, 0, 0, 0, 1, 1,
0.7510571, 1.609151, 0.445521, 0, 0, 0, 1, 1,
0.751191, -0.3655108, 2.635675, 0, 0, 0, 1, 1,
0.7612677, 0.6318527, -2.053738, 1, 1, 1, 1, 1,
0.7616942, 1.672495, 1.230541, 1, 1, 1, 1, 1,
0.7622555, -0.3927616, 2.342506, 1, 1, 1, 1, 1,
0.7650924, 0.06069237, 0.3758275, 1, 1, 1, 1, 1,
0.7734169, -2.358666, 3.13232, 1, 1, 1, 1, 1,
0.7756234, 1.382478, -0.1551835, 1, 1, 1, 1, 1,
0.7787278, -1.721294, 1.800462, 1, 1, 1, 1, 1,
0.7789605, 0.5643615, 2.359759, 1, 1, 1, 1, 1,
0.7802103, 0.249579, 1.818056, 1, 1, 1, 1, 1,
0.7845403, 1.310476, 0.5650876, 1, 1, 1, 1, 1,
0.7872464, 0.4594787, 0.02494148, 1, 1, 1, 1, 1,
0.7906166, -0.8332288, 1.840247, 1, 1, 1, 1, 1,
0.7939158, 0.2842729, 0.8889484, 1, 1, 1, 1, 1,
0.7942765, -0.1663494, 3.449553, 1, 1, 1, 1, 1,
0.7955663, -0.2272488, 2.507856, 1, 1, 1, 1, 1,
0.8006768, -0.01340438, 1.67252, 0, 0, 1, 1, 1,
0.8047199, -1.937921, 2.50778, 1, 0, 0, 1, 1,
0.8084905, -1.542984, 2.989944, 1, 0, 0, 1, 1,
0.8133615, 0.5679964, 2.084335, 1, 0, 0, 1, 1,
0.8165894, 1.138333, -0.08158389, 1, 0, 0, 1, 1,
0.8207373, -1.06792, 1.609318, 1, 0, 0, 1, 1,
0.8213952, 1.525947, 1.027079, 0, 0, 0, 1, 1,
0.8218432, -0.8658403, 2.091031, 0, 0, 0, 1, 1,
0.8246883, 0.3236792, 2.307573, 0, 0, 0, 1, 1,
0.8274512, -0.385524, 2.100304, 0, 0, 0, 1, 1,
0.833809, -1.500831, 3.699085, 0, 0, 0, 1, 1,
0.8344804, 0.1579818, 2.424227, 0, 0, 0, 1, 1,
0.835516, -0.03152707, 4.217905, 0, 0, 0, 1, 1,
0.8388895, -0.3117515, 0.2796347, 1, 1, 1, 1, 1,
0.8423937, -0.1051002, 0.6886063, 1, 1, 1, 1, 1,
0.8512158, -1.038243, 0.5944171, 1, 1, 1, 1, 1,
0.8530641, 1.729436, 0.7515913, 1, 1, 1, 1, 1,
0.8589182, -1.252676, 4.037715, 1, 1, 1, 1, 1,
0.8601489, 1.068642, 1.481797, 1, 1, 1, 1, 1,
0.8602194, 0.6595336, 0.1880851, 1, 1, 1, 1, 1,
0.8683679, -0.1082772, 1.021309, 1, 1, 1, 1, 1,
0.8703827, -0.2159101, 1.861534, 1, 1, 1, 1, 1,
0.8757316, 1.272605, -0.7217333, 1, 1, 1, 1, 1,
0.8790327, -0.7490048, 2.592882, 1, 1, 1, 1, 1,
0.8828809, 1.860854, -0.3570212, 1, 1, 1, 1, 1,
0.883158, -0.1996315, 1.870082, 1, 1, 1, 1, 1,
0.8838034, -0.7092807, 2.445163, 1, 1, 1, 1, 1,
0.8867257, 0.2060591, 0.9521342, 1, 1, 1, 1, 1,
0.891123, -1.34968, 1.964083, 0, 0, 1, 1, 1,
0.8945698, -0.7529941, 2.63353, 1, 0, 0, 1, 1,
0.8952523, -0.1114978, 3.057943, 1, 0, 0, 1, 1,
0.8977652, 1.457187, 0.9309265, 1, 0, 0, 1, 1,
0.8989733, -1.252095, 5.597322, 1, 0, 0, 1, 1,
0.90162, -1.85121, 2.87663, 1, 0, 0, 1, 1,
0.9029108, 0.04059395, -0.2738922, 0, 0, 0, 1, 1,
0.9038053, 1.189965, 3.04211, 0, 0, 0, 1, 1,
0.9062143, -0.4007724, -0.2950199, 0, 0, 0, 1, 1,
0.9072818, 0.2763326, 2.966307, 0, 0, 0, 1, 1,
0.9109374, -0.8298281, 1.826729, 0, 0, 0, 1, 1,
0.9112942, 0.3149411, 1.714956, 0, 0, 0, 1, 1,
0.9201046, -1.150673, 3.678908, 0, 0, 0, 1, 1,
0.9269412, 1.399099, 2.635556, 1, 1, 1, 1, 1,
0.9279591, -2.131887, 1.658116, 1, 1, 1, 1, 1,
0.9288521, 0.2942767, -1.178531, 1, 1, 1, 1, 1,
0.9316749, -1.573075, 2.359533, 1, 1, 1, 1, 1,
0.9343048, -0.817998, 1.086643, 1, 1, 1, 1, 1,
0.9528286, 0.9994757, 0.9848394, 1, 1, 1, 1, 1,
0.9566943, 0.5530328, -0.4463842, 1, 1, 1, 1, 1,
0.9575238, -1.242387, 2.220201, 1, 1, 1, 1, 1,
0.9650596, 1.373809, -0.6768984, 1, 1, 1, 1, 1,
0.9764827, 0.985029, -0.4074397, 1, 1, 1, 1, 1,
0.9780593, 0.6744534, -0.3011562, 1, 1, 1, 1, 1,
0.983515, -0.8450986, 2.26181, 1, 1, 1, 1, 1,
0.9844342, -0.06307832, 1.136088, 1, 1, 1, 1, 1,
0.9844888, 1.275948, 1.201254, 1, 1, 1, 1, 1,
0.9858049, 0.68406, 0.08199439, 1, 1, 1, 1, 1,
0.9987669, 1.63949, -0.0323233, 0, 0, 1, 1, 1,
1.000389, 0.3146926, -0.5169784, 1, 0, 0, 1, 1,
1.003197, -0.5447125, 1.806488, 1, 0, 0, 1, 1,
1.006256, 0.1406907, 0.5447155, 1, 0, 0, 1, 1,
1.014864, 0.5332254, 1.600184, 1, 0, 0, 1, 1,
1.017474, -1.150719, 1.600062, 1, 0, 0, 1, 1,
1.019152, 1.42991, 3.126929, 0, 0, 0, 1, 1,
1.025264, -2.458263, 2.345575, 0, 0, 0, 1, 1,
1.027294, -1.187273, 2.503996, 0, 0, 0, 1, 1,
1.027691, -0.5540191, 3.555621, 0, 0, 0, 1, 1,
1.031991, -0.5348303, 2.025698, 0, 0, 0, 1, 1,
1.033629, 1.369974, 0.04901092, 0, 0, 0, 1, 1,
1.036921, 1.64257, -0.4526172, 0, 0, 0, 1, 1,
1.038454, -0.8960239, 3.085548, 1, 1, 1, 1, 1,
1.060867, 0.060457, 0.8936526, 1, 1, 1, 1, 1,
1.062059, -1.632, 1.845867, 1, 1, 1, 1, 1,
1.073322, -0.7280102, 3.653865, 1, 1, 1, 1, 1,
1.073956, -1.167333, 1.640056, 1, 1, 1, 1, 1,
1.075385, 0.1151255, 2.90145, 1, 1, 1, 1, 1,
1.078158, -0.6646618, 1.243646, 1, 1, 1, 1, 1,
1.079662, -0.8174767, 2.235633, 1, 1, 1, 1, 1,
1.092183, -0.7010165, 3.527158, 1, 1, 1, 1, 1,
1.095548, -0.3338611, 0.9632912, 1, 1, 1, 1, 1,
1.103793, 0.9522438, 1.976097, 1, 1, 1, 1, 1,
1.104265, -1.509928, 2.80845, 1, 1, 1, 1, 1,
1.104693, -1.47577, 2.753203, 1, 1, 1, 1, 1,
1.109642, 0.04449822, 1.429477, 1, 1, 1, 1, 1,
1.110346, -0.8374248, 2.765803, 1, 1, 1, 1, 1,
1.112525, 0.6920426, 0.6064064, 0, 0, 1, 1, 1,
1.11274, 0.1019334, 0.7369263, 1, 0, 0, 1, 1,
1.115141, -0.3340507, 2.986516, 1, 0, 0, 1, 1,
1.120216, -0.6843141, 1.843026, 1, 0, 0, 1, 1,
1.124075, 0.3134693, 0.351176, 1, 0, 0, 1, 1,
1.127793, 1.454752, -0.4744181, 1, 0, 0, 1, 1,
1.12894, 1.511004, 0.8531618, 0, 0, 0, 1, 1,
1.132479, -0.1607795, 3.30164, 0, 0, 0, 1, 1,
1.137111, 2.563834, 0.9819202, 0, 0, 0, 1, 1,
1.143079, 1.099702, 1.146464, 0, 0, 0, 1, 1,
1.15295, 0.3950078, 0.8013483, 0, 0, 0, 1, 1,
1.155841, -0.07834092, 1.815359, 0, 0, 0, 1, 1,
1.158389, 0.7875562, 2.31477, 0, 0, 0, 1, 1,
1.159856, -0.8175259, 1.556511, 1, 1, 1, 1, 1,
1.166504, -0.3922267, 1.36931, 1, 1, 1, 1, 1,
1.168164, 0.523185, 1.617378, 1, 1, 1, 1, 1,
1.168241, -1.000895, 3.912296, 1, 1, 1, 1, 1,
1.169183, -1.748568, 3.789368, 1, 1, 1, 1, 1,
1.172903, 1.318067, 0.3989543, 1, 1, 1, 1, 1,
1.174031, 0.1640911, 1.331463, 1, 1, 1, 1, 1,
1.178122, -1.732255, 0.569864, 1, 1, 1, 1, 1,
1.182817, 0.4962438, 0.7357013, 1, 1, 1, 1, 1,
1.185412, -0.9987089, 2.645212, 1, 1, 1, 1, 1,
1.195713, -0.8692998, 1.382425, 1, 1, 1, 1, 1,
1.196703, 0.2238978, 3.588945, 1, 1, 1, 1, 1,
1.199479, 1.33502, 1.855416, 1, 1, 1, 1, 1,
1.202587, 1.237504, -0.01726448, 1, 1, 1, 1, 1,
1.206024, 0.622352, 2.192156, 1, 1, 1, 1, 1,
1.208553, 1.89182, 0.7193412, 0, 0, 1, 1, 1,
1.211214, 0.6945875, -0.4572279, 1, 0, 0, 1, 1,
1.213249, -0.3899428, 2.46764, 1, 0, 0, 1, 1,
1.222987, -0.7899985, 0.4349126, 1, 0, 0, 1, 1,
1.229462, -0.6538346, 0.1806328, 1, 0, 0, 1, 1,
1.231966, 0.8037202, -0.558257, 1, 0, 0, 1, 1,
1.235693, -0.6002271, 1.663264, 0, 0, 0, 1, 1,
1.237644, -1.785041, 3.341669, 0, 0, 0, 1, 1,
1.245786, -0.6806053, 2.393434, 0, 0, 0, 1, 1,
1.246926, 0.3973792, 1.379982, 0, 0, 0, 1, 1,
1.248557, 0.9738916, 0.4629298, 0, 0, 0, 1, 1,
1.249068, 1.403761, 0.4882392, 0, 0, 0, 1, 1,
1.263644, 1.569719, 0.4849029, 0, 0, 0, 1, 1,
1.266364, -1.346066, 2.380215, 1, 1, 1, 1, 1,
1.272111, -1.129923, 2.280696, 1, 1, 1, 1, 1,
1.27345, -0.7042163, 3.661351, 1, 1, 1, 1, 1,
1.283755, -0.6118698, 1.539375, 1, 1, 1, 1, 1,
1.290133, -0.3939978, 3.087127, 1, 1, 1, 1, 1,
1.293154, -0.6976991, 1.939525, 1, 1, 1, 1, 1,
1.30067, -0.3690011, 0.9360747, 1, 1, 1, 1, 1,
1.302418, -2.322646, 2.506441, 1, 1, 1, 1, 1,
1.30584, -1.599789, 2.263514, 1, 1, 1, 1, 1,
1.307797, -1.391955, 3.589952, 1, 1, 1, 1, 1,
1.308385, 2.407284, 0.8853356, 1, 1, 1, 1, 1,
1.310499, -0.04065442, 4.152569, 1, 1, 1, 1, 1,
1.31082, 1.191651, 2.619016, 1, 1, 1, 1, 1,
1.315205, 0.9665362, 0.4034922, 1, 1, 1, 1, 1,
1.320821, 0.151078, 2.108848, 1, 1, 1, 1, 1,
1.325404, -0.5661327, 1.484471, 0, 0, 1, 1, 1,
1.325435, 0.09747306, 1.766278, 1, 0, 0, 1, 1,
1.325665, 0.8043993, 0.918358, 1, 0, 0, 1, 1,
1.331038, -1.796711, 2.307146, 1, 0, 0, 1, 1,
1.333964, 0.03918472, 0.732835, 1, 0, 0, 1, 1,
1.336974, -0.2942308, 3.778347, 1, 0, 0, 1, 1,
1.339077, -0.4131291, 3.209379, 0, 0, 0, 1, 1,
1.344846, -0.6825979, 2.297752, 0, 0, 0, 1, 1,
1.351612, 0.07878976, 2.906657, 0, 0, 0, 1, 1,
1.36162, 0.9375728, 0.871221, 0, 0, 0, 1, 1,
1.361784, -0.4941493, -0.2001806, 0, 0, 0, 1, 1,
1.378848, 0.1728626, 2.185133, 0, 0, 0, 1, 1,
1.384603, -0.2330354, 1.250851, 0, 0, 0, 1, 1,
1.39267, 2.111171, -1.647815, 1, 1, 1, 1, 1,
1.396938, 0.8767754, 0.8253203, 1, 1, 1, 1, 1,
1.416448, 0.2592538, 2.266294, 1, 1, 1, 1, 1,
1.419532, 0.9315402, 0.3874125, 1, 1, 1, 1, 1,
1.43296, -0.6074581, 1.506816, 1, 1, 1, 1, 1,
1.433382, 0.6318225, 1.19145, 1, 1, 1, 1, 1,
1.435853, -0.9538236, 3.499417, 1, 1, 1, 1, 1,
1.441809, -0.1823542, 2.025803, 1, 1, 1, 1, 1,
1.442914, -1.910725, 3.400191, 1, 1, 1, 1, 1,
1.445138, 0.03362564, 0.8287042, 1, 1, 1, 1, 1,
1.448586, 0.6484243, 1.026874, 1, 1, 1, 1, 1,
1.450826, -1.772198, 1.020614, 1, 1, 1, 1, 1,
1.461517, -0.2558697, 3.212955, 1, 1, 1, 1, 1,
1.469123, 0.6399896, 1.025927, 1, 1, 1, 1, 1,
1.474267, -0.2653979, 0.7222406, 1, 1, 1, 1, 1,
1.479175, 1.423592, 0.7696385, 0, 0, 1, 1, 1,
1.480506, 0.8468965, 0.8916858, 1, 0, 0, 1, 1,
1.491832, -0.1571617, 2.568301, 1, 0, 0, 1, 1,
1.501804, 0.5729315, 1.363688, 1, 0, 0, 1, 1,
1.50971, 0.4010568, 3.609403, 1, 0, 0, 1, 1,
1.526586, -1.054417, 2.610368, 1, 0, 0, 1, 1,
1.54806, 1.126967, 1.128027, 0, 0, 0, 1, 1,
1.549507, -2.262433, 3.156333, 0, 0, 0, 1, 1,
1.563846, 1.092576, 0.6172355, 0, 0, 0, 1, 1,
1.573547, 1.169947, 0.3951865, 0, 0, 0, 1, 1,
1.575371, 0.1680185, 1.134323, 0, 0, 0, 1, 1,
1.578015, -1.316717, 4.008148, 0, 0, 0, 1, 1,
1.580617, -0.7014084, 0.7932871, 0, 0, 0, 1, 1,
1.583186, 1.209943, -0.5335473, 1, 1, 1, 1, 1,
1.583344, 0.3721985, 1.714491, 1, 1, 1, 1, 1,
1.583546, -0.138119, 3.141996, 1, 1, 1, 1, 1,
1.585783, 0.5673836, -1.197968, 1, 1, 1, 1, 1,
1.586856, -0.5458426, 2.911232, 1, 1, 1, 1, 1,
1.598826, -1.183069, 3.532599, 1, 1, 1, 1, 1,
1.607341, 1.119814, -1.118084, 1, 1, 1, 1, 1,
1.616362, -0.8098987, 1.548519, 1, 1, 1, 1, 1,
1.631618, 0.4747225, 1.25354, 1, 1, 1, 1, 1,
1.639247, 0.6924862, -0.001955963, 1, 1, 1, 1, 1,
1.6561, 1.170405, 1.424017, 1, 1, 1, 1, 1,
1.656309, -0.6357791, 2.934334, 1, 1, 1, 1, 1,
1.673829, -0.7279388, 4.381217, 1, 1, 1, 1, 1,
1.684081, -0.4998561, 1.524601, 1, 1, 1, 1, 1,
1.688064, -0.7304431, 2.92233, 1, 1, 1, 1, 1,
1.716341, -0.6893048, 3.041767, 0, 0, 1, 1, 1,
1.739647, -0.7309681, 0.2135406, 1, 0, 0, 1, 1,
1.763406, -0.9348972, 3.052364, 1, 0, 0, 1, 1,
1.765298, -0.001874901, 2.378516, 1, 0, 0, 1, 1,
1.767994, 0.3718405, 0.5798852, 1, 0, 0, 1, 1,
1.772283, 1.592598, -0.6785443, 1, 0, 0, 1, 1,
1.776713, -0.1330467, 1.750679, 0, 0, 0, 1, 1,
1.831056, 0.955561, 1.129365, 0, 0, 0, 1, 1,
1.852563, -2.332332, 0.7274441, 0, 0, 0, 1, 1,
1.858263, 0.3101414, 0.2387868, 0, 0, 0, 1, 1,
1.902396, 0.8417956, -0.4449143, 0, 0, 0, 1, 1,
1.917258, -0.324076, 1.183679, 0, 0, 0, 1, 1,
1.920719, -0.2711781, 0.9525442, 0, 0, 0, 1, 1,
1.925269, -0.253988, 3.613631, 1, 1, 1, 1, 1,
1.935595, -1.011478, 2.032571, 1, 1, 1, 1, 1,
1.94324, 0.3676794, 3.545584, 1, 1, 1, 1, 1,
1.961725, 1.368915, 1.049932, 1, 1, 1, 1, 1,
1.987427, 0.9323061, -0.5139419, 1, 1, 1, 1, 1,
1.990544, 0.9109437, 2.000554, 1, 1, 1, 1, 1,
1.991235, -0.412226, 1.816689, 1, 1, 1, 1, 1,
1.991277, 0.4044999, 1.395545, 1, 1, 1, 1, 1,
1.995948, -1.548068, 2.243877, 1, 1, 1, 1, 1,
2.005999, 0.7807837, 1.018919, 1, 1, 1, 1, 1,
2.074137, -0.3384928, 3.273714, 1, 1, 1, 1, 1,
2.10842, 0.7879406, 0.3557522, 1, 1, 1, 1, 1,
2.108653, -0.8697177, 0.9885787, 1, 1, 1, 1, 1,
2.124545, -0.6917959, 1.937105, 1, 1, 1, 1, 1,
2.138256, 0.3056197, 1.833166, 1, 1, 1, 1, 1,
2.139896, -1.118322, 2.071518, 0, 0, 1, 1, 1,
2.157155, -0.8871668, 1.416145, 1, 0, 0, 1, 1,
2.157707, -0.3036971, 2.087088, 1, 0, 0, 1, 1,
2.22346, -1.848355, -0.3127333, 1, 0, 0, 1, 1,
2.37337, 0.4182025, 0.8509521, 1, 0, 0, 1, 1,
2.383933, -0.1572381, 2.156826, 1, 0, 0, 1, 1,
2.43544, 0.2073916, 1.502344, 0, 0, 0, 1, 1,
2.438594, -0.4920947, 2.982089, 0, 0, 0, 1, 1,
2.453269, 0.7386604, 2.217984, 0, 0, 0, 1, 1,
2.465212, 0.8161848, 0.4713967, 0, 0, 0, 1, 1,
2.500154, -0.2137747, 1.066783, 0, 0, 0, 1, 1,
2.568538, 0.4486478, 0.7608901, 0, 0, 0, 1, 1,
2.615663, -1.174554, 1.202962, 0, 0, 0, 1, 1,
2.835089, 0.5399286, 0.9969801, 1, 1, 1, 1, 1,
2.894014, -1.08848, 2.746849, 1, 1, 1, 1, 1,
2.917495, -1.047973, 3.543251, 1, 1, 1, 1, 1,
3.092086, 0.3505417, 1.011765, 1, 1, 1, 1, 1,
3.143424, -0.3854293, 2.125473, 1, 1, 1, 1, 1,
3.37951, 0.393601, 2.438543, 1, 1, 1, 1, 1,
3.561574, -0.2953903, 2.105859, 1, 1, 1, 1, 1
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
var radius = 9.975122;
var distance = 35.03719;
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
mvMatrix.translate( -0.05821013, 0.07678938, -0.2855856 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.03719);
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
