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
-3.322828, 0.6576438, -3.604509, 1, 0, 0, 1,
-3.09342, -2.37333, -1.359339, 1, 0.007843138, 0, 1,
-2.854524, -0.04061305, -0.8977148, 1, 0.01176471, 0, 1,
-2.812459, 0.6933426, -1.198219, 1, 0.01960784, 0, 1,
-2.664491, -0.6227685, -0.2139532, 1, 0.02352941, 0, 1,
-2.618409, 1.080535, -1.473274, 1, 0.03137255, 0, 1,
-2.438309, -0.5077093, -2.851043, 1, 0.03529412, 0, 1,
-2.417058, 0.1768183, -1.795529, 1, 0.04313726, 0, 1,
-2.388724, 0.549988, -2.032061, 1, 0.04705882, 0, 1,
-2.312173, -0.894063, -1.885808, 1, 0.05490196, 0, 1,
-2.290539, 1.212657, -1.322439, 1, 0.05882353, 0, 1,
-2.262917, 0.2065314, -1.469771, 1, 0.06666667, 0, 1,
-2.075929, 0.6577585, -1.97039, 1, 0.07058824, 0, 1,
-2.074934, 0.237717, -2.489936, 1, 0.07843138, 0, 1,
-2.069127, -0.00561391, -0.2807206, 1, 0.08235294, 0, 1,
-2.007981, 1.138244, -1.933239, 1, 0.09019608, 0, 1,
-2.004097, -2.73505, -1.144065, 1, 0.09411765, 0, 1,
-1.942469, -1.341765, -3.006348, 1, 0.1019608, 0, 1,
-1.919712, 0.2082239, -1.342191, 1, 0.1098039, 0, 1,
-1.91861, 0.6946508, -2.433923, 1, 0.1137255, 0, 1,
-1.908413, 1.925584, -0.7241265, 1, 0.1215686, 0, 1,
-1.894371, -0.9398124, -3.537137, 1, 0.1254902, 0, 1,
-1.841204, 0.5679325, -3.415597, 1, 0.1333333, 0, 1,
-1.839273, -1.341125, -2.068419, 1, 0.1372549, 0, 1,
-1.832637, -0.0817193, -1.130663, 1, 0.145098, 0, 1,
-1.830708, 0.1363766, -1.459563, 1, 0.1490196, 0, 1,
-1.789821, -0.1642021, -1.12814, 1, 0.1568628, 0, 1,
-1.774185, -0.439133, -1.553706, 1, 0.1607843, 0, 1,
-1.765123, -0.8038471, -1.84822, 1, 0.1686275, 0, 1,
-1.758123, -0.002580755, -1.140846, 1, 0.172549, 0, 1,
-1.749242, -0.3259453, -1.704331, 1, 0.1803922, 0, 1,
-1.736408, 1.590405, -3.085981, 1, 0.1843137, 0, 1,
-1.718776, 1.499448, -0.3543107, 1, 0.1921569, 0, 1,
-1.717866, -0.3910077, -1.743523, 1, 0.1960784, 0, 1,
-1.707427, -0.4023085, -0.9323176, 1, 0.2039216, 0, 1,
-1.707058, -1.339461, -2.836482, 1, 0.2117647, 0, 1,
-1.70248, 1.031858, 1.463404, 1, 0.2156863, 0, 1,
-1.689993, 0.0005820884, -1.581127, 1, 0.2235294, 0, 1,
-1.688213, 0.03026656, -3.425312, 1, 0.227451, 0, 1,
-1.684833, -0.7741543, -1.237597, 1, 0.2352941, 0, 1,
-1.677647, 0.3548068, -0.7331693, 1, 0.2392157, 0, 1,
-1.674007, -1.214259, -2.183836, 1, 0.2470588, 0, 1,
-1.657919, 1.720461, -1.976304, 1, 0.2509804, 0, 1,
-1.653815, -0.9620354, -3.82959, 1, 0.2588235, 0, 1,
-1.651081, -0.5445777, -3.752199, 1, 0.2627451, 0, 1,
-1.643835, -0.8250547, -2.963696, 1, 0.2705882, 0, 1,
-1.631907, -0.574383, -0.05096243, 1, 0.2745098, 0, 1,
-1.621169, 0.485305, -2.688533, 1, 0.282353, 0, 1,
-1.619381, 1.264296, -1.345415, 1, 0.2862745, 0, 1,
-1.610846, -0.05755731, -1.312003, 1, 0.2941177, 0, 1,
-1.602814, 0.09517074, -1.275538, 1, 0.3019608, 0, 1,
-1.585616, 1.514513, 0.1633548, 1, 0.3058824, 0, 1,
-1.58463, -0.1136158, -2.125172, 1, 0.3137255, 0, 1,
-1.580125, 0.1562808, -2.879597, 1, 0.3176471, 0, 1,
-1.579592, 0.02210458, -1.45994, 1, 0.3254902, 0, 1,
-1.573182, 0.1204212, -2.255389, 1, 0.3294118, 0, 1,
-1.567668, -0.5282108, -2.83958, 1, 0.3372549, 0, 1,
-1.544309, -0.8236809, -0.9887432, 1, 0.3411765, 0, 1,
-1.521608, -0.03830097, -0.4852991, 1, 0.3490196, 0, 1,
-1.499835, 0.209969, 0.6875167, 1, 0.3529412, 0, 1,
-1.494798, -0.6412923, -2.224506, 1, 0.3607843, 0, 1,
-1.493572, 0.8757697, 1.15897, 1, 0.3647059, 0, 1,
-1.480863, 0.2994231, -0.7028377, 1, 0.372549, 0, 1,
-1.463443, 0.7083972, -0.2949777, 1, 0.3764706, 0, 1,
-1.462328, 0.9606663, -2.068571, 1, 0.3843137, 0, 1,
-1.46049, -1.060436, -0.5147059, 1, 0.3882353, 0, 1,
-1.45928, 2.097537, -1.203243, 1, 0.3960784, 0, 1,
-1.457219, 1.074465, 0.2277747, 1, 0.4039216, 0, 1,
-1.439768, -1.039, -3.010902, 1, 0.4078431, 0, 1,
-1.424507, 0.0213402, -2.69102, 1, 0.4156863, 0, 1,
-1.41903, -0.6090951, -1.174247, 1, 0.4196078, 0, 1,
-1.41189, 0.4854564, -0.9510724, 1, 0.427451, 0, 1,
-1.402224, -0.3931825, -2.023294, 1, 0.4313726, 0, 1,
-1.402159, 1.655382, -1.87432, 1, 0.4392157, 0, 1,
-1.400036, 0.4024955, -1.219604, 1, 0.4431373, 0, 1,
-1.379954, -1.586678, -1.777824, 1, 0.4509804, 0, 1,
-1.374074, -1.125564, -2.60341, 1, 0.454902, 0, 1,
-1.356679, -0.668188, -1.85929, 1, 0.4627451, 0, 1,
-1.356531, -0.7603937, -0.3584516, 1, 0.4666667, 0, 1,
-1.356464, 0.4076377, -2.763089, 1, 0.4745098, 0, 1,
-1.350031, 0.7049202, -0.9744726, 1, 0.4784314, 0, 1,
-1.349599, 0.6869615, 2.118505, 1, 0.4862745, 0, 1,
-1.339751, 0.1425911, -0.4077465, 1, 0.4901961, 0, 1,
-1.323514, -0.8606919, -1.47365, 1, 0.4980392, 0, 1,
-1.320294, 0.02102003, -1.478701, 1, 0.5058824, 0, 1,
-1.319766, -0.3005193, -1.591825, 1, 0.509804, 0, 1,
-1.317042, 0.2733111, -1.123701, 1, 0.5176471, 0, 1,
-1.311328, -2.277596, -2.724771, 1, 0.5215687, 0, 1,
-1.30042, -0.1587806, -1.167644, 1, 0.5294118, 0, 1,
-1.298946, 0.5820898, -0.8352245, 1, 0.5333334, 0, 1,
-1.296544, 0.8607157, -1.77713, 1, 0.5411765, 0, 1,
-1.295138, -0.7097329, -2.355375, 1, 0.5450981, 0, 1,
-1.294559, -0.9621995, -1.002374, 1, 0.5529412, 0, 1,
-1.292564, 0.4323827, -2.261002, 1, 0.5568628, 0, 1,
-1.279225, -0.001954457, -1.80689, 1, 0.5647059, 0, 1,
-1.274634, -0.9467962, -3.164901, 1, 0.5686275, 0, 1,
-1.274273, 1.380493, -0.2020464, 1, 0.5764706, 0, 1,
-1.265136, -0.4242764, -1.977014, 1, 0.5803922, 0, 1,
-1.264729, 0.8291484, -1.272072, 1, 0.5882353, 0, 1,
-1.258005, 1.641683, 0.02509558, 1, 0.5921569, 0, 1,
-1.248121, 0.433852, -0.5808302, 1, 0.6, 0, 1,
-1.242655, 0.1330343, -0.3927053, 1, 0.6078432, 0, 1,
-1.238051, 2.305205, -1.070296, 1, 0.6117647, 0, 1,
-1.232584, -0.4191365, -2.008851, 1, 0.6196079, 0, 1,
-1.232455, -0.6872405, -0.9984031, 1, 0.6235294, 0, 1,
-1.231273, 1.373463, -1.077163, 1, 0.6313726, 0, 1,
-1.206396, 1.3799, 0.4901517, 1, 0.6352941, 0, 1,
-1.205376, 0.2541307, -3.170441, 1, 0.6431373, 0, 1,
-1.191403, 0.5501679, -0.9034616, 1, 0.6470588, 0, 1,
-1.190303, 2.751571, 0.5057393, 1, 0.654902, 0, 1,
-1.190292, 1.116578, -0.3492307, 1, 0.6588235, 0, 1,
-1.187129, 0.09646868, -1.225381, 1, 0.6666667, 0, 1,
-1.184245, -0.8129019, -2.312401, 1, 0.6705883, 0, 1,
-1.176138, -0.08172508, -2.964145, 1, 0.6784314, 0, 1,
-1.174158, 0.3393436, -2.260427, 1, 0.682353, 0, 1,
-1.173861, -0.7878426, -2.948792, 1, 0.6901961, 0, 1,
-1.173011, 0.3097107, -2.113701, 1, 0.6941177, 0, 1,
-1.169038, 0.08907919, -1.968107, 1, 0.7019608, 0, 1,
-1.16183, 0.4377224, -1.83935, 1, 0.7098039, 0, 1,
-1.160768, -2.255793, -2.532865, 1, 0.7137255, 0, 1,
-1.157235, -0.3558275, -3.790725, 1, 0.7215686, 0, 1,
-1.148575, 0.1939687, -1.115719, 1, 0.7254902, 0, 1,
-1.134107, 0.2766955, -3.154226, 1, 0.7333333, 0, 1,
-1.12451, 1.940112, -0.5131328, 1, 0.7372549, 0, 1,
-1.123808, -0.301524, -1.529004, 1, 0.7450981, 0, 1,
-1.118169, 1.777245, -0.1984943, 1, 0.7490196, 0, 1,
-1.109568, 1.210338, -0.06610285, 1, 0.7568628, 0, 1,
-1.107065, 0.2772929, -2.510928, 1, 0.7607843, 0, 1,
-1.105977, 0.4053498, -0.3816169, 1, 0.7686275, 0, 1,
-1.097209, -0.7036334, -1.251592, 1, 0.772549, 0, 1,
-1.092343, 0.7444082, -2.372301, 1, 0.7803922, 0, 1,
-1.089979, -1.456293, -3.125875, 1, 0.7843137, 0, 1,
-1.082672, -0.2835287, -3.067645, 1, 0.7921569, 0, 1,
-1.075356, 0.7113456, 0.2999973, 1, 0.7960784, 0, 1,
-1.068967, -0.9079517, -2.138634, 1, 0.8039216, 0, 1,
-1.068945, -0.5791842, -2.216112, 1, 0.8117647, 0, 1,
-1.06459, 2.343012, -0.4625358, 1, 0.8156863, 0, 1,
-1.053944, -1.503254, -4.641091, 1, 0.8235294, 0, 1,
-1.047069, 0.01894386, -3.098546, 1, 0.827451, 0, 1,
-1.046079, -0.6587862, -2.481653, 1, 0.8352941, 0, 1,
-1.045996, 0.2973728, -1.614138, 1, 0.8392157, 0, 1,
-1.039093, -2.320797, -2.353947, 1, 0.8470588, 0, 1,
-1.032072, 0.06046195, -1.158726, 1, 0.8509804, 0, 1,
-1.025451, 0.1032443, -2.931651, 1, 0.8588235, 0, 1,
-1.018409, 2.281527, -0.3328929, 1, 0.8627451, 0, 1,
-1.013617, -0.8157769, -1.012318, 1, 0.8705882, 0, 1,
-1.011157, 1.710958, 0.1394986, 1, 0.8745098, 0, 1,
-1.00385, 1.79053, -0.4671291, 1, 0.8823529, 0, 1,
-1.00382, 0.9203511, -1.577007, 1, 0.8862745, 0, 1,
-0.9983565, -0.1441517, -0.3545312, 1, 0.8941177, 0, 1,
-0.9961098, -0.3605316, -1.593669, 1, 0.8980392, 0, 1,
-0.9954062, -2.113342, -3.06896, 1, 0.9058824, 0, 1,
-0.9945511, 1.415661, -2.481081, 1, 0.9137255, 0, 1,
-0.9941135, 0.1667647, -1.781699, 1, 0.9176471, 0, 1,
-0.9907457, 0.0008371166, -0.9424581, 1, 0.9254902, 0, 1,
-0.9773594, -2.699528, -3.983905, 1, 0.9294118, 0, 1,
-0.9714026, -0.1271733, -1.331154, 1, 0.9372549, 0, 1,
-0.9442924, -1.492285, -1.754572, 1, 0.9411765, 0, 1,
-0.9433387, 2.091366, -2.814054, 1, 0.9490196, 0, 1,
-0.9355175, -0.01083308, -2.822036, 1, 0.9529412, 0, 1,
-0.9285877, 0.7311739, -0.7462145, 1, 0.9607843, 0, 1,
-0.9280507, 1.625042, -0.8144158, 1, 0.9647059, 0, 1,
-0.9270777, 0.7567443, -2.492843, 1, 0.972549, 0, 1,
-0.9221782, 0.1934767, 0.4550261, 1, 0.9764706, 0, 1,
-0.9220588, -0.1309471, -2.739175, 1, 0.9843137, 0, 1,
-0.9203292, -0.8649961, -3.52319, 1, 0.9882353, 0, 1,
-0.9094486, -0.2579876, -2.104668, 1, 0.9960784, 0, 1,
-0.8973286, -0.3028318, -3.140622, 0.9960784, 1, 0, 1,
-0.8960619, 1.114843, -1.58642, 0.9921569, 1, 0, 1,
-0.8955363, 0.09178949, -0.8385158, 0.9843137, 1, 0, 1,
-0.8930703, 0.39608, -3.411216, 0.9803922, 1, 0, 1,
-0.8925949, 0.6454909, -1.057392, 0.972549, 1, 0, 1,
-0.8902107, -0.7168328, -1.418697, 0.9686275, 1, 0, 1,
-0.8788446, -1.168129, -1.715757, 0.9607843, 1, 0, 1,
-0.8780823, -1.525729, -3.172777, 0.9568627, 1, 0, 1,
-0.8749743, -0.4881584, -0.7458854, 0.9490196, 1, 0, 1,
-0.8746011, -0.7943378, -3.570376, 0.945098, 1, 0, 1,
-0.8742591, -2.602953, -2.876693, 0.9372549, 1, 0, 1,
-0.873509, 0.3004159, -1.25425, 0.9333333, 1, 0, 1,
-0.8732991, 1.044646, -2.723017, 0.9254902, 1, 0, 1,
-0.8720618, 0.1236049, -0.8408058, 0.9215686, 1, 0, 1,
-0.8697481, -0.4149819, -2.351467, 0.9137255, 1, 0, 1,
-0.8682555, 2.049027, 1.249271, 0.9098039, 1, 0, 1,
-0.8623587, -0.9240863, -4.214955, 0.9019608, 1, 0, 1,
-0.8549736, 1.925643, 0.5270159, 0.8941177, 1, 0, 1,
-0.8541578, 1.590495, -1.558333, 0.8901961, 1, 0, 1,
-0.8538266, 1.371846, -1.150961, 0.8823529, 1, 0, 1,
-0.8512678, -0.2436523, -2.538721, 0.8784314, 1, 0, 1,
-0.8455244, -1.899846, -3.328995, 0.8705882, 1, 0, 1,
-0.8444663, -0.2501359, -0.9779404, 0.8666667, 1, 0, 1,
-0.8437859, 0.6468234, -0.9018445, 0.8588235, 1, 0, 1,
-0.8429239, -0.2341883, -2.289711, 0.854902, 1, 0, 1,
-0.8393539, 0.5257264, -0.8244087, 0.8470588, 1, 0, 1,
-0.8377689, -0.397133, -1.936037, 0.8431373, 1, 0, 1,
-0.8311575, 0.0788406, -2.119045, 0.8352941, 1, 0, 1,
-0.8277621, 0.174988, -1.364596, 0.8313726, 1, 0, 1,
-0.8250268, 0.490412, -3.295548, 0.8235294, 1, 0, 1,
-0.8188599, -0.8361967, -2.090408, 0.8196079, 1, 0, 1,
-0.8167576, 0.08644395, -1.171759, 0.8117647, 1, 0, 1,
-0.8086237, 0.02109888, -0.6689626, 0.8078431, 1, 0, 1,
-0.8010657, -0.03933726, -3.801967, 0.8, 1, 0, 1,
-0.7959178, -0.136636, -1.866171, 0.7921569, 1, 0, 1,
-0.7946612, 0.587711, 0.2895719, 0.7882353, 1, 0, 1,
-0.7914844, -0.7742834, -3.559415, 0.7803922, 1, 0, 1,
-0.7848105, 1.231738, -1.781916, 0.7764706, 1, 0, 1,
-0.7846275, 0.1893335, -0.7579201, 0.7686275, 1, 0, 1,
-0.7835162, -1.004313, -1.542928, 0.7647059, 1, 0, 1,
-0.7831815, 0.5297717, -0.8076634, 0.7568628, 1, 0, 1,
-0.7802778, -0.07844095, -0.7394846, 0.7529412, 1, 0, 1,
-0.7797104, 1.337384, 1.004627, 0.7450981, 1, 0, 1,
-0.778104, -0.4223705, -1.583738, 0.7411765, 1, 0, 1,
-0.7755096, -1.640585, -3.429783, 0.7333333, 1, 0, 1,
-0.7730991, 0.6741397, -0.2656051, 0.7294118, 1, 0, 1,
-0.7729425, -1.154348, -1.362265, 0.7215686, 1, 0, 1,
-0.7668093, -1.349346, -2.383446, 0.7176471, 1, 0, 1,
-0.7641086, -0.4592489, -1.525418, 0.7098039, 1, 0, 1,
-0.7570853, 0.8580284, -0.8110378, 0.7058824, 1, 0, 1,
-0.7568804, -0.7868895, -3.135201, 0.6980392, 1, 0, 1,
-0.7534901, 0.2740748, -0.8369769, 0.6901961, 1, 0, 1,
-0.7519923, 0.8158858, -0.6823679, 0.6862745, 1, 0, 1,
-0.7511232, -0.1948243, -3.97402, 0.6784314, 1, 0, 1,
-0.7504249, -0.505947, -1.480873, 0.6745098, 1, 0, 1,
-0.7429901, -0.3036907, -3.634782, 0.6666667, 1, 0, 1,
-0.7427657, -1.036474, -2.686178, 0.6627451, 1, 0, 1,
-0.7411267, -0.7498813, -1.337323, 0.654902, 1, 0, 1,
-0.7390595, 0.2138993, -2.886917, 0.6509804, 1, 0, 1,
-0.7356948, 0.7312383, -0.9255423, 0.6431373, 1, 0, 1,
-0.7309109, 0.8688151, -1.492968, 0.6392157, 1, 0, 1,
-0.7297541, -1.070995, -2.106472, 0.6313726, 1, 0, 1,
-0.7293156, 0.2589691, -0.1958521, 0.627451, 1, 0, 1,
-0.7274975, 0.3210077, -1.373656, 0.6196079, 1, 0, 1,
-0.7222422, 1.881747, 1.055906, 0.6156863, 1, 0, 1,
-0.7178648, -0.3407972, -2.479729, 0.6078432, 1, 0, 1,
-0.7119395, 0.07103444, -0.3030972, 0.6039216, 1, 0, 1,
-0.7101531, -0.1383711, -0.6261069, 0.5960785, 1, 0, 1,
-0.708438, 0.4354867, -2.166922, 0.5882353, 1, 0, 1,
-0.7036796, -2.213655, -0.8194308, 0.5843138, 1, 0, 1,
-0.6993756, -0.4246573, -0.5532308, 0.5764706, 1, 0, 1,
-0.6986505, 1.024095, 0.2845663, 0.572549, 1, 0, 1,
-0.6962934, 0.3952819, -2.367178, 0.5647059, 1, 0, 1,
-0.6932065, 1.397999, 0.6225728, 0.5607843, 1, 0, 1,
-0.6850637, -1.104325, -0.8621837, 0.5529412, 1, 0, 1,
-0.6825696, 1.780272, -1.435119, 0.5490196, 1, 0, 1,
-0.681449, 0.3350134, -0.6843241, 0.5411765, 1, 0, 1,
-0.6788466, 0.4422274, -1.508426, 0.5372549, 1, 0, 1,
-0.678824, 1.507461, -0.6449941, 0.5294118, 1, 0, 1,
-0.6725932, 0.5449694, -0.5399783, 0.5254902, 1, 0, 1,
-0.6697878, -0.5977175, -3.250863, 0.5176471, 1, 0, 1,
-0.6582773, -0.9706728, -3.597003, 0.5137255, 1, 0, 1,
-0.6530597, -0.5533097, -2.445107, 0.5058824, 1, 0, 1,
-0.6484696, -0.1297788, -1.580113, 0.5019608, 1, 0, 1,
-0.6447462, 2.345266, -0.4713649, 0.4941176, 1, 0, 1,
-0.6408978, 0.2711447, -1.247223, 0.4862745, 1, 0, 1,
-0.6402262, -0.5201087, -2.164032, 0.4823529, 1, 0, 1,
-0.6368479, -0.893854, -1.252547, 0.4745098, 1, 0, 1,
-0.6278257, 0.05358693, -3.276526, 0.4705882, 1, 0, 1,
-0.6277768, 0.3167949, -1.525558, 0.4627451, 1, 0, 1,
-0.6255854, 1.011368, -2.627818, 0.4588235, 1, 0, 1,
-0.6255058, -1.807174, -1.564622, 0.4509804, 1, 0, 1,
-0.6212441, -1.06196, -2.281325, 0.4470588, 1, 0, 1,
-0.6167896, -0.5475889, -2.8748, 0.4392157, 1, 0, 1,
-0.6120364, 0.5232858, -0.9416256, 0.4352941, 1, 0, 1,
-0.6106725, 0.09312554, -2.125734, 0.427451, 1, 0, 1,
-0.6105139, 0.4445, -1.315284, 0.4235294, 1, 0, 1,
-0.6093996, -0.7726782, -1.450784, 0.4156863, 1, 0, 1,
-0.5997259, 0.6127659, -1.620441, 0.4117647, 1, 0, 1,
-0.5957096, -0.6445591, -3.089304, 0.4039216, 1, 0, 1,
-0.5956918, 0.2795907, -3.135035, 0.3960784, 1, 0, 1,
-0.5888387, 1.641859, -1.28827, 0.3921569, 1, 0, 1,
-0.5851309, 0.264288, -1.45663, 0.3843137, 1, 0, 1,
-0.5826707, -0.3523291, -0.630955, 0.3803922, 1, 0, 1,
-0.5823259, 2.124204, 0.1945079, 0.372549, 1, 0, 1,
-0.5790497, -0.3891025, -1.819599, 0.3686275, 1, 0, 1,
-0.5781652, 0.6286529, -1.468786, 0.3607843, 1, 0, 1,
-0.5771317, 1.248664, -0.7853618, 0.3568628, 1, 0, 1,
-0.5744792, 1.03083, -2.193759, 0.3490196, 1, 0, 1,
-0.5727757, -0.1032964, -1.064644, 0.345098, 1, 0, 1,
-0.5700544, -2.120021, -4.393329, 0.3372549, 1, 0, 1,
-0.5681171, -0.7538562, -3.005899, 0.3333333, 1, 0, 1,
-0.567218, -0.6574306, -1.794663, 0.3254902, 1, 0, 1,
-0.56549, -0.6253028, -1.773562, 0.3215686, 1, 0, 1,
-0.5630811, 0.9316005, -0.3996703, 0.3137255, 1, 0, 1,
-0.5626615, 0.1944361, -1.441633, 0.3098039, 1, 0, 1,
-0.5611496, 0.5259445, -1.187883, 0.3019608, 1, 0, 1,
-0.5610468, -1.260157, -1.219352, 0.2941177, 1, 0, 1,
-0.5583855, -1.229645, -3.079411, 0.2901961, 1, 0, 1,
-0.5583714, -0.3135833, -1.793763, 0.282353, 1, 0, 1,
-0.5579702, 0.8951292, -0.6421794, 0.2784314, 1, 0, 1,
-0.5497211, 0.4557991, -2.790891, 0.2705882, 1, 0, 1,
-0.5480238, -1.459838, -2.337811, 0.2666667, 1, 0, 1,
-0.5458154, 0.2729113, -1.864739, 0.2588235, 1, 0, 1,
-0.5439197, 0.8560132, -0.04307446, 0.254902, 1, 0, 1,
-0.5399866, 1.550393, -0.1024998, 0.2470588, 1, 0, 1,
-0.5398825, 1.602584, 0.4934158, 0.2431373, 1, 0, 1,
-0.5397276, 0.02443572, -1.402524, 0.2352941, 1, 0, 1,
-0.5392184, -0.285979, -3.665313, 0.2313726, 1, 0, 1,
-0.5385554, -0.04776097, 0.07487375, 0.2235294, 1, 0, 1,
-0.5383596, 0.1322204, -1.696142, 0.2196078, 1, 0, 1,
-0.5360147, -0.5218914, -0.5565547, 0.2117647, 1, 0, 1,
-0.5316017, 0.5965039, -1.948547, 0.2078431, 1, 0, 1,
-0.529214, -1.810567, -4.386471, 0.2, 1, 0, 1,
-0.5281923, 0.3347222, -1.296094, 0.1921569, 1, 0, 1,
-0.5222185, 0.2705628, 0.01284109, 0.1882353, 1, 0, 1,
-0.5189217, 0.2422308, 0.4690527, 0.1803922, 1, 0, 1,
-0.5099165, -0.472552, -1.847743, 0.1764706, 1, 0, 1,
-0.5078517, -2.806262, -4.65491, 0.1686275, 1, 0, 1,
-0.5052908, 0.5636763, -0.1482577, 0.1647059, 1, 0, 1,
-0.5017874, -0.4605442, -2.308628, 0.1568628, 1, 0, 1,
-0.4986639, -0.8486709, -2.265538, 0.1529412, 1, 0, 1,
-0.4973065, 0.8264204, 0.03390548, 0.145098, 1, 0, 1,
-0.4963174, 2.40751, -0.1207637, 0.1411765, 1, 0, 1,
-0.4952577, -0.579936, -1.799409, 0.1333333, 1, 0, 1,
-0.4949962, -0.7609901, -2.688401, 0.1294118, 1, 0, 1,
-0.4941655, 0.7898726, 0.7027166, 0.1215686, 1, 0, 1,
-0.4931866, -2.444492, -1.977968, 0.1176471, 1, 0, 1,
-0.4887241, -0.8568012, -3.611274, 0.1098039, 1, 0, 1,
-0.4860398, 0.6602502, -0.1285619, 0.1058824, 1, 0, 1,
-0.4807576, 0.2182318, 0.4839863, 0.09803922, 1, 0, 1,
-0.4799403, 0.6627258, 1.260657, 0.09019608, 1, 0, 1,
-0.4779504, -0.6627362, -3.89316, 0.08627451, 1, 0, 1,
-0.4734368, 1.446638, 0.4309942, 0.07843138, 1, 0, 1,
-0.4720665, 0.3793972, -1.220305, 0.07450981, 1, 0, 1,
-0.471963, -0.4546838, -4.315566, 0.06666667, 1, 0, 1,
-0.4699754, -1.629084, -2.218161, 0.0627451, 1, 0, 1,
-0.4692606, -0.3670905, -1.015742, 0.05490196, 1, 0, 1,
-0.4642493, 0.5766702, -0.7698687, 0.05098039, 1, 0, 1,
-0.4621858, 0.6991226, -1.011683, 0.04313726, 1, 0, 1,
-0.4535406, 2.938974, -0.9142034, 0.03921569, 1, 0, 1,
-0.4520452, -0.4886419, -1.762949, 0.03137255, 1, 0, 1,
-0.4486751, 1.288539, -1.457552, 0.02745098, 1, 0, 1,
-0.4458243, 2.463392, 0.426301, 0.01960784, 1, 0, 1,
-0.4399668, 0.828831, -0.8533469, 0.01568628, 1, 0, 1,
-0.439738, 1.338091, 0.3859933, 0.007843138, 1, 0, 1,
-0.4394971, 0.03221044, -2.358228, 0.003921569, 1, 0, 1,
-0.4385566, 0.1882085, -2.183212, 0, 1, 0.003921569, 1,
-0.436807, 0.3497824, -1.825783, 0, 1, 0.01176471, 1,
-0.4346949, -0.3975388, -2.858171, 0, 1, 0.01568628, 1,
-0.4283955, -0.1229817, -1.292461, 0, 1, 0.02352941, 1,
-0.4283549, -0.6594967, -3.908636, 0, 1, 0.02745098, 1,
-0.4182973, 0.9945308, 1.379767, 0, 1, 0.03529412, 1,
-0.4155151, 1.016355, -0.5565058, 0, 1, 0.03921569, 1,
-0.4130053, 0.1916863, 0.06303812, 0, 1, 0.04705882, 1,
-0.4114287, -0.7755036, -2.780673, 0, 1, 0.05098039, 1,
-0.4072667, -0.3306583, -1.599387, 0, 1, 0.05882353, 1,
-0.4060613, 0.04889986, -1.415766, 0, 1, 0.0627451, 1,
-0.401305, -0.8810876, -3.740277, 0, 1, 0.07058824, 1,
-0.3993387, -0.4266228, -1.847134, 0, 1, 0.07450981, 1,
-0.389172, -1.380673, -3.891541, 0, 1, 0.08235294, 1,
-0.3808717, 0.4204582, -0.2992615, 0, 1, 0.08627451, 1,
-0.3796441, -0.5746221, -3.462087, 0, 1, 0.09411765, 1,
-0.3772801, -0.2489158, -2.49506, 0, 1, 0.1019608, 1,
-0.374611, 1.085146, 0.5834219, 0, 1, 0.1058824, 1,
-0.3742414, -1.234549, -2.839125, 0, 1, 0.1137255, 1,
-0.3673853, 0.7547268, -0.9006333, 0, 1, 0.1176471, 1,
-0.3672207, -0.8583998, -3.040279, 0, 1, 0.1254902, 1,
-0.3600306, -0.1580542, -1.217834, 0, 1, 0.1294118, 1,
-0.3588866, -0.2330547, -1.24332, 0, 1, 0.1372549, 1,
-0.3586671, 2.067569, 1.752929, 0, 1, 0.1411765, 1,
-0.3586236, 1.237655, -1.028647, 0, 1, 0.1490196, 1,
-0.3581758, -1.035465, -3.623766, 0, 1, 0.1529412, 1,
-0.357531, -1.669421, -3.313848, 0, 1, 0.1607843, 1,
-0.3545682, -0.6593078, -3.948926, 0, 1, 0.1647059, 1,
-0.3505106, -1.950009, -2.104803, 0, 1, 0.172549, 1,
-0.3493683, -0.5534483, -1.731165, 0, 1, 0.1764706, 1,
-0.3479422, 0.3325424, -0.07856391, 0, 1, 0.1843137, 1,
-0.346527, -1.135312, -0.2683699, 0, 1, 0.1882353, 1,
-0.3433854, -1.397854, -2.566897, 0, 1, 0.1960784, 1,
-0.342539, 1.291613, -0.2644577, 0, 1, 0.2039216, 1,
-0.3407198, -0.6170356, -3.806944, 0, 1, 0.2078431, 1,
-0.3381709, -0.6853343, -1.811053, 0, 1, 0.2156863, 1,
-0.3372283, -0.4675291, -3.728916, 0, 1, 0.2196078, 1,
-0.3360386, -1.605175, -2.19919, 0, 1, 0.227451, 1,
-0.3298301, 1.924725, -2.270657, 0, 1, 0.2313726, 1,
-0.3252797, 0.6244585, -0.432606, 0, 1, 0.2392157, 1,
-0.3248039, -0.107447, -1.610506, 0, 1, 0.2431373, 1,
-0.3221854, -0.02828349, -3.147324, 0, 1, 0.2509804, 1,
-0.3218074, -0.8145216, -3.523182, 0, 1, 0.254902, 1,
-0.3197434, -0.1606941, -2.767677, 0, 1, 0.2627451, 1,
-0.3145015, -0.8282139, -4.481458, 0, 1, 0.2666667, 1,
-0.311385, -0.7208669, -4.255092, 0, 1, 0.2745098, 1,
-0.3048631, -0.7852904, -2.880576, 0, 1, 0.2784314, 1,
-0.303108, -0.2364708, -3.257546, 0, 1, 0.2862745, 1,
-0.3016617, 0.6829219, -2.086967, 0, 1, 0.2901961, 1,
-0.301136, 0.7951142, 0.6488391, 0, 1, 0.2980392, 1,
-0.2957931, -0.4266887, -3.466635, 0, 1, 0.3058824, 1,
-0.2908235, -0.7583869, 0.3489793, 0, 1, 0.3098039, 1,
-0.2902021, -0.3016496, -3.053115, 0, 1, 0.3176471, 1,
-0.2886288, -0.5319154, -1.567647, 0, 1, 0.3215686, 1,
-0.2857981, -0.5692734, -1.835552, 0, 1, 0.3294118, 1,
-0.280246, 0.854225, 0.07038275, 0, 1, 0.3333333, 1,
-0.2801085, 0.7144201, -0.8740841, 0, 1, 0.3411765, 1,
-0.2790582, 1.368198, -0.6844971, 0, 1, 0.345098, 1,
-0.2781965, -0.7603797, -2.178822, 0, 1, 0.3529412, 1,
-0.2736246, -0.7066771, -2.817769, 0, 1, 0.3568628, 1,
-0.2701311, 0.1629378, -1.51722, 0, 1, 0.3647059, 1,
-0.2632373, 0.4271791, -0.7402319, 0, 1, 0.3686275, 1,
-0.2630838, -0.7754555, -1.577959, 0, 1, 0.3764706, 1,
-0.2608921, -0.3459293, -4.776947, 0, 1, 0.3803922, 1,
-0.259609, -0.230492, 0.1464033, 0, 1, 0.3882353, 1,
-0.2591619, -0.01182031, -3.101081, 0, 1, 0.3921569, 1,
-0.2573708, 1.043984, -1.749288, 0, 1, 0.4, 1,
-0.2551248, -0.6541072, -4.272716, 0, 1, 0.4078431, 1,
-0.2499438, -1.599657, -4.749541, 0, 1, 0.4117647, 1,
-0.2449464, -1.578634, -4.451312, 0, 1, 0.4196078, 1,
-0.2435248, 0.6869752, 0.8943298, 0, 1, 0.4235294, 1,
-0.2402723, -1.523796, -3.541041, 0, 1, 0.4313726, 1,
-0.2348218, -0.6029624, -1.685503, 0, 1, 0.4352941, 1,
-0.2319941, -0.150116, -1.624424, 0, 1, 0.4431373, 1,
-0.2301828, 0.1760033, -0.1732811, 0, 1, 0.4470588, 1,
-0.2280103, 0.4645291, -0.4068668, 0, 1, 0.454902, 1,
-0.2253356, -0.07433566, -1.052091, 0, 1, 0.4588235, 1,
-0.2238895, 0.0005876825, -1.111443, 0, 1, 0.4666667, 1,
-0.2229743, 0.02134863, -1.020853, 0, 1, 0.4705882, 1,
-0.2222081, 0.7776444, -0.7133272, 0, 1, 0.4784314, 1,
-0.2198075, -0.8058959, -3.032019, 0, 1, 0.4823529, 1,
-0.2165912, 0.4124067, 2.088204, 0, 1, 0.4901961, 1,
-0.2135432, 0.2047805, -0.4327342, 0, 1, 0.4941176, 1,
-0.2127335, -0.02178858, -1.98007, 0, 1, 0.5019608, 1,
-0.2123384, 0.2892947, 0.8090972, 0, 1, 0.509804, 1,
-0.2102871, 0.7581855, 0.4176167, 0, 1, 0.5137255, 1,
-0.207893, -0.1704967, -2.430164, 0, 1, 0.5215687, 1,
-0.2077336, -0.6819111, -2.476395, 0, 1, 0.5254902, 1,
-0.2066912, 1.015699, -0.773864, 0, 1, 0.5333334, 1,
-0.2063072, -1.242515, -3.429022, 0, 1, 0.5372549, 1,
-0.2053012, -0.2847916, -4.320534, 0, 1, 0.5450981, 1,
-0.2039331, 0.6411719, -0.1625123, 0, 1, 0.5490196, 1,
-0.2024523, -0.1586898, -2.964722, 0, 1, 0.5568628, 1,
-0.2013048, -2.501579, -4.032755, 0, 1, 0.5607843, 1,
-0.200642, 0.5856935, 1.47148, 0, 1, 0.5686275, 1,
-0.2003498, -0.8539679, -3.348872, 0, 1, 0.572549, 1,
-0.2000573, 0.6611782, 1.335509, 0, 1, 0.5803922, 1,
-0.1972639, -0.3619845, -2.409739, 0, 1, 0.5843138, 1,
-0.1956896, -0.2616201, -1.869038, 0, 1, 0.5921569, 1,
-0.1952932, -0.5595441, -1.915826, 0, 1, 0.5960785, 1,
-0.1918927, 0.7778856, -1.021651, 0, 1, 0.6039216, 1,
-0.1878877, 0.01012909, -2.666736, 0, 1, 0.6117647, 1,
-0.1856203, 0.06822701, -1.566445, 0, 1, 0.6156863, 1,
-0.1838297, -0.4090429, -3.335954, 0, 1, 0.6235294, 1,
-0.1816634, 1.47599, -0.9325709, 0, 1, 0.627451, 1,
-0.1792408, 0.2661172, -2.050549, 0, 1, 0.6352941, 1,
-0.1764634, 0.155101, 0.44478, 0, 1, 0.6392157, 1,
-0.1731073, 1.038738, -0.3862697, 0, 1, 0.6470588, 1,
-0.1711676, -0.5338342, -2.53283, 0, 1, 0.6509804, 1,
-0.1704005, -0.3294714, -3.210552, 0, 1, 0.6588235, 1,
-0.1694449, 0.4089635, -0.1351435, 0, 1, 0.6627451, 1,
-0.1693795, 0.2129046, -2.365072, 0, 1, 0.6705883, 1,
-0.1678626, -1.515331, -3.981639, 0, 1, 0.6745098, 1,
-0.1662945, 0.138656, 0.6076564, 0, 1, 0.682353, 1,
-0.1638906, 0.06390507, 0.2941317, 0, 1, 0.6862745, 1,
-0.1598435, 1.800406, 0.7996922, 0, 1, 0.6941177, 1,
-0.1567246, 1.265925, 2.015417, 0, 1, 0.7019608, 1,
-0.1562055, 1.92586, -0.3503692, 0, 1, 0.7058824, 1,
-0.1545056, -1.665654, -0.8675155, 0, 1, 0.7137255, 1,
-0.1535837, -1.010058, -2.281378, 0, 1, 0.7176471, 1,
-0.1506348, -1.546535, -2.570945, 0, 1, 0.7254902, 1,
-0.1502476, 1.531112, -0.9145703, 0, 1, 0.7294118, 1,
-0.1473003, 0.9305605, -1.793675, 0, 1, 0.7372549, 1,
-0.1463193, 1.127113, 0.2959296, 0, 1, 0.7411765, 1,
-0.1417234, 1.120656, 0.1516435, 0, 1, 0.7490196, 1,
-0.1356091, 0.2162502, -0.4883317, 0, 1, 0.7529412, 1,
-0.1265805, 1.484618, 0.4868422, 0, 1, 0.7607843, 1,
-0.1244525, -0.6416481, -1.397233, 0, 1, 0.7647059, 1,
-0.1220479, 2.348289, -1.189973, 0, 1, 0.772549, 1,
-0.1219353, -0.1860203, -2.125916, 0, 1, 0.7764706, 1,
-0.120061, -0.796444, -3.175133, 0, 1, 0.7843137, 1,
-0.1189859, 0.7875847, 0.3796743, 0, 1, 0.7882353, 1,
-0.112173, 0.7654026, -0.5752797, 0, 1, 0.7960784, 1,
-0.1090407, -0.6202918, -4.130939, 0, 1, 0.8039216, 1,
-0.1061487, 1.006741, -1.514234, 0, 1, 0.8078431, 1,
-0.1055631, -0.8688887, -2.976433, 0, 1, 0.8156863, 1,
-0.1046771, -0.3700559, -3.771027, 0, 1, 0.8196079, 1,
-0.1036441, -0.5145292, -4.176731, 0, 1, 0.827451, 1,
-0.1032684, -0.1254449, -1.661495, 0, 1, 0.8313726, 1,
-0.1010096, 1.540027, 0.8914062, 0, 1, 0.8392157, 1,
-0.09859584, 0.2325307, 1.291572, 0, 1, 0.8431373, 1,
-0.09393147, 0.969994, 0.07701885, 0, 1, 0.8509804, 1,
-0.09331754, -0.205942, 0.9901454, 0, 1, 0.854902, 1,
-0.09191544, 0.1416026, -0.7011471, 0, 1, 0.8627451, 1,
-0.09125043, -0.4445642, -3.42417, 0, 1, 0.8666667, 1,
-0.08878943, 0.1659095, -0.7313688, 0, 1, 0.8745098, 1,
-0.08163042, -0.04174394, -3.023144, 0, 1, 0.8784314, 1,
-0.08155397, -0.3480747, -3.720368, 0, 1, 0.8862745, 1,
-0.08133542, 0.6281853, 1.147129, 0, 1, 0.8901961, 1,
-0.08070946, 0.540105, -0.4512104, 0, 1, 0.8980392, 1,
-0.08045007, 1.27459, -1.257853, 0, 1, 0.9058824, 1,
-0.07916757, -0.4816956, -3.272221, 0, 1, 0.9098039, 1,
-0.07036345, 0.4901202, -0.6644394, 0, 1, 0.9176471, 1,
-0.06720091, 0.4411009, 0.4411972, 0, 1, 0.9215686, 1,
-0.06535193, -1.09936, -2.333331, 0, 1, 0.9294118, 1,
-0.06387768, -0.2624748, -2.334165, 0, 1, 0.9333333, 1,
-0.05963122, -0.8051387, -2.471688, 0, 1, 0.9411765, 1,
-0.05891742, 0.5684149, 0.4290464, 0, 1, 0.945098, 1,
-0.05651668, -1.469756, -3.053585, 0, 1, 0.9529412, 1,
-0.05639569, -0.1113583, -1.346931, 0, 1, 0.9568627, 1,
-0.05524054, -1.238364, -4.57042, 0, 1, 0.9647059, 1,
-0.05205785, 0.2727903, 0.6499422, 0, 1, 0.9686275, 1,
-0.05184678, -1.092361, -3.159937, 0, 1, 0.9764706, 1,
-0.04706592, -1.40261, -3.336656, 0, 1, 0.9803922, 1,
-0.04676864, 1.06807, -0.5586198, 0, 1, 0.9882353, 1,
-0.04624569, 1.353774, -1.091376, 0, 1, 0.9921569, 1,
-0.04519385, -0.5658823, -4.209716, 0, 1, 1, 1,
-0.04309839, 0.02907612, -0.4341741, 0, 0.9921569, 1, 1,
-0.04181216, -2.41458, -1.803765, 0, 0.9882353, 1, 1,
-0.04159106, -1.3901, -3.045907, 0, 0.9803922, 1, 1,
-0.04130536, -0.6305383, -1.7827, 0, 0.9764706, 1, 1,
-0.03977968, 0.3304586, -1.661603, 0, 0.9686275, 1, 1,
-0.03481959, -0.2197172, -2.272037, 0, 0.9647059, 1, 1,
-0.03113012, -0.6317363, -2.899114, 0, 0.9568627, 1, 1,
-0.02549432, -1.266327, -3.467577, 0, 0.9529412, 1, 1,
-0.02235715, -0.4892597, -2.414196, 0, 0.945098, 1, 1,
-0.02065248, 0.3519991, 0.8540131, 0, 0.9411765, 1, 1,
-0.01514284, 1.376657, 1.447094, 0, 0.9333333, 1, 1,
0.001758599, -1.210765, 3.197102, 0, 0.9294118, 1, 1,
0.002221357, 0.1958581, -0.7728578, 0, 0.9215686, 1, 1,
0.002347841, -1.025546, 2.824625, 0, 0.9176471, 1, 1,
0.01039423, -0.08621746, 3.821947, 0, 0.9098039, 1, 1,
0.01197661, 0.3219986, -1.991606, 0, 0.9058824, 1, 1,
0.01614472, 1.022107, 1.357115, 0, 0.8980392, 1, 1,
0.028863, -0.2682117, 3.02185, 0, 0.8901961, 1, 1,
0.02971455, 1.056246, 0.7899777, 0, 0.8862745, 1, 1,
0.03361389, 0.8998694, -0.5483427, 0, 0.8784314, 1, 1,
0.03821199, 0.6817629, -0.2381639, 0, 0.8745098, 1, 1,
0.03926706, 0.3961929, -0.1673047, 0, 0.8666667, 1, 1,
0.04401321, 0.876961, 1.411866, 0, 0.8627451, 1, 1,
0.0467761, 0.3686898, 0.3781106, 0, 0.854902, 1, 1,
0.04983524, -0.1043986, 1.573689, 0, 0.8509804, 1, 1,
0.05124646, 1.440036, 0.6544852, 0, 0.8431373, 1, 1,
0.05531118, -1.141962, 2.659659, 0, 0.8392157, 1, 1,
0.05555415, -0.6639252, 5.067427, 0, 0.8313726, 1, 1,
0.05915758, 2.220701, -0.75992, 0, 0.827451, 1, 1,
0.06167241, -0.1426529, 1.992167, 0, 0.8196079, 1, 1,
0.06206733, 0.1462192, 0.6426306, 0, 0.8156863, 1, 1,
0.06611351, -0.2094773, 4.081797, 0, 0.8078431, 1, 1,
0.06672823, 1.919205, -0.8462324, 0, 0.8039216, 1, 1,
0.06937109, -0.4024, 3.361572, 0, 0.7960784, 1, 1,
0.07059994, 0.01746722, 0.3642612, 0, 0.7882353, 1, 1,
0.07223018, 0.5816585, -0.8354847, 0, 0.7843137, 1, 1,
0.07383846, 1.787089, -0.03720414, 0, 0.7764706, 1, 1,
0.08292435, -1.248289, 3.575782, 0, 0.772549, 1, 1,
0.08416307, -0.8101369, 3.832596, 0, 0.7647059, 1, 1,
0.0864615, -1.056453, 2.715431, 0, 0.7607843, 1, 1,
0.09330709, -0.4355889, 2.944521, 0, 0.7529412, 1, 1,
0.09524717, -0.5559234, 3.407377, 0, 0.7490196, 1, 1,
0.09559978, 1.448265, 0.9140049, 0, 0.7411765, 1, 1,
0.09720652, 0.2276365, -0.7266133, 0, 0.7372549, 1, 1,
0.100179, -0.1274911, 2.826337, 0, 0.7294118, 1, 1,
0.1125242, 1.373281, -1.083973, 0, 0.7254902, 1, 1,
0.1165347, 1.119523, 1.232854, 0, 0.7176471, 1, 1,
0.1199151, 1.927794, 0.1169343, 0, 0.7137255, 1, 1,
0.1210072, -0.3861012, 4.054042, 0, 0.7058824, 1, 1,
0.1259017, -0.9359431, 3.671408, 0, 0.6980392, 1, 1,
0.1282621, 0.9023979, -0.1015396, 0, 0.6941177, 1, 1,
0.1321441, 0.7905367, -1.737053, 0, 0.6862745, 1, 1,
0.1326893, 0.2073345, 0.7034882, 0, 0.682353, 1, 1,
0.1383169, 0.01883028, 2.29036, 0, 0.6745098, 1, 1,
0.1399729, -1.042463, 1.466239, 0, 0.6705883, 1, 1,
0.1418636, -0.1354835, 3.603169, 0, 0.6627451, 1, 1,
0.1420426, -0.2094892, 2.162343, 0, 0.6588235, 1, 1,
0.1450631, -1.41908, 2.304832, 0, 0.6509804, 1, 1,
0.1472764, -1.4558, 2.659059, 0, 0.6470588, 1, 1,
0.1480483, 0.5465044, 1.079776, 0, 0.6392157, 1, 1,
0.1490581, 0.5161069, -2.519475, 0, 0.6352941, 1, 1,
0.1527433, 0.5241458, -0.05366367, 0, 0.627451, 1, 1,
0.1529598, -0.4138587, 2.570113, 0, 0.6235294, 1, 1,
0.153151, -0.7296954, 3.215893, 0, 0.6156863, 1, 1,
0.1549922, -0.4348188, 4.06221, 0, 0.6117647, 1, 1,
0.1551293, 0.7097592, 0.896955, 0, 0.6039216, 1, 1,
0.1555158, 1.647031, 0.9283322, 0, 0.5960785, 1, 1,
0.1555426, -0.2386512, 1.985591, 0, 0.5921569, 1, 1,
0.1575073, -0.6636844, 3.270087, 0, 0.5843138, 1, 1,
0.1603507, 1.612619, 0.8465453, 0, 0.5803922, 1, 1,
0.1618043, 0.6495192, 0.493737, 0, 0.572549, 1, 1,
0.1635221, -0.6780196, 2.691467, 0, 0.5686275, 1, 1,
0.1653279, 0.3293374, -0.5584987, 0, 0.5607843, 1, 1,
0.1662223, 0.3236597, 0.5353665, 0, 0.5568628, 1, 1,
0.1667798, 0.02859503, 3.265865, 0, 0.5490196, 1, 1,
0.1689461, 0.02432921, 3.155015, 0, 0.5450981, 1, 1,
0.169966, 0.06091473, 1.382633, 0, 0.5372549, 1, 1,
0.1711725, 1.642719, 0.2534649, 0, 0.5333334, 1, 1,
0.1729525, 1.48569, -1.050551, 0, 0.5254902, 1, 1,
0.1776378, 0.114859, 0.567805, 0, 0.5215687, 1, 1,
0.1790419, -2.404697, 3.170117, 0, 0.5137255, 1, 1,
0.1884604, -0.5881824, 1.218991, 0, 0.509804, 1, 1,
0.1996404, 1.504349, -1.489687, 0, 0.5019608, 1, 1,
0.2052873, 0.09880508, -1.595353, 0, 0.4941176, 1, 1,
0.2057363, 0.6403033, -0.5142186, 0, 0.4901961, 1, 1,
0.2067881, -0.827445, 3.119948, 0, 0.4823529, 1, 1,
0.206992, -0.3420492, 1.290159, 0, 0.4784314, 1, 1,
0.2166049, 0.153731, 1.975467, 0, 0.4705882, 1, 1,
0.2166116, -1.365449, 3.160305, 0, 0.4666667, 1, 1,
0.2237525, 0.1570557, 0.9941703, 0, 0.4588235, 1, 1,
0.2272991, 0.2612449, 1.306556, 0, 0.454902, 1, 1,
0.228805, 0.3715526, -0.4863538, 0, 0.4470588, 1, 1,
0.2289526, -0.3599736, 3.237137, 0, 0.4431373, 1, 1,
0.2315796, 0.799329, 2.16369, 0, 0.4352941, 1, 1,
0.2352574, 1.424409, -0.189106, 0, 0.4313726, 1, 1,
0.2401017, 0.5613043, 2.155398, 0, 0.4235294, 1, 1,
0.2408396, -0.8486379, 2.405878, 0, 0.4196078, 1, 1,
0.2421858, 0.5350045, -0.07586318, 0, 0.4117647, 1, 1,
0.2422756, -1.430757, 2.84083, 0, 0.4078431, 1, 1,
0.244188, -0.05065784, 1.403077, 0, 0.4, 1, 1,
0.2477005, -1.030361, 3.025797, 0, 0.3921569, 1, 1,
0.2522442, 0.620871, 0.06077946, 0, 0.3882353, 1, 1,
0.2536, 0.9624998, -0.4856579, 0, 0.3803922, 1, 1,
0.2538095, 1.500199, -0.7816818, 0, 0.3764706, 1, 1,
0.254984, -0.8042266, 3.417618, 0, 0.3686275, 1, 1,
0.2606879, 0.9506796, -0.4803914, 0, 0.3647059, 1, 1,
0.262042, -2.365613, 2.496647, 0, 0.3568628, 1, 1,
0.2629211, 0.1086732, 0.615369, 0, 0.3529412, 1, 1,
0.2651277, 1.312757, -0.2319175, 0, 0.345098, 1, 1,
0.2670899, -0.4314363, 2.921224, 0, 0.3411765, 1, 1,
0.268027, 1.847914, 0.02250731, 0, 0.3333333, 1, 1,
0.2735783, -0.381067, 3.017462, 0, 0.3294118, 1, 1,
0.2767918, 0.8701977, 0.3729542, 0, 0.3215686, 1, 1,
0.2787289, 0.3591585, 1.088659, 0, 0.3176471, 1, 1,
0.2790675, 0.6858841, 1.097257, 0, 0.3098039, 1, 1,
0.2812404, -1.133278, 2.018128, 0, 0.3058824, 1, 1,
0.2819439, -0.5724267, 1.454397, 0, 0.2980392, 1, 1,
0.2837237, -0.4850785, 1.470992, 0, 0.2901961, 1, 1,
0.2838813, 0.1144809, 1.309773, 0, 0.2862745, 1, 1,
0.2859749, 1.509263, -1.077646, 0, 0.2784314, 1, 1,
0.2872592, -1.19775, 3.827971, 0, 0.2745098, 1, 1,
0.2984227, -1.255605, 2.597012, 0, 0.2666667, 1, 1,
0.3005286, -0.3296078, 3.121969, 0, 0.2627451, 1, 1,
0.3013854, 0.7373698, -0.02607585, 0, 0.254902, 1, 1,
0.3047842, -0.6334001, 4.97878, 0, 0.2509804, 1, 1,
0.3070339, -0.02031309, 0.2245261, 0, 0.2431373, 1, 1,
0.3120927, -0.1194509, 3.948843, 0, 0.2392157, 1, 1,
0.3157201, 0.1434371, 0.8626233, 0, 0.2313726, 1, 1,
0.3230186, -1.079936, 3.340943, 0, 0.227451, 1, 1,
0.3256839, -0.2958871, 2.090833, 0, 0.2196078, 1, 1,
0.3267826, -0.5413822, 2.505921, 0, 0.2156863, 1, 1,
0.3276612, -1.30085, 4.858439, 0, 0.2078431, 1, 1,
0.3329468, -1.457525, 1.908835, 0, 0.2039216, 1, 1,
0.3363991, 0.7709483, -0.7432283, 0, 0.1960784, 1, 1,
0.3378467, -0.7397833, 2.492171, 0, 0.1882353, 1, 1,
0.3409493, -0.8973923, 1.196738, 0, 0.1843137, 1, 1,
0.3428392, -0.9150237, 1.95354, 0, 0.1764706, 1, 1,
0.343694, 0.7360187, 0.2832661, 0, 0.172549, 1, 1,
0.3447163, 1.129172, 1.129221, 0, 0.1647059, 1, 1,
0.3465302, -1.230077, 3.096372, 0, 0.1607843, 1, 1,
0.3470892, 0.8459865, 1.231601, 0, 0.1529412, 1, 1,
0.3495952, 0.3682041, 1.328711, 0, 0.1490196, 1, 1,
0.3584139, -1.531563, 3.38932, 0, 0.1411765, 1, 1,
0.3662379, -0.1271235, 1.960951, 0, 0.1372549, 1, 1,
0.3679178, 0.9300001, 2.324039, 0, 0.1294118, 1, 1,
0.3693653, 1.519318, -0.9520323, 0, 0.1254902, 1, 1,
0.3717676, 0.3190753, -0.4596354, 0, 0.1176471, 1, 1,
0.3766301, 1.241993, -1.109571, 0, 0.1137255, 1, 1,
0.3812238, 1.106935, 1.370605, 0, 0.1058824, 1, 1,
0.3812349, 0.06967159, 1.430192, 0, 0.09803922, 1, 1,
0.3813429, 1.853849, 0.4595032, 0, 0.09411765, 1, 1,
0.3834929, -1.584, 1.837658, 0, 0.08627451, 1, 1,
0.3881049, 0.1372688, 1.675072, 0, 0.08235294, 1, 1,
0.3913406, -0.3330424, 2.15768, 0, 0.07450981, 1, 1,
0.3957991, -0.1843664, 1.820613, 0, 0.07058824, 1, 1,
0.3983933, -0.706521, 2.710999, 0, 0.0627451, 1, 1,
0.4078346, 0.9294188, -1.469594, 0, 0.05882353, 1, 1,
0.408527, -0.6019793, 2.406061, 0, 0.05098039, 1, 1,
0.413098, 1.236912, 2.455186, 0, 0.04705882, 1, 1,
0.4170323, 1.538489, -0.6023298, 0, 0.03921569, 1, 1,
0.4182201, 0.1875477, 0.4283815, 0, 0.03529412, 1, 1,
0.4204968, 0.9142691, -0.497089, 0, 0.02745098, 1, 1,
0.4214472, -0.0005623361, -0.3109389, 0, 0.02352941, 1, 1,
0.4261995, 0.5428865, -0.1765714, 0, 0.01568628, 1, 1,
0.4273296, -0.2910189, 0.9344664, 0, 0.01176471, 1, 1,
0.4401348, 1.82222, 0.6858147, 0, 0.003921569, 1, 1,
0.4452083, -0.7836891, 3.826078, 0.003921569, 0, 1, 1,
0.4465854, -0.06075674, 1.110325, 0.007843138, 0, 1, 1,
0.4470319, -0.1271946, 1.624018, 0.01568628, 0, 1, 1,
0.4480567, -0.01344386, 0.5217631, 0.01960784, 0, 1, 1,
0.4545206, -0.9492451, 2.336326, 0.02745098, 0, 1, 1,
0.4562672, 0.7360157, 3.822287, 0.03137255, 0, 1, 1,
0.4577834, -1.445357, 2.230211, 0.03921569, 0, 1, 1,
0.4578213, -0.5500154, 2.209239, 0.04313726, 0, 1, 1,
0.4579035, 0.2283133, 2.880877, 0.05098039, 0, 1, 1,
0.469803, 0.674265, 0.3662373, 0.05490196, 0, 1, 1,
0.4698862, -0.004320856, 2.441944, 0.0627451, 0, 1, 1,
0.4746776, 0.8336022, -0.355321, 0.06666667, 0, 1, 1,
0.4788798, 0.9371932, 2.097769, 0.07450981, 0, 1, 1,
0.4804714, -1.494687, 1.220258, 0.07843138, 0, 1, 1,
0.4822379, -1.1465, 2.429057, 0.08627451, 0, 1, 1,
0.4855841, -0.650495, 3.216192, 0.09019608, 0, 1, 1,
0.4864533, -1.030476, 3.035243, 0.09803922, 0, 1, 1,
0.4927191, -0.07995701, 1.156806, 0.1058824, 0, 1, 1,
0.4928027, -0.6417674, 2.600834, 0.1098039, 0, 1, 1,
0.4973941, -1.004358, 3.99387, 0.1176471, 0, 1, 1,
0.5013477, -0.9809711, 3.658963, 0.1215686, 0, 1, 1,
0.5030144, 0.4599519, 1.151597, 0.1294118, 0, 1, 1,
0.5056116, 2.253071, 1.944299, 0.1333333, 0, 1, 1,
0.5120773, -2.345472, 2.281907, 0.1411765, 0, 1, 1,
0.5188755, -0.8094164, 2.604608, 0.145098, 0, 1, 1,
0.519264, -0.1433108, 3.583352, 0.1529412, 0, 1, 1,
0.5220014, -0.439381, 2.02227, 0.1568628, 0, 1, 1,
0.5247689, 1.087913, 0.6107589, 0.1647059, 0, 1, 1,
0.526751, -1.661767, 2.566222, 0.1686275, 0, 1, 1,
0.5275806, 0.4576096, 1.064737, 0.1764706, 0, 1, 1,
0.5305733, 1.518206, 0.9976653, 0.1803922, 0, 1, 1,
0.5317386, 0.4506764, 0.05787375, 0.1882353, 0, 1, 1,
0.5339087, -1.83737, 2.675143, 0.1921569, 0, 1, 1,
0.541203, -0.739502, 2.802275, 0.2, 0, 1, 1,
0.5440497, 0.2216147, 0.8556194, 0.2078431, 0, 1, 1,
0.5440937, 0.9149172, 0.05615993, 0.2117647, 0, 1, 1,
0.5472783, -0.8543335, 2.046802, 0.2196078, 0, 1, 1,
0.5517303, -1.048155, 2.123308, 0.2235294, 0, 1, 1,
0.5574026, -2.852628, 2.030687, 0.2313726, 0, 1, 1,
0.5594499, 0.1196347, 1.989169, 0.2352941, 0, 1, 1,
0.5617268, 0.7459762, 0.9565395, 0.2431373, 0, 1, 1,
0.5623004, -0.9062306, 3.140505, 0.2470588, 0, 1, 1,
0.5639765, -0.8959672, 1.182464, 0.254902, 0, 1, 1,
0.5695848, -0.4511448, 2.600711, 0.2588235, 0, 1, 1,
0.5719689, 0.3594639, 0.41258, 0.2666667, 0, 1, 1,
0.5724845, -2.17172, 1.467973, 0.2705882, 0, 1, 1,
0.57903, -0.9090528, 1.868472, 0.2784314, 0, 1, 1,
0.5814286, -0.3486504, 2.560805, 0.282353, 0, 1, 1,
0.5823131, 0.07444583, 1.06546, 0.2901961, 0, 1, 1,
0.5834125, 0.1935011, 0.4378633, 0.2941177, 0, 1, 1,
0.5936117, -0.5607191, 2.620847, 0.3019608, 0, 1, 1,
0.5974664, -1.235844, 1.723788, 0.3098039, 0, 1, 1,
0.5980068, 0.9652326, 0.4045072, 0.3137255, 0, 1, 1,
0.6025842, 1.676625, 0.4941692, 0.3215686, 0, 1, 1,
0.6026172, -0.2891366, 2.116457, 0.3254902, 0, 1, 1,
0.6033363, -1.236267, 1.296574, 0.3333333, 0, 1, 1,
0.6053137, -0.5371827, 2.520473, 0.3372549, 0, 1, 1,
0.610635, 1.113435, -0.8240185, 0.345098, 0, 1, 1,
0.6153252, -0.5285722, 1.807901, 0.3490196, 0, 1, 1,
0.6207116, 0.307854, 0.2813512, 0.3568628, 0, 1, 1,
0.6219541, 0.5228058, 0.9612362, 0.3607843, 0, 1, 1,
0.6234713, 0.5705516, -0.2100259, 0.3686275, 0, 1, 1,
0.6292328, 0.4982686, 0.699108, 0.372549, 0, 1, 1,
0.6292632, -0.7635168, 2.437964, 0.3803922, 0, 1, 1,
0.6311347, 2.207026, 0.901046, 0.3843137, 0, 1, 1,
0.6326887, 0.6205889, 0.009727488, 0.3921569, 0, 1, 1,
0.6335655, 0.3721885, 1.62178, 0.3960784, 0, 1, 1,
0.6438377, -0.7325407, 3.023485, 0.4039216, 0, 1, 1,
0.645824, -1.383677, 4.389782, 0.4117647, 0, 1, 1,
0.6513695, -0.7741254, 2.661417, 0.4156863, 0, 1, 1,
0.6553998, -1.54284, 2.269155, 0.4235294, 0, 1, 1,
0.659943, -0.04425607, 2.111703, 0.427451, 0, 1, 1,
0.6621717, 0.2793028, 0.1141287, 0.4352941, 0, 1, 1,
0.6624855, 0.7526156, 0.8711706, 0.4392157, 0, 1, 1,
0.6625541, 0.3611314, 1.649916, 0.4470588, 0, 1, 1,
0.6626341, -0.7302471, 2.176481, 0.4509804, 0, 1, 1,
0.6648675, -0.2093544, 3.333578, 0.4588235, 0, 1, 1,
0.6671394, 0.1062109, 3.614208, 0.4627451, 0, 1, 1,
0.6673925, 1.061373, -0.4853179, 0.4705882, 0, 1, 1,
0.6712238, 0.3812245, 2.516566, 0.4745098, 0, 1, 1,
0.673548, 0.01520036, 2.40966, 0.4823529, 0, 1, 1,
0.6752657, 0.09285957, 3.250061, 0.4862745, 0, 1, 1,
0.6799434, 2.098703, 2.274378, 0.4941176, 0, 1, 1,
0.6902509, -1.651057, 1.801737, 0.5019608, 0, 1, 1,
0.6907212, -0.7343112, 4.348259, 0.5058824, 0, 1, 1,
0.6955072, 0.7296614, -1.689948, 0.5137255, 0, 1, 1,
0.698575, 1.165603, 1.395683, 0.5176471, 0, 1, 1,
0.7029541, -1.452802, 4.017999, 0.5254902, 0, 1, 1,
0.7051435, -1.015783, 2.235062, 0.5294118, 0, 1, 1,
0.7074164, -0.5193921, 2.981614, 0.5372549, 0, 1, 1,
0.708638, 0.9110985, 0.3957373, 0.5411765, 0, 1, 1,
0.7099231, -0.4767834, 2.609362, 0.5490196, 0, 1, 1,
0.7162553, 0.8093003, -1.513547, 0.5529412, 0, 1, 1,
0.7211729, 0.3956397, 1.694551, 0.5607843, 0, 1, 1,
0.7229406, -0.8656827, 4.207877, 0.5647059, 0, 1, 1,
0.726247, 1.744731, 0.4346486, 0.572549, 0, 1, 1,
0.7305674, 1.222839, 0.05951886, 0.5764706, 0, 1, 1,
0.7314906, -0.4526012, 0.5219508, 0.5843138, 0, 1, 1,
0.7359291, -1.402834, 3.174731, 0.5882353, 0, 1, 1,
0.7371292, 1.537032, 2.278971, 0.5960785, 0, 1, 1,
0.7402571, 0.2952252, 0.5687333, 0.6039216, 0, 1, 1,
0.740519, 0.1117275, -0.3282286, 0.6078432, 0, 1, 1,
0.7427002, 1.658209, -0.5440833, 0.6156863, 0, 1, 1,
0.7437164, -0.8783612, 3.579998, 0.6196079, 0, 1, 1,
0.7462555, 1.61929, 2.406229, 0.627451, 0, 1, 1,
0.7537321, -0.9674045, 0.8017389, 0.6313726, 0, 1, 1,
0.7562997, -0.1579874, 2.752536, 0.6392157, 0, 1, 1,
0.7614402, 2.794393, 0.04137529, 0.6431373, 0, 1, 1,
0.7659775, 1.183064, 1.381331, 0.6509804, 0, 1, 1,
0.7668471, 0.3467326, 1.528089, 0.654902, 0, 1, 1,
0.7674968, -0.8473675, 2.62247, 0.6627451, 0, 1, 1,
0.7682109, 0.9745615, 0.8770777, 0.6666667, 0, 1, 1,
0.7700805, 1.326714, 1.148144, 0.6745098, 0, 1, 1,
0.7713912, -0.1197728, 1.145936, 0.6784314, 0, 1, 1,
0.7777312, 0.5133972, 0.6385533, 0.6862745, 0, 1, 1,
0.7779943, -0.9854077, 3.405795, 0.6901961, 0, 1, 1,
0.7801604, -0.3234737, 3.06987, 0.6980392, 0, 1, 1,
0.782171, 0.5129312, 2.024455, 0.7058824, 0, 1, 1,
0.7829527, 1.299409, 0.5534248, 0.7098039, 0, 1, 1,
0.7850289, -0.07184093, 0.257199, 0.7176471, 0, 1, 1,
0.7860427, 0.2617439, 1.673615, 0.7215686, 0, 1, 1,
0.7871809, -0.01625186, 0.7523213, 0.7294118, 0, 1, 1,
0.789031, 0.6145679, -1.515847, 0.7333333, 0, 1, 1,
0.7901863, -0.7693003, 1.850884, 0.7411765, 0, 1, 1,
0.796536, 0.8193565, -1.64922, 0.7450981, 0, 1, 1,
0.8003432, -2.199055, 5.110685, 0.7529412, 0, 1, 1,
0.8101885, 0.06174062, -0.01349931, 0.7568628, 0, 1, 1,
0.8136966, 0.5388703, 2.137152, 0.7647059, 0, 1, 1,
0.81538, 0.0654764, 3.153691, 0.7686275, 0, 1, 1,
0.8169515, 0.7215621, 2.415139, 0.7764706, 0, 1, 1,
0.8215626, -0.4808927, 2.158427, 0.7803922, 0, 1, 1,
0.8282776, -0.249714, 1.580387, 0.7882353, 0, 1, 1,
0.8314509, 0.09240771, 0.2301364, 0.7921569, 0, 1, 1,
0.8319229, -0.01645092, 0.4222025, 0.8, 0, 1, 1,
0.8329756, 1.860154, 0.1728796, 0.8078431, 0, 1, 1,
0.8360822, -1.628076, 2.310076, 0.8117647, 0, 1, 1,
0.8369042, -0.1632213, 0.7055822, 0.8196079, 0, 1, 1,
0.8427452, -2.121296, 2.779769, 0.8235294, 0, 1, 1,
0.8446192, -0.3886904, 1.735773, 0.8313726, 0, 1, 1,
0.8501882, -0.2607158, 1.619346, 0.8352941, 0, 1, 1,
0.8535912, 2.523986, 0.1195896, 0.8431373, 0, 1, 1,
0.8600248, 1.535212, 1.472515, 0.8470588, 0, 1, 1,
0.8606623, 1.347354, 0.03524429, 0.854902, 0, 1, 1,
0.8636554, 2.275454, 0.258671, 0.8588235, 0, 1, 1,
0.8648151, -0.3527186, 3.359377, 0.8666667, 0, 1, 1,
0.8660716, 0.4894362, 1.499616, 0.8705882, 0, 1, 1,
0.8664554, 0.658805, 0.4915802, 0.8784314, 0, 1, 1,
0.8716041, -1.205791, 1.946266, 0.8823529, 0, 1, 1,
0.8741955, -0.9885217, 1.754097, 0.8901961, 0, 1, 1,
0.876279, 1.158058, -0.4923586, 0.8941177, 0, 1, 1,
0.8774352, 1.273342, 2.503042, 0.9019608, 0, 1, 1,
0.881484, 0.4303305, -0.2342233, 0.9098039, 0, 1, 1,
0.8848952, 0.9547848, 0.9855351, 0.9137255, 0, 1, 1,
0.8914827, -1.187449, 3.332781, 0.9215686, 0, 1, 1,
0.8958498, -1.430463, 3.67663, 0.9254902, 0, 1, 1,
0.8996803, 1.182026, 0.397065, 0.9333333, 0, 1, 1,
0.900396, 0.8739942, 1.184624, 0.9372549, 0, 1, 1,
0.9027902, -1.359269, 2.342662, 0.945098, 0, 1, 1,
0.9071282, 1.088613, -0.2680003, 0.9490196, 0, 1, 1,
0.9094448, -0.2500935, 0.8377817, 0.9568627, 0, 1, 1,
0.9157338, -0.3416989, 1.918934, 0.9607843, 0, 1, 1,
0.9165251, -0.7974668, 2.431139, 0.9686275, 0, 1, 1,
0.9177282, 1.383563, -2.496605, 0.972549, 0, 1, 1,
0.9205735, 0.07880701, 2.042775, 0.9803922, 0, 1, 1,
0.9273708, 0.5740238, 0.04366281, 0.9843137, 0, 1, 1,
0.9331241, 0.9032363, 2.146772, 0.9921569, 0, 1, 1,
0.9343103, -0.0272855, 1.542346, 0.9960784, 0, 1, 1,
0.9416502, -0.7722051, 4.039108, 1, 0, 0.9960784, 1,
0.9424731, 0.5555926, 0.8012775, 1, 0, 0.9882353, 1,
0.951229, -0.3710064, 3.020505, 1, 0, 0.9843137, 1,
0.956716, -0.05569019, 2.273324, 1, 0, 0.9764706, 1,
0.9583436, 0.151606, 1.577967, 1, 0, 0.972549, 1,
0.9585136, 1.009525, -0.01762893, 1, 0, 0.9647059, 1,
0.9682063, 0.9936174, 1.563977, 1, 0, 0.9607843, 1,
0.9718143, 0.381539, 1.114051, 1, 0, 0.9529412, 1,
0.9783989, 0.7732231, 1.71508, 1, 0, 0.9490196, 1,
0.9877664, 0.8901109, 2.287035, 1, 0, 0.9411765, 1,
0.9893553, -0.9304108, 1.62014, 1, 0, 0.9372549, 1,
0.9913845, 1.486327, 0.4125941, 1, 0, 0.9294118, 1,
0.9959934, -0.12982, 0.7150549, 1, 0, 0.9254902, 1,
1.005581, -1.974096, 2.605335, 1, 0, 0.9176471, 1,
1.011422, 0.7807994, 1.026546, 1, 0, 0.9137255, 1,
1.011572, 1.357337, 0.6552697, 1, 0, 0.9058824, 1,
1.011657, 0.7237586, 2.253549, 1, 0, 0.9019608, 1,
1.013549, 1.130101, 0.8813298, 1, 0, 0.8941177, 1,
1.024615, -0.6272393, -0.373096, 1, 0, 0.8862745, 1,
1.028239, -2.482194, 3.534576, 1, 0, 0.8823529, 1,
1.030119, -0.4963736, 2.667563, 1, 0, 0.8745098, 1,
1.031084, -0.3786086, 1.513533, 1, 0, 0.8705882, 1,
1.035403, 0.8294813, 0.1844888, 1, 0, 0.8627451, 1,
1.03574, 0.4935944, 0.971267, 1, 0, 0.8588235, 1,
1.038898, -0.6920295, 2.647967, 1, 0, 0.8509804, 1,
1.041711, 0.3203929, -0.6946825, 1, 0, 0.8470588, 1,
1.046977, -1.724558, 3.158971, 1, 0, 0.8392157, 1,
1.059187, 0.7801381, 2.34399, 1, 0, 0.8352941, 1,
1.062711, -0.7789682, -0.3089749, 1, 0, 0.827451, 1,
1.064067, 0.07160851, 2.143759, 1, 0, 0.8235294, 1,
1.073599, 1.348017, 0.03342617, 1, 0, 0.8156863, 1,
1.079415, -0.7868398, 2.100546, 1, 0, 0.8117647, 1,
1.085944, -0.6987408, 1.924066, 1, 0, 0.8039216, 1,
1.093752, -0.3401917, 1.688315, 1, 0, 0.7960784, 1,
1.110183, 0.3613459, 1.26808, 1, 0, 0.7921569, 1,
1.134655, 0.850017, 0.1767138, 1, 0, 0.7843137, 1,
1.134809, 1.025211, -0.02116388, 1, 0, 0.7803922, 1,
1.136047, -1.188061, 1.160629, 1, 0, 0.772549, 1,
1.143427, -1.140843, 2.765011, 1, 0, 0.7686275, 1,
1.148354, -0.6283816, 3.257004, 1, 0, 0.7607843, 1,
1.149471, -0.3780201, 2.751983, 1, 0, 0.7568628, 1,
1.1533, 1.285507, 1.466294, 1, 0, 0.7490196, 1,
1.155447, -0.9126318, 2.774677, 1, 0, 0.7450981, 1,
1.155496, 0.8595507, 1.365418, 1, 0, 0.7372549, 1,
1.156465, -0.02182943, 2.232314, 1, 0, 0.7333333, 1,
1.158982, 0.4890674, 1.54405, 1, 0, 0.7254902, 1,
1.175765, -1.852322, 2.70172, 1, 0, 0.7215686, 1,
1.175977, -0.5651962, 0.8416054, 1, 0, 0.7137255, 1,
1.180221, 0.5326712, 1.981557, 1, 0, 0.7098039, 1,
1.180487, 0.4158649, -0.05279112, 1, 0, 0.7019608, 1,
1.195389, 1.858524, 1.075284, 1, 0, 0.6941177, 1,
1.197507, 1.953228, -0.8600601, 1, 0, 0.6901961, 1,
1.220108, -0.7109985, 1.955676, 1, 0, 0.682353, 1,
1.228237, 0.2169984, 1.799128, 1, 0, 0.6784314, 1,
1.229379, -1.060504, 3.470399, 1, 0, 0.6705883, 1,
1.234261, 0.5540742, 0.9103451, 1, 0, 0.6666667, 1,
1.24023, 0.2891108, 1.313464, 1, 0, 0.6588235, 1,
1.242713, 1.629049, 1.178903, 1, 0, 0.654902, 1,
1.24798, -0.2415802, 1.427679, 1, 0, 0.6470588, 1,
1.250854, 0.2641478, 2.058582, 1, 0, 0.6431373, 1,
1.250966, -0.1088936, 2.205661, 1, 0, 0.6352941, 1,
1.257589, -1.035197, 2.626575, 1, 0, 0.6313726, 1,
1.258914, 0.2943717, 2.117357, 1, 0, 0.6235294, 1,
1.273751, 1.040585, 1.1797, 1, 0, 0.6196079, 1,
1.281648, -0.0160433, 1.249552, 1, 0, 0.6117647, 1,
1.283942, -0.5868412, 0.2294932, 1, 0, 0.6078432, 1,
1.284, 0.3139359, 0.7882336, 1, 0, 0.6, 1,
1.289518, -0.1558771, 2.075248, 1, 0, 0.5921569, 1,
1.291442, 1.839058, 0.837051, 1, 0, 0.5882353, 1,
1.29406, -0.00404641, 0.3843624, 1, 0, 0.5803922, 1,
1.299773, -1.010726, 4.544812, 1, 0, 0.5764706, 1,
1.300904, 0.3497337, 1.445073, 1, 0, 0.5686275, 1,
1.301746, 1.180227, 2.768139, 1, 0, 0.5647059, 1,
1.303455, 1.681136, 0.4839938, 1, 0, 0.5568628, 1,
1.310175, 0.4509648, 1.142582, 1, 0, 0.5529412, 1,
1.313216, 0.299352, 1.532067, 1, 0, 0.5450981, 1,
1.340285, 0.3751186, 0.8154535, 1, 0, 0.5411765, 1,
1.344865, 0.481235, 2.096173, 1, 0, 0.5333334, 1,
1.350058, 1.680301, 1.645506, 1, 0, 0.5294118, 1,
1.361579, -1.049035, 1.5681, 1, 0, 0.5215687, 1,
1.366953, 0.08711243, 2.625362, 1, 0, 0.5176471, 1,
1.376631, -0.2331218, 1.874613, 1, 0, 0.509804, 1,
1.391207, 0.06754599, 0.7242746, 1, 0, 0.5058824, 1,
1.396912, 0.3682483, 3.185214, 1, 0, 0.4980392, 1,
1.401903, -1.324959, 3.761571, 1, 0, 0.4901961, 1,
1.40462, -0.3981767, 2.364148, 1, 0, 0.4862745, 1,
1.407219, -0.04096039, -0.02037888, 1, 0, 0.4784314, 1,
1.410946, 1.714315, 1.092636, 1, 0, 0.4745098, 1,
1.416865, -0.5729768, 3.65815, 1, 0, 0.4666667, 1,
1.418773, 1.609439, 1.387179, 1, 0, 0.4627451, 1,
1.422008, -1.870155, 1.953645, 1, 0, 0.454902, 1,
1.42535, -0.1442291, 1.169997, 1, 0, 0.4509804, 1,
1.431092, -0.7569774, 1.868086, 1, 0, 0.4431373, 1,
1.438056, 0.4407055, 1.363468, 1, 0, 0.4392157, 1,
1.446736, 0.3147991, 1.882323, 1, 0, 0.4313726, 1,
1.453709, 1.97273, 0.3265193, 1, 0, 0.427451, 1,
1.456132, 0.6405818, 0.7314786, 1, 0, 0.4196078, 1,
1.459216, 0.3577469, 1.424764, 1, 0, 0.4156863, 1,
1.465471, -2.48054, 2.474264, 1, 0, 0.4078431, 1,
1.471889, -0.2267624, -1.863008, 1, 0, 0.4039216, 1,
1.486344, -0.08676677, 0.8382342, 1, 0, 0.3960784, 1,
1.510383, -0.8311208, 1.274495, 1, 0, 0.3882353, 1,
1.519375, 1.560915, 2.257889, 1, 0, 0.3843137, 1,
1.536614, 1.000898, -0.00993645, 1, 0, 0.3764706, 1,
1.539706, -0.6355364, 2.327805, 1, 0, 0.372549, 1,
1.573944, 0.2176538, 1.775646, 1, 0, 0.3647059, 1,
1.589266, 0.220361, 0.5548303, 1, 0, 0.3607843, 1,
1.608722, 0.8480344, 1.062642, 1, 0, 0.3529412, 1,
1.612708, -0.02400097, 1.342892, 1, 0, 0.3490196, 1,
1.61561, 0.8106741, 2.437137, 1, 0, 0.3411765, 1,
1.615981, -0.4925754, 2.134619, 1, 0, 0.3372549, 1,
1.624097, 0.1443498, 0.1540251, 1, 0, 0.3294118, 1,
1.629839, -0.2639143, 0.791245, 1, 0, 0.3254902, 1,
1.631521, 0.4473155, -0.218264, 1, 0, 0.3176471, 1,
1.633425, -0.2387677, 1.265445, 1, 0, 0.3137255, 1,
1.635079, 0.07392005, 0.4703524, 1, 0, 0.3058824, 1,
1.647249, -0.659048, 3.778312, 1, 0, 0.2980392, 1,
1.649718, 1.10233, -0.5676903, 1, 0, 0.2941177, 1,
1.655236, -0.1999034, 1.356746, 1, 0, 0.2862745, 1,
1.659323, -0.05017623, 1.798321, 1, 0, 0.282353, 1,
1.694315, -1.179438, 0.7452622, 1, 0, 0.2745098, 1,
1.696639, -0.860579, 1.163179, 1, 0, 0.2705882, 1,
1.704437, 0.03615268, -0.09255823, 1, 0, 0.2627451, 1,
1.723619, -0.7604708, 2.159993, 1, 0, 0.2588235, 1,
1.726525, 0.2135344, -0.008698801, 1, 0, 0.2509804, 1,
1.739326, -0.1958188, 1.908298, 1, 0, 0.2470588, 1,
1.752181, -0.4834779, -0.1018091, 1, 0, 0.2392157, 1,
1.755742, 0.9493806, 1.33514, 1, 0, 0.2352941, 1,
1.766159, -0.1029079, 1.793897, 1, 0, 0.227451, 1,
1.78107, -0.4457355, 1.923618, 1, 0, 0.2235294, 1,
1.801324, 1.368837, -0.5360874, 1, 0, 0.2156863, 1,
1.81398, -0.6669462, 0.7577308, 1, 0, 0.2117647, 1,
1.824271, 0.6577507, 1.690458, 1, 0, 0.2039216, 1,
1.900154, -0.190228, 1.47308, 1, 0, 0.1960784, 1,
1.935095, -1.254711, 4.047016, 1, 0, 0.1921569, 1,
1.94254, -0.5386662, 2.647089, 1, 0, 0.1843137, 1,
1.949641, -0.7661566, 2.255192, 1, 0, 0.1803922, 1,
2.053553, 0.7724304, 0.9953294, 1, 0, 0.172549, 1,
2.054026, -0.3631364, 4.062841, 1, 0, 0.1686275, 1,
2.070156, 0.7469652, 1.243137, 1, 0, 0.1607843, 1,
2.093019, -0.05786245, 1.926354, 1, 0, 0.1568628, 1,
2.142884, -0.1004513, 2.022981, 1, 0, 0.1490196, 1,
2.203824, -0.4080784, 1.95657, 1, 0, 0.145098, 1,
2.236163, -0.6874545, 1.375176, 1, 0, 0.1372549, 1,
2.240226, -0.3198336, 2.761567, 1, 0, 0.1333333, 1,
2.270025, 1.360468, 1.064911, 1, 0, 0.1254902, 1,
2.336073, -0.6721299, 1.565661, 1, 0, 0.1215686, 1,
2.350429, 0.1422041, 1.172194, 1, 0, 0.1137255, 1,
2.380615, -1.590203, 2.089463, 1, 0, 0.1098039, 1,
2.419082, -0.3044634, -0.3233213, 1, 0, 0.1019608, 1,
2.42633, -0.4975201, 2.242711, 1, 0, 0.09411765, 1,
2.426372, -1.569249, 0.1346923, 1, 0, 0.09019608, 1,
2.441576, -1.304556, 2.719755, 1, 0, 0.08235294, 1,
2.460182, -0.4861813, 1.944603, 1, 0, 0.07843138, 1,
2.469679, -1.568307, 2.387849, 1, 0, 0.07058824, 1,
2.477593, -0.7309632, 2.835802, 1, 0, 0.06666667, 1,
2.569213, 0.02264995, -0.4467444, 1, 0, 0.05882353, 1,
2.641322, 0.2865851, 1.517933, 1, 0, 0.05490196, 1,
2.693761, 0.2696553, 0.652459, 1, 0, 0.04705882, 1,
2.717284, -0.4117513, -0.1109502, 1, 0, 0.04313726, 1,
2.744557, -0.8653031, 3.244143, 1, 0, 0.03529412, 1,
2.786627, 0.09183728, 0.7159497, 1, 0, 0.03137255, 1,
2.814799, 0.2142215, 2.14401, 1, 0, 0.02352941, 1,
2.821951, -1.174507, 2.948441, 1, 0, 0.01960784, 1,
2.848619, -0.1315307, 1.353819, 1, 0, 0.01176471, 1,
3.309005, -0.5208961, 2.935074, 1, 0, 0.007843138, 1
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
-0.006911278, -3.834304, -6.452901, 0, -0.5, 0.5, 0.5,
-0.006911278, -3.834304, -6.452901, 1, -0.5, 0.5, 0.5,
-0.006911278, -3.834304, -6.452901, 1, 1.5, 0.5, 0.5,
-0.006911278, -3.834304, -6.452901, 0, 1.5, 0.5, 0.5
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
-4.446923, 0.04317307, -6.452901, 0, -0.5, 0.5, 0.5,
-4.446923, 0.04317307, -6.452901, 1, -0.5, 0.5, 0.5,
-4.446923, 0.04317307, -6.452901, 1, 1.5, 0.5, 0.5,
-4.446923, 0.04317307, -6.452901, 0, 1.5, 0.5, 0.5
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
-4.446923, -3.834304, 0.1668687, 0, -0.5, 0.5, 0.5,
-4.446923, -3.834304, 0.1668687, 1, -0.5, 0.5, 0.5,
-4.446923, -3.834304, 0.1668687, 1, 1.5, 0.5, 0.5,
-4.446923, -3.834304, 0.1668687, 0, 1.5, 0.5, 0.5
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
-3, -2.939502, -4.925262,
3, -2.939502, -4.925262,
-3, -2.939502, -4.925262,
-3, -3.088635, -5.179869,
-2, -2.939502, -4.925262,
-2, -3.088635, -5.179869,
-1, -2.939502, -4.925262,
-1, -3.088635, -5.179869,
0, -2.939502, -4.925262,
0, -3.088635, -5.179869,
1, -2.939502, -4.925262,
1, -3.088635, -5.179869,
2, -2.939502, -4.925262,
2, -3.088635, -5.179869,
3, -2.939502, -4.925262,
3, -3.088635, -5.179869
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
-3, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
-3, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
-3, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
-3, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
-2, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
-2, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
-2, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
-2, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
-1, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
-1, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
-1, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
-1, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
0, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
0, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
0, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
0, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
1, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
1, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
1, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
1, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
2, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
2, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
2, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
2, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5,
3, -3.386903, -5.689082, 0, -0.5, 0.5, 0.5,
3, -3.386903, -5.689082, 1, -0.5, 0.5, 0.5,
3, -3.386903, -5.689082, 1, 1.5, 0.5, 0.5,
3, -3.386903, -5.689082, 0, 1.5, 0.5, 0.5
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
-3.422305, -2, -4.925262,
-3.422305, 2, -4.925262,
-3.422305, -2, -4.925262,
-3.593075, -2, -5.179869,
-3.422305, -1, -4.925262,
-3.593075, -1, -5.179869,
-3.422305, 0, -4.925262,
-3.593075, 0, -5.179869,
-3.422305, 1, -4.925262,
-3.593075, 1, -5.179869,
-3.422305, 2, -4.925262,
-3.593075, 2, -5.179869
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
-3.934614, -2, -5.689082, 0, -0.5, 0.5, 0.5,
-3.934614, -2, -5.689082, 1, -0.5, 0.5, 0.5,
-3.934614, -2, -5.689082, 1, 1.5, 0.5, 0.5,
-3.934614, -2, -5.689082, 0, 1.5, 0.5, 0.5,
-3.934614, -1, -5.689082, 0, -0.5, 0.5, 0.5,
-3.934614, -1, -5.689082, 1, -0.5, 0.5, 0.5,
-3.934614, -1, -5.689082, 1, 1.5, 0.5, 0.5,
-3.934614, -1, -5.689082, 0, 1.5, 0.5, 0.5,
-3.934614, 0, -5.689082, 0, -0.5, 0.5, 0.5,
-3.934614, 0, -5.689082, 1, -0.5, 0.5, 0.5,
-3.934614, 0, -5.689082, 1, 1.5, 0.5, 0.5,
-3.934614, 0, -5.689082, 0, 1.5, 0.5, 0.5,
-3.934614, 1, -5.689082, 0, -0.5, 0.5, 0.5,
-3.934614, 1, -5.689082, 1, -0.5, 0.5, 0.5,
-3.934614, 1, -5.689082, 1, 1.5, 0.5, 0.5,
-3.934614, 1, -5.689082, 0, 1.5, 0.5, 0.5,
-3.934614, 2, -5.689082, 0, -0.5, 0.5, 0.5,
-3.934614, 2, -5.689082, 1, -0.5, 0.5, 0.5,
-3.934614, 2, -5.689082, 1, 1.5, 0.5, 0.5,
-3.934614, 2, -5.689082, 0, 1.5, 0.5, 0.5
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
-3.422305, -2.939502, -4,
-3.422305, -2.939502, 4,
-3.422305, -2.939502, -4,
-3.593075, -3.088635, -4,
-3.422305, -2.939502, -2,
-3.593075, -3.088635, -2,
-3.422305, -2.939502, 0,
-3.593075, -3.088635, 0,
-3.422305, -2.939502, 2,
-3.593075, -3.088635, 2,
-3.422305, -2.939502, 4,
-3.593075, -3.088635, 4
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
-3.934614, -3.386903, -4, 0, -0.5, 0.5, 0.5,
-3.934614, -3.386903, -4, 1, -0.5, 0.5, 0.5,
-3.934614, -3.386903, -4, 1, 1.5, 0.5, 0.5,
-3.934614, -3.386903, -4, 0, 1.5, 0.5, 0.5,
-3.934614, -3.386903, -2, 0, -0.5, 0.5, 0.5,
-3.934614, -3.386903, -2, 1, -0.5, 0.5, 0.5,
-3.934614, -3.386903, -2, 1, 1.5, 0.5, 0.5,
-3.934614, -3.386903, -2, 0, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 0, 0, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 0, 1, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 0, 1, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 0, 0, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 2, 0, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 2, 1, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 2, 1, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 2, 0, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 4, 0, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 4, 1, -0.5, 0.5, 0.5,
-3.934614, -3.386903, 4, 1, 1.5, 0.5, 0.5,
-3.934614, -3.386903, 4, 0, 1.5, 0.5, 0.5
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
-3.422305, -2.939502, -4.925262,
-3.422305, 3.025848, -4.925262,
-3.422305, -2.939502, 5.258999,
-3.422305, 3.025848, 5.258999,
-3.422305, -2.939502, -4.925262,
-3.422305, -2.939502, 5.258999,
-3.422305, 3.025848, -4.925262,
-3.422305, 3.025848, 5.258999,
-3.422305, -2.939502, -4.925262,
3.408483, -2.939502, -4.925262,
-3.422305, -2.939502, 5.258999,
3.408483, -2.939502, 5.258999,
-3.422305, 3.025848, -4.925262,
3.408483, 3.025848, -4.925262,
-3.422305, 3.025848, 5.258999,
3.408483, 3.025848, 5.258999,
3.408483, -2.939502, -4.925262,
3.408483, 3.025848, -4.925262,
3.408483, -2.939502, 5.258999,
3.408483, 3.025848, 5.258999,
3.408483, -2.939502, -4.925262,
3.408483, -2.939502, 5.258999,
3.408483, 3.025848, -4.925262,
3.408483, 3.025848, 5.258999
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
var radius = 7.281824;
var distance = 32.39766;
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
mvMatrix.translate( 0.006911278, -0.04317307, -0.1668687 );
mvMatrix.scale( 1.152612, 1.319831, 0.7730802 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.39766);
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
ethychlozate<-read.table("ethychlozate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethychlozate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
```

```r
y<-ethychlozate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
```

```r
z<-ethychlozate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
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
-3.322828, 0.6576438, -3.604509, 0, 0, 1, 1, 1,
-3.09342, -2.37333, -1.359339, 1, 0, 0, 1, 1,
-2.854524, -0.04061305, -0.8977148, 1, 0, 0, 1, 1,
-2.812459, 0.6933426, -1.198219, 1, 0, 0, 1, 1,
-2.664491, -0.6227685, -0.2139532, 1, 0, 0, 1, 1,
-2.618409, 1.080535, -1.473274, 1, 0, 0, 1, 1,
-2.438309, -0.5077093, -2.851043, 0, 0, 0, 1, 1,
-2.417058, 0.1768183, -1.795529, 0, 0, 0, 1, 1,
-2.388724, 0.549988, -2.032061, 0, 0, 0, 1, 1,
-2.312173, -0.894063, -1.885808, 0, 0, 0, 1, 1,
-2.290539, 1.212657, -1.322439, 0, 0, 0, 1, 1,
-2.262917, 0.2065314, -1.469771, 0, 0, 0, 1, 1,
-2.075929, 0.6577585, -1.97039, 0, 0, 0, 1, 1,
-2.074934, 0.237717, -2.489936, 1, 1, 1, 1, 1,
-2.069127, -0.00561391, -0.2807206, 1, 1, 1, 1, 1,
-2.007981, 1.138244, -1.933239, 1, 1, 1, 1, 1,
-2.004097, -2.73505, -1.144065, 1, 1, 1, 1, 1,
-1.942469, -1.341765, -3.006348, 1, 1, 1, 1, 1,
-1.919712, 0.2082239, -1.342191, 1, 1, 1, 1, 1,
-1.91861, 0.6946508, -2.433923, 1, 1, 1, 1, 1,
-1.908413, 1.925584, -0.7241265, 1, 1, 1, 1, 1,
-1.894371, -0.9398124, -3.537137, 1, 1, 1, 1, 1,
-1.841204, 0.5679325, -3.415597, 1, 1, 1, 1, 1,
-1.839273, -1.341125, -2.068419, 1, 1, 1, 1, 1,
-1.832637, -0.0817193, -1.130663, 1, 1, 1, 1, 1,
-1.830708, 0.1363766, -1.459563, 1, 1, 1, 1, 1,
-1.789821, -0.1642021, -1.12814, 1, 1, 1, 1, 1,
-1.774185, -0.439133, -1.553706, 1, 1, 1, 1, 1,
-1.765123, -0.8038471, -1.84822, 0, 0, 1, 1, 1,
-1.758123, -0.002580755, -1.140846, 1, 0, 0, 1, 1,
-1.749242, -0.3259453, -1.704331, 1, 0, 0, 1, 1,
-1.736408, 1.590405, -3.085981, 1, 0, 0, 1, 1,
-1.718776, 1.499448, -0.3543107, 1, 0, 0, 1, 1,
-1.717866, -0.3910077, -1.743523, 1, 0, 0, 1, 1,
-1.707427, -0.4023085, -0.9323176, 0, 0, 0, 1, 1,
-1.707058, -1.339461, -2.836482, 0, 0, 0, 1, 1,
-1.70248, 1.031858, 1.463404, 0, 0, 0, 1, 1,
-1.689993, 0.0005820884, -1.581127, 0, 0, 0, 1, 1,
-1.688213, 0.03026656, -3.425312, 0, 0, 0, 1, 1,
-1.684833, -0.7741543, -1.237597, 0, 0, 0, 1, 1,
-1.677647, 0.3548068, -0.7331693, 0, 0, 0, 1, 1,
-1.674007, -1.214259, -2.183836, 1, 1, 1, 1, 1,
-1.657919, 1.720461, -1.976304, 1, 1, 1, 1, 1,
-1.653815, -0.9620354, -3.82959, 1, 1, 1, 1, 1,
-1.651081, -0.5445777, -3.752199, 1, 1, 1, 1, 1,
-1.643835, -0.8250547, -2.963696, 1, 1, 1, 1, 1,
-1.631907, -0.574383, -0.05096243, 1, 1, 1, 1, 1,
-1.621169, 0.485305, -2.688533, 1, 1, 1, 1, 1,
-1.619381, 1.264296, -1.345415, 1, 1, 1, 1, 1,
-1.610846, -0.05755731, -1.312003, 1, 1, 1, 1, 1,
-1.602814, 0.09517074, -1.275538, 1, 1, 1, 1, 1,
-1.585616, 1.514513, 0.1633548, 1, 1, 1, 1, 1,
-1.58463, -0.1136158, -2.125172, 1, 1, 1, 1, 1,
-1.580125, 0.1562808, -2.879597, 1, 1, 1, 1, 1,
-1.579592, 0.02210458, -1.45994, 1, 1, 1, 1, 1,
-1.573182, 0.1204212, -2.255389, 1, 1, 1, 1, 1,
-1.567668, -0.5282108, -2.83958, 0, 0, 1, 1, 1,
-1.544309, -0.8236809, -0.9887432, 1, 0, 0, 1, 1,
-1.521608, -0.03830097, -0.4852991, 1, 0, 0, 1, 1,
-1.499835, 0.209969, 0.6875167, 1, 0, 0, 1, 1,
-1.494798, -0.6412923, -2.224506, 1, 0, 0, 1, 1,
-1.493572, 0.8757697, 1.15897, 1, 0, 0, 1, 1,
-1.480863, 0.2994231, -0.7028377, 0, 0, 0, 1, 1,
-1.463443, 0.7083972, -0.2949777, 0, 0, 0, 1, 1,
-1.462328, 0.9606663, -2.068571, 0, 0, 0, 1, 1,
-1.46049, -1.060436, -0.5147059, 0, 0, 0, 1, 1,
-1.45928, 2.097537, -1.203243, 0, 0, 0, 1, 1,
-1.457219, 1.074465, 0.2277747, 0, 0, 0, 1, 1,
-1.439768, -1.039, -3.010902, 0, 0, 0, 1, 1,
-1.424507, 0.0213402, -2.69102, 1, 1, 1, 1, 1,
-1.41903, -0.6090951, -1.174247, 1, 1, 1, 1, 1,
-1.41189, 0.4854564, -0.9510724, 1, 1, 1, 1, 1,
-1.402224, -0.3931825, -2.023294, 1, 1, 1, 1, 1,
-1.402159, 1.655382, -1.87432, 1, 1, 1, 1, 1,
-1.400036, 0.4024955, -1.219604, 1, 1, 1, 1, 1,
-1.379954, -1.586678, -1.777824, 1, 1, 1, 1, 1,
-1.374074, -1.125564, -2.60341, 1, 1, 1, 1, 1,
-1.356679, -0.668188, -1.85929, 1, 1, 1, 1, 1,
-1.356531, -0.7603937, -0.3584516, 1, 1, 1, 1, 1,
-1.356464, 0.4076377, -2.763089, 1, 1, 1, 1, 1,
-1.350031, 0.7049202, -0.9744726, 1, 1, 1, 1, 1,
-1.349599, 0.6869615, 2.118505, 1, 1, 1, 1, 1,
-1.339751, 0.1425911, -0.4077465, 1, 1, 1, 1, 1,
-1.323514, -0.8606919, -1.47365, 1, 1, 1, 1, 1,
-1.320294, 0.02102003, -1.478701, 0, 0, 1, 1, 1,
-1.319766, -0.3005193, -1.591825, 1, 0, 0, 1, 1,
-1.317042, 0.2733111, -1.123701, 1, 0, 0, 1, 1,
-1.311328, -2.277596, -2.724771, 1, 0, 0, 1, 1,
-1.30042, -0.1587806, -1.167644, 1, 0, 0, 1, 1,
-1.298946, 0.5820898, -0.8352245, 1, 0, 0, 1, 1,
-1.296544, 0.8607157, -1.77713, 0, 0, 0, 1, 1,
-1.295138, -0.7097329, -2.355375, 0, 0, 0, 1, 1,
-1.294559, -0.9621995, -1.002374, 0, 0, 0, 1, 1,
-1.292564, 0.4323827, -2.261002, 0, 0, 0, 1, 1,
-1.279225, -0.001954457, -1.80689, 0, 0, 0, 1, 1,
-1.274634, -0.9467962, -3.164901, 0, 0, 0, 1, 1,
-1.274273, 1.380493, -0.2020464, 0, 0, 0, 1, 1,
-1.265136, -0.4242764, -1.977014, 1, 1, 1, 1, 1,
-1.264729, 0.8291484, -1.272072, 1, 1, 1, 1, 1,
-1.258005, 1.641683, 0.02509558, 1, 1, 1, 1, 1,
-1.248121, 0.433852, -0.5808302, 1, 1, 1, 1, 1,
-1.242655, 0.1330343, -0.3927053, 1, 1, 1, 1, 1,
-1.238051, 2.305205, -1.070296, 1, 1, 1, 1, 1,
-1.232584, -0.4191365, -2.008851, 1, 1, 1, 1, 1,
-1.232455, -0.6872405, -0.9984031, 1, 1, 1, 1, 1,
-1.231273, 1.373463, -1.077163, 1, 1, 1, 1, 1,
-1.206396, 1.3799, 0.4901517, 1, 1, 1, 1, 1,
-1.205376, 0.2541307, -3.170441, 1, 1, 1, 1, 1,
-1.191403, 0.5501679, -0.9034616, 1, 1, 1, 1, 1,
-1.190303, 2.751571, 0.5057393, 1, 1, 1, 1, 1,
-1.190292, 1.116578, -0.3492307, 1, 1, 1, 1, 1,
-1.187129, 0.09646868, -1.225381, 1, 1, 1, 1, 1,
-1.184245, -0.8129019, -2.312401, 0, 0, 1, 1, 1,
-1.176138, -0.08172508, -2.964145, 1, 0, 0, 1, 1,
-1.174158, 0.3393436, -2.260427, 1, 0, 0, 1, 1,
-1.173861, -0.7878426, -2.948792, 1, 0, 0, 1, 1,
-1.173011, 0.3097107, -2.113701, 1, 0, 0, 1, 1,
-1.169038, 0.08907919, -1.968107, 1, 0, 0, 1, 1,
-1.16183, 0.4377224, -1.83935, 0, 0, 0, 1, 1,
-1.160768, -2.255793, -2.532865, 0, 0, 0, 1, 1,
-1.157235, -0.3558275, -3.790725, 0, 0, 0, 1, 1,
-1.148575, 0.1939687, -1.115719, 0, 0, 0, 1, 1,
-1.134107, 0.2766955, -3.154226, 0, 0, 0, 1, 1,
-1.12451, 1.940112, -0.5131328, 0, 0, 0, 1, 1,
-1.123808, -0.301524, -1.529004, 0, 0, 0, 1, 1,
-1.118169, 1.777245, -0.1984943, 1, 1, 1, 1, 1,
-1.109568, 1.210338, -0.06610285, 1, 1, 1, 1, 1,
-1.107065, 0.2772929, -2.510928, 1, 1, 1, 1, 1,
-1.105977, 0.4053498, -0.3816169, 1, 1, 1, 1, 1,
-1.097209, -0.7036334, -1.251592, 1, 1, 1, 1, 1,
-1.092343, 0.7444082, -2.372301, 1, 1, 1, 1, 1,
-1.089979, -1.456293, -3.125875, 1, 1, 1, 1, 1,
-1.082672, -0.2835287, -3.067645, 1, 1, 1, 1, 1,
-1.075356, 0.7113456, 0.2999973, 1, 1, 1, 1, 1,
-1.068967, -0.9079517, -2.138634, 1, 1, 1, 1, 1,
-1.068945, -0.5791842, -2.216112, 1, 1, 1, 1, 1,
-1.06459, 2.343012, -0.4625358, 1, 1, 1, 1, 1,
-1.053944, -1.503254, -4.641091, 1, 1, 1, 1, 1,
-1.047069, 0.01894386, -3.098546, 1, 1, 1, 1, 1,
-1.046079, -0.6587862, -2.481653, 1, 1, 1, 1, 1,
-1.045996, 0.2973728, -1.614138, 0, 0, 1, 1, 1,
-1.039093, -2.320797, -2.353947, 1, 0, 0, 1, 1,
-1.032072, 0.06046195, -1.158726, 1, 0, 0, 1, 1,
-1.025451, 0.1032443, -2.931651, 1, 0, 0, 1, 1,
-1.018409, 2.281527, -0.3328929, 1, 0, 0, 1, 1,
-1.013617, -0.8157769, -1.012318, 1, 0, 0, 1, 1,
-1.011157, 1.710958, 0.1394986, 0, 0, 0, 1, 1,
-1.00385, 1.79053, -0.4671291, 0, 0, 0, 1, 1,
-1.00382, 0.9203511, -1.577007, 0, 0, 0, 1, 1,
-0.9983565, -0.1441517, -0.3545312, 0, 0, 0, 1, 1,
-0.9961098, -0.3605316, -1.593669, 0, 0, 0, 1, 1,
-0.9954062, -2.113342, -3.06896, 0, 0, 0, 1, 1,
-0.9945511, 1.415661, -2.481081, 0, 0, 0, 1, 1,
-0.9941135, 0.1667647, -1.781699, 1, 1, 1, 1, 1,
-0.9907457, 0.0008371166, -0.9424581, 1, 1, 1, 1, 1,
-0.9773594, -2.699528, -3.983905, 1, 1, 1, 1, 1,
-0.9714026, -0.1271733, -1.331154, 1, 1, 1, 1, 1,
-0.9442924, -1.492285, -1.754572, 1, 1, 1, 1, 1,
-0.9433387, 2.091366, -2.814054, 1, 1, 1, 1, 1,
-0.9355175, -0.01083308, -2.822036, 1, 1, 1, 1, 1,
-0.9285877, 0.7311739, -0.7462145, 1, 1, 1, 1, 1,
-0.9280507, 1.625042, -0.8144158, 1, 1, 1, 1, 1,
-0.9270777, 0.7567443, -2.492843, 1, 1, 1, 1, 1,
-0.9221782, 0.1934767, 0.4550261, 1, 1, 1, 1, 1,
-0.9220588, -0.1309471, -2.739175, 1, 1, 1, 1, 1,
-0.9203292, -0.8649961, -3.52319, 1, 1, 1, 1, 1,
-0.9094486, -0.2579876, -2.104668, 1, 1, 1, 1, 1,
-0.8973286, -0.3028318, -3.140622, 1, 1, 1, 1, 1,
-0.8960619, 1.114843, -1.58642, 0, 0, 1, 1, 1,
-0.8955363, 0.09178949, -0.8385158, 1, 0, 0, 1, 1,
-0.8930703, 0.39608, -3.411216, 1, 0, 0, 1, 1,
-0.8925949, 0.6454909, -1.057392, 1, 0, 0, 1, 1,
-0.8902107, -0.7168328, -1.418697, 1, 0, 0, 1, 1,
-0.8788446, -1.168129, -1.715757, 1, 0, 0, 1, 1,
-0.8780823, -1.525729, -3.172777, 0, 0, 0, 1, 1,
-0.8749743, -0.4881584, -0.7458854, 0, 0, 0, 1, 1,
-0.8746011, -0.7943378, -3.570376, 0, 0, 0, 1, 1,
-0.8742591, -2.602953, -2.876693, 0, 0, 0, 1, 1,
-0.873509, 0.3004159, -1.25425, 0, 0, 0, 1, 1,
-0.8732991, 1.044646, -2.723017, 0, 0, 0, 1, 1,
-0.8720618, 0.1236049, -0.8408058, 0, 0, 0, 1, 1,
-0.8697481, -0.4149819, -2.351467, 1, 1, 1, 1, 1,
-0.8682555, 2.049027, 1.249271, 1, 1, 1, 1, 1,
-0.8623587, -0.9240863, -4.214955, 1, 1, 1, 1, 1,
-0.8549736, 1.925643, 0.5270159, 1, 1, 1, 1, 1,
-0.8541578, 1.590495, -1.558333, 1, 1, 1, 1, 1,
-0.8538266, 1.371846, -1.150961, 1, 1, 1, 1, 1,
-0.8512678, -0.2436523, -2.538721, 1, 1, 1, 1, 1,
-0.8455244, -1.899846, -3.328995, 1, 1, 1, 1, 1,
-0.8444663, -0.2501359, -0.9779404, 1, 1, 1, 1, 1,
-0.8437859, 0.6468234, -0.9018445, 1, 1, 1, 1, 1,
-0.8429239, -0.2341883, -2.289711, 1, 1, 1, 1, 1,
-0.8393539, 0.5257264, -0.8244087, 1, 1, 1, 1, 1,
-0.8377689, -0.397133, -1.936037, 1, 1, 1, 1, 1,
-0.8311575, 0.0788406, -2.119045, 1, 1, 1, 1, 1,
-0.8277621, 0.174988, -1.364596, 1, 1, 1, 1, 1,
-0.8250268, 0.490412, -3.295548, 0, 0, 1, 1, 1,
-0.8188599, -0.8361967, -2.090408, 1, 0, 0, 1, 1,
-0.8167576, 0.08644395, -1.171759, 1, 0, 0, 1, 1,
-0.8086237, 0.02109888, -0.6689626, 1, 0, 0, 1, 1,
-0.8010657, -0.03933726, -3.801967, 1, 0, 0, 1, 1,
-0.7959178, -0.136636, -1.866171, 1, 0, 0, 1, 1,
-0.7946612, 0.587711, 0.2895719, 0, 0, 0, 1, 1,
-0.7914844, -0.7742834, -3.559415, 0, 0, 0, 1, 1,
-0.7848105, 1.231738, -1.781916, 0, 0, 0, 1, 1,
-0.7846275, 0.1893335, -0.7579201, 0, 0, 0, 1, 1,
-0.7835162, -1.004313, -1.542928, 0, 0, 0, 1, 1,
-0.7831815, 0.5297717, -0.8076634, 0, 0, 0, 1, 1,
-0.7802778, -0.07844095, -0.7394846, 0, 0, 0, 1, 1,
-0.7797104, 1.337384, 1.004627, 1, 1, 1, 1, 1,
-0.778104, -0.4223705, -1.583738, 1, 1, 1, 1, 1,
-0.7755096, -1.640585, -3.429783, 1, 1, 1, 1, 1,
-0.7730991, 0.6741397, -0.2656051, 1, 1, 1, 1, 1,
-0.7729425, -1.154348, -1.362265, 1, 1, 1, 1, 1,
-0.7668093, -1.349346, -2.383446, 1, 1, 1, 1, 1,
-0.7641086, -0.4592489, -1.525418, 1, 1, 1, 1, 1,
-0.7570853, 0.8580284, -0.8110378, 1, 1, 1, 1, 1,
-0.7568804, -0.7868895, -3.135201, 1, 1, 1, 1, 1,
-0.7534901, 0.2740748, -0.8369769, 1, 1, 1, 1, 1,
-0.7519923, 0.8158858, -0.6823679, 1, 1, 1, 1, 1,
-0.7511232, -0.1948243, -3.97402, 1, 1, 1, 1, 1,
-0.7504249, -0.505947, -1.480873, 1, 1, 1, 1, 1,
-0.7429901, -0.3036907, -3.634782, 1, 1, 1, 1, 1,
-0.7427657, -1.036474, -2.686178, 1, 1, 1, 1, 1,
-0.7411267, -0.7498813, -1.337323, 0, 0, 1, 1, 1,
-0.7390595, 0.2138993, -2.886917, 1, 0, 0, 1, 1,
-0.7356948, 0.7312383, -0.9255423, 1, 0, 0, 1, 1,
-0.7309109, 0.8688151, -1.492968, 1, 0, 0, 1, 1,
-0.7297541, -1.070995, -2.106472, 1, 0, 0, 1, 1,
-0.7293156, 0.2589691, -0.1958521, 1, 0, 0, 1, 1,
-0.7274975, 0.3210077, -1.373656, 0, 0, 0, 1, 1,
-0.7222422, 1.881747, 1.055906, 0, 0, 0, 1, 1,
-0.7178648, -0.3407972, -2.479729, 0, 0, 0, 1, 1,
-0.7119395, 0.07103444, -0.3030972, 0, 0, 0, 1, 1,
-0.7101531, -0.1383711, -0.6261069, 0, 0, 0, 1, 1,
-0.708438, 0.4354867, -2.166922, 0, 0, 0, 1, 1,
-0.7036796, -2.213655, -0.8194308, 0, 0, 0, 1, 1,
-0.6993756, -0.4246573, -0.5532308, 1, 1, 1, 1, 1,
-0.6986505, 1.024095, 0.2845663, 1, 1, 1, 1, 1,
-0.6962934, 0.3952819, -2.367178, 1, 1, 1, 1, 1,
-0.6932065, 1.397999, 0.6225728, 1, 1, 1, 1, 1,
-0.6850637, -1.104325, -0.8621837, 1, 1, 1, 1, 1,
-0.6825696, 1.780272, -1.435119, 1, 1, 1, 1, 1,
-0.681449, 0.3350134, -0.6843241, 1, 1, 1, 1, 1,
-0.6788466, 0.4422274, -1.508426, 1, 1, 1, 1, 1,
-0.678824, 1.507461, -0.6449941, 1, 1, 1, 1, 1,
-0.6725932, 0.5449694, -0.5399783, 1, 1, 1, 1, 1,
-0.6697878, -0.5977175, -3.250863, 1, 1, 1, 1, 1,
-0.6582773, -0.9706728, -3.597003, 1, 1, 1, 1, 1,
-0.6530597, -0.5533097, -2.445107, 1, 1, 1, 1, 1,
-0.6484696, -0.1297788, -1.580113, 1, 1, 1, 1, 1,
-0.6447462, 2.345266, -0.4713649, 1, 1, 1, 1, 1,
-0.6408978, 0.2711447, -1.247223, 0, 0, 1, 1, 1,
-0.6402262, -0.5201087, -2.164032, 1, 0, 0, 1, 1,
-0.6368479, -0.893854, -1.252547, 1, 0, 0, 1, 1,
-0.6278257, 0.05358693, -3.276526, 1, 0, 0, 1, 1,
-0.6277768, 0.3167949, -1.525558, 1, 0, 0, 1, 1,
-0.6255854, 1.011368, -2.627818, 1, 0, 0, 1, 1,
-0.6255058, -1.807174, -1.564622, 0, 0, 0, 1, 1,
-0.6212441, -1.06196, -2.281325, 0, 0, 0, 1, 1,
-0.6167896, -0.5475889, -2.8748, 0, 0, 0, 1, 1,
-0.6120364, 0.5232858, -0.9416256, 0, 0, 0, 1, 1,
-0.6106725, 0.09312554, -2.125734, 0, 0, 0, 1, 1,
-0.6105139, 0.4445, -1.315284, 0, 0, 0, 1, 1,
-0.6093996, -0.7726782, -1.450784, 0, 0, 0, 1, 1,
-0.5997259, 0.6127659, -1.620441, 1, 1, 1, 1, 1,
-0.5957096, -0.6445591, -3.089304, 1, 1, 1, 1, 1,
-0.5956918, 0.2795907, -3.135035, 1, 1, 1, 1, 1,
-0.5888387, 1.641859, -1.28827, 1, 1, 1, 1, 1,
-0.5851309, 0.264288, -1.45663, 1, 1, 1, 1, 1,
-0.5826707, -0.3523291, -0.630955, 1, 1, 1, 1, 1,
-0.5823259, 2.124204, 0.1945079, 1, 1, 1, 1, 1,
-0.5790497, -0.3891025, -1.819599, 1, 1, 1, 1, 1,
-0.5781652, 0.6286529, -1.468786, 1, 1, 1, 1, 1,
-0.5771317, 1.248664, -0.7853618, 1, 1, 1, 1, 1,
-0.5744792, 1.03083, -2.193759, 1, 1, 1, 1, 1,
-0.5727757, -0.1032964, -1.064644, 1, 1, 1, 1, 1,
-0.5700544, -2.120021, -4.393329, 1, 1, 1, 1, 1,
-0.5681171, -0.7538562, -3.005899, 1, 1, 1, 1, 1,
-0.567218, -0.6574306, -1.794663, 1, 1, 1, 1, 1,
-0.56549, -0.6253028, -1.773562, 0, 0, 1, 1, 1,
-0.5630811, 0.9316005, -0.3996703, 1, 0, 0, 1, 1,
-0.5626615, 0.1944361, -1.441633, 1, 0, 0, 1, 1,
-0.5611496, 0.5259445, -1.187883, 1, 0, 0, 1, 1,
-0.5610468, -1.260157, -1.219352, 1, 0, 0, 1, 1,
-0.5583855, -1.229645, -3.079411, 1, 0, 0, 1, 1,
-0.5583714, -0.3135833, -1.793763, 0, 0, 0, 1, 1,
-0.5579702, 0.8951292, -0.6421794, 0, 0, 0, 1, 1,
-0.5497211, 0.4557991, -2.790891, 0, 0, 0, 1, 1,
-0.5480238, -1.459838, -2.337811, 0, 0, 0, 1, 1,
-0.5458154, 0.2729113, -1.864739, 0, 0, 0, 1, 1,
-0.5439197, 0.8560132, -0.04307446, 0, 0, 0, 1, 1,
-0.5399866, 1.550393, -0.1024998, 0, 0, 0, 1, 1,
-0.5398825, 1.602584, 0.4934158, 1, 1, 1, 1, 1,
-0.5397276, 0.02443572, -1.402524, 1, 1, 1, 1, 1,
-0.5392184, -0.285979, -3.665313, 1, 1, 1, 1, 1,
-0.5385554, -0.04776097, 0.07487375, 1, 1, 1, 1, 1,
-0.5383596, 0.1322204, -1.696142, 1, 1, 1, 1, 1,
-0.5360147, -0.5218914, -0.5565547, 1, 1, 1, 1, 1,
-0.5316017, 0.5965039, -1.948547, 1, 1, 1, 1, 1,
-0.529214, -1.810567, -4.386471, 1, 1, 1, 1, 1,
-0.5281923, 0.3347222, -1.296094, 1, 1, 1, 1, 1,
-0.5222185, 0.2705628, 0.01284109, 1, 1, 1, 1, 1,
-0.5189217, 0.2422308, 0.4690527, 1, 1, 1, 1, 1,
-0.5099165, -0.472552, -1.847743, 1, 1, 1, 1, 1,
-0.5078517, -2.806262, -4.65491, 1, 1, 1, 1, 1,
-0.5052908, 0.5636763, -0.1482577, 1, 1, 1, 1, 1,
-0.5017874, -0.4605442, -2.308628, 1, 1, 1, 1, 1,
-0.4986639, -0.8486709, -2.265538, 0, 0, 1, 1, 1,
-0.4973065, 0.8264204, 0.03390548, 1, 0, 0, 1, 1,
-0.4963174, 2.40751, -0.1207637, 1, 0, 0, 1, 1,
-0.4952577, -0.579936, -1.799409, 1, 0, 0, 1, 1,
-0.4949962, -0.7609901, -2.688401, 1, 0, 0, 1, 1,
-0.4941655, 0.7898726, 0.7027166, 1, 0, 0, 1, 1,
-0.4931866, -2.444492, -1.977968, 0, 0, 0, 1, 1,
-0.4887241, -0.8568012, -3.611274, 0, 0, 0, 1, 1,
-0.4860398, 0.6602502, -0.1285619, 0, 0, 0, 1, 1,
-0.4807576, 0.2182318, 0.4839863, 0, 0, 0, 1, 1,
-0.4799403, 0.6627258, 1.260657, 0, 0, 0, 1, 1,
-0.4779504, -0.6627362, -3.89316, 0, 0, 0, 1, 1,
-0.4734368, 1.446638, 0.4309942, 0, 0, 0, 1, 1,
-0.4720665, 0.3793972, -1.220305, 1, 1, 1, 1, 1,
-0.471963, -0.4546838, -4.315566, 1, 1, 1, 1, 1,
-0.4699754, -1.629084, -2.218161, 1, 1, 1, 1, 1,
-0.4692606, -0.3670905, -1.015742, 1, 1, 1, 1, 1,
-0.4642493, 0.5766702, -0.7698687, 1, 1, 1, 1, 1,
-0.4621858, 0.6991226, -1.011683, 1, 1, 1, 1, 1,
-0.4535406, 2.938974, -0.9142034, 1, 1, 1, 1, 1,
-0.4520452, -0.4886419, -1.762949, 1, 1, 1, 1, 1,
-0.4486751, 1.288539, -1.457552, 1, 1, 1, 1, 1,
-0.4458243, 2.463392, 0.426301, 1, 1, 1, 1, 1,
-0.4399668, 0.828831, -0.8533469, 1, 1, 1, 1, 1,
-0.439738, 1.338091, 0.3859933, 1, 1, 1, 1, 1,
-0.4394971, 0.03221044, -2.358228, 1, 1, 1, 1, 1,
-0.4385566, 0.1882085, -2.183212, 1, 1, 1, 1, 1,
-0.436807, 0.3497824, -1.825783, 1, 1, 1, 1, 1,
-0.4346949, -0.3975388, -2.858171, 0, 0, 1, 1, 1,
-0.4283955, -0.1229817, -1.292461, 1, 0, 0, 1, 1,
-0.4283549, -0.6594967, -3.908636, 1, 0, 0, 1, 1,
-0.4182973, 0.9945308, 1.379767, 1, 0, 0, 1, 1,
-0.4155151, 1.016355, -0.5565058, 1, 0, 0, 1, 1,
-0.4130053, 0.1916863, 0.06303812, 1, 0, 0, 1, 1,
-0.4114287, -0.7755036, -2.780673, 0, 0, 0, 1, 1,
-0.4072667, -0.3306583, -1.599387, 0, 0, 0, 1, 1,
-0.4060613, 0.04889986, -1.415766, 0, 0, 0, 1, 1,
-0.401305, -0.8810876, -3.740277, 0, 0, 0, 1, 1,
-0.3993387, -0.4266228, -1.847134, 0, 0, 0, 1, 1,
-0.389172, -1.380673, -3.891541, 0, 0, 0, 1, 1,
-0.3808717, 0.4204582, -0.2992615, 0, 0, 0, 1, 1,
-0.3796441, -0.5746221, -3.462087, 1, 1, 1, 1, 1,
-0.3772801, -0.2489158, -2.49506, 1, 1, 1, 1, 1,
-0.374611, 1.085146, 0.5834219, 1, 1, 1, 1, 1,
-0.3742414, -1.234549, -2.839125, 1, 1, 1, 1, 1,
-0.3673853, 0.7547268, -0.9006333, 1, 1, 1, 1, 1,
-0.3672207, -0.8583998, -3.040279, 1, 1, 1, 1, 1,
-0.3600306, -0.1580542, -1.217834, 1, 1, 1, 1, 1,
-0.3588866, -0.2330547, -1.24332, 1, 1, 1, 1, 1,
-0.3586671, 2.067569, 1.752929, 1, 1, 1, 1, 1,
-0.3586236, 1.237655, -1.028647, 1, 1, 1, 1, 1,
-0.3581758, -1.035465, -3.623766, 1, 1, 1, 1, 1,
-0.357531, -1.669421, -3.313848, 1, 1, 1, 1, 1,
-0.3545682, -0.6593078, -3.948926, 1, 1, 1, 1, 1,
-0.3505106, -1.950009, -2.104803, 1, 1, 1, 1, 1,
-0.3493683, -0.5534483, -1.731165, 1, 1, 1, 1, 1,
-0.3479422, 0.3325424, -0.07856391, 0, 0, 1, 1, 1,
-0.346527, -1.135312, -0.2683699, 1, 0, 0, 1, 1,
-0.3433854, -1.397854, -2.566897, 1, 0, 0, 1, 1,
-0.342539, 1.291613, -0.2644577, 1, 0, 0, 1, 1,
-0.3407198, -0.6170356, -3.806944, 1, 0, 0, 1, 1,
-0.3381709, -0.6853343, -1.811053, 1, 0, 0, 1, 1,
-0.3372283, -0.4675291, -3.728916, 0, 0, 0, 1, 1,
-0.3360386, -1.605175, -2.19919, 0, 0, 0, 1, 1,
-0.3298301, 1.924725, -2.270657, 0, 0, 0, 1, 1,
-0.3252797, 0.6244585, -0.432606, 0, 0, 0, 1, 1,
-0.3248039, -0.107447, -1.610506, 0, 0, 0, 1, 1,
-0.3221854, -0.02828349, -3.147324, 0, 0, 0, 1, 1,
-0.3218074, -0.8145216, -3.523182, 0, 0, 0, 1, 1,
-0.3197434, -0.1606941, -2.767677, 1, 1, 1, 1, 1,
-0.3145015, -0.8282139, -4.481458, 1, 1, 1, 1, 1,
-0.311385, -0.7208669, -4.255092, 1, 1, 1, 1, 1,
-0.3048631, -0.7852904, -2.880576, 1, 1, 1, 1, 1,
-0.303108, -0.2364708, -3.257546, 1, 1, 1, 1, 1,
-0.3016617, 0.6829219, -2.086967, 1, 1, 1, 1, 1,
-0.301136, 0.7951142, 0.6488391, 1, 1, 1, 1, 1,
-0.2957931, -0.4266887, -3.466635, 1, 1, 1, 1, 1,
-0.2908235, -0.7583869, 0.3489793, 1, 1, 1, 1, 1,
-0.2902021, -0.3016496, -3.053115, 1, 1, 1, 1, 1,
-0.2886288, -0.5319154, -1.567647, 1, 1, 1, 1, 1,
-0.2857981, -0.5692734, -1.835552, 1, 1, 1, 1, 1,
-0.280246, 0.854225, 0.07038275, 1, 1, 1, 1, 1,
-0.2801085, 0.7144201, -0.8740841, 1, 1, 1, 1, 1,
-0.2790582, 1.368198, -0.6844971, 1, 1, 1, 1, 1,
-0.2781965, -0.7603797, -2.178822, 0, 0, 1, 1, 1,
-0.2736246, -0.7066771, -2.817769, 1, 0, 0, 1, 1,
-0.2701311, 0.1629378, -1.51722, 1, 0, 0, 1, 1,
-0.2632373, 0.4271791, -0.7402319, 1, 0, 0, 1, 1,
-0.2630838, -0.7754555, -1.577959, 1, 0, 0, 1, 1,
-0.2608921, -0.3459293, -4.776947, 1, 0, 0, 1, 1,
-0.259609, -0.230492, 0.1464033, 0, 0, 0, 1, 1,
-0.2591619, -0.01182031, -3.101081, 0, 0, 0, 1, 1,
-0.2573708, 1.043984, -1.749288, 0, 0, 0, 1, 1,
-0.2551248, -0.6541072, -4.272716, 0, 0, 0, 1, 1,
-0.2499438, -1.599657, -4.749541, 0, 0, 0, 1, 1,
-0.2449464, -1.578634, -4.451312, 0, 0, 0, 1, 1,
-0.2435248, 0.6869752, 0.8943298, 0, 0, 0, 1, 1,
-0.2402723, -1.523796, -3.541041, 1, 1, 1, 1, 1,
-0.2348218, -0.6029624, -1.685503, 1, 1, 1, 1, 1,
-0.2319941, -0.150116, -1.624424, 1, 1, 1, 1, 1,
-0.2301828, 0.1760033, -0.1732811, 1, 1, 1, 1, 1,
-0.2280103, 0.4645291, -0.4068668, 1, 1, 1, 1, 1,
-0.2253356, -0.07433566, -1.052091, 1, 1, 1, 1, 1,
-0.2238895, 0.0005876825, -1.111443, 1, 1, 1, 1, 1,
-0.2229743, 0.02134863, -1.020853, 1, 1, 1, 1, 1,
-0.2222081, 0.7776444, -0.7133272, 1, 1, 1, 1, 1,
-0.2198075, -0.8058959, -3.032019, 1, 1, 1, 1, 1,
-0.2165912, 0.4124067, 2.088204, 1, 1, 1, 1, 1,
-0.2135432, 0.2047805, -0.4327342, 1, 1, 1, 1, 1,
-0.2127335, -0.02178858, -1.98007, 1, 1, 1, 1, 1,
-0.2123384, 0.2892947, 0.8090972, 1, 1, 1, 1, 1,
-0.2102871, 0.7581855, 0.4176167, 1, 1, 1, 1, 1,
-0.207893, -0.1704967, -2.430164, 0, 0, 1, 1, 1,
-0.2077336, -0.6819111, -2.476395, 1, 0, 0, 1, 1,
-0.2066912, 1.015699, -0.773864, 1, 0, 0, 1, 1,
-0.2063072, -1.242515, -3.429022, 1, 0, 0, 1, 1,
-0.2053012, -0.2847916, -4.320534, 1, 0, 0, 1, 1,
-0.2039331, 0.6411719, -0.1625123, 1, 0, 0, 1, 1,
-0.2024523, -0.1586898, -2.964722, 0, 0, 0, 1, 1,
-0.2013048, -2.501579, -4.032755, 0, 0, 0, 1, 1,
-0.200642, 0.5856935, 1.47148, 0, 0, 0, 1, 1,
-0.2003498, -0.8539679, -3.348872, 0, 0, 0, 1, 1,
-0.2000573, 0.6611782, 1.335509, 0, 0, 0, 1, 1,
-0.1972639, -0.3619845, -2.409739, 0, 0, 0, 1, 1,
-0.1956896, -0.2616201, -1.869038, 0, 0, 0, 1, 1,
-0.1952932, -0.5595441, -1.915826, 1, 1, 1, 1, 1,
-0.1918927, 0.7778856, -1.021651, 1, 1, 1, 1, 1,
-0.1878877, 0.01012909, -2.666736, 1, 1, 1, 1, 1,
-0.1856203, 0.06822701, -1.566445, 1, 1, 1, 1, 1,
-0.1838297, -0.4090429, -3.335954, 1, 1, 1, 1, 1,
-0.1816634, 1.47599, -0.9325709, 1, 1, 1, 1, 1,
-0.1792408, 0.2661172, -2.050549, 1, 1, 1, 1, 1,
-0.1764634, 0.155101, 0.44478, 1, 1, 1, 1, 1,
-0.1731073, 1.038738, -0.3862697, 1, 1, 1, 1, 1,
-0.1711676, -0.5338342, -2.53283, 1, 1, 1, 1, 1,
-0.1704005, -0.3294714, -3.210552, 1, 1, 1, 1, 1,
-0.1694449, 0.4089635, -0.1351435, 1, 1, 1, 1, 1,
-0.1693795, 0.2129046, -2.365072, 1, 1, 1, 1, 1,
-0.1678626, -1.515331, -3.981639, 1, 1, 1, 1, 1,
-0.1662945, 0.138656, 0.6076564, 1, 1, 1, 1, 1,
-0.1638906, 0.06390507, 0.2941317, 0, 0, 1, 1, 1,
-0.1598435, 1.800406, 0.7996922, 1, 0, 0, 1, 1,
-0.1567246, 1.265925, 2.015417, 1, 0, 0, 1, 1,
-0.1562055, 1.92586, -0.3503692, 1, 0, 0, 1, 1,
-0.1545056, -1.665654, -0.8675155, 1, 0, 0, 1, 1,
-0.1535837, -1.010058, -2.281378, 1, 0, 0, 1, 1,
-0.1506348, -1.546535, -2.570945, 0, 0, 0, 1, 1,
-0.1502476, 1.531112, -0.9145703, 0, 0, 0, 1, 1,
-0.1473003, 0.9305605, -1.793675, 0, 0, 0, 1, 1,
-0.1463193, 1.127113, 0.2959296, 0, 0, 0, 1, 1,
-0.1417234, 1.120656, 0.1516435, 0, 0, 0, 1, 1,
-0.1356091, 0.2162502, -0.4883317, 0, 0, 0, 1, 1,
-0.1265805, 1.484618, 0.4868422, 0, 0, 0, 1, 1,
-0.1244525, -0.6416481, -1.397233, 1, 1, 1, 1, 1,
-0.1220479, 2.348289, -1.189973, 1, 1, 1, 1, 1,
-0.1219353, -0.1860203, -2.125916, 1, 1, 1, 1, 1,
-0.120061, -0.796444, -3.175133, 1, 1, 1, 1, 1,
-0.1189859, 0.7875847, 0.3796743, 1, 1, 1, 1, 1,
-0.112173, 0.7654026, -0.5752797, 1, 1, 1, 1, 1,
-0.1090407, -0.6202918, -4.130939, 1, 1, 1, 1, 1,
-0.1061487, 1.006741, -1.514234, 1, 1, 1, 1, 1,
-0.1055631, -0.8688887, -2.976433, 1, 1, 1, 1, 1,
-0.1046771, -0.3700559, -3.771027, 1, 1, 1, 1, 1,
-0.1036441, -0.5145292, -4.176731, 1, 1, 1, 1, 1,
-0.1032684, -0.1254449, -1.661495, 1, 1, 1, 1, 1,
-0.1010096, 1.540027, 0.8914062, 1, 1, 1, 1, 1,
-0.09859584, 0.2325307, 1.291572, 1, 1, 1, 1, 1,
-0.09393147, 0.969994, 0.07701885, 1, 1, 1, 1, 1,
-0.09331754, -0.205942, 0.9901454, 0, 0, 1, 1, 1,
-0.09191544, 0.1416026, -0.7011471, 1, 0, 0, 1, 1,
-0.09125043, -0.4445642, -3.42417, 1, 0, 0, 1, 1,
-0.08878943, 0.1659095, -0.7313688, 1, 0, 0, 1, 1,
-0.08163042, -0.04174394, -3.023144, 1, 0, 0, 1, 1,
-0.08155397, -0.3480747, -3.720368, 1, 0, 0, 1, 1,
-0.08133542, 0.6281853, 1.147129, 0, 0, 0, 1, 1,
-0.08070946, 0.540105, -0.4512104, 0, 0, 0, 1, 1,
-0.08045007, 1.27459, -1.257853, 0, 0, 0, 1, 1,
-0.07916757, -0.4816956, -3.272221, 0, 0, 0, 1, 1,
-0.07036345, 0.4901202, -0.6644394, 0, 0, 0, 1, 1,
-0.06720091, 0.4411009, 0.4411972, 0, 0, 0, 1, 1,
-0.06535193, -1.09936, -2.333331, 0, 0, 0, 1, 1,
-0.06387768, -0.2624748, -2.334165, 1, 1, 1, 1, 1,
-0.05963122, -0.8051387, -2.471688, 1, 1, 1, 1, 1,
-0.05891742, 0.5684149, 0.4290464, 1, 1, 1, 1, 1,
-0.05651668, -1.469756, -3.053585, 1, 1, 1, 1, 1,
-0.05639569, -0.1113583, -1.346931, 1, 1, 1, 1, 1,
-0.05524054, -1.238364, -4.57042, 1, 1, 1, 1, 1,
-0.05205785, 0.2727903, 0.6499422, 1, 1, 1, 1, 1,
-0.05184678, -1.092361, -3.159937, 1, 1, 1, 1, 1,
-0.04706592, -1.40261, -3.336656, 1, 1, 1, 1, 1,
-0.04676864, 1.06807, -0.5586198, 1, 1, 1, 1, 1,
-0.04624569, 1.353774, -1.091376, 1, 1, 1, 1, 1,
-0.04519385, -0.5658823, -4.209716, 1, 1, 1, 1, 1,
-0.04309839, 0.02907612, -0.4341741, 1, 1, 1, 1, 1,
-0.04181216, -2.41458, -1.803765, 1, 1, 1, 1, 1,
-0.04159106, -1.3901, -3.045907, 1, 1, 1, 1, 1,
-0.04130536, -0.6305383, -1.7827, 0, 0, 1, 1, 1,
-0.03977968, 0.3304586, -1.661603, 1, 0, 0, 1, 1,
-0.03481959, -0.2197172, -2.272037, 1, 0, 0, 1, 1,
-0.03113012, -0.6317363, -2.899114, 1, 0, 0, 1, 1,
-0.02549432, -1.266327, -3.467577, 1, 0, 0, 1, 1,
-0.02235715, -0.4892597, -2.414196, 1, 0, 0, 1, 1,
-0.02065248, 0.3519991, 0.8540131, 0, 0, 0, 1, 1,
-0.01514284, 1.376657, 1.447094, 0, 0, 0, 1, 1,
0.001758599, -1.210765, 3.197102, 0, 0, 0, 1, 1,
0.002221357, 0.1958581, -0.7728578, 0, 0, 0, 1, 1,
0.002347841, -1.025546, 2.824625, 0, 0, 0, 1, 1,
0.01039423, -0.08621746, 3.821947, 0, 0, 0, 1, 1,
0.01197661, 0.3219986, -1.991606, 0, 0, 0, 1, 1,
0.01614472, 1.022107, 1.357115, 1, 1, 1, 1, 1,
0.028863, -0.2682117, 3.02185, 1, 1, 1, 1, 1,
0.02971455, 1.056246, 0.7899777, 1, 1, 1, 1, 1,
0.03361389, 0.8998694, -0.5483427, 1, 1, 1, 1, 1,
0.03821199, 0.6817629, -0.2381639, 1, 1, 1, 1, 1,
0.03926706, 0.3961929, -0.1673047, 1, 1, 1, 1, 1,
0.04401321, 0.876961, 1.411866, 1, 1, 1, 1, 1,
0.0467761, 0.3686898, 0.3781106, 1, 1, 1, 1, 1,
0.04983524, -0.1043986, 1.573689, 1, 1, 1, 1, 1,
0.05124646, 1.440036, 0.6544852, 1, 1, 1, 1, 1,
0.05531118, -1.141962, 2.659659, 1, 1, 1, 1, 1,
0.05555415, -0.6639252, 5.067427, 1, 1, 1, 1, 1,
0.05915758, 2.220701, -0.75992, 1, 1, 1, 1, 1,
0.06167241, -0.1426529, 1.992167, 1, 1, 1, 1, 1,
0.06206733, 0.1462192, 0.6426306, 1, 1, 1, 1, 1,
0.06611351, -0.2094773, 4.081797, 0, 0, 1, 1, 1,
0.06672823, 1.919205, -0.8462324, 1, 0, 0, 1, 1,
0.06937109, -0.4024, 3.361572, 1, 0, 0, 1, 1,
0.07059994, 0.01746722, 0.3642612, 1, 0, 0, 1, 1,
0.07223018, 0.5816585, -0.8354847, 1, 0, 0, 1, 1,
0.07383846, 1.787089, -0.03720414, 1, 0, 0, 1, 1,
0.08292435, -1.248289, 3.575782, 0, 0, 0, 1, 1,
0.08416307, -0.8101369, 3.832596, 0, 0, 0, 1, 1,
0.0864615, -1.056453, 2.715431, 0, 0, 0, 1, 1,
0.09330709, -0.4355889, 2.944521, 0, 0, 0, 1, 1,
0.09524717, -0.5559234, 3.407377, 0, 0, 0, 1, 1,
0.09559978, 1.448265, 0.9140049, 0, 0, 0, 1, 1,
0.09720652, 0.2276365, -0.7266133, 0, 0, 0, 1, 1,
0.100179, -0.1274911, 2.826337, 1, 1, 1, 1, 1,
0.1125242, 1.373281, -1.083973, 1, 1, 1, 1, 1,
0.1165347, 1.119523, 1.232854, 1, 1, 1, 1, 1,
0.1199151, 1.927794, 0.1169343, 1, 1, 1, 1, 1,
0.1210072, -0.3861012, 4.054042, 1, 1, 1, 1, 1,
0.1259017, -0.9359431, 3.671408, 1, 1, 1, 1, 1,
0.1282621, 0.9023979, -0.1015396, 1, 1, 1, 1, 1,
0.1321441, 0.7905367, -1.737053, 1, 1, 1, 1, 1,
0.1326893, 0.2073345, 0.7034882, 1, 1, 1, 1, 1,
0.1383169, 0.01883028, 2.29036, 1, 1, 1, 1, 1,
0.1399729, -1.042463, 1.466239, 1, 1, 1, 1, 1,
0.1418636, -0.1354835, 3.603169, 1, 1, 1, 1, 1,
0.1420426, -0.2094892, 2.162343, 1, 1, 1, 1, 1,
0.1450631, -1.41908, 2.304832, 1, 1, 1, 1, 1,
0.1472764, -1.4558, 2.659059, 1, 1, 1, 1, 1,
0.1480483, 0.5465044, 1.079776, 0, 0, 1, 1, 1,
0.1490581, 0.5161069, -2.519475, 1, 0, 0, 1, 1,
0.1527433, 0.5241458, -0.05366367, 1, 0, 0, 1, 1,
0.1529598, -0.4138587, 2.570113, 1, 0, 0, 1, 1,
0.153151, -0.7296954, 3.215893, 1, 0, 0, 1, 1,
0.1549922, -0.4348188, 4.06221, 1, 0, 0, 1, 1,
0.1551293, 0.7097592, 0.896955, 0, 0, 0, 1, 1,
0.1555158, 1.647031, 0.9283322, 0, 0, 0, 1, 1,
0.1555426, -0.2386512, 1.985591, 0, 0, 0, 1, 1,
0.1575073, -0.6636844, 3.270087, 0, 0, 0, 1, 1,
0.1603507, 1.612619, 0.8465453, 0, 0, 0, 1, 1,
0.1618043, 0.6495192, 0.493737, 0, 0, 0, 1, 1,
0.1635221, -0.6780196, 2.691467, 0, 0, 0, 1, 1,
0.1653279, 0.3293374, -0.5584987, 1, 1, 1, 1, 1,
0.1662223, 0.3236597, 0.5353665, 1, 1, 1, 1, 1,
0.1667798, 0.02859503, 3.265865, 1, 1, 1, 1, 1,
0.1689461, 0.02432921, 3.155015, 1, 1, 1, 1, 1,
0.169966, 0.06091473, 1.382633, 1, 1, 1, 1, 1,
0.1711725, 1.642719, 0.2534649, 1, 1, 1, 1, 1,
0.1729525, 1.48569, -1.050551, 1, 1, 1, 1, 1,
0.1776378, 0.114859, 0.567805, 1, 1, 1, 1, 1,
0.1790419, -2.404697, 3.170117, 1, 1, 1, 1, 1,
0.1884604, -0.5881824, 1.218991, 1, 1, 1, 1, 1,
0.1996404, 1.504349, -1.489687, 1, 1, 1, 1, 1,
0.2052873, 0.09880508, -1.595353, 1, 1, 1, 1, 1,
0.2057363, 0.6403033, -0.5142186, 1, 1, 1, 1, 1,
0.2067881, -0.827445, 3.119948, 1, 1, 1, 1, 1,
0.206992, -0.3420492, 1.290159, 1, 1, 1, 1, 1,
0.2166049, 0.153731, 1.975467, 0, 0, 1, 1, 1,
0.2166116, -1.365449, 3.160305, 1, 0, 0, 1, 1,
0.2237525, 0.1570557, 0.9941703, 1, 0, 0, 1, 1,
0.2272991, 0.2612449, 1.306556, 1, 0, 0, 1, 1,
0.228805, 0.3715526, -0.4863538, 1, 0, 0, 1, 1,
0.2289526, -0.3599736, 3.237137, 1, 0, 0, 1, 1,
0.2315796, 0.799329, 2.16369, 0, 0, 0, 1, 1,
0.2352574, 1.424409, -0.189106, 0, 0, 0, 1, 1,
0.2401017, 0.5613043, 2.155398, 0, 0, 0, 1, 1,
0.2408396, -0.8486379, 2.405878, 0, 0, 0, 1, 1,
0.2421858, 0.5350045, -0.07586318, 0, 0, 0, 1, 1,
0.2422756, -1.430757, 2.84083, 0, 0, 0, 1, 1,
0.244188, -0.05065784, 1.403077, 0, 0, 0, 1, 1,
0.2477005, -1.030361, 3.025797, 1, 1, 1, 1, 1,
0.2522442, 0.620871, 0.06077946, 1, 1, 1, 1, 1,
0.2536, 0.9624998, -0.4856579, 1, 1, 1, 1, 1,
0.2538095, 1.500199, -0.7816818, 1, 1, 1, 1, 1,
0.254984, -0.8042266, 3.417618, 1, 1, 1, 1, 1,
0.2606879, 0.9506796, -0.4803914, 1, 1, 1, 1, 1,
0.262042, -2.365613, 2.496647, 1, 1, 1, 1, 1,
0.2629211, 0.1086732, 0.615369, 1, 1, 1, 1, 1,
0.2651277, 1.312757, -0.2319175, 1, 1, 1, 1, 1,
0.2670899, -0.4314363, 2.921224, 1, 1, 1, 1, 1,
0.268027, 1.847914, 0.02250731, 1, 1, 1, 1, 1,
0.2735783, -0.381067, 3.017462, 1, 1, 1, 1, 1,
0.2767918, 0.8701977, 0.3729542, 1, 1, 1, 1, 1,
0.2787289, 0.3591585, 1.088659, 1, 1, 1, 1, 1,
0.2790675, 0.6858841, 1.097257, 1, 1, 1, 1, 1,
0.2812404, -1.133278, 2.018128, 0, 0, 1, 1, 1,
0.2819439, -0.5724267, 1.454397, 1, 0, 0, 1, 1,
0.2837237, -0.4850785, 1.470992, 1, 0, 0, 1, 1,
0.2838813, 0.1144809, 1.309773, 1, 0, 0, 1, 1,
0.2859749, 1.509263, -1.077646, 1, 0, 0, 1, 1,
0.2872592, -1.19775, 3.827971, 1, 0, 0, 1, 1,
0.2984227, -1.255605, 2.597012, 0, 0, 0, 1, 1,
0.3005286, -0.3296078, 3.121969, 0, 0, 0, 1, 1,
0.3013854, 0.7373698, -0.02607585, 0, 0, 0, 1, 1,
0.3047842, -0.6334001, 4.97878, 0, 0, 0, 1, 1,
0.3070339, -0.02031309, 0.2245261, 0, 0, 0, 1, 1,
0.3120927, -0.1194509, 3.948843, 0, 0, 0, 1, 1,
0.3157201, 0.1434371, 0.8626233, 0, 0, 0, 1, 1,
0.3230186, -1.079936, 3.340943, 1, 1, 1, 1, 1,
0.3256839, -0.2958871, 2.090833, 1, 1, 1, 1, 1,
0.3267826, -0.5413822, 2.505921, 1, 1, 1, 1, 1,
0.3276612, -1.30085, 4.858439, 1, 1, 1, 1, 1,
0.3329468, -1.457525, 1.908835, 1, 1, 1, 1, 1,
0.3363991, 0.7709483, -0.7432283, 1, 1, 1, 1, 1,
0.3378467, -0.7397833, 2.492171, 1, 1, 1, 1, 1,
0.3409493, -0.8973923, 1.196738, 1, 1, 1, 1, 1,
0.3428392, -0.9150237, 1.95354, 1, 1, 1, 1, 1,
0.343694, 0.7360187, 0.2832661, 1, 1, 1, 1, 1,
0.3447163, 1.129172, 1.129221, 1, 1, 1, 1, 1,
0.3465302, -1.230077, 3.096372, 1, 1, 1, 1, 1,
0.3470892, 0.8459865, 1.231601, 1, 1, 1, 1, 1,
0.3495952, 0.3682041, 1.328711, 1, 1, 1, 1, 1,
0.3584139, -1.531563, 3.38932, 1, 1, 1, 1, 1,
0.3662379, -0.1271235, 1.960951, 0, 0, 1, 1, 1,
0.3679178, 0.9300001, 2.324039, 1, 0, 0, 1, 1,
0.3693653, 1.519318, -0.9520323, 1, 0, 0, 1, 1,
0.3717676, 0.3190753, -0.4596354, 1, 0, 0, 1, 1,
0.3766301, 1.241993, -1.109571, 1, 0, 0, 1, 1,
0.3812238, 1.106935, 1.370605, 1, 0, 0, 1, 1,
0.3812349, 0.06967159, 1.430192, 0, 0, 0, 1, 1,
0.3813429, 1.853849, 0.4595032, 0, 0, 0, 1, 1,
0.3834929, -1.584, 1.837658, 0, 0, 0, 1, 1,
0.3881049, 0.1372688, 1.675072, 0, 0, 0, 1, 1,
0.3913406, -0.3330424, 2.15768, 0, 0, 0, 1, 1,
0.3957991, -0.1843664, 1.820613, 0, 0, 0, 1, 1,
0.3983933, -0.706521, 2.710999, 0, 0, 0, 1, 1,
0.4078346, 0.9294188, -1.469594, 1, 1, 1, 1, 1,
0.408527, -0.6019793, 2.406061, 1, 1, 1, 1, 1,
0.413098, 1.236912, 2.455186, 1, 1, 1, 1, 1,
0.4170323, 1.538489, -0.6023298, 1, 1, 1, 1, 1,
0.4182201, 0.1875477, 0.4283815, 1, 1, 1, 1, 1,
0.4204968, 0.9142691, -0.497089, 1, 1, 1, 1, 1,
0.4214472, -0.0005623361, -0.3109389, 1, 1, 1, 1, 1,
0.4261995, 0.5428865, -0.1765714, 1, 1, 1, 1, 1,
0.4273296, -0.2910189, 0.9344664, 1, 1, 1, 1, 1,
0.4401348, 1.82222, 0.6858147, 1, 1, 1, 1, 1,
0.4452083, -0.7836891, 3.826078, 1, 1, 1, 1, 1,
0.4465854, -0.06075674, 1.110325, 1, 1, 1, 1, 1,
0.4470319, -0.1271946, 1.624018, 1, 1, 1, 1, 1,
0.4480567, -0.01344386, 0.5217631, 1, 1, 1, 1, 1,
0.4545206, -0.9492451, 2.336326, 1, 1, 1, 1, 1,
0.4562672, 0.7360157, 3.822287, 0, 0, 1, 1, 1,
0.4577834, -1.445357, 2.230211, 1, 0, 0, 1, 1,
0.4578213, -0.5500154, 2.209239, 1, 0, 0, 1, 1,
0.4579035, 0.2283133, 2.880877, 1, 0, 0, 1, 1,
0.469803, 0.674265, 0.3662373, 1, 0, 0, 1, 1,
0.4698862, -0.004320856, 2.441944, 1, 0, 0, 1, 1,
0.4746776, 0.8336022, -0.355321, 0, 0, 0, 1, 1,
0.4788798, 0.9371932, 2.097769, 0, 0, 0, 1, 1,
0.4804714, -1.494687, 1.220258, 0, 0, 0, 1, 1,
0.4822379, -1.1465, 2.429057, 0, 0, 0, 1, 1,
0.4855841, -0.650495, 3.216192, 0, 0, 0, 1, 1,
0.4864533, -1.030476, 3.035243, 0, 0, 0, 1, 1,
0.4927191, -0.07995701, 1.156806, 0, 0, 0, 1, 1,
0.4928027, -0.6417674, 2.600834, 1, 1, 1, 1, 1,
0.4973941, -1.004358, 3.99387, 1, 1, 1, 1, 1,
0.5013477, -0.9809711, 3.658963, 1, 1, 1, 1, 1,
0.5030144, 0.4599519, 1.151597, 1, 1, 1, 1, 1,
0.5056116, 2.253071, 1.944299, 1, 1, 1, 1, 1,
0.5120773, -2.345472, 2.281907, 1, 1, 1, 1, 1,
0.5188755, -0.8094164, 2.604608, 1, 1, 1, 1, 1,
0.519264, -0.1433108, 3.583352, 1, 1, 1, 1, 1,
0.5220014, -0.439381, 2.02227, 1, 1, 1, 1, 1,
0.5247689, 1.087913, 0.6107589, 1, 1, 1, 1, 1,
0.526751, -1.661767, 2.566222, 1, 1, 1, 1, 1,
0.5275806, 0.4576096, 1.064737, 1, 1, 1, 1, 1,
0.5305733, 1.518206, 0.9976653, 1, 1, 1, 1, 1,
0.5317386, 0.4506764, 0.05787375, 1, 1, 1, 1, 1,
0.5339087, -1.83737, 2.675143, 1, 1, 1, 1, 1,
0.541203, -0.739502, 2.802275, 0, 0, 1, 1, 1,
0.5440497, 0.2216147, 0.8556194, 1, 0, 0, 1, 1,
0.5440937, 0.9149172, 0.05615993, 1, 0, 0, 1, 1,
0.5472783, -0.8543335, 2.046802, 1, 0, 0, 1, 1,
0.5517303, -1.048155, 2.123308, 1, 0, 0, 1, 1,
0.5574026, -2.852628, 2.030687, 1, 0, 0, 1, 1,
0.5594499, 0.1196347, 1.989169, 0, 0, 0, 1, 1,
0.5617268, 0.7459762, 0.9565395, 0, 0, 0, 1, 1,
0.5623004, -0.9062306, 3.140505, 0, 0, 0, 1, 1,
0.5639765, -0.8959672, 1.182464, 0, 0, 0, 1, 1,
0.5695848, -0.4511448, 2.600711, 0, 0, 0, 1, 1,
0.5719689, 0.3594639, 0.41258, 0, 0, 0, 1, 1,
0.5724845, -2.17172, 1.467973, 0, 0, 0, 1, 1,
0.57903, -0.9090528, 1.868472, 1, 1, 1, 1, 1,
0.5814286, -0.3486504, 2.560805, 1, 1, 1, 1, 1,
0.5823131, 0.07444583, 1.06546, 1, 1, 1, 1, 1,
0.5834125, 0.1935011, 0.4378633, 1, 1, 1, 1, 1,
0.5936117, -0.5607191, 2.620847, 1, 1, 1, 1, 1,
0.5974664, -1.235844, 1.723788, 1, 1, 1, 1, 1,
0.5980068, 0.9652326, 0.4045072, 1, 1, 1, 1, 1,
0.6025842, 1.676625, 0.4941692, 1, 1, 1, 1, 1,
0.6026172, -0.2891366, 2.116457, 1, 1, 1, 1, 1,
0.6033363, -1.236267, 1.296574, 1, 1, 1, 1, 1,
0.6053137, -0.5371827, 2.520473, 1, 1, 1, 1, 1,
0.610635, 1.113435, -0.8240185, 1, 1, 1, 1, 1,
0.6153252, -0.5285722, 1.807901, 1, 1, 1, 1, 1,
0.6207116, 0.307854, 0.2813512, 1, 1, 1, 1, 1,
0.6219541, 0.5228058, 0.9612362, 1, 1, 1, 1, 1,
0.6234713, 0.5705516, -0.2100259, 0, 0, 1, 1, 1,
0.6292328, 0.4982686, 0.699108, 1, 0, 0, 1, 1,
0.6292632, -0.7635168, 2.437964, 1, 0, 0, 1, 1,
0.6311347, 2.207026, 0.901046, 1, 0, 0, 1, 1,
0.6326887, 0.6205889, 0.009727488, 1, 0, 0, 1, 1,
0.6335655, 0.3721885, 1.62178, 1, 0, 0, 1, 1,
0.6438377, -0.7325407, 3.023485, 0, 0, 0, 1, 1,
0.645824, -1.383677, 4.389782, 0, 0, 0, 1, 1,
0.6513695, -0.7741254, 2.661417, 0, 0, 0, 1, 1,
0.6553998, -1.54284, 2.269155, 0, 0, 0, 1, 1,
0.659943, -0.04425607, 2.111703, 0, 0, 0, 1, 1,
0.6621717, 0.2793028, 0.1141287, 0, 0, 0, 1, 1,
0.6624855, 0.7526156, 0.8711706, 0, 0, 0, 1, 1,
0.6625541, 0.3611314, 1.649916, 1, 1, 1, 1, 1,
0.6626341, -0.7302471, 2.176481, 1, 1, 1, 1, 1,
0.6648675, -0.2093544, 3.333578, 1, 1, 1, 1, 1,
0.6671394, 0.1062109, 3.614208, 1, 1, 1, 1, 1,
0.6673925, 1.061373, -0.4853179, 1, 1, 1, 1, 1,
0.6712238, 0.3812245, 2.516566, 1, 1, 1, 1, 1,
0.673548, 0.01520036, 2.40966, 1, 1, 1, 1, 1,
0.6752657, 0.09285957, 3.250061, 1, 1, 1, 1, 1,
0.6799434, 2.098703, 2.274378, 1, 1, 1, 1, 1,
0.6902509, -1.651057, 1.801737, 1, 1, 1, 1, 1,
0.6907212, -0.7343112, 4.348259, 1, 1, 1, 1, 1,
0.6955072, 0.7296614, -1.689948, 1, 1, 1, 1, 1,
0.698575, 1.165603, 1.395683, 1, 1, 1, 1, 1,
0.7029541, -1.452802, 4.017999, 1, 1, 1, 1, 1,
0.7051435, -1.015783, 2.235062, 1, 1, 1, 1, 1,
0.7074164, -0.5193921, 2.981614, 0, 0, 1, 1, 1,
0.708638, 0.9110985, 0.3957373, 1, 0, 0, 1, 1,
0.7099231, -0.4767834, 2.609362, 1, 0, 0, 1, 1,
0.7162553, 0.8093003, -1.513547, 1, 0, 0, 1, 1,
0.7211729, 0.3956397, 1.694551, 1, 0, 0, 1, 1,
0.7229406, -0.8656827, 4.207877, 1, 0, 0, 1, 1,
0.726247, 1.744731, 0.4346486, 0, 0, 0, 1, 1,
0.7305674, 1.222839, 0.05951886, 0, 0, 0, 1, 1,
0.7314906, -0.4526012, 0.5219508, 0, 0, 0, 1, 1,
0.7359291, -1.402834, 3.174731, 0, 0, 0, 1, 1,
0.7371292, 1.537032, 2.278971, 0, 0, 0, 1, 1,
0.7402571, 0.2952252, 0.5687333, 0, 0, 0, 1, 1,
0.740519, 0.1117275, -0.3282286, 0, 0, 0, 1, 1,
0.7427002, 1.658209, -0.5440833, 1, 1, 1, 1, 1,
0.7437164, -0.8783612, 3.579998, 1, 1, 1, 1, 1,
0.7462555, 1.61929, 2.406229, 1, 1, 1, 1, 1,
0.7537321, -0.9674045, 0.8017389, 1, 1, 1, 1, 1,
0.7562997, -0.1579874, 2.752536, 1, 1, 1, 1, 1,
0.7614402, 2.794393, 0.04137529, 1, 1, 1, 1, 1,
0.7659775, 1.183064, 1.381331, 1, 1, 1, 1, 1,
0.7668471, 0.3467326, 1.528089, 1, 1, 1, 1, 1,
0.7674968, -0.8473675, 2.62247, 1, 1, 1, 1, 1,
0.7682109, 0.9745615, 0.8770777, 1, 1, 1, 1, 1,
0.7700805, 1.326714, 1.148144, 1, 1, 1, 1, 1,
0.7713912, -0.1197728, 1.145936, 1, 1, 1, 1, 1,
0.7777312, 0.5133972, 0.6385533, 1, 1, 1, 1, 1,
0.7779943, -0.9854077, 3.405795, 1, 1, 1, 1, 1,
0.7801604, -0.3234737, 3.06987, 1, 1, 1, 1, 1,
0.782171, 0.5129312, 2.024455, 0, 0, 1, 1, 1,
0.7829527, 1.299409, 0.5534248, 1, 0, 0, 1, 1,
0.7850289, -0.07184093, 0.257199, 1, 0, 0, 1, 1,
0.7860427, 0.2617439, 1.673615, 1, 0, 0, 1, 1,
0.7871809, -0.01625186, 0.7523213, 1, 0, 0, 1, 1,
0.789031, 0.6145679, -1.515847, 1, 0, 0, 1, 1,
0.7901863, -0.7693003, 1.850884, 0, 0, 0, 1, 1,
0.796536, 0.8193565, -1.64922, 0, 0, 0, 1, 1,
0.8003432, -2.199055, 5.110685, 0, 0, 0, 1, 1,
0.8101885, 0.06174062, -0.01349931, 0, 0, 0, 1, 1,
0.8136966, 0.5388703, 2.137152, 0, 0, 0, 1, 1,
0.81538, 0.0654764, 3.153691, 0, 0, 0, 1, 1,
0.8169515, 0.7215621, 2.415139, 0, 0, 0, 1, 1,
0.8215626, -0.4808927, 2.158427, 1, 1, 1, 1, 1,
0.8282776, -0.249714, 1.580387, 1, 1, 1, 1, 1,
0.8314509, 0.09240771, 0.2301364, 1, 1, 1, 1, 1,
0.8319229, -0.01645092, 0.4222025, 1, 1, 1, 1, 1,
0.8329756, 1.860154, 0.1728796, 1, 1, 1, 1, 1,
0.8360822, -1.628076, 2.310076, 1, 1, 1, 1, 1,
0.8369042, -0.1632213, 0.7055822, 1, 1, 1, 1, 1,
0.8427452, -2.121296, 2.779769, 1, 1, 1, 1, 1,
0.8446192, -0.3886904, 1.735773, 1, 1, 1, 1, 1,
0.8501882, -0.2607158, 1.619346, 1, 1, 1, 1, 1,
0.8535912, 2.523986, 0.1195896, 1, 1, 1, 1, 1,
0.8600248, 1.535212, 1.472515, 1, 1, 1, 1, 1,
0.8606623, 1.347354, 0.03524429, 1, 1, 1, 1, 1,
0.8636554, 2.275454, 0.258671, 1, 1, 1, 1, 1,
0.8648151, -0.3527186, 3.359377, 1, 1, 1, 1, 1,
0.8660716, 0.4894362, 1.499616, 0, 0, 1, 1, 1,
0.8664554, 0.658805, 0.4915802, 1, 0, 0, 1, 1,
0.8716041, -1.205791, 1.946266, 1, 0, 0, 1, 1,
0.8741955, -0.9885217, 1.754097, 1, 0, 0, 1, 1,
0.876279, 1.158058, -0.4923586, 1, 0, 0, 1, 1,
0.8774352, 1.273342, 2.503042, 1, 0, 0, 1, 1,
0.881484, 0.4303305, -0.2342233, 0, 0, 0, 1, 1,
0.8848952, 0.9547848, 0.9855351, 0, 0, 0, 1, 1,
0.8914827, -1.187449, 3.332781, 0, 0, 0, 1, 1,
0.8958498, -1.430463, 3.67663, 0, 0, 0, 1, 1,
0.8996803, 1.182026, 0.397065, 0, 0, 0, 1, 1,
0.900396, 0.8739942, 1.184624, 0, 0, 0, 1, 1,
0.9027902, -1.359269, 2.342662, 0, 0, 0, 1, 1,
0.9071282, 1.088613, -0.2680003, 1, 1, 1, 1, 1,
0.9094448, -0.2500935, 0.8377817, 1, 1, 1, 1, 1,
0.9157338, -0.3416989, 1.918934, 1, 1, 1, 1, 1,
0.9165251, -0.7974668, 2.431139, 1, 1, 1, 1, 1,
0.9177282, 1.383563, -2.496605, 1, 1, 1, 1, 1,
0.9205735, 0.07880701, 2.042775, 1, 1, 1, 1, 1,
0.9273708, 0.5740238, 0.04366281, 1, 1, 1, 1, 1,
0.9331241, 0.9032363, 2.146772, 1, 1, 1, 1, 1,
0.9343103, -0.0272855, 1.542346, 1, 1, 1, 1, 1,
0.9416502, -0.7722051, 4.039108, 1, 1, 1, 1, 1,
0.9424731, 0.5555926, 0.8012775, 1, 1, 1, 1, 1,
0.951229, -0.3710064, 3.020505, 1, 1, 1, 1, 1,
0.956716, -0.05569019, 2.273324, 1, 1, 1, 1, 1,
0.9583436, 0.151606, 1.577967, 1, 1, 1, 1, 1,
0.9585136, 1.009525, -0.01762893, 1, 1, 1, 1, 1,
0.9682063, 0.9936174, 1.563977, 0, 0, 1, 1, 1,
0.9718143, 0.381539, 1.114051, 1, 0, 0, 1, 1,
0.9783989, 0.7732231, 1.71508, 1, 0, 0, 1, 1,
0.9877664, 0.8901109, 2.287035, 1, 0, 0, 1, 1,
0.9893553, -0.9304108, 1.62014, 1, 0, 0, 1, 1,
0.9913845, 1.486327, 0.4125941, 1, 0, 0, 1, 1,
0.9959934, -0.12982, 0.7150549, 0, 0, 0, 1, 1,
1.005581, -1.974096, 2.605335, 0, 0, 0, 1, 1,
1.011422, 0.7807994, 1.026546, 0, 0, 0, 1, 1,
1.011572, 1.357337, 0.6552697, 0, 0, 0, 1, 1,
1.011657, 0.7237586, 2.253549, 0, 0, 0, 1, 1,
1.013549, 1.130101, 0.8813298, 0, 0, 0, 1, 1,
1.024615, -0.6272393, -0.373096, 0, 0, 0, 1, 1,
1.028239, -2.482194, 3.534576, 1, 1, 1, 1, 1,
1.030119, -0.4963736, 2.667563, 1, 1, 1, 1, 1,
1.031084, -0.3786086, 1.513533, 1, 1, 1, 1, 1,
1.035403, 0.8294813, 0.1844888, 1, 1, 1, 1, 1,
1.03574, 0.4935944, 0.971267, 1, 1, 1, 1, 1,
1.038898, -0.6920295, 2.647967, 1, 1, 1, 1, 1,
1.041711, 0.3203929, -0.6946825, 1, 1, 1, 1, 1,
1.046977, -1.724558, 3.158971, 1, 1, 1, 1, 1,
1.059187, 0.7801381, 2.34399, 1, 1, 1, 1, 1,
1.062711, -0.7789682, -0.3089749, 1, 1, 1, 1, 1,
1.064067, 0.07160851, 2.143759, 1, 1, 1, 1, 1,
1.073599, 1.348017, 0.03342617, 1, 1, 1, 1, 1,
1.079415, -0.7868398, 2.100546, 1, 1, 1, 1, 1,
1.085944, -0.6987408, 1.924066, 1, 1, 1, 1, 1,
1.093752, -0.3401917, 1.688315, 1, 1, 1, 1, 1,
1.110183, 0.3613459, 1.26808, 0, 0, 1, 1, 1,
1.134655, 0.850017, 0.1767138, 1, 0, 0, 1, 1,
1.134809, 1.025211, -0.02116388, 1, 0, 0, 1, 1,
1.136047, -1.188061, 1.160629, 1, 0, 0, 1, 1,
1.143427, -1.140843, 2.765011, 1, 0, 0, 1, 1,
1.148354, -0.6283816, 3.257004, 1, 0, 0, 1, 1,
1.149471, -0.3780201, 2.751983, 0, 0, 0, 1, 1,
1.1533, 1.285507, 1.466294, 0, 0, 0, 1, 1,
1.155447, -0.9126318, 2.774677, 0, 0, 0, 1, 1,
1.155496, 0.8595507, 1.365418, 0, 0, 0, 1, 1,
1.156465, -0.02182943, 2.232314, 0, 0, 0, 1, 1,
1.158982, 0.4890674, 1.54405, 0, 0, 0, 1, 1,
1.175765, -1.852322, 2.70172, 0, 0, 0, 1, 1,
1.175977, -0.5651962, 0.8416054, 1, 1, 1, 1, 1,
1.180221, 0.5326712, 1.981557, 1, 1, 1, 1, 1,
1.180487, 0.4158649, -0.05279112, 1, 1, 1, 1, 1,
1.195389, 1.858524, 1.075284, 1, 1, 1, 1, 1,
1.197507, 1.953228, -0.8600601, 1, 1, 1, 1, 1,
1.220108, -0.7109985, 1.955676, 1, 1, 1, 1, 1,
1.228237, 0.2169984, 1.799128, 1, 1, 1, 1, 1,
1.229379, -1.060504, 3.470399, 1, 1, 1, 1, 1,
1.234261, 0.5540742, 0.9103451, 1, 1, 1, 1, 1,
1.24023, 0.2891108, 1.313464, 1, 1, 1, 1, 1,
1.242713, 1.629049, 1.178903, 1, 1, 1, 1, 1,
1.24798, -0.2415802, 1.427679, 1, 1, 1, 1, 1,
1.250854, 0.2641478, 2.058582, 1, 1, 1, 1, 1,
1.250966, -0.1088936, 2.205661, 1, 1, 1, 1, 1,
1.257589, -1.035197, 2.626575, 1, 1, 1, 1, 1,
1.258914, 0.2943717, 2.117357, 0, 0, 1, 1, 1,
1.273751, 1.040585, 1.1797, 1, 0, 0, 1, 1,
1.281648, -0.0160433, 1.249552, 1, 0, 0, 1, 1,
1.283942, -0.5868412, 0.2294932, 1, 0, 0, 1, 1,
1.284, 0.3139359, 0.7882336, 1, 0, 0, 1, 1,
1.289518, -0.1558771, 2.075248, 1, 0, 0, 1, 1,
1.291442, 1.839058, 0.837051, 0, 0, 0, 1, 1,
1.29406, -0.00404641, 0.3843624, 0, 0, 0, 1, 1,
1.299773, -1.010726, 4.544812, 0, 0, 0, 1, 1,
1.300904, 0.3497337, 1.445073, 0, 0, 0, 1, 1,
1.301746, 1.180227, 2.768139, 0, 0, 0, 1, 1,
1.303455, 1.681136, 0.4839938, 0, 0, 0, 1, 1,
1.310175, 0.4509648, 1.142582, 0, 0, 0, 1, 1,
1.313216, 0.299352, 1.532067, 1, 1, 1, 1, 1,
1.340285, 0.3751186, 0.8154535, 1, 1, 1, 1, 1,
1.344865, 0.481235, 2.096173, 1, 1, 1, 1, 1,
1.350058, 1.680301, 1.645506, 1, 1, 1, 1, 1,
1.361579, -1.049035, 1.5681, 1, 1, 1, 1, 1,
1.366953, 0.08711243, 2.625362, 1, 1, 1, 1, 1,
1.376631, -0.2331218, 1.874613, 1, 1, 1, 1, 1,
1.391207, 0.06754599, 0.7242746, 1, 1, 1, 1, 1,
1.396912, 0.3682483, 3.185214, 1, 1, 1, 1, 1,
1.401903, -1.324959, 3.761571, 1, 1, 1, 1, 1,
1.40462, -0.3981767, 2.364148, 1, 1, 1, 1, 1,
1.407219, -0.04096039, -0.02037888, 1, 1, 1, 1, 1,
1.410946, 1.714315, 1.092636, 1, 1, 1, 1, 1,
1.416865, -0.5729768, 3.65815, 1, 1, 1, 1, 1,
1.418773, 1.609439, 1.387179, 1, 1, 1, 1, 1,
1.422008, -1.870155, 1.953645, 0, 0, 1, 1, 1,
1.42535, -0.1442291, 1.169997, 1, 0, 0, 1, 1,
1.431092, -0.7569774, 1.868086, 1, 0, 0, 1, 1,
1.438056, 0.4407055, 1.363468, 1, 0, 0, 1, 1,
1.446736, 0.3147991, 1.882323, 1, 0, 0, 1, 1,
1.453709, 1.97273, 0.3265193, 1, 0, 0, 1, 1,
1.456132, 0.6405818, 0.7314786, 0, 0, 0, 1, 1,
1.459216, 0.3577469, 1.424764, 0, 0, 0, 1, 1,
1.465471, -2.48054, 2.474264, 0, 0, 0, 1, 1,
1.471889, -0.2267624, -1.863008, 0, 0, 0, 1, 1,
1.486344, -0.08676677, 0.8382342, 0, 0, 0, 1, 1,
1.510383, -0.8311208, 1.274495, 0, 0, 0, 1, 1,
1.519375, 1.560915, 2.257889, 0, 0, 0, 1, 1,
1.536614, 1.000898, -0.00993645, 1, 1, 1, 1, 1,
1.539706, -0.6355364, 2.327805, 1, 1, 1, 1, 1,
1.573944, 0.2176538, 1.775646, 1, 1, 1, 1, 1,
1.589266, 0.220361, 0.5548303, 1, 1, 1, 1, 1,
1.608722, 0.8480344, 1.062642, 1, 1, 1, 1, 1,
1.612708, -0.02400097, 1.342892, 1, 1, 1, 1, 1,
1.61561, 0.8106741, 2.437137, 1, 1, 1, 1, 1,
1.615981, -0.4925754, 2.134619, 1, 1, 1, 1, 1,
1.624097, 0.1443498, 0.1540251, 1, 1, 1, 1, 1,
1.629839, -0.2639143, 0.791245, 1, 1, 1, 1, 1,
1.631521, 0.4473155, -0.218264, 1, 1, 1, 1, 1,
1.633425, -0.2387677, 1.265445, 1, 1, 1, 1, 1,
1.635079, 0.07392005, 0.4703524, 1, 1, 1, 1, 1,
1.647249, -0.659048, 3.778312, 1, 1, 1, 1, 1,
1.649718, 1.10233, -0.5676903, 1, 1, 1, 1, 1,
1.655236, -0.1999034, 1.356746, 0, 0, 1, 1, 1,
1.659323, -0.05017623, 1.798321, 1, 0, 0, 1, 1,
1.694315, -1.179438, 0.7452622, 1, 0, 0, 1, 1,
1.696639, -0.860579, 1.163179, 1, 0, 0, 1, 1,
1.704437, 0.03615268, -0.09255823, 1, 0, 0, 1, 1,
1.723619, -0.7604708, 2.159993, 1, 0, 0, 1, 1,
1.726525, 0.2135344, -0.008698801, 0, 0, 0, 1, 1,
1.739326, -0.1958188, 1.908298, 0, 0, 0, 1, 1,
1.752181, -0.4834779, -0.1018091, 0, 0, 0, 1, 1,
1.755742, 0.9493806, 1.33514, 0, 0, 0, 1, 1,
1.766159, -0.1029079, 1.793897, 0, 0, 0, 1, 1,
1.78107, -0.4457355, 1.923618, 0, 0, 0, 1, 1,
1.801324, 1.368837, -0.5360874, 0, 0, 0, 1, 1,
1.81398, -0.6669462, 0.7577308, 1, 1, 1, 1, 1,
1.824271, 0.6577507, 1.690458, 1, 1, 1, 1, 1,
1.900154, -0.190228, 1.47308, 1, 1, 1, 1, 1,
1.935095, -1.254711, 4.047016, 1, 1, 1, 1, 1,
1.94254, -0.5386662, 2.647089, 1, 1, 1, 1, 1,
1.949641, -0.7661566, 2.255192, 1, 1, 1, 1, 1,
2.053553, 0.7724304, 0.9953294, 1, 1, 1, 1, 1,
2.054026, -0.3631364, 4.062841, 1, 1, 1, 1, 1,
2.070156, 0.7469652, 1.243137, 1, 1, 1, 1, 1,
2.093019, -0.05786245, 1.926354, 1, 1, 1, 1, 1,
2.142884, -0.1004513, 2.022981, 1, 1, 1, 1, 1,
2.203824, -0.4080784, 1.95657, 1, 1, 1, 1, 1,
2.236163, -0.6874545, 1.375176, 1, 1, 1, 1, 1,
2.240226, -0.3198336, 2.761567, 1, 1, 1, 1, 1,
2.270025, 1.360468, 1.064911, 1, 1, 1, 1, 1,
2.336073, -0.6721299, 1.565661, 0, 0, 1, 1, 1,
2.350429, 0.1422041, 1.172194, 1, 0, 0, 1, 1,
2.380615, -1.590203, 2.089463, 1, 0, 0, 1, 1,
2.419082, -0.3044634, -0.3233213, 1, 0, 0, 1, 1,
2.42633, -0.4975201, 2.242711, 1, 0, 0, 1, 1,
2.426372, -1.569249, 0.1346923, 1, 0, 0, 1, 1,
2.441576, -1.304556, 2.719755, 0, 0, 0, 1, 1,
2.460182, -0.4861813, 1.944603, 0, 0, 0, 1, 1,
2.469679, -1.568307, 2.387849, 0, 0, 0, 1, 1,
2.477593, -0.7309632, 2.835802, 0, 0, 0, 1, 1,
2.569213, 0.02264995, -0.4467444, 0, 0, 0, 1, 1,
2.641322, 0.2865851, 1.517933, 0, 0, 0, 1, 1,
2.693761, 0.2696553, 0.652459, 0, 0, 0, 1, 1,
2.717284, -0.4117513, -0.1109502, 1, 1, 1, 1, 1,
2.744557, -0.8653031, 3.244143, 1, 1, 1, 1, 1,
2.786627, 0.09183728, 0.7159497, 1, 1, 1, 1, 1,
2.814799, 0.2142215, 2.14401, 1, 1, 1, 1, 1,
2.821951, -1.174507, 2.948441, 1, 1, 1, 1, 1,
2.848619, -0.1315307, 1.353819, 1, 1, 1, 1, 1,
3.309005, -0.5208961, 2.935074, 1, 1, 1, 1, 1
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
var radius = 9.146111;
var distance = 32.12533;
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
mvMatrix.translate( 0.006911278, -0.04317307, -0.1668687 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.12533);
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