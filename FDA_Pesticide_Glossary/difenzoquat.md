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
-3.040765, -0.2741781, -1.907377, 1, 0, 0, 1,
-2.86266, 0.7458761, -1.397013, 1, 0.007843138, 0, 1,
-2.85465, -0.4561018, -2.427272, 1, 0.01176471, 0, 1,
-2.84064, 0.7240841, -0.5521613, 1, 0.01960784, 0, 1,
-2.652891, -1.83475, -2.522017, 1, 0.02352941, 0, 1,
-2.613174, -0.7726503, -0.9240882, 1, 0.03137255, 0, 1,
-2.584117, -0.0765483, -2.412455, 1, 0.03529412, 0, 1,
-2.542422, -0.7698716, -1.707588, 1, 0.04313726, 0, 1,
-2.540243, 0.8973826, -2.339936, 1, 0.04705882, 0, 1,
-2.512529, 0.6824901, -1.347657, 1, 0.05490196, 0, 1,
-2.461983, -0.04718743, 0.8950096, 1, 0.05882353, 0, 1,
-2.327362, -1.488703, -0.7311751, 1, 0.06666667, 0, 1,
-2.289342, -0.7369028, -1.956061, 1, 0.07058824, 0, 1,
-2.286259, 1.397853, -1.603142, 1, 0.07843138, 0, 1,
-2.234395, 0.6525809, -1.937904, 1, 0.08235294, 0, 1,
-2.229716, -0.6794634, -2.102913, 1, 0.09019608, 0, 1,
-2.196026, -0.988814, -1.148082, 1, 0.09411765, 0, 1,
-2.190623, 0.283936, -4.041249, 1, 0.1019608, 0, 1,
-2.183369, 1.525777, 0.6081854, 1, 0.1098039, 0, 1,
-2.151749, 0.8601346, -3.583144, 1, 0.1137255, 0, 1,
-2.096468, -0.5733638, -2.126209, 1, 0.1215686, 0, 1,
-2.087109, 0.01044278, 0.1058017, 1, 0.1254902, 0, 1,
-2.078855, 0.9602384, -0.04440243, 1, 0.1333333, 0, 1,
-2.072387, 1.158497, 0.4393404, 1, 0.1372549, 0, 1,
-2.060876, -0.1455779, -1.20626, 1, 0.145098, 0, 1,
-2.048244, 0.5108821, -0.7646925, 1, 0.1490196, 0, 1,
-2.046771, -0.5285973, -1.824352, 1, 0.1568628, 0, 1,
-2.045913, 0.6508736, -3.185915, 1, 0.1607843, 0, 1,
-2.012181, 0.5768939, -3.463921, 1, 0.1686275, 0, 1,
-1.978867, -2.306114, -2.459229, 1, 0.172549, 0, 1,
-1.973608, 0.4293796, -0.7849089, 1, 0.1803922, 0, 1,
-1.966074, 1.346958, -1.008325, 1, 0.1843137, 0, 1,
-1.951059, 1.169621, -0.1596177, 1, 0.1921569, 0, 1,
-1.927357, -0.845858, -3.171715, 1, 0.1960784, 0, 1,
-1.918639, -0.6006445, -2.399217, 1, 0.2039216, 0, 1,
-1.898113, -1.688661, -2.567342, 1, 0.2117647, 0, 1,
-1.883945, -1.266785, -2.338862, 1, 0.2156863, 0, 1,
-1.819173, -0.5620333, -2.485398, 1, 0.2235294, 0, 1,
-1.813051, 1.387613, -0.01654134, 1, 0.227451, 0, 1,
-1.812411, -0.1053342, -1.634056, 1, 0.2352941, 0, 1,
-1.803456, -0.0783815, -2.020049, 1, 0.2392157, 0, 1,
-1.79391, -1.310825, -0.7690799, 1, 0.2470588, 0, 1,
-1.791217, 2.672626, -0.6754035, 1, 0.2509804, 0, 1,
-1.776976, -0.2294999, -1.80478, 1, 0.2588235, 0, 1,
-1.774995, -1.302923, -0.9933162, 1, 0.2627451, 0, 1,
-1.77116, 0.2937559, -1.070529, 1, 0.2705882, 0, 1,
-1.764187, 0.1496208, -0.961713, 1, 0.2745098, 0, 1,
-1.758625, -0.340627, -0.5540596, 1, 0.282353, 0, 1,
-1.749687, -0.1335108, -1.677899, 1, 0.2862745, 0, 1,
-1.738579, 0.7044579, -0.4057509, 1, 0.2941177, 0, 1,
-1.696498, -0.9161181, -1.80891, 1, 0.3019608, 0, 1,
-1.691674, 1.940102, 1.04729, 1, 0.3058824, 0, 1,
-1.687829, 1.220527, -1.132149, 1, 0.3137255, 0, 1,
-1.681219, 1.38281, -1.290559, 1, 0.3176471, 0, 1,
-1.671498, 0.2270101, -0.3486412, 1, 0.3254902, 0, 1,
-1.65927, 0.7502771, -0.4310859, 1, 0.3294118, 0, 1,
-1.658786, -0.2965523, -1.82316, 1, 0.3372549, 0, 1,
-1.658106, 0.3860261, -2.014462, 1, 0.3411765, 0, 1,
-1.654072, 1.129871, -0.1277413, 1, 0.3490196, 0, 1,
-1.633108, -1.716999, -0.9121857, 1, 0.3529412, 0, 1,
-1.62606, 0.6216227, 0.7860504, 1, 0.3607843, 0, 1,
-1.613504, 0.3773829, -1.166506, 1, 0.3647059, 0, 1,
-1.612952, 1.579572, -1.525756, 1, 0.372549, 0, 1,
-1.607716, -1.240189, -0.8201027, 1, 0.3764706, 0, 1,
-1.602235, 0.7269565, -0.7750155, 1, 0.3843137, 0, 1,
-1.574126, -1.837396, -2.776828, 1, 0.3882353, 0, 1,
-1.567166, -1.74609, -3.637182, 1, 0.3960784, 0, 1,
-1.564444, 1.140651, -0.06705441, 1, 0.4039216, 0, 1,
-1.560808, -0.4188672, -3.752719, 1, 0.4078431, 0, 1,
-1.551424, -1.025641, -0.529739, 1, 0.4156863, 0, 1,
-1.517099, -0.3337822, -2.458427, 1, 0.4196078, 0, 1,
-1.516931, 0.1873917, -1.235075, 1, 0.427451, 0, 1,
-1.49803, -0.6126421, -3.122276, 1, 0.4313726, 0, 1,
-1.489745, 0.1942623, -2.356471, 1, 0.4392157, 0, 1,
-1.464048, 1.060264, -1.456795, 1, 0.4431373, 0, 1,
-1.460938, -0.3131565, -1.336515, 1, 0.4509804, 0, 1,
-1.458955, 2.107053, -1.100992, 1, 0.454902, 0, 1,
-1.449113, 0.5932989, -1.0976, 1, 0.4627451, 0, 1,
-1.448357, 0.3632902, -2.414966, 1, 0.4666667, 0, 1,
-1.428196, 0.1784355, -1.644938, 1, 0.4745098, 0, 1,
-1.416002, -2.521479, -2.023185, 1, 0.4784314, 0, 1,
-1.399852, -0.9501261, -1.21696, 1, 0.4862745, 0, 1,
-1.392923, 0.6979441, -1.358816, 1, 0.4901961, 0, 1,
-1.390801, 0.4203921, -2.940203, 1, 0.4980392, 0, 1,
-1.390546, -1.477373, -1.691152, 1, 0.5058824, 0, 1,
-1.388432, -0.5761028, -2.745513, 1, 0.509804, 0, 1,
-1.376561, -1.000938, -1.155437, 1, 0.5176471, 0, 1,
-1.365485, -2.438711, -4.452497, 1, 0.5215687, 0, 1,
-1.365215, 0.887053, 0.5684377, 1, 0.5294118, 0, 1,
-1.362086, 2.18639, -0.9467751, 1, 0.5333334, 0, 1,
-1.354728, -1.86267, -2.606667, 1, 0.5411765, 0, 1,
-1.345292, 0.4659885, -0.4540464, 1, 0.5450981, 0, 1,
-1.334554, 1.387407, -0.7703086, 1, 0.5529412, 0, 1,
-1.333723, 0.02165247, -1.128808, 1, 0.5568628, 0, 1,
-1.332994, 0.3581392, -2.452528, 1, 0.5647059, 0, 1,
-1.332288, 0.5351548, -0.9434065, 1, 0.5686275, 0, 1,
-1.330863, 1.099094, 0.4919215, 1, 0.5764706, 0, 1,
-1.330568, 0.1661996, -0.5841686, 1, 0.5803922, 0, 1,
-1.328267, -0.5586774, -2.596342, 1, 0.5882353, 0, 1,
-1.327951, 1.736099, 0.2407114, 1, 0.5921569, 0, 1,
-1.32593, -0.7309541, -2.260419, 1, 0.6, 0, 1,
-1.325, -2.453141, -1.940018, 1, 0.6078432, 0, 1,
-1.317999, 1.437319, 0.01080647, 1, 0.6117647, 0, 1,
-1.313021, -1.140167, -1.684612, 1, 0.6196079, 0, 1,
-1.312183, 1.500276, 0.5807674, 1, 0.6235294, 0, 1,
-1.311006, 0.2975141, -1.822644, 1, 0.6313726, 0, 1,
-1.306198, 1.128611, -2.087588, 1, 0.6352941, 0, 1,
-1.304822, -1.588312, -1.826475, 1, 0.6431373, 0, 1,
-1.291929, -1.238214, -1.13586, 1, 0.6470588, 0, 1,
-1.284961, -0.2790951, -2.63654, 1, 0.654902, 0, 1,
-1.270747, 0.8826625, -1.877679, 1, 0.6588235, 0, 1,
-1.265714, 0.2197233, -1.874344, 1, 0.6666667, 0, 1,
-1.261316, 0.8011843, -0.3384185, 1, 0.6705883, 0, 1,
-1.258203, -0.8320854, -4.319137, 1, 0.6784314, 0, 1,
-1.251402, 1.308453, -0.1234192, 1, 0.682353, 0, 1,
-1.245845, -0.5502047, -1.249303, 1, 0.6901961, 0, 1,
-1.244883, -0.8313555, -0.9595926, 1, 0.6941177, 0, 1,
-1.243264, 0.09698295, -1.819711, 1, 0.7019608, 0, 1,
-1.242868, -0.1577983, -2.249358, 1, 0.7098039, 0, 1,
-1.241949, -0.04714551, -1.810604, 1, 0.7137255, 0, 1,
-1.240988, 0.3742754, -0.5043321, 1, 0.7215686, 0, 1,
-1.239498, 1.372225, -0.4970208, 1, 0.7254902, 0, 1,
-1.238409, 1.556529, -2.491399, 1, 0.7333333, 0, 1,
-1.237827, 0.6318451, -0.6402946, 1, 0.7372549, 0, 1,
-1.237046, 1.831703, 0.7722777, 1, 0.7450981, 0, 1,
-1.231496, 0.9427113, -1.233484, 1, 0.7490196, 0, 1,
-1.228186, 1.59873, -0.779771, 1, 0.7568628, 0, 1,
-1.224832, 1.195195, -0.3125591, 1, 0.7607843, 0, 1,
-1.223701, 1.092926, -0.992119, 1, 0.7686275, 0, 1,
-1.221503, 0.3348605, -2.975463, 1, 0.772549, 0, 1,
-1.221228, 0.1457422, -1.845742, 1, 0.7803922, 0, 1,
-1.213631, -1.424878, -2.16467, 1, 0.7843137, 0, 1,
-1.213144, -1.085418, -3.334287, 1, 0.7921569, 0, 1,
-1.209506, -0.3522291, -4.492532, 1, 0.7960784, 0, 1,
-1.204043, 0.9048091, -1.017811, 1, 0.8039216, 0, 1,
-1.195362, 0.5246674, -0.8692828, 1, 0.8117647, 0, 1,
-1.194434, 0.7040706, -0.6922662, 1, 0.8156863, 0, 1,
-1.193722, -0.5616689, -4.004759, 1, 0.8235294, 0, 1,
-1.186531, -0.3256919, -2.121361, 1, 0.827451, 0, 1,
-1.185672, -1.415114, -3.056244, 1, 0.8352941, 0, 1,
-1.185075, 0.3636089, -1.760603, 1, 0.8392157, 0, 1,
-1.166289, -0.8117403, -3.118103, 1, 0.8470588, 0, 1,
-1.163621, 1.433684, -0.5657266, 1, 0.8509804, 0, 1,
-1.152262, -0.4322322, -1.241325, 1, 0.8588235, 0, 1,
-1.1513, -0.04677936, -1.370266, 1, 0.8627451, 0, 1,
-1.146965, 0.7957799, -1.454034, 1, 0.8705882, 0, 1,
-1.145716, -1.397625, -3.154613, 1, 0.8745098, 0, 1,
-1.137022, 0.1451995, -1.215965, 1, 0.8823529, 0, 1,
-1.132753, 1.672507, -0.5197536, 1, 0.8862745, 0, 1,
-1.130721, 0.123901, 0.01499246, 1, 0.8941177, 0, 1,
-1.130256, -1.481835, -4.068993, 1, 0.8980392, 0, 1,
-1.12494, -0.373386, -2.503402, 1, 0.9058824, 0, 1,
-1.118949, 0.5890372, -1.81474, 1, 0.9137255, 0, 1,
-1.111769, -0.5095107, -2.706084, 1, 0.9176471, 0, 1,
-1.106082, 2.62155, -0.4386137, 1, 0.9254902, 0, 1,
-1.101562, -1.689195, -1.810908, 1, 0.9294118, 0, 1,
-1.097964, -0.5851309, -1.474455, 1, 0.9372549, 0, 1,
-1.095319, -0.6915917, -1.126762, 1, 0.9411765, 0, 1,
-1.092719, -0.6416767, -1.711306, 1, 0.9490196, 0, 1,
-1.090511, 2.184381, -1.684982, 1, 0.9529412, 0, 1,
-1.086127, 0.03755012, -2.010787, 1, 0.9607843, 0, 1,
-1.084761, 0.3017409, -0.8900104, 1, 0.9647059, 0, 1,
-1.081192, 0.2200948, -0.2133612, 1, 0.972549, 0, 1,
-1.078598, 1.150239, -1.429958, 1, 0.9764706, 0, 1,
-1.077002, -0.1308154, 0.1513679, 1, 0.9843137, 0, 1,
-1.066768, 1.083021, -3.957099, 1, 0.9882353, 0, 1,
-1.065134, -0.3246504, -1.252526, 1, 0.9960784, 0, 1,
-1.062398, 1.838577, -0.01193301, 0.9960784, 1, 0, 1,
-1.045591, -0.6890954, -1.596468, 0.9921569, 1, 0, 1,
-1.042042, 0.5735614, -1.216245, 0.9843137, 1, 0, 1,
-1.03039, -0.822028, -1.638034, 0.9803922, 1, 0, 1,
-1.006674, -0.1740541, -2.849506, 0.972549, 1, 0, 1,
-1.00497, 0.196164, -0.06782002, 0.9686275, 1, 0, 1,
-1.003345, -0.2227236, -4.339457, 0.9607843, 1, 0, 1,
-1.00256, -0.2600208, -4.08168, 0.9568627, 1, 0, 1,
-0.9927334, 1.589926, 0.3648013, 0.9490196, 1, 0, 1,
-0.9917209, -1.334378, -2.263094, 0.945098, 1, 0, 1,
-0.986221, 0.7620491, -1.219253, 0.9372549, 1, 0, 1,
-0.9773259, -0.511355, -2.177184, 0.9333333, 1, 0, 1,
-0.9750524, -2.015698, -2.396518, 0.9254902, 1, 0, 1,
-0.9692721, -1.214213, -2.868397, 0.9215686, 1, 0, 1,
-0.9486986, 1.498399, 0.03000818, 0.9137255, 1, 0, 1,
-0.9471255, 1.578482, 0.01335327, 0.9098039, 1, 0, 1,
-0.9464251, -0.4974481, -1.444291, 0.9019608, 1, 0, 1,
-0.9399744, -1.125314, -1.665901, 0.8941177, 1, 0, 1,
-0.9228709, -1.094304, -2.817324, 0.8901961, 1, 0, 1,
-0.9189998, -0.812061, -2.63815, 0.8823529, 1, 0, 1,
-0.9148749, 0.3266128, -2.542799, 0.8784314, 1, 0, 1,
-0.9145183, -0.2343454, -1.430721, 0.8705882, 1, 0, 1,
-0.9088538, -0.5567952, -1.99078, 0.8666667, 1, 0, 1,
-0.9024394, -0.4838665, -3.256165, 0.8588235, 1, 0, 1,
-0.9002259, 1.936395, 0.08049881, 0.854902, 1, 0, 1,
-0.9002251, 0.169262, 0.9899411, 0.8470588, 1, 0, 1,
-0.8998293, -0.7564719, -0.5804499, 0.8431373, 1, 0, 1,
-0.8912481, -0.6151677, -1.326735, 0.8352941, 1, 0, 1,
-0.889833, -0.3086093, -2.813576, 0.8313726, 1, 0, 1,
-0.8877311, -1.062352, -3.917955, 0.8235294, 1, 0, 1,
-0.8831865, 0.7740044, -1.023399, 0.8196079, 1, 0, 1,
-0.8790182, -0.1920873, -2.318381, 0.8117647, 1, 0, 1,
-0.875513, 0.5289328, -2.637777, 0.8078431, 1, 0, 1,
-0.8743024, -0.346162, -2.921388, 0.8, 1, 0, 1,
-0.8701653, 1.455076, -0.4647192, 0.7921569, 1, 0, 1,
-0.8693548, -0.3093449, -1.454132, 0.7882353, 1, 0, 1,
-0.8644559, 0.8628129, -1.346191, 0.7803922, 1, 0, 1,
-0.8564639, -0.2408289, -1.504981, 0.7764706, 1, 0, 1,
-0.855065, -0.6948228, -2.07793, 0.7686275, 1, 0, 1,
-0.8546618, 0.374005, -0.9134674, 0.7647059, 1, 0, 1,
-0.8513173, 0.7991985, -0.7165329, 0.7568628, 1, 0, 1,
-0.8454152, -1.581721, -2.524843, 0.7529412, 1, 0, 1,
-0.8421101, 1.248016, -1.731383, 0.7450981, 1, 0, 1,
-0.8416451, -0.544549, -2.557227, 0.7411765, 1, 0, 1,
-0.834568, 1.192751, -0.619639, 0.7333333, 1, 0, 1,
-0.8330823, -1.000988, -4.133686, 0.7294118, 1, 0, 1,
-0.8191687, -0.06493627, -1.422136, 0.7215686, 1, 0, 1,
-0.8172945, 0.02175951, -2.072932, 0.7176471, 1, 0, 1,
-0.8157185, 1.080903, -0.2685369, 0.7098039, 1, 0, 1,
-0.811219, 0.2352836, -0.5164618, 0.7058824, 1, 0, 1,
-0.8084717, -0.7822428, -3.41475, 0.6980392, 1, 0, 1,
-0.8044911, -1.634828, -2.470617, 0.6901961, 1, 0, 1,
-0.7901965, 1.271262, -0.5735174, 0.6862745, 1, 0, 1,
-0.7901899, 0.3675795, -1.014011, 0.6784314, 1, 0, 1,
-0.7877536, -0.3411781, -3.763206, 0.6745098, 1, 0, 1,
-0.7796715, 0.6679971, -0.8214986, 0.6666667, 1, 0, 1,
-0.7784923, -1.198176, -2.802618, 0.6627451, 1, 0, 1,
-0.7782736, -0.5667719, -1.132609, 0.654902, 1, 0, 1,
-0.7774041, -0.005503219, -0.7590907, 0.6509804, 1, 0, 1,
-0.7766395, -1.975441, -3.286181, 0.6431373, 1, 0, 1,
-0.7691827, -1.480566, -2.509916, 0.6392157, 1, 0, 1,
-0.7662768, 0.1545011, -2.055794, 0.6313726, 1, 0, 1,
-0.7639912, 0.4229219, -0.7930658, 0.627451, 1, 0, 1,
-0.7613798, 0.2972207, -0.8956141, 0.6196079, 1, 0, 1,
-0.7610267, -0.2716327, -1.51911, 0.6156863, 1, 0, 1,
-0.7589644, 0.163361, -0.6679139, 0.6078432, 1, 0, 1,
-0.7547869, 1.462319, -0.1952422, 0.6039216, 1, 0, 1,
-0.7535454, 0.2294733, -0.195527, 0.5960785, 1, 0, 1,
-0.7530559, 0.7892021, -1.496303, 0.5882353, 1, 0, 1,
-0.7470646, 0.6925828, -1.155639, 0.5843138, 1, 0, 1,
-0.7462764, -0.236418, -0.6428504, 0.5764706, 1, 0, 1,
-0.7444221, -1.576511, -2.782345, 0.572549, 1, 0, 1,
-0.7436173, -0.4117776, -0.9915065, 0.5647059, 1, 0, 1,
-0.7417386, 0.6933689, -0.6469374, 0.5607843, 1, 0, 1,
-0.7370746, -0.1409186, -1.080392, 0.5529412, 1, 0, 1,
-0.7366149, -0.175474, -1.208068, 0.5490196, 1, 0, 1,
-0.7342615, -0.586905, -0.6483165, 0.5411765, 1, 0, 1,
-0.7336414, -1.058434, -3.178009, 0.5372549, 1, 0, 1,
-0.7323087, -1.245298, -3.926683, 0.5294118, 1, 0, 1,
-0.7321315, 1.622092, 0.6778222, 0.5254902, 1, 0, 1,
-0.7312381, -1.043248, -2.260812, 0.5176471, 1, 0, 1,
-0.731011, -0.9423934, -1.687209, 0.5137255, 1, 0, 1,
-0.7217647, 0.8233286, -0.1850437, 0.5058824, 1, 0, 1,
-0.7215149, -0.7187349, -2.777522, 0.5019608, 1, 0, 1,
-0.7178091, 0.6718435, -1.561419, 0.4941176, 1, 0, 1,
-0.7113376, -0.7836532, -3.077869, 0.4862745, 1, 0, 1,
-0.7072831, -0.8342216, -1.454638, 0.4823529, 1, 0, 1,
-0.7059206, 2.257965, -0.6317107, 0.4745098, 1, 0, 1,
-0.7048382, -0.8030741, -1.888874, 0.4705882, 1, 0, 1,
-0.7042458, 1.726731, -0.7363061, 0.4627451, 1, 0, 1,
-0.7003345, -0.2995321, -3.01903, 0.4588235, 1, 0, 1,
-0.6998167, -1.666153, -2.622184, 0.4509804, 1, 0, 1,
-0.6980085, -1.692626, -1.179534, 0.4470588, 1, 0, 1,
-0.6902642, -1.71339, -1.531489, 0.4392157, 1, 0, 1,
-0.6873475, -0.06066452, -3.799211, 0.4352941, 1, 0, 1,
-0.6863905, -1.194228, -3.04938, 0.427451, 1, 0, 1,
-0.6822575, 1.41645, -1.402223, 0.4235294, 1, 0, 1,
-0.6790193, 0.2519839, -1.439013, 0.4156863, 1, 0, 1,
-0.6772877, -1.606753, -4.39572, 0.4117647, 1, 0, 1,
-0.6752825, 1.074646, 0.09401495, 0.4039216, 1, 0, 1,
-0.673237, 1.617454, 0.1013853, 0.3960784, 1, 0, 1,
-0.6672809, 0.9421337, -0.1612741, 0.3921569, 1, 0, 1,
-0.6577374, -0.5415814, -1.641869, 0.3843137, 1, 0, 1,
-0.6542848, 1.079056, 1.034462, 0.3803922, 1, 0, 1,
-0.6472265, -1.191003, -3.571219, 0.372549, 1, 0, 1,
-0.6438372, 1.21296, -0.9779325, 0.3686275, 1, 0, 1,
-0.6422176, 0.1107612, 0.4731177, 0.3607843, 1, 0, 1,
-0.6385667, 0.4734353, -2.446464, 0.3568628, 1, 0, 1,
-0.6351837, 0.1139961, -1.060625, 0.3490196, 1, 0, 1,
-0.6330084, -0.2639962, 0.01173287, 0.345098, 1, 0, 1,
-0.6252018, 0.4404087, -0.1725084, 0.3372549, 1, 0, 1,
-0.6250517, -0.6320677, -2.13388, 0.3333333, 1, 0, 1,
-0.6243377, -1.481, -3.231764, 0.3254902, 1, 0, 1,
-0.6183953, -0.869032, -2.461513, 0.3215686, 1, 0, 1,
-0.6176746, -0.1740732, -1.132856, 0.3137255, 1, 0, 1,
-0.6100788, 0.1248825, -0.2054847, 0.3098039, 1, 0, 1,
-0.6072892, 0.6713842, -0.9245508, 0.3019608, 1, 0, 1,
-0.6056776, 1.361498, 0.4747265, 0.2941177, 1, 0, 1,
-0.6025347, -0.9207892, -2.400744, 0.2901961, 1, 0, 1,
-0.596165, 0.2629622, -1.930065, 0.282353, 1, 0, 1,
-0.5802757, 0.2549876, 0.9181069, 0.2784314, 1, 0, 1,
-0.5725476, -0.4668922, -1.835396, 0.2705882, 1, 0, 1,
-0.5667943, -0.6623597, -3.007739, 0.2666667, 1, 0, 1,
-0.5583338, -0.4465361, -1.236697, 0.2588235, 1, 0, 1,
-0.5559019, -1.414943, -2.469279, 0.254902, 1, 0, 1,
-0.5536156, 0.6193475, -2.429697, 0.2470588, 1, 0, 1,
-0.55349, 1.731507, -0.3509432, 0.2431373, 1, 0, 1,
-0.5522485, -1.294482, -2.310414, 0.2352941, 1, 0, 1,
-0.5390002, 0.6871017, 0.05811099, 0.2313726, 1, 0, 1,
-0.5179228, -0.06124283, -1.951938, 0.2235294, 1, 0, 1,
-0.5178865, -0.7100886, -4.1478, 0.2196078, 1, 0, 1,
-0.5167829, 0.5167082, 0.06399398, 0.2117647, 1, 0, 1,
-0.5162086, -1.475815, -3.387554, 0.2078431, 1, 0, 1,
-0.5155031, 1.563595, 0.1645549, 0.2, 1, 0, 1,
-0.5151787, -0.3597611, -3.541845, 0.1921569, 1, 0, 1,
-0.5078548, -0.9685666, -3.410514, 0.1882353, 1, 0, 1,
-0.5016953, -1.718705, -3.416262, 0.1803922, 1, 0, 1,
-0.4990797, -1.669155, -2.814398, 0.1764706, 1, 0, 1,
-0.4981798, -0.6198118, -1.697262, 0.1686275, 1, 0, 1,
-0.4965688, 1.471485, 0.1771646, 0.1647059, 1, 0, 1,
-0.4964125, 0.4054929, -1.713009, 0.1568628, 1, 0, 1,
-0.4941431, 0.1867586, -0.9905955, 0.1529412, 1, 0, 1,
-0.4857081, -1.033812, -1.832275, 0.145098, 1, 0, 1,
-0.4844657, 1.464457, -0.3719108, 0.1411765, 1, 0, 1,
-0.4738953, 0.194775, -2.980229, 0.1333333, 1, 0, 1,
-0.4736144, 0.9109493, -0.6150631, 0.1294118, 1, 0, 1,
-0.4730287, -1.430653, -3.260519, 0.1215686, 1, 0, 1,
-0.4695327, 0.2294558, 0.08206922, 0.1176471, 1, 0, 1,
-0.4693492, 0.06773284, -2.197471, 0.1098039, 1, 0, 1,
-0.4658489, -0.5166393, -1.241123, 0.1058824, 1, 0, 1,
-0.4584841, 2.670523, 1.009687, 0.09803922, 1, 0, 1,
-0.4576337, -0.2970188, -2.82723, 0.09019608, 1, 0, 1,
-0.4545094, 1.025869, -0.9652858, 0.08627451, 1, 0, 1,
-0.4508482, -1.158425, -2.417319, 0.07843138, 1, 0, 1,
-0.4487784, -0.626727, -2.570844, 0.07450981, 1, 0, 1,
-0.4485201, -0.6396657, -3.735724, 0.06666667, 1, 0, 1,
-0.4451443, -1.220526, -1.903225, 0.0627451, 1, 0, 1,
-0.4444444, 0.4283918, -0.7802659, 0.05490196, 1, 0, 1,
-0.4422876, 0.4048245, -0.3454186, 0.05098039, 1, 0, 1,
-0.4375962, 0.1761307, -1.738149, 0.04313726, 1, 0, 1,
-0.431536, -3.436682, -3.582195, 0.03921569, 1, 0, 1,
-0.4298787, -1.168951, -3.48053, 0.03137255, 1, 0, 1,
-0.4238189, -2.3899, -2.751341, 0.02745098, 1, 0, 1,
-0.4229818, -0.2636736, -1.81123, 0.01960784, 1, 0, 1,
-0.422557, 0.4228012, -2.381172, 0.01568628, 1, 0, 1,
-0.4224768, 0.4082391, -0.829632, 0.007843138, 1, 0, 1,
-0.4170884, -0.0592299, -2.320175, 0.003921569, 1, 0, 1,
-0.4165489, -0.8438499, -2.548731, 0, 1, 0.003921569, 1,
-0.4149651, -1.828118, -2.90364, 0, 1, 0.01176471, 1,
-0.4141065, 0.6016325, -1.340766, 0, 1, 0.01568628, 1,
-0.4112923, -0.8337136, -2.321019, 0, 1, 0.02352941, 1,
-0.4102249, -0.5384868, -3.132234, 0, 1, 0.02745098, 1,
-0.4100042, -1.690757, -0.4748084, 0, 1, 0.03529412, 1,
-0.4014895, 1.7429, 0.6437489, 0, 1, 0.03921569, 1,
-0.3971795, -0.4322568, -2.287048, 0, 1, 0.04705882, 1,
-0.3962829, 0.6262951, -0.6818951, 0, 1, 0.05098039, 1,
-0.3954707, 0.1704492, -1.692884, 0, 1, 0.05882353, 1,
-0.3939152, 0.9158316, -0.3850703, 0, 1, 0.0627451, 1,
-0.3935387, -0.847206, -2.560555, 0, 1, 0.07058824, 1,
-0.3929897, -0.02950248, -1.033437, 0, 1, 0.07450981, 1,
-0.3882137, -0.2879411, -4.915309, 0, 1, 0.08235294, 1,
-0.3857147, -0.4571582, -4.295174, 0, 1, 0.08627451, 1,
-0.3852566, 1.12589, -1.79373, 0, 1, 0.09411765, 1,
-0.3844259, 1.334132, -0.8565101, 0, 1, 0.1019608, 1,
-0.3831797, -0.700121, -1.481733, 0, 1, 0.1058824, 1,
-0.3821256, -0.1342546, -1.712211, 0, 1, 0.1137255, 1,
-0.3810021, 0.6252794, -0.6698058, 0, 1, 0.1176471, 1,
-0.3659058, 0.3768415, -0.8006559, 0, 1, 0.1254902, 1,
-0.3643925, 0.4313341, -0.4209816, 0, 1, 0.1294118, 1,
-0.364387, -0.4184484, -3.07259, 0, 1, 0.1372549, 1,
-0.3619016, 0.3338417, -2.653523, 0, 1, 0.1411765, 1,
-0.3610652, 1.458315, -1.501833, 0, 1, 0.1490196, 1,
-0.3606988, -2.163662, -3.204032, 0, 1, 0.1529412, 1,
-0.3539835, -0.8149152, -1.510438, 0, 1, 0.1607843, 1,
-0.3524317, -0.6181918, -2.975233, 0, 1, 0.1647059, 1,
-0.3512563, 0.1024292, -1.557842, 0, 1, 0.172549, 1,
-0.3480234, -0.259886, -2.778819, 0, 1, 0.1764706, 1,
-0.3473222, -1.376662, -1.973512, 0, 1, 0.1843137, 1,
-0.3447631, 0.7296497, -0.4129516, 0, 1, 0.1882353, 1,
-0.3224281, 0.2275243, -1.125379, 0, 1, 0.1960784, 1,
-0.3202092, 0.6773582, -0.656031, 0, 1, 0.2039216, 1,
-0.3182565, 0.02339693, -1.890627, 0, 1, 0.2078431, 1,
-0.3180959, -0.07607701, -1.047504, 0, 1, 0.2156863, 1,
-0.3179701, 0.6935473, 0.2609551, 0, 1, 0.2196078, 1,
-0.3173448, 1.496514, -0.2111081, 0, 1, 0.227451, 1,
-0.3144306, -0.1202676, -1.252669, 0, 1, 0.2313726, 1,
-0.3122897, -0.3805688, -2.792712, 0, 1, 0.2392157, 1,
-0.3105648, -0.03392997, -0.6114441, 0, 1, 0.2431373, 1,
-0.3080221, 0.4140024, -0.9375004, 0, 1, 0.2509804, 1,
-0.3079002, -0.730769, -2.704221, 0, 1, 0.254902, 1,
-0.3038779, -0.4113242, -1.371029, 0, 1, 0.2627451, 1,
-0.3022322, -1.496321, -1.975121, 0, 1, 0.2666667, 1,
-0.3009424, -0.4865609, -3.635638, 0, 1, 0.2745098, 1,
-0.3000565, -1.85327, -1.802747, 0, 1, 0.2784314, 1,
-0.2996276, -0.2448367, -0.4776464, 0, 1, 0.2862745, 1,
-0.2983449, 1.888604, 0.06188344, 0, 1, 0.2901961, 1,
-0.2972099, -1.061164, -2.953089, 0, 1, 0.2980392, 1,
-0.2970688, -1.505704, -2.692679, 0, 1, 0.3058824, 1,
-0.296656, 1.106237, 0.8247688, 0, 1, 0.3098039, 1,
-0.2924067, 0.4339072, -2.040058, 0, 1, 0.3176471, 1,
-0.2913649, -0.357679, -1.963982, 0, 1, 0.3215686, 1,
-0.2909627, -0.3972632, -2.316421, 0, 1, 0.3294118, 1,
-0.2859141, 1.394634, 0.5450029, 0, 1, 0.3333333, 1,
-0.2792347, 0.1691132, -1.585331, 0, 1, 0.3411765, 1,
-0.2781091, -0.08937719, -1.875097, 0, 1, 0.345098, 1,
-0.2758873, 0.5135545, 0.01388359, 0, 1, 0.3529412, 1,
-0.2729089, 1.350488, -0.545936, 0, 1, 0.3568628, 1,
-0.2664886, -0.1317737, -2.080064, 0, 1, 0.3647059, 1,
-0.2652928, 0.9427195, 0.6392844, 0, 1, 0.3686275, 1,
-0.2632249, 0.7561106, -0.6714551, 0, 1, 0.3764706, 1,
-0.2615987, -0.4965541, -0.3520116, 0, 1, 0.3803922, 1,
-0.2601385, 0.5287121, -0.977834, 0, 1, 0.3882353, 1,
-0.2592784, 1.62497, 0.3327738, 0, 1, 0.3921569, 1,
-0.2552804, 1.023246, -0.3957042, 0, 1, 0.4, 1,
-0.250548, -0.4958281, -3.118647, 0, 1, 0.4078431, 1,
-0.2484413, 0.1814961, -0.5499657, 0, 1, 0.4117647, 1,
-0.2469383, -0.7638418, -4.096706, 0, 1, 0.4196078, 1,
-0.243771, 1.402644, -0.3762906, 0, 1, 0.4235294, 1,
-0.2393613, -1.027386, -2.80743, 0, 1, 0.4313726, 1,
-0.2381586, -0.8797781, -3.495054, 0, 1, 0.4352941, 1,
-0.2351109, -0.5498136, -4.054596, 0, 1, 0.4431373, 1,
-0.233274, -0.2394735, -2.304966, 0, 1, 0.4470588, 1,
-0.233152, -0.3081684, -1.60632, 0, 1, 0.454902, 1,
-0.23299, -0.6331713, -3.100284, 0, 1, 0.4588235, 1,
-0.2269749, 0.7849488, -2.01423, 0, 1, 0.4666667, 1,
-0.2260469, -0.5914174, -3.56057, 0, 1, 0.4705882, 1,
-0.2233515, -0.4897344, -3.280414, 0, 1, 0.4784314, 1,
-0.2224679, 0.1182605, -1.639155, 0, 1, 0.4823529, 1,
-0.2196581, 0.9719386, 1.008858, 0, 1, 0.4901961, 1,
-0.2194243, -1.036345, -2.322214, 0, 1, 0.4941176, 1,
-0.2122151, -0.9774984, -2.600419, 0, 1, 0.5019608, 1,
-0.2091368, -1.269485, -3.809873, 0, 1, 0.509804, 1,
-0.2077459, -0.2572655, -1.940395, 0, 1, 0.5137255, 1,
-0.2072392, -0.8051537, -2.729175, 0, 1, 0.5215687, 1,
-0.20637, 0.9729439, 1.650178, 0, 1, 0.5254902, 1,
-0.2031026, -1.215012, -4.437377, 0, 1, 0.5333334, 1,
-0.1922117, 0.07889348, -1.118394, 0, 1, 0.5372549, 1,
-0.1877962, 1.150239, 0.1394601, 0, 1, 0.5450981, 1,
-0.1818781, -2.603634, -3.508149, 0, 1, 0.5490196, 1,
-0.1798759, 0.162672, 0.08573346, 0, 1, 0.5568628, 1,
-0.1794054, 0.1556686, -2.174859, 0, 1, 0.5607843, 1,
-0.1782231, 1.114688, 0.5847973, 0, 1, 0.5686275, 1,
-0.1775764, -0.9161829, -1.982692, 0, 1, 0.572549, 1,
-0.1771669, -0.3238462, -4.789959, 0, 1, 0.5803922, 1,
-0.1737375, 0.7591854, -0.2158862, 0, 1, 0.5843138, 1,
-0.1726697, -0.1218766, -0.9508241, 0, 1, 0.5921569, 1,
-0.1711935, -0.0847514, -1.07392, 0, 1, 0.5960785, 1,
-0.1664091, -1.227867, -1.938301, 0, 1, 0.6039216, 1,
-0.1661627, -1.633802, -2.980391, 0, 1, 0.6117647, 1,
-0.1660784, -1.080958, -3.723533, 0, 1, 0.6156863, 1,
-0.1602492, 0.5491379, 0.285331, 0, 1, 0.6235294, 1,
-0.1592518, -0.1414532, -2.758383, 0, 1, 0.627451, 1,
-0.1569009, -0.4905776, -3.069153, 0, 1, 0.6352941, 1,
-0.1558519, -0.8653931, -1.582688, 0, 1, 0.6392157, 1,
-0.1550655, -0.002311286, -0.003199307, 0, 1, 0.6470588, 1,
-0.1535596, 0.6520213, 0.2228163, 0, 1, 0.6509804, 1,
-0.1532973, 0.3949695, 0.5603705, 0, 1, 0.6588235, 1,
-0.1532393, -1.857549, -2.257906, 0, 1, 0.6627451, 1,
-0.1484279, 1.103827, 1.385203, 0, 1, 0.6705883, 1,
-0.1477476, -1.409748, -4.181223, 0, 1, 0.6745098, 1,
-0.1427734, 0.01351513, -0.9706548, 0, 1, 0.682353, 1,
-0.1422254, 0.6760496, -2.209894, 0, 1, 0.6862745, 1,
-0.1331646, 0.2749305, -0.2896026, 0, 1, 0.6941177, 1,
-0.1297763, -1.351081, -2.604671, 0, 1, 0.7019608, 1,
-0.1297713, -0.5927795, -1.758425, 0, 1, 0.7058824, 1,
-0.1269668, -0.57081, -2.670999, 0, 1, 0.7137255, 1,
-0.1252726, 0.396985, 0.3340819, 0, 1, 0.7176471, 1,
-0.1210735, -0.899128, -2.586698, 0, 1, 0.7254902, 1,
-0.1155711, 0.6049184, -0.3619174, 0, 1, 0.7294118, 1,
-0.1153868, -0.5798103, -4.362591, 0, 1, 0.7372549, 1,
-0.113356, 0.2202352, -0.914704, 0, 1, 0.7411765, 1,
-0.09900755, 0.624895, 0.7598399, 0, 1, 0.7490196, 1,
-0.09622252, -0.6660455, -3.483275, 0, 1, 0.7529412, 1,
-0.09466153, -0.4664855, -0.6898258, 0, 1, 0.7607843, 1,
-0.09416381, -1.043721, -1.835277, 0, 1, 0.7647059, 1,
-0.09259288, -0.505087, -2.726736, 0, 1, 0.772549, 1,
-0.09210334, 0.94233, 0.5002446, 0, 1, 0.7764706, 1,
-0.09198945, -0.6747084, -3.923787, 0, 1, 0.7843137, 1,
-0.08843912, -0.8417268, -4.531785, 0, 1, 0.7882353, 1,
-0.08689547, 0.3605356, -1.845229, 0, 1, 0.7960784, 1,
-0.0867856, -0.7139066, -3.398623, 0, 1, 0.8039216, 1,
-0.08631361, 0.5259244, -0.05988548, 0, 1, 0.8078431, 1,
-0.0855989, -0.4478605, -2.54496, 0, 1, 0.8156863, 1,
-0.08459905, -1.307506, -3.480428, 0, 1, 0.8196079, 1,
-0.08411856, -0.9325022, -2.665246, 0, 1, 0.827451, 1,
-0.08293574, -1.659113, -2.391619, 0, 1, 0.8313726, 1,
-0.08037982, 0.2616336, -1.520065, 0, 1, 0.8392157, 1,
-0.07905807, 0.2914105, 0.4133032, 0, 1, 0.8431373, 1,
-0.07892106, -0.5904148, -2.950336, 0, 1, 0.8509804, 1,
-0.07537868, 0.06591821, 0.5710655, 0, 1, 0.854902, 1,
-0.07452492, -0.8618694, -2.440148, 0, 1, 0.8627451, 1,
-0.07323839, 0.1600823, -1.685546, 0, 1, 0.8666667, 1,
-0.06816904, 0.5139077, -0.2538596, 0, 1, 0.8745098, 1,
-0.06745815, 0.9632441, -0.143947, 0, 1, 0.8784314, 1,
-0.06681145, -1.479313, -3.313568, 0, 1, 0.8862745, 1,
-0.06679866, 0.1052009, -0.2501198, 0, 1, 0.8901961, 1,
-0.06378291, 0.8771973, 0.7282643, 0, 1, 0.8980392, 1,
-0.0636828, -0.4451316, -3.757828, 0, 1, 0.9058824, 1,
-0.06168612, 0.1225791, 0.08443351, 0, 1, 0.9098039, 1,
-0.06112702, -0.3805375, -2.794237, 0, 1, 0.9176471, 1,
-0.05296247, -0.8788747, -3.970276, 0, 1, 0.9215686, 1,
-0.05205805, -0.613448, -2.697559, 0, 1, 0.9294118, 1,
-0.05062927, -0.02712257, -2.054373, 0, 1, 0.9333333, 1,
-0.04939345, -0.4147104, -3.515659, 0, 1, 0.9411765, 1,
-0.04916014, 0.7060181, 0.8367077, 0, 1, 0.945098, 1,
-0.04812976, 1.70091, -1.107393, 0, 1, 0.9529412, 1,
-0.04343694, 1.199205, -0.8101264, 0, 1, 0.9568627, 1,
-0.0390449, -2.017846, -2.252978, 0, 1, 0.9647059, 1,
-0.03650501, 1.124284, -0.1274592, 0, 1, 0.9686275, 1,
-0.03574585, -0.2909671, -4.723941, 0, 1, 0.9764706, 1,
-0.03239491, -0.01315464, -0.2132603, 0, 1, 0.9803922, 1,
-0.03053799, 1.203081, 1.378684, 0, 1, 0.9882353, 1,
-0.02890597, 0.305534, -0.6263054, 0, 1, 0.9921569, 1,
-0.02247785, -0.791499, -1.251792, 0, 1, 1, 1,
-0.02213384, -0.8188446, -3.135549, 0, 0.9921569, 1, 1,
-0.02138516, -0.1561586, -3.245523, 0, 0.9882353, 1, 1,
-0.01367285, -0.8424068, -4.231741, 0, 0.9803922, 1, 1,
-0.0133336, 2.436471, 1.233808, 0, 0.9764706, 1, 1,
-0.009157705, 0.01511679, -0.314445, 0, 0.9686275, 1, 1,
-0.003480656, -0.9214143, -2.856382, 0, 0.9647059, 1, 1,
-0.001318103, 1.355167, 0.6258776, 0, 0.9568627, 1, 1,
0.001365064, -0.9387299, 1.91724, 0, 0.9529412, 1, 1,
0.002733527, 0.2974465, 0.691839, 0, 0.945098, 1, 1,
0.004791438, 0.4410793, 0.2453575, 0, 0.9411765, 1, 1,
0.00659362, -0.5589494, 1.095276, 0, 0.9333333, 1, 1,
0.006919803, 1.403998, -0.9183535, 0, 0.9294118, 1, 1,
0.007394472, -0.5345683, 3.811739, 0, 0.9215686, 1, 1,
0.009629192, -1.444695, 3.180885, 0, 0.9176471, 1, 1,
0.01211252, 0.6300107, -0.4070994, 0, 0.9098039, 1, 1,
0.01450701, -0.3588768, 3.151208, 0, 0.9058824, 1, 1,
0.0146889, -1.350344, 2.543971, 0, 0.8980392, 1, 1,
0.01658563, -1.790554, 2.65283, 0, 0.8901961, 1, 1,
0.01802553, 1.013733, 0.3331466, 0, 0.8862745, 1, 1,
0.01804394, 0.3913463, 0.5198733, 0, 0.8784314, 1, 1,
0.01828321, -0.3432918, 4.113166, 0, 0.8745098, 1, 1,
0.01975622, -0.8028817, 3.592239, 0, 0.8666667, 1, 1,
0.02685455, 1.461963, -0.5924544, 0, 0.8627451, 1, 1,
0.03194544, -1.869263, 2.860973, 0, 0.854902, 1, 1,
0.03235957, 0.1716432, -0.3227089, 0, 0.8509804, 1, 1,
0.03420734, -0.8885311, 2.366386, 0, 0.8431373, 1, 1,
0.03899191, -0.1714175, 2.279103, 0, 0.8392157, 1, 1,
0.04834262, 0.1477354, -0.05525109, 0, 0.8313726, 1, 1,
0.04878262, -0.196655, 2.081325, 0, 0.827451, 1, 1,
0.05040767, 0.7330204, -0.1987054, 0, 0.8196079, 1, 1,
0.05047648, 1.018077, -0.2748705, 0, 0.8156863, 1, 1,
0.05096308, 1.024281, -0.1463891, 0, 0.8078431, 1, 1,
0.05299158, 0.4332309, 0.4368318, 0, 0.8039216, 1, 1,
0.05346704, -0.1423303, 2.876045, 0, 0.7960784, 1, 1,
0.05612892, -0.1939919, 2.296752, 0, 0.7882353, 1, 1,
0.05710991, -0.32409, 0.3533961, 0, 0.7843137, 1, 1,
0.05960478, -0.3929794, 2.720419, 0, 0.7764706, 1, 1,
0.05973514, -0.4264416, 1.897368, 0, 0.772549, 1, 1,
0.05998831, -1.074621, 2.699409, 0, 0.7647059, 1, 1,
0.06022171, 2.445768, -1.029345, 0, 0.7607843, 1, 1,
0.06529565, 0.4221601, 0.5504018, 0, 0.7529412, 1, 1,
0.06558939, 0.04505484, 0.6497521, 0, 0.7490196, 1, 1,
0.07108569, 2.403135, 1.209394, 0, 0.7411765, 1, 1,
0.0715841, 0.5996873, 1.096168, 0, 0.7372549, 1, 1,
0.07238271, 0.9694787, -0.008854242, 0, 0.7294118, 1, 1,
0.07327216, -1.498653, 4.269919, 0, 0.7254902, 1, 1,
0.07580296, -0.5626581, 2.973524, 0, 0.7176471, 1, 1,
0.076699, 0.6507106, 0.005726672, 0, 0.7137255, 1, 1,
0.07968189, 1.198519, 0.1761754, 0, 0.7058824, 1, 1,
0.08458367, -0.3183845, 3.568484, 0, 0.6980392, 1, 1,
0.08557425, 0.222829, -0.3487099, 0, 0.6941177, 1, 1,
0.0934605, -0.3497247, 2.24427, 0, 0.6862745, 1, 1,
0.09500988, 1.358206, 0.08019578, 0, 0.682353, 1, 1,
0.09860978, 1.159694, -0.6345466, 0, 0.6745098, 1, 1,
0.1002769, 0.8081807, 0.6375285, 0, 0.6705883, 1, 1,
0.1039103, -0.002831635, 0.1482697, 0, 0.6627451, 1, 1,
0.1054501, -0.2475011, 2.739922, 0, 0.6588235, 1, 1,
0.1088157, -1.134975, 3.993067, 0, 0.6509804, 1, 1,
0.1093929, 0.1354739, 1.091416, 0, 0.6470588, 1, 1,
0.1192847, -0.7927718, 3.491063, 0, 0.6392157, 1, 1,
0.1204906, 0.3084019, 0.5254875, 0, 0.6352941, 1, 1,
0.1232768, -0.4897718, 1.830948, 0, 0.627451, 1, 1,
0.1247323, -0.3361774, 4.598171, 0, 0.6235294, 1, 1,
0.1249307, -0.2198003, 3.984686, 0, 0.6156863, 1, 1,
0.1255926, 0.3876303, -0.008299972, 0, 0.6117647, 1, 1,
0.1331404, -0.04417505, 1.89256, 0, 0.6039216, 1, 1,
0.1370252, 0.7024165, 2.417026, 0, 0.5960785, 1, 1,
0.1423844, 1.002047, -0.9395787, 0, 0.5921569, 1, 1,
0.1430284, 0.6545545, -0.1655191, 0, 0.5843138, 1, 1,
0.1448681, 0.1918302, 1.355289, 0, 0.5803922, 1, 1,
0.1465972, 0.8126383, 0.3723307, 0, 0.572549, 1, 1,
0.1483513, -0.2990718, 2.363555, 0, 0.5686275, 1, 1,
0.1486475, -0.5921317, 4.066699, 0, 0.5607843, 1, 1,
0.1560348, -0.5194293, 1.17352, 0, 0.5568628, 1, 1,
0.1563774, 1.365277, 0.5281326, 0, 0.5490196, 1, 1,
0.1583483, 0.7239586, -0.651193, 0, 0.5450981, 1, 1,
0.1590554, 1.175604, 0.1992628, 0, 0.5372549, 1, 1,
0.1594008, 0.3059253, 1.063105, 0, 0.5333334, 1, 1,
0.161173, 1.890405, -0.2785094, 0, 0.5254902, 1, 1,
0.1621871, 0.442569, 0.3445144, 0, 0.5215687, 1, 1,
0.1677007, -0.4688017, 3.991611, 0, 0.5137255, 1, 1,
0.1679904, -0.7403983, 6.417782, 0, 0.509804, 1, 1,
0.1687006, -0.6782125, 3.392715, 0, 0.5019608, 1, 1,
0.1722646, -1.175586, 2.118723, 0, 0.4941176, 1, 1,
0.1748843, -0.08473722, 1.385631, 0, 0.4901961, 1, 1,
0.1783105, -1.268747, 4.168653, 0, 0.4823529, 1, 1,
0.1796743, 1.975233, -0.9699163, 0, 0.4784314, 1, 1,
0.1827185, 0.7198552, 0.04859871, 0, 0.4705882, 1, 1,
0.1844773, -0.6958243, 1.624154, 0, 0.4666667, 1, 1,
0.1848782, -0.2369729, 2.755093, 0, 0.4588235, 1, 1,
0.1960856, 0.2365785, 0.949304, 0, 0.454902, 1, 1,
0.2001703, -0.04579481, 3.017191, 0, 0.4470588, 1, 1,
0.2008012, 0.5131887, 0.05152408, 0, 0.4431373, 1, 1,
0.2027815, 2.045696, 0.7444984, 0, 0.4352941, 1, 1,
0.2039625, -0.1283827, 1.380641, 0, 0.4313726, 1, 1,
0.2080406, 1.933934, 0.720685, 0, 0.4235294, 1, 1,
0.2082477, 0.9516332, -0.5658534, 0, 0.4196078, 1, 1,
0.2093132, 0.9079567, 0.337327, 0, 0.4117647, 1, 1,
0.211869, 1.636593, -0.456203, 0, 0.4078431, 1, 1,
0.222353, 1.103524, -0.3804941, 0, 0.4, 1, 1,
0.2234359, 1.312862, -0.7611241, 0, 0.3921569, 1, 1,
0.2242798, 0.1905732, 1.425476, 0, 0.3882353, 1, 1,
0.2264539, -0.9858917, 2.190728, 0, 0.3803922, 1, 1,
0.2278707, -0.1296858, 2.365039, 0, 0.3764706, 1, 1,
0.2321507, 0.33451, -1.051964, 0, 0.3686275, 1, 1,
0.2321876, -0.67444, 2.489994, 0, 0.3647059, 1, 1,
0.2401677, 0.5358016, -0.4096262, 0, 0.3568628, 1, 1,
0.2405873, -0.554044, 3.712974, 0, 0.3529412, 1, 1,
0.2465886, 1.804934, -1.306881, 0, 0.345098, 1, 1,
0.2467278, -0.1306755, 2.577744, 0, 0.3411765, 1, 1,
0.2494052, -0.6594667, 1.297109, 0, 0.3333333, 1, 1,
0.2509043, -0.7493599, 1.65785, 0, 0.3294118, 1, 1,
0.2514178, -0.1744427, 0.5105795, 0, 0.3215686, 1, 1,
0.2523049, 1.225568, -0.2703299, 0, 0.3176471, 1, 1,
0.2543351, -0.03632288, 4.096272, 0, 0.3098039, 1, 1,
0.256442, -0.7658633, 3.265013, 0, 0.3058824, 1, 1,
0.2588286, -0.6565729, 2.039456, 0, 0.2980392, 1, 1,
0.2614605, -0.6371689, 2.213071, 0, 0.2901961, 1, 1,
0.2672309, 0.06048481, 1.56688, 0, 0.2862745, 1, 1,
0.2703956, 0.1886977, 1.565305, 0, 0.2784314, 1, 1,
0.2719663, -0.2289019, 1.4619, 0, 0.2745098, 1, 1,
0.2722397, 0.8470749, 1.509976, 0, 0.2666667, 1, 1,
0.2814715, 1.077432, 0.1665658, 0, 0.2627451, 1, 1,
0.2819245, 0.4182806, 0.03085342, 0, 0.254902, 1, 1,
0.2822537, 0.694021, 2.364249, 0, 0.2509804, 1, 1,
0.2827785, -1.524895, 2.807987, 0, 0.2431373, 1, 1,
0.2865937, 1.314981, -0.2878079, 0, 0.2392157, 1, 1,
0.2871251, -1.010422, 1.39182, 0, 0.2313726, 1, 1,
0.2941494, -1.694687, 4.102674, 0, 0.227451, 1, 1,
0.2974417, 0.1593172, 4.866631, 0, 0.2196078, 1, 1,
0.2976063, -1.632243, 4.012566, 0, 0.2156863, 1, 1,
0.2978645, -0.2719184, 3.029989, 0, 0.2078431, 1, 1,
0.2996162, -0.6367534, 3.055983, 0, 0.2039216, 1, 1,
0.3055381, 1.038997, 2.173747, 0, 0.1960784, 1, 1,
0.3063644, 1.879865, 0.1223563, 0, 0.1882353, 1, 1,
0.3086298, 0.513182, 0.1571657, 0, 0.1843137, 1, 1,
0.3091012, -0.07836296, 3.480077, 0, 0.1764706, 1, 1,
0.3098808, 0.2720451, 0.6317726, 0, 0.172549, 1, 1,
0.3105716, 0.6424302, -2.162514, 0, 0.1647059, 1, 1,
0.3112813, -0.6128122, 2.196762, 0, 0.1607843, 1, 1,
0.3144568, 1.714375, -2.167493, 0, 0.1529412, 1, 1,
0.3262351, 0.3675314, 0.6416071, 0, 0.1490196, 1, 1,
0.3266591, 0.4448822, -0.5828333, 0, 0.1411765, 1, 1,
0.3284932, 0.8221443, 0.22659, 0, 0.1372549, 1, 1,
0.3297877, 0.7451631, 0.1596896, 0, 0.1294118, 1, 1,
0.3328921, -0.5584854, 0.6783535, 0, 0.1254902, 1, 1,
0.3352955, 1.205038, 0.9045218, 0, 0.1176471, 1, 1,
0.338787, -0.5078767, 3.820206, 0, 0.1137255, 1, 1,
0.3431771, -0.7397106, 3.179958, 0, 0.1058824, 1, 1,
0.3446718, -2.316844, 2.720656, 0, 0.09803922, 1, 1,
0.3461436, 0.4389004, 1.282259, 0, 0.09411765, 1, 1,
0.3473487, -1.045177, 6.735979, 0, 0.08627451, 1, 1,
0.3486307, 1.271411, 1.139893, 0, 0.08235294, 1, 1,
0.3533717, -1.219137, 3.497128, 0, 0.07450981, 1, 1,
0.355742, -0.1438609, 1.227948, 0, 0.07058824, 1, 1,
0.3574952, -0.5965291, 1.222832, 0, 0.0627451, 1, 1,
0.3597827, 0.4761259, -0.3022793, 0, 0.05882353, 1, 1,
0.3603432, -2.000808, 3.316573, 0, 0.05098039, 1, 1,
0.3620835, -0.6251032, 3.333614, 0, 0.04705882, 1, 1,
0.366983, -0.5967507, 2.920829, 0, 0.03921569, 1, 1,
0.3710549, -0.5798408, 1.184356, 0, 0.03529412, 1, 1,
0.3765887, 1.130242, 1.374595, 0, 0.02745098, 1, 1,
0.3853054, -0.09720512, 2.589626, 0, 0.02352941, 1, 1,
0.3857717, 0.1724082, 1.359769, 0, 0.01568628, 1, 1,
0.3980663, -0.07730386, 1.232166, 0, 0.01176471, 1, 1,
0.3998308, 0.9389638, -0.4324079, 0, 0.003921569, 1, 1,
0.4048344, 0.8926635, -0.3511494, 0.003921569, 0, 1, 1,
0.405723, 0.08734482, 1.046931, 0.007843138, 0, 1, 1,
0.4057349, -0.07848947, 1.473998, 0.01568628, 0, 1, 1,
0.4057943, -1.425864, 2.976029, 0.01960784, 0, 1, 1,
0.4064239, 0.4696023, 0.3872015, 0.02745098, 0, 1, 1,
0.4076167, -0.5334399, 1.487865, 0.03137255, 0, 1, 1,
0.4080807, 0.2918657, 1.671251, 0.03921569, 0, 1, 1,
0.4097066, -0.02923723, 2.197492, 0.04313726, 0, 1, 1,
0.4102201, -0.6924874, 2.94328, 0.05098039, 0, 1, 1,
0.4157605, 0.5315997, -0.4645094, 0.05490196, 0, 1, 1,
0.4184453, 0.2283111, 2.008124, 0.0627451, 0, 1, 1,
0.4196377, 1.357528, 0.6797485, 0.06666667, 0, 1, 1,
0.4265849, 0.5756842, 0.609975, 0.07450981, 0, 1, 1,
0.4286491, -0.3428895, 3.306656, 0.07843138, 0, 1, 1,
0.4321344, -0.5038162, 3.409862, 0.08627451, 0, 1, 1,
0.4331253, 0.1862794, 1.638271, 0.09019608, 0, 1, 1,
0.4334939, 0.04058707, -0.3295262, 0.09803922, 0, 1, 1,
0.4349065, -0.1645775, 2.264432, 0.1058824, 0, 1, 1,
0.4362133, 1.707679, 0.08534946, 0.1098039, 0, 1, 1,
0.436853, -0.7034249, 1.747118, 0.1176471, 0, 1, 1,
0.4392161, -0.6765602, 2.271672, 0.1215686, 0, 1, 1,
0.441828, -2.22551, 3.346423, 0.1294118, 0, 1, 1,
0.4471251, -0.4559447, 3.366014, 0.1333333, 0, 1, 1,
0.4493108, 1.258214, 0.2006112, 0.1411765, 0, 1, 1,
0.4527057, 0.1572197, 0.3016385, 0.145098, 0, 1, 1,
0.4527577, -0.3773631, 3.592508, 0.1529412, 0, 1, 1,
0.4574032, 1.43411, -0.06917115, 0.1568628, 0, 1, 1,
0.4584166, -0.4042697, 3.257597, 0.1647059, 0, 1, 1,
0.469131, 0.5216931, 0.1510133, 0.1686275, 0, 1, 1,
0.4720396, -0.7658384, 2.80444, 0.1764706, 0, 1, 1,
0.4756849, -0.2823309, 3.05592, 0.1803922, 0, 1, 1,
0.4758936, -0.204442, 3.243613, 0.1882353, 0, 1, 1,
0.4768352, -1.112445, 2.669116, 0.1921569, 0, 1, 1,
0.4780175, -0.7214978, 1.785112, 0.2, 0, 1, 1,
0.4790527, -0.2714217, 0.8514233, 0.2078431, 0, 1, 1,
0.4835996, 0.7246523, -0.7711338, 0.2117647, 0, 1, 1,
0.485002, 0.7768278, 0.825695, 0.2196078, 0, 1, 1,
0.4895572, -0.5372258, 1.688497, 0.2235294, 0, 1, 1,
0.4906563, 0.865082, 0.2842678, 0.2313726, 0, 1, 1,
0.4909831, 0.6055612, -0.8415278, 0.2352941, 0, 1, 1,
0.4915426, 1.508139, -0.6608738, 0.2431373, 0, 1, 1,
0.4935083, 1.094849, 0.4757006, 0.2470588, 0, 1, 1,
0.4977008, -0.392568, 1.992759, 0.254902, 0, 1, 1,
0.5030708, 0.3425556, -0.3562078, 0.2588235, 0, 1, 1,
0.5032479, 1.618546, 0.8240059, 0.2666667, 0, 1, 1,
0.5073275, -0.7052371, 2.584166, 0.2705882, 0, 1, 1,
0.5127804, -0.005794222, 0.4945647, 0.2784314, 0, 1, 1,
0.5135781, 0.8873358, 1.10214, 0.282353, 0, 1, 1,
0.5139501, -0.6481989, 3.209624, 0.2901961, 0, 1, 1,
0.5161682, 1.518096, 2.312206, 0.2941177, 0, 1, 1,
0.5169885, 0.8686585, 1.674261, 0.3019608, 0, 1, 1,
0.5195637, -0.7577605, 2.821736, 0.3098039, 0, 1, 1,
0.5197774, 0.7016726, 0.2843661, 0.3137255, 0, 1, 1,
0.5221493, -0.8648449, 3.250906, 0.3215686, 0, 1, 1,
0.5228486, -0.3859704, 3.118672, 0.3254902, 0, 1, 1,
0.5273027, -0.2003482, 2.613039, 0.3333333, 0, 1, 1,
0.5288777, -0.8596997, 3.458657, 0.3372549, 0, 1, 1,
0.5334788, 0.5683306, 0.09729826, 0.345098, 0, 1, 1,
0.5414214, 0.9320785, 0.3498613, 0.3490196, 0, 1, 1,
0.5452256, -0.06489105, 2.285697, 0.3568628, 0, 1, 1,
0.5482216, 1.51287, -0.7384369, 0.3607843, 0, 1, 1,
0.55053, -0.4645401, 0.9957523, 0.3686275, 0, 1, 1,
0.5535022, 0.01940062, 0.3597424, 0.372549, 0, 1, 1,
0.5552556, -0.4973899, 3.632358, 0.3803922, 0, 1, 1,
0.5556685, 0.4060268, 0.7891697, 0.3843137, 0, 1, 1,
0.5572119, -0.6625341, 3.59642, 0.3921569, 0, 1, 1,
0.5584117, -0.08115159, 0.360148, 0.3960784, 0, 1, 1,
0.5676031, -2.009496, 3.811308, 0.4039216, 0, 1, 1,
0.5725921, 1.370652, -0.5095085, 0.4117647, 0, 1, 1,
0.5731554, -0.1534666, 2.26089, 0.4156863, 0, 1, 1,
0.5766096, 0.734634, 2.623582, 0.4235294, 0, 1, 1,
0.5859655, 0.3415554, 2.839938, 0.427451, 0, 1, 1,
0.5882096, -1.120556, 3.07224, 0.4352941, 0, 1, 1,
0.5903288, -0.6046401, 3.000149, 0.4392157, 0, 1, 1,
0.5923573, -0.5822132, 1.922177, 0.4470588, 0, 1, 1,
0.5956641, 0.1644017, -0.03894469, 0.4509804, 0, 1, 1,
0.5994292, -0.08833364, 1.871027, 0.4588235, 0, 1, 1,
0.6011883, 0.1917703, 1.006836, 0.4627451, 0, 1, 1,
0.6023278, -1.770282, 1.625378, 0.4705882, 0, 1, 1,
0.6040856, 1.183209, 2.101787, 0.4745098, 0, 1, 1,
0.6051759, 0.8230414, -0.1294933, 0.4823529, 0, 1, 1,
0.6081088, 0.2199983, 0.664637, 0.4862745, 0, 1, 1,
0.6159438, -1.435483, 3.587269, 0.4941176, 0, 1, 1,
0.6196749, 0.2070537, -0.5464407, 0.5019608, 0, 1, 1,
0.6200061, 0.3397898, 2.00846, 0.5058824, 0, 1, 1,
0.6213664, -0.1270341, 2.05585, 0.5137255, 0, 1, 1,
0.6230842, 1.386176, 0.7248447, 0.5176471, 0, 1, 1,
0.6256822, 0.7945141, -0.04198576, 0.5254902, 0, 1, 1,
0.626022, -0.1976547, 2.851074, 0.5294118, 0, 1, 1,
0.6260611, -0.4912128, 3.728667, 0.5372549, 0, 1, 1,
0.6339447, 0.4448783, -0.108758, 0.5411765, 0, 1, 1,
0.6365231, 2.638, 0.9678584, 0.5490196, 0, 1, 1,
0.6385218, -1.074964, 2.097448, 0.5529412, 0, 1, 1,
0.6385273, 2.889467, 0.9071983, 0.5607843, 0, 1, 1,
0.6435912, -1.483743, 3.365014, 0.5647059, 0, 1, 1,
0.65093, 1.438309, 2.254014, 0.572549, 0, 1, 1,
0.6518893, -0.2957568, 3.206623, 0.5764706, 0, 1, 1,
0.6523581, -0.271882, 1.379898, 0.5843138, 0, 1, 1,
0.6573895, -1.476036, 3.009438, 0.5882353, 0, 1, 1,
0.6592447, -0.7606385, 1.322086, 0.5960785, 0, 1, 1,
0.6729631, -1.164945, 2.973762, 0.6039216, 0, 1, 1,
0.6810003, -1.520647, 1.540225, 0.6078432, 0, 1, 1,
0.681501, 1.27791, 0.9288478, 0.6156863, 0, 1, 1,
0.6845416, 1.500435, 0.4967365, 0.6196079, 0, 1, 1,
0.6886513, 0.7474498, 1.075966, 0.627451, 0, 1, 1,
0.6978947, 1.342583, 1.844434, 0.6313726, 0, 1, 1,
0.7137514, 1.362854, 1.886486, 0.6392157, 0, 1, 1,
0.714663, -0.2894247, 1.523496, 0.6431373, 0, 1, 1,
0.7163191, -0.320111, 1.287128, 0.6509804, 0, 1, 1,
0.7235899, -1.13464, 1.753648, 0.654902, 0, 1, 1,
0.7239599, -1.102858, 2.72469, 0.6627451, 0, 1, 1,
0.7275552, 0.64168, -1.008923, 0.6666667, 0, 1, 1,
0.7297201, 0.6169322, 1.163477, 0.6745098, 0, 1, 1,
0.7391832, 0.7604005, -0.3274531, 0.6784314, 0, 1, 1,
0.7502837, 0.2739887, 1.75759, 0.6862745, 0, 1, 1,
0.752809, -1.113982, 2.897425, 0.6901961, 0, 1, 1,
0.7539616, -1.782023, 2.593776, 0.6980392, 0, 1, 1,
0.7545534, 0.3123101, 0.5690002, 0.7058824, 0, 1, 1,
0.7586412, 0.5220476, -0.5632572, 0.7098039, 0, 1, 1,
0.7603708, -2.705272, 2.977554, 0.7176471, 0, 1, 1,
0.7616459, 0.8345201, 0.9119637, 0.7215686, 0, 1, 1,
0.7623808, -0.4532505, 3.852729, 0.7294118, 0, 1, 1,
0.7692151, -0.4494469, 0.9771235, 0.7333333, 0, 1, 1,
0.7695516, 0.1258741, 2.419617, 0.7411765, 0, 1, 1,
0.7730974, 0.9219296, 1.854794, 0.7450981, 0, 1, 1,
0.7737072, 0.8847294, 0.7092202, 0.7529412, 0, 1, 1,
0.7745364, 0.1565716, 0.2801374, 0.7568628, 0, 1, 1,
0.7762289, -0.3914718, 1.972394, 0.7647059, 0, 1, 1,
0.7787135, -0.4665626, 2.991699, 0.7686275, 0, 1, 1,
0.7797959, 0.8067104, 0.9462961, 0.7764706, 0, 1, 1,
0.7803202, -0.6635213, 3.067138, 0.7803922, 0, 1, 1,
0.784645, -0.04597021, 0.9497666, 0.7882353, 0, 1, 1,
0.7877226, -0.1211102, 2.01808, 0.7921569, 0, 1, 1,
0.8115002, -0.5871117, 1.584741, 0.8, 0, 1, 1,
0.8151711, 0.4528171, 0.416625, 0.8078431, 0, 1, 1,
0.8193538, -0.1788285, 0.5098922, 0.8117647, 0, 1, 1,
0.8195081, -0.8728654, 2.283665, 0.8196079, 0, 1, 1,
0.8231752, 0.7833229, 0.1062005, 0.8235294, 0, 1, 1,
0.8318205, -1.217788, 2.499666, 0.8313726, 0, 1, 1,
0.8398532, -0.2125232, 2.393535, 0.8352941, 0, 1, 1,
0.8401791, 1.275856, 0.6102884, 0.8431373, 0, 1, 1,
0.8420403, 0.7925357, 1.408242, 0.8470588, 0, 1, 1,
0.8531199, -0.1408556, 1.539608, 0.854902, 0, 1, 1,
0.8545407, -0.2309073, 2.514504, 0.8588235, 0, 1, 1,
0.8550363, 1.104811, 1.109284, 0.8666667, 0, 1, 1,
0.8587022, -0.08146473, 0.61608, 0.8705882, 0, 1, 1,
0.8606561, 1.110992, -1.379308, 0.8784314, 0, 1, 1,
0.8643206, -0.8959083, 3.58138, 0.8823529, 0, 1, 1,
0.8655016, -2.033587, 3.084897, 0.8901961, 0, 1, 1,
0.8663597, 0.5184433, 1.688604, 0.8941177, 0, 1, 1,
0.8678648, 0.7707099, 1.049828, 0.9019608, 0, 1, 1,
0.8712541, 0.1198041, 1.342077, 0.9098039, 0, 1, 1,
0.8797204, 0.3874189, 1.671036, 0.9137255, 0, 1, 1,
0.8822621, 0.2094064, 1.56718, 0.9215686, 0, 1, 1,
0.8833145, 0.259753, 0.06384969, 0.9254902, 0, 1, 1,
0.8839369, 0.3339758, 1.716359, 0.9333333, 0, 1, 1,
0.888083, -0.7504112, 2.200329, 0.9372549, 0, 1, 1,
0.8893174, -0.3316054, 0.1096879, 0.945098, 0, 1, 1,
0.8922112, 0.6432081, 0.6588016, 0.9490196, 0, 1, 1,
0.8956109, 0.8069345, -0.1477355, 0.9568627, 0, 1, 1,
0.8963403, 0.08337429, 1.175342, 0.9607843, 0, 1, 1,
0.905609, -0.8807774, 1.402844, 0.9686275, 0, 1, 1,
0.9196925, 1.769138, 1.024619, 0.972549, 0, 1, 1,
0.923291, -0.3633536, 0.5715548, 0.9803922, 0, 1, 1,
0.9237773, -0.3895795, 3.624665, 0.9843137, 0, 1, 1,
0.9238269, 0.6456065, 1.135041, 0.9921569, 0, 1, 1,
0.9243434, 0.1964134, -0.2286371, 0.9960784, 0, 1, 1,
0.9306161, 0.9341626, 2.833217, 1, 0, 0.9960784, 1,
0.9319783, -1.551501, 1.37984, 1, 0, 0.9882353, 1,
0.9395774, 0.273228, 1.147597, 1, 0, 0.9843137, 1,
0.9406561, 1.503415, -0.3285034, 1, 0, 0.9764706, 1,
0.9448386, -0.0379047, 3.210459, 1, 0, 0.972549, 1,
0.9547077, 0.04319991, 0.4085814, 1, 0, 0.9647059, 1,
0.9619578, 0.4045207, 2.279904, 1, 0, 0.9607843, 1,
0.963025, 0.000342973, 2.20927, 1, 0, 0.9529412, 1,
0.9662327, -1.400065, 2.662208, 1, 0, 0.9490196, 1,
0.9682192, 0.1637483, 3.58413, 1, 0, 0.9411765, 1,
0.9685872, 0.2411255, 1.441867, 1, 0, 0.9372549, 1,
0.9744653, -0.5973258, 2.89264, 1, 0, 0.9294118, 1,
0.9865729, 0.4945158, -0.4682498, 1, 0, 0.9254902, 1,
0.9879341, -2.041641, 3.543325, 1, 0, 0.9176471, 1,
1.004015, 1.0484, 2.591781, 1, 0, 0.9137255, 1,
1.005724, -0.7422664, 1.889223, 1, 0, 0.9058824, 1,
1.006698, -0.03072491, 1.050549, 1, 0, 0.9019608, 1,
1.012598, -0.4647175, 1.89623, 1, 0, 0.8941177, 1,
1.01291, 1.397332, 1.746643, 1, 0, 0.8862745, 1,
1.017767, 1.708255, 1.377082, 1, 0, 0.8823529, 1,
1.021566, 1.055619, -0.7778481, 1, 0, 0.8745098, 1,
1.044284, -0.8938882, 1.566318, 1, 0, 0.8705882, 1,
1.048741, -0.5633543, 1.586401, 1, 0, 0.8627451, 1,
1.05425, 0.3678468, 2.156092, 1, 0, 0.8588235, 1,
1.056832, -0.9383821, 3.61928, 1, 0, 0.8509804, 1,
1.061044, -1.938126, 3.94408, 1, 0, 0.8470588, 1,
1.068374, 1.177729, 0.003393197, 1, 0, 0.8392157, 1,
1.068503, -0.5895436, 2.025186, 1, 0, 0.8352941, 1,
1.069123, 2.183135, 0.2831162, 1, 0, 0.827451, 1,
1.071059, -0.2805894, 0.9563863, 1, 0, 0.8235294, 1,
1.076127, 0.01836482, 2.295353, 1, 0, 0.8156863, 1,
1.085356, 0.9084207, -0.2554042, 1, 0, 0.8117647, 1,
1.086766, -0.3502957, 1.487631, 1, 0, 0.8039216, 1,
1.088493, 1.31361, -0.4297008, 1, 0, 0.7960784, 1,
1.09116, 0.2517298, 2.19195, 1, 0, 0.7921569, 1,
1.093424, -1.394724, 2.066906, 1, 0, 0.7843137, 1,
1.098999, 1.394869, 0.09730946, 1, 0, 0.7803922, 1,
1.0997, -0.8338394, 2.856956, 1, 0, 0.772549, 1,
1.105395, -0.1865075, 1.953574, 1, 0, 0.7686275, 1,
1.106897, 0.8477267, 0.2315018, 1, 0, 0.7607843, 1,
1.107709, -0.7998282, 2.060938, 1, 0, 0.7568628, 1,
1.110258, -0.8614561, 2.243757, 1, 0, 0.7490196, 1,
1.111204, 0.2866327, 0.9730905, 1, 0, 0.7450981, 1,
1.113708, -1.302275, 3.233375, 1, 0, 0.7372549, 1,
1.119619, 0.7945766, 0.3040033, 1, 0, 0.7333333, 1,
1.123836, 0.08347115, 2.987521, 1, 0, 0.7254902, 1,
1.129434, -0.4750219, 1.597496, 1, 0, 0.7215686, 1,
1.131087, -0.01096927, 1.568181, 1, 0, 0.7137255, 1,
1.137454, -0.1241667, 2.054242, 1, 0, 0.7098039, 1,
1.149321, 0.9608204, 0.6146835, 1, 0, 0.7019608, 1,
1.152039, 0.160419, 1.319655, 1, 0, 0.6941177, 1,
1.152893, -0.189271, 2.327365, 1, 0, 0.6901961, 1,
1.157753, 0.7166221, 1.042984, 1, 0, 0.682353, 1,
1.168401, -1.470391, 1.801227, 1, 0, 0.6784314, 1,
1.171775, 1.330972, 0.01083694, 1, 0, 0.6705883, 1,
1.174101, 0.3218875, 2.262691, 1, 0, 0.6666667, 1,
1.18696, -1.044511, 4.140141, 1, 0, 0.6588235, 1,
1.189539, 0.06182488, 1.143888, 1, 0, 0.654902, 1,
1.189701, 1.703983, 0.3180155, 1, 0, 0.6470588, 1,
1.192054, -0.7548519, 2.45482, 1, 0, 0.6431373, 1,
1.203293, -0.1650035, 1.733353, 1, 0, 0.6352941, 1,
1.208817, 0.5720422, 0.3428669, 1, 0, 0.6313726, 1,
1.215006, -0.5514188, 1.491317, 1, 0, 0.6235294, 1,
1.226843, -1.182224, 3.249597, 1, 0, 0.6196079, 1,
1.228664, 0.2398187, 2.380635, 1, 0, 0.6117647, 1,
1.23593, 0.4697038, 0.9034258, 1, 0, 0.6078432, 1,
1.239195, -1.791474, 2.352431, 1, 0, 0.6, 1,
1.239868, 0.4495418, 2.194232, 1, 0, 0.5921569, 1,
1.242226, -0.8518354, 4.642389, 1, 0, 0.5882353, 1,
1.243539, 0.6998659, 0.4563521, 1, 0, 0.5803922, 1,
1.24974, -1.162771, 2.040956, 1, 0, 0.5764706, 1,
1.251825, -1.515613, 1.463942, 1, 0, 0.5686275, 1,
1.258819, 0.4015422, 1.780171, 1, 0, 0.5647059, 1,
1.266693, 0.6082764, 0.08521617, 1, 0, 0.5568628, 1,
1.271217, 1.615848, 0.3926835, 1, 0, 0.5529412, 1,
1.279848, -0.4234035, 2.861893, 1, 0, 0.5450981, 1,
1.281364, -0.1311306, 2.828046, 1, 0, 0.5411765, 1,
1.289855, -0.9772236, 3.14056, 1, 0, 0.5333334, 1,
1.298342, 1.38765, 0.8666161, 1, 0, 0.5294118, 1,
1.315501, -1.495664, 0.3294396, 1, 0, 0.5215687, 1,
1.316068, -0.6149718, 1.681341, 1, 0, 0.5176471, 1,
1.320444, -0.7347858, 1.579082, 1, 0, 0.509804, 1,
1.322657, 0.5225548, 0.8228443, 1, 0, 0.5058824, 1,
1.322865, -0.07847696, -0.5770523, 1, 0, 0.4980392, 1,
1.326411, 0.5494654, 2.070333, 1, 0, 0.4901961, 1,
1.330412, -0.5572234, 2.03491, 1, 0, 0.4862745, 1,
1.333262, -0.01298358, 1.763818, 1, 0, 0.4784314, 1,
1.343936, -0.03661226, 1.735738, 1, 0, 0.4745098, 1,
1.345946, -0.8018522, 1.859779, 1, 0, 0.4666667, 1,
1.349699, 0.2251602, 1.893223, 1, 0, 0.4627451, 1,
1.350998, 0.9003043, -0.8029406, 1, 0, 0.454902, 1,
1.360752, 0.7989873, 0.9649165, 1, 0, 0.4509804, 1,
1.363063, 0.4449447, -0.6027164, 1, 0, 0.4431373, 1,
1.363138, 0.1480969, 1.499936, 1, 0, 0.4392157, 1,
1.365837, 0.00365083, 1.348857, 1, 0, 0.4313726, 1,
1.374858, 0.1978324, -0.1765301, 1, 0, 0.427451, 1,
1.376778, 1.279006, 2.420729, 1, 0, 0.4196078, 1,
1.380661, -1.231186, 0.6976129, 1, 0, 0.4156863, 1,
1.40473, -0.09493393, 1.049716, 1, 0, 0.4078431, 1,
1.42105, 0.4351611, 2.385868, 1, 0, 0.4039216, 1,
1.428222, -1.071208, 1.75852, 1, 0, 0.3960784, 1,
1.428775, -0.01132751, 1.443827, 1, 0, 0.3882353, 1,
1.428878, 1.245561, 0.864067, 1, 0, 0.3843137, 1,
1.431248, 0.9601389, 1.418655, 1, 0, 0.3764706, 1,
1.454129, 0.4062514, -0.2977763, 1, 0, 0.372549, 1,
1.460071, 0.8072288, 1.558076, 1, 0, 0.3647059, 1,
1.499074, 1.002004, 1.446157, 1, 0, 0.3607843, 1,
1.509996, 1.557592, -0.6710547, 1, 0, 0.3529412, 1,
1.511795, 0.3590584, 3.251652, 1, 0, 0.3490196, 1,
1.517786, -0.08556855, 1.587129, 1, 0, 0.3411765, 1,
1.540496, 2.856281, 0.7012665, 1, 0, 0.3372549, 1,
1.555982, -0.03907162, 1.152682, 1, 0, 0.3294118, 1,
1.572261, -1.058146, 1.376212, 1, 0, 0.3254902, 1,
1.584157, 1.048404, 1.970978, 1, 0, 0.3176471, 1,
1.596492, 1.004808, 1.044999, 1, 0, 0.3137255, 1,
1.616759, -1.660541, 4.441008, 1, 0, 0.3058824, 1,
1.621741, 1.753053, 1.695526, 1, 0, 0.2980392, 1,
1.623367, 1.76693, 0.7594663, 1, 0, 0.2941177, 1,
1.637718, 0.4044964, 0.2801622, 1, 0, 0.2862745, 1,
1.639605, 0.4059119, 1.672698, 1, 0, 0.282353, 1,
1.652546, -1.258126, 3.114658, 1, 0, 0.2745098, 1,
1.706719, -0.05672044, 2.147316, 1, 0, 0.2705882, 1,
1.715109, 0.3471476, 2.988838, 1, 0, 0.2627451, 1,
1.725361, -0.02901424, 0.296485, 1, 0, 0.2588235, 1,
1.738718, -0.8492202, 2.040134, 1, 0, 0.2509804, 1,
1.742665, -0.2290024, 2.164875, 1, 0, 0.2470588, 1,
1.769836, 1.653442, 1.16423, 1, 0, 0.2392157, 1,
1.78495, -1.018778, 1.777259, 1, 0, 0.2352941, 1,
1.824999, -0.4688011, 1.443589, 1, 0, 0.227451, 1,
1.828413, -1.005283, 0.8170515, 1, 0, 0.2235294, 1,
1.831728, 0.9286237, 1.782926, 1, 0, 0.2156863, 1,
1.833511, 0.4168813, 1.81123, 1, 0, 0.2117647, 1,
1.834217, 0.458752, 2.13709, 1, 0, 0.2039216, 1,
1.837401, 0.2206663, 3.716714, 1, 0, 0.1960784, 1,
1.854951, -0.3777222, 1.684067, 1, 0, 0.1921569, 1,
1.869656, 0.545094, 2.503581, 1, 0, 0.1843137, 1,
1.872705, 0.32305, 0.9666346, 1, 0, 0.1803922, 1,
1.876043, -3.016017, 2.582704, 1, 0, 0.172549, 1,
1.879126, 0.3095404, 2.931496, 1, 0, 0.1686275, 1,
1.880702, 0.4744655, 1.537585, 1, 0, 0.1607843, 1,
1.903275, -0.1007089, 2.303651, 1, 0, 0.1568628, 1,
1.942742, 0.7164343, -0.03887399, 1, 0, 0.1490196, 1,
1.969131, -0.4302261, 3.613401, 1, 0, 0.145098, 1,
2.0087, -0.3115779, 2.191022, 1, 0, 0.1372549, 1,
2.072691, -1.478254, 1.54402, 1, 0, 0.1333333, 1,
2.108458, -0.3896484, 1.378153, 1, 0, 0.1254902, 1,
2.122548, -0.08657303, 1.537443, 1, 0, 0.1215686, 1,
2.140433, 0.3149216, 0.5054936, 1, 0, 0.1137255, 1,
2.152131, 1.513289, -0.1698217, 1, 0, 0.1098039, 1,
2.161986, -0.06997799, 2.332659, 1, 0, 0.1019608, 1,
2.205626, -0.5070909, 0.9535639, 1, 0, 0.09411765, 1,
2.224725, -0.5837831, 2.196389, 1, 0, 0.09019608, 1,
2.249273, -0.2639099, 0.3271675, 1, 0, 0.08235294, 1,
2.276023, 0.5146419, 1.115062, 1, 0, 0.07843138, 1,
2.297298, 2.602307, 0.7458794, 1, 0, 0.07058824, 1,
2.366207, 0.4630802, 1.159165, 1, 0, 0.06666667, 1,
2.37652, -0.6203699, 0.5938437, 1, 0, 0.05882353, 1,
2.379475, -0.2791092, 4.4295, 1, 0, 0.05490196, 1,
2.403204, 0.9101455, 1.14064, 1, 0, 0.04705882, 1,
2.444867, -0.1802427, 1.818306, 1, 0, 0.04313726, 1,
2.452819, 1.058477, 1.278445, 1, 0, 0.03529412, 1,
2.516659, 0.05340153, 0.4413104, 1, 0, 0.03137255, 1,
2.783585, 1.091193, -0.1985696, 1, 0, 0.02352941, 1,
2.939533, -0.1813354, 1.545885, 1, 0, 0.01960784, 1,
2.958503, 1.089236, 3.290721, 1, 0, 0.01176471, 1,
3.109038, 1.356359, 1.934394, 1, 0, 0.007843138, 1
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
0.03413653, -4.508965, -6.890202, 0, -0.5, 0.5, 0.5,
0.03413653, -4.508965, -6.890202, 1, -0.5, 0.5, 0.5,
0.03413653, -4.508965, -6.890202, 1, 1.5, 0.5, 0.5,
0.03413653, -4.508965, -6.890202, 0, 1.5, 0.5, 0.5
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
-4.083157, -0.2736075, -6.890202, 0, -0.5, 0.5, 0.5,
-4.083157, -0.2736075, -6.890202, 1, -0.5, 0.5, 0.5,
-4.083157, -0.2736075, -6.890202, 1, 1.5, 0.5, 0.5,
-4.083157, -0.2736075, -6.890202, 0, 1.5, 0.5, 0.5
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
-4.083157, -4.508965, 0.9103351, 0, -0.5, 0.5, 0.5,
-4.083157, -4.508965, 0.9103351, 1, -0.5, 0.5, 0.5,
-4.083157, -4.508965, 0.9103351, 1, 1.5, 0.5, 0.5,
-4.083157, -4.508965, 0.9103351, 0, 1.5, 0.5, 0.5
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
-3, -3.531575, -5.090078,
3, -3.531575, -5.090078,
-3, -3.531575, -5.090078,
-3, -3.694473, -5.390099,
-2, -3.531575, -5.090078,
-2, -3.694473, -5.390099,
-1, -3.531575, -5.090078,
-1, -3.694473, -5.390099,
0, -3.531575, -5.090078,
0, -3.694473, -5.390099,
1, -3.531575, -5.090078,
1, -3.694473, -5.390099,
2, -3.531575, -5.090078,
2, -3.694473, -5.390099,
3, -3.531575, -5.090078,
3, -3.694473, -5.390099
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
-3, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
-3, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
-3, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
-3, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
-2, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
-2, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
-2, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
-2, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
-1, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
-1, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
-1, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
-1, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
0, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
0, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
0, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
0, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
1, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
1, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
1, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
1, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
2, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
2, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
2, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
2, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5,
3, -4.02027, -5.99014, 0, -0.5, 0.5, 0.5,
3, -4.02027, -5.99014, 1, -0.5, 0.5, 0.5,
3, -4.02027, -5.99014, 1, 1.5, 0.5, 0.5,
3, -4.02027, -5.99014, 0, 1.5, 0.5, 0.5
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
-3.133012, -3, -5.090078,
-3.133012, 2, -5.090078,
-3.133012, -3, -5.090078,
-3.291369, -3, -5.390099,
-3.133012, -2, -5.090078,
-3.291369, -2, -5.390099,
-3.133012, -1, -5.090078,
-3.291369, -1, -5.390099,
-3.133012, 0, -5.090078,
-3.291369, 0, -5.390099,
-3.133012, 1, -5.090078,
-3.291369, 1, -5.390099,
-3.133012, 2, -5.090078,
-3.291369, 2, -5.390099
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
-3.608084, -3, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, -3, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, -3, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, -3, -5.99014, 0, 1.5, 0.5, 0.5,
-3.608084, -2, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, -2, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, -2, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, -2, -5.99014, 0, 1.5, 0.5, 0.5,
-3.608084, -1, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, -1, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, -1, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, -1, -5.99014, 0, 1.5, 0.5, 0.5,
-3.608084, 0, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, 0, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, 0, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, 0, -5.99014, 0, 1.5, 0.5, 0.5,
-3.608084, 1, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, 1, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, 1, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, 1, -5.99014, 0, 1.5, 0.5, 0.5,
-3.608084, 2, -5.99014, 0, -0.5, 0.5, 0.5,
-3.608084, 2, -5.99014, 1, -0.5, 0.5, 0.5,
-3.608084, 2, -5.99014, 1, 1.5, 0.5, 0.5,
-3.608084, 2, -5.99014, 0, 1.5, 0.5, 0.5
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
-3.133012, -3.531575, -4,
-3.133012, -3.531575, 6,
-3.133012, -3.531575, -4,
-3.291369, -3.694473, -4,
-3.133012, -3.531575, -2,
-3.291369, -3.694473, -2,
-3.133012, -3.531575, 0,
-3.291369, -3.694473, 0,
-3.133012, -3.531575, 2,
-3.291369, -3.694473, 2,
-3.133012, -3.531575, 4,
-3.291369, -3.694473, 4,
-3.133012, -3.531575, 6,
-3.291369, -3.694473, 6
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
-3.608084, -4.02027, -4, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, -4, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, -4, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, -4, 0, 1.5, 0.5, 0.5,
-3.608084, -4.02027, -2, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, -2, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, -2, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, -2, 0, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 0, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 0, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 0, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 0, 0, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 2, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 2, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 2, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 2, 0, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 4, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 4, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 4, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 4, 0, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 6, 0, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 6, 1, -0.5, 0.5, 0.5,
-3.608084, -4.02027, 6, 1, 1.5, 0.5, 0.5,
-3.608084, -4.02027, 6, 0, 1.5, 0.5, 0.5
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
-3.133012, -3.531575, -5.090078,
-3.133012, 2.98436, -5.090078,
-3.133012, -3.531575, 6.910748,
-3.133012, 2.98436, 6.910748,
-3.133012, -3.531575, -5.090078,
-3.133012, -3.531575, 6.910748,
-3.133012, 2.98436, -5.090078,
-3.133012, 2.98436, 6.910748,
-3.133012, -3.531575, -5.090078,
3.201285, -3.531575, -5.090078,
-3.133012, -3.531575, 6.910748,
3.201285, -3.531575, 6.910748,
-3.133012, 2.98436, -5.090078,
3.201285, 2.98436, -5.090078,
-3.133012, 2.98436, 6.910748,
3.201285, 2.98436, 6.910748,
3.201285, -3.531575, -5.090078,
3.201285, 2.98436, -5.090078,
3.201285, -3.531575, 6.910748,
3.201285, 2.98436, 6.910748,
3.201285, -3.531575, -5.090078,
3.201285, -3.531575, 6.910748,
3.201285, 2.98436, -5.090078,
3.201285, 2.98436, 6.910748
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
var radius = 8.038147;
var distance = 35.76262;
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
mvMatrix.translate( -0.03413653, 0.2736075, -0.9103351 );
mvMatrix.scale( 1.372055, 1.333807, 0.7242003 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.76262);
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
difenzoquat<-read.table("difenzoquat.xyz")
```

```
## Error in read.table("difenzoquat.xyz"): no lines available in input
```

```r
x<-difenzoquat$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
y<-difenzoquat$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
z<-difenzoquat$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
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
-3.040765, -0.2741781, -1.907377, 0, 0, 1, 1, 1,
-2.86266, 0.7458761, -1.397013, 1, 0, 0, 1, 1,
-2.85465, -0.4561018, -2.427272, 1, 0, 0, 1, 1,
-2.84064, 0.7240841, -0.5521613, 1, 0, 0, 1, 1,
-2.652891, -1.83475, -2.522017, 1, 0, 0, 1, 1,
-2.613174, -0.7726503, -0.9240882, 1, 0, 0, 1, 1,
-2.584117, -0.0765483, -2.412455, 0, 0, 0, 1, 1,
-2.542422, -0.7698716, -1.707588, 0, 0, 0, 1, 1,
-2.540243, 0.8973826, -2.339936, 0, 0, 0, 1, 1,
-2.512529, 0.6824901, -1.347657, 0, 0, 0, 1, 1,
-2.461983, -0.04718743, 0.8950096, 0, 0, 0, 1, 1,
-2.327362, -1.488703, -0.7311751, 0, 0, 0, 1, 1,
-2.289342, -0.7369028, -1.956061, 0, 0, 0, 1, 1,
-2.286259, 1.397853, -1.603142, 1, 1, 1, 1, 1,
-2.234395, 0.6525809, -1.937904, 1, 1, 1, 1, 1,
-2.229716, -0.6794634, -2.102913, 1, 1, 1, 1, 1,
-2.196026, -0.988814, -1.148082, 1, 1, 1, 1, 1,
-2.190623, 0.283936, -4.041249, 1, 1, 1, 1, 1,
-2.183369, 1.525777, 0.6081854, 1, 1, 1, 1, 1,
-2.151749, 0.8601346, -3.583144, 1, 1, 1, 1, 1,
-2.096468, -0.5733638, -2.126209, 1, 1, 1, 1, 1,
-2.087109, 0.01044278, 0.1058017, 1, 1, 1, 1, 1,
-2.078855, 0.9602384, -0.04440243, 1, 1, 1, 1, 1,
-2.072387, 1.158497, 0.4393404, 1, 1, 1, 1, 1,
-2.060876, -0.1455779, -1.20626, 1, 1, 1, 1, 1,
-2.048244, 0.5108821, -0.7646925, 1, 1, 1, 1, 1,
-2.046771, -0.5285973, -1.824352, 1, 1, 1, 1, 1,
-2.045913, 0.6508736, -3.185915, 1, 1, 1, 1, 1,
-2.012181, 0.5768939, -3.463921, 0, 0, 1, 1, 1,
-1.978867, -2.306114, -2.459229, 1, 0, 0, 1, 1,
-1.973608, 0.4293796, -0.7849089, 1, 0, 0, 1, 1,
-1.966074, 1.346958, -1.008325, 1, 0, 0, 1, 1,
-1.951059, 1.169621, -0.1596177, 1, 0, 0, 1, 1,
-1.927357, -0.845858, -3.171715, 1, 0, 0, 1, 1,
-1.918639, -0.6006445, -2.399217, 0, 0, 0, 1, 1,
-1.898113, -1.688661, -2.567342, 0, 0, 0, 1, 1,
-1.883945, -1.266785, -2.338862, 0, 0, 0, 1, 1,
-1.819173, -0.5620333, -2.485398, 0, 0, 0, 1, 1,
-1.813051, 1.387613, -0.01654134, 0, 0, 0, 1, 1,
-1.812411, -0.1053342, -1.634056, 0, 0, 0, 1, 1,
-1.803456, -0.0783815, -2.020049, 0, 0, 0, 1, 1,
-1.79391, -1.310825, -0.7690799, 1, 1, 1, 1, 1,
-1.791217, 2.672626, -0.6754035, 1, 1, 1, 1, 1,
-1.776976, -0.2294999, -1.80478, 1, 1, 1, 1, 1,
-1.774995, -1.302923, -0.9933162, 1, 1, 1, 1, 1,
-1.77116, 0.2937559, -1.070529, 1, 1, 1, 1, 1,
-1.764187, 0.1496208, -0.961713, 1, 1, 1, 1, 1,
-1.758625, -0.340627, -0.5540596, 1, 1, 1, 1, 1,
-1.749687, -0.1335108, -1.677899, 1, 1, 1, 1, 1,
-1.738579, 0.7044579, -0.4057509, 1, 1, 1, 1, 1,
-1.696498, -0.9161181, -1.80891, 1, 1, 1, 1, 1,
-1.691674, 1.940102, 1.04729, 1, 1, 1, 1, 1,
-1.687829, 1.220527, -1.132149, 1, 1, 1, 1, 1,
-1.681219, 1.38281, -1.290559, 1, 1, 1, 1, 1,
-1.671498, 0.2270101, -0.3486412, 1, 1, 1, 1, 1,
-1.65927, 0.7502771, -0.4310859, 1, 1, 1, 1, 1,
-1.658786, -0.2965523, -1.82316, 0, 0, 1, 1, 1,
-1.658106, 0.3860261, -2.014462, 1, 0, 0, 1, 1,
-1.654072, 1.129871, -0.1277413, 1, 0, 0, 1, 1,
-1.633108, -1.716999, -0.9121857, 1, 0, 0, 1, 1,
-1.62606, 0.6216227, 0.7860504, 1, 0, 0, 1, 1,
-1.613504, 0.3773829, -1.166506, 1, 0, 0, 1, 1,
-1.612952, 1.579572, -1.525756, 0, 0, 0, 1, 1,
-1.607716, -1.240189, -0.8201027, 0, 0, 0, 1, 1,
-1.602235, 0.7269565, -0.7750155, 0, 0, 0, 1, 1,
-1.574126, -1.837396, -2.776828, 0, 0, 0, 1, 1,
-1.567166, -1.74609, -3.637182, 0, 0, 0, 1, 1,
-1.564444, 1.140651, -0.06705441, 0, 0, 0, 1, 1,
-1.560808, -0.4188672, -3.752719, 0, 0, 0, 1, 1,
-1.551424, -1.025641, -0.529739, 1, 1, 1, 1, 1,
-1.517099, -0.3337822, -2.458427, 1, 1, 1, 1, 1,
-1.516931, 0.1873917, -1.235075, 1, 1, 1, 1, 1,
-1.49803, -0.6126421, -3.122276, 1, 1, 1, 1, 1,
-1.489745, 0.1942623, -2.356471, 1, 1, 1, 1, 1,
-1.464048, 1.060264, -1.456795, 1, 1, 1, 1, 1,
-1.460938, -0.3131565, -1.336515, 1, 1, 1, 1, 1,
-1.458955, 2.107053, -1.100992, 1, 1, 1, 1, 1,
-1.449113, 0.5932989, -1.0976, 1, 1, 1, 1, 1,
-1.448357, 0.3632902, -2.414966, 1, 1, 1, 1, 1,
-1.428196, 0.1784355, -1.644938, 1, 1, 1, 1, 1,
-1.416002, -2.521479, -2.023185, 1, 1, 1, 1, 1,
-1.399852, -0.9501261, -1.21696, 1, 1, 1, 1, 1,
-1.392923, 0.6979441, -1.358816, 1, 1, 1, 1, 1,
-1.390801, 0.4203921, -2.940203, 1, 1, 1, 1, 1,
-1.390546, -1.477373, -1.691152, 0, 0, 1, 1, 1,
-1.388432, -0.5761028, -2.745513, 1, 0, 0, 1, 1,
-1.376561, -1.000938, -1.155437, 1, 0, 0, 1, 1,
-1.365485, -2.438711, -4.452497, 1, 0, 0, 1, 1,
-1.365215, 0.887053, 0.5684377, 1, 0, 0, 1, 1,
-1.362086, 2.18639, -0.9467751, 1, 0, 0, 1, 1,
-1.354728, -1.86267, -2.606667, 0, 0, 0, 1, 1,
-1.345292, 0.4659885, -0.4540464, 0, 0, 0, 1, 1,
-1.334554, 1.387407, -0.7703086, 0, 0, 0, 1, 1,
-1.333723, 0.02165247, -1.128808, 0, 0, 0, 1, 1,
-1.332994, 0.3581392, -2.452528, 0, 0, 0, 1, 1,
-1.332288, 0.5351548, -0.9434065, 0, 0, 0, 1, 1,
-1.330863, 1.099094, 0.4919215, 0, 0, 0, 1, 1,
-1.330568, 0.1661996, -0.5841686, 1, 1, 1, 1, 1,
-1.328267, -0.5586774, -2.596342, 1, 1, 1, 1, 1,
-1.327951, 1.736099, 0.2407114, 1, 1, 1, 1, 1,
-1.32593, -0.7309541, -2.260419, 1, 1, 1, 1, 1,
-1.325, -2.453141, -1.940018, 1, 1, 1, 1, 1,
-1.317999, 1.437319, 0.01080647, 1, 1, 1, 1, 1,
-1.313021, -1.140167, -1.684612, 1, 1, 1, 1, 1,
-1.312183, 1.500276, 0.5807674, 1, 1, 1, 1, 1,
-1.311006, 0.2975141, -1.822644, 1, 1, 1, 1, 1,
-1.306198, 1.128611, -2.087588, 1, 1, 1, 1, 1,
-1.304822, -1.588312, -1.826475, 1, 1, 1, 1, 1,
-1.291929, -1.238214, -1.13586, 1, 1, 1, 1, 1,
-1.284961, -0.2790951, -2.63654, 1, 1, 1, 1, 1,
-1.270747, 0.8826625, -1.877679, 1, 1, 1, 1, 1,
-1.265714, 0.2197233, -1.874344, 1, 1, 1, 1, 1,
-1.261316, 0.8011843, -0.3384185, 0, 0, 1, 1, 1,
-1.258203, -0.8320854, -4.319137, 1, 0, 0, 1, 1,
-1.251402, 1.308453, -0.1234192, 1, 0, 0, 1, 1,
-1.245845, -0.5502047, -1.249303, 1, 0, 0, 1, 1,
-1.244883, -0.8313555, -0.9595926, 1, 0, 0, 1, 1,
-1.243264, 0.09698295, -1.819711, 1, 0, 0, 1, 1,
-1.242868, -0.1577983, -2.249358, 0, 0, 0, 1, 1,
-1.241949, -0.04714551, -1.810604, 0, 0, 0, 1, 1,
-1.240988, 0.3742754, -0.5043321, 0, 0, 0, 1, 1,
-1.239498, 1.372225, -0.4970208, 0, 0, 0, 1, 1,
-1.238409, 1.556529, -2.491399, 0, 0, 0, 1, 1,
-1.237827, 0.6318451, -0.6402946, 0, 0, 0, 1, 1,
-1.237046, 1.831703, 0.7722777, 0, 0, 0, 1, 1,
-1.231496, 0.9427113, -1.233484, 1, 1, 1, 1, 1,
-1.228186, 1.59873, -0.779771, 1, 1, 1, 1, 1,
-1.224832, 1.195195, -0.3125591, 1, 1, 1, 1, 1,
-1.223701, 1.092926, -0.992119, 1, 1, 1, 1, 1,
-1.221503, 0.3348605, -2.975463, 1, 1, 1, 1, 1,
-1.221228, 0.1457422, -1.845742, 1, 1, 1, 1, 1,
-1.213631, -1.424878, -2.16467, 1, 1, 1, 1, 1,
-1.213144, -1.085418, -3.334287, 1, 1, 1, 1, 1,
-1.209506, -0.3522291, -4.492532, 1, 1, 1, 1, 1,
-1.204043, 0.9048091, -1.017811, 1, 1, 1, 1, 1,
-1.195362, 0.5246674, -0.8692828, 1, 1, 1, 1, 1,
-1.194434, 0.7040706, -0.6922662, 1, 1, 1, 1, 1,
-1.193722, -0.5616689, -4.004759, 1, 1, 1, 1, 1,
-1.186531, -0.3256919, -2.121361, 1, 1, 1, 1, 1,
-1.185672, -1.415114, -3.056244, 1, 1, 1, 1, 1,
-1.185075, 0.3636089, -1.760603, 0, 0, 1, 1, 1,
-1.166289, -0.8117403, -3.118103, 1, 0, 0, 1, 1,
-1.163621, 1.433684, -0.5657266, 1, 0, 0, 1, 1,
-1.152262, -0.4322322, -1.241325, 1, 0, 0, 1, 1,
-1.1513, -0.04677936, -1.370266, 1, 0, 0, 1, 1,
-1.146965, 0.7957799, -1.454034, 1, 0, 0, 1, 1,
-1.145716, -1.397625, -3.154613, 0, 0, 0, 1, 1,
-1.137022, 0.1451995, -1.215965, 0, 0, 0, 1, 1,
-1.132753, 1.672507, -0.5197536, 0, 0, 0, 1, 1,
-1.130721, 0.123901, 0.01499246, 0, 0, 0, 1, 1,
-1.130256, -1.481835, -4.068993, 0, 0, 0, 1, 1,
-1.12494, -0.373386, -2.503402, 0, 0, 0, 1, 1,
-1.118949, 0.5890372, -1.81474, 0, 0, 0, 1, 1,
-1.111769, -0.5095107, -2.706084, 1, 1, 1, 1, 1,
-1.106082, 2.62155, -0.4386137, 1, 1, 1, 1, 1,
-1.101562, -1.689195, -1.810908, 1, 1, 1, 1, 1,
-1.097964, -0.5851309, -1.474455, 1, 1, 1, 1, 1,
-1.095319, -0.6915917, -1.126762, 1, 1, 1, 1, 1,
-1.092719, -0.6416767, -1.711306, 1, 1, 1, 1, 1,
-1.090511, 2.184381, -1.684982, 1, 1, 1, 1, 1,
-1.086127, 0.03755012, -2.010787, 1, 1, 1, 1, 1,
-1.084761, 0.3017409, -0.8900104, 1, 1, 1, 1, 1,
-1.081192, 0.2200948, -0.2133612, 1, 1, 1, 1, 1,
-1.078598, 1.150239, -1.429958, 1, 1, 1, 1, 1,
-1.077002, -0.1308154, 0.1513679, 1, 1, 1, 1, 1,
-1.066768, 1.083021, -3.957099, 1, 1, 1, 1, 1,
-1.065134, -0.3246504, -1.252526, 1, 1, 1, 1, 1,
-1.062398, 1.838577, -0.01193301, 1, 1, 1, 1, 1,
-1.045591, -0.6890954, -1.596468, 0, 0, 1, 1, 1,
-1.042042, 0.5735614, -1.216245, 1, 0, 0, 1, 1,
-1.03039, -0.822028, -1.638034, 1, 0, 0, 1, 1,
-1.006674, -0.1740541, -2.849506, 1, 0, 0, 1, 1,
-1.00497, 0.196164, -0.06782002, 1, 0, 0, 1, 1,
-1.003345, -0.2227236, -4.339457, 1, 0, 0, 1, 1,
-1.00256, -0.2600208, -4.08168, 0, 0, 0, 1, 1,
-0.9927334, 1.589926, 0.3648013, 0, 0, 0, 1, 1,
-0.9917209, -1.334378, -2.263094, 0, 0, 0, 1, 1,
-0.986221, 0.7620491, -1.219253, 0, 0, 0, 1, 1,
-0.9773259, -0.511355, -2.177184, 0, 0, 0, 1, 1,
-0.9750524, -2.015698, -2.396518, 0, 0, 0, 1, 1,
-0.9692721, -1.214213, -2.868397, 0, 0, 0, 1, 1,
-0.9486986, 1.498399, 0.03000818, 1, 1, 1, 1, 1,
-0.9471255, 1.578482, 0.01335327, 1, 1, 1, 1, 1,
-0.9464251, -0.4974481, -1.444291, 1, 1, 1, 1, 1,
-0.9399744, -1.125314, -1.665901, 1, 1, 1, 1, 1,
-0.9228709, -1.094304, -2.817324, 1, 1, 1, 1, 1,
-0.9189998, -0.812061, -2.63815, 1, 1, 1, 1, 1,
-0.9148749, 0.3266128, -2.542799, 1, 1, 1, 1, 1,
-0.9145183, -0.2343454, -1.430721, 1, 1, 1, 1, 1,
-0.9088538, -0.5567952, -1.99078, 1, 1, 1, 1, 1,
-0.9024394, -0.4838665, -3.256165, 1, 1, 1, 1, 1,
-0.9002259, 1.936395, 0.08049881, 1, 1, 1, 1, 1,
-0.9002251, 0.169262, 0.9899411, 1, 1, 1, 1, 1,
-0.8998293, -0.7564719, -0.5804499, 1, 1, 1, 1, 1,
-0.8912481, -0.6151677, -1.326735, 1, 1, 1, 1, 1,
-0.889833, -0.3086093, -2.813576, 1, 1, 1, 1, 1,
-0.8877311, -1.062352, -3.917955, 0, 0, 1, 1, 1,
-0.8831865, 0.7740044, -1.023399, 1, 0, 0, 1, 1,
-0.8790182, -0.1920873, -2.318381, 1, 0, 0, 1, 1,
-0.875513, 0.5289328, -2.637777, 1, 0, 0, 1, 1,
-0.8743024, -0.346162, -2.921388, 1, 0, 0, 1, 1,
-0.8701653, 1.455076, -0.4647192, 1, 0, 0, 1, 1,
-0.8693548, -0.3093449, -1.454132, 0, 0, 0, 1, 1,
-0.8644559, 0.8628129, -1.346191, 0, 0, 0, 1, 1,
-0.8564639, -0.2408289, -1.504981, 0, 0, 0, 1, 1,
-0.855065, -0.6948228, -2.07793, 0, 0, 0, 1, 1,
-0.8546618, 0.374005, -0.9134674, 0, 0, 0, 1, 1,
-0.8513173, 0.7991985, -0.7165329, 0, 0, 0, 1, 1,
-0.8454152, -1.581721, -2.524843, 0, 0, 0, 1, 1,
-0.8421101, 1.248016, -1.731383, 1, 1, 1, 1, 1,
-0.8416451, -0.544549, -2.557227, 1, 1, 1, 1, 1,
-0.834568, 1.192751, -0.619639, 1, 1, 1, 1, 1,
-0.8330823, -1.000988, -4.133686, 1, 1, 1, 1, 1,
-0.8191687, -0.06493627, -1.422136, 1, 1, 1, 1, 1,
-0.8172945, 0.02175951, -2.072932, 1, 1, 1, 1, 1,
-0.8157185, 1.080903, -0.2685369, 1, 1, 1, 1, 1,
-0.811219, 0.2352836, -0.5164618, 1, 1, 1, 1, 1,
-0.8084717, -0.7822428, -3.41475, 1, 1, 1, 1, 1,
-0.8044911, -1.634828, -2.470617, 1, 1, 1, 1, 1,
-0.7901965, 1.271262, -0.5735174, 1, 1, 1, 1, 1,
-0.7901899, 0.3675795, -1.014011, 1, 1, 1, 1, 1,
-0.7877536, -0.3411781, -3.763206, 1, 1, 1, 1, 1,
-0.7796715, 0.6679971, -0.8214986, 1, 1, 1, 1, 1,
-0.7784923, -1.198176, -2.802618, 1, 1, 1, 1, 1,
-0.7782736, -0.5667719, -1.132609, 0, 0, 1, 1, 1,
-0.7774041, -0.005503219, -0.7590907, 1, 0, 0, 1, 1,
-0.7766395, -1.975441, -3.286181, 1, 0, 0, 1, 1,
-0.7691827, -1.480566, -2.509916, 1, 0, 0, 1, 1,
-0.7662768, 0.1545011, -2.055794, 1, 0, 0, 1, 1,
-0.7639912, 0.4229219, -0.7930658, 1, 0, 0, 1, 1,
-0.7613798, 0.2972207, -0.8956141, 0, 0, 0, 1, 1,
-0.7610267, -0.2716327, -1.51911, 0, 0, 0, 1, 1,
-0.7589644, 0.163361, -0.6679139, 0, 0, 0, 1, 1,
-0.7547869, 1.462319, -0.1952422, 0, 0, 0, 1, 1,
-0.7535454, 0.2294733, -0.195527, 0, 0, 0, 1, 1,
-0.7530559, 0.7892021, -1.496303, 0, 0, 0, 1, 1,
-0.7470646, 0.6925828, -1.155639, 0, 0, 0, 1, 1,
-0.7462764, -0.236418, -0.6428504, 1, 1, 1, 1, 1,
-0.7444221, -1.576511, -2.782345, 1, 1, 1, 1, 1,
-0.7436173, -0.4117776, -0.9915065, 1, 1, 1, 1, 1,
-0.7417386, 0.6933689, -0.6469374, 1, 1, 1, 1, 1,
-0.7370746, -0.1409186, -1.080392, 1, 1, 1, 1, 1,
-0.7366149, -0.175474, -1.208068, 1, 1, 1, 1, 1,
-0.7342615, -0.586905, -0.6483165, 1, 1, 1, 1, 1,
-0.7336414, -1.058434, -3.178009, 1, 1, 1, 1, 1,
-0.7323087, -1.245298, -3.926683, 1, 1, 1, 1, 1,
-0.7321315, 1.622092, 0.6778222, 1, 1, 1, 1, 1,
-0.7312381, -1.043248, -2.260812, 1, 1, 1, 1, 1,
-0.731011, -0.9423934, -1.687209, 1, 1, 1, 1, 1,
-0.7217647, 0.8233286, -0.1850437, 1, 1, 1, 1, 1,
-0.7215149, -0.7187349, -2.777522, 1, 1, 1, 1, 1,
-0.7178091, 0.6718435, -1.561419, 1, 1, 1, 1, 1,
-0.7113376, -0.7836532, -3.077869, 0, 0, 1, 1, 1,
-0.7072831, -0.8342216, -1.454638, 1, 0, 0, 1, 1,
-0.7059206, 2.257965, -0.6317107, 1, 0, 0, 1, 1,
-0.7048382, -0.8030741, -1.888874, 1, 0, 0, 1, 1,
-0.7042458, 1.726731, -0.7363061, 1, 0, 0, 1, 1,
-0.7003345, -0.2995321, -3.01903, 1, 0, 0, 1, 1,
-0.6998167, -1.666153, -2.622184, 0, 0, 0, 1, 1,
-0.6980085, -1.692626, -1.179534, 0, 0, 0, 1, 1,
-0.6902642, -1.71339, -1.531489, 0, 0, 0, 1, 1,
-0.6873475, -0.06066452, -3.799211, 0, 0, 0, 1, 1,
-0.6863905, -1.194228, -3.04938, 0, 0, 0, 1, 1,
-0.6822575, 1.41645, -1.402223, 0, 0, 0, 1, 1,
-0.6790193, 0.2519839, -1.439013, 0, 0, 0, 1, 1,
-0.6772877, -1.606753, -4.39572, 1, 1, 1, 1, 1,
-0.6752825, 1.074646, 0.09401495, 1, 1, 1, 1, 1,
-0.673237, 1.617454, 0.1013853, 1, 1, 1, 1, 1,
-0.6672809, 0.9421337, -0.1612741, 1, 1, 1, 1, 1,
-0.6577374, -0.5415814, -1.641869, 1, 1, 1, 1, 1,
-0.6542848, 1.079056, 1.034462, 1, 1, 1, 1, 1,
-0.6472265, -1.191003, -3.571219, 1, 1, 1, 1, 1,
-0.6438372, 1.21296, -0.9779325, 1, 1, 1, 1, 1,
-0.6422176, 0.1107612, 0.4731177, 1, 1, 1, 1, 1,
-0.6385667, 0.4734353, -2.446464, 1, 1, 1, 1, 1,
-0.6351837, 0.1139961, -1.060625, 1, 1, 1, 1, 1,
-0.6330084, -0.2639962, 0.01173287, 1, 1, 1, 1, 1,
-0.6252018, 0.4404087, -0.1725084, 1, 1, 1, 1, 1,
-0.6250517, -0.6320677, -2.13388, 1, 1, 1, 1, 1,
-0.6243377, -1.481, -3.231764, 1, 1, 1, 1, 1,
-0.6183953, -0.869032, -2.461513, 0, 0, 1, 1, 1,
-0.6176746, -0.1740732, -1.132856, 1, 0, 0, 1, 1,
-0.6100788, 0.1248825, -0.2054847, 1, 0, 0, 1, 1,
-0.6072892, 0.6713842, -0.9245508, 1, 0, 0, 1, 1,
-0.6056776, 1.361498, 0.4747265, 1, 0, 0, 1, 1,
-0.6025347, -0.9207892, -2.400744, 1, 0, 0, 1, 1,
-0.596165, 0.2629622, -1.930065, 0, 0, 0, 1, 1,
-0.5802757, 0.2549876, 0.9181069, 0, 0, 0, 1, 1,
-0.5725476, -0.4668922, -1.835396, 0, 0, 0, 1, 1,
-0.5667943, -0.6623597, -3.007739, 0, 0, 0, 1, 1,
-0.5583338, -0.4465361, -1.236697, 0, 0, 0, 1, 1,
-0.5559019, -1.414943, -2.469279, 0, 0, 0, 1, 1,
-0.5536156, 0.6193475, -2.429697, 0, 0, 0, 1, 1,
-0.55349, 1.731507, -0.3509432, 1, 1, 1, 1, 1,
-0.5522485, -1.294482, -2.310414, 1, 1, 1, 1, 1,
-0.5390002, 0.6871017, 0.05811099, 1, 1, 1, 1, 1,
-0.5179228, -0.06124283, -1.951938, 1, 1, 1, 1, 1,
-0.5178865, -0.7100886, -4.1478, 1, 1, 1, 1, 1,
-0.5167829, 0.5167082, 0.06399398, 1, 1, 1, 1, 1,
-0.5162086, -1.475815, -3.387554, 1, 1, 1, 1, 1,
-0.5155031, 1.563595, 0.1645549, 1, 1, 1, 1, 1,
-0.5151787, -0.3597611, -3.541845, 1, 1, 1, 1, 1,
-0.5078548, -0.9685666, -3.410514, 1, 1, 1, 1, 1,
-0.5016953, -1.718705, -3.416262, 1, 1, 1, 1, 1,
-0.4990797, -1.669155, -2.814398, 1, 1, 1, 1, 1,
-0.4981798, -0.6198118, -1.697262, 1, 1, 1, 1, 1,
-0.4965688, 1.471485, 0.1771646, 1, 1, 1, 1, 1,
-0.4964125, 0.4054929, -1.713009, 1, 1, 1, 1, 1,
-0.4941431, 0.1867586, -0.9905955, 0, 0, 1, 1, 1,
-0.4857081, -1.033812, -1.832275, 1, 0, 0, 1, 1,
-0.4844657, 1.464457, -0.3719108, 1, 0, 0, 1, 1,
-0.4738953, 0.194775, -2.980229, 1, 0, 0, 1, 1,
-0.4736144, 0.9109493, -0.6150631, 1, 0, 0, 1, 1,
-0.4730287, -1.430653, -3.260519, 1, 0, 0, 1, 1,
-0.4695327, 0.2294558, 0.08206922, 0, 0, 0, 1, 1,
-0.4693492, 0.06773284, -2.197471, 0, 0, 0, 1, 1,
-0.4658489, -0.5166393, -1.241123, 0, 0, 0, 1, 1,
-0.4584841, 2.670523, 1.009687, 0, 0, 0, 1, 1,
-0.4576337, -0.2970188, -2.82723, 0, 0, 0, 1, 1,
-0.4545094, 1.025869, -0.9652858, 0, 0, 0, 1, 1,
-0.4508482, -1.158425, -2.417319, 0, 0, 0, 1, 1,
-0.4487784, -0.626727, -2.570844, 1, 1, 1, 1, 1,
-0.4485201, -0.6396657, -3.735724, 1, 1, 1, 1, 1,
-0.4451443, -1.220526, -1.903225, 1, 1, 1, 1, 1,
-0.4444444, 0.4283918, -0.7802659, 1, 1, 1, 1, 1,
-0.4422876, 0.4048245, -0.3454186, 1, 1, 1, 1, 1,
-0.4375962, 0.1761307, -1.738149, 1, 1, 1, 1, 1,
-0.431536, -3.436682, -3.582195, 1, 1, 1, 1, 1,
-0.4298787, -1.168951, -3.48053, 1, 1, 1, 1, 1,
-0.4238189, -2.3899, -2.751341, 1, 1, 1, 1, 1,
-0.4229818, -0.2636736, -1.81123, 1, 1, 1, 1, 1,
-0.422557, 0.4228012, -2.381172, 1, 1, 1, 1, 1,
-0.4224768, 0.4082391, -0.829632, 1, 1, 1, 1, 1,
-0.4170884, -0.0592299, -2.320175, 1, 1, 1, 1, 1,
-0.4165489, -0.8438499, -2.548731, 1, 1, 1, 1, 1,
-0.4149651, -1.828118, -2.90364, 1, 1, 1, 1, 1,
-0.4141065, 0.6016325, -1.340766, 0, 0, 1, 1, 1,
-0.4112923, -0.8337136, -2.321019, 1, 0, 0, 1, 1,
-0.4102249, -0.5384868, -3.132234, 1, 0, 0, 1, 1,
-0.4100042, -1.690757, -0.4748084, 1, 0, 0, 1, 1,
-0.4014895, 1.7429, 0.6437489, 1, 0, 0, 1, 1,
-0.3971795, -0.4322568, -2.287048, 1, 0, 0, 1, 1,
-0.3962829, 0.6262951, -0.6818951, 0, 0, 0, 1, 1,
-0.3954707, 0.1704492, -1.692884, 0, 0, 0, 1, 1,
-0.3939152, 0.9158316, -0.3850703, 0, 0, 0, 1, 1,
-0.3935387, -0.847206, -2.560555, 0, 0, 0, 1, 1,
-0.3929897, -0.02950248, -1.033437, 0, 0, 0, 1, 1,
-0.3882137, -0.2879411, -4.915309, 0, 0, 0, 1, 1,
-0.3857147, -0.4571582, -4.295174, 0, 0, 0, 1, 1,
-0.3852566, 1.12589, -1.79373, 1, 1, 1, 1, 1,
-0.3844259, 1.334132, -0.8565101, 1, 1, 1, 1, 1,
-0.3831797, -0.700121, -1.481733, 1, 1, 1, 1, 1,
-0.3821256, -0.1342546, -1.712211, 1, 1, 1, 1, 1,
-0.3810021, 0.6252794, -0.6698058, 1, 1, 1, 1, 1,
-0.3659058, 0.3768415, -0.8006559, 1, 1, 1, 1, 1,
-0.3643925, 0.4313341, -0.4209816, 1, 1, 1, 1, 1,
-0.364387, -0.4184484, -3.07259, 1, 1, 1, 1, 1,
-0.3619016, 0.3338417, -2.653523, 1, 1, 1, 1, 1,
-0.3610652, 1.458315, -1.501833, 1, 1, 1, 1, 1,
-0.3606988, -2.163662, -3.204032, 1, 1, 1, 1, 1,
-0.3539835, -0.8149152, -1.510438, 1, 1, 1, 1, 1,
-0.3524317, -0.6181918, -2.975233, 1, 1, 1, 1, 1,
-0.3512563, 0.1024292, -1.557842, 1, 1, 1, 1, 1,
-0.3480234, -0.259886, -2.778819, 1, 1, 1, 1, 1,
-0.3473222, -1.376662, -1.973512, 0, 0, 1, 1, 1,
-0.3447631, 0.7296497, -0.4129516, 1, 0, 0, 1, 1,
-0.3224281, 0.2275243, -1.125379, 1, 0, 0, 1, 1,
-0.3202092, 0.6773582, -0.656031, 1, 0, 0, 1, 1,
-0.3182565, 0.02339693, -1.890627, 1, 0, 0, 1, 1,
-0.3180959, -0.07607701, -1.047504, 1, 0, 0, 1, 1,
-0.3179701, 0.6935473, 0.2609551, 0, 0, 0, 1, 1,
-0.3173448, 1.496514, -0.2111081, 0, 0, 0, 1, 1,
-0.3144306, -0.1202676, -1.252669, 0, 0, 0, 1, 1,
-0.3122897, -0.3805688, -2.792712, 0, 0, 0, 1, 1,
-0.3105648, -0.03392997, -0.6114441, 0, 0, 0, 1, 1,
-0.3080221, 0.4140024, -0.9375004, 0, 0, 0, 1, 1,
-0.3079002, -0.730769, -2.704221, 0, 0, 0, 1, 1,
-0.3038779, -0.4113242, -1.371029, 1, 1, 1, 1, 1,
-0.3022322, -1.496321, -1.975121, 1, 1, 1, 1, 1,
-0.3009424, -0.4865609, -3.635638, 1, 1, 1, 1, 1,
-0.3000565, -1.85327, -1.802747, 1, 1, 1, 1, 1,
-0.2996276, -0.2448367, -0.4776464, 1, 1, 1, 1, 1,
-0.2983449, 1.888604, 0.06188344, 1, 1, 1, 1, 1,
-0.2972099, -1.061164, -2.953089, 1, 1, 1, 1, 1,
-0.2970688, -1.505704, -2.692679, 1, 1, 1, 1, 1,
-0.296656, 1.106237, 0.8247688, 1, 1, 1, 1, 1,
-0.2924067, 0.4339072, -2.040058, 1, 1, 1, 1, 1,
-0.2913649, -0.357679, -1.963982, 1, 1, 1, 1, 1,
-0.2909627, -0.3972632, -2.316421, 1, 1, 1, 1, 1,
-0.2859141, 1.394634, 0.5450029, 1, 1, 1, 1, 1,
-0.2792347, 0.1691132, -1.585331, 1, 1, 1, 1, 1,
-0.2781091, -0.08937719, -1.875097, 1, 1, 1, 1, 1,
-0.2758873, 0.5135545, 0.01388359, 0, 0, 1, 1, 1,
-0.2729089, 1.350488, -0.545936, 1, 0, 0, 1, 1,
-0.2664886, -0.1317737, -2.080064, 1, 0, 0, 1, 1,
-0.2652928, 0.9427195, 0.6392844, 1, 0, 0, 1, 1,
-0.2632249, 0.7561106, -0.6714551, 1, 0, 0, 1, 1,
-0.2615987, -0.4965541, -0.3520116, 1, 0, 0, 1, 1,
-0.2601385, 0.5287121, -0.977834, 0, 0, 0, 1, 1,
-0.2592784, 1.62497, 0.3327738, 0, 0, 0, 1, 1,
-0.2552804, 1.023246, -0.3957042, 0, 0, 0, 1, 1,
-0.250548, -0.4958281, -3.118647, 0, 0, 0, 1, 1,
-0.2484413, 0.1814961, -0.5499657, 0, 0, 0, 1, 1,
-0.2469383, -0.7638418, -4.096706, 0, 0, 0, 1, 1,
-0.243771, 1.402644, -0.3762906, 0, 0, 0, 1, 1,
-0.2393613, -1.027386, -2.80743, 1, 1, 1, 1, 1,
-0.2381586, -0.8797781, -3.495054, 1, 1, 1, 1, 1,
-0.2351109, -0.5498136, -4.054596, 1, 1, 1, 1, 1,
-0.233274, -0.2394735, -2.304966, 1, 1, 1, 1, 1,
-0.233152, -0.3081684, -1.60632, 1, 1, 1, 1, 1,
-0.23299, -0.6331713, -3.100284, 1, 1, 1, 1, 1,
-0.2269749, 0.7849488, -2.01423, 1, 1, 1, 1, 1,
-0.2260469, -0.5914174, -3.56057, 1, 1, 1, 1, 1,
-0.2233515, -0.4897344, -3.280414, 1, 1, 1, 1, 1,
-0.2224679, 0.1182605, -1.639155, 1, 1, 1, 1, 1,
-0.2196581, 0.9719386, 1.008858, 1, 1, 1, 1, 1,
-0.2194243, -1.036345, -2.322214, 1, 1, 1, 1, 1,
-0.2122151, -0.9774984, -2.600419, 1, 1, 1, 1, 1,
-0.2091368, -1.269485, -3.809873, 1, 1, 1, 1, 1,
-0.2077459, -0.2572655, -1.940395, 1, 1, 1, 1, 1,
-0.2072392, -0.8051537, -2.729175, 0, 0, 1, 1, 1,
-0.20637, 0.9729439, 1.650178, 1, 0, 0, 1, 1,
-0.2031026, -1.215012, -4.437377, 1, 0, 0, 1, 1,
-0.1922117, 0.07889348, -1.118394, 1, 0, 0, 1, 1,
-0.1877962, 1.150239, 0.1394601, 1, 0, 0, 1, 1,
-0.1818781, -2.603634, -3.508149, 1, 0, 0, 1, 1,
-0.1798759, 0.162672, 0.08573346, 0, 0, 0, 1, 1,
-0.1794054, 0.1556686, -2.174859, 0, 0, 0, 1, 1,
-0.1782231, 1.114688, 0.5847973, 0, 0, 0, 1, 1,
-0.1775764, -0.9161829, -1.982692, 0, 0, 0, 1, 1,
-0.1771669, -0.3238462, -4.789959, 0, 0, 0, 1, 1,
-0.1737375, 0.7591854, -0.2158862, 0, 0, 0, 1, 1,
-0.1726697, -0.1218766, -0.9508241, 0, 0, 0, 1, 1,
-0.1711935, -0.0847514, -1.07392, 1, 1, 1, 1, 1,
-0.1664091, -1.227867, -1.938301, 1, 1, 1, 1, 1,
-0.1661627, -1.633802, -2.980391, 1, 1, 1, 1, 1,
-0.1660784, -1.080958, -3.723533, 1, 1, 1, 1, 1,
-0.1602492, 0.5491379, 0.285331, 1, 1, 1, 1, 1,
-0.1592518, -0.1414532, -2.758383, 1, 1, 1, 1, 1,
-0.1569009, -0.4905776, -3.069153, 1, 1, 1, 1, 1,
-0.1558519, -0.8653931, -1.582688, 1, 1, 1, 1, 1,
-0.1550655, -0.002311286, -0.003199307, 1, 1, 1, 1, 1,
-0.1535596, 0.6520213, 0.2228163, 1, 1, 1, 1, 1,
-0.1532973, 0.3949695, 0.5603705, 1, 1, 1, 1, 1,
-0.1532393, -1.857549, -2.257906, 1, 1, 1, 1, 1,
-0.1484279, 1.103827, 1.385203, 1, 1, 1, 1, 1,
-0.1477476, -1.409748, -4.181223, 1, 1, 1, 1, 1,
-0.1427734, 0.01351513, -0.9706548, 1, 1, 1, 1, 1,
-0.1422254, 0.6760496, -2.209894, 0, 0, 1, 1, 1,
-0.1331646, 0.2749305, -0.2896026, 1, 0, 0, 1, 1,
-0.1297763, -1.351081, -2.604671, 1, 0, 0, 1, 1,
-0.1297713, -0.5927795, -1.758425, 1, 0, 0, 1, 1,
-0.1269668, -0.57081, -2.670999, 1, 0, 0, 1, 1,
-0.1252726, 0.396985, 0.3340819, 1, 0, 0, 1, 1,
-0.1210735, -0.899128, -2.586698, 0, 0, 0, 1, 1,
-0.1155711, 0.6049184, -0.3619174, 0, 0, 0, 1, 1,
-0.1153868, -0.5798103, -4.362591, 0, 0, 0, 1, 1,
-0.113356, 0.2202352, -0.914704, 0, 0, 0, 1, 1,
-0.09900755, 0.624895, 0.7598399, 0, 0, 0, 1, 1,
-0.09622252, -0.6660455, -3.483275, 0, 0, 0, 1, 1,
-0.09466153, -0.4664855, -0.6898258, 0, 0, 0, 1, 1,
-0.09416381, -1.043721, -1.835277, 1, 1, 1, 1, 1,
-0.09259288, -0.505087, -2.726736, 1, 1, 1, 1, 1,
-0.09210334, 0.94233, 0.5002446, 1, 1, 1, 1, 1,
-0.09198945, -0.6747084, -3.923787, 1, 1, 1, 1, 1,
-0.08843912, -0.8417268, -4.531785, 1, 1, 1, 1, 1,
-0.08689547, 0.3605356, -1.845229, 1, 1, 1, 1, 1,
-0.0867856, -0.7139066, -3.398623, 1, 1, 1, 1, 1,
-0.08631361, 0.5259244, -0.05988548, 1, 1, 1, 1, 1,
-0.0855989, -0.4478605, -2.54496, 1, 1, 1, 1, 1,
-0.08459905, -1.307506, -3.480428, 1, 1, 1, 1, 1,
-0.08411856, -0.9325022, -2.665246, 1, 1, 1, 1, 1,
-0.08293574, -1.659113, -2.391619, 1, 1, 1, 1, 1,
-0.08037982, 0.2616336, -1.520065, 1, 1, 1, 1, 1,
-0.07905807, 0.2914105, 0.4133032, 1, 1, 1, 1, 1,
-0.07892106, -0.5904148, -2.950336, 1, 1, 1, 1, 1,
-0.07537868, 0.06591821, 0.5710655, 0, 0, 1, 1, 1,
-0.07452492, -0.8618694, -2.440148, 1, 0, 0, 1, 1,
-0.07323839, 0.1600823, -1.685546, 1, 0, 0, 1, 1,
-0.06816904, 0.5139077, -0.2538596, 1, 0, 0, 1, 1,
-0.06745815, 0.9632441, -0.143947, 1, 0, 0, 1, 1,
-0.06681145, -1.479313, -3.313568, 1, 0, 0, 1, 1,
-0.06679866, 0.1052009, -0.2501198, 0, 0, 0, 1, 1,
-0.06378291, 0.8771973, 0.7282643, 0, 0, 0, 1, 1,
-0.0636828, -0.4451316, -3.757828, 0, 0, 0, 1, 1,
-0.06168612, 0.1225791, 0.08443351, 0, 0, 0, 1, 1,
-0.06112702, -0.3805375, -2.794237, 0, 0, 0, 1, 1,
-0.05296247, -0.8788747, -3.970276, 0, 0, 0, 1, 1,
-0.05205805, -0.613448, -2.697559, 0, 0, 0, 1, 1,
-0.05062927, -0.02712257, -2.054373, 1, 1, 1, 1, 1,
-0.04939345, -0.4147104, -3.515659, 1, 1, 1, 1, 1,
-0.04916014, 0.7060181, 0.8367077, 1, 1, 1, 1, 1,
-0.04812976, 1.70091, -1.107393, 1, 1, 1, 1, 1,
-0.04343694, 1.199205, -0.8101264, 1, 1, 1, 1, 1,
-0.0390449, -2.017846, -2.252978, 1, 1, 1, 1, 1,
-0.03650501, 1.124284, -0.1274592, 1, 1, 1, 1, 1,
-0.03574585, -0.2909671, -4.723941, 1, 1, 1, 1, 1,
-0.03239491, -0.01315464, -0.2132603, 1, 1, 1, 1, 1,
-0.03053799, 1.203081, 1.378684, 1, 1, 1, 1, 1,
-0.02890597, 0.305534, -0.6263054, 1, 1, 1, 1, 1,
-0.02247785, -0.791499, -1.251792, 1, 1, 1, 1, 1,
-0.02213384, -0.8188446, -3.135549, 1, 1, 1, 1, 1,
-0.02138516, -0.1561586, -3.245523, 1, 1, 1, 1, 1,
-0.01367285, -0.8424068, -4.231741, 1, 1, 1, 1, 1,
-0.0133336, 2.436471, 1.233808, 0, 0, 1, 1, 1,
-0.009157705, 0.01511679, -0.314445, 1, 0, 0, 1, 1,
-0.003480656, -0.9214143, -2.856382, 1, 0, 0, 1, 1,
-0.001318103, 1.355167, 0.6258776, 1, 0, 0, 1, 1,
0.001365064, -0.9387299, 1.91724, 1, 0, 0, 1, 1,
0.002733527, 0.2974465, 0.691839, 1, 0, 0, 1, 1,
0.004791438, 0.4410793, 0.2453575, 0, 0, 0, 1, 1,
0.00659362, -0.5589494, 1.095276, 0, 0, 0, 1, 1,
0.006919803, 1.403998, -0.9183535, 0, 0, 0, 1, 1,
0.007394472, -0.5345683, 3.811739, 0, 0, 0, 1, 1,
0.009629192, -1.444695, 3.180885, 0, 0, 0, 1, 1,
0.01211252, 0.6300107, -0.4070994, 0, 0, 0, 1, 1,
0.01450701, -0.3588768, 3.151208, 0, 0, 0, 1, 1,
0.0146889, -1.350344, 2.543971, 1, 1, 1, 1, 1,
0.01658563, -1.790554, 2.65283, 1, 1, 1, 1, 1,
0.01802553, 1.013733, 0.3331466, 1, 1, 1, 1, 1,
0.01804394, 0.3913463, 0.5198733, 1, 1, 1, 1, 1,
0.01828321, -0.3432918, 4.113166, 1, 1, 1, 1, 1,
0.01975622, -0.8028817, 3.592239, 1, 1, 1, 1, 1,
0.02685455, 1.461963, -0.5924544, 1, 1, 1, 1, 1,
0.03194544, -1.869263, 2.860973, 1, 1, 1, 1, 1,
0.03235957, 0.1716432, -0.3227089, 1, 1, 1, 1, 1,
0.03420734, -0.8885311, 2.366386, 1, 1, 1, 1, 1,
0.03899191, -0.1714175, 2.279103, 1, 1, 1, 1, 1,
0.04834262, 0.1477354, -0.05525109, 1, 1, 1, 1, 1,
0.04878262, -0.196655, 2.081325, 1, 1, 1, 1, 1,
0.05040767, 0.7330204, -0.1987054, 1, 1, 1, 1, 1,
0.05047648, 1.018077, -0.2748705, 1, 1, 1, 1, 1,
0.05096308, 1.024281, -0.1463891, 0, 0, 1, 1, 1,
0.05299158, 0.4332309, 0.4368318, 1, 0, 0, 1, 1,
0.05346704, -0.1423303, 2.876045, 1, 0, 0, 1, 1,
0.05612892, -0.1939919, 2.296752, 1, 0, 0, 1, 1,
0.05710991, -0.32409, 0.3533961, 1, 0, 0, 1, 1,
0.05960478, -0.3929794, 2.720419, 1, 0, 0, 1, 1,
0.05973514, -0.4264416, 1.897368, 0, 0, 0, 1, 1,
0.05998831, -1.074621, 2.699409, 0, 0, 0, 1, 1,
0.06022171, 2.445768, -1.029345, 0, 0, 0, 1, 1,
0.06529565, 0.4221601, 0.5504018, 0, 0, 0, 1, 1,
0.06558939, 0.04505484, 0.6497521, 0, 0, 0, 1, 1,
0.07108569, 2.403135, 1.209394, 0, 0, 0, 1, 1,
0.0715841, 0.5996873, 1.096168, 0, 0, 0, 1, 1,
0.07238271, 0.9694787, -0.008854242, 1, 1, 1, 1, 1,
0.07327216, -1.498653, 4.269919, 1, 1, 1, 1, 1,
0.07580296, -0.5626581, 2.973524, 1, 1, 1, 1, 1,
0.076699, 0.6507106, 0.005726672, 1, 1, 1, 1, 1,
0.07968189, 1.198519, 0.1761754, 1, 1, 1, 1, 1,
0.08458367, -0.3183845, 3.568484, 1, 1, 1, 1, 1,
0.08557425, 0.222829, -0.3487099, 1, 1, 1, 1, 1,
0.0934605, -0.3497247, 2.24427, 1, 1, 1, 1, 1,
0.09500988, 1.358206, 0.08019578, 1, 1, 1, 1, 1,
0.09860978, 1.159694, -0.6345466, 1, 1, 1, 1, 1,
0.1002769, 0.8081807, 0.6375285, 1, 1, 1, 1, 1,
0.1039103, -0.002831635, 0.1482697, 1, 1, 1, 1, 1,
0.1054501, -0.2475011, 2.739922, 1, 1, 1, 1, 1,
0.1088157, -1.134975, 3.993067, 1, 1, 1, 1, 1,
0.1093929, 0.1354739, 1.091416, 1, 1, 1, 1, 1,
0.1192847, -0.7927718, 3.491063, 0, 0, 1, 1, 1,
0.1204906, 0.3084019, 0.5254875, 1, 0, 0, 1, 1,
0.1232768, -0.4897718, 1.830948, 1, 0, 0, 1, 1,
0.1247323, -0.3361774, 4.598171, 1, 0, 0, 1, 1,
0.1249307, -0.2198003, 3.984686, 1, 0, 0, 1, 1,
0.1255926, 0.3876303, -0.008299972, 1, 0, 0, 1, 1,
0.1331404, -0.04417505, 1.89256, 0, 0, 0, 1, 1,
0.1370252, 0.7024165, 2.417026, 0, 0, 0, 1, 1,
0.1423844, 1.002047, -0.9395787, 0, 0, 0, 1, 1,
0.1430284, 0.6545545, -0.1655191, 0, 0, 0, 1, 1,
0.1448681, 0.1918302, 1.355289, 0, 0, 0, 1, 1,
0.1465972, 0.8126383, 0.3723307, 0, 0, 0, 1, 1,
0.1483513, -0.2990718, 2.363555, 0, 0, 0, 1, 1,
0.1486475, -0.5921317, 4.066699, 1, 1, 1, 1, 1,
0.1560348, -0.5194293, 1.17352, 1, 1, 1, 1, 1,
0.1563774, 1.365277, 0.5281326, 1, 1, 1, 1, 1,
0.1583483, 0.7239586, -0.651193, 1, 1, 1, 1, 1,
0.1590554, 1.175604, 0.1992628, 1, 1, 1, 1, 1,
0.1594008, 0.3059253, 1.063105, 1, 1, 1, 1, 1,
0.161173, 1.890405, -0.2785094, 1, 1, 1, 1, 1,
0.1621871, 0.442569, 0.3445144, 1, 1, 1, 1, 1,
0.1677007, -0.4688017, 3.991611, 1, 1, 1, 1, 1,
0.1679904, -0.7403983, 6.417782, 1, 1, 1, 1, 1,
0.1687006, -0.6782125, 3.392715, 1, 1, 1, 1, 1,
0.1722646, -1.175586, 2.118723, 1, 1, 1, 1, 1,
0.1748843, -0.08473722, 1.385631, 1, 1, 1, 1, 1,
0.1783105, -1.268747, 4.168653, 1, 1, 1, 1, 1,
0.1796743, 1.975233, -0.9699163, 1, 1, 1, 1, 1,
0.1827185, 0.7198552, 0.04859871, 0, 0, 1, 1, 1,
0.1844773, -0.6958243, 1.624154, 1, 0, 0, 1, 1,
0.1848782, -0.2369729, 2.755093, 1, 0, 0, 1, 1,
0.1960856, 0.2365785, 0.949304, 1, 0, 0, 1, 1,
0.2001703, -0.04579481, 3.017191, 1, 0, 0, 1, 1,
0.2008012, 0.5131887, 0.05152408, 1, 0, 0, 1, 1,
0.2027815, 2.045696, 0.7444984, 0, 0, 0, 1, 1,
0.2039625, -0.1283827, 1.380641, 0, 0, 0, 1, 1,
0.2080406, 1.933934, 0.720685, 0, 0, 0, 1, 1,
0.2082477, 0.9516332, -0.5658534, 0, 0, 0, 1, 1,
0.2093132, 0.9079567, 0.337327, 0, 0, 0, 1, 1,
0.211869, 1.636593, -0.456203, 0, 0, 0, 1, 1,
0.222353, 1.103524, -0.3804941, 0, 0, 0, 1, 1,
0.2234359, 1.312862, -0.7611241, 1, 1, 1, 1, 1,
0.2242798, 0.1905732, 1.425476, 1, 1, 1, 1, 1,
0.2264539, -0.9858917, 2.190728, 1, 1, 1, 1, 1,
0.2278707, -0.1296858, 2.365039, 1, 1, 1, 1, 1,
0.2321507, 0.33451, -1.051964, 1, 1, 1, 1, 1,
0.2321876, -0.67444, 2.489994, 1, 1, 1, 1, 1,
0.2401677, 0.5358016, -0.4096262, 1, 1, 1, 1, 1,
0.2405873, -0.554044, 3.712974, 1, 1, 1, 1, 1,
0.2465886, 1.804934, -1.306881, 1, 1, 1, 1, 1,
0.2467278, -0.1306755, 2.577744, 1, 1, 1, 1, 1,
0.2494052, -0.6594667, 1.297109, 1, 1, 1, 1, 1,
0.2509043, -0.7493599, 1.65785, 1, 1, 1, 1, 1,
0.2514178, -0.1744427, 0.5105795, 1, 1, 1, 1, 1,
0.2523049, 1.225568, -0.2703299, 1, 1, 1, 1, 1,
0.2543351, -0.03632288, 4.096272, 1, 1, 1, 1, 1,
0.256442, -0.7658633, 3.265013, 0, 0, 1, 1, 1,
0.2588286, -0.6565729, 2.039456, 1, 0, 0, 1, 1,
0.2614605, -0.6371689, 2.213071, 1, 0, 0, 1, 1,
0.2672309, 0.06048481, 1.56688, 1, 0, 0, 1, 1,
0.2703956, 0.1886977, 1.565305, 1, 0, 0, 1, 1,
0.2719663, -0.2289019, 1.4619, 1, 0, 0, 1, 1,
0.2722397, 0.8470749, 1.509976, 0, 0, 0, 1, 1,
0.2814715, 1.077432, 0.1665658, 0, 0, 0, 1, 1,
0.2819245, 0.4182806, 0.03085342, 0, 0, 0, 1, 1,
0.2822537, 0.694021, 2.364249, 0, 0, 0, 1, 1,
0.2827785, -1.524895, 2.807987, 0, 0, 0, 1, 1,
0.2865937, 1.314981, -0.2878079, 0, 0, 0, 1, 1,
0.2871251, -1.010422, 1.39182, 0, 0, 0, 1, 1,
0.2941494, -1.694687, 4.102674, 1, 1, 1, 1, 1,
0.2974417, 0.1593172, 4.866631, 1, 1, 1, 1, 1,
0.2976063, -1.632243, 4.012566, 1, 1, 1, 1, 1,
0.2978645, -0.2719184, 3.029989, 1, 1, 1, 1, 1,
0.2996162, -0.6367534, 3.055983, 1, 1, 1, 1, 1,
0.3055381, 1.038997, 2.173747, 1, 1, 1, 1, 1,
0.3063644, 1.879865, 0.1223563, 1, 1, 1, 1, 1,
0.3086298, 0.513182, 0.1571657, 1, 1, 1, 1, 1,
0.3091012, -0.07836296, 3.480077, 1, 1, 1, 1, 1,
0.3098808, 0.2720451, 0.6317726, 1, 1, 1, 1, 1,
0.3105716, 0.6424302, -2.162514, 1, 1, 1, 1, 1,
0.3112813, -0.6128122, 2.196762, 1, 1, 1, 1, 1,
0.3144568, 1.714375, -2.167493, 1, 1, 1, 1, 1,
0.3262351, 0.3675314, 0.6416071, 1, 1, 1, 1, 1,
0.3266591, 0.4448822, -0.5828333, 1, 1, 1, 1, 1,
0.3284932, 0.8221443, 0.22659, 0, 0, 1, 1, 1,
0.3297877, 0.7451631, 0.1596896, 1, 0, 0, 1, 1,
0.3328921, -0.5584854, 0.6783535, 1, 0, 0, 1, 1,
0.3352955, 1.205038, 0.9045218, 1, 0, 0, 1, 1,
0.338787, -0.5078767, 3.820206, 1, 0, 0, 1, 1,
0.3431771, -0.7397106, 3.179958, 1, 0, 0, 1, 1,
0.3446718, -2.316844, 2.720656, 0, 0, 0, 1, 1,
0.3461436, 0.4389004, 1.282259, 0, 0, 0, 1, 1,
0.3473487, -1.045177, 6.735979, 0, 0, 0, 1, 1,
0.3486307, 1.271411, 1.139893, 0, 0, 0, 1, 1,
0.3533717, -1.219137, 3.497128, 0, 0, 0, 1, 1,
0.355742, -0.1438609, 1.227948, 0, 0, 0, 1, 1,
0.3574952, -0.5965291, 1.222832, 0, 0, 0, 1, 1,
0.3597827, 0.4761259, -0.3022793, 1, 1, 1, 1, 1,
0.3603432, -2.000808, 3.316573, 1, 1, 1, 1, 1,
0.3620835, -0.6251032, 3.333614, 1, 1, 1, 1, 1,
0.366983, -0.5967507, 2.920829, 1, 1, 1, 1, 1,
0.3710549, -0.5798408, 1.184356, 1, 1, 1, 1, 1,
0.3765887, 1.130242, 1.374595, 1, 1, 1, 1, 1,
0.3853054, -0.09720512, 2.589626, 1, 1, 1, 1, 1,
0.3857717, 0.1724082, 1.359769, 1, 1, 1, 1, 1,
0.3980663, -0.07730386, 1.232166, 1, 1, 1, 1, 1,
0.3998308, 0.9389638, -0.4324079, 1, 1, 1, 1, 1,
0.4048344, 0.8926635, -0.3511494, 1, 1, 1, 1, 1,
0.405723, 0.08734482, 1.046931, 1, 1, 1, 1, 1,
0.4057349, -0.07848947, 1.473998, 1, 1, 1, 1, 1,
0.4057943, -1.425864, 2.976029, 1, 1, 1, 1, 1,
0.4064239, 0.4696023, 0.3872015, 1, 1, 1, 1, 1,
0.4076167, -0.5334399, 1.487865, 0, 0, 1, 1, 1,
0.4080807, 0.2918657, 1.671251, 1, 0, 0, 1, 1,
0.4097066, -0.02923723, 2.197492, 1, 0, 0, 1, 1,
0.4102201, -0.6924874, 2.94328, 1, 0, 0, 1, 1,
0.4157605, 0.5315997, -0.4645094, 1, 0, 0, 1, 1,
0.4184453, 0.2283111, 2.008124, 1, 0, 0, 1, 1,
0.4196377, 1.357528, 0.6797485, 0, 0, 0, 1, 1,
0.4265849, 0.5756842, 0.609975, 0, 0, 0, 1, 1,
0.4286491, -0.3428895, 3.306656, 0, 0, 0, 1, 1,
0.4321344, -0.5038162, 3.409862, 0, 0, 0, 1, 1,
0.4331253, 0.1862794, 1.638271, 0, 0, 0, 1, 1,
0.4334939, 0.04058707, -0.3295262, 0, 0, 0, 1, 1,
0.4349065, -0.1645775, 2.264432, 0, 0, 0, 1, 1,
0.4362133, 1.707679, 0.08534946, 1, 1, 1, 1, 1,
0.436853, -0.7034249, 1.747118, 1, 1, 1, 1, 1,
0.4392161, -0.6765602, 2.271672, 1, 1, 1, 1, 1,
0.441828, -2.22551, 3.346423, 1, 1, 1, 1, 1,
0.4471251, -0.4559447, 3.366014, 1, 1, 1, 1, 1,
0.4493108, 1.258214, 0.2006112, 1, 1, 1, 1, 1,
0.4527057, 0.1572197, 0.3016385, 1, 1, 1, 1, 1,
0.4527577, -0.3773631, 3.592508, 1, 1, 1, 1, 1,
0.4574032, 1.43411, -0.06917115, 1, 1, 1, 1, 1,
0.4584166, -0.4042697, 3.257597, 1, 1, 1, 1, 1,
0.469131, 0.5216931, 0.1510133, 1, 1, 1, 1, 1,
0.4720396, -0.7658384, 2.80444, 1, 1, 1, 1, 1,
0.4756849, -0.2823309, 3.05592, 1, 1, 1, 1, 1,
0.4758936, -0.204442, 3.243613, 1, 1, 1, 1, 1,
0.4768352, -1.112445, 2.669116, 1, 1, 1, 1, 1,
0.4780175, -0.7214978, 1.785112, 0, 0, 1, 1, 1,
0.4790527, -0.2714217, 0.8514233, 1, 0, 0, 1, 1,
0.4835996, 0.7246523, -0.7711338, 1, 0, 0, 1, 1,
0.485002, 0.7768278, 0.825695, 1, 0, 0, 1, 1,
0.4895572, -0.5372258, 1.688497, 1, 0, 0, 1, 1,
0.4906563, 0.865082, 0.2842678, 1, 0, 0, 1, 1,
0.4909831, 0.6055612, -0.8415278, 0, 0, 0, 1, 1,
0.4915426, 1.508139, -0.6608738, 0, 0, 0, 1, 1,
0.4935083, 1.094849, 0.4757006, 0, 0, 0, 1, 1,
0.4977008, -0.392568, 1.992759, 0, 0, 0, 1, 1,
0.5030708, 0.3425556, -0.3562078, 0, 0, 0, 1, 1,
0.5032479, 1.618546, 0.8240059, 0, 0, 0, 1, 1,
0.5073275, -0.7052371, 2.584166, 0, 0, 0, 1, 1,
0.5127804, -0.005794222, 0.4945647, 1, 1, 1, 1, 1,
0.5135781, 0.8873358, 1.10214, 1, 1, 1, 1, 1,
0.5139501, -0.6481989, 3.209624, 1, 1, 1, 1, 1,
0.5161682, 1.518096, 2.312206, 1, 1, 1, 1, 1,
0.5169885, 0.8686585, 1.674261, 1, 1, 1, 1, 1,
0.5195637, -0.7577605, 2.821736, 1, 1, 1, 1, 1,
0.5197774, 0.7016726, 0.2843661, 1, 1, 1, 1, 1,
0.5221493, -0.8648449, 3.250906, 1, 1, 1, 1, 1,
0.5228486, -0.3859704, 3.118672, 1, 1, 1, 1, 1,
0.5273027, -0.2003482, 2.613039, 1, 1, 1, 1, 1,
0.5288777, -0.8596997, 3.458657, 1, 1, 1, 1, 1,
0.5334788, 0.5683306, 0.09729826, 1, 1, 1, 1, 1,
0.5414214, 0.9320785, 0.3498613, 1, 1, 1, 1, 1,
0.5452256, -0.06489105, 2.285697, 1, 1, 1, 1, 1,
0.5482216, 1.51287, -0.7384369, 1, 1, 1, 1, 1,
0.55053, -0.4645401, 0.9957523, 0, 0, 1, 1, 1,
0.5535022, 0.01940062, 0.3597424, 1, 0, 0, 1, 1,
0.5552556, -0.4973899, 3.632358, 1, 0, 0, 1, 1,
0.5556685, 0.4060268, 0.7891697, 1, 0, 0, 1, 1,
0.5572119, -0.6625341, 3.59642, 1, 0, 0, 1, 1,
0.5584117, -0.08115159, 0.360148, 1, 0, 0, 1, 1,
0.5676031, -2.009496, 3.811308, 0, 0, 0, 1, 1,
0.5725921, 1.370652, -0.5095085, 0, 0, 0, 1, 1,
0.5731554, -0.1534666, 2.26089, 0, 0, 0, 1, 1,
0.5766096, 0.734634, 2.623582, 0, 0, 0, 1, 1,
0.5859655, 0.3415554, 2.839938, 0, 0, 0, 1, 1,
0.5882096, -1.120556, 3.07224, 0, 0, 0, 1, 1,
0.5903288, -0.6046401, 3.000149, 0, 0, 0, 1, 1,
0.5923573, -0.5822132, 1.922177, 1, 1, 1, 1, 1,
0.5956641, 0.1644017, -0.03894469, 1, 1, 1, 1, 1,
0.5994292, -0.08833364, 1.871027, 1, 1, 1, 1, 1,
0.6011883, 0.1917703, 1.006836, 1, 1, 1, 1, 1,
0.6023278, -1.770282, 1.625378, 1, 1, 1, 1, 1,
0.6040856, 1.183209, 2.101787, 1, 1, 1, 1, 1,
0.6051759, 0.8230414, -0.1294933, 1, 1, 1, 1, 1,
0.6081088, 0.2199983, 0.664637, 1, 1, 1, 1, 1,
0.6159438, -1.435483, 3.587269, 1, 1, 1, 1, 1,
0.6196749, 0.2070537, -0.5464407, 1, 1, 1, 1, 1,
0.6200061, 0.3397898, 2.00846, 1, 1, 1, 1, 1,
0.6213664, -0.1270341, 2.05585, 1, 1, 1, 1, 1,
0.6230842, 1.386176, 0.7248447, 1, 1, 1, 1, 1,
0.6256822, 0.7945141, -0.04198576, 1, 1, 1, 1, 1,
0.626022, -0.1976547, 2.851074, 1, 1, 1, 1, 1,
0.6260611, -0.4912128, 3.728667, 0, 0, 1, 1, 1,
0.6339447, 0.4448783, -0.108758, 1, 0, 0, 1, 1,
0.6365231, 2.638, 0.9678584, 1, 0, 0, 1, 1,
0.6385218, -1.074964, 2.097448, 1, 0, 0, 1, 1,
0.6385273, 2.889467, 0.9071983, 1, 0, 0, 1, 1,
0.6435912, -1.483743, 3.365014, 1, 0, 0, 1, 1,
0.65093, 1.438309, 2.254014, 0, 0, 0, 1, 1,
0.6518893, -0.2957568, 3.206623, 0, 0, 0, 1, 1,
0.6523581, -0.271882, 1.379898, 0, 0, 0, 1, 1,
0.6573895, -1.476036, 3.009438, 0, 0, 0, 1, 1,
0.6592447, -0.7606385, 1.322086, 0, 0, 0, 1, 1,
0.6729631, -1.164945, 2.973762, 0, 0, 0, 1, 1,
0.6810003, -1.520647, 1.540225, 0, 0, 0, 1, 1,
0.681501, 1.27791, 0.9288478, 1, 1, 1, 1, 1,
0.6845416, 1.500435, 0.4967365, 1, 1, 1, 1, 1,
0.6886513, 0.7474498, 1.075966, 1, 1, 1, 1, 1,
0.6978947, 1.342583, 1.844434, 1, 1, 1, 1, 1,
0.7137514, 1.362854, 1.886486, 1, 1, 1, 1, 1,
0.714663, -0.2894247, 1.523496, 1, 1, 1, 1, 1,
0.7163191, -0.320111, 1.287128, 1, 1, 1, 1, 1,
0.7235899, -1.13464, 1.753648, 1, 1, 1, 1, 1,
0.7239599, -1.102858, 2.72469, 1, 1, 1, 1, 1,
0.7275552, 0.64168, -1.008923, 1, 1, 1, 1, 1,
0.7297201, 0.6169322, 1.163477, 1, 1, 1, 1, 1,
0.7391832, 0.7604005, -0.3274531, 1, 1, 1, 1, 1,
0.7502837, 0.2739887, 1.75759, 1, 1, 1, 1, 1,
0.752809, -1.113982, 2.897425, 1, 1, 1, 1, 1,
0.7539616, -1.782023, 2.593776, 1, 1, 1, 1, 1,
0.7545534, 0.3123101, 0.5690002, 0, 0, 1, 1, 1,
0.7586412, 0.5220476, -0.5632572, 1, 0, 0, 1, 1,
0.7603708, -2.705272, 2.977554, 1, 0, 0, 1, 1,
0.7616459, 0.8345201, 0.9119637, 1, 0, 0, 1, 1,
0.7623808, -0.4532505, 3.852729, 1, 0, 0, 1, 1,
0.7692151, -0.4494469, 0.9771235, 1, 0, 0, 1, 1,
0.7695516, 0.1258741, 2.419617, 0, 0, 0, 1, 1,
0.7730974, 0.9219296, 1.854794, 0, 0, 0, 1, 1,
0.7737072, 0.8847294, 0.7092202, 0, 0, 0, 1, 1,
0.7745364, 0.1565716, 0.2801374, 0, 0, 0, 1, 1,
0.7762289, -0.3914718, 1.972394, 0, 0, 0, 1, 1,
0.7787135, -0.4665626, 2.991699, 0, 0, 0, 1, 1,
0.7797959, 0.8067104, 0.9462961, 0, 0, 0, 1, 1,
0.7803202, -0.6635213, 3.067138, 1, 1, 1, 1, 1,
0.784645, -0.04597021, 0.9497666, 1, 1, 1, 1, 1,
0.7877226, -0.1211102, 2.01808, 1, 1, 1, 1, 1,
0.8115002, -0.5871117, 1.584741, 1, 1, 1, 1, 1,
0.8151711, 0.4528171, 0.416625, 1, 1, 1, 1, 1,
0.8193538, -0.1788285, 0.5098922, 1, 1, 1, 1, 1,
0.8195081, -0.8728654, 2.283665, 1, 1, 1, 1, 1,
0.8231752, 0.7833229, 0.1062005, 1, 1, 1, 1, 1,
0.8318205, -1.217788, 2.499666, 1, 1, 1, 1, 1,
0.8398532, -0.2125232, 2.393535, 1, 1, 1, 1, 1,
0.8401791, 1.275856, 0.6102884, 1, 1, 1, 1, 1,
0.8420403, 0.7925357, 1.408242, 1, 1, 1, 1, 1,
0.8531199, -0.1408556, 1.539608, 1, 1, 1, 1, 1,
0.8545407, -0.2309073, 2.514504, 1, 1, 1, 1, 1,
0.8550363, 1.104811, 1.109284, 1, 1, 1, 1, 1,
0.8587022, -0.08146473, 0.61608, 0, 0, 1, 1, 1,
0.8606561, 1.110992, -1.379308, 1, 0, 0, 1, 1,
0.8643206, -0.8959083, 3.58138, 1, 0, 0, 1, 1,
0.8655016, -2.033587, 3.084897, 1, 0, 0, 1, 1,
0.8663597, 0.5184433, 1.688604, 1, 0, 0, 1, 1,
0.8678648, 0.7707099, 1.049828, 1, 0, 0, 1, 1,
0.8712541, 0.1198041, 1.342077, 0, 0, 0, 1, 1,
0.8797204, 0.3874189, 1.671036, 0, 0, 0, 1, 1,
0.8822621, 0.2094064, 1.56718, 0, 0, 0, 1, 1,
0.8833145, 0.259753, 0.06384969, 0, 0, 0, 1, 1,
0.8839369, 0.3339758, 1.716359, 0, 0, 0, 1, 1,
0.888083, -0.7504112, 2.200329, 0, 0, 0, 1, 1,
0.8893174, -0.3316054, 0.1096879, 0, 0, 0, 1, 1,
0.8922112, 0.6432081, 0.6588016, 1, 1, 1, 1, 1,
0.8956109, 0.8069345, -0.1477355, 1, 1, 1, 1, 1,
0.8963403, 0.08337429, 1.175342, 1, 1, 1, 1, 1,
0.905609, -0.8807774, 1.402844, 1, 1, 1, 1, 1,
0.9196925, 1.769138, 1.024619, 1, 1, 1, 1, 1,
0.923291, -0.3633536, 0.5715548, 1, 1, 1, 1, 1,
0.9237773, -0.3895795, 3.624665, 1, 1, 1, 1, 1,
0.9238269, 0.6456065, 1.135041, 1, 1, 1, 1, 1,
0.9243434, 0.1964134, -0.2286371, 1, 1, 1, 1, 1,
0.9306161, 0.9341626, 2.833217, 1, 1, 1, 1, 1,
0.9319783, -1.551501, 1.37984, 1, 1, 1, 1, 1,
0.9395774, 0.273228, 1.147597, 1, 1, 1, 1, 1,
0.9406561, 1.503415, -0.3285034, 1, 1, 1, 1, 1,
0.9448386, -0.0379047, 3.210459, 1, 1, 1, 1, 1,
0.9547077, 0.04319991, 0.4085814, 1, 1, 1, 1, 1,
0.9619578, 0.4045207, 2.279904, 0, 0, 1, 1, 1,
0.963025, 0.000342973, 2.20927, 1, 0, 0, 1, 1,
0.9662327, -1.400065, 2.662208, 1, 0, 0, 1, 1,
0.9682192, 0.1637483, 3.58413, 1, 0, 0, 1, 1,
0.9685872, 0.2411255, 1.441867, 1, 0, 0, 1, 1,
0.9744653, -0.5973258, 2.89264, 1, 0, 0, 1, 1,
0.9865729, 0.4945158, -0.4682498, 0, 0, 0, 1, 1,
0.9879341, -2.041641, 3.543325, 0, 0, 0, 1, 1,
1.004015, 1.0484, 2.591781, 0, 0, 0, 1, 1,
1.005724, -0.7422664, 1.889223, 0, 0, 0, 1, 1,
1.006698, -0.03072491, 1.050549, 0, 0, 0, 1, 1,
1.012598, -0.4647175, 1.89623, 0, 0, 0, 1, 1,
1.01291, 1.397332, 1.746643, 0, 0, 0, 1, 1,
1.017767, 1.708255, 1.377082, 1, 1, 1, 1, 1,
1.021566, 1.055619, -0.7778481, 1, 1, 1, 1, 1,
1.044284, -0.8938882, 1.566318, 1, 1, 1, 1, 1,
1.048741, -0.5633543, 1.586401, 1, 1, 1, 1, 1,
1.05425, 0.3678468, 2.156092, 1, 1, 1, 1, 1,
1.056832, -0.9383821, 3.61928, 1, 1, 1, 1, 1,
1.061044, -1.938126, 3.94408, 1, 1, 1, 1, 1,
1.068374, 1.177729, 0.003393197, 1, 1, 1, 1, 1,
1.068503, -0.5895436, 2.025186, 1, 1, 1, 1, 1,
1.069123, 2.183135, 0.2831162, 1, 1, 1, 1, 1,
1.071059, -0.2805894, 0.9563863, 1, 1, 1, 1, 1,
1.076127, 0.01836482, 2.295353, 1, 1, 1, 1, 1,
1.085356, 0.9084207, -0.2554042, 1, 1, 1, 1, 1,
1.086766, -0.3502957, 1.487631, 1, 1, 1, 1, 1,
1.088493, 1.31361, -0.4297008, 1, 1, 1, 1, 1,
1.09116, 0.2517298, 2.19195, 0, 0, 1, 1, 1,
1.093424, -1.394724, 2.066906, 1, 0, 0, 1, 1,
1.098999, 1.394869, 0.09730946, 1, 0, 0, 1, 1,
1.0997, -0.8338394, 2.856956, 1, 0, 0, 1, 1,
1.105395, -0.1865075, 1.953574, 1, 0, 0, 1, 1,
1.106897, 0.8477267, 0.2315018, 1, 0, 0, 1, 1,
1.107709, -0.7998282, 2.060938, 0, 0, 0, 1, 1,
1.110258, -0.8614561, 2.243757, 0, 0, 0, 1, 1,
1.111204, 0.2866327, 0.9730905, 0, 0, 0, 1, 1,
1.113708, -1.302275, 3.233375, 0, 0, 0, 1, 1,
1.119619, 0.7945766, 0.3040033, 0, 0, 0, 1, 1,
1.123836, 0.08347115, 2.987521, 0, 0, 0, 1, 1,
1.129434, -0.4750219, 1.597496, 0, 0, 0, 1, 1,
1.131087, -0.01096927, 1.568181, 1, 1, 1, 1, 1,
1.137454, -0.1241667, 2.054242, 1, 1, 1, 1, 1,
1.149321, 0.9608204, 0.6146835, 1, 1, 1, 1, 1,
1.152039, 0.160419, 1.319655, 1, 1, 1, 1, 1,
1.152893, -0.189271, 2.327365, 1, 1, 1, 1, 1,
1.157753, 0.7166221, 1.042984, 1, 1, 1, 1, 1,
1.168401, -1.470391, 1.801227, 1, 1, 1, 1, 1,
1.171775, 1.330972, 0.01083694, 1, 1, 1, 1, 1,
1.174101, 0.3218875, 2.262691, 1, 1, 1, 1, 1,
1.18696, -1.044511, 4.140141, 1, 1, 1, 1, 1,
1.189539, 0.06182488, 1.143888, 1, 1, 1, 1, 1,
1.189701, 1.703983, 0.3180155, 1, 1, 1, 1, 1,
1.192054, -0.7548519, 2.45482, 1, 1, 1, 1, 1,
1.203293, -0.1650035, 1.733353, 1, 1, 1, 1, 1,
1.208817, 0.5720422, 0.3428669, 1, 1, 1, 1, 1,
1.215006, -0.5514188, 1.491317, 0, 0, 1, 1, 1,
1.226843, -1.182224, 3.249597, 1, 0, 0, 1, 1,
1.228664, 0.2398187, 2.380635, 1, 0, 0, 1, 1,
1.23593, 0.4697038, 0.9034258, 1, 0, 0, 1, 1,
1.239195, -1.791474, 2.352431, 1, 0, 0, 1, 1,
1.239868, 0.4495418, 2.194232, 1, 0, 0, 1, 1,
1.242226, -0.8518354, 4.642389, 0, 0, 0, 1, 1,
1.243539, 0.6998659, 0.4563521, 0, 0, 0, 1, 1,
1.24974, -1.162771, 2.040956, 0, 0, 0, 1, 1,
1.251825, -1.515613, 1.463942, 0, 0, 0, 1, 1,
1.258819, 0.4015422, 1.780171, 0, 0, 0, 1, 1,
1.266693, 0.6082764, 0.08521617, 0, 0, 0, 1, 1,
1.271217, 1.615848, 0.3926835, 0, 0, 0, 1, 1,
1.279848, -0.4234035, 2.861893, 1, 1, 1, 1, 1,
1.281364, -0.1311306, 2.828046, 1, 1, 1, 1, 1,
1.289855, -0.9772236, 3.14056, 1, 1, 1, 1, 1,
1.298342, 1.38765, 0.8666161, 1, 1, 1, 1, 1,
1.315501, -1.495664, 0.3294396, 1, 1, 1, 1, 1,
1.316068, -0.6149718, 1.681341, 1, 1, 1, 1, 1,
1.320444, -0.7347858, 1.579082, 1, 1, 1, 1, 1,
1.322657, 0.5225548, 0.8228443, 1, 1, 1, 1, 1,
1.322865, -0.07847696, -0.5770523, 1, 1, 1, 1, 1,
1.326411, 0.5494654, 2.070333, 1, 1, 1, 1, 1,
1.330412, -0.5572234, 2.03491, 1, 1, 1, 1, 1,
1.333262, -0.01298358, 1.763818, 1, 1, 1, 1, 1,
1.343936, -0.03661226, 1.735738, 1, 1, 1, 1, 1,
1.345946, -0.8018522, 1.859779, 1, 1, 1, 1, 1,
1.349699, 0.2251602, 1.893223, 1, 1, 1, 1, 1,
1.350998, 0.9003043, -0.8029406, 0, 0, 1, 1, 1,
1.360752, 0.7989873, 0.9649165, 1, 0, 0, 1, 1,
1.363063, 0.4449447, -0.6027164, 1, 0, 0, 1, 1,
1.363138, 0.1480969, 1.499936, 1, 0, 0, 1, 1,
1.365837, 0.00365083, 1.348857, 1, 0, 0, 1, 1,
1.374858, 0.1978324, -0.1765301, 1, 0, 0, 1, 1,
1.376778, 1.279006, 2.420729, 0, 0, 0, 1, 1,
1.380661, -1.231186, 0.6976129, 0, 0, 0, 1, 1,
1.40473, -0.09493393, 1.049716, 0, 0, 0, 1, 1,
1.42105, 0.4351611, 2.385868, 0, 0, 0, 1, 1,
1.428222, -1.071208, 1.75852, 0, 0, 0, 1, 1,
1.428775, -0.01132751, 1.443827, 0, 0, 0, 1, 1,
1.428878, 1.245561, 0.864067, 0, 0, 0, 1, 1,
1.431248, 0.9601389, 1.418655, 1, 1, 1, 1, 1,
1.454129, 0.4062514, -0.2977763, 1, 1, 1, 1, 1,
1.460071, 0.8072288, 1.558076, 1, 1, 1, 1, 1,
1.499074, 1.002004, 1.446157, 1, 1, 1, 1, 1,
1.509996, 1.557592, -0.6710547, 1, 1, 1, 1, 1,
1.511795, 0.3590584, 3.251652, 1, 1, 1, 1, 1,
1.517786, -0.08556855, 1.587129, 1, 1, 1, 1, 1,
1.540496, 2.856281, 0.7012665, 1, 1, 1, 1, 1,
1.555982, -0.03907162, 1.152682, 1, 1, 1, 1, 1,
1.572261, -1.058146, 1.376212, 1, 1, 1, 1, 1,
1.584157, 1.048404, 1.970978, 1, 1, 1, 1, 1,
1.596492, 1.004808, 1.044999, 1, 1, 1, 1, 1,
1.616759, -1.660541, 4.441008, 1, 1, 1, 1, 1,
1.621741, 1.753053, 1.695526, 1, 1, 1, 1, 1,
1.623367, 1.76693, 0.7594663, 1, 1, 1, 1, 1,
1.637718, 0.4044964, 0.2801622, 0, 0, 1, 1, 1,
1.639605, 0.4059119, 1.672698, 1, 0, 0, 1, 1,
1.652546, -1.258126, 3.114658, 1, 0, 0, 1, 1,
1.706719, -0.05672044, 2.147316, 1, 0, 0, 1, 1,
1.715109, 0.3471476, 2.988838, 1, 0, 0, 1, 1,
1.725361, -0.02901424, 0.296485, 1, 0, 0, 1, 1,
1.738718, -0.8492202, 2.040134, 0, 0, 0, 1, 1,
1.742665, -0.2290024, 2.164875, 0, 0, 0, 1, 1,
1.769836, 1.653442, 1.16423, 0, 0, 0, 1, 1,
1.78495, -1.018778, 1.777259, 0, 0, 0, 1, 1,
1.824999, -0.4688011, 1.443589, 0, 0, 0, 1, 1,
1.828413, -1.005283, 0.8170515, 0, 0, 0, 1, 1,
1.831728, 0.9286237, 1.782926, 0, 0, 0, 1, 1,
1.833511, 0.4168813, 1.81123, 1, 1, 1, 1, 1,
1.834217, 0.458752, 2.13709, 1, 1, 1, 1, 1,
1.837401, 0.2206663, 3.716714, 1, 1, 1, 1, 1,
1.854951, -0.3777222, 1.684067, 1, 1, 1, 1, 1,
1.869656, 0.545094, 2.503581, 1, 1, 1, 1, 1,
1.872705, 0.32305, 0.9666346, 1, 1, 1, 1, 1,
1.876043, -3.016017, 2.582704, 1, 1, 1, 1, 1,
1.879126, 0.3095404, 2.931496, 1, 1, 1, 1, 1,
1.880702, 0.4744655, 1.537585, 1, 1, 1, 1, 1,
1.903275, -0.1007089, 2.303651, 1, 1, 1, 1, 1,
1.942742, 0.7164343, -0.03887399, 1, 1, 1, 1, 1,
1.969131, -0.4302261, 3.613401, 1, 1, 1, 1, 1,
2.0087, -0.3115779, 2.191022, 1, 1, 1, 1, 1,
2.072691, -1.478254, 1.54402, 1, 1, 1, 1, 1,
2.108458, -0.3896484, 1.378153, 1, 1, 1, 1, 1,
2.122548, -0.08657303, 1.537443, 0, 0, 1, 1, 1,
2.140433, 0.3149216, 0.5054936, 1, 0, 0, 1, 1,
2.152131, 1.513289, -0.1698217, 1, 0, 0, 1, 1,
2.161986, -0.06997799, 2.332659, 1, 0, 0, 1, 1,
2.205626, -0.5070909, 0.9535639, 1, 0, 0, 1, 1,
2.224725, -0.5837831, 2.196389, 1, 0, 0, 1, 1,
2.249273, -0.2639099, 0.3271675, 0, 0, 0, 1, 1,
2.276023, 0.5146419, 1.115062, 0, 0, 0, 1, 1,
2.297298, 2.602307, 0.7458794, 0, 0, 0, 1, 1,
2.366207, 0.4630802, 1.159165, 0, 0, 0, 1, 1,
2.37652, -0.6203699, 0.5938437, 0, 0, 0, 1, 1,
2.379475, -0.2791092, 4.4295, 0, 0, 0, 1, 1,
2.403204, 0.9101455, 1.14064, 0, 0, 0, 1, 1,
2.444867, -0.1802427, 1.818306, 1, 1, 1, 1, 1,
2.452819, 1.058477, 1.278445, 1, 1, 1, 1, 1,
2.516659, 0.05340153, 0.4413104, 1, 1, 1, 1, 1,
2.783585, 1.091193, -0.1985696, 1, 1, 1, 1, 1,
2.939533, -0.1813354, 1.545885, 1, 1, 1, 1, 1,
2.958503, 1.089236, 3.290721, 1, 1, 1, 1, 1,
3.109038, 1.356359, 1.934394, 1, 1, 1, 1, 1
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
var radius = 9.870956;
var distance = 34.67131;
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
mvMatrix.translate( -0.03413653, 0.2736076, -0.9103351 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67131);
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
