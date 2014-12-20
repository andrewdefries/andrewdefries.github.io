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
-3.592777, 0.01085, -1.392399, 1, 0, 0, 1,
-3.081886, -0.4601037, -0.2474341, 1, 0.007843138, 0, 1,
-2.947999, 1.097705, -1.150649, 1, 0.01176471, 0, 1,
-2.848212, 1.47747, 0.0663503, 1, 0.01960784, 0, 1,
-2.741482, -1.037207, -2.251781, 1, 0.02352941, 0, 1,
-2.67291, 0.5909664, -0.06715555, 1, 0.03137255, 0, 1,
-2.630985, -0.5531099, -2.20497, 1, 0.03529412, 0, 1,
-2.600597, -0.8449353, -1.702857, 1, 0.04313726, 0, 1,
-2.519062, -0.9673458, -2.050158, 1, 0.04705882, 0, 1,
-2.428818, -2.129274, -2.392872, 1, 0.05490196, 0, 1,
-2.370461, 0.5205627, -1.402667, 1, 0.05882353, 0, 1,
-2.347328, -0.9074529, -3.263267, 1, 0.06666667, 0, 1,
-2.337461, 0.271815, -0.8709896, 1, 0.07058824, 0, 1,
-2.30481, 1.108461, 0.5218049, 1, 0.07843138, 0, 1,
-2.301962, -0.01543694, -0.7580092, 1, 0.08235294, 0, 1,
-2.295363, -0.3943278, -3.014968, 1, 0.09019608, 0, 1,
-2.267678, 0.7421016, -1.762091, 1, 0.09411765, 0, 1,
-2.267173, -0.1107185, -2.528321, 1, 0.1019608, 0, 1,
-2.194388, 2.28319, -1.606535, 1, 0.1098039, 0, 1,
-2.149364, 0.2352115, 2.071053, 1, 0.1137255, 0, 1,
-2.123688, 0.08980279, -0.7917623, 1, 0.1215686, 0, 1,
-2.104816, 2.07948, -2.189067, 1, 0.1254902, 0, 1,
-2.063851, -0.2321877, -0.6611426, 1, 0.1333333, 0, 1,
-2.052881, 1.12659, -1.832676, 1, 0.1372549, 0, 1,
-2.019608, 1.328303, -0.4736889, 1, 0.145098, 0, 1,
-2.008435, -0.6949406, -1.593642, 1, 0.1490196, 0, 1,
-1.997651, 0.8250803, -2.890569, 1, 0.1568628, 0, 1,
-1.936718, 0.9307541, -2.144827, 1, 0.1607843, 0, 1,
-1.926003, 0.2886347, -1.702987, 1, 0.1686275, 0, 1,
-1.918995, 0.7188802, -2.116418, 1, 0.172549, 0, 1,
-1.909942, -0.698899, -2.640961, 1, 0.1803922, 0, 1,
-1.906581, 0.3074819, -2.320415, 1, 0.1843137, 0, 1,
-1.872077, 0.4530318, 1.486961, 1, 0.1921569, 0, 1,
-1.862548, -1.677315, -2.390429, 1, 0.1960784, 0, 1,
-1.861367, -0.108763, -0.07479742, 1, 0.2039216, 0, 1,
-1.85495, -0.3540844, -2.411221, 1, 0.2117647, 0, 1,
-1.805651, 0.09981902, -3.235348, 1, 0.2156863, 0, 1,
-1.755301, 1.4818, -0.7346133, 1, 0.2235294, 0, 1,
-1.73362, 0.4143223, -0.2518192, 1, 0.227451, 0, 1,
-1.726125, -0.513746, -2.181312, 1, 0.2352941, 0, 1,
-1.715551, 1.83221, 1.098106, 1, 0.2392157, 0, 1,
-1.712101, -0.06864512, -2.5389, 1, 0.2470588, 0, 1,
-1.701802, -0.7275136, -1.292852, 1, 0.2509804, 0, 1,
-1.697584, 0.6459633, -1.523418, 1, 0.2588235, 0, 1,
-1.695674, 0.443328, -0.09140474, 1, 0.2627451, 0, 1,
-1.680127, -0.0246476, -0.1095337, 1, 0.2705882, 0, 1,
-1.673834, -0.175664, -0.7188947, 1, 0.2745098, 0, 1,
-1.641659, -2.032907, -2.964794, 1, 0.282353, 0, 1,
-1.623224, 2.109731, -1.698851, 1, 0.2862745, 0, 1,
-1.617078, 0.5172524, -0.05377918, 1, 0.2941177, 0, 1,
-1.612652, 0.3756132, -1.558435, 1, 0.3019608, 0, 1,
-1.578161, 0.7499007, -2.592254, 1, 0.3058824, 0, 1,
-1.577214, -1.833586, -3.354037, 1, 0.3137255, 0, 1,
-1.572825, -1.196067, -0.7073597, 1, 0.3176471, 0, 1,
-1.572324, 0.623907, -0.8575984, 1, 0.3254902, 0, 1,
-1.57137, -0.3691956, -1.547556, 1, 0.3294118, 0, 1,
-1.568657, -0.4354394, -1.465846, 1, 0.3372549, 0, 1,
-1.565349, -0.3057145, -1.373926, 1, 0.3411765, 0, 1,
-1.556038, 0.1399841, -1.522982, 1, 0.3490196, 0, 1,
-1.547695, 0.7705601, -2.420343, 1, 0.3529412, 0, 1,
-1.535075, 1.276305, -2.232048, 1, 0.3607843, 0, 1,
-1.530901, 0.1025009, -0.7371922, 1, 0.3647059, 0, 1,
-1.52746, 0.9698442, -1.68449, 1, 0.372549, 0, 1,
-1.505992, 0.7413062, -2.705503, 1, 0.3764706, 0, 1,
-1.487761, -1.890563, -3.351699, 1, 0.3843137, 0, 1,
-1.477963, 1.200655, 0.8842213, 1, 0.3882353, 0, 1,
-1.477649, 0.5960519, 0.9026034, 1, 0.3960784, 0, 1,
-1.475762, -1.870165, -3.73769, 1, 0.4039216, 0, 1,
-1.468567, 0.901226, -0.6276528, 1, 0.4078431, 0, 1,
-1.467464, -0.1096747, -0.89923, 1, 0.4156863, 0, 1,
-1.467265, -1.104126, -1.465379, 1, 0.4196078, 0, 1,
-1.459842, 0.06048241, -0.6634871, 1, 0.427451, 0, 1,
-1.434672, 0.07107134, -3.159905, 1, 0.4313726, 0, 1,
-1.403889, -1.058684, -2.046091, 1, 0.4392157, 0, 1,
-1.400226, 0.9251757, -1.434213, 1, 0.4431373, 0, 1,
-1.389783, -0.7451153, -3.029962, 1, 0.4509804, 0, 1,
-1.37412, -0.213893, 0.1303835, 1, 0.454902, 0, 1,
-1.366063, -1.481599, -2.611493, 1, 0.4627451, 0, 1,
-1.364335, -1.477852, -3.467689, 1, 0.4666667, 0, 1,
-1.358081, -1.086774, -3.627763, 1, 0.4745098, 0, 1,
-1.349637, 1.888268, -0.8329073, 1, 0.4784314, 0, 1,
-1.341821, -0.6376899, -2.821602, 1, 0.4862745, 0, 1,
-1.336876, 0.1085364, -1.494344, 1, 0.4901961, 0, 1,
-1.330057, -0.1615433, -1.969841, 1, 0.4980392, 0, 1,
-1.327449, -1.651202, -1.62747, 1, 0.5058824, 0, 1,
-1.318679, -0.6257748, -3.660747, 1, 0.509804, 0, 1,
-1.317508, 0.9094012, -0.0250838, 1, 0.5176471, 0, 1,
-1.311709, -1.073273, -2.746901, 1, 0.5215687, 0, 1,
-1.305102, -1.122851, -1.758412, 1, 0.5294118, 0, 1,
-1.291184, 2.216176, -2.227059, 1, 0.5333334, 0, 1,
-1.284421, -0.7953548, -1.366691, 1, 0.5411765, 0, 1,
-1.283271, 0.6409566, -1.564556, 1, 0.5450981, 0, 1,
-1.28166, -0.1475761, -0.7832003, 1, 0.5529412, 0, 1,
-1.261307, 1.554855, 0.2625688, 1, 0.5568628, 0, 1,
-1.256343, -0.1479545, -3.215186, 1, 0.5647059, 0, 1,
-1.243114, -1.449277, -2.841524, 1, 0.5686275, 0, 1,
-1.240086, 0.3012204, -1.17171, 1, 0.5764706, 0, 1,
-1.236748, 0.5623024, -0.3798395, 1, 0.5803922, 0, 1,
-1.235231, 0.741661, -0.7235226, 1, 0.5882353, 0, 1,
-1.228633, 0.181377, -2.683432, 1, 0.5921569, 0, 1,
-1.22094, 0.6443734, -0.3299574, 1, 0.6, 0, 1,
-1.218291, 0.8568518, -1.403674, 1, 0.6078432, 0, 1,
-1.213484, 1.330574, -0.4672786, 1, 0.6117647, 0, 1,
-1.207887, 1.243202, 0.119983, 1, 0.6196079, 0, 1,
-1.206342, 0.8734598, -0.2308594, 1, 0.6235294, 0, 1,
-1.205048, 0.3867699, -0.7708965, 1, 0.6313726, 0, 1,
-1.191478, 0.4566692, -1.16164, 1, 0.6352941, 0, 1,
-1.181093, -1.504407, -3.81708, 1, 0.6431373, 0, 1,
-1.178999, 0.2473658, -0.7648295, 1, 0.6470588, 0, 1,
-1.167757, -0.574505, -1.605131, 1, 0.654902, 0, 1,
-1.167438, 0.6452441, -0.1846034, 1, 0.6588235, 0, 1,
-1.159405, 0.75107, -1.446474, 1, 0.6666667, 0, 1,
-1.157073, -0.7237431, -2.594738, 1, 0.6705883, 0, 1,
-1.15619, 1.138329, -0.7222725, 1, 0.6784314, 0, 1,
-1.155954, -0.244861, -3.732749, 1, 0.682353, 0, 1,
-1.152695, -2.796241, -4.168192, 1, 0.6901961, 0, 1,
-1.141573, 0.06776976, -3.829373, 1, 0.6941177, 0, 1,
-1.141103, -0.3338028, -1.521212, 1, 0.7019608, 0, 1,
-1.1352, 0.6357731, -1.839565, 1, 0.7098039, 0, 1,
-1.130945, -0.2066513, -3.633827, 1, 0.7137255, 0, 1,
-1.129645, 1.124693, 0.3101558, 1, 0.7215686, 0, 1,
-1.122297, -1.433468, -1.594289, 1, 0.7254902, 0, 1,
-1.12183, -0.9873562, -3.306078, 1, 0.7333333, 0, 1,
-1.120163, -1.094585, -4.363151, 1, 0.7372549, 0, 1,
-1.117946, 0.6884524, -0.1276281, 1, 0.7450981, 0, 1,
-1.114312, -0.6200987, -1.328134, 1, 0.7490196, 0, 1,
-1.111529, 1.828412, 0.8837603, 1, 0.7568628, 0, 1,
-1.109458, 0.327127, -0.6138523, 1, 0.7607843, 0, 1,
-1.107827, -2.065965, -1.935115, 1, 0.7686275, 0, 1,
-1.097209, 0.712373, -2.365956, 1, 0.772549, 0, 1,
-1.09194, -0.243222, -1.254142, 1, 0.7803922, 0, 1,
-1.075048, -0.6836877, -3.9332, 1, 0.7843137, 0, 1,
-1.073937, -1.153829, -1.666816, 1, 0.7921569, 0, 1,
-1.06608, -0.7331198, -1.721836, 1, 0.7960784, 0, 1,
-1.060561, 0.4724197, 0.02443455, 1, 0.8039216, 0, 1,
-1.057416, -0.9046417, -2.889297, 1, 0.8117647, 0, 1,
-1.055229, 0.3206277, 0.3660388, 1, 0.8156863, 0, 1,
-1.047943, 0.2089228, -1.485574, 1, 0.8235294, 0, 1,
-1.039378, -0.6546574, -3.640354, 1, 0.827451, 0, 1,
-1.025017, 0.09259287, -0.4644431, 1, 0.8352941, 0, 1,
-1.02069, -0.6252289, -3.026998, 1, 0.8392157, 0, 1,
-1.019454, -0.7668923, -3.387864, 1, 0.8470588, 0, 1,
-1.018241, 0.4797468, -1.241205, 1, 0.8509804, 0, 1,
-1.015251, -0.4720031, -4.146872, 1, 0.8588235, 0, 1,
-1.000389, 0.5214725, -1.891357, 1, 0.8627451, 0, 1,
-1.000235, -0.7085077, -1.12927, 1, 0.8705882, 0, 1,
-0.9948882, 2.180581, 0.3640825, 1, 0.8745098, 0, 1,
-0.9815937, -1.094796, -2.131659, 1, 0.8823529, 0, 1,
-0.9778885, -0.7188485, 0.110873, 1, 0.8862745, 0, 1,
-0.9772661, 0.6858342, -1.590561, 1, 0.8941177, 0, 1,
-0.9721712, -0.2256646, -0.7938102, 1, 0.8980392, 0, 1,
-0.969769, 0.7614249, 0.1772068, 1, 0.9058824, 0, 1,
-0.9601251, 1.578834, -1.068658, 1, 0.9137255, 0, 1,
-0.9523357, -0.7319864, -2.860401, 1, 0.9176471, 0, 1,
-0.9513512, -0.2981176, -0.3497369, 1, 0.9254902, 0, 1,
-0.9511111, -1.299774, -2.083638, 1, 0.9294118, 0, 1,
-0.9445718, -0.4121206, -1.701443, 1, 0.9372549, 0, 1,
-0.9424472, -1.345291, -0.2224986, 1, 0.9411765, 0, 1,
-0.941834, -1.35634, -3.031331, 1, 0.9490196, 0, 1,
-0.9366634, -0.1344291, -1.837566, 1, 0.9529412, 0, 1,
-0.9304758, 0.9287503, 0.3025169, 1, 0.9607843, 0, 1,
-0.9260281, -0.6787461, -2.673486, 1, 0.9647059, 0, 1,
-0.925756, -1.63501, -2.886491, 1, 0.972549, 0, 1,
-0.9243084, 0.4202807, 0.3360416, 1, 0.9764706, 0, 1,
-0.9164639, -0.2819028, -0.6783032, 1, 0.9843137, 0, 1,
-0.9063776, -0.4744231, -2.506236, 1, 0.9882353, 0, 1,
-0.9011894, -2.426057, -2.600962, 1, 0.9960784, 0, 1,
-0.901092, -1.524332, -1.733356, 0.9960784, 1, 0, 1,
-0.8996301, -0.8951421, -1.498408, 0.9921569, 1, 0, 1,
-0.8971063, -0.2631189, -2.951687, 0.9843137, 1, 0, 1,
-0.8924562, -2.050652, -2.648925, 0.9803922, 1, 0, 1,
-0.890576, 0.5818409, -1.14292, 0.972549, 1, 0, 1,
-0.8901182, 0.410188, 0.1064183, 0.9686275, 1, 0, 1,
-0.887647, -1.643773, -3.492677, 0.9607843, 1, 0, 1,
-0.8782091, 0.3995593, -0.167388, 0.9568627, 1, 0, 1,
-0.8774244, 0.3751686, -0.7177981, 0.9490196, 1, 0, 1,
-0.8761007, 0.1870405, -1.331047, 0.945098, 1, 0, 1,
-0.8742169, 1.76132, 1.36591, 0.9372549, 1, 0, 1,
-0.8707463, -0.3543734, -1.70503, 0.9333333, 1, 0, 1,
-0.8580413, 0.9254413, -0.4307663, 0.9254902, 1, 0, 1,
-0.8551515, -0.2261577, -2.278955, 0.9215686, 1, 0, 1,
-0.8549178, -0.3954726, -2.711086, 0.9137255, 1, 0, 1,
-0.8510668, 2.074053, -1.100444, 0.9098039, 1, 0, 1,
-0.8387259, 1.341738, -1.211345, 0.9019608, 1, 0, 1,
-0.8315064, -1.377123, -1.832584, 0.8941177, 1, 0, 1,
-0.8314435, 1.461273, -0.3996963, 0.8901961, 1, 0, 1,
-0.8295096, -0.06148331, -0.6177298, 0.8823529, 1, 0, 1,
-0.8285844, 0.6847884, -1.956617, 0.8784314, 1, 0, 1,
-0.8271809, 0.1381918, -1.313084, 0.8705882, 1, 0, 1,
-0.8222307, -1.928465, -4.731243, 0.8666667, 1, 0, 1,
-0.8170832, -1.20049, -4.392844, 0.8588235, 1, 0, 1,
-0.8168675, 2.058694, 0.4771773, 0.854902, 1, 0, 1,
-0.8125321, 0.6852117, 0.2981365, 0.8470588, 1, 0, 1,
-0.8118165, -0.5539521, -0.91839, 0.8431373, 1, 0, 1,
-0.8116316, -1.000589, -2.38475, 0.8352941, 1, 0, 1,
-0.8094955, -0.9782076, -2.794425, 0.8313726, 1, 0, 1,
-0.8002408, -0.4985714, -2.504969, 0.8235294, 1, 0, 1,
-0.7989787, 1.475632, -0.4477866, 0.8196079, 1, 0, 1,
-0.7978526, 0.05784369, -0.6499361, 0.8117647, 1, 0, 1,
-0.7924546, 0.1236561, -2.267317, 0.8078431, 1, 0, 1,
-0.7787269, 1.392712, -2.731668, 0.8, 1, 0, 1,
-0.7774882, -2.089555, -3.518322, 0.7921569, 1, 0, 1,
-0.7718732, 0.4248115, -0.8130313, 0.7882353, 1, 0, 1,
-0.7701049, 0.2615178, -0.7141098, 0.7803922, 1, 0, 1,
-0.7691103, -0.6363981, -1.249738, 0.7764706, 1, 0, 1,
-0.7599165, -1.438741, -2.40423, 0.7686275, 1, 0, 1,
-0.7571461, -0.5593697, -2.40507, 0.7647059, 1, 0, 1,
-0.7562624, -1.162237, -4.651843, 0.7568628, 1, 0, 1,
-0.7463826, -0.620324, -2.537388, 0.7529412, 1, 0, 1,
-0.7462924, -0.2315326, -1.809204, 0.7450981, 1, 0, 1,
-0.7448468, -1.540872, -2.60683, 0.7411765, 1, 0, 1,
-0.7425521, 0.4656942, -3.160608, 0.7333333, 1, 0, 1,
-0.7425137, -0.06857143, -2.770346, 0.7294118, 1, 0, 1,
-0.7415994, 1.347494, -0.3978385, 0.7215686, 1, 0, 1,
-0.7355576, -0.6544991, -3.331429, 0.7176471, 1, 0, 1,
-0.7277575, -0.1514462, -2.345901, 0.7098039, 1, 0, 1,
-0.7277024, -2.097242, -2.698582, 0.7058824, 1, 0, 1,
-0.7216682, -0.06504289, -1.232027, 0.6980392, 1, 0, 1,
-0.7202092, 0.4678026, -1.816671, 0.6901961, 1, 0, 1,
-0.7191666, 1.617595, 0.5951836, 0.6862745, 1, 0, 1,
-0.7184085, 0.4402269, -2.344259, 0.6784314, 1, 0, 1,
-0.7065987, -1.029357, -1.697493, 0.6745098, 1, 0, 1,
-0.7029631, -0.7542789, -2.474613, 0.6666667, 1, 0, 1,
-0.6946986, 0.5116748, -2.321077, 0.6627451, 1, 0, 1,
-0.6920713, -0.5631054, -1.685037, 0.654902, 1, 0, 1,
-0.6858971, -0.2255334, -1.574098, 0.6509804, 1, 0, 1,
-0.6856081, -0.7446477, -4.015141, 0.6431373, 1, 0, 1,
-0.6815477, -0.2815078, -2.22573, 0.6392157, 1, 0, 1,
-0.6812908, 2.43744, 1.362193, 0.6313726, 1, 0, 1,
-0.6759104, 0.4833198, -1.606651, 0.627451, 1, 0, 1,
-0.6733229, 0.9617026, -0.1133584, 0.6196079, 1, 0, 1,
-0.6720738, 1.438399, -2.140208, 0.6156863, 1, 0, 1,
-0.6720718, -1.358807, -3.578368, 0.6078432, 1, 0, 1,
-0.671114, 1.503337, -1.98266, 0.6039216, 1, 0, 1,
-0.6695831, 0.009526527, -0.7242282, 0.5960785, 1, 0, 1,
-0.6659636, -1.434109, -2.835147, 0.5882353, 1, 0, 1,
-0.657018, 0.1507665, -0.7615526, 0.5843138, 1, 0, 1,
-0.6528568, 0.2778187, -0.2966874, 0.5764706, 1, 0, 1,
-0.6513461, -0.6835035, -4.157249, 0.572549, 1, 0, 1,
-0.6411406, -1.277154, -2.921597, 0.5647059, 1, 0, 1,
-0.6246951, -0.5687723, -2.98509, 0.5607843, 1, 0, 1,
-0.6246612, 1.099315, -0.114494, 0.5529412, 1, 0, 1,
-0.6222982, -1.743743, -4.029144, 0.5490196, 1, 0, 1,
-0.6207329, -0.1572935, -1.756287, 0.5411765, 1, 0, 1,
-0.6174777, -0.5509295, -2.033469, 0.5372549, 1, 0, 1,
-0.61474, -0.6028147, -2.744138, 0.5294118, 1, 0, 1,
-0.613497, -0.3190486, -2.090299, 0.5254902, 1, 0, 1,
-0.6115968, 0.5414277, -0.1101433, 0.5176471, 1, 0, 1,
-0.6085343, -0.6560088, -2.143163, 0.5137255, 1, 0, 1,
-0.6079228, -0.6160717, -2.717991, 0.5058824, 1, 0, 1,
-0.6072195, 0.5511869, -1.818037, 0.5019608, 1, 0, 1,
-0.607035, -0.05249153, -3.191157, 0.4941176, 1, 0, 1,
-0.6045415, -0.664019, -3.249682, 0.4862745, 1, 0, 1,
-0.6031025, 0.3775142, -1.882282, 0.4823529, 1, 0, 1,
-0.601615, -1.923586, -2.726992, 0.4745098, 1, 0, 1,
-0.5838336, -0.2407702, -1.932806, 0.4705882, 1, 0, 1,
-0.5812757, 0.6202815, -0.8654992, 0.4627451, 1, 0, 1,
-0.5767979, 1.767957, -0.2071684, 0.4588235, 1, 0, 1,
-0.5739461, 0.3986603, -1.91154, 0.4509804, 1, 0, 1,
-0.5735508, -0.876631, -1.500697, 0.4470588, 1, 0, 1,
-0.5720806, 0.5688634, -1.255122, 0.4392157, 1, 0, 1,
-0.5703182, -0.1384777, -2.367102, 0.4352941, 1, 0, 1,
-0.5692312, -0.4086046, -3.197286, 0.427451, 1, 0, 1,
-0.5658305, -1.512175, -1.915647, 0.4235294, 1, 0, 1,
-0.5621157, -0.1597527, -1.890401, 0.4156863, 1, 0, 1,
-0.5613847, -0.3322515, -0.2453325, 0.4117647, 1, 0, 1,
-0.5561866, 0.9606394, -0.8828506, 0.4039216, 1, 0, 1,
-0.55499, 0.008423714, -1.668485, 0.3960784, 1, 0, 1,
-0.5533741, -0.5944441, -2.322369, 0.3921569, 1, 0, 1,
-0.5484684, -1.096336, -3.20385, 0.3843137, 1, 0, 1,
-0.5475191, 0.04685354, -1.886141, 0.3803922, 1, 0, 1,
-0.5444045, -2.449748, -1.280517, 0.372549, 1, 0, 1,
-0.5423821, -1.088236, -1.038412, 0.3686275, 1, 0, 1,
-0.5421709, -1.890859, -1.774593, 0.3607843, 1, 0, 1,
-0.5378552, -1.084609, -2.383863, 0.3568628, 1, 0, 1,
-0.5364711, -0.4963859, -0.9707871, 0.3490196, 1, 0, 1,
-0.5359471, 0.4658236, 0.7495431, 0.345098, 1, 0, 1,
-0.5343649, 2.456629, -0.6901695, 0.3372549, 1, 0, 1,
-0.534261, -0.4798592, -2.486563, 0.3333333, 1, 0, 1,
-0.5317919, 0.4062164, -0.4696847, 0.3254902, 1, 0, 1,
-0.5312902, 0.7817455, -1.726917, 0.3215686, 1, 0, 1,
-0.5268558, -0.2547804, -2.427442, 0.3137255, 1, 0, 1,
-0.521703, -0.4405488, -1.051649, 0.3098039, 1, 0, 1,
-0.5207373, 0.6641278, -1.408143, 0.3019608, 1, 0, 1,
-0.5122, 0.3128137, -1.646989, 0.2941177, 1, 0, 1,
-0.511957, -0.91281, -3.202549, 0.2901961, 1, 0, 1,
-0.5077667, 1.720241, 0.4142357, 0.282353, 1, 0, 1,
-0.5076088, 1.076237, -0.2237256, 0.2784314, 1, 0, 1,
-0.5058419, 0.5713348, -0.4321008, 0.2705882, 1, 0, 1,
-0.5048825, -0.8335646, -3.6419, 0.2666667, 1, 0, 1,
-0.5038886, -0.4435747, -3.095702, 0.2588235, 1, 0, 1,
-0.5029629, -0.1353834, -1.245097, 0.254902, 1, 0, 1,
-0.5012901, -0.6694729, -2.105924, 0.2470588, 1, 0, 1,
-0.5001599, -1.68009, -3.073035, 0.2431373, 1, 0, 1,
-0.4985191, 0.3717863, -0.4321752, 0.2352941, 1, 0, 1,
-0.4977058, -0.5190495, -4.531168, 0.2313726, 1, 0, 1,
-0.4965885, 0.3646796, -0.2685074, 0.2235294, 1, 0, 1,
-0.4938709, 1.806793, -0.6728967, 0.2196078, 1, 0, 1,
-0.4934076, 0.7124229, -1.009517, 0.2117647, 1, 0, 1,
-0.4897505, -0.7456822, -1.34557, 0.2078431, 1, 0, 1,
-0.4808152, -0.3767905, -2.255309, 0.2, 1, 0, 1,
-0.4767825, 1.479421, 1.091168, 0.1921569, 1, 0, 1,
-0.4736336, -0.2366243, -1.655723, 0.1882353, 1, 0, 1,
-0.470362, -0.09931012, -2.004786, 0.1803922, 1, 0, 1,
-0.4703056, -0.6265611, -2.279542, 0.1764706, 1, 0, 1,
-0.4677486, 2.357415, 0.2921123, 0.1686275, 1, 0, 1,
-0.463369, 1.04982, -0.1873638, 0.1647059, 1, 0, 1,
-0.4624719, 0.7766334, 0.9326499, 0.1568628, 1, 0, 1,
-0.4609966, 0.4003695, -0.4737377, 0.1529412, 1, 0, 1,
-0.4609302, -0.335318, -1.70291, 0.145098, 1, 0, 1,
-0.4580273, -1.488082, -1.138525, 0.1411765, 1, 0, 1,
-0.4541719, -0.4674372, -3.327665, 0.1333333, 1, 0, 1,
-0.4540688, -0.3888901, -1.345901, 0.1294118, 1, 0, 1,
-0.4514521, 0.5723823, 0.9729196, 0.1215686, 1, 0, 1,
-0.4508159, -1.330625, -2.349891, 0.1176471, 1, 0, 1,
-0.4473889, 1.149149, -0.6006079, 0.1098039, 1, 0, 1,
-0.4463444, -1.437632, -2.922658, 0.1058824, 1, 0, 1,
-0.4454481, 0.3483286, -1.188152, 0.09803922, 1, 0, 1,
-0.4452539, -1.221762, -4.973595, 0.09019608, 1, 0, 1,
-0.4375399, -0.5511816, -2.856735, 0.08627451, 1, 0, 1,
-0.4355674, -0.3396901, -3.530441, 0.07843138, 1, 0, 1,
-0.4324945, 0.2509608, -1.015537, 0.07450981, 1, 0, 1,
-0.4257399, -0.4168015, -2.77094, 0.06666667, 1, 0, 1,
-0.425006, -0.2045026, -2.258423, 0.0627451, 1, 0, 1,
-0.4229911, 0.7956591, -1.021089, 0.05490196, 1, 0, 1,
-0.4226639, -0.5059382, -2.449478, 0.05098039, 1, 0, 1,
-0.4220769, -0.1017025, -0.1641144, 0.04313726, 1, 0, 1,
-0.4108656, 0.5107142, -0.1566728, 0.03921569, 1, 0, 1,
-0.402502, -2.581378, -2.666895, 0.03137255, 1, 0, 1,
-0.4024111, 2.064516, -1.98233, 0.02745098, 1, 0, 1,
-0.3973185, 1.635053, -2.538802, 0.01960784, 1, 0, 1,
-0.3952082, 1.189571, 0.4889392, 0.01568628, 1, 0, 1,
-0.3897443, -2.178594, -0.5795609, 0.007843138, 1, 0, 1,
-0.3885482, 1.434309, 0.4815492, 0.003921569, 1, 0, 1,
-0.3875856, -1.189503, -4.050448, 0, 1, 0.003921569, 1,
-0.3874708, 0.03387741, -2.428609, 0, 1, 0.01176471, 1,
-0.3842675, -1.171003, -3.465773, 0, 1, 0.01568628, 1,
-0.3841928, -1.097482, -3.211348, 0, 1, 0.02352941, 1,
-0.3828842, 1.594347, 0.2413553, 0, 1, 0.02745098, 1,
-0.3826534, -0.8288776, -3.689552, 0, 1, 0.03529412, 1,
-0.3824919, -1.145118, -3.064288, 0, 1, 0.03921569, 1,
-0.3757277, 0.3687724, -1.867298, 0, 1, 0.04705882, 1,
-0.3750768, 0.5520072, -0.334432, 0, 1, 0.05098039, 1,
-0.3738242, -0.9707516, -2.145323, 0, 1, 0.05882353, 1,
-0.3730694, -1.573194, -2.879164, 0, 1, 0.0627451, 1,
-0.3704526, -1.985974, -3.040326, 0, 1, 0.07058824, 1,
-0.3666608, -1.157606, -3.932096, 0, 1, 0.07450981, 1,
-0.3662772, -0.4464082, -3.561771, 0, 1, 0.08235294, 1,
-0.3627549, -0.8852813, -2.809693, 0, 1, 0.08627451, 1,
-0.3573766, -0.5053999, -0.9126984, 0, 1, 0.09411765, 1,
-0.3572353, 1.84228, -0.6904498, 0, 1, 0.1019608, 1,
-0.3544485, -0.6275885, -4.54566, 0, 1, 0.1058824, 1,
-0.3533871, -0.1938063, 0.6475071, 0, 1, 0.1137255, 1,
-0.3521095, -0.9351006, -3.403085, 0, 1, 0.1176471, 1,
-0.3516777, 0.03083399, -0.06032202, 0, 1, 0.1254902, 1,
-0.3513875, -1.0134, -2.690774, 0, 1, 0.1294118, 1,
-0.3423924, -0.2326379, -1.115726, 0, 1, 0.1372549, 1,
-0.3418986, 0.3955587, 0.003894422, 0, 1, 0.1411765, 1,
-0.3418314, -0.1246892, -1.804532, 0, 1, 0.1490196, 1,
-0.3408117, -0.3201215, -2.769152, 0, 1, 0.1529412, 1,
-0.3372968, 0.5445626, -1.355968, 0, 1, 0.1607843, 1,
-0.3323759, 0.6839569, 1.13208, 0, 1, 0.1647059, 1,
-0.3317113, -0.09417705, -2.453558, 0, 1, 0.172549, 1,
-0.3261152, -0.4395355, -2.479482, 0, 1, 0.1764706, 1,
-0.3259221, -1.971844, -2.517712, 0, 1, 0.1843137, 1,
-0.3243461, 0.02225724, -1.292342, 0, 1, 0.1882353, 1,
-0.3241222, -1.509227, -4.627227, 0, 1, 0.1960784, 1,
-0.3234909, -1.81417, -4.353881, 0, 1, 0.2039216, 1,
-0.3229728, -0.8529222, -2.415641, 0, 1, 0.2078431, 1,
-0.3209439, -0.6655518, -2.627936, 0, 1, 0.2156863, 1,
-0.3194076, -0.07929583, -3.977059, 0, 1, 0.2196078, 1,
-0.3177165, -0.8497738, -2.494104, 0, 1, 0.227451, 1,
-0.3173715, -0.4337107, -1.198366, 0, 1, 0.2313726, 1,
-0.3137783, -0.6884505, -4.082746, 0, 1, 0.2392157, 1,
-0.310924, 2.608672, 0.6203144, 0, 1, 0.2431373, 1,
-0.3073719, -0.055616, -1.261962, 0, 1, 0.2509804, 1,
-0.3060921, 0.299625, -1.285998, 0, 1, 0.254902, 1,
-0.305343, 0.2879508, -0.3138817, 0, 1, 0.2627451, 1,
-0.3050852, -0.447022, -2.544819, 0, 1, 0.2666667, 1,
-0.3047389, 0.09739448, 0.1060749, 0, 1, 0.2745098, 1,
-0.3044401, 1.712024, -1.444315, 0, 1, 0.2784314, 1,
-0.3038179, -0.4692478, -1.365066, 0, 1, 0.2862745, 1,
-0.3025358, -0.06083744, -1.539441, 0, 1, 0.2901961, 1,
-0.3015236, 0.08291893, -2.477927, 0, 1, 0.2980392, 1,
-0.3000104, -0.4600271, -0.7042406, 0, 1, 0.3058824, 1,
-0.2974655, -2.385309, -1.697658, 0, 1, 0.3098039, 1,
-0.2966708, -0.3946756, -3.263097, 0, 1, 0.3176471, 1,
-0.2961609, -0.1432857, -1.850224, 0, 1, 0.3215686, 1,
-0.2955968, -0.1272403, -2.457428, 0, 1, 0.3294118, 1,
-0.2927348, -0.6086414, -2.646533, 0, 1, 0.3333333, 1,
-0.2910204, 0.5008543, 0.02663831, 0, 1, 0.3411765, 1,
-0.2902268, 2.606977, 0.5435963, 0, 1, 0.345098, 1,
-0.2894559, -1.212972, -3.987695, 0, 1, 0.3529412, 1,
-0.2884086, -0.2810675, -2.956829, 0, 1, 0.3568628, 1,
-0.2872567, 0.07670141, -1.16921, 0, 1, 0.3647059, 1,
-0.2859381, -0.9609169, -3.821095, 0, 1, 0.3686275, 1,
-0.2845169, 0.1564726, -0.5530145, 0, 1, 0.3764706, 1,
-0.281647, 0.006170712, -1.872874, 0, 1, 0.3803922, 1,
-0.276724, 0.1698232, -0.7676185, 0, 1, 0.3882353, 1,
-0.275191, 1.312135, -0.2953905, 0, 1, 0.3921569, 1,
-0.2750868, 1.142782, -1.63393, 0, 1, 0.4, 1,
-0.2748537, 1.398544, 0.003282739, 0, 1, 0.4078431, 1,
-0.2718832, -1.22226, -2.225181, 0, 1, 0.4117647, 1,
-0.2713626, -0.09167185, -0.7027756, 0, 1, 0.4196078, 1,
-0.2713606, -1.091222, -1.982107, 0, 1, 0.4235294, 1,
-0.2699417, -1.046347, -2.865665, 0, 1, 0.4313726, 1,
-0.269854, 0.4542785, -0.5631741, 0, 1, 0.4352941, 1,
-0.2671555, 1.547939, -1.335533, 0, 1, 0.4431373, 1,
-0.2653769, -0.8477615, -2.916621, 0, 1, 0.4470588, 1,
-0.2650578, 0.3664061, -0.1473545, 0, 1, 0.454902, 1,
-0.259156, 1.005324, -0.1696053, 0, 1, 0.4588235, 1,
-0.2517207, 1.544419, -0.5248598, 0, 1, 0.4666667, 1,
-0.2410295, -0.1925568, -2.716544, 0, 1, 0.4705882, 1,
-0.2401435, 1.097408, 0.7725453, 0, 1, 0.4784314, 1,
-0.2328097, -0.6911609, -3.245077, 0, 1, 0.4823529, 1,
-0.2323836, 1.392604, 0.2927059, 0, 1, 0.4901961, 1,
-0.2285313, 0.9615626, -0.1499358, 0, 1, 0.4941176, 1,
-0.2232836, -0.1500099, -1.724402, 0, 1, 0.5019608, 1,
-0.2221579, -0.3557551, -4.666009, 0, 1, 0.509804, 1,
-0.2215229, 0.3296041, 0.9249651, 0, 1, 0.5137255, 1,
-0.2185762, -0.6677236, -1.579004, 0, 1, 0.5215687, 1,
-0.2171907, 1.488465, -1.975936, 0, 1, 0.5254902, 1,
-0.2103294, 0.9263361, -0.1027891, 0, 1, 0.5333334, 1,
-0.2065622, 0.6327624, -0.819482, 0, 1, 0.5372549, 1,
-0.2057729, 1.366439, -0.7468877, 0, 1, 0.5450981, 1,
-0.2007264, -1.239948, -2.525091, 0, 1, 0.5490196, 1,
-0.1997348, 1.340848, 0.6918797, 0, 1, 0.5568628, 1,
-0.1997194, 0.1656055, -2.108589, 0, 1, 0.5607843, 1,
-0.199322, -0.5370577, -3.480521, 0, 1, 0.5686275, 1,
-0.1940842, -1.064124, -3.160311, 0, 1, 0.572549, 1,
-0.1918786, 0.6212243, -0.1058389, 0, 1, 0.5803922, 1,
-0.1892795, -1.071679, -1.393037, 0, 1, 0.5843138, 1,
-0.1892772, -0.8471779, -4.585538, 0, 1, 0.5921569, 1,
-0.1882103, -1.369351, -2.465126, 0, 1, 0.5960785, 1,
-0.1804975, 1.616061, -2.19302, 0, 1, 0.6039216, 1,
-0.1794773, -1.013649, -4.449489, 0, 1, 0.6117647, 1,
-0.1787328, 0.1687772, -0.7755201, 0, 1, 0.6156863, 1,
-0.17726, 0.1527546, 0.3787088, 0, 1, 0.6235294, 1,
-0.175632, 0.4944037, 0.9686391, 0, 1, 0.627451, 1,
-0.1749029, 0.4741341, 1.534184, 0, 1, 0.6352941, 1,
-0.1693336, 1.081101, -0.3091561, 0, 1, 0.6392157, 1,
-0.1690039, 0.004214937, -0.7413785, 0, 1, 0.6470588, 1,
-0.1675028, -1.248033, -1.539183, 0, 1, 0.6509804, 1,
-0.1674676, 0.8158338, 0.288866, 0, 1, 0.6588235, 1,
-0.164321, 0.918507, -1.150035, 0, 1, 0.6627451, 1,
-0.1636187, 0.4377025, 1.008331, 0, 1, 0.6705883, 1,
-0.1619097, -0.6016487, -0.5002908, 0, 1, 0.6745098, 1,
-0.1609623, 0.3260421, 0.09127454, 0, 1, 0.682353, 1,
-0.160306, 0.8803819, 1.188622, 0, 1, 0.6862745, 1,
-0.1589283, 0.6736374, -0.4230614, 0, 1, 0.6941177, 1,
-0.1503626, 0.3825759, -1.456069, 0, 1, 0.7019608, 1,
-0.1496786, 1.081897, -0.4018185, 0, 1, 0.7058824, 1,
-0.1487244, 0.1509777, -1.303226, 0, 1, 0.7137255, 1,
-0.1481891, -0.6564497, -2.785185, 0, 1, 0.7176471, 1,
-0.1430671, 0.1303222, 0.2814106, 0, 1, 0.7254902, 1,
-0.1380354, -0.3676942, -4.723203, 0, 1, 0.7294118, 1,
-0.1371304, -1.594936, -4.551757, 0, 1, 0.7372549, 1,
-0.1284756, -0.5573409, -3.722895, 0, 1, 0.7411765, 1,
-0.127405, 0.4223142, 1.389459, 0, 1, 0.7490196, 1,
-0.125978, -0.2927367, -3.556947, 0, 1, 0.7529412, 1,
-0.1256667, 0.7806332, 0.0865283, 0, 1, 0.7607843, 1,
-0.1236622, -0.1617109, -3.556517, 0, 1, 0.7647059, 1,
-0.1172583, -1.496718, -2.812676, 0, 1, 0.772549, 1,
-0.1156221, 0.792483, 3.062434, 0, 1, 0.7764706, 1,
-0.1155465, -0.2023741, -2.17742, 0, 1, 0.7843137, 1,
-0.1127825, 1.649189, -0.7949172, 0, 1, 0.7882353, 1,
-0.1106217, 1.151336, -0.6187202, 0, 1, 0.7960784, 1,
-0.1094856, -0.1894787, -2.1416, 0, 1, 0.8039216, 1,
-0.09522353, -0.3274727, -3.84195, 0, 1, 0.8078431, 1,
-0.09345828, 0.3939765, -0.3467835, 0, 1, 0.8156863, 1,
-0.09005141, 0.08041351, -1.912352, 0, 1, 0.8196079, 1,
-0.08538312, 1.01144, 1.486391, 0, 1, 0.827451, 1,
-0.08536722, 1.621286, 1.201318, 0, 1, 0.8313726, 1,
-0.08209534, -1.722168, -4.136478, 0, 1, 0.8392157, 1,
-0.0798554, -0.9348631, -1.81643, 0, 1, 0.8431373, 1,
-0.07438117, 0.08027693, 1.201056, 0, 1, 0.8509804, 1,
-0.07412694, -2.001979, -3.360521, 0, 1, 0.854902, 1,
-0.06606556, -0.3393236, -3.360807, 0, 1, 0.8627451, 1,
-0.06094138, 0.8927995, -2.139594, 0, 1, 0.8666667, 1,
-0.05373704, 0.7823126, -0.189772, 0, 1, 0.8745098, 1,
-0.04890749, 0.6558685, -0.5273052, 0, 1, 0.8784314, 1,
-0.04881215, -0.6177878, -3.154852, 0, 1, 0.8862745, 1,
-0.04872504, -1.352482, -3.25137, 0, 1, 0.8901961, 1,
-0.04657942, -1.218606, -3.136282, 0, 1, 0.8980392, 1,
-0.04340449, -0.6734843, -3.796861, 0, 1, 0.9058824, 1,
-0.04043509, -1.331865, -2.780049, 0, 1, 0.9098039, 1,
-0.03735311, -0.5199219, -3.245536, 0, 1, 0.9176471, 1,
-0.03500422, -0.8001615, -3.997663, 0, 1, 0.9215686, 1,
-0.02622122, -0.1578245, -3.236534, 0, 1, 0.9294118, 1,
-0.02467963, -0.937381, -3.603596, 0, 1, 0.9333333, 1,
-0.02232598, -0.009141265, -2.069582, 0, 1, 0.9411765, 1,
-0.02191183, -0.09950152, -4.032311, 0, 1, 0.945098, 1,
-0.01857647, -0.7987348, -4.102717, 0, 1, 0.9529412, 1,
-0.0171271, 0.4876608, -0.5794898, 0, 1, 0.9568627, 1,
-0.01472063, -0.1539238, -3.823922, 0, 1, 0.9647059, 1,
-0.01433991, -0.6704941, -3.259887, 0, 1, 0.9686275, 1,
-0.01416943, 0.8976586, 2.030006, 0, 1, 0.9764706, 1,
-0.0110851, -0.1147022, -2.365114, 0, 1, 0.9803922, 1,
-0.01044966, -0.03779143, -3.39835, 0, 1, 0.9882353, 1,
-0.00865415, -0.5845066, -3.415872, 0, 1, 0.9921569, 1,
-0.008598416, 0.609344, -2.829118, 0, 1, 1, 1,
-0.006712229, -1.526238, -4.791466, 0, 0.9921569, 1, 1,
-0.001318685, -0.1592433, -3.595162, 0, 0.9882353, 1, 1,
0.004171396, 0.9953475, -1.916142, 0, 0.9803922, 1, 1,
0.006227795, 0.2531803, -0.1928607, 0, 0.9764706, 1, 1,
0.006825882, 0.8407049, 1.268422, 0, 0.9686275, 1, 1,
0.00961779, -2.080258, 2.013365, 0, 0.9647059, 1, 1,
0.009641944, -0.5320813, 3.652795, 0, 0.9568627, 1, 1,
0.01173299, -1.097453, 3.31532, 0, 0.9529412, 1, 1,
0.01287113, -0.5167619, 3.148125, 0, 0.945098, 1, 1,
0.01584217, -0.8698333, 2.815763, 0, 0.9411765, 1, 1,
0.01712169, -0.7801853, 3.302471, 0, 0.9333333, 1, 1,
0.01907079, 0.3110213, 1.388298, 0, 0.9294118, 1, 1,
0.02021423, -0.0888997, 2.836495, 0, 0.9215686, 1, 1,
0.02096502, 0.7184845, 0.4907051, 0, 0.9176471, 1, 1,
0.02187385, -0.9884028, 4.04863, 0, 0.9098039, 1, 1,
0.02356154, 0.570314, 1.034028, 0, 0.9058824, 1, 1,
0.02386111, 0.4188495, -0.7597325, 0, 0.8980392, 1, 1,
0.02595165, -0.2043694, 3.640897, 0, 0.8901961, 1, 1,
0.02685741, -0.7335201, 2.273536, 0, 0.8862745, 1, 1,
0.02742002, 0.7727514, -0.4890612, 0, 0.8784314, 1, 1,
0.02897921, -0.002675144, 1.205361, 0, 0.8745098, 1, 1,
0.03017612, -0.4490254, 3.895009, 0, 0.8666667, 1, 1,
0.03144172, 0.7664608, -0.1435768, 0, 0.8627451, 1, 1,
0.03151845, 1.476385, -0.4073258, 0, 0.854902, 1, 1,
0.03703557, 1.594064, 0.2213884, 0, 0.8509804, 1, 1,
0.04334174, 0.9672263, 0.9446844, 0, 0.8431373, 1, 1,
0.05153174, 1.216552, -0.3144256, 0, 0.8392157, 1, 1,
0.05368297, -0.3352508, 2.336137, 0, 0.8313726, 1, 1,
0.05390786, -0.4819683, 4.31087, 0, 0.827451, 1, 1,
0.05479199, -0.4240488, 3.84894, 0, 0.8196079, 1, 1,
0.05676004, 1.782914, 0.4019267, 0, 0.8156863, 1, 1,
0.05944133, 0.3142476, 0.06330936, 0, 0.8078431, 1, 1,
0.06295653, 0.7581968, -0.1449827, 0, 0.8039216, 1, 1,
0.0694159, -0.6249909, 2.179317, 0, 0.7960784, 1, 1,
0.07022972, 0.005449072, 1.556522, 0, 0.7882353, 1, 1,
0.0739297, -0.04559878, 2.935559, 0, 0.7843137, 1, 1,
0.07868521, -0.3569895, 2.846305, 0, 0.7764706, 1, 1,
0.08144893, -0.9394104, 3.926365, 0, 0.772549, 1, 1,
0.08428244, -1.945992, 3.254761, 0, 0.7647059, 1, 1,
0.08530243, 1.391583, -0.5057254, 0, 0.7607843, 1, 1,
0.08976878, -0.1348187, 2.580327, 0, 0.7529412, 1, 1,
0.09004837, -0.7091464, 1.557833, 0, 0.7490196, 1, 1,
0.09630236, 2.141527, 0.4506864, 0, 0.7411765, 1, 1,
0.0969869, 0.7280036, 0.8990615, 0, 0.7372549, 1, 1,
0.09860972, -0.8507836, 3.538607, 0, 0.7294118, 1, 1,
0.1007628, -1.911537, 3.073783, 0, 0.7254902, 1, 1,
0.1039863, -1.581534, 2.878507, 0, 0.7176471, 1, 1,
0.1063832, 0.3491199, 0.8393816, 0, 0.7137255, 1, 1,
0.1067336, 0.3031032, 2.190567, 0, 0.7058824, 1, 1,
0.1082846, 0.4733533, 0.9396361, 0, 0.6980392, 1, 1,
0.1084096, -1.215254, 1.592786, 0, 0.6941177, 1, 1,
0.1104854, 0.4475483, -1.27112, 0, 0.6862745, 1, 1,
0.1180875, -0.4937879, 3.697582, 0, 0.682353, 1, 1,
0.1221568, 0.7088468, 0.1885053, 0, 0.6745098, 1, 1,
0.1231612, 0.9799286, 0.113706, 0, 0.6705883, 1, 1,
0.1232069, 1.2208, -0.01919363, 0, 0.6627451, 1, 1,
0.1279429, 1.404521, -0.2839464, 0, 0.6588235, 1, 1,
0.1384257, -1.499816, 3.438002, 0, 0.6509804, 1, 1,
0.1434567, -1.121406, 2.786661, 0, 0.6470588, 1, 1,
0.1459384, -0.2381121, 4.321396, 0, 0.6392157, 1, 1,
0.1468243, -1.153586, 3.563768, 0, 0.6352941, 1, 1,
0.1534379, -2.247609, 1.717617, 0, 0.627451, 1, 1,
0.1537884, 0.4809503, 1.017346, 0, 0.6235294, 1, 1,
0.1546904, -1.613003, 3.435463, 0, 0.6156863, 1, 1,
0.1560373, 0.8820322, 0.1377052, 0, 0.6117647, 1, 1,
0.1572695, 0.3483751, 0.5469897, 0, 0.6039216, 1, 1,
0.1580346, -1.613014, 4.006631, 0, 0.5960785, 1, 1,
0.1602652, 0.5167837, -0.8863997, 0, 0.5921569, 1, 1,
0.1629664, 0.6196305, -1.043602, 0, 0.5843138, 1, 1,
0.1667378, 0.3082931, 2.381433, 0, 0.5803922, 1, 1,
0.1692105, 0.9379398, 0.7339447, 0, 0.572549, 1, 1,
0.1702033, -0.6213959, 3.253174, 0, 0.5686275, 1, 1,
0.1721237, 0.2276022, 2.76684, 0, 0.5607843, 1, 1,
0.1791176, 1.138917, -0.129032, 0, 0.5568628, 1, 1,
0.1818669, 0.4108559, -0.4998072, 0, 0.5490196, 1, 1,
0.1854916, 0.8806149, 0.3895863, 0, 0.5450981, 1, 1,
0.1960428, 1.028763, 0.5521035, 0, 0.5372549, 1, 1,
0.1962606, -0.1983048, 2.010509, 0, 0.5333334, 1, 1,
0.2002859, 0.5671583, 0.3118009, 0, 0.5254902, 1, 1,
0.2004082, -0.5063339, 2.585637, 0, 0.5215687, 1, 1,
0.2010452, -0.2178372, 2.145845, 0, 0.5137255, 1, 1,
0.2012954, 0.03278177, 0.8394505, 0, 0.509804, 1, 1,
0.2035919, 0.2239863, 0.8692875, 0, 0.5019608, 1, 1,
0.2091656, 0.8164839, -0.06126708, 0, 0.4941176, 1, 1,
0.2184613, 0.08899076, -0.1847572, 0, 0.4901961, 1, 1,
0.2246704, -0.6444231, 1.1086, 0, 0.4823529, 1, 1,
0.2262007, -0.3020602, 2.689681, 0, 0.4784314, 1, 1,
0.2346861, 0.1176921, 1.643894, 0, 0.4705882, 1, 1,
0.24166, 0.9120427, -1.918738, 0, 0.4666667, 1, 1,
0.2431938, 1.457031, -0.2884569, 0, 0.4588235, 1, 1,
0.2462082, 0.08217709, 1.703489, 0, 0.454902, 1, 1,
0.2476606, -1.314215, 4.859993, 0, 0.4470588, 1, 1,
0.2484608, -0.4226429, 1.467129, 0, 0.4431373, 1, 1,
0.2502057, 0.1017589, 0.4585404, 0, 0.4352941, 1, 1,
0.2524064, -1.215657, 1.864975, 0, 0.4313726, 1, 1,
0.2529287, 0.3466942, -0.2316744, 0, 0.4235294, 1, 1,
0.2575837, 0.05397452, 2.535063, 0, 0.4196078, 1, 1,
0.257651, -0.7487954, 2.071602, 0, 0.4117647, 1, 1,
0.2629246, -0.3050129, 2.454471, 0, 0.4078431, 1, 1,
0.2662191, -0.6622784, 2.821859, 0, 0.4, 1, 1,
0.2694419, -0.1985697, 2.057912, 0, 0.3921569, 1, 1,
0.2718052, 0.132799, 1.093663, 0, 0.3882353, 1, 1,
0.2795303, -0.2899238, 2.58581, 0, 0.3803922, 1, 1,
0.2797333, -0.2729693, 3.573439, 0, 0.3764706, 1, 1,
0.2817853, 2.798617, 1.522307, 0, 0.3686275, 1, 1,
0.288192, -0.2006554, 2.228073, 0, 0.3647059, 1, 1,
0.2908989, 0.9926372, 0.4773747, 0, 0.3568628, 1, 1,
0.2911841, 1.490806, -0.1584198, 0, 0.3529412, 1, 1,
0.2929828, 0.04937054, 3.738203, 0, 0.345098, 1, 1,
0.2945808, 0.05480496, 2.602533, 0, 0.3411765, 1, 1,
0.2959066, 0.3134848, 0.4498776, 0, 0.3333333, 1, 1,
0.2969193, 0.1505014, 1.769698, 0, 0.3294118, 1, 1,
0.2976688, 0.1763358, 2.031242, 0, 0.3215686, 1, 1,
0.2993515, 1.474539, -1.414068, 0, 0.3176471, 1, 1,
0.3078302, 1.272385, 0.136379, 0, 0.3098039, 1, 1,
0.3083897, -1.859235, 2.471367, 0, 0.3058824, 1, 1,
0.3100901, 0.3879149, 0.1590838, 0, 0.2980392, 1, 1,
0.3151273, -0.7375118, 3.054699, 0, 0.2901961, 1, 1,
0.3183427, 0.9855489, 1.252885, 0, 0.2862745, 1, 1,
0.318982, 0.4858639, 0.9188875, 0, 0.2784314, 1, 1,
0.3245775, -0.08115456, 2.356965, 0, 0.2745098, 1, 1,
0.3258337, 0.8211016, -0.5920455, 0, 0.2666667, 1, 1,
0.3279434, -0.9290828, 3.437396, 0, 0.2627451, 1, 1,
0.3330933, -0.0418807, 1.094787, 0, 0.254902, 1, 1,
0.3354952, 0.8108988, 2.066758, 0, 0.2509804, 1, 1,
0.3376671, -0.4583787, 2.466032, 0, 0.2431373, 1, 1,
0.3390987, 0.1883166, 1.613493, 0, 0.2392157, 1, 1,
0.3408474, 0.7574061, 0.1751788, 0, 0.2313726, 1, 1,
0.3451491, -1.736192, 3.00493, 0, 0.227451, 1, 1,
0.3479843, 0.3689792, 2.026002, 0, 0.2196078, 1, 1,
0.3496424, 0.6937705, -0.285219, 0, 0.2156863, 1, 1,
0.3554935, 1.199226, -0.2295459, 0, 0.2078431, 1, 1,
0.3556779, -1.186515, 3.841519, 0, 0.2039216, 1, 1,
0.3558451, 0.7532822, -0.5898582, 0, 0.1960784, 1, 1,
0.3597429, -0.6948168, 0.9240654, 0, 0.1882353, 1, 1,
0.3598256, -0.2376161, 1.950149, 0, 0.1843137, 1, 1,
0.361526, 1.227971, 0.6930776, 0, 0.1764706, 1, 1,
0.3623427, 0.008043774, 1.165738, 0, 0.172549, 1, 1,
0.3633034, 0.5381202, 1.596553, 0, 0.1647059, 1, 1,
0.3641739, -0.9836321, 2.17685, 0, 0.1607843, 1, 1,
0.3654478, -1.406438, 3.933689, 0, 0.1529412, 1, 1,
0.3675851, 0.7431392, 2.024834, 0, 0.1490196, 1, 1,
0.3692901, -0.3676556, 1.262923, 0, 0.1411765, 1, 1,
0.3714213, 0.3398242, 1.649503, 0, 0.1372549, 1, 1,
0.3717958, 1.313066, -1.150427, 0, 0.1294118, 1, 1,
0.377656, 0.7320094, -0.419676, 0, 0.1254902, 1, 1,
0.3780835, -1.880164, 2.873821, 0, 0.1176471, 1, 1,
0.3785361, 1.426723, 1.21075, 0, 0.1137255, 1, 1,
0.3807615, -0.8510514, 4.123775, 0, 0.1058824, 1, 1,
0.3846409, 0.8121131, 1.447022, 0, 0.09803922, 1, 1,
0.3866596, -0.3901537, 2.192657, 0, 0.09411765, 1, 1,
0.389182, 0.1991882, 0.7526401, 0, 0.08627451, 1, 1,
0.3918185, -1.041898, 2.380721, 0, 0.08235294, 1, 1,
0.3920473, -0.6283154, 5.086712, 0, 0.07450981, 1, 1,
0.3940025, 0.2063925, 2.983191, 0, 0.07058824, 1, 1,
0.3961726, 0.1560088, 2.424118, 0, 0.0627451, 1, 1,
0.402555, 1.36321, -1.022032, 0, 0.05882353, 1, 1,
0.4043844, -1.616892, 2.544719, 0, 0.05098039, 1, 1,
0.4066759, -0.8671327, 2.738142, 0, 0.04705882, 1, 1,
0.4092998, 0.879113, 0.6397171, 0, 0.03921569, 1, 1,
0.4095977, 0.445716, 0.2713791, 0, 0.03529412, 1, 1,
0.4167762, -0.4958597, 1.706285, 0, 0.02745098, 1, 1,
0.416862, -0.1326734, 0.9176034, 0, 0.02352941, 1, 1,
0.4170856, -1.72302, 1.965082, 0, 0.01568628, 1, 1,
0.418478, 0.188287, 1.655411, 0, 0.01176471, 1, 1,
0.4193453, -0.6665432, 3.304443, 0, 0.003921569, 1, 1,
0.422316, -0.9421116, 3.599936, 0.003921569, 0, 1, 1,
0.42333, -1.111226, 3.066017, 0.007843138, 0, 1, 1,
0.4242934, 0.7705282, 1.026033, 0.01568628, 0, 1, 1,
0.4247356, 2.379285, -1.126651, 0.01960784, 0, 1, 1,
0.4258671, -0.3873917, 2.030119, 0.02745098, 0, 1, 1,
0.4287724, -1.582571, 1.775086, 0.03137255, 0, 1, 1,
0.4295336, -0.002632677, -0.2232323, 0.03921569, 0, 1, 1,
0.4324228, 0.8941455, 0.1052748, 0.04313726, 0, 1, 1,
0.4371168, 0.763051, 0.5700626, 0.05098039, 0, 1, 1,
0.4458809, -1.28828, 1.666951, 0.05490196, 0, 1, 1,
0.4461465, 1.363803, 0.9790043, 0.0627451, 0, 1, 1,
0.4550971, -1.437101, 2.915145, 0.06666667, 0, 1, 1,
0.457444, 1.352391, 1.056388, 0.07450981, 0, 1, 1,
0.4579154, 1.572936, 1.482747, 0.07843138, 0, 1, 1,
0.4612249, -0.6898685, 2.352174, 0.08627451, 0, 1, 1,
0.4618593, -0.5412206, 3.002177, 0.09019608, 0, 1, 1,
0.4647432, -0.5523954, 3.317335, 0.09803922, 0, 1, 1,
0.4704387, 0.8826047, 1.984817, 0.1058824, 0, 1, 1,
0.4711836, -1.324551, 3.256271, 0.1098039, 0, 1, 1,
0.4752667, -1.310577, 1.692146, 0.1176471, 0, 1, 1,
0.475971, 0.07961664, 2.512904, 0.1215686, 0, 1, 1,
0.4777273, -0.5623869, 2.41308, 0.1294118, 0, 1, 1,
0.4789924, -0.2020938, 1.6819, 0.1333333, 0, 1, 1,
0.4808849, 1.312909, 1.035428, 0.1411765, 0, 1, 1,
0.4837674, -1.637959, 0.6077229, 0.145098, 0, 1, 1,
0.4860645, -1.673329, 2.873832, 0.1529412, 0, 1, 1,
0.4904156, 0.1413876, 2.508934, 0.1568628, 0, 1, 1,
0.4909151, -0.5879387, 2.922123, 0.1647059, 0, 1, 1,
0.4936489, -0.01409762, -0.1506921, 0.1686275, 0, 1, 1,
0.4960432, -0.1447646, 0.8527203, 0.1764706, 0, 1, 1,
0.496768, -1.560185, 4.426539, 0.1803922, 0, 1, 1,
0.4992695, 2.912859, 0.4253061, 0.1882353, 0, 1, 1,
0.5076405, -1.762052, 3.514867, 0.1921569, 0, 1, 1,
0.5092118, 1.550116, -1.348061, 0.2, 0, 1, 1,
0.5105265, 0.6054135, 1.44508, 0.2078431, 0, 1, 1,
0.5112504, -0.5627367, 3.209468, 0.2117647, 0, 1, 1,
0.5134857, -0.5742678, 1.340272, 0.2196078, 0, 1, 1,
0.5137585, -1.282163, 2.935169, 0.2235294, 0, 1, 1,
0.5183747, -0.3241831, 1.134079, 0.2313726, 0, 1, 1,
0.5188901, 0.5173863, 0.861128, 0.2352941, 0, 1, 1,
0.5193166, -0.1350368, 2.541978, 0.2431373, 0, 1, 1,
0.5194302, -0.8589314, 2.126679, 0.2470588, 0, 1, 1,
0.5204281, -0.4002169, 2.314309, 0.254902, 0, 1, 1,
0.5207268, 0.9357588, 0.03254261, 0.2588235, 0, 1, 1,
0.5217669, -1.131538, 4.243886, 0.2666667, 0, 1, 1,
0.5246709, 0.09347685, 0.5924637, 0.2705882, 0, 1, 1,
0.5263638, -0.622203, 0.6490665, 0.2784314, 0, 1, 1,
0.5282323, 1.254789, 0.01094098, 0.282353, 0, 1, 1,
0.5406099, -0.381935, 1.389863, 0.2901961, 0, 1, 1,
0.5412506, -0.3531638, 2.658913, 0.2941177, 0, 1, 1,
0.5417449, -0.3244718, 2.599372, 0.3019608, 0, 1, 1,
0.5433397, 0.9249809, 0.7526389, 0.3098039, 0, 1, 1,
0.5471636, 0.7353723, -0.2777787, 0.3137255, 0, 1, 1,
0.5506471, 1.325945, -0.7175526, 0.3215686, 0, 1, 1,
0.5578349, 0.7838308, 1.45916, 0.3254902, 0, 1, 1,
0.5614455, -0.3198622, 0.342018, 0.3333333, 0, 1, 1,
0.5684003, -0.605148, 5.054814, 0.3372549, 0, 1, 1,
0.5695482, 0.2687815, -0.2563452, 0.345098, 0, 1, 1,
0.5712366, -0.06900569, 0.8204584, 0.3490196, 0, 1, 1,
0.5787017, -0.003466614, 2.813063, 0.3568628, 0, 1, 1,
0.5870795, -1.139891, 1.619897, 0.3607843, 0, 1, 1,
0.5935563, -0.4205758, 1.397804, 0.3686275, 0, 1, 1,
0.6040908, -1.032323, 4.620345, 0.372549, 0, 1, 1,
0.6064907, -0.358571, 1.36248, 0.3803922, 0, 1, 1,
0.6068117, -0.2248141, 2.711105, 0.3843137, 0, 1, 1,
0.6086653, -0.4259378, 2.125523, 0.3921569, 0, 1, 1,
0.6118322, -0.06084385, 0.8843334, 0.3960784, 0, 1, 1,
0.6134639, -0.1135306, 2.976192, 0.4039216, 0, 1, 1,
0.6189673, 0.5001417, 2.508767, 0.4117647, 0, 1, 1,
0.6190934, -1.142542, 3.707616, 0.4156863, 0, 1, 1,
0.6219926, -1.554806, 3.548055, 0.4235294, 0, 1, 1,
0.622027, -0.05093572, 1.813071, 0.427451, 0, 1, 1,
0.6225992, 0.7731153, 1.986757, 0.4352941, 0, 1, 1,
0.6226134, -0.734521, 3.595038, 0.4392157, 0, 1, 1,
0.627836, -1.031183, 3.198185, 0.4470588, 0, 1, 1,
0.6312273, -0.1107598, 0.3095275, 0.4509804, 0, 1, 1,
0.641936, 1.688769, 0.2236157, 0.4588235, 0, 1, 1,
0.6434911, 0.9832362, 2.610168, 0.4627451, 0, 1, 1,
0.6455605, 0.6111996, 0.2524238, 0.4705882, 0, 1, 1,
0.6458838, -1.3043, 3.191614, 0.4745098, 0, 1, 1,
0.649645, -1.241941, 5.428167, 0.4823529, 0, 1, 1,
0.6515001, 0.5959261, 2.684541, 0.4862745, 0, 1, 1,
0.6523503, -0.2027679, 3.401466, 0.4941176, 0, 1, 1,
0.6554495, 0.4957987, 1.693675, 0.5019608, 0, 1, 1,
0.6563811, -0.6968884, 1.622499, 0.5058824, 0, 1, 1,
0.6571289, -0.09793707, 2.280002, 0.5137255, 0, 1, 1,
0.6575889, -0.05928797, 2.543923, 0.5176471, 0, 1, 1,
0.6621599, -2.244488, 2.580989, 0.5254902, 0, 1, 1,
0.6632208, 0.1883403, 1.829226, 0.5294118, 0, 1, 1,
0.6715246, 1.697487, -0.8037345, 0.5372549, 0, 1, 1,
0.6717143, -1.145614, 1.48254, 0.5411765, 0, 1, 1,
0.6732572, -0.4084922, 3.205762, 0.5490196, 0, 1, 1,
0.6737193, -0.4133103, 2.196425, 0.5529412, 0, 1, 1,
0.6814248, 0.5571036, 0.1184001, 0.5607843, 0, 1, 1,
0.6848783, -0.4811201, 1.150495, 0.5647059, 0, 1, 1,
0.6872516, 2.071704, 0.6187371, 0.572549, 0, 1, 1,
0.6924313, 0.260989, 1.327939, 0.5764706, 0, 1, 1,
0.6942859, -0.8907927, 2.661406, 0.5843138, 0, 1, 1,
0.6965689, 1.186292, -0.1145758, 0.5882353, 0, 1, 1,
0.6990258, 1.156988, 0.7910039, 0.5960785, 0, 1, 1,
0.7012895, 0.461369, 1.772856, 0.6039216, 0, 1, 1,
0.7037366, 0.4102379, 2.531113, 0.6078432, 0, 1, 1,
0.7086739, -0.3782637, 3.286385, 0.6156863, 0, 1, 1,
0.7092654, -0.6537895, 0.8739964, 0.6196079, 0, 1, 1,
0.7100815, -0.4413669, 2.490806, 0.627451, 0, 1, 1,
0.7152308, -1.040681, 2.20919, 0.6313726, 0, 1, 1,
0.7157642, 0.06564252, 0.3254598, 0.6392157, 0, 1, 1,
0.7157901, -0.2718191, 2.304324, 0.6431373, 0, 1, 1,
0.7192515, -1.057931, 3.264489, 0.6509804, 0, 1, 1,
0.7194993, 0.1803136, 1.817445, 0.654902, 0, 1, 1,
0.723012, 1.309283, 1.751148, 0.6627451, 0, 1, 1,
0.7309795, -1.196952, 4.318568, 0.6666667, 0, 1, 1,
0.7349119, 0.543517, 1.647558, 0.6745098, 0, 1, 1,
0.7419674, -0.2872391, 2.093853, 0.6784314, 0, 1, 1,
0.7442016, 0.305747, 1.319763, 0.6862745, 0, 1, 1,
0.7456296, 0.7227386, 1.534422, 0.6901961, 0, 1, 1,
0.7487218, 0.04623696, 1.196233, 0.6980392, 0, 1, 1,
0.7505789, 0.2279806, 1.073599, 0.7058824, 0, 1, 1,
0.7596637, -0.6657417, 2.454054, 0.7098039, 0, 1, 1,
0.7611914, -0.2624608, 2.012079, 0.7176471, 0, 1, 1,
0.7620969, 2.522735, 1.775448, 0.7215686, 0, 1, 1,
0.7635733, 1.441208, 0.3763117, 0.7294118, 0, 1, 1,
0.7711219, -0.4988688, 1.754095, 0.7333333, 0, 1, 1,
0.7732058, -0.9990064, 3.336059, 0.7411765, 0, 1, 1,
0.7749683, -1.506209, 1.918966, 0.7450981, 0, 1, 1,
0.7763993, -0.2209071, 0.7191327, 0.7529412, 0, 1, 1,
0.7793149, -0.2705608, 2.855514, 0.7568628, 0, 1, 1,
0.7825325, -0.04322937, 2.30181, 0.7647059, 0, 1, 1,
0.7835553, -1.560817, 2.542492, 0.7686275, 0, 1, 1,
0.7849228, -0.8530324, 2.722297, 0.7764706, 0, 1, 1,
0.787281, -0.5344238, 1.002471, 0.7803922, 0, 1, 1,
0.7873323, -0.374211, 3.871073, 0.7882353, 0, 1, 1,
0.7892448, 0.2276907, 2.824693, 0.7921569, 0, 1, 1,
0.789576, 0.8591976, 1.590803, 0.8, 0, 1, 1,
0.7930709, 0.6323679, 3.11364, 0.8078431, 0, 1, 1,
0.8003405, 0.7729392, 0.1597625, 0.8117647, 0, 1, 1,
0.8051822, -0.1876488, -0.0009821312, 0.8196079, 0, 1, 1,
0.8104708, 1.807943, 0.5157458, 0.8235294, 0, 1, 1,
0.8163654, -0.8868036, 1.227143, 0.8313726, 0, 1, 1,
0.8181123, 0.5408004, 1.483565, 0.8352941, 0, 1, 1,
0.818362, -0.6672078, 2.884312, 0.8431373, 0, 1, 1,
0.8184286, 0.2545143, 0.2839598, 0.8470588, 0, 1, 1,
0.8204954, 0.9999154, 1.075639, 0.854902, 0, 1, 1,
0.8239459, -0.4015616, 2.755495, 0.8588235, 0, 1, 1,
0.8243361, 1.852339, -0.5671659, 0.8666667, 0, 1, 1,
0.829421, 2.175646, -0.2450504, 0.8705882, 0, 1, 1,
0.8320852, 1.221746, -0.08633836, 0.8784314, 0, 1, 1,
0.8321768, 0.2964143, 2.634291, 0.8823529, 0, 1, 1,
0.834435, -0.5813346, 2.380951, 0.8901961, 0, 1, 1,
0.8422931, -0.2042008, 1.214948, 0.8941177, 0, 1, 1,
0.8435489, 1.170036, -0.2339461, 0.9019608, 0, 1, 1,
0.8472276, 0.4731318, 1.187898, 0.9098039, 0, 1, 1,
0.84727, -0.9638532, 2.572422, 0.9137255, 0, 1, 1,
0.8474185, -0.2532524, 0.7434892, 0.9215686, 0, 1, 1,
0.848268, 1.204704, 2.621814, 0.9254902, 0, 1, 1,
0.8500102, -0.2132423, 1.74888, 0.9333333, 0, 1, 1,
0.8513609, -0.2594536, -0.780947, 0.9372549, 0, 1, 1,
0.8513952, 1.167579, -0.2681693, 0.945098, 0, 1, 1,
0.8562729, -0.3797325, 4.181663, 0.9490196, 0, 1, 1,
0.8595645, -1.932775, 2.938014, 0.9568627, 0, 1, 1,
0.8614735, 0.8781344, -1.365395, 0.9607843, 0, 1, 1,
0.8615624, -1.459043, 1.764685, 0.9686275, 0, 1, 1,
0.8621784, 0.8358981, 2.786422, 0.972549, 0, 1, 1,
0.8647696, -1.177745, 1.920877, 0.9803922, 0, 1, 1,
0.869706, -0.07781428, 1.040374, 0.9843137, 0, 1, 1,
0.8785711, 1.286149, -1.204303, 0.9921569, 0, 1, 1,
0.8797743, 0.7180164, 1.203009, 0.9960784, 0, 1, 1,
0.8807079, 0.1418058, 0.3893772, 1, 0, 0.9960784, 1,
0.8825678, 0.1679594, 0.8080559, 1, 0, 0.9882353, 1,
0.8839889, 0.5065947, 1.322681, 1, 0, 0.9843137, 1,
0.8847203, -0.1230631, -0.5501719, 1, 0, 0.9764706, 1,
0.886765, 1.809578, 1.916936, 1, 0, 0.972549, 1,
0.8869663, 0.2417341, 0.5331644, 1, 0, 0.9647059, 1,
0.8872605, 0.4492157, 1.648914, 1, 0, 0.9607843, 1,
0.9004607, -1.62072, 2.306681, 1, 0, 0.9529412, 1,
0.9028996, 0.6585689, 1.764648, 1, 0, 0.9490196, 1,
0.9068585, 0.03667385, 2.871269, 1, 0, 0.9411765, 1,
0.9162104, -1.1371, 1.839225, 1, 0, 0.9372549, 1,
0.9178352, -1.221233, 2.382983, 1, 0, 0.9294118, 1,
0.9203458, 0.7907233, 0.07400186, 1, 0, 0.9254902, 1,
0.9213428, -0.3734596, 2.84081, 1, 0, 0.9176471, 1,
0.9223702, -0.8079675, 3.756173, 1, 0, 0.9137255, 1,
0.9233837, -0.8204194, 0.5496649, 1, 0, 0.9058824, 1,
0.9234617, -0.3040111, 0.6942422, 1, 0, 0.9019608, 1,
0.9257981, 1.318369, 1.787148, 1, 0, 0.8941177, 1,
0.9289268, 0.6148692, 1.672302, 1, 0, 0.8862745, 1,
0.9294356, 0.9981868, -0.5190248, 1, 0, 0.8823529, 1,
0.9467669, 0.7410268, 1.865992, 1, 0, 0.8745098, 1,
0.9497402, -0.3971252, 0.8189214, 1, 0, 0.8705882, 1,
0.9638391, 0.651823, 2.030137, 1, 0, 0.8627451, 1,
0.9754627, 0.8713927, -0.004523245, 1, 0, 0.8588235, 1,
0.9827855, 1.23076, 2.166958, 1, 0, 0.8509804, 1,
0.986309, 0.5181735, -0.3886957, 1, 0, 0.8470588, 1,
0.9902675, -0.8772051, 2.441091, 1, 0, 0.8392157, 1,
0.9944164, 1.048616, 0.1989589, 1, 0, 0.8352941, 1,
1.004615, 1.117214, 1.230676, 1, 0, 0.827451, 1,
1.010701, 0.6553532, 0.5920205, 1, 0, 0.8235294, 1,
1.010756, -1.96818, 3.455101, 1, 0, 0.8156863, 1,
1.011648, -0.5571735, 3.002568, 1, 0, 0.8117647, 1,
1.021917, 1.039389, 0.6867494, 1, 0, 0.8039216, 1,
1.026145, -0.9048525, 2.284249, 1, 0, 0.7960784, 1,
1.031558, -1.165696, 3.520145, 1, 0, 0.7921569, 1,
1.039464, 2.596244, 0.7572165, 1, 0, 0.7843137, 1,
1.04563, 1.625302, -0.7707091, 1, 0, 0.7803922, 1,
1.049152, 1.71409, -0.03099668, 1, 0, 0.772549, 1,
1.052765, -0.9343441, 3.253099, 1, 0, 0.7686275, 1,
1.060961, -0.4798739, 1.376988, 1, 0, 0.7607843, 1,
1.070302, 1.070454, -0.1552548, 1, 0, 0.7568628, 1,
1.070359, 0.728403, 0.9714068, 1, 0, 0.7490196, 1,
1.074819, -0.2717756, 2.786571, 1, 0, 0.7450981, 1,
1.076319, 0.5219715, 0.9881092, 1, 0, 0.7372549, 1,
1.078147, -1.162313, 3.387172, 1, 0, 0.7333333, 1,
1.07841, -0.7956435, 0.9698968, 1, 0, 0.7254902, 1,
1.086138, 1.74688, 1.437132, 1, 0, 0.7215686, 1,
1.101336, 0.8047206, -0.712292, 1, 0, 0.7137255, 1,
1.104363, -1.229434, 3.984835, 1, 0, 0.7098039, 1,
1.111658, 0.8955806, 1.741982, 1, 0, 0.7019608, 1,
1.119462, 0.3852298, 2.4153, 1, 0, 0.6941177, 1,
1.123021, 0.672135, 0.2806561, 1, 0, 0.6901961, 1,
1.127766, -0.9866495, 0.7197422, 1, 0, 0.682353, 1,
1.132654, 1.010116, 1.853995, 1, 0, 0.6784314, 1,
1.134624, -0.2307529, 0.7218255, 1, 0, 0.6705883, 1,
1.147289, -0.1648646, 3.454789, 1, 0, 0.6666667, 1,
1.148022, -0.4065465, 3.992181, 1, 0, 0.6588235, 1,
1.150616, 1.099476, 0.6839281, 1, 0, 0.654902, 1,
1.167391, 0.5144261, 1.58677, 1, 0, 0.6470588, 1,
1.170356, 0.1510396, 0.9082331, 1, 0, 0.6431373, 1,
1.170792, 0.846813, 2.049781, 1, 0, 0.6352941, 1,
1.180483, -0.5380726, 2.246952, 1, 0, 0.6313726, 1,
1.192085, -0.1840029, 1.301965, 1, 0, 0.6235294, 1,
1.194976, -2.880018, 5.106921, 1, 0, 0.6196079, 1,
1.20938, -2.146301, 2.472044, 1, 0, 0.6117647, 1,
1.21982, 0.9413333, 3.555116, 1, 0, 0.6078432, 1,
1.232762, 0.07447511, 1.89333, 1, 0, 0.6, 1,
1.243902, 0.7982118, 1.587396, 1, 0, 0.5921569, 1,
1.249626, 0.3118648, 0.9554868, 1, 0, 0.5882353, 1,
1.252194, 2.170357, 1.688423, 1, 0, 0.5803922, 1,
1.254258, 1.090648, 0.5006239, 1, 0, 0.5764706, 1,
1.263928, 0.1360883, 0.7148268, 1, 0, 0.5686275, 1,
1.268906, 0.9163801, -0.6832932, 1, 0, 0.5647059, 1,
1.270073, -0.2568267, 2.577955, 1, 0, 0.5568628, 1,
1.270601, 0.124892, -0.03272469, 1, 0, 0.5529412, 1,
1.272038, 0.4032215, 2.341444, 1, 0, 0.5450981, 1,
1.274585, -1.158075, 2.988536, 1, 0, 0.5411765, 1,
1.284877, 1.326233, 1.594774, 1, 0, 0.5333334, 1,
1.286228, -0.4048235, 1.212392, 1, 0, 0.5294118, 1,
1.289404, -0.3816441, 3.631642, 1, 0, 0.5215687, 1,
1.308914, 0.01563978, -0.1518938, 1, 0, 0.5176471, 1,
1.315247, -0.2534779, 2.310418, 1, 0, 0.509804, 1,
1.319131, -0.6467226, 2.825643, 1, 0, 0.5058824, 1,
1.34808, 0.2045861, 2.66775, 1, 0, 0.4980392, 1,
1.349406, -1.656686, 1.297867, 1, 0, 0.4901961, 1,
1.350861, 0.5954213, -0.7097421, 1, 0, 0.4862745, 1,
1.35516, -0.7091529, 0.1127964, 1, 0, 0.4784314, 1,
1.365121, 0.2019872, 1.157854, 1, 0, 0.4745098, 1,
1.375833, -0.6795712, 1.622574, 1, 0, 0.4666667, 1,
1.382536, -0.1971979, 1.257465, 1, 0, 0.4627451, 1,
1.384964, 1.360414, 1.818861, 1, 0, 0.454902, 1,
1.411132, -0.4420833, 1.852631, 1, 0, 0.4509804, 1,
1.416131, -0.9718061, 0.8814594, 1, 0, 0.4431373, 1,
1.417702, 0.4795326, 2.805401, 1, 0, 0.4392157, 1,
1.418903, -0.3067674, 1.425154, 1, 0, 0.4313726, 1,
1.434313, -0.4250474, -0.707268, 1, 0, 0.427451, 1,
1.437154, 0.7764091, 1.291853, 1, 0, 0.4196078, 1,
1.441566, 0.4385929, 0.652685, 1, 0, 0.4156863, 1,
1.467687, 0.2507319, 0.2015159, 1, 0, 0.4078431, 1,
1.468279, 1.285401, 0.07976544, 1, 0, 0.4039216, 1,
1.479177, -0.9227963, 3.3453, 1, 0, 0.3960784, 1,
1.484195, 0.4322543, 1.467906, 1, 0, 0.3882353, 1,
1.492445, 0.2190806, 2.499156, 1, 0, 0.3843137, 1,
1.504395, 0.2686396, 2.385919, 1, 0, 0.3764706, 1,
1.506021, 0.8581535, -0.09064185, 1, 0, 0.372549, 1,
1.509212, -0.5514469, 2.144794, 1, 0, 0.3647059, 1,
1.509843, 2.333161, -0.1875924, 1, 0, 0.3607843, 1,
1.514983, -0.168647, 1.867455, 1, 0, 0.3529412, 1,
1.519967, -1.612985, 2.292091, 1, 0, 0.3490196, 1,
1.535827, 1.591727, 0.1480069, 1, 0, 0.3411765, 1,
1.549725, -1.088675, 1.44709, 1, 0, 0.3372549, 1,
1.558996, 0.9198308, 1.648202, 1, 0, 0.3294118, 1,
1.561033, -1.271035, 1.578474, 1, 0, 0.3254902, 1,
1.567163, -0.1910706, 2.186236, 1, 0, 0.3176471, 1,
1.591649, 1.302387, -0.2404882, 1, 0, 0.3137255, 1,
1.60085, 0.8513641, 2.531747, 1, 0, 0.3058824, 1,
1.636871, 0.4777849, -1.047842, 1, 0, 0.2980392, 1,
1.643885, -0.8718513, 1.714869, 1, 0, 0.2941177, 1,
1.671554, 0.7853439, 0.814424, 1, 0, 0.2862745, 1,
1.682173, -2.061824, 2.506819, 1, 0, 0.282353, 1,
1.691642, 0.6613719, 2.497572, 1, 0, 0.2745098, 1,
1.703492, 0.4113754, 2.19419, 1, 0, 0.2705882, 1,
1.707363, 0.251199, 1.392174, 1, 0, 0.2627451, 1,
1.732776, 2.824795, 0.1594219, 1, 0, 0.2588235, 1,
1.747365, -0.9221912, 5.108841, 1, 0, 0.2509804, 1,
1.759546, 1.112507, 2.340704, 1, 0, 0.2470588, 1,
1.777198, 0.001304745, 3.163662, 1, 0, 0.2392157, 1,
1.778112, -0.5387281, -0.8510236, 1, 0, 0.2352941, 1,
1.788489, -0.4955823, 1.420803, 1, 0, 0.227451, 1,
1.790027, -0.2920446, 1.5831, 1, 0, 0.2235294, 1,
1.790062, -0.1867169, 2.208506, 1, 0, 0.2156863, 1,
1.800756, 0.1938868, 0.4257607, 1, 0, 0.2117647, 1,
1.81302, -1.542388, 2.422752, 1, 0, 0.2039216, 1,
1.823705, -0.2149499, -0.872546, 1, 0, 0.1960784, 1,
1.825363, -1.421457, 2.253064, 1, 0, 0.1921569, 1,
1.848006, 0.07992951, 1.78839, 1, 0, 0.1843137, 1,
1.853981, -1.404892, 2.36443, 1, 0, 0.1803922, 1,
1.858926, -1.479402, 2.794314, 1, 0, 0.172549, 1,
1.866075, -1.977841, 0.6612541, 1, 0, 0.1686275, 1,
1.872905, 2.504781, 0.5221435, 1, 0, 0.1607843, 1,
1.905282, -0.8055736, 0.528787, 1, 0, 0.1568628, 1,
1.943921, 0.005917162, 1.832332, 1, 0, 0.1490196, 1,
1.947347, 0.9340172, 0.7472129, 1, 0, 0.145098, 1,
1.954658, -0.3280091, 0.6123898, 1, 0, 0.1372549, 1,
1.957586, -0.1338795, 1.49679, 1, 0, 0.1333333, 1,
1.97079, -0.5330895, 0.825955, 1, 0, 0.1254902, 1,
2.02671, 1.537506, 1.803327, 1, 0, 0.1215686, 1,
2.037443, -1.519827, 1.469026, 1, 0, 0.1137255, 1,
2.067428, 0.1808805, -1.157097, 1, 0, 0.1098039, 1,
2.073788, -1.077763, 0.8444937, 1, 0, 0.1019608, 1,
2.074005, 0.9280591, 3.049487, 1, 0, 0.09411765, 1,
2.086638, 0.7397926, 2.237611, 1, 0, 0.09019608, 1,
2.099524, 0.1363718, 2.491621, 1, 0, 0.08235294, 1,
2.170065, -0.9852906, 0.7987147, 1, 0, 0.07843138, 1,
2.218742, -0.8413939, 1.08481, 1, 0, 0.07058824, 1,
2.282131, -0.4420138, 2.968627, 1, 0, 0.06666667, 1,
2.32659, 0.9515003, 1.987055, 1, 0, 0.05882353, 1,
2.387636, 1.401588, 0.9993549, 1, 0, 0.05490196, 1,
2.421483, 0.3925282, 1.849355, 1, 0, 0.04705882, 1,
2.45139, 0.8044682, -0.1880507, 1, 0, 0.04313726, 1,
2.455092, 0.3753715, 1.096201, 1, 0, 0.03529412, 1,
2.519022, -1.545038, 1.639843, 1, 0, 0.03137255, 1,
2.543871, -1.319736, 2.440321, 1, 0, 0.02352941, 1,
2.557981, -0.2454005, 2.736943, 1, 0, 0.01960784, 1,
2.571534, -0.3549383, 0.09247468, 1, 0, 0.01176471, 1,
2.820126, 1.222746, 1.225495, 1, 0, 0.007843138, 1
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
-0.3863254, -3.861911, -6.736694, 0, -0.5, 0.5, 0.5,
-0.3863254, -3.861911, -6.736694, 1, -0.5, 0.5, 0.5,
-0.3863254, -3.861911, -6.736694, 1, 1.5, 0.5, 0.5,
-0.3863254, -3.861911, -6.736694, 0, 1.5, 0.5, 0.5
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
-4.679764, 0.01642025, -6.736694, 0, -0.5, 0.5, 0.5,
-4.679764, 0.01642025, -6.736694, 1, -0.5, 0.5, 0.5,
-4.679764, 0.01642025, -6.736694, 1, 1.5, 0.5, 0.5,
-4.679764, 0.01642025, -6.736694, 0, 1.5, 0.5, 0.5
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
-4.679764, -3.861911, 0.2272859, 0, -0.5, 0.5, 0.5,
-4.679764, -3.861911, 0.2272859, 1, -0.5, 0.5, 0.5,
-4.679764, -3.861911, 0.2272859, 1, 1.5, 0.5, 0.5,
-4.679764, -3.861911, 0.2272859, 0, 1.5, 0.5, 0.5
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
-3, -2.966911, -5.129622,
2, -2.966911, -5.129622,
-3, -2.966911, -5.129622,
-3, -3.116078, -5.397467,
-2, -2.966911, -5.129622,
-2, -3.116078, -5.397467,
-1, -2.966911, -5.129622,
-1, -3.116078, -5.397467,
0, -2.966911, -5.129622,
0, -3.116078, -5.397467,
1, -2.966911, -5.129622,
1, -3.116078, -5.397467,
2, -2.966911, -5.129622,
2, -3.116078, -5.397467
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
-3, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
-3, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
-3, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
-3, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5,
-2, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
-2, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
-2, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
-2, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5,
-1, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
-1, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
-1, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
-1, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5,
0, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
0, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
0, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
0, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5,
1, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
1, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
1, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
1, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5,
2, -3.414411, -5.933158, 0, -0.5, 0.5, 0.5,
2, -3.414411, -5.933158, 1, -0.5, 0.5, 0.5,
2, -3.414411, -5.933158, 1, 1.5, 0.5, 0.5,
2, -3.414411, -5.933158, 0, 1.5, 0.5, 0.5
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
-3.688971, -2, -5.129622,
-3.688971, 2, -5.129622,
-3.688971, -2, -5.129622,
-3.854103, -2, -5.397467,
-3.688971, -1, -5.129622,
-3.854103, -1, -5.397467,
-3.688971, 0, -5.129622,
-3.854103, 0, -5.397467,
-3.688971, 1, -5.129622,
-3.854103, 1, -5.397467,
-3.688971, 2, -5.129622,
-3.854103, 2, -5.397467
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
-4.184367, -2, -5.933158, 0, -0.5, 0.5, 0.5,
-4.184367, -2, -5.933158, 1, -0.5, 0.5, 0.5,
-4.184367, -2, -5.933158, 1, 1.5, 0.5, 0.5,
-4.184367, -2, -5.933158, 0, 1.5, 0.5, 0.5,
-4.184367, -1, -5.933158, 0, -0.5, 0.5, 0.5,
-4.184367, -1, -5.933158, 1, -0.5, 0.5, 0.5,
-4.184367, -1, -5.933158, 1, 1.5, 0.5, 0.5,
-4.184367, -1, -5.933158, 0, 1.5, 0.5, 0.5,
-4.184367, 0, -5.933158, 0, -0.5, 0.5, 0.5,
-4.184367, 0, -5.933158, 1, -0.5, 0.5, 0.5,
-4.184367, 0, -5.933158, 1, 1.5, 0.5, 0.5,
-4.184367, 0, -5.933158, 0, 1.5, 0.5, 0.5,
-4.184367, 1, -5.933158, 0, -0.5, 0.5, 0.5,
-4.184367, 1, -5.933158, 1, -0.5, 0.5, 0.5,
-4.184367, 1, -5.933158, 1, 1.5, 0.5, 0.5,
-4.184367, 1, -5.933158, 0, 1.5, 0.5, 0.5,
-4.184367, 2, -5.933158, 0, -0.5, 0.5, 0.5,
-4.184367, 2, -5.933158, 1, -0.5, 0.5, 0.5,
-4.184367, 2, -5.933158, 1, 1.5, 0.5, 0.5,
-4.184367, 2, -5.933158, 0, 1.5, 0.5, 0.5
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
-3.688971, -2.966911, -4,
-3.688971, -2.966911, 4,
-3.688971, -2.966911, -4,
-3.854103, -3.116078, -4,
-3.688971, -2.966911, -2,
-3.854103, -3.116078, -2,
-3.688971, -2.966911, 0,
-3.854103, -3.116078, 0,
-3.688971, -2.966911, 2,
-3.854103, -3.116078, 2,
-3.688971, -2.966911, 4,
-3.854103, -3.116078, 4
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
-4.184367, -3.414411, -4, 0, -0.5, 0.5, 0.5,
-4.184367, -3.414411, -4, 1, -0.5, 0.5, 0.5,
-4.184367, -3.414411, -4, 1, 1.5, 0.5, 0.5,
-4.184367, -3.414411, -4, 0, 1.5, 0.5, 0.5,
-4.184367, -3.414411, -2, 0, -0.5, 0.5, 0.5,
-4.184367, -3.414411, -2, 1, -0.5, 0.5, 0.5,
-4.184367, -3.414411, -2, 1, 1.5, 0.5, 0.5,
-4.184367, -3.414411, -2, 0, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 0, 0, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 0, 1, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 0, 1, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 0, 0, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 2, 0, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 2, 1, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 2, 1, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 2, 0, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 4, 0, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 4, 1, -0.5, 0.5, 0.5,
-4.184367, -3.414411, 4, 1, 1.5, 0.5, 0.5,
-4.184367, -3.414411, 4, 0, 1.5, 0.5, 0.5
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
-3.688971, -2.966911, -5.129622,
-3.688971, 2.999752, -5.129622,
-3.688971, -2.966911, 5.584193,
-3.688971, 2.999752, 5.584193,
-3.688971, -2.966911, -5.129622,
-3.688971, -2.966911, 5.584193,
-3.688971, 2.999752, -5.129622,
-3.688971, 2.999752, 5.584193,
-3.688971, -2.966911, -5.129622,
2.91632, -2.966911, -5.129622,
-3.688971, -2.966911, 5.584193,
2.91632, -2.966911, 5.584193,
-3.688971, 2.999752, -5.129622,
2.91632, 2.999752, -5.129622,
-3.688971, 2.999752, 5.584193,
2.91632, 2.999752, 5.584193,
2.91632, -2.966911, -5.129622,
2.91632, 2.999752, -5.129622,
2.91632, -2.966911, 5.584193,
2.91632, 2.999752, 5.584193,
2.91632, -2.966911, -5.129622,
2.91632, -2.966911, 5.584193,
2.91632, 2.999752, -5.129622,
2.91632, 2.999752, 5.584193
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
var radius = 7.43781;
var distance = 33.09166;
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
mvMatrix.translate( 0.3863254, -0.01642025, -0.2272859 );
mvMatrix.scale( 1.217495, 1.347806, 0.7506109 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.09166);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
buminafos<-read.table("buminafos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-buminafos$V2
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
y<-buminafos$V3
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
z<-buminafos$V4
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
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
-3.592777, 0.01085, -1.392399, 0, 0, 1, 1, 1,
-3.081886, -0.4601037, -0.2474341, 1, 0, 0, 1, 1,
-2.947999, 1.097705, -1.150649, 1, 0, 0, 1, 1,
-2.848212, 1.47747, 0.0663503, 1, 0, 0, 1, 1,
-2.741482, -1.037207, -2.251781, 1, 0, 0, 1, 1,
-2.67291, 0.5909664, -0.06715555, 1, 0, 0, 1, 1,
-2.630985, -0.5531099, -2.20497, 0, 0, 0, 1, 1,
-2.600597, -0.8449353, -1.702857, 0, 0, 0, 1, 1,
-2.519062, -0.9673458, -2.050158, 0, 0, 0, 1, 1,
-2.428818, -2.129274, -2.392872, 0, 0, 0, 1, 1,
-2.370461, 0.5205627, -1.402667, 0, 0, 0, 1, 1,
-2.347328, -0.9074529, -3.263267, 0, 0, 0, 1, 1,
-2.337461, 0.271815, -0.8709896, 0, 0, 0, 1, 1,
-2.30481, 1.108461, 0.5218049, 1, 1, 1, 1, 1,
-2.301962, -0.01543694, -0.7580092, 1, 1, 1, 1, 1,
-2.295363, -0.3943278, -3.014968, 1, 1, 1, 1, 1,
-2.267678, 0.7421016, -1.762091, 1, 1, 1, 1, 1,
-2.267173, -0.1107185, -2.528321, 1, 1, 1, 1, 1,
-2.194388, 2.28319, -1.606535, 1, 1, 1, 1, 1,
-2.149364, 0.2352115, 2.071053, 1, 1, 1, 1, 1,
-2.123688, 0.08980279, -0.7917623, 1, 1, 1, 1, 1,
-2.104816, 2.07948, -2.189067, 1, 1, 1, 1, 1,
-2.063851, -0.2321877, -0.6611426, 1, 1, 1, 1, 1,
-2.052881, 1.12659, -1.832676, 1, 1, 1, 1, 1,
-2.019608, 1.328303, -0.4736889, 1, 1, 1, 1, 1,
-2.008435, -0.6949406, -1.593642, 1, 1, 1, 1, 1,
-1.997651, 0.8250803, -2.890569, 1, 1, 1, 1, 1,
-1.936718, 0.9307541, -2.144827, 1, 1, 1, 1, 1,
-1.926003, 0.2886347, -1.702987, 0, 0, 1, 1, 1,
-1.918995, 0.7188802, -2.116418, 1, 0, 0, 1, 1,
-1.909942, -0.698899, -2.640961, 1, 0, 0, 1, 1,
-1.906581, 0.3074819, -2.320415, 1, 0, 0, 1, 1,
-1.872077, 0.4530318, 1.486961, 1, 0, 0, 1, 1,
-1.862548, -1.677315, -2.390429, 1, 0, 0, 1, 1,
-1.861367, -0.108763, -0.07479742, 0, 0, 0, 1, 1,
-1.85495, -0.3540844, -2.411221, 0, 0, 0, 1, 1,
-1.805651, 0.09981902, -3.235348, 0, 0, 0, 1, 1,
-1.755301, 1.4818, -0.7346133, 0, 0, 0, 1, 1,
-1.73362, 0.4143223, -0.2518192, 0, 0, 0, 1, 1,
-1.726125, -0.513746, -2.181312, 0, 0, 0, 1, 1,
-1.715551, 1.83221, 1.098106, 0, 0, 0, 1, 1,
-1.712101, -0.06864512, -2.5389, 1, 1, 1, 1, 1,
-1.701802, -0.7275136, -1.292852, 1, 1, 1, 1, 1,
-1.697584, 0.6459633, -1.523418, 1, 1, 1, 1, 1,
-1.695674, 0.443328, -0.09140474, 1, 1, 1, 1, 1,
-1.680127, -0.0246476, -0.1095337, 1, 1, 1, 1, 1,
-1.673834, -0.175664, -0.7188947, 1, 1, 1, 1, 1,
-1.641659, -2.032907, -2.964794, 1, 1, 1, 1, 1,
-1.623224, 2.109731, -1.698851, 1, 1, 1, 1, 1,
-1.617078, 0.5172524, -0.05377918, 1, 1, 1, 1, 1,
-1.612652, 0.3756132, -1.558435, 1, 1, 1, 1, 1,
-1.578161, 0.7499007, -2.592254, 1, 1, 1, 1, 1,
-1.577214, -1.833586, -3.354037, 1, 1, 1, 1, 1,
-1.572825, -1.196067, -0.7073597, 1, 1, 1, 1, 1,
-1.572324, 0.623907, -0.8575984, 1, 1, 1, 1, 1,
-1.57137, -0.3691956, -1.547556, 1, 1, 1, 1, 1,
-1.568657, -0.4354394, -1.465846, 0, 0, 1, 1, 1,
-1.565349, -0.3057145, -1.373926, 1, 0, 0, 1, 1,
-1.556038, 0.1399841, -1.522982, 1, 0, 0, 1, 1,
-1.547695, 0.7705601, -2.420343, 1, 0, 0, 1, 1,
-1.535075, 1.276305, -2.232048, 1, 0, 0, 1, 1,
-1.530901, 0.1025009, -0.7371922, 1, 0, 0, 1, 1,
-1.52746, 0.9698442, -1.68449, 0, 0, 0, 1, 1,
-1.505992, 0.7413062, -2.705503, 0, 0, 0, 1, 1,
-1.487761, -1.890563, -3.351699, 0, 0, 0, 1, 1,
-1.477963, 1.200655, 0.8842213, 0, 0, 0, 1, 1,
-1.477649, 0.5960519, 0.9026034, 0, 0, 0, 1, 1,
-1.475762, -1.870165, -3.73769, 0, 0, 0, 1, 1,
-1.468567, 0.901226, -0.6276528, 0, 0, 0, 1, 1,
-1.467464, -0.1096747, -0.89923, 1, 1, 1, 1, 1,
-1.467265, -1.104126, -1.465379, 1, 1, 1, 1, 1,
-1.459842, 0.06048241, -0.6634871, 1, 1, 1, 1, 1,
-1.434672, 0.07107134, -3.159905, 1, 1, 1, 1, 1,
-1.403889, -1.058684, -2.046091, 1, 1, 1, 1, 1,
-1.400226, 0.9251757, -1.434213, 1, 1, 1, 1, 1,
-1.389783, -0.7451153, -3.029962, 1, 1, 1, 1, 1,
-1.37412, -0.213893, 0.1303835, 1, 1, 1, 1, 1,
-1.366063, -1.481599, -2.611493, 1, 1, 1, 1, 1,
-1.364335, -1.477852, -3.467689, 1, 1, 1, 1, 1,
-1.358081, -1.086774, -3.627763, 1, 1, 1, 1, 1,
-1.349637, 1.888268, -0.8329073, 1, 1, 1, 1, 1,
-1.341821, -0.6376899, -2.821602, 1, 1, 1, 1, 1,
-1.336876, 0.1085364, -1.494344, 1, 1, 1, 1, 1,
-1.330057, -0.1615433, -1.969841, 1, 1, 1, 1, 1,
-1.327449, -1.651202, -1.62747, 0, 0, 1, 1, 1,
-1.318679, -0.6257748, -3.660747, 1, 0, 0, 1, 1,
-1.317508, 0.9094012, -0.0250838, 1, 0, 0, 1, 1,
-1.311709, -1.073273, -2.746901, 1, 0, 0, 1, 1,
-1.305102, -1.122851, -1.758412, 1, 0, 0, 1, 1,
-1.291184, 2.216176, -2.227059, 1, 0, 0, 1, 1,
-1.284421, -0.7953548, -1.366691, 0, 0, 0, 1, 1,
-1.283271, 0.6409566, -1.564556, 0, 0, 0, 1, 1,
-1.28166, -0.1475761, -0.7832003, 0, 0, 0, 1, 1,
-1.261307, 1.554855, 0.2625688, 0, 0, 0, 1, 1,
-1.256343, -0.1479545, -3.215186, 0, 0, 0, 1, 1,
-1.243114, -1.449277, -2.841524, 0, 0, 0, 1, 1,
-1.240086, 0.3012204, -1.17171, 0, 0, 0, 1, 1,
-1.236748, 0.5623024, -0.3798395, 1, 1, 1, 1, 1,
-1.235231, 0.741661, -0.7235226, 1, 1, 1, 1, 1,
-1.228633, 0.181377, -2.683432, 1, 1, 1, 1, 1,
-1.22094, 0.6443734, -0.3299574, 1, 1, 1, 1, 1,
-1.218291, 0.8568518, -1.403674, 1, 1, 1, 1, 1,
-1.213484, 1.330574, -0.4672786, 1, 1, 1, 1, 1,
-1.207887, 1.243202, 0.119983, 1, 1, 1, 1, 1,
-1.206342, 0.8734598, -0.2308594, 1, 1, 1, 1, 1,
-1.205048, 0.3867699, -0.7708965, 1, 1, 1, 1, 1,
-1.191478, 0.4566692, -1.16164, 1, 1, 1, 1, 1,
-1.181093, -1.504407, -3.81708, 1, 1, 1, 1, 1,
-1.178999, 0.2473658, -0.7648295, 1, 1, 1, 1, 1,
-1.167757, -0.574505, -1.605131, 1, 1, 1, 1, 1,
-1.167438, 0.6452441, -0.1846034, 1, 1, 1, 1, 1,
-1.159405, 0.75107, -1.446474, 1, 1, 1, 1, 1,
-1.157073, -0.7237431, -2.594738, 0, 0, 1, 1, 1,
-1.15619, 1.138329, -0.7222725, 1, 0, 0, 1, 1,
-1.155954, -0.244861, -3.732749, 1, 0, 0, 1, 1,
-1.152695, -2.796241, -4.168192, 1, 0, 0, 1, 1,
-1.141573, 0.06776976, -3.829373, 1, 0, 0, 1, 1,
-1.141103, -0.3338028, -1.521212, 1, 0, 0, 1, 1,
-1.1352, 0.6357731, -1.839565, 0, 0, 0, 1, 1,
-1.130945, -0.2066513, -3.633827, 0, 0, 0, 1, 1,
-1.129645, 1.124693, 0.3101558, 0, 0, 0, 1, 1,
-1.122297, -1.433468, -1.594289, 0, 0, 0, 1, 1,
-1.12183, -0.9873562, -3.306078, 0, 0, 0, 1, 1,
-1.120163, -1.094585, -4.363151, 0, 0, 0, 1, 1,
-1.117946, 0.6884524, -0.1276281, 0, 0, 0, 1, 1,
-1.114312, -0.6200987, -1.328134, 1, 1, 1, 1, 1,
-1.111529, 1.828412, 0.8837603, 1, 1, 1, 1, 1,
-1.109458, 0.327127, -0.6138523, 1, 1, 1, 1, 1,
-1.107827, -2.065965, -1.935115, 1, 1, 1, 1, 1,
-1.097209, 0.712373, -2.365956, 1, 1, 1, 1, 1,
-1.09194, -0.243222, -1.254142, 1, 1, 1, 1, 1,
-1.075048, -0.6836877, -3.9332, 1, 1, 1, 1, 1,
-1.073937, -1.153829, -1.666816, 1, 1, 1, 1, 1,
-1.06608, -0.7331198, -1.721836, 1, 1, 1, 1, 1,
-1.060561, 0.4724197, 0.02443455, 1, 1, 1, 1, 1,
-1.057416, -0.9046417, -2.889297, 1, 1, 1, 1, 1,
-1.055229, 0.3206277, 0.3660388, 1, 1, 1, 1, 1,
-1.047943, 0.2089228, -1.485574, 1, 1, 1, 1, 1,
-1.039378, -0.6546574, -3.640354, 1, 1, 1, 1, 1,
-1.025017, 0.09259287, -0.4644431, 1, 1, 1, 1, 1,
-1.02069, -0.6252289, -3.026998, 0, 0, 1, 1, 1,
-1.019454, -0.7668923, -3.387864, 1, 0, 0, 1, 1,
-1.018241, 0.4797468, -1.241205, 1, 0, 0, 1, 1,
-1.015251, -0.4720031, -4.146872, 1, 0, 0, 1, 1,
-1.000389, 0.5214725, -1.891357, 1, 0, 0, 1, 1,
-1.000235, -0.7085077, -1.12927, 1, 0, 0, 1, 1,
-0.9948882, 2.180581, 0.3640825, 0, 0, 0, 1, 1,
-0.9815937, -1.094796, -2.131659, 0, 0, 0, 1, 1,
-0.9778885, -0.7188485, 0.110873, 0, 0, 0, 1, 1,
-0.9772661, 0.6858342, -1.590561, 0, 0, 0, 1, 1,
-0.9721712, -0.2256646, -0.7938102, 0, 0, 0, 1, 1,
-0.969769, 0.7614249, 0.1772068, 0, 0, 0, 1, 1,
-0.9601251, 1.578834, -1.068658, 0, 0, 0, 1, 1,
-0.9523357, -0.7319864, -2.860401, 1, 1, 1, 1, 1,
-0.9513512, -0.2981176, -0.3497369, 1, 1, 1, 1, 1,
-0.9511111, -1.299774, -2.083638, 1, 1, 1, 1, 1,
-0.9445718, -0.4121206, -1.701443, 1, 1, 1, 1, 1,
-0.9424472, -1.345291, -0.2224986, 1, 1, 1, 1, 1,
-0.941834, -1.35634, -3.031331, 1, 1, 1, 1, 1,
-0.9366634, -0.1344291, -1.837566, 1, 1, 1, 1, 1,
-0.9304758, 0.9287503, 0.3025169, 1, 1, 1, 1, 1,
-0.9260281, -0.6787461, -2.673486, 1, 1, 1, 1, 1,
-0.925756, -1.63501, -2.886491, 1, 1, 1, 1, 1,
-0.9243084, 0.4202807, 0.3360416, 1, 1, 1, 1, 1,
-0.9164639, -0.2819028, -0.6783032, 1, 1, 1, 1, 1,
-0.9063776, -0.4744231, -2.506236, 1, 1, 1, 1, 1,
-0.9011894, -2.426057, -2.600962, 1, 1, 1, 1, 1,
-0.901092, -1.524332, -1.733356, 1, 1, 1, 1, 1,
-0.8996301, -0.8951421, -1.498408, 0, 0, 1, 1, 1,
-0.8971063, -0.2631189, -2.951687, 1, 0, 0, 1, 1,
-0.8924562, -2.050652, -2.648925, 1, 0, 0, 1, 1,
-0.890576, 0.5818409, -1.14292, 1, 0, 0, 1, 1,
-0.8901182, 0.410188, 0.1064183, 1, 0, 0, 1, 1,
-0.887647, -1.643773, -3.492677, 1, 0, 0, 1, 1,
-0.8782091, 0.3995593, -0.167388, 0, 0, 0, 1, 1,
-0.8774244, 0.3751686, -0.7177981, 0, 0, 0, 1, 1,
-0.8761007, 0.1870405, -1.331047, 0, 0, 0, 1, 1,
-0.8742169, 1.76132, 1.36591, 0, 0, 0, 1, 1,
-0.8707463, -0.3543734, -1.70503, 0, 0, 0, 1, 1,
-0.8580413, 0.9254413, -0.4307663, 0, 0, 0, 1, 1,
-0.8551515, -0.2261577, -2.278955, 0, 0, 0, 1, 1,
-0.8549178, -0.3954726, -2.711086, 1, 1, 1, 1, 1,
-0.8510668, 2.074053, -1.100444, 1, 1, 1, 1, 1,
-0.8387259, 1.341738, -1.211345, 1, 1, 1, 1, 1,
-0.8315064, -1.377123, -1.832584, 1, 1, 1, 1, 1,
-0.8314435, 1.461273, -0.3996963, 1, 1, 1, 1, 1,
-0.8295096, -0.06148331, -0.6177298, 1, 1, 1, 1, 1,
-0.8285844, 0.6847884, -1.956617, 1, 1, 1, 1, 1,
-0.8271809, 0.1381918, -1.313084, 1, 1, 1, 1, 1,
-0.8222307, -1.928465, -4.731243, 1, 1, 1, 1, 1,
-0.8170832, -1.20049, -4.392844, 1, 1, 1, 1, 1,
-0.8168675, 2.058694, 0.4771773, 1, 1, 1, 1, 1,
-0.8125321, 0.6852117, 0.2981365, 1, 1, 1, 1, 1,
-0.8118165, -0.5539521, -0.91839, 1, 1, 1, 1, 1,
-0.8116316, -1.000589, -2.38475, 1, 1, 1, 1, 1,
-0.8094955, -0.9782076, -2.794425, 1, 1, 1, 1, 1,
-0.8002408, -0.4985714, -2.504969, 0, 0, 1, 1, 1,
-0.7989787, 1.475632, -0.4477866, 1, 0, 0, 1, 1,
-0.7978526, 0.05784369, -0.6499361, 1, 0, 0, 1, 1,
-0.7924546, 0.1236561, -2.267317, 1, 0, 0, 1, 1,
-0.7787269, 1.392712, -2.731668, 1, 0, 0, 1, 1,
-0.7774882, -2.089555, -3.518322, 1, 0, 0, 1, 1,
-0.7718732, 0.4248115, -0.8130313, 0, 0, 0, 1, 1,
-0.7701049, 0.2615178, -0.7141098, 0, 0, 0, 1, 1,
-0.7691103, -0.6363981, -1.249738, 0, 0, 0, 1, 1,
-0.7599165, -1.438741, -2.40423, 0, 0, 0, 1, 1,
-0.7571461, -0.5593697, -2.40507, 0, 0, 0, 1, 1,
-0.7562624, -1.162237, -4.651843, 0, 0, 0, 1, 1,
-0.7463826, -0.620324, -2.537388, 0, 0, 0, 1, 1,
-0.7462924, -0.2315326, -1.809204, 1, 1, 1, 1, 1,
-0.7448468, -1.540872, -2.60683, 1, 1, 1, 1, 1,
-0.7425521, 0.4656942, -3.160608, 1, 1, 1, 1, 1,
-0.7425137, -0.06857143, -2.770346, 1, 1, 1, 1, 1,
-0.7415994, 1.347494, -0.3978385, 1, 1, 1, 1, 1,
-0.7355576, -0.6544991, -3.331429, 1, 1, 1, 1, 1,
-0.7277575, -0.1514462, -2.345901, 1, 1, 1, 1, 1,
-0.7277024, -2.097242, -2.698582, 1, 1, 1, 1, 1,
-0.7216682, -0.06504289, -1.232027, 1, 1, 1, 1, 1,
-0.7202092, 0.4678026, -1.816671, 1, 1, 1, 1, 1,
-0.7191666, 1.617595, 0.5951836, 1, 1, 1, 1, 1,
-0.7184085, 0.4402269, -2.344259, 1, 1, 1, 1, 1,
-0.7065987, -1.029357, -1.697493, 1, 1, 1, 1, 1,
-0.7029631, -0.7542789, -2.474613, 1, 1, 1, 1, 1,
-0.6946986, 0.5116748, -2.321077, 1, 1, 1, 1, 1,
-0.6920713, -0.5631054, -1.685037, 0, 0, 1, 1, 1,
-0.6858971, -0.2255334, -1.574098, 1, 0, 0, 1, 1,
-0.6856081, -0.7446477, -4.015141, 1, 0, 0, 1, 1,
-0.6815477, -0.2815078, -2.22573, 1, 0, 0, 1, 1,
-0.6812908, 2.43744, 1.362193, 1, 0, 0, 1, 1,
-0.6759104, 0.4833198, -1.606651, 1, 0, 0, 1, 1,
-0.6733229, 0.9617026, -0.1133584, 0, 0, 0, 1, 1,
-0.6720738, 1.438399, -2.140208, 0, 0, 0, 1, 1,
-0.6720718, -1.358807, -3.578368, 0, 0, 0, 1, 1,
-0.671114, 1.503337, -1.98266, 0, 0, 0, 1, 1,
-0.6695831, 0.009526527, -0.7242282, 0, 0, 0, 1, 1,
-0.6659636, -1.434109, -2.835147, 0, 0, 0, 1, 1,
-0.657018, 0.1507665, -0.7615526, 0, 0, 0, 1, 1,
-0.6528568, 0.2778187, -0.2966874, 1, 1, 1, 1, 1,
-0.6513461, -0.6835035, -4.157249, 1, 1, 1, 1, 1,
-0.6411406, -1.277154, -2.921597, 1, 1, 1, 1, 1,
-0.6246951, -0.5687723, -2.98509, 1, 1, 1, 1, 1,
-0.6246612, 1.099315, -0.114494, 1, 1, 1, 1, 1,
-0.6222982, -1.743743, -4.029144, 1, 1, 1, 1, 1,
-0.6207329, -0.1572935, -1.756287, 1, 1, 1, 1, 1,
-0.6174777, -0.5509295, -2.033469, 1, 1, 1, 1, 1,
-0.61474, -0.6028147, -2.744138, 1, 1, 1, 1, 1,
-0.613497, -0.3190486, -2.090299, 1, 1, 1, 1, 1,
-0.6115968, 0.5414277, -0.1101433, 1, 1, 1, 1, 1,
-0.6085343, -0.6560088, -2.143163, 1, 1, 1, 1, 1,
-0.6079228, -0.6160717, -2.717991, 1, 1, 1, 1, 1,
-0.6072195, 0.5511869, -1.818037, 1, 1, 1, 1, 1,
-0.607035, -0.05249153, -3.191157, 1, 1, 1, 1, 1,
-0.6045415, -0.664019, -3.249682, 0, 0, 1, 1, 1,
-0.6031025, 0.3775142, -1.882282, 1, 0, 0, 1, 1,
-0.601615, -1.923586, -2.726992, 1, 0, 0, 1, 1,
-0.5838336, -0.2407702, -1.932806, 1, 0, 0, 1, 1,
-0.5812757, 0.6202815, -0.8654992, 1, 0, 0, 1, 1,
-0.5767979, 1.767957, -0.2071684, 1, 0, 0, 1, 1,
-0.5739461, 0.3986603, -1.91154, 0, 0, 0, 1, 1,
-0.5735508, -0.876631, -1.500697, 0, 0, 0, 1, 1,
-0.5720806, 0.5688634, -1.255122, 0, 0, 0, 1, 1,
-0.5703182, -0.1384777, -2.367102, 0, 0, 0, 1, 1,
-0.5692312, -0.4086046, -3.197286, 0, 0, 0, 1, 1,
-0.5658305, -1.512175, -1.915647, 0, 0, 0, 1, 1,
-0.5621157, -0.1597527, -1.890401, 0, 0, 0, 1, 1,
-0.5613847, -0.3322515, -0.2453325, 1, 1, 1, 1, 1,
-0.5561866, 0.9606394, -0.8828506, 1, 1, 1, 1, 1,
-0.55499, 0.008423714, -1.668485, 1, 1, 1, 1, 1,
-0.5533741, -0.5944441, -2.322369, 1, 1, 1, 1, 1,
-0.5484684, -1.096336, -3.20385, 1, 1, 1, 1, 1,
-0.5475191, 0.04685354, -1.886141, 1, 1, 1, 1, 1,
-0.5444045, -2.449748, -1.280517, 1, 1, 1, 1, 1,
-0.5423821, -1.088236, -1.038412, 1, 1, 1, 1, 1,
-0.5421709, -1.890859, -1.774593, 1, 1, 1, 1, 1,
-0.5378552, -1.084609, -2.383863, 1, 1, 1, 1, 1,
-0.5364711, -0.4963859, -0.9707871, 1, 1, 1, 1, 1,
-0.5359471, 0.4658236, 0.7495431, 1, 1, 1, 1, 1,
-0.5343649, 2.456629, -0.6901695, 1, 1, 1, 1, 1,
-0.534261, -0.4798592, -2.486563, 1, 1, 1, 1, 1,
-0.5317919, 0.4062164, -0.4696847, 1, 1, 1, 1, 1,
-0.5312902, 0.7817455, -1.726917, 0, 0, 1, 1, 1,
-0.5268558, -0.2547804, -2.427442, 1, 0, 0, 1, 1,
-0.521703, -0.4405488, -1.051649, 1, 0, 0, 1, 1,
-0.5207373, 0.6641278, -1.408143, 1, 0, 0, 1, 1,
-0.5122, 0.3128137, -1.646989, 1, 0, 0, 1, 1,
-0.511957, -0.91281, -3.202549, 1, 0, 0, 1, 1,
-0.5077667, 1.720241, 0.4142357, 0, 0, 0, 1, 1,
-0.5076088, 1.076237, -0.2237256, 0, 0, 0, 1, 1,
-0.5058419, 0.5713348, -0.4321008, 0, 0, 0, 1, 1,
-0.5048825, -0.8335646, -3.6419, 0, 0, 0, 1, 1,
-0.5038886, -0.4435747, -3.095702, 0, 0, 0, 1, 1,
-0.5029629, -0.1353834, -1.245097, 0, 0, 0, 1, 1,
-0.5012901, -0.6694729, -2.105924, 0, 0, 0, 1, 1,
-0.5001599, -1.68009, -3.073035, 1, 1, 1, 1, 1,
-0.4985191, 0.3717863, -0.4321752, 1, 1, 1, 1, 1,
-0.4977058, -0.5190495, -4.531168, 1, 1, 1, 1, 1,
-0.4965885, 0.3646796, -0.2685074, 1, 1, 1, 1, 1,
-0.4938709, 1.806793, -0.6728967, 1, 1, 1, 1, 1,
-0.4934076, 0.7124229, -1.009517, 1, 1, 1, 1, 1,
-0.4897505, -0.7456822, -1.34557, 1, 1, 1, 1, 1,
-0.4808152, -0.3767905, -2.255309, 1, 1, 1, 1, 1,
-0.4767825, 1.479421, 1.091168, 1, 1, 1, 1, 1,
-0.4736336, -0.2366243, -1.655723, 1, 1, 1, 1, 1,
-0.470362, -0.09931012, -2.004786, 1, 1, 1, 1, 1,
-0.4703056, -0.6265611, -2.279542, 1, 1, 1, 1, 1,
-0.4677486, 2.357415, 0.2921123, 1, 1, 1, 1, 1,
-0.463369, 1.04982, -0.1873638, 1, 1, 1, 1, 1,
-0.4624719, 0.7766334, 0.9326499, 1, 1, 1, 1, 1,
-0.4609966, 0.4003695, -0.4737377, 0, 0, 1, 1, 1,
-0.4609302, -0.335318, -1.70291, 1, 0, 0, 1, 1,
-0.4580273, -1.488082, -1.138525, 1, 0, 0, 1, 1,
-0.4541719, -0.4674372, -3.327665, 1, 0, 0, 1, 1,
-0.4540688, -0.3888901, -1.345901, 1, 0, 0, 1, 1,
-0.4514521, 0.5723823, 0.9729196, 1, 0, 0, 1, 1,
-0.4508159, -1.330625, -2.349891, 0, 0, 0, 1, 1,
-0.4473889, 1.149149, -0.6006079, 0, 0, 0, 1, 1,
-0.4463444, -1.437632, -2.922658, 0, 0, 0, 1, 1,
-0.4454481, 0.3483286, -1.188152, 0, 0, 0, 1, 1,
-0.4452539, -1.221762, -4.973595, 0, 0, 0, 1, 1,
-0.4375399, -0.5511816, -2.856735, 0, 0, 0, 1, 1,
-0.4355674, -0.3396901, -3.530441, 0, 0, 0, 1, 1,
-0.4324945, 0.2509608, -1.015537, 1, 1, 1, 1, 1,
-0.4257399, -0.4168015, -2.77094, 1, 1, 1, 1, 1,
-0.425006, -0.2045026, -2.258423, 1, 1, 1, 1, 1,
-0.4229911, 0.7956591, -1.021089, 1, 1, 1, 1, 1,
-0.4226639, -0.5059382, -2.449478, 1, 1, 1, 1, 1,
-0.4220769, -0.1017025, -0.1641144, 1, 1, 1, 1, 1,
-0.4108656, 0.5107142, -0.1566728, 1, 1, 1, 1, 1,
-0.402502, -2.581378, -2.666895, 1, 1, 1, 1, 1,
-0.4024111, 2.064516, -1.98233, 1, 1, 1, 1, 1,
-0.3973185, 1.635053, -2.538802, 1, 1, 1, 1, 1,
-0.3952082, 1.189571, 0.4889392, 1, 1, 1, 1, 1,
-0.3897443, -2.178594, -0.5795609, 1, 1, 1, 1, 1,
-0.3885482, 1.434309, 0.4815492, 1, 1, 1, 1, 1,
-0.3875856, -1.189503, -4.050448, 1, 1, 1, 1, 1,
-0.3874708, 0.03387741, -2.428609, 1, 1, 1, 1, 1,
-0.3842675, -1.171003, -3.465773, 0, 0, 1, 1, 1,
-0.3841928, -1.097482, -3.211348, 1, 0, 0, 1, 1,
-0.3828842, 1.594347, 0.2413553, 1, 0, 0, 1, 1,
-0.3826534, -0.8288776, -3.689552, 1, 0, 0, 1, 1,
-0.3824919, -1.145118, -3.064288, 1, 0, 0, 1, 1,
-0.3757277, 0.3687724, -1.867298, 1, 0, 0, 1, 1,
-0.3750768, 0.5520072, -0.334432, 0, 0, 0, 1, 1,
-0.3738242, -0.9707516, -2.145323, 0, 0, 0, 1, 1,
-0.3730694, -1.573194, -2.879164, 0, 0, 0, 1, 1,
-0.3704526, -1.985974, -3.040326, 0, 0, 0, 1, 1,
-0.3666608, -1.157606, -3.932096, 0, 0, 0, 1, 1,
-0.3662772, -0.4464082, -3.561771, 0, 0, 0, 1, 1,
-0.3627549, -0.8852813, -2.809693, 0, 0, 0, 1, 1,
-0.3573766, -0.5053999, -0.9126984, 1, 1, 1, 1, 1,
-0.3572353, 1.84228, -0.6904498, 1, 1, 1, 1, 1,
-0.3544485, -0.6275885, -4.54566, 1, 1, 1, 1, 1,
-0.3533871, -0.1938063, 0.6475071, 1, 1, 1, 1, 1,
-0.3521095, -0.9351006, -3.403085, 1, 1, 1, 1, 1,
-0.3516777, 0.03083399, -0.06032202, 1, 1, 1, 1, 1,
-0.3513875, -1.0134, -2.690774, 1, 1, 1, 1, 1,
-0.3423924, -0.2326379, -1.115726, 1, 1, 1, 1, 1,
-0.3418986, 0.3955587, 0.003894422, 1, 1, 1, 1, 1,
-0.3418314, -0.1246892, -1.804532, 1, 1, 1, 1, 1,
-0.3408117, -0.3201215, -2.769152, 1, 1, 1, 1, 1,
-0.3372968, 0.5445626, -1.355968, 1, 1, 1, 1, 1,
-0.3323759, 0.6839569, 1.13208, 1, 1, 1, 1, 1,
-0.3317113, -0.09417705, -2.453558, 1, 1, 1, 1, 1,
-0.3261152, -0.4395355, -2.479482, 1, 1, 1, 1, 1,
-0.3259221, -1.971844, -2.517712, 0, 0, 1, 1, 1,
-0.3243461, 0.02225724, -1.292342, 1, 0, 0, 1, 1,
-0.3241222, -1.509227, -4.627227, 1, 0, 0, 1, 1,
-0.3234909, -1.81417, -4.353881, 1, 0, 0, 1, 1,
-0.3229728, -0.8529222, -2.415641, 1, 0, 0, 1, 1,
-0.3209439, -0.6655518, -2.627936, 1, 0, 0, 1, 1,
-0.3194076, -0.07929583, -3.977059, 0, 0, 0, 1, 1,
-0.3177165, -0.8497738, -2.494104, 0, 0, 0, 1, 1,
-0.3173715, -0.4337107, -1.198366, 0, 0, 0, 1, 1,
-0.3137783, -0.6884505, -4.082746, 0, 0, 0, 1, 1,
-0.310924, 2.608672, 0.6203144, 0, 0, 0, 1, 1,
-0.3073719, -0.055616, -1.261962, 0, 0, 0, 1, 1,
-0.3060921, 0.299625, -1.285998, 0, 0, 0, 1, 1,
-0.305343, 0.2879508, -0.3138817, 1, 1, 1, 1, 1,
-0.3050852, -0.447022, -2.544819, 1, 1, 1, 1, 1,
-0.3047389, 0.09739448, 0.1060749, 1, 1, 1, 1, 1,
-0.3044401, 1.712024, -1.444315, 1, 1, 1, 1, 1,
-0.3038179, -0.4692478, -1.365066, 1, 1, 1, 1, 1,
-0.3025358, -0.06083744, -1.539441, 1, 1, 1, 1, 1,
-0.3015236, 0.08291893, -2.477927, 1, 1, 1, 1, 1,
-0.3000104, -0.4600271, -0.7042406, 1, 1, 1, 1, 1,
-0.2974655, -2.385309, -1.697658, 1, 1, 1, 1, 1,
-0.2966708, -0.3946756, -3.263097, 1, 1, 1, 1, 1,
-0.2961609, -0.1432857, -1.850224, 1, 1, 1, 1, 1,
-0.2955968, -0.1272403, -2.457428, 1, 1, 1, 1, 1,
-0.2927348, -0.6086414, -2.646533, 1, 1, 1, 1, 1,
-0.2910204, 0.5008543, 0.02663831, 1, 1, 1, 1, 1,
-0.2902268, 2.606977, 0.5435963, 1, 1, 1, 1, 1,
-0.2894559, -1.212972, -3.987695, 0, 0, 1, 1, 1,
-0.2884086, -0.2810675, -2.956829, 1, 0, 0, 1, 1,
-0.2872567, 0.07670141, -1.16921, 1, 0, 0, 1, 1,
-0.2859381, -0.9609169, -3.821095, 1, 0, 0, 1, 1,
-0.2845169, 0.1564726, -0.5530145, 1, 0, 0, 1, 1,
-0.281647, 0.006170712, -1.872874, 1, 0, 0, 1, 1,
-0.276724, 0.1698232, -0.7676185, 0, 0, 0, 1, 1,
-0.275191, 1.312135, -0.2953905, 0, 0, 0, 1, 1,
-0.2750868, 1.142782, -1.63393, 0, 0, 0, 1, 1,
-0.2748537, 1.398544, 0.003282739, 0, 0, 0, 1, 1,
-0.2718832, -1.22226, -2.225181, 0, 0, 0, 1, 1,
-0.2713626, -0.09167185, -0.7027756, 0, 0, 0, 1, 1,
-0.2713606, -1.091222, -1.982107, 0, 0, 0, 1, 1,
-0.2699417, -1.046347, -2.865665, 1, 1, 1, 1, 1,
-0.269854, 0.4542785, -0.5631741, 1, 1, 1, 1, 1,
-0.2671555, 1.547939, -1.335533, 1, 1, 1, 1, 1,
-0.2653769, -0.8477615, -2.916621, 1, 1, 1, 1, 1,
-0.2650578, 0.3664061, -0.1473545, 1, 1, 1, 1, 1,
-0.259156, 1.005324, -0.1696053, 1, 1, 1, 1, 1,
-0.2517207, 1.544419, -0.5248598, 1, 1, 1, 1, 1,
-0.2410295, -0.1925568, -2.716544, 1, 1, 1, 1, 1,
-0.2401435, 1.097408, 0.7725453, 1, 1, 1, 1, 1,
-0.2328097, -0.6911609, -3.245077, 1, 1, 1, 1, 1,
-0.2323836, 1.392604, 0.2927059, 1, 1, 1, 1, 1,
-0.2285313, 0.9615626, -0.1499358, 1, 1, 1, 1, 1,
-0.2232836, -0.1500099, -1.724402, 1, 1, 1, 1, 1,
-0.2221579, -0.3557551, -4.666009, 1, 1, 1, 1, 1,
-0.2215229, 0.3296041, 0.9249651, 1, 1, 1, 1, 1,
-0.2185762, -0.6677236, -1.579004, 0, 0, 1, 1, 1,
-0.2171907, 1.488465, -1.975936, 1, 0, 0, 1, 1,
-0.2103294, 0.9263361, -0.1027891, 1, 0, 0, 1, 1,
-0.2065622, 0.6327624, -0.819482, 1, 0, 0, 1, 1,
-0.2057729, 1.366439, -0.7468877, 1, 0, 0, 1, 1,
-0.2007264, -1.239948, -2.525091, 1, 0, 0, 1, 1,
-0.1997348, 1.340848, 0.6918797, 0, 0, 0, 1, 1,
-0.1997194, 0.1656055, -2.108589, 0, 0, 0, 1, 1,
-0.199322, -0.5370577, -3.480521, 0, 0, 0, 1, 1,
-0.1940842, -1.064124, -3.160311, 0, 0, 0, 1, 1,
-0.1918786, 0.6212243, -0.1058389, 0, 0, 0, 1, 1,
-0.1892795, -1.071679, -1.393037, 0, 0, 0, 1, 1,
-0.1892772, -0.8471779, -4.585538, 0, 0, 0, 1, 1,
-0.1882103, -1.369351, -2.465126, 1, 1, 1, 1, 1,
-0.1804975, 1.616061, -2.19302, 1, 1, 1, 1, 1,
-0.1794773, -1.013649, -4.449489, 1, 1, 1, 1, 1,
-0.1787328, 0.1687772, -0.7755201, 1, 1, 1, 1, 1,
-0.17726, 0.1527546, 0.3787088, 1, 1, 1, 1, 1,
-0.175632, 0.4944037, 0.9686391, 1, 1, 1, 1, 1,
-0.1749029, 0.4741341, 1.534184, 1, 1, 1, 1, 1,
-0.1693336, 1.081101, -0.3091561, 1, 1, 1, 1, 1,
-0.1690039, 0.004214937, -0.7413785, 1, 1, 1, 1, 1,
-0.1675028, -1.248033, -1.539183, 1, 1, 1, 1, 1,
-0.1674676, 0.8158338, 0.288866, 1, 1, 1, 1, 1,
-0.164321, 0.918507, -1.150035, 1, 1, 1, 1, 1,
-0.1636187, 0.4377025, 1.008331, 1, 1, 1, 1, 1,
-0.1619097, -0.6016487, -0.5002908, 1, 1, 1, 1, 1,
-0.1609623, 0.3260421, 0.09127454, 1, 1, 1, 1, 1,
-0.160306, 0.8803819, 1.188622, 0, 0, 1, 1, 1,
-0.1589283, 0.6736374, -0.4230614, 1, 0, 0, 1, 1,
-0.1503626, 0.3825759, -1.456069, 1, 0, 0, 1, 1,
-0.1496786, 1.081897, -0.4018185, 1, 0, 0, 1, 1,
-0.1487244, 0.1509777, -1.303226, 1, 0, 0, 1, 1,
-0.1481891, -0.6564497, -2.785185, 1, 0, 0, 1, 1,
-0.1430671, 0.1303222, 0.2814106, 0, 0, 0, 1, 1,
-0.1380354, -0.3676942, -4.723203, 0, 0, 0, 1, 1,
-0.1371304, -1.594936, -4.551757, 0, 0, 0, 1, 1,
-0.1284756, -0.5573409, -3.722895, 0, 0, 0, 1, 1,
-0.127405, 0.4223142, 1.389459, 0, 0, 0, 1, 1,
-0.125978, -0.2927367, -3.556947, 0, 0, 0, 1, 1,
-0.1256667, 0.7806332, 0.0865283, 0, 0, 0, 1, 1,
-0.1236622, -0.1617109, -3.556517, 1, 1, 1, 1, 1,
-0.1172583, -1.496718, -2.812676, 1, 1, 1, 1, 1,
-0.1156221, 0.792483, 3.062434, 1, 1, 1, 1, 1,
-0.1155465, -0.2023741, -2.17742, 1, 1, 1, 1, 1,
-0.1127825, 1.649189, -0.7949172, 1, 1, 1, 1, 1,
-0.1106217, 1.151336, -0.6187202, 1, 1, 1, 1, 1,
-0.1094856, -0.1894787, -2.1416, 1, 1, 1, 1, 1,
-0.09522353, -0.3274727, -3.84195, 1, 1, 1, 1, 1,
-0.09345828, 0.3939765, -0.3467835, 1, 1, 1, 1, 1,
-0.09005141, 0.08041351, -1.912352, 1, 1, 1, 1, 1,
-0.08538312, 1.01144, 1.486391, 1, 1, 1, 1, 1,
-0.08536722, 1.621286, 1.201318, 1, 1, 1, 1, 1,
-0.08209534, -1.722168, -4.136478, 1, 1, 1, 1, 1,
-0.0798554, -0.9348631, -1.81643, 1, 1, 1, 1, 1,
-0.07438117, 0.08027693, 1.201056, 1, 1, 1, 1, 1,
-0.07412694, -2.001979, -3.360521, 0, 0, 1, 1, 1,
-0.06606556, -0.3393236, -3.360807, 1, 0, 0, 1, 1,
-0.06094138, 0.8927995, -2.139594, 1, 0, 0, 1, 1,
-0.05373704, 0.7823126, -0.189772, 1, 0, 0, 1, 1,
-0.04890749, 0.6558685, -0.5273052, 1, 0, 0, 1, 1,
-0.04881215, -0.6177878, -3.154852, 1, 0, 0, 1, 1,
-0.04872504, -1.352482, -3.25137, 0, 0, 0, 1, 1,
-0.04657942, -1.218606, -3.136282, 0, 0, 0, 1, 1,
-0.04340449, -0.6734843, -3.796861, 0, 0, 0, 1, 1,
-0.04043509, -1.331865, -2.780049, 0, 0, 0, 1, 1,
-0.03735311, -0.5199219, -3.245536, 0, 0, 0, 1, 1,
-0.03500422, -0.8001615, -3.997663, 0, 0, 0, 1, 1,
-0.02622122, -0.1578245, -3.236534, 0, 0, 0, 1, 1,
-0.02467963, -0.937381, -3.603596, 1, 1, 1, 1, 1,
-0.02232598, -0.009141265, -2.069582, 1, 1, 1, 1, 1,
-0.02191183, -0.09950152, -4.032311, 1, 1, 1, 1, 1,
-0.01857647, -0.7987348, -4.102717, 1, 1, 1, 1, 1,
-0.0171271, 0.4876608, -0.5794898, 1, 1, 1, 1, 1,
-0.01472063, -0.1539238, -3.823922, 1, 1, 1, 1, 1,
-0.01433991, -0.6704941, -3.259887, 1, 1, 1, 1, 1,
-0.01416943, 0.8976586, 2.030006, 1, 1, 1, 1, 1,
-0.0110851, -0.1147022, -2.365114, 1, 1, 1, 1, 1,
-0.01044966, -0.03779143, -3.39835, 1, 1, 1, 1, 1,
-0.00865415, -0.5845066, -3.415872, 1, 1, 1, 1, 1,
-0.008598416, 0.609344, -2.829118, 1, 1, 1, 1, 1,
-0.006712229, -1.526238, -4.791466, 1, 1, 1, 1, 1,
-0.001318685, -0.1592433, -3.595162, 1, 1, 1, 1, 1,
0.004171396, 0.9953475, -1.916142, 1, 1, 1, 1, 1,
0.006227795, 0.2531803, -0.1928607, 0, 0, 1, 1, 1,
0.006825882, 0.8407049, 1.268422, 1, 0, 0, 1, 1,
0.00961779, -2.080258, 2.013365, 1, 0, 0, 1, 1,
0.009641944, -0.5320813, 3.652795, 1, 0, 0, 1, 1,
0.01173299, -1.097453, 3.31532, 1, 0, 0, 1, 1,
0.01287113, -0.5167619, 3.148125, 1, 0, 0, 1, 1,
0.01584217, -0.8698333, 2.815763, 0, 0, 0, 1, 1,
0.01712169, -0.7801853, 3.302471, 0, 0, 0, 1, 1,
0.01907079, 0.3110213, 1.388298, 0, 0, 0, 1, 1,
0.02021423, -0.0888997, 2.836495, 0, 0, 0, 1, 1,
0.02096502, 0.7184845, 0.4907051, 0, 0, 0, 1, 1,
0.02187385, -0.9884028, 4.04863, 0, 0, 0, 1, 1,
0.02356154, 0.570314, 1.034028, 0, 0, 0, 1, 1,
0.02386111, 0.4188495, -0.7597325, 1, 1, 1, 1, 1,
0.02595165, -0.2043694, 3.640897, 1, 1, 1, 1, 1,
0.02685741, -0.7335201, 2.273536, 1, 1, 1, 1, 1,
0.02742002, 0.7727514, -0.4890612, 1, 1, 1, 1, 1,
0.02897921, -0.002675144, 1.205361, 1, 1, 1, 1, 1,
0.03017612, -0.4490254, 3.895009, 1, 1, 1, 1, 1,
0.03144172, 0.7664608, -0.1435768, 1, 1, 1, 1, 1,
0.03151845, 1.476385, -0.4073258, 1, 1, 1, 1, 1,
0.03703557, 1.594064, 0.2213884, 1, 1, 1, 1, 1,
0.04334174, 0.9672263, 0.9446844, 1, 1, 1, 1, 1,
0.05153174, 1.216552, -0.3144256, 1, 1, 1, 1, 1,
0.05368297, -0.3352508, 2.336137, 1, 1, 1, 1, 1,
0.05390786, -0.4819683, 4.31087, 1, 1, 1, 1, 1,
0.05479199, -0.4240488, 3.84894, 1, 1, 1, 1, 1,
0.05676004, 1.782914, 0.4019267, 1, 1, 1, 1, 1,
0.05944133, 0.3142476, 0.06330936, 0, 0, 1, 1, 1,
0.06295653, 0.7581968, -0.1449827, 1, 0, 0, 1, 1,
0.0694159, -0.6249909, 2.179317, 1, 0, 0, 1, 1,
0.07022972, 0.005449072, 1.556522, 1, 0, 0, 1, 1,
0.0739297, -0.04559878, 2.935559, 1, 0, 0, 1, 1,
0.07868521, -0.3569895, 2.846305, 1, 0, 0, 1, 1,
0.08144893, -0.9394104, 3.926365, 0, 0, 0, 1, 1,
0.08428244, -1.945992, 3.254761, 0, 0, 0, 1, 1,
0.08530243, 1.391583, -0.5057254, 0, 0, 0, 1, 1,
0.08976878, -0.1348187, 2.580327, 0, 0, 0, 1, 1,
0.09004837, -0.7091464, 1.557833, 0, 0, 0, 1, 1,
0.09630236, 2.141527, 0.4506864, 0, 0, 0, 1, 1,
0.0969869, 0.7280036, 0.8990615, 0, 0, 0, 1, 1,
0.09860972, -0.8507836, 3.538607, 1, 1, 1, 1, 1,
0.1007628, -1.911537, 3.073783, 1, 1, 1, 1, 1,
0.1039863, -1.581534, 2.878507, 1, 1, 1, 1, 1,
0.1063832, 0.3491199, 0.8393816, 1, 1, 1, 1, 1,
0.1067336, 0.3031032, 2.190567, 1, 1, 1, 1, 1,
0.1082846, 0.4733533, 0.9396361, 1, 1, 1, 1, 1,
0.1084096, -1.215254, 1.592786, 1, 1, 1, 1, 1,
0.1104854, 0.4475483, -1.27112, 1, 1, 1, 1, 1,
0.1180875, -0.4937879, 3.697582, 1, 1, 1, 1, 1,
0.1221568, 0.7088468, 0.1885053, 1, 1, 1, 1, 1,
0.1231612, 0.9799286, 0.113706, 1, 1, 1, 1, 1,
0.1232069, 1.2208, -0.01919363, 1, 1, 1, 1, 1,
0.1279429, 1.404521, -0.2839464, 1, 1, 1, 1, 1,
0.1384257, -1.499816, 3.438002, 1, 1, 1, 1, 1,
0.1434567, -1.121406, 2.786661, 1, 1, 1, 1, 1,
0.1459384, -0.2381121, 4.321396, 0, 0, 1, 1, 1,
0.1468243, -1.153586, 3.563768, 1, 0, 0, 1, 1,
0.1534379, -2.247609, 1.717617, 1, 0, 0, 1, 1,
0.1537884, 0.4809503, 1.017346, 1, 0, 0, 1, 1,
0.1546904, -1.613003, 3.435463, 1, 0, 0, 1, 1,
0.1560373, 0.8820322, 0.1377052, 1, 0, 0, 1, 1,
0.1572695, 0.3483751, 0.5469897, 0, 0, 0, 1, 1,
0.1580346, -1.613014, 4.006631, 0, 0, 0, 1, 1,
0.1602652, 0.5167837, -0.8863997, 0, 0, 0, 1, 1,
0.1629664, 0.6196305, -1.043602, 0, 0, 0, 1, 1,
0.1667378, 0.3082931, 2.381433, 0, 0, 0, 1, 1,
0.1692105, 0.9379398, 0.7339447, 0, 0, 0, 1, 1,
0.1702033, -0.6213959, 3.253174, 0, 0, 0, 1, 1,
0.1721237, 0.2276022, 2.76684, 1, 1, 1, 1, 1,
0.1791176, 1.138917, -0.129032, 1, 1, 1, 1, 1,
0.1818669, 0.4108559, -0.4998072, 1, 1, 1, 1, 1,
0.1854916, 0.8806149, 0.3895863, 1, 1, 1, 1, 1,
0.1960428, 1.028763, 0.5521035, 1, 1, 1, 1, 1,
0.1962606, -0.1983048, 2.010509, 1, 1, 1, 1, 1,
0.2002859, 0.5671583, 0.3118009, 1, 1, 1, 1, 1,
0.2004082, -0.5063339, 2.585637, 1, 1, 1, 1, 1,
0.2010452, -0.2178372, 2.145845, 1, 1, 1, 1, 1,
0.2012954, 0.03278177, 0.8394505, 1, 1, 1, 1, 1,
0.2035919, 0.2239863, 0.8692875, 1, 1, 1, 1, 1,
0.2091656, 0.8164839, -0.06126708, 1, 1, 1, 1, 1,
0.2184613, 0.08899076, -0.1847572, 1, 1, 1, 1, 1,
0.2246704, -0.6444231, 1.1086, 1, 1, 1, 1, 1,
0.2262007, -0.3020602, 2.689681, 1, 1, 1, 1, 1,
0.2346861, 0.1176921, 1.643894, 0, 0, 1, 1, 1,
0.24166, 0.9120427, -1.918738, 1, 0, 0, 1, 1,
0.2431938, 1.457031, -0.2884569, 1, 0, 0, 1, 1,
0.2462082, 0.08217709, 1.703489, 1, 0, 0, 1, 1,
0.2476606, -1.314215, 4.859993, 1, 0, 0, 1, 1,
0.2484608, -0.4226429, 1.467129, 1, 0, 0, 1, 1,
0.2502057, 0.1017589, 0.4585404, 0, 0, 0, 1, 1,
0.2524064, -1.215657, 1.864975, 0, 0, 0, 1, 1,
0.2529287, 0.3466942, -0.2316744, 0, 0, 0, 1, 1,
0.2575837, 0.05397452, 2.535063, 0, 0, 0, 1, 1,
0.257651, -0.7487954, 2.071602, 0, 0, 0, 1, 1,
0.2629246, -0.3050129, 2.454471, 0, 0, 0, 1, 1,
0.2662191, -0.6622784, 2.821859, 0, 0, 0, 1, 1,
0.2694419, -0.1985697, 2.057912, 1, 1, 1, 1, 1,
0.2718052, 0.132799, 1.093663, 1, 1, 1, 1, 1,
0.2795303, -0.2899238, 2.58581, 1, 1, 1, 1, 1,
0.2797333, -0.2729693, 3.573439, 1, 1, 1, 1, 1,
0.2817853, 2.798617, 1.522307, 1, 1, 1, 1, 1,
0.288192, -0.2006554, 2.228073, 1, 1, 1, 1, 1,
0.2908989, 0.9926372, 0.4773747, 1, 1, 1, 1, 1,
0.2911841, 1.490806, -0.1584198, 1, 1, 1, 1, 1,
0.2929828, 0.04937054, 3.738203, 1, 1, 1, 1, 1,
0.2945808, 0.05480496, 2.602533, 1, 1, 1, 1, 1,
0.2959066, 0.3134848, 0.4498776, 1, 1, 1, 1, 1,
0.2969193, 0.1505014, 1.769698, 1, 1, 1, 1, 1,
0.2976688, 0.1763358, 2.031242, 1, 1, 1, 1, 1,
0.2993515, 1.474539, -1.414068, 1, 1, 1, 1, 1,
0.3078302, 1.272385, 0.136379, 1, 1, 1, 1, 1,
0.3083897, -1.859235, 2.471367, 0, 0, 1, 1, 1,
0.3100901, 0.3879149, 0.1590838, 1, 0, 0, 1, 1,
0.3151273, -0.7375118, 3.054699, 1, 0, 0, 1, 1,
0.3183427, 0.9855489, 1.252885, 1, 0, 0, 1, 1,
0.318982, 0.4858639, 0.9188875, 1, 0, 0, 1, 1,
0.3245775, -0.08115456, 2.356965, 1, 0, 0, 1, 1,
0.3258337, 0.8211016, -0.5920455, 0, 0, 0, 1, 1,
0.3279434, -0.9290828, 3.437396, 0, 0, 0, 1, 1,
0.3330933, -0.0418807, 1.094787, 0, 0, 0, 1, 1,
0.3354952, 0.8108988, 2.066758, 0, 0, 0, 1, 1,
0.3376671, -0.4583787, 2.466032, 0, 0, 0, 1, 1,
0.3390987, 0.1883166, 1.613493, 0, 0, 0, 1, 1,
0.3408474, 0.7574061, 0.1751788, 0, 0, 0, 1, 1,
0.3451491, -1.736192, 3.00493, 1, 1, 1, 1, 1,
0.3479843, 0.3689792, 2.026002, 1, 1, 1, 1, 1,
0.3496424, 0.6937705, -0.285219, 1, 1, 1, 1, 1,
0.3554935, 1.199226, -0.2295459, 1, 1, 1, 1, 1,
0.3556779, -1.186515, 3.841519, 1, 1, 1, 1, 1,
0.3558451, 0.7532822, -0.5898582, 1, 1, 1, 1, 1,
0.3597429, -0.6948168, 0.9240654, 1, 1, 1, 1, 1,
0.3598256, -0.2376161, 1.950149, 1, 1, 1, 1, 1,
0.361526, 1.227971, 0.6930776, 1, 1, 1, 1, 1,
0.3623427, 0.008043774, 1.165738, 1, 1, 1, 1, 1,
0.3633034, 0.5381202, 1.596553, 1, 1, 1, 1, 1,
0.3641739, -0.9836321, 2.17685, 1, 1, 1, 1, 1,
0.3654478, -1.406438, 3.933689, 1, 1, 1, 1, 1,
0.3675851, 0.7431392, 2.024834, 1, 1, 1, 1, 1,
0.3692901, -0.3676556, 1.262923, 1, 1, 1, 1, 1,
0.3714213, 0.3398242, 1.649503, 0, 0, 1, 1, 1,
0.3717958, 1.313066, -1.150427, 1, 0, 0, 1, 1,
0.377656, 0.7320094, -0.419676, 1, 0, 0, 1, 1,
0.3780835, -1.880164, 2.873821, 1, 0, 0, 1, 1,
0.3785361, 1.426723, 1.21075, 1, 0, 0, 1, 1,
0.3807615, -0.8510514, 4.123775, 1, 0, 0, 1, 1,
0.3846409, 0.8121131, 1.447022, 0, 0, 0, 1, 1,
0.3866596, -0.3901537, 2.192657, 0, 0, 0, 1, 1,
0.389182, 0.1991882, 0.7526401, 0, 0, 0, 1, 1,
0.3918185, -1.041898, 2.380721, 0, 0, 0, 1, 1,
0.3920473, -0.6283154, 5.086712, 0, 0, 0, 1, 1,
0.3940025, 0.2063925, 2.983191, 0, 0, 0, 1, 1,
0.3961726, 0.1560088, 2.424118, 0, 0, 0, 1, 1,
0.402555, 1.36321, -1.022032, 1, 1, 1, 1, 1,
0.4043844, -1.616892, 2.544719, 1, 1, 1, 1, 1,
0.4066759, -0.8671327, 2.738142, 1, 1, 1, 1, 1,
0.4092998, 0.879113, 0.6397171, 1, 1, 1, 1, 1,
0.4095977, 0.445716, 0.2713791, 1, 1, 1, 1, 1,
0.4167762, -0.4958597, 1.706285, 1, 1, 1, 1, 1,
0.416862, -0.1326734, 0.9176034, 1, 1, 1, 1, 1,
0.4170856, -1.72302, 1.965082, 1, 1, 1, 1, 1,
0.418478, 0.188287, 1.655411, 1, 1, 1, 1, 1,
0.4193453, -0.6665432, 3.304443, 1, 1, 1, 1, 1,
0.422316, -0.9421116, 3.599936, 1, 1, 1, 1, 1,
0.42333, -1.111226, 3.066017, 1, 1, 1, 1, 1,
0.4242934, 0.7705282, 1.026033, 1, 1, 1, 1, 1,
0.4247356, 2.379285, -1.126651, 1, 1, 1, 1, 1,
0.4258671, -0.3873917, 2.030119, 1, 1, 1, 1, 1,
0.4287724, -1.582571, 1.775086, 0, 0, 1, 1, 1,
0.4295336, -0.002632677, -0.2232323, 1, 0, 0, 1, 1,
0.4324228, 0.8941455, 0.1052748, 1, 0, 0, 1, 1,
0.4371168, 0.763051, 0.5700626, 1, 0, 0, 1, 1,
0.4458809, -1.28828, 1.666951, 1, 0, 0, 1, 1,
0.4461465, 1.363803, 0.9790043, 1, 0, 0, 1, 1,
0.4550971, -1.437101, 2.915145, 0, 0, 0, 1, 1,
0.457444, 1.352391, 1.056388, 0, 0, 0, 1, 1,
0.4579154, 1.572936, 1.482747, 0, 0, 0, 1, 1,
0.4612249, -0.6898685, 2.352174, 0, 0, 0, 1, 1,
0.4618593, -0.5412206, 3.002177, 0, 0, 0, 1, 1,
0.4647432, -0.5523954, 3.317335, 0, 0, 0, 1, 1,
0.4704387, 0.8826047, 1.984817, 0, 0, 0, 1, 1,
0.4711836, -1.324551, 3.256271, 1, 1, 1, 1, 1,
0.4752667, -1.310577, 1.692146, 1, 1, 1, 1, 1,
0.475971, 0.07961664, 2.512904, 1, 1, 1, 1, 1,
0.4777273, -0.5623869, 2.41308, 1, 1, 1, 1, 1,
0.4789924, -0.2020938, 1.6819, 1, 1, 1, 1, 1,
0.4808849, 1.312909, 1.035428, 1, 1, 1, 1, 1,
0.4837674, -1.637959, 0.6077229, 1, 1, 1, 1, 1,
0.4860645, -1.673329, 2.873832, 1, 1, 1, 1, 1,
0.4904156, 0.1413876, 2.508934, 1, 1, 1, 1, 1,
0.4909151, -0.5879387, 2.922123, 1, 1, 1, 1, 1,
0.4936489, -0.01409762, -0.1506921, 1, 1, 1, 1, 1,
0.4960432, -0.1447646, 0.8527203, 1, 1, 1, 1, 1,
0.496768, -1.560185, 4.426539, 1, 1, 1, 1, 1,
0.4992695, 2.912859, 0.4253061, 1, 1, 1, 1, 1,
0.5076405, -1.762052, 3.514867, 1, 1, 1, 1, 1,
0.5092118, 1.550116, -1.348061, 0, 0, 1, 1, 1,
0.5105265, 0.6054135, 1.44508, 1, 0, 0, 1, 1,
0.5112504, -0.5627367, 3.209468, 1, 0, 0, 1, 1,
0.5134857, -0.5742678, 1.340272, 1, 0, 0, 1, 1,
0.5137585, -1.282163, 2.935169, 1, 0, 0, 1, 1,
0.5183747, -0.3241831, 1.134079, 1, 0, 0, 1, 1,
0.5188901, 0.5173863, 0.861128, 0, 0, 0, 1, 1,
0.5193166, -0.1350368, 2.541978, 0, 0, 0, 1, 1,
0.5194302, -0.8589314, 2.126679, 0, 0, 0, 1, 1,
0.5204281, -0.4002169, 2.314309, 0, 0, 0, 1, 1,
0.5207268, 0.9357588, 0.03254261, 0, 0, 0, 1, 1,
0.5217669, -1.131538, 4.243886, 0, 0, 0, 1, 1,
0.5246709, 0.09347685, 0.5924637, 0, 0, 0, 1, 1,
0.5263638, -0.622203, 0.6490665, 1, 1, 1, 1, 1,
0.5282323, 1.254789, 0.01094098, 1, 1, 1, 1, 1,
0.5406099, -0.381935, 1.389863, 1, 1, 1, 1, 1,
0.5412506, -0.3531638, 2.658913, 1, 1, 1, 1, 1,
0.5417449, -0.3244718, 2.599372, 1, 1, 1, 1, 1,
0.5433397, 0.9249809, 0.7526389, 1, 1, 1, 1, 1,
0.5471636, 0.7353723, -0.2777787, 1, 1, 1, 1, 1,
0.5506471, 1.325945, -0.7175526, 1, 1, 1, 1, 1,
0.5578349, 0.7838308, 1.45916, 1, 1, 1, 1, 1,
0.5614455, -0.3198622, 0.342018, 1, 1, 1, 1, 1,
0.5684003, -0.605148, 5.054814, 1, 1, 1, 1, 1,
0.5695482, 0.2687815, -0.2563452, 1, 1, 1, 1, 1,
0.5712366, -0.06900569, 0.8204584, 1, 1, 1, 1, 1,
0.5787017, -0.003466614, 2.813063, 1, 1, 1, 1, 1,
0.5870795, -1.139891, 1.619897, 1, 1, 1, 1, 1,
0.5935563, -0.4205758, 1.397804, 0, 0, 1, 1, 1,
0.6040908, -1.032323, 4.620345, 1, 0, 0, 1, 1,
0.6064907, -0.358571, 1.36248, 1, 0, 0, 1, 1,
0.6068117, -0.2248141, 2.711105, 1, 0, 0, 1, 1,
0.6086653, -0.4259378, 2.125523, 1, 0, 0, 1, 1,
0.6118322, -0.06084385, 0.8843334, 1, 0, 0, 1, 1,
0.6134639, -0.1135306, 2.976192, 0, 0, 0, 1, 1,
0.6189673, 0.5001417, 2.508767, 0, 0, 0, 1, 1,
0.6190934, -1.142542, 3.707616, 0, 0, 0, 1, 1,
0.6219926, -1.554806, 3.548055, 0, 0, 0, 1, 1,
0.622027, -0.05093572, 1.813071, 0, 0, 0, 1, 1,
0.6225992, 0.7731153, 1.986757, 0, 0, 0, 1, 1,
0.6226134, -0.734521, 3.595038, 0, 0, 0, 1, 1,
0.627836, -1.031183, 3.198185, 1, 1, 1, 1, 1,
0.6312273, -0.1107598, 0.3095275, 1, 1, 1, 1, 1,
0.641936, 1.688769, 0.2236157, 1, 1, 1, 1, 1,
0.6434911, 0.9832362, 2.610168, 1, 1, 1, 1, 1,
0.6455605, 0.6111996, 0.2524238, 1, 1, 1, 1, 1,
0.6458838, -1.3043, 3.191614, 1, 1, 1, 1, 1,
0.649645, -1.241941, 5.428167, 1, 1, 1, 1, 1,
0.6515001, 0.5959261, 2.684541, 1, 1, 1, 1, 1,
0.6523503, -0.2027679, 3.401466, 1, 1, 1, 1, 1,
0.6554495, 0.4957987, 1.693675, 1, 1, 1, 1, 1,
0.6563811, -0.6968884, 1.622499, 1, 1, 1, 1, 1,
0.6571289, -0.09793707, 2.280002, 1, 1, 1, 1, 1,
0.6575889, -0.05928797, 2.543923, 1, 1, 1, 1, 1,
0.6621599, -2.244488, 2.580989, 1, 1, 1, 1, 1,
0.6632208, 0.1883403, 1.829226, 1, 1, 1, 1, 1,
0.6715246, 1.697487, -0.8037345, 0, 0, 1, 1, 1,
0.6717143, -1.145614, 1.48254, 1, 0, 0, 1, 1,
0.6732572, -0.4084922, 3.205762, 1, 0, 0, 1, 1,
0.6737193, -0.4133103, 2.196425, 1, 0, 0, 1, 1,
0.6814248, 0.5571036, 0.1184001, 1, 0, 0, 1, 1,
0.6848783, -0.4811201, 1.150495, 1, 0, 0, 1, 1,
0.6872516, 2.071704, 0.6187371, 0, 0, 0, 1, 1,
0.6924313, 0.260989, 1.327939, 0, 0, 0, 1, 1,
0.6942859, -0.8907927, 2.661406, 0, 0, 0, 1, 1,
0.6965689, 1.186292, -0.1145758, 0, 0, 0, 1, 1,
0.6990258, 1.156988, 0.7910039, 0, 0, 0, 1, 1,
0.7012895, 0.461369, 1.772856, 0, 0, 0, 1, 1,
0.7037366, 0.4102379, 2.531113, 0, 0, 0, 1, 1,
0.7086739, -0.3782637, 3.286385, 1, 1, 1, 1, 1,
0.7092654, -0.6537895, 0.8739964, 1, 1, 1, 1, 1,
0.7100815, -0.4413669, 2.490806, 1, 1, 1, 1, 1,
0.7152308, -1.040681, 2.20919, 1, 1, 1, 1, 1,
0.7157642, 0.06564252, 0.3254598, 1, 1, 1, 1, 1,
0.7157901, -0.2718191, 2.304324, 1, 1, 1, 1, 1,
0.7192515, -1.057931, 3.264489, 1, 1, 1, 1, 1,
0.7194993, 0.1803136, 1.817445, 1, 1, 1, 1, 1,
0.723012, 1.309283, 1.751148, 1, 1, 1, 1, 1,
0.7309795, -1.196952, 4.318568, 1, 1, 1, 1, 1,
0.7349119, 0.543517, 1.647558, 1, 1, 1, 1, 1,
0.7419674, -0.2872391, 2.093853, 1, 1, 1, 1, 1,
0.7442016, 0.305747, 1.319763, 1, 1, 1, 1, 1,
0.7456296, 0.7227386, 1.534422, 1, 1, 1, 1, 1,
0.7487218, 0.04623696, 1.196233, 1, 1, 1, 1, 1,
0.7505789, 0.2279806, 1.073599, 0, 0, 1, 1, 1,
0.7596637, -0.6657417, 2.454054, 1, 0, 0, 1, 1,
0.7611914, -0.2624608, 2.012079, 1, 0, 0, 1, 1,
0.7620969, 2.522735, 1.775448, 1, 0, 0, 1, 1,
0.7635733, 1.441208, 0.3763117, 1, 0, 0, 1, 1,
0.7711219, -0.4988688, 1.754095, 1, 0, 0, 1, 1,
0.7732058, -0.9990064, 3.336059, 0, 0, 0, 1, 1,
0.7749683, -1.506209, 1.918966, 0, 0, 0, 1, 1,
0.7763993, -0.2209071, 0.7191327, 0, 0, 0, 1, 1,
0.7793149, -0.2705608, 2.855514, 0, 0, 0, 1, 1,
0.7825325, -0.04322937, 2.30181, 0, 0, 0, 1, 1,
0.7835553, -1.560817, 2.542492, 0, 0, 0, 1, 1,
0.7849228, -0.8530324, 2.722297, 0, 0, 0, 1, 1,
0.787281, -0.5344238, 1.002471, 1, 1, 1, 1, 1,
0.7873323, -0.374211, 3.871073, 1, 1, 1, 1, 1,
0.7892448, 0.2276907, 2.824693, 1, 1, 1, 1, 1,
0.789576, 0.8591976, 1.590803, 1, 1, 1, 1, 1,
0.7930709, 0.6323679, 3.11364, 1, 1, 1, 1, 1,
0.8003405, 0.7729392, 0.1597625, 1, 1, 1, 1, 1,
0.8051822, -0.1876488, -0.0009821312, 1, 1, 1, 1, 1,
0.8104708, 1.807943, 0.5157458, 1, 1, 1, 1, 1,
0.8163654, -0.8868036, 1.227143, 1, 1, 1, 1, 1,
0.8181123, 0.5408004, 1.483565, 1, 1, 1, 1, 1,
0.818362, -0.6672078, 2.884312, 1, 1, 1, 1, 1,
0.8184286, 0.2545143, 0.2839598, 1, 1, 1, 1, 1,
0.8204954, 0.9999154, 1.075639, 1, 1, 1, 1, 1,
0.8239459, -0.4015616, 2.755495, 1, 1, 1, 1, 1,
0.8243361, 1.852339, -0.5671659, 1, 1, 1, 1, 1,
0.829421, 2.175646, -0.2450504, 0, 0, 1, 1, 1,
0.8320852, 1.221746, -0.08633836, 1, 0, 0, 1, 1,
0.8321768, 0.2964143, 2.634291, 1, 0, 0, 1, 1,
0.834435, -0.5813346, 2.380951, 1, 0, 0, 1, 1,
0.8422931, -0.2042008, 1.214948, 1, 0, 0, 1, 1,
0.8435489, 1.170036, -0.2339461, 1, 0, 0, 1, 1,
0.8472276, 0.4731318, 1.187898, 0, 0, 0, 1, 1,
0.84727, -0.9638532, 2.572422, 0, 0, 0, 1, 1,
0.8474185, -0.2532524, 0.7434892, 0, 0, 0, 1, 1,
0.848268, 1.204704, 2.621814, 0, 0, 0, 1, 1,
0.8500102, -0.2132423, 1.74888, 0, 0, 0, 1, 1,
0.8513609, -0.2594536, -0.780947, 0, 0, 0, 1, 1,
0.8513952, 1.167579, -0.2681693, 0, 0, 0, 1, 1,
0.8562729, -0.3797325, 4.181663, 1, 1, 1, 1, 1,
0.8595645, -1.932775, 2.938014, 1, 1, 1, 1, 1,
0.8614735, 0.8781344, -1.365395, 1, 1, 1, 1, 1,
0.8615624, -1.459043, 1.764685, 1, 1, 1, 1, 1,
0.8621784, 0.8358981, 2.786422, 1, 1, 1, 1, 1,
0.8647696, -1.177745, 1.920877, 1, 1, 1, 1, 1,
0.869706, -0.07781428, 1.040374, 1, 1, 1, 1, 1,
0.8785711, 1.286149, -1.204303, 1, 1, 1, 1, 1,
0.8797743, 0.7180164, 1.203009, 1, 1, 1, 1, 1,
0.8807079, 0.1418058, 0.3893772, 1, 1, 1, 1, 1,
0.8825678, 0.1679594, 0.8080559, 1, 1, 1, 1, 1,
0.8839889, 0.5065947, 1.322681, 1, 1, 1, 1, 1,
0.8847203, -0.1230631, -0.5501719, 1, 1, 1, 1, 1,
0.886765, 1.809578, 1.916936, 1, 1, 1, 1, 1,
0.8869663, 0.2417341, 0.5331644, 1, 1, 1, 1, 1,
0.8872605, 0.4492157, 1.648914, 0, 0, 1, 1, 1,
0.9004607, -1.62072, 2.306681, 1, 0, 0, 1, 1,
0.9028996, 0.6585689, 1.764648, 1, 0, 0, 1, 1,
0.9068585, 0.03667385, 2.871269, 1, 0, 0, 1, 1,
0.9162104, -1.1371, 1.839225, 1, 0, 0, 1, 1,
0.9178352, -1.221233, 2.382983, 1, 0, 0, 1, 1,
0.9203458, 0.7907233, 0.07400186, 0, 0, 0, 1, 1,
0.9213428, -0.3734596, 2.84081, 0, 0, 0, 1, 1,
0.9223702, -0.8079675, 3.756173, 0, 0, 0, 1, 1,
0.9233837, -0.8204194, 0.5496649, 0, 0, 0, 1, 1,
0.9234617, -0.3040111, 0.6942422, 0, 0, 0, 1, 1,
0.9257981, 1.318369, 1.787148, 0, 0, 0, 1, 1,
0.9289268, 0.6148692, 1.672302, 0, 0, 0, 1, 1,
0.9294356, 0.9981868, -0.5190248, 1, 1, 1, 1, 1,
0.9467669, 0.7410268, 1.865992, 1, 1, 1, 1, 1,
0.9497402, -0.3971252, 0.8189214, 1, 1, 1, 1, 1,
0.9638391, 0.651823, 2.030137, 1, 1, 1, 1, 1,
0.9754627, 0.8713927, -0.004523245, 1, 1, 1, 1, 1,
0.9827855, 1.23076, 2.166958, 1, 1, 1, 1, 1,
0.986309, 0.5181735, -0.3886957, 1, 1, 1, 1, 1,
0.9902675, -0.8772051, 2.441091, 1, 1, 1, 1, 1,
0.9944164, 1.048616, 0.1989589, 1, 1, 1, 1, 1,
1.004615, 1.117214, 1.230676, 1, 1, 1, 1, 1,
1.010701, 0.6553532, 0.5920205, 1, 1, 1, 1, 1,
1.010756, -1.96818, 3.455101, 1, 1, 1, 1, 1,
1.011648, -0.5571735, 3.002568, 1, 1, 1, 1, 1,
1.021917, 1.039389, 0.6867494, 1, 1, 1, 1, 1,
1.026145, -0.9048525, 2.284249, 1, 1, 1, 1, 1,
1.031558, -1.165696, 3.520145, 0, 0, 1, 1, 1,
1.039464, 2.596244, 0.7572165, 1, 0, 0, 1, 1,
1.04563, 1.625302, -0.7707091, 1, 0, 0, 1, 1,
1.049152, 1.71409, -0.03099668, 1, 0, 0, 1, 1,
1.052765, -0.9343441, 3.253099, 1, 0, 0, 1, 1,
1.060961, -0.4798739, 1.376988, 1, 0, 0, 1, 1,
1.070302, 1.070454, -0.1552548, 0, 0, 0, 1, 1,
1.070359, 0.728403, 0.9714068, 0, 0, 0, 1, 1,
1.074819, -0.2717756, 2.786571, 0, 0, 0, 1, 1,
1.076319, 0.5219715, 0.9881092, 0, 0, 0, 1, 1,
1.078147, -1.162313, 3.387172, 0, 0, 0, 1, 1,
1.07841, -0.7956435, 0.9698968, 0, 0, 0, 1, 1,
1.086138, 1.74688, 1.437132, 0, 0, 0, 1, 1,
1.101336, 0.8047206, -0.712292, 1, 1, 1, 1, 1,
1.104363, -1.229434, 3.984835, 1, 1, 1, 1, 1,
1.111658, 0.8955806, 1.741982, 1, 1, 1, 1, 1,
1.119462, 0.3852298, 2.4153, 1, 1, 1, 1, 1,
1.123021, 0.672135, 0.2806561, 1, 1, 1, 1, 1,
1.127766, -0.9866495, 0.7197422, 1, 1, 1, 1, 1,
1.132654, 1.010116, 1.853995, 1, 1, 1, 1, 1,
1.134624, -0.2307529, 0.7218255, 1, 1, 1, 1, 1,
1.147289, -0.1648646, 3.454789, 1, 1, 1, 1, 1,
1.148022, -0.4065465, 3.992181, 1, 1, 1, 1, 1,
1.150616, 1.099476, 0.6839281, 1, 1, 1, 1, 1,
1.167391, 0.5144261, 1.58677, 1, 1, 1, 1, 1,
1.170356, 0.1510396, 0.9082331, 1, 1, 1, 1, 1,
1.170792, 0.846813, 2.049781, 1, 1, 1, 1, 1,
1.180483, -0.5380726, 2.246952, 1, 1, 1, 1, 1,
1.192085, -0.1840029, 1.301965, 0, 0, 1, 1, 1,
1.194976, -2.880018, 5.106921, 1, 0, 0, 1, 1,
1.20938, -2.146301, 2.472044, 1, 0, 0, 1, 1,
1.21982, 0.9413333, 3.555116, 1, 0, 0, 1, 1,
1.232762, 0.07447511, 1.89333, 1, 0, 0, 1, 1,
1.243902, 0.7982118, 1.587396, 1, 0, 0, 1, 1,
1.249626, 0.3118648, 0.9554868, 0, 0, 0, 1, 1,
1.252194, 2.170357, 1.688423, 0, 0, 0, 1, 1,
1.254258, 1.090648, 0.5006239, 0, 0, 0, 1, 1,
1.263928, 0.1360883, 0.7148268, 0, 0, 0, 1, 1,
1.268906, 0.9163801, -0.6832932, 0, 0, 0, 1, 1,
1.270073, -0.2568267, 2.577955, 0, 0, 0, 1, 1,
1.270601, 0.124892, -0.03272469, 0, 0, 0, 1, 1,
1.272038, 0.4032215, 2.341444, 1, 1, 1, 1, 1,
1.274585, -1.158075, 2.988536, 1, 1, 1, 1, 1,
1.284877, 1.326233, 1.594774, 1, 1, 1, 1, 1,
1.286228, -0.4048235, 1.212392, 1, 1, 1, 1, 1,
1.289404, -0.3816441, 3.631642, 1, 1, 1, 1, 1,
1.308914, 0.01563978, -0.1518938, 1, 1, 1, 1, 1,
1.315247, -0.2534779, 2.310418, 1, 1, 1, 1, 1,
1.319131, -0.6467226, 2.825643, 1, 1, 1, 1, 1,
1.34808, 0.2045861, 2.66775, 1, 1, 1, 1, 1,
1.349406, -1.656686, 1.297867, 1, 1, 1, 1, 1,
1.350861, 0.5954213, -0.7097421, 1, 1, 1, 1, 1,
1.35516, -0.7091529, 0.1127964, 1, 1, 1, 1, 1,
1.365121, 0.2019872, 1.157854, 1, 1, 1, 1, 1,
1.375833, -0.6795712, 1.622574, 1, 1, 1, 1, 1,
1.382536, -0.1971979, 1.257465, 1, 1, 1, 1, 1,
1.384964, 1.360414, 1.818861, 0, 0, 1, 1, 1,
1.411132, -0.4420833, 1.852631, 1, 0, 0, 1, 1,
1.416131, -0.9718061, 0.8814594, 1, 0, 0, 1, 1,
1.417702, 0.4795326, 2.805401, 1, 0, 0, 1, 1,
1.418903, -0.3067674, 1.425154, 1, 0, 0, 1, 1,
1.434313, -0.4250474, -0.707268, 1, 0, 0, 1, 1,
1.437154, 0.7764091, 1.291853, 0, 0, 0, 1, 1,
1.441566, 0.4385929, 0.652685, 0, 0, 0, 1, 1,
1.467687, 0.2507319, 0.2015159, 0, 0, 0, 1, 1,
1.468279, 1.285401, 0.07976544, 0, 0, 0, 1, 1,
1.479177, -0.9227963, 3.3453, 0, 0, 0, 1, 1,
1.484195, 0.4322543, 1.467906, 0, 0, 0, 1, 1,
1.492445, 0.2190806, 2.499156, 0, 0, 0, 1, 1,
1.504395, 0.2686396, 2.385919, 1, 1, 1, 1, 1,
1.506021, 0.8581535, -0.09064185, 1, 1, 1, 1, 1,
1.509212, -0.5514469, 2.144794, 1, 1, 1, 1, 1,
1.509843, 2.333161, -0.1875924, 1, 1, 1, 1, 1,
1.514983, -0.168647, 1.867455, 1, 1, 1, 1, 1,
1.519967, -1.612985, 2.292091, 1, 1, 1, 1, 1,
1.535827, 1.591727, 0.1480069, 1, 1, 1, 1, 1,
1.549725, -1.088675, 1.44709, 1, 1, 1, 1, 1,
1.558996, 0.9198308, 1.648202, 1, 1, 1, 1, 1,
1.561033, -1.271035, 1.578474, 1, 1, 1, 1, 1,
1.567163, -0.1910706, 2.186236, 1, 1, 1, 1, 1,
1.591649, 1.302387, -0.2404882, 1, 1, 1, 1, 1,
1.60085, 0.8513641, 2.531747, 1, 1, 1, 1, 1,
1.636871, 0.4777849, -1.047842, 1, 1, 1, 1, 1,
1.643885, -0.8718513, 1.714869, 1, 1, 1, 1, 1,
1.671554, 0.7853439, 0.814424, 0, 0, 1, 1, 1,
1.682173, -2.061824, 2.506819, 1, 0, 0, 1, 1,
1.691642, 0.6613719, 2.497572, 1, 0, 0, 1, 1,
1.703492, 0.4113754, 2.19419, 1, 0, 0, 1, 1,
1.707363, 0.251199, 1.392174, 1, 0, 0, 1, 1,
1.732776, 2.824795, 0.1594219, 1, 0, 0, 1, 1,
1.747365, -0.9221912, 5.108841, 0, 0, 0, 1, 1,
1.759546, 1.112507, 2.340704, 0, 0, 0, 1, 1,
1.777198, 0.001304745, 3.163662, 0, 0, 0, 1, 1,
1.778112, -0.5387281, -0.8510236, 0, 0, 0, 1, 1,
1.788489, -0.4955823, 1.420803, 0, 0, 0, 1, 1,
1.790027, -0.2920446, 1.5831, 0, 0, 0, 1, 1,
1.790062, -0.1867169, 2.208506, 0, 0, 0, 1, 1,
1.800756, 0.1938868, 0.4257607, 1, 1, 1, 1, 1,
1.81302, -1.542388, 2.422752, 1, 1, 1, 1, 1,
1.823705, -0.2149499, -0.872546, 1, 1, 1, 1, 1,
1.825363, -1.421457, 2.253064, 1, 1, 1, 1, 1,
1.848006, 0.07992951, 1.78839, 1, 1, 1, 1, 1,
1.853981, -1.404892, 2.36443, 1, 1, 1, 1, 1,
1.858926, -1.479402, 2.794314, 1, 1, 1, 1, 1,
1.866075, -1.977841, 0.6612541, 1, 1, 1, 1, 1,
1.872905, 2.504781, 0.5221435, 1, 1, 1, 1, 1,
1.905282, -0.8055736, 0.528787, 1, 1, 1, 1, 1,
1.943921, 0.005917162, 1.832332, 1, 1, 1, 1, 1,
1.947347, 0.9340172, 0.7472129, 1, 1, 1, 1, 1,
1.954658, -0.3280091, 0.6123898, 1, 1, 1, 1, 1,
1.957586, -0.1338795, 1.49679, 1, 1, 1, 1, 1,
1.97079, -0.5330895, 0.825955, 1, 1, 1, 1, 1,
2.02671, 1.537506, 1.803327, 0, 0, 1, 1, 1,
2.037443, -1.519827, 1.469026, 1, 0, 0, 1, 1,
2.067428, 0.1808805, -1.157097, 1, 0, 0, 1, 1,
2.073788, -1.077763, 0.8444937, 1, 0, 0, 1, 1,
2.074005, 0.9280591, 3.049487, 1, 0, 0, 1, 1,
2.086638, 0.7397926, 2.237611, 1, 0, 0, 1, 1,
2.099524, 0.1363718, 2.491621, 0, 0, 0, 1, 1,
2.170065, -0.9852906, 0.7987147, 0, 0, 0, 1, 1,
2.218742, -0.8413939, 1.08481, 0, 0, 0, 1, 1,
2.282131, -0.4420138, 2.968627, 0, 0, 0, 1, 1,
2.32659, 0.9515003, 1.987055, 0, 0, 0, 1, 1,
2.387636, 1.401588, 0.9993549, 0, 0, 0, 1, 1,
2.421483, 0.3925282, 1.849355, 0, 0, 0, 1, 1,
2.45139, 0.8044682, -0.1880507, 1, 1, 1, 1, 1,
2.455092, 0.3753715, 1.096201, 1, 1, 1, 1, 1,
2.519022, -1.545038, 1.639843, 1, 1, 1, 1, 1,
2.543871, -1.319736, 2.440321, 1, 1, 1, 1, 1,
2.557981, -0.2454005, 2.736943, 1, 1, 1, 1, 1,
2.571534, -0.3549383, 0.09247468, 1, 1, 1, 1, 1,
2.820126, 1.222746, 1.225495, 1, 1, 1, 1, 1
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
var radius = 9.29011;
var distance = 32.63112;
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
mvMatrix.translate( 0.3863255, -0.01642025, -0.2272859 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.63112);
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
