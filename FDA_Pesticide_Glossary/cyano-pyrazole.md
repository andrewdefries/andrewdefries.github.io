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
-3.20462, -0.8179551, -1.313605, 1, 0, 0, 1,
-2.855425, 0.05141872, -3.81819, 1, 0.007843138, 0, 1,
-2.720658, -0.4971058, -1.832354, 1, 0.01176471, 0, 1,
-2.709281, 2.085006, -2.996577, 1, 0.01960784, 0, 1,
-2.702474, 2.413255, 0.02988725, 1, 0.02352941, 0, 1,
-2.582738, -0.9261705, -4.453323, 1, 0.03137255, 0, 1,
-2.557795, 0.624756, -0.04146511, 1, 0.03529412, 0, 1,
-2.425638, -1.377942, -2.696027, 1, 0.04313726, 0, 1,
-2.344938, -2.941622, -2.892014, 1, 0.04705882, 0, 1,
-2.293182, 0.7253907, -2.795389, 1, 0.05490196, 0, 1,
-2.269735, 1.596819, -1.545527, 1, 0.05882353, 0, 1,
-2.257575, -1.845865, -1.846348, 1, 0.06666667, 0, 1,
-2.218391, 1.149997, -0.4404928, 1, 0.07058824, 0, 1,
-2.195983, 1.318974, -1.374802, 1, 0.07843138, 0, 1,
-2.150898, 0.08941391, -1.18599, 1, 0.08235294, 0, 1,
-2.131723, -1.049375, -1.020243, 1, 0.09019608, 0, 1,
-2.121403, -0.1940703, -0.6955537, 1, 0.09411765, 0, 1,
-2.099889, 1.522017, -0.3702557, 1, 0.1019608, 0, 1,
-2.097887, 0.08153496, -3.209732, 1, 0.1098039, 0, 1,
-2.068989, 0.05466136, -2.600462, 1, 0.1137255, 0, 1,
-2.051912, -1.320428, -2.930744, 1, 0.1215686, 0, 1,
-2.029724, 0.2568171, -1.265142, 1, 0.1254902, 0, 1,
-2.028258, 0.7425576, -1.984443, 1, 0.1333333, 0, 1,
-2.023332, 0.7716151, -0.7747704, 1, 0.1372549, 0, 1,
-2.021926, 0.4542054, -0.9767253, 1, 0.145098, 0, 1,
-2.013621, -1.014322, -1.543032, 1, 0.1490196, 0, 1,
-1.972911, 1.616043, -0.8217856, 1, 0.1568628, 0, 1,
-1.916699, -1.435684, -2.985264, 1, 0.1607843, 0, 1,
-1.902908, 1.058734, -0.256432, 1, 0.1686275, 0, 1,
-1.889591, 0.7879712, 0.5205604, 1, 0.172549, 0, 1,
-1.814206, 0.758732, -1.440913, 1, 0.1803922, 0, 1,
-1.803504, 1.949386, -0.1022373, 1, 0.1843137, 0, 1,
-1.795968, 1.283038, -1.981823, 1, 0.1921569, 0, 1,
-1.786716, -0.2415093, -0.385501, 1, 0.1960784, 0, 1,
-1.784812, -0.5760266, -2.98821, 1, 0.2039216, 0, 1,
-1.780992, 0.2274485, -0.8200999, 1, 0.2117647, 0, 1,
-1.757033, 0.8373761, -2.274037, 1, 0.2156863, 0, 1,
-1.753489, 0.5873942, -0.7747766, 1, 0.2235294, 0, 1,
-1.752102, 0.1671997, -1.738684, 1, 0.227451, 0, 1,
-1.750023, -0.2431423, -0.6543056, 1, 0.2352941, 0, 1,
-1.749864, 0.08204681, -0.812669, 1, 0.2392157, 0, 1,
-1.737939, -0.555161, -1.19882, 1, 0.2470588, 0, 1,
-1.733722, -0.8554407, -1.634454, 1, 0.2509804, 0, 1,
-1.727172, -1.661175, -6.387243, 1, 0.2588235, 0, 1,
-1.725872, -0.248924, -0.9945858, 1, 0.2627451, 0, 1,
-1.725842, -0.3263661, -2.578819, 1, 0.2705882, 0, 1,
-1.71354, 0.3496, -1.01167, 1, 0.2745098, 0, 1,
-1.684861, 1.799949, -0.3952905, 1, 0.282353, 0, 1,
-1.676706, -1.067612, -1.833747, 1, 0.2862745, 0, 1,
-1.676277, -1.066888, -3.106256, 1, 0.2941177, 0, 1,
-1.67419, -0.8928431, -2.521646, 1, 0.3019608, 0, 1,
-1.673694, 1.090013, -1.641243, 1, 0.3058824, 0, 1,
-1.65594, -0.8660893, -0.9557982, 1, 0.3137255, 0, 1,
-1.654884, -1.0015, -2.39853, 1, 0.3176471, 0, 1,
-1.641676, -0.131378, -2.707452, 1, 0.3254902, 0, 1,
-1.628871, 0.277925, -2.415706, 1, 0.3294118, 0, 1,
-1.620191, -0.1097256, -2.41793, 1, 0.3372549, 0, 1,
-1.619561, 1.719721, -0.6665648, 1, 0.3411765, 0, 1,
-1.619089, -0.3977344, -0.5932909, 1, 0.3490196, 0, 1,
-1.615476, -0.08078696, -0.3670095, 1, 0.3529412, 0, 1,
-1.609427, -0.7498574, -2.092429, 1, 0.3607843, 0, 1,
-1.6089, 0.6153553, -1.399796, 1, 0.3647059, 0, 1,
-1.603975, -1.655193, -2.73436, 1, 0.372549, 0, 1,
-1.599948, 0.7915992, -0.8100305, 1, 0.3764706, 0, 1,
-1.558247, 1.80471, -0.9159877, 1, 0.3843137, 0, 1,
-1.557708, -0.1545684, -2.247748, 1, 0.3882353, 0, 1,
-1.544738, -1.367062, -2.869501, 1, 0.3960784, 0, 1,
-1.540355, 1.201894, -0.4446395, 1, 0.4039216, 0, 1,
-1.53805, 1.339485, 0.61501, 1, 0.4078431, 0, 1,
-1.528256, 0.04679602, -2.594499, 1, 0.4156863, 0, 1,
-1.51587, -1.374333, -2.888468, 1, 0.4196078, 0, 1,
-1.515038, 1.001763, -2.211457, 1, 0.427451, 0, 1,
-1.457837, 0.1304246, -2.218642, 1, 0.4313726, 0, 1,
-1.457506, 1.474558, -0.6433163, 1, 0.4392157, 0, 1,
-1.449848, -0.2803156, -1.02808, 1, 0.4431373, 0, 1,
-1.417802, 0.8212559, -1.948655, 1, 0.4509804, 0, 1,
-1.406168, -0.5889104, -2.686013, 1, 0.454902, 0, 1,
-1.386025, -1.498391, -3.938918, 1, 0.4627451, 0, 1,
-1.355525, -0.59254, -1.664447, 1, 0.4666667, 0, 1,
-1.350965, 0.3694201, -1.876794, 1, 0.4745098, 0, 1,
-1.34669, 0.03375458, -1.218286, 1, 0.4784314, 0, 1,
-1.33213, 1.093126, -1.265114, 1, 0.4862745, 0, 1,
-1.32955, 1.694773, 0.6663931, 1, 0.4901961, 0, 1,
-1.316025, 1.85144, 1.57239, 1, 0.4980392, 0, 1,
-1.305719, -1.427673, -1.196741, 1, 0.5058824, 0, 1,
-1.300328, -0.2880126, -0.5654596, 1, 0.509804, 0, 1,
-1.287981, 1.184734, -1.93932, 1, 0.5176471, 0, 1,
-1.285477, 1.137994, -1.263587, 1, 0.5215687, 0, 1,
-1.284441, 2.40032, -0.7812653, 1, 0.5294118, 0, 1,
-1.276419, -0.9736616, -2.905917, 1, 0.5333334, 0, 1,
-1.274509, 1.307226, -2.576988, 1, 0.5411765, 0, 1,
-1.27336, -1.338519, -1.554502, 1, 0.5450981, 0, 1,
-1.271803, -0.240822, -2.107703, 1, 0.5529412, 0, 1,
-1.269295, 0.03270204, -0.3292475, 1, 0.5568628, 0, 1,
-1.260866, -2.541604, -3.053691, 1, 0.5647059, 0, 1,
-1.258926, 0.7543428, -1.200447, 1, 0.5686275, 0, 1,
-1.253262, 0.3632824, -2.183165, 1, 0.5764706, 0, 1,
-1.249076, 0.6706178, -3.569208, 1, 0.5803922, 0, 1,
-1.242148, -0.4272247, -4.552258, 1, 0.5882353, 0, 1,
-1.241505, 1.800948, -0.06014268, 1, 0.5921569, 0, 1,
-1.23287, 1.100282, -0.7614282, 1, 0.6, 0, 1,
-1.230839, 1.512523, -1.343238, 1, 0.6078432, 0, 1,
-1.230224, 0.7628154, 1.385349, 1, 0.6117647, 0, 1,
-1.220905, 1.331005, -1.218447, 1, 0.6196079, 0, 1,
-1.212238, 1.099498, -0.9214072, 1, 0.6235294, 0, 1,
-1.204541, 0.3913952, -1.15703, 1, 0.6313726, 0, 1,
-1.177063, 0.7935432, 1.490727, 1, 0.6352941, 0, 1,
-1.17196, 0.3699674, -2.116014, 1, 0.6431373, 0, 1,
-1.161587, -0.1938388, -0.1716323, 1, 0.6470588, 0, 1,
-1.15817, 2.766121, -0.9734946, 1, 0.654902, 0, 1,
-1.152941, -0.1564651, -1.169146, 1, 0.6588235, 0, 1,
-1.148455, -1.348245, -0.8232279, 1, 0.6666667, 0, 1,
-1.140493, 2.343742, -0.7964901, 1, 0.6705883, 0, 1,
-1.139967, -0.3542512, -0.793276, 1, 0.6784314, 0, 1,
-1.138406, -1.153871, -2.95979, 1, 0.682353, 0, 1,
-1.135442, -0.6251778, -1.084076, 1, 0.6901961, 0, 1,
-1.130929, 1.49949, -0.2958095, 1, 0.6941177, 0, 1,
-1.113389, -0.1124639, -1.712162, 1, 0.7019608, 0, 1,
-1.109157, 1.276736, -0.8242805, 1, 0.7098039, 0, 1,
-1.10272, -1.681081, -2.595127, 1, 0.7137255, 0, 1,
-1.101354, -0.5180737, -0.5582487, 1, 0.7215686, 0, 1,
-1.09847, 1.021485, -1.123658, 1, 0.7254902, 0, 1,
-1.098109, -0.7501777, -2.829412, 1, 0.7333333, 0, 1,
-1.097095, -0.6813756, -2.643106, 1, 0.7372549, 0, 1,
-1.096259, -0.1533561, -3.505758, 1, 0.7450981, 0, 1,
-1.091492, 0.6065764, 0.7182852, 1, 0.7490196, 0, 1,
-1.091093, -0.5849544, -2.168686, 1, 0.7568628, 0, 1,
-1.090232, -0.2306512, -1.797987, 1, 0.7607843, 0, 1,
-1.087244, -1.244288, -3.112928, 1, 0.7686275, 0, 1,
-1.084293, -0.648662, -2.140937, 1, 0.772549, 0, 1,
-1.07774, -0.178286, 0.2948615, 1, 0.7803922, 0, 1,
-1.075858, 0.5439879, -2.311532, 1, 0.7843137, 0, 1,
-1.073688, 0.8176453, -1.562061, 1, 0.7921569, 0, 1,
-1.065378, 0.6726868, -1.088953, 1, 0.7960784, 0, 1,
-1.06341, -2.855958, -1.855268, 1, 0.8039216, 0, 1,
-1.052176, -1.872666, -2.168367, 1, 0.8117647, 0, 1,
-1.047735, -0.4781619, -1.84137, 1, 0.8156863, 0, 1,
-1.044487, -1.177548, -1.170622, 1, 0.8235294, 0, 1,
-1.044191, 0.0996193, -1.24708, 1, 0.827451, 0, 1,
-1.044157, 1.594222, -2.074433, 1, 0.8352941, 0, 1,
-1.041429, 2.91621, 0.3427901, 1, 0.8392157, 0, 1,
-1.038541, -0.3433077, -0.5454082, 1, 0.8470588, 0, 1,
-1.03522, -0.3411978, -2.191689, 1, 0.8509804, 0, 1,
-1.02905, -0.5782469, -1.741194, 1, 0.8588235, 0, 1,
-1.016588, 0.5884729, -1.324661, 1, 0.8627451, 0, 1,
-1.007982, -1.202874, -2.227218, 1, 0.8705882, 0, 1,
-1.007439, -0.9975343, -0.8797114, 1, 0.8745098, 0, 1,
-1.002797, -0.3358271, -1.61457, 1, 0.8823529, 0, 1,
-0.9999348, 0.8902318, -0.4325896, 1, 0.8862745, 0, 1,
-0.9959708, -1.430002, -4.310212, 1, 0.8941177, 0, 1,
-0.9912497, -1.029574, -3.496818, 1, 0.8980392, 0, 1,
-0.9909677, 1.535125, -2.217026, 1, 0.9058824, 0, 1,
-0.9700998, 0.761819, -0.9071693, 1, 0.9137255, 0, 1,
-0.9668757, -0.04317351, -1.819149, 1, 0.9176471, 0, 1,
-0.9612998, 0.2406883, -1.049936, 1, 0.9254902, 0, 1,
-0.9599234, -2.033246, -2.726698, 1, 0.9294118, 0, 1,
-0.954704, -1.833806, -2.025375, 1, 0.9372549, 0, 1,
-0.9518899, -0.3690008, -2.110373, 1, 0.9411765, 0, 1,
-0.9506865, -1.756947, -3.494645, 1, 0.9490196, 0, 1,
-0.9505879, -1.006174, -1.884415, 1, 0.9529412, 0, 1,
-0.9477084, 0.551007, -1.956648, 1, 0.9607843, 0, 1,
-0.9460257, -0.6484256, -1.378563, 1, 0.9647059, 0, 1,
-0.9458016, 0.4096832, -0.8689126, 1, 0.972549, 0, 1,
-0.9338142, -2.88458, -1.135014, 1, 0.9764706, 0, 1,
-0.9276015, -0.08809847, -1.201839, 1, 0.9843137, 0, 1,
-0.9242194, 2.797069, 0.5052951, 1, 0.9882353, 0, 1,
-0.9187567, 0.6382477, -2.511419, 1, 0.9960784, 0, 1,
-0.9150537, 0.3717826, -1.405309, 0.9960784, 1, 0, 1,
-0.9046023, 0.2507711, -0.9401706, 0.9921569, 1, 0, 1,
-0.9045252, 0.714889, 0.4977386, 0.9843137, 1, 0, 1,
-0.9037955, 1.036308, -1.419063, 0.9803922, 1, 0, 1,
-0.902458, 0.6221692, -1.755926, 0.972549, 1, 0, 1,
-0.901001, 0.6171328, -0.8409484, 0.9686275, 1, 0, 1,
-0.8996226, 1.630776, -0.557093, 0.9607843, 1, 0, 1,
-0.8990635, 0.8189567, -0.2844945, 0.9568627, 1, 0, 1,
-0.8977798, -1.530796, -2.314516, 0.9490196, 1, 0, 1,
-0.896139, 0.5338998, -1.957656, 0.945098, 1, 0, 1,
-0.8939481, 0.1263604, -3.196214, 0.9372549, 1, 0, 1,
-0.8907698, 1.691536, 0.5524598, 0.9333333, 1, 0, 1,
-0.8880991, 0.6057521, -0.9436902, 0.9254902, 1, 0, 1,
-0.8879637, 0.03712001, -1.793054, 0.9215686, 1, 0, 1,
-0.8863774, -0.2745217, -2.732243, 0.9137255, 1, 0, 1,
-0.8847429, -2.137052, -3.101242, 0.9098039, 1, 0, 1,
-0.8829653, 0.1253586, -0.5593215, 0.9019608, 1, 0, 1,
-0.8805627, -0.4330451, -3.168608, 0.8941177, 1, 0, 1,
-0.8804149, 0.3270756, -0.4705287, 0.8901961, 1, 0, 1,
-0.8788205, 0.4570125, 0.2540837, 0.8823529, 1, 0, 1,
-0.8691677, -1.13394, -2.577597, 0.8784314, 1, 0, 1,
-0.867994, -0.4133987, -1.043154, 0.8705882, 1, 0, 1,
-0.8666093, 0.3091757, -1.613437, 0.8666667, 1, 0, 1,
-0.863938, 0.2758748, -1.756818, 0.8588235, 1, 0, 1,
-0.8626032, 0.08281272, -0.7097006, 0.854902, 1, 0, 1,
-0.8616321, -0.6760579, -2.042584, 0.8470588, 1, 0, 1,
-0.8566562, 0.05780203, -2.93563, 0.8431373, 1, 0, 1,
-0.8562477, -0.3912351, -1.861775, 0.8352941, 1, 0, 1,
-0.8513384, -0.1631685, -2.31917, 0.8313726, 1, 0, 1,
-0.8417131, 0.8409858, -0.8716847, 0.8235294, 1, 0, 1,
-0.8411433, 0.6251345, 1.248077, 0.8196079, 1, 0, 1,
-0.8322883, 0.589025, -0.6860766, 0.8117647, 1, 0, 1,
-0.8275188, 2.348387, 0.4314259, 0.8078431, 1, 0, 1,
-0.8227769, -0.3077472, -0.5404249, 0.8, 1, 0, 1,
-0.8204271, -0.06773087, -1.798741, 0.7921569, 1, 0, 1,
-0.8184217, -1.346239, -4.751164, 0.7882353, 1, 0, 1,
-0.8149246, 1.566281, -0.5482795, 0.7803922, 1, 0, 1,
-0.8146254, -0.5755769, -2.676579, 0.7764706, 1, 0, 1,
-0.8111666, 0.1529642, -1.047225, 0.7686275, 1, 0, 1,
-0.8109269, 0.1820781, -2.904259, 0.7647059, 1, 0, 1,
-0.8086603, -0.7319356, -2.306652, 0.7568628, 1, 0, 1,
-0.8010724, -0.9319727, -2.130851, 0.7529412, 1, 0, 1,
-0.8007222, -1.204179, -2.962757, 0.7450981, 1, 0, 1,
-0.7989609, 0.6564709, -2.943499, 0.7411765, 1, 0, 1,
-0.7969138, 0.4346434, 0.5428348, 0.7333333, 1, 0, 1,
-0.7959281, -0.06477121, -0.09416103, 0.7294118, 1, 0, 1,
-0.7952729, 0.1489523, -1.528967, 0.7215686, 1, 0, 1,
-0.7936392, 0.7887561, -1.136039, 0.7176471, 1, 0, 1,
-0.7892998, 0.0975345, -0.0848119, 0.7098039, 1, 0, 1,
-0.7884323, 0.1695143, -1.109083, 0.7058824, 1, 0, 1,
-0.7860848, -1.351149, -3.569098, 0.6980392, 1, 0, 1,
-0.7854037, 0.2339665, -2.30698, 0.6901961, 1, 0, 1,
-0.7842693, 2.099279, 0.1702701, 0.6862745, 1, 0, 1,
-0.7834082, -0.465113, -0.8624878, 0.6784314, 1, 0, 1,
-0.7810763, 0.3580073, -1.08904, 0.6745098, 1, 0, 1,
-0.7797755, -0.08674732, -1.298149, 0.6666667, 1, 0, 1,
-0.7760344, -0.8376332, -2.530134, 0.6627451, 1, 0, 1,
-0.7752979, -2.310918, -1.430835, 0.654902, 1, 0, 1,
-0.7731975, 0.1890801, 0.3380297, 0.6509804, 1, 0, 1,
-0.7690337, 1.123521, -2.179678, 0.6431373, 1, 0, 1,
-0.7684802, -0.7582042, -0.390819, 0.6392157, 1, 0, 1,
-0.7682041, 1.249071, 0.498508, 0.6313726, 1, 0, 1,
-0.7625, -0.192874, -1.292197, 0.627451, 1, 0, 1,
-0.756909, -1.569368, -2.261952, 0.6196079, 1, 0, 1,
-0.7555586, 0.3434669, -1.526985, 0.6156863, 1, 0, 1,
-0.7554582, 1.981001, 0.103377, 0.6078432, 1, 0, 1,
-0.7542292, -2.070822, -2.743936, 0.6039216, 1, 0, 1,
-0.7539536, 0.3830892, -0.9515273, 0.5960785, 1, 0, 1,
-0.7351786, 0.7733054, -0.4443626, 0.5882353, 1, 0, 1,
-0.7340224, 1.199391, 0.4146313, 0.5843138, 1, 0, 1,
-0.7334925, -0.538583, -1.87409, 0.5764706, 1, 0, 1,
-0.7322569, 2.39507, -1.935554, 0.572549, 1, 0, 1,
-0.7321596, -2.545197, -1.926175, 0.5647059, 1, 0, 1,
-0.7263196, -0.4378361, -2.483332, 0.5607843, 1, 0, 1,
-0.7186389, 0.2148517, 0.6748568, 0.5529412, 1, 0, 1,
-0.7178218, -0.5319681, -1.718387, 0.5490196, 1, 0, 1,
-0.7044543, 2.070668, -1.148864, 0.5411765, 1, 0, 1,
-0.7042147, -0.7174811, -2.89421, 0.5372549, 1, 0, 1,
-0.6924414, -1.805338, -3.123331, 0.5294118, 1, 0, 1,
-0.6895627, 0.04900968, -0.5513632, 0.5254902, 1, 0, 1,
-0.6875232, 1.108727, -2.138127, 0.5176471, 1, 0, 1,
-0.6867388, -1.061289, -3.757262, 0.5137255, 1, 0, 1,
-0.6777731, -0.8009408, -3.583421, 0.5058824, 1, 0, 1,
-0.6721581, 0.4418926, -1.641841, 0.5019608, 1, 0, 1,
-0.6712702, -1.471716, -4.520863, 0.4941176, 1, 0, 1,
-0.6688276, 0.1847909, -0.6005368, 0.4862745, 1, 0, 1,
-0.6635989, -1.098664, -4.688835, 0.4823529, 1, 0, 1,
-0.6527324, -0.4637522, -3.287893, 0.4745098, 1, 0, 1,
-0.6497921, 0.3401592, 0.7549689, 0.4705882, 1, 0, 1,
-0.6470077, 0.04454845, -1.160173, 0.4627451, 1, 0, 1,
-0.6456479, -1.308188, -3.22286, 0.4588235, 1, 0, 1,
-0.6445093, -0.6547914, -2.001154, 0.4509804, 1, 0, 1,
-0.6444976, -0.2992621, -1.061125, 0.4470588, 1, 0, 1,
-0.6383023, 0.09447963, -1.464715, 0.4392157, 1, 0, 1,
-0.6375972, 0.9406198, -0.1649445, 0.4352941, 1, 0, 1,
-0.6347325, 0.02139545, -0.4924666, 0.427451, 1, 0, 1,
-0.6301206, -0.596207, -3.829658, 0.4235294, 1, 0, 1,
-0.6260064, -0.1815633, -0.8009688, 0.4156863, 1, 0, 1,
-0.6175421, 0.4963358, -1.171167, 0.4117647, 1, 0, 1,
-0.6171411, -1.13214, -3.035651, 0.4039216, 1, 0, 1,
-0.6171241, 1.844288, -0.5576361, 0.3960784, 1, 0, 1,
-0.6127092, 0.3927051, -0.9981618, 0.3921569, 1, 0, 1,
-0.6109875, 0.1683126, -1.249456, 0.3843137, 1, 0, 1,
-0.6051518, -0.7540218, -2.077041, 0.3803922, 1, 0, 1,
-0.60404, 1.388287, 0.9313437, 0.372549, 1, 0, 1,
-0.5975497, -0.2461959, -0.7628438, 0.3686275, 1, 0, 1,
-0.5935225, 0.7055132, -0.4575383, 0.3607843, 1, 0, 1,
-0.5922975, 0.5480925, -0.4293137, 0.3568628, 1, 0, 1,
-0.5864759, -0.4195328, -3.637599, 0.3490196, 1, 0, 1,
-0.584511, 0.01215019, -0.739439, 0.345098, 1, 0, 1,
-0.5844809, -0.4248266, -3.307184, 0.3372549, 1, 0, 1,
-0.5802167, 0.201203, -3.191959, 0.3333333, 1, 0, 1,
-0.5794261, 1.302011, -0.3397267, 0.3254902, 1, 0, 1,
-0.5737687, -0.9218904, -2.021502, 0.3215686, 1, 0, 1,
-0.5711218, -0.2433559, -0.04727203, 0.3137255, 1, 0, 1,
-0.5692307, 0.6664281, 0.9412776, 0.3098039, 1, 0, 1,
-0.5625558, 0.513539, 0.5802054, 0.3019608, 1, 0, 1,
-0.5580015, -1.482598, -3.308927, 0.2941177, 1, 0, 1,
-0.5574603, 0.8269345, 0.0717188, 0.2901961, 1, 0, 1,
-0.5505427, -0.9991075, -3.678317, 0.282353, 1, 0, 1,
-0.5499627, -0.9468974, -4.501061, 0.2784314, 1, 0, 1,
-0.5464337, 0.9655432, -0.1306231, 0.2705882, 1, 0, 1,
-0.5458547, 0.5512661, -2.146517, 0.2666667, 1, 0, 1,
-0.5448911, 1.076127, 0.07347802, 0.2588235, 1, 0, 1,
-0.5440542, 0.544064, -1.917532, 0.254902, 1, 0, 1,
-0.5438168, 0.2352939, -0.607038, 0.2470588, 1, 0, 1,
-0.5429421, -1.417278, -1.987357, 0.2431373, 1, 0, 1,
-0.5424253, 0.5177628, -0.4584735, 0.2352941, 1, 0, 1,
-0.5412987, 0.285182, -0.4956898, 0.2313726, 1, 0, 1,
-0.5357039, -0.4385808, -1.021832, 0.2235294, 1, 0, 1,
-0.5355589, 0.2814449, -0.6046671, 0.2196078, 1, 0, 1,
-0.532823, -0.7434543, -1.451184, 0.2117647, 1, 0, 1,
-0.5288635, 0.9792412, -0.152854, 0.2078431, 1, 0, 1,
-0.5238471, 0.5325363, 0.01503717, 0.2, 1, 0, 1,
-0.5215952, -0.9473447, -1.999025, 0.1921569, 1, 0, 1,
-0.5203743, 2.349735, -1.059459, 0.1882353, 1, 0, 1,
-0.5201671, -1.16141, -2.684743, 0.1803922, 1, 0, 1,
-0.5178365, -0.005488516, -0.5232282, 0.1764706, 1, 0, 1,
-0.5031441, 0.04228409, -2.394215, 0.1686275, 1, 0, 1,
-0.5031062, -0.3693888, -2.426874, 0.1647059, 1, 0, 1,
-0.5009298, 0.03984133, -1.464448, 0.1568628, 1, 0, 1,
-0.499461, -1.516233, -2.453349, 0.1529412, 1, 0, 1,
-0.4903752, 1.416858, -1.380308, 0.145098, 1, 0, 1,
-0.4883367, -1.7238, -3.193638, 0.1411765, 1, 0, 1,
-0.4881184, 0.0245675, -1.508007, 0.1333333, 1, 0, 1,
-0.4865969, -0.2286038, -2.912837, 0.1294118, 1, 0, 1,
-0.4807136, -0.2066495, -1.444886, 0.1215686, 1, 0, 1,
-0.4774266, 0.3708566, -2.524539, 0.1176471, 1, 0, 1,
-0.4745514, -1.712229, -3.348356, 0.1098039, 1, 0, 1,
-0.4700528, 0.2179826, -0.6272012, 0.1058824, 1, 0, 1,
-0.4679042, -0.2562345, -2.111242, 0.09803922, 1, 0, 1,
-0.4637186, -1.906205, -2.294946, 0.09019608, 1, 0, 1,
-0.4586884, 0.7763187, -2.268881, 0.08627451, 1, 0, 1,
-0.4519507, 0.7584112, -1.701563, 0.07843138, 1, 0, 1,
-0.4506722, 0.6535484, -0.7251685, 0.07450981, 1, 0, 1,
-0.4444371, -1.181048, -1.646389, 0.06666667, 1, 0, 1,
-0.4432834, -1.345835, -0.6816182, 0.0627451, 1, 0, 1,
-0.4427972, 0.3438541, 1.160737, 0.05490196, 1, 0, 1,
-0.4387897, -0.4650629, -4.653736, 0.05098039, 1, 0, 1,
-0.4374867, -1.146107, -2.000465, 0.04313726, 1, 0, 1,
-0.4361746, -1.730294, -2.731417, 0.03921569, 1, 0, 1,
-0.4303505, 1.000076, -1.181689, 0.03137255, 1, 0, 1,
-0.4268412, 1.018344, -0.2176533, 0.02745098, 1, 0, 1,
-0.4238847, -0.6226947, -1.92348, 0.01960784, 1, 0, 1,
-0.4231369, -0.812846, -1.748765, 0.01568628, 1, 0, 1,
-0.423096, -0.006567678, -0.6953158, 0.007843138, 1, 0, 1,
-0.4195117, -1.664846, -2.876231, 0.003921569, 1, 0, 1,
-0.4161248, 0.5131115, -0.8469974, 0, 1, 0.003921569, 1,
-0.4129962, 1.267915, -0.1942018, 0, 1, 0.01176471, 1,
-0.4113509, 3.029225, -2.531412, 0, 1, 0.01568628, 1,
-0.4111171, -0.9472283, -3.352371, 0, 1, 0.02352941, 1,
-0.4103567, 0.7484379, 0.6874359, 0, 1, 0.02745098, 1,
-0.4089941, 0.4074339, 0.4597404, 0, 1, 0.03529412, 1,
-0.4079187, 1.562973, 0.6235058, 0, 1, 0.03921569, 1,
-0.405988, 0.04500705, -1.631622, 0, 1, 0.04705882, 1,
-0.3956181, 0.9376218, -0.4842416, 0, 1, 0.05098039, 1,
-0.3933485, 2.214242, 0.6404846, 0, 1, 0.05882353, 1,
-0.392042, 0.2553997, -0.3641468, 0, 1, 0.0627451, 1,
-0.3918133, -1.243143, -2.324583, 0, 1, 0.07058824, 1,
-0.3873615, -0.1933305, -0.6620239, 0, 1, 0.07450981, 1,
-0.3849213, -0.6778182, -2.556398, 0, 1, 0.08235294, 1,
-0.3776904, -2.541674, -2.58344, 0, 1, 0.08627451, 1,
-0.3776574, -1.949138, -2.384113, 0, 1, 0.09411765, 1,
-0.3755023, 0.8490152, -0.864018, 0, 1, 0.1019608, 1,
-0.3736426, 0.4133019, -0.5098825, 0, 1, 0.1058824, 1,
-0.3731352, -1.930032, -4.605808, 0, 1, 0.1137255, 1,
-0.3723003, -0.3975886, -2.237566, 0, 1, 0.1176471, 1,
-0.3688535, -0.3546886, -1.673956, 0, 1, 0.1254902, 1,
-0.365405, 0.3092585, -0.9425963, 0, 1, 0.1294118, 1,
-0.3642972, 0.3795657, -0.2121827, 0, 1, 0.1372549, 1,
-0.3624575, 0.2520663, -0.5623356, 0, 1, 0.1411765, 1,
-0.3540719, 0.96441, -0.9640739, 0, 1, 0.1490196, 1,
-0.3529106, -0.9737459, -2.702248, 0, 1, 0.1529412, 1,
-0.346341, 0.4944833, -1.711695, 0, 1, 0.1607843, 1,
-0.3451973, -0.9554483, -2.817934, 0, 1, 0.1647059, 1,
-0.3446676, -1.442181, -3.566534, 0, 1, 0.172549, 1,
-0.3433559, 1.30738, -0.1468131, 0, 1, 0.1764706, 1,
-0.3422683, 1.37072, 0.06178923, 0, 1, 0.1843137, 1,
-0.3405714, 0.9120784, 0.1747322, 0, 1, 0.1882353, 1,
-0.3404608, 1.10931, -1.440947, 0, 1, 0.1960784, 1,
-0.3374196, 0.8753994, -1.780071, 0, 1, 0.2039216, 1,
-0.3312153, 1.413677, 0.9637318, 0, 1, 0.2078431, 1,
-0.3302812, -0.7174742, -2.75297, 0, 1, 0.2156863, 1,
-0.3255277, -1.801723, -2.749096, 0, 1, 0.2196078, 1,
-0.3212624, -2.180701, -2.516288, 0, 1, 0.227451, 1,
-0.3198591, 1.80782, 0.6582128, 0, 1, 0.2313726, 1,
-0.3195634, 0.5026135, -0.649247, 0, 1, 0.2392157, 1,
-0.3175999, -0.6523781, -3.409893, 0, 1, 0.2431373, 1,
-0.3165783, 0.5462815, -0.8337418, 0, 1, 0.2509804, 1,
-0.3139866, 0.9653539, -1.549188, 0, 1, 0.254902, 1,
-0.3130466, -0.2933017, -3.523417, 0, 1, 0.2627451, 1,
-0.3124954, 0.554018, -0.3049152, 0, 1, 0.2666667, 1,
-0.3077265, -0.3453973, -2.988791, 0, 1, 0.2745098, 1,
-0.3017277, -0.1243506, -1.258764, 0, 1, 0.2784314, 1,
-0.2997713, 0.8853807, 1.681385, 0, 1, 0.2862745, 1,
-0.2991604, 1.039418, -1.281005, 0, 1, 0.2901961, 1,
-0.2933931, 0.7985091, 1.036311, 0, 1, 0.2980392, 1,
-0.2911503, -0.6257303, -2.226599, 0, 1, 0.3058824, 1,
-0.2909439, 0.2657572, -2.544208, 0, 1, 0.3098039, 1,
-0.2904052, 1.81289, -0.02587021, 0, 1, 0.3176471, 1,
-0.2896365, 1.030793, -1.269598, 0, 1, 0.3215686, 1,
-0.2881005, 0.1949407, -0.1032719, 0, 1, 0.3294118, 1,
-0.2872375, 0.1187119, -1.085189, 0, 1, 0.3333333, 1,
-0.2842583, 1.345265, 1.473452, 0, 1, 0.3411765, 1,
-0.2831395, 0.6373016, -1.010811, 0, 1, 0.345098, 1,
-0.2826196, 1.053715, -0.5872629, 0, 1, 0.3529412, 1,
-0.2824685, -1.198344, -4.085523, 0, 1, 0.3568628, 1,
-0.2783005, 1.226544, -0.8253298, 0, 1, 0.3647059, 1,
-0.2728209, -1.171532, -3.7699, 0, 1, 0.3686275, 1,
-0.2721246, -0.09512234, -1.13324, 0, 1, 0.3764706, 1,
-0.2709615, 0.8374946, -1.553626, 0, 1, 0.3803922, 1,
-0.2686703, 2.029093, -0.1781502, 0, 1, 0.3882353, 1,
-0.2685234, -0.8980989, -2.55466, 0, 1, 0.3921569, 1,
-0.2682907, -2.101867, -5.031914, 0, 1, 0.4, 1,
-0.2638989, 0.9151238, -1.105145, 0, 1, 0.4078431, 1,
-0.2577157, -3.141751, -3.55821, 0, 1, 0.4117647, 1,
-0.2533036, 0.4020271, -0.5268884, 0, 1, 0.4196078, 1,
-0.2512453, 0.7374969, -0.7113019, 0, 1, 0.4235294, 1,
-0.246601, -0.3900378, -1.72076, 0, 1, 0.4313726, 1,
-0.2436946, -0.2083692, -3.037382, 0, 1, 0.4352941, 1,
-0.2414712, -1.545601, -3.977028, 0, 1, 0.4431373, 1,
-0.2407004, -1.499977, -2.868029, 0, 1, 0.4470588, 1,
-0.2402422, -0.5208551, -0.2411809, 0, 1, 0.454902, 1,
-0.22725, -2.128985, -4.435203, 0, 1, 0.4588235, 1,
-0.2256694, 1.299555, -1.284647, 0, 1, 0.4666667, 1,
-0.2213154, 1.199883, -0.9009551, 0, 1, 0.4705882, 1,
-0.2189227, 0.7992325, 2.186074, 0, 1, 0.4784314, 1,
-0.2185904, 0.8536903, 0.5882003, 0, 1, 0.4823529, 1,
-0.2035073, -0.7326133, -2.766676, 0, 1, 0.4901961, 1,
-0.1992369, 0.7184198, -0.9587535, 0, 1, 0.4941176, 1,
-0.1991936, -0.0409954, -0.06200977, 0, 1, 0.5019608, 1,
-0.1947949, 0.9608697, -0.7848488, 0, 1, 0.509804, 1,
-0.1880009, -1.293999, -2.628978, 0, 1, 0.5137255, 1,
-0.1874225, 0.8250343, -1.004158, 0, 1, 0.5215687, 1,
-0.1868916, -1.31587, -2.669678, 0, 1, 0.5254902, 1,
-0.1863918, 0.577827, -1.00168, 0, 1, 0.5333334, 1,
-0.1861289, -0.9099888, -0.3854701, 0, 1, 0.5372549, 1,
-0.1850644, 2.466057, -1.194358, 0, 1, 0.5450981, 1,
-0.1802496, 0.3645946, -1.449098, 0, 1, 0.5490196, 1,
-0.1780542, 0.2801508, 0.3209706, 0, 1, 0.5568628, 1,
-0.1775558, 0.2360398, -0.2959397, 0, 1, 0.5607843, 1,
-0.1773649, 0.7387486, 1.439802, 0, 1, 0.5686275, 1,
-0.1769962, 0.6464904, 0.3071209, 0, 1, 0.572549, 1,
-0.1682476, -0.9553598, -2.624286, 0, 1, 0.5803922, 1,
-0.1644286, -0.6843624, -4.052192, 0, 1, 0.5843138, 1,
-0.1633335, 0.6592414, -0.3928328, 0, 1, 0.5921569, 1,
-0.1624389, -0.4021659, -3.102411, 0, 1, 0.5960785, 1,
-0.1624368, -1.699737, -2.221677, 0, 1, 0.6039216, 1,
-0.1606346, 0.8409573, -0.9667351, 0, 1, 0.6117647, 1,
-0.159593, 0.7538305, -1.972941, 0, 1, 0.6156863, 1,
-0.1576137, 0.2282959, -1.437672, 0, 1, 0.6235294, 1,
-0.1571298, 1.553534, -0.06506277, 0, 1, 0.627451, 1,
-0.1527646, 0.4606356, -1.845387, 0, 1, 0.6352941, 1,
-0.1520755, -0.1370251, -4.702054, 0, 1, 0.6392157, 1,
-0.1484817, 0.403556, -1.322593, 0, 1, 0.6470588, 1,
-0.1436173, -0.1474689, -2.047545, 0, 1, 0.6509804, 1,
-0.1425218, 0.1758629, 0.1471234, 0, 1, 0.6588235, 1,
-0.1422782, -0.6920603, -2.485559, 0, 1, 0.6627451, 1,
-0.1422769, 1.015132, -0.0007298976, 0, 1, 0.6705883, 1,
-0.1398543, 1.418733, 0.5321989, 0, 1, 0.6745098, 1,
-0.1381973, -0.4251837, -2.334442, 0, 1, 0.682353, 1,
-0.1357055, 0.9266309, 0.5320246, 0, 1, 0.6862745, 1,
-0.1287237, -3.171608, -4.961447, 0, 1, 0.6941177, 1,
-0.1230757, -1.389867, -1.830399, 0, 1, 0.7019608, 1,
-0.1190944, -1.115377, -5.007399, 0, 1, 0.7058824, 1,
-0.1159081, -0.09413636, -2.885034, 0, 1, 0.7137255, 1,
-0.1114044, -0.9325153, -3.43238, 0, 1, 0.7176471, 1,
-0.1099151, -0.3807081, -3.372771, 0, 1, 0.7254902, 1,
-0.1061193, 0.9890777, -1.525942, 0, 1, 0.7294118, 1,
-0.1052195, -0.3858509, -6.593016, 0, 1, 0.7372549, 1,
-0.1052002, 0.2289927, -1.091272, 0, 1, 0.7411765, 1,
-0.1008667, 0.1413475, -0.4915038, 0, 1, 0.7490196, 1,
-0.09907465, -0.6250547, -2.324059, 0, 1, 0.7529412, 1,
-0.09610683, -0.5633018, -2.750547, 0, 1, 0.7607843, 1,
-0.09596025, -0.8741071, -2.823953, 0, 1, 0.7647059, 1,
-0.09065931, 0.08490021, -0.009872335, 0, 1, 0.772549, 1,
-0.09043247, 0.02004801, -1.741338, 0, 1, 0.7764706, 1,
-0.08823871, -1.60165, -2.74933, 0, 1, 0.7843137, 1,
-0.08114225, -0.4980628, -2.17338, 0, 1, 0.7882353, 1,
-0.07741629, 0.1095266, -1.631336, 0, 1, 0.7960784, 1,
-0.07473297, 0.4406008, 0.6416739, 0, 1, 0.8039216, 1,
-0.06254557, 0.03079452, -0.8909318, 0, 1, 0.8078431, 1,
-0.06111309, -1.740013, -2.421746, 0, 1, 0.8156863, 1,
-0.05943713, 1.375291, 0.4001483, 0, 1, 0.8196079, 1,
-0.05728889, 1.866172, -0.0509168, 0, 1, 0.827451, 1,
-0.05087854, 0.1125673, 0.7282367, 0, 1, 0.8313726, 1,
-0.04878936, -1.615791, -2.456484, 0, 1, 0.8392157, 1,
-0.04788043, -2.743575, -2.734543, 0, 1, 0.8431373, 1,
-0.0466318, -1.135431, -3.229763, 0, 1, 0.8509804, 1,
-0.0438221, -0.1698639, -2.141911, 0, 1, 0.854902, 1,
-0.04346208, -0.474169, -4.012071, 0, 1, 0.8627451, 1,
-0.04327538, -0.821803, -5.757483, 0, 1, 0.8666667, 1,
-0.04217088, 0.02203382, -0.5740366, 0, 1, 0.8745098, 1,
-0.04207119, -1.716005, -2.454031, 0, 1, 0.8784314, 1,
-0.04089262, 0.5633088, 1.400219, 0, 1, 0.8862745, 1,
-0.039857, -0.2962036, -4.067594, 0, 1, 0.8901961, 1,
-0.03973552, 1.220505, -1.317312, 0, 1, 0.8980392, 1,
-0.03526133, 0.2795991, -0.1922997, 0, 1, 0.9058824, 1,
-0.03255332, -1.006327, -2.759516, 0, 1, 0.9098039, 1,
-0.03049712, 0.7057518, 0.6026253, 0, 1, 0.9176471, 1,
-0.02695819, 0.4183883, 1.359357, 0, 1, 0.9215686, 1,
-0.02564848, 2.548388, -0.605109, 0, 1, 0.9294118, 1,
-0.02405959, -1.610016, -1.799271, 0, 1, 0.9333333, 1,
-0.02190924, 1.193441, -1.775411, 0, 1, 0.9411765, 1,
-0.0190428, -1.644133, -2.191899, 0, 1, 0.945098, 1,
-0.01559018, 0.01228572, -0.5427377, 0, 1, 0.9529412, 1,
-0.01438223, -0.3876653, -3.578341, 0, 1, 0.9568627, 1,
-0.01413277, -0.7761351, -3.548703, 0, 1, 0.9647059, 1,
-0.009476298, 0.8867883, 0.6194075, 0, 1, 0.9686275, 1,
-0.002630763, -1.096405, -2.551661, 0, 1, 0.9764706, 1,
-0.001546879, 1.997649, -1.433525, 0, 1, 0.9803922, 1,
-0.001223441, 0.3423149, -0.6695845, 0, 1, 0.9882353, 1,
0.005219474, 0.09248189, -2.068901, 0, 1, 0.9921569, 1,
0.007336521, -0.8521252, 3.927606, 0, 1, 1, 1,
0.00739666, -1.724484, 3.208755, 0, 0.9921569, 1, 1,
0.007745096, 1.750339, -0.251754, 0, 0.9882353, 1, 1,
0.01050291, 0.1892754, -1.269857, 0, 0.9803922, 1, 1,
0.01331723, 0.7404569, 0.4931092, 0, 0.9764706, 1, 1,
0.01478387, -0.3563199, 2.964663, 0, 0.9686275, 1, 1,
0.0248372, -0.4069898, 2.996279, 0, 0.9647059, 1, 1,
0.02513967, -0.02882131, 3.154101, 0, 0.9568627, 1, 1,
0.02786165, 0.7104854, 0.01188889, 0, 0.9529412, 1, 1,
0.02960121, -0.2202394, 3.653098, 0, 0.945098, 1, 1,
0.03435788, 1.222794, 1.735038, 0, 0.9411765, 1, 1,
0.0373741, 0.7677863, -0.3175588, 0, 0.9333333, 1, 1,
0.03772339, -1.11007, 4.055413, 0, 0.9294118, 1, 1,
0.03831819, -0.7257276, 5.005115, 0, 0.9215686, 1, 1,
0.04060338, 0.7949457, 1.437512, 0, 0.9176471, 1, 1,
0.04379481, -0.2034021, 2.571527, 0, 0.9098039, 1, 1,
0.04503497, 0.2275041, -0.4757974, 0, 0.9058824, 1, 1,
0.04652427, -0.8045706, 2.359579, 0, 0.8980392, 1, 1,
0.04696958, -1.610455, 2.075603, 0, 0.8901961, 1, 1,
0.04720841, -1.244151, 2.859084, 0, 0.8862745, 1, 1,
0.05025219, 0.1610247, 2.624603, 0, 0.8784314, 1, 1,
0.05108357, -1.403627, 3.860686, 0, 0.8745098, 1, 1,
0.0525328, 0.1537814, 1.093442, 0, 0.8666667, 1, 1,
0.05326601, -0.4352431, 2.869296, 0, 0.8627451, 1, 1,
0.05593671, 0.7214069, -1.300209, 0, 0.854902, 1, 1,
0.05923827, -1.502771, 3.098957, 0, 0.8509804, 1, 1,
0.05973896, -0.06746171, 1.923133, 0, 0.8431373, 1, 1,
0.06032851, -2.531444, 0.74143, 0, 0.8392157, 1, 1,
0.06180984, -0.3987127, 2.872589, 0, 0.8313726, 1, 1,
0.06784582, -0.2107675, 4.266624, 0, 0.827451, 1, 1,
0.06983738, -1.810315, 3.626178, 0, 0.8196079, 1, 1,
0.06997443, 0.8404904, -1.176144, 0, 0.8156863, 1, 1,
0.07051616, -1.891263, 3.064636, 0, 0.8078431, 1, 1,
0.07092445, 1.197936, 0.3269527, 0, 0.8039216, 1, 1,
0.0726471, -1.458492, 3.627591, 0, 0.7960784, 1, 1,
0.07394895, 0.4433757, 1.388622, 0, 0.7882353, 1, 1,
0.0739876, -1.770882, 2.778877, 0, 0.7843137, 1, 1,
0.0743951, 0.234247, 0.8432503, 0, 0.7764706, 1, 1,
0.07455734, 0.3026165, -0.01016823, 0, 0.772549, 1, 1,
0.08352803, -1.013684, 2.12954, 0, 0.7647059, 1, 1,
0.08415522, 0.8408228, 1.625954, 0, 0.7607843, 1, 1,
0.08868395, -0.8591552, 3.317915, 0, 0.7529412, 1, 1,
0.09163369, 0.0122104, 1.431185, 0, 0.7490196, 1, 1,
0.09598312, 1.32539, -0.6091237, 0, 0.7411765, 1, 1,
0.1020759, 1.949444, 0.2443693, 0, 0.7372549, 1, 1,
0.1046097, 0.4000819, -1.002309, 0, 0.7294118, 1, 1,
0.1046997, 0.5031818, -0.5427364, 0, 0.7254902, 1, 1,
0.1060922, 0.485617, -0.1441206, 0, 0.7176471, 1, 1,
0.1065975, 1.310703, -0.2884863, 0, 0.7137255, 1, 1,
0.1128623, 2.511006, 0.5341843, 0, 0.7058824, 1, 1,
0.1135576, -0.7382282, 3.442848, 0, 0.6980392, 1, 1,
0.1186708, -1.678429, 2.986465, 0, 0.6941177, 1, 1,
0.1252556, 1.162732, -2.224263, 0, 0.6862745, 1, 1,
0.1312143, 0.2402183, -0.4034795, 0, 0.682353, 1, 1,
0.1353334, -1.103544, 3.462327, 0, 0.6745098, 1, 1,
0.1354268, 1.178908, -1.388671, 0, 0.6705883, 1, 1,
0.1357469, -1.680324, 1.994687, 0, 0.6627451, 1, 1,
0.1399422, -1.103052, 3.222856, 0, 0.6588235, 1, 1,
0.1418472, -0.2547598, 1.912914, 0, 0.6509804, 1, 1,
0.1428586, 0.5243661, -0.2346354, 0, 0.6470588, 1, 1,
0.1431882, 1.103765, 0.4753467, 0, 0.6392157, 1, 1,
0.1481319, -0.9692471, 2.972054, 0, 0.6352941, 1, 1,
0.149978, 0.0106741, -0.3995435, 0, 0.627451, 1, 1,
0.1502473, 2.116182, 0.4311879, 0, 0.6235294, 1, 1,
0.1518602, -1.121382, 2.865682, 0, 0.6156863, 1, 1,
0.1607818, 2.022902, 0.6176921, 0, 0.6117647, 1, 1,
0.1711323, -2.553816, 1.321851, 0, 0.6039216, 1, 1,
0.1715999, -1.580742, 4.638601, 0, 0.5960785, 1, 1,
0.1735866, 0.9142697, 0.3610746, 0, 0.5921569, 1, 1,
0.1756086, 0.6275548, 0.6241678, 0, 0.5843138, 1, 1,
0.1756611, 1.565563, -0.6677004, 0, 0.5803922, 1, 1,
0.1767651, -0.1222933, 2.766798, 0, 0.572549, 1, 1,
0.178993, -0.4677523, 2.634982, 0, 0.5686275, 1, 1,
0.181829, -2.546017, 4.166426, 0, 0.5607843, 1, 1,
0.1862575, 0.9018635, -0.3860966, 0, 0.5568628, 1, 1,
0.188187, 0.6391778, 1.305297, 0, 0.5490196, 1, 1,
0.1886847, -0.2264729, 1.620382, 0, 0.5450981, 1, 1,
0.1896751, 0.5450643, -0.1579011, 0, 0.5372549, 1, 1,
0.1902799, -0.7871348, 4.580033, 0, 0.5333334, 1, 1,
0.1962393, 0.7044772, -0.4746655, 0, 0.5254902, 1, 1,
0.1974681, -0.6126803, 1.814622, 0, 0.5215687, 1, 1,
0.1975197, -0.04282688, -0.2011276, 0, 0.5137255, 1, 1,
0.1999576, -2.938047, 1.38222, 0, 0.509804, 1, 1,
0.2032599, -0.7780609, 3.145612, 0, 0.5019608, 1, 1,
0.20796, 0.5816892, 1.605875, 0, 0.4941176, 1, 1,
0.2097834, 1.478241, -1.385056, 0, 0.4901961, 1, 1,
0.2128047, 0.7437667, 1.994121, 0, 0.4823529, 1, 1,
0.2166689, -0.8109997, 1.742603, 0, 0.4784314, 1, 1,
0.2183215, -0.6642135, 3.806064, 0, 0.4705882, 1, 1,
0.2195448, -0.7247137, 3.200083, 0, 0.4666667, 1, 1,
0.2245914, 0.7289084, -0.6425781, 0, 0.4588235, 1, 1,
0.225045, -1.472026, 4.475976, 0, 0.454902, 1, 1,
0.2267646, -0.4049104, 3.256597, 0, 0.4470588, 1, 1,
0.2269096, -1.566508, 2.766384, 0, 0.4431373, 1, 1,
0.2298005, -1.129061, 2.17783, 0, 0.4352941, 1, 1,
0.2310942, 0.8305213, 1.912986, 0, 0.4313726, 1, 1,
0.2349512, 1.496628, 0.5498782, 0, 0.4235294, 1, 1,
0.2386084, -2.135672, 2.388735, 0, 0.4196078, 1, 1,
0.2386453, 1.526788, 0.07836659, 0, 0.4117647, 1, 1,
0.2388905, 0.4944129, -1.458296, 0, 0.4078431, 1, 1,
0.2456514, 1.253878, -0.5372458, 0, 0.4, 1, 1,
0.2465296, -1.720673, 2.492676, 0, 0.3921569, 1, 1,
0.2498707, -0.5222941, 4.103639, 0, 0.3882353, 1, 1,
0.2518872, -1.501463, 4.475405, 0, 0.3803922, 1, 1,
0.2533439, -0.3854428, 1.51689, 0, 0.3764706, 1, 1,
0.2557433, 0.5466855, 0.8607261, 0, 0.3686275, 1, 1,
0.2574071, -0.04383448, 1.619576, 0, 0.3647059, 1, 1,
0.2591368, -0.5009334, 1.420496, 0, 0.3568628, 1, 1,
0.2610303, -1.136508, 3.093517, 0, 0.3529412, 1, 1,
0.2658625, 0.8591998, 1.678964, 0, 0.345098, 1, 1,
0.2675048, 1.421153, 0.5258052, 0, 0.3411765, 1, 1,
0.2696309, -0.3547111, 1.935365, 0, 0.3333333, 1, 1,
0.2697502, -0.4275994, 2.312562, 0, 0.3294118, 1, 1,
0.2717994, 0.8136046, -1.315015, 0, 0.3215686, 1, 1,
0.2809302, 0.6509511, 1.647913, 0, 0.3176471, 1, 1,
0.2814839, -0.5049461, 1.092106, 0, 0.3098039, 1, 1,
0.281743, -0.3897114, 1.726753, 0, 0.3058824, 1, 1,
0.2819842, 1.352173, 0.5466945, 0, 0.2980392, 1, 1,
0.2821854, 0.3278226, 1.06589, 0, 0.2901961, 1, 1,
0.2841516, 0.3099436, 1.511191, 0, 0.2862745, 1, 1,
0.2848646, -0.1772018, 3.960429, 0, 0.2784314, 1, 1,
0.2881324, -0.1125567, 1.092746, 0, 0.2745098, 1, 1,
0.2915963, -0.8322703, 3.312188, 0, 0.2666667, 1, 1,
0.2918672, 0.2095458, 2.209187, 0, 0.2627451, 1, 1,
0.2961327, -2.025746, 2.067884, 0, 0.254902, 1, 1,
0.2966845, -0.5225974, 2.120885, 0, 0.2509804, 1, 1,
0.2978237, -0.3583701, 1.915838, 0, 0.2431373, 1, 1,
0.2990078, 2.242644, 0.9177541, 0, 0.2392157, 1, 1,
0.3012547, -1.26319, 4.129096, 0, 0.2313726, 1, 1,
0.3050115, 1.874231, -1.615156, 0, 0.227451, 1, 1,
0.3078003, 0.75141, -0.9843242, 0, 0.2196078, 1, 1,
0.3091035, 0.9117911, -0.9681869, 0, 0.2156863, 1, 1,
0.310064, -0.9128013, 1.318546, 0, 0.2078431, 1, 1,
0.3107612, 1.166164, -1.655261, 0, 0.2039216, 1, 1,
0.3123622, 0.2879695, 0.5311111, 0, 0.1960784, 1, 1,
0.3232422, 1.385308, 1.341436, 0, 0.1882353, 1, 1,
0.3268376, -0.609997, 2.770225, 0, 0.1843137, 1, 1,
0.3272833, -1.270525, 2.949385, 0, 0.1764706, 1, 1,
0.3297269, 0.1575906, 0.9803829, 0, 0.172549, 1, 1,
0.3323086, 1.819807, 2.665449, 0, 0.1647059, 1, 1,
0.3325188, -1.242788, 2.346845, 0, 0.1607843, 1, 1,
0.3346303, 0.7934307, 1.371657, 0, 0.1529412, 1, 1,
0.3375793, -1.085883, 1.860773, 0, 0.1490196, 1, 1,
0.3421557, -0.06133414, 1.541735, 0, 0.1411765, 1, 1,
0.3454758, 0.5223414, 0.3777238, 0, 0.1372549, 1, 1,
0.3565395, -0.4746006, 3.766472, 0, 0.1294118, 1, 1,
0.3596075, 1.678605, 1.756954, 0, 0.1254902, 1, 1,
0.3597895, 0.2527545, 0.04953473, 0, 0.1176471, 1, 1,
0.3659793, -1.56907, 2.789211, 0, 0.1137255, 1, 1,
0.3706521, -0.3150303, 1.000121, 0, 0.1058824, 1, 1,
0.3723028, 0.00771612, 2.863595, 0, 0.09803922, 1, 1,
0.3732437, 0.5440837, -0.7866676, 0, 0.09411765, 1, 1,
0.3761503, -0.6952491, 3.064287, 0, 0.08627451, 1, 1,
0.3804091, 0.3305629, 1.650488, 0, 0.08235294, 1, 1,
0.3810896, -0.5356652, 4.666892, 0, 0.07450981, 1, 1,
0.3816011, 0.9630895, 1.36517, 0, 0.07058824, 1, 1,
0.3835552, -0.277874, 0.7607782, 0, 0.0627451, 1, 1,
0.386288, -1.823648, 2.182224, 0, 0.05882353, 1, 1,
0.3863014, -0.09665073, 1.725767, 0, 0.05098039, 1, 1,
0.3882433, -0.3701023, 1.074814, 0, 0.04705882, 1, 1,
0.3889867, -0.4790331, 1.108525, 0, 0.03921569, 1, 1,
0.3894707, -0.343048, 2.712929, 0, 0.03529412, 1, 1,
0.400132, 0.593052, 1.990008, 0, 0.02745098, 1, 1,
0.4002187, -1.390517, 3.402272, 0, 0.02352941, 1, 1,
0.4009816, -0.1206486, 1.084072, 0, 0.01568628, 1, 1,
0.4063148, -0.06912909, 2.205412, 0, 0.01176471, 1, 1,
0.4068452, -0.02200773, -0.01798864, 0, 0.003921569, 1, 1,
0.4079235, 0.1366773, 0.9423514, 0.003921569, 0, 1, 1,
0.4100642, 0.6290394, 2.051557, 0.007843138, 0, 1, 1,
0.4104417, 0.7637627, -0.238538, 0.01568628, 0, 1, 1,
0.4113291, 0.2238182, 2.231172, 0.01960784, 0, 1, 1,
0.420115, -0.4685767, 2.795479, 0.02745098, 0, 1, 1,
0.422062, 0.1524747, 0.8566387, 0.03137255, 0, 1, 1,
0.4236415, -0.5181848, 5.397094, 0.03921569, 0, 1, 1,
0.4285679, 0.06119177, 0.6793493, 0.04313726, 0, 1, 1,
0.4294736, -0.3596565, 1.77012, 0.05098039, 0, 1, 1,
0.4307117, -0.278843, 2.387137, 0.05490196, 0, 1, 1,
0.4320213, -1.076594, 2.661581, 0.0627451, 0, 1, 1,
0.4330473, -0.76226, 3.755891, 0.06666667, 0, 1, 1,
0.4336203, -1.577995, 2.311475, 0.07450981, 0, 1, 1,
0.4394782, 0.09537264, 3.786944, 0.07843138, 0, 1, 1,
0.4403909, -0.1553167, 3.20567, 0.08627451, 0, 1, 1,
0.441919, 0.3747345, 1.918925, 0.09019608, 0, 1, 1,
0.4436053, 1.074464, -0.6370255, 0.09803922, 0, 1, 1,
0.4444388, 0.4398156, 0.345476, 0.1058824, 0, 1, 1,
0.4486349, -0.3148482, 2.83248, 0.1098039, 0, 1, 1,
0.4556192, -0.6071746, 1.730793, 0.1176471, 0, 1, 1,
0.4565659, 0.9738503, 0.3212059, 0.1215686, 0, 1, 1,
0.4566247, -0.8243629, 4.290063, 0.1294118, 0, 1, 1,
0.4596716, -1.131869, 4.011256, 0.1333333, 0, 1, 1,
0.4623692, -0.892597, 2.929587, 0.1411765, 0, 1, 1,
0.467989, -1.210866, 2.51636, 0.145098, 0, 1, 1,
0.4713184, 0.7674378, -2.058863, 0.1529412, 0, 1, 1,
0.4716757, 1.130122, 0.9420701, 0.1568628, 0, 1, 1,
0.4737157, 0.2276707, 2.694325, 0.1647059, 0, 1, 1,
0.4786589, -0.3212353, 1.417037, 0.1686275, 0, 1, 1,
0.4810487, 0.7527021, 2.395453, 0.1764706, 0, 1, 1,
0.4827841, -0.6401379, 2.311529, 0.1803922, 0, 1, 1,
0.4839465, 0.1780609, 0.8059226, 0.1882353, 0, 1, 1,
0.486785, -1.026395, 2.918993, 0.1921569, 0, 1, 1,
0.4954355, 1.325868, 0.3491726, 0.2, 0, 1, 1,
0.4958138, -1.396833, 3.811832, 0.2078431, 0, 1, 1,
0.4973376, -0.2561729, 2.20935, 0.2117647, 0, 1, 1,
0.501298, -0.0593897, 2.550748, 0.2196078, 0, 1, 1,
0.5042223, -1.104773, 3.605587, 0.2235294, 0, 1, 1,
0.5096394, -0.5313304, 3.561392, 0.2313726, 0, 1, 1,
0.5124345, 0.8611047, 0.8311423, 0.2352941, 0, 1, 1,
0.5155011, -0.8005052, 2.187433, 0.2431373, 0, 1, 1,
0.5195767, 1.385908, 0.8366608, 0.2470588, 0, 1, 1,
0.5210251, -1.11863, 2.013318, 0.254902, 0, 1, 1,
0.5238318, -1.01526, 2.586113, 0.2588235, 0, 1, 1,
0.5262324, -0.1128431, 1.847295, 0.2666667, 0, 1, 1,
0.528804, 0.6534775, 1.679565, 0.2705882, 0, 1, 1,
0.5308421, 0.2882044, 1.955596, 0.2784314, 0, 1, 1,
0.5312181, -0.004858346, 3.720719, 0.282353, 0, 1, 1,
0.535228, 0.1957789, 0.763092, 0.2901961, 0, 1, 1,
0.5367002, -0.006535218, 1.807717, 0.2941177, 0, 1, 1,
0.53706, -0.04473086, 0.5387807, 0.3019608, 0, 1, 1,
0.545476, 0.3882003, -0.5440865, 0.3098039, 0, 1, 1,
0.5463781, -0.1465715, 1.554773, 0.3137255, 0, 1, 1,
0.5548148, -0.7392898, 0.7777678, 0.3215686, 0, 1, 1,
0.5577238, 1.188219, 0.7585924, 0.3254902, 0, 1, 1,
0.5579305, 0.4823711, 0.7792268, 0.3333333, 0, 1, 1,
0.5595274, -1.038217, 3.929627, 0.3372549, 0, 1, 1,
0.5619924, -0.1273346, -0.3890048, 0.345098, 0, 1, 1,
0.5643852, 0.7748479, 0.3177202, 0.3490196, 0, 1, 1,
0.5678856, -0.4070061, 2.787609, 0.3568628, 0, 1, 1,
0.5695803, -0.1106123, 1.354393, 0.3607843, 0, 1, 1,
0.5752068, -0.1728416, 2.509423, 0.3686275, 0, 1, 1,
0.5792487, -0.1762536, 2.24234, 0.372549, 0, 1, 1,
0.5794089, -1.2273, 1.440679, 0.3803922, 0, 1, 1,
0.5843453, -0.7503074, 2.689815, 0.3843137, 0, 1, 1,
0.5847256, 0.8734693, 0.5439789, 0.3921569, 0, 1, 1,
0.5859113, 1.87165, -1.111624, 0.3960784, 0, 1, 1,
0.5869333, 0.6162116, 1.247344, 0.4039216, 0, 1, 1,
0.5897409, 1.309276, -0.3591521, 0.4117647, 0, 1, 1,
0.5923081, -0.5710853, 3.439115, 0.4156863, 0, 1, 1,
0.5934244, 0.1811665, 0.7249774, 0.4235294, 0, 1, 1,
0.5952855, 0.5219173, -0.271657, 0.427451, 0, 1, 1,
0.6023575, 1.296526, -0.4657232, 0.4352941, 0, 1, 1,
0.6072198, -0.6137403, 2.482935, 0.4392157, 0, 1, 1,
0.6086994, -0.1579134, -0.30237, 0.4470588, 0, 1, 1,
0.6087069, 0.7217203, -0.02971966, 0.4509804, 0, 1, 1,
0.6125773, -1.287378, 3.268915, 0.4588235, 0, 1, 1,
0.6129266, -0.2391688, 1.939924, 0.4627451, 0, 1, 1,
0.6203735, 0.6248993, -0.8661684, 0.4705882, 0, 1, 1,
0.6208115, 0.9082721, -0.7850485, 0.4745098, 0, 1, 1,
0.6273672, -0.891643, 2.171273, 0.4823529, 0, 1, 1,
0.6282355, 0.2066414, 1.481176, 0.4862745, 0, 1, 1,
0.6331696, -0.2630629, 2.429674, 0.4941176, 0, 1, 1,
0.6346235, -0.7020471, 2.161265, 0.5019608, 0, 1, 1,
0.6402127, 0.5965092, -0.6527892, 0.5058824, 0, 1, 1,
0.6437089, 0.9700362, -1.085151, 0.5137255, 0, 1, 1,
0.6440784, -1.53617, 2.897593, 0.5176471, 0, 1, 1,
0.6452413, 0.7445288, 1.155576, 0.5254902, 0, 1, 1,
0.6460947, -0.5379788, 4.232581, 0.5294118, 0, 1, 1,
0.6475103, 0.3670999, 2.642202, 0.5372549, 0, 1, 1,
0.6488003, -0.5872757, 2.950781, 0.5411765, 0, 1, 1,
0.651033, 0.284702, 1.051679, 0.5490196, 0, 1, 1,
0.6536028, 1.132492, -0.8996398, 0.5529412, 0, 1, 1,
0.6574197, 0.3939501, 0.6651411, 0.5607843, 0, 1, 1,
0.658544, 0.5451656, 2.182332, 0.5647059, 0, 1, 1,
0.6724619, -0.3687528, 1.977258, 0.572549, 0, 1, 1,
0.6743277, -0.900375, 2.098386, 0.5764706, 0, 1, 1,
0.6763715, -1.319046, 1.999772, 0.5843138, 0, 1, 1,
0.6794493, -0.831422, 3.214502, 0.5882353, 0, 1, 1,
0.6820869, -0.6636454, 3.008352, 0.5960785, 0, 1, 1,
0.6924803, 1.026682, 0.4792217, 0.6039216, 0, 1, 1,
0.6927021, 0.5851046, 2.71017, 0.6078432, 0, 1, 1,
0.6949024, -0.01770184, 0.8890817, 0.6156863, 0, 1, 1,
0.7038338, -0.6036018, 2.824768, 0.6196079, 0, 1, 1,
0.7055925, 1.265506, 2.308259, 0.627451, 0, 1, 1,
0.7151507, 1.396891, -1.323189, 0.6313726, 0, 1, 1,
0.7164001, 0.8496957, 0.227465, 0.6392157, 0, 1, 1,
0.7193857, 1.261679, 0.5725681, 0.6431373, 0, 1, 1,
0.7276171, 0.1214423, 2.51242, 0.6509804, 0, 1, 1,
0.7373542, 2.499283, -1.939074, 0.654902, 0, 1, 1,
0.7406909, -0.9499198, 3.26313, 0.6627451, 0, 1, 1,
0.7430267, 0.160272, 1.727358, 0.6666667, 0, 1, 1,
0.7475634, 0.9923813, 2.341395, 0.6745098, 0, 1, 1,
0.7511246, -1.09395, 1.721488, 0.6784314, 0, 1, 1,
0.755756, 2.220399, -0.508872, 0.6862745, 0, 1, 1,
0.758952, 0.9054924, 0.4399272, 0.6901961, 0, 1, 1,
0.7601717, 1.779836, 0.9226152, 0.6980392, 0, 1, 1,
0.7662037, -0.0408911, 2.461388, 0.7058824, 0, 1, 1,
0.7678761, -0.5176314, 1.592692, 0.7098039, 0, 1, 1,
0.770092, 0.7070303, -0.4368397, 0.7176471, 0, 1, 1,
0.7728138, 0.9315543, 0.6818726, 0.7215686, 0, 1, 1,
0.7778893, -1.838905, 3.554937, 0.7294118, 0, 1, 1,
0.7797036, 1.468704, 1.285153, 0.7333333, 0, 1, 1,
0.7839999, -0.689218, 2.492265, 0.7411765, 0, 1, 1,
0.785182, 1.267429, 2.585238, 0.7450981, 0, 1, 1,
0.7878235, -2.041939, 3.43864, 0.7529412, 0, 1, 1,
0.791722, 0.3978465, 3.26016, 0.7568628, 0, 1, 1,
0.7961954, 0.2828542, 1.280001, 0.7647059, 0, 1, 1,
0.7973551, -0.4962579, 0.3881757, 0.7686275, 0, 1, 1,
0.7980899, 0.9082768, -1.14007, 0.7764706, 0, 1, 1,
0.7988478, -0.01784579, 1.169352, 0.7803922, 0, 1, 1,
0.8048379, -0.9761419, 1.898943, 0.7882353, 0, 1, 1,
0.806281, -1.120128, 1.132549, 0.7921569, 0, 1, 1,
0.8110449, -0.4404802, 2.19486, 0.8, 0, 1, 1,
0.8135691, 1.835366, 0.001549206, 0.8078431, 0, 1, 1,
0.8178315, -0.7195046, 2.159178, 0.8117647, 0, 1, 1,
0.8266057, 0.07520543, 1.163773, 0.8196079, 0, 1, 1,
0.8335802, -1.9652, 3.016362, 0.8235294, 0, 1, 1,
0.8343511, 0.343978, 1.519828, 0.8313726, 0, 1, 1,
0.8347912, -1.688501, 1.717202, 0.8352941, 0, 1, 1,
0.8352485, 0.8424218, -0.1771952, 0.8431373, 0, 1, 1,
0.8365477, -1.027947, 4.121795, 0.8470588, 0, 1, 1,
0.8400302, 0.518981, 3.514813, 0.854902, 0, 1, 1,
0.8442921, -0.5385308, 1.278268, 0.8588235, 0, 1, 1,
0.8482592, 0.1649944, 2.394084, 0.8666667, 0, 1, 1,
0.850357, 1.743659, -0.5145457, 0.8705882, 0, 1, 1,
0.8546478, 1.936248, 0.4994135, 0.8784314, 0, 1, 1,
0.8612135, -0.5748248, 1.187263, 0.8823529, 0, 1, 1,
0.8708335, 0.4047261, 1.879839, 0.8901961, 0, 1, 1,
0.8907267, 1.525586, 1.146697, 0.8941177, 0, 1, 1,
0.891629, 1.157358, -0.2922961, 0.9019608, 0, 1, 1,
0.8938083, 0.7133173, 0.6953886, 0.9098039, 0, 1, 1,
0.899178, 1.477826, 0.5596603, 0.9137255, 0, 1, 1,
0.9020523, -0.2086183, 1.288655, 0.9215686, 0, 1, 1,
0.9024405, -1.392098, 2.505774, 0.9254902, 0, 1, 1,
0.9043291, 0.04685138, 1.730959, 0.9333333, 0, 1, 1,
0.9047465, -0.4000671, 1.037784, 0.9372549, 0, 1, 1,
0.9126941, 1.607932, 0.3375198, 0.945098, 0, 1, 1,
0.9139251, -0.2752889, 3.239504, 0.9490196, 0, 1, 1,
0.9174183, 0.9594895, 0.4300407, 0.9568627, 0, 1, 1,
0.9191375, -1.30945, 2.265501, 0.9607843, 0, 1, 1,
0.9223155, -0.8260992, 1.62175, 0.9686275, 0, 1, 1,
0.923315, -0.4259093, 0.9312691, 0.972549, 0, 1, 1,
0.9389418, 0.2930532, -0.2955748, 0.9803922, 0, 1, 1,
0.9460284, 1.5378, -0.4690741, 0.9843137, 0, 1, 1,
0.9502786, 0.9300843, -1.04633, 0.9921569, 0, 1, 1,
0.9554273, -0.797621, 2.202597, 0.9960784, 0, 1, 1,
0.961527, -0.4530204, 2.321008, 1, 0, 0.9960784, 1,
0.9667578, 0.2834359, 1.510106, 1, 0, 0.9882353, 1,
0.9688244, -0.4384294, 3.11538, 1, 0, 0.9843137, 1,
0.9717758, -0.4155918, 1.232402, 1, 0, 0.9764706, 1,
0.9736131, 0.8534241, 1.733207, 1, 0, 0.972549, 1,
0.9793946, 1.530394, 0.02405528, 1, 0, 0.9647059, 1,
0.9808571, -0.4688362, 2.89381, 1, 0, 0.9607843, 1,
0.9827811, 1.486805, 1.513358, 1, 0, 0.9529412, 1,
0.9838142, -0.2083595, 2.233919, 1, 0, 0.9490196, 1,
0.9849045, 1.826966, 0.9043106, 1, 0, 0.9411765, 1,
0.985544, 0.3708084, 0.3723729, 1, 0, 0.9372549, 1,
0.9874926, 1.171024, 0.8590261, 1, 0, 0.9294118, 1,
0.988528, -0.958584, 1.677194, 1, 0, 0.9254902, 1,
0.9895214, 0.5753884, 0.6246245, 1, 0, 0.9176471, 1,
0.9951614, 0.182713, 0.891836, 1, 0, 0.9137255, 1,
0.9972665, 1.981297, -0.9837854, 1, 0, 0.9058824, 1,
0.9981739, -1.283845, 1.287947, 1, 0, 0.9019608, 1,
1.00008, -0.0003567351, 1.697516, 1, 0, 0.8941177, 1,
1.011023, 0.3951586, 1.584131, 1, 0, 0.8862745, 1,
1.013567, -0.7002926, 0.4711801, 1, 0, 0.8823529, 1,
1.019806, 1.426672, 0.5520747, 1, 0, 0.8745098, 1,
1.023908, -1.323478, 2.872675, 1, 0, 0.8705882, 1,
1.025484, 0.6425612, 1.646363, 1, 0, 0.8627451, 1,
1.039292, -1.315858, 3.943483, 1, 0, 0.8588235, 1,
1.04924, 1.059528, 1.346877, 1, 0, 0.8509804, 1,
1.060129, 1.044557, 1.629233, 1, 0, 0.8470588, 1,
1.065978, 1.200417, -0.8990998, 1, 0, 0.8392157, 1,
1.070146, -0.6906959, 1.142522, 1, 0, 0.8352941, 1,
1.071245, -0.6446761, 0.9790369, 1, 0, 0.827451, 1,
1.079757, 0.2650406, 1.614578, 1, 0, 0.8235294, 1,
1.081892, 0.2964908, 2.307276, 1, 0, 0.8156863, 1,
1.088686, 1.410137, 0.5760174, 1, 0, 0.8117647, 1,
1.117323, 0.4973344, 1.312711, 1, 0, 0.8039216, 1,
1.123622, -0.3041098, 0.324271, 1, 0, 0.7960784, 1,
1.124048, 1.815082, 1.112232, 1, 0, 0.7921569, 1,
1.126407, -0.5754754, 1.228992, 1, 0, 0.7843137, 1,
1.129186, 1.320334, 1.822646, 1, 0, 0.7803922, 1,
1.131789, 0.3582065, 0.6924137, 1, 0, 0.772549, 1,
1.134179, -1.617929, 1.396444, 1, 0, 0.7686275, 1,
1.138727, 0.6049442, 1.279137, 1, 0, 0.7607843, 1,
1.147558, -0.6879053, 2.884773, 1, 0, 0.7568628, 1,
1.151044, 1.132609, 1.682191, 1, 0, 0.7490196, 1,
1.15166, -0.7490007, 2.377039, 1, 0, 0.7450981, 1,
1.156122, 0.8024167, 1.000504, 1, 0, 0.7372549, 1,
1.156725, 0.8079561, 0.3299411, 1, 0, 0.7333333, 1,
1.162336, -0.3238078, 0.657654, 1, 0, 0.7254902, 1,
1.164305, 0.06131947, 1.491531, 1, 0, 0.7215686, 1,
1.168099, -0.2453029, 3.479584, 1, 0, 0.7137255, 1,
1.168508, 0.9126559, -0.2091094, 1, 0, 0.7098039, 1,
1.168637, -0.2795581, -0.4057922, 1, 0, 0.7019608, 1,
1.187669, 0.1711599, 0.8177434, 1, 0, 0.6941177, 1,
1.18789, 0.7062277, 2.229528, 1, 0, 0.6901961, 1,
1.206443, -0.4834698, 4.101716, 1, 0, 0.682353, 1,
1.232803, 0.1317145, 1.1737, 1, 0, 0.6784314, 1,
1.235063, 0.2698377, 0.8717319, 1, 0, 0.6705883, 1,
1.239414, 0.62336, 0.8251206, 1, 0, 0.6666667, 1,
1.244789, -0.02538251, 3.514822, 1, 0, 0.6588235, 1,
1.251351, -1.775644, 1.459442, 1, 0, 0.654902, 1,
1.256543, 0.2991453, 0.5335622, 1, 0, 0.6470588, 1,
1.260915, -0.5638056, 2.473642, 1, 0, 0.6431373, 1,
1.270223, -0.03184688, 2.012648, 1, 0, 0.6352941, 1,
1.270353, 1.383013, 2.328358, 1, 0, 0.6313726, 1,
1.271302, -1.563942, 1.949347, 1, 0, 0.6235294, 1,
1.285285, 0.7914067, 1.181696, 1, 0, 0.6196079, 1,
1.285386, 0.8824336, -0.9704143, 1, 0, 0.6117647, 1,
1.291797, 1.680467, 0.7537364, 1, 0, 0.6078432, 1,
1.293462, 1.588306, 0.9996343, 1, 0, 0.6, 1,
1.295237, -0.8711385, 1.843543, 1, 0, 0.5921569, 1,
1.295443, 0.5155942, -0.3530435, 1, 0, 0.5882353, 1,
1.310689, 0.3834823, -1.61747, 1, 0, 0.5803922, 1,
1.315407, 0.05015093, 2.771599, 1, 0, 0.5764706, 1,
1.318841, 0.125216, 0.6909932, 1, 0, 0.5686275, 1,
1.319138, 2.406974, -0.1818661, 1, 0, 0.5647059, 1,
1.329073, -0.3131973, 0.20801, 1, 0, 0.5568628, 1,
1.341737, -0.1982912, 2.588496, 1, 0, 0.5529412, 1,
1.341748, 1.579109, 1.922622, 1, 0, 0.5450981, 1,
1.354995, 0.9850699, 1.389014, 1, 0, 0.5411765, 1,
1.356172, -0.7527075, 2.520749, 1, 0, 0.5333334, 1,
1.356688, 0.3328849, 2.394051, 1, 0, 0.5294118, 1,
1.362535, 0.3466035, 2.72131, 1, 0, 0.5215687, 1,
1.366742, 2.488587, 0.8461263, 1, 0, 0.5176471, 1,
1.376728, 0.7883982, 0.9818587, 1, 0, 0.509804, 1,
1.377962, 0.3326303, 2.769127, 1, 0, 0.5058824, 1,
1.382249, 0.616901, 0.207, 1, 0, 0.4980392, 1,
1.382566, -0.5516204, 3.218183, 1, 0, 0.4901961, 1,
1.391408, 1.764861, 0.04099719, 1, 0, 0.4862745, 1,
1.413843, 1.915127, 0.4493184, 1, 0, 0.4784314, 1,
1.421146, -0.9976676, 1.171769, 1, 0, 0.4745098, 1,
1.460141, -0.293907, -0.4062153, 1, 0, 0.4666667, 1,
1.478364, 0.3789593, 0.7299374, 1, 0, 0.4627451, 1,
1.484489, -0.9301203, 2.081916, 1, 0, 0.454902, 1,
1.496905, -0.004279692, 2.390675, 1, 0, 0.4509804, 1,
1.500314, 0.05677433, 1.499152, 1, 0, 0.4431373, 1,
1.50482, 0.2422647, 1.828662, 1, 0, 0.4392157, 1,
1.505146, 0.001565161, 2.613685, 1, 0, 0.4313726, 1,
1.513223, 2.017159, 1.68867, 1, 0, 0.427451, 1,
1.513736, 0.2734996, 1.353119, 1, 0, 0.4196078, 1,
1.518054, 0.2045907, 1.886994, 1, 0, 0.4156863, 1,
1.535479, 1.088483, -0.1920392, 1, 0, 0.4078431, 1,
1.536577, 0.3729186, 1.119513, 1, 0, 0.4039216, 1,
1.537557, -0.01289553, 1.842151, 1, 0, 0.3960784, 1,
1.538952, 0.6299233, 2.749604, 1, 0, 0.3882353, 1,
1.540195, -0.2113484, 2.889618, 1, 0, 0.3843137, 1,
1.565099, -0.3689328, 1.779832, 1, 0, 0.3764706, 1,
1.596992, -0.4370871, 1.843196, 1, 0, 0.372549, 1,
1.598644, 0.07330304, 1.719987, 1, 0, 0.3647059, 1,
1.608921, -0.7568475, 0.1067885, 1, 0, 0.3607843, 1,
1.609603, 0.2427243, 2.014891, 1, 0, 0.3529412, 1,
1.618635, -0.5489724, 1.724965, 1, 0, 0.3490196, 1,
1.626535, -0.1274955, 0.6373547, 1, 0, 0.3411765, 1,
1.638061, 0.001698095, 1.012673, 1, 0, 0.3372549, 1,
1.665586, -0.4654183, 2.970503, 1, 0, 0.3294118, 1,
1.688433, 1.518629, 0.9770396, 1, 0, 0.3254902, 1,
1.692347, -0.4849699, 2.973661, 1, 0, 0.3176471, 1,
1.697271, 0.8574113, 1.344292, 1, 0, 0.3137255, 1,
1.700351, 2.031636, 0.1539586, 1, 0, 0.3058824, 1,
1.704715, -0.7219769, 0.2010589, 1, 0, 0.2980392, 1,
1.722914, 0.5283481, 1.356391, 1, 0, 0.2941177, 1,
1.723215, 0.674933, 0.5023852, 1, 0, 0.2862745, 1,
1.738513, -1.017896, 4.209662, 1, 0, 0.282353, 1,
1.747041, -1.036261, 3.544775, 1, 0, 0.2745098, 1,
1.752633, -0.01036979, 0.4070575, 1, 0, 0.2705882, 1,
1.755945, -0.3787032, 1.613135, 1, 0, 0.2627451, 1,
1.761546, -1.009245, 1.915376, 1, 0, 0.2588235, 1,
1.77087, 0.6027479, 1.105339, 1, 0, 0.2509804, 1,
1.771885, -0.3095568, -0.07819122, 1, 0, 0.2470588, 1,
1.774053, -0.3054844, 3.241266, 1, 0, 0.2392157, 1,
1.786654, -1.032881, 2.422842, 1, 0, 0.2352941, 1,
1.80273, 0.1898997, 2.570147, 1, 0, 0.227451, 1,
1.812383, 1.49229, 2.476092, 1, 0, 0.2235294, 1,
1.814591, 0.5862638, 1.000411, 1, 0, 0.2156863, 1,
1.832883, -0.8361576, 1.040128, 1, 0, 0.2117647, 1,
1.834956, -0.2966295, 3.001375, 1, 0, 0.2039216, 1,
1.8359, -1.974838, 2.015648, 1, 0, 0.1960784, 1,
1.84405, -1.13556, 2.339721, 1, 0, 0.1921569, 1,
1.861979, 0.04156438, 2.079727, 1, 0, 0.1843137, 1,
1.880344, 0.8484827, 1.673062, 1, 0, 0.1803922, 1,
1.890866, 0.7094081, 2.281725, 1, 0, 0.172549, 1,
1.892902, 0.7626736, 1.302166, 1, 0, 0.1686275, 1,
1.897235, 0.6805367, 0.5541695, 1, 0, 0.1607843, 1,
1.915517, -0.1806986, 1.402316, 1, 0, 0.1568628, 1,
1.933817, -0.1729346, 2.286487, 1, 0, 0.1490196, 1,
1.934381, -0.8558017, 1.223814, 1, 0, 0.145098, 1,
1.946675, -0.2244093, 3.528228, 1, 0, 0.1372549, 1,
1.948779, -0.1852422, 1.581433, 1, 0, 0.1333333, 1,
1.972666, 0.9212914, 1.67689, 1, 0, 0.1254902, 1,
1.977371, -1.760992, 3.174774, 1, 0, 0.1215686, 1,
2.028367, -0.7277088, 2.904076, 1, 0, 0.1137255, 1,
2.076954, -1.201011, 2.804342, 1, 0, 0.1098039, 1,
2.100275, -0.4791693, 3.248943, 1, 0, 0.1019608, 1,
2.101359, 0.09366857, 1.616731, 1, 0, 0.09411765, 1,
2.10319, 0.6602525, 2.303463, 1, 0, 0.09019608, 1,
2.178245, -0.8506979, 2.704798, 1, 0, 0.08235294, 1,
2.257899, -0.1483261, 2.263803, 1, 0, 0.07843138, 1,
2.329393, 1.31326, 0.3373209, 1, 0, 0.07058824, 1,
2.381321, 0.1438935, 0.4899318, 1, 0, 0.06666667, 1,
2.42309, 0.5919582, 1.064713, 1, 0, 0.05882353, 1,
2.433513, -0.9643899, 1.88746, 1, 0, 0.05490196, 1,
2.459629, 0.6321069, 2.006543, 1, 0, 0.04705882, 1,
2.499192, 0.8793076, 3.799177, 1, 0, 0.04313726, 1,
2.625413, -0.6261619, 1.596285, 1, 0, 0.03529412, 1,
2.707435, 1.332368, 1.410651, 1, 0, 0.03137255, 1,
2.792, 0.6157671, 2.816477, 1, 0, 0.02352941, 1,
2.814147, 2.416277, 1.270749, 1, 0, 0.01960784, 1,
2.835662, -0.8498427, 1.200907, 1, 0, 0.01176471, 1,
3.059489, 1.029836, 2.268957, 1, 0, 0.007843138, 1
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
-0.07256532, -4.222649, -8.62534, 0, -0.5, 0.5, 0.5,
-0.07256532, -4.222649, -8.62534, 1, -0.5, 0.5, 0.5,
-0.07256532, -4.222649, -8.62534, 1, 1.5, 0.5, 0.5,
-0.07256532, -4.222649, -8.62534, 0, 1.5, 0.5, 0.5
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
-4.266386, -0.07119155, -8.62534, 0, -0.5, 0.5, 0.5,
-4.266386, -0.07119155, -8.62534, 1, -0.5, 0.5, 0.5,
-4.266386, -0.07119155, -8.62534, 1, 1.5, 0.5, 0.5,
-4.266386, -0.07119155, -8.62534, 0, 1.5, 0.5, 0.5
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
-4.266386, -4.222649, -0.5979609, 0, -0.5, 0.5, 0.5,
-4.266386, -4.222649, -0.5979609, 1, -0.5, 0.5, 0.5,
-4.266386, -4.222649, -0.5979609, 1, 1.5, 0.5, 0.5,
-4.266386, -4.222649, -0.5979609, 0, 1.5, 0.5, 0.5
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
-3, -3.26462, -6.772868,
3, -3.26462, -6.772868,
-3, -3.26462, -6.772868,
-3, -3.424292, -7.081613,
-2, -3.26462, -6.772868,
-2, -3.424292, -7.081613,
-1, -3.26462, -6.772868,
-1, -3.424292, -7.081613,
0, -3.26462, -6.772868,
0, -3.424292, -7.081613,
1, -3.26462, -6.772868,
1, -3.424292, -7.081613,
2, -3.26462, -6.772868,
2, -3.424292, -7.081613,
3, -3.26462, -6.772868,
3, -3.424292, -7.081613
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
-3, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
-3, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
-3, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
-3, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
-2, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
-2, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
-2, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
-2, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
-1, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
-1, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
-1, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
-1, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
0, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
0, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
0, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
0, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
1, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
1, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
1, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
1, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
2, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
2, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
2, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
2, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5,
3, -3.743634, -7.699104, 0, -0.5, 0.5, 0.5,
3, -3.743634, -7.699104, 1, -0.5, 0.5, 0.5,
3, -3.743634, -7.699104, 1, 1.5, 0.5, 0.5,
3, -3.743634, -7.699104, 0, 1.5, 0.5, 0.5
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
-3.298581, -3, -6.772868,
-3.298581, 3, -6.772868,
-3.298581, -3, -6.772868,
-3.459882, -3, -7.081613,
-3.298581, -2, -6.772868,
-3.459882, -2, -7.081613,
-3.298581, -1, -6.772868,
-3.459882, -1, -7.081613,
-3.298581, 0, -6.772868,
-3.459882, 0, -7.081613,
-3.298581, 1, -6.772868,
-3.459882, 1, -7.081613,
-3.298581, 2, -6.772868,
-3.459882, 2, -7.081613,
-3.298581, 3, -6.772868,
-3.459882, 3, -7.081613
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
-3.782484, -3, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, -3, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, -3, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, -3, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, -2, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, -2, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, -2, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, -2, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, -1, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, -1, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, -1, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, -1, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, 0, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, 0, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, 0, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, 0, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, 1, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, 1, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, 1, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, 1, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, 2, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, 2, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, 2, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, 2, -7.699104, 0, 1.5, 0.5, 0.5,
-3.782484, 3, -7.699104, 0, -0.5, 0.5, 0.5,
-3.782484, 3, -7.699104, 1, -0.5, 0.5, 0.5,
-3.782484, 3, -7.699104, 1, 1.5, 0.5, 0.5,
-3.782484, 3, -7.699104, 0, 1.5, 0.5, 0.5
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
-3.298581, -3.26462, -6,
-3.298581, -3.26462, 4,
-3.298581, -3.26462, -6,
-3.459882, -3.424292, -6,
-3.298581, -3.26462, -4,
-3.459882, -3.424292, -4,
-3.298581, -3.26462, -2,
-3.459882, -3.424292, -2,
-3.298581, -3.26462, 0,
-3.459882, -3.424292, 0,
-3.298581, -3.26462, 2,
-3.459882, -3.424292, 2,
-3.298581, -3.26462, 4,
-3.459882, -3.424292, 4
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
-3.782484, -3.743634, -6, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -6, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -6, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, -6, 0, 1.5, 0.5, 0.5,
-3.782484, -3.743634, -4, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -4, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -4, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, -4, 0, 1.5, 0.5, 0.5,
-3.782484, -3.743634, -2, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -2, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, -2, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, -2, 0, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 0, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 0, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 0, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 0, 0, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 2, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 2, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 2, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 2, 0, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 4, 0, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 4, 1, -0.5, 0.5, 0.5,
-3.782484, -3.743634, 4, 1, 1.5, 0.5, 0.5,
-3.782484, -3.743634, 4, 0, 1.5, 0.5, 0.5
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
-3.298581, -3.26462, -6.772868,
-3.298581, 3.122237, -6.772868,
-3.298581, -3.26462, 5.576946,
-3.298581, 3.122237, 5.576946,
-3.298581, -3.26462, -6.772868,
-3.298581, -3.26462, 5.576946,
-3.298581, 3.122237, -6.772868,
-3.298581, 3.122237, 5.576946,
-3.298581, -3.26462, -6.772868,
3.153451, -3.26462, -6.772868,
-3.298581, -3.26462, 5.576946,
3.153451, -3.26462, 5.576946,
-3.298581, 3.122237, -6.772868,
3.153451, 3.122237, -6.772868,
-3.298581, 3.122237, 5.576946,
3.153451, 3.122237, 5.576946,
3.153451, -3.26462, -6.772868,
3.153451, 3.122237, -6.772868,
3.153451, -3.26462, 5.576946,
3.153451, 3.122237, 5.576946,
3.153451, -3.26462, -6.772868,
3.153451, -3.26462, 5.576946,
3.153451, 3.122237, -6.772868,
3.153451, 3.122237, 5.576946
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
var radius = 8.184697;
var distance = 36.41464;
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
mvMatrix.translate( 0.07256532, 0.07119155, 0.5979609 );
mvMatrix.scale( 1.371576, 1.385573, 0.7165658 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.41464);
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
cyano-pyrazole<-read.table("cyano-pyrazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyano-pyrazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
y<-cyano-pyrazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
z<-cyano-pyrazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
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
-3.20462, -0.8179551, -1.313605, 0, 0, 1, 1, 1,
-2.855425, 0.05141872, -3.81819, 1, 0, 0, 1, 1,
-2.720658, -0.4971058, -1.832354, 1, 0, 0, 1, 1,
-2.709281, 2.085006, -2.996577, 1, 0, 0, 1, 1,
-2.702474, 2.413255, 0.02988725, 1, 0, 0, 1, 1,
-2.582738, -0.9261705, -4.453323, 1, 0, 0, 1, 1,
-2.557795, 0.624756, -0.04146511, 0, 0, 0, 1, 1,
-2.425638, -1.377942, -2.696027, 0, 0, 0, 1, 1,
-2.344938, -2.941622, -2.892014, 0, 0, 0, 1, 1,
-2.293182, 0.7253907, -2.795389, 0, 0, 0, 1, 1,
-2.269735, 1.596819, -1.545527, 0, 0, 0, 1, 1,
-2.257575, -1.845865, -1.846348, 0, 0, 0, 1, 1,
-2.218391, 1.149997, -0.4404928, 0, 0, 0, 1, 1,
-2.195983, 1.318974, -1.374802, 1, 1, 1, 1, 1,
-2.150898, 0.08941391, -1.18599, 1, 1, 1, 1, 1,
-2.131723, -1.049375, -1.020243, 1, 1, 1, 1, 1,
-2.121403, -0.1940703, -0.6955537, 1, 1, 1, 1, 1,
-2.099889, 1.522017, -0.3702557, 1, 1, 1, 1, 1,
-2.097887, 0.08153496, -3.209732, 1, 1, 1, 1, 1,
-2.068989, 0.05466136, -2.600462, 1, 1, 1, 1, 1,
-2.051912, -1.320428, -2.930744, 1, 1, 1, 1, 1,
-2.029724, 0.2568171, -1.265142, 1, 1, 1, 1, 1,
-2.028258, 0.7425576, -1.984443, 1, 1, 1, 1, 1,
-2.023332, 0.7716151, -0.7747704, 1, 1, 1, 1, 1,
-2.021926, 0.4542054, -0.9767253, 1, 1, 1, 1, 1,
-2.013621, -1.014322, -1.543032, 1, 1, 1, 1, 1,
-1.972911, 1.616043, -0.8217856, 1, 1, 1, 1, 1,
-1.916699, -1.435684, -2.985264, 1, 1, 1, 1, 1,
-1.902908, 1.058734, -0.256432, 0, 0, 1, 1, 1,
-1.889591, 0.7879712, 0.5205604, 1, 0, 0, 1, 1,
-1.814206, 0.758732, -1.440913, 1, 0, 0, 1, 1,
-1.803504, 1.949386, -0.1022373, 1, 0, 0, 1, 1,
-1.795968, 1.283038, -1.981823, 1, 0, 0, 1, 1,
-1.786716, -0.2415093, -0.385501, 1, 0, 0, 1, 1,
-1.784812, -0.5760266, -2.98821, 0, 0, 0, 1, 1,
-1.780992, 0.2274485, -0.8200999, 0, 0, 0, 1, 1,
-1.757033, 0.8373761, -2.274037, 0, 0, 0, 1, 1,
-1.753489, 0.5873942, -0.7747766, 0, 0, 0, 1, 1,
-1.752102, 0.1671997, -1.738684, 0, 0, 0, 1, 1,
-1.750023, -0.2431423, -0.6543056, 0, 0, 0, 1, 1,
-1.749864, 0.08204681, -0.812669, 0, 0, 0, 1, 1,
-1.737939, -0.555161, -1.19882, 1, 1, 1, 1, 1,
-1.733722, -0.8554407, -1.634454, 1, 1, 1, 1, 1,
-1.727172, -1.661175, -6.387243, 1, 1, 1, 1, 1,
-1.725872, -0.248924, -0.9945858, 1, 1, 1, 1, 1,
-1.725842, -0.3263661, -2.578819, 1, 1, 1, 1, 1,
-1.71354, 0.3496, -1.01167, 1, 1, 1, 1, 1,
-1.684861, 1.799949, -0.3952905, 1, 1, 1, 1, 1,
-1.676706, -1.067612, -1.833747, 1, 1, 1, 1, 1,
-1.676277, -1.066888, -3.106256, 1, 1, 1, 1, 1,
-1.67419, -0.8928431, -2.521646, 1, 1, 1, 1, 1,
-1.673694, 1.090013, -1.641243, 1, 1, 1, 1, 1,
-1.65594, -0.8660893, -0.9557982, 1, 1, 1, 1, 1,
-1.654884, -1.0015, -2.39853, 1, 1, 1, 1, 1,
-1.641676, -0.131378, -2.707452, 1, 1, 1, 1, 1,
-1.628871, 0.277925, -2.415706, 1, 1, 1, 1, 1,
-1.620191, -0.1097256, -2.41793, 0, 0, 1, 1, 1,
-1.619561, 1.719721, -0.6665648, 1, 0, 0, 1, 1,
-1.619089, -0.3977344, -0.5932909, 1, 0, 0, 1, 1,
-1.615476, -0.08078696, -0.3670095, 1, 0, 0, 1, 1,
-1.609427, -0.7498574, -2.092429, 1, 0, 0, 1, 1,
-1.6089, 0.6153553, -1.399796, 1, 0, 0, 1, 1,
-1.603975, -1.655193, -2.73436, 0, 0, 0, 1, 1,
-1.599948, 0.7915992, -0.8100305, 0, 0, 0, 1, 1,
-1.558247, 1.80471, -0.9159877, 0, 0, 0, 1, 1,
-1.557708, -0.1545684, -2.247748, 0, 0, 0, 1, 1,
-1.544738, -1.367062, -2.869501, 0, 0, 0, 1, 1,
-1.540355, 1.201894, -0.4446395, 0, 0, 0, 1, 1,
-1.53805, 1.339485, 0.61501, 0, 0, 0, 1, 1,
-1.528256, 0.04679602, -2.594499, 1, 1, 1, 1, 1,
-1.51587, -1.374333, -2.888468, 1, 1, 1, 1, 1,
-1.515038, 1.001763, -2.211457, 1, 1, 1, 1, 1,
-1.457837, 0.1304246, -2.218642, 1, 1, 1, 1, 1,
-1.457506, 1.474558, -0.6433163, 1, 1, 1, 1, 1,
-1.449848, -0.2803156, -1.02808, 1, 1, 1, 1, 1,
-1.417802, 0.8212559, -1.948655, 1, 1, 1, 1, 1,
-1.406168, -0.5889104, -2.686013, 1, 1, 1, 1, 1,
-1.386025, -1.498391, -3.938918, 1, 1, 1, 1, 1,
-1.355525, -0.59254, -1.664447, 1, 1, 1, 1, 1,
-1.350965, 0.3694201, -1.876794, 1, 1, 1, 1, 1,
-1.34669, 0.03375458, -1.218286, 1, 1, 1, 1, 1,
-1.33213, 1.093126, -1.265114, 1, 1, 1, 1, 1,
-1.32955, 1.694773, 0.6663931, 1, 1, 1, 1, 1,
-1.316025, 1.85144, 1.57239, 1, 1, 1, 1, 1,
-1.305719, -1.427673, -1.196741, 0, 0, 1, 1, 1,
-1.300328, -0.2880126, -0.5654596, 1, 0, 0, 1, 1,
-1.287981, 1.184734, -1.93932, 1, 0, 0, 1, 1,
-1.285477, 1.137994, -1.263587, 1, 0, 0, 1, 1,
-1.284441, 2.40032, -0.7812653, 1, 0, 0, 1, 1,
-1.276419, -0.9736616, -2.905917, 1, 0, 0, 1, 1,
-1.274509, 1.307226, -2.576988, 0, 0, 0, 1, 1,
-1.27336, -1.338519, -1.554502, 0, 0, 0, 1, 1,
-1.271803, -0.240822, -2.107703, 0, 0, 0, 1, 1,
-1.269295, 0.03270204, -0.3292475, 0, 0, 0, 1, 1,
-1.260866, -2.541604, -3.053691, 0, 0, 0, 1, 1,
-1.258926, 0.7543428, -1.200447, 0, 0, 0, 1, 1,
-1.253262, 0.3632824, -2.183165, 0, 0, 0, 1, 1,
-1.249076, 0.6706178, -3.569208, 1, 1, 1, 1, 1,
-1.242148, -0.4272247, -4.552258, 1, 1, 1, 1, 1,
-1.241505, 1.800948, -0.06014268, 1, 1, 1, 1, 1,
-1.23287, 1.100282, -0.7614282, 1, 1, 1, 1, 1,
-1.230839, 1.512523, -1.343238, 1, 1, 1, 1, 1,
-1.230224, 0.7628154, 1.385349, 1, 1, 1, 1, 1,
-1.220905, 1.331005, -1.218447, 1, 1, 1, 1, 1,
-1.212238, 1.099498, -0.9214072, 1, 1, 1, 1, 1,
-1.204541, 0.3913952, -1.15703, 1, 1, 1, 1, 1,
-1.177063, 0.7935432, 1.490727, 1, 1, 1, 1, 1,
-1.17196, 0.3699674, -2.116014, 1, 1, 1, 1, 1,
-1.161587, -0.1938388, -0.1716323, 1, 1, 1, 1, 1,
-1.15817, 2.766121, -0.9734946, 1, 1, 1, 1, 1,
-1.152941, -0.1564651, -1.169146, 1, 1, 1, 1, 1,
-1.148455, -1.348245, -0.8232279, 1, 1, 1, 1, 1,
-1.140493, 2.343742, -0.7964901, 0, 0, 1, 1, 1,
-1.139967, -0.3542512, -0.793276, 1, 0, 0, 1, 1,
-1.138406, -1.153871, -2.95979, 1, 0, 0, 1, 1,
-1.135442, -0.6251778, -1.084076, 1, 0, 0, 1, 1,
-1.130929, 1.49949, -0.2958095, 1, 0, 0, 1, 1,
-1.113389, -0.1124639, -1.712162, 1, 0, 0, 1, 1,
-1.109157, 1.276736, -0.8242805, 0, 0, 0, 1, 1,
-1.10272, -1.681081, -2.595127, 0, 0, 0, 1, 1,
-1.101354, -0.5180737, -0.5582487, 0, 0, 0, 1, 1,
-1.09847, 1.021485, -1.123658, 0, 0, 0, 1, 1,
-1.098109, -0.7501777, -2.829412, 0, 0, 0, 1, 1,
-1.097095, -0.6813756, -2.643106, 0, 0, 0, 1, 1,
-1.096259, -0.1533561, -3.505758, 0, 0, 0, 1, 1,
-1.091492, 0.6065764, 0.7182852, 1, 1, 1, 1, 1,
-1.091093, -0.5849544, -2.168686, 1, 1, 1, 1, 1,
-1.090232, -0.2306512, -1.797987, 1, 1, 1, 1, 1,
-1.087244, -1.244288, -3.112928, 1, 1, 1, 1, 1,
-1.084293, -0.648662, -2.140937, 1, 1, 1, 1, 1,
-1.07774, -0.178286, 0.2948615, 1, 1, 1, 1, 1,
-1.075858, 0.5439879, -2.311532, 1, 1, 1, 1, 1,
-1.073688, 0.8176453, -1.562061, 1, 1, 1, 1, 1,
-1.065378, 0.6726868, -1.088953, 1, 1, 1, 1, 1,
-1.06341, -2.855958, -1.855268, 1, 1, 1, 1, 1,
-1.052176, -1.872666, -2.168367, 1, 1, 1, 1, 1,
-1.047735, -0.4781619, -1.84137, 1, 1, 1, 1, 1,
-1.044487, -1.177548, -1.170622, 1, 1, 1, 1, 1,
-1.044191, 0.0996193, -1.24708, 1, 1, 1, 1, 1,
-1.044157, 1.594222, -2.074433, 1, 1, 1, 1, 1,
-1.041429, 2.91621, 0.3427901, 0, 0, 1, 1, 1,
-1.038541, -0.3433077, -0.5454082, 1, 0, 0, 1, 1,
-1.03522, -0.3411978, -2.191689, 1, 0, 0, 1, 1,
-1.02905, -0.5782469, -1.741194, 1, 0, 0, 1, 1,
-1.016588, 0.5884729, -1.324661, 1, 0, 0, 1, 1,
-1.007982, -1.202874, -2.227218, 1, 0, 0, 1, 1,
-1.007439, -0.9975343, -0.8797114, 0, 0, 0, 1, 1,
-1.002797, -0.3358271, -1.61457, 0, 0, 0, 1, 1,
-0.9999348, 0.8902318, -0.4325896, 0, 0, 0, 1, 1,
-0.9959708, -1.430002, -4.310212, 0, 0, 0, 1, 1,
-0.9912497, -1.029574, -3.496818, 0, 0, 0, 1, 1,
-0.9909677, 1.535125, -2.217026, 0, 0, 0, 1, 1,
-0.9700998, 0.761819, -0.9071693, 0, 0, 0, 1, 1,
-0.9668757, -0.04317351, -1.819149, 1, 1, 1, 1, 1,
-0.9612998, 0.2406883, -1.049936, 1, 1, 1, 1, 1,
-0.9599234, -2.033246, -2.726698, 1, 1, 1, 1, 1,
-0.954704, -1.833806, -2.025375, 1, 1, 1, 1, 1,
-0.9518899, -0.3690008, -2.110373, 1, 1, 1, 1, 1,
-0.9506865, -1.756947, -3.494645, 1, 1, 1, 1, 1,
-0.9505879, -1.006174, -1.884415, 1, 1, 1, 1, 1,
-0.9477084, 0.551007, -1.956648, 1, 1, 1, 1, 1,
-0.9460257, -0.6484256, -1.378563, 1, 1, 1, 1, 1,
-0.9458016, 0.4096832, -0.8689126, 1, 1, 1, 1, 1,
-0.9338142, -2.88458, -1.135014, 1, 1, 1, 1, 1,
-0.9276015, -0.08809847, -1.201839, 1, 1, 1, 1, 1,
-0.9242194, 2.797069, 0.5052951, 1, 1, 1, 1, 1,
-0.9187567, 0.6382477, -2.511419, 1, 1, 1, 1, 1,
-0.9150537, 0.3717826, -1.405309, 1, 1, 1, 1, 1,
-0.9046023, 0.2507711, -0.9401706, 0, 0, 1, 1, 1,
-0.9045252, 0.714889, 0.4977386, 1, 0, 0, 1, 1,
-0.9037955, 1.036308, -1.419063, 1, 0, 0, 1, 1,
-0.902458, 0.6221692, -1.755926, 1, 0, 0, 1, 1,
-0.901001, 0.6171328, -0.8409484, 1, 0, 0, 1, 1,
-0.8996226, 1.630776, -0.557093, 1, 0, 0, 1, 1,
-0.8990635, 0.8189567, -0.2844945, 0, 0, 0, 1, 1,
-0.8977798, -1.530796, -2.314516, 0, 0, 0, 1, 1,
-0.896139, 0.5338998, -1.957656, 0, 0, 0, 1, 1,
-0.8939481, 0.1263604, -3.196214, 0, 0, 0, 1, 1,
-0.8907698, 1.691536, 0.5524598, 0, 0, 0, 1, 1,
-0.8880991, 0.6057521, -0.9436902, 0, 0, 0, 1, 1,
-0.8879637, 0.03712001, -1.793054, 0, 0, 0, 1, 1,
-0.8863774, -0.2745217, -2.732243, 1, 1, 1, 1, 1,
-0.8847429, -2.137052, -3.101242, 1, 1, 1, 1, 1,
-0.8829653, 0.1253586, -0.5593215, 1, 1, 1, 1, 1,
-0.8805627, -0.4330451, -3.168608, 1, 1, 1, 1, 1,
-0.8804149, 0.3270756, -0.4705287, 1, 1, 1, 1, 1,
-0.8788205, 0.4570125, 0.2540837, 1, 1, 1, 1, 1,
-0.8691677, -1.13394, -2.577597, 1, 1, 1, 1, 1,
-0.867994, -0.4133987, -1.043154, 1, 1, 1, 1, 1,
-0.8666093, 0.3091757, -1.613437, 1, 1, 1, 1, 1,
-0.863938, 0.2758748, -1.756818, 1, 1, 1, 1, 1,
-0.8626032, 0.08281272, -0.7097006, 1, 1, 1, 1, 1,
-0.8616321, -0.6760579, -2.042584, 1, 1, 1, 1, 1,
-0.8566562, 0.05780203, -2.93563, 1, 1, 1, 1, 1,
-0.8562477, -0.3912351, -1.861775, 1, 1, 1, 1, 1,
-0.8513384, -0.1631685, -2.31917, 1, 1, 1, 1, 1,
-0.8417131, 0.8409858, -0.8716847, 0, 0, 1, 1, 1,
-0.8411433, 0.6251345, 1.248077, 1, 0, 0, 1, 1,
-0.8322883, 0.589025, -0.6860766, 1, 0, 0, 1, 1,
-0.8275188, 2.348387, 0.4314259, 1, 0, 0, 1, 1,
-0.8227769, -0.3077472, -0.5404249, 1, 0, 0, 1, 1,
-0.8204271, -0.06773087, -1.798741, 1, 0, 0, 1, 1,
-0.8184217, -1.346239, -4.751164, 0, 0, 0, 1, 1,
-0.8149246, 1.566281, -0.5482795, 0, 0, 0, 1, 1,
-0.8146254, -0.5755769, -2.676579, 0, 0, 0, 1, 1,
-0.8111666, 0.1529642, -1.047225, 0, 0, 0, 1, 1,
-0.8109269, 0.1820781, -2.904259, 0, 0, 0, 1, 1,
-0.8086603, -0.7319356, -2.306652, 0, 0, 0, 1, 1,
-0.8010724, -0.9319727, -2.130851, 0, 0, 0, 1, 1,
-0.8007222, -1.204179, -2.962757, 1, 1, 1, 1, 1,
-0.7989609, 0.6564709, -2.943499, 1, 1, 1, 1, 1,
-0.7969138, 0.4346434, 0.5428348, 1, 1, 1, 1, 1,
-0.7959281, -0.06477121, -0.09416103, 1, 1, 1, 1, 1,
-0.7952729, 0.1489523, -1.528967, 1, 1, 1, 1, 1,
-0.7936392, 0.7887561, -1.136039, 1, 1, 1, 1, 1,
-0.7892998, 0.0975345, -0.0848119, 1, 1, 1, 1, 1,
-0.7884323, 0.1695143, -1.109083, 1, 1, 1, 1, 1,
-0.7860848, -1.351149, -3.569098, 1, 1, 1, 1, 1,
-0.7854037, 0.2339665, -2.30698, 1, 1, 1, 1, 1,
-0.7842693, 2.099279, 0.1702701, 1, 1, 1, 1, 1,
-0.7834082, -0.465113, -0.8624878, 1, 1, 1, 1, 1,
-0.7810763, 0.3580073, -1.08904, 1, 1, 1, 1, 1,
-0.7797755, -0.08674732, -1.298149, 1, 1, 1, 1, 1,
-0.7760344, -0.8376332, -2.530134, 1, 1, 1, 1, 1,
-0.7752979, -2.310918, -1.430835, 0, 0, 1, 1, 1,
-0.7731975, 0.1890801, 0.3380297, 1, 0, 0, 1, 1,
-0.7690337, 1.123521, -2.179678, 1, 0, 0, 1, 1,
-0.7684802, -0.7582042, -0.390819, 1, 0, 0, 1, 1,
-0.7682041, 1.249071, 0.498508, 1, 0, 0, 1, 1,
-0.7625, -0.192874, -1.292197, 1, 0, 0, 1, 1,
-0.756909, -1.569368, -2.261952, 0, 0, 0, 1, 1,
-0.7555586, 0.3434669, -1.526985, 0, 0, 0, 1, 1,
-0.7554582, 1.981001, 0.103377, 0, 0, 0, 1, 1,
-0.7542292, -2.070822, -2.743936, 0, 0, 0, 1, 1,
-0.7539536, 0.3830892, -0.9515273, 0, 0, 0, 1, 1,
-0.7351786, 0.7733054, -0.4443626, 0, 0, 0, 1, 1,
-0.7340224, 1.199391, 0.4146313, 0, 0, 0, 1, 1,
-0.7334925, -0.538583, -1.87409, 1, 1, 1, 1, 1,
-0.7322569, 2.39507, -1.935554, 1, 1, 1, 1, 1,
-0.7321596, -2.545197, -1.926175, 1, 1, 1, 1, 1,
-0.7263196, -0.4378361, -2.483332, 1, 1, 1, 1, 1,
-0.7186389, 0.2148517, 0.6748568, 1, 1, 1, 1, 1,
-0.7178218, -0.5319681, -1.718387, 1, 1, 1, 1, 1,
-0.7044543, 2.070668, -1.148864, 1, 1, 1, 1, 1,
-0.7042147, -0.7174811, -2.89421, 1, 1, 1, 1, 1,
-0.6924414, -1.805338, -3.123331, 1, 1, 1, 1, 1,
-0.6895627, 0.04900968, -0.5513632, 1, 1, 1, 1, 1,
-0.6875232, 1.108727, -2.138127, 1, 1, 1, 1, 1,
-0.6867388, -1.061289, -3.757262, 1, 1, 1, 1, 1,
-0.6777731, -0.8009408, -3.583421, 1, 1, 1, 1, 1,
-0.6721581, 0.4418926, -1.641841, 1, 1, 1, 1, 1,
-0.6712702, -1.471716, -4.520863, 1, 1, 1, 1, 1,
-0.6688276, 0.1847909, -0.6005368, 0, 0, 1, 1, 1,
-0.6635989, -1.098664, -4.688835, 1, 0, 0, 1, 1,
-0.6527324, -0.4637522, -3.287893, 1, 0, 0, 1, 1,
-0.6497921, 0.3401592, 0.7549689, 1, 0, 0, 1, 1,
-0.6470077, 0.04454845, -1.160173, 1, 0, 0, 1, 1,
-0.6456479, -1.308188, -3.22286, 1, 0, 0, 1, 1,
-0.6445093, -0.6547914, -2.001154, 0, 0, 0, 1, 1,
-0.6444976, -0.2992621, -1.061125, 0, 0, 0, 1, 1,
-0.6383023, 0.09447963, -1.464715, 0, 0, 0, 1, 1,
-0.6375972, 0.9406198, -0.1649445, 0, 0, 0, 1, 1,
-0.6347325, 0.02139545, -0.4924666, 0, 0, 0, 1, 1,
-0.6301206, -0.596207, -3.829658, 0, 0, 0, 1, 1,
-0.6260064, -0.1815633, -0.8009688, 0, 0, 0, 1, 1,
-0.6175421, 0.4963358, -1.171167, 1, 1, 1, 1, 1,
-0.6171411, -1.13214, -3.035651, 1, 1, 1, 1, 1,
-0.6171241, 1.844288, -0.5576361, 1, 1, 1, 1, 1,
-0.6127092, 0.3927051, -0.9981618, 1, 1, 1, 1, 1,
-0.6109875, 0.1683126, -1.249456, 1, 1, 1, 1, 1,
-0.6051518, -0.7540218, -2.077041, 1, 1, 1, 1, 1,
-0.60404, 1.388287, 0.9313437, 1, 1, 1, 1, 1,
-0.5975497, -0.2461959, -0.7628438, 1, 1, 1, 1, 1,
-0.5935225, 0.7055132, -0.4575383, 1, 1, 1, 1, 1,
-0.5922975, 0.5480925, -0.4293137, 1, 1, 1, 1, 1,
-0.5864759, -0.4195328, -3.637599, 1, 1, 1, 1, 1,
-0.584511, 0.01215019, -0.739439, 1, 1, 1, 1, 1,
-0.5844809, -0.4248266, -3.307184, 1, 1, 1, 1, 1,
-0.5802167, 0.201203, -3.191959, 1, 1, 1, 1, 1,
-0.5794261, 1.302011, -0.3397267, 1, 1, 1, 1, 1,
-0.5737687, -0.9218904, -2.021502, 0, 0, 1, 1, 1,
-0.5711218, -0.2433559, -0.04727203, 1, 0, 0, 1, 1,
-0.5692307, 0.6664281, 0.9412776, 1, 0, 0, 1, 1,
-0.5625558, 0.513539, 0.5802054, 1, 0, 0, 1, 1,
-0.5580015, -1.482598, -3.308927, 1, 0, 0, 1, 1,
-0.5574603, 0.8269345, 0.0717188, 1, 0, 0, 1, 1,
-0.5505427, -0.9991075, -3.678317, 0, 0, 0, 1, 1,
-0.5499627, -0.9468974, -4.501061, 0, 0, 0, 1, 1,
-0.5464337, 0.9655432, -0.1306231, 0, 0, 0, 1, 1,
-0.5458547, 0.5512661, -2.146517, 0, 0, 0, 1, 1,
-0.5448911, 1.076127, 0.07347802, 0, 0, 0, 1, 1,
-0.5440542, 0.544064, -1.917532, 0, 0, 0, 1, 1,
-0.5438168, 0.2352939, -0.607038, 0, 0, 0, 1, 1,
-0.5429421, -1.417278, -1.987357, 1, 1, 1, 1, 1,
-0.5424253, 0.5177628, -0.4584735, 1, 1, 1, 1, 1,
-0.5412987, 0.285182, -0.4956898, 1, 1, 1, 1, 1,
-0.5357039, -0.4385808, -1.021832, 1, 1, 1, 1, 1,
-0.5355589, 0.2814449, -0.6046671, 1, 1, 1, 1, 1,
-0.532823, -0.7434543, -1.451184, 1, 1, 1, 1, 1,
-0.5288635, 0.9792412, -0.152854, 1, 1, 1, 1, 1,
-0.5238471, 0.5325363, 0.01503717, 1, 1, 1, 1, 1,
-0.5215952, -0.9473447, -1.999025, 1, 1, 1, 1, 1,
-0.5203743, 2.349735, -1.059459, 1, 1, 1, 1, 1,
-0.5201671, -1.16141, -2.684743, 1, 1, 1, 1, 1,
-0.5178365, -0.005488516, -0.5232282, 1, 1, 1, 1, 1,
-0.5031441, 0.04228409, -2.394215, 1, 1, 1, 1, 1,
-0.5031062, -0.3693888, -2.426874, 1, 1, 1, 1, 1,
-0.5009298, 0.03984133, -1.464448, 1, 1, 1, 1, 1,
-0.499461, -1.516233, -2.453349, 0, 0, 1, 1, 1,
-0.4903752, 1.416858, -1.380308, 1, 0, 0, 1, 1,
-0.4883367, -1.7238, -3.193638, 1, 0, 0, 1, 1,
-0.4881184, 0.0245675, -1.508007, 1, 0, 0, 1, 1,
-0.4865969, -0.2286038, -2.912837, 1, 0, 0, 1, 1,
-0.4807136, -0.2066495, -1.444886, 1, 0, 0, 1, 1,
-0.4774266, 0.3708566, -2.524539, 0, 0, 0, 1, 1,
-0.4745514, -1.712229, -3.348356, 0, 0, 0, 1, 1,
-0.4700528, 0.2179826, -0.6272012, 0, 0, 0, 1, 1,
-0.4679042, -0.2562345, -2.111242, 0, 0, 0, 1, 1,
-0.4637186, -1.906205, -2.294946, 0, 0, 0, 1, 1,
-0.4586884, 0.7763187, -2.268881, 0, 0, 0, 1, 1,
-0.4519507, 0.7584112, -1.701563, 0, 0, 0, 1, 1,
-0.4506722, 0.6535484, -0.7251685, 1, 1, 1, 1, 1,
-0.4444371, -1.181048, -1.646389, 1, 1, 1, 1, 1,
-0.4432834, -1.345835, -0.6816182, 1, 1, 1, 1, 1,
-0.4427972, 0.3438541, 1.160737, 1, 1, 1, 1, 1,
-0.4387897, -0.4650629, -4.653736, 1, 1, 1, 1, 1,
-0.4374867, -1.146107, -2.000465, 1, 1, 1, 1, 1,
-0.4361746, -1.730294, -2.731417, 1, 1, 1, 1, 1,
-0.4303505, 1.000076, -1.181689, 1, 1, 1, 1, 1,
-0.4268412, 1.018344, -0.2176533, 1, 1, 1, 1, 1,
-0.4238847, -0.6226947, -1.92348, 1, 1, 1, 1, 1,
-0.4231369, -0.812846, -1.748765, 1, 1, 1, 1, 1,
-0.423096, -0.006567678, -0.6953158, 1, 1, 1, 1, 1,
-0.4195117, -1.664846, -2.876231, 1, 1, 1, 1, 1,
-0.4161248, 0.5131115, -0.8469974, 1, 1, 1, 1, 1,
-0.4129962, 1.267915, -0.1942018, 1, 1, 1, 1, 1,
-0.4113509, 3.029225, -2.531412, 0, 0, 1, 1, 1,
-0.4111171, -0.9472283, -3.352371, 1, 0, 0, 1, 1,
-0.4103567, 0.7484379, 0.6874359, 1, 0, 0, 1, 1,
-0.4089941, 0.4074339, 0.4597404, 1, 0, 0, 1, 1,
-0.4079187, 1.562973, 0.6235058, 1, 0, 0, 1, 1,
-0.405988, 0.04500705, -1.631622, 1, 0, 0, 1, 1,
-0.3956181, 0.9376218, -0.4842416, 0, 0, 0, 1, 1,
-0.3933485, 2.214242, 0.6404846, 0, 0, 0, 1, 1,
-0.392042, 0.2553997, -0.3641468, 0, 0, 0, 1, 1,
-0.3918133, -1.243143, -2.324583, 0, 0, 0, 1, 1,
-0.3873615, -0.1933305, -0.6620239, 0, 0, 0, 1, 1,
-0.3849213, -0.6778182, -2.556398, 0, 0, 0, 1, 1,
-0.3776904, -2.541674, -2.58344, 0, 0, 0, 1, 1,
-0.3776574, -1.949138, -2.384113, 1, 1, 1, 1, 1,
-0.3755023, 0.8490152, -0.864018, 1, 1, 1, 1, 1,
-0.3736426, 0.4133019, -0.5098825, 1, 1, 1, 1, 1,
-0.3731352, -1.930032, -4.605808, 1, 1, 1, 1, 1,
-0.3723003, -0.3975886, -2.237566, 1, 1, 1, 1, 1,
-0.3688535, -0.3546886, -1.673956, 1, 1, 1, 1, 1,
-0.365405, 0.3092585, -0.9425963, 1, 1, 1, 1, 1,
-0.3642972, 0.3795657, -0.2121827, 1, 1, 1, 1, 1,
-0.3624575, 0.2520663, -0.5623356, 1, 1, 1, 1, 1,
-0.3540719, 0.96441, -0.9640739, 1, 1, 1, 1, 1,
-0.3529106, -0.9737459, -2.702248, 1, 1, 1, 1, 1,
-0.346341, 0.4944833, -1.711695, 1, 1, 1, 1, 1,
-0.3451973, -0.9554483, -2.817934, 1, 1, 1, 1, 1,
-0.3446676, -1.442181, -3.566534, 1, 1, 1, 1, 1,
-0.3433559, 1.30738, -0.1468131, 1, 1, 1, 1, 1,
-0.3422683, 1.37072, 0.06178923, 0, 0, 1, 1, 1,
-0.3405714, 0.9120784, 0.1747322, 1, 0, 0, 1, 1,
-0.3404608, 1.10931, -1.440947, 1, 0, 0, 1, 1,
-0.3374196, 0.8753994, -1.780071, 1, 0, 0, 1, 1,
-0.3312153, 1.413677, 0.9637318, 1, 0, 0, 1, 1,
-0.3302812, -0.7174742, -2.75297, 1, 0, 0, 1, 1,
-0.3255277, -1.801723, -2.749096, 0, 0, 0, 1, 1,
-0.3212624, -2.180701, -2.516288, 0, 0, 0, 1, 1,
-0.3198591, 1.80782, 0.6582128, 0, 0, 0, 1, 1,
-0.3195634, 0.5026135, -0.649247, 0, 0, 0, 1, 1,
-0.3175999, -0.6523781, -3.409893, 0, 0, 0, 1, 1,
-0.3165783, 0.5462815, -0.8337418, 0, 0, 0, 1, 1,
-0.3139866, 0.9653539, -1.549188, 0, 0, 0, 1, 1,
-0.3130466, -0.2933017, -3.523417, 1, 1, 1, 1, 1,
-0.3124954, 0.554018, -0.3049152, 1, 1, 1, 1, 1,
-0.3077265, -0.3453973, -2.988791, 1, 1, 1, 1, 1,
-0.3017277, -0.1243506, -1.258764, 1, 1, 1, 1, 1,
-0.2997713, 0.8853807, 1.681385, 1, 1, 1, 1, 1,
-0.2991604, 1.039418, -1.281005, 1, 1, 1, 1, 1,
-0.2933931, 0.7985091, 1.036311, 1, 1, 1, 1, 1,
-0.2911503, -0.6257303, -2.226599, 1, 1, 1, 1, 1,
-0.2909439, 0.2657572, -2.544208, 1, 1, 1, 1, 1,
-0.2904052, 1.81289, -0.02587021, 1, 1, 1, 1, 1,
-0.2896365, 1.030793, -1.269598, 1, 1, 1, 1, 1,
-0.2881005, 0.1949407, -0.1032719, 1, 1, 1, 1, 1,
-0.2872375, 0.1187119, -1.085189, 1, 1, 1, 1, 1,
-0.2842583, 1.345265, 1.473452, 1, 1, 1, 1, 1,
-0.2831395, 0.6373016, -1.010811, 1, 1, 1, 1, 1,
-0.2826196, 1.053715, -0.5872629, 0, 0, 1, 1, 1,
-0.2824685, -1.198344, -4.085523, 1, 0, 0, 1, 1,
-0.2783005, 1.226544, -0.8253298, 1, 0, 0, 1, 1,
-0.2728209, -1.171532, -3.7699, 1, 0, 0, 1, 1,
-0.2721246, -0.09512234, -1.13324, 1, 0, 0, 1, 1,
-0.2709615, 0.8374946, -1.553626, 1, 0, 0, 1, 1,
-0.2686703, 2.029093, -0.1781502, 0, 0, 0, 1, 1,
-0.2685234, -0.8980989, -2.55466, 0, 0, 0, 1, 1,
-0.2682907, -2.101867, -5.031914, 0, 0, 0, 1, 1,
-0.2638989, 0.9151238, -1.105145, 0, 0, 0, 1, 1,
-0.2577157, -3.141751, -3.55821, 0, 0, 0, 1, 1,
-0.2533036, 0.4020271, -0.5268884, 0, 0, 0, 1, 1,
-0.2512453, 0.7374969, -0.7113019, 0, 0, 0, 1, 1,
-0.246601, -0.3900378, -1.72076, 1, 1, 1, 1, 1,
-0.2436946, -0.2083692, -3.037382, 1, 1, 1, 1, 1,
-0.2414712, -1.545601, -3.977028, 1, 1, 1, 1, 1,
-0.2407004, -1.499977, -2.868029, 1, 1, 1, 1, 1,
-0.2402422, -0.5208551, -0.2411809, 1, 1, 1, 1, 1,
-0.22725, -2.128985, -4.435203, 1, 1, 1, 1, 1,
-0.2256694, 1.299555, -1.284647, 1, 1, 1, 1, 1,
-0.2213154, 1.199883, -0.9009551, 1, 1, 1, 1, 1,
-0.2189227, 0.7992325, 2.186074, 1, 1, 1, 1, 1,
-0.2185904, 0.8536903, 0.5882003, 1, 1, 1, 1, 1,
-0.2035073, -0.7326133, -2.766676, 1, 1, 1, 1, 1,
-0.1992369, 0.7184198, -0.9587535, 1, 1, 1, 1, 1,
-0.1991936, -0.0409954, -0.06200977, 1, 1, 1, 1, 1,
-0.1947949, 0.9608697, -0.7848488, 1, 1, 1, 1, 1,
-0.1880009, -1.293999, -2.628978, 1, 1, 1, 1, 1,
-0.1874225, 0.8250343, -1.004158, 0, 0, 1, 1, 1,
-0.1868916, -1.31587, -2.669678, 1, 0, 0, 1, 1,
-0.1863918, 0.577827, -1.00168, 1, 0, 0, 1, 1,
-0.1861289, -0.9099888, -0.3854701, 1, 0, 0, 1, 1,
-0.1850644, 2.466057, -1.194358, 1, 0, 0, 1, 1,
-0.1802496, 0.3645946, -1.449098, 1, 0, 0, 1, 1,
-0.1780542, 0.2801508, 0.3209706, 0, 0, 0, 1, 1,
-0.1775558, 0.2360398, -0.2959397, 0, 0, 0, 1, 1,
-0.1773649, 0.7387486, 1.439802, 0, 0, 0, 1, 1,
-0.1769962, 0.6464904, 0.3071209, 0, 0, 0, 1, 1,
-0.1682476, -0.9553598, -2.624286, 0, 0, 0, 1, 1,
-0.1644286, -0.6843624, -4.052192, 0, 0, 0, 1, 1,
-0.1633335, 0.6592414, -0.3928328, 0, 0, 0, 1, 1,
-0.1624389, -0.4021659, -3.102411, 1, 1, 1, 1, 1,
-0.1624368, -1.699737, -2.221677, 1, 1, 1, 1, 1,
-0.1606346, 0.8409573, -0.9667351, 1, 1, 1, 1, 1,
-0.159593, 0.7538305, -1.972941, 1, 1, 1, 1, 1,
-0.1576137, 0.2282959, -1.437672, 1, 1, 1, 1, 1,
-0.1571298, 1.553534, -0.06506277, 1, 1, 1, 1, 1,
-0.1527646, 0.4606356, -1.845387, 1, 1, 1, 1, 1,
-0.1520755, -0.1370251, -4.702054, 1, 1, 1, 1, 1,
-0.1484817, 0.403556, -1.322593, 1, 1, 1, 1, 1,
-0.1436173, -0.1474689, -2.047545, 1, 1, 1, 1, 1,
-0.1425218, 0.1758629, 0.1471234, 1, 1, 1, 1, 1,
-0.1422782, -0.6920603, -2.485559, 1, 1, 1, 1, 1,
-0.1422769, 1.015132, -0.0007298976, 1, 1, 1, 1, 1,
-0.1398543, 1.418733, 0.5321989, 1, 1, 1, 1, 1,
-0.1381973, -0.4251837, -2.334442, 1, 1, 1, 1, 1,
-0.1357055, 0.9266309, 0.5320246, 0, 0, 1, 1, 1,
-0.1287237, -3.171608, -4.961447, 1, 0, 0, 1, 1,
-0.1230757, -1.389867, -1.830399, 1, 0, 0, 1, 1,
-0.1190944, -1.115377, -5.007399, 1, 0, 0, 1, 1,
-0.1159081, -0.09413636, -2.885034, 1, 0, 0, 1, 1,
-0.1114044, -0.9325153, -3.43238, 1, 0, 0, 1, 1,
-0.1099151, -0.3807081, -3.372771, 0, 0, 0, 1, 1,
-0.1061193, 0.9890777, -1.525942, 0, 0, 0, 1, 1,
-0.1052195, -0.3858509, -6.593016, 0, 0, 0, 1, 1,
-0.1052002, 0.2289927, -1.091272, 0, 0, 0, 1, 1,
-0.1008667, 0.1413475, -0.4915038, 0, 0, 0, 1, 1,
-0.09907465, -0.6250547, -2.324059, 0, 0, 0, 1, 1,
-0.09610683, -0.5633018, -2.750547, 0, 0, 0, 1, 1,
-0.09596025, -0.8741071, -2.823953, 1, 1, 1, 1, 1,
-0.09065931, 0.08490021, -0.009872335, 1, 1, 1, 1, 1,
-0.09043247, 0.02004801, -1.741338, 1, 1, 1, 1, 1,
-0.08823871, -1.60165, -2.74933, 1, 1, 1, 1, 1,
-0.08114225, -0.4980628, -2.17338, 1, 1, 1, 1, 1,
-0.07741629, 0.1095266, -1.631336, 1, 1, 1, 1, 1,
-0.07473297, 0.4406008, 0.6416739, 1, 1, 1, 1, 1,
-0.06254557, 0.03079452, -0.8909318, 1, 1, 1, 1, 1,
-0.06111309, -1.740013, -2.421746, 1, 1, 1, 1, 1,
-0.05943713, 1.375291, 0.4001483, 1, 1, 1, 1, 1,
-0.05728889, 1.866172, -0.0509168, 1, 1, 1, 1, 1,
-0.05087854, 0.1125673, 0.7282367, 1, 1, 1, 1, 1,
-0.04878936, -1.615791, -2.456484, 1, 1, 1, 1, 1,
-0.04788043, -2.743575, -2.734543, 1, 1, 1, 1, 1,
-0.0466318, -1.135431, -3.229763, 1, 1, 1, 1, 1,
-0.0438221, -0.1698639, -2.141911, 0, 0, 1, 1, 1,
-0.04346208, -0.474169, -4.012071, 1, 0, 0, 1, 1,
-0.04327538, -0.821803, -5.757483, 1, 0, 0, 1, 1,
-0.04217088, 0.02203382, -0.5740366, 1, 0, 0, 1, 1,
-0.04207119, -1.716005, -2.454031, 1, 0, 0, 1, 1,
-0.04089262, 0.5633088, 1.400219, 1, 0, 0, 1, 1,
-0.039857, -0.2962036, -4.067594, 0, 0, 0, 1, 1,
-0.03973552, 1.220505, -1.317312, 0, 0, 0, 1, 1,
-0.03526133, 0.2795991, -0.1922997, 0, 0, 0, 1, 1,
-0.03255332, -1.006327, -2.759516, 0, 0, 0, 1, 1,
-0.03049712, 0.7057518, 0.6026253, 0, 0, 0, 1, 1,
-0.02695819, 0.4183883, 1.359357, 0, 0, 0, 1, 1,
-0.02564848, 2.548388, -0.605109, 0, 0, 0, 1, 1,
-0.02405959, -1.610016, -1.799271, 1, 1, 1, 1, 1,
-0.02190924, 1.193441, -1.775411, 1, 1, 1, 1, 1,
-0.0190428, -1.644133, -2.191899, 1, 1, 1, 1, 1,
-0.01559018, 0.01228572, -0.5427377, 1, 1, 1, 1, 1,
-0.01438223, -0.3876653, -3.578341, 1, 1, 1, 1, 1,
-0.01413277, -0.7761351, -3.548703, 1, 1, 1, 1, 1,
-0.009476298, 0.8867883, 0.6194075, 1, 1, 1, 1, 1,
-0.002630763, -1.096405, -2.551661, 1, 1, 1, 1, 1,
-0.001546879, 1.997649, -1.433525, 1, 1, 1, 1, 1,
-0.001223441, 0.3423149, -0.6695845, 1, 1, 1, 1, 1,
0.005219474, 0.09248189, -2.068901, 1, 1, 1, 1, 1,
0.007336521, -0.8521252, 3.927606, 1, 1, 1, 1, 1,
0.00739666, -1.724484, 3.208755, 1, 1, 1, 1, 1,
0.007745096, 1.750339, -0.251754, 1, 1, 1, 1, 1,
0.01050291, 0.1892754, -1.269857, 1, 1, 1, 1, 1,
0.01331723, 0.7404569, 0.4931092, 0, 0, 1, 1, 1,
0.01478387, -0.3563199, 2.964663, 1, 0, 0, 1, 1,
0.0248372, -0.4069898, 2.996279, 1, 0, 0, 1, 1,
0.02513967, -0.02882131, 3.154101, 1, 0, 0, 1, 1,
0.02786165, 0.7104854, 0.01188889, 1, 0, 0, 1, 1,
0.02960121, -0.2202394, 3.653098, 1, 0, 0, 1, 1,
0.03435788, 1.222794, 1.735038, 0, 0, 0, 1, 1,
0.0373741, 0.7677863, -0.3175588, 0, 0, 0, 1, 1,
0.03772339, -1.11007, 4.055413, 0, 0, 0, 1, 1,
0.03831819, -0.7257276, 5.005115, 0, 0, 0, 1, 1,
0.04060338, 0.7949457, 1.437512, 0, 0, 0, 1, 1,
0.04379481, -0.2034021, 2.571527, 0, 0, 0, 1, 1,
0.04503497, 0.2275041, -0.4757974, 0, 0, 0, 1, 1,
0.04652427, -0.8045706, 2.359579, 1, 1, 1, 1, 1,
0.04696958, -1.610455, 2.075603, 1, 1, 1, 1, 1,
0.04720841, -1.244151, 2.859084, 1, 1, 1, 1, 1,
0.05025219, 0.1610247, 2.624603, 1, 1, 1, 1, 1,
0.05108357, -1.403627, 3.860686, 1, 1, 1, 1, 1,
0.0525328, 0.1537814, 1.093442, 1, 1, 1, 1, 1,
0.05326601, -0.4352431, 2.869296, 1, 1, 1, 1, 1,
0.05593671, 0.7214069, -1.300209, 1, 1, 1, 1, 1,
0.05923827, -1.502771, 3.098957, 1, 1, 1, 1, 1,
0.05973896, -0.06746171, 1.923133, 1, 1, 1, 1, 1,
0.06032851, -2.531444, 0.74143, 1, 1, 1, 1, 1,
0.06180984, -0.3987127, 2.872589, 1, 1, 1, 1, 1,
0.06784582, -0.2107675, 4.266624, 1, 1, 1, 1, 1,
0.06983738, -1.810315, 3.626178, 1, 1, 1, 1, 1,
0.06997443, 0.8404904, -1.176144, 1, 1, 1, 1, 1,
0.07051616, -1.891263, 3.064636, 0, 0, 1, 1, 1,
0.07092445, 1.197936, 0.3269527, 1, 0, 0, 1, 1,
0.0726471, -1.458492, 3.627591, 1, 0, 0, 1, 1,
0.07394895, 0.4433757, 1.388622, 1, 0, 0, 1, 1,
0.0739876, -1.770882, 2.778877, 1, 0, 0, 1, 1,
0.0743951, 0.234247, 0.8432503, 1, 0, 0, 1, 1,
0.07455734, 0.3026165, -0.01016823, 0, 0, 0, 1, 1,
0.08352803, -1.013684, 2.12954, 0, 0, 0, 1, 1,
0.08415522, 0.8408228, 1.625954, 0, 0, 0, 1, 1,
0.08868395, -0.8591552, 3.317915, 0, 0, 0, 1, 1,
0.09163369, 0.0122104, 1.431185, 0, 0, 0, 1, 1,
0.09598312, 1.32539, -0.6091237, 0, 0, 0, 1, 1,
0.1020759, 1.949444, 0.2443693, 0, 0, 0, 1, 1,
0.1046097, 0.4000819, -1.002309, 1, 1, 1, 1, 1,
0.1046997, 0.5031818, -0.5427364, 1, 1, 1, 1, 1,
0.1060922, 0.485617, -0.1441206, 1, 1, 1, 1, 1,
0.1065975, 1.310703, -0.2884863, 1, 1, 1, 1, 1,
0.1128623, 2.511006, 0.5341843, 1, 1, 1, 1, 1,
0.1135576, -0.7382282, 3.442848, 1, 1, 1, 1, 1,
0.1186708, -1.678429, 2.986465, 1, 1, 1, 1, 1,
0.1252556, 1.162732, -2.224263, 1, 1, 1, 1, 1,
0.1312143, 0.2402183, -0.4034795, 1, 1, 1, 1, 1,
0.1353334, -1.103544, 3.462327, 1, 1, 1, 1, 1,
0.1354268, 1.178908, -1.388671, 1, 1, 1, 1, 1,
0.1357469, -1.680324, 1.994687, 1, 1, 1, 1, 1,
0.1399422, -1.103052, 3.222856, 1, 1, 1, 1, 1,
0.1418472, -0.2547598, 1.912914, 1, 1, 1, 1, 1,
0.1428586, 0.5243661, -0.2346354, 1, 1, 1, 1, 1,
0.1431882, 1.103765, 0.4753467, 0, 0, 1, 1, 1,
0.1481319, -0.9692471, 2.972054, 1, 0, 0, 1, 1,
0.149978, 0.0106741, -0.3995435, 1, 0, 0, 1, 1,
0.1502473, 2.116182, 0.4311879, 1, 0, 0, 1, 1,
0.1518602, -1.121382, 2.865682, 1, 0, 0, 1, 1,
0.1607818, 2.022902, 0.6176921, 1, 0, 0, 1, 1,
0.1711323, -2.553816, 1.321851, 0, 0, 0, 1, 1,
0.1715999, -1.580742, 4.638601, 0, 0, 0, 1, 1,
0.1735866, 0.9142697, 0.3610746, 0, 0, 0, 1, 1,
0.1756086, 0.6275548, 0.6241678, 0, 0, 0, 1, 1,
0.1756611, 1.565563, -0.6677004, 0, 0, 0, 1, 1,
0.1767651, -0.1222933, 2.766798, 0, 0, 0, 1, 1,
0.178993, -0.4677523, 2.634982, 0, 0, 0, 1, 1,
0.181829, -2.546017, 4.166426, 1, 1, 1, 1, 1,
0.1862575, 0.9018635, -0.3860966, 1, 1, 1, 1, 1,
0.188187, 0.6391778, 1.305297, 1, 1, 1, 1, 1,
0.1886847, -0.2264729, 1.620382, 1, 1, 1, 1, 1,
0.1896751, 0.5450643, -0.1579011, 1, 1, 1, 1, 1,
0.1902799, -0.7871348, 4.580033, 1, 1, 1, 1, 1,
0.1962393, 0.7044772, -0.4746655, 1, 1, 1, 1, 1,
0.1974681, -0.6126803, 1.814622, 1, 1, 1, 1, 1,
0.1975197, -0.04282688, -0.2011276, 1, 1, 1, 1, 1,
0.1999576, -2.938047, 1.38222, 1, 1, 1, 1, 1,
0.2032599, -0.7780609, 3.145612, 1, 1, 1, 1, 1,
0.20796, 0.5816892, 1.605875, 1, 1, 1, 1, 1,
0.2097834, 1.478241, -1.385056, 1, 1, 1, 1, 1,
0.2128047, 0.7437667, 1.994121, 1, 1, 1, 1, 1,
0.2166689, -0.8109997, 1.742603, 1, 1, 1, 1, 1,
0.2183215, -0.6642135, 3.806064, 0, 0, 1, 1, 1,
0.2195448, -0.7247137, 3.200083, 1, 0, 0, 1, 1,
0.2245914, 0.7289084, -0.6425781, 1, 0, 0, 1, 1,
0.225045, -1.472026, 4.475976, 1, 0, 0, 1, 1,
0.2267646, -0.4049104, 3.256597, 1, 0, 0, 1, 1,
0.2269096, -1.566508, 2.766384, 1, 0, 0, 1, 1,
0.2298005, -1.129061, 2.17783, 0, 0, 0, 1, 1,
0.2310942, 0.8305213, 1.912986, 0, 0, 0, 1, 1,
0.2349512, 1.496628, 0.5498782, 0, 0, 0, 1, 1,
0.2386084, -2.135672, 2.388735, 0, 0, 0, 1, 1,
0.2386453, 1.526788, 0.07836659, 0, 0, 0, 1, 1,
0.2388905, 0.4944129, -1.458296, 0, 0, 0, 1, 1,
0.2456514, 1.253878, -0.5372458, 0, 0, 0, 1, 1,
0.2465296, -1.720673, 2.492676, 1, 1, 1, 1, 1,
0.2498707, -0.5222941, 4.103639, 1, 1, 1, 1, 1,
0.2518872, -1.501463, 4.475405, 1, 1, 1, 1, 1,
0.2533439, -0.3854428, 1.51689, 1, 1, 1, 1, 1,
0.2557433, 0.5466855, 0.8607261, 1, 1, 1, 1, 1,
0.2574071, -0.04383448, 1.619576, 1, 1, 1, 1, 1,
0.2591368, -0.5009334, 1.420496, 1, 1, 1, 1, 1,
0.2610303, -1.136508, 3.093517, 1, 1, 1, 1, 1,
0.2658625, 0.8591998, 1.678964, 1, 1, 1, 1, 1,
0.2675048, 1.421153, 0.5258052, 1, 1, 1, 1, 1,
0.2696309, -0.3547111, 1.935365, 1, 1, 1, 1, 1,
0.2697502, -0.4275994, 2.312562, 1, 1, 1, 1, 1,
0.2717994, 0.8136046, -1.315015, 1, 1, 1, 1, 1,
0.2809302, 0.6509511, 1.647913, 1, 1, 1, 1, 1,
0.2814839, -0.5049461, 1.092106, 1, 1, 1, 1, 1,
0.281743, -0.3897114, 1.726753, 0, 0, 1, 1, 1,
0.2819842, 1.352173, 0.5466945, 1, 0, 0, 1, 1,
0.2821854, 0.3278226, 1.06589, 1, 0, 0, 1, 1,
0.2841516, 0.3099436, 1.511191, 1, 0, 0, 1, 1,
0.2848646, -0.1772018, 3.960429, 1, 0, 0, 1, 1,
0.2881324, -0.1125567, 1.092746, 1, 0, 0, 1, 1,
0.2915963, -0.8322703, 3.312188, 0, 0, 0, 1, 1,
0.2918672, 0.2095458, 2.209187, 0, 0, 0, 1, 1,
0.2961327, -2.025746, 2.067884, 0, 0, 0, 1, 1,
0.2966845, -0.5225974, 2.120885, 0, 0, 0, 1, 1,
0.2978237, -0.3583701, 1.915838, 0, 0, 0, 1, 1,
0.2990078, 2.242644, 0.9177541, 0, 0, 0, 1, 1,
0.3012547, -1.26319, 4.129096, 0, 0, 0, 1, 1,
0.3050115, 1.874231, -1.615156, 1, 1, 1, 1, 1,
0.3078003, 0.75141, -0.9843242, 1, 1, 1, 1, 1,
0.3091035, 0.9117911, -0.9681869, 1, 1, 1, 1, 1,
0.310064, -0.9128013, 1.318546, 1, 1, 1, 1, 1,
0.3107612, 1.166164, -1.655261, 1, 1, 1, 1, 1,
0.3123622, 0.2879695, 0.5311111, 1, 1, 1, 1, 1,
0.3232422, 1.385308, 1.341436, 1, 1, 1, 1, 1,
0.3268376, -0.609997, 2.770225, 1, 1, 1, 1, 1,
0.3272833, -1.270525, 2.949385, 1, 1, 1, 1, 1,
0.3297269, 0.1575906, 0.9803829, 1, 1, 1, 1, 1,
0.3323086, 1.819807, 2.665449, 1, 1, 1, 1, 1,
0.3325188, -1.242788, 2.346845, 1, 1, 1, 1, 1,
0.3346303, 0.7934307, 1.371657, 1, 1, 1, 1, 1,
0.3375793, -1.085883, 1.860773, 1, 1, 1, 1, 1,
0.3421557, -0.06133414, 1.541735, 1, 1, 1, 1, 1,
0.3454758, 0.5223414, 0.3777238, 0, 0, 1, 1, 1,
0.3565395, -0.4746006, 3.766472, 1, 0, 0, 1, 1,
0.3596075, 1.678605, 1.756954, 1, 0, 0, 1, 1,
0.3597895, 0.2527545, 0.04953473, 1, 0, 0, 1, 1,
0.3659793, -1.56907, 2.789211, 1, 0, 0, 1, 1,
0.3706521, -0.3150303, 1.000121, 1, 0, 0, 1, 1,
0.3723028, 0.00771612, 2.863595, 0, 0, 0, 1, 1,
0.3732437, 0.5440837, -0.7866676, 0, 0, 0, 1, 1,
0.3761503, -0.6952491, 3.064287, 0, 0, 0, 1, 1,
0.3804091, 0.3305629, 1.650488, 0, 0, 0, 1, 1,
0.3810896, -0.5356652, 4.666892, 0, 0, 0, 1, 1,
0.3816011, 0.9630895, 1.36517, 0, 0, 0, 1, 1,
0.3835552, -0.277874, 0.7607782, 0, 0, 0, 1, 1,
0.386288, -1.823648, 2.182224, 1, 1, 1, 1, 1,
0.3863014, -0.09665073, 1.725767, 1, 1, 1, 1, 1,
0.3882433, -0.3701023, 1.074814, 1, 1, 1, 1, 1,
0.3889867, -0.4790331, 1.108525, 1, 1, 1, 1, 1,
0.3894707, -0.343048, 2.712929, 1, 1, 1, 1, 1,
0.400132, 0.593052, 1.990008, 1, 1, 1, 1, 1,
0.4002187, -1.390517, 3.402272, 1, 1, 1, 1, 1,
0.4009816, -0.1206486, 1.084072, 1, 1, 1, 1, 1,
0.4063148, -0.06912909, 2.205412, 1, 1, 1, 1, 1,
0.4068452, -0.02200773, -0.01798864, 1, 1, 1, 1, 1,
0.4079235, 0.1366773, 0.9423514, 1, 1, 1, 1, 1,
0.4100642, 0.6290394, 2.051557, 1, 1, 1, 1, 1,
0.4104417, 0.7637627, -0.238538, 1, 1, 1, 1, 1,
0.4113291, 0.2238182, 2.231172, 1, 1, 1, 1, 1,
0.420115, -0.4685767, 2.795479, 1, 1, 1, 1, 1,
0.422062, 0.1524747, 0.8566387, 0, 0, 1, 1, 1,
0.4236415, -0.5181848, 5.397094, 1, 0, 0, 1, 1,
0.4285679, 0.06119177, 0.6793493, 1, 0, 0, 1, 1,
0.4294736, -0.3596565, 1.77012, 1, 0, 0, 1, 1,
0.4307117, -0.278843, 2.387137, 1, 0, 0, 1, 1,
0.4320213, -1.076594, 2.661581, 1, 0, 0, 1, 1,
0.4330473, -0.76226, 3.755891, 0, 0, 0, 1, 1,
0.4336203, -1.577995, 2.311475, 0, 0, 0, 1, 1,
0.4394782, 0.09537264, 3.786944, 0, 0, 0, 1, 1,
0.4403909, -0.1553167, 3.20567, 0, 0, 0, 1, 1,
0.441919, 0.3747345, 1.918925, 0, 0, 0, 1, 1,
0.4436053, 1.074464, -0.6370255, 0, 0, 0, 1, 1,
0.4444388, 0.4398156, 0.345476, 0, 0, 0, 1, 1,
0.4486349, -0.3148482, 2.83248, 1, 1, 1, 1, 1,
0.4556192, -0.6071746, 1.730793, 1, 1, 1, 1, 1,
0.4565659, 0.9738503, 0.3212059, 1, 1, 1, 1, 1,
0.4566247, -0.8243629, 4.290063, 1, 1, 1, 1, 1,
0.4596716, -1.131869, 4.011256, 1, 1, 1, 1, 1,
0.4623692, -0.892597, 2.929587, 1, 1, 1, 1, 1,
0.467989, -1.210866, 2.51636, 1, 1, 1, 1, 1,
0.4713184, 0.7674378, -2.058863, 1, 1, 1, 1, 1,
0.4716757, 1.130122, 0.9420701, 1, 1, 1, 1, 1,
0.4737157, 0.2276707, 2.694325, 1, 1, 1, 1, 1,
0.4786589, -0.3212353, 1.417037, 1, 1, 1, 1, 1,
0.4810487, 0.7527021, 2.395453, 1, 1, 1, 1, 1,
0.4827841, -0.6401379, 2.311529, 1, 1, 1, 1, 1,
0.4839465, 0.1780609, 0.8059226, 1, 1, 1, 1, 1,
0.486785, -1.026395, 2.918993, 1, 1, 1, 1, 1,
0.4954355, 1.325868, 0.3491726, 0, 0, 1, 1, 1,
0.4958138, -1.396833, 3.811832, 1, 0, 0, 1, 1,
0.4973376, -0.2561729, 2.20935, 1, 0, 0, 1, 1,
0.501298, -0.0593897, 2.550748, 1, 0, 0, 1, 1,
0.5042223, -1.104773, 3.605587, 1, 0, 0, 1, 1,
0.5096394, -0.5313304, 3.561392, 1, 0, 0, 1, 1,
0.5124345, 0.8611047, 0.8311423, 0, 0, 0, 1, 1,
0.5155011, -0.8005052, 2.187433, 0, 0, 0, 1, 1,
0.5195767, 1.385908, 0.8366608, 0, 0, 0, 1, 1,
0.5210251, -1.11863, 2.013318, 0, 0, 0, 1, 1,
0.5238318, -1.01526, 2.586113, 0, 0, 0, 1, 1,
0.5262324, -0.1128431, 1.847295, 0, 0, 0, 1, 1,
0.528804, 0.6534775, 1.679565, 0, 0, 0, 1, 1,
0.5308421, 0.2882044, 1.955596, 1, 1, 1, 1, 1,
0.5312181, -0.004858346, 3.720719, 1, 1, 1, 1, 1,
0.535228, 0.1957789, 0.763092, 1, 1, 1, 1, 1,
0.5367002, -0.006535218, 1.807717, 1, 1, 1, 1, 1,
0.53706, -0.04473086, 0.5387807, 1, 1, 1, 1, 1,
0.545476, 0.3882003, -0.5440865, 1, 1, 1, 1, 1,
0.5463781, -0.1465715, 1.554773, 1, 1, 1, 1, 1,
0.5548148, -0.7392898, 0.7777678, 1, 1, 1, 1, 1,
0.5577238, 1.188219, 0.7585924, 1, 1, 1, 1, 1,
0.5579305, 0.4823711, 0.7792268, 1, 1, 1, 1, 1,
0.5595274, -1.038217, 3.929627, 1, 1, 1, 1, 1,
0.5619924, -0.1273346, -0.3890048, 1, 1, 1, 1, 1,
0.5643852, 0.7748479, 0.3177202, 1, 1, 1, 1, 1,
0.5678856, -0.4070061, 2.787609, 1, 1, 1, 1, 1,
0.5695803, -0.1106123, 1.354393, 1, 1, 1, 1, 1,
0.5752068, -0.1728416, 2.509423, 0, 0, 1, 1, 1,
0.5792487, -0.1762536, 2.24234, 1, 0, 0, 1, 1,
0.5794089, -1.2273, 1.440679, 1, 0, 0, 1, 1,
0.5843453, -0.7503074, 2.689815, 1, 0, 0, 1, 1,
0.5847256, 0.8734693, 0.5439789, 1, 0, 0, 1, 1,
0.5859113, 1.87165, -1.111624, 1, 0, 0, 1, 1,
0.5869333, 0.6162116, 1.247344, 0, 0, 0, 1, 1,
0.5897409, 1.309276, -0.3591521, 0, 0, 0, 1, 1,
0.5923081, -0.5710853, 3.439115, 0, 0, 0, 1, 1,
0.5934244, 0.1811665, 0.7249774, 0, 0, 0, 1, 1,
0.5952855, 0.5219173, -0.271657, 0, 0, 0, 1, 1,
0.6023575, 1.296526, -0.4657232, 0, 0, 0, 1, 1,
0.6072198, -0.6137403, 2.482935, 0, 0, 0, 1, 1,
0.6086994, -0.1579134, -0.30237, 1, 1, 1, 1, 1,
0.6087069, 0.7217203, -0.02971966, 1, 1, 1, 1, 1,
0.6125773, -1.287378, 3.268915, 1, 1, 1, 1, 1,
0.6129266, -0.2391688, 1.939924, 1, 1, 1, 1, 1,
0.6203735, 0.6248993, -0.8661684, 1, 1, 1, 1, 1,
0.6208115, 0.9082721, -0.7850485, 1, 1, 1, 1, 1,
0.6273672, -0.891643, 2.171273, 1, 1, 1, 1, 1,
0.6282355, 0.2066414, 1.481176, 1, 1, 1, 1, 1,
0.6331696, -0.2630629, 2.429674, 1, 1, 1, 1, 1,
0.6346235, -0.7020471, 2.161265, 1, 1, 1, 1, 1,
0.6402127, 0.5965092, -0.6527892, 1, 1, 1, 1, 1,
0.6437089, 0.9700362, -1.085151, 1, 1, 1, 1, 1,
0.6440784, -1.53617, 2.897593, 1, 1, 1, 1, 1,
0.6452413, 0.7445288, 1.155576, 1, 1, 1, 1, 1,
0.6460947, -0.5379788, 4.232581, 1, 1, 1, 1, 1,
0.6475103, 0.3670999, 2.642202, 0, 0, 1, 1, 1,
0.6488003, -0.5872757, 2.950781, 1, 0, 0, 1, 1,
0.651033, 0.284702, 1.051679, 1, 0, 0, 1, 1,
0.6536028, 1.132492, -0.8996398, 1, 0, 0, 1, 1,
0.6574197, 0.3939501, 0.6651411, 1, 0, 0, 1, 1,
0.658544, 0.5451656, 2.182332, 1, 0, 0, 1, 1,
0.6724619, -0.3687528, 1.977258, 0, 0, 0, 1, 1,
0.6743277, -0.900375, 2.098386, 0, 0, 0, 1, 1,
0.6763715, -1.319046, 1.999772, 0, 0, 0, 1, 1,
0.6794493, -0.831422, 3.214502, 0, 0, 0, 1, 1,
0.6820869, -0.6636454, 3.008352, 0, 0, 0, 1, 1,
0.6924803, 1.026682, 0.4792217, 0, 0, 0, 1, 1,
0.6927021, 0.5851046, 2.71017, 0, 0, 0, 1, 1,
0.6949024, -0.01770184, 0.8890817, 1, 1, 1, 1, 1,
0.7038338, -0.6036018, 2.824768, 1, 1, 1, 1, 1,
0.7055925, 1.265506, 2.308259, 1, 1, 1, 1, 1,
0.7151507, 1.396891, -1.323189, 1, 1, 1, 1, 1,
0.7164001, 0.8496957, 0.227465, 1, 1, 1, 1, 1,
0.7193857, 1.261679, 0.5725681, 1, 1, 1, 1, 1,
0.7276171, 0.1214423, 2.51242, 1, 1, 1, 1, 1,
0.7373542, 2.499283, -1.939074, 1, 1, 1, 1, 1,
0.7406909, -0.9499198, 3.26313, 1, 1, 1, 1, 1,
0.7430267, 0.160272, 1.727358, 1, 1, 1, 1, 1,
0.7475634, 0.9923813, 2.341395, 1, 1, 1, 1, 1,
0.7511246, -1.09395, 1.721488, 1, 1, 1, 1, 1,
0.755756, 2.220399, -0.508872, 1, 1, 1, 1, 1,
0.758952, 0.9054924, 0.4399272, 1, 1, 1, 1, 1,
0.7601717, 1.779836, 0.9226152, 1, 1, 1, 1, 1,
0.7662037, -0.0408911, 2.461388, 0, 0, 1, 1, 1,
0.7678761, -0.5176314, 1.592692, 1, 0, 0, 1, 1,
0.770092, 0.7070303, -0.4368397, 1, 0, 0, 1, 1,
0.7728138, 0.9315543, 0.6818726, 1, 0, 0, 1, 1,
0.7778893, -1.838905, 3.554937, 1, 0, 0, 1, 1,
0.7797036, 1.468704, 1.285153, 1, 0, 0, 1, 1,
0.7839999, -0.689218, 2.492265, 0, 0, 0, 1, 1,
0.785182, 1.267429, 2.585238, 0, 0, 0, 1, 1,
0.7878235, -2.041939, 3.43864, 0, 0, 0, 1, 1,
0.791722, 0.3978465, 3.26016, 0, 0, 0, 1, 1,
0.7961954, 0.2828542, 1.280001, 0, 0, 0, 1, 1,
0.7973551, -0.4962579, 0.3881757, 0, 0, 0, 1, 1,
0.7980899, 0.9082768, -1.14007, 0, 0, 0, 1, 1,
0.7988478, -0.01784579, 1.169352, 1, 1, 1, 1, 1,
0.8048379, -0.9761419, 1.898943, 1, 1, 1, 1, 1,
0.806281, -1.120128, 1.132549, 1, 1, 1, 1, 1,
0.8110449, -0.4404802, 2.19486, 1, 1, 1, 1, 1,
0.8135691, 1.835366, 0.001549206, 1, 1, 1, 1, 1,
0.8178315, -0.7195046, 2.159178, 1, 1, 1, 1, 1,
0.8266057, 0.07520543, 1.163773, 1, 1, 1, 1, 1,
0.8335802, -1.9652, 3.016362, 1, 1, 1, 1, 1,
0.8343511, 0.343978, 1.519828, 1, 1, 1, 1, 1,
0.8347912, -1.688501, 1.717202, 1, 1, 1, 1, 1,
0.8352485, 0.8424218, -0.1771952, 1, 1, 1, 1, 1,
0.8365477, -1.027947, 4.121795, 1, 1, 1, 1, 1,
0.8400302, 0.518981, 3.514813, 1, 1, 1, 1, 1,
0.8442921, -0.5385308, 1.278268, 1, 1, 1, 1, 1,
0.8482592, 0.1649944, 2.394084, 1, 1, 1, 1, 1,
0.850357, 1.743659, -0.5145457, 0, 0, 1, 1, 1,
0.8546478, 1.936248, 0.4994135, 1, 0, 0, 1, 1,
0.8612135, -0.5748248, 1.187263, 1, 0, 0, 1, 1,
0.8708335, 0.4047261, 1.879839, 1, 0, 0, 1, 1,
0.8907267, 1.525586, 1.146697, 1, 0, 0, 1, 1,
0.891629, 1.157358, -0.2922961, 1, 0, 0, 1, 1,
0.8938083, 0.7133173, 0.6953886, 0, 0, 0, 1, 1,
0.899178, 1.477826, 0.5596603, 0, 0, 0, 1, 1,
0.9020523, -0.2086183, 1.288655, 0, 0, 0, 1, 1,
0.9024405, -1.392098, 2.505774, 0, 0, 0, 1, 1,
0.9043291, 0.04685138, 1.730959, 0, 0, 0, 1, 1,
0.9047465, -0.4000671, 1.037784, 0, 0, 0, 1, 1,
0.9126941, 1.607932, 0.3375198, 0, 0, 0, 1, 1,
0.9139251, -0.2752889, 3.239504, 1, 1, 1, 1, 1,
0.9174183, 0.9594895, 0.4300407, 1, 1, 1, 1, 1,
0.9191375, -1.30945, 2.265501, 1, 1, 1, 1, 1,
0.9223155, -0.8260992, 1.62175, 1, 1, 1, 1, 1,
0.923315, -0.4259093, 0.9312691, 1, 1, 1, 1, 1,
0.9389418, 0.2930532, -0.2955748, 1, 1, 1, 1, 1,
0.9460284, 1.5378, -0.4690741, 1, 1, 1, 1, 1,
0.9502786, 0.9300843, -1.04633, 1, 1, 1, 1, 1,
0.9554273, -0.797621, 2.202597, 1, 1, 1, 1, 1,
0.961527, -0.4530204, 2.321008, 1, 1, 1, 1, 1,
0.9667578, 0.2834359, 1.510106, 1, 1, 1, 1, 1,
0.9688244, -0.4384294, 3.11538, 1, 1, 1, 1, 1,
0.9717758, -0.4155918, 1.232402, 1, 1, 1, 1, 1,
0.9736131, 0.8534241, 1.733207, 1, 1, 1, 1, 1,
0.9793946, 1.530394, 0.02405528, 1, 1, 1, 1, 1,
0.9808571, -0.4688362, 2.89381, 0, 0, 1, 1, 1,
0.9827811, 1.486805, 1.513358, 1, 0, 0, 1, 1,
0.9838142, -0.2083595, 2.233919, 1, 0, 0, 1, 1,
0.9849045, 1.826966, 0.9043106, 1, 0, 0, 1, 1,
0.985544, 0.3708084, 0.3723729, 1, 0, 0, 1, 1,
0.9874926, 1.171024, 0.8590261, 1, 0, 0, 1, 1,
0.988528, -0.958584, 1.677194, 0, 0, 0, 1, 1,
0.9895214, 0.5753884, 0.6246245, 0, 0, 0, 1, 1,
0.9951614, 0.182713, 0.891836, 0, 0, 0, 1, 1,
0.9972665, 1.981297, -0.9837854, 0, 0, 0, 1, 1,
0.9981739, -1.283845, 1.287947, 0, 0, 0, 1, 1,
1.00008, -0.0003567351, 1.697516, 0, 0, 0, 1, 1,
1.011023, 0.3951586, 1.584131, 0, 0, 0, 1, 1,
1.013567, -0.7002926, 0.4711801, 1, 1, 1, 1, 1,
1.019806, 1.426672, 0.5520747, 1, 1, 1, 1, 1,
1.023908, -1.323478, 2.872675, 1, 1, 1, 1, 1,
1.025484, 0.6425612, 1.646363, 1, 1, 1, 1, 1,
1.039292, -1.315858, 3.943483, 1, 1, 1, 1, 1,
1.04924, 1.059528, 1.346877, 1, 1, 1, 1, 1,
1.060129, 1.044557, 1.629233, 1, 1, 1, 1, 1,
1.065978, 1.200417, -0.8990998, 1, 1, 1, 1, 1,
1.070146, -0.6906959, 1.142522, 1, 1, 1, 1, 1,
1.071245, -0.6446761, 0.9790369, 1, 1, 1, 1, 1,
1.079757, 0.2650406, 1.614578, 1, 1, 1, 1, 1,
1.081892, 0.2964908, 2.307276, 1, 1, 1, 1, 1,
1.088686, 1.410137, 0.5760174, 1, 1, 1, 1, 1,
1.117323, 0.4973344, 1.312711, 1, 1, 1, 1, 1,
1.123622, -0.3041098, 0.324271, 1, 1, 1, 1, 1,
1.124048, 1.815082, 1.112232, 0, 0, 1, 1, 1,
1.126407, -0.5754754, 1.228992, 1, 0, 0, 1, 1,
1.129186, 1.320334, 1.822646, 1, 0, 0, 1, 1,
1.131789, 0.3582065, 0.6924137, 1, 0, 0, 1, 1,
1.134179, -1.617929, 1.396444, 1, 0, 0, 1, 1,
1.138727, 0.6049442, 1.279137, 1, 0, 0, 1, 1,
1.147558, -0.6879053, 2.884773, 0, 0, 0, 1, 1,
1.151044, 1.132609, 1.682191, 0, 0, 0, 1, 1,
1.15166, -0.7490007, 2.377039, 0, 0, 0, 1, 1,
1.156122, 0.8024167, 1.000504, 0, 0, 0, 1, 1,
1.156725, 0.8079561, 0.3299411, 0, 0, 0, 1, 1,
1.162336, -0.3238078, 0.657654, 0, 0, 0, 1, 1,
1.164305, 0.06131947, 1.491531, 0, 0, 0, 1, 1,
1.168099, -0.2453029, 3.479584, 1, 1, 1, 1, 1,
1.168508, 0.9126559, -0.2091094, 1, 1, 1, 1, 1,
1.168637, -0.2795581, -0.4057922, 1, 1, 1, 1, 1,
1.187669, 0.1711599, 0.8177434, 1, 1, 1, 1, 1,
1.18789, 0.7062277, 2.229528, 1, 1, 1, 1, 1,
1.206443, -0.4834698, 4.101716, 1, 1, 1, 1, 1,
1.232803, 0.1317145, 1.1737, 1, 1, 1, 1, 1,
1.235063, 0.2698377, 0.8717319, 1, 1, 1, 1, 1,
1.239414, 0.62336, 0.8251206, 1, 1, 1, 1, 1,
1.244789, -0.02538251, 3.514822, 1, 1, 1, 1, 1,
1.251351, -1.775644, 1.459442, 1, 1, 1, 1, 1,
1.256543, 0.2991453, 0.5335622, 1, 1, 1, 1, 1,
1.260915, -0.5638056, 2.473642, 1, 1, 1, 1, 1,
1.270223, -0.03184688, 2.012648, 1, 1, 1, 1, 1,
1.270353, 1.383013, 2.328358, 1, 1, 1, 1, 1,
1.271302, -1.563942, 1.949347, 0, 0, 1, 1, 1,
1.285285, 0.7914067, 1.181696, 1, 0, 0, 1, 1,
1.285386, 0.8824336, -0.9704143, 1, 0, 0, 1, 1,
1.291797, 1.680467, 0.7537364, 1, 0, 0, 1, 1,
1.293462, 1.588306, 0.9996343, 1, 0, 0, 1, 1,
1.295237, -0.8711385, 1.843543, 1, 0, 0, 1, 1,
1.295443, 0.5155942, -0.3530435, 0, 0, 0, 1, 1,
1.310689, 0.3834823, -1.61747, 0, 0, 0, 1, 1,
1.315407, 0.05015093, 2.771599, 0, 0, 0, 1, 1,
1.318841, 0.125216, 0.6909932, 0, 0, 0, 1, 1,
1.319138, 2.406974, -0.1818661, 0, 0, 0, 1, 1,
1.329073, -0.3131973, 0.20801, 0, 0, 0, 1, 1,
1.341737, -0.1982912, 2.588496, 0, 0, 0, 1, 1,
1.341748, 1.579109, 1.922622, 1, 1, 1, 1, 1,
1.354995, 0.9850699, 1.389014, 1, 1, 1, 1, 1,
1.356172, -0.7527075, 2.520749, 1, 1, 1, 1, 1,
1.356688, 0.3328849, 2.394051, 1, 1, 1, 1, 1,
1.362535, 0.3466035, 2.72131, 1, 1, 1, 1, 1,
1.366742, 2.488587, 0.8461263, 1, 1, 1, 1, 1,
1.376728, 0.7883982, 0.9818587, 1, 1, 1, 1, 1,
1.377962, 0.3326303, 2.769127, 1, 1, 1, 1, 1,
1.382249, 0.616901, 0.207, 1, 1, 1, 1, 1,
1.382566, -0.5516204, 3.218183, 1, 1, 1, 1, 1,
1.391408, 1.764861, 0.04099719, 1, 1, 1, 1, 1,
1.413843, 1.915127, 0.4493184, 1, 1, 1, 1, 1,
1.421146, -0.9976676, 1.171769, 1, 1, 1, 1, 1,
1.460141, -0.293907, -0.4062153, 1, 1, 1, 1, 1,
1.478364, 0.3789593, 0.7299374, 1, 1, 1, 1, 1,
1.484489, -0.9301203, 2.081916, 0, 0, 1, 1, 1,
1.496905, -0.004279692, 2.390675, 1, 0, 0, 1, 1,
1.500314, 0.05677433, 1.499152, 1, 0, 0, 1, 1,
1.50482, 0.2422647, 1.828662, 1, 0, 0, 1, 1,
1.505146, 0.001565161, 2.613685, 1, 0, 0, 1, 1,
1.513223, 2.017159, 1.68867, 1, 0, 0, 1, 1,
1.513736, 0.2734996, 1.353119, 0, 0, 0, 1, 1,
1.518054, 0.2045907, 1.886994, 0, 0, 0, 1, 1,
1.535479, 1.088483, -0.1920392, 0, 0, 0, 1, 1,
1.536577, 0.3729186, 1.119513, 0, 0, 0, 1, 1,
1.537557, -0.01289553, 1.842151, 0, 0, 0, 1, 1,
1.538952, 0.6299233, 2.749604, 0, 0, 0, 1, 1,
1.540195, -0.2113484, 2.889618, 0, 0, 0, 1, 1,
1.565099, -0.3689328, 1.779832, 1, 1, 1, 1, 1,
1.596992, -0.4370871, 1.843196, 1, 1, 1, 1, 1,
1.598644, 0.07330304, 1.719987, 1, 1, 1, 1, 1,
1.608921, -0.7568475, 0.1067885, 1, 1, 1, 1, 1,
1.609603, 0.2427243, 2.014891, 1, 1, 1, 1, 1,
1.618635, -0.5489724, 1.724965, 1, 1, 1, 1, 1,
1.626535, -0.1274955, 0.6373547, 1, 1, 1, 1, 1,
1.638061, 0.001698095, 1.012673, 1, 1, 1, 1, 1,
1.665586, -0.4654183, 2.970503, 1, 1, 1, 1, 1,
1.688433, 1.518629, 0.9770396, 1, 1, 1, 1, 1,
1.692347, -0.4849699, 2.973661, 1, 1, 1, 1, 1,
1.697271, 0.8574113, 1.344292, 1, 1, 1, 1, 1,
1.700351, 2.031636, 0.1539586, 1, 1, 1, 1, 1,
1.704715, -0.7219769, 0.2010589, 1, 1, 1, 1, 1,
1.722914, 0.5283481, 1.356391, 1, 1, 1, 1, 1,
1.723215, 0.674933, 0.5023852, 0, 0, 1, 1, 1,
1.738513, -1.017896, 4.209662, 1, 0, 0, 1, 1,
1.747041, -1.036261, 3.544775, 1, 0, 0, 1, 1,
1.752633, -0.01036979, 0.4070575, 1, 0, 0, 1, 1,
1.755945, -0.3787032, 1.613135, 1, 0, 0, 1, 1,
1.761546, -1.009245, 1.915376, 1, 0, 0, 1, 1,
1.77087, 0.6027479, 1.105339, 0, 0, 0, 1, 1,
1.771885, -0.3095568, -0.07819122, 0, 0, 0, 1, 1,
1.774053, -0.3054844, 3.241266, 0, 0, 0, 1, 1,
1.786654, -1.032881, 2.422842, 0, 0, 0, 1, 1,
1.80273, 0.1898997, 2.570147, 0, 0, 0, 1, 1,
1.812383, 1.49229, 2.476092, 0, 0, 0, 1, 1,
1.814591, 0.5862638, 1.000411, 0, 0, 0, 1, 1,
1.832883, -0.8361576, 1.040128, 1, 1, 1, 1, 1,
1.834956, -0.2966295, 3.001375, 1, 1, 1, 1, 1,
1.8359, -1.974838, 2.015648, 1, 1, 1, 1, 1,
1.84405, -1.13556, 2.339721, 1, 1, 1, 1, 1,
1.861979, 0.04156438, 2.079727, 1, 1, 1, 1, 1,
1.880344, 0.8484827, 1.673062, 1, 1, 1, 1, 1,
1.890866, 0.7094081, 2.281725, 1, 1, 1, 1, 1,
1.892902, 0.7626736, 1.302166, 1, 1, 1, 1, 1,
1.897235, 0.6805367, 0.5541695, 1, 1, 1, 1, 1,
1.915517, -0.1806986, 1.402316, 1, 1, 1, 1, 1,
1.933817, -0.1729346, 2.286487, 1, 1, 1, 1, 1,
1.934381, -0.8558017, 1.223814, 1, 1, 1, 1, 1,
1.946675, -0.2244093, 3.528228, 1, 1, 1, 1, 1,
1.948779, -0.1852422, 1.581433, 1, 1, 1, 1, 1,
1.972666, 0.9212914, 1.67689, 1, 1, 1, 1, 1,
1.977371, -1.760992, 3.174774, 0, 0, 1, 1, 1,
2.028367, -0.7277088, 2.904076, 1, 0, 0, 1, 1,
2.076954, -1.201011, 2.804342, 1, 0, 0, 1, 1,
2.100275, -0.4791693, 3.248943, 1, 0, 0, 1, 1,
2.101359, 0.09366857, 1.616731, 1, 0, 0, 1, 1,
2.10319, 0.6602525, 2.303463, 1, 0, 0, 1, 1,
2.178245, -0.8506979, 2.704798, 0, 0, 0, 1, 1,
2.257899, -0.1483261, 2.263803, 0, 0, 0, 1, 1,
2.329393, 1.31326, 0.3373209, 0, 0, 0, 1, 1,
2.381321, 0.1438935, 0.4899318, 0, 0, 0, 1, 1,
2.42309, 0.5919582, 1.064713, 0, 0, 0, 1, 1,
2.433513, -0.9643899, 1.88746, 0, 0, 0, 1, 1,
2.459629, 0.6321069, 2.006543, 0, 0, 0, 1, 1,
2.499192, 0.8793076, 3.799177, 1, 1, 1, 1, 1,
2.625413, -0.6261619, 1.596285, 1, 1, 1, 1, 1,
2.707435, 1.332368, 1.410651, 1, 1, 1, 1, 1,
2.792, 0.6157671, 2.816477, 1, 1, 1, 1, 1,
2.814147, 2.416277, 1.270749, 1, 1, 1, 1, 1,
2.835662, -0.8498427, 1.200907, 1, 1, 1, 1, 1,
3.059489, 1.029836, 2.268957, 1, 1, 1, 1, 1
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
var radius = 10.01049;
var distance = 35.16142;
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
mvMatrix.translate( 0.07256508, 0.07119179, 0.5979609 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.16142);
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
