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
-2.805082, -0.01295276, -1.82111, 1, 0, 0, 1,
-2.749094, -0.7269378, -1.950922, 1, 0.007843138, 0, 1,
-2.628951, -0.4362246, -0.7550475, 1, 0.01176471, 0, 1,
-2.604062, -0.673344, -2.093808, 1, 0.01960784, 0, 1,
-2.543617, -0.2349782, -0.2220701, 1, 0.02352941, 0, 1,
-2.431295, -0.0223293, -0.7629069, 1, 0.03137255, 0, 1,
-2.385259, 0.7067019, -1.348058, 1, 0.03529412, 0, 1,
-2.371509, -0.1901774, -1.593516, 1, 0.04313726, 0, 1,
-2.282726, 0.3836088, -0.6896613, 1, 0.04705882, 0, 1,
-2.271819, 1.824454, 0.3644124, 1, 0.05490196, 0, 1,
-2.234082, -1.853567, -1.448538, 1, 0.05882353, 0, 1,
-2.201458, -0.461201, -1.676592, 1, 0.06666667, 0, 1,
-2.198796, 0.1937133, -1.137789, 1, 0.07058824, 0, 1,
-2.190063, 0.7082481, -1.490042, 1, 0.07843138, 0, 1,
-2.147729, 0.03221577, -0.8708472, 1, 0.08235294, 0, 1,
-2.143879, 0.8747599, -1.335843, 1, 0.09019608, 0, 1,
-2.133738, 0.6821129, -1.038348, 1, 0.09411765, 0, 1,
-2.086596, -0.1148614, -1.344526, 1, 0.1019608, 0, 1,
-2.049971, 2.34865, -2.275677, 1, 0.1098039, 0, 1,
-2.045537, -0.3057232, -2.982524, 1, 0.1137255, 0, 1,
-2.044901, 0.7261193, -1.276819, 1, 0.1215686, 0, 1,
-2.038419, 1.063964, -0.4667788, 1, 0.1254902, 0, 1,
-2.000494, -0.15406, -3.101259, 1, 0.1333333, 0, 1,
-1.999006, -1.369078, -2.019706, 1, 0.1372549, 0, 1,
-1.947755, 0.7741958, 0.8522047, 1, 0.145098, 0, 1,
-1.899165, -1.478495, -1.691506, 1, 0.1490196, 0, 1,
-1.89316, 0.8488433, -1.610694, 1, 0.1568628, 0, 1,
-1.880543, -1.970464, -0.5487097, 1, 0.1607843, 0, 1,
-1.875579, 1.518915, -0.09701587, 1, 0.1686275, 0, 1,
-1.865719, -1.284284, -0.5080455, 1, 0.172549, 0, 1,
-1.852121, 0.2444538, -2.45894, 1, 0.1803922, 0, 1,
-1.837082, 0.3213435, -0.1436509, 1, 0.1843137, 0, 1,
-1.83342, -0.2884624, -2.34795, 1, 0.1921569, 0, 1,
-1.823366, -0.3104928, -0.9421839, 1, 0.1960784, 0, 1,
-1.820667, -1.259961, -0.2113557, 1, 0.2039216, 0, 1,
-1.818907, -0.9209476, -1.232012, 1, 0.2117647, 0, 1,
-1.80271, 0.04807616, -2.680591, 1, 0.2156863, 0, 1,
-1.80189, -1.198867, -2.433155, 1, 0.2235294, 0, 1,
-1.778552, -1.160543, -3.795969, 1, 0.227451, 0, 1,
-1.752873, 1.24717, -2.311651, 1, 0.2352941, 0, 1,
-1.739239, 1.179176, -0.6327753, 1, 0.2392157, 0, 1,
-1.739042, 0.839374, -1.148992, 1, 0.2470588, 0, 1,
-1.735074, 0.08406757, -4.306099, 1, 0.2509804, 0, 1,
-1.702005, -0.5837943, -3.337668, 1, 0.2588235, 0, 1,
-1.700611, 1.18859, -0.7532234, 1, 0.2627451, 0, 1,
-1.690874, 1.449104, -1.349632, 1, 0.2705882, 0, 1,
-1.690811, -0.9891077, -1.747042, 1, 0.2745098, 0, 1,
-1.686174, 0.06320508, -0.9427599, 1, 0.282353, 0, 1,
-1.666058, 2.007147, -1.478872, 1, 0.2862745, 0, 1,
-1.65152, 1.371106, -1.278965, 1, 0.2941177, 0, 1,
-1.646352, -0.03702029, -4.290773, 1, 0.3019608, 0, 1,
-1.613371, 0.06677376, -0.5950177, 1, 0.3058824, 0, 1,
-1.572411, 1.635643, 0.9912643, 1, 0.3137255, 0, 1,
-1.558812, -0.1471208, -0.3826573, 1, 0.3176471, 0, 1,
-1.553595, 0.5928913, -1.329555, 1, 0.3254902, 0, 1,
-1.542407, -0.9258972, -3.153617, 1, 0.3294118, 0, 1,
-1.535923, 0.3819501, -2.334173, 1, 0.3372549, 0, 1,
-1.535236, 0.2840894, -1.252856, 1, 0.3411765, 0, 1,
-1.533911, -0.1990626, -3.520413, 1, 0.3490196, 0, 1,
-1.493634, 0.05768408, -1.008059, 1, 0.3529412, 0, 1,
-1.488876, 0.3541142, -1.745675, 1, 0.3607843, 0, 1,
-1.487321, 0.3958454, -0.324196, 1, 0.3647059, 0, 1,
-1.479002, -0.08614772, -1.900487, 1, 0.372549, 0, 1,
-1.448626, 0.192309, -0.9510728, 1, 0.3764706, 0, 1,
-1.44828, 0.3464507, 0.3864156, 1, 0.3843137, 0, 1,
-1.442248, 0.3387742, -2.40836, 1, 0.3882353, 0, 1,
-1.441842, 1.024294, -2.107088, 1, 0.3960784, 0, 1,
-1.434221, 0.2847179, -1.195156, 1, 0.4039216, 0, 1,
-1.432888, -2.312934, -2.90765, 1, 0.4078431, 0, 1,
-1.423023, 0.9924451, -1.010753, 1, 0.4156863, 0, 1,
-1.415484, -2.071274, -1.680921, 1, 0.4196078, 0, 1,
-1.408491, 0.1941334, -0.5102, 1, 0.427451, 0, 1,
-1.408056, -0.5994583, -1.728225, 1, 0.4313726, 0, 1,
-1.405902, 0.9237393, -1.192958, 1, 0.4392157, 0, 1,
-1.382963, 1.05058, -1.006493, 1, 0.4431373, 0, 1,
-1.382109, -0.4417303, -0.4695808, 1, 0.4509804, 0, 1,
-1.370774, 1.122407, -0.8357716, 1, 0.454902, 0, 1,
-1.368269, -0.4127327, -1.746668, 1, 0.4627451, 0, 1,
-1.36198, 0.7609137, -0.5967486, 1, 0.4666667, 0, 1,
-1.358434, 0.5710047, -0.2251545, 1, 0.4745098, 0, 1,
-1.35785, 0.2604578, -0.5155798, 1, 0.4784314, 0, 1,
-1.354349, -0.6111286, -1.263785, 1, 0.4862745, 0, 1,
-1.352942, 1.514416, -2.35157, 1, 0.4901961, 0, 1,
-1.349202, 0.4408707, -1.745032, 1, 0.4980392, 0, 1,
-1.345789, 1.300405, 0.7953365, 1, 0.5058824, 0, 1,
-1.345593, 0.3434966, -2.136912, 1, 0.509804, 0, 1,
-1.338785, 1.185834, -0.2114072, 1, 0.5176471, 0, 1,
-1.333645, 1.886012, 0.1362718, 1, 0.5215687, 0, 1,
-1.32911, 0.9588198, -1.286839, 1, 0.5294118, 0, 1,
-1.32662, -1.044487, -0.5593129, 1, 0.5333334, 0, 1,
-1.325145, -0.4195125, -2.9917, 1, 0.5411765, 0, 1,
-1.324006, 0.4950373, -1.851166, 1, 0.5450981, 0, 1,
-1.320569, -1.392389, -4.138604, 1, 0.5529412, 0, 1,
-1.319795, -0.2839693, -1.304925, 1, 0.5568628, 0, 1,
-1.307974, -0.6068874, -2.590142, 1, 0.5647059, 0, 1,
-1.302974, 0.7490107, -1.353056, 1, 0.5686275, 0, 1,
-1.299086, -0.9458553, -3.940827, 1, 0.5764706, 0, 1,
-1.294614, 0.2074008, -1.130302, 1, 0.5803922, 0, 1,
-1.283593, 1.123063, 0.7298872, 1, 0.5882353, 0, 1,
-1.283481, 1.122343, -0.8357061, 1, 0.5921569, 0, 1,
-1.273382, -0.8544748, -2.193728, 1, 0.6, 0, 1,
-1.270064, -0.2899632, -0.8044302, 1, 0.6078432, 0, 1,
-1.268283, 0.7882367, -2.387869, 1, 0.6117647, 0, 1,
-1.263628, 0.9113446, -0.5104407, 1, 0.6196079, 0, 1,
-1.258795, 0.5576932, -1.904294, 1, 0.6235294, 0, 1,
-1.258682, -0.5474579, -1.65844, 1, 0.6313726, 0, 1,
-1.257865, -0.3727211, -1.799442, 1, 0.6352941, 0, 1,
-1.250539, 0.7240078, -1.543156, 1, 0.6431373, 0, 1,
-1.247562, 0.05472764, -0.7743605, 1, 0.6470588, 0, 1,
-1.245045, -1.250755, -5.124685, 1, 0.654902, 0, 1,
-1.237227, 0.1135416, 0.8098295, 1, 0.6588235, 0, 1,
-1.23593, -0.6974075, -0.179325, 1, 0.6666667, 0, 1,
-1.212743, -0.3901279, -1.593264, 1, 0.6705883, 0, 1,
-1.198939, -1.043425, -1.445518, 1, 0.6784314, 0, 1,
-1.180915, -1.552517, -1.533209, 1, 0.682353, 0, 1,
-1.174874, 1.856465, -1.65083, 1, 0.6901961, 0, 1,
-1.17375, 0.494546, -2.1218, 1, 0.6941177, 0, 1,
-1.161416, -0.1506563, -0.4227746, 1, 0.7019608, 0, 1,
-1.16067, -0.4480225, -1.830482, 1, 0.7098039, 0, 1,
-1.159339, 0.124912, -3.321934, 1, 0.7137255, 0, 1,
-1.157045, 0.9922295, 0.15554, 1, 0.7215686, 0, 1,
-1.150746, 0.9661238, -0.9592518, 1, 0.7254902, 0, 1,
-1.14881, 0.4686877, -1.57013, 1, 0.7333333, 0, 1,
-1.139884, 0.4575065, -1.594494, 1, 0.7372549, 0, 1,
-1.130967, -0.0002597454, -1.27603, 1, 0.7450981, 0, 1,
-1.126882, 0.8536931, -0.06422819, 1, 0.7490196, 0, 1,
-1.095418, -0.2592215, -1.407337, 1, 0.7568628, 0, 1,
-1.091563, 0.450723, -1.887194, 1, 0.7607843, 0, 1,
-1.090751, 0.6227469, 0.7255889, 1, 0.7686275, 0, 1,
-1.090108, -1.136317, -4.760262, 1, 0.772549, 0, 1,
-1.087204, -0.8217032, -3.639374, 1, 0.7803922, 0, 1,
-1.079303, -0.3233045, -0.7276845, 1, 0.7843137, 0, 1,
-1.077639, 0.200741, -1.813996, 1, 0.7921569, 0, 1,
-1.069018, 0.2451064, -1.662184, 1, 0.7960784, 0, 1,
-1.068963, -0.1867476, -1.033158, 1, 0.8039216, 0, 1,
-1.063931, 0.4798751, -1.19614, 1, 0.8117647, 0, 1,
-1.059498, -0.1777891, -1.274216, 1, 0.8156863, 0, 1,
-1.056092, 1.584445, -1.8294, 1, 0.8235294, 0, 1,
-1.046849, 0.1915897, -1.233708, 1, 0.827451, 0, 1,
-1.044628, -0.3245718, -3.615974, 1, 0.8352941, 0, 1,
-1.040523, 0.1502253, -2.413443, 1, 0.8392157, 0, 1,
-1.040276, -0.654174, -3.55561, 1, 0.8470588, 0, 1,
-1.038912, -1.406501, -3.647226, 1, 0.8509804, 0, 1,
-1.03285, 0.6039662, -0.4743535, 1, 0.8588235, 0, 1,
-1.02495, -2.036106, -2.050495, 1, 0.8627451, 0, 1,
-1.024308, 0.4912627, -0.5080661, 1, 0.8705882, 0, 1,
-1.0228, 0.4420654, -0.3530165, 1, 0.8745098, 0, 1,
-1.018169, -0.5479454, -2.943834, 1, 0.8823529, 0, 1,
-1.013618, 0.8747818, -1.045083, 1, 0.8862745, 0, 1,
-1.012887, -0.6218092, -2.806622, 1, 0.8941177, 0, 1,
-1.002694, -0.9508943, -3.182716, 1, 0.8980392, 0, 1,
-0.9977135, 0.07627303, -2.807056, 1, 0.9058824, 0, 1,
-0.9974355, -0.2573935, -2.399941, 1, 0.9137255, 0, 1,
-0.9959767, -0.1866235, -0.4676803, 1, 0.9176471, 0, 1,
-0.9933333, 0.1967666, -0.3722363, 1, 0.9254902, 0, 1,
-0.9887092, -1.47779, -2.370127, 1, 0.9294118, 0, 1,
-0.9857562, 0.4016117, -1.245082, 1, 0.9372549, 0, 1,
-0.9829751, 0.9991959, -0.6622512, 1, 0.9411765, 0, 1,
-0.9815254, -1.348598, -1.624385, 1, 0.9490196, 0, 1,
-0.9804623, 1.918283, 0.3421704, 1, 0.9529412, 0, 1,
-0.980432, -0.4320068, -0.7123551, 1, 0.9607843, 0, 1,
-0.979736, 2.301448, 0.5890018, 1, 0.9647059, 0, 1,
-0.9609734, -0.8417487, -1.488472, 1, 0.972549, 0, 1,
-0.9580868, -1.152185, -2.421149, 1, 0.9764706, 0, 1,
-0.9545853, 0.8942756, 0.2483591, 1, 0.9843137, 0, 1,
-0.9333656, -2.794837, -2.182487, 1, 0.9882353, 0, 1,
-0.9265423, 0.7646665, -1.274952, 1, 0.9960784, 0, 1,
-0.9192909, 0.1376951, -0.9608507, 0.9960784, 1, 0, 1,
-0.913672, 0.8666436, -1.377988, 0.9921569, 1, 0, 1,
-0.8933684, -0.5834333, -2.687797, 0.9843137, 1, 0, 1,
-0.8927515, 1.205591, -0.939575, 0.9803922, 1, 0, 1,
-0.8887833, -0.7936238, -2.547459, 0.972549, 1, 0, 1,
-0.8869241, 0.2112981, -1.858976, 0.9686275, 1, 0, 1,
-0.8859993, -0.2829159, -1.827847, 0.9607843, 1, 0, 1,
-0.8800116, 1.38514, 0.1424665, 0.9568627, 1, 0, 1,
-0.8679705, -0.2464597, -1.908783, 0.9490196, 1, 0, 1,
-0.8653353, 1.655593, -0.3070244, 0.945098, 1, 0, 1,
-0.8642891, -1.51223, -3.142611, 0.9372549, 1, 0, 1,
-0.8634459, 1.702736, -1.875719, 0.9333333, 1, 0, 1,
-0.8550431, 0.4230441, 0.5182949, 0.9254902, 1, 0, 1,
-0.8472997, 0.8625289, -0.9634346, 0.9215686, 1, 0, 1,
-0.8408021, 0.5697736, -1.40022, 0.9137255, 1, 0, 1,
-0.838638, -0.8593071, -2.624581, 0.9098039, 1, 0, 1,
-0.8315544, -0.7060788, -1.628334, 0.9019608, 1, 0, 1,
-0.8295054, -0.008713877, -1.201683, 0.8941177, 1, 0, 1,
-0.8258836, 0.4127101, -1.221903, 0.8901961, 1, 0, 1,
-0.8250955, -0.06851853, -0.4561452, 0.8823529, 1, 0, 1,
-0.8212914, -0.5226874, -2.129006, 0.8784314, 1, 0, 1,
-0.8193651, 0.6353947, 0.6975285, 0.8705882, 1, 0, 1,
-0.8177484, -0.01241857, -1.107386, 0.8666667, 1, 0, 1,
-0.8147354, -0.4449252, -0.9871457, 0.8588235, 1, 0, 1,
-0.8039652, 0.5994872, -1.517648, 0.854902, 1, 0, 1,
-0.8018343, -1.171626, -2.36308, 0.8470588, 1, 0, 1,
-0.8013757, 0.08038446, -2.098572, 0.8431373, 1, 0, 1,
-0.8006571, -0.6762004, -3.786415, 0.8352941, 1, 0, 1,
-0.7999744, -1.255257, -1.902259, 0.8313726, 1, 0, 1,
-0.7902921, 1.498128, 1.368092, 0.8235294, 1, 0, 1,
-0.7883623, -1.025217, -1.204595, 0.8196079, 1, 0, 1,
-0.7882957, -1.695691, -1.625988, 0.8117647, 1, 0, 1,
-0.7872045, -2.025697, -2.461497, 0.8078431, 1, 0, 1,
-0.7858016, -0.3310844, -3.36327, 0.8, 1, 0, 1,
-0.7856624, 0.9108258, -1.989833, 0.7921569, 1, 0, 1,
-0.7839789, -1.140945, -1.58256, 0.7882353, 1, 0, 1,
-0.7763251, -0.3711088, -1.739768, 0.7803922, 1, 0, 1,
-0.7581836, -0.2629517, -2.193902, 0.7764706, 1, 0, 1,
-0.7565009, -0.5815136, -1.978951, 0.7686275, 1, 0, 1,
-0.7537538, -2.117568, -2.854762, 0.7647059, 1, 0, 1,
-0.7500299, -2.377879, -4.621933, 0.7568628, 1, 0, 1,
-0.7476152, 1.035792, 0.2051234, 0.7529412, 1, 0, 1,
-0.7468195, 0.4043737, 0.1110325, 0.7450981, 1, 0, 1,
-0.7463939, 1.374228, 0.3969746, 0.7411765, 1, 0, 1,
-0.744089, -0.7813721, -3.13195, 0.7333333, 1, 0, 1,
-0.7400141, -0.5184808, -2.846221, 0.7294118, 1, 0, 1,
-0.7279374, -0.5852035, -2.271307, 0.7215686, 1, 0, 1,
-0.7276149, 0.5214071, -0.7021438, 0.7176471, 1, 0, 1,
-0.72644, 1.709652, -1.047412, 0.7098039, 1, 0, 1,
-0.7194078, -1.645923, -1.893742, 0.7058824, 1, 0, 1,
-0.7153263, 0.1687866, -2.773589, 0.6980392, 1, 0, 1,
-0.7150317, 1.009441, -0.9176461, 0.6901961, 1, 0, 1,
-0.7143405, -0.899625, -1.046599, 0.6862745, 1, 0, 1,
-0.710823, 0.5486881, -0.5398166, 0.6784314, 1, 0, 1,
-0.7088999, -0.7804769, -2.187621, 0.6745098, 1, 0, 1,
-0.708342, 0.731185, -1.293128, 0.6666667, 1, 0, 1,
-0.7026153, 0.7859515, -1.508112, 0.6627451, 1, 0, 1,
-0.6991791, -0.4304404, -2.419727, 0.654902, 1, 0, 1,
-0.692665, -0.3274211, -1.685858, 0.6509804, 1, 0, 1,
-0.6918837, 0.7012624, -0.5507442, 0.6431373, 1, 0, 1,
-0.6891988, -1.007141, -3.046695, 0.6392157, 1, 0, 1,
-0.6886743, 1.228893, -1.647735, 0.6313726, 1, 0, 1,
-0.686227, -0.8503466, -1.526418, 0.627451, 1, 0, 1,
-0.6856142, 1.069256, -0.2790256, 0.6196079, 1, 0, 1,
-0.6834674, 0.01387683, -2.242415, 0.6156863, 1, 0, 1,
-0.6767695, 0.4594263, -2.817544, 0.6078432, 1, 0, 1,
-0.6736903, -0.2473727, -1.238091, 0.6039216, 1, 0, 1,
-0.671195, 0.9458538, -0.9195443, 0.5960785, 1, 0, 1,
-0.6701577, 0.6063356, -0.1373929, 0.5882353, 1, 0, 1,
-0.6694201, -2.186651, -3.669315, 0.5843138, 1, 0, 1,
-0.660176, -2.112761, -3.271372, 0.5764706, 1, 0, 1,
-0.6593019, 0.5571707, -1.0198, 0.572549, 1, 0, 1,
-0.6589552, -0.9060979, -1.180153, 0.5647059, 1, 0, 1,
-0.6546813, -1.433951, -2.898782, 0.5607843, 1, 0, 1,
-0.6543471, 0.00338945, -1.010351, 0.5529412, 1, 0, 1,
-0.6509517, -1.046537, -1.934299, 0.5490196, 1, 0, 1,
-0.6507717, 1.04982, -2.018847, 0.5411765, 1, 0, 1,
-0.6494477, 0.9189728, -0.9170694, 0.5372549, 1, 0, 1,
-0.6484168, 1.139943, 0.3362159, 0.5294118, 1, 0, 1,
-0.647921, 1.525644, -0.04518122, 0.5254902, 1, 0, 1,
-0.6425974, 1.072238, -1.387162, 0.5176471, 1, 0, 1,
-0.6396918, -0.00496288, -1.275173, 0.5137255, 1, 0, 1,
-0.6393816, 1.119819, -0.6723482, 0.5058824, 1, 0, 1,
-0.6380134, -1.335473, -2.985131, 0.5019608, 1, 0, 1,
-0.6290297, -0.04612873, -3.292533, 0.4941176, 1, 0, 1,
-0.6252187, -0.1732551, -1.266343, 0.4862745, 1, 0, 1,
-0.6235177, -1.237866, -2.284972, 0.4823529, 1, 0, 1,
-0.6234908, -0.2068544, -1.012927, 0.4745098, 1, 0, 1,
-0.621344, 1.02562, -0.7680291, 0.4705882, 1, 0, 1,
-0.6207097, -0.5165458, -0.864867, 0.4627451, 1, 0, 1,
-0.619734, -0.5798616, -2.315679, 0.4588235, 1, 0, 1,
-0.6103359, -0.1095409, -1.513368, 0.4509804, 1, 0, 1,
-0.6076255, -0.9833232, -2.955739, 0.4470588, 1, 0, 1,
-0.6068875, -0.01878826, -1.818771, 0.4392157, 1, 0, 1,
-0.6021671, 0.7777482, -1.556716, 0.4352941, 1, 0, 1,
-0.602023, -1.10268, -1.362999, 0.427451, 1, 0, 1,
-0.5989574, -1.639112, -0.9659336, 0.4235294, 1, 0, 1,
-0.5978608, -0.5889452, -2.669799, 0.4156863, 1, 0, 1,
-0.5957091, 0.6211138, -1.058966, 0.4117647, 1, 0, 1,
-0.587212, 1.437349, -0.06660878, 0.4039216, 1, 0, 1,
-0.5862105, -1.022049, -1.410135, 0.3960784, 1, 0, 1,
-0.5849254, -0.4747493, -2.896874, 0.3921569, 1, 0, 1,
-0.5843457, -1.274788, -2.527143, 0.3843137, 1, 0, 1,
-0.579012, 0.49796, -2.453125, 0.3803922, 1, 0, 1,
-0.5775322, -0.9306187, -2.289799, 0.372549, 1, 0, 1,
-0.5767211, 0.01816115, -0.3787563, 0.3686275, 1, 0, 1,
-0.5755766, 1.025218, -0.2755167, 0.3607843, 1, 0, 1,
-0.5691484, 0.3366589, 0.03748322, 0.3568628, 1, 0, 1,
-0.5682833, -0.4366822, -3.372739, 0.3490196, 1, 0, 1,
-0.5667073, 0.4497474, -1.019247, 0.345098, 1, 0, 1,
-0.5652208, 0.7393332, -0.7148067, 0.3372549, 1, 0, 1,
-0.5630533, -1.400321, -4.948895, 0.3333333, 1, 0, 1,
-0.5575032, -0.6326883, -1.936999, 0.3254902, 1, 0, 1,
-0.552057, 0.7075468, -1.107758, 0.3215686, 1, 0, 1,
-0.548032, 0.9700184, -1.162458, 0.3137255, 1, 0, 1,
-0.5445439, -0.3719629, -1.341249, 0.3098039, 1, 0, 1,
-0.543487, 0.8131299, -0.04451607, 0.3019608, 1, 0, 1,
-0.5427243, -1.188052, -3.500414, 0.2941177, 1, 0, 1,
-0.5423679, -0.3414579, -0.8948489, 0.2901961, 1, 0, 1,
-0.5396478, -0.6477311, -4.180544, 0.282353, 1, 0, 1,
-0.5389606, 0.3268674, -2.237971, 0.2784314, 1, 0, 1,
-0.5354765, -0.9930882, -3.26159, 0.2705882, 1, 0, 1,
-0.5328948, -1.772435, -1.361249, 0.2666667, 1, 0, 1,
-0.5232713, 0.5424998, 1.428843, 0.2588235, 1, 0, 1,
-0.5229897, -0.7252057, -2.254459, 0.254902, 1, 0, 1,
-0.5216108, -0.9946548, -0.03805251, 0.2470588, 1, 0, 1,
-0.5203552, 0.5855023, -1.194638, 0.2431373, 1, 0, 1,
-0.5136825, 3.600865, 0.7773455, 0.2352941, 1, 0, 1,
-0.5117266, -1.413627, -1.692502, 0.2313726, 1, 0, 1,
-0.5114909, -0.06902463, -0.35836, 0.2235294, 1, 0, 1,
-0.5083314, 0.2398133, 0.6207737, 0.2196078, 1, 0, 1,
-0.4972864, 0.6208742, 0.2298059, 0.2117647, 1, 0, 1,
-0.4960307, -1.383465, -1.661925, 0.2078431, 1, 0, 1,
-0.4922069, -0.06813999, -1.462617, 0.2, 1, 0, 1,
-0.4898774, 2.924923, -1.946474, 0.1921569, 1, 0, 1,
-0.4865058, 0.5487931, -1.346814, 0.1882353, 1, 0, 1,
-0.4812902, -0.08801971, -1.754123, 0.1803922, 1, 0, 1,
-0.4806375, -0.7446138, -2.663245, 0.1764706, 1, 0, 1,
-0.4720713, -0.1158144, -1.507812, 0.1686275, 1, 0, 1,
-0.4684885, 2.763343, 0.348733, 0.1647059, 1, 0, 1,
-0.4677901, -0.3488367, -1.299312, 0.1568628, 1, 0, 1,
-0.4672197, 0.05361497, -2.212611, 0.1529412, 1, 0, 1,
-0.4629249, 0.05004761, -0.8077108, 0.145098, 1, 0, 1,
-0.4578696, 0.02919087, -1.274208, 0.1411765, 1, 0, 1,
-0.4498343, 0.1975751, -0.2206033, 0.1333333, 1, 0, 1,
-0.4366745, 0.07766704, -1.638882, 0.1294118, 1, 0, 1,
-0.4347752, 1.963508, -1.108362, 0.1215686, 1, 0, 1,
-0.4324059, 0.9840178, -2.510871, 0.1176471, 1, 0, 1,
-0.4286473, -0.3220344, -1.539636, 0.1098039, 1, 0, 1,
-0.4268638, -1.423264, -3.518258, 0.1058824, 1, 0, 1,
-0.4258595, -0.5104453, -1.723684, 0.09803922, 1, 0, 1,
-0.4244354, -0.07790606, -2.395158, 0.09019608, 1, 0, 1,
-0.4233933, -1.533171, -2.593725, 0.08627451, 1, 0, 1,
-0.4089564, 1.751129, 0.5170335, 0.07843138, 1, 0, 1,
-0.4041118, 1.028254, -0.07388622, 0.07450981, 1, 0, 1,
-0.4035766, -1.187876, -4.750905, 0.06666667, 1, 0, 1,
-0.4024493, 2.026319, 1.477524, 0.0627451, 1, 0, 1,
-0.3996992, 0.875597, -0.210788, 0.05490196, 1, 0, 1,
-0.3974366, -1.092547, -2.284302, 0.05098039, 1, 0, 1,
-0.395349, 0.5031844, -0.4877163, 0.04313726, 1, 0, 1,
-0.3932069, -1.324951, -3.753733, 0.03921569, 1, 0, 1,
-0.3905967, -0.4334796, -1.098052, 0.03137255, 1, 0, 1,
-0.3903131, 0.1051347, -1.326833, 0.02745098, 1, 0, 1,
-0.3877613, 1.339379, -3.325357, 0.01960784, 1, 0, 1,
-0.3871094, 0.5048881, 0.6233587, 0.01568628, 1, 0, 1,
-0.3852868, 1.003397, -0.3155546, 0.007843138, 1, 0, 1,
-0.3781975, -0.8142463, -2.576489, 0.003921569, 1, 0, 1,
-0.3779083, 2.392452, 0.6004127, 0, 1, 0.003921569, 1,
-0.3769239, 0.7756472, -0.6711822, 0, 1, 0.01176471, 1,
-0.3765315, 1.980346, -1.535111, 0, 1, 0.01568628, 1,
-0.3763857, -1.223297, -2.272919, 0, 1, 0.02352941, 1,
-0.3702867, -1.135448, -2.624624, 0, 1, 0.02745098, 1,
-0.3691411, -1.883851, -1.491045, 0, 1, 0.03529412, 1,
-0.3663398, -1.061482, -1.376733, 0, 1, 0.03921569, 1,
-0.365707, 0.8026362, -2.446109, 0, 1, 0.04705882, 1,
-0.3641395, -0.003856321, -0.3036783, 0, 1, 0.05098039, 1,
-0.3640655, -0.8187574, -2.540378, 0, 1, 0.05882353, 1,
-0.3628368, -0.6796369, -3.132497, 0, 1, 0.0627451, 1,
-0.3623239, -0.06931068, -1.205552, 0, 1, 0.07058824, 1,
-0.3619514, -0.6180371, -3.35357, 0, 1, 0.07450981, 1,
-0.3568362, -0.595742, -2.035621, 0, 1, 0.08235294, 1,
-0.3537521, -0.2036657, -3.004954, 0, 1, 0.08627451, 1,
-0.352866, -0.1017015, -2.677764, 0, 1, 0.09411765, 1,
-0.3525785, -0.5454363, -2.873939, 0, 1, 0.1019608, 1,
-0.3491476, -1.163044, -3.644488, 0, 1, 0.1058824, 1,
-0.347482, 0.5695833, -1.144386, 0, 1, 0.1137255, 1,
-0.3474115, -0.2424066, -2.165686, 0, 1, 0.1176471, 1,
-0.3465656, -1.71242, -2.186117, 0, 1, 0.1254902, 1,
-0.3414558, 0.2534737, 0.009229282, 0, 1, 0.1294118, 1,
-0.3403687, 0.04807803, -2.13286, 0, 1, 0.1372549, 1,
-0.3371914, 1.077773, -0.1605924, 0, 1, 0.1411765, 1,
-0.3349186, -0.6601847, -5.548499, 0, 1, 0.1490196, 1,
-0.3321021, 0.0763092, 0.08452865, 0, 1, 0.1529412, 1,
-0.3315006, -1.962507, -3.428423, 0, 1, 0.1607843, 1,
-0.3251377, -0.6631897, -1.675752, 0, 1, 0.1647059, 1,
-0.3212953, -0.3539983, -2.396261, 0, 1, 0.172549, 1,
-0.3156207, 0.2296473, -1.405188, 0, 1, 0.1764706, 1,
-0.3116541, -2.728024, -1.901359, 0, 1, 0.1843137, 1,
-0.3032872, -1.837217, -2.948747, 0, 1, 0.1882353, 1,
-0.3012887, -0.1903154, -2.057611, 0, 1, 0.1960784, 1,
-0.2988902, 1.247974, -0.790526, 0, 1, 0.2039216, 1,
-0.293106, 0.1150733, -0.8326094, 0, 1, 0.2078431, 1,
-0.2901273, -1.166341, -2.318958, 0, 1, 0.2156863, 1,
-0.2887588, 0.1242174, -1.943294, 0, 1, 0.2196078, 1,
-0.2849757, 0.327145, -1.464975, 0, 1, 0.227451, 1,
-0.2838205, 1.408996, -1.623516, 0, 1, 0.2313726, 1,
-0.2833051, 1.041553, 0.9112489, 0, 1, 0.2392157, 1,
-0.2829649, -0.6427519, -2.275505, 0, 1, 0.2431373, 1,
-0.280351, 0.06669345, -0.7257529, 0, 1, 0.2509804, 1,
-0.2754128, -0.4897756, -1.952223, 0, 1, 0.254902, 1,
-0.2747362, -0.5680046, -3.189732, 0, 1, 0.2627451, 1,
-0.2702384, 1.264121, -0.5466625, 0, 1, 0.2666667, 1,
-0.2686876, -0.3294214, -3.968808, 0, 1, 0.2745098, 1,
-0.2606879, 1.166054, -1.300654, 0, 1, 0.2784314, 1,
-0.2599007, 0.3546825, -1.091902, 0, 1, 0.2862745, 1,
-0.2590946, -0.1939439, -3.246461, 0, 1, 0.2901961, 1,
-0.2581561, 0.4322634, -0.7058822, 0, 1, 0.2980392, 1,
-0.2545101, -0.7805499, -2.004904, 0, 1, 0.3058824, 1,
-0.2545016, 1.865382, 0.2200471, 0, 1, 0.3098039, 1,
-0.2522554, 1.360154, -1.106411, 0, 1, 0.3176471, 1,
-0.2503861, -0.6089131, -1.631827, 0, 1, 0.3215686, 1,
-0.2500438, 2.288244, -0.2294948, 0, 1, 0.3294118, 1,
-0.2492641, 0.06151518, -3.529302, 0, 1, 0.3333333, 1,
-0.2444915, -0.644805, -3.225312, 0, 1, 0.3411765, 1,
-0.2439353, -0.5577309, -2.238189, 0, 1, 0.345098, 1,
-0.242423, 1.162391, -1.35075, 0, 1, 0.3529412, 1,
-0.2413944, 0.3099396, -1.67066, 0, 1, 0.3568628, 1,
-0.2393805, -0.4514947, -3.363178, 0, 1, 0.3647059, 1,
-0.2354584, 0.2987206, -0.4636548, 0, 1, 0.3686275, 1,
-0.2326326, 0.01127532, -3.006442, 0, 1, 0.3764706, 1,
-0.2307472, -1.366992, -1.255599, 0, 1, 0.3803922, 1,
-0.23013, 0.7437764, -0.6104032, 0, 1, 0.3882353, 1,
-0.2220775, -0.1646665, -2.789594, 0, 1, 0.3921569, 1,
-0.2209476, 1.032526, -0.4414908, 0, 1, 0.4, 1,
-0.212822, -0.6822248, -4.004966, 0, 1, 0.4078431, 1,
-0.2107754, 0.420491, -1.12815, 0, 1, 0.4117647, 1,
-0.2083537, 0.2309325, -0.1729877, 0, 1, 0.4196078, 1,
-0.2050001, 2.21335, 1.478404, 0, 1, 0.4235294, 1,
-0.2030219, 0.5762147, -2.168736, 0, 1, 0.4313726, 1,
-0.202411, -0.9832636, -3.477086, 0, 1, 0.4352941, 1,
-0.2023688, -0.3770697, -1.499317, 0, 1, 0.4431373, 1,
-0.1981366, 0.9636519, 1.488035, 0, 1, 0.4470588, 1,
-0.1910483, 1.661635, -1.075218, 0, 1, 0.454902, 1,
-0.1905594, 0.9511802, -0.9400325, 0, 1, 0.4588235, 1,
-0.1872497, 0.5810757, -1.451597, 0, 1, 0.4666667, 1,
-0.186648, 0.4539397, 0.08115055, 0, 1, 0.4705882, 1,
-0.1849004, 1.077287, -2.229079, 0, 1, 0.4784314, 1,
-0.1821626, 1.172005, -0.3990123, 0, 1, 0.4823529, 1,
-0.1805295, 2.028894, 1.430843, 0, 1, 0.4901961, 1,
-0.1786073, -0.4532367, -3.354887, 0, 1, 0.4941176, 1,
-0.177337, 0.209228, -0.1507861, 0, 1, 0.5019608, 1,
-0.1694639, -0.7809885, -3.336263, 0, 1, 0.509804, 1,
-0.1674304, -0.3125376, -2.915462, 0, 1, 0.5137255, 1,
-0.1667504, -0.7407135, -3.63618, 0, 1, 0.5215687, 1,
-0.1667501, 0.05775134, -0.6058189, 0, 1, 0.5254902, 1,
-0.16484, -1.048138, -3.490108, 0, 1, 0.5333334, 1,
-0.1624937, -1.310758, -3.432861, 0, 1, 0.5372549, 1,
-0.1620497, -2.033449, -2.427118, 0, 1, 0.5450981, 1,
-0.1618184, -1.324419, -3.132546, 0, 1, 0.5490196, 1,
-0.1598957, 0.5144249, -0.1012137, 0, 1, 0.5568628, 1,
-0.1587616, -1.059045, -3.817138, 0, 1, 0.5607843, 1,
-0.1573881, -0.3008733, -2.475102, 0, 1, 0.5686275, 1,
-0.1507646, -0.7657005, -2.574732, 0, 1, 0.572549, 1,
-0.1502445, -0.8905278, -3.154738, 0, 1, 0.5803922, 1,
-0.1435545, -1.74851, -4.339148, 0, 1, 0.5843138, 1,
-0.1435323, -1.002195, -3.720189, 0, 1, 0.5921569, 1,
-0.1388983, 2.012641, 0.7310955, 0, 1, 0.5960785, 1,
-0.1360965, -0.4752121, -2.079991, 0, 1, 0.6039216, 1,
-0.1342574, 0.7124376, -1.462024, 0, 1, 0.6117647, 1,
-0.1331118, 1.419986, -0.07191566, 0, 1, 0.6156863, 1,
-0.1299107, -0.7968516, -1.182625, 0, 1, 0.6235294, 1,
-0.1277212, -0.3541535, -1.686546, 0, 1, 0.627451, 1,
-0.1276356, 0.103108, -2.03989, 0, 1, 0.6352941, 1,
-0.1273509, 0.28326, 1.522371, 0, 1, 0.6392157, 1,
-0.1244135, -0.986938, -2.497107, 0, 1, 0.6470588, 1,
-0.1214816, -1.077261, -4.266811, 0, 1, 0.6509804, 1,
-0.1200353, 0.9731643, 1.378236, 0, 1, 0.6588235, 1,
-0.1183424, -0.8512011, -1.367975, 0, 1, 0.6627451, 1,
-0.1171276, 0.6931617, 0.3212179, 0, 1, 0.6705883, 1,
-0.1165811, 0.01658527, -1.663334, 0, 1, 0.6745098, 1,
-0.1145384, -0.2407753, -2.000724, 0, 1, 0.682353, 1,
-0.1122841, 0.6354384, 0.7705129, 0, 1, 0.6862745, 1,
-0.1071163, 1.594949, -0.1305303, 0, 1, 0.6941177, 1,
-0.1050193, 1.541323, 0.02968176, 0, 1, 0.7019608, 1,
-0.1023436, 0.536865, -0.1891384, 0, 1, 0.7058824, 1,
-0.09985942, -1.267938, -3.889203, 0, 1, 0.7137255, 1,
-0.09481386, -2.299709, -2.506227, 0, 1, 0.7176471, 1,
-0.09173254, 0.3820201, -1.625481, 0, 1, 0.7254902, 1,
-0.09116632, -1.376103, -3.007887, 0, 1, 0.7294118, 1,
-0.09093295, 1.384112, 0.5867689, 0, 1, 0.7372549, 1,
-0.08786403, 0.699611, 1.156656, 0, 1, 0.7411765, 1,
-0.08395434, -0.3966333, -4.510321, 0, 1, 0.7490196, 1,
-0.07727985, 1.92645, -0.543657, 0, 1, 0.7529412, 1,
-0.07615632, -1.288991, -2.067326, 0, 1, 0.7607843, 1,
-0.07054302, 0.5731592, 2.249467, 0, 1, 0.7647059, 1,
-0.06993338, -0.6766436, -2.92595, 0, 1, 0.772549, 1,
-0.06618848, 0.9217734, -1.045907, 0, 1, 0.7764706, 1,
-0.06362866, -1.183795, -5.060633, 0, 1, 0.7843137, 1,
-0.06266375, 0.0725235, -2.194944, 0, 1, 0.7882353, 1,
-0.06162835, -0.2741833, -1.340742, 0, 1, 0.7960784, 1,
-0.05538731, 0.3392071, -1.464094, 0, 1, 0.8039216, 1,
-0.05308616, -0.1854905, -4.516851, 0, 1, 0.8078431, 1,
-0.05228723, 0.1915787, 1.456154, 0, 1, 0.8156863, 1,
-0.04975398, -1.147322, -2.990177, 0, 1, 0.8196079, 1,
-0.04882758, -0.03202944, -3.67807, 0, 1, 0.827451, 1,
-0.04861738, 0.5020204, 0.3721058, 0, 1, 0.8313726, 1,
-0.0477753, -1.197003, -0.8798362, 0, 1, 0.8392157, 1,
-0.04598057, -1.151897, -3.524427, 0, 1, 0.8431373, 1,
-0.04535997, 1.230309, 0.5781188, 0, 1, 0.8509804, 1,
-0.04347693, -0.4059377, -2.761404, 0, 1, 0.854902, 1,
-0.03890143, 0.6094255, -1.022126, 0, 1, 0.8627451, 1,
-0.03873517, 0.994633, 1.458028, 0, 1, 0.8666667, 1,
-0.0381159, 0.9076477, -0.3029732, 0, 1, 0.8745098, 1,
-0.03242186, -1.054571, -3.377799, 0, 1, 0.8784314, 1,
-0.02832233, 0.8842561, 0.1961906, 0, 1, 0.8862745, 1,
-0.02704212, 1.301308, -0.9591739, 0, 1, 0.8901961, 1,
-0.01797114, -1.719458, -2.313346, 0, 1, 0.8980392, 1,
-0.01065673, -1.792957, -2.420361, 0, 1, 0.9058824, 1,
-0.008738608, -0.6946909, -2.693647, 0, 1, 0.9098039, 1,
-0.007208649, 0.6953682, 0.2228522, 0, 1, 0.9176471, 1,
-0.006404764, 0.661611, -0.4934748, 0, 1, 0.9215686, 1,
-0.003968699, 1.337775, 1.60043, 0, 1, 0.9294118, 1,
-0.003668034, -0.2863072, -3.027498, 0, 1, 0.9333333, 1,
-0.003144893, -0.2472476, -3.514943, 0, 1, 0.9411765, 1,
-0.002504534, 1.581014, 0.9777476, 0, 1, 0.945098, 1,
-0.002408879, 1.797734, 1.154705, 0, 1, 0.9529412, 1,
-0.0007666735, 0.4271669, 0.8387116, 0, 1, 0.9568627, 1,
0.0003654152, 1.989441, 0.6590508, 0, 1, 0.9647059, 1,
0.0009836673, 1.851744, 0.5398815, 0, 1, 0.9686275, 1,
0.01123086, -1.598352, 4.446249, 0, 1, 0.9764706, 1,
0.01231631, 0.8143125, 0.2607831, 0, 1, 0.9803922, 1,
0.01253419, -0.180893, 2.852989, 0, 1, 0.9882353, 1,
0.01297081, -0.4710156, 2.261405, 0, 1, 0.9921569, 1,
0.01350832, 1.128946, 0.3941551, 0, 1, 1, 1,
0.01576109, -0.3796506, 2.102241, 0, 0.9921569, 1, 1,
0.02757611, 1.625595, -0.5730344, 0, 0.9882353, 1, 1,
0.03059333, 0.7031689, -0.7890118, 0, 0.9803922, 1, 1,
0.03757697, 0.6569022, 0.2402661, 0, 0.9764706, 1, 1,
0.0378825, 0.6458489, -1.895964, 0, 0.9686275, 1, 1,
0.04281758, -0.3089408, 3.257436, 0, 0.9647059, 1, 1,
0.04506876, -0.9518023, 4.711233, 0, 0.9568627, 1, 1,
0.04512854, -0.2845188, 1.654956, 0, 0.9529412, 1, 1,
0.04685282, 0.5359612, 0.4186528, 0, 0.945098, 1, 1,
0.04752062, 1.406368, -0.180995, 0, 0.9411765, 1, 1,
0.05012158, 1.707566, -1.362362, 0, 0.9333333, 1, 1,
0.05091764, -1.614018, 2.648686, 0, 0.9294118, 1, 1,
0.05335199, -2.041636, 3.596348, 0, 0.9215686, 1, 1,
0.05858106, 0.7134309, -0.4152371, 0, 0.9176471, 1, 1,
0.05957077, -0.2632807, 2.990437, 0, 0.9098039, 1, 1,
0.06132158, 1.688169, 0.1269816, 0, 0.9058824, 1, 1,
0.0622039, 0.350682, 0.1962519, 0, 0.8980392, 1, 1,
0.06370748, -0.08350608, 3.576324, 0, 0.8901961, 1, 1,
0.06463566, -1.397745, 4.673666, 0, 0.8862745, 1, 1,
0.06524396, 0.6780285, -0.4048183, 0, 0.8784314, 1, 1,
0.07253975, -0.003413026, 1.354126, 0, 0.8745098, 1, 1,
0.07718429, 0.3262793, 0.07548999, 0, 0.8666667, 1, 1,
0.08367183, 1.660074, -0.6813287, 0, 0.8627451, 1, 1,
0.08620414, -0.8544669, 5.007217, 0, 0.854902, 1, 1,
0.08656333, 0.159183, 1.18465, 0, 0.8509804, 1, 1,
0.09615789, -1.214919, 4.960026, 0, 0.8431373, 1, 1,
0.09819429, 0.6907924, -0.2081866, 0, 0.8392157, 1, 1,
0.0985409, 1.219962, 0.4904896, 0, 0.8313726, 1, 1,
0.09877834, -0.797094, 1.960272, 0, 0.827451, 1, 1,
0.1004417, 1.996766, -0.7781929, 0, 0.8196079, 1, 1,
0.1013203, 0.04464919, -0.5104977, 0, 0.8156863, 1, 1,
0.1018014, -0.7872751, 3.357616, 0, 0.8078431, 1, 1,
0.1047448, -0.07512028, 1.393597, 0, 0.8039216, 1, 1,
0.1090106, -0.5119758, 2.752588, 0, 0.7960784, 1, 1,
0.112963, -0.04440242, 0.9814678, 0, 0.7882353, 1, 1,
0.1131312, -0.1327068, 1.017513, 0, 0.7843137, 1, 1,
0.1132524, -0.1519381, 2.746482, 0, 0.7764706, 1, 1,
0.114734, -0.971921, 3.461641, 0, 0.772549, 1, 1,
0.1173518, -0.1725406, 3.249187, 0, 0.7647059, 1, 1,
0.1184217, 1.796118, 1.575994, 0, 0.7607843, 1, 1,
0.1281731, 0.6599323, 0.8036913, 0, 0.7529412, 1, 1,
0.1302337, -0.1159977, 2.740028, 0, 0.7490196, 1, 1,
0.1307615, -1.452811, 3.057583, 0, 0.7411765, 1, 1,
0.1315776, 0.8078917, 0.2053693, 0, 0.7372549, 1, 1,
0.1322044, 0.27232, 1.619969, 0, 0.7294118, 1, 1,
0.1559882, -1.082179, 3.474509, 0, 0.7254902, 1, 1,
0.1566162, 0.3577709, -0.03694021, 0, 0.7176471, 1, 1,
0.1598645, -0.7597302, 0.9164848, 0, 0.7137255, 1, 1,
0.1627872, 1.758341, 0.03316579, 0, 0.7058824, 1, 1,
0.1636424, -0.5951372, 3.029895, 0, 0.6980392, 1, 1,
0.165004, 0.3653727, -1.290291, 0, 0.6941177, 1, 1,
0.1712412, 0.1664658, -0.1193759, 0, 0.6862745, 1, 1,
0.1748694, -0.5533433, 1.981236, 0, 0.682353, 1, 1,
0.180738, -1.304684, 4.345978, 0, 0.6745098, 1, 1,
0.1936201, 1.17414, 0.5073664, 0, 0.6705883, 1, 1,
0.1958421, -0.08413529, 0.3588454, 0, 0.6627451, 1, 1,
0.1997736, 1.345293, -0.2579319, 0, 0.6588235, 1, 1,
0.2020763, 1.357641, 1.161258, 0, 0.6509804, 1, 1,
0.2107744, -0.385915, 3.862931, 0, 0.6470588, 1, 1,
0.2135986, -0.8329994, 3.683447, 0, 0.6392157, 1, 1,
0.2246414, 0.3185437, 1.240488, 0, 0.6352941, 1, 1,
0.2282871, -1.760197, 2.159801, 0, 0.627451, 1, 1,
0.2339722, -1.446908, 2.36237, 0, 0.6235294, 1, 1,
0.2400085, 0.938467, -0.7941601, 0, 0.6156863, 1, 1,
0.24009, 0.7159997, 2.558989, 0, 0.6117647, 1, 1,
0.2479005, 0.6620514, 0.8788913, 0, 0.6039216, 1, 1,
0.2504849, -0.1010107, 2.157538, 0, 0.5960785, 1, 1,
0.2508518, -0.3564886, 2.150124, 0, 0.5921569, 1, 1,
0.2514377, -0.9885562, 2.726013, 0, 0.5843138, 1, 1,
0.2519866, 0.07888777, -0.0462182, 0, 0.5803922, 1, 1,
0.2534655, 0.1505443, 0.6594678, 0, 0.572549, 1, 1,
0.2542043, -0.4244411, 2.746145, 0, 0.5686275, 1, 1,
0.2547043, -0.1704324, 2.558303, 0, 0.5607843, 1, 1,
0.2631694, 0.03100135, 1.238836, 0, 0.5568628, 1, 1,
0.2695693, -0.9272302, 6.118558, 0, 0.5490196, 1, 1,
0.2746449, -1.049224, 2.647595, 0, 0.5450981, 1, 1,
0.2749428, 0.4925908, 1.262352, 0, 0.5372549, 1, 1,
0.2765553, 0.06055513, 0.04032056, 0, 0.5333334, 1, 1,
0.2806301, 1.075717, -0.8061735, 0, 0.5254902, 1, 1,
0.2813987, -1.178867, 3.688358, 0, 0.5215687, 1, 1,
0.283949, 0.6112672, -0.1675736, 0, 0.5137255, 1, 1,
0.2864534, 0.6709321, -0.05080587, 0, 0.509804, 1, 1,
0.2869016, -2.642055, 2.458482, 0, 0.5019608, 1, 1,
0.2889625, -1.022107, 1.814753, 0, 0.4941176, 1, 1,
0.2991501, -0.135413, 0.07718495, 0, 0.4901961, 1, 1,
0.3024689, 0.5933471, -0.4546345, 0, 0.4823529, 1, 1,
0.3038592, 0.5404083, 0.14357, 0, 0.4784314, 1, 1,
0.3044102, -0.7298994, 1.660301, 0, 0.4705882, 1, 1,
0.3098963, 0.2290695, 0.189498, 0, 0.4666667, 1, 1,
0.3109034, -0.137826, 0.8397267, 0, 0.4588235, 1, 1,
0.3153427, 0.4171622, 1.463413, 0, 0.454902, 1, 1,
0.3156909, -0.4571104, 0.5231687, 0, 0.4470588, 1, 1,
0.3168552, -0.5999022, 4.503239, 0, 0.4431373, 1, 1,
0.3204297, -0.4257948, 3.330789, 0, 0.4352941, 1, 1,
0.3295408, -0.6684433, 1.948853, 0, 0.4313726, 1, 1,
0.331995, -0.1066941, 2.629577, 0, 0.4235294, 1, 1,
0.3336956, -1.130781, 0.9702601, 0, 0.4196078, 1, 1,
0.3362297, -0.05180964, 0.5034593, 0, 0.4117647, 1, 1,
0.3423571, -0.6753993, 2.77727, 0, 0.4078431, 1, 1,
0.3432779, -0.5980848, 1.935909, 0, 0.4, 1, 1,
0.3438391, 0.1056412, 1.046712, 0, 0.3921569, 1, 1,
0.3445805, 0.1961303, 1.354835, 0, 0.3882353, 1, 1,
0.3459689, -0.09796483, 2.601087, 0, 0.3803922, 1, 1,
0.3484311, -0.0189826, 2.085597, 0, 0.3764706, 1, 1,
0.3502839, -0.4476318, 1.307962, 0, 0.3686275, 1, 1,
0.3536412, -1.746385, 2.893908, 0, 0.3647059, 1, 1,
0.3547575, 0.1779176, 1.106129, 0, 0.3568628, 1, 1,
0.355279, 0.8397076, 0.418732, 0, 0.3529412, 1, 1,
0.3583686, -0.2756401, 2.57027, 0, 0.345098, 1, 1,
0.3669214, 0.3467817, 0.6802129, 0, 0.3411765, 1, 1,
0.3674283, -1.469768, 3.205521, 0, 0.3333333, 1, 1,
0.3686512, -0.8065713, 3.312515, 0, 0.3294118, 1, 1,
0.3692707, 0.3244705, -0.994952, 0, 0.3215686, 1, 1,
0.3720189, 0.2922547, 1.000904, 0, 0.3176471, 1, 1,
0.3756526, -0.05921891, 1.615552, 0, 0.3098039, 1, 1,
0.3802151, -0.4204912, 0.6320613, 0, 0.3058824, 1, 1,
0.3837785, 0.2807222, 1.503613, 0, 0.2980392, 1, 1,
0.3840466, 0.5029601, 2.14149, 0, 0.2901961, 1, 1,
0.3866743, 0.1230225, 1.534096, 0, 0.2862745, 1, 1,
0.3929786, -0.656794, 3.330081, 0, 0.2784314, 1, 1,
0.3931874, -1.658719, 2.330163, 0, 0.2745098, 1, 1,
0.3932274, -0.5757624, 1.019915, 0, 0.2666667, 1, 1,
0.3983769, -0.9138416, 1.823985, 0, 0.2627451, 1, 1,
0.4058448, -0.05061692, 1.750641, 0, 0.254902, 1, 1,
0.4070579, 1.447728, 0.4393678, 0, 0.2509804, 1, 1,
0.4114521, -1.032973, 0.9627554, 0, 0.2431373, 1, 1,
0.4147531, -1.425069, 4.397176, 0, 0.2392157, 1, 1,
0.4210087, -0.08981847, 1.593572, 0, 0.2313726, 1, 1,
0.425024, 1.744889, 0.3308931, 0, 0.227451, 1, 1,
0.4281223, 0.1695193, 1.367617, 0, 0.2196078, 1, 1,
0.4282971, 1.219843, 0.8849865, 0, 0.2156863, 1, 1,
0.4298466, 1.299254, 0.9433506, 0, 0.2078431, 1, 1,
0.431101, -1.132358, 2.360812, 0, 0.2039216, 1, 1,
0.4323078, 1.898607, 1.083275, 0, 0.1960784, 1, 1,
0.4325412, 0.04841017, 2.145033, 0, 0.1882353, 1, 1,
0.443164, -0.1313072, 0.7941769, 0, 0.1843137, 1, 1,
0.449443, 0.3344147, 1.415179, 0, 0.1764706, 1, 1,
0.453447, -0.4561653, 1.040802, 0, 0.172549, 1, 1,
0.4545781, 0.2174755, 0.374696, 0, 0.1647059, 1, 1,
0.4619675, -0.9968821, 2.241165, 0, 0.1607843, 1, 1,
0.4643716, -0.3992861, 2.576758, 0, 0.1529412, 1, 1,
0.4648445, -0.03616103, 1.811894, 0, 0.1490196, 1, 1,
0.4672286, -0.3942675, 1.69578, 0, 0.1411765, 1, 1,
0.4746701, 1.59479, 1.153407, 0, 0.1372549, 1, 1,
0.4751392, -0.3363159, 2.771652, 0, 0.1294118, 1, 1,
0.4777831, 0.5518148, 0.8714615, 0, 0.1254902, 1, 1,
0.4811651, -1.718604, 3.817894, 0, 0.1176471, 1, 1,
0.4865791, 0.2250986, 0.6949674, 0, 0.1137255, 1, 1,
0.4895585, 0.6791044, 1.587519, 0, 0.1058824, 1, 1,
0.4903085, 1.452079, 0.8003245, 0, 0.09803922, 1, 1,
0.4906085, -1.069795, 1.252809, 0, 0.09411765, 1, 1,
0.4918186, 0.4254481, -1.170295, 0, 0.08627451, 1, 1,
0.4926716, -0.1959223, 2.160016, 0, 0.08235294, 1, 1,
0.4960087, 1.21976, 0.1149278, 0, 0.07450981, 1, 1,
0.5035487, -0.1198831, 0.9309151, 0, 0.07058824, 1, 1,
0.5084636, -0.1656017, 0.7659339, 0, 0.0627451, 1, 1,
0.5100623, -0.252644, 1.068398, 0, 0.05882353, 1, 1,
0.511403, 0.806378, 0.497582, 0, 0.05098039, 1, 1,
0.5139124, 0.462413, 2.244424, 0, 0.04705882, 1, 1,
0.5162063, 0.2421563, 0.6056147, 0, 0.03921569, 1, 1,
0.5262739, -1.311386, 1.544498, 0, 0.03529412, 1, 1,
0.5270655, 1.221149, 2.018743, 0, 0.02745098, 1, 1,
0.5280786, -1.938337, 1.601725, 0, 0.02352941, 1, 1,
0.5289744, 0.08704793, 0.8907498, 0, 0.01568628, 1, 1,
0.5301438, 1.773477, 1.19404, 0, 0.01176471, 1, 1,
0.5303706, -1.198445, 2.759085, 0, 0.003921569, 1, 1,
0.5316239, -0.5054113, 2.348648, 0.003921569, 0, 1, 1,
0.5325837, 1.647323, 1.664609, 0.007843138, 0, 1, 1,
0.5343027, 0.5374379, 0.5339431, 0.01568628, 0, 1, 1,
0.5376427, 0.4359652, 1.155713, 0.01960784, 0, 1, 1,
0.5391179, -1.789475, 3.507903, 0.02745098, 0, 1, 1,
0.5397995, -0.7260413, 2.942964, 0.03137255, 0, 1, 1,
0.5445195, 0.6138983, 3.058151, 0.03921569, 0, 1, 1,
0.5510055, -0.4886456, 2.142748, 0.04313726, 0, 1, 1,
0.5538411, 0.1122797, 1.453342, 0.05098039, 0, 1, 1,
0.5550172, -0.9324976, 4.025428, 0.05490196, 0, 1, 1,
0.5562217, 0.1913619, 1.771124, 0.0627451, 0, 1, 1,
0.5577471, 0.2917947, -0.3154954, 0.06666667, 0, 1, 1,
0.5607945, 0.2453243, 1.505371, 0.07450981, 0, 1, 1,
0.5626085, -0.6015912, 3.203817, 0.07843138, 0, 1, 1,
0.5658575, 0.6949819, 0.1038403, 0.08627451, 0, 1, 1,
0.5659896, 0.6768607, 0.08934672, 0.09019608, 0, 1, 1,
0.5666618, 0.005803295, 0.8329319, 0.09803922, 0, 1, 1,
0.5669205, -1.560701, 0.909723, 0.1058824, 0, 1, 1,
0.5698812, -2.243263, 2.380346, 0.1098039, 0, 1, 1,
0.5762098, 0.09906895, -0.09810208, 0.1176471, 0, 1, 1,
0.5843134, -0.4491115, 2.331821, 0.1215686, 0, 1, 1,
0.5956967, 0.5568004, 0.9996113, 0.1294118, 0, 1, 1,
0.5958928, -0.01993442, 1.330791, 0.1333333, 0, 1, 1,
0.5962301, 0.3648068, 0.3521968, 0.1411765, 0, 1, 1,
0.59893, -0.5971289, 4.309523, 0.145098, 0, 1, 1,
0.6002985, 0.6729254, 1.798552, 0.1529412, 0, 1, 1,
0.6006975, 0.41594, 1.328053, 0.1568628, 0, 1, 1,
0.6085065, -1.385432, 3.162345, 0.1647059, 0, 1, 1,
0.6123934, -0.5203863, 3.586031, 0.1686275, 0, 1, 1,
0.6133311, -1.4669, 3.108387, 0.1764706, 0, 1, 1,
0.6141122, -0.3839162, 2.73565, 0.1803922, 0, 1, 1,
0.6158362, 0.8193406, 0.7733573, 0.1882353, 0, 1, 1,
0.6162073, 0.8694229, 0.5909196, 0.1921569, 0, 1, 1,
0.6168767, 0.370667, 1.157578, 0.2, 0, 1, 1,
0.6210801, -1.07602, 1.138298, 0.2078431, 0, 1, 1,
0.6216916, 1.449999, 2.91554, 0.2117647, 0, 1, 1,
0.6219335, -0.3798824, 0.7986944, 0.2196078, 0, 1, 1,
0.6225243, 1.066635, 1.309101, 0.2235294, 0, 1, 1,
0.6257313, -0.797044, 1.846684, 0.2313726, 0, 1, 1,
0.6311072, 0.6913281, 1.799996, 0.2352941, 0, 1, 1,
0.6321495, -1.32592, 1.310695, 0.2431373, 0, 1, 1,
0.6326711, 0.5141901, 0.1573644, 0.2470588, 0, 1, 1,
0.6330286, -0.2094039, 1.578682, 0.254902, 0, 1, 1,
0.6354855, -0.3260323, 2.050121, 0.2588235, 0, 1, 1,
0.6359189, 1.065878, 0.2847628, 0.2666667, 0, 1, 1,
0.6363746, -0.3635971, 3.095421, 0.2705882, 0, 1, 1,
0.6368393, -0.2484453, 4.17085, 0.2784314, 0, 1, 1,
0.6377558, -1.31407, 2.747279, 0.282353, 0, 1, 1,
0.6400023, 0.3487084, 1.212117, 0.2901961, 0, 1, 1,
0.6438063, -0.03670199, 2.270834, 0.2941177, 0, 1, 1,
0.6468087, 0.06033638, 3.624654, 0.3019608, 0, 1, 1,
0.6481717, 0.08654997, 2.129627, 0.3098039, 0, 1, 1,
0.6511244, -1.155071, 1.608446, 0.3137255, 0, 1, 1,
0.6601641, 0.7203405, -0.8307548, 0.3215686, 0, 1, 1,
0.6612315, -0.290436, 2.964394, 0.3254902, 0, 1, 1,
0.6634508, 0.6334344, 0.3960409, 0.3333333, 0, 1, 1,
0.6668782, 0.3732153, -0.5247136, 0.3372549, 0, 1, 1,
0.66751, 0.0849909, 1.192101, 0.345098, 0, 1, 1,
0.6772469, 0.09349135, 0.9736017, 0.3490196, 0, 1, 1,
0.6800632, 1.134332, 1.124134, 0.3568628, 0, 1, 1,
0.6866266, -0.3807313, 1.109009, 0.3607843, 0, 1, 1,
0.6918727, -1.981986, 3.903838, 0.3686275, 0, 1, 1,
0.6966001, 0.6181564, -0.00667759, 0.372549, 0, 1, 1,
0.7050323, 0.5224558, 1.301894, 0.3803922, 0, 1, 1,
0.7058845, 0.523366, -0.4630622, 0.3843137, 0, 1, 1,
0.7084219, 1.591829, -0.7272127, 0.3921569, 0, 1, 1,
0.7130681, 0.2412856, 0.3023245, 0.3960784, 0, 1, 1,
0.7182966, 0.0614362, 2.376416, 0.4039216, 0, 1, 1,
0.7189552, -1.02117, 1.478978, 0.4117647, 0, 1, 1,
0.7208073, 1.706823, 0.1330586, 0.4156863, 0, 1, 1,
0.7264455, -1.513067, 3.053203, 0.4235294, 0, 1, 1,
0.7270502, 0.4465251, 0.4252758, 0.427451, 0, 1, 1,
0.7317848, -0.7606462, 3.161026, 0.4352941, 0, 1, 1,
0.7321414, 0.05371648, 0.8866985, 0.4392157, 0, 1, 1,
0.7343877, -0.5533873, 2.379045, 0.4470588, 0, 1, 1,
0.7374679, 0.7331745, 0.4853531, 0.4509804, 0, 1, 1,
0.7412495, -1.03684, 2.471839, 0.4588235, 0, 1, 1,
0.7416605, 0.5628277, -0.1844725, 0.4627451, 0, 1, 1,
0.7426786, -1.9849, 2.610241, 0.4705882, 0, 1, 1,
0.7434167, 0.686146, -0.2765771, 0.4745098, 0, 1, 1,
0.7464477, -1.363926, 3.08917, 0.4823529, 0, 1, 1,
0.7619119, 0.1982059, -0.4301446, 0.4862745, 0, 1, 1,
0.7619792, -0.204622, 1.624083, 0.4941176, 0, 1, 1,
0.7665951, 0.5873315, -0.3098733, 0.5019608, 0, 1, 1,
0.7673717, -0.5025184, 0.6313034, 0.5058824, 0, 1, 1,
0.7717784, -0.9186925, 1.266299, 0.5137255, 0, 1, 1,
0.7770663, -0.3298272, 1.665601, 0.5176471, 0, 1, 1,
0.7770974, -1.877546, 2.996675, 0.5254902, 0, 1, 1,
0.7793288, 0.02237178, 2.092792, 0.5294118, 0, 1, 1,
0.7803631, 0.3546131, -0.4422808, 0.5372549, 0, 1, 1,
0.7815482, -0.5366929, 2.533179, 0.5411765, 0, 1, 1,
0.7854201, -0.2257585, 2.311141, 0.5490196, 0, 1, 1,
0.7882345, 0.6969942, 0.6030275, 0.5529412, 0, 1, 1,
0.7885813, 2.560465, 1.206518, 0.5607843, 0, 1, 1,
0.7890288, 0.1853873, 2.822009, 0.5647059, 0, 1, 1,
0.7900143, -1.187025, 2.941984, 0.572549, 0, 1, 1,
0.7910079, -1.814404, 3.381428, 0.5764706, 0, 1, 1,
0.7914573, 0.9099994, 1.618219, 0.5843138, 0, 1, 1,
0.7967321, -1.233856, 3.627773, 0.5882353, 0, 1, 1,
0.8019792, 0.6282663, -0.3926385, 0.5960785, 0, 1, 1,
0.8060548, 1.982338, 1.074437, 0.6039216, 0, 1, 1,
0.8064316, -0.9965758, 4.067062, 0.6078432, 0, 1, 1,
0.8067981, 0.4784254, 1.337809, 0.6156863, 0, 1, 1,
0.811178, -1.073645, 2.171471, 0.6196079, 0, 1, 1,
0.816307, 0.9764693, 0.8359122, 0.627451, 0, 1, 1,
0.8192261, -0.3342425, 1.813135, 0.6313726, 0, 1, 1,
0.8221148, 0.5974063, 1.854966, 0.6392157, 0, 1, 1,
0.8237185, 0.6543601, 0.5446423, 0.6431373, 0, 1, 1,
0.825931, 0.6408726, -0.8789651, 0.6509804, 0, 1, 1,
0.8294553, 0.2228279, 0.9704436, 0.654902, 0, 1, 1,
0.8307056, -0.0194468, 1.059637, 0.6627451, 0, 1, 1,
0.831503, -0.7341077, 3.620571, 0.6666667, 0, 1, 1,
0.8327096, 0.06078823, 1.247993, 0.6745098, 0, 1, 1,
0.8330935, 0.4419777, 1.032355, 0.6784314, 0, 1, 1,
0.8336925, 0.193789, 2.363476, 0.6862745, 0, 1, 1,
0.8388225, 0.05432211, 0.9940348, 0.6901961, 0, 1, 1,
0.8394725, -0.04311033, 1.56644, 0.6980392, 0, 1, 1,
0.8468013, 3.088593, -0.3576051, 0.7058824, 0, 1, 1,
0.8501602, -0.4666571, 2.094939, 0.7098039, 0, 1, 1,
0.8605214, 1.53636, -1.397081, 0.7176471, 0, 1, 1,
0.8675313, -0.5909557, 1.795335, 0.7215686, 0, 1, 1,
0.8678656, 2.200507, 0.6799567, 0.7294118, 0, 1, 1,
0.8726105, 0.8519599, -0.5408791, 0.7333333, 0, 1, 1,
0.8756432, 0.2420137, 1.028859, 0.7411765, 0, 1, 1,
0.8768465, 1.00104, -0.1597074, 0.7450981, 0, 1, 1,
0.8831059, 0.09692885, 1.041782, 0.7529412, 0, 1, 1,
0.8837402, -1.827651, 2.502791, 0.7568628, 0, 1, 1,
0.8844171, 0.1115741, 0.7545501, 0.7647059, 0, 1, 1,
0.8912166, 0.1136411, 1.037502, 0.7686275, 0, 1, 1,
0.894839, -0.02681347, 1.48806, 0.7764706, 0, 1, 1,
0.8979172, 0.8461046, 1.896925, 0.7803922, 0, 1, 1,
0.9002318, -1.260701, 2.44495, 0.7882353, 0, 1, 1,
0.9042949, -0.1255396, 0.6735215, 0.7921569, 0, 1, 1,
0.9058278, 0.08496415, -0.2726649, 0.8, 0, 1, 1,
0.91146, 0.08720918, 0.8422442, 0.8078431, 0, 1, 1,
0.9115082, -0.02702182, 3.462605, 0.8117647, 0, 1, 1,
0.9130944, -2.857462, 3.839945, 0.8196079, 0, 1, 1,
0.9150056, -0.1530045, 0.7272909, 0.8235294, 0, 1, 1,
0.9223977, 0.06731128, 0.3765411, 0.8313726, 0, 1, 1,
0.9248608, 0.7410724, -0.4557208, 0.8352941, 0, 1, 1,
0.9251832, -1.905875, 3.685148, 0.8431373, 0, 1, 1,
0.9339597, -0.2278295, 1.797207, 0.8470588, 0, 1, 1,
0.9386021, 0.4343415, -0.02923323, 0.854902, 0, 1, 1,
0.9395069, 2.052803, 0.4994342, 0.8588235, 0, 1, 1,
0.9401794, 0.2513436, -0.4397337, 0.8666667, 0, 1, 1,
0.9425022, 0.9643412, -0.2868511, 0.8705882, 0, 1, 1,
0.9469305, -1.977572, 1.060585, 0.8784314, 0, 1, 1,
0.9503041, -0.2990082, 1.646189, 0.8823529, 0, 1, 1,
0.9516641, -0.5831105, 2.465539, 0.8901961, 0, 1, 1,
0.9517865, 0.1991893, 1.944213, 0.8941177, 0, 1, 1,
0.9520577, 0.1288502, 4.43665, 0.9019608, 0, 1, 1,
0.952527, 0.3942561, 0.3476372, 0.9098039, 0, 1, 1,
0.9631261, -0.5658175, 2.344216, 0.9137255, 0, 1, 1,
0.9646876, 0.7487907, 1.423495, 0.9215686, 0, 1, 1,
0.9667117, -0.7553749, 1.625019, 0.9254902, 0, 1, 1,
0.9680693, 1.101914, 0.9221118, 0.9333333, 0, 1, 1,
0.9702078, -1.649426, 0.3270621, 0.9372549, 0, 1, 1,
0.9741219, 0.285083, 1.833071, 0.945098, 0, 1, 1,
0.9746501, 0.3994124, 1.653581, 0.9490196, 0, 1, 1,
0.9793053, 1.452703, -2.326624, 0.9568627, 0, 1, 1,
0.9796525, 0.4257054, 2.758776, 0.9607843, 0, 1, 1,
0.9820923, -1.545134, 0.4373331, 0.9686275, 0, 1, 1,
0.990846, -0.5818464, 1.98398, 0.972549, 0, 1, 1,
0.9933975, -0.3920628, 3.160791, 0.9803922, 0, 1, 1,
0.9982994, -0.538597, 2.459606, 0.9843137, 0, 1, 1,
0.9984164, -0.03260351, 1.466985, 0.9921569, 0, 1, 1,
0.9988481, -0.266475, 0.5802289, 0.9960784, 0, 1, 1,
0.9999264, 0.8791496, -1.281096, 1, 0, 0.9960784, 1,
1.002408, 1.463492, 0.9223411, 1, 0, 0.9882353, 1,
1.002852, 0.372686, 3.029449, 1, 0, 0.9843137, 1,
1.003075, 0.5142604, -0.08271064, 1, 0, 0.9764706, 1,
1.005787, 0.6030107, 1.600603, 1, 0, 0.972549, 1,
1.006361, 0.6957814, 0.5448788, 1, 0, 0.9647059, 1,
1.010014, 0.1153075, 1.339416, 1, 0, 0.9607843, 1,
1.012475, -0.2795875, 2.590618, 1, 0, 0.9529412, 1,
1.014641, 1.302258, 0.8000177, 1, 0, 0.9490196, 1,
1.019716, 0.2387737, 0.7905021, 1, 0, 0.9411765, 1,
1.02062, -2.173777, 4.289534, 1, 0, 0.9372549, 1,
1.022564, 1.329665, -1.076793, 1, 0, 0.9294118, 1,
1.041007, -1.518574, 3.449685, 1, 0, 0.9254902, 1,
1.042447, 0.271417, 0.4580373, 1, 0, 0.9176471, 1,
1.043843, 1.387682, 1.378095, 1, 0, 0.9137255, 1,
1.054589, 0.1580159, 2.544816, 1, 0, 0.9058824, 1,
1.068081, 2.08037, 0.2784733, 1, 0, 0.9019608, 1,
1.075551, -1.032756, 2.963018, 1, 0, 0.8941177, 1,
1.075681, 1.244483, 1.256308, 1, 0, 0.8862745, 1,
1.075816, 0.1366743, 2.340916, 1, 0, 0.8823529, 1,
1.085532, 0.6371773, 0.5168672, 1, 0, 0.8745098, 1,
1.086841, -0.2084192, 0.3734768, 1, 0, 0.8705882, 1,
1.089989, 0.3687062, 1.90535, 1, 0, 0.8627451, 1,
1.091753, 1.274603, 1.532416, 1, 0, 0.8588235, 1,
1.11268, -1.236458, 0.877799, 1, 0, 0.8509804, 1,
1.114911, 0.9433028, 0.4141383, 1, 0, 0.8470588, 1,
1.12071, -1.93268, 1.959642, 1, 0, 0.8392157, 1,
1.12371, 2.43376, 0.1315634, 1, 0, 0.8352941, 1,
1.128981, 0.7698236, -0.5804353, 1, 0, 0.827451, 1,
1.135279, -1.409866, 1.485624, 1, 0, 0.8235294, 1,
1.147724, 0.05559886, 1.865472, 1, 0, 0.8156863, 1,
1.15097, -0.5236055, 1.983798, 1, 0, 0.8117647, 1,
1.155913, 0.01473885, 1.436133, 1, 0, 0.8039216, 1,
1.15666, -0.3033347, 2.332257, 1, 0, 0.7960784, 1,
1.159164, -0.6670234, 0.4793027, 1, 0, 0.7921569, 1,
1.160736, -0.04584545, 0.3454605, 1, 0, 0.7843137, 1,
1.175984, -0.4241837, 2.574306, 1, 0, 0.7803922, 1,
1.181231, 1.734386, 0.07221665, 1, 0, 0.772549, 1,
1.184563, -0.9315311, 4.734483, 1, 0, 0.7686275, 1,
1.189602, 1.680427, 0.4130463, 1, 0, 0.7607843, 1,
1.189618, 0.0007924653, 1.508418, 1, 0, 0.7568628, 1,
1.19839, 0.4146445, 0.7400697, 1, 0, 0.7490196, 1,
1.200939, -1.231918, 3.213494, 1, 0, 0.7450981, 1,
1.20153, -0.7995433, 2.454602, 1, 0, 0.7372549, 1,
1.202362, -0.8536452, 2.168698, 1, 0, 0.7333333, 1,
1.215136, 0.7052781, 1.997776, 1, 0, 0.7254902, 1,
1.217059, 0.8460896, 2.277767, 1, 0, 0.7215686, 1,
1.217295, 0.1131377, 1.940329, 1, 0, 0.7137255, 1,
1.222871, -0.2637767, -0.03916072, 1, 0, 0.7098039, 1,
1.225034, 1.602403, 1.202685, 1, 0, 0.7019608, 1,
1.231049, 0.7547958, 1.52178, 1, 0, 0.6941177, 1,
1.235253, -2.889922, 2.604803, 1, 0, 0.6901961, 1,
1.241411, -0.356749, 2.465174, 1, 0, 0.682353, 1,
1.245373, 0.4934424, 0.370083, 1, 0, 0.6784314, 1,
1.248006, -0.2202068, 2.891404, 1, 0, 0.6705883, 1,
1.259823, -0.6019652, 4.254414, 1, 0, 0.6666667, 1,
1.262856, 0.4906008, 2.068291, 1, 0, 0.6588235, 1,
1.26748, -2.146786, 2.535772, 1, 0, 0.654902, 1,
1.268793, 1.337336, 2.122426, 1, 0, 0.6470588, 1,
1.269801, -0.206294, 1.229858, 1, 0, 0.6431373, 1,
1.275789, -0.5683251, 2.154928, 1, 0, 0.6352941, 1,
1.277238, -0.245459, 1.024507, 1, 0, 0.6313726, 1,
1.293395, -2.34027, 1.519111, 1, 0, 0.6235294, 1,
1.314131, 1.199723, 0.8324441, 1, 0, 0.6196079, 1,
1.316008, 1.134169, 0.868003, 1, 0, 0.6117647, 1,
1.323165, -1.487245, 2.948988, 1, 0, 0.6078432, 1,
1.327699, -1.513104, 1.97073, 1, 0, 0.6, 1,
1.328108, 0.7332013, 1.517785, 1, 0, 0.5921569, 1,
1.332292, -1.377753, 2.46559, 1, 0, 0.5882353, 1,
1.335477, 0.03600615, 0.3030331, 1, 0, 0.5803922, 1,
1.349028, 0.3945032, 0.04968496, 1, 0, 0.5764706, 1,
1.350554, -1.860175, 3.405186, 1, 0, 0.5686275, 1,
1.351292, -1.333341, 2.642335, 1, 0, 0.5647059, 1,
1.353501, 0.4224072, 1.058305, 1, 0, 0.5568628, 1,
1.355019, -0.1147118, 1.65232, 1, 0, 0.5529412, 1,
1.365117, 1.367594, 1.537548, 1, 0, 0.5450981, 1,
1.366212, -1.572743, 1.31487, 1, 0, 0.5411765, 1,
1.371927, 0.1827319, 1.877754, 1, 0, 0.5333334, 1,
1.373815, 0.1876422, 1.659494, 1, 0, 0.5294118, 1,
1.37417, 0.975221, 1.832246, 1, 0, 0.5215687, 1,
1.398011, 0.4742975, 0.7498579, 1, 0, 0.5176471, 1,
1.424507, 0.3045242, 1.036143, 1, 0, 0.509804, 1,
1.427586, 0.7370197, 0.1584931, 1, 0, 0.5058824, 1,
1.430971, 1.292543, 0.5157309, 1, 0, 0.4980392, 1,
1.437248, -0.5412561, 1.585433, 1, 0, 0.4901961, 1,
1.439054, -0.6670431, 1.610716, 1, 0, 0.4862745, 1,
1.439907, -0.1779646, 2.397602, 1, 0, 0.4784314, 1,
1.440556, -1.15044, 2.242756, 1, 0, 0.4745098, 1,
1.442887, 1.276969, 0.4303406, 1, 0, 0.4666667, 1,
1.447854, 0.296716, 1.32075, 1, 0, 0.4627451, 1,
1.453596, 0.9466532, 1.445096, 1, 0, 0.454902, 1,
1.453884, 1.570441, 0.6048721, 1, 0, 0.4509804, 1,
1.464364, -1.687112, 1.670985, 1, 0, 0.4431373, 1,
1.466898, 0.7163956, -0.8048113, 1, 0, 0.4392157, 1,
1.469385, 0.8738959, 1.786788, 1, 0, 0.4313726, 1,
1.513027, -1.155282, 2.007384, 1, 0, 0.427451, 1,
1.528246, 0.4749905, 0.6554579, 1, 0, 0.4196078, 1,
1.538264, -0.09256112, 1.994821, 1, 0, 0.4156863, 1,
1.545439, 0.5327619, 0.3892906, 1, 0, 0.4078431, 1,
1.551786, -1.176821, 1.669928, 1, 0, 0.4039216, 1,
1.570235, -0.8108033, 1.263615, 1, 0, 0.3960784, 1,
1.571888, 1.281085, 0.5659307, 1, 0, 0.3882353, 1,
1.576652, 0.1936745, 0.9557007, 1, 0, 0.3843137, 1,
1.578834, 1.228752, 0.9315399, 1, 0, 0.3764706, 1,
1.580878, -0.2491926, 2.358787, 1, 0, 0.372549, 1,
1.583105, 0.6861832, 0.3028104, 1, 0, 0.3647059, 1,
1.587767, -0.7754845, 2.50699, 1, 0, 0.3607843, 1,
1.587999, 0.436893, 0.7437139, 1, 0, 0.3529412, 1,
1.618721, 0.03702917, 1.27022, 1, 0, 0.3490196, 1,
1.620738, -1.172348, 1.466341, 1, 0, 0.3411765, 1,
1.623963, -0.8703982, 1.407676, 1, 0, 0.3372549, 1,
1.648609, -1.769834, 2.241822, 1, 0, 0.3294118, 1,
1.673033, -0.02866951, 1.901745, 1, 0, 0.3254902, 1,
1.692251, -0.8130204, 1.803679, 1, 0, 0.3176471, 1,
1.703091, 1.329415, 2.441589, 1, 0, 0.3137255, 1,
1.703107, -1.15238, 2.721031, 1, 0, 0.3058824, 1,
1.733389, 0.9952773, 0.4567849, 1, 0, 0.2980392, 1,
1.740143, 0.7097887, 0.9090217, 1, 0, 0.2941177, 1,
1.768686, -0.4941142, 1.75153, 1, 0, 0.2862745, 1,
1.777394, -0.559002, 0.1046507, 1, 0, 0.282353, 1,
1.793597, 1.015429, 0.2301159, 1, 0, 0.2745098, 1,
1.813401, -0.7241005, 2.946164, 1, 0, 0.2705882, 1,
1.83258, 1.360678, 0.855105, 1, 0, 0.2627451, 1,
1.842804, -0.2265324, 0.8607997, 1, 0, 0.2588235, 1,
1.848675, -1.282954, 0.1926758, 1, 0, 0.2509804, 1,
1.852492, 0.8075629, -0.1573175, 1, 0, 0.2470588, 1,
1.866857, -0.1388435, 3.255108, 1, 0, 0.2392157, 1,
1.86893, -0.2182829, 0.5294449, 1, 0, 0.2352941, 1,
1.8856, -0.3889553, 0.9210256, 1, 0, 0.227451, 1,
1.900898, -0.2489065, 1.210445, 1, 0, 0.2235294, 1,
1.905752, -1.038241, 0.6080564, 1, 0, 0.2156863, 1,
1.907047, 0.5236704, 2.683037, 1, 0, 0.2117647, 1,
1.920076, -1.93039, 3.382183, 1, 0, 0.2039216, 1,
1.935777, -0.4886069, 1.062168, 1, 0, 0.1960784, 1,
1.93588, -0.5838132, 1.992601, 1, 0, 0.1921569, 1,
1.936565, -0.2096603, 2.300479, 1, 0, 0.1843137, 1,
1.953563, -0.2774316, 0.7920199, 1, 0, 0.1803922, 1,
1.959672, 1.138331, 0.748474, 1, 0, 0.172549, 1,
1.978368, 0.3139631, 0.3209096, 1, 0, 0.1686275, 1,
1.979579, 1.138939, 2.504079, 1, 0, 0.1607843, 1,
2.004126, -1.269026, 2.753803, 1, 0, 0.1568628, 1,
2.019499, -0.9418653, 2.480833, 1, 0, 0.1490196, 1,
2.025615, -1.249821, 1.651312, 1, 0, 0.145098, 1,
2.044762, 0.2011561, 0.9578185, 1, 0, 0.1372549, 1,
2.072941, 0.1047695, 1.325732, 1, 0, 0.1333333, 1,
2.077291, 0.3266592, 1.006155, 1, 0, 0.1254902, 1,
2.115055, -1.277866, 2.898288, 1, 0, 0.1215686, 1,
2.142348, 1.166163, 1.38334, 1, 0, 0.1137255, 1,
2.149274, -1.499275, 0.9403799, 1, 0, 0.1098039, 1,
2.185578, -1.007605, 2.425036, 1, 0, 0.1019608, 1,
2.262768, -0.6885251, 3.770548, 1, 0, 0.09411765, 1,
2.264746, -1.434786, 1.838519, 1, 0, 0.09019608, 1,
2.264787, -0.1942424, 3.411808, 1, 0, 0.08235294, 1,
2.286573, -0.4686753, 2.484862, 1, 0, 0.07843138, 1,
2.320747, 1.468043, -1.352926, 1, 0, 0.07058824, 1,
2.449751, 1.053904, 1.555936, 1, 0, 0.06666667, 1,
2.49119, -0.6692731, 1.682663, 1, 0, 0.05882353, 1,
2.591602, 3.042733, -1.036715, 1, 0, 0.05490196, 1,
2.676883, -0.878616, 1.918365, 1, 0, 0.04705882, 1,
2.7168, -0.438933, 2.002813, 1, 0, 0.04313726, 1,
2.856714, -0.1323945, 2.097532, 1, 0, 0.03529412, 1,
2.885311, 0.7004258, 0.8510246, 1, 0, 0.03137255, 1,
3.065265, -0.5835606, 2.174321, 1, 0, 0.02352941, 1,
3.086211, -0.8482593, 1.618678, 1, 0, 0.01960784, 1,
3.215896, -0.802926, 1.505467, 1, 0, 0.01176471, 1,
3.259477, -0.21272, 1.468869, 1, 0, 0.007843138, 1
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
0.2271975, -3.990111, -7.526065, 0, -0.5, 0.5, 0.5,
0.2271975, -3.990111, -7.526065, 1, -0.5, 0.5, 0.5,
0.2271975, -3.990111, -7.526065, 1, 1.5, 0.5, 0.5,
0.2271975, -3.990111, -7.526065, 0, 1.5, 0.5, 0.5
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
-3.833024, 0.3554714, -7.526065, 0, -0.5, 0.5, 0.5,
-3.833024, 0.3554714, -7.526065, 1, -0.5, 0.5, 0.5,
-3.833024, 0.3554714, -7.526065, 1, 1.5, 0.5, 0.5,
-3.833024, 0.3554714, -7.526065, 0, 1.5, 0.5, 0.5
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
-3.833024, -3.990111, 0.2850299, 0, -0.5, 0.5, 0.5,
-3.833024, -3.990111, 0.2850299, 1, -0.5, 0.5, 0.5,
-3.833024, -3.990111, 0.2850299, 1, 1.5, 0.5, 0.5,
-3.833024, -3.990111, 0.2850299, 0, 1.5, 0.5, 0.5
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
-2, -2.987284, -5.723505,
3, -2.987284, -5.723505,
-2, -2.987284, -5.723505,
-2, -3.154422, -6.023931,
-1, -2.987284, -5.723505,
-1, -3.154422, -6.023931,
0, -2.987284, -5.723505,
0, -3.154422, -6.023931,
1, -2.987284, -5.723505,
1, -3.154422, -6.023931,
2, -2.987284, -5.723505,
2, -3.154422, -6.023931,
3, -2.987284, -5.723505,
3, -3.154422, -6.023931
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
-2, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
-2, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
-2, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
-2, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5,
-1, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
-1, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
-1, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
-1, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5,
0, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
0, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
0, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
0, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5,
1, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
1, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
1, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
1, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5,
2, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
2, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
2, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
2, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5,
3, -3.488698, -6.624784, 0, -0.5, 0.5, 0.5,
3, -3.488698, -6.624784, 1, -0.5, 0.5, 0.5,
3, -3.488698, -6.624784, 1, 1.5, 0.5, 0.5,
3, -3.488698, -6.624784, 0, 1.5, 0.5, 0.5
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
-2.89605, -2, -5.723505,
-2.89605, 3, -5.723505,
-2.89605, -2, -5.723505,
-3.052212, -2, -6.023931,
-2.89605, -1, -5.723505,
-3.052212, -1, -6.023931,
-2.89605, 0, -5.723505,
-3.052212, 0, -6.023931,
-2.89605, 1, -5.723505,
-3.052212, 1, -6.023931,
-2.89605, 2, -5.723505,
-3.052212, 2, -6.023931,
-2.89605, 3, -5.723505,
-3.052212, 3, -6.023931
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
-3.364537, -2, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, -2, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, -2, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, -2, -6.624784, 0, 1.5, 0.5, 0.5,
-3.364537, -1, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, -1, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, -1, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, -1, -6.624784, 0, 1.5, 0.5, 0.5,
-3.364537, 0, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, 0, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, 0, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, 0, -6.624784, 0, 1.5, 0.5, 0.5,
-3.364537, 1, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, 1, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, 1, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, 1, -6.624784, 0, 1.5, 0.5, 0.5,
-3.364537, 2, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, 2, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, 2, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, 2, -6.624784, 0, 1.5, 0.5, 0.5,
-3.364537, 3, -6.624784, 0, -0.5, 0.5, 0.5,
-3.364537, 3, -6.624784, 1, -0.5, 0.5, 0.5,
-3.364537, 3, -6.624784, 1, 1.5, 0.5, 0.5,
-3.364537, 3, -6.624784, 0, 1.5, 0.5, 0.5
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
-2.89605, -2.987284, -4,
-2.89605, -2.987284, 6,
-2.89605, -2.987284, -4,
-3.052212, -3.154422, -4,
-2.89605, -2.987284, -2,
-3.052212, -3.154422, -2,
-2.89605, -2.987284, 0,
-3.052212, -3.154422, 0,
-2.89605, -2.987284, 2,
-3.052212, -3.154422, 2,
-2.89605, -2.987284, 4,
-3.052212, -3.154422, 4,
-2.89605, -2.987284, 6,
-3.052212, -3.154422, 6
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
-3.364537, -3.488698, -4, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, -4, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, -4, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, -4, 0, 1.5, 0.5, 0.5,
-3.364537, -3.488698, -2, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, -2, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, -2, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, -2, 0, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 0, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 0, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 0, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 0, 0, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 2, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 2, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 2, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 2, 0, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 4, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 4, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 4, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 4, 0, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 6, 0, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 6, 1, -0.5, 0.5, 0.5,
-3.364537, -3.488698, 6, 1, 1.5, 0.5, 0.5,
-3.364537, -3.488698, 6, 0, 1.5, 0.5, 0.5
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
-2.89605, -2.987284, -5.723505,
-2.89605, 3.698227, -5.723505,
-2.89605, -2.987284, 6.293564,
-2.89605, 3.698227, 6.293564,
-2.89605, -2.987284, -5.723505,
-2.89605, -2.987284, 6.293564,
-2.89605, 3.698227, -5.723505,
-2.89605, 3.698227, 6.293564,
-2.89605, -2.987284, -5.723505,
3.350445, -2.987284, -5.723505,
-2.89605, -2.987284, 6.293564,
3.350445, -2.987284, 6.293564,
-2.89605, 3.698227, -5.723505,
3.350445, 3.698227, -5.723505,
-2.89605, 3.698227, 6.293564,
3.350445, 3.698227, 6.293564,
3.350445, -2.987284, -5.723505,
3.350445, 3.698227, -5.723505,
3.350445, -2.987284, 6.293564,
3.350445, 3.698227, 6.293564,
3.350445, -2.987284, -5.723505,
3.350445, -2.987284, 6.293564,
3.350445, 3.698227, -5.723505,
3.350445, 3.698227, 6.293564
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
var radius = 8.065135;
var distance = 35.88269;
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
mvMatrix.translate( -0.2271975, -0.3554714, -0.2850299 );
mvMatrix.scale( 1.396012, 1.30434, 0.7256497 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.88269);
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
bensulfuron-methyl<-read.table("bensulfuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bensulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
```

```r
y<-bensulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
```

```r
z<-bensulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
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
-2.805082, -0.01295276, -1.82111, 0, 0, 1, 1, 1,
-2.749094, -0.7269378, -1.950922, 1, 0, 0, 1, 1,
-2.628951, -0.4362246, -0.7550475, 1, 0, 0, 1, 1,
-2.604062, -0.673344, -2.093808, 1, 0, 0, 1, 1,
-2.543617, -0.2349782, -0.2220701, 1, 0, 0, 1, 1,
-2.431295, -0.0223293, -0.7629069, 1, 0, 0, 1, 1,
-2.385259, 0.7067019, -1.348058, 0, 0, 0, 1, 1,
-2.371509, -0.1901774, -1.593516, 0, 0, 0, 1, 1,
-2.282726, 0.3836088, -0.6896613, 0, 0, 0, 1, 1,
-2.271819, 1.824454, 0.3644124, 0, 0, 0, 1, 1,
-2.234082, -1.853567, -1.448538, 0, 0, 0, 1, 1,
-2.201458, -0.461201, -1.676592, 0, 0, 0, 1, 1,
-2.198796, 0.1937133, -1.137789, 0, 0, 0, 1, 1,
-2.190063, 0.7082481, -1.490042, 1, 1, 1, 1, 1,
-2.147729, 0.03221577, -0.8708472, 1, 1, 1, 1, 1,
-2.143879, 0.8747599, -1.335843, 1, 1, 1, 1, 1,
-2.133738, 0.6821129, -1.038348, 1, 1, 1, 1, 1,
-2.086596, -0.1148614, -1.344526, 1, 1, 1, 1, 1,
-2.049971, 2.34865, -2.275677, 1, 1, 1, 1, 1,
-2.045537, -0.3057232, -2.982524, 1, 1, 1, 1, 1,
-2.044901, 0.7261193, -1.276819, 1, 1, 1, 1, 1,
-2.038419, 1.063964, -0.4667788, 1, 1, 1, 1, 1,
-2.000494, -0.15406, -3.101259, 1, 1, 1, 1, 1,
-1.999006, -1.369078, -2.019706, 1, 1, 1, 1, 1,
-1.947755, 0.7741958, 0.8522047, 1, 1, 1, 1, 1,
-1.899165, -1.478495, -1.691506, 1, 1, 1, 1, 1,
-1.89316, 0.8488433, -1.610694, 1, 1, 1, 1, 1,
-1.880543, -1.970464, -0.5487097, 1, 1, 1, 1, 1,
-1.875579, 1.518915, -0.09701587, 0, 0, 1, 1, 1,
-1.865719, -1.284284, -0.5080455, 1, 0, 0, 1, 1,
-1.852121, 0.2444538, -2.45894, 1, 0, 0, 1, 1,
-1.837082, 0.3213435, -0.1436509, 1, 0, 0, 1, 1,
-1.83342, -0.2884624, -2.34795, 1, 0, 0, 1, 1,
-1.823366, -0.3104928, -0.9421839, 1, 0, 0, 1, 1,
-1.820667, -1.259961, -0.2113557, 0, 0, 0, 1, 1,
-1.818907, -0.9209476, -1.232012, 0, 0, 0, 1, 1,
-1.80271, 0.04807616, -2.680591, 0, 0, 0, 1, 1,
-1.80189, -1.198867, -2.433155, 0, 0, 0, 1, 1,
-1.778552, -1.160543, -3.795969, 0, 0, 0, 1, 1,
-1.752873, 1.24717, -2.311651, 0, 0, 0, 1, 1,
-1.739239, 1.179176, -0.6327753, 0, 0, 0, 1, 1,
-1.739042, 0.839374, -1.148992, 1, 1, 1, 1, 1,
-1.735074, 0.08406757, -4.306099, 1, 1, 1, 1, 1,
-1.702005, -0.5837943, -3.337668, 1, 1, 1, 1, 1,
-1.700611, 1.18859, -0.7532234, 1, 1, 1, 1, 1,
-1.690874, 1.449104, -1.349632, 1, 1, 1, 1, 1,
-1.690811, -0.9891077, -1.747042, 1, 1, 1, 1, 1,
-1.686174, 0.06320508, -0.9427599, 1, 1, 1, 1, 1,
-1.666058, 2.007147, -1.478872, 1, 1, 1, 1, 1,
-1.65152, 1.371106, -1.278965, 1, 1, 1, 1, 1,
-1.646352, -0.03702029, -4.290773, 1, 1, 1, 1, 1,
-1.613371, 0.06677376, -0.5950177, 1, 1, 1, 1, 1,
-1.572411, 1.635643, 0.9912643, 1, 1, 1, 1, 1,
-1.558812, -0.1471208, -0.3826573, 1, 1, 1, 1, 1,
-1.553595, 0.5928913, -1.329555, 1, 1, 1, 1, 1,
-1.542407, -0.9258972, -3.153617, 1, 1, 1, 1, 1,
-1.535923, 0.3819501, -2.334173, 0, 0, 1, 1, 1,
-1.535236, 0.2840894, -1.252856, 1, 0, 0, 1, 1,
-1.533911, -0.1990626, -3.520413, 1, 0, 0, 1, 1,
-1.493634, 0.05768408, -1.008059, 1, 0, 0, 1, 1,
-1.488876, 0.3541142, -1.745675, 1, 0, 0, 1, 1,
-1.487321, 0.3958454, -0.324196, 1, 0, 0, 1, 1,
-1.479002, -0.08614772, -1.900487, 0, 0, 0, 1, 1,
-1.448626, 0.192309, -0.9510728, 0, 0, 0, 1, 1,
-1.44828, 0.3464507, 0.3864156, 0, 0, 0, 1, 1,
-1.442248, 0.3387742, -2.40836, 0, 0, 0, 1, 1,
-1.441842, 1.024294, -2.107088, 0, 0, 0, 1, 1,
-1.434221, 0.2847179, -1.195156, 0, 0, 0, 1, 1,
-1.432888, -2.312934, -2.90765, 0, 0, 0, 1, 1,
-1.423023, 0.9924451, -1.010753, 1, 1, 1, 1, 1,
-1.415484, -2.071274, -1.680921, 1, 1, 1, 1, 1,
-1.408491, 0.1941334, -0.5102, 1, 1, 1, 1, 1,
-1.408056, -0.5994583, -1.728225, 1, 1, 1, 1, 1,
-1.405902, 0.9237393, -1.192958, 1, 1, 1, 1, 1,
-1.382963, 1.05058, -1.006493, 1, 1, 1, 1, 1,
-1.382109, -0.4417303, -0.4695808, 1, 1, 1, 1, 1,
-1.370774, 1.122407, -0.8357716, 1, 1, 1, 1, 1,
-1.368269, -0.4127327, -1.746668, 1, 1, 1, 1, 1,
-1.36198, 0.7609137, -0.5967486, 1, 1, 1, 1, 1,
-1.358434, 0.5710047, -0.2251545, 1, 1, 1, 1, 1,
-1.35785, 0.2604578, -0.5155798, 1, 1, 1, 1, 1,
-1.354349, -0.6111286, -1.263785, 1, 1, 1, 1, 1,
-1.352942, 1.514416, -2.35157, 1, 1, 1, 1, 1,
-1.349202, 0.4408707, -1.745032, 1, 1, 1, 1, 1,
-1.345789, 1.300405, 0.7953365, 0, 0, 1, 1, 1,
-1.345593, 0.3434966, -2.136912, 1, 0, 0, 1, 1,
-1.338785, 1.185834, -0.2114072, 1, 0, 0, 1, 1,
-1.333645, 1.886012, 0.1362718, 1, 0, 0, 1, 1,
-1.32911, 0.9588198, -1.286839, 1, 0, 0, 1, 1,
-1.32662, -1.044487, -0.5593129, 1, 0, 0, 1, 1,
-1.325145, -0.4195125, -2.9917, 0, 0, 0, 1, 1,
-1.324006, 0.4950373, -1.851166, 0, 0, 0, 1, 1,
-1.320569, -1.392389, -4.138604, 0, 0, 0, 1, 1,
-1.319795, -0.2839693, -1.304925, 0, 0, 0, 1, 1,
-1.307974, -0.6068874, -2.590142, 0, 0, 0, 1, 1,
-1.302974, 0.7490107, -1.353056, 0, 0, 0, 1, 1,
-1.299086, -0.9458553, -3.940827, 0, 0, 0, 1, 1,
-1.294614, 0.2074008, -1.130302, 1, 1, 1, 1, 1,
-1.283593, 1.123063, 0.7298872, 1, 1, 1, 1, 1,
-1.283481, 1.122343, -0.8357061, 1, 1, 1, 1, 1,
-1.273382, -0.8544748, -2.193728, 1, 1, 1, 1, 1,
-1.270064, -0.2899632, -0.8044302, 1, 1, 1, 1, 1,
-1.268283, 0.7882367, -2.387869, 1, 1, 1, 1, 1,
-1.263628, 0.9113446, -0.5104407, 1, 1, 1, 1, 1,
-1.258795, 0.5576932, -1.904294, 1, 1, 1, 1, 1,
-1.258682, -0.5474579, -1.65844, 1, 1, 1, 1, 1,
-1.257865, -0.3727211, -1.799442, 1, 1, 1, 1, 1,
-1.250539, 0.7240078, -1.543156, 1, 1, 1, 1, 1,
-1.247562, 0.05472764, -0.7743605, 1, 1, 1, 1, 1,
-1.245045, -1.250755, -5.124685, 1, 1, 1, 1, 1,
-1.237227, 0.1135416, 0.8098295, 1, 1, 1, 1, 1,
-1.23593, -0.6974075, -0.179325, 1, 1, 1, 1, 1,
-1.212743, -0.3901279, -1.593264, 0, 0, 1, 1, 1,
-1.198939, -1.043425, -1.445518, 1, 0, 0, 1, 1,
-1.180915, -1.552517, -1.533209, 1, 0, 0, 1, 1,
-1.174874, 1.856465, -1.65083, 1, 0, 0, 1, 1,
-1.17375, 0.494546, -2.1218, 1, 0, 0, 1, 1,
-1.161416, -0.1506563, -0.4227746, 1, 0, 0, 1, 1,
-1.16067, -0.4480225, -1.830482, 0, 0, 0, 1, 1,
-1.159339, 0.124912, -3.321934, 0, 0, 0, 1, 1,
-1.157045, 0.9922295, 0.15554, 0, 0, 0, 1, 1,
-1.150746, 0.9661238, -0.9592518, 0, 0, 0, 1, 1,
-1.14881, 0.4686877, -1.57013, 0, 0, 0, 1, 1,
-1.139884, 0.4575065, -1.594494, 0, 0, 0, 1, 1,
-1.130967, -0.0002597454, -1.27603, 0, 0, 0, 1, 1,
-1.126882, 0.8536931, -0.06422819, 1, 1, 1, 1, 1,
-1.095418, -0.2592215, -1.407337, 1, 1, 1, 1, 1,
-1.091563, 0.450723, -1.887194, 1, 1, 1, 1, 1,
-1.090751, 0.6227469, 0.7255889, 1, 1, 1, 1, 1,
-1.090108, -1.136317, -4.760262, 1, 1, 1, 1, 1,
-1.087204, -0.8217032, -3.639374, 1, 1, 1, 1, 1,
-1.079303, -0.3233045, -0.7276845, 1, 1, 1, 1, 1,
-1.077639, 0.200741, -1.813996, 1, 1, 1, 1, 1,
-1.069018, 0.2451064, -1.662184, 1, 1, 1, 1, 1,
-1.068963, -0.1867476, -1.033158, 1, 1, 1, 1, 1,
-1.063931, 0.4798751, -1.19614, 1, 1, 1, 1, 1,
-1.059498, -0.1777891, -1.274216, 1, 1, 1, 1, 1,
-1.056092, 1.584445, -1.8294, 1, 1, 1, 1, 1,
-1.046849, 0.1915897, -1.233708, 1, 1, 1, 1, 1,
-1.044628, -0.3245718, -3.615974, 1, 1, 1, 1, 1,
-1.040523, 0.1502253, -2.413443, 0, 0, 1, 1, 1,
-1.040276, -0.654174, -3.55561, 1, 0, 0, 1, 1,
-1.038912, -1.406501, -3.647226, 1, 0, 0, 1, 1,
-1.03285, 0.6039662, -0.4743535, 1, 0, 0, 1, 1,
-1.02495, -2.036106, -2.050495, 1, 0, 0, 1, 1,
-1.024308, 0.4912627, -0.5080661, 1, 0, 0, 1, 1,
-1.0228, 0.4420654, -0.3530165, 0, 0, 0, 1, 1,
-1.018169, -0.5479454, -2.943834, 0, 0, 0, 1, 1,
-1.013618, 0.8747818, -1.045083, 0, 0, 0, 1, 1,
-1.012887, -0.6218092, -2.806622, 0, 0, 0, 1, 1,
-1.002694, -0.9508943, -3.182716, 0, 0, 0, 1, 1,
-0.9977135, 0.07627303, -2.807056, 0, 0, 0, 1, 1,
-0.9974355, -0.2573935, -2.399941, 0, 0, 0, 1, 1,
-0.9959767, -0.1866235, -0.4676803, 1, 1, 1, 1, 1,
-0.9933333, 0.1967666, -0.3722363, 1, 1, 1, 1, 1,
-0.9887092, -1.47779, -2.370127, 1, 1, 1, 1, 1,
-0.9857562, 0.4016117, -1.245082, 1, 1, 1, 1, 1,
-0.9829751, 0.9991959, -0.6622512, 1, 1, 1, 1, 1,
-0.9815254, -1.348598, -1.624385, 1, 1, 1, 1, 1,
-0.9804623, 1.918283, 0.3421704, 1, 1, 1, 1, 1,
-0.980432, -0.4320068, -0.7123551, 1, 1, 1, 1, 1,
-0.979736, 2.301448, 0.5890018, 1, 1, 1, 1, 1,
-0.9609734, -0.8417487, -1.488472, 1, 1, 1, 1, 1,
-0.9580868, -1.152185, -2.421149, 1, 1, 1, 1, 1,
-0.9545853, 0.8942756, 0.2483591, 1, 1, 1, 1, 1,
-0.9333656, -2.794837, -2.182487, 1, 1, 1, 1, 1,
-0.9265423, 0.7646665, -1.274952, 1, 1, 1, 1, 1,
-0.9192909, 0.1376951, -0.9608507, 1, 1, 1, 1, 1,
-0.913672, 0.8666436, -1.377988, 0, 0, 1, 1, 1,
-0.8933684, -0.5834333, -2.687797, 1, 0, 0, 1, 1,
-0.8927515, 1.205591, -0.939575, 1, 0, 0, 1, 1,
-0.8887833, -0.7936238, -2.547459, 1, 0, 0, 1, 1,
-0.8869241, 0.2112981, -1.858976, 1, 0, 0, 1, 1,
-0.8859993, -0.2829159, -1.827847, 1, 0, 0, 1, 1,
-0.8800116, 1.38514, 0.1424665, 0, 0, 0, 1, 1,
-0.8679705, -0.2464597, -1.908783, 0, 0, 0, 1, 1,
-0.8653353, 1.655593, -0.3070244, 0, 0, 0, 1, 1,
-0.8642891, -1.51223, -3.142611, 0, 0, 0, 1, 1,
-0.8634459, 1.702736, -1.875719, 0, 0, 0, 1, 1,
-0.8550431, 0.4230441, 0.5182949, 0, 0, 0, 1, 1,
-0.8472997, 0.8625289, -0.9634346, 0, 0, 0, 1, 1,
-0.8408021, 0.5697736, -1.40022, 1, 1, 1, 1, 1,
-0.838638, -0.8593071, -2.624581, 1, 1, 1, 1, 1,
-0.8315544, -0.7060788, -1.628334, 1, 1, 1, 1, 1,
-0.8295054, -0.008713877, -1.201683, 1, 1, 1, 1, 1,
-0.8258836, 0.4127101, -1.221903, 1, 1, 1, 1, 1,
-0.8250955, -0.06851853, -0.4561452, 1, 1, 1, 1, 1,
-0.8212914, -0.5226874, -2.129006, 1, 1, 1, 1, 1,
-0.8193651, 0.6353947, 0.6975285, 1, 1, 1, 1, 1,
-0.8177484, -0.01241857, -1.107386, 1, 1, 1, 1, 1,
-0.8147354, -0.4449252, -0.9871457, 1, 1, 1, 1, 1,
-0.8039652, 0.5994872, -1.517648, 1, 1, 1, 1, 1,
-0.8018343, -1.171626, -2.36308, 1, 1, 1, 1, 1,
-0.8013757, 0.08038446, -2.098572, 1, 1, 1, 1, 1,
-0.8006571, -0.6762004, -3.786415, 1, 1, 1, 1, 1,
-0.7999744, -1.255257, -1.902259, 1, 1, 1, 1, 1,
-0.7902921, 1.498128, 1.368092, 0, 0, 1, 1, 1,
-0.7883623, -1.025217, -1.204595, 1, 0, 0, 1, 1,
-0.7882957, -1.695691, -1.625988, 1, 0, 0, 1, 1,
-0.7872045, -2.025697, -2.461497, 1, 0, 0, 1, 1,
-0.7858016, -0.3310844, -3.36327, 1, 0, 0, 1, 1,
-0.7856624, 0.9108258, -1.989833, 1, 0, 0, 1, 1,
-0.7839789, -1.140945, -1.58256, 0, 0, 0, 1, 1,
-0.7763251, -0.3711088, -1.739768, 0, 0, 0, 1, 1,
-0.7581836, -0.2629517, -2.193902, 0, 0, 0, 1, 1,
-0.7565009, -0.5815136, -1.978951, 0, 0, 0, 1, 1,
-0.7537538, -2.117568, -2.854762, 0, 0, 0, 1, 1,
-0.7500299, -2.377879, -4.621933, 0, 0, 0, 1, 1,
-0.7476152, 1.035792, 0.2051234, 0, 0, 0, 1, 1,
-0.7468195, 0.4043737, 0.1110325, 1, 1, 1, 1, 1,
-0.7463939, 1.374228, 0.3969746, 1, 1, 1, 1, 1,
-0.744089, -0.7813721, -3.13195, 1, 1, 1, 1, 1,
-0.7400141, -0.5184808, -2.846221, 1, 1, 1, 1, 1,
-0.7279374, -0.5852035, -2.271307, 1, 1, 1, 1, 1,
-0.7276149, 0.5214071, -0.7021438, 1, 1, 1, 1, 1,
-0.72644, 1.709652, -1.047412, 1, 1, 1, 1, 1,
-0.7194078, -1.645923, -1.893742, 1, 1, 1, 1, 1,
-0.7153263, 0.1687866, -2.773589, 1, 1, 1, 1, 1,
-0.7150317, 1.009441, -0.9176461, 1, 1, 1, 1, 1,
-0.7143405, -0.899625, -1.046599, 1, 1, 1, 1, 1,
-0.710823, 0.5486881, -0.5398166, 1, 1, 1, 1, 1,
-0.7088999, -0.7804769, -2.187621, 1, 1, 1, 1, 1,
-0.708342, 0.731185, -1.293128, 1, 1, 1, 1, 1,
-0.7026153, 0.7859515, -1.508112, 1, 1, 1, 1, 1,
-0.6991791, -0.4304404, -2.419727, 0, 0, 1, 1, 1,
-0.692665, -0.3274211, -1.685858, 1, 0, 0, 1, 1,
-0.6918837, 0.7012624, -0.5507442, 1, 0, 0, 1, 1,
-0.6891988, -1.007141, -3.046695, 1, 0, 0, 1, 1,
-0.6886743, 1.228893, -1.647735, 1, 0, 0, 1, 1,
-0.686227, -0.8503466, -1.526418, 1, 0, 0, 1, 1,
-0.6856142, 1.069256, -0.2790256, 0, 0, 0, 1, 1,
-0.6834674, 0.01387683, -2.242415, 0, 0, 0, 1, 1,
-0.6767695, 0.4594263, -2.817544, 0, 0, 0, 1, 1,
-0.6736903, -0.2473727, -1.238091, 0, 0, 0, 1, 1,
-0.671195, 0.9458538, -0.9195443, 0, 0, 0, 1, 1,
-0.6701577, 0.6063356, -0.1373929, 0, 0, 0, 1, 1,
-0.6694201, -2.186651, -3.669315, 0, 0, 0, 1, 1,
-0.660176, -2.112761, -3.271372, 1, 1, 1, 1, 1,
-0.6593019, 0.5571707, -1.0198, 1, 1, 1, 1, 1,
-0.6589552, -0.9060979, -1.180153, 1, 1, 1, 1, 1,
-0.6546813, -1.433951, -2.898782, 1, 1, 1, 1, 1,
-0.6543471, 0.00338945, -1.010351, 1, 1, 1, 1, 1,
-0.6509517, -1.046537, -1.934299, 1, 1, 1, 1, 1,
-0.6507717, 1.04982, -2.018847, 1, 1, 1, 1, 1,
-0.6494477, 0.9189728, -0.9170694, 1, 1, 1, 1, 1,
-0.6484168, 1.139943, 0.3362159, 1, 1, 1, 1, 1,
-0.647921, 1.525644, -0.04518122, 1, 1, 1, 1, 1,
-0.6425974, 1.072238, -1.387162, 1, 1, 1, 1, 1,
-0.6396918, -0.00496288, -1.275173, 1, 1, 1, 1, 1,
-0.6393816, 1.119819, -0.6723482, 1, 1, 1, 1, 1,
-0.6380134, -1.335473, -2.985131, 1, 1, 1, 1, 1,
-0.6290297, -0.04612873, -3.292533, 1, 1, 1, 1, 1,
-0.6252187, -0.1732551, -1.266343, 0, 0, 1, 1, 1,
-0.6235177, -1.237866, -2.284972, 1, 0, 0, 1, 1,
-0.6234908, -0.2068544, -1.012927, 1, 0, 0, 1, 1,
-0.621344, 1.02562, -0.7680291, 1, 0, 0, 1, 1,
-0.6207097, -0.5165458, -0.864867, 1, 0, 0, 1, 1,
-0.619734, -0.5798616, -2.315679, 1, 0, 0, 1, 1,
-0.6103359, -0.1095409, -1.513368, 0, 0, 0, 1, 1,
-0.6076255, -0.9833232, -2.955739, 0, 0, 0, 1, 1,
-0.6068875, -0.01878826, -1.818771, 0, 0, 0, 1, 1,
-0.6021671, 0.7777482, -1.556716, 0, 0, 0, 1, 1,
-0.602023, -1.10268, -1.362999, 0, 0, 0, 1, 1,
-0.5989574, -1.639112, -0.9659336, 0, 0, 0, 1, 1,
-0.5978608, -0.5889452, -2.669799, 0, 0, 0, 1, 1,
-0.5957091, 0.6211138, -1.058966, 1, 1, 1, 1, 1,
-0.587212, 1.437349, -0.06660878, 1, 1, 1, 1, 1,
-0.5862105, -1.022049, -1.410135, 1, 1, 1, 1, 1,
-0.5849254, -0.4747493, -2.896874, 1, 1, 1, 1, 1,
-0.5843457, -1.274788, -2.527143, 1, 1, 1, 1, 1,
-0.579012, 0.49796, -2.453125, 1, 1, 1, 1, 1,
-0.5775322, -0.9306187, -2.289799, 1, 1, 1, 1, 1,
-0.5767211, 0.01816115, -0.3787563, 1, 1, 1, 1, 1,
-0.5755766, 1.025218, -0.2755167, 1, 1, 1, 1, 1,
-0.5691484, 0.3366589, 0.03748322, 1, 1, 1, 1, 1,
-0.5682833, -0.4366822, -3.372739, 1, 1, 1, 1, 1,
-0.5667073, 0.4497474, -1.019247, 1, 1, 1, 1, 1,
-0.5652208, 0.7393332, -0.7148067, 1, 1, 1, 1, 1,
-0.5630533, -1.400321, -4.948895, 1, 1, 1, 1, 1,
-0.5575032, -0.6326883, -1.936999, 1, 1, 1, 1, 1,
-0.552057, 0.7075468, -1.107758, 0, 0, 1, 1, 1,
-0.548032, 0.9700184, -1.162458, 1, 0, 0, 1, 1,
-0.5445439, -0.3719629, -1.341249, 1, 0, 0, 1, 1,
-0.543487, 0.8131299, -0.04451607, 1, 0, 0, 1, 1,
-0.5427243, -1.188052, -3.500414, 1, 0, 0, 1, 1,
-0.5423679, -0.3414579, -0.8948489, 1, 0, 0, 1, 1,
-0.5396478, -0.6477311, -4.180544, 0, 0, 0, 1, 1,
-0.5389606, 0.3268674, -2.237971, 0, 0, 0, 1, 1,
-0.5354765, -0.9930882, -3.26159, 0, 0, 0, 1, 1,
-0.5328948, -1.772435, -1.361249, 0, 0, 0, 1, 1,
-0.5232713, 0.5424998, 1.428843, 0, 0, 0, 1, 1,
-0.5229897, -0.7252057, -2.254459, 0, 0, 0, 1, 1,
-0.5216108, -0.9946548, -0.03805251, 0, 0, 0, 1, 1,
-0.5203552, 0.5855023, -1.194638, 1, 1, 1, 1, 1,
-0.5136825, 3.600865, 0.7773455, 1, 1, 1, 1, 1,
-0.5117266, -1.413627, -1.692502, 1, 1, 1, 1, 1,
-0.5114909, -0.06902463, -0.35836, 1, 1, 1, 1, 1,
-0.5083314, 0.2398133, 0.6207737, 1, 1, 1, 1, 1,
-0.4972864, 0.6208742, 0.2298059, 1, 1, 1, 1, 1,
-0.4960307, -1.383465, -1.661925, 1, 1, 1, 1, 1,
-0.4922069, -0.06813999, -1.462617, 1, 1, 1, 1, 1,
-0.4898774, 2.924923, -1.946474, 1, 1, 1, 1, 1,
-0.4865058, 0.5487931, -1.346814, 1, 1, 1, 1, 1,
-0.4812902, -0.08801971, -1.754123, 1, 1, 1, 1, 1,
-0.4806375, -0.7446138, -2.663245, 1, 1, 1, 1, 1,
-0.4720713, -0.1158144, -1.507812, 1, 1, 1, 1, 1,
-0.4684885, 2.763343, 0.348733, 1, 1, 1, 1, 1,
-0.4677901, -0.3488367, -1.299312, 1, 1, 1, 1, 1,
-0.4672197, 0.05361497, -2.212611, 0, 0, 1, 1, 1,
-0.4629249, 0.05004761, -0.8077108, 1, 0, 0, 1, 1,
-0.4578696, 0.02919087, -1.274208, 1, 0, 0, 1, 1,
-0.4498343, 0.1975751, -0.2206033, 1, 0, 0, 1, 1,
-0.4366745, 0.07766704, -1.638882, 1, 0, 0, 1, 1,
-0.4347752, 1.963508, -1.108362, 1, 0, 0, 1, 1,
-0.4324059, 0.9840178, -2.510871, 0, 0, 0, 1, 1,
-0.4286473, -0.3220344, -1.539636, 0, 0, 0, 1, 1,
-0.4268638, -1.423264, -3.518258, 0, 0, 0, 1, 1,
-0.4258595, -0.5104453, -1.723684, 0, 0, 0, 1, 1,
-0.4244354, -0.07790606, -2.395158, 0, 0, 0, 1, 1,
-0.4233933, -1.533171, -2.593725, 0, 0, 0, 1, 1,
-0.4089564, 1.751129, 0.5170335, 0, 0, 0, 1, 1,
-0.4041118, 1.028254, -0.07388622, 1, 1, 1, 1, 1,
-0.4035766, -1.187876, -4.750905, 1, 1, 1, 1, 1,
-0.4024493, 2.026319, 1.477524, 1, 1, 1, 1, 1,
-0.3996992, 0.875597, -0.210788, 1, 1, 1, 1, 1,
-0.3974366, -1.092547, -2.284302, 1, 1, 1, 1, 1,
-0.395349, 0.5031844, -0.4877163, 1, 1, 1, 1, 1,
-0.3932069, -1.324951, -3.753733, 1, 1, 1, 1, 1,
-0.3905967, -0.4334796, -1.098052, 1, 1, 1, 1, 1,
-0.3903131, 0.1051347, -1.326833, 1, 1, 1, 1, 1,
-0.3877613, 1.339379, -3.325357, 1, 1, 1, 1, 1,
-0.3871094, 0.5048881, 0.6233587, 1, 1, 1, 1, 1,
-0.3852868, 1.003397, -0.3155546, 1, 1, 1, 1, 1,
-0.3781975, -0.8142463, -2.576489, 1, 1, 1, 1, 1,
-0.3779083, 2.392452, 0.6004127, 1, 1, 1, 1, 1,
-0.3769239, 0.7756472, -0.6711822, 1, 1, 1, 1, 1,
-0.3765315, 1.980346, -1.535111, 0, 0, 1, 1, 1,
-0.3763857, -1.223297, -2.272919, 1, 0, 0, 1, 1,
-0.3702867, -1.135448, -2.624624, 1, 0, 0, 1, 1,
-0.3691411, -1.883851, -1.491045, 1, 0, 0, 1, 1,
-0.3663398, -1.061482, -1.376733, 1, 0, 0, 1, 1,
-0.365707, 0.8026362, -2.446109, 1, 0, 0, 1, 1,
-0.3641395, -0.003856321, -0.3036783, 0, 0, 0, 1, 1,
-0.3640655, -0.8187574, -2.540378, 0, 0, 0, 1, 1,
-0.3628368, -0.6796369, -3.132497, 0, 0, 0, 1, 1,
-0.3623239, -0.06931068, -1.205552, 0, 0, 0, 1, 1,
-0.3619514, -0.6180371, -3.35357, 0, 0, 0, 1, 1,
-0.3568362, -0.595742, -2.035621, 0, 0, 0, 1, 1,
-0.3537521, -0.2036657, -3.004954, 0, 0, 0, 1, 1,
-0.352866, -0.1017015, -2.677764, 1, 1, 1, 1, 1,
-0.3525785, -0.5454363, -2.873939, 1, 1, 1, 1, 1,
-0.3491476, -1.163044, -3.644488, 1, 1, 1, 1, 1,
-0.347482, 0.5695833, -1.144386, 1, 1, 1, 1, 1,
-0.3474115, -0.2424066, -2.165686, 1, 1, 1, 1, 1,
-0.3465656, -1.71242, -2.186117, 1, 1, 1, 1, 1,
-0.3414558, 0.2534737, 0.009229282, 1, 1, 1, 1, 1,
-0.3403687, 0.04807803, -2.13286, 1, 1, 1, 1, 1,
-0.3371914, 1.077773, -0.1605924, 1, 1, 1, 1, 1,
-0.3349186, -0.6601847, -5.548499, 1, 1, 1, 1, 1,
-0.3321021, 0.0763092, 0.08452865, 1, 1, 1, 1, 1,
-0.3315006, -1.962507, -3.428423, 1, 1, 1, 1, 1,
-0.3251377, -0.6631897, -1.675752, 1, 1, 1, 1, 1,
-0.3212953, -0.3539983, -2.396261, 1, 1, 1, 1, 1,
-0.3156207, 0.2296473, -1.405188, 1, 1, 1, 1, 1,
-0.3116541, -2.728024, -1.901359, 0, 0, 1, 1, 1,
-0.3032872, -1.837217, -2.948747, 1, 0, 0, 1, 1,
-0.3012887, -0.1903154, -2.057611, 1, 0, 0, 1, 1,
-0.2988902, 1.247974, -0.790526, 1, 0, 0, 1, 1,
-0.293106, 0.1150733, -0.8326094, 1, 0, 0, 1, 1,
-0.2901273, -1.166341, -2.318958, 1, 0, 0, 1, 1,
-0.2887588, 0.1242174, -1.943294, 0, 0, 0, 1, 1,
-0.2849757, 0.327145, -1.464975, 0, 0, 0, 1, 1,
-0.2838205, 1.408996, -1.623516, 0, 0, 0, 1, 1,
-0.2833051, 1.041553, 0.9112489, 0, 0, 0, 1, 1,
-0.2829649, -0.6427519, -2.275505, 0, 0, 0, 1, 1,
-0.280351, 0.06669345, -0.7257529, 0, 0, 0, 1, 1,
-0.2754128, -0.4897756, -1.952223, 0, 0, 0, 1, 1,
-0.2747362, -0.5680046, -3.189732, 1, 1, 1, 1, 1,
-0.2702384, 1.264121, -0.5466625, 1, 1, 1, 1, 1,
-0.2686876, -0.3294214, -3.968808, 1, 1, 1, 1, 1,
-0.2606879, 1.166054, -1.300654, 1, 1, 1, 1, 1,
-0.2599007, 0.3546825, -1.091902, 1, 1, 1, 1, 1,
-0.2590946, -0.1939439, -3.246461, 1, 1, 1, 1, 1,
-0.2581561, 0.4322634, -0.7058822, 1, 1, 1, 1, 1,
-0.2545101, -0.7805499, -2.004904, 1, 1, 1, 1, 1,
-0.2545016, 1.865382, 0.2200471, 1, 1, 1, 1, 1,
-0.2522554, 1.360154, -1.106411, 1, 1, 1, 1, 1,
-0.2503861, -0.6089131, -1.631827, 1, 1, 1, 1, 1,
-0.2500438, 2.288244, -0.2294948, 1, 1, 1, 1, 1,
-0.2492641, 0.06151518, -3.529302, 1, 1, 1, 1, 1,
-0.2444915, -0.644805, -3.225312, 1, 1, 1, 1, 1,
-0.2439353, -0.5577309, -2.238189, 1, 1, 1, 1, 1,
-0.242423, 1.162391, -1.35075, 0, 0, 1, 1, 1,
-0.2413944, 0.3099396, -1.67066, 1, 0, 0, 1, 1,
-0.2393805, -0.4514947, -3.363178, 1, 0, 0, 1, 1,
-0.2354584, 0.2987206, -0.4636548, 1, 0, 0, 1, 1,
-0.2326326, 0.01127532, -3.006442, 1, 0, 0, 1, 1,
-0.2307472, -1.366992, -1.255599, 1, 0, 0, 1, 1,
-0.23013, 0.7437764, -0.6104032, 0, 0, 0, 1, 1,
-0.2220775, -0.1646665, -2.789594, 0, 0, 0, 1, 1,
-0.2209476, 1.032526, -0.4414908, 0, 0, 0, 1, 1,
-0.212822, -0.6822248, -4.004966, 0, 0, 0, 1, 1,
-0.2107754, 0.420491, -1.12815, 0, 0, 0, 1, 1,
-0.2083537, 0.2309325, -0.1729877, 0, 0, 0, 1, 1,
-0.2050001, 2.21335, 1.478404, 0, 0, 0, 1, 1,
-0.2030219, 0.5762147, -2.168736, 1, 1, 1, 1, 1,
-0.202411, -0.9832636, -3.477086, 1, 1, 1, 1, 1,
-0.2023688, -0.3770697, -1.499317, 1, 1, 1, 1, 1,
-0.1981366, 0.9636519, 1.488035, 1, 1, 1, 1, 1,
-0.1910483, 1.661635, -1.075218, 1, 1, 1, 1, 1,
-0.1905594, 0.9511802, -0.9400325, 1, 1, 1, 1, 1,
-0.1872497, 0.5810757, -1.451597, 1, 1, 1, 1, 1,
-0.186648, 0.4539397, 0.08115055, 1, 1, 1, 1, 1,
-0.1849004, 1.077287, -2.229079, 1, 1, 1, 1, 1,
-0.1821626, 1.172005, -0.3990123, 1, 1, 1, 1, 1,
-0.1805295, 2.028894, 1.430843, 1, 1, 1, 1, 1,
-0.1786073, -0.4532367, -3.354887, 1, 1, 1, 1, 1,
-0.177337, 0.209228, -0.1507861, 1, 1, 1, 1, 1,
-0.1694639, -0.7809885, -3.336263, 1, 1, 1, 1, 1,
-0.1674304, -0.3125376, -2.915462, 1, 1, 1, 1, 1,
-0.1667504, -0.7407135, -3.63618, 0, 0, 1, 1, 1,
-0.1667501, 0.05775134, -0.6058189, 1, 0, 0, 1, 1,
-0.16484, -1.048138, -3.490108, 1, 0, 0, 1, 1,
-0.1624937, -1.310758, -3.432861, 1, 0, 0, 1, 1,
-0.1620497, -2.033449, -2.427118, 1, 0, 0, 1, 1,
-0.1618184, -1.324419, -3.132546, 1, 0, 0, 1, 1,
-0.1598957, 0.5144249, -0.1012137, 0, 0, 0, 1, 1,
-0.1587616, -1.059045, -3.817138, 0, 0, 0, 1, 1,
-0.1573881, -0.3008733, -2.475102, 0, 0, 0, 1, 1,
-0.1507646, -0.7657005, -2.574732, 0, 0, 0, 1, 1,
-0.1502445, -0.8905278, -3.154738, 0, 0, 0, 1, 1,
-0.1435545, -1.74851, -4.339148, 0, 0, 0, 1, 1,
-0.1435323, -1.002195, -3.720189, 0, 0, 0, 1, 1,
-0.1388983, 2.012641, 0.7310955, 1, 1, 1, 1, 1,
-0.1360965, -0.4752121, -2.079991, 1, 1, 1, 1, 1,
-0.1342574, 0.7124376, -1.462024, 1, 1, 1, 1, 1,
-0.1331118, 1.419986, -0.07191566, 1, 1, 1, 1, 1,
-0.1299107, -0.7968516, -1.182625, 1, 1, 1, 1, 1,
-0.1277212, -0.3541535, -1.686546, 1, 1, 1, 1, 1,
-0.1276356, 0.103108, -2.03989, 1, 1, 1, 1, 1,
-0.1273509, 0.28326, 1.522371, 1, 1, 1, 1, 1,
-0.1244135, -0.986938, -2.497107, 1, 1, 1, 1, 1,
-0.1214816, -1.077261, -4.266811, 1, 1, 1, 1, 1,
-0.1200353, 0.9731643, 1.378236, 1, 1, 1, 1, 1,
-0.1183424, -0.8512011, -1.367975, 1, 1, 1, 1, 1,
-0.1171276, 0.6931617, 0.3212179, 1, 1, 1, 1, 1,
-0.1165811, 0.01658527, -1.663334, 1, 1, 1, 1, 1,
-0.1145384, -0.2407753, -2.000724, 1, 1, 1, 1, 1,
-0.1122841, 0.6354384, 0.7705129, 0, 0, 1, 1, 1,
-0.1071163, 1.594949, -0.1305303, 1, 0, 0, 1, 1,
-0.1050193, 1.541323, 0.02968176, 1, 0, 0, 1, 1,
-0.1023436, 0.536865, -0.1891384, 1, 0, 0, 1, 1,
-0.09985942, -1.267938, -3.889203, 1, 0, 0, 1, 1,
-0.09481386, -2.299709, -2.506227, 1, 0, 0, 1, 1,
-0.09173254, 0.3820201, -1.625481, 0, 0, 0, 1, 1,
-0.09116632, -1.376103, -3.007887, 0, 0, 0, 1, 1,
-0.09093295, 1.384112, 0.5867689, 0, 0, 0, 1, 1,
-0.08786403, 0.699611, 1.156656, 0, 0, 0, 1, 1,
-0.08395434, -0.3966333, -4.510321, 0, 0, 0, 1, 1,
-0.07727985, 1.92645, -0.543657, 0, 0, 0, 1, 1,
-0.07615632, -1.288991, -2.067326, 0, 0, 0, 1, 1,
-0.07054302, 0.5731592, 2.249467, 1, 1, 1, 1, 1,
-0.06993338, -0.6766436, -2.92595, 1, 1, 1, 1, 1,
-0.06618848, 0.9217734, -1.045907, 1, 1, 1, 1, 1,
-0.06362866, -1.183795, -5.060633, 1, 1, 1, 1, 1,
-0.06266375, 0.0725235, -2.194944, 1, 1, 1, 1, 1,
-0.06162835, -0.2741833, -1.340742, 1, 1, 1, 1, 1,
-0.05538731, 0.3392071, -1.464094, 1, 1, 1, 1, 1,
-0.05308616, -0.1854905, -4.516851, 1, 1, 1, 1, 1,
-0.05228723, 0.1915787, 1.456154, 1, 1, 1, 1, 1,
-0.04975398, -1.147322, -2.990177, 1, 1, 1, 1, 1,
-0.04882758, -0.03202944, -3.67807, 1, 1, 1, 1, 1,
-0.04861738, 0.5020204, 0.3721058, 1, 1, 1, 1, 1,
-0.0477753, -1.197003, -0.8798362, 1, 1, 1, 1, 1,
-0.04598057, -1.151897, -3.524427, 1, 1, 1, 1, 1,
-0.04535997, 1.230309, 0.5781188, 1, 1, 1, 1, 1,
-0.04347693, -0.4059377, -2.761404, 0, 0, 1, 1, 1,
-0.03890143, 0.6094255, -1.022126, 1, 0, 0, 1, 1,
-0.03873517, 0.994633, 1.458028, 1, 0, 0, 1, 1,
-0.0381159, 0.9076477, -0.3029732, 1, 0, 0, 1, 1,
-0.03242186, -1.054571, -3.377799, 1, 0, 0, 1, 1,
-0.02832233, 0.8842561, 0.1961906, 1, 0, 0, 1, 1,
-0.02704212, 1.301308, -0.9591739, 0, 0, 0, 1, 1,
-0.01797114, -1.719458, -2.313346, 0, 0, 0, 1, 1,
-0.01065673, -1.792957, -2.420361, 0, 0, 0, 1, 1,
-0.008738608, -0.6946909, -2.693647, 0, 0, 0, 1, 1,
-0.007208649, 0.6953682, 0.2228522, 0, 0, 0, 1, 1,
-0.006404764, 0.661611, -0.4934748, 0, 0, 0, 1, 1,
-0.003968699, 1.337775, 1.60043, 0, 0, 0, 1, 1,
-0.003668034, -0.2863072, -3.027498, 1, 1, 1, 1, 1,
-0.003144893, -0.2472476, -3.514943, 1, 1, 1, 1, 1,
-0.002504534, 1.581014, 0.9777476, 1, 1, 1, 1, 1,
-0.002408879, 1.797734, 1.154705, 1, 1, 1, 1, 1,
-0.0007666735, 0.4271669, 0.8387116, 1, 1, 1, 1, 1,
0.0003654152, 1.989441, 0.6590508, 1, 1, 1, 1, 1,
0.0009836673, 1.851744, 0.5398815, 1, 1, 1, 1, 1,
0.01123086, -1.598352, 4.446249, 1, 1, 1, 1, 1,
0.01231631, 0.8143125, 0.2607831, 1, 1, 1, 1, 1,
0.01253419, -0.180893, 2.852989, 1, 1, 1, 1, 1,
0.01297081, -0.4710156, 2.261405, 1, 1, 1, 1, 1,
0.01350832, 1.128946, 0.3941551, 1, 1, 1, 1, 1,
0.01576109, -0.3796506, 2.102241, 1, 1, 1, 1, 1,
0.02757611, 1.625595, -0.5730344, 1, 1, 1, 1, 1,
0.03059333, 0.7031689, -0.7890118, 1, 1, 1, 1, 1,
0.03757697, 0.6569022, 0.2402661, 0, 0, 1, 1, 1,
0.0378825, 0.6458489, -1.895964, 1, 0, 0, 1, 1,
0.04281758, -0.3089408, 3.257436, 1, 0, 0, 1, 1,
0.04506876, -0.9518023, 4.711233, 1, 0, 0, 1, 1,
0.04512854, -0.2845188, 1.654956, 1, 0, 0, 1, 1,
0.04685282, 0.5359612, 0.4186528, 1, 0, 0, 1, 1,
0.04752062, 1.406368, -0.180995, 0, 0, 0, 1, 1,
0.05012158, 1.707566, -1.362362, 0, 0, 0, 1, 1,
0.05091764, -1.614018, 2.648686, 0, 0, 0, 1, 1,
0.05335199, -2.041636, 3.596348, 0, 0, 0, 1, 1,
0.05858106, 0.7134309, -0.4152371, 0, 0, 0, 1, 1,
0.05957077, -0.2632807, 2.990437, 0, 0, 0, 1, 1,
0.06132158, 1.688169, 0.1269816, 0, 0, 0, 1, 1,
0.0622039, 0.350682, 0.1962519, 1, 1, 1, 1, 1,
0.06370748, -0.08350608, 3.576324, 1, 1, 1, 1, 1,
0.06463566, -1.397745, 4.673666, 1, 1, 1, 1, 1,
0.06524396, 0.6780285, -0.4048183, 1, 1, 1, 1, 1,
0.07253975, -0.003413026, 1.354126, 1, 1, 1, 1, 1,
0.07718429, 0.3262793, 0.07548999, 1, 1, 1, 1, 1,
0.08367183, 1.660074, -0.6813287, 1, 1, 1, 1, 1,
0.08620414, -0.8544669, 5.007217, 1, 1, 1, 1, 1,
0.08656333, 0.159183, 1.18465, 1, 1, 1, 1, 1,
0.09615789, -1.214919, 4.960026, 1, 1, 1, 1, 1,
0.09819429, 0.6907924, -0.2081866, 1, 1, 1, 1, 1,
0.0985409, 1.219962, 0.4904896, 1, 1, 1, 1, 1,
0.09877834, -0.797094, 1.960272, 1, 1, 1, 1, 1,
0.1004417, 1.996766, -0.7781929, 1, 1, 1, 1, 1,
0.1013203, 0.04464919, -0.5104977, 1, 1, 1, 1, 1,
0.1018014, -0.7872751, 3.357616, 0, 0, 1, 1, 1,
0.1047448, -0.07512028, 1.393597, 1, 0, 0, 1, 1,
0.1090106, -0.5119758, 2.752588, 1, 0, 0, 1, 1,
0.112963, -0.04440242, 0.9814678, 1, 0, 0, 1, 1,
0.1131312, -0.1327068, 1.017513, 1, 0, 0, 1, 1,
0.1132524, -0.1519381, 2.746482, 1, 0, 0, 1, 1,
0.114734, -0.971921, 3.461641, 0, 0, 0, 1, 1,
0.1173518, -0.1725406, 3.249187, 0, 0, 0, 1, 1,
0.1184217, 1.796118, 1.575994, 0, 0, 0, 1, 1,
0.1281731, 0.6599323, 0.8036913, 0, 0, 0, 1, 1,
0.1302337, -0.1159977, 2.740028, 0, 0, 0, 1, 1,
0.1307615, -1.452811, 3.057583, 0, 0, 0, 1, 1,
0.1315776, 0.8078917, 0.2053693, 0, 0, 0, 1, 1,
0.1322044, 0.27232, 1.619969, 1, 1, 1, 1, 1,
0.1559882, -1.082179, 3.474509, 1, 1, 1, 1, 1,
0.1566162, 0.3577709, -0.03694021, 1, 1, 1, 1, 1,
0.1598645, -0.7597302, 0.9164848, 1, 1, 1, 1, 1,
0.1627872, 1.758341, 0.03316579, 1, 1, 1, 1, 1,
0.1636424, -0.5951372, 3.029895, 1, 1, 1, 1, 1,
0.165004, 0.3653727, -1.290291, 1, 1, 1, 1, 1,
0.1712412, 0.1664658, -0.1193759, 1, 1, 1, 1, 1,
0.1748694, -0.5533433, 1.981236, 1, 1, 1, 1, 1,
0.180738, -1.304684, 4.345978, 1, 1, 1, 1, 1,
0.1936201, 1.17414, 0.5073664, 1, 1, 1, 1, 1,
0.1958421, -0.08413529, 0.3588454, 1, 1, 1, 1, 1,
0.1997736, 1.345293, -0.2579319, 1, 1, 1, 1, 1,
0.2020763, 1.357641, 1.161258, 1, 1, 1, 1, 1,
0.2107744, -0.385915, 3.862931, 1, 1, 1, 1, 1,
0.2135986, -0.8329994, 3.683447, 0, 0, 1, 1, 1,
0.2246414, 0.3185437, 1.240488, 1, 0, 0, 1, 1,
0.2282871, -1.760197, 2.159801, 1, 0, 0, 1, 1,
0.2339722, -1.446908, 2.36237, 1, 0, 0, 1, 1,
0.2400085, 0.938467, -0.7941601, 1, 0, 0, 1, 1,
0.24009, 0.7159997, 2.558989, 1, 0, 0, 1, 1,
0.2479005, 0.6620514, 0.8788913, 0, 0, 0, 1, 1,
0.2504849, -0.1010107, 2.157538, 0, 0, 0, 1, 1,
0.2508518, -0.3564886, 2.150124, 0, 0, 0, 1, 1,
0.2514377, -0.9885562, 2.726013, 0, 0, 0, 1, 1,
0.2519866, 0.07888777, -0.0462182, 0, 0, 0, 1, 1,
0.2534655, 0.1505443, 0.6594678, 0, 0, 0, 1, 1,
0.2542043, -0.4244411, 2.746145, 0, 0, 0, 1, 1,
0.2547043, -0.1704324, 2.558303, 1, 1, 1, 1, 1,
0.2631694, 0.03100135, 1.238836, 1, 1, 1, 1, 1,
0.2695693, -0.9272302, 6.118558, 1, 1, 1, 1, 1,
0.2746449, -1.049224, 2.647595, 1, 1, 1, 1, 1,
0.2749428, 0.4925908, 1.262352, 1, 1, 1, 1, 1,
0.2765553, 0.06055513, 0.04032056, 1, 1, 1, 1, 1,
0.2806301, 1.075717, -0.8061735, 1, 1, 1, 1, 1,
0.2813987, -1.178867, 3.688358, 1, 1, 1, 1, 1,
0.283949, 0.6112672, -0.1675736, 1, 1, 1, 1, 1,
0.2864534, 0.6709321, -0.05080587, 1, 1, 1, 1, 1,
0.2869016, -2.642055, 2.458482, 1, 1, 1, 1, 1,
0.2889625, -1.022107, 1.814753, 1, 1, 1, 1, 1,
0.2991501, -0.135413, 0.07718495, 1, 1, 1, 1, 1,
0.3024689, 0.5933471, -0.4546345, 1, 1, 1, 1, 1,
0.3038592, 0.5404083, 0.14357, 1, 1, 1, 1, 1,
0.3044102, -0.7298994, 1.660301, 0, 0, 1, 1, 1,
0.3098963, 0.2290695, 0.189498, 1, 0, 0, 1, 1,
0.3109034, -0.137826, 0.8397267, 1, 0, 0, 1, 1,
0.3153427, 0.4171622, 1.463413, 1, 0, 0, 1, 1,
0.3156909, -0.4571104, 0.5231687, 1, 0, 0, 1, 1,
0.3168552, -0.5999022, 4.503239, 1, 0, 0, 1, 1,
0.3204297, -0.4257948, 3.330789, 0, 0, 0, 1, 1,
0.3295408, -0.6684433, 1.948853, 0, 0, 0, 1, 1,
0.331995, -0.1066941, 2.629577, 0, 0, 0, 1, 1,
0.3336956, -1.130781, 0.9702601, 0, 0, 0, 1, 1,
0.3362297, -0.05180964, 0.5034593, 0, 0, 0, 1, 1,
0.3423571, -0.6753993, 2.77727, 0, 0, 0, 1, 1,
0.3432779, -0.5980848, 1.935909, 0, 0, 0, 1, 1,
0.3438391, 0.1056412, 1.046712, 1, 1, 1, 1, 1,
0.3445805, 0.1961303, 1.354835, 1, 1, 1, 1, 1,
0.3459689, -0.09796483, 2.601087, 1, 1, 1, 1, 1,
0.3484311, -0.0189826, 2.085597, 1, 1, 1, 1, 1,
0.3502839, -0.4476318, 1.307962, 1, 1, 1, 1, 1,
0.3536412, -1.746385, 2.893908, 1, 1, 1, 1, 1,
0.3547575, 0.1779176, 1.106129, 1, 1, 1, 1, 1,
0.355279, 0.8397076, 0.418732, 1, 1, 1, 1, 1,
0.3583686, -0.2756401, 2.57027, 1, 1, 1, 1, 1,
0.3669214, 0.3467817, 0.6802129, 1, 1, 1, 1, 1,
0.3674283, -1.469768, 3.205521, 1, 1, 1, 1, 1,
0.3686512, -0.8065713, 3.312515, 1, 1, 1, 1, 1,
0.3692707, 0.3244705, -0.994952, 1, 1, 1, 1, 1,
0.3720189, 0.2922547, 1.000904, 1, 1, 1, 1, 1,
0.3756526, -0.05921891, 1.615552, 1, 1, 1, 1, 1,
0.3802151, -0.4204912, 0.6320613, 0, 0, 1, 1, 1,
0.3837785, 0.2807222, 1.503613, 1, 0, 0, 1, 1,
0.3840466, 0.5029601, 2.14149, 1, 0, 0, 1, 1,
0.3866743, 0.1230225, 1.534096, 1, 0, 0, 1, 1,
0.3929786, -0.656794, 3.330081, 1, 0, 0, 1, 1,
0.3931874, -1.658719, 2.330163, 1, 0, 0, 1, 1,
0.3932274, -0.5757624, 1.019915, 0, 0, 0, 1, 1,
0.3983769, -0.9138416, 1.823985, 0, 0, 0, 1, 1,
0.4058448, -0.05061692, 1.750641, 0, 0, 0, 1, 1,
0.4070579, 1.447728, 0.4393678, 0, 0, 0, 1, 1,
0.4114521, -1.032973, 0.9627554, 0, 0, 0, 1, 1,
0.4147531, -1.425069, 4.397176, 0, 0, 0, 1, 1,
0.4210087, -0.08981847, 1.593572, 0, 0, 0, 1, 1,
0.425024, 1.744889, 0.3308931, 1, 1, 1, 1, 1,
0.4281223, 0.1695193, 1.367617, 1, 1, 1, 1, 1,
0.4282971, 1.219843, 0.8849865, 1, 1, 1, 1, 1,
0.4298466, 1.299254, 0.9433506, 1, 1, 1, 1, 1,
0.431101, -1.132358, 2.360812, 1, 1, 1, 1, 1,
0.4323078, 1.898607, 1.083275, 1, 1, 1, 1, 1,
0.4325412, 0.04841017, 2.145033, 1, 1, 1, 1, 1,
0.443164, -0.1313072, 0.7941769, 1, 1, 1, 1, 1,
0.449443, 0.3344147, 1.415179, 1, 1, 1, 1, 1,
0.453447, -0.4561653, 1.040802, 1, 1, 1, 1, 1,
0.4545781, 0.2174755, 0.374696, 1, 1, 1, 1, 1,
0.4619675, -0.9968821, 2.241165, 1, 1, 1, 1, 1,
0.4643716, -0.3992861, 2.576758, 1, 1, 1, 1, 1,
0.4648445, -0.03616103, 1.811894, 1, 1, 1, 1, 1,
0.4672286, -0.3942675, 1.69578, 1, 1, 1, 1, 1,
0.4746701, 1.59479, 1.153407, 0, 0, 1, 1, 1,
0.4751392, -0.3363159, 2.771652, 1, 0, 0, 1, 1,
0.4777831, 0.5518148, 0.8714615, 1, 0, 0, 1, 1,
0.4811651, -1.718604, 3.817894, 1, 0, 0, 1, 1,
0.4865791, 0.2250986, 0.6949674, 1, 0, 0, 1, 1,
0.4895585, 0.6791044, 1.587519, 1, 0, 0, 1, 1,
0.4903085, 1.452079, 0.8003245, 0, 0, 0, 1, 1,
0.4906085, -1.069795, 1.252809, 0, 0, 0, 1, 1,
0.4918186, 0.4254481, -1.170295, 0, 0, 0, 1, 1,
0.4926716, -0.1959223, 2.160016, 0, 0, 0, 1, 1,
0.4960087, 1.21976, 0.1149278, 0, 0, 0, 1, 1,
0.5035487, -0.1198831, 0.9309151, 0, 0, 0, 1, 1,
0.5084636, -0.1656017, 0.7659339, 0, 0, 0, 1, 1,
0.5100623, -0.252644, 1.068398, 1, 1, 1, 1, 1,
0.511403, 0.806378, 0.497582, 1, 1, 1, 1, 1,
0.5139124, 0.462413, 2.244424, 1, 1, 1, 1, 1,
0.5162063, 0.2421563, 0.6056147, 1, 1, 1, 1, 1,
0.5262739, -1.311386, 1.544498, 1, 1, 1, 1, 1,
0.5270655, 1.221149, 2.018743, 1, 1, 1, 1, 1,
0.5280786, -1.938337, 1.601725, 1, 1, 1, 1, 1,
0.5289744, 0.08704793, 0.8907498, 1, 1, 1, 1, 1,
0.5301438, 1.773477, 1.19404, 1, 1, 1, 1, 1,
0.5303706, -1.198445, 2.759085, 1, 1, 1, 1, 1,
0.5316239, -0.5054113, 2.348648, 1, 1, 1, 1, 1,
0.5325837, 1.647323, 1.664609, 1, 1, 1, 1, 1,
0.5343027, 0.5374379, 0.5339431, 1, 1, 1, 1, 1,
0.5376427, 0.4359652, 1.155713, 1, 1, 1, 1, 1,
0.5391179, -1.789475, 3.507903, 1, 1, 1, 1, 1,
0.5397995, -0.7260413, 2.942964, 0, 0, 1, 1, 1,
0.5445195, 0.6138983, 3.058151, 1, 0, 0, 1, 1,
0.5510055, -0.4886456, 2.142748, 1, 0, 0, 1, 1,
0.5538411, 0.1122797, 1.453342, 1, 0, 0, 1, 1,
0.5550172, -0.9324976, 4.025428, 1, 0, 0, 1, 1,
0.5562217, 0.1913619, 1.771124, 1, 0, 0, 1, 1,
0.5577471, 0.2917947, -0.3154954, 0, 0, 0, 1, 1,
0.5607945, 0.2453243, 1.505371, 0, 0, 0, 1, 1,
0.5626085, -0.6015912, 3.203817, 0, 0, 0, 1, 1,
0.5658575, 0.6949819, 0.1038403, 0, 0, 0, 1, 1,
0.5659896, 0.6768607, 0.08934672, 0, 0, 0, 1, 1,
0.5666618, 0.005803295, 0.8329319, 0, 0, 0, 1, 1,
0.5669205, -1.560701, 0.909723, 0, 0, 0, 1, 1,
0.5698812, -2.243263, 2.380346, 1, 1, 1, 1, 1,
0.5762098, 0.09906895, -0.09810208, 1, 1, 1, 1, 1,
0.5843134, -0.4491115, 2.331821, 1, 1, 1, 1, 1,
0.5956967, 0.5568004, 0.9996113, 1, 1, 1, 1, 1,
0.5958928, -0.01993442, 1.330791, 1, 1, 1, 1, 1,
0.5962301, 0.3648068, 0.3521968, 1, 1, 1, 1, 1,
0.59893, -0.5971289, 4.309523, 1, 1, 1, 1, 1,
0.6002985, 0.6729254, 1.798552, 1, 1, 1, 1, 1,
0.6006975, 0.41594, 1.328053, 1, 1, 1, 1, 1,
0.6085065, -1.385432, 3.162345, 1, 1, 1, 1, 1,
0.6123934, -0.5203863, 3.586031, 1, 1, 1, 1, 1,
0.6133311, -1.4669, 3.108387, 1, 1, 1, 1, 1,
0.6141122, -0.3839162, 2.73565, 1, 1, 1, 1, 1,
0.6158362, 0.8193406, 0.7733573, 1, 1, 1, 1, 1,
0.6162073, 0.8694229, 0.5909196, 1, 1, 1, 1, 1,
0.6168767, 0.370667, 1.157578, 0, 0, 1, 1, 1,
0.6210801, -1.07602, 1.138298, 1, 0, 0, 1, 1,
0.6216916, 1.449999, 2.91554, 1, 0, 0, 1, 1,
0.6219335, -0.3798824, 0.7986944, 1, 0, 0, 1, 1,
0.6225243, 1.066635, 1.309101, 1, 0, 0, 1, 1,
0.6257313, -0.797044, 1.846684, 1, 0, 0, 1, 1,
0.6311072, 0.6913281, 1.799996, 0, 0, 0, 1, 1,
0.6321495, -1.32592, 1.310695, 0, 0, 0, 1, 1,
0.6326711, 0.5141901, 0.1573644, 0, 0, 0, 1, 1,
0.6330286, -0.2094039, 1.578682, 0, 0, 0, 1, 1,
0.6354855, -0.3260323, 2.050121, 0, 0, 0, 1, 1,
0.6359189, 1.065878, 0.2847628, 0, 0, 0, 1, 1,
0.6363746, -0.3635971, 3.095421, 0, 0, 0, 1, 1,
0.6368393, -0.2484453, 4.17085, 1, 1, 1, 1, 1,
0.6377558, -1.31407, 2.747279, 1, 1, 1, 1, 1,
0.6400023, 0.3487084, 1.212117, 1, 1, 1, 1, 1,
0.6438063, -0.03670199, 2.270834, 1, 1, 1, 1, 1,
0.6468087, 0.06033638, 3.624654, 1, 1, 1, 1, 1,
0.6481717, 0.08654997, 2.129627, 1, 1, 1, 1, 1,
0.6511244, -1.155071, 1.608446, 1, 1, 1, 1, 1,
0.6601641, 0.7203405, -0.8307548, 1, 1, 1, 1, 1,
0.6612315, -0.290436, 2.964394, 1, 1, 1, 1, 1,
0.6634508, 0.6334344, 0.3960409, 1, 1, 1, 1, 1,
0.6668782, 0.3732153, -0.5247136, 1, 1, 1, 1, 1,
0.66751, 0.0849909, 1.192101, 1, 1, 1, 1, 1,
0.6772469, 0.09349135, 0.9736017, 1, 1, 1, 1, 1,
0.6800632, 1.134332, 1.124134, 1, 1, 1, 1, 1,
0.6866266, -0.3807313, 1.109009, 1, 1, 1, 1, 1,
0.6918727, -1.981986, 3.903838, 0, 0, 1, 1, 1,
0.6966001, 0.6181564, -0.00667759, 1, 0, 0, 1, 1,
0.7050323, 0.5224558, 1.301894, 1, 0, 0, 1, 1,
0.7058845, 0.523366, -0.4630622, 1, 0, 0, 1, 1,
0.7084219, 1.591829, -0.7272127, 1, 0, 0, 1, 1,
0.7130681, 0.2412856, 0.3023245, 1, 0, 0, 1, 1,
0.7182966, 0.0614362, 2.376416, 0, 0, 0, 1, 1,
0.7189552, -1.02117, 1.478978, 0, 0, 0, 1, 1,
0.7208073, 1.706823, 0.1330586, 0, 0, 0, 1, 1,
0.7264455, -1.513067, 3.053203, 0, 0, 0, 1, 1,
0.7270502, 0.4465251, 0.4252758, 0, 0, 0, 1, 1,
0.7317848, -0.7606462, 3.161026, 0, 0, 0, 1, 1,
0.7321414, 0.05371648, 0.8866985, 0, 0, 0, 1, 1,
0.7343877, -0.5533873, 2.379045, 1, 1, 1, 1, 1,
0.7374679, 0.7331745, 0.4853531, 1, 1, 1, 1, 1,
0.7412495, -1.03684, 2.471839, 1, 1, 1, 1, 1,
0.7416605, 0.5628277, -0.1844725, 1, 1, 1, 1, 1,
0.7426786, -1.9849, 2.610241, 1, 1, 1, 1, 1,
0.7434167, 0.686146, -0.2765771, 1, 1, 1, 1, 1,
0.7464477, -1.363926, 3.08917, 1, 1, 1, 1, 1,
0.7619119, 0.1982059, -0.4301446, 1, 1, 1, 1, 1,
0.7619792, -0.204622, 1.624083, 1, 1, 1, 1, 1,
0.7665951, 0.5873315, -0.3098733, 1, 1, 1, 1, 1,
0.7673717, -0.5025184, 0.6313034, 1, 1, 1, 1, 1,
0.7717784, -0.9186925, 1.266299, 1, 1, 1, 1, 1,
0.7770663, -0.3298272, 1.665601, 1, 1, 1, 1, 1,
0.7770974, -1.877546, 2.996675, 1, 1, 1, 1, 1,
0.7793288, 0.02237178, 2.092792, 1, 1, 1, 1, 1,
0.7803631, 0.3546131, -0.4422808, 0, 0, 1, 1, 1,
0.7815482, -0.5366929, 2.533179, 1, 0, 0, 1, 1,
0.7854201, -0.2257585, 2.311141, 1, 0, 0, 1, 1,
0.7882345, 0.6969942, 0.6030275, 1, 0, 0, 1, 1,
0.7885813, 2.560465, 1.206518, 1, 0, 0, 1, 1,
0.7890288, 0.1853873, 2.822009, 1, 0, 0, 1, 1,
0.7900143, -1.187025, 2.941984, 0, 0, 0, 1, 1,
0.7910079, -1.814404, 3.381428, 0, 0, 0, 1, 1,
0.7914573, 0.9099994, 1.618219, 0, 0, 0, 1, 1,
0.7967321, -1.233856, 3.627773, 0, 0, 0, 1, 1,
0.8019792, 0.6282663, -0.3926385, 0, 0, 0, 1, 1,
0.8060548, 1.982338, 1.074437, 0, 0, 0, 1, 1,
0.8064316, -0.9965758, 4.067062, 0, 0, 0, 1, 1,
0.8067981, 0.4784254, 1.337809, 1, 1, 1, 1, 1,
0.811178, -1.073645, 2.171471, 1, 1, 1, 1, 1,
0.816307, 0.9764693, 0.8359122, 1, 1, 1, 1, 1,
0.8192261, -0.3342425, 1.813135, 1, 1, 1, 1, 1,
0.8221148, 0.5974063, 1.854966, 1, 1, 1, 1, 1,
0.8237185, 0.6543601, 0.5446423, 1, 1, 1, 1, 1,
0.825931, 0.6408726, -0.8789651, 1, 1, 1, 1, 1,
0.8294553, 0.2228279, 0.9704436, 1, 1, 1, 1, 1,
0.8307056, -0.0194468, 1.059637, 1, 1, 1, 1, 1,
0.831503, -0.7341077, 3.620571, 1, 1, 1, 1, 1,
0.8327096, 0.06078823, 1.247993, 1, 1, 1, 1, 1,
0.8330935, 0.4419777, 1.032355, 1, 1, 1, 1, 1,
0.8336925, 0.193789, 2.363476, 1, 1, 1, 1, 1,
0.8388225, 0.05432211, 0.9940348, 1, 1, 1, 1, 1,
0.8394725, -0.04311033, 1.56644, 1, 1, 1, 1, 1,
0.8468013, 3.088593, -0.3576051, 0, 0, 1, 1, 1,
0.8501602, -0.4666571, 2.094939, 1, 0, 0, 1, 1,
0.8605214, 1.53636, -1.397081, 1, 0, 0, 1, 1,
0.8675313, -0.5909557, 1.795335, 1, 0, 0, 1, 1,
0.8678656, 2.200507, 0.6799567, 1, 0, 0, 1, 1,
0.8726105, 0.8519599, -0.5408791, 1, 0, 0, 1, 1,
0.8756432, 0.2420137, 1.028859, 0, 0, 0, 1, 1,
0.8768465, 1.00104, -0.1597074, 0, 0, 0, 1, 1,
0.8831059, 0.09692885, 1.041782, 0, 0, 0, 1, 1,
0.8837402, -1.827651, 2.502791, 0, 0, 0, 1, 1,
0.8844171, 0.1115741, 0.7545501, 0, 0, 0, 1, 1,
0.8912166, 0.1136411, 1.037502, 0, 0, 0, 1, 1,
0.894839, -0.02681347, 1.48806, 0, 0, 0, 1, 1,
0.8979172, 0.8461046, 1.896925, 1, 1, 1, 1, 1,
0.9002318, -1.260701, 2.44495, 1, 1, 1, 1, 1,
0.9042949, -0.1255396, 0.6735215, 1, 1, 1, 1, 1,
0.9058278, 0.08496415, -0.2726649, 1, 1, 1, 1, 1,
0.91146, 0.08720918, 0.8422442, 1, 1, 1, 1, 1,
0.9115082, -0.02702182, 3.462605, 1, 1, 1, 1, 1,
0.9130944, -2.857462, 3.839945, 1, 1, 1, 1, 1,
0.9150056, -0.1530045, 0.7272909, 1, 1, 1, 1, 1,
0.9223977, 0.06731128, 0.3765411, 1, 1, 1, 1, 1,
0.9248608, 0.7410724, -0.4557208, 1, 1, 1, 1, 1,
0.9251832, -1.905875, 3.685148, 1, 1, 1, 1, 1,
0.9339597, -0.2278295, 1.797207, 1, 1, 1, 1, 1,
0.9386021, 0.4343415, -0.02923323, 1, 1, 1, 1, 1,
0.9395069, 2.052803, 0.4994342, 1, 1, 1, 1, 1,
0.9401794, 0.2513436, -0.4397337, 1, 1, 1, 1, 1,
0.9425022, 0.9643412, -0.2868511, 0, 0, 1, 1, 1,
0.9469305, -1.977572, 1.060585, 1, 0, 0, 1, 1,
0.9503041, -0.2990082, 1.646189, 1, 0, 0, 1, 1,
0.9516641, -0.5831105, 2.465539, 1, 0, 0, 1, 1,
0.9517865, 0.1991893, 1.944213, 1, 0, 0, 1, 1,
0.9520577, 0.1288502, 4.43665, 1, 0, 0, 1, 1,
0.952527, 0.3942561, 0.3476372, 0, 0, 0, 1, 1,
0.9631261, -0.5658175, 2.344216, 0, 0, 0, 1, 1,
0.9646876, 0.7487907, 1.423495, 0, 0, 0, 1, 1,
0.9667117, -0.7553749, 1.625019, 0, 0, 0, 1, 1,
0.9680693, 1.101914, 0.9221118, 0, 0, 0, 1, 1,
0.9702078, -1.649426, 0.3270621, 0, 0, 0, 1, 1,
0.9741219, 0.285083, 1.833071, 0, 0, 0, 1, 1,
0.9746501, 0.3994124, 1.653581, 1, 1, 1, 1, 1,
0.9793053, 1.452703, -2.326624, 1, 1, 1, 1, 1,
0.9796525, 0.4257054, 2.758776, 1, 1, 1, 1, 1,
0.9820923, -1.545134, 0.4373331, 1, 1, 1, 1, 1,
0.990846, -0.5818464, 1.98398, 1, 1, 1, 1, 1,
0.9933975, -0.3920628, 3.160791, 1, 1, 1, 1, 1,
0.9982994, -0.538597, 2.459606, 1, 1, 1, 1, 1,
0.9984164, -0.03260351, 1.466985, 1, 1, 1, 1, 1,
0.9988481, -0.266475, 0.5802289, 1, 1, 1, 1, 1,
0.9999264, 0.8791496, -1.281096, 1, 1, 1, 1, 1,
1.002408, 1.463492, 0.9223411, 1, 1, 1, 1, 1,
1.002852, 0.372686, 3.029449, 1, 1, 1, 1, 1,
1.003075, 0.5142604, -0.08271064, 1, 1, 1, 1, 1,
1.005787, 0.6030107, 1.600603, 1, 1, 1, 1, 1,
1.006361, 0.6957814, 0.5448788, 1, 1, 1, 1, 1,
1.010014, 0.1153075, 1.339416, 0, 0, 1, 1, 1,
1.012475, -0.2795875, 2.590618, 1, 0, 0, 1, 1,
1.014641, 1.302258, 0.8000177, 1, 0, 0, 1, 1,
1.019716, 0.2387737, 0.7905021, 1, 0, 0, 1, 1,
1.02062, -2.173777, 4.289534, 1, 0, 0, 1, 1,
1.022564, 1.329665, -1.076793, 1, 0, 0, 1, 1,
1.041007, -1.518574, 3.449685, 0, 0, 0, 1, 1,
1.042447, 0.271417, 0.4580373, 0, 0, 0, 1, 1,
1.043843, 1.387682, 1.378095, 0, 0, 0, 1, 1,
1.054589, 0.1580159, 2.544816, 0, 0, 0, 1, 1,
1.068081, 2.08037, 0.2784733, 0, 0, 0, 1, 1,
1.075551, -1.032756, 2.963018, 0, 0, 0, 1, 1,
1.075681, 1.244483, 1.256308, 0, 0, 0, 1, 1,
1.075816, 0.1366743, 2.340916, 1, 1, 1, 1, 1,
1.085532, 0.6371773, 0.5168672, 1, 1, 1, 1, 1,
1.086841, -0.2084192, 0.3734768, 1, 1, 1, 1, 1,
1.089989, 0.3687062, 1.90535, 1, 1, 1, 1, 1,
1.091753, 1.274603, 1.532416, 1, 1, 1, 1, 1,
1.11268, -1.236458, 0.877799, 1, 1, 1, 1, 1,
1.114911, 0.9433028, 0.4141383, 1, 1, 1, 1, 1,
1.12071, -1.93268, 1.959642, 1, 1, 1, 1, 1,
1.12371, 2.43376, 0.1315634, 1, 1, 1, 1, 1,
1.128981, 0.7698236, -0.5804353, 1, 1, 1, 1, 1,
1.135279, -1.409866, 1.485624, 1, 1, 1, 1, 1,
1.147724, 0.05559886, 1.865472, 1, 1, 1, 1, 1,
1.15097, -0.5236055, 1.983798, 1, 1, 1, 1, 1,
1.155913, 0.01473885, 1.436133, 1, 1, 1, 1, 1,
1.15666, -0.3033347, 2.332257, 1, 1, 1, 1, 1,
1.159164, -0.6670234, 0.4793027, 0, 0, 1, 1, 1,
1.160736, -0.04584545, 0.3454605, 1, 0, 0, 1, 1,
1.175984, -0.4241837, 2.574306, 1, 0, 0, 1, 1,
1.181231, 1.734386, 0.07221665, 1, 0, 0, 1, 1,
1.184563, -0.9315311, 4.734483, 1, 0, 0, 1, 1,
1.189602, 1.680427, 0.4130463, 1, 0, 0, 1, 1,
1.189618, 0.0007924653, 1.508418, 0, 0, 0, 1, 1,
1.19839, 0.4146445, 0.7400697, 0, 0, 0, 1, 1,
1.200939, -1.231918, 3.213494, 0, 0, 0, 1, 1,
1.20153, -0.7995433, 2.454602, 0, 0, 0, 1, 1,
1.202362, -0.8536452, 2.168698, 0, 0, 0, 1, 1,
1.215136, 0.7052781, 1.997776, 0, 0, 0, 1, 1,
1.217059, 0.8460896, 2.277767, 0, 0, 0, 1, 1,
1.217295, 0.1131377, 1.940329, 1, 1, 1, 1, 1,
1.222871, -0.2637767, -0.03916072, 1, 1, 1, 1, 1,
1.225034, 1.602403, 1.202685, 1, 1, 1, 1, 1,
1.231049, 0.7547958, 1.52178, 1, 1, 1, 1, 1,
1.235253, -2.889922, 2.604803, 1, 1, 1, 1, 1,
1.241411, -0.356749, 2.465174, 1, 1, 1, 1, 1,
1.245373, 0.4934424, 0.370083, 1, 1, 1, 1, 1,
1.248006, -0.2202068, 2.891404, 1, 1, 1, 1, 1,
1.259823, -0.6019652, 4.254414, 1, 1, 1, 1, 1,
1.262856, 0.4906008, 2.068291, 1, 1, 1, 1, 1,
1.26748, -2.146786, 2.535772, 1, 1, 1, 1, 1,
1.268793, 1.337336, 2.122426, 1, 1, 1, 1, 1,
1.269801, -0.206294, 1.229858, 1, 1, 1, 1, 1,
1.275789, -0.5683251, 2.154928, 1, 1, 1, 1, 1,
1.277238, -0.245459, 1.024507, 1, 1, 1, 1, 1,
1.293395, -2.34027, 1.519111, 0, 0, 1, 1, 1,
1.314131, 1.199723, 0.8324441, 1, 0, 0, 1, 1,
1.316008, 1.134169, 0.868003, 1, 0, 0, 1, 1,
1.323165, -1.487245, 2.948988, 1, 0, 0, 1, 1,
1.327699, -1.513104, 1.97073, 1, 0, 0, 1, 1,
1.328108, 0.7332013, 1.517785, 1, 0, 0, 1, 1,
1.332292, -1.377753, 2.46559, 0, 0, 0, 1, 1,
1.335477, 0.03600615, 0.3030331, 0, 0, 0, 1, 1,
1.349028, 0.3945032, 0.04968496, 0, 0, 0, 1, 1,
1.350554, -1.860175, 3.405186, 0, 0, 0, 1, 1,
1.351292, -1.333341, 2.642335, 0, 0, 0, 1, 1,
1.353501, 0.4224072, 1.058305, 0, 0, 0, 1, 1,
1.355019, -0.1147118, 1.65232, 0, 0, 0, 1, 1,
1.365117, 1.367594, 1.537548, 1, 1, 1, 1, 1,
1.366212, -1.572743, 1.31487, 1, 1, 1, 1, 1,
1.371927, 0.1827319, 1.877754, 1, 1, 1, 1, 1,
1.373815, 0.1876422, 1.659494, 1, 1, 1, 1, 1,
1.37417, 0.975221, 1.832246, 1, 1, 1, 1, 1,
1.398011, 0.4742975, 0.7498579, 1, 1, 1, 1, 1,
1.424507, 0.3045242, 1.036143, 1, 1, 1, 1, 1,
1.427586, 0.7370197, 0.1584931, 1, 1, 1, 1, 1,
1.430971, 1.292543, 0.5157309, 1, 1, 1, 1, 1,
1.437248, -0.5412561, 1.585433, 1, 1, 1, 1, 1,
1.439054, -0.6670431, 1.610716, 1, 1, 1, 1, 1,
1.439907, -0.1779646, 2.397602, 1, 1, 1, 1, 1,
1.440556, -1.15044, 2.242756, 1, 1, 1, 1, 1,
1.442887, 1.276969, 0.4303406, 1, 1, 1, 1, 1,
1.447854, 0.296716, 1.32075, 1, 1, 1, 1, 1,
1.453596, 0.9466532, 1.445096, 0, 0, 1, 1, 1,
1.453884, 1.570441, 0.6048721, 1, 0, 0, 1, 1,
1.464364, -1.687112, 1.670985, 1, 0, 0, 1, 1,
1.466898, 0.7163956, -0.8048113, 1, 0, 0, 1, 1,
1.469385, 0.8738959, 1.786788, 1, 0, 0, 1, 1,
1.513027, -1.155282, 2.007384, 1, 0, 0, 1, 1,
1.528246, 0.4749905, 0.6554579, 0, 0, 0, 1, 1,
1.538264, -0.09256112, 1.994821, 0, 0, 0, 1, 1,
1.545439, 0.5327619, 0.3892906, 0, 0, 0, 1, 1,
1.551786, -1.176821, 1.669928, 0, 0, 0, 1, 1,
1.570235, -0.8108033, 1.263615, 0, 0, 0, 1, 1,
1.571888, 1.281085, 0.5659307, 0, 0, 0, 1, 1,
1.576652, 0.1936745, 0.9557007, 0, 0, 0, 1, 1,
1.578834, 1.228752, 0.9315399, 1, 1, 1, 1, 1,
1.580878, -0.2491926, 2.358787, 1, 1, 1, 1, 1,
1.583105, 0.6861832, 0.3028104, 1, 1, 1, 1, 1,
1.587767, -0.7754845, 2.50699, 1, 1, 1, 1, 1,
1.587999, 0.436893, 0.7437139, 1, 1, 1, 1, 1,
1.618721, 0.03702917, 1.27022, 1, 1, 1, 1, 1,
1.620738, -1.172348, 1.466341, 1, 1, 1, 1, 1,
1.623963, -0.8703982, 1.407676, 1, 1, 1, 1, 1,
1.648609, -1.769834, 2.241822, 1, 1, 1, 1, 1,
1.673033, -0.02866951, 1.901745, 1, 1, 1, 1, 1,
1.692251, -0.8130204, 1.803679, 1, 1, 1, 1, 1,
1.703091, 1.329415, 2.441589, 1, 1, 1, 1, 1,
1.703107, -1.15238, 2.721031, 1, 1, 1, 1, 1,
1.733389, 0.9952773, 0.4567849, 1, 1, 1, 1, 1,
1.740143, 0.7097887, 0.9090217, 1, 1, 1, 1, 1,
1.768686, -0.4941142, 1.75153, 0, 0, 1, 1, 1,
1.777394, -0.559002, 0.1046507, 1, 0, 0, 1, 1,
1.793597, 1.015429, 0.2301159, 1, 0, 0, 1, 1,
1.813401, -0.7241005, 2.946164, 1, 0, 0, 1, 1,
1.83258, 1.360678, 0.855105, 1, 0, 0, 1, 1,
1.842804, -0.2265324, 0.8607997, 1, 0, 0, 1, 1,
1.848675, -1.282954, 0.1926758, 0, 0, 0, 1, 1,
1.852492, 0.8075629, -0.1573175, 0, 0, 0, 1, 1,
1.866857, -0.1388435, 3.255108, 0, 0, 0, 1, 1,
1.86893, -0.2182829, 0.5294449, 0, 0, 0, 1, 1,
1.8856, -0.3889553, 0.9210256, 0, 0, 0, 1, 1,
1.900898, -0.2489065, 1.210445, 0, 0, 0, 1, 1,
1.905752, -1.038241, 0.6080564, 0, 0, 0, 1, 1,
1.907047, 0.5236704, 2.683037, 1, 1, 1, 1, 1,
1.920076, -1.93039, 3.382183, 1, 1, 1, 1, 1,
1.935777, -0.4886069, 1.062168, 1, 1, 1, 1, 1,
1.93588, -0.5838132, 1.992601, 1, 1, 1, 1, 1,
1.936565, -0.2096603, 2.300479, 1, 1, 1, 1, 1,
1.953563, -0.2774316, 0.7920199, 1, 1, 1, 1, 1,
1.959672, 1.138331, 0.748474, 1, 1, 1, 1, 1,
1.978368, 0.3139631, 0.3209096, 1, 1, 1, 1, 1,
1.979579, 1.138939, 2.504079, 1, 1, 1, 1, 1,
2.004126, -1.269026, 2.753803, 1, 1, 1, 1, 1,
2.019499, -0.9418653, 2.480833, 1, 1, 1, 1, 1,
2.025615, -1.249821, 1.651312, 1, 1, 1, 1, 1,
2.044762, 0.2011561, 0.9578185, 1, 1, 1, 1, 1,
2.072941, 0.1047695, 1.325732, 1, 1, 1, 1, 1,
2.077291, 0.3266592, 1.006155, 1, 1, 1, 1, 1,
2.115055, -1.277866, 2.898288, 0, 0, 1, 1, 1,
2.142348, 1.166163, 1.38334, 1, 0, 0, 1, 1,
2.149274, -1.499275, 0.9403799, 1, 0, 0, 1, 1,
2.185578, -1.007605, 2.425036, 1, 0, 0, 1, 1,
2.262768, -0.6885251, 3.770548, 1, 0, 0, 1, 1,
2.264746, -1.434786, 1.838519, 1, 0, 0, 1, 1,
2.264787, -0.1942424, 3.411808, 0, 0, 0, 1, 1,
2.286573, -0.4686753, 2.484862, 0, 0, 0, 1, 1,
2.320747, 1.468043, -1.352926, 0, 0, 0, 1, 1,
2.449751, 1.053904, 1.555936, 0, 0, 0, 1, 1,
2.49119, -0.6692731, 1.682663, 0, 0, 0, 1, 1,
2.591602, 3.042733, -1.036715, 0, 0, 0, 1, 1,
2.676883, -0.878616, 1.918365, 0, 0, 0, 1, 1,
2.7168, -0.438933, 2.002813, 1, 1, 1, 1, 1,
2.856714, -0.1323945, 2.097532, 1, 1, 1, 1, 1,
2.885311, 0.7004258, 0.8510246, 1, 1, 1, 1, 1,
3.065265, -0.5835606, 2.174321, 1, 1, 1, 1, 1,
3.086211, -0.8482593, 1.618678, 1, 1, 1, 1, 1,
3.215896, -0.802926, 1.505467, 1, 1, 1, 1, 1,
3.259477, -0.21272, 1.468869, 1, 1, 1, 1, 1
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
var radius = 9.898763;
var distance = 34.76898;
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
mvMatrix.translate( -0.2271975, -0.3554715, -0.2850299 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76898);
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
