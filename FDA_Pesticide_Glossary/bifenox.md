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
-3.537163, 2.235408, -0.1107017, 1, 0, 0, 1,
-3.361704, -1.988997, -2.323512, 1, 0.007843138, 0, 1,
-3.272758, -0.354105, -1.371886, 1, 0.01176471, 0, 1,
-3.147465, -0.8075647, -0.8638455, 1, 0.01960784, 0, 1,
-2.789991, 0.1927248, -1.306882, 1, 0.02352941, 0, 1,
-2.774639, 0.8653575, -1.606379, 1, 0.03137255, 0, 1,
-2.728916, 0.8583347, -2.330589, 1, 0.03529412, 0, 1,
-2.694359, 0.4703889, -2.068504, 1, 0.04313726, 0, 1,
-2.661159, 0.1538834, -1.057177, 1, 0.04705882, 0, 1,
-2.599495, -1.014476, -0.3008859, 1, 0.05490196, 0, 1,
-2.536076, -1.477335, -3.082735, 1, 0.05882353, 0, 1,
-2.401392, -0.6045533, -3.305543, 1, 0.06666667, 0, 1,
-2.298051, 1.11039, -0.611515, 1, 0.07058824, 0, 1,
-2.25466, -1.374612, -1.76423, 1, 0.07843138, 0, 1,
-2.207224, 0.6218829, 0.04715265, 1, 0.08235294, 0, 1,
-2.206193, 0.5923561, -1.888482, 1, 0.09019608, 0, 1,
-2.203007, -1.713356, -2.60511, 1, 0.09411765, 0, 1,
-2.199441, 2.089157, -0.7929969, 1, 0.1019608, 0, 1,
-2.180841, -1.2525, -4.493229, 1, 0.1098039, 0, 1,
-2.126831, 0.8873527, -2.34177, 1, 0.1137255, 0, 1,
-2.122497, -0.007483576, -0.6123459, 1, 0.1215686, 0, 1,
-2.120599, 0.9689413, -1.457176, 1, 0.1254902, 0, 1,
-2.076302, -0.8895264, -2.644837, 1, 0.1333333, 0, 1,
-2.074692, -0.03469622, -2.406448, 1, 0.1372549, 0, 1,
-2.074295, -1.375185, -2.531056, 1, 0.145098, 0, 1,
-2.071728, 0.4075497, -1.042375, 1, 0.1490196, 0, 1,
-2.060074, 0.8186968, -1.173489, 1, 0.1568628, 0, 1,
-2.058783, -0.1961045, -1.929179, 1, 0.1607843, 0, 1,
-1.997777, 0.3501907, 0.01423917, 1, 0.1686275, 0, 1,
-1.992676, 1.627643, -1.243928, 1, 0.172549, 0, 1,
-1.986774, 0.7177593, -0.6739779, 1, 0.1803922, 0, 1,
-1.977643, 0.465696, -1.981581, 1, 0.1843137, 0, 1,
-1.960496, -1.144241, -3.043469, 1, 0.1921569, 0, 1,
-1.947667, -0.4779741, -3.206089, 1, 0.1960784, 0, 1,
-1.94741, -0.4490931, -2.597674, 1, 0.2039216, 0, 1,
-1.942869, -1.856815, -3.081843, 1, 0.2117647, 0, 1,
-1.923887, 0.6284909, -1.9125, 1, 0.2156863, 0, 1,
-1.892508, -1.646519, -2.208997, 1, 0.2235294, 0, 1,
-1.867194, 0.01189203, -0.5715449, 1, 0.227451, 0, 1,
-1.862746, -0.2249698, -2.703048, 1, 0.2352941, 0, 1,
-1.857863, -0.5836536, -1.278687, 1, 0.2392157, 0, 1,
-1.852626, 0.04008777, -1.036164, 1, 0.2470588, 0, 1,
-1.835896, 0.6300721, -2.307843, 1, 0.2509804, 0, 1,
-1.818464, -0.1607197, -0.9212804, 1, 0.2588235, 0, 1,
-1.815758, -0.9931475, -1.65992, 1, 0.2627451, 0, 1,
-1.809176, -1.781281, -2.865148, 1, 0.2705882, 0, 1,
-1.796938, 0.1616283, -2.465311, 1, 0.2745098, 0, 1,
-1.787505, -0.1516016, -0.8190055, 1, 0.282353, 0, 1,
-1.770001, 1.04463, -0.9181622, 1, 0.2862745, 0, 1,
-1.75323, 0.1081487, -0.2104556, 1, 0.2941177, 0, 1,
-1.751973, -0.8296088, -1.887641, 1, 0.3019608, 0, 1,
-1.744483, -0.3543682, -0.9875431, 1, 0.3058824, 0, 1,
-1.741122, 0.04416785, -0.9052719, 1, 0.3137255, 0, 1,
-1.726382, 0.9666437, -2.565486, 1, 0.3176471, 0, 1,
-1.721914, -0.1355817, -3.735235, 1, 0.3254902, 0, 1,
-1.716763, 1.122073, -1.593689, 1, 0.3294118, 0, 1,
-1.716001, 1.110863, -1.05972, 1, 0.3372549, 0, 1,
-1.714051, 0.7121581, -1.102388, 1, 0.3411765, 0, 1,
-1.704016, -0.2407903, -0.5942107, 1, 0.3490196, 0, 1,
-1.672501, -0.1287155, -1.464477, 1, 0.3529412, 0, 1,
-1.66733, 0.1028945, -0.874976, 1, 0.3607843, 0, 1,
-1.657805, -1.043042, -2.754242, 1, 0.3647059, 0, 1,
-1.644276, -0.1738696, -0.2516288, 1, 0.372549, 0, 1,
-1.634634, 0.6212022, 1.376983, 1, 0.3764706, 0, 1,
-1.63397, 1.891944, -1.555647, 1, 0.3843137, 0, 1,
-1.633417, -0.6079583, -3.029956, 1, 0.3882353, 0, 1,
-1.631296, 0.09349731, -1.382172, 1, 0.3960784, 0, 1,
-1.624608, -0.08568239, -1.325144, 1, 0.4039216, 0, 1,
-1.620659, -0.2553212, -1.327544, 1, 0.4078431, 0, 1,
-1.611788, -0.5907112, -2.636296, 1, 0.4156863, 0, 1,
-1.610608, -1.817663, -3.268081, 1, 0.4196078, 0, 1,
-1.609707, 1.409233, -2.292372, 1, 0.427451, 0, 1,
-1.596922, 1.137206, 1.586037, 1, 0.4313726, 0, 1,
-1.559117, 0.3593258, -0.7639938, 1, 0.4392157, 0, 1,
-1.5499, 0.714642, -0.09111621, 1, 0.4431373, 0, 1,
-1.54351, -2.04319, -3.191652, 1, 0.4509804, 0, 1,
-1.542603, -0.1244706, -3.929095, 1, 0.454902, 0, 1,
-1.541941, 0.550487, -0.7289557, 1, 0.4627451, 0, 1,
-1.540391, -0.8380203, -3.048462, 1, 0.4666667, 0, 1,
-1.539136, -0.03242091, -0.7771027, 1, 0.4745098, 0, 1,
-1.528454, -0.4232367, -0.2266531, 1, 0.4784314, 0, 1,
-1.523239, 1.036287, 0.2263524, 1, 0.4862745, 0, 1,
-1.517201, -2.347242, -2.143721, 1, 0.4901961, 0, 1,
-1.501262, 0.09411533, -0.8288413, 1, 0.4980392, 0, 1,
-1.499723, -0.965806, -0.8788951, 1, 0.5058824, 0, 1,
-1.495237, 0.7834674, 1.20115, 1, 0.509804, 0, 1,
-1.494763, 0.4044268, -2.263537, 1, 0.5176471, 0, 1,
-1.483007, 0.2153482, -2.102732, 1, 0.5215687, 0, 1,
-1.480435, 1.000072, -0.9742117, 1, 0.5294118, 0, 1,
-1.467796, -1.502341, -1.327415, 1, 0.5333334, 0, 1,
-1.467772, 1.314076, -0.1728256, 1, 0.5411765, 0, 1,
-1.447182, 0.4043519, -0.9015621, 1, 0.5450981, 0, 1,
-1.443359, 0.4906734, -1.39384, 1, 0.5529412, 0, 1,
-1.427874, -0.5784289, -3.166865, 1, 0.5568628, 0, 1,
-1.4223, -0.4359935, -2.684589, 1, 0.5647059, 0, 1,
-1.414257, -0.5291688, -2.975726, 1, 0.5686275, 0, 1,
-1.412389, -1.519515, -2.955359, 1, 0.5764706, 0, 1,
-1.411636, 0.2147962, -1.442787, 1, 0.5803922, 0, 1,
-1.406722, 0.1695388, -1.532469, 1, 0.5882353, 0, 1,
-1.39968, 0.1895963, -2.860242, 1, 0.5921569, 0, 1,
-1.395116, -0.07965789, -4.485349, 1, 0.6, 0, 1,
-1.384174, -1.229792, -1.562744, 1, 0.6078432, 0, 1,
-1.383095, 0.4069129, -0.06651861, 1, 0.6117647, 0, 1,
-1.366638, -0.6771331, -1.362463, 1, 0.6196079, 0, 1,
-1.352854, -0.07187995, -1.607968, 1, 0.6235294, 0, 1,
-1.347281, -0.2333739, -1.674823, 1, 0.6313726, 0, 1,
-1.336742, 1.088914, -1.30576, 1, 0.6352941, 0, 1,
-1.335959, -0.6247824, -2.744917, 1, 0.6431373, 0, 1,
-1.329474, -1.524347, -2.243857, 1, 0.6470588, 0, 1,
-1.316825, -1.042012, -2.191082, 1, 0.654902, 0, 1,
-1.312911, -0.3266416, -0.6313096, 1, 0.6588235, 0, 1,
-1.309801, -1.327398, -4.754408, 1, 0.6666667, 0, 1,
-1.280486, -0.4683802, -1.569552, 1, 0.6705883, 0, 1,
-1.267972, 0.6018264, -1.092218, 1, 0.6784314, 0, 1,
-1.264247, 0.2212067, -3.240491, 1, 0.682353, 0, 1,
-1.257688, -1.228743, -3.005194, 1, 0.6901961, 0, 1,
-1.252774, -0.1936674, -2.089275, 1, 0.6941177, 0, 1,
-1.245635, -1.203557, -3.646798, 1, 0.7019608, 0, 1,
-1.229344, 2.177382, 0.03071557, 1, 0.7098039, 0, 1,
-1.228727, -3.288793, -3.864021, 1, 0.7137255, 0, 1,
-1.225671, -1.315366, -1.487099, 1, 0.7215686, 0, 1,
-1.217584, -1.649847, -4.759012, 1, 0.7254902, 0, 1,
-1.216291, 0.7057573, 0.007956939, 1, 0.7333333, 0, 1,
-1.210935, 1.671661, -0.80214, 1, 0.7372549, 0, 1,
-1.207831, 1.985217, 0.1649411, 1, 0.7450981, 0, 1,
-1.192961, 1.558157, 0.6743832, 1, 0.7490196, 0, 1,
-1.184449, 2.152893, 0.725301, 1, 0.7568628, 0, 1,
-1.17889, 1.168283, -0.1714425, 1, 0.7607843, 0, 1,
-1.16276, -0.1342529, 0.2934672, 1, 0.7686275, 0, 1,
-1.157278, -1.462366, -1.231986, 1, 0.772549, 0, 1,
-1.144186, -0.2258551, -3.768858, 1, 0.7803922, 0, 1,
-1.139305, -0.4348107, -1.29709, 1, 0.7843137, 0, 1,
-1.122198, -0.3679923, -3.186196, 1, 0.7921569, 0, 1,
-1.120543, 0.1996568, -2.397697, 1, 0.7960784, 0, 1,
-1.120197, 0.4435448, -2.191554, 1, 0.8039216, 0, 1,
-1.106438, -0.436597, -4.098053, 1, 0.8117647, 0, 1,
-1.104221, -0.7577131, -1.094767, 1, 0.8156863, 0, 1,
-1.09951, -0.8851571, -1.616842, 1, 0.8235294, 0, 1,
-1.091951, 1.414216, -2.316114, 1, 0.827451, 0, 1,
-1.090469, -0.5438095, -1.895524, 1, 0.8352941, 0, 1,
-1.089922, -0.106037, -2.191227, 1, 0.8392157, 0, 1,
-1.084607, 1.997243, -0.8290356, 1, 0.8470588, 0, 1,
-1.082137, 1.375493, 0.8425141, 1, 0.8509804, 0, 1,
-1.079142, -1.071027, -4.222579, 1, 0.8588235, 0, 1,
-1.076311, 1.104162, -1.626049, 1, 0.8627451, 0, 1,
-1.067705, -0.6338763, -1.595564, 1, 0.8705882, 0, 1,
-1.055685, 0.3266699, -0.7315223, 1, 0.8745098, 0, 1,
-1.053901, -0.8603934, -2.983465, 1, 0.8823529, 0, 1,
-1.050178, -0.1825302, -3.604148, 1, 0.8862745, 0, 1,
-1.044709, 1.186317, 0.9084049, 1, 0.8941177, 0, 1,
-1.035102, -0.8959444, -2.566986, 1, 0.8980392, 0, 1,
-1.035068, 0.006060246, -1.512892, 1, 0.9058824, 0, 1,
-1.030436, -1.304957, -4.263047, 1, 0.9137255, 0, 1,
-1.02418, 0.4057193, -0.8239911, 1, 0.9176471, 0, 1,
-1.022836, -1.91042, -3.235714, 1, 0.9254902, 0, 1,
-1.022735, -2.718198, -4.037035, 1, 0.9294118, 0, 1,
-1.021534, -1.084428, -0.9223222, 1, 0.9372549, 0, 1,
-1.019304, -0.1775225, -1.488096, 1, 0.9411765, 0, 1,
-1.011771, -0.7153283, -1.582097, 1, 0.9490196, 0, 1,
-1.011273, 0.9182707, -0.9339855, 1, 0.9529412, 0, 1,
-1.009933, -0.2895316, -4.026772, 1, 0.9607843, 0, 1,
-1.005398, -0.2357814, -0.5358509, 1, 0.9647059, 0, 1,
-0.9934089, 0.9994847, -2.428596, 1, 0.972549, 0, 1,
-0.9928749, 0.2440658, -2.221612, 1, 0.9764706, 0, 1,
-0.9904398, -0.6614279, -2.443702, 1, 0.9843137, 0, 1,
-0.9836224, -0.8619144, -2.134081, 1, 0.9882353, 0, 1,
-0.9835572, 0.02961747, -1.358292, 1, 0.9960784, 0, 1,
-0.9762805, 1.040276, -0.01212911, 0.9960784, 1, 0, 1,
-0.9740377, 0.1457516, -0.3751126, 0.9921569, 1, 0, 1,
-0.9697785, -2.125333, -3.072065, 0.9843137, 1, 0, 1,
-0.9691275, -1.208188, -1.729566, 0.9803922, 1, 0, 1,
-0.9682432, -0.3016473, -0.7909486, 0.972549, 1, 0, 1,
-0.9538757, 0.1869361, -1.686136, 0.9686275, 1, 0, 1,
-0.9511217, -1.347806, -4.834981, 0.9607843, 1, 0, 1,
-0.9483457, -0.04357748, -0.9125405, 0.9568627, 1, 0, 1,
-0.9443527, 0.1274557, -1.627671, 0.9490196, 1, 0, 1,
-0.9386535, -0.3716215, -2.60884, 0.945098, 1, 0, 1,
-0.9384714, 1.31736, 0.4606425, 0.9372549, 1, 0, 1,
-0.9361756, -0.654447, -2.644976, 0.9333333, 1, 0, 1,
-0.9284973, 0.5967348, -1.856852, 0.9254902, 1, 0, 1,
-0.9259482, -0.4353787, -2.559101, 0.9215686, 1, 0, 1,
-0.9245058, 0.1418316, -0.6207334, 0.9137255, 1, 0, 1,
-0.9237577, -0.6359655, -1.673036, 0.9098039, 1, 0, 1,
-0.9230238, 0.3029186, -1.706966, 0.9019608, 1, 0, 1,
-0.9222268, -1.047438, -1.217939, 0.8941177, 1, 0, 1,
-0.9213639, 1.464288, -0.02920467, 0.8901961, 1, 0, 1,
-0.9189001, 0.08745754, -1.433552, 0.8823529, 1, 0, 1,
-0.913995, -1.04636, -1.413737, 0.8784314, 1, 0, 1,
-0.911549, 0.2252603, 0.07407352, 0.8705882, 1, 0, 1,
-0.9101849, -0.9699536, -1.636269, 0.8666667, 1, 0, 1,
-0.906637, -1.119539, -2.78705, 0.8588235, 1, 0, 1,
-0.9065537, 0.6204903, -0.4476964, 0.854902, 1, 0, 1,
-0.9055837, 1.048886, -1.791684, 0.8470588, 1, 0, 1,
-0.9048007, 1.204245, -1.941438, 0.8431373, 1, 0, 1,
-0.8960433, -0.7450106, -1.665542, 0.8352941, 1, 0, 1,
-0.8942767, 0.5482044, -1.174431, 0.8313726, 1, 0, 1,
-0.8893453, -0.1769369, -1.851491, 0.8235294, 1, 0, 1,
-0.8869253, 0.776674, -1.739459, 0.8196079, 1, 0, 1,
-0.8837093, -1.55391, -1.199903, 0.8117647, 1, 0, 1,
-0.8825571, -0.08495416, -1.276079, 0.8078431, 1, 0, 1,
-0.8818775, 1.118294, -2.254871, 0.8, 1, 0, 1,
-0.8813525, 0.6543169, 0.3003494, 0.7921569, 1, 0, 1,
-0.8801013, 0.8192581, -0.8919984, 0.7882353, 1, 0, 1,
-0.8761018, 0.08376599, -2.140002, 0.7803922, 1, 0, 1,
-0.8720747, -0.988238, -0.7764388, 0.7764706, 1, 0, 1,
-0.871504, 1.242799, -1.490878, 0.7686275, 1, 0, 1,
-0.871223, -0.5557601, -1.682282, 0.7647059, 1, 0, 1,
-0.8665926, 2.071428, -0.5948536, 0.7568628, 1, 0, 1,
-0.8624164, 0.9715386, -0.02235722, 0.7529412, 1, 0, 1,
-0.8608937, -1.361517, -2.18706, 0.7450981, 1, 0, 1,
-0.8549922, 0.9541054, 0.2633447, 0.7411765, 1, 0, 1,
-0.850457, 0.9705709, 0.2555969, 0.7333333, 1, 0, 1,
-0.8471431, 1.369613, -0.001743076, 0.7294118, 1, 0, 1,
-0.8466381, 0.1696064, -2.283999, 0.7215686, 1, 0, 1,
-0.8447515, 0.3253525, -1.244994, 0.7176471, 1, 0, 1,
-0.8431512, 1.146251, -1.187374, 0.7098039, 1, 0, 1,
-0.8317017, 2.493273, -0.4110449, 0.7058824, 1, 0, 1,
-0.8276588, 1.372608, -2.122221, 0.6980392, 1, 0, 1,
-0.8253488, 1.350685, -0.126588, 0.6901961, 1, 0, 1,
-0.8250203, -0.8716601, -3.028413, 0.6862745, 1, 0, 1,
-0.823431, 1.097208, 0.6824982, 0.6784314, 1, 0, 1,
-0.8156017, 0.1923501, -1.203097, 0.6745098, 1, 0, 1,
-0.8129394, -1.17741, -2.521785, 0.6666667, 1, 0, 1,
-0.8113363, -0.908123, -1.398542, 0.6627451, 1, 0, 1,
-0.8110802, -0.8364092, -3.393788, 0.654902, 1, 0, 1,
-0.8096757, 1.356494, -1.23781, 0.6509804, 1, 0, 1,
-0.8061737, 1.162194, -0.660843, 0.6431373, 1, 0, 1,
-0.8017083, -0.9621614, -0.9666626, 0.6392157, 1, 0, 1,
-0.7982273, -0.1634341, -2.524601, 0.6313726, 1, 0, 1,
-0.7917054, 0.6028852, -0.4435733, 0.627451, 1, 0, 1,
-0.7834998, -0.4408442, -1.478727, 0.6196079, 1, 0, 1,
-0.7592069, -1.010132, -1.768554, 0.6156863, 1, 0, 1,
-0.7557396, -0.3129683, -0.362809, 0.6078432, 1, 0, 1,
-0.7507874, 2.459971, -0.9319715, 0.6039216, 1, 0, 1,
-0.7498599, -0.8694318, -1.115979, 0.5960785, 1, 0, 1,
-0.7490202, -2.02309, -1.232028, 0.5882353, 1, 0, 1,
-0.7232401, -0.1722814, -0.7851342, 0.5843138, 1, 0, 1,
-0.7214454, 0.6437311, -0.6933815, 0.5764706, 1, 0, 1,
-0.7212923, 0.9845748, -0.5060057, 0.572549, 1, 0, 1,
-0.7208321, -0.03493815, -1.589002, 0.5647059, 1, 0, 1,
-0.7096753, 0.7752609, -0.6318609, 0.5607843, 1, 0, 1,
-0.7092434, 0.1118175, -2.606405, 0.5529412, 1, 0, 1,
-0.7055457, 0.432877, -0.5191841, 0.5490196, 1, 0, 1,
-0.7024645, 0.9839393, -2.308553, 0.5411765, 1, 0, 1,
-0.7007337, -2.002472, -2.082436, 0.5372549, 1, 0, 1,
-0.6972598, 1.010674, -2.577538, 0.5294118, 1, 0, 1,
-0.6930586, -1.786872, -2.372765, 0.5254902, 1, 0, 1,
-0.6881259, 0.06723285, -1.830439, 0.5176471, 1, 0, 1,
-0.68699, 0.4032089, -1.300505, 0.5137255, 1, 0, 1,
-0.6840935, -0.5321786, -0.8516936, 0.5058824, 1, 0, 1,
-0.6819504, -0.2234605, -1.424874, 0.5019608, 1, 0, 1,
-0.6806883, 0.377318, -0.6545678, 0.4941176, 1, 0, 1,
-0.676703, 0.2866092, -1.10263, 0.4862745, 1, 0, 1,
-0.6613024, -0.7668932, -3.963487, 0.4823529, 1, 0, 1,
-0.6600674, 0.6763164, 0.02501687, 0.4745098, 1, 0, 1,
-0.6594948, -0.09821828, -2.668087, 0.4705882, 1, 0, 1,
-0.6576083, 0.6326657, -1.021386, 0.4627451, 1, 0, 1,
-0.6560326, -1.933439, -1.506779, 0.4588235, 1, 0, 1,
-0.6530412, -0.621469, -1.054857, 0.4509804, 1, 0, 1,
-0.6518632, -0.2808862, -3.07739, 0.4470588, 1, 0, 1,
-0.6485781, -1.824795, -2.425312, 0.4392157, 1, 0, 1,
-0.6462901, -1.102671, -1.79819, 0.4352941, 1, 0, 1,
-0.6419345, -0.01044663, -2.36616, 0.427451, 1, 0, 1,
-0.6391711, -0.4117284, -2.365004, 0.4235294, 1, 0, 1,
-0.6369389, 0.4512259, -0.5765508, 0.4156863, 1, 0, 1,
-0.6344939, 2.208143, 1.289126, 0.4117647, 1, 0, 1,
-0.6320082, 0.5608905, -0.3264188, 0.4039216, 1, 0, 1,
-0.6319631, -1.257971, -2.020063, 0.3960784, 1, 0, 1,
-0.6318648, 0.1691985, -2.410913, 0.3921569, 1, 0, 1,
-0.6274365, 1.634011, -1.032943, 0.3843137, 1, 0, 1,
-0.6273182, -1.357399, -2.271692, 0.3803922, 1, 0, 1,
-0.6265931, -0.8313763, -2.464587, 0.372549, 1, 0, 1,
-0.625216, -0.3056158, -2.216165, 0.3686275, 1, 0, 1,
-0.6225603, -0.6568943, -2.635038, 0.3607843, 1, 0, 1,
-0.6214113, -1.222088, -3.459549, 0.3568628, 1, 0, 1,
-0.6205374, 1.667585, 0.3242732, 0.3490196, 1, 0, 1,
-0.6204086, -1.067352, -3.79272, 0.345098, 1, 0, 1,
-0.6194303, 0.226754, -2.092299, 0.3372549, 1, 0, 1,
-0.6164991, 0.6991041, 0.4124631, 0.3333333, 1, 0, 1,
-0.6060932, 0.1955519, -2.332328, 0.3254902, 1, 0, 1,
-0.6024598, 0.8479176, 1.011185, 0.3215686, 1, 0, 1,
-0.5932494, 2.324069, 1.162771, 0.3137255, 1, 0, 1,
-0.5916687, 0.8473256, 0.3229882, 0.3098039, 1, 0, 1,
-0.5913245, 0.9959219, -0.1931381, 0.3019608, 1, 0, 1,
-0.591306, -0.1307498, -2.163803, 0.2941177, 1, 0, 1,
-0.5903141, -0.2004864, -1.789037, 0.2901961, 1, 0, 1,
-0.5843151, 0.0193845, -2.114487, 0.282353, 1, 0, 1,
-0.5822476, 0.5366674, -2.201139, 0.2784314, 1, 0, 1,
-0.5759568, 0.0145005, -1.83885, 0.2705882, 1, 0, 1,
-0.5695571, -1.339644, -2.605373, 0.2666667, 1, 0, 1,
-0.5603973, 0.1697375, -0.4629773, 0.2588235, 1, 0, 1,
-0.5603427, -0.65558, -3.113163, 0.254902, 1, 0, 1,
-0.5578279, -1.618343, -2.30373, 0.2470588, 1, 0, 1,
-0.5553131, -0.3047993, -3.744563, 0.2431373, 1, 0, 1,
-0.5470451, 0.2270556, -0.4480023, 0.2352941, 1, 0, 1,
-0.5469099, -0.004688284, -0.003453836, 0.2313726, 1, 0, 1,
-0.5468684, -0.6878988, -1.757423, 0.2235294, 1, 0, 1,
-0.5389521, -0.6481675, -2.349938, 0.2196078, 1, 0, 1,
-0.53753, 1.234582, 0.1805609, 0.2117647, 1, 0, 1,
-0.5328622, 0.554283, -1.396458, 0.2078431, 1, 0, 1,
-0.5320921, 0.3936771, -0.0411383, 0.2, 1, 0, 1,
-0.5293546, -0.1661321, -1.92841, 0.1921569, 1, 0, 1,
-0.5279715, 0.643652, -2.06125, 0.1882353, 1, 0, 1,
-0.5187781, 0.8833351, 0.3837785, 0.1803922, 1, 0, 1,
-0.5177352, 0.08755455, -2.55708, 0.1764706, 1, 0, 1,
-0.5113847, -0.2885731, -1.132413, 0.1686275, 1, 0, 1,
-0.5093085, -2.353485, -3.023505, 0.1647059, 1, 0, 1,
-0.5088746, -0.8617188, -2.314911, 0.1568628, 1, 0, 1,
-0.5060015, -0.0308827, -1.671936, 0.1529412, 1, 0, 1,
-0.504777, -0.169256, -2.177734, 0.145098, 1, 0, 1,
-0.5045614, -0.4268414, -0.8748368, 0.1411765, 1, 0, 1,
-0.5023549, 0.4047423, -3.645002, 0.1333333, 1, 0, 1,
-0.4957199, -0.5883387, -2.774119, 0.1294118, 1, 0, 1,
-0.495391, 2.027576, -2.113267, 0.1215686, 1, 0, 1,
-0.4896533, -1.273731, -2.520705, 0.1176471, 1, 0, 1,
-0.4891906, 1.408816, -0.03676922, 0.1098039, 1, 0, 1,
-0.4839509, 0.6006982, 0.2127421, 0.1058824, 1, 0, 1,
-0.4823759, 0.6301218, -0.9020389, 0.09803922, 1, 0, 1,
-0.4788055, 1.104577, 3.017396, 0.09019608, 1, 0, 1,
-0.4777307, -1.007321, -2.158245, 0.08627451, 1, 0, 1,
-0.4757975, 0.4924349, 0.2726027, 0.07843138, 1, 0, 1,
-0.4733549, -0.3035689, -2.691147, 0.07450981, 1, 0, 1,
-0.4726263, -0.8530686, -2.212561, 0.06666667, 1, 0, 1,
-0.4680965, -1.345449, -2.867883, 0.0627451, 1, 0, 1,
-0.4680933, -0.2842155, -1.538813, 0.05490196, 1, 0, 1,
-0.4647806, -0.5359708, -2.760398, 0.05098039, 1, 0, 1,
-0.4617708, -0.3519842, -2.342149, 0.04313726, 1, 0, 1,
-0.4609776, -0.04709123, -2.401585, 0.03921569, 1, 0, 1,
-0.4597225, 1.067357, -0.7114196, 0.03137255, 1, 0, 1,
-0.4596983, 1.107009, -0.9623608, 0.02745098, 1, 0, 1,
-0.4582545, 1.672705, -0.5898163, 0.01960784, 1, 0, 1,
-0.4580352, -0.7773586, -3.012835, 0.01568628, 1, 0, 1,
-0.4553233, 0.6177065, -0.08394121, 0.007843138, 1, 0, 1,
-0.4491461, 0.270987, -0.359519, 0.003921569, 1, 0, 1,
-0.4450881, 1.860776, 1.258094, 0, 1, 0.003921569, 1,
-0.4446051, -0.1046112, -0.8499922, 0, 1, 0.01176471, 1,
-0.4413108, -0.1520818, -1.453966, 0, 1, 0.01568628, 1,
-0.4398288, -0.460284, -0.8142005, 0, 1, 0.02352941, 1,
-0.439064, 0.7024033, 0.663544, 0, 1, 0.02745098, 1,
-0.4382422, 0.2050261, -1.852397, 0, 1, 0.03529412, 1,
-0.4306846, -1.293403, -3.068152, 0, 1, 0.03921569, 1,
-0.4301071, -0.07517491, -1.927821, 0, 1, 0.04705882, 1,
-0.4270554, -0.4491775, -2.350134, 0, 1, 0.05098039, 1,
-0.4247513, 0.47032, -1.490965, 0, 1, 0.05882353, 1,
-0.4243409, -0.102904, -0.4452167, 0, 1, 0.0627451, 1,
-0.4239186, -1.884791, -2.180419, 0, 1, 0.07058824, 1,
-0.4221774, -0.4883407, -1.269214, 0, 1, 0.07450981, 1,
-0.4213781, 1.475181, -0.2487866, 0, 1, 0.08235294, 1,
-0.4183756, -1.957145, -4.528421, 0, 1, 0.08627451, 1,
-0.4155131, 1.948783, -0.307381, 0, 1, 0.09411765, 1,
-0.4149902, -0.3547443, -1.550681, 0, 1, 0.1019608, 1,
-0.4100062, -1.6627, -3.956143, 0, 1, 0.1058824, 1,
-0.4098776, 0.5366391, -1.892336, 0, 1, 0.1137255, 1,
-0.404895, -1.508796, -4.926254, 0, 1, 0.1176471, 1,
-0.4022242, 0.4478114, -1.323267, 0, 1, 0.1254902, 1,
-0.4004765, 0.04768127, -1.331485, 0, 1, 0.1294118, 1,
-0.3970861, 0.6492078, -1.037314, 0, 1, 0.1372549, 1,
-0.3939191, 0.7838644, -2.080187, 0, 1, 0.1411765, 1,
-0.3923928, 0.7523417, 0.6602476, 0, 1, 0.1490196, 1,
-0.3905279, -0.6956167, -2.928834, 0, 1, 0.1529412, 1,
-0.3880533, 0.2504865, 0.9597763, 0, 1, 0.1607843, 1,
-0.3851394, 1.074082, -0.5750144, 0, 1, 0.1647059, 1,
-0.3802089, 0.2269896, -0.001665312, 0, 1, 0.172549, 1,
-0.3761657, 0.2430596, -2.668195, 0, 1, 0.1764706, 1,
-0.3712424, -0.3168284, -2.112554, 0, 1, 0.1843137, 1,
-0.367881, -0.7263317, -2.128885, 0, 1, 0.1882353, 1,
-0.3668062, 0.3875384, -2.670487, 0, 1, 0.1960784, 1,
-0.3582926, 0.4684643, -0.3100105, 0, 1, 0.2039216, 1,
-0.3539387, 1.014689, -0.9702267, 0, 1, 0.2078431, 1,
-0.3524786, 0.04759798, -0.891696, 0, 1, 0.2156863, 1,
-0.3498367, -0.4692578, -1.678283, 0, 1, 0.2196078, 1,
-0.3476602, -1.162281, -3.448898, 0, 1, 0.227451, 1,
-0.3475884, -1.794179, -2.481946, 0, 1, 0.2313726, 1,
-0.344695, 0.3265402, -1.736648, 0, 1, 0.2392157, 1,
-0.3431106, 0.7666312, 0.1118569, 0, 1, 0.2431373, 1,
-0.3428309, 0.8981648, -1.399035, 0, 1, 0.2509804, 1,
-0.3399079, 0.2563315, -3.017973, 0, 1, 0.254902, 1,
-0.3389235, -1.033229, -3.123297, 0, 1, 0.2627451, 1,
-0.3378929, 0.07473357, -2.833, 0, 1, 0.2666667, 1,
-0.3359486, -0.6239753, -4.362442, 0, 1, 0.2745098, 1,
-0.3329954, -1.494054, -3.333847, 0, 1, 0.2784314, 1,
-0.3278685, -1.221459, -2.416114, 0, 1, 0.2862745, 1,
-0.3268853, 0.596655, -1.231253, 0, 1, 0.2901961, 1,
-0.3266633, 0.3221139, -0.1466539, 0, 1, 0.2980392, 1,
-0.3207634, -0.3057501, -1.436845, 0, 1, 0.3058824, 1,
-0.320474, 0.3342728, -0.318579, 0, 1, 0.3098039, 1,
-0.3185937, -0.3710085, -1.258227, 0, 1, 0.3176471, 1,
-0.3173998, -0.7743338, -3.219802, 0, 1, 0.3215686, 1,
-0.3172847, -0.6814339, -2.714833, 0, 1, 0.3294118, 1,
-0.3169349, 1.13544, -0.01490276, 0, 1, 0.3333333, 1,
-0.3055404, 0.5846006, -1.404248, 0, 1, 0.3411765, 1,
-0.3023734, -0.4042569, -3.29813, 0, 1, 0.345098, 1,
-0.301822, 0.7553044, -0.4476688, 0, 1, 0.3529412, 1,
-0.2970312, -1.58843, -2.729206, 0, 1, 0.3568628, 1,
-0.296738, -1.27524, -2.07184, 0, 1, 0.3647059, 1,
-0.2965148, 0.7878956, 0.6566158, 0, 1, 0.3686275, 1,
-0.2891401, -0.5609653, -1.271835, 0, 1, 0.3764706, 1,
-0.286731, 1.308195, 0.3058658, 0, 1, 0.3803922, 1,
-0.2864303, -0.03756123, -2.05806, 0, 1, 0.3882353, 1,
-0.285028, 0.6778887, 1.182073, 0, 1, 0.3921569, 1,
-0.2802826, -1.069731, -4.062725, 0, 1, 0.4, 1,
-0.2791075, 1.953677, -0.09308745, 0, 1, 0.4078431, 1,
-0.2758824, 1.229127, -0.5711057, 0, 1, 0.4117647, 1,
-0.2717441, -0.212846, -0.5680001, 0, 1, 0.4196078, 1,
-0.2707969, -0.1411561, -1.441788, 0, 1, 0.4235294, 1,
-0.2695498, -0.4527144, -3.303013, 0, 1, 0.4313726, 1,
-0.2647535, -2.152381, -3.168992, 0, 1, 0.4352941, 1,
-0.2591245, -0.6202208, -3.289725, 0, 1, 0.4431373, 1,
-0.2551541, 0.01103925, -0.7420518, 0, 1, 0.4470588, 1,
-0.2493197, 1.371465, -0.9516483, 0, 1, 0.454902, 1,
-0.2488195, -1.241597, -0.468408, 0, 1, 0.4588235, 1,
-0.2477767, 0.5858909, 1.759105, 0, 1, 0.4666667, 1,
-0.2343643, 0.06436204, -1.741208, 0, 1, 0.4705882, 1,
-0.230818, 0.6743147, -0.4838453, 0, 1, 0.4784314, 1,
-0.2290049, -0.1011167, -2.9822, 0, 1, 0.4823529, 1,
-0.2284352, -0.379156, -1.818319, 0, 1, 0.4901961, 1,
-0.2270252, 0.7475758, -0.7640703, 0, 1, 0.4941176, 1,
-0.226573, -0.7805577, -2.426135, 0, 1, 0.5019608, 1,
-0.2245985, 0.8226346, 1.707543, 0, 1, 0.509804, 1,
-0.2229233, 0.4689789, -0.5441295, 0, 1, 0.5137255, 1,
-0.2205494, -1.161041, -2.160545, 0, 1, 0.5215687, 1,
-0.2181994, 1.30618, 0.1269532, 0, 1, 0.5254902, 1,
-0.2165439, -1.126464, -4.164968, 0, 1, 0.5333334, 1,
-0.2144153, -0.8579448, -3.992146, 0, 1, 0.5372549, 1,
-0.2077583, -0.2922184, -3.051076, 0, 1, 0.5450981, 1,
-0.2036544, 1.317101, 0.6372175, 0, 1, 0.5490196, 1,
-0.202948, 0.453744, -0.3427279, 0, 1, 0.5568628, 1,
-0.2020369, -1.674103, -4.050869, 0, 1, 0.5607843, 1,
-0.1975028, -1.671768, -1.81174, 0, 1, 0.5686275, 1,
-0.197486, 0.2646632, -0.7146469, 0, 1, 0.572549, 1,
-0.1965247, -0.3333054, -2.762875, 0, 1, 0.5803922, 1,
-0.1898546, 0.98434, -0.6224271, 0, 1, 0.5843138, 1,
-0.189854, 0.8805824, -0.9661871, 0, 1, 0.5921569, 1,
-0.1828647, 1.527941, -0.7101069, 0, 1, 0.5960785, 1,
-0.1802713, 0.8321911, 0.3956131, 0, 1, 0.6039216, 1,
-0.1728274, 0.342213, -1.549642, 0, 1, 0.6117647, 1,
-0.1677478, -1.034476, -2.718117, 0, 1, 0.6156863, 1,
-0.1669424, 0.4027611, 0.1052531, 0, 1, 0.6235294, 1,
-0.1650876, 0.1429517, 0.1668983, 0, 1, 0.627451, 1,
-0.1644607, 0.8978325, -0.9108598, 0, 1, 0.6352941, 1,
-0.1644475, 0.1245444, -2.481148, 0, 1, 0.6392157, 1,
-0.1631381, 0.7441068, 0.2190266, 0, 1, 0.6470588, 1,
-0.1618783, 1.180273, -1.749778, 0, 1, 0.6509804, 1,
-0.1595515, 0.2859276, -2.345444, 0, 1, 0.6588235, 1,
-0.1574908, 0.3668531, -1.50894, 0, 1, 0.6627451, 1,
-0.1572933, -0.07287936, -2.396861, 0, 1, 0.6705883, 1,
-0.1548391, 1.489243, -1.290058, 0, 1, 0.6745098, 1,
-0.1502098, -0.9657733, -4.168036, 0, 1, 0.682353, 1,
-0.1482096, 0.6987833, -0.3106037, 0, 1, 0.6862745, 1,
-0.1479194, 0.1690298, -1.529168, 0, 1, 0.6941177, 1,
-0.1468028, -0.3273958, -3.137242, 0, 1, 0.7019608, 1,
-0.1399217, -2.731582, -4.288175, 0, 1, 0.7058824, 1,
-0.1353541, -0.326985, -0.5566173, 0, 1, 0.7137255, 1,
-0.1271393, 0.2468433, -0.28648, 0, 1, 0.7176471, 1,
-0.1268195, -2.029905, -2.567879, 0, 1, 0.7254902, 1,
-0.1251393, -0.006607219, -2.53883, 0, 1, 0.7294118, 1,
-0.1248896, 1.096578, -0.5998839, 0, 1, 0.7372549, 1,
-0.1228518, -0.3827981, -3.705731, 0, 1, 0.7411765, 1,
-0.1227331, -0.4727204, -3.145376, 0, 1, 0.7490196, 1,
-0.1191788, -0.7938154, -2.184987, 0, 1, 0.7529412, 1,
-0.1185831, -0.3324197, -1.925491, 0, 1, 0.7607843, 1,
-0.1134702, 0.8612266, 0.2093439, 0, 1, 0.7647059, 1,
-0.1114583, 0.6460472, -0.040152, 0, 1, 0.772549, 1,
-0.1106132, -0.4494115, -3.67966, 0, 1, 0.7764706, 1,
-0.1105815, -0.9085091, -3.874157, 0, 1, 0.7843137, 1,
-0.1103552, 0.3696542, -1.183075, 0, 1, 0.7882353, 1,
-0.1097462, 0.6011876, 0.3003646, 0, 1, 0.7960784, 1,
-0.1062679, -0.6570758, -3.954708, 0, 1, 0.8039216, 1,
-0.1031514, -1.385202, -2.561456, 0, 1, 0.8078431, 1,
-0.1020895, -0.3392036, -4.199682, 0, 1, 0.8156863, 1,
-0.1018745, -0.5592579, -3.564892, 0, 1, 0.8196079, 1,
-0.09942289, 0.5591351, -0.2837624, 0, 1, 0.827451, 1,
-0.09692933, 0.3523005, 0.8467928, 0, 1, 0.8313726, 1,
-0.09559168, -0.4706516, -0.7659425, 0, 1, 0.8392157, 1,
-0.0917455, -1.85957, -2.998697, 0, 1, 0.8431373, 1,
-0.08851753, 0.1105239, -0.540828, 0, 1, 0.8509804, 1,
-0.08811334, -1.324444, -3.34685, 0, 1, 0.854902, 1,
-0.08730008, 0.7114003, -1.070489, 0, 1, 0.8627451, 1,
-0.081109, 1.476816, 0.8290846, 0, 1, 0.8666667, 1,
-0.0750237, 0.6932754, 0.5910056, 0, 1, 0.8745098, 1,
-0.07343517, 1.227443, -0.05599809, 0, 1, 0.8784314, 1,
-0.07069514, 0.02668157, 0.0007440422, 0, 1, 0.8862745, 1,
-0.06649842, 1.659405, 0.5999162, 0, 1, 0.8901961, 1,
-0.06640483, 0.7506767, -0.0337412, 0, 1, 0.8980392, 1,
-0.0588271, -1.737686, -2.113407, 0, 1, 0.9058824, 1,
-0.05506683, -0.8535985, -2.85172, 0, 1, 0.9098039, 1,
-0.05235063, -0.5195453, -4.132512, 0, 1, 0.9176471, 1,
-0.0494455, 1.161705, -0.7571232, 0, 1, 0.9215686, 1,
-0.04728303, -0.9403744, -4.598514, 0, 1, 0.9294118, 1,
-0.04642597, 0.06283126, -0.7373959, 0, 1, 0.9333333, 1,
-0.0450708, 0.4150448, 0.7677531, 0, 1, 0.9411765, 1,
-0.04465908, 0.03704502, -1.743363, 0, 1, 0.945098, 1,
-0.04409398, -0.2529852, -1.518399, 0, 1, 0.9529412, 1,
-0.04281341, 0.3660324, 0.9844234, 0, 1, 0.9568627, 1,
-0.03989485, 0.03255757, 0.8636702, 0, 1, 0.9647059, 1,
-0.039567, 0.7694084, 0.9968478, 0, 1, 0.9686275, 1,
-0.03733276, -2.300796, -0.6310054, 0, 1, 0.9764706, 1,
-0.03258945, 0.6771346, 1.447191, 0, 1, 0.9803922, 1,
-0.03015064, 0.1787554, -1.388117, 0, 1, 0.9882353, 1,
-0.02510016, -1.134931, -1.854434, 0, 1, 0.9921569, 1,
-0.02329095, 0.007261666, -0.8556972, 0, 1, 1, 1,
-0.02008754, 1.845889, -1.572451, 0, 0.9921569, 1, 1,
-0.01941641, 0.8731576, 0.5234926, 0, 0.9882353, 1, 1,
-0.01753725, 0.4709167, -1.756065, 0, 0.9803922, 1, 1,
-0.01601082, 0.2685135, 0.4547442, 0, 0.9764706, 1, 1,
-0.01445441, 0.01047349, -1.043903, 0, 0.9686275, 1, 1,
0.001367234, -0.4069473, 3.9498, 0, 0.9647059, 1, 1,
0.002256288, 0.7102172, 0.377393, 0, 0.9568627, 1, 1,
0.005554807, 0.9291215, -0.6230127, 0, 0.9529412, 1, 1,
0.0134121, 0.107869, 0.9995347, 0, 0.945098, 1, 1,
0.0177942, -0.0647852, 2.902738, 0, 0.9411765, 1, 1,
0.02066589, 1.015409, -1.494819, 0, 0.9333333, 1, 1,
0.02066597, -0.4511501, 4.913638, 0, 0.9294118, 1, 1,
0.02072681, 1.907234, -0.00795146, 0, 0.9215686, 1, 1,
0.0215162, -0.9197065, 3.069625, 0, 0.9176471, 1, 1,
0.02216738, 0.3506488, 1.231303, 0, 0.9098039, 1, 1,
0.02478456, 0.4494472, -0.1305151, 0, 0.9058824, 1, 1,
0.02780385, 0.4819928, 1.972234, 0, 0.8980392, 1, 1,
0.0411442, -1.087932, 3.722054, 0, 0.8901961, 1, 1,
0.04298077, 0.8250117, 0.9464809, 0, 0.8862745, 1, 1,
0.04817072, 1.289157, 1.758206, 0, 0.8784314, 1, 1,
0.04994985, 0.5602828, 1.165696, 0, 0.8745098, 1, 1,
0.05381319, 0.6455413, -1.000253, 0, 0.8666667, 1, 1,
0.05397337, -0.2170331, 3.562302, 0, 0.8627451, 1, 1,
0.05635968, -0.1133388, 4.711277, 0, 0.854902, 1, 1,
0.05789441, -0.6802439, 4.278779, 0, 0.8509804, 1, 1,
0.05912135, 1.189581, 0.6727743, 0, 0.8431373, 1, 1,
0.05981611, -0.9631132, 3.127527, 0, 0.8392157, 1, 1,
0.06170035, -0.4903077, 2.692614, 0, 0.8313726, 1, 1,
0.06302023, 0.1953232, 0.8008627, 0, 0.827451, 1, 1,
0.06711973, 0.09591672, 0.6273549, 0, 0.8196079, 1, 1,
0.06792995, 1.587685, 1.213228, 0, 0.8156863, 1, 1,
0.06858528, -0.6688415, 3.248662, 0, 0.8078431, 1, 1,
0.06858845, -0.1082901, 4.204191, 0, 0.8039216, 1, 1,
0.07040815, -0.7808412, 4.328063, 0, 0.7960784, 1, 1,
0.07392607, 0.3938948, 1.98229, 0, 0.7882353, 1, 1,
0.07562274, 0.417396, 0.568051, 0, 0.7843137, 1, 1,
0.07934444, -0.5987347, 3.141185, 0, 0.7764706, 1, 1,
0.08043201, 1.013057, 0.3237085, 0, 0.772549, 1, 1,
0.0814897, -0.3736471, 3.64299, 0, 0.7647059, 1, 1,
0.08238189, 1.064368, 0.8356744, 0, 0.7607843, 1, 1,
0.08397065, -0.1201884, 1.052774, 0, 0.7529412, 1, 1,
0.08433205, 0.5567051, 0.1216939, 0, 0.7490196, 1, 1,
0.08637056, -0.5799799, 1.590863, 0, 0.7411765, 1, 1,
0.08684143, -0.0752486, 2.494832, 0, 0.7372549, 1, 1,
0.09418657, -0.5140333, 3.027623, 0, 0.7294118, 1, 1,
0.09474093, 0.9724798, -1.108732, 0, 0.7254902, 1, 1,
0.1011138, -0.6765842, 4.119, 0, 0.7176471, 1, 1,
0.1028265, 0.6509941, -0.4488937, 0, 0.7137255, 1, 1,
0.1049619, 0.2382121, -0.3117429, 0, 0.7058824, 1, 1,
0.106838, -0.1522123, 2.534083, 0, 0.6980392, 1, 1,
0.1080579, 0.8142561, 0.6565588, 0, 0.6941177, 1, 1,
0.1105889, 1.680779, 0.1699703, 0, 0.6862745, 1, 1,
0.1136663, -0.3599377, 2.924904, 0, 0.682353, 1, 1,
0.114449, 1.410189, -0.2120769, 0, 0.6745098, 1, 1,
0.1151101, -0.133159, 4.347371, 0, 0.6705883, 1, 1,
0.1187461, -1.3555, 3.238503, 0, 0.6627451, 1, 1,
0.1201983, 1.137732, 0.6295953, 0, 0.6588235, 1, 1,
0.120248, 1.66564, 1.209469, 0, 0.6509804, 1, 1,
0.122782, -0.5513197, 2.231999, 0, 0.6470588, 1, 1,
0.1236079, 0.9780463, 0.8070599, 0, 0.6392157, 1, 1,
0.1236379, -0.8072206, 4.688912, 0, 0.6352941, 1, 1,
0.1264403, -0.06765689, 1.929348, 0, 0.627451, 1, 1,
0.1290498, 0.8398075, 0.8337852, 0, 0.6235294, 1, 1,
0.129805, -0.1438105, 3.745499, 0, 0.6156863, 1, 1,
0.1321547, 0.2637393, 1.635632, 0, 0.6117647, 1, 1,
0.1330513, -0.5960944, 1.295723, 0, 0.6039216, 1, 1,
0.1336306, -1.39584, 4.998986, 0, 0.5960785, 1, 1,
0.1384262, 1.17249, -0.02971327, 0, 0.5921569, 1, 1,
0.1404121, 1.032182, -0.8482407, 0, 0.5843138, 1, 1,
0.1417885, -0.5901738, 2.229914, 0, 0.5803922, 1, 1,
0.1439608, 1.09077, 0.634863, 0, 0.572549, 1, 1,
0.1448837, 0.2875446, 1.18354, 0, 0.5686275, 1, 1,
0.1500269, 0.3347648, 2.235722, 0, 0.5607843, 1, 1,
0.1517704, 0.1953439, -0.4499148, 0, 0.5568628, 1, 1,
0.1589571, -1.782818, 3.373093, 0, 0.5490196, 1, 1,
0.1628823, 1.860977, -1.156623, 0, 0.5450981, 1, 1,
0.1632931, -1.368872, 5.297731, 0, 0.5372549, 1, 1,
0.1665964, 0.9962218, -0.8227325, 0, 0.5333334, 1, 1,
0.1682471, -0.4814875, 1.561721, 0, 0.5254902, 1, 1,
0.1686704, 0.1413459, 1.241419, 0, 0.5215687, 1, 1,
0.1699775, -0.0275127, -0.9562685, 0, 0.5137255, 1, 1,
0.1708256, 0.9127405, -0.6142483, 0, 0.509804, 1, 1,
0.1714182, -1.048135, 2.59494, 0, 0.5019608, 1, 1,
0.1720554, 0.4741543, -0.2406217, 0, 0.4941176, 1, 1,
0.1730686, 0.4195004, -1.369114, 0, 0.4901961, 1, 1,
0.1736134, -0.1037747, 0.9464, 0, 0.4823529, 1, 1,
0.1743528, -0.9479775, 4.563468, 0, 0.4784314, 1, 1,
0.1785264, 0.5803275, 0.06112865, 0, 0.4705882, 1, 1,
0.1792797, -0.9013295, 2.938379, 0, 0.4666667, 1, 1,
0.1803882, 0.5376679, 1.065071, 0, 0.4588235, 1, 1,
0.1805882, -0.7522717, 4.0697, 0, 0.454902, 1, 1,
0.1829691, 2.453949, -1.584233, 0, 0.4470588, 1, 1,
0.1846517, -2.22846, 3.172455, 0, 0.4431373, 1, 1,
0.1862471, -0.8453646, 3.253966, 0, 0.4352941, 1, 1,
0.1863881, 1.149881, -0.01621208, 0, 0.4313726, 1, 1,
0.1902613, 0.2490037, 3.181441, 0, 0.4235294, 1, 1,
0.1915118, 0.4431442, -0.279484, 0, 0.4196078, 1, 1,
0.1982779, -1.636043, 2.828394, 0, 0.4117647, 1, 1,
0.2030337, -1.064462, 2.638039, 0, 0.4078431, 1, 1,
0.2031737, 1.07269, -0.9179392, 0, 0.4, 1, 1,
0.2064993, -0.2691689, 3.647253, 0, 0.3921569, 1, 1,
0.2068449, -0.7942821, 3.86419, 0, 0.3882353, 1, 1,
0.2121654, 0.3658542, 1.836431, 0, 0.3803922, 1, 1,
0.2127026, -1.693999, 3.706678, 0, 0.3764706, 1, 1,
0.2187817, 0.1446904, -1.52044, 0, 0.3686275, 1, 1,
0.220274, -0.2928452, 2.907172, 0, 0.3647059, 1, 1,
0.2309359, -1.595787, 3.467913, 0, 0.3568628, 1, 1,
0.2311672, -0.08908605, 0.1831135, 0, 0.3529412, 1, 1,
0.2352566, 0.1255786, 0.7983846, 0, 0.345098, 1, 1,
0.2419087, -1.422985, 5.449833, 0, 0.3411765, 1, 1,
0.2555426, -0.4773268, 2.894007, 0, 0.3333333, 1, 1,
0.2596826, -1.197488, 2.242762, 0, 0.3294118, 1, 1,
0.2600552, 2.622859, 0.6010053, 0, 0.3215686, 1, 1,
0.2624379, -0.8692664, 3.11217, 0, 0.3176471, 1, 1,
0.2625636, -1.619623, 2.245175, 0, 0.3098039, 1, 1,
0.2638335, 0.1913622, 1.038598, 0, 0.3058824, 1, 1,
0.2664461, 2.432131, -1.002891, 0, 0.2980392, 1, 1,
0.2694642, 0.7331855, -0.3686852, 0, 0.2901961, 1, 1,
0.2718727, -2.63862, 2.388446, 0, 0.2862745, 1, 1,
0.2725231, 0.6481731, 1.267486, 0, 0.2784314, 1, 1,
0.2763594, -0.4761482, 2.391121, 0, 0.2745098, 1, 1,
0.2783425, -0.4249483, 3.433749, 0, 0.2666667, 1, 1,
0.2796468, -0.05247549, 0.4988047, 0, 0.2627451, 1, 1,
0.2804503, -1.208125, 4.008469, 0, 0.254902, 1, 1,
0.2844747, 0.2553776, 0.2319304, 0, 0.2509804, 1, 1,
0.2859388, -0.07991234, 1.486665, 0, 0.2431373, 1, 1,
0.2884211, -0.03057155, 2.727474, 0, 0.2392157, 1, 1,
0.2903055, -1.885176, 2.222693, 0, 0.2313726, 1, 1,
0.2904729, -1.999295, 2.954684, 0, 0.227451, 1, 1,
0.2919425, 0.6050873, -1.071568, 0, 0.2196078, 1, 1,
0.2921983, -0.9263089, 2.051111, 0, 0.2156863, 1, 1,
0.2974763, 0.3364758, 1.165241, 0, 0.2078431, 1, 1,
0.2983764, 1.984496, -1.062179, 0, 0.2039216, 1, 1,
0.3018093, -0.1942591, 3.012974, 0, 0.1960784, 1, 1,
0.3028117, 0.06653415, 1.774917, 0, 0.1882353, 1, 1,
0.3029327, -0.3738325, 2.164592, 0, 0.1843137, 1, 1,
0.3037778, -0.6132299, 3.189906, 0, 0.1764706, 1, 1,
0.3067606, 1.435512, 0.5298682, 0, 0.172549, 1, 1,
0.319664, -0.1794061, 4.223827, 0, 0.1647059, 1, 1,
0.3269774, 1.456897, -1.625026, 0, 0.1607843, 1, 1,
0.3279476, 0.680302, 1.551301, 0, 0.1529412, 1, 1,
0.3290916, -1.321037, 1.656359, 0, 0.1490196, 1, 1,
0.3369389, -1.022975, 3.332242, 0, 0.1411765, 1, 1,
0.3369697, 0.1010061, 1.976794, 0, 0.1372549, 1, 1,
0.3370327, -0.5003905, 3.759827, 0, 0.1294118, 1, 1,
0.3390723, 0.4496388, 0.9022732, 0, 0.1254902, 1, 1,
0.3410744, 0.3004443, 1.314533, 0, 0.1176471, 1, 1,
0.3502232, 0.2088561, 1.222589, 0, 0.1137255, 1, 1,
0.3531335, -0.1765229, 2.126286, 0, 0.1058824, 1, 1,
0.3535852, -0.6582189, 2.377341, 0, 0.09803922, 1, 1,
0.3556663, 1.110424, 0.3518269, 0, 0.09411765, 1, 1,
0.3607328, -0.5042987, 2.796623, 0, 0.08627451, 1, 1,
0.3616885, -1.211798, 1.604828, 0, 0.08235294, 1, 1,
0.3668124, -0.2013033, 1.177014, 0, 0.07450981, 1, 1,
0.3709445, 0.6654477, 0.9960129, 0, 0.07058824, 1, 1,
0.3745984, -0.6683288, 3.852872, 0, 0.0627451, 1, 1,
0.3761492, -2.690328, 3.188776, 0, 0.05882353, 1, 1,
0.3785911, 0.02129126, 1.155528, 0, 0.05098039, 1, 1,
0.3809686, -0.8126638, 4.100595, 0, 0.04705882, 1, 1,
0.3819166, -2.529811, 1.313006, 0, 0.03921569, 1, 1,
0.3820275, -1.718507, 2.412083, 0, 0.03529412, 1, 1,
0.3826513, 1.553297, 0.0115741, 0, 0.02745098, 1, 1,
0.3877479, -0.9887959, 4.306211, 0, 0.02352941, 1, 1,
0.3884197, -0.3173589, 1.789523, 0, 0.01568628, 1, 1,
0.397981, -0.3254008, 2.469217, 0, 0.01176471, 1, 1,
0.3999206, 0.1444362, 0.6902317, 0, 0.003921569, 1, 1,
0.4060013, -1.310365, 4.291346, 0.003921569, 0, 1, 1,
0.4107954, 0.8546199, 1.447842, 0.007843138, 0, 1, 1,
0.4112275, 0.396225, 0.8105061, 0.01568628, 0, 1, 1,
0.4156939, 1.187785, 0.2192016, 0.01960784, 0, 1, 1,
0.4159079, -0.9803406, 1.781819, 0.02745098, 0, 1, 1,
0.4162394, -0.8143016, 3.048538, 0.03137255, 0, 1, 1,
0.4187413, -2.081083, 2.443244, 0.03921569, 0, 1, 1,
0.4201167, -1.091449, 1.938398, 0.04313726, 0, 1, 1,
0.420443, 1.907869, 0.5330248, 0.05098039, 0, 1, 1,
0.4211205, -0.07615783, 1.67908, 0.05490196, 0, 1, 1,
0.4253899, -1.184431, 3.033716, 0.0627451, 0, 1, 1,
0.4310544, 0.01862595, 1.978831, 0.06666667, 0, 1, 1,
0.4311413, 2.579783, -0.623281, 0.07450981, 0, 1, 1,
0.4456879, 0.7891666, -0.758433, 0.07843138, 0, 1, 1,
0.4466866, 0.02399806, 1.816081, 0.08627451, 0, 1, 1,
0.4496387, -1.915353, 3.225756, 0.09019608, 0, 1, 1,
0.4508016, -0.5963183, 3.613248, 0.09803922, 0, 1, 1,
0.4532013, 0.8089422, 2.010278, 0.1058824, 0, 1, 1,
0.4544808, -0.2827225, 2.651087, 0.1098039, 0, 1, 1,
0.4563381, 0.7698897, -0.1483451, 0.1176471, 0, 1, 1,
0.4639064, 2.140255, -0.07914591, 0.1215686, 0, 1, 1,
0.4730266, 1.63899, -0.6659212, 0.1294118, 0, 1, 1,
0.4735906, 0.2728727, 0.1558262, 0.1333333, 0, 1, 1,
0.4769594, 0.7670944, 0.4813218, 0.1411765, 0, 1, 1,
0.4801072, 0.4354607, 1.667322, 0.145098, 0, 1, 1,
0.4818141, 2.071738, 1.309031, 0.1529412, 0, 1, 1,
0.4828418, -0.5442829, 2.465439, 0.1568628, 0, 1, 1,
0.4851122, -0.8714736, 2.718739, 0.1647059, 0, 1, 1,
0.4875688, 0.2968871, 0.9303296, 0.1686275, 0, 1, 1,
0.4880138, 0.9284871, -0.3608106, 0.1764706, 0, 1, 1,
0.498706, -0.8316528, 1.816776, 0.1803922, 0, 1, 1,
0.5000197, -0.9155613, 2.289747, 0.1882353, 0, 1, 1,
0.5091181, 0.8303047, -0.8510527, 0.1921569, 0, 1, 1,
0.5113552, -1.864913, 2.250645, 0.2, 0, 1, 1,
0.5235606, -0.359113, 1.417823, 0.2078431, 0, 1, 1,
0.5279725, -0.3879294, 1.701177, 0.2117647, 0, 1, 1,
0.5435374, -0.5270935, 1.675608, 0.2196078, 0, 1, 1,
0.5440086, 0.4837448, 1.99158, 0.2235294, 0, 1, 1,
0.5445913, -0.06745851, 1.844733, 0.2313726, 0, 1, 1,
0.5540297, 1.483872, 0.6937672, 0.2352941, 0, 1, 1,
0.5542518, 1.305942, 0.9810724, 0.2431373, 0, 1, 1,
0.5557387, 0.9798254, 0.9192523, 0.2470588, 0, 1, 1,
0.5560176, 1.410979, 0.6935958, 0.254902, 0, 1, 1,
0.5563454, -2.01966, 2.674893, 0.2588235, 0, 1, 1,
0.5564463, 0.1716232, 0.6771452, 0.2666667, 0, 1, 1,
0.5605578, -2.77242, 2.166348, 0.2705882, 0, 1, 1,
0.5642952, 0.7550657, -0.5681337, 0.2784314, 0, 1, 1,
0.5666642, 0.08300918, -0.9672624, 0.282353, 0, 1, 1,
0.5681896, 0.8063098, 0.5274627, 0.2901961, 0, 1, 1,
0.5698994, -1.406405, 3.335518, 0.2941177, 0, 1, 1,
0.5702634, -0.1913209, 1.948253, 0.3019608, 0, 1, 1,
0.5757087, -0.6032193, 2.606041, 0.3098039, 0, 1, 1,
0.5807771, 1.882087, 0.1938693, 0.3137255, 0, 1, 1,
0.5829647, 1.100707, 0.2429562, 0.3215686, 0, 1, 1,
0.586395, -1.075657, 4.151746, 0.3254902, 0, 1, 1,
0.594638, 0.7003772, 1.175242, 0.3333333, 0, 1, 1,
0.5966099, 0.8597047, 0.1595775, 0.3372549, 0, 1, 1,
0.5966301, 0.2205426, 0.9749568, 0.345098, 0, 1, 1,
0.6004178, -0.3166489, 2.442976, 0.3490196, 0, 1, 1,
0.6058053, -0.7060413, 0.9931002, 0.3568628, 0, 1, 1,
0.6168026, -0.01150682, -0.06689853, 0.3607843, 0, 1, 1,
0.618241, 0.06757119, -0.2596986, 0.3686275, 0, 1, 1,
0.6184191, 0.980885, -0.1921786, 0.372549, 0, 1, 1,
0.6206914, -0.9410502, 1.210157, 0.3803922, 0, 1, 1,
0.6272332, -0.05304892, -0.5638567, 0.3843137, 0, 1, 1,
0.6302251, 0.2987644, -0.01679695, 0.3921569, 0, 1, 1,
0.6308738, 2.116197, 0.3992791, 0.3960784, 0, 1, 1,
0.6311347, 0.797228, 2.215048, 0.4039216, 0, 1, 1,
0.6383069, -0.437442, -0.1297958, 0.4117647, 0, 1, 1,
0.643164, 0.2145243, 0.6793023, 0.4156863, 0, 1, 1,
0.6433755, 0.92763, 0.275153, 0.4235294, 0, 1, 1,
0.6503665, 0.7246098, 1.019713, 0.427451, 0, 1, 1,
0.6602736, 2.435879, -0.08407602, 0.4352941, 0, 1, 1,
0.6652361, -0.4438281, 1.679036, 0.4392157, 0, 1, 1,
0.6695406, -0.9356239, 1.684852, 0.4470588, 0, 1, 1,
0.6705978, -1.324327, 3.768118, 0.4509804, 0, 1, 1,
0.6709298, -0.2689213, 2.556203, 0.4588235, 0, 1, 1,
0.6710405, 0.8888389, -0.334363, 0.4627451, 0, 1, 1,
0.6791869, -0.8401926, 2.067231, 0.4705882, 0, 1, 1,
0.6797521, 0.687642, 0.0915398, 0.4745098, 0, 1, 1,
0.6853803, 0.1784374, 1.21795, 0.4823529, 0, 1, 1,
0.6914269, 0.4800921, 0.1833183, 0.4862745, 0, 1, 1,
0.6934417, -1.064771, 1.71633, 0.4941176, 0, 1, 1,
0.6967822, 0.3156049, 0.8810523, 0.5019608, 0, 1, 1,
0.6983337, -1.214742, 1.541788, 0.5058824, 0, 1, 1,
0.6983959, 0.3968928, 0.8978017, 0.5137255, 0, 1, 1,
0.70557, 1.674671, 0.04896784, 0.5176471, 0, 1, 1,
0.7177781, 0.461208, 2.052072, 0.5254902, 0, 1, 1,
0.7298781, 0.3536337, -0.5526406, 0.5294118, 0, 1, 1,
0.7300352, 1.110984, 1.97028, 0.5372549, 0, 1, 1,
0.7301605, 0.8082479, -0.8326296, 0.5411765, 0, 1, 1,
0.730686, 0.3480125, 1.962961, 0.5490196, 0, 1, 1,
0.73426, 2.249537, 0.6949799, 0.5529412, 0, 1, 1,
0.7350746, 0.7457092, 0.05479212, 0.5607843, 0, 1, 1,
0.7402641, 0.8394942, 2.295565, 0.5647059, 0, 1, 1,
0.7429911, -2.772331, 2.73345, 0.572549, 0, 1, 1,
0.7527308, -0.2925865, 2.45608, 0.5764706, 0, 1, 1,
0.7538015, -0.2199826, 0.8986595, 0.5843138, 0, 1, 1,
0.7578745, 0.1023063, -0.09017997, 0.5882353, 0, 1, 1,
0.7602357, 0.557041, -0.9320179, 0.5960785, 0, 1, 1,
0.7620671, 1.559858, -0.1212969, 0.6039216, 0, 1, 1,
0.7751005, -0.5419117, 1.868537, 0.6078432, 0, 1, 1,
0.775575, -0.8479981, 1.450776, 0.6156863, 0, 1, 1,
0.7777062, 0.2295282, 0.4416544, 0.6196079, 0, 1, 1,
0.7787679, -1.227164, 2.309905, 0.627451, 0, 1, 1,
0.7886863, 0.3663209, 0.4922134, 0.6313726, 0, 1, 1,
0.7916273, -0.149221, 1.408579, 0.6392157, 0, 1, 1,
0.7916731, 1.543626, -0.2724732, 0.6431373, 0, 1, 1,
0.7919165, 1.334819, 0.8111394, 0.6509804, 0, 1, 1,
0.7926593, 1.609197, -0.1894748, 0.654902, 0, 1, 1,
0.8004345, 1.251112, -0.3963506, 0.6627451, 0, 1, 1,
0.80238, -0.08798593, 0.1647801, 0.6666667, 0, 1, 1,
0.8031889, -1.304408, 1.083964, 0.6745098, 0, 1, 1,
0.803439, -0.06886816, 0.7337307, 0.6784314, 0, 1, 1,
0.8041837, 0.2589172, -0.003734626, 0.6862745, 0, 1, 1,
0.8082318, -0.5389476, 1.240572, 0.6901961, 0, 1, 1,
0.813298, 1.560955, 1.321511, 0.6980392, 0, 1, 1,
0.8155137, 1.609864, -1.156836, 0.7058824, 0, 1, 1,
0.8203403, 1.55644, 0.02279401, 0.7098039, 0, 1, 1,
0.8320746, 0.3561326, 2.413559, 0.7176471, 0, 1, 1,
0.8370678, -1.153422, 1.317262, 0.7215686, 0, 1, 1,
0.8382068, -0.005243313, 2.222932, 0.7294118, 0, 1, 1,
0.8408731, 0.5977218, 0.5353367, 0.7333333, 0, 1, 1,
0.8455097, -0.4511188, 2.772872, 0.7411765, 0, 1, 1,
0.8498469, -0.6119502, 2.254033, 0.7450981, 0, 1, 1,
0.8510467, 1.832523, 0.4239626, 0.7529412, 0, 1, 1,
0.8592701, -0.133789, 1.396636, 0.7568628, 0, 1, 1,
0.8600959, -0.1974441, 1.259791, 0.7647059, 0, 1, 1,
0.8615691, -0.5268838, 1.288858, 0.7686275, 0, 1, 1,
0.8616754, 0.8790746, 0.3002799, 0.7764706, 0, 1, 1,
0.8703612, 0.2677585, 2.243657, 0.7803922, 0, 1, 1,
0.8716187, 1.123381, 0.9294934, 0.7882353, 0, 1, 1,
0.8731378, -0.177281, 1.392403, 0.7921569, 0, 1, 1,
0.8762081, 1.216886, -1.820831, 0.8, 0, 1, 1,
0.8878393, 1.161777, 0.3283425, 0.8078431, 0, 1, 1,
0.8937684, 0.4310312, 0.2801421, 0.8117647, 0, 1, 1,
0.893975, 1.700401, 0.3798416, 0.8196079, 0, 1, 1,
0.9075609, 0.1974432, 0.8683489, 0.8235294, 0, 1, 1,
0.9186874, 0.1332746, 2.194119, 0.8313726, 0, 1, 1,
0.9196813, 0.3315751, -2.317987, 0.8352941, 0, 1, 1,
0.9238399, 0.2160379, 1.519377, 0.8431373, 0, 1, 1,
0.9290711, -0.1305943, 2.933996, 0.8470588, 0, 1, 1,
0.9317068, -0.3259496, 1.078914, 0.854902, 0, 1, 1,
0.9364952, -1.959277, 4.341457, 0.8588235, 0, 1, 1,
0.9432502, -1.058038, 3.363896, 0.8666667, 0, 1, 1,
0.9440305, -1.872769, 4.175598, 0.8705882, 0, 1, 1,
0.9441078, 2.564438, 1.407664, 0.8784314, 0, 1, 1,
0.9596986, -0.1823192, 1.846728, 0.8823529, 0, 1, 1,
0.9603826, 0.6005501, 2.736903, 0.8901961, 0, 1, 1,
0.9623128, 0.9170454, -0.3813562, 0.8941177, 0, 1, 1,
0.9627517, -0.004475078, 2.624816, 0.9019608, 0, 1, 1,
0.9667065, -0.6784016, 1.712235, 0.9098039, 0, 1, 1,
0.9810891, 0.3098108, 1.898906, 0.9137255, 0, 1, 1,
0.98583, 0.8508832, 0.6768623, 0.9215686, 0, 1, 1,
0.9894544, 0.05046902, 1.420436, 0.9254902, 0, 1, 1,
0.9913124, 0.1756589, 0.4842188, 0.9333333, 0, 1, 1,
0.9940367, -0.398247, 2.266864, 0.9372549, 0, 1, 1,
0.9954539, -0.7385614, -0.2862806, 0.945098, 0, 1, 1,
0.9997797, 1.113195, 1.516893, 0.9490196, 0, 1, 1,
1.001371, -0.536632, 2.93244, 0.9568627, 0, 1, 1,
1.004509, 1.395448, -0.4099068, 0.9607843, 0, 1, 1,
1.012617, 0.9153373, -0.1166218, 0.9686275, 0, 1, 1,
1.01466, -0.446292, 1.839352, 0.972549, 0, 1, 1,
1.016241, -0.07448404, 2.205038, 0.9803922, 0, 1, 1,
1.016275, 0.2601241, 0.8105958, 0.9843137, 0, 1, 1,
1.018477, 1.051556, 1.525798, 0.9921569, 0, 1, 1,
1.019336, -0.5307367, 1.049129, 0.9960784, 0, 1, 1,
1.022158, 0.1680121, 0.7228358, 1, 0, 0.9960784, 1,
1.036467, 0.02900369, 2.03777, 1, 0, 0.9882353, 1,
1.038577, 1.478353, 0.7276751, 1, 0, 0.9843137, 1,
1.042891, -1.97945, 3.958273, 1, 0, 0.9764706, 1,
1.046959, 0.1138, 1.082912, 1, 0, 0.972549, 1,
1.049545, 1.438261, 0.8493678, 1, 0, 0.9647059, 1,
1.053479, -0.4933356, 4.308309, 1, 0, 0.9607843, 1,
1.059801, 0.08800543, 2.446752, 1, 0, 0.9529412, 1,
1.067448, -0.5512914, 0.5330559, 1, 0, 0.9490196, 1,
1.068716, -1.799134, 3.18463, 1, 0, 0.9411765, 1,
1.08066, 1.057111, -0.615978, 1, 0, 0.9372549, 1,
1.088027, -0.6422215, 2.473149, 1, 0, 0.9294118, 1,
1.09631, 0.7912931, 2.901232, 1, 0, 0.9254902, 1,
1.110544, 0.4534025, 1.115632, 1, 0, 0.9176471, 1,
1.11426, 1.363536, 0.8321934, 1, 0, 0.9137255, 1,
1.126174, -1.124008, 3.457271, 1, 0, 0.9058824, 1,
1.12815, 0.7044224, 0.5630707, 1, 0, 0.9019608, 1,
1.13711, 0.9763928, 0.2302037, 1, 0, 0.8941177, 1,
1.142566, 1.487173, 2.2265, 1, 0, 0.8862745, 1,
1.147397, -1.806784, 1.582005, 1, 0, 0.8823529, 1,
1.147865, 2.060649, 2.143106, 1, 0, 0.8745098, 1,
1.148582, 0.3933464, 0.03801076, 1, 0, 0.8705882, 1,
1.148929, -0.08414909, 1.919656, 1, 0, 0.8627451, 1,
1.151597, -0.5787752, 1.750729, 1, 0, 0.8588235, 1,
1.152206, 0.8966739, -0.1141339, 1, 0, 0.8509804, 1,
1.157137, 1.682301, 0.5367502, 1, 0, 0.8470588, 1,
1.158042, -0.8603324, 2.026619, 1, 0, 0.8392157, 1,
1.164559, 0.09614141, 1.665814, 1, 0, 0.8352941, 1,
1.166587, 0.4079645, 0.8775899, 1, 0, 0.827451, 1,
1.167004, 0.1111504, 0.9216555, 1, 0, 0.8235294, 1,
1.179302, 0.4575379, 3.000812, 1, 0, 0.8156863, 1,
1.18012, 1.312498, 0.2333324, 1, 0, 0.8117647, 1,
1.180126, -0.1905684, 1.372484, 1, 0, 0.8039216, 1,
1.189362, -0.05739988, 2.213152, 1, 0, 0.7960784, 1,
1.190564, -0.2205235, 1.768441, 1, 0, 0.7921569, 1,
1.19253, 2.16658, -0.08530211, 1, 0, 0.7843137, 1,
1.207765, -1.168406, 1.503987, 1, 0, 0.7803922, 1,
1.220522, 1.175304, -0.7728773, 1, 0, 0.772549, 1,
1.221198, -0.2417292, 1.839774, 1, 0, 0.7686275, 1,
1.221372, -0.01027044, 1.716689, 1, 0, 0.7607843, 1,
1.221516, -0.4697366, 1.768078, 1, 0, 0.7568628, 1,
1.22282, 1.79837, -0.3584084, 1, 0, 0.7490196, 1,
1.225709, 0.6719556, 0.6182563, 1, 0, 0.7450981, 1,
1.236257, 0.8623086, 0.4135013, 1, 0, 0.7372549, 1,
1.246667, 1.033189, 1.969503, 1, 0, 0.7333333, 1,
1.24947, 1.087213, -0.7544494, 1, 0, 0.7254902, 1,
1.253663, 0.2655409, -1.805752, 1, 0, 0.7215686, 1,
1.257041, -1.343711, 2.296511, 1, 0, 0.7137255, 1,
1.263702, -0.3921812, 2.830286, 1, 0, 0.7098039, 1,
1.265407, 1.160636, -0.07076847, 1, 0, 0.7019608, 1,
1.267146, 1.231708, 2.193952, 1, 0, 0.6941177, 1,
1.268296, -1.062594, 2.705662, 1, 0, 0.6901961, 1,
1.270179, 0.3385314, 1.057532, 1, 0, 0.682353, 1,
1.270471, 0.90943, 1.77313, 1, 0, 0.6784314, 1,
1.275501, -1.277231, 3.453807, 1, 0, 0.6705883, 1,
1.289497, -0.2159403, 1.51385, 1, 0, 0.6666667, 1,
1.291721, -0.3409063, 3.26766, 1, 0, 0.6588235, 1,
1.294524, 0.3782603, -0.3396949, 1, 0, 0.654902, 1,
1.297711, -0.9557781, 1.329279, 1, 0, 0.6470588, 1,
1.302465, 0.03121192, 0.6877518, 1, 0, 0.6431373, 1,
1.309085, -0.6327933, 2.87968, 1, 0, 0.6352941, 1,
1.310686, -1.066757, 3.277788, 1, 0, 0.6313726, 1,
1.322418, 1.119737, 2.766955, 1, 0, 0.6235294, 1,
1.322904, 0.411195, -0.6316536, 1, 0, 0.6196079, 1,
1.332758, 0.8572677, 0.4085124, 1, 0, 0.6117647, 1,
1.336344, -0.6207056, 3.451797, 1, 0, 0.6078432, 1,
1.340774, -0.7119934, 2.208447, 1, 0, 0.6, 1,
1.350385, -0.3767439, 2.89333, 1, 0, 0.5921569, 1,
1.363354, 1.574974, 0.6604757, 1, 0, 0.5882353, 1,
1.377391, -0.7942796, 0.08171344, 1, 0, 0.5803922, 1,
1.378173, 0.1970492, 2.791547, 1, 0, 0.5764706, 1,
1.380119, -0.707703, 3.393916, 1, 0, 0.5686275, 1,
1.382734, 0.1799868, 0.758452, 1, 0, 0.5647059, 1,
1.387555, -0.1350659, 1.825831, 1, 0, 0.5568628, 1,
1.404926, -0.6681063, 2.958417, 1, 0, 0.5529412, 1,
1.413387, -1.982823, 2.590177, 1, 0, 0.5450981, 1,
1.425145, 1.38616, 0.4533784, 1, 0, 0.5411765, 1,
1.42687, -0.3149938, 3.342468, 1, 0, 0.5333334, 1,
1.429279, -0.4705265, 3.254164, 1, 0, 0.5294118, 1,
1.432114, 0.8184151, 1.479599, 1, 0, 0.5215687, 1,
1.444764, -0.5237204, 2.307315, 1, 0, 0.5176471, 1,
1.44576, 0.8864607, 0.3537897, 1, 0, 0.509804, 1,
1.446993, 0.6905965, 2.841417, 1, 0, 0.5058824, 1,
1.447717, -1.263112, 2.332543, 1, 0, 0.4980392, 1,
1.456309, 1.382362, 2.299882, 1, 0, 0.4901961, 1,
1.461177, 0.6536663, 0.6327711, 1, 0, 0.4862745, 1,
1.463459, -0.2908939, 0.9456027, 1, 0, 0.4784314, 1,
1.478916, -0.8477099, 1.099269, 1, 0, 0.4745098, 1,
1.51725, -1.301326, 1.331658, 1, 0, 0.4666667, 1,
1.518122, -0.2540932, 2.986516, 1, 0, 0.4627451, 1,
1.52821, 1.327179, 0.7534964, 1, 0, 0.454902, 1,
1.529367, -0.3791789, 2.80702, 1, 0, 0.4509804, 1,
1.541276, 0.7472854, 1.691306, 1, 0, 0.4431373, 1,
1.543731, 0.189364, 1.841375, 1, 0, 0.4392157, 1,
1.551553, 0.9698764, 1.393347, 1, 0, 0.4313726, 1,
1.552999, 0.388251, 2.129269, 1, 0, 0.427451, 1,
1.557555, -0.5960723, 1.873677, 1, 0, 0.4196078, 1,
1.559516, 1.100999, 1.788692, 1, 0, 0.4156863, 1,
1.562829, -0.1030745, 1.24292, 1, 0, 0.4078431, 1,
1.563149, 0.2711467, 1.063154, 1, 0, 0.4039216, 1,
1.572009, -2.264986, 1.665608, 1, 0, 0.3960784, 1,
1.582481, -0.7098814, 1.497579, 1, 0, 0.3882353, 1,
1.582778, 0.4660062, -0.2872588, 1, 0, 0.3843137, 1,
1.586603, 0.3970135, 0.8541857, 1, 0, 0.3764706, 1,
1.597198, -0.3958408, 2.816051, 1, 0, 0.372549, 1,
1.601943, 0.1238021, 3.748335, 1, 0, 0.3647059, 1,
1.622804, -2.937422, 2.781866, 1, 0, 0.3607843, 1,
1.624015, 0.3527642, 1.853438, 1, 0, 0.3529412, 1,
1.633144, 0.4236449, 0.2261705, 1, 0, 0.3490196, 1,
1.634222, 1.104698, -0.9477254, 1, 0, 0.3411765, 1,
1.644428, 0.1692132, 2.795921, 1, 0, 0.3372549, 1,
1.649954, -0.5654365, 2.224976, 1, 0, 0.3294118, 1,
1.666764, 0.2535957, 0.79365, 1, 0, 0.3254902, 1,
1.685034, 0.9205549, 0.2717109, 1, 0, 0.3176471, 1,
1.692027, 0.8955964, -1.055639, 1, 0, 0.3137255, 1,
1.699394, -0.880591, 1.947643, 1, 0, 0.3058824, 1,
1.706288, -1.184025, 0.4945178, 1, 0, 0.2980392, 1,
1.736956, 0.1525901, 1.984191, 1, 0, 0.2941177, 1,
1.742303, 0.1805175, 1.437658, 1, 0, 0.2862745, 1,
1.749312, -1.069592, 3.017519, 1, 0, 0.282353, 1,
1.754889, 0.5730692, 1.584284, 1, 0, 0.2745098, 1,
1.755546, 0.329726, 2.567961, 1, 0, 0.2705882, 1,
1.758685, 1.582646, -0.5368977, 1, 0, 0.2627451, 1,
1.772931, -0.2834089, 2.977744, 1, 0, 0.2588235, 1,
1.782544, 0.4293844, -0.05257233, 1, 0, 0.2509804, 1,
1.789467, -1.09166, 3.267401, 1, 0, 0.2470588, 1,
1.790228, -0.179842, 1.881089, 1, 0, 0.2392157, 1,
1.790251, -1.441672, 2.107669, 1, 0, 0.2352941, 1,
1.814051, 0.2117633, 1.710591, 1, 0, 0.227451, 1,
1.833232, 0.7762468, 0.3972535, 1, 0, 0.2235294, 1,
1.854233, 0.8584479, 0.2811584, 1, 0, 0.2156863, 1,
1.855232, -1.329205, 4.217601, 1, 0, 0.2117647, 1,
1.860734, -0.4249493, 2.702386, 1, 0, 0.2039216, 1,
1.87668, 0.3204395, 0.426565, 1, 0, 0.1960784, 1,
1.876744, -1.895353, 2.256979, 1, 0, 0.1921569, 1,
1.879139, -0.3477699, 3.649294, 1, 0, 0.1843137, 1,
1.920758, 0.9782297, 1.306549, 1, 0, 0.1803922, 1,
1.921704, 0.5980667, 0.9329099, 1, 0, 0.172549, 1,
1.928186, -0.8552273, 2.358207, 1, 0, 0.1686275, 1,
1.936575, -0.7695062, 4.448932, 1, 0, 0.1607843, 1,
1.955875, -0.1038939, 1.753482, 1, 0, 0.1568628, 1,
1.978756, -2.589805, 2.135586, 1, 0, 0.1490196, 1,
1.991671, 0.1414942, 1.5859, 1, 0, 0.145098, 1,
1.995459, -0.0632697, 2.941121, 1, 0, 0.1372549, 1,
2.000954, 0.7278242, -0.7104418, 1, 0, 0.1333333, 1,
2.008481, 1.335131, 0.3784319, 1, 0, 0.1254902, 1,
2.034084, 1.46692, 1.412698, 1, 0, 0.1215686, 1,
2.063054, 1.526144, 1.104279, 1, 0, 0.1137255, 1,
2.105683, 0.1474794, 1.653755, 1, 0, 0.1098039, 1,
2.121253, -0.6216672, 0.9694721, 1, 0, 0.1019608, 1,
2.147683, 0.4654207, 0.6660497, 1, 0, 0.09411765, 1,
2.276013, 0.884127, 0.6449395, 1, 0, 0.09019608, 1,
2.344901, -0.8618222, 0.9088063, 1, 0, 0.08235294, 1,
2.367516, -1.956987, 3.518063, 1, 0, 0.07843138, 1,
2.369845, 0.7753085, 1.202339, 1, 0, 0.07058824, 1,
2.421961, 0.1320437, 0.6376177, 1, 0, 0.06666667, 1,
2.466176, -0.4007025, -1.776577, 1, 0, 0.05882353, 1,
2.509942, -0.6111063, 0.4164955, 1, 0, 0.05490196, 1,
2.561902, -0.5192101, 2.516817, 1, 0, 0.04705882, 1,
2.595304, -0.3610628, 2.176425, 1, 0, 0.04313726, 1,
2.608403, -0.7586976, 1.394536, 1, 0, 0.03529412, 1,
2.613494, 0.1373694, 1.634413, 1, 0, 0.03137255, 1,
2.771729, 1.313056, 0.7837318, 1, 0, 0.02352941, 1,
2.791634, 1.325177, 2.597736, 1, 0, 0.01960784, 1,
3.258672, 0.8156626, 2.443798, 1, 0, 0.01176471, 1,
3.297557, -1.06685, 2.737901, 1, 0, 0.007843138, 1
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
-0.1198031, -4.290818, -6.685001, 0, -0.5, 0.5, 0.5,
-0.1198031, -4.290818, -6.685001, 1, -0.5, 0.5, 0.5,
-0.1198031, -4.290818, -6.685001, 1, 1.5, 0.5, 0.5,
-0.1198031, -4.290818, -6.685001, 0, 1.5, 0.5, 0.5
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
-4.695649, -0.3329673, -6.685001, 0, -0.5, 0.5, 0.5,
-4.695649, -0.3329673, -6.685001, 1, -0.5, 0.5, 0.5,
-4.695649, -0.3329673, -6.685001, 1, 1.5, 0.5, 0.5,
-4.695649, -0.3329673, -6.685001, 0, 1.5, 0.5, 0.5
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
-4.695649, -4.290818, 0.2617893, 0, -0.5, 0.5, 0.5,
-4.695649, -4.290818, 0.2617893, 1, -0.5, 0.5, 0.5,
-4.695649, -4.290818, 0.2617893, 1, 1.5, 0.5, 0.5,
-4.695649, -4.290818, 0.2617893, 0, 1.5, 0.5, 0.5
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
-3, -3.377468, -5.081895,
3, -3.377468, -5.081895,
-3, -3.377468, -5.081895,
-3, -3.529693, -5.34908,
-2, -3.377468, -5.081895,
-2, -3.529693, -5.34908,
-1, -3.377468, -5.081895,
-1, -3.529693, -5.34908,
0, -3.377468, -5.081895,
0, -3.529693, -5.34908,
1, -3.377468, -5.081895,
1, -3.529693, -5.34908,
2, -3.377468, -5.081895,
2, -3.529693, -5.34908,
3, -3.377468, -5.081895,
3, -3.529693, -5.34908
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
-3, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
-3, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
-3, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
-3, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
-2, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
-2, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
-2, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
-2, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
-1, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
-1, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
-1, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
-1, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
0, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
0, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
0, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
0, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
1, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
1, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
1, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
1, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
2, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
2, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
2, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
2, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5,
3, -3.834143, -5.883448, 0, -0.5, 0.5, 0.5,
3, -3.834143, -5.883448, 1, -0.5, 0.5, 0.5,
3, -3.834143, -5.883448, 1, 1.5, 0.5, 0.5,
3, -3.834143, -5.883448, 0, 1.5, 0.5, 0.5
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
-3.639684, -3, -5.081895,
-3.639684, 2, -5.081895,
-3.639684, -3, -5.081895,
-3.815678, -3, -5.34908,
-3.639684, -2, -5.081895,
-3.815678, -2, -5.34908,
-3.639684, -1, -5.081895,
-3.815678, -1, -5.34908,
-3.639684, 0, -5.081895,
-3.815678, 0, -5.34908,
-3.639684, 1, -5.081895,
-3.815678, 1, -5.34908,
-3.639684, 2, -5.081895,
-3.815678, 2, -5.34908
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
-4.167666, -3, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, -3, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, -3, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, -3, -5.883448, 0, 1.5, 0.5, 0.5,
-4.167666, -2, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, -2, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, -2, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, -2, -5.883448, 0, 1.5, 0.5, 0.5,
-4.167666, -1, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, -1, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, -1, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, -1, -5.883448, 0, 1.5, 0.5, 0.5,
-4.167666, 0, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, 0, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, 0, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, 0, -5.883448, 0, 1.5, 0.5, 0.5,
-4.167666, 1, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, 1, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, 1, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, 1, -5.883448, 0, 1.5, 0.5, 0.5,
-4.167666, 2, -5.883448, 0, -0.5, 0.5, 0.5,
-4.167666, 2, -5.883448, 1, -0.5, 0.5, 0.5,
-4.167666, 2, -5.883448, 1, 1.5, 0.5, 0.5,
-4.167666, 2, -5.883448, 0, 1.5, 0.5, 0.5
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
-3.639684, -3.377468, -4,
-3.639684, -3.377468, 4,
-3.639684, -3.377468, -4,
-3.815678, -3.529693, -4,
-3.639684, -3.377468, -2,
-3.815678, -3.529693, -2,
-3.639684, -3.377468, 0,
-3.815678, -3.529693, 0,
-3.639684, -3.377468, 2,
-3.815678, -3.529693, 2,
-3.639684, -3.377468, 4,
-3.815678, -3.529693, 4
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
-4.167666, -3.834143, -4, 0, -0.5, 0.5, 0.5,
-4.167666, -3.834143, -4, 1, -0.5, 0.5, 0.5,
-4.167666, -3.834143, -4, 1, 1.5, 0.5, 0.5,
-4.167666, -3.834143, -4, 0, 1.5, 0.5, 0.5,
-4.167666, -3.834143, -2, 0, -0.5, 0.5, 0.5,
-4.167666, -3.834143, -2, 1, -0.5, 0.5, 0.5,
-4.167666, -3.834143, -2, 1, 1.5, 0.5, 0.5,
-4.167666, -3.834143, -2, 0, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 0, 0, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 0, 1, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 0, 1, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 0, 0, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 2, 0, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 2, 1, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 2, 1, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 2, 0, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 4, 0, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 4, 1, -0.5, 0.5, 0.5,
-4.167666, -3.834143, 4, 1, 1.5, 0.5, 0.5,
-4.167666, -3.834143, 4, 0, 1.5, 0.5, 0.5
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
-3.639684, -3.377468, -5.081895,
-3.639684, 2.711534, -5.081895,
-3.639684, -3.377468, 5.605474,
-3.639684, 2.711534, 5.605474,
-3.639684, -3.377468, -5.081895,
-3.639684, -3.377468, 5.605474,
-3.639684, 2.711534, -5.081895,
-3.639684, 2.711534, 5.605474,
-3.639684, -3.377468, -5.081895,
3.400078, -3.377468, -5.081895,
-3.639684, -3.377468, 5.605474,
3.400078, -3.377468, 5.605474,
-3.639684, 2.711534, -5.081895,
3.400078, 2.711534, -5.081895,
-3.639684, 2.711534, 5.605474,
3.400078, 2.711534, 5.605474,
3.400078, -3.377468, -5.081895,
3.400078, 2.711534, -5.081895,
3.400078, -3.377468, 5.605474,
3.400078, 2.711534, 5.605474,
3.400078, -3.377468, -5.081895,
3.400078, -3.377468, 5.605474,
3.400078, 2.711534, -5.081895,
3.400078, 2.711534, 5.605474
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
var radius = 7.567733;
var distance = 33.6697;
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
mvMatrix.translate( 0.1198031, 0.3329673, -0.2617893 );
mvMatrix.scale( 1.162309, 1.343797, 0.7656122 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6697);
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
bifenox<-read.table("bifenox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bifenox$V2
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
```

```r
y<-bifenox$V3
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
```

```r
z<-bifenox$V4
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
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
-3.537163, 2.235408, -0.1107017, 0, 0, 1, 1, 1,
-3.361704, -1.988997, -2.323512, 1, 0, 0, 1, 1,
-3.272758, -0.354105, -1.371886, 1, 0, 0, 1, 1,
-3.147465, -0.8075647, -0.8638455, 1, 0, 0, 1, 1,
-2.789991, 0.1927248, -1.306882, 1, 0, 0, 1, 1,
-2.774639, 0.8653575, -1.606379, 1, 0, 0, 1, 1,
-2.728916, 0.8583347, -2.330589, 0, 0, 0, 1, 1,
-2.694359, 0.4703889, -2.068504, 0, 0, 0, 1, 1,
-2.661159, 0.1538834, -1.057177, 0, 0, 0, 1, 1,
-2.599495, -1.014476, -0.3008859, 0, 0, 0, 1, 1,
-2.536076, -1.477335, -3.082735, 0, 0, 0, 1, 1,
-2.401392, -0.6045533, -3.305543, 0, 0, 0, 1, 1,
-2.298051, 1.11039, -0.611515, 0, 0, 0, 1, 1,
-2.25466, -1.374612, -1.76423, 1, 1, 1, 1, 1,
-2.207224, 0.6218829, 0.04715265, 1, 1, 1, 1, 1,
-2.206193, 0.5923561, -1.888482, 1, 1, 1, 1, 1,
-2.203007, -1.713356, -2.60511, 1, 1, 1, 1, 1,
-2.199441, 2.089157, -0.7929969, 1, 1, 1, 1, 1,
-2.180841, -1.2525, -4.493229, 1, 1, 1, 1, 1,
-2.126831, 0.8873527, -2.34177, 1, 1, 1, 1, 1,
-2.122497, -0.007483576, -0.6123459, 1, 1, 1, 1, 1,
-2.120599, 0.9689413, -1.457176, 1, 1, 1, 1, 1,
-2.076302, -0.8895264, -2.644837, 1, 1, 1, 1, 1,
-2.074692, -0.03469622, -2.406448, 1, 1, 1, 1, 1,
-2.074295, -1.375185, -2.531056, 1, 1, 1, 1, 1,
-2.071728, 0.4075497, -1.042375, 1, 1, 1, 1, 1,
-2.060074, 0.8186968, -1.173489, 1, 1, 1, 1, 1,
-2.058783, -0.1961045, -1.929179, 1, 1, 1, 1, 1,
-1.997777, 0.3501907, 0.01423917, 0, 0, 1, 1, 1,
-1.992676, 1.627643, -1.243928, 1, 0, 0, 1, 1,
-1.986774, 0.7177593, -0.6739779, 1, 0, 0, 1, 1,
-1.977643, 0.465696, -1.981581, 1, 0, 0, 1, 1,
-1.960496, -1.144241, -3.043469, 1, 0, 0, 1, 1,
-1.947667, -0.4779741, -3.206089, 1, 0, 0, 1, 1,
-1.94741, -0.4490931, -2.597674, 0, 0, 0, 1, 1,
-1.942869, -1.856815, -3.081843, 0, 0, 0, 1, 1,
-1.923887, 0.6284909, -1.9125, 0, 0, 0, 1, 1,
-1.892508, -1.646519, -2.208997, 0, 0, 0, 1, 1,
-1.867194, 0.01189203, -0.5715449, 0, 0, 0, 1, 1,
-1.862746, -0.2249698, -2.703048, 0, 0, 0, 1, 1,
-1.857863, -0.5836536, -1.278687, 0, 0, 0, 1, 1,
-1.852626, 0.04008777, -1.036164, 1, 1, 1, 1, 1,
-1.835896, 0.6300721, -2.307843, 1, 1, 1, 1, 1,
-1.818464, -0.1607197, -0.9212804, 1, 1, 1, 1, 1,
-1.815758, -0.9931475, -1.65992, 1, 1, 1, 1, 1,
-1.809176, -1.781281, -2.865148, 1, 1, 1, 1, 1,
-1.796938, 0.1616283, -2.465311, 1, 1, 1, 1, 1,
-1.787505, -0.1516016, -0.8190055, 1, 1, 1, 1, 1,
-1.770001, 1.04463, -0.9181622, 1, 1, 1, 1, 1,
-1.75323, 0.1081487, -0.2104556, 1, 1, 1, 1, 1,
-1.751973, -0.8296088, -1.887641, 1, 1, 1, 1, 1,
-1.744483, -0.3543682, -0.9875431, 1, 1, 1, 1, 1,
-1.741122, 0.04416785, -0.9052719, 1, 1, 1, 1, 1,
-1.726382, 0.9666437, -2.565486, 1, 1, 1, 1, 1,
-1.721914, -0.1355817, -3.735235, 1, 1, 1, 1, 1,
-1.716763, 1.122073, -1.593689, 1, 1, 1, 1, 1,
-1.716001, 1.110863, -1.05972, 0, 0, 1, 1, 1,
-1.714051, 0.7121581, -1.102388, 1, 0, 0, 1, 1,
-1.704016, -0.2407903, -0.5942107, 1, 0, 0, 1, 1,
-1.672501, -0.1287155, -1.464477, 1, 0, 0, 1, 1,
-1.66733, 0.1028945, -0.874976, 1, 0, 0, 1, 1,
-1.657805, -1.043042, -2.754242, 1, 0, 0, 1, 1,
-1.644276, -0.1738696, -0.2516288, 0, 0, 0, 1, 1,
-1.634634, 0.6212022, 1.376983, 0, 0, 0, 1, 1,
-1.63397, 1.891944, -1.555647, 0, 0, 0, 1, 1,
-1.633417, -0.6079583, -3.029956, 0, 0, 0, 1, 1,
-1.631296, 0.09349731, -1.382172, 0, 0, 0, 1, 1,
-1.624608, -0.08568239, -1.325144, 0, 0, 0, 1, 1,
-1.620659, -0.2553212, -1.327544, 0, 0, 0, 1, 1,
-1.611788, -0.5907112, -2.636296, 1, 1, 1, 1, 1,
-1.610608, -1.817663, -3.268081, 1, 1, 1, 1, 1,
-1.609707, 1.409233, -2.292372, 1, 1, 1, 1, 1,
-1.596922, 1.137206, 1.586037, 1, 1, 1, 1, 1,
-1.559117, 0.3593258, -0.7639938, 1, 1, 1, 1, 1,
-1.5499, 0.714642, -0.09111621, 1, 1, 1, 1, 1,
-1.54351, -2.04319, -3.191652, 1, 1, 1, 1, 1,
-1.542603, -0.1244706, -3.929095, 1, 1, 1, 1, 1,
-1.541941, 0.550487, -0.7289557, 1, 1, 1, 1, 1,
-1.540391, -0.8380203, -3.048462, 1, 1, 1, 1, 1,
-1.539136, -0.03242091, -0.7771027, 1, 1, 1, 1, 1,
-1.528454, -0.4232367, -0.2266531, 1, 1, 1, 1, 1,
-1.523239, 1.036287, 0.2263524, 1, 1, 1, 1, 1,
-1.517201, -2.347242, -2.143721, 1, 1, 1, 1, 1,
-1.501262, 0.09411533, -0.8288413, 1, 1, 1, 1, 1,
-1.499723, -0.965806, -0.8788951, 0, 0, 1, 1, 1,
-1.495237, 0.7834674, 1.20115, 1, 0, 0, 1, 1,
-1.494763, 0.4044268, -2.263537, 1, 0, 0, 1, 1,
-1.483007, 0.2153482, -2.102732, 1, 0, 0, 1, 1,
-1.480435, 1.000072, -0.9742117, 1, 0, 0, 1, 1,
-1.467796, -1.502341, -1.327415, 1, 0, 0, 1, 1,
-1.467772, 1.314076, -0.1728256, 0, 0, 0, 1, 1,
-1.447182, 0.4043519, -0.9015621, 0, 0, 0, 1, 1,
-1.443359, 0.4906734, -1.39384, 0, 0, 0, 1, 1,
-1.427874, -0.5784289, -3.166865, 0, 0, 0, 1, 1,
-1.4223, -0.4359935, -2.684589, 0, 0, 0, 1, 1,
-1.414257, -0.5291688, -2.975726, 0, 0, 0, 1, 1,
-1.412389, -1.519515, -2.955359, 0, 0, 0, 1, 1,
-1.411636, 0.2147962, -1.442787, 1, 1, 1, 1, 1,
-1.406722, 0.1695388, -1.532469, 1, 1, 1, 1, 1,
-1.39968, 0.1895963, -2.860242, 1, 1, 1, 1, 1,
-1.395116, -0.07965789, -4.485349, 1, 1, 1, 1, 1,
-1.384174, -1.229792, -1.562744, 1, 1, 1, 1, 1,
-1.383095, 0.4069129, -0.06651861, 1, 1, 1, 1, 1,
-1.366638, -0.6771331, -1.362463, 1, 1, 1, 1, 1,
-1.352854, -0.07187995, -1.607968, 1, 1, 1, 1, 1,
-1.347281, -0.2333739, -1.674823, 1, 1, 1, 1, 1,
-1.336742, 1.088914, -1.30576, 1, 1, 1, 1, 1,
-1.335959, -0.6247824, -2.744917, 1, 1, 1, 1, 1,
-1.329474, -1.524347, -2.243857, 1, 1, 1, 1, 1,
-1.316825, -1.042012, -2.191082, 1, 1, 1, 1, 1,
-1.312911, -0.3266416, -0.6313096, 1, 1, 1, 1, 1,
-1.309801, -1.327398, -4.754408, 1, 1, 1, 1, 1,
-1.280486, -0.4683802, -1.569552, 0, 0, 1, 1, 1,
-1.267972, 0.6018264, -1.092218, 1, 0, 0, 1, 1,
-1.264247, 0.2212067, -3.240491, 1, 0, 0, 1, 1,
-1.257688, -1.228743, -3.005194, 1, 0, 0, 1, 1,
-1.252774, -0.1936674, -2.089275, 1, 0, 0, 1, 1,
-1.245635, -1.203557, -3.646798, 1, 0, 0, 1, 1,
-1.229344, 2.177382, 0.03071557, 0, 0, 0, 1, 1,
-1.228727, -3.288793, -3.864021, 0, 0, 0, 1, 1,
-1.225671, -1.315366, -1.487099, 0, 0, 0, 1, 1,
-1.217584, -1.649847, -4.759012, 0, 0, 0, 1, 1,
-1.216291, 0.7057573, 0.007956939, 0, 0, 0, 1, 1,
-1.210935, 1.671661, -0.80214, 0, 0, 0, 1, 1,
-1.207831, 1.985217, 0.1649411, 0, 0, 0, 1, 1,
-1.192961, 1.558157, 0.6743832, 1, 1, 1, 1, 1,
-1.184449, 2.152893, 0.725301, 1, 1, 1, 1, 1,
-1.17889, 1.168283, -0.1714425, 1, 1, 1, 1, 1,
-1.16276, -0.1342529, 0.2934672, 1, 1, 1, 1, 1,
-1.157278, -1.462366, -1.231986, 1, 1, 1, 1, 1,
-1.144186, -0.2258551, -3.768858, 1, 1, 1, 1, 1,
-1.139305, -0.4348107, -1.29709, 1, 1, 1, 1, 1,
-1.122198, -0.3679923, -3.186196, 1, 1, 1, 1, 1,
-1.120543, 0.1996568, -2.397697, 1, 1, 1, 1, 1,
-1.120197, 0.4435448, -2.191554, 1, 1, 1, 1, 1,
-1.106438, -0.436597, -4.098053, 1, 1, 1, 1, 1,
-1.104221, -0.7577131, -1.094767, 1, 1, 1, 1, 1,
-1.09951, -0.8851571, -1.616842, 1, 1, 1, 1, 1,
-1.091951, 1.414216, -2.316114, 1, 1, 1, 1, 1,
-1.090469, -0.5438095, -1.895524, 1, 1, 1, 1, 1,
-1.089922, -0.106037, -2.191227, 0, 0, 1, 1, 1,
-1.084607, 1.997243, -0.8290356, 1, 0, 0, 1, 1,
-1.082137, 1.375493, 0.8425141, 1, 0, 0, 1, 1,
-1.079142, -1.071027, -4.222579, 1, 0, 0, 1, 1,
-1.076311, 1.104162, -1.626049, 1, 0, 0, 1, 1,
-1.067705, -0.6338763, -1.595564, 1, 0, 0, 1, 1,
-1.055685, 0.3266699, -0.7315223, 0, 0, 0, 1, 1,
-1.053901, -0.8603934, -2.983465, 0, 0, 0, 1, 1,
-1.050178, -0.1825302, -3.604148, 0, 0, 0, 1, 1,
-1.044709, 1.186317, 0.9084049, 0, 0, 0, 1, 1,
-1.035102, -0.8959444, -2.566986, 0, 0, 0, 1, 1,
-1.035068, 0.006060246, -1.512892, 0, 0, 0, 1, 1,
-1.030436, -1.304957, -4.263047, 0, 0, 0, 1, 1,
-1.02418, 0.4057193, -0.8239911, 1, 1, 1, 1, 1,
-1.022836, -1.91042, -3.235714, 1, 1, 1, 1, 1,
-1.022735, -2.718198, -4.037035, 1, 1, 1, 1, 1,
-1.021534, -1.084428, -0.9223222, 1, 1, 1, 1, 1,
-1.019304, -0.1775225, -1.488096, 1, 1, 1, 1, 1,
-1.011771, -0.7153283, -1.582097, 1, 1, 1, 1, 1,
-1.011273, 0.9182707, -0.9339855, 1, 1, 1, 1, 1,
-1.009933, -0.2895316, -4.026772, 1, 1, 1, 1, 1,
-1.005398, -0.2357814, -0.5358509, 1, 1, 1, 1, 1,
-0.9934089, 0.9994847, -2.428596, 1, 1, 1, 1, 1,
-0.9928749, 0.2440658, -2.221612, 1, 1, 1, 1, 1,
-0.9904398, -0.6614279, -2.443702, 1, 1, 1, 1, 1,
-0.9836224, -0.8619144, -2.134081, 1, 1, 1, 1, 1,
-0.9835572, 0.02961747, -1.358292, 1, 1, 1, 1, 1,
-0.9762805, 1.040276, -0.01212911, 1, 1, 1, 1, 1,
-0.9740377, 0.1457516, -0.3751126, 0, 0, 1, 1, 1,
-0.9697785, -2.125333, -3.072065, 1, 0, 0, 1, 1,
-0.9691275, -1.208188, -1.729566, 1, 0, 0, 1, 1,
-0.9682432, -0.3016473, -0.7909486, 1, 0, 0, 1, 1,
-0.9538757, 0.1869361, -1.686136, 1, 0, 0, 1, 1,
-0.9511217, -1.347806, -4.834981, 1, 0, 0, 1, 1,
-0.9483457, -0.04357748, -0.9125405, 0, 0, 0, 1, 1,
-0.9443527, 0.1274557, -1.627671, 0, 0, 0, 1, 1,
-0.9386535, -0.3716215, -2.60884, 0, 0, 0, 1, 1,
-0.9384714, 1.31736, 0.4606425, 0, 0, 0, 1, 1,
-0.9361756, -0.654447, -2.644976, 0, 0, 0, 1, 1,
-0.9284973, 0.5967348, -1.856852, 0, 0, 0, 1, 1,
-0.9259482, -0.4353787, -2.559101, 0, 0, 0, 1, 1,
-0.9245058, 0.1418316, -0.6207334, 1, 1, 1, 1, 1,
-0.9237577, -0.6359655, -1.673036, 1, 1, 1, 1, 1,
-0.9230238, 0.3029186, -1.706966, 1, 1, 1, 1, 1,
-0.9222268, -1.047438, -1.217939, 1, 1, 1, 1, 1,
-0.9213639, 1.464288, -0.02920467, 1, 1, 1, 1, 1,
-0.9189001, 0.08745754, -1.433552, 1, 1, 1, 1, 1,
-0.913995, -1.04636, -1.413737, 1, 1, 1, 1, 1,
-0.911549, 0.2252603, 0.07407352, 1, 1, 1, 1, 1,
-0.9101849, -0.9699536, -1.636269, 1, 1, 1, 1, 1,
-0.906637, -1.119539, -2.78705, 1, 1, 1, 1, 1,
-0.9065537, 0.6204903, -0.4476964, 1, 1, 1, 1, 1,
-0.9055837, 1.048886, -1.791684, 1, 1, 1, 1, 1,
-0.9048007, 1.204245, -1.941438, 1, 1, 1, 1, 1,
-0.8960433, -0.7450106, -1.665542, 1, 1, 1, 1, 1,
-0.8942767, 0.5482044, -1.174431, 1, 1, 1, 1, 1,
-0.8893453, -0.1769369, -1.851491, 0, 0, 1, 1, 1,
-0.8869253, 0.776674, -1.739459, 1, 0, 0, 1, 1,
-0.8837093, -1.55391, -1.199903, 1, 0, 0, 1, 1,
-0.8825571, -0.08495416, -1.276079, 1, 0, 0, 1, 1,
-0.8818775, 1.118294, -2.254871, 1, 0, 0, 1, 1,
-0.8813525, 0.6543169, 0.3003494, 1, 0, 0, 1, 1,
-0.8801013, 0.8192581, -0.8919984, 0, 0, 0, 1, 1,
-0.8761018, 0.08376599, -2.140002, 0, 0, 0, 1, 1,
-0.8720747, -0.988238, -0.7764388, 0, 0, 0, 1, 1,
-0.871504, 1.242799, -1.490878, 0, 0, 0, 1, 1,
-0.871223, -0.5557601, -1.682282, 0, 0, 0, 1, 1,
-0.8665926, 2.071428, -0.5948536, 0, 0, 0, 1, 1,
-0.8624164, 0.9715386, -0.02235722, 0, 0, 0, 1, 1,
-0.8608937, -1.361517, -2.18706, 1, 1, 1, 1, 1,
-0.8549922, 0.9541054, 0.2633447, 1, 1, 1, 1, 1,
-0.850457, 0.9705709, 0.2555969, 1, 1, 1, 1, 1,
-0.8471431, 1.369613, -0.001743076, 1, 1, 1, 1, 1,
-0.8466381, 0.1696064, -2.283999, 1, 1, 1, 1, 1,
-0.8447515, 0.3253525, -1.244994, 1, 1, 1, 1, 1,
-0.8431512, 1.146251, -1.187374, 1, 1, 1, 1, 1,
-0.8317017, 2.493273, -0.4110449, 1, 1, 1, 1, 1,
-0.8276588, 1.372608, -2.122221, 1, 1, 1, 1, 1,
-0.8253488, 1.350685, -0.126588, 1, 1, 1, 1, 1,
-0.8250203, -0.8716601, -3.028413, 1, 1, 1, 1, 1,
-0.823431, 1.097208, 0.6824982, 1, 1, 1, 1, 1,
-0.8156017, 0.1923501, -1.203097, 1, 1, 1, 1, 1,
-0.8129394, -1.17741, -2.521785, 1, 1, 1, 1, 1,
-0.8113363, -0.908123, -1.398542, 1, 1, 1, 1, 1,
-0.8110802, -0.8364092, -3.393788, 0, 0, 1, 1, 1,
-0.8096757, 1.356494, -1.23781, 1, 0, 0, 1, 1,
-0.8061737, 1.162194, -0.660843, 1, 0, 0, 1, 1,
-0.8017083, -0.9621614, -0.9666626, 1, 0, 0, 1, 1,
-0.7982273, -0.1634341, -2.524601, 1, 0, 0, 1, 1,
-0.7917054, 0.6028852, -0.4435733, 1, 0, 0, 1, 1,
-0.7834998, -0.4408442, -1.478727, 0, 0, 0, 1, 1,
-0.7592069, -1.010132, -1.768554, 0, 0, 0, 1, 1,
-0.7557396, -0.3129683, -0.362809, 0, 0, 0, 1, 1,
-0.7507874, 2.459971, -0.9319715, 0, 0, 0, 1, 1,
-0.7498599, -0.8694318, -1.115979, 0, 0, 0, 1, 1,
-0.7490202, -2.02309, -1.232028, 0, 0, 0, 1, 1,
-0.7232401, -0.1722814, -0.7851342, 0, 0, 0, 1, 1,
-0.7214454, 0.6437311, -0.6933815, 1, 1, 1, 1, 1,
-0.7212923, 0.9845748, -0.5060057, 1, 1, 1, 1, 1,
-0.7208321, -0.03493815, -1.589002, 1, 1, 1, 1, 1,
-0.7096753, 0.7752609, -0.6318609, 1, 1, 1, 1, 1,
-0.7092434, 0.1118175, -2.606405, 1, 1, 1, 1, 1,
-0.7055457, 0.432877, -0.5191841, 1, 1, 1, 1, 1,
-0.7024645, 0.9839393, -2.308553, 1, 1, 1, 1, 1,
-0.7007337, -2.002472, -2.082436, 1, 1, 1, 1, 1,
-0.6972598, 1.010674, -2.577538, 1, 1, 1, 1, 1,
-0.6930586, -1.786872, -2.372765, 1, 1, 1, 1, 1,
-0.6881259, 0.06723285, -1.830439, 1, 1, 1, 1, 1,
-0.68699, 0.4032089, -1.300505, 1, 1, 1, 1, 1,
-0.6840935, -0.5321786, -0.8516936, 1, 1, 1, 1, 1,
-0.6819504, -0.2234605, -1.424874, 1, 1, 1, 1, 1,
-0.6806883, 0.377318, -0.6545678, 1, 1, 1, 1, 1,
-0.676703, 0.2866092, -1.10263, 0, 0, 1, 1, 1,
-0.6613024, -0.7668932, -3.963487, 1, 0, 0, 1, 1,
-0.6600674, 0.6763164, 0.02501687, 1, 0, 0, 1, 1,
-0.6594948, -0.09821828, -2.668087, 1, 0, 0, 1, 1,
-0.6576083, 0.6326657, -1.021386, 1, 0, 0, 1, 1,
-0.6560326, -1.933439, -1.506779, 1, 0, 0, 1, 1,
-0.6530412, -0.621469, -1.054857, 0, 0, 0, 1, 1,
-0.6518632, -0.2808862, -3.07739, 0, 0, 0, 1, 1,
-0.6485781, -1.824795, -2.425312, 0, 0, 0, 1, 1,
-0.6462901, -1.102671, -1.79819, 0, 0, 0, 1, 1,
-0.6419345, -0.01044663, -2.36616, 0, 0, 0, 1, 1,
-0.6391711, -0.4117284, -2.365004, 0, 0, 0, 1, 1,
-0.6369389, 0.4512259, -0.5765508, 0, 0, 0, 1, 1,
-0.6344939, 2.208143, 1.289126, 1, 1, 1, 1, 1,
-0.6320082, 0.5608905, -0.3264188, 1, 1, 1, 1, 1,
-0.6319631, -1.257971, -2.020063, 1, 1, 1, 1, 1,
-0.6318648, 0.1691985, -2.410913, 1, 1, 1, 1, 1,
-0.6274365, 1.634011, -1.032943, 1, 1, 1, 1, 1,
-0.6273182, -1.357399, -2.271692, 1, 1, 1, 1, 1,
-0.6265931, -0.8313763, -2.464587, 1, 1, 1, 1, 1,
-0.625216, -0.3056158, -2.216165, 1, 1, 1, 1, 1,
-0.6225603, -0.6568943, -2.635038, 1, 1, 1, 1, 1,
-0.6214113, -1.222088, -3.459549, 1, 1, 1, 1, 1,
-0.6205374, 1.667585, 0.3242732, 1, 1, 1, 1, 1,
-0.6204086, -1.067352, -3.79272, 1, 1, 1, 1, 1,
-0.6194303, 0.226754, -2.092299, 1, 1, 1, 1, 1,
-0.6164991, 0.6991041, 0.4124631, 1, 1, 1, 1, 1,
-0.6060932, 0.1955519, -2.332328, 1, 1, 1, 1, 1,
-0.6024598, 0.8479176, 1.011185, 0, 0, 1, 1, 1,
-0.5932494, 2.324069, 1.162771, 1, 0, 0, 1, 1,
-0.5916687, 0.8473256, 0.3229882, 1, 0, 0, 1, 1,
-0.5913245, 0.9959219, -0.1931381, 1, 0, 0, 1, 1,
-0.591306, -0.1307498, -2.163803, 1, 0, 0, 1, 1,
-0.5903141, -0.2004864, -1.789037, 1, 0, 0, 1, 1,
-0.5843151, 0.0193845, -2.114487, 0, 0, 0, 1, 1,
-0.5822476, 0.5366674, -2.201139, 0, 0, 0, 1, 1,
-0.5759568, 0.0145005, -1.83885, 0, 0, 0, 1, 1,
-0.5695571, -1.339644, -2.605373, 0, 0, 0, 1, 1,
-0.5603973, 0.1697375, -0.4629773, 0, 0, 0, 1, 1,
-0.5603427, -0.65558, -3.113163, 0, 0, 0, 1, 1,
-0.5578279, -1.618343, -2.30373, 0, 0, 0, 1, 1,
-0.5553131, -0.3047993, -3.744563, 1, 1, 1, 1, 1,
-0.5470451, 0.2270556, -0.4480023, 1, 1, 1, 1, 1,
-0.5469099, -0.004688284, -0.003453836, 1, 1, 1, 1, 1,
-0.5468684, -0.6878988, -1.757423, 1, 1, 1, 1, 1,
-0.5389521, -0.6481675, -2.349938, 1, 1, 1, 1, 1,
-0.53753, 1.234582, 0.1805609, 1, 1, 1, 1, 1,
-0.5328622, 0.554283, -1.396458, 1, 1, 1, 1, 1,
-0.5320921, 0.3936771, -0.0411383, 1, 1, 1, 1, 1,
-0.5293546, -0.1661321, -1.92841, 1, 1, 1, 1, 1,
-0.5279715, 0.643652, -2.06125, 1, 1, 1, 1, 1,
-0.5187781, 0.8833351, 0.3837785, 1, 1, 1, 1, 1,
-0.5177352, 0.08755455, -2.55708, 1, 1, 1, 1, 1,
-0.5113847, -0.2885731, -1.132413, 1, 1, 1, 1, 1,
-0.5093085, -2.353485, -3.023505, 1, 1, 1, 1, 1,
-0.5088746, -0.8617188, -2.314911, 1, 1, 1, 1, 1,
-0.5060015, -0.0308827, -1.671936, 0, 0, 1, 1, 1,
-0.504777, -0.169256, -2.177734, 1, 0, 0, 1, 1,
-0.5045614, -0.4268414, -0.8748368, 1, 0, 0, 1, 1,
-0.5023549, 0.4047423, -3.645002, 1, 0, 0, 1, 1,
-0.4957199, -0.5883387, -2.774119, 1, 0, 0, 1, 1,
-0.495391, 2.027576, -2.113267, 1, 0, 0, 1, 1,
-0.4896533, -1.273731, -2.520705, 0, 0, 0, 1, 1,
-0.4891906, 1.408816, -0.03676922, 0, 0, 0, 1, 1,
-0.4839509, 0.6006982, 0.2127421, 0, 0, 0, 1, 1,
-0.4823759, 0.6301218, -0.9020389, 0, 0, 0, 1, 1,
-0.4788055, 1.104577, 3.017396, 0, 0, 0, 1, 1,
-0.4777307, -1.007321, -2.158245, 0, 0, 0, 1, 1,
-0.4757975, 0.4924349, 0.2726027, 0, 0, 0, 1, 1,
-0.4733549, -0.3035689, -2.691147, 1, 1, 1, 1, 1,
-0.4726263, -0.8530686, -2.212561, 1, 1, 1, 1, 1,
-0.4680965, -1.345449, -2.867883, 1, 1, 1, 1, 1,
-0.4680933, -0.2842155, -1.538813, 1, 1, 1, 1, 1,
-0.4647806, -0.5359708, -2.760398, 1, 1, 1, 1, 1,
-0.4617708, -0.3519842, -2.342149, 1, 1, 1, 1, 1,
-0.4609776, -0.04709123, -2.401585, 1, 1, 1, 1, 1,
-0.4597225, 1.067357, -0.7114196, 1, 1, 1, 1, 1,
-0.4596983, 1.107009, -0.9623608, 1, 1, 1, 1, 1,
-0.4582545, 1.672705, -0.5898163, 1, 1, 1, 1, 1,
-0.4580352, -0.7773586, -3.012835, 1, 1, 1, 1, 1,
-0.4553233, 0.6177065, -0.08394121, 1, 1, 1, 1, 1,
-0.4491461, 0.270987, -0.359519, 1, 1, 1, 1, 1,
-0.4450881, 1.860776, 1.258094, 1, 1, 1, 1, 1,
-0.4446051, -0.1046112, -0.8499922, 1, 1, 1, 1, 1,
-0.4413108, -0.1520818, -1.453966, 0, 0, 1, 1, 1,
-0.4398288, -0.460284, -0.8142005, 1, 0, 0, 1, 1,
-0.439064, 0.7024033, 0.663544, 1, 0, 0, 1, 1,
-0.4382422, 0.2050261, -1.852397, 1, 0, 0, 1, 1,
-0.4306846, -1.293403, -3.068152, 1, 0, 0, 1, 1,
-0.4301071, -0.07517491, -1.927821, 1, 0, 0, 1, 1,
-0.4270554, -0.4491775, -2.350134, 0, 0, 0, 1, 1,
-0.4247513, 0.47032, -1.490965, 0, 0, 0, 1, 1,
-0.4243409, -0.102904, -0.4452167, 0, 0, 0, 1, 1,
-0.4239186, -1.884791, -2.180419, 0, 0, 0, 1, 1,
-0.4221774, -0.4883407, -1.269214, 0, 0, 0, 1, 1,
-0.4213781, 1.475181, -0.2487866, 0, 0, 0, 1, 1,
-0.4183756, -1.957145, -4.528421, 0, 0, 0, 1, 1,
-0.4155131, 1.948783, -0.307381, 1, 1, 1, 1, 1,
-0.4149902, -0.3547443, -1.550681, 1, 1, 1, 1, 1,
-0.4100062, -1.6627, -3.956143, 1, 1, 1, 1, 1,
-0.4098776, 0.5366391, -1.892336, 1, 1, 1, 1, 1,
-0.404895, -1.508796, -4.926254, 1, 1, 1, 1, 1,
-0.4022242, 0.4478114, -1.323267, 1, 1, 1, 1, 1,
-0.4004765, 0.04768127, -1.331485, 1, 1, 1, 1, 1,
-0.3970861, 0.6492078, -1.037314, 1, 1, 1, 1, 1,
-0.3939191, 0.7838644, -2.080187, 1, 1, 1, 1, 1,
-0.3923928, 0.7523417, 0.6602476, 1, 1, 1, 1, 1,
-0.3905279, -0.6956167, -2.928834, 1, 1, 1, 1, 1,
-0.3880533, 0.2504865, 0.9597763, 1, 1, 1, 1, 1,
-0.3851394, 1.074082, -0.5750144, 1, 1, 1, 1, 1,
-0.3802089, 0.2269896, -0.001665312, 1, 1, 1, 1, 1,
-0.3761657, 0.2430596, -2.668195, 1, 1, 1, 1, 1,
-0.3712424, -0.3168284, -2.112554, 0, 0, 1, 1, 1,
-0.367881, -0.7263317, -2.128885, 1, 0, 0, 1, 1,
-0.3668062, 0.3875384, -2.670487, 1, 0, 0, 1, 1,
-0.3582926, 0.4684643, -0.3100105, 1, 0, 0, 1, 1,
-0.3539387, 1.014689, -0.9702267, 1, 0, 0, 1, 1,
-0.3524786, 0.04759798, -0.891696, 1, 0, 0, 1, 1,
-0.3498367, -0.4692578, -1.678283, 0, 0, 0, 1, 1,
-0.3476602, -1.162281, -3.448898, 0, 0, 0, 1, 1,
-0.3475884, -1.794179, -2.481946, 0, 0, 0, 1, 1,
-0.344695, 0.3265402, -1.736648, 0, 0, 0, 1, 1,
-0.3431106, 0.7666312, 0.1118569, 0, 0, 0, 1, 1,
-0.3428309, 0.8981648, -1.399035, 0, 0, 0, 1, 1,
-0.3399079, 0.2563315, -3.017973, 0, 0, 0, 1, 1,
-0.3389235, -1.033229, -3.123297, 1, 1, 1, 1, 1,
-0.3378929, 0.07473357, -2.833, 1, 1, 1, 1, 1,
-0.3359486, -0.6239753, -4.362442, 1, 1, 1, 1, 1,
-0.3329954, -1.494054, -3.333847, 1, 1, 1, 1, 1,
-0.3278685, -1.221459, -2.416114, 1, 1, 1, 1, 1,
-0.3268853, 0.596655, -1.231253, 1, 1, 1, 1, 1,
-0.3266633, 0.3221139, -0.1466539, 1, 1, 1, 1, 1,
-0.3207634, -0.3057501, -1.436845, 1, 1, 1, 1, 1,
-0.320474, 0.3342728, -0.318579, 1, 1, 1, 1, 1,
-0.3185937, -0.3710085, -1.258227, 1, 1, 1, 1, 1,
-0.3173998, -0.7743338, -3.219802, 1, 1, 1, 1, 1,
-0.3172847, -0.6814339, -2.714833, 1, 1, 1, 1, 1,
-0.3169349, 1.13544, -0.01490276, 1, 1, 1, 1, 1,
-0.3055404, 0.5846006, -1.404248, 1, 1, 1, 1, 1,
-0.3023734, -0.4042569, -3.29813, 1, 1, 1, 1, 1,
-0.301822, 0.7553044, -0.4476688, 0, 0, 1, 1, 1,
-0.2970312, -1.58843, -2.729206, 1, 0, 0, 1, 1,
-0.296738, -1.27524, -2.07184, 1, 0, 0, 1, 1,
-0.2965148, 0.7878956, 0.6566158, 1, 0, 0, 1, 1,
-0.2891401, -0.5609653, -1.271835, 1, 0, 0, 1, 1,
-0.286731, 1.308195, 0.3058658, 1, 0, 0, 1, 1,
-0.2864303, -0.03756123, -2.05806, 0, 0, 0, 1, 1,
-0.285028, 0.6778887, 1.182073, 0, 0, 0, 1, 1,
-0.2802826, -1.069731, -4.062725, 0, 0, 0, 1, 1,
-0.2791075, 1.953677, -0.09308745, 0, 0, 0, 1, 1,
-0.2758824, 1.229127, -0.5711057, 0, 0, 0, 1, 1,
-0.2717441, -0.212846, -0.5680001, 0, 0, 0, 1, 1,
-0.2707969, -0.1411561, -1.441788, 0, 0, 0, 1, 1,
-0.2695498, -0.4527144, -3.303013, 1, 1, 1, 1, 1,
-0.2647535, -2.152381, -3.168992, 1, 1, 1, 1, 1,
-0.2591245, -0.6202208, -3.289725, 1, 1, 1, 1, 1,
-0.2551541, 0.01103925, -0.7420518, 1, 1, 1, 1, 1,
-0.2493197, 1.371465, -0.9516483, 1, 1, 1, 1, 1,
-0.2488195, -1.241597, -0.468408, 1, 1, 1, 1, 1,
-0.2477767, 0.5858909, 1.759105, 1, 1, 1, 1, 1,
-0.2343643, 0.06436204, -1.741208, 1, 1, 1, 1, 1,
-0.230818, 0.6743147, -0.4838453, 1, 1, 1, 1, 1,
-0.2290049, -0.1011167, -2.9822, 1, 1, 1, 1, 1,
-0.2284352, -0.379156, -1.818319, 1, 1, 1, 1, 1,
-0.2270252, 0.7475758, -0.7640703, 1, 1, 1, 1, 1,
-0.226573, -0.7805577, -2.426135, 1, 1, 1, 1, 1,
-0.2245985, 0.8226346, 1.707543, 1, 1, 1, 1, 1,
-0.2229233, 0.4689789, -0.5441295, 1, 1, 1, 1, 1,
-0.2205494, -1.161041, -2.160545, 0, 0, 1, 1, 1,
-0.2181994, 1.30618, 0.1269532, 1, 0, 0, 1, 1,
-0.2165439, -1.126464, -4.164968, 1, 0, 0, 1, 1,
-0.2144153, -0.8579448, -3.992146, 1, 0, 0, 1, 1,
-0.2077583, -0.2922184, -3.051076, 1, 0, 0, 1, 1,
-0.2036544, 1.317101, 0.6372175, 1, 0, 0, 1, 1,
-0.202948, 0.453744, -0.3427279, 0, 0, 0, 1, 1,
-0.2020369, -1.674103, -4.050869, 0, 0, 0, 1, 1,
-0.1975028, -1.671768, -1.81174, 0, 0, 0, 1, 1,
-0.197486, 0.2646632, -0.7146469, 0, 0, 0, 1, 1,
-0.1965247, -0.3333054, -2.762875, 0, 0, 0, 1, 1,
-0.1898546, 0.98434, -0.6224271, 0, 0, 0, 1, 1,
-0.189854, 0.8805824, -0.9661871, 0, 0, 0, 1, 1,
-0.1828647, 1.527941, -0.7101069, 1, 1, 1, 1, 1,
-0.1802713, 0.8321911, 0.3956131, 1, 1, 1, 1, 1,
-0.1728274, 0.342213, -1.549642, 1, 1, 1, 1, 1,
-0.1677478, -1.034476, -2.718117, 1, 1, 1, 1, 1,
-0.1669424, 0.4027611, 0.1052531, 1, 1, 1, 1, 1,
-0.1650876, 0.1429517, 0.1668983, 1, 1, 1, 1, 1,
-0.1644607, 0.8978325, -0.9108598, 1, 1, 1, 1, 1,
-0.1644475, 0.1245444, -2.481148, 1, 1, 1, 1, 1,
-0.1631381, 0.7441068, 0.2190266, 1, 1, 1, 1, 1,
-0.1618783, 1.180273, -1.749778, 1, 1, 1, 1, 1,
-0.1595515, 0.2859276, -2.345444, 1, 1, 1, 1, 1,
-0.1574908, 0.3668531, -1.50894, 1, 1, 1, 1, 1,
-0.1572933, -0.07287936, -2.396861, 1, 1, 1, 1, 1,
-0.1548391, 1.489243, -1.290058, 1, 1, 1, 1, 1,
-0.1502098, -0.9657733, -4.168036, 1, 1, 1, 1, 1,
-0.1482096, 0.6987833, -0.3106037, 0, 0, 1, 1, 1,
-0.1479194, 0.1690298, -1.529168, 1, 0, 0, 1, 1,
-0.1468028, -0.3273958, -3.137242, 1, 0, 0, 1, 1,
-0.1399217, -2.731582, -4.288175, 1, 0, 0, 1, 1,
-0.1353541, -0.326985, -0.5566173, 1, 0, 0, 1, 1,
-0.1271393, 0.2468433, -0.28648, 1, 0, 0, 1, 1,
-0.1268195, -2.029905, -2.567879, 0, 0, 0, 1, 1,
-0.1251393, -0.006607219, -2.53883, 0, 0, 0, 1, 1,
-0.1248896, 1.096578, -0.5998839, 0, 0, 0, 1, 1,
-0.1228518, -0.3827981, -3.705731, 0, 0, 0, 1, 1,
-0.1227331, -0.4727204, -3.145376, 0, 0, 0, 1, 1,
-0.1191788, -0.7938154, -2.184987, 0, 0, 0, 1, 1,
-0.1185831, -0.3324197, -1.925491, 0, 0, 0, 1, 1,
-0.1134702, 0.8612266, 0.2093439, 1, 1, 1, 1, 1,
-0.1114583, 0.6460472, -0.040152, 1, 1, 1, 1, 1,
-0.1106132, -0.4494115, -3.67966, 1, 1, 1, 1, 1,
-0.1105815, -0.9085091, -3.874157, 1, 1, 1, 1, 1,
-0.1103552, 0.3696542, -1.183075, 1, 1, 1, 1, 1,
-0.1097462, 0.6011876, 0.3003646, 1, 1, 1, 1, 1,
-0.1062679, -0.6570758, -3.954708, 1, 1, 1, 1, 1,
-0.1031514, -1.385202, -2.561456, 1, 1, 1, 1, 1,
-0.1020895, -0.3392036, -4.199682, 1, 1, 1, 1, 1,
-0.1018745, -0.5592579, -3.564892, 1, 1, 1, 1, 1,
-0.09942289, 0.5591351, -0.2837624, 1, 1, 1, 1, 1,
-0.09692933, 0.3523005, 0.8467928, 1, 1, 1, 1, 1,
-0.09559168, -0.4706516, -0.7659425, 1, 1, 1, 1, 1,
-0.0917455, -1.85957, -2.998697, 1, 1, 1, 1, 1,
-0.08851753, 0.1105239, -0.540828, 1, 1, 1, 1, 1,
-0.08811334, -1.324444, -3.34685, 0, 0, 1, 1, 1,
-0.08730008, 0.7114003, -1.070489, 1, 0, 0, 1, 1,
-0.081109, 1.476816, 0.8290846, 1, 0, 0, 1, 1,
-0.0750237, 0.6932754, 0.5910056, 1, 0, 0, 1, 1,
-0.07343517, 1.227443, -0.05599809, 1, 0, 0, 1, 1,
-0.07069514, 0.02668157, 0.0007440422, 1, 0, 0, 1, 1,
-0.06649842, 1.659405, 0.5999162, 0, 0, 0, 1, 1,
-0.06640483, 0.7506767, -0.0337412, 0, 0, 0, 1, 1,
-0.0588271, -1.737686, -2.113407, 0, 0, 0, 1, 1,
-0.05506683, -0.8535985, -2.85172, 0, 0, 0, 1, 1,
-0.05235063, -0.5195453, -4.132512, 0, 0, 0, 1, 1,
-0.0494455, 1.161705, -0.7571232, 0, 0, 0, 1, 1,
-0.04728303, -0.9403744, -4.598514, 0, 0, 0, 1, 1,
-0.04642597, 0.06283126, -0.7373959, 1, 1, 1, 1, 1,
-0.0450708, 0.4150448, 0.7677531, 1, 1, 1, 1, 1,
-0.04465908, 0.03704502, -1.743363, 1, 1, 1, 1, 1,
-0.04409398, -0.2529852, -1.518399, 1, 1, 1, 1, 1,
-0.04281341, 0.3660324, 0.9844234, 1, 1, 1, 1, 1,
-0.03989485, 0.03255757, 0.8636702, 1, 1, 1, 1, 1,
-0.039567, 0.7694084, 0.9968478, 1, 1, 1, 1, 1,
-0.03733276, -2.300796, -0.6310054, 1, 1, 1, 1, 1,
-0.03258945, 0.6771346, 1.447191, 1, 1, 1, 1, 1,
-0.03015064, 0.1787554, -1.388117, 1, 1, 1, 1, 1,
-0.02510016, -1.134931, -1.854434, 1, 1, 1, 1, 1,
-0.02329095, 0.007261666, -0.8556972, 1, 1, 1, 1, 1,
-0.02008754, 1.845889, -1.572451, 1, 1, 1, 1, 1,
-0.01941641, 0.8731576, 0.5234926, 1, 1, 1, 1, 1,
-0.01753725, 0.4709167, -1.756065, 1, 1, 1, 1, 1,
-0.01601082, 0.2685135, 0.4547442, 0, 0, 1, 1, 1,
-0.01445441, 0.01047349, -1.043903, 1, 0, 0, 1, 1,
0.001367234, -0.4069473, 3.9498, 1, 0, 0, 1, 1,
0.002256288, 0.7102172, 0.377393, 1, 0, 0, 1, 1,
0.005554807, 0.9291215, -0.6230127, 1, 0, 0, 1, 1,
0.0134121, 0.107869, 0.9995347, 1, 0, 0, 1, 1,
0.0177942, -0.0647852, 2.902738, 0, 0, 0, 1, 1,
0.02066589, 1.015409, -1.494819, 0, 0, 0, 1, 1,
0.02066597, -0.4511501, 4.913638, 0, 0, 0, 1, 1,
0.02072681, 1.907234, -0.00795146, 0, 0, 0, 1, 1,
0.0215162, -0.9197065, 3.069625, 0, 0, 0, 1, 1,
0.02216738, 0.3506488, 1.231303, 0, 0, 0, 1, 1,
0.02478456, 0.4494472, -0.1305151, 0, 0, 0, 1, 1,
0.02780385, 0.4819928, 1.972234, 1, 1, 1, 1, 1,
0.0411442, -1.087932, 3.722054, 1, 1, 1, 1, 1,
0.04298077, 0.8250117, 0.9464809, 1, 1, 1, 1, 1,
0.04817072, 1.289157, 1.758206, 1, 1, 1, 1, 1,
0.04994985, 0.5602828, 1.165696, 1, 1, 1, 1, 1,
0.05381319, 0.6455413, -1.000253, 1, 1, 1, 1, 1,
0.05397337, -0.2170331, 3.562302, 1, 1, 1, 1, 1,
0.05635968, -0.1133388, 4.711277, 1, 1, 1, 1, 1,
0.05789441, -0.6802439, 4.278779, 1, 1, 1, 1, 1,
0.05912135, 1.189581, 0.6727743, 1, 1, 1, 1, 1,
0.05981611, -0.9631132, 3.127527, 1, 1, 1, 1, 1,
0.06170035, -0.4903077, 2.692614, 1, 1, 1, 1, 1,
0.06302023, 0.1953232, 0.8008627, 1, 1, 1, 1, 1,
0.06711973, 0.09591672, 0.6273549, 1, 1, 1, 1, 1,
0.06792995, 1.587685, 1.213228, 1, 1, 1, 1, 1,
0.06858528, -0.6688415, 3.248662, 0, 0, 1, 1, 1,
0.06858845, -0.1082901, 4.204191, 1, 0, 0, 1, 1,
0.07040815, -0.7808412, 4.328063, 1, 0, 0, 1, 1,
0.07392607, 0.3938948, 1.98229, 1, 0, 0, 1, 1,
0.07562274, 0.417396, 0.568051, 1, 0, 0, 1, 1,
0.07934444, -0.5987347, 3.141185, 1, 0, 0, 1, 1,
0.08043201, 1.013057, 0.3237085, 0, 0, 0, 1, 1,
0.0814897, -0.3736471, 3.64299, 0, 0, 0, 1, 1,
0.08238189, 1.064368, 0.8356744, 0, 0, 0, 1, 1,
0.08397065, -0.1201884, 1.052774, 0, 0, 0, 1, 1,
0.08433205, 0.5567051, 0.1216939, 0, 0, 0, 1, 1,
0.08637056, -0.5799799, 1.590863, 0, 0, 0, 1, 1,
0.08684143, -0.0752486, 2.494832, 0, 0, 0, 1, 1,
0.09418657, -0.5140333, 3.027623, 1, 1, 1, 1, 1,
0.09474093, 0.9724798, -1.108732, 1, 1, 1, 1, 1,
0.1011138, -0.6765842, 4.119, 1, 1, 1, 1, 1,
0.1028265, 0.6509941, -0.4488937, 1, 1, 1, 1, 1,
0.1049619, 0.2382121, -0.3117429, 1, 1, 1, 1, 1,
0.106838, -0.1522123, 2.534083, 1, 1, 1, 1, 1,
0.1080579, 0.8142561, 0.6565588, 1, 1, 1, 1, 1,
0.1105889, 1.680779, 0.1699703, 1, 1, 1, 1, 1,
0.1136663, -0.3599377, 2.924904, 1, 1, 1, 1, 1,
0.114449, 1.410189, -0.2120769, 1, 1, 1, 1, 1,
0.1151101, -0.133159, 4.347371, 1, 1, 1, 1, 1,
0.1187461, -1.3555, 3.238503, 1, 1, 1, 1, 1,
0.1201983, 1.137732, 0.6295953, 1, 1, 1, 1, 1,
0.120248, 1.66564, 1.209469, 1, 1, 1, 1, 1,
0.122782, -0.5513197, 2.231999, 1, 1, 1, 1, 1,
0.1236079, 0.9780463, 0.8070599, 0, 0, 1, 1, 1,
0.1236379, -0.8072206, 4.688912, 1, 0, 0, 1, 1,
0.1264403, -0.06765689, 1.929348, 1, 0, 0, 1, 1,
0.1290498, 0.8398075, 0.8337852, 1, 0, 0, 1, 1,
0.129805, -0.1438105, 3.745499, 1, 0, 0, 1, 1,
0.1321547, 0.2637393, 1.635632, 1, 0, 0, 1, 1,
0.1330513, -0.5960944, 1.295723, 0, 0, 0, 1, 1,
0.1336306, -1.39584, 4.998986, 0, 0, 0, 1, 1,
0.1384262, 1.17249, -0.02971327, 0, 0, 0, 1, 1,
0.1404121, 1.032182, -0.8482407, 0, 0, 0, 1, 1,
0.1417885, -0.5901738, 2.229914, 0, 0, 0, 1, 1,
0.1439608, 1.09077, 0.634863, 0, 0, 0, 1, 1,
0.1448837, 0.2875446, 1.18354, 0, 0, 0, 1, 1,
0.1500269, 0.3347648, 2.235722, 1, 1, 1, 1, 1,
0.1517704, 0.1953439, -0.4499148, 1, 1, 1, 1, 1,
0.1589571, -1.782818, 3.373093, 1, 1, 1, 1, 1,
0.1628823, 1.860977, -1.156623, 1, 1, 1, 1, 1,
0.1632931, -1.368872, 5.297731, 1, 1, 1, 1, 1,
0.1665964, 0.9962218, -0.8227325, 1, 1, 1, 1, 1,
0.1682471, -0.4814875, 1.561721, 1, 1, 1, 1, 1,
0.1686704, 0.1413459, 1.241419, 1, 1, 1, 1, 1,
0.1699775, -0.0275127, -0.9562685, 1, 1, 1, 1, 1,
0.1708256, 0.9127405, -0.6142483, 1, 1, 1, 1, 1,
0.1714182, -1.048135, 2.59494, 1, 1, 1, 1, 1,
0.1720554, 0.4741543, -0.2406217, 1, 1, 1, 1, 1,
0.1730686, 0.4195004, -1.369114, 1, 1, 1, 1, 1,
0.1736134, -0.1037747, 0.9464, 1, 1, 1, 1, 1,
0.1743528, -0.9479775, 4.563468, 1, 1, 1, 1, 1,
0.1785264, 0.5803275, 0.06112865, 0, 0, 1, 1, 1,
0.1792797, -0.9013295, 2.938379, 1, 0, 0, 1, 1,
0.1803882, 0.5376679, 1.065071, 1, 0, 0, 1, 1,
0.1805882, -0.7522717, 4.0697, 1, 0, 0, 1, 1,
0.1829691, 2.453949, -1.584233, 1, 0, 0, 1, 1,
0.1846517, -2.22846, 3.172455, 1, 0, 0, 1, 1,
0.1862471, -0.8453646, 3.253966, 0, 0, 0, 1, 1,
0.1863881, 1.149881, -0.01621208, 0, 0, 0, 1, 1,
0.1902613, 0.2490037, 3.181441, 0, 0, 0, 1, 1,
0.1915118, 0.4431442, -0.279484, 0, 0, 0, 1, 1,
0.1982779, -1.636043, 2.828394, 0, 0, 0, 1, 1,
0.2030337, -1.064462, 2.638039, 0, 0, 0, 1, 1,
0.2031737, 1.07269, -0.9179392, 0, 0, 0, 1, 1,
0.2064993, -0.2691689, 3.647253, 1, 1, 1, 1, 1,
0.2068449, -0.7942821, 3.86419, 1, 1, 1, 1, 1,
0.2121654, 0.3658542, 1.836431, 1, 1, 1, 1, 1,
0.2127026, -1.693999, 3.706678, 1, 1, 1, 1, 1,
0.2187817, 0.1446904, -1.52044, 1, 1, 1, 1, 1,
0.220274, -0.2928452, 2.907172, 1, 1, 1, 1, 1,
0.2309359, -1.595787, 3.467913, 1, 1, 1, 1, 1,
0.2311672, -0.08908605, 0.1831135, 1, 1, 1, 1, 1,
0.2352566, 0.1255786, 0.7983846, 1, 1, 1, 1, 1,
0.2419087, -1.422985, 5.449833, 1, 1, 1, 1, 1,
0.2555426, -0.4773268, 2.894007, 1, 1, 1, 1, 1,
0.2596826, -1.197488, 2.242762, 1, 1, 1, 1, 1,
0.2600552, 2.622859, 0.6010053, 1, 1, 1, 1, 1,
0.2624379, -0.8692664, 3.11217, 1, 1, 1, 1, 1,
0.2625636, -1.619623, 2.245175, 1, 1, 1, 1, 1,
0.2638335, 0.1913622, 1.038598, 0, 0, 1, 1, 1,
0.2664461, 2.432131, -1.002891, 1, 0, 0, 1, 1,
0.2694642, 0.7331855, -0.3686852, 1, 0, 0, 1, 1,
0.2718727, -2.63862, 2.388446, 1, 0, 0, 1, 1,
0.2725231, 0.6481731, 1.267486, 1, 0, 0, 1, 1,
0.2763594, -0.4761482, 2.391121, 1, 0, 0, 1, 1,
0.2783425, -0.4249483, 3.433749, 0, 0, 0, 1, 1,
0.2796468, -0.05247549, 0.4988047, 0, 0, 0, 1, 1,
0.2804503, -1.208125, 4.008469, 0, 0, 0, 1, 1,
0.2844747, 0.2553776, 0.2319304, 0, 0, 0, 1, 1,
0.2859388, -0.07991234, 1.486665, 0, 0, 0, 1, 1,
0.2884211, -0.03057155, 2.727474, 0, 0, 0, 1, 1,
0.2903055, -1.885176, 2.222693, 0, 0, 0, 1, 1,
0.2904729, -1.999295, 2.954684, 1, 1, 1, 1, 1,
0.2919425, 0.6050873, -1.071568, 1, 1, 1, 1, 1,
0.2921983, -0.9263089, 2.051111, 1, 1, 1, 1, 1,
0.2974763, 0.3364758, 1.165241, 1, 1, 1, 1, 1,
0.2983764, 1.984496, -1.062179, 1, 1, 1, 1, 1,
0.3018093, -0.1942591, 3.012974, 1, 1, 1, 1, 1,
0.3028117, 0.06653415, 1.774917, 1, 1, 1, 1, 1,
0.3029327, -0.3738325, 2.164592, 1, 1, 1, 1, 1,
0.3037778, -0.6132299, 3.189906, 1, 1, 1, 1, 1,
0.3067606, 1.435512, 0.5298682, 1, 1, 1, 1, 1,
0.319664, -0.1794061, 4.223827, 1, 1, 1, 1, 1,
0.3269774, 1.456897, -1.625026, 1, 1, 1, 1, 1,
0.3279476, 0.680302, 1.551301, 1, 1, 1, 1, 1,
0.3290916, -1.321037, 1.656359, 1, 1, 1, 1, 1,
0.3369389, -1.022975, 3.332242, 1, 1, 1, 1, 1,
0.3369697, 0.1010061, 1.976794, 0, 0, 1, 1, 1,
0.3370327, -0.5003905, 3.759827, 1, 0, 0, 1, 1,
0.3390723, 0.4496388, 0.9022732, 1, 0, 0, 1, 1,
0.3410744, 0.3004443, 1.314533, 1, 0, 0, 1, 1,
0.3502232, 0.2088561, 1.222589, 1, 0, 0, 1, 1,
0.3531335, -0.1765229, 2.126286, 1, 0, 0, 1, 1,
0.3535852, -0.6582189, 2.377341, 0, 0, 0, 1, 1,
0.3556663, 1.110424, 0.3518269, 0, 0, 0, 1, 1,
0.3607328, -0.5042987, 2.796623, 0, 0, 0, 1, 1,
0.3616885, -1.211798, 1.604828, 0, 0, 0, 1, 1,
0.3668124, -0.2013033, 1.177014, 0, 0, 0, 1, 1,
0.3709445, 0.6654477, 0.9960129, 0, 0, 0, 1, 1,
0.3745984, -0.6683288, 3.852872, 0, 0, 0, 1, 1,
0.3761492, -2.690328, 3.188776, 1, 1, 1, 1, 1,
0.3785911, 0.02129126, 1.155528, 1, 1, 1, 1, 1,
0.3809686, -0.8126638, 4.100595, 1, 1, 1, 1, 1,
0.3819166, -2.529811, 1.313006, 1, 1, 1, 1, 1,
0.3820275, -1.718507, 2.412083, 1, 1, 1, 1, 1,
0.3826513, 1.553297, 0.0115741, 1, 1, 1, 1, 1,
0.3877479, -0.9887959, 4.306211, 1, 1, 1, 1, 1,
0.3884197, -0.3173589, 1.789523, 1, 1, 1, 1, 1,
0.397981, -0.3254008, 2.469217, 1, 1, 1, 1, 1,
0.3999206, 0.1444362, 0.6902317, 1, 1, 1, 1, 1,
0.4060013, -1.310365, 4.291346, 1, 1, 1, 1, 1,
0.4107954, 0.8546199, 1.447842, 1, 1, 1, 1, 1,
0.4112275, 0.396225, 0.8105061, 1, 1, 1, 1, 1,
0.4156939, 1.187785, 0.2192016, 1, 1, 1, 1, 1,
0.4159079, -0.9803406, 1.781819, 1, 1, 1, 1, 1,
0.4162394, -0.8143016, 3.048538, 0, 0, 1, 1, 1,
0.4187413, -2.081083, 2.443244, 1, 0, 0, 1, 1,
0.4201167, -1.091449, 1.938398, 1, 0, 0, 1, 1,
0.420443, 1.907869, 0.5330248, 1, 0, 0, 1, 1,
0.4211205, -0.07615783, 1.67908, 1, 0, 0, 1, 1,
0.4253899, -1.184431, 3.033716, 1, 0, 0, 1, 1,
0.4310544, 0.01862595, 1.978831, 0, 0, 0, 1, 1,
0.4311413, 2.579783, -0.623281, 0, 0, 0, 1, 1,
0.4456879, 0.7891666, -0.758433, 0, 0, 0, 1, 1,
0.4466866, 0.02399806, 1.816081, 0, 0, 0, 1, 1,
0.4496387, -1.915353, 3.225756, 0, 0, 0, 1, 1,
0.4508016, -0.5963183, 3.613248, 0, 0, 0, 1, 1,
0.4532013, 0.8089422, 2.010278, 0, 0, 0, 1, 1,
0.4544808, -0.2827225, 2.651087, 1, 1, 1, 1, 1,
0.4563381, 0.7698897, -0.1483451, 1, 1, 1, 1, 1,
0.4639064, 2.140255, -0.07914591, 1, 1, 1, 1, 1,
0.4730266, 1.63899, -0.6659212, 1, 1, 1, 1, 1,
0.4735906, 0.2728727, 0.1558262, 1, 1, 1, 1, 1,
0.4769594, 0.7670944, 0.4813218, 1, 1, 1, 1, 1,
0.4801072, 0.4354607, 1.667322, 1, 1, 1, 1, 1,
0.4818141, 2.071738, 1.309031, 1, 1, 1, 1, 1,
0.4828418, -0.5442829, 2.465439, 1, 1, 1, 1, 1,
0.4851122, -0.8714736, 2.718739, 1, 1, 1, 1, 1,
0.4875688, 0.2968871, 0.9303296, 1, 1, 1, 1, 1,
0.4880138, 0.9284871, -0.3608106, 1, 1, 1, 1, 1,
0.498706, -0.8316528, 1.816776, 1, 1, 1, 1, 1,
0.5000197, -0.9155613, 2.289747, 1, 1, 1, 1, 1,
0.5091181, 0.8303047, -0.8510527, 1, 1, 1, 1, 1,
0.5113552, -1.864913, 2.250645, 0, 0, 1, 1, 1,
0.5235606, -0.359113, 1.417823, 1, 0, 0, 1, 1,
0.5279725, -0.3879294, 1.701177, 1, 0, 0, 1, 1,
0.5435374, -0.5270935, 1.675608, 1, 0, 0, 1, 1,
0.5440086, 0.4837448, 1.99158, 1, 0, 0, 1, 1,
0.5445913, -0.06745851, 1.844733, 1, 0, 0, 1, 1,
0.5540297, 1.483872, 0.6937672, 0, 0, 0, 1, 1,
0.5542518, 1.305942, 0.9810724, 0, 0, 0, 1, 1,
0.5557387, 0.9798254, 0.9192523, 0, 0, 0, 1, 1,
0.5560176, 1.410979, 0.6935958, 0, 0, 0, 1, 1,
0.5563454, -2.01966, 2.674893, 0, 0, 0, 1, 1,
0.5564463, 0.1716232, 0.6771452, 0, 0, 0, 1, 1,
0.5605578, -2.77242, 2.166348, 0, 0, 0, 1, 1,
0.5642952, 0.7550657, -0.5681337, 1, 1, 1, 1, 1,
0.5666642, 0.08300918, -0.9672624, 1, 1, 1, 1, 1,
0.5681896, 0.8063098, 0.5274627, 1, 1, 1, 1, 1,
0.5698994, -1.406405, 3.335518, 1, 1, 1, 1, 1,
0.5702634, -0.1913209, 1.948253, 1, 1, 1, 1, 1,
0.5757087, -0.6032193, 2.606041, 1, 1, 1, 1, 1,
0.5807771, 1.882087, 0.1938693, 1, 1, 1, 1, 1,
0.5829647, 1.100707, 0.2429562, 1, 1, 1, 1, 1,
0.586395, -1.075657, 4.151746, 1, 1, 1, 1, 1,
0.594638, 0.7003772, 1.175242, 1, 1, 1, 1, 1,
0.5966099, 0.8597047, 0.1595775, 1, 1, 1, 1, 1,
0.5966301, 0.2205426, 0.9749568, 1, 1, 1, 1, 1,
0.6004178, -0.3166489, 2.442976, 1, 1, 1, 1, 1,
0.6058053, -0.7060413, 0.9931002, 1, 1, 1, 1, 1,
0.6168026, -0.01150682, -0.06689853, 1, 1, 1, 1, 1,
0.618241, 0.06757119, -0.2596986, 0, 0, 1, 1, 1,
0.6184191, 0.980885, -0.1921786, 1, 0, 0, 1, 1,
0.6206914, -0.9410502, 1.210157, 1, 0, 0, 1, 1,
0.6272332, -0.05304892, -0.5638567, 1, 0, 0, 1, 1,
0.6302251, 0.2987644, -0.01679695, 1, 0, 0, 1, 1,
0.6308738, 2.116197, 0.3992791, 1, 0, 0, 1, 1,
0.6311347, 0.797228, 2.215048, 0, 0, 0, 1, 1,
0.6383069, -0.437442, -0.1297958, 0, 0, 0, 1, 1,
0.643164, 0.2145243, 0.6793023, 0, 0, 0, 1, 1,
0.6433755, 0.92763, 0.275153, 0, 0, 0, 1, 1,
0.6503665, 0.7246098, 1.019713, 0, 0, 0, 1, 1,
0.6602736, 2.435879, -0.08407602, 0, 0, 0, 1, 1,
0.6652361, -0.4438281, 1.679036, 0, 0, 0, 1, 1,
0.6695406, -0.9356239, 1.684852, 1, 1, 1, 1, 1,
0.6705978, -1.324327, 3.768118, 1, 1, 1, 1, 1,
0.6709298, -0.2689213, 2.556203, 1, 1, 1, 1, 1,
0.6710405, 0.8888389, -0.334363, 1, 1, 1, 1, 1,
0.6791869, -0.8401926, 2.067231, 1, 1, 1, 1, 1,
0.6797521, 0.687642, 0.0915398, 1, 1, 1, 1, 1,
0.6853803, 0.1784374, 1.21795, 1, 1, 1, 1, 1,
0.6914269, 0.4800921, 0.1833183, 1, 1, 1, 1, 1,
0.6934417, -1.064771, 1.71633, 1, 1, 1, 1, 1,
0.6967822, 0.3156049, 0.8810523, 1, 1, 1, 1, 1,
0.6983337, -1.214742, 1.541788, 1, 1, 1, 1, 1,
0.6983959, 0.3968928, 0.8978017, 1, 1, 1, 1, 1,
0.70557, 1.674671, 0.04896784, 1, 1, 1, 1, 1,
0.7177781, 0.461208, 2.052072, 1, 1, 1, 1, 1,
0.7298781, 0.3536337, -0.5526406, 1, 1, 1, 1, 1,
0.7300352, 1.110984, 1.97028, 0, 0, 1, 1, 1,
0.7301605, 0.8082479, -0.8326296, 1, 0, 0, 1, 1,
0.730686, 0.3480125, 1.962961, 1, 0, 0, 1, 1,
0.73426, 2.249537, 0.6949799, 1, 0, 0, 1, 1,
0.7350746, 0.7457092, 0.05479212, 1, 0, 0, 1, 1,
0.7402641, 0.8394942, 2.295565, 1, 0, 0, 1, 1,
0.7429911, -2.772331, 2.73345, 0, 0, 0, 1, 1,
0.7527308, -0.2925865, 2.45608, 0, 0, 0, 1, 1,
0.7538015, -0.2199826, 0.8986595, 0, 0, 0, 1, 1,
0.7578745, 0.1023063, -0.09017997, 0, 0, 0, 1, 1,
0.7602357, 0.557041, -0.9320179, 0, 0, 0, 1, 1,
0.7620671, 1.559858, -0.1212969, 0, 0, 0, 1, 1,
0.7751005, -0.5419117, 1.868537, 0, 0, 0, 1, 1,
0.775575, -0.8479981, 1.450776, 1, 1, 1, 1, 1,
0.7777062, 0.2295282, 0.4416544, 1, 1, 1, 1, 1,
0.7787679, -1.227164, 2.309905, 1, 1, 1, 1, 1,
0.7886863, 0.3663209, 0.4922134, 1, 1, 1, 1, 1,
0.7916273, -0.149221, 1.408579, 1, 1, 1, 1, 1,
0.7916731, 1.543626, -0.2724732, 1, 1, 1, 1, 1,
0.7919165, 1.334819, 0.8111394, 1, 1, 1, 1, 1,
0.7926593, 1.609197, -0.1894748, 1, 1, 1, 1, 1,
0.8004345, 1.251112, -0.3963506, 1, 1, 1, 1, 1,
0.80238, -0.08798593, 0.1647801, 1, 1, 1, 1, 1,
0.8031889, -1.304408, 1.083964, 1, 1, 1, 1, 1,
0.803439, -0.06886816, 0.7337307, 1, 1, 1, 1, 1,
0.8041837, 0.2589172, -0.003734626, 1, 1, 1, 1, 1,
0.8082318, -0.5389476, 1.240572, 1, 1, 1, 1, 1,
0.813298, 1.560955, 1.321511, 1, 1, 1, 1, 1,
0.8155137, 1.609864, -1.156836, 0, 0, 1, 1, 1,
0.8203403, 1.55644, 0.02279401, 1, 0, 0, 1, 1,
0.8320746, 0.3561326, 2.413559, 1, 0, 0, 1, 1,
0.8370678, -1.153422, 1.317262, 1, 0, 0, 1, 1,
0.8382068, -0.005243313, 2.222932, 1, 0, 0, 1, 1,
0.8408731, 0.5977218, 0.5353367, 1, 0, 0, 1, 1,
0.8455097, -0.4511188, 2.772872, 0, 0, 0, 1, 1,
0.8498469, -0.6119502, 2.254033, 0, 0, 0, 1, 1,
0.8510467, 1.832523, 0.4239626, 0, 0, 0, 1, 1,
0.8592701, -0.133789, 1.396636, 0, 0, 0, 1, 1,
0.8600959, -0.1974441, 1.259791, 0, 0, 0, 1, 1,
0.8615691, -0.5268838, 1.288858, 0, 0, 0, 1, 1,
0.8616754, 0.8790746, 0.3002799, 0, 0, 0, 1, 1,
0.8703612, 0.2677585, 2.243657, 1, 1, 1, 1, 1,
0.8716187, 1.123381, 0.9294934, 1, 1, 1, 1, 1,
0.8731378, -0.177281, 1.392403, 1, 1, 1, 1, 1,
0.8762081, 1.216886, -1.820831, 1, 1, 1, 1, 1,
0.8878393, 1.161777, 0.3283425, 1, 1, 1, 1, 1,
0.8937684, 0.4310312, 0.2801421, 1, 1, 1, 1, 1,
0.893975, 1.700401, 0.3798416, 1, 1, 1, 1, 1,
0.9075609, 0.1974432, 0.8683489, 1, 1, 1, 1, 1,
0.9186874, 0.1332746, 2.194119, 1, 1, 1, 1, 1,
0.9196813, 0.3315751, -2.317987, 1, 1, 1, 1, 1,
0.9238399, 0.2160379, 1.519377, 1, 1, 1, 1, 1,
0.9290711, -0.1305943, 2.933996, 1, 1, 1, 1, 1,
0.9317068, -0.3259496, 1.078914, 1, 1, 1, 1, 1,
0.9364952, -1.959277, 4.341457, 1, 1, 1, 1, 1,
0.9432502, -1.058038, 3.363896, 1, 1, 1, 1, 1,
0.9440305, -1.872769, 4.175598, 0, 0, 1, 1, 1,
0.9441078, 2.564438, 1.407664, 1, 0, 0, 1, 1,
0.9596986, -0.1823192, 1.846728, 1, 0, 0, 1, 1,
0.9603826, 0.6005501, 2.736903, 1, 0, 0, 1, 1,
0.9623128, 0.9170454, -0.3813562, 1, 0, 0, 1, 1,
0.9627517, -0.004475078, 2.624816, 1, 0, 0, 1, 1,
0.9667065, -0.6784016, 1.712235, 0, 0, 0, 1, 1,
0.9810891, 0.3098108, 1.898906, 0, 0, 0, 1, 1,
0.98583, 0.8508832, 0.6768623, 0, 0, 0, 1, 1,
0.9894544, 0.05046902, 1.420436, 0, 0, 0, 1, 1,
0.9913124, 0.1756589, 0.4842188, 0, 0, 0, 1, 1,
0.9940367, -0.398247, 2.266864, 0, 0, 0, 1, 1,
0.9954539, -0.7385614, -0.2862806, 0, 0, 0, 1, 1,
0.9997797, 1.113195, 1.516893, 1, 1, 1, 1, 1,
1.001371, -0.536632, 2.93244, 1, 1, 1, 1, 1,
1.004509, 1.395448, -0.4099068, 1, 1, 1, 1, 1,
1.012617, 0.9153373, -0.1166218, 1, 1, 1, 1, 1,
1.01466, -0.446292, 1.839352, 1, 1, 1, 1, 1,
1.016241, -0.07448404, 2.205038, 1, 1, 1, 1, 1,
1.016275, 0.2601241, 0.8105958, 1, 1, 1, 1, 1,
1.018477, 1.051556, 1.525798, 1, 1, 1, 1, 1,
1.019336, -0.5307367, 1.049129, 1, 1, 1, 1, 1,
1.022158, 0.1680121, 0.7228358, 1, 1, 1, 1, 1,
1.036467, 0.02900369, 2.03777, 1, 1, 1, 1, 1,
1.038577, 1.478353, 0.7276751, 1, 1, 1, 1, 1,
1.042891, -1.97945, 3.958273, 1, 1, 1, 1, 1,
1.046959, 0.1138, 1.082912, 1, 1, 1, 1, 1,
1.049545, 1.438261, 0.8493678, 1, 1, 1, 1, 1,
1.053479, -0.4933356, 4.308309, 0, 0, 1, 1, 1,
1.059801, 0.08800543, 2.446752, 1, 0, 0, 1, 1,
1.067448, -0.5512914, 0.5330559, 1, 0, 0, 1, 1,
1.068716, -1.799134, 3.18463, 1, 0, 0, 1, 1,
1.08066, 1.057111, -0.615978, 1, 0, 0, 1, 1,
1.088027, -0.6422215, 2.473149, 1, 0, 0, 1, 1,
1.09631, 0.7912931, 2.901232, 0, 0, 0, 1, 1,
1.110544, 0.4534025, 1.115632, 0, 0, 0, 1, 1,
1.11426, 1.363536, 0.8321934, 0, 0, 0, 1, 1,
1.126174, -1.124008, 3.457271, 0, 0, 0, 1, 1,
1.12815, 0.7044224, 0.5630707, 0, 0, 0, 1, 1,
1.13711, 0.9763928, 0.2302037, 0, 0, 0, 1, 1,
1.142566, 1.487173, 2.2265, 0, 0, 0, 1, 1,
1.147397, -1.806784, 1.582005, 1, 1, 1, 1, 1,
1.147865, 2.060649, 2.143106, 1, 1, 1, 1, 1,
1.148582, 0.3933464, 0.03801076, 1, 1, 1, 1, 1,
1.148929, -0.08414909, 1.919656, 1, 1, 1, 1, 1,
1.151597, -0.5787752, 1.750729, 1, 1, 1, 1, 1,
1.152206, 0.8966739, -0.1141339, 1, 1, 1, 1, 1,
1.157137, 1.682301, 0.5367502, 1, 1, 1, 1, 1,
1.158042, -0.8603324, 2.026619, 1, 1, 1, 1, 1,
1.164559, 0.09614141, 1.665814, 1, 1, 1, 1, 1,
1.166587, 0.4079645, 0.8775899, 1, 1, 1, 1, 1,
1.167004, 0.1111504, 0.9216555, 1, 1, 1, 1, 1,
1.179302, 0.4575379, 3.000812, 1, 1, 1, 1, 1,
1.18012, 1.312498, 0.2333324, 1, 1, 1, 1, 1,
1.180126, -0.1905684, 1.372484, 1, 1, 1, 1, 1,
1.189362, -0.05739988, 2.213152, 1, 1, 1, 1, 1,
1.190564, -0.2205235, 1.768441, 0, 0, 1, 1, 1,
1.19253, 2.16658, -0.08530211, 1, 0, 0, 1, 1,
1.207765, -1.168406, 1.503987, 1, 0, 0, 1, 1,
1.220522, 1.175304, -0.7728773, 1, 0, 0, 1, 1,
1.221198, -0.2417292, 1.839774, 1, 0, 0, 1, 1,
1.221372, -0.01027044, 1.716689, 1, 0, 0, 1, 1,
1.221516, -0.4697366, 1.768078, 0, 0, 0, 1, 1,
1.22282, 1.79837, -0.3584084, 0, 0, 0, 1, 1,
1.225709, 0.6719556, 0.6182563, 0, 0, 0, 1, 1,
1.236257, 0.8623086, 0.4135013, 0, 0, 0, 1, 1,
1.246667, 1.033189, 1.969503, 0, 0, 0, 1, 1,
1.24947, 1.087213, -0.7544494, 0, 0, 0, 1, 1,
1.253663, 0.2655409, -1.805752, 0, 0, 0, 1, 1,
1.257041, -1.343711, 2.296511, 1, 1, 1, 1, 1,
1.263702, -0.3921812, 2.830286, 1, 1, 1, 1, 1,
1.265407, 1.160636, -0.07076847, 1, 1, 1, 1, 1,
1.267146, 1.231708, 2.193952, 1, 1, 1, 1, 1,
1.268296, -1.062594, 2.705662, 1, 1, 1, 1, 1,
1.270179, 0.3385314, 1.057532, 1, 1, 1, 1, 1,
1.270471, 0.90943, 1.77313, 1, 1, 1, 1, 1,
1.275501, -1.277231, 3.453807, 1, 1, 1, 1, 1,
1.289497, -0.2159403, 1.51385, 1, 1, 1, 1, 1,
1.291721, -0.3409063, 3.26766, 1, 1, 1, 1, 1,
1.294524, 0.3782603, -0.3396949, 1, 1, 1, 1, 1,
1.297711, -0.9557781, 1.329279, 1, 1, 1, 1, 1,
1.302465, 0.03121192, 0.6877518, 1, 1, 1, 1, 1,
1.309085, -0.6327933, 2.87968, 1, 1, 1, 1, 1,
1.310686, -1.066757, 3.277788, 1, 1, 1, 1, 1,
1.322418, 1.119737, 2.766955, 0, 0, 1, 1, 1,
1.322904, 0.411195, -0.6316536, 1, 0, 0, 1, 1,
1.332758, 0.8572677, 0.4085124, 1, 0, 0, 1, 1,
1.336344, -0.6207056, 3.451797, 1, 0, 0, 1, 1,
1.340774, -0.7119934, 2.208447, 1, 0, 0, 1, 1,
1.350385, -0.3767439, 2.89333, 1, 0, 0, 1, 1,
1.363354, 1.574974, 0.6604757, 0, 0, 0, 1, 1,
1.377391, -0.7942796, 0.08171344, 0, 0, 0, 1, 1,
1.378173, 0.1970492, 2.791547, 0, 0, 0, 1, 1,
1.380119, -0.707703, 3.393916, 0, 0, 0, 1, 1,
1.382734, 0.1799868, 0.758452, 0, 0, 0, 1, 1,
1.387555, -0.1350659, 1.825831, 0, 0, 0, 1, 1,
1.404926, -0.6681063, 2.958417, 0, 0, 0, 1, 1,
1.413387, -1.982823, 2.590177, 1, 1, 1, 1, 1,
1.425145, 1.38616, 0.4533784, 1, 1, 1, 1, 1,
1.42687, -0.3149938, 3.342468, 1, 1, 1, 1, 1,
1.429279, -0.4705265, 3.254164, 1, 1, 1, 1, 1,
1.432114, 0.8184151, 1.479599, 1, 1, 1, 1, 1,
1.444764, -0.5237204, 2.307315, 1, 1, 1, 1, 1,
1.44576, 0.8864607, 0.3537897, 1, 1, 1, 1, 1,
1.446993, 0.6905965, 2.841417, 1, 1, 1, 1, 1,
1.447717, -1.263112, 2.332543, 1, 1, 1, 1, 1,
1.456309, 1.382362, 2.299882, 1, 1, 1, 1, 1,
1.461177, 0.6536663, 0.6327711, 1, 1, 1, 1, 1,
1.463459, -0.2908939, 0.9456027, 1, 1, 1, 1, 1,
1.478916, -0.8477099, 1.099269, 1, 1, 1, 1, 1,
1.51725, -1.301326, 1.331658, 1, 1, 1, 1, 1,
1.518122, -0.2540932, 2.986516, 1, 1, 1, 1, 1,
1.52821, 1.327179, 0.7534964, 0, 0, 1, 1, 1,
1.529367, -0.3791789, 2.80702, 1, 0, 0, 1, 1,
1.541276, 0.7472854, 1.691306, 1, 0, 0, 1, 1,
1.543731, 0.189364, 1.841375, 1, 0, 0, 1, 1,
1.551553, 0.9698764, 1.393347, 1, 0, 0, 1, 1,
1.552999, 0.388251, 2.129269, 1, 0, 0, 1, 1,
1.557555, -0.5960723, 1.873677, 0, 0, 0, 1, 1,
1.559516, 1.100999, 1.788692, 0, 0, 0, 1, 1,
1.562829, -0.1030745, 1.24292, 0, 0, 0, 1, 1,
1.563149, 0.2711467, 1.063154, 0, 0, 0, 1, 1,
1.572009, -2.264986, 1.665608, 0, 0, 0, 1, 1,
1.582481, -0.7098814, 1.497579, 0, 0, 0, 1, 1,
1.582778, 0.4660062, -0.2872588, 0, 0, 0, 1, 1,
1.586603, 0.3970135, 0.8541857, 1, 1, 1, 1, 1,
1.597198, -0.3958408, 2.816051, 1, 1, 1, 1, 1,
1.601943, 0.1238021, 3.748335, 1, 1, 1, 1, 1,
1.622804, -2.937422, 2.781866, 1, 1, 1, 1, 1,
1.624015, 0.3527642, 1.853438, 1, 1, 1, 1, 1,
1.633144, 0.4236449, 0.2261705, 1, 1, 1, 1, 1,
1.634222, 1.104698, -0.9477254, 1, 1, 1, 1, 1,
1.644428, 0.1692132, 2.795921, 1, 1, 1, 1, 1,
1.649954, -0.5654365, 2.224976, 1, 1, 1, 1, 1,
1.666764, 0.2535957, 0.79365, 1, 1, 1, 1, 1,
1.685034, 0.9205549, 0.2717109, 1, 1, 1, 1, 1,
1.692027, 0.8955964, -1.055639, 1, 1, 1, 1, 1,
1.699394, -0.880591, 1.947643, 1, 1, 1, 1, 1,
1.706288, -1.184025, 0.4945178, 1, 1, 1, 1, 1,
1.736956, 0.1525901, 1.984191, 1, 1, 1, 1, 1,
1.742303, 0.1805175, 1.437658, 0, 0, 1, 1, 1,
1.749312, -1.069592, 3.017519, 1, 0, 0, 1, 1,
1.754889, 0.5730692, 1.584284, 1, 0, 0, 1, 1,
1.755546, 0.329726, 2.567961, 1, 0, 0, 1, 1,
1.758685, 1.582646, -0.5368977, 1, 0, 0, 1, 1,
1.772931, -0.2834089, 2.977744, 1, 0, 0, 1, 1,
1.782544, 0.4293844, -0.05257233, 0, 0, 0, 1, 1,
1.789467, -1.09166, 3.267401, 0, 0, 0, 1, 1,
1.790228, -0.179842, 1.881089, 0, 0, 0, 1, 1,
1.790251, -1.441672, 2.107669, 0, 0, 0, 1, 1,
1.814051, 0.2117633, 1.710591, 0, 0, 0, 1, 1,
1.833232, 0.7762468, 0.3972535, 0, 0, 0, 1, 1,
1.854233, 0.8584479, 0.2811584, 0, 0, 0, 1, 1,
1.855232, -1.329205, 4.217601, 1, 1, 1, 1, 1,
1.860734, -0.4249493, 2.702386, 1, 1, 1, 1, 1,
1.87668, 0.3204395, 0.426565, 1, 1, 1, 1, 1,
1.876744, -1.895353, 2.256979, 1, 1, 1, 1, 1,
1.879139, -0.3477699, 3.649294, 1, 1, 1, 1, 1,
1.920758, 0.9782297, 1.306549, 1, 1, 1, 1, 1,
1.921704, 0.5980667, 0.9329099, 1, 1, 1, 1, 1,
1.928186, -0.8552273, 2.358207, 1, 1, 1, 1, 1,
1.936575, -0.7695062, 4.448932, 1, 1, 1, 1, 1,
1.955875, -0.1038939, 1.753482, 1, 1, 1, 1, 1,
1.978756, -2.589805, 2.135586, 1, 1, 1, 1, 1,
1.991671, 0.1414942, 1.5859, 1, 1, 1, 1, 1,
1.995459, -0.0632697, 2.941121, 1, 1, 1, 1, 1,
2.000954, 0.7278242, -0.7104418, 1, 1, 1, 1, 1,
2.008481, 1.335131, 0.3784319, 1, 1, 1, 1, 1,
2.034084, 1.46692, 1.412698, 0, 0, 1, 1, 1,
2.063054, 1.526144, 1.104279, 1, 0, 0, 1, 1,
2.105683, 0.1474794, 1.653755, 1, 0, 0, 1, 1,
2.121253, -0.6216672, 0.9694721, 1, 0, 0, 1, 1,
2.147683, 0.4654207, 0.6660497, 1, 0, 0, 1, 1,
2.276013, 0.884127, 0.6449395, 1, 0, 0, 1, 1,
2.344901, -0.8618222, 0.9088063, 0, 0, 0, 1, 1,
2.367516, -1.956987, 3.518063, 0, 0, 0, 1, 1,
2.369845, 0.7753085, 1.202339, 0, 0, 0, 1, 1,
2.421961, 0.1320437, 0.6376177, 0, 0, 0, 1, 1,
2.466176, -0.4007025, -1.776577, 0, 0, 0, 1, 1,
2.509942, -0.6111063, 0.4164955, 0, 0, 0, 1, 1,
2.561902, -0.5192101, 2.516817, 0, 0, 0, 1, 1,
2.595304, -0.3610628, 2.176425, 1, 1, 1, 1, 1,
2.608403, -0.7586976, 1.394536, 1, 1, 1, 1, 1,
2.613494, 0.1373694, 1.634413, 1, 1, 1, 1, 1,
2.771729, 1.313056, 0.7837318, 1, 1, 1, 1, 1,
2.791634, 1.325177, 2.597736, 1, 1, 1, 1, 1,
3.258672, 0.8156626, 2.443798, 1, 1, 1, 1, 1,
3.297557, -1.06685, 2.737901, 1, 1, 1, 1, 1
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
var radius = 9.427553;
var distance = 33.11388;
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
mvMatrix.translate( 0.1198032, 0.3329674, -0.2617893 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11388);
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
