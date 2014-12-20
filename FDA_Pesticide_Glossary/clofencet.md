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
-2.749777, 1.183219, -0.83846, 1, 0, 0, 1,
-2.684496, -1.464571, -1.533762, 1, 0.007843138, 0, 1,
-2.63183, 1.507509, -2.664209, 1, 0.01176471, 0, 1,
-2.626175, 0.3166125, -2.315808, 1, 0.01960784, 0, 1,
-2.612616, 1.609826, -0.7715364, 1, 0.02352941, 0, 1,
-2.594725, 0.9623222, -1.117889, 1, 0.03137255, 0, 1,
-2.459667, -1.044996, -1.585991, 1, 0.03529412, 0, 1,
-2.454174, -1.015825, -2.551728, 1, 0.04313726, 0, 1,
-2.378805, 0.7250237, -0.5073267, 1, 0.04705882, 0, 1,
-2.310973, 0.7876354, -0.04579319, 1, 0.05490196, 0, 1,
-2.309233, 0.900237, 0.4043825, 1, 0.05882353, 0, 1,
-2.290334, -0.2838277, -0.9824905, 1, 0.06666667, 0, 1,
-2.286891, -0.6563677, -0.7395898, 1, 0.07058824, 0, 1,
-2.213232, -0.3023056, -0.8679596, 1, 0.07843138, 0, 1,
-2.17128, -1.468527, -1.360332, 1, 0.08235294, 0, 1,
-2.144889, 0.6451494, -1.673621, 1, 0.09019608, 0, 1,
-2.097428, -0.9930862, -0.5198541, 1, 0.09411765, 0, 1,
-2.093596, 1.193048, -1.669323, 1, 0.1019608, 0, 1,
-2.088716, 0.3456768, -0.7433209, 1, 0.1098039, 0, 1,
-2.064468, -0.08320083, 0.3499751, 1, 0.1137255, 0, 1,
-2.04885, -0.07763933, -1.160075, 1, 0.1215686, 0, 1,
-2.048814, 0.5701109, -0.04069125, 1, 0.1254902, 0, 1,
-2.045583, -0.4447501, -1.237401, 1, 0.1333333, 0, 1,
-2.045192, 0.2387813, 0.1778002, 1, 0.1372549, 0, 1,
-2.020782, -0.2134762, -1.810777, 1, 0.145098, 0, 1,
-2.018939, -0.2615243, 0.1699894, 1, 0.1490196, 0, 1,
-1.987364, 0.32557, -1.539074, 1, 0.1568628, 0, 1,
-1.980567, -0.7333971, -3.480831, 1, 0.1607843, 0, 1,
-1.979214, 1.374248, 0.6203601, 1, 0.1686275, 0, 1,
-1.978884, 1.682495, -1.939552, 1, 0.172549, 0, 1,
-1.931792, -1.231346, -2.640214, 1, 0.1803922, 0, 1,
-1.923514, -1.114347, -2.364094, 1, 0.1843137, 0, 1,
-1.921612, 0.6174505, -0.7898861, 1, 0.1921569, 0, 1,
-1.91311, 0.08470027, -1.556422, 1, 0.1960784, 0, 1,
-1.909672, -2.236325, -2.669515, 1, 0.2039216, 0, 1,
-1.904448, 2.15816, 0.2656134, 1, 0.2117647, 0, 1,
-1.86456, -0.6909002, -1.185133, 1, 0.2156863, 0, 1,
-1.864372, 0.4519816, -0.4708403, 1, 0.2235294, 0, 1,
-1.862092, -0.9293405, -1.913849, 1, 0.227451, 0, 1,
-1.850877, -0.3374639, -0.2437584, 1, 0.2352941, 0, 1,
-1.850793, -0.8868729, -1.7686, 1, 0.2392157, 0, 1,
-1.847272, 0.2227014, -1.093421, 1, 0.2470588, 0, 1,
-1.846974, 1.591522, -0.3374825, 1, 0.2509804, 0, 1,
-1.832969, -0.5063586, -3.575375, 1, 0.2588235, 0, 1,
-1.832762, 0.8005638, -0.2756391, 1, 0.2627451, 0, 1,
-1.78547, -1.069808, -1.291241, 1, 0.2705882, 0, 1,
-1.784903, 0.1414692, 1.001287, 1, 0.2745098, 0, 1,
-1.773179, -0.6704192, -1.298472, 1, 0.282353, 0, 1,
-1.769825, -0.3039548, -2.088588, 1, 0.2862745, 0, 1,
-1.7408, -0.4046744, -1.755561, 1, 0.2941177, 0, 1,
-1.661034, -1.169733, -0.9330875, 1, 0.3019608, 0, 1,
-1.647904, -0.8357399, -1.886225, 1, 0.3058824, 0, 1,
-1.623639, 3.049972, -0.2424633, 1, 0.3137255, 0, 1,
-1.622025, 0.4317558, -0.6738493, 1, 0.3176471, 0, 1,
-1.620335, -0.8547663, -1.887473, 1, 0.3254902, 0, 1,
-1.620236, -0.633981, -1.864765, 1, 0.3294118, 0, 1,
-1.614642, -1.715076, -2.845809, 1, 0.3372549, 0, 1,
-1.609544, -0.2780354, -2.381465, 1, 0.3411765, 0, 1,
-1.606679, -0.5594215, -0.9122881, 1, 0.3490196, 0, 1,
-1.604919, -0.696038, -0.7206057, 1, 0.3529412, 0, 1,
-1.593941, 0.6405293, -1.035487, 1, 0.3607843, 0, 1,
-1.576913, 1.173275, -0.1169118, 1, 0.3647059, 0, 1,
-1.561157, 0.9304223, -2.495707, 1, 0.372549, 0, 1,
-1.559221, -0.2886436, -1.246267, 1, 0.3764706, 0, 1,
-1.548557, 2.951678, -0.8466749, 1, 0.3843137, 0, 1,
-1.536825, -0.3757788, -2.659834, 1, 0.3882353, 0, 1,
-1.535696, 0.2995209, 1.876033, 1, 0.3960784, 0, 1,
-1.511181, -0.3835173, -4.435083, 1, 0.4039216, 0, 1,
-1.507484, 0.7249827, -0.5507666, 1, 0.4078431, 0, 1,
-1.504339, -1.284559, -2.43955, 1, 0.4156863, 0, 1,
-1.488954, -0.7411478, -0.7770838, 1, 0.4196078, 0, 1,
-1.484694, 0.1514477, -0.5740167, 1, 0.427451, 0, 1,
-1.474219, 0.2859601, -2.976892, 1, 0.4313726, 0, 1,
-1.471773, 1.105927, -1.565315, 1, 0.4392157, 0, 1,
-1.452113, -2.25336, -3.227918, 1, 0.4431373, 0, 1,
-1.443513, 1.039796, -1.560646, 1, 0.4509804, 0, 1,
-1.441989, 0.6468664, -3.225567, 1, 0.454902, 0, 1,
-1.439326, -2.630091, -1.833551, 1, 0.4627451, 0, 1,
-1.437832, -1.09793, -2.788405, 1, 0.4666667, 0, 1,
-1.428955, -0.7172898, -2.579528, 1, 0.4745098, 0, 1,
-1.424566, 0.3350696, -0.7326332, 1, 0.4784314, 0, 1,
-1.419193, -0.9400496, -1.791584, 1, 0.4862745, 0, 1,
-1.417187, -0.4553709, -2.460994, 1, 0.4901961, 0, 1,
-1.413855, 0.04310203, -2.409675, 1, 0.4980392, 0, 1,
-1.411217, -0.2480273, -2.448292, 1, 0.5058824, 0, 1,
-1.408754, 0.4589824, -3.036753, 1, 0.509804, 0, 1,
-1.398544, 0.8656759, -1.171859, 1, 0.5176471, 0, 1,
-1.381482, 1.68054, -2.148305, 1, 0.5215687, 0, 1,
-1.366439, 1.167998, -0.6671995, 1, 0.5294118, 0, 1,
-1.353423, 0.08659901, -0.2804351, 1, 0.5333334, 0, 1,
-1.353261, 0.3676022, -2.402482, 1, 0.5411765, 0, 1,
-1.350742, 0.1054851, 0.02335978, 1, 0.5450981, 0, 1,
-1.345899, 0.8236828, -0.1246465, 1, 0.5529412, 0, 1,
-1.344995, 0.3860409, 0.9133292, 1, 0.5568628, 0, 1,
-1.338222, 1.132935, -1.314159, 1, 0.5647059, 0, 1,
-1.337964, 0.4561163, 0.6655847, 1, 0.5686275, 0, 1,
-1.332439, -1.040826, -2.067769, 1, 0.5764706, 0, 1,
-1.327775, -1.97389, -3.488625, 1, 0.5803922, 0, 1,
-1.325246, 0.7393593, -0.2308242, 1, 0.5882353, 0, 1,
-1.324345, 0.5724922, -0.4035062, 1, 0.5921569, 0, 1,
-1.321486, -1.249633, -2.468123, 1, 0.6, 0, 1,
-1.315968, -0.2583798, -3.005606, 1, 0.6078432, 0, 1,
-1.311219, -0.1491847, -0.8510827, 1, 0.6117647, 0, 1,
-1.309499, 0.5178896, -0.02101178, 1, 0.6196079, 0, 1,
-1.280612, 0.4725107, -1.643891, 1, 0.6235294, 0, 1,
-1.266277, 0.8783981, 0.348849, 1, 0.6313726, 0, 1,
-1.261692, 0.4868218, -2.122555, 1, 0.6352941, 0, 1,
-1.261316, -0.1260439, 0.00075848, 1, 0.6431373, 0, 1,
-1.241265, 1.360726, -1.182963, 1, 0.6470588, 0, 1,
-1.240425, -0.8558935, -2.475179, 1, 0.654902, 0, 1,
-1.227411, 0.08859849, -2.018026, 1, 0.6588235, 0, 1,
-1.227224, 0.2126708, -1.411052, 1, 0.6666667, 0, 1,
-1.222672, 0.2148715, -0.1189327, 1, 0.6705883, 0, 1,
-1.208436, 0.6920975, -0.5521997, 1, 0.6784314, 0, 1,
-1.205631, -0.8104329, -1.746674, 1, 0.682353, 0, 1,
-1.202839, -1.724947, -2.383621, 1, 0.6901961, 0, 1,
-1.201322, -0.2951007, -1.716565, 1, 0.6941177, 0, 1,
-1.198043, 0.06971669, 0.02614431, 1, 0.7019608, 0, 1,
-1.193882, 0.5334275, -2.419036, 1, 0.7098039, 0, 1,
-1.174711, 0.3439761, -2.60802, 1, 0.7137255, 0, 1,
-1.173318, -0.6790296, -1.749789, 1, 0.7215686, 0, 1,
-1.171877, -1.623572, -1.267801, 1, 0.7254902, 0, 1,
-1.164781, -0.7419958, -3.851985, 1, 0.7333333, 0, 1,
-1.160289, 0.1234012, -1.049674, 1, 0.7372549, 0, 1,
-1.159033, -0.1543575, -2.735198, 1, 0.7450981, 0, 1,
-1.156523, 0.7676274, -0.4670053, 1, 0.7490196, 0, 1,
-1.154909, -0.06696517, 0.3787946, 1, 0.7568628, 0, 1,
-1.153717, 0.3325757, -1.68972, 1, 0.7607843, 0, 1,
-1.148558, 0.9446456, -1.706268, 1, 0.7686275, 0, 1,
-1.148187, 1.533811, 0.7193942, 1, 0.772549, 0, 1,
-1.147917, 0.6794675, -0.932263, 1, 0.7803922, 0, 1,
-1.144378, -1.687904, -1.679517, 1, 0.7843137, 0, 1,
-1.143168, 1.540176, 0.650988, 1, 0.7921569, 0, 1,
-1.141429, -1.566455, -2.933933, 1, 0.7960784, 0, 1,
-1.139228, 0.0869716, -1.244532, 1, 0.8039216, 0, 1,
-1.135941, 1.981828, 0.5594913, 1, 0.8117647, 0, 1,
-1.123081, 2.431378, -3.589718, 1, 0.8156863, 0, 1,
-1.117468, -0.323925, 0.1944481, 1, 0.8235294, 0, 1,
-1.110994, -1.749057, -3.020663, 1, 0.827451, 0, 1,
-1.109676, -1.257727, -2.325695, 1, 0.8352941, 0, 1,
-1.109354, -0.2156952, -1.629057, 1, 0.8392157, 0, 1,
-1.10749, -0.2549204, -2.454778, 1, 0.8470588, 0, 1,
-1.104313, 0.7063351, -0.6313648, 1, 0.8509804, 0, 1,
-1.101672, 1.593475, 0.01035981, 1, 0.8588235, 0, 1,
-1.095727, 0.1005165, -4.314772, 1, 0.8627451, 0, 1,
-1.094376, -0.3740239, -0.2885066, 1, 0.8705882, 0, 1,
-1.094118, 0.1291785, -0.1032698, 1, 0.8745098, 0, 1,
-1.091763, 0.165609, -0.5002829, 1, 0.8823529, 0, 1,
-1.090541, -2.170182, -3.961673, 1, 0.8862745, 0, 1,
-1.081846, 0.1026196, -1.130288, 1, 0.8941177, 0, 1,
-1.079364, 0.07207989, -1.041205, 1, 0.8980392, 0, 1,
-1.074062, -0.3538517, -0.6172439, 1, 0.9058824, 0, 1,
-1.069314, -0.3321723, -2.936817, 1, 0.9137255, 0, 1,
-1.05617, 0.3849556, -0.1835898, 1, 0.9176471, 0, 1,
-1.050754, -0.1264256, -1.084435, 1, 0.9254902, 0, 1,
-1.045867, -0.9433782, -1.648399, 1, 0.9294118, 0, 1,
-1.04431, -0.9408792, -1.934947, 1, 0.9372549, 0, 1,
-1.043296, -2.945422, -2.195032, 1, 0.9411765, 0, 1,
-1.03987, 1.265941, -2.352073, 1, 0.9490196, 0, 1,
-1.03451, 0.1971573, -1.424737, 1, 0.9529412, 0, 1,
-1.033533, 0.5211112, -0.5766649, 1, 0.9607843, 0, 1,
-1.029715, -0.415136, -1.492322, 1, 0.9647059, 0, 1,
-1.029253, -0.6558968, -1.950551, 1, 0.972549, 0, 1,
-1.027943, 0.6222471, -0.9631436, 1, 0.9764706, 0, 1,
-1.022917, -1.810327, -3.046557, 1, 0.9843137, 0, 1,
-1.02206, 1.484933, -0.9926122, 1, 0.9882353, 0, 1,
-1.016227, 0.01463824, 0.340288, 1, 0.9960784, 0, 1,
-1.015895, 0.3368804, -3.034493, 0.9960784, 1, 0, 1,
-1.0153, 0.6133, -2.068428, 0.9921569, 1, 0, 1,
-1.013835, -1.858812, -2.559605, 0.9843137, 1, 0, 1,
-1.003136, 2.137063, -1.576421, 0.9803922, 1, 0, 1,
-1.002958, 0.7366612, -2.401929, 0.972549, 1, 0, 1,
-0.9910021, 0.3164141, -0.6165631, 0.9686275, 1, 0, 1,
-0.9884565, -0.4351461, -2.057507, 0.9607843, 1, 0, 1,
-0.9840304, 1.374887, -1.786012, 0.9568627, 1, 0, 1,
-0.9698468, -0.5100924, -2.152946, 0.9490196, 1, 0, 1,
-0.9692771, -0.9684762, -2.490166, 0.945098, 1, 0, 1,
-0.9678377, -0.3241441, -2.484145, 0.9372549, 1, 0, 1,
-0.9652817, -0.0386001, -1.622961, 0.9333333, 1, 0, 1,
-0.9623893, 0.8529839, -3.592139, 0.9254902, 1, 0, 1,
-0.9559684, 0.1937564, -1.372906, 0.9215686, 1, 0, 1,
-0.9551772, -0.6305394, -0.7849019, 0.9137255, 1, 0, 1,
-0.9479142, 0.3051911, -0.8896216, 0.9098039, 1, 0, 1,
-0.9442713, 0.01842053, -2.760166, 0.9019608, 1, 0, 1,
-0.9374155, -0.2102438, -2.44399, 0.8941177, 1, 0, 1,
-0.9353225, -1.260153, -5.079125, 0.8901961, 1, 0, 1,
-0.9314192, -0.3083592, -3.378531, 0.8823529, 1, 0, 1,
-0.9243892, -0.3987632, -3.253493, 0.8784314, 1, 0, 1,
-0.9236975, 1.930867, -0.8323175, 0.8705882, 1, 0, 1,
-0.9187464, 0.4126745, 0.3207869, 0.8666667, 1, 0, 1,
-0.915533, 0.1800669, 0.01278737, 0.8588235, 1, 0, 1,
-0.9088973, -0.1527057, -1.074548, 0.854902, 1, 0, 1,
-0.9040524, -0.2361346, -3.590213, 0.8470588, 1, 0, 1,
-0.8925131, 1.176983, -0.3960662, 0.8431373, 1, 0, 1,
-0.8875147, 0.2493583, -3.868091, 0.8352941, 1, 0, 1,
-0.8867416, -0.9886064, -2.50646, 0.8313726, 1, 0, 1,
-0.8864174, 0.4647012, 0.5472718, 0.8235294, 1, 0, 1,
-0.8848651, -0.07345146, -3.278521, 0.8196079, 1, 0, 1,
-0.8825186, -1.252144, -1.072101, 0.8117647, 1, 0, 1,
-0.8821036, 0.3496321, -0.3765857, 0.8078431, 1, 0, 1,
-0.8820134, -2.403378, -0.8482788, 0.8, 1, 0, 1,
-0.8793945, 0.9548228, -1.46546, 0.7921569, 1, 0, 1,
-0.8777061, 0.8740903, 0.3911505, 0.7882353, 1, 0, 1,
-0.8749186, -2.364145, -1.539604, 0.7803922, 1, 0, 1,
-0.8604772, -0.396618, -2.559724, 0.7764706, 1, 0, 1,
-0.858628, -0.09038106, -2.925249, 0.7686275, 1, 0, 1,
-0.8421575, 1.349696, -0.6180757, 0.7647059, 1, 0, 1,
-0.8420733, 1.531327, -0.08613997, 0.7568628, 1, 0, 1,
-0.841774, 1.055602, -0.1510356, 0.7529412, 1, 0, 1,
-0.8410761, 2.259333, -0.01420357, 0.7450981, 1, 0, 1,
-0.8408517, -1.972367, -1.758178, 0.7411765, 1, 0, 1,
-0.839358, -0.2318424, -2.104806, 0.7333333, 1, 0, 1,
-0.8391026, -1.124375, -3.492027, 0.7294118, 1, 0, 1,
-0.8302747, -1.040109, -1.156983, 0.7215686, 1, 0, 1,
-0.8252507, -0.2068681, -2.497317, 0.7176471, 1, 0, 1,
-0.8150168, -1.484854, -3.097267, 0.7098039, 1, 0, 1,
-0.8132083, 0.9118544, -1.718099, 0.7058824, 1, 0, 1,
-0.8118577, 0.3873394, -0.7512244, 0.6980392, 1, 0, 1,
-0.8079972, 0.3806036, -2.600326, 0.6901961, 1, 0, 1,
-0.8052707, 0.1808468, -1.949914, 0.6862745, 1, 0, 1,
-0.798865, 0.9255251, 1.676857, 0.6784314, 1, 0, 1,
-0.7918245, 1.394872, -0.2269163, 0.6745098, 1, 0, 1,
-0.7815009, -1.012201, -1.897597, 0.6666667, 1, 0, 1,
-0.7811691, -1.602753, -2.47252, 0.6627451, 1, 0, 1,
-0.7786701, -0.6466109, -2.214666, 0.654902, 1, 0, 1,
-0.7680885, 0.7735377, -0.2282542, 0.6509804, 1, 0, 1,
-0.7674014, -1.447281, -3.466226, 0.6431373, 1, 0, 1,
-0.7669492, 0.8162386, -1.090706, 0.6392157, 1, 0, 1,
-0.7571962, -1.470369, -1.121954, 0.6313726, 1, 0, 1,
-0.7518286, 0.4068184, -0.07953, 0.627451, 1, 0, 1,
-0.7490783, -0.05127125, -1.268193, 0.6196079, 1, 0, 1,
-0.7392274, 1.241584, -1.300548, 0.6156863, 1, 0, 1,
-0.73919, -0.6143101, -1.06657, 0.6078432, 1, 0, 1,
-0.7384791, -1.362087, -3.507984, 0.6039216, 1, 0, 1,
-0.7371761, -2.102668, -3.627765, 0.5960785, 1, 0, 1,
-0.7339535, 0.4196879, -0.3328052, 0.5882353, 1, 0, 1,
-0.7286088, 1.558188, -1.063638, 0.5843138, 1, 0, 1,
-0.7246025, 0.3020272, -0.9271708, 0.5764706, 1, 0, 1,
-0.721405, -0.2520306, -1.695187, 0.572549, 1, 0, 1,
-0.7212653, -1.101522, -2.627048, 0.5647059, 1, 0, 1,
-0.7136006, 1.192628, -2.426268, 0.5607843, 1, 0, 1,
-0.7077169, 0.03719288, -1.090776, 0.5529412, 1, 0, 1,
-0.7056799, -0.04024078, -3.872551, 0.5490196, 1, 0, 1,
-0.7035177, -0.3469157, -1.948353, 0.5411765, 1, 0, 1,
-0.7029653, 0.208486, -1.87161, 0.5372549, 1, 0, 1,
-0.7026928, -0.7549056, -0.4051934, 0.5294118, 1, 0, 1,
-0.700622, -0.8528545, -3.477915, 0.5254902, 1, 0, 1,
-0.6847143, -1.837261, -1.65215, 0.5176471, 1, 0, 1,
-0.6843656, 0.0368991, -0.6894081, 0.5137255, 1, 0, 1,
-0.6834939, 0.5317941, -1.399021, 0.5058824, 1, 0, 1,
-0.6810986, 0.1032455, -1.230299, 0.5019608, 1, 0, 1,
-0.6784634, 0.04890902, -1.617139, 0.4941176, 1, 0, 1,
-0.6770918, -0.7706832, -1.538412, 0.4862745, 1, 0, 1,
-0.6731359, 0.9642858, -1.700822, 0.4823529, 1, 0, 1,
-0.6701895, 0.3968589, -2.204946, 0.4745098, 1, 0, 1,
-0.6661435, -0.7744941, -2.482414, 0.4705882, 1, 0, 1,
-0.6644254, 0.9020528, -0.8629771, 0.4627451, 1, 0, 1,
-0.6623917, -0.5764899, -3.147151, 0.4588235, 1, 0, 1,
-0.6590293, 1.652693, 0.2712906, 0.4509804, 1, 0, 1,
-0.6500646, -1.093329, -2.296676, 0.4470588, 1, 0, 1,
-0.6497961, 1.416615, 0.4764352, 0.4392157, 1, 0, 1,
-0.6490115, 0.9507627, -0.5436288, 0.4352941, 1, 0, 1,
-0.6456394, -0.2381661, 1.176497, 0.427451, 1, 0, 1,
-0.6421821, -1.386437, -2.439035, 0.4235294, 1, 0, 1,
-0.6415324, 0.8857654, 0.6561042, 0.4156863, 1, 0, 1,
-0.6403912, 0.3213347, -1.362835, 0.4117647, 1, 0, 1,
-0.6379219, -0.9688034, -1.889767, 0.4039216, 1, 0, 1,
-0.634995, 0.2454045, -0.9553066, 0.3960784, 1, 0, 1,
-0.6333075, -0.3349025, -2.012175, 0.3921569, 1, 0, 1,
-0.6242494, 0.8440514, 0.3831455, 0.3843137, 1, 0, 1,
-0.6146642, 1.63632, -2.382681, 0.3803922, 1, 0, 1,
-0.6111416, -0.3525129, -2.064251, 0.372549, 1, 0, 1,
-0.6104496, 0.09823988, -1.660566, 0.3686275, 1, 0, 1,
-0.6097891, 0.2057085, -0.01841308, 0.3607843, 1, 0, 1,
-0.6019328, 0.7808049, 0.4980356, 0.3568628, 1, 0, 1,
-0.6003977, -0.2868029, -0.6819172, 0.3490196, 1, 0, 1,
-0.5998895, -0.2767256, -0.6417341, 0.345098, 1, 0, 1,
-0.5938379, 0.6322308, -1.015749, 0.3372549, 1, 0, 1,
-0.5872943, -0.8703545, -3.4564, 0.3333333, 1, 0, 1,
-0.5870068, 1.129826, 0.04076046, 0.3254902, 1, 0, 1,
-0.5853137, 0.740028, -0.2045946, 0.3215686, 1, 0, 1,
-0.576408, -0.6825552, -3.310738, 0.3137255, 1, 0, 1,
-0.5686309, 1.505435, -1.296217, 0.3098039, 1, 0, 1,
-0.5583171, 0.3492406, -1.060825, 0.3019608, 1, 0, 1,
-0.5571963, -0.8574935, -2.502586, 0.2941177, 1, 0, 1,
-0.557024, -0.7410913, -1.401185, 0.2901961, 1, 0, 1,
-0.5513496, -0.2782796, -3.715214, 0.282353, 1, 0, 1,
-0.5484899, 0.524309, -2.316939, 0.2784314, 1, 0, 1,
-0.5437274, -0.07272637, -2.312574, 0.2705882, 1, 0, 1,
-0.5402057, 1.207682, 0.2349147, 0.2666667, 1, 0, 1,
-0.5400522, 1.082579, 0.07445665, 0.2588235, 1, 0, 1,
-0.5376883, -0.04117911, -1.957141, 0.254902, 1, 0, 1,
-0.5376094, 0.7253572, -1.530945, 0.2470588, 1, 0, 1,
-0.5374998, -1.187876, -2.212021, 0.2431373, 1, 0, 1,
-0.5372971, 1.858178, -2.113232, 0.2352941, 1, 0, 1,
-0.5365273, -1.336285, -1.460463, 0.2313726, 1, 0, 1,
-0.5282346, -0.3643725, -1.216338, 0.2235294, 1, 0, 1,
-0.5264656, -0.4843459, -2.976993, 0.2196078, 1, 0, 1,
-0.5249913, -1.70226, -3.260388, 0.2117647, 1, 0, 1,
-0.5217969, 0.5191167, 1.339835, 0.2078431, 1, 0, 1,
-0.5195507, -0.3142869, -0.5689907, 0.2, 1, 0, 1,
-0.5179664, -0.4367348, -0.4593177, 0.1921569, 1, 0, 1,
-0.5170351, 0.9931049, -1.414922, 0.1882353, 1, 0, 1,
-0.516552, 1.706483, -0.1940446, 0.1803922, 1, 0, 1,
-0.515121, -0.3053424, -1.586843, 0.1764706, 1, 0, 1,
-0.5132496, 0.7681125, -1.560642, 0.1686275, 1, 0, 1,
-0.5097083, 0.9263434, 0.2368283, 0.1647059, 1, 0, 1,
-0.5060145, 0.4977902, -1.400046, 0.1568628, 1, 0, 1,
-0.5041703, -2.238984, -4.65891, 0.1529412, 1, 0, 1,
-0.5022624, -2.328789, -2.385635, 0.145098, 1, 0, 1,
-0.499775, 0.8637713, -0.7337297, 0.1411765, 1, 0, 1,
-0.4974167, 1.326671, -0.5517056, 0.1333333, 1, 0, 1,
-0.4947695, 0.5780023, -1.924244, 0.1294118, 1, 0, 1,
-0.4879839, 1.182926, -0.0508975, 0.1215686, 1, 0, 1,
-0.4862437, -0.3707452, -1.554691, 0.1176471, 1, 0, 1,
-0.4861099, 0.5450284, 0.1282643, 0.1098039, 1, 0, 1,
-0.4858862, 0.9957169, -0.5174751, 0.1058824, 1, 0, 1,
-0.4839577, -0.1766752, -1.069957, 0.09803922, 1, 0, 1,
-0.4828813, 0.6501471, 0.3930303, 0.09019608, 1, 0, 1,
-0.4794679, -0.9849238, -1.131602, 0.08627451, 1, 0, 1,
-0.4792977, 1.255654, -1.455609, 0.07843138, 1, 0, 1,
-0.4781493, 0.6913536, -1.026479, 0.07450981, 1, 0, 1,
-0.4764062, 1.205423, -1.246524, 0.06666667, 1, 0, 1,
-0.4719555, 0.6953264, 0.433644, 0.0627451, 1, 0, 1,
-0.4717092, -0.3616244, -1.540262, 0.05490196, 1, 0, 1,
-0.4691702, 0.001968319, -2.269937, 0.05098039, 1, 0, 1,
-0.4648101, 0.3196762, -0.0811822, 0.04313726, 1, 0, 1,
-0.4616039, -0.3199174, -1.61663, 0.03921569, 1, 0, 1,
-0.4604886, 1.712129, -0.8203656, 0.03137255, 1, 0, 1,
-0.460211, 0.317182, -1.698277, 0.02745098, 1, 0, 1,
-0.4470679, 0.7203029, -0.1775156, 0.01960784, 1, 0, 1,
-0.445084, 1.616418, -0.9663836, 0.01568628, 1, 0, 1,
-0.438711, 1.83524, -1.909557, 0.007843138, 1, 0, 1,
-0.4374847, -0.8580878, -3.741726, 0.003921569, 1, 0, 1,
-0.4258929, -0.9854738, -2.67838, 0, 1, 0.003921569, 1,
-0.4250986, 1.582449, 0.0297679, 0, 1, 0.01176471, 1,
-0.4219746, -0.5873913, -3.854285, 0, 1, 0.01568628, 1,
-0.4214536, -1.037967, -4.052598, 0, 1, 0.02352941, 1,
-0.419556, -0.9834431, -3.307443, 0, 1, 0.02745098, 1,
-0.4178437, 0.4267883, -1.518401, 0, 1, 0.03529412, 1,
-0.4166258, -0.04156328, -1.306076, 0, 1, 0.03921569, 1,
-0.4125732, 1.541789, -0.9161462, 0, 1, 0.04705882, 1,
-0.4111618, -1.465446, -3.075086, 0, 1, 0.05098039, 1,
-0.4065412, 0.399631, -1.119845, 0, 1, 0.05882353, 1,
-0.4058133, -0.7076801, -2.108618, 0, 1, 0.0627451, 1,
-0.4044883, -0.8492569, -2.108759, 0, 1, 0.07058824, 1,
-0.4004444, -0.03744034, -1.250946, 0, 1, 0.07450981, 1,
-0.3975599, -1.070265, -3.849713, 0, 1, 0.08235294, 1,
-0.3904204, -1.015641, -0.9872918, 0, 1, 0.08627451, 1,
-0.3838447, -0.01735968, -0.8961744, 0, 1, 0.09411765, 1,
-0.3816082, 1.317773, 1.259175, 0, 1, 0.1019608, 1,
-0.3795559, -1.190262, -3.404806, 0, 1, 0.1058824, 1,
-0.3726218, -0.5835328, -3.769357, 0, 1, 0.1137255, 1,
-0.370499, -0.2670784, -2.438971, 0, 1, 0.1176471, 1,
-0.3686011, -0.5495918, -2.68771, 0, 1, 0.1254902, 1,
-0.3668572, 0.7806237, -0.4119605, 0, 1, 0.1294118, 1,
-0.363659, -2.277479, -3.614804, 0, 1, 0.1372549, 1,
-0.3606353, 1.277044, 1.246885, 0, 1, 0.1411765, 1,
-0.3557662, -0.8878326, -3.320622, 0, 1, 0.1490196, 1,
-0.3537591, 0.5117618, -0.9608062, 0, 1, 0.1529412, 1,
-0.3500004, -0.05552998, -3.353958, 0, 1, 0.1607843, 1,
-0.3475501, 0.4937087, -0.239459, 0, 1, 0.1647059, 1,
-0.3472968, 0.933469, -2.93332, 0, 1, 0.172549, 1,
-0.3467371, 0.5219774, -1.923299, 0, 1, 0.1764706, 1,
-0.3467241, 0.9674775, -0.5142997, 0, 1, 0.1843137, 1,
-0.3448879, 0.6872814, -0.8207123, 0, 1, 0.1882353, 1,
-0.3430945, -0.5410829, -4.052927, 0, 1, 0.1960784, 1,
-0.3366976, 0.1045152, -0.8928233, 0, 1, 0.2039216, 1,
-0.3363165, -0.03520082, -2.739697, 0, 1, 0.2078431, 1,
-0.3336805, -0.4257224, -0.8923462, 0, 1, 0.2156863, 1,
-0.3312567, -2.257208, -2.535339, 0, 1, 0.2196078, 1,
-0.3306493, -0.6330176, -1.657741, 0, 1, 0.227451, 1,
-0.3291279, -1.666721, -2.595586, 0, 1, 0.2313726, 1,
-0.3206345, -0.7110612, -3.566314, 0, 1, 0.2392157, 1,
-0.3178882, -1.217033, -1.958732, 0, 1, 0.2431373, 1,
-0.3165203, 0.04817506, -0.6493294, 0, 1, 0.2509804, 1,
-0.3138411, 0.379457, -1.465256, 0, 1, 0.254902, 1,
-0.3132601, -0.3863968, -2.276997, 0, 1, 0.2627451, 1,
-0.3111607, 0.003132119, -1.264647, 0, 1, 0.2666667, 1,
-0.3069333, -0.01691682, -1.921217, 0, 1, 0.2745098, 1,
-0.3047881, -0.7580845, -4.198493, 0, 1, 0.2784314, 1,
-0.3044423, -0.421533, -2.295304, 0, 1, 0.2862745, 1,
-0.3024595, -1.171357, -2.547904, 0, 1, 0.2901961, 1,
-0.2999002, -1.424349, -2.989956, 0, 1, 0.2980392, 1,
-0.2916167, 0.375248, -0.320182, 0, 1, 0.3058824, 1,
-0.286526, 0.07134943, -2.932463, 0, 1, 0.3098039, 1,
-0.2728506, -0.4467382, -1.172824, 0, 1, 0.3176471, 1,
-0.2687932, 0.963923, 0.1030624, 0, 1, 0.3215686, 1,
-0.2652303, -0.8717442, -1.220914, 0, 1, 0.3294118, 1,
-0.2641911, 0.6231452, -0.2092786, 0, 1, 0.3333333, 1,
-0.2591634, 0.1604639, -1.385367, 0, 1, 0.3411765, 1,
-0.251377, 0.4125472, -0.2389948, 0, 1, 0.345098, 1,
-0.2510485, -0.9106669, -2.77124, 0, 1, 0.3529412, 1,
-0.2506407, 0.5086328, -0.6483274, 0, 1, 0.3568628, 1,
-0.2441544, -0.8672256, -1.678536, 0, 1, 0.3647059, 1,
-0.2430112, 0.6087363, 0.8052912, 0, 1, 0.3686275, 1,
-0.2419608, -0.174718, -2.587126, 0, 1, 0.3764706, 1,
-0.2412533, 1.216009, 0.7462084, 0, 1, 0.3803922, 1,
-0.2405978, -2.099617, -3.547789, 0, 1, 0.3882353, 1,
-0.2401897, -1.276607, -1.813293, 0, 1, 0.3921569, 1,
-0.2346711, -0.8504606, -2.930928, 0, 1, 0.4, 1,
-0.2307998, 0.1598122, 0.9144125, 0, 1, 0.4078431, 1,
-0.2226637, -1.075185, -1.655596, 0, 1, 0.4117647, 1,
-0.222647, -0.4269983, -1.822951, 0, 1, 0.4196078, 1,
-0.2115759, 0.950654, 0.6619785, 0, 1, 0.4235294, 1,
-0.2092736, -0.2809336, -0.9647344, 0, 1, 0.4313726, 1,
-0.2049392, 0.6510206, -0.326786, 0, 1, 0.4352941, 1,
-0.2013579, -0.03825577, 0.1922613, 0, 1, 0.4431373, 1,
-0.2012463, -0.6292896, -4.137676, 0, 1, 0.4470588, 1,
-0.1988928, 1.785441, 0.3441564, 0, 1, 0.454902, 1,
-0.1958882, 0.2296728, -0.612936, 0, 1, 0.4588235, 1,
-0.1925727, 1.394161, -0.1302596, 0, 1, 0.4666667, 1,
-0.1918583, -0.5798557, -4.311029, 0, 1, 0.4705882, 1,
-0.1880571, -0.199675, -2.143261, 0, 1, 0.4784314, 1,
-0.1869416, -0.8134048, -2.037786, 0, 1, 0.4823529, 1,
-0.185332, 0.5719801, -1.049278, 0, 1, 0.4901961, 1,
-0.1831354, -0.8373993, -5.21964, 0, 1, 0.4941176, 1,
-0.1820076, -0.5208135, -2.905839, 0, 1, 0.5019608, 1,
-0.181361, 0.1110229, -1.406653, 0, 1, 0.509804, 1,
-0.1805065, 0.00219806, -0.6756313, 0, 1, 0.5137255, 1,
-0.1766335, -0.8104988, -2.819173, 0, 1, 0.5215687, 1,
-0.1735412, 0.0441737, -0.519805, 0, 1, 0.5254902, 1,
-0.172324, -0.1362758, -3.198405, 0, 1, 0.5333334, 1,
-0.1714042, 0.1186289, -2.526974, 0, 1, 0.5372549, 1,
-0.165524, -1.208276, -2.924443, 0, 1, 0.5450981, 1,
-0.1653033, -0.3490344, -2.57385, 0, 1, 0.5490196, 1,
-0.1587323, 0.163895, 0.0007989538, 0, 1, 0.5568628, 1,
-0.1574809, -0.7151754, -2.773737, 0, 1, 0.5607843, 1,
-0.1573704, 0.93258, -0.7257022, 0, 1, 0.5686275, 1,
-0.1546184, -0.1756909, -0.4745242, 0, 1, 0.572549, 1,
-0.1537704, -0.4183401, -1.12571, 0, 1, 0.5803922, 1,
-0.1500325, 0.6861611, 0.6702917, 0, 1, 0.5843138, 1,
-0.1494894, 0.6419015, -1.170138, 0, 1, 0.5921569, 1,
-0.1484569, -0.8120174, -4.570508, 0, 1, 0.5960785, 1,
-0.1482099, 1.303858, 0.3744815, 0, 1, 0.6039216, 1,
-0.1468682, 0.830395, -0.78444, 0, 1, 0.6117647, 1,
-0.1432982, 2.275369, 0.207103, 0, 1, 0.6156863, 1,
-0.1400909, 0.571078, -0.01238631, 0, 1, 0.6235294, 1,
-0.1388389, -0.8830821, -2.742682, 0, 1, 0.627451, 1,
-0.1386693, -0.4703831, -2.1536, 0, 1, 0.6352941, 1,
-0.137266, -0.8446847, -5.013541, 0, 1, 0.6392157, 1,
-0.1344851, 0.4283803, 0.4813904, 0, 1, 0.6470588, 1,
-0.13424, 0.4110167, -0.5283722, 0, 1, 0.6509804, 1,
-0.1318226, 1.072849, 1.640587, 0, 1, 0.6588235, 1,
-0.1293889, 0.3983086, 0.2105893, 0, 1, 0.6627451, 1,
-0.1284201, 0.3875111, -0.5891643, 0, 1, 0.6705883, 1,
-0.1241524, 1.251788, -0.3250853, 0, 1, 0.6745098, 1,
-0.1240471, 1.161138, 0.114301, 0, 1, 0.682353, 1,
-0.1229504, 0.5304394, -1.181513, 0, 1, 0.6862745, 1,
-0.12287, 0.001936156, -1.232321, 0, 1, 0.6941177, 1,
-0.1226394, -0.04054998, -1.748955, 0, 1, 0.7019608, 1,
-0.1225604, -0.7773144, -2.783943, 0, 1, 0.7058824, 1,
-0.1214265, 0.2302079, 1.322093, 0, 1, 0.7137255, 1,
-0.121028, -0.4689732, -1.742838, 0, 1, 0.7176471, 1,
-0.1181859, -1.60635, -2.894698, 0, 1, 0.7254902, 1,
-0.1172567, 0.8879561, -0.7105639, 0, 1, 0.7294118, 1,
-0.1169674, 2.164271, -0.7312353, 0, 1, 0.7372549, 1,
-0.1137341, -1.226186, -2.604357, 0, 1, 0.7411765, 1,
-0.1108965, -0.247427, -3.279717, 0, 1, 0.7490196, 1,
-0.1098137, -0.2019989, -1.659018, 0, 1, 0.7529412, 1,
-0.107589, 0.1046657, -1.194065, 0, 1, 0.7607843, 1,
-0.1053398, 0.6963667, 2.412088, 0, 1, 0.7647059, 1,
-0.1042291, 0.5020386, 0.06481086, 0, 1, 0.772549, 1,
-0.1027838, 0.05477637, -2.139598, 0, 1, 0.7764706, 1,
-0.102402, 3.043919, -0.322347, 0, 1, 0.7843137, 1,
-0.09921759, -0.5756971, -3.358908, 0, 1, 0.7882353, 1,
-0.09771523, 0.449326, 0.767803, 0, 1, 0.7960784, 1,
-0.09605072, -1.20208, -2.509089, 0, 1, 0.8039216, 1,
-0.08611773, -0.9502126, -4.830564, 0, 1, 0.8078431, 1,
-0.08362126, -0.6524195, -3.293719, 0, 1, 0.8156863, 1,
-0.08242037, -1.450664, -2.132238, 0, 1, 0.8196079, 1,
-0.08026287, 1.473532, 0.2023983, 0, 1, 0.827451, 1,
-0.07698042, 0.08052413, 1.058124, 0, 1, 0.8313726, 1,
-0.07407894, 0.1139933, -0.2436136, 0, 1, 0.8392157, 1,
-0.07154365, -0.09346253, -3.249632, 0, 1, 0.8431373, 1,
-0.06977485, -1.543234, -4.249211, 0, 1, 0.8509804, 1,
-0.06578799, -0.6232159, -3.600206, 0, 1, 0.854902, 1,
-0.06497976, -0.8419139, -1.479319, 0, 1, 0.8627451, 1,
-0.06384152, -0.4062265, 0.03666843, 0, 1, 0.8666667, 1,
-0.05560964, 0.5232042, 0.5606698, 0, 1, 0.8745098, 1,
-0.05213118, -0.01442699, -2.814848, 0, 1, 0.8784314, 1,
-0.04046411, -1.086844, -4.863171, 0, 1, 0.8862745, 1,
-0.0333135, 0.5762386, 1.719114, 0, 1, 0.8901961, 1,
-0.03264721, -0.3422273, -1.324226, 0, 1, 0.8980392, 1,
-0.02495507, 0.2999704, -0.4164849, 0, 1, 0.9058824, 1,
-0.02371992, 0.1775641, 1.585074, 0, 1, 0.9098039, 1,
-0.02318718, -0.110978, -2.590899, 0, 1, 0.9176471, 1,
-0.02269819, 0.494343, -1.352365, 0, 1, 0.9215686, 1,
-0.01907092, -1.295105, -3.32449, 0, 1, 0.9294118, 1,
-0.01882445, 0.9545285, -0.5901381, 0, 1, 0.9333333, 1,
-0.01370379, -0.124698, -3.776318, 0, 1, 0.9411765, 1,
-0.01356311, 1.367701, -1.015524, 0, 1, 0.945098, 1,
-0.005974353, -0.7873861, -2.657571, 0, 1, 0.9529412, 1,
-0.001392401, 1.283022, 0.7578207, 0, 1, 0.9568627, 1,
0.01542416, -0.0001691139, 1.327637, 0, 1, 0.9647059, 1,
0.02073442, -0.4092849, 0.9771352, 0, 1, 0.9686275, 1,
0.0212232, -0.4691081, 3.3222, 0, 1, 0.9764706, 1,
0.02586638, -1.360649, 2.028876, 0, 1, 0.9803922, 1,
0.02753311, 2.195292, 0.8107429, 0, 1, 0.9882353, 1,
0.03633725, 1.314641, 1.509872, 0, 1, 0.9921569, 1,
0.04075366, 1.048457, 0.6835436, 0, 1, 1, 1,
0.04090742, 1.09279, 1.868183, 0, 0.9921569, 1, 1,
0.04123713, 2.072893, -0.5751259, 0, 0.9882353, 1, 1,
0.04594972, -0.03996547, 2.156374, 0, 0.9803922, 1, 1,
0.0464249, -0.5562626, 2.7755, 0, 0.9764706, 1, 1,
0.04813949, 0.917809, -0.2616734, 0, 0.9686275, 1, 1,
0.05446666, 0.6999565, -1.392175, 0, 0.9647059, 1, 1,
0.05708277, 0.02402437, 1.855847, 0, 0.9568627, 1, 1,
0.05813637, 1.882846, 0.4546246, 0, 0.9529412, 1, 1,
0.06524619, -1.022451, 4.134609, 0, 0.945098, 1, 1,
0.06664614, -0.01486096, 2.109594, 0, 0.9411765, 1, 1,
0.0709888, -0.7573501, 1.58634, 0, 0.9333333, 1, 1,
0.0717391, 0.1571207, -0.22679, 0, 0.9294118, 1, 1,
0.07860619, 2.861032, 1.185831, 0, 0.9215686, 1, 1,
0.08316997, 2.405499, 1.074585, 0, 0.9176471, 1, 1,
0.08743379, 1.162714, 0.9564059, 0, 0.9098039, 1, 1,
0.08865859, -1.772612, 3.154101, 0, 0.9058824, 1, 1,
0.09036564, 0.9919718, -0.227617, 0, 0.8980392, 1, 1,
0.09095711, 0.307268, 0.2876317, 0, 0.8901961, 1, 1,
0.0937802, -0.1456628, 0.7022204, 0, 0.8862745, 1, 1,
0.09933738, 1.394726, -0.2332827, 0, 0.8784314, 1, 1,
0.1004472, 1.258902, -0.6648653, 0, 0.8745098, 1, 1,
0.1078156, 0.6875352, -0.04869133, 0, 0.8666667, 1, 1,
0.1119454, -0.2355946, 2.922323, 0, 0.8627451, 1, 1,
0.1151827, -0.8276269, 3.746026, 0, 0.854902, 1, 1,
0.1164875, -0.827167, 2.860939, 0, 0.8509804, 1, 1,
0.1256529, -1.382154, 3.072588, 0, 0.8431373, 1, 1,
0.1268819, 0.1028329, 1.030535, 0, 0.8392157, 1, 1,
0.1271564, -0.7889744, 2.724851, 0, 0.8313726, 1, 1,
0.1282414, -0.6351684, 2.726219, 0, 0.827451, 1, 1,
0.128639, -0.2988091, 3.449445, 0, 0.8196079, 1, 1,
0.1286738, 0.2456055, 1.435924, 0, 0.8156863, 1, 1,
0.1364803, -1.13499, 2.044345, 0, 0.8078431, 1, 1,
0.1369962, -0.6298817, 1.848246, 0, 0.8039216, 1, 1,
0.1373066, -0.9973358, 3.787924, 0, 0.7960784, 1, 1,
0.1383387, 0.2882622, 2.31636, 0, 0.7882353, 1, 1,
0.1421592, -0.2277943, 2.927868, 0, 0.7843137, 1, 1,
0.1437951, -0.4014983, 1.899989, 0, 0.7764706, 1, 1,
0.1473356, -2.176815, 4.120805, 0, 0.772549, 1, 1,
0.1502073, 1.449801, -0.5270885, 0, 0.7647059, 1, 1,
0.1535597, 1.736736, 1.81894, 0, 0.7607843, 1, 1,
0.154448, -1.040025, 2.825247, 0, 0.7529412, 1, 1,
0.1554124, -1.578698, 3.258557, 0, 0.7490196, 1, 1,
0.1559478, 0.2142599, 1.162428, 0, 0.7411765, 1, 1,
0.1561483, 0.2815028, -1.103608, 0, 0.7372549, 1, 1,
0.1583162, 1.494988, 1.990543, 0, 0.7294118, 1, 1,
0.1588831, -0.4425245, 2.818627, 0, 0.7254902, 1, 1,
0.1602064, -1.286947, 2.350759, 0, 0.7176471, 1, 1,
0.1656646, 1.119495, 0.09031229, 0, 0.7137255, 1, 1,
0.16627, -0.2891077, 3.522405, 0, 0.7058824, 1, 1,
0.1759408, 0.03250676, 1.613227, 0, 0.6980392, 1, 1,
0.1786833, -0.7449616, 2.571644, 0, 0.6941177, 1, 1,
0.1891491, 0.2195368, 0.7103364, 0, 0.6862745, 1, 1,
0.1895869, -2.513745, 3.74741, 0, 0.682353, 1, 1,
0.1905161, 0.694782, -2.128468, 0, 0.6745098, 1, 1,
0.1933982, -0.5414481, 3.784091, 0, 0.6705883, 1, 1,
0.1950225, -0.5901786, 4.615344, 0, 0.6627451, 1, 1,
0.1973138, -0.8006637, 1.373721, 0, 0.6588235, 1, 1,
0.1980319, 1.516326, 0.3567708, 0, 0.6509804, 1, 1,
0.1997741, 1.65449, -0.3445071, 0, 0.6470588, 1, 1,
0.2044727, -0.7425175, 1.598642, 0, 0.6392157, 1, 1,
0.2054946, -0.2345064, 2.102416, 0, 0.6352941, 1, 1,
0.2058298, 0.7669149, -2.95693, 0, 0.627451, 1, 1,
0.2091379, -1.337869, 2.565152, 0, 0.6235294, 1, 1,
0.2123656, 0.8198559, 0.2892821, 0, 0.6156863, 1, 1,
0.2139475, 0.4027697, -1.362197, 0, 0.6117647, 1, 1,
0.2248127, -1.140346, 2.269358, 0, 0.6039216, 1, 1,
0.2256081, 2.300784, -0.8516417, 0, 0.5960785, 1, 1,
0.2257902, 0.4483065, 1.379135, 0, 0.5921569, 1, 1,
0.2354834, -0.330356, 2.709336, 0, 0.5843138, 1, 1,
0.2376133, 2.363294, -0.3299518, 0, 0.5803922, 1, 1,
0.2376663, -0.3084026, 3.5948, 0, 0.572549, 1, 1,
0.238007, 0.7092612, -1.018207, 0, 0.5686275, 1, 1,
0.2385349, -1.038907, 2.302644, 0, 0.5607843, 1, 1,
0.2387782, 0.3399265, -0.4970953, 0, 0.5568628, 1, 1,
0.2391955, 2.350776, 0.6327346, 0, 0.5490196, 1, 1,
0.2394649, -1.378268, 2.631038, 0, 0.5450981, 1, 1,
0.2443285, 0.3228343, -0.3939317, 0, 0.5372549, 1, 1,
0.2471106, 0.8507174, 0.8998504, 0, 0.5333334, 1, 1,
0.2489376, 0.04078295, 1.425513, 0, 0.5254902, 1, 1,
0.2490467, 0.5043277, 0.1162329, 0, 0.5215687, 1, 1,
0.2493564, 1.26304, -0.8891394, 0, 0.5137255, 1, 1,
0.2501117, -0.06896289, 2.266804, 0, 0.509804, 1, 1,
0.2504238, -0.3291325, 1.548319, 0, 0.5019608, 1, 1,
0.2549615, 1.06589, -0.3563415, 0, 0.4941176, 1, 1,
0.2622401, -1.914401, 3.099727, 0, 0.4901961, 1, 1,
0.2625047, -0.6030958, 2.514971, 0, 0.4823529, 1, 1,
0.2662128, -0.396203, 0.380271, 0, 0.4784314, 1, 1,
0.2726792, 1.365533, -0.1860325, 0, 0.4705882, 1, 1,
0.2729875, 0.002949808, 1.125968, 0, 0.4666667, 1, 1,
0.2755102, 1.08989, 1.027876, 0, 0.4588235, 1, 1,
0.2766156, 0.2836542, 0.8419719, 0, 0.454902, 1, 1,
0.2772939, 0.2173907, 0.8337957, 0, 0.4470588, 1, 1,
0.278071, -0.2734308, 2.48951, 0, 0.4431373, 1, 1,
0.2784674, -0.9807798, 2.764711, 0, 0.4352941, 1, 1,
0.2808765, 1.123724, -1.078575, 0, 0.4313726, 1, 1,
0.2840534, -0.2412828, 4.308185, 0, 0.4235294, 1, 1,
0.2873248, -1.165918, 2.278349, 0, 0.4196078, 1, 1,
0.2924952, 0.9127241, -1.573618, 0, 0.4117647, 1, 1,
0.2933779, 1.178608, -1.150603, 0, 0.4078431, 1, 1,
0.3007623, 0.6067376, 0.9611281, 0, 0.4, 1, 1,
0.3032263, 1.323988, 0.516919, 0, 0.3921569, 1, 1,
0.306228, 0.2657764, 0.848143, 0, 0.3882353, 1, 1,
0.3066065, -0.653644, 0.8190741, 0, 0.3803922, 1, 1,
0.307202, 0.07564587, 2.220409, 0, 0.3764706, 1, 1,
0.3077446, -1.231093, 1.902666, 0, 0.3686275, 1, 1,
0.3109628, -0.4497493, 1.64302, 0, 0.3647059, 1, 1,
0.3111763, 1.072272, 1.287017, 0, 0.3568628, 1, 1,
0.3120832, 0.2108242, 1.923709, 0, 0.3529412, 1, 1,
0.3141532, 0.791644, 0.3989696, 0, 0.345098, 1, 1,
0.3181899, -1.422628, 3.482161, 0, 0.3411765, 1, 1,
0.3182854, -0.0304777, 0.4603474, 0, 0.3333333, 1, 1,
0.3183055, 1.691256, -0.7513454, 0, 0.3294118, 1, 1,
0.325975, 0.976633, 0.4541607, 0, 0.3215686, 1, 1,
0.328512, -1.6172, 5.651421, 0, 0.3176471, 1, 1,
0.3287475, -0.5848989, 3.207233, 0, 0.3098039, 1, 1,
0.3296597, 1.083786, 0.7834502, 0, 0.3058824, 1, 1,
0.3328186, 1.579819, -0.8295457, 0, 0.2980392, 1, 1,
0.3384915, -0.9158242, 2.094492, 0, 0.2901961, 1, 1,
0.3441043, 0.6072891, 0.06483263, 0, 0.2862745, 1, 1,
0.3486631, 0.4063554, 1.136649, 0, 0.2784314, 1, 1,
0.3491537, -0.3878224, 2.39148, 0, 0.2745098, 1, 1,
0.3491826, -1.788928, 4.235685, 0, 0.2666667, 1, 1,
0.3517143, -1.161794, 4.164837, 0, 0.2627451, 1, 1,
0.3561537, -0.2817699, 2.233985, 0, 0.254902, 1, 1,
0.3588425, -1.793538, 1.9981, 0, 0.2509804, 1, 1,
0.3603683, 0.4487604, 0.766606, 0, 0.2431373, 1, 1,
0.3605255, 0.5059835, 1.276852, 0, 0.2392157, 1, 1,
0.3618688, 0.474737, 1.906732, 0, 0.2313726, 1, 1,
0.3623409, 0.664445, -0.01003509, 0, 0.227451, 1, 1,
0.3637204, -0.6645135, 3.149746, 0, 0.2196078, 1, 1,
0.3659537, -0.1888035, 2.724795, 0, 0.2156863, 1, 1,
0.3665275, 0.4638371, 0.7506099, 0, 0.2078431, 1, 1,
0.3678646, -0.4557461, 1.039657, 0, 0.2039216, 1, 1,
0.36915, -0.1168179, 1.40002, 0, 0.1960784, 1, 1,
0.3781164, 1.280534, 1.034044, 0, 0.1882353, 1, 1,
0.3817689, -2.300052, 4.095998, 0, 0.1843137, 1, 1,
0.3835122, 1.189845, -0.3901161, 0, 0.1764706, 1, 1,
0.3916354, -1.296938, 1.899986, 0, 0.172549, 1, 1,
0.3961893, 1.150802, 0.605402, 0, 0.1647059, 1, 1,
0.3966558, -0.3794598, 3.356302, 0, 0.1607843, 1, 1,
0.3971089, 0.09308948, 2.074079, 0, 0.1529412, 1, 1,
0.3987583, -0.501211, 3.114274, 0, 0.1490196, 1, 1,
0.4029189, -1.093664, 2.051485, 0, 0.1411765, 1, 1,
0.4043926, 1.46785, -1.094748, 0, 0.1372549, 1, 1,
0.4075553, -1.521067, 4.739336, 0, 0.1294118, 1, 1,
0.4123367, -0.2918669, 0.5904294, 0, 0.1254902, 1, 1,
0.4146347, 0.1588682, 2.788488, 0, 0.1176471, 1, 1,
0.4158924, 0.7101009, 2.94149, 0, 0.1137255, 1, 1,
0.4196837, 0.2102753, 0.3294017, 0, 0.1058824, 1, 1,
0.425073, -0.3780895, 2.130833, 0, 0.09803922, 1, 1,
0.4386049, 0.6919075, 1.933462, 0, 0.09411765, 1, 1,
0.4431529, -0.5586349, 2.039724, 0, 0.08627451, 1, 1,
0.4457141, -1.800345, 3.771081, 0, 0.08235294, 1, 1,
0.4463744, -0.836192, 0.1244422, 0, 0.07450981, 1, 1,
0.4514022, -0.3354767, 1.431861, 0, 0.07058824, 1, 1,
0.4519164, -0.538855, 2.930793, 0, 0.0627451, 1, 1,
0.4531105, -0.5756277, 1.767043, 0, 0.05882353, 1, 1,
0.4535471, 0.08769881, 1.256927, 0, 0.05098039, 1, 1,
0.4541262, -0.3832729, 3.533927, 0, 0.04705882, 1, 1,
0.4542758, -1.942939, 1.897573, 0, 0.03921569, 1, 1,
0.4544388, -0.2168396, 2.680098, 0, 0.03529412, 1, 1,
0.4548377, 0.304375, 1.563775, 0, 0.02745098, 1, 1,
0.46144, -0.6025576, 4.175816, 0, 0.02352941, 1, 1,
0.4625826, -1.430843, 3.061168, 0, 0.01568628, 1, 1,
0.4629567, -0.7099523, 1.556095, 0, 0.01176471, 1, 1,
0.4678745, -1.524693, 2.879541, 0, 0.003921569, 1, 1,
0.4701053, -1.699066, 2.56127, 0.003921569, 0, 1, 1,
0.4726504, -1.715748, 1.662314, 0.007843138, 0, 1, 1,
0.4749566, -0.3203119, 2.901378, 0.01568628, 0, 1, 1,
0.477086, 0.3130785, 2.103768, 0.01960784, 0, 1, 1,
0.478533, 0.1647052, 1.757141, 0.02745098, 0, 1, 1,
0.4845978, -1.157244, 3.005147, 0.03137255, 0, 1, 1,
0.4856749, -1.397388, 4.787518, 0.03921569, 0, 1, 1,
0.489691, -0.4111385, 2.740151, 0.04313726, 0, 1, 1,
0.4919243, -2.103758, 2.265604, 0.05098039, 0, 1, 1,
0.4921747, -0.4436969, 3.772227, 0.05490196, 0, 1, 1,
0.4932946, -0.02074101, 0.7120298, 0.0627451, 0, 1, 1,
0.4935695, -2.163058, 3.199688, 0.06666667, 0, 1, 1,
0.5011805, -0.7062966, 4.33348, 0.07450981, 0, 1, 1,
0.5122356, 0.6944094, -2.51686, 0.07843138, 0, 1, 1,
0.51368, 0.1623966, 1.47672, 0.08627451, 0, 1, 1,
0.5157936, 0.7887581, -0.3252493, 0.09019608, 0, 1, 1,
0.5175754, -1.100059, 1.840769, 0.09803922, 0, 1, 1,
0.5195805, -0.7605734, 3.326622, 0.1058824, 0, 1, 1,
0.5205299, -1.13657, 1.379615, 0.1098039, 0, 1, 1,
0.5210491, -0.1813055, 1.226608, 0.1176471, 0, 1, 1,
0.5233638, -0.3529186, 3.437167, 0.1215686, 0, 1, 1,
0.5278755, -0.6127321, 2.420455, 0.1294118, 0, 1, 1,
0.5296249, -0.2577548, 1.767194, 0.1333333, 0, 1, 1,
0.5456721, 0.6923621, 0.7483658, 0.1411765, 0, 1, 1,
0.5512142, -1.34449, 1.800908, 0.145098, 0, 1, 1,
0.5536478, 0.9956763, 1.212529, 0.1529412, 0, 1, 1,
0.5570318, -1.508926, 2.72117, 0.1568628, 0, 1, 1,
0.5634457, 0.09058487, 1.197245, 0.1647059, 0, 1, 1,
0.5637261, 1.203784, 0.9110306, 0.1686275, 0, 1, 1,
0.5639047, 3.292088, 0.467239, 0.1764706, 0, 1, 1,
0.5659032, -1.105272, 4.472347, 0.1803922, 0, 1, 1,
0.5678888, -1.099895, 3.215413, 0.1882353, 0, 1, 1,
0.567924, 0.4895764, 0.3336593, 0.1921569, 0, 1, 1,
0.5691581, -1.535803, 3.714387, 0.2, 0, 1, 1,
0.5726173, -0.02484295, 2.802797, 0.2078431, 0, 1, 1,
0.5760857, -1.583415, 2.154765, 0.2117647, 0, 1, 1,
0.5766132, 1.606534, 0.04741812, 0.2196078, 0, 1, 1,
0.5798281, 0.46574, 1.644076, 0.2235294, 0, 1, 1,
0.5805561, 0.2926628, 2.512377, 0.2313726, 0, 1, 1,
0.5836921, -0.1254776, 1.388527, 0.2352941, 0, 1, 1,
0.5877218, 0.405819, 0.09847143, 0.2431373, 0, 1, 1,
0.5941762, 0.1812684, 3.9935, 0.2470588, 0, 1, 1,
0.5960714, 0.3923292, -0.5658593, 0.254902, 0, 1, 1,
0.5969378, -1.33981, 1.670686, 0.2588235, 0, 1, 1,
0.6009807, -1.437058, 3.032221, 0.2666667, 0, 1, 1,
0.605131, 0.5306743, 2.419842, 0.2705882, 0, 1, 1,
0.6089826, -1.230382, 5.83206, 0.2784314, 0, 1, 1,
0.6118299, 0.7685497, 0.9800095, 0.282353, 0, 1, 1,
0.6126196, 0.5383314, 2.190298, 0.2901961, 0, 1, 1,
0.6155145, 0.8002996, -1.416873, 0.2941177, 0, 1, 1,
0.6163305, 0.2583097, 1.089747, 0.3019608, 0, 1, 1,
0.6181145, 0.1711954, 2.02725, 0.3098039, 0, 1, 1,
0.61953, -0.6447591, 2.823052, 0.3137255, 0, 1, 1,
0.6201723, 0.6074083, -2.10344, 0.3215686, 0, 1, 1,
0.6236203, 1.740773, 1.300125, 0.3254902, 0, 1, 1,
0.6273557, 1.487007, 0.3721927, 0.3333333, 0, 1, 1,
0.6274964, -0.4059428, 1.96507, 0.3372549, 0, 1, 1,
0.6276595, -0.8110878, 2.444075, 0.345098, 0, 1, 1,
0.6373978, 0.01738031, 1.743986, 0.3490196, 0, 1, 1,
0.6374637, -0.6210369, 2.282824, 0.3568628, 0, 1, 1,
0.6399276, 1.219331, 0.7003567, 0.3607843, 0, 1, 1,
0.6605135, -0.1054238, 2.426522, 0.3686275, 0, 1, 1,
0.6619291, -0.4837688, 2.716717, 0.372549, 0, 1, 1,
0.6661946, 0.2481768, 1.063169, 0.3803922, 0, 1, 1,
0.6684175, 0.9756684, 0.7473913, 0.3843137, 0, 1, 1,
0.6698594, 2.798161, -0.7371991, 0.3921569, 0, 1, 1,
0.6759199, 0.9135665, -1.076828, 0.3960784, 0, 1, 1,
0.6798086, -1.337025, 1.776422, 0.4039216, 0, 1, 1,
0.6816092, 0.978075, 1.487668, 0.4117647, 0, 1, 1,
0.6830387, -0.8991038, 3.014262, 0.4156863, 0, 1, 1,
0.686464, 1.169074, 1.149091, 0.4235294, 0, 1, 1,
0.6871347, -1.677183, 1.875299, 0.427451, 0, 1, 1,
0.6931385, -0.1388777, 0.9130058, 0.4352941, 0, 1, 1,
0.6997671, -1.224855, 1.517629, 0.4392157, 0, 1, 1,
0.6999281, 0.4948655, -0.0492005, 0.4470588, 0, 1, 1,
0.7006688, -0.1668526, 2.718227, 0.4509804, 0, 1, 1,
0.7016673, -0.5481695, 1.723674, 0.4588235, 0, 1, 1,
0.7034218, -0.1574497, 1.782508, 0.4627451, 0, 1, 1,
0.7068144, 0.02497306, 1.505827, 0.4705882, 0, 1, 1,
0.7121021, -0.1312031, 2.378277, 0.4745098, 0, 1, 1,
0.713236, 1.21829, 2.345228, 0.4823529, 0, 1, 1,
0.7194299, 0.6565106, 1.944932, 0.4862745, 0, 1, 1,
0.7236978, 0.1404647, 2.055387, 0.4941176, 0, 1, 1,
0.7251121, -0.2814505, 2.068816, 0.5019608, 0, 1, 1,
0.7294649, 0.8276532, 1.778448, 0.5058824, 0, 1, 1,
0.7325205, 1.192845, -0.02111468, 0.5137255, 0, 1, 1,
0.7336756, -0.8056642, 1.883982, 0.5176471, 0, 1, 1,
0.7339949, -1.676715, 3.95926, 0.5254902, 0, 1, 1,
0.7388565, 0.9615508, 1.472423, 0.5294118, 0, 1, 1,
0.7419663, -0.2618136, 1.893877, 0.5372549, 0, 1, 1,
0.7460775, -2.229603, -0.0215464, 0.5411765, 0, 1, 1,
0.7496558, 0.8673654, 0.04966588, 0.5490196, 0, 1, 1,
0.7502284, 1.454833, 0.2270202, 0.5529412, 0, 1, 1,
0.7521414, 0.1176363, -0.3002604, 0.5607843, 0, 1, 1,
0.7545097, -0.1104738, 1.764756, 0.5647059, 0, 1, 1,
0.764173, -0.7022848, 0.862784, 0.572549, 0, 1, 1,
0.7644382, 1.243611, 1.418847, 0.5764706, 0, 1, 1,
0.7690073, 0.3924568, 2.918567, 0.5843138, 0, 1, 1,
0.769692, -0.1113039, 2.488786, 0.5882353, 0, 1, 1,
0.7757513, 2.012259, 0.5674136, 0.5960785, 0, 1, 1,
0.7774485, 0.1129835, 2.477751, 0.6039216, 0, 1, 1,
0.7874538, -1.177219, 3.934989, 0.6078432, 0, 1, 1,
0.7894249, -0.121909, 2.182884, 0.6156863, 0, 1, 1,
0.7909504, 0.5025188, 0.3962165, 0.6196079, 0, 1, 1,
0.8005458, -1.157731, 3.041147, 0.627451, 0, 1, 1,
0.8039032, 0.2288351, 0.426332, 0.6313726, 0, 1, 1,
0.8043115, -1.041099, 1.613541, 0.6392157, 0, 1, 1,
0.805316, -0.1333805, 1.253278, 0.6431373, 0, 1, 1,
0.8065347, -1.066023, 2.445379, 0.6509804, 0, 1, 1,
0.8081805, 0.01325195, 1.534924, 0.654902, 0, 1, 1,
0.8214754, 0.2151979, 1.290418, 0.6627451, 0, 1, 1,
0.8218652, -0.701609, 3.05449, 0.6666667, 0, 1, 1,
0.8219905, -0.4368528, 3.049193, 0.6745098, 0, 1, 1,
0.825658, -1.943477, 2.919312, 0.6784314, 0, 1, 1,
0.8265054, 0.9124707, 0.8210142, 0.6862745, 0, 1, 1,
0.8281683, 1.099923, -0.7519041, 0.6901961, 0, 1, 1,
0.8286579, 0.4317975, 0.5292328, 0.6980392, 0, 1, 1,
0.8300489, 2.052558, -0.5381059, 0.7058824, 0, 1, 1,
0.8349913, -0.4200113, 2.911477, 0.7098039, 0, 1, 1,
0.844938, 1.304779, 0.5677258, 0.7176471, 0, 1, 1,
0.8458034, -1.236366, 3.154963, 0.7215686, 0, 1, 1,
0.8458139, -1.100891, 3.742561, 0.7294118, 0, 1, 1,
0.848983, -0.2850056, 2.000571, 0.7333333, 0, 1, 1,
0.8508576, 0.1597162, 2.556834, 0.7411765, 0, 1, 1,
0.8551695, 0.4103167, 2.218875, 0.7450981, 0, 1, 1,
0.859988, -1.097701, 2.634915, 0.7529412, 0, 1, 1,
0.8657252, 0.1216848, 1.339032, 0.7568628, 0, 1, 1,
0.8782575, -0.9010623, 2.073852, 0.7647059, 0, 1, 1,
0.8839563, -1.13019, 2.995798, 0.7686275, 0, 1, 1,
0.8889185, 0.003740625, 3.126299, 0.7764706, 0, 1, 1,
0.9054519, 0.5239436, 3.278648, 0.7803922, 0, 1, 1,
0.9075534, 0.5869861, 0.5825704, 0.7882353, 0, 1, 1,
0.9105211, -0.7999458, 3.513731, 0.7921569, 0, 1, 1,
0.9251359, 0.02500214, 0.5164989, 0.8, 0, 1, 1,
0.9257613, -0.9816343, 1.884192, 0.8078431, 0, 1, 1,
0.9269063, 1.273928, 0.6472175, 0.8117647, 0, 1, 1,
0.9280246, 0.4488405, 0.9593675, 0.8196079, 0, 1, 1,
0.9284148, -0.6557772, 1.520848, 0.8235294, 0, 1, 1,
0.9366443, -0.4947887, 3.038177, 0.8313726, 0, 1, 1,
0.9374614, -1.787202, 2.175102, 0.8352941, 0, 1, 1,
0.9380566, 0.06856161, 3.289423, 0.8431373, 0, 1, 1,
0.9403329, -2.164696, 2.661587, 0.8470588, 0, 1, 1,
0.9450527, -0.648992, 3.761435, 0.854902, 0, 1, 1,
0.9517775, 1.799474, 0.4183974, 0.8588235, 0, 1, 1,
0.9546213, 0.4182544, 0.5117577, 0.8666667, 0, 1, 1,
0.9566172, -1.038225, 2.227741, 0.8705882, 0, 1, 1,
0.9608321, -1.637316, 2.106128, 0.8784314, 0, 1, 1,
0.9664214, 0.5346531, 0.851667, 0.8823529, 0, 1, 1,
0.9685898, 0.08107261, 0.7537776, 0.8901961, 0, 1, 1,
0.9839551, -0.9483994, 3.340634, 0.8941177, 0, 1, 1,
0.9889227, -0.9354029, 4.113308, 0.9019608, 0, 1, 1,
0.9941855, -2.255586, 5.896523, 0.9098039, 0, 1, 1,
1.002069, -0.313573, 1.363026, 0.9137255, 0, 1, 1,
1.003816, -1.213426, 1.954073, 0.9215686, 0, 1, 1,
1.007272, -0.5931313, 1.419711, 0.9254902, 0, 1, 1,
1.008904, -0.145225, 1.175734, 0.9333333, 0, 1, 1,
1.010007, -0.8885638, 2.516719, 0.9372549, 0, 1, 1,
1.013911, 1.247365, 0.6482543, 0.945098, 0, 1, 1,
1.014236, 1.034798, -1.668877, 0.9490196, 0, 1, 1,
1.01572, -0.8135046, 0.9028842, 0.9568627, 0, 1, 1,
1.024969, -0.9570894, 1.175381, 0.9607843, 0, 1, 1,
1.026738, -0.6256359, 2.819848, 0.9686275, 0, 1, 1,
1.030221, 1.203625, 0.4492037, 0.972549, 0, 1, 1,
1.035401, 0.1263195, 1.180146, 0.9803922, 0, 1, 1,
1.038073, -0.8140231, 1.598556, 0.9843137, 0, 1, 1,
1.043069, 0.6119235, 1.681849, 0.9921569, 0, 1, 1,
1.045677, 0.7933387, 0.3941202, 0.9960784, 0, 1, 1,
1.051685, -0.4824767, 0.7234105, 1, 0, 0.9960784, 1,
1.053158, 0.7378721, 2.311087, 1, 0, 0.9882353, 1,
1.05422, 0.768996, 0.04615954, 1, 0, 0.9843137, 1,
1.05959, 1.083149, 1.330357, 1, 0, 0.9764706, 1,
1.075346, 1.223803, 0.5015855, 1, 0, 0.972549, 1,
1.085608, -0.3484239, -0.07212364, 1, 0, 0.9647059, 1,
1.08998, 0.8254951, 0.2360052, 1, 0, 0.9607843, 1,
1.094137, 2.246031, 1.057541, 1, 0, 0.9529412, 1,
1.10168, -0.3157425, 1.779488, 1, 0, 0.9490196, 1,
1.104466, 0.2381225, 0.4515551, 1, 0, 0.9411765, 1,
1.107067, -1.604922, 3.037313, 1, 0, 0.9372549, 1,
1.116894, -0.4975194, 3.342113, 1, 0, 0.9294118, 1,
1.117058, 0.2307157, 0.6444436, 1, 0, 0.9254902, 1,
1.127957, 0.6895201, 1.459042, 1, 0, 0.9176471, 1,
1.130001, 0.9023197, 2.011652, 1, 0, 0.9137255, 1,
1.137974, -0.1303756, 1.854029, 1, 0, 0.9058824, 1,
1.140805, -0.2894815, 3.188644, 1, 0, 0.9019608, 1,
1.142843, -1.219402, 3.226508, 1, 0, 0.8941177, 1,
1.143854, 1.748181, 0.6788284, 1, 0, 0.8862745, 1,
1.147693, 0.8962331, 1.565373, 1, 0, 0.8823529, 1,
1.149306, 0.2946905, 2.774028, 1, 0, 0.8745098, 1,
1.149754, 0.06421419, 2.043149, 1, 0, 0.8705882, 1,
1.150348, 1.392855, -0.6258011, 1, 0, 0.8627451, 1,
1.154465, 0.3808293, 2.066692, 1, 0, 0.8588235, 1,
1.156714, -1.80693, 1.896125, 1, 0, 0.8509804, 1,
1.158699, -2.623612, 2.256763, 1, 0, 0.8470588, 1,
1.159939, 0.8505785, -1.092173, 1, 0, 0.8392157, 1,
1.16446, -0.2380084, 0.6910796, 1, 0, 0.8352941, 1,
1.167476, -0.07630907, -0.07225024, 1, 0, 0.827451, 1,
1.170949, -0.1998765, 1.861643, 1, 0, 0.8235294, 1,
1.18019, -0.2084744, 0.7905919, 1, 0, 0.8156863, 1,
1.181591, 1.105327, -0.428276, 1, 0, 0.8117647, 1,
1.187757, 1.121204, 1.187683, 1, 0, 0.8039216, 1,
1.188419, -0.4547888, 1.078363, 1, 0, 0.7960784, 1,
1.1912, 0.2330023, 2.651262, 1, 0, 0.7921569, 1,
1.193845, -0.768627, 2.228324, 1, 0, 0.7843137, 1,
1.194081, -1.515642, 1.22934, 1, 0, 0.7803922, 1,
1.205812, 0.3327481, 2.03825, 1, 0, 0.772549, 1,
1.212256, -0.9593508, 0.9959062, 1, 0, 0.7686275, 1,
1.213415, 0.3690749, 1.476281, 1, 0, 0.7607843, 1,
1.225146, -0.2235334, 2.252798, 1, 0, 0.7568628, 1,
1.229888, -0.7979029, 3.499469, 1, 0, 0.7490196, 1,
1.234334, 0.5673825, 1.000401, 1, 0, 0.7450981, 1,
1.235182, 0.7523226, 1.146546, 1, 0, 0.7372549, 1,
1.2386, 1.808081, 0.7876684, 1, 0, 0.7333333, 1,
1.240189, 0.9794499, -1.020401, 1, 0, 0.7254902, 1,
1.240842, 0.6999714, 1.142977, 1, 0, 0.7215686, 1,
1.248025, -0.6619436, 2.232341, 1, 0, 0.7137255, 1,
1.249674, 0.2215607, 2.654688, 1, 0, 0.7098039, 1,
1.258748, -0.6123034, 2.561214, 1, 0, 0.7019608, 1,
1.261855, 0.6977057, 0.6895154, 1, 0, 0.6941177, 1,
1.270849, 1.321182, -0.4359908, 1, 0, 0.6901961, 1,
1.270912, 0.9870146, 0.7634433, 1, 0, 0.682353, 1,
1.271419, -0.1460027, 0.834259, 1, 0, 0.6784314, 1,
1.277851, -1.167286, 2.421073, 1, 0, 0.6705883, 1,
1.289699, 0.1657957, 3.690948, 1, 0, 0.6666667, 1,
1.291234, 0.2882418, 0.2933879, 1, 0, 0.6588235, 1,
1.292832, 0.1211042, 0.9727677, 1, 0, 0.654902, 1,
1.293105, -1.028674, 1.322979, 1, 0, 0.6470588, 1,
1.301964, -1.326997, 2.756369, 1, 0, 0.6431373, 1,
1.302325, 0.4213031, 1.313298, 1, 0, 0.6352941, 1,
1.308036, 1.396127, 1.049853, 1, 0, 0.6313726, 1,
1.310363, -1.762878, 2.967317, 1, 0, 0.6235294, 1,
1.312164, 0.8666469, 1.934785, 1, 0, 0.6196079, 1,
1.313381, -1.581014, 3.105561, 1, 0, 0.6117647, 1,
1.323133, -1.205034, 3.379773, 1, 0, 0.6078432, 1,
1.32688, -0.6116316, 2.351273, 1, 0, 0.6, 1,
1.326989, -0.179197, 2.494656, 1, 0, 0.5921569, 1,
1.340405, 0.9509647, -0.6988258, 1, 0, 0.5882353, 1,
1.342014, -0.2699078, 2.467754, 1, 0, 0.5803922, 1,
1.342633, -0.1394433, 1.342924, 1, 0, 0.5764706, 1,
1.34344, 0.6801969, 0.2520477, 1, 0, 0.5686275, 1,
1.353157, 1.742303, -0.02659348, 1, 0, 0.5647059, 1,
1.353577, -0.466471, 1.054253, 1, 0, 0.5568628, 1,
1.362514, 0.6353828, 2.08008, 1, 0, 0.5529412, 1,
1.367676, 0.2647726, 1.35136, 1, 0, 0.5450981, 1,
1.368915, -0.9061595, 2.530842, 1, 0, 0.5411765, 1,
1.374826, 0.5924525, 3.083596, 1, 0, 0.5333334, 1,
1.377507, -1.116766, 3.173311, 1, 0, 0.5294118, 1,
1.389275, -1.004232, 3.687324, 1, 0, 0.5215687, 1,
1.391815, 0.06071613, 2.259014, 1, 0, 0.5176471, 1,
1.396251, -0.9743055, 0.7090337, 1, 0, 0.509804, 1,
1.397924, -0.6960039, 1.415705, 1, 0, 0.5058824, 1,
1.398448, 0.4717601, 1.248574, 1, 0, 0.4980392, 1,
1.399422, 1.235753, -0.124596, 1, 0, 0.4901961, 1,
1.418947, 0.8817292, 0.8066495, 1, 0, 0.4862745, 1,
1.427551, -2.050215, 3.969221, 1, 0, 0.4784314, 1,
1.434524, -0.433739, 3.138871, 1, 0, 0.4745098, 1,
1.439184, -0.3105182, 1.528336, 1, 0, 0.4666667, 1,
1.443157, 0.07331645, 0.01954034, 1, 0, 0.4627451, 1,
1.44499, 0.2547365, 2.179775, 1, 0, 0.454902, 1,
1.459821, 0.5703383, 0.9179957, 1, 0, 0.4509804, 1,
1.463879, 1.241039, 2.317451, 1, 0, 0.4431373, 1,
1.472316, 0.6805657, 1.933872, 1, 0, 0.4392157, 1,
1.478964, -0.001475261, 0.9610603, 1, 0, 0.4313726, 1,
1.481965, 0.9593275, 1.163841, 1, 0, 0.427451, 1,
1.490299, -2.471653, 2.413715, 1, 0, 0.4196078, 1,
1.505152, 1.010694, 1.512204, 1, 0, 0.4156863, 1,
1.513001, -0.2939792, 2.634723, 1, 0, 0.4078431, 1,
1.527957, 0.7303874, 0.4567153, 1, 0, 0.4039216, 1,
1.537626, 0.8193297, 1.547634, 1, 0, 0.3960784, 1,
1.539293, 0.9500797, 0.7166761, 1, 0, 0.3882353, 1,
1.540525, -0.5651447, 2.683929, 1, 0, 0.3843137, 1,
1.542488, 0.2029387, 1.511431, 1, 0, 0.3764706, 1,
1.54634, -0.814014, 3.933639, 1, 0, 0.372549, 1,
1.549113, 0.6723137, 1.504931, 1, 0, 0.3647059, 1,
1.549971, 0.6610622, 3.403846, 1, 0, 0.3607843, 1,
1.559546, 0.4964593, 1.245856, 1, 0, 0.3529412, 1,
1.565867, -2.055892, 2.776591, 1, 0, 0.3490196, 1,
1.585209, 1.448389, -1.016604, 1, 0, 0.3411765, 1,
1.5978, -2.059496, 2.260632, 1, 0, 0.3372549, 1,
1.629751, 0.697331, 1.104469, 1, 0, 0.3294118, 1,
1.647187, -1.536268, 4.943127, 1, 0, 0.3254902, 1,
1.650531, -0.7564597, 4.769221, 1, 0, 0.3176471, 1,
1.65983, -1.656412, 1.860448, 1, 0, 0.3137255, 1,
1.671083, -1.989542, 2.159476, 1, 0, 0.3058824, 1,
1.677423, 0.8131078, 1.94146, 1, 0, 0.2980392, 1,
1.689815, -1.036965, 2.799692, 1, 0, 0.2941177, 1,
1.690488, 0.5973697, 1.257023, 1, 0, 0.2862745, 1,
1.694722, -1.644198, 2.477611, 1, 0, 0.282353, 1,
1.701958, -0.3840778, 0.5107838, 1, 0, 0.2745098, 1,
1.710436, -0.9653015, 4.526899, 1, 0, 0.2705882, 1,
1.712202, -1.87599, 4.13235, 1, 0, 0.2627451, 1,
1.724567, -0.01444744, 0.1058268, 1, 0, 0.2588235, 1,
1.735405, -0.779414, 2.9301, 1, 0, 0.2509804, 1,
1.745078, -1.248422, 2.859732, 1, 0, 0.2470588, 1,
1.751329, 1.609283, 0.7869074, 1, 0, 0.2392157, 1,
1.763535, 0.5170829, 1.772752, 1, 0, 0.2352941, 1,
1.765293, 1.493627, 0.3591763, 1, 0, 0.227451, 1,
1.769929, -1.070026, 3.244757, 1, 0, 0.2235294, 1,
1.770187, -0.4405271, 1.231404, 1, 0, 0.2156863, 1,
1.774325, -1.338473, 1.587726, 1, 0, 0.2117647, 1,
1.782699, -0.4446528, 1.566251, 1, 0, 0.2039216, 1,
1.789765, -0.5006143, 0.8241207, 1, 0, 0.1960784, 1,
1.799103, 0.1328582, 1.04633, 1, 0, 0.1921569, 1,
1.802942, -1.723013, 2.160195, 1, 0, 0.1843137, 1,
1.817628, -0.266682, -0.6286286, 1, 0, 0.1803922, 1,
1.85543, 1.23198, 0.04518259, 1, 0, 0.172549, 1,
1.871882, 0.4534117, 2.200246, 1, 0, 0.1686275, 1,
1.880211, 0.3164057, 1.167771, 1, 0, 0.1607843, 1,
1.888474, 0.464329, 1.786173, 1, 0, 0.1568628, 1,
1.900362, 0.05213327, 2.364132, 1, 0, 0.1490196, 1,
1.902441, 0.8706934, 0.2805075, 1, 0, 0.145098, 1,
1.914142, 0.7624215, 2.090437, 1, 0, 0.1372549, 1,
1.91472, 0.9065074, 2.387362, 1, 0, 0.1333333, 1,
1.980733, -0.508567, 1.375612, 1, 0, 0.1254902, 1,
1.988945, -0.1347821, 2.666655, 1, 0, 0.1215686, 1,
1.991617, -0.7381245, 1.588374, 1, 0, 0.1137255, 1,
2.029822, -0.2583403, 2.254347, 1, 0, 0.1098039, 1,
2.063721, -0.7297463, 0.1040808, 1, 0, 0.1019608, 1,
2.078785, 3.112612, 0.5295261, 1, 0, 0.09411765, 1,
2.083804, 1.404709, -0.2681374, 1, 0, 0.09019608, 1,
2.094395, -0.4564254, 2.169103, 1, 0, 0.08235294, 1,
2.114668, 1.213027, 2.428174, 1, 0, 0.07843138, 1,
2.149529, 0.2653252, 3.064664, 1, 0, 0.07058824, 1,
2.18645, 0.983691, 2.027826, 1, 0, 0.06666667, 1,
2.34681, 1.070535, 1.843763, 1, 0, 0.05882353, 1,
2.416964, -0.7138171, 1.99054, 1, 0, 0.05490196, 1,
2.4436, -1.767517, 2.389355, 1, 0, 0.04705882, 1,
2.487471, 1.797822, -0.01368824, 1, 0, 0.04313726, 1,
2.508214, -1.318112, 1.489483, 1, 0, 0.03529412, 1,
2.612795, -2.249366, 1.597246, 1, 0, 0.03137255, 1,
2.749288, -0.8078711, 0.3222442, 1, 0, 0.02352941, 1,
2.750021, -0.7502146, 1.825059, 1, 0, 0.01960784, 1,
3.117073, 0.114983, 0.4325601, 1, 0, 0.01176471, 1,
3.290208, 0.7866603, 2.737551, 1, 0, 0.007843138, 1
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
0.2702153, -4.002679, -7.10383, 0, -0.5, 0.5, 0.5,
0.2702153, -4.002679, -7.10383, 1, -0.5, 0.5, 0.5,
0.2702153, -4.002679, -7.10383, 1, 1.5, 0.5, 0.5,
0.2702153, -4.002679, -7.10383, 0, 1.5, 0.5, 0.5
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
-3.773555, 0.173333, -7.10383, 0, -0.5, 0.5, 0.5,
-3.773555, 0.173333, -7.10383, 1, -0.5, 0.5, 0.5,
-3.773555, 0.173333, -7.10383, 1, 1.5, 0.5, 0.5,
-3.773555, 0.173333, -7.10383, 0, 1.5, 0.5, 0.5
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
-3.773555, -4.002679, 0.3384414, 0, -0.5, 0.5, 0.5,
-3.773555, -4.002679, 0.3384414, 1, -0.5, 0.5, 0.5,
-3.773555, -4.002679, 0.3384414, 1, 1.5, 0.5, 0.5,
-3.773555, -4.002679, 0.3384414, 0, 1.5, 0.5, 0.5
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
-2, -3.038984, -5.386383,
3, -3.038984, -5.386383,
-2, -3.038984, -5.386383,
-2, -3.1996, -5.672624,
-1, -3.038984, -5.386383,
-1, -3.1996, -5.672624,
0, -3.038984, -5.386383,
0, -3.1996, -5.672624,
1, -3.038984, -5.386383,
1, -3.1996, -5.672624,
2, -3.038984, -5.386383,
2, -3.1996, -5.672624,
3, -3.038984, -5.386383,
3, -3.1996, -5.672624
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
-2, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
-2, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
-2, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
-2, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5,
-1, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
-1, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
-1, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
-1, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5,
0, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
0, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
0, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
0, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5,
1, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
1, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
1, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
1, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5,
2, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
2, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
2, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
2, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5,
3, -3.520832, -6.245106, 0, -0.5, 0.5, 0.5,
3, -3.520832, -6.245106, 1, -0.5, 0.5, 0.5,
3, -3.520832, -6.245106, 1, 1.5, 0.5, 0.5,
3, -3.520832, -6.245106, 0, 1.5, 0.5, 0.5
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
-2.840377, -2, -5.386383,
-2.840377, 3, -5.386383,
-2.840377, -2, -5.386383,
-2.995906, -2, -5.672624,
-2.840377, -1, -5.386383,
-2.995906, -1, -5.672624,
-2.840377, 0, -5.386383,
-2.995906, 0, -5.672624,
-2.840377, 1, -5.386383,
-2.995906, 1, -5.672624,
-2.840377, 2, -5.386383,
-2.995906, 2, -5.672624,
-2.840377, 3, -5.386383,
-2.995906, 3, -5.672624
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
-3.306966, -2, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, -2, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, -2, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, -2, -6.245106, 0, 1.5, 0.5, 0.5,
-3.306966, -1, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, -1, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, -1, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, -1, -6.245106, 0, 1.5, 0.5, 0.5,
-3.306966, 0, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, 0, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, 0, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, 0, -6.245106, 0, 1.5, 0.5, 0.5,
-3.306966, 1, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, 1, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, 1, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, 1, -6.245106, 0, 1.5, 0.5, 0.5,
-3.306966, 2, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, 2, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, 2, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, 2, -6.245106, 0, 1.5, 0.5, 0.5,
-3.306966, 3, -6.245106, 0, -0.5, 0.5, 0.5,
-3.306966, 3, -6.245106, 1, -0.5, 0.5, 0.5,
-3.306966, 3, -6.245106, 1, 1.5, 0.5, 0.5,
-3.306966, 3, -6.245106, 0, 1.5, 0.5, 0.5
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
-2.840377, -3.038984, -4,
-2.840377, -3.038984, 4,
-2.840377, -3.038984, -4,
-2.995906, -3.1996, -4,
-2.840377, -3.038984, -2,
-2.995906, -3.1996, -2,
-2.840377, -3.038984, 0,
-2.995906, -3.1996, 0,
-2.840377, -3.038984, 2,
-2.995906, -3.1996, 2,
-2.840377, -3.038984, 4,
-2.995906, -3.1996, 4
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
-3.306966, -3.520832, -4, 0, -0.5, 0.5, 0.5,
-3.306966, -3.520832, -4, 1, -0.5, 0.5, 0.5,
-3.306966, -3.520832, -4, 1, 1.5, 0.5, 0.5,
-3.306966, -3.520832, -4, 0, 1.5, 0.5, 0.5,
-3.306966, -3.520832, -2, 0, -0.5, 0.5, 0.5,
-3.306966, -3.520832, -2, 1, -0.5, 0.5, 0.5,
-3.306966, -3.520832, -2, 1, 1.5, 0.5, 0.5,
-3.306966, -3.520832, -2, 0, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 0, 0, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 0, 1, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 0, 1, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 0, 0, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 2, 0, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 2, 1, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 2, 1, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 2, 0, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 4, 0, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 4, 1, -0.5, 0.5, 0.5,
-3.306966, -3.520832, 4, 1, 1.5, 0.5, 0.5,
-3.306966, -3.520832, 4, 0, 1.5, 0.5, 0.5
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
-2.840377, -3.038984, -5.386383,
-2.840377, 3.38565, -5.386383,
-2.840377, -3.038984, 6.063265,
-2.840377, 3.38565, 6.063265,
-2.840377, -3.038984, -5.386383,
-2.840377, -3.038984, 6.063265,
-2.840377, 3.38565, -5.386383,
-2.840377, 3.38565, 6.063265,
-2.840377, -3.038984, -5.386383,
3.380807, -3.038984, -5.386383,
-2.840377, -3.038984, 6.063265,
3.380807, -3.038984, 6.063265,
-2.840377, 3.38565, -5.386383,
3.380807, 3.38565, -5.386383,
-2.840377, 3.38565, 6.063265,
3.380807, 3.38565, 6.063265,
3.380807, -3.038984, -5.386383,
3.380807, 3.38565, -5.386383,
3.380807, -3.038984, 6.063265,
3.380807, 3.38565, 6.063265,
3.380807, -3.038984, -5.386383,
3.380807, -3.038984, 6.063265,
3.380807, 3.38565, -5.386383,
3.380807, 3.38565, 6.063265
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
var radius = 7.757867;
var distance = 34.51563;
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
mvMatrix.translate( -0.2702153, -0.173333, -0.3384414 );
mvMatrix.scale( 1.34829, 1.305593, 0.7325953 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51563);
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
clofencet<-read.table("clofencet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clofencet$V2
```

```
## Error in eval(expr, envir, enclos): object 'clofencet' not found
```

```r
y<-clofencet$V3
```

```
## Error in eval(expr, envir, enclos): object 'clofencet' not found
```

```r
z<-clofencet$V4
```

```
## Error in eval(expr, envir, enclos): object 'clofencet' not found
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
-2.749777, 1.183219, -0.83846, 0, 0, 1, 1, 1,
-2.684496, -1.464571, -1.533762, 1, 0, 0, 1, 1,
-2.63183, 1.507509, -2.664209, 1, 0, 0, 1, 1,
-2.626175, 0.3166125, -2.315808, 1, 0, 0, 1, 1,
-2.612616, 1.609826, -0.7715364, 1, 0, 0, 1, 1,
-2.594725, 0.9623222, -1.117889, 1, 0, 0, 1, 1,
-2.459667, -1.044996, -1.585991, 0, 0, 0, 1, 1,
-2.454174, -1.015825, -2.551728, 0, 0, 0, 1, 1,
-2.378805, 0.7250237, -0.5073267, 0, 0, 0, 1, 1,
-2.310973, 0.7876354, -0.04579319, 0, 0, 0, 1, 1,
-2.309233, 0.900237, 0.4043825, 0, 0, 0, 1, 1,
-2.290334, -0.2838277, -0.9824905, 0, 0, 0, 1, 1,
-2.286891, -0.6563677, -0.7395898, 0, 0, 0, 1, 1,
-2.213232, -0.3023056, -0.8679596, 1, 1, 1, 1, 1,
-2.17128, -1.468527, -1.360332, 1, 1, 1, 1, 1,
-2.144889, 0.6451494, -1.673621, 1, 1, 1, 1, 1,
-2.097428, -0.9930862, -0.5198541, 1, 1, 1, 1, 1,
-2.093596, 1.193048, -1.669323, 1, 1, 1, 1, 1,
-2.088716, 0.3456768, -0.7433209, 1, 1, 1, 1, 1,
-2.064468, -0.08320083, 0.3499751, 1, 1, 1, 1, 1,
-2.04885, -0.07763933, -1.160075, 1, 1, 1, 1, 1,
-2.048814, 0.5701109, -0.04069125, 1, 1, 1, 1, 1,
-2.045583, -0.4447501, -1.237401, 1, 1, 1, 1, 1,
-2.045192, 0.2387813, 0.1778002, 1, 1, 1, 1, 1,
-2.020782, -0.2134762, -1.810777, 1, 1, 1, 1, 1,
-2.018939, -0.2615243, 0.1699894, 1, 1, 1, 1, 1,
-1.987364, 0.32557, -1.539074, 1, 1, 1, 1, 1,
-1.980567, -0.7333971, -3.480831, 1, 1, 1, 1, 1,
-1.979214, 1.374248, 0.6203601, 0, 0, 1, 1, 1,
-1.978884, 1.682495, -1.939552, 1, 0, 0, 1, 1,
-1.931792, -1.231346, -2.640214, 1, 0, 0, 1, 1,
-1.923514, -1.114347, -2.364094, 1, 0, 0, 1, 1,
-1.921612, 0.6174505, -0.7898861, 1, 0, 0, 1, 1,
-1.91311, 0.08470027, -1.556422, 1, 0, 0, 1, 1,
-1.909672, -2.236325, -2.669515, 0, 0, 0, 1, 1,
-1.904448, 2.15816, 0.2656134, 0, 0, 0, 1, 1,
-1.86456, -0.6909002, -1.185133, 0, 0, 0, 1, 1,
-1.864372, 0.4519816, -0.4708403, 0, 0, 0, 1, 1,
-1.862092, -0.9293405, -1.913849, 0, 0, 0, 1, 1,
-1.850877, -0.3374639, -0.2437584, 0, 0, 0, 1, 1,
-1.850793, -0.8868729, -1.7686, 0, 0, 0, 1, 1,
-1.847272, 0.2227014, -1.093421, 1, 1, 1, 1, 1,
-1.846974, 1.591522, -0.3374825, 1, 1, 1, 1, 1,
-1.832969, -0.5063586, -3.575375, 1, 1, 1, 1, 1,
-1.832762, 0.8005638, -0.2756391, 1, 1, 1, 1, 1,
-1.78547, -1.069808, -1.291241, 1, 1, 1, 1, 1,
-1.784903, 0.1414692, 1.001287, 1, 1, 1, 1, 1,
-1.773179, -0.6704192, -1.298472, 1, 1, 1, 1, 1,
-1.769825, -0.3039548, -2.088588, 1, 1, 1, 1, 1,
-1.7408, -0.4046744, -1.755561, 1, 1, 1, 1, 1,
-1.661034, -1.169733, -0.9330875, 1, 1, 1, 1, 1,
-1.647904, -0.8357399, -1.886225, 1, 1, 1, 1, 1,
-1.623639, 3.049972, -0.2424633, 1, 1, 1, 1, 1,
-1.622025, 0.4317558, -0.6738493, 1, 1, 1, 1, 1,
-1.620335, -0.8547663, -1.887473, 1, 1, 1, 1, 1,
-1.620236, -0.633981, -1.864765, 1, 1, 1, 1, 1,
-1.614642, -1.715076, -2.845809, 0, 0, 1, 1, 1,
-1.609544, -0.2780354, -2.381465, 1, 0, 0, 1, 1,
-1.606679, -0.5594215, -0.9122881, 1, 0, 0, 1, 1,
-1.604919, -0.696038, -0.7206057, 1, 0, 0, 1, 1,
-1.593941, 0.6405293, -1.035487, 1, 0, 0, 1, 1,
-1.576913, 1.173275, -0.1169118, 1, 0, 0, 1, 1,
-1.561157, 0.9304223, -2.495707, 0, 0, 0, 1, 1,
-1.559221, -0.2886436, -1.246267, 0, 0, 0, 1, 1,
-1.548557, 2.951678, -0.8466749, 0, 0, 0, 1, 1,
-1.536825, -0.3757788, -2.659834, 0, 0, 0, 1, 1,
-1.535696, 0.2995209, 1.876033, 0, 0, 0, 1, 1,
-1.511181, -0.3835173, -4.435083, 0, 0, 0, 1, 1,
-1.507484, 0.7249827, -0.5507666, 0, 0, 0, 1, 1,
-1.504339, -1.284559, -2.43955, 1, 1, 1, 1, 1,
-1.488954, -0.7411478, -0.7770838, 1, 1, 1, 1, 1,
-1.484694, 0.1514477, -0.5740167, 1, 1, 1, 1, 1,
-1.474219, 0.2859601, -2.976892, 1, 1, 1, 1, 1,
-1.471773, 1.105927, -1.565315, 1, 1, 1, 1, 1,
-1.452113, -2.25336, -3.227918, 1, 1, 1, 1, 1,
-1.443513, 1.039796, -1.560646, 1, 1, 1, 1, 1,
-1.441989, 0.6468664, -3.225567, 1, 1, 1, 1, 1,
-1.439326, -2.630091, -1.833551, 1, 1, 1, 1, 1,
-1.437832, -1.09793, -2.788405, 1, 1, 1, 1, 1,
-1.428955, -0.7172898, -2.579528, 1, 1, 1, 1, 1,
-1.424566, 0.3350696, -0.7326332, 1, 1, 1, 1, 1,
-1.419193, -0.9400496, -1.791584, 1, 1, 1, 1, 1,
-1.417187, -0.4553709, -2.460994, 1, 1, 1, 1, 1,
-1.413855, 0.04310203, -2.409675, 1, 1, 1, 1, 1,
-1.411217, -0.2480273, -2.448292, 0, 0, 1, 1, 1,
-1.408754, 0.4589824, -3.036753, 1, 0, 0, 1, 1,
-1.398544, 0.8656759, -1.171859, 1, 0, 0, 1, 1,
-1.381482, 1.68054, -2.148305, 1, 0, 0, 1, 1,
-1.366439, 1.167998, -0.6671995, 1, 0, 0, 1, 1,
-1.353423, 0.08659901, -0.2804351, 1, 0, 0, 1, 1,
-1.353261, 0.3676022, -2.402482, 0, 0, 0, 1, 1,
-1.350742, 0.1054851, 0.02335978, 0, 0, 0, 1, 1,
-1.345899, 0.8236828, -0.1246465, 0, 0, 0, 1, 1,
-1.344995, 0.3860409, 0.9133292, 0, 0, 0, 1, 1,
-1.338222, 1.132935, -1.314159, 0, 0, 0, 1, 1,
-1.337964, 0.4561163, 0.6655847, 0, 0, 0, 1, 1,
-1.332439, -1.040826, -2.067769, 0, 0, 0, 1, 1,
-1.327775, -1.97389, -3.488625, 1, 1, 1, 1, 1,
-1.325246, 0.7393593, -0.2308242, 1, 1, 1, 1, 1,
-1.324345, 0.5724922, -0.4035062, 1, 1, 1, 1, 1,
-1.321486, -1.249633, -2.468123, 1, 1, 1, 1, 1,
-1.315968, -0.2583798, -3.005606, 1, 1, 1, 1, 1,
-1.311219, -0.1491847, -0.8510827, 1, 1, 1, 1, 1,
-1.309499, 0.5178896, -0.02101178, 1, 1, 1, 1, 1,
-1.280612, 0.4725107, -1.643891, 1, 1, 1, 1, 1,
-1.266277, 0.8783981, 0.348849, 1, 1, 1, 1, 1,
-1.261692, 0.4868218, -2.122555, 1, 1, 1, 1, 1,
-1.261316, -0.1260439, 0.00075848, 1, 1, 1, 1, 1,
-1.241265, 1.360726, -1.182963, 1, 1, 1, 1, 1,
-1.240425, -0.8558935, -2.475179, 1, 1, 1, 1, 1,
-1.227411, 0.08859849, -2.018026, 1, 1, 1, 1, 1,
-1.227224, 0.2126708, -1.411052, 1, 1, 1, 1, 1,
-1.222672, 0.2148715, -0.1189327, 0, 0, 1, 1, 1,
-1.208436, 0.6920975, -0.5521997, 1, 0, 0, 1, 1,
-1.205631, -0.8104329, -1.746674, 1, 0, 0, 1, 1,
-1.202839, -1.724947, -2.383621, 1, 0, 0, 1, 1,
-1.201322, -0.2951007, -1.716565, 1, 0, 0, 1, 1,
-1.198043, 0.06971669, 0.02614431, 1, 0, 0, 1, 1,
-1.193882, 0.5334275, -2.419036, 0, 0, 0, 1, 1,
-1.174711, 0.3439761, -2.60802, 0, 0, 0, 1, 1,
-1.173318, -0.6790296, -1.749789, 0, 0, 0, 1, 1,
-1.171877, -1.623572, -1.267801, 0, 0, 0, 1, 1,
-1.164781, -0.7419958, -3.851985, 0, 0, 0, 1, 1,
-1.160289, 0.1234012, -1.049674, 0, 0, 0, 1, 1,
-1.159033, -0.1543575, -2.735198, 0, 0, 0, 1, 1,
-1.156523, 0.7676274, -0.4670053, 1, 1, 1, 1, 1,
-1.154909, -0.06696517, 0.3787946, 1, 1, 1, 1, 1,
-1.153717, 0.3325757, -1.68972, 1, 1, 1, 1, 1,
-1.148558, 0.9446456, -1.706268, 1, 1, 1, 1, 1,
-1.148187, 1.533811, 0.7193942, 1, 1, 1, 1, 1,
-1.147917, 0.6794675, -0.932263, 1, 1, 1, 1, 1,
-1.144378, -1.687904, -1.679517, 1, 1, 1, 1, 1,
-1.143168, 1.540176, 0.650988, 1, 1, 1, 1, 1,
-1.141429, -1.566455, -2.933933, 1, 1, 1, 1, 1,
-1.139228, 0.0869716, -1.244532, 1, 1, 1, 1, 1,
-1.135941, 1.981828, 0.5594913, 1, 1, 1, 1, 1,
-1.123081, 2.431378, -3.589718, 1, 1, 1, 1, 1,
-1.117468, -0.323925, 0.1944481, 1, 1, 1, 1, 1,
-1.110994, -1.749057, -3.020663, 1, 1, 1, 1, 1,
-1.109676, -1.257727, -2.325695, 1, 1, 1, 1, 1,
-1.109354, -0.2156952, -1.629057, 0, 0, 1, 1, 1,
-1.10749, -0.2549204, -2.454778, 1, 0, 0, 1, 1,
-1.104313, 0.7063351, -0.6313648, 1, 0, 0, 1, 1,
-1.101672, 1.593475, 0.01035981, 1, 0, 0, 1, 1,
-1.095727, 0.1005165, -4.314772, 1, 0, 0, 1, 1,
-1.094376, -0.3740239, -0.2885066, 1, 0, 0, 1, 1,
-1.094118, 0.1291785, -0.1032698, 0, 0, 0, 1, 1,
-1.091763, 0.165609, -0.5002829, 0, 0, 0, 1, 1,
-1.090541, -2.170182, -3.961673, 0, 0, 0, 1, 1,
-1.081846, 0.1026196, -1.130288, 0, 0, 0, 1, 1,
-1.079364, 0.07207989, -1.041205, 0, 0, 0, 1, 1,
-1.074062, -0.3538517, -0.6172439, 0, 0, 0, 1, 1,
-1.069314, -0.3321723, -2.936817, 0, 0, 0, 1, 1,
-1.05617, 0.3849556, -0.1835898, 1, 1, 1, 1, 1,
-1.050754, -0.1264256, -1.084435, 1, 1, 1, 1, 1,
-1.045867, -0.9433782, -1.648399, 1, 1, 1, 1, 1,
-1.04431, -0.9408792, -1.934947, 1, 1, 1, 1, 1,
-1.043296, -2.945422, -2.195032, 1, 1, 1, 1, 1,
-1.03987, 1.265941, -2.352073, 1, 1, 1, 1, 1,
-1.03451, 0.1971573, -1.424737, 1, 1, 1, 1, 1,
-1.033533, 0.5211112, -0.5766649, 1, 1, 1, 1, 1,
-1.029715, -0.415136, -1.492322, 1, 1, 1, 1, 1,
-1.029253, -0.6558968, -1.950551, 1, 1, 1, 1, 1,
-1.027943, 0.6222471, -0.9631436, 1, 1, 1, 1, 1,
-1.022917, -1.810327, -3.046557, 1, 1, 1, 1, 1,
-1.02206, 1.484933, -0.9926122, 1, 1, 1, 1, 1,
-1.016227, 0.01463824, 0.340288, 1, 1, 1, 1, 1,
-1.015895, 0.3368804, -3.034493, 1, 1, 1, 1, 1,
-1.0153, 0.6133, -2.068428, 0, 0, 1, 1, 1,
-1.013835, -1.858812, -2.559605, 1, 0, 0, 1, 1,
-1.003136, 2.137063, -1.576421, 1, 0, 0, 1, 1,
-1.002958, 0.7366612, -2.401929, 1, 0, 0, 1, 1,
-0.9910021, 0.3164141, -0.6165631, 1, 0, 0, 1, 1,
-0.9884565, -0.4351461, -2.057507, 1, 0, 0, 1, 1,
-0.9840304, 1.374887, -1.786012, 0, 0, 0, 1, 1,
-0.9698468, -0.5100924, -2.152946, 0, 0, 0, 1, 1,
-0.9692771, -0.9684762, -2.490166, 0, 0, 0, 1, 1,
-0.9678377, -0.3241441, -2.484145, 0, 0, 0, 1, 1,
-0.9652817, -0.0386001, -1.622961, 0, 0, 0, 1, 1,
-0.9623893, 0.8529839, -3.592139, 0, 0, 0, 1, 1,
-0.9559684, 0.1937564, -1.372906, 0, 0, 0, 1, 1,
-0.9551772, -0.6305394, -0.7849019, 1, 1, 1, 1, 1,
-0.9479142, 0.3051911, -0.8896216, 1, 1, 1, 1, 1,
-0.9442713, 0.01842053, -2.760166, 1, 1, 1, 1, 1,
-0.9374155, -0.2102438, -2.44399, 1, 1, 1, 1, 1,
-0.9353225, -1.260153, -5.079125, 1, 1, 1, 1, 1,
-0.9314192, -0.3083592, -3.378531, 1, 1, 1, 1, 1,
-0.9243892, -0.3987632, -3.253493, 1, 1, 1, 1, 1,
-0.9236975, 1.930867, -0.8323175, 1, 1, 1, 1, 1,
-0.9187464, 0.4126745, 0.3207869, 1, 1, 1, 1, 1,
-0.915533, 0.1800669, 0.01278737, 1, 1, 1, 1, 1,
-0.9088973, -0.1527057, -1.074548, 1, 1, 1, 1, 1,
-0.9040524, -0.2361346, -3.590213, 1, 1, 1, 1, 1,
-0.8925131, 1.176983, -0.3960662, 1, 1, 1, 1, 1,
-0.8875147, 0.2493583, -3.868091, 1, 1, 1, 1, 1,
-0.8867416, -0.9886064, -2.50646, 1, 1, 1, 1, 1,
-0.8864174, 0.4647012, 0.5472718, 0, 0, 1, 1, 1,
-0.8848651, -0.07345146, -3.278521, 1, 0, 0, 1, 1,
-0.8825186, -1.252144, -1.072101, 1, 0, 0, 1, 1,
-0.8821036, 0.3496321, -0.3765857, 1, 0, 0, 1, 1,
-0.8820134, -2.403378, -0.8482788, 1, 0, 0, 1, 1,
-0.8793945, 0.9548228, -1.46546, 1, 0, 0, 1, 1,
-0.8777061, 0.8740903, 0.3911505, 0, 0, 0, 1, 1,
-0.8749186, -2.364145, -1.539604, 0, 0, 0, 1, 1,
-0.8604772, -0.396618, -2.559724, 0, 0, 0, 1, 1,
-0.858628, -0.09038106, -2.925249, 0, 0, 0, 1, 1,
-0.8421575, 1.349696, -0.6180757, 0, 0, 0, 1, 1,
-0.8420733, 1.531327, -0.08613997, 0, 0, 0, 1, 1,
-0.841774, 1.055602, -0.1510356, 0, 0, 0, 1, 1,
-0.8410761, 2.259333, -0.01420357, 1, 1, 1, 1, 1,
-0.8408517, -1.972367, -1.758178, 1, 1, 1, 1, 1,
-0.839358, -0.2318424, -2.104806, 1, 1, 1, 1, 1,
-0.8391026, -1.124375, -3.492027, 1, 1, 1, 1, 1,
-0.8302747, -1.040109, -1.156983, 1, 1, 1, 1, 1,
-0.8252507, -0.2068681, -2.497317, 1, 1, 1, 1, 1,
-0.8150168, -1.484854, -3.097267, 1, 1, 1, 1, 1,
-0.8132083, 0.9118544, -1.718099, 1, 1, 1, 1, 1,
-0.8118577, 0.3873394, -0.7512244, 1, 1, 1, 1, 1,
-0.8079972, 0.3806036, -2.600326, 1, 1, 1, 1, 1,
-0.8052707, 0.1808468, -1.949914, 1, 1, 1, 1, 1,
-0.798865, 0.9255251, 1.676857, 1, 1, 1, 1, 1,
-0.7918245, 1.394872, -0.2269163, 1, 1, 1, 1, 1,
-0.7815009, -1.012201, -1.897597, 1, 1, 1, 1, 1,
-0.7811691, -1.602753, -2.47252, 1, 1, 1, 1, 1,
-0.7786701, -0.6466109, -2.214666, 0, 0, 1, 1, 1,
-0.7680885, 0.7735377, -0.2282542, 1, 0, 0, 1, 1,
-0.7674014, -1.447281, -3.466226, 1, 0, 0, 1, 1,
-0.7669492, 0.8162386, -1.090706, 1, 0, 0, 1, 1,
-0.7571962, -1.470369, -1.121954, 1, 0, 0, 1, 1,
-0.7518286, 0.4068184, -0.07953, 1, 0, 0, 1, 1,
-0.7490783, -0.05127125, -1.268193, 0, 0, 0, 1, 1,
-0.7392274, 1.241584, -1.300548, 0, 0, 0, 1, 1,
-0.73919, -0.6143101, -1.06657, 0, 0, 0, 1, 1,
-0.7384791, -1.362087, -3.507984, 0, 0, 0, 1, 1,
-0.7371761, -2.102668, -3.627765, 0, 0, 0, 1, 1,
-0.7339535, 0.4196879, -0.3328052, 0, 0, 0, 1, 1,
-0.7286088, 1.558188, -1.063638, 0, 0, 0, 1, 1,
-0.7246025, 0.3020272, -0.9271708, 1, 1, 1, 1, 1,
-0.721405, -0.2520306, -1.695187, 1, 1, 1, 1, 1,
-0.7212653, -1.101522, -2.627048, 1, 1, 1, 1, 1,
-0.7136006, 1.192628, -2.426268, 1, 1, 1, 1, 1,
-0.7077169, 0.03719288, -1.090776, 1, 1, 1, 1, 1,
-0.7056799, -0.04024078, -3.872551, 1, 1, 1, 1, 1,
-0.7035177, -0.3469157, -1.948353, 1, 1, 1, 1, 1,
-0.7029653, 0.208486, -1.87161, 1, 1, 1, 1, 1,
-0.7026928, -0.7549056, -0.4051934, 1, 1, 1, 1, 1,
-0.700622, -0.8528545, -3.477915, 1, 1, 1, 1, 1,
-0.6847143, -1.837261, -1.65215, 1, 1, 1, 1, 1,
-0.6843656, 0.0368991, -0.6894081, 1, 1, 1, 1, 1,
-0.6834939, 0.5317941, -1.399021, 1, 1, 1, 1, 1,
-0.6810986, 0.1032455, -1.230299, 1, 1, 1, 1, 1,
-0.6784634, 0.04890902, -1.617139, 1, 1, 1, 1, 1,
-0.6770918, -0.7706832, -1.538412, 0, 0, 1, 1, 1,
-0.6731359, 0.9642858, -1.700822, 1, 0, 0, 1, 1,
-0.6701895, 0.3968589, -2.204946, 1, 0, 0, 1, 1,
-0.6661435, -0.7744941, -2.482414, 1, 0, 0, 1, 1,
-0.6644254, 0.9020528, -0.8629771, 1, 0, 0, 1, 1,
-0.6623917, -0.5764899, -3.147151, 1, 0, 0, 1, 1,
-0.6590293, 1.652693, 0.2712906, 0, 0, 0, 1, 1,
-0.6500646, -1.093329, -2.296676, 0, 0, 0, 1, 1,
-0.6497961, 1.416615, 0.4764352, 0, 0, 0, 1, 1,
-0.6490115, 0.9507627, -0.5436288, 0, 0, 0, 1, 1,
-0.6456394, -0.2381661, 1.176497, 0, 0, 0, 1, 1,
-0.6421821, -1.386437, -2.439035, 0, 0, 0, 1, 1,
-0.6415324, 0.8857654, 0.6561042, 0, 0, 0, 1, 1,
-0.6403912, 0.3213347, -1.362835, 1, 1, 1, 1, 1,
-0.6379219, -0.9688034, -1.889767, 1, 1, 1, 1, 1,
-0.634995, 0.2454045, -0.9553066, 1, 1, 1, 1, 1,
-0.6333075, -0.3349025, -2.012175, 1, 1, 1, 1, 1,
-0.6242494, 0.8440514, 0.3831455, 1, 1, 1, 1, 1,
-0.6146642, 1.63632, -2.382681, 1, 1, 1, 1, 1,
-0.6111416, -0.3525129, -2.064251, 1, 1, 1, 1, 1,
-0.6104496, 0.09823988, -1.660566, 1, 1, 1, 1, 1,
-0.6097891, 0.2057085, -0.01841308, 1, 1, 1, 1, 1,
-0.6019328, 0.7808049, 0.4980356, 1, 1, 1, 1, 1,
-0.6003977, -0.2868029, -0.6819172, 1, 1, 1, 1, 1,
-0.5998895, -0.2767256, -0.6417341, 1, 1, 1, 1, 1,
-0.5938379, 0.6322308, -1.015749, 1, 1, 1, 1, 1,
-0.5872943, -0.8703545, -3.4564, 1, 1, 1, 1, 1,
-0.5870068, 1.129826, 0.04076046, 1, 1, 1, 1, 1,
-0.5853137, 0.740028, -0.2045946, 0, 0, 1, 1, 1,
-0.576408, -0.6825552, -3.310738, 1, 0, 0, 1, 1,
-0.5686309, 1.505435, -1.296217, 1, 0, 0, 1, 1,
-0.5583171, 0.3492406, -1.060825, 1, 0, 0, 1, 1,
-0.5571963, -0.8574935, -2.502586, 1, 0, 0, 1, 1,
-0.557024, -0.7410913, -1.401185, 1, 0, 0, 1, 1,
-0.5513496, -0.2782796, -3.715214, 0, 0, 0, 1, 1,
-0.5484899, 0.524309, -2.316939, 0, 0, 0, 1, 1,
-0.5437274, -0.07272637, -2.312574, 0, 0, 0, 1, 1,
-0.5402057, 1.207682, 0.2349147, 0, 0, 0, 1, 1,
-0.5400522, 1.082579, 0.07445665, 0, 0, 0, 1, 1,
-0.5376883, -0.04117911, -1.957141, 0, 0, 0, 1, 1,
-0.5376094, 0.7253572, -1.530945, 0, 0, 0, 1, 1,
-0.5374998, -1.187876, -2.212021, 1, 1, 1, 1, 1,
-0.5372971, 1.858178, -2.113232, 1, 1, 1, 1, 1,
-0.5365273, -1.336285, -1.460463, 1, 1, 1, 1, 1,
-0.5282346, -0.3643725, -1.216338, 1, 1, 1, 1, 1,
-0.5264656, -0.4843459, -2.976993, 1, 1, 1, 1, 1,
-0.5249913, -1.70226, -3.260388, 1, 1, 1, 1, 1,
-0.5217969, 0.5191167, 1.339835, 1, 1, 1, 1, 1,
-0.5195507, -0.3142869, -0.5689907, 1, 1, 1, 1, 1,
-0.5179664, -0.4367348, -0.4593177, 1, 1, 1, 1, 1,
-0.5170351, 0.9931049, -1.414922, 1, 1, 1, 1, 1,
-0.516552, 1.706483, -0.1940446, 1, 1, 1, 1, 1,
-0.515121, -0.3053424, -1.586843, 1, 1, 1, 1, 1,
-0.5132496, 0.7681125, -1.560642, 1, 1, 1, 1, 1,
-0.5097083, 0.9263434, 0.2368283, 1, 1, 1, 1, 1,
-0.5060145, 0.4977902, -1.400046, 1, 1, 1, 1, 1,
-0.5041703, -2.238984, -4.65891, 0, 0, 1, 1, 1,
-0.5022624, -2.328789, -2.385635, 1, 0, 0, 1, 1,
-0.499775, 0.8637713, -0.7337297, 1, 0, 0, 1, 1,
-0.4974167, 1.326671, -0.5517056, 1, 0, 0, 1, 1,
-0.4947695, 0.5780023, -1.924244, 1, 0, 0, 1, 1,
-0.4879839, 1.182926, -0.0508975, 1, 0, 0, 1, 1,
-0.4862437, -0.3707452, -1.554691, 0, 0, 0, 1, 1,
-0.4861099, 0.5450284, 0.1282643, 0, 0, 0, 1, 1,
-0.4858862, 0.9957169, -0.5174751, 0, 0, 0, 1, 1,
-0.4839577, -0.1766752, -1.069957, 0, 0, 0, 1, 1,
-0.4828813, 0.6501471, 0.3930303, 0, 0, 0, 1, 1,
-0.4794679, -0.9849238, -1.131602, 0, 0, 0, 1, 1,
-0.4792977, 1.255654, -1.455609, 0, 0, 0, 1, 1,
-0.4781493, 0.6913536, -1.026479, 1, 1, 1, 1, 1,
-0.4764062, 1.205423, -1.246524, 1, 1, 1, 1, 1,
-0.4719555, 0.6953264, 0.433644, 1, 1, 1, 1, 1,
-0.4717092, -0.3616244, -1.540262, 1, 1, 1, 1, 1,
-0.4691702, 0.001968319, -2.269937, 1, 1, 1, 1, 1,
-0.4648101, 0.3196762, -0.0811822, 1, 1, 1, 1, 1,
-0.4616039, -0.3199174, -1.61663, 1, 1, 1, 1, 1,
-0.4604886, 1.712129, -0.8203656, 1, 1, 1, 1, 1,
-0.460211, 0.317182, -1.698277, 1, 1, 1, 1, 1,
-0.4470679, 0.7203029, -0.1775156, 1, 1, 1, 1, 1,
-0.445084, 1.616418, -0.9663836, 1, 1, 1, 1, 1,
-0.438711, 1.83524, -1.909557, 1, 1, 1, 1, 1,
-0.4374847, -0.8580878, -3.741726, 1, 1, 1, 1, 1,
-0.4258929, -0.9854738, -2.67838, 1, 1, 1, 1, 1,
-0.4250986, 1.582449, 0.0297679, 1, 1, 1, 1, 1,
-0.4219746, -0.5873913, -3.854285, 0, 0, 1, 1, 1,
-0.4214536, -1.037967, -4.052598, 1, 0, 0, 1, 1,
-0.419556, -0.9834431, -3.307443, 1, 0, 0, 1, 1,
-0.4178437, 0.4267883, -1.518401, 1, 0, 0, 1, 1,
-0.4166258, -0.04156328, -1.306076, 1, 0, 0, 1, 1,
-0.4125732, 1.541789, -0.9161462, 1, 0, 0, 1, 1,
-0.4111618, -1.465446, -3.075086, 0, 0, 0, 1, 1,
-0.4065412, 0.399631, -1.119845, 0, 0, 0, 1, 1,
-0.4058133, -0.7076801, -2.108618, 0, 0, 0, 1, 1,
-0.4044883, -0.8492569, -2.108759, 0, 0, 0, 1, 1,
-0.4004444, -0.03744034, -1.250946, 0, 0, 0, 1, 1,
-0.3975599, -1.070265, -3.849713, 0, 0, 0, 1, 1,
-0.3904204, -1.015641, -0.9872918, 0, 0, 0, 1, 1,
-0.3838447, -0.01735968, -0.8961744, 1, 1, 1, 1, 1,
-0.3816082, 1.317773, 1.259175, 1, 1, 1, 1, 1,
-0.3795559, -1.190262, -3.404806, 1, 1, 1, 1, 1,
-0.3726218, -0.5835328, -3.769357, 1, 1, 1, 1, 1,
-0.370499, -0.2670784, -2.438971, 1, 1, 1, 1, 1,
-0.3686011, -0.5495918, -2.68771, 1, 1, 1, 1, 1,
-0.3668572, 0.7806237, -0.4119605, 1, 1, 1, 1, 1,
-0.363659, -2.277479, -3.614804, 1, 1, 1, 1, 1,
-0.3606353, 1.277044, 1.246885, 1, 1, 1, 1, 1,
-0.3557662, -0.8878326, -3.320622, 1, 1, 1, 1, 1,
-0.3537591, 0.5117618, -0.9608062, 1, 1, 1, 1, 1,
-0.3500004, -0.05552998, -3.353958, 1, 1, 1, 1, 1,
-0.3475501, 0.4937087, -0.239459, 1, 1, 1, 1, 1,
-0.3472968, 0.933469, -2.93332, 1, 1, 1, 1, 1,
-0.3467371, 0.5219774, -1.923299, 1, 1, 1, 1, 1,
-0.3467241, 0.9674775, -0.5142997, 0, 0, 1, 1, 1,
-0.3448879, 0.6872814, -0.8207123, 1, 0, 0, 1, 1,
-0.3430945, -0.5410829, -4.052927, 1, 0, 0, 1, 1,
-0.3366976, 0.1045152, -0.8928233, 1, 0, 0, 1, 1,
-0.3363165, -0.03520082, -2.739697, 1, 0, 0, 1, 1,
-0.3336805, -0.4257224, -0.8923462, 1, 0, 0, 1, 1,
-0.3312567, -2.257208, -2.535339, 0, 0, 0, 1, 1,
-0.3306493, -0.6330176, -1.657741, 0, 0, 0, 1, 1,
-0.3291279, -1.666721, -2.595586, 0, 0, 0, 1, 1,
-0.3206345, -0.7110612, -3.566314, 0, 0, 0, 1, 1,
-0.3178882, -1.217033, -1.958732, 0, 0, 0, 1, 1,
-0.3165203, 0.04817506, -0.6493294, 0, 0, 0, 1, 1,
-0.3138411, 0.379457, -1.465256, 0, 0, 0, 1, 1,
-0.3132601, -0.3863968, -2.276997, 1, 1, 1, 1, 1,
-0.3111607, 0.003132119, -1.264647, 1, 1, 1, 1, 1,
-0.3069333, -0.01691682, -1.921217, 1, 1, 1, 1, 1,
-0.3047881, -0.7580845, -4.198493, 1, 1, 1, 1, 1,
-0.3044423, -0.421533, -2.295304, 1, 1, 1, 1, 1,
-0.3024595, -1.171357, -2.547904, 1, 1, 1, 1, 1,
-0.2999002, -1.424349, -2.989956, 1, 1, 1, 1, 1,
-0.2916167, 0.375248, -0.320182, 1, 1, 1, 1, 1,
-0.286526, 0.07134943, -2.932463, 1, 1, 1, 1, 1,
-0.2728506, -0.4467382, -1.172824, 1, 1, 1, 1, 1,
-0.2687932, 0.963923, 0.1030624, 1, 1, 1, 1, 1,
-0.2652303, -0.8717442, -1.220914, 1, 1, 1, 1, 1,
-0.2641911, 0.6231452, -0.2092786, 1, 1, 1, 1, 1,
-0.2591634, 0.1604639, -1.385367, 1, 1, 1, 1, 1,
-0.251377, 0.4125472, -0.2389948, 1, 1, 1, 1, 1,
-0.2510485, -0.9106669, -2.77124, 0, 0, 1, 1, 1,
-0.2506407, 0.5086328, -0.6483274, 1, 0, 0, 1, 1,
-0.2441544, -0.8672256, -1.678536, 1, 0, 0, 1, 1,
-0.2430112, 0.6087363, 0.8052912, 1, 0, 0, 1, 1,
-0.2419608, -0.174718, -2.587126, 1, 0, 0, 1, 1,
-0.2412533, 1.216009, 0.7462084, 1, 0, 0, 1, 1,
-0.2405978, -2.099617, -3.547789, 0, 0, 0, 1, 1,
-0.2401897, -1.276607, -1.813293, 0, 0, 0, 1, 1,
-0.2346711, -0.8504606, -2.930928, 0, 0, 0, 1, 1,
-0.2307998, 0.1598122, 0.9144125, 0, 0, 0, 1, 1,
-0.2226637, -1.075185, -1.655596, 0, 0, 0, 1, 1,
-0.222647, -0.4269983, -1.822951, 0, 0, 0, 1, 1,
-0.2115759, 0.950654, 0.6619785, 0, 0, 0, 1, 1,
-0.2092736, -0.2809336, -0.9647344, 1, 1, 1, 1, 1,
-0.2049392, 0.6510206, -0.326786, 1, 1, 1, 1, 1,
-0.2013579, -0.03825577, 0.1922613, 1, 1, 1, 1, 1,
-0.2012463, -0.6292896, -4.137676, 1, 1, 1, 1, 1,
-0.1988928, 1.785441, 0.3441564, 1, 1, 1, 1, 1,
-0.1958882, 0.2296728, -0.612936, 1, 1, 1, 1, 1,
-0.1925727, 1.394161, -0.1302596, 1, 1, 1, 1, 1,
-0.1918583, -0.5798557, -4.311029, 1, 1, 1, 1, 1,
-0.1880571, -0.199675, -2.143261, 1, 1, 1, 1, 1,
-0.1869416, -0.8134048, -2.037786, 1, 1, 1, 1, 1,
-0.185332, 0.5719801, -1.049278, 1, 1, 1, 1, 1,
-0.1831354, -0.8373993, -5.21964, 1, 1, 1, 1, 1,
-0.1820076, -0.5208135, -2.905839, 1, 1, 1, 1, 1,
-0.181361, 0.1110229, -1.406653, 1, 1, 1, 1, 1,
-0.1805065, 0.00219806, -0.6756313, 1, 1, 1, 1, 1,
-0.1766335, -0.8104988, -2.819173, 0, 0, 1, 1, 1,
-0.1735412, 0.0441737, -0.519805, 1, 0, 0, 1, 1,
-0.172324, -0.1362758, -3.198405, 1, 0, 0, 1, 1,
-0.1714042, 0.1186289, -2.526974, 1, 0, 0, 1, 1,
-0.165524, -1.208276, -2.924443, 1, 0, 0, 1, 1,
-0.1653033, -0.3490344, -2.57385, 1, 0, 0, 1, 1,
-0.1587323, 0.163895, 0.0007989538, 0, 0, 0, 1, 1,
-0.1574809, -0.7151754, -2.773737, 0, 0, 0, 1, 1,
-0.1573704, 0.93258, -0.7257022, 0, 0, 0, 1, 1,
-0.1546184, -0.1756909, -0.4745242, 0, 0, 0, 1, 1,
-0.1537704, -0.4183401, -1.12571, 0, 0, 0, 1, 1,
-0.1500325, 0.6861611, 0.6702917, 0, 0, 0, 1, 1,
-0.1494894, 0.6419015, -1.170138, 0, 0, 0, 1, 1,
-0.1484569, -0.8120174, -4.570508, 1, 1, 1, 1, 1,
-0.1482099, 1.303858, 0.3744815, 1, 1, 1, 1, 1,
-0.1468682, 0.830395, -0.78444, 1, 1, 1, 1, 1,
-0.1432982, 2.275369, 0.207103, 1, 1, 1, 1, 1,
-0.1400909, 0.571078, -0.01238631, 1, 1, 1, 1, 1,
-0.1388389, -0.8830821, -2.742682, 1, 1, 1, 1, 1,
-0.1386693, -0.4703831, -2.1536, 1, 1, 1, 1, 1,
-0.137266, -0.8446847, -5.013541, 1, 1, 1, 1, 1,
-0.1344851, 0.4283803, 0.4813904, 1, 1, 1, 1, 1,
-0.13424, 0.4110167, -0.5283722, 1, 1, 1, 1, 1,
-0.1318226, 1.072849, 1.640587, 1, 1, 1, 1, 1,
-0.1293889, 0.3983086, 0.2105893, 1, 1, 1, 1, 1,
-0.1284201, 0.3875111, -0.5891643, 1, 1, 1, 1, 1,
-0.1241524, 1.251788, -0.3250853, 1, 1, 1, 1, 1,
-0.1240471, 1.161138, 0.114301, 1, 1, 1, 1, 1,
-0.1229504, 0.5304394, -1.181513, 0, 0, 1, 1, 1,
-0.12287, 0.001936156, -1.232321, 1, 0, 0, 1, 1,
-0.1226394, -0.04054998, -1.748955, 1, 0, 0, 1, 1,
-0.1225604, -0.7773144, -2.783943, 1, 0, 0, 1, 1,
-0.1214265, 0.2302079, 1.322093, 1, 0, 0, 1, 1,
-0.121028, -0.4689732, -1.742838, 1, 0, 0, 1, 1,
-0.1181859, -1.60635, -2.894698, 0, 0, 0, 1, 1,
-0.1172567, 0.8879561, -0.7105639, 0, 0, 0, 1, 1,
-0.1169674, 2.164271, -0.7312353, 0, 0, 0, 1, 1,
-0.1137341, -1.226186, -2.604357, 0, 0, 0, 1, 1,
-0.1108965, -0.247427, -3.279717, 0, 0, 0, 1, 1,
-0.1098137, -0.2019989, -1.659018, 0, 0, 0, 1, 1,
-0.107589, 0.1046657, -1.194065, 0, 0, 0, 1, 1,
-0.1053398, 0.6963667, 2.412088, 1, 1, 1, 1, 1,
-0.1042291, 0.5020386, 0.06481086, 1, 1, 1, 1, 1,
-0.1027838, 0.05477637, -2.139598, 1, 1, 1, 1, 1,
-0.102402, 3.043919, -0.322347, 1, 1, 1, 1, 1,
-0.09921759, -0.5756971, -3.358908, 1, 1, 1, 1, 1,
-0.09771523, 0.449326, 0.767803, 1, 1, 1, 1, 1,
-0.09605072, -1.20208, -2.509089, 1, 1, 1, 1, 1,
-0.08611773, -0.9502126, -4.830564, 1, 1, 1, 1, 1,
-0.08362126, -0.6524195, -3.293719, 1, 1, 1, 1, 1,
-0.08242037, -1.450664, -2.132238, 1, 1, 1, 1, 1,
-0.08026287, 1.473532, 0.2023983, 1, 1, 1, 1, 1,
-0.07698042, 0.08052413, 1.058124, 1, 1, 1, 1, 1,
-0.07407894, 0.1139933, -0.2436136, 1, 1, 1, 1, 1,
-0.07154365, -0.09346253, -3.249632, 1, 1, 1, 1, 1,
-0.06977485, -1.543234, -4.249211, 1, 1, 1, 1, 1,
-0.06578799, -0.6232159, -3.600206, 0, 0, 1, 1, 1,
-0.06497976, -0.8419139, -1.479319, 1, 0, 0, 1, 1,
-0.06384152, -0.4062265, 0.03666843, 1, 0, 0, 1, 1,
-0.05560964, 0.5232042, 0.5606698, 1, 0, 0, 1, 1,
-0.05213118, -0.01442699, -2.814848, 1, 0, 0, 1, 1,
-0.04046411, -1.086844, -4.863171, 1, 0, 0, 1, 1,
-0.0333135, 0.5762386, 1.719114, 0, 0, 0, 1, 1,
-0.03264721, -0.3422273, -1.324226, 0, 0, 0, 1, 1,
-0.02495507, 0.2999704, -0.4164849, 0, 0, 0, 1, 1,
-0.02371992, 0.1775641, 1.585074, 0, 0, 0, 1, 1,
-0.02318718, -0.110978, -2.590899, 0, 0, 0, 1, 1,
-0.02269819, 0.494343, -1.352365, 0, 0, 0, 1, 1,
-0.01907092, -1.295105, -3.32449, 0, 0, 0, 1, 1,
-0.01882445, 0.9545285, -0.5901381, 1, 1, 1, 1, 1,
-0.01370379, -0.124698, -3.776318, 1, 1, 1, 1, 1,
-0.01356311, 1.367701, -1.015524, 1, 1, 1, 1, 1,
-0.005974353, -0.7873861, -2.657571, 1, 1, 1, 1, 1,
-0.001392401, 1.283022, 0.7578207, 1, 1, 1, 1, 1,
0.01542416, -0.0001691139, 1.327637, 1, 1, 1, 1, 1,
0.02073442, -0.4092849, 0.9771352, 1, 1, 1, 1, 1,
0.0212232, -0.4691081, 3.3222, 1, 1, 1, 1, 1,
0.02586638, -1.360649, 2.028876, 1, 1, 1, 1, 1,
0.02753311, 2.195292, 0.8107429, 1, 1, 1, 1, 1,
0.03633725, 1.314641, 1.509872, 1, 1, 1, 1, 1,
0.04075366, 1.048457, 0.6835436, 1, 1, 1, 1, 1,
0.04090742, 1.09279, 1.868183, 1, 1, 1, 1, 1,
0.04123713, 2.072893, -0.5751259, 1, 1, 1, 1, 1,
0.04594972, -0.03996547, 2.156374, 1, 1, 1, 1, 1,
0.0464249, -0.5562626, 2.7755, 0, 0, 1, 1, 1,
0.04813949, 0.917809, -0.2616734, 1, 0, 0, 1, 1,
0.05446666, 0.6999565, -1.392175, 1, 0, 0, 1, 1,
0.05708277, 0.02402437, 1.855847, 1, 0, 0, 1, 1,
0.05813637, 1.882846, 0.4546246, 1, 0, 0, 1, 1,
0.06524619, -1.022451, 4.134609, 1, 0, 0, 1, 1,
0.06664614, -0.01486096, 2.109594, 0, 0, 0, 1, 1,
0.0709888, -0.7573501, 1.58634, 0, 0, 0, 1, 1,
0.0717391, 0.1571207, -0.22679, 0, 0, 0, 1, 1,
0.07860619, 2.861032, 1.185831, 0, 0, 0, 1, 1,
0.08316997, 2.405499, 1.074585, 0, 0, 0, 1, 1,
0.08743379, 1.162714, 0.9564059, 0, 0, 0, 1, 1,
0.08865859, -1.772612, 3.154101, 0, 0, 0, 1, 1,
0.09036564, 0.9919718, -0.227617, 1, 1, 1, 1, 1,
0.09095711, 0.307268, 0.2876317, 1, 1, 1, 1, 1,
0.0937802, -0.1456628, 0.7022204, 1, 1, 1, 1, 1,
0.09933738, 1.394726, -0.2332827, 1, 1, 1, 1, 1,
0.1004472, 1.258902, -0.6648653, 1, 1, 1, 1, 1,
0.1078156, 0.6875352, -0.04869133, 1, 1, 1, 1, 1,
0.1119454, -0.2355946, 2.922323, 1, 1, 1, 1, 1,
0.1151827, -0.8276269, 3.746026, 1, 1, 1, 1, 1,
0.1164875, -0.827167, 2.860939, 1, 1, 1, 1, 1,
0.1256529, -1.382154, 3.072588, 1, 1, 1, 1, 1,
0.1268819, 0.1028329, 1.030535, 1, 1, 1, 1, 1,
0.1271564, -0.7889744, 2.724851, 1, 1, 1, 1, 1,
0.1282414, -0.6351684, 2.726219, 1, 1, 1, 1, 1,
0.128639, -0.2988091, 3.449445, 1, 1, 1, 1, 1,
0.1286738, 0.2456055, 1.435924, 1, 1, 1, 1, 1,
0.1364803, -1.13499, 2.044345, 0, 0, 1, 1, 1,
0.1369962, -0.6298817, 1.848246, 1, 0, 0, 1, 1,
0.1373066, -0.9973358, 3.787924, 1, 0, 0, 1, 1,
0.1383387, 0.2882622, 2.31636, 1, 0, 0, 1, 1,
0.1421592, -0.2277943, 2.927868, 1, 0, 0, 1, 1,
0.1437951, -0.4014983, 1.899989, 1, 0, 0, 1, 1,
0.1473356, -2.176815, 4.120805, 0, 0, 0, 1, 1,
0.1502073, 1.449801, -0.5270885, 0, 0, 0, 1, 1,
0.1535597, 1.736736, 1.81894, 0, 0, 0, 1, 1,
0.154448, -1.040025, 2.825247, 0, 0, 0, 1, 1,
0.1554124, -1.578698, 3.258557, 0, 0, 0, 1, 1,
0.1559478, 0.2142599, 1.162428, 0, 0, 0, 1, 1,
0.1561483, 0.2815028, -1.103608, 0, 0, 0, 1, 1,
0.1583162, 1.494988, 1.990543, 1, 1, 1, 1, 1,
0.1588831, -0.4425245, 2.818627, 1, 1, 1, 1, 1,
0.1602064, -1.286947, 2.350759, 1, 1, 1, 1, 1,
0.1656646, 1.119495, 0.09031229, 1, 1, 1, 1, 1,
0.16627, -0.2891077, 3.522405, 1, 1, 1, 1, 1,
0.1759408, 0.03250676, 1.613227, 1, 1, 1, 1, 1,
0.1786833, -0.7449616, 2.571644, 1, 1, 1, 1, 1,
0.1891491, 0.2195368, 0.7103364, 1, 1, 1, 1, 1,
0.1895869, -2.513745, 3.74741, 1, 1, 1, 1, 1,
0.1905161, 0.694782, -2.128468, 1, 1, 1, 1, 1,
0.1933982, -0.5414481, 3.784091, 1, 1, 1, 1, 1,
0.1950225, -0.5901786, 4.615344, 1, 1, 1, 1, 1,
0.1973138, -0.8006637, 1.373721, 1, 1, 1, 1, 1,
0.1980319, 1.516326, 0.3567708, 1, 1, 1, 1, 1,
0.1997741, 1.65449, -0.3445071, 1, 1, 1, 1, 1,
0.2044727, -0.7425175, 1.598642, 0, 0, 1, 1, 1,
0.2054946, -0.2345064, 2.102416, 1, 0, 0, 1, 1,
0.2058298, 0.7669149, -2.95693, 1, 0, 0, 1, 1,
0.2091379, -1.337869, 2.565152, 1, 0, 0, 1, 1,
0.2123656, 0.8198559, 0.2892821, 1, 0, 0, 1, 1,
0.2139475, 0.4027697, -1.362197, 1, 0, 0, 1, 1,
0.2248127, -1.140346, 2.269358, 0, 0, 0, 1, 1,
0.2256081, 2.300784, -0.8516417, 0, 0, 0, 1, 1,
0.2257902, 0.4483065, 1.379135, 0, 0, 0, 1, 1,
0.2354834, -0.330356, 2.709336, 0, 0, 0, 1, 1,
0.2376133, 2.363294, -0.3299518, 0, 0, 0, 1, 1,
0.2376663, -0.3084026, 3.5948, 0, 0, 0, 1, 1,
0.238007, 0.7092612, -1.018207, 0, 0, 0, 1, 1,
0.2385349, -1.038907, 2.302644, 1, 1, 1, 1, 1,
0.2387782, 0.3399265, -0.4970953, 1, 1, 1, 1, 1,
0.2391955, 2.350776, 0.6327346, 1, 1, 1, 1, 1,
0.2394649, -1.378268, 2.631038, 1, 1, 1, 1, 1,
0.2443285, 0.3228343, -0.3939317, 1, 1, 1, 1, 1,
0.2471106, 0.8507174, 0.8998504, 1, 1, 1, 1, 1,
0.2489376, 0.04078295, 1.425513, 1, 1, 1, 1, 1,
0.2490467, 0.5043277, 0.1162329, 1, 1, 1, 1, 1,
0.2493564, 1.26304, -0.8891394, 1, 1, 1, 1, 1,
0.2501117, -0.06896289, 2.266804, 1, 1, 1, 1, 1,
0.2504238, -0.3291325, 1.548319, 1, 1, 1, 1, 1,
0.2549615, 1.06589, -0.3563415, 1, 1, 1, 1, 1,
0.2622401, -1.914401, 3.099727, 1, 1, 1, 1, 1,
0.2625047, -0.6030958, 2.514971, 1, 1, 1, 1, 1,
0.2662128, -0.396203, 0.380271, 1, 1, 1, 1, 1,
0.2726792, 1.365533, -0.1860325, 0, 0, 1, 1, 1,
0.2729875, 0.002949808, 1.125968, 1, 0, 0, 1, 1,
0.2755102, 1.08989, 1.027876, 1, 0, 0, 1, 1,
0.2766156, 0.2836542, 0.8419719, 1, 0, 0, 1, 1,
0.2772939, 0.2173907, 0.8337957, 1, 0, 0, 1, 1,
0.278071, -0.2734308, 2.48951, 1, 0, 0, 1, 1,
0.2784674, -0.9807798, 2.764711, 0, 0, 0, 1, 1,
0.2808765, 1.123724, -1.078575, 0, 0, 0, 1, 1,
0.2840534, -0.2412828, 4.308185, 0, 0, 0, 1, 1,
0.2873248, -1.165918, 2.278349, 0, 0, 0, 1, 1,
0.2924952, 0.9127241, -1.573618, 0, 0, 0, 1, 1,
0.2933779, 1.178608, -1.150603, 0, 0, 0, 1, 1,
0.3007623, 0.6067376, 0.9611281, 0, 0, 0, 1, 1,
0.3032263, 1.323988, 0.516919, 1, 1, 1, 1, 1,
0.306228, 0.2657764, 0.848143, 1, 1, 1, 1, 1,
0.3066065, -0.653644, 0.8190741, 1, 1, 1, 1, 1,
0.307202, 0.07564587, 2.220409, 1, 1, 1, 1, 1,
0.3077446, -1.231093, 1.902666, 1, 1, 1, 1, 1,
0.3109628, -0.4497493, 1.64302, 1, 1, 1, 1, 1,
0.3111763, 1.072272, 1.287017, 1, 1, 1, 1, 1,
0.3120832, 0.2108242, 1.923709, 1, 1, 1, 1, 1,
0.3141532, 0.791644, 0.3989696, 1, 1, 1, 1, 1,
0.3181899, -1.422628, 3.482161, 1, 1, 1, 1, 1,
0.3182854, -0.0304777, 0.4603474, 1, 1, 1, 1, 1,
0.3183055, 1.691256, -0.7513454, 1, 1, 1, 1, 1,
0.325975, 0.976633, 0.4541607, 1, 1, 1, 1, 1,
0.328512, -1.6172, 5.651421, 1, 1, 1, 1, 1,
0.3287475, -0.5848989, 3.207233, 1, 1, 1, 1, 1,
0.3296597, 1.083786, 0.7834502, 0, 0, 1, 1, 1,
0.3328186, 1.579819, -0.8295457, 1, 0, 0, 1, 1,
0.3384915, -0.9158242, 2.094492, 1, 0, 0, 1, 1,
0.3441043, 0.6072891, 0.06483263, 1, 0, 0, 1, 1,
0.3486631, 0.4063554, 1.136649, 1, 0, 0, 1, 1,
0.3491537, -0.3878224, 2.39148, 1, 0, 0, 1, 1,
0.3491826, -1.788928, 4.235685, 0, 0, 0, 1, 1,
0.3517143, -1.161794, 4.164837, 0, 0, 0, 1, 1,
0.3561537, -0.2817699, 2.233985, 0, 0, 0, 1, 1,
0.3588425, -1.793538, 1.9981, 0, 0, 0, 1, 1,
0.3603683, 0.4487604, 0.766606, 0, 0, 0, 1, 1,
0.3605255, 0.5059835, 1.276852, 0, 0, 0, 1, 1,
0.3618688, 0.474737, 1.906732, 0, 0, 0, 1, 1,
0.3623409, 0.664445, -0.01003509, 1, 1, 1, 1, 1,
0.3637204, -0.6645135, 3.149746, 1, 1, 1, 1, 1,
0.3659537, -0.1888035, 2.724795, 1, 1, 1, 1, 1,
0.3665275, 0.4638371, 0.7506099, 1, 1, 1, 1, 1,
0.3678646, -0.4557461, 1.039657, 1, 1, 1, 1, 1,
0.36915, -0.1168179, 1.40002, 1, 1, 1, 1, 1,
0.3781164, 1.280534, 1.034044, 1, 1, 1, 1, 1,
0.3817689, -2.300052, 4.095998, 1, 1, 1, 1, 1,
0.3835122, 1.189845, -0.3901161, 1, 1, 1, 1, 1,
0.3916354, -1.296938, 1.899986, 1, 1, 1, 1, 1,
0.3961893, 1.150802, 0.605402, 1, 1, 1, 1, 1,
0.3966558, -0.3794598, 3.356302, 1, 1, 1, 1, 1,
0.3971089, 0.09308948, 2.074079, 1, 1, 1, 1, 1,
0.3987583, -0.501211, 3.114274, 1, 1, 1, 1, 1,
0.4029189, -1.093664, 2.051485, 1, 1, 1, 1, 1,
0.4043926, 1.46785, -1.094748, 0, 0, 1, 1, 1,
0.4075553, -1.521067, 4.739336, 1, 0, 0, 1, 1,
0.4123367, -0.2918669, 0.5904294, 1, 0, 0, 1, 1,
0.4146347, 0.1588682, 2.788488, 1, 0, 0, 1, 1,
0.4158924, 0.7101009, 2.94149, 1, 0, 0, 1, 1,
0.4196837, 0.2102753, 0.3294017, 1, 0, 0, 1, 1,
0.425073, -0.3780895, 2.130833, 0, 0, 0, 1, 1,
0.4386049, 0.6919075, 1.933462, 0, 0, 0, 1, 1,
0.4431529, -0.5586349, 2.039724, 0, 0, 0, 1, 1,
0.4457141, -1.800345, 3.771081, 0, 0, 0, 1, 1,
0.4463744, -0.836192, 0.1244422, 0, 0, 0, 1, 1,
0.4514022, -0.3354767, 1.431861, 0, 0, 0, 1, 1,
0.4519164, -0.538855, 2.930793, 0, 0, 0, 1, 1,
0.4531105, -0.5756277, 1.767043, 1, 1, 1, 1, 1,
0.4535471, 0.08769881, 1.256927, 1, 1, 1, 1, 1,
0.4541262, -0.3832729, 3.533927, 1, 1, 1, 1, 1,
0.4542758, -1.942939, 1.897573, 1, 1, 1, 1, 1,
0.4544388, -0.2168396, 2.680098, 1, 1, 1, 1, 1,
0.4548377, 0.304375, 1.563775, 1, 1, 1, 1, 1,
0.46144, -0.6025576, 4.175816, 1, 1, 1, 1, 1,
0.4625826, -1.430843, 3.061168, 1, 1, 1, 1, 1,
0.4629567, -0.7099523, 1.556095, 1, 1, 1, 1, 1,
0.4678745, -1.524693, 2.879541, 1, 1, 1, 1, 1,
0.4701053, -1.699066, 2.56127, 1, 1, 1, 1, 1,
0.4726504, -1.715748, 1.662314, 1, 1, 1, 1, 1,
0.4749566, -0.3203119, 2.901378, 1, 1, 1, 1, 1,
0.477086, 0.3130785, 2.103768, 1, 1, 1, 1, 1,
0.478533, 0.1647052, 1.757141, 1, 1, 1, 1, 1,
0.4845978, -1.157244, 3.005147, 0, 0, 1, 1, 1,
0.4856749, -1.397388, 4.787518, 1, 0, 0, 1, 1,
0.489691, -0.4111385, 2.740151, 1, 0, 0, 1, 1,
0.4919243, -2.103758, 2.265604, 1, 0, 0, 1, 1,
0.4921747, -0.4436969, 3.772227, 1, 0, 0, 1, 1,
0.4932946, -0.02074101, 0.7120298, 1, 0, 0, 1, 1,
0.4935695, -2.163058, 3.199688, 0, 0, 0, 1, 1,
0.5011805, -0.7062966, 4.33348, 0, 0, 0, 1, 1,
0.5122356, 0.6944094, -2.51686, 0, 0, 0, 1, 1,
0.51368, 0.1623966, 1.47672, 0, 0, 0, 1, 1,
0.5157936, 0.7887581, -0.3252493, 0, 0, 0, 1, 1,
0.5175754, -1.100059, 1.840769, 0, 0, 0, 1, 1,
0.5195805, -0.7605734, 3.326622, 0, 0, 0, 1, 1,
0.5205299, -1.13657, 1.379615, 1, 1, 1, 1, 1,
0.5210491, -0.1813055, 1.226608, 1, 1, 1, 1, 1,
0.5233638, -0.3529186, 3.437167, 1, 1, 1, 1, 1,
0.5278755, -0.6127321, 2.420455, 1, 1, 1, 1, 1,
0.5296249, -0.2577548, 1.767194, 1, 1, 1, 1, 1,
0.5456721, 0.6923621, 0.7483658, 1, 1, 1, 1, 1,
0.5512142, -1.34449, 1.800908, 1, 1, 1, 1, 1,
0.5536478, 0.9956763, 1.212529, 1, 1, 1, 1, 1,
0.5570318, -1.508926, 2.72117, 1, 1, 1, 1, 1,
0.5634457, 0.09058487, 1.197245, 1, 1, 1, 1, 1,
0.5637261, 1.203784, 0.9110306, 1, 1, 1, 1, 1,
0.5639047, 3.292088, 0.467239, 1, 1, 1, 1, 1,
0.5659032, -1.105272, 4.472347, 1, 1, 1, 1, 1,
0.5678888, -1.099895, 3.215413, 1, 1, 1, 1, 1,
0.567924, 0.4895764, 0.3336593, 1, 1, 1, 1, 1,
0.5691581, -1.535803, 3.714387, 0, 0, 1, 1, 1,
0.5726173, -0.02484295, 2.802797, 1, 0, 0, 1, 1,
0.5760857, -1.583415, 2.154765, 1, 0, 0, 1, 1,
0.5766132, 1.606534, 0.04741812, 1, 0, 0, 1, 1,
0.5798281, 0.46574, 1.644076, 1, 0, 0, 1, 1,
0.5805561, 0.2926628, 2.512377, 1, 0, 0, 1, 1,
0.5836921, -0.1254776, 1.388527, 0, 0, 0, 1, 1,
0.5877218, 0.405819, 0.09847143, 0, 0, 0, 1, 1,
0.5941762, 0.1812684, 3.9935, 0, 0, 0, 1, 1,
0.5960714, 0.3923292, -0.5658593, 0, 0, 0, 1, 1,
0.5969378, -1.33981, 1.670686, 0, 0, 0, 1, 1,
0.6009807, -1.437058, 3.032221, 0, 0, 0, 1, 1,
0.605131, 0.5306743, 2.419842, 0, 0, 0, 1, 1,
0.6089826, -1.230382, 5.83206, 1, 1, 1, 1, 1,
0.6118299, 0.7685497, 0.9800095, 1, 1, 1, 1, 1,
0.6126196, 0.5383314, 2.190298, 1, 1, 1, 1, 1,
0.6155145, 0.8002996, -1.416873, 1, 1, 1, 1, 1,
0.6163305, 0.2583097, 1.089747, 1, 1, 1, 1, 1,
0.6181145, 0.1711954, 2.02725, 1, 1, 1, 1, 1,
0.61953, -0.6447591, 2.823052, 1, 1, 1, 1, 1,
0.6201723, 0.6074083, -2.10344, 1, 1, 1, 1, 1,
0.6236203, 1.740773, 1.300125, 1, 1, 1, 1, 1,
0.6273557, 1.487007, 0.3721927, 1, 1, 1, 1, 1,
0.6274964, -0.4059428, 1.96507, 1, 1, 1, 1, 1,
0.6276595, -0.8110878, 2.444075, 1, 1, 1, 1, 1,
0.6373978, 0.01738031, 1.743986, 1, 1, 1, 1, 1,
0.6374637, -0.6210369, 2.282824, 1, 1, 1, 1, 1,
0.6399276, 1.219331, 0.7003567, 1, 1, 1, 1, 1,
0.6605135, -0.1054238, 2.426522, 0, 0, 1, 1, 1,
0.6619291, -0.4837688, 2.716717, 1, 0, 0, 1, 1,
0.6661946, 0.2481768, 1.063169, 1, 0, 0, 1, 1,
0.6684175, 0.9756684, 0.7473913, 1, 0, 0, 1, 1,
0.6698594, 2.798161, -0.7371991, 1, 0, 0, 1, 1,
0.6759199, 0.9135665, -1.076828, 1, 0, 0, 1, 1,
0.6798086, -1.337025, 1.776422, 0, 0, 0, 1, 1,
0.6816092, 0.978075, 1.487668, 0, 0, 0, 1, 1,
0.6830387, -0.8991038, 3.014262, 0, 0, 0, 1, 1,
0.686464, 1.169074, 1.149091, 0, 0, 0, 1, 1,
0.6871347, -1.677183, 1.875299, 0, 0, 0, 1, 1,
0.6931385, -0.1388777, 0.9130058, 0, 0, 0, 1, 1,
0.6997671, -1.224855, 1.517629, 0, 0, 0, 1, 1,
0.6999281, 0.4948655, -0.0492005, 1, 1, 1, 1, 1,
0.7006688, -0.1668526, 2.718227, 1, 1, 1, 1, 1,
0.7016673, -0.5481695, 1.723674, 1, 1, 1, 1, 1,
0.7034218, -0.1574497, 1.782508, 1, 1, 1, 1, 1,
0.7068144, 0.02497306, 1.505827, 1, 1, 1, 1, 1,
0.7121021, -0.1312031, 2.378277, 1, 1, 1, 1, 1,
0.713236, 1.21829, 2.345228, 1, 1, 1, 1, 1,
0.7194299, 0.6565106, 1.944932, 1, 1, 1, 1, 1,
0.7236978, 0.1404647, 2.055387, 1, 1, 1, 1, 1,
0.7251121, -0.2814505, 2.068816, 1, 1, 1, 1, 1,
0.7294649, 0.8276532, 1.778448, 1, 1, 1, 1, 1,
0.7325205, 1.192845, -0.02111468, 1, 1, 1, 1, 1,
0.7336756, -0.8056642, 1.883982, 1, 1, 1, 1, 1,
0.7339949, -1.676715, 3.95926, 1, 1, 1, 1, 1,
0.7388565, 0.9615508, 1.472423, 1, 1, 1, 1, 1,
0.7419663, -0.2618136, 1.893877, 0, 0, 1, 1, 1,
0.7460775, -2.229603, -0.0215464, 1, 0, 0, 1, 1,
0.7496558, 0.8673654, 0.04966588, 1, 0, 0, 1, 1,
0.7502284, 1.454833, 0.2270202, 1, 0, 0, 1, 1,
0.7521414, 0.1176363, -0.3002604, 1, 0, 0, 1, 1,
0.7545097, -0.1104738, 1.764756, 1, 0, 0, 1, 1,
0.764173, -0.7022848, 0.862784, 0, 0, 0, 1, 1,
0.7644382, 1.243611, 1.418847, 0, 0, 0, 1, 1,
0.7690073, 0.3924568, 2.918567, 0, 0, 0, 1, 1,
0.769692, -0.1113039, 2.488786, 0, 0, 0, 1, 1,
0.7757513, 2.012259, 0.5674136, 0, 0, 0, 1, 1,
0.7774485, 0.1129835, 2.477751, 0, 0, 0, 1, 1,
0.7874538, -1.177219, 3.934989, 0, 0, 0, 1, 1,
0.7894249, -0.121909, 2.182884, 1, 1, 1, 1, 1,
0.7909504, 0.5025188, 0.3962165, 1, 1, 1, 1, 1,
0.8005458, -1.157731, 3.041147, 1, 1, 1, 1, 1,
0.8039032, 0.2288351, 0.426332, 1, 1, 1, 1, 1,
0.8043115, -1.041099, 1.613541, 1, 1, 1, 1, 1,
0.805316, -0.1333805, 1.253278, 1, 1, 1, 1, 1,
0.8065347, -1.066023, 2.445379, 1, 1, 1, 1, 1,
0.8081805, 0.01325195, 1.534924, 1, 1, 1, 1, 1,
0.8214754, 0.2151979, 1.290418, 1, 1, 1, 1, 1,
0.8218652, -0.701609, 3.05449, 1, 1, 1, 1, 1,
0.8219905, -0.4368528, 3.049193, 1, 1, 1, 1, 1,
0.825658, -1.943477, 2.919312, 1, 1, 1, 1, 1,
0.8265054, 0.9124707, 0.8210142, 1, 1, 1, 1, 1,
0.8281683, 1.099923, -0.7519041, 1, 1, 1, 1, 1,
0.8286579, 0.4317975, 0.5292328, 1, 1, 1, 1, 1,
0.8300489, 2.052558, -0.5381059, 0, 0, 1, 1, 1,
0.8349913, -0.4200113, 2.911477, 1, 0, 0, 1, 1,
0.844938, 1.304779, 0.5677258, 1, 0, 0, 1, 1,
0.8458034, -1.236366, 3.154963, 1, 0, 0, 1, 1,
0.8458139, -1.100891, 3.742561, 1, 0, 0, 1, 1,
0.848983, -0.2850056, 2.000571, 1, 0, 0, 1, 1,
0.8508576, 0.1597162, 2.556834, 0, 0, 0, 1, 1,
0.8551695, 0.4103167, 2.218875, 0, 0, 0, 1, 1,
0.859988, -1.097701, 2.634915, 0, 0, 0, 1, 1,
0.8657252, 0.1216848, 1.339032, 0, 0, 0, 1, 1,
0.8782575, -0.9010623, 2.073852, 0, 0, 0, 1, 1,
0.8839563, -1.13019, 2.995798, 0, 0, 0, 1, 1,
0.8889185, 0.003740625, 3.126299, 0, 0, 0, 1, 1,
0.9054519, 0.5239436, 3.278648, 1, 1, 1, 1, 1,
0.9075534, 0.5869861, 0.5825704, 1, 1, 1, 1, 1,
0.9105211, -0.7999458, 3.513731, 1, 1, 1, 1, 1,
0.9251359, 0.02500214, 0.5164989, 1, 1, 1, 1, 1,
0.9257613, -0.9816343, 1.884192, 1, 1, 1, 1, 1,
0.9269063, 1.273928, 0.6472175, 1, 1, 1, 1, 1,
0.9280246, 0.4488405, 0.9593675, 1, 1, 1, 1, 1,
0.9284148, -0.6557772, 1.520848, 1, 1, 1, 1, 1,
0.9366443, -0.4947887, 3.038177, 1, 1, 1, 1, 1,
0.9374614, -1.787202, 2.175102, 1, 1, 1, 1, 1,
0.9380566, 0.06856161, 3.289423, 1, 1, 1, 1, 1,
0.9403329, -2.164696, 2.661587, 1, 1, 1, 1, 1,
0.9450527, -0.648992, 3.761435, 1, 1, 1, 1, 1,
0.9517775, 1.799474, 0.4183974, 1, 1, 1, 1, 1,
0.9546213, 0.4182544, 0.5117577, 1, 1, 1, 1, 1,
0.9566172, -1.038225, 2.227741, 0, 0, 1, 1, 1,
0.9608321, -1.637316, 2.106128, 1, 0, 0, 1, 1,
0.9664214, 0.5346531, 0.851667, 1, 0, 0, 1, 1,
0.9685898, 0.08107261, 0.7537776, 1, 0, 0, 1, 1,
0.9839551, -0.9483994, 3.340634, 1, 0, 0, 1, 1,
0.9889227, -0.9354029, 4.113308, 1, 0, 0, 1, 1,
0.9941855, -2.255586, 5.896523, 0, 0, 0, 1, 1,
1.002069, -0.313573, 1.363026, 0, 0, 0, 1, 1,
1.003816, -1.213426, 1.954073, 0, 0, 0, 1, 1,
1.007272, -0.5931313, 1.419711, 0, 0, 0, 1, 1,
1.008904, -0.145225, 1.175734, 0, 0, 0, 1, 1,
1.010007, -0.8885638, 2.516719, 0, 0, 0, 1, 1,
1.013911, 1.247365, 0.6482543, 0, 0, 0, 1, 1,
1.014236, 1.034798, -1.668877, 1, 1, 1, 1, 1,
1.01572, -0.8135046, 0.9028842, 1, 1, 1, 1, 1,
1.024969, -0.9570894, 1.175381, 1, 1, 1, 1, 1,
1.026738, -0.6256359, 2.819848, 1, 1, 1, 1, 1,
1.030221, 1.203625, 0.4492037, 1, 1, 1, 1, 1,
1.035401, 0.1263195, 1.180146, 1, 1, 1, 1, 1,
1.038073, -0.8140231, 1.598556, 1, 1, 1, 1, 1,
1.043069, 0.6119235, 1.681849, 1, 1, 1, 1, 1,
1.045677, 0.7933387, 0.3941202, 1, 1, 1, 1, 1,
1.051685, -0.4824767, 0.7234105, 1, 1, 1, 1, 1,
1.053158, 0.7378721, 2.311087, 1, 1, 1, 1, 1,
1.05422, 0.768996, 0.04615954, 1, 1, 1, 1, 1,
1.05959, 1.083149, 1.330357, 1, 1, 1, 1, 1,
1.075346, 1.223803, 0.5015855, 1, 1, 1, 1, 1,
1.085608, -0.3484239, -0.07212364, 1, 1, 1, 1, 1,
1.08998, 0.8254951, 0.2360052, 0, 0, 1, 1, 1,
1.094137, 2.246031, 1.057541, 1, 0, 0, 1, 1,
1.10168, -0.3157425, 1.779488, 1, 0, 0, 1, 1,
1.104466, 0.2381225, 0.4515551, 1, 0, 0, 1, 1,
1.107067, -1.604922, 3.037313, 1, 0, 0, 1, 1,
1.116894, -0.4975194, 3.342113, 1, 0, 0, 1, 1,
1.117058, 0.2307157, 0.6444436, 0, 0, 0, 1, 1,
1.127957, 0.6895201, 1.459042, 0, 0, 0, 1, 1,
1.130001, 0.9023197, 2.011652, 0, 0, 0, 1, 1,
1.137974, -0.1303756, 1.854029, 0, 0, 0, 1, 1,
1.140805, -0.2894815, 3.188644, 0, 0, 0, 1, 1,
1.142843, -1.219402, 3.226508, 0, 0, 0, 1, 1,
1.143854, 1.748181, 0.6788284, 0, 0, 0, 1, 1,
1.147693, 0.8962331, 1.565373, 1, 1, 1, 1, 1,
1.149306, 0.2946905, 2.774028, 1, 1, 1, 1, 1,
1.149754, 0.06421419, 2.043149, 1, 1, 1, 1, 1,
1.150348, 1.392855, -0.6258011, 1, 1, 1, 1, 1,
1.154465, 0.3808293, 2.066692, 1, 1, 1, 1, 1,
1.156714, -1.80693, 1.896125, 1, 1, 1, 1, 1,
1.158699, -2.623612, 2.256763, 1, 1, 1, 1, 1,
1.159939, 0.8505785, -1.092173, 1, 1, 1, 1, 1,
1.16446, -0.2380084, 0.6910796, 1, 1, 1, 1, 1,
1.167476, -0.07630907, -0.07225024, 1, 1, 1, 1, 1,
1.170949, -0.1998765, 1.861643, 1, 1, 1, 1, 1,
1.18019, -0.2084744, 0.7905919, 1, 1, 1, 1, 1,
1.181591, 1.105327, -0.428276, 1, 1, 1, 1, 1,
1.187757, 1.121204, 1.187683, 1, 1, 1, 1, 1,
1.188419, -0.4547888, 1.078363, 1, 1, 1, 1, 1,
1.1912, 0.2330023, 2.651262, 0, 0, 1, 1, 1,
1.193845, -0.768627, 2.228324, 1, 0, 0, 1, 1,
1.194081, -1.515642, 1.22934, 1, 0, 0, 1, 1,
1.205812, 0.3327481, 2.03825, 1, 0, 0, 1, 1,
1.212256, -0.9593508, 0.9959062, 1, 0, 0, 1, 1,
1.213415, 0.3690749, 1.476281, 1, 0, 0, 1, 1,
1.225146, -0.2235334, 2.252798, 0, 0, 0, 1, 1,
1.229888, -0.7979029, 3.499469, 0, 0, 0, 1, 1,
1.234334, 0.5673825, 1.000401, 0, 0, 0, 1, 1,
1.235182, 0.7523226, 1.146546, 0, 0, 0, 1, 1,
1.2386, 1.808081, 0.7876684, 0, 0, 0, 1, 1,
1.240189, 0.9794499, -1.020401, 0, 0, 0, 1, 1,
1.240842, 0.6999714, 1.142977, 0, 0, 0, 1, 1,
1.248025, -0.6619436, 2.232341, 1, 1, 1, 1, 1,
1.249674, 0.2215607, 2.654688, 1, 1, 1, 1, 1,
1.258748, -0.6123034, 2.561214, 1, 1, 1, 1, 1,
1.261855, 0.6977057, 0.6895154, 1, 1, 1, 1, 1,
1.270849, 1.321182, -0.4359908, 1, 1, 1, 1, 1,
1.270912, 0.9870146, 0.7634433, 1, 1, 1, 1, 1,
1.271419, -0.1460027, 0.834259, 1, 1, 1, 1, 1,
1.277851, -1.167286, 2.421073, 1, 1, 1, 1, 1,
1.289699, 0.1657957, 3.690948, 1, 1, 1, 1, 1,
1.291234, 0.2882418, 0.2933879, 1, 1, 1, 1, 1,
1.292832, 0.1211042, 0.9727677, 1, 1, 1, 1, 1,
1.293105, -1.028674, 1.322979, 1, 1, 1, 1, 1,
1.301964, -1.326997, 2.756369, 1, 1, 1, 1, 1,
1.302325, 0.4213031, 1.313298, 1, 1, 1, 1, 1,
1.308036, 1.396127, 1.049853, 1, 1, 1, 1, 1,
1.310363, -1.762878, 2.967317, 0, 0, 1, 1, 1,
1.312164, 0.8666469, 1.934785, 1, 0, 0, 1, 1,
1.313381, -1.581014, 3.105561, 1, 0, 0, 1, 1,
1.323133, -1.205034, 3.379773, 1, 0, 0, 1, 1,
1.32688, -0.6116316, 2.351273, 1, 0, 0, 1, 1,
1.326989, -0.179197, 2.494656, 1, 0, 0, 1, 1,
1.340405, 0.9509647, -0.6988258, 0, 0, 0, 1, 1,
1.342014, -0.2699078, 2.467754, 0, 0, 0, 1, 1,
1.342633, -0.1394433, 1.342924, 0, 0, 0, 1, 1,
1.34344, 0.6801969, 0.2520477, 0, 0, 0, 1, 1,
1.353157, 1.742303, -0.02659348, 0, 0, 0, 1, 1,
1.353577, -0.466471, 1.054253, 0, 0, 0, 1, 1,
1.362514, 0.6353828, 2.08008, 0, 0, 0, 1, 1,
1.367676, 0.2647726, 1.35136, 1, 1, 1, 1, 1,
1.368915, -0.9061595, 2.530842, 1, 1, 1, 1, 1,
1.374826, 0.5924525, 3.083596, 1, 1, 1, 1, 1,
1.377507, -1.116766, 3.173311, 1, 1, 1, 1, 1,
1.389275, -1.004232, 3.687324, 1, 1, 1, 1, 1,
1.391815, 0.06071613, 2.259014, 1, 1, 1, 1, 1,
1.396251, -0.9743055, 0.7090337, 1, 1, 1, 1, 1,
1.397924, -0.6960039, 1.415705, 1, 1, 1, 1, 1,
1.398448, 0.4717601, 1.248574, 1, 1, 1, 1, 1,
1.399422, 1.235753, -0.124596, 1, 1, 1, 1, 1,
1.418947, 0.8817292, 0.8066495, 1, 1, 1, 1, 1,
1.427551, -2.050215, 3.969221, 1, 1, 1, 1, 1,
1.434524, -0.433739, 3.138871, 1, 1, 1, 1, 1,
1.439184, -0.3105182, 1.528336, 1, 1, 1, 1, 1,
1.443157, 0.07331645, 0.01954034, 1, 1, 1, 1, 1,
1.44499, 0.2547365, 2.179775, 0, 0, 1, 1, 1,
1.459821, 0.5703383, 0.9179957, 1, 0, 0, 1, 1,
1.463879, 1.241039, 2.317451, 1, 0, 0, 1, 1,
1.472316, 0.6805657, 1.933872, 1, 0, 0, 1, 1,
1.478964, -0.001475261, 0.9610603, 1, 0, 0, 1, 1,
1.481965, 0.9593275, 1.163841, 1, 0, 0, 1, 1,
1.490299, -2.471653, 2.413715, 0, 0, 0, 1, 1,
1.505152, 1.010694, 1.512204, 0, 0, 0, 1, 1,
1.513001, -0.2939792, 2.634723, 0, 0, 0, 1, 1,
1.527957, 0.7303874, 0.4567153, 0, 0, 0, 1, 1,
1.537626, 0.8193297, 1.547634, 0, 0, 0, 1, 1,
1.539293, 0.9500797, 0.7166761, 0, 0, 0, 1, 1,
1.540525, -0.5651447, 2.683929, 0, 0, 0, 1, 1,
1.542488, 0.2029387, 1.511431, 1, 1, 1, 1, 1,
1.54634, -0.814014, 3.933639, 1, 1, 1, 1, 1,
1.549113, 0.6723137, 1.504931, 1, 1, 1, 1, 1,
1.549971, 0.6610622, 3.403846, 1, 1, 1, 1, 1,
1.559546, 0.4964593, 1.245856, 1, 1, 1, 1, 1,
1.565867, -2.055892, 2.776591, 1, 1, 1, 1, 1,
1.585209, 1.448389, -1.016604, 1, 1, 1, 1, 1,
1.5978, -2.059496, 2.260632, 1, 1, 1, 1, 1,
1.629751, 0.697331, 1.104469, 1, 1, 1, 1, 1,
1.647187, -1.536268, 4.943127, 1, 1, 1, 1, 1,
1.650531, -0.7564597, 4.769221, 1, 1, 1, 1, 1,
1.65983, -1.656412, 1.860448, 1, 1, 1, 1, 1,
1.671083, -1.989542, 2.159476, 1, 1, 1, 1, 1,
1.677423, 0.8131078, 1.94146, 1, 1, 1, 1, 1,
1.689815, -1.036965, 2.799692, 1, 1, 1, 1, 1,
1.690488, 0.5973697, 1.257023, 0, 0, 1, 1, 1,
1.694722, -1.644198, 2.477611, 1, 0, 0, 1, 1,
1.701958, -0.3840778, 0.5107838, 1, 0, 0, 1, 1,
1.710436, -0.9653015, 4.526899, 1, 0, 0, 1, 1,
1.712202, -1.87599, 4.13235, 1, 0, 0, 1, 1,
1.724567, -0.01444744, 0.1058268, 1, 0, 0, 1, 1,
1.735405, -0.779414, 2.9301, 0, 0, 0, 1, 1,
1.745078, -1.248422, 2.859732, 0, 0, 0, 1, 1,
1.751329, 1.609283, 0.7869074, 0, 0, 0, 1, 1,
1.763535, 0.5170829, 1.772752, 0, 0, 0, 1, 1,
1.765293, 1.493627, 0.3591763, 0, 0, 0, 1, 1,
1.769929, -1.070026, 3.244757, 0, 0, 0, 1, 1,
1.770187, -0.4405271, 1.231404, 0, 0, 0, 1, 1,
1.774325, -1.338473, 1.587726, 1, 1, 1, 1, 1,
1.782699, -0.4446528, 1.566251, 1, 1, 1, 1, 1,
1.789765, -0.5006143, 0.8241207, 1, 1, 1, 1, 1,
1.799103, 0.1328582, 1.04633, 1, 1, 1, 1, 1,
1.802942, -1.723013, 2.160195, 1, 1, 1, 1, 1,
1.817628, -0.266682, -0.6286286, 1, 1, 1, 1, 1,
1.85543, 1.23198, 0.04518259, 1, 1, 1, 1, 1,
1.871882, 0.4534117, 2.200246, 1, 1, 1, 1, 1,
1.880211, 0.3164057, 1.167771, 1, 1, 1, 1, 1,
1.888474, 0.464329, 1.786173, 1, 1, 1, 1, 1,
1.900362, 0.05213327, 2.364132, 1, 1, 1, 1, 1,
1.902441, 0.8706934, 0.2805075, 1, 1, 1, 1, 1,
1.914142, 0.7624215, 2.090437, 1, 1, 1, 1, 1,
1.91472, 0.9065074, 2.387362, 1, 1, 1, 1, 1,
1.980733, -0.508567, 1.375612, 1, 1, 1, 1, 1,
1.988945, -0.1347821, 2.666655, 0, 0, 1, 1, 1,
1.991617, -0.7381245, 1.588374, 1, 0, 0, 1, 1,
2.029822, -0.2583403, 2.254347, 1, 0, 0, 1, 1,
2.063721, -0.7297463, 0.1040808, 1, 0, 0, 1, 1,
2.078785, 3.112612, 0.5295261, 1, 0, 0, 1, 1,
2.083804, 1.404709, -0.2681374, 1, 0, 0, 1, 1,
2.094395, -0.4564254, 2.169103, 0, 0, 0, 1, 1,
2.114668, 1.213027, 2.428174, 0, 0, 0, 1, 1,
2.149529, 0.2653252, 3.064664, 0, 0, 0, 1, 1,
2.18645, 0.983691, 2.027826, 0, 0, 0, 1, 1,
2.34681, 1.070535, 1.843763, 0, 0, 0, 1, 1,
2.416964, -0.7138171, 1.99054, 0, 0, 0, 1, 1,
2.4436, -1.767517, 2.389355, 0, 0, 0, 1, 1,
2.487471, 1.797822, -0.01368824, 1, 1, 1, 1, 1,
2.508214, -1.318112, 1.489483, 1, 1, 1, 1, 1,
2.612795, -2.249366, 1.597246, 1, 1, 1, 1, 1,
2.749288, -0.8078711, 0.3222442, 1, 1, 1, 1, 1,
2.750021, -0.7502146, 1.825059, 1, 1, 1, 1, 1,
3.117073, 0.114983, 0.4325601, 1, 1, 1, 1, 1,
3.290208, 0.7866603, 2.737551, 1, 1, 1, 1, 1
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
var radius = 9.597959;
var distance = 33.71242;
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
mvMatrix.translate( -0.2702154, -0.1733329, -0.3384414 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71242);
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
