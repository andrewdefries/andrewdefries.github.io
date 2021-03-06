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
-2.723715, -1.099177, -0.1247263, 1, 0, 0, 1,
-2.710376, 1.898118, 0.5992753, 1, 0.007843138, 0, 1,
-2.697455, 1.023562, -2.123794, 1, 0.01176471, 0, 1,
-2.62921, -0.2557812, -0.4006913, 1, 0.01960784, 0, 1,
-2.584524, -0.01927453, 0.7803465, 1, 0.02352941, 0, 1,
-2.559407, 1.025378, -1.439298, 1, 0.03137255, 0, 1,
-2.53143, -0.9741596, -0.6771489, 1, 0.03529412, 0, 1,
-2.456671, -1.279008, -2.214863, 1, 0.04313726, 0, 1,
-2.312124, 1.395107, 0.4586965, 1, 0.04705882, 0, 1,
-2.253667, -0.4379852, -2.064667, 1, 0.05490196, 0, 1,
-2.167661, 0.451966, -0.7899806, 1, 0.05882353, 0, 1,
-2.124228, -1.42595, -1.954003, 1, 0.06666667, 0, 1,
-2.116723, -1.082739, -1.562063, 1, 0.07058824, 0, 1,
-2.101022, -1.479622, -1.114866, 1, 0.07843138, 0, 1,
-2.087328, -0.854445, -3.112733, 1, 0.08235294, 0, 1,
-2.08219, -0.4775871, -1.413712, 1, 0.09019608, 0, 1,
-2.055754, 0.9859688, -1.130231, 1, 0.09411765, 0, 1,
-2.053255, -0.3838312, -0.6266547, 1, 0.1019608, 0, 1,
-2.010727, 0.1751366, -0.8013836, 1, 0.1098039, 0, 1,
-2.005812, 0.04642699, -2.014631, 1, 0.1137255, 0, 1,
-1.998475, -0.4541069, -1.748445, 1, 0.1215686, 0, 1,
-1.981109, -1.357794, -1.161854, 1, 0.1254902, 0, 1,
-1.963925, 0.5403365, -0.9460853, 1, 0.1333333, 0, 1,
-1.91604, 1.712245, -1.559208, 1, 0.1372549, 0, 1,
-1.865805, 0.3122221, -0.5280703, 1, 0.145098, 0, 1,
-1.804485, 0.3402636, -0.8683305, 1, 0.1490196, 0, 1,
-1.803931, 0.488149, -0.3002786, 1, 0.1568628, 0, 1,
-1.792815, 1.912564, -0.9606214, 1, 0.1607843, 0, 1,
-1.754726, -0.2448993, -1.92784, 1, 0.1686275, 0, 1,
-1.754248, 0.4529714, -0.2452084, 1, 0.172549, 0, 1,
-1.743785, -1.064983, -1.603111, 1, 0.1803922, 0, 1,
-1.686674, 0.5885972, -0.01532462, 1, 0.1843137, 0, 1,
-1.663364, -0.4750491, -0.8950353, 1, 0.1921569, 0, 1,
-1.662107, 0.5947154, 0.6387635, 1, 0.1960784, 0, 1,
-1.658909, -1.273015, -2.03478, 1, 0.2039216, 0, 1,
-1.657416, 0.7545865, -2.159848, 1, 0.2117647, 0, 1,
-1.64296, -0.9233963, -0.2647168, 1, 0.2156863, 0, 1,
-1.628597, 1.853562, -0.8831768, 1, 0.2235294, 0, 1,
-1.601091, -1.21856, -2.615895, 1, 0.227451, 0, 1,
-1.597868, 0.04571778, -2.862804, 1, 0.2352941, 0, 1,
-1.589712, -0.2646871, -1.661411, 1, 0.2392157, 0, 1,
-1.587024, 0.2144996, -0.8509754, 1, 0.2470588, 0, 1,
-1.586424, 0.9440332, -2.00071, 1, 0.2509804, 0, 1,
-1.577466, -0.009022023, -1.662277, 1, 0.2588235, 0, 1,
-1.561937, 0.07812461, -2.685397, 1, 0.2627451, 0, 1,
-1.561408, -0.3482073, -2.340379, 1, 0.2705882, 0, 1,
-1.559686, -0.8578675, -3.484943, 1, 0.2745098, 0, 1,
-1.558438, 0.5668316, -0.9323334, 1, 0.282353, 0, 1,
-1.548642, 0.1992651, -2.388542, 1, 0.2862745, 0, 1,
-1.548196, -1.974419, -3.197106, 1, 0.2941177, 0, 1,
-1.538813, -0.6114575, -0.8850286, 1, 0.3019608, 0, 1,
-1.534959, 1.227586, -0.1524674, 1, 0.3058824, 0, 1,
-1.531431, 0.4591991, -2.161232, 1, 0.3137255, 0, 1,
-1.499569, -0.3667779, -3.911952, 1, 0.3176471, 0, 1,
-1.487121, 0.8552707, -0.6430031, 1, 0.3254902, 0, 1,
-1.486007, 1.156514, -2.036588, 1, 0.3294118, 0, 1,
-1.484464, -0.5164617, -0.9596848, 1, 0.3372549, 0, 1,
-1.471715, 0.99448, 0.280852, 1, 0.3411765, 0, 1,
-1.471556, -0.9761612, -2.982153, 1, 0.3490196, 0, 1,
-1.450599, -1.356724, -2.555902, 1, 0.3529412, 0, 1,
-1.431564, -1.322257, -2.911939, 1, 0.3607843, 0, 1,
-1.428526, -0.02864954, -0.3760355, 1, 0.3647059, 0, 1,
-1.417257, 0.9752081, -1.802678, 1, 0.372549, 0, 1,
-1.4009, 0.9989747, -1.559104, 1, 0.3764706, 0, 1,
-1.400061, 1.01965, -0.8871423, 1, 0.3843137, 0, 1,
-1.395959, -0.5711107, -1.48184, 1, 0.3882353, 0, 1,
-1.395061, -0.1420055, -3.731817, 1, 0.3960784, 0, 1,
-1.391504, -0.6424621, -0.7572585, 1, 0.4039216, 0, 1,
-1.384894, -1.362489, -1.187372, 1, 0.4078431, 0, 1,
-1.38181, 0.4257454, -1.474369, 1, 0.4156863, 0, 1,
-1.377809, -0.3786332, -2.15585, 1, 0.4196078, 0, 1,
-1.375499, 0.5876025, -0.7505617, 1, 0.427451, 0, 1,
-1.370419, 1.681423, -0.5524558, 1, 0.4313726, 0, 1,
-1.355686, 0.09981894, -2.322815, 1, 0.4392157, 0, 1,
-1.352826, -0.1129389, -2.825511, 1, 0.4431373, 0, 1,
-1.343975, -0.2399801, -2.494508, 1, 0.4509804, 0, 1,
-1.343963, 0.5583863, 0.8432939, 1, 0.454902, 0, 1,
-1.343738, 0.5742725, -2.754322, 1, 0.4627451, 0, 1,
-1.334457, 0.7906463, 0.06435599, 1, 0.4666667, 0, 1,
-1.334336, -0.7569696, -2.719889, 1, 0.4745098, 0, 1,
-1.333663, -0.001089963, -1.768106, 1, 0.4784314, 0, 1,
-1.324038, -0.2703481, -0.702752, 1, 0.4862745, 0, 1,
-1.323997, -1.245185, -2.669096, 1, 0.4901961, 0, 1,
-1.312723, 0.2596262, -1.746113, 1, 0.4980392, 0, 1,
-1.310463, 2.679287, -0.2347513, 1, 0.5058824, 0, 1,
-1.29825, 1.672928, 0.7326974, 1, 0.509804, 0, 1,
-1.296018, 0.5102124, -0.7165648, 1, 0.5176471, 0, 1,
-1.290733, -0.6790821, -0.1919201, 1, 0.5215687, 0, 1,
-1.285728, 0.0279676, -1.474917, 1, 0.5294118, 0, 1,
-1.281974, 1.113384, -0.5806991, 1, 0.5333334, 0, 1,
-1.27338, 0.01495867, -2.574326, 1, 0.5411765, 0, 1,
-1.26997, -1.377421, -2.587481, 1, 0.5450981, 0, 1,
-1.265649, -0.3728553, -1.708769, 1, 0.5529412, 0, 1,
-1.264146, -0.5058399, -1.952221, 1, 0.5568628, 0, 1,
-1.243916, 0.008168685, -3.434017, 1, 0.5647059, 0, 1,
-1.219782, 0.8156784, -2.302369, 1, 0.5686275, 0, 1,
-1.218293, -1.385943, -2.124594, 1, 0.5764706, 0, 1,
-1.216099, 1.491524, -0.1063369, 1, 0.5803922, 0, 1,
-1.203961, -0.3748977, -0.8787478, 1, 0.5882353, 0, 1,
-1.19261, -0.820637, -1.552284, 1, 0.5921569, 0, 1,
-1.190149, -0.5016751, -1.485203, 1, 0.6, 0, 1,
-1.182718, -0.1108149, -3.703601, 1, 0.6078432, 0, 1,
-1.174022, -1.104289, -1.310618, 1, 0.6117647, 0, 1,
-1.168045, -1.371052, -0.3470541, 1, 0.6196079, 0, 1,
-1.167192, -0.02064685, -1.788149, 1, 0.6235294, 0, 1,
-1.164615, 0.2315709, -0.9478652, 1, 0.6313726, 0, 1,
-1.160182, 0.4607952, -1.449048, 1, 0.6352941, 0, 1,
-1.153482, 0.06017911, -1.294076, 1, 0.6431373, 0, 1,
-1.149627, 1.68543, -0.9484541, 1, 0.6470588, 0, 1,
-1.148111, -0.001014433, -2.685949, 1, 0.654902, 0, 1,
-1.146823, 0.5782926, -1.78864, 1, 0.6588235, 0, 1,
-1.142648, -1.259288, -1.450283, 1, 0.6666667, 0, 1,
-1.142355, -1.073174, -2.341151, 1, 0.6705883, 0, 1,
-1.137273, 0.8572369, 0.77371, 1, 0.6784314, 0, 1,
-1.132796, -1.563343, -2.366987, 1, 0.682353, 0, 1,
-1.128779, -0.3179134, -0.8927118, 1, 0.6901961, 0, 1,
-1.121806, -0.5387428, -3.075533, 1, 0.6941177, 0, 1,
-1.117575, -0.503365, -0.2700134, 1, 0.7019608, 0, 1,
-1.117322, -0.6508961, -3.848125, 1, 0.7098039, 0, 1,
-1.113113, 0.3532302, 0.1082364, 1, 0.7137255, 0, 1,
-1.107605, 0.7491918, 0.4020925, 1, 0.7215686, 0, 1,
-1.105833, -1.163644, -2.335033, 1, 0.7254902, 0, 1,
-1.104715, -0.3217111, -1.680596, 1, 0.7333333, 0, 1,
-1.100879, 0.07718428, -1.403512, 1, 0.7372549, 0, 1,
-1.097088, -0.2583494, -2.17112, 1, 0.7450981, 0, 1,
-1.094576, 0.5029129, -0.8175524, 1, 0.7490196, 0, 1,
-1.088608, 0.8228114, -2.37575, 1, 0.7568628, 0, 1,
-1.087165, 0.3091067, -0.4145411, 1, 0.7607843, 0, 1,
-1.083781, -1.21646, -2.278498, 1, 0.7686275, 0, 1,
-1.080672, -0.3328885, -3.494243, 1, 0.772549, 0, 1,
-1.078569, -0.305905, -1.756525, 1, 0.7803922, 0, 1,
-1.070017, -0.9483737, -3.10669, 1, 0.7843137, 0, 1,
-1.038185, -0.9021075, -1.891294, 1, 0.7921569, 0, 1,
-1.034252, -0.4718551, -4.182837, 1, 0.7960784, 0, 1,
-1.025681, -0.7991803, -1.133114, 1, 0.8039216, 0, 1,
-1.021832, 0.5858479, -0.2264244, 1, 0.8117647, 0, 1,
-1.012269, -0.3947597, -0.3146845, 1, 0.8156863, 0, 1,
-1.006896, 1.188668, 0.4624126, 1, 0.8235294, 0, 1,
-1.001222, 0.4788406, -1.574206, 1, 0.827451, 0, 1,
-0.9998114, -0.09125179, -2.264664, 1, 0.8352941, 0, 1,
-0.997535, -0.8895267, -2.147623, 1, 0.8392157, 0, 1,
-0.9962516, 0.8123062, -0.416396, 1, 0.8470588, 0, 1,
-0.9806235, -1.390997, -2.785108, 1, 0.8509804, 0, 1,
-0.9772139, -0.2473326, -2.215967, 1, 0.8588235, 0, 1,
-0.9767027, 0.02488871, -1.622622, 1, 0.8627451, 0, 1,
-0.9725887, -0.6063538, -2.178585, 1, 0.8705882, 0, 1,
-0.9677685, 0.6345707, -2.177549, 1, 0.8745098, 0, 1,
-0.9667634, 0.4841234, -1.37588, 1, 0.8823529, 0, 1,
-0.9618546, -1.237091, -0.9299599, 1, 0.8862745, 0, 1,
-0.9591252, 0.3156698, -3.151684, 1, 0.8941177, 0, 1,
-0.9572066, 0.784368, -2.676814, 1, 0.8980392, 0, 1,
-0.9542376, -0.959127, -2.857961, 1, 0.9058824, 0, 1,
-0.9357244, 1.481233, -0.01835205, 1, 0.9137255, 0, 1,
-0.9329553, -0.7758737, -1.752195, 1, 0.9176471, 0, 1,
-0.9243258, 1.564266, -1.772487, 1, 0.9254902, 0, 1,
-0.9237873, -0.1109822, -0.762162, 1, 0.9294118, 0, 1,
-0.9176506, -0.3600171, -1.141222, 1, 0.9372549, 0, 1,
-0.9149145, -0.1156512, -1.371631, 1, 0.9411765, 0, 1,
-0.9128578, 0.5494786, 0.02414877, 1, 0.9490196, 0, 1,
-0.9069969, -0.6964802, -2.464286, 1, 0.9529412, 0, 1,
-0.9033496, -2.111269, -2.382629, 1, 0.9607843, 0, 1,
-0.9005558, -0.3643929, -3.160611, 1, 0.9647059, 0, 1,
-0.8939357, -0.1494266, -1.759869, 1, 0.972549, 0, 1,
-0.8881228, -1.147286, -3.27926, 1, 0.9764706, 0, 1,
-0.8870547, -2.599009, -3.188411, 1, 0.9843137, 0, 1,
-0.8865571, -0.5530881, -3.026932, 1, 0.9882353, 0, 1,
-0.883846, -1.102652, -0.7245423, 1, 0.9960784, 0, 1,
-0.8828773, -1.45523, -2.030511, 0.9960784, 1, 0, 1,
-0.8821722, -0.08395883, -2.791279, 0.9921569, 1, 0, 1,
-0.8820765, -0.5139596, -1.11725, 0.9843137, 1, 0, 1,
-0.8783103, -0.2121643, -2.478877, 0.9803922, 1, 0, 1,
-0.8763694, -0.2292606, -1.94852, 0.972549, 1, 0, 1,
-0.8751647, -0.1599997, -1.582232, 0.9686275, 1, 0, 1,
-0.8744138, -1.148549, -1.786842, 0.9607843, 1, 0, 1,
-0.8742743, -0.01361267, -1.673518, 0.9568627, 1, 0, 1,
-0.8716521, 0.7961954, 0.5466681, 0.9490196, 1, 0, 1,
-0.869653, -1.096905, -2.991534, 0.945098, 1, 0, 1,
-0.8654934, -1.349265, -3.567466, 0.9372549, 1, 0, 1,
-0.8621612, 1.197954, -0.9432355, 0.9333333, 1, 0, 1,
-0.8605269, -1.171202, -1.410655, 0.9254902, 1, 0, 1,
-0.8595693, 1.667897, 0.9213414, 0.9215686, 1, 0, 1,
-0.854757, 1.029438, -0.6810558, 0.9137255, 1, 0, 1,
-0.8444429, 0.2374343, 0.4431647, 0.9098039, 1, 0, 1,
-0.8389705, 0.6707637, 0.3859947, 0.9019608, 1, 0, 1,
-0.8346921, 0.3101016, 0.5770521, 0.8941177, 1, 0, 1,
-0.8212813, -0.8372088, -3.586196, 0.8901961, 1, 0, 1,
-0.8184021, 0.4410348, -2.538885, 0.8823529, 1, 0, 1,
-0.8131726, -0.5378742, -3.26498, 0.8784314, 1, 0, 1,
-0.8106433, -0.9489705, -0.3084938, 0.8705882, 1, 0, 1,
-0.8059934, 0.8476303, -1.689166, 0.8666667, 1, 0, 1,
-0.8008772, 2.027982, -0.2797711, 0.8588235, 1, 0, 1,
-0.7977785, -0.2239584, -0.757964, 0.854902, 1, 0, 1,
-0.7904856, -1.791934, -1.725884, 0.8470588, 1, 0, 1,
-0.7787511, -1.323255, -1.152601, 0.8431373, 1, 0, 1,
-0.7694541, -1.09129, -2.296917, 0.8352941, 1, 0, 1,
-0.7673854, -0.5360203, -0.3906634, 0.8313726, 1, 0, 1,
-0.7654958, -0.6154319, -3.056012, 0.8235294, 1, 0, 1,
-0.7616798, 1.065423, -1.799632, 0.8196079, 1, 0, 1,
-0.7580029, 0.6901019, -1.799502, 0.8117647, 1, 0, 1,
-0.7544612, -0.8255839, -2.650108, 0.8078431, 1, 0, 1,
-0.7544252, -0.6775127, 0.7096691, 0.8, 1, 0, 1,
-0.7543653, 1.27717, -2.379635, 0.7921569, 1, 0, 1,
-0.7541619, -0.04137791, -2.793271, 0.7882353, 1, 0, 1,
-0.7501813, -1.036582, -5.134109, 0.7803922, 1, 0, 1,
-0.7392029, -0.3818128, -0.4999686, 0.7764706, 1, 0, 1,
-0.7350761, -1.638271, -1.930062, 0.7686275, 1, 0, 1,
-0.7333784, 0.915203, 0.2488309, 0.7647059, 1, 0, 1,
-0.7323999, 0.0567364, -2.547158, 0.7568628, 1, 0, 1,
-0.7290965, 0.513561, -0.7192529, 0.7529412, 1, 0, 1,
-0.726714, 1.031456, -0.07744187, 0.7450981, 1, 0, 1,
-0.7233908, 0.6379828, -0.681576, 0.7411765, 1, 0, 1,
-0.7229357, 0.4479227, 0.4016835, 0.7333333, 1, 0, 1,
-0.7223348, -0.5471433, -3.091175, 0.7294118, 1, 0, 1,
-0.721116, 1.481138, -0.4188877, 0.7215686, 1, 0, 1,
-0.718864, -1.055616, -0.9433395, 0.7176471, 1, 0, 1,
-0.7162526, -0.6683887, -2.382426, 0.7098039, 1, 0, 1,
-0.7148601, -0.4430815, -2.405298, 0.7058824, 1, 0, 1,
-0.7137687, -0.3850927, -3.001155, 0.6980392, 1, 0, 1,
-0.7128548, 0.2243497, -2.221696, 0.6901961, 1, 0, 1,
-0.7054348, -0.08200946, -0.2065525, 0.6862745, 1, 0, 1,
-0.7050872, 1.242204, -0.3696493, 0.6784314, 1, 0, 1,
-0.6990393, -0.2928005, -2.237906, 0.6745098, 1, 0, 1,
-0.6972073, -1.283158, -2.742443, 0.6666667, 1, 0, 1,
-0.6906679, -1.094219, -3.248506, 0.6627451, 1, 0, 1,
-0.6904463, 0.8137335, 0.06548579, 0.654902, 1, 0, 1,
-0.6836642, -1.107769, -1.864093, 0.6509804, 1, 0, 1,
-0.6823497, 0.7643898, 0.4752139, 0.6431373, 1, 0, 1,
-0.674822, -0.0702313, -2.81199, 0.6392157, 1, 0, 1,
-0.6722807, 0.2140392, -3.727112, 0.6313726, 1, 0, 1,
-0.6712999, 0.4854873, -1.73069, 0.627451, 1, 0, 1,
-0.6709761, 1.583884, -1.2683, 0.6196079, 1, 0, 1,
-0.6695108, 0.05056523, -1.55838, 0.6156863, 1, 0, 1,
-0.6693534, 1.461568, -1.698706, 0.6078432, 1, 0, 1,
-0.6647378, 0.07421894, -0.4607832, 0.6039216, 1, 0, 1,
-0.664595, -0.2524513, -2.891844, 0.5960785, 1, 0, 1,
-0.6567335, 0.298008, -1.506167, 0.5882353, 1, 0, 1,
-0.6539145, -1.849807, -4.077374, 0.5843138, 1, 0, 1,
-0.6443364, -1.248847, -2.649538, 0.5764706, 1, 0, 1,
-0.6426748, -0.3062196, -2.803527, 0.572549, 1, 0, 1,
-0.6407841, -0.8461565, -2.980732, 0.5647059, 1, 0, 1,
-0.6401935, -0.0296363, -1.070414, 0.5607843, 1, 0, 1,
-0.6304031, -0.03046288, -2.47805, 0.5529412, 1, 0, 1,
-0.6283149, -0.1797464, -1.189217, 0.5490196, 1, 0, 1,
-0.6227167, 0.2256313, -2.136754, 0.5411765, 1, 0, 1,
-0.6215333, 2.120931, 0.2842745, 0.5372549, 1, 0, 1,
-0.618692, -0.7168226, -3.214902, 0.5294118, 1, 0, 1,
-0.6160169, -0.3431793, -2.373348, 0.5254902, 1, 0, 1,
-0.6144149, 2.244575, -0.3191637, 0.5176471, 1, 0, 1,
-0.6134599, 1.501621, 0.3781599, 0.5137255, 1, 0, 1,
-0.6098225, -0.7920052, -2.942764, 0.5058824, 1, 0, 1,
-0.6087797, -0.3285239, -2.700892, 0.5019608, 1, 0, 1,
-0.6061171, 0.9019611, -0.371978, 0.4941176, 1, 0, 1,
-0.6051586, -0.1358883, -0.1407361, 0.4862745, 1, 0, 1,
-0.5994228, 1.146955, -0.9301554, 0.4823529, 1, 0, 1,
-0.5992888, 0.5286826, -0.2412407, 0.4745098, 1, 0, 1,
-0.5970894, -1.287751, -1.570107, 0.4705882, 1, 0, 1,
-0.5945081, 1.080057, -0.2087162, 0.4627451, 1, 0, 1,
-0.5917711, 0.93125, -0.6798367, 0.4588235, 1, 0, 1,
-0.5867819, -0.1495623, -1.016295, 0.4509804, 1, 0, 1,
-0.5846752, 1.486674, -1.795914, 0.4470588, 1, 0, 1,
-0.5836154, 1.245089, -0.04878638, 0.4392157, 1, 0, 1,
-0.5834941, -2.149765, -3.928626, 0.4352941, 1, 0, 1,
-0.5832813, 0.1714043, -0.4682196, 0.427451, 1, 0, 1,
-0.5813769, -0.8820073, -1.288985, 0.4235294, 1, 0, 1,
-0.5774575, -1.546491, -2.33582, 0.4156863, 1, 0, 1,
-0.5699549, -1.689605, -2.433864, 0.4117647, 1, 0, 1,
-0.5671244, -0.009437317, -1.332143, 0.4039216, 1, 0, 1,
-0.5626466, 0.01533577, -0.8061954, 0.3960784, 1, 0, 1,
-0.558283, 1.768348, -1.206059, 0.3921569, 1, 0, 1,
-0.555249, -0.1641378, -2.659111, 0.3843137, 1, 0, 1,
-0.5540054, 0.2699911, -1.94064, 0.3803922, 1, 0, 1,
-0.5531672, -1.071583, -1.80667, 0.372549, 1, 0, 1,
-0.5400954, -0.8686631, -2.452614, 0.3686275, 1, 0, 1,
-0.5345967, -0.09590051, -1.452347, 0.3607843, 1, 0, 1,
-0.5338441, -0.6132836, -2.257489, 0.3568628, 1, 0, 1,
-0.5279654, -0.6417813, -1.732252, 0.3490196, 1, 0, 1,
-0.5243812, -0.2071342, -1.858879, 0.345098, 1, 0, 1,
-0.5240781, 2.102107, 0.9755532, 0.3372549, 1, 0, 1,
-0.5185062, -1.021636, -3.123464, 0.3333333, 1, 0, 1,
-0.5125964, -0.2549405, -1.539829, 0.3254902, 1, 0, 1,
-0.5063728, -0.3055376, -2.483659, 0.3215686, 1, 0, 1,
-0.4990037, -1.210492, -3.431819, 0.3137255, 1, 0, 1,
-0.4980336, -0.4681417, -3.664292, 0.3098039, 1, 0, 1,
-0.4975109, -1.204522, -3.113503, 0.3019608, 1, 0, 1,
-0.4967279, -0.007426987, -2.157114, 0.2941177, 1, 0, 1,
-0.496585, -0.08027382, -2.028193, 0.2901961, 1, 0, 1,
-0.496117, -0.8530705, -1.163033, 0.282353, 1, 0, 1,
-0.4926745, 0.3524271, -0.1621076, 0.2784314, 1, 0, 1,
-0.4906374, -1.7682, -2.112705, 0.2705882, 1, 0, 1,
-0.487263, -0.3950626, -0.01721212, 0.2666667, 1, 0, 1,
-0.4840716, 0.2032616, -1.183375, 0.2588235, 1, 0, 1,
-0.4839446, 1.227606, 0.7080643, 0.254902, 1, 0, 1,
-0.4827758, -1.857669, -2.087061, 0.2470588, 1, 0, 1,
-0.4813583, -0.6322343, -1.645514, 0.2431373, 1, 0, 1,
-0.4753718, -0.6111698, -4.206614, 0.2352941, 1, 0, 1,
-0.4752399, -0.02427814, -1.05269, 0.2313726, 1, 0, 1,
-0.4719098, 0.2612854, 0.07160791, 0.2235294, 1, 0, 1,
-0.4696311, 0.28885, -1.604089, 0.2196078, 1, 0, 1,
-0.4689142, 0.9576755, -1.864527, 0.2117647, 1, 0, 1,
-0.4672735, 1.063797, -0.3318191, 0.2078431, 1, 0, 1,
-0.4639563, 0.04516108, -0.2422478, 0.2, 1, 0, 1,
-0.4547011, 1.274186, -0.1276954, 0.1921569, 1, 0, 1,
-0.4546432, -0.3254715, -1.920213, 0.1882353, 1, 0, 1,
-0.4529559, 1.328615, -3.347924, 0.1803922, 1, 0, 1,
-0.4524838, 1.33124, -2.91074, 0.1764706, 1, 0, 1,
-0.4513772, 0.5947651, -2.004579, 0.1686275, 1, 0, 1,
-0.4481335, 0.1964693, -1.50334, 0.1647059, 1, 0, 1,
-0.4472523, 0.3394514, -0.1566647, 0.1568628, 1, 0, 1,
-0.4466529, -0.1053868, -1.539527, 0.1529412, 1, 0, 1,
-0.4430149, -0.5776281, -2.337884, 0.145098, 1, 0, 1,
-0.4405654, -1.893875, -3.086911, 0.1411765, 1, 0, 1,
-0.4318984, 1.450168, 0.4357063, 0.1333333, 1, 0, 1,
-0.4281244, 0.3155669, -2.006052, 0.1294118, 1, 0, 1,
-0.4222645, 0.5547901, -2.390877, 0.1215686, 1, 0, 1,
-0.4191975, 1.612337, -0.3169681, 0.1176471, 1, 0, 1,
-0.4169934, 0.567929, -0.4721384, 0.1098039, 1, 0, 1,
-0.4166088, 0.2914359, -1.320359, 0.1058824, 1, 0, 1,
-0.410659, -0.8949161, -3.741271, 0.09803922, 1, 0, 1,
-0.4092161, -1.466533, -2.812797, 0.09019608, 1, 0, 1,
-0.4080717, -2.22823, -1.151907, 0.08627451, 1, 0, 1,
-0.4052728, 0.1176627, -1.279651, 0.07843138, 1, 0, 1,
-0.4035571, -0.5162196, -1.413045, 0.07450981, 1, 0, 1,
-0.4015709, 0.3580823, -1.831921, 0.06666667, 1, 0, 1,
-0.4001111, 0.787319, -0.9157027, 0.0627451, 1, 0, 1,
-0.3982464, 1.68613, 0.3353984, 0.05490196, 1, 0, 1,
-0.38464, 0.1267871, -1.607804, 0.05098039, 1, 0, 1,
-0.3818452, -1.089353, -2.99474, 0.04313726, 1, 0, 1,
-0.3805763, -0.3725925, -2.05387, 0.03921569, 1, 0, 1,
-0.3798245, 1.349782, -1.256017, 0.03137255, 1, 0, 1,
-0.3793208, -3.065469, -2.473428, 0.02745098, 1, 0, 1,
-0.3786059, 0.09826409, -1.982643, 0.01960784, 1, 0, 1,
-0.3761291, 0.1438978, -4.506265, 0.01568628, 1, 0, 1,
-0.3744647, -0.3592417, -2.169302, 0.007843138, 1, 0, 1,
-0.3683227, -0.08428793, -2.460529, 0.003921569, 1, 0, 1,
-0.3659891, -1.397216, -4.133188, 0, 1, 0.003921569, 1,
-0.3644665, 0.4275172, 0.3227552, 0, 1, 0.01176471, 1,
-0.3592031, 1.810033, 2.876085, 0, 1, 0.01568628, 1,
-0.3587032, -1.024759, -4.362157, 0, 1, 0.02352941, 1,
-0.3579912, 1.075865, -0.7422223, 0, 1, 0.02745098, 1,
-0.3517908, 0.4529943, 0.03185316, 0, 1, 0.03529412, 1,
-0.3470287, 1.969259, -0.0727253, 0, 1, 0.03921569, 1,
-0.3468587, 0.4549304, -1.139285, 0, 1, 0.04705882, 1,
-0.3403033, 0.06137432, -0.9561755, 0, 1, 0.05098039, 1,
-0.3379965, -0.2393616, -0.6573193, 0, 1, 0.05882353, 1,
-0.3357294, -0.7614401, -3.460609, 0, 1, 0.0627451, 1,
-0.3336971, -2.13301, -2.29046, 0, 1, 0.07058824, 1,
-0.3332475, -0.1735613, -2.24756, 0, 1, 0.07450981, 1,
-0.333112, -0.0100663, -2.074804, 0, 1, 0.08235294, 1,
-0.3323298, -1.604039, -2.981962, 0, 1, 0.08627451, 1,
-0.3313138, 0.6143708, -1.608415, 0, 1, 0.09411765, 1,
-0.3296877, -1.274773, -3.674351, 0, 1, 0.1019608, 1,
-0.3267753, -0.6417532, -5.521238, 0, 1, 0.1058824, 1,
-0.3223391, -1.22743, -2.91459, 0, 1, 0.1137255, 1,
-0.3210425, 0.1348379, -1.966686, 0, 1, 0.1176471, 1,
-0.3188825, 0.7624271, -0.1435663, 0, 1, 0.1254902, 1,
-0.3153389, -2.55482, -2.002204, 0, 1, 0.1294118, 1,
-0.3150655, -0.5941725, -2.755558, 0, 1, 0.1372549, 1,
-0.306742, -1.848708, -1.822243, 0, 1, 0.1411765, 1,
-0.3050695, 0.798977, -0.5143219, 0, 1, 0.1490196, 1,
-0.3021246, 0.9116313, -0.6134495, 0, 1, 0.1529412, 1,
-0.3014633, -0.3498192, -2.901891, 0, 1, 0.1607843, 1,
-0.2990479, 0.7254543, -1.029517, 0, 1, 0.1647059, 1,
-0.291446, -2.023157, -2.550015, 0, 1, 0.172549, 1,
-0.2892508, -0.868816, -3.299396, 0, 1, 0.1764706, 1,
-0.2864181, -0.3227657, -0.8392845, 0, 1, 0.1843137, 1,
-0.2862378, 0.3163049, -0.7013283, 0, 1, 0.1882353, 1,
-0.2811768, 0.9296683, 0.5604997, 0, 1, 0.1960784, 1,
-0.2786407, -0.370827, -2.947661, 0, 1, 0.2039216, 1,
-0.2741392, 0.4985347, -1.957227, 0, 1, 0.2078431, 1,
-0.2731485, -0.4529876, -2.268609, 0, 1, 0.2156863, 1,
-0.273058, -1.220731, -1.722801, 0, 1, 0.2196078, 1,
-0.2698103, -0.5751972, -2.523922, 0, 1, 0.227451, 1,
-0.2589406, 0.1570648, -0.7839159, 0, 1, 0.2313726, 1,
-0.2575467, 0.333641, -0.09252378, 0, 1, 0.2392157, 1,
-0.2552651, 1.497327, -0.03960156, 0, 1, 0.2431373, 1,
-0.2508083, 0.3120155, -0.1109722, 0, 1, 0.2509804, 1,
-0.2442892, -0.03447549, -1.858859, 0, 1, 0.254902, 1,
-0.2374253, -0.1023772, -1.418111, 0, 1, 0.2627451, 1,
-0.2322647, -0.2371378, -2.609219, 0, 1, 0.2666667, 1,
-0.2318752, 0.2110296, -1.749986, 0, 1, 0.2745098, 1,
-0.2226417, 0.318993, 0.2588849, 0, 1, 0.2784314, 1,
-0.2144188, 0.3419665, -0.4219885, 0, 1, 0.2862745, 1,
-0.2060367, -0.1540484, -2.508689, 0, 1, 0.2901961, 1,
-0.2050693, -0.05658215, -2.048276, 0, 1, 0.2980392, 1,
-0.2007222, 0.5800734, -1.131066, 0, 1, 0.3058824, 1,
-0.1967991, 0.2971615, -0.5913712, 0, 1, 0.3098039, 1,
-0.1962249, 0.2135736, -0.0399585, 0, 1, 0.3176471, 1,
-0.1891318, 0.03894649, -0.6537834, 0, 1, 0.3215686, 1,
-0.1890549, 1.769725, 0.9613706, 0, 1, 0.3294118, 1,
-0.1858007, 0.4377636, -0.1967946, 0, 1, 0.3333333, 1,
-0.1827289, 0.3582121, -1.115026, 0, 1, 0.3411765, 1,
-0.1808043, 0.9260879, -1.343096, 0, 1, 0.345098, 1,
-0.1791194, 0.0632623, 0.1139146, 0, 1, 0.3529412, 1,
-0.1775868, 0.9394695, 0.4446781, 0, 1, 0.3568628, 1,
-0.1770947, 0.3468012, -0.1734166, 0, 1, 0.3647059, 1,
-0.1731377, -0.3409169, -4.509753, 0, 1, 0.3686275, 1,
-0.1728045, -0.6604835, -3.529273, 0, 1, 0.3764706, 1,
-0.1723535, 0.09566993, -2.414835, 0, 1, 0.3803922, 1,
-0.1714039, -1.799241, -1.976885, 0, 1, 0.3882353, 1,
-0.1710524, -1.442443, -3.693864, 0, 1, 0.3921569, 1,
-0.170133, -0.4542272, -2.202276, 0, 1, 0.4, 1,
-0.1701094, 2.167281, -1.797634, 0, 1, 0.4078431, 1,
-0.1686563, -0.889663, -3.395105, 0, 1, 0.4117647, 1,
-0.1674971, 0.7042353, -1.520223, 0, 1, 0.4196078, 1,
-0.1656793, 0.07850984, -1.834718, 0, 1, 0.4235294, 1,
-0.159633, -2.018194, -3.078471, 0, 1, 0.4313726, 1,
-0.1566835, -0.2565661, -3.667885, 0, 1, 0.4352941, 1,
-0.1555246, 1.842703, 0.5590734, 0, 1, 0.4431373, 1,
-0.1553346, 0.1038762, -1.664084, 0, 1, 0.4470588, 1,
-0.1475268, -0.2145744, -1.977059, 0, 1, 0.454902, 1,
-0.1474076, -1.107759, -3.394894, 0, 1, 0.4588235, 1,
-0.1433738, -1.244016, -1.905941, 0, 1, 0.4666667, 1,
-0.1432873, 2.140783, -0.46608, 0, 1, 0.4705882, 1,
-0.1407129, 1.006557, 1.02104, 0, 1, 0.4784314, 1,
-0.1391754, 0.3329678, -0.701285, 0, 1, 0.4823529, 1,
-0.1387262, 0.09223172, -1.501509, 0, 1, 0.4901961, 1,
-0.1367728, 2.408423, -1.497319, 0, 1, 0.4941176, 1,
-0.1347662, 0.5475367, 0.4780769, 0, 1, 0.5019608, 1,
-0.1330621, -0.3401226, -3.858277, 0, 1, 0.509804, 1,
-0.1316352, 0.4669995, -2.770011, 0, 1, 0.5137255, 1,
-0.1303587, -0.8516697, -2.407993, 0, 1, 0.5215687, 1,
-0.128938, 0.05935924, 0.5103179, 0, 1, 0.5254902, 1,
-0.1265473, -0.7697728, -5.211573, 0, 1, 0.5333334, 1,
-0.1264848, 0.1196318, -2.561393, 0, 1, 0.5372549, 1,
-0.1263901, -0.1454942, -1.714371, 0, 1, 0.5450981, 1,
-0.1260141, -0.5432355, -1.871298, 0, 1, 0.5490196, 1,
-0.1254726, 1.144694, -1.83971, 0, 1, 0.5568628, 1,
-0.1249894, 2.449574, -0.5673761, 0, 1, 0.5607843, 1,
-0.1241085, 1.544697, 2.626377, 0, 1, 0.5686275, 1,
-0.1187786, -0.5669198, -3.396747, 0, 1, 0.572549, 1,
-0.1164112, -0.3618949, -2.633814, 0, 1, 0.5803922, 1,
-0.1160738, 0.853322, -1.033117, 0, 1, 0.5843138, 1,
-0.1145617, 2.084617, -0.3463326, 0, 1, 0.5921569, 1,
-0.1138579, -0.5518636, -1.871838, 0, 1, 0.5960785, 1,
-0.1129801, -0.6239951, -0.976099, 0, 1, 0.6039216, 1,
-0.112641, -0.8210239, -3.55889, 0, 1, 0.6117647, 1,
-0.111015, -0.9062591, -2.064897, 0, 1, 0.6156863, 1,
-0.1049046, 0.06585187, 0.4446082, 0, 1, 0.6235294, 1,
-0.1045912, 0.1853344, 0.5379818, 0, 1, 0.627451, 1,
-0.1011697, -0.1401346, -2.432881, 0, 1, 0.6352941, 1,
-0.1004372, -0.4244262, -3.733608, 0, 1, 0.6392157, 1,
-0.1002743, 0.2068824, -1.131968, 0, 1, 0.6470588, 1,
-0.09686308, -0.6723977, -4.119925, 0, 1, 0.6509804, 1,
-0.08797389, 0.07516111, -0.7188774, 0, 1, 0.6588235, 1,
-0.08226036, 0.3266835, -0.1613256, 0, 1, 0.6627451, 1,
-0.08150318, 1.475084, -1.208357, 0, 1, 0.6705883, 1,
-0.08122481, 1.757625, 1.965879, 0, 1, 0.6745098, 1,
-0.07863959, 0.8453135, 0.05958582, 0, 1, 0.682353, 1,
-0.07656837, -0.2294955, -3.988239, 0, 1, 0.6862745, 1,
-0.07619922, 0.9678152, 0.578517, 0, 1, 0.6941177, 1,
-0.07485585, 0.002968706, -0.136616, 0, 1, 0.7019608, 1,
-0.07177513, 0.6464698, -1.30437, 0, 1, 0.7058824, 1,
-0.07113701, 2.606897, -1.367853, 0, 1, 0.7137255, 1,
-0.06972963, 0.1150855, 0.4083602, 0, 1, 0.7176471, 1,
-0.0665336, -0.2846961, -3.461333, 0, 1, 0.7254902, 1,
-0.06495578, 1.343807, 0.1048233, 0, 1, 0.7294118, 1,
-0.06464908, 1.596923, 2.073548, 0, 1, 0.7372549, 1,
-0.06327515, 0.6946589, -0.2912661, 0, 1, 0.7411765, 1,
-0.0630611, -1.255627, -2.466651, 0, 1, 0.7490196, 1,
-0.05901322, -1.654572, -2.487139, 0, 1, 0.7529412, 1,
-0.05489566, -1.357327, -1.661663, 0, 1, 0.7607843, 1,
-0.05129603, 1.163801, -1.23647, 0, 1, 0.7647059, 1,
-0.03719335, -0.2991583, -2.733299, 0, 1, 0.772549, 1,
-0.03519431, -1.505249, -3.924695, 0, 1, 0.7764706, 1,
-0.03504515, -0.8297889, -2.121355, 0, 1, 0.7843137, 1,
-0.03384341, -0.5126601, -2.720911, 0, 1, 0.7882353, 1,
-0.03261754, 0.8815309, 0.5380406, 0, 1, 0.7960784, 1,
-0.02997951, 0.9288887, -1.874127, 0, 1, 0.8039216, 1,
-0.02260482, -0.1302284, -2.84185, 0, 1, 0.8078431, 1,
-0.02147585, -0.7695895, -1.594174, 0, 1, 0.8156863, 1,
-0.01550875, 0.3435769, 0.6918334, 0, 1, 0.8196079, 1,
-0.01505596, 0.2992525, 0.9735581, 0, 1, 0.827451, 1,
-0.01456218, -3.234933, -2.222516, 0, 1, 0.8313726, 1,
-0.01440956, 0.9937181, 0.5422546, 0, 1, 0.8392157, 1,
-0.01165492, 0.321411, -0.6518919, 0, 1, 0.8431373, 1,
-0.01146491, -1.607307, -2.528951, 0, 1, 0.8509804, 1,
-0.009565082, 1.512422, 0.4522666, 0, 1, 0.854902, 1,
-0.009396173, 0.8275319, -0.04383828, 0, 1, 0.8627451, 1,
-0.008284032, 2.396159, 0.4925721, 0, 1, 0.8666667, 1,
-0.005418824, 1.318344, -0.5437434, 0, 1, 0.8745098, 1,
-0.0006076846, -0.1308, -2.007663, 0, 1, 0.8784314, 1,
0.00415007, -0.3568839, 3.909745, 0, 1, 0.8862745, 1,
0.009573577, -0.06143107, 3.457938, 0, 1, 0.8901961, 1,
0.01229021, 0.3376039, -1.138177, 0, 1, 0.8980392, 1,
0.01338098, 0.03285444, 0.2321949, 0, 1, 0.9058824, 1,
0.01676224, -0.2290074, 3.5392, 0, 1, 0.9098039, 1,
0.01689194, 0.3758442, 1.154294, 0, 1, 0.9176471, 1,
0.02146238, 0.8190027, 1.031338, 0, 1, 0.9215686, 1,
0.02147078, -1.057415, 3.903379, 0, 1, 0.9294118, 1,
0.02379274, -0.04153443, 3.741147, 0, 1, 0.9333333, 1,
0.02434479, 1.956951, 0.166161, 0, 1, 0.9411765, 1,
0.02991089, -0.3584996, 4.456934, 0, 1, 0.945098, 1,
0.03050221, -2.053531, 3.306506, 0, 1, 0.9529412, 1,
0.03145459, -1.159402, 4.608073, 0, 1, 0.9568627, 1,
0.03216496, 0.5782726, 1.221969, 0, 1, 0.9647059, 1,
0.04116058, 0.5070248, -1.223376, 0, 1, 0.9686275, 1,
0.04395663, 0.7671487, 0.1110922, 0, 1, 0.9764706, 1,
0.04496355, -1.185354, 2.469584, 0, 1, 0.9803922, 1,
0.04905091, -0.2453946, 2.883239, 0, 1, 0.9882353, 1,
0.05110709, 0.2405548, 0.4117094, 0, 1, 0.9921569, 1,
0.05393787, -0.7053421, 1.567299, 0, 1, 1, 1,
0.05542815, -0.5472193, 3.229086, 0, 0.9921569, 1, 1,
0.05704154, 1.103165, -0.3855348, 0, 0.9882353, 1, 1,
0.05735619, -0.2796783, 1.969852, 0, 0.9803922, 1, 1,
0.0603793, -0.7431292, 5.0337, 0, 0.9764706, 1, 1,
0.06516621, -0.9793662, 2.824623, 0, 0.9686275, 1, 1,
0.06626416, 1.282105, 1.22479, 0, 0.9647059, 1, 1,
0.06811926, -1.168514, 3.529302, 0, 0.9568627, 1, 1,
0.07450254, -1.0397, 1.799296, 0, 0.9529412, 1, 1,
0.07744957, 1.271276, 0.200662, 0, 0.945098, 1, 1,
0.07938825, 0.4591024, 0.2356388, 0, 0.9411765, 1, 1,
0.08005316, 1.367432, -0.5980309, 0, 0.9333333, 1, 1,
0.08098032, -1.138643, 4.98108, 0, 0.9294118, 1, 1,
0.08199777, -0.3377387, 2.131466, 0, 0.9215686, 1, 1,
0.08571601, 1.804745, -0.2271508, 0, 0.9176471, 1, 1,
0.09078741, 1.094302, -0.01490831, 0, 0.9098039, 1, 1,
0.09423909, -0.3851141, 2.365879, 0, 0.9058824, 1, 1,
0.09483266, -2.149913, 4.226154, 0, 0.8980392, 1, 1,
0.1003592, 0.2574817, -0.6965431, 0, 0.8901961, 1, 1,
0.1009452, 0.3121209, -0.09900007, 0, 0.8862745, 1, 1,
0.1041968, -0.8455839, 2.453928, 0, 0.8784314, 1, 1,
0.1050643, -2.196046, 4.269441, 0, 0.8745098, 1, 1,
0.105892, 0.4543272, -0.08100802, 0, 0.8666667, 1, 1,
0.1073338, -1.145963, 3.27046, 0, 0.8627451, 1, 1,
0.1080211, 0.4776842, 1.380694, 0, 0.854902, 1, 1,
0.109427, -1.157281, 2.692962, 0, 0.8509804, 1, 1,
0.1146334, -0.7443799, 3.386516, 0, 0.8431373, 1, 1,
0.1155193, 1.486734, -0.5984975, 0, 0.8392157, 1, 1,
0.1213477, -0.01490926, 1.717805, 0, 0.8313726, 1, 1,
0.1224616, 0.3776918, -0.5602911, 0, 0.827451, 1, 1,
0.1250361, 0.582628, -1.985361, 0, 0.8196079, 1, 1,
0.1286399, 0.3270081, 1.04966, 0, 0.8156863, 1, 1,
0.1310046, -0.3141217, 2.629072, 0, 0.8078431, 1, 1,
0.1340356, 0.7413034, 1.601045, 0, 0.8039216, 1, 1,
0.1345509, 0.08010518, 2.074779, 0, 0.7960784, 1, 1,
0.1377004, 1.173311, 0.4806022, 0, 0.7882353, 1, 1,
0.1379365, 0.2614178, 0.9073144, 0, 0.7843137, 1, 1,
0.1380334, 0.6746821, 2.880659, 0, 0.7764706, 1, 1,
0.1400242, 0.2362419, 0.667475, 0, 0.772549, 1, 1,
0.1401045, 0.8374056, -0.7140679, 0, 0.7647059, 1, 1,
0.1404763, -2.043523, 2.121013, 0, 0.7607843, 1, 1,
0.1431373, 0.6936113, -1.001975, 0, 0.7529412, 1, 1,
0.1441775, 0.7430007, 1.667654, 0, 0.7490196, 1, 1,
0.1448461, 0.2248878, 0.4587147, 0, 0.7411765, 1, 1,
0.1503606, -0.7126191, 1.741192, 0, 0.7372549, 1, 1,
0.1516532, -1.711233, 3.808026, 0, 0.7294118, 1, 1,
0.1555813, -0.7729422, 3.392954, 0, 0.7254902, 1, 1,
0.1583031, -0.8267457, 4.230208, 0, 0.7176471, 1, 1,
0.1603234, -0.5124813, 3.82806, 0, 0.7137255, 1, 1,
0.1612258, -0.08240122, 2.64697, 0, 0.7058824, 1, 1,
0.1626275, 0.3757263, 0.3970459, 0, 0.6980392, 1, 1,
0.164571, -1.195346, 2.904994, 0, 0.6941177, 1, 1,
0.1697835, 0.1687282, 1.52324, 0, 0.6862745, 1, 1,
0.1726279, -0.05070004, 2.60538, 0, 0.682353, 1, 1,
0.1743777, -0.3995182, 4.343507, 0, 0.6745098, 1, 1,
0.1745205, 0.3765993, -0.1098647, 0, 0.6705883, 1, 1,
0.1789874, -0.3003034, 2.194474, 0, 0.6627451, 1, 1,
0.1858469, 0.7542498, 1.214282, 0, 0.6588235, 1, 1,
0.1874935, -0.9188278, 2.392611, 0, 0.6509804, 1, 1,
0.190524, -0.280707, 3.275062, 0, 0.6470588, 1, 1,
0.1908389, 1.129172, -1.091395, 0, 0.6392157, 1, 1,
0.192605, -0.3411286, 0.8987095, 0, 0.6352941, 1, 1,
0.204858, -0.2227539, 2.218589, 0, 0.627451, 1, 1,
0.2054898, 1.435508, 0.2324936, 0, 0.6235294, 1, 1,
0.2102869, -1.706101, 2.847608, 0, 0.6156863, 1, 1,
0.2282685, -1.043793, 4.369321, 0, 0.6117647, 1, 1,
0.2283489, -0.5528718, 1.50105, 0, 0.6039216, 1, 1,
0.2331402, 0.4288479, 0.4001349, 0, 0.5960785, 1, 1,
0.2385063, -0.7020705, 3.60039, 0, 0.5921569, 1, 1,
0.240066, -0.3829659, 4.120555, 0, 0.5843138, 1, 1,
0.2411738, -0.2742135, 2.627372, 0, 0.5803922, 1, 1,
0.2419203, 1.238458, 0.4127881, 0, 0.572549, 1, 1,
0.2426941, 2.766474, 0.5879235, 0, 0.5686275, 1, 1,
0.2470627, 1.044411, 0.6623664, 0, 0.5607843, 1, 1,
0.2519, 0.06842264, 1.274826, 0, 0.5568628, 1, 1,
0.2526778, 0.5589437, 1.189948, 0, 0.5490196, 1, 1,
0.2531447, 0.5483654, -1.967926, 0, 0.5450981, 1, 1,
0.2537919, -0.1337508, 1.018061, 0, 0.5372549, 1, 1,
0.2542727, -0.5813096, 2.448673, 0, 0.5333334, 1, 1,
0.2563134, 0.05090971, 1.602209, 0, 0.5254902, 1, 1,
0.2603312, -0.468712, 2.844144, 0, 0.5215687, 1, 1,
0.2626736, 1.685478, -0.3234935, 0, 0.5137255, 1, 1,
0.2688093, 0.5384471, 0.599964, 0, 0.509804, 1, 1,
0.2734229, 1.2057, 0.05455447, 0, 0.5019608, 1, 1,
0.2767897, 0.3757653, 0.1580041, 0, 0.4941176, 1, 1,
0.2797644, -1.05052, 2.595263, 0, 0.4901961, 1, 1,
0.2814983, 1.393097, -1.037566, 0, 0.4823529, 1, 1,
0.2848237, -0.5978326, 3.353352, 0, 0.4784314, 1, 1,
0.2885289, 1.047644, 1.852383, 0, 0.4705882, 1, 1,
0.2969072, 0.6627319, 1.849795, 0, 0.4666667, 1, 1,
0.3004996, 2.071709, -1.283355, 0, 0.4588235, 1, 1,
0.3015545, -0.411217, 2.312068, 0, 0.454902, 1, 1,
0.301703, 0.5427895, 0.5296303, 0, 0.4470588, 1, 1,
0.3031439, -0.45815, 2.838485, 0, 0.4431373, 1, 1,
0.3143032, -1.197566, 1.061458, 0, 0.4352941, 1, 1,
0.3149727, -0.650644, 3.443019, 0, 0.4313726, 1, 1,
0.3169976, -1.461149, 3.884238, 0, 0.4235294, 1, 1,
0.3192829, 0.2372607, 0.1204036, 0, 0.4196078, 1, 1,
0.3228947, -1.290546, 3.063903, 0, 0.4117647, 1, 1,
0.3244767, 1.321555, -1.484102, 0, 0.4078431, 1, 1,
0.3314921, -2.643448, 3.695814, 0, 0.4, 1, 1,
0.3395186, 0.418939, 0.2921014, 0, 0.3921569, 1, 1,
0.3490909, 0.2269134, 1.960618, 0, 0.3882353, 1, 1,
0.3565379, -0.003919803, 0.2436533, 0, 0.3803922, 1, 1,
0.3603892, 0.03520072, 2.374378, 0, 0.3764706, 1, 1,
0.3613191, 0.221373, 0.8779895, 0, 0.3686275, 1, 1,
0.3615028, 0.4270764, 0.92421, 0, 0.3647059, 1, 1,
0.3681052, -0.6551277, 3.106942, 0, 0.3568628, 1, 1,
0.3703189, -0.7427691, 3.420414, 0, 0.3529412, 1, 1,
0.3731342, -0.8957759, 3.726469, 0, 0.345098, 1, 1,
0.3789494, 1.541108, -0.1337698, 0, 0.3411765, 1, 1,
0.381258, 1.447172, 1.226671, 0, 0.3333333, 1, 1,
0.3819861, 1.19528, -0.7918323, 0, 0.3294118, 1, 1,
0.3827532, 0.06235243, 1.159647, 0, 0.3215686, 1, 1,
0.3830163, -0.1538834, 1.853768, 0, 0.3176471, 1, 1,
0.3832271, -0.5861275, 0.7431008, 0, 0.3098039, 1, 1,
0.3935008, -0.4646175, 2.519199, 0, 0.3058824, 1, 1,
0.3985923, 1.74613, -0.5751154, 0, 0.2980392, 1, 1,
0.4006175, -0.04017564, 1.990397, 0, 0.2901961, 1, 1,
0.4027438, -0.3670464, 3.865674, 0, 0.2862745, 1, 1,
0.4039429, 0.1521247, 0.4719143, 0, 0.2784314, 1, 1,
0.4051554, 0.02992499, 1.128479, 0, 0.2745098, 1, 1,
0.405674, 0.3972013, 0.2913055, 0, 0.2666667, 1, 1,
0.4064034, 0.05135307, 1.540039, 0, 0.2627451, 1, 1,
0.4087135, 0.8815088, 0.777337, 0, 0.254902, 1, 1,
0.4099922, -0.5193717, 2.691055, 0, 0.2509804, 1, 1,
0.4127563, 0.6480353, -0.2471838, 0, 0.2431373, 1, 1,
0.4157501, -1.210937, 2.171354, 0, 0.2392157, 1, 1,
0.4234433, -1.132598, 2.491552, 0, 0.2313726, 1, 1,
0.4240878, -2.563707, 2.886852, 0, 0.227451, 1, 1,
0.4376715, -1.52544, 2.566506, 0, 0.2196078, 1, 1,
0.4427598, -0.6646224, 1.953668, 0, 0.2156863, 1, 1,
0.4427974, -0.08982748, 1.538679, 0, 0.2078431, 1, 1,
0.4441221, -0.9844781, 3.730234, 0, 0.2039216, 1, 1,
0.444623, 1.584573, 0.03819177, 0, 0.1960784, 1, 1,
0.4465495, 0.9272962, 2.061416, 0, 0.1882353, 1, 1,
0.4474416, -0.5561032, 1.935893, 0, 0.1843137, 1, 1,
0.4527149, -0.8305714, 3.131555, 0, 0.1764706, 1, 1,
0.4546354, 0.9171382, -0.3360785, 0, 0.172549, 1, 1,
0.4547277, 1.194985, -0.7450297, 0, 0.1647059, 1, 1,
0.4558754, -0.1625501, 1.872519, 0, 0.1607843, 1, 1,
0.4641666, 0.393347, 2.172222, 0, 0.1529412, 1, 1,
0.4642838, -0.2476181, 1.94517, 0, 0.1490196, 1, 1,
0.468747, -0.02502159, 0.4814, 0, 0.1411765, 1, 1,
0.4697387, 0.4742624, 1.530216, 0, 0.1372549, 1, 1,
0.4707772, 1.256994, -0.06369488, 0, 0.1294118, 1, 1,
0.4713753, 0.04066414, 2.911488, 0, 0.1254902, 1, 1,
0.4733024, 0.2367558, 1.126705, 0, 0.1176471, 1, 1,
0.4769883, -0.04244091, 1.88174, 0, 0.1137255, 1, 1,
0.4790271, 0.07042561, 3.126373, 0, 0.1058824, 1, 1,
0.4826978, -1.292175, 2.374405, 0, 0.09803922, 1, 1,
0.4855613, -0.1124046, 0.6841959, 0, 0.09411765, 1, 1,
0.4864086, -0.1410237, 1.587312, 0, 0.08627451, 1, 1,
0.4892334, 0.3174058, 0.4983854, 0, 0.08235294, 1, 1,
0.4902566, 0.7792146, 0.9900709, 0, 0.07450981, 1, 1,
0.4922189, -0.2781243, 2.622449, 0, 0.07058824, 1, 1,
0.4966341, 0.1251375, 1.008492, 0, 0.0627451, 1, 1,
0.4966883, 1.230383, 0.7562461, 0, 0.05882353, 1, 1,
0.4999731, 0.1289718, 0.3940157, 0, 0.05098039, 1, 1,
0.5010524, -1.657879, 3.066313, 0, 0.04705882, 1, 1,
0.5068755, -1.460807, 2.277049, 0, 0.03921569, 1, 1,
0.5120944, -0.1250194, 1.737887, 0, 0.03529412, 1, 1,
0.5145912, -1.766224, 4.663669, 0, 0.02745098, 1, 1,
0.5160344, 0.5258701, -0.6146502, 0, 0.02352941, 1, 1,
0.5180948, 0.3231581, 1.863081, 0, 0.01568628, 1, 1,
0.5196558, -0.7367865, 0.9020351, 0, 0.01176471, 1, 1,
0.5205876, 0.3315959, 0.7481098, 0, 0.003921569, 1, 1,
0.5208469, -0.5088465, 2.962394, 0.003921569, 0, 1, 1,
0.5212215, -0.6448086, 3.208724, 0.007843138, 0, 1, 1,
0.5214739, 0.5529001, -0.1642698, 0.01568628, 0, 1, 1,
0.5277592, 0.05483674, 1.351031, 0.01960784, 0, 1, 1,
0.5297799, -1.126557, 3.31247, 0.02745098, 0, 1, 1,
0.5299944, 1.06759, 1.903913, 0.03137255, 0, 1, 1,
0.5319448, 1.241601, -1.724752, 0.03921569, 0, 1, 1,
0.5333, -0.6280288, 1.648503, 0.04313726, 0, 1, 1,
0.5340909, 0.4735018, -0.7428046, 0.05098039, 0, 1, 1,
0.5350223, 0.6398769, 0.7828789, 0.05490196, 0, 1, 1,
0.5364362, 0.6766755, 1.276076, 0.0627451, 0, 1, 1,
0.537255, -0.7131895, 3.550957, 0.06666667, 0, 1, 1,
0.5380358, -0.1899812, -0.6712949, 0.07450981, 0, 1, 1,
0.543489, -0.9468244, 2.968543, 0.07843138, 0, 1, 1,
0.547035, 0.467469, 0.3515738, 0.08627451, 0, 1, 1,
0.5478354, -1.053061, 2.85491, 0.09019608, 0, 1, 1,
0.5565966, -1.053028, 2.021795, 0.09803922, 0, 1, 1,
0.5574832, 0.668906, 1.372462, 0.1058824, 0, 1, 1,
0.558682, 0.04235365, 1.558062, 0.1098039, 0, 1, 1,
0.5628819, -1.443316, 2.138844, 0.1176471, 0, 1, 1,
0.5632282, 0.6061135, 0.2979223, 0.1215686, 0, 1, 1,
0.5641617, -1.946013, 2.564904, 0.1294118, 0, 1, 1,
0.5709118, 0.367684, 0.7433522, 0.1333333, 0, 1, 1,
0.5716998, 0.4892615, 1.446482, 0.1411765, 0, 1, 1,
0.5799141, -0.8559083, 1.438626, 0.145098, 0, 1, 1,
0.5809669, 2.088908, 1.670974, 0.1529412, 0, 1, 1,
0.5912786, 1.197698, 0.08435126, 0.1568628, 0, 1, 1,
0.5950282, -0.6636688, 1.12399, 0.1647059, 0, 1, 1,
0.5982016, 0.3828191, 0.04722205, 0.1686275, 0, 1, 1,
0.5993825, 0.4184983, 1.882117, 0.1764706, 0, 1, 1,
0.6040974, 1.291046, 0.2620535, 0.1803922, 0, 1, 1,
0.6046279, -1.462772, 2.213628, 0.1882353, 0, 1, 1,
0.6079811, 0.2107971, 1.465919, 0.1921569, 0, 1, 1,
0.6117514, -1.197737, 4.425418, 0.2, 0, 1, 1,
0.6118115, 1.371614, -0.8088436, 0.2078431, 0, 1, 1,
0.6140433, -1.608863, 2.929693, 0.2117647, 0, 1, 1,
0.6162607, -0.1834306, 3.5975, 0.2196078, 0, 1, 1,
0.6175991, 0.6078891, -1.976686, 0.2235294, 0, 1, 1,
0.6202112, 0.6593324, 0.1645178, 0.2313726, 0, 1, 1,
0.6218317, -0.7429842, 0.3277438, 0.2352941, 0, 1, 1,
0.6282592, -1.431915, 3.819895, 0.2431373, 0, 1, 1,
0.6303965, 1.204233, 0.6974005, 0.2470588, 0, 1, 1,
0.6335033, 0.3288244, 0.04501941, 0.254902, 0, 1, 1,
0.6373952, 0.4513189, 0.7728358, 0.2588235, 0, 1, 1,
0.6375533, 1.107178, 0.9971763, 0.2666667, 0, 1, 1,
0.6403257, 0.4800584, -2.712059, 0.2705882, 0, 1, 1,
0.6418779, 0.6366138, -0.2152946, 0.2784314, 0, 1, 1,
0.6419671, 0.07086361, 2.036194, 0.282353, 0, 1, 1,
0.6461879, 0.9762552, 1.516049, 0.2901961, 0, 1, 1,
0.6529852, 0.03660999, 0.7665753, 0.2941177, 0, 1, 1,
0.6545057, -0.5346656, 3.165985, 0.3019608, 0, 1, 1,
0.6582363, 0.1265522, 1.255386, 0.3098039, 0, 1, 1,
0.6582693, -0.1132732, 0.2729325, 0.3137255, 0, 1, 1,
0.664041, 0.7262126, -0.00338681, 0.3215686, 0, 1, 1,
0.6645468, 0.2725544, 0.7184467, 0.3254902, 0, 1, 1,
0.6671728, -1.518492, 2.943119, 0.3333333, 0, 1, 1,
0.6680764, -0.9602922, 1.497777, 0.3372549, 0, 1, 1,
0.6701621, 1.665269, 0.8008739, 0.345098, 0, 1, 1,
0.6727612, 0.02933064, 1.702675, 0.3490196, 0, 1, 1,
0.6740933, 1.209475, 0.6613487, 0.3568628, 0, 1, 1,
0.6763538, -0.08789373, 1.731341, 0.3607843, 0, 1, 1,
0.6781192, -0.7403773, 2.769149, 0.3686275, 0, 1, 1,
0.6781867, -0.3392715, 2.445715, 0.372549, 0, 1, 1,
0.6801897, -1.257307, 3.759085, 0.3803922, 0, 1, 1,
0.6803697, 2.387278, -0.2692517, 0.3843137, 0, 1, 1,
0.6844263, 0.845481, 0.3702612, 0.3921569, 0, 1, 1,
0.6849881, -0.6045734, 3.860476, 0.3960784, 0, 1, 1,
0.685438, -0.7206637, 1.203909, 0.4039216, 0, 1, 1,
0.6865433, -0.2036555, 1.90282, 0.4117647, 0, 1, 1,
0.6896721, 3.038714, -1.416656, 0.4156863, 0, 1, 1,
0.6950379, -0.4617228, 3.641873, 0.4235294, 0, 1, 1,
0.69921, 0.6590768, 0.5844968, 0.427451, 0, 1, 1,
0.7034672, -0.9698337, 1.171358, 0.4352941, 0, 1, 1,
0.70376, 0.9994588, 0.3124633, 0.4392157, 0, 1, 1,
0.7050896, -1.739348, 3.086779, 0.4470588, 0, 1, 1,
0.7091753, -0.6113388, 3.081037, 0.4509804, 0, 1, 1,
0.7145087, -0.1275209, 1.932579, 0.4588235, 0, 1, 1,
0.7323676, -0.2110945, 0.9970518, 0.4627451, 0, 1, 1,
0.7395147, 0.8173943, -0.7509364, 0.4705882, 0, 1, 1,
0.7406816, 2.510482, 0.6219934, 0.4745098, 0, 1, 1,
0.7433048, -0.1654488, 1.186516, 0.4823529, 0, 1, 1,
0.7535189, -0.2264326, 0.7987007, 0.4862745, 0, 1, 1,
0.7542973, 0.1396973, -1.208056, 0.4941176, 0, 1, 1,
0.7569936, 0.1462752, 0.2990682, 0.5019608, 0, 1, 1,
0.7573863, -0.6558253, 2.30696, 0.5058824, 0, 1, 1,
0.7614704, 1.484583, 0.215133, 0.5137255, 0, 1, 1,
0.7626911, 0.01711001, -1.214312, 0.5176471, 0, 1, 1,
0.7659656, 0.3531184, 0.8237025, 0.5254902, 0, 1, 1,
0.7670819, 0.182115, 1.032825, 0.5294118, 0, 1, 1,
0.7692181, 1.629842, 0.986259, 0.5372549, 0, 1, 1,
0.7709067, -0.581488, 1.766018, 0.5411765, 0, 1, 1,
0.773503, -1.127881, 1.290912, 0.5490196, 0, 1, 1,
0.775824, -1.11196, -0.9212375, 0.5529412, 0, 1, 1,
0.787491, 0.991711, 1.288229, 0.5607843, 0, 1, 1,
0.7886076, -0.7583817, 4.033867, 0.5647059, 0, 1, 1,
0.7903575, -0.5199134, 2.472317, 0.572549, 0, 1, 1,
0.7915643, 0.636036, 1.536356, 0.5764706, 0, 1, 1,
0.7925094, 1.677008, 0.7454848, 0.5843138, 0, 1, 1,
0.7959869, 0.9432595, 0.6631233, 0.5882353, 0, 1, 1,
0.8013998, 0.1426383, 2.083192, 0.5960785, 0, 1, 1,
0.8020926, 0.2242017, 1.2942, 0.6039216, 0, 1, 1,
0.8073072, -0.04710168, 0.8570009, 0.6078432, 0, 1, 1,
0.8094454, 1.202331, 0.05445676, 0.6156863, 0, 1, 1,
0.8174126, 0.2770219, 2.158192, 0.6196079, 0, 1, 1,
0.8250297, -0.4889995, 1.535754, 0.627451, 0, 1, 1,
0.8278753, 1.339923, 0.2027264, 0.6313726, 0, 1, 1,
0.8365289, 1.860735, -0.08447298, 0.6392157, 0, 1, 1,
0.8386182, -0.6598888, 3.763818, 0.6431373, 0, 1, 1,
0.8407887, -0.5599148, 2.952276, 0.6509804, 0, 1, 1,
0.8486355, 0.92442, 0.5973729, 0.654902, 0, 1, 1,
0.8502037, 0.3367342, 1.851038, 0.6627451, 0, 1, 1,
0.8545076, -0.2027525, 2.253489, 0.6666667, 0, 1, 1,
0.8583305, 0.1864692, 0.8185703, 0.6745098, 0, 1, 1,
0.8619242, 1.405696, 0.8526007, 0.6784314, 0, 1, 1,
0.8633314, -0.1152946, 1.640225, 0.6862745, 0, 1, 1,
0.8673379, -1.307176, 2.091272, 0.6901961, 0, 1, 1,
0.8733318, 0.7474524, 2.148948, 0.6980392, 0, 1, 1,
0.8749171, 0.4691412, 2.348815, 0.7058824, 0, 1, 1,
0.8822737, -0.2413285, 0.2558848, 0.7098039, 0, 1, 1,
0.8849308, 0.1220969, 3.019872, 0.7176471, 0, 1, 1,
0.8865255, -1.268229, 1.783388, 0.7215686, 0, 1, 1,
0.8865503, -0.8076034, 1.457525, 0.7294118, 0, 1, 1,
0.888393, -1.057991, 2.098297, 0.7333333, 0, 1, 1,
0.89504, -0.6506411, 0.3780384, 0.7411765, 0, 1, 1,
0.8961539, 0.8458839, 0.7695327, 0.7450981, 0, 1, 1,
0.9034441, -0.1363969, 2.522793, 0.7529412, 0, 1, 1,
0.9050397, -0.08297227, 2.18741, 0.7568628, 0, 1, 1,
0.9065726, 0.6338586, -0.8281256, 0.7647059, 0, 1, 1,
0.9107806, -0.4404933, -0.05107349, 0.7686275, 0, 1, 1,
0.9135057, 1.297362, -1.23763, 0.7764706, 0, 1, 1,
0.9152564, 1.177428, 1.578631, 0.7803922, 0, 1, 1,
0.916829, -0.3499671, 3.233216, 0.7882353, 0, 1, 1,
0.9238592, -0.7584181, 0.2734726, 0.7921569, 0, 1, 1,
0.9305316, 1.905926, 0.9229354, 0.8, 0, 1, 1,
0.9367322, -0.003716397, 0.5704345, 0.8078431, 0, 1, 1,
0.9392355, 1.685522, 1.054619, 0.8117647, 0, 1, 1,
0.9401715, 0.5752153, 1.350873, 0.8196079, 0, 1, 1,
0.9416068, 1.053064, -0.03806363, 0.8235294, 0, 1, 1,
0.9531218, 0.01152172, 1.360993, 0.8313726, 0, 1, 1,
0.9589923, 0.3803712, 1.039586, 0.8352941, 0, 1, 1,
0.9605371, -0.1927845, 1.78758, 0.8431373, 0, 1, 1,
0.9617024, 0.5221952, 0.4438071, 0.8470588, 0, 1, 1,
0.96866, -0.8164429, 0.8230534, 0.854902, 0, 1, 1,
0.9711993, 0.2842138, 0.03385029, 0.8588235, 0, 1, 1,
0.9731451, 0.3018236, -0.001236666, 0.8666667, 0, 1, 1,
0.9828951, 0.7969806, 1.454127, 0.8705882, 0, 1, 1,
0.9868751, 0.2949525, 2.634638, 0.8784314, 0, 1, 1,
0.9884349, 0.1229797, -0.2088433, 0.8823529, 0, 1, 1,
0.994421, -0.8157803, 3.19541, 0.8901961, 0, 1, 1,
0.9964599, 1.87936, -1.115455, 0.8941177, 0, 1, 1,
1.004357, -1.594639, 2.819065, 0.9019608, 0, 1, 1,
1.017181, -2.546699, 2.506059, 0.9098039, 0, 1, 1,
1.018528, -0.7852092, 3.238407, 0.9137255, 0, 1, 1,
1.023902, 0.832017, 0.4435601, 0.9215686, 0, 1, 1,
1.024319, 0.00648466, 2.368417, 0.9254902, 0, 1, 1,
1.033319, 0.3512132, -0.348406, 0.9333333, 0, 1, 1,
1.042919, -2.679975, 3.554679, 0.9372549, 0, 1, 1,
1.043941, -0.691528, 0.8206341, 0.945098, 0, 1, 1,
1.04491, 0.03982082, 0.7116521, 0.9490196, 0, 1, 1,
1.053837, -0.9227498, 2.065202, 0.9568627, 0, 1, 1,
1.055659, 0.5798965, 1.975944, 0.9607843, 0, 1, 1,
1.059365, 0.8541345, 1.448298, 0.9686275, 0, 1, 1,
1.063088, 0.2371044, 0.027829, 0.972549, 0, 1, 1,
1.063488, -0.8505832, 2.011352, 0.9803922, 0, 1, 1,
1.064928, -0.4458381, 1.764419, 0.9843137, 0, 1, 1,
1.06986, -0.5781912, 2.85789, 0.9921569, 0, 1, 1,
1.071223, -1.194127, 2.088531, 0.9960784, 0, 1, 1,
1.072006, -0.4190009, 1.228793, 1, 0, 0.9960784, 1,
1.07296, 1.514205, 1.070343, 1, 0, 0.9882353, 1,
1.075483, -0.3956397, 2.673072, 1, 0, 0.9843137, 1,
1.075801, 1.355756, 0.04547875, 1, 0, 0.9764706, 1,
1.086523, -0.1201717, 2.780227, 1, 0, 0.972549, 1,
1.092536, -0.3777129, 1.78406, 1, 0, 0.9647059, 1,
1.109197, 0.8885459, 1.815116, 1, 0, 0.9607843, 1,
1.114164, 0.4954187, 0.5049928, 1, 0, 0.9529412, 1,
1.116005, 0.8259043, 1.745211, 1, 0, 0.9490196, 1,
1.117628, 0.8317359, -0.1270083, 1, 0, 0.9411765, 1,
1.120617, -0.1305864, 2.602528, 1, 0, 0.9372549, 1,
1.125094, -1.255438, 2.671618, 1, 0, 0.9294118, 1,
1.12565, -0.8659992, 2.670004, 1, 0, 0.9254902, 1,
1.127118, -1.044516, 2.662573, 1, 0, 0.9176471, 1,
1.129746, 0.874936, 0.5213237, 1, 0, 0.9137255, 1,
1.131377, 1.096435, 1.113349, 1, 0, 0.9058824, 1,
1.133429, 1.230439, 0.4808429, 1, 0, 0.9019608, 1,
1.141139, -1.380608, 3.221717, 1, 0, 0.8941177, 1,
1.143313, 0.06106617, 0.7259844, 1, 0, 0.8862745, 1,
1.143784, 0.6566246, -0.2926611, 1, 0, 0.8823529, 1,
1.147102, 0.1965363, 0.5976195, 1, 0, 0.8745098, 1,
1.157908, -0.6096932, 1.409522, 1, 0, 0.8705882, 1,
1.167715, -1.052214, 3.533452, 1, 0, 0.8627451, 1,
1.175772, 0.3534185, 0.9492553, 1, 0, 0.8588235, 1,
1.176533, -0.9191448, 2.294373, 1, 0, 0.8509804, 1,
1.177442, 1.045285, 2.073221, 1, 0, 0.8470588, 1,
1.17747, 1.246963, 1.357809, 1, 0, 0.8392157, 1,
1.177909, -0.3756509, 2.155327, 1, 0, 0.8352941, 1,
1.178905, -0.4048584, -0.07027154, 1, 0, 0.827451, 1,
1.179434, -1.498262, 3.488815, 1, 0, 0.8235294, 1,
1.179793, 2.794068, 0.7565249, 1, 0, 0.8156863, 1,
1.180869, -1.546113, 3.929171, 1, 0, 0.8117647, 1,
1.184106, -1.3875, 2.072479, 1, 0, 0.8039216, 1,
1.185747, 0.7819361, 1.661295, 1, 0, 0.7960784, 1,
1.186429, 0.965767, -1.068462, 1, 0, 0.7921569, 1,
1.187191, 0.4836126, 1.78425, 1, 0, 0.7843137, 1,
1.188406, 0.1659797, 0.7589658, 1, 0, 0.7803922, 1,
1.193313, -0.9566643, 0.50381, 1, 0, 0.772549, 1,
1.194319, 0.8767311, 1.471635, 1, 0, 0.7686275, 1,
1.199732, 0.651293, -0.02334355, 1, 0, 0.7607843, 1,
1.205642, -0.1202478, 2.571986, 1, 0, 0.7568628, 1,
1.212186, 0.4096453, 1.505154, 1, 0, 0.7490196, 1,
1.221472, 1.254326, -0.1825132, 1, 0, 0.7450981, 1,
1.225335, 0.3251343, 2.248254, 1, 0, 0.7372549, 1,
1.226028, -1.68735, 3.227952, 1, 0, 0.7333333, 1,
1.228879, 1.048573, 1.206857, 1, 0, 0.7254902, 1,
1.240228, 1.873169, -0.7198812, 1, 0, 0.7215686, 1,
1.241313, -0.182921, 2.742687, 1, 0, 0.7137255, 1,
1.242538, -0.6241922, 1.532346, 1, 0, 0.7098039, 1,
1.248808, 1.860558, 1.384777, 1, 0, 0.7019608, 1,
1.250795, -0.18135, 1.718512, 1, 0, 0.6941177, 1,
1.255139, 0.8991493, 0.7086352, 1, 0, 0.6901961, 1,
1.262396, -0.6800551, 2.770827, 1, 0, 0.682353, 1,
1.266888, 0.9407462, 0.347657, 1, 0, 0.6784314, 1,
1.268906, -1.349438, 2.845624, 1, 0, 0.6705883, 1,
1.269081, 0.4624137, 1.026488, 1, 0, 0.6666667, 1,
1.274806, 0.1452341, 1.636209, 1, 0, 0.6588235, 1,
1.277113, 1.030575, 1.566392, 1, 0, 0.654902, 1,
1.286294, 1.551959, -0.01176457, 1, 0, 0.6470588, 1,
1.29255, -0.1492732, 3.427909, 1, 0, 0.6431373, 1,
1.294914, 0.130193, 2.105977, 1, 0, 0.6352941, 1,
1.306046, -0.4882707, 2.745625, 1, 0, 0.6313726, 1,
1.327827, 0.9473817, 1.860316, 1, 0, 0.6235294, 1,
1.336894, -1.439177, 1.661344, 1, 0, 0.6196079, 1,
1.341911, 0.690663, 0.619827, 1, 0, 0.6117647, 1,
1.353502, 1.925936, 0.6353478, 1, 0, 0.6078432, 1,
1.364977, 1.220785, 2.455085, 1, 0, 0.6, 1,
1.370983, -0.6239561, 2.67433, 1, 0, 0.5921569, 1,
1.38007, 0.2651223, 1.577772, 1, 0, 0.5882353, 1,
1.384073, 0.354986, 0.04301903, 1, 0, 0.5803922, 1,
1.394809, -1.011492, 0.3751014, 1, 0, 0.5764706, 1,
1.420595, -0.4899436, 1.608996, 1, 0, 0.5686275, 1,
1.42495, 0.3408383, -0.6332946, 1, 0, 0.5647059, 1,
1.435256, -0.5717766, 2.644259, 1, 0, 0.5568628, 1,
1.446303, 0.8474241, -1.308416, 1, 0, 0.5529412, 1,
1.449594, -0.4668445, 1.877006, 1, 0, 0.5450981, 1,
1.451678, 0.8121743, 2.081988, 1, 0, 0.5411765, 1,
1.455879, 0.1455267, -0.2810379, 1, 0, 0.5333334, 1,
1.466653, -1.327943, 2.410127, 1, 0, 0.5294118, 1,
1.472528, -0.6715978, 1.97523, 1, 0, 0.5215687, 1,
1.472585, -0.7876928, 1.223713, 1, 0, 0.5176471, 1,
1.476463, -0.6000381, 3.061766, 1, 0, 0.509804, 1,
1.49658, 0.153994, 0.5897326, 1, 0, 0.5058824, 1,
1.497603, 2.386975, 1.042266, 1, 0, 0.4980392, 1,
1.506441, 0.653179, 0.8538839, 1, 0, 0.4901961, 1,
1.506448, 0.8500964, -0.3980588, 1, 0, 0.4862745, 1,
1.51579, 0.6067071, 2.18297, 1, 0, 0.4784314, 1,
1.534443, -1.420931, 3.130733, 1, 0, 0.4745098, 1,
1.549566, 0.4704368, 0.5179999, 1, 0, 0.4666667, 1,
1.553225, 2.403259, 0.4705806, 1, 0, 0.4627451, 1,
1.554697, 2.051896, -0.2756029, 1, 0, 0.454902, 1,
1.558788, -2.024165, 1.483626, 1, 0, 0.4509804, 1,
1.566412, 1.257686, 1.080667, 1, 0, 0.4431373, 1,
1.567047, 0.5776742, 0.3328862, 1, 0, 0.4392157, 1,
1.568118, 0.1093778, 1.77233, 1, 0, 0.4313726, 1,
1.569393, 0.8191973, 3.222094, 1, 0, 0.427451, 1,
1.574235, -0.02644681, 0.2847138, 1, 0, 0.4196078, 1,
1.585027, 0.1584244, 1.297937, 1, 0, 0.4156863, 1,
1.586648, -0.2296257, 3.334987, 1, 0, 0.4078431, 1,
1.597314, -0.468315, 1.916765, 1, 0, 0.4039216, 1,
1.604781, 0.3342998, 1.2671, 1, 0, 0.3960784, 1,
1.617316, -0.03065691, 0.5546796, 1, 0, 0.3882353, 1,
1.664904, 1.03399, 0.4727337, 1, 0, 0.3843137, 1,
1.670588, 1.421329, 0.3940656, 1, 0, 0.3764706, 1,
1.696016, -0.1221512, 2.313437, 1, 0, 0.372549, 1,
1.696215, 1.01746, 1.024338, 1, 0, 0.3647059, 1,
1.696751, 0.2534091, 0.9176213, 1, 0, 0.3607843, 1,
1.697955, -0.1117177, 1.904959, 1, 0, 0.3529412, 1,
1.702684, 0.1322618, 3.399026, 1, 0, 0.3490196, 1,
1.703528, -1.274411, 1.720317, 1, 0, 0.3411765, 1,
1.70643, -2.724193, 3.143733, 1, 0, 0.3372549, 1,
1.714305, 1.703945, 0.8935074, 1, 0, 0.3294118, 1,
1.714894, 0.5075735, 1.700679, 1, 0, 0.3254902, 1,
1.716977, 1.125469, 0.7177281, 1, 0, 0.3176471, 1,
1.720513, -0.3511389, 2.763654, 1, 0, 0.3137255, 1,
1.733242, 0.4567357, 1.091721, 1, 0, 0.3058824, 1,
1.747412, -0.1885928, 1.715232, 1, 0, 0.2980392, 1,
1.749797, -0.890876, 3.321094, 1, 0, 0.2941177, 1,
1.756124, 0.02652483, 2.435265, 1, 0, 0.2862745, 1,
1.774309, -2.27482, 1.690942, 1, 0, 0.282353, 1,
1.780219, -0.1590959, 2.125999, 1, 0, 0.2745098, 1,
1.78548, -0.8696693, 1.972689, 1, 0, 0.2705882, 1,
1.789464, -2.370682, 1.717691, 1, 0, 0.2627451, 1,
1.807014, 0.8792419, 0.1013086, 1, 0, 0.2588235, 1,
1.84038, 0.7658532, 1.209483, 1, 0, 0.2509804, 1,
1.847322, -0.3153501, 0.5222225, 1, 0, 0.2470588, 1,
1.849447, 0.4420952, 1.628163, 1, 0, 0.2392157, 1,
1.849641, -0.3517866, 0.1476889, 1, 0, 0.2352941, 1,
1.850869, 0.03157516, -0.5311848, 1, 0, 0.227451, 1,
1.851231, -1.802179, 3.526623, 1, 0, 0.2235294, 1,
1.860452, -2.102244, 2.058784, 1, 0, 0.2156863, 1,
1.873451, 1.686548, 1.791346, 1, 0, 0.2117647, 1,
1.879063, -0.2736401, 0.613834, 1, 0, 0.2039216, 1,
1.903908, -0.2840191, 1.87094, 1, 0, 0.1960784, 1,
1.906609, 0.4986816, -0.1980702, 1, 0, 0.1921569, 1,
1.909485, -0.3168048, 3.222205, 1, 0, 0.1843137, 1,
1.928961, -1.280189, 2.127089, 1, 0, 0.1803922, 1,
1.936378, -1.371019, -0.5793508, 1, 0, 0.172549, 1,
1.940354, 1.081288, 1.619929, 1, 0, 0.1686275, 1,
1.956536, 0.4829163, 1.36335, 1, 0, 0.1607843, 1,
1.961066, -0.8922502, 3.336087, 1, 0, 0.1568628, 1,
1.967469, -0.04945985, 1.531034, 1, 0, 0.1490196, 1,
1.983802, -1.202113, 2.941808, 1, 0, 0.145098, 1,
1.988436, 0.3664204, -0.8869906, 1, 0, 0.1372549, 1,
2.002029, 0.2889692, 0.9257808, 1, 0, 0.1333333, 1,
2.027974, 1.218261, -0.1234332, 1, 0, 0.1254902, 1,
2.079244, -0.2452634, 1.998757, 1, 0, 0.1215686, 1,
2.089249, 1.132063, 1.275483, 1, 0, 0.1137255, 1,
2.166939, -0.1551501, 3.830151, 1, 0, 0.1098039, 1,
2.18092, -2.150264, 0.915571, 1, 0, 0.1019608, 1,
2.258647, -1.096624, 2.132195, 1, 0, 0.09411765, 1,
2.263613, 0.5372527, 2.571751, 1, 0, 0.09019608, 1,
2.269199, 0.09683187, 0.6599635, 1, 0, 0.08235294, 1,
2.290346, -0.04736171, 2.337766, 1, 0, 0.07843138, 1,
2.298377, 2.126039, -0.2141499, 1, 0, 0.07058824, 1,
2.302507, 1.044436, 2.033299, 1, 0, 0.06666667, 1,
2.304426, -0.4845241, 3.3331, 1, 0, 0.05882353, 1,
2.437113, 0.312475, 1.340712, 1, 0, 0.05490196, 1,
2.451041, 1.430347, 0.7221782, 1, 0, 0.04705882, 1,
2.48743, -0.6296061, 2.139783, 1, 0, 0.04313726, 1,
2.545267, 0.7609836, 1.46281, 1, 0, 0.03529412, 1,
2.673937, -0.02331243, 2.277341, 1, 0, 0.03137255, 1,
2.803856, 0.4897595, 1.929279, 1, 0, 0.02352941, 1,
2.807834, -0.1927143, 1.473797, 1, 0, 0.01960784, 1,
3.094451, 0.3214529, 2.891249, 1, 0, 0.01176471, 1,
3.115348, 0.02341983, 0.319062, 1, 0, 0.007843138, 1
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
0.1958165, -4.298316, -7.3103, 0, -0.5, 0.5, 0.5,
0.1958165, -4.298316, -7.3103, 1, -0.5, 0.5, 0.5,
0.1958165, -4.298316, -7.3103, 1, 1.5, 0.5, 0.5,
0.1958165, -4.298316, -7.3103, 0, 1.5, 0.5, 0.5
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
-3.713436, -0.0981096, -7.3103, 0, -0.5, 0.5, 0.5,
-3.713436, -0.0981096, -7.3103, 1, -0.5, 0.5, 0.5,
-3.713436, -0.0981096, -7.3103, 1, 1.5, 0.5, 0.5,
-3.713436, -0.0981096, -7.3103, 0, 1.5, 0.5, 0.5
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
-3.713436, -4.298316, -0.2437692, 0, -0.5, 0.5, 0.5,
-3.713436, -4.298316, -0.2437692, 1, -0.5, 0.5, 0.5,
-3.713436, -4.298316, -0.2437692, 1, 1.5, 0.5, 0.5,
-3.713436, -4.298316, -0.2437692, 0, 1.5, 0.5, 0.5
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
-2, -3.329038, -5.679563,
3, -3.329038, -5.679563,
-2, -3.329038, -5.679563,
-2, -3.490584, -5.951352,
-1, -3.329038, -5.679563,
-1, -3.490584, -5.951352,
0, -3.329038, -5.679563,
0, -3.490584, -5.951352,
1, -3.329038, -5.679563,
1, -3.490584, -5.951352,
2, -3.329038, -5.679563,
2, -3.490584, -5.951352,
3, -3.329038, -5.679563,
3, -3.490584, -5.951352
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
-2, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
-2, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
-2, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
-2, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5,
-1, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
-1, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
-1, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
-1, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5,
0, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
0, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
0, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
0, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5,
1, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
1, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
1, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
1, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5,
2, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
2, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
2, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
2, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5,
3, -3.813677, -6.494931, 0, -0.5, 0.5, 0.5,
3, -3.813677, -6.494931, 1, -0.5, 0.5, 0.5,
3, -3.813677, -6.494931, 1, 1.5, 0.5, 0.5,
3, -3.813677, -6.494931, 0, 1.5, 0.5, 0.5
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
-2.811301, -3, -5.679563,
-2.811301, 3, -5.679563,
-2.811301, -3, -5.679563,
-2.961657, -3, -5.951352,
-2.811301, -2, -5.679563,
-2.961657, -2, -5.951352,
-2.811301, -1, -5.679563,
-2.961657, -1, -5.951352,
-2.811301, 0, -5.679563,
-2.961657, 0, -5.951352,
-2.811301, 1, -5.679563,
-2.961657, 1, -5.951352,
-2.811301, 2, -5.679563,
-2.961657, 2, -5.951352,
-2.811301, 3, -5.679563,
-2.961657, 3, -5.951352
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
-3.262368, -3, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, -3, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, -3, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, -3, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, -2, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, -2, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, -2, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, -2, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, -1, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, -1, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, -1, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, -1, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, 0, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, 0, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, 0, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, 0, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, 1, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, 1, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, 1, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, 1, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, 2, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, 2, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, 2, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, 2, -6.494931, 0, 1.5, 0.5, 0.5,
-3.262368, 3, -6.494931, 0, -0.5, 0.5, 0.5,
-3.262368, 3, -6.494931, 1, -0.5, 0.5, 0.5,
-3.262368, 3, -6.494931, 1, 1.5, 0.5, 0.5,
-3.262368, 3, -6.494931, 0, 1.5, 0.5, 0.5
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
-2.811301, -3.329038, -4,
-2.811301, -3.329038, 4,
-2.811301, -3.329038, -4,
-2.961657, -3.490584, -4,
-2.811301, -3.329038, -2,
-2.961657, -3.490584, -2,
-2.811301, -3.329038, 0,
-2.961657, -3.490584, 0,
-2.811301, -3.329038, 2,
-2.961657, -3.490584, 2,
-2.811301, -3.329038, 4,
-2.961657, -3.490584, 4
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
-3.262368, -3.813677, -4, 0, -0.5, 0.5, 0.5,
-3.262368, -3.813677, -4, 1, -0.5, 0.5, 0.5,
-3.262368, -3.813677, -4, 1, 1.5, 0.5, 0.5,
-3.262368, -3.813677, -4, 0, 1.5, 0.5, 0.5,
-3.262368, -3.813677, -2, 0, -0.5, 0.5, 0.5,
-3.262368, -3.813677, -2, 1, -0.5, 0.5, 0.5,
-3.262368, -3.813677, -2, 1, 1.5, 0.5, 0.5,
-3.262368, -3.813677, -2, 0, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 0, 0, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 0, 1, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 0, 1, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 0, 0, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 2, 0, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 2, 1, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 2, 1, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 2, 0, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 4, 0, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 4, 1, -0.5, 0.5, 0.5,
-3.262368, -3.813677, 4, 1, 1.5, 0.5, 0.5,
-3.262368, -3.813677, 4, 0, 1.5, 0.5, 0.5
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
-2.811301, -3.329038, -5.679563,
-2.811301, 3.132818, -5.679563,
-2.811301, -3.329038, 5.192024,
-2.811301, 3.132818, 5.192024,
-2.811301, -3.329038, -5.679563,
-2.811301, -3.329038, 5.192024,
-2.811301, 3.132818, -5.679563,
-2.811301, 3.132818, 5.192024,
-2.811301, -3.329038, -5.679563,
3.202934, -3.329038, -5.679563,
-2.811301, -3.329038, 5.192024,
3.202934, -3.329038, 5.192024,
-2.811301, 3.132818, -5.679563,
3.202934, 3.132818, -5.679563,
-2.811301, 3.132818, 5.192024,
3.202934, 3.132818, 5.192024,
3.202934, -3.329038, -5.679563,
3.202934, 3.132818, -5.679563,
3.202934, -3.329038, 5.192024,
3.202934, 3.132818, 5.192024,
3.202934, -3.329038, -5.679563,
3.202934, -3.329038, 5.192024,
3.202934, 3.132818, -5.679563,
3.202934, 3.132818, 5.192024
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
var radius = 7.477978;
var distance = 33.27037;
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
mvMatrix.translate( -0.1958165, 0.0981096, 0.2437692 );
mvMatrix.scale( 1.344367, 1.251241, 0.7437127 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.27037);
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
chlorosulfamic_acid<-read.table("chlorosulfamic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorosulfamic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
```

```r
y<-chlorosulfamic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
```

```r
z<-chlorosulfamic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
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
-2.723715, -1.099177, -0.1247263, 0, 0, 1, 1, 1,
-2.710376, 1.898118, 0.5992753, 1, 0, 0, 1, 1,
-2.697455, 1.023562, -2.123794, 1, 0, 0, 1, 1,
-2.62921, -0.2557812, -0.4006913, 1, 0, 0, 1, 1,
-2.584524, -0.01927453, 0.7803465, 1, 0, 0, 1, 1,
-2.559407, 1.025378, -1.439298, 1, 0, 0, 1, 1,
-2.53143, -0.9741596, -0.6771489, 0, 0, 0, 1, 1,
-2.456671, -1.279008, -2.214863, 0, 0, 0, 1, 1,
-2.312124, 1.395107, 0.4586965, 0, 0, 0, 1, 1,
-2.253667, -0.4379852, -2.064667, 0, 0, 0, 1, 1,
-2.167661, 0.451966, -0.7899806, 0, 0, 0, 1, 1,
-2.124228, -1.42595, -1.954003, 0, 0, 0, 1, 1,
-2.116723, -1.082739, -1.562063, 0, 0, 0, 1, 1,
-2.101022, -1.479622, -1.114866, 1, 1, 1, 1, 1,
-2.087328, -0.854445, -3.112733, 1, 1, 1, 1, 1,
-2.08219, -0.4775871, -1.413712, 1, 1, 1, 1, 1,
-2.055754, 0.9859688, -1.130231, 1, 1, 1, 1, 1,
-2.053255, -0.3838312, -0.6266547, 1, 1, 1, 1, 1,
-2.010727, 0.1751366, -0.8013836, 1, 1, 1, 1, 1,
-2.005812, 0.04642699, -2.014631, 1, 1, 1, 1, 1,
-1.998475, -0.4541069, -1.748445, 1, 1, 1, 1, 1,
-1.981109, -1.357794, -1.161854, 1, 1, 1, 1, 1,
-1.963925, 0.5403365, -0.9460853, 1, 1, 1, 1, 1,
-1.91604, 1.712245, -1.559208, 1, 1, 1, 1, 1,
-1.865805, 0.3122221, -0.5280703, 1, 1, 1, 1, 1,
-1.804485, 0.3402636, -0.8683305, 1, 1, 1, 1, 1,
-1.803931, 0.488149, -0.3002786, 1, 1, 1, 1, 1,
-1.792815, 1.912564, -0.9606214, 1, 1, 1, 1, 1,
-1.754726, -0.2448993, -1.92784, 0, 0, 1, 1, 1,
-1.754248, 0.4529714, -0.2452084, 1, 0, 0, 1, 1,
-1.743785, -1.064983, -1.603111, 1, 0, 0, 1, 1,
-1.686674, 0.5885972, -0.01532462, 1, 0, 0, 1, 1,
-1.663364, -0.4750491, -0.8950353, 1, 0, 0, 1, 1,
-1.662107, 0.5947154, 0.6387635, 1, 0, 0, 1, 1,
-1.658909, -1.273015, -2.03478, 0, 0, 0, 1, 1,
-1.657416, 0.7545865, -2.159848, 0, 0, 0, 1, 1,
-1.64296, -0.9233963, -0.2647168, 0, 0, 0, 1, 1,
-1.628597, 1.853562, -0.8831768, 0, 0, 0, 1, 1,
-1.601091, -1.21856, -2.615895, 0, 0, 0, 1, 1,
-1.597868, 0.04571778, -2.862804, 0, 0, 0, 1, 1,
-1.589712, -0.2646871, -1.661411, 0, 0, 0, 1, 1,
-1.587024, 0.2144996, -0.8509754, 1, 1, 1, 1, 1,
-1.586424, 0.9440332, -2.00071, 1, 1, 1, 1, 1,
-1.577466, -0.009022023, -1.662277, 1, 1, 1, 1, 1,
-1.561937, 0.07812461, -2.685397, 1, 1, 1, 1, 1,
-1.561408, -0.3482073, -2.340379, 1, 1, 1, 1, 1,
-1.559686, -0.8578675, -3.484943, 1, 1, 1, 1, 1,
-1.558438, 0.5668316, -0.9323334, 1, 1, 1, 1, 1,
-1.548642, 0.1992651, -2.388542, 1, 1, 1, 1, 1,
-1.548196, -1.974419, -3.197106, 1, 1, 1, 1, 1,
-1.538813, -0.6114575, -0.8850286, 1, 1, 1, 1, 1,
-1.534959, 1.227586, -0.1524674, 1, 1, 1, 1, 1,
-1.531431, 0.4591991, -2.161232, 1, 1, 1, 1, 1,
-1.499569, -0.3667779, -3.911952, 1, 1, 1, 1, 1,
-1.487121, 0.8552707, -0.6430031, 1, 1, 1, 1, 1,
-1.486007, 1.156514, -2.036588, 1, 1, 1, 1, 1,
-1.484464, -0.5164617, -0.9596848, 0, 0, 1, 1, 1,
-1.471715, 0.99448, 0.280852, 1, 0, 0, 1, 1,
-1.471556, -0.9761612, -2.982153, 1, 0, 0, 1, 1,
-1.450599, -1.356724, -2.555902, 1, 0, 0, 1, 1,
-1.431564, -1.322257, -2.911939, 1, 0, 0, 1, 1,
-1.428526, -0.02864954, -0.3760355, 1, 0, 0, 1, 1,
-1.417257, 0.9752081, -1.802678, 0, 0, 0, 1, 1,
-1.4009, 0.9989747, -1.559104, 0, 0, 0, 1, 1,
-1.400061, 1.01965, -0.8871423, 0, 0, 0, 1, 1,
-1.395959, -0.5711107, -1.48184, 0, 0, 0, 1, 1,
-1.395061, -0.1420055, -3.731817, 0, 0, 0, 1, 1,
-1.391504, -0.6424621, -0.7572585, 0, 0, 0, 1, 1,
-1.384894, -1.362489, -1.187372, 0, 0, 0, 1, 1,
-1.38181, 0.4257454, -1.474369, 1, 1, 1, 1, 1,
-1.377809, -0.3786332, -2.15585, 1, 1, 1, 1, 1,
-1.375499, 0.5876025, -0.7505617, 1, 1, 1, 1, 1,
-1.370419, 1.681423, -0.5524558, 1, 1, 1, 1, 1,
-1.355686, 0.09981894, -2.322815, 1, 1, 1, 1, 1,
-1.352826, -0.1129389, -2.825511, 1, 1, 1, 1, 1,
-1.343975, -0.2399801, -2.494508, 1, 1, 1, 1, 1,
-1.343963, 0.5583863, 0.8432939, 1, 1, 1, 1, 1,
-1.343738, 0.5742725, -2.754322, 1, 1, 1, 1, 1,
-1.334457, 0.7906463, 0.06435599, 1, 1, 1, 1, 1,
-1.334336, -0.7569696, -2.719889, 1, 1, 1, 1, 1,
-1.333663, -0.001089963, -1.768106, 1, 1, 1, 1, 1,
-1.324038, -0.2703481, -0.702752, 1, 1, 1, 1, 1,
-1.323997, -1.245185, -2.669096, 1, 1, 1, 1, 1,
-1.312723, 0.2596262, -1.746113, 1, 1, 1, 1, 1,
-1.310463, 2.679287, -0.2347513, 0, 0, 1, 1, 1,
-1.29825, 1.672928, 0.7326974, 1, 0, 0, 1, 1,
-1.296018, 0.5102124, -0.7165648, 1, 0, 0, 1, 1,
-1.290733, -0.6790821, -0.1919201, 1, 0, 0, 1, 1,
-1.285728, 0.0279676, -1.474917, 1, 0, 0, 1, 1,
-1.281974, 1.113384, -0.5806991, 1, 0, 0, 1, 1,
-1.27338, 0.01495867, -2.574326, 0, 0, 0, 1, 1,
-1.26997, -1.377421, -2.587481, 0, 0, 0, 1, 1,
-1.265649, -0.3728553, -1.708769, 0, 0, 0, 1, 1,
-1.264146, -0.5058399, -1.952221, 0, 0, 0, 1, 1,
-1.243916, 0.008168685, -3.434017, 0, 0, 0, 1, 1,
-1.219782, 0.8156784, -2.302369, 0, 0, 0, 1, 1,
-1.218293, -1.385943, -2.124594, 0, 0, 0, 1, 1,
-1.216099, 1.491524, -0.1063369, 1, 1, 1, 1, 1,
-1.203961, -0.3748977, -0.8787478, 1, 1, 1, 1, 1,
-1.19261, -0.820637, -1.552284, 1, 1, 1, 1, 1,
-1.190149, -0.5016751, -1.485203, 1, 1, 1, 1, 1,
-1.182718, -0.1108149, -3.703601, 1, 1, 1, 1, 1,
-1.174022, -1.104289, -1.310618, 1, 1, 1, 1, 1,
-1.168045, -1.371052, -0.3470541, 1, 1, 1, 1, 1,
-1.167192, -0.02064685, -1.788149, 1, 1, 1, 1, 1,
-1.164615, 0.2315709, -0.9478652, 1, 1, 1, 1, 1,
-1.160182, 0.4607952, -1.449048, 1, 1, 1, 1, 1,
-1.153482, 0.06017911, -1.294076, 1, 1, 1, 1, 1,
-1.149627, 1.68543, -0.9484541, 1, 1, 1, 1, 1,
-1.148111, -0.001014433, -2.685949, 1, 1, 1, 1, 1,
-1.146823, 0.5782926, -1.78864, 1, 1, 1, 1, 1,
-1.142648, -1.259288, -1.450283, 1, 1, 1, 1, 1,
-1.142355, -1.073174, -2.341151, 0, 0, 1, 1, 1,
-1.137273, 0.8572369, 0.77371, 1, 0, 0, 1, 1,
-1.132796, -1.563343, -2.366987, 1, 0, 0, 1, 1,
-1.128779, -0.3179134, -0.8927118, 1, 0, 0, 1, 1,
-1.121806, -0.5387428, -3.075533, 1, 0, 0, 1, 1,
-1.117575, -0.503365, -0.2700134, 1, 0, 0, 1, 1,
-1.117322, -0.6508961, -3.848125, 0, 0, 0, 1, 1,
-1.113113, 0.3532302, 0.1082364, 0, 0, 0, 1, 1,
-1.107605, 0.7491918, 0.4020925, 0, 0, 0, 1, 1,
-1.105833, -1.163644, -2.335033, 0, 0, 0, 1, 1,
-1.104715, -0.3217111, -1.680596, 0, 0, 0, 1, 1,
-1.100879, 0.07718428, -1.403512, 0, 0, 0, 1, 1,
-1.097088, -0.2583494, -2.17112, 0, 0, 0, 1, 1,
-1.094576, 0.5029129, -0.8175524, 1, 1, 1, 1, 1,
-1.088608, 0.8228114, -2.37575, 1, 1, 1, 1, 1,
-1.087165, 0.3091067, -0.4145411, 1, 1, 1, 1, 1,
-1.083781, -1.21646, -2.278498, 1, 1, 1, 1, 1,
-1.080672, -0.3328885, -3.494243, 1, 1, 1, 1, 1,
-1.078569, -0.305905, -1.756525, 1, 1, 1, 1, 1,
-1.070017, -0.9483737, -3.10669, 1, 1, 1, 1, 1,
-1.038185, -0.9021075, -1.891294, 1, 1, 1, 1, 1,
-1.034252, -0.4718551, -4.182837, 1, 1, 1, 1, 1,
-1.025681, -0.7991803, -1.133114, 1, 1, 1, 1, 1,
-1.021832, 0.5858479, -0.2264244, 1, 1, 1, 1, 1,
-1.012269, -0.3947597, -0.3146845, 1, 1, 1, 1, 1,
-1.006896, 1.188668, 0.4624126, 1, 1, 1, 1, 1,
-1.001222, 0.4788406, -1.574206, 1, 1, 1, 1, 1,
-0.9998114, -0.09125179, -2.264664, 1, 1, 1, 1, 1,
-0.997535, -0.8895267, -2.147623, 0, 0, 1, 1, 1,
-0.9962516, 0.8123062, -0.416396, 1, 0, 0, 1, 1,
-0.9806235, -1.390997, -2.785108, 1, 0, 0, 1, 1,
-0.9772139, -0.2473326, -2.215967, 1, 0, 0, 1, 1,
-0.9767027, 0.02488871, -1.622622, 1, 0, 0, 1, 1,
-0.9725887, -0.6063538, -2.178585, 1, 0, 0, 1, 1,
-0.9677685, 0.6345707, -2.177549, 0, 0, 0, 1, 1,
-0.9667634, 0.4841234, -1.37588, 0, 0, 0, 1, 1,
-0.9618546, -1.237091, -0.9299599, 0, 0, 0, 1, 1,
-0.9591252, 0.3156698, -3.151684, 0, 0, 0, 1, 1,
-0.9572066, 0.784368, -2.676814, 0, 0, 0, 1, 1,
-0.9542376, -0.959127, -2.857961, 0, 0, 0, 1, 1,
-0.9357244, 1.481233, -0.01835205, 0, 0, 0, 1, 1,
-0.9329553, -0.7758737, -1.752195, 1, 1, 1, 1, 1,
-0.9243258, 1.564266, -1.772487, 1, 1, 1, 1, 1,
-0.9237873, -0.1109822, -0.762162, 1, 1, 1, 1, 1,
-0.9176506, -0.3600171, -1.141222, 1, 1, 1, 1, 1,
-0.9149145, -0.1156512, -1.371631, 1, 1, 1, 1, 1,
-0.9128578, 0.5494786, 0.02414877, 1, 1, 1, 1, 1,
-0.9069969, -0.6964802, -2.464286, 1, 1, 1, 1, 1,
-0.9033496, -2.111269, -2.382629, 1, 1, 1, 1, 1,
-0.9005558, -0.3643929, -3.160611, 1, 1, 1, 1, 1,
-0.8939357, -0.1494266, -1.759869, 1, 1, 1, 1, 1,
-0.8881228, -1.147286, -3.27926, 1, 1, 1, 1, 1,
-0.8870547, -2.599009, -3.188411, 1, 1, 1, 1, 1,
-0.8865571, -0.5530881, -3.026932, 1, 1, 1, 1, 1,
-0.883846, -1.102652, -0.7245423, 1, 1, 1, 1, 1,
-0.8828773, -1.45523, -2.030511, 1, 1, 1, 1, 1,
-0.8821722, -0.08395883, -2.791279, 0, 0, 1, 1, 1,
-0.8820765, -0.5139596, -1.11725, 1, 0, 0, 1, 1,
-0.8783103, -0.2121643, -2.478877, 1, 0, 0, 1, 1,
-0.8763694, -0.2292606, -1.94852, 1, 0, 0, 1, 1,
-0.8751647, -0.1599997, -1.582232, 1, 0, 0, 1, 1,
-0.8744138, -1.148549, -1.786842, 1, 0, 0, 1, 1,
-0.8742743, -0.01361267, -1.673518, 0, 0, 0, 1, 1,
-0.8716521, 0.7961954, 0.5466681, 0, 0, 0, 1, 1,
-0.869653, -1.096905, -2.991534, 0, 0, 0, 1, 1,
-0.8654934, -1.349265, -3.567466, 0, 0, 0, 1, 1,
-0.8621612, 1.197954, -0.9432355, 0, 0, 0, 1, 1,
-0.8605269, -1.171202, -1.410655, 0, 0, 0, 1, 1,
-0.8595693, 1.667897, 0.9213414, 0, 0, 0, 1, 1,
-0.854757, 1.029438, -0.6810558, 1, 1, 1, 1, 1,
-0.8444429, 0.2374343, 0.4431647, 1, 1, 1, 1, 1,
-0.8389705, 0.6707637, 0.3859947, 1, 1, 1, 1, 1,
-0.8346921, 0.3101016, 0.5770521, 1, 1, 1, 1, 1,
-0.8212813, -0.8372088, -3.586196, 1, 1, 1, 1, 1,
-0.8184021, 0.4410348, -2.538885, 1, 1, 1, 1, 1,
-0.8131726, -0.5378742, -3.26498, 1, 1, 1, 1, 1,
-0.8106433, -0.9489705, -0.3084938, 1, 1, 1, 1, 1,
-0.8059934, 0.8476303, -1.689166, 1, 1, 1, 1, 1,
-0.8008772, 2.027982, -0.2797711, 1, 1, 1, 1, 1,
-0.7977785, -0.2239584, -0.757964, 1, 1, 1, 1, 1,
-0.7904856, -1.791934, -1.725884, 1, 1, 1, 1, 1,
-0.7787511, -1.323255, -1.152601, 1, 1, 1, 1, 1,
-0.7694541, -1.09129, -2.296917, 1, 1, 1, 1, 1,
-0.7673854, -0.5360203, -0.3906634, 1, 1, 1, 1, 1,
-0.7654958, -0.6154319, -3.056012, 0, 0, 1, 1, 1,
-0.7616798, 1.065423, -1.799632, 1, 0, 0, 1, 1,
-0.7580029, 0.6901019, -1.799502, 1, 0, 0, 1, 1,
-0.7544612, -0.8255839, -2.650108, 1, 0, 0, 1, 1,
-0.7544252, -0.6775127, 0.7096691, 1, 0, 0, 1, 1,
-0.7543653, 1.27717, -2.379635, 1, 0, 0, 1, 1,
-0.7541619, -0.04137791, -2.793271, 0, 0, 0, 1, 1,
-0.7501813, -1.036582, -5.134109, 0, 0, 0, 1, 1,
-0.7392029, -0.3818128, -0.4999686, 0, 0, 0, 1, 1,
-0.7350761, -1.638271, -1.930062, 0, 0, 0, 1, 1,
-0.7333784, 0.915203, 0.2488309, 0, 0, 0, 1, 1,
-0.7323999, 0.0567364, -2.547158, 0, 0, 0, 1, 1,
-0.7290965, 0.513561, -0.7192529, 0, 0, 0, 1, 1,
-0.726714, 1.031456, -0.07744187, 1, 1, 1, 1, 1,
-0.7233908, 0.6379828, -0.681576, 1, 1, 1, 1, 1,
-0.7229357, 0.4479227, 0.4016835, 1, 1, 1, 1, 1,
-0.7223348, -0.5471433, -3.091175, 1, 1, 1, 1, 1,
-0.721116, 1.481138, -0.4188877, 1, 1, 1, 1, 1,
-0.718864, -1.055616, -0.9433395, 1, 1, 1, 1, 1,
-0.7162526, -0.6683887, -2.382426, 1, 1, 1, 1, 1,
-0.7148601, -0.4430815, -2.405298, 1, 1, 1, 1, 1,
-0.7137687, -0.3850927, -3.001155, 1, 1, 1, 1, 1,
-0.7128548, 0.2243497, -2.221696, 1, 1, 1, 1, 1,
-0.7054348, -0.08200946, -0.2065525, 1, 1, 1, 1, 1,
-0.7050872, 1.242204, -0.3696493, 1, 1, 1, 1, 1,
-0.6990393, -0.2928005, -2.237906, 1, 1, 1, 1, 1,
-0.6972073, -1.283158, -2.742443, 1, 1, 1, 1, 1,
-0.6906679, -1.094219, -3.248506, 1, 1, 1, 1, 1,
-0.6904463, 0.8137335, 0.06548579, 0, 0, 1, 1, 1,
-0.6836642, -1.107769, -1.864093, 1, 0, 0, 1, 1,
-0.6823497, 0.7643898, 0.4752139, 1, 0, 0, 1, 1,
-0.674822, -0.0702313, -2.81199, 1, 0, 0, 1, 1,
-0.6722807, 0.2140392, -3.727112, 1, 0, 0, 1, 1,
-0.6712999, 0.4854873, -1.73069, 1, 0, 0, 1, 1,
-0.6709761, 1.583884, -1.2683, 0, 0, 0, 1, 1,
-0.6695108, 0.05056523, -1.55838, 0, 0, 0, 1, 1,
-0.6693534, 1.461568, -1.698706, 0, 0, 0, 1, 1,
-0.6647378, 0.07421894, -0.4607832, 0, 0, 0, 1, 1,
-0.664595, -0.2524513, -2.891844, 0, 0, 0, 1, 1,
-0.6567335, 0.298008, -1.506167, 0, 0, 0, 1, 1,
-0.6539145, -1.849807, -4.077374, 0, 0, 0, 1, 1,
-0.6443364, -1.248847, -2.649538, 1, 1, 1, 1, 1,
-0.6426748, -0.3062196, -2.803527, 1, 1, 1, 1, 1,
-0.6407841, -0.8461565, -2.980732, 1, 1, 1, 1, 1,
-0.6401935, -0.0296363, -1.070414, 1, 1, 1, 1, 1,
-0.6304031, -0.03046288, -2.47805, 1, 1, 1, 1, 1,
-0.6283149, -0.1797464, -1.189217, 1, 1, 1, 1, 1,
-0.6227167, 0.2256313, -2.136754, 1, 1, 1, 1, 1,
-0.6215333, 2.120931, 0.2842745, 1, 1, 1, 1, 1,
-0.618692, -0.7168226, -3.214902, 1, 1, 1, 1, 1,
-0.6160169, -0.3431793, -2.373348, 1, 1, 1, 1, 1,
-0.6144149, 2.244575, -0.3191637, 1, 1, 1, 1, 1,
-0.6134599, 1.501621, 0.3781599, 1, 1, 1, 1, 1,
-0.6098225, -0.7920052, -2.942764, 1, 1, 1, 1, 1,
-0.6087797, -0.3285239, -2.700892, 1, 1, 1, 1, 1,
-0.6061171, 0.9019611, -0.371978, 1, 1, 1, 1, 1,
-0.6051586, -0.1358883, -0.1407361, 0, 0, 1, 1, 1,
-0.5994228, 1.146955, -0.9301554, 1, 0, 0, 1, 1,
-0.5992888, 0.5286826, -0.2412407, 1, 0, 0, 1, 1,
-0.5970894, -1.287751, -1.570107, 1, 0, 0, 1, 1,
-0.5945081, 1.080057, -0.2087162, 1, 0, 0, 1, 1,
-0.5917711, 0.93125, -0.6798367, 1, 0, 0, 1, 1,
-0.5867819, -0.1495623, -1.016295, 0, 0, 0, 1, 1,
-0.5846752, 1.486674, -1.795914, 0, 0, 0, 1, 1,
-0.5836154, 1.245089, -0.04878638, 0, 0, 0, 1, 1,
-0.5834941, -2.149765, -3.928626, 0, 0, 0, 1, 1,
-0.5832813, 0.1714043, -0.4682196, 0, 0, 0, 1, 1,
-0.5813769, -0.8820073, -1.288985, 0, 0, 0, 1, 1,
-0.5774575, -1.546491, -2.33582, 0, 0, 0, 1, 1,
-0.5699549, -1.689605, -2.433864, 1, 1, 1, 1, 1,
-0.5671244, -0.009437317, -1.332143, 1, 1, 1, 1, 1,
-0.5626466, 0.01533577, -0.8061954, 1, 1, 1, 1, 1,
-0.558283, 1.768348, -1.206059, 1, 1, 1, 1, 1,
-0.555249, -0.1641378, -2.659111, 1, 1, 1, 1, 1,
-0.5540054, 0.2699911, -1.94064, 1, 1, 1, 1, 1,
-0.5531672, -1.071583, -1.80667, 1, 1, 1, 1, 1,
-0.5400954, -0.8686631, -2.452614, 1, 1, 1, 1, 1,
-0.5345967, -0.09590051, -1.452347, 1, 1, 1, 1, 1,
-0.5338441, -0.6132836, -2.257489, 1, 1, 1, 1, 1,
-0.5279654, -0.6417813, -1.732252, 1, 1, 1, 1, 1,
-0.5243812, -0.2071342, -1.858879, 1, 1, 1, 1, 1,
-0.5240781, 2.102107, 0.9755532, 1, 1, 1, 1, 1,
-0.5185062, -1.021636, -3.123464, 1, 1, 1, 1, 1,
-0.5125964, -0.2549405, -1.539829, 1, 1, 1, 1, 1,
-0.5063728, -0.3055376, -2.483659, 0, 0, 1, 1, 1,
-0.4990037, -1.210492, -3.431819, 1, 0, 0, 1, 1,
-0.4980336, -0.4681417, -3.664292, 1, 0, 0, 1, 1,
-0.4975109, -1.204522, -3.113503, 1, 0, 0, 1, 1,
-0.4967279, -0.007426987, -2.157114, 1, 0, 0, 1, 1,
-0.496585, -0.08027382, -2.028193, 1, 0, 0, 1, 1,
-0.496117, -0.8530705, -1.163033, 0, 0, 0, 1, 1,
-0.4926745, 0.3524271, -0.1621076, 0, 0, 0, 1, 1,
-0.4906374, -1.7682, -2.112705, 0, 0, 0, 1, 1,
-0.487263, -0.3950626, -0.01721212, 0, 0, 0, 1, 1,
-0.4840716, 0.2032616, -1.183375, 0, 0, 0, 1, 1,
-0.4839446, 1.227606, 0.7080643, 0, 0, 0, 1, 1,
-0.4827758, -1.857669, -2.087061, 0, 0, 0, 1, 1,
-0.4813583, -0.6322343, -1.645514, 1, 1, 1, 1, 1,
-0.4753718, -0.6111698, -4.206614, 1, 1, 1, 1, 1,
-0.4752399, -0.02427814, -1.05269, 1, 1, 1, 1, 1,
-0.4719098, 0.2612854, 0.07160791, 1, 1, 1, 1, 1,
-0.4696311, 0.28885, -1.604089, 1, 1, 1, 1, 1,
-0.4689142, 0.9576755, -1.864527, 1, 1, 1, 1, 1,
-0.4672735, 1.063797, -0.3318191, 1, 1, 1, 1, 1,
-0.4639563, 0.04516108, -0.2422478, 1, 1, 1, 1, 1,
-0.4547011, 1.274186, -0.1276954, 1, 1, 1, 1, 1,
-0.4546432, -0.3254715, -1.920213, 1, 1, 1, 1, 1,
-0.4529559, 1.328615, -3.347924, 1, 1, 1, 1, 1,
-0.4524838, 1.33124, -2.91074, 1, 1, 1, 1, 1,
-0.4513772, 0.5947651, -2.004579, 1, 1, 1, 1, 1,
-0.4481335, 0.1964693, -1.50334, 1, 1, 1, 1, 1,
-0.4472523, 0.3394514, -0.1566647, 1, 1, 1, 1, 1,
-0.4466529, -0.1053868, -1.539527, 0, 0, 1, 1, 1,
-0.4430149, -0.5776281, -2.337884, 1, 0, 0, 1, 1,
-0.4405654, -1.893875, -3.086911, 1, 0, 0, 1, 1,
-0.4318984, 1.450168, 0.4357063, 1, 0, 0, 1, 1,
-0.4281244, 0.3155669, -2.006052, 1, 0, 0, 1, 1,
-0.4222645, 0.5547901, -2.390877, 1, 0, 0, 1, 1,
-0.4191975, 1.612337, -0.3169681, 0, 0, 0, 1, 1,
-0.4169934, 0.567929, -0.4721384, 0, 0, 0, 1, 1,
-0.4166088, 0.2914359, -1.320359, 0, 0, 0, 1, 1,
-0.410659, -0.8949161, -3.741271, 0, 0, 0, 1, 1,
-0.4092161, -1.466533, -2.812797, 0, 0, 0, 1, 1,
-0.4080717, -2.22823, -1.151907, 0, 0, 0, 1, 1,
-0.4052728, 0.1176627, -1.279651, 0, 0, 0, 1, 1,
-0.4035571, -0.5162196, -1.413045, 1, 1, 1, 1, 1,
-0.4015709, 0.3580823, -1.831921, 1, 1, 1, 1, 1,
-0.4001111, 0.787319, -0.9157027, 1, 1, 1, 1, 1,
-0.3982464, 1.68613, 0.3353984, 1, 1, 1, 1, 1,
-0.38464, 0.1267871, -1.607804, 1, 1, 1, 1, 1,
-0.3818452, -1.089353, -2.99474, 1, 1, 1, 1, 1,
-0.3805763, -0.3725925, -2.05387, 1, 1, 1, 1, 1,
-0.3798245, 1.349782, -1.256017, 1, 1, 1, 1, 1,
-0.3793208, -3.065469, -2.473428, 1, 1, 1, 1, 1,
-0.3786059, 0.09826409, -1.982643, 1, 1, 1, 1, 1,
-0.3761291, 0.1438978, -4.506265, 1, 1, 1, 1, 1,
-0.3744647, -0.3592417, -2.169302, 1, 1, 1, 1, 1,
-0.3683227, -0.08428793, -2.460529, 1, 1, 1, 1, 1,
-0.3659891, -1.397216, -4.133188, 1, 1, 1, 1, 1,
-0.3644665, 0.4275172, 0.3227552, 1, 1, 1, 1, 1,
-0.3592031, 1.810033, 2.876085, 0, 0, 1, 1, 1,
-0.3587032, -1.024759, -4.362157, 1, 0, 0, 1, 1,
-0.3579912, 1.075865, -0.7422223, 1, 0, 0, 1, 1,
-0.3517908, 0.4529943, 0.03185316, 1, 0, 0, 1, 1,
-0.3470287, 1.969259, -0.0727253, 1, 0, 0, 1, 1,
-0.3468587, 0.4549304, -1.139285, 1, 0, 0, 1, 1,
-0.3403033, 0.06137432, -0.9561755, 0, 0, 0, 1, 1,
-0.3379965, -0.2393616, -0.6573193, 0, 0, 0, 1, 1,
-0.3357294, -0.7614401, -3.460609, 0, 0, 0, 1, 1,
-0.3336971, -2.13301, -2.29046, 0, 0, 0, 1, 1,
-0.3332475, -0.1735613, -2.24756, 0, 0, 0, 1, 1,
-0.333112, -0.0100663, -2.074804, 0, 0, 0, 1, 1,
-0.3323298, -1.604039, -2.981962, 0, 0, 0, 1, 1,
-0.3313138, 0.6143708, -1.608415, 1, 1, 1, 1, 1,
-0.3296877, -1.274773, -3.674351, 1, 1, 1, 1, 1,
-0.3267753, -0.6417532, -5.521238, 1, 1, 1, 1, 1,
-0.3223391, -1.22743, -2.91459, 1, 1, 1, 1, 1,
-0.3210425, 0.1348379, -1.966686, 1, 1, 1, 1, 1,
-0.3188825, 0.7624271, -0.1435663, 1, 1, 1, 1, 1,
-0.3153389, -2.55482, -2.002204, 1, 1, 1, 1, 1,
-0.3150655, -0.5941725, -2.755558, 1, 1, 1, 1, 1,
-0.306742, -1.848708, -1.822243, 1, 1, 1, 1, 1,
-0.3050695, 0.798977, -0.5143219, 1, 1, 1, 1, 1,
-0.3021246, 0.9116313, -0.6134495, 1, 1, 1, 1, 1,
-0.3014633, -0.3498192, -2.901891, 1, 1, 1, 1, 1,
-0.2990479, 0.7254543, -1.029517, 1, 1, 1, 1, 1,
-0.291446, -2.023157, -2.550015, 1, 1, 1, 1, 1,
-0.2892508, -0.868816, -3.299396, 1, 1, 1, 1, 1,
-0.2864181, -0.3227657, -0.8392845, 0, 0, 1, 1, 1,
-0.2862378, 0.3163049, -0.7013283, 1, 0, 0, 1, 1,
-0.2811768, 0.9296683, 0.5604997, 1, 0, 0, 1, 1,
-0.2786407, -0.370827, -2.947661, 1, 0, 0, 1, 1,
-0.2741392, 0.4985347, -1.957227, 1, 0, 0, 1, 1,
-0.2731485, -0.4529876, -2.268609, 1, 0, 0, 1, 1,
-0.273058, -1.220731, -1.722801, 0, 0, 0, 1, 1,
-0.2698103, -0.5751972, -2.523922, 0, 0, 0, 1, 1,
-0.2589406, 0.1570648, -0.7839159, 0, 0, 0, 1, 1,
-0.2575467, 0.333641, -0.09252378, 0, 0, 0, 1, 1,
-0.2552651, 1.497327, -0.03960156, 0, 0, 0, 1, 1,
-0.2508083, 0.3120155, -0.1109722, 0, 0, 0, 1, 1,
-0.2442892, -0.03447549, -1.858859, 0, 0, 0, 1, 1,
-0.2374253, -0.1023772, -1.418111, 1, 1, 1, 1, 1,
-0.2322647, -0.2371378, -2.609219, 1, 1, 1, 1, 1,
-0.2318752, 0.2110296, -1.749986, 1, 1, 1, 1, 1,
-0.2226417, 0.318993, 0.2588849, 1, 1, 1, 1, 1,
-0.2144188, 0.3419665, -0.4219885, 1, 1, 1, 1, 1,
-0.2060367, -0.1540484, -2.508689, 1, 1, 1, 1, 1,
-0.2050693, -0.05658215, -2.048276, 1, 1, 1, 1, 1,
-0.2007222, 0.5800734, -1.131066, 1, 1, 1, 1, 1,
-0.1967991, 0.2971615, -0.5913712, 1, 1, 1, 1, 1,
-0.1962249, 0.2135736, -0.0399585, 1, 1, 1, 1, 1,
-0.1891318, 0.03894649, -0.6537834, 1, 1, 1, 1, 1,
-0.1890549, 1.769725, 0.9613706, 1, 1, 1, 1, 1,
-0.1858007, 0.4377636, -0.1967946, 1, 1, 1, 1, 1,
-0.1827289, 0.3582121, -1.115026, 1, 1, 1, 1, 1,
-0.1808043, 0.9260879, -1.343096, 1, 1, 1, 1, 1,
-0.1791194, 0.0632623, 0.1139146, 0, 0, 1, 1, 1,
-0.1775868, 0.9394695, 0.4446781, 1, 0, 0, 1, 1,
-0.1770947, 0.3468012, -0.1734166, 1, 0, 0, 1, 1,
-0.1731377, -0.3409169, -4.509753, 1, 0, 0, 1, 1,
-0.1728045, -0.6604835, -3.529273, 1, 0, 0, 1, 1,
-0.1723535, 0.09566993, -2.414835, 1, 0, 0, 1, 1,
-0.1714039, -1.799241, -1.976885, 0, 0, 0, 1, 1,
-0.1710524, -1.442443, -3.693864, 0, 0, 0, 1, 1,
-0.170133, -0.4542272, -2.202276, 0, 0, 0, 1, 1,
-0.1701094, 2.167281, -1.797634, 0, 0, 0, 1, 1,
-0.1686563, -0.889663, -3.395105, 0, 0, 0, 1, 1,
-0.1674971, 0.7042353, -1.520223, 0, 0, 0, 1, 1,
-0.1656793, 0.07850984, -1.834718, 0, 0, 0, 1, 1,
-0.159633, -2.018194, -3.078471, 1, 1, 1, 1, 1,
-0.1566835, -0.2565661, -3.667885, 1, 1, 1, 1, 1,
-0.1555246, 1.842703, 0.5590734, 1, 1, 1, 1, 1,
-0.1553346, 0.1038762, -1.664084, 1, 1, 1, 1, 1,
-0.1475268, -0.2145744, -1.977059, 1, 1, 1, 1, 1,
-0.1474076, -1.107759, -3.394894, 1, 1, 1, 1, 1,
-0.1433738, -1.244016, -1.905941, 1, 1, 1, 1, 1,
-0.1432873, 2.140783, -0.46608, 1, 1, 1, 1, 1,
-0.1407129, 1.006557, 1.02104, 1, 1, 1, 1, 1,
-0.1391754, 0.3329678, -0.701285, 1, 1, 1, 1, 1,
-0.1387262, 0.09223172, -1.501509, 1, 1, 1, 1, 1,
-0.1367728, 2.408423, -1.497319, 1, 1, 1, 1, 1,
-0.1347662, 0.5475367, 0.4780769, 1, 1, 1, 1, 1,
-0.1330621, -0.3401226, -3.858277, 1, 1, 1, 1, 1,
-0.1316352, 0.4669995, -2.770011, 1, 1, 1, 1, 1,
-0.1303587, -0.8516697, -2.407993, 0, 0, 1, 1, 1,
-0.128938, 0.05935924, 0.5103179, 1, 0, 0, 1, 1,
-0.1265473, -0.7697728, -5.211573, 1, 0, 0, 1, 1,
-0.1264848, 0.1196318, -2.561393, 1, 0, 0, 1, 1,
-0.1263901, -0.1454942, -1.714371, 1, 0, 0, 1, 1,
-0.1260141, -0.5432355, -1.871298, 1, 0, 0, 1, 1,
-0.1254726, 1.144694, -1.83971, 0, 0, 0, 1, 1,
-0.1249894, 2.449574, -0.5673761, 0, 0, 0, 1, 1,
-0.1241085, 1.544697, 2.626377, 0, 0, 0, 1, 1,
-0.1187786, -0.5669198, -3.396747, 0, 0, 0, 1, 1,
-0.1164112, -0.3618949, -2.633814, 0, 0, 0, 1, 1,
-0.1160738, 0.853322, -1.033117, 0, 0, 0, 1, 1,
-0.1145617, 2.084617, -0.3463326, 0, 0, 0, 1, 1,
-0.1138579, -0.5518636, -1.871838, 1, 1, 1, 1, 1,
-0.1129801, -0.6239951, -0.976099, 1, 1, 1, 1, 1,
-0.112641, -0.8210239, -3.55889, 1, 1, 1, 1, 1,
-0.111015, -0.9062591, -2.064897, 1, 1, 1, 1, 1,
-0.1049046, 0.06585187, 0.4446082, 1, 1, 1, 1, 1,
-0.1045912, 0.1853344, 0.5379818, 1, 1, 1, 1, 1,
-0.1011697, -0.1401346, -2.432881, 1, 1, 1, 1, 1,
-0.1004372, -0.4244262, -3.733608, 1, 1, 1, 1, 1,
-0.1002743, 0.2068824, -1.131968, 1, 1, 1, 1, 1,
-0.09686308, -0.6723977, -4.119925, 1, 1, 1, 1, 1,
-0.08797389, 0.07516111, -0.7188774, 1, 1, 1, 1, 1,
-0.08226036, 0.3266835, -0.1613256, 1, 1, 1, 1, 1,
-0.08150318, 1.475084, -1.208357, 1, 1, 1, 1, 1,
-0.08122481, 1.757625, 1.965879, 1, 1, 1, 1, 1,
-0.07863959, 0.8453135, 0.05958582, 1, 1, 1, 1, 1,
-0.07656837, -0.2294955, -3.988239, 0, 0, 1, 1, 1,
-0.07619922, 0.9678152, 0.578517, 1, 0, 0, 1, 1,
-0.07485585, 0.002968706, -0.136616, 1, 0, 0, 1, 1,
-0.07177513, 0.6464698, -1.30437, 1, 0, 0, 1, 1,
-0.07113701, 2.606897, -1.367853, 1, 0, 0, 1, 1,
-0.06972963, 0.1150855, 0.4083602, 1, 0, 0, 1, 1,
-0.0665336, -0.2846961, -3.461333, 0, 0, 0, 1, 1,
-0.06495578, 1.343807, 0.1048233, 0, 0, 0, 1, 1,
-0.06464908, 1.596923, 2.073548, 0, 0, 0, 1, 1,
-0.06327515, 0.6946589, -0.2912661, 0, 0, 0, 1, 1,
-0.0630611, -1.255627, -2.466651, 0, 0, 0, 1, 1,
-0.05901322, -1.654572, -2.487139, 0, 0, 0, 1, 1,
-0.05489566, -1.357327, -1.661663, 0, 0, 0, 1, 1,
-0.05129603, 1.163801, -1.23647, 1, 1, 1, 1, 1,
-0.03719335, -0.2991583, -2.733299, 1, 1, 1, 1, 1,
-0.03519431, -1.505249, -3.924695, 1, 1, 1, 1, 1,
-0.03504515, -0.8297889, -2.121355, 1, 1, 1, 1, 1,
-0.03384341, -0.5126601, -2.720911, 1, 1, 1, 1, 1,
-0.03261754, 0.8815309, 0.5380406, 1, 1, 1, 1, 1,
-0.02997951, 0.9288887, -1.874127, 1, 1, 1, 1, 1,
-0.02260482, -0.1302284, -2.84185, 1, 1, 1, 1, 1,
-0.02147585, -0.7695895, -1.594174, 1, 1, 1, 1, 1,
-0.01550875, 0.3435769, 0.6918334, 1, 1, 1, 1, 1,
-0.01505596, 0.2992525, 0.9735581, 1, 1, 1, 1, 1,
-0.01456218, -3.234933, -2.222516, 1, 1, 1, 1, 1,
-0.01440956, 0.9937181, 0.5422546, 1, 1, 1, 1, 1,
-0.01165492, 0.321411, -0.6518919, 1, 1, 1, 1, 1,
-0.01146491, -1.607307, -2.528951, 1, 1, 1, 1, 1,
-0.009565082, 1.512422, 0.4522666, 0, 0, 1, 1, 1,
-0.009396173, 0.8275319, -0.04383828, 1, 0, 0, 1, 1,
-0.008284032, 2.396159, 0.4925721, 1, 0, 0, 1, 1,
-0.005418824, 1.318344, -0.5437434, 1, 0, 0, 1, 1,
-0.0006076846, -0.1308, -2.007663, 1, 0, 0, 1, 1,
0.00415007, -0.3568839, 3.909745, 1, 0, 0, 1, 1,
0.009573577, -0.06143107, 3.457938, 0, 0, 0, 1, 1,
0.01229021, 0.3376039, -1.138177, 0, 0, 0, 1, 1,
0.01338098, 0.03285444, 0.2321949, 0, 0, 0, 1, 1,
0.01676224, -0.2290074, 3.5392, 0, 0, 0, 1, 1,
0.01689194, 0.3758442, 1.154294, 0, 0, 0, 1, 1,
0.02146238, 0.8190027, 1.031338, 0, 0, 0, 1, 1,
0.02147078, -1.057415, 3.903379, 0, 0, 0, 1, 1,
0.02379274, -0.04153443, 3.741147, 1, 1, 1, 1, 1,
0.02434479, 1.956951, 0.166161, 1, 1, 1, 1, 1,
0.02991089, -0.3584996, 4.456934, 1, 1, 1, 1, 1,
0.03050221, -2.053531, 3.306506, 1, 1, 1, 1, 1,
0.03145459, -1.159402, 4.608073, 1, 1, 1, 1, 1,
0.03216496, 0.5782726, 1.221969, 1, 1, 1, 1, 1,
0.04116058, 0.5070248, -1.223376, 1, 1, 1, 1, 1,
0.04395663, 0.7671487, 0.1110922, 1, 1, 1, 1, 1,
0.04496355, -1.185354, 2.469584, 1, 1, 1, 1, 1,
0.04905091, -0.2453946, 2.883239, 1, 1, 1, 1, 1,
0.05110709, 0.2405548, 0.4117094, 1, 1, 1, 1, 1,
0.05393787, -0.7053421, 1.567299, 1, 1, 1, 1, 1,
0.05542815, -0.5472193, 3.229086, 1, 1, 1, 1, 1,
0.05704154, 1.103165, -0.3855348, 1, 1, 1, 1, 1,
0.05735619, -0.2796783, 1.969852, 1, 1, 1, 1, 1,
0.0603793, -0.7431292, 5.0337, 0, 0, 1, 1, 1,
0.06516621, -0.9793662, 2.824623, 1, 0, 0, 1, 1,
0.06626416, 1.282105, 1.22479, 1, 0, 0, 1, 1,
0.06811926, -1.168514, 3.529302, 1, 0, 0, 1, 1,
0.07450254, -1.0397, 1.799296, 1, 0, 0, 1, 1,
0.07744957, 1.271276, 0.200662, 1, 0, 0, 1, 1,
0.07938825, 0.4591024, 0.2356388, 0, 0, 0, 1, 1,
0.08005316, 1.367432, -0.5980309, 0, 0, 0, 1, 1,
0.08098032, -1.138643, 4.98108, 0, 0, 0, 1, 1,
0.08199777, -0.3377387, 2.131466, 0, 0, 0, 1, 1,
0.08571601, 1.804745, -0.2271508, 0, 0, 0, 1, 1,
0.09078741, 1.094302, -0.01490831, 0, 0, 0, 1, 1,
0.09423909, -0.3851141, 2.365879, 0, 0, 0, 1, 1,
0.09483266, -2.149913, 4.226154, 1, 1, 1, 1, 1,
0.1003592, 0.2574817, -0.6965431, 1, 1, 1, 1, 1,
0.1009452, 0.3121209, -0.09900007, 1, 1, 1, 1, 1,
0.1041968, -0.8455839, 2.453928, 1, 1, 1, 1, 1,
0.1050643, -2.196046, 4.269441, 1, 1, 1, 1, 1,
0.105892, 0.4543272, -0.08100802, 1, 1, 1, 1, 1,
0.1073338, -1.145963, 3.27046, 1, 1, 1, 1, 1,
0.1080211, 0.4776842, 1.380694, 1, 1, 1, 1, 1,
0.109427, -1.157281, 2.692962, 1, 1, 1, 1, 1,
0.1146334, -0.7443799, 3.386516, 1, 1, 1, 1, 1,
0.1155193, 1.486734, -0.5984975, 1, 1, 1, 1, 1,
0.1213477, -0.01490926, 1.717805, 1, 1, 1, 1, 1,
0.1224616, 0.3776918, -0.5602911, 1, 1, 1, 1, 1,
0.1250361, 0.582628, -1.985361, 1, 1, 1, 1, 1,
0.1286399, 0.3270081, 1.04966, 1, 1, 1, 1, 1,
0.1310046, -0.3141217, 2.629072, 0, 0, 1, 1, 1,
0.1340356, 0.7413034, 1.601045, 1, 0, 0, 1, 1,
0.1345509, 0.08010518, 2.074779, 1, 0, 0, 1, 1,
0.1377004, 1.173311, 0.4806022, 1, 0, 0, 1, 1,
0.1379365, 0.2614178, 0.9073144, 1, 0, 0, 1, 1,
0.1380334, 0.6746821, 2.880659, 1, 0, 0, 1, 1,
0.1400242, 0.2362419, 0.667475, 0, 0, 0, 1, 1,
0.1401045, 0.8374056, -0.7140679, 0, 0, 0, 1, 1,
0.1404763, -2.043523, 2.121013, 0, 0, 0, 1, 1,
0.1431373, 0.6936113, -1.001975, 0, 0, 0, 1, 1,
0.1441775, 0.7430007, 1.667654, 0, 0, 0, 1, 1,
0.1448461, 0.2248878, 0.4587147, 0, 0, 0, 1, 1,
0.1503606, -0.7126191, 1.741192, 0, 0, 0, 1, 1,
0.1516532, -1.711233, 3.808026, 1, 1, 1, 1, 1,
0.1555813, -0.7729422, 3.392954, 1, 1, 1, 1, 1,
0.1583031, -0.8267457, 4.230208, 1, 1, 1, 1, 1,
0.1603234, -0.5124813, 3.82806, 1, 1, 1, 1, 1,
0.1612258, -0.08240122, 2.64697, 1, 1, 1, 1, 1,
0.1626275, 0.3757263, 0.3970459, 1, 1, 1, 1, 1,
0.164571, -1.195346, 2.904994, 1, 1, 1, 1, 1,
0.1697835, 0.1687282, 1.52324, 1, 1, 1, 1, 1,
0.1726279, -0.05070004, 2.60538, 1, 1, 1, 1, 1,
0.1743777, -0.3995182, 4.343507, 1, 1, 1, 1, 1,
0.1745205, 0.3765993, -0.1098647, 1, 1, 1, 1, 1,
0.1789874, -0.3003034, 2.194474, 1, 1, 1, 1, 1,
0.1858469, 0.7542498, 1.214282, 1, 1, 1, 1, 1,
0.1874935, -0.9188278, 2.392611, 1, 1, 1, 1, 1,
0.190524, -0.280707, 3.275062, 1, 1, 1, 1, 1,
0.1908389, 1.129172, -1.091395, 0, 0, 1, 1, 1,
0.192605, -0.3411286, 0.8987095, 1, 0, 0, 1, 1,
0.204858, -0.2227539, 2.218589, 1, 0, 0, 1, 1,
0.2054898, 1.435508, 0.2324936, 1, 0, 0, 1, 1,
0.2102869, -1.706101, 2.847608, 1, 0, 0, 1, 1,
0.2282685, -1.043793, 4.369321, 1, 0, 0, 1, 1,
0.2283489, -0.5528718, 1.50105, 0, 0, 0, 1, 1,
0.2331402, 0.4288479, 0.4001349, 0, 0, 0, 1, 1,
0.2385063, -0.7020705, 3.60039, 0, 0, 0, 1, 1,
0.240066, -0.3829659, 4.120555, 0, 0, 0, 1, 1,
0.2411738, -0.2742135, 2.627372, 0, 0, 0, 1, 1,
0.2419203, 1.238458, 0.4127881, 0, 0, 0, 1, 1,
0.2426941, 2.766474, 0.5879235, 0, 0, 0, 1, 1,
0.2470627, 1.044411, 0.6623664, 1, 1, 1, 1, 1,
0.2519, 0.06842264, 1.274826, 1, 1, 1, 1, 1,
0.2526778, 0.5589437, 1.189948, 1, 1, 1, 1, 1,
0.2531447, 0.5483654, -1.967926, 1, 1, 1, 1, 1,
0.2537919, -0.1337508, 1.018061, 1, 1, 1, 1, 1,
0.2542727, -0.5813096, 2.448673, 1, 1, 1, 1, 1,
0.2563134, 0.05090971, 1.602209, 1, 1, 1, 1, 1,
0.2603312, -0.468712, 2.844144, 1, 1, 1, 1, 1,
0.2626736, 1.685478, -0.3234935, 1, 1, 1, 1, 1,
0.2688093, 0.5384471, 0.599964, 1, 1, 1, 1, 1,
0.2734229, 1.2057, 0.05455447, 1, 1, 1, 1, 1,
0.2767897, 0.3757653, 0.1580041, 1, 1, 1, 1, 1,
0.2797644, -1.05052, 2.595263, 1, 1, 1, 1, 1,
0.2814983, 1.393097, -1.037566, 1, 1, 1, 1, 1,
0.2848237, -0.5978326, 3.353352, 1, 1, 1, 1, 1,
0.2885289, 1.047644, 1.852383, 0, 0, 1, 1, 1,
0.2969072, 0.6627319, 1.849795, 1, 0, 0, 1, 1,
0.3004996, 2.071709, -1.283355, 1, 0, 0, 1, 1,
0.3015545, -0.411217, 2.312068, 1, 0, 0, 1, 1,
0.301703, 0.5427895, 0.5296303, 1, 0, 0, 1, 1,
0.3031439, -0.45815, 2.838485, 1, 0, 0, 1, 1,
0.3143032, -1.197566, 1.061458, 0, 0, 0, 1, 1,
0.3149727, -0.650644, 3.443019, 0, 0, 0, 1, 1,
0.3169976, -1.461149, 3.884238, 0, 0, 0, 1, 1,
0.3192829, 0.2372607, 0.1204036, 0, 0, 0, 1, 1,
0.3228947, -1.290546, 3.063903, 0, 0, 0, 1, 1,
0.3244767, 1.321555, -1.484102, 0, 0, 0, 1, 1,
0.3314921, -2.643448, 3.695814, 0, 0, 0, 1, 1,
0.3395186, 0.418939, 0.2921014, 1, 1, 1, 1, 1,
0.3490909, 0.2269134, 1.960618, 1, 1, 1, 1, 1,
0.3565379, -0.003919803, 0.2436533, 1, 1, 1, 1, 1,
0.3603892, 0.03520072, 2.374378, 1, 1, 1, 1, 1,
0.3613191, 0.221373, 0.8779895, 1, 1, 1, 1, 1,
0.3615028, 0.4270764, 0.92421, 1, 1, 1, 1, 1,
0.3681052, -0.6551277, 3.106942, 1, 1, 1, 1, 1,
0.3703189, -0.7427691, 3.420414, 1, 1, 1, 1, 1,
0.3731342, -0.8957759, 3.726469, 1, 1, 1, 1, 1,
0.3789494, 1.541108, -0.1337698, 1, 1, 1, 1, 1,
0.381258, 1.447172, 1.226671, 1, 1, 1, 1, 1,
0.3819861, 1.19528, -0.7918323, 1, 1, 1, 1, 1,
0.3827532, 0.06235243, 1.159647, 1, 1, 1, 1, 1,
0.3830163, -0.1538834, 1.853768, 1, 1, 1, 1, 1,
0.3832271, -0.5861275, 0.7431008, 1, 1, 1, 1, 1,
0.3935008, -0.4646175, 2.519199, 0, 0, 1, 1, 1,
0.3985923, 1.74613, -0.5751154, 1, 0, 0, 1, 1,
0.4006175, -0.04017564, 1.990397, 1, 0, 0, 1, 1,
0.4027438, -0.3670464, 3.865674, 1, 0, 0, 1, 1,
0.4039429, 0.1521247, 0.4719143, 1, 0, 0, 1, 1,
0.4051554, 0.02992499, 1.128479, 1, 0, 0, 1, 1,
0.405674, 0.3972013, 0.2913055, 0, 0, 0, 1, 1,
0.4064034, 0.05135307, 1.540039, 0, 0, 0, 1, 1,
0.4087135, 0.8815088, 0.777337, 0, 0, 0, 1, 1,
0.4099922, -0.5193717, 2.691055, 0, 0, 0, 1, 1,
0.4127563, 0.6480353, -0.2471838, 0, 0, 0, 1, 1,
0.4157501, -1.210937, 2.171354, 0, 0, 0, 1, 1,
0.4234433, -1.132598, 2.491552, 0, 0, 0, 1, 1,
0.4240878, -2.563707, 2.886852, 1, 1, 1, 1, 1,
0.4376715, -1.52544, 2.566506, 1, 1, 1, 1, 1,
0.4427598, -0.6646224, 1.953668, 1, 1, 1, 1, 1,
0.4427974, -0.08982748, 1.538679, 1, 1, 1, 1, 1,
0.4441221, -0.9844781, 3.730234, 1, 1, 1, 1, 1,
0.444623, 1.584573, 0.03819177, 1, 1, 1, 1, 1,
0.4465495, 0.9272962, 2.061416, 1, 1, 1, 1, 1,
0.4474416, -0.5561032, 1.935893, 1, 1, 1, 1, 1,
0.4527149, -0.8305714, 3.131555, 1, 1, 1, 1, 1,
0.4546354, 0.9171382, -0.3360785, 1, 1, 1, 1, 1,
0.4547277, 1.194985, -0.7450297, 1, 1, 1, 1, 1,
0.4558754, -0.1625501, 1.872519, 1, 1, 1, 1, 1,
0.4641666, 0.393347, 2.172222, 1, 1, 1, 1, 1,
0.4642838, -0.2476181, 1.94517, 1, 1, 1, 1, 1,
0.468747, -0.02502159, 0.4814, 1, 1, 1, 1, 1,
0.4697387, 0.4742624, 1.530216, 0, 0, 1, 1, 1,
0.4707772, 1.256994, -0.06369488, 1, 0, 0, 1, 1,
0.4713753, 0.04066414, 2.911488, 1, 0, 0, 1, 1,
0.4733024, 0.2367558, 1.126705, 1, 0, 0, 1, 1,
0.4769883, -0.04244091, 1.88174, 1, 0, 0, 1, 1,
0.4790271, 0.07042561, 3.126373, 1, 0, 0, 1, 1,
0.4826978, -1.292175, 2.374405, 0, 0, 0, 1, 1,
0.4855613, -0.1124046, 0.6841959, 0, 0, 0, 1, 1,
0.4864086, -0.1410237, 1.587312, 0, 0, 0, 1, 1,
0.4892334, 0.3174058, 0.4983854, 0, 0, 0, 1, 1,
0.4902566, 0.7792146, 0.9900709, 0, 0, 0, 1, 1,
0.4922189, -0.2781243, 2.622449, 0, 0, 0, 1, 1,
0.4966341, 0.1251375, 1.008492, 0, 0, 0, 1, 1,
0.4966883, 1.230383, 0.7562461, 1, 1, 1, 1, 1,
0.4999731, 0.1289718, 0.3940157, 1, 1, 1, 1, 1,
0.5010524, -1.657879, 3.066313, 1, 1, 1, 1, 1,
0.5068755, -1.460807, 2.277049, 1, 1, 1, 1, 1,
0.5120944, -0.1250194, 1.737887, 1, 1, 1, 1, 1,
0.5145912, -1.766224, 4.663669, 1, 1, 1, 1, 1,
0.5160344, 0.5258701, -0.6146502, 1, 1, 1, 1, 1,
0.5180948, 0.3231581, 1.863081, 1, 1, 1, 1, 1,
0.5196558, -0.7367865, 0.9020351, 1, 1, 1, 1, 1,
0.5205876, 0.3315959, 0.7481098, 1, 1, 1, 1, 1,
0.5208469, -0.5088465, 2.962394, 1, 1, 1, 1, 1,
0.5212215, -0.6448086, 3.208724, 1, 1, 1, 1, 1,
0.5214739, 0.5529001, -0.1642698, 1, 1, 1, 1, 1,
0.5277592, 0.05483674, 1.351031, 1, 1, 1, 1, 1,
0.5297799, -1.126557, 3.31247, 1, 1, 1, 1, 1,
0.5299944, 1.06759, 1.903913, 0, 0, 1, 1, 1,
0.5319448, 1.241601, -1.724752, 1, 0, 0, 1, 1,
0.5333, -0.6280288, 1.648503, 1, 0, 0, 1, 1,
0.5340909, 0.4735018, -0.7428046, 1, 0, 0, 1, 1,
0.5350223, 0.6398769, 0.7828789, 1, 0, 0, 1, 1,
0.5364362, 0.6766755, 1.276076, 1, 0, 0, 1, 1,
0.537255, -0.7131895, 3.550957, 0, 0, 0, 1, 1,
0.5380358, -0.1899812, -0.6712949, 0, 0, 0, 1, 1,
0.543489, -0.9468244, 2.968543, 0, 0, 0, 1, 1,
0.547035, 0.467469, 0.3515738, 0, 0, 0, 1, 1,
0.5478354, -1.053061, 2.85491, 0, 0, 0, 1, 1,
0.5565966, -1.053028, 2.021795, 0, 0, 0, 1, 1,
0.5574832, 0.668906, 1.372462, 0, 0, 0, 1, 1,
0.558682, 0.04235365, 1.558062, 1, 1, 1, 1, 1,
0.5628819, -1.443316, 2.138844, 1, 1, 1, 1, 1,
0.5632282, 0.6061135, 0.2979223, 1, 1, 1, 1, 1,
0.5641617, -1.946013, 2.564904, 1, 1, 1, 1, 1,
0.5709118, 0.367684, 0.7433522, 1, 1, 1, 1, 1,
0.5716998, 0.4892615, 1.446482, 1, 1, 1, 1, 1,
0.5799141, -0.8559083, 1.438626, 1, 1, 1, 1, 1,
0.5809669, 2.088908, 1.670974, 1, 1, 1, 1, 1,
0.5912786, 1.197698, 0.08435126, 1, 1, 1, 1, 1,
0.5950282, -0.6636688, 1.12399, 1, 1, 1, 1, 1,
0.5982016, 0.3828191, 0.04722205, 1, 1, 1, 1, 1,
0.5993825, 0.4184983, 1.882117, 1, 1, 1, 1, 1,
0.6040974, 1.291046, 0.2620535, 1, 1, 1, 1, 1,
0.6046279, -1.462772, 2.213628, 1, 1, 1, 1, 1,
0.6079811, 0.2107971, 1.465919, 1, 1, 1, 1, 1,
0.6117514, -1.197737, 4.425418, 0, 0, 1, 1, 1,
0.6118115, 1.371614, -0.8088436, 1, 0, 0, 1, 1,
0.6140433, -1.608863, 2.929693, 1, 0, 0, 1, 1,
0.6162607, -0.1834306, 3.5975, 1, 0, 0, 1, 1,
0.6175991, 0.6078891, -1.976686, 1, 0, 0, 1, 1,
0.6202112, 0.6593324, 0.1645178, 1, 0, 0, 1, 1,
0.6218317, -0.7429842, 0.3277438, 0, 0, 0, 1, 1,
0.6282592, -1.431915, 3.819895, 0, 0, 0, 1, 1,
0.6303965, 1.204233, 0.6974005, 0, 0, 0, 1, 1,
0.6335033, 0.3288244, 0.04501941, 0, 0, 0, 1, 1,
0.6373952, 0.4513189, 0.7728358, 0, 0, 0, 1, 1,
0.6375533, 1.107178, 0.9971763, 0, 0, 0, 1, 1,
0.6403257, 0.4800584, -2.712059, 0, 0, 0, 1, 1,
0.6418779, 0.6366138, -0.2152946, 1, 1, 1, 1, 1,
0.6419671, 0.07086361, 2.036194, 1, 1, 1, 1, 1,
0.6461879, 0.9762552, 1.516049, 1, 1, 1, 1, 1,
0.6529852, 0.03660999, 0.7665753, 1, 1, 1, 1, 1,
0.6545057, -0.5346656, 3.165985, 1, 1, 1, 1, 1,
0.6582363, 0.1265522, 1.255386, 1, 1, 1, 1, 1,
0.6582693, -0.1132732, 0.2729325, 1, 1, 1, 1, 1,
0.664041, 0.7262126, -0.00338681, 1, 1, 1, 1, 1,
0.6645468, 0.2725544, 0.7184467, 1, 1, 1, 1, 1,
0.6671728, -1.518492, 2.943119, 1, 1, 1, 1, 1,
0.6680764, -0.9602922, 1.497777, 1, 1, 1, 1, 1,
0.6701621, 1.665269, 0.8008739, 1, 1, 1, 1, 1,
0.6727612, 0.02933064, 1.702675, 1, 1, 1, 1, 1,
0.6740933, 1.209475, 0.6613487, 1, 1, 1, 1, 1,
0.6763538, -0.08789373, 1.731341, 1, 1, 1, 1, 1,
0.6781192, -0.7403773, 2.769149, 0, 0, 1, 1, 1,
0.6781867, -0.3392715, 2.445715, 1, 0, 0, 1, 1,
0.6801897, -1.257307, 3.759085, 1, 0, 0, 1, 1,
0.6803697, 2.387278, -0.2692517, 1, 0, 0, 1, 1,
0.6844263, 0.845481, 0.3702612, 1, 0, 0, 1, 1,
0.6849881, -0.6045734, 3.860476, 1, 0, 0, 1, 1,
0.685438, -0.7206637, 1.203909, 0, 0, 0, 1, 1,
0.6865433, -0.2036555, 1.90282, 0, 0, 0, 1, 1,
0.6896721, 3.038714, -1.416656, 0, 0, 0, 1, 1,
0.6950379, -0.4617228, 3.641873, 0, 0, 0, 1, 1,
0.69921, 0.6590768, 0.5844968, 0, 0, 0, 1, 1,
0.7034672, -0.9698337, 1.171358, 0, 0, 0, 1, 1,
0.70376, 0.9994588, 0.3124633, 0, 0, 0, 1, 1,
0.7050896, -1.739348, 3.086779, 1, 1, 1, 1, 1,
0.7091753, -0.6113388, 3.081037, 1, 1, 1, 1, 1,
0.7145087, -0.1275209, 1.932579, 1, 1, 1, 1, 1,
0.7323676, -0.2110945, 0.9970518, 1, 1, 1, 1, 1,
0.7395147, 0.8173943, -0.7509364, 1, 1, 1, 1, 1,
0.7406816, 2.510482, 0.6219934, 1, 1, 1, 1, 1,
0.7433048, -0.1654488, 1.186516, 1, 1, 1, 1, 1,
0.7535189, -0.2264326, 0.7987007, 1, 1, 1, 1, 1,
0.7542973, 0.1396973, -1.208056, 1, 1, 1, 1, 1,
0.7569936, 0.1462752, 0.2990682, 1, 1, 1, 1, 1,
0.7573863, -0.6558253, 2.30696, 1, 1, 1, 1, 1,
0.7614704, 1.484583, 0.215133, 1, 1, 1, 1, 1,
0.7626911, 0.01711001, -1.214312, 1, 1, 1, 1, 1,
0.7659656, 0.3531184, 0.8237025, 1, 1, 1, 1, 1,
0.7670819, 0.182115, 1.032825, 1, 1, 1, 1, 1,
0.7692181, 1.629842, 0.986259, 0, 0, 1, 1, 1,
0.7709067, -0.581488, 1.766018, 1, 0, 0, 1, 1,
0.773503, -1.127881, 1.290912, 1, 0, 0, 1, 1,
0.775824, -1.11196, -0.9212375, 1, 0, 0, 1, 1,
0.787491, 0.991711, 1.288229, 1, 0, 0, 1, 1,
0.7886076, -0.7583817, 4.033867, 1, 0, 0, 1, 1,
0.7903575, -0.5199134, 2.472317, 0, 0, 0, 1, 1,
0.7915643, 0.636036, 1.536356, 0, 0, 0, 1, 1,
0.7925094, 1.677008, 0.7454848, 0, 0, 0, 1, 1,
0.7959869, 0.9432595, 0.6631233, 0, 0, 0, 1, 1,
0.8013998, 0.1426383, 2.083192, 0, 0, 0, 1, 1,
0.8020926, 0.2242017, 1.2942, 0, 0, 0, 1, 1,
0.8073072, -0.04710168, 0.8570009, 0, 0, 0, 1, 1,
0.8094454, 1.202331, 0.05445676, 1, 1, 1, 1, 1,
0.8174126, 0.2770219, 2.158192, 1, 1, 1, 1, 1,
0.8250297, -0.4889995, 1.535754, 1, 1, 1, 1, 1,
0.8278753, 1.339923, 0.2027264, 1, 1, 1, 1, 1,
0.8365289, 1.860735, -0.08447298, 1, 1, 1, 1, 1,
0.8386182, -0.6598888, 3.763818, 1, 1, 1, 1, 1,
0.8407887, -0.5599148, 2.952276, 1, 1, 1, 1, 1,
0.8486355, 0.92442, 0.5973729, 1, 1, 1, 1, 1,
0.8502037, 0.3367342, 1.851038, 1, 1, 1, 1, 1,
0.8545076, -0.2027525, 2.253489, 1, 1, 1, 1, 1,
0.8583305, 0.1864692, 0.8185703, 1, 1, 1, 1, 1,
0.8619242, 1.405696, 0.8526007, 1, 1, 1, 1, 1,
0.8633314, -0.1152946, 1.640225, 1, 1, 1, 1, 1,
0.8673379, -1.307176, 2.091272, 1, 1, 1, 1, 1,
0.8733318, 0.7474524, 2.148948, 1, 1, 1, 1, 1,
0.8749171, 0.4691412, 2.348815, 0, 0, 1, 1, 1,
0.8822737, -0.2413285, 0.2558848, 1, 0, 0, 1, 1,
0.8849308, 0.1220969, 3.019872, 1, 0, 0, 1, 1,
0.8865255, -1.268229, 1.783388, 1, 0, 0, 1, 1,
0.8865503, -0.8076034, 1.457525, 1, 0, 0, 1, 1,
0.888393, -1.057991, 2.098297, 1, 0, 0, 1, 1,
0.89504, -0.6506411, 0.3780384, 0, 0, 0, 1, 1,
0.8961539, 0.8458839, 0.7695327, 0, 0, 0, 1, 1,
0.9034441, -0.1363969, 2.522793, 0, 0, 0, 1, 1,
0.9050397, -0.08297227, 2.18741, 0, 0, 0, 1, 1,
0.9065726, 0.6338586, -0.8281256, 0, 0, 0, 1, 1,
0.9107806, -0.4404933, -0.05107349, 0, 0, 0, 1, 1,
0.9135057, 1.297362, -1.23763, 0, 0, 0, 1, 1,
0.9152564, 1.177428, 1.578631, 1, 1, 1, 1, 1,
0.916829, -0.3499671, 3.233216, 1, 1, 1, 1, 1,
0.9238592, -0.7584181, 0.2734726, 1, 1, 1, 1, 1,
0.9305316, 1.905926, 0.9229354, 1, 1, 1, 1, 1,
0.9367322, -0.003716397, 0.5704345, 1, 1, 1, 1, 1,
0.9392355, 1.685522, 1.054619, 1, 1, 1, 1, 1,
0.9401715, 0.5752153, 1.350873, 1, 1, 1, 1, 1,
0.9416068, 1.053064, -0.03806363, 1, 1, 1, 1, 1,
0.9531218, 0.01152172, 1.360993, 1, 1, 1, 1, 1,
0.9589923, 0.3803712, 1.039586, 1, 1, 1, 1, 1,
0.9605371, -0.1927845, 1.78758, 1, 1, 1, 1, 1,
0.9617024, 0.5221952, 0.4438071, 1, 1, 1, 1, 1,
0.96866, -0.8164429, 0.8230534, 1, 1, 1, 1, 1,
0.9711993, 0.2842138, 0.03385029, 1, 1, 1, 1, 1,
0.9731451, 0.3018236, -0.001236666, 1, 1, 1, 1, 1,
0.9828951, 0.7969806, 1.454127, 0, 0, 1, 1, 1,
0.9868751, 0.2949525, 2.634638, 1, 0, 0, 1, 1,
0.9884349, 0.1229797, -0.2088433, 1, 0, 0, 1, 1,
0.994421, -0.8157803, 3.19541, 1, 0, 0, 1, 1,
0.9964599, 1.87936, -1.115455, 1, 0, 0, 1, 1,
1.004357, -1.594639, 2.819065, 1, 0, 0, 1, 1,
1.017181, -2.546699, 2.506059, 0, 0, 0, 1, 1,
1.018528, -0.7852092, 3.238407, 0, 0, 0, 1, 1,
1.023902, 0.832017, 0.4435601, 0, 0, 0, 1, 1,
1.024319, 0.00648466, 2.368417, 0, 0, 0, 1, 1,
1.033319, 0.3512132, -0.348406, 0, 0, 0, 1, 1,
1.042919, -2.679975, 3.554679, 0, 0, 0, 1, 1,
1.043941, -0.691528, 0.8206341, 0, 0, 0, 1, 1,
1.04491, 0.03982082, 0.7116521, 1, 1, 1, 1, 1,
1.053837, -0.9227498, 2.065202, 1, 1, 1, 1, 1,
1.055659, 0.5798965, 1.975944, 1, 1, 1, 1, 1,
1.059365, 0.8541345, 1.448298, 1, 1, 1, 1, 1,
1.063088, 0.2371044, 0.027829, 1, 1, 1, 1, 1,
1.063488, -0.8505832, 2.011352, 1, 1, 1, 1, 1,
1.064928, -0.4458381, 1.764419, 1, 1, 1, 1, 1,
1.06986, -0.5781912, 2.85789, 1, 1, 1, 1, 1,
1.071223, -1.194127, 2.088531, 1, 1, 1, 1, 1,
1.072006, -0.4190009, 1.228793, 1, 1, 1, 1, 1,
1.07296, 1.514205, 1.070343, 1, 1, 1, 1, 1,
1.075483, -0.3956397, 2.673072, 1, 1, 1, 1, 1,
1.075801, 1.355756, 0.04547875, 1, 1, 1, 1, 1,
1.086523, -0.1201717, 2.780227, 1, 1, 1, 1, 1,
1.092536, -0.3777129, 1.78406, 1, 1, 1, 1, 1,
1.109197, 0.8885459, 1.815116, 0, 0, 1, 1, 1,
1.114164, 0.4954187, 0.5049928, 1, 0, 0, 1, 1,
1.116005, 0.8259043, 1.745211, 1, 0, 0, 1, 1,
1.117628, 0.8317359, -0.1270083, 1, 0, 0, 1, 1,
1.120617, -0.1305864, 2.602528, 1, 0, 0, 1, 1,
1.125094, -1.255438, 2.671618, 1, 0, 0, 1, 1,
1.12565, -0.8659992, 2.670004, 0, 0, 0, 1, 1,
1.127118, -1.044516, 2.662573, 0, 0, 0, 1, 1,
1.129746, 0.874936, 0.5213237, 0, 0, 0, 1, 1,
1.131377, 1.096435, 1.113349, 0, 0, 0, 1, 1,
1.133429, 1.230439, 0.4808429, 0, 0, 0, 1, 1,
1.141139, -1.380608, 3.221717, 0, 0, 0, 1, 1,
1.143313, 0.06106617, 0.7259844, 0, 0, 0, 1, 1,
1.143784, 0.6566246, -0.2926611, 1, 1, 1, 1, 1,
1.147102, 0.1965363, 0.5976195, 1, 1, 1, 1, 1,
1.157908, -0.6096932, 1.409522, 1, 1, 1, 1, 1,
1.167715, -1.052214, 3.533452, 1, 1, 1, 1, 1,
1.175772, 0.3534185, 0.9492553, 1, 1, 1, 1, 1,
1.176533, -0.9191448, 2.294373, 1, 1, 1, 1, 1,
1.177442, 1.045285, 2.073221, 1, 1, 1, 1, 1,
1.17747, 1.246963, 1.357809, 1, 1, 1, 1, 1,
1.177909, -0.3756509, 2.155327, 1, 1, 1, 1, 1,
1.178905, -0.4048584, -0.07027154, 1, 1, 1, 1, 1,
1.179434, -1.498262, 3.488815, 1, 1, 1, 1, 1,
1.179793, 2.794068, 0.7565249, 1, 1, 1, 1, 1,
1.180869, -1.546113, 3.929171, 1, 1, 1, 1, 1,
1.184106, -1.3875, 2.072479, 1, 1, 1, 1, 1,
1.185747, 0.7819361, 1.661295, 1, 1, 1, 1, 1,
1.186429, 0.965767, -1.068462, 0, 0, 1, 1, 1,
1.187191, 0.4836126, 1.78425, 1, 0, 0, 1, 1,
1.188406, 0.1659797, 0.7589658, 1, 0, 0, 1, 1,
1.193313, -0.9566643, 0.50381, 1, 0, 0, 1, 1,
1.194319, 0.8767311, 1.471635, 1, 0, 0, 1, 1,
1.199732, 0.651293, -0.02334355, 1, 0, 0, 1, 1,
1.205642, -0.1202478, 2.571986, 0, 0, 0, 1, 1,
1.212186, 0.4096453, 1.505154, 0, 0, 0, 1, 1,
1.221472, 1.254326, -0.1825132, 0, 0, 0, 1, 1,
1.225335, 0.3251343, 2.248254, 0, 0, 0, 1, 1,
1.226028, -1.68735, 3.227952, 0, 0, 0, 1, 1,
1.228879, 1.048573, 1.206857, 0, 0, 0, 1, 1,
1.240228, 1.873169, -0.7198812, 0, 0, 0, 1, 1,
1.241313, -0.182921, 2.742687, 1, 1, 1, 1, 1,
1.242538, -0.6241922, 1.532346, 1, 1, 1, 1, 1,
1.248808, 1.860558, 1.384777, 1, 1, 1, 1, 1,
1.250795, -0.18135, 1.718512, 1, 1, 1, 1, 1,
1.255139, 0.8991493, 0.7086352, 1, 1, 1, 1, 1,
1.262396, -0.6800551, 2.770827, 1, 1, 1, 1, 1,
1.266888, 0.9407462, 0.347657, 1, 1, 1, 1, 1,
1.268906, -1.349438, 2.845624, 1, 1, 1, 1, 1,
1.269081, 0.4624137, 1.026488, 1, 1, 1, 1, 1,
1.274806, 0.1452341, 1.636209, 1, 1, 1, 1, 1,
1.277113, 1.030575, 1.566392, 1, 1, 1, 1, 1,
1.286294, 1.551959, -0.01176457, 1, 1, 1, 1, 1,
1.29255, -0.1492732, 3.427909, 1, 1, 1, 1, 1,
1.294914, 0.130193, 2.105977, 1, 1, 1, 1, 1,
1.306046, -0.4882707, 2.745625, 1, 1, 1, 1, 1,
1.327827, 0.9473817, 1.860316, 0, 0, 1, 1, 1,
1.336894, -1.439177, 1.661344, 1, 0, 0, 1, 1,
1.341911, 0.690663, 0.619827, 1, 0, 0, 1, 1,
1.353502, 1.925936, 0.6353478, 1, 0, 0, 1, 1,
1.364977, 1.220785, 2.455085, 1, 0, 0, 1, 1,
1.370983, -0.6239561, 2.67433, 1, 0, 0, 1, 1,
1.38007, 0.2651223, 1.577772, 0, 0, 0, 1, 1,
1.384073, 0.354986, 0.04301903, 0, 0, 0, 1, 1,
1.394809, -1.011492, 0.3751014, 0, 0, 0, 1, 1,
1.420595, -0.4899436, 1.608996, 0, 0, 0, 1, 1,
1.42495, 0.3408383, -0.6332946, 0, 0, 0, 1, 1,
1.435256, -0.5717766, 2.644259, 0, 0, 0, 1, 1,
1.446303, 0.8474241, -1.308416, 0, 0, 0, 1, 1,
1.449594, -0.4668445, 1.877006, 1, 1, 1, 1, 1,
1.451678, 0.8121743, 2.081988, 1, 1, 1, 1, 1,
1.455879, 0.1455267, -0.2810379, 1, 1, 1, 1, 1,
1.466653, -1.327943, 2.410127, 1, 1, 1, 1, 1,
1.472528, -0.6715978, 1.97523, 1, 1, 1, 1, 1,
1.472585, -0.7876928, 1.223713, 1, 1, 1, 1, 1,
1.476463, -0.6000381, 3.061766, 1, 1, 1, 1, 1,
1.49658, 0.153994, 0.5897326, 1, 1, 1, 1, 1,
1.497603, 2.386975, 1.042266, 1, 1, 1, 1, 1,
1.506441, 0.653179, 0.8538839, 1, 1, 1, 1, 1,
1.506448, 0.8500964, -0.3980588, 1, 1, 1, 1, 1,
1.51579, 0.6067071, 2.18297, 1, 1, 1, 1, 1,
1.534443, -1.420931, 3.130733, 1, 1, 1, 1, 1,
1.549566, 0.4704368, 0.5179999, 1, 1, 1, 1, 1,
1.553225, 2.403259, 0.4705806, 1, 1, 1, 1, 1,
1.554697, 2.051896, -0.2756029, 0, 0, 1, 1, 1,
1.558788, -2.024165, 1.483626, 1, 0, 0, 1, 1,
1.566412, 1.257686, 1.080667, 1, 0, 0, 1, 1,
1.567047, 0.5776742, 0.3328862, 1, 0, 0, 1, 1,
1.568118, 0.1093778, 1.77233, 1, 0, 0, 1, 1,
1.569393, 0.8191973, 3.222094, 1, 0, 0, 1, 1,
1.574235, -0.02644681, 0.2847138, 0, 0, 0, 1, 1,
1.585027, 0.1584244, 1.297937, 0, 0, 0, 1, 1,
1.586648, -0.2296257, 3.334987, 0, 0, 0, 1, 1,
1.597314, -0.468315, 1.916765, 0, 0, 0, 1, 1,
1.604781, 0.3342998, 1.2671, 0, 0, 0, 1, 1,
1.617316, -0.03065691, 0.5546796, 0, 0, 0, 1, 1,
1.664904, 1.03399, 0.4727337, 0, 0, 0, 1, 1,
1.670588, 1.421329, 0.3940656, 1, 1, 1, 1, 1,
1.696016, -0.1221512, 2.313437, 1, 1, 1, 1, 1,
1.696215, 1.01746, 1.024338, 1, 1, 1, 1, 1,
1.696751, 0.2534091, 0.9176213, 1, 1, 1, 1, 1,
1.697955, -0.1117177, 1.904959, 1, 1, 1, 1, 1,
1.702684, 0.1322618, 3.399026, 1, 1, 1, 1, 1,
1.703528, -1.274411, 1.720317, 1, 1, 1, 1, 1,
1.70643, -2.724193, 3.143733, 1, 1, 1, 1, 1,
1.714305, 1.703945, 0.8935074, 1, 1, 1, 1, 1,
1.714894, 0.5075735, 1.700679, 1, 1, 1, 1, 1,
1.716977, 1.125469, 0.7177281, 1, 1, 1, 1, 1,
1.720513, -0.3511389, 2.763654, 1, 1, 1, 1, 1,
1.733242, 0.4567357, 1.091721, 1, 1, 1, 1, 1,
1.747412, -0.1885928, 1.715232, 1, 1, 1, 1, 1,
1.749797, -0.890876, 3.321094, 1, 1, 1, 1, 1,
1.756124, 0.02652483, 2.435265, 0, 0, 1, 1, 1,
1.774309, -2.27482, 1.690942, 1, 0, 0, 1, 1,
1.780219, -0.1590959, 2.125999, 1, 0, 0, 1, 1,
1.78548, -0.8696693, 1.972689, 1, 0, 0, 1, 1,
1.789464, -2.370682, 1.717691, 1, 0, 0, 1, 1,
1.807014, 0.8792419, 0.1013086, 1, 0, 0, 1, 1,
1.84038, 0.7658532, 1.209483, 0, 0, 0, 1, 1,
1.847322, -0.3153501, 0.5222225, 0, 0, 0, 1, 1,
1.849447, 0.4420952, 1.628163, 0, 0, 0, 1, 1,
1.849641, -0.3517866, 0.1476889, 0, 0, 0, 1, 1,
1.850869, 0.03157516, -0.5311848, 0, 0, 0, 1, 1,
1.851231, -1.802179, 3.526623, 0, 0, 0, 1, 1,
1.860452, -2.102244, 2.058784, 0, 0, 0, 1, 1,
1.873451, 1.686548, 1.791346, 1, 1, 1, 1, 1,
1.879063, -0.2736401, 0.613834, 1, 1, 1, 1, 1,
1.903908, -0.2840191, 1.87094, 1, 1, 1, 1, 1,
1.906609, 0.4986816, -0.1980702, 1, 1, 1, 1, 1,
1.909485, -0.3168048, 3.222205, 1, 1, 1, 1, 1,
1.928961, -1.280189, 2.127089, 1, 1, 1, 1, 1,
1.936378, -1.371019, -0.5793508, 1, 1, 1, 1, 1,
1.940354, 1.081288, 1.619929, 1, 1, 1, 1, 1,
1.956536, 0.4829163, 1.36335, 1, 1, 1, 1, 1,
1.961066, -0.8922502, 3.336087, 1, 1, 1, 1, 1,
1.967469, -0.04945985, 1.531034, 1, 1, 1, 1, 1,
1.983802, -1.202113, 2.941808, 1, 1, 1, 1, 1,
1.988436, 0.3664204, -0.8869906, 1, 1, 1, 1, 1,
2.002029, 0.2889692, 0.9257808, 1, 1, 1, 1, 1,
2.027974, 1.218261, -0.1234332, 1, 1, 1, 1, 1,
2.079244, -0.2452634, 1.998757, 0, 0, 1, 1, 1,
2.089249, 1.132063, 1.275483, 1, 0, 0, 1, 1,
2.166939, -0.1551501, 3.830151, 1, 0, 0, 1, 1,
2.18092, -2.150264, 0.915571, 1, 0, 0, 1, 1,
2.258647, -1.096624, 2.132195, 1, 0, 0, 1, 1,
2.263613, 0.5372527, 2.571751, 1, 0, 0, 1, 1,
2.269199, 0.09683187, 0.6599635, 0, 0, 0, 1, 1,
2.290346, -0.04736171, 2.337766, 0, 0, 0, 1, 1,
2.298377, 2.126039, -0.2141499, 0, 0, 0, 1, 1,
2.302507, 1.044436, 2.033299, 0, 0, 0, 1, 1,
2.304426, -0.4845241, 3.3331, 0, 0, 0, 1, 1,
2.437113, 0.312475, 1.340712, 0, 0, 0, 1, 1,
2.451041, 1.430347, 0.7221782, 0, 0, 0, 1, 1,
2.48743, -0.6296061, 2.139783, 1, 1, 1, 1, 1,
2.545267, 0.7609836, 1.46281, 1, 1, 1, 1, 1,
2.673937, -0.02331243, 2.277341, 1, 1, 1, 1, 1,
2.803856, 0.4897595, 1.929279, 1, 1, 1, 1, 1,
2.807834, -0.1927143, 1.473797, 1, 1, 1, 1, 1,
3.094451, 0.3214529, 2.891249, 1, 1, 1, 1, 1,
3.115348, 0.02341983, 0.319062, 1, 1, 1, 1, 1
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
var radius = 9.3262;
var distance = 32.75788;
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
mvMatrix.translate( -0.1958165, 0.09810972, 0.2437692 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75788);
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
