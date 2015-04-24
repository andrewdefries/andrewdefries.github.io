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
-3.400886, 0.6590499, -0.6153366, 1, 0, 0, 1,
-3.157505, 0.02923951, -0.6248312, 1, 0.007843138, 0, 1,
-3.045634, 0.1342375, -1.115019, 1, 0.01176471, 0, 1,
-2.868031, 0.5514199, 0.6633675, 1, 0.01960784, 0, 1,
-2.862754, -0.1154881, -3.879224, 1, 0.02352941, 0, 1,
-2.725979, 1.088629, -0.7793787, 1, 0.03137255, 0, 1,
-2.710395, 0.645848, -0.943593, 1, 0.03529412, 0, 1,
-2.619593, -0.2282244, 0.7446803, 1, 0.04313726, 0, 1,
-2.401586, 0.8754346, -1.314558, 1, 0.04705882, 0, 1,
-2.350693, -0.9008835, -1.91535, 1, 0.05490196, 0, 1,
-2.305487, -0.6775863, -2.743302, 1, 0.05882353, 0, 1,
-2.250341, 0.2203964, -3.149674, 1, 0.06666667, 0, 1,
-2.198723, -0.5999156, -1.403159, 1, 0.07058824, 0, 1,
-2.146087, -0.1085412, -1.276016, 1, 0.07843138, 0, 1,
-2.143163, -0.7475075, -1.145579, 1, 0.08235294, 0, 1,
-2.139748, -1.425521, -1.342647, 1, 0.09019608, 0, 1,
-2.122245, -1.532967, -3.182313, 1, 0.09411765, 0, 1,
-2.017632, 0.2585071, -0.7327648, 1, 0.1019608, 0, 1,
-1.985267, 0.5544118, -1.413662, 1, 0.1098039, 0, 1,
-1.974722, 0.3772547, -2.815459, 1, 0.1137255, 0, 1,
-1.968294, -0.7531284, -2.072312, 1, 0.1215686, 0, 1,
-1.962854, 0.9776627, -1.444548, 1, 0.1254902, 0, 1,
-1.960937, 0.106957, -0.7203479, 1, 0.1333333, 0, 1,
-1.957199, -0.4505938, -3.084846, 1, 0.1372549, 0, 1,
-1.947729, -0.8673921, -0.3766183, 1, 0.145098, 0, 1,
-1.943131, 0.2379209, -0.6533823, 1, 0.1490196, 0, 1,
-1.93522, -0.7552493, -1.107867, 1, 0.1568628, 0, 1,
-1.929599, 0.1310479, -0.1002528, 1, 0.1607843, 0, 1,
-1.926388, 0.2343573, -0.2049388, 1, 0.1686275, 0, 1,
-1.914645, 0.4452657, -2.493962, 1, 0.172549, 0, 1,
-1.911106, 0.0221317, -0.8792956, 1, 0.1803922, 0, 1,
-1.905673, 0.6939194, -0.3212957, 1, 0.1843137, 0, 1,
-1.905339, 0.002643509, -1.39073, 1, 0.1921569, 0, 1,
-1.901266, -0.857425, -0.486225, 1, 0.1960784, 0, 1,
-1.899301, -0.219083, -1.759694, 1, 0.2039216, 0, 1,
-1.898664, -0.4503027, -1.135549, 1, 0.2117647, 0, 1,
-1.894437, -1.604841, -4.866397, 1, 0.2156863, 0, 1,
-1.885025, -0.07594243, -1.213814, 1, 0.2235294, 0, 1,
-1.875827, 1.038316, -2.156545, 1, 0.227451, 0, 1,
-1.867701, -1.960147, -3.876009, 1, 0.2352941, 0, 1,
-1.860094, 0.6651635, -1.813458, 1, 0.2392157, 0, 1,
-1.848474, -0.3005804, -1.551055, 1, 0.2470588, 0, 1,
-1.847876, -0.1823507, -1.910145, 1, 0.2509804, 0, 1,
-1.825302, 1.556068, -0.9463528, 1, 0.2588235, 0, 1,
-1.812289, 0.5909369, -0.4038564, 1, 0.2627451, 0, 1,
-1.807211, 0.01081808, 0.6461565, 1, 0.2705882, 0, 1,
-1.798586, -0.6428958, -2.325372, 1, 0.2745098, 0, 1,
-1.797634, -2.233007, -1.721005, 1, 0.282353, 0, 1,
-1.787369, 0.7690413, -1.024379, 1, 0.2862745, 0, 1,
-1.776778, 0.5098917, 0.5001907, 1, 0.2941177, 0, 1,
-1.772536, 0.171911, -0.3862807, 1, 0.3019608, 0, 1,
-1.772323, 1.95524, 0.2753651, 1, 0.3058824, 0, 1,
-1.75525, -1.121733, -1.098318, 1, 0.3137255, 0, 1,
-1.731081, 0.9260991, -0.4898351, 1, 0.3176471, 0, 1,
-1.716864, 0.7891235, -0.3918997, 1, 0.3254902, 0, 1,
-1.711598, 0.97369, -1.811921, 1, 0.3294118, 0, 1,
-1.707921, -0.02469448, -2.063999, 1, 0.3372549, 0, 1,
-1.695904, 0.4466058, -0.7019398, 1, 0.3411765, 0, 1,
-1.682755, 0.7743397, -1.253894, 1, 0.3490196, 0, 1,
-1.66137, -1.085302, -2.452678, 1, 0.3529412, 0, 1,
-1.65826, 0.9960086, -2.381628, 1, 0.3607843, 0, 1,
-1.654156, 0.07238266, -1.375156, 1, 0.3647059, 0, 1,
-1.647112, 1.825419, -1.839038, 1, 0.372549, 0, 1,
-1.642205, 1.45321, -1.502456, 1, 0.3764706, 0, 1,
-1.637948, 0.2622575, -2.771739, 1, 0.3843137, 0, 1,
-1.633769, -0.5645375, -2.117762, 1, 0.3882353, 0, 1,
-1.632899, -0.5575671, -1.364771, 1, 0.3960784, 0, 1,
-1.623662, -1.805595, -2.645196, 1, 0.4039216, 0, 1,
-1.612351, 0.6010227, -0.08847795, 1, 0.4078431, 0, 1,
-1.602631, 0.6298285, -0.2030394, 1, 0.4156863, 0, 1,
-1.59996, -1.333602, -1.359542, 1, 0.4196078, 0, 1,
-1.576561, 0.2894229, -2.619525, 1, 0.427451, 0, 1,
-1.521893, 1.499113, 0.1768463, 1, 0.4313726, 0, 1,
-1.512447, -0.2662906, -1.531681, 1, 0.4392157, 0, 1,
-1.50905, 0.9867662, 0.2822595, 1, 0.4431373, 0, 1,
-1.5036, -0.5143614, -0.9822519, 1, 0.4509804, 0, 1,
-1.501819, 0.03421445, -0.4442093, 1, 0.454902, 0, 1,
-1.501762, 2.049675, -1.758324, 1, 0.4627451, 0, 1,
-1.498236, -1.632524, -2.186, 1, 0.4666667, 0, 1,
-1.49344, 0.3719465, -3.250061, 1, 0.4745098, 0, 1,
-1.481706, 0.5433552, -0.5816797, 1, 0.4784314, 0, 1,
-1.481636, -1.166032, -2.284406, 1, 0.4862745, 0, 1,
-1.481235, -0.3031907, -3.044421, 1, 0.4901961, 0, 1,
-1.468608, -0.8650353, -1.979069, 1, 0.4980392, 0, 1,
-1.46726, -1.934533, -1.7438, 1, 0.5058824, 0, 1,
-1.459574, 0.3596236, -1.03545, 1, 0.509804, 0, 1,
-1.451492, 0.2137015, -3.216088, 1, 0.5176471, 0, 1,
-1.45091, 1.297192, -1.090633, 1, 0.5215687, 0, 1,
-1.442325, -1.280203, -1.870462, 1, 0.5294118, 0, 1,
-1.430301, 0.838922, -0.3785244, 1, 0.5333334, 0, 1,
-1.415917, 1.232311, -1.762946, 1, 0.5411765, 0, 1,
-1.413286, 1.485893, -0.6820376, 1, 0.5450981, 0, 1,
-1.407204, 1.40122, -1.878469, 1, 0.5529412, 0, 1,
-1.396613, 2.295727, 0.3877002, 1, 0.5568628, 0, 1,
-1.39556, 0.1745784, -1.878871, 1, 0.5647059, 0, 1,
-1.391435, -0.3143091, -0.4627525, 1, 0.5686275, 0, 1,
-1.389386, -1.32637, -1.445996, 1, 0.5764706, 0, 1,
-1.374943, -0.8838525, -1.256826, 1, 0.5803922, 0, 1,
-1.374827, 0.1146436, -0.8741133, 1, 0.5882353, 0, 1,
-1.372866, 1.257811, -1.213475, 1, 0.5921569, 0, 1,
-1.362039, -1.196218, -1.74578, 1, 0.6, 0, 1,
-1.361445, 0.1515921, -0.5081576, 1, 0.6078432, 0, 1,
-1.355808, 0.3271376, -1.630168, 1, 0.6117647, 0, 1,
-1.347146, 0.5754619, 0.006255747, 1, 0.6196079, 0, 1,
-1.344084, 0.1643291, -0.8358794, 1, 0.6235294, 0, 1,
-1.340899, -0.02763957, -2.615473, 1, 0.6313726, 0, 1,
-1.338929, 0.1509996, -0.5735923, 1, 0.6352941, 0, 1,
-1.336623, 1.361659, -0.5200423, 1, 0.6431373, 0, 1,
-1.336343, -2.038162, -2.430098, 1, 0.6470588, 0, 1,
-1.324212, -0.6231688, -1.218199, 1, 0.654902, 0, 1,
-1.317788, -0.006537377, -2.310134, 1, 0.6588235, 0, 1,
-1.316633, -0.8673629, -1.39841, 1, 0.6666667, 0, 1,
-1.311318, -0.6223068, -3.163808, 1, 0.6705883, 0, 1,
-1.310627, -0.4027115, -2.339495, 1, 0.6784314, 0, 1,
-1.30089, -0.2827861, -2.717706, 1, 0.682353, 0, 1,
-1.295409, -0.7254221, -2.462773, 1, 0.6901961, 0, 1,
-1.293403, -0.8093388, -1.998584, 1, 0.6941177, 0, 1,
-1.292708, 1.916191, -0.01811808, 1, 0.7019608, 0, 1,
-1.285472, 0.2641602, -0.9513474, 1, 0.7098039, 0, 1,
-1.268375, 0.2730055, -1.704155, 1, 0.7137255, 0, 1,
-1.263647, 0.03471395, -2.348915, 1, 0.7215686, 0, 1,
-1.261854, -0.2094593, -2.715472, 1, 0.7254902, 0, 1,
-1.260945, -1.318242, -3.807933, 1, 0.7333333, 0, 1,
-1.260425, 0.9129694, -0.5631834, 1, 0.7372549, 0, 1,
-1.2595, 0.08366892, -2.219891, 1, 0.7450981, 0, 1,
-1.256249, 0.06077444, -0.8600882, 1, 0.7490196, 0, 1,
-1.252168, -0.8832209, -2.224103, 1, 0.7568628, 0, 1,
-1.247411, -0.556451, -2.030511, 1, 0.7607843, 0, 1,
-1.246583, -0.2717365, -1.834605, 1, 0.7686275, 0, 1,
-1.245808, -0.8550626, -2.012264, 1, 0.772549, 0, 1,
-1.243975, 1.001947, -0.6786955, 1, 0.7803922, 0, 1,
-1.238605, -1.137183, -1.266733, 1, 0.7843137, 0, 1,
-1.235556, 1.213194, -0.2486286, 1, 0.7921569, 0, 1,
-1.229923, -0.1145999, -2.032939, 1, 0.7960784, 0, 1,
-1.223065, -1.303931, -2.43628, 1, 0.8039216, 0, 1,
-1.222315, -0.1407747, -0.9928435, 1, 0.8117647, 0, 1,
-1.221294, 0.7187552, -2.519777, 1, 0.8156863, 0, 1,
-1.212748, -0.8528388, -1.525347, 1, 0.8235294, 0, 1,
-1.206687, -0.1225546, -2.590518, 1, 0.827451, 0, 1,
-1.202052, -0.6372883, -2.547196, 1, 0.8352941, 0, 1,
-1.19315, 0.4862239, -1.494414, 1, 0.8392157, 0, 1,
-1.188392, 0.5979347, -1.7709, 1, 0.8470588, 0, 1,
-1.177843, -1.187673, -2.127296, 1, 0.8509804, 0, 1,
-1.168715, 0.2305042, -1.085757, 1, 0.8588235, 0, 1,
-1.163768, 0.4553304, -1.92301, 1, 0.8627451, 0, 1,
-1.160355, -0.5619647, -1.956036, 1, 0.8705882, 0, 1,
-1.157181, 0.880718, -1.133664, 1, 0.8745098, 0, 1,
-1.151784, 0.7426845, -2.325869, 1, 0.8823529, 0, 1,
-1.147673, 0.9250875, 0.1085309, 1, 0.8862745, 0, 1,
-1.134896, -0.9474967, -2.386218, 1, 0.8941177, 0, 1,
-1.133187, -1.404676, -3.191974, 1, 0.8980392, 0, 1,
-1.13105, 1.382541, -0.5491613, 1, 0.9058824, 0, 1,
-1.128906, -0.3258027, -0.8232251, 1, 0.9137255, 0, 1,
-1.121298, -0.3324566, -0.8484109, 1, 0.9176471, 0, 1,
-1.11957, -0.334542, 0.2465961, 1, 0.9254902, 0, 1,
-1.117769, -0.3908418, -1.143904, 1, 0.9294118, 0, 1,
-1.114157, -0.1407091, -1.3331, 1, 0.9372549, 0, 1,
-1.103968, -1.01073, -2.499506, 1, 0.9411765, 0, 1,
-1.10274, 0.5362573, 0.02392352, 1, 0.9490196, 0, 1,
-1.097894, -1.242988, -1.859657, 1, 0.9529412, 0, 1,
-1.096007, -0.02211898, -2.004033, 1, 0.9607843, 0, 1,
-1.095477, 0.1472908, -1.890227, 1, 0.9647059, 0, 1,
-1.093123, 0.3993243, -2.494087, 1, 0.972549, 0, 1,
-1.091065, -0.451887, -1.880175, 1, 0.9764706, 0, 1,
-1.085913, -0.1873351, -2.862625, 1, 0.9843137, 0, 1,
-1.085351, 2.201168, -0.3266161, 1, 0.9882353, 0, 1,
-1.082721, -0.7167844, -3.069561, 1, 0.9960784, 0, 1,
-1.082528, 2.469306, -1.537516, 0.9960784, 1, 0, 1,
-1.079329, 1.13411, 0.1290417, 0.9921569, 1, 0, 1,
-1.071413, 0.05408549, 0.02953289, 0.9843137, 1, 0, 1,
-1.068326, 1.037237, -2.079606, 0.9803922, 1, 0, 1,
-1.066313, -0.5330825, -2.199826, 0.972549, 1, 0, 1,
-1.063562, 0.8840185, 0.5103374, 0.9686275, 1, 0, 1,
-1.063536, 0.9824114, 0.07823058, 0.9607843, 1, 0, 1,
-1.060369, -0.5639713, -1.871854, 0.9568627, 1, 0, 1,
-1.059792, -0.5387785, -2.273986, 0.9490196, 1, 0, 1,
-1.041606, 1.467578, -0.1046818, 0.945098, 1, 0, 1,
-1.031065, -0.07573064, -2.496279, 0.9372549, 1, 0, 1,
-1.028312, 0.4458103, -0.7665321, 0.9333333, 1, 0, 1,
-1.024447, 0.08415388, -2.332805, 0.9254902, 1, 0, 1,
-1.016247, -1.166655, -2.796413, 0.9215686, 1, 0, 1,
-1.014556, 0.3562303, -1.213628, 0.9137255, 1, 0, 1,
-1.000911, -1.023393, -3.454988, 0.9098039, 1, 0, 1,
-0.9953933, 0.6862847, -0.1181009, 0.9019608, 1, 0, 1,
-0.9910133, -0.1732122, 0.04900588, 0.8941177, 1, 0, 1,
-0.9811096, 1.334051, -1.343162, 0.8901961, 1, 0, 1,
-0.9795576, 0.5275425, -2.660509, 0.8823529, 1, 0, 1,
-0.9756608, 1.287193, -1.321674, 0.8784314, 1, 0, 1,
-0.970715, 1.638174, -1.573671, 0.8705882, 1, 0, 1,
-0.9683875, -1.013237, -1.615808, 0.8666667, 1, 0, 1,
-0.9614111, 0.3079775, -2.611634, 0.8588235, 1, 0, 1,
-0.9608403, -0.7892103, -3.014111, 0.854902, 1, 0, 1,
-0.9602975, 0.4994681, -1.518322, 0.8470588, 1, 0, 1,
-0.9600548, 0.004169669, -1.408794, 0.8431373, 1, 0, 1,
-0.9590939, 0.8174858, -1.293463, 0.8352941, 1, 0, 1,
-0.9516312, 0.08350944, -2.39004, 0.8313726, 1, 0, 1,
-0.9490657, -0.6018514, -1.517416, 0.8235294, 1, 0, 1,
-0.9489972, 1.971584, -0.8670934, 0.8196079, 1, 0, 1,
-0.9475513, -0.162027, -2.733629, 0.8117647, 1, 0, 1,
-0.9460263, 1.823632, -0.2371259, 0.8078431, 1, 0, 1,
-0.944374, 1.188184, -0.7702537, 0.8, 1, 0, 1,
-0.9370463, 0.9491053, -0.6500378, 0.7921569, 1, 0, 1,
-0.9355273, 0.2103859, -0.9666715, 0.7882353, 1, 0, 1,
-0.9343218, -0.7454588, -1.467549, 0.7803922, 1, 0, 1,
-0.933012, 0.6729, -0.2320989, 0.7764706, 1, 0, 1,
-0.9318887, 1.381373, -1.399621, 0.7686275, 1, 0, 1,
-0.9308047, -0.1630538, -1.326399, 0.7647059, 1, 0, 1,
-0.9295068, 1.365072, 1.190745, 0.7568628, 1, 0, 1,
-0.9218536, -0.6349071, -2.718162, 0.7529412, 1, 0, 1,
-0.9175019, 1.017109, -0.630241, 0.7450981, 1, 0, 1,
-0.9173241, 0.7634844, -0.5574562, 0.7411765, 1, 0, 1,
-0.9089394, -0.390799, -1.042796, 0.7333333, 1, 0, 1,
-0.9047158, 0.1935743, -1.301141, 0.7294118, 1, 0, 1,
-0.9039972, -0.4054908, -2.905954, 0.7215686, 1, 0, 1,
-0.902959, 0.2470688, -2.267728, 0.7176471, 1, 0, 1,
-0.8982009, -1.48772, -2.834424, 0.7098039, 1, 0, 1,
-0.8981162, -1.198618, -2.074965, 0.7058824, 1, 0, 1,
-0.8937822, 0.9894548, -0.7011492, 0.6980392, 1, 0, 1,
-0.8909662, 1.506311, -0.6067461, 0.6901961, 1, 0, 1,
-0.8881856, 1.223491, -0.4219085, 0.6862745, 1, 0, 1,
-0.884863, -1.073931, -1.358536, 0.6784314, 1, 0, 1,
-0.8810472, -0.9164665, -1.770267, 0.6745098, 1, 0, 1,
-0.8656809, 1.593025, -1.331184, 0.6666667, 1, 0, 1,
-0.8629056, -1.217323, -3.709524, 0.6627451, 1, 0, 1,
-0.8598017, -0.9786431, -3.568604, 0.654902, 1, 0, 1,
-0.8579352, 1.296142, 0.7185453, 0.6509804, 1, 0, 1,
-0.8542435, 0.397138, -0.2593701, 0.6431373, 1, 0, 1,
-0.8523996, 0.4686755, 0.2953236, 0.6392157, 1, 0, 1,
-0.8523957, -0.358519, -2.359723, 0.6313726, 1, 0, 1,
-0.8490155, -0.2297225, -1.327299, 0.627451, 1, 0, 1,
-0.8487999, 0.6513437, 0.0795963, 0.6196079, 1, 0, 1,
-0.847261, 0.1165896, 1.213865, 0.6156863, 1, 0, 1,
-0.842571, -0.01191715, -0.7101377, 0.6078432, 1, 0, 1,
-0.8291597, 1.131196, 0.07612069, 0.6039216, 1, 0, 1,
-0.8261281, -0.2145818, -2.136709, 0.5960785, 1, 0, 1,
-0.8231823, -0.2886359, -1.521538, 0.5882353, 1, 0, 1,
-0.8200668, -0.1157444, -3.668876, 0.5843138, 1, 0, 1,
-0.8189236, 1.048028, -1.261307, 0.5764706, 1, 0, 1,
-0.8163854, 0.03138788, -1.422449, 0.572549, 1, 0, 1,
-0.8081979, 1.017564, 0.4764896, 0.5647059, 1, 0, 1,
-0.8067076, -0.6973704, -3.523359, 0.5607843, 1, 0, 1,
-0.8059529, 0.1276559, -2.011195, 0.5529412, 1, 0, 1,
-0.8043519, -1.18087, -3.49121, 0.5490196, 1, 0, 1,
-0.8040302, -1.584613, -2.04246, 0.5411765, 1, 0, 1,
-0.8036127, 0.5292245, -1.180198, 0.5372549, 1, 0, 1,
-0.7988291, -0.5990843, -1.384605, 0.5294118, 1, 0, 1,
-0.7961964, -1.323127, -1.184479, 0.5254902, 1, 0, 1,
-0.7925617, 0.5332951, -0.7243004, 0.5176471, 1, 0, 1,
-0.790845, -0.459421, -2.937161, 0.5137255, 1, 0, 1,
-0.787895, -0.7108022, -2.859747, 0.5058824, 1, 0, 1,
-0.7838596, 0.953191, -0.3821654, 0.5019608, 1, 0, 1,
-0.7680815, 0.2465406, -2.090095, 0.4941176, 1, 0, 1,
-0.7572541, 0.8103631, -0.6167744, 0.4862745, 1, 0, 1,
-0.7523378, -0.6844027, -0.6389207, 0.4823529, 1, 0, 1,
-0.7521887, 0.3419375, -2.660135, 0.4745098, 1, 0, 1,
-0.7442367, 0.4966999, -0.9085192, 0.4705882, 1, 0, 1,
-0.7429982, 0.305467, -1.878218, 0.4627451, 1, 0, 1,
-0.7429281, 0.4899394, -0.6956139, 0.4588235, 1, 0, 1,
-0.7399213, -0.6915123, -3.056401, 0.4509804, 1, 0, 1,
-0.7363521, -0.9671448, -2.711569, 0.4470588, 1, 0, 1,
-0.7355565, -1.80986, -3.127121, 0.4392157, 1, 0, 1,
-0.7344905, 1.390925, 0.2602158, 0.4352941, 1, 0, 1,
-0.7331731, -0.6684015, -3.148176, 0.427451, 1, 0, 1,
-0.7294962, -0.7915204, -2.274378, 0.4235294, 1, 0, 1,
-0.7287647, -1.407873, -1.778407, 0.4156863, 1, 0, 1,
-0.7201064, -1.369298, -2.690856, 0.4117647, 1, 0, 1,
-0.719351, -0.6884504, -1.759323, 0.4039216, 1, 0, 1,
-0.7186901, -1.486038, -3.474577, 0.3960784, 1, 0, 1,
-0.714404, -0.04457591, -0.718563, 0.3921569, 1, 0, 1,
-0.7122949, -0.1671755, -0.5005538, 0.3843137, 1, 0, 1,
-0.7106688, -0.03187515, -2.797226, 0.3803922, 1, 0, 1,
-0.7104117, -2.455663, -3.534837, 0.372549, 1, 0, 1,
-0.7050531, -1.313496, -2.455238, 0.3686275, 1, 0, 1,
-0.7040147, 0.2158402, 0.2275793, 0.3607843, 1, 0, 1,
-0.7034621, 0.2730522, -1.817039, 0.3568628, 1, 0, 1,
-0.7030103, 0.144946, -0.5159522, 0.3490196, 1, 0, 1,
-0.6959368, -1.687623, -5.445054, 0.345098, 1, 0, 1,
-0.6889439, -1.134457, -2.555771, 0.3372549, 1, 0, 1,
-0.6871758, 1.08617, -1.018498, 0.3333333, 1, 0, 1,
-0.6855323, -1.106245, -3.192156, 0.3254902, 1, 0, 1,
-0.6832712, 0.2820377, -1.013576, 0.3215686, 1, 0, 1,
-0.6829557, 1.231525, -0.3048815, 0.3137255, 1, 0, 1,
-0.6765871, 0.0406699, -0.6047432, 0.3098039, 1, 0, 1,
-0.6714262, 0.7345642, 1.723228, 0.3019608, 1, 0, 1,
-0.668845, 0.3106861, -1.534892, 0.2941177, 1, 0, 1,
-0.667224, -0.1120477, -4.39508, 0.2901961, 1, 0, 1,
-0.6669057, -0.01037247, -2.070371, 0.282353, 1, 0, 1,
-0.6574455, -0.950976, -2.245859, 0.2784314, 1, 0, 1,
-0.6511934, 1.702559, 0.5788748, 0.2705882, 1, 0, 1,
-0.6387102, -0.8377961, -1.891847, 0.2666667, 1, 0, 1,
-0.6386086, 0.04516089, -1.686936, 0.2588235, 1, 0, 1,
-0.6357923, 0.9353924, -1.287613, 0.254902, 1, 0, 1,
-0.6294246, 0.4320603, -0.4533888, 0.2470588, 1, 0, 1,
-0.6288696, -0.2535606, -3.07584, 0.2431373, 1, 0, 1,
-0.6285471, -0.1298631, -0.8771006, 0.2352941, 1, 0, 1,
-0.6273929, 0.2912894, -0.7670722, 0.2313726, 1, 0, 1,
-0.6267387, 0.7298309, -0.1669777, 0.2235294, 1, 0, 1,
-0.6234747, -0.8836834, -2.242889, 0.2196078, 1, 0, 1,
-0.6184297, -0.4034716, -0.1297372, 0.2117647, 1, 0, 1,
-0.6165389, 1.392546, -0.5442793, 0.2078431, 1, 0, 1,
-0.6153911, -0.9774405, -4.774754, 0.2, 1, 0, 1,
-0.6101608, -0.0532708, -1.3487, 0.1921569, 1, 0, 1,
-0.6026279, -0.1074605, -0.6559323, 0.1882353, 1, 0, 1,
-0.6021121, 0.9284465, -0.01766934, 0.1803922, 1, 0, 1,
-0.5995353, 0.7949349, -0.05817848, 0.1764706, 1, 0, 1,
-0.5954053, -0.5574259, -1.663117, 0.1686275, 1, 0, 1,
-0.5951616, -0.02373389, -1.787186, 0.1647059, 1, 0, 1,
-0.5946844, 0.3917353, -1.806236, 0.1568628, 1, 0, 1,
-0.5932291, 1.895196, 0.1429633, 0.1529412, 1, 0, 1,
-0.5894426, -1.670771, -2.724211, 0.145098, 1, 0, 1,
-0.5885539, 0.3047585, -1.222284, 0.1411765, 1, 0, 1,
-0.5752333, 0.6789478, -0.3022951, 0.1333333, 1, 0, 1,
-0.5713287, -2.584285, -1.020493, 0.1294118, 1, 0, 1,
-0.5691741, -0.3215629, -1.656404, 0.1215686, 1, 0, 1,
-0.5681349, -0.7883604, -0.9626892, 0.1176471, 1, 0, 1,
-0.5658069, 0.3161365, -1.847635, 0.1098039, 1, 0, 1,
-0.5633642, -1.131076, -3.483811, 0.1058824, 1, 0, 1,
-0.5605918, -0.909806, -2.685682, 0.09803922, 1, 0, 1,
-0.5560567, 0.5949818, -0.5327948, 0.09019608, 1, 0, 1,
-0.5528387, 1.11921, -3.478524, 0.08627451, 1, 0, 1,
-0.5405916, -1.201869, -2.819625, 0.07843138, 1, 0, 1,
-0.5395807, -0.6729346, -3.424438, 0.07450981, 1, 0, 1,
-0.5366025, 1.357812, -1.091191, 0.06666667, 1, 0, 1,
-0.5332648, 0.8098979, -1.21615, 0.0627451, 1, 0, 1,
-0.5297976, -0.02251908, -1.163038, 0.05490196, 1, 0, 1,
-0.5249432, -0.01396771, -1.308328, 0.05098039, 1, 0, 1,
-0.5217927, -1.212265, -2.931576, 0.04313726, 1, 0, 1,
-0.5192916, 0.1939638, -1.070391, 0.03921569, 1, 0, 1,
-0.5189479, -0.03170172, -1.158438, 0.03137255, 1, 0, 1,
-0.5166065, -1.078623, -4.409619, 0.02745098, 1, 0, 1,
-0.5101077, 1.383958, 0.4902635, 0.01960784, 1, 0, 1,
-0.5074826, 2.683059, 0.2464765, 0.01568628, 1, 0, 1,
-0.5069921, 1.567992, 0.8510104, 0.007843138, 1, 0, 1,
-0.5067008, -2.000988, -2.111022, 0.003921569, 1, 0, 1,
-0.5034901, 0.5387019, -1.380645, 0, 1, 0.003921569, 1,
-0.5028473, 0.1584628, -0.2450376, 0, 1, 0.01176471, 1,
-0.4974023, 2.485707, -1.316676, 0, 1, 0.01568628, 1,
-0.4949522, 1.351897, 0.9738269, 0, 1, 0.02352941, 1,
-0.493996, -0.1636509, -1.261112, 0, 1, 0.02745098, 1,
-0.4858636, 0.1155719, -1.364545, 0, 1, 0.03529412, 1,
-0.4828627, 0.5474959, -0.430934, 0, 1, 0.03921569, 1,
-0.479685, 1.516013, -0.4788806, 0, 1, 0.04705882, 1,
-0.4714058, -0.4970665, -2.826558, 0, 1, 0.05098039, 1,
-0.4707618, 1.037332, -0.2787329, 0, 1, 0.05882353, 1,
-0.4695104, -0.2244869, -2.342761, 0, 1, 0.0627451, 1,
-0.4676542, -1.291492, -1.907892, 0, 1, 0.07058824, 1,
-0.462936, 0.5397484, 0.9174747, 0, 1, 0.07450981, 1,
-0.455923, 1.372017, 0.9327642, 0, 1, 0.08235294, 1,
-0.4558826, -0.1313357, -1.552853, 0, 1, 0.08627451, 1,
-0.4540861, 0.07924904, -0.838578, 0, 1, 0.09411765, 1,
-0.4537875, -0.5871787, -1.890299, 0, 1, 0.1019608, 1,
-0.4512833, 1.6609, 0.9857994, 0, 1, 0.1058824, 1,
-0.4415308, 0.9399076, 0.3614318, 0, 1, 0.1137255, 1,
-0.4406697, 1.101237, 0.2864871, 0, 1, 0.1176471, 1,
-0.4359376, -0.5997835, -2.284346, 0, 1, 0.1254902, 1,
-0.4341854, -1.325531, -3.204711, 0, 1, 0.1294118, 1,
-0.4307835, 0.6806686, -1.520929, 0, 1, 0.1372549, 1,
-0.4306474, -1.505013, -2.524676, 0, 1, 0.1411765, 1,
-0.4266315, 1.493543, -1.014423, 0, 1, 0.1490196, 1,
-0.4139766, -0.05394524, -2.943928, 0, 1, 0.1529412, 1,
-0.4133681, -1.048001, -1.17015, 0, 1, 0.1607843, 1,
-0.4128933, 0.621926, -0.9981969, 0, 1, 0.1647059, 1,
-0.4103, 0.1011624, -1.140816, 0, 1, 0.172549, 1,
-0.4055579, -0.6037562, -1.480163, 0, 1, 0.1764706, 1,
-0.3988209, 0.9140459, 0.9473316, 0, 1, 0.1843137, 1,
-0.3925817, -3.392006, -3.07835, 0, 1, 0.1882353, 1,
-0.3895655, -0.8518432, -2.793694, 0, 1, 0.1960784, 1,
-0.3862104, -0.1199467, -1.104116, 0, 1, 0.2039216, 1,
-0.3789195, -1.854823, -2.689424, 0, 1, 0.2078431, 1,
-0.3743192, 0.9582247, -1.133089, 0, 1, 0.2156863, 1,
-0.3719992, 0.6787629, -1.47329, 0, 1, 0.2196078, 1,
-0.3705368, -1.057163, -3.696204, 0, 1, 0.227451, 1,
-0.3672566, -1.252187, -3.983201, 0, 1, 0.2313726, 1,
-0.3655438, 0.6542516, 0.04459377, 0, 1, 0.2392157, 1,
-0.3640808, 0.8064108, -0.2332651, 0, 1, 0.2431373, 1,
-0.362552, 0.0672211, -2.461214, 0, 1, 0.2509804, 1,
-0.3533096, -2.552043, -3.280428, 0, 1, 0.254902, 1,
-0.3517147, 1.122517, -1.050018, 0, 1, 0.2627451, 1,
-0.3514836, 0.3728541, 0.07110776, 0, 1, 0.2666667, 1,
-0.3507743, 1.489763, -1.903183, 0, 1, 0.2745098, 1,
-0.3450589, 1.617622, -1.188786, 0, 1, 0.2784314, 1,
-0.3435898, 1.422539, -0.7998188, 0, 1, 0.2862745, 1,
-0.3435538, -0.7310616, -3.93524, 0, 1, 0.2901961, 1,
-0.3423204, -0.5273411, -4.013143, 0, 1, 0.2980392, 1,
-0.333145, 1.162281, 0.7434291, 0, 1, 0.3058824, 1,
-0.3276304, -0.4193861, -1.635785, 0, 1, 0.3098039, 1,
-0.326701, 0.1258289, -0.6064177, 0, 1, 0.3176471, 1,
-0.3258531, 1.287539, 0.8595269, 0, 1, 0.3215686, 1,
-0.3159846, 0.6704581, -0.4539516, 0, 1, 0.3294118, 1,
-0.3157693, -1.565415, -3.36015, 0, 1, 0.3333333, 1,
-0.3149007, 0.901738, 1.361354, 0, 1, 0.3411765, 1,
-0.3130005, -1.038399, -2.045179, 0, 1, 0.345098, 1,
-0.3113715, -1.06371, -1.432027, 0, 1, 0.3529412, 1,
-0.3101584, -1.793288, -2.173202, 0, 1, 0.3568628, 1,
-0.3012705, 2.280524, 1.462819, 0, 1, 0.3647059, 1,
-0.3001734, -0.2143746, 0.7971159, 0, 1, 0.3686275, 1,
-0.2996005, 0.08215006, -2.469771, 0, 1, 0.3764706, 1,
-0.2965485, -0.149183, -1.210683, 0, 1, 0.3803922, 1,
-0.2961508, -0.8083712, -2.425585, 0, 1, 0.3882353, 1,
-0.2913195, 0.768543, -1.156881, 0, 1, 0.3921569, 1,
-0.2899724, -0.5190203, -2.473199, 0, 1, 0.4, 1,
-0.287984, 0.6472868, 0.6414148, 0, 1, 0.4078431, 1,
-0.2845948, -2.085935, -2.252643, 0, 1, 0.4117647, 1,
-0.2839831, -1.244732, -3.474038, 0, 1, 0.4196078, 1,
-0.2837974, -0.7093751, -1.935212, 0, 1, 0.4235294, 1,
-0.2820398, 2.061891, -0.4493137, 0, 1, 0.4313726, 1,
-0.2812098, 1.791509, -1.44847, 0, 1, 0.4352941, 1,
-0.2756371, 1.51586, 0.3682838, 0, 1, 0.4431373, 1,
-0.2674519, -2.303936, -3.259007, 0, 1, 0.4470588, 1,
-0.2656159, -1.433725, -2.256346, 0, 1, 0.454902, 1,
-0.2653249, -1.772688, -3.262907, 0, 1, 0.4588235, 1,
-0.2616513, 1.112204, -1.157848, 0, 1, 0.4666667, 1,
-0.2578763, 0.5527037, -0.2141414, 0, 1, 0.4705882, 1,
-0.2549468, 1.603973, 0.9730524, 0, 1, 0.4784314, 1,
-0.2526846, -0.6541409, -2.611282, 0, 1, 0.4823529, 1,
-0.2469789, -0.4761705, -1.130616, 0, 1, 0.4901961, 1,
-0.2464566, 0.5481924, -0.9157643, 0, 1, 0.4941176, 1,
-0.2434758, 0.4672831, 1.981454, 0, 1, 0.5019608, 1,
-0.2412978, 0.4818318, 0.3356131, 0, 1, 0.509804, 1,
-0.2372712, -0.01744349, -0.3242632, 0, 1, 0.5137255, 1,
-0.2334677, -0.3808819, -3.060101, 0, 1, 0.5215687, 1,
-0.2242227, 0.9731429, 0.02772206, 0, 1, 0.5254902, 1,
-0.22338, -0.2091338, -2.826942, 0, 1, 0.5333334, 1,
-0.2232165, -0.5645583, -2.485736, 0, 1, 0.5372549, 1,
-0.2171592, 0.6494732, -2.608356, 0, 1, 0.5450981, 1,
-0.2171403, 1.694785, -0.7808856, 0, 1, 0.5490196, 1,
-0.2128253, 0.3017678, -1.086861, 0, 1, 0.5568628, 1,
-0.2090924, -0.5174962, -2.767601, 0, 1, 0.5607843, 1,
-0.2042745, 1.289347, -0.8383308, 0, 1, 0.5686275, 1,
-0.1894117, 0.2725467, -0.5254151, 0, 1, 0.572549, 1,
-0.1894066, -0.8701615, -5.29576, 0, 1, 0.5803922, 1,
-0.1890529, 0.6882581, -1.259758, 0, 1, 0.5843138, 1,
-0.1840044, -0.3824722, -4.33358, 0, 1, 0.5921569, 1,
-0.1813781, 1.205813, -0.2104774, 0, 1, 0.5960785, 1,
-0.1792517, -1.090334, -1.162295, 0, 1, 0.6039216, 1,
-0.1789868, 0.164665, 1.145344, 0, 1, 0.6117647, 1,
-0.1782728, 0.001051443, -3.216098, 0, 1, 0.6156863, 1,
-0.1781295, -0.6193104, -4.809234, 0, 1, 0.6235294, 1,
-0.1743411, 0.2245441, 0.377274, 0, 1, 0.627451, 1,
-0.173528, -0.7064442, -1.782656, 0, 1, 0.6352941, 1,
-0.1662949, -0.5043049, -2.407524, 0, 1, 0.6392157, 1,
-0.1662259, -0.006220782, -1.31696, 0, 1, 0.6470588, 1,
-0.1602451, -0.4296843, -2.89698, 0, 1, 0.6509804, 1,
-0.1601626, 1.83467, -0.3525907, 0, 1, 0.6588235, 1,
-0.1589212, 1.213682, 0.7264932, 0, 1, 0.6627451, 1,
-0.1571412, -0.5505419, -1.946606, 0, 1, 0.6705883, 1,
-0.1504197, 0.205013, 1.452222, 0, 1, 0.6745098, 1,
-0.1478575, -0.4768046, -1.855407, 0, 1, 0.682353, 1,
-0.1472623, 0.8507965, -1.809634, 0, 1, 0.6862745, 1,
-0.1456822, -0.03162327, -1.015358, 0, 1, 0.6941177, 1,
-0.1451898, 0.169227, -1.770264, 0, 1, 0.7019608, 1,
-0.1433866, -0.5341873, -3.357863, 0, 1, 0.7058824, 1,
-0.1417354, -0.6400008, -2.980023, 0, 1, 0.7137255, 1,
-0.1401088, 0.3585686, -0.4909374, 0, 1, 0.7176471, 1,
-0.1387885, 1.857144, -0.04323709, 0, 1, 0.7254902, 1,
-0.1345327, -1.461075, -2.64381, 0, 1, 0.7294118, 1,
-0.132135, -0.03682218, -2.130462, 0, 1, 0.7372549, 1,
-0.1318562, 0.2437326, -0.3738118, 0, 1, 0.7411765, 1,
-0.1214254, -0.4289493, -2.694568, 0, 1, 0.7490196, 1,
-0.120648, 1.419837, -0.3604535, 0, 1, 0.7529412, 1,
-0.1183667, -0.8586236, -3.605895, 0, 1, 0.7607843, 1,
-0.1046643, 1.222078, 0.01077409, 0, 1, 0.7647059, 1,
-0.1045732, -0.9215943, -1.350616, 0, 1, 0.772549, 1,
-0.1021794, 0.1493799, -2.157967, 0, 1, 0.7764706, 1,
-0.1008522, -0.2692325, -2.709632, 0, 1, 0.7843137, 1,
-0.1007896, 2.08818, -0.3986011, 0, 1, 0.7882353, 1,
-0.09900858, -0.2359558, -3.60977, 0, 1, 0.7960784, 1,
-0.09588838, 1.20381, -0.8326336, 0, 1, 0.8039216, 1,
-0.08977707, 1.649103, -1.352896, 0, 1, 0.8078431, 1,
-0.08947002, -0.2780426, -0.3376383, 0, 1, 0.8156863, 1,
-0.08916867, -0.760609, -1.699619, 0, 1, 0.8196079, 1,
-0.08916787, 0.2312636, -1.069433, 0, 1, 0.827451, 1,
-0.08916473, -1.166201, -2.265397, 0, 1, 0.8313726, 1,
-0.0815665, -0.04867059, -1.996648, 0, 1, 0.8392157, 1,
-0.08110794, -1.630667, -1.484684, 0, 1, 0.8431373, 1,
-0.07818107, -0.6319431, -4.802308, 0, 1, 0.8509804, 1,
-0.07658861, 1.980163, -0.1090679, 0, 1, 0.854902, 1,
-0.07336166, -0.2960182, -3.51868, 0, 1, 0.8627451, 1,
-0.07323267, -0.8026057, -3.25864, 0, 1, 0.8666667, 1,
-0.07268304, 1.045868, 0.1019277, 0, 1, 0.8745098, 1,
-0.07030004, 1.054319, 1.241394, 0, 1, 0.8784314, 1,
-0.06696781, 0.531494, 0.9041749, 0, 1, 0.8862745, 1,
-0.06405998, -0.07342749, -2.153143, 0, 1, 0.8901961, 1,
-0.06331147, 0.06639943, -1.5532, 0, 1, 0.8980392, 1,
-0.0619171, 0.4730848, 0.1147003, 0, 1, 0.9058824, 1,
-0.06124923, -0.6389257, -3.71124, 0, 1, 0.9098039, 1,
-0.05714703, 1.10302, -1.821062, 0, 1, 0.9176471, 1,
-0.05301111, 1.858435, -0.6895489, 0, 1, 0.9215686, 1,
-0.04967396, -0.9286337, -2.908494, 0, 1, 0.9294118, 1,
-0.03991577, 1.248059, 0.2825182, 0, 1, 0.9333333, 1,
-0.03843089, -0.1122373, -2.001025, 0, 1, 0.9411765, 1,
-0.03842502, 1.665316, -1.065899, 0, 1, 0.945098, 1,
-0.03405095, 0.07739798, 0.1402376, 0, 1, 0.9529412, 1,
-0.0289508, -0.9438695, -2.322668, 0, 1, 0.9568627, 1,
-0.02737772, -1.574081, -3.956012, 0, 1, 0.9647059, 1,
-0.0267406, 1.796765, 2.00621, 0, 1, 0.9686275, 1,
-0.0263423, 0.08368855, -0.1108447, 0, 1, 0.9764706, 1,
-0.02562793, -0.5242693, -3.518438, 0, 1, 0.9803922, 1,
-0.02343514, 0.359466, -0.1725841, 0, 1, 0.9882353, 1,
-0.02244277, 1.181654, 0.333999, 0, 1, 0.9921569, 1,
-0.02094775, -0.1721775, -1.645767, 0, 1, 1, 1,
-0.01534101, 1.237489, -0.09111783, 0, 0.9921569, 1, 1,
-0.01494809, -0.3875161, -2.688643, 0, 0.9882353, 1, 1,
-0.0133404, -1.423735, -4.437735, 0, 0.9803922, 1, 1,
-0.01293417, -2.205668, -2.697145, 0, 0.9764706, 1, 1,
-0.01075605, -1.533022, -4.026265, 0, 0.9686275, 1, 1,
-0.009430295, -1.341509, -3.185793, 0, 0.9647059, 1, 1,
-0.008385427, 0.03428268, 0.3926915, 0, 0.9568627, 1, 1,
-0.003481143, -2.636142, -4.187559, 0, 0.9529412, 1, 1,
-0.002250283, -0.437784, -2.116271, 0, 0.945098, 1, 1,
0.0004358463, 0.5175635, -0.957386, 0, 0.9411765, 1, 1,
0.002467773, 0.8125847, -0.7672568, 0, 0.9333333, 1, 1,
0.002697104, 0.8634996, 0.07672358, 0, 0.9294118, 1, 1,
0.005390462, -0.7426465, 4.693967, 0, 0.9215686, 1, 1,
0.008554203, 0.2883156, 1.386408, 0, 0.9176471, 1, 1,
0.0118818, 0.8257307, -0.7910116, 0, 0.9098039, 1, 1,
0.01909403, 0.5497825, -0.6114785, 0, 0.9058824, 1, 1,
0.02132505, 1.479809, 2.081547, 0, 0.8980392, 1, 1,
0.02163405, -1.109676, 4.736412, 0, 0.8901961, 1, 1,
0.02339424, -0.3648599, 4.152604, 0, 0.8862745, 1, 1,
0.02986693, 0.2950096, 1.059202, 0, 0.8784314, 1, 1,
0.03106323, 0.6304485, -0.06345503, 0, 0.8745098, 1, 1,
0.03273385, 1.425762, 0.5219353, 0, 0.8666667, 1, 1,
0.03586948, -0.502822, 0.8742064, 0, 0.8627451, 1, 1,
0.03705684, 0.813598, 0.5246916, 0, 0.854902, 1, 1,
0.03861598, 0.1658791, -1.033841, 0, 0.8509804, 1, 1,
0.04158589, -0.5867277, 2.512007, 0, 0.8431373, 1, 1,
0.0444167, -1.243955, 2.427628, 0, 0.8392157, 1, 1,
0.04675914, 0.3050409, 0.4819916, 0, 0.8313726, 1, 1,
0.04950414, 0.3145679, 0.3509372, 0, 0.827451, 1, 1,
0.05014436, 0.09438949, 1.321686, 0, 0.8196079, 1, 1,
0.05077726, 0.4619329, 1.528068, 0, 0.8156863, 1, 1,
0.05249441, -1.052258, 3.215813, 0, 0.8078431, 1, 1,
0.05368862, -2.65647, 5.215044, 0, 0.8039216, 1, 1,
0.06694431, -1.032629, 4.841094, 0, 0.7960784, 1, 1,
0.06856956, 0.8165799, -1.900568, 0, 0.7882353, 1, 1,
0.07108889, 1.115239, 1.692219, 0, 0.7843137, 1, 1,
0.07304523, -0.9337713, 4.202032, 0, 0.7764706, 1, 1,
0.0799028, -0.7582629, 2.991978, 0, 0.772549, 1, 1,
0.08195279, -0.4698134, 1.556419, 0, 0.7647059, 1, 1,
0.08893298, 1.613086, 0.02077626, 0, 0.7607843, 1, 1,
0.09446599, 2.031957, -1.236018, 0, 0.7529412, 1, 1,
0.09572394, 0.5842219, -0.03040029, 0, 0.7490196, 1, 1,
0.1010146, 0.6956562, 0.2042427, 0, 0.7411765, 1, 1,
0.1020331, 0.6960243, -0.6161897, 0, 0.7372549, 1, 1,
0.104573, 0.8068511, 0.8689244, 0, 0.7294118, 1, 1,
0.1049053, 1.083231, -0.2421415, 0, 0.7254902, 1, 1,
0.1061738, -0.5544841, 3.074656, 0, 0.7176471, 1, 1,
0.1062597, -1.070044, 4.801466, 0, 0.7137255, 1, 1,
0.1072041, 3.205458, 1.040667, 0, 0.7058824, 1, 1,
0.1171283, -0.2510332, 3.912173, 0, 0.6980392, 1, 1,
0.1183309, 1.272584, 0.8232212, 0, 0.6941177, 1, 1,
0.1185887, -0.1794618, 1.584924, 0, 0.6862745, 1, 1,
0.1216872, 0.07201008, 1.605125, 0, 0.682353, 1, 1,
0.1288212, -0.5017195, 3.014127, 0, 0.6745098, 1, 1,
0.1298386, 0.498154, 0.03228484, 0, 0.6705883, 1, 1,
0.1346609, -0.6713331, 1.812466, 0, 0.6627451, 1, 1,
0.1375003, -1.646616, 3.809086, 0, 0.6588235, 1, 1,
0.1379723, 1.575049, -0.5094304, 0, 0.6509804, 1, 1,
0.1384404, 1.288795, 0.6018463, 0, 0.6470588, 1, 1,
0.1389657, -1.053765, 2.697957, 0, 0.6392157, 1, 1,
0.1394404, 0.9425088, -0.5057438, 0, 0.6352941, 1, 1,
0.1397331, 0.008155392, 0.07651704, 0, 0.627451, 1, 1,
0.1420594, 0.6334494, 0.7218814, 0, 0.6235294, 1, 1,
0.1450533, 2.707862, 0.3205025, 0, 0.6156863, 1, 1,
0.1472922, -0.5624422, 3.160384, 0, 0.6117647, 1, 1,
0.1482499, -0.6565447, 1.875227, 0, 0.6039216, 1, 1,
0.1510163, -1.998006, 2.874729, 0, 0.5960785, 1, 1,
0.1519299, 1.174575, 0.1161321, 0, 0.5921569, 1, 1,
0.1557916, 0.4194722, 0.3176709, 0, 0.5843138, 1, 1,
0.1571202, 1.209667, 1.072441, 0, 0.5803922, 1, 1,
0.1587393, 0.3096884, -1.086014, 0, 0.572549, 1, 1,
0.1597081, -0.6070952, 5.394525, 0, 0.5686275, 1, 1,
0.1696877, 0.2003742, 1.332848, 0, 0.5607843, 1, 1,
0.1719935, -1.078283, 3.182108, 0, 0.5568628, 1, 1,
0.1758644, -0.9858278, 2.338588, 0, 0.5490196, 1, 1,
0.1786596, -0.4459761, 2.469214, 0, 0.5450981, 1, 1,
0.1883269, -0.2729717, 2.858597, 0, 0.5372549, 1, 1,
0.1884202, 0.1605574, 0.6990589, 0, 0.5333334, 1, 1,
0.197803, -1.206081, 3.989919, 0, 0.5254902, 1, 1,
0.1988731, -0.9422564, 4.662225, 0, 0.5215687, 1, 1,
0.1993212, 0.02497743, 1.360804, 0, 0.5137255, 1, 1,
0.2001382, 0.1179793, 0.7398803, 0, 0.509804, 1, 1,
0.2006572, -0.6643047, 3.652592, 0, 0.5019608, 1, 1,
0.2018995, 0.8880215, 1.597931, 0, 0.4941176, 1, 1,
0.2019399, 1.623122, -0.675436, 0, 0.4901961, 1, 1,
0.2053649, -0.08981042, 1.308331, 0, 0.4823529, 1, 1,
0.2074022, 0.6961897, -0.8256106, 0, 0.4784314, 1, 1,
0.2089192, -0.5007975, 2.616084, 0, 0.4705882, 1, 1,
0.209131, 0.05880086, 1.030737, 0, 0.4666667, 1, 1,
0.2096818, 0.4750557, 0.4268765, 0, 0.4588235, 1, 1,
0.21119, 0.7556133, 0.7420834, 0, 0.454902, 1, 1,
0.2122058, 0.5086808, -0.2799149, 0, 0.4470588, 1, 1,
0.2123607, 0.3120201, 1.117943, 0, 0.4431373, 1, 1,
0.2123924, 0.2233268, 0.709334, 0, 0.4352941, 1, 1,
0.21342, -0.9618603, 5.514383, 0, 0.4313726, 1, 1,
0.217875, 0.5542459, 0.5412106, 0, 0.4235294, 1, 1,
0.221467, 0.1790462, 0.01351058, 0, 0.4196078, 1, 1,
0.2216753, 0.2332606, 2.144956, 0, 0.4117647, 1, 1,
0.2222142, -0.6016769, 1.790833, 0, 0.4078431, 1, 1,
0.223667, -0.9017898, 2.038324, 0, 0.4, 1, 1,
0.2299505, 1.254873, -0.08971279, 0, 0.3921569, 1, 1,
0.2302518, -0.6124287, 2.925379, 0, 0.3882353, 1, 1,
0.2305066, -1.684278, 3.644511, 0, 0.3803922, 1, 1,
0.2327177, 0.3939718, 1.453622, 0, 0.3764706, 1, 1,
0.2364486, 0.3536147, -0.08220483, 0, 0.3686275, 1, 1,
0.2381649, -0.3731872, 2.935916, 0, 0.3647059, 1, 1,
0.2414415, 0.5005, 1.380598, 0, 0.3568628, 1, 1,
0.241865, 1.253866, 0.2071537, 0, 0.3529412, 1, 1,
0.2442484, -0.6812797, 2.883145, 0, 0.345098, 1, 1,
0.244453, -1.045505, 2.189006, 0, 0.3411765, 1, 1,
0.2509857, -0.7005897, 4.678747, 0, 0.3333333, 1, 1,
0.2513846, 0.5822709, 0.829036, 0, 0.3294118, 1, 1,
0.2631899, -0.195644, 1.100484, 0, 0.3215686, 1, 1,
0.2636014, 0.04675134, 0.9366909, 0, 0.3176471, 1, 1,
0.2693472, 0.2950063, 1.860888, 0, 0.3098039, 1, 1,
0.2693805, -0.4576902, 2.771765, 0, 0.3058824, 1, 1,
0.2741257, 0.793395, 2.284245, 0, 0.2980392, 1, 1,
0.2837046, 1.364631, 0.3742776, 0, 0.2901961, 1, 1,
0.2879288, 2.050597, 0.2176671, 0, 0.2862745, 1, 1,
0.2888072, 2.30035, -0.5745417, 0, 0.2784314, 1, 1,
0.2936718, 0.4775554, 1.182037, 0, 0.2745098, 1, 1,
0.3013805, -0.6180515, 2.942969, 0, 0.2666667, 1, 1,
0.3017238, -0.9706473, 2.928716, 0, 0.2627451, 1, 1,
0.301999, 0.6322244, 2.047468, 0, 0.254902, 1, 1,
0.3054976, 0.247561, 0.7935014, 0, 0.2509804, 1, 1,
0.3065099, 0.2398645, 0.6468031, 0, 0.2431373, 1, 1,
0.307613, -0.1486027, 0.9799268, 0, 0.2392157, 1, 1,
0.3076791, -0.2190847, 3.081391, 0, 0.2313726, 1, 1,
0.3077883, 1.309707, 0.5872487, 0, 0.227451, 1, 1,
0.3108295, -0.9343878, 2.059461, 0, 0.2196078, 1, 1,
0.3137382, -0.5776966, 3.191696, 0, 0.2156863, 1, 1,
0.3143423, -0.1480201, 1.882074, 0, 0.2078431, 1, 1,
0.3155056, 0.07681966, 0.5964053, 0, 0.2039216, 1, 1,
0.3216353, -1.164076, 3.744704, 0, 0.1960784, 1, 1,
0.3223161, -0.06942456, 0.8601986, 0, 0.1882353, 1, 1,
0.3232041, -1.0652, 2.008121, 0, 0.1843137, 1, 1,
0.3248118, -0.6215219, 3.530338, 0, 0.1764706, 1, 1,
0.3290575, -1.798078, 3.393378, 0, 0.172549, 1, 1,
0.3359827, 2.287228, 0.606022, 0, 0.1647059, 1, 1,
0.3376943, 0.4767384, -0.07101993, 0, 0.1607843, 1, 1,
0.3377998, -0.1953239, 0.07560931, 0, 0.1529412, 1, 1,
0.3390152, 1.294028, 0.296952, 0, 0.1490196, 1, 1,
0.3416378, -0.06599113, -0.1767313, 0, 0.1411765, 1, 1,
0.3420796, -0.1351348, 0.4449655, 0, 0.1372549, 1, 1,
0.3422285, -0.127214, 1.547148, 0, 0.1294118, 1, 1,
0.3452317, -0.1578904, 0.58604, 0, 0.1254902, 1, 1,
0.3509741, -0.1226902, 2.704919, 0, 0.1176471, 1, 1,
0.3512641, 0.6550994, 1.436687, 0, 0.1137255, 1, 1,
0.354911, -0.9820753, 1.821112, 0, 0.1058824, 1, 1,
0.3565736, -0.9306919, 2.60834, 0, 0.09803922, 1, 1,
0.3586858, 0.1518942, 2.96901, 0, 0.09411765, 1, 1,
0.358911, -0.3367324, -0.1028774, 0, 0.08627451, 1, 1,
0.3630204, -1.56456, 2.790293, 0, 0.08235294, 1, 1,
0.3642758, 0.4358869, 0.5961133, 0, 0.07450981, 1, 1,
0.3691203, -2.055746, 2.53106, 0, 0.07058824, 1, 1,
0.369971, 3.160407, -1.6437, 0, 0.0627451, 1, 1,
0.3712454, 0.2240552, -0.8267261, 0, 0.05882353, 1, 1,
0.3728631, 0.4116023, -1.653715, 0, 0.05098039, 1, 1,
0.3736137, -0.05297452, -0.3151943, 0, 0.04705882, 1, 1,
0.3753087, -1.304334, 4.168589, 0, 0.03921569, 1, 1,
0.3758879, 0.187623, 1.961188, 0, 0.03529412, 1, 1,
0.3767751, 1.17384, 1.914906, 0, 0.02745098, 1, 1,
0.376871, 0.1570279, 1.493551, 0, 0.02352941, 1, 1,
0.3804137, 0.8059808, 0.4555061, 0, 0.01568628, 1, 1,
0.3844344, -0.7331015, 3.551383, 0, 0.01176471, 1, 1,
0.3849591, -1.230312, 1.051235, 0, 0.003921569, 1, 1,
0.3858103, -0.2208083, 3.350534, 0.003921569, 0, 1, 1,
0.3909571, -0.5055153, 2.541802, 0.007843138, 0, 1, 1,
0.3949207, 1.792776, 0.1154602, 0.01568628, 0, 1, 1,
0.3983732, -1.772374, 1.144017, 0.01960784, 0, 1, 1,
0.4023096, 1.471096, 0.3867115, 0.02745098, 0, 1, 1,
0.4154494, -0.4483356, 0.5521353, 0.03137255, 0, 1, 1,
0.4166301, 1.779493, 1.641618, 0.03921569, 0, 1, 1,
0.4225206, -0.770372, 3.709151, 0.04313726, 0, 1, 1,
0.4248434, -0.8292105, 2.612529, 0.05098039, 0, 1, 1,
0.4253861, 1.157151, 1.707683, 0.05490196, 0, 1, 1,
0.4313211, 0.355803, 0.4399295, 0.0627451, 0, 1, 1,
0.4314559, 0.8608396, -1.123306, 0.06666667, 0, 1, 1,
0.4339883, 0.2284767, 0.4665653, 0.07450981, 0, 1, 1,
0.436004, -0.4365931, 3.374014, 0.07843138, 0, 1, 1,
0.4399233, 2.346163, 1.445049, 0.08627451, 0, 1, 1,
0.4458584, 1.415887, -0.02326285, 0.09019608, 0, 1, 1,
0.4468456, -0.1960643, 2.571034, 0.09803922, 0, 1, 1,
0.4487812, -0.4673452, 2.584147, 0.1058824, 0, 1, 1,
0.4493948, -0.6242023, 2.478674, 0.1098039, 0, 1, 1,
0.4504665, 0.2093754, -0.1884039, 0.1176471, 0, 1, 1,
0.4534917, 1.056212, 1.147491, 0.1215686, 0, 1, 1,
0.4550061, -0.7358781, 4.43789, 0.1294118, 0, 1, 1,
0.4574269, 0.6758455, 0.45871, 0.1333333, 0, 1, 1,
0.4604422, -0.4261474, 2.787857, 0.1411765, 0, 1, 1,
0.4629085, 1.117205, 0.138148, 0.145098, 0, 1, 1,
0.4648674, -1.969337, 0.8948755, 0.1529412, 0, 1, 1,
0.4681745, 0.1214076, 3.829918, 0.1568628, 0, 1, 1,
0.4683177, 0.5329496, 0.6213975, 0.1647059, 0, 1, 1,
0.4684022, 0.5249302, -1.374125, 0.1686275, 0, 1, 1,
0.4691877, 0.816034, 0.659377, 0.1764706, 0, 1, 1,
0.4709113, -0.8654917, 2.579419, 0.1803922, 0, 1, 1,
0.480811, 0.08453075, 2.20968, 0.1882353, 0, 1, 1,
0.4855899, 0.8487633, 1.240365, 0.1921569, 0, 1, 1,
0.4868993, -0.7390199, 3.51203, 0.2, 0, 1, 1,
0.4886865, -1.208734, 2.817665, 0.2078431, 0, 1, 1,
0.4905732, -0.6774432, 0.7062236, 0.2117647, 0, 1, 1,
0.4925683, 0.8702999, 0.2970178, 0.2196078, 0, 1, 1,
0.4944538, 0.1279661, 2.710689, 0.2235294, 0, 1, 1,
0.4944888, 1.389097, -1.104577, 0.2313726, 0, 1, 1,
0.4981622, 0.9168843, 0.8281953, 0.2352941, 0, 1, 1,
0.499766, 0.2844478, 0.4013466, 0.2431373, 0, 1, 1,
0.5012847, -2.102853, 3.077234, 0.2470588, 0, 1, 1,
0.5051363, -0.9932891, 3.87088, 0.254902, 0, 1, 1,
0.5052168, -1.4123, 2.825344, 0.2588235, 0, 1, 1,
0.5090013, -1.648365, 2.554244, 0.2666667, 0, 1, 1,
0.5116805, 1.437329, 0.7269993, 0.2705882, 0, 1, 1,
0.5122399, 0.9955577, 0.2622618, 0.2784314, 0, 1, 1,
0.5150583, 0.445305, 1.449269, 0.282353, 0, 1, 1,
0.5161405, 0.2478887, 0.4053375, 0.2901961, 0, 1, 1,
0.5176993, 0.992305, 1.096501, 0.2941177, 0, 1, 1,
0.5200454, -0.1208837, 2.819598, 0.3019608, 0, 1, 1,
0.521391, 0.3890891, 2.221269, 0.3098039, 0, 1, 1,
0.5258256, 0.5554103, 1.621128, 0.3137255, 0, 1, 1,
0.5292621, 1.693946, 0.9104265, 0.3215686, 0, 1, 1,
0.5298458, -0.7370995, 3.223851, 0.3254902, 0, 1, 1,
0.5401874, 0.8722016, 1.874056, 0.3333333, 0, 1, 1,
0.542682, -0.3245579, 1.65985, 0.3372549, 0, 1, 1,
0.5448739, 1.062394, 0.6083862, 0.345098, 0, 1, 1,
0.5471295, -0.3072529, 2.875773, 0.3490196, 0, 1, 1,
0.5512754, 0.5799499, -0.05443069, 0.3568628, 0, 1, 1,
0.5545483, 3.146745, 0.2755691, 0.3607843, 0, 1, 1,
0.556536, 0.1636159, 1.851668, 0.3686275, 0, 1, 1,
0.559981, 0.06073196, 2.377069, 0.372549, 0, 1, 1,
0.5622898, 0.1828571, 3.103607, 0.3803922, 0, 1, 1,
0.5638016, -1.146899, 0.5978648, 0.3843137, 0, 1, 1,
0.5678873, -0.1300651, 1.794227, 0.3921569, 0, 1, 1,
0.5727119, 0.2244965, 1.332172, 0.3960784, 0, 1, 1,
0.5768389, 1.948633, -1.046414, 0.4039216, 0, 1, 1,
0.5940718, 0.2117682, 0.8893933, 0.4117647, 0, 1, 1,
0.5981629, -0.1760896, 1.085495, 0.4156863, 0, 1, 1,
0.6029245, -0.4127462, 1.632995, 0.4235294, 0, 1, 1,
0.6070501, -0.7384945, 3.244428, 0.427451, 0, 1, 1,
0.6074678, 0.04646503, 1.524399, 0.4352941, 0, 1, 1,
0.6197075, 0.4702233, 0.9309297, 0.4392157, 0, 1, 1,
0.6257289, 0.6400814, 2.478683, 0.4470588, 0, 1, 1,
0.6267313, -0.4067261, 1.356062, 0.4509804, 0, 1, 1,
0.6268742, -0.01168439, 1.147675, 0.4588235, 0, 1, 1,
0.6281654, 1.395697, 0.9042143, 0.4627451, 0, 1, 1,
0.635215, 1.111398, 0.5481891, 0.4705882, 0, 1, 1,
0.6367461, -0.7286497, 3.160461, 0.4745098, 0, 1, 1,
0.637385, -0.1728071, 1.833833, 0.4823529, 0, 1, 1,
0.6400059, 0.5068069, 1.545485, 0.4862745, 0, 1, 1,
0.6527956, 0.4663901, 3.017355, 0.4941176, 0, 1, 1,
0.6539906, -0.2621621, 1.87034, 0.5019608, 0, 1, 1,
0.656244, 0.8351634, 1.413111, 0.5058824, 0, 1, 1,
0.6590278, -1.479433, 2.879475, 0.5137255, 0, 1, 1,
0.6592779, 1.052167, 1.729108, 0.5176471, 0, 1, 1,
0.6608832, -0.3766419, 1.594311, 0.5254902, 0, 1, 1,
0.6655186, -1.149243, 2.581832, 0.5294118, 0, 1, 1,
0.6728663, -0.06923971, 1.870911, 0.5372549, 0, 1, 1,
0.6731253, 0.3756658, 0.9225001, 0.5411765, 0, 1, 1,
0.6769149, 0.1076766, 0.5733179, 0.5490196, 0, 1, 1,
0.6769639, 0.03984718, 2.376155, 0.5529412, 0, 1, 1,
0.6812447, -0.549832, 1.472811, 0.5607843, 0, 1, 1,
0.688921, -0.03177702, 2.654664, 0.5647059, 0, 1, 1,
0.6915023, -0.6485392, 2.667407, 0.572549, 0, 1, 1,
0.6963375, 1.036924, 0.5278627, 0.5764706, 0, 1, 1,
0.7017201, -0.3925939, 3.832986, 0.5843138, 0, 1, 1,
0.7039894, -1.349212, 2.868234, 0.5882353, 0, 1, 1,
0.7042138, -0.3581873, 0.3142851, 0.5960785, 0, 1, 1,
0.7043259, -0.4904682, 2.192112, 0.6039216, 0, 1, 1,
0.7126687, 0.7364158, 0.7286946, 0.6078432, 0, 1, 1,
0.7129781, -0.5279301, 2.952207, 0.6156863, 0, 1, 1,
0.7222926, -0.4375006, 1.203966, 0.6196079, 0, 1, 1,
0.7239473, -0.599816, 0.9305376, 0.627451, 0, 1, 1,
0.7336044, -1.135667, 3.44772, 0.6313726, 0, 1, 1,
0.7338144, 0.9168873, -1.071261, 0.6392157, 0, 1, 1,
0.7349372, -0.3989195, 3.007661, 0.6431373, 0, 1, 1,
0.7385851, 0.8635378, 1.524922, 0.6509804, 0, 1, 1,
0.7415296, 0.8441285, 0.1561552, 0.654902, 0, 1, 1,
0.7465802, -0.9356015, 3.201692, 0.6627451, 0, 1, 1,
0.7503524, 1.507298, 1.333623, 0.6666667, 0, 1, 1,
0.7555482, -1.421044, 2.318043, 0.6745098, 0, 1, 1,
0.7576385, 0.03479379, 0.5429656, 0.6784314, 0, 1, 1,
0.7612523, 0.008152889, 0.05449754, 0.6862745, 0, 1, 1,
0.7613249, 0.6218706, -0.483606, 0.6901961, 0, 1, 1,
0.770528, -1.178126, 0.8051348, 0.6980392, 0, 1, 1,
0.7706739, 0.3982648, 0.2912302, 0.7058824, 0, 1, 1,
0.7709963, -2.004495, 1.123713, 0.7098039, 0, 1, 1,
0.7718968, -0.7647184, 2.240275, 0.7176471, 0, 1, 1,
0.772633, -1.278535, 2.78895, 0.7215686, 0, 1, 1,
0.7762716, 0.1859811, 1.065891, 0.7294118, 0, 1, 1,
0.7784165, 1.011492, 1.687672, 0.7333333, 0, 1, 1,
0.7808926, -0.6687559, 3.62722, 0.7411765, 0, 1, 1,
0.7823985, -1.385634, 3.678618, 0.7450981, 0, 1, 1,
0.789561, -2.229945, 4.293217, 0.7529412, 0, 1, 1,
0.7897061, -0.07561839, 2.416804, 0.7568628, 0, 1, 1,
0.7925174, 0.6502778, 0.9810562, 0.7647059, 0, 1, 1,
0.7928359, 0.4060779, 0.8410616, 0.7686275, 0, 1, 1,
0.7959266, 0.8401002, 0.9650274, 0.7764706, 0, 1, 1,
0.7984771, -0.1209838, 3.028479, 0.7803922, 0, 1, 1,
0.7987064, 0.575585, 2.855181, 0.7882353, 0, 1, 1,
0.8039784, -0.6465792, 3.712557, 0.7921569, 0, 1, 1,
0.8065131, -0.7994423, 3.193375, 0.8, 0, 1, 1,
0.8102055, 0.9528034, -0.2710975, 0.8078431, 0, 1, 1,
0.8362606, -1.409504, 3.235177, 0.8117647, 0, 1, 1,
0.8370141, -1.84937, 3.665442, 0.8196079, 0, 1, 1,
0.8412004, -0.3668061, 2.374694, 0.8235294, 0, 1, 1,
0.8485349, -0.00763462, 1.738271, 0.8313726, 0, 1, 1,
0.8487361, -0.434421, 3.722396, 0.8352941, 0, 1, 1,
0.8535079, -0.2542797, 1.645793, 0.8431373, 0, 1, 1,
0.854021, -0.1367021, 0.9496741, 0.8470588, 0, 1, 1,
0.8607171, -0.1784172, 0.9663441, 0.854902, 0, 1, 1,
0.8629094, 0.4165421, 1.817649, 0.8588235, 0, 1, 1,
0.8643279, -0.8487721, 1.781316, 0.8666667, 0, 1, 1,
0.8646703, 0.1372486, 2.564, 0.8705882, 0, 1, 1,
0.8679671, 1.861436, 1.031231, 0.8784314, 0, 1, 1,
0.8700753, 0.3324103, 0.9457697, 0.8823529, 0, 1, 1,
0.8701358, 1.448238, 0.07915021, 0.8901961, 0, 1, 1,
0.8710529, -0.1011921, 2.349772, 0.8941177, 0, 1, 1,
0.8770776, 0.2752093, 1.501981, 0.9019608, 0, 1, 1,
0.8795372, -0.1114327, 1.872603, 0.9098039, 0, 1, 1,
0.8847917, 0.7843067, 0.01633018, 0.9137255, 0, 1, 1,
0.8856404, 0.3084712, 0.494204, 0.9215686, 0, 1, 1,
0.8900574, 0.7806027, -1.762559, 0.9254902, 0, 1, 1,
0.8921287, 0.8095744, 0.5522423, 0.9333333, 0, 1, 1,
0.8962088, 0.5648648, -0.1636186, 0.9372549, 0, 1, 1,
0.9030721, 1.005313, -0.04344246, 0.945098, 0, 1, 1,
0.9106373, 0.6234491, 0.5542682, 0.9490196, 0, 1, 1,
0.9115182, 1.58903, -0.2209616, 0.9568627, 0, 1, 1,
0.9116573, 1.363143, 0.30047, 0.9607843, 0, 1, 1,
0.9225967, 0.2181094, -0.947369, 0.9686275, 0, 1, 1,
0.9237985, -0.7949226, 0.9703987, 0.972549, 0, 1, 1,
0.9321838, 1.035902, 0.7813794, 0.9803922, 0, 1, 1,
0.9483072, 0.2782581, 2.221889, 0.9843137, 0, 1, 1,
0.9485214, -0.4556792, 2.155278, 0.9921569, 0, 1, 1,
0.9531185, -0.4160266, 2.294141, 0.9960784, 0, 1, 1,
0.9645323, -1.904969, 2.856286, 1, 0, 0.9960784, 1,
0.9699795, -1.671786, 2.162012, 1, 0, 0.9882353, 1,
0.9707925, -0.425782, 0.9394564, 1, 0, 0.9843137, 1,
0.9816515, 0.7648489, 3.426397, 1, 0, 0.9764706, 1,
0.9834577, -0.2679024, 0.4673885, 1, 0, 0.972549, 1,
0.9870777, 0.07559071, 2.974444, 1, 0, 0.9647059, 1,
0.999705, 1.48991, 1.61169, 1, 0, 0.9607843, 1,
1.006408, -0.6583885, 3.617886, 1, 0, 0.9529412, 1,
1.009564, -0.7160072, 0.9763279, 1, 0, 0.9490196, 1,
1.013672, -1.53235, 1.09677, 1, 0, 0.9411765, 1,
1.020384, -1.708672, 3.430873, 1, 0, 0.9372549, 1,
1.022866, -0.6022645, 1.828197, 1, 0, 0.9294118, 1,
1.02355, 0.3489777, 0.8730531, 1, 0, 0.9254902, 1,
1.033399, -1.328443, 2.760034, 1, 0, 0.9176471, 1,
1.034098, 1.345494, 1.50957, 1, 0, 0.9137255, 1,
1.047735, 2.355509, -0.05281821, 1, 0, 0.9058824, 1,
1.048814, 0.1205664, 1.828621, 1, 0, 0.9019608, 1,
1.051633, -0.2437053, 3.506593, 1, 0, 0.8941177, 1,
1.056717, -0.9266584, 4.485218, 1, 0, 0.8862745, 1,
1.056986, 0.8281042, 1.285829, 1, 0, 0.8823529, 1,
1.057236, 1.276706, 1.202582, 1, 0, 0.8745098, 1,
1.059387, 1.254508, -1.28888, 1, 0, 0.8705882, 1,
1.066571, -0.3527148, 2.755038, 1, 0, 0.8627451, 1,
1.069079, 0.1528056, 1.186763, 1, 0, 0.8588235, 1,
1.073919, -0.6368227, 2.81094, 1, 0, 0.8509804, 1,
1.075517, -0.6362452, 0.8610699, 1, 0, 0.8470588, 1,
1.077078, 0.9755132, -0.498976, 1, 0, 0.8392157, 1,
1.077564, -1.497394, 3.83369, 1, 0, 0.8352941, 1,
1.078911, 0.5838486, 0.8353406, 1, 0, 0.827451, 1,
1.079604, 2.490082, 1.235628, 1, 0, 0.8235294, 1,
1.088864, 0.06410401, 1.948832, 1, 0, 0.8156863, 1,
1.095022, 0.9373098, 0.9322737, 1, 0, 0.8117647, 1,
1.09772, -0.9675989, 3.580468, 1, 0, 0.8039216, 1,
1.09849, 1.287002, 0.8049055, 1, 0, 0.7960784, 1,
1.104485, -0.7276244, 2.913437, 1, 0, 0.7921569, 1,
1.106731, -0.4550495, 1.877502, 1, 0, 0.7843137, 1,
1.107904, 0.4722203, 4.297897, 1, 0, 0.7803922, 1,
1.108014, -1.067446, 2.57987, 1, 0, 0.772549, 1,
1.109701, -0.07666115, -0.001033892, 1, 0, 0.7686275, 1,
1.113505, -0.2950454, 2.175698, 1, 0, 0.7607843, 1,
1.122615, 1.529444, 0.9472028, 1, 0, 0.7568628, 1,
1.127491, 0.2564698, 3.047267, 1, 0, 0.7490196, 1,
1.134263, 1.661069, 0.8302029, 1, 0, 0.7450981, 1,
1.138077, -1.027553, 1.98266, 1, 0, 0.7372549, 1,
1.147905, 0.4941835, -0.424793, 1, 0, 0.7333333, 1,
1.14882, -1.244303, 3.972928, 1, 0, 0.7254902, 1,
1.154916, -0.6836225, 2.869367, 1, 0, 0.7215686, 1,
1.160436, -1.787244, 2.212389, 1, 0, 0.7137255, 1,
1.161433, -1.873473, 2.489252, 1, 0, 0.7098039, 1,
1.174245, 1.190602, 1.198542, 1, 0, 0.7019608, 1,
1.175367, 0.2938946, 2.833568, 1, 0, 0.6941177, 1,
1.175405, 0.9524557, 2.251092, 1, 0, 0.6901961, 1,
1.183764, 0.7543041, 0.8881517, 1, 0, 0.682353, 1,
1.196077, 2.58204, -0.2833965, 1, 0, 0.6784314, 1,
1.20944, -0.3108646, 0.1933815, 1, 0, 0.6705883, 1,
1.211485, 1.070186, 1.559449, 1, 0, 0.6666667, 1,
1.213279, 0.972344, 2.588109, 1, 0, 0.6588235, 1,
1.222448, 0.6046352, 1.157472, 1, 0, 0.654902, 1,
1.22371, -1.722178, 2.330888, 1, 0, 0.6470588, 1,
1.223957, 0.7512258, 0.1428358, 1, 0, 0.6431373, 1,
1.229648, -0.4106017, 2.014641, 1, 0, 0.6352941, 1,
1.23085, 0.3318252, 1.616386, 1, 0, 0.6313726, 1,
1.23524, 0.816678, 3.093632, 1, 0, 0.6235294, 1,
1.238052, 0.4117711, 2.629641, 1, 0, 0.6196079, 1,
1.25497, 1.32195, 0.7247675, 1, 0, 0.6117647, 1,
1.257859, -0.7593699, 0.6472833, 1, 0, 0.6078432, 1,
1.273877, 1.925239, -0.08860878, 1, 0, 0.6, 1,
1.283141, 0.6766508, -0.4890336, 1, 0, 0.5921569, 1,
1.289574, -1.083491, 1.653971, 1, 0, 0.5882353, 1,
1.295297, -0.1158806, 1.448707, 1, 0, 0.5803922, 1,
1.299832, -0.9845494, 3.397516, 1, 0, 0.5764706, 1,
1.306778, -0.7259961, -0.8409589, 1, 0, 0.5686275, 1,
1.310136, 0.3458809, 1.751682, 1, 0, 0.5647059, 1,
1.314003, -1.933614, 2.605661, 1, 0, 0.5568628, 1,
1.321263, -1.9378, 2.061276, 1, 0, 0.5529412, 1,
1.324475, 1.571775, 1.353406, 1, 0, 0.5450981, 1,
1.329616, -1.245322, 0.7106867, 1, 0, 0.5411765, 1,
1.338633, -1.584383, 2.59712, 1, 0, 0.5333334, 1,
1.338866, 1.037032, -0.3135976, 1, 0, 0.5294118, 1,
1.341765, 0.590917, 0.3029147, 1, 0, 0.5215687, 1,
1.344614, 0.5528715, 1.564758, 1, 0, 0.5176471, 1,
1.346407, 2.22271, 1.071822, 1, 0, 0.509804, 1,
1.355715, 0.4908191, 1.015047, 1, 0, 0.5058824, 1,
1.366807, -0.5235348, 1.925471, 1, 0, 0.4980392, 1,
1.375877, -0.04426103, 0.8676725, 1, 0, 0.4901961, 1,
1.399102, 0.5222436, 1.12799, 1, 0, 0.4862745, 1,
1.410231, -1.408475, 2.989103, 1, 0, 0.4784314, 1,
1.41028, 1.10908, -0.2241818, 1, 0, 0.4745098, 1,
1.411029, -0.8436968, 3.621701, 1, 0, 0.4666667, 1,
1.427593, -0.620738, 2.403465, 1, 0, 0.4627451, 1,
1.433015, 1.242185, 1.69872, 1, 0, 0.454902, 1,
1.437513, 1.670173, 2.645645, 1, 0, 0.4509804, 1,
1.442168, -0.6577616, 2.373248, 1, 0, 0.4431373, 1,
1.443722, -0.1702537, 2.457414, 1, 0, 0.4392157, 1,
1.451416, -0.8220302, 3.642617, 1, 0, 0.4313726, 1,
1.452254, -0.3367222, -0.630547, 1, 0, 0.427451, 1,
1.456095, 0.3522516, 1.176107, 1, 0, 0.4196078, 1,
1.457453, -1.017765, 1.530933, 1, 0, 0.4156863, 1,
1.463583, 0.2817052, 0.351758, 1, 0, 0.4078431, 1,
1.468858, 0.3215577, 1.507647, 1, 0, 0.4039216, 1,
1.4796, -0.1501116, 2.947695, 1, 0, 0.3960784, 1,
1.479704, 0.7157194, 1.907508, 1, 0, 0.3882353, 1,
1.481271, 0.5684912, 1.306685, 1, 0, 0.3843137, 1,
1.490914, -1.083391, 3.684934, 1, 0, 0.3764706, 1,
1.50177, 0.7806549, -0.05666462, 1, 0, 0.372549, 1,
1.511711, 0.7802225, 3.426903, 1, 0, 0.3647059, 1,
1.520233, 0.1507451, 1.442525, 1, 0, 0.3607843, 1,
1.526293, 0.3643705, 0.4147461, 1, 0, 0.3529412, 1,
1.5289, -0.6940082, 4.665423, 1, 0, 0.3490196, 1,
1.535169, 0.738061, 0.6717998, 1, 0, 0.3411765, 1,
1.539626, -1.053083, 2.714082, 1, 0, 0.3372549, 1,
1.553297, 0.2562517, 0.03531229, 1, 0, 0.3294118, 1,
1.556787, -1.495275, 1.14858, 1, 0, 0.3254902, 1,
1.558051, 1.092267, 1.390658, 1, 0, 0.3176471, 1,
1.559998, 0.4437403, 1.517911, 1, 0, 0.3137255, 1,
1.564, -0.5096133, 0.6992173, 1, 0, 0.3058824, 1,
1.57249, -0.7285865, 2.963363, 1, 0, 0.2980392, 1,
1.580293, -0.03229514, 2.702299, 1, 0, 0.2941177, 1,
1.582963, -0.4977032, 1.076499, 1, 0, 0.2862745, 1,
1.596583, 0.2882044, 2.227905, 1, 0, 0.282353, 1,
1.597962, 0.6509913, 0.3654912, 1, 0, 0.2745098, 1,
1.604002, -1.511655, 1.687891, 1, 0, 0.2705882, 1,
1.639594, 0.7772292, 0.8714701, 1, 0, 0.2627451, 1,
1.645257, -0.06983918, 2.863619, 1, 0, 0.2588235, 1,
1.6547, -1.47578, 2.024961, 1, 0, 0.2509804, 1,
1.657855, -2.241677, 1.858507, 1, 0, 0.2470588, 1,
1.663483, 0.7373056, 1.075495, 1, 0, 0.2392157, 1,
1.670514, -1.298359, 1.028582, 1, 0, 0.2352941, 1,
1.674217, 0.04140321, 0.678871, 1, 0, 0.227451, 1,
1.674746, -1.808649, 3.207623, 1, 0, 0.2235294, 1,
1.687569, 2.919901, 1.787799, 1, 0, 0.2156863, 1,
1.691064, 0.928879, 1.367639, 1, 0, 0.2117647, 1,
1.701637, -0.754936, 2.174631, 1, 0, 0.2039216, 1,
1.706776, -1.259984, 3.051219, 1, 0, 0.1960784, 1,
1.736775, 0.1317928, 0.9069338, 1, 0, 0.1921569, 1,
1.755472, -1.61956, 3.467382, 1, 0, 0.1843137, 1,
1.780119, -1.238425, 0.3706372, 1, 0, 0.1803922, 1,
1.802245, -0.439241, 1.479181, 1, 0, 0.172549, 1,
1.851037, 1.446706, -0.005785322, 1, 0, 0.1686275, 1,
1.884166, 0.5881295, -0.5888208, 1, 0, 0.1607843, 1,
1.894758, 0.4980203, 1.075145, 1, 0, 0.1568628, 1,
1.968728, -0.1836538, 2.202371, 1, 0, 0.1490196, 1,
1.983116, -0.3147241, 2.282071, 1, 0, 0.145098, 1,
1.986884, 0.4731923, 0.3804925, 1, 0, 0.1372549, 1,
2.012485, 1.16767, 1.690233, 1, 0, 0.1333333, 1,
2.028899, 0.6652033, 1.963554, 1, 0, 0.1254902, 1,
2.048501, 0.2601088, 0.3585665, 1, 0, 0.1215686, 1,
2.05691, 0.2585645, -0.09982301, 1, 0, 0.1137255, 1,
2.083785, -1.048264, 1.004439, 1, 0, 0.1098039, 1,
2.085852, 2.94201, -0.6120296, 1, 0, 0.1019608, 1,
2.094838, 1.168136, 0.09500885, 1, 0, 0.09411765, 1,
2.118237, 0.285193, 1.273864, 1, 0, 0.09019608, 1,
2.123284, -0.9327134, 1.873072, 1, 0, 0.08235294, 1,
2.233829, -0.1181334, 0.9100799, 1, 0, 0.07843138, 1,
2.234269, 0.4913754, 1.673295, 1, 0, 0.07058824, 1,
2.287154, 0.4928212, 0.7729285, 1, 0, 0.06666667, 1,
2.351346, -0.4988694, 2.003959, 1, 0, 0.05882353, 1,
2.370283, 1.990344, -1.536008, 1, 0, 0.05490196, 1,
2.492877, -1.066922, 2.837343, 1, 0, 0.04705882, 1,
2.636508, 0.6699644, 1.715378, 1, 0, 0.04313726, 1,
2.637912, -1.441973, 2.114424, 1, 0, 0.03529412, 1,
2.64985, 0.153455, 1.096281, 1, 0, 0.03137255, 1,
2.728428, 1.04745, 2.082555, 1, 0, 0.02352941, 1,
2.882729, -0.8358333, 4.289343, 1, 0, 0.01960784, 1,
3.143857, 0.6372057, 3.108357, 1, 0, 0.01176471, 1,
3.565933, 0.3000503, -0.1038235, 1, 0, 0.007843138, 1
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
0.08252347, -4.510276, -7.302679, 0, -0.5, 0.5, 0.5,
0.08252347, -4.510276, -7.302679, 1, -0.5, 0.5, 0.5,
0.08252347, -4.510276, -7.302679, 1, 1.5, 0.5, 0.5,
0.08252347, -4.510276, -7.302679, 0, 1.5, 0.5, 0.5
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
-4.581762, -0.09327388, -7.302679, 0, -0.5, 0.5, 0.5,
-4.581762, -0.09327388, -7.302679, 1, -0.5, 0.5, 0.5,
-4.581762, -0.09327388, -7.302679, 1, 1.5, 0.5, 0.5,
-4.581762, -0.09327388, -7.302679, 0, 1.5, 0.5, 0.5
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
-4.581762, -4.510276, 0.03466463, 0, -0.5, 0.5, 0.5,
-4.581762, -4.510276, 0.03466463, 1, -0.5, 0.5, 0.5,
-4.581762, -4.510276, 0.03466463, 1, 1.5, 0.5, 0.5,
-4.581762, -4.510276, 0.03466463, 0, 1.5, 0.5, 0.5
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
-3, -3.490968, -5.609446,
3, -3.490968, -5.609446,
-3, -3.490968, -5.609446,
-3, -3.660852, -5.891651,
-2, -3.490968, -5.609446,
-2, -3.660852, -5.891651,
-1, -3.490968, -5.609446,
-1, -3.660852, -5.891651,
0, -3.490968, -5.609446,
0, -3.660852, -5.891651,
1, -3.490968, -5.609446,
1, -3.660852, -5.891651,
2, -3.490968, -5.609446,
2, -3.660852, -5.891651,
3, -3.490968, -5.609446,
3, -3.660852, -5.891651
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
-3, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
-3, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
-3, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
-3, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
-2, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
-2, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
-2, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
-2, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
-1, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
-1, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
-1, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
-1, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
0, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
0, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
0, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
0, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
1, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
1, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
1, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
1, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
2, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
2, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
2, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
2, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5,
3, -4.000622, -6.456062, 0, -0.5, 0.5, 0.5,
3, -4.000622, -6.456062, 1, -0.5, 0.5, 0.5,
3, -4.000622, -6.456062, 1, 1.5, 0.5, 0.5,
3, -4.000622, -6.456062, 0, 1.5, 0.5, 0.5
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
-3.505388, -3, -5.609446,
-3.505388, 3, -5.609446,
-3.505388, -3, -5.609446,
-3.684784, -3, -5.891651,
-3.505388, -2, -5.609446,
-3.684784, -2, -5.891651,
-3.505388, -1, -5.609446,
-3.684784, -1, -5.891651,
-3.505388, 0, -5.609446,
-3.684784, 0, -5.891651,
-3.505388, 1, -5.609446,
-3.684784, 1, -5.891651,
-3.505388, 2, -5.609446,
-3.684784, 2, -5.891651,
-3.505388, 3, -5.609446,
-3.684784, 3, -5.891651
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
-4.043575, -3, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, -3, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, -3, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, -3, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, -2, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, -2, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, -2, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, -2, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, -1, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, -1, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, -1, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, -1, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, 0, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, 0, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, 0, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, 0, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, 1, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, 1, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, 1, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, 1, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, 2, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, 2, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, 2, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, 2, -6.456062, 0, 1.5, 0.5, 0.5,
-4.043575, 3, -6.456062, 0, -0.5, 0.5, 0.5,
-4.043575, 3, -6.456062, 1, -0.5, 0.5, 0.5,
-4.043575, 3, -6.456062, 1, 1.5, 0.5, 0.5,
-4.043575, 3, -6.456062, 0, 1.5, 0.5, 0.5
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
-3.505388, -3.490968, -4,
-3.505388, -3.490968, 4,
-3.505388, -3.490968, -4,
-3.684784, -3.660852, -4,
-3.505388, -3.490968, -2,
-3.684784, -3.660852, -2,
-3.505388, -3.490968, 0,
-3.684784, -3.660852, 0,
-3.505388, -3.490968, 2,
-3.684784, -3.660852, 2,
-3.505388, -3.490968, 4,
-3.684784, -3.660852, 4
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
-4.043575, -4.000622, -4, 0, -0.5, 0.5, 0.5,
-4.043575, -4.000622, -4, 1, -0.5, 0.5, 0.5,
-4.043575, -4.000622, -4, 1, 1.5, 0.5, 0.5,
-4.043575, -4.000622, -4, 0, 1.5, 0.5, 0.5,
-4.043575, -4.000622, -2, 0, -0.5, 0.5, 0.5,
-4.043575, -4.000622, -2, 1, -0.5, 0.5, 0.5,
-4.043575, -4.000622, -2, 1, 1.5, 0.5, 0.5,
-4.043575, -4.000622, -2, 0, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 0, 0, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 0, 1, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 0, 1, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 0, 0, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 2, 0, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 2, 1, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 2, 1, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 2, 0, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 4, 0, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 4, 1, -0.5, 0.5, 0.5,
-4.043575, -4.000622, 4, 1, 1.5, 0.5, 0.5,
-4.043575, -4.000622, 4, 0, 1.5, 0.5, 0.5
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
-3.505388, -3.490968, -5.609446,
-3.505388, 3.30442, -5.609446,
-3.505388, -3.490968, 5.678775,
-3.505388, 3.30442, 5.678775,
-3.505388, -3.490968, -5.609446,
-3.505388, -3.490968, 5.678775,
-3.505388, 3.30442, -5.609446,
-3.505388, 3.30442, 5.678775,
-3.505388, -3.490968, -5.609446,
3.670435, -3.490968, -5.609446,
-3.505388, -3.490968, 5.678775,
3.670435, -3.490968, 5.678775,
-3.505388, 3.30442, -5.609446,
3.670435, 3.30442, -5.609446,
-3.505388, 3.30442, 5.678775,
3.670435, 3.30442, 5.678775,
3.670435, -3.490968, -5.609446,
3.670435, 3.30442, -5.609446,
3.670435, -3.490968, 5.678775,
3.670435, 3.30442, 5.678775,
3.670435, -3.490968, -5.609446,
3.670435, -3.490968, 5.678775,
3.670435, 3.30442, -5.609446,
3.670435, 3.30442, 5.678775
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
var radius = 8.011376;
var distance = 35.64352;
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
mvMatrix.translate( -0.08252347, 0.09327388, -0.03466463 );
mvMatrix.scale( 1.207117, 1.274696, 0.7673536 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.64352);
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
carbetamid<-read.table("carbetamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carbetamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
```

```r
y<-carbetamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
```

```r
z<-carbetamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
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
-3.400886, 0.6590499, -0.6153366, 0, 0, 1, 1, 1,
-3.157505, 0.02923951, -0.6248312, 1, 0, 0, 1, 1,
-3.045634, 0.1342375, -1.115019, 1, 0, 0, 1, 1,
-2.868031, 0.5514199, 0.6633675, 1, 0, 0, 1, 1,
-2.862754, -0.1154881, -3.879224, 1, 0, 0, 1, 1,
-2.725979, 1.088629, -0.7793787, 1, 0, 0, 1, 1,
-2.710395, 0.645848, -0.943593, 0, 0, 0, 1, 1,
-2.619593, -0.2282244, 0.7446803, 0, 0, 0, 1, 1,
-2.401586, 0.8754346, -1.314558, 0, 0, 0, 1, 1,
-2.350693, -0.9008835, -1.91535, 0, 0, 0, 1, 1,
-2.305487, -0.6775863, -2.743302, 0, 0, 0, 1, 1,
-2.250341, 0.2203964, -3.149674, 0, 0, 0, 1, 1,
-2.198723, -0.5999156, -1.403159, 0, 0, 0, 1, 1,
-2.146087, -0.1085412, -1.276016, 1, 1, 1, 1, 1,
-2.143163, -0.7475075, -1.145579, 1, 1, 1, 1, 1,
-2.139748, -1.425521, -1.342647, 1, 1, 1, 1, 1,
-2.122245, -1.532967, -3.182313, 1, 1, 1, 1, 1,
-2.017632, 0.2585071, -0.7327648, 1, 1, 1, 1, 1,
-1.985267, 0.5544118, -1.413662, 1, 1, 1, 1, 1,
-1.974722, 0.3772547, -2.815459, 1, 1, 1, 1, 1,
-1.968294, -0.7531284, -2.072312, 1, 1, 1, 1, 1,
-1.962854, 0.9776627, -1.444548, 1, 1, 1, 1, 1,
-1.960937, 0.106957, -0.7203479, 1, 1, 1, 1, 1,
-1.957199, -0.4505938, -3.084846, 1, 1, 1, 1, 1,
-1.947729, -0.8673921, -0.3766183, 1, 1, 1, 1, 1,
-1.943131, 0.2379209, -0.6533823, 1, 1, 1, 1, 1,
-1.93522, -0.7552493, -1.107867, 1, 1, 1, 1, 1,
-1.929599, 0.1310479, -0.1002528, 1, 1, 1, 1, 1,
-1.926388, 0.2343573, -0.2049388, 0, 0, 1, 1, 1,
-1.914645, 0.4452657, -2.493962, 1, 0, 0, 1, 1,
-1.911106, 0.0221317, -0.8792956, 1, 0, 0, 1, 1,
-1.905673, 0.6939194, -0.3212957, 1, 0, 0, 1, 1,
-1.905339, 0.002643509, -1.39073, 1, 0, 0, 1, 1,
-1.901266, -0.857425, -0.486225, 1, 0, 0, 1, 1,
-1.899301, -0.219083, -1.759694, 0, 0, 0, 1, 1,
-1.898664, -0.4503027, -1.135549, 0, 0, 0, 1, 1,
-1.894437, -1.604841, -4.866397, 0, 0, 0, 1, 1,
-1.885025, -0.07594243, -1.213814, 0, 0, 0, 1, 1,
-1.875827, 1.038316, -2.156545, 0, 0, 0, 1, 1,
-1.867701, -1.960147, -3.876009, 0, 0, 0, 1, 1,
-1.860094, 0.6651635, -1.813458, 0, 0, 0, 1, 1,
-1.848474, -0.3005804, -1.551055, 1, 1, 1, 1, 1,
-1.847876, -0.1823507, -1.910145, 1, 1, 1, 1, 1,
-1.825302, 1.556068, -0.9463528, 1, 1, 1, 1, 1,
-1.812289, 0.5909369, -0.4038564, 1, 1, 1, 1, 1,
-1.807211, 0.01081808, 0.6461565, 1, 1, 1, 1, 1,
-1.798586, -0.6428958, -2.325372, 1, 1, 1, 1, 1,
-1.797634, -2.233007, -1.721005, 1, 1, 1, 1, 1,
-1.787369, 0.7690413, -1.024379, 1, 1, 1, 1, 1,
-1.776778, 0.5098917, 0.5001907, 1, 1, 1, 1, 1,
-1.772536, 0.171911, -0.3862807, 1, 1, 1, 1, 1,
-1.772323, 1.95524, 0.2753651, 1, 1, 1, 1, 1,
-1.75525, -1.121733, -1.098318, 1, 1, 1, 1, 1,
-1.731081, 0.9260991, -0.4898351, 1, 1, 1, 1, 1,
-1.716864, 0.7891235, -0.3918997, 1, 1, 1, 1, 1,
-1.711598, 0.97369, -1.811921, 1, 1, 1, 1, 1,
-1.707921, -0.02469448, -2.063999, 0, 0, 1, 1, 1,
-1.695904, 0.4466058, -0.7019398, 1, 0, 0, 1, 1,
-1.682755, 0.7743397, -1.253894, 1, 0, 0, 1, 1,
-1.66137, -1.085302, -2.452678, 1, 0, 0, 1, 1,
-1.65826, 0.9960086, -2.381628, 1, 0, 0, 1, 1,
-1.654156, 0.07238266, -1.375156, 1, 0, 0, 1, 1,
-1.647112, 1.825419, -1.839038, 0, 0, 0, 1, 1,
-1.642205, 1.45321, -1.502456, 0, 0, 0, 1, 1,
-1.637948, 0.2622575, -2.771739, 0, 0, 0, 1, 1,
-1.633769, -0.5645375, -2.117762, 0, 0, 0, 1, 1,
-1.632899, -0.5575671, -1.364771, 0, 0, 0, 1, 1,
-1.623662, -1.805595, -2.645196, 0, 0, 0, 1, 1,
-1.612351, 0.6010227, -0.08847795, 0, 0, 0, 1, 1,
-1.602631, 0.6298285, -0.2030394, 1, 1, 1, 1, 1,
-1.59996, -1.333602, -1.359542, 1, 1, 1, 1, 1,
-1.576561, 0.2894229, -2.619525, 1, 1, 1, 1, 1,
-1.521893, 1.499113, 0.1768463, 1, 1, 1, 1, 1,
-1.512447, -0.2662906, -1.531681, 1, 1, 1, 1, 1,
-1.50905, 0.9867662, 0.2822595, 1, 1, 1, 1, 1,
-1.5036, -0.5143614, -0.9822519, 1, 1, 1, 1, 1,
-1.501819, 0.03421445, -0.4442093, 1, 1, 1, 1, 1,
-1.501762, 2.049675, -1.758324, 1, 1, 1, 1, 1,
-1.498236, -1.632524, -2.186, 1, 1, 1, 1, 1,
-1.49344, 0.3719465, -3.250061, 1, 1, 1, 1, 1,
-1.481706, 0.5433552, -0.5816797, 1, 1, 1, 1, 1,
-1.481636, -1.166032, -2.284406, 1, 1, 1, 1, 1,
-1.481235, -0.3031907, -3.044421, 1, 1, 1, 1, 1,
-1.468608, -0.8650353, -1.979069, 1, 1, 1, 1, 1,
-1.46726, -1.934533, -1.7438, 0, 0, 1, 1, 1,
-1.459574, 0.3596236, -1.03545, 1, 0, 0, 1, 1,
-1.451492, 0.2137015, -3.216088, 1, 0, 0, 1, 1,
-1.45091, 1.297192, -1.090633, 1, 0, 0, 1, 1,
-1.442325, -1.280203, -1.870462, 1, 0, 0, 1, 1,
-1.430301, 0.838922, -0.3785244, 1, 0, 0, 1, 1,
-1.415917, 1.232311, -1.762946, 0, 0, 0, 1, 1,
-1.413286, 1.485893, -0.6820376, 0, 0, 0, 1, 1,
-1.407204, 1.40122, -1.878469, 0, 0, 0, 1, 1,
-1.396613, 2.295727, 0.3877002, 0, 0, 0, 1, 1,
-1.39556, 0.1745784, -1.878871, 0, 0, 0, 1, 1,
-1.391435, -0.3143091, -0.4627525, 0, 0, 0, 1, 1,
-1.389386, -1.32637, -1.445996, 0, 0, 0, 1, 1,
-1.374943, -0.8838525, -1.256826, 1, 1, 1, 1, 1,
-1.374827, 0.1146436, -0.8741133, 1, 1, 1, 1, 1,
-1.372866, 1.257811, -1.213475, 1, 1, 1, 1, 1,
-1.362039, -1.196218, -1.74578, 1, 1, 1, 1, 1,
-1.361445, 0.1515921, -0.5081576, 1, 1, 1, 1, 1,
-1.355808, 0.3271376, -1.630168, 1, 1, 1, 1, 1,
-1.347146, 0.5754619, 0.006255747, 1, 1, 1, 1, 1,
-1.344084, 0.1643291, -0.8358794, 1, 1, 1, 1, 1,
-1.340899, -0.02763957, -2.615473, 1, 1, 1, 1, 1,
-1.338929, 0.1509996, -0.5735923, 1, 1, 1, 1, 1,
-1.336623, 1.361659, -0.5200423, 1, 1, 1, 1, 1,
-1.336343, -2.038162, -2.430098, 1, 1, 1, 1, 1,
-1.324212, -0.6231688, -1.218199, 1, 1, 1, 1, 1,
-1.317788, -0.006537377, -2.310134, 1, 1, 1, 1, 1,
-1.316633, -0.8673629, -1.39841, 1, 1, 1, 1, 1,
-1.311318, -0.6223068, -3.163808, 0, 0, 1, 1, 1,
-1.310627, -0.4027115, -2.339495, 1, 0, 0, 1, 1,
-1.30089, -0.2827861, -2.717706, 1, 0, 0, 1, 1,
-1.295409, -0.7254221, -2.462773, 1, 0, 0, 1, 1,
-1.293403, -0.8093388, -1.998584, 1, 0, 0, 1, 1,
-1.292708, 1.916191, -0.01811808, 1, 0, 0, 1, 1,
-1.285472, 0.2641602, -0.9513474, 0, 0, 0, 1, 1,
-1.268375, 0.2730055, -1.704155, 0, 0, 0, 1, 1,
-1.263647, 0.03471395, -2.348915, 0, 0, 0, 1, 1,
-1.261854, -0.2094593, -2.715472, 0, 0, 0, 1, 1,
-1.260945, -1.318242, -3.807933, 0, 0, 0, 1, 1,
-1.260425, 0.9129694, -0.5631834, 0, 0, 0, 1, 1,
-1.2595, 0.08366892, -2.219891, 0, 0, 0, 1, 1,
-1.256249, 0.06077444, -0.8600882, 1, 1, 1, 1, 1,
-1.252168, -0.8832209, -2.224103, 1, 1, 1, 1, 1,
-1.247411, -0.556451, -2.030511, 1, 1, 1, 1, 1,
-1.246583, -0.2717365, -1.834605, 1, 1, 1, 1, 1,
-1.245808, -0.8550626, -2.012264, 1, 1, 1, 1, 1,
-1.243975, 1.001947, -0.6786955, 1, 1, 1, 1, 1,
-1.238605, -1.137183, -1.266733, 1, 1, 1, 1, 1,
-1.235556, 1.213194, -0.2486286, 1, 1, 1, 1, 1,
-1.229923, -0.1145999, -2.032939, 1, 1, 1, 1, 1,
-1.223065, -1.303931, -2.43628, 1, 1, 1, 1, 1,
-1.222315, -0.1407747, -0.9928435, 1, 1, 1, 1, 1,
-1.221294, 0.7187552, -2.519777, 1, 1, 1, 1, 1,
-1.212748, -0.8528388, -1.525347, 1, 1, 1, 1, 1,
-1.206687, -0.1225546, -2.590518, 1, 1, 1, 1, 1,
-1.202052, -0.6372883, -2.547196, 1, 1, 1, 1, 1,
-1.19315, 0.4862239, -1.494414, 0, 0, 1, 1, 1,
-1.188392, 0.5979347, -1.7709, 1, 0, 0, 1, 1,
-1.177843, -1.187673, -2.127296, 1, 0, 0, 1, 1,
-1.168715, 0.2305042, -1.085757, 1, 0, 0, 1, 1,
-1.163768, 0.4553304, -1.92301, 1, 0, 0, 1, 1,
-1.160355, -0.5619647, -1.956036, 1, 0, 0, 1, 1,
-1.157181, 0.880718, -1.133664, 0, 0, 0, 1, 1,
-1.151784, 0.7426845, -2.325869, 0, 0, 0, 1, 1,
-1.147673, 0.9250875, 0.1085309, 0, 0, 0, 1, 1,
-1.134896, -0.9474967, -2.386218, 0, 0, 0, 1, 1,
-1.133187, -1.404676, -3.191974, 0, 0, 0, 1, 1,
-1.13105, 1.382541, -0.5491613, 0, 0, 0, 1, 1,
-1.128906, -0.3258027, -0.8232251, 0, 0, 0, 1, 1,
-1.121298, -0.3324566, -0.8484109, 1, 1, 1, 1, 1,
-1.11957, -0.334542, 0.2465961, 1, 1, 1, 1, 1,
-1.117769, -0.3908418, -1.143904, 1, 1, 1, 1, 1,
-1.114157, -0.1407091, -1.3331, 1, 1, 1, 1, 1,
-1.103968, -1.01073, -2.499506, 1, 1, 1, 1, 1,
-1.10274, 0.5362573, 0.02392352, 1, 1, 1, 1, 1,
-1.097894, -1.242988, -1.859657, 1, 1, 1, 1, 1,
-1.096007, -0.02211898, -2.004033, 1, 1, 1, 1, 1,
-1.095477, 0.1472908, -1.890227, 1, 1, 1, 1, 1,
-1.093123, 0.3993243, -2.494087, 1, 1, 1, 1, 1,
-1.091065, -0.451887, -1.880175, 1, 1, 1, 1, 1,
-1.085913, -0.1873351, -2.862625, 1, 1, 1, 1, 1,
-1.085351, 2.201168, -0.3266161, 1, 1, 1, 1, 1,
-1.082721, -0.7167844, -3.069561, 1, 1, 1, 1, 1,
-1.082528, 2.469306, -1.537516, 1, 1, 1, 1, 1,
-1.079329, 1.13411, 0.1290417, 0, 0, 1, 1, 1,
-1.071413, 0.05408549, 0.02953289, 1, 0, 0, 1, 1,
-1.068326, 1.037237, -2.079606, 1, 0, 0, 1, 1,
-1.066313, -0.5330825, -2.199826, 1, 0, 0, 1, 1,
-1.063562, 0.8840185, 0.5103374, 1, 0, 0, 1, 1,
-1.063536, 0.9824114, 0.07823058, 1, 0, 0, 1, 1,
-1.060369, -0.5639713, -1.871854, 0, 0, 0, 1, 1,
-1.059792, -0.5387785, -2.273986, 0, 0, 0, 1, 1,
-1.041606, 1.467578, -0.1046818, 0, 0, 0, 1, 1,
-1.031065, -0.07573064, -2.496279, 0, 0, 0, 1, 1,
-1.028312, 0.4458103, -0.7665321, 0, 0, 0, 1, 1,
-1.024447, 0.08415388, -2.332805, 0, 0, 0, 1, 1,
-1.016247, -1.166655, -2.796413, 0, 0, 0, 1, 1,
-1.014556, 0.3562303, -1.213628, 1, 1, 1, 1, 1,
-1.000911, -1.023393, -3.454988, 1, 1, 1, 1, 1,
-0.9953933, 0.6862847, -0.1181009, 1, 1, 1, 1, 1,
-0.9910133, -0.1732122, 0.04900588, 1, 1, 1, 1, 1,
-0.9811096, 1.334051, -1.343162, 1, 1, 1, 1, 1,
-0.9795576, 0.5275425, -2.660509, 1, 1, 1, 1, 1,
-0.9756608, 1.287193, -1.321674, 1, 1, 1, 1, 1,
-0.970715, 1.638174, -1.573671, 1, 1, 1, 1, 1,
-0.9683875, -1.013237, -1.615808, 1, 1, 1, 1, 1,
-0.9614111, 0.3079775, -2.611634, 1, 1, 1, 1, 1,
-0.9608403, -0.7892103, -3.014111, 1, 1, 1, 1, 1,
-0.9602975, 0.4994681, -1.518322, 1, 1, 1, 1, 1,
-0.9600548, 0.004169669, -1.408794, 1, 1, 1, 1, 1,
-0.9590939, 0.8174858, -1.293463, 1, 1, 1, 1, 1,
-0.9516312, 0.08350944, -2.39004, 1, 1, 1, 1, 1,
-0.9490657, -0.6018514, -1.517416, 0, 0, 1, 1, 1,
-0.9489972, 1.971584, -0.8670934, 1, 0, 0, 1, 1,
-0.9475513, -0.162027, -2.733629, 1, 0, 0, 1, 1,
-0.9460263, 1.823632, -0.2371259, 1, 0, 0, 1, 1,
-0.944374, 1.188184, -0.7702537, 1, 0, 0, 1, 1,
-0.9370463, 0.9491053, -0.6500378, 1, 0, 0, 1, 1,
-0.9355273, 0.2103859, -0.9666715, 0, 0, 0, 1, 1,
-0.9343218, -0.7454588, -1.467549, 0, 0, 0, 1, 1,
-0.933012, 0.6729, -0.2320989, 0, 0, 0, 1, 1,
-0.9318887, 1.381373, -1.399621, 0, 0, 0, 1, 1,
-0.9308047, -0.1630538, -1.326399, 0, 0, 0, 1, 1,
-0.9295068, 1.365072, 1.190745, 0, 0, 0, 1, 1,
-0.9218536, -0.6349071, -2.718162, 0, 0, 0, 1, 1,
-0.9175019, 1.017109, -0.630241, 1, 1, 1, 1, 1,
-0.9173241, 0.7634844, -0.5574562, 1, 1, 1, 1, 1,
-0.9089394, -0.390799, -1.042796, 1, 1, 1, 1, 1,
-0.9047158, 0.1935743, -1.301141, 1, 1, 1, 1, 1,
-0.9039972, -0.4054908, -2.905954, 1, 1, 1, 1, 1,
-0.902959, 0.2470688, -2.267728, 1, 1, 1, 1, 1,
-0.8982009, -1.48772, -2.834424, 1, 1, 1, 1, 1,
-0.8981162, -1.198618, -2.074965, 1, 1, 1, 1, 1,
-0.8937822, 0.9894548, -0.7011492, 1, 1, 1, 1, 1,
-0.8909662, 1.506311, -0.6067461, 1, 1, 1, 1, 1,
-0.8881856, 1.223491, -0.4219085, 1, 1, 1, 1, 1,
-0.884863, -1.073931, -1.358536, 1, 1, 1, 1, 1,
-0.8810472, -0.9164665, -1.770267, 1, 1, 1, 1, 1,
-0.8656809, 1.593025, -1.331184, 1, 1, 1, 1, 1,
-0.8629056, -1.217323, -3.709524, 1, 1, 1, 1, 1,
-0.8598017, -0.9786431, -3.568604, 0, 0, 1, 1, 1,
-0.8579352, 1.296142, 0.7185453, 1, 0, 0, 1, 1,
-0.8542435, 0.397138, -0.2593701, 1, 0, 0, 1, 1,
-0.8523996, 0.4686755, 0.2953236, 1, 0, 0, 1, 1,
-0.8523957, -0.358519, -2.359723, 1, 0, 0, 1, 1,
-0.8490155, -0.2297225, -1.327299, 1, 0, 0, 1, 1,
-0.8487999, 0.6513437, 0.0795963, 0, 0, 0, 1, 1,
-0.847261, 0.1165896, 1.213865, 0, 0, 0, 1, 1,
-0.842571, -0.01191715, -0.7101377, 0, 0, 0, 1, 1,
-0.8291597, 1.131196, 0.07612069, 0, 0, 0, 1, 1,
-0.8261281, -0.2145818, -2.136709, 0, 0, 0, 1, 1,
-0.8231823, -0.2886359, -1.521538, 0, 0, 0, 1, 1,
-0.8200668, -0.1157444, -3.668876, 0, 0, 0, 1, 1,
-0.8189236, 1.048028, -1.261307, 1, 1, 1, 1, 1,
-0.8163854, 0.03138788, -1.422449, 1, 1, 1, 1, 1,
-0.8081979, 1.017564, 0.4764896, 1, 1, 1, 1, 1,
-0.8067076, -0.6973704, -3.523359, 1, 1, 1, 1, 1,
-0.8059529, 0.1276559, -2.011195, 1, 1, 1, 1, 1,
-0.8043519, -1.18087, -3.49121, 1, 1, 1, 1, 1,
-0.8040302, -1.584613, -2.04246, 1, 1, 1, 1, 1,
-0.8036127, 0.5292245, -1.180198, 1, 1, 1, 1, 1,
-0.7988291, -0.5990843, -1.384605, 1, 1, 1, 1, 1,
-0.7961964, -1.323127, -1.184479, 1, 1, 1, 1, 1,
-0.7925617, 0.5332951, -0.7243004, 1, 1, 1, 1, 1,
-0.790845, -0.459421, -2.937161, 1, 1, 1, 1, 1,
-0.787895, -0.7108022, -2.859747, 1, 1, 1, 1, 1,
-0.7838596, 0.953191, -0.3821654, 1, 1, 1, 1, 1,
-0.7680815, 0.2465406, -2.090095, 1, 1, 1, 1, 1,
-0.7572541, 0.8103631, -0.6167744, 0, 0, 1, 1, 1,
-0.7523378, -0.6844027, -0.6389207, 1, 0, 0, 1, 1,
-0.7521887, 0.3419375, -2.660135, 1, 0, 0, 1, 1,
-0.7442367, 0.4966999, -0.9085192, 1, 0, 0, 1, 1,
-0.7429982, 0.305467, -1.878218, 1, 0, 0, 1, 1,
-0.7429281, 0.4899394, -0.6956139, 1, 0, 0, 1, 1,
-0.7399213, -0.6915123, -3.056401, 0, 0, 0, 1, 1,
-0.7363521, -0.9671448, -2.711569, 0, 0, 0, 1, 1,
-0.7355565, -1.80986, -3.127121, 0, 0, 0, 1, 1,
-0.7344905, 1.390925, 0.2602158, 0, 0, 0, 1, 1,
-0.7331731, -0.6684015, -3.148176, 0, 0, 0, 1, 1,
-0.7294962, -0.7915204, -2.274378, 0, 0, 0, 1, 1,
-0.7287647, -1.407873, -1.778407, 0, 0, 0, 1, 1,
-0.7201064, -1.369298, -2.690856, 1, 1, 1, 1, 1,
-0.719351, -0.6884504, -1.759323, 1, 1, 1, 1, 1,
-0.7186901, -1.486038, -3.474577, 1, 1, 1, 1, 1,
-0.714404, -0.04457591, -0.718563, 1, 1, 1, 1, 1,
-0.7122949, -0.1671755, -0.5005538, 1, 1, 1, 1, 1,
-0.7106688, -0.03187515, -2.797226, 1, 1, 1, 1, 1,
-0.7104117, -2.455663, -3.534837, 1, 1, 1, 1, 1,
-0.7050531, -1.313496, -2.455238, 1, 1, 1, 1, 1,
-0.7040147, 0.2158402, 0.2275793, 1, 1, 1, 1, 1,
-0.7034621, 0.2730522, -1.817039, 1, 1, 1, 1, 1,
-0.7030103, 0.144946, -0.5159522, 1, 1, 1, 1, 1,
-0.6959368, -1.687623, -5.445054, 1, 1, 1, 1, 1,
-0.6889439, -1.134457, -2.555771, 1, 1, 1, 1, 1,
-0.6871758, 1.08617, -1.018498, 1, 1, 1, 1, 1,
-0.6855323, -1.106245, -3.192156, 1, 1, 1, 1, 1,
-0.6832712, 0.2820377, -1.013576, 0, 0, 1, 1, 1,
-0.6829557, 1.231525, -0.3048815, 1, 0, 0, 1, 1,
-0.6765871, 0.0406699, -0.6047432, 1, 0, 0, 1, 1,
-0.6714262, 0.7345642, 1.723228, 1, 0, 0, 1, 1,
-0.668845, 0.3106861, -1.534892, 1, 0, 0, 1, 1,
-0.667224, -0.1120477, -4.39508, 1, 0, 0, 1, 1,
-0.6669057, -0.01037247, -2.070371, 0, 0, 0, 1, 1,
-0.6574455, -0.950976, -2.245859, 0, 0, 0, 1, 1,
-0.6511934, 1.702559, 0.5788748, 0, 0, 0, 1, 1,
-0.6387102, -0.8377961, -1.891847, 0, 0, 0, 1, 1,
-0.6386086, 0.04516089, -1.686936, 0, 0, 0, 1, 1,
-0.6357923, 0.9353924, -1.287613, 0, 0, 0, 1, 1,
-0.6294246, 0.4320603, -0.4533888, 0, 0, 0, 1, 1,
-0.6288696, -0.2535606, -3.07584, 1, 1, 1, 1, 1,
-0.6285471, -0.1298631, -0.8771006, 1, 1, 1, 1, 1,
-0.6273929, 0.2912894, -0.7670722, 1, 1, 1, 1, 1,
-0.6267387, 0.7298309, -0.1669777, 1, 1, 1, 1, 1,
-0.6234747, -0.8836834, -2.242889, 1, 1, 1, 1, 1,
-0.6184297, -0.4034716, -0.1297372, 1, 1, 1, 1, 1,
-0.6165389, 1.392546, -0.5442793, 1, 1, 1, 1, 1,
-0.6153911, -0.9774405, -4.774754, 1, 1, 1, 1, 1,
-0.6101608, -0.0532708, -1.3487, 1, 1, 1, 1, 1,
-0.6026279, -0.1074605, -0.6559323, 1, 1, 1, 1, 1,
-0.6021121, 0.9284465, -0.01766934, 1, 1, 1, 1, 1,
-0.5995353, 0.7949349, -0.05817848, 1, 1, 1, 1, 1,
-0.5954053, -0.5574259, -1.663117, 1, 1, 1, 1, 1,
-0.5951616, -0.02373389, -1.787186, 1, 1, 1, 1, 1,
-0.5946844, 0.3917353, -1.806236, 1, 1, 1, 1, 1,
-0.5932291, 1.895196, 0.1429633, 0, 0, 1, 1, 1,
-0.5894426, -1.670771, -2.724211, 1, 0, 0, 1, 1,
-0.5885539, 0.3047585, -1.222284, 1, 0, 0, 1, 1,
-0.5752333, 0.6789478, -0.3022951, 1, 0, 0, 1, 1,
-0.5713287, -2.584285, -1.020493, 1, 0, 0, 1, 1,
-0.5691741, -0.3215629, -1.656404, 1, 0, 0, 1, 1,
-0.5681349, -0.7883604, -0.9626892, 0, 0, 0, 1, 1,
-0.5658069, 0.3161365, -1.847635, 0, 0, 0, 1, 1,
-0.5633642, -1.131076, -3.483811, 0, 0, 0, 1, 1,
-0.5605918, -0.909806, -2.685682, 0, 0, 0, 1, 1,
-0.5560567, 0.5949818, -0.5327948, 0, 0, 0, 1, 1,
-0.5528387, 1.11921, -3.478524, 0, 0, 0, 1, 1,
-0.5405916, -1.201869, -2.819625, 0, 0, 0, 1, 1,
-0.5395807, -0.6729346, -3.424438, 1, 1, 1, 1, 1,
-0.5366025, 1.357812, -1.091191, 1, 1, 1, 1, 1,
-0.5332648, 0.8098979, -1.21615, 1, 1, 1, 1, 1,
-0.5297976, -0.02251908, -1.163038, 1, 1, 1, 1, 1,
-0.5249432, -0.01396771, -1.308328, 1, 1, 1, 1, 1,
-0.5217927, -1.212265, -2.931576, 1, 1, 1, 1, 1,
-0.5192916, 0.1939638, -1.070391, 1, 1, 1, 1, 1,
-0.5189479, -0.03170172, -1.158438, 1, 1, 1, 1, 1,
-0.5166065, -1.078623, -4.409619, 1, 1, 1, 1, 1,
-0.5101077, 1.383958, 0.4902635, 1, 1, 1, 1, 1,
-0.5074826, 2.683059, 0.2464765, 1, 1, 1, 1, 1,
-0.5069921, 1.567992, 0.8510104, 1, 1, 1, 1, 1,
-0.5067008, -2.000988, -2.111022, 1, 1, 1, 1, 1,
-0.5034901, 0.5387019, -1.380645, 1, 1, 1, 1, 1,
-0.5028473, 0.1584628, -0.2450376, 1, 1, 1, 1, 1,
-0.4974023, 2.485707, -1.316676, 0, 0, 1, 1, 1,
-0.4949522, 1.351897, 0.9738269, 1, 0, 0, 1, 1,
-0.493996, -0.1636509, -1.261112, 1, 0, 0, 1, 1,
-0.4858636, 0.1155719, -1.364545, 1, 0, 0, 1, 1,
-0.4828627, 0.5474959, -0.430934, 1, 0, 0, 1, 1,
-0.479685, 1.516013, -0.4788806, 1, 0, 0, 1, 1,
-0.4714058, -0.4970665, -2.826558, 0, 0, 0, 1, 1,
-0.4707618, 1.037332, -0.2787329, 0, 0, 0, 1, 1,
-0.4695104, -0.2244869, -2.342761, 0, 0, 0, 1, 1,
-0.4676542, -1.291492, -1.907892, 0, 0, 0, 1, 1,
-0.462936, 0.5397484, 0.9174747, 0, 0, 0, 1, 1,
-0.455923, 1.372017, 0.9327642, 0, 0, 0, 1, 1,
-0.4558826, -0.1313357, -1.552853, 0, 0, 0, 1, 1,
-0.4540861, 0.07924904, -0.838578, 1, 1, 1, 1, 1,
-0.4537875, -0.5871787, -1.890299, 1, 1, 1, 1, 1,
-0.4512833, 1.6609, 0.9857994, 1, 1, 1, 1, 1,
-0.4415308, 0.9399076, 0.3614318, 1, 1, 1, 1, 1,
-0.4406697, 1.101237, 0.2864871, 1, 1, 1, 1, 1,
-0.4359376, -0.5997835, -2.284346, 1, 1, 1, 1, 1,
-0.4341854, -1.325531, -3.204711, 1, 1, 1, 1, 1,
-0.4307835, 0.6806686, -1.520929, 1, 1, 1, 1, 1,
-0.4306474, -1.505013, -2.524676, 1, 1, 1, 1, 1,
-0.4266315, 1.493543, -1.014423, 1, 1, 1, 1, 1,
-0.4139766, -0.05394524, -2.943928, 1, 1, 1, 1, 1,
-0.4133681, -1.048001, -1.17015, 1, 1, 1, 1, 1,
-0.4128933, 0.621926, -0.9981969, 1, 1, 1, 1, 1,
-0.4103, 0.1011624, -1.140816, 1, 1, 1, 1, 1,
-0.4055579, -0.6037562, -1.480163, 1, 1, 1, 1, 1,
-0.3988209, 0.9140459, 0.9473316, 0, 0, 1, 1, 1,
-0.3925817, -3.392006, -3.07835, 1, 0, 0, 1, 1,
-0.3895655, -0.8518432, -2.793694, 1, 0, 0, 1, 1,
-0.3862104, -0.1199467, -1.104116, 1, 0, 0, 1, 1,
-0.3789195, -1.854823, -2.689424, 1, 0, 0, 1, 1,
-0.3743192, 0.9582247, -1.133089, 1, 0, 0, 1, 1,
-0.3719992, 0.6787629, -1.47329, 0, 0, 0, 1, 1,
-0.3705368, -1.057163, -3.696204, 0, 0, 0, 1, 1,
-0.3672566, -1.252187, -3.983201, 0, 0, 0, 1, 1,
-0.3655438, 0.6542516, 0.04459377, 0, 0, 0, 1, 1,
-0.3640808, 0.8064108, -0.2332651, 0, 0, 0, 1, 1,
-0.362552, 0.0672211, -2.461214, 0, 0, 0, 1, 1,
-0.3533096, -2.552043, -3.280428, 0, 0, 0, 1, 1,
-0.3517147, 1.122517, -1.050018, 1, 1, 1, 1, 1,
-0.3514836, 0.3728541, 0.07110776, 1, 1, 1, 1, 1,
-0.3507743, 1.489763, -1.903183, 1, 1, 1, 1, 1,
-0.3450589, 1.617622, -1.188786, 1, 1, 1, 1, 1,
-0.3435898, 1.422539, -0.7998188, 1, 1, 1, 1, 1,
-0.3435538, -0.7310616, -3.93524, 1, 1, 1, 1, 1,
-0.3423204, -0.5273411, -4.013143, 1, 1, 1, 1, 1,
-0.333145, 1.162281, 0.7434291, 1, 1, 1, 1, 1,
-0.3276304, -0.4193861, -1.635785, 1, 1, 1, 1, 1,
-0.326701, 0.1258289, -0.6064177, 1, 1, 1, 1, 1,
-0.3258531, 1.287539, 0.8595269, 1, 1, 1, 1, 1,
-0.3159846, 0.6704581, -0.4539516, 1, 1, 1, 1, 1,
-0.3157693, -1.565415, -3.36015, 1, 1, 1, 1, 1,
-0.3149007, 0.901738, 1.361354, 1, 1, 1, 1, 1,
-0.3130005, -1.038399, -2.045179, 1, 1, 1, 1, 1,
-0.3113715, -1.06371, -1.432027, 0, 0, 1, 1, 1,
-0.3101584, -1.793288, -2.173202, 1, 0, 0, 1, 1,
-0.3012705, 2.280524, 1.462819, 1, 0, 0, 1, 1,
-0.3001734, -0.2143746, 0.7971159, 1, 0, 0, 1, 1,
-0.2996005, 0.08215006, -2.469771, 1, 0, 0, 1, 1,
-0.2965485, -0.149183, -1.210683, 1, 0, 0, 1, 1,
-0.2961508, -0.8083712, -2.425585, 0, 0, 0, 1, 1,
-0.2913195, 0.768543, -1.156881, 0, 0, 0, 1, 1,
-0.2899724, -0.5190203, -2.473199, 0, 0, 0, 1, 1,
-0.287984, 0.6472868, 0.6414148, 0, 0, 0, 1, 1,
-0.2845948, -2.085935, -2.252643, 0, 0, 0, 1, 1,
-0.2839831, -1.244732, -3.474038, 0, 0, 0, 1, 1,
-0.2837974, -0.7093751, -1.935212, 0, 0, 0, 1, 1,
-0.2820398, 2.061891, -0.4493137, 1, 1, 1, 1, 1,
-0.2812098, 1.791509, -1.44847, 1, 1, 1, 1, 1,
-0.2756371, 1.51586, 0.3682838, 1, 1, 1, 1, 1,
-0.2674519, -2.303936, -3.259007, 1, 1, 1, 1, 1,
-0.2656159, -1.433725, -2.256346, 1, 1, 1, 1, 1,
-0.2653249, -1.772688, -3.262907, 1, 1, 1, 1, 1,
-0.2616513, 1.112204, -1.157848, 1, 1, 1, 1, 1,
-0.2578763, 0.5527037, -0.2141414, 1, 1, 1, 1, 1,
-0.2549468, 1.603973, 0.9730524, 1, 1, 1, 1, 1,
-0.2526846, -0.6541409, -2.611282, 1, 1, 1, 1, 1,
-0.2469789, -0.4761705, -1.130616, 1, 1, 1, 1, 1,
-0.2464566, 0.5481924, -0.9157643, 1, 1, 1, 1, 1,
-0.2434758, 0.4672831, 1.981454, 1, 1, 1, 1, 1,
-0.2412978, 0.4818318, 0.3356131, 1, 1, 1, 1, 1,
-0.2372712, -0.01744349, -0.3242632, 1, 1, 1, 1, 1,
-0.2334677, -0.3808819, -3.060101, 0, 0, 1, 1, 1,
-0.2242227, 0.9731429, 0.02772206, 1, 0, 0, 1, 1,
-0.22338, -0.2091338, -2.826942, 1, 0, 0, 1, 1,
-0.2232165, -0.5645583, -2.485736, 1, 0, 0, 1, 1,
-0.2171592, 0.6494732, -2.608356, 1, 0, 0, 1, 1,
-0.2171403, 1.694785, -0.7808856, 1, 0, 0, 1, 1,
-0.2128253, 0.3017678, -1.086861, 0, 0, 0, 1, 1,
-0.2090924, -0.5174962, -2.767601, 0, 0, 0, 1, 1,
-0.2042745, 1.289347, -0.8383308, 0, 0, 0, 1, 1,
-0.1894117, 0.2725467, -0.5254151, 0, 0, 0, 1, 1,
-0.1894066, -0.8701615, -5.29576, 0, 0, 0, 1, 1,
-0.1890529, 0.6882581, -1.259758, 0, 0, 0, 1, 1,
-0.1840044, -0.3824722, -4.33358, 0, 0, 0, 1, 1,
-0.1813781, 1.205813, -0.2104774, 1, 1, 1, 1, 1,
-0.1792517, -1.090334, -1.162295, 1, 1, 1, 1, 1,
-0.1789868, 0.164665, 1.145344, 1, 1, 1, 1, 1,
-0.1782728, 0.001051443, -3.216098, 1, 1, 1, 1, 1,
-0.1781295, -0.6193104, -4.809234, 1, 1, 1, 1, 1,
-0.1743411, 0.2245441, 0.377274, 1, 1, 1, 1, 1,
-0.173528, -0.7064442, -1.782656, 1, 1, 1, 1, 1,
-0.1662949, -0.5043049, -2.407524, 1, 1, 1, 1, 1,
-0.1662259, -0.006220782, -1.31696, 1, 1, 1, 1, 1,
-0.1602451, -0.4296843, -2.89698, 1, 1, 1, 1, 1,
-0.1601626, 1.83467, -0.3525907, 1, 1, 1, 1, 1,
-0.1589212, 1.213682, 0.7264932, 1, 1, 1, 1, 1,
-0.1571412, -0.5505419, -1.946606, 1, 1, 1, 1, 1,
-0.1504197, 0.205013, 1.452222, 1, 1, 1, 1, 1,
-0.1478575, -0.4768046, -1.855407, 1, 1, 1, 1, 1,
-0.1472623, 0.8507965, -1.809634, 0, 0, 1, 1, 1,
-0.1456822, -0.03162327, -1.015358, 1, 0, 0, 1, 1,
-0.1451898, 0.169227, -1.770264, 1, 0, 0, 1, 1,
-0.1433866, -0.5341873, -3.357863, 1, 0, 0, 1, 1,
-0.1417354, -0.6400008, -2.980023, 1, 0, 0, 1, 1,
-0.1401088, 0.3585686, -0.4909374, 1, 0, 0, 1, 1,
-0.1387885, 1.857144, -0.04323709, 0, 0, 0, 1, 1,
-0.1345327, -1.461075, -2.64381, 0, 0, 0, 1, 1,
-0.132135, -0.03682218, -2.130462, 0, 0, 0, 1, 1,
-0.1318562, 0.2437326, -0.3738118, 0, 0, 0, 1, 1,
-0.1214254, -0.4289493, -2.694568, 0, 0, 0, 1, 1,
-0.120648, 1.419837, -0.3604535, 0, 0, 0, 1, 1,
-0.1183667, -0.8586236, -3.605895, 0, 0, 0, 1, 1,
-0.1046643, 1.222078, 0.01077409, 1, 1, 1, 1, 1,
-0.1045732, -0.9215943, -1.350616, 1, 1, 1, 1, 1,
-0.1021794, 0.1493799, -2.157967, 1, 1, 1, 1, 1,
-0.1008522, -0.2692325, -2.709632, 1, 1, 1, 1, 1,
-0.1007896, 2.08818, -0.3986011, 1, 1, 1, 1, 1,
-0.09900858, -0.2359558, -3.60977, 1, 1, 1, 1, 1,
-0.09588838, 1.20381, -0.8326336, 1, 1, 1, 1, 1,
-0.08977707, 1.649103, -1.352896, 1, 1, 1, 1, 1,
-0.08947002, -0.2780426, -0.3376383, 1, 1, 1, 1, 1,
-0.08916867, -0.760609, -1.699619, 1, 1, 1, 1, 1,
-0.08916787, 0.2312636, -1.069433, 1, 1, 1, 1, 1,
-0.08916473, -1.166201, -2.265397, 1, 1, 1, 1, 1,
-0.0815665, -0.04867059, -1.996648, 1, 1, 1, 1, 1,
-0.08110794, -1.630667, -1.484684, 1, 1, 1, 1, 1,
-0.07818107, -0.6319431, -4.802308, 1, 1, 1, 1, 1,
-0.07658861, 1.980163, -0.1090679, 0, 0, 1, 1, 1,
-0.07336166, -0.2960182, -3.51868, 1, 0, 0, 1, 1,
-0.07323267, -0.8026057, -3.25864, 1, 0, 0, 1, 1,
-0.07268304, 1.045868, 0.1019277, 1, 0, 0, 1, 1,
-0.07030004, 1.054319, 1.241394, 1, 0, 0, 1, 1,
-0.06696781, 0.531494, 0.9041749, 1, 0, 0, 1, 1,
-0.06405998, -0.07342749, -2.153143, 0, 0, 0, 1, 1,
-0.06331147, 0.06639943, -1.5532, 0, 0, 0, 1, 1,
-0.0619171, 0.4730848, 0.1147003, 0, 0, 0, 1, 1,
-0.06124923, -0.6389257, -3.71124, 0, 0, 0, 1, 1,
-0.05714703, 1.10302, -1.821062, 0, 0, 0, 1, 1,
-0.05301111, 1.858435, -0.6895489, 0, 0, 0, 1, 1,
-0.04967396, -0.9286337, -2.908494, 0, 0, 0, 1, 1,
-0.03991577, 1.248059, 0.2825182, 1, 1, 1, 1, 1,
-0.03843089, -0.1122373, -2.001025, 1, 1, 1, 1, 1,
-0.03842502, 1.665316, -1.065899, 1, 1, 1, 1, 1,
-0.03405095, 0.07739798, 0.1402376, 1, 1, 1, 1, 1,
-0.0289508, -0.9438695, -2.322668, 1, 1, 1, 1, 1,
-0.02737772, -1.574081, -3.956012, 1, 1, 1, 1, 1,
-0.0267406, 1.796765, 2.00621, 1, 1, 1, 1, 1,
-0.0263423, 0.08368855, -0.1108447, 1, 1, 1, 1, 1,
-0.02562793, -0.5242693, -3.518438, 1, 1, 1, 1, 1,
-0.02343514, 0.359466, -0.1725841, 1, 1, 1, 1, 1,
-0.02244277, 1.181654, 0.333999, 1, 1, 1, 1, 1,
-0.02094775, -0.1721775, -1.645767, 1, 1, 1, 1, 1,
-0.01534101, 1.237489, -0.09111783, 1, 1, 1, 1, 1,
-0.01494809, -0.3875161, -2.688643, 1, 1, 1, 1, 1,
-0.0133404, -1.423735, -4.437735, 1, 1, 1, 1, 1,
-0.01293417, -2.205668, -2.697145, 0, 0, 1, 1, 1,
-0.01075605, -1.533022, -4.026265, 1, 0, 0, 1, 1,
-0.009430295, -1.341509, -3.185793, 1, 0, 0, 1, 1,
-0.008385427, 0.03428268, 0.3926915, 1, 0, 0, 1, 1,
-0.003481143, -2.636142, -4.187559, 1, 0, 0, 1, 1,
-0.002250283, -0.437784, -2.116271, 1, 0, 0, 1, 1,
0.0004358463, 0.5175635, -0.957386, 0, 0, 0, 1, 1,
0.002467773, 0.8125847, -0.7672568, 0, 0, 0, 1, 1,
0.002697104, 0.8634996, 0.07672358, 0, 0, 0, 1, 1,
0.005390462, -0.7426465, 4.693967, 0, 0, 0, 1, 1,
0.008554203, 0.2883156, 1.386408, 0, 0, 0, 1, 1,
0.0118818, 0.8257307, -0.7910116, 0, 0, 0, 1, 1,
0.01909403, 0.5497825, -0.6114785, 0, 0, 0, 1, 1,
0.02132505, 1.479809, 2.081547, 1, 1, 1, 1, 1,
0.02163405, -1.109676, 4.736412, 1, 1, 1, 1, 1,
0.02339424, -0.3648599, 4.152604, 1, 1, 1, 1, 1,
0.02986693, 0.2950096, 1.059202, 1, 1, 1, 1, 1,
0.03106323, 0.6304485, -0.06345503, 1, 1, 1, 1, 1,
0.03273385, 1.425762, 0.5219353, 1, 1, 1, 1, 1,
0.03586948, -0.502822, 0.8742064, 1, 1, 1, 1, 1,
0.03705684, 0.813598, 0.5246916, 1, 1, 1, 1, 1,
0.03861598, 0.1658791, -1.033841, 1, 1, 1, 1, 1,
0.04158589, -0.5867277, 2.512007, 1, 1, 1, 1, 1,
0.0444167, -1.243955, 2.427628, 1, 1, 1, 1, 1,
0.04675914, 0.3050409, 0.4819916, 1, 1, 1, 1, 1,
0.04950414, 0.3145679, 0.3509372, 1, 1, 1, 1, 1,
0.05014436, 0.09438949, 1.321686, 1, 1, 1, 1, 1,
0.05077726, 0.4619329, 1.528068, 1, 1, 1, 1, 1,
0.05249441, -1.052258, 3.215813, 0, 0, 1, 1, 1,
0.05368862, -2.65647, 5.215044, 1, 0, 0, 1, 1,
0.06694431, -1.032629, 4.841094, 1, 0, 0, 1, 1,
0.06856956, 0.8165799, -1.900568, 1, 0, 0, 1, 1,
0.07108889, 1.115239, 1.692219, 1, 0, 0, 1, 1,
0.07304523, -0.9337713, 4.202032, 1, 0, 0, 1, 1,
0.0799028, -0.7582629, 2.991978, 0, 0, 0, 1, 1,
0.08195279, -0.4698134, 1.556419, 0, 0, 0, 1, 1,
0.08893298, 1.613086, 0.02077626, 0, 0, 0, 1, 1,
0.09446599, 2.031957, -1.236018, 0, 0, 0, 1, 1,
0.09572394, 0.5842219, -0.03040029, 0, 0, 0, 1, 1,
0.1010146, 0.6956562, 0.2042427, 0, 0, 0, 1, 1,
0.1020331, 0.6960243, -0.6161897, 0, 0, 0, 1, 1,
0.104573, 0.8068511, 0.8689244, 1, 1, 1, 1, 1,
0.1049053, 1.083231, -0.2421415, 1, 1, 1, 1, 1,
0.1061738, -0.5544841, 3.074656, 1, 1, 1, 1, 1,
0.1062597, -1.070044, 4.801466, 1, 1, 1, 1, 1,
0.1072041, 3.205458, 1.040667, 1, 1, 1, 1, 1,
0.1171283, -0.2510332, 3.912173, 1, 1, 1, 1, 1,
0.1183309, 1.272584, 0.8232212, 1, 1, 1, 1, 1,
0.1185887, -0.1794618, 1.584924, 1, 1, 1, 1, 1,
0.1216872, 0.07201008, 1.605125, 1, 1, 1, 1, 1,
0.1288212, -0.5017195, 3.014127, 1, 1, 1, 1, 1,
0.1298386, 0.498154, 0.03228484, 1, 1, 1, 1, 1,
0.1346609, -0.6713331, 1.812466, 1, 1, 1, 1, 1,
0.1375003, -1.646616, 3.809086, 1, 1, 1, 1, 1,
0.1379723, 1.575049, -0.5094304, 1, 1, 1, 1, 1,
0.1384404, 1.288795, 0.6018463, 1, 1, 1, 1, 1,
0.1389657, -1.053765, 2.697957, 0, 0, 1, 1, 1,
0.1394404, 0.9425088, -0.5057438, 1, 0, 0, 1, 1,
0.1397331, 0.008155392, 0.07651704, 1, 0, 0, 1, 1,
0.1420594, 0.6334494, 0.7218814, 1, 0, 0, 1, 1,
0.1450533, 2.707862, 0.3205025, 1, 0, 0, 1, 1,
0.1472922, -0.5624422, 3.160384, 1, 0, 0, 1, 1,
0.1482499, -0.6565447, 1.875227, 0, 0, 0, 1, 1,
0.1510163, -1.998006, 2.874729, 0, 0, 0, 1, 1,
0.1519299, 1.174575, 0.1161321, 0, 0, 0, 1, 1,
0.1557916, 0.4194722, 0.3176709, 0, 0, 0, 1, 1,
0.1571202, 1.209667, 1.072441, 0, 0, 0, 1, 1,
0.1587393, 0.3096884, -1.086014, 0, 0, 0, 1, 1,
0.1597081, -0.6070952, 5.394525, 0, 0, 0, 1, 1,
0.1696877, 0.2003742, 1.332848, 1, 1, 1, 1, 1,
0.1719935, -1.078283, 3.182108, 1, 1, 1, 1, 1,
0.1758644, -0.9858278, 2.338588, 1, 1, 1, 1, 1,
0.1786596, -0.4459761, 2.469214, 1, 1, 1, 1, 1,
0.1883269, -0.2729717, 2.858597, 1, 1, 1, 1, 1,
0.1884202, 0.1605574, 0.6990589, 1, 1, 1, 1, 1,
0.197803, -1.206081, 3.989919, 1, 1, 1, 1, 1,
0.1988731, -0.9422564, 4.662225, 1, 1, 1, 1, 1,
0.1993212, 0.02497743, 1.360804, 1, 1, 1, 1, 1,
0.2001382, 0.1179793, 0.7398803, 1, 1, 1, 1, 1,
0.2006572, -0.6643047, 3.652592, 1, 1, 1, 1, 1,
0.2018995, 0.8880215, 1.597931, 1, 1, 1, 1, 1,
0.2019399, 1.623122, -0.675436, 1, 1, 1, 1, 1,
0.2053649, -0.08981042, 1.308331, 1, 1, 1, 1, 1,
0.2074022, 0.6961897, -0.8256106, 1, 1, 1, 1, 1,
0.2089192, -0.5007975, 2.616084, 0, 0, 1, 1, 1,
0.209131, 0.05880086, 1.030737, 1, 0, 0, 1, 1,
0.2096818, 0.4750557, 0.4268765, 1, 0, 0, 1, 1,
0.21119, 0.7556133, 0.7420834, 1, 0, 0, 1, 1,
0.2122058, 0.5086808, -0.2799149, 1, 0, 0, 1, 1,
0.2123607, 0.3120201, 1.117943, 1, 0, 0, 1, 1,
0.2123924, 0.2233268, 0.709334, 0, 0, 0, 1, 1,
0.21342, -0.9618603, 5.514383, 0, 0, 0, 1, 1,
0.217875, 0.5542459, 0.5412106, 0, 0, 0, 1, 1,
0.221467, 0.1790462, 0.01351058, 0, 0, 0, 1, 1,
0.2216753, 0.2332606, 2.144956, 0, 0, 0, 1, 1,
0.2222142, -0.6016769, 1.790833, 0, 0, 0, 1, 1,
0.223667, -0.9017898, 2.038324, 0, 0, 0, 1, 1,
0.2299505, 1.254873, -0.08971279, 1, 1, 1, 1, 1,
0.2302518, -0.6124287, 2.925379, 1, 1, 1, 1, 1,
0.2305066, -1.684278, 3.644511, 1, 1, 1, 1, 1,
0.2327177, 0.3939718, 1.453622, 1, 1, 1, 1, 1,
0.2364486, 0.3536147, -0.08220483, 1, 1, 1, 1, 1,
0.2381649, -0.3731872, 2.935916, 1, 1, 1, 1, 1,
0.2414415, 0.5005, 1.380598, 1, 1, 1, 1, 1,
0.241865, 1.253866, 0.2071537, 1, 1, 1, 1, 1,
0.2442484, -0.6812797, 2.883145, 1, 1, 1, 1, 1,
0.244453, -1.045505, 2.189006, 1, 1, 1, 1, 1,
0.2509857, -0.7005897, 4.678747, 1, 1, 1, 1, 1,
0.2513846, 0.5822709, 0.829036, 1, 1, 1, 1, 1,
0.2631899, -0.195644, 1.100484, 1, 1, 1, 1, 1,
0.2636014, 0.04675134, 0.9366909, 1, 1, 1, 1, 1,
0.2693472, 0.2950063, 1.860888, 1, 1, 1, 1, 1,
0.2693805, -0.4576902, 2.771765, 0, 0, 1, 1, 1,
0.2741257, 0.793395, 2.284245, 1, 0, 0, 1, 1,
0.2837046, 1.364631, 0.3742776, 1, 0, 0, 1, 1,
0.2879288, 2.050597, 0.2176671, 1, 0, 0, 1, 1,
0.2888072, 2.30035, -0.5745417, 1, 0, 0, 1, 1,
0.2936718, 0.4775554, 1.182037, 1, 0, 0, 1, 1,
0.3013805, -0.6180515, 2.942969, 0, 0, 0, 1, 1,
0.3017238, -0.9706473, 2.928716, 0, 0, 0, 1, 1,
0.301999, 0.6322244, 2.047468, 0, 0, 0, 1, 1,
0.3054976, 0.247561, 0.7935014, 0, 0, 0, 1, 1,
0.3065099, 0.2398645, 0.6468031, 0, 0, 0, 1, 1,
0.307613, -0.1486027, 0.9799268, 0, 0, 0, 1, 1,
0.3076791, -0.2190847, 3.081391, 0, 0, 0, 1, 1,
0.3077883, 1.309707, 0.5872487, 1, 1, 1, 1, 1,
0.3108295, -0.9343878, 2.059461, 1, 1, 1, 1, 1,
0.3137382, -0.5776966, 3.191696, 1, 1, 1, 1, 1,
0.3143423, -0.1480201, 1.882074, 1, 1, 1, 1, 1,
0.3155056, 0.07681966, 0.5964053, 1, 1, 1, 1, 1,
0.3216353, -1.164076, 3.744704, 1, 1, 1, 1, 1,
0.3223161, -0.06942456, 0.8601986, 1, 1, 1, 1, 1,
0.3232041, -1.0652, 2.008121, 1, 1, 1, 1, 1,
0.3248118, -0.6215219, 3.530338, 1, 1, 1, 1, 1,
0.3290575, -1.798078, 3.393378, 1, 1, 1, 1, 1,
0.3359827, 2.287228, 0.606022, 1, 1, 1, 1, 1,
0.3376943, 0.4767384, -0.07101993, 1, 1, 1, 1, 1,
0.3377998, -0.1953239, 0.07560931, 1, 1, 1, 1, 1,
0.3390152, 1.294028, 0.296952, 1, 1, 1, 1, 1,
0.3416378, -0.06599113, -0.1767313, 1, 1, 1, 1, 1,
0.3420796, -0.1351348, 0.4449655, 0, 0, 1, 1, 1,
0.3422285, -0.127214, 1.547148, 1, 0, 0, 1, 1,
0.3452317, -0.1578904, 0.58604, 1, 0, 0, 1, 1,
0.3509741, -0.1226902, 2.704919, 1, 0, 0, 1, 1,
0.3512641, 0.6550994, 1.436687, 1, 0, 0, 1, 1,
0.354911, -0.9820753, 1.821112, 1, 0, 0, 1, 1,
0.3565736, -0.9306919, 2.60834, 0, 0, 0, 1, 1,
0.3586858, 0.1518942, 2.96901, 0, 0, 0, 1, 1,
0.358911, -0.3367324, -0.1028774, 0, 0, 0, 1, 1,
0.3630204, -1.56456, 2.790293, 0, 0, 0, 1, 1,
0.3642758, 0.4358869, 0.5961133, 0, 0, 0, 1, 1,
0.3691203, -2.055746, 2.53106, 0, 0, 0, 1, 1,
0.369971, 3.160407, -1.6437, 0, 0, 0, 1, 1,
0.3712454, 0.2240552, -0.8267261, 1, 1, 1, 1, 1,
0.3728631, 0.4116023, -1.653715, 1, 1, 1, 1, 1,
0.3736137, -0.05297452, -0.3151943, 1, 1, 1, 1, 1,
0.3753087, -1.304334, 4.168589, 1, 1, 1, 1, 1,
0.3758879, 0.187623, 1.961188, 1, 1, 1, 1, 1,
0.3767751, 1.17384, 1.914906, 1, 1, 1, 1, 1,
0.376871, 0.1570279, 1.493551, 1, 1, 1, 1, 1,
0.3804137, 0.8059808, 0.4555061, 1, 1, 1, 1, 1,
0.3844344, -0.7331015, 3.551383, 1, 1, 1, 1, 1,
0.3849591, -1.230312, 1.051235, 1, 1, 1, 1, 1,
0.3858103, -0.2208083, 3.350534, 1, 1, 1, 1, 1,
0.3909571, -0.5055153, 2.541802, 1, 1, 1, 1, 1,
0.3949207, 1.792776, 0.1154602, 1, 1, 1, 1, 1,
0.3983732, -1.772374, 1.144017, 1, 1, 1, 1, 1,
0.4023096, 1.471096, 0.3867115, 1, 1, 1, 1, 1,
0.4154494, -0.4483356, 0.5521353, 0, 0, 1, 1, 1,
0.4166301, 1.779493, 1.641618, 1, 0, 0, 1, 1,
0.4225206, -0.770372, 3.709151, 1, 0, 0, 1, 1,
0.4248434, -0.8292105, 2.612529, 1, 0, 0, 1, 1,
0.4253861, 1.157151, 1.707683, 1, 0, 0, 1, 1,
0.4313211, 0.355803, 0.4399295, 1, 0, 0, 1, 1,
0.4314559, 0.8608396, -1.123306, 0, 0, 0, 1, 1,
0.4339883, 0.2284767, 0.4665653, 0, 0, 0, 1, 1,
0.436004, -0.4365931, 3.374014, 0, 0, 0, 1, 1,
0.4399233, 2.346163, 1.445049, 0, 0, 0, 1, 1,
0.4458584, 1.415887, -0.02326285, 0, 0, 0, 1, 1,
0.4468456, -0.1960643, 2.571034, 0, 0, 0, 1, 1,
0.4487812, -0.4673452, 2.584147, 0, 0, 0, 1, 1,
0.4493948, -0.6242023, 2.478674, 1, 1, 1, 1, 1,
0.4504665, 0.2093754, -0.1884039, 1, 1, 1, 1, 1,
0.4534917, 1.056212, 1.147491, 1, 1, 1, 1, 1,
0.4550061, -0.7358781, 4.43789, 1, 1, 1, 1, 1,
0.4574269, 0.6758455, 0.45871, 1, 1, 1, 1, 1,
0.4604422, -0.4261474, 2.787857, 1, 1, 1, 1, 1,
0.4629085, 1.117205, 0.138148, 1, 1, 1, 1, 1,
0.4648674, -1.969337, 0.8948755, 1, 1, 1, 1, 1,
0.4681745, 0.1214076, 3.829918, 1, 1, 1, 1, 1,
0.4683177, 0.5329496, 0.6213975, 1, 1, 1, 1, 1,
0.4684022, 0.5249302, -1.374125, 1, 1, 1, 1, 1,
0.4691877, 0.816034, 0.659377, 1, 1, 1, 1, 1,
0.4709113, -0.8654917, 2.579419, 1, 1, 1, 1, 1,
0.480811, 0.08453075, 2.20968, 1, 1, 1, 1, 1,
0.4855899, 0.8487633, 1.240365, 1, 1, 1, 1, 1,
0.4868993, -0.7390199, 3.51203, 0, 0, 1, 1, 1,
0.4886865, -1.208734, 2.817665, 1, 0, 0, 1, 1,
0.4905732, -0.6774432, 0.7062236, 1, 0, 0, 1, 1,
0.4925683, 0.8702999, 0.2970178, 1, 0, 0, 1, 1,
0.4944538, 0.1279661, 2.710689, 1, 0, 0, 1, 1,
0.4944888, 1.389097, -1.104577, 1, 0, 0, 1, 1,
0.4981622, 0.9168843, 0.8281953, 0, 0, 0, 1, 1,
0.499766, 0.2844478, 0.4013466, 0, 0, 0, 1, 1,
0.5012847, -2.102853, 3.077234, 0, 0, 0, 1, 1,
0.5051363, -0.9932891, 3.87088, 0, 0, 0, 1, 1,
0.5052168, -1.4123, 2.825344, 0, 0, 0, 1, 1,
0.5090013, -1.648365, 2.554244, 0, 0, 0, 1, 1,
0.5116805, 1.437329, 0.7269993, 0, 0, 0, 1, 1,
0.5122399, 0.9955577, 0.2622618, 1, 1, 1, 1, 1,
0.5150583, 0.445305, 1.449269, 1, 1, 1, 1, 1,
0.5161405, 0.2478887, 0.4053375, 1, 1, 1, 1, 1,
0.5176993, 0.992305, 1.096501, 1, 1, 1, 1, 1,
0.5200454, -0.1208837, 2.819598, 1, 1, 1, 1, 1,
0.521391, 0.3890891, 2.221269, 1, 1, 1, 1, 1,
0.5258256, 0.5554103, 1.621128, 1, 1, 1, 1, 1,
0.5292621, 1.693946, 0.9104265, 1, 1, 1, 1, 1,
0.5298458, -0.7370995, 3.223851, 1, 1, 1, 1, 1,
0.5401874, 0.8722016, 1.874056, 1, 1, 1, 1, 1,
0.542682, -0.3245579, 1.65985, 1, 1, 1, 1, 1,
0.5448739, 1.062394, 0.6083862, 1, 1, 1, 1, 1,
0.5471295, -0.3072529, 2.875773, 1, 1, 1, 1, 1,
0.5512754, 0.5799499, -0.05443069, 1, 1, 1, 1, 1,
0.5545483, 3.146745, 0.2755691, 1, 1, 1, 1, 1,
0.556536, 0.1636159, 1.851668, 0, 0, 1, 1, 1,
0.559981, 0.06073196, 2.377069, 1, 0, 0, 1, 1,
0.5622898, 0.1828571, 3.103607, 1, 0, 0, 1, 1,
0.5638016, -1.146899, 0.5978648, 1, 0, 0, 1, 1,
0.5678873, -0.1300651, 1.794227, 1, 0, 0, 1, 1,
0.5727119, 0.2244965, 1.332172, 1, 0, 0, 1, 1,
0.5768389, 1.948633, -1.046414, 0, 0, 0, 1, 1,
0.5940718, 0.2117682, 0.8893933, 0, 0, 0, 1, 1,
0.5981629, -0.1760896, 1.085495, 0, 0, 0, 1, 1,
0.6029245, -0.4127462, 1.632995, 0, 0, 0, 1, 1,
0.6070501, -0.7384945, 3.244428, 0, 0, 0, 1, 1,
0.6074678, 0.04646503, 1.524399, 0, 0, 0, 1, 1,
0.6197075, 0.4702233, 0.9309297, 0, 0, 0, 1, 1,
0.6257289, 0.6400814, 2.478683, 1, 1, 1, 1, 1,
0.6267313, -0.4067261, 1.356062, 1, 1, 1, 1, 1,
0.6268742, -0.01168439, 1.147675, 1, 1, 1, 1, 1,
0.6281654, 1.395697, 0.9042143, 1, 1, 1, 1, 1,
0.635215, 1.111398, 0.5481891, 1, 1, 1, 1, 1,
0.6367461, -0.7286497, 3.160461, 1, 1, 1, 1, 1,
0.637385, -0.1728071, 1.833833, 1, 1, 1, 1, 1,
0.6400059, 0.5068069, 1.545485, 1, 1, 1, 1, 1,
0.6527956, 0.4663901, 3.017355, 1, 1, 1, 1, 1,
0.6539906, -0.2621621, 1.87034, 1, 1, 1, 1, 1,
0.656244, 0.8351634, 1.413111, 1, 1, 1, 1, 1,
0.6590278, -1.479433, 2.879475, 1, 1, 1, 1, 1,
0.6592779, 1.052167, 1.729108, 1, 1, 1, 1, 1,
0.6608832, -0.3766419, 1.594311, 1, 1, 1, 1, 1,
0.6655186, -1.149243, 2.581832, 1, 1, 1, 1, 1,
0.6728663, -0.06923971, 1.870911, 0, 0, 1, 1, 1,
0.6731253, 0.3756658, 0.9225001, 1, 0, 0, 1, 1,
0.6769149, 0.1076766, 0.5733179, 1, 0, 0, 1, 1,
0.6769639, 0.03984718, 2.376155, 1, 0, 0, 1, 1,
0.6812447, -0.549832, 1.472811, 1, 0, 0, 1, 1,
0.688921, -0.03177702, 2.654664, 1, 0, 0, 1, 1,
0.6915023, -0.6485392, 2.667407, 0, 0, 0, 1, 1,
0.6963375, 1.036924, 0.5278627, 0, 0, 0, 1, 1,
0.7017201, -0.3925939, 3.832986, 0, 0, 0, 1, 1,
0.7039894, -1.349212, 2.868234, 0, 0, 0, 1, 1,
0.7042138, -0.3581873, 0.3142851, 0, 0, 0, 1, 1,
0.7043259, -0.4904682, 2.192112, 0, 0, 0, 1, 1,
0.7126687, 0.7364158, 0.7286946, 0, 0, 0, 1, 1,
0.7129781, -0.5279301, 2.952207, 1, 1, 1, 1, 1,
0.7222926, -0.4375006, 1.203966, 1, 1, 1, 1, 1,
0.7239473, -0.599816, 0.9305376, 1, 1, 1, 1, 1,
0.7336044, -1.135667, 3.44772, 1, 1, 1, 1, 1,
0.7338144, 0.9168873, -1.071261, 1, 1, 1, 1, 1,
0.7349372, -0.3989195, 3.007661, 1, 1, 1, 1, 1,
0.7385851, 0.8635378, 1.524922, 1, 1, 1, 1, 1,
0.7415296, 0.8441285, 0.1561552, 1, 1, 1, 1, 1,
0.7465802, -0.9356015, 3.201692, 1, 1, 1, 1, 1,
0.7503524, 1.507298, 1.333623, 1, 1, 1, 1, 1,
0.7555482, -1.421044, 2.318043, 1, 1, 1, 1, 1,
0.7576385, 0.03479379, 0.5429656, 1, 1, 1, 1, 1,
0.7612523, 0.008152889, 0.05449754, 1, 1, 1, 1, 1,
0.7613249, 0.6218706, -0.483606, 1, 1, 1, 1, 1,
0.770528, -1.178126, 0.8051348, 1, 1, 1, 1, 1,
0.7706739, 0.3982648, 0.2912302, 0, 0, 1, 1, 1,
0.7709963, -2.004495, 1.123713, 1, 0, 0, 1, 1,
0.7718968, -0.7647184, 2.240275, 1, 0, 0, 1, 1,
0.772633, -1.278535, 2.78895, 1, 0, 0, 1, 1,
0.7762716, 0.1859811, 1.065891, 1, 0, 0, 1, 1,
0.7784165, 1.011492, 1.687672, 1, 0, 0, 1, 1,
0.7808926, -0.6687559, 3.62722, 0, 0, 0, 1, 1,
0.7823985, -1.385634, 3.678618, 0, 0, 0, 1, 1,
0.789561, -2.229945, 4.293217, 0, 0, 0, 1, 1,
0.7897061, -0.07561839, 2.416804, 0, 0, 0, 1, 1,
0.7925174, 0.6502778, 0.9810562, 0, 0, 0, 1, 1,
0.7928359, 0.4060779, 0.8410616, 0, 0, 0, 1, 1,
0.7959266, 0.8401002, 0.9650274, 0, 0, 0, 1, 1,
0.7984771, -0.1209838, 3.028479, 1, 1, 1, 1, 1,
0.7987064, 0.575585, 2.855181, 1, 1, 1, 1, 1,
0.8039784, -0.6465792, 3.712557, 1, 1, 1, 1, 1,
0.8065131, -0.7994423, 3.193375, 1, 1, 1, 1, 1,
0.8102055, 0.9528034, -0.2710975, 1, 1, 1, 1, 1,
0.8362606, -1.409504, 3.235177, 1, 1, 1, 1, 1,
0.8370141, -1.84937, 3.665442, 1, 1, 1, 1, 1,
0.8412004, -0.3668061, 2.374694, 1, 1, 1, 1, 1,
0.8485349, -0.00763462, 1.738271, 1, 1, 1, 1, 1,
0.8487361, -0.434421, 3.722396, 1, 1, 1, 1, 1,
0.8535079, -0.2542797, 1.645793, 1, 1, 1, 1, 1,
0.854021, -0.1367021, 0.9496741, 1, 1, 1, 1, 1,
0.8607171, -0.1784172, 0.9663441, 1, 1, 1, 1, 1,
0.8629094, 0.4165421, 1.817649, 1, 1, 1, 1, 1,
0.8643279, -0.8487721, 1.781316, 1, 1, 1, 1, 1,
0.8646703, 0.1372486, 2.564, 0, 0, 1, 1, 1,
0.8679671, 1.861436, 1.031231, 1, 0, 0, 1, 1,
0.8700753, 0.3324103, 0.9457697, 1, 0, 0, 1, 1,
0.8701358, 1.448238, 0.07915021, 1, 0, 0, 1, 1,
0.8710529, -0.1011921, 2.349772, 1, 0, 0, 1, 1,
0.8770776, 0.2752093, 1.501981, 1, 0, 0, 1, 1,
0.8795372, -0.1114327, 1.872603, 0, 0, 0, 1, 1,
0.8847917, 0.7843067, 0.01633018, 0, 0, 0, 1, 1,
0.8856404, 0.3084712, 0.494204, 0, 0, 0, 1, 1,
0.8900574, 0.7806027, -1.762559, 0, 0, 0, 1, 1,
0.8921287, 0.8095744, 0.5522423, 0, 0, 0, 1, 1,
0.8962088, 0.5648648, -0.1636186, 0, 0, 0, 1, 1,
0.9030721, 1.005313, -0.04344246, 0, 0, 0, 1, 1,
0.9106373, 0.6234491, 0.5542682, 1, 1, 1, 1, 1,
0.9115182, 1.58903, -0.2209616, 1, 1, 1, 1, 1,
0.9116573, 1.363143, 0.30047, 1, 1, 1, 1, 1,
0.9225967, 0.2181094, -0.947369, 1, 1, 1, 1, 1,
0.9237985, -0.7949226, 0.9703987, 1, 1, 1, 1, 1,
0.9321838, 1.035902, 0.7813794, 1, 1, 1, 1, 1,
0.9483072, 0.2782581, 2.221889, 1, 1, 1, 1, 1,
0.9485214, -0.4556792, 2.155278, 1, 1, 1, 1, 1,
0.9531185, -0.4160266, 2.294141, 1, 1, 1, 1, 1,
0.9645323, -1.904969, 2.856286, 1, 1, 1, 1, 1,
0.9699795, -1.671786, 2.162012, 1, 1, 1, 1, 1,
0.9707925, -0.425782, 0.9394564, 1, 1, 1, 1, 1,
0.9816515, 0.7648489, 3.426397, 1, 1, 1, 1, 1,
0.9834577, -0.2679024, 0.4673885, 1, 1, 1, 1, 1,
0.9870777, 0.07559071, 2.974444, 1, 1, 1, 1, 1,
0.999705, 1.48991, 1.61169, 0, 0, 1, 1, 1,
1.006408, -0.6583885, 3.617886, 1, 0, 0, 1, 1,
1.009564, -0.7160072, 0.9763279, 1, 0, 0, 1, 1,
1.013672, -1.53235, 1.09677, 1, 0, 0, 1, 1,
1.020384, -1.708672, 3.430873, 1, 0, 0, 1, 1,
1.022866, -0.6022645, 1.828197, 1, 0, 0, 1, 1,
1.02355, 0.3489777, 0.8730531, 0, 0, 0, 1, 1,
1.033399, -1.328443, 2.760034, 0, 0, 0, 1, 1,
1.034098, 1.345494, 1.50957, 0, 0, 0, 1, 1,
1.047735, 2.355509, -0.05281821, 0, 0, 0, 1, 1,
1.048814, 0.1205664, 1.828621, 0, 0, 0, 1, 1,
1.051633, -0.2437053, 3.506593, 0, 0, 0, 1, 1,
1.056717, -0.9266584, 4.485218, 0, 0, 0, 1, 1,
1.056986, 0.8281042, 1.285829, 1, 1, 1, 1, 1,
1.057236, 1.276706, 1.202582, 1, 1, 1, 1, 1,
1.059387, 1.254508, -1.28888, 1, 1, 1, 1, 1,
1.066571, -0.3527148, 2.755038, 1, 1, 1, 1, 1,
1.069079, 0.1528056, 1.186763, 1, 1, 1, 1, 1,
1.073919, -0.6368227, 2.81094, 1, 1, 1, 1, 1,
1.075517, -0.6362452, 0.8610699, 1, 1, 1, 1, 1,
1.077078, 0.9755132, -0.498976, 1, 1, 1, 1, 1,
1.077564, -1.497394, 3.83369, 1, 1, 1, 1, 1,
1.078911, 0.5838486, 0.8353406, 1, 1, 1, 1, 1,
1.079604, 2.490082, 1.235628, 1, 1, 1, 1, 1,
1.088864, 0.06410401, 1.948832, 1, 1, 1, 1, 1,
1.095022, 0.9373098, 0.9322737, 1, 1, 1, 1, 1,
1.09772, -0.9675989, 3.580468, 1, 1, 1, 1, 1,
1.09849, 1.287002, 0.8049055, 1, 1, 1, 1, 1,
1.104485, -0.7276244, 2.913437, 0, 0, 1, 1, 1,
1.106731, -0.4550495, 1.877502, 1, 0, 0, 1, 1,
1.107904, 0.4722203, 4.297897, 1, 0, 0, 1, 1,
1.108014, -1.067446, 2.57987, 1, 0, 0, 1, 1,
1.109701, -0.07666115, -0.001033892, 1, 0, 0, 1, 1,
1.113505, -0.2950454, 2.175698, 1, 0, 0, 1, 1,
1.122615, 1.529444, 0.9472028, 0, 0, 0, 1, 1,
1.127491, 0.2564698, 3.047267, 0, 0, 0, 1, 1,
1.134263, 1.661069, 0.8302029, 0, 0, 0, 1, 1,
1.138077, -1.027553, 1.98266, 0, 0, 0, 1, 1,
1.147905, 0.4941835, -0.424793, 0, 0, 0, 1, 1,
1.14882, -1.244303, 3.972928, 0, 0, 0, 1, 1,
1.154916, -0.6836225, 2.869367, 0, 0, 0, 1, 1,
1.160436, -1.787244, 2.212389, 1, 1, 1, 1, 1,
1.161433, -1.873473, 2.489252, 1, 1, 1, 1, 1,
1.174245, 1.190602, 1.198542, 1, 1, 1, 1, 1,
1.175367, 0.2938946, 2.833568, 1, 1, 1, 1, 1,
1.175405, 0.9524557, 2.251092, 1, 1, 1, 1, 1,
1.183764, 0.7543041, 0.8881517, 1, 1, 1, 1, 1,
1.196077, 2.58204, -0.2833965, 1, 1, 1, 1, 1,
1.20944, -0.3108646, 0.1933815, 1, 1, 1, 1, 1,
1.211485, 1.070186, 1.559449, 1, 1, 1, 1, 1,
1.213279, 0.972344, 2.588109, 1, 1, 1, 1, 1,
1.222448, 0.6046352, 1.157472, 1, 1, 1, 1, 1,
1.22371, -1.722178, 2.330888, 1, 1, 1, 1, 1,
1.223957, 0.7512258, 0.1428358, 1, 1, 1, 1, 1,
1.229648, -0.4106017, 2.014641, 1, 1, 1, 1, 1,
1.23085, 0.3318252, 1.616386, 1, 1, 1, 1, 1,
1.23524, 0.816678, 3.093632, 0, 0, 1, 1, 1,
1.238052, 0.4117711, 2.629641, 1, 0, 0, 1, 1,
1.25497, 1.32195, 0.7247675, 1, 0, 0, 1, 1,
1.257859, -0.7593699, 0.6472833, 1, 0, 0, 1, 1,
1.273877, 1.925239, -0.08860878, 1, 0, 0, 1, 1,
1.283141, 0.6766508, -0.4890336, 1, 0, 0, 1, 1,
1.289574, -1.083491, 1.653971, 0, 0, 0, 1, 1,
1.295297, -0.1158806, 1.448707, 0, 0, 0, 1, 1,
1.299832, -0.9845494, 3.397516, 0, 0, 0, 1, 1,
1.306778, -0.7259961, -0.8409589, 0, 0, 0, 1, 1,
1.310136, 0.3458809, 1.751682, 0, 0, 0, 1, 1,
1.314003, -1.933614, 2.605661, 0, 0, 0, 1, 1,
1.321263, -1.9378, 2.061276, 0, 0, 0, 1, 1,
1.324475, 1.571775, 1.353406, 1, 1, 1, 1, 1,
1.329616, -1.245322, 0.7106867, 1, 1, 1, 1, 1,
1.338633, -1.584383, 2.59712, 1, 1, 1, 1, 1,
1.338866, 1.037032, -0.3135976, 1, 1, 1, 1, 1,
1.341765, 0.590917, 0.3029147, 1, 1, 1, 1, 1,
1.344614, 0.5528715, 1.564758, 1, 1, 1, 1, 1,
1.346407, 2.22271, 1.071822, 1, 1, 1, 1, 1,
1.355715, 0.4908191, 1.015047, 1, 1, 1, 1, 1,
1.366807, -0.5235348, 1.925471, 1, 1, 1, 1, 1,
1.375877, -0.04426103, 0.8676725, 1, 1, 1, 1, 1,
1.399102, 0.5222436, 1.12799, 1, 1, 1, 1, 1,
1.410231, -1.408475, 2.989103, 1, 1, 1, 1, 1,
1.41028, 1.10908, -0.2241818, 1, 1, 1, 1, 1,
1.411029, -0.8436968, 3.621701, 1, 1, 1, 1, 1,
1.427593, -0.620738, 2.403465, 1, 1, 1, 1, 1,
1.433015, 1.242185, 1.69872, 0, 0, 1, 1, 1,
1.437513, 1.670173, 2.645645, 1, 0, 0, 1, 1,
1.442168, -0.6577616, 2.373248, 1, 0, 0, 1, 1,
1.443722, -0.1702537, 2.457414, 1, 0, 0, 1, 1,
1.451416, -0.8220302, 3.642617, 1, 0, 0, 1, 1,
1.452254, -0.3367222, -0.630547, 1, 0, 0, 1, 1,
1.456095, 0.3522516, 1.176107, 0, 0, 0, 1, 1,
1.457453, -1.017765, 1.530933, 0, 0, 0, 1, 1,
1.463583, 0.2817052, 0.351758, 0, 0, 0, 1, 1,
1.468858, 0.3215577, 1.507647, 0, 0, 0, 1, 1,
1.4796, -0.1501116, 2.947695, 0, 0, 0, 1, 1,
1.479704, 0.7157194, 1.907508, 0, 0, 0, 1, 1,
1.481271, 0.5684912, 1.306685, 0, 0, 0, 1, 1,
1.490914, -1.083391, 3.684934, 1, 1, 1, 1, 1,
1.50177, 0.7806549, -0.05666462, 1, 1, 1, 1, 1,
1.511711, 0.7802225, 3.426903, 1, 1, 1, 1, 1,
1.520233, 0.1507451, 1.442525, 1, 1, 1, 1, 1,
1.526293, 0.3643705, 0.4147461, 1, 1, 1, 1, 1,
1.5289, -0.6940082, 4.665423, 1, 1, 1, 1, 1,
1.535169, 0.738061, 0.6717998, 1, 1, 1, 1, 1,
1.539626, -1.053083, 2.714082, 1, 1, 1, 1, 1,
1.553297, 0.2562517, 0.03531229, 1, 1, 1, 1, 1,
1.556787, -1.495275, 1.14858, 1, 1, 1, 1, 1,
1.558051, 1.092267, 1.390658, 1, 1, 1, 1, 1,
1.559998, 0.4437403, 1.517911, 1, 1, 1, 1, 1,
1.564, -0.5096133, 0.6992173, 1, 1, 1, 1, 1,
1.57249, -0.7285865, 2.963363, 1, 1, 1, 1, 1,
1.580293, -0.03229514, 2.702299, 1, 1, 1, 1, 1,
1.582963, -0.4977032, 1.076499, 0, 0, 1, 1, 1,
1.596583, 0.2882044, 2.227905, 1, 0, 0, 1, 1,
1.597962, 0.6509913, 0.3654912, 1, 0, 0, 1, 1,
1.604002, -1.511655, 1.687891, 1, 0, 0, 1, 1,
1.639594, 0.7772292, 0.8714701, 1, 0, 0, 1, 1,
1.645257, -0.06983918, 2.863619, 1, 0, 0, 1, 1,
1.6547, -1.47578, 2.024961, 0, 0, 0, 1, 1,
1.657855, -2.241677, 1.858507, 0, 0, 0, 1, 1,
1.663483, 0.7373056, 1.075495, 0, 0, 0, 1, 1,
1.670514, -1.298359, 1.028582, 0, 0, 0, 1, 1,
1.674217, 0.04140321, 0.678871, 0, 0, 0, 1, 1,
1.674746, -1.808649, 3.207623, 0, 0, 0, 1, 1,
1.687569, 2.919901, 1.787799, 0, 0, 0, 1, 1,
1.691064, 0.928879, 1.367639, 1, 1, 1, 1, 1,
1.701637, -0.754936, 2.174631, 1, 1, 1, 1, 1,
1.706776, -1.259984, 3.051219, 1, 1, 1, 1, 1,
1.736775, 0.1317928, 0.9069338, 1, 1, 1, 1, 1,
1.755472, -1.61956, 3.467382, 1, 1, 1, 1, 1,
1.780119, -1.238425, 0.3706372, 1, 1, 1, 1, 1,
1.802245, -0.439241, 1.479181, 1, 1, 1, 1, 1,
1.851037, 1.446706, -0.005785322, 1, 1, 1, 1, 1,
1.884166, 0.5881295, -0.5888208, 1, 1, 1, 1, 1,
1.894758, 0.4980203, 1.075145, 1, 1, 1, 1, 1,
1.968728, -0.1836538, 2.202371, 1, 1, 1, 1, 1,
1.983116, -0.3147241, 2.282071, 1, 1, 1, 1, 1,
1.986884, 0.4731923, 0.3804925, 1, 1, 1, 1, 1,
2.012485, 1.16767, 1.690233, 1, 1, 1, 1, 1,
2.028899, 0.6652033, 1.963554, 1, 1, 1, 1, 1,
2.048501, 0.2601088, 0.3585665, 0, 0, 1, 1, 1,
2.05691, 0.2585645, -0.09982301, 1, 0, 0, 1, 1,
2.083785, -1.048264, 1.004439, 1, 0, 0, 1, 1,
2.085852, 2.94201, -0.6120296, 1, 0, 0, 1, 1,
2.094838, 1.168136, 0.09500885, 1, 0, 0, 1, 1,
2.118237, 0.285193, 1.273864, 1, 0, 0, 1, 1,
2.123284, -0.9327134, 1.873072, 0, 0, 0, 1, 1,
2.233829, -0.1181334, 0.9100799, 0, 0, 0, 1, 1,
2.234269, 0.4913754, 1.673295, 0, 0, 0, 1, 1,
2.287154, 0.4928212, 0.7729285, 0, 0, 0, 1, 1,
2.351346, -0.4988694, 2.003959, 0, 0, 0, 1, 1,
2.370283, 1.990344, -1.536008, 0, 0, 0, 1, 1,
2.492877, -1.066922, 2.837343, 0, 0, 0, 1, 1,
2.636508, 0.6699644, 1.715378, 1, 1, 1, 1, 1,
2.637912, -1.441973, 2.114424, 1, 1, 1, 1, 1,
2.64985, 0.153455, 1.096281, 1, 1, 1, 1, 1,
2.728428, 1.04745, 2.082555, 1, 1, 1, 1, 1,
2.882729, -0.8358333, 4.289343, 1, 1, 1, 1, 1,
3.143857, 0.6372057, 3.108357, 1, 1, 1, 1, 1,
3.565933, 0.3000503, -0.1038235, 1, 1, 1, 1, 1
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
var radius = 9.873492;
var distance = 34.68023;
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
mvMatrix.translate( -0.08252335, 0.09327412, -0.03466463 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.68023);
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