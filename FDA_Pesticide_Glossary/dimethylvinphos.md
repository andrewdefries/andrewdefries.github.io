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
-3.332013, 0.891305, 0.8683617, 1, 0, 0, 1,
-2.922784, 1.057429, -1.807865, 1, 0.007843138, 0, 1,
-2.825417, -1.696378, -2.882475, 1, 0.01176471, 0, 1,
-2.823731, 2.055006, 0.694157, 1, 0.01960784, 0, 1,
-2.673213, -0.2447031, -3.876624, 1, 0.02352941, 0, 1,
-2.618095, 1.996638, -1.046338, 1, 0.03137255, 0, 1,
-2.513277, -0.004237517, -1.575412, 1, 0.03529412, 0, 1,
-2.445332, -1.072816, -2.389577, 1, 0.04313726, 0, 1,
-2.401375, -1.73315, -2.778919, 1, 0.04705882, 0, 1,
-2.355615, 0.08968673, -1.172078, 1, 0.05490196, 0, 1,
-2.323555, -1.016187, -3.790727, 1, 0.05882353, 0, 1,
-2.31822, 0.07052442, -0.4569143, 1, 0.06666667, 0, 1,
-2.202686, -0.4044374, -1.096953, 1, 0.07058824, 0, 1,
-2.193709, 0.6945332, -0.1066537, 1, 0.07843138, 0, 1,
-2.181558, -0.8983491, -2.137548, 1, 0.08235294, 0, 1,
-2.083026, -1.706152, -1.042444, 1, 0.09019608, 0, 1,
-2.030461, 0.6295882, -2.101513, 1, 0.09411765, 0, 1,
-2.009115, 0.152534, -0.7903117, 1, 0.1019608, 0, 1,
-1.993236, 0.1358628, -0.6563115, 1, 0.1098039, 0, 1,
-1.959112, -0.2064403, -2.88766, 1, 0.1137255, 0, 1,
-1.927691, 0.8493925, -1.586944, 1, 0.1215686, 0, 1,
-1.925537, 1.887064, -1.200024, 1, 0.1254902, 0, 1,
-1.911949, 1.067318, -0.4850705, 1, 0.1333333, 0, 1,
-1.90388, -0.9890544, 0.3142442, 1, 0.1372549, 0, 1,
-1.873984, -0.4966374, -2.571215, 1, 0.145098, 0, 1,
-1.861783, -0.513275, 0.746635, 1, 0.1490196, 0, 1,
-1.840219, 0.1250857, -0.7359297, 1, 0.1568628, 0, 1,
-1.832863, 0.1889447, -1.710781, 1, 0.1607843, 0, 1,
-1.825186, -1.442505, -0.5176921, 1, 0.1686275, 0, 1,
-1.814287, -0.8291471, -2.338081, 1, 0.172549, 0, 1,
-1.807283, -0.926808, -1.312212, 1, 0.1803922, 0, 1,
-1.799662, 0.4035567, -1.889684, 1, 0.1843137, 0, 1,
-1.792971, 1.335137, -0.7705149, 1, 0.1921569, 0, 1,
-1.792304, -0.2870999, -1.85582, 1, 0.1960784, 0, 1,
-1.772895, 0.07082023, 0.8765346, 1, 0.2039216, 0, 1,
-1.736768, 1.134445, -0.2901103, 1, 0.2117647, 0, 1,
-1.727287, 0.883173, -1.651827, 1, 0.2156863, 0, 1,
-1.725481, -1.395377, -1.483293, 1, 0.2235294, 0, 1,
-1.723832, 0.2591581, -0.8708465, 1, 0.227451, 0, 1,
-1.710568, -0.7381903, -1.346387, 1, 0.2352941, 0, 1,
-1.691262, 0.9241693, -1.993803, 1, 0.2392157, 0, 1,
-1.669938, -0.7887798, -2.580853, 1, 0.2470588, 0, 1,
-1.667331, 0.4592387, 0.09535553, 1, 0.2509804, 0, 1,
-1.662817, -0.1642796, -1.510781, 1, 0.2588235, 0, 1,
-1.657958, -0.1484974, -1.803593, 1, 0.2627451, 0, 1,
-1.65578, -0.889572, -3.15538, 1, 0.2705882, 0, 1,
-1.640097, 0.8097795, -2.299303, 1, 0.2745098, 0, 1,
-1.636591, -0.5218412, -2.701175, 1, 0.282353, 0, 1,
-1.636105, -0.6132386, -2.221688, 1, 0.2862745, 0, 1,
-1.63502, -1.746568, -0.9647004, 1, 0.2941177, 0, 1,
-1.625387, -1.417133, -2.144015, 1, 0.3019608, 0, 1,
-1.625364, -0.06572299, -1.930826, 1, 0.3058824, 0, 1,
-1.610031, -0.4475568, -1.09796, 1, 0.3137255, 0, 1,
-1.6077, 0.7864046, -0.9125077, 1, 0.3176471, 0, 1,
-1.576895, -0.6185839, -1.588785, 1, 0.3254902, 0, 1,
-1.570236, 1.288684, -1.927857, 1, 0.3294118, 0, 1,
-1.566915, -1.161157, -2.182963, 1, 0.3372549, 0, 1,
-1.552034, 0.125017, -0.2870493, 1, 0.3411765, 0, 1,
-1.540179, -0.4232019, -2.408512, 1, 0.3490196, 0, 1,
-1.527927, 0.63451, -1.467106, 1, 0.3529412, 0, 1,
-1.51549, 0.3335123, -1.288743, 1, 0.3607843, 0, 1,
-1.511405, 2.169436, -1.103161, 1, 0.3647059, 0, 1,
-1.500491, -0.166644, 0.329836, 1, 0.372549, 0, 1,
-1.496449, -0.2808706, -1.435374, 1, 0.3764706, 0, 1,
-1.490096, -0.8847411, -0.695089, 1, 0.3843137, 0, 1,
-1.476512, -0.5587071, -0.6208758, 1, 0.3882353, 0, 1,
-1.4654, -1.174172, -4.402707, 1, 0.3960784, 0, 1,
-1.454727, 0.5525061, -1.847093, 1, 0.4039216, 0, 1,
-1.450042, -1.32117, -0.01433602, 1, 0.4078431, 0, 1,
-1.439399, 0.9891567, 1.068724, 1, 0.4156863, 0, 1,
-1.437374, -1.180263, -2.406739, 1, 0.4196078, 0, 1,
-1.436786, 0.6589076, -1.079306, 1, 0.427451, 0, 1,
-1.423237, -0.1323983, -1.203419, 1, 0.4313726, 0, 1,
-1.417568, -0.1035819, -0.8642796, 1, 0.4392157, 0, 1,
-1.41729, -1.423488, -2.513605, 1, 0.4431373, 0, 1,
-1.414283, 1.207022, -0.5791373, 1, 0.4509804, 0, 1,
-1.406846, 1.323994, -2.565517, 1, 0.454902, 0, 1,
-1.401511, 0.4431089, -1.859709, 1, 0.4627451, 0, 1,
-1.399165, 0.7168128, -2.046069, 1, 0.4666667, 0, 1,
-1.392327, -0.4475333, -0.7526106, 1, 0.4745098, 0, 1,
-1.384735, 0.1729142, -2.811716, 1, 0.4784314, 0, 1,
-1.384504, -1.064925, -2.892176, 1, 0.4862745, 0, 1,
-1.361617, 0.2688749, -1.255544, 1, 0.4901961, 0, 1,
-1.344003, -0.8414211, -2.799037, 1, 0.4980392, 0, 1,
-1.334334, 0.1521571, -1.243739, 1, 0.5058824, 0, 1,
-1.332807, 0.377041, -2.065931, 1, 0.509804, 0, 1,
-1.326921, -0.3699315, -2.574173, 1, 0.5176471, 0, 1,
-1.318922, -1.24293, -2.342583, 1, 0.5215687, 0, 1,
-1.31674, -2.275675, -1.930421, 1, 0.5294118, 0, 1,
-1.313139, 0.476696, -2.314687, 1, 0.5333334, 0, 1,
-1.301587, -0.3626722, -2.97189, 1, 0.5411765, 0, 1,
-1.298413, 0.4817393, -0.8030211, 1, 0.5450981, 0, 1,
-1.297101, -1.10708, -1.573402, 1, 0.5529412, 0, 1,
-1.292868, 1.035875, 0.0998934, 1, 0.5568628, 0, 1,
-1.289436, -0.3932256, -2.609664, 1, 0.5647059, 0, 1,
-1.286419, -0.0367968, -2.370201, 1, 0.5686275, 0, 1,
-1.284531, -0.3763754, -0.4468172, 1, 0.5764706, 0, 1,
-1.282503, -0.1648107, -2.239272, 1, 0.5803922, 0, 1,
-1.275458, -1.170857, -2.000879, 1, 0.5882353, 0, 1,
-1.261804, 0.8908333, -1.977849, 1, 0.5921569, 0, 1,
-1.258462, 0.185243, -0.5226095, 1, 0.6, 0, 1,
-1.247693, -0.07181992, -0.8753509, 1, 0.6078432, 0, 1,
-1.247467, -0.6398044, -1.598629, 1, 0.6117647, 0, 1,
-1.244263, 0.6274539, -0.8919598, 1, 0.6196079, 0, 1,
-1.244151, -0.4978126, -2.931545, 1, 0.6235294, 0, 1,
-1.23825, -1.999921, -3.682168, 1, 0.6313726, 0, 1,
-1.23433, 0.2774912, -0.7175152, 1, 0.6352941, 0, 1,
-1.23359, -0.6963941, -3.803972, 1, 0.6431373, 0, 1,
-1.217724, -1.477296, -2.316055, 1, 0.6470588, 0, 1,
-1.215143, 0.2828945, -2.560706, 1, 0.654902, 0, 1,
-1.207631, -1.410599, -2.996208, 1, 0.6588235, 0, 1,
-1.199833, 0.4207665, -0.4422347, 1, 0.6666667, 0, 1,
-1.198504, 1.61863, 1.059533, 1, 0.6705883, 0, 1,
-1.190103, 1.788695, 0.2872052, 1, 0.6784314, 0, 1,
-1.189518, 1.169416, -3.060121, 1, 0.682353, 0, 1,
-1.188855, 1.120461, -2.385792, 1, 0.6901961, 0, 1,
-1.187441, 1.615036, 0.1079693, 1, 0.6941177, 0, 1,
-1.18099, 1.860519, 0.56489, 1, 0.7019608, 0, 1,
-1.17385, -0.5515267, -2.032606, 1, 0.7098039, 0, 1,
-1.170734, -1.112122, -2.233345, 1, 0.7137255, 0, 1,
-1.170281, 2.392425, -1.117636, 1, 0.7215686, 0, 1,
-1.168974, 0.6486527, -0.3077484, 1, 0.7254902, 0, 1,
-1.158121, 0.2604695, -1.213964, 1, 0.7333333, 0, 1,
-1.155892, 0.6636947, -0.4692754, 1, 0.7372549, 0, 1,
-1.152326, -1.85353, -3.322821, 1, 0.7450981, 0, 1,
-1.151013, -0.2307823, -3.011335, 1, 0.7490196, 0, 1,
-1.143681, 0.2693047, 0.4695814, 1, 0.7568628, 0, 1,
-1.142384, 1.518862, -1.568803, 1, 0.7607843, 0, 1,
-1.135116, -1.843505, -2.154179, 1, 0.7686275, 0, 1,
-1.114744, -0.06818914, -4.833989, 1, 0.772549, 0, 1,
-1.114473, -0.4316098, -1.739088, 1, 0.7803922, 0, 1,
-1.111043, -0.3020407, 0.513762, 1, 0.7843137, 0, 1,
-1.109938, 0.9012984, -1.574819, 1, 0.7921569, 0, 1,
-1.106363, 2.582024, 0.5439945, 1, 0.7960784, 0, 1,
-1.094618, -0.2832069, -0.8924907, 1, 0.8039216, 0, 1,
-1.09243, -1.954234, -3.46738, 1, 0.8117647, 0, 1,
-1.08979, 1.114828, -1.875465, 1, 0.8156863, 0, 1,
-1.08694, 0.3484674, -1.010264, 1, 0.8235294, 0, 1,
-1.081612, -0.973139, -0.8454573, 1, 0.827451, 0, 1,
-1.079491, 0.2529772, 1.039368, 1, 0.8352941, 0, 1,
-1.076949, 2.279594, 0.3432739, 1, 0.8392157, 0, 1,
-1.074742, 1.242057, -2.002311, 1, 0.8470588, 0, 1,
-1.072822, -0.5130868, -1.84331, 1, 0.8509804, 0, 1,
-1.070798, -1.13624, -1.712831, 1, 0.8588235, 0, 1,
-1.069917, 0.4921782, -2.83416, 1, 0.8627451, 0, 1,
-1.069755, 0.3588034, -2.478175, 1, 0.8705882, 0, 1,
-1.066986, 0.2394646, -0.7790723, 1, 0.8745098, 0, 1,
-1.065998, -0.3042257, -0.9887638, 1, 0.8823529, 0, 1,
-1.060324, -0.1044474, -0.5129336, 1, 0.8862745, 0, 1,
-1.053395, -0.2254491, -3.042508, 1, 0.8941177, 0, 1,
-1.051853, -0.1833089, -2.097347, 1, 0.8980392, 0, 1,
-1.046362, -0.6450457, -2.251395, 1, 0.9058824, 0, 1,
-1.045003, 0.841755, 0.05422055, 1, 0.9137255, 0, 1,
-1.04231, -0.6701958, -2.372417, 1, 0.9176471, 0, 1,
-1.039927, 0.3624684, -1.200716, 1, 0.9254902, 0, 1,
-1.039781, 1.123196, -1.978298, 1, 0.9294118, 0, 1,
-1.031208, -0.8718071, -2.579279, 1, 0.9372549, 0, 1,
-1.024541, -0.6093171, -1.309762, 1, 0.9411765, 0, 1,
-1.020466, -0.2217769, -1.191553, 1, 0.9490196, 0, 1,
-1.01928, 0.2138352, -2.099851, 1, 0.9529412, 0, 1,
-1.015474, -0.7078261, -3.89761, 1, 0.9607843, 0, 1,
-1.011702, -0.4818015, -1.339635, 1, 0.9647059, 0, 1,
-1.005305, 1.221279, -0.4968576, 1, 0.972549, 0, 1,
-1.004709, 0.1244474, -2.524767, 1, 0.9764706, 0, 1,
-1.004412, 0.3124186, -0.9478928, 1, 0.9843137, 0, 1,
-1.002248, 1.552812, 0.2975329, 1, 0.9882353, 0, 1,
-0.9996414, -0.9179804, -2.925109, 1, 0.9960784, 0, 1,
-0.990024, -1.138896, -1.529416, 0.9960784, 1, 0, 1,
-0.9792829, 0.1456269, -0.9539793, 0.9921569, 1, 0, 1,
-0.9790218, -0.06217037, -1.919032, 0.9843137, 1, 0, 1,
-0.9778719, -0.4374178, -0.9360934, 0.9803922, 1, 0, 1,
-0.9747204, 0.4121088, -0.3288819, 0.972549, 1, 0, 1,
-0.9741412, -0.5293303, -1.664604, 0.9686275, 1, 0, 1,
-0.9740314, -0.5365154, -3.77877, 0.9607843, 1, 0, 1,
-0.9659555, 1.889163, -0.1502031, 0.9568627, 1, 0, 1,
-0.9639366, 0.7277748, -2.975464, 0.9490196, 1, 0, 1,
-0.9623952, -0.5244644, -2.754308, 0.945098, 1, 0, 1,
-0.9599276, -1.434453, -4.832576, 0.9372549, 1, 0, 1,
-0.9521362, -1.823331, -2.566117, 0.9333333, 1, 0, 1,
-0.9491223, 1.217459, 0.8119056, 0.9254902, 1, 0, 1,
-0.9464389, -2.179061, -3.591619, 0.9215686, 1, 0, 1,
-0.9432816, -0.5193253, -1.618532, 0.9137255, 1, 0, 1,
-0.9305419, -2.406145, -2.965655, 0.9098039, 1, 0, 1,
-0.9284624, 1.807435, -0.9605843, 0.9019608, 1, 0, 1,
-0.9215158, -1.008755, -3.098822, 0.8941177, 1, 0, 1,
-0.9138274, 0.8184273, 1.356842, 0.8901961, 1, 0, 1,
-0.910359, -1.568019, -2.933547, 0.8823529, 1, 0, 1,
-0.9085592, 0.08340964, -2.372037, 0.8784314, 1, 0, 1,
-0.9055864, -0.676672, -1.539675, 0.8705882, 1, 0, 1,
-0.9045239, 2.465163, -0.5089583, 0.8666667, 1, 0, 1,
-0.9011573, 1.129236, 0.5461918, 0.8588235, 1, 0, 1,
-0.8981149, -0.7647709, -2.051284, 0.854902, 1, 0, 1,
-0.8931489, 1.799683, -1.7597, 0.8470588, 1, 0, 1,
-0.8880742, 0.3113295, -0.1643432, 0.8431373, 1, 0, 1,
-0.8845109, -0.9395077, -2.263171, 0.8352941, 1, 0, 1,
-0.8814159, 0.7601024, -2.641305, 0.8313726, 1, 0, 1,
-0.8780389, -0.1485364, -3.264338, 0.8235294, 1, 0, 1,
-0.8760738, 0.3261279, -0.7062199, 0.8196079, 1, 0, 1,
-0.8756602, -0.993835, -4.530025, 0.8117647, 1, 0, 1,
-0.8731949, 0.04627877, 0.7184227, 0.8078431, 1, 0, 1,
-0.8726652, -1.805111, -3.810919, 0.8, 1, 0, 1,
-0.8655518, 0.355721, -1.543343, 0.7921569, 1, 0, 1,
-0.8621162, -0.2212993, -1.459454, 0.7882353, 1, 0, 1,
-0.860129, 2.336167, 1.559696, 0.7803922, 1, 0, 1,
-0.8546464, 0.2353312, -1.033984, 0.7764706, 1, 0, 1,
-0.8539165, 0.7159454, -0.2818641, 0.7686275, 1, 0, 1,
-0.8536072, 0.02706367, -0.8795807, 0.7647059, 1, 0, 1,
-0.8529338, -2.057027, -4.014307, 0.7568628, 1, 0, 1,
-0.8519545, 1.232229, 0.2429116, 0.7529412, 1, 0, 1,
-0.8517287, -1.504094, -2.294892, 0.7450981, 1, 0, 1,
-0.84983, 1.198241, -2.054907, 0.7411765, 1, 0, 1,
-0.8395343, 0.3085675, -2.690796, 0.7333333, 1, 0, 1,
-0.838092, -0.6190051, -1.886846, 0.7294118, 1, 0, 1,
-0.8370417, -1.494549, -2.439675, 0.7215686, 1, 0, 1,
-0.8368244, -1.01517, -1.998474, 0.7176471, 1, 0, 1,
-0.8357223, 0.4945956, -1.609179, 0.7098039, 1, 0, 1,
-0.8354122, -1.383373, -1.614172, 0.7058824, 1, 0, 1,
-0.8336979, -0.2387564, -1.787813, 0.6980392, 1, 0, 1,
-0.833195, -0.3130599, -1.454656, 0.6901961, 1, 0, 1,
-0.8285342, -1.351702, -2.086255, 0.6862745, 1, 0, 1,
-0.816406, -1.348579, -2.869118, 0.6784314, 1, 0, 1,
-0.8161261, 0.7776093, -1.59705, 0.6745098, 1, 0, 1,
-0.8085732, 0.2644163, -0.2191296, 0.6666667, 1, 0, 1,
-0.8028693, 1.589999, -0.4851998, 0.6627451, 1, 0, 1,
-0.8007339, -0.183655, -0.4443392, 0.654902, 1, 0, 1,
-0.7982011, 0.6682211, -0.7611563, 0.6509804, 1, 0, 1,
-0.786474, 0.14428, -3.296988, 0.6431373, 1, 0, 1,
-0.7845091, 1.346506, -1.273981, 0.6392157, 1, 0, 1,
-0.7844453, -2.256088, -2.152569, 0.6313726, 1, 0, 1,
-0.7829704, 0.9423797, -0.9926444, 0.627451, 1, 0, 1,
-0.7780461, 0.1012284, -1.675357, 0.6196079, 1, 0, 1,
-0.7774582, -0.4301063, -4.336422, 0.6156863, 1, 0, 1,
-0.7681904, -0.2487893, -1.182211, 0.6078432, 1, 0, 1,
-0.7656961, 0.1712409, -1.91081, 0.6039216, 1, 0, 1,
-0.7653741, 0.1509193, -2.459546, 0.5960785, 1, 0, 1,
-0.7647284, 0.1178936, -2.409866, 0.5882353, 1, 0, 1,
-0.7644542, -0.9845646, -2.670242, 0.5843138, 1, 0, 1,
-0.7639444, 0.356097, -1.483534, 0.5764706, 1, 0, 1,
-0.7619103, -1.018929, -0.6838618, 0.572549, 1, 0, 1,
-0.7467116, -0.684092, -2.410511, 0.5647059, 1, 0, 1,
-0.7460471, -0.9553481, -1.74509, 0.5607843, 1, 0, 1,
-0.7450736, 0.8491816, -3.65831, 0.5529412, 1, 0, 1,
-0.7393382, 0.3702527, -1.836183, 0.5490196, 1, 0, 1,
-0.7384844, -0.932528, -2.79286, 0.5411765, 1, 0, 1,
-0.735855, -0.7260608, -2.871719, 0.5372549, 1, 0, 1,
-0.7358188, -0.5645921, -4.079301, 0.5294118, 1, 0, 1,
-0.734909, 1.364242, -0.7647104, 0.5254902, 1, 0, 1,
-0.7345708, 0.1499407, -2.404287, 0.5176471, 1, 0, 1,
-0.7329913, 0.3221376, -1.911327, 0.5137255, 1, 0, 1,
-0.728722, 0.7564269, 0.09046748, 0.5058824, 1, 0, 1,
-0.7235939, -1.011685, -2.177658, 0.5019608, 1, 0, 1,
-0.7224884, 0.2792985, -1.877887, 0.4941176, 1, 0, 1,
-0.7213293, -0.3867768, -1.298778, 0.4862745, 1, 0, 1,
-0.7185513, 0.8011974, -1.047507, 0.4823529, 1, 0, 1,
-0.7142854, 0.04777011, -3.107471, 0.4745098, 1, 0, 1,
-0.7136653, -0.6784118, -3.264399, 0.4705882, 1, 0, 1,
-0.7134994, -0.1346456, -3.057779, 0.4627451, 1, 0, 1,
-0.7120505, 0.8191079, -1.912531, 0.4588235, 1, 0, 1,
-0.7119756, -1.200542, -3.435227, 0.4509804, 1, 0, 1,
-0.710946, -1.757031, -3.06233, 0.4470588, 1, 0, 1,
-0.7080283, -0.03326471, -1.646286, 0.4392157, 1, 0, 1,
-0.7067838, -0.75978, -1.004131, 0.4352941, 1, 0, 1,
-0.7015101, 0.3133834, -2.454165, 0.427451, 1, 0, 1,
-0.6905217, -0.0940702, -3.439339, 0.4235294, 1, 0, 1,
-0.6884569, 0.7290549, -1.387129, 0.4156863, 1, 0, 1,
-0.6872758, -1.131276, -1.696431, 0.4117647, 1, 0, 1,
-0.6863388, 0.7631646, -2.377168, 0.4039216, 1, 0, 1,
-0.6854978, -1.948072, -3.582542, 0.3960784, 1, 0, 1,
-0.6747525, 0.3028741, -1.468304, 0.3921569, 1, 0, 1,
-0.6714575, 0.7783989, -0.7862452, 0.3843137, 1, 0, 1,
-0.6676051, 0.247368, -0.7650811, 0.3803922, 1, 0, 1,
-0.6571371, -0.3934111, -2.649363, 0.372549, 1, 0, 1,
-0.6478407, 1.917896, 0.3630208, 0.3686275, 1, 0, 1,
-0.6418599, 0.5996507, -1.70244, 0.3607843, 1, 0, 1,
-0.6388509, 0.8425744, -1.257609, 0.3568628, 1, 0, 1,
-0.6352568, -2.099455, -3.075939, 0.3490196, 1, 0, 1,
-0.6340471, 1.210339, -0.1189512, 0.345098, 1, 0, 1,
-0.6218255, 0.3676533, -0.2448731, 0.3372549, 1, 0, 1,
-0.6193213, 1.273563, 0.1944381, 0.3333333, 1, 0, 1,
-0.6192671, 0.1164516, -1.634981, 0.3254902, 1, 0, 1,
-0.6146629, 1.42063, -2.262359, 0.3215686, 1, 0, 1,
-0.6129304, 0.2433752, -2.459322, 0.3137255, 1, 0, 1,
-0.6106501, 0.1725365, -1.752053, 0.3098039, 1, 0, 1,
-0.6050079, -0.5010772, -2.332069, 0.3019608, 1, 0, 1,
-0.6046618, 0.6716519, -1.122532, 0.2941177, 1, 0, 1,
-0.6022403, 0.571814, 0.2704365, 0.2901961, 1, 0, 1,
-0.5899441, 1.603623, -1.999814, 0.282353, 1, 0, 1,
-0.5866328, 0.4291164, -0.4935496, 0.2784314, 1, 0, 1,
-0.5857418, -0.5552279, -1.672581, 0.2705882, 1, 0, 1,
-0.5825202, 0.6555432, -2.124336, 0.2666667, 1, 0, 1,
-0.5779424, -0.05576595, -2.693564, 0.2588235, 1, 0, 1,
-0.5733889, 1.024033, -0.8798617, 0.254902, 1, 0, 1,
-0.5667977, -0.4792683, -0.9696777, 0.2470588, 1, 0, 1,
-0.5582551, 0.04807858, -3.320193, 0.2431373, 1, 0, 1,
-0.558253, -0.432433, -2.444999, 0.2352941, 1, 0, 1,
-0.5581067, -1.274305, -3.422246, 0.2313726, 1, 0, 1,
-0.5577421, -0.2224779, -0.4184583, 0.2235294, 1, 0, 1,
-0.5434253, -0.5061346, -1.780927, 0.2196078, 1, 0, 1,
-0.5429115, 1.402372, -1.680233, 0.2117647, 1, 0, 1,
-0.5416126, -0.1172693, -1.961304, 0.2078431, 1, 0, 1,
-0.5400417, 0.6178508, -0.1823912, 0.2, 1, 0, 1,
-0.5391186, -0.4107767, -2.886866, 0.1921569, 1, 0, 1,
-0.5344833, 0.5106176, -1.645701, 0.1882353, 1, 0, 1,
-0.53308, 0.8817458, 0.7043052, 0.1803922, 1, 0, 1,
-0.5293218, 2.454114, 0.1079269, 0.1764706, 1, 0, 1,
-0.5266951, -0.3323128, -2.183992, 0.1686275, 1, 0, 1,
-0.5207099, 0.8452489, -2.231428, 0.1647059, 1, 0, 1,
-0.5087955, -0.9391257, -2.185041, 0.1568628, 1, 0, 1,
-0.5078992, 1.825215, -0.2681468, 0.1529412, 1, 0, 1,
-0.5074821, 1.416492, -0.4662648, 0.145098, 1, 0, 1,
-0.5054169, 1.352508, -1.194538, 0.1411765, 1, 0, 1,
-0.5030162, 0.5950518, -0.9706879, 0.1333333, 1, 0, 1,
-0.5026838, -0.06240356, -0.9628651, 0.1294118, 1, 0, 1,
-0.4987066, 0.3214207, -1.726888, 0.1215686, 1, 0, 1,
-0.4986999, 1.904172, -0.7634959, 0.1176471, 1, 0, 1,
-0.4942895, -0.09237144, -2.605914, 0.1098039, 1, 0, 1,
-0.4939325, -0.3055767, -4.428133, 0.1058824, 1, 0, 1,
-0.490071, -1.088561, -2.451178, 0.09803922, 1, 0, 1,
-0.4893946, 0.4589153, 0.01377129, 0.09019608, 1, 0, 1,
-0.4889872, 0.6259755, -0.4999516, 0.08627451, 1, 0, 1,
-0.4720659, -1.869441, -2.919097, 0.07843138, 1, 0, 1,
-0.4710671, -2.079753, -3.125512, 0.07450981, 1, 0, 1,
-0.4709568, 0.8627728, -2.086928, 0.06666667, 1, 0, 1,
-0.469846, -0.4941162, -1.843505, 0.0627451, 1, 0, 1,
-0.4577866, -0.436709, -1.391351, 0.05490196, 1, 0, 1,
-0.456721, 1.09281, -1.001202, 0.05098039, 1, 0, 1,
-0.4530875, 1.413079, -0.3565665, 0.04313726, 1, 0, 1,
-0.4442006, -0.1696086, -2.433868, 0.03921569, 1, 0, 1,
-0.4438483, 0.07716186, 1.532956, 0.03137255, 1, 0, 1,
-0.4416359, 0.6335471, -0.6566259, 0.02745098, 1, 0, 1,
-0.4361794, -1.011144, -2.215556, 0.01960784, 1, 0, 1,
-0.43587, -1.229612, -3.578923, 0.01568628, 1, 0, 1,
-0.425343, 0.3999368, -0.9232012, 0.007843138, 1, 0, 1,
-0.4204252, -0.1153563, -0.2545727, 0.003921569, 1, 0, 1,
-0.4060163, -0.9635335, -3.194216, 0, 1, 0.003921569, 1,
-0.4030476, -0.5511756, -1.648156, 0, 1, 0.01176471, 1,
-0.4019089, 2.743711, 0.5007128, 0, 1, 0.01568628, 1,
-0.4008762, 0.3361798, -0.6127847, 0, 1, 0.02352941, 1,
-0.3976878, 0.4954571, 0.6258946, 0, 1, 0.02745098, 1,
-0.3963256, 0.03656029, -0.5452891, 0, 1, 0.03529412, 1,
-0.3960924, -0.9412315, -1.700891, 0, 1, 0.03921569, 1,
-0.3958255, -1.392895, -1.893383, 0, 1, 0.04705882, 1,
-0.3956252, -0.1888009, -2.383475, 0, 1, 0.05098039, 1,
-0.3953675, 0.03612714, -0.03405479, 0, 1, 0.05882353, 1,
-0.3930917, -0.5407661, -2.739616, 0, 1, 0.0627451, 1,
-0.388822, -0.2138902, -2.299109, 0, 1, 0.07058824, 1,
-0.3874837, -0.216603, -1.499799, 0, 1, 0.07450981, 1,
-0.3872168, 0.2192771, -1.419557, 0, 1, 0.08235294, 1,
-0.3867088, -1.034463, -2.93408, 0, 1, 0.08627451, 1,
-0.3768474, -0.4924816, -2.221651, 0, 1, 0.09411765, 1,
-0.3761118, 0.316661, -0.9347152, 0, 1, 0.1019608, 1,
-0.3718438, -0.2175493, -1.801765, 0, 1, 0.1058824, 1,
-0.3707013, -1.739549, -2.384587, 0, 1, 0.1137255, 1,
-0.3674766, -0.1626927, -2.454035, 0, 1, 0.1176471, 1,
-0.3647195, 0.1982895, -1.757805, 0, 1, 0.1254902, 1,
-0.36247, -0.03060979, 0.4231104, 0, 1, 0.1294118, 1,
-0.3599334, -0.235792, -1.281831, 0, 1, 0.1372549, 1,
-0.3531848, -1.887983, -2.642857, 0, 1, 0.1411765, 1,
-0.3436005, -0.03597277, -2.704742, 0, 1, 0.1490196, 1,
-0.3430141, 1.003237, -0.09865732, 0, 1, 0.1529412, 1,
-0.3372805, -0.3348183, -1.797037, 0, 1, 0.1607843, 1,
-0.3318261, 0.1984124, 1.006258, 0, 1, 0.1647059, 1,
-0.3304895, -1.276613, -4.079659, 0, 1, 0.172549, 1,
-0.328765, 0.06127115, -3.555412, 0, 1, 0.1764706, 1,
-0.3279358, -1.78025, -3.472727, 0, 1, 0.1843137, 1,
-0.3244531, 0.2843992, -1.241054, 0, 1, 0.1882353, 1,
-0.3221381, -1.287794, -5.846727, 0, 1, 0.1960784, 1,
-0.3210872, -0.8664485, -2.940734, 0, 1, 0.2039216, 1,
-0.3198646, -1.072382, -4.570145, 0, 1, 0.2078431, 1,
-0.3161469, -0.1915506, -3.517533, 0, 1, 0.2156863, 1,
-0.3161271, 0.3854361, -1.008113, 0, 1, 0.2196078, 1,
-0.3156032, 0.1135525, -0.0514756, 0, 1, 0.227451, 1,
-0.3125043, -1.959051, -2.953708, 0, 1, 0.2313726, 1,
-0.3123244, 0.8388216, -0.251957, 0, 1, 0.2392157, 1,
-0.3092059, 1.035038, -1.945549, 0, 1, 0.2431373, 1,
-0.3090233, -1.335815, -4.599263, 0, 1, 0.2509804, 1,
-0.3067656, 0.2431503, -1.698127, 0, 1, 0.254902, 1,
-0.3066652, -1.13732, -1.186805, 0, 1, 0.2627451, 1,
-0.3065914, 0.1745602, -1.120436, 0, 1, 0.2666667, 1,
-0.3064286, 1.340762, 0.99957, 0, 1, 0.2745098, 1,
-0.3007888, 0.7611137, -0.2090554, 0, 1, 0.2784314, 1,
-0.3004033, -0.5206355, -2.609693, 0, 1, 0.2862745, 1,
-0.2974051, 0.2128546, -0.6120905, 0, 1, 0.2901961, 1,
-0.2925899, 0.05058325, -0.7585849, 0, 1, 0.2980392, 1,
-0.2822335, -1.13058, -3.084957, 0, 1, 0.3058824, 1,
-0.280967, 1.248866, -0.8085421, 0, 1, 0.3098039, 1,
-0.2767462, -0.9950395, -3.59053, 0, 1, 0.3176471, 1,
-0.2739525, -0.2329617, -3.268387, 0, 1, 0.3215686, 1,
-0.271015, -0.5247468, -3.866373, 0, 1, 0.3294118, 1,
-0.2686216, -0.8887981, -3.39769, 0, 1, 0.3333333, 1,
-0.2685751, -0.7222161, -2.811348, 0, 1, 0.3411765, 1,
-0.266034, -0.04280291, -1.769906, 0, 1, 0.345098, 1,
-0.2657405, -1.822324, -3.47329, 0, 1, 0.3529412, 1,
-0.2653501, 2.155799, 0.1288323, 0, 1, 0.3568628, 1,
-0.2645627, 1.758987, 2.211892, 0, 1, 0.3647059, 1,
-0.2632904, 0.6211231, 1.714679, 0, 1, 0.3686275, 1,
-0.2624601, -0.1494448, -2.835406, 0, 1, 0.3764706, 1,
-0.2618682, -0.6694833, -2.863938, 0, 1, 0.3803922, 1,
-0.260286, 2.022997, 0.647338, 0, 1, 0.3882353, 1,
-0.2602508, 0.4026574, 0.4058156, 0, 1, 0.3921569, 1,
-0.2572761, 0.8957627, -0.7410967, 0, 1, 0.4, 1,
-0.2486374, -0.2549437, -2.621298, 0, 1, 0.4078431, 1,
-0.2458298, 0.7431618, -2.020992, 0, 1, 0.4117647, 1,
-0.240246, 1.121192, -1.410384, 0, 1, 0.4196078, 1,
-0.2400243, -0.09398881, -1.237589, 0, 1, 0.4235294, 1,
-0.2370804, 0.863654, 0.1216344, 0, 1, 0.4313726, 1,
-0.2369019, -0.2361953, -1.536303, 0, 1, 0.4352941, 1,
-0.2286469, 0.3952894, -1.882361, 0, 1, 0.4431373, 1,
-0.2232653, -0.8824195, -1.215363, 0, 1, 0.4470588, 1,
-0.2186478, 0.04191886, -2.187899, 0, 1, 0.454902, 1,
-0.216546, -0.1850465, -2.619317, 0, 1, 0.4588235, 1,
-0.2128722, 0.5744969, 0.05145273, 0, 1, 0.4666667, 1,
-0.2114913, 1.229694, -1.097583, 0, 1, 0.4705882, 1,
-0.2107107, -0.1053594, -2.824654, 0, 1, 0.4784314, 1,
-0.2077434, 0.1284315, -0.6445374, 0, 1, 0.4823529, 1,
-0.2007838, -0.1128005, -0.6923096, 0, 1, 0.4901961, 1,
-0.1999985, 0.2390354, 0.3161218, 0, 1, 0.4941176, 1,
-0.1952848, 0.6427934, -1.969081, 0, 1, 0.5019608, 1,
-0.1941003, 0.2982297, -1.373836, 0, 1, 0.509804, 1,
-0.1930127, -0.7361306, -2.537393, 0, 1, 0.5137255, 1,
-0.1925114, 1.281781, 1.08951, 0, 1, 0.5215687, 1,
-0.1918767, 0.813149, -2.563137, 0, 1, 0.5254902, 1,
-0.1894477, -1.254494, -1.347975, 0, 1, 0.5333334, 1,
-0.1788974, 1.48767, 1.957772, 0, 1, 0.5372549, 1,
-0.1773331, 0.9637206, 1.190874, 0, 1, 0.5450981, 1,
-0.1745567, -0.7771875, -4.017447, 0, 1, 0.5490196, 1,
-0.1743822, 0.04270436, -0.5055947, 0, 1, 0.5568628, 1,
-0.1716262, 1.468151, -0.6242127, 0, 1, 0.5607843, 1,
-0.1707089, -1.066213, -3.13147, 0, 1, 0.5686275, 1,
-0.167038, -0.5783823, -2.590947, 0, 1, 0.572549, 1,
-0.1621548, -0.04894528, -0.5699071, 0, 1, 0.5803922, 1,
-0.1619732, -1.148218, -2.512131, 0, 1, 0.5843138, 1,
-0.1548989, -0.3412649, -3.376053, 0, 1, 0.5921569, 1,
-0.1536025, -0.4472881, -3.432247, 0, 1, 0.5960785, 1,
-0.1495069, -0.2252654, -2.454362, 0, 1, 0.6039216, 1,
-0.1475865, -0.3022643, -2.300071, 0, 1, 0.6117647, 1,
-0.147107, -1.241187, -2.203737, 0, 1, 0.6156863, 1,
-0.1449643, -0.3149647, -4.063986, 0, 1, 0.6235294, 1,
-0.1432247, -0.1679729, -1.895259, 0, 1, 0.627451, 1,
-0.1411495, 1.013519, -0.773228, 0, 1, 0.6352941, 1,
-0.1408523, 0.3090366, 0.1774355, 0, 1, 0.6392157, 1,
-0.1375333, 0.4153236, -0.9095985, 0, 1, 0.6470588, 1,
-0.1309877, -1.941551, -4.414735, 0, 1, 0.6509804, 1,
-0.1264559, 1.22489, 1.846001, 0, 1, 0.6588235, 1,
-0.1252597, -0.3018349, -2.258769, 0, 1, 0.6627451, 1,
-0.1242331, 0.3076389, 0.3121788, 0, 1, 0.6705883, 1,
-0.1234772, 1.411324, 0.6213616, 0, 1, 0.6745098, 1,
-0.1204147, 0.08437544, -1.874614, 0, 1, 0.682353, 1,
-0.1203792, -0.8419839, -2.581658, 0, 1, 0.6862745, 1,
-0.1184916, 1.102843, -2.500727, 0, 1, 0.6941177, 1,
-0.117991, 0.7517928, 0.5174978, 0, 1, 0.7019608, 1,
-0.1098345, -0.4700926, -3.136885, 0, 1, 0.7058824, 1,
-0.1096656, 0.2596356, 0.852012, 0, 1, 0.7137255, 1,
-0.1092799, 1.288076, -0.03108507, 0, 1, 0.7176471, 1,
-0.1037207, -2.101793, -4.259847, 0, 1, 0.7254902, 1,
-0.1015488, -0.6104582, -4.751775, 0, 1, 0.7294118, 1,
-0.09672227, -1.456742, -3.545979, 0, 1, 0.7372549, 1,
-0.09599297, -0.4291647, -3.455937, 0, 1, 0.7411765, 1,
-0.09488039, 1.266184, -0.1940507, 0, 1, 0.7490196, 1,
-0.09470256, -0.6633551, -3.83117, 0, 1, 0.7529412, 1,
-0.09390891, 1.209635, -1.080435, 0, 1, 0.7607843, 1,
-0.09350951, -0.07713315, -3.882531, 0, 1, 0.7647059, 1,
-0.09085388, 2.823722, 0.7571816, 0, 1, 0.772549, 1,
-0.0888336, 0.3862716, -2.015006, 0, 1, 0.7764706, 1,
-0.08304906, -0.6496213, -1.566662, 0, 1, 0.7843137, 1,
-0.07824782, -0.2689495, -2.109211, 0, 1, 0.7882353, 1,
-0.07667047, 0.02447048, 1.199371, 0, 1, 0.7960784, 1,
-0.07253082, -1.172931, -3.626227, 0, 1, 0.8039216, 1,
-0.07068657, -0.03484476, -2.164388, 0, 1, 0.8078431, 1,
-0.06628462, -0.9137894, -4.501287, 0, 1, 0.8156863, 1,
-0.05610149, -1.252062, -3.817637, 0, 1, 0.8196079, 1,
-0.05252111, -0.3180725, -1.199974, 0, 1, 0.827451, 1,
-0.05239144, 1.607354, -0.02031127, 0, 1, 0.8313726, 1,
-0.05115022, -0.2161674, -3.251853, 0, 1, 0.8392157, 1,
-0.05054865, -0.7348352, -4.055843, 0, 1, 0.8431373, 1,
-0.04809282, -0.3760993, -5.148016, 0, 1, 0.8509804, 1,
-0.04214342, 1.277777, -1.534878, 0, 1, 0.854902, 1,
-0.04062354, 0.7492372, -0.928025, 0, 1, 0.8627451, 1,
-0.03596129, 0.3207276, 0.03870135, 0, 1, 0.8666667, 1,
-0.03498017, -1.555939, -4.598302, 0, 1, 0.8745098, 1,
-0.03263374, -0.1073861, -1.109949, 0, 1, 0.8784314, 1,
-0.02672502, -1.547756, -3.518608, 0, 1, 0.8862745, 1,
-0.02656124, -0.3565513, -3.767307, 0, 1, 0.8901961, 1,
-0.02205255, -2.589981, -2.735687, 0, 1, 0.8980392, 1,
-0.0201735, -0.4489538, -2.451409, 0, 1, 0.9058824, 1,
-0.01941908, -1.022517, -5.230274, 0, 1, 0.9098039, 1,
-0.01881961, 1.093619, -0.3740674, 0, 1, 0.9176471, 1,
-0.01827982, -0.7655455, -1.747898, 0, 1, 0.9215686, 1,
-0.01484692, 1.118215, 0.8186628, 0, 1, 0.9294118, 1,
-0.01088197, 0.6554583, 0.3362066, 0, 1, 0.9333333, 1,
-0.009936366, -0.4473902, -3.877616, 0, 1, 0.9411765, 1,
0.001234222, -1.675573, 2.907795, 0, 1, 0.945098, 1,
0.001546117, 0.5983893, 0.5594044, 0, 1, 0.9529412, 1,
0.005392977, 0.4635895, -2.07218, 0, 1, 0.9568627, 1,
0.008875486, -0.5483534, 2.766425, 0, 1, 0.9647059, 1,
0.01247466, 0.9088495, -0.8394815, 0, 1, 0.9686275, 1,
0.01300919, -0.1764105, 2.923415, 0, 1, 0.9764706, 1,
0.01317446, -0.4107337, 2.201793, 0, 1, 0.9803922, 1,
0.01420282, 0.1479441, -0.3918927, 0, 1, 0.9882353, 1,
0.01715666, -1.009288, 3.328552, 0, 1, 0.9921569, 1,
0.01944565, 0.4111092, 0.30434, 0, 1, 1, 1,
0.01990506, 0.8364216, 1.47034, 0, 0.9921569, 1, 1,
0.02273678, 0.3712677, 0.9483077, 0, 0.9882353, 1, 1,
0.02327353, -0.8041946, 3.270945, 0, 0.9803922, 1, 1,
0.02593469, 0.6502314, -0.003765999, 0, 0.9764706, 1, 1,
0.02675481, -2.074239, 2.676375, 0, 0.9686275, 1, 1,
0.03287706, -1.920216, 4.140454, 0, 0.9647059, 1, 1,
0.03342462, -2.017738, 1.428102, 0, 0.9568627, 1, 1,
0.03610962, 1.226301, 1.407099, 0, 0.9529412, 1, 1,
0.03660248, 0.7582016, 0.2596306, 0, 0.945098, 1, 1,
0.03988625, 0.9788334, 1.133441, 0, 0.9411765, 1, 1,
0.04347591, 0.5152431, -1.112477, 0, 0.9333333, 1, 1,
0.04650748, 1.610421, -1.104449, 0, 0.9294118, 1, 1,
0.04808082, 2.11559, -0.8209546, 0, 0.9215686, 1, 1,
0.05082241, -1.474404, 2.655982, 0, 0.9176471, 1, 1,
0.05162052, -1.408796, 1.632447, 0, 0.9098039, 1, 1,
0.05350073, 0.8137736, 0.5618899, 0, 0.9058824, 1, 1,
0.05436545, 1.052538, -0.3017554, 0, 0.8980392, 1, 1,
0.0552034, -0.5035288, 2.712321, 0, 0.8901961, 1, 1,
0.05887176, 0.5168523, -0.4459184, 0, 0.8862745, 1, 1,
0.05891906, 0.1580233, 0.2414167, 0, 0.8784314, 1, 1,
0.06272531, -0.2555707, 3.213607, 0, 0.8745098, 1, 1,
0.06377511, -1.490366, 0.7716334, 0, 0.8666667, 1, 1,
0.06695637, -0.3803568, 3.817771, 0, 0.8627451, 1, 1,
0.07363235, 1.184034, 1.399056, 0, 0.854902, 1, 1,
0.0746995, -0.520261, 4.923095, 0, 0.8509804, 1, 1,
0.07782875, -0.8076368, 2.111551, 0, 0.8431373, 1, 1,
0.07887504, -1.068696, 4.088354, 0, 0.8392157, 1, 1,
0.08463547, -0.8935109, 2.571027, 0, 0.8313726, 1, 1,
0.08744545, -1.83595, 3.484097, 0, 0.827451, 1, 1,
0.08762647, 0.5099112, 0.5908062, 0, 0.8196079, 1, 1,
0.08861534, -3.130307, 2.986154, 0, 0.8156863, 1, 1,
0.08907231, -0.6888825, 3.551135, 0, 0.8078431, 1, 1,
0.09483272, 0.7762508, 1.15282, 0, 0.8039216, 1, 1,
0.09560391, 0.7110299, -0.3225738, 0, 0.7960784, 1, 1,
0.09574693, 0.1842443, -0.07857739, 0, 0.7882353, 1, 1,
0.09732699, -1.271461, 3.066341, 0, 0.7843137, 1, 1,
0.09734756, -2.151166, 2.976819, 0, 0.7764706, 1, 1,
0.09919106, -0.5034836, 3.400198, 0, 0.772549, 1, 1,
0.09952125, -0.9084775, 1.86173, 0, 0.7647059, 1, 1,
0.09957489, -0.1829304, 1.815451, 0, 0.7607843, 1, 1,
0.0996225, -0.3986773, 3.834639, 0, 0.7529412, 1, 1,
0.1023347, 0.5683827, -1.910477, 0, 0.7490196, 1, 1,
0.1041049, 0.04907688, 0.9349068, 0, 0.7411765, 1, 1,
0.1116505, 0.1321242, -1.065415, 0, 0.7372549, 1, 1,
0.112038, 0.1896432, -0.2859804, 0, 0.7294118, 1, 1,
0.112773, -0.1460508, 2.637291, 0, 0.7254902, 1, 1,
0.1245334, -0.3620786, 2.876308, 0, 0.7176471, 1, 1,
0.1248518, 0.08195647, 2.229355, 0, 0.7137255, 1, 1,
0.127228, -0.2399835, 4.013184, 0, 0.7058824, 1, 1,
0.1452733, -0.4941819, 2.300356, 0, 0.6980392, 1, 1,
0.1459493, 0.1763911, 0.6633202, 0, 0.6941177, 1, 1,
0.1496381, 0.6223797, 0.8187158, 0, 0.6862745, 1, 1,
0.1527166, 0.5525515, -0.02951356, 0, 0.682353, 1, 1,
0.159429, 2.353451, -1.776244, 0, 0.6745098, 1, 1,
0.1599759, -1.237085, 5.407358, 0, 0.6705883, 1, 1,
0.160661, -0.1180602, 3.094505, 0, 0.6627451, 1, 1,
0.1647737, -0.2648713, 0.7612914, 0, 0.6588235, 1, 1,
0.1651584, -0.4364873, 2.535846, 0, 0.6509804, 1, 1,
0.1738046, -0.06962826, 2.815782, 0, 0.6470588, 1, 1,
0.1739781, -1.05829, 3.396861, 0, 0.6392157, 1, 1,
0.1745193, 1.941092, -0.2776863, 0, 0.6352941, 1, 1,
0.1867917, 0.7773734, 1.108018, 0, 0.627451, 1, 1,
0.1950692, -0.2312182, 2.174382, 0, 0.6235294, 1, 1,
0.1951063, -0.8755534, 1.604166, 0, 0.6156863, 1, 1,
0.2024586, 0.6225728, 1.542953, 0, 0.6117647, 1, 1,
0.2117562, 0.8339691, 0.8943761, 0, 0.6039216, 1, 1,
0.2129896, -0.112647, 1.921425, 0, 0.5960785, 1, 1,
0.2142827, 0.6638492, 0.8094904, 0, 0.5921569, 1, 1,
0.2166625, -0.8461879, 2.537309, 0, 0.5843138, 1, 1,
0.2231341, 0.04743139, 1.218258, 0, 0.5803922, 1, 1,
0.2271276, 0.7225515, 3.403295, 0, 0.572549, 1, 1,
0.2282256, 0.7071741, -0.01833739, 0, 0.5686275, 1, 1,
0.2313939, 0.5407293, 0.360825, 0, 0.5607843, 1, 1,
0.2339296, -1.726498, 5.383433, 0, 0.5568628, 1, 1,
0.2345563, 0.1485494, 1.402363, 0, 0.5490196, 1, 1,
0.2371975, -1.547545, 3.250889, 0, 0.5450981, 1, 1,
0.2396009, -0.1442414, 3.109281, 0, 0.5372549, 1, 1,
0.2408764, 2.51312, -0.3180893, 0, 0.5333334, 1, 1,
0.2410093, -0.4285138, 1.174597, 0, 0.5254902, 1, 1,
0.241293, -1.103372, 1.882172, 0, 0.5215687, 1, 1,
0.2453294, 0.04289073, 2.340584, 0, 0.5137255, 1, 1,
0.2478641, -0.9250077, 4.809381, 0, 0.509804, 1, 1,
0.2490196, -1.626899, 2.369797, 0, 0.5019608, 1, 1,
0.2500846, -0.3763334, 1.738384, 0, 0.4941176, 1, 1,
0.2540402, 0.2551073, 0.1504767, 0, 0.4901961, 1, 1,
0.2545559, 1.466002, 0.5272959, 0, 0.4823529, 1, 1,
0.2580168, 1.251029, 1.426037, 0, 0.4784314, 1, 1,
0.2596729, 1.393394, 0.4396331, 0, 0.4705882, 1, 1,
0.260488, 0.4735473, 0.2053533, 0, 0.4666667, 1, 1,
0.2630701, 0.991316, -0.6054289, 0, 0.4588235, 1, 1,
0.2662663, -0.2389727, 2.19247, 0, 0.454902, 1, 1,
0.2716163, 0.05692286, 2.46094, 0, 0.4470588, 1, 1,
0.2718983, 0.5160912, 1.979224, 0, 0.4431373, 1, 1,
0.2742759, -2.170867, 3.231486, 0, 0.4352941, 1, 1,
0.2748163, -1.004699, 3.639764, 0, 0.4313726, 1, 1,
0.2942966, -0.6742745, 2.630289, 0, 0.4235294, 1, 1,
0.2962824, -1.971135, 3.347416, 0, 0.4196078, 1, 1,
0.2971494, -0.5747671, 1.74515, 0, 0.4117647, 1, 1,
0.298033, 0.6961961, 0.5871091, 0, 0.4078431, 1, 1,
0.3031964, 1.194983, 0.1086734, 0, 0.4, 1, 1,
0.3055433, 0.06041271, 1.410706, 0, 0.3921569, 1, 1,
0.3056684, 0.4846639, -0.9456648, 0, 0.3882353, 1, 1,
0.3142146, 0.736445, -0.3197699, 0, 0.3803922, 1, 1,
0.3144354, -0.8011804, 1.808877, 0, 0.3764706, 1, 1,
0.3154933, -0.36329, 2.241235, 0, 0.3686275, 1, 1,
0.31613, 0.338055, 0.6574484, 0, 0.3647059, 1, 1,
0.3164791, -0.8220959, 2.015845, 0, 0.3568628, 1, 1,
0.3178879, 0.02951218, 0.933374, 0, 0.3529412, 1, 1,
0.3253614, 2.722077, -0.5448828, 0, 0.345098, 1, 1,
0.3312936, 0.623617, -0.7385123, 0, 0.3411765, 1, 1,
0.3330563, -0.04199725, 2.841279, 0, 0.3333333, 1, 1,
0.3345871, -1.579902, 3.819981, 0, 0.3294118, 1, 1,
0.3374043, 0.2682097, -0.2582603, 0, 0.3215686, 1, 1,
0.3384069, -0.7052541, 1.773182, 0, 0.3176471, 1, 1,
0.3417443, -1.022197, 2.906364, 0, 0.3098039, 1, 1,
0.3432803, -1.458079, 3.354976, 0, 0.3058824, 1, 1,
0.3483034, -0.2943226, 1.228854, 0, 0.2980392, 1, 1,
0.3490983, 0.1402979, -1.393919, 0, 0.2901961, 1, 1,
0.3492738, 0.1941543, 0.4025705, 0, 0.2862745, 1, 1,
0.3496111, -0.228689, 1.469487, 0, 0.2784314, 1, 1,
0.353635, 0.05858829, 2.956229, 0, 0.2745098, 1, 1,
0.3547384, -0.4248303, 1.480379, 0, 0.2666667, 1, 1,
0.3570222, 1.538419, -0.2676376, 0, 0.2627451, 1, 1,
0.3575388, -1.048918, 3.574814, 0, 0.254902, 1, 1,
0.3594985, -0.1874859, 0.6265031, 0, 0.2509804, 1, 1,
0.3634835, -0.8370116, 3.821857, 0, 0.2431373, 1, 1,
0.3665531, -0.6053864, 0.837498, 0, 0.2392157, 1, 1,
0.3733789, 0.1149696, 1.385855, 0, 0.2313726, 1, 1,
0.3761455, 0.9886687, -0.2498216, 0, 0.227451, 1, 1,
0.3763612, 1.27508, 0.8697829, 0, 0.2196078, 1, 1,
0.3765135, -1.888926, 3.371196, 0, 0.2156863, 1, 1,
0.3766485, 0.5994345, 2.421261, 0, 0.2078431, 1, 1,
0.3768867, 0.5178391, 0.4405368, 0, 0.2039216, 1, 1,
0.3794446, 1.561681, -0.4260076, 0, 0.1960784, 1, 1,
0.385359, -0.07685577, 0.9552101, 0, 0.1882353, 1, 1,
0.3882535, -0.5946874, 1.698588, 0, 0.1843137, 1, 1,
0.3910738, 0.7290136, 0.03402968, 0, 0.1764706, 1, 1,
0.3946089, -1.814005, 4.132531, 0, 0.172549, 1, 1,
0.399821, -1.168107, 2.953894, 0, 0.1647059, 1, 1,
0.4032318, -1.017644, 2.307863, 0, 0.1607843, 1, 1,
0.4050674, 0.5221828, 0.3083222, 0, 0.1529412, 1, 1,
0.4110612, 1.492688, -1.090292, 0, 0.1490196, 1, 1,
0.4149034, -0.07971463, 1.341943, 0, 0.1411765, 1, 1,
0.416416, -0.8601748, 2.546723, 0, 0.1372549, 1, 1,
0.4181772, 0.0461631, 2.632827, 0, 0.1294118, 1, 1,
0.4189248, 1.821285, 1.564725, 0, 0.1254902, 1, 1,
0.425309, 0.9907757, 0.7573011, 0, 0.1176471, 1, 1,
0.4278785, 0.231499, 1.616395, 0, 0.1137255, 1, 1,
0.4279168, -0.8181221, 1.551134, 0, 0.1058824, 1, 1,
0.434816, 0.7541592, 0.2624084, 0, 0.09803922, 1, 1,
0.4358031, -0.7274736, 2.697375, 0, 0.09411765, 1, 1,
0.4382724, 0.7535411, 0.384605, 0, 0.08627451, 1, 1,
0.4384729, -0.1661882, 2.19299, 0, 0.08235294, 1, 1,
0.441614, 0.2401471, 0.6297092, 0, 0.07450981, 1, 1,
0.442311, -0.2907223, 3.582329, 0, 0.07058824, 1, 1,
0.4465848, -0.6938384, 2.591212, 0, 0.0627451, 1, 1,
0.4499121, -0.07321984, 1.024494, 0, 0.05882353, 1, 1,
0.4510817, 0.8800475, -1.789285, 0, 0.05098039, 1, 1,
0.4581563, -1.215652, 1.787249, 0, 0.04705882, 1, 1,
0.460458, -0.5961758, 4.590089, 0, 0.03921569, 1, 1,
0.4610758, 1.317948, 0.216249, 0, 0.03529412, 1, 1,
0.4621234, -1.411048, 3.201221, 0, 0.02745098, 1, 1,
0.4626562, -1.836055, 2.326394, 0, 0.02352941, 1, 1,
0.462667, -1.133605, 1.990421, 0, 0.01568628, 1, 1,
0.4699076, 1.163267, 0.2628508, 0, 0.01176471, 1, 1,
0.4703812, -0.6041144, -0.7699692, 0, 0.003921569, 1, 1,
0.4745839, 0.2880303, 0.5679496, 0.003921569, 0, 1, 1,
0.4789959, -0.1133399, 3.175284, 0.007843138, 0, 1, 1,
0.4790668, 0.8740777, 0.5236451, 0.01568628, 0, 1, 1,
0.4840278, -0.6004261, 2.612719, 0.01960784, 0, 1, 1,
0.4856674, 1.061877, 0.5116597, 0.02745098, 0, 1, 1,
0.4859069, -1.609206, 2.587354, 0.03137255, 0, 1, 1,
0.4882101, 0.1604134, -1.419532, 0.03921569, 0, 1, 1,
0.4904862, 0.04516061, 1.914183, 0.04313726, 0, 1, 1,
0.4940214, 0.3447873, 0.4721989, 0.05098039, 0, 1, 1,
0.4996588, 0.3206338, 0.3040905, 0.05490196, 0, 1, 1,
0.5008219, 2.395745, 0.02837752, 0.0627451, 0, 1, 1,
0.5138209, 0.5920054, 1.369637, 0.06666667, 0, 1, 1,
0.515893, -0.02255533, 0.5128285, 0.07450981, 0, 1, 1,
0.5159562, 1.071536, 0.06894606, 0.07843138, 0, 1, 1,
0.5171504, 0.3382614, 0.2638184, 0.08627451, 0, 1, 1,
0.5172966, 0.8252299, 1.635978, 0.09019608, 0, 1, 1,
0.5242759, 1.875261, 0.7812867, 0.09803922, 0, 1, 1,
0.5248106, 1.554496, 0.4276404, 0.1058824, 0, 1, 1,
0.5286903, -1.427794, 2.405362, 0.1098039, 0, 1, 1,
0.5317069, -0.9892783, 3.197008, 0.1176471, 0, 1, 1,
0.5319732, 0.5515525, 2.364193, 0.1215686, 0, 1, 1,
0.5329455, -0.9733199, 4.592256, 0.1294118, 0, 1, 1,
0.5337557, -0.7479324, 3.660216, 0.1333333, 0, 1, 1,
0.53472, 0.6647276, 0.3149272, 0.1411765, 0, 1, 1,
0.5354216, 0.7637185, 1.930478, 0.145098, 0, 1, 1,
0.5357823, -1.467753, 2.166292, 0.1529412, 0, 1, 1,
0.5367417, 0.4765181, 1.345514, 0.1568628, 0, 1, 1,
0.5400259, 0.5540987, 0.2623121, 0.1647059, 0, 1, 1,
0.5417702, -0.8187275, 4.567026, 0.1686275, 0, 1, 1,
0.5439048, -0.3381004, 1.667692, 0.1764706, 0, 1, 1,
0.5459735, 2.190776, 1.070629, 0.1803922, 0, 1, 1,
0.5516802, 0.6145463, -1.27612, 0.1882353, 0, 1, 1,
0.5540084, 0.8676057, -0.1967064, 0.1921569, 0, 1, 1,
0.5546961, -0.01304019, -0.08022351, 0.2, 0, 1, 1,
0.5561096, 0.1543947, 2.616358, 0.2078431, 0, 1, 1,
0.5564247, 0.334633, 1.044772, 0.2117647, 0, 1, 1,
0.5588672, -1.148195, 1.055389, 0.2196078, 0, 1, 1,
0.5595865, 2.045759, -0.6106846, 0.2235294, 0, 1, 1,
0.562618, 0.4343972, 0.9520892, 0.2313726, 0, 1, 1,
0.5639396, -1.990498, 2.856336, 0.2352941, 0, 1, 1,
0.5649977, 1.088259, -0.5588329, 0.2431373, 0, 1, 1,
0.5672512, 0.02424644, 3.184802, 0.2470588, 0, 1, 1,
0.5681678, -0.9549036, 1.086647, 0.254902, 0, 1, 1,
0.5697665, -1.043345, 5.347235, 0.2588235, 0, 1, 1,
0.5757506, 0.2336833, 1.543134, 0.2666667, 0, 1, 1,
0.5792606, -0.3116892, 1.949148, 0.2705882, 0, 1, 1,
0.5797905, -0.6177771, 2.147841, 0.2784314, 0, 1, 1,
0.580029, -1.57454, 2.861296, 0.282353, 0, 1, 1,
0.5809126, 1.850915, -0.8637179, 0.2901961, 0, 1, 1,
0.5878894, -0.5609266, 3.299386, 0.2941177, 0, 1, 1,
0.5885363, 0.7980003, 1.785858, 0.3019608, 0, 1, 1,
0.5926235, 1.735897, -1.719835, 0.3098039, 0, 1, 1,
0.5944226, 0.1106898, 0.5542969, 0.3137255, 0, 1, 1,
0.5982684, -1.168764, 3.9527, 0.3215686, 0, 1, 1,
0.599318, -0.2946622, 1.001616, 0.3254902, 0, 1, 1,
0.6041889, 1.760429, 1.475416, 0.3333333, 0, 1, 1,
0.6081057, 0.728077, -0.07786784, 0.3372549, 0, 1, 1,
0.6161649, -1.830749, 3.248296, 0.345098, 0, 1, 1,
0.620741, -1.891302, 3.661402, 0.3490196, 0, 1, 1,
0.6215928, -0.3369423, 1.653912, 0.3568628, 0, 1, 1,
0.6220176, -1.472509, 1.978857, 0.3607843, 0, 1, 1,
0.6290268, 1.321175, 0.09666372, 0.3686275, 0, 1, 1,
0.6291725, 0.9325213, -0.4434246, 0.372549, 0, 1, 1,
0.6330226, 0.3806349, 0.9398094, 0.3803922, 0, 1, 1,
0.6366332, -0.4237536, 0.9368855, 0.3843137, 0, 1, 1,
0.6385844, -0.2145841, 1.227841, 0.3921569, 0, 1, 1,
0.6389548, -0.5595492, 4.265639, 0.3960784, 0, 1, 1,
0.641574, -0.8404909, 2.644173, 0.4039216, 0, 1, 1,
0.641805, 0.1049975, 1.082536, 0.4117647, 0, 1, 1,
0.6418179, 1.498388, 1.262978, 0.4156863, 0, 1, 1,
0.6438063, -0.9405966, 4.565252, 0.4235294, 0, 1, 1,
0.647294, 0.0490114, 2.311139, 0.427451, 0, 1, 1,
0.6506515, 0.5747268, -0.4373045, 0.4352941, 0, 1, 1,
0.6526015, 0.6655754, 0.7771283, 0.4392157, 0, 1, 1,
0.6674604, -1.89199, 3.926763, 0.4470588, 0, 1, 1,
0.6679073, 0.420748, 1.854253, 0.4509804, 0, 1, 1,
0.6722509, 0.4431139, 1.625542, 0.4588235, 0, 1, 1,
0.6737337, 1.882139, -0.9042221, 0.4627451, 0, 1, 1,
0.675743, -0.08742193, 2.483881, 0.4705882, 0, 1, 1,
0.6771126, 0.5955548, 1.015152, 0.4745098, 0, 1, 1,
0.6776311, -0.5704498, 3.240598, 0.4823529, 0, 1, 1,
0.6786255, 0.05219119, 1.664864, 0.4862745, 0, 1, 1,
0.6806406, 0.01646429, 1.710997, 0.4941176, 0, 1, 1,
0.6810635, 1.164543, -0.9020169, 0.5019608, 0, 1, 1,
0.6834684, -0.9484135, 2.953969, 0.5058824, 0, 1, 1,
0.6837429, 0.6109893, 0.7854397, 0.5137255, 0, 1, 1,
0.6845325, -0.8096301, 3.506268, 0.5176471, 0, 1, 1,
0.6955587, -1.515827, 4.527902, 0.5254902, 0, 1, 1,
0.6961669, -1.763695, 4.481266, 0.5294118, 0, 1, 1,
0.7011153, 1.478875, -1.207722, 0.5372549, 0, 1, 1,
0.7047154, 0.7259592, 1.586604, 0.5411765, 0, 1, 1,
0.7061096, 0.04012593, 0.7928043, 0.5490196, 0, 1, 1,
0.7136589, 1.112565, -0.5032732, 0.5529412, 0, 1, 1,
0.7272501, -1.412831, 1.755756, 0.5607843, 0, 1, 1,
0.7281119, -0.01301643, 0.964744, 0.5647059, 0, 1, 1,
0.7281408, 0.07682854, 1.841008, 0.572549, 0, 1, 1,
0.7336336, 0.7375687, 0.455385, 0.5764706, 0, 1, 1,
0.7393734, -1.120378, 2.921714, 0.5843138, 0, 1, 1,
0.7409093, 0.8242843, 2.028506, 0.5882353, 0, 1, 1,
0.7422486, 0.4355144, 1.067136, 0.5960785, 0, 1, 1,
0.7501251, -0.6316011, 3.848377, 0.6039216, 0, 1, 1,
0.7560153, 0.1442856, 1.14967, 0.6078432, 0, 1, 1,
0.7560875, 1.175819, 0.425457, 0.6156863, 0, 1, 1,
0.7582495, -2.11912, 3.24614, 0.6196079, 0, 1, 1,
0.7616742, 0.445639, 0.700531, 0.627451, 0, 1, 1,
0.7686573, -0.5912127, 3.797364, 0.6313726, 0, 1, 1,
0.7694154, -1.640022, 3.153023, 0.6392157, 0, 1, 1,
0.7695961, -1.746177, 2.042367, 0.6431373, 0, 1, 1,
0.7711409, 0.7390634, -0.08407225, 0.6509804, 0, 1, 1,
0.7720959, 0.2215349, 1.82884, 0.654902, 0, 1, 1,
0.772946, -0.35547, 1.840624, 0.6627451, 0, 1, 1,
0.7811174, -0.627463, 1.958155, 0.6666667, 0, 1, 1,
0.7818463, -1.836324, 1.414263, 0.6745098, 0, 1, 1,
0.7861026, 1.628367, -1.263705, 0.6784314, 0, 1, 1,
0.7877183, -0.2105984, 2.791511, 0.6862745, 0, 1, 1,
0.7899864, 0.01081632, 0.08336016, 0.6901961, 0, 1, 1,
0.7914854, -0.896281, 1.608227, 0.6980392, 0, 1, 1,
0.7946956, -0.6886961, 2.763793, 0.7058824, 0, 1, 1,
0.8058032, -2.40216, 3.245851, 0.7098039, 0, 1, 1,
0.8106809, -0.8748658, 2.403024, 0.7176471, 0, 1, 1,
0.8120397, 0.8749016, 0.4306161, 0.7215686, 0, 1, 1,
0.8142652, 0.7651526, 1.004658, 0.7294118, 0, 1, 1,
0.8178358, 0.1691372, 1.828205, 0.7333333, 0, 1, 1,
0.8186982, 1.052638, 0.9758376, 0.7411765, 0, 1, 1,
0.8390153, 0.3168849, 1.345935, 0.7450981, 0, 1, 1,
0.8395365, 0.98927, 0.4448814, 0.7529412, 0, 1, 1,
0.8442559, -1.006679, 2.368148, 0.7568628, 0, 1, 1,
0.8475559, -1.042103, 2.148286, 0.7647059, 0, 1, 1,
0.8480698, -0.7820956, 1.190091, 0.7686275, 0, 1, 1,
0.8531265, 0.5878631, 0.6494033, 0.7764706, 0, 1, 1,
0.8616913, -0.8215134, 2.232422, 0.7803922, 0, 1, 1,
0.8622329, -0.2999604, 1.23719, 0.7882353, 0, 1, 1,
0.863525, -1.167968, 4.957215, 0.7921569, 0, 1, 1,
0.8668982, 0.6440191, 1.105976, 0.8, 0, 1, 1,
0.8698062, 1.315073, 2.35146, 0.8078431, 0, 1, 1,
0.8708567, 1.264205, 0.6186098, 0.8117647, 0, 1, 1,
0.871549, 1.825034, 2.90248, 0.8196079, 0, 1, 1,
0.8743485, 1.66388, -0.5050798, 0.8235294, 0, 1, 1,
0.8752688, -0.2063247, 1.810585, 0.8313726, 0, 1, 1,
0.8817567, -0.6909537, 2.465238, 0.8352941, 0, 1, 1,
0.8847004, 3.154694, 1.861533, 0.8431373, 0, 1, 1,
0.8882337, 0.4599511, 1.895862, 0.8470588, 0, 1, 1,
0.8895947, 0.355579, 1.388935, 0.854902, 0, 1, 1,
0.8925816, -0.7630015, 1.571564, 0.8588235, 0, 1, 1,
0.9018264, -1.239441, 1.785355, 0.8666667, 0, 1, 1,
0.9064644, 1.615741, 0.475841, 0.8705882, 0, 1, 1,
0.9066962, 1.160777, 0.9664875, 0.8784314, 0, 1, 1,
0.913324, -2.096178, 0.8022246, 0.8823529, 0, 1, 1,
0.9172245, 0.6733265, 1.497595, 0.8901961, 0, 1, 1,
0.9178426, -1.262961, 3.030028, 0.8941177, 0, 1, 1,
0.9185872, -2.264809, 4.580944, 0.9019608, 0, 1, 1,
0.9203992, 0.2359098, 4.14508, 0.9098039, 0, 1, 1,
0.9242403, -1.012047, 0.6278175, 0.9137255, 0, 1, 1,
0.9336336, -0.7280928, 2.534234, 0.9215686, 0, 1, 1,
0.9338996, 0.4001402, -0.1562204, 0.9254902, 0, 1, 1,
0.9378653, 0.02103095, 0.9661081, 0.9333333, 0, 1, 1,
0.939746, 0.3881607, 0.7988941, 0.9372549, 0, 1, 1,
0.9397605, -0.1702014, 0.7711222, 0.945098, 0, 1, 1,
0.9423195, -1.588782, 4.117228, 0.9490196, 0, 1, 1,
0.9505432, 2.317786, 0.3016976, 0.9568627, 0, 1, 1,
0.9535683, -0.2659064, 1.361202, 0.9607843, 0, 1, 1,
0.9582061, -0.9317604, 1.956622, 0.9686275, 0, 1, 1,
0.9596305, -1.449146, 1.510229, 0.972549, 0, 1, 1,
0.9640654, -1.469645, 1.217352, 0.9803922, 0, 1, 1,
0.9658217, -0.0278246, 2.527914, 0.9843137, 0, 1, 1,
0.9667479, 0.2672029, 3.125126, 0.9921569, 0, 1, 1,
0.9679688, -0.6536156, 3.312967, 0.9960784, 0, 1, 1,
0.9766265, 2.16901, 0.06844983, 1, 0, 0.9960784, 1,
0.9806045, 0.6541877, 0.07969029, 1, 0, 0.9882353, 1,
0.9875578, -1.022509, 1.670061, 1, 0, 0.9843137, 1,
0.988444, -0.4706214, 3.110279, 1, 0, 0.9764706, 1,
0.9951215, 1.809261, 0.4902187, 1, 0, 0.972549, 1,
1.001846, -0.5591021, 2.894072, 1, 0, 0.9647059, 1,
1.004831, 0.5540386, 2.200874, 1, 0, 0.9607843, 1,
1.005642, 0.11115, 0.2158, 1, 0, 0.9529412, 1,
1.008493, 1.246531, 0.6639086, 1, 0, 0.9490196, 1,
1.021016, 0.1586013, 0.6749348, 1, 0, 0.9411765, 1,
1.024398, 0.5656506, 0.5412849, 1, 0, 0.9372549, 1,
1.026348, -0.03536233, 0.4584032, 1, 0, 0.9294118, 1,
1.028523, -0.01738078, 2.917409, 1, 0, 0.9254902, 1,
1.03181, 0.7466035, 0.7268417, 1, 0, 0.9176471, 1,
1.032299, 1.592581, 0.6346465, 1, 0, 0.9137255, 1,
1.032608, -0.8476365, 3.696995, 1, 0, 0.9058824, 1,
1.033102, -0.4049159, 1.278071, 1, 0, 0.9019608, 1,
1.044307, 0.1628415, 1.697646, 1, 0, 0.8941177, 1,
1.054668, 0.2962149, 1.298489, 1, 0, 0.8862745, 1,
1.05518, -1.067916, 3.482594, 1, 0, 0.8823529, 1,
1.057123, -0.9741654, 1.197272, 1, 0, 0.8745098, 1,
1.057783, -0.3611075, 2.081139, 1, 0, 0.8705882, 1,
1.065899, -0.7962189, 3.152835, 1, 0, 0.8627451, 1,
1.070144, 0.109572, -0.127368, 1, 0, 0.8588235, 1,
1.074098, 0.1432647, 0.8121805, 1, 0, 0.8509804, 1,
1.077076, -0.04388369, 2.093231, 1, 0, 0.8470588, 1,
1.091372, 0.3850856, 1.148312, 1, 0, 0.8392157, 1,
1.092278, -1.194805, 4.211253, 1, 0, 0.8352941, 1,
1.095852, -0.5086259, 2.1042, 1, 0, 0.827451, 1,
1.096318, -0.357099, 0.9918543, 1, 0, 0.8235294, 1,
1.105402, 0.5761855, 0.695932, 1, 0, 0.8156863, 1,
1.113447, 0.9962583, 0.5461907, 1, 0, 0.8117647, 1,
1.123618, -0.0971066, 1.748928, 1, 0, 0.8039216, 1,
1.125859, 1.031257, 0.6074619, 1, 0, 0.7960784, 1,
1.126856, 0.3228098, 1.845548, 1, 0, 0.7921569, 1,
1.129925, 0.5802464, 0.4784867, 1, 0, 0.7843137, 1,
1.132717, -0.07809099, 1.181042, 1, 0, 0.7803922, 1,
1.138463, -1.386483, 5.425594, 1, 0, 0.772549, 1,
1.150888, 0.7244315, 0.4740201, 1, 0, 0.7686275, 1,
1.150949, -0.186448, 1.019653, 1, 0, 0.7607843, 1,
1.15542, 1.276015, 2.256491, 1, 0, 0.7568628, 1,
1.162222, -0.1599245, 0.7023246, 1, 0, 0.7490196, 1,
1.165311, 0.01494082, 2.434801, 1, 0, 0.7450981, 1,
1.165734, 0.9666196, 1.069846, 1, 0, 0.7372549, 1,
1.173226, -0.3382176, 2.622819, 1, 0, 0.7333333, 1,
1.173936, 1.288774, -0.04369142, 1, 0, 0.7254902, 1,
1.182957, 0.814868, 0.02073951, 1, 0, 0.7215686, 1,
1.195531, -1.448843, 2.413476, 1, 0, 0.7137255, 1,
1.205556, 0.5940127, 1.72473, 1, 0, 0.7098039, 1,
1.207084, -0.0556042, 3.192697, 1, 0, 0.7019608, 1,
1.211866, -0.2569984, 1.498139, 1, 0, 0.6941177, 1,
1.213663, 1.809191, 0.1067969, 1, 0, 0.6901961, 1,
1.219895, -1.678141, 3.231462, 1, 0, 0.682353, 1,
1.232619, 1.768877, 0.8465628, 1, 0, 0.6784314, 1,
1.236006, -2.161826, 1.408888, 1, 0, 0.6705883, 1,
1.252101, -0.3204929, 1.38181, 1, 0, 0.6666667, 1,
1.260309, 0.7040315, 0.1761597, 1, 0, 0.6588235, 1,
1.269451, -0.6576665, 1.434941, 1, 0, 0.654902, 1,
1.272301, 0.5623854, 0.4756416, 1, 0, 0.6470588, 1,
1.276003, 0.9817063, 0.597121, 1, 0, 0.6431373, 1,
1.286017, 0.1844529, 0.853679, 1, 0, 0.6352941, 1,
1.311191, 0.2593709, 0.8695746, 1, 0, 0.6313726, 1,
1.337746, 0.3504485, 1.081301, 1, 0, 0.6235294, 1,
1.340726, -1.299061, 0.8935323, 1, 0, 0.6196079, 1,
1.350511, 0.5307223, 1.228332, 1, 0, 0.6117647, 1,
1.360095, -0.365449, -0.2307475, 1, 0, 0.6078432, 1,
1.362497, 0.8815818, 1.072292, 1, 0, 0.6, 1,
1.36952, 0.339413, 1.24061, 1, 0, 0.5921569, 1,
1.374889, -1.642668, 1.096171, 1, 0, 0.5882353, 1,
1.378412, 0.002794925, 1.082003, 1, 0, 0.5803922, 1,
1.396312, -0.4183948, 3.368557, 1, 0, 0.5764706, 1,
1.397232, 0.9230657, 3.34245, 1, 0, 0.5686275, 1,
1.401591, 0.2221684, 0.2693734, 1, 0, 0.5647059, 1,
1.401647, 0.5936006, 1.610569, 1, 0, 0.5568628, 1,
1.403511, 0.2587865, 0.6620509, 1, 0, 0.5529412, 1,
1.418011, 0.0765937, 3.464287, 1, 0, 0.5450981, 1,
1.428773, -1.29408, 1.954905, 1, 0, 0.5411765, 1,
1.437028, -0.6728692, 1.316705, 1, 0, 0.5333334, 1,
1.4505, -0.311128, 0.6372693, 1, 0, 0.5294118, 1,
1.454841, -0.06371665, 2.39588, 1, 0, 0.5215687, 1,
1.459692, 0.5117757, 1.389451, 1, 0, 0.5176471, 1,
1.463085, 2.898756, -0.01618449, 1, 0, 0.509804, 1,
1.469287, 0.4387221, -0.9352693, 1, 0, 0.5058824, 1,
1.484002, -0.4584795, 2.056459, 1, 0, 0.4980392, 1,
1.488805, 0.001255108, 1.728893, 1, 0, 0.4901961, 1,
1.489747, -1.394353, 0.931709, 1, 0, 0.4862745, 1,
1.492029, 0.6944574, 0.2326565, 1, 0, 0.4784314, 1,
1.501332, -1.140739, 1.285036, 1, 0, 0.4745098, 1,
1.50973, -0.1124978, 0.8709707, 1, 0, 0.4666667, 1,
1.516245, 1.96349, -0.3725834, 1, 0, 0.4627451, 1,
1.52849, -0.2429995, 1.575087, 1, 0, 0.454902, 1,
1.534679, -1.63482, 2.431009, 1, 0, 0.4509804, 1,
1.537733, -0.8856302, 0.6914828, 1, 0, 0.4431373, 1,
1.542661, -0.373657, 2.631953, 1, 0, 0.4392157, 1,
1.548649, 1.281321, 0.8776073, 1, 0, 0.4313726, 1,
1.557672, 0.04303958, 1.349113, 1, 0, 0.427451, 1,
1.561459, 0.5705005, 0.7856352, 1, 0, 0.4196078, 1,
1.575785, -0.06621037, 1.974651, 1, 0, 0.4156863, 1,
1.581194, -0.5577533, 1.693816, 1, 0, 0.4078431, 1,
1.585349, -1.149343, 0.7386893, 1, 0, 0.4039216, 1,
1.585545, -1.049592, 3.959753, 1, 0, 0.3960784, 1,
1.59074, 1.60629, 1.508474, 1, 0, 0.3882353, 1,
1.603762, -2.381826, 1.520001, 1, 0, 0.3843137, 1,
1.612803, -1.19668, 3.683157, 1, 0, 0.3764706, 1,
1.617433, 1.412059, 1.087458, 1, 0, 0.372549, 1,
1.641899, -0.09093848, 1.956418, 1, 0, 0.3647059, 1,
1.660617, -0.4405909, 1.822084, 1, 0, 0.3607843, 1,
1.673293, -1.741256, 3.366722, 1, 0, 0.3529412, 1,
1.68017, 1.878556, 1.327037, 1, 0, 0.3490196, 1,
1.688742, -0.7311254, 0.8908347, 1, 0, 0.3411765, 1,
1.699388, -1.335569, 2.24771, 1, 0, 0.3372549, 1,
1.706905, -0.2430734, 2.221844, 1, 0, 0.3294118, 1,
1.717638, 0.4644326, 0.6511756, 1, 0, 0.3254902, 1,
1.717699, -0.6801177, 1.504436, 1, 0, 0.3176471, 1,
1.769517, -1.612206, 3.395077, 1, 0, 0.3137255, 1,
1.77261, 0.5240358, 1.0234, 1, 0, 0.3058824, 1,
1.776157, 1.056162, 0.02098707, 1, 0, 0.2980392, 1,
1.776395, 0.7424377, 2.584125, 1, 0, 0.2941177, 1,
1.777479, 1.182289, 0.66063, 1, 0, 0.2862745, 1,
1.777707, -1.456887, 2.159946, 1, 0, 0.282353, 1,
1.801662, 0.9515121, 2.375456, 1, 0, 0.2745098, 1,
1.819029, -0.2887172, 2.887911, 1, 0, 0.2705882, 1,
1.83749, -0.06145928, 3.783577, 1, 0, 0.2627451, 1,
1.839322, -0.09875646, 1.991916, 1, 0, 0.2588235, 1,
1.847196, 0.08233199, 1.539209, 1, 0, 0.2509804, 1,
1.85063, -1.190089, 2.312095, 1, 0, 0.2470588, 1,
1.875091, -0.4687958, 2.451793, 1, 0, 0.2392157, 1,
1.891015, -0.841708, 1.897097, 1, 0, 0.2352941, 1,
1.892743, -0.465242, -0.08762978, 1, 0, 0.227451, 1,
1.897259, 0.5247298, 1.292274, 1, 0, 0.2235294, 1,
1.944414, 1.426024, -0.6211383, 1, 0, 0.2156863, 1,
1.945639, 0.2629842, 1.341101, 1, 0, 0.2117647, 1,
1.960537, -0.07693309, 1.762601, 1, 0, 0.2039216, 1,
1.966615, -0.2328801, 2.393533, 1, 0, 0.1960784, 1,
1.973083, 0.3003131, 1.521529, 1, 0, 0.1921569, 1,
1.981337, -0.7694721, 3.582345, 1, 0, 0.1843137, 1,
1.990656, 0.04710256, 0.9154413, 1, 0, 0.1803922, 1,
1.992996, 0.1501641, 2.35002, 1, 0, 0.172549, 1,
2.014537, 0.01411964, 0.4100727, 1, 0, 0.1686275, 1,
2.045813, -1.663708, 2.193211, 1, 0, 0.1607843, 1,
2.065822, -0.887711, 1.658547, 1, 0, 0.1568628, 1,
2.072405, -0.2118337, 2.54868, 1, 0, 0.1490196, 1,
2.087156, -0.4713607, 0.1983547, 1, 0, 0.145098, 1,
2.088408, -1.114001, 1.233116, 1, 0, 0.1372549, 1,
2.090821, -0.5031274, 0.4674692, 1, 0, 0.1333333, 1,
2.100408, -0.5573224, 2.039248, 1, 0, 0.1254902, 1,
2.155971, -1.610514, 1.531139, 1, 0, 0.1215686, 1,
2.192914, 0.9147019, 2.257523, 1, 0, 0.1137255, 1,
2.216637, -0.6479374, 0.9333034, 1, 0, 0.1098039, 1,
2.218301, -1.833235, 1.533025, 1, 0, 0.1019608, 1,
2.232177, -0.03145992, 2.733316, 1, 0, 0.09411765, 1,
2.265424, -0.3572538, 2.110826, 1, 0, 0.09019608, 1,
2.29547, 0.2899392, 1.8458, 1, 0, 0.08235294, 1,
2.331458, -0.2297733, 2.491352, 1, 0, 0.07843138, 1,
2.37425, 1.70416, -0.7542164, 1, 0, 0.07058824, 1,
2.384404, 0.2358819, 3.442747, 1, 0, 0.06666667, 1,
2.458385, 2.063704, 0.322009, 1, 0, 0.05882353, 1,
2.582468, -0.8894114, 2.219902, 1, 0, 0.05490196, 1,
2.588225, 0.8247943, 0.4845259, 1, 0, 0.04705882, 1,
2.724888, 0.2866758, 2.077134, 1, 0, 0.04313726, 1,
2.785409, 0.5055602, 2.89723, 1, 0, 0.03529412, 1,
2.820982, 0.2067177, 1.134865, 1, 0, 0.03137255, 1,
2.908962, 0.1327306, 1.350494, 1, 0, 0.02352941, 1,
2.939304, 0.985658, 0.1330723, 1, 0, 0.01960784, 1,
3.036405, 0.0009161959, 3.886945, 1, 0, 0.01176471, 1,
3.401015, -0.7885736, 1.75854, 1, 0, 0.007843138, 1
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
0.03450131, -4.195615, -7.757386, 0, -0.5, 0.5, 0.5,
0.03450131, -4.195615, -7.757386, 1, -0.5, 0.5, 0.5,
0.03450131, -4.195615, -7.757386, 1, 1.5, 0.5, 0.5,
0.03450131, -4.195615, -7.757386, 0, 1.5, 0.5, 0.5
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
-4.473261, 0.01219344, -7.757386, 0, -0.5, 0.5, 0.5,
-4.473261, 0.01219344, -7.757386, 1, -0.5, 0.5, 0.5,
-4.473261, 0.01219344, -7.757386, 1, 1.5, 0.5, 0.5,
-4.473261, 0.01219344, -7.757386, 0, 1.5, 0.5, 0.5
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
-4.473261, -4.195615, -0.2105668, 0, -0.5, 0.5, 0.5,
-4.473261, -4.195615, -0.2105668, 1, -0.5, 0.5, 0.5,
-4.473261, -4.195615, -0.2105668, 1, 1.5, 0.5, 0.5,
-4.473261, -4.195615, -0.2105668, 0, 1.5, 0.5, 0.5
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
-3, -3.224582, -6.015812,
3, -3.224582, -6.015812,
-3, -3.224582, -6.015812,
-3, -3.386421, -6.306075,
-2, -3.224582, -6.015812,
-2, -3.386421, -6.306075,
-1, -3.224582, -6.015812,
-1, -3.386421, -6.306075,
0, -3.224582, -6.015812,
0, -3.386421, -6.306075,
1, -3.224582, -6.015812,
1, -3.386421, -6.306075,
2, -3.224582, -6.015812,
2, -3.386421, -6.306075,
3, -3.224582, -6.015812,
3, -3.386421, -6.306075
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
-3, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
-3, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
-3, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
-3, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
-2, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
-2, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
-2, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
-2, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
-1, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
-1, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
-1, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
-1, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
0, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
0, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
0, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
0, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
1, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
1, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
1, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
1, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
2, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
2, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
2, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
2, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5,
3, -3.710099, -6.886599, 0, -0.5, 0.5, 0.5,
3, -3.710099, -6.886599, 1, -0.5, 0.5, 0.5,
3, -3.710099, -6.886599, 1, 1.5, 0.5, 0.5,
3, -3.710099, -6.886599, 0, 1.5, 0.5, 0.5
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
-3.433008, -3, -6.015812,
-3.433008, 3, -6.015812,
-3.433008, -3, -6.015812,
-3.606384, -3, -6.306075,
-3.433008, -2, -6.015812,
-3.606384, -2, -6.306075,
-3.433008, -1, -6.015812,
-3.606384, -1, -6.306075,
-3.433008, 0, -6.015812,
-3.606384, 0, -6.306075,
-3.433008, 1, -6.015812,
-3.606384, 1, -6.306075,
-3.433008, 2, -6.015812,
-3.606384, 2, -6.306075,
-3.433008, 3, -6.015812,
-3.606384, 3, -6.306075
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
-3.953135, -3, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, -3, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, -3, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, -3, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, -2, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, -2, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, -2, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, -2, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, -1, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, -1, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, -1, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, -1, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, 0, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, 0, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, 0, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, 0, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, 1, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, 1, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, 1, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, 1, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, 2, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, 2, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, 2, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, 2, -6.886599, 0, 1.5, 0.5, 0.5,
-3.953135, 3, -6.886599, 0, -0.5, 0.5, 0.5,
-3.953135, 3, -6.886599, 1, -0.5, 0.5, 0.5,
-3.953135, 3, -6.886599, 1, 1.5, 0.5, 0.5,
-3.953135, 3, -6.886599, 0, 1.5, 0.5, 0.5
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
-3.433008, -3.224582, -4,
-3.433008, -3.224582, 4,
-3.433008, -3.224582, -4,
-3.606384, -3.386421, -4,
-3.433008, -3.224582, -2,
-3.606384, -3.386421, -2,
-3.433008, -3.224582, 0,
-3.606384, -3.386421, 0,
-3.433008, -3.224582, 2,
-3.606384, -3.386421, 2,
-3.433008, -3.224582, 4,
-3.606384, -3.386421, 4
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
-3.953135, -3.710099, -4, 0, -0.5, 0.5, 0.5,
-3.953135, -3.710099, -4, 1, -0.5, 0.5, 0.5,
-3.953135, -3.710099, -4, 1, 1.5, 0.5, 0.5,
-3.953135, -3.710099, -4, 0, 1.5, 0.5, 0.5,
-3.953135, -3.710099, -2, 0, -0.5, 0.5, 0.5,
-3.953135, -3.710099, -2, 1, -0.5, 0.5, 0.5,
-3.953135, -3.710099, -2, 1, 1.5, 0.5, 0.5,
-3.953135, -3.710099, -2, 0, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 0, 0, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 0, 1, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 0, 1, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 0, 0, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 2, 0, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 2, 1, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 2, 1, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 2, 0, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 4, 0, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 4, 1, -0.5, 0.5, 0.5,
-3.953135, -3.710099, 4, 1, 1.5, 0.5, 0.5,
-3.953135, -3.710099, 4, 0, 1.5, 0.5, 0.5
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
-3.433008, -3.224582, -6.015812,
-3.433008, 3.248969, -6.015812,
-3.433008, -3.224582, 5.594679,
-3.433008, 3.248969, 5.594679,
-3.433008, -3.224582, -6.015812,
-3.433008, -3.224582, 5.594679,
-3.433008, 3.248969, -6.015812,
-3.433008, 3.248969, 5.594679,
-3.433008, -3.224582, -6.015812,
3.502011, -3.224582, -6.015812,
-3.433008, -3.224582, 5.594679,
3.502011, -3.224582, 5.594679,
-3.433008, 3.248969, -6.015812,
3.502011, 3.248969, -6.015812,
-3.433008, 3.248969, 5.594679,
3.502011, 3.248969, 5.594679,
3.502011, -3.224582, -6.015812,
3.502011, 3.248969, -6.015812,
3.502011, -3.224582, 5.594679,
3.502011, 3.248969, 5.594679,
3.502011, -3.224582, -6.015812,
3.502011, -3.224582, 5.594679,
3.502011, 3.248969, -6.015812,
3.502011, 3.248969, 5.594679
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
var radius = 8.006234;
var distance = 35.62064;
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
mvMatrix.translate( -0.03450131, -0.01219344, 0.2105668 );
mvMatrix.scale( 1.24823, 1.33721, 0.7455755 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62064);
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
dimethylvinphos<-read.table("dimethylvinphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethylvinphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethylvinphos' not found
```

```r
y<-dimethylvinphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethylvinphos' not found
```

```r
z<-dimethylvinphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethylvinphos' not found
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
-3.332013, 0.891305, 0.8683617, 0, 0, 1, 1, 1,
-2.922784, 1.057429, -1.807865, 1, 0, 0, 1, 1,
-2.825417, -1.696378, -2.882475, 1, 0, 0, 1, 1,
-2.823731, 2.055006, 0.694157, 1, 0, 0, 1, 1,
-2.673213, -0.2447031, -3.876624, 1, 0, 0, 1, 1,
-2.618095, 1.996638, -1.046338, 1, 0, 0, 1, 1,
-2.513277, -0.004237517, -1.575412, 0, 0, 0, 1, 1,
-2.445332, -1.072816, -2.389577, 0, 0, 0, 1, 1,
-2.401375, -1.73315, -2.778919, 0, 0, 0, 1, 1,
-2.355615, 0.08968673, -1.172078, 0, 0, 0, 1, 1,
-2.323555, -1.016187, -3.790727, 0, 0, 0, 1, 1,
-2.31822, 0.07052442, -0.4569143, 0, 0, 0, 1, 1,
-2.202686, -0.4044374, -1.096953, 0, 0, 0, 1, 1,
-2.193709, 0.6945332, -0.1066537, 1, 1, 1, 1, 1,
-2.181558, -0.8983491, -2.137548, 1, 1, 1, 1, 1,
-2.083026, -1.706152, -1.042444, 1, 1, 1, 1, 1,
-2.030461, 0.6295882, -2.101513, 1, 1, 1, 1, 1,
-2.009115, 0.152534, -0.7903117, 1, 1, 1, 1, 1,
-1.993236, 0.1358628, -0.6563115, 1, 1, 1, 1, 1,
-1.959112, -0.2064403, -2.88766, 1, 1, 1, 1, 1,
-1.927691, 0.8493925, -1.586944, 1, 1, 1, 1, 1,
-1.925537, 1.887064, -1.200024, 1, 1, 1, 1, 1,
-1.911949, 1.067318, -0.4850705, 1, 1, 1, 1, 1,
-1.90388, -0.9890544, 0.3142442, 1, 1, 1, 1, 1,
-1.873984, -0.4966374, -2.571215, 1, 1, 1, 1, 1,
-1.861783, -0.513275, 0.746635, 1, 1, 1, 1, 1,
-1.840219, 0.1250857, -0.7359297, 1, 1, 1, 1, 1,
-1.832863, 0.1889447, -1.710781, 1, 1, 1, 1, 1,
-1.825186, -1.442505, -0.5176921, 0, 0, 1, 1, 1,
-1.814287, -0.8291471, -2.338081, 1, 0, 0, 1, 1,
-1.807283, -0.926808, -1.312212, 1, 0, 0, 1, 1,
-1.799662, 0.4035567, -1.889684, 1, 0, 0, 1, 1,
-1.792971, 1.335137, -0.7705149, 1, 0, 0, 1, 1,
-1.792304, -0.2870999, -1.85582, 1, 0, 0, 1, 1,
-1.772895, 0.07082023, 0.8765346, 0, 0, 0, 1, 1,
-1.736768, 1.134445, -0.2901103, 0, 0, 0, 1, 1,
-1.727287, 0.883173, -1.651827, 0, 0, 0, 1, 1,
-1.725481, -1.395377, -1.483293, 0, 0, 0, 1, 1,
-1.723832, 0.2591581, -0.8708465, 0, 0, 0, 1, 1,
-1.710568, -0.7381903, -1.346387, 0, 0, 0, 1, 1,
-1.691262, 0.9241693, -1.993803, 0, 0, 0, 1, 1,
-1.669938, -0.7887798, -2.580853, 1, 1, 1, 1, 1,
-1.667331, 0.4592387, 0.09535553, 1, 1, 1, 1, 1,
-1.662817, -0.1642796, -1.510781, 1, 1, 1, 1, 1,
-1.657958, -0.1484974, -1.803593, 1, 1, 1, 1, 1,
-1.65578, -0.889572, -3.15538, 1, 1, 1, 1, 1,
-1.640097, 0.8097795, -2.299303, 1, 1, 1, 1, 1,
-1.636591, -0.5218412, -2.701175, 1, 1, 1, 1, 1,
-1.636105, -0.6132386, -2.221688, 1, 1, 1, 1, 1,
-1.63502, -1.746568, -0.9647004, 1, 1, 1, 1, 1,
-1.625387, -1.417133, -2.144015, 1, 1, 1, 1, 1,
-1.625364, -0.06572299, -1.930826, 1, 1, 1, 1, 1,
-1.610031, -0.4475568, -1.09796, 1, 1, 1, 1, 1,
-1.6077, 0.7864046, -0.9125077, 1, 1, 1, 1, 1,
-1.576895, -0.6185839, -1.588785, 1, 1, 1, 1, 1,
-1.570236, 1.288684, -1.927857, 1, 1, 1, 1, 1,
-1.566915, -1.161157, -2.182963, 0, 0, 1, 1, 1,
-1.552034, 0.125017, -0.2870493, 1, 0, 0, 1, 1,
-1.540179, -0.4232019, -2.408512, 1, 0, 0, 1, 1,
-1.527927, 0.63451, -1.467106, 1, 0, 0, 1, 1,
-1.51549, 0.3335123, -1.288743, 1, 0, 0, 1, 1,
-1.511405, 2.169436, -1.103161, 1, 0, 0, 1, 1,
-1.500491, -0.166644, 0.329836, 0, 0, 0, 1, 1,
-1.496449, -0.2808706, -1.435374, 0, 0, 0, 1, 1,
-1.490096, -0.8847411, -0.695089, 0, 0, 0, 1, 1,
-1.476512, -0.5587071, -0.6208758, 0, 0, 0, 1, 1,
-1.4654, -1.174172, -4.402707, 0, 0, 0, 1, 1,
-1.454727, 0.5525061, -1.847093, 0, 0, 0, 1, 1,
-1.450042, -1.32117, -0.01433602, 0, 0, 0, 1, 1,
-1.439399, 0.9891567, 1.068724, 1, 1, 1, 1, 1,
-1.437374, -1.180263, -2.406739, 1, 1, 1, 1, 1,
-1.436786, 0.6589076, -1.079306, 1, 1, 1, 1, 1,
-1.423237, -0.1323983, -1.203419, 1, 1, 1, 1, 1,
-1.417568, -0.1035819, -0.8642796, 1, 1, 1, 1, 1,
-1.41729, -1.423488, -2.513605, 1, 1, 1, 1, 1,
-1.414283, 1.207022, -0.5791373, 1, 1, 1, 1, 1,
-1.406846, 1.323994, -2.565517, 1, 1, 1, 1, 1,
-1.401511, 0.4431089, -1.859709, 1, 1, 1, 1, 1,
-1.399165, 0.7168128, -2.046069, 1, 1, 1, 1, 1,
-1.392327, -0.4475333, -0.7526106, 1, 1, 1, 1, 1,
-1.384735, 0.1729142, -2.811716, 1, 1, 1, 1, 1,
-1.384504, -1.064925, -2.892176, 1, 1, 1, 1, 1,
-1.361617, 0.2688749, -1.255544, 1, 1, 1, 1, 1,
-1.344003, -0.8414211, -2.799037, 1, 1, 1, 1, 1,
-1.334334, 0.1521571, -1.243739, 0, 0, 1, 1, 1,
-1.332807, 0.377041, -2.065931, 1, 0, 0, 1, 1,
-1.326921, -0.3699315, -2.574173, 1, 0, 0, 1, 1,
-1.318922, -1.24293, -2.342583, 1, 0, 0, 1, 1,
-1.31674, -2.275675, -1.930421, 1, 0, 0, 1, 1,
-1.313139, 0.476696, -2.314687, 1, 0, 0, 1, 1,
-1.301587, -0.3626722, -2.97189, 0, 0, 0, 1, 1,
-1.298413, 0.4817393, -0.8030211, 0, 0, 0, 1, 1,
-1.297101, -1.10708, -1.573402, 0, 0, 0, 1, 1,
-1.292868, 1.035875, 0.0998934, 0, 0, 0, 1, 1,
-1.289436, -0.3932256, -2.609664, 0, 0, 0, 1, 1,
-1.286419, -0.0367968, -2.370201, 0, 0, 0, 1, 1,
-1.284531, -0.3763754, -0.4468172, 0, 0, 0, 1, 1,
-1.282503, -0.1648107, -2.239272, 1, 1, 1, 1, 1,
-1.275458, -1.170857, -2.000879, 1, 1, 1, 1, 1,
-1.261804, 0.8908333, -1.977849, 1, 1, 1, 1, 1,
-1.258462, 0.185243, -0.5226095, 1, 1, 1, 1, 1,
-1.247693, -0.07181992, -0.8753509, 1, 1, 1, 1, 1,
-1.247467, -0.6398044, -1.598629, 1, 1, 1, 1, 1,
-1.244263, 0.6274539, -0.8919598, 1, 1, 1, 1, 1,
-1.244151, -0.4978126, -2.931545, 1, 1, 1, 1, 1,
-1.23825, -1.999921, -3.682168, 1, 1, 1, 1, 1,
-1.23433, 0.2774912, -0.7175152, 1, 1, 1, 1, 1,
-1.23359, -0.6963941, -3.803972, 1, 1, 1, 1, 1,
-1.217724, -1.477296, -2.316055, 1, 1, 1, 1, 1,
-1.215143, 0.2828945, -2.560706, 1, 1, 1, 1, 1,
-1.207631, -1.410599, -2.996208, 1, 1, 1, 1, 1,
-1.199833, 0.4207665, -0.4422347, 1, 1, 1, 1, 1,
-1.198504, 1.61863, 1.059533, 0, 0, 1, 1, 1,
-1.190103, 1.788695, 0.2872052, 1, 0, 0, 1, 1,
-1.189518, 1.169416, -3.060121, 1, 0, 0, 1, 1,
-1.188855, 1.120461, -2.385792, 1, 0, 0, 1, 1,
-1.187441, 1.615036, 0.1079693, 1, 0, 0, 1, 1,
-1.18099, 1.860519, 0.56489, 1, 0, 0, 1, 1,
-1.17385, -0.5515267, -2.032606, 0, 0, 0, 1, 1,
-1.170734, -1.112122, -2.233345, 0, 0, 0, 1, 1,
-1.170281, 2.392425, -1.117636, 0, 0, 0, 1, 1,
-1.168974, 0.6486527, -0.3077484, 0, 0, 0, 1, 1,
-1.158121, 0.2604695, -1.213964, 0, 0, 0, 1, 1,
-1.155892, 0.6636947, -0.4692754, 0, 0, 0, 1, 1,
-1.152326, -1.85353, -3.322821, 0, 0, 0, 1, 1,
-1.151013, -0.2307823, -3.011335, 1, 1, 1, 1, 1,
-1.143681, 0.2693047, 0.4695814, 1, 1, 1, 1, 1,
-1.142384, 1.518862, -1.568803, 1, 1, 1, 1, 1,
-1.135116, -1.843505, -2.154179, 1, 1, 1, 1, 1,
-1.114744, -0.06818914, -4.833989, 1, 1, 1, 1, 1,
-1.114473, -0.4316098, -1.739088, 1, 1, 1, 1, 1,
-1.111043, -0.3020407, 0.513762, 1, 1, 1, 1, 1,
-1.109938, 0.9012984, -1.574819, 1, 1, 1, 1, 1,
-1.106363, 2.582024, 0.5439945, 1, 1, 1, 1, 1,
-1.094618, -0.2832069, -0.8924907, 1, 1, 1, 1, 1,
-1.09243, -1.954234, -3.46738, 1, 1, 1, 1, 1,
-1.08979, 1.114828, -1.875465, 1, 1, 1, 1, 1,
-1.08694, 0.3484674, -1.010264, 1, 1, 1, 1, 1,
-1.081612, -0.973139, -0.8454573, 1, 1, 1, 1, 1,
-1.079491, 0.2529772, 1.039368, 1, 1, 1, 1, 1,
-1.076949, 2.279594, 0.3432739, 0, 0, 1, 1, 1,
-1.074742, 1.242057, -2.002311, 1, 0, 0, 1, 1,
-1.072822, -0.5130868, -1.84331, 1, 0, 0, 1, 1,
-1.070798, -1.13624, -1.712831, 1, 0, 0, 1, 1,
-1.069917, 0.4921782, -2.83416, 1, 0, 0, 1, 1,
-1.069755, 0.3588034, -2.478175, 1, 0, 0, 1, 1,
-1.066986, 0.2394646, -0.7790723, 0, 0, 0, 1, 1,
-1.065998, -0.3042257, -0.9887638, 0, 0, 0, 1, 1,
-1.060324, -0.1044474, -0.5129336, 0, 0, 0, 1, 1,
-1.053395, -0.2254491, -3.042508, 0, 0, 0, 1, 1,
-1.051853, -0.1833089, -2.097347, 0, 0, 0, 1, 1,
-1.046362, -0.6450457, -2.251395, 0, 0, 0, 1, 1,
-1.045003, 0.841755, 0.05422055, 0, 0, 0, 1, 1,
-1.04231, -0.6701958, -2.372417, 1, 1, 1, 1, 1,
-1.039927, 0.3624684, -1.200716, 1, 1, 1, 1, 1,
-1.039781, 1.123196, -1.978298, 1, 1, 1, 1, 1,
-1.031208, -0.8718071, -2.579279, 1, 1, 1, 1, 1,
-1.024541, -0.6093171, -1.309762, 1, 1, 1, 1, 1,
-1.020466, -0.2217769, -1.191553, 1, 1, 1, 1, 1,
-1.01928, 0.2138352, -2.099851, 1, 1, 1, 1, 1,
-1.015474, -0.7078261, -3.89761, 1, 1, 1, 1, 1,
-1.011702, -0.4818015, -1.339635, 1, 1, 1, 1, 1,
-1.005305, 1.221279, -0.4968576, 1, 1, 1, 1, 1,
-1.004709, 0.1244474, -2.524767, 1, 1, 1, 1, 1,
-1.004412, 0.3124186, -0.9478928, 1, 1, 1, 1, 1,
-1.002248, 1.552812, 0.2975329, 1, 1, 1, 1, 1,
-0.9996414, -0.9179804, -2.925109, 1, 1, 1, 1, 1,
-0.990024, -1.138896, -1.529416, 1, 1, 1, 1, 1,
-0.9792829, 0.1456269, -0.9539793, 0, 0, 1, 1, 1,
-0.9790218, -0.06217037, -1.919032, 1, 0, 0, 1, 1,
-0.9778719, -0.4374178, -0.9360934, 1, 0, 0, 1, 1,
-0.9747204, 0.4121088, -0.3288819, 1, 0, 0, 1, 1,
-0.9741412, -0.5293303, -1.664604, 1, 0, 0, 1, 1,
-0.9740314, -0.5365154, -3.77877, 1, 0, 0, 1, 1,
-0.9659555, 1.889163, -0.1502031, 0, 0, 0, 1, 1,
-0.9639366, 0.7277748, -2.975464, 0, 0, 0, 1, 1,
-0.9623952, -0.5244644, -2.754308, 0, 0, 0, 1, 1,
-0.9599276, -1.434453, -4.832576, 0, 0, 0, 1, 1,
-0.9521362, -1.823331, -2.566117, 0, 0, 0, 1, 1,
-0.9491223, 1.217459, 0.8119056, 0, 0, 0, 1, 1,
-0.9464389, -2.179061, -3.591619, 0, 0, 0, 1, 1,
-0.9432816, -0.5193253, -1.618532, 1, 1, 1, 1, 1,
-0.9305419, -2.406145, -2.965655, 1, 1, 1, 1, 1,
-0.9284624, 1.807435, -0.9605843, 1, 1, 1, 1, 1,
-0.9215158, -1.008755, -3.098822, 1, 1, 1, 1, 1,
-0.9138274, 0.8184273, 1.356842, 1, 1, 1, 1, 1,
-0.910359, -1.568019, -2.933547, 1, 1, 1, 1, 1,
-0.9085592, 0.08340964, -2.372037, 1, 1, 1, 1, 1,
-0.9055864, -0.676672, -1.539675, 1, 1, 1, 1, 1,
-0.9045239, 2.465163, -0.5089583, 1, 1, 1, 1, 1,
-0.9011573, 1.129236, 0.5461918, 1, 1, 1, 1, 1,
-0.8981149, -0.7647709, -2.051284, 1, 1, 1, 1, 1,
-0.8931489, 1.799683, -1.7597, 1, 1, 1, 1, 1,
-0.8880742, 0.3113295, -0.1643432, 1, 1, 1, 1, 1,
-0.8845109, -0.9395077, -2.263171, 1, 1, 1, 1, 1,
-0.8814159, 0.7601024, -2.641305, 1, 1, 1, 1, 1,
-0.8780389, -0.1485364, -3.264338, 0, 0, 1, 1, 1,
-0.8760738, 0.3261279, -0.7062199, 1, 0, 0, 1, 1,
-0.8756602, -0.993835, -4.530025, 1, 0, 0, 1, 1,
-0.8731949, 0.04627877, 0.7184227, 1, 0, 0, 1, 1,
-0.8726652, -1.805111, -3.810919, 1, 0, 0, 1, 1,
-0.8655518, 0.355721, -1.543343, 1, 0, 0, 1, 1,
-0.8621162, -0.2212993, -1.459454, 0, 0, 0, 1, 1,
-0.860129, 2.336167, 1.559696, 0, 0, 0, 1, 1,
-0.8546464, 0.2353312, -1.033984, 0, 0, 0, 1, 1,
-0.8539165, 0.7159454, -0.2818641, 0, 0, 0, 1, 1,
-0.8536072, 0.02706367, -0.8795807, 0, 0, 0, 1, 1,
-0.8529338, -2.057027, -4.014307, 0, 0, 0, 1, 1,
-0.8519545, 1.232229, 0.2429116, 0, 0, 0, 1, 1,
-0.8517287, -1.504094, -2.294892, 1, 1, 1, 1, 1,
-0.84983, 1.198241, -2.054907, 1, 1, 1, 1, 1,
-0.8395343, 0.3085675, -2.690796, 1, 1, 1, 1, 1,
-0.838092, -0.6190051, -1.886846, 1, 1, 1, 1, 1,
-0.8370417, -1.494549, -2.439675, 1, 1, 1, 1, 1,
-0.8368244, -1.01517, -1.998474, 1, 1, 1, 1, 1,
-0.8357223, 0.4945956, -1.609179, 1, 1, 1, 1, 1,
-0.8354122, -1.383373, -1.614172, 1, 1, 1, 1, 1,
-0.8336979, -0.2387564, -1.787813, 1, 1, 1, 1, 1,
-0.833195, -0.3130599, -1.454656, 1, 1, 1, 1, 1,
-0.8285342, -1.351702, -2.086255, 1, 1, 1, 1, 1,
-0.816406, -1.348579, -2.869118, 1, 1, 1, 1, 1,
-0.8161261, 0.7776093, -1.59705, 1, 1, 1, 1, 1,
-0.8085732, 0.2644163, -0.2191296, 1, 1, 1, 1, 1,
-0.8028693, 1.589999, -0.4851998, 1, 1, 1, 1, 1,
-0.8007339, -0.183655, -0.4443392, 0, 0, 1, 1, 1,
-0.7982011, 0.6682211, -0.7611563, 1, 0, 0, 1, 1,
-0.786474, 0.14428, -3.296988, 1, 0, 0, 1, 1,
-0.7845091, 1.346506, -1.273981, 1, 0, 0, 1, 1,
-0.7844453, -2.256088, -2.152569, 1, 0, 0, 1, 1,
-0.7829704, 0.9423797, -0.9926444, 1, 0, 0, 1, 1,
-0.7780461, 0.1012284, -1.675357, 0, 0, 0, 1, 1,
-0.7774582, -0.4301063, -4.336422, 0, 0, 0, 1, 1,
-0.7681904, -0.2487893, -1.182211, 0, 0, 0, 1, 1,
-0.7656961, 0.1712409, -1.91081, 0, 0, 0, 1, 1,
-0.7653741, 0.1509193, -2.459546, 0, 0, 0, 1, 1,
-0.7647284, 0.1178936, -2.409866, 0, 0, 0, 1, 1,
-0.7644542, -0.9845646, -2.670242, 0, 0, 0, 1, 1,
-0.7639444, 0.356097, -1.483534, 1, 1, 1, 1, 1,
-0.7619103, -1.018929, -0.6838618, 1, 1, 1, 1, 1,
-0.7467116, -0.684092, -2.410511, 1, 1, 1, 1, 1,
-0.7460471, -0.9553481, -1.74509, 1, 1, 1, 1, 1,
-0.7450736, 0.8491816, -3.65831, 1, 1, 1, 1, 1,
-0.7393382, 0.3702527, -1.836183, 1, 1, 1, 1, 1,
-0.7384844, -0.932528, -2.79286, 1, 1, 1, 1, 1,
-0.735855, -0.7260608, -2.871719, 1, 1, 1, 1, 1,
-0.7358188, -0.5645921, -4.079301, 1, 1, 1, 1, 1,
-0.734909, 1.364242, -0.7647104, 1, 1, 1, 1, 1,
-0.7345708, 0.1499407, -2.404287, 1, 1, 1, 1, 1,
-0.7329913, 0.3221376, -1.911327, 1, 1, 1, 1, 1,
-0.728722, 0.7564269, 0.09046748, 1, 1, 1, 1, 1,
-0.7235939, -1.011685, -2.177658, 1, 1, 1, 1, 1,
-0.7224884, 0.2792985, -1.877887, 1, 1, 1, 1, 1,
-0.7213293, -0.3867768, -1.298778, 0, 0, 1, 1, 1,
-0.7185513, 0.8011974, -1.047507, 1, 0, 0, 1, 1,
-0.7142854, 0.04777011, -3.107471, 1, 0, 0, 1, 1,
-0.7136653, -0.6784118, -3.264399, 1, 0, 0, 1, 1,
-0.7134994, -0.1346456, -3.057779, 1, 0, 0, 1, 1,
-0.7120505, 0.8191079, -1.912531, 1, 0, 0, 1, 1,
-0.7119756, -1.200542, -3.435227, 0, 0, 0, 1, 1,
-0.710946, -1.757031, -3.06233, 0, 0, 0, 1, 1,
-0.7080283, -0.03326471, -1.646286, 0, 0, 0, 1, 1,
-0.7067838, -0.75978, -1.004131, 0, 0, 0, 1, 1,
-0.7015101, 0.3133834, -2.454165, 0, 0, 0, 1, 1,
-0.6905217, -0.0940702, -3.439339, 0, 0, 0, 1, 1,
-0.6884569, 0.7290549, -1.387129, 0, 0, 0, 1, 1,
-0.6872758, -1.131276, -1.696431, 1, 1, 1, 1, 1,
-0.6863388, 0.7631646, -2.377168, 1, 1, 1, 1, 1,
-0.6854978, -1.948072, -3.582542, 1, 1, 1, 1, 1,
-0.6747525, 0.3028741, -1.468304, 1, 1, 1, 1, 1,
-0.6714575, 0.7783989, -0.7862452, 1, 1, 1, 1, 1,
-0.6676051, 0.247368, -0.7650811, 1, 1, 1, 1, 1,
-0.6571371, -0.3934111, -2.649363, 1, 1, 1, 1, 1,
-0.6478407, 1.917896, 0.3630208, 1, 1, 1, 1, 1,
-0.6418599, 0.5996507, -1.70244, 1, 1, 1, 1, 1,
-0.6388509, 0.8425744, -1.257609, 1, 1, 1, 1, 1,
-0.6352568, -2.099455, -3.075939, 1, 1, 1, 1, 1,
-0.6340471, 1.210339, -0.1189512, 1, 1, 1, 1, 1,
-0.6218255, 0.3676533, -0.2448731, 1, 1, 1, 1, 1,
-0.6193213, 1.273563, 0.1944381, 1, 1, 1, 1, 1,
-0.6192671, 0.1164516, -1.634981, 1, 1, 1, 1, 1,
-0.6146629, 1.42063, -2.262359, 0, 0, 1, 1, 1,
-0.6129304, 0.2433752, -2.459322, 1, 0, 0, 1, 1,
-0.6106501, 0.1725365, -1.752053, 1, 0, 0, 1, 1,
-0.6050079, -0.5010772, -2.332069, 1, 0, 0, 1, 1,
-0.6046618, 0.6716519, -1.122532, 1, 0, 0, 1, 1,
-0.6022403, 0.571814, 0.2704365, 1, 0, 0, 1, 1,
-0.5899441, 1.603623, -1.999814, 0, 0, 0, 1, 1,
-0.5866328, 0.4291164, -0.4935496, 0, 0, 0, 1, 1,
-0.5857418, -0.5552279, -1.672581, 0, 0, 0, 1, 1,
-0.5825202, 0.6555432, -2.124336, 0, 0, 0, 1, 1,
-0.5779424, -0.05576595, -2.693564, 0, 0, 0, 1, 1,
-0.5733889, 1.024033, -0.8798617, 0, 0, 0, 1, 1,
-0.5667977, -0.4792683, -0.9696777, 0, 0, 0, 1, 1,
-0.5582551, 0.04807858, -3.320193, 1, 1, 1, 1, 1,
-0.558253, -0.432433, -2.444999, 1, 1, 1, 1, 1,
-0.5581067, -1.274305, -3.422246, 1, 1, 1, 1, 1,
-0.5577421, -0.2224779, -0.4184583, 1, 1, 1, 1, 1,
-0.5434253, -0.5061346, -1.780927, 1, 1, 1, 1, 1,
-0.5429115, 1.402372, -1.680233, 1, 1, 1, 1, 1,
-0.5416126, -0.1172693, -1.961304, 1, 1, 1, 1, 1,
-0.5400417, 0.6178508, -0.1823912, 1, 1, 1, 1, 1,
-0.5391186, -0.4107767, -2.886866, 1, 1, 1, 1, 1,
-0.5344833, 0.5106176, -1.645701, 1, 1, 1, 1, 1,
-0.53308, 0.8817458, 0.7043052, 1, 1, 1, 1, 1,
-0.5293218, 2.454114, 0.1079269, 1, 1, 1, 1, 1,
-0.5266951, -0.3323128, -2.183992, 1, 1, 1, 1, 1,
-0.5207099, 0.8452489, -2.231428, 1, 1, 1, 1, 1,
-0.5087955, -0.9391257, -2.185041, 1, 1, 1, 1, 1,
-0.5078992, 1.825215, -0.2681468, 0, 0, 1, 1, 1,
-0.5074821, 1.416492, -0.4662648, 1, 0, 0, 1, 1,
-0.5054169, 1.352508, -1.194538, 1, 0, 0, 1, 1,
-0.5030162, 0.5950518, -0.9706879, 1, 0, 0, 1, 1,
-0.5026838, -0.06240356, -0.9628651, 1, 0, 0, 1, 1,
-0.4987066, 0.3214207, -1.726888, 1, 0, 0, 1, 1,
-0.4986999, 1.904172, -0.7634959, 0, 0, 0, 1, 1,
-0.4942895, -0.09237144, -2.605914, 0, 0, 0, 1, 1,
-0.4939325, -0.3055767, -4.428133, 0, 0, 0, 1, 1,
-0.490071, -1.088561, -2.451178, 0, 0, 0, 1, 1,
-0.4893946, 0.4589153, 0.01377129, 0, 0, 0, 1, 1,
-0.4889872, 0.6259755, -0.4999516, 0, 0, 0, 1, 1,
-0.4720659, -1.869441, -2.919097, 0, 0, 0, 1, 1,
-0.4710671, -2.079753, -3.125512, 1, 1, 1, 1, 1,
-0.4709568, 0.8627728, -2.086928, 1, 1, 1, 1, 1,
-0.469846, -0.4941162, -1.843505, 1, 1, 1, 1, 1,
-0.4577866, -0.436709, -1.391351, 1, 1, 1, 1, 1,
-0.456721, 1.09281, -1.001202, 1, 1, 1, 1, 1,
-0.4530875, 1.413079, -0.3565665, 1, 1, 1, 1, 1,
-0.4442006, -0.1696086, -2.433868, 1, 1, 1, 1, 1,
-0.4438483, 0.07716186, 1.532956, 1, 1, 1, 1, 1,
-0.4416359, 0.6335471, -0.6566259, 1, 1, 1, 1, 1,
-0.4361794, -1.011144, -2.215556, 1, 1, 1, 1, 1,
-0.43587, -1.229612, -3.578923, 1, 1, 1, 1, 1,
-0.425343, 0.3999368, -0.9232012, 1, 1, 1, 1, 1,
-0.4204252, -0.1153563, -0.2545727, 1, 1, 1, 1, 1,
-0.4060163, -0.9635335, -3.194216, 1, 1, 1, 1, 1,
-0.4030476, -0.5511756, -1.648156, 1, 1, 1, 1, 1,
-0.4019089, 2.743711, 0.5007128, 0, 0, 1, 1, 1,
-0.4008762, 0.3361798, -0.6127847, 1, 0, 0, 1, 1,
-0.3976878, 0.4954571, 0.6258946, 1, 0, 0, 1, 1,
-0.3963256, 0.03656029, -0.5452891, 1, 0, 0, 1, 1,
-0.3960924, -0.9412315, -1.700891, 1, 0, 0, 1, 1,
-0.3958255, -1.392895, -1.893383, 1, 0, 0, 1, 1,
-0.3956252, -0.1888009, -2.383475, 0, 0, 0, 1, 1,
-0.3953675, 0.03612714, -0.03405479, 0, 0, 0, 1, 1,
-0.3930917, -0.5407661, -2.739616, 0, 0, 0, 1, 1,
-0.388822, -0.2138902, -2.299109, 0, 0, 0, 1, 1,
-0.3874837, -0.216603, -1.499799, 0, 0, 0, 1, 1,
-0.3872168, 0.2192771, -1.419557, 0, 0, 0, 1, 1,
-0.3867088, -1.034463, -2.93408, 0, 0, 0, 1, 1,
-0.3768474, -0.4924816, -2.221651, 1, 1, 1, 1, 1,
-0.3761118, 0.316661, -0.9347152, 1, 1, 1, 1, 1,
-0.3718438, -0.2175493, -1.801765, 1, 1, 1, 1, 1,
-0.3707013, -1.739549, -2.384587, 1, 1, 1, 1, 1,
-0.3674766, -0.1626927, -2.454035, 1, 1, 1, 1, 1,
-0.3647195, 0.1982895, -1.757805, 1, 1, 1, 1, 1,
-0.36247, -0.03060979, 0.4231104, 1, 1, 1, 1, 1,
-0.3599334, -0.235792, -1.281831, 1, 1, 1, 1, 1,
-0.3531848, -1.887983, -2.642857, 1, 1, 1, 1, 1,
-0.3436005, -0.03597277, -2.704742, 1, 1, 1, 1, 1,
-0.3430141, 1.003237, -0.09865732, 1, 1, 1, 1, 1,
-0.3372805, -0.3348183, -1.797037, 1, 1, 1, 1, 1,
-0.3318261, 0.1984124, 1.006258, 1, 1, 1, 1, 1,
-0.3304895, -1.276613, -4.079659, 1, 1, 1, 1, 1,
-0.328765, 0.06127115, -3.555412, 1, 1, 1, 1, 1,
-0.3279358, -1.78025, -3.472727, 0, 0, 1, 1, 1,
-0.3244531, 0.2843992, -1.241054, 1, 0, 0, 1, 1,
-0.3221381, -1.287794, -5.846727, 1, 0, 0, 1, 1,
-0.3210872, -0.8664485, -2.940734, 1, 0, 0, 1, 1,
-0.3198646, -1.072382, -4.570145, 1, 0, 0, 1, 1,
-0.3161469, -0.1915506, -3.517533, 1, 0, 0, 1, 1,
-0.3161271, 0.3854361, -1.008113, 0, 0, 0, 1, 1,
-0.3156032, 0.1135525, -0.0514756, 0, 0, 0, 1, 1,
-0.3125043, -1.959051, -2.953708, 0, 0, 0, 1, 1,
-0.3123244, 0.8388216, -0.251957, 0, 0, 0, 1, 1,
-0.3092059, 1.035038, -1.945549, 0, 0, 0, 1, 1,
-0.3090233, -1.335815, -4.599263, 0, 0, 0, 1, 1,
-0.3067656, 0.2431503, -1.698127, 0, 0, 0, 1, 1,
-0.3066652, -1.13732, -1.186805, 1, 1, 1, 1, 1,
-0.3065914, 0.1745602, -1.120436, 1, 1, 1, 1, 1,
-0.3064286, 1.340762, 0.99957, 1, 1, 1, 1, 1,
-0.3007888, 0.7611137, -0.2090554, 1, 1, 1, 1, 1,
-0.3004033, -0.5206355, -2.609693, 1, 1, 1, 1, 1,
-0.2974051, 0.2128546, -0.6120905, 1, 1, 1, 1, 1,
-0.2925899, 0.05058325, -0.7585849, 1, 1, 1, 1, 1,
-0.2822335, -1.13058, -3.084957, 1, 1, 1, 1, 1,
-0.280967, 1.248866, -0.8085421, 1, 1, 1, 1, 1,
-0.2767462, -0.9950395, -3.59053, 1, 1, 1, 1, 1,
-0.2739525, -0.2329617, -3.268387, 1, 1, 1, 1, 1,
-0.271015, -0.5247468, -3.866373, 1, 1, 1, 1, 1,
-0.2686216, -0.8887981, -3.39769, 1, 1, 1, 1, 1,
-0.2685751, -0.7222161, -2.811348, 1, 1, 1, 1, 1,
-0.266034, -0.04280291, -1.769906, 1, 1, 1, 1, 1,
-0.2657405, -1.822324, -3.47329, 0, 0, 1, 1, 1,
-0.2653501, 2.155799, 0.1288323, 1, 0, 0, 1, 1,
-0.2645627, 1.758987, 2.211892, 1, 0, 0, 1, 1,
-0.2632904, 0.6211231, 1.714679, 1, 0, 0, 1, 1,
-0.2624601, -0.1494448, -2.835406, 1, 0, 0, 1, 1,
-0.2618682, -0.6694833, -2.863938, 1, 0, 0, 1, 1,
-0.260286, 2.022997, 0.647338, 0, 0, 0, 1, 1,
-0.2602508, 0.4026574, 0.4058156, 0, 0, 0, 1, 1,
-0.2572761, 0.8957627, -0.7410967, 0, 0, 0, 1, 1,
-0.2486374, -0.2549437, -2.621298, 0, 0, 0, 1, 1,
-0.2458298, 0.7431618, -2.020992, 0, 0, 0, 1, 1,
-0.240246, 1.121192, -1.410384, 0, 0, 0, 1, 1,
-0.2400243, -0.09398881, -1.237589, 0, 0, 0, 1, 1,
-0.2370804, 0.863654, 0.1216344, 1, 1, 1, 1, 1,
-0.2369019, -0.2361953, -1.536303, 1, 1, 1, 1, 1,
-0.2286469, 0.3952894, -1.882361, 1, 1, 1, 1, 1,
-0.2232653, -0.8824195, -1.215363, 1, 1, 1, 1, 1,
-0.2186478, 0.04191886, -2.187899, 1, 1, 1, 1, 1,
-0.216546, -0.1850465, -2.619317, 1, 1, 1, 1, 1,
-0.2128722, 0.5744969, 0.05145273, 1, 1, 1, 1, 1,
-0.2114913, 1.229694, -1.097583, 1, 1, 1, 1, 1,
-0.2107107, -0.1053594, -2.824654, 1, 1, 1, 1, 1,
-0.2077434, 0.1284315, -0.6445374, 1, 1, 1, 1, 1,
-0.2007838, -0.1128005, -0.6923096, 1, 1, 1, 1, 1,
-0.1999985, 0.2390354, 0.3161218, 1, 1, 1, 1, 1,
-0.1952848, 0.6427934, -1.969081, 1, 1, 1, 1, 1,
-0.1941003, 0.2982297, -1.373836, 1, 1, 1, 1, 1,
-0.1930127, -0.7361306, -2.537393, 1, 1, 1, 1, 1,
-0.1925114, 1.281781, 1.08951, 0, 0, 1, 1, 1,
-0.1918767, 0.813149, -2.563137, 1, 0, 0, 1, 1,
-0.1894477, -1.254494, -1.347975, 1, 0, 0, 1, 1,
-0.1788974, 1.48767, 1.957772, 1, 0, 0, 1, 1,
-0.1773331, 0.9637206, 1.190874, 1, 0, 0, 1, 1,
-0.1745567, -0.7771875, -4.017447, 1, 0, 0, 1, 1,
-0.1743822, 0.04270436, -0.5055947, 0, 0, 0, 1, 1,
-0.1716262, 1.468151, -0.6242127, 0, 0, 0, 1, 1,
-0.1707089, -1.066213, -3.13147, 0, 0, 0, 1, 1,
-0.167038, -0.5783823, -2.590947, 0, 0, 0, 1, 1,
-0.1621548, -0.04894528, -0.5699071, 0, 0, 0, 1, 1,
-0.1619732, -1.148218, -2.512131, 0, 0, 0, 1, 1,
-0.1548989, -0.3412649, -3.376053, 0, 0, 0, 1, 1,
-0.1536025, -0.4472881, -3.432247, 1, 1, 1, 1, 1,
-0.1495069, -0.2252654, -2.454362, 1, 1, 1, 1, 1,
-0.1475865, -0.3022643, -2.300071, 1, 1, 1, 1, 1,
-0.147107, -1.241187, -2.203737, 1, 1, 1, 1, 1,
-0.1449643, -0.3149647, -4.063986, 1, 1, 1, 1, 1,
-0.1432247, -0.1679729, -1.895259, 1, 1, 1, 1, 1,
-0.1411495, 1.013519, -0.773228, 1, 1, 1, 1, 1,
-0.1408523, 0.3090366, 0.1774355, 1, 1, 1, 1, 1,
-0.1375333, 0.4153236, -0.9095985, 1, 1, 1, 1, 1,
-0.1309877, -1.941551, -4.414735, 1, 1, 1, 1, 1,
-0.1264559, 1.22489, 1.846001, 1, 1, 1, 1, 1,
-0.1252597, -0.3018349, -2.258769, 1, 1, 1, 1, 1,
-0.1242331, 0.3076389, 0.3121788, 1, 1, 1, 1, 1,
-0.1234772, 1.411324, 0.6213616, 1, 1, 1, 1, 1,
-0.1204147, 0.08437544, -1.874614, 1, 1, 1, 1, 1,
-0.1203792, -0.8419839, -2.581658, 0, 0, 1, 1, 1,
-0.1184916, 1.102843, -2.500727, 1, 0, 0, 1, 1,
-0.117991, 0.7517928, 0.5174978, 1, 0, 0, 1, 1,
-0.1098345, -0.4700926, -3.136885, 1, 0, 0, 1, 1,
-0.1096656, 0.2596356, 0.852012, 1, 0, 0, 1, 1,
-0.1092799, 1.288076, -0.03108507, 1, 0, 0, 1, 1,
-0.1037207, -2.101793, -4.259847, 0, 0, 0, 1, 1,
-0.1015488, -0.6104582, -4.751775, 0, 0, 0, 1, 1,
-0.09672227, -1.456742, -3.545979, 0, 0, 0, 1, 1,
-0.09599297, -0.4291647, -3.455937, 0, 0, 0, 1, 1,
-0.09488039, 1.266184, -0.1940507, 0, 0, 0, 1, 1,
-0.09470256, -0.6633551, -3.83117, 0, 0, 0, 1, 1,
-0.09390891, 1.209635, -1.080435, 0, 0, 0, 1, 1,
-0.09350951, -0.07713315, -3.882531, 1, 1, 1, 1, 1,
-0.09085388, 2.823722, 0.7571816, 1, 1, 1, 1, 1,
-0.0888336, 0.3862716, -2.015006, 1, 1, 1, 1, 1,
-0.08304906, -0.6496213, -1.566662, 1, 1, 1, 1, 1,
-0.07824782, -0.2689495, -2.109211, 1, 1, 1, 1, 1,
-0.07667047, 0.02447048, 1.199371, 1, 1, 1, 1, 1,
-0.07253082, -1.172931, -3.626227, 1, 1, 1, 1, 1,
-0.07068657, -0.03484476, -2.164388, 1, 1, 1, 1, 1,
-0.06628462, -0.9137894, -4.501287, 1, 1, 1, 1, 1,
-0.05610149, -1.252062, -3.817637, 1, 1, 1, 1, 1,
-0.05252111, -0.3180725, -1.199974, 1, 1, 1, 1, 1,
-0.05239144, 1.607354, -0.02031127, 1, 1, 1, 1, 1,
-0.05115022, -0.2161674, -3.251853, 1, 1, 1, 1, 1,
-0.05054865, -0.7348352, -4.055843, 1, 1, 1, 1, 1,
-0.04809282, -0.3760993, -5.148016, 1, 1, 1, 1, 1,
-0.04214342, 1.277777, -1.534878, 0, 0, 1, 1, 1,
-0.04062354, 0.7492372, -0.928025, 1, 0, 0, 1, 1,
-0.03596129, 0.3207276, 0.03870135, 1, 0, 0, 1, 1,
-0.03498017, -1.555939, -4.598302, 1, 0, 0, 1, 1,
-0.03263374, -0.1073861, -1.109949, 1, 0, 0, 1, 1,
-0.02672502, -1.547756, -3.518608, 1, 0, 0, 1, 1,
-0.02656124, -0.3565513, -3.767307, 0, 0, 0, 1, 1,
-0.02205255, -2.589981, -2.735687, 0, 0, 0, 1, 1,
-0.0201735, -0.4489538, -2.451409, 0, 0, 0, 1, 1,
-0.01941908, -1.022517, -5.230274, 0, 0, 0, 1, 1,
-0.01881961, 1.093619, -0.3740674, 0, 0, 0, 1, 1,
-0.01827982, -0.7655455, -1.747898, 0, 0, 0, 1, 1,
-0.01484692, 1.118215, 0.8186628, 0, 0, 0, 1, 1,
-0.01088197, 0.6554583, 0.3362066, 1, 1, 1, 1, 1,
-0.009936366, -0.4473902, -3.877616, 1, 1, 1, 1, 1,
0.001234222, -1.675573, 2.907795, 1, 1, 1, 1, 1,
0.001546117, 0.5983893, 0.5594044, 1, 1, 1, 1, 1,
0.005392977, 0.4635895, -2.07218, 1, 1, 1, 1, 1,
0.008875486, -0.5483534, 2.766425, 1, 1, 1, 1, 1,
0.01247466, 0.9088495, -0.8394815, 1, 1, 1, 1, 1,
0.01300919, -0.1764105, 2.923415, 1, 1, 1, 1, 1,
0.01317446, -0.4107337, 2.201793, 1, 1, 1, 1, 1,
0.01420282, 0.1479441, -0.3918927, 1, 1, 1, 1, 1,
0.01715666, -1.009288, 3.328552, 1, 1, 1, 1, 1,
0.01944565, 0.4111092, 0.30434, 1, 1, 1, 1, 1,
0.01990506, 0.8364216, 1.47034, 1, 1, 1, 1, 1,
0.02273678, 0.3712677, 0.9483077, 1, 1, 1, 1, 1,
0.02327353, -0.8041946, 3.270945, 1, 1, 1, 1, 1,
0.02593469, 0.6502314, -0.003765999, 0, 0, 1, 1, 1,
0.02675481, -2.074239, 2.676375, 1, 0, 0, 1, 1,
0.03287706, -1.920216, 4.140454, 1, 0, 0, 1, 1,
0.03342462, -2.017738, 1.428102, 1, 0, 0, 1, 1,
0.03610962, 1.226301, 1.407099, 1, 0, 0, 1, 1,
0.03660248, 0.7582016, 0.2596306, 1, 0, 0, 1, 1,
0.03988625, 0.9788334, 1.133441, 0, 0, 0, 1, 1,
0.04347591, 0.5152431, -1.112477, 0, 0, 0, 1, 1,
0.04650748, 1.610421, -1.104449, 0, 0, 0, 1, 1,
0.04808082, 2.11559, -0.8209546, 0, 0, 0, 1, 1,
0.05082241, -1.474404, 2.655982, 0, 0, 0, 1, 1,
0.05162052, -1.408796, 1.632447, 0, 0, 0, 1, 1,
0.05350073, 0.8137736, 0.5618899, 0, 0, 0, 1, 1,
0.05436545, 1.052538, -0.3017554, 1, 1, 1, 1, 1,
0.0552034, -0.5035288, 2.712321, 1, 1, 1, 1, 1,
0.05887176, 0.5168523, -0.4459184, 1, 1, 1, 1, 1,
0.05891906, 0.1580233, 0.2414167, 1, 1, 1, 1, 1,
0.06272531, -0.2555707, 3.213607, 1, 1, 1, 1, 1,
0.06377511, -1.490366, 0.7716334, 1, 1, 1, 1, 1,
0.06695637, -0.3803568, 3.817771, 1, 1, 1, 1, 1,
0.07363235, 1.184034, 1.399056, 1, 1, 1, 1, 1,
0.0746995, -0.520261, 4.923095, 1, 1, 1, 1, 1,
0.07782875, -0.8076368, 2.111551, 1, 1, 1, 1, 1,
0.07887504, -1.068696, 4.088354, 1, 1, 1, 1, 1,
0.08463547, -0.8935109, 2.571027, 1, 1, 1, 1, 1,
0.08744545, -1.83595, 3.484097, 1, 1, 1, 1, 1,
0.08762647, 0.5099112, 0.5908062, 1, 1, 1, 1, 1,
0.08861534, -3.130307, 2.986154, 1, 1, 1, 1, 1,
0.08907231, -0.6888825, 3.551135, 0, 0, 1, 1, 1,
0.09483272, 0.7762508, 1.15282, 1, 0, 0, 1, 1,
0.09560391, 0.7110299, -0.3225738, 1, 0, 0, 1, 1,
0.09574693, 0.1842443, -0.07857739, 1, 0, 0, 1, 1,
0.09732699, -1.271461, 3.066341, 1, 0, 0, 1, 1,
0.09734756, -2.151166, 2.976819, 1, 0, 0, 1, 1,
0.09919106, -0.5034836, 3.400198, 0, 0, 0, 1, 1,
0.09952125, -0.9084775, 1.86173, 0, 0, 0, 1, 1,
0.09957489, -0.1829304, 1.815451, 0, 0, 0, 1, 1,
0.0996225, -0.3986773, 3.834639, 0, 0, 0, 1, 1,
0.1023347, 0.5683827, -1.910477, 0, 0, 0, 1, 1,
0.1041049, 0.04907688, 0.9349068, 0, 0, 0, 1, 1,
0.1116505, 0.1321242, -1.065415, 0, 0, 0, 1, 1,
0.112038, 0.1896432, -0.2859804, 1, 1, 1, 1, 1,
0.112773, -0.1460508, 2.637291, 1, 1, 1, 1, 1,
0.1245334, -0.3620786, 2.876308, 1, 1, 1, 1, 1,
0.1248518, 0.08195647, 2.229355, 1, 1, 1, 1, 1,
0.127228, -0.2399835, 4.013184, 1, 1, 1, 1, 1,
0.1452733, -0.4941819, 2.300356, 1, 1, 1, 1, 1,
0.1459493, 0.1763911, 0.6633202, 1, 1, 1, 1, 1,
0.1496381, 0.6223797, 0.8187158, 1, 1, 1, 1, 1,
0.1527166, 0.5525515, -0.02951356, 1, 1, 1, 1, 1,
0.159429, 2.353451, -1.776244, 1, 1, 1, 1, 1,
0.1599759, -1.237085, 5.407358, 1, 1, 1, 1, 1,
0.160661, -0.1180602, 3.094505, 1, 1, 1, 1, 1,
0.1647737, -0.2648713, 0.7612914, 1, 1, 1, 1, 1,
0.1651584, -0.4364873, 2.535846, 1, 1, 1, 1, 1,
0.1738046, -0.06962826, 2.815782, 1, 1, 1, 1, 1,
0.1739781, -1.05829, 3.396861, 0, 0, 1, 1, 1,
0.1745193, 1.941092, -0.2776863, 1, 0, 0, 1, 1,
0.1867917, 0.7773734, 1.108018, 1, 0, 0, 1, 1,
0.1950692, -0.2312182, 2.174382, 1, 0, 0, 1, 1,
0.1951063, -0.8755534, 1.604166, 1, 0, 0, 1, 1,
0.2024586, 0.6225728, 1.542953, 1, 0, 0, 1, 1,
0.2117562, 0.8339691, 0.8943761, 0, 0, 0, 1, 1,
0.2129896, -0.112647, 1.921425, 0, 0, 0, 1, 1,
0.2142827, 0.6638492, 0.8094904, 0, 0, 0, 1, 1,
0.2166625, -0.8461879, 2.537309, 0, 0, 0, 1, 1,
0.2231341, 0.04743139, 1.218258, 0, 0, 0, 1, 1,
0.2271276, 0.7225515, 3.403295, 0, 0, 0, 1, 1,
0.2282256, 0.7071741, -0.01833739, 0, 0, 0, 1, 1,
0.2313939, 0.5407293, 0.360825, 1, 1, 1, 1, 1,
0.2339296, -1.726498, 5.383433, 1, 1, 1, 1, 1,
0.2345563, 0.1485494, 1.402363, 1, 1, 1, 1, 1,
0.2371975, -1.547545, 3.250889, 1, 1, 1, 1, 1,
0.2396009, -0.1442414, 3.109281, 1, 1, 1, 1, 1,
0.2408764, 2.51312, -0.3180893, 1, 1, 1, 1, 1,
0.2410093, -0.4285138, 1.174597, 1, 1, 1, 1, 1,
0.241293, -1.103372, 1.882172, 1, 1, 1, 1, 1,
0.2453294, 0.04289073, 2.340584, 1, 1, 1, 1, 1,
0.2478641, -0.9250077, 4.809381, 1, 1, 1, 1, 1,
0.2490196, -1.626899, 2.369797, 1, 1, 1, 1, 1,
0.2500846, -0.3763334, 1.738384, 1, 1, 1, 1, 1,
0.2540402, 0.2551073, 0.1504767, 1, 1, 1, 1, 1,
0.2545559, 1.466002, 0.5272959, 1, 1, 1, 1, 1,
0.2580168, 1.251029, 1.426037, 1, 1, 1, 1, 1,
0.2596729, 1.393394, 0.4396331, 0, 0, 1, 1, 1,
0.260488, 0.4735473, 0.2053533, 1, 0, 0, 1, 1,
0.2630701, 0.991316, -0.6054289, 1, 0, 0, 1, 1,
0.2662663, -0.2389727, 2.19247, 1, 0, 0, 1, 1,
0.2716163, 0.05692286, 2.46094, 1, 0, 0, 1, 1,
0.2718983, 0.5160912, 1.979224, 1, 0, 0, 1, 1,
0.2742759, -2.170867, 3.231486, 0, 0, 0, 1, 1,
0.2748163, -1.004699, 3.639764, 0, 0, 0, 1, 1,
0.2942966, -0.6742745, 2.630289, 0, 0, 0, 1, 1,
0.2962824, -1.971135, 3.347416, 0, 0, 0, 1, 1,
0.2971494, -0.5747671, 1.74515, 0, 0, 0, 1, 1,
0.298033, 0.6961961, 0.5871091, 0, 0, 0, 1, 1,
0.3031964, 1.194983, 0.1086734, 0, 0, 0, 1, 1,
0.3055433, 0.06041271, 1.410706, 1, 1, 1, 1, 1,
0.3056684, 0.4846639, -0.9456648, 1, 1, 1, 1, 1,
0.3142146, 0.736445, -0.3197699, 1, 1, 1, 1, 1,
0.3144354, -0.8011804, 1.808877, 1, 1, 1, 1, 1,
0.3154933, -0.36329, 2.241235, 1, 1, 1, 1, 1,
0.31613, 0.338055, 0.6574484, 1, 1, 1, 1, 1,
0.3164791, -0.8220959, 2.015845, 1, 1, 1, 1, 1,
0.3178879, 0.02951218, 0.933374, 1, 1, 1, 1, 1,
0.3253614, 2.722077, -0.5448828, 1, 1, 1, 1, 1,
0.3312936, 0.623617, -0.7385123, 1, 1, 1, 1, 1,
0.3330563, -0.04199725, 2.841279, 1, 1, 1, 1, 1,
0.3345871, -1.579902, 3.819981, 1, 1, 1, 1, 1,
0.3374043, 0.2682097, -0.2582603, 1, 1, 1, 1, 1,
0.3384069, -0.7052541, 1.773182, 1, 1, 1, 1, 1,
0.3417443, -1.022197, 2.906364, 1, 1, 1, 1, 1,
0.3432803, -1.458079, 3.354976, 0, 0, 1, 1, 1,
0.3483034, -0.2943226, 1.228854, 1, 0, 0, 1, 1,
0.3490983, 0.1402979, -1.393919, 1, 0, 0, 1, 1,
0.3492738, 0.1941543, 0.4025705, 1, 0, 0, 1, 1,
0.3496111, -0.228689, 1.469487, 1, 0, 0, 1, 1,
0.353635, 0.05858829, 2.956229, 1, 0, 0, 1, 1,
0.3547384, -0.4248303, 1.480379, 0, 0, 0, 1, 1,
0.3570222, 1.538419, -0.2676376, 0, 0, 0, 1, 1,
0.3575388, -1.048918, 3.574814, 0, 0, 0, 1, 1,
0.3594985, -0.1874859, 0.6265031, 0, 0, 0, 1, 1,
0.3634835, -0.8370116, 3.821857, 0, 0, 0, 1, 1,
0.3665531, -0.6053864, 0.837498, 0, 0, 0, 1, 1,
0.3733789, 0.1149696, 1.385855, 0, 0, 0, 1, 1,
0.3761455, 0.9886687, -0.2498216, 1, 1, 1, 1, 1,
0.3763612, 1.27508, 0.8697829, 1, 1, 1, 1, 1,
0.3765135, -1.888926, 3.371196, 1, 1, 1, 1, 1,
0.3766485, 0.5994345, 2.421261, 1, 1, 1, 1, 1,
0.3768867, 0.5178391, 0.4405368, 1, 1, 1, 1, 1,
0.3794446, 1.561681, -0.4260076, 1, 1, 1, 1, 1,
0.385359, -0.07685577, 0.9552101, 1, 1, 1, 1, 1,
0.3882535, -0.5946874, 1.698588, 1, 1, 1, 1, 1,
0.3910738, 0.7290136, 0.03402968, 1, 1, 1, 1, 1,
0.3946089, -1.814005, 4.132531, 1, 1, 1, 1, 1,
0.399821, -1.168107, 2.953894, 1, 1, 1, 1, 1,
0.4032318, -1.017644, 2.307863, 1, 1, 1, 1, 1,
0.4050674, 0.5221828, 0.3083222, 1, 1, 1, 1, 1,
0.4110612, 1.492688, -1.090292, 1, 1, 1, 1, 1,
0.4149034, -0.07971463, 1.341943, 1, 1, 1, 1, 1,
0.416416, -0.8601748, 2.546723, 0, 0, 1, 1, 1,
0.4181772, 0.0461631, 2.632827, 1, 0, 0, 1, 1,
0.4189248, 1.821285, 1.564725, 1, 0, 0, 1, 1,
0.425309, 0.9907757, 0.7573011, 1, 0, 0, 1, 1,
0.4278785, 0.231499, 1.616395, 1, 0, 0, 1, 1,
0.4279168, -0.8181221, 1.551134, 1, 0, 0, 1, 1,
0.434816, 0.7541592, 0.2624084, 0, 0, 0, 1, 1,
0.4358031, -0.7274736, 2.697375, 0, 0, 0, 1, 1,
0.4382724, 0.7535411, 0.384605, 0, 0, 0, 1, 1,
0.4384729, -0.1661882, 2.19299, 0, 0, 0, 1, 1,
0.441614, 0.2401471, 0.6297092, 0, 0, 0, 1, 1,
0.442311, -0.2907223, 3.582329, 0, 0, 0, 1, 1,
0.4465848, -0.6938384, 2.591212, 0, 0, 0, 1, 1,
0.4499121, -0.07321984, 1.024494, 1, 1, 1, 1, 1,
0.4510817, 0.8800475, -1.789285, 1, 1, 1, 1, 1,
0.4581563, -1.215652, 1.787249, 1, 1, 1, 1, 1,
0.460458, -0.5961758, 4.590089, 1, 1, 1, 1, 1,
0.4610758, 1.317948, 0.216249, 1, 1, 1, 1, 1,
0.4621234, -1.411048, 3.201221, 1, 1, 1, 1, 1,
0.4626562, -1.836055, 2.326394, 1, 1, 1, 1, 1,
0.462667, -1.133605, 1.990421, 1, 1, 1, 1, 1,
0.4699076, 1.163267, 0.2628508, 1, 1, 1, 1, 1,
0.4703812, -0.6041144, -0.7699692, 1, 1, 1, 1, 1,
0.4745839, 0.2880303, 0.5679496, 1, 1, 1, 1, 1,
0.4789959, -0.1133399, 3.175284, 1, 1, 1, 1, 1,
0.4790668, 0.8740777, 0.5236451, 1, 1, 1, 1, 1,
0.4840278, -0.6004261, 2.612719, 1, 1, 1, 1, 1,
0.4856674, 1.061877, 0.5116597, 1, 1, 1, 1, 1,
0.4859069, -1.609206, 2.587354, 0, 0, 1, 1, 1,
0.4882101, 0.1604134, -1.419532, 1, 0, 0, 1, 1,
0.4904862, 0.04516061, 1.914183, 1, 0, 0, 1, 1,
0.4940214, 0.3447873, 0.4721989, 1, 0, 0, 1, 1,
0.4996588, 0.3206338, 0.3040905, 1, 0, 0, 1, 1,
0.5008219, 2.395745, 0.02837752, 1, 0, 0, 1, 1,
0.5138209, 0.5920054, 1.369637, 0, 0, 0, 1, 1,
0.515893, -0.02255533, 0.5128285, 0, 0, 0, 1, 1,
0.5159562, 1.071536, 0.06894606, 0, 0, 0, 1, 1,
0.5171504, 0.3382614, 0.2638184, 0, 0, 0, 1, 1,
0.5172966, 0.8252299, 1.635978, 0, 0, 0, 1, 1,
0.5242759, 1.875261, 0.7812867, 0, 0, 0, 1, 1,
0.5248106, 1.554496, 0.4276404, 0, 0, 0, 1, 1,
0.5286903, -1.427794, 2.405362, 1, 1, 1, 1, 1,
0.5317069, -0.9892783, 3.197008, 1, 1, 1, 1, 1,
0.5319732, 0.5515525, 2.364193, 1, 1, 1, 1, 1,
0.5329455, -0.9733199, 4.592256, 1, 1, 1, 1, 1,
0.5337557, -0.7479324, 3.660216, 1, 1, 1, 1, 1,
0.53472, 0.6647276, 0.3149272, 1, 1, 1, 1, 1,
0.5354216, 0.7637185, 1.930478, 1, 1, 1, 1, 1,
0.5357823, -1.467753, 2.166292, 1, 1, 1, 1, 1,
0.5367417, 0.4765181, 1.345514, 1, 1, 1, 1, 1,
0.5400259, 0.5540987, 0.2623121, 1, 1, 1, 1, 1,
0.5417702, -0.8187275, 4.567026, 1, 1, 1, 1, 1,
0.5439048, -0.3381004, 1.667692, 1, 1, 1, 1, 1,
0.5459735, 2.190776, 1.070629, 1, 1, 1, 1, 1,
0.5516802, 0.6145463, -1.27612, 1, 1, 1, 1, 1,
0.5540084, 0.8676057, -0.1967064, 1, 1, 1, 1, 1,
0.5546961, -0.01304019, -0.08022351, 0, 0, 1, 1, 1,
0.5561096, 0.1543947, 2.616358, 1, 0, 0, 1, 1,
0.5564247, 0.334633, 1.044772, 1, 0, 0, 1, 1,
0.5588672, -1.148195, 1.055389, 1, 0, 0, 1, 1,
0.5595865, 2.045759, -0.6106846, 1, 0, 0, 1, 1,
0.562618, 0.4343972, 0.9520892, 1, 0, 0, 1, 1,
0.5639396, -1.990498, 2.856336, 0, 0, 0, 1, 1,
0.5649977, 1.088259, -0.5588329, 0, 0, 0, 1, 1,
0.5672512, 0.02424644, 3.184802, 0, 0, 0, 1, 1,
0.5681678, -0.9549036, 1.086647, 0, 0, 0, 1, 1,
0.5697665, -1.043345, 5.347235, 0, 0, 0, 1, 1,
0.5757506, 0.2336833, 1.543134, 0, 0, 0, 1, 1,
0.5792606, -0.3116892, 1.949148, 0, 0, 0, 1, 1,
0.5797905, -0.6177771, 2.147841, 1, 1, 1, 1, 1,
0.580029, -1.57454, 2.861296, 1, 1, 1, 1, 1,
0.5809126, 1.850915, -0.8637179, 1, 1, 1, 1, 1,
0.5878894, -0.5609266, 3.299386, 1, 1, 1, 1, 1,
0.5885363, 0.7980003, 1.785858, 1, 1, 1, 1, 1,
0.5926235, 1.735897, -1.719835, 1, 1, 1, 1, 1,
0.5944226, 0.1106898, 0.5542969, 1, 1, 1, 1, 1,
0.5982684, -1.168764, 3.9527, 1, 1, 1, 1, 1,
0.599318, -0.2946622, 1.001616, 1, 1, 1, 1, 1,
0.6041889, 1.760429, 1.475416, 1, 1, 1, 1, 1,
0.6081057, 0.728077, -0.07786784, 1, 1, 1, 1, 1,
0.6161649, -1.830749, 3.248296, 1, 1, 1, 1, 1,
0.620741, -1.891302, 3.661402, 1, 1, 1, 1, 1,
0.6215928, -0.3369423, 1.653912, 1, 1, 1, 1, 1,
0.6220176, -1.472509, 1.978857, 1, 1, 1, 1, 1,
0.6290268, 1.321175, 0.09666372, 0, 0, 1, 1, 1,
0.6291725, 0.9325213, -0.4434246, 1, 0, 0, 1, 1,
0.6330226, 0.3806349, 0.9398094, 1, 0, 0, 1, 1,
0.6366332, -0.4237536, 0.9368855, 1, 0, 0, 1, 1,
0.6385844, -0.2145841, 1.227841, 1, 0, 0, 1, 1,
0.6389548, -0.5595492, 4.265639, 1, 0, 0, 1, 1,
0.641574, -0.8404909, 2.644173, 0, 0, 0, 1, 1,
0.641805, 0.1049975, 1.082536, 0, 0, 0, 1, 1,
0.6418179, 1.498388, 1.262978, 0, 0, 0, 1, 1,
0.6438063, -0.9405966, 4.565252, 0, 0, 0, 1, 1,
0.647294, 0.0490114, 2.311139, 0, 0, 0, 1, 1,
0.6506515, 0.5747268, -0.4373045, 0, 0, 0, 1, 1,
0.6526015, 0.6655754, 0.7771283, 0, 0, 0, 1, 1,
0.6674604, -1.89199, 3.926763, 1, 1, 1, 1, 1,
0.6679073, 0.420748, 1.854253, 1, 1, 1, 1, 1,
0.6722509, 0.4431139, 1.625542, 1, 1, 1, 1, 1,
0.6737337, 1.882139, -0.9042221, 1, 1, 1, 1, 1,
0.675743, -0.08742193, 2.483881, 1, 1, 1, 1, 1,
0.6771126, 0.5955548, 1.015152, 1, 1, 1, 1, 1,
0.6776311, -0.5704498, 3.240598, 1, 1, 1, 1, 1,
0.6786255, 0.05219119, 1.664864, 1, 1, 1, 1, 1,
0.6806406, 0.01646429, 1.710997, 1, 1, 1, 1, 1,
0.6810635, 1.164543, -0.9020169, 1, 1, 1, 1, 1,
0.6834684, -0.9484135, 2.953969, 1, 1, 1, 1, 1,
0.6837429, 0.6109893, 0.7854397, 1, 1, 1, 1, 1,
0.6845325, -0.8096301, 3.506268, 1, 1, 1, 1, 1,
0.6955587, -1.515827, 4.527902, 1, 1, 1, 1, 1,
0.6961669, -1.763695, 4.481266, 1, 1, 1, 1, 1,
0.7011153, 1.478875, -1.207722, 0, 0, 1, 1, 1,
0.7047154, 0.7259592, 1.586604, 1, 0, 0, 1, 1,
0.7061096, 0.04012593, 0.7928043, 1, 0, 0, 1, 1,
0.7136589, 1.112565, -0.5032732, 1, 0, 0, 1, 1,
0.7272501, -1.412831, 1.755756, 1, 0, 0, 1, 1,
0.7281119, -0.01301643, 0.964744, 1, 0, 0, 1, 1,
0.7281408, 0.07682854, 1.841008, 0, 0, 0, 1, 1,
0.7336336, 0.7375687, 0.455385, 0, 0, 0, 1, 1,
0.7393734, -1.120378, 2.921714, 0, 0, 0, 1, 1,
0.7409093, 0.8242843, 2.028506, 0, 0, 0, 1, 1,
0.7422486, 0.4355144, 1.067136, 0, 0, 0, 1, 1,
0.7501251, -0.6316011, 3.848377, 0, 0, 0, 1, 1,
0.7560153, 0.1442856, 1.14967, 0, 0, 0, 1, 1,
0.7560875, 1.175819, 0.425457, 1, 1, 1, 1, 1,
0.7582495, -2.11912, 3.24614, 1, 1, 1, 1, 1,
0.7616742, 0.445639, 0.700531, 1, 1, 1, 1, 1,
0.7686573, -0.5912127, 3.797364, 1, 1, 1, 1, 1,
0.7694154, -1.640022, 3.153023, 1, 1, 1, 1, 1,
0.7695961, -1.746177, 2.042367, 1, 1, 1, 1, 1,
0.7711409, 0.7390634, -0.08407225, 1, 1, 1, 1, 1,
0.7720959, 0.2215349, 1.82884, 1, 1, 1, 1, 1,
0.772946, -0.35547, 1.840624, 1, 1, 1, 1, 1,
0.7811174, -0.627463, 1.958155, 1, 1, 1, 1, 1,
0.7818463, -1.836324, 1.414263, 1, 1, 1, 1, 1,
0.7861026, 1.628367, -1.263705, 1, 1, 1, 1, 1,
0.7877183, -0.2105984, 2.791511, 1, 1, 1, 1, 1,
0.7899864, 0.01081632, 0.08336016, 1, 1, 1, 1, 1,
0.7914854, -0.896281, 1.608227, 1, 1, 1, 1, 1,
0.7946956, -0.6886961, 2.763793, 0, 0, 1, 1, 1,
0.8058032, -2.40216, 3.245851, 1, 0, 0, 1, 1,
0.8106809, -0.8748658, 2.403024, 1, 0, 0, 1, 1,
0.8120397, 0.8749016, 0.4306161, 1, 0, 0, 1, 1,
0.8142652, 0.7651526, 1.004658, 1, 0, 0, 1, 1,
0.8178358, 0.1691372, 1.828205, 1, 0, 0, 1, 1,
0.8186982, 1.052638, 0.9758376, 0, 0, 0, 1, 1,
0.8390153, 0.3168849, 1.345935, 0, 0, 0, 1, 1,
0.8395365, 0.98927, 0.4448814, 0, 0, 0, 1, 1,
0.8442559, -1.006679, 2.368148, 0, 0, 0, 1, 1,
0.8475559, -1.042103, 2.148286, 0, 0, 0, 1, 1,
0.8480698, -0.7820956, 1.190091, 0, 0, 0, 1, 1,
0.8531265, 0.5878631, 0.6494033, 0, 0, 0, 1, 1,
0.8616913, -0.8215134, 2.232422, 1, 1, 1, 1, 1,
0.8622329, -0.2999604, 1.23719, 1, 1, 1, 1, 1,
0.863525, -1.167968, 4.957215, 1, 1, 1, 1, 1,
0.8668982, 0.6440191, 1.105976, 1, 1, 1, 1, 1,
0.8698062, 1.315073, 2.35146, 1, 1, 1, 1, 1,
0.8708567, 1.264205, 0.6186098, 1, 1, 1, 1, 1,
0.871549, 1.825034, 2.90248, 1, 1, 1, 1, 1,
0.8743485, 1.66388, -0.5050798, 1, 1, 1, 1, 1,
0.8752688, -0.2063247, 1.810585, 1, 1, 1, 1, 1,
0.8817567, -0.6909537, 2.465238, 1, 1, 1, 1, 1,
0.8847004, 3.154694, 1.861533, 1, 1, 1, 1, 1,
0.8882337, 0.4599511, 1.895862, 1, 1, 1, 1, 1,
0.8895947, 0.355579, 1.388935, 1, 1, 1, 1, 1,
0.8925816, -0.7630015, 1.571564, 1, 1, 1, 1, 1,
0.9018264, -1.239441, 1.785355, 1, 1, 1, 1, 1,
0.9064644, 1.615741, 0.475841, 0, 0, 1, 1, 1,
0.9066962, 1.160777, 0.9664875, 1, 0, 0, 1, 1,
0.913324, -2.096178, 0.8022246, 1, 0, 0, 1, 1,
0.9172245, 0.6733265, 1.497595, 1, 0, 0, 1, 1,
0.9178426, -1.262961, 3.030028, 1, 0, 0, 1, 1,
0.9185872, -2.264809, 4.580944, 1, 0, 0, 1, 1,
0.9203992, 0.2359098, 4.14508, 0, 0, 0, 1, 1,
0.9242403, -1.012047, 0.6278175, 0, 0, 0, 1, 1,
0.9336336, -0.7280928, 2.534234, 0, 0, 0, 1, 1,
0.9338996, 0.4001402, -0.1562204, 0, 0, 0, 1, 1,
0.9378653, 0.02103095, 0.9661081, 0, 0, 0, 1, 1,
0.939746, 0.3881607, 0.7988941, 0, 0, 0, 1, 1,
0.9397605, -0.1702014, 0.7711222, 0, 0, 0, 1, 1,
0.9423195, -1.588782, 4.117228, 1, 1, 1, 1, 1,
0.9505432, 2.317786, 0.3016976, 1, 1, 1, 1, 1,
0.9535683, -0.2659064, 1.361202, 1, 1, 1, 1, 1,
0.9582061, -0.9317604, 1.956622, 1, 1, 1, 1, 1,
0.9596305, -1.449146, 1.510229, 1, 1, 1, 1, 1,
0.9640654, -1.469645, 1.217352, 1, 1, 1, 1, 1,
0.9658217, -0.0278246, 2.527914, 1, 1, 1, 1, 1,
0.9667479, 0.2672029, 3.125126, 1, 1, 1, 1, 1,
0.9679688, -0.6536156, 3.312967, 1, 1, 1, 1, 1,
0.9766265, 2.16901, 0.06844983, 1, 1, 1, 1, 1,
0.9806045, 0.6541877, 0.07969029, 1, 1, 1, 1, 1,
0.9875578, -1.022509, 1.670061, 1, 1, 1, 1, 1,
0.988444, -0.4706214, 3.110279, 1, 1, 1, 1, 1,
0.9951215, 1.809261, 0.4902187, 1, 1, 1, 1, 1,
1.001846, -0.5591021, 2.894072, 1, 1, 1, 1, 1,
1.004831, 0.5540386, 2.200874, 0, 0, 1, 1, 1,
1.005642, 0.11115, 0.2158, 1, 0, 0, 1, 1,
1.008493, 1.246531, 0.6639086, 1, 0, 0, 1, 1,
1.021016, 0.1586013, 0.6749348, 1, 0, 0, 1, 1,
1.024398, 0.5656506, 0.5412849, 1, 0, 0, 1, 1,
1.026348, -0.03536233, 0.4584032, 1, 0, 0, 1, 1,
1.028523, -0.01738078, 2.917409, 0, 0, 0, 1, 1,
1.03181, 0.7466035, 0.7268417, 0, 0, 0, 1, 1,
1.032299, 1.592581, 0.6346465, 0, 0, 0, 1, 1,
1.032608, -0.8476365, 3.696995, 0, 0, 0, 1, 1,
1.033102, -0.4049159, 1.278071, 0, 0, 0, 1, 1,
1.044307, 0.1628415, 1.697646, 0, 0, 0, 1, 1,
1.054668, 0.2962149, 1.298489, 0, 0, 0, 1, 1,
1.05518, -1.067916, 3.482594, 1, 1, 1, 1, 1,
1.057123, -0.9741654, 1.197272, 1, 1, 1, 1, 1,
1.057783, -0.3611075, 2.081139, 1, 1, 1, 1, 1,
1.065899, -0.7962189, 3.152835, 1, 1, 1, 1, 1,
1.070144, 0.109572, -0.127368, 1, 1, 1, 1, 1,
1.074098, 0.1432647, 0.8121805, 1, 1, 1, 1, 1,
1.077076, -0.04388369, 2.093231, 1, 1, 1, 1, 1,
1.091372, 0.3850856, 1.148312, 1, 1, 1, 1, 1,
1.092278, -1.194805, 4.211253, 1, 1, 1, 1, 1,
1.095852, -0.5086259, 2.1042, 1, 1, 1, 1, 1,
1.096318, -0.357099, 0.9918543, 1, 1, 1, 1, 1,
1.105402, 0.5761855, 0.695932, 1, 1, 1, 1, 1,
1.113447, 0.9962583, 0.5461907, 1, 1, 1, 1, 1,
1.123618, -0.0971066, 1.748928, 1, 1, 1, 1, 1,
1.125859, 1.031257, 0.6074619, 1, 1, 1, 1, 1,
1.126856, 0.3228098, 1.845548, 0, 0, 1, 1, 1,
1.129925, 0.5802464, 0.4784867, 1, 0, 0, 1, 1,
1.132717, -0.07809099, 1.181042, 1, 0, 0, 1, 1,
1.138463, -1.386483, 5.425594, 1, 0, 0, 1, 1,
1.150888, 0.7244315, 0.4740201, 1, 0, 0, 1, 1,
1.150949, -0.186448, 1.019653, 1, 0, 0, 1, 1,
1.15542, 1.276015, 2.256491, 0, 0, 0, 1, 1,
1.162222, -0.1599245, 0.7023246, 0, 0, 0, 1, 1,
1.165311, 0.01494082, 2.434801, 0, 0, 0, 1, 1,
1.165734, 0.9666196, 1.069846, 0, 0, 0, 1, 1,
1.173226, -0.3382176, 2.622819, 0, 0, 0, 1, 1,
1.173936, 1.288774, -0.04369142, 0, 0, 0, 1, 1,
1.182957, 0.814868, 0.02073951, 0, 0, 0, 1, 1,
1.195531, -1.448843, 2.413476, 1, 1, 1, 1, 1,
1.205556, 0.5940127, 1.72473, 1, 1, 1, 1, 1,
1.207084, -0.0556042, 3.192697, 1, 1, 1, 1, 1,
1.211866, -0.2569984, 1.498139, 1, 1, 1, 1, 1,
1.213663, 1.809191, 0.1067969, 1, 1, 1, 1, 1,
1.219895, -1.678141, 3.231462, 1, 1, 1, 1, 1,
1.232619, 1.768877, 0.8465628, 1, 1, 1, 1, 1,
1.236006, -2.161826, 1.408888, 1, 1, 1, 1, 1,
1.252101, -0.3204929, 1.38181, 1, 1, 1, 1, 1,
1.260309, 0.7040315, 0.1761597, 1, 1, 1, 1, 1,
1.269451, -0.6576665, 1.434941, 1, 1, 1, 1, 1,
1.272301, 0.5623854, 0.4756416, 1, 1, 1, 1, 1,
1.276003, 0.9817063, 0.597121, 1, 1, 1, 1, 1,
1.286017, 0.1844529, 0.853679, 1, 1, 1, 1, 1,
1.311191, 0.2593709, 0.8695746, 1, 1, 1, 1, 1,
1.337746, 0.3504485, 1.081301, 0, 0, 1, 1, 1,
1.340726, -1.299061, 0.8935323, 1, 0, 0, 1, 1,
1.350511, 0.5307223, 1.228332, 1, 0, 0, 1, 1,
1.360095, -0.365449, -0.2307475, 1, 0, 0, 1, 1,
1.362497, 0.8815818, 1.072292, 1, 0, 0, 1, 1,
1.36952, 0.339413, 1.24061, 1, 0, 0, 1, 1,
1.374889, -1.642668, 1.096171, 0, 0, 0, 1, 1,
1.378412, 0.002794925, 1.082003, 0, 0, 0, 1, 1,
1.396312, -0.4183948, 3.368557, 0, 0, 0, 1, 1,
1.397232, 0.9230657, 3.34245, 0, 0, 0, 1, 1,
1.401591, 0.2221684, 0.2693734, 0, 0, 0, 1, 1,
1.401647, 0.5936006, 1.610569, 0, 0, 0, 1, 1,
1.403511, 0.2587865, 0.6620509, 0, 0, 0, 1, 1,
1.418011, 0.0765937, 3.464287, 1, 1, 1, 1, 1,
1.428773, -1.29408, 1.954905, 1, 1, 1, 1, 1,
1.437028, -0.6728692, 1.316705, 1, 1, 1, 1, 1,
1.4505, -0.311128, 0.6372693, 1, 1, 1, 1, 1,
1.454841, -0.06371665, 2.39588, 1, 1, 1, 1, 1,
1.459692, 0.5117757, 1.389451, 1, 1, 1, 1, 1,
1.463085, 2.898756, -0.01618449, 1, 1, 1, 1, 1,
1.469287, 0.4387221, -0.9352693, 1, 1, 1, 1, 1,
1.484002, -0.4584795, 2.056459, 1, 1, 1, 1, 1,
1.488805, 0.001255108, 1.728893, 1, 1, 1, 1, 1,
1.489747, -1.394353, 0.931709, 1, 1, 1, 1, 1,
1.492029, 0.6944574, 0.2326565, 1, 1, 1, 1, 1,
1.501332, -1.140739, 1.285036, 1, 1, 1, 1, 1,
1.50973, -0.1124978, 0.8709707, 1, 1, 1, 1, 1,
1.516245, 1.96349, -0.3725834, 1, 1, 1, 1, 1,
1.52849, -0.2429995, 1.575087, 0, 0, 1, 1, 1,
1.534679, -1.63482, 2.431009, 1, 0, 0, 1, 1,
1.537733, -0.8856302, 0.6914828, 1, 0, 0, 1, 1,
1.542661, -0.373657, 2.631953, 1, 0, 0, 1, 1,
1.548649, 1.281321, 0.8776073, 1, 0, 0, 1, 1,
1.557672, 0.04303958, 1.349113, 1, 0, 0, 1, 1,
1.561459, 0.5705005, 0.7856352, 0, 0, 0, 1, 1,
1.575785, -0.06621037, 1.974651, 0, 0, 0, 1, 1,
1.581194, -0.5577533, 1.693816, 0, 0, 0, 1, 1,
1.585349, -1.149343, 0.7386893, 0, 0, 0, 1, 1,
1.585545, -1.049592, 3.959753, 0, 0, 0, 1, 1,
1.59074, 1.60629, 1.508474, 0, 0, 0, 1, 1,
1.603762, -2.381826, 1.520001, 0, 0, 0, 1, 1,
1.612803, -1.19668, 3.683157, 1, 1, 1, 1, 1,
1.617433, 1.412059, 1.087458, 1, 1, 1, 1, 1,
1.641899, -0.09093848, 1.956418, 1, 1, 1, 1, 1,
1.660617, -0.4405909, 1.822084, 1, 1, 1, 1, 1,
1.673293, -1.741256, 3.366722, 1, 1, 1, 1, 1,
1.68017, 1.878556, 1.327037, 1, 1, 1, 1, 1,
1.688742, -0.7311254, 0.8908347, 1, 1, 1, 1, 1,
1.699388, -1.335569, 2.24771, 1, 1, 1, 1, 1,
1.706905, -0.2430734, 2.221844, 1, 1, 1, 1, 1,
1.717638, 0.4644326, 0.6511756, 1, 1, 1, 1, 1,
1.717699, -0.6801177, 1.504436, 1, 1, 1, 1, 1,
1.769517, -1.612206, 3.395077, 1, 1, 1, 1, 1,
1.77261, 0.5240358, 1.0234, 1, 1, 1, 1, 1,
1.776157, 1.056162, 0.02098707, 1, 1, 1, 1, 1,
1.776395, 0.7424377, 2.584125, 1, 1, 1, 1, 1,
1.777479, 1.182289, 0.66063, 0, 0, 1, 1, 1,
1.777707, -1.456887, 2.159946, 1, 0, 0, 1, 1,
1.801662, 0.9515121, 2.375456, 1, 0, 0, 1, 1,
1.819029, -0.2887172, 2.887911, 1, 0, 0, 1, 1,
1.83749, -0.06145928, 3.783577, 1, 0, 0, 1, 1,
1.839322, -0.09875646, 1.991916, 1, 0, 0, 1, 1,
1.847196, 0.08233199, 1.539209, 0, 0, 0, 1, 1,
1.85063, -1.190089, 2.312095, 0, 0, 0, 1, 1,
1.875091, -0.4687958, 2.451793, 0, 0, 0, 1, 1,
1.891015, -0.841708, 1.897097, 0, 0, 0, 1, 1,
1.892743, -0.465242, -0.08762978, 0, 0, 0, 1, 1,
1.897259, 0.5247298, 1.292274, 0, 0, 0, 1, 1,
1.944414, 1.426024, -0.6211383, 0, 0, 0, 1, 1,
1.945639, 0.2629842, 1.341101, 1, 1, 1, 1, 1,
1.960537, -0.07693309, 1.762601, 1, 1, 1, 1, 1,
1.966615, -0.2328801, 2.393533, 1, 1, 1, 1, 1,
1.973083, 0.3003131, 1.521529, 1, 1, 1, 1, 1,
1.981337, -0.7694721, 3.582345, 1, 1, 1, 1, 1,
1.990656, 0.04710256, 0.9154413, 1, 1, 1, 1, 1,
1.992996, 0.1501641, 2.35002, 1, 1, 1, 1, 1,
2.014537, 0.01411964, 0.4100727, 1, 1, 1, 1, 1,
2.045813, -1.663708, 2.193211, 1, 1, 1, 1, 1,
2.065822, -0.887711, 1.658547, 1, 1, 1, 1, 1,
2.072405, -0.2118337, 2.54868, 1, 1, 1, 1, 1,
2.087156, -0.4713607, 0.1983547, 1, 1, 1, 1, 1,
2.088408, -1.114001, 1.233116, 1, 1, 1, 1, 1,
2.090821, -0.5031274, 0.4674692, 1, 1, 1, 1, 1,
2.100408, -0.5573224, 2.039248, 1, 1, 1, 1, 1,
2.155971, -1.610514, 1.531139, 0, 0, 1, 1, 1,
2.192914, 0.9147019, 2.257523, 1, 0, 0, 1, 1,
2.216637, -0.6479374, 0.9333034, 1, 0, 0, 1, 1,
2.218301, -1.833235, 1.533025, 1, 0, 0, 1, 1,
2.232177, -0.03145992, 2.733316, 1, 0, 0, 1, 1,
2.265424, -0.3572538, 2.110826, 1, 0, 0, 1, 1,
2.29547, 0.2899392, 1.8458, 0, 0, 0, 1, 1,
2.331458, -0.2297733, 2.491352, 0, 0, 0, 1, 1,
2.37425, 1.70416, -0.7542164, 0, 0, 0, 1, 1,
2.384404, 0.2358819, 3.442747, 0, 0, 0, 1, 1,
2.458385, 2.063704, 0.322009, 0, 0, 0, 1, 1,
2.582468, -0.8894114, 2.219902, 0, 0, 0, 1, 1,
2.588225, 0.8247943, 0.4845259, 0, 0, 0, 1, 1,
2.724888, 0.2866758, 2.077134, 1, 1, 1, 1, 1,
2.785409, 0.5055602, 2.89723, 1, 1, 1, 1, 1,
2.820982, 0.2067177, 1.134865, 1, 1, 1, 1, 1,
2.908962, 0.1327306, 1.350494, 1, 1, 1, 1, 1,
2.939304, 0.985658, 0.1330723, 1, 1, 1, 1, 1,
3.036405, 0.0009161959, 3.886945, 1, 1, 1, 1, 1,
3.401015, -0.7885736, 1.75854, 1, 1, 1, 1, 1
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
var radius = 9.855005;
var distance = 34.61529;
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
mvMatrix.translate( -0.03450131, -0.01219344, 0.2105668 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61529);
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
