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
-3.107898, 0.7677048, -0.8937516, 1, 0, 0, 1,
-2.836275, 1.672644, 0.2870531, 1, 0.007843138, 0, 1,
-2.804599, -1.153434, -3.21719, 1, 0.01176471, 0, 1,
-2.655149, 1.067814, -1.433325, 1, 0.01960784, 0, 1,
-2.649267, -1.020783, -1.36753, 1, 0.02352941, 0, 1,
-2.603841, -0.5166681, -1.678018, 1, 0.03137255, 0, 1,
-2.575276, -0.3880835, -1.938381, 1, 0.03529412, 0, 1,
-2.504681, 1.475424, -1.141821, 1, 0.04313726, 0, 1,
-2.488272, -0.3324572, -0.3176323, 1, 0.04705882, 0, 1,
-2.440295, 0.1198866, -2.046806, 1, 0.05490196, 0, 1,
-2.439744, 0.4076483, -3.329922, 1, 0.05882353, 0, 1,
-2.357177, -0.3608614, -1.282405, 1, 0.06666667, 0, 1,
-2.291499, -1.458494, -2.105382, 1, 0.07058824, 0, 1,
-2.234306, 0.04882476, -1.385924, 1, 0.07843138, 0, 1,
-2.195711, 1.262617, -2.562491, 1, 0.08235294, 0, 1,
-2.141425, 1.874035, -1.398413, 1, 0.09019608, 0, 1,
-2.110426, -0.5132913, -1.767121, 1, 0.09411765, 0, 1,
-2.080945, -0.5732171, -2.326139, 1, 0.1019608, 0, 1,
-2.0561, 1.077011, -1.231575, 1, 0.1098039, 0, 1,
-2.037737, 0.6396635, -0.282345, 1, 0.1137255, 0, 1,
-2.024723, -1.23622, -3.26843, 1, 0.1215686, 0, 1,
-2.016099, -0.5616989, -1.604817, 1, 0.1254902, 0, 1,
-1.965904, -0.6183841, -1.574879, 1, 0.1333333, 0, 1,
-1.964656, -1.344458, -0.2898606, 1, 0.1372549, 0, 1,
-1.958042, -0.148382, -3.393276, 1, 0.145098, 0, 1,
-1.939781, 1.566789, -1.849712, 1, 0.1490196, 0, 1,
-1.891477, -1.534742, -4.213996, 1, 0.1568628, 0, 1,
-1.868224, -1.148667, -2.204612, 1, 0.1607843, 0, 1,
-1.843808, 1.262736, -0.3790124, 1, 0.1686275, 0, 1,
-1.810043, 0.3863496, -2.313594, 1, 0.172549, 0, 1,
-1.793069, 0.2153371, 0.8424345, 1, 0.1803922, 0, 1,
-1.776356, 0.6889219, -0.976458, 1, 0.1843137, 0, 1,
-1.756771, -0.4289722, -1.341293, 1, 0.1921569, 0, 1,
-1.755606, -0.899761, -2.881041, 1, 0.1960784, 0, 1,
-1.722348, -1.823325, -2.381434, 1, 0.2039216, 0, 1,
-1.711502, 1.467343, -1.135233, 1, 0.2117647, 0, 1,
-1.705353, 0.4095413, -2.255807, 1, 0.2156863, 0, 1,
-1.699466, -1.80029, -2.241572, 1, 0.2235294, 0, 1,
-1.699383, 0.3331175, -1.292901, 1, 0.227451, 0, 1,
-1.684603, 1.248844, -1.78137, 1, 0.2352941, 0, 1,
-1.683473, 0.5326413, -2.945712, 1, 0.2392157, 0, 1,
-1.677023, -0.2359275, -3.905461, 1, 0.2470588, 0, 1,
-1.657716, 0.6071837, 0.3434159, 1, 0.2509804, 0, 1,
-1.64428, 1.335361, -1.032847, 1, 0.2588235, 0, 1,
-1.627722, 1.270178, -0.6772649, 1, 0.2627451, 0, 1,
-1.612372, 0.1171288, -2.688164, 1, 0.2705882, 0, 1,
-1.607171, -1.754714, -1.794845, 1, 0.2745098, 0, 1,
-1.60593, 0.05275815, -0.2454264, 1, 0.282353, 0, 1,
-1.565338, 0.2564248, -0.6562436, 1, 0.2862745, 0, 1,
-1.55805, 0.6304488, -3.382067, 1, 0.2941177, 0, 1,
-1.55727, 0.9071277, -0.7727762, 1, 0.3019608, 0, 1,
-1.556708, -1.219395, -1.832397, 1, 0.3058824, 0, 1,
-1.544465, -0.9951092, -1.160335, 1, 0.3137255, 0, 1,
-1.534383, 0.3970277, -1.555263, 1, 0.3176471, 0, 1,
-1.533124, 0.4661182, -0.6401199, 1, 0.3254902, 0, 1,
-1.533081, 1.4184, 0.4296468, 1, 0.3294118, 0, 1,
-1.517675, 0.7953588, -2.475225, 1, 0.3372549, 0, 1,
-1.517609, 1.049211, -2.389357, 1, 0.3411765, 0, 1,
-1.513814, 1.510124, -0.4291144, 1, 0.3490196, 0, 1,
-1.512999, 1.376946, -0.02517791, 1, 0.3529412, 0, 1,
-1.501241, -0.9524895, -2.195508, 1, 0.3607843, 0, 1,
-1.491757, 0.2672684, -3.240515, 1, 0.3647059, 0, 1,
-1.479081, 0.7362571, -2.593322, 1, 0.372549, 0, 1,
-1.47368, 0.0741151, -2.500423, 1, 0.3764706, 0, 1,
-1.469907, -0.6675994, -3.136484, 1, 0.3843137, 0, 1,
-1.451281, 0.2016039, -3.201178, 1, 0.3882353, 0, 1,
-1.429882, 0.5665787, -1.646092, 1, 0.3960784, 0, 1,
-1.428286, 0.4018236, -2.126567, 1, 0.4039216, 0, 1,
-1.425166, -0.2116884, -2.236301, 1, 0.4078431, 0, 1,
-1.423946, 1.41308, -0.9780175, 1, 0.4156863, 0, 1,
-1.422983, 0.6462659, -0.8870829, 1, 0.4196078, 0, 1,
-1.407634, -0.6629348, -1.870571, 1, 0.427451, 0, 1,
-1.404239, 0.8891982, -2.272262, 1, 0.4313726, 0, 1,
-1.404188, 1.645052, -0.4115087, 1, 0.4392157, 0, 1,
-1.402236, -0.2938648, -2.070425, 1, 0.4431373, 0, 1,
-1.394413, -0.2050625, -1.468461, 1, 0.4509804, 0, 1,
-1.385396, -0.8279904, -2.247214, 1, 0.454902, 0, 1,
-1.370703, -1.165722, -1.204065, 1, 0.4627451, 0, 1,
-1.365663, -0.2189161, -1.785148, 1, 0.4666667, 0, 1,
-1.35865, 0.05006006, -0.9624808, 1, 0.4745098, 0, 1,
-1.348084, -0.7045091, -1.811169, 1, 0.4784314, 0, 1,
-1.342371, -0.1318758, -1.614799, 1, 0.4862745, 0, 1,
-1.342213, -0.7200724, -4.717218, 1, 0.4901961, 0, 1,
-1.341146, -0.9559214, -3.11234, 1, 0.4980392, 0, 1,
-1.324905, 1.455225, -0.9642625, 1, 0.5058824, 0, 1,
-1.320601, -1.758913, -3.788262, 1, 0.509804, 0, 1,
-1.316843, 0.9857363, -0.8537434, 1, 0.5176471, 0, 1,
-1.316007, 1.06361, -2.000216, 1, 0.5215687, 0, 1,
-1.307136, -0.9816457, -3.550616, 1, 0.5294118, 0, 1,
-1.305717, 2.058246, 0.6974966, 1, 0.5333334, 0, 1,
-1.305292, -0.1050013, -1.753908, 1, 0.5411765, 0, 1,
-1.290597, -0.2536437, -1.802358, 1, 0.5450981, 0, 1,
-1.287049, -0.953709, -3.192062, 1, 0.5529412, 0, 1,
-1.28694, 1.433413, -0.2471949, 1, 0.5568628, 0, 1,
-1.27269, 0.676766, 0.1099051, 1, 0.5647059, 0, 1,
-1.272019, 1.529949, -1.051899, 1, 0.5686275, 0, 1,
-1.27136, 0.05876792, -1.229902, 1, 0.5764706, 0, 1,
-1.270509, -1.082157, -4.420783, 1, 0.5803922, 0, 1,
-1.257534, 2.147193, 2.064329, 1, 0.5882353, 0, 1,
-1.256171, -1.232872, -1.623964, 1, 0.5921569, 0, 1,
-1.253993, -0.837818, -1.495051, 1, 0.6, 0, 1,
-1.251287, 0.5353814, -1.434732, 1, 0.6078432, 0, 1,
-1.247016, -0.3384783, -0.3204402, 1, 0.6117647, 0, 1,
-1.244793, 0.08723924, -2.468807, 1, 0.6196079, 0, 1,
-1.243339, 0.3072615, -0.711063, 1, 0.6235294, 0, 1,
-1.241869, -0.1140885, -2.779219, 1, 0.6313726, 0, 1,
-1.233858, -1.347719, -3.509972, 1, 0.6352941, 0, 1,
-1.232542, -1.793277, -3.153582, 1, 0.6431373, 0, 1,
-1.231877, 0.4753041, -1.010541, 1, 0.6470588, 0, 1,
-1.227442, -0.2414667, -2.618948, 1, 0.654902, 0, 1,
-1.22414, -0.2792975, -2.118381, 1, 0.6588235, 0, 1,
-1.220774, -1.143126, -4.83653, 1, 0.6666667, 0, 1,
-1.217957, 1.452458, -0.7500732, 1, 0.6705883, 0, 1,
-1.214627, -0.4766097, -0.7381049, 1, 0.6784314, 0, 1,
-1.21255, 1.348492, 0.008551202, 1, 0.682353, 0, 1,
-1.211231, 0.02349943, -2.072416, 1, 0.6901961, 0, 1,
-1.208748, -1.162057, -1.419872, 1, 0.6941177, 0, 1,
-1.205315, 0.801221, -0.3367627, 1, 0.7019608, 0, 1,
-1.198618, -0.1806076, -0.8721269, 1, 0.7098039, 0, 1,
-1.188347, -0.6699471, -1.239615, 1, 0.7137255, 0, 1,
-1.182004, 1.878166, 1.507683, 1, 0.7215686, 0, 1,
-1.176952, 0.489272, -1.892899, 1, 0.7254902, 0, 1,
-1.17672, 0.4119937, -1.871356, 1, 0.7333333, 0, 1,
-1.176349, 1.794649, -1.488138, 1, 0.7372549, 0, 1,
-1.174339, -1.617583, -3.019775, 1, 0.7450981, 0, 1,
-1.166841, 0.06923294, -1.436199, 1, 0.7490196, 0, 1,
-1.161652, 1.266774, -1.116897, 1, 0.7568628, 0, 1,
-1.157817, -0.3439781, -3.684179, 1, 0.7607843, 0, 1,
-1.156423, 1.340856, -0.734558, 1, 0.7686275, 0, 1,
-1.154815, 0.1592073, -0.6893433, 1, 0.772549, 0, 1,
-1.14115, 1.694556, -0.06768341, 1, 0.7803922, 0, 1,
-1.12611, -0.3724946, -1.320568, 1, 0.7843137, 0, 1,
-1.123392, 0.4409925, -1.227027, 1, 0.7921569, 0, 1,
-1.119027, 0.3035258, -1.427845, 1, 0.7960784, 0, 1,
-1.117976, 0.167432, -2.509201, 1, 0.8039216, 0, 1,
-1.110538, 2.059199, -0.6396718, 1, 0.8117647, 0, 1,
-1.108231, 1.293013, -0.825563, 1, 0.8156863, 0, 1,
-1.107521, 0.08038507, -0.8445602, 1, 0.8235294, 0, 1,
-1.103083, 0.3300124, -1.347726, 1, 0.827451, 0, 1,
-1.101593, -0.2873967, -1.74137, 1, 0.8352941, 0, 1,
-1.097173, 1.358966, -0.1569549, 1, 0.8392157, 0, 1,
-1.09593, 0.8996115, -2.452504, 1, 0.8470588, 0, 1,
-1.094012, -0.2464723, -1.755372, 1, 0.8509804, 0, 1,
-1.092664, 0.3927628, -0.5979906, 1, 0.8588235, 0, 1,
-1.088438, 1.456558, 0.01590001, 1, 0.8627451, 0, 1,
-1.087499, 0.5503858, 0.05883962, 1, 0.8705882, 0, 1,
-1.086895, -0.6847043, -3.897521, 1, 0.8745098, 0, 1,
-1.08099, -0.8357847, -4.346351, 1, 0.8823529, 0, 1,
-1.07412, 0.4584723, -0.2457095, 1, 0.8862745, 0, 1,
-1.073356, 0.6952956, -1.490507, 1, 0.8941177, 0, 1,
-1.062287, -0.7976719, -2.391946, 1, 0.8980392, 0, 1,
-1.052365, 0.4590681, -0.9054722, 1, 0.9058824, 0, 1,
-1.051622, 0.5560282, -2.625886, 1, 0.9137255, 0, 1,
-1.042553, 1.457831, -1.840302, 1, 0.9176471, 0, 1,
-1.040036, 0.8597611, -2.510468, 1, 0.9254902, 0, 1,
-1.03794, 0.7836828, 0.3749505, 1, 0.9294118, 0, 1,
-1.030834, 0.05973279, -1.203119, 1, 0.9372549, 0, 1,
-1.026344, 0.687746, -2.203223, 1, 0.9411765, 0, 1,
-1.023093, 1.023401, -1.033092, 1, 0.9490196, 0, 1,
-1.022876, -0.2692744, -1.402566, 1, 0.9529412, 0, 1,
-1.015887, 1.804723, -0.4501806, 1, 0.9607843, 0, 1,
-1.015702, -1.750548, -4.023744, 1, 0.9647059, 0, 1,
-1.015285, -0.0676339, -1.926903, 1, 0.972549, 0, 1,
-1.01414, 0.5635768, -0.3665377, 1, 0.9764706, 0, 1,
-1.002531, -0.9264836, -3.14222, 1, 0.9843137, 0, 1,
-1.00213, 1.062692, 0.9020687, 1, 0.9882353, 0, 1,
-0.9982345, 0.8357403, -0.769823, 1, 0.9960784, 0, 1,
-0.9949936, -1.360349, -2.728392, 0.9960784, 1, 0, 1,
-0.9944016, -0.5081508, -2.170058, 0.9921569, 1, 0, 1,
-0.9924328, -1.300547, -1.133527, 0.9843137, 1, 0, 1,
-0.9923399, 0.5251619, -1.758886, 0.9803922, 1, 0, 1,
-0.9864125, -0.2697771, -3.183825, 0.972549, 1, 0, 1,
-0.9861479, 1.151486, 0.2053261, 0.9686275, 1, 0, 1,
-0.9853398, 0.601198, 0.6561671, 0.9607843, 1, 0, 1,
-0.9812137, 0.6483773, -2.573078, 0.9568627, 1, 0, 1,
-0.9727821, -0.6961455, -3.701292, 0.9490196, 1, 0, 1,
-0.9701295, -0.5388145, -2.308487, 0.945098, 1, 0, 1,
-0.9640012, -0.1273025, -1.453078, 0.9372549, 1, 0, 1,
-0.9618981, -0.5537787, -1.706428, 0.9333333, 1, 0, 1,
-0.9600519, -0.9686646, -0.6439692, 0.9254902, 1, 0, 1,
-0.9555975, 1.694077, -0.216013, 0.9215686, 1, 0, 1,
-0.954102, -0.1819554, -1.390808, 0.9137255, 1, 0, 1,
-0.9500484, -0.913449, -1.531218, 0.9098039, 1, 0, 1,
-0.9472473, 0.4008042, -4.050091, 0.9019608, 1, 0, 1,
-0.9448864, -1.138697, -1.161475, 0.8941177, 1, 0, 1,
-0.9430445, 1.071192, 1.413767, 0.8901961, 1, 0, 1,
-0.9397462, -0.8083735, -2.460328, 0.8823529, 1, 0, 1,
-0.9374303, -0.1448554, -0.6547263, 0.8784314, 1, 0, 1,
-0.9315769, 1.394936, 0.03034055, 0.8705882, 1, 0, 1,
-0.9298546, 1.403681, -1.807025, 0.8666667, 1, 0, 1,
-0.92928, -0.4312075, -1.294437, 0.8588235, 1, 0, 1,
-0.9287988, 1.679831, -0.438363, 0.854902, 1, 0, 1,
-0.9282349, -0.9926673, -1.954056, 0.8470588, 1, 0, 1,
-0.9226531, -0.6890397, -2.094079, 0.8431373, 1, 0, 1,
-0.9215344, -0.1187678, -0.6247957, 0.8352941, 1, 0, 1,
-0.9140205, 2.243491, 1.332792, 0.8313726, 1, 0, 1,
-0.9079446, 1.84904, -2.116408, 0.8235294, 1, 0, 1,
-0.9045703, 0.08039638, -0.9908152, 0.8196079, 1, 0, 1,
-0.9034715, 1.618535, -0.5102414, 0.8117647, 1, 0, 1,
-0.8931969, -1.153744, -2.708713, 0.8078431, 1, 0, 1,
-0.8929237, 1.194026, -0.481745, 0.8, 1, 0, 1,
-0.8899617, 2.174597, 0.4038052, 0.7921569, 1, 0, 1,
-0.889014, 0.157379, -0.9745938, 0.7882353, 1, 0, 1,
-0.8887313, 0.4488168, 0.2925947, 0.7803922, 1, 0, 1,
-0.8847269, 0.1240392, -1.963325, 0.7764706, 1, 0, 1,
-0.876067, 0.1172939, -2.007018, 0.7686275, 1, 0, 1,
-0.8752437, 0.9577282, -0.6608416, 0.7647059, 1, 0, 1,
-0.8718819, 1.399391, -1.372756, 0.7568628, 1, 0, 1,
-0.8702599, 0.5613781, -1.014314, 0.7529412, 1, 0, 1,
-0.8653557, 0.1393332, -3.504738, 0.7450981, 1, 0, 1,
-0.863941, 0.4405728, -0.05457539, 0.7411765, 1, 0, 1,
-0.8509713, 1.244148, -0.2607537, 0.7333333, 1, 0, 1,
-0.8506218, -1.075318, -1.526075, 0.7294118, 1, 0, 1,
-0.8470323, -0.5719572, -3.048105, 0.7215686, 1, 0, 1,
-0.8425879, -0.0637285, 0.2436104, 0.7176471, 1, 0, 1,
-0.8409018, -1.695703, -1.12805, 0.7098039, 1, 0, 1,
-0.8399488, -0.9652432, -3.412456, 0.7058824, 1, 0, 1,
-0.8380761, -0.7494377, -2.80975, 0.6980392, 1, 0, 1,
-0.8271807, 1.232815, -0.7793198, 0.6901961, 1, 0, 1,
-0.82666, -0.2991154, -2.315048, 0.6862745, 1, 0, 1,
-0.8241955, 1.242499, -0.8167559, 0.6784314, 1, 0, 1,
-0.8188121, -0.3087454, -1.019475, 0.6745098, 1, 0, 1,
-0.8180446, -0.05520087, -1.915703, 0.6666667, 1, 0, 1,
-0.8168899, -2.414038, -0.9234816, 0.6627451, 1, 0, 1,
-0.8072346, -0.3516891, -2.258765, 0.654902, 1, 0, 1,
-0.8069274, 0.2885333, -1.589337, 0.6509804, 1, 0, 1,
-0.8067595, -0.5651081, -0.4439572, 0.6431373, 1, 0, 1,
-0.8046584, 0.9448961, 0.3319187, 0.6392157, 1, 0, 1,
-0.8040885, 2.800673, 1.092406, 0.6313726, 1, 0, 1,
-0.8027929, 1.072931, -0.7930666, 0.627451, 1, 0, 1,
-0.797848, -0.7259017, -1.752799, 0.6196079, 1, 0, 1,
-0.7975999, 0.3468925, -1.751639, 0.6156863, 1, 0, 1,
-0.7926896, -1.218436, -2.337555, 0.6078432, 1, 0, 1,
-0.7907962, 0.06162824, -2.449624, 0.6039216, 1, 0, 1,
-0.7847312, -0.5122362, -1.663838, 0.5960785, 1, 0, 1,
-0.779411, 0.4911609, -2.092643, 0.5882353, 1, 0, 1,
-0.7790611, -1.529477, -4.020686, 0.5843138, 1, 0, 1,
-0.7701108, -0.704229, -3.535419, 0.5764706, 1, 0, 1,
-0.766126, -1.105601, -3.028113, 0.572549, 1, 0, 1,
-0.7616065, 0.7133326, -0.5113674, 0.5647059, 1, 0, 1,
-0.7602304, -1.248495, -1.923053, 0.5607843, 1, 0, 1,
-0.7523002, 1.691072, -1.390118, 0.5529412, 1, 0, 1,
-0.748799, 0.1633142, 0.2210013, 0.5490196, 1, 0, 1,
-0.7487406, -0.6727208, -3.927798, 0.5411765, 1, 0, 1,
-0.7473486, -1.500977, -1.853645, 0.5372549, 1, 0, 1,
-0.7441235, -0.021343, -0.4856449, 0.5294118, 1, 0, 1,
-0.7422034, 1.014713, -1.269485, 0.5254902, 1, 0, 1,
-0.736989, 1.060005, -0.6928627, 0.5176471, 1, 0, 1,
-0.7338447, -1.671696, -3.656297, 0.5137255, 1, 0, 1,
-0.7209265, -1.678763, -2.307091, 0.5058824, 1, 0, 1,
-0.7148544, 0.06863022, -1.782887, 0.5019608, 1, 0, 1,
-0.713125, -0.3976286, -1.592494, 0.4941176, 1, 0, 1,
-0.7130767, -0.4892636, -4.81798, 0.4862745, 1, 0, 1,
-0.7130641, 1.219486, -0.9946481, 0.4823529, 1, 0, 1,
-0.7075372, -0.1958138, -0.3387535, 0.4745098, 1, 0, 1,
-0.7056127, -0.5927818, -1.261564, 0.4705882, 1, 0, 1,
-0.7000273, -0.7371417, -2.531308, 0.4627451, 1, 0, 1,
-0.6981822, 0.5567133, -2.720865, 0.4588235, 1, 0, 1,
-0.6950725, 0.6203049, -0.1790335, 0.4509804, 1, 0, 1,
-0.6930071, -0.9576693, -2.091818, 0.4470588, 1, 0, 1,
-0.6928753, 0.8791552, -0.2177182, 0.4392157, 1, 0, 1,
-0.6916904, -1.241063, -0.9149597, 0.4352941, 1, 0, 1,
-0.6911345, -0.8984019, -2.466331, 0.427451, 1, 0, 1,
-0.6892538, -0.1363287, -1.815443, 0.4235294, 1, 0, 1,
-0.6821839, 0.1651179, -2.222461, 0.4156863, 1, 0, 1,
-0.6804307, 0.4554328, -1.978706, 0.4117647, 1, 0, 1,
-0.6791028, -0.3422373, -2.08359, 0.4039216, 1, 0, 1,
-0.6764386, 0.2956183, -1.88389, 0.3960784, 1, 0, 1,
-0.6688128, -2.163163, -2.408025, 0.3921569, 1, 0, 1,
-0.6664249, 0.2323051, -0.3410374, 0.3843137, 1, 0, 1,
-0.6658601, 0.1799948, 1.067067, 0.3803922, 1, 0, 1,
-0.6632929, 0.4544764, -1.558433, 0.372549, 1, 0, 1,
-0.6592782, 0.07273366, -1.645056, 0.3686275, 1, 0, 1,
-0.6546293, -0.220774, -0.6063498, 0.3607843, 1, 0, 1,
-0.6489137, -1.943985, -2.303261, 0.3568628, 1, 0, 1,
-0.647379, 0.05932164, -1.90058, 0.3490196, 1, 0, 1,
-0.646911, 0.7208382, 0.3090596, 0.345098, 1, 0, 1,
-0.6442184, 1.624499, -0.6038261, 0.3372549, 1, 0, 1,
-0.6434731, 0.3125098, -0.3916896, 0.3333333, 1, 0, 1,
-0.6370674, 2.462987, 0.4964035, 0.3254902, 1, 0, 1,
-0.6352939, -1.427105, -2.485972, 0.3215686, 1, 0, 1,
-0.6297005, 0.906258, -0.0861259, 0.3137255, 1, 0, 1,
-0.6293227, -0.8870566, -1.356706, 0.3098039, 1, 0, 1,
-0.6262967, -2.743912, -2.672731, 0.3019608, 1, 0, 1,
-0.6250337, 0.9132935, 0.02614276, 0.2941177, 1, 0, 1,
-0.6242223, -2.16218, -3.053084, 0.2901961, 1, 0, 1,
-0.6154287, -1.614215, -2.976151, 0.282353, 1, 0, 1,
-0.6149686, -1.043262, -0.5365618, 0.2784314, 1, 0, 1,
-0.611952, -0.2694117, -2.6507, 0.2705882, 1, 0, 1,
-0.6100823, -0.8190528, -2.571037, 0.2666667, 1, 0, 1,
-0.6085247, -0.1181508, -1.925535, 0.2588235, 1, 0, 1,
-0.5994052, -0.3548368, -1.782604, 0.254902, 1, 0, 1,
-0.5947993, 0.1990892, -1.731587, 0.2470588, 1, 0, 1,
-0.591957, -0.9016592, -3.502853, 0.2431373, 1, 0, 1,
-0.5881106, 0.003454073, -1.677799, 0.2352941, 1, 0, 1,
-0.588091, 0.2878268, 1.185289, 0.2313726, 1, 0, 1,
-0.5860768, 0.2703037, 0.1719308, 0.2235294, 1, 0, 1,
-0.5857443, -1.140334, -1.927285, 0.2196078, 1, 0, 1,
-0.5844163, -0.7266176, -3.151251, 0.2117647, 1, 0, 1,
-0.5742158, -0.5830869, -2.267828, 0.2078431, 1, 0, 1,
-0.5703908, -0.3711134, -1.783893, 0.2, 1, 0, 1,
-0.5683039, 1.732466, -0.4787275, 0.1921569, 1, 0, 1,
-0.5675475, -0.1854843, -2.288907, 0.1882353, 1, 0, 1,
-0.5623288, -0.2356802, -2.3088, 0.1803922, 1, 0, 1,
-0.5549133, -0.6896118, -3.427727, 0.1764706, 1, 0, 1,
-0.5468572, 0.02208902, -1.753276, 0.1686275, 1, 0, 1,
-0.5420734, 0.4037109, 0.00734043, 0.1647059, 1, 0, 1,
-0.5417832, 1.266061, -0.6591737, 0.1568628, 1, 0, 1,
-0.5405561, 0.1765017, -2.012757, 0.1529412, 1, 0, 1,
-0.5404414, 1.553409, -2.197452, 0.145098, 1, 0, 1,
-0.5399902, -1.090129, -2.003778, 0.1411765, 1, 0, 1,
-0.5343952, -0.7955768, -3.856088, 0.1333333, 1, 0, 1,
-0.5311992, 0.05950382, -1.323399, 0.1294118, 1, 0, 1,
-0.5300769, -0.003893132, -1.405729, 0.1215686, 1, 0, 1,
-0.5290335, -1.588349, -1.351302, 0.1176471, 1, 0, 1,
-0.5231702, -1.49614, -2.275369, 0.1098039, 1, 0, 1,
-0.5228716, -2.719805, -1.988343, 0.1058824, 1, 0, 1,
-0.5078394, -0.1614246, -2.787531, 0.09803922, 1, 0, 1,
-0.4999283, 0.7235366, -1.328023, 0.09019608, 1, 0, 1,
-0.4966709, 0.2938307, -0.5308541, 0.08627451, 1, 0, 1,
-0.4941922, -0.6800511, -2.229282, 0.07843138, 1, 0, 1,
-0.4895926, -1.345131, -3.480842, 0.07450981, 1, 0, 1,
-0.4889217, -0.1036082, -2.583429, 0.06666667, 1, 0, 1,
-0.4858868, 0.08421081, -2.184665, 0.0627451, 1, 0, 1,
-0.4848883, -2.234429, -3.747702, 0.05490196, 1, 0, 1,
-0.4842617, -0.8684006, -1.494377, 0.05098039, 1, 0, 1,
-0.4830071, 0.3965396, -0.7211052, 0.04313726, 1, 0, 1,
-0.4813196, -1.139472, -1.078501, 0.03921569, 1, 0, 1,
-0.4799874, 0.3956839, -0.9011322, 0.03137255, 1, 0, 1,
-0.4797759, 0.3262858, -0.6301152, 0.02745098, 1, 0, 1,
-0.4791004, 1.460034, 0.4057835, 0.01960784, 1, 0, 1,
-0.476102, 1.519944, -1.968258, 0.01568628, 1, 0, 1,
-0.4725608, -0.9838355, -3.609917, 0.007843138, 1, 0, 1,
-0.4686243, 0.05059221, -0.8816382, 0.003921569, 1, 0, 1,
-0.4679151, -2.006272, -4.390699, 0, 1, 0.003921569, 1,
-0.4669007, 0.1955042, -2.359131, 0, 1, 0.01176471, 1,
-0.4626286, -0.7541729, -3.967348, 0, 1, 0.01568628, 1,
-0.4593868, 0.03902375, -1.683261, 0, 1, 0.02352941, 1,
-0.4586383, -0.8584948, -3.504025, 0, 1, 0.02745098, 1,
-0.4532616, -0.1682552, -2.697409, 0, 1, 0.03529412, 1,
-0.4517562, -1.190891, -3.81706, 0, 1, 0.03921569, 1,
-0.4504428, -0.2382603, -4.062164, 0, 1, 0.04705882, 1,
-0.447456, 0.2791852, 0.3101636, 0, 1, 0.05098039, 1,
-0.4452802, -0.422705, -1.270427, 0, 1, 0.05882353, 1,
-0.4417292, 0.28185, -1.225084, 0, 1, 0.0627451, 1,
-0.4389129, -1.376566, -3.083616, 0, 1, 0.07058824, 1,
-0.435992, -0.6837974, -2.316122, 0, 1, 0.07450981, 1,
-0.4345983, -0.06635477, -0.7454193, 0, 1, 0.08235294, 1,
-0.4318016, -1.20552, -2.132207, 0, 1, 0.08627451, 1,
-0.4289541, 2.102376, -0.3627901, 0, 1, 0.09411765, 1,
-0.4236417, -0.6038432, -2.524969, 0, 1, 0.1019608, 1,
-0.4226504, 1.256909, -0.9389579, 0, 1, 0.1058824, 1,
-0.4222699, 0.2574458, -0.4657266, 0, 1, 0.1137255, 1,
-0.4194066, 0.7542722, 0.285178, 0, 1, 0.1176471, 1,
-0.4188011, -0.1274364, -2.717787, 0, 1, 0.1254902, 1,
-0.4175685, 0.9473488, 0.2771902, 0, 1, 0.1294118, 1,
-0.4160081, -0.1878494, -1.835971, 0, 1, 0.1372549, 1,
-0.4127367, -0.03892621, -0.2130857, 0, 1, 0.1411765, 1,
-0.4124962, -0.768694, -3.419253, 0, 1, 0.1490196, 1,
-0.4102698, -0.4061944, -2.056162, 0, 1, 0.1529412, 1,
-0.4075916, 1.657358, 0.4958934, 0, 1, 0.1607843, 1,
-0.4032562, -1.61334, -2.773496, 0, 1, 0.1647059, 1,
-0.3966701, -0.1110289, -2.777063, 0, 1, 0.172549, 1,
-0.394708, 0.09687162, -2.610467, 0, 1, 0.1764706, 1,
-0.3915215, 0.2384422, -2.754279, 0, 1, 0.1843137, 1,
-0.3880208, -0.02178015, -0.977645, 0, 1, 0.1882353, 1,
-0.3876911, 1.53153, -1.534943, 0, 1, 0.1960784, 1,
-0.3781237, -1.015498, -3.274816, 0, 1, 0.2039216, 1,
-0.3740312, 0.8796572, -0.08651502, 0, 1, 0.2078431, 1,
-0.3708118, -1.191263, -2.003055, 0, 1, 0.2156863, 1,
-0.367691, 0.02819154, -1.06194, 0, 1, 0.2196078, 1,
-0.3671675, -0.3729323, -2.543046, 0, 1, 0.227451, 1,
-0.3667057, -0.08011302, -3.246846, 0, 1, 0.2313726, 1,
-0.366633, -0.2342688, -2.291648, 0, 1, 0.2392157, 1,
-0.3644993, 1.475866, -2.662469, 0, 1, 0.2431373, 1,
-0.362675, -0.02265592, -1.737895, 0, 1, 0.2509804, 1,
-0.3588621, 1.083038, 1.519806, 0, 1, 0.254902, 1,
-0.3542395, 1.340906, -0.05274293, 0, 1, 0.2627451, 1,
-0.3523785, -0.7508062, -1.531375, 0, 1, 0.2666667, 1,
-0.3486836, 0.8229218, -0.1825747, 0, 1, 0.2745098, 1,
-0.3486419, 0.7834873, 0.1875713, 0, 1, 0.2784314, 1,
-0.3484166, 0.5475111, -1.08873, 0, 1, 0.2862745, 1,
-0.3440937, 1.027866, -0.2861874, 0, 1, 0.2901961, 1,
-0.3409173, -0.3554144, -2.326871, 0, 1, 0.2980392, 1,
-0.3298106, 0.279769, -1.650302, 0, 1, 0.3058824, 1,
-0.3249906, -0.1142938, -2.526389, 0, 1, 0.3098039, 1,
-0.3238148, -2.006859, -3.385154, 0, 1, 0.3176471, 1,
-0.3202195, 0.8225884, -0.8650792, 0, 1, 0.3215686, 1,
-0.3180436, 1.081462, -1.071243, 0, 1, 0.3294118, 1,
-0.3124038, -0.9968309, -2.911084, 0, 1, 0.3333333, 1,
-0.3077294, -0.1514323, -4.111258, 0, 1, 0.3411765, 1,
-0.3046679, -0.3286321, -3.588517, 0, 1, 0.345098, 1,
-0.3022478, -0.1632442, -2.088027, 0, 1, 0.3529412, 1,
-0.3020151, 1.049388, -1.391761, 0, 1, 0.3568628, 1,
-0.300416, 1.226682, 0.7121567, 0, 1, 0.3647059, 1,
-0.2935621, -0.03453702, -2.366636, 0, 1, 0.3686275, 1,
-0.2863828, 0.7442698, -1.087183, 0, 1, 0.3764706, 1,
-0.2849644, 1.424207, -0.4092214, 0, 1, 0.3803922, 1,
-0.2818692, -0.3720891, -0.6801659, 0, 1, 0.3882353, 1,
-0.275575, 0.9642169, 1.082651, 0, 1, 0.3921569, 1,
-0.2749268, 0.406747, -0.6725266, 0, 1, 0.4, 1,
-0.2729125, 1.651462, -1.355663, 0, 1, 0.4078431, 1,
-0.2717209, 0.6431063, 1.008295, 0, 1, 0.4117647, 1,
-0.2706235, -0.09518289, -1.232882, 0, 1, 0.4196078, 1,
-0.2693383, -0.5480283, -2.575267, 0, 1, 0.4235294, 1,
-0.2684049, 0.7446309, 1.618712, 0, 1, 0.4313726, 1,
-0.2643927, -0.485741, -2.916711, 0, 1, 0.4352941, 1,
-0.2638872, -0.303376, -1.807466, 0, 1, 0.4431373, 1,
-0.2613714, -0.2172146, -3.011015, 0, 1, 0.4470588, 1,
-0.2582678, 0.3289686, -0.002831246, 0, 1, 0.454902, 1,
-0.2555883, -0.8377987, -3.610659, 0, 1, 0.4588235, 1,
-0.2553023, 2.015817, 0.6813715, 0, 1, 0.4666667, 1,
-0.2540238, -0.4741127, -1.448223, 0, 1, 0.4705882, 1,
-0.2526524, 1.151173, -0.1411837, 0, 1, 0.4784314, 1,
-0.2513295, 0.5266722, 0.5123767, 0, 1, 0.4823529, 1,
-0.2493684, 1.524553, -0.1236201, 0, 1, 0.4901961, 1,
-0.2397048, 0.7128242, -3.625827, 0, 1, 0.4941176, 1,
-0.2393337, 0.08006586, -1.977968, 0, 1, 0.5019608, 1,
-0.2393155, -0.1989035, -2.020612, 0, 1, 0.509804, 1,
-0.2327302, -0.7065111, -2.56025, 0, 1, 0.5137255, 1,
-0.2299157, -2.675467, -2.240975, 0, 1, 0.5215687, 1,
-0.2261228, -0.3342236, -2.594926, 0, 1, 0.5254902, 1,
-0.2250735, 0.5028503, -1.345191, 0, 1, 0.5333334, 1,
-0.2235764, -0.1249621, -3.241461, 0, 1, 0.5372549, 1,
-0.2200847, -0.2897076, -2.826285, 0, 1, 0.5450981, 1,
-0.2179961, -0.7987394, -4.150623, 0, 1, 0.5490196, 1,
-0.216702, 1.2735, -0.5808537, 0, 1, 0.5568628, 1,
-0.2135438, -2.858466, -1.738634, 0, 1, 0.5607843, 1,
-0.2095606, 1.229542, -0.5776671, 0, 1, 0.5686275, 1,
-0.2076332, -0.2283058, -3.30847, 0, 1, 0.572549, 1,
-0.2018602, -0.4880092, -2.172704, 0, 1, 0.5803922, 1,
-0.2013733, 1.577161, -2.07623, 0, 1, 0.5843138, 1,
-0.1852835, -1.54549, -1.765181, 0, 1, 0.5921569, 1,
-0.1827819, -0.9529544, -2.366307, 0, 1, 0.5960785, 1,
-0.1768785, -0.3984853, -2.596563, 0, 1, 0.6039216, 1,
-0.1739018, 0.2329445, -1.893046, 0, 1, 0.6117647, 1,
-0.1721522, -0.6292259, -3.825733, 0, 1, 0.6156863, 1,
-0.1689572, -0.6310431, -1.387935, 0, 1, 0.6235294, 1,
-0.1686811, 0.4144979, -2.26788, 0, 1, 0.627451, 1,
-0.1679483, 1.550133, 0.07358442, 0, 1, 0.6352941, 1,
-0.1638793, 1.44873, -0.8817951, 0, 1, 0.6392157, 1,
-0.1621632, -0.1894553, -2.526652, 0, 1, 0.6470588, 1,
-0.1508275, -2.268748, -2.440171, 0, 1, 0.6509804, 1,
-0.1488452, 0.2375461, -0.378018, 0, 1, 0.6588235, 1,
-0.1462524, 1.170474, -0.6089513, 0, 1, 0.6627451, 1,
-0.1460765, -3.401841, -3.864447, 0, 1, 0.6705883, 1,
-0.1438669, 1.019548, 0.4930552, 0, 1, 0.6745098, 1,
-0.1413094, -1.242585, -3.765445, 0, 1, 0.682353, 1,
-0.141054, -0.6891048, -2.006523, 0, 1, 0.6862745, 1,
-0.1398644, 0.1117991, -0.683466, 0, 1, 0.6941177, 1,
-0.1381763, 0.06040671, -0.5180673, 0, 1, 0.7019608, 1,
-0.1361452, 2.001016, 0.6423648, 0, 1, 0.7058824, 1,
-0.1301613, -1.552264, -2.74589, 0, 1, 0.7137255, 1,
-0.1290405, 0.3332983, -0.07289658, 0, 1, 0.7176471, 1,
-0.1273506, 2.410534, -0.1173661, 0, 1, 0.7254902, 1,
-0.1265259, -0.492816, -3.71099, 0, 1, 0.7294118, 1,
-0.1249905, 0.5183127, -0.04747015, 0, 1, 0.7372549, 1,
-0.1212172, 0.1405412, -1.307058, 0, 1, 0.7411765, 1,
-0.1135894, 0.3240386, -1.321148, 0, 1, 0.7490196, 1,
-0.1114156, 1.237827, -0.7574147, 0, 1, 0.7529412, 1,
-0.1066868, 0.6333907, -1.299816, 0, 1, 0.7607843, 1,
-0.1039657, -0.362992, -2.222775, 0, 1, 0.7647059, 1,
-0.1030485, 0.3326226, -0.1204354, 0, 1, 0.772549, 1,
-0.1009239, 0.7243826, 1.386741, 0, 1, 0.7764706, 1,
-0.09259944, 1.869552, 0.8736681, 0, 1, 0.7843137, 1,
-0.0854573, 0.8990026, 0.6989632, 0, 1, 0.7882353, 1,
-0.08331135, 0.04903187, 0.01006983, 0, 1, 0.7960784, 1,
-0.08298887, 0.29541, 0.2925464, 0, 1, 0.8039216, 1,
-0.08155311, 1.048191, 0.1648557, 0, 1, 0.8078431, 1,
-0.0814587, 0.5498684, 1.35969, 0, 1, 0.8156863, 1,
-0.07976352, -1.134634, -4.227926, 0, 1, 0.8196079, 1,
-0.0789306, 0.2564132, 0.1842144, 0, 1, 0.827451, 1,
-0.07861483, -1.161311, -2.767311, 0, 1, 0.8313726, 1,
-0.07787591, 0.1752376, -1.360456, 0, 1, 0.8392157, 1,
-0.07665644, 0.0115324, -3.414464, 0, 1, 0.8431373, 1,
-0.07126388, 0.2120348, -0.256515, 0, 1, 0.8509804, 1,
-0.07072546, 1.574836, -0.2207212, 0, 1, 0.854902, 1,
-0.06746589, -0.2071171, -2.489034, 0, 1, 0.8627451, 1,
-0.06744883, -1.909063, -2.261809, 0, 1, 0.8666667, 1,
-0.06551319, -0.6711327, -1.248258, 0, 1, 0.8745098, 1,
-0.05947668, -1.361802, -3.237509, 0, 1, 0.8784314, 1,
-0.05560892, -1.039874, -4.05602, 0, 1, 0.8862745, 1,
-0.05183502, -1.271466, -2.098041, 0, 1, 0.8901961, 1,
-0.05159202, 0.3026116, -0.1832139, 0, 1, 0.8980392, 1,
-0.05054212, -0.1220705, -1.961919, 0, 1, 0.9058824, 1,
-0.05039523, -1.458829, -2.552164, 0, 1, 0.9098039, 1,
-0.04562814, -0.6897863, -4.375607, 0, 1, 0.9176471, 1,
-0.04493834, 0.4584645, -1.26502, 0, 1, 0.9215686, 1,
-0.04452263, 1.401869, 0.3801697, 0, 1, 0.9294118, 1,
-0.04045313, -0.2041277, -4.166219, 0, 1, 0.9333333, 1,
-0.0381901, 0.2000086, -0.7675131, 0, 1, 0.9411765, 1,
-0.03658877, -1.264772, -4.927793, 0, 1, 0.945098, 1,
-0.03482116, -2.226986, -2.880095, 0, 1, 0.9529412, 1,
-0.03081878, 0.06645047, -1.194361, 0, 1, 0.9568627, 1,
-0.02823748, -0.02387321, -3.773805, 0, 1, 0.9647059, 1,
-0.02807838, 2.66868, -0.3258964, 0, 1, 0.9686275, 1,
-0.02581337, -0.03031779, -2.841945, 0, 1, 0.9764706, 1,
-0.02536894, 0.7778682, -0.5457115, 0, 1, 0.9803922, 1,
-0.02498001, -0.328338, -3.358142, 0, 1, 0.9882353, 1,
-0.02251269, -0.8145787, -4.225284, 0, 1, 0.9921569, 1,
-0.01622871, 0.1341469, 0.5934116, 0, 1, 1, 1,
-0.01610282, 1.024462, 0.02609369, 0, 0.9921569, 1, 1,
-0.0129258, 0.829647, -0.298345, 0, 0.9882353, 1, 1,
-0.01166755, -0.6677052, -2.691943, 0, 0.9803922, 1, 1,
-0.01060838, 0.3767014, 0.5641437, 0, 0.9764706, 1, 1,
-0.008762993, 0.308786, 0.1696961, 0, 0.9686275, 1, 1,
-0.007415959, 0.005568922, -0.4529094, 0, 0.9647059, 1, 1,
-0.007192613, -0.3695537, -3.420312, 0, 0.9568627, 1, 1,
-0.002389329, 0.5321861, -0.4182502, 0, 0.9529412, 1, 1,
0.003923883, -0.1196929, 1.461901, 0, 0.945098, 1, 1,
0.006718504, -2.081763, 3.278447, 0, 0.9411765, 1, 1,
0.01023221, -0.1977988, 3.337715, 0, 0.9333333, 1, 1,
0.01138015, 0.7996354, 0.7834483, 0, 0.9294118, 1, 1,
0.01300378, 1.253717, 0.1775777, 0, 0.9215686, 1, 1,
0.01317715, -0.008269403, 2.984667, 0, 0.9176471, 1, 1,
0.01401674, 0.1507286, 0.007374382, 0, 0.9098039, 1, 1,
0.01562054, 0.7479672, 1.310183, 0, 0.9058824, 1, 1,
0.01678429, -1.041853, 2.886937, 0, 0.8980392, 1, 1,
0.01689286, -0.237423, 4.175772, 0, 0.8901961, 1, 1,
0.01692929, 0.2914021, 1.029944, 0, 0.8862745, 1, 1,
0.02000007, -1.480961, 2.985737, 0, 0.8784314, 1, 1,
0.02079994, 1.14642, -0.3988977, 0, 0.8745098, 1, 1,
0.02163843, 0.8850546, -1.704195, 0, 0.8666667, 1, 1,
0.02354379, -0.5592571, 1.578495, 0, 0.8627451, 1, 1,
0.02394456, -1.228137, 3.684574, 0, 0.854902, 1, 1,
0.03099588, -0.448273, 3.477222, 0, 0.8509804, 1, 1,
0.03267056, -1.010676, 1.273721, 0, 0.8431373, 1, 1,
0.03660765, 1.779667, 1.008925, 0, 0.8392157, 1, 1,
0.04183542, -1.748152, 1.42375, 0, 0.8313726, 1, 1,
0.04737996, -1.451914, 3.167701, 0, 0.827451, 1, 1,
0.04787325, 0.2133659, 0.9052237, 0, 0.8196079, 1, 1,
0.05175265, -1.226788, 2.999715, 0, 0.8156863, 1, 1,
0.05689067, 1.32442, -0.7238762, 0, 0.8078431, 1, 1,
0.05793288, 0.3229107, -0.2496165, 0, 0.8039216, 1, 1,
0.06111431, -0.9214244, 3.654643, 0, 0.7960784, 1, 1,
0.06493183, 1.120826, 1.324997, 0, 0.7882353, 1, 1,
0.06634774, 0.5344169, -0.04550176, 0, 0.7843137, 1, 1,
0.06733209, 0.9151049, -1.826659, 0, 0.7764706, 1, 1,
0.06978413, 0.4515204, -1.81143, 0, 0.772549, 1, 1,
0.07021424, 0.0790898, 1.925174, 0, 0.7647059, 1, 1,
0.07169549, -1.046871, 2.766515, 0, 0.7607843, 1, 1,
0.07754251, -0.7130374, 2.281251, 0, 0.7529412, 1, 1,
0.08686887, 1.053264, -1.195523, 0, 0.7490196, 1, 1,
0.0869241, 0.5999765, -1.082091, 0, 0.7411765, 1, 1,
0.08930271, -0.3558865, 2.514195, 0, 0.7372549, 1, 1,
0.09114106, -2.013714, 3.714111, 0, 0.7294118, 1, 1,
0.09209178, -1.650647, 4.648549, 0, 0.7254902, 1, 1,
0.09622693, 1.415112, 0.2552528, 0, 0.7176471, 1, 1,
0.09785656, -0.09274546, 2.322524, 0, 0.7137255, 1, 1,
0.1034717, 0.8559586, 1.650144, 0, 0.7058824, 1, 1,
0.1116718, 0.05242646, 1.207022, 0, 0.6980392, 1, 1,
0.1132805, 1.0314, -2.050928, 0, 0.6941177, 1, 1,
0.1139107, 0.4522336, -0.3693829, 0, 0.6862745, 1, 1,
0.1153552, 0.4577079, -0.9679348, 0, 0.682353, 1, 1,
0.119366, 0.1697802, 2.358989, 0, 0.6745098, 1, 1,
0.1202377, 0.09438664, 2.148007, 0, 0.6705883, 1, 1,
0.1250728, -0.149586, 3.107096, 0, 0.6627451, 1, 1,
0.1253644, -0.7116045, 3.53372, 0, 0.6588235, 1, 1,
0.125445, 0.9357231, 0.1874659, 0, 0.6509804, 1, 1,
0.1361814, -0.4659143, 2.861443, 0, 0.6470588, 1, 1,
0.1369914, -0.2265632, 4.334954, 0, 0.6392157, 1, 1,
0.1400717, -1.508206, 4.897333, 0, 0.6352941, 1, 1,
0.14423, 0.9102262, -1.169105, 0, 0.627451, 1, 1,
0.1446337, 0.02102835, 2.448857, 0, 0.6235294, 1, 1,
0.1478706, -1.049696, 3.201765, 0, 0.6156863, 1, 1,
0.1518339, -1.048895, 3.740534, 0, 0.6117647, 1, 1,
0.1567723, -0.8183255, 1.8452, 0, 0.6039216, 1, 1,
0.1649243, 0.008658795, 1.538335, 0, 0.5960785, 1, 1,
0.1662741, -0.4473858, 3.708142, 0, 0.5921569, 1, 1,
0.1686992, 0.8946813, 0.9542304, 0, 0.5843138, 1, 1,
0.1691496, -0.8184611, 2.920205, 0, 0.5803922, 1, 1,
0.1729305, 0.5722694, 0.06234996, 0, 0.572549, 1, 1,
0.1736549, 1.127528, -1.234957, 0, 0.5686275, 1, 1,
0.1771811, 0.8577644, -1.130955, 0, 0.5607843, 1, 1,
0.1779942, -1.715877, 4.049419, 0, 0.5568628, 1, 1,
0.1789265, 0.5371444, -0.2237871, 0, 0.5490196, 1, 1,
0.1789933, -0.2310413, 2.931354, 0, 0.5450981, 1, 1,
0.181139, 2.441508, 0.01978117, 0, 0.5372549, 1, 1,
0.1858726, 0.1785065, 2.596593, 0, 0.5333334, 1, 1,
0.1877969, 0.01156007, 1.204273, 0, 0.5254902, 1, 1,
0.1898677, -1.294686, 3.642925, 0, 0.5215687, 1, 1,
0.193393, -0.6131526, 4.056561, 0, 0.5137255, 1, 1,
0.1947238, -1.076939, 4.372766, 0, 0.509804, 1, 1,
0.1952282, -1.444263, 2.518612, 0, 0.5019608, 1, 1,
0.1957026, -0.3903867, 1.973512, 0, 0.4941176, 1, 1,
0.2015336, -0.8387318, 2.03975, 0, 0.4901961, 1, 1,
0.2046435, 0.1763395, -0.5336423, 0, 0.4823529, 1, 1,
0.2081546, -0.03533849, 0.2014542, 0, 0.4784314, 1, 1,
0.2120403, 1.298398, -0.06580858, 0, 0.4705882, 1, 1,
0.2162634, 0.1312477, 0.729899, 0, 0.4666667, 1, 1,
0.2289245, -2.388365, 3.837892, 0, 0.4588235, 1, 1,
0.2337078, 0.06411359, 1.845865, 0, 0.454902, 1, 1,
0.2381115, 0.05516282, 1.373626, 0, 0.4470588, 1, 1,
0.2397588, 0.2676423, 2.105605, 0, 0.4431373, 1, 1,
0.2408432, -2.605833, 1.269337, 0, 0.4352941, 1, 1,
0.2416255, -0.9006743, 4.398022, 0, 0.4313726, 1, 1,
0.24191, 0.3306411, -1.122212, 0, 0.4235294, 1, 1,
0.2425099, 1.275268, 1.187518, 0, 0.4196078, 1, 1,
0.2488843, -0.1854827, 3.486873, 0, 0.4117647, 1, 1,
0.2503132, 1.806553, -0.4609923, 0, 0.4078431, 1, 1,
0.2506825, 1.190152, 1.408009, 0, 0.4, 1, 1,
0.2517692, 0.6713728, 0.05302798, 0, 0.3921569, 1, 1,
0.2549173, 0.5826322, 0.4374176, 0, 0.3882353, 1, 1,
0.2557654, 0.5788051, -0.6431312, 0, 0.3803922, 1, 1,
0.2598765, -0.4044612, 2.515469, 0, 0.3764706, 1, 1,
0.2605736, -0.3023493, 1.54285, 0, 0.3686275, 1, 1,
0.2613876, -0.1869337, 0.01046275, 0, 0.3647059, 1, 1,
0.2632874, 0.3652172, 0.8606079, 0, 0.3568628, 1, 1,
0.2634504, 0.5820179, -0.1276893, 0, 0.3529412, 1, 1,
0.2636265, -0.9333391, 1.637215, 0, 0.345098, 1, 1,
0.2655792, -1.035125, 2.300937, 0, 0.3411765, 1, 1,
0.2659728, 0.7396414, -1.603009, 0, 0.3333333, 1, 1,
0.266849, -1.705485, 3.380502, 0, 0.3294118, 1, 1,
0.2673576, -1.639099, 3.227925, 0, 0.3215686, 1, 1,
0.2693903, 0.08860534, 2.061534, 0, 0.3176471, 1, 1,
0.2731574, 0.03994891, 1.317139, 0, 0.3098039, 1, 1,
0.2795551, 0.962244, -0.2244911, 0, 0.3058824, 1, 1,
0.2800888, -0.5035369, 4.313243, 0, 0.2980392, 1, 1,
0.2836291, -0.8809122, 2.947548, 0, 0.2901961, 1, 1,
0.2843119, -1.602749, 3.720939, 0, 0.2862745, 1, 1,
0.2850318, 1.426357, 0.9100408, 0, 0.2784314, 1, 1,
0.2878381, 0.8470433, 0.5262787, 0, 0.2745098, 1, 1,
0.2894266, -0.106567, 2.368014, 0, 0.2666667, 1, 1,
0.2894573, 0.2826842, 0.5655569, 0, 0.2627451, 1, 1,
0.2957406, -1.255869, 2.299355, 0, 0.254902, 1, 1,
0.2967755, 1.407392, -0.5370652, 0, 0.2509804, 1, 1,
0.2979338, -0.001821483, 2.153485, 0, 0.2431373, 1, 1,
0.3005944, 0.6813177, 0.1622368, 0, 0.2392157, 1, 1,
0.3053653, -0.647761, 3.883528, 0, 0.2313726, 1, 1,
0.3061399, -0.432186, 1.751791, 0, 0.227451, 1, 1,
0.3071411, 1.190935, -0.1479089, 0, 0.2196078, 1, 1,
0.3073838, 1.170573, 0.1818531, 0, 0.2156863, 1, 1,
0.3089095, 0.05378206, 1.893921, 0, 0.2078431, 1, 1,
0.3142473, -0.3953692, 2.603211, 0, 0.2039216, 1, 1,
0.3177061, 0.7228184, 1.339429, 0, 0.1960784, 1, 1,
0.3186816, 1.185319, 0.3050599, 0, 0.1882353, 1, 1,
0.3227143, 0.266994, 1.67511, 0, 0.1843137, 1, 1,
0.326301, 0.363364, -0.4807737, 0, 0.1764706, 1, 1,
0.328101, -0.272041, 2.121638, 0, 0.172549, 1, 1,
0.3283887, 0.04887117, 2.77399, 0, 0.1647059, 1, 1,
0.3293157, -2.190703, 2.52616, 0, 0.1607843, 1, 1,
0.3327458, 0.04318101, 2.706812, 0, 0.1529412, 1, 1,
0.3363967, 1.443015, 0.8730146, 0, 0.1490196, 1, 1,
0.3414859, -2.397209, 2.901385, 0, 0.1411765, 1, 1,
0.3445597, 0.6956413, -0.4930513, 0, 0.1372549, 1, 1,
0.3458276, -0.2749433, 1.554632, 0, 0.1294118, 1, 1,
0.3464199, -0.08104634, 2.65207, 0, 0.1254902, 1, 1,
0.3471403, 0.398677, 1.220767, 0, 0.1176471, 1, 1,
0.3490917, 0.125475, 1.539597, 0, 0.1137255, 1, 1,
0.3530405, 1.369299, 0.6835203, 0, 0.1058824, 1, 1,
0.3574513, 0.2294614, 1.007075, 0, 0.09803922, 1, 1,
0.3642611, -0.08900993, 2.321155, 0, 0.09411765, 1, 1,
0.3659673, 0.3251131, -0.9460211, 0, 0.08627451, 1, 1,
0.3679475, -0.04188073, 0.4925263, 0, 0.08235294, 1, 1,
0.3701902, 0.3745445, -0.2212173, 0, 0.07450981, 1, 1,
0.3773124, 0.8971689, -0.8763398, 0, 0.07058824, 1, 1,
0.3808476, 0.3681993, 0.173694, 0, 0.0627451, 1, 1,
0.3809979, -2.100707, 3.020334, 0, 0.05882353, 1, 1,
0.3850545, -0.03142528, 3.648879, 0, 0.05098039, 1, 1,
0.3854316, -0.532383, 2.427834, 0, 0.04705882, 1, 1,
0.3866312, -0.4325697, 1.97535, 0, 0.03921569, 1, 1,
0.3886791, 1.801218, -1.172031, 0, 0.03529412, 1, 1,
0.3899573, -0.1546091, 2.031641, 0, 0.02745098, 1, 1,
0.3913661, 0.4963548, -0.8044703, 0, 0.02352941, 1, 1,
0.391465, 0.2687693, 1.074787, 0, 0.01568628, 1, 1,
0.3922388, -0.06415071, 2.761592, 0, 0.01176471, 1, 1,
0.3923557, -0.7605135, 2.686797, 0, 0.003921569, 1, 1,
0.396502, -1.145573, 3.604955, 0.003921569, 0, 1, 1,
0.3993979, -0.7871971, 5.956283, 0.007843138, 0, 1, 1,
0.4042403, -1.016973, 2.06594, 0.01568628, 0, 1, 1,
0.407011, -0.1504841, 0.396136, 0.01960784, 0, 1, 1,
0.4103091, 0.4232343, -0.9241008, 0.02745098, 0, 1, 1,
0.4128171, 1.887602, 0.955493, 0.03137255, 0, 1, 1,
0.4157146, 0.8690814, 0.565069, 0.03921569, 0, 1, 1,
0.4174715, -1.484562, 3.331015, 0.04313726, 0, 1, 1,
0.4186474, 2.033603, -0.3908131, 0.05098039, 0, 1, 1,
0.4187154, 0.08917083, 2.097177, 0.05490196, 0, 1, 1,
0.4222689, -0.7501631, 1.338002, 0.0627451, 0, 1, 1,
0.4248207, -1.21411, 3.716928, 0.06666667, 0, 1, 1,
0.4374901, 0.4308824, 2.14358, 0.07450981, 0, 1, 1,
0.4385409, 1.825814, -1.904787, 0.07843138, 0, 1, 1,
0.4390152, 0.7970769, 0.6567475, 0.08627451, 0, 1, 1,
0.4443845, -1.122113, 2.426887, 0.09019608, 0, 1, 1,
0.447251, 0.6411754, 1.16538, 0.09803922, 0, 1, 1,
0.4513289, -0.7340395, 1.041592, 0.1058824, 0, 1, 1,
0.4534854, -0.2025844, 2.653147, 0.1098039, 0, 1, 1,
0.4548113, 1.651588, 1.044641, 0.1176471, 0, 1, 1,
0.4556841, 0.04937529, 0.5146707, 0.1215686, 0, 1, 1,
0.4612115, 0.2534322, 1.806816, 0.1294118, 0, 1, 1,
0.464314, -0.6452768, 2.432595, 0.1333333, 0, 1, 1,
0.4719216, -0.1822388, 0.8789558, 0.1411765, 0, 1, 1,
0.4753309, 1.595801, 1.620252, 0.145098, 0, 1, 1,
0.4823241, 0.1238628, 0.1928983, 0.1529412, 0, 1, 1,
0.4827022, 0.3730685, 0.4924913, 0.1568628, 0, 1, 1,
0.4860119, -0.1258666, 2.193616, 0.1647059, 0, 1, 1,
0.4873084, -0.8203292, 2.528427, 0.1686275, 0, 1, 1,
0.5000635, 1.484127, 0.5600187, 0.1764706, 0, 1, 1,
0.5042809, 0.01260686, 0.4258482, 0.1803922, 0, 1, 1,
0.5099995, 1.735309, 1.453833, 0.1882353, 0, 1, 1,
0.5121858, 0.1505036, 2.645928, 0.1921569, 0, 1, 1,
0.5129035, 0.1876142, 1.373779, 0.2, 0, 1, 1,
0.5219475, 0.5215614, 0.8284097, 0.2078431, 0, 1, 1,
0.5259115, -0.8359088, 3.214011, 0.2117647, 0, 1, 1,
0.5263297, -0.2988471, 2.14906, 0.2196078, 0, 1, 1,
0.5269789, 0.9407602, 0.9642103, 0.2235294, 0, 1, 1,
0.5287966, -0.5780541, 1.96217, 0.2313726, 0, 1, 1,
0.5295426, -0.6988939, 2.997558, 0.2352941, 0, 1, 1,
0.5303461, 0.02808712, 0.5758705, 0.2431373, 0, 1, 1,
0.5329772, 0.7851821, 1.833838, 0.2470588, 0, 1, 1,
0.5395016, 0.6592666, 0.5314102, 0.254902, 0, 1, 1,
0.5417762, -1.097252, 2.694484, 0.2588235, 0, 1, 1,
0.546678, -0.7423303, 2.413462, 0.2666667, 0, 1, 1,
0.5509952, 1.22176, 1.090796, 0.2705882, 0, 1, 1,
0.5610168, -1.902338, 2.906575, 0.2784314, 0, 1, 1,
0.5625272, 0.453811, 2.496127, 0.282353, 0, 1, 1,
0.5625459, 0.8014567, -0.8044133, 0.2901961, 0, 1, 1,
0.5635087, 0.1909405, 1.232205, 0.2941177, 0, 1, 1,
0.5636572, 1.779646, 0.8121729, 0.3019608, 0, 1, 1,
0.5672062, -1.274508, 3.684797, 0.3098039, 0, 1, 1,
0.5744302, 0.3150805, 2.163844, 0.3137255, 0, 1, 1,
0.5744554, 0.2878958, 1.777488, 0.3215686, 0, 1, 1,
0.5775632, 1.15626, 1.214185, 0.3254902, 0, 1, 1,
0.5776247, -1.117871, 2.751032, 0.3333333, 0, 1, 1,
0.5827716, -1.522258, 0.6901628, 0.3372549, 0, 1, 1,
0.5854018, -1.357535, 3.884622, 0.345098, 0, 1, 1,
0.5899628, -0.5928062, 1.566746, 0.3490196, 0, 1, 1,
0.5900559, 0.9264954, 1.693074, 0.3568628, 0, 1, 1,
0.5928138, -0.7544253, 2.356285, 0.3607843, 0, 1, 1,
0.5944828, 1.03624, 0.5524614, 0.3686275, 0, 1, 1,
0.600607, 0.7258561, 2.030674, 0.372549, 0, 1, 1,
0.604389, 0.185231, 0.9293919, 0.3803922, 0, 1, 1,
0.6093376, -0.006725329, 0.3881917, 0.3843137, 0, 1, 1,
0.6094487, 0.295042, 0.4105122, 0.3921569, 0, 1, 1,
0.6102307, 0.9395273, 0.9033694, 0.3960784, 0, 1, 1,
0.6157039, 0.1277004, 2.129143, 0.4039216, 0, 1, 1,
0.6206941, 0.7480289, -0.006061255, 0.4117647, 0, 1, 1,
0.6283343, 1.24128, -1.548883, 0.4156863, 0, 1, 1,
0.6306565, -1.188507, 2.663124, 0.4235294, 0, 1, 1,
0.6313868, 1.111981, 1.177255, 0.427451, 0, 1, 1,
0.6318613, -1.41323, 2.896562, 0.4352941, 0, 1, 1,
0.6389931, -0.4432288, 3.429468, 0.4392157, 0, 1, 1,
0.6412182, -0.09041147, 0.7755784, 0.4470588, 0, 1, 1,
0.6431744, 0.6467102, 0.5615302, 0.4509804, 0, 1, 1,
0.6441486, -1.064319, 3.378146, 0.4588235, 0, 1, 1,
0.647009, -1.085832, 3.87169, 0.4627451, 0, 1, 1,
0.6481382, 1.756645, -1.014289, 0.4705882, 0, 1, 1,
0.6485732, -1.263963, 2.101116, 0.4745098, 0, 1, 1,
0.6500436, -0.1131235, 3.130563, 0.4823529, 0, 1, 1,
0.6569298, -0.1178525, 2.775015, 0.4862745, 0, 1, 1,
0.6577193, -0.7887989, 1.812201, 0.4941176, 0, 1, 1,
0.6581055, -0.381711, 3.31661, 0.5019608, 0, 1, 1,
0.6634547, -0.7756422, 1.503032, 0.5058824, 0, 1, 1,
0.6683855, -0.3661371, 2.03252, 0.5137255, 0, 1, 1,
0.6715185, -0.8981968, 1.6415, 0.5176471, 0, 1, 1,
0.6736631, -2.012223, 0.9922391, 0.5254902, 0, 1, 1,
0.677605, -0.6008111, 0.5980641, 0.5294118, 0, 1, 1,
0.6810518, -0.3446448, 2.233194, 0.5372549, 0, 1, 1,
0.689431, 0.5270133, 0.7348895, 0.5411765, 0, 1, 1,
0.691332, -1.774111, 4.652861, 0.5490196, 0, 1, 1,
0.692531, -1.196978, 1.878436, 0.5529412, 0, 1, 1,
0.6957811, 1.019513, 0.2954289, 0.5607843, 0, 1, 1,
0.7028053, 0.8945791, 1.285866, 0.5647059, 0, 1, 1,
0.710148, 0.6869402, 0.113777, 0.572549, 0, 1, 1,
0.7157254, -1.572532, 4.075017, 0.5764706, 0, 1, 1,
0.7218966, 0.3488956, 2.31182, 0.5843138, 0, 1, 1,
0.7224541, 0.287135, 2.030142, 0.5882353, 0, 1, 1,
0.7248539, 0.9658062, -0.1166081, 0.5960785, 0, 1, 1,
0.7290977, 0.5431715, 0.45933, 0.6039216, 0, 1, 1,
0.7317806, -0.9526151, 3.737528, 0.6078432, 0, 1, 1,
0.7318333, 0.4174169, 0.9048187, 0.6156863, 0, 1, 1,
0.7336162, -0.1275192, 2.750575, 0.6196079, 0, 1, 1,
0.7383698, 0.04577412, 2.235007, 0.627451, 0, 1, 1,
0.741398, -0.5948851, 1.61614, 0.6313726, 0, 1, 1,
0.7434329, 0.01362361, 2.628175, 0.6392157, 0, 1, 1,
0.7473897, -0.768263, 2.449232, 0.6431373, 0, 1, 1,
0.7526175, -1.389826, 2.265703, 0.6509804, 0, 1, 1,
0.7558506, 0.3766722, -0.4422941, 0.654902, 0, 1, 1,
0.7559052, 0.1440441, 1.152381, 0.6627451, 0, 1, 1,
0.7576765, -0.9467816, 2.668266, 0.6666667, 0, 1, 1,
0.7608325, 0.3509935, 0.4288464, 0.6745098, 0, 1, 1,
0.7639644, 0.3626609, 0.8333721, 0.6784314, 0, 1, 1,
0.7640091, -1.495246, 2.036902, 0.6862745, 0, 1, 1,
0.7644503, 1.758653, -0.391421, 0.6901961, 0, 1, 1,
0.7662421, 1.678757, 2.781482, 0.6980392, 0, 1, 1,
0.7701773, 0.8534988, 1.839564, 0.7058824, 0, 1, 1,
0.773803, -0.1240604, 2.126366, 0.7098039, 0, 1, 1,
0.7740745, -0.3345366, 1.566105, 0.7176471, 0, 1, 1,
0.7774697, -0.3932463, 3.803276, 0.7215686, 0, 1, 1,
0.7780485, -0.7578253, 0.4614202, 0.7294118, 0, 1, 1,
0.7882445, -0.14673, 1.801598, 0.7333333, 0, 1, 1,
0.7915133, -0.1382074, 1.368816, 0.7411765, 0, 1, 1,
0.7926011, -0.3582692, 2.650248, 0.7450981, 0, 1, 1,
0.7952729, 0.5719428, -0.008665106, 0.7529412, 0, 1, 1,
0.7964835, 0.7902229, -0.1754956, 0.7568628, 0, 1, 1,
0.7968792, 1.139061, 1.052439, 0.7647059, 0, 1, 1,
0.7979163, -1.067471, 3.029366, 0.7686275, 0, 1, 1,
0.8047177, 0.6581833, 1.969092, 0.7764706, 0, 1, 1,
0.8066035, 0.6295317, 0.935128, 0.7803922, 0, 1, 1,
0.8101213, -0.851483, 4.691893, 0.7882353, 0, 1, 1,
0.8114238, 0.104827, 1.043035, 0.7921569, 0, 1, 1,
0.8190598, -0.2230046, 1.026738, 0.8, 0, 1, 1,
0.8273245, 2.28536, -0.6068321, 0.8078431, 0, 1, 1,
0.8275795, 0.4350617, 1.005674, 0.8117647, 0, 1, 1,
0.8278527, -1.34586, 2.505994, 0.8196079, 0, 1, 1,
0.8298841, -1.320618, 2.993919, 0.8235294, 0, 1, 1,
0.8313055, 0.7854954, 1.870026, 0.8313726, 0, 1, 1,
0.8315195, -1.519663, 1.827091, 0.8352941, 0, 1, 1,
0.8325341, -0.2659805, 1.990487, 0.8431373, 0, 1, 1,
0.834248, -0.1657665, 0.01748123, 0.8470588, 0, 1, 1,
0.8442041, -0.5359129, 2.232619, 0.854902, 0, 1, 1,
0.8445795, 1.071503, 0.503639, 0.8588235, 0, 1, 1,
0.8459018, 2.20686, 0.2058794, 0.8666667, 0, 1, 1,
0.847184, -0.6027601, 1.847738, 0.8705882, 0, 1, 1,
0.8474079, -0.4071325, 2.189737, 0.8784314, 0, 1, 1,
0.8527024, -0.1433082, 2.811246, 0.8823529, 0, 1, 1,
0.8564695, -0.8732499, 3.146369, 0.8901961, 0, 1, 1,
0.8649015, 0.6547641, 1.587997, 0.8941177, 0, 1, 1,
0.8728408, 1.360607, -1.905348, 0.9019608, 0, 1, 1,
0.8730985, -0.534338, 2.944801, 0.9098039, 0, 1, 1,
0.8732747, -0.1524452, -0.3893918, 0.9137255, 0, 1, 1,
0.8786364, -2.50481, 3.891162, 0.9215686, 0, 1, 1,
0.8797964, 0.2717613, 2.628978, 0.9254902, 0, 1, 1,
0.8872699, 0.7280082, 0.4059909, 0.9333333, 0, 1, 1,
0.8896199, 0.8448069, 2.318821, 0.9372549, 0, 1, 1,
0.8910582, -0.004246631, 2.510408, 0.945098, 0, 1, 1,
0.8910972, 2.981427, 0.5555906, 0.9490196, 0, 1, 1,
0.8924559, 2.523418, -0.07276099, 0.9568627, 0, 1, 1,
0.8970178, -0.9887857, 2.135425, 0.9607843, 0, 1, 1,
0.904646, -1.163112, 2.355801, 0.9686275, 0, 1, 1,
0.9055772, 1.146372, 1.47451, 0.972549, 0, 1, 1,
0.9067127, 0.4015402, 3.393857, 0.9803922, 0, 1, 1,
0.9119329, -1.249684, 1.923445, 0.9843137, 0, 1, 1,
0.9150665, -1.075715, 3.57478, 0.9921569, 0, 1, 1,
0.9380346, 0.4959539, 1.954205, 0.9960784, 0, 1, 1,
0.938907, 1.473437, -1.856141, 1, 0, 0.9960784, 1,
0.9394328, -0.9292752, 2.722664, 1, 0, 0.9882353, 1,
0.9398944, -1.847866, 2.824104, 1, 0, 0.9843137, 1,
0.9403345, -0.5003806, 0.8416498, 1, 0, 0.9764706, 1,
0.9406975, 0.09018925, 3.261427, 1, 0, 0.972549, 1,
0.9462548, -0.1872843, 0.7419444, 1, 0, 0.9647059, 1,
0.9487826, 1.071198, 2.034338, 1, 0, 0.9607843, 1,
0.9488454, -1.454026, 1.599199, 1, 0, 0.9529412, 1,
0.9506995, 0.9824648, 0.2810429, 1, 0, 0.9490196, 1,
0.950817, -0.6705437, 0.9933763, 1, 0, 0.9411765, 1,
0.9547877, 1.477014, 2.055265, 1, 0, 0.9372549, 1,
0.9601191, -2.376229, 4.349687, 1, 0, 0.9294118, 1,
0.9632506, -0.5292118, 2.206748, 1, 0, 0.9254902, 1,
0.9675725, 1.454996, 0.5667651, 1, 0, 0.9176471, 1,
0.9740393, 0.6182901, 1.638091, 1, 0, 0.9137255, 1,
0.9750006, 0.3225637, 2.055082, 1, 0, 0.9058824, 1,
0.975274, -0.911684, 1.33936, 1, 0, 0.9019608, 1,
0.9759753, -1.844251, 2.203763, 1, 0, 0.8941177, 1,
0.9776042, 0.7523515, 2.196854, 1, 0, 0.8862745, 1,
0.9794486, -0.1402748, 1.750398, 1, 0, 0.8823529, 1,
0.9843465, 1.675388, 0.9165791, 1, 0, 0.8745098, 1,
0.9850711, -1.01509, 1.519852, 1, 0, 0.8705882, 1,
0.9945894, 2.305586, 0.8745148, 1, 0, 0.8627451, 1,
0.9953724, 0.5675194, 0.4993026, 1, 0, 0.8588235, 1,
0.9959703, -0.206915, 1.842956, 1, 0, 0.8509804, 1,
1.008139, -1.106845, 3.977216, 1, 0, 0.8470588, 1,
1.01174, -0.8419415, 3.37791, 1, 0, 0.8392157, 1,
1.021283, -0.1647738, 3.085034, 1, 0, 0.8352941, 1,
1.022304, 0.9998994, 0.02350559, 1, 0, 0.827451, 1,
1.026508, -0.7554832, 0.7583201, 1, 0, 0.8235294, 1,
1.037428, 1.154089, 0.1564848, 1, 0, 0.8156863, 1,
1.038476, 1.455085, -1.375123, 1, 0, 0.8117647, 1,
1.039786, 1.674658, 1.712684, 1, 0, 0.8039216, 1,
1.041693, 1.829843, 0.02852891, 1, 0, 0.7960784, 1,
1.044069, -1.069389, 3.765246, 1, 0, 0.7921569, 1,
1.05027, -0.19655, 1.035339, 1, 0, 0.7843137, 1,
1.053791, -0.9733551, 3.772846, 1, 0, 0.7803922, 1,
1.056073, 0.6175737, 1.783246, 1, 0, 0.772549, 1,
1.0619, -0.8228889, 1.292135, 1, 0, 0.7686275, 1,
1.077112, 0.5355299, 1.437564, 1, 0, 0.7607843, 1,
1.08896, -0.7472648, 2.148966, 1, 0, 0.7568628, 1,
1.089956, 2.142938, -0.7911379, 1, 0, 0.7490196, 1,
1.089978, 0.2630866, 2.541868, 1, 0, 0.7450981, 1,
1.094648, 0.1673163, 0.9596068, 1, 0, 0.7372549, 1,
1.108202, 0.5281199, 1.771948, 1, 0, 0.7333333, 1,
1.118817, 1.987488, 1.212601, 1, 0, 0.7254902, 1,
1.126741, -0.3035324, 2.562472, 1, 0, 0.7215686, 1,
1.126826, -0.7801901, 1.98846, 1, 0, 0.7137255, 1,
1.127459, 0.8145973, 1.699381, 1, 0, 0.7098039, 1,
1.145295, 0.01504498, 0.5643121, 1, 0, 0.7019608, 1,
1.146397, 0.8226175, 1.664443, 1, 0, 0.6941177, 1,
1.149897, -1.423168, 1.159382, 1, 0, 0.6901961, 1,
1.162703, -0.5687397, 1.610546, 1, 0, 0.682353, 1,
1.165288, 1.805406, 0.756079, 1, 0, 0.6784314, 1,
1.173651, -0.6154576, 4.110444, 1, 0, 0.6705883, 1,
1.175992, 1.888511, 0.3281487, 1, 0, 0.6666667, 1,
1.176318, -0.9299213, 2.273539, 1, 0, 0.6588235, 1,
1.180432, -0.7568375, 1.154517, 1, 0, 0.654902, 1,
1.181437, -1.289646, 2.754746, 1, 0, 0.6470588, 1,
1.190599, -1.295099, 2.27433, 1, 0, 0.6431373, 1,
1.192882, 1.129334, 0.02756065, 1, 0, 0.6352941, 1,
1.195707, 1.41513, 1.317889, 1, 0, 0.6313726, 1,
1.201222, -1.272738, 3.639498, 1, 0, 0.6235294, 1,
1.220563, 0.4926469, 1.391638, 1, 0, 0.6196079, 1,
1.237478, 0.04670059, 2.829902, 1, 0, 0.6117647, 1,
1.24807, -0.9786305, 1.931162, 1, 0, 0.6078432, 1,
1.258832, -0.6247438, 2.754278, 1, 0, 0.6, 1,
1.276784, -0.3175946, 3.069575, 1, 0, 0.5921569, 1,
1.277832, 0.08149052, 1.126062, 1, 0, 0.5882353, 1,
1.286199, 0.0306889, 0.8692871, 1, 0, 0.5803922, 1,
1.289107, 1.855247, 2.097354, 1, 0, 0.5764706, 1,
1.289546, 0.04100962, 1.160107, 1, 0, 0.5686275, 1,
1.297142, 0.8859926, 0.840427, 1, 0, 0.5647059, 1,
1.300008, 0.02960425, 1.091553, 1, 0, 0.5568628, 1,
1.309492, -0.5941667, 2.104888, 1, 0, 0.5529412, 1,
1.312006, 0.5805355, 1.352728, 1, 0, 0.5450981, 1,
1.34588, 0.7806381, 0.1566077, 1, 0, 0.5411765, 1,
1.354781, -0.1613346, 1.140575, 1, 0, 0.5333334, 1,
1.356343, 1.141085, 1.702303, 1, 0, 0.5294118, 1,
1.358902, -0.7694591, 4.062215, 1, 0, 0.5215687, 1,
1.364875, 1.30691, 0.4073792, 1, 0, 0.5176471, 1,
1.383688, -0.3776373, 0.9188839, 1, 0, 0.509804, 1,
1.385402, 1.545992, 0.7102062, 1, 0, 0.5058824, 1,
1.386257, -0.4803866, 2.80701, 1, 0, 0.4980392, 1,
1.403475, -1.2089, 1.184507, 1, 0, 0.4901961, 1,
1.406694, -0.1677964, 0.9682876, 1, 0, 0.4862745, 1,
1.414124, -1.621088, 3.301704, 1, 0, 0.4784314, 1,
1.417472, 1.789506, 2.036371, 1, 0, 0.4745098, 1,
1.447192, 0.4846866, 0.0562696, 1, 0, 0.4666667, 1,
1.453473, 0.7537912, 0.4736267, 1, 0, 0.4627451, 1,
1.459356, 0.8603947, -0.473952, 1, 0, 0.454902, 1,
1.470718, 0.02889492, 1.211211, 1, 0, 0.4509804, 1,
1.488546, 0.3598001, 1.462611, 1, 0, 0.4431373, 1,
1.492082, 1.216177, 0.1252002, 1, 0, 0.4392157, 1,
1.497463, 0.7417238, 1.987203, 1, 0, 0.4313726, 1,
1.521985, 0.4302765, 0.3120329, 1, 0, 0.427451, 1,
1.537044, 1.071138, 3.83158, 1, 0, 0.4196078, 1,
1.563582, -1.367188, 0.5968444, 1, 0, 0.4156863, 1,
1.564161, -0.8886178, 2.426236, 1, 0, 0.4078431, 1,
1.564724, -0.3342291, 2.56085, 1, 0, 0.4039216, 1,
1.571501, 0.3396831, 0.6113884, 1, 0, 0.3960784, 1,
1.57246, -0.1604164, 0.2863603, 1, 0, 0.3882353, 1,
1.583329, -1.026161, 1.053471, 1, 0, 0.3843137, 1,
1.585001, 0.4113836, 0.1286869, 1, 0, 0.3764706, 1,
1.590438, -1.696929, 4.759547, 1, 0, 0.372549, 1,
1.607961, 0.1105047, 0.6501639, 1, 0, 0.3647059, 1,
1.625225, -1.21947, 2.450163, 1, 0, 0.3607843, 1,
1.627095, -0.6171984, 3.451693, 1, 0, 0.3529412, 1,
1.640651, 0.8437567, 1.607941, 1, 0, 0.3490196, 1,
1.643882, 0.8310883, 0.2032889, 1, 0, 0.3411765, 1,
1.661401, 0.1927036, 1.916899, 1, 0, 0.3372549, 1,
1.663377, 0.1887779, 0.7443206, 1, 0, 0.3294118, 1,
1.676175, 0.3805939, 1.180829, 1, 0, 0.3254902, 1,
1.676483, 0.8731938, 0.1188755, 1, 0, 0.3176471, 1,
1.681573, -1.613908, 4.027519, 1, 0, 0.3137255, 1,
1.687886, 0.8490648, 2.507324, 1, 0, 0.3058824, 1,
1.696371, -0.8625236, 2.513296, 1, 0, 0.2980392, 1,
1.699719, -1.696685, 2.377043, 1, 0, 0.2941177, 1,
1.704855, 1.594145, 0.3467407, 1, 0, 0.2862745, 1,
1.717682, 0.06357936, 0.3568739, 1, 0, 0.282353, 1,
1.724843, -0.9222006, 3.661973, 1, 0, 0.2745098, 1,
1.734873, 0.2068633, 2.821436, 1, 0, 0.2705882, 1,
1.745099, 0.498322, 3.137673, 1, 0, 0.2627451, 1,
1.752773, 0.2898516, 0.7894437, 1, 0, 0.2588235, 1,
1.770481, -0.03349268, 0.5652499, 1, 0, 0.2509804, 1,
1.775869, 0.6581768, 1.756487, 1, 0, 0.2470588, 1,
1.788572, -0.4829863, 1.392741, 1, 0, 0.2392157, 1,
1.791568, 0.4288448, 0.3766533, 1, 0, 0.2352941, 1,
1.801585, 0.6697165, 0.423812, 1, 0, 0.227451, 1,
1.805827, 0.06169592, 0.7287146, 1, 0, 0.2235294, 1,
1.824591, 0.1722407, 0.3692923, 1, 0, 0.2156863, 1,
1.861508, 0.3665276, 2.250762, 1, 0, 0.2117647, 1,
1.882728, 1.298192, 0.3957785, 1, 0, 0.2039216, 1,
1.888174, 1.079482, 1.382503, 1, 0, 0.1960784, 1,
1.908363, -0.9588445, 1.836323, 1, 0, 0.1921569, 1,
1.939078, 0.08225575, 2.379467, 1, 0, 0.1843137, 1,
1.956239, -1.233908, 1.851022, 1, 0, 0.1803922, 1,
1.962453, 0.352403, 0.7948574, 1, 0, 0.172549, 1,
1.996598, 1.727017, 1.219113, 1, 0, 0.1686275, 1,
2.01221, 0.329845, -0.04576983, 1, 0, 0.1607843, 1,
2.013123, 2.431342, 1.306747, 1, 0, 0.1568628, 1,
2.019538, -0.03905079, 3.421743, 1, 0, 0.1490196, 1,
2.02676, 1.181082, 0.9601303, 1, 0, 0.145098, 1,
2.033218, 1.201642, 3.044555, 1, 0, 0.1372549, 1,
2.034923, -0.3076612, 4.707753, 1, 0, 0.1333333, 1,
2.044298, 0.3419199, 0.2426805, 1, 0, 0.1254902, 1,
2.048287, 0.6736913, 4.263026, 1, 0, 0.1215686, 1,
2.052406, 0.06437618, 0.6077013, 1, 0, 0.1137255, 1,
2.083511, 1.256551, -0.6705998, 1, 0, 0.1098039, 1,
2.104816, 1.050182, 0.6634379, 1, 0, 0.1019608, 1,
2.116014, -2.219956, 2.611024, 1, 0, 0.09411765, 1,
2.124089, 0.9773105, -0.5205664, 1, 0, 0.09019608, 1,
2.150057, 1.248771, -0.5724259, 1, 0, 0.08235294, 1,
2.202126, 0.05061367, 0.4997886, 1, 0, 0.07843138, 1,
2.206061, 0.4994618, 1.951148, 1, 0, 0.07058824, 1,
2.219353, -2.441125, 2.868068, 1, 0, 0.06666667, 1,
2.242892, -2.158658, 2.636755, 1, 0, 0.05882353, 1,
2.250272, 0.2747273, 2.324682, 1, 0, 0.05490196, 1,
2.258861, -0.3558737, 1.067691, 1, 0, 0.04705882, 1,
2.435308, 1.274781, 1.860993, 1, 0, 0.04313726, 1,
2.489065, -0.6913708, 1.931893, 1, 0, 0.03529412, 1,
2.613144, -0.4819275, -0.588262, 1, 0, 0.03137255, 1,
2.704121, 0.2518298, 3.307831, 1, 0, 0.02352941, 1,
2.741373, 0.2181344, 1.431964, 1, 0, 0.01960784, 1,
2.813482, 0.4038756, 0.6021288, 1, 0, 0.01176471, 1,
2.884268, 2.231942, 2.099773, 1, 0, 0.007843138, 1
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
-0.1118152, -4.483805, -6.772644, 0, -0.5, 0.5, 0.5,
-0.1118152, -4.483805, -6.772644, 1, -0.5, 0.5, 0.5,
-0.1118152, -4.483805, -6.772644, 1, 1.5, 0.5, 0.5,
-0.1118152, -4.483805, -6.772644, 0, 1.5, 0.5, 0.5
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
-4.12357, -0.2102071, -6.772644, 0, -0.5, 0.5, 0.5,
-4.12357, -0.2102071, -6.772644, 1, -0.5, 0.5, 0.5,
-4.12357, -0.2102071, -6.772644, 1, 1.5, 0.5, 0.5,
-4.12357, -0.2102071, -6.772644, 0, 1.5, 0.5, 0.5
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
-4.12357, -4.483805, 0.5142453, 0, -0.5, 0.5, 0.5,
-4.12357, -4.483805, 0.5142453, 1, -0.5, 0.5, 0.5,
-4.12357, -4.483805, 0.5142453, 1, 1.5, 0.5, 0.5,
-4.12357, -4.483805, 0.5142453, 0, 1.5, 0.5, 0.5
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
-3, -3.49759, -5.091053,
2, -3.49759, -5.091053,
-3, -3.49759, -5.091053,
-3, -3.661959, -5.371319,
-2, -3.49759, -5.091053,
-2, -3.661959, -5.371319,
-1, -3.49759, -5.091053,
-1, -3.661959, -5.371319,
0, -3.49759, -5.091053,
0, -3.661959, -5.371319,
1, -3.49759, -5.091053,
1, -3.661959, -5.371319,
2, -3.49759, -5.091053,
2, -3.661959, -5.371319
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
-3, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
-3, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
-3, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
-3, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5,
-2, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
-2, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
-2, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
-2, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5,
-1, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
-1, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
-1, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
-1, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5,
0, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
0, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
0, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
0, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5,
1, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
1, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
1, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
1, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5,
2, -3.990698, -5.931849, 0, -0.5, 0.5, 0.5,
2, -3.990698, -5.931849, 1, -0.5, 0.5, 0.5,
2, -3.990698, -5.931849, 1, 1.5, 0.5, 0.5,
2, -3.990698, -5.931849, 0, 1.5, 0.5, 0.5
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
-3.19778, -3, -5.091053,
-3.19778, 2, -5.091053,
-3.19778, -3, -5.091053,
-3.352079, -3, -5.371319,
-3.19778, -2, -5.091053,
-3.352079, -2, -5.371319,
-3.19778, -1, -5.091053,
-3.352079, -1, -5.371319,
-3.19778, 0, -5.091053,
-3.352079, 0, -5.371319,
-3.19778, 1, -5.091053,
-3.352079, 1, -5.371319,
-3.19778, 2, -5.091053,
-3.352079, 2, -5.371319
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
-3.660675, -3, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, -3, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, -3, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, -3, -5.931849, 0, 1.5, 0.5, 0.5,
-3.660675, -2, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, -2, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, -2, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, -2, -5.931849, 0, 1.5, 0.5, 0.5,
-3.660675, -1, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, -1, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, -1, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, -1, -5.931849, 0, 1.5, 0.5, 0.5,
-3.660675, 0, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, 0, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, 0, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, 0, -5.931849, 0, 1.5, 0.5, 0.5,
-3.660675, 1, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, 1, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, 1, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, 1, -5.931849, 0, 1.5, 0.5, 0.5,
-3.660675, 2, -5.931849, 0, -0.5, 0.5, 0.5,
-3.660675, 2, -5.931849, 1, -0.5, 0.5, 0.5,
-3.660675, 2, -5.931849, 1, 1.5, 0.5, 0.5,
-3.660675, 2, -5.931849, 0, 1.5, 0.5, 0.5
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
-3.19778, -3.49759, -4,
-3.19778, -3.49759, 4,
-3.19778, -3.49759, -4,
-3.352079, -3.661959, -4,
-3.19778, -3.49759, -2,
-3.352079, -3.661959, -2,
-3.19778, -3.49759, 0,
-3.352079, -3.661959, 0,
-3.19778, -3.49759, 2,
-3.352079, -3.661959, 2,
-3.19778, -3.49759, 4,
-3.352079, -3.661959, 4
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
-3.660675, -3.990698, -4, 0, -0.5, 0.5, 0.5,
-3.660675, -3.990698, -4, 1, -0.5, 0.5, 0.5,
-3.660675, -3.990698, -4, 1, 1.5, 0.5, 0.5,
-3.660675, -3.990698, -4, 0, 1.5, 0.5, 0.5,
-3.660675, -3.990698, -2, 0, -0.5, 0.5, 0.5,
-3.660675, -3.990698, -2, 1, -0.5, 0.5, 0.5,
-3.660675, -3.990698, -2, 1, 1.5, 0.5, 0.5,
-3.660675, -3.990698, -2, 0, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 0, 0, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 0, 1, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 0, 1, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 0, 0, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 2, 0, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 2, 1, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 2, 1, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 2, 0, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 4, 0, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 4, 1, -0.5, 0.5, 0.5,
-3.660675, -3.990698, 4, 1, 1.5, 0.5, 0.5,
-3.660675, -3.990698, 4, 0, 1.5, 0.5, 0.5
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
-3.19778, -3.49759, -5.091053,
-3.19778, 3.077176, -5.091053,
-3.19778, -3.49759, 6.119544,
-3.19778, 3.077176, 6.119544,
-3.19778, -3.49759, -5.091053,
-3.19778, -3.49759, 6.119544,
-3.19778, 3.077176, -5.091053,
-3.19778, 3.077176, 6.119544,
-3.19778, -3.49759, -5.091053,
2.97415, -3.49759, -5.091053,
-3.19778, -3.49759, 6.119544,
2.97415, -3.49759, 6.119544,
-3.19778, 3.077176, -5.091053,
2.97415, 3.077176, -5.091053,
-3.19778, 3.077176, 6.119544,
2.97415, 3.077176, 6.119544,
2.97415, -3.49759, -5.091053,
2.97415, 3.077176, -5.091053,
2.97415, -3.49759, 6.119544,
2.97415, 3.077176, 6.119544,
2.97415, -3.49759, -5.091053,
2.97415, -3.49759, 6.119544,
2.97415, 3.077176, -5.091053,
2.97415, 3.077176, 6.119544
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
var radius = 7.682602;
var distance = 34.18076;
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
mvMatrix.translate( 0.1118152, 0.2102071, -0.5142453 );
mvMatrix.scale( 1.345864, 1.263403, 0.7409577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18076);
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
ethyrimol<-read.table("ethyrimol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyrimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
```

```r
y<-ethyrimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
```

```r
z<-ethyrimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
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
-3.107898, 0.7677048, -0.8937516, 0, 0, 1, 1, 1,
-2.836275, 1.672644, 0.2870531, 1, 0, 0, 1, 1,
-2.804599, -1.153434, -3.21719, 1, 0, 0, 1, 1,
-2.655149, 1.067814, -1.433325, 1, 0, 0, 1, 1,
-2.649267, -1.020783, -1.36753, 1, 0, 0, 1, 1,
-2.603841, -0.5166681, -1.678018, 1, 0, 0, 1, 1,
-2.575276, -0.3880835, -1.938381, 0, 0, 0, 1, 1,
-2.504681, 1.475424, -1.141821, 0, 0, 0, 1, 1,
-2.488272, -0.3324572, -0.3176323, 0, 0, 0, 1, 1,
-2.440295, 0.1198866, -2.046806, 0, 0, 0, 1, 1,
-2.439744, 0.4076483, -3.329922, 0, 0, 0, 1, 1,
-2.357177, -0.3608614, -1.282405, 0, 0, 0, 1, 1,
-2.291499, -1.458494, -2.105382, 0, 0, 0, 1, 1,
-2.234306, 0.04882476, -1.385924, 1, 1, 1, 1, 1,
-2.195711, 1.262617, -2.562491, 1, 1, 1, 1, 1,
-2.141425, 1.874035, -1.398413, 1, 1, 1, 1, 1,
-2.110426, -0.5132913, -1.767121, 1, 1, 1, 1, 1,
-2.080945, -0.5732171, -2.326139, 1, 1, 1, 1, 1,
-2.0561, 1.077011, -1.231575, 1, 1, 1, 1, 1,
-2.037737, 0.6396635, -0.282345, 1, 1, 1, 1, 1,
-2.024723, -1.23622, -3.26843, 1, 1, 1, 1, 1,
-2.016099, -0.5616989, -1.604817, 1, 1, 1, 1, 1,
-1.965904, -0.6183841, -1.574879, 1, 1, 1, 1, 1,
-1.964656, -1.344458, -0.2898606, 1, 1, 1, 1, 1,
-1.958042, -0.148382, -3.393276, 1, 1, 1, 1, 1,
-1.939781, 1.566789, -1.849712, 1, 1, 1, 1, 1,
-1.891477, -1.534742, -4.213996, 1, 1, 1, 1, 1,
-1.868224, -1.148667, -2.204612, 1, 1, 1, 1, 1,
-1.843808, 1.262736, -0.3790124, 0, 0, 1, 1, 1,
-1.810043, 0.3863496, -2.313594, 1, 0, 0, 1, 1,
-1.793069, 0.2153371, 0.8424345, 1, 0, 0, 1, 1,
-1.776356, 0.6889219, -0.976458, 1, 0, 0, 1, 1,
-1.756771, -0.4289722, -1.341293, 1, 0, 0, 1, 1,
-1.755606, -0.899761, -2.881041, 1, 0, 0, 1, 1,
-1.722348, -1.823325, -2.381434, 0, 0, 0, 1, 1,
-1.711502, 1.467343, -1.135233, 0, 0, 0, 1, 1,
-1.705353, 0.4095413, -2.255807, 0, 0, 0, 1, 1,
-1.699466, -1.80029, -2.241572, 0, 0, 0, 1, 1,
-1.699383, 0.3331175, -1.292901, 0, 0, 0, 1, 1,
-1.684603, 1.248844, -1.78137, 0, 0, 0, 1, 1,
-1.683473, 0.5326413, -2.945712, 0, 0, 0, 1, 1,
-1.677023, -0.2359275, -3.905461, 1, 1, 1, 1, 1,
-1.657716, 0.6071837, 0.3434159, 1, 1, 1, 1, 1,
-1.64428, 1.335361, -1.032847, 1, 1, 1, 1, 1,
-1.627722, 1.270178, -0.6772649, 1, 1, 1, 1, 1,
-1.612372, 0.1171288, -2.688164, 1, 1, 1, 1, 1,
-1.607171, -1.754714, -1.794845, 1, 1, 1, 1, 1,
-1.60593, 0.05275815, -0.2454264, 1, 1, 1, 1, 1,
-1.565338, 0.2564248, -0.6562436, 1, 1, 1, 1, 1,
-1.55805, 0.6304488, -3.382067, 1, 1, 1, 1, 1,
-1.55727, 0.9071277, -0.7727762, 1, 1, 1, 1, 1,
-1.556708, -1.219395, -1.832397, 1, 1, 1, 1, 1,
-1.544465, -0.9951092, -1.160335, 1, 1, 1, 1, 1,
-1.534383, 0.3970277, -1.555263, 1, 1, 1, 1, 1,
-1.533124, 0.4661182, -0.6401199, 1, 1, 1, 1, 1,
-1.533081, 1.4184, 0.4296468, 1, 1, 1, 1, 1,
-1.517675, 0.7953588, -2.475225, 0, 0, 1, 1, 1,
-1.517609, 1.049211, -2.389357, 1, 0, 0, 1, 1,
-1.513814, 1.510124, -0.4291144, 1, 0, 0, 1, 1,
-1.512999, 1.376946, -0.02517791, 1, 0, 0, 1, 1,
-1.501241, -0.9524895, -2.195508, 1, 0, 0, 1, 1,
-1.491757, 0.2672684, -3.240515, 1, 0, 0, 1, 1,
-1.479081, 0.7362571, -2.593322, 0, 0, 0, 1, 1,
-1.47368, 0.0741151, -2.500423, 0, 0, 0, 1, 1,
-1.469907, -0.6675994, -3.136484, 0, 0, 0, 1, 1,
-1.451281, 0.2016039, -3.201178, 0, 0, 0, 1, 1,
-1.429882, 0.5665787, -1.646092, 0, 0, 0, 1, 1,
-1.428286, 0.4018236, -2.126567, 0, 0, 0, 1, 1,
-1.425166, -0.2116884, -2.236301, 0, 0, 0, 1, 1,
-1.423946, 1.41308, -0.9780175, 1, 1, 1, 1, 1,
-1.422983, 0.6462659, -0.8870829, 1, 1, 1, 1, 1,
-1.407634, -0.6629348, -1.870571, 1, 1, 1, 1, 1,
-1.404239, 0.8891982, -2.272262, 1, 1, 1, 1, 1,
-1.404188, 1.645052, -0.4115087, 1, 1, 1, 1, 1,
-1.402236, -0.2938648, -2.070425, 1, 1, 1, 1, 1,
-1.394413, -0.2050625, -1.468461, 1, 1, 1, 1, 1,
-1.385396, -0.8279904, -2.247214, 1, 1, 1, 1, 1,
-1.370703, -1.165722, -1.204065, 1, 1, 1, 1, 1,
-1.365663, -0.2189161, -1.785148, 1, 1, 1, 1, 1,
-1.35865, 0.05006006, -0.9624808, 1, 1, 1, 1, 1,
-1.348084, -0.7045091, -1.811169, 1, 1, 1, 1, 1,
-1.342371, -0.1318758, -1.614799, 1, 1, 1, 1, 1,
-1.342213, -0.7200724, -4.717218, 1, 1, 1, 1, 1,
-1.341146, -0.9559214, -3.11234, 1, 1, 1, 1, 1,
-1.324905, 1.455225, -0.9642625, 0, 0, 1, 1, 1,
-1.320601, -1.758913, -3.788262, 1, 0, 0, 1, 1,
-1.316843, 0.9857363, -0.8537434, 1, 0, 0, 1, 1,
-1.316007, 1.06361, -2.000216, 1, 0, 0, 1, 1,
-1.307136, -0.9816457, -3.550616, 1, 0, 0, 1, 1,
-1.305717, 2.058246, 0.6974966, 1, 0, 0, 1, 1,
-1.305292, -0.1050013, -1.753908, 0, 0, 0, 1, 1,
-1.290597, -0.2536437, -1.802358, 0, 0, 0, 1, 1,
-1.287049, -0.953709, -3.192062, 0, 0, 0, 1, 1,
-1.28694, 1.433413, -0.2471949, 0, 0, 0, 1, 1,
-1.27269, 0.676766, 0.1099051, 0, 0, 0, 1, 1,
-1.272019, 1.529949, -1.051899, 0, 0, 0, 1, 1,
-1.27136, 0.05876792, -1.229902, 0, 0, 0, 1, 1,
-1.270509, -1.082157, -4.420783, 1, 1, 1, 1, 1,
-1.257534, 2.147193, 2.064329, 1, 1, 1, 1, 1,
-1.256171, -1.232872, -1.623964, 1, 1, 1, 1, 1,
-1.253993, -0.837818, -1.495051, 1, 1, 1, 1, 1,
-1.251287, 0.5353814, -1.434732, 1, 1, 1, 1, 1,
-1.247016, -0.3384783, -0.3204402, 1, 1, 1, 1, 1,
-1.244793, 0.08723924, -2.468807, 1, 1, 1, 1, 1,
-1.243339, 0.3072615, -0.711063, 1, 1, 1, 1, 1,
-1.241869, -0.1140885, -2.779219, 1, 1, 1, 1, 1,
-1.233858, -1.347719, -3.509972, 1, 1, 1, 1, 1,
-1.232542, -1.793277, -3.153582, 1, 1, 1, 1, 1,
-1.231877, 0.4753041, -1.010541, 1, 1, 1, 1, 1,
-1.227442, -0.2414667, -2.618948, 1, 1, 1, 1, 1,
-1.22414, -0.2792975, -2.118381, 1, 1, 1, 1, 1,
-1.220774, -1.143126, -4.83653, 1, 1, 1, 1, 1,
-1.217957, 1.452458, -0.7500732, 0, 0, 1, 1, 1,
-1.214627, -0.4766097, -0.7381049, 1, 0, 0, 1, 1,
-1.21255, 1.348492, 0.008551202, 1, 0, 0, 1, 1,
-1.211231, 0.02349943, -2.072416, 1, 0, 0, 1, 1,
-1.208748, -1.162057, -1.419872, 1, 0, 0, 1, 1,
-1.205315, 0.801221, -0.3367627, 1, 0, 0, 1, 1,
-1.198618, -0.1806076, -0.8721269, 0, 0, 0, 1, 1,
-1.188347, -0.6699471, -1.239615, 0, 0, 0, 1, 1,
-1.182004, 1.878166, 1.507683, 0, 0, 0, 1, 1,
-1.176952, 0.489272, -1.892899, 0, 0, 0, 1, 1,
-1.17672, 0.4119937, -1.871356, 0, 0, 0, 1, 1,
-1.176349, 1.794649, -1.488138, 0, 0, 0, 1, 1,
-1.174339, -1.617583, -3.019775, 0, 0, 0, 1, 1,
-1.166841, 0.06923294, -1.436199, 1, 1, 1, 1, 1,
-1.161652, 1.266774, -1.116897, 1, 1, 1, 1, 1,
-1.157817, -0.3439781, -3.684179, 1, 1, 1, 1, 1,
-1.156423, 1.340856, -0.734558, 1, 1, 1, 1, 1,
-1.154815, 0.1592073, -0.6893433, 1, 1, 1, 1, 1,
-1.14115, 1.694556, -0.06768341, 1, 1, 1, 1, 1,
-1.12611, -0.3724946, -1.320568, 1, 1, 1, 1, 1,
-1.123392, 0.4409925, -1.227027, 1, 1, 1, 1, 1,
-1.119027, 0.3035258, -1.427845, 1, 1, 1, 1, 1,
-1.117976, 0.167432, -2.509201, 1, 1, 1, 1, 1,
-1.110538, 2.059199, -0.6396718, 1, 1, 1, 1, 1,
-1.108231, 1.293013, -0.825563, 1, 1, 1, 1, 1,
-1.107521, 0.08038507, -0.8445602, 1, 1, 1, 1, 1,
-1.103083, 0.3300124, -1.347726, 1, 1, 1, 1, 1,
-1.101593, -0.2873967, -1.74137, 1, 1, 1, 1, 1,
-1.097173, 1.358966, -0.1569549, 0, 0, 1, 1, 1,
-1.09593, 0.8996115, -2.452504, 1, 0, 0, 1, 1,
-1.094012, -0.2464723, -1.755372, 1, 0, 0, 1, 1,
-1.092664, 0.3927628, -0.5979906, 1, 0, 0, 1, 1,
-1.088438, 1.456558, 0.01590001, 1, 0, 0, 1, 1,
-1.087499, 0.5503858, 0.05883962, 1, 0, 0, 1, 1,
-1.086895, -0.6847043, -3.897521, 0, 0, 0, 1, 1,
-1.08099, -0.8357847, -4.346351, 0, 0, 0, 1, 1,
-1.07412, 0.4584723, -0.2457095, 0, 0, 0, 1, 1,
-1.073356, 0.6952956, -1.490507, 0, 0, 0, 1, 1,
-1.062287, -0.7976719, -2.391946, 0, 0, 0, 1, 1,
-1.052365, 0.4590681, -0.9054722, 0, 0, 0, 1, 1,
-1.051622, 0.5560282, -2.625886, 0, 0, 0, 1, 1,
-1.042553, 1.457831, -1.840302, 1, 1, 1, 1, 1,
-1.040036, 0.8597611, -2.510468, 1, 1, 1, 1, 1,
-1.03794, 0.7836828, 0.3749505, 1, 1, 1, 1, 1,
-1.030834, 0.05973279, -1.203119, 1, 1, 1, 1, 1,
-1.026344, 0.687746, -2.203223, 1, 1, 1, 1, 1,
-1.023093, 1.023401, -1.033092, 1, 1, 1, 1, 1,
-1.022876, -0.2692744, -1.402566, 1, 1, 1, 1, 1,
-1.015887, 1.804723, -0.4501806, 1, 1, 1, 1, 1,
-1.015702, -1.750548, -4.023744, 1, 1, 1, 1, 1,
-1.015285, -0.0676339, -1.926903, 1, 1, 1, 1, 1,
-1.01414, 0.5635768, -0.3665377, 1, 1, 1, 1, 1,
-1.002531, -0.9264836, -3.14222, 1, 1, 1, 1, 1,
-1.00213, 1.062692, 0.9020687, 1, 1, 1, 1, 1,
-0.9982345, 0.8357403, -0.769823, 1, 1, 1, 1, 1,
-0.9949936, -1.360349, -2.728392, 1, 1, 1, 1, 1,
-0.9944016, -0.5081508, -2.170058, 0, 0, 1, 1, 1,
-0.9924328, -1.300547, -1.133527, 1, 0, 0, 1, 1,
-0.9923399, 0.5251619, -1.758886, 1, 0, 0, 1, 1,
-0.9864125, -0.2697771, -3.183825, 1, 0, 0, 1, 1,
-0.9861479, 1.151486, 0.2053261, 1, 0, 0, 1, 1,
-0.9853398, 0.601198, 0.6561671, 1, 0, 0, 1, 1,
-0.9812137, 0.6483773, -2.573078, 0, 0, 0, 1, 1,
-0.9727821, -0.6961455, -3.701292, 0, 0, 0, 1, 1,
-0.9701295, -0.5388145, -2.308487, 0, 0, 0, 1, 1,
-0.9640012, -0.1273025, -1.453078, 0, 0, 0, 1, 1,
-0.9618981, -0.5537787, -1.706428, 0, 0, 0, 1, 1,
-0.9600519, -0.9686646, -0.6439692, 0, 0, 0, 1, 1,
-0.9555975, 1.694077, -0.216013, 0, 0, 0, 1, 1,
-0.954102, -0.1819554, -1.390808, 1, 1, 1, 1, 1,
-0.9500484, -0.913449, -1.531218, 1, 1, 1, 1, 1,
-0.9472473, 0.4008042, -4.050091, 1, 1, 1, 1, 1,
-0.9448864, -1.138697, -1.161475, 1, 1, 1, 1, 1,
-0.9430445, 1.071192, 1.413767, 1, 1, 1, 1, 1,
-0.9397462, -0.8083735, -2.460328, 1, 1, 1, 1, 1,
-0.9374303, -0.1448554, -0.6547263, 1, 1, 1, 1, 1,
-0.9315769, 1.394936, 0.03034055, 1, 1, 1, 1, 1,
-0.9298546, 1.403681, -1.807025, 1, 1, 1, 1, 1,
-0.92928, -0.4312075, -1.294437, 1, 1, 1, 1, 1,
-0.9287988, 1.679831, -0.438363, 1, 1, 1, 1, 1,
-0.9282349, -0.9926673, -1.954056, 1, 1, 1, 1, 1,
-0.9226531, -0.6890397, -2.094079, 1, 1, 1, 1, 1,
-0.9215344, -0.1187678, -0.6247957, 1, 1, 1, 1, 1,
-0.9140205, 2.243491, 1.332792, 1, 1, 1, 1, 1,
-0.9079446, 1.84904, -2.116408, 0, 0, 1, 1, 1,
-0.9045703, 0.08039638, -0.9908152, 1, 0, 0, 1, 1,
-0.9034715, 1.618535, -0.5102414, 1, 0, 0, 1, 1,
-0.8931969, -1.153744, -2.708713, 1, 0, 0, 1, 1,
-0.8929237, 1.194026, -0.481745, 1, 0, 0, 1, 1,
-0.8899617, 2.174597, 0.4038052, 1, 0, 0, 1, 1,
-0.889014, 0.157379, -0.9745938, 0, 0, 0, 1, 1,
-0.8887313, 0.4488168, 0.2925947, 0, 0, 0, 1, 1,
-0.8847269, 0.1240392, -1.963325, 0, 0, 0, 1, 1,
-0.876067, 0.1172939, -2.007018, 0, 0, 0, 1, 1,
-0.8752437, 0.9577282, -0.6608416, 0, 0, 0, 1, 1,
-0.8718819, 1.399391, -1.372756, 0, 0, 0, 1, 1,
-0.8702599, 0.5613781, -1.014314, 0, 0, 0, 1, 1,
-0.8653557, 0.1393332, -3.504738, 1, 1, 1, 1, 1,
-0.863941, 0.4405728, -0.05457539, 1, 1, 1, 1, 1,
-0.8509713, 1.244148, -0.2607537, 1, 1, 1, 1, 1,
-0.8506218, -1.075318, -1.526075, 1, 1, 1, 1, 1,
-0.8470323, -0.5719572, -3.048105, 1, 1, 1, 1, 1,
-0.8425879, -0.0637285, 0.2436104, 1, 1, 1, 1, 1,
-0.8409018, -1.695703, -1.12805, 1, 1, 1, 1, 1,
-0.8399488, -0.9652432, -3.412456, 1, 1, 1, 1, 1,
-0.8380761, -0.7494377, -2.80975, 1, 1, 1, 1, 1,
-0.8271807, 1.232815, -0.7793198, 1, 1, 1, 1, 1,
-0.82666, -0.2991154, -2.315048, 1, 1, 1, 1, 1,
-0.8241955, 1.242499, -0.8167559, 1, 1, 1, 1, 1,
-0.8188121, -0.3087454, -1.019475, 1, 1, 1, 1, 1,
-0.8180446, -0.05520087, -1.915703, 1, 1, 1, 1, 1,
-0.8168899, -2.414038, -0.9234816, 1, 1, 1, 1, 1,
-0.8072346, -0.3516891, -2.258765, 0, 0, 1, 1, 1,
-0.8069274, 0.2885333, -1.589337, 1, 0, 0, 1, 1,
-0.8067595, -0.5651081, -0.4439572, 1, 0, 0, 1, 1,
-0.8046584, 0.9448961, 0.3319187, 1, 0, 0, 1, 1,
-0.8040885, 2.800673, 1.092406, 1, 0, 0, 1, 1,
-0.8027929, 1.072931, -0.7930666, 1, 0, 0, 1, 1,
-0.797848, -0.7259017, -1.752799, 0, 0, 0, 1, 1,
-0.7975999, 0.3468925, -1.751639, 0, 0, 0, 1, 1,
-0.7926896, -1.218436, -2.337555, 0, 0, 0, 1, 1,
-0.7907962, 0.06162824, -2.449624, 0, 0, 0, 1, 1,
-0.7847312, -0.5122362, -1.663838, 0, 0, 0, 1, 1,
-0.779411, 0.4911609, -2.092643, 0, 0, 0, 1, 1,
-0.7790611, -1.529477, -4.020686, 0, 0, 0, 1, 1,
-0.7701108, -0.704229, -3.535419, 1, 1, 1, 1, 1,
-0.766126, -1.105601, -3.028113, 1, 1, 1, 1, 1,
-0.7616065, 0.7133326, -0.5113674, 1, 1, 1, 1, 1,
-0.7602304, -1.248495, -1.923053, 1, 1, 1, 1, 1,
-0.7523002, 1.691072, -1.390118, 1, 1, 1, 1, 1,
-0.748799, 0.1633142, 0.2210013, 1, 1, 1, 1, 1,
-0.7487406, -0.6727208, -3.927798, 1, 1, 1, 1, 1,
-0.7473486, -1.500977, -1.853645, 1, 1, 1, 1, 1,
-0.7441235, -0.021343, -0.4856449, 1, 1, 1, 1, 1,
-0.7422034, 1.014713, -1.269485, 1, 1, 1, 1, 1,
-0.736989, 1.060005, -0.6928627, 1, 1, 1, 1, 1,
-0.7338447, -1.671696, -3.656297, 1, 1, 1, 1, 1,
-0.7209265, -1.678763, -2.307091, 1, 1, 1, 1, 1,
-0.7148544, 0.06863022, -1.782887, 1, 1, 1, 1, 1,
-0.713125, -0.3976286, -1.592494, 1, 1, 1, 1, 1,
-0.7130767, -0.4892636, -4.81798, 0, 0, 1, 1, 1,
-0.7130641, 1.219486, -0.9946481, 1, 0, 0, 1, 1,
-0.7075372, -0.1958138, -0.3387535, 1, 0, 0, 1, 1,
-0.7056127, -0.5927818, -1.261564, 1, 0, 0, 1, 1,
-0.7000273, -0.7371417, -2.531308, 1, 0, 0, 1, 1,
-0.6981822, 0.5567133, -2.720865, 1, 0, 0, 1, 1,
-0.6950725, 0.6203049, -0.1790335, 0, 0, 0, 1, 1,
-0.6930071, -0.9576693, -2.091818, 0, 0, 0, 1, 1,
-0.6928753, 0.8791552, -0.2177182, 0, 0, 0, 1, 1,
-0.6916904, -1.241063, -0.9149597, 0, 0, 0, 1, 1,
-0.6911345, -0.8984019, -2.466331, 0, 0, 0, 1, 1,
-0.6892538, -0.1363287, -1.815443, 0, 0, 0, 1, 1,
-0.6821839, 0.1651179, -2.222461, 0, 0, 0, 1, 1,
-0.6804307, 0.4554328, -1.978706, 1, 1, 1, 1, 1,
-0.6791028, -0.3422373, -2.08359, 1, 1, 1, 1, 1,
-0.6764386, 0.2956183, -1.88389, 1, 1, 1, 1, 1,
-0.6688128, -2.163163, -2.408025, 1, 1, 1, 1, 1,
-0.6664249, 0.2323051, -0.3410374, 1, 1, 1, 1, 1,
-0.6658601, 0.1799948, 1.067067, 1, 1, 1, 1, 1,
-0.6632929, 0.4544764, -1.558433, 1, 1, 1, 1, 1,
-0.6592782, 0.07273366, -1.645056, 1, 1, 1, 1, 1,
-0.6546293, -0.220774, -0.6063498, 1, 1, 1, 1, 1,
-0.6489137, -1.943985, -2.303261, 1, 1, 1, 1, 1,
-0.647379, 0.05932164, -1.90058, 1, 1, 1, 1, 1,
-0.646911, 0.7208382, 0.3090596, 1, 1, 1, 1, 1,
-0.6442184, 1.624499, -0.6038261, 1, 1, 1, 1, 1,
-0.6434731, 0.3125098, -0.3916896, 1, 1, 1, 1, 1,
-0.6370674, 2.462987, 0.4964035, 1, 1, 1, 1, 1,
-0.6352939, -1.427105, -2.485972, 0, 0, 1, 1, 1,
-0.6297005, 0.906258, -0.0861259, 1, 0, 0, 1, 1,
-0.6293227, -0.8870566, -1.356706, 1, 0, 0, 1, 1,
-0.6262967, -2.743912, -2.672731, 1, 0, 0, 1, 1,
-0.6250337, 0.9132935, 0.02614276, 1, 0, 0, 1, 1,
-0.6242223, -2.16218, -3.053084, 1, 0, 0, 1, 1,
-0.6154287, -1.614215, -2.976151, 0, 0, 0, 1, 1,
-0.6149686, -1.043262, -0.5365618, 0, 0, 0, 1, 1,
-0.611952, -0.2694117, -2.6507, 0, 0, 0, 1, 1,
-0.6100823, -0.8190528, -2.571037, 0, 0, 0, 1, 1,
-0.6085247, -0.1181508, -1.925535, 0, 0, 0, 1, 1,
-0.5994052, -0.3548368, -1.782604, 0, 0, 0, 1, 1,
-0.5947993, 0.1990892, -1.731587, 0, 0, 0, 1, 1,
-0.591957, -0.9016592, -3.502853, 1, 1, 1, 1, 1,
-0.5881106, 0.003454073, -1.677799, 1, 1, 1, 1, 1,
-0.588091, 0.2878268, 1.185289, 1, 1, 1, 1, 1,
-0.5860768, 0.2703037, 0.1719308, 1, 1, 1, 1, 1,
-0.5857443, -1.140334, -1.927285, 1, 1, 1, 1, 1,
-0.5844163, -0.7266176, -3.151251, 1, 1, 1, 1, 1,
-0.5742158, -0.5830869, -2.267828, 1, 1, 1, 1, 1,
-0.5703908, -0.3711134, -1.783893, 1, 1, 1, 1, 1,
-0.5683039, 1.732466, -0.4787275, 1, 1, 1, 1, 1,
-0.5675475, -0.1854843, -2.288907, 1, 1, 1, 1, 1,
-0.5623288, -0.2356802, -2.3088, 1, 1, 1, 1, 1,
-0.5549133, -0.6896118, -3.427727, 1, 1, 1, 1, 1,
-0.5468572, 0.02208902, -1.753276, 1, 1, 1, 1, 1,
-0.5420734, 0.4037109, 0.00734043, 1, 1, 1, 1, 1,
-0.5417832, 1.266061, -0.6591737, 1, 1, 1, 1, 1,
-0.5405561, 0.1765017, -2.012757, 0, 0, 1, 1, 1,
-0.5404414, 1.553409, -2.197452, 1, 0, 0, 1, 1,
-0.5399902, -1.090129, -2.003778, 1, 0, 0, 1, 1,
-0.5343952, -0.7955768, -3.856088, 1, 0, 0, 1, 1,
-0.5311992, 0.05950382, -1.323399, 1, 0, 0, 1, 1,
-0.5300769, -0.003893132, -1.405729, 1, 0, 0, 1, 1,
-0.5290335, -1.588349, -1.351302, 0, 0, 0, 1, 1,
-0.5231702, -1.49614, -2.275369, 0, 0, 0, 1, 1,
-0.5228716, -2.719805, -1.988343, 0, 0, 0, 1, 1,
-0.5078394, -0.1614246, -2.787531, 0, 0, 0, 1, 1,
-0.4999283, 0.7235366, -1.328023, 0, 0, 0, 1, 1,
-0.4966709, 0.2938307, -0.5308541, 0, 0, 0, 1, 1,
-0.4941922, -0.6800511, -2.229282, 0, 0, 0, 1, 1,
-0.4895926, -1.345131, -3.480842, 1, 1, 1, 1, 1,
-0.4889217, -0.1036082, -2.583429, 1, 1, 1, 1, 1,
-0.4858868, 0.08421081, -2.184665, 1, 1, 1, 1, 1,
-0.4848883, -2.234429, -3.747702, 1, 1, 1, 1, 1,
-0.4842617, -0.8684006, -1.494377, 1, 1, 1, 1, 1,
-0.4830071, 0.3965396, -0.7211052, 1, 1, 1, 1, 1,
-0.4813196, -1.139472, -1.078501, 1, 1, 1, 1, 1,
-0.4799874, 0.3956839, -0.9011322, 1, 1, 1, 1, 1,
-0.4797759, 0.3262858, -0.6301152, 1, 1, 1, 1, 1,
-0.4791004, 1.460034, 0.4057835, 1, 1, 1, 1, 1,
-0.476102, 1.519944, -1.968258, 1, 1, 1, 1, 1,
-0.4725608, -0.9838355, -3.609917, 1, 1, 1, 1, 1,
-0.4686243, 0.05059221, -0.8816382, 1, 1, 1, 1, 1,
-0.4679151, -2.006272, -4.390699, 1, 1, 1, 1, 1,
-0.4669007, 0.1955042, -2.359131, 1, 1, 1, 1, 1,
-0.4626286, -0.7541729, -3.967348, 0, 0, 1, 1, 1,
-0.4593868, 0.03902375, -1.683261, 1, 0, 0, 1, 1,
-0.4586383, -0.8584948, -3.504025, 1, 0, 0, 1, 1,
-0.4532616, -0.1682552, -2.697409, 1, 0, 0, 1, 1,
-0.4517562, -1.190891, -3.81706, 1, 0, 0, 1, 1,
-0.4504428, -0.2382603, -4.062164, 1, 0, 0, 1, 1,
-0.447456, 0.2791852, 0.3101636, 0, 0, 0, 1, 1,
-0.4452802, -0.422705, -1.270427, 0, 0, 0, 1, 1,
-0.4417292, 0.28185, -1.225084, 0, 0, 0, 1, 1,
-0.4389129, -1.376566, -3.083616, 0, 0, 0, 1, 1,
-0.435992, -0.6837974, -2.316122, 0, 0, 0, 1, 1,
-0.4345983, -0.06635477, -0.7454193, 0, 0, 0, 1, 1,
-0.4318016, -1.20552, -2.132207, 0, 0, 0, 1, 1,
-0.4289541, 2.102376, -0.3627901, 1, 1, 1, 1, 1,
-0.4236417, -0.6038432, -2.524969, 1, 1, 1, 1, 1,
-0.4226504, 1.256909, -0.9389579, 1, 1, 1, 1, 1,
-0.4222699, 0.2574458, -0.4657266, 1, 1, 1, 1, 1,
-0.4194066, 0.7542722, 0.285178, 1, 1, 1, 1, 1,
-0.4188011, -0.1274364, -2.717787, 1, 1, 1, 1, 1,
-0.4175685, 0.9473488, 0.2771902, 1, 1, 1, 1, 1,
-0.4160081, -0.1878494, -1.835971, 1, 1, 1, 1, 1,
-0.4127367, -0.03892621, -0.2130857, 1, 1, 1, 1, 1,
-0.4124962, -0.768694, -3.419253, 1, 1, 1, 1, 1,
-0.4102698, -0.4061944, -2.056162, 1, 1, 1, 1, 1,
-0.4075916, 1.657358, 0.4958934, 1, 1, 1, 1, 1,
-0.4032562, -1.61334, -2.773496, 1, 1, 1, 1, 1,
-0.3966701, -0.1110289, -2.777063, 1, 1, 1, 1, 1,
-0.394708, 0.09687162, -2.610467, 1, 1, 1, 1, 1,
-0.3915215, 0.2384422, -2.754279, 0, 0, 1, 1, 1,
-0.3880208, -0.02178015, -0.977645, 1, 0, 0, 1, 1,
-0.3876911, 1.53153, -1.534943, 1, 0, 0, 1, 1,
-0.3781237, -1.015498, -3.274816, 1, 0, 0, 1, 1,
-0.3740312, 0.8796572, -0.08651502, 1, 0, 0, 1, 1,
-0.3708118, -1.191263, -2.003055, 1, 0, 0, 1, 1,
-0.367691, 0.02819154, -1.06194, 0, 0, 0, 1, 1,
-0.3671675, -0.3729323, -2.543046, 0, 0, 0, 1, 1,
-0.3667057, -0.08011302, -3.246846, 0, 0, 0, 1, 1,
-0.366633, -0.2342688, -2.291648, 0, 0, 0, 1, 1,
-0.3644993, 1.475866, -2.662469, 0, 0, 0, 1, 1,
-0.362675, -0.02265592, -1.737895, 0, 0, 0, 1, 1,
-0.3588621, 1.083038, 1.519806, 0, 0, 0, 1, 1,
-0.3542395, 1.340906, -0.05274293, 1, 1, 1, 1, 1,
-0.3523785, -0.7508062, -1.531375, 1, 1, 1, 1, 1,
-0.3486836, 0.8229218, -0.1825747, 1, 1, 1, 1, 1,
-0.3486419, 0.7834873, 0.1875713, 1, 1, 1, 1, 1,
-0.3484166, 0.5475111, -1.08873, 1, 1, 1, 1, 1,
-0.3440937, 1.027866, -0.2861874, 1, 1, 1, 1, 1,
-0.3409173, -0.3554144, -2.326871, 1, 1, 1, 1, 1,
-0.3298106, 0.279769, -1.650302, 1, 1, 1, 1, 1,
-0.3249906, -0.1142938, -2.526389, 1, 1, 1, 1, 1,
-0.3238148, -2.006859, -3.385154, 1, 1, 1, 1, 1,
-0.3202195, 0.8225884, -0.8650792, 1, 1, 1, 1, 1,
-0.3180436, 1.081462, -1.071243, 1, 1, 1, 1, 1,
-0.3124038, -0.9968309, -2.911084, 1, 1, 1, 1, 1,
-0.3077294, -0.1514323, -4.111258, 1, 1, 1, 1, 1,
-0.3046679, -0.3286321, -3.588517, 1, 1, 1, 1, 1,
-0.3022478, -0.1632442, -2.088027, 0, 0, 1, 1, 1,
-0.3020151, 1.049388, -1.391761, 1, 0, 0, 1, 1,
-0.300416, 1.226682, 0.7121567, 1, 0, 0, 1, 1,
-0.2935621, -0.03453702, -2.366636, 1, 0, 0, 1, 1,
-0.2863828, 0.7442698, -1.087183, 1, 0, 0, 1, 1,
-0.2849644, 1.424207, -0.4092214, 1, 0, 0, 1, 1,
-0.2818692, -0.3720891, -0.6801659, 0, 0, 0, 1, 1,
-0.275575, 0.9642169, 1.082651, 0, 0, 0, 1, 1,
-0.2749268, 0.406747, -0.6725266, 0, 0, 0, 1, 1,
-0.2729125, 1.651462, -1.355663, 0, 0, 0, 1, 1,
-0.2717209, 0.6431063, 1.008295, 0, 0, 0, 1, 1,
-0.2706235, -0.09518289, -1.232882, 0, 0, 0, 1, 1,
-0.2693383, -0.5480283, -2.575267, 0, 0, 0, 1, 1,
-0.2684049, 0.7446309, 1.618712, 1, 1, 1, 1, 1,
-0.2643927, -0.485741, -2.916711, 1, 1, 1, 1, 1,
-0.2638872, -0.303376, -1.807466, 1, 1, 1, 1, 1,
-0.2613714, -0.2172146, -3.011015, 1, 1, 1, 1, 1,
-0.2582678, 0.3289686, -0.002831246, 1, 1, 1, 1, 1,
-0.2555883, -0.8377987, -3.610659, 1, 1, 1, 1, 1,
-0.2553023, 2.015817, 0.6813715, 1, 1, 1, 1, 1,
-0.2540238, -0.4741127, -1.448223, 1, 1, 1, 1, 1,
-0.2526524, 1.151173, -0.1411837, 1, 1, 1, 1, 1,
-0.2513295, 0.5266722, 0.5123767, 1, 1, 1, 1, 1,
-0.2493684, 1.524553, -0.1236201, 1, 1, 1, 1, 1,
-0.2397048, 0.7128242, -3.625827, 1, 1, 1, 1, 1,
-0.2393337, 0.08006586, -1.977968, 1, 1, 1, 1, 1,
-0.2393155, -0.1989035, -2.020612, 1, 1, 1, 1, 1,
-0.2327302, -0.7065111, -2.56025, 1, 1, 1, 1, 1,
-0.2299157, -2.675467, -2.240975, 0, 0, 1, 1, 1,
-0.2261228, -0.3342236, -2.594926, 1, 0, 0, 1, 1,
-0.2250735, 0.5028503, -1.345191, 1, 0, 0, 1, 1,
-0.2235764, -0.1249621, -3.241461, 1, 0, 0, 1, 1,
-0.2200847, -0.2897076, -2.826285, 1, 0, 0, 1, 1,
-0.2179961, -0.7987394, -4.150623, 1, 0, 0, 1, 1,
-0.216702, 1.2735, -0.5808537, 0, 0, 0, 1, 1,
-0.2135438, -2.858466, -1.738634, 0, 0, 0, 1, 1,
-0.2095606, 1.229542, -0.5776671, 0, 0, 0, 1, 1,
-0.2076332, -0.2283058, -3.30847, 0, 0, 0, 1, 1,
-0.2018602, -0.4880092, -2.172704, 0, 0, 0, 1, 1,
-0.2013733, 1.577161, -2.07623, 0, 0, 0, 1, 1,
-0.1852835, -1.54549, -1.765181, 0, 0, 0, 1, 1,
-0.1827819, -0.9529544, -2.366307, 1, 1, 1, 1, 1,
-0.1768785, -0.3984853, -2.596563, 1, 1, 1, 1, 1,
-0.1739018, 0.2329445, -1.893046, 1, 1, 1, 1, 1,
-0.1721522, -0.6292259, -3.825733, 1, 1, 1, 1, 1,
-0.1689572, -0.6310431, -1.387935, 1, 1, 1, 1, 1,
-0.1686811, 0.4144979, -2.26788, 1, 1, 1, 1, 1,
-0.1679483, 1.550133, 0.07358442, 1, 1, 1, 1, 1,
-0.1638793, 1.44873, -0.8817951, 1, 1, 1, 1, 1,
-0.1621632, -0.1894553, -2.526652, 1, 1, 1, 1, 1,
-0.1508275, -2.268748, -2.440171, 1, 1, 1, 1, 1,
-0.1488452, 0.2375461, -0.378018, 1, 1, 1, 1, 1,
-0.1462524, 1.170474, -0.6089513, 1, 1, 1, 1, 1,
-0.1460765, -3.401841, -3.864447, 1, 1, 1, 1, 1,
-0.1438669, 1.019548, 0.4930552, 1, 1, 1, 1, 1,
-0.1413094, -1.242585, -3.765445, 1, 1, 1, 1, 1,
-0.141054, -0.6891048, -2.006523, 0, 0, 1, 1, 1,
-0.1398644, 0.1117991, -0.683466, 1, 0, 0, 1, 1,
-0.1381763, 0.06040671, -0.5180673, 1, 0, 0, 1, 1,
-0.1361452, 2.001016, 0.6423648, 1, 0, 0, 1, 1,
-0.1301613, -1.552264, -2.74589, 1, 0, 0, 1, 1,
-0.1290405, 0.3332983, -0.07289658, 1, 0, 0, 1, 1,
-0.1273506, 2.410534, -0.1173661, 0, 0, 0, 1, 1,
-0.1265259, -0.492816, -3.71099, 0, 0, 0, 1, 1,
-0.1249905, 0.5183127, -0.04747015, 0, 0, 0, 1, 1,
-0.1212172, 0.1405412, -1.307058, 0, 0, 0, 1, 1,
-0.1135894, 0.3240386, -1.321148, 0, 0, 0, 1, 1,
-0.1114156, 1.237827, -0.7574147, 0, 0, 0, 1, 1,
-0.1066868, 0.6333907, -1.299816, 0, 0, 0, 1, 1,
-0.1039657, -0.362992, -2.222775, 1, 1, 1, 1, 1,
-0.1030485, 0.3326226, -0.1204354, 1, 1, 1, 1, 1,
-0.1009239, 0.7243826, 1.386741, 1, 1, 1, 1, 1,
-0.09259944, 1.869552, 0.8736681, 1, 1, 1, 1, 1,
-0.0854573, 0.8990026, 0.6989632, 1, 1, 1, 1, 1,
-0.08331135, 0.04903187, 0.01006983, 1, 1, 1, 1, 1,
-0.08298887, 0.29541, 0.2925464, 1, 1, 1, 1, 1,
-0.08155311, 1.048191, 0.1648557, 1, 1, 1, 1, 1,
-0.0814587, 0.5498684, 1.35969, 1, 1, 1, 1, 1,
-0.07976352, -1.134634, -4.227926, 1, 1, 1, 1, 1,
-0.0789306, 0.2564132, 0.1842144, 1, 1, 1, 1, 1,
-0.07861483, -1.161311, -2.767311, 1, 1, 1, 1, 1,
-0.07787591, 0.1752376, -1.360456, 1, 1, 1, 1, 1,
-0.07665644, 0.0115324, -3.414464, 1, 1, 1, 1, 1,
-0.07126388, 0.2120348, -0.256515, 1, 1, 1, 1, 1,
-0.07072546, 1.574836, -0.2207212, 0, 0, 1, 1, 1,
-0.06746589, -0.2071171, -2.489034, 1, 0, 0, 1, 1,
-0.06744883, -1.909063, -2.261809, 1, 0, 0, 1, 1,
-0.06551319, -0.6711327, -1.248258, 1, 0, 0, 1, 1,
-0.05947668, -1.361802, -3.237509, 1, 0, 0, 1, 1,
-0.05560892, -1.039874, -4.05602, 1, 0, 0, 1, 1,
-0.05183502, -1.271466, -2.098041, 0, 0, 0, 1, 1,
-0.05159202, 0.3026116, -0.1832139, 0, 0, 0, 1, 1,
-0.05054212, -0.1220705, -1.961919, 0, 0, 0, 1, 1,
-0.05039523, -1.458829, -2.552164, 0, 0, 0, 1, 1,
-0.04562814, -0.6897863, -4.375607, 0, 0, 0, 1, 1,
-0.04493834, 0.4584645, -1.26502, 0, 0, 0, 1, 1,
-0.04452263, 1.401869, 0.3801697, 0, 0, 0, 1, 1,
-0.04045313, -0.2041277, -4.166219, 1, 1, 1, 1, 1,
-0.0381901, 0.2000086, -0.7675131, 1, 1, 1, 1, 1,
-0.03658877, -1.264772, -4.927793, 1, 1, 1, 1, 1,
-0.03482116, -2.226986, -2.880095, 1, 1, 1, 1, 1,
-0.03081878, 0.06645047, -1.194361, 1, 1, 1, 1, 1,
-0.02823748, -0.02387321, -3.773805, 1, 1, 1, 1, 1,
-0.02807838, 2.66868, -0.3258964, 1, 1, 1, 1, 1,
-0.02581337, -0.03031779, -2.841945, 1, 1, 1, 1, 1,
-0.02536894, 0.7778682, -0.5457115, 1, 1, 1, 1, 1,
-0.02498001, -0.328338, -3.358142, 1, 1, 1, 1, 1,
-0.02251269, -0.8145787, -4.225284, 1, 1, 1, 1, 1,
-0.01622871, 0.1341469, 0.5934116, 1, 1, 1, 1, 1,
-0.01610282, 1.024462, 0.02609369, 1, 1, 1, 1, 1,
-0.0129258, 0.829647, -0.298345, 1, 1, 1, 1, 1,
-0.01166755, -0.6677052, -2.691943, 1, 1, 1, 1, 1,
-0.01060838, 0.3767014, 0.5641437, 0, 0, 1, 1, 1,
-0.008762993, 0.308786, 0.1696961, 1, 0, 0, 1, 1,
-0.007415959, 0.005568922, -0.4529094, 1, 0, 0, 1, 1,
-0.007192613, -0.3695537, -3.420312, 1, 0, 0, 1, 1,
-0.002389329, 0.5321861, -0.4182502, 1, 0, 0, 1, 1,
0.003923883, -0.1196929, 1.461901, 1, 0, 0, 1, 1,
0.006718504, -2.081763, 3.278447, 0, 0, 0, 1, 1,
0.01023221, -0.1977988, 3.337715, 0, 0, 0, 1, 1,
0.01138015, 0.7996354, 0.7834483, 0, 0, 0, 1, 1,
0.01300378, 1.253717, 0.1775777, 0, 0, 0, 1, 1,
0.01317715, -0.008269403, 2.984667, 0, 0, 0, 1, 1,
0.01401674, 0.1507286, 0.007374382, 0, 0, 0, 1, 1,
0.01562054, 0.7479672, 1.310183, 0, 0, 0, 1, 1,
0.01678429, -1.041853, 2.886937, 1, 1, 1, 1, 1,
0.01689286, -0.237423, 4.175772, 1, 1, 1, 1, 1,
0.01692929, 0.2914021, 1.029944, 1, 1, 1, 1, 1,
0.02000007, -1.480961, 2.985737, 1, 1, 1, 1, 1,
0.02079994, 1.14642, -0.3988977, 1, 1, 1, 1, 1,
0.02163843, 0.8850546, -1.704195, 1, 1, 1, 1, 1,
0.02354379, -0.5592571, 1.578495, 1, 1, 1, 1, 1,
0.02394456, -1.228137, 3.684574, 1, 1, 1, 1, 1,
0.03099588, -0.448273, 3.477222, 1, 1, 1, 1, 1,
0.03267056, -1.010676, 1.273721, 1, 1, 1, 1, 1,
0.03660765, 1.779667, 1.008925, 1, 1, 1, 1, 1,
0.04183542, -1.748152, 1.42375, 1, 1, 1, 1, 1,
0.04737996, -1.451914, 3.167701, 1, 1, 1, 1, 1,
0.04787325, 0.2133659, 0.9052237, 1, 1, 1, 1, 1,
0.05175265, -1.226788, 2.999715, 1, 1, 1, 1, 1,
0.05689067, 1.32442, -0.7238762, 0, 0, 1, 1, 1,
0.05793288, 0.3229107, -0.2496165, 1, 0, 0, 1, 1,
0.06111431, -0.9214244, 3.654643, 1, 0, 0, 1, 1,
0.06493183, 1.120826, 1.324997, 1, 0, 0, 1, 1,
0.06634774, 0.5344169, -0.04550176, 1, 0, 0, 1, 1,
0.06733209, 0.9151049, -1.826659, 1, 0, 0, 1, 1,
0.06978413, 0.4515204, -1.81143, 0, 0, 0, 1, 1,
0.07021424, 0.0790898, 1.925174, 0, 0, 0, 1, 1,
0.07169549, -1.046871, 2.766515, 0, 0, 0, 1, 1,
0.07754251, -0.7130374, 2.281251, 0, 0, 0, 1, 1,
0.08686887, 1.053264, -1.195523, 0, 0, 0, 1, 1,
0.0869241, 0.5999765, -1.082091, 0, 0, 0, 1, 1,
0.08930271, -0.3558865, 2.514195, 0, 0, 0, 1, 1,
0.09114106, -2.013714, 3.714111, 1, 1, 1, 1, 1,
0.09209178, -1.650647, 4.648549, 1, 1, 1, 1, 1,
0.09622693, 1.415112, 0.2552528, 1, 1, 1, 1, 1,
0.09785656, -0.09274546, 2.322524, 1, 1, 1, 1, 1,
0.1034717, 0.8559586, 1.650144, 1, 1, 1, 1, 1,
0.1116718, 0.05242646, 1.207022, 1, 1, 1, 1, 1,
0.1132805, 1.0314, -2.050928, 1, 1, 1, 1, 1,
0.1139107, 0.4522336, -0.3693829, 1, 1, 1, 1, 1,
0.1153552, 0.4577079, -0.9679348, 1, 1, 1, 1, 1,
0.119366, 0.1697802, 2.358989, 1, 1, 1, 1, 1,
0.1202377, 0.09438664, 2.148007, 1, 1, 1, 1, 1,
0.1250728, -0.149586, 3.107096, 1, 1, 1, 1, 1,
0.1253644, -0.7116045, 3.53372, 1, 1, 1, 1, 1,
0.125445, 0.9357231, 0.1874659, 1, 1, 1, 1, 1,
0.1361814, -0.4659143, 2.861443, 1, 1, 1, 1, 1,
0.1369914, -0.2265632, 4.334954, 0, 0, 1, 1, 1,
0.1400717, -1.508206, 4.897333, 1, 0, 0, 1, 1,
0.14423, 0.9102262, -1.169105, 1, 0, 0, 1, 1,
0.1446337, 0.02102835, 2.448857, 1, 0, 0, 1, 1,
0.1478706, -1.049696, 3.201765, 1, 0, 0, 1, 1,
0.1518339, -1.048895, 3.740534, 1, 0, 0, 1, 1,
0.1567723, -0.8183255, 1.8452, 0, 0, 0, 1, 1,
0.1649243, 0.008658795, 1.538335, 0, 0, 0, 1, 1,
0.1662741, -0.4473858, 3.708142, 0, 0, 0, 1, 1,
0.1686992, 0.8946813, 0.9542304, 0, 0, 0, 1, 1,
0.1691496, -0.8184611, 2.920205, 0, 0, 0, 1, 1,
0.1729305, 0.5722694, 0.06234996, 0, 0, 0, 1, 1,
0.1736549, 1.127528, -1.234957, 0, 0, 0, 1, 1,
0.1771811, 0.8577644, -1.130955, 1, 1, 1, 1, 1,
0.1779942, -1.715877, 4.049419, 1, 1, 1, 1, 1,
0.1789265, 0.5371444, -0.2237871, 1, 1, 1, 1, 1,
0.1789933, -0.2310413, 2.931354, 1, 1, 1, 1, 1,
0.181139, 2.441508, 0.01978117, 1, 1, 1, 1, 1,
0.1858726, 0.1785065, 2.596593, 1, 1, 1, 1, 1,
0.1877969, 0.01156007, 1.204273, 1, 1, 1, 1, 1,
0.1898677, -1.294686, 3.642925, 1, 1, 1, 1, 1,
0.193393, -0.6131526, 4.056561, 1, 1, 1, 1, 1,
0.1947238, -1.076939, 4.372766, 1, 1, 1, 1, 1,
0.1952282, -1.444263, 2.518612, 1, 1, 1, 1, 1,
0.1957026, -0.3903867, 1.973512, 1, 1, 1, 1, 1,
0.2015336, -0.8387318, 2.03975, 1, 1, 1, 1, 1,
0.2046435, 0.1763395, -0.5336423, 1, 1, 1, 1, 1,
0.2081546, -0.03533849, 0.2014542, 1, 1, 1, 1, 1,
0.2120403, 1.298398, -0.06580858, 0, 0, 1, 1, 1,
0.2162634, 0.1312477, 0.729899, 1, 0, 0, 1, 1,
0.2289245, -2.388365, 3.837892, 1, 0, 0, 1, 1,
0.2337078, 0.06411359, 1.845865, 1, 0, 0, 1, 1,
0.2381115, 0.05516282, 1.373626, 1, 0, 0, 1, 1,
0.2397588, 0.2676423, 2.105605, 1, 0, 0, 1, 1,
0.2408432, -2.605833, 1.269337, 0, 0, 0, 1, 1,
0.2416255, -0.9006743, 4.398022, 0, 0, 0, 1, 1,
0.24191, 0.3306411, -1.122212, 0, 0, 0, 1, 1,
0.2425099, 1.275268, 1.187518, 0, 0, 0, 1, 1,
0.2488843, -0.1854827, 3.486873, 0, 0, 0, 1, 1,
0.2503132, 1.806553, -0.4609923, 0, 0, 0, 1, 1,
0.2506825, 1.190152, 1.408009, 0, 0, 0, 1, 1,
0.2517692, 0.6713728, 0.05302798, 1, 1, 1, 1, 1,
0.2549173, 0.5826322, 0.4374176, 1, 1, 1, 1, 1,
0.2557654, 0.5788051, -0.6431312, 1, 1, 1, 1, 1,
0.2598765, -0.4044612, 2.515469, 1, 1, 1, 1, 1,
0.2605736, -0.3023493, 1.54285, 1, 1, 1, 1, 1,
0.2613876, -0.1869337, 0.01046275, 1, 1, 1, 1, 1,
0.2632874, 0.3652172, 0.8606079, 1, 1, 1, 1, 1,
0.2634504, 0.5820179, -0.1276893, 1, 1, 1, 1, 1,
0.2636265, -0.9333391, 1.637215, 1, 1, 1, 1, 1,
0.2655792, -1.035125, 2.300937, 1, 1, 1, 1, 1,
0.2659728, 0.7396414, -1.603009, 1, 1, 1, 1, 1,
0.266849, -1.705485, 3.380502, 1, 1, 1, 1, 1,
0.2673576, -1.639099, 3.227925, 1, 1, 1, 1, 1,
0.2693903, 0.08860534, 2.061534, 1, 1, 1, 1, 1,
0.2731574, 0.03994891, 1.317139, 1, 1, 1, 1, 1,
0.2795551, 0.962244, -0.2244911, 0, 0, 1, 1, 1,
0.2800888, -0.5035369, 4.313243, 1, 0, 0, 1, 1,
0.2836291, -0.8809122, 2.947548, 1, 0, 0, 1, 1,
0.2843119, -1.602749, 3.720939, 1, 0, 0, 1, 1,
0.2850318, 1.426357, 0.9100408, 1, 0, 0, 1, 1,
0.2878381, 0.8470433, 0.5262787, 1, 0, 0, 1, 1,
0.2894266, -0.106567, 2.368014, 0, 0, 0, 1, 1,
0.2894573, 0.2826842, 0.5655569, 0, 0, 0, 1, 1,
0.2957406, -1.255869, 2.299355, 0, 0, 0, 1, 1,
0.2967755, 1.407392, -0.5370652, 0, 0, 0, 1, 1,
0.2979338, -0.001821483, 2.153485, 0, 0, 0, 1, 1,
0.3005944, 0.6813177, 0.1622368, 0, 0, 0, 1, 1,
0.3053653, -0.647761, 3.883528, 0, 0, 0, 1, 1,
0.3061399, -0.432186, 1.751791, 1, 1, 1, 1, 1,
0.3071411, 1.190935, -0.1479089, 1, 1, 1, 1, 1,
0.3073838, 1.170573, 0.1818531, 1, 1, 1, 1, 1,
0.3089095, 0.05378206, 1.893921, 1, 1, 1, 1, 1,
0.3142473, -0.3953692, 2.603211, 1, 1, 1, 1, 1,
0.3177061, 0.7228184, 1.339429, 1, 1, 1, 1, 1,
0.3186816, 1.185319, 0.3050599, 1, 1, 1, 1, 1,
0.3227143, 0.266994, 1.67511, 1, 1, 1, 1, 1,
0.326301, 0.363364, -0.4807737, 1, 1, 1, 1, 1,
0.328101, -0.272041, 2.121638, 1, 1, 1, 1, 1,
0.3283887, 0.04887117, 2.77399, 1, 1, 1, 1, 1,
0.3293157, -2.190703, 2.52616, 1, 1, 1, 1, 1,
0.3327458, 0.04318101, 2.706812, 1, 1, 1, 1, 1,
0.3363967, 1.443015, 0.8730146, 1, 1, 1, 1, 1,
0.3414859, -2.397209, 2.901385, 1, 1, 1, 1, 1,
0.3445597, 0.6956413, -0.4930513, 0, 0, 1, 1, 1,
0.3458276, -0.2749433, 1.554632, 1, 0, 0, 1, 1,
0.3464199, -0.08104634, 2.65207, 1, 0, 0, 1, 1,
0.3471403, 0.398677, 1.220767, 1, 0, 0, 1, 1,
0.3490917, 0.125475, 1.539597, 1, 0, 0, 1, 1,
0.3530405, 1.369299, 0.6835203, 1, 0, 0, 1, 1,
0.3574513, 0.2294614, 1.007075, 0, 0, 0, 1, 1,
0.3642611, -0.08900993, 2.321155, 0, 0, 0, 1, 1,
0.3659673, 0.3251131, -0.9460211, 0, 0, 0, 1, 1,
0.3679475, -0.04188073, 0.4925263, 0, 0, 0, 1, 1,
0.3701902, 0.3745445, -0.2212173, 0, 0, 0, 1, 1,
0.3773124, 0.8971689, -0.8763398, 0, 0, 0, 1, 1,
0.3808476, 0.3681993, 0.173694, 0, 0, 0, 1, 1,
0.3809979, -2.100707, 3.020334, 1, 1, 1, 1, 1,
0.3850545, -0.03142528, 3.648879, 1, 1, 1, 1, 1,
0.3854316, -0.532383, 2.427834, 1, 1, 1, 1, 1,
0.3866312, -0.4325697, 1.97535, 1, 1, 1, 1, 1,
0.3886791, 1.801218, -1.172031, 1, 1, 1, 1, 1,
0.3899573, -0.1546091, 2.031641, 1, 1, 1, 1, 1,
0.3913661, 0.4963548, -0.8044703, 1, 1, 1, 1, 1,
0.391465, 0.2687693, 1.074787, 1, 1, 1, 1, 1,
0.3922388, -0.06415071, 2.761592, 1, 1, 1, 1, 1,
0.3923557, -0.7605135, 2.686797, 1, 1, 1, 1, 1,
0.396502, -1.145573, 3.604955, 1, 1, 1, 1, 1,
0.3993979, -0.7871971, 5.956283, 1, 1, 1, 1, 1,
0.4042403, -1.016973, 2.06594, 1, 1, 1, 1, 1,
0.407011, -0.1504841, 0.396136, 1, 1, 1, 1, 1,
0.4103091, 0.4232343, -0.9241008, 1, 1, 1, 1, 1,
0.4128171, 1.887602, 0.955493, 0, 0, 1, 1, 1,
0.4157146, 0.8690814, 0.565069, 1, 0, 0, 1, 1,
0.4174715, -1.484562, 3.331015, 1, 0, 0, 1, 1,
0.4186474, 2.033603, -0.3908131, 1, 0, 0, 1, 1,
0.4187154, 0.08917083, 2.097177, 1, 0, 0, 1, 1,
0.4222689, -0.7501631, 1.338002, 1, 0, 0, 1, 1,
0.4248207, -1.21411, 3.716928, 0, 0, 0, 1, 1,
0.4374901, 0.4308824, 2.14358, 0, 0, 0, 1, 1,
0.4385409, 1.825814, -1.904787, 0, 0, 0, 1, 1,
0.4390152, 0.7970769, 0.6567475, 0, 0, 0, 1, 1,
0.4443845, -1.122113, 2.426887, 0, 0, 0, 1, 1,
0.447251, 0.6411754, 1.16538, 0, 0, 0, 1, 1,
0.4513289, -0.7340395, 1.041592, 0, 0, 0, 1, 1,
0.4534854, -0.2025844, 2.653147, 1, 1, 1, 1, 1,
0.4548113, 1.651588, 1.044641, 1, 1, 1, 1, 1,
0.4556841, 0.04937529, 0.5146707, 1, 1, 1, 1, 1,
0.4612115, 0.2534322, 1.806816, 1, 1, 1, 1, 1,
0.464314, -0.6452768, 2.432595, 1, 1, 1, 1, 1,
0.4719216, -0.1822388, 0.8789558, 1, 1, 1, 1, 1,
0.4753309, 1.595801, 1.620252, 1, 1, 1, 1, 1,
0.4823241, 0.1238628, 0.1928983, 1, 1, 1, 1, 1,
0.4827022, 0.3730685, 0.4924913, 1, 1, 1, 1, 1,
0.4860119, -0.1258666, 2.193616, 1, 1, 1, 1, 1,
0.4873084, -0.8203292, 2.528427, 1, 1, 1, 1, 1,
0.5000635, 1.484127, 0.5600187, 1, 1, 1, 1, 1,
0.5042809, 0.01260686, 0.4258482, 1, 1, 1, 1, 1,
0.5099995, 1.735309, 1.453833, 1, 1, 1, 1, 1,
0.5121858, 0.1505036, 2.645928, 1, 1, 1, 1, 1,
0.5129035, 0.1876142, 1.373779, 0, 0, 1, 1, 1,
0.5219475, 0.5215614, 0.8284097, 1, 0, 0, 1, 1,
0.5259115, -0.8359088, 3.214011, 1, 0, 0, 1, 1,
0.5263297, -0.2988471, 2.14906, 1, 0, 0, 1, 1,
0.5269789, 0.9407602, 0.9642103, 1, 0, 0, 1, 1,
0.5287966, -0.5780541, 1.96217, 1, 0, 0, 1, 1,
0.5295426, -0.6988939, 2.997558, 0, 0, 0, 1, 1,
0.5303461, 0.02808712, 0.5758705, 0, 0, 0, 1, 1,
0.5329772, 0.7851821, 1.833838, 0, 0, 0, 1, 1,
0.5395016, 0.6592666, 0.5314102, 0, 0, 0, 1, 1,
0.5417762, -1.097252, 2.694484, 0, 0, 0, 1, 1,
0.546678, -0.7423303, 2.413462, 0, 0, 0, 1, 1,
0.5509952, 1.22176, 1.090796, 0, 0, 0, 1, 1,
0.5610168, -1.902338, 2.906575, 1, 1, 1, 1, 1,
0.5625272, 0.453811, 2.496127, 1, 1, 1, 1, 1,
0.5625459, 0.8014567, -0.8044133, 1, 1, 1, 1, 1,
0.5635087, 0.1909405, 1.232205, 1, 1, 1, 1, 1,
0.5636572, 1.779646, 0.8121729, 1, 1, 1, 1, 1,
0.5672062, -1.274508, 3.684797, 1, 1, 1, 1, 1,
0.5744302, 0.3150805, 2.163844, 1, 1, 1, 1, 1,
0.5744554, 0.2878958, 1.777488, 1, 1, 1, 1, 1,
0.5775632, 1.15626, 1.214185, 1, 1, 1, 1, 1,
0.5776247, -1.117871, 2.751032, 1, 1, 1, 1, 1,
0.5827716, -1.522258, 0.6901628, 1, 1, 1, 1, 1,
0.5854018, -1.357535, 3.884622, 1, 1, 1, 1, 1,
0.5899628, -0.5928062, 1.566746, 1, 1, 1, 1, 1,
0.5900559, 0.9264954, 1.693074, 1, 1, 1, 1, 1,
0.5928138, -0.7544253, 2.356285, 1, 1, 1, 1, 1,
0.5944828, 1.03624, 0.5524614, 0, 0, 1, 1, 1,
0.600607, 0.7258561, 2.030674, 1, 0, 0, 1, 1,
0.604389, 0.185231, 0.9293919, 1, 0, 0, 1, 1,
0.6093376, -0.006725329, 0.3881917, 1, 0, 0, 1, 1,
0.6094487, 0.295042, 0.4105122, 1, 0, 0, 1, 1,
0.6102307, 0.9395273, 0.9033694, 1, 0, 0, 1, 1,
0.6157039, 0.1277004, 2.129143, 0, 0, 0, 1, 1,
0.6206941, 0.7480289, -0.006061255, 0, 0, 0, 1, 1,
0.6283343, 1.24128, -1.548883, 0, 0, 0, 1, 1,
0.6306565, -1.188507, 2.663124, 0, 0, 0, 1, 1,
0.6313868, 1.111981, 1.177255, 0, 0, 0, 1, 1,
0.6318613, -1.41323, 2.896562, 0, 0, 0, 1, 1,
0.6389931, -0.4432288, 3.429468, 0, 0, 0, 1, 1,
0.6412182, -0.09041147, 0.7755784, 1, 1, 1, 1, 1,
0.6431744, 0.6467102, 0.5615302, 1, 1, 1, 1, 1,
0.6441486, -1.064319, 3.378146, 1, 1, 1, 1, 1,
0.647009, -1.085832, 3.87169, 1, 1, 1, 1, 1,
0.6481382, 1.756645, -1.014289, 1, 1, 1, 1, 1,
0.6485732, -1.263963, 2.101116, 1, 1, 1, 1, 1,
0.6500436, -0.1131235, 3.130563, 1, 1, 1, 1, 1,
0.6569298, -0.1178525, 2.775015, 1, 1, 1, 1, 1,
0.6577193, -0.7887989, 1.812201, 1, 1, 1, 1, 1,
0.6581055, -0.381711, 3.31661, 1, 1, 1, 1, 1,
0.6634547, -0.7756422, 1.503032, 1, 1, 1, 1, 1,
0.6683855, -0.3661371, 2.03252, 1, 1, 1, 1, 1,
0.6715185, -0.8981968, 1.6415, 1, 1, 1, 1, 1,
0.6736631, -2.012223, 0.9922391, 1, 1, 1, 1, 1,
0.677605, -0.6008111, 0.5980641, 1, 1, 1, 1, 1,
0.6810518, -0.3446448, 2.233194, 0, 0, 1, 1, 1,
0.689431, 0.5270133, 0.7348895, 1, 0, 0, 1, 1,
0.691332, -1.774111, 4.652861, 1, 0, 0, 1, 1,
0.692531, -1.196978, 1.878436, 1, 0, 0, 1, 1,
0.6957811, 1.019513, 0.2954289, 1, 0, 0, 1, 1,
0.7028053, 0.8945791, 1.285866, 1, 0, 0, 1, 1,
0.710148, 0.6869402, 0.113777, 0, 0, 0, 1, 1,
0.7157254, -1.572532, 4.075017, 0, 0, 0, 1, 1,
0.7218966, 0.3488956, 2.31182, 0, 0, 0, 1, 1,
0.7224541, 0.287135, 2.030142, 0, 0, 0, 1, 1,
0.7248539, 0.9658062, -0.1166081, 0, 0, 0, 1, 1,
0.7290977, 0.5431715, 0.45933, 0, 0, 0, 1, 1,
0.7317806, -0.9526151, 3.737528, 0, 0, 0, 1, 1,
0.7318333, 0.4174169, 0.9048187, 1, 1, 1, 1, 1,
0.7336162, -0.1275192, 2.750575, 1, 1, 1, 1, 1,
0.7383698, 0.04577412, 2.235007, 1, 1, 1, 1, 1,
0.741398, -0.5948851, 1.61614, 1, 1, 1, 1, 1,
0.7434329, 0.01362361, 2.628175, 1, 1, 1, 1, 1,
0.7473897, -0.768263, 2.449232, 1, 1, 1, 1, 1,
0.7526175, -1.389826, 2.265703, 1, 1, 1, 1, 1,
0.7558506, 0.3766722, -0.4422941, 1, 1, 1, 1, 1,
0.7559052, 0.1440441, 1.152381, 1, 1, 1, 1, 1,
0.7576765, -0.9467816, 2.668266, 1, 1, 1, 1, 1,
0.7608325, 0.3509935, 0.4288464, 1, 1, 1, 1, 1,
0.7639644, 0.3626609, 0.8333721, 1, 1, 1, 1, 1,
0.7640091, -1.495246, 2.036902, 1, 1, 1, 1, 1,
0.7644503, 1.758653, -0.391421, 1, 1, 1, 1, 1,
0.7662421, 1.678757, 2.781482, 1, 1, 1, 1, 1,
0.7701773, 0.8534988, 1.839564, 0, 0, 1, 1, 1,
0.773803, -0.1240604, 2.126366, 1, 0, 0, 1, 1,
0.7740745, -0.3345366, 1.566105, 1, 0, 0, 1, 1,
0.7774697, -0.3932463, 3.803276, 1, 0, 0, 1, 1,
0.7780485, -0.7578253, 0.4614202, 1, 0, 0, 1, 1,
0.7882445, -0.14673, 1.801598, 1, 0, 0, 1, 1,
0.7915133, -0.1382074, 1.368816, 0, 0, 0, 1, 1,
0.7926011, -0.3582692, 2.650248, 0, 0, 0, 1, 1,
0.7952729, 0.5719428, -0.008665106, 0, 0, 0, 1, 1,
0.7964835, 0.7902229, -0.1754956, 0, 0, 0, 1, 1,
0.7968792, 1.139061, 1.052439, 0, 0, 0, 1, 1,
0.7979163, -1.067471, 3.029366, 0, 0, 0, 1, 1,
0.8047177, 0.6581833, 1.969092, 0, 0, 0, 1, 1,
0.8066035, 0.6295317, 0.935128, 1, 1, 1, 1, 1,
0.8101213, -0.851483, 4.691893, 1, 1, 1, 1, 1,
0.8114238, 0.104827, 1.043035, 1, 1, 1, 1, 1,
0.8190598, -0.2230046, 1.026738, 1, 1, 1, 1, 1,
0.8273245, 2.28536, -0.6068321, 1, 1, 1, 1, 1,
0.8275795, 0.4350617, 1.005674, 1, 1, 1, 1, 1,
0.8278527, -1.34586, 2.505994, 1, 1, 1, 1, 1,
0.8298841, -1.320618, 2.993919, 1, 1, 1, 1, 1,
0.8313055, 0.7854954, 1.870026, 1, 1, 1, 1, 1,
0.8315195, -1.519663, 1.827091, 1, 1, 1, 1, 1,
0.8325341, -0.2659805, 1.990487, 1, 1, 1, 1, 1,
0.834248, -0.1657665, 0.01748123, 1, 1, 1, 1, 1,
0.8442041, -0.5359129, 2.232619, 1, 1, 1, 1, 1,
0.8445795, 1.071503, 0.503639, 1, 1, 1, 1, 1,
0.8459018, 2.20686, 0.2058794, 1, 1, 1, 1, 1,
0.847184, -0.6027601, 1.847738, 0, 0, 1, 1, 1,
0.8474079, -0.4071325, 2.189737, 1, 0, 0, 1, 1,
0.8527024, -0.1433082, 2.811246, 1, 0, 0, 1, 1,
0.8564695, -0.8732499, 3.146369, 1, 0, 0, 1, 1,
0.8649015, 0.6547641, 1.587997, 1, 0, 0, 1, 1,
0.8728408, 1.360607, -1.905348, 1, 0, 0, 1, 1,
0.8730985, -0.534338, 2.944801, 0, 0, 0, 1, 1,
0.8732747, -0.1524452, -0.3893918, 0, 0, 0, 1, 1,
0.8786364, -2.50481, 3.891162, 0, 0, 0, 1, 1,
0.8797964, 0.2717613, 2.628978, 0, 0, 0, 1, 1,
0.8872699, 0.7280082, 0.4059909, 0, 0, 0, 1, 1,
0.8896199, 0.8448069, 2.318821, 0, 0, 0, 1, 1,
0.8910582, -0.004246631, 2.510408, 0, 0, 0, 1, 1,
0.8910972, 2.981427, 0.5555906, 1, 1, 1, 1, 1,
0.8924559, 2.523418, -0.07276099, 1, 1, 1, 1, 1,
0.8970178, -0.9887857, 2.135425, 1, 1, 1, 1, 1,
0.904646, -1.163112, 2.355801, 1, 1, 1, 1, 1,
0.9055772, 1.146372, 1.47451, 1, 1, 1, 1, 1,
0.9067127, 0.4015402, 3.393857, 1, 1, 1, 1, 1,
0.9119329, -1.249684, 1.923445, 1, 1, 1, 1, 1,
0.9150665, -1.075715, 3.57478, 1, 1, 1, 1, 1,
0.9380346, 0.4959539, 1.954205, 1, 1, 1, 1, 1,
0.938907, 1.473437, -1.856141, 1, 1, 1, 1, 1,
0.9394328, -0.9292752, 2.722664, 1, 1, 1, 1, 1,
0.9398944, -1.847866, 2.824104, 1, 1, 1, 1, 1,
0.9403345, -0.5003806, 0.8416498, 1, 1, 1, 1, 1,
0.9406975, 0.09018925, 3.261427, 1, 1, 1, 1, 1,
0.9462548, -0.1872843, 0.7419444, 1, 1, 1, 1, 1,
0.9487826, 1.071198, 2.034338, 0, 0, 1, 1, 1,
0.9488454, -1.454026, 1.599199, 1, 0, 0, 1, 1,
0.9506995, 0.9824648, 0.2810429, 1, 0, 0, 1, 1,
0.950817, -0.6705437, 0.9933763, 1, 0, 0, 1, 1,
0.9547877, 1.477014, 2.055265, 1, 0, 0, 1, 1,
0.9601191, -2.376229, 4.349687, 1, 0, 0, 1, 1,
0.9632506, -0.5292118, 2.206748, 0, 0, 0, 1, 1,
0.9675725, 1.454996, 0.5667651, 0, 0, 0, 1, 1,
0.9740393, 0.6182901, 1.638091, 0, 0, 0, 1, 1,
0.9750006, 0.3225637, 2.055082, 0, 0, 0, 1, 1,
0.975274, -0.911684, 1.33936, 0, 0, 0, 1, 1,
0.9759753, -1.844251, 2.203763, 0, 0, 0, 1, 1,
0.9776042, 0.7523515, 2.196854, 0, 0, 0, 1, 1,
0.9794486, -0.1402748, 1.750398, 1, 1, 1, 1, 1,
0.9843465, 1.675388, 0.9165791, 1, 1, 1, 1, 1,
0.9850711, -1.01509, 1.519852, 1, 1, 1, 1, 1,
0.9945894, 2.305586, 0.8745148, 1, 1, 1, 1, 1,
0.9953724, 0.5675194, 0.4993026, 1, 1, 1, 1, 1,
0.9959703, -0.206915, 1.842956, 1, 1, 1, 1, 1,
1.008139, -1.106845, 3.977216, 1, 1, 1, 1, 1,
1.01174, -0.8419415, 3.37791, 1, 1, 1, 1, 1,
1.021283, -0.1647738, 3.085034, 1, 1, 1, 1, 1,
1.022304, 0.9998994, 0.02350559, 1, 1, 1, 1, 1,
1.026508, -0.7554832, 0.7583201, 1, 1, 1, 1, 1,
1.037428, 1.154089, 0.1564848, 1, 1, 1, 1, 1,
1.038476, 1.455085, -1.375123, 1, 1, 1, 1, 1,
1.039786, 1.674658, 1.712684, 1, 1, 1, 1, 1,
1.041693, 1.829843, 0.02852891, 1, 1, 1, 1, 1,
1.044069, -1.069389, 3.765246, 0, 0, 1, 1, 1,
1.05027, -0.19655, 1.035339, 1, 0, 0, 1, 1,
1.053791, -0.9733551, 3.772846, 1, 0, 0, 1, 1,
1.056073, 0.6175737, 1.783246, 1, 0, 0, 1, 1,
1.0619, -0.8228889, 1.292135, 1, 0, 0, 1, 1,
1.077112, 0.5355299, 1.437564, 1, 0, 0, 1, 1,
1.08896, -0.7472648, 2.148966, 0, 0, 0, 1, 1,
1.089956, 2.142938, -0.7911379, 0, 0, 0, 1, 1,
1.089978, 0.2630866, 2.541868, 0, 0, 0, 1, 1,
1.094648, 0.1673163, 0.9596068, 0, 0, 0, 1, 1,
1.108202, 0.5281199, 1.771948, 0, 0, 0, 1, 1,
1.118817, 1.987488, 1.212601, 0, 0, 0, 1, 1,
1.126741, -0.3035324, 2.562472, 0, 0, 0, 1, 1,
1.126826, -0.7801901, 1.98846, 1, 1, 1, 1, 1,
1.127459, 0.8145973, 1.699381, 1, 1, 1, 1, 1,
1.145295, 0.01504498, 0.5643121, 1, 1, 1, 1, 1,
1.146397, 0.8226175, 1.664443, 1, 1, 1, 1, 1,
1.149897, -1.423168, 1.159382, 1, 1, 1, 1, 1,
1.162703, -0.5687397, 1.610546, 1, 1, 1, 1, 1,
1.165288, 1.805406, 0.756079, 1, 1, 1, 1, 1,
1.173651, -0.6154576, 4.110444, 1, 1, 1, 1, 1,
1.175992, 1.888511, 0.3281487, 1, 1, 1, 1, 1,
1.176318, -0.9299213, 2.273539, 1, 1, 1, 1, 1,
1.180432, -0.7568375, 1.154517, 1, 1, 1, 1, 1,
1.181437, -1.289646, 2.754746, 1, 1, 1, 1, 1,
1.190599, -1.295099, 2.27433, 1, 1, 1, 1, 1,
1.192882, 1.129334, 0.02756065, 1, 1, 1, 1, 1,
1.195707, 1.41513, 1.317889, 1, 1, 1, 1, 1,
1.201222, -1.272738, 3.639498, 0, 0, 1, 1, 1,
1.220563, 0.4926469, 1.391638, 1, 0, 0, 1, 1,
1.237478, 0.04670059, 2.829902, 1, 0, 0, 1, 1,
1.24807, -0.9786305, 1.931162, 1, 0, 0, 1, 1,
1.258832, -0.6247438, 2.754278, 1, 0, 0, 1, 1,
1.276784, -0.3175946, 3.069575, 1, 0, 0, 1, 1,
1.277832, 0.08149052, 1.126062, 0, 0, 0, 1, 1,
1.286199, 0.0306889, 0.8692871, 0, 0, 0, 1, 1,
1.289107, 1.855247, 2.097354, 0, 0, 0, 1, 1,
1.289546, 0.04100962, 1.160107, 0, 0, 0, 1, 1,
1.297142, 0.8859926, 0.840427, 0, 0, 0, 1, 1,
1.300008, 0.02960425, 1.091553, 0, 0, 0, 1, 1,
1.309492, -0.5941667, 2.104888, 0, 0, 0, 1, 1,
1.312006, 0.5805355, 1.352728, 1, 1, 1, 1, 1,
1.34588, 0.7806381, 0.1566077, 1, 1, 1, 1, 1,
1.354781, -0.1613346, 1.140575, 1, 1, 1, 1, 1,
1.356343, 1.141085, 1.702303, 1, 1, 1, 1, 1,
1.358902, -0.7694591, 4.062215, 1, 1, 1, 1, 1,
1.364875, 1.30691, 0.4073792, 1, 1, 1, 1, 1,
1.383688, -0.3776373, 0.9188839, 1, 1, 1, 1, 1,
1.385402, 1.545992, 0.7102062, 1, 1, 1, 1, 1,
1.386257, -0.4803866, 2.80701, 1, 1, 1, 1, 1,
1.403475, -1.2089, 1.184507, 1, 1, 1, 1, 1,
1.406694, -0.1677964, 0.9682876, 1, 1, 1, 1, 1,
1.414124, -1.621088, 3.301704, 1, 1, 1, 1, 1,
1.417472, 1.789506, 2.036371, 1, 1, 1, 1, 1,
1.447192, 0.4846866, 0.0562696, 1, 1, 1, 1, 1,
1.453473, 0.7537912, 0.4736267, 1, 1, 1, 1, 1,
1.459356, 0.8603947, -0.473952, 0, 0, 1, 1, 1,
1.470718, 0.02889492, 1.211211, 1, 0, 0, 1, 1,
1.488546, 0.3598001, 1.462611, 1, 0, 0, 1, 1,
1.492082, 1.216177, 0.1252002, 1, 0, 0, 1, 1,
1.497463, 0.7417238, 1.987203, 1, 0, 0, 1, 1,
1.521985, 0.4302765, 0.3120329, 1, 0, 0, 1, 1,
1.537044, 1.071138, 3.83158, 0, 0, 0, 1, 1,
1.563582, -1.367188, 0.5968444, 0, 0, 0, 1, 1,
1.564161, -0.8886178, 2.426236, 0, 0, 0, 1, 1,
1.564724, -0.3342291, 2.56085, 0, 0, 0, 1, 1,
1.571501, 0.3396831, 0.6113884, 0, 0, 0, 1, 1,
1.57246, -0.1604164, 0.2863603, 0, 0, 0, 1, 1,
1.583329, -1.026161, 1.053471, 0, 0, 0, 1, 1,
1.585001, 0.4113836, 0.1286869, 1, 1, 1, 1, 1,
1.590438, -1.696929, 4.759547, 1, 1, 1, 1, 1,
1.607961, 0.1105047, 0.6501639, 1, 1, 1, 1, 1,
1.625225, -1.21947, 2.450163, 1, 1, 1, 1, 1,
1.627095, -0.6171984, 3.451693, 1, 1, 1, 1, 1,
1.640651, 0.8437567, 1.607941, 1, 1, 1, 1, 1,
1.643882, 0.8310883, 0.2032889, 1, 1, 1, 1, 1,
1.661401, 0.1927036, 1.916899, 1, 1, 1, 1, 1,
1.663377, 0.1887779, 0.7443206, 1, 1, 1, 1, 1,
1.676175, 0.3805939, 1.180829, 1, 1, 1, 1, 1,
1.676483, 0.8731938, 0.1188755, 1, 1, 1, 1, 1,
1.681573, -1.613908, 4.027519, 1, 1, 1, 1, 1,
1.687886, 0.8490648, 2.507324, 1, 1, 1, 1, 1,
1.696371, -0.8625236, 2.513296, 1, 1, 1, 1, 1,
1.699719, -1.696685, 2.377043, 1, 1, 1, 1, 1,
1.704855, 1.594145, 0.3467407, 0, 0, 1, 1, 1,
1.717682, 0.06357936, 0.3568739, 1, 0, 0, 1, 1,
1.724843, -0.9222006, 3.661973, 1, 0, 0, 1, 1,
1.734873, 0.2068633, 2.821436, 1, 0, 0, 1, 1,
1.745099, 0.498322, 3.137673, 1, 0, 0, 1, 1,
1.752773, 0.2898516, 0.7894437, 1, 0, 0, 1, 1,
1.770481, -0.03349268, 0.5652499, 0, 0, 0, 1, 1,
1.775869, 0.6581768, 1.756487, 0, 0, 0, 1, 1,
1.788572, -0.4829863, 1.392741, 0, 0, 0, 1, 1,
1.791568, 0.4288448, 0.3766533, 0, 0, 0, 1, 1,
1.801585, 0.6697165, 0.423812, 0, 0, 0, 1, 1,
1.805827, 0.06169592, 0.7287146, 0, 0, 0, 1, 1,
1.824591, 0.1722407, 0.3692923, 0, 0, 0, 1, 1,
1.861508, 0.3665276, 2.250762, 1, 1, 1, 1, 1,
1.882728, 1.298192, 0.3957785, 1, 1, 1, 1, 1,
1.888174, 1.079482, 1.382503, 1, 1, 1, 1, 1,
1.908363, -0.9588445, 1.836323, 1, 1, 1, 1, 1,
1.939078, 0.08225575, 2.379467, 1, 1, 1, 1, 1,
1.956239, -1.233908, 1.851022, 1, 1, 1, 1, 1,
1.962453, 0.352403, 0.7948574, 1, 1, 1, 1, 1,
1.996598, 1.727017, 1.219113, 1, 1, 1, 1, 1,
2.01221, 0.329845, -0.04576983, 1, 1, 1, 1, 1,
2.013123, 2.431342, 1.306747, 1, 1, 1, 1, 1,
2.019538, -0.03905079, 3.421743, 1, 1, 1, 1, 1,
2.02676, 1.181082, 0.9601303, 1, 1, 1, 1, 1,
2.033218, 1.201642, 3.044555, 1, 1, 1, 1, 1,
2.034923, -0.3076612, 4.707753, 1, 1, 1, 1, 1,
2.044298, 0.3419199, 0.2426805, 1, 1, 1, 1, 1,
2.048287, 0.6736913, 4.263026, 0, 0, 1, 1, 1,
2.052406, 0.06437618, 0.6077013, 1, 0, 0, 1, 1,
2.083511, 1.256551, -0.6705998, 1, 0, 0, 1, 1,
2.104816, 1.050182, 0.6634379, 1, 0, 0, 1, 1,
2.116014, -2.219956, 2.611024, 1, 0, 0, 1, 1,
2.124089, 0.9773105, -0.5205664, 1, 0, 0, 1, 1,
2.150057, 1.248771, -0.5724259, 0, 0, 0, 1, 1,
2.202126, 0.05061367, 0.4997886, 0, 0, 0, 1, 1,
2.206061, 0.4994618, 1.951148, 0, 0, 0, 1, 1,
2.219353, -2.441125, 2.868068, 0, 0, 0, 1, 1,
2.242892, -2.158658, 2.636755, 0, 0, 0, 1, 1,
2.250272, 0.2747273, 2.324682, 0, 0, 0, 1, 1,
2.258861, -0.3558737, 1.067691, 0, 0, 0, 1, 1,
2.435308, 1.274781, 1.860993, 1, 1, 1, 1, 1,
2.489065, -0.6913708, 1.931893, 1, 1, 1, 1, 1,
2.613144, -0.4819275, -0.588262, 1, 1, 1, 1, 1,
2.704121, 0.2518298, 3.307831, 1, 1, 1, 1, 1,
2.741373, 0.2181344, 1.431964, 1, 1, 1, 1, 1,
2.813482, 0.4038756, 0.6021288, 1, 1, 1, 1, 1,
2.884268, 2.231942, 2.099773, 1, 1, 1, 1, 1
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
var radius = 9.528713;
var distance = 33.4692;
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
mvMatrix.translate( 0.1118151, 0.2102071, -0.5142453 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4692);
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