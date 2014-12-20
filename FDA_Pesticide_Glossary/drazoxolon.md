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
-3.511053, 0.3830458, -1.833238, 1, 0, 0, 1,
-2.873369, 0.9034815, -1.257974, 1, 0.007843138, 0, 1,
-2.860122, -0.5575611, -2.486699, 1, 0.01176471, 0, 1,
-2.753087, 0.5291508, -1.15367, 1, 0.01960784, 0, 1,
-2.70437, -0.4728888, -2.686416, 1, 0.02352941, 0, 1,
-2.678488, -0.6227564, -3.29804, 1, 0.03137255, 0, 1,
-2.659966, -1.321509, -0.831557, 1, 0.03529412, 0, 1,
-2.596434, 1.8954, 0.2436187, 1, 0.04313726, 0, 1,
-2.594476, -1.218062, -1.356886, 1, 0.04705882, 0, 1,
-2.468911, -1.364705, -2.055116, 1, 0.05490196, 0, 1,
-2.441277, 1.116137, -2.071705, 1, 0.05882353, 0, 1,
-2.372963, 1.05157, -0.5013259, 1, 0.06666667, 0, 1,
-2.352585, -0.8717809, -1.613405, 1, 0.07058824, 0, 1,
-2.273005, 1.154317, -1.804963, 1, 0.07843138, 0, 1,
-2.268438, -1.153927, -2.437616, 1, 0.08235294, 0, 1,
-2.222185, 0.1928718, -3.906755, 1, 0.09019608, 0, 1,
-2.213226, 0.07258692, -1.404843, 1, 0.09411765, 0, 1,
-2.178449, 0.4566347, -3.179406, 1, 0.1019608, 0, 1,
-2.164201, 1.368867, -0.3207812, 1, 0.1098039, 0, 1,
-2.143282, 0.8008869, -1.254726, 1, 0.1137255, 0, 1,
-2.115153, -0.6029242, -3.751985, 1, 0.1215686, 0, 1,
-2.084235, 0.4734997, -0.4014556, 1, 0.1254902, 0, 1,
-2.079846, 0.06708294, -1.739058, 1, 0.1333333, 0, 1,
-2.068583, 1.265908, -1.903549, 1, 0.1372549, 0, 1,
-2.049355, 1.250196, -0.9360279, 1, 0.145098, 0, 1,
-2.047086, 1.779117, -0.5945957, 1, 0.1490196, 0, 1,
-2.010462, 1.527661, -1.646784, 1, 0.1568628, 0, 1,
-1.993751, 0.2088853, -1.085674, 1, 0.1607843, 0, 1,
-1.976586, -1.386826, -0.8749941, 1, 0.1686275, 0, 1,
-1.969191, 1.952892, -0.09991477, 1, 0.172549, 0, 1,
-1.950514, -0.1402369, 0.5731567, 1, 0.1803922, 0, 1,
-1.933862, 0.1272109, -1.482819, 1, 0.1843137, 0, 1,
-1.904435, 0.5464945, -1.176187, 1, 0.1921569, 0, 1,
-1.904276, -0.536576, -1.321499, 1, 0.1960784, 0, 1,
-1.852541, 0.2664326, -0.3252368, 1, 0.2039216, 0, 1,
-1.825716, 0.7171562, -0.9897839, 1, 0.2117647, 0, 1,
-1.825692, 0.6394048, -2.949355, 1, 0.2156863, 0, 1,
-1.820121, 0.3031552, -0.4382682, 1, 0.2235294, 0, 1,
-1.809117, 1.196445, -1.402327, 1, 0.227451, 0, 1,
-1.80599, 0.06675143, -1.296763, 1, 0.2352941, 0, 1,
-1.794955, 0.9269692, -0.87014, 1, 0.2392157, 0, 1,
-1.787894, -0.3518264, -2.608964, 1, 0.2470588, 0, 1,
-1.783198, 0.1355019, -2.032358, 1, 0.2509804, 0, 1,
-1.778819, 0.7200782, -0.1816685, 1, 0.2588235, 0, 1,
-1.677324, -0.3330579, -1.781488, 1, 0.2627451, 0, 1,
-1.674907, 1.215483, -1.301072, 1, 0.2705882, 0, 1,
-1.670782, 1.72503, -0.4681785, 1, 0.2745098, 0, 1,
-1.664304, 1.783246, 1.007624, 1, 0.282353, 0, 1,
-1.664096, -0.9249201, -2.775507, 1, 0.2862745, 0, 1,
-1.661587, -0.7107567, -3.591305, 1, 0.2941177, 0, 1,
-1.656254, -0.03628536, -2.725759, 1, 0.3019608, 0, 1,
-1.649001, 0.2174825, -0.2583545, 1, 0.3058824, 0, 1,
-1.647019, 0.4125901, -1.024598, 1, 0.3137255, 0, 1,
-1.625498, -1.206562, -2.076693, 1, 0.3176471, 0, 1,
-1.60929, 0.4799055, -1.766412, 1, 0.3254902, 0, 1,
-1.604926, 0.583706, -1.739815, 1, 0.3294118, 0, 1,
-1.585924, 0.003164007, -2.100793, 1, 0.3372549, 0, 1,
-1.585011, -1.015141, -2.692006, 1, 0.3411765, 0, 1,
-1.578703, 1.71335, -1.659195, 1, 0.3490196, 0, 1,
-1.570258, 0.4033581, -2.12647, 1, 0.3529412, 0, 1,
-1.56286, 0.9627591, 0.3537631, 1, 0.3607843, 0, 1,
-1.562759, -0.2755941, -0.9825606, 1, 0.3647059, 0, 1,
-1.562584, 0.7960691, -1.638286, 1, 0.372549, 0, 1,
-1.55538, 0.3329048, -1.237376, 1, 0.3764706, 0, 1,
-1.548583, -0.2347648, -1.680346, 1, 0.3843137, 0, 1,
-1.539532, -0.4418821, -3.290395, 1, 0.3882353, 0, 1,
-1.532213, 0.3642327, -1.391488, 1, 0.3960784, 0, 1,
-1.52512, -0.4775809, -2.945611, 1, 0.4039216, 0, 1,
-1.512482, -0.5294781, -1.97032, 1, 0.4078431, 0, 1,
-1.508837, 0.4385735, 0.1188842, 1, 0.4156863, 0, 1,
-1.501889, 0.4479213, -1.30257, 1, 0.4196078, 0, 1,
-1.497517, 2.09536, -1.077581, 1, 0.427451, 0, 1,
-1.486072, 0.3792824, -2.541872, 1, 0.4313726, 0, 1,
-1.482238, -0.6430659, -2.608825, 1, 0.4392157, 0, 1,
-1.481308, -0.7915881, -0.2016499, 1, 0.4431373, 0, 1,
-1.472468, 0.1873876, -1.594112, 1, 0.4509804, 0, 1,
-1.440759, -0.722735, -1.158194, 1, 0.454902, 0, 1,
-1.418204, -2.115809, -1.607919, 1, 0.4627451, 0, 1,
-1.396875, 0.4852218, -0.9007467, 1, 0.4666667, 0, 1,
-1.37949, -0.2623992, -0.08889345, 1, 0.4745098, 0, 1,
-1.377764, -0.9917381, -1.740631, 1, 0.4784314, 0, 1,
-1.376255, -1.482856, -3.938018, 1, 0.4862745, 0, 1,
-1.357349, -0.3222798, -1.744015, 1, 0.4901961, 0, 1,
-1.348021, -0.4429227, -1.639153, 1, 0.4980392, 0, 1,
-1.346423, 0.5440206, 0.171588, 1, 0.5058824, 0, 1,
-1.34532, 0.7925642, -1.723355, 1, 0.509804, 0, 1,
-1.344247, -2.024508, -1.071805, 1, 0.5176471, 0, 1,
-1.340346, -0.7480609, -1.117131, 1, 0.5215687, 0, 1,
-1.339091, -0.7240676, -3.614591, 1, 0.5294118, 0, 1,
-1.330529, 0.1503422, -1.702719, 1, 0.5333334, 0, 1,
-1.323119, 1.173378, 0.3444107, 1, 0.5411765, 0, 1,
-1.319768, -1.133638, -2.700533, 1, 0.5450981, 0, 1,
-1.316, 0.3833913, -2.155017, 1, 0.5529412, 0, 1,
-1.31484, 0.06666987, -3.943632, 1, 0.5568628, 0, 1,
-1.311842, 1.060957, 0.9840162, 1, 0.5647059, 0, 1,
-1.307525, -0.3989013, 0.4127578, 1, 0.5686275, 0, 1,
-1.306576, -1.033344, -1.814706, 1, 0.5764706, 0, 1,
-1.30624, -0.512022, -0.6428999, 1, 0.5803922, 0, 1,
-1.305456, 0.229592, -1.140102, 1, 0.5882353, 0, 1,
-1.299979, 0.1654498, -2.628358, 1, 0.5921569, 0, 1,
-1.292816, -2.127532, -2.970155, 1, 0.6, 0, 1,
-1.291288, -0.1274784, -3.348993, 1, 0.6078432, 0, 1,
-1.29014, 1.055916, -1.410311, 1, 0.6117647, 0, 1,
-1.280376, 0.09498204, -0.7792457, 1, 0.6196079, 0, 1,
-1.271299, -1.847341, -2.052242, 1, 0.6235294, 0, 1,
-1.268438, 0.7054971, -2.881915, 1, 0.6313726, 0, 1,
-1.267141, 1.15458, -1.756706, 1, 0.6352941, 0, 1,
-1.266294, 0.2635053, -0.893261, 1, 0.6431373, 0, 1,
-1.256703, -0.009088757, -2.347184, 1, 0.6470588, 0, 1,
-1.255735, 0.8342859, 1.092447, 1, 0.654902, 0, 1,
-1.25369, 1.201804, -1.544837, 1, 0.6588235, 0, 1,
-1.247014, 0.4603527, -1.824818, 1, 0.6666667, 0, 1,
-1.243937, -1.133354, -2.566434, 1, 0.6705883, 0, 1,
-1.239258, -0.9621406, -1.478377, 1, 0.6784314, 0, 1,
-1.236122, 0.3127778, -2.059879, 1, 0.682353, 0, 1,
-1.232699, -0.5138402, -1.857297, 1, 0.6901961, 0, 1,
-1.232226, -0.5271457, -3.308135, 1, 0.6941177, 0, 1,
-1.230415, 0.9650779, -0.5798172, 1, 0.7019608, 0, 1,
-1.230318, -1.256664, -2.565753, 1, 0.7098039, 0, 1,
-1.229476, -2.524964, -3.434886, 1, 0.7137255, 0, 1,
-1.229133, -0.5365495, -1.748827, 1, 0.7215686, 0, 1,
-1.227361, 0.4990934, -1.349353, 1, 0.7254902, 0, 1,
-1.217137, 0.004822158, -2.06286, 1, 0.7333333, 0, 1,
-1.213312, -0.5215336, -0.5287788, 1, 0.7372549, 0, 1,
-1.209147, 1.312847, 1.171843, 1, 0.7450981, 0, 1,
-1.206735, 1.13733, 0.6236734, 1, 0.7490196, 0, 1,
-1.204425, -1.845238, -3.721516, 1, 0.7568628, 0, 1,
-1.204343, -0.8837234, -0.4779876, 1, 0.7607843, 0, 1,
-1.169997, -1.030034, -3.284613, 1, 0.7686275, 0, 1,
-1.164383, -0.7252712, -2.523329, 1, 0.772549, 0, 1,
-1.158254, 1.565171, -1.261058, 1, 0.7803922, 0, 1,
-1.152695, -0.06694575, 0.4271918, 1, 0.7843137, 0, 1,
-1.142955, -1.21093, -3.398339, 1, 0.7921569, 0, 1,
-1.140649, 0.5839373, -3.528767, 1, 0.7960784, 0, 1,
-1.139107, -0.547268, -2.97723, 1, 0.8039216, 0, 1,
-1.131429, 1.529581, -0.4748438, 1, 0.8117647, 0, 1,
-1.12365, -0.5688213, -2.814888, 1, 0.8156863, 0, 1,
-1.108722, -0.0976647, -0.8620954, 1, 0.8235294, 0, 1,
-1.100549, 0.3907568, -2.289717, 1, 0.827451, 0, 1,
-1.097285, -0.6357617, -1.315615, 1, 0.8352941, 0, 1,
-1.091486, -0.3037908, -2.200435, 1, 0.8392157, 0, 1,
-1.089538, 0.4515364, -1.56704, 1, 0.8470588, 0, 1,
-1.084325, -1.245519, -2.414873, 1, 0.8509804, 0, 1,
-1.076015, 0.9706913, 0.3419511, 1, 0.8588235, 0, 1,
-1.06964, -0.4472298, -2.138263, 1, 0.8627451, 0, 1,
-1.06939, -1.18532, -2.079492, 1, 0.8705882, 0, 1,
-1.066383, -0.400059, -2.703897, 1, 0.8745098, 0, 1,
-1.060546, 1.36687, -0.117581, 1, 0.8823529, 0, 1,
-1.055292, -0.8615228, -1.947885, 1, 0.8862745, 0, 1,
-1.047649, 1.27678, -3.567969, 1, 0.8941177, 0, 1,
-1.036008, -0.7060532, -1.714031, 1, 0.8980392, 0, 1,
-1.03392, 0.9456975, 0.4992245, 1, 0.9058824, 0, 1,
-1.032995, -1.880053, -2.54958, 1, 0.9137255, 0, 1,
-1.022247, -1.038239, -3.898057, 1, 0.9176471, 0, 1,
-1.020708, -0.5572428, -3.181629, 1, 0.9254902, 0, 1,
-1.013981, -0.892114, -0.8120571, 1, 0.9294118, 0, 1,
-1.011218, 0.6447398, -0.2456181, 1, 0.9372549, 0, 1,
-1.00811, 0.3127223, -1.410488, 1, 0.9411765, 0, 1,
-1.007597, -0.3462686, -0.5558631, 1, 0.9490196, 0, 1,
-1.007361, -2.072597, -2.84952, 1, 0.9529412, 0, 1,
-1.00588, -0.8470045, -1.798933, 1, 0.9607843, 0, 1,
-0.9998315, -0.7042902, -1.024863, 1, 0.9647059, 0, 1,
-0.9998265, -0.3809331, -2.3825, 1, 0.972549, 0, 1,
-0.9991761, -0.08269421, -1.15913, 1, 0.9764706, 0, 1,
-0.9972832, 0.3727705, -1.81014, 1, 0.9843137, 0, 1,
-0.9961427, 1.208774, -1.389844, 1, 0.9882353, 0, 1,
-0.9924633, -1.21682, -3.587924, 1, 0.9960784, 0, 1,
-0.9851552, 0.6367989, -2.087991, 0.9960784, 1, 0, 1,
-0.9808171, 2.05147, -1.521971, 0.9921569, 1, 0, 1,
-0.9784609, -0.812344, -0.5114244, 0.9843137, 1, 0, 1,
-0.9702342, 0.3609057, -3.800513, 0.9803922, 1, 0, 1,
-0.9636498, -0.366355, -2.357923, 0.972549, 1, 0, 1,
-0.963414, 0.9914292, 0.002720806, 0.9686275, 1, 0, 1,
-0.9617156, -0.3339871, -1.268247, 0.9607843, 1, 0, 1,
-0.9530088, -0.176185, -0.802506, 0.9568627, 1, 0, 1,
-0.9451926, 0.6881315, -0.3684922, 0.9490196, 1, 0, 1,
-0.9446753, 0.6384174, 0.8940123, 0.945098, 1, 0, 1,
-0.9433161, -1.063592, -3.361204, 0.9372549, 1, 0, 1,
-0.9431936, 0.09111371, -0.6923789, 0.9333333, 1, 0, 1,
-0.9378335, -0.4903192, -2.674141, 0.9254902, 1, 0, 1,
-0.9318773, -0.1527586, -1.384632, 0.9215686, 1, 0, 1,
-0.9012164, -0.09721561, -2.123958, 0.9137255, 1, 0, 1,
-0.8995819, 0.1279186, -1.555895, 0.9098039, 1, 0, 1,
-0.8979362, -0.5595521, -2.894854, 0.9019608, 1, 0, 1,
-0.8962255, -1.164688, -3.907892, 0.8941177, 1, 0, 1,
-0.8910308, 0.9934258, -1.837435, 0.8901961, 1, 0, 1,
-0.8795288, 0.202586, -1.093347, 0.8823529, 1, 0, 1,
-0.8750473, -0.8006199, -0.2044424, 0.8784314, 1, 0, 1,
-0.8695257, 0.1151152, -1.57557, 0.8705882, 1, 0, 1,
-0.8674685, -1.036653, -1.670843, 0.8666667, 1, 0, 1,
-0.8585508, 1.145382, 0.5735627, 0.8588235, 1, 0, 1,
-0.8538502, 0.6221953, -1.288038, 0.854902, 1, 0, 1,
-0.8536609, 0.9110962, -1.374808, 0.8470588, 1, 0, 1,
-0.8515007, 1.352279, -1.406949, 0.8431373, 1, 0, 1,
-0.850287, 1.425243, 0.180739, 0.8352941, 1, 0, 1,
-0.8467941, 0.8646007, 0.1645892, 0.8313726, 1, 0, 1,
-0.844763, 0.06378258, -3.059656, 0.8235294, 1, 0, 1,
-0.8438425, -0.4064144, -0.6551635, 0.8196079, 1, 0, 1,
-0.8420373, -2.173449, -3.404355, 0.8117647, 1, 0, 1,
-0.8419165, -0.4036253, -1.896897, 0.8078431, 1, 0, 1,
-0.8404435, 0.09223828, -2.295988, 0.8, 1, 0, 1,
-0.8360336, -0.1073245, -1.053985, 0.7921569, 1, 0, 1,
-0.8353363, 0.4199074, -1.614151, 0.7882353, 1, 0, 1,
-0.8302545, -0.3711729, -3.413615, 0.7803922, 1, 0, 1,
-0.8244376, 2.05359, -2.423934, 0.7764706, 1, 0, 1,
-0.821104, 0.7846956, -0.7451272, 0.7686275, 1, 0, 1,
-0.8179249, -0.02680953, -2.650541, 0.7647059, 1, 0, 1,
-0.8131523, -1.359385, -1.184384, 0.7568628, 1, 0, 1,
-0.802887, 1.578344, 0.359432, 0.7529412, 1, 0, 1,
-0.7952853, 0.2584009, -0.02203496, 0.7450981, 1, 0, 1,
-0.7949939, 0.3169079, 0.1920231, 0.7411765, 1, 0, 1,
-0.785273, 0.4249442, -0.9181774, 0.7333333, 1, 0, 1,
-0.7792828, 1.574418, 0.1942192, 0.7294118, 1, 0, 1,
-0.7616059, -2.123623, -2.585005, 0.7215686, 1, 0, 1,
-0.7605444, -1.200076, -2.046005, 0.7176471, 1, 0, 1,
-0.7600768, -0.1702826, -1.166329, 0.7098039, 1, 0, 1,
-0.7590555, -0.7077245, -2.560646, 0.7058824, 1, 0, 1,
-0.7531363, -0.4497425, -1.977296, 0.6980392, 1, 0, 1,
-0.7472422, 1.646218, -0.2192656, 0.6901961, 1, 0, 1,
-0.7443756, -1.070883, -1.981207, 0.6862745, 1, 0, 1,
-0.7382111, -0.6830762, -3.190241, 0.6784314, 1, 0, 1,
-0.7370169, -0.4171678, -3.364718, 0.6745098, 1, 0, 1,
-0.7347541, 1.492892, 0.853877, 0.6666667, 1, 0, 1,
-0.7333021, 0.5505808, -1.743473, 0.6627451, 1, 0, 1,
-0.7239857, -0.5909652, -1.127161, 0.654902, 1, 0, 1,
-0.7230852, 0.8128351, -0.7325253, 0.6509804, 1, 0, 1,
-0.7208202, 0.03367752, -2.028114, 0.6431373, 1, 0, 1,
-0.7194631, -0.7515383, -2.318359, 0.6392157, 1, 0, 1,
-0.7118272, -0.1620589, -3.933025, 0.6313726, 1, 0, 1,
-0.71141, -1.733173, -2.15401, 0.627451, 1, 0, 1,
-0.7060351, -0.8080522, -1.239522, 0.6196079, 1, 0, 1,
-0.6986536, 1.539448, 0.4295011, 0.6156863, 1, 0, 1,
-0.6947191, -0.8569376, -3.260609, 0.6078432, 1, 0, 1,
-0.6933106, -0.8036283, -1.690609, 0.6039216, 1, 0, 1,
-0.6893064, 0.1176753, -1.157067, 0.5960785, 1, 0, 1,
-0.688662, 0.05663788, -1.259638, 0.5882353, 1, 0, 1,
-0.6860906, -1.057451, -1.880217, 0.5843138, 1, 0, 1,
-0.6836252, -0.5387166, -3.253173, 0.5764706, 1, 0, 1,
-0.6808742, 0.2054353, -1.645279, 0.572549, 1, 0, 1,
-0.6803796, -1.203926, -0.3404987, 0.5647059, 1, 0, 1,
-0.6792475, -0.1118141, -1.670483, 0.5607843, 1, 0, 1,
-0.6746464, 0.5785836, -0.2788891, 0.5529412, 1, 0, 1,
-0.6704174, -0.4332452, -2.595284, 0.5490196, 1, 0, 1,
-0.6673582, -0.0929665, -1.687756, 0.5411765, 1, 0, 1,
-0.6665272, 0.4701287, -0.5585427, 0.5372549, 1, 0, 1,
-0.666236, -0.1406323, -0.8568442, 0.5294118, 1, 0, 1,
-0.6653878, 0.6531321, -0.9947753, 0.5254902, 1, 0, 1,
-0.6645997, 0.3648006, -0.6357913, 0.5176471, 1, 0, 1,
-0.6602501, 0.314269, -0.8633787, 0.5137255, 1, 0, 1,
-0.6600835, -0.5232185, -2.74511, 0.5058824, 1, 0, 1,
-0.6599979, 2.225054, 0.5800977, 0.5019608, 1, 0, 1,
-0.6587597, -0.5245526, -2.265387, 0.4941176, 1, 0, 1,
-0.6554422, -1.477352, -2.544778, 0.4862745, 1, 0, 1,
-0.6483341, -0.2139581, -1.666441, 0.4823529, 1, 0, 1,
-0.6436969, 0.5934063, -0.6797711, 0.4745098, 1, 0, 1,
-0.640155, -1.848301, -3.247642, 0.4705882, 1, 0, 1,
-0.6380928, 0.6524544, 0.6595642, 0.4627451, 1, 0, 1,
-0.6316969, -0.9339439, -2.492545, 0.4588235, 1, 0, 1,
-0.6285859, 0.3860695, 0.6182399, 0.4509804, 1, 0, 1,
-0.6207436, -1.422379, -2.287129, 0.4470588, 1, 0, 1,
-0.6193113, 0.5985796, -0.8950716, 0.4392157, 1, 0, 1,
-0.618798, -0.9535944, -2.506033, 0.4352941, 1, 0, 1,
-0.6141571, 0.7401192, -0.9759297, 0.427451, 1, 0, 1,
-0.6103895, -0.6429339, -2.924443, 0.4235294, 1, 0, 1,
-0.608771, 1.334884, -0.2298322, 0.4156863, 1, 0, 1,
-0.6072617, -0.4598868, -4.030886, 0.4117647, 1, 0, 1,
-0.6027389, -0.07672361, -0.4742235, 0.4039216, 1, 0, 1,
-0.6013657, -0.1827697, -1.437348, 0.3960784, 1, 0, 1,
-0.5912995, -0.1999833, -2.014807, 0.3921569, 1, 0, 1,
-0.5872767, -1.489671, -3.494416, 0.3843137, 1, 0, 1,
-0.5856816, -0.5646346, -2.135437, 0.3803922, 1, 0, 1,
-0.5846183, -0.00982933, -1.362325, 0.372549, 1, 0, 1,
-0.5819103, -0.8433739, -3.804872, 0.3686275, 1, 0, 1,
-0.5785053, 0.183962, -3.667954, 0.3607843, 1, 0, 1,
-0.5772887, 0.4428372, -1.162261, 0.3568628, 1, 0, 1,
-0.5767202, -0.3188333, -3.373988, 0.3490196, 1, 0, 1,
-0.5726381, -0.1659139, -1.989087, 0.345098, 1, 0, 1,
-0.5709832, 0.2741578, -2.527664, 0.3372549, 1, 0, 1,
-0.5677329, -0.4175081, -3.881254, 0.3333333, 1, 0, 1,
-0.5667164, -0.06142304, -2.351024, 0.3254902, 1, 0, 1,
-0.5662819, -1.174049, -2.887164, 0.3215686, 1, 0, 1,
-0.5660495, -0.06390683, -1.692671, 0.3137255, 1, 0, 1,
-0.5615364, 0.4484616, -2.499169, 0.3098039, 1, 0, 1,
-0.5613557, 0.03067378, -2.142858, 0.3019608, 1, 0, 1,
-0.5590614, -1.437549, -1.983033, 0.2941177, 1, 0, 1,
-0.5558335, 0.01665894, -1.737916, 0.2901961, 1, 0, 1,
-0.553334, 1.019719, -0.7801392, 0.282353, 1, 0, 1,
-0.5494083, 1.497988, -0.08647583, 0.2784314, 1, 0, 1,
-0.5485671, 1.254084, -2.365149, 0.2705882, 1, 0, 1,
-0.5440944, -0.7511791, -1.538499, 0.2666667, 1, 0, 1,
-0.5427898, 1.824014, -0.8262447, 0.2588235, 1, 0, 1,
-0.5424597, 0.8709565, 1.530827, 0.254902, 1, 0, 1,
-0.5420667, -0.9388003, -1.7451, 0.2470588, 1, 0, 1,
-0.53149, 0.140736, -0.9516611, 0.2431373, 1, 0, 1,
-0.5260757, 1.074485, 0.6992301, 0.2352941, 1, 0, 1,
-0.525079, -0.2715669, -2.859591, 0.2313726, 1, 0, 1,
-0.5234084, -0.3119963, -3.1145, 0.2235294, 1, 0, 1,
-0.52269, 0.703086, 0.09957707, 0.2196078, 1, 0, 1,
-0.5221758, 0.7070429, 1.178359, 0.2117647, 1, 0, 1,
-0.5218152, -0.1593139, -1.867976, 0.2078431, 1, 0, 1,
-0.5169767, 1.183079, -0.07965743, 0.2, 1, 0, 1,
-0.5142631, 1.463207, 0.8345131, 0.1921569, 1, 0, 1,
-0.5115367, -0.2907826, -0.7266431, 0.1882353, 1, 0, 1,
-0.5079656, -0.6256784, -3.773389, 0.1803922, 1, 0, 1,
-0.500111, 0.1228155, -0.7762002, 0.1764706, 1, 0, 1,
-0.4981049, 0.2345387, -1.021012, 0.1686275, 1, 0, 1,
-0.4854626, -3.773138, -3.807021, 0.1647059, 1, 0, 1,
-0.4846849, 0.125725, -1.151437, 0.1568628, 1, 0, 1,
-0.4789854, 0.3560758, -1.345682, 0.1529412, 1, 0, 1,
-0.4773103, 0.07501024, -1.930095, 0.145098, 1, 0, 1,
-0.4732696, -1.412212, -1.920695, 0.1411765, 1, 0, 1,
-0.4697686, 0.7484704, -2.835481, 0.1333333, 1, 0, 1,
-0.4669397, -0.5851877, -2.450339, 0.1294118, 1, 0, 1,
-0.4647092, 0.006974516, 0.601953, 0.1215686, 1, 0, 1,
-0.4640492, 0.531423, -0.3441346, 0.1176471, 1, 0, 1,
-0.4637302, -0.6412215, -1.574664, 0.1098039, 1, 0, 1,
-0.4561291, -0.9277092, -3.250532, 0.1058824, 1, 0, 1,
-0.4552581, -0.1252777, -1.448348, 0.09803922, 1, 0, 1,
-0.4536217, 0.06999501, -2.356666, 0.09019608, 1, 0, 1,
-0.4464519, 0.390184, -0.3486624, 0.08627451, 1, 0, 1,
-0.4421095, -0.3813615, -1.85298, 0.07843138, 1, 0, 1,
-0.4398991, 0.1634801, -2.22584, 0.07450981, 1, 0, 1,
-0.4392546, 0.6611975, -0.4877225, 0.06666667, 1, 0, 1,
-0.4365942, -0.3870775, -3.479592, 0.0627451, 1, 0, 1,
-0.433551, -0.8695039, -3.798905, 0.05490196, 1, 0, 1,
-0.4304384, 1.287091, -0.3746724, 0.05098039, 1, 0, 1,
-0.4292954, -1.138871, -2.916428, 0.04313726, 1, 0, 1,
-0.4291832, -0.8409328, -1.844852, 0.03921569, 1, 0, 1,
-0.4256895, 0.2754382, -1.14342, 0.03137255, 1, 0, 1,
-0.4224231, -0.7407075, -3.747991, 0.02745098, 1, 0, 1,
-0.4218579, 0.6675426, -0.1921449, 0.01960784, 1, 0, 1,
-0.41704, 0.5427335, 0.001359278, 0.01568628, 1, 0, 1,
-0.416466, -0.4777552, -3.664728, 0.007843138, 1, 0, 1,
-0.4162981, -1.986343, -2.48886, 0.003921569, 1, 0, 1,
-0.4152315, 0.04548398, -2.832378, 0, 1, 0.003921569, 1,
-0.415022, -0.7691846, -1.409426, 0, 1, 0.01176471, 1,
-0.411793, 0.4651979, -1.781558, 0, 1, 0.01568628, 1,
-0.410523, 1.186963, -0.2535801, 0, 1, 0.02352941, 1,
-0.4063416, 0.03589371, -2.750194, 0, 1, 0.02745098, 1,
-0.4001703, -0.4100025, -1.980896, 0, 1, 0.03529412, 1,
-0.3927033, -1.144758, -3.256508, 0, 1, 0.03921569, 1,
-0.391249, 1.472502, -1.33938, 0, 1, 0.04705882, 1,
-0.388444, 0.320737, -1.787425, 0, 1, 0.05098039, 1,
-0.3876325, 0.2936327, 0.6224198, 0, 1, 0.05882353, 1,
-0.382036, 2.103364, 0.4691696, 0, 1, 0.0627451, 1,
-0.3746103, 1.107712, 0.1833251, 0, 1, 0.07058824, 1,
-0.3744886, -1.893793, -3.720859, 0, 1, 0.07450981, 1,
-0.3730536, -0.1827607, -1.553311, 0, 1, 0.08235294, 1,
-0.3728195, -0.07741711, -2.946852, 0, 1, 0.08627451, 1,
-0.3721459, -1.096616, -3.231987, 0, 1, 0.09411765, 1,
-0.3699977, -0.6694471, -3.97337, 0, 1, 0.1019608, 1,
-0.3680942, -0.02669323, -0.9832615, 0, 1, 0.1058824, 1,
-0.3643318, 1.03279, -2.802083, 0, 1, 0.1137255, 1,
-0.358624, 0.6063771, -1.424314, 0, 1, 0.1176471, 1,
-0.3556432, 1.914993, 0.1798737, 0, 1, 0.1254902, 1,
-0.3555381, -0.8282385, -0.3063827, 0, 1, 0.1294118, 1,
-0.3544813, 0.4302058, -1.321667, 0, 1, 0.1372549, 1,
-0.3542272, 0.9579336, -1.45921, 0, 1, 0.1411765, 1,
-0.354173, 0.3651528, -0.8233833, 0, 1, 0.1490196, 1,
-0.3488268, 1.162792, -0.9127299, 0, 1, 0.1529412, 1,
-0.346496, 0.3627997, -1.823071, 0, 1, 0.1607843, 1,
-0.3415893, -1.807961, -2.616717, 0, 1, 0.1647059, 1,
-0.3357498, -0.586993, -3.336911, 0, 1, 0.172549, 1,
-0.3352651, -0.3596272, -1.503047, 0, 1, 0.1764706, 1,
-0.3346453, 0.2894435, -1.650126, 0, 1, 0.1843137, 1,
-0.333252, -0.04011704, -1.296159, 0, 1, 0.1882353, 1,
-0.3294847, -0.235832, -3.095313, 0, 1, 0.1960784, 1,
-0.3253134, 1.486959, -1.286832, 0, 1, 0.2039216, 1,
-0.3239135, -1.264077, -3.58471, 0, 1, 0.2078431, 1,
-0.3230106, -1.188414, -4.009181, 0, 1, 0.2156863, 1,
-0.322892, -0.7242267, -1.719104, 0, 1, 0.2196078, 1,
-0.3226126, -1.160823, -0.4232257, 0, 1, 0.227451, 1,
-0.3222288, -0.4806652, -2.672579, 0, 1, 0.2313726, 1,
-0.3168287, 0.3935537, -0.4599684, 0, 1, 0.2392157, 1,
-0.3088271, -0.9822963, -2.848255, 0, 1, 0.2431373, 1,
-0.3053384, -1.972667, -3.210154, 0, 1, 0.2509804, 1,
-0.3023066, 0.3088525, -1.894235, 0, 1, 0.254902, 1,
-0.3003399, 0.9243059, -0.04136428, 0, 1, 0.2627451, 1,
-0.2984526, -0.4443067, -2.339545, 0, 1, 0.2666667, 1,
-0.2937124, 0.3823015, -0.2618537, 0, 1, 0.2745098, 1,
-0.2888222, 0.03913777, -0.3673196, 0, 1, 0.2784314, 1,
-0.2878906, -0.8540644, -3.300363, 0, 1, 0.2862745, 1,
-0.2856549, -1.558952, -1.837444, 0, 1, 0.2901961, 1,
-0.2834189, 0.7212515, -0.2131639, 0, 1, 0.2980392, 1,
-0.2798101, 1.873644, 0.3968227, 0, 1, 0.3058824, 1,
-0.2758137, -0.07466924, -3.322399, 0, 1, 0.3098039, 1,
-0.2640599, -0.4101582, -1.2471, 0, 1, 0.3176471, 1,
-0.2619355, -0.04765929, -2.020061, 0, 1, 0.3215686, 1,
-0.2609906, -0.3932686, -4.045307, 0, 1, 0.3294118, 1,
-0.2601892, -0.4036903, -3.453392, 0, 1, 0.3333333, 1,
-0.2597262, -0.3481223, -2.689194, 0, 1, 0.3411765, 1,
-0.2570201, 1.838701, -0.9606399, 0, 1, 0.345098, 1,
-0.2558586, 2.168489, -0.1720147, 0, 1, 0.3529412, 1,
-0.2538691, 1.405457, -1.08225, 0, 1, 0.3568628, 1,
-0.2518823, 0.9573181, -2.279591, 0, 1, 0.3647059, 1,
-0.24771, 1.007421, -0.1542308, 0, 1, 0.3686275, 1,
-0.2399071, -0.6376845, -1.889371, 0, 1, 0.3764706, 1,
-0.2369314, 0.09856706, -2.545228, 0, 1, 0.3803922, 1,
-0.2299481, -0.3771002, -0.9239531, 0, 1, 0.3882353, 1,
-0.2265374, 0.08433289, -1.745781, 0, 1, 0.3921569, 1,
-0.2232111, -0.5303218, -2.264416, 0, 1, 0.4, 1,
-0.2228606, 0.7202254, 0.7351506, 0, 1, 0.4078431, 1,
-0.2210035, 0.3341778, 1.563214, 0, 1, 0.4117647, 1,
-0.2170313, 1.253083, -0.9130778, 0, 1, 0.4196078, 1,
-0.216236, 0.2703787, 0.3730158, 0, 1, 0.4235294, 1,
-0.2158576, -0.06259254, -1.281955, 0, 1, 0.4313726, 1,
-0.214478, 0.02611012, -0.5576012, 0, 1, 0.4352941, 1,
-0.2121279, -0.08561267, -1.684008, 0, 1, 0.4431373, 1,
-0.2114695, -1.167207, -3.829063, 0, 1, 0.4470588, 1,
-0.2069389, 1.969818, 0.299092, 0, 1, 0.454902, 1,
-0.1899606, -1.020311, -2.880211, 0, 1, 0.4588235, 1,
-0.1875842, 0.9188461, -1.767097, 0, 1, 0.4666667, 1,
-0.1871009, 0.3146179, -0.5903225, 0, 1, 0.4705882, 1,
-0.1866806, -0.3423414, -4.169919, 0, 1, 0.4784314, 1,
-0.1855858, 1.193287, -1.000037, 0, 1, 0.4823529, 1,
-0.1845585, -0.04722654, -3.846752, 0, 1, 0.4901961, 1,
-0.1839598, -0.3280212, -3.694029, 0, 1, 0.4941176, 1,
-0.1839514, 0.2410119, 0.2611033, 0, 1, 0.5019608, 1,
-0.1803871, 0.5259683, -0.6971582, 0, 1, 0.509804, 1,
-0.1771417, 1.398521, 0.5947216, 0, 1, 0.5137255, 1,
-0.1763916, -0.434487, -1.656813, 0, 1, 0.5215687, 1,
-0.1715491, -0.1867504, -3.029586, 0, 1, 0.5254902, 1,
-0.1701112, -1.090682, -4.045113, 0, 1, 0.5333334, 1,
-0.1664709, 2.357909, -0.7078667, 0, 1, 0.5372549, 1,
-0.1639103, 0.4372268, 0.04479359, 0, 1, 0.5450981, 1,
-0.1625571, -0.0377847, -1.794546, 0, 1, 0.5490196, 1,
-0.1607384, 0.9807909, 1.007003, 0, 1, 0.5568628, 1,
-0.1580272, -0.8248554, -1.560511, 0, 1, 0.5607843, 1,
-0.156722, -0.112467, -2.66202, 0, 1, 0.5686275, 1,
-0.1564122, -1.053515, -2.767775, 0, 1, 0.572549, 1,
-0.1561571, 1.423632, -2.264027, 0, 1, 0.5803922, 1,
-0.1560489, 0.007437113, -0.3005829, 0, 1, 0.5843138, 1,
-0.1560227, 0.3699587, 0.1837056, 0, 1, 0.5921569, 1,
-0.1559961, -0.18416, -0.3912184, 0, 1, 0.5960785, 1,
-0.1554948, -0.514833, -2.47038, 0, 1, 0.6039216, 1,
-0.1545749, 1.051659, 0.1012669, 0, 1, 0.6117647, 1,
-0.1500589, -2.022459, -2.618844, 0, 1, 0.6156863, 1,
-0.1474076, 1.488666, 0.08162599, 0, 1, 0.6235294, 1,
-0.1422473, 1.71601, -0.5473335, 0, 1, 0.627451, 1,
-0.1350129, 1.021334, -0.3841921, 0, 1, 0.6352941, 1,
-0.1294762, -0.6369277, -1.691312, 0, 1, 0.6392157, 1,
-0.1288308, -1.279469, -3.666995, 0, 1, 0.6470588, 1,
-0.1277046, 0.1828114, -1.813862, 0, 1, 0.6509804, 1,
-0.1271039, -0.7979831, -2.337054, 0, 1, 0.6588235, 1,
-0.1268242, -0.2926152, -1.58505, 0, 1, 0.6627451, 1,
-0.1219313, 1.253379, -0.2267406, 0, 1, 0.6705883, 1,
-0.1160437, -0.4093862, -2.910477, 0, 1, 0.6745098, 1,
-0.1141074, -0.07144789, -1.929229, 0, 1, 0.682353, 1,
-0.1115474, 0.2665167, -0.819757, 0, 1, 0.6862745, 1,
-0.1085727, -0.7278144, -3.187305, 0, 1, 0.6941177, 1,
-0.1046418, 1.494653, -0.774447, 0, 1, 0.7019608, 1,
-0.1014767, -0.6882304, -3.035117, 0, 1, 0.7058824, 1,
-0.09423199, -0.6333956, -0.6562158, 0, 1, 0.7137255, 1,
-0.09203275, 0.6458269, -0.308946, 0, 1, 0.7176471, 1,
-0.08436621, -2.263921, -2.508586, 0, 1, 0.7254902, 1,
-0.08254925, 1.092205, -0.4399329, 0, 1, 0.7294118, 1,
-0.08098056, -0.5196024, -2.994202, 0, 1, 0.7372549, 1,
-0.08051937, 0.1576974, 0.06162459, 0, 1, 0.7411765, 1,
-0.0746678, 1.29499, 0.4453621, 0, 1, 0.7490196, 1,
-0.07406566, -1.884789, -3.278932, 0, 1, 0.7529412, 1,
-0.07301594, 0.1209719, -0.5103095, 0, 1, 0.7607843, 1,
-0.06417815, -0.04376507, -0.3312273, 0, 1, 0.7647059, 1,
-0.06280822, -0.4272643, -3.414984, 0, 1, 0.772549, 1,
-0.05896372, -0.2161831, -2.631512, 0, 1, 0.7764706, 1,
-0.05715222, -1.483544, -1.589347, 0, 1, 0.7843137, 1,
-0.05641998, -2.557066, -3.811983, 0, 1, 0.7882353, 1,
-0.05601782, 0.6384801, 1.162716, 0, 1, 0.7960784, 1,
-0.05189675, 0.120042, -1.782658, 0, 1, 0.8039216, 1,
-0.04653582, 0.5225127, -1.379238, 0, 1, 0.8078431, 1,
-0.04616896, 0.6584396, 0.7106416, 0, 1, 0.8156863, 1,
-0.0461622, 0.6906243, 0.2658236, 0, 1, 0.8196079, 1,
-0.04607011, 0.0410908, -0.8046236, 0, 1, 0.827451, 1,
-0.04557483, -0.02455289, -2.994568, 0, 1, 0.8313726, 1,
-0.04517783, -0.8797761, -4.646591, 0, 1, 0.8392157, 1,
-0.04359323, 2.278176, -1.216609, 0, 1, 0.8431373, 1,
-0.04317253, -0.07241604, -2.647501, 0, 1, 0.8509804, 1,
-0.04036488, -0.4571931, -3.256769, 0, 1, 0.854902, 1,
-0.03833018, -0.1164759, -2.148546, 0, 1, 0.8627451, 1,
-0.03541382, 1.577673, -0.1065804, 0, 1, 0.8666667, 1,
-0.03355405, -0.6237426, -0.675567, 0, 1, 0.8745098, 1,
-0.03341457, 0.6588889, 2.459866, 0, 1, 0.8784314, 1,
-0.03092053, -0.1572738, -3.802743, 0, 1, 0.8862745, 1,
-0.02911713, -0.7020209, -4.062889, 0, 1, 0.8901961, 1,
-0.0285397, -0.1863381, -4.092956, 0, 1, 0.8980392, 1,
-0.023744, 0.5785338, -1.796625, 0, 1, 0.9058824, 1,
-0.02074071, -0.572114, -4.224738, 0, 1, 0.9098039, 1,
-0.01814229, -1.877734, -2.994642, 0, 1, 0.9176471, 1,
-0.01665235, -0.5824464, -2.501083, 0, 1, 0.9215686, 1,
-0.01357506, -0.07394048, -3.234468, 0, 1, 0.9294118, 1,
-0.01121114, 0.3977376, -0.01825096, 0, 1, 0.9333333, 1,
-0.009718777, -1.220983, -3.189823, 0, 1, 0.9411765, 1,
-0.002108877, 0.4394248, -0.07273854, 0, 1, 0.945098, 1,
0.003005984, 0.3529293, 2.134175, 0, 1, 0.9529412, 1,
0.006984976, -0.005914911, 2.638088, 0, 1, 0.9568627, 1,
0.01114215, 0.7439901, -0.3502336, 0, 1, 0.9647059, 1,
0.01231783, 0.8771589, -0.5350811, 0, 1, 0.9686275, 1,
0.01316307, 0.9176679, 0.6760828, 0, 1, 0.9764706, 1,
0.01428247, 0.1552402, -1.03318, 0, 1, 0.9803922, 1,
0.01509124, 0.7174289, 1.117146, 0, 1, 0.9882353, 1,
0.01663524, -0.5916541, 1.665985, 0, 1, 0.9921569, 1,
0.02338265, -2.60444, 2.891139, 0, 1, 1, 1,
0.03078182, -0.06680245, 3.265755, 0, 0.9921569, 1, 1,
0.03229197, 0.2686127, -0.8058437, 0, 0.9882353, 1, 1,
0.03613583, -0.2780471, 3.7079, 0, 0.9803922, 1, 1,
0.03892203, 1.617376, 0.6746285, 0, 0.9764706, 1, 1,
0.03944326, 1.101656, 0.5269136, 0, 0.9686275, 1, 1,
0.03982243, -1.716713, 2.859108, 0, 0.9647059, 1, 1,
0.04050937, -0.4992407, 2.350313, 0, 0.9568627, 1, 1,
0.04648275, -0.8367948, 2.776158, 0, 0.9529412, 1, 1,
0.04700982, 0.4366458, -0.96338, 0, 0.945098, 1, 1,
0.04875581, -0.5931231, 2.37979, 0, 0.9411765, 1, 1,
0.04937555, 0.9631153, 0.002758326, 0, 0.9333333, 1, 1,
0.05075337, 0.05374007, 1.462007, 0, 0.9294118, 1, 1,
0.05246001, 1.716566, -0.6031106, 0, 0.9215686, 1, 1,
0.05504717, -1.972123, 2.128763, 0, 0.9176471, 1, 1,
0.05705606, 0.7183177, -1.068104, 0, 0.9098039, 1, 1,
0.0574021, -0.06669629, 2.815386, 0, 0.9058824, 1, 1,
0.05980146, 0.7358007, -0.02368491, 0, 0.8980392, 1, 1,
0.06067177, 1.240548, 0.3642598, 0, 0.8901961, 1, 1,
0.06310064, -2.099747, 3.109813, 0, 0.8862745, 1, 1,
0.06317111, -1.295274, 2.483637, 0, 0.8784314, 1, 1,
0.06397221, -0.5165839, 2.336021, 0, 0.8745098, 1, 1,
0.06535833, -0.9977507, 1.877487, 0, 0.8666667, 1, 1,
0.06657498, 0.2144551, 0.6143861, 0, 0.8627451, 1, 1,
0.06683173, -1.814, 3.526565, 0, 0.854902, 1, 1,
0.07292499, -0.5419064, 4.436209, 0, 0.8509804, 1, 1,
0.07313102, 0.6996, 0.4060875, 0, 0.8431373, 1, 1,
0.07339608, 1.361209, 0.7221245, 0, 0.8392157, 1, 1,
0.07650495, -0.5033666, 2.977065, 0, 0.8313726, 1, 1,
0.07656184, -0.165611, 2.043447, 0, 0.827451, 1, 1,
0.07886761, 1.39606, -1.336265, 0, 0.8196079, 1, 1,
0.07905025, 1.535848, -1.673302, 0, 0.8156863, 1, 1,
0.08300682, -0.0441013, 2.320239, 0, 0.8078431, 1, 1,
0.08477347, -3.018895, 4.683327, 0, 0.8039216, 1, 1,
0.08643479, 0.730198, -1.1081, 0, 0.7960784, 1, 1,
0.08928037, -1.202017, 2.70687, 0, 0.7882353, 1, 1,
0.08934566, -0.08941098, 1.430746, 0, 0.7843137, 1, 1,
0.09194079, -0.8284771, 4.184537, 0, 0.7764706, 1, 1,
0.09427118, -0.4116481, 3.292896, 0, 0.772549, 1, 1,
0.09615392, 0.0624092, 0.9777125, 0, 0.7647059, 1, 1,
0.09650317, -0.3402873, 3.102139, 0, 0.7607843, 1, 1,
0.09725543, -0.1646242, 2.05221, 0, 0.7529412, 1, 1,
0.0972909, 1.235456, 0.4800453, 0, 0.7490196, 1, 1,
0.1003536, -1.081268, 5.008587, 0, 0.7411765, 1, 1,
0.10214, 0.1326128, -2.262861, 0, 0.7372549, 1, 1,
0.1021511, -0.3056256, 1.362305, 0, 0.7294118, 1, 1,
0.1022123, 0.7159593, 1.267095, 0, 0.7254902, 1, 1,
0.1042784, 0.8240407, 0.07059313, 0, 0.7176471, 1, 1,
0.1049526, 0.7339499, 0.616686, 0, 0.7137255, 1, 1,
0.1053357, -0.008371798, 1.244127, 0, 0.7058824, 1, 1,
0.1053968, -1.177774, 2.599177, 0, 0.6980392, 1, 1,
0.108258, -0.6351805, 2.221449, 0, 0.6941177, 1, 1,
0.1094254, -0.3583369, 1.619745, 0, 0.6862745, 1, 1,
0.1129943, 0.6215824, 0.6826673, 0, 0.682353, 1, 1,
0.1159063, 1.020661, 1.570879, 0, 0.6745098, 1, 1,
0.1171711, 1.178313, 0.2115583, 0, 0.6705883, 1, 1,
0.1271767, 0.7375476, 0.02155997, 0, 0.6627451, 1, 1,
0.1299822, 0.4365654, -0.6414768, 0, 0.6588235, 1, 1,
0.1302863, 0.7158714, -1.674412, 0, 0.6509804, 1, 1,
0.1309232, 2.099601, 1.522632, 0, 0.6470588, 1, 1,
0.1349447, 1.713892, 2.007512, 0, 0.6392157, 1, 1,
0.1413248, -2.056345, 2.709254, 0, 0.6352941, 1, 1,
0.1487057, 0.4258475, 0.9229959, 0, 0.627451, 1, 1,
0.1487148, -0.2559917, 3.791954, 0, 0.6235294, 1, 1,
0.1552123, -0.4586694, 4.531267, 0, 0.6156863, 1, 1,
0.1559728, -0.06745075, 2.303548, 0, 0.6117647, 1, 1,
0.1562001, -0.4953597, 1.123331, 0, 0.6039216, 1, 1,
0.1564746, -0.06679913, 3.148077, 0, 0.5960785, 1, 1,
0.1583273, -1.306379, 4.553514, 0, 0.5921569, 1, 1,
0.1594175, -1.291514, 2.903957, 0, 0.5843138, 1, 1,
0.1596968, 0.811667, -1.216509, 0, 0.5803922, 1, 1,
0.1636311, 1.016701, 1.279677, 0, 0.572549, 1, 1,
0.1645092, -0.1964908, 2.5267, 0, 0.5686275, 1, 1,
0.1654754, -0.4498349, 3.986179, 0, 0.5607843, 1, 1,
0.1664857, -1.339407, 4.410776, 0, 0.5568628, 1, 1,
0.1687621, -0.9693781, 1.856688, 0, 0.5490196, 1, 1,
0.1780492, 0.4502713, 0.5998383, 0, 0.5450981, 1, 1,
0.180993, 0.2589779, 0.3125354, 0, 0.5372549, 1, 1,
0.1822142, 1.565453, 1.301066, 0, 0.5333334, 1, 1,
0.1829077, 0.4075989, 0.1611918, 0, 0.5254902, 1, 1,
0.184523, -0.7615591, 3.156176, 0, 0.5215687, 1, 1,
0.1851255, -0.9857287, 3.59539, 0, 0.5137255, 1, 1,
0.1865976, -0.09107038, 2.013098, 0, 0.509804, 1, 1,
0.1867383, 0.8520285, 0.7228035, 0, 0.5019608, 1, 1,
0.1881065, -1.4376, 2.514919, 0, 0.4941176, 1, 1,
0.1906714, -0.9300485, 2.941556, 0, 0.4901961, 1, 1,
0.1943438, 0.4367457, 3.700343, 0, 0.4823529, 1, 1,
0.1992306, 0.2284409, -0.01585524, 0, 0.4784314, 1, 1,
0.2064482, 0.1074101, 0.3898863, 0, 0.4705882, 1, 1,
0.2086601, -1.956421, 3.249653, 0, 0.4666667, 1, 1,
0.210874, 1.02305, 2.125725, 0, 0.4588235, 1, 1,
0.212776, 0.9272004, 0.4172348, 0, 0.454902, 1, 1,
0.2161644, -2.218154, 2.621658, 0, 0.4470588, 1, 1,
0.2227673, 1.683528, -0.6131846, 0, 0.4431373, 1, 1,
0.2238439, -0.21231, 3.569437, 0, 0.4352941, 1, 1,
0.2280901, -0.3563524, 2.968827, 0, 0.4313726, 1, 1,
0.2362196, 0.1317859, 0.8933743, 0, 0.4235294, 1, 1,
0.2382798, 0.4222853, 0.7662158, 0, 0.4196078, 1, 1,
0.239953, 1.89974, 1.151978, 0, 0.4117647, 1, 1,
0.24597, 0.2378633, 3.641922, 0, 0.4078431, 1, 1,
0.2463794, -0.02322655, 1.070422, 0, 0.4, 1, 1,
0.2468784, -1.282015, 4.331307, 0, 0.3921569, 1, 1,
0.2469636, 0.07422482, 0.1134694, 0, 0.3882353, 1, 1,
0.2474314, 0.2893715, -0.4884135, 0, 0.3803922, 1, 1,
0.2502602, 2.542806, 1.516256, 0, 0.3764706, 1, 1,
0.2516238, 0.3649759, 1.349877, 0, 0.3686275, 1, 1,
0.2524856, -0.04362645, 1.996921, 0, 0.3647059, 1, 1,
0.2539747, 0.6737049, 0.2313285, 0, 0.3568628, 1, 1,
0.2546165, 1.03462, 0.8554529, 0, 0.3529412, 1, 1,
0.2582413, -0.04801043, 0.8723327, 0, 0.345098, 1, 1,
0.2595473, 0.7811757, -0.2616956, 0, 0.3411765, 1, 1,
0.2596242, -0.03152942, 0.8290183, 0, 0.3333333, 1, 1,
0.2606216, -0.2261464, 1.377297, 0, 0.3294118, 1, 1,
0.2622316, -0.762319, 3.118158, 0, 0.3215686, 1, 1,
0.2624881, -1.149934, 3.583625, 0, 0.3176471, 1, 1,
0.2635069, -0.4134192, 2.902855, 0, 0.3098039, 1, 1,
0.263691, -0.6044806, 3.067283, 0, 0.3058824, 1, 1,
0.263895, -0.1569111, 1.219276, 0, 0.2980392, 1, 1,
0.2656457, 0.7883677, 1.297226, 0, 0.2901961, 1, 1,
0.2686992, 0.9907288, 0.02484204, 0, 0.2862745, 1, 1,
0.270452, 0.7773152, 0.5454262, 0, 0.2784314, 1, 1,
0.2713843, -0.331252, 3.742801, 0, 0.2745098, 1, 1,
0.2757004, 0.5370538, -1.149581, 0, 0.2666667, 1, 1,
0.2761802, 0.6250901, 1.40752, 0, 0.2627451, 1, 1,
0.2787305, -0.2006942, 4.309347, 0, 0.254902, 1, 1,
0.2790752, 0.6231583, 1.37044, 0, 0.2509804, 1, 1,
0.279526, 1.641396, -0.3478718, 0, 0.2431373, 1, 1,
0.2796701, -0.7447615, 3.10833, 0, 0.2392157, 1, 1,
0.281159, -1.867733, 3.745352, 0, 0.2313726, 1, 1,
0.284963, -0.06263842, 3.91202, 0, 0.227451, 1, 1,
0.286375, 0.8707057, 0.657129, 0, 0.2196078, 1, 1,
0.2878688, -0.6112927, 1.408171, 0, 0.2156863, 1, 1,
0.2907631, -1.420744, 0.7738957, 0, 0.2078431, 1, 1,
0.2964613, 1.286849, 0.822583, 0, 0.2039216, 1, 1,
0.301586, -0.3188213, 4.188103, 0, 0.1960784, 1, 1,
0.3047012, 0.7644706, -0.3065518, 0, 0.1882353, 1, 1,
0.3050208, -1.12237, 1.420803, 0, 0.1843137, 1, 1,
0.306004, 1.014732, 1.667921, 0, 0.1764706, 1, 1,
0.3118168, -0.4749721, 1.755455, 0, 0.172549, 1, 1,
0.3138878, 0.8668329, 1.763243, 0, 0.1647059, 1, 1,
0.3152282, 0.3911127, -1.006543, 0, 0.1607843, 1, 1,
0.3182357, -0.5153885, 4.426016, 0, 0.1529412, 1, 1,
0.322348, 1.705769, -1.206968, 0, 0.1490196, 1, 1,
0.3230509, -0.117672, 1.538854, 0, 0.1411765, 1, 1,
0.3237611, -0.516874, 4.0127, 0, 0.1372549, 1, 1,
0.3293412, -0.1524445, 1.142093, 0, 0.1294118, 1, 1,
0.3311793, 0.3761014, 1.818505, 0, 0.1254902, 1, 1,
0.3343377, -2.160601, 2.759093, 0, 0.1176471, 1, 1,
0.3380552, -1.525531, 2.146417, 0, 0.1137255, 1, 1,
0.3434289, -1.152222, 3.284324, 0, 0.1058824, 1, 1,
0.3462521, 0.6832126, -0.7887078, 0, 0.09803922, 1, 1,
0.3572172, 1.022569, 2.138261, 0, 0.09411765, 1, 1,
0.3599086, 1.20241, -0.5975059, 0, 0.08627451, 1, 1,
0.3599388, -1.264301, 2.810013, 0, 0.08235294, 1, 1,
0.3618835, -0.5525457, 2.530185, 0, 0.07450981, 1, 1,
0.3646457, 0.5922296, 0.9585289, 0, 0.07058824, 1, 1,
0.3681119, -1.042868, 3.326872, 0, 0.0627451, 1, 1,
0.3692122, -0.7553311, 2.350848, 0, 0.05882353, 1, 1,
0.3695566, 1.629091, 0.06145356, 0, 0.05098039, 1, 1,
0.3717416, -0.1052232, 4.063755, 0, 0.04705882, 1, 1,
0.3724566, 0.8169951, 0.7472564, 0, 0.03921569, 1, 1,
0.3780639, 0.5069121, -0.5829054, 0, 0.03529412, 1, 1,
0.3784435, -2.134488, 3.569482, 0, 0.02745098, 1, 1,
0.3840279, 1.103374, 0.8972138, 0, 0.02352941, 1, 1,
0.3848214, 1.989999, -0.7637094, 0, 0.01568628, 1, 1,
0.3849754, 1.445432, -0.429132, 0, 0.01176471, 1, 1,
0.3885831, 1.495503, -0.6359047, 0, 0.003921569, 1, 1,
0.390865, 0.3634479, 0.2865478, 0.003921569, 0, 1, 1,
0.392025, -0.07048257, 0.2763424, 0.007843138, 0, 1, 1,
0.396229, 1.326713, -0.07737666, 0.01568628, 0, 1, 1,
0.3969113, -1.193015, 1.505739, 0.01960784, 0, 1, 1,
0.3991112, -0.425044, 3.919501, 0.02745098, 0, 1, 1,
0.409782, -0.4231881, 1.264411, 0.03137255, 0, 1, 1,
0.4172901, 0.3079017, -0.2255926, 0.03921569, 0, 1, 1,
0.4230439, -1.197193, 4.598719, 0.04313726, 0, 1, 1,
0.4242521, -0.889064, 3.510612, 0.05098039, 0, 1, 1,
0.4245223, 0.06656586, 1.384116, 0.05490196, 0, 1, 1,
0.4443019, 1.151989, 1.26312, 0.0627451, 0, 1, 1,
0.4450345, -0.7250848, 1.332151, 0.06666667, 0, 1, 1,
0.4455059, -0.4072321, 3.072532, 0.07450981, 0, 1, 1,
0.445576, -0.9117939, 2.005879, 0.07843138, 0, 1, 1,
0.4456749, 0.1007295, 0.6378027, 0.08627451, 0, 1, 1,
0.4528703, -1.058596, 2.558138, 0.09019608, 0, 1, 1,
0.4567954, -0.5018498, 1.909748, 0.09803922, 0, 1, 1,
0.4601322, 0.4767444, 0.4799377, 0.1058824, 0, 1, 1,
0.465059, 0.42647, 0.354208, 0.1098039, 0, 1, 1,
0.4664882, 1.490184, -0.01398532, 0.1176471, 0, 1, 1,
0.4674639, 0.03247634, 2.982506, 0.1215686, 0, 1, 1,
0.4701732, 0.4268269, -0.09104235, 0.1294118, 0, 1, 1,
0.4733706, -1.39162, 3.233418, 0.1333333, 0, 1, 1,
0.4740797, -0.9170769, 2.165713, 0.1411765, 0, 1, 1,
0.4779319, -0.5565177, 2.333656, 0.145098, 0, 1, 1,
0.4779843, 1.315554, 0.4390928, 0.1529412, 0, 1, 1,
0.4855823, -0.1247207, -0.0828594, 0.1568628, 0, 1, 1,
0.4877969, 0.3124502, 0.4967062, 0.1647059, 0, 1, 1,
0.4929034, -1.765812, 4.024497, 0.1686275, 0, 1, 1,
0.4932741, 0.7370092, 1.138827, 0.1764706, 0, 1, 1,
0.4976911, 0.2422488, 1.270158, 0.1803922, 0, 1, 1,
0.5017257, 0.6562812, -0.1315632, 0.1882353, 0, 1, 1,
0.5058437, -0.1195692, 1.597462, 0.1921569, 0, 1, 1,
0.5066792, -2.101909, 3.363477, 0.2, 0, 1, 1,
0.510021, 0.8481476, 0.6877898, 0.2078431, 0, 1, 1,
0.5146712, 0.4683383, 0.5548139, 0.2117647, 0, 1, 1,
0.5239214, 0.7241763, 0.2230457, 0.2196078, 0, 1, 1,
0.5344813, -0.5433155, 0.9699795, 0.2235294, 0, 1, 1,
0.5349754, 2.16804, -1.581866, 0.2313726, 0, 1, 1,
0.5350826, 3.017576, 0.3580239, 0.2352941, 0, 1, 1,
0.53686, 1.066832, 3.303555, 0.2431373, 0, 1, 1,
0.5403523, 0.2136654, 2.210141, 0.2470588, 0, 1, 1,
0.5456383, -0.7645332, 4.519665, 0.254902, 0, 1, 1,
0.548814, -0.3555929, 1.761456, 0.2588235, 0, 1, 1,
0.5494535, -2.247739, 0.8668278, 0.2666667, 0, 1, 1,
0.5528004, 0.01122306, 1.245355, 0.2705882, 0, 1, 1,
0.5544133, 1.39739, -1.138334, 0.2784314, 0, 1, 1,
0.5556371, 1.41982, -0.7178224, 0.282353, 0, 1, 1,
0.5567198, -0.5389987, 2.766217, 0.2901961, 0, 1, 1,
0.5698572, 0.09365004, 1.565559, 0.2941177, 0, 1, 1,
0.5727965, 0.3595183, 2.251937, 0.3019608, 0, 1, 1,
0.5766309, 0.6621372, 0.2536625, 0.3098039, 0, 1, 1,
0.578912, -0.6322726, 0.881302, 0.3137255, 0, 1, 1,
0.5789145, 0.1781257, 1.882171, 0.3215686, 0, 1, 1,
0.5802517, 0.9055159, 2.792586, 0.3254902, 0, 1, 1,
0.5821949, 0.6637875, 1.751958, 0.3333333, 0, 1, 1,
0.5838854, 0.2808381, -0.4072894, 0.3372549, 0, 1, 1,
0.5858762, 0.9861877, 2.025508, 0.345098, 0, 1, 1,
0.5861429, -0.8717259, 2.858025, 0.3490196, 0, 1, 1,
0.588563, 0.3541857, 1.076072, 0.3568628, 0, 1, 1,
0.5961081, 0.4354767, 1.806631, 0.3607843, 0, 1, 1,
0.5967169, 0.02411454, 1.943618, 0.3686275, 0, 1, 1,
0.5982563, 1.820596, -0.6089599, 0.372549, 0, 1, 1,
0.6034446, -0.2270932, 1.955764, 0.3803922, 0, 1, 1,
0.6076829, -0.3684959, 3.27832, 0.3843137, 0, 1, 1,
0.6133037, 0.9709931, 0.6610591, 0.3921569, 0, 1, 1,
0.6151916, 0.1686584, 1.409526, 0.3960784, 0, 1, 1,
0.6152495, 1.542226, 0.871693, 0.4039216, 0, 1, 1,
0.6243901, -0.8175343, 2.522575, 0.4117647, 0, 1, 1,
0.6284693, -0.5242747, 4.249702, 0.4156863, 0, 1, 1,
0.6481056, -0.7507517, 2.197403, 0.4235294, 0, 1, 1,
0.6483884, 1.12206, 0.3297773, 0.427451, 0, 1, 1,
0.6545362, 0.7254267, 0.1793815, 0.4352941, 0, 1, 1,
0.6548595, -1.077764, 1.657647, 0.4392157, 0, 1, 1,
0.6557598, 3.110405, 0.7951485, 0.4470588, 0, 1, 1,
0.6590717, -3.072826, 3.347715, 0.4509804, 0, 1, 1,
0.6640762, -1.607564, 1.354727, 0.4588235, 0, 1, 1,
0.6668243, -0.4547033, 2.59636, 0.4627451, 0, 1, 1,
0.6733917, 1.238402, 0.5101334, 0.4705882, 0, 1, 1,
0.6768925, -0.5077336, 4.426354, 0.4745098, 0, 1, 1,
0.6797605, 0.03641542, 2.228724, 0.4823529, 0, 1, 1,
0.682161, -0.9668937, 3.636077, 0.4862745, 0, 1, 1,
0.6837528, 0.3818652, 1.304073, 0.4941176, 0, 1, 1,
0.6842259, -0.6433429, 2.322024, 0.5019608, 0, 1, 1,
0.6872044, 0.2022465, 0.4590587, 0.5058824, 0, 1, 1,
0.6880084, -0.8393705, 2.309842, 0.5137255, 0, 1, 1,
0.688283, 1.027415, 0.5333982, 0.5176471, 0, 1, 1,
0.6907629, -2.309529, 2.994894, 0.5254902, 0, 1, 1,
0.6953155, -1.12324, 1.785558, 0.5294118, 0, 1, 1,
0.7048712, -0.2235297, 3.298255, 0.5372549, 0, 1, 1,
0.7079436, 0.002089534, 2.140115, 0.5411765, 0, 1, 1,
0.7100293, 0.308631, 0.5902293, 0.5490196, 0, 1, 1,
0.7116171, -0.8909239, 2.594065, 0.5529412, 0, 1, 1,
0.7135265, -0.8774485, 2.475829, 0.5607843, 0, 1, 1,
0.7203983, 0.4382454, 2.047148, 0.5647059, 0, 1, 1,
0.727174, -0.2335494, 1.943004, 0.572549, 0, 1, 1,
0.73076, 0.2007267, 1.376966, 0.5764706, 0, 1, 1,
0.7316441, -1.027099, 1.752579, 0.5843138, 0, 1, 1,
0.7350055, -0.3466648, 1.483299, 0.5882353, 0, 1, 1,
0.7366036, -0.2577518, 1.288683, 0.5960785, 0, 1, 1,
0.7404559, -0.1890962, 0.7714261, 0.6039216, 0, 1, 1,
0.7413461, -0.06694134, 2.742097, 0.6078432, 0, 1, 1,
0.7421562, 0.1559877, 0.5273721, 0.6156863, 0, 1, 1,
0.746041, -0.0598425, 2.056006, 0.6196079, 0, 1, 1,
0.7475673, -0.8074187, 1.609738, 0.627451, 0, 1, 1,
0.7529098, -1.003767, 3.303569, 0.6313726, 0, 1, 1,
0.7618738, -0.8074068, 2.144851, 0.6392157, 0, 1, 1,
0.7636956, 2.778202, 0.3415422, 0.6431373, 0, 1, 1,
0.7639585, 0.254009, 3.289924, 0.6509804, 0, 1, 1,
0.7662682, 1.672649, -0.4889965, 0.654902, 0, 1, 1,
0.7689008, -0.06644257, 3.075807, 0.6627451, 0, 1, 1,
0.7747224, 0.4043928, 0.0720159, 0.6666667, 0, 1, 1,
0.7843805, 0.6873913, -0.1433928, 0.6745098, 0, 1, 1,
0.7876933, -0.5609408, 1.849107, 0.6784314, 0, 1, 1,
0.7886647, -0.241502, -0.3993641, 0.6862745, 0, 1, 1,
0.796423, 2.339167, -0.6013231, 0.6901961, 0, 1, 1,
0.8068093, -0.05472131, 1.027744, 0.6980392, 0, 1, 1,
0.8123577, 1.162213, 0.6517721, 0.7058824, 0, 1, 1,
0.8155726, 1.544611, -1.040772, 0.7098039, 0, 1, 1,
0.817838, -0.8389953, 1.681397, 0.7176471, 0, 1, 1,
0.8179647, 1.071495, -0.5599496, 0.7215686, 0, 1, 1,
0.8184549, 0.1312537, 1.199443, 0.7294118, 0, 1, 1,
0.818958, 0.4972658, -0.627822, 0.7333333, 0, 1, 1,
0.8210933, -0.1414752, 0.6030672, 0.7411765, 0, 1, 1,
0.822807, 0.3264029, 0.1352445, 0.7450981, 0, 1, 1,
0.8251563, 0.04749713, 1.122353, 0.7529412, 0, 1, 1,
0.8294731, 0.4813113, 0.8438829, 0.7568628, 0, 1, 1,
0.8322791, -0.8486052, 4.894723, 0.7647059, 0, 1, 1,
0.8345945, 0.591449, 1.342363, 0.7686275, 0, 1, 1,
0.8405403, -1.475191, 3.545246, 0.7764706, 0, 1, 1,
0.8426126, 1.661934, 1.121631, 0.7803922, 0, 1, 1,
0.8435367, -1.02893, 1.309946, 0.7882353, 0, 1, 1,
0.8477726, 0.5184893, 0.5345576, 0.7921569, 0, 1, 1,
0.8594486, -0.3976236, 1.434152, 0.8, 0, 1, 1,
0.8653088, -0.09604523, 1.264245, 0.8078431, 0, 1, 1,
0.8659196, -2.068245, 0.3960589, 0.8117647, 0, 1, 1,
0.8703659, -0.8519574, 2.544173, 0.8196079, 0, 1, 1,
0.8707445, -0.3254785, 1.875036, 0.8235294, 0, 1, 1,
0.8728957, 1.133959, 0.6985616, 0.8313726, 0, 1, 1,
0.8740583, -0.1306924, 1.895798, 0.8352941, 0, 1, 1,
0.8780523, -1.373699, 3.064825, 0.8431373, 0, 1, 1,
0.8789391, 0.1035603, 1.27534, 0.8470588, 0, 1, 1,
0.8796946, 0.1593148, 1.761901, 0.854902, 0, 1, 1,
0.8817247, -1.03639, 2.411142, 0.8588235, 0, 1, 1,
0.8824338, -0.4557895, 2.116456, 0.8666667, 0, 1, 1,
0.8835766, -0.6223723, 3.100631, 0.8705882, 0, 1, 1,
0.8930156, -0.7445058, 3.28445, 0.8784314, 0, 1, 1,
0.9016246, -2.024561, 0.5825166, 0.8823529, 0, 1, 1,
0.9104561, -0.4902382, 0.1529271, 0.8901961, 0, 1, 1,
0.9120508, 0.1126965, 2.648185, 0.8941177, 0, 1, 1,
0.9177826, 0.4368458, 0.790316, 0.9019608, 0, 1, 1,
0.9204584, 0.03647535, 0.05030511, 0.9098039, 0, 1, 1,
0.9251456, 0.07389101, 0.6216065, 0.9137255, 0, 1, 1,
0.9292549, 0.1120752, 2.363636, 0.9215686, 0, 1, 1,
0.9330419, 0.4087328, 1.023609, 0.9254902, 0, 1, 1,
0.9378713, -0.8985455, 2.533853, 0.9333333, 0, 1, 1,
0.9382187, -2.925451, 3.181912, 0.9372549, 0, 1, 1,
0.9571603, 1.344095, 0.9002243, 0.945098, 0, 1, 1,
0.9606879, -1.191805, 2.853824, 0.9490196, 0, 1, 1,
0.9627761, -0.8945661, -0.313522, 0.9568627, 0, 1, 1,
0.9635824, -0.3930224, 2.809883, 0.9607843, 0, 1, 1,
0.9706476, -1.096893, 0.9137754, 0.9686275, 0, 1, 1,
0.9722534, 1.204433, 0.9722147, 0.972549, 0, 1, 1,
0.976606, -0.7117332, 2.219378, 0.9803922, 0, 1, 1,
0.9794134, 0.8073233, -0.7537233, 0.9843137, 0, 1, 1,
0.989513, -1.418075, 2.94355, 0.9921569, 0, 1, 1,
0.9929033, 1.04319, 1.807887, 0.9960784, 0, 1, 1,
0.9936136, -0.05569912, -0.4307074, 1, 0, 0.9960784, 1,
0.9944507, -0.02192358, 1.418538, 1, 0, 0.9882353, 1,
0.9945076, 0.007756828, 1.587146, 1, 0, 0.9843137, 1,
0.9997532, 1.281654, 0.9613021, 1, 0, 0.9764706, 1,
1.00316, -1.165637, 3.685233, 1, 0, 0.972549, 1,
1.010976, 1.973349, -0.9515295, 1, 0, 0.9647059, 1,
1.020482, -0.2071981, 1.969777, 1, 0, 0.9607843, 1,
1.021199, 0.5929264, 1.129221, 1, 0, 0.9529412, 1,
1.023277, -0.5194787, 2.310272, 1, 0, 0.9490196, 1,
1.024427, -0.3536891, 1.535457, 1, 0, 0.9411765, 1,
1.03169, -0.1571748, -0.3086648, 1, 0, 0.9372549, 1,
1.032108, -0.3736589, 1.70235, 1, 0, 0.9294118, 1,
1.037864, -0.1158647, 3.463961, 1, 0, 0.9254902, 1,
1.046081, 0.2763636, 1.861311, 1, 0, 0.9176471, 1,
1.050172, -0.3727502, 4.134339, 1, 0, 0.9137255, 1,
1.054887, -0.5456011, 1.453355, 1, 0, 0.9058824, 1,
1.06458, -0.3988173, 2.075918, 1, 0, 0.9019608, 1,
1.070824, 0.6465723, 0.1289898, 1, 0, 0.8941177, 1,
1.070908, -0.7273817, 1.873987, 1, 0, 0.8862745, 1,
1.072005, 0.6468809, 1.121745, 1, 0, 0.8823529, 1,
1.078413, 0.06411067, 0.2794102, 1, 0, 0.8745098, 1,
1.087973, -1.193329, 2.088125, 1, 0, 0.8705882, 1,
1.088748, -0.215319, 1.326772, 1, 0, 0.8627451, 1,
1.096694, 0.5637575, 0.3995053, 1, 0, 0.8588235, 1,
1.098815, -0.3375308, 2.125899, 1, 0, 0.8509804, 1,
1.10717, 0.9420984, -1.12964, 1, 0, 0.8470588, 1,
1.107999, -0.648401, 2.634385, 1, 0, 0.8392157, 1,
1.111371, -0.739069, 1.204524, 1, 0, 0.8352941, 1,
1.112399, -0.5271842, 3.432444, 1, 0, 0.827451, 1,
1.114267, 1.281589, 0.9790679, 1, 0, 0.8235294, 1,
1.138876, -0.9473352, 1.342727, 1, 0, 0.8156863, 1,
1.143471, -0.4115543, 0.6897365, 1, 0, 0.8117647, 1,
1.144635, 0.3363762, 1.648989, 1, 0, 0.8039216, 1,
1.152171, 0.325702, 0.06979472, 1, 0, 0.7960784, 1,
1.153771, 1.391821, 1.842072, 1, 0, 0.7921569, 1,
1.154561, -0.4744503, 1.506957, 1, 0, 0.7843137, 1,
1.157016, -1.879569, 2.038106, 1, 0, 0.7803922, 1,
1.160533, 0.4422303, 1.823414, 1, 0, 0.772549, 1,
1.161446, 0.6564688, 0.432514, 1, 0, 0.7686275, 1,
1.16397, -1.835567, 1.683614, 1, 0, 0.7607843, 1,
1.163994, -0.08054807, 1.626448, 1, 0, 0.7568628, 1,
1.164051, -1.284519, 2.451389, 1, 0, 0.7490196, 1,
1.167051, -2.063273, 1.689466, 1, 0, 0.7450981, 1,
1.169709, -1.23885, 0.5899365, 1, 0, 0.7372549, 1,
1.173936, -0.7050561, 1.539004, 1, 0, 0.7333333, 1,
1.175184, 1.581525, 0.8274278, 1, 0, 0.7254902, 1,
1.180571, -0.0653526, 0.6733274, 1, 0, 0.7215686, 1,
1.181322, -1.058511, 1.230464, 1, 0, 0.7137255, 1,
1.185661, -0.2450955, 2.38082, 1, 0, 0.7098039, 1,
1.186449, 1.376946, 1.04822, 1, 0, 0.7019608, 1,
1.187215, 0.09572688, 1.194536, 1, 0, 0.6941177, 1,
1.194326, 0.7169797, 1.095728, 1, 0, 0.6901961, 1,
1.205935, 0.7682676, 0.02165407, 1, 0, 0.682353, 1,
1.208131, 1.326378, -0.5751907, 1, 0, 0.6784314, 1,
1.210444, -0.1914209, 1.214261, 1, 0, 0.6705883, 1,
1.215145, 0.1557337, 2.191724, 1, 0, 0.6666667, 1,
1.219677, -0.6204785, 3.369379, 1, 0, 0.6588235, 1,
1.224449, -0.3671484, 1.31093, 1, 0, 0.654902, 1,
1.226104, 1.020765, 0.8975337, 1, 0, 0.6470588, 1,
1.231708, -0.01965217, 2.44909, 1, 0, 0.6431373, 1,
1.248152, 0.6937077, 1.200862, 1, 0, 0.6352941, 1,
1.249052, -1.410956, 2.415191, 1, 0, 0.6313726, 1,
1.253193, -1.142605, 1.352244, 1, 0, 0.6235294, 1,
1.254098, -1.767576, 2.879939, 1, 0, 0.6196079, 1,
1.254217, -0.08581, 0.8062999, 1, 0, 0.6117647, 1,
1.287645, -0.08143495, 1.200868, 1, 0, 0.6078432, 1,
1.288394, 0.777661, 3.029863, 1, 0, 0.6, 1,
1.294943, 0.4284906, 0.1237796, 1, 0, 0.5921569, 1,
1.298588, 0.832435, 3.002773, 1, 0, 0.5882353, 1,
1.302423, 0.3707463, -0.5772863, 1, 0, 0.5803922, 1,
1.308287, -0.9375018, 2.706147, 1, 0, 0.5764706, 1,
1.310863, -0.6686007, 2.832497, 1, 0, 0.5686275, 1,
1.31436, 0.455698, 1.552405, 1, 0, 0.5647059, 1,
1.344287, -0.4109528, 1.303635, 1, 0, 0.5568628, 1,
1.347642, -0.3862868, 1.198282, 1, 0, 0.5529412, 1,
1.360477, -0.88581, 1.720978, 1, 0, 0.5450981, 1,
1.364806, 0.1746829, 1.954557, 1, 0, 0.5411765, 1,
1.366, -0.2962233, 1.621934, 1, 0, 0.5333334, 1,
1.368666, 0.8671176, 1.50217, 1, 0, 0.5294118, 1,
1.385984, 1.330511, 1.204931, 1, 0, 0.5215687, 1,
1.387807, -0.003461383, 1.855644, 1, 0, 0.5176471, 1,
1.392455, -0.5800606, 2.793783, 1, 0, 0.509804, 1,
1.39252, 1.971226, 1.15336, 1, 0, 0.5058824, 1,
1.410819, -0.4828161, 2.070986, 1, 0, 0.4980392, 1,
1.416589, -0.2955879, 2.065397, 1, 0, 0.4901961, 1,
1.416852, 1.382513, 0.1115971, 1, 0, 0.4862745, 1,
1.419792, -0.6980421, 1.664465, 1, 0, 0.4784314, 1,
1.427537, -0.8055279, 1.806783, 1, 0, 0.4745098, 1,
1.436449, 0.001291634, 0.7545153, 1, 0, 0.4666667, 1,
1.443108, 0.2186912, 1.944839, 1, 0, 0.4627451, 1,
1.448879, -1.115421, 2.067287, 1, 0, 0.454902, 1,
1.471658, 0.3316623, 0.5751898, 1, 0, 0.4509804, 1,
1.478554, 1.815763, 1.631148, 1, 0, 0.4431373, 1,
1.486411, -0.1102479, 1.027522, 1, 0, 0.4392157, 1,
1.493711, -0.2795382, 2.232708, 1, 0, 0.4313726, 1,
1.494452, -0.5540164, 2.738047, 1, 0, 0.427451, 1,
1.500817, -0.102357, 3.022688, 1, 0, 0.4196078, 1,
1.504186, -2.676816, 2.890326, 1, 0, 0.4156863, 1,
1.507228, 0.1353421, 0.3643031, 1, 0, 0.4078431, 1,
1.529012, 0.2588264, -0.01054657, 1, 0, 0.4039216, 1,
1.533042, -0.4051105, 0.4177856, 1, 0, 0.3960784, 1,
1.534793, -1.191754, -0.3503574, 1, 0, 0.3882353, 1,
1.535424, -2.121974, 2.884627, 1, 0, 0.3843137, 1,
1.549937, -1.547503, 2.097513, 1, 0, 0.3764706, 1,
1.56141, 0.04665209, 2.109916, 1, 0, 0.372549, 1,
1.574401, 0.07684705, 0.110836, 1, 0, 0.3647059, 1,
1.579875, 0.5007085, 1.99013, 1, 0, 0.3607843, 1,
1.613143, -0.05074532, 0.8247581, 1, 0, 0.3529412, 1,
1.617634, 1.365803, 1.007694, 1, 0, 0.3490196, 1,
1.623462, 2.269861, 0.2518204, 1, 0, 0.3411765, 1,
1.629354, 1.095216, 1.28025, 1, 0, 0.3372549, 1,
1.648696, 0.1486618, 2.886828, 1, 0, 0.3294118, 1,
1.660023, -0.2640222, 2.494869, 1, 0, 0.3254902, 1,
1.662425, -0.9945143, 2.190681, 1, 0, 0.3176471, 1,
1.665068, -0.4062702, 3.043355, 1, 0, 0.3137255, 1,
1.667106, -1.153443, 1.773796, 1, 0, 0.3058824, 1,
1.677886, -1.13093, 1.785287, 1, 0, 0.2980392, 1,
1.679644, -0.1777244, 0.6882517, 1, 0, 0.2941177, 1,
1.687803, -0.2535767, 1.79942, 1, 0, 0.2862745, 1,
1.690664, 0.7081774, 1.919262, 1, 0, 0.282353, 1,
1.699801, 0.8191769, 0.6749018, 1, 0, 0.2745098, 1,
1.704009, -0.8363025, 2.15754, 1, 0, 0.2705882, 1,
1.708864, 0.3151713, 2.200839, 1, 0, 0.2627451, 1,
1.725125, 2.14513, 1.679308, 1, 0, 0.2588235, 1,
1.741675, 1.176742, 1.885195, 1, 0, 0.2509804, 1,
1.756301, -0.2083367, 1.742378, 1, 0, 0.2470588, 1,
1.762004, 0.4077502, 2.115161, 1, 0, 0.2392157, 1,
1.767186, 0.7780116, 0.7918779, 1, 0, 0.2352941, 1,
1.773835, 0.3756494, 1.298683, 1, 0, 0.227451, 1,
1.776127, 0.1209555, 0.4494579, 1, 0, 0.2235294, 1,
1.794786, -1.145958, 3.041007, 1, 0, 0.2156863, 1,
1.79486, -1.865601, 2.594064, 1, 0, 0.2117647, 1,
1.807054, 0.2355437, 0.6792179, 1, 0, 0.2039216, 1,
1.810015, -0.4892097, 0.4676521, 1, 0, 0.1960784, 1,
1.833604, 0.3938856, 3.863288, 1, 0, 0.1921569, 1,
1.87729, 1.337439, 1.832916, 1, 0, 0.1843137, 1,
1.879104, -0.4049833, 2.844788, 1, 0, 0.1803922, 1,
1.911327, 0.2138002, -0.620589, 1, 0, 0.172549, 1,
1.917228, -0.4440029, 1.554772, 1, 0, 0.1686275, 1,
1.92014, -1.609096, 1.124351, 1, 0, 0.1607843, 1,
1.926576, -0.3562154, 1.205644, 1, 0, 0.1568628, 1,
1.938056, -0.7460172, 1.57706, 1, 0, 0.1490196, 1,
1.984955, 0.2416231, 1.353434, 1, 0, 0.145098, 1,
1.99169, -1.698951, 2.440965, 1, 0, 0.1372549, 1,
1.995842, -0.294715, 0.06100621, 1, 0, 0.1333333, 1,
2.037694, 0.8584428, 1.749579, 1, 0, 0.1254902, 1,
2.06637, 0.6054739, -0.1604673, 1, 0, 0.1215686, 1,
2.12815, 0.2386683, 0.8923934, 1, 0, 0.1137255, 1,
2.130079, 0.2072088, 2.571413, 1, 0, 0.1098039, 1,
2.141808, -0.8431418, 1.70899, 1, 0, 0.1019608, 1,
2.152074, -0.3060736, 2.52568, 1, 0, 0.09411765, 1,
2.157555, -1.138608, 2.189471, 1, 0, 0.09019608, 1,
2.206579, 0.1411942, 1.669087, 1, 0, 0.08235294, 1,
2.226325, 0.4407595, 0.8710055, 1, 0, 0.07843138, 1,
2.250876, 1.338721, 1.661276, 1, 0, 0.07058824, 1,
2.276146, 0.6928104, -0.6713067, 1, 0, 0.06666667, 1,
2.280928, 1.002789, -0.5208602, 1, 0, 0.05882353, 1,
2.315223, -0.2423078, 1.6905, 1, 0, 0.05490196, 1,
2.318041, -1.386461, 4.154116, 1, 0, 0.04705882, 1,
2.443063, 1.261938, 0.3036522, 1, 0, 0.04313726, 1,
2.494842, -0.3196359, 3.198752, 1, 0, 0.03529412, 1,
2.515163, -1.31923, 3.008183, 1, 0, 0.03137255, 1,
2.534268, 0.9775878, 0.3166064, 1, 0, 0.02352941, 1,
2.674801, 0.01383009, 2.798488, 1, 0, 0.01960784, 1,
2.739747, -0.425883, 1.517602, 1, 0, 0.01176471, 1,
3.387481, 0.03783219, 0.4914083, 1, 0, 0.007843138, 1
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
-0.06178606, -4.939898, -6.283144, 0, -0.5, 0.5, 0.5,
-0.06178606, -4.939898, -6.283144, 1, -0.5, 0.5, 0.5,
-0.06178606, -4.939898, -6.283144, 1, 1.5, 0.5, 0.5,
-0.06178606, -4.939898, -6.283144, 0, 1.5, 0.5, 0.5
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
-4.680355, -0.3313665, -6.283144, 0, -0.5, 0.5, 0.5,
-4.680355, -0.3313665, -6.283144, 1, -0.5, 0.5, 0.5,
-4.680355, -0.3313665, -6.283144, 1, 1.5, 0.5, 0.5,
-4.680355, -0.3313665, -6.283144, 0, 1.5, 0.5, 0.5
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
-4.680355, -4.939898, 0.1809978, 0, -0.5, 0.5, 0.5,
-4.680355, -4.939898, 0.1809978, 1, -0.5, 0.5, 0.5,
-4.680355, -4.939898, 0.1809978, 1, 1.5, 0.5, 0.5,
-4.680355, -4.939898, 0.1809978, 0, 1.5, 0.5, 0.5
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
-3, -3.876391, -4.791419,
3, -3.876391, -4.791419,
-3, -3.876391, -4.791419,
-3, -4.053642, -5.04004,
-2, -3.876391, -4.791419,
-2, -4.053642, -5.04004,
-1, -3.876391, -4.791419,
-1, -4.053642, -5.04004,
0, -3.876391, -4.791419,
0, -4.053642, -5.04004,
1, -3.876391, -4.791419,
1, -4.053642, -5.04004,
2, -3.876391, -4.791419,
2, -4.053642, -5.04004,
3, -3.876391, -4.791419,
3, -4.053642, -5.04004
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
-3, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
-3, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
-3, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
-3, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
-2, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
-2, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
-2, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
-2, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
-1, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
-1, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
-1, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
-1, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
0, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
0, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
0, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
0, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
1, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
1, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
1, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
1, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
2, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
2, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
2, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
2, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5,
3, -4.408144, -5.537282, 0, -0.5, 0.5, 0.5,
3, -4.408144, -5.537282, 1, -0.5, 0.5, 0.5,
3, -4.408144, -5.537282, 1, 1.5, 0.5, 0.5,
3, -4.408144, -5.537282, 0, 1.5, 0.5, 0.5
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
-3.614531, -3, -4.791419,
-3.614531, 3, -4.791419,
-3.614531, -3, -4.791419,
-3.792169, -3, -5.04004,
-3.614531, -2, -4.791419,
-3.792169, -2, -5.04004,
-3.614531, -1, -4.791419,
-3.792169, -1, -5.04004,
-3.614531, 0, -4.791419,
-3.792169, 0, -5.04004,
-3.614531, 1, -4.791419,
-3.792169, 1, -5.04004,
-3.614531, 2, -4.791419,
-3.792169, 2, -5.04004,
-3.614531, 3, -4.791419,
-3.792169, 3, -5.04004
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
-4.147443, -3, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, -3, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, -3, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, -3, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, -2, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, -2, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, -2, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, -2, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, -1, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, -1, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, -1, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, -1, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, 0, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, 0, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, 0, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, 0, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, 1, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, 1, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, 1, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, 1, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, 2, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, 2, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, 2, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, 2, -5.537282, 0, 1.5, 0.5, 0.5,
-4.147443, 3, -5.537282, 0, -0.5, 0.5, 0.5,
-4.147443, 3, -5.537282, 1, -0.5, 0.5, 0.5,
-4.147443, 3, -5.537282, 1, 1.5, 0.5, 0.5,
-4.147443, 3, -5.537282, 0, 1.5, 0.5, 0.5
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
-3.614531, -3.876391, -4,
-3.614531, -3.876391, 4,
-3.614531, -3.876391, -4,
-3.792169, -4.053642, -4,
-3.614531, -3.876391, -2,
-3.792169, -4.053642, -2,
-3.614531, -3.876391, 0,
-3.792169, -4.053642, 0,
-3.614531, -3.876391, 2,
-3.792169, -4.053642, 2,
-3.614531, -3.876391, 4,
-3.792169, -4.053642, 4
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
-4.147443, -4.408144, -4, 0, -0.5, 0.5, 0.5,
-4.147443, -4.408144, -4, 1, -0.5, 0.5, 0.5,
-4.147443, -4.408144, -4, 1, 1.5, 0.5, 0.5,
-4.147443, -4.408144, -4, 0, 1.5, 0.5, 0.5,
-4.147443, -4.408144, -2, 0, -0.5, 0.5, 0.5,
-4.147443, -4.408144, -2, 1, -0.5, 0.5, 0.5,
-4.147443, -4.408144, -2, 1, 1.5, 0.5, 0.5,
-4.147443, -4.408144, -2, 0, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 0, 0, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 0, 1, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 0, 1, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 0, 0, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 2, 0, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 2, 1, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 2, 1, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 2, 0, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 4, 0, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 4, 1, -0.5, 0.5, 0.5,
-4.147443, -4.408144, 4, 1, 1.5, 0.5, 0.5,
-4.147443, -4.408144, 4, 0, 1.5, 0.5, 0.5
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
-3.614531, -3.876391, -4.791419,
-3.614531, 3.213658, -4.791419,
-3.614531, -3.876391, 5.153415,
-3.614531, 3.213658, 5.153415,
-3.614531, -3.876391, -4.791419,
-3.614531, -3.876391, 5.153415,
-3.614531, 3.213658, -4.791419,
-3.614531, 3.213658, 5.153415,
-3.614531, -3.876391, -4.791419,
3.490959, -3.876391, -4.791419,
-3.614531, -3.876391, 5.153415,
3.490959, -3.876391, 5.153415,
-3.614531, 3.213658, -4.791419,
3.490959, 3.213658, -4.791419,
-3.614531, 3.213658, 5.153415,
3.490959, 3.213658, 5.153415,
3.490959, -3.876391, -4.791419,
3.490959, 3.213658, -4.791419,
3.490959, -3.876391, 5.153415,
3.490959, 3.213658, 5.153415,
3.490959, -3.876391, -4.791419,
3.490959, -3.876391, 5.153415,
3.490959, 3.213658, -4.791419,
3.490959, 3.213658, 5.153415
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
var radius = 7.545138;
var distance = 33.56917;
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
mvMatrix.translate( 0.06178606, 0.3313665, -0.1809978 );
mvMatrix.scale( 1.148119, 1.15062, 0.8203205 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56917);
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
drazoxolon<-read.table("drazoxolon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-drazoxolon$V2
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
```

```r
y<-drazoxolon$V3
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
```

```r
z<-drazoxolon$V4
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
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
-3.511053, 0.3830458, -1.833238, 0, 0, 1, 1, 1,
-2.873369, 0.9034815, -1.257974, 1, 0, 0, 1, 1,
-2.860122, -0.5575611, -2.486699, 1, 0, 0, 1, 1,
-2.753087, 0.5291508, -1.15367, 1, 0, 0, 1, 1,
-2.70437, -0.4728888, -2.686416, 1, 0, 0, 1, 1,
-2.678488, -0.6227564, -3.29804, 1, 0, 0, 1, 1,
-2.659966, -1.321509, -0.831557, 0, 0, 0, 1, 1,
-2.596434, 1.8954, 0.2436187, 0, 0, 0, 1, 1,
-2.594476, -1.218062, -1.356886, 0, 0, 0, 1, 1,
-2.468911, -1.364705, -2.055116, 0, 0, 0, 1, 1,
-2.441277, 1.116137, -2.071705, 0, 0, 0, 1, 1,
-2.372963, 1.05157, -0.5013259, 0, 0, 0, 1, 1,
-2.352585, -0.8717809, -1.613405, 0, 0, 0, 1, 1,
-2.273005, 1.154317, -1.804963, 1, 1, 1, 1, 1,
-2.268438, -1.153927, -2.437616, 1, 1, 1, 1, 1,
-2.222185, 0.1928718, -3.906755, 1, 1, 1, 1, 1,
-2.213226, 0.07258692, -1.404843, 1, 1, 1, 1, 1,
-2.178449, 0.4566347, -3.179406, 1, 1, 1, 1, 1,
-2.164201, 1.368867, -0.3207812, 1, 1, 1, 1, 1,
-2.143282, 0.8008869, -1.254726, 1, 1, 1, 1, 1,
-2.115153, -0.6029242, -3.751985, 1, 1, 1, 1, 1,
-2.084235, 0.4734997, -0.4014556, 1, 1, 1, 1, 1,
-2.079846, 0.06708294, -1.739058, 1, 1, 1, 1, 1,
-2.068583, 1.265908, -1.903549, 1, 1, 1, 1, 1,
-2.049355, 1.250196, -0.9360279, 1, 1, 1, 1, 1,
-2.047086, 1.779117, -0.5945957, 1, 1, 1, 1, 1,
-2.010462, 1.527661, -1.646784, 1, 1, 1, 1, 1,
-1.993751, 0.2088853, -1.085674, 1, 1, 1, 1, 1,
-1.976586, -1.386826, -0.8749941, 0, 0, 1, 1, 1,
-1.969191, 1.952892, -0.09991477, 1, 0, 0, 1, 1,
-1.950514, -0.1402369, 0.5731567, 1, 0, 0, 1, 1,
-1.933862, 0.1272109, -1.482819, 1, 0, 0, 1, 1,
-1.904435, 0.5464945, -1.176187, 1, 0, 0, 1, 1,
-1.904276, -0.536576, -1.321499, 1, 0, 0, 1, 1,
-1.852541, 0.2664326, -0.3252368, 0, 0, 0, 1, 1,
-1.825716, 0.7171562, -0.9897839, 0, 0, 0, 1, 1,
-1.825692, 0.6394048, -2.949355, 0, 0, 0, 1, 1,
-1.820121, 0.3031552, -0.4382682, 0, 0, 0, 1, 1,
-1.809117, 1.196445, -1.402327, 0, 0, 0, 1, 1,
-1.80599, 0.06675143, -1.296763, 0, 0, 0, 1, 1,
-1.794955, 0.9269692, -0.87014, 0, 0, 0, 1, 1,
-1.787894, -0.3518264, -2.608964, 1, 1, 1, 1, 1,
-1.783198, 0.1355019, -2.032358, 1, 1, 1, 1, 1,
-1.778819, 0.7200782, -0.1816685, 1, 1, 1, 1, 1,
-1.677324, -0.3330579, -1.781488, 1, 1, 1, 1, 1,
-1.674907, 1.215483, -1.301072, 1, 1, 1, 1, 1,
-1.670782, 1.72503, -0.4681785, 1, 1, 1, 1, 1,
-1.664304, 1.783246, 1.007624, 1, 1, 1, 1, 1,
-1.664096, -0.9249201, -2.775507, 1, 1, 1, 1, 1,
-1.661587, -0.7107567, -3.591305, 1, 1, 1, 1, 1,
-1.656254, -0.03628536, -2.725759, 1, 1, 1, 1, 1,
-1.649001, 0.2174825, -0.2583545, 1, 1, 1, 1, 1,
-1.647019, 0.4125901, -1.024598, 1, 1, 1, 1, 1,
-1.625498, -1.206562, -2.076693, 1, 1, 1, 1, 1,
-1.60929, 0.4799055, -1.766412, 1, 1, 1, 1, 1,
-1.604926, 0.583706, -1.739815, 1, 1, 1, 1, 1,
-1.585924, 0.003164007, -2.100793, 0, 0, 1, 1, 1,
-1.585011, -1.015141, -2.692006, 1, 0, 0, 1, 1,
-1.578703, 1.71335, -1.659195, 1, 0, 0, 1, 1,
-1.570258, 0.4033581, -2.12647, 1, 0, 0, 1, 1,
-1.56286, 0.9627591, 0.3537631, 1, 0, 0, 1, 1,
-1.562759, -0.2755941, -0.9825606, 1, 0, 0, 1, 1,
-1.562584, 0.7960691, -1.638286, 0, 0, 0, 1, 1,
-1.55538, 0.3329048, -1.237376, 0, 0, 0, 1, 1,
-1.548583, -0.2347648, -1.680346, 0, 0, 0, 1, 1,
-1.539532, -0.4418821, -3.290395, 0, 0, 0, 1, 1,
-1.532213, 0.3642327, -1.391488, 0, 0, 0, 1, 1,
-1.52512, -0.4775809, -2.945611, 0, 0, 0, 1, 1,
-1.512482, -0.5294781, -1.97032, 0, 0, 0, 1, 1,
-1.508837, 0.4385735, 0.1188842, 1, 1, 1, 1, 1,
-1.501889, 0.4479213, -1.30257, 1, 1, 1, 1, 1,
-1.497517, 2.09536, -1.077581, 1, 1, 1, 1, 1,
-1.486072, 0.3792824, -2.541872, 1, 1, 1, 1, 1,
-1.482238, -0.6430659, -2.608825, 1, 1, 1, 1, 1,
-1.481308, -0.7915881, -0.2016499, 1, 1, 1, 1, 1,
-1.472468, 0.1873876, -1.594112, 1, 1, 1, 1, 1,
-1.440759, -0.722735, -1.158194, 1, 1, 1, 1, 1,
-1.418204, -2.115809, -1.607919, 1, 1, 1, 1, 1,
-1.396875, 0.4852218, -0.9007467, 1, 1, 1, 1, 1,
-1.37949, -0.2623992, -0.08889345, 1, 1, 1, 1, 1,
-1.377764, -0.9917381, -1.740631, 1, 1, 1, 1, 1,
-1.376255, -1.482856, -3.938018, 1, 1, 1, 1, 1,
-1.357349, -0.3222798, -1.744015, 1, 1, 1, 1, 1,
-1.348021, -0.4429227, -1.639153, 1, 1, 1, 1, 1,
-1.346423, 0.5440206, 0.171588, 0, 0, 1, 1, 1,
-1.34532, 0.7925642, -1.723355, 1, 0, 0, 1, 1,
-1.344247, -2.024508, -1.071805, 1, 0, 0, 1, 1,
-1.340346, -0.7480609, -1.117131, 1, 0, 0, 1, 1,
-1.339091, -0.7240676, -3.614591, 1, 0, 0, 1, 1,
-1.330529, 0.1503422, -1.702719, 1, 0, 0, 1, 1,
-1.323119, 1.173378, 0.3444107, 0, 0, 0, 1, 1,
-1.319768, -1.133638, -2.700533, 0, 0, 0, 1, 1,
-1.316, 0.3833913, -2.155017, 0, 0, 0, 1, 1,
-1.31484, 0.06666987, -3.943632, 0, 0, 0, 1, 1,
-1.311842, 1.060957, 0.9840162, 0, 0, 0, 1, 1,
-1.307525, -0.3989013, 0.4127578, 0, 0, 0, 1, 1,
-1.306576, -1.033344, -1.814706, 0, 0, 0, 1, 1,
-1.30624, -0.512022, -0.6428999, 1, 1, 1, 1, 1,
-1.305456, 0.229592, -1.140102, 1, 1, 1, 1, 1,
-1.299979, 0.1654498, -2.628358, 1, 1, 1, 1, 1,
-1.292816, -2.127532, -2.970155, 1, 1, 1, 1, 1,
-1.291288, -0.1274784, -3.348993, 1, 1, 1, 1, 1,
-1.29014, 1.055916, -1.410311, 1, 1, 1, 1, 1,
-1.280376, 0.09498204, -0.7792457, 1, 1, 1, 1, 1,
-1.271299, -1.847341, -2.052242, 1, 1, 1, 1, 1,
-1.268438, 0.7054971, -2.881915, 1, 1, 1, 1, 1,
-1.267141, 1.15458, -1.756706, 1, 1, 1, 1, 1,
-1.266294, 0.2635053, -0.893261, 1, 1, 1, 1, 1,
-1.256703, -0.009088757, -2.347184, 1, 1, 1, 1, 1,
-1.255735, 0.8342859, 1.092447, 1, 1, 1, 1, 1,
-1.25369, 1.201804, -1.544837, 1, 1, 1, 1, 1,
-1.247014, 0.4603527, -1.824818, 1, 1, 1, 1, 1,
-1.243937, -1.133354, -2.566434, 0, 0, 1, 1, 1,
-1.239258, -0.9621406, -1.478377, 1, 0, 0, 1, 1,
-1.236122, 0.3127778, -2.059879, 1, 0, 0, 1, 1,
-1.232699, -0.5138402, -1.857297, 1, 0, 0, 1, 1,
-1.232226, -0.5271457, -3.308135, 1, 0, 0, 1, 1,
-1.230415, 0.9650779, -0.5798172, 1, 0, 0, 1, 1,
-1.230318, -1.256664, -2.565753, 0, 0, 0, 1, 1,
-1.229476, -2.524964, -3.434886, 0, 0, 0, 1, 1,
-1.229133, -0.5365495, -1.748827, 0, 0, 0, 1, 1,
-1.227361, 0.4990934, -1.349353, 0, 0, 0, 1, 1,
-1.217137, 0.004822158, -2.06286, 0, 0, 0, 1, 1,
-1.213312, -0.5215336, -0.5287788, 0, 0, 0, 1, 1,
-1.209147, 1.312847, 1.171843, 0, 0, 0, 1, 1,
-1.206735, 1.13733, 0.6236734, 1, 1, 1, 1, 1,
-1.204425, -1.845238, -3.721516, 1, 1, 1, 1, 1,
-1.204343, -0.8837234, -0.4779876, 1, 1, 1, 1, 1,
-1.169997, -1.030034, -3.284613, 1, 1, 1, 1, 1,
-1.164383, -0.7252712, -2.523329, 1, 1, 1, 1, 1,
-1.158254, 1.565171, -1.261058, 1, 1, 1, 1, 1,
-1.152695, -0.06694575, 0.4271918, 1, 1, 1, 1, 1,
-1.142955, -1.21093, -3.398339, 1, 1, 1, 1, 1,
-1.140649, 0.5839373, -3.528767, 1, 1, 1, 1, 1,
-1.139107, -0.547268, -2.97723, 1, 1, 1, 1, 1,
-1.131429, 1.529581, -0.4748438, 1, 1, 1, 1, 1,
-1.12365, -0.5688213, -2.814888, 1, 1, 1, 1, 1,
-1.108722, -0.0976647, -0.8620954, 1, 1, 1, 1, 1,
-1.100549, 0.3907568, -2.289717, 1, 1, 1, 1, 1,
-1.097285, -0.6357617, -1.315615, 1, 1, 1, 1, 1,
-1.091486, -0.3037908, -2.200435, 0, 0, 1, 1, 1,
-1.089538, 0.4515364, -1.56704, 1, 0, 0, 1, 1,
-1.084325, -1.245519, -2.414873, 1, 0, 0, 1, 1,
-1.076015, 0.9706913, 0.3419511, 1, 0, 0, 1, 1,
-1.06964, -0.4472298, -2.138263, 1, 0, 0, 1, 1,
-1.06939, -1.18532, -2.079492, 1, 0, 0, 1, 1,
-1.066383, -0.400059, -2.703897, 0, 0, 0, 1, 1,
-1.060546, 1.36687, -0.117581, 0, 0, 0, 1, 1,
-1.055292, -0.8615228, -1.947885, 0, 0, 0, 1, 1,
-1.047649, 1.27678, -3.567969, 0, 0, 0, 1, 1,
-1.036008, -0.7060532, -1.714031, 0, 0, 0, 1, 1,
-1.03392, 0.9456975, 0.4992245, 0, 0, 0, 1, 1,
-1.032995, -1.880053, -2.54958, 0, 0, 0, 1, 1,
-1.022247, -1.038239, -3.898057, 1, 1, 1, 1, 1,
-1.020708, -0.5572428, -3.181629, 1, 1, 1, 1, 1,
-1.013981, -0.892114, -0.8120571, 1, 1, 1, 1, 1,
-1.011218, 0.6447398, -0.2456181, 1, 1, 1, 1, 1,
-1.00811, 0.3127223, -1.410488, 1, 1, 1, 1, 1,
-1.007597, -0.3462686, -0.5558631, 1, 1, 1, 1, 1,
-1.007361, -2.072597, -2.84952, 1, 1, 1, 1, 1,
-1.00588, -0.8470045, -1.798933, 1, 1, 1, 1, 1,
-0.9998315, -0.7042902, -1.024863, 1, 1, 1, 1, 1,
-0.9998265, -0.3809331, -2.3825, 1, 1, 1, 1, 1,
-0.9991761, -0.08269421, -1.15913, 1, 1, 1, 1, 1,
-0.9972832, 0.3727705, -1.81014, 1, 1, 1, 1, 1,
-0.9961427, 1.208774, -1.389844, 1, 1, 1, 1, 1,
-0.9924633, -1.21682, -3.587924, 1, 1, 1, 1, 1,
-0.9851552, 0.6367989, -2.087991, 1, 1, 1, 1, 1,
-0.9808171, 2.05147, -1.521971, 0, 0, 1, 1, 1,
-0.9784609, -0.812344, -0.5114244, 1, 0, 0, 1, 1,
-0.9702342, 0.3609057, -3.800513, 1, 0, 0, 1, 1,
-0.9636498, -0.366355, -2.357923, 1, 0, 0, 1, 1,
-0.963414, 0.9914292, 0.002720806, 1, 0, 0, 1, 1,
-0.9617156, -0.3339871, -1.268247, 1, 0, 0, 1, 1,
-0.9530088, -0.176185, -0.802506, 0, 0, 0, 1, 1,
-0.9451926, 0.6881315, -0.3684922, 0, 0, 0, 1, 1,
-0.9446753, 0.6384174, 0.8940123, 0, 0, 0, 1, 1,
-0.9433161, -1.063592, -3.361204, 0, 0, 0, 1, 1,
-0.9431936, 0.09111371, -0.6923789, 0, 0, 0, 1, 1,
-0.9378335, -0.4903192, -2.674141, 0, 0, 0, 1, 1,
-0.9318773, -0.1527586, -1.384632, 0, 0, 0, 1, 1,
-0.9012164, -0.09721561, -2.123958, 1, 1, 1, 1, 1,
-0.8995819, 0.1279186, -1.555895, 1, 1, 1, 1, 1,
-0.8979362, -0.5595521, -2.894854, 1, 1, 1, 1, 1,
-0.8962255, -1.164688, -3.907892, 1, 1, 1, 1, 1,
-0.8910308, 0.9934258, -1.837435, 1, 1, 1, 1, 1,
-0.8795288, 0.202586, -1.093347, 1, 1, 1, 1, 1,
-0.8750473, -0.8006199, -0.2044424, 1, 1, 1, 1, 1,
-0.8695257, 0.1151152, -1.57557, 1, 1, 1, 1, 1,
-0.8674685, -1.036653, -1.670843, 1, 1, 1, 1, 1,
-0.8585508, 1.145382, 0.5735627, 1, 1, 1, 1, 1,
-0.8538502, 0.6221953, -1.288038, 1, 1, 1, 1, 1,
-0.8536609, 0.9110962, -1.374808, 1, 1, 1, 1, 1,
-0.8515007, 1.352279, -1.406949, 1, 1, 1, 1, 1,
-0.850287, 1.425243, 0.180739, 1, 1, 1, 1, 1,
-0.8467941, 0.8646007, 0.1645892, 1, 1, 1, 1, 1,
-0.844763, 0.06378258, -3.059656, 0, 0, 1, 1, 1,
-0.8438425, -0.4064144, -0.6551635, 1, 0, 0, 1, 1,
-0.8420373, -2.173449, -3.404355, 1, 0, 0, 1, 1,
-0.8419165, -0.4036253, -1.896897, 1, 0, 0, 1, 1,
-0.8404435, 0.09223828, -2.295988, 1, 0, 0, 1, 1,
-0.8360336, -0.1073245, -1.053985, 1, 0, 0, 1, 1,
-0.8353363, 0.4199074, -1.614151, 0, 0, 0, 1, 1,
-0.8302545, -0.3711729, -3.413615, 0, 0, 0, 1, 1,
-0.8244376, 2.05359, -2.423934, 0, 0, 0, 1, 1,
-0.821104, 0.7846956, -0.7451272, 0, 0, 0, 1, 1,
-0.8179249, -0.02680953, -2.650541, 0, 0, 0, 1, 1,
-0.8131523, -1.359385, -1.184384, 0, 0, 0, 1, 1,
-0.802887, 1.578344, 0.359432, 0, 0, 0, 1, 1,
-0.7952853, 0.2584009, -0.02203496, 1, 1, 1, 1, 1,
-0.7949939, 0.3169079, 0.1920231, 1, 1, 1, 1, 1,
-0.785273, 0.4249442, -0.9181774, 1, 1, 1, 1, 1,
-0.7792828, 1.574418, 0.1942192, 1, 1, 1, 1, 1,
-0.7616059, -2.123623, -2.585005, 1, 1, 1, 1, 1,
-0.7605444, -1.200076, -2.046005, 1, 1, 1, 1, 1,
-0.7600768, -0.1702826, -1.166329, 1, 1, 1, 1, 1,
-0.7590555, -0.7077245, -2.560646, 1, 1, 1, 1, 1,
-0.7531363, -0.4497425, -1.977296, 1, 1, 1, 1, 1,
-0.7472422, 1.646218, -0.2192656, 1, 1, 1, 1, 1,
-0.7443756, -1.070883, -1.981207, 1, 1, 1, 1, 1,
-0.7382111, -0.6830762, -3.190241, 1, 1, 1, 1, 1,
-0.7370169, -0.4171678, -3.364718, 1, 1, 1, 1, 1,
-0.7347541, 1.492892, 0.853877, 1, 1, 1, 1, 1,
-0.7333021, 0.5505808, -1.743473, 1, 1, 1, 1, 1,
-0.7239857, -0.5909652, -1.127161, 0, 0, 1, 1, 1,
-0.7230852, 0.8128351, -0.7325253, 1, 0, 0, 1, 1,
-0.7208202, 0.03367752, -2.028114, 1, 0, 0, 1, 1,
-0.7194631, -0.7515383, -2.318359, 1, 0, 0, 1, 1,
-0.7118272, -0.1620589, -3.933025, 1, 0, 0, 1, 1,
-0.71141, -1.733173, -2.15401, 1, 0, 0, 1, 1,
-0.7060351, -0.8080522, -1.239522, 0, 0, 0, 1, 1,
-0.6986536, 1.539448, 0.4295011, 0, 0, 0, 1, 1,
-0.6947191, -0.8569376, -3.260609, 0, 0, 0, 1, 1,
-0.6933106, -0.8036283, -1.690609, 0, 0, 0, 1, 1,
-0.6893064, 0.1176753, -1.157067, 0, 0, 0, 1, 1,
-0.688662, 0.05663788, -1.259638, 0, 0, 0, 1, 1,
-0.6860906, -1.057451, -1.880217, 0, 0, 0, 1, 1,
-0.6836252, -0.5387166, -3.253173, 1, 1, 1, 1, 1,
-0.6808742, 0.2054353, -1.645279, 1, 1, 1, 1, 1,
-0.6803796, -1.203926, -0.3404987, 1, 1, 1, 1, 1,
-0.6792475, -0.1118141, -1.670483, 1, 1, 1, 1, 1,
-0.6746464, 0.5785836, -0.2788891, 1, 1, 1, 1, 1,
-0.6704174, -0.4332452, -2.595284, 1, 1, 1, 1, 1,
-0.6673582, -0.0929665, -1.687756, 1, 1, 1, 1, 1,
-0.6665272, 0.4701287, -0.5585427, 1, 1, 1, 1, 1,
-0.666236, -0.1406323, -0.8568442, 1, 1, 1, 1, 1,
-0.6653878, 0.6531321, -0.9947753, 1, 1, 1, 1, 1,
-0.6645997, 0.3648006, -0.6357913, 1, 1, 1, 1, 1,
-0.6602501, 0.314269, -0.8633787, 1, 1, 1, 1, 1,
-0.6600835, -0.5232185, -2.74511, 1, 1, 1, 1, 1,
-0.6599979, 2.225054, 0.5800977, 1, 1, 1, 1, 1,
-0.6587597, -0.5245526, -2.265387, 1, 1, 1, 1, 1,
-0.6554422, -1.477352, -2.544778, 0, 0, 1, 1, 1,
-0.6483341, -0.2139581, -1.666441, 1, 0, 0, 1, 1,
-0.6436969, 0.5934063, -0.6797711, 1, 0, 0, 1, 1,
-0.640155, -1.848301, -3.247642, 1, 0, 0, 1, 1,
-0.6380928, 0.6524544, 0.6595642, 1, 0, 0, 1, 1,
-0.6316969, -0.9339439, -2.492545, 1, 0, 0, 1, 1,
-0.6285859, 0.3860695, 0.6182399, 0, 0, 0, 1, 1,
-0.6207436, -1.422379, -2.287129, 0, 0, 0, 1, 1,
-0.6193113, 0.5985796, -0.8950716, 0, 0, 0, 1, 1,
-0.618798, -0.9535944, -2.506033, 0, 0, 0, 1, 1,
-0.6141571, 0.7401192, -0.9759297, 0, 0, 0, 1, 1,
-0.6103895, -0.6429339, -2.924443, 0, 0, 0, 1, 1,
-0.608771, 1.334884, -0.2298322, 0, 0, 0, 1, 1,
-0.6072617, -0.4598868, -4.030886, 1, 1, 1, 1, 1,
-0.6027389, -0.07672361, -0.4742235, 1, 1, 1, 1, 1,
-0.6013657, -0.1827697, -1.437348, 1, 1, 1, 1, 1,
-0.5912995, -0.1999833, -2.014807, 1, 1, 1, 1, 1,
-0.5872767, -1.489671, -3.494416, 1, 1, 1, 1, 1,
-0.5856816, -0.5646346, -2.135437, 1, 1, 1, 1, 1,
-0.5846183, -0.00982933, -1.362325, 1, 1, 1, 1, 1,
-0.5819103, -0.8433739, -3.804872, 1, 1, 1, 1, 1,
-0.5785053, 0.183962, -3.667954, 1, 1, 1, 1, 1,
-0.5772887, 0.4428372, -1.162261, 1, 1, 1, 1, 1,
-0.5767202, -0.3188333, -3.373988, 1, 1, 1, 1, 1,
-0.5726381, -0.1659139, -1.989087, 1, 1, 1, 1, 1,
-0.5709832, 0.2741578, -2.527664, 1, 1, 1, 1, 1,
-0.5677329, -0.4175081, -3.881254, 1, 1, 1, 1, 1,
-0.5667164, -0.06142304, -2.351024, 1, 1, 1, 1, 1,
-0.5662819, -1.174049, -2.887164, 0, 0, 1, 1, 1,
-0.5660495, -0.06390683, -1.692671, 1, 0, 0, 1, 1,
-0.5615364, 0.4484616, -2.499169, 1, 0, 0, 1, 1,
-0.5613557, 0.03067378, -2.142858, 1, 0, 0, 1, 1,
-0.5590614, -1.437549, -1.983033, 1, 0, 0, 1, 1,
-0.5558335, 0.01665894, -1.737916, 1, 0, 0, 1, 1,
-0.553334, 1.019719, -0.7801392, 0, 0, 0, 1, 1,
-0.5494083, 1.497988, -0.08647583, 0, 0, 0, 1, 1,
-0.5485671, 1.254084, -2.365149, 0, 0, 0, 1, 1,
-0.5440944, -0.7511791, -1.538499, 0, 0, 0, 1, 1,
-0.5427898, 1.824014, -0.8262447, 0, 0, 0, 1, 1,
-0.5424597, 0.8709565, 1.530827, 0, 0, 0, 1, 1,
-0.5420667, -0.9388003, -1.7451, 0, 0, 0, 1, 1,
-0.53149, 0.140736, -0.9516611, 1, 1, 1, 1, 1,
-0.5260757, 1.074485, 0.6992301, 1, 1, 1, 1, 1,
-0.525079, -0.2715669, -2.859591, 1, 1, 1, 1, 1,
-0.5234084, -0.3119963, -3.1145, 1, 1, 1, 1, 1,
-0.52269, 0.703086, 0.09957707, 1, 1, 1, 1, 1,
-0.5221758, 0.7070429, 1.178359, 1, 1, 1, 1, 1,
-0.5218152, -0.1593139, -1.867976, 1, 1, 1, 1, 1,
-0.5169767, 1.183079, -0.07965743, 1, 1, 1, 1, 1,
-0.5142631, 1.463207, 0.8345131, 1, 1, 1, 1, 1,
-0.5115367, -0.2907826, -0.7266431, 1, 1, 1, 1, 1,
-0.5079656, -0.6256784, -3.773389, 1, 1, 1, 1, 1,
-0.500111, 0.1228155, -0.7762002, 1, 1, 1, 1, 1,
-0.4981049, 0.2345387, -1.021012, 1, 1, 1, 1, 1,
-0.4854626, -3.773138, -3.807021, 1, 1, 1, 1, 1,
-0.4846849, 0.125725, -1.151437, 1, 1, 1, 1, 1,
-0.4789854, 0.3560758, -1.345682, 0, 0, 1, 1, 1,
-0.4773103, 0.07501024, -1.930095, 1, 0, 0, 1, 1,
-0.4732696, -1.412212, -1.920695, 1, 0, 0, 1, 1,
-0.4697686, 0.7484704, -2.835481, 1, 0, 0, 1, 1,
-0.4669397, -0.5851877, -2.450339, 1, 0, 0, 1, 1,
-0.4647092, 0.006974516, 0.601953, 1, 0, 0, 1, 1,
-0.4640492, 0.531423, -0.3441346, 0, 0, 0, 1, 1,
-0.4637302, -0.6412215, -1.574664, 0, 0, 0, 1, 1,
-0.4561291, -0.9277092, -3.250532, 0, 0, 0, 1, 1,
-0.4552581, -0.1252777, -1.448348, 0, 0, 0, 1, 1,
-0.4536217, 0.06999501, -2.356666, 0, 0, 0, 1, 1,
-0.4464519, 0.390184, -0.3486624, 0, 0, 0, 1, 1,
-0.4421095, -0.3813615, -1.85298, 0, 0, 0, 1, 1,
-0.4398991, 0.1634801, -2.22584, 1, 1, 1, 1, 1,
-0.4392546, 0.6611975, -0.4877225, 1, 1, 1, 1, 1,
-0.4365942, -0.3870775, -3.479592, 1, 1, 1, 1, 1,
-0.433551, -0.8695039, -3.798905, 1, 1, 1, 1, 1,
-0.4304384, 1.287091, -0.3746724, 1, 1, 1, 1, 1,
-0.4292954, -1.138871, -2.916428, 1, 1, 1, 1, 1,
-0.4291832, -0.8409328, -1.844852, 1, 1, 1, 1, 1,
-0.4256895, 0.2754382, -1.14342, 1, 1, 1, 1, 1,
-0.4224231, -0.7407075, -3.747991, 1, 1, 1, 1, 1,
-0.4218579, 0.6675426, -0.1921449, 1, 1, 1, 1, 1,
-0.41704, 0.5427335, 0.001359278, 1, 1, 1, 1, 1,
-0.416466, -0.4777552, -3.664728, 1, 1, 1, 1, 1,
-0.4162981, -1.986343, -2.48886, 1, 1, 1, 1, 1,
-0.4152315, 0.04548398, -2.832378, 1, 1, 1, 1, 1,
-0.415022, -0.7691846, -1.409426, 1, 1, 1, 1, 1,
-0.411793, 0.4651979, -1.781558, 0, 0, 1, 1, 1,
-0.410523, 1.186963, -0.2535801, 1, 0, 0, 1, 1,
-0.4063416, 0.03589371, -2.750194, 1, 0, 0, 1, 1,
-0.4001703, -0.4100025, -1.980896, 1, 0, 0, 1, 1,
-0.3927033, -1.144758, -3.256508, 1, 0, 0, 1, 1,
-0.391249, 1.472502, -1.33938, 1, 0, 0, 1, 1,
-0.388444, 0.320737, -1.787425, 0, 0, 0, 1, 1,
-0.3876325, 0.2936327, 0.6224198, 0, 0, 0, 1, 1,
-0.382036, 2.103364, 0.4691696, 0, 0, 0, 1, 1,
-0.3746103, 1.107712, 0.1833251, 0, 0, 0, 1, 1,
-0.3744886, -1.893793, -3.720859, 0, 0, 0, 1, 1,
-0.3730536, -0.1827607, -1.553311, 0, 0, 0, 1, 1,
-0.3728195, -0.07741711, -2.946852, 0, 0, 0, 1, 1,
-0.3721459, -1.096616, -3.231987, 1, 1, 1, 1, 1,
-0.3699977, -0.6694471, -3.97337, 1, 1, 1, 1, 1,
-0.3680942, -0.02669323, -0.9832615, 1, 1, 1, 1, 1,
-0.3643318, 1.03279, -2.802083, 1, 1, 1, 1, 1,
-0.358624, 0.6063771, -1.424314, 1, 1, 1, 1, 1,
-0.3556432, 1.914993, 0.1798737, 1, 1, 1, 1, 1,
-0.3555381, -0.8282385, -0.3063827, 1, 1, 1, 1, 1,
-0.3544813, 0.4302058, -1.321667, 1, 1, 1, 1, 1,
-0.3542272, 0.9579336, -1.45921, 1, 1, 1, 1, 1,
-0.354173, 0.3651528, -0.8233833, 1, 1, 1, 1, 1,
-0.3488268, 1.162792, -0.9127299, 1, 1, 1, 1, 1,
-0.346496, 0.3627997, -1.823071, 1, 1, 1, 1, 1,
-0.3415893, -1.807961, -2.616717, 1, 1, 1, 1, 1,
-0.3357498, -0.586993, -3.336911, 1, 1, 1, 1, 1,
-0.3352651, -0.3596272, -1.503047, 1, 1, 1, 1, 1,
-0.3346453, 0.2894435, -1.650126, 0, 0, 1, 1, 1,
-0.333252, -0.04011704, -1.296159, 1, 0, 0, 1, 1,
-0.3294847, -0.235832, -3.095313, 1, 0, 0, 1, 1,
-0.3253134, 1.486959, -1.286832, 1, 0, 0, 1, 1,
-0.3239135, -1.264077, -3.58471, 1, 0, 0, 1, 1,
-0.3230106, -1.188414, -4.009181, 1, 0, 0, 1, 1,
-0.322892, -0.7242267, -1.719104, 0, 0, 0, 1, 1,
-0.3226126, -1.160823, -0.4232257, 0, 0, 0, 1, 1,
-0.3222288, -0.4806652, -2.672579, 0, 0, 0, 1, 1,
-0.3168287, 0.3935537, -0.4599684, 0, 0, 0, 1, 1,
-0.3088271, -0.9822963, -2.848255, 0, 0, 0, 1, 1,
-0.3053384, -1.972667, -3.210154, 0, 0, 0, 1, 1,
-0.3023066, 0.3088525, -1.894235, 0, 0, 0, 1, 1,
-0.3003399, 0.9243059, -0.04136428, 1, 1, 1, 1, 1,
-0.2984526, -0.4443067, -2.339545, 1, 1, 1, 1, 1,
-0.2937124, 0.3823015, -0.2618537, 1, 1, 1, 1, 1,
-0.2888222, 0.03913777, -0.3673196, 1, 1, 1, 1, 1,
-0.2878906, -0.8540644, -3.300363, 1, 1, 1, 1, 1,
-0.2856549, -1.558952, -1.837444, 1, 1, 1, 1, 1,
-0.2834189, 0.7212515, -0.2131639, 1, 1, 1, 1, 1,
-0.2798101, 1.873644, 0.3968227, 1, 1, 1, 1, 1,
-0.2758137, -0.07466924, -3.322399, 1, 1, 1, 1, 1,
-0.2640599, -0.4101582, -1.2471, 1, 1, 1, 1, 1,
-0.2619355, -0.04765929, -2.020061, 1, 1, 1, 1, 1,
-0.2609906, -0.3932686, -4.045307, 1, 1, 1, 1, 1,
-0.2601892, -0.4036903, -3.453392, 1, 1, 1, 1, 1,
-0.2597262, -0.3481223, -2.689194, 1, 1, 1, 1, 1,
-0.2570201, 1.838701, -0.9606399, 1, 1, 1, 1, 1,
-0.2558586, 2.168489, -0.1720147, 0, 0, 1, 1, 1,
-0.2538691, 1.405457, -1.08225, 1, 0, 0, 1, 1,
-0.2518823, 0.9573181, -2.279591, 1, 0, 0, 1, 1,
-0.24771, 1.007421, -0.1542308, 1, 0, 0, 1, 1,
-0.2399071, -0.6376845, -1.889371, 1, 0, 0, 1, 1,
-0.2369314, 0.09856706, -2.545228, 1, 0, 0, 1, 1,
-0.2299481, -0.3771002, -0.9239531, 0, 0, 0, 1, 1,
-0.2265374, 0.08433289, -1.745781, 0, 0, 0, 1, 1,
-0.2232111, -0.5303218, -2.264416, 0, 0, 0, 1, 1,
-0.2228606, 0.7202254, 0.7351506, 0, 0, 0, 1, 1,
-0.2210035, 0.3341778, 1.563214, 0, 0, 0, 1, 1,
-0.2170313, 1.253083, -0.9130778, 0, 0, 0, 1, 1,
-0.216236, 0.2703787, 0.3730158, 0, 0, 0, 1, 1,
-0.2158576, -0.06259254, -1.281955, 1, 1, 1, 1, 1,
-0.214478, 0.02611012, -0.5576012, 1, 1, 1, 1, 1,
-0.2121279, -0.08561267, -1.684008, 1, 1, 1, 1, 1,
-0.2114695, -1.167207, -3.829063, 1, 1, 1, 1, 1,
-0.2069389, 1.969818, 0.299092, 1, 1, 1, 1, 1,
-0.1899606, -1.020311, -2.880211, 1, 1, 1, 1, 1,
-0.1875842, 0.9188461, -1.767097, 1, 1, 1, 1, 1,
-0.1871009, 0.3146179, -0.5903225, 1, 1, 1, 1, 1,
-0.1866806, -0.3423414, -4.169919, 1, 1, 1, 1, 1,
-0.1855858, 1.193287, -1.000037, 1, 1, 1, 1, 1,
-0.1845585, -0.04722654, -3.846752, 1, 1, 1, 1, 1,
-0.1839598, -0.3280212, -3.694029, 1, 1, 1, 1, 1,
-0.1839514, 0.2410119, 0.2611033, 1, 1, 1, 1, 1,
-0.1803871, 0.5259683, -0.6971582, 1, 1, 1, 1, 1,
-0.1771417, 1.398521, 0.5947216, 1, 1, 1, 1, 1,
-0.1763916, -0.434487, -1.656813, 0, 0, 1, 1, 1,
-0.1715491, -0.1867504, -3.029586, 1, 0, 0, 1, 1,
-0.1701112, -1.090682, -4.045113, 1, 0, 0, 1, 1,
-0.1664709, 2.357909, -0.7078667, 1, 0, 0, 1, 1,
-0.1639103, 0.4372268, 0.04479359, 1, 0, 0, 1, 1,
-0.1625571, -0.0377847, -1.794546, 1, 0, 0, 1, 1,
-0.1607384, 0.9807909, 1.007003, 0, 0, 0, 1, 1,
-0.1580272, -0.8248554, -1.560511, 0, 0, 0, 1, 1,
-0.156722, -0.112467, -2.66202, 0, 0, 0, 1, 1,
-0.1564122, -1.053515, -2.767775, 0, 0, 0, 1, 1,
-0.1561571, 1.423632, -2.264027, 0, 0, 0, 1, 1,
-0.1560489, 0.007437113, -0.3005829, 0, 0, 0, 1, 1,
-0.1560227, 0.3699587, 0.1837056, 0, 0, 0, 1, 1,
-0.1559961, -0.18416, -0.3912184, 1, 1, 1, 1, 1,
-0.1554948, -0.514833, -2.47038, 1, 1, 1, 1, 1,
-0.1545749, 1.051659, 0.1012669, 1, 1, 1, 1, 1,
-0.1500589, -2.022459, -2.618844, 1, 1, 1, 1, 1,
-0.1474076, 1.488666, 0.08162599, 1, 1, 1, 1, 1,
-0.1422473, 1.71601, -0.5473335, 1, 1, 1, 1, 1,
-0.1350129, 1.021334, -0.3841921, 1, 1, 1, 1, 1,
-0.1294762, -0.6369277, -1.691312, 1, 1, 1, 1, 1,
-0.1288308, -1.279469, -3.666995, 1, 1, 1, 1, 1,
-0.1277046, 0.1828114, -1.813862, 1, 1, 1, 1, 1,
-0.1271039, -0.7979831, -2.337054, 1, 1, 1, 1, 1,
-0.1268242, -0.2926152, -1.58505, 1, 1, 1, 1, 1,
-0.1219313, 1.253379, -0.2267406, 1, 1, 1, 1, 1,
-0.1160437, -0.4093862, -2.910477, 1, 1, 1, 1, 1,
-0.1141074, -0.07144789, -1.929229, 1, 1, 1, 1, 1,
-0.1115474, 0.2665167, -0.819757, 0, 0, 1, 1, 1,
-0.1085727, -0.7278144, -3.187305, 1, 0, 0, 1, 1,
-0.1046418, 1.494653, -0.774447, 1, 0, 0, 1, 1,
-0.1014767, -0.6882304, -3.035117, 1, 0, 0, 1, 1,
-0.09423199, -0.6333956, -0.6562158, 1, 0, 0, 1, 1,
-0.09203275, 0.6458269, -0.308946, 1, 0, 0, 1, 1,
-0.08436621, -2.263921, -2.508586, 0, 0, 0, 1, 1,
-0.08254925, 1.092205, -0.4399329, 0, 0, 0, 1, 1,
-0.08098056, -0.5196024, -2.994202, 0, 0, 0, 1, 1,
-0.08051937, 0.1576974, 0.06162459, 0, 0, 0, 1, 1,
-0.0746678, 1.29499, 0.4453621, 0, 0, 0, 1, 1,
-0.07406566, -1.884789, -3.278932, 0, 0, 0, 1, 1,
-0.07301594, 0.1209719, -0.5103095, 0, 0, 0, 1, 1,
-0.06417815, -0.04376507, -0.3312273, 1, 1, 1, 1, 1,
-0.06280822, -0.4272643, -3.414984, 1, 1, 1, 1, 1,
-0.05896372, -0.2161831, -2.631512, 1, 1, 1, 1, 1,
-0.05715222, -1.483544, -1.589347, 1, 1, 1, 1, 1,
-0.05641998, -2.557066, -3.811983, 1, 1, 1, 1, 1,
-0.05601782, 0.6384801, 1.162716, 1, 1, 1, 1, 1,
-0.05189675, 0.120042, -1.782658, 1, 1, 1, 1, 1,
-0.04653582, 0.5225127, -1.379238, 1, 1, 1, 1, 1,
-0.04616896, 0.6584396, 0.7106416, 1, 1, 1, 1, 1,
-0.0461622, 0.6906243, 0.2658236, 1, 1, 1, 1, 1,
-0.04607011, 0.0410908, -0.8046236, 1, 1, 1, 1, 1,
-0.04557483, -0.02455289, -2.994568, 1, 1, 1, 1, 1,
-0.04517783, -0.8797761, -4.646591, 1, 1, 1, 1, 1,
-0.04359323, 2.278176, -1.216609, 1, 1, 1, 1, 1,
-0.04317253, -0.07241604, -2.647501, 1, 1, 1, 1, 1,
-0.04036488, -0.4571931, -3.256769, 0, 0, 1, 1, 1,
-0.03833018, -0.1164759, -2.148546, 1, 0, 0, 1, 1,
-0.03541382, 1.577673, -0.1065804, 1, 0, 0, 1, 1,
-0.03355405, -0.6237426, -0.675567, 1, 0, 0, 1, 1,
-0.03341457, 0.6588889, 2.459866, 1, 0, 0, 1, 1,
-0.03092053, -0.1572738, -3.802743, 1, 0, 0, 1, 1,
-0.02911713, -0.7020209, -4.062889, 0, 0, 0, 1, 1,
-0.0285397, -0.1863381, -4.092956, 0, 0, 0, 1, 1,
-0.023744, 0.5785338, -1.796625, 0, 0, 0, 1, 1,
-0.02074071, -0.572114, -4.224738, 0, 0, 0, 1, 1,
-0.01814229, -1.877734, -2.994642, 0, 0, 0, 1, 1,
-0.01665235, -0.5824464, -2.501083, 0, 0, 0, 1, 1,
-0.01357506, -0.07394048, -3.234468, 0, 0, 0, 1, 1,
-0.01121114, 0.3977376, -0.01825096, 1, 1, 1, 1, 1,
-0.009718777, -1.220983, -3.189823, 1, 1, 1, 1, 1,
-0.002108877, 0.4394248, -0.07273854, 1, 1, 1, 1, 1,
0.003005984, 0.3529293, 2.134175, 1, 1, 1, 1, 1,
0.006984976, -0.005914911, 2.638088, 1, 1, 1, 1, 1,
0.01114215, 0.7439901, -0.3502336, 1, 1, 1, 1, 1,
0.01231783, 0.8771589, -0.5350811, 1, 1, 1, 1, 1,
0.01316307, 0.9176679, 0.6760828, 1, 1, 1, 1, 1,
0.01428247, 0.1552402, -1.03318, 1, 1, 1, 1, 1,
0.01509124, 0.7174289, 1.117146, 1, 1, 1, 1, 1,
0.01663524, -0.5916541, 1.665985, 1, 1, 1, 1, 1,
0.02338265, -2.60444, 2.891139, 1, 1, 1, 1, 1,
0.03078182, -0.06680245, 3.265755, 1, 1, 1, 1, 1,
0.03229197, 0.2686127, -0.8058437, 1, 1, 1, 1, 1,
0.03613583, -0.2780471, 3.7079, 1, 1, 1, 1, 1,
0.03892203, 1.617376, 0.6746285, 0, 0, 1, 1, 1,
0.03944326, 1.101656, 0.5269136, 1, 0, 0, 1, 1,
0.03982243, -1.716713, 2.859108, 1, 0, 0, 1, 1,
0.04050937, -0.4992407, 2.350313, 1, 0, 0, 1, 1,
0.04648275, -0.8367948, 2.776158, 1, 0, 0, 1, 1,
0.04700982, 0.4366458, -0.96338, 1, 0, 0, 1, 1,
0.04875581, -0.5931231, 2.37979, 0, 0, 0, 1, 1,
0.04937555, 0.9631153, 0.002758326, 0, 0, 0, 1, 1,
0.05075337, 0.05374007, 1.462007, 0, 0, 0, 1, 1,
0.05246001, 1.716566, -0.6031106, 0, 0, 0, 1, 1,
0.05504717, -1.972123, 2.128763, 0, 0, 0, 1, 1,
0.05705606, 0.7183177, -1.068104, 0, 0, 0, 1, 1,
0.0574021, -0.06669629, 2.815386, 0, 0, 0, 1, 1,
0.05980146, 0.7358007, -0.02368491, 1, 1, 1, 1, 1,
0.06067177, 1.240548, 0.3642598, 1, 1, 1, 1, 1,
0.06310064, -2.099747, 3.109813, 1, 1, 1, 1, 1,
0.06317111, -1.295274, 2.483637, 1, 1, 1, 1, 1,
0.06397221, -0.5165839, 2.336021, 1, 1, 1, 1, 1,
0.06535833, -0.9977507, 1.877487, 1, 1, 1, 1, 1,
0.06657498, 0.2144551, 0.6143861, 1, 1, 1, 1, 1,
0.06683173, -1.814, 3.526565, 1, 1, 1, 1, 1,
0.07292499, -0.5419064, 4.436209, 1, 1, 1, 1, 1,
0.07313102, 0.6996, 0.4060875, 1, 1, 1, 1, 1,
0.07339608, 1.361209, 0.7221245, 1, 1, 1, 1, 1,
0.07650495, -0.5033666, 2.977065, 1, 1, 1, 1, 1,
0.07656184, -0.165611, 2.043447, 1, 1, 1, 1, 1,
0.07886761, 1.39606, -1.336265, 1, 1, 1, 1, 1,
0.07905025, 1.535848, -1.673302, 1, 1, 1, 1, 1,
0.08300682, -0.0441013, 2.320239, 0, 0, 1, 1, 1,
0.08477347, -3.018895, 4.683327, 1, 0, 0, 1, 1,
0.08643479, 0.730198, -1.1081, 1, 0, 0, 1, 1,
0.08928037, -1.202017, 2.70687, 1, 0, 0, 1, 1,
0.08934566, -0.08941098, 1.430746, 1, 0, 0, 1, 1,
0.09194079, -0.8284771, 4.184537, 1, 0, 0, 1, 1,
0.09427118, -0.4116481, 3.292896, 0, 0, 0, 1, 1,
0.09615392, 0.0624092, 0.9777125, 0, 0, 0, 1, 1,
0.09650317, -0.3402873, 3.102139, 0, 0, 0, 1, 1,
0.09725543, -0.1646242, 2.05221, 0, 0, 0, 1, 1,
0.0972909, 1.235456, 0.4800453, 0, 0, 0, 1, 1,
0.1003536, -1.081268, 5.008587, 0, 0, 0, 1, 1,
0.10214, 0.1326128, -2.262861, 0, 0, 0, 1, 1,
0.1021511, -0.3056256, 1.362305, 1, 1, 1, 1, 1,
0.1022123, 0.7159593, 1.267095, 1, 1, 1, 1, 1,
0.1042784, 0.8240407, 0.07059313, 1, 1, 1, 1, 1,
0.1049526, 0.7339499, 0.616686, 1, 1, 1, 1, 1,
0.1053357, -0.008371798, 1.244127, 1, 1, 1, 1, 1,
0.1053968, -1.177774, 2.599177, 1, 1, 1, 1, 1,
0.108258, -0.6351805, 2.221449, 1, 1, 1, 1, 1,
0.1094254, -0.3583369, 1.619745, 1, 1, 1, 1, 1,
0.1129943, 0.6215824, 0.6826673, 1, 1, 1, 1, 1,
0.1159063, 1.020661, 1.570879, 1, 1, 1, 1, 1,
0.1171711, 1.178313, 0.2115583, 1, 1, 1, 1, 1,
0.1271767, 0.7375476, 0.02155997, 1, 1, 1, 1, 1,
0.1299822, 0.4365654, -0.6414768, 1, 1, 1, 1, 1,
0.1302863, 0.7158714, -1.674412, 1, 1, 1, 1, 1,
0.1309232, 2.099601, 1.522632, 1, 1, 1, 1, 1,
0.1349447, 1.713892, 2.007512, 0, 0, 1, 1, 1,
0.1413248, -2.056345, 2.709254, 1, 0, 0, 1, 1,
0.1487057, 0.4258475, 0.9229959, 1, 0, 0, 1, 1,
0.1487148, -0.2559917, 3.791954, 1, 0, 0, 1, 1,
0.1552123, -0.4586694, 4.531267, 1, 0, 0, 1, 1,
0.1559728, -0.06745075, 2.303548, 1, 0, 0, 1, 1,
0.1562001, -0.4953597, 1.123331, 0, 0, 0, 1, 1,
0.1564746, -0.06679913, 3.148077, 0, 0, 0, 1, 1,
0.1583273, -1.306379, 4.553514, 0, 0, 0, 1, 1,
0.1594175, -1.291514, 2.903957, 0, 0, 0, 1, 1,
0.1596968, 0.811667, -1.216509, 0, 0, 0, 1, 1,
0.1636311, 1.016701, 1.279677, 0, 0, 0, 1, 1,
0.1645092, -0.1964908, 2.5267, 0, 0, 0, 1, 1,
0.1654754, -0.4498349, 3.986179, 1, 1, 1, 1, 1,
0.1664857, -1.339407, 4.410776, 1, 1, 1, 1, 1,
0.1687621, -0.9693781, 1.856688, 1, 1, 1, 1, 1,
0.1780492, 0.4502713, 0.5998383, 1, 1, 1, 1, 1,
0.180993, 0.2589779, 0.3125354, 1, 1, 1, 1, 1,
0.1822142, 1.565453, 1.301066, 1, 1, 1, 1, 1,
0.1829077, 0.4075989, 0.1611918, 1, 1, 1, 1, 1,
0.184523, -0.7615591, 3.156176, 1, 1, 1, 1, 1,
0.1851255, -0.9857287, 3.59539, 1, 1, 1, 1, 1,
0.1865976, -0.09107038, 2.013098, 1, 1, 1, 1, 1,
0.1867383, 0.8520285, 0.7228035, 1, 1, 1, 1, 1,
0.1881065, -1.4376, 2.514919, 1, 1, 1, 1, 1,
0.1906714, -0.9300485, 2.941556, 1, 1, 1, 1, 1,
0.1943438, 0.4367457, 3.700343, 1, 1, 1, 1, 1,
0.1992306, 0.2284409, -0.01585524, 1, 1, 1, 1, 1,
0.2064482, 0.1074101, 0.3898863, 0, 0, 1, 1, 1,
0.2086601, -1.956421, 3.249653, 1, 0, 0, 1, 1,
0.210874, 1.02305, 2.125725, 1, 0, 0, 1, 1,
0.212776, 0.9272004, 0.4172348, 1, 0, 0, 1, 1,
0.2161644, -2.218154, 2.621658, 1, 0, 0, 1, 1,
0.2227673, 1.683528, -0.6131846, 1, 0, 0, 1, 1,
0.2238439, -0.21231, 3.569437, 0, 0, 0, 1, 1,
0.2280901, -0.3563524, 2.968827, 0, 0, 0, 1, 1,
0.2362196, 0.1317859, 0.8933743, 0, 0, 0, 1, 1,
0.2382798, 0.4222853, 0.7662158, 0, 0, 0, 1, 1,
0.239953, 1.89974, 1.151978, 0, 0, 0, 1, 1,
0.24597, 0.2378633, 3.641922, 0, 0, 0, 1, 1,
0.2463794, -0.02322655, 1.070422, 0, 0, 0, 1, 1,
0.2468784, -1.282015, 4.331307, 1, 1, 1, 1, 1,
0.2469636, 0.07422482, 0.1134694, 1, 1, 1, 1, 1,
0.2474314, 0.2893715, -0.4884135, 1, 1, 1, 1, 1,
0.2502602, 2.542806, 1.516256, 1, 1, 1, 1, 1,
0.2516238, 0.3649759, 1.349877, 1, 1, 1, 1, 1,
0.2524856, -0.04362645, 1.996921, 1, 1, 1, 1, 1,
0.2539747, 0.6737049, 0.2313285, 1, 1, 1, 1, 1,
0.2546165, 1.03462, 0.8554529, 1, 1, 1, 1, 1,
0.2582413, -0.04801043, 0.8723327, 1, 1, 1, 1, 1,
0.2595473, 0.7811757, -0.2616956, 1, 1, 1, 1, 1,
0.2596242, -0.03152942, 0.8290183, 1, 1, 1, 1, 1,
0.2606216, -0.2261464, 1.377297, 1, 1, 1, 1, 1,
0.2622316, -0.762319, 3.118158, 1, 1, 1, 1, 1,
0.2624881, -1.149934, 3.583625, 1, 1, 1, 1, 1,
0.2635069, -0.4134192, 2.902855, 1, 1, 1, 1, 1,
0.263691, -0.6044806, 3.067283, 0, 0, 1, 1, 1,
0.263895, -0.1569111, 1.219276, 1, 0, 0, 1, 1,
0.2656457, 0.7883677, 1.297226, 1, 0, 0, 1, 1,
0.2686992, 0.9907288, 0.02484204, 1, 0, 0, 1, 1,
0.270452, 0.7773152, 0.5454262, 1, 0, 0, 1, 1,
0.2713843, -0.331252, 3.742801, 1, 0, 0, 1, 1,
0.2757004, 0.5370538, -1.149581, 0, 0, 0, 1, 1,
0.2761802, 0.6250901, 1.40752, 0, 0, 0, 1, 1,
0.2787305, -0.2006942, 4.309347, 0, 0, 0, 1, 1,
0.2790752, 0.6231583, 1.37044, 0, 0, 0, 1, 1,
0.279526, 1.641396, -0.3478718, 0, 0, 0, 1, 1,
0.2796701, -0.7447615, 3.10833, 0, 0, 0, 1, 1,
0.281159, -1.867733, 3.745352, 0, 0, 0, 1, 1,
0.284963, -0.06263842, 3.91202, 1, 1, 1, 1, 1,
0.286375, 0.8707057, 0.657129, 1, 1, 1, 1, 1,
0.2878688, -0.6112927, 1.408171, 1, 1, 1, 1, 1,
0.2907631, -1.420744, 0.7738957, 1, 1, 1, 1, 1,
0.2964613, 1.286849, 0.822583, 1, 1, 1, 1, 1,
0.301586, -0.3188213, 4.188103, 1, 1, 1, 1, 1,
0.3047012, 0.7644706, -0.3065518, 1, 1, 1, 1, 1,
0.3050208, -1.12237, 1.420803, 1, 1, 1, 1, 1,
0.306004, 1.014732, 1.667921, 1, 1, 1, 1, 1,
0.3118168, -0.4749721, 1.755455, 1, 1, 1, 1, 1,
0.3138878, 0.8668329, 1.763243, 1, 1, 1, 1, 1,
0.3152282, 0.3911127, -1.006543, 1, 1, 1, 1, 1,
0.3182357, -0.5153885, 4.426016, 1, 1, 1, 1, 1,
0.322348, 1.705769, -1.206968, 1, 1, 1, 1, 1,
0.3230509, -0.117672, 1.538854, 1, 1, 1, 1, 1,
0.3237611, -0.516874, 4.0127, 0, 0, 1, 1, 1,
0.3293412, -0.1524445, 1.142093, 1, 0, 0, 1, 1,
0.3311793, 0.3761014, 1.818505, 1, 0, 0, 1, 1,
0.3343377, -2.160601, 2.759093, 1, 0, 0, 1, 1,
0.3380552, -1.525531, 2.146417, 1, 0, 0, 1, 1,
0.3434289, -1.152222, 3.284324, 1, 0, 0, 1, 1,
0.3462521, 0.6832126, -0.7887078, 0, 0, 0, 1, 1,
0.3572172, 1.022569, 2.138261, 0, 0, 0, 1, 1,
0.3599086, 1.20241, -0.5975059, 0, 0, 0, 1, 1,
0.3599388, -1.264301, 2.810013, 0, 0, 0, 1, 1,
0.3618835, -0.5525457, 2.530185, 0, 0, 0, 1, 1,
0.3646457, 0.5922296, 0.9585289, 0, 0, 0, 1, 1,
0.3681119, -1.042868, 3.326872, 0, 0, 0, 1, 1,
0.3692122, -0.7553311, 2.350848, 1, 1, 1, 1, 1,
0.3695566, 1.629091, 0.06145356, 1, 1, 1, 1, 1,
0.3717416, -0.1052232, 4.063755, 1, 1, 1, 1, 1,
0.3724566, 0.8169951, 0.7472564, 1, 1, 1, 1, 1,
0.3780639, 0.5069121, -0.5829054, 1, 1, 1, 1, 1,
0.3784435, -2.134488, 3.569482, 1, 1, 1, 1, 1,
0.3840279, 1.103374, 0.8972138, 1, 1, 1, 1, 1,
0.3848214, 1.989999, -0.7637094, 1, 1, 1, 1, 1,
0.3849754, 1.445432, -0.429132, 1, 1, 1, 1, 1,
0.3885831, 1.495503, -0.6359047, 1, 1, 1, 1, 1,
0.390865, 0.3634479, 0.2865478, 1, 1, 1, 1, 1,
0.392025, -0.07048257, 0.2763424, 1, 1, 1, 1, 1,
0.396229, 1.326713, -0.07737666, 1, 1, 1, 1, 1,
0.3969113, -1.193015, 1.505739, 1, 1, 1, 1, 1,
0.3991112, -0.425044, 3.919501, 1, 1, 1, 1, 1,
0.409782, -0.4231881, 1.264411, 0, 0, 1, 1, 1,
0.4172901, 0.3079017, -0.2255926, 1, 0, 0, 1, 1,
0.4230439, -1.197193, 4.598719, 1, 0, 0, 1, 1,
0.4242521, -0.889064, 3.510612, 1, 0, 0, 1, 1,
0.4245223, 0.06656586, 1.384116, 1, 0, 0, 1, 1,
0.4443019, 1.151989, 1.26312, 1, 0, 0, 1, 1,
0.4450345, -0.7250848, 1.332151, 0, 0, 0, 1, 1,
0.4455059, -0.4072321, 3.072532, 0, 0, 0, 1, 1,
0.445576, -0.9117939, 2.005879, 0, 0, 0, 1, 1,
0.4456749, 0.1007295, 0.6378027, 0, 0, 0, 1, 1,
0.4528703, -1.058596, 2.558138, 0, 0, 0, 1, 1,
0.4567954, -0.5018498, 1.909748, 0, 0, 0, 1, 1,
0.4601322, 0.4767444, 0.4799377, 0, 0, 0, 1, 1,
0.465059, 0.42647, 0.354208, 1, 1, 1, 1, 1,
0.4664882, 1.490184, -0.01398532, 1, 1, 1, 1, 1,
0.4674639, 0.03247634, 2.982506, 1, 1, 1, 1, 1,
0.4701732, 0.4268269, -0.09104235, 1, 1, 1, 1, 1,
0.4733706, -1.39162, 3.233418, 1, 1, 1, 1, 1,
0.4740797, -0.9170769, 2.165713, 1, 1, 1, 1, 1,
0.4779319, -0.5565177, 2.333656, 1, 1, 1, 1, 1,
0.4779843, 1.315554, 0.4390928, 1, 1, 1, 1, 1,
0.4855823, -0.1247207, -0.0828594, 1, 1, 1, 1, 1,
0.4877969, 0.3124502, 0.4967062, 1, 1, 1, 1, 1,
0.4929034, -1.765812, 4.024497, 1, 1, 1, 1, 1,
0.4932741, 0.7370092, 1.138827, 1, 1, 1, 1, 1,
0.4976911, 0.2422488, 1.270158, 1, 1, 1, 1, 1,
0.5017257, 0.6562812, -0.1315632, 1, 1, 1, 1, 1,
0.5058437, -0.1195692, 1.597462, 1, 1, 1, 1, 1,
0.5066792, -2.101909, 3.363477, 0, 0, 1, 1, 1,
0.510021, 0.8481476, 0.6877898, 1, 0, 0, 1, 1,
0.5146712, 0.4683383, 0.5548139, 1, 0, 0, 1, 1,
0.5239214, 0.7241763, 0.2230457, 1, 0, 0, 1, 1,
0.5344813, -0.5433155, 0.9699795, 1, 0, 0, 1, 1,
0.5349754, 2.16804, -1.581866, 1, 0, 0, 1, 1,
0.5350826, 3.017576, 0.3580239, 0, 0, 0, 1, 1,
0.53686, 1.066832, 3.303555, 0, 0, 0, 1, 1,
0.5403523, 0.2136654, 2.210141, 0, 0, 0, 1, 1,
0.5456383, -0.7645332, 4.519665, 0, 0, 0, 1, 1,
0.548814, -0.3555929, 1.761456, 0, 0, 0, 1, 1,
0.5494535, -2.247739, 0.8668278, 0, 0, 0, 1, 1,
0.5528004, 0.01122306, 1.245355, 0, 0, 0, 1, 1,
0.5544133, 1.39739, -1.138334, 1, 1, 1, 1, 1,
0.5556371, 1.41982, -0.7178224, 1, 1, 1, 1, 1,
0.5567198, -0.5389987, 2.766217, 1, 1, 1, 1, 1,
0.5698572, 0.09365004, 1.565559, 1, 1, 1, 1, 1,
0.5727965, 0.3595183, 2.251937, 1, 1, 1, 1, 1,
0.5766309, 0.6621372, 0.2536625, 1, 1, 1, 1, 1,
0.578912, -0.6322726, 0.881302, 1, 1, 1, 1, 1,
0.5789145, 0.1781257, 1.882171, 1, 1, 1, 1, 1,
0.5802517, 0.9055159, 2.792586, 1, 1, 1, 1, 1,
0.5821949, 0.6637875, 1.751958, 1, 1, 1, 1, 1,
0.5838854, 0.2808381, -0.4072894, 1, 1, 1, 1, 1,
0.5858762, 0.9861877, 2.025508, 1, 1, 1, 1, 1,
0.5861429, -0.8717259, 2.858025, 1, 1, 1, 1, 1,
0.588563, 0.3541857, 1.076072, 1, 1, 1, 1, 1,
0.5961081, 0.4354767, 1.806631, 1, 1, 1, 1, 1,
0.5967169, 0.02411454, 1.943618, 0, 0, 1, 1, 1,
0.5982563, 1.820596, -0.6089599, 1, 0, 0, 1, 1,
0.6034446, -0.2270932, 1.955764, 1, 0, 0, 1, 1,
0.6076829, -0.3684959, 3.27832, 1, 0, 0, 1, 1,
0.6133037, 0.9709931, 0.6610591, 1, 0, 0, 1, 1,
0.6151916, 0.1686584, 1.409526, 1, 0, 0, 1, 1,
0.6152495, 1.542226, 0.871693, 0, 0, 0, 1, 1,
0.6243901, -0.8175343, 2.522575, 0, 0, 0, 1, 1,
0.6284693, -0.5242747, 4.249702, 0, 0, 0, 1, 1,
0.6481056, -0.7507517, 2.197403, 0, 0, 0, 1, 1,
0.6483884, 1.12206, 0.3297773, 0, 0, 0, 1, 1,
0.6545362, 0.7254267, 0.1793815, 0, 0, 0, 1, 1,
0.6548595, -1.077764, 1.657647, 0, 0, 0, 1, 1,
0.6557598, 3.110405, 0.7951485, 1, 1, 1, 1, 1,
0.6590717, -3.072826, 3.347715, 1, 1, 1, 1, 1,
0.6640762, -1.607564, 1.354727, 1, 1, 1, 1, 1,
0.6668243, -0.4547033, 2.59636, 1, 1, 1, 1, 1,
0.6733917, 1.238402, 0.5101334, 1, 1, 1, 1, 1,
0.6768925, -0.5077336, 4.426354, 1, 1, 1, 1, 1,
0.6797605, 0.03641542, 2.228724, 1, 1, 1, 1, 1,
0.682161, -0.9668937, 3.636077, 1, 1, 1, 1, 1,
0.6837528, 0.3818652, 1.304073, 1, 1, 1, 1, 1,
0.6842259, -0.6433429, 2.322024, 1, 1, 1, 1, 1,
0.6872044, 0.2022465, 0.4590587, 1, 1, 1, 1, 1,
0.6880084, -0.8393705, 2.309842, 1, 1, 1, 1, 1,
0.688283, 1.027415, 0.5333982, 1, 1, 1, 1, 1,
0.6907629, -2.309529, 2.994894, 1, 1, 1, 1, 1,
0.6953155, -1.12324, 1.785558, 1, 1, 1, 1, 1,
0.7048712, -0.2235297, 3.298255, 0, 0, 1, 1, 1,
0.7079436, 0.002089534, 2.140115, 1, 0, 0, 1, 1,
0.7100293, 0.308631, 0.5902293, 1, 0, 0, 1, 1,
0.7116171, -0.8909239, 2.594065, 1, 0, 0, 1, 1,
0.7135265, -0.8774485, 2.475829, 1, 0, 0, 1, 1,
0.7203983, 0.4382454, 2.047148, 1, 0, 0, 1, 1,
0.727174, -0.2335494, 1.943004, 0, 0, 0, 1, 1,
0.73076, 0.2007267, 1.376966, 0, 0, 0, 1, 1,
0.7316441, -1.027099, 1.752579, 0, 0, 0, 1, 1,
0.7350055, -0.3466648, 1.483299, 0, 0, 0, 1, 1,
0.7366036, -0.2577518, 1.288683, 0, 0, 0, 1, 1,
0.7404559, -0.1890962, 0.7714261, 0, 0, 0, 1, 1,
0.7413461, -0.06694134, 2.742097, 0, 0, 0, 1, 1,
0.7421562, 0.1559877, 0.5273721, 1, 1, 1, 1, 1,
0.746041, -0.0598425, 2.056006, 1, 1, 1, 1, 1,
0.7475673, -0.8074187, 1.609738, 1, 1, 1, 1, 1,
0.7529098, -1.003767, 3.303569, 1, 1, 1, 1, 1,
0.7618738, -0.8074068, 2.144851, 1, 1, 1, 1, 1,
0.7636956, 2.778202, 0.3415422, 1, 1, 1, 1, 1,
0.7639585, 0.254009, 3.289924, 1, 1, 1, 1, 1,
0.7662682, 1.672649, -0.4889965, 1, 1, 1, 1, 1,
0.7689008, -0.06644257, 3.075807, 1, 1, 1, 1, 1,
0.7747224, 0.4043928, 0.0720159, 1, 1, 1, 1, 1,
0.7843805, 0.6873913, -0.1433928, 1, 1, 1, 1, 1,
0.7876933, -0.5609408, 1.849107, 1, 1, 1, 1, 1,
0.7886647, -0.241502, -0.3993641, 1, 1, 1, 1, 1,
0.796423, 2.339167, -0.6013231, 1, 1, 1, 1, 1,
0.8068093, -0.05472131, 1.027744, 1, 1, 1, 1, 1,
0.8123577, 1.162213, 0.6517721, 0, 0, 1, 1, 1,
0.8155726, 1.544611, -1.040772, 1, 0, 0, 1, 1,
0.817838, -0.8389953, 1.681397, 1, 0, 0, 1, 1,
0.8179647, 1.071495, -0.5599496, 1, 0, 0, 1, 1,
0.8184549, 0.1312537, 1.199443, 1, 0, 0, 1, 1,
0.818958, 0.4972658, -0.627822, 1, 0, 0, 1, 1,
0.8210933, -0.1414752, 0.6030672, 0, 0, 0, 1, 1,
0.822807, 0.3264029, 0.1352445, 0, 0, 0, 1, 1,
0.8251563, 0.04749713, 1.122353, 0, 0, 0, 1, 1,
0.8294731, 0.4813113, 0.8438829, 0, 0, 0, 1, 1,
0.8322791, -0.8486052, 4.894723, 0, 0, 0, 1, 1,
0.8345945, 0.591449, 1.342363, 0, 0, 0, 1, 1,
0.8405403, -1.475191, 3.545246, 0, 0, 0, 1, 1,
0.8426126, 1.661934, 1.121631, 1, 1, 1, 1, 1,
0.8435367, -1.02893, 1.309946, 1, 1, 1, 1, 1,
0.8477726, 0.5184893, 0.5345576, 1, 1, 1, 1, 1,
0.8594486, -0.3976236, 1.434152, 1, 1, 1, 1, 1,
0.8653088, -0.09604523, 1.264245, 1, 1, 1, 1, 1,
0.8659196, -2.068245, 0.3960589, 1, 1, 1, 1, 1,
0.8703659, -0.8519574, 2.544173, 1, 1, 1, 1, 1,
0.8707445, -0.3254785, 1.875036, 1, 1, 1, 1, 1,
0.8728957, 1.133959, 0.6985616, 1, 1, 1, 1, 1,
0.8740583, -0.1306924, 1.895798, 1, 1, 1, 1, 1,
0.8780523, -1.373699, 3.064825, 1, 1, 1, 1, 1,
0.8789391, 0.1035603, 1.27534, 1, 1, 1, 1, 1,
0.8796946, 0.1593148, 1.761901, 1, 1, 1, 1, 1,
0.8817247, -1.03639, 2.411142, 1, 1, 1, 1, 1,
0.8824338, -0.4557895, 2.116456, 1, 1, 1, 1, 1,
0.8835766, -0.6223723, 3.100631, 0, 0, 1, 1, 1,
0.8930156, -0.7445058, 3.28445, 1, 0, 0, 1, 1,
0.9016246, -2.024561, 0.5825166, 1, 0, 0, 1, 1,
0.9104561, -0.4902382, 0.1529271, 1, 0, 0, 1, 1,
0.9120508, 0.1126965, 2.648185, 1, 0, 0, 1, 1,
0.9177826, 0.4368458, 0.790316, 1, 0, 0, 1, 1,
0.9204584, 0.03647535, 0.05030511, 0, 0, 0, 1, 1,
0.9251456, 0.07389101, 0.6216065, 0, 0, 0, 1, 1,
0.9292549, 0.1120752, 2.363636, 0, 0, 0, 1, 1,
0.9330419, 0.4087328, 1.023609, 0, 0, 0, 1, 1,
0.9378713, -0.8985455, 2.533853, 0, 0, 0, 1, 1,
0.9382187, -2.925451, 3.181912, 0, 0, 0, 1, 1,
0.9571603, 1.344095, 0.9002243, 0, 0, 0, 1, 1,
0.9606879, -1.191805, 2.853824, 1, 1, 1, 1, 1,
0.9627761, -0.8945661, -0.313522, 1, 1, 1, 1, 1,
0.9635824, -0.3930224, 2.809883, 1, 1, 1, 1, 1,
0.9706476, -1.096893, 0.9137754, 1, 1, 1, 1, 1,
0.9722534, 1.204433, 0.9722147, 1, 1, 1, 1, 1,
0.976606, -0.7117332, 2.219378, 1, 1, 1, 1, 1,
0.9794134, 0.8073233, -0.7537233, 1, 1, 1, 1, 1,
0.989513, -1.418075, 2.94355, 1, 1, 1, 1, 1,
0.9929033, 1.04319, 1.807887, 1, 1, 1, 1, 1,
0.9936136, -0.05569912, -0.4307074, 1, 1, 1, 1, 1,
0.9944507, -0.02192358, 1.418538, 1, 1, 1, 1, 1,
0.9945076, 0.007756828, 1.587146, 1, 1, 1, 1, 1,
0.9997532, 1.281654, 0.9613021, 1, 1, 1, 1, 1,
1.00316, -1.165637, 3.685233, 1, 1, 1, 1, 1,
1.010976, 1.973349, -0.9515295, 1, 1, 1, 1, 1,
1.020482, -0.2071981, 1.969777, 0, 0, 1, 1, 1,
1.021199, 0.5929264, 1.129221, 1, 0, 0, 1, 1,
1.023277, -0.5194787, 2.310272, 1, 0, 0, 1, 1,
1.024427, -0.3536891, 1.535457, 1, 0, 0, 1, 1,
1.03169, -0.1571748, -0.3086648, 1, 0, 0, 1, 1,
1.032108, -0.3736589, 1.70235, 1, 0, 0, 1, 1,
1.037864, -0.1158647, 3.463961, 0, 0, 0, 1, 1,
1.046081, 0.2763636, 1.861311, 0, 0, 0, 1, 1,
1.050172, -0.3727502, 4.134339, 0, 0, 0, 1, 1,
1.054887, -0.5456011, 1.453355, 0, 0, 0, 1, 1,
1.06458, -0.3988173, 2.075918, 0, 0, 0, 1, 1,
1.070824, 0.6465723, 0.1289898, 0, 0, 0, 1, 1,
1.070908, -0.7273817, 1.873987, 0, 0, 0, 1, 1,
1.072005, 0.6468809, 1.121745, 1, 1, 1, 1, 1,
1.078413, 0.06411067, 0.2794102, 1, 1, 1, 1, 1,
1.087973, -1.193329, 2.088125, 1, 1, 1, 1, 1,
1.088748, -0.215319, 1.326772, 1, 1, 1, 1, 1,
1.096694, 0.5637575, 0.3995053, 1, 1, 1, 1, 1,
1.098815, -0.3375308, 2.125899, 1, 1, 1, 1, 1,
1.10717, 0.9420984, -1.12964, 1, 1, 1, 1, 1,
1.107999, -0.648401, 2.634385, 1, 1, 1, 1, 1,
1.111371, -0.739069, 1.204524, 1, 1, 1, 1, 1,
1.112399, -0.5271842, 3.432444, 1, 1, 1, 1, 1,
1.114267, 1.281589, 0.9790679, 1, 1, 1, 1, 1,
1.138876, -0.9473352, 1.342727, 1, 1, 1, 1, 1,
1.143471, -0.4115543, 0.6897365, 1, 1, 1, 1, 1,
1.144635, 0.3363762, 1.648989, 1, 1, 1, 1, 1,
1.152171, 0.325702, 0.06979472, 1, 1, 1, 1, 1,
1.153771, 1.391821, 1.842072, 0, 0, 1, 1, 1,
1.154561, -0.4744503, 1.506957, 1, 0, 0, 1, 1,
1.157016, -1.879569, 2.038106, 1, 0, 0, 1, 1,
1.160533, 0.4422303, 1.823414, 1, 0, 0, 1, 1,
1.161446, 0.6564688, 0.432514, 1, 0, 0, 1, 1,
1.16397, -1.835567, 1.683614, 1, 0, 0, 1, 1,
1.163994, -0.08054807, 1.626448, 0, 0, 0, 1, 1,
1.164051, -1.284519, 2.451389, 0, 0, 0, 1, 1,
1.167051, -2.063273, 1.689466, 0, 0, 0, 1, 1,
1.169709, -1.23885, 0.5899365, 0, 0, 0, 1, 1,
1.173936, -0.7050561, 1.539004, 0, 0, 0, 1, 1,
1.175184, 1.581525, 0.8274278, 0, 0, 0, 1, 1,
1.180571, -0.0653526, 0.6733274, 0, 0, 0, 1, 1,
1.181322, -1.058511, 1.230464, 1, 1, 1, 1, 1,
1.185661, -0.2450955, 2.38082, 1, 1, 1, 1, 1,
1.186449, 1.376946, 1.04822, 1, 1, 1, 1, 1,
1.187215, 0.09572688, 1.194536, 1, 1, 1, 1, 1,
1.194326, 0.7169797, 1.095728, 1, 1, 1, 1, 1,
1.205935, 0.7682676, 0.02165407, 1, 1, 1, 1, 1,
1.208131, 1.326378, -0.5751907, 1, 1, 1, 1, 1,
1.210444, -0.1914209, 1.214261, 1, 1, 1, 1, 1,
1.215145, 0.1557337, 2.191724, 1, 1, 1, 1, 1,
1.219677, -0.6204785, 3.369379, 1, 1, 1, 1, 1,
1.224449, -0.3671484, 1.31093, 1, 1, 1, 1, 1,
1.226104, 1.020765, 0.8975337, 1, 1, 1, 1, 1,
1.231708, -0.01965217, 2.44909, 1, 1, 1, 1, 1,
1.248152, 0.6937077, 1.200862, 1, 1, 1, 1, 1,
1.249052, -1.410956, 2.415191, 1, 1, 1, 1, 1,
1.253193, -1.142605, 1.352244, 0, 0, 1, 1, 1,
1.254098, -1.767576, 2.879939, 1, 0, 0, 1, 1,
1.254217, -0.08581, 0.8062999, 1, 0, 0, 1, 1,
1.287645, -0.08143495, 1.200868, 1, 0, 0, 1, 1,
1.288394, 0.777661, 3.029863, 1, 0, 0, 1, 1,
1.294943, 0.4284906, 0.1237796, 1, 0, 0, 1, 1,
1.298588, 0.832435, 3.002773, 0, 0, 0, 1, 1,
1.302423, 0.3707463, -0.5772863, 0, 0, 0, 1, 1,
1.308287, -0.9375018, 2.706147, 0, 0, 0, 1, 1,
1.310863, -0.6686007, 2.832497, 0, 0, 0, 1, 1,
1.31436, 0.455698, 1.552405, 0, 0, 0, 1, 1,
1.344287, -0.4109528, 1.303635, 0, 0, 0, 1, 1,
1.347642, -0.3862868, 1.198282, 0, 0, 0, 1, 1,
1.360477, -0.88581, 1.720978, 1, 1, 1, 1, 1,
1.364806, 0.1746829, 1.954557, 1, 1, 1, 1, 1,
1.366, -0.2962233, 1.621934, 1, 1, 1, 1, 1,
1.368666, 0.8671176, 1.50217, 1, 1, 1, 1, 1,
1.385984, 1.330511, 1.204931, 1, 1, 1, 1, 1,
1.387807, -0.003461383, 1.855644, 1, 1, 1, 1, 1,
1.392455, -0.5800606, 2.793783, 1, 1, 1, 1, 1,
1.39252, 1.971226, 1.15336, 1, 1, 1, 1, 1,
1.410819, -0.4828161, 2.070986, 1, 1, 1, 1, 1,
1.416589, -0.2955879, 2.065397, 1, 1, 1, 1, 1,
1.416852, 1.382513, 0.1115971, 1, 1, 1, 1, 1,
1.419792, -0.6980421, 1.664465, 1, 1, 1, 1, 1,
1.427537, -0.8055279, 1.806783, 1, 1, 1, 1, 1,
1.436449, 0.001291634, 0.7545153, 1, 1, 1, 1, 1,
1.443108, 0.2186912, 1.944839, 1, 1, 1, 1, 1,
1.448879, -1.115421, 2.067287, 0, 0, 1, 1, 1,
1.471658, 0.3316623, 0.5751898, 1, 0, 0, 1, 1,
1.478554, 1.815763, 1.631148, 1, 0, 0, 1, 1,
1.486411, -0.1102479, 1.027522, 1, 0, 0, 1, 1,
1.493711, -0.2795382, 2.232708, 1, 0, 0, 1, 1,
1.494452, -0.5540164, 2.738047, 1, 0, 0, 1, 1,
1.500817, -0.102357, 3.022688, 0, 0, 0, 1, 1,
1.504186, -2.676816, 2.890326, 0, 0, 0, 1, 1,
1.507228, 0.1353421, 0.3643031, 0, 0, 0, 1, 1,
1.529012, 0.2588264, -0.01054657, 0, 0, 0, 1, 1,
1.533042, -0.4051105, 0.4177856, 0, 0, 0, 1, 1,
1.534793, -1.191754, -0.3503574, 0, 0, 0, 1, 1,
1.535424, -2.121974, 2.884627, 0, 0, 0, 1, 1,
1.549937, -1.547503, 2.097513, 1, 1, 1, 1, 1,
1.56141, 0.04665209, 2.109916, 1, 1, 1, 1, 1,
1.574401, 0.07684705, 0.110836, 1, 1, 1, 1, 1,
1.579875, 0.5007085, 1.99013, 1, 1, 1, 1, 1,
1.613143, -0.05074532, 0.8247581, 1, 1, 1, 1, 1,
1.617634, 1.365803, 1.007694, 1, 1, 1, 1, 1,
1.623462, 2.269861, 0.2518204, 1, 1, 1, 1, 1,
1.629354, 1.095216, 1.28025, 1, 1, 1, 1, 1,
1.648696, 0.1486618, 2.886828, 1, 1, 1, 1, 1,
1.660023, -0.2640222, 2.494869, 1, 1, 1, 1, 1,
1.662425, -0.9945143, 2.190681, 1, 1, 1, 1, 1,
1.665068, -0.4062702, 3.043355, 1, 1, 1, 1, 1,
1.667106, -1.153443, 1.773796, 1, 1, 1, 1, 1,
1.677886, -1.13093, 1.785287, 1, 1, 1, 1, 1,
1.679644, -0.1777244, 0.6882517, 1, 1, 1, 1, 1,
1.687803, -0.2535767, 1.79942, 0, 0, 1, 1, 1,
1.690664, 0.7081774, 1.919262, 1, 0, 0, 1, 1,
1.699801, 0.8191769, 0.6749018, 1, 0, 0, 1, 1,
1.704009, -0.8363025, 2.15754, 1, 0, 0, 1, 1,
1.708864, 0.3151713, 2.200839, 1, 0, 0, 1, 1,
1.725125, 2.14513, 1.679308, 1, 0, 0, 1, 1,
1.741675, 1.176742, 1.885195, 0, 0, 0, 1, 1,
1.756301, -0.2083367, 1.742378, 0, 0, 0, 1, 1,
1.762004, 0.4077502, 2.115161, 0, 0, 0, 1, 1,
1.767186, 0.7780116, 0.7918779, 0, 0, 0, 1, 1,
1.773835, 0.3756494, 1.298683, 0, 0, 0, 1, 1,
1.776127, 0.1209555, 0.4494579, 0, 0, 0, 1, 1,
1.794786, -1.145958, 3.041007, 0, 0, 0, 1, 1,
1.79486, -1.865601, 2.594064, 1, 1, 1, 1, 1,
1.807054, 0.2355437, 0.6792179, 1, 1, 1, 1, 1,
1.810015, -0.4892097, 0.4676521, 1, 1, 1, 1, 1,
1.833604, 0.3938856, 3.863288, 1, 1, 1, 1, 1,
1.87729, 1.337439, 1.832916, 1, 1, 1, 1, 1,
1.879104, -0.4049833, 2.844788, 1, 1, 1, 1, 1,
1.911327, 0.2138002, -0.620589, 1, 1, 1, 1, 1,
1.917228, -0.4440029, 1.554772, 1, 1, 1, 1, 1,
1.92014, -1.609096, 1.124351, 1, 1, 1, 1, 1,
1.926576, -0.3562154, 1.205644, 1, 1, 1, 1, 1,
1.938056, -0.7460172, 1.57706, 1, 1, 1, 1, 1,
1.984955, 0.2416231, 1.353434, 1, 1, 1, 1, 1,
1.99169, -1.698951, 2.440965, 1, 1, 1, 1, 1,
1.995842, -0.294715, 0.06100621, 1, 1, 1, 1, 1,
2.037694, 0.8584428, 1.749579, 1, 1, 1, 1, 1,
2.06637, 0.6054739, -0.1604673, 0, 0, 1, 1, 1,
2.12815, 0.2386683, 0.8923934, 1, 0, 0, 1, 1,
2.130079, 0.2072088, 2.571413, 1, 0, 0, 1, 1,
2.141808, -0.8431418, 1.70899, 1, 0, 0, 1, 1,
2.152074, -0.3060736, 2.52568, 1, 0, 0, 1, 1,
2.157555, -1.138608, 2.189471, 1, 0, 0, 1, 1,
2.206579, 0.1411942, 1.669087, 0, 0, 0, 1, 1,
2.226325, 0.4407595, 0.8710055, 0, 0, 0, 1, 1,
2.250876, 1.338721, 1.661276, 0, 0, 0, 1, 1,
2.276146, 0.6928104, -0.6713067, 0, 0, 0, 1, 1,
2.280928, 1.002789, -0.5208602, 0, 0, 0, 1, 1,
2.315223, -0.2423078, 1.6905, 0, 0, 0, 1, 1,
2.318041, -1.386461, 4.154116, 0, 0, 0, 1, 1,
2.443063, 1.261938, 0.3036522, 1, 1, 1, 1, 1,
2.494842, -0.3196359, 3.198752, 1, 1, 1, 1, 1,
2.515163, -1.31923, 3.008183, 1, 1, 1, 1, 1,
2.534268, 0.9775878, 0.3166064, 1, 1, 1, 1, 1,
2.674801, 0.01383009, 2.798488, 1, 1, 1, 1, 1,
2.739747, -0.425883, 1.517602, 1, 1, 1, 1, 1,
3.387481, 0.03783219, 0.4914083, 1, 1, 1, 1, 1
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
var radius = 9.429644;
var distance = 33.12123;
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
mvMatrix.translate( 0.06178594, 0.3313665, -0.1809978 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12123);
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
