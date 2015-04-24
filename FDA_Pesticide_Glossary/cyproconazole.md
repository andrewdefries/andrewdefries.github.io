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
-5.141961, 1.272624, -0.2136404, 1, 0, 0, 1,
-3.332462, 0.5757491, -0.8211498, 1, 0.007843138, 0, 1,
-2.837411, 0.1663681, -2.822093, 1, 0.01176471, 0, 1,
-2.683443, -0.8474091, -4.402797, 1, 0.01960784, 0, 1,
-2.65976, -1.317088, -0.4943695, 1, 0.02352941, 0, 1,
-2.606818, -0.904511, -2.599734, 1, 0.03137255, 0, 1,
-2.593735, 0.4319595, -0.3767675, 1, 0.03529412, 0, 1,
-2.566064, -0.4208103, -1.668294, 1, 0.04313726, 0, 1,
-2.525434, 1.550051, -0.7168664, 1, 0.04705882, 0, 1,
-2.445014, 0.2934506, -1.209065, 1, 0.05490196, 0, 1,
-2.443697, 0.7939531, -1.649071, 1, 0.05882353, 0, 1,
-2.290501, -0.1919171, -2.136546, 1, 0.06666667, 0, 1,
-2.262058, -1.606693, -2.387165, 1, 0.07058824, 0, 1,
-2.219948, -1.885651, -1.916355, 1, 0.07843138, 0, 1,
-2.216517, 0.2981279, -1.03136, 1, 0.08235294, 0, 1,
-2.191733, -0.5802244, -1.030198, 1, 0.09019608, 0, 1,
-2.179261, -0.117852, -1.937581, 1, 0.09411765, 0, 1,
-2.1739, -1.089367, -1.588336, 1, 0.1019608, 0, 1,
-2.156588, -0.986011, -2.112465, 1, 0.1098039, 0, 1,
-2.131431, -1.001939, -3.30995, 1, 0.1137255, 0, 1,
-2.098614, 0.9960055, -3.040151, 1, 0.1215686, 0, 1,
-2.069753, 0.1833376, -1.360832, 1, 0.1254902, 0, 1,
-2.04143, 0.3529195, -1.20387, 1, 0.1333333, 0, 1,
-2.036435, 0.7012752, -0.8034313, 1, 0.1372549, 0, 1,
-2.032845, 0.1995125, -1.57688, 1, 0.145098, 0, 1,
-1.982199, -0.3996549, -2.475723, 1, 0.1490196, 0, 1,
-1.941036, 0.7623062, -0.854669, 1, 0.1568628, 0, 1,
-1.913068, 0.4964698, -2.091149, 1, 0.1607843, 0, 1,
-1.895117, -0.3587899, -1.900763, 1, 0.1686275, 0, 1,
-1.883578, -0.4178264, -0.7420913, 1, 0.172549, 0, 1,
-1.882139, 0.2813679, -2.556358, 1, 0.1803922, 0, 1,
-1.878185, -0.3597294, -0.795049, 1, 0.1843137, 0, 1,
-1.869399, -0.3680965, -0.4197724, 1, 0.1921569, 0, 1,
-1.855088, 0.891638, -1.866305, 1, 0.1960784, 0, 1,
-1.848453, -1.4002, -2.161275, 1, 0.2039216, 0, 1,
-1.848377, 0.7866051, -1.142003, 1, 0.2117647, 0, 1,
-1.837677, 1.051136, -1.855254, 1, 0.2156863, 0, 1,
-1.815742, -1.751323, -2.451642, 1, 0.2235294, 0, 1,
-1.815702, 0.1657583, -0.4202892, 1, 0.227451, 0, 1,
-1.814147, -1.336594, -0.8124377, 1, 0.2352941, 0, 1,
-1.80378, 0.7752151, -1.444275, 1, 0.2392157, 0, 1,
-1.750182, -1.035524, -1.213786, 1, 0.2470588, 0, 1,
-1.748856, -0.1096688, -0.7320343, 1, 0.2509804, 0, 1,
-1.747702, -0.08552722, -1.192899, 1, 0.2588235, 0, 1,
-1.737473, -0.4520747, -1.014629, 1, 0.2627451, 0, 1,
-1.733339, 0.1438166, -0.9609532, 1, 0.2705882, 0, 1,
-1.726082, 0.1973801, -3.0331, 1, 0.2745098, 0, 1,
-1.723648, 1.831485, 0.06744269, 1, 0.282353, 0, 1,
-1.723295, -0.3223511, -2.006589, 1, 0.2862745, 0, 1,
-1.719233, 1.015584, -0.2672278, 1, 0.2941177, 0, 1,
-1.715272, 0.3490947, 0.6213098, 1, 0.3019608, 0, 1,
-1.714801, 0.7925761, -0.9965746, 1, 0.3058824, 0, 1,
-1.701829, 0.3791123, -2.189806, 1, 0.3137255, 0, 1,
-1.68942, -0.43757, -3.144959, 1, 0.3176471, 0, 1,
-1.680519, -1.615971, -2.210161, 1, 0.3254902, 0, 1,
-1.672164, 0.5187387, -2.008608, 1, 0.3294118, 0, 1,
-1.664798, -1.44356, -1.827889, 1, 0.3372549, 0, 1,
-1.635249, -0.03677215, 0.08522619, 1, 0.3411765, 0, 1,
-1.616674, -0.07607472, -1.961738, 1, 0.3490196, 0, 1,
-1.582213, 0.1827244, -3.043647, 1, 0.3529412, 0, 1,
-1.581304, 2.820557, -1.443282, 1, 0.3607843, 0, 1,
-1.5811, -1.544308, -4.38174, 1, 0.3647059, 0, 1,
-1.577227, -0.2454173, -1.917657, 1, 0.372549, 0, 1,
-1.555806, 0.2159168, -2.253392, 1, 0.3764706, 0, 1,
-1.552238, 1.879468, 0.4559498, 1, 0.3843137, 0, 1,
-1.5475, 1.216678, -1.405659, 1, 0.3882353, 0, 1,
-1.545259, 0.9560459, 1.684083, 1, 0.3960784, 0, 1,
-1.529892, 0.7761034, -0.6514157, 1, 0.4039216, 0, 1,
-1.527846, 0.3565234, -2.312118, 1, 0.4078431, 0, 1,
-1.523588, 1.290192, -1.689149, 1, 0.4156863, 0, 1,
-1.523054, 1.214125, -0.3251548, 1, 0.4196078, 0, 1,
-1.511523, 1.41907, -1.524991, 1, 0.427451, 0, 1,
-1.50407, -0.3823292, -1.709394, 1, 0.4313726, 0, 1,
-1.503034, 1.519052, -0.9634084, 1, 0.4392157, 0, 1,
-1.495204, -0.562937, -2.081156, 1, 0.4431373, 0, 1,
-1.481699, -0.6973963, -2.033241, 1, 0.4509804, 0, 1,
-1.479264, 1.095178, -1.610534, 1, 0.454902, 0, 1,
-1.476743, 2.082578, -1.591504, 1, 0.4627451, 0, 1,
-1.459649, 1.899342, 1.395038, 1, 0.4666667, 0, 1,
-1.455548, -1.11472, -1.913245, 1, 0.4745098, 0, 1,
-1.446762, 0.7602695, -1.634408, 1, 0.4784314, 0, 1,
-1.439921, -0.3739614, -2.484941, 1, 0.4862745, 0, 1,
-1.438503, 0.9026719, -2.232666, 1, 0.4901961, 0, 1,
-1.438437, -0.8678087, -0.9134093, 1, 0.4980392, 0, 1,
-1.426753, 1.886196, -1.102664, 1, 0.5058824, 0, 1,
-1.425065, -0.01426017, 0.3378695, 1, 0.509804, 0, 1,
-1.422392, -0.5025932, -2.341004, 1, 0.5176471, 0, 1,
-1.411461, -0.587539, -0.4911895, 1, 0.5215687, 0, 1,
-1.408173, 1.140782, -0.9868697, 1, 0.5294118, 0, 1,
-1.405067, -0.3814681, -3.655717, 1, 0.5333334, 0, 1,
-1.388414, 0.6159956, -0.8019275, 1, 0.5411765, 0, 1,
-1.380509, -0.8596324, -3.907646, 1, 0.5450981, 0, 1,
-1.377429, 2.072312, -0.5263261, 1, 0.5529412, 0, 1,
-1.376031, 0.3859411, -1.285639, 1, 0.5568628, 0, 1,
-1.372834, 0.2263717, -1.034071, 1, 0.5647059, 0, 1,
-1.366161, 0.9521227, -1.019677, 1, 0.5686275, 0, 1,
-1.360434, 0.642603, -1.196613, 1, 0.5764706, 0, 1,
-1.356496, 0.2888473, -1.692524, 1, 0.5803922, 0, 1,
-1.345625, -0.5217365, -3.41844, 1, 0.5882353, 0, 1,
-1.342114, 0.429949, -1.659033, 1, 0.5921569, 0, 1,
-1.337457, -0.711225, -1.910195, 1, 0.6, 0, 1,
-1.335574, -0.1110571, -0.1734174, 1, 0.6078432, 0, 1,
-1.333117, 0.5908964, -1.033981, 1, 0.6117647, 0, 1,
-1.322872, -0.1945882, -1.517834, 1, 0.6196079, 0, 1,
-1.318513, 0.4157138, -1.101543, 1, 0.6235294, 0, 1,
-1.318355, -0.02378342, -0.6732708, 1, 0.6313726, 0, 1,
-1.306337, 0.140456, -1.724004, 1, 0.6352941, 0, 1,
-1.302763, -1.073283, -2.596213, 1, 0.6431373, 0, 1,
-1.300001, -0.1599093, -0.6769862, 1, 0.6470588, 0, 1,
-1.29933, 1.864354, -1.980442, 1, 0.654902, 0, 1,
-1.295951, 0.2551822, -2.272044, 1, 0.6588235, 0, 1,
-1.283849, 0.003069447, -2.04088, 1, 0.6666667, 0, 1,
-1.276205, -0.7532197, -2.283454, 1, 0.6705883, 0, 1,
-1.270545, 0.08894688, -2.179932, 1, 0.6784314, 0, 1,
-1.269844, 0.5424914, 0.8426541, 1, 0.682353, 0, 1,
-1.264815, -0.9717357, -1.421851, 1, 0.6901961, 0, 1,
-1.261418, 0.08250774, -0.2438966, 1, 0.6941177, 0, 1,
-1.252615, -1.418425, -3.404739, 1, 0.7019608, 0, 1,
-1.239352, -1.590665, -0.4078676, 1, 0.7098039, 0, 1,
-1.230194, -0.9057605, -1.314997, 1, 0.7137255, 0, 1,
-1.226179, 1.049808, 0.05147528, 1, 0.7215686, 0, 1,
-1.217309, -0.3771136, -3.294616, 1, 0.7254902, 0, 1,
-1.216422, 0.1393908, -1.175315, 1, 0.7333333, 0, 1,
-1.207145, 0.1784713, -1.344047, 1, 0.7372549, 0, 1,
-1.201741, 0.9251903, -2.198712, 1, 0.7450981, 0, 1,
-1.197685, 0.2104554, -0.8048435, 1, 0.7490196, 0, 1,
-1.197335, 0.3101347, -0.8404913, 1, 0.7568628, 0, 1,
-1.195808, -0.3154381, -2.206359, 1, 0.7607843, 0, 1,
-1.191829, 2.308929, -1.825276, 1, 0.7686275, 0, 1,
-1.170585, 0.532172, -0.985714, 1, 0.772549, 0, 1,
-1.167179, -0.439768, 0.3362029, 1, 0.7803922, 0, 1,
-1.160017, -0.3962628, -3.039735, 1, 0.7843137, 0, 1,
-1.156659, -0.01030368, -1.449167, 1, 0.7921569, 0, 1,
-1.154012, -0.4071611, -1.213273, 1, 0.7960784, 0, 1,
-1.147596, 0.5979602, -1.702142, 1, 0.8039216, 0, 1,
-1.139926, -1.110706, -2.55687, 1, 0.8117647, 0, 1,
-1.136045, -0.851734, -2.89077, 1, 0.8156863, 0, 1,
-1.132012, -0.8171304, -4.210677, 1, 0.8235294, 0, 1,
-1.131926, -0.9075596, -2.350829, 1, 0.827451, 0, 1,
-1.131047, 0.2936561, 0.2301928, 1, 0.8352941, 0, 1,
-1.123962, 0.8240838, -0.4258524, 1, 0.8392157, 0, 1,
-1.112213, 2.423233, -1.104256, 1, 0.8470588, 0, 1,
-1.086923, -0.1890039, -1.768507, 1, 0.8509804, 0, 1,
-1.086746, 0.02764139, 0.1328172, 1, 0.8588235, 0, 1,
-1.072706, 0.4456307, -0.6374055, 1, 0.8627451, 0, 1,
-1.068098, 0.5814992, -0.4515966, 1, 0.8705882, 0, 1,
-1.064932, 1.497968, -0.3669583, 1, 0.8745098, 0, 1,
-1.048517, 0.4784566, -1.273407, 1, 0.8823529, 0, 1,
-1.031224, -0.3410998, -1.356142, 1, 0.8862745, 0, 1,
-1.026462, 0.7788652, -2.519271, 1, 0.8941177, 0, 1,
-1.026255, 1.23211, -0.9169014, 1, 0.8980392, 0, 1,
-1.023531, -0.2713227, -2.018181, 1, 0.9058824, 0, 1,
-1.02226, 0.421491, -2.012298, 1, 0.9137255, 0, 1,
-1.010258, 0.7440034, 0.5208901, 1, 0.9176471, 0, 1,
-1.004014, 0.341739, 0.8993442, 1, 0.9254902, 0, 1,
-0.9984225, 1.890407, 0.2524544, 1, 0.9294118, 0, 1,
-0.9977837, 0.2720352, -0.9940065, 1, 0.9372549, 0, 1,
-0.9977427, 2.331454, -0.819766, 1, 0.9411765, 0, 1,
-0.9972845, -0.9154469, -0.8499147, 1, 0.9490196, 0, 1,
-0.9913428, 0.8583235, -1.927347, 1, 0.9529412, 0, 1,
-0.990447, -0.7469031, -1.987267, 1, 0.9607843, 0, 1,
-0.9866491, 0.901983, 0.196742, 1, 0.9647059, 0, 1,
-0.9816431, 1.537184, -0.3703073, 1, 0.972549, 0, 1,
-0.9778605, -1.344089, -2.955108, 1, 0.9764706, 0, 1,
-0.9776982, 0.8775135, -0.4187236, 1, 0.9843137, 0, 1,
-0.9742537, -0.4986629, -1.081022, 1, 0.9882353, 0, 1,
-0.9713788, 1.272312, -0.7081261, 1, 0.9960784, 0, 1,
-0.9708994, 0.2995263, 0.1180249, 0.9960784, 1, 0, 1,
-0.9646536, 0.09274676, -0.7779377, 0.9921569, 1, 0, 1,
-0.9609667, -0.08365704, -1.376842, 0.9843137, 1, 0, 1,
-0.9563521, 1.26088, 1.097486, 0.9803922, 1, 0, 1,
-0.9519504, -1.283095, -1.441028, 0.972549, 1, 0, 1,
-0.944604, -0.5039786, -2.212252, 0.9686275, 1, 0, 1,
-0.9422432, -0.3057464, -0.6007363, 0.9607843, 1, 0, 1,
-0.937088, -0.004775216, -1.456321, 0.9568627, 1, 0, 1,
-0.9359666, 1.525076, -1.196437, 0.9490196, 1, 0, 1,
-0.9323459, 0.5166588, -1.223723, 0.945098, 1, 0, 1,
-0.9321508, -0.6493585, -1.996865, 0.9372549, 1, 0, 1,
-0.9304217, -0.6758726, -3.133836, 0.9333333, 1, 0, 1,
-0.9292148, 1.24903, -0.9864929, 0.9254902, 1, 0, 1,
-0.9265032, -1.807458, -2.719705, 0.9215686, 1, 0, 1,
-0.92387, 0.1489213, -0.4714648, 0.9137255, 1, 0, 1,
-0.9144224, -0.9628035, -3.682245, 0.9098039, 1, 0, 1,
-0.9108919, 0.1132566, -3.092354, 0.9019608, 1, 0, 1,
-0.9054698, 0.1554367, -1.606908, 0.8941177, 1, 0, 1,
-0.9051824, 0.09812533, -3.43304, 0.8901961, 1, 0, 1,
-0.9021671, -0.6661471, -2.114429, 0.8823529, 1, 0, 1,
-0.8924997, -2.411097, -0.583965, 0.8784314, 1, 0, 1,
-0.8911691, 0.7334986, 0.1899413, 0.8705882, 1, 0, 1,
-0.8889142, 0.6010008, -1.968134, 0.8666667, 1, 0, 1,
-0.8858179, -0.4544596, -1.466897, 0.8588235, 1, 0, 1,
-0.8839717, 1.195735, -0.2597195, 0.854902, 1, 0, 1,
-0.8719428, 0.9392373, -1.281732, 0.8470588, 1, 0, 1,
-0.8657628, -1.00313, -2.967281, 0.8431373, 1, 0, 1,
-0.8654339, 2.185388, -1.592842, 0.8352941, 1, 0, 1,
-0.8634318, 0.4144244, -0.5053289, 0.8313726, 1, 0, 1,
-0.8345383, -0.0828907, -1.290617, 0.8235294, 1, 0, 1,
-0.8338421, 0.2349354, -1.676638, 0.8196079, 1, 0, 1,
-0.83316, -5.9063e-05, -1.401958, 0.8117647, 1, 0, 1,
-0.8322256, -1.539666, -1.368636, 0.8078431, 1, 0, 1,
-0.8307788, -0.5897036, 0.3809244, 0.8, 1, 0, 1,
-0.8256291, 0.2426267, -0.8763576, 0.7921569, 1, 0, 1,
-0.8238184, -0.03838693, -0.3731991, 0.7882353, 1, 0, 1,
-0.8178539, -0.07079906, -0.896433, 0.7803922, 1, 0, 1,
-0.814012, 0.2643487, -1.062948, 0.7764706, 1, 0, 1,
-0.8093439, 1.053725, -1.33595, 0.7686275, 1, 0, 1,
-0.801344, 0.3911178, -1.331166, 0.7647059, 1, 0, 1,
-0.8003717, 1.032155, -0.8837741, 0.7568628, 1, 0, 1,
-0.7971335, 1.193986, 0.07568116, 0.7529412, 1, 0, 1,
-0.7879689, 0.7613463, -0.9098437, 0.7450981, 1, 0, 1,
-0.7853829, -0.7609121, -2.131935, 0.7411765, 1, 0, 1,
-0.7843539, -0.8042196, -2.755303, 0.7333333, 1, 0, 1,
-0.7761564, 0.5959681, 0.009235051, 0.7294118, 1, 0, 1,
-0.7708974, 0.3681943, -1.532434, 0.7215686, 1, 0, 1,
-0.7697108, -1.433456, -2.495454, 0.7176471, 1, 0, 1,
-0.7646543, 0.01748489, -0.674441, 0.7098039, 1, 0, 1,
-0.7606069, -0.9080517, -2.543769, 0.7058824, 1, 0, 1,
-0.7394595, 0.2120143, -1.733794, 0.6980392, 1, 0, 1,
-0.7393281, 0.8948027, -0.3106426, 0.6901961, 1, 0, 1,
-0.7376808, -0.9083498, -4.728964, 0.6862745, 1, 0, 1,
-0.7370951, -0.0802082, -2.898229, 0.6784314, 1, 0, 1,
-0.7367504, -0.3784485, -1.730555, 0.6745098, 1, 0, 1,
-0.734406, 2.204244, 1.793919, 0.6666667, 1, 0, 1,
-0.7341815, -0.1570981, -2.080821, 0.6627451, 1, 0, 1,
-0.7330279, 0.4055601, -1.443503, 0.654902, 1, 0, 1,
-0.7319213, -2.087474, -3.45609, 0.6509804, 1, 0, 1,
-0.7307478, 1.299508, -2.010149, 0.6431373, 1, 0, 1,
-0.7273958, 0.2687318, -1.407843, 0.6392157, 1, 0, 1,
-0.7227446, -1.825805, -3.597507, 0.6313726, 1, 0, 1,
-0.7224503, 2.062723, -1.117898, 0.627451, 1, 0, 1,
-0.7152862, 0.4837498, -2.608694, 0.6196079, 1, 0, 1,
-0.7148459, 0.156435, -2.133471, 0.6156863, 1, 0, 1,
-0.7146508, 1.317929, -0.4134567, 0.6078432, 1, 0, 1,
-0.7128422, -1.601718, -3.267405, 0.6039216, 1, 0, 1,
-0.7110833, 1.328882, -1.123296, 0.5960785, 1, 0, 1,
-0.7107029, -1.732741, -2.977733, 0.5882353, 1, 0, 1,
-0.7075831, -0.9991146, -2.173655, 0.5843138, 1, 0, 1,
-0.7042937, 1.039033, 1.122238, 0.5764706, 1, 0, 1,
-0.6987707, -0.7745194, -3.743967, 0.572549, 1, 0, 1,
-0.6976321, -1.229069, -3.549417, 0.5647059, 1, 0, 1,
-0.6949254, -0.4584726, -0.73027, 0.5607843, 1, 0, 1,
-0.6914822, 0.9390396, -0.122201, 0.5529412, 1, 0, 1,
-0.6904198, 1.255585, -1.344603, 0.5490196, 1, 0, 1,
-0.6890576, 0.2622085, -1.332535, 0.5411765, 1, 0, 1,
-0.6888686, -0.05045516, -1.795947, 0.5372549, 1, 0, 1,
-0.6864095, -0.08386852, -1.567701, 0.5294118, 1, 0, 1,
-0.6839613, 0.4410457, -0.1604767, 0.5254902, 1, 0, 1,
-0.6799233, 0.4656251, -0.4106225, 0.5176471, 1, 0, 1,
-0.6730999, -0.3652648, -1.742047, 0.5137255, 1, 0, 1,
-0.6717322, 0.267016, -0.374035, 0.5058824, 1, 0, 1,
-0.6715175, 0.3361626, -1.368147, 0.5019608, 1, 0, 1,
-0.6702106, -0.3699508, -1.26407, 0.4941176, 1, 0, 1,
-0.6677438, 0.4867246, -0.2394552, 0.4862745, 1, 0, 1,
-0.667476, 1.235209, -0.1531324, 0.4823529, 1, 0, 1,
-0.6662825, 0.04859279, -2.063075, 0.4745098, 1, 0, 1,
-0.6640602, 0.5625337, -1.453289, 0.4705882, 1, 0, 1,
-0.6634109, 1.336603, -1.264844, 0.4627451, 1, 0, 1,
-0.6519938, 0.5326011, -0.9236427, 0.4588235, 1, 0, 1,
-0.6506796, 1.197828, -0.6475629, 0.4509804, 1, 0, 1,
-0.6478466, 1.149913, -0.09541199, 0.4470588, 1, 0, 1,
-0.6446179, -1.804184, -2.15155, 0.4392157, 1, 0, 1,
-0.6442332, 0.9071789, -0.6629289, 0.4352941, 1, 0, 1,
-0.6381141, -0.954192, -3.328668, 0.427451, 1, 0, 1,
-0.6363569, -0.3368939, -3.336561, 0.4235294, 1, 0, 1,
-0.6295884, -0.2517485, -0.9267712, 0.4156863, 1, 0, 1,
-0.6271443, -0.05914333, -1.925685, 0.4117647, 1, 0, 1,
-0.6258454, 2.211731, -0.2493596, 0.4039216, 1, 0, 1,
-0.625123, -1.798397, -4.355537, 0.3960784, 1, 0, 1,
-0.6235152, -0.5028223, -3.32069, 0.3921569, 1, 0, 1,
-0.6219498, 1.258366, -2.163223, 0.3843137, 1, 0, 1,
-0.6176422, -0.4580992, -2.943934, 0.3803922, 1, 0, 1,
-0.6125338, -0.1777715, -3.808892, 0.372549, 1, 0, 1,
-0.6063102, 0.5052273, -1.907989, 0.3686275, 1, 0, 1,
-0.6041483, 0.4199225, -0.5663869, 0.3607843, 1, 0, 1,
-0.6038154, 0.1202494, 1.143973, 0.3568628, 1, 0, 1,
-0.6025636, -0.3761466, -2.737963, 0.3490196, 1, 0, 1,
-0.6023342, -0.3196054, -1.091424, 0.345098, 1, 0, 1,
-0.6007946, -0.5325878, -2.524869, 0.3372549, 1, 0, 1,
-0.5941728, -0.1721254, -1.234526, 0.3333333, 1, 0, 1,
-0.5893292, -0.4714526, -2.237366, 0.3254902, 1, 0, 1,
-0.5865082, 1.71649, -1.599028, 0.3215686, 1, 0, 1,
-0.5834602, -0.1336239, -1.466398, 0.3137255, 1, 0, 1,
-0.5827814, 0.8677154, -0.2248102, 0.3098039, 1, 0, 1,
-0.5762579, 1.942826, -1.30571, 0.3019608, 1, 0, 1,
-0.5760895, -1.283059, -4.973052, 0.2941177, 1, 0, 1,
-0.5694387, 0.456788, -2.120279, 0.2901961, 1, 0, 1,
-0.5683647, -0.1921386, -2.858429, 0.282353, 1, 0, 1,
-0.5678521, -1.053745, -2.217147, 0.2784314, 1, 0, 1,
-0.5668, 0.4318714, 0.1061894, 0.2705882, 1, 0, 1,
-0.5606187, 1.151185, 1.105925, 0.2666667, 1, 0, 1,
-0.5584984, -0.0426189, -1.876565, 0.2588235, 1, 0, 1,
-0.5520985, 2.199387, 0.5916858, 0.254902, 1, 0, 1,
-0.551993, -0.1793659, -1.382395, 0.2470588, 1, 0, 1,
-0.5471027, 1.949813, -0.8158611, 0.2431373, 1, 0, 1,
-0.5455863, 2.457107, -0.0402562, 0.2352941, 1, 0, 1,
-0.545569, 0.2066121, -0.5886435, 0.2313726, 1, 0, 1,
-0.5436299, 1.078094, -0.7856811, 0.2235294, 1, 0, 1,
-0.5411167, -0.5132181, -1.049419, 0.2196078, 1, 0, 1,
-0.538132, -0.3196468, -2.06133, 0.2117647, 1, 0, 1,
-0.5357023, 1.610084, 2.134197, 0.2078431, 1, 0, 1,
-0.533904, 0.8844764, -1.535262, 0.2, 1, 0, 1,
-0.5210668, 0.2589714, 0.02305189, 0.1921569, 1, 0, 1,
-0.5166341, 0.3262964, -2.154476, 0.1882353, 1, 0, 1,
-0.5166125, 0.3309322, -2.075098, 0.1803922, 1, 0, 1,
-0.5130339, 0.1894107, -0.2066451, 0.1764706, 1, 0, 1,
-0.5117845, -1.300037, -2.278601, 0.1686275, 1, 0, 1,
-0.51135, -1.711307, -2.086353, 0.1647059, 1, 0, 1,
-0.5050297, 1.380289, -0.21809, 0.1568628, 1, 0, 1,
-0.5029979, -1.129151, -2.306827, 0.1529412, 1, 0, 1,
-0.4997111, 0.5098029, -0.7308637, 0.145098, 1, 0, 1,
-0.4985584, 0.2901808, -0.3573324, 0.1411765, 1, 0, 1,
-0.4961998, 0.7510006, -0.3047674, 0.1333333, 1, 0, 1,
-0.4955549, 0.3632303, -1.641748, 0.1294118, 1, 0, 1,
-0.4954544, -0.4342816, -3.879146, 0.1215686, 1, 0, 1,
-0.4905655, -0.3007521, -2.858204, 0.1176471, 1, 0, 1,
-0.4904278, -0.2566665, -0.9401137, 0.1098039, 1, 0, 1,
-0.4896532, 1.078765, -1.39869, 0.1058824, 1, 0, 1,
-0.481388, -3.180793, -3.991839, 0.09803922, 1, 0, 1,
-0.4800345, 1.350361, 0.04832944, 0.09019608, 1, 0, 1,
-0.4773023, 0.02469641, 0.2021494, 0.08627451, 1, 0, 1,
-0.4747883, -0.155551, -0.8085755, 0.07843138, 1, 0, 1,
-0.4745019, 0.969553, -1.164737, 0.07450981, 1, 0, 1,
-0.4740724, 0.3659167, -1.153859, 0.06666667, 1, 0, 1,
-0.4739182, 0.03474618, -0.8343071, 0.0627451, 1, 0, 1,
-0.47068, -1.860192, -1.296589, 0.05490196, 1, 0, 1,
-0.4663643, 0.3079872, -1.150387, 0.05098039, 1, 0, 1,
-0.4658898, 2.091343, -1.196813, 0.04313726, 1, 0, 1,
-0.4608706, -0.8801933, -3.788435, 0.03921569, 1, 0, 1,
-0.4556691, -0.08529773, -1.736784, 0.03137255, 1, 0, 1,
-0.4349227, -0.6895032, -2.828969, 0.02745098, 1, 0, 1,
-0.4267939, -1.995037, -2.79786, 0.01960784, 1, 0, 1,
-0.4225026, -1.492422, -3.394928, 0.01568628, 1, 0, 1,
-0.4198192, 0.1326269, -2.110968, 0.007843138, 1, 0, 1,
-0.3974819, -0.4756405, -3.749651, 0.003921569, 1, 0, 1,
-0.3970944, 1.008688, -1.026944, 0, 1, 0.003921569, 1,
-0.3968618, 0.4787272, -0.6345128, 0, 1, 0.01176471, 1,
-0.3961345, -0.01484378, -4.448806, 0, 1, 0.01568628, 1,
-0.3957022, -0.4302571, -0.8405613, 0, 1, 0.02352941, 1,
-0.3934485, -0.2141326, -3.001377, 0, 1, 0.02745098, 1,
-0.3930996, 0.3534697, -2.13558, 0, 1, 0.03529412, 1,
-0.3912976, 1.065171, -1.998215, 0, 1, 0.03921569, 1,
-0.3900689, 0.1033114, -0.9369093, 0, 1, 0.04705882, 1,
-0.3870222, -0.4333236, -2.225004, 0, 1, 0.05098039, 1,
-0.3866459, 0.002371076, -1.585595, 0, 1, 0.05882353, 1,
-0.3830805, -0.8670195, -1.801354, 0, 1, 0.0627451, 1,
-0.3820205, -0.6394132, -2.310665, 0, 1, 0.07058824, 1,
-0.3770386, 0.8249236, -0.8832385, 0, 1, 0.07450981, 1,
-0.3723935, 0.1867288, -2.163924, 0, 1, 0.08235294, 1,
-0.3673426, -0.05897234, -0.6237781, 0, 1, 0.08627451, 1,
-0.3627004, 1.13792, -3.490396, 0, 1, 0.09411765, 1,
-0.3606593, 1.331383, -1.533787, 0, 1, 0.1019608, 1,
-0.358526, 0.1209792, -4.47906, 0, 1, 0.1058824, 1,
-0.3574238, 0.3902242, 0.791265, 0, 1, 0.1137255, 1,
-0.3547077, 1.725403, 2.198137, 0, 1, 0.1176471, 1,
-0.3525315, -2.355457, -3.138123, 0, 1, 0.1254902, 1,
-0.3523382, -0.2494883, -1.793847, 0, 1, 0.1294118, 1,
-0.3495982, 1.231949, 0.5317988, 0, 1, 0.1372549, 1,
-0.3467518, 0.4205152, 0.6466126, 0, 1, 0.1411765, 1,
-0.3411026, -0.06051095, -2.604409, 0, 1, 0.1490196, 1,
-0.3385365, -0.6671051, -5.111842, 0, 1, 0.1529412, 1,
-0.3366118, -1.476577, -3.55221, 0, 1, 0.1607843, 1,
-0.3335224, -0.5297847, -2.381299, 0, 1, 0.1647059, 1,
-0.3295561, -0.04665246, -2.82436, 0, 1, 0.172549, 1,
-0.3207285, 0.08285997, -3.22222, 0, 1, 0.1764706, 1,
-0.3203027, 0.5208427, -1.235222, 0, 1, 0.1843137, 1,
-0.3197613, -0.08283336, -1.36696, 0, 1, 0.1882353, 1,
-0.3179449, -2.654387, -2.55998, 0, 1, 0.1960784, 1,
-0.3168793, -0.3819948, -1.492228, 0, 1, 0.2039216, 1,
-0.3145851, 0.7103342, -1.069714, 0, 1, 0.2078431, 1,
-0.3140582, -0.3806528, -2.24728, 0, 1, 0.2156863, 1,
-0.311981, 1.362754, 0.1124367, 0, 1, 0.2196078, 1,
-0.3098085, -0.1632759, -2.200589, 0, 1, 0.227451, 1,
-0.305476, 2.809938, -0.5192416, 0, 1, 0.2313726, 1,
-0.3053404, -0.06623445, -2.653027, 0, 1, 0.2392157, 1,
-0.3033498, -0.0572053, 0.3524306, 0, 1, 0.2431373, 1,
-0.2963866, 0.2152254, -1.027334, 0, 1, 0.2509804, 1,
-0.2906443, -0.08409839, -1.621183, 0, 1, 0.254902, 1,
-0.2895584, -0.3123747, -3.505263, 0, 1, 0.2627451, 1,
-0.2845728, -0.7250994, -3.878363, 0, 1, 0.2666667, 1,
-0.281895, -0.2988382, -3.400542, 0, 1, 0.2745098, 1,
-0.2791958, -0.1773097, -0.7813911, 0, 1, 0.2784314, 1,
-0.278182, 1.365968, -0.2561597, 0, 1, 0.2862745, 1,
-0.2764144, 0.5580325, -1.064927, 0, 1, 0.2901961, 1,
-0.2719958, 0.6638787, -1.663251, 0, 1, 0.2980392, 1,
-0.2717587, -1.151637, -3.202916, 0, 1, 0.3058824, 1,
-0.2691011, 0.1412442, -2.325801, 0, 1, 0.3098039, 1,
-0.265027, -1.342235, 0.004431752, 0, 1, 0.3176471, 1,
-0.2589517, -0.06208023, -1.407369, 0, 1, 0.3215686, 1,
-0.2549832, 0.4752606, -1.687931, 0, 1, 0.3294118, 1,
-0.2468251, -0.9035491, -3.443385, 0, 1, 0.3333333, 1,
-0.2431362, 0.6534217, 0.850853, 0, 1, 0.3411765, 1,
-0.2425824, 0.3650402, -0.6512656, 0, 1, 0.345098, 1,
-0.2358042, -0.9345657, -3.019336, 0, 1, 0.3529412, 1,
-0.2325568, 1.957544, -0.5458916, 0, 1, 0.3568628, 1,
-0.2311048, -1.294778, -2.87635, 0, 1, 0.3647059, 1,
-0.2283635, -0.202364, -2.115911, 0, 1, 0.3686275, 1,
-0.2243042, -1.081438, -3.867145, 0, 1, 0.3764706, 1,
-0.2242115, -0.1025946, -2.618704, 0, 1, 0.3803922, 1,
-0.2188335, -0.7664986, -0.7767073, 0, 1, 0.3882353, 1,
-0.215349, 0.5337889, -1.607971, 0, 1, 0.3921569, 1,
-0.2112397, 0.2540751, -1.441421, 0, 1, 0.4, 1,
-0.2093459, -0.01540335, -2.207624, 0, 1, 0.4078431, 1,
-0.207257, 0.839795, 0.138791, 0, 1, 0.4117647, 1,
-0.2060955, -1.294572, -1.817802, 0, 1, 0.4196078, 1,
-0.2054311, 1.022799, -1.019693, 0, 1, 0.4235294, 1,
-0.2046259, -1.311796, -2.656379, 0, 1, 0.4313726, 1,
-0.2009947, 0.8549026, -1.445253, 0, 1, 0.4352941, 1,
-0.1997383, -1.718781, -2.662227, 0, 1, 0.4431373, 1,
-0.199047, -0.9471616, -5.266203, 0, 1, 0.4470588, 1,
-0.1977164, 1.09526, 0.2311157, 0, 1, 0.454902, 1,
-0.1928158, 0.4651669, -0.6009721, 0, 1, 0.4588235, 1,
-0.191573, -0.6812582, -4.566572, 0, 1, 0.4666667, 1,
-0.1871263, -0.1967046, -1.886101, 0, 1, 0.4705882, 1,
-0.1843934, 0.2029095, -0.498602, 0, 1, 0.4784314, 1,
-0.1841202, 0.04918706, -1.14087, 0, 1, 0.4823529, 1,
-0.1829145, -0.05125855, -1.378375, 0, 1, 0.4901961, 1,
-0.1810379, 0.6101074, -0.3067544, 0, 1, 0.4941176, 1,
-0.177524, -0.1531222, -2.061694, 0, 1, 0.5019608, 1,
-0.1759747, 1.48221, -0.3764131, 0, 1, 0.509804, 1,
-0.1742286, 0.2595195, -0.9188524, 0, 1, 0.5137255, 1,
-0.1710206, 0.3050242, -2.003132, 0, 1, 0.5215687, 1,
-0.1662357, -0.1819234, -3.959406, 0, 1, 0.5254902, 1,
-0.1647538, 1.055254, -0.6474466, 0, 1, 0.5333334, 1,
-0.1604628, -1.843837, -2.873963, 0, 1, 0.5372549, 1,
-0.1590337, 0.8475249, -0.8343117, 0, 1, 0.5450981, 1,
-0.1578471, -1.335915, -2.273068, 0, 1, 0.5490196, 1,
-0.1566847, 2.352391, 0.7441565, 0, 1, 0.5568628, 1,
-0.1534341, 1.141657, -0.8373352, 0, 1, 0.5607843, 1,
-0.1531464, -2.18787, -2.783897, 0, 1, 0.5686275, 1,
-0.1529757, 0.9914282, 0.6266797, 0, 1, 0.572549, 1,
-0.1515386, 0.02589538, -2.941412, 0, 1, 0.5803922, 1,
-0.1509046, -0.242194, -5.357313, 0, 1, 0.5843138, 1,
-0.14821, -0.2739941, -4.764544, 0, 1, 0.5921569, 1,
-0.1446704, -2.080453, -4.256353, 0, 1, 0.5960785, 1,
-0.1444549, 0.5605949, 0.6963742, 0, 1, 0.6039216, 1,
-0.1428142, 1.222707, 0.3918157, 0, 1, 0.6117647, 1,
-0.1418019, 0.7289796, 0.7611543, 0, 1, 0.6156863, 1,
-0.140876, 0.05196817, 0.298871, 0, 1, 0.6235294, 1,
-0.1399694, 1.53634, 1.333842, 0, 1, 0.627451, 1,
-0.1389405, -0.4676403, -2.727087, 0, 1, 0.6352941, 1,
-0.1348725, -1.460896, -3.210591, 0, 1, 0.6392157, 1,
-0.1339994, 0.8748801, 0.5610649, 0, 1, 0.6470588, 1,
-0.1337846, 0.05856016, -2.979627, 0, 1, 0.6509804, 1,
-0.1303603, 2.229666, 0.999195, 0, 1, 0.6588235, 1,
-0.1271823, 0.4484818, -1.268232, 0, 1, 0.6627451, 1,
-0.1243907, 0.4297266, 0.5115921, 0, 1, 0.6705883, 1,
-0.1228664, 2.587041, -0.02622786, 0, 1, 0.6745098, 1,
-0.1211997, -0.8142028, -1.520423, 0, 1, 0.682353, 1,
-0.1202491, 0.4649699, 1.350259, 0, 1, 0.6862745, 1,
-0.1202348, -0.4596728, -2.268327, 0, 1, 0.6941177, 1,
-0.1147762, -0.415522, -2.938364, 0, 1, 0.7019608, 1,
-0.1121778, 1.366097, -1.968528, 0, 1, 0.7058824, 1,
-0.1070848, 0.01253946, -3.172302, 0, 1, 0.7137255, 1,
-0.1067358, -0.535076, -2.251921, 0, 1, 0.7176471, 1,
-0.1065095, -0.7068044, -3.934149, 0, 1, 0.7254902, 1,
-0.09916302, -0.9181008, -4.420184, 0, 1, 0.7294118, 1,
-0.09805431, 0.6054742, 0.7200778, 0, 1, 0.7372549, 1,
-0.09628423, -0.1463354, -2.162886, 0, 1, 0.7411765, 1,
-0.0960267, -0.9571027, -2.609833, 0, 1, 0.7490196, 1,
-0.08663453, -0.9872521, -3.659549, 0, 1, 0.7529412, 1,
-0.08085804, 0.99954, 1.361342, 0, 1, 0.7607843, 1,
-0.07962167, -0.1250251, -2.096497, 0, 1, 0.7647059, 1,
-0.07163567, -1.484837, -3.020826, 0, 1, 0.772549, 1,
-0.07063982, 0.3777889, -0.29036, 0, 1, 0.7764706, 1,
-0.06875263, 1.401721, -0.6532761, 0, 1, 0.7843137, 1,
-0.06830399, 0.4971191, 1.966284, 0, 1, 0.7882353, 1,
-0.06700543, -0.8340528, -3.540267, 0, 1, 0.7960784, 1,
-0.06370943, -0.2704465, -2.364227, 0, 1, 0.8039216, 1,
-0.05751198, -1.372211, -2.352289, 0, 1, 0.8078431, 1,
-0.05622705, -1.145831, -3.69649, 0, 1, 0.8156863, 1,
-0.05533262, -1.063915, -4.68253, 0, 1, 0.8196079, 1,
-0.05086884, -0.6796899, -2.867534, 0, 1, 0.827451, 1,
-0.04114017, -1.062068, -4.722161, 0, 1, 0.8313726, 1,
-0.04075328, -0.3209663, -1.779677, 0, 1, 0.8392157, 1,
-0.03794433, 0.6478617, 0.5784991, 0, 1, 0.8431373, 1,
-0.0378596, -0.2432755, -3.01747, 0, 1, 0.8509804, 1,
-0.02839468, 0.4180665, 0.8743688, 0, 1, 0.854902, 1,
-0.02707404, -0.9511436, -2.222211, 0, 1, 0.8627451, 1,
-0.02249785, -0.8135021, -2.685628, 0, 1, 0.8666667, 1,
-0.02129239, 0.3424699, -1.829287, 0, 1, 0.8745098, 1,
-0.01909151, -1.72938, -3.232678, 0, 1, 0.8784314, 1,
-0.01635413, 0.5789736, -0.4176146, 0, 1, 0.8862745, 1,
-0.0156752, -0.770318, -4.681398, 0, 1, 0.8901961, 1,
-0.003964923, 0.6495924, -1.342513, 0, 1, 0.8980392, 1,
-0.001117976, -0.4232743, -1.618094, 0, 1, 0.9058824, 1,
0.001557004, -0.8788057, 4.157924, 0, 1, 0.9098039, 1,
0.003462768, 0.7210193, -2.109274, 0, 1, 0.9176471, 1,
0.007357951, 0.252517, 0.7727124, 0, 1, 0.9215686, 1,
0.008469909, -0.2448774, 3.130392, 0, 1, 0.9294118, 1,
0.009639664, 0.08066097, -0.3185213, 0, 1, 0.9333333, 1,
0.01028097, 0.7423608, 0.001357534, 0, 1, 0.9411765, 1,
0.01083202, 0.2076629, -2.301367, 0, 1, 0.945098, 1,
0.01886504, 0.3346212, 1.65359, 0, 1, 0.9529412, 1,
0.01958749, -0.4341422, 5.743901, 0, 1, 0.9568627, 1,
0.02957156, -0.9716079, 2.60831, 0, 1, 0.9647059, 1,
0.03253677, -0.2638738, 2.963531, 0, 1, 0.9686275, 1,
0.03265015, -1.706517, 3.349324, 0, 1, 0.9764706, 1,
0.03469435, 1.093801, 0.6346024, 0, 1, 0.9803922, 1,
0.03591248, -0.3497931, 3.998528, 0, 1, 0.9882353, 1,
0.03726273, -0.6184376, 3.365888, 0, 1, 0.9921569, 1,
0.03769345, -0.8826621, 4.875785, 0, 1, 1, 1,
0.04513475, -1.020533, 4.370832, 0, 0.9921569, 1, 1,
0.04588597, -0.406628, 2.388929, 0, 0.9882353, 1, 1,
0.04919631, 0.6418718, -1.268109, 0, 0.9803922, 1, 1,
0.05094797, 1.136673, -0.1746791, 0, 0.9764706, 1, 1,
0.05518488, 3.084466, 0.3055775, 0, 0.9686275, 1, 1,
0.05997919, -0.6645185, 3.431457, 0, 0.9647059, 1, 1,
0.06126133, -0.6633649, 3.956655, 0, 0.9568627, 1, 1,
0.06139471, -0.2905627, 3.870578, 0, 0.9529412, 1, 1,
0.06143972, 0.08607758, -0.5296999, 0, 0.945098, 1, 1,
0.06439757, 0.5960079, 0.4116526, 0, 0.9411765, 1, 1,
0.06563622, 0.2725478, 0.2172921, 0, 0.9333333, 1, 1,
0.07103119, -0.005916797, 2.915532, 0, 0.9294118, 1, 1,
0.07202335, 0.035912, 1.321436, 0, 0.9215686, 1, 1,
0.07293291, -1.175817, 2.597904, 0, 0.9176471, 1, 1,
0.07295626, -1.325871, 2.802662, 0, 0.9098039, 1, 1,
0.07332098, 0.9544172, 0.740059, 0, 0.9058824, 1, 1,
0.07649495, -0.09472311, 3.645867, 0, 0.8980392, 1, 1,
0.07883964, 1.371844, -0.3644332, 0, 0.8901961, 1, 1,
0.08251545, -0.8375185, 2.887811, 0, 0.8862745, 1, 1,
0.08378956, 0.3112355, 0.4790053, 0, 0.8784314, 1, 1,
0.08756052, 1.200342, -0.01900715, 0, 0.8745098, 1, 1,
0.09611651, 2.642026, 0.540612, 0, 0.8666667, 1, 1,
0.1002431, 1.601245, 0.3335813, 0, 0.8627451, 1, 1,
0.1106201, -0.7465723, 3.115892, 0, 0.854902, 1, 1,
0.1132583, 1.099926, 1.636922, 0, 0.8509804, 1, 1,
0.1134397, -1.0732, 4.221888, 0, 0.8431373, 1, 1,
0.1157532, 0.8887159, -0.2484993, 0, 0.8392157, 1, 1,
0.1199166, 0.4126282, 2.315671, 0, 0.8313726, 1, 1,
0.124323, -0.8987133, 3.81838, 0, 0.827451, 1, 1,
0.1304164, 0.976419, -0.993724, 0, 0.8196079, 1, 1,
0.1306093, -0.8783519, 1.418057, 0, 0.8156863, 1, 1,
0.1308314, -0.5029926, 3.138388, 0, 0.8078431, 1, 1,
0.1341411, 1.245071, 0.1484491, 0, 0.8039216, 1, 1,
0.1388646, 1.277735, 0.1658613, 0, 0.7960784, 1, 1,
0.1397185, -0.3589275, 3.014247, 0, 0.7882353, 1, 1,
0.1431201, -1.511385, 3.143836, 0, 0.7843137, 1, 1,
0.1464045, -1.605342, 4.193041, 0, 0.7764706, 1, 1,
0.1478014, 0.7636251, -0.5317239, 0, 0.772549, 1, 1,
0.1530516, -1.459948, 2.274615, 0, 0.7647059, 1, 1,
0.1540107, -0.7554957, 2.258643, 0, 0.7607843, 1, 1,
0.1540722, -0.6884248, 2.719088, 0, 0.7529412, 1, 1,
0.159942, -1.005404, 2.791844, 0, 0.7490196, 1, 1,
0.1608265, -1.20163, 3.469265, 0, 0.7411765, 1, 1,
0.1631258, -1.103941, 4.037104, 0, 0.7372549, 1, 1,
0.1645357, 0.8499854, 0.8149491, 0, 0.7294118, 1, 1,
0.1730272, -0.1372953, 0.9892269, 0, 0.7254902, 1, 1,
0.1739767, 1.145839, 1.620662, 0, 0.7176471, 1, 1,
0.1743064, 0.2797917, 2.094034, 0, 0.7137255, 1, 1,
0.1752043, 0.06649988, 2.443192, 0, 0.7058824, 1, 1,
0.1777278, -0.1143694, 2.993905, 0, 0.6980392, 1, 1,
0.1796697, -0.8423205, 2.760034, 0, 0.6941177, 1, 1,
0.1822814, 0.2814509, 2.021252, 0, 0.6862745, 1, 1,
0.1836012, -0.3125152, 3.041828, 0, 0.682353, 1, 1,
0.1844794, -0.2039598, 0.3091907, 0, 0.6745098, 1, 1,
0.189201, 1.056454, 0.4086925, 0, 0.6705883, 1, 1,
0.1898988, 0.3625644, 0.7046129, 0, 0.6627451, 1, 1,
0.1924316, 0.4458831, -0.08854183, 0, 0.6588235, 1, 1,
0.1930563, -0.2927701, 4.596641, 0, 0.6509804, 1, 1,
0.19402, -0.3029936, 3.600657, 0, 0.6470588, 1, 1,
0.1945533, 1.035779, -1.757002, 0, 0.6392157, 1, 1,
0.1988939, -0.8481005, 3.702833, 0, 0.6352941, 1, 1,
0.2004955, -1.171079, 2.898537, 0, 0.627451, 1, 1,
0.205258, -0.2917957, 1.14641, 0, 0.6235294, 1, 1,
0.2061233, 1.631112, -1.338544, 0, 0.6156863, 1, 1,
0.2070671, 1.62134, -0.5666907, 0, 0.6117647, 1, 1,
0.2107769, 1.240731, 2.149645, 0, 0.6039216, 1, 1,
0.2113784, 1.217687, -1.311366, 0, 0.5960785, 1, 1,
0.2181911, 0.6763577, -0.9043949, 0, 0.5921569, 1, 1,
0.218293, 1.17549, 1.068233, 0, 0.5843138, 1, 1,
0.2249343, -0.8670008, 0.4919294, 0, 0.5803922, 1, 1,
0.2259599, 0.9929184, 2.044987, 0, 0.572549, 1, 1,
0.231057, 0.3332367, 0.8300272, 0, 0.5686275, 1, 1,
0.2314081, 0.1035915, 2.662088, 0, 0.5607843, 1, 1,
0.2337323, -0.4369502, 2.552991, 0, 0.5568628, 1, 1,
0.2343246, 0.764469, -1.008, 0, 0.5490196, 1, 1,
0.2352302, -0.07049913, 2.385602, 0, 0.5450981, 1, 1,
0.2362442, 0.8972614, 0.5808369, 0, 0.5372549, 1, 1,
0.2392048, 0.3398358, 1.365657, 0, 0.5333334, 1, 1,
0.2403993, 0.5296793, -0.06594258, 0, 0.5254902, 1, 1,
0.2460625, -0.8784241, 4.170872, 0, 0.5215687, 1, 1,
0.2463496, 0.4647794, 1.18119, 0, 0.5137255, 1, 1,
0.250986, -1.000372, 2.678785, 0, 0.509804, 1, 1,
0.2516541, -3.052893, 3.279011, 0, 0.5019608, 1, 1,
0.2547338, 0.6069067, 1.963406, 0, 0.4941176, 1, 1,
0.2562336, -0.7104369, 3.990171, 0, 0.4901961, 1, 1,
0.258491, 0.2646847, 1.543398, 0, 0.4823529, 1, 1,
0.2591291, 0.698401, 1.756304, 0, 0.4784314, 1, 1,
0.2592478, -0.07815827, 2.909289, 0, 0.4705882, 1, 1,
0.2625729, -0.4177921, 4.671291, 0, 0.4666667, 1, 1,
0.263084, -0.05258745, -0.2929236, 0, 0.4588235, 1, 1,
0.2660497, 0.4357915, -0.1980633, 0, 0.454902, 1, 1,
0.268663, -1.537251, 3.501611, 0, 0.4470588, 1, 1,
0.2686705, 0.5150341, -1.791845, 0, 0.4431373, 1, 1,
0.2694972, -1.035011, 5.083941, 0, 0.4352941, 1, 1,
0.273421, 0.8980528, 0.7440093, 0, 0.4313726, 1, 1,
0.2759193, 0.09711677, 1.34582, 0, 0.4235294, 1, 1,
0.2832577, 1.344863, -0.1141831, 0, 0.4196078, 1, 1,
0.2850692, -0.3618105, 4.204855, 0, 0.4117647, 1, 1,
0.2881151, -1.33416, 2.477846, 0, 0.4078431, 1, 1,
0.2912661, -0.2773033, 0.4521075, 0, 0.4, 1, 1,
0.2952852, 1.117591, -0.2785951, 0, 0.3921569, 1, 1,
0.295695, 1.354519, -1.395182, 0, 0.3882353, 1, 1,
0.2976626, -1.658519, 2.322011, 0, 0.3803922, 1, 1,
0.2979652, -1.249942, 1.446312, 0, 0.3764706, 1, 1,
0.2986596, -0.5457587, 2.857536, 0, 0.3686275, 1, 1,
0.3027416, 0.2856408, 0.5724294, 0, 0.3647059, 1, 1,
0.3040021, 0.08265744, 2.076444, 0, 0.3568628, 1, 1,
0.3103966, 0.7274271, 1.8908, 0, 0.3529412, 1, 1,
0.3112313, 0.4624188, 0.9442645, 0, 0.345098, 1, 1,
0.3194188, -0.6265569, 4.730201, 0, 0.3411765, 1, 1,
0.3200432, -0.5568529, 2.966991, 0, 0.3333333, 1, 1,
0.3202243, -0.6378125, 0.6453156, 0, 0.3294118, 1, 1,
0.3228086, 0.8257468, 0.7457674, 0, 0.3215686, 1, 1,
0.3244605, 1.347821, 1.385141, 0, 0.3176471, 1, 1,
0.3273865, 0.2840765, 0.5339997, 0, 0.3098039, 1, 1,
0.3298413, 0.857366, 0.9612331, 0, 0.3058824, 1, 1,
0.330494, 0.6529862, 1.038392, 0, 0.2980392, 1, 1,
0.3315789, 0.2415686, 0.2337417, 0, 0.2901961, 1, 1,
0.3322881, -0.509986, 2.532335, 0, 0.2862745, 1, 1,
0.3333653, 1.084257, 0.09350281, 0, 0.2784314, 1, 1,
0.3351991, 0.5055646, -0.4054548, 0, 0.2745098, 1, 1,
0.3353042, -1.729645, 5.556588, 0, 0.2666667, 1, 1,
0.3365545, 0.7803186, -1.569721, 0, 0.2627451, 1, 1,
0.3419033, 0.4357705, 2.068781, 0, 0.254902, 1, 1,
0.344758, 0.2691518, 1.733726, 0, 0.2509804, 1, 1,
0.345761, 0.4809796, 0.2570223, 0, 0.2431373, 1, 1,
0.3478744, -1.455974, 3.09346, 0, 0.2392157, 1, 1,
0.3579505, -0.426189, 0.9277664, 0, 0.2313726, 1, 1,
0.3585329, 0.2568026, 1.863382, 0, 0.227451, 1, 1,
0.3587418, -0.856797, 1.543435, 0, 0.2196078, 1, 1,
0.3587501, -0.8506024, 3.747097, 0, 0.2156863, 1, 1,
0.3616554, 1.122997, -0.2829283, 0, 0.2078431, 1, 1,
0.3633957, 0.05158769, -0.4039564, 0, 0.2039216, 1, 1,
0.372676, -0.3989406, 2.751205, 0, 0.1960784, 1, 1,
0.3743522, 2.61956, 1.105683, 0, 0.1882353, 1, 1,
0.3773049, -0.8447856, 3.479294, 0, 0.1843137, 1, 1,
0.3774242, 0.4231037, 0.3377833, 0, 0.1764706, 1, 1,
0.3786621, 1.046728, 0.03429718, 0, 0.172549, 1, 1,
0.3810574, 0.8542508, 1.626698, 0, 0.1647059, 1, 1,
0.3858473, 0.09676902, 1.402748, 0, 0.1607843, 1, 1,
0.3882153, -0.260142, 3.156856, 0, 0.1529412, 1, 1,
0.389053, -1.593263, 3.202965, 0, 0.1490196, 1, 1,
0.3904974, -0.07069215, 1.574015, 0, 0.1411765, 1, 1,
0.3907786, 0.2189846, 1.552552, 0, 0.1372549, 1, 1,
0.3944123, -0.7523568, 1.433547, 0, 0.1294118, 1, 1,
0.3970524, -2.538491, 1.956432, 0, 0.1254902, 1, 1,
0.3976574, -0.4752921, 2.472028, 0, 0.1176471, 1, 1,
0.4025677, -0.4605513, 1.371798, 0, 0.1137255, 1, 1,
0.4054318, -1.377418, 3.491182, 0, 0.1058824, 1, 1,
0.4064735, -0.3378472, 2.611733, 0, 0.09803922, 1, 1,
0.4130032, 0.6268656, -0.6529816, 0, 0.09411765, 1, 1,
0.4159814, -2.473836, 3.880883, 0, 0.08627451, 1, 1,
0.4170939, -0.1938074, 1.640378, 0, 0.08235294, 1, 1,
0.4173993, 1.664302, 0.3418727, 0, 0.07450981, 1, 1,
0.4195769, 1.254425, 0.2135367, 0, 0.07058824, 1, 1,
0.4248459, 0.1855203, 0.8092713, 0, 0.0627451, 1, 1,
0.4259265, -0.3028187, 2.233075, 0, 0.05882353, 1, 1,
0.4267832, 1.52571, -0.9152223, 0, 0.05098039, 1, 1,
0.4320452, 0.8788916, 0.9342291, 0, 0.04705882, 1, 1,
0.4323068, -0.3581044, 3.669789, 0, 0.03921569, 1, 1,
0.4330103, 0.1272069, 0.7094635, 0, 0.03529412, 1, 1,
0.4353306, -0.7682106, 2.731286, 0, 0.02745098, 1, 1,
0.4391371, 0.2271272, 0.4129271, 0, 0.02352941, 1, 1,
0.4469273, 0.8226529, -0.1931679, 0, 0.01568628, 1, 1,
0.4479282, -1.116844, 2.593137, 0, 0.01176471, 1, 1,
0.4492049, -0.3531702, 2.529552, 0, 0.003921569, 1, 1,
0.4494565, 0.1805596, 1.832798, 0.003921569, 0, 1, 1,
0.449951, -0.4440702, 3.32843, 0.007843138, 0, 1, 1,
0.4525635, 1.012605, 0.6676813, 0.01568628, 0, 1, 1,
0.4533886, 0.1607153, 1.33168, 0.01960784, 0, 1, 1,
0.4580902, 1.391209, 1.315377, 0.02745098, 0, 1, 1,
0.461652, -1.152941, 3.224911, 0.03137255, 0, 1, 1,
0.4640256, -1.0861, 4.792147, 0.03921569, 0, 1, 1,
0.4652242, -1.871579, 2.257137, 0.04313726, 0, 1, 1,
0.4678988, -0.1190616, 1.800267, 0.05098039, 0, 1, 1,
0.4685283, -0.6194309, 2.329608, 0.05490196, 0, 1, 1,
0.4717323, -0.7266303, 2.202699, 0.0627451, 0, 1, 1,
0.4728802, -0.3466764, 1.252299, 0.06666667, 0, 1, 1,
0.4770055, -0.432427, 0.08157793, 0.07450981, 0, 1, 1,
0.478867, 0.8502598, 2.136821, 0.07843138, 0, 1, 1,
0.4849914, 1.465471, 2.08505, 0.08627451, 0, 1, 1,
0.4858449, 0.3285327, 1.0694, 0.09019608, 0, 1, 1,
0.4874378, -0.560877, 2.669181, 0.09803922, 0, 1, 1,
0.4892977, 0.2002357, 3.406323, 0.1058824, 0, 1, 1,
0.4894778, -0.8226148, 2.744469, 0.1098039, 0, 1, 1,
0.4902825, -0.3821037, 2.276157, 0.1176471, 0, 1, 1,
0.4908723, 0.5311431, 1.513965, 0.1215686, 0, 1, 1,
0.496018, 0.9405813, 0.7171733, 0.1294118, 0, 1, 1,
0.499546, 2.360398, 0.1868437, 0.1333333, 0, 1, 1,
0.5003683, 2.029674, -0.2153713, 0.1411765, 0, 1, 1,
0.5011705, 0.500342, 0.7258006, 0.145098, 0, 1, 1,
0.5027362, 2.499035, -1.230749, 0.1529412, 0, 1, 1,
0.5038746, 0.523805, 1.614595, 0.1568628, 0, 1, 1,
0.5082563, 0.922892, 0.6623701, 0.1647059, 0, 1, 1,
0.5106897, 1.462555, 1.511488, 0.1686275, 0, 1, 1,
0.5113361, -0.1626457, 2.402781, 0.1764706, 0, 1, 1,
0.5132533, -0.9020498, 2.895873, 0.1803922, 0, 1, 1,
0.5162519, 1.354049, -1.900507, 0.1882353, 0, 1, 1,
0.5164645, 0.3523554, 0.1075494, 0.1921569, 0, 1, 1,
0.5206675, -0.1298369, 0.577582, 0.2, 0, 1, 1,
0.5208345, 0.3430767, 0.9221398, 0.2078431, 0, 1, 1,
0.5219211, 0.2319889, 3.031953, 0.2117647, 0, 1, 1,
0.5230437, 0.1860279, 2.654627, 0.2196078, 0, 1, 1,
0.523137, -0.6005248, 0.1160428, 0.2235294, 0, 1, 1,
0.5254897, -0.3020813, 1.902807, 0.2313726, 0, 1, 1,
0.5257438, 0.9273489, 0.160746, 0.2352941, 0, 1, 1,
0.5315265, 0.7494983, 0.7177244, 0.2431373, 0, 1, 1,
0.5322217, -0.6331476, 3.991339, 0.2470588, 0, 1, 1,
0.532759, -0.5974373, 2.984308, 0.254902, 0, 1, 1,
0.5340146, 1.897502, 0.212774, 0.2588235, 0, 1, 1,
0.5395582, -2.070012, 1.296052, 0.2666667, 0, 1, 1,
0.5405923, 0.5202736, 0.6609784, 0.2705882, 0, 1, 1,
0.5458382, -0.8611628, 2.131297, 0.2784314, 0, 1, 1,
0.5481779, 0.2073765, 1.23459, 0.282353, 0, 1, 1,
0.5492414, 0.4061509, 0.8764236, 0.2901961, 0, 1, 1,
0.5514234, -0.6268366, 1.827778, 0.2941177, 0, 1, 1,
0.5524427, -2.148758, 2.818092, 0.3019608, 0, 1, 1,
0.5524444, -1.038486, 1.346773, 0.3098039, 0, 1, 1,
0.5545756, 0.1391287, 0.833635, 0.3137255, 0, 1, 1,
0.5557797, -0.2898513, 2.789304, 0.3215686, 0, 1, 1,
0.5569516, -1.2605, 3.019745, 0.3254902, 0, 1, 1,
0.5572792, 0.1036948, 2.830354, 0.3333333, 0, 1, 1,
0.5635945, 0.5461928, 0.2821928, 0.3372549, 0, 1, 1,
0.5780219, -0.2990898, 3.20452, 0.345098, 0, 1, 1,
0.5786185, 1.018204, 0.8248339, 0.3490196, 0, 1, 1,
0.5816263, -1.727892, 3.960873, 0.3568628, 0, 1, 1,
0.5816513, 0.6897805, 0.8649629, 0.3607843, 0, 1, 1,
0.5823529, 0.8245971, 0.5448157, 0.3686275, 0, 1, 1,
0.5846789, 0.7446014, 1.674222, 0.372549, 0, 1, 1,
0.5881932, -1.321104, 4.181427, 0.3803922, 0, 1, 1,
0.5964038, -1.126486, 2.400902, 0.3843137, 0, 1, 1,
0.5976883, -0.188108, 1.072692, 0.3921569, 0, 1, 1,
0.5979748, 0.7563443, -0.4998614, 0.3960784, 0, 1, 1,
0.5997675, 0.8724301, 1.885983, 0.4039216, 0, 1, 1,
0.6045765, -1.521749, 3.431157, 0.4117647, 0, 1, 1,
0.6061343, -0.8958784, 1.222347, 0.4156863, 0, 1, 1,
0.6088419, -1.211617, 3.150124, 0.4235294, 0, 1, 1,
0.6093385, -0.1768318, 3.027006, 0.427451, 0, 1, 1,
0.6098176, 0.03415655, 1.393531, 0.4352941, 0, 1, 1,
0.6179129, 0.01375157, 2.341104, 0.4392157, 0, 1, 1,
0.6201717, 1.947595, 0.5028337, 0.4470588, 0, 1, 1,
0.6212908, 1.899493, 0.1247831, 0.4509804, 0, 1, 1,
0.6301035, 0.8261847, 1.464833, 0.4588235, 0, 1, 1,
0.6309339, 0.4441496, 2.324409, 0.4627451, 0, 1, 1,
0.6344036, -1.316281, 3.361862, 0.4705882, 0, 1, 1,
0.6389422, -2.840514, 2.159549, 0.4745098, 0, 1, 1,
0.6399204, 0.6501969, 0.3391838, 0.4823529, 0, 1, 1,
0.6426131, -1.874436, 2.172686, 0.4862745, 0, 1, 1,
0.6459995, 0.6483161, 0.7645987, 0.4941176, 0, 1, 1,
0.6462712, 0.9854756, 0.4205588, 0.5019608, 0, 1, 1,
0.6474328, -0.4123555, 4.188808, 0.5058824, 0, 1, 1,
0.6477897, -0.8214867, 1.656168, 0.5137255, 0, 1, 1,
0.6531861, 0.7464558, 1.809578, 0.5176471, 0, 1, 1,
0.6536434, 0.6297481, -0.03650416, 0.5254902, 0, 1, 1,
0.655485, 1.385157, 0.5554752, 0.5294118, 0, 1, 1,
0.6592348, 0.4408683, 2.233263, 0.5372549, 0, 1, 1,
0.6664439, 0.7288456, 3.15147, 0.5411765, 0, 1, 1,
0.6698063, 0.6555744, 1.498154, 0.5490196, 0, 1, 1,
0.6721555, -0.6882252, 2.680881, 0.5529412, 0, 1, 1,
0.6754104, 1.283866, 0.1137393, 0.5607843, 0, 1, 1,
0.6791331, 0.3369703, 2.415684, 0.5647059, 0, 1, 1,
0.6825581, 0.385416, 0.7510018, 0.572549, 0, 1, 1,
0.6938432, 1.14799, 1.62843, 0.5764706, 0, 1, 1,
0.6947821, 0.3867139, 1.778676, 0.5843138, 0, 1, 1,
0.6983121, -1.28878, 3.790421, 0.5882353, 0, 1, 1,
0.7073326, 0.2168533, 0.1076273, 0.5960785, 0, 1, 1,
0.7109155, 1.507266, -0.6087009, 0.6039216, 0, 1, 1,
0.7114618, -0.8961844, 1.772012, 0.6078432, 0, 1, 1,
0.7133489, 0.1486042, -0.5718032, 0.6156863, 0, 1, 1,
0.7137401, 0.9020807, 0.02932819, 0.6196079, 0, 1, 1,
0.7210779, 0.1615469, 1.211224, 0.627451, 0, 1, 1,
0.7361056, 0.4172326, -0.7006585, 0.6313726, 0, 1, 1,
0.7382874, 0.4201845, 2.598397, 0.6392157, 0, 1, 1,
0.7493209, 0.6406237, -0.3991736, 0.6431373, 0, 1, 1,
0.7608393, -0.9109459, 1.481399, 0.6509804, 0, 1, 1,
0.7610905, 0.1448534, 2.633278, 0.654902, 0, 1, 1,
0.7622699, 1.271289, 1.371253, 0.6627451, 0, 1, 1,
0.7653946, 0.5160692, 0.6472164, 0.6666667, 0, 1, 1,
0.7666538, -1.490864, 2.632719, 0.6745098, 0, 1, 1,
0.7706978, -0.3094185, 3.737988, 0.6784314, 0, 1, 1,
0.7728797, -0.4104487, 1.073095, 0.6862745, 0, 1, 1,
0.7743171, 2.225176, 1.290991, 0.6901961, 0, 1, 1,
0.7756142, 0.1160934, -0.04318737, 0.6980392, 0, 1, 1,
0.7786595, -0.1358318, 1.416677, 0.7058824, 0, 1, 1,
0.7809026, 0.1829611, 1.399408, 0.7098039, 0, 1, 1,
0.78299, -0.755807, 1.146949, 0.7176471, 0, 1, 1,
0.7835419, 0.304608, 0.7480534, 0.7215686, 0, 1, 1,
0.7837219, 1.297603, 0.2053454, 0.7294118, 0, 1, 1,
0.7847615, -1.897254, 2.237749, 0.7333333, 0, 1, 1,
0.7867385, -0.5789073, 1.656884, 0.7411765, 0, 1, 1,
0.7868619, -2.673146, 5.519474, 0.7450981, 0, 1, 1,
0.7882267, -0.7637486, 0.1094272, 0.7529412, 0, 1, 1,
0.7964985, -0.2254585, 2.114972, 0.7568628, 0, 1, 1,
0.7976586, -0.9025272, 1.325564, 0.7647059, 0, 1, 1,
0.8005357, -0.1522349, 1.055936, 0.7686275, 0, 1, 1,
0.8065549, 0.3715017, 0.8120456, 0.7764706, 0, 1, 1,
0.8177351, -0.1011051, 1.75355, 0.7803922, 0, 1, 1,
0.8181018, -1.390618, 1.477873, 0.7882353, 0, 1, 1,
0.8203812, 0.4360771, 2.343839, 0.7921569, 0, 1, 1,
0.8244249, -1.871891, 2.523991, 0.8, 0, 1, 1,
0.8322388, 0.0936741, 1.368032, 0.8078431, 0, 1, 1,
0.8341532, 0.2171407, 2.23269, 0.8117647, 0, 1, 1,
0.8440461, 1.023163, 1.105742, 0.8196079, 0, 1, 1,
0.8484145, -0.2501469, 1.318635, 0.8235294, 0, 1, 1,
0.8495654, -2.354759, 1.960201, 0.8313726, 0, 1, 1,
0.8532181, 0.5496282, 0.7516257, 0.8352941, 0, 1, 1,
0.8743612, 0.2270415, -0.3317686, 0.8431373, 0, 1, 1,
0.8896202, 0.6363617, 1.426965, 0.8470588, 0, 1, 1,
0.891276, 2.263793, 0.04144125, 0.854902, 0, 1, 1,
0.8961598, 0.8686715, 0.004233146, 0.8588235, 0, 1, 1,
0.8968151, 0.6922687, -1.094065, 0.8666667, 0, 1, 1,
0.8974625, 0.7921146, 1.317308, 0.8705882, 0, 1, 1,
0.9040001, -0.2288711, 2.098015, 0.8784314, 0, 1, 1,
0.9046387, 2.89669, -0.1116491, 0.8823529, 0, 1, 1,
0.9071806, 1.335892, -0.09939634, 0.8901961, 0, 1, 1,
0.9085574, 0.2907376, 1.216742, 0.8941177, 0, 1, 1,
0.9134803, -1.45108, 3.905711, 0.9019608, 0, 1, 1,
0.9191262, -0.1665547, 1.154631, 0.9098039, 0, 1, 1,
0.9217898, 0.286125, 0.5010182, 0.9137255, 0, 1, 1,
0.9277236, 0.4240891, 0.4552175, 0.9215686, 0, 1, 1,
0.9279022, -1.838332, 3.72009, 0.9254902, 0, 1, 1,
0.932196, 0.4266173, -0.4645979, 0.9333333, 0, 1, 1,
0.9443755, -0.8068281, 0.5204087, 0.9372549, 0, 1, 1,
0.9527338, 2.841768, -0.8644792, 0.945098, 0, 1, 1,
0.9540986, 1.18064, 1.331943, 0.9490196, 0, 1, 1,
0.9546777, -1.04706, 2.762221, 0.9568627, 0, 1, 1,
0.9577764, -0.4974224, 4.318378, 0.9607843, 0, 1, 1,
0.9585244, -0.6375983, 0.3294141, 0.9686275, 0, 1, 1,
0.9649256, 1.829529, 0.64742, 0.972549, 0, 1, 1,
0.9669434, 0.6328273, 2.001657, 0.9803922, 0, 1, 1,
0.9913489, 0.5798811, 1.248315, 0.9843137, 0, 1, 1,
0.9947371, -0.50359, 3.232064, 0.9921569, 0, 1, 1,
0.9954525, -0.9167989, 2.614299, 0.9960784, 0, 1, 1,
0.997606, -1.623838, 0.618145, 1, 0, 0.9960784, 1,
0.998428, 0.8337188, 1.053728, 1, 0, 0.9882353, 1,
1.00941, 1.0249, 0.1877781, 1, 0, 0.9843137, 1,
1.010755, 0.2907184, 2.512894, 1, 0, 0.9764706, 1,
1.016172, 0.6355317, 2.391093, 1, 0, 0.972549, 1,
1.024803, 0.3743038, 1.408723, 1, 0, 0.9647059, 1,
1.028443, 0.3150463, -0.2115389, 1, 0, 0.9607843, 1,
1.029592, 2.443964, 0.7839876, 1, 0, 0.9529412, 1,
1.034264, -0.8455468, 1.833586, 1, 0, 0.9490196, 1,
1.04253, 0.9282072, 1.797156, 1, 0, 0.9411765, 1,
1.052801, -0.06768519, 2.198099, 1, 0, 0.9372549, 1,
1.053204, 0.005204733, 2.016895, 1, 0, 0.9294118, 1,
1.058789, 0.5925545, 1.594046, 1, 0, 0.9254902, 1,
1.059371, -1.070665, 1.611219, 1, 0, 0.9176471, 1,
1.059747, -0.735872, 0.9379539, 1, 0, 0.9137255, 1,
1.062346, -0.4616879, 3.321868, 1, 0, 0.9058824, 1,
1.063344, 1.736392, 0.2232355, 1, 0, 0.9019608, 1,
1.065814, -1.924924, 2.17175, 1, 0, 0.8941177, 1,
1.067212, 0.2672657, 0.8042337, 1, 0, 0.8862745, 1,
1.068507, -0.2061108, 1.359315, 1, 0, 0.8823529, 1,
1.068817, -0.03001973, 3.654465, 1, 0, 0.8745098, 1,
1.075285, -0.4492551, 1.983147, 1, 0, 0.8705882, 1,
1.075878, 1.32626, 1.387881, 1, 0, 0.8627451, 1,
1.080275, -0.09773258, 1.622208, 1, 0, 0.8588235, 1,
1.082964, 0.2134813, 1.400314, 1, 0, 0.8509804, 1,
1.084745, 1.995422, 1.309652, 1, 0, 0.8470588, 1,
1.093806, 1.534243, 1.336454, 1, 0, 0.8392157, 1,
1.103065, -1.081012, 1.829707, 1, 0, 0.8352941, 1,
1.103752, -0.3121285, 1.873366, 1, 0, 0.827451, 1,
1.112717, 0.6816786, -0.937143, 1, 0, 0.8235294, 1,
1.112985, -0.7093624, 2.94054, 1, 0, 0.8156863, 1,
1.114734, 1.120544, -0.6865121, 1, 0, 0.8117647, 1,
1.122828, -3.031362, 2.381458, 1, 0, 0.8039216, 1,
1.128526, -0.5865677, 1.432329, 1, 0, 0.7960784, 1,
1.135441, 1.273651, 0.9694567, 1, 0, 0.7921569, 1,
1.13773, -1.808133, 2.229341, 1, 0, 0.7843137, 1,
1.138053, 2.153019, 0.5368518, 1, 0, 0.7803922, 1,
1.145964, -0.1789278, 2.00442, 1, 0, 0.772549, 1,
1.146687, 0.4733449, 1.886725, 1, 0, 0.7686275, 1,
1.147484, 0.07693337, 2.325791, 1, 0, 0.7607843, 1,
1.151452, 0.7852412, 1.705284, 1, 0, 0.7568628, 1,
1.154599, 1.779481, 1.23163, 1, 0, 0.7490196, 1,
1.15518, 0.426663, 1.714869, 1, 0, 0.7450981, 1,
1.160225, 0.3206303, 1.964479, 1, 0, 0.7372549, 1,
1.171928, -2.522721, 1.372087, 1, 0, 0.7333333, 1,
1.17286, 1.525911, 0.1894442, 1, 0, 0.7254902, 1,
1.172869, 1.171676, 0.428472, 1, 0, 0.7215686, 1,
1.176707, 0.3800712, -0.7101939, 1, 0, 0.7137255, 1,
1.185834, -1.403997, 1.410312, 1, 0, 0.7098039, 1,
1.187497, -0.121741, 2.148566, 1, 0, 0.7019608, 1,
1.193427, 0.03320954, 0.5373268, 1, 0, 0.6941177, 1,
1.194589, 0.3849003, 0.9702513, 1, 0, 0.6901961, 1,
1.196553, -1.025136, 1.376874, 1, 0, 0.682353, 1,
1.197583, -1.275343, 3.379563, 1, 0, 0.6784314, 1,
1.206944, -1.224162, 2.897044, 1, 0, 0.6705883, 1,
1.215219, -0.1562766, 1.10711, 1, 0, 0.6666667, 1,
1.215362, 0.02299987, 2.937181, 1, 0, 0.6588235, 1,
1.218152, 1.001134, 1.477296, 1, 0, 0.654902, 1,
1.228002, 0.08627978, 0.8498906, 1, 0, 0.6470588, 1,
1.231889, -0.4896995, 3.095715, 1, 0, 0.6431373, 1,
1.238728, 0.9725963, 2.322298, 1, 0, 0.6352941, 1,
1.23912, 1.240456, -0.5459974, 1, 0, 0.6313726, 1,
1.244012, 2.071996, -0.7486938, 1, 0, 0.6235294, 1,
1.25299, -0.3543599, 0.2547067, 1, 0, 0.6196079, 1,
1.254797, -0.0384874, 0.9298018, 1, 0, 0.6117647, 1,
1.254985, -1.629853, 3.894678, 1, 0, 0.6078432, 1,
1.255447, 0.8424855, 0.4344522, 1, 0, 0.6, 1,
1.259307, 0.6406973, 0.4987819, 1, 0, 0.5921569, 1,
1.268135, 0.1402321, 0.9746627, 1, 0, 0.5882353, 1,
1.272472, 1.636745, -2.804667, 1, 0, 0.5803922, 1,
1.274198, 2.356909, -0.6181991, 1, 0, 0.5764706, 1,
1.296543, -0.9027649, 2.767282, 1, 0, 0.5686275, 1,
1.303847, -0.4345262, 3.067912, 1, 0, 0.5647059, 1,
1.30716, 0.4102627, 0.3683617, 1, 0, 0.5568628, 1,
1.315967, 1.242126, 1.206812, 1, 0, 0.5529412, 1,
1.327474, 0.7994675, 0.2069188, 1, 0, 0.5450981, 1,
1.336748, 0.8693355, 1.369906, 1, 0, 0.5411765, 1,
1.3524, 2.685319, -0.1480698, 1, 0, 0.5333334, 1,
1.353735, -1.426714, 2.659341, 1, 0, 0.5294118, 1,
1.365535, -0.6586483, -0.3349976, 1, 0, 0.5215687, 1,
1.36813, -0.2192743, 2.128808, 1, 0, 0.5176471, 1,
1.37418, 0.2336426, 0.7087792, 1, 0, 0.509804, 1,
1.395981, -2.104995, 2.618322, 1, 0, 0.5058824, 1,
1.405055, 1.15177, 1.961503, 1, 0, 0.4980392, 1,
1.418055, -1.615498, 3.679065, 1, 0, 0.4901961, 1,
1.424108, -1.012918, 3.354676, 1, 0, 0.4862745, 1,
1.426726, -0.435296, 2.819694, 1, 0, 0.4784314, 1,
1.430727, 0.2335611, 1.134123, 1, 0, 0.4745098, 1,
1.432538, 0.2893104, 2.890094, 1, 0, 0.4666667, 1,
1.449024, -0.7825162, 0.9493477, 1, 0, 0.4627451, 1,
1.463626, 0.6454833, -0.05792053, 1, 0, 0.454902, 1,
1.466375, -0.6706611, -0.3190104, 1, 0, 0.4509804, 1,
1.47173, 1.033245, 2.4276, 1, 0, 0.4431373, 1,
1.491862, 0.3130501, 2.472946, 1, 0, 0.4392157, 1,
1.496559, 1.074, 0.7022317, 1, 0, 0.4313726, 1,
1.507426, -0.6489833, 2.451249, 1, 0, 0.427451, 1,
1.514952, 2.028133, -0.3678355, 1, 0, 0.4196078, 1,
1.521142, 1.373219, 0.7777988, 1, 0, 0.4156863, 1,
1.521792, 1.186818, 0.2183488, 1, 0, 0.4078431, 1,
1.536895, 1.826681, -0.402425, 1, 0, 0.4039216, 1,
1.548825, -0.8292577, 2.015219, 1, 0, 0.3960784, 1,
1.554883, -0.7478642, 3.001038, 1, 0, 0.3882353, 1,
1.569118, -0.1395846, 0.4234785, 1, 0, 0.3843137, 1,
1.584679, -1.536473, 2.128891, 1, 0, 0.3764706, 1,
1.595411, -2.085907, 2.943334, 1, 0, 0.372549, 1,
1.631463, 2.109323, 1.199786, 1, 0, 0.3647059, 1,
1.667981, 1.068467, 0.9787993, 1, 0, 0.3607843, 1,
1.699629, 0.7965151, 0.9012582, 1, 0, 0.3529412, 1,
1.72078, -0.3920716, 1.986782, 1, 0, 0.3490196, 1,
1.723672, 0.6779411, 2.163271, 1, 0, 0.3411765, 1,
1.732365, -0.7714692, 2.606381, 1, 0, 0.3372549, 1,
1.734353, -0.2751788, 2.190264, 1, 0, 0.3294118, 1,
1.750327, -1.822132, 3.635958, 1, 0, 0.3254902, 1,
1.752276, -0.8689827, 2.055132, 1, 0, 0.3176471, 1,
1.763588, -0.07072037, -0.7333159, 1, 0, 0.3137255, 1,
1.783559, 1.009736, 0.9548062, 1, 0, 0.3058824, 1,
1.789191, 1.477978, 1.580292, 1, 0, 0.2980392, 1,
1.804008, -0.7308463, -0.3732276, 1, 0, 0.2941177, 1,
1.806128, -0.721899, 1.842885, 1, 0, 0.2862745, 1,
1.811728, -1.694815, 2.385101, 1, 0, 0.282353, 1,
1.812648, -0.4384435, 0.6854126, 1, 0, 0.2745098, 1,
1.81375, -0.665198, 2.777676, 1, 0, 0.2705882, 1,
1.829784, -0.3846494, 0.3062869, 1, 0, 0.2627451, 1,
1.833117, 0.2933463, 2.542948, 1, 0, 0.2588235, 1,
1.837313, -0.1045484, 2.129739, 1, 0, 0.2509804, 1,
1.847564, -0.9565192, 1.218365, 1, 0, 0.2470588, 1,
1.848583, -1.078441, 1.871207, 1, 0, 0.2392157, 1,
1.859718, -0.6119137, 1.73641, 1, 0, 0.2352941, 1,
1.896747, 0.1232875, 1.852333, 1, 0, 0.227451, 1,
1.898396, -1.603317, 1.938436, 1, 0, 0.2235294, 1,
1.899755, 0.983424, 2.533405, 1, 0, 0.2156863, 1,
1.951679, -0.9027866, 1.479216, 1, 0, 0.2117647, 1,
1.973313, 0.933037, 1.395977, 1, 0, 0.2039216, 1,
1.98022, -1.250562, 3.433223, 1, 0, 0.1960784, 1,
1.989521, 0.06814088, 2.046022, 1, 0, 0.1921569, 1,
1.998233, -1.30853, 3.147248, 1, 0, 0.1843137, 1,
1.998419, 1.173547, 1.474386, 1, 0, 0.1803922, 1,
1.998811, -0.06179232, 1.222113, 1, 0, 0.172549, 1,
1.9999, 1.189951, 2.774499, 1, 0, 0.1686275, 1,
2.01907, -1.267639, 1.915008, 1, 0, 0.1607843, 1,
2.019325, 1.255369, 0.7348075, 1, 0, 0.1568628, 1,
2.049337, 1.043355, 1.779454, 1, 0, 0.1490196, 1,
2.054101, -0.8943428, 1.321312, 1, 0, 0.145098, 1,
2.088543, -0.7148295, 1.395366, 1, 0, 0.1372549, 1,
2.112622, -0.7516462, 1.251701, 1, 0, 0.1333333, 1,
2.141732, -0.9697982, 0.3474266, 1, 0, 0.1254902, 1,
2.211444, -0.3474599, 2.463882, 1, 0, 0.1215686, 1,
2.219221, 0.6587746, 1.358807, 1, 0, 0.1137255, 1,
2.234411, -0.1354235, 0.5952393, 1, 0, 0.1098039, 1,
2.238169, -0.4977466, 2.184446, 1, 0, 0.1019608, 1,
2.252625, 0.8889142, 1.285509, 1, 0, 0.09411765, 1,
2.321074, 0.241482, 1.847355, 1, 0, 0.09019608, 1,
2.343709, 0.4093634, 0.6996464, 1, 0, 0.08235294, 1,
2.355655, -0.07563086, 3.175393, 1, 0, 0.07843138, 1,
2.381936, 1.129988, 3.819168, 1, 0, 0.07058824, 1,
2.388119, 1.072602, -1.118111, 1, 0, 0.06666667, 1,
2.390144, 0.6607339, 0.857066, 1, 0, 0.05882353, 1,
2.460285, -0.8316172, -0.3970308, 1, 0, 0.05490196, 1,
2.477214, 1.115558, 0.6868173, 1, 0, 0.04705882, 1,
2.479631, 0.03958896, 1.419776, 1, 0, 0.04313726, 1,
2.485769, 0.6469709, 2.865408, 1, 0, 0.03529412, 1,
2.502702, 1.374506, 0.839164, 1, 0, 0.03137255, 1,
2.601363, -0.9217492, 3.756908, 1, 0, 0.02352941, 1,
2.634701, -1.056025, 1.719565, 1, 0, 0.01960784, 1,
2.841016, 0.2901317, 2.38998, 1, 0, 0.01176471, 1,
2.891748, 0.1122257, 3.548013, 1, 0, 0.007843138, 1
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
-1.125106, -4.242754, -7.238968, 0, -0.5, 0.5, 0.5,
-1.125106, -4.242754, -7.238968, 1, -0.5, 0.5, 0.5,
-1.125106, -4.242754, -7.238968, 1, 1.5, 0.5, 0.5,
-1.125106, -4.242754, -7.238968, 0, 1.5, 0.5, 0.5
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
-6.503674, -0.04816377, -7.238968, 0, -0.5, 0.5, 0.5,
-6.503674, -0.04816377, -7.238968, 1, -0.5, 0.5, 0.5,
-6.503674, -0.04816377, -7.238968, 1, 1.5, 0.5, 0.5,
-6.503674, -0.04816377, -7.238968, 0, 1.5, 0.5, 0.5
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
-6.503674, -4.242754, 0.193294, 0, -0.5, 0.5, 0.5,
-6.503674, -4.242754, 0.193294, 1, -0.5, 0.5, 0.5,
-6.503674, -4.242754, 0.193294, 1, 1.5, 0.5, 0.5,
-6.503674, -4.242754, 0.193294, 0, 1.5, 0.5, 0.5
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
-4, -3.274772, -5.523831,
2, -3.274772, -5.523831,
-4, -3.274772, -5.523831,
-4, -3.436103, -5.809687,
-2, -3.274772, -5.523831,
-2, -3.436103, -5.809687,
0, -3.274772, -5.523831,
0, -3.436103, -5.809687,
2, -3.274772, -5.523831,
2, -3.436103, -5.809687
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
"-4",
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
-4, -3.758763, -6.3814, 0, -0.5, 0.5, 0.5,
-4, -3.758763, -6.3814, 1, -0.5, 0.5, 0.5,
-4, -3.758763, -6.3814, 1, 1.5, 0.5, 0.5,
-4, -3.758763, -6.3814, 0, 1.5, 0.5, 0.5,
-2, -3.758763, -6.3814, 0, -0.5, 0.5, 0.5,
-2, -3.758763, -6.3814, 1, -0.5, 0.5, 0.5,
-2, -3.758763, -6.3814, 1, 1.5, 0.5, 0.5,
-2, -3.758763, -6.3814, 0, 1.5, 0.5, 0.5,
0, -3.758763, -6.3814, 0, -0.5, 0.5, 0.5,
0, -3.758763, -6.3814, 1, -0.5, 0.5, 0.5,
0, -3.758763, -6.3814, 1, 1.5, 0.5, 0.5,
0, -3.758763, -6.3814, 0, 1.5, 0.5, 0.5,
2, -3.758763, -6.3814, 0, -0.5, 0.5, 0.5,
2, -3.758763, -6.3814, 1, -0.5, 0.5, 0.5,
2, -3.758763, -6.3814, 1, 1.5, 0.5, 0.5,
2, -3.758763, -6.3814, 0, 1.5, 0.5, 0.5
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
-5.262466, -3, -5.523831,
-5.262466, 3, -5.523831,
-5.262466, -3, -5.523831,
-5.469334, -3, -5.809687,
-5.262466, -2, -5.523831,
-5.469334, -2, -5.809687,
-5.262466, -1, -5.523831,
-5.469334, -1, -5.809687,
-5.262466, 0, -5.523831,
-5.469334, 0, -5.809687,
-5.262466, 1, -5.523831,
-5.469334, 1, -5.809687,
-5.262466, 2, -5.523831,
-5.469334, 2, -5.809687,
-5.262466, 3, -5.523831,
-5.469334, 3, -5.809687
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
-5.88307, -3, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, -3, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, -3, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, -3, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, -2, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, -2, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, -2, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, -2, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, -1, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, -1, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, -1, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, -1, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, 0, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, 0, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, 0, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, 0, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, 1, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, 1, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, 1, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, 1, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, 2, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, 2, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, 2, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, 2, -6.3814, 0, 1.5, 0.5, 0.5,
-5.88307, 3, -6.3814, 0, -0.5, 0.5, 0.5,
-5.88307, 3, -6.3814, 1, -0.5, 0.5, 0.5,
-5.88307, 3, -6.3814, 1, 1.5, 0.5, 0.5,
-5.88307, 3, -6.3814, 0, 1.5, 0.5, 0.5
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
-5.262466, -3.274772, -4,
-5.262466, -3.274772, 4,
-5.262466, -3.274772, -4,
-5.469334, -3.436103, -4,
-5.262466, -3.274772, -2,
-5.469334, -3.436103, -2,
-5.262466, -3.274772, 0,
-5.469334, -3.436103, 0,
-5.262466, -3.274772, 2,
-5.469334, -3.436103, 2,
-5.262466, -3.274772, 4,
-5.469334, -3.436103, 4
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
-5.88307, -3.758763, -4, 0, -0.5, 0.5, 0.5,
-5.88307, -3.758763, -4, 1, -0.5, 0.5, 0.5,
-5.88307, -3.758763, -4, 1, 1.5, 0.5, 0.5,
-5.88307, -3.758763, -4, 0, 1.5, 0.5, 0.5,
-5.88307, -3.758763, -2, 0, -0.5, 0.5, 0.5,
-5.88307, -3.758763, -2, 1, -0.5, 0.5, 0.5,
-5.88307, -3.758763, -2, 1, 1.5, 0.5, 0.5,
-5.88307, -3.758763, -2, 0, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 0, 0, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 0, 1, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 0, 1, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 0, 0, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 2, 0, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 2, 1, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 2, 1, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 2, 0, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 4, 0, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 4, 1, -0.5, 0.5, 0.5,
-5.88307, -3.758763, 4, 1, 1.5, 0.5, 0.5,
-5.88307, -3.758763, 4, 0, 1.5, 0.5, 0.5
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
-5.262466, -3.274772, -5.523831,
-5.262466, 3.178445, -5.523831,
-5.262466, -3.274772, 5.910419,
-5.262466, 3.178445, 5.910419,
-5.262466, -3.274772, -5.523831,
-5.262466, -3.274772, 5.910419,
-5.262466, 3.178445, -5.523831,
-5.262466, 3.178445, 5.910419,
-5.262466, -3.274772, -5.523831,
3.012253, -3.274772, -5.523831,
-5.262466, -3.274772, 5.910419,
3.012253, -3.274772, 5.910419,
-5.262466, 3.178445, -5.523831,
3.012253, 3.178445, -5.523831,
-5.262466, 3.178445, 5.910419,
3.012253, 3.178445, 5.910419,
3.012253, -3.274772, -5.523831,
3.012253, 3.178445, -5.523831,
3.012253, -3.274772, 5.910419,
3.012253, 3.178445, 5.910419,
3.012253, -3.274772, -5.523831,
3.012253, -3.274772, 5.910419,
3.012253, 3.178445, -5.523831,
3.012253, 3.178445, 5.910419
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
var radius = 8.287149;
var distance = 36.87046;
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
mvMatrix.translate( 1.125106, 0.04816377, -0.193294 );
mvMatrix.scale( 1.082844, 1.38849, 0.7836306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.87046);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
cyproconazole<-read.table("cyproconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyproconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyproconazole' not found
```

```r
y<-cyproconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyproconazole' not found
```

```r
z<-cyproconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyproconazole' not found
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
-5.141961, 1.272624, -0.2136404, 0, 0, 1, 1, 1,
-3.332462, 0.5757491, -0.8211498, 1, 0, 0, 1, 1,
-2.837411, 0.1663681, -2.822093, 1, 0, 0, 1, 1,
-2.683443, -0.8474091, -4.402797, 1, 0, 0, 1, 1,
-2.65976, -1.317088, -0.4943695, 1, 0, 0, 1, 1,
-2.606818, -0.904511, -2.599734, 1, 0, 0, 1, 1,
-2.593735, 0.4319595, -0.3767675, 0, 0, 0, 1, 1,
-2.566064, -0.4208103, -1.668294, 0, 0, 0, 1, 1,
-2.525434, 1.550051, -0.7168664, 0, 0, 0, 1, 1,
-2.445014, 0.2934506, -1.209065, 0, 0, 0, 1, 1,
-2.443697, 0.7939531, -1.649071, 0, 0, 0, 1, 1,
-2.290501, -0.1919171, -2.136546, 0, 0, 0, 1, 1,
-2.262058, -1.606693, -2.387165, 0, 0, 0, 1, 1,
-2.219948, -1.885651, -1.916355, 1, 1, 1, 1, 1,
-2.216517, 0.2981279, -1.03136, 1, 1, 1, 1, 1,
-2.191733, -0.5802244, -1.030198, 1, 1, 1, 1, 1,
-2.179261, -0.117852, -1.937581, 1, 1, 1, 1, 1,
-2.1739, -1.089367, -1.588336, 1, 1, 1, 1, 1,
-2.156588, -0.986011, -2.112465, 1, 1, 1, 1, 1,
-2.131431, -1.001939, -3.30995, 1, 1, 1, 1, 1,
-2.098614, 0.9960055, -3.040151, 1, 1, 1, 1, 1,
-2.069753, 0.1833376, -1.360832, 1, 1, 1, 1, 1,
-2.04143, 0.3529195, -1.20387, 1, 1, 1, 1, 1,
-2.036435, 0.7012752, -0.8034313, 1, 1, 1, 1, 1,
-2.032845, 0.1995125, -1.57688, 1, 1, 1, 1, 1,
-1.982199, -0.3996549, -2.475723, 1, 1, 1, 1, 1,
-1.941036, 0.7623062, -0.854669, 1, 1, 1, 1, 1,
-1.913068, 0.4964698, -2.091149, 1, 1, 1, 1, 1,
-1.895117, -0.3587899, -1.900763, 0, 0, 1, 1, 1,
-1.883578, -0.4178264, -0.7420913, 1, 0, 0, 1, 1,
-1.882139, 0.2813679, -2.556358, 1, 0, 0, 1, 1,
-1.878185, -0.3597294, -0.795049, 1, 0, 0, 1, 1,
-1.869399, -0.3680965, -0.4197724, 1, 0, 0, 1, 1,
-1.855088, 0.891638, -1.866305, 1, 0, 0, 1, 1,
-1.848453, -1.4002, -2.161275, 0, 0, 0, 1, 1,
-1.848377, 0.7866051, -1.142003, 0, 0, 0, 1, 1,
-1.837677, 1.051136, -1.855254, 0, 0, 0, 1, 1,
-1.815742, -1.751323, -2.451642, 0, 0, 0, 1, 1,
-1.815702, 0.1657583, -0.4202892, 0, 0, 0, 1, 1,
-1.814147, -1.336594, -0.8124377, 0, 0, 0, 1, 1,
-1.80378, 0.7752151, -1.444275, 0, 0, 0, 1, 1,
-1.750182, -1.035524, -1.213786, 1, 1, 1, 1, 1,
-1.748856, -0.1096688, -0.7320343, 1, 1, 1, 1, 1,
-1.747702, -0.08552722, -1.192899, 1, 1, 1, 1, 1,
-1.737473, -0.4520747, -1.014629, 1, 1, 1, 1, 1,
-1.733339, 0.1438166, -0.9609532, 1, 1, 1, 1, 1,
-1.726082, 0.1973801, -3.0331, 1, 1, 1, 1, 1,
-1.723648, 1.831485, 0.06744269, 1, 1, 1, 1, 1,
-1.723295, -0.3223511, -2.006589, 1, 1, 1, 1, 1,
-1.719233, 1.015584, -0.2672278, 1, 1, 1, 1, 1,
-1.715272, 0.3490947, 0.6213098, 1, 1, 1, 1, 1,
-1.714801, 0.7925761, -0.9965746, 1, 1, 1, 1, 1,
-1.701829, 0.3791123, -2.189806, 1, 1, 1, 1, 1,
-1.68942, -0.43757, -3.144959, 1, 1, 1, 1, 1,
-1.680519, -1.615971, -2.210161, 1, 1, 1, 1, 1,
-1.672164, 0.5187387, -2.008608, 1, 1, 1, 1, 1,
-1.664798, -1.44356, -1.827889, 0, 0, 1, 1, 1,
-1.635249, -0.03677215, 0.08522619, 1, 0, 0, 1, 1,
-1.616674, -0.07607472, -1.961738, 1, 0, 0, 1, 1,
-1.582213, 0.1827244, -3.043647, 1, 0, 0, 1, 1,
-1.581304, 2.820557, -1.443282, 1, 0, 0, 1, 1,
-1.5811, -1.544308, -4.38174, 1, 0, 0, 1, 1,
-1.577227, -0.2454173, -1.917657, 0, 0, 0, 1, 1,
-1.555806, 0.2159168, -2.253392, 0, 0, 0, 1, 1,
-1.552238, 1.879468, 0.4559498, 0, 0, 0, 1, 1,
-1.5475, 1.216678, -1.405659, 0, 0, 0, 1, 1,
-1.545259, 0.9560459, 1.684083, 0, 0, 0, 1, 1,
-1.529892, 0.7761034, -0.6514157, 0, 0, 0, 1, 1,
-1.527846, 0.3565234, -2.312118, 0, 0, 0, 1, 1,
-1.523588, 1.290192, -1.689149, 1, 1, 1, 1, 1,
-1.523054, 1.214125, -0.3251548, 1, 1, 1, 1, 1,
-1.511523, 1.41907, -1.524991, 1, 1, 1, 1, 1,
-1.50407, -0.3823292, -1.709394, 1, 1, 1, 1, 1,
-1.503034, 1.519052, -0.9634084, 1, 1, 1, 1, 1,
-1.495204, -0.562937, -2.081156, 1, 1, 1, 1, 1,
-1.481699, -0.6973963, -2.033241, 1, 1, 1, 1, 1,
-1.479264, 1.095178, -1.610534, 1, 1, 1, 1, 1,
-1.476743, 2.082578, -1.591504, 1, 1, 1, 1, 1,
-1.459649, 1.899342, 1.395038, 1, 1, 1, 1, 1,
-1.455548, -1.11472, -1.913245, 1, 1, 1, 1, 1,
-1.446762, 0.7602695, -1.634408, 1, 1, 1, 1, 1,
-1.439921, -0.3739614, -2.484941, 1, 1, 1, 1, 1,
-1.438503, 0.9026719, -2.232666, 1, 1, 1, 1, 1,
-1.438437, -0.8678087, -0.9134093, 1, 1, 1, 1, 1,
-1.426753, 1.886196, -1.102664, 0, 0, 1, 1, 1,
-1.425065, -0.01426017, 0.3378695, 1, 0, 0, 1, 1,
-1.422392, -0.5025932, -2.341004, 1, 0, 0, 1, 1,
-1.411461, -0.587539, -0.4911895, 1, 0, 0, 1, 1,
-1.408173, 1.140782, -0.9868697, 1, 0, 0, 1, 1,
-1.405067, -0.3814681, -3.655717, 1, 0, 0, 1, 1,
-1.388414, 0.6159956, -0.8019275, 0, 0, 0, 1, 1,
-1.380509, -0.8596324, -3.907646, 0, 0, 0, 1, 1,
-1.377429, 2.072312, -0.5263261, 0, 0, 0, 1, 1,
-1.376031, 0.3859411, -1.285639, 0, 0, 0, 1, 1,
-1.372834, 0.2263717, -1.034071, 0, 0, 0, 1, 1,
-1.366161, 0.9521227, -1.019677, 0, 0, 0, 1, 1,
-1.360434, 0.642603, -1.196613, 0, 0, 0, 1, 1,
-1.356496, 0.2888473, -1.692524, 1, 1, 1, 1, 1,
-1.345625, -0.5217365, -3.41844, 1, 1, 1, 1, 1,
-1.342114, 0.429949, -1.659033, 1, 1, 1, 1, 1,
-1.337457, -0.711225, -1.910195, 1, 1, 1, 1, 1,
-1.335574, -0.1110571, -0.1734174, 1, 1, 1, 1, 1,
-1.333117, 0.5908964, -1.033981, 1, 1, 1, 1, 1,
-1.322872, -0.1945882, -1.517834, 1, 1, 1, 1, 1,
-1.318513, 0.4157138, -1.101543, 1, 1, 1, 1, 1,
-1.318355, -0.02378342, -0.6732708, 1, 1, 1, 1, 1,
-1.306337, 0.140456, -1.724004, 1, 1, 1, 1, 1,
-1.302763, -1.073283, -2.596213, 1, 1, 1, 1, 1,
-1.300001, -0.1599093, -0.6769862, 1, 1, 1, 1, 1,
-1.29933, 1.864354, -1.980442, 1, 1, 1, 1, 1,
-1.295951, 0.2551822, -2.272044, 1, 1, 1, 1, 1,
-1.283849, 0.003069447, -2.04088, 1, 1, 1, 1, 1,
-1.276205, -0.7532197, -2.283454, 0, 0, 1, 1, 1,
-1.270545, 0.08894688, -2.179932, 1, 0, 0, 1, 1,
-1.269844, 0.5424914, 0.8426541, 1, 0, 0, 1, 1,
-1.264815, -0.9717357, -1.421851, 1, 0, 0, 1, 1,
-1.261418, 0.08250774, -0.2438966, 1, 0, 0, 1, 1,
-1.252615, -1.418425, -3.404739, 1, 0, 0, 1, 1,
-1.239352, -1.590665, -0.4078676, 0, 0, 0, 1, 1,
-1.230194, -0.9057605, -1.314997, 0, 0, 0, 1, 1,
-1.226179, 1.049808, 0.05147528, 0, 0, 0, 1, 1,
-1.217309, -0.3771136, -3.294616, 0, 0, 0, 1, 1,
-1.216422, 0.1393908, -1.175315, 0, 0, 0, 1, 1,
-1.207145, 0.1784713, -1.344047, 0, 0, 0, 1, 1,
-1.201741, 0.9251903, -2.198712, 0, 0, 0, 1, 1,
-1.197685, 0.2104554, -0.8048435, 1, 1, 1, 1, 1,
-1.197335, 0.3101347, -0.8404913, 1, 1, 1, 1, 1,
-1.195808, -0.3154381, -2.206359, 1, 1, 1, 1, 1,
-1.191829, 2.308929, -1.825276, 1, 1, 1, 1, 1,
-1.170585, 0.532172, -0.985714, 1, 1, 1, 1, 1,
-1.167179, -0.439768, 0.3362029, 1, 1, 1, 1, 1,
-1.160017, -0.3962628, -3.039735, 1, 1, 1, 1, 1,
-1.156659, -0.01030368, -1.449167, 1, 1, 1, 1, 1,
-1.154012, -0.4071611, -1.213273, 1, 1, 1, 1, 1,
-1.147596, 0.5979602, -1.702142, 1, 1, 1, 1, 1,
-1.139926, -1.110706, -2.55687, 1, 1, 1, 1, 1,
-1.136045, -0.851734, -2.89077, 1, 1, 1, 1, 1,
-1.132012, -0.8171304, -4.210677, 1, 1, 1, 1, 1,
-1.131926, -0.9075596, -2.350829, 1, 1, 1, 1, 1,
-1.131047, 0.2936561, 0.2301928, 1, 1, 1, 1, 1,
-1.123962, 0.8240838, -0.4258524, 0, 0, 1, 1, 1,
-1.112213, 2.423233, -1.104256, 1, 0, 0, 1, 1,
-1.086923, -0.1890039, -1.768507, 1, 0, 0, 1, 1,
-1.086746, 0.02764139, 0.1328172, 1, 0, 0, 1, 1,
-1.072706, 0.4456307, -0.6374055, 1, 0, 0, 1, 1,
-1.068098, 0.5814992, -0.4515966, 1, 0, 0, 1, 1,
-1.064932, 1.497968, -0.3669583, 0, 0, 0, 1, 1,
-1.048517, 0.4784566, -1.273407, 0, 0, 0, 1, 1,
-1.031224, -0.3410998, -1.356142, 0, 0, 0, 1, 1,
-1.026462, 0.7788652, -2.519271, 0, 0, 0, 1, 1,
-1.026255, 1.23211, -0.9169014, 0, 0, 0, 1, 1,
-1.023531, -0.2713227, -2.018181, 0, 0, 0, 1, 1,
-1.02226, 0.421491, -2.012298, 0, 0, 0, 1, 1,
-1.010258, 0.7440034, 0.5208901, 1, 1, 1, 1, 1,
-1.004014, 0.341739, 0.8993442, 1, 1, 1, 1, 1,
-0.9984225, 1.890407, 0.2524544, 1, 1, 1, 1, 1,
-0.9977837, 0.2720352, -0.9940065, 1, 1, 1, 1, 1,
-0.9977427, 2.331454, -0.819766, 1, 1, 1, 1, 1,
-0.9972845, -0.9154469, -0.8499147, 1, 1, 1, 1, 1,
-0.9913428, 0.8583235, -1.927347, 1, 1, 1, 1, 1,
-0.990447, -0.7469031, -1.987267, 1, 1, 1, 1, 1,
-0.9866491, 0.901983, 0.196742, 1, 1, 1, 1, 1,
-0.9816431, 1.537184, -0.3703073, 1, 1, 1, 1, 1,
-0.9778605, -1.344089, -2.955108, 1, 1, 1, 1, 1,
-0.9776982, 0.8775135, -0.4187236, 1, 1, 1, 1, 1,
-0.9742537, -0.4986629, -1.081022, 1, 1, 1, 1, 1,
-0.9713788, 1.272312, -0.7081261, 1, 1, 1, 1, 1,
-0.9708994, 0.2995263, 0.1180249, 1, 1, 1, 1, 1,
-0.9646536, 0.09274676, -0.7779377, 0, 0, 1, 1, 1,
-0.9609667, -0.08365704, -1.376842, 1, 0, 0, 1, 1,
-0.9563521, 1.26088, 1.097486, 1, 0, 0, 1, 1,
-0.9519504, -1.283095, -1.441028, 1, 0, 0, 1, 1,
-0.944604, -0.5039786, -2.212252, 1, 0, 0, 1, 1,
-0.9422432, -0.3057464, -0.6007363, 1, 0, 0, 1, 1,
-0.937088, -0.004775216, -1.456321, 0, 0, 0, 1, 1,
-0.9359666, 1.525076, -1.196437, 0, 0, 0, 1, 1,
-0.9323459, 0.5166588, -1.223723, 0, 0, 0, 1, 1,
-0.9321508, -0.6493585, -1.996865, 0, 0, 0, 1, 1,
-0.9304217, -0.6758726, -3.133836, 0, 0, 0, 1, 1,
-0.9292148, 1.24903, -0.9864929, 0, 0, 0, 1, 1,
-0.9265032, -1.807458, -2.719705, 0, 0, 0, 1, 1,
-0.92387, 0.1489213, -0.4714648, 1, 1, 1, 1, 1,
-0.9144224, -0.9628035, -3.682245, 1, 1, 1, 1, 1,
-0.9108919, 0.1132566, -3.092354, 1, 1, 1, 1, 1,
-0.9054698, 0.1554367, -1.606908, 1, 1, 1, 1, 1,
-0.9051824, 0.09812533, -3.43304, 1, 1, 1, 1, 1,
-0.9021671, -0.6661471, -2.114429, 1, 1, 1, 1, 1,
-0.8924997, -2.411097, -0.583965, 1, 1, 1, 1, 1,
-0.8911691, 0.7334986, 0.1899413, 1, 1, 1, 1, 1,
-0.8889142, 0.6010008, -1.968134, 1, 1, 1, 1, 1,
-0.8858179, -0.4544596, -1.466897, 1, 1, 1, 1, 1,
-0.8839717, 1.195735, -0.2597195, 1, 1, 1, 1, 1,
-0.8719428, 0.9392373, -1.281732, 1, 1, 1, 1, 1,
-0.8657628, -1.00313, -2.967281, 1, 1, 1, 1, 1,
-0.8654339, 2.185388, -1.592842, 1, 1, 1, 1, 1,
-0.8634318, 0.4144244, -0.5053289, 1, 1, 1, 1, 1,
-0.8345383, -0.0828907, -1.290617, 0, 0, 1, 1, 1,
-0.8338421, 0.2349354, -1.676638, 1, 0, 0, 1, 1,
-0.83316, -5.9063e-05, -1.401958, 1, 0, 0, 1, 1,
-0.8322256, -1.539666, -1.368636, 1, 0, 0, 1, 1,
-0.8307788, -0.5897036, 0.3809244, 1, 0, 0, 1, 1,
-0.8256291, 0.2426267, -0.8763576, 1, 0, 0, 1, 1,
-0.8238184, -0.03838693, -0.3731991, 0, 0, 0, 1, 1,
-0.8178539, -0.07079906, -0.896433, 0, 0, 0, 1, 1,
-0.814012, 0.2643487, -1.062948, 0, 0, 0, 1, 1,
-0.8093439, 1.053725, -1.33595, 0, 0, 0, 1, 1,
-0.801344, 0.3911178, -1.331166, 0, 0, 0, 1, 1,
-0.8003717, 1.032155, -0.8837741, 0, 0, 0, 1, 1,
-0.7971335, 1.193986, 0.07568116, 0, 0, 0, 1, 1,
-0.7879689, 0.7613463, -0.9098437, 1, 1, 1, 1, 1,
-0.7853829, -0.7609121, -2.131935, 1, 1, 1, 1, 1,
-0.7843539, -0.8042196, -2.755303, 1, 1, 1, 1, 1,
-0.7761564, 0.5959681, 0.009235051, 1, 1, 1, 1, 1,
-0.7708974, 0.3681943, -1.532434, 1, 1, 1, 1, 1,
-0.7697108, -1.433456, -2.495454, 1, 1, 1, 1, 1,
-0.7646543, 0.01748489, -0.674441, 1, 1, 1, 1, 1,
-0.7606069, -0.9080517, -2.543769, 1, 1, 1, 1, 1,
-0.7394595, 0.2120143, -1.733794, 1, 1, 1, 1, 1,
-0.7393281, 0.8948027, -0.3106426, 1, 1, 1, 1, 1,
-0.7376808, -0.9083498, -4.728964, 1, 1, 1, 1, 1,
-0.7370951, -0.0802082, -2.898229, 1, 1, 1, 1, 1,
-0.7367504, -0.3784485, -1.730555, 1, 1, 1, 1, 1,
-0.734406, 2.204244, 1.793919, 1, 1, 1, 1, 1,
-0.7341815, -0.1570981, -2.080821, 1, 1, 1, 1, 1,
-0.7330279, 0.4055601, -1.443503, 0, 0, 1, 1, 1,
-0.7319213, -2.087474, -3.45609, 1, 0, 0, 1, 1,
-0.7307478, 1.299508, -2.010149, 1, 0, 0, 1, 1,
-0.7273958, 0.2687318, -1.407843, 1, 0, 0, 1, 1,
-0.7227446, -1.825805, -3.597507, 1, 0, 0, 1, 1,
-0.7224503, 2.062723, -1.117898, 1, 0, 0, 1, 1,
-0.7152862, 0.4837498, -2.608694, 0, 0, 0, 1, 1,
-0.7148459, 0.156435, -2.133471, 0, 0, 0, 1, 1,
-0.7146508, 1.317929, -0.4134567, 0, 0, 0, 1, 1,
-0.7128422, -1.601718, -3.267405, 0, 0, 0, 1, 1,
-0.7110833, 1.328882, -1.123296, 0, 0, 0, 1, 1,
-0.7107029, -1.732741, -2.977733, 0, 0, 0, 1, 1,
-0.7075831, -0.9991146, -2.173655, 0, 0, 0, 1, 1,
-0.7042937, 1.039033, 1.122238, 1, 1, 1, 1, 1,
-0.6987707, -0.7745194, -3.743967, 1, 1, 1, 1, 1,
-0.6976321, -1.229069, -3.549417, 1, 1, 1, 1, 1,
-0.6949254, -0.4584726, -0.73027, 1, 1, 1, 1, 1,
-0.6914822, 0.9390396, -0.122201, 1, 1, 1, 1, 1,
-0.6904198, 1.255585, -1.344603, 1, 1, 1, 1, 1,
-0.6890576, 0.2622085, -1.332535, 1, 1, 1, 1, 1,
-0.6888686, -0.05045516, -1.795947, 1, 1, 1, 1, 1,
-0.6864095, -0.08386852, -1.567701, 1, 1, 1, 1, 1,
-0.6839613, 0.4410457, -0.1604767, 1, 1, 1, 1, 1,
-0.6799233, 0.4656251, -0.4106225, 1, 1, 1, 1, 1,
-0.6730999, -0.3652648, -1.742047, 1, 1, 1, 1, 1,
-0.6717322, 0.267016, -0.374035, 1, 1, 1, 1, 1,
-0.6715175, 0.3361626, -1.368147, 1, 1, 1, 1, 1,
-0.6702106, -0.3699508, -1.26407, 1, 1, 1, 1, 1,
-0.6677438, 0.4867246, -0.2394552, 0, 0, 1, 1, 1,
-0.667476, 1.235209, -0.1531324, 1, 0, 0, 1, 1,
-0.6662825, 0.04859279, -2.063075, 1, 0, 0, 1, 1,
-0.6640602, 0.5625337, -1.453289, 1, 0, 0, 1, 1,
-0.6634109, 1.336603, -1.264844, 1, 0, 0, 1, 1,
-0.6519938, 0.5326011, -0.9236427, 1, 0, 0, 1, 1,
-0.6506796, 1.197828, -0.6475629, 0, 0, 0, 1, 1,
-0.6478466, 1.149913, -0.09541199, 0, 0, 0, 1, 1,
-0.6446179, -1.804184, -2.15155, 0, 0, 0, 1, 1,
-0.6442332, 0.9071789, -0.6629289, 0, 0, 0, 1, 1,
-0.6381141, -0.954192, -3.328668, 0, 0, 0, 1, 1,
-0.6363569, -0.3368939, -3.336561, 0, 0, 0, 1, 1,
-0.6295884, -0.2517485, -0.9267712, 0, 0, 0, 1, 1,
-0.6271443, -0.05914333, -1.925685, 1, 1, 1, 1, 1,
-0.6258454, 2.211731, -0.2493596, 1, 1, 1, 1, 1,
-0.625123, -1.798397, -4.355537, 1, 1, 1, 1, 1,
-0.6235152, -0.5028223, -3.32069, 1, 1, 1, 1, 1,
-0.6219498, 1.258366, -2.163223, 1, 1, 1, 1, 1,
-0.6176422, -0.4580992, -2.943934, 1, 1, 1, 1, 1,
-0.6125338, -0.1777715, -3.808892, 1, 1, 1, 1, 1,
-0.6063102, 0.5052273, -1.907989, 1, 1, 1, 1, 1,
-0.6041483, 0.4199225, -0.5663869, 1, 1, 1, 1, 1,
-0.6038154, 0.1202494, 1.143973, 1, 1, 1, 1, 1,
-0.6025636, -0.3761466, -2.737963, 1, 1, 1, 1, 1,
-0.6023342, -0.3196054, -1.091424, 1, 1, 1, 1, 1,
-0.6007946, -0.5325878, -2.524869, 1, 1, 1, 1, 1,
-0.5941728, -0.1721254, -1.234526, 1, 1, 1, 1, 1,
-0.5893292, -0.4714526, -2.237366, 1, 1, 1, 1, 1,
-0.5865082, 1.71649, -1.599028, 0, 0, 1, 1, 1,
-0.5834602, -0.1336239, -1.466398, 1, 0, 0, 1, 1,
-0.5827814, 0.8677154, -0.2248102, 1, 0, 0, 1, 1,
-0.5762579, 1.942826, -1.30571, 1, 0, 0, 1, 1,
-0.5760895, -1.283059, -4.973052, 1, 0, 0, 1, 1,
-0.5694387, 0.456788, -2.120279, 1, 0, 0, 1, 1,
-0.5683647, -0.1921386, -2.858429, 0, 0, 0, 1, 1,
-0.5678521, -1.053745, -2.217147, 0, 0, 0, 1, 1,
-0.5668, 0.4318714, 0.1061894, 0, 0, 0, 1, 1,
-0.5606187, 1.151185, 1.105925, 0, 0, 0, 1, 1,
-0.5584984, -0.0426189, -1.876565, 0, 0, 0, 1, 1,
-0.5520985, 2.199387, 0.5916858, 0, 0, 0, 1, 1,
-0.551993, -0.1793659, -1.382395, 0, 0, 0, 1, 1,
-0.5471027, 1.949813, -0.8158611, 1, 1, 1, 1, 1,
-0.5455863, 2.457107, -0.0402562, 1, 1, 1, 1, 1,
-0.545569, 0.2066121, -0.5886435, 1, 1, 1, 1, 1,
-0.5436299, 1.078094, -0.7856811, 1, 1, 1, 1, 1,
-0.5411167, -0.5132181, -1.049419, 1, 1, 1, 1, 1,
-0.538132, -0.3196468, -2.06133, 1, 1, 1, 1, 1,
-0.5357023, 1.610084, 2.134197, 1, 1, 1, 1, 1,
-0.533904, 0.8844764, -1.535262, 1, 1, 1, 1, 1,
-0.5210668, 0.2589714, 0.02305189, 1, 1, 1, 1, 1,
-0.5166341, 0.3262964, -2.154476, 1, 1, 1, 1, 1,
-0.5166125, 0.3309322, -2.075098, 1, 1, 1, 1, 1,
-0.5130339, 0.1894107, -0.2066451, 1, 1, 1, 1, 1,
-0.5117845, -1.300037, -2.278601, 1, 1, 1, 1, 1,
-0.51135, -1.711307, -2.086353, 1, 1, 1, 1, 1,
-0.5050297, 1.380289, -0.21809, 1, 1, 1, 1, 1,
-0.5029979, -1.129151, -2.306827, 0, 0, 1, 1, 1,
-0.4997111, 0.5098029, -0.7308637, 1, 0, 0, 1, 1,
-0.4985584, 0.2901808, -0.3573324, 1, 0, 0, 1, 1,
-0.4961998, 0.7510006, -0.3047674, 1, 0, 0, 1, 1,
-0.4955549, 0.3632303, -1.641748, 1, 0, 0, 1, 1,
-0.4954544, -0.4342816, -3.879146, 1, 0, 0, 1, 1,
-0.4905655, -0.3007521, -2.858204, 0, 0, 0, 1, 1,
-0.4904278, -0.2566665, -0.9401137, 0, 0, 0, 1, 1,
-0.4896532, 1.078765, -1.39869, 0, 0, 0, 1, 1,
-0.481388, -3.180793, -3.991839, 0, 0, 0, 1, 1,
-0.4800345, 1.350361, 0.04832944, 0, 0, 0, 1, 1,
-0.4773023, 0.02469641, 0.2021494, 0, 0, 0, 1, 1,
-0.4747883, -0.155551, -0.8085755, 0, 0, 0, 1, 1,
-0.4745019, 0.969553, -1.164737, 1, 1, 1, 1, 1,
-0.4740724, 0.3659167, -1.153859, 1, 1, 1, 1, 1,
-0.4739182, 0.03474618, -0.8343071, 1, 1, 1, 1, 1,
-0.47068, -1.860192, -1.296589, 1, 1, 1, 1, 1,
-0.4663643, 0.3079872, -1.150387, 1, 1, 1, 1, 1,
-0.4658898, 2.091343, -1.196813, 1, 1, 1, 1, 1,
-0.4608706, -0.8801933, -3.788435, 1, 1, 1, 1, 1,
-0.4556691, -0.08529773, -1.736784, 1, 1, 1, 1, 1,
-0.4349227, -0.6895032, -2.828969, 1, 1, 1, 1, 1,
-0.4267939, -1.995037, -2.79786, 1, 1, 1, 1, 1,
-0.4225026, -1.492422, -3.394928, 1, 1, 1, 1, 1,
-0.4198192, 0.1326269, -2.110968, 1, 1, 1, 1, 1,
-0.3974819, -0.4756405, -3.749651, 1, 1, 1, 1, 1,
-0.3970944, 1.008688, -1.026944, 1, 1, 1, 1, 1,
-0.3968618, 0.4787272, -0.6345128, 1, 1, 1, 1, 1,
-0.3961345, -0.01484378, -4.448806, 0, 0, 1, 1, 1,
-0.3957022, -0.4302571, -0.8405613, 1, 0, 0, 1, 1,
-0.3934485, -0.2141326, -3.001377, 1, 0, 0, 1, 1,
-0.3930996, 0.3534697, -2.13558, 1, 0, 0, 1, 1,
-0.3912976, 1.065171, -1.998215, 1, 0, 0, 1, 1,
-0.3900689, 0.1033114, -0.9369093, 1, 0, 0, 1, 1,
-0.3870222, -0.4333236, -2.225004, 0, 0, 0, 1, 1,
-0.3866459, 0.002371076, -1.585595, 0, 0, 0, 1, 1,
-0.3830805, -0.8670195, -1.801354, 0, 0, 0, 1, 1,
-0.3820205, -0.6394132, -2.310665, 0, 0, 0, 1, 1,
-0.3770386, 0.8249236, -0.8832385, 0, 0, 0, 1, 1,
-0.3723935, 0.1867288, -2.163924, 0, 0, 0, 1, 1,
-0.3673426, -0.05897234, -0.6237781, 0, 0, 0, 1, 1,
-0.3627004, 1.13792, -3.490396, 1, 1, 1, 1, 1,
-0.3606593, 1.331383, -1.533787, 1, 1, 1, 1, 1,
-0.358526, 0.1209792, -4.47906, 1, 1, 1, 1, 1,
-0.3574238, 0.3902242, 0.791265, 1, 1, 1, 1, 1,
-0.3547077, 1.725403, 2.198137, 1, 1, 1, 1, 1,
-0.3525315, -2.355457, -3.138123, 1, 1, 1, 1, 1,
-0.3523382, -0.2494883, -1.793847, 1, 1, 1, 1, 1,
-0.3495982, 1.231949, 0.5317988, 1, 1, 1, 1, 1,
-0.3467518, 0.4205152, 0.6466126, 1, 1, 1, 1, 1,
-0.3411026, -0.06051095, -2.604409, 1, 1, 1, 1, 1,
-0.3385365, -0.6671051, -5.111842, 1, 1, 1, 1, 1,
-0.3366118, -1.476577, -3.55221, 1, 1, 1, 1, 1,
-0.3335224, -0.5297847, -2.381299, 1, 1, 1, 1, 1,
-0.3295561, -0.04665246, -2.82436, 1, 1, 1, 1, 1,
-0.3207285, 0.08285997, -3.22222, 1, 1, 1, 1, 1,
-0.3203027, 0.5208427, -1.235222, 0, 0, 1, 1, 1,
-0.3197613, -0.08283336, -1.36696, 1, 0, 0, 1, 1,
-0.3179449, -2.654387, -2.55998, 1, 0, 0, 1, 1,
-0.3168793, -0.3819948, -1.492228, 1, 0, 0, 1, 1,
-0.3145851, 0.7103342, -1.069714, 1, 0, 0, 1, 1,
-0.3140582, -0.3806528, -2.24728, 1, 0, 0, 1, 1,
-0.311981, 1.362754, 0.1124367, 0, 0, 0, 1, 1,
-0.3098085, -0.1632759, -2.200589, 0, 0, 0, 1, 1,
-0.305476, 2.809938, -0.5192416, 0, 0, 0, 1, 1,
-0.3053404, -0.06623445, -2.653027, 0, 0, 0, 1, 1,
-0.3033498, -0.0572053, 0.3524306, 0, 0, 0, 1, 1,
-0.2963866, 0.2152254, -1.027334, 0, 0, 0, 1, 1,
-0.2906443, -0.08409839, -1.621183, 0, 0, 0, 1, 1,
-0.2895584, -0.3123747, -3.505263, 1, 1, 1, 1, 1,
-0.2845728, -0.7250994, -3.878363, 1, 1, 1, 1, 1,
-0.281895, -0.2988382, -3.400542, 1, 1, 1, 1, 1,
-0.2791958, -0.1773097, -0.7813911, 1, 1, 1, 1, 1,
-0.278182, 1.365968, -0.2561597, 1, 1, 1, 1, 1,
-0.2764144, 0.5580325, -1.064927, 1, 1, 1, 1, 1,
-0.2719958, 0.6638787, -1.663251, 1, 1, 1, 1, 1,
-0.2717587, -1.151637, -3.202916, 1, 1, 1, 1, 1,
-0.2691011, 0.1412442, -2.325801, 1, 1, 1, 1, 1,
-0.265027, -1.342235, 0.004431752, 1, 1, 1, 1, 1,
-0.2589517, -0.06208023, -1.407369, 1, 1, 1, 1, 1,
-0.2549832, 0.4752606, -1.687931, 1, 1, 1, 1, 1,
-0.2468251, -0.9035491, -3.443385, 1, 1, 1, 1, 1,
-0.2431362, 0.6534217, 0.850853, 1, 1, 1, 1, 1,
-0.2425824, 0.3650402, -0.6512656, 1, 1, 1, 1, 1,
-0.2358042, -0.9345657, -3.019336, 0, 0, 1, 1, 1,
-0.2325568, 1.957544, -0.5458916, 1, 0, 0, 1, 1,
-0.2311048, -1.294778, -2.87635, 1, 0, 0, 1, 1,
-0.2283635, -0.202364, -2.115911, 1, 0, 0, 1, 1,
-0.2243042, -1.081438, -3.867145, 1, 0, 0, 1, 1,
-0.2242115, -0.1025946, -2.618704, 1, 0, 0, 1, 1,
-0.2188335, -0.7664986, -0.7767073, 0, 0, 0, 1, 1,
-0.215349, 0.5337889, -1.607971, 0, 0, 0, 1, 1,
-0.2112397, 0.2540751, -1.441421, 0, 0, 0, 1, 1,
-0.2093459, -0.01540335, -2.207624, 0, 0, 0, 1, 1,
-0.207257, 0.839795, 0.138791, 0, 0, 0, 1, 1,
-0.2060955, -1.294572, -1.817802, 0, 0, 0, 1, 1,
-0.2054311, 1.022799, -1.019693, 0, 0, 0, 1, 1,
-0.2046259, -1.311796, -2.656379, 1, 1, 1, 1, 1,
-0.2009947, 0.8549026, -1.445253, 1, 1, 1, 1, 1,
-0.1997383, -1.718781, -2.662227, 1, 1, 1, 1, 1,
-0.199047, -0.9471616, -5.266203, 1, 1, 1, 1, 1,
-0.1977164, 1.09526, 0.2311157, 1, 1, 1, 1, 1,
-0.1928158, 0.4651669, -0.6009721, 1, 1, 1, 1, 1,
-0.191573, -0.6812582, -4.566572, 1, 1, 1, 1, 1,
-0.1871263, -0.1967046, -1.886101, 1, 1, 1, 1, 1,
-0.1843934, 0.2029095, -0.498602, 1, 1, 1, 1, 1,
-0.1841202, 0.04918706, -1.14087, 1, 1, 1, 1, 1,
-0.1829145, -0.05125855, -1.378375, 1, 1, 1, 1, 1,
-0.1810379, 0.6101074, -0.3067544, 1, 1, 1, 1, 1,
-0.177524, -0.1531222, -2.061694, 1, 1, 1, 1, 1,
-0.1759747, 1.48221, -0.3764131, 1, 1, 1, 1, 1,
-0.1742286, 0.2595195, -0.9188524, 1, 1, 1, 1, 1,
-0.1710206, 0.3050242, -2.003132, 0, 0, 1, 1, 1,
-0.1662357, -0.1819234, -3.959406, 1, 0, 0, 1, 1,
-0.1647538, 1.055254, -0.6474466, 1, 0, 0, 1, 1,
-0.1604628, -1.843837, -2.873963, 1, 0, 0, 1, 1,
-0.1590337, 0.8475249, -0.8343117, 1, 0, 0, 1, 1,
-0.1578471, -1.335915, -2.273068, 1, 0, 0, 1, 1,
-0.1566847, 2.352391, 0.7441565, 0, 0, 0, 1, 1,
-0.1534341, 1.141657, -0.8373352, 0, 0, 0, 1, 1,
-0.1531464, -2.18787, -2.783897, 0, 0, 0, 1, 1,
-0.1529757, 0.9914282, 0.6266797, 0, 0, 0, 1, 1,
-0.1515386, 0.02589538, -2.941412, 0, 0, 0, 1, 1,
-0.1509046, -0.242194, -5.357313, 0, 0, 0, 1, 1,
-0.14821, -0.2739941, -4.764544, 0, 0, 0, 1, 1,
-0.1446704, -2.080453, -4.256353, 1, 1, 1, 1, 1,
-0.1444549, 0.5605949, 0.6963742, 1, 1, 1, 1, 1,
-0.1428142, 1.222707, 0.3918157, 1, 1, 1, 1, 1,
-0.1418019, 0.7289796, 0.7611543, 1, 1, 1, 1, 1,
-0.140876, 0.05196817, 0.298871, 1, 1, 1, 1, 1,
-0.1399694, 1.53634, 1.333842, 1, 1, 1, 1, 1,
-0.1389405, -0.4676403, -2.727087, 1, 1, 1, 1, 1,
-0.1348725, -1.460896, -3.210591, 1, 1, 1, 1, 1,
-0.1339994, 0.8748801, 0.5610649, 1, 1, 1, 1, 1,
-0.1337846, 0.05856016, -2.979627, 1, 1, 1, 1, 1,
-0.1303603, 2.229666, 0.999195, 1, 1, 1, 1, 1,
-0.1271823, 0.4484818, -1.268232, 1, 1, 1, 1, 1,
-0.1243907, 0.4297266, 0.5115921, 1, 1, 1, 1, 1,
-0.1228664, 2.587041, -0.02622786, 1, 1, 1, 1, 1,
-0.1211997, -0.8142028, -1.520423, 1, 1, 1, 1, 1,
-0.1202491, 0.4649699, 1.350259, 0, 0, 1, 1, 1,
-0.1202348, -0.4596728, -2.268327, 1, 0, 0, 1, 1,
-0.1147762, -0.415522, -2.938364, 1, 0, 0, 1, 1,
-0.1121778, 1.366097, -1.968528, 1, 0, 0, 1, 1,
-0.1070848, 0.01253946, -3.172302, 1, 0, 0, 1, 1,
-0.1067358, -0.535076, -2.251921, 1, 0, 0, 1, 1,
-0.1065095, -0.7068044, -3.934149, 0, 0, 0, 1, 1,
-0.09916302, -0.9181008, -4.420184, 0, 0, 0, 1, 1,
-0.09805431, 0.6054742, 0.7200778, 0, 0, 0, 1, 1,
-0.09628423, -0.1463354, -2.162886, 0, 0, 0, 1, 1,
-0.0960267, -0.9571027, -2.609833, 0, 0, 0, 1, 1,
-0.08663453, -0.9872521, -3.659549, 0, 0, 0, 1, 1,
-0.08085804, 0.99954, 1.361342, 0, 0, 0, 1, 1,
-0.07962167, -0.1250251, -2.096497, 1, 1, 1, 1, 1,
-0.07163567, -1.484837, -3.020826, 1, 1, 1, 1, 1,
-0.07063982, 0.3777889, -0.29036, 1, 1, 1, 1, 1,
-0.06875263, 1.401721, -0.6532761, 1, 1, 1, 1, 1,
-0.06830399, 0.4971191, 1.966284, 1, 1, 1, 1, 1,
-0.06700543, -0.8340528, -3.540267, 1, 1, 1, 1, 1,
-0.06370943, -0.2704465, -2.364227, 1, 1, 1, 1, 1,
-0.05751198, -1.372211, -2.352289, 1, 1, 1, 1, 1,
-0.05622705, -1.145831, -3.69649, 1, 1, 1, 1, 1,
-0.05533262, -1.063915, -4.68253, 1, 1, 1, 1, 1,
-0.05086884, -0.6796899, -2.867534, 1, 1, 1, 1, 1,
-0.04114017, -1.062068, -4.722161, 1, 1, 1, 1, 1,
-0.04075328, -0.3209663, -1.779677, 1, 1, 1, 1, 1,
-0.03794433, 0.6478617, 0.5784991, 1, 1, 1, 1, 1,
-0.0378596, -0.2432755, -3.01747, 1, 1, 1, 1, 1,
-0.02839468, 0.4180665, 0.8743688, 0, 0, 1, 1, 1,
-0.02707404, -0.9511436, -2.222211, 1, 0, 0, 1, 1,
-0.02249785, -0.8135021, -2.685628, 1, 0, 0, 1, 1,
-0.02129239, 0.3424699, -1.829287, 1, 0, 0, 1, 1,
-0.01909151, -1.72938, -3.232678, 1, 0, 0, 1, 1,
-0.01635413, 0.5789736, -0.4176146, 1, 0, 0, 1, 1,
-0.0156752, -0.770318, -4.681398, 0, 0, 0, 1, 1,
-0.003964923, 0.6495924, -1.342513, 0, 0, 0, 1, 1,
-0.001117976, -0.4232743, -1.618094, 0, 0, 0, 1, 1,
0.001557004, -0.8788057, 4.157924, 0, 0, 0, 1, 1,
0.003462768, 0.7210193, -2.109274, 0, 0, 0, 1, 1,
0.007357951, 0.252517, 0.7727124, 0, 0, 0, 1, 1,
0.008469909, -0.2448774, 3.130392, 0, 0, 0, 1, 1,
0.009639664, 0.08066097, -0.3185213, 1, 1, 1, 1, 1,
0.01028097, 0.7423608, 0.001357534, 1, 1, 1, 1, 1,
0.01083202, 0.2076629, -2.301367, 1, 1, 1, 1, 1,
0.01886504, 0.3346212, 1.65359, 1, 1, 1, 1, 1,
0.01958749, -0.4341422, 5.743901, 1, 1, 1, 1, 1,
0.02957156, -0.9716079, 2.60831, 1, 1, 1, 1, 1,
0.03253677, -0.2638738, 2.963531, 1, 1, 1, 1, 1,
0.03265015, -1.706517, 3.349324, 1, 1, 1, 1, 1,
0.03469435, 1.093801, 0.6346024, 1, 1, 1, 1, 1,
0.03591248, -0.3497931, 3.998528, 1, 1, 1, 1, 1,
0.03726273, -0.6184376, 3.365888, 1, 1, 1, 1, 1,
0.03769345, -0.8826621, 4.875785, 1, 1, 1, 1, 1,
0.04513475, -1.020533, 4.370832, 1, 1, 1, 1, 1,
0.04588597, -0.406628, 2.388929, 1, 1, 1, 1, 1,
0.04919631, 0.6418718, -1.268109, 1, 1, 1, 1, 1,
0.05094797, 1.136673, -0.1746791, 0, 0, 1, 1, 1,
0.05518488, 3.084466, 0.3055775, 1, 0, 0, 1, 1,
0.05997919, -0.6645185, 3.431457, 1, 0, 0, 1, 1,
0.06126133, -0.6633649, 3.956655, 1, 0, 0, 1, 1,
0.06139471, -0.2905627, 3.870578, 1, 0, 0, 1, 1,
0.06143972, 0.08607758, -0.5296999, 1, 0, 0, 1, 1,
0.06439757, 0.5960079, 0.4116526, 0, 0, 0, 1, 1,
0.06563622, 0.2725478, 0.2172921, 0, 0, 0, 1, 1,
0.07103119, -0.005916797, 2.915532, 0, 0, 0, 1, 1,
0.07202335, 0.035912, 1.321436, 0, 0, 0, 1, 1,
0.07293291, -1.175817, 2.597904, 0, 0, 0, 1, 1,
0.07295626, -1.325871, 2.802662, 0, 0, 0, 1, 1,
0.07332098, 0.9544172, 0.740059, 0, 0, 0, 1, 1,
0.07649495, -0.09472311, 3.645867, 1, 1, 1, 1, 1,
0.07883964, 1.371844, -0.3644332, 1, 1, 1, 1, 1,
0.08251545, -0.8375185, 2.887811, 1, 1, 1, 1, 1,
0.08378956, 0.3112355, 0.4790053, 1, 1, 1, 1, 1,
0.08756052, 1.200342, -0.01900715, 1, 1, 1, 1, 1,
0.09611651, 2.642026, 0.540612, 1, 1, 1, 1, 1,
0.1002431, 1.601245, 0.3335813, 1, 1, 1, 1, 1,
0.1106201, -0.7465723, 3.115892, 1, 1, 1, 1, 1,
0.1132583, 1.099926, 1.636922, 1, 1, 1, 1, 1,
0.1134397, -1.0732, 4.221888, 1, 1, 1, 1, 1,
0.1157532, 0.8887159, -0.2484993, 1, 1, 1, 1, 1,
0.1199166, 0.4126282, 2.315671, 1, 1, 1, 1, 1,
0.124323, -0.8987133, 3.81838, 1, 1, 1, 1, 1,
0.1304164, 0.976419, -0.993724, 1, 1, 1, 1, 1,
0.1306093, -0.8783519, 1.418057, 1, 1, 1, 1, 1,
0.1308314, -0.5029926, 3.138388, 0, 0, 1, 1, 1,
0.1341411, 1.245071, 0.1484491, 1, 0, 0, 1, 1,
0.1388646, 1.277735, 0.1658613, 1, 0, 0, 1, 1,
0.1397185, -0.3589275, 3.014247, 1, 0, 0, 1, 1,
0.1431201, -1.511385, 3.143836, 1, 0, 0, 1, 1,
0.1464045, -1.605342, 4.193041, 1, 0, 0, 1, 1,
0.1478014, 0.7636251, -0.5317239, 0, 0, 0, 1, 1,
0.1530516, -1.459948, 2.274615, 0, 0, 0, 1, 1,
0.1540107, -0.7554957, 2.258643, 0, 0, 0, 1, 1,
0.1540722, -0.6884248, 2.719088, 0, 0, 0, 1, 1,
0.159942, -1.005404, 2.791844, 0, 0, 0, 1, 1,
0.1608265, -1.20163, 3.469265, 0, 0, 0, 1, 1,
0.1631258, -1.103941, 4.037104, 0, 0, 0, 1, 1,
0.1645357, 0.8499854, 0.8149491, 1, 1, 1, 1, 1,
0.1730272, -0.1372953, 0.9892269, 1, 1, 1, 1, 1,
0.1739767, 1.145839, 1.620662, 1, 1, 1, 1, 1,
0.1743064, 0.2797917, 2.094034, 1, 1, 1, 1, 1,
0.1752043, 0.06649988, 2.443192, 1, 1, 1, 1, 1,
0.1777278, -0.1143694, 2.993905, 1, 1, 1, 1, 1,
0.1796697, -0.8423205, 2.760034, 1, 1, 1, 1, 1,
0.1822814, 0.2814509, 2.021252, 1, 1, 1, 1, 1,
0.1836012, -0.3125152, 3.041828, 1, 1, 1, 1, 1,
0.1844794, -0.2039598, 0.3091907, 1, 1, 1, 1, 1,
0.189201, 1.056454, 0.4086925, 1, 1, 1, 1, 1,
0.1898988, 0.3625644, 0.7046129, 1, 1, 1, 1, 1,
0.1924316, 0.4458831, -0.08854183, 1, 1, 1, 1, 1,
0.1930563, -0.2927701, 4.596641, 1, 1, 1, 1, 1,
0.19402, -0.3029936, 3.600657, 1, 1, 1, 1, 1,
0.1945533, 1.035779, -1.757002, 0, 0, 1, 1, 1,
0.1988939, -0.8481005, 3.702833, 1, 0, 0, 1, 1,
0.2004955, -1.171079, 2.898537, 1, 0, 0, 1, 1,
0.205258, -0.2917957, 1.14641, 1, 0, 0, 1, 1,
0.2061233, 1.631112, -1.338544, 1, 0, 0, 1, 1,
0.2070671, 1.62134, -0.5666907, 1, 0, 0, 1, 1,
0.2107769, 1.240731, 2.149645, 0, 0, 0, 1, 1,
0.2113784, 1.217687, -1.311366, 0, 0, 0, 1, 1,
0.2181911, 0.6763577, -0.9043949, 0, 0, 0, 1, 1,
0.218293, 1.17549, 1.068233, 0, 0, 0, 1, 1,
0.2249343, -0.8670008, 0.4919294, 0, 0, 0, 1, 1,
0.2259599, 0.9929184, 2.044987, 0, 0, 0, 1, 1,
0.231057, 0.3332367, 0.8300272, 0, 0, 0, 1, 1,
0.2314081, 0.1035915, 2.662088, 1, 1, 1, 1, 1,
0.2337323, -0.4369502, 2.552991, 1, 1, 1, 1, 1,
0.2343246, 0.764469, -1.008, 1, 1, 1, 1, 1,
0.2352302, -0.07049913, 2.385602, 1, 1, 1, 1, 1,
0.2362442, 0.8972614, 0.5808369, 1, 1, 1, 1, 1,
0.2392048, 0.3398358, 1.365657, 1, 1, 1, 1, 1,
0.2403993, 0.5296793, -0.06594258, 1, 1, 1, 1, 1,
0.2460625, -0.8784241, 4.170872, 1, 1, 1, 1, 1,
0.2463496, 0.4647794, 1.18119, 1, 1, 1, 1, 1,
0.250986, -1.000372, 2.678785, 1, 1, 1, 1, 1,
0.2516541, -3.052893, 3.279011, 1, 1, 1, 1, 1,
0.2547338, 0.6069067, 1.963406, 1, 1, 1, 1, 1,
0.2562336, -0.7104369, 3.990171, 1, 1, 1, 1, 1,
0.258491, 0.2646847, 1.543398, 1, 1, 1, 1, 1,
0.2591291, 0.698401, 1.756304, 1, 1, 1, 1, 1,
0.2592478, -0.07815827, 2.909289, 0, 0, 1, 1, 1,
0.2625729, -0.4177921, 4.671291, 1, 0, 0, 1, 1,
0.263084, -0.05258745, -0.2929236, 1, 0, 0, 1, 1,
0.2660497, 0.4357915, -0.1980633, 1, 0, 0, 1, 1,
0.268663, -1.537251, 3.501611, 1, 0, 0, 1, 1,
0.2686705, 0.5150341, -1.791845, 1, 0, 0, 1, 1,
0.2694972, -1.035011, 5.083941, 0, 0, 0, 1, 1,
0.273421, 0.8980528, 0.7440093, 0, 0, 0, 1, 1,
0.2759193, 0.09711677, 1.34582, 0, 0, 0, 1, 1,
0.2832577, 1.344863, -0.1141831, 0, 0, 0, 1, 1,
0.2850692, -0.3618105, 4.204855, 0, 0, 0, 1, 1,
0.2881151, -1.33416, 2.477846, 0, 0, 0, 1, 1,
0.2912661, -0.2773033, 0.4521075, 0, 0, 0, 1, 1,
0.2952852, 1.117591, -0.2785951, 1, 1, 1, 1, 1,
0.295695, 1.354519, -1.395182, 1, 1, 1, 1, 1,
0.2976626, -1.658519, 2.322011, 1, 1, 1, 1, 1,
0.2979652, -1.249942, 1.446312, 1, 1, 1, 1, 1,
0.2986596, -0.5457587, 2.857536, 1, 1, 1, 1, 1,
0.3027416, 0.2856408, 0.5724294, 1, 1, 1, 1, 1,
0.3040021, 0.08265744, 2.076444, 1, 1, 1, 1, 1,
0.3103966, 0.7274271, 1.8908, 1, 1, 1, 1, 1,
0.3112313, 0.4624188, 0.9442645, 1, 1, 1, 1, 1,
0.3194188, -0.6265569, 4.730201, 1, 1, 1, 1, 1,
0.3200432, -0.5568529, 2.966991, 1, 1, 1, 1, 1,
0.3202243, -0.6378125, 0.6453156, 1, 1, 1, 1, 1,
0.3228086, 0.8257468, 0.7457674, 1, 1, 1, 1, 1,
0.3244605, 1.347821, 1.385141, 1, 1, 1, 1, 1,
0.3273865, 0.2840765, 0.5339997, 1, 1, 1, 1, 1,
0.3298413, 0.857366, 0.9612331, 0, 0, 1, 1, 1,
0.330494, 0.6529862, 1.038392, 1, 0, 0, 1, 1,
0.3315789, 0.2415686, 0.2337417, 1, 0, 0, 1, 1,
0.3322881, -0.509986, 2.532335, 1, 0, 0, 1, 1,
0.3333653, 1.084257, 0.09350281, 1, 0, 0, 1, 1,
0.3351991, 0.5055646, -0.4054548, 1, 0, 0, 1, 1,
0.3353042, -1.729645, 5.556588, 0, 0, 0, 1, 1,
0.3365545, 0.7803186, -1.569721, 0, 0, 0, 1, 1,
0.3419033, 0.4357705, 2.068781, 0, 0, 0, 1, 1,
0.344758, 0.2691518, 1.733726, 0, 0, 0, 1, 1,
0.345761, 0.4809796, 0.2570223, 0, 0, 0, 1, 1,
0.3478744, -1.455974, 3.09346, 0, 0, 0, 1, 1,
0.3579505, -0.426189, 0.9277664, 0, 0, 0, 1, 1,
0.3585329, 0.2568026, 1.863382, 1, 1, 1, 1, 1,
0.3587418, -0.856797, 1.543435, 1, 1, 1, 1, 1,
0.3587501, -0.8506024, 3.747097, 1, 1, 1, 1, 1,
0.3616554, 1.122997, -0.2829283, 1, 1, 1, 1, 1,
0.3633957, 0.05158769, -0.4039564, 1, 1, 1, 1, 1,
0.372676, -0.3989406, 2.751205, 1, 1, 1, 1, 1,
0.3743522, 2.61956, 1.105683, 1, 1, 1, 1, 1,
0.3773049, -0.8447856, 3.479294, 1, 1, 1, 1, 1,
0.3774242, 0.4231037, 0.3377833, 1, 1, 1, 1, 1,
0.3786621, 1.046728, 0.03429718, 1, 1, 1, 1, 1,
0.3810574, 0.8542508, 1.626698, 1, 1, 1, 1, 1,
0.3858473, 0.09676902, 1.402748, 1, 1, 1, 1, 1,
0.3882153, -0.260142, 3.156856, 1, 1, 1, 1, 1,
0.389053, -1.593263, 3.202965, 1, 1, 1, 1, 1,
0.3904974, -0.07069215, 1.574015, 1, 1, 1, 1, 1,
0.3907786, 0.2189846, 1.552552, 0, 0, 1, 1, 1,
0.3944123, -0.7523568, 1.433547, 1, 0, 0, 1, 1,
0.3970524, -2.538491, 1.956432, 1, 0, 0, 1, 1,
0.3976574, -0.4752921, 2.472028, 1, 0, 0, 1, 1,
0.4025677, -0.4605513, 1.371798, 1, 0, 0, 1, 1,
0.4054318, -1.377418, 3.491182, 1, 0, 0, 1, 1,
0.4064735, -0.3378472, 2.611733, 0, 0, 0, 1, 1,
0.4130032, 0.6268656, -0.6529816, 0, 0, 0, 1, 1,
0.4159814, -2.473836, 3.880883, 0, 0, 0, 1, 1,
0.4170939, -0.1938074, 1.640378, 0, 0, 0, 1, 1,
0.4173993, 1.664302, 0.3418727, 0, 0, 0, 1, 1,
0.4195769, 1.254425, 0.2135367, 0, 0, 0, 1, 1,
0.4248459, 0.1855203, 0.8092713, 0, 0, 0, 1, 1,
0.4259265, -0.3028187, 2.233075, 1, 1, 1, 1, 1,
0.4267832, 1.52571, -0.9152223, 1, 1, 1, 1, 1,
0.4320452, 0.8788916, 0.9342291, 1, 1, 1, 1, 1,
0.4323068, -0.3581044, 3.669789, 1, 1, 1, 1, 1,
0.4330103, 0.1272069, 0.7094635, 1, 1, 1, 1, 1,
0.4353306, -0.7682106, 2.731286, 1, 1, 1, 1, 1,
0.4391371, 0.2271272, 0.4129271, 1, 1, 1, 1, 1,
0.4469273, 0.8226529, -0.1931679, 1, 1, 1, 1, 1,
0.4479282, -1.116844, 2.593137, 1, 1, 1, 1, 1,
0.4492049, -0.3531702, 2.529552, 1, 1, 1, 1, 1,
0.4494565, 0.1805596, 1.832798, 1, 1, 1, 1, 1,
0.449951, -0.4440702, 3.32843, 1, 1, 1, 1, 1,
0.4525635, 1.012605, 0.6676813, 1, 1, 1, 1, 1,
0.4533886, 0.1607153, 1.33168, 1, 1, 1, 1, 1,
0.4580902, 1.391209, 1.315377, 1, 1, 1, 1, 1,
0.461652, -1.152941, 3.224911, 0, 0, 1, 1, 1,
0.4640256, -1.0861, 4.792147, 1, 0, 0, 1, 1,
0.4652242, -1.871579, 2.257137, 1, 0, 0, 1, 1,
0.4678988, -0.1190616, 1.800267, 1, 0, 0, 1, 1,
0.4685283, -0.6194309, 2.329608, 1, 0, 0, 1, 1,
0.4717323, -0.7266303, 2.202699, 1, 0, 0, 1, 1,
0.4728802, -0.3466764, 1.252299, 0, 0, 0, 1, 1,
0.4770055, -0.432427, 0.08157793, 0, 0, 0, 1, 1,
0.478867, 0.8502598, 2.136821, 0, 0, 0, 1, 1,
0.4849914, 1.465471, 2.08505, 0, 0, 0, 1, 1,
0.4858449, 0.3285327, 1.0694, 0, 0, 0, 1, 1,
0.4874378, -0.560877, 2.669181, 0, 0, 0, 1, 1,
0.4892977, 0.2002357, 3.406323, 0, 0, 0, 1, 1,
0.4894778, -0.8226148, 2.744469, 1, 1, 1, 1, 1,
0.4902825, -0.3821037, 2.276157, 1, 1, 1, 1, 1,
0.4908723, 0.5311431, 1.513965, 1, 1, 1, 1, 1,
0.496018, 0.9405813, 0.7171733, 1, 1, 1, 1, 1,
0.499546, 2.360398, 0.1868437, 1, 1, 1, 1, 1,
0.5003683, 2.029674, -0.2153713, 1, 1, 1, 1, 1,
0.5011705, 0.500342, 0.7258006, 1, 1, 1, 1, 1,
0.5027362, 2.499035, -1.230749, 1, 1, 1, 1, 1,
0.5038746, 0.523805, 1.614595, 1, 1, 1, 1, 1,
0.5082563, 0.922892, 0.6623701, 1, 1, 1, 1, 1,
0.5106897, 1.462555, 1.511488, 1, 1, 1, 1, 1,
0.5113361, -0.1626457, 2.402781, 1, 1, 1, 1, 1,
0.5132533, -0.9020498, 2.895873, 1, 1, 1, 1, 1,
0.5162519, 1.354049, -1.900507, 1, 1, 1, 1, 1,
0.5164645, 0.3523554, 0.1075494, 1, 1, 1, 1, 1,
0.5206675, -0.1298369, 0.577582, 0, 0, 1, 1, 1,
0.5208345, 0.3430767, 0.9221398, 1, 0, 0, 1, 1,
0.5219211, 0.2319889, 3.031953, 1, 0, 0, 1, 1,
0.5230437, 0.1860279, 2.654627, 1, 0, 0, 1, 1,
0.523137, -0.6005248, 0.1160428, 1, 0, 0, 1, 1,
0.5254897, -0.3020813, 1.902807, 1, 0, 0, 1, 1,
0.5257438, 0.9273489, 0.160746, 0, 0, 0, 1, 1,
0.5315265, 0.7494983, 0.7177244, 0, 0, 0, 1, 1,
0.5322217, -0.6331476, 3.991339, 0, 0, 0, 1, 1,
0.532759, -0.5974373, 2.984308, 0, 0, 0, 1, 1,
0.5340146, 1.897502, 0.212774, 0, 0, 0, 1, 1,
0.5395582, -2.070012, 1.296052, 0, 0, 0, 1, 1,
0.5405923, 0.5202736, 0.6609784, 0, 0, 0, 1, 1,
0.5458382, -0.8611628, 2.131297, 1, 1, 1, 1, 1,
0.5481779, 0.2073765, 1.23459, 1, 1, 1, 1, 1,
0.5492414, 0.4061509, 0.8764236, 1, 1, 1, 1, 1,
0.5514234, -0.6268366, 1.827778, 1, 1, 1, 1, 1,
0.5524427, -2.148758, 2.818092, 1, 1, 1, 1, 1,
0.5524444, -1.038486, 1.346773, 1, 1, 1, 1, 1,
0.5545756, 0.1391287, 0.833635, 1, 1, 1, 1, 1,
0.5557797, -0.2898513, 2.789304, 1, 1, 1, 1, 1,
0.5569516, -1.2605, 3.019745, 1, 1, 1, 1, 1,
0.5572792, 0.1036948, 2.830354, 1, 1, 1, 1, 1,
0.5635945, 0.5461928, 0.2821928, 1, 1, 1, 1, 1,
0.5780219, -0.2990898, 3.20452, 1, 1, 1, 1, 1,
0.5786185, 1.018204, 0.8248339, 1, 1, 1, 1, 1,
0.5816263, -1.727892, 3.960873, 1, 1, 1, 1, 1,
0.5816513, 0.6897805, 0.8649629, 1, 1, 1, 1, 1,
0.5823529, 0.8245971, 0.5448157, 0, 0, 1, 1, 1,
0.5846789, 0.7446014, 1.674222, 1, 0, 0, 1, 1,
0.5881932, -1.321104, 4.181427, 1, 0, 0, 1, 1,
0.5964038, -1.126486, 2.400902, 1, 0, 0, 1, 1,
0.5976883, -0.188108, 1.072692, 1, 0, 0, 1, 1,
0.5979748, 0.7563443, -0.4998614, 1, 0, 0, 1, 1,
0.5997675, 0.8724301, 1.885983, 0, 0, 0, 1, 1,
0.6045765, -1.521749, 3.431157, 0, 0, 0, 1, 1,
0.6061343, -0.8958784, 1.222347, 0, 0, 0, 1, 1,
0.6088419, -1.211617, 3.150124, 0, 0, 0, 1, 1,
0.6093385, -0.1768318, 3.027006, 0, 0, 0, 1, 1,
0.6098176, 0.03415655, 1.393531, 0, 0, 0, 1, 1,
0.6179129, 0.01375157, 2.341104, 0, 0, 0, 1, 1,
0.6201717, 1.947595, 0.5028337, 1, 1, 1, 1, 1,
0.6212908, 1.899493, 0.1247831, 1, 1, 1, 1, 1,
0.6301035, 0.8261847, 1.464833, 1, 1, 1, 1, 1,
0.6309339, 0.4441496, 2.324409, 1, 1, 1, 1, 1,
0.6344036, -1.316281, 3.361862, 1, 1, 1, 1, 1,
0.6389422, -2.840514, 2.159549, 1, 1, 1, 1, 1,
0.6399204, 0.6501969, 0.3391838, 1, 1, 1, 1, 1,
0.6426131, -1.874436, 2.172686, 1, 1, 1, 1, 1,
0.6459995, 0.6483161, 0.7645987, 1, 1, 1, 1, 1,
0.6462712, 0.9854756, 0.4205588, 1, 1, 1, 1, 1,
0.6474328, -0.4123555, 4.188808, 1, 1, 1, 1, 1,
0.6477897, -0.8214867, 1.656168, 1, 1, 1, 1, 1,
0.6531861, 0.7464558, 1.809578, 1, 1, 1, 1, 1,
0.6536434, 0.6297481, -0.03650416, 1, 1, 1, 1, 1,
0.655485, 1.385157, 0.5554752, 1, 1, 1, 1, 1,
0.6592348, 0.4408683, 2.233263, 0, 0, 1, 1, 1,
0.6664439, 0.7288456, 3.15147, 1, 0, 0, 1, 1,
0.6698063, 0.6555744, 1.498154, 1, 0, 0, 1, 1,
0.6721555, -0.6882252, 2.680881, 1, 0, 0, 1, 1,
0.6754104, 1.283866, 0.1137393, 1, 0, 0, 1, 1,
0.6791331, 0.3369703, 2.415684, 1, 0, 0, 1, 1,
0.6825581, 0.385416, 0.7510018, 0, 0, 0, 1, 1,
0.6938432, 1.14799, 1.62843, 0, 0, 0, 1, 1,
0.6947821, 0.3867139, 1.778676, 0, 0, 0, 1, 1,
0.6983121, -1.28878, 3.790421, 0, 0, 0, 1, 1,
0.7073326, 0.2168533, 0.1076273, 0, 0, 0, 1, 1,
0.7109155, 1.507266, -0.6087009, 0, 0, 0, 1, 1,
0.7114618, -0.8961844, 1.772012, 0, 0, 0, 1, 1,
0.7133489, 0.1486042, -0.5718032, 1, 1, 1, 1, 1,
0.7137401, 0.9020807, 0.02932819, 1, 1, 1, 1, 1,
0.7210779, 0.1615469, 1.211224, 1, 1, 1, 1, 1,
0.7361056, 0.4172326, -0.7006585, 1, 1, 1, 1, 1,
0.7382874, 0.4201845, 2.598397, 1, 1, 1, 1, 1,
0.7493209, 0.6406237, -0.3991736, 1, 1, 1, 1, 1,
0.7608393, -0.9109459, 1.481399, 1, 1, 1, 1, 1,
0.7610905, 0.1448534, 2.633278, 1, 1, 1, 1, 1,
0.7622699, 1.271289, 1.371253, 1, 1, 1, 1, 1,
0.7653946, 0.5160692, 0.6472164, 1, 1, 1, 1, 1,
0.7666538, -1.490864, 2.632719, 1, 1, 1, 1, 1,
0.7706978, -0.3094185, 3.737988, 1, 1, 1, 1, 1,
0.7728797, -0.4104487, 1.073095, 1, 1, 1, 1, 1,
0.7743171, 2.225176, 1.290991, 1, 1, 1, 1, 1,
0.7756142, 0.1160934, -0.04318737, 1, 1, 1, 1, 1,
0.7786595, -0.1358318, 1.416677, 0, 0, 1, 1, 1,
0.7809026, 0.1829611, 1.399408, 1, 0, 0, 1, 1,
0.78299, -0.755807, 1.146949, 1, 0, 0, 1, 1,
0.7835419, 0.304608, 0.7480534, 1, 0, 0, 1, 1,
0.7837219, 1.297603, 0.2053454, 1, 0, 0, 1, 1,
0.7847615, -1.897254, 2.237749, 1, 0, 0, 1, 1,
0.7867385, -0.5789073, 1.656884, 0, 0, 0, 1, 1,
0.7868619, -2.673146, 5.519474, 0, 0, 0, 1, 1,
0.7882267, -0.7637486, 0.1094272, 0, 0, 0, 1, 1,
0.7964985, -0.2254585, 2.114972, 0, 0, 0, 1, 1,
0.7976586, -0.9025272, 1.325564, 0, 0, 0, 1, 1,
0.8005357, -0.1522349, 1.055936, 0, 0, 0, 1, 1,
0.8065549, 0.3715017, 0.8120456, 0, 0, 0, 1, 1,
0.8177351, -0.1011051, 1.75355, 1, 1, 1, 1, 1,
0.8181018, -1.390618, 1.477873, 1, 1, 1, 1, 1,
0.8203812, 0.4360771, 2.343839, 1, 1, 1, 1, 1,
0.8244249, -1.871891, 2.523991, 1, 1, 1, 1, 1,
0.8322388, 0.0936741, 1.368032, 1, 1, 1, 1, 1,
0.8341532, 0.2171407, 2.23269, 1, 1, 1, 1, 1,
0.8440461, 1.023163, 1.105742, 1, 1, 1, 1, 1,
0.8484145, -0.2501469, 1.318635, 1, 1, 1, 1, 1,
0.8495654, -2.354759, 1.960201, 1, 1, 1, 1, 1,
0.8532181, 0.5496282, 0.7516257, 1, 1, 1, 1, 1,
0.8743612, 0.2270415, -0.3317686, 1, 1, 1, 1, 1,
0.8896202, 0.6363617, 1.426965, 1, 1, 1, 1, 1,
0.891276, 2.263793, 0.04144125, 1, 1, 1, 1, 1,
0.8961598, 0.8686715, 0.004233146, 1, 1, 1, 1, 1,
0.8968151, 0.6922687, -1.094065, 1, 1, 1, 1, 1,
0.8974625, 0.7921146, 1.317308, 0, 0, 1, 1, 1,
0.9040001, -0.2288711, 2.098015, 1, 0, 0, 1, 1,
0.9046387, 2.89669, -0.1116491, 1, 0, 0, 1, 1,
0.9071806, 1.335892, -0.09939634, 1, 0, 0, 1, 1,
0.9085574, 0.2907376, 1.216742, 1, 0, 0, 1, 1,
0.9134803, -1.45108, 3.905711, 1, 0, 0, 1, 1,
0.9191262, -0.1665547, 1.154631, 0, 0, 0, 1, 1,
0.9217898, 0.286125, 0.5010182, 0, 0, 0, 1, 1,
0.9277236, 0.4240891, 0.4552175, 0, 0, 0, 1, 1,
0.9279022, -1.838332, 3.72009, 0, 0, 0, 1, 1,
0.932196, 0.4266173, -0.4645979, 0, 0, 0, 1, 1,
0.9443755, -0.8068281, 0.5204087, 0, 0, 0, 1, 1,
0.9527338, 2.841768, -0.8644792, 0, 0, 0, 1, 1,
0.9540986, 1.18064, 1.331943, 1, 1, 1, 1, 1,
0.9546777, -1.04706, 2.762221, 1, 1, 1, 1, 1,
0.9577764, -0.4974224, 4.318378, 1, 1, 1, 1, 1,
0.9585244, -0.6375983, 0.3294141, 1, 1, 1, 1, 1,
0.9649256, 1.829529, 0.64742, 1, 1, 1, 1, 1,
0.9669434, 0.6328273, 2.001657, 1, 1, 1, 1, 1,
0.9913489, 0.5798811, 1.248315, 1, 1, 1, 1, 1,
0.9947371, -0.50359, 3.232064, 1, 1, 1, 1, 1,
0.9954525, -0.9167989, 2.614299, 1, 1, 1, 1, 1,
0.997606, -1.623838, 0.618145, 1, 1, 1, 1, 1,
0.998428, 0.8337188, 1.053728, 1, 1, 1, 1, 1,
1.00941, 1.0249, 0.1877781, 1, 1, 1, 1, 1,
1.010755, 0.2907184, 2.512894, 1, 1, 1, 1, 1,
1.016172, 0.6355317, 2.391093, 1, 1, 1, 1, 1,
1.024803, 0.3743038, 1.408723, 1, 1, 1, 1, 1,
1.028443, 0.3150463, -0.2115389, 0, 0, 1, 1, 1,
1.029592, 2.443964, 0.7839876, 1, 0, 0, 1, 1,
1.034264, -0.8455468, 1.833586, 1, 0, 0, 1, 1,
1.04253, 0.9282072, 1.797156, 1, 0, 0, 1, 1,
1.052801, -0.06768519, 2.198099, 1, 0, 0, 1, 1,
1.053204, 0.005204733, 2.016895, 1, 0, 0, 1, 1,
1.058789, 0.5925545, 1.594046, 0, 0, 0, 1, 1,
1.059371, -1.070665, 1.611219, 0, 0, 0, 1, 1,
1.059747, -0.735872, 0.9379539, 0, 0, 0, 1, 1,
1.062346, -0.4616879, 3.321868, 0, 0, 0, 1, 1,
1.063344, 1.736392, 0.2232355, 0, 0, 0, 1, 1,
1.065814, -1.924924, 2.17175, 0, 0, 0, 1, 1,
1.067212, 0.2672657, 0.8042337, 0, 0, 0, 1, 1,
1.068507, -0.2061108, 1.359315, 1, 1, 1, 1, 1,
1.068817, -0.03001973, 3.654465, 1, 1, 1, 1, 1,
1.075285, -0.4492551, 1.983147, 1, 1, 1, 1, 1,
1.075878, 1.32626, 1.387881, 1, 1, 1, 1, 1,
1.080275, -0.09773258, 1.622208, 1, 1, 1, 1, 1,
1.082964, 0.2134813, 1.400314, 1, 1, 1, 1, 1,
1.084745, 1.995422, 1.309652, 1, 1, 1, 1, 1,
1.093806, 1.534243, 1.336454, 1, 1, 1, 1, 1,
1.103065, -1.081012, 1.829707, 1, 1, 1, 1, 1,
1.103752, -0.3121285, 1.873366, 1, 1, 1, 1, 1,
1.112717, 0.6816786, -0.937143, 1, 1, 1, 1, 1,
1.112985, -0.7093624, 2.94054, 1, 1, 1, 1, 1,
1.114734, 1.120544, -0.6865121, 1, 1, 1, 1, 1,
1.122828, -3.031362, 2.381458, 1, 1, 1, 1, 1,
1.128526, -0.5865677, 1.432329, 1, 1, 1, 1, 1,
1.135441, 1.273651, 0.9694567, 0, 0, 1, 1, 1,
1.13773, -1.808133, 2.229341, 1, 0, 0, 1, 1,
1.138053, 2.153019, 0.5368518, 1, 0, 0, 1, 1,
1.145964, -0.1789278, 2.00442, 1, 0, 0, 1, 1,
1.146687, 0.4733449, 1.886725, 1, 0, 0, 1, 1,
1.147484, 0.07693337, 2.325791, 1, 0, 0, 1, 1,
1.151452, 0.7852412, 1.705284, 0, 0, 0, 1, 1,
1.154599, 1.779481, 1.23163, 0, 0, 0, 1, 1,
1.15518, 0.426663, 1.714869, 0, 0, 0, 1, 1,
1.160225, 0.3206303, 1.964479, 0, 0, 0, 1, 1,
1.171928, -2.522721, 1.372087, 0, 0, 0, 1, 1,
1.17286, 1.525911, 0.1894442, 0, 0, 0, 1, 1,
1.172869, 1.171676, 0.428472, 0, 0, 0, 1, 1,
1.176707, 0.3800712, -0.7101939, 1, 1, 1, 1, 1,
1.185834, -1.403997, 1.410312, 1, 1, 1, 1, 1,
1.187497, -0.121741, 2.148566, 1, 1, 1, 1, 1,
1.193427, 0.03320954, 0.5373268, 1, 1, 1, 1, 1,
1.194589, 0.3849003, 0.9702513, 1, 1, 1, 1, 1,
1.196553, -1.025136, 1.376874, 1, 1, 1, 1, 1,
1.197583, -1.275343, 3.379563, 1, 1, 1, 1, 1,
1.206944, -1.224162, 2.897044, 1, 1, 1, 1, 1,
1.215219, -0.1562766, 1.10711, 1, 1, 1, 1, 1,
1.215362, 0.02299987, 2.937181, 1, 1, 1, 1, 1,
1.218152, 1.001134, 1.477296, 1, 1, 1, 1, 1,
1.228002, 0.08627978, 0.8498906, 1, 1, 1, 1, 1,
1.231889, -0.4896995, 3.095715, 1, 1, 1, 1, 1,
1.238728, 0.9725963, 2.322298, 1, 1, 1, 1, 1,
1.23912, 1.240456, -0.5459974, 1, 1, 1, 1, 1,
1.244012, 2.071996, -0.7486938, 0, 0, 1, 1, 1,
1.25299, -0.3543599, 0.2547067, 1, 0, 0, 1, 1,
1.254797, -0.0384874, 0.9298018, 1, 0, 0, 1, 1,
1.254985, -1.629853, 3.894678, 1, 0, 0, 1, 1,
1.255447, 0.8424855, 0.4344522, 1, 0, 0, 1, 1,
1.259307, 0.6406973, 0.4987819, 1, 0, 0, 1, 1,
1.268135, 0.1402321, 0.9746627, 0, 0, 0, 1, 1,
1.272472, 1.636745, -2.804667, 0, 0, 0, 1, 1,
1.274198, 2.356909, -0.6181991, 0, 0, 0, 1, 1,
1.296543, -0.9027649, 2.767282, 0, 0, 0, 1, 1,
1.303847, -0.4345262, 3.067912, 0, 0, 0, 1, 1,
1.30716, 0.4102627, 0.3683617, 0, 0, 0, 1, 1,
1.315967, 1.242126, 1.206812, 0, 0, 0, 1, 1,
1.327474, 0.7994675, 0.2069188, 1, 1, 1, 1, 1,
1.336748, 0.8693355, 1.369906, 1, 1, 1, 1, 1,
1.3524, 2.685319, -0.1480698, 1, 1, 1, 1, 1,
1.353735, -1.426714, 2.659341, 1, 1, 1, 1, 1,
1.365535, -0.6586483, -0.3349976, 1, 1, 1, 1, 1,
1.36813, -0.2192743, 2.128808, 1, 1, 1, 1, 1,
1.37418, 0.2336426, 0.7087792, 1, 1, 1, 1, 1,
1.395981, -2.104995, 2.618322, 1, 1, 1, 1, 1,
1.405055, 1.15177, 1.961503, 1, 1, 1, 1, 1,
1.418055, -1.615498, 3.679065, 1, 1, 1, 1, 1,
1.424108, -1.012918, 3.354676, 1, 1, 1, 1, 1,
1.426726, -0.435296, 2.819694, 1, 1, 1, 1, 1,
1.430727, 0.2335611, 1.134123, 1, 1, 1, 1, 1,
1.432538, 0.2893104, 2.890094, 1, 1, 1, 1, 1,
1.449024, -0.7825162, 0.9493477, 1, 1, 1, 1, 1,
1.463626, 0.6454833, -0.05792053, 0, 0, 1, 1, 1,
1.466375, -0.6706611, -0.3190104, 1, 0, 0, 1, 1,
1.47173, 1.033245, 2.4276, 1, 0, 0, 1, 1,
1.491862, 0.3130501, 2.472946, 1, 0, 0, 1, 1,
1.496559, 1.074, 0.7022317, 1, 0, 0, 1, 1,
1.507426, -0.6489833, 2.451249, 1, 0, 0, 1, 1,
1.514952, 2.028133, -0.3678355, 0, 0, 0, 1, 1,
1.521142, 1.373219, 0.7777988, 0, 0, 0, 1, 1,
1.521792, 1.186818, 0.2183488, 0, 0, 0, 1, 1,
1.536895, 1.826681, -0.402425, 0, 0, 0, 1, 1,
1.548825, -0.8292577, 2.015219, 0, 0, 0, 1, 1,
1.554883, -0.7478642, 3.001038, 0, 0, 0, 1, 1,
1.569118, -0.1395846, 0.4234785, 0, 0, 0, 1, 1,
1.584679, -1.536473, 2.128891, 1, 1, 1, 1, 1,
1.595411, -2.085907, 2.943334, 1, 1, 1, 1, 1,
1.631463, 2.109323, 1.199786, 1, 1, 1, 1, 1,
1.667981, 1.068467, 0.9787993, 1, 1, 1, 1, 1,
1.699629, 0.7965151, 0.9012582, 1, 1, 1, 1, 1,
1.72078, -0.3920716, 1.986782, 1, 1, 1, 1, 1,
1.723672, 0.6779411, 2.163271, 1, 1, 1, 1, 1,
1.732365, -0.7714692, 2.606381, 1, 1, 1, 1, 1,
1.734353, -0.2751788, 2.190264, 1, 1, 1, 1, 1,
1.750327, -1.822132, 3.635958, 1, 1, 1, 1, 1,
1.752276, -0.8689827, 2.055132, 1, 1, 1, 1, 1,
1.763588, -0.07072037, -0.7333159, 1, 1, 1, 1, 1,
1.783559, 1.009736, 0.9548062, 1, 1, 1, 1, 1,
1.789191, 1.477978, 1.580292, 1, 1, 1, 1, 1,
1.804008, -0.7308463, -0.3732276, 1, 1, 1, 1, 1,
1.806128, -0.721899, 1.842885, 0, 0, 1, 1, 1,
1.811728, -1.694815, 2.385101, 1, 0, 0, 1, 1,
1.812648, -0.4384435, 0.6854126, 1, 0, 0, 1, 1,
1.81375, -0.665198, 2.777676, 1, 0, 0, 1, 1,
1.829784, -0.3846494, 0.3062869, 1, 0, 0, 1, 1,
1.833117, 0.2933463, 2.542948, 1, 0, 0, 1, 1,
1.837313, -0.1045484, 2.129739, 0, 0, 0, 1, 1,
1.847564, -0.9565192, 1.218365, 0, 0, 0, 1, 1,
1.848583, -1.078441, 1.871207, 0, 0, 0, 1, 1,
1.859718, -0.6119137, 1.73641, 0, 0, 0, 1, 1,
1.896747, 0.1232875, 1.852333, 0, 0, 0, 1, 1,
1.898396, -1.603317, 1.938436, 0, 0, 0, 1, 1,
1.899755, 0.983424, 2.533405, 0, 0, 0, 1, 1,
1.951679, -0.9027866, 1.479216, 1, 1, 1, 1, 1,
1.973313, 0.933037, 1.395977, 1, 1, 1, 1, 1,
1.98022, -1.250562, 3.433223, 1, 1, 1, 1, 1,
1.989521, 0.06814088, 2.046022, 1, 1, 1, 1, 1,
1.998233, -1.30853, 3.147248, 1, 1, 1, 1, 1,
1.998419, 1.173547, 1.474386, 1, 1, 1, 1, 1,
1.998811, -0.06179232, 1.222113, 1, 1, 1, 1, 1,
1.9999, 1.189951, 2.774499, 1, 1, 1, 1, 1,
2.01907, -1.267639, 1.915008, 1, 1, 1, 1, 1,
2.019325, 1.255369, 0.7348075, 1, 1, 1, 1, 1,
2.049337, 1.043355, 1.779454, 1, 1, 1, 1, 1,
2.054101, -0.8943428, 1.321312, 1, 1, 1, 1, 1,
2.088543, -0.7148295, 1.395366, 1, 1, 1, 1, 1,
2.112622, -0.7516462, 1.251701, 1, 1, 1, 1, 1,
2.141732, -0.9697982, 0.3474266, 1, 1, 1, 1, 1,
2.211444, -0.3474599, 2.463882, 0, 0, 1, 1, 1,
2.219221, 0.6587746, 1.358807, 1, 0, 0, 1, 1,
2.234411, -0.1354235, 0.5952393, 1, 0, 0, 1, 1,
2.238169, -0.4977466, 2.184446, 1, 0, 0, 1, 1,
2.252625, 0.8889142, 1.285509, 1, 0, 0, 1, 1,
2.321074, 0.241482, 1.847355, 1, 0, 0, 1, 1,
2.343709, 0.4093634, 0.6996464, 0, 0, 0, 1, 1,
2.355655, -0.07563086, 3.175393, 0, 0, 0, 1, 1,
2.381936, 1.129988, 3.819168, 0, 0, 0, 1, 1,
2.388119, 1.072602, -1.118111, 0, 0, 0, 1, 1,
2.390144, 0.6607339, 0.857066, 0, 0, 0, 1, 1,
2.460285, -0.8316172, -0.3970308, 0, 0, 0, 1, 1,
2.477214, 1.115558, 0.6868173, 0, 0, 0, 1, 1,
2.479631, 0.03958896, 1.419776, 1, 1, 1, 1, 1,
2.485769, 0.6469709, 2.865408, 1, 1, 1, 1, 1,
2.502702, 1.374506, 0.839164, 1, 1, 1, 1, 1,
2.601363, -0.9217492, 3.756908, 1, 1, 1, 1, 1,
2.634701, -1.056025, 1.719565, 1, 1, 1, 1, 1,
2.841016, 0.2901317, 2.38998, 1, 1, 1, 1, 1,
2.891748, 0.1122257, 3.548013, 1, 1, 1, 1, 1
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
var radius = 10.15091;
var distance = 35.65466;
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
mvMatrix.translate( 1.125106, 0.04816365, -0.193294 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.65466);
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