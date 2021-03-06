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
-2.996544, 0.5055264, -0.9010482, 1, 0, 0, 1,
-2.995128, 1.960581, -0.8740926, 1, 0.007843138, 0, 1,
-2.966454, 1.843967, 0.6455047, 1, 0.01176471, 0, 1,
-2.919805, 0.7952949, -1.58026, 1, 0.01960784, 0, 1,
-2.733328, 0.3837595, -1.203132, 1, 0.02352941, 0, 1,
-2.655473, -0.1912205, -2.032358, 1, 0.03137255, 0, 1,
-2.59003, -1.176192, -3.154407, 1, 0.03529412, 0, 1,
-2.465168, -0.1529875, -2.294345, 1, 0.04313726, 0, 1,
-2.392075, 0.8104742, -0.8440191, 1, 0.04705882, 0, 1,
-2.367069, 1.815214, -0.8069599, 1, 0.05490196, 0, 1,
-2.355965, -0.08830578, -1.551723, 1, 0.05882353, 0, 1,
-2.239081, -0.1292244, -2.149725, 1, 0.06666667, 0, 1,
-2.211411, -1.375562, -1.123016, 1, 0.07058824, 0, 1,
-2.207133, 0.929168, 0.9803864, 1, 0.07843138, 0, 1,
-2.1616, 0.5319921, -2.245792, 1, 0.08235294, 0, 1,
-2.146025, -0.03193083, -2.998303, 1, 0.09019608, 0, 1,
-2.121347, 0.2415131, 0.614056, 1, 0.09411765, 0, 1,
-2.070589, 0.9911792, -0.206775, 1, 0.1019608, 0, 1,
-2.060567, 2.175321, -0.8312182, 1, 0.1098039, 0, 1,
-2.05162, -1.077778, -1.364839, 1, 0.1137255, 0, 1,
-2.033249, 0.343675, -2.371435, 1, 0.1215686, 0, 1,
-2.018143, 0.961746, -2.311904, 1, 0.1254902, 0, 1,
-1.974206, 0.6311355, -1.946319, 1, 0.1333333, 0, 1,
-1.917758, -0.01683114, -1.220636, 1, 0.1372549, 0, 1,
-1.853464, 1.580513, -2.095104, 1, 0.145098, 0, 1,
-1.843618, 0.5977005, 0.9160782, 1, 0.1490196, 0, 1,
-1.843284, -0.3088451, -1.101522, 1, 0.1568628, 0, 1,
-1.774686, 0.3045758, -0.1617683, 1, 0.1607843, 0, 1,
-1.770952, 0.339722, -2.074843, 1, 0.1686275, 0, 1,
-1.753598, 0.2160684, -1.065033, 1, 0.172549, 0, 1,
-1.747273, -1.566088, -1.445335, 1, 0.1803922, 0, 1,
-1.746221, -0.3084273, -2.112527, 1, 0.1843137, 0, 1,
-1.738119, -0.1981707, -3.747652, 1, 0.1921569, 0, 1,
-1.724811, -0.1037028, -1.316978, 1, 0.1960784, 0, 1,
-1.7244, 0.2959496, -1.035029, 1, 0.2039216, 0, 1,
-1.722395, 0.503823, -0.7093589, 1, 0.2117647, 0, 1,
-1.7068, 0.5373681, -2.361005, 1, 0.2156863, 0, 1,
-1.687705, 2.214061, -1.150326, 1, 0.2235294, 0, 1,
-1.685001, 0.2181026, -2.481043, 1, 0.227451, 0, 1,
-1.684631, -0.4601367, -1.464221, 1, 0.2352941, 0, 1,
-1.670011, -1.920413, -1.952863, 1, 0.2392157, 0, 1,
-1.657037, 1.080437, -3.866463, 1, 0.2470588, 0, 1,
-1.641582, -0.9140051, -0.6797346, 1, 0.2509804, 0, 1,
-1.636134, -1.120021, -3.449178, 1, 0.2588235, 0, 1,
-1.635919, 1.394596, 0.02256783, 1, 0.2627451, 0, 1,
-1.630874, 0.4787149, -0.4323221, 1, 0.2705882, 0, 1,
-1.627637, 0.1600265, -2.745231, 1, 0.2745098, 0, 1,
-1.593191, -1.796377, -3.350243, 1, 0.282353, 0, 1,
-1.587202, 0.8381529, -1.464852, 1, 0.2862745, 0, 1,
-1.551652, 0.5459189, -2.798622, 1, 0.2941177, 0, 1,
-1.544518, 1.239529, -0.8026854, 1, 0.3019608, 0, 1,
-1.543961, -0.3195053, -4.060169, 1, 0.3058824, 0, 1,
-1.543428, 0.0850241, -1.986635, 1, 0.3137255, 0, 1,
-1.533279, -0.8276996, -0.7653184, 1, 0.3176471, 0, 1,
-1.523806, -0.3882925, -1.507802, 1, 0.3254902, 0, 1,
-1.513046, -1.352757, -2.829377, 1, 0.3294118, 0, 1,
-1.512462, -0.2344847, -0.773227, 1, 0.3372549, 0, 1,
-1.508969, -0.2321479, -1.248701, 1, 0.3411765, 0, 1,
-1.503666, -0.2969417, -1.766475, 1, 0.3490196, 0, 1,
-1.497342, 1.087804, -0.3169007, 1, 0.3529412, 0, 1,
-1.492862, -0.2597589, -1.949358, 1, 0.3607843, 0, 1,
-1.488176, 1.272594, -0.8276015, 1, 0.3647059, 0, 1,
-1.470713, -0.4976558, -2.969135, 1, 0.372549, 0, 1,
-1.456061, -1.290757, -2.380296, 1, 0.3764706, 0, 1,
-1.44959, -0.3355432, -3.446284, 1, 0.3843137, 0, 1,
-1.439299, 0.166677, -4.108213, 1, 0.3882353, 0, 1,
-1.424891, 0.1834455, 0.106966, 1, 0.3960784, 0, 1,
-1.414117, 1.460172, -0.4564122, 1, 0.4039216, 0, 1,
-1.413829, -0.4654235, -1.0734, 1, 0.4078431, 0, 1,
-1.409478, 0.2884036, -1.550324, 1, 0.4156863, 0, 1,
-1.400601, 0.7653809, -2.680694, 1, 0.4196078, 0, 1,
-1.400173, 0.7926008, -2.10481, 1, 0.427451, 0, 1,
-1.394235, -0.5780184, -3.440918, 1, 0.4313726, 0, 1,
-1.393022, -0.4123164, -3.02336, 1, 0.4392157, 0, 1,
-1.391824, 0.3629598, -0.6721522, 1, 0.4431373, 0, 1,
-1.387371, 0.09106074, -1.974847, 1, 0.4509804, 0, 1,
-1.386596, 0.1577573, -3.564774, 1, 0.454902, 0, 1,
-1.380139, -1.326341, -2.370319, 1, 0.4627451, 0, 1,
-1.380055, -1.243329, -1.98846, 1, 0.4666667, 0, 1,
-1.377272, 0.0124583, -2.134888, 1, 0.4745098, 0, 1,
-1.373433, 0.5639815, -0.5005335, 1, 0.4784314, 0, 1,
-1.368866, 0.3191074, -2.451883, 1, 0.4862745, 0, 1,
-1.363856, -0.7118226, -2.908008, 1, 0.4901961, 0, 1,
-1.354301, 1.171019, -1.011733, 1, 0.4980392, 0, 1,
-1.353386, -0.4626962, -1.758101, 1, 0.5058824, 0, 1,
-1.342949, -0.9101348, -2.649093, 1, 0.509804, 0, 1,
-1.34286, 0.2168157, 0.04950385, 1, 0.5176471, 0, 1,
-1.340712, 1.120566, -2.235939, 1, 0.5215687, 0, 1,
-1.33794, -0.1952609, -1.672042, 1, 0.5294118, 0, 1,
-1.329528, -0.9086605, -2.989458, 1, 0.5333334, 0, 1,
-1.320431, -1.287919, -1.357724, 1, 0.5411765, 0, 1,
-1.310889, -0.8346394, -2.433831, 1, 0.5450981, 0, 1,
-1.309303, 0.7067284, -1.029986, 1, 0.5529412, 0, 1,
-1.307909, 1.244407, -0.9174016, 1, 0.5568628, 0, 1,
-1.302449, 0.9300924, -0.144969, 1, 0.5647059, 0, 1,
-1.29404, 2.456992, -0.6960923, 1, 0.5686275, 0, 1,
-1.28497, -0.9492741, -3.870394, 1, 0.5764706, 0, 1,
-1.271441, 2.752726, -1.5654, 1, 0.5803922, 0, 1,
-1.261201, -0.5118011, -2.963709, 1, 0.5882353, 0, 1,
-1.259334, 0.5144543, -0.9298806, 1, 0.5921569, 0, 1,
-1.246605, -0.3992657, -1.729136, 1, 0.6, 0, 1,
-1.240273, -0.6147729, -2.763091, 1, 0.6078432, 0, 1,
-1.239756, 0.4249559, -1.748547, 1, 0.6117647, 0, 1,
-1.230015, 0.2462828, -1.740237, 1, 0.6196079, 0, 1,
-1.226362, -0.1883907, -1.738815, 1, 0.6235294, 0, 1,
-1.223265, -1.527968, -1.862418, 1, 0.6313726, 0, 1,
-1.207384, -0.399754, -0.9389372, 1, 0.6352941, 0, 1,
-1.206398, -0.1534103, -0.2962505, 1, 0.6431373, 0, 1,
-1.198103, -0.3843745, -0.8564211, 1, 0.6470588, 0, 1,
-1.186096, -1.073509, -3.407858, 1, 0.654902, 0, 1,
-1.183198, 0.6306531, -1.713326, 1, 0.6588235, 0, 1,
-1.174904, 0.6939042, -0.920887, 1, 0.6666667, 0, 1,
-1.167224, 1.428369, -1.122905, 1, 0.6705883, 0, 1,
-1.156525, 0.9365892, -1.390194, 1, 0.6784314, 0, 1,
-1.155962, -0.08846419, -1.187674, 1, 0.682353, 0, 1,
-1.155062, -1.558254, -2.274212, 1, 0.6901961, 0, 1,
-1.153831, 0.4086365, -0.7523263, 1, 0.6941177, 0, 1,
-1.153582, -1.124142, -2.663817, 1, 0.7019608, 0, 1,
-1.146645, -0.7373379, -1.408076, 1, 0.7098039, 0, 1,
-1.144783, 0.3715941, -1.231492, 1, 0.7137255, 0, 1,
-1.141154, -0.2427696, -2.002674, 1, 0.7215686, 0, 1,
-1.141042, 0.3661565, -0.3802266, 1, 0.7254902, 0, 1,
-1.13938, -0.2357077, -2.367111, 1, 0.7333333, 0, 1,
-1.134748, -1.349558, -3.055827, 1, 0.7372549, 0, 1,
-1.132607, -0.8922423, -1.474826, 1, 0.7450981, 0, 1,
-1.131564, -3.085998, -1.153721, 1, 0.7490196, 0, 1,
-1.131206, -0.1862974, -1.288457, 1, 0.7568628, 0, 1,
-1.130989, -1.702864, -3.338148, 1, 0.7607843, 0, 1,
-1.119987, 0.282495, -0.6573249, 1, 0.7686275, 0, 1,
-1.117679, -1.283816, -3.330811, 1, 0.772549, 0, 1,
-1.117259, -0.5141819, -2.431509, 1, 0.7803922, 0, 1,
-1.11589, 0.6789848, -0.5439033, 1, 0.7843137, 0, 1,
-1.114089, 0.2165439, 0.01117151, 1, 0.7921569, 0, 1,
-1.108499, -0.1015624, -1.186635, 1, 0.7960784, 0, 1,
-1.102487, -0.9675686, -2.596972, 1, 0.8039216, 0, 1,
-1.100106, 1.171434, -1.822754, 1, 0.8117647, 0, 1,
-1.094485, 1.832927, -0.1848014, 1, 0.8156863, 0, 1,
-1.09246, -0.5286037, -1.296945, 1, 0.8235294, 0, 1,
-1.088639, -0.6287678, -1.22088, 1, 0.827451, 0, 1,
-1.069344, 1.432211, 1.147778, 1, 0.8352941, 0, 1,
-1.06885, 0.05752352, -0.6495632, 1, 0.8392157, 0, 1,
-1.068582, 0.04346628, -2.302788, 1, 0.8470588, 0, 1,
-1.064795, -0.3511315, -1.970097, 1, 0.8509804, 0, 1,
-1.063759, 1.164635, -0.6859937, 1, 0.8588235, 0, 1,
-1.0633, 0.6506063, -1.853476, 1, 0.8627451, 0, 1,
-1.056522, -1.59814, -1.007311, 1, 0.8705882, 0, 1,
-1.051706, -0.6387867, -2.46753, 1, 0.8745098, 0, 1,
-1.039763, -0.07782069, -2.799059, 1, 0.8823529, 0, 1,
-1.025527, -2.444459, -2.807632, 1, 0.8862745, 0, 1,
-1.023699, 0.2073359, -2.72166, 1, 0.8941177, 0, 1,
-1.018353, 0.6164974, -1.097437, 1, 0.8980392, 0, 1,
-1.00888, 0.005815914, -0.04383309, 1, 0.9058824, 0, 1,
-0.9955634, -0.1734079, -1.35825, 1, 0.9137255, 0, 1,
-0.9933931, 0.6316749, -1.859867, 1, 0.9176471, 0, 1,
-0.9895088, -0.1677957, -2.866716, 1, 0.9254902, 0, 1,
-0.9872544, -0.6252199, -3.586971, 1, 0.9294118, 0, 1,
-0.98721, -1.074891, -2.129014, 1, 0.9372549, 0, 1,
-0.9854737, -0.8316692, -3.015609, 1, 0.9411765, 0, 1,
-0.9808989, 1.367981, -0.1555569, 1, 0.9490196, 0, 1,
-0.9770242, -1.380729, -2.673713, 1, 0.9529412, 0, 1,
-0.9756903, -0.3164068, -3.71626, 1, 0.9607843, 0, 1,
-0.9730737, 1.75201, -2.144987, 1, 0.9647059, 0, 1,
-0.9708748, 1.132591, -0.7159218, 1, 0.972549, 0, 1,
-0.9647208, -0.1925976, -2.388391, 1, 0.9764706, 0, 1,
-0.9607164, 1.727809, -2.606863, 1, 0.9843137, 0, 1,
-0.9591078, 0.1653613, -1.046837, 1, 0.9882353, 0, 1,
-0.956883, 0.2834834, -1.258174, 1, 0.9960784, 0, 1,
-0.9562519, 0.6812488, -0.434491, 0.9960784, 1, 0, 1,
-0.9523273, -0.7120653, -2.92214, 0.9921569, 1, 0, 1,
-0.95047, -0.7627901, -1.262714, 0.9843137, 1, 0, 1,
-0.9485573, 0.4562136, -2.629645, 0.9803922, 1, 0, 1,
-0.9445531, 1.499602, -0.1058212, 0.972549, 1, 0, 1,
-0.9366243, -1.539256, -2.015697, 0.9686275, 1, 0, 1,
-0.9322236, 0.2012418, -2.189815, 0.9607843, 1, 0, 1,
-0.9238691, 0.2308762, -2.476299, 0.9568627, 1, 0, 1,
-0.9193981, 0.861843, -0.8432506, 0.9490196, 1, 0, 1,
-0.9118318, 0.1024672, -1.785709, 0.945098, 1, 0, 1,
-0.9089902, -0.6105573, -2.124311, 0.9372549, 1, 0, 1,
-0.9069262, -0.1141561, -1.144754, 0.9333333, 1, 0, 1,
-0.8999085, 0.008832202, -1.838442, 0.9254902, 1, 0, 1,
-0.8978463, -0.8363838, -1.738903, 0.9215686, 1, 0, 1,
-0.8972954, 1.340578, -1.239435, 0.9137255, 1, 0, 1,
-0.8938529, 1.896985, -0.6904596, 0.9098039, 1, 0, 1,
-0.892001, 0.1627655, 0.308718, 0.9019608, 1, 0, 1,
-0.8912638, -0.1574043, -1.468886, 0.8941177, 1, 0, 1,
-0.8855069, -3.011778, -1.138952, 0.8901961, 1, 0, 1,
-0.8812668, 0.1862323, -1.020725, 0.8823529, 1, 0, 1,
-0.8764272, 1.090962, 1.733048, 0.8784314, 1, 0, 1,
-0.8715174, -0.6244944, -1.826658, 0.8705882, 1, 0, 1,
-0.8715032, 0.1914727, -0.5523381, 0.8666667, 1, 0, 1,
-0.8601375, -0.5001637, -2.377029, 0.8588235, 1, 0, 1,
-0.8543577, 0.3604813, -0.418912, 0.854902, 1, 0, 1,
-0.8456001, 0.4891651, -1.279872, 0.8470588, 1, 0, 1,
-0.8409608, 1.155642, -1.364507, 0.8431373, 1, 0, 1,
-0.8398463, 0.1779999, -0.3211882, 0.8352941, 1, 0, 1,
-0.8396485, 0.08189613, -0.9648191, 0.8313726, 1, 0, 1,
-0.8387261, -0.7488879, -3.213389, 0.8235294, 1, 0, 1,
-0.8385783, -0.8501433, -2.01955, 0.8196079, 1, 0, 1,
-0.8334107, 0.05850028, -1.303427, 0.8117647, 1, 0, 1,
-0.8227649, 0.02691477, -0.8096972, 0.8078431, 1, 0, 1,
-0.8222564, 0.6248941, -0.9815665, 0.8, 1, 0, 1,
-0.81827, -1.789918, -2.973536, 0.7921569, 1, 0, 1,
-0.8145173, 0.2932814, -2.508813, 0.7882353, 1, 0, 1,
-0.8136916, 0.4612741, -0.7281144, 0.7803922, 1, 0, 1,
-0.8051725, 1.404297, 0.5309186, 0.7764706, 1, 0, 1,
-0.800249, 0.7211083, -1.569701, 0.7686275, 1, 0, 1,
-0.7977192, -1.219556, -1.869552, 0.7647059, 1, 0, 1,
-0.7958821, -0.1206352, -2.327842, 0.7568628, 1, 0, 1,
-0.7942272, -0.7830802, -3.338925, 0.7529412, 1, 0, 1,
-0.787705, 0.8019766, -0.3995052, 0.7450981, 1, 0, 1,
-0.783097, 0.1969371, -1.909691, 0.7411765, 1, 0, 1,
-0.7814459, 2.846235, -0.2575803, 0.7333333, 1, 0, 1,
-0.7803764, 0.5280885, 1.923292, 0.7294118, 1, 0, 1,
-0.7787835, -0.1219968, -2.871395, 0.7215686, 1, 0, 1,
-0.7735125, -0.09384088, -1.770295, 0.7176471, 1, 0, 1,
-0.7729831, 0.03967135, -0.6164026, 0.7098039, 1, 0, 1,
-0.7729197, -0.4629117, -2.115793, 0.7058824, 1, 0, 1,
-0.7721717, -0.1605491, -3.516247, 0.6980392, 1, 0, 1,
-0.7705688, -1.396838, -2.81232, 0.6901961, 1, 0, 1,
-0.766001, 1.208616, -0.9724772, 0.6862745, 1, 0, 1,
-0.7656282, 0.09445841, -3.048502, 0.6784314, 1, 0, 1,
-0.7588325, -0.9362846, -1.299303, 0.6745098, 1, 0, 1,
-0.7574055, -0.09269916, -1.763941, 0.6666667, 1, 0, 1,
-0.7516259, -0.5496412, -1.656181, 0.6627451, 1, 0, 1,
-0.7444845, -0.5560515, -3.583242, 0.654902, 1, 0, 1,
-0.7440156, -0.8424881, -4.385589, 0.6509804, 1, 0, 1,
-0.7380822, -0.427525, -1.904102, 0.6431373, 1, 0, 1,
-0.7317038, 0.4696492, -1.328945, 0.6392157, 1, 0, 1,
-0.7197732, 0.5094144, -1.582483, 0.6313726, 1, 0, 1,
-0.7180356, -0.2269173, -0.2056719, 0.627451, 1, 0, 1,
-0.7142139, -0.7313179, -3.236909, 0.6196079, 1, 0, 1,
-0.7130286, -0.4796881, -1.674934, 0.6156863, 1, 0, 1,
-0.7114696, -0.8635362, -4.295507, 0.6078432, 1, 0, 1,
-0.7094132, -0.07006337, -1.481996, 0.6039216, 1, 0, 1,
-0.7011658, 1.031207, -1.527013, 0.5960785, 1, 0, 1,
-0.6995907, 2.095664, -0.1700226, 0.5882353, 1, 0, 1,
-0.6977124, -0.2510205, -1.142407, 0.5843138, 1, 0, 1,
-0.6913197, 0.004773651, -2.56033, 0.5764706, 1, 0, 1,
-0.6870473, -0.3544072, -3.552406, 0.572549, 1, 0, 1,
-0.6826253, 0.5437734, -2.250577, 0.5647059, 1, 0, 1,
-0.6788519, -0.9604032, -2.029004, 0.5607843, 1, 0, 1,
-0.6673552, -0.8944886, -0.7915761, 0.5529412, 1, 0, 1,
-0.6666178, 0.05255925, -2.600339, 0.5490196, 1, 0, 1,
-0.661263, -1.68104, -3.263357, 0.5411765, 1, 0, 1,
-0.6506654, -0.8379468, -1.284871, 0.5372549, 1, 0, 1,
-0.6464474, 0.732761, -0.3407089, 0.5294118, 1, 0, 1,
-0.6442702, -0.8069864, -3.091399, 0.5254902, 1, 0, 1,
-0.642728, 1.438649, 0.1134868, 0.5176471, 1, 0, 1,
-0.6406814, -3.147343, -1.742869, 0.5137255, 1, 0, 1,
-0.6397223, -0.5131255, -1.851527, 0.5058824, 1, 0, 1,
-0.6350152, 0.434492, -0.7104712, 0.5019608, 1, 0, 1,
-0.6347247, -2.156584, -3.643897, 0.4941176, 1, 0, 1,
-0.6245735, 0.5367178, -1.141422, 0.4862745, 1, 0, 1,
-0.6168443, -1.074615, -2.544541, 0.4823529, 1, 0, 1,
-0.6136206, 0.1432735, -1.440564, 0.4745098, 1, 0, 1,
-0.6126076, 0.8921365, -1.605415, 0.4705882, 1, 0, 1,
-0.6094632, -0.2637241, -3.212227, 0.4627451, 1, 0, 1,
-0.6086643, 0.6119894, -1.698549, 0.4588235, 1, 0, 1,
-0.6068237, -0.6800208, -4.387282, 0.4509804, 1, 0, 1,
-0.6007543, 1.500838, -0.3196156, 0.4470588, 1, 0, 1,
-0.5985288, -1.33329, -1.501147, 0.4392157, 1, 0, 1,
-0.5984195, 0.2208441, -1.17992, 0.4352941, 1, 0, 1,
-0.5975381, -1.085861, -2.740627, 0.427451, 1, 0, 1,
-0.5948478, 0.2192933, -0.2083497, 0.4235294, 1, 0, 1,
-0.5912258, -1.406911, -1.738443, 0.4156863, 1, 0, 1,
-0.5892329, 0.9621415, -2.215574, 0.4117647, 1, 0, 1,
-0.587329, -2.477539, -2.969222, 0.4039216, 1, 0, 1,
-0.5866601, 1.000383, 0.6975624, 0.3960784, 1, 0, 1,
-0.586358, -0.9722735, -2.165269, 0.3921569, 1, 0, 1,
-0.5832994, -0.1985514, -2.44472, 0.3843137, 1, 0, 1,
-0.5787904, 1.295602, -0.9341421, 0.3803922, 1, 0, 1,
-0.5763273, 0.3406453, -0.5249113, 0.372549, 1, 0, 1,
-0.5748407, -1.235444, -3.552411, 0.3686275, 1, 0, 1,
-0.5692479, -0.3435493, -1.430243, 0.3607843, 1, 0, 1,
-0.567773, 0.05846602, -3.231463, 0.3568628, 1, 0, 1,
-0.5672191, -1.057488, -1.789082, 0.3490196, 1, 0, 1,
-0.563737, 1.817319, 1.800703, 0.345098, 1, 0, 1,
-0.5626472, 1.151683, 0.8599916, 0.3372549, 1, 0, 1,
-0.5624781, 0.1017407, -2.786877, 0.3333333, 1, 0, 1,
-0.5609937, 0.6080697, -1.001, 0.3254902, 1, 0, 1,
-0.560177, 0.373294, 0.5056784, 0.3215686, 1, 0, 1,
-0.5554518, -1.950517, -4.370167, 0.3137255, 1, 0, 1,
-0.554189, 2.107552, -0.6779466, 0.3098039, 1, 0, 1,
-0.5540437, 1.136731, -0.4517341, 0.3019608, 1, 0, 1,
-0.544084, 0.4366283, -0.3444105, 0.2941177, 1, 0, 1,
-0.5424019, 0.8724479, -0.1892047, 0.2901961, 1, 0, 1,
-0.5370365, 1.486635, 0.8747733, 0.282353, 1, 0, 1,
-0.5360144, -1.299528, -2.194793, 0.2784314, 1, 0, 1,
-0.5316588, -0.5453896, -2.799502, 0.2705882, 1, 0, 1,
-0.5306643, -0.5047174, -1.137262, 0.2666667, 1, 0, 1,
-0.530533, -0.6433498, -2.51157, 0.2588235, 1, 0, 1,
-0.528313, 0.7327206, 0.9432333, 0.254902, 1, 0, 1,
-0.5204202, 1.106869, 1.398979, 0.2470588, 1, 0, 1,
-0.506952, -0.2656129, -2.166976, 0.2431373, 1, 0, 1,
-0.5011875, -0.6065742, -2.146465, 0.2352941, 1, 0, 1,
-0.4997369, -0.1030109, -0.8149196, 0.2313726, 1, 0, 1,
-0.4967173, -0.6873734, -3.032615, 0.2235294, 1, 0, 1,
-0.4963719, 0.5322995, -1.717971, 0.2196078, 1, 0, 1,
-0.4940561, -0.6647071, -2.489373, 0.2117647, 1, 0, 1,
-0.4931921, -1.603135, -1.588057, 0.2078431, 1, 0, 1,
-0.4918403, 0.6556614, -3.484697, 0.2, 1, 0, 1,
-0.4881415, 0.06305788, 0.1870014, 0.1921569, 1, 0, 1,
-0.4859259, 0.3673412, -0.4138921, 0.1882353, 1, 0, 1,
-0.4828121, -0.2381564, -2.146447, 0.1803922, 1, 0, 1,
-0.4817539, 1.230044, 0.2087315, 0.1764706, 1, 0, 1,
-0.4753206, 0.1070381, 0.4763452, 0.1686275, 1, 0, 1,
-0.4714486, -0.5227492, -2.019755, 0.1647059, 1, 0, 1,
-0.4698566, 0.7711072, -2.786119, 0.1568628, 1, 0, 1,
-0.4672365, 0.9833491, -0.4181694, 0.1529412, 1, 0, 1,
-0.4624157, -1.141886, -1.526094, 0.145098, 1, 0, 1,
-0.4597399, 0.5702287, -1.720139, 0.1411765, 1, 0, 1,
-0.4591023, -0.5853301, -1.633535, 0.1333333, 1, 0, 1,
-0.4558638, 0.8158379, 0.8997606, 0.1294118, 1, 0, 1,
-0.4535765, 1.896461, -0.5004653, 0.1215686, 1, 0, 1,
-0.4467933, 0.3605793, -0.1729467, 0.1176471, 1, 0, 1,
-0.4453075, 0.976891, -0.731112, 0.1098039, 1, 0, 1,
-0.4437836, 1.240457, -1.912799, 0.1058824, 1, 0, 1,
-0.4384053, -0.1866733, -3.870336, 0.09803922, 1, 0, 1,
-0.4319483, -0.02869453, -1.348404, 0.09019608, 1, 0, 1,
-0.4303264, 0.8337975, -0.2290242, 0.08627451, 1, 0, 1,
-0.4243345, -1.665319, -3.73352, 0.07843138, 1, 0, 1,
-0.4219198, -1.120551, -2.629326, 0.07450981, 1, 0, 1,
-0.4183663, -0.1190466, -1.579177, 0.06666667, 1, 0, 1,
-0.4126314, -1.049407, -3.481136, 0.0627451, 1, 0, 1,
-0.4120979, 0.5518929, 1.908454, 0.05490196, 1, 0, 1,
-0.4112116, 1.661705, -2.471904, 0.05098039, 1, 0, 1,
-0.4109449, 0.2302079, -1.963005, 0.04313726, 1, 0, 1,
-0.4066254, 0.9548973, 0.9210768, 0.03921569, 1, 0, 1,
-0.40574, 1.380138, 0.4970635, 0.03137255, 1, 0, 1,
-0.3987846, -1.245674, -2.381734, 0.02745098, 1, 0, 1,
-0.3979355, 0.3624957, -1.411493, 0.01960784, 1, 0, 1,
-0.3978456, 1.087406, 0.02424999, 0.01568628, 1, 0, 1,
-0.3968278, 1.179327, -0.7574801, 0.007843138, 1, 0, 1,
-0.395774, -1.198998, -2.593205, 0.003921569, 1, 0, 1,
-0.3888516, 0.6459953, -1.082249, 0, 1, 0.003921569, 1,
-0.3871928, -0.1753187, -3.638205, 0, 1, 0.01176471, 1,
-0.3870502, 0.9239814, -0.5220637, 0, 1, 0.01568628, 1,
-0.3854405, -0.1608193, -3.163043, 0, 1, 0.02352941, 1,
-0.3839861, -0.0236536, -2.499239, 0, 1, 0.02745098, 1,
-0.3800007, 0.2559007, -0.2245458, 0, 1, 0.03529412, 1,
-0.3779635, -0.2523234, -4.12325, 0, 1, 0.03921569, 1,
-0.3740313, 0.8383574, 0.2883585, 0, 1, 0.04705882, 1,
-0.3716964, 0.7460672, -0.9874423, 0, 1, 0.05098039, 1,
-0.3705862, -1.077362, -1.493343, 0, 1, 0.05882353, 1,
-0.3688014, 0.3254311, -0.3128664, 0, 1, 0.0627451, 1,
-0.3655754, -1.983918, -3.321007, 0, 1, 0.07058824, 1,
-0.3543905, -0.190512, -2.194545, 0, 1, 0.07450981, 1,
-0.3520557, -0.148664, -1.734843, 0, 1, 0.08235294, 1,
-0.3433544, -1.477151, -3.499585, 0, 1, 0.08627451, 1,
-0.3423147, -1.261018, -1.834352, 0, 1, 0.09411765, 1,
-0.3349359, 0.1095653, -2.223008, 0, 1, 0.1019608, 1,
-0.323887, -0.07927147, -1.936659, 0, 1, 0.1058824, 1,
-0.3231795, 1.144044, 0.7326284, 0, 1, 0.1137255, 1,
-0.3221849, 0.7311924, 0.02719112, 0, 1, 0.1176471, 1,
-0.3213499, 0.06551207, -0.4716595, 0, 1, 0.1254902, 1,
-0.3167574, 1.348995, -0.2542937, 0, 1, 0.1294118, 1,
-0.3090076, -1.141668, -5.414764, 0, 1, 0.1372549, 1,
-0.3073232, 1.657195, -1.472039, 0, 1, 0.1411765, 1,
-0.3045138, 0.6024173, 0.2139767, 0, 1, 0.1490196, 1,
-0.3040516, -0.1469643, 0.09791365, 0, 1, 0.1529412, 1,
-0.3034033, -0.5925749, -2.031229, 0, 1, 0.1607843, 1,
-0.3015344, 0.2867608, -0.3216157, 0, 1, 0.1647059, 1,
-0.2952844, -0.2698696, -0.398258, 0, 1, 0.172549, 1,
-0.2947223, -0.4698307, -3.212472, 0, 1, 0.1764706, 1,
-0.2899955, 1.201015, -0.8561735, 0, 1, 0.1843137, 1,
-0.2898335, -0.1674397, -1.392465, 0, 1, 0.1882353, 1,
-0.2886057, 1.345592, -0.9908152, 0, 1, 0.1960784, 1,
-0.2837219, -1.243125, -1.587431, 0, 1, 0.2039216, 1,
-0.2832099, 0.4122862, 1.121731, 0, 1, 0.2078431, 1,
-0.2792268, 0.005951615, -2.45757, 0, 1, 0.2156863, 1,
-0.2789843, -1.181359, -3.621475, 0, 1, 0.2196078, 1,
-0.2777929, -0.6276388, -3.48715, 0, 1, 0.227451, 1,
-0.2767927, -1.279815, -3.887725, 0, 1, 0.2313726, 1,
-0.2765701, 0.4860739, -0.6004047, 0, 1, 0.2392157, 1,
-0.2733061, -1.37894, -1.302035, 0, 1, 0.2431373, 1,
-0.2730305, 0.03113044, -1.645725, 0, 1, 0.2509804, 1,
-0.272081, 0.05399778, -1.506044, 0, 1, 0.254902, 1,
-0.2708367, 0.1604684, -0.2839883, 0, 1, 0.2627451, 1,
-0.2673889, 0.5785431, -0.5737101, 0, 1, 0.2666667, 1,
-0.2641982, 1.800326, 0.6520138, 0, 1, 0.2745098, 1,
-0.2547249, -0.8656254, -3.905291, 0, 1, 0.2784314, 1,
-0.2486188, -1.146493, -2.113034, 0, 1, 0.2862745, 1,
-0.2471561, 0.5427701, -1.7055, 0, 1, 0.2901961, 1,
-0.2459575, 1.068191, -0.2438969, 0, 1, 0.2980392, 1,
-0.2454558, -0.3741769, -1.201283, 0, 1, 0.3058824, 1,
-0.2444325, 0.248963, -0.6693484, 0, 1, 0.3098039, 1,
-0.2317234, -0.7074225, -3.664769, 0, 1, 0.3176471, 1,
-0.2311275, -0.6758562, -5.296317, 0, 1, 0.3215686, 1,
-0.2293198, 0.1845953, -1.320314, 0, 1, 0.3294118, 1,
-0.2281698, -0.5817853, -3.110128, 0, 1, 0.3333333, 1,
-0.226943, -0.0198366, -0.466028, 0, 1, 0.3411765, 1,
-0.2246117, 0.3821298, -1.973268, 0, 1, 0.345098, 1,
-0.2240519, 0.1240017, -0.1517135, 0, 1, 0.3529412, 1,
-0.2221334, 0.7845246, -0.8857558, 0, 1, 0.3568628, 1,
-0.2192817, -1.404083, -3.424125, 0, 1, 0.3647059, 1,
-0.2171917, -0.08427969, -0.5758245, 0, 1, 0.3686275, 1,
-0.2162399, 0.1986048, -1.318884, 0, 1, 0.3764706, 1,
-0.2086019, 1.493669, 1.451683, 0, 1, 0.3803922, 1,
-0.2050604, -0.827627, -3.051795, 0, 1, 0.3882353, 1,
-0.2039726, 0.0173489, -2.433501, 0, 1, 0.3921569, 1,
-0.1990848, -0.9668925, -2.360201, 0, 1, 0.4, 1,
-0.1956441, 0.6744171, 1.058356, 0, 1, 0.4078431, 1,
-0.1933986, -0.4948911, -2.61108, 0, 1, 0.4117647, 1,
-0.1919574, -0.7577594, -2.360906, 0, 1, 0.4196078, 1,
-0.1912528, 1.974565, 1.159096, 0, 1, 0.4235294, 1,
-0.1886994, 0.1676073, -2.715821, 0, 1, 0.4313726, 1,
-0.1831631, 0.4816217, -0.5318565, 0, 1, 0.4352941, 1,
-0.1829053, -0.8102023, -2.788497, 0, 1, 0.4431373, 1,
-0.1827256, -1.544332, -3.519177, 0, 1, 0.4470588, 1,
-0.1824841, 0.09462648, -0.909614, 0, 1, 0.454902, 1,
-0.1815908, -0.5634351, -2.897256, 0, 1, 0.4588235, 1,
-0.1795893, 0.6440384, -0.4482334, 0, 1, 0.4666667, 1,
-0.1722708, 1.06195, 1.044513, 0, 1, 0.4705882, 1,
-0.16508, -0.6635089, -1.997558, 0, 1, 0.4784314, 1,
-0.1619802, -0.63488, -2.148568, 0, 1, 0.4823529, 1,
-0.1564375, -1.420215, -3.968022, 0, 1, 0.4901961, 1,
-0.1557198, 0.9738361, 0.1315171, 0, 1, 0.4941176, 1,
-0.1496636, -1.190451, -4.943134, 0, 1, 0.5019608, 1,
-0.1489249, -0.2298314, -4.002034, 0, 1, 0.509804, 1,
-0.1480121, -0.1217147, -1.511211, 0, 1, 0.5137255, 1,
-0.1478106, -0.04041859, 0.6980827, 0, 1, 0.5215687, 1,
-0.142176, 0.8133441, 0.09057716, 0, 1, 0.5254902, 1,
-0.1409039, 0.3962116, -1.996703, 0, 1, 0.5333334, 1,
-0.1408588, -0.4769218, -2.442671, 0, 1, 0.5372549, 1,
-0.1384579, 1.120377, -0.2734349, 0, 1, 0.5450981, 1,
-0.131849, -0.09912117, -2.083617, 0, 1, 0.5490196, 1,
-0.1273396, -0.8193961, -2.180697, 0, 1, 0.5568628, 1,
-0.1270567, -0.2117652, -1.734858, 0, 1, 0.5607843, 1,
-0.1237925, 0.9257957, 0.2905477, 0, 1, 0.5686275, 1,
-0.1229501, 0.938436, -0.1451075, 0, 1, 0.572549, 1,
-0.1175572, 0.2202422, -0.6466945, 0, 1, 0.5803922, 1,
-0.1169025, -0.2234423, -3.554023, 0, 1, 0.5843138, 1,
-0.1126608, 0.7812379, -0.582296, 0, 1, 0.5921569, 1,
-0.1096355, 0.4932863, 0.1275396, 0, 1, 0.5960785, 1,
-0.1093468, -0.03674507, -0.4544907, 0, 1, 0.6039216, 1,
-0.1033909, 0.2111781, 0.459279, 0, 1, 0.6117647, 1,
-0.1028782, 1.638124, -0.7222967, 0, 1, 0.6156863, 1,
-0.100801, 0.6907659, 0.5735012, 0, 1, 0.6235294, 1,
-0.09824019, -0.6337637, -2.340294, 0, 1, 0.627451, 1,
-0.08762412, 0.5550456, 1.523929, 0, 1, 0.6352941, 1,
-0.07707287, 0.3865846, -0.7087462, 0, 1, 0.6392157, 1,
-0.07664564, 1.772526, -0.2560871, 0, 1, 0.6470588, 1,
-0.07595475, 1.013514, -1.020313, 0, 1, 0.6509804, 1,
-0.07565723, -1.328175, -3.049935, 0, 1, 0.6588235, 1,
-0.06645599, -0.1942097, -2.914425, 0, 1, 0.6627451, 1,
-0.06093314, -0.8982719, -3.128523, 0, 1, 0.6705883, 1,
-0.0599842, -2.193962, -2.606284, 0, 1, 0.6745098, 1,
-0.05968411, -1.05936, -2.742347, 0, 1, 0.682353, 1,
-0.05498571, 1.495825, 1.067376, 0, 1, 0.6862745, 1,
-0.05050173, 0.3399888, 1.677691, 0, 1, 0.6941177, 1,
-0.04946684, -0.2079043, -3.345585, 0, 1, 0.7019608, 1,
-0.04914667, 1.20505, -0.43489, 0, 1, 0.7058824, 1,
-0.04912866, 0.3834929, 0.6492308, 0, 1, 0.7137255, 1,
-0.04898266, 0.2387984, 0.3817452, 0, 1, 0.7176471, 1,
-0.04712169, -0.6987153, -4.013605, 0, 1, 0.7254902, 1,
-0.04638916, -0.09209301, -4.065284, 0, 1, 0.7294118, 1,
-0.04606229, -3.19552, -3.878917, 0, 1, 0.7372549, 1,
-0.04227587, 0.0512922, -2.149508, 0, 1, 0.7411765, 1,
-0.04189717, -1.044357, -3.575, 0, 1, 0.7490196, 1,
-0.04181581, -0.320256, -4.198745, 0, 1, 0.7529412, 1,
-0.0346886, 1.084189, -0.0646873, 0, 1, 0.7607843, 1,
-0.03359836, 0.2444079, -1.070359, 0, 1, 0.7647059, 1,
-0.03263172, 2.063992, -2.219599, 0, 1, 0.772549, 1,
-0.02994816, -0.06566063, -2.874992, 0, 1, 0.7764706, 1,
-0.02972299, 0.02710188, 1.25462, 0, 1, 0.7843137, 1,
-0.02919086, 1.167393, 0.712651, 0, 1, 0.7882353, 1,
-0.02911334, 1.368215, 1.520235, 0, 1, 0.7960784, 1,
-0.02655531, -0.3357032, -3.622271, 0, 1, 0.8039216, 1,
-0.02530644, -0.9487815, -1.835311, 0, 1, 0.8078431, 1,
-0.02525366, -1.057569, -0.8893552, 0, 1, 0.8156863, 1,
-0.02401616, 1.175372, 0.3924239, 0, 1, 0.8196079, 1,
-0.02326742, 0.1828954, -0.2095118, 0, 1, 0.827451, 1,
-0.01899291, 1.400413, 0.1216403, 0, 1, 0.8313726, 1,
-0.01683991, -1.939011, -2.102859, 0, 1, 0.8392157, 1,
-0.016768, 0.7261607, 1.789997, 0, 1, 0.8431373, 1,
-0.0107998, -1.319255, -3.491265, 0, 1, 0.8509804, 1,
-0.007406566, 1.253518, 1.444887, 0, 1, 0.854902, 1,
-0.006374611, 0.8022577, 0.1865624, 0, 1, 0.8627451, 1,
-0.006183491, -1.218809, -3.928447, 0, 1, 0.8666667, 1,
-0.005723674, -0.7941362, -4.419496, 0, 1, 0.8745098, 1,
0.005960727, -0.4219809, 2.024523, 0, 1, 0.8784314, 1,
0.006565626, -0.5305983, 3.188655, 0, 1, 0.8862745, 1,
0.008161313, 0.4475621, -0.459447, 0, 1, 0.8901961, 1,
0.01533172, 0.01106913, 1.748379, 0, 1, 0.8980392, 1,
0.0172585, -0.008280458, 1.753547, 0, 1, 0.9058824, 1,
0.01743496, 0.939931, -0.1865783, 0, 1, 0.9098039, 1,
0.02568079, 0.453299, 0.988437, 0, 1, 0.9176471, 1,
0.02648881, -0.2851047, 3.092893, 0, 1, 0.9215686, 1,
0.02651885, -0.823822, 4.626001, 0, 1, 0.9294118, 1,
0.02763175, -1.866257, 2.532592, 0, 1, 0.9333333, 1,
0.02989339, 1.916421, -0.6900169, 0, 1, 0.9411765, 1,
0.03106837, -0.9587793, 4.394136, 0, 1, 0.945098, 1,
0.03394353, 0.3809876, 0.4278606, 0, 1, 0.9529412, 1,
0.03579933, 0.5371302, -0.2244739, 0, 1, 0.9568627, 1,
0.03678398, -0.6281973, 1.397289, 0, 1, 0.9647059, 1,
0.0377236, -1.172608, 3.337413, 0, 1, 0.9686275, 1,
0.04264429, -1.861973, 1.876244, 0, 1, 0.9764706, 1,
0.04417465, -0.3851497, 4.385623, 0, 1, 0.9803922, 1,
0.04481378, -1.102513, 3.823327, 0, 1, 0.9882353, 1,
0.0466916, 0.5135687, 0.9018682, 0, 1, 0.9921569, 1,
0.04761098, -0.7497255, 1.444083, 0, 1, 1, 1,
0.04883402, -0.3659981, 3.519042, 0, 0.9921569, 1, 1,
0.05274469, 1.258119, -0.8079914, 0, 0.9882353, 1, 1,
0.05430553, 1.689892, -1.438241, 0, 0.9803922, 1, 1,
0.05628679, -0.02895868, 2.139466, 0, 0.9764706, 1, 1,
0.05638237, 1.058406, -0.8006177, 0, 0.9686275, 1, 1,
0.05725312, 1.141744, 0.1287586, 0, 0.9647059, 1, 1,
0.06141021, 0.7749004, -1.377012, 0, 0.9568627, 1, 1,
0.06551725, -0.09419032, 3.692206, 0, 0.9529412, 1, 1,
0.0689252, -0.7100419, 2.161174, 0, 0.945098, 1, 1,
0.06925798, 0.3491089, 1.514531, 0, 0.9411765, 1, 1,
0.07026973, 1.068797, 0.479052, 0, 0.9333333, 1, 1,
0.07172629, 0.9750682, -0.5836401, 0, 0.9294118, 1, 1,
0.07183438, -0.192368, 3.968554, 0, 0.9215686, 1, 1,
0.07704049, -0.4480319, 1.315688, 0, 0.9176471, 1, 1,
0.0794709, 0.2302114, -1.033677, 0, 0.9098039, 1, 1,
0.0795297, 1.286285, 0.157942, 0, 0.9058824, 1, 1,
0.08010659, -0.8455315, 2.27774, 0, 0.8980392, 1, 1,
0.08228001, -1.406914, 3.337779, 0, 0.8901961, 1, 1,
0.08502673, 0.9822474, 0.2490634, 0, 0.8862745, 1, 1,
0.09158142, -0.5355731, 1.994995, 0, 0.8784314, 1, 1,
0.0934875, -0.509491, 4.328327, 0, 0.8745098, 1, 1,
0.09352788, 0.0537494, -0.556106, 0, 0.8666667, 1, 1,
0.09456225, 1.036611, 0.5218486, 0, 0.8627451, 1, 1,
0.09506784, 0.5494079, 0.9094194, 0, 0.854902, 1, 1,
0.09642123, -1.050228, 1.073481, 0, 0.8509804, 1, 1,
0.0975224, 0.3071133, 0.4759567, 0, 0.8431373, 1, 1,
0.1002296, -2.124269, 3.181886, 0, 0.8392157, 1, 1,
0.1045572, -0.9343252, 2.638428, 0, 0.8313726, 1, 1,
0.1080459, -0.7247744, 3.815996, 0, 0.827451, 1, 1,
0.1109648, -0.4583372, 1.539255, 0, 0.8196079, 1, 1,
0.1184537, -0.09500539, 2.7015, 0, 0.8156863, 1, 1,
0.1202933, -0.3473689, 1.748573, 0, 0.8078431, 1, 1,
0.1219787, -0.9317647, 2.288329, 0, 0.8039216, 1, 1,
0.1220248, 0.9036009, 0.8936903, 0, 0.7960784, 1, 1,
0.1245897, -2.032182, 4.517577, 0, 0.7882353, 1, 1,
0.1259785, 0.693308, 0.6211004, 0, 0.7843137, 1, 1,
0.1286958, 0.2210799, 2.241694, 0, 0.7764706, 1, 1,
0.1313462, -0.5583065, 4.439517, 0, 0.772549, 1, 1,
0.1314879, 0.09136691, 0.4541529, 0, 0.7647059, 1, 1,
0.1370781, 0.1108652, 1.952595, 0, 0.7607843, 1, 1,
0.1402205, -0.4110337, 3.456301, 0, 0.7529412, 1, 1,
0.1439827, 0.4607374, 0.09831838, 0, 0.7490196, 1, 1,
0.1478, -1.564058, 0.5991398, 0, 0.7411765, 1, 1,
0.1485351, -0.2095326, 0.9093131, 0, 0.7372549, 1, 1,
0.1490579, 0.9187239, -1.313182, 0, 0.7294118, 1, 1,
0.1513151, 2.058294, -0.2376325, 0, 0.7254902, 1, 1,
0.1547431, 0.05767163, 2.330576, 0, 0.7176471, 1, 1,
0.1566256, -1.026596, 2.789374, 0, 0.7137255, 1, 1,
0.1583135, 1.274599, 1.756327, 0, 0.7058824, 1, 1,
0.164235, -1.104407, 1.036278, 0, 0.6980392, 1, 1,
0.1643674, -0.2865477, 1.445311, 0, 0.6941177, 1, 1,
0.1643756, -0.2408018, 1.889293, 0, 0.6862745, 1, 1,
0.1661492, -1.005176, 3.950875, 0, 0.682353, 1, 1,
0.1707321, 1.470164, 1.698619, 0, 0.6745098, 1, 1,
0.1714613, -0.5535114, 2.230547, 0, 0.6705883, 1, 1,
0.1715675, 0.2460045, 0.2746629, 0, 0.6627451, 1, 1,
0.1716654, -0.3223322, 2.671828, 0, 0.6588235, 1, 1,
0.1728072, -0.3813141, 0.9974533, 0, 0.6509804, 1, 1,
0.1773808, 0.1309164, 1.781369, 0, 0.6470588, 1, 1,
0.1774633, 0.7938536, 0.07494112, 0, 0.6392157, 1, 1,
0.177995, -1.336306, 3.320461, 0, 0.6352941, 1, 1,
0.1782408, -0.7896439, 1.284666, 0, 0.627451, 1, 1,
0.1854208, -0.09717429, 3.333911, 0, 0.6235294, 1, 1,
0.1885963, 0.468218, 0.2288209, 0, 0.6156863, 1, 1,
0.18899, 1.153056, 0.3053769, 0, 0.6117647, 1, 1,
0.1919858, 0.1360941, -0.3149524, 0, 0.6039216, 1, 1,
0.1950203, 0.5560951, 0.5744207, 0, 0.5960785, 1, 1,
0.1965314, -1.69059, 4.066359, 0, 0.5921569, 1, 1,
0.2015437, -1.778928, 1.964807, 0, 0.5843138, 1, 1,
0.2016448, 1.097724, 2.044136, 0, 0.5803922, 1, 1,
0.2036866, 0.2509599, 0.337981, 0, 0.572549, 1, 1,
0.205607, 0.05070656, 0.4613571, 0, 0.5686275, 1, 1,
0.2079678, 0.2522222, 1.83922, 0, 0.5607843, 1, 1,
0.2088994, 0.3610049, 1.477052, 0, 0.5568628, 1, 1,
0.2104112, -0.7601779, 3.503563, 0, 0.5490196, 1, 1,
0.2143137, 1.551064, 0.6336563, 0, 0.5450981, 1, 1,
0.2148167, -0.9194897, 3.121749, 0, 0.5372549, 1, 1,
0.2202303, 0.4979002, 1.43621, 0, 0.5333334, 1, 1,
0.2240773, -3.376396, 2.552688, 0, 0.5254902, 1, 1,
0.2252834, -0.4720944, 2.753529, 0, 0.5215687, 1, 1,
0.2270886, -1.230048, 4.98596, 0, 0.5137255, 1, 1,
0.2299503, 0.02801045, 0.369701, 0, 0.509804, 1, 1,
0.2300622, 1.42967, -1.481782, 0, 0.5019608, 1, 1,
0.2303443, -1.627442, 2.499408, 0, 0.4941176, 1, 1,
0.2308239, 1.11601, -0.8608723, 0, 0.4901961, 1, 1,
0.2334121, -1.294629, 4.826982, 0, 0.4823529, 1, 1,
0.234168, -1.598045, 1.923433, 0, 0.4784314, 1, 1,
0.2400007, 2.668504, 0.8218989, 0, 0.4705882, 1, 1,
0.2410753, 1.314667, 0.8658379, 0, 0.4666667, 1, 1,
0.2421028, 1.276649, -0.4286793, 0, 0.4588235, 1, 1,
0.2426882, 0.1412303, 1.85279, 0, 0.454902, 1, 1,
0.2437781, 0.6780984, 1.240886, 0, 0.4470588, 1, 1,
0.2450594, 0.2244674, -0.4498692, 0, 0.4431373, 1, 1,
0.247196, 1.039069, 0.2099496, 0, 0.4352941, 1, 1,
0.2477807, -1.145505, 5.412471, 0, 0.4313726, 1, 1,
0.2548154, -1.228393, 3.572517, 0, 0.4235294, 1, 1,
0.2567011, 0.2015754, 0.3776616, 0, 0.4196078, 1, 1,
0.2581891, 1.293373, -0.00844036, 0, 0.4117647, 1, 1,
0.2583004, -1.494373, 1.857495, 0, 0.4078431, 1, 1,
0.2633575, 0.2082842, -0.7246219, 0, 0.4, 1, 1,
0.2638193, -0.9520704, 4.085691, 0, 0.3921569, 1, 1,
0.268605, -0.9014344, 2.783232, 0, 0.3882353, 1, 1,
0.273501, -0.09286875, 0.6473547, 0, 0.3803922, 1, 1,
0.2772132, -1.101532, 1.414388, 0, 0.3764706, 1, 1,
0.2801489, -1.419036, 2.579364, 0, 0.3686275, 1, 1,
0.2833729, 1.628681, 1.211381, 0, 0.3647059, 1, 1,
0.283534, -0.8295382, 3.599633, 0, 0.3568628, 1, 1,
0.2923206, 0.1228488, 2.253137, 0, 0.3529412, 1, 1,
0.2943098, 1.88105, -0.17879, 0, 0.345098, 1, 1,
0.2963814, -0.1544733, 1.8387, 0, 0.3411765, 1, 1,
0.2972243, 1.147069, -1.591966, 0, 0.3333333, 1, 1,
0.2983929, 0.308703, -2.086159, 0, 0.3294118, 1, 1,
0.3058154, 1.284008, -1.436715, 0, 0.3215686, 1, 1,
0.3062058, -0.3510225, 2.508381, 0, 0.3176471, 1, 1,
0.3083904, 1.091315, 0.9703887, 0, 0.3098039, 1, 1,
0.3095478, 0.04351534, 2.453245, 0, 0.3058824, 1, 1,
0.3126282, 1.075076, 0.3161007, 0, 0.2980392, 1, 1,
0.3277275, 1.916796, 0.762868, 0, 0.2901961, 1, 1,
0.3333706, 2.226906, 0.1771804, 0, 0.2862745, 1, 1,
0.3415512, 2.100257, -1.313334, 0, 0.2784314, 1, 1,
0.3423924, 1.096095, 0.1155373, 0, 0.2745098, 1, 1,
0.3472092, -1.884666, 3.104446, 0, 0.2666667, 1, 1,
0.3547357, -1.645723, 3.323947, 0, 0.2627451, 1, 1,
0.3615231, -1.831771, 3.369308, 0, 0.254902, 1, 1,
0.3622959, -0.5130462, 2.067752, 0, 0.2509804, 1, 1,
0.364115, 0.9760818, 0.9803395, 0, 0.2431373, 1, 1,
0.3763289, 0.6426189, 0.5839697, 0, 0.2392157, 1, 1,
0.3771411, -0.07420437, 1.639032, 0, 0.2313726, 1, 1,
0.3824832, 1.165481, 0.6666941, 0, 0.227451, 1, 1,
0.3845996, 0.6141064, 1.083657, 0, 0.2196078, 1, 1,
0.3891583, 2.602631, 0.7237538, 0, 0.2156863, 1, 1,
0.3893777, 1.325185, 0.7610941, 0, 0.2078431, 1, 1,
0.3893988, -0.8640206, 2.178148, 0, 0.2039216, 1, 1,
0.3896464, -0.9787212, 2.973724, 0, 0.1960784, 1, 1,
0.3915856, 2.046529, -1.447097, 0, 0.1882353, 1, 1,
0.3927813, -0.1596103, 2.27101, 0, 0.1843137, 1, 1,
0.3973014, -0.4534788, 2.928652, 0, 0.1764706, 1, 1,
0.3981978, 0.1281277, 0.634086, 0, 0.172549, 1, 1,
0.4043538, -0.1410567, 2.916798, 0, 0.1647059, 1, 1,
0.4048363, 0.3068634, 1.842777, 0, 0.1607843, 1, 1,
0.4072439, -0.2998057, 1.065619, 0, 0.1529412, 1, 1,
0.4103539, 1.55349, 0.854206, 0, 0.1490196, 1, 1,
0.411222, 0.4165044, -0.8717362, 0, 0.1411765, 1, 1,
0.4197549, 0.4068495, 0.4026614, 0, 0.1372549, 1, 1,
0.4207168, 0.741563, -0.06960169, 0, 0.1294118, 1, 1,
0.4208921, 0.7981029, 0.552947, 0, 0.1254902, 1, 1,
0.422123, 0.3222869, 0.5252286, 0, 0.1176471, 1, 1,
0.4236872, 0.550065, 0.7559022, 0, 0.1137255, 1, 1,
0.4255155, 1.432028, 0.4861347, 0, 0.1058824, 1, 1,
0.4294436, 0.1453313, 1.095097, 0, 0.09803922, 1, 1,
0.4350738, -0.511005, 3.282208, 0, 0.09411765, 1, 1,
0.436204, -0.3187602, 2.054903, 0, 0.08627451, 1, 1,
0.4412937, 1.246289, 0.2085642, 0, 0.08235294, 1, 1,
0.4434843, -0.1299305, 1.339834, 0, 0.07450981, 1, 1,
0.4441372, -1.356466, 3.628141, 0, 0.07058824, 1, 1,
0.4447193, -1.554558, 2.669126, 0, 0.0627451, 1, 1,
0.4456256, -0.4384664, 3.674627, 0, 0.05882353, 1, 1,
0.4459967, -0.8308361, 2.005716, 0, 0.05098039, 1, 1,
0.4475159, 1.408355, -0.9918263, 0, 0.04705882, 1, 1,
0.4477267, 0.0660189, 0.6815652, 0, 0.03921569, 1, 1,
0.4493315, 0.6274692, 1.728473, 0, 0.03529412, 1, 1,
0.4515015, -0.2824448, 2.095062, 0, 0.02745098, 1, 1,
0.4519968, 0.6141862, 0.1993691, 0, 0.02352941, 1, 1,
0.4542484, 0.5341358, -0.5105357, 0, 0.01568628, 1, 1,
0.4602196, 1.222311, 0.1674938, 0, 0.01176471, 1, 1,
0.4618606, -1.668985, 1.455909, 0, 0.003921569, 1, 1,
0.4644743, -0.2744053, 2.884588, 0.003921569, 0, 1, 1,
0.4656121, -1.273211, 3.200341, 0.007843138, 0, 1, 1,
0.471355, 0.9979222, 2.005499, 0.01568628, 0, 1, 1,
0.4718938, 2.676313, 1.056301, 0.01960784, 0, 1, 1,
0.4735417, -0.1339222, 1.38814, 0.02745098, 0, 1, 1,
0.4769997, 0.5840568, -0.7179843, 0.03137255, 0, 1, 1,
0.4820138, 0.09929389, 0.9545301, 0.03921569, 0, 1, 1,
0.4949722, 1.479221, 0.2231116, 0.04313726, 0, 1, 1,
0.4950826, -1.000953, 4.162389, 0.05098039, 0, 1, 1,
0.4959338, -0.5125338, 3.477299, 0.05490196, 0, 1, 1,
0.4971459, 2.379574, 1.297175, 0.0627451, 0, 1, 1,
0.499575, 0.2560283, 0.8507385, 0.06666667, 0, 1, 1,
0.4996052, -0.7373935, 2.409627, 0.07450981, 0, 1, 1,
0.503898, 1.843551, -0.2599409, 0.07843138, 0, 1, 1,
0.5045172, 1.259998, 0.07841035, 0.08627451, 0, 1, 1,
0.5048973, -0.4200883, 0.2645715, 0.09019608, 0, 1, 1,
0.5079566, -0.9536939, 3.682627, 0.09803922, 0, 1, 1,
0.5101808, -2.023574, 1.128722, 0.1058824, 0, 1, 1,
0.5124009, -1.103368, 3.336144, 0.1098039, 0, 1, 1,
0.5164595, 0.257073, 1.09555, 0.1176471, 0, 1, 1,
0.5188807, 1.031063, 0.3928173, 0.1215686, 0, 1, 1,
0.5192306, -0.7396229, 2.929536, 0.1294118, 0, 1, 1,
0.5221587, 0.5987389, 0.9480594, 0.1333333, 0, 1, 1,
0.5223345, -0.9966508, 4.592347, 0.1411765, 0, 1, 1,
0.5240368, -0.0974704, 0.682754, 0.145098, 0, 1, 1,
0.527501, 0.7604625, 1.794665, 0.1529412, 0, 1, 1,
0.5278963, 0.7994711, -0.9284714, 0.1568628, 0, 1, 1,
0.5289631, -0.612078, 2.494612, 0.1647059, 0, 1, 1,
0.5375032, -0.2776278, 2.378834, 0.1686275, 0, 1, 1,
0.5416005, 1.169555, -0.8048025, 0.1764706, 0, 1, 1,
0.5485945, 0.2550506, 1.252349, 0.1803922, 0, 1, 1,
0.5521696, 2.166848, 1.956671, 0.1882353, 0, 1, 1,
0.5535318, -0.3053849, 3.276042, 0.1921569, 0, 1, 1,
0.558907, 1.132137, -0.1676939, 0.2, 0, 1, 1,
0.5623142, 1.984405, 1.907687, 0.2078431, 0, 1, 1,
0.5644272, -0.2529289, 2.063138, 0.2117647, 0, 1, 1,
0.5644817, 0.4961218, 1.026951, 0.2196078, 0, 1, 1,
0.569937, 1.232655, 0.737138, 0.2235294, 0, 1, 1,
0.5749254, -0.2672567, 1.629506, 0.2313726, 0, 1, 1,
0.575036, 0.6520377, 1.694644, 0.2352941, 0, 1, 1,
0.5769302, 0.379973, 0.7271129, 0.2431373, 0, 1, 1,
0.5770184, 1.428601, -0.07946929, 0.2470588, 0, 1, 1,
0.5862682, 0.5013784, 1.137469, 0.254902, 0, 1, 1,
0.5870163, 1.042186, -0.4788756, 0.2588235, 0, 1, 1,
0.5876588, -1.074819, 3.282064, 0.2666667, 0, 1, 1,
0.5921002, -0.314113, 1.472946, 0.2705882, 0, 1, 1,
0.5924001, -0.03530665, 1.831588, 0.2784314, 0, 1, 1,
0.5994031, -0.8296047, 4.629255, 0.282353, 0, 1, 1,
0.6017106, -0.5616166, 3.631152, 0.2901961, 0, 1, 1,
0.6031871, 0.7033483, 1.228396, 0.2941177, 0, 1, 1,
0.6053817, 2.343121, 0.3383067, 0.3019608, 0, 1, 1,
0.6069316, -0.8377995, 2.870393, 0.3098039, 0, 1, 1,
0.6088687, 0.4891315, 1.458388, 0.3137255, 0, 1, 1,
0.6125842, 0.894559, 1.042822, 0.3215686, 0, 1, 1,
0.6146361, -2.099637, 2.214446, 0.3254902, 0, 1, 1,
0.6199734, 0.1953688, -0.8338819, 0.3333333, 0, 1, 1,
0.6227747, -0.6306397, 1.506981, 0.3372549, 0, 1, 1,
0.6272625, 0.4378058, -0.7834212, 0.345098, 0, 1, 1,
0.628689, 1.399792, 0.7662864, 0.3490196, 0, 1, 1,
0.6287539, 1.168559, 1.158473, 0.3568628, 0, 1, 1,
0.6328777, -1.116764, 1.626346, 0.3607843, 0, 1, 1,
0.6356795, 0.4987708, 0.1893142, 0.3686275, 0, 1, 1,
0.6362157, 0.1906023, 2.217927, 0.372549, 0, 1, 1,
0.641175, -0.7183198, 2.436458, 0.3803922, 0, 1, 1,
0.6421663, 0.389818, 1.06766, 0.3843137, 0, 1, 1,
0.6480808, -1.480573, 2.877205, 0.3921569, 0, 1, 1,
0.6517109, -1.240679, 1.264844, 0.3960784, 0, 1, 1,
0.6524042, 0.04657348, 1.184581, 0.4039216, 0, 1, 1,
0.6538293, -0.9634677, 2.663912, 0.4117647, 0, 1, 1,
0.660614, -1.067187, 3.44402, 0.4156863, 0, 1, 1,
0.6678543, -1.293465, 3.924641, 0.4235294, 0, 1, 1,
0.6696689, 0.5322577, -0.2443347, 0.427451, 0, 1, 1,
0.6697802, 1.081879, 0.2838792, 0.4352941, 0, 1, 1,
0.6719759, 1.043924, 0.5163286, 0.4392157, 0, 1, 1,
0.6741406, -0.6391178, 2.733344, 0.4470588, 0, 1, 1,
0.674592, -0.8190867, 3.757274, 0.4509804, 0, 1, 1,
0.6778243, 0.6573411, -0.156442, 0.4588235, 0, 1, 1,
0.6801195, 1.07617, 1.348658, 0.4627451, 0, 1, 1,
0.6810114, -0.1366127, 1.592305, 0.4705882, 0, 1, 1,
0.6820095, -0.4856898, 2.568353, 0.4745098, 0, 1, 1,
0.6864994, -0.2383828, 4.566495, 0.4823529, 0, 1, 1,
0.6866099, -1.18819, 3.513686, 0.4862745, 0, 1, 1,
0.6877108, 0.4585887, -0.51182, 0.4941176, 0, 1, 1,
0.6889325, -0.8702148, 2.57345, 0.5019608, 0, 1, 1,
0.6915498, -0.4691512, 2.017977, 0.5058824, 0, 1, 1,
0.6958076, 1.291665, 0.6710908, 0.5137255, 0, 1, 1,
0.7011847, -1.402221, 2.639352, 0.5176471, 0, 1, 1,
0.7032942, 0.3629229, 1.1657, 0.5254902, 0, 1, 1,
0.7064204, 1.038613, 0.9429415, 0.5294118, 0, 1, 1,
0.7081791, -0.2654256, 2.997499, 0.5372549, 0, 1, 1,
0.708482, -0.3624991, 3.760338, 0.5411765, 0, 1, 1,
0.7092006, 0.3349722, -1.217231, 0.5490196, 0, 1, 1,
0.7097206, -0.1427461, 1.196497, 0.5529412, 0, 1, 1,
0.714532, 0.7295048, 0.8060967, 0.5607843, 0, 1, 1,
0.7196638, -0.518545, 1.398686, 0.5647059, 0, 1, 1,
0.7219706, 0.5414479, -0.1799456, 0.572549, 0, 1, 1,
0.7342906, -2.248831, 1.151799, 0.5764706, 0, 1, 1,
0.735265, 0.08307359, 1.057777, 0.5843138, 0, 1, 1,
0.7371806, 0.9352413, 1.103599, 0.5882353, 0, 1, 1,
0.7380695, -0.07203376, 0.07797335, 0.5960785, 0, 1, 1,
0.7412583, -0.7754702, 2.07404, 0.6039216, 0, 1, 1,
0.7415395, 1.07643, 0.2445375, 0.6078432, 0, 1, 1,
0.7479583, -1.096822, 4.384308, 0.6156863, 0, 1, 1,
0.750544, -0.815526, 3.245729, 0.6196079, 0, 1, 1,
0.7556241, 0.3084035, 2.188256, 0.627451, 0, 1, 1,
0.7574251, 1.05329, 1.473826, 0.6313726, 0, 1, 1,
0.7616463, 1.572751, 1.29326, 0.6392157, 0, 1, 1,
0.761846, -1.244114, 2.253523, 0.6431373, 0, 1, 1,
0.7653533, 1.548058, -1.179597, 0.6509804, 0, 1, 1,
0.7657905, 1.223138, 2.726764, 0.654902, 0, 1, 1,
0.7715893, -0.5521056, 2.338211, 0.6627451, 0, 1, 1,
0.7733001, 0.2146291, 1.716448, 0.6666667, 0, 1, 1,
0.7769026, 1.05447, 0.9116793, 0.6745098, 0, 1, 1,
0.7808519, 1.028045, -0.6130383, 0.6784314, 0, 1, 1,
0.7853373, -0.006331992, 0.9637372, 0.6862745, 0, 1, 1,
0.7855083, -1.169925, 3.139841, 0.6901961, 0, 1, 1,
0.7870516, -0.7367413, 2.691731, 0.6980392, 0, 1, 1,
0.7876508, -1.66634, 3.108458, 0.7058824, 0, 1, 1,
0.7876701, 0.6224616, 0.7471868, 0.7098039, 0, 1, 1,
0.7881294, -1.795297, 2.281082, 0.7176471, 0, 1, 1,
0.7924559, 0.5582137, 0.0448998, 0.7215686, 0, 1, 1,
0.795964, -0.9503173, 2.06164, 0.7294118, 0, 1, 1,
0.7990544, -0.2533459, 2.356781, 0.7333333, 0, 1, 1,
0.8004861, -0.009711977, 1.161124, 0.7411765, 0, 1, 1,
0.8091562, 0.6195165, -0.3373754, 0.7450981, 0, 1, 1,
0.8098601, 0.7833402, 0.1548491, 0.7529412, 0, 1, 1,
0.8114758, -0.1914964, 2.501764, 0.7568628, 0, 1, 1,
0.8118504, 0.3772936, 0.8340654, 0.7647059, 0, 1, 1,
0.8218968, -0.00186741, 1.581155, 0.7686275, 0, 1, 1,
0.8228027, 2.239219, -0.2475143, 0.7764706, 0, 1, 1,
0.8365765, -0.8375312, 3.362165, 0.7803922, 0, 1, 1,
0.8420863, -2.577369, 1.625285, 0.7882353, 0, 1, 1,
0.8450251, -0.2122438, 2.487194, 0.7921569, 0, 1, 1,
0.8464031, -0.6843875, 1.886661, 0.8, 0, 1, 1,
0.8523144, -1.013198, 4.123363, 0.8078431, 0, 1, 1,
0.8553098, 0.489044, 2.52894, 0.8117647, 0, 1, 1,
0.8569511, -0.1597674, 1.553163, 0.8196079, 0, 1, 1,
0.8571436, 0.9036048, -0.2755581, 0.8235294, 0, 1, 1,
0.8572535, 0.7989897, 1.450151, 0.8313726, 0, 1, 1,
0.8620012, -0.2131734, 1.365422, 0.8352941, 0, 1, 1,
0.8630086, 1.401504, 1.630056, 0.8431373, 0, 1, 1,
0.8639147, 0.2671065, 1.807237, 0.8470588, 0, 1, 1,
0.8664344, -0.07683511, 2.412948, 0.854902, 0, 1, 1,
0.8715119, -0.9431623, 1.354829, 0.8588235, 0, 1, 1,
0.8716809, 0.1145155, 0.8985327, 0.8666667, 0, 1, 1,
0.8734713, -0.421514, 2.444495, 0.8705882, 0, 1, 1,
0.8739602, -1.291311, 2.150511, 0.8784314, 0, 1, 1,
0.8753389, -0.719366, 2.187419, 0.8823529, 0, 1, 1,
0.8754953, -0.1811845, 2.014194, 0.8901961, 0, 1, 1,
0.8783587, -0.3241141, 4.477589, 0.8941177, 0, 1, 1,
0.8812823, 0.3354959, 0.4251546, 0.9019608, 0, 1, 1,
0.8924524, 0.783478, 0.1897537, 0.9098039, 0, 1, 1,
0.8930978, 1.613232, 1.186739, 0.9137255, 0, 1, 1,
0.9129072, -0.5478325, 1.652526, 0.9215686, 0, 1, 1,
0.9131213, -1.342442, 1.267833, 0.9254902, 0, 1, 1,
0.9173704, 1.890397, -1.650836, 0.9333333, 0, 1, 1,
0.9197375, 0.8290656, 0.07228678, 0.9372549, 0, 1, 1,
0.920851, 1.069196, 0.2567725, 0.945098, 0, 1, 1,
0.9209892, -0.7997892, 1.358395, 0.9490196, 0, 1, 1,
0.9222555, -3.440732, 1.248992, 0.9568627, 0, 1, 1,
0.9293376, -0.6683261, 2.649088, 0.9607843, 0, 1, 1,
0.9361169, 0.5899221, 1.686838, 0.9686275, 0, 1, 1,
0.9444865, -0.1845724, 3.449867, 0.972549, 0, 1, 1,
0.9561439, 0.06341556, 1.294038, 0.9803922, 0, 1, 1,
0.9573658, 1.198738, -0.4953373, 0.9843137, 0, 1, 1,
0.9655133, -0.2320742, 2.715513, 0.9921569, 0, 1, 1,
0.9664947, -0.1408284, 3.338894, 0.9960784, 0, 1, 1,
0.9668265, 0.5060534, 0.9565434, 1, 0, 0.9960784, 1,
0.9714602, -0.05657072, 0.9596071, 1, 0, 0.9882353, 1,
0.9757082, 0.08829865, -0.294722, 1, 0, 0.9843137, 1,
0.990521, -1.106974, 2.129652, 1, 0, 0.9764706, 1,
0.9910495, 0.6824126, 0.7364761, 1, 0, 0.972549, 1,
0.993974, -1.22149, 1.929938, 1, 0, 0.9647059, 1,
0.9954782, -1.291458, 2.857905, 1, 0, 0.9607843, 1,
0.9984972, 0.3894287, 0.4138083, 1, 0, 0.9529412, 1,
1.001057, 1.062114, 2.276593, 1, 0, 0.9490196, 1,
1.005593, 1.730963, 1.767131, 1, 0, 0.9411765, 1,
1.008658, 0.01306357, 3.391027, 1, 0, 0.9372549, 1,
1.009328, -0.2110269, 2.65578, 1, 0, 0.9294118, 1,
1.015088, -0.3992969, 1.301093, 1, 0, 0.9254902, 1,
1.016756, 0.6280253, -0.1239789, 1, 0, 0.9176471, 1,
1.020131, 1.634052, 1.001747, 1, 0, 0.9137255, 1,
1.021813, 0.1367467, 3.210826, 1, 0, 0.9058824, 1,
1.024995, -1.112171, 2.804122, 1, 0, 0.9019608, 1,
1.034632, 0.4710035, 1.886746, 1, 0, 0.8941177, 1,
1.034898, 1.548582, 0.5482807, 1, 0, 0.8862745, 1,
1.037339, -0.711717, 1.324947, 1, 0, 0.8823529, 1,
1.042304, 1.082291, 1.554721, 1, 0, 0.8745098, 1,
1.049922, -0.4932477, 0.8280593, 1, 0, 0.8705882, 1,
1.050895, 0.6719306, -0.1723365, 1, 0, 0.8627451, 1,
1.053192, 1.59388, -1.006295, 1, 0, 0.8588235, 1,
1.055168, -0.1400033, 2.036076, 1, 0, 0.8509804, 1,
1.06175, -0.9823549, 3.635683, 1, 0, 0.8470588, 1,
1.082989, 0.02439851, 0.8038237, 1, 0, 0.8392157, 1,
1.086608, 2.567405, 0.5677481, 1, 0, 0.8352941, 1,
1.093753, -0.2889963, 1.774212, 1, 0, 0.827451, 1,
1.094071, 0.6194665, 1.476615, 1, 0, 0.8235294, 1,
1.097339, -0.4257389, -0.4716263, 1, 0, 0.8156863, 1,
1.101834, -0.476805, 1.745869, 1, 0, 0.8117647, 1,
1.102426, -1.479354, 1.057964, 1, 0, 0.8039216, 1,
1.106038, 0.4576285, -1.378499, 1, 0, 0.7960784, 1,
1.113546, -0.717521, 0.7693025, 1, 0, 0.7921569, 1,
1.11943, 1.243167, 0.9666035, 1, 0, 0.7843137, 1,
1.124515, -0.3088172, 0.2041501, 1, 0, 0.7803922, 1,
1.127182, 0.5444391, 2.786088, 1, 0, 0.772549, 1,
1.129569, 0.4507366, 0.4318268, 1, 0, 0.7686275, 1,
1.136416, 0.7287025, 2.356645, 1, 0, 0.7607843, 1,
1.14076, -1.069555, 3.861151, 1, 0, 0.7568628, 1,
1.141423, 0.7623776, 0.9693326, 1, 0, 0.7490196, 1,
1.147079, 0.4719035, 1.34043, 1, 0, 0.7450981, 1,
1.147203, 1.453476, 0.134967, 1, 0, 0.7372549, 1,
1.156529, -2.061845, 0.9906722, 1, 0, 0.7333333, 1,
1.157005, 1.614143, 0.3507587, 1, 0, 0.7254902, 1,
1.17258, 1.30053, 1.377255, 1, 0, 0.7215686, 1,
1.177301, -0.5951403, 1.491889, 1, 0, 0.7137255, 1,
1.183363, 0.1240905, 0.3896386, 1, 0, 0.7098039, 1,
1.18435, 0.5016154, 0.9443321, 1, 0, 0.7019608, 1,
1.189906, 0.1668183, 0.4687383, 1, 0, 0.6941177, 1,
1.199478, 0.8637682, 1.382203, 1, 0, 0.6901961, 1,
1.204171, 1.558316, -0.4583201, 1, 0, 0.682353, 1,
1.206213, 0.536065, 1.580884, 1, 0, 0.6784314, 1,
1.213291, 0.1086899, 1.560478, 1, 0, 0.6705883, 1,
1.222951, 1.103304, 0.2251245, 1, 0, 0.6666667, 1,
1.242369, -0.7040423, 2.271948, 1, 0, 0.6588235, 1,
1.255216, -0.3525461, 0.7327407, 1, 0, 0.654902, 1,
1.257091, 0.3555656, 0.8964009, 1, 0, 0.6470588, 1,
1.258876, -1.378635, 1.825522, 1, 0, 0.6431373, 1,
1.273811, -2.103011, 0.6794056, 1, 0, 0.6352941, 1,
1.282233, 0.3116886, 1.369263, 1, 0, 0.6313726, 1,
1.290965, 1.042528, 0.07825148, 1, 0, 0.6235294, 1,
1.296191, -0.7950115, 0.6169222, 1, 0, 0.6196079, 1,
1.313295, -0.2561284, 0.4041172, 1, 0, 0.6117647, 1,
1.338851, -0.1103397, 3.090452, 1, 0, 0.6078432, 1,
1.348294, -0.05140753, 2.115906, 1, 0, 0.6, 1,
1.371358, -0.8508292, 2.828495, 1, 0, 0.5921569, 1,
1.378541, -0.9761657, 2.090913, 1, 0, 0.5882353, 1,
1.378596, 0.5884107, 0.8020267, 1, 0, 0.5803922, 1,
1.381967, 0.2588625, 0.5666543, 1, 0, 0.5764706, 1,
1.387823, 0.09445124, 1.953454, 1, 0, 0.5686275, 1,
1.389878, 2.17425, 1.640198, 1, 0, 0.5647059, 1,
1.390718, 0.1549062, 0.6371742, 1, 0, 0.5568628, 1,
1.409793, 0.5858639, 1.154877, 1, 0, 0.5529412, 1,
1.430195, -1.352453, 3.975268, 1, 0, 0.5450981, 1,
1.431299, 0.01582816, 0.8702158, 1, 0, 0.5411765, 1,
1.438585, -1.397511, 3.950467, 1, 0, 0.5333334, 1,
1.442776, 0.4818634, 1.789359, 1, 0, 0.5294118, 1,
1.442914, -0.192233, 0.2721087, 1, 0, 0.5215687, 1,
1.453013, -0.7112745, 4.377237, 1, 0, 0.5176471, 1,
1.454543, -0.845637, 2.451746, 1, 0, 0.509804, 1,
1.462472, 0.8248632, 0.7724895, 1, 0, 0.5058824, 1,
1.476548, 0.9193079, 1.614353, 1, 0, 0.4980392, 1,
1.479206, -1.714958, 3.189724, 1, 0, 0.4901961, 1,
1.484361, 0.07197209, 1.417787, 1, 0, 0.4862745, 1,
1.487177, -0.55887, 1.601077, 1, 0, 0.4784314, 1,
1.487822, 0.315995, 3.310661, 1, 0, 0.4745098, 1,
1.48851, -0.162871, 3.856109, 1, 0, 0.4666667, 1,
1.490191, 0.0717434, 0.7489356, 1, 0, 0.4627451, 1,
1.49658, 0.05259861, 2.680616, 1, 0, 0.454902, 1,
1.509095, 0.3347544, 1.40495, 1, 0, 0.4509804, 1,
1.509821, -0.2994671, 1.467657, 1, 0, 0.4431373, 1,
1.512675, -0.501529, -0.4736911, 1, 0, 0.4392157, 1,
1.524591, 0.8318262, 1.526693, 1, 0, 0.4313726, 1,
1.527037, -0.7208322, 1.534974, 1, 0, 0.427451, 1,
1.529532, 0.9112272, 2.365942, 1, 0, 0.4196078, 1,
1.545898, 0.3644612, 1.040008, 1, 0, 0.4156863, 1,
1.548375, 0.9991005, 1.219673, 1, 0, 0.4078431, 1,
1.549061, 0.1393872, 2.53179, 1, 0, 0.4039216, 1,
1.557743, 0.3515925, 1.270377, 1, 0, 0.3960784, 1,
1.576162, -0.5358583, 3.042965, 1, 0, 0.3882353, 1,
1.585409, -0.768065, 1.137372, 1, 0, 0.3843137, 1,
1.586979, 0.9404678, 1.100111, 1, 0, 0.3764706, 1,
1.587741, -2.165508, 2.232384, 1, 0, 0.372549, 1,
1.60978, 0.2583675, 1.740056, 1, 0, 0.3647059, 1,
1.623051, 0.2393107, 1.300969, 1, 0, 0.3607843, 1,
1.626222, 1.39054, 1.463977, 1, 0, 0.3529412, 1,
1.630105, 0.6221372, 3.082257, 1, 0, 0.3490196, 1,
1.643474, 1.765869, -1.698069, 1, 0, 0.3411765, 1,
1.659647, -1.487654, 3.182503, 1, 0, 0.3372549, 1,
1.682807, 1.358483, 1.522924, 1, 0, 0.3294118, 1,
1.694532, 0.14055, -0.5752712, 1, 0, 0.3254902, 1,
1.705903, -1.39624, 3.236001, 1, 0, 0.3176471, 1,
1.706246, 0.7822552, 0.06397327, 1, 0, 0.3137255, 1,
1.713079, -0.7020349, 2.150886, 1, 0, 0.3058824, 1,
1.719835, 0.5758669, 1.819821, 1, 0, 0.2980392, 1,
1.735453, 0.8573917, 1.295639, 1, 0, 0.2941177, 1,
1.73598, -3.214041, 2.766531, 1, 0, 0.2862745, 1,
1.745109, 0.142041, 0.9700771, 1, 0, 0.282353, 1,
1.762213, 0.9625811, 1.944688, 1, 0, 0.2745098, 1,
1.770906, -1.516351, 3.447587, 1, 0, 0.2705882, 1,
1.777248, -0.009455951, 1.774127, 1, 0, 0.2627451, 1,
1.777488, -0.7149054, 3.573061, 1, 0, 0.2588235, 1,
1.789005, -1.306867, 1.192337, 1, 0, 0.2509804, 1,
1.802502, -0.796322, 2.211313, 1, 0, 0.2470588, 1,
1.80989, -1.022647, 3.679595, 1, 0, 0.2392157, 1,
1.875127, -0.1581865, 2.037394, 1, 0, 0.2352941, 1,
1.895919, 0.1054729, 1.114141, 1, 0, 0.227451, 1,
1.917203, 0.8248701, 2.204401, 1, 0, 0.2235294, 1,
1.941651, 0.3372183, 2.682786, 1, 0, 0.2156863, 1,
1.952256, -0.2247434, 2.512644, 1, 0, 0.2117647, 1,
1.967072, -1.154527, 2.992654, 1, 0, 0.2039216, 1,
1.968122, -0.321837, -1.420468, 1, 0, 0.1960784, 1,
1.976402, 0.9226311, 1.726817, 1, 0, 0.1921569, 1,
1.987876, 0.1738942, 0.9108437, 1, 0, 0.1843137, 1,
1.998459, -1.916726, 3.079639, 1, 0, 0.1803922, 1,
2.012451, -0.7414332, 2.681902, 1, 0, 0.172549, 1,
2.02023, -1.288773, 1.100183, 1, 0, 0.1686275, 1,
2.064577, -0.305244, 2.125762, 1, 0, 0.1607843, 1,
2.085767, 0.8785159, 1.354648, 1, 0, 0.1568628, 1,
2.102927, -0.8347359, 2.423896, 1, 0, 0.1490196, 1,
2.108101, 0.171169, 1.448699, 1, 0, 0.145098, 1,
2.108305, -0.08395366, 2.933227, 1, 0, 0.1372549, 1,
2.110883, -1.308923, 2.148086, 1, 0, 0.1333333, 1,
2.114676, -0.6254362, 1.989054, 1, 0, 0.1254902, 1,
2.117574, 0.6557927, 0.4280161, 1, 0, 0.1215686, 1,
2.127988, -0.5428903, 2.00062, 1, 0, 0.1137255, 1,
2.142442, -0.5699341, 1.388839, 1, 0, 0.1098039, 1,
2.166192, 0.4742642, 1.629436, 1, 0, 0.1019608, 1,
2.169403, 0.5205554, -1.27228, 1, 0, 0.09411765, 1,
2.219539, 0.6637359, 1.48056, 1, 0, 0.09019608, 1,
2.234468, -0.4728484, 1.587692, 1, 0, 0.08235294, 1,
2.234699, 0.9600753, 0.09219364, 1, 0, 0.07843138, 1,
2.259261, 0.9653052, 2.255536, 1, 0, 0.07058824, 1,
2.275726, 1.257308, 0.8948762, 1, 0, 0.06666667, 1,
2.279964, 0.09501759, 1.507017, 1, 0, 0.05882353, 1,
2.325527, 0.01219459, 1.830262, 1, 0, 0.05490196, 1,
2.380044, -0.3889369, 1.394287, 1, 0, 0.04705882, 1,
2.380514, -1.515302, 2.628186, 1, 0, 0.04313726, 1,
2.4023, -1.589099, 1.674994, 1, 0, 0.03529412, 1,
2.440836, -0.973968, 0.3401332, 1, 0, 0.03137255, 1,
2.503333, 0.8124219, -0.4300925, 1, 0, 0.02352941, 1,
2.706605, 0.1130156, 1.210304, 1, 0, 0.01960784, 1,
2.980076, -0.2154649, 1.811524, 1, 0, 0.01176471, 1,
3.174309, -0.1456353, 2.327673, 1, 0, 0.007843138, 1
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
0.08888245, -4.506373, -7.24998, 0, -0.5, 0.5, 0.5,
0.08888245, -4.506373, -7.24998, 1, -0.5, 0.5, 0.5,
0.08888245, -4.506373, -7.24998, 1, 1.5, 0.5, 0.5,
0.08888245, -4.506373, -7.24998, 0, 1.5, 0.5, 0.5
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
-4.042503, -0.2972485, -7.24998, 0, -0.5, 0.5, 0.5,
-4.042503, -0.2972485, -7.24998, 1, -0.5, 0.5, 0.5,
-4.042503, -0.2972485, -7.24998, 1, 1.5, 0.5, 0.5,
-4.042503, -0.2972485, -7.24998, 0, 1.5, 0.5, 0.5
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
-4.042503, -4.506373, -0.001146555, 0, -0.5, 0.5, 0.5,
-4.042503, -4.506373, -0.001146555, 1, -0.5, 0.5, 0.5,
-4.042503, -4.506373, -0.001146555, 1, 1.5, 0.5, 0.5,
-4.042503, -4.506373, -0.001146555, 0, 1.5, 0.5, 0.5
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
-2, -3.535037, -5.577172,
3, -3.535037, -5.577172,
-2, -3.535037, -5.577172,
-2, -3.696926, -5.855974,
-1, -3.535037, -5.577172,
-1, -3.696926, -5.855974,
0, -3.535037, -5.577172,
0, -3.696926, -5.855974,
1, -3.535037, -5.577172,
1, -3.696926, -5.855974,
2, -3.535037, -5.577172,
2, -3.696926, -5.855974,
3, -3.535037, -5.577172,
3, -3.696926, -5.855974
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
-2, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
-2, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
-2, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
-2, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5,
-1, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
-1, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
-1, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
-1, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5,
0, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
0, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
0, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
0, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5,
1, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
1, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
1, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
1, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5,
2, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
2, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
2, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
2, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5,
3, -4.020705, -6.413576, 0, -0.5, 0.5, 0.5,
3, -4.020705, -6.413576, 1, -0.5, 0.5, 0.5,
3, -4.020705, -6.413576, 1, 1.5, 0.5, 0.5,
3, -4.020705, -6.413576, 0, 1.5, 0.5, 0.5
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
-3.089106, -3, -5.577172,
-3.089106, 2, -5.577172,
-3.089106, -3, -5.577172,
-3.248006, -3, -5.855974,
-3.089106, -2, -5.577172,
-3.248006, -2, -5.855974,
-3.089106, -1, -5.577172,
-3.248006, -1, -5.855974,
-3.089106, 0, -5.577172,
-3.248006, 0, -5.855974,
-3.089106, 1, -5.577172,
-3.248006, 1, -5.855974,
-3.089106, 2, -5.577172,
-3.248006, 2, -5.855974
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
-3.565805, -3, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, -3, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, -3, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, -3, -6.413576, 0, 1.5, 0.5, 0.5,
-3.565805, -2, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, -2, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, -2, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, -2, -6.413576, 0, 1.5, 0.5, 0.5,
-3.565805, -1, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, -1, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, -1, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, -1, -6.413576, 0, 1.5, 0.5, 0.5,
-3.565805, 0, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, 0, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, 0, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, 0, -6.413576, 0, 1.5, 0.5, 0.5,
-3.565805, 1, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, 1, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, 1, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, 1, -6.413576, 0, 1.5, 0.5, 0.5,
-3.565805, 2, -6.413576, 0, -0.5, 0.5, 0.5,
-3.565805, 2, -6.413576, 1, -0.5, 0.5, 0.5,
-3.565805, 2, -6.413576, 1, 1.5, 0.5, 0.5,
-3.565805, 2, -6.413576, 0, 1.5, 0.5, 0.5
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
-3.089106, -3.535037, -4,
-3.089106, -3.535037, 4,
-3.089106, -3.535037, -4,
-3.248006, -3.696926, -4,
-3.089106, -3.535037, -2,
-3.248006, -3.696926, -2,
-3.089106, -3.535037, 0,
-3.248006, -3.696926, 0,
-3.089106, -3.535037, 2,
-3.248006, -3.696926, 2,
-3.089106, -3.535037, 4,
-3.248006, -3.696926, 4
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
-3.565805, -4.020705, -4, 0, -0.5, 0.5, 0.5,
-3.565805, -4.020705, -4, 1, -0.5, 0.5, 0.5,
-3.565805, -4.020705, -4, 1, 1.5, 0.5, 0.5,
-3.565805, -4.020705, -4, 0, 1.5, 0.5, 0.5,
-3.565805, -4.020705, -2, 0, -0.5, 0.5, 0.5,
-3.565805, -4.020705, -2, 1, -0.5, 0.5, 0.5,
-3.565805, -4.020705, -2, 1, 1.5, 0.5, 0.5,
-3.565805, -4.020705, -2, 0, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 0, 0, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 0, 1, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 0, 1, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 0, 0, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 2, 0, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 2, 1, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 2, 1, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 2, 0, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 4, 0, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 4, 1, -0.5, 0.5, 0.5,
-3.565805, -4.020705, 4, 1, 1.5, 0.5, 0.5,
-3.565805, -4.020705, 4, 0, 1.5, 0.5, 0.5
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
-3.089106, -3.535037, -5.577172,
-3.089106, 2.94054, -5.577172,
-3.089106, -3.535037, 5.574879,
-3.089106, 2.94054, 5.574879,
-3.089106, -3.535037, -5.577172,
-3.089106, -3.535037, 5.574879,
-3.089106, 2.94054, -5.577172,
-3.089106, 2.94054, 5.574879,
-3.089106, -3.535037, -5.577172,
3.266871, -3.535037, -5.577172,
-3.089106, -3.535037, 5.574879,
3.266871, -3.535037, 5.574879,
-3.089106, 2.94054, -5.577172,
3.266871, 2.94054, -5.577172,
-3.089106, 2.94054, 5.574879,
3.266871, 2.94054, 5.574879,
3.266871, -3.535037, -5.577172,
3.266871, 2.94054, -5.577172,
3.266871, -3.535037, 5.574879,
3.266871, 2.94054, 5.574879,
3.266871, -3.535037, -5.577172,
3.266871, -3.535037, 5.574879,
3.266871, 2.94054, -5.577172,
3.266871, 2.94054, 5.574879
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
var radius = 7.67707;
var distance = 34.15615;
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
mvMatrix.translate( -0.08888245, 0.2972485, 0.001146555 );
mvMatrix.scale( 1.305951, 1.281832, 0.7443113 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15615);
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
dichloromethane<-read.table("dichloromethane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dichloromethane$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
```

```r
y<-dichloromethane$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
```

```r
z<-dichloromethane$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
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
-2.996544, 0.5055264, -0.9010482, 0, 0, 1, 1, 1,
-2.995128, 1.960581, -0.8740926, 1, 0, 0, 1, 1,
-2.966454, 1.843967, 0.6455047, 1, 0, 0, 1, 1,
-2.919805, 0.7952949, -1.58026, 1, 0, 0, 1, 1,
-2.733328, 0.3837595, -1.203132, 1, 0, 0, 1, 1,
-2.655473, -0.1912205, -2.032358, 1, 0, 0, 1, 1,
-2.59003, -1.176192, -3.154407, 0, 0, 0, 1, 1,
-2.465168, -0.1529875, -2.294345, 0, 0, 0, 1, 1,
-2.392075, 0.8104742, -0.8440191, 0, 0, 0, 1, 1,
-2.367069, 1.815214, -0.8069599, 0, 0, 0, 1, 1,
-2.355965, -0.08830578, -1.551723, 0, 0, 0, 1, 1,
-2.239081, -0.1292244, -2.149725, 0, 0, 0, 1, 1,
-2.211411, -1.375562, -1.123016, 0, 0, 0, 1, 1,
-2.207133, 0.929168, 0.9803864, 1, 1, 1, 1, 1,
-2.1616, 0.5319921, -2.245792, 1, 1, 1, 1, 1,
-2.146025, -0.03193083, -2.998303, 1, 1, 1, 1, 1,
-2.121347, 0.2415131, 0.614056, 1, 1, 1, 1, 1,
-2.070589, 0.9911792, -0.206775, 1, 1, 1, 1, 1,
-2.060567, 2.175321, -0.8312182, 1, 1, 1, 1, 1,
-2.05162, -1.077778, -1.364839, 1, 1, 1, 1, 1,
-2.033249, 0.343675, -2.371435, 1, 1, 1, 1, 1,
-2.018143, 0.961746, -2.311904, 1, 1, 1, 1, 1,
-1.974206, 0.6311355, -1.946319, 1, 1, 1, 1, 1,
-1.917758, -0.01683114, -1.220636, 1, 1, 1, 1, 1,
-1.853464, 1.580513, -2.095104, 1, 1, 1, 1, 1,
-1.843618, 0.5977005, 0.9160782, 1, 1, 1, 1, 1,
-1.843284, -0.3088451, -1.101522, 1, 1, 1, 1, 1,
-1.774686, 0.3045758, -0.1617683, 1, 1, 1, 1, 1,
-1.770952, 0.339722, -2.074843, 0, 0, 1, 1, 1,
-1.753598, 0.2160684, -1.065033, 1, 0, 0, 1, 1,
-1.747273, -1.566088, -1.445335, 1, 0, 0, 1, 1,
-1.746221, -0.3084273, -2.112527, 1, 0, 0, 1, 1,
-1.738119, -0.1981707, -3.747652, 1, 0, 0, 1, 1,
-1.724811, -0.1037028, -1.316978, 1, 0, 0, 1, 1,
-1.7244, 0.2959496, -1.035029, 0, 0, 0, 1, 1,
-1.722395, 0.503823, -0.7093589, 0, 0, 0, 1, 1,
-1.7068, 0.5373681, -2.361005, 0, 0, 0, 1, 1,
-1.687705, 2.214061, -1.150326, 0, 0, 0, 1, 1,
-1.685001, 0.2181026, -2.481043, 0, 0, 0, 1, 1,
-1.684631, -0.4601367, -1.464221, 0, 0, 0, 1, 1,
-1.670011, -1.920413, -1.952863, 0, 0, 0, 1, 1,
-1.657037, 1.080437, -3.866463, 1, 1, 1, 1, 1,
-1.641582, -0.9140051, -0.6797346, 1, 1, 1, 1, 1,
-1.636134, -1.120021, -3.449178, 1, 1, 1, 1, 1,
-1.635919, 1.394596, 0.02256783, 1, 1, 1, 1, 1,
-1.630874, 0.4787149, -0.4323221, 1, 1, 1, 1, 1,
-1.627637, 0.1600265, -2.745231, 1, 1, 1, 1, 1,
-1.593191, -1.796377, -3.350243, 1, 1, 1, 1, 1,
-1.587202, 0.8381529, -1.464852, 1, 1, 1, 1, 1,
-1.551652, 0.5459189, -2.798622, 1, 1, 1, 1, 1,
-1.544518, 1.239529, -0.8026854, 1, 1, 1, 1, 1,
-1.543961, -0.3195053, -4.060169, 1, 1, 1, 1, 1,
-1.543428, 0.0850241, -1.986635, 1, 1, 1, 1, 1,
-1.533279, -0.8276996, -0.7653184, 1, 1, 1, 1, 1,
-1.523806, -0.3882925, -1.507802, 1, 1, 1, 1, 1,
-1.513046, -1.352757, -2.829377, 1, 1, 1, 1, 1,
-1.512462, -0.2344847, -0.773227, 0, 0, 1, 1, 1,
-1.508969, -0.2321479, -1.248701, 1, 0, 0, 1, 1,
-1.503666, -0.2969417, -1.766475, 1, 0, 0, 1, 1,
-1.497342, 1.087804, -0.3169007, 1, 0, 0, 1, 1,
-1.492862, -0.2597589, -1.949358, 1, 0, 0, 1, 1,
-1.488176, 1.272594, -0.8276015, 1, 0, 0, 1, 1,
-1.470713, -0.4976558, -2.969135, 0, 0, 0, 1, 1,
-1.456061, -1.290757, -2.380296, 0, 0, 0, 1, 1,
-1.44959, -0.3355432, -3.446284, 0, 0, 0, 1, 1,
-1.439299, 0.166677, -4.108213, 0, 0, 0, 1, 1,
-1.424891, 0.1834455, 0.106966, 0, 0, 0, 1, 1,
-1.414117, 1.460172, -0.4564122, 0, 0, 0, 1, 1,
-1.413829, -0.4654235, -1.0734, 0, 0, 0, 1, 1,
-1.409478, 0.2884036, -1.550324, 1, 1, 1, 1, 1,
-1.400601, 0.7653809, -2.680694, 1, 1, 1, 1, 1,
-1.400173, 0.7926008, -2.10481, 1, 1, 1, 1, 1,
-1.394235, -0.5780184, -3.440918, 1, 1, 1, 1, 1,
-1.393022, -0.4123164, -3.02336, 1, 1, 1, 1, 1,
-1.391824, 0.3629598, -0.6721522, 1, 1, 1, 1, 1,
-1.387371, 0.09106074, -1.974847, 1, 1, 1, 1, 1,
-1.386596, 0.1577573, -3.564774, 1, 1, 1, 1, 1,
-1.380139, -1.326341, -2.370319, 1, 1, 1, 1, 1,
-1.380055, -1.243329, -1.98846, 1, 1, 1, 1, 1,
-1.377272, 0.0124583, -2.134888, 1, 1, 1, 1, 1,
-1.373433, 0.5639815, -0.5005335, 1, 1, 1, 1, 1,
-1.368866, 0.3191074, -2.451883, 1, 1, 1, 1, 1,
-1.363856, -0.7118226, -2.908008, 1, 1, 1, 1, 1,
-1.354301, 1.171019, -1.011733, 1, 1, 1, 1, 1,
-1.353386, -0.4626962, -1.758101, 0, 0, 1, 1, 1,
-1.342949, -0.9101348, -2.649093, 1, 0, 0, 1, 1,
-1.34286, 0.2168157, 0.04950385, 1, 0, 0, 1, 1,
-1.340712, 1.120566, -2.235939, 1, 0, 0, 1, 1,
-1.33794, -0.1952609, -1.672042, 1, 0, 0, 1, 1,
-1.329528, -0.9086605, -2.989458, 1, 0, 0, 1, 1,
-1.320431, -1.287919, -1.357724, 0, 0, 0, 1, 1,
-1.310889, -0.8346394, -2.433831, 0, 0, 0, 1, 1,
-1.309303, 0.7067284, -1.029986, 0, 0, 0, 1, 1,
-1.307909, 1.244407, -0.9174016, 0, 0, 0, 1, 1,
-1.302449, 0.9300924, -0.144969, 0, 0, 0, 1, 1,
-1.29404, 2.456992, -0.6960923, 0, 0, 0, 1, 1,
-1.28497, -0.9492741, -3.870394, 0, 0, 0, 1, 1,
-1.271441, 2.752726, -1.5654, 1, 1, 1, 1, 1,
-1.261201, -0.5118011, -2.963709, 1, 1, 1, 1, 1,
-1.259334, 0.5144543, -0.9298806, 1, 1, 1, 1, 1,
-1.246605, -0.3992657, -1.729136, 1, 1, 1, 1, 1,
-1.240273, -0.6147729, -2.763091, 1, 1, 1, 1, 1,
-1.239756, 0.4249559, -1.748547, 1, 1, 1, 1, 1,
-1.230015, 0.2462828, -1.740237, 1, 1, 1, 1, 1,
-1.226362, -0.1883907, -1.738815, 1, 1, 1, 1, 1,
-1.223265, -1.527968, -1.862418, 1, 1, 1, 1, 1,
-1.207384, -0.399754, -0.9389372, 1, 1, 1, 1, 1,
-1.206398, -0.1534103, -0.2962505, 1, 1, 1, 1, 1,
-1.198103, -0.3843745, -0.8564211, 1, 1, 1, 1, 1,
-1.186096, -1.073509, -3.407858, 1, 1, 1, 1, 1,
-1.183198, 0.6306531, -1.713326, 1, 1, 1, 1, 1,
-1.174904, 0.6939042, -0.920887, 1, 1, 1, 1, 1,
-1.167224, 1.428369, -1.122905, 0, 0, 1, 1, 1,
-1.156525, 0.9365892, -1.390194, 1, 0, 0, 1, 1,
-1.155962, -0.08846419, -1.187674, 1, 0, 0, 1, 1,
-1.155062, -1.558254, -2.274212, 1, 0, 0, 1, 1,
-1.153831, 0.4086365, -0.7523263, 1, 0, 0, 1, 1,
-1.153582, -1.124142, -2.663817, 1, 0, 0, 1, 1,
-1.146645, -0.7373379, -1.408076, 0, 0, 0, 1, 1,
-1.144783, 0.3715941, -1.231492, 0, 0, 0, 1, 1,
-1.141154, -0.2427696, -2.002674, 0, 0, 0, 1, 1,
-1.141042, 0.3661565, -0.3802266, 0, 0, 0, 1, 1,
-1.13938, -0.2357077, -2.367111, 0, 0, 0, 1, 1,
-1.134748, -1.349558, -3.055827, 0, 0, 0, 1, 1,
-1.132607, -0.8922423, -1.474826, 0, 0, 0, 1, 1,
-1.131564, -3.085998, -1.153721, 1, 1, 1, 1, 1,
-1.131206, -0.1862974, -1.288457, 1, 1, 1, 1, 1,
-1.130989, -1.702864, -3.338148, 1, 1, 1, 1, 1,
-1.119987, 0.282495, -0.6573249, 1, 1, 1, 1, 1,
-1.117679, -1.283816, -3.330811, 1, 1, 1, 1, 1,
-1.117259, -0.5141819, -2.431509, 1, 1, 1, 1, 1,
-1.11589, 0.6789848, -0.5439033, 1, 1, 1, 1, 1,
-1.114089, 0.2165439, 0.01117151, 1, 1, 1, 1, 1,
-1.108499, -0.1015624, -1.186635, 1, 1, 1, 1, 1,
-1.102487, -0.9675686, -2.596972, 1, 1, 1, 1, 1,
-1.100106, 1.171434, -1.822754, 1, 1, 1, 1, 1,
-1.094485, 1.832927, -0.1848014, 1, 1, 1, 1, 1,
-1.09246, -0.5286037, -1.296945, 1, 1, 1, 1, 1,
-1.088639, -0.6287678, -1.22088, 1, 1, 1, 1, 1,
-1.069344, 1.432211, 1.147778, 1, 1, 1, 1, 1,
-1.06885, 0.05752352, -0.6495632, 0, 0, 1, 1, 1,
-1.068582, 0.04346628, -2.302788, 1, 0, 0, 1, 1,
-1.064795, -0.3511315, -1.970097, 1, 0, 0, 1, 1,
-1.063759, 1.164635, -0.6859937, 1, 0, 0, 1, 1,
-1.0633, 0.6506063, -1.853476, 1, 0, 0, 1, 1,
-1.056522, -1.59814, -1.007311, 1, 0, 0, 1, 1,
-1.051706, -0.6387867, -2.46753, 0, 0, 0, 1, 1,
-1.039763, -0.07782069, -2.799059, 0, 0, 0, 1, 1,
-1.025527, -2.444459, -2.807632, 0, 0, 0, 1, 1,
-1.023699, 0.2073359, -2.72166, 0, 0, 0, 1, 1,
-1.018353, 0.6164974, -1.097437, 0, 0, 0, 1, 1,
-1.00888, 0.005815914, -0.04383309, 0, 0, 0, 1, 1,
-0.9955634, -0.1734079, -1.35825, 0, 0, 0, 1, 1,
-0.9933931, 0.6316749, -1.859867, 1, 1, 1, 1, 1,
-0.9895088, -0.1677957, -2.866716, 1, 1, 1, 1, 1,
-0.9872544, -0.6252199, -3.586971, 1, 1, 1, 1, 1,
-0.98721, -1.074891, -2.129014, 1, 1, 1, 1, 1,
-0.9854737, -0.8316692, -3.015609, 1, 1, 1, 1, 1,
-0.9808989, 1.367981, -0.1555569, 1, 1, 1, 1, 1,
-0.9770242, -1.380729, -2.673713, 1, 1, 1, 1, 1,
-0.9756903, -0.3164068, -3.71626, 1, 1, 1, 1, 1,
-0.9730737, 1.75201, -2.144987, 1, 1, 1, 1, 1,
-0.9708748, 1.132591, -0.7159218, 1, 1, 1, 1, 1,
-0.9647208, -0.1925976, -2.388391, 1, 1, 1, 1, 1,
-0.9607164, 1.727809, -2.606863, 1, 1, 1, 1, 1,
-0.9591078, 0.1653613, -1.046837, 1, 1, 1, 1, 1,
-0.956883, 0.2834834, -1.258174, 1, 1, 1, 1, 1,
-0.9562519, 0.6812488, -0.434491, 1, 1, 1, 1, 1,
-0.9523273, -0.7120653, -2.92214, 0, 0, 1, 1, 1,
-0.95047, -0.7627901, -1.262714, 1, 0, 0, 1, 1,
-0.9485573, 0.4562136, -2.629645, 1, 0, 0, 1, 1,
-0.9445531, 1.499602, -0.1058212, 1, 0, 0, 1, 1,
-0.9366243, -1.539256, -2.015697, 1, 0, 0, 1, 1,
-0.9322236, 0.2012418, -2.189815, 1, 0, 0, 1, 1,
-0.9238691, 0.2308762, -2.476299, 0, 0, 0, 1, 1,
-0.9193981, 0.861843, -0.8432506, 0, 0, 0, 1, 1,
-0.9118318, 0.1024672, -1.785709, 0, 0, 0, 1, 1,
-0.9089902, -0.6105573, -2.124311, 0, 0, 0, 1, 1,
-0.9069262, -0.1141561, -1.144754, 0, 0, 0, 1, 1,
-0.8999085, 0.008832202, -1.838442, 0, 0, 0, 1, 1,
-0.8978463, -0.8363838, -1.738903, 0, 0, 0, 1, 1,
-0.8972954, 1.340578, -1.239435, 1, 1, 1, 1, 1,
-0.8938529, 1.896985, -0.6904596, 1, 1, 1, 1, 1,
-0.892001, 0.1627655, 0.308718, 1, 1, 1, 1, 1,
-0.8912638, -0.1574043, -1.468886, 1, 1, 1, 1, 1,
-0.8855069, -3.011778, -1.138952, 1, 1, 1, 1, 1,
-0.8812668, 0.1862323, -1.020725, 1, 1, 1, 1, 1,
-0.8764272, 1.090962, 1.733048, 1, 1, 1, 1, 1,
-0.8715174, -0.6244944, -1.826658, 1, 1, 1, 1, 1,
-0.8715032, 0.1914727, -0.5523381, 1, 1, 1, 1, 1,
-0.8601375, -0.5001637, -2.377029, 1, 1, 1, 1, 1,
-0.8543577, 0.3604813, -0.418912, 1, 1, 1, 1, 1,
-0.8456001, 0.4891651, -1.279872, 1, 1, 1, 1, 1,
-0.8409608, 1.155642, -1.364507, 1, 1, 1, 1, 1,
-0.8398463, 0.1779999, -0.3211882, 1, 1, 1, 1, 1,
-0.8396485, 0.08189613, -0.9648191, 1, 1, 1, 1, 1,
-0.8387261, -0.7488879, -3.213389, 0, 0, 1, 1, 1,
-0.8385783, -0.8501433, -2.01955, 1, 0, 0, 1, 1,
-0.8334107, 0.05850028, -1.303427, 1, 0, 0, 1, 1,
-0.8227649, 0.02691477, -0.8096972, 1, 0, 0, 1, 1,
-0.8222564, 0.6248941, -0.9815665, 1, 0, 0, 1, 1,
-0.81827, -1.789918, -2.973536, 1, 0, 0, 1, 1,
-0.8145173, 0.2932814, -2.508813, 0, 0, 0, 1, 1,
-0.8136916, 0.4612741, -0.7281144, 0, 0, 0, 1, 1,
-0.8051725, 1.404297, 0.5309186, 0, 0, 0, 1, 1,
-0.800249, 0.7211083, -1.569701, 0, 0, 0, 1, 1,
-0.7977192, -1.219556, -1.869552, 0, 0, 0, 1, 1,
-0.7958821, -0.1206352, -2.327842, 0, 0, 0, 1, 1,
-0.7942272, -0.7830802, -3.338925, 0, 0, 0, 1, 1,
-0.787705, 0.8019766, -0.3995052, 1, 1, 1, 1, 1,
-0.783097, 0.1969371, -1.909691, 1, 1, 1, 1, 1,
-0.7814459, 2.846235, -0.2575803, 1, 1, 1, 1, 1,
-0.7803764, 0.5280885, 1.923292, 1, 1, 1, 1, 1,
-0.7787835, -0.1219968, -2.871395, 1, 1, 1, 1, 1,
-0.7735125, -0.09384088, -1.770295, 1, 1, 1, 1, 1,
-0.7729831, 0.03967135, -0.6164026, 1, 1, 1, 1, 1,
-0.7729197, -0.4629117, -2.115793, 1, 1, 1, 1, 1,
-0.7721717, -0.1605491, -3.516247, 1, 1, 1, 1, 1,
-0.7705688, -1.396838, -2.81232, 1, 1, 1, 1, 1,
-0.766001, 1.208616, -0.9724772, 1, 1, 1, 1, 1,
-0.7656282, 0.09445841, -3.048502, 1, 1, 1, 1, 1,
-0.7588325, -0.9362846, -1.299303, 1, 1, 1, 1, 1,
-0.7574055, -0.09269916, -1.763941, 1, 1, 1, 1, 1,
-0.7516259, -0.5496412, -1.656181, 1, 1, 1, 1, 1,
-0.7444845, -0.5560515, -3.583242, 0, 0, 1, 1, 1,
-0.7440156, -0.8424881, -4.385589, 1, 0, 0, 1, 1,
-0.7380822, -0.427525, -1.904102, 1, 0, 0, 1, 1,
-0.7317038, 0.4696492, -1.328945, 1, 0, 0, 1, 1,
-0.7197732, 0.5094144, -1.582483, 1, 0, 0, 1, 1,
-0.7180356, -0.2269173, -0.2056719, 1, 0, 0, 1, 1,
-0.7142139, -0.7313179, -3.236909, 0, 0, 0, 1, 1,
-0.7130286, -0.4796881, -1.674934, 0, 0, 0, 1, 1,
-0.7114696, -0.8635362, -4.295507, 0, 0, 0, 1, 1,
-0.7094132, -0.07006337, -1.481996, 0, 0, 0, 1, 1,
-0.7011658, 1.031207, -1.527013, 0, 0, 0, 1, 1,
-0.6995907, 2.095664, -0.1700226, 0, 0, 0, 1, 1,
-0.6977124, -0.2510205, -1.142407, 0, 0, 0, 1, 1,
-0.6913197, 0.004773651, -2.56033, 1, 1, 1, 1, 1,
-0.6870473, -0.3544072, -3.552406, 1, 1, 1, 1, 1,
-0.6826253, 0.5437734, -2.250577, 1, 1, 1, 1, 1,
-0.6788519, -0.9604032, -2.029004, 1, 1, 1, 1, 1,
-0.6673552, -0.8944886, -0.7915761, 1, 1, 1, 1, 1,
-0.6666178, 0.05255925, -2.600339, 1, 1, 1, 1, 1,
-0.661263, -1.68104, -3.263357, 1, 1, 1, 1, 1,
-0.6506654, -0.8379468, -1.284871, 1, 1, 1, 1, 1,
-0.6464474, 0.732761, -0.3407089, 1, 1, 1, 1, 1,
-0.6442702, -0.8069864, -3.091399, 1, 1, 1, 1, 1,
-0.642728, 1.438649, 0.1134868, 1, 1, 1, 1, 1,
-0.6406814, -3.147343, -1.742869, 1, 1, 1, 1, 1,
-0.6397223, -0.5131255, -1.851527, 1, 1, 1, 1, 1,
-0.6350152, 0.434492, -0.7104712, 1, 1, 1, 1, 1,
-0.6347247, -2.156584, -3.643897, 1, 1, 1, 1, 1,
-0.6245735, 0.5367178, -1.141422, 0, 0, 1, 1, 1,
-0.6168443, -1.074615, -2.544541, 1, 0, 0, 1, 1,
-0.6136206, 0.1432735, -1.440564, 1, 0, 0, 1, 1,
-0.6126076, 0.8921365, -1.605415, 1, 0, 0, 1, 1,
-0.6094632, -0.2637241, -3.212227, 1, 0, 0, 1, 1,
-0.6086643, 0.6119894, -1.698549, 1, 0, 0, 1, 1,
-0.6068237, -0.6800208, -4.387282, 0, 0, 0, 1, 1,
-0.6007543, 1.500838, -0.3196156, 0, 0, 0, 1, 1,
-0.5985288, -1.33329, -1.501147, 0, 0, 0, 1, 1,
-0.5984195, 0.2208441, -1.17992, 0, 0, 0, 1, 1,
-0.5975381, -1.085861, -2.740627, 0, 0, 0, 1, 1,
-0.5948478, 0.2192933, -0.2083497, 0, 0, 0, 1, 1,
-0.5912258, -1.406911, -1.738443, 0, 0, 0, 1, 1,
-0.5892329, 0.9621415, -2.215574, 1, 1, 1, 1, 1,
-0.587329, -2.477539, -2.969222, 1, 1, 1, 1, 1,
-0.5866601, 1.000383, 0.6975624, 1, 1, 1, 1, 1,
-0.586358, -0.9722735, -2.165269, 1, 1, 1, 1, 1,
-0.5832994, -0.1985514, -2.44472, 1, 1, 1, 1, 1,
-0.5787904, 1.295602, -0.9341421, 1, 1, 1, 1, 1,
-0.5763273, 0.3406453, -0.5249113, 1, 1, 1, 1, 1,
-0.5748407, -1.235444, -3.552411, 1, 1, 1, 1, 1,
-0.5692479, -0.3435493, -1.430243, 1, 1, 1, 1, 1,
-0.567773, 0.05846602, -3.231463, 1, 1, 1, 1, 1,
-0.5672191, -1.057488, -1.789082, 1, 1, 1, 1, 1,
-0.563737, 1.817319, 1.800703, 1, 1, 1, 1, 1,
-0.5626472, 1.151683, 0.8599916, 1, 1, 1, 1, 1,
-0.5624781, 0.1017407, -2.786877, 1, 1, 1, 1, 1,
-0.5609937, 0.6080697, -1.001, 1, 1, 1, 1, 1,
-0.560177, 0.373294, 0.5056784, 0, 0, 1, 1, 1,
-0.5554518, -1.950517, -4.370167, 1, 0, 0, 1, 1,
-0.554189, 2.107552, -0.6779466, 1, 0, 0, 1, 1,
-0.5540437, 1.136731, -0.4517341, 1, 0, 0, 1, 1,
-0.544084, 0.4366283, -0.3444105, 1, 0, 0, 1, 1,
-0.5424019, 0.8724479, -0.1892047, 1, 0, 0, 1, 1,
-0.5370365, 1.486635, 0.8747733, 0, 0, 0, 1, 1,
-0.5360144, -1.299528, -2.194793, 0, 0, 0, 1, 1,
-0.5316588, -0.5453896, -2.799502, 0, 0, 0, 1, 1,
-0.5306643, -0.5047174, -1.137262, 0, 0, 0, 1, 1,
-0.530533, -0.6433498, -2.51157, 0, 0, 0, 1, 1,
-0.528313, 0.7327206, 0.9432333, 0, 0, 0, 1, 1,
-0.5204202, 1.106869, 1.398979, 0, 0, 0, 1, 1,
-0.506952, -0.2656129, -2.166976, 1, 1, 1, 1, 1,
-0.5011875, -0.6065742, -2.146465, 1, 1, 1, 1, 1,
-0.4997369, -0.1030109, -0.8149196, 1, 1, 1, 1, 1,
-0.4967173, -0.6873734, -3.032615, 1, 1, 1, 1, 1,
-0.4963719, 0.5322995, -1.717971, 1, 1, 1, 1, 1,
-0.4940561, -0.6647071, -2.489373, 1, 1, 1, 1, 1,
-0.4931921, -1.603135, -1.588057, 1, 1, 1, 1, 1,
-0.4918403, 0.6556614, -3.484697, 1, 1, 1, 1, 1,
-0.4881415, 0.06305788, 0.1870014, 1, 1, 1, 1, 1,
-0.4859259, 0.3673412, -0.4138921, 1, 1, 1, 1, 1,
-0.4828121, -0.2381564, -2.146447, 1, 1, 1, 1, 1,
-0.4817539, 1.230044, 0.2087315, 1, 1, 1, 1, 1,
-0.4753206, 0.1070381, 0.4763452, 1, 1, 1, 1, 1,
-0.4714486, -0.5227492, -2.019755, 1, 1, 1, 1, 1,
-0.4698566, 0.7711072, -2.786119, 1, 1, 1, 1, 1,
-0.4672365, 0.9833491, -0.4181694, 0, 0, 1, 1, 1,
-0.4624157, -1.141886, -1.526094, 1, 0, 0, 1, 1,
-0.4597399, 0.5702287, -1.720139, 1, 0, 0, 1, 1,
-0.4591023, -0.5853301, -1.633535, 1, 0, 0, 1, 1,
-0.4558638, 0.8158379, 0.8997606, 1, 0, 0, 1, 1,
-0.4535765, 1.896461, -0.5004653, 1, 0, 0, 1, 1,
-0.4467933, 0.3605793, -0.1729467, 0, 0, 0, 1, 1,
-0.4453075, 0.976891, -0.731112, 0, 0, 0, 1, 1,
-0.4437836, 1.240457, -1.912799, 0, 0, 0, 1, 1,
-0.4384053, -0.1866733, -3.870336, 0, 0, 0, 1, 1,
-0.4319483, -0.02869453, -1.348404, 0, 0, 0, 1, 1,
-0.4303264, 0.8337975, -0.2290242, 0, 0, 0, 1, 1,
-0.4243345, -1.665319, -3.73352, 0, 0, 0, 1, 1,
-0.4219198, -1.120551, -2.629326, 1, 1, 1, 1, 1,
-0.4183663, -0.1190466, -1.579177, 1, 1, 1, 1, 1,
-0.4126314, -1.049407, -3.481136, 1, 1, 1, 1, 1,
-0.4120979, 0.5518929, 1.908454, 1, 1, 1, 1, 1,
-0.4112116, 1.661705, -2.471904, 1, 1, 1, 1, 1,
-0.4109449, 0.2302079, -1.963005, 1, 1, 1, 1, 1,
-0.4066254, 0.9548973, 0.9210768, 1, 1, 1, 1, 1,
-0.40574, 1.380138, 0.4970635, 1, 1, 1, 1, 1,
-0.3987846, -1.245674, -2.381734, 1, 1, 1, 1, 1,
-0.3979355, 0.3624957, -1.411493, 1, 1, 1, 1, 1,
-0.3978456, 1.087406, 0.02424999, 1, 1, 1, 1, 1,
-0.3968278, 1.179327, -0.7574801, 1, 1, 1, 1, 1,
-0.395774, -1.198998, -2.593205, 1, 1, 1, 1, 1,
-0.3888516, 0.6459953, -1.082249, 1, 1, 1, 1, 1,
-0.3871928, -0.1753187, -3.638205, 1, 1, 1, 1, 1,
-0.3870502, 0.9239814, -0.5220637, 0, 0, 1, 1, 1,
-0.3854405, -0.1608193, -3.163043, 1, 0, 0, 1, 1,
-0.3839861, -0.0236536, -2.499239, 1, 0, 0, 1, 1,
-0.3800007, 0.2559007, -0.2245458, 1, 0, 0, 1, 1,
-0.3779635, -0.2523234, -4.12325, 1, 0, 0, 1, 1,
-0.3740313, 0.8383574, 0.2883585, 1, 0, 0, 1, 1,
-0.3716964, 0.7460672, -0.9874423, 0, 0, 0, 1, 1,
-0.3705862, -1.077362, -1.493343, 0, 0, 0, 1, 1,
-0.3688014, 0.3254311, -0.3128664, 0, 0, 0, 1, 1,
-0.3655754, -1.983918, -3.321007, 0, 0, 0, 1, 1,
-0.3543905, -0.190512, -2.194545, 0, 0, 0, 1, 1,
-0.3520557, -0.148664, -1.734843, 0, 0, 0, 1, 1,
-0.3433544, -1.477151, -3.499585, 0, 0, 0, 1, 1,
-0.3423147, -1.261018, -1.834352, 1, 1, 1, 1, 1,
-0.3349359, 0.1095653, -2.223008, 1, 1, 1, 1, 1,
-0.323887, -0.07927147, -1.936659, 1, 1, 1, 1, 1,
-0.3231795, 1.144044, 0.7326284, 1, 1, 1, 1, 1,
-0.3221849, 0.7311924, 0.02719112, 1, 1, 1, 1, 1,
-0.3213499, 0.06551207, -0.4716595, 1, 1, 1, 1, 1,
-0.3167574, 1.348995, -0.2542937, 1, 1, 1, 1, 1,
-0.3090076, -1.141668, -5.414764, 1, 1, 1, 1, 1,
-0.3073232, 1.657195, -1.472039, 1, 1, 1, 1, 1,
-0.3045138, 0.6024173, 0.2139767, 1, 1, 1, 1, 1,
-0.3040516, -0.1469643, 0.09791365, 1, 1, 1, 1, 1,
-0.3034033, -0.5925749, -2.031229, 1, 1, 1, 1, 1,
-0.3015344, 0.2867608, -0.3216157, 1, 1, 1, 1, 1,
-0.2952844, -0.2698696, -0.398258, 1, 1, 1, 1, 1,
-0.2947223, -0.4698307, -3.212472, 1, 1, 1, 1, 1,
-0.2899955, 1.201015, -0.8561735, 0, 0, 1, 1, 1,
-0.2898335, -0.1674397, -1.392465, 1, 0, 0, 1, 1,
-0.2886057, 1.345592, -0.9908152, 1, 0, 0, 1, 1,
-0.2837219, -1.243125, -1.587431, 1, 0, 0, 1, 1,
-0.2832099, 0.4122862, 1.121731, 1, 0, 0, 1, 1,
-0.2792268, 0.005951615, -2.45757, 1, 0, 0, 1, 1,
-0.2789843, -1.181359, -3.621475, 0, 0, 0, 1, 1,
-0.2777929, -0.6276388, -3.48715, 0, 0, 0, 1, 1,
-0.2767927, -1.279815, -3.887725, 0, 0, 0, 1, 1,
-0.2765701, 0.4860739, -0.6004047, 0, 0, 0, 1, 1,
-0.2733061, -1.37894, -1.302035, 0, 0, 0, 1, 1,
-0.2730305, 0.03113044, -1.645725, 0, 0, 0, 1, 1,
-0.272081, 0.05399778, -1.506044, 0, 0, 0, 1, 1,
-0.2708367, 0.1604684, -0.2839883, 1, 1, 1, 1, 1,
-0.2673889, 0.5785431, -0.5737101, 1, 1, 1, 1, 1,
-0.2641982, 1.800326, 0.6520138, 1, 1, 1, 1, 1,
-0.2547249, -0.8656254, -3.905291, 1, 1, 1, 1, 1,
-0.2486188, -1.146493, -2.113034, 1, 1, 1, 1, 1,
-0.2471561, 0.5427701, -1.7055, 1, 1, 1, 1, 1,
-0.2459575, 1.068191, -0.2438969, 1, 1, 1, 1, 1,
-0.2454558, -0.3741769, -1.201283, 1, 1, 1, 1, 1,
-0.2444325, 0.248963, -0.6693484, 1, 1, 1, 1, 1,
-0.2317234, -0.7074225, -3.664769, 1, 1, 1, 1, 1,
-0.2311275, -0.6758562, -5.296317, 1, 1, 1, 1, 1,
-0.2293198, 0.1845953, -1.320314, 1, 1, 1, 1, 1,
-0.2281698, -0.5817853, -3.110128, 1, 1, 1, 1, 1,
-0.226943, -0.0198366, -0.466028, 1, 1, 1, 1, 1,
-0.2246117, 0.3821298, -1.973268, 1, 1, 1, 1, 1,
-0.2240519, 0.1240017, -0.1517135, 0, 0, 1, 1, 1,
-0.2221334, 0.7845246, -0.8857558, 1, 0, 0, 1, 1,
-0.2192817, -1.404083, -3.424125, 1, 0, 0, 1, 1,
-0.2171917, -0.08427969, -0.5758245, 1, 0, 0, 1, 1,
-0.2162399, 0.1986048, -1.318884, 1, 0, 0, 1, 1,
-0.2086019, 1.493669, 1.451683, 1, 0, 0, 1, 1,
-0.2050604, -0.827627, -3.051795, 0, 0, 0, 1, 1,
-0.2039726, 0.0173489, -2.433501, 0, 0, 0, 1, 1,
-0.1990848, -0.9668925, -2.360201, 0, 0, 0, 1, 1,
-0.1956441, 0.6744171, 1.058356, 0, 0, 0, 1, 1,
-0.1933986, -0.4948911, -2.61108, 0, 0, 0, 1, 1,
-0.1919574, -0.7577594, -2.360906, 0, 0, 0, 1, 1,
-0.1912528, 1.974565, 1.159096, 0, 0, 0, 1, 1,
-0.1886994, 0.1676073, -2.715821, 1, 1, 1, 1, 1,
-0.1831631, 0.4816217, -0.5318565, 1, 1, 1, 1, 1,
-0.1829053, -0.8102023, -2.788497, 1, 1, 1, 1, 1,
-0.1827256, -1.544332, -3.519177, 1, 1, 1, 1, 1,
-0.1824841, 0.09462648, -0.909614, 1, 1, 1, 1, 1,
-0.1815908, -0.5634351, -2.897256, 1, 1, 1, 1, 1,
-0.1795893, 0.6440384, -0.4482334, 1, 1, 1, 1, 1,
-0.1722708, 1.06195, 1.044513, 1, 1, 1, 1, 1,
-0.16508, -0.6635089, -1.997558, 1, 1, 1, 1, 1,
-0.1619802, -0.63488, -2.148568, 1, 1, 1, 1, 1,
-0.1564375, -1.420215, -3.968022, 1, 1, 1, 1, 1,
-0.1557198, 0.9738361, 0.1315171, 1, 1, 1, 1, 1,
-0.1496636, -1.190451, -4.943134, 1, 1, 1, 1, 1,
-0.1489249, -0.2298314, -4.002034, 1, 1, 1, 1, 1,
-0.1480121, -0.1217147, -1.511211, 1, 1, 1, 1, 1,
-0.1478106, -0.04041859, 0.6980827, 0, 0, 1, 1, 1,
-0.142176, 0.8133441, 0.09057716, 1, 0, 0, 1, 1,
-0.1409039, 0.3962116, -1.996703, 1, 0, 0, 1, 1,
-0.1408588, -0.4769218, -2.442671, 1, 0, 0, 1, 1,
-0.1384579, 1.120377, -0.2734349, 1, 0, 0, 1, 1,
-0.131849, -0.09912117, -2.083617, 1, 0, 0, 1, 1,
-0.1273396, -0.8193961, -2.180697, 0, 0, 0, 1, 1,
-0.1270567, -0.2117652, -1.734858, 0, 0, 0, 1, 1,
-0.1237925, 0.9257957, 0.2905477, 0, 0, 0, 1, 1,
-0.1229501, 0.938436, -0.1451075, 0, 0, 0, 1, 1,
-0.1175572, 0.2202422, -0.6466945, 0, 0, 0, 1, 1,
-0.1169025, -0.2234423, -3.554023, 0, 0, 0, 1, 1,
-0.1126608, 0.7812379, -0.582296, 0, 0, 0, 1, 1,
-0.1096355, 0.4932863, 0.1275396, 1, 1, 1, 1, 1,
-0.1093468, -0.03674507, -0.4544907, 1, 1, 1, 1, 1,
-0.1033909, 0.2111781, 0.459279, 1, 1, 1, 1, 1,
-0.1028782, 1.638124, -0.7222967, 1, 1, 1, 1, 1,
-0.100801, 0.6907659, 0.5735012, 1, 1, 1, 1, 1,
-0.09824019, -0.6337637, -2.340294, 1, 1, 1, 1, 1,
-0.08762412, 0.5550456, 1.523929, 1, 1, 1, 1, 1,
-0.07707287, 0.3865846, -0.7087462, 1, 1, 1, 1, 1,
-0.07664564, 1.772526, -0.2560871, 1, 1, 1, 1, 1,
-0.07595475, 1.013514, -1.020313, 1, 1, 1, 1, 1,
-0.07565723, -1.328175, -3.049935, 1, 1, 1, 1, 1,
-0.06645599, -0.1942097, -2.914425, 1, 1, 1, 1, 1,
-0.06093314, -0.8982719, -3.128523, 1, 1, 1, 1, 1,
-0.0599842, -2.193962, -2.606284, 1, 1, 1, 1, 1,
-0.05968411, -1.05936, -2.742347, 1, 1, 1, 1, 1,
-0.05498571, 1.495825, 1.067376, 0, 0, 1, 1, 1,
-0.05050173, 0.3399888, 1.677691, 1, 0, 0, 1, 1,
-0.04946684, -0.2079043, -3.345585, 1, 0, 0, 1, 1,
-0.04914667, 1.20505, -0.43489, 1, 0, 0, 1, 1,
-0.04912866, 0.3834929, 0.6492308, 1, 0, 0, 1, 1,
-0.04898266, 0.2387984, 0.3817452, 1, 0, 0, 1, 1,
-0.04712169, -0.6987153, -4.013605, 0, 0, 0, 1, 1,
-0.04638916, -0.09209301, -4.065284, 0, 0, 0, 1, 1,
-0.04606229, -3.19552, -3.878917, 0, 0, 0, 1, 1,
-0.04227587, 0.0512922, -2.149508, 0, 0, 0, 1, 1,
-0.04189717, -1.044357, -3.575, 0, 0, 0, 1, 1,
-0.04181581, -0.320256, -4.198745, 0, 0, 0, 1, 1,
-0.0346886, 1.084189, -0.0646873, 0, 0, 0, 1, 1,
-0.03359836, 0.2444079, -1.070359, 1, 1, 1, 1, 1,
-0.03263172, 2.063992, -2.219599, 1, 1, 1, 1, 1,
-0.02994816, -0.06566063, -2.874992, 1, 1, 1, 1, 1,
-0.02972299, 0.02710188, 1.25462, 1, 1, 1, 1, 1,
-0.02919086, 1.167393, 0.712651, 1, 1, 1, 1, 1,
-0.02911334, 1.368215, 1.520235, 1, 1, 1, 1, 1,
-0.02655531, -0.3357032, -3.622271, 1, 1, 1, 1, 1,
-0.02530644, -0.9487815, -1.835311, 1, 1, 1, 1, 1,
-0.02525366, -1.057569, -0.8893552, 1, 1, 1, 1, 1,
-0.02401616, 1.175372, 0.3924239, 1, 1, 1, 1, 1,
-0.02326742, 0.1828954, -0.2095118, 1, 1, 1, 1, 1,
-0.01899291, 1.400413, 0.1216403, 1, 1, 1, 1, 1,
-0.01683991, -1.939011, -2.102859, 1, 1, 1, 1, 1,
-0.016768, 0.7261607, 1.789997, 1, 1, 1, 1, 1,
-0.0107998, -1.319255, -3.491265, 1, 1, 1, 1, 1,
-0.007406566, 1.253518, 1.444887, 0, 0, 1, 1, 1,
-0.006374611, 0.8022577, 0.1865624, 1, 0, 0, 1, 1,
-0.006183491, -1.218809, -3.928447, 1, 0, 0, 1, 1,
-0.005723674, -0.7941362, -4.419496, 1, 0, 0, 1, 1,
0.005960727, -0.4219809, 2.024523, 1, 0, 0, 1, 1,
0.006565626, -0.5305983, 3.188655, 1, 0, 0, 1, 1,
0.008161313, 0.4475621, -0.459447, 0, 0, 0, 1, 1,
0.01533172, 0.01106913, 1.748379, 0, 0, 0, 1, 1,
0.0172585, -0.008280458, 1.753547, 0, 0, 0, 1, 1,
0.01743496, 0.939931, -0.1865783, 0, 0, 0, 1, 1,
0.02568079, 0.453299, 0.988437, 0, 0, 0, 1, 1,
0.02648881, -0.2851047, 3.092893, 0, 0, 0, 1, 1,
0.02651885, -0.823822, 4.626001, 0, 0, 0, 1, 1,
0.02763175, -1.866257, 2.532592, 1, 1, 1, 1, 1,
0.02989339, 1.916421, -0.6900169, 1, 1, 1, 1, 1,
0.03106837, -0.9587793, 4.394136, 1, 1, 1, 1, 1,
0.03394353, 0.3809876, 0.4278606, 1, 1, 1, 1, 1,
0.03579933, 0.5371302, -0.2244739, 1, 1, 1, 1, 1,
0.03678398, -0.6281973, 1.397289, 1, 1, 1, 1, 1,
0.0377236, -1.172608, 3.337413, 1, 1, 1, 1, 1,
0.04264429, -1.861973, 1.876244, 1, 1, 1, 1, 1,
0.04417465, -0.3851497, 4.385623, 1, 1, 1, 1, 1,
0.04481378, -1.102513, 3.823327, 1, 1, 1, 1, 1,
0.0466916, 0.5135687, 0.9018682, 1, 1, 1, 1, 1,
0.04761098, -0.7497255, 1.444083, 1, 1, 1, 1, 1,
0.04883402, -0.3659981, 3.519042, 1, 1, 1, 1, 1,
0.05274469, 1.258119, -0.8079914, 1, 1, 1, 1, 1,
0.05430553, 1.689892, -1.438241, 1, 1, 1, 1, 1,
0.05628679, -0.02895868, 2.139466, 0, 0, 1, 1, 1,
0.05638237, 1.058406, -0.8006177, 1, 0, 0, 1, 1,
0.05725312, 1.141744, 0.1287586, 1, 0, 0, 1, 1,
0.06141021, 0.7749004, -1.377012, 1, 0, 0, 1, 1,
0.06551725, -0.09419032, 3.692206, 1, 0, 0, 1, 1,
0.0689252, -0.7100419, 2.161174, 1, 0, 0, 1, 1,
0.06925798, 0.3491089, 1.514531, 0, 0, 0, 1, 1,
0.07026973, 1.068797, 0.479052, 0, 0, 0, 1, 1,
0.07172629, 0.9750682, -0.5836401, 0, 0, 0, 1, 1,
0.07183438, -0.192368, 3.968554, 0, 0, 0, 1, 1,
0.07704049, -0.4480319, 1.315688, 0, 0, 0, 1, 1,
0.0794709, 0.2302114, -1.033677, 0, 0, 0, 1, 1,
0.0795297, 1.286285, 0.157942, 0, 0, 0, 1, 1,
0.08010659, -0.8455315, 2.27774, 1, 1, 1, 1, 1,
0.08228001, -1.406914, 3.337779, 1, 1, 1, 1, 1,
0.08502673, 0.9822474, 0.2490634, 1, 1, 1, 1, 1,
0.09158142, -0.5355731, 1.994995, 1, 1, 1, 1, 1,
0.0934875, -0.509491, 4.328327, 1, 1, 1, 1, 1,
0.09352788, 0.0537494, -0.556106, 1, 1, 1, 1, 1,
0.09456225, 1.036611, 0.5218486, 1, 1, 1, 1, 1,
0.09506784, 0.5494079, 0.9094194, 1, 1, 1, 1, 1,
0.09642123, -1.050228, 1.073481, 1, 1, 1, 1, 1,
0.0975224, 0.3071133, 0.4759567, 1, 1, 1, 1, 1,
0.1002296, -2.124269, 3.181886, 1, 1, 1, 1, 1,
0.1045572, -0.9343252, 2.638428, 1, 1, 1, 1, 1,
0.1080459, -0.7247744, 3.815996, 1, 1, 1, 1, 1,
0.1109648, -0.4583372, 1.539255, 1, 1, 1, 1, 1,
0.1184537, -0.09500539, 2.7015, 1, 1, 1, 1, 1,
0.1202933, -0.3473689, 1.748573, 0, 0, 1, 1, 1,
0.1219787, -0.9317647, 2.288329, 1, 0, 0, 1, 1,
0.1220248, 0.9036009, 0.8936903, 1, 0, 0, 1, 1,
0.1245897, -2.032182, 4.517577, 1, 0, 0, 1, 1,
0.1259785, 0.693308, 0.6211004, 1, 0, 0, 1, 1,
0.1286958, 0.2210799, 2.241694, 1, 0, 0, 1, 1,
0.1313462, -0.5583065, 4.439517, 0, 0, 0, 1, 1,
0.1314879, 0.09136691, 0.4541529, 0, 0, 0, 1, 1,
0.1370781, 0.1108652, 1.952595, 0, 0, 0, 1, 1,
0.1402205, -0.4110337, 3.456301, 0, 0, 0, 1, 1,
0.1439827, 0.4607374, 0.09831838, 0, 0, 0, 1, 1,
0.1478, -1.564058, 0.5991398, 0, 0, 0, 1, 1,
0.1485351, -0.2095326, 0.9093131, 0, 0, 0, 1, 1,
0.1490579, 0.9187239, -1.313182, 1, 1, 1, 1, 1,
0.1513151, 2.058294, -0.2376325, 1, 1, 1, 1, 1,
0.1547431, 0.05767163, 2.330576, 1, 1, 1, 1, 1,
0.1566256, -1.026596, 2.789374, 1, 1, 1, 1, 1,
0.1583135, 1.274599, 1.756327, 1, 1, 1, 1, 1,
0.164235, -1.104407, 1.036278, 1, 1, 1, 1, 1,
0.1643674, -0.2865477, 1.445311, 1, 1, 1, 1, 1,
0.1643756, -0.2408018, 1.889293, 1, 1, 1, 1, 1,
0.1661492, -1.005176, 3.950875, 1, 1, 1, 1, 1,
0.1707321, 1.470164, 1.698619, 1, 1, 1, 1, 1,
0.1714613, -0.5535114, 2.230547, 1, 1, 1, 1, 1,
0.1715675, 0.2460045, 0.2746629, 1, 1, 1, 1, 1,
0.1716654, -0.3223322, 2.671828, 1, 1, 1, 1, 1,
0.1728072, -0.3813141, 0.9974533, 1, 1, 1, 1, 1,
0.1773808, 0.1309164, 1.781369, 1, 1, 1, 1, 1,
0.1774633, 0.7938536, 0.07494112, 0, 0, 1, 1, 1,
0.177995, -1.336306, 3.320461, 1, 0, 0, 1, 1,
0.1782408, -0.7896439, 1.284666, 1, 0, 0, 1, 1,
0.1854208, -0.09717429, 3.333911, 1, 0, 0, 1, 1,
0.1885963, 0.468218, 0.2288209, 1, 0, 0, 1, 1,
0.18899, 1.153056, 0.3053769, 1, 0, 0, 1, 1,
0.1919858, 0.1360941, -0.3149524, 0, 0, 0, 1, 1,
0.1950203, 0.5560951, 0.5744207, 0, 0, 0, 1, 1,
0.1965314, -1.69059, 4.066359, 0, 0, 0, 1, 1,
0.2015437, -1.778928, 1.964807, 0, 0, 0, 1, 1,
0.2016448, 1.097724, 2.044136, 0, 0, 0, 1, 1,
0.2036866, 0.2509599, 0.337981, 0, 0, 0, 1, 1,
0.205607, 0.05070656, 0.4613571, 0, 0, 0, 1, 1,
0.2079678, 0.2522222, 1.83922, 1, 1, 1, 1, 1,
0.2088994, 0.3610049, 1.477052, 1, 1, 1, 1, 1,
0.2104112, -0.7601779, 3.503563, 1, 1, 1, 1, 1,
0.2143137, 1.551064, 0.6336563, 1, 1, 1, 1, 1,
0.2148167, -0.9194897, 3.121749, 1, 1, 1, 1, 1,
0.2202303, 0.4979002, 1.43621, 1, 1, 1, 1, 1,
0.2240773, -3.376396, 2.552688, 1, 1, 1, 1, 1,
0.2252834, -0.4720944, 2.753529, 1, 1, 1, 1, 1,
0.2270886, -1.230048, 4.98596, 1, 1, 1, 1, 1,
0.2299503, 0.02801045, 0.369701, 1, 1, 1, 1, 1,
0.2300622, 1.42967, -1.481782, 1, 1, 1, 1, 1,
0.2303443, -1.627442, 2.499408, 1, 1, 1, 1, 1,
0.2308239, 1.11601, -0.8608723, 1, 1, 1, 1, 1,
0.2334121, -1.294629, 4.826982, 1, 1, 1, 1, 1,
0.234168, -1.598045, 1.923433, 1, 1, 1, 1, 1,
0.2400007, 2.668504, 0.8218989, 0, 0, 1, 1, 1,
0.2410753, 1.314667, 0.8658379, 1, 0, 0, 1, 1,
0.2421028, 1.276649, -0.4286793, 1, 0, 0, 1, 1,
0.2426882, 0.1412303, 1.85279, 1, 0, 0, 1, 1,
0.2437781, 0.6780984, 1.240886, 1, 0, 0, 1, 1,
0.2450594, 0.2244674, -0.4498692, 1, 0, 0, 1, 1,
0.247196, 1.039069, 0.2099496, 0, 0, 0, 1, 1,
0.2477807, -1.145505, 5.412471, 0, 0, 0, 1, 1,
0.2548154, -1.228393, 3.572517, 0, 0, 0, 1, 1,
0.2567011, 0.2015754, 0.3776616, 0, 0, 0, 1, 1,
0.2581891, 1.293373, -0.00844036, 0, 0, 0, 1, 1,
0.2583004, -1.494373, 1.857495, 0, 0, 0, 1, 1,
0.2633575, 0.2082842, -0.7246219, 0, 0, 0, 1, 1,
0.2638193, -0.9520704, 4.085691, 1, 1, 1, 1, 1,
0.268605, -0.9014344, 2.783232, 1, 1, 1, 1, 1,
0.273501, -0.09286875, 0.6473547, 1, 1, 1, 1, 1,
0.2772132, -1.101532, 1.414388, 1, 1, 1, 1, 1,
0.2801489, -1.419036, 2.579364, 1, 1, 1, 1, 1,
0.2833729, 1.628681, 1.211381, 1, 1, 1, 1, 1,
0.283534, -0.8295382, 3.599633, 1, 1, 1, 1, 1,
0.2923206, 0.1228488, 2.253137, 1, 1, 1, 1, 1,
0.2943098, 1.88105, -0.17879, 1, 1, 1, 1, 1,
0.2963814, -0.1544733, 1.8387, 1, 1, 1, 1, 1,
0.2972243, 1.147069, -1.591966, 1, 1, 1, 1, 1,
0.2983929, 0.308703, -2.086159, 1, 1, 1, 1, 1,
0.3058154, 1.284008, -1.436715, 1, 1, 1, 1, 1,
0.3062058, -0.3510225, 2.508381, 1, 1, 1, 1, 1,
0.3083904, 1.091315, 0.9703887, 1, 1, 1, 1, 1,
0.3095478, 0.04351534, 2.453245, 0, 0, 1, 1, 1,
0.3126282, 1.075076, 0.3161007, 1, 0, 0, 1, 1,
0.3277275, 1.916796, 0.762868, 1, 0, 0, 1, 1,
0.3333706, 2.226906, 0.1771804, 1, 0, 0, 1, 1,
0.3415512, 2.100257, -1.313334, 1, 0, 0, 1, 1,
0.3423924, 1.096095, 0.1155373, 1, 0, 0, 1, 1,
0.3472092, -1.884666, 3.104446, 0, 0, 0, 1, 1,
0.3547357, -1.645723, 3.323947, 0, 0, 0, 1, 1,
0.3615231, -1.831771, 3.369308, 0, 0, 0, 1, 1,
0.3622959, -0.5130462, 2.067752, 0, 0, 0, 1, 1,
0.364115, 0.9760818, 0.9803395, 0, 0, 0, 1, 1,
0.3763289, 0.6426189, 0.5839697, 0, 0, 0, 1, 1,
0.3771411, -0.07420437, 1.639032, 0, 0, 0, 1, 1,
0.3824832, 1.165481, 0.6666941, 1, 1, 1, 1, 1,
0.3845996, 0.6141064, 1.083657, 1, 1, 1, 1, 1,
0.3891583, 2.602631, 0.7237538, 1, 1, 1, 1, 1,
0.3893777, 1.325185, 0.7610941, 1, 1, 1, 1, 1,
0.3893988, -0.8640206, 2.178148, 1, 1, 1, 1, 1,
0.3896464, -0.9787212, 2.973724, 1, 1, 1, 1, 1,
0.3915856, 2.046529, -1.447097, 1, 1, 1, 1, 1,
0.3927813, -0.1596103, 2.27101, 1, 1, 1, 1, 1,
0.3973014, -0.4534788, 2.928652, 1, 1, 1, 1, 1,
0.3981978, 0.1281277, 0.634086, 1, 1, 1, 1, 1,
0.4043538, -0.1410567, 2.916798, 1, 1, 1, 1, 1,
0.4048363, 0.3068634, 1.842777, 1, 1, 1, 1, 1,
0.4072439, -0.2998057, 1.065619, 1, 1, 1, 1, 1,
0.4103539, 1.55349, 0.854206, 1, 1, 1, 1, 1,
0.411222, 0.4165044, -0.8717362, 1, 1, 1, 1, 1,
0.4197549, 0.4068495, 0.4026614, 0, 0, 1, 1, 1,
0.4207168, 0.741563, -0.06960169, 1, 0, 0, 1, 1,
0.4208921, 0.7981029, 0.552947, 1, 0, 0, 1, 1,
0.422123, 0.3222869, 0.5252286, 1, 0, 0, 1, 1,
0.4236872, 0.550065, 0.7559022, 1, 0, 0, 1, 1,
0.4255155, 1.432028, 0.4861347, 1, 0, 0, 1, 1,
0.4294436, 0.1453313, 1.095097, 0, 0, 0, 1, 1,
0.4350738, -0.511005, 3.282208, 0, 0, 0, 1, 1,
0.436204, -0.3187602, 2.054903, 0, 0, 0, 1, 1,
0.4412937, 1.246289, 0.2085642, 0, 0, 0, 1, 1,
0.4434843, -0.1299305, 1.339834, 0, 0, 0, 1, 1,
0.4441372, -1.356466, 3.628141, 0, 0, 0, 1, 1,
0.4447193, -1.554558, 2.669126, 0, 0, 0, 1, 1,
0.4456256, -0.4384664, 3.674627, 1, 1, 1, 1, 1,
0.4459967, -0.8308361, 2.005716, 1, 1, 1, 1, 1,
0.4475159, 1.408355, -0.9918263, 1, 1, 1, 1, 1,
0.4477267, 0.0660189, 0.6815652, 1, 1, 1, 1, 1,
0.4493315, 0.6274692, 1.728473, 1, 1, 1, 1, 1,
0.4515015, -0.2824448, 2.095062, 1, 1, 1, 1, 1,
0.4519968, 0.6141862, 0.1993691, 1, 1, 1, 1, 1,
0.4542484, 0.5341358, -0.5105357, 1, 1, 1, 1, 1,
0.4602196, 1.222311, 0.1674938, 1, 1, 1, 1, 1,
0.4618606, -1.668985, 1.455909, 1, 1, 1, 1, 1,
0.4644743, -0.2744053, 2.884588, 1, 1, 1, 1, 1,
0.4656121, -1.273211, 3.200341, 1, 1, 1, 1, 1,
0.471355, 0.9979222, 2.005499, 1, 1, 1, 1, 1,
0.4718938, 2.676313, 1.056301, 1, 1, 1, 1, 1,
0.4735417, -0.1339222, 1.38814, 1, 1, 1, 1, 1,
0.4769997, 0.5840568, -0.7179843, 0, 0, 1, 1, 1,
0.4820138, 0.09929389, 0.9545301, 1, 0, 0, 1, 1,
0.4949722, 1.479221, 0.2231116, 1, 0, 0, 1, 1,
0.4950826, -1.000953, 4.162389, 1, 0, 0, 1, 1,
0.4959338, -0.5125338, 3.477299, 1, 0, 0, 1, 1,
0.4971459, 2.379574, 1.297175, 1, 0, 0, 1, 1,
0.499575, 0.2560283, 0.8507385, 0, 0, 0, 1, 1,
0.4996052, -0.7373935, 2.409627, 0, 0, 0, 1, 1,
0.503898, 1.843551, -0.2599409, 0, 0, 0, 1, 1,
0.5045172, 1.259998, 0.07841035, 0, 0, 0, 1, 1,
0.5048973, -0.4200883, 0.2645715, 0, 0, 0, 1, 1,
0.5079566, -0.9536939, 3.682627, 0, 0, 0, 1, 1,
0.5101808, -2.023574, 1.128722, 0, 0, 0, 1, 1,
0.5124009, -1.103368, 3.336144, 1, 1, 1, 1, 1,
0.5164595, 0.257073, 1.09555, 1, 1, 1, 1, 1,
0.5188807, 1.031063, 0.3928173, 1, 1, 1, 1, 1,
0.5192306, -0.7396229, 2.929536, 1, 1, 1, 1, 1,
0.5221587, 0.5987389, 0.9480594, 1, 1, 1, 1, 1,
0.5223345, -0.9966508, 4.592347, 1, 1, 1, 1, 1,
0.5240368, -0.0974704, 0.682754, 1, 1, 1, 1, 1,
0.527501, 0.7604625, 1.794665, 1, 1, 1, 1, 1,
0.5278963, 0.7994711, -0.9284714, 1, 1, 1, 1, 1,
0.5289631, -0.612078, 2.494612, 1, 1, 1, 1, 1,
0.5375032, -0.2776278, 2.378834, 1, 1, 1, 1, 1,
0.5416005, 1.169555, -0.8048025, 1, 1, 1, 1, 1,
0.5485945, 0.2550506, 1.252349, 1, 1, 1, 1, 1,
0.5521696, 2.166848, 1.956671, 1, 1, 1, 1, 1,
0.5535318, -0.3053849, 3.276042, 1, 1, 1, 1, 1,
0.558907, 1.132137, -0.1676939, 0, 0, 1, 1, 1,
0.5623142, 1.984405, 1.907687, 1, 0, 0, 1, 1,
0.5644272, -0.2529289, 2.063138, 1, 0, 0, 1, 1,
0.5644817, 0.4961218, 1.026951, 1, 0, 0, 1, 1,
0.569937, 1.232655, 0.737138, 1, 0, 0, 1, 1,
0.5749254, -0.2672567, 1.629506, 1, 0, 0, 1, 1,
0.575036, 0.6520377, 1.694644, 0, 0, 0, 1, 1,
0.5769302, 0.379973, 0.7271129, 0, 0, 0, 1, 1,
0.5770184, 1.428601, -0.07946929, 0, 0, 0, 1, 1,
0.5862682, 0.5013784, 1.137469, 0, 0, 0, 1, 1,
0.5870163, 1.042186, -0.4788756, 0, 0, 0, 1, 1,
0.5876588, -1.074819, 3.282064, 0, 0, 0, 1, 1,
0.5921002, -0.314113, 1.472946, 0, 0, 0, 1, 1,
0.5924001, -0.03530665, 1.831588, 1, 1, 1, 1, 1,
0.5994031, -0.8296047, 4.629255, 1, 1, 1, 1, 1,
0.6017106, -0.5616166, 3.631152, 1, 1, 1, 1, 1,
0.6031871, 0.7033483, 1.228396, 1, 1, 1, 1, 1,
0.6053817, 2.343121, 0.3383067, 1, 1, 1, 1, 1,
0.6069316, -0.8377995, 2.870393, 1, 1, 1, 1, 1,
0.6088687, 0.4891315, 1.458388, 1, 1, 1, 1, 1,
0.6125842, 0.894559, 1.042822, 1, 1, 1, 1, 1,
0.6146361, -2.099637, 2.214446, 1, 1, 1, 1, 1,
0.6199734, 0.1953688, -0.8338819, 1, 1, 1, 1, 1,
0.6227747, -0.6306397, 1.506981, 1, 1, 1, 1, 1,
0.6272625, 0.4378058, -0.7834212, 1, 1, 1, 1, 1,
0.628689, 1.399792, 0.7662864, 1, 1, 1, 1, 1,
0.6287539, 1.168559, 1.158473, 1, 1, 1, 1, 1,
0.6328777, -1.116764, 1.626346, 1, 1, 1, 1, 1,
0.6356795, 0.4987708, 0.1893142, 0, 0, 1, 1, 1,
0.6362157, 0.1906023, 2.217927, 1, 0, 0, 1, 1,
0.641175, -0.7183198, 2.436458, 1, 0, 0, 1, 1,
0.6421663, 0.389818, 1.06766, 1, 0, 0, 1, 1,
0.6480808, -1.480573, 2.877205, 1, 0, 0, 1, 1,
0.6517109, -1.240679, 1.264844, 1, 0, 0, 1, 1,
0.6524042, 0.04657348, 1.184581, 0, 0, 0, 1, 1,
0.6538293, -0.9634677, 2.663912, 0, 0, 0, 1, 1,
0.660614, -1.067187, 3.44402, 0, 0, 0, 1, 1,
0.6678543, -1.293465, 3.924641, 0, 0, 0, 1, 1,
0.6696689, 0.5322577, -0.2443347, 0, 0, 0, 1, 1,
0.6697802, 1.081879, 0.2838792, 0, 0, 0, 1, 1,
0.6719759, 1.043924, 0.5163286, 0, 0, 0, 1, 1,
0.6741406, -0.6391178, 2.733344, 1, 1, 1, 1, 1,
0.674592, -0.8190867, 3.757274, 1, 1, 1, 1, 1,
0.6778243, 0.6573411, -0.156442, 1, 1, 1, 1, 1,
0.6801195, 1.07617, 1.348658, 1, 1, 1, 1, 1,
0.6810114, -0.1366127, 1.592305, 1, 1, 1, 1, 1,
0.6820095, -0.4856898, 2.568353, 1, 1, 1, 1, 1,
0.6864994, -0.2383828, 4.566495, 1, 1, 1, 1, 1,
0.6866099, -1.18819, 3.513686, 1, 1, 1, 1, 1,
0.6877108, 0.4585887, -0.51182, 1, 1, 1, 1, 1,
0.6889325, -0.8702148, 2.57345, 1, 1, 1, 1, 1,
0.6915498, -0.4691512, 2.017977, 1, 1, 1, 1, 1,
0.6958076, 1.291665, 0.6710908, 1, 1, 1, 1, 1,
0.7011847, -1.402221, 2.639352, 1, 1, 1, 1, 1,
0.7032942, 0.3629229, 1.1657, 1, 1, 1, 1, 1,
0.7064204, 1.038613, 0.9429415, 1, 1, 1, 1, 1,
0.7081791, -0.2654256, 2.997499, 0, 0, 1, 1, 1,
0.708482, -0.3624991, 3.760338, 1, 0, 0, 1, 1,
0.7092006, 0.3349722, -1.217231, 1, 0, 0, 1, 1,
0.7097206, -0.1427461, 1.196497, 1, 0, 0, 1, 1,
0.714532, 0.7295048, 0.8060967, 1, 0, 0, 1, 1,
0.7196638, -0.518545, 1.398686, 1, 0, 0, 1, 1,
0.7219706, 0.5414479, -0.1799456, 0, 0, 0, 1, 1,
0.7342906, -2.248831, 1.151799, 0, 0, 0, 1, 1,
0.735265, 0.08307359, 1.057777, 0, 0, 0, 1, 1,
0.7371806, 0.9352413, 1.103599, 0, 0, 0, 1, 1,
0.7380695, -0.07203376, 0.07797335, 0, 0, 0, 1, 1,
0.7412583, -0.7754702, 2.07404, 0, 0, 0, 1, 1,
0.7415395, 1.07643, 0.2445375, 0, 0, 0, 1, 1,
0.7479583, -1.096822, 4.384308, 1, 1, 1, 1, 1,
0.750544, -0.815526, 3.245729, 1, 1, 1, 1, 1,
0.7556241, 0.3084035, 2.188256, 1, 1, 1, 1, 1,
0.7574251, 1.05329, 1.473826, 1, 1, 1, 1, 1,
0.7616463, 1.572751, 1.29326, 1, 1, 1, 1, 1,
0.761846, -1.244114, 2.253523, 1, 1, 1, 1, 1,
0.7653533, 1.548058, -1.179597, 1, 1, 1, 1, 1,
0.7657905, 1.223138, 2.726764, 1, 1, 1, 1, 1,
0.7715893, -0.5521056, 2.338211, 1, 1, 1, 1, 1,
0.7733001, 0.2146291, 1.716448, 1, 1, 1, 1, 1,
0.7769026, 1.05447, 0.9116793, 1, 1, 1, 1, 1,
0.7808519, 1.028045, -0.6130383, 1, 1, 1, 1, 1,
0.7853373, -0.006331992, 0.9637372, 1, 1, 1, 1, 1,
0.7855083, -1.169925, 3.139841, 1, 1, 1, 1, 1,
0.7870516, -0.7367413, 2.691731, 1, 1, 1, 1, 1,
0.7876508, -1.66634, 3.108458, 0, 0, 1, 1, 1,
0.7876701, 0.6224616, 0.7471868, 1, 0, 0, 1, 1,
0.7881294, -1.795297, 2.281082, 1, 0, 0, 1, 1,
0.7924559, 0.5582137, 0.0448998, 1, 0, 0, 1, 1,
0.795964, -0.9503173, 2.06164, 1, 0, 0, 1, 1,
0.7990544, -0.2533459, 2.356781, 1, 0, 0, 1, 1,
0.8004861, -0.009711977, 1.161124, 0, 0, 0, 1, 1,
0.8091562, 0.6195165, -0.3373754, 0, 0, 0, 1, 1,
0.8098601, 0.7833402, 0.1548491, 0, 0, 0, 1, 1,
0.8114758, -0.1914964, 2.501764, 0, 0, 0, 1, 1,
0.8118504, 0.3772936, 0.8340654, 0, 0, 0, 1, 1,
0.8218968, -0.00186741, 1.581155, 0, 0, 0, 1, 1,
0.8228027, 2.239219, -0.2475143, 0, 0, 0, 1, 1,
0.8365765, -0.8375312, 3.362165, 1, 1, 1, 1, 1,
0.8420863, -2.577369, 1.625285, 1, 1, 1, 1, 1,
0.8450251, -0.2122438, 2.487194, 1, 1, 1, 1, 1,
0.8464031, -0.6843875, 1.886661, 1, 1, 1, 1, 1,
0.8523144, -1.013198, 4.123363, 1, 1, 1, 1, 1,
0.8553098, 0.489044, 2.52894, 1, 1, 1, 1, 1,
0.8569511, -0.1597674, 1.553163, 1, 1, 1, 1, 1,
0.8571436, 0.9036048, -0.2755581, 1, 1, 1, 1, 1,
0.8572535, 0.7989897, 1.450151, 1, 1, 1, 1, 1,
0.8620012, -0.2131734, 1.365422, 1, 1, 1, 1, 1,
0.8630086, 1.401504, 1.630056, 1, 1, 1, 1, 1,
0.8639147, 0.2671065, 1.807237, 1, 1, 1, 1, 1,
0.8664344, -0.07683511, 2.412948, 1, 1, 1, 1, 1,
0.8715119, -0.9431623, 1.354829, 1, 1, 1, 1, 1,
0.8716809, 0.1145155, 0.8985327, 1, 1, 1, 1, 1,
0.8734713, -0.421514, 2.444495, 0, 0, 1, 1, 1,
0.8739602, -1.291311, 2.150511, 1, 0, 0, 1, 1,
0.8753389, -0.719366, 2.187419, 1, 0, 0, 1, 1,
0.8754953, -0.1811845, 2.014194, 1, 0, 0, 1, 1,
0.8783587, -0.3241141, 4.477589, 1, 0, 0, 1, 1,
0.8812823, 0.3354959, 0.4251546, 1, 0, 0, 1, 1,
0.8924524, 0.783478, 0.1897537, 0, 0, 0, 1, 1,
0.8930978, 1.613232, 1.186739, 0, 0, 0, 1, 1,
0.9129072, -0.5478325, 1.652526, 0, 0, 0, 1, 1,
0.9131213, -1.342442, 1.267833, 0, 0, 0, 1, 1,
0.9173704, 1.890397, -1.650836, 0, 0, 0, 1, 1,
0.9197375, 0.8290656, 0.07228678, 0, 0, 0, 1, 1,
0.920851, 1.069196, 0.2567725, 0, 0, 0, 1, 1,
0.9209892, -0.7997892, 1.358395, 1, 1, 1, 1, 1,
0.9222555, -3.440732, 1.248992, 1, 1, 1, 1, 1,
0.9293376, -0.6683261, 2.649088, 1, 1, 1, 1, 1,
0.9361169, 0.5899221, 1.686838, 1, 1, 1, 1, 1,
0.9444865, -0.1845724, 3.449867, 1, 1, 1, 1, 1,
0.9561439, 0.06341556, 1.294038, 1, 1, 1, 1, 1,
0.9573658, 1.198738, -0.4953373, 1, 1, 1, 1, 1,
0.9655133, -0.2320742, 2.715513, 1, 1, 1, 1, 1,
0.9664947, -0.1408284, 3.338894, 1, 1, 1, 1, 1,
0.9668265, 0.5060534, 0.9565434, 1, 1, 1, 1, 1,
0.9714602, -0.05657072, 0.9596071, 1, 1, 1, 1, 1,
0.9757082, 0.08829865, -0.294722, 1, 1, 1, 1, 1,
0.990521, -1.106974, 2.129652, 1, 1, 1, 1, 1,
0.9910495, 0.6824126, 0.7364761, 1, 1, 1, 1, 1,
0.993974, -1.22149, 1.929938, 1, 1, 1, 1, 1,
0.9954782, -1.291458, 2.857905, 0, 0, 1, 1, 1,
0.9984972, 0.3894287, 0.4138083, 1, 0, 0, 1, 1,
1.001057, 1.062114, 2.276593, 1, 0, 0, 1, 1,
1.005593, 1.730963, 1.767131, 1, 0, 0, 1, 1,
1.008658, 0.01306357, 3.391027, 1, 0, 0, 1, 1,
1.009328, -0.2110269, 2.65578, 1, 0, 0, 1, 1,
1.015088, -0.3992969, 1.301093, 0, 0, 0, 1, 1,
1.016756, 0.6280253, -0.1239789, 0, 0, 0, 1, 1,
1.020131, 1.634052, 1.001747, 0, 0, 0, 1, 1,
1.021813, 0.1367467, 3.210826, 0, 0, 0, 1, 1,
1.024995, -1.112171, 2.804122, 0, 0, 0, 1, 1,
1.034632, 0.4710035, 1.886746, 0, 0, 0, 1, 1,
1.034898, 1.548582, 0.5482807, 0, 0, 0, 1, 1,
1.037339, -0.711717, 1.324947, 1, 1, 1, 1, 1,
1.042304, 1.082291, 1.554721, 1, 1, 1, 1, 1,
1.049922, -0.4932477, 0.8280593, 1, 1, 1, 1, 1,
1.050895, 0.6719306, -0.1723365, 1, 1, 1, 1, 1,
1.053192, 1.59388, -1.006295, 1, 1, 1, 1, 1,
1.055168, -0.1400033, 2.036076, 1, 1, 1, 1, 1,
1.06175, -0.9823549, 3.635683, 1, 1, 1, 1, 1,
1.082989, 0.02439851, 0.8038237, 1, 1, 1, 1, 1,
1.086608, 2.567405, 0.5677481, 1, 1, 1, 1, 1,
1.093753, -0.2889963, 1.774212, 1, 1, 1, 1, 1,
1.094071, 0.6194665, 1.476615, 1, 1, 1, 1, 1,
1.097339, -0.4257389, -0.4716263, 1, 1, 1, 1, 1,
1.101834, -0.476805, 1.745869, 1, 1, 1, 1, 1,
1.102426, -1.479354, 1.057964, 1, 1, 1, 1, 1,
1.106038, 0.4576285, -1.378499, 1, 1, 1, 1, 1,
1.113546, -0.717521, 0.7693025, 0, 0, 1, 1, 1,
1.11943, 1.243167, 0.9666035, 1, 0, 0, 1, 1,
1.124515, -0.3088172, 0.2041501, 1, 0, 0, 1, 1,
1.127182, 0.5444391, 2.786088, 1, 0, 0, 1, 1,
1.129569, 0.4507366, 0.4318268, 1, 0, 0, 1, 1,
1.136416, 0.7287025, 2.356645, 1, 0, 0, 1, 1,
1.14076, -1.069555, 3.861151, 0, 0, 0, 1, 1,
1.141423, 0.7623776, 0.9693326, 0, 0, 0, 1, 1,
1.147079, 0.4719035, 1.34043, 0, 0, 0, 1, 1,
1.147203, 1.453476, 0.134967, 0, 0, 0, 1, 1,
1.156529, -2.061845, 0.9906722, 0, 0, 0, 1, 1,
1.157005, 1.614143, 0.3507587, 0, 0, 0, 1, 1,
1.17258, 1.30053, 1.377255, 0, 0, 0, 1, 1,
1.177301, -0.5951403, 1.491889, 1, 1, 1, 1, 1,
1.183363, 0.1240905, 0.3896386, 1, 1, 1, 1, 1,
1.18435, 0.5016154, 0.9443321, 1, 1, 1, 1, 1,
1.189906, 0.1668183, 0.4687383, 1, 1, 1, 1, 1,
1.199478, 0.8637682, 1.382203, 1, 1, 1, 1, 1,
1.204171, 1.558316, -0.4583201, 1, 1, 1, 1, 1,
1.206213, 0.536065, 1.580884, 1, 1, 1, 1, 1,
1.213291, 0.1086899, 1.560478, 1, 1, 1, 1, 1,
1.222951, 1.103304, 0.2251245, 1, 1, 1, 1, 1,
1.242369, -0.7040423, 2.271948, 1, 1, 1, 1, 1,
1.255216, -0.3525461, 0.7327407, 1, 1, 1, 1, 1,
1.257091, 0.3555656, 0.8964009, 1, 1, 1, 1, 1,
1.258876, -1.378635, 1.825522, 1, 1, 1, 1, 1,
1.273811, -2.103011, 0.6794056, 1, 1, 1, 1, 1,
1.282233, 0.3116886, 1.369263, 1, 1, 1, 1, 1,
1.290965, 1.042528, 0.07825148, 0, 0, 1, 1, 1,
1.296191, -0.7950115, 0.6169222, 1, 0, 0, 1, 1,
1.313295, -0.2561284, 0.4041172, 1, 0, 0, 1, 1,
1.338851, -0.1103397, 3.090452, 1, 0, 0, 1, 1,
1.348294, -0.05140753, 2.115906, 1, 0, 0, 1, 1,
1.371358, -0.8508292, 2.828495, 1, 0, 0, 1, 1,
1.378541, -0.9761657, 2.090913, 0, 0, 0, 1, 1,
1.378596, 0.5884107, 0.8020267, 0, 0, 0, 1, 1,
1.381967, 0.2588625, 0.5666543, 0, 0, 0, 1, 1,
1.387823, 0.09445124, 1.953454, 0, 0, 0, 1, 1,
1.389878, 2.17425, 1.640198, 0, 0, 0, 1, 1,
1.390718, 0.1549062, 0.6371742, 0, 0, 0, 1, 1,
1.409793, 0.5858639, 1.154877, 0, 0, 0, 1, 1,
1.430195, -1.352453, 3.975268, 1, 1, 1, 1, 1,
1.431299, 0.01582816, 0.8702158, 1, 1, 1, 1, 1,
1.438585, -1.397511, 3.950467, 1, 1, 1, 1, 1,
1.442776, 0.4818634, 1.789359, 1, 1, 1, 1, 1,
1.442914, -0.192233, 0.2721087, 1, 1, 1, 1, 1,
1.453013, -0.7112745, 4.377237, 1, 1, 1, 1, 1,
1.454543, -0.845637, 2.451746, 1, 1, 1, 1, 1,
1.462472, 0.8248632, 0.7724895, 1, 1, 1, 1, 1,
1.476548, 0.9193079, 1.614353, 1, 1, 1, 1, 1,
1.479206, -1.714958, 3.189724, 1, 1, 1, 1, 1,
1.484361, 0.07197209, 1.417787, 1, 1, 1, 1, 1,
1.487177, -0.55887, 1.601077, 1, 1, 1, 1, 1,
1.487822, 0.315995, 3.310661, 1, 1, 1, 1, 1,
1.48851, -0.162871, 3.856109, 1, 1, 1, 1, 1,
1.490191, 0.0717434, 0.7489356, 1, 1, 1, 1, 1,
1.49658, 0.05259861, 2.680616, 0, 0, 1, 1, 1,
1.509095, 0.3347544, 1.40495, 1, 0, 0, 1, 1,
1.509821, -0.2994671, 1.467657, 1, 0, 0, 1, 1,
1.512675, -0.501529, -0.4736911, 1, 0, 0, 1, 1,
1.524591, 0.8318262, 1.526693, 1, 0, 0, 1, 1,
1.527037, -0.7208322, 1.534974, 1, 0, 0, 1, 1,
1.529532, 0.9112272, 2.365942, 0, 0, 0, 1, 1,
1.545898, 0.3644612, 1.040008, 0, 0, 0, 1, 1,
1.548375, 0.9991005, 1.219673, 0, 0, 0, 1, 1,
1.549061, 0.1393872, 2.53179, 0, 0, 0, 1, 1,
1.557743, 0.3515925, 1.270377, 0, 0, 0, 1, 1,
1.576162, -0.5358583, 3.042965, 0, 0, 0, 1, 1,
1.585409, -0.768065, 1.137372, 0, 0, 0, 1, 1,
1.586979, 0.9404678, 1.100111, 1, 1, 1, 1, 1,
1.587741, -2.165508, 2.232384, 1, 1, 1, 1, 1,
1.60978, 0.2583675, 1.740056, 1, 1, 1, 1, 1,
1.623051, 0.2393107, 1.300969, 1, 1, 1, 1, 1,
1.626222, 1.39054, 1.463977, 1, 1, 1, 1, 1,
1.630105, 0.6221372, 3.082257, 1, 1, 1, 1, 1,
1.643474, 1.765869, -1.698069, 1, 1, 1, 1, 1,
1.659647, -1.487654, 3.182503, 1, 1, 1, 1, 1,
1.682807, 1.358483, 1.522924, 1, 1, 1, 1, 1,
1.694532, 0.14055, -0.5752712, 1, 1, 1, 1, 1,
1.705903, -1.39624, 3.236001, 1, 1, 1, 1, 1,
1.706246, 0.7822552, 0.06397327, 1, 1, 1, 1, 1,
1.713079, -0.7020349, 2.150886, 1, 1, 1, 1, 1,
1.719835, 0.5758669, 1.819821, 1, 1, 1, 1, 1,
1.735453, 0.8573917, 1.295639, 1, 1, 1, 1, 1,
1.73598, -3.214041, 2.766531, 0, 0, 1, 1, 1,
1.745109, 0.142041, 0.9700771, 1, 0, 0, 1, 1,
1.762213, 0.9625811, 1.944688, 1, 0, 0, 1, 1,
1.770906, -1.516351, 3.447587, 1, 0, 0, 1, 1,
1.777248, -0.009455951, 1.774127, 1, 0, 0, 1, 1,
1.777488, -0.7149054, 3.573061, 1, 0, 0, 1, 1,
1.789005, -1.306867, 1.192337, 0, 0, 0, 1, 1,
1.802502, -0.796322, 2.211313, 0, 0, 0, 1, 1,
1.80989, -1.022647, 3.679595, 0, 0, 0, 1, 1,
1.875127, -0.1581865, 2.037394, 0, 0, 0, 1, 1,
1.895919, 0.1054729, 1.114141, 0, 0, 0, 1, 1,
1.917203, 0.8248701, 2.204401, 0, 0, 0, 1, 1,
1.941651, 0.3372183, 2.682786, 0, 0, 0, 1, 1,
1.952256, -0.2247434, 2.512644, 1, 1, 1, 1, 1,
1.967072, -1.154527, 2.992654, 1, 1, 1, 1, 1,
1.968122, -0.321837, -1.420468, 1, 1, 1, 1, 1,
1.976402, 0.9226311, 1.726817, 1, 1, 1, 1, 1,
1.987876, 0.1738942, 0.9108437, 1, 1, 1, 1, 1,
1.998459, -1.916726, 3.079639, 1, 1, 1, 1, 1,
2.012451, -0.7414332, 2.681902, 1, 1, 1, 1, 1,
2.02023, -1.288773, 1.100183, 1, 1, 1, 1, 1,
2.064577, -0.305244, 2.125762, 1, 1, 1, 1, 1,
2.085767, 0.8785159, 1.354648, 1, 1, 1, 1, 1,
2.102927, -0.8347359, 2.423896, 1, 1, 1, 1, 1,
2.108101, 0.171169, 1.448699, 1, 1, 1, 1, 1,
2.108305, -0.08395366, 2.933227, 1, 1, 1, 1, 1,
2.110883, -1.308923, 2.148086, 1, 1, 1, 1, 1,
2.114676, -0.6254362, 1.989054, 1, 1, 1, 1, 1,
2.117574, 0.6557927, 0.4280161, 0, 0, 1, 1, 1,
2.127988, -0.5428903, 2.00062, 1, 0, 0, 1, 1,
2.142442, -0.5699341, 1.388839, 1, 0, 0, 1, 1,
2.166192, 0.4742642, 1.629436, 1, 0, 0, 1, 1,
2.169403, 0.5205554, -1.27228, 1, 0, 0, 1, 1,
2.219539, 0.6637359, 1.48056, 1, 0, 0, 1, 1,
2.234468, -0.4728484, 1.587692, 0, 0, 0, 1, 1,
2.234699, 0.9600753, 0.09219364, 0, 0, 0, 1, 1,
2.259261, 0.9653052, 2.255536, 0, 0, 0, 1, 1,
2.275726, 1.257308, 0.8948762, 0, 0, 0, 1, 1,
2.279964, 0.09501759, 1.507017, 0, 0, 0, 1, 1,
2.325527, 0.01219459, 1.830262, 0, 0, 0, 1, 1,
2.380044, -0.3889369, 1.394287, 0, 0, 0, 1, 1,
2.380514, -1.515302, 2.628186, 1, 1, 1, 1, 1,
2.4023, -1.589099, 1.674994, 1, 1, 1, 1, 1,
2.440836, -0.973968, 0.3401332, 1, 1, 1, 1, 1,
2.503333, 0.8124219, -0.4300925, 1, 1, 1, 1, 1,
2.706605, 0.1130156, 1.210304, 1, 1, 1, 1, 1,
2.980076, -0.2154649, 1.811524, 1, 1, 1, 1, 1,
3.174309, -0.1456353, 2.327673, 1, 1, 1, 1, 1
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
var radius = 9.525876;
var distance = 33.45924;
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
mvMatrix.translate( -0.08888257, 0.2972485, 0.001146555 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45924);
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
