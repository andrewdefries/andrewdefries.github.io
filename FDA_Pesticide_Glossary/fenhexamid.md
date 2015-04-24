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
-2.69241, 0.03376481, -0.696959, 1, 0, 0, 1,
-2.580667, -0.1594155, -5.778105, 1, 0.007843138, 0, 1,
-2.528916, -2.632572, -1.566924, 1, 0.01176471, 0, 1,
-2.43673, -0.4057502, -0.6736677, 1, 0.01960784, 0, 1,
-2.431948, 0.5980009, -1.612495, 1, 0.02352941, 0, 1,
-2.416492, 0.4823584, -1.600612, 1, 0.03137255, 0, 1,
-2.315897, 0.8431441, -2.288531, 1, 0.03529412, 0, 1,
-2.290462, -0.1682453, -1.343741, 1, 0.04313726, 0, 1,
-2.290345, 0.3530306, -1.138038, 1, 0.04705882, 0, 1,
-2.267295, -0.3108903, -1.717531, 1, 0.05490196, 0, 1,
-2.246558, -0.3468472, -0.7124706, 1, 0.05882353, 0, 1,
-2.090712, -1.929369, -3.367382, 1, 0.06666667, 0, 1,
-2.024388, 0.3250293, -1.362095, 1, 0.07058824, 0, 1,
-2.018697, 0.6095906, -0.8524595, 1, 0.07843138, 0, 1,
-2.012176, 1.33994, -2.059217, 1, 0.08235294, 0, 1,
-1.981765, -0.4922786, -0.533419, 1, 0.09019608, 0, 1,
-1.979307, 0.8964222, -1.051005, 1, 0.09411765, 0, 1,
-1.954538, -0.6622679, -2.619533, 1, 0.1019608, 0, 1,
-1.947342, -1.32042, -1.471726, 1, 0.1098039, 0, 1,
-1.943322, 0.1408389, -2.638189, 1, 0.1137255, 0, 1,
-1.928938, 1.128073, -1.514759, 1, 0.1215686, 0, 1,
-1.926124, 0.3054264, -2.31772, 1, 0.1254902, 0, 1,
-1.919683, 0.5571358, 0.07206742, 1, 0.1333333, 0, 1,
-1.899934, 1.710376, -1.673887, 1, 0.1372549, 0, 1,
-1.881163, 0.2534952, -1.357229, 1, 0.145098, 0, 1,
-1.863818, 0.07737301, -2.897072, 1, 0.1490196, 0, 1,
-1.854611, -2.111876, -1.864445, 1, 0.1568628, 0, 1,
-1.84585, -0.06284019, -3.487994, 1, 0.1607843, 0, 1,
-1.832494, 1.242981, -1.77126, 1, 0.1686275, 0, 1,
-1.80527, -0.3418978, -0.9983938, 1, 0.172549, 0, 1,
-1.78033, 0.5295393, -1.86527, 1, 0.1803922, 0, 1,
-1.774869, 1.306571, -2.468959, 1, 0.1843137, 0, 1,
-1.769355, -0.03363908, -0.8550329, 1, 0.1921569, 0, 1,
-1.764181, -0.3257921, -0.8761103, 1, 0.1960784, 0, 1,
-1.742256, 1.596638, -1.735813, 1, 0.2039216, 0, 1,
-1.738931, -0.8885891, -1.263772, 1, 0.2117647, 0, 1,
-1.7386, 0.6042657, -0.5701393, 1, 0.2156863, 0, 1,
-1.710789, -1.726894, -2.809722, 1, 0.2235294, 0, 1,
-1.709025, 0.1331689, -2.448681, 1, 0.227451, 0, 1,
-1.707645, 0.6035081, -2.192691, 1, 0.2352941, 0, 1,
-1.706396, 0.04346411, -2.655427, 1, 0.2392157, 0, 1,
-1.680811, 1.756632, -0.9791924, 1, 0.2470588, 0, 1,
-1.659475, -1.134229, -1.513903, 1, 0.2509804, 0, 1,
-1.615628, 1.129697, -2.134716, 1, 0.2588235, 0, 1,
-1.598092, -0.3526833, -2.826162, 1, 0.2627451, 0, 1,
-1.591915, -1.712613, -2.742664, 1, 0.2705882, 0, 1,
-1.570656, -1.188673, -1.28859, 1, 0.2745098, 0, 1,
-1.544262, 0.669903, -0.5571315, 1, 0.282353, 0, 1,
-1.53427, -1.193101, -3.272502, 1, 0.2862745, 0, 1,
-1.511387, -1.312467, -2.612583, 1, 0.2941177, 0, 1,
-1.509702, 1.551488, -0.467374, 1, 0.3019608, 0, 1,
-1.503604, -0.8919398, -3.314836, 1, 0.3058824, 0, 1,
-1.489801, 0.2034019, -0.7569501, 1, 0.3137255, 0, 1,
-1.483465, -0.332752, -0.09309258, 1, 0.3176471, 0, 1,
-1.455534, -0.5471148, -0.3899182, 1, 0.3254902, 0, 1,
-1.454776, 0.366208, -0.5437552, 1, 0.3294118, 0, 1,
-1.45157, 0.2919803, -1.104001, 1, 0.3372549, 0, 1,
-1.44934, -0.5051636, -2.170954, 1, 0.3411765, 0, 1,
-1.433619, 2.068657, -0.9421464, 1, 0.3490196, 0, 1,
-1.42653, 0.08011144, -1.646054, 1, 0.3529412, 0, 1,
-1.41139, -1.420653, -3.141016, 1, 0.3607843, 0, 1,
-1.39289, -2.393584, -0.03618393, 1, 0.3647059, 0, 1,
-1.391469, -0.5863358, -3.350266, 1, 0.372549, 0, 1,
-1.385897, 0.9737102, -2.351071, 1, 0.3764706, 0, 1,
-1.381947, 0.490592, -1.333053, 1, 0.3843137, 0, 1,
-1.374208, -0.4477934, -2.554073, 1, 0.3882353, 0, 1,
-1.36053, 0.5964513, -1.327281, 1, 0.3960784, 0, 1,
-1.35116, -1.162981, -2.443052, 1, 0.4039216, 0, 1,
-1.346572, 2.516428, -0.6119804, 1, 0.4078431, 0, 1,
-1.340539, 2.496692, -0.1160452, 1, 0.4156863, 0, 1,
-1.340356, -0.05613415, 0.1892096, 1, 0.4196078, 0, 1,
-1.332294, -0.9526388, -2.379238, 1, 0.427451, 0, 1,
-1.323928, -0.2232859, -1.100371, 1, 0.4313726, 0, 1,
-1.32167, -0.6179491, -1.803249, 1, 0.4392157, 0, 1,
-1.30907, -1.318829, -3.000348, 1, 0.4431373, 0, 1,
-1.300077, -1.144603, -2.864953, 1, 0.4509804, 0, 1,
-1.291267, 2.332518, 0.4431152, 1, 0.454902, 0, 1,
-1.286837, 1.248079, 0.8135183, 1, 0.4627451, 0, 1,
-1.279222, 0.1307447, 0.9339933, 1, 0.4666667, 0, 1,
-1.278688, -2.636266, -2.345482, 1, 0.4745098, 0, 1,
-1.272774, -1.326761, -1.648396, 1, 0.4784314, 0, 1,
-1.266933, -1.042492, -0.7895214, 1, 0.4862745, 0, 1,
-1.265201, 1.953655, -0.6469778, 1, 0.4901961, 0, 1,
-1.256012, 1.292732, 0.2564074, 1, 0.4980392, 0, 1,
-1.246419, -0.8783942, -1.918867, 1, 0.5058824, 0, 1,
-1.24186, 0.0436236, -0.8091443, 1, 0.509804, 0, 1,
-1.241244, 0.79223, -1.09183, 1, 0.5176471, 0, 1,
-1.236266, -1.436038, -3.860053, 1, 0.5215687, 0, 1,
-1.236038, 0.1407862, -2.535354, 1, 0.5294118, 0, 1,
-1.221903, -0.1618585, -0.9550033, 1, 0.5333334, 0, 1,
-1.216434, 0.6702241, -1.260064, 1, 0.5411765, 0, 1,
-1.205792, 0.2322742, -3.787551, 1, 0.5450981, 0, 1,
-1.202821, -1.377088, -2.852218, 1, 0.5529412, 0, 1,
-1.197361, -0.2387363, -0.6859051, 1, 0.5568628, 0, 1,
-1.196904, -0.7820424, -3.421491, 1, 0.5647059, 0, 1,
-1.185102, -0.3690445, -2.967854, 1, 0.5686275, 0, 1,
-1.180016, 1.690904, 1.718692, 1, 0.5764706, 0, 1,
-1.173139, -1.148052, -1.830914, 1, 0.5803922, 0, 1,
-1.169873, -1.831764, -1.961374, 1, 0.5882353, 0, 1,
-1.168902, -1.884413, -2.861304, 1, 0.5921569, 0, 1,
-1.166848, 1.042539, -0.7904729, 1, 0.6, 0, 1,
-1.161536, -1.122431, -2.267655, 1, 0.6078432, 0, 1,
-1.152483, -0.8857927, -1.957313, 1, 0.6117647, 0, 1,
-1.142761, -0.200119, 1.059165, 1, 0.6196079, 0, 1,
-1.140189, 0.07035425, 0.09883711, 1, 0.6235294, 0, 1,
-1.137414, -0.5803668, -1.515845, 1, 0.6313726, 0, 1,
-1.136018, -1.151741, -2.596704, 1, 0.6352941, 0, 1,
-1.135675, 1.471779, -1.739106, 1, 0.6431373, 0, 1,
-1.134184, -0.01370494, -1.753239, 1, 0.6470588, 0, 1,
-1.12906, 1.014322, -1.87125, 1, 0.654902, 0, 1,
-1.129031, 0.2023739, -1.415284, 1, 0.6588235, 0, 1,
-1.128595, 0.9052877, -1.609782, 1, 0.6666667, 0, 1,
-1.123365, 1.871692, -1.836289, 1, 0.6705883, 0, 1,
-1.117242, -0.1515861, -1.177404, 1, 0.6784314, 0, 1,
-1.115905, 0.7633314, 0.1258102, 1, 0.682353, 0, 1,
-1.113868, -0.6444191, -2.825642, 1, 0.6901961, 0, 1,
-1.110745, 0.6525109, -1.906156, 1, 0.6941177, 0, 1,
-1.107876, 0.3742505, -1.319372, 1, 0.7019608, 0, 1,
-1.107622, -0.7910874, -2.257975, 1, 0.7098039, 0, 1,
-1.107418, 0.7481532, 0.2546011, 1, 0.7137255, 0, 1,
-1.103022, -0.8709334, -3.008673, 1, 0.7215686, 0, 1,
-1.102407, 0.3476402, -0.7119611, 1, 0.7254902, 0, 1,
-1.093454, -0.361027, -0.3619951, 1, 0.7333333, 0, 1,
-1.092473, 1.912678, 1.007976, 1, 0.7372549, 0, 1,
-1.08957, -1.193946, -2.511235, 1, 0.7450981, 0, 1,
-1.081799, 0.5318921, -2.081878, 1, 0.7490196, 0, 1,
-1.074076, -0.2223171, -2.787307, 1, 0.7568628, 0, 1,
-1.073945, 0.08725429, -1.510414, 1, 0.7607843, 0, 1,
-1.070021, -0.9549421, -1.468761, 1, 0.7686275, 0, 1,
-1.066085, 0.699979, -0.9975271, 1, 0.772549, 0, 1,
-1.063791, 1.623855, 0.8115067, 1, 0.7803922, 0, 1,
-1.058384, 0.4516966, -0.9148424, 1, 0.7843137, 0, 1,
-1.056696, 0.1063194, -0.5991827, 1, 0.7921569, 0, 1,
-1.048245, -0.3870951, 0.6634243, 1, 0.7960784, 0, 1,
-1.046302, -0.7431026, -4.099225, 1, 0.8039216, 0, 1,
-1.039021, -0.312899, -1.047994, 1, 0.8117647, 0, 1,
-1.03853, -0.7120416, -1.82483, 1, 0.8156863, 0, 1,
-1.035816, 0.8256614, -1.692541, 1, 0.8235294, 0, 1,
-1.03427, 0.6189039, -1.196059, 1, 0.827451, 0, 1,
-1.028311, -0.3606369, -1.103782, 1, 0.8352941, 0, 1,
-1.019902, -0.4005231, -1.394118, 1, 0.8392157, 0, 1,
-1.012321, 0.925339, -1.096885, 1, 0.8470588, 0, 1,
-1.007498, -0.8815423, -1.699495, 1, 0.8509804, 0, 1,
-1.006837, 2.42065, -1.935766, 1, 0.8588235, 0, 1,
-1.004643, -0.02737886, -1.282407, 1, 0.8627451, 0, 1,
-1.002583, -0.8461615, -1.586584, 1, 0.8705882, 0, 1,
-0.9990005, 0.6128742, 0.2536812, 1, 0.8745098, 0, 1,
-0.9925425, 0.2200932, -1.332613, 1, 0.8823529, 0, 1,
-0.9858627, 0.8047807, 0.4560987, 1, 0.8862745, 0, 1,
-0.9846561, -0.2704069, -0.4266339, 1, 0.8941177, 0, 1,
-0.9825763, -0.2573366, -1.948173, 1, 0.8980392, 0, 1,
-0.9824226, 0.9273341, 1.742316, 1, 0.9058824, 0, 1,
-0.9734604, 0.316195, -1.215241, 1, 0.9137255, 0, 1,
-0.9681883, 1.978788, -1.144874, 1, 0.9176471, 0, 1,
-0.9609606, -0.4737371, -2.787562, 1, 0.9254902, 0, 1,
-0.9483096, -2.464502, -2.248173, 1, 0.9294118, 0, 1,
-0.9449053, 1.331063, 1.570889, 1, 0.9372549, 0, 1,
-0.9410177, -0.1664974, -1.265211, 1, 0.9411765, 0, 1,
-0.9406657, 0.4952829, -1.55566, 1, 0.9490196, 0, 1,
-0.9393728, 0.8527084, -2.270844, 1, 0.9529412, 0, 1,
-0.9328411, 0.6241987, -1.217496, 1, 0.9607843, 0, 1,
-0.9277832, 1.329886, 0.9488094, 1, 0.9647059, 0, 1,
-0.924218, -0.3911758, -2.967498, 1, 0.972549, 0, 1,
-0.9213707, -1.065317, -1.957641, 1, 0.9764706, 0, 1,
-0.9119952, -0.3114163, -1.175293, 1, 0.9843137, 0, 1,
-0.9118035, 0.2346665, -1.264301, 1, 0.9882353, 0, 1,
-0.9112146, 1.276945, -1.73146, 1, 0.9960784, 0, 1,
-0.909707, -0.3610191, -0.8481307, 0.9960784, 1, 0, 1,
-0.9061234, -0.02978104, -1.687418, 0.9921569, 1, 0, 1,
-0.8915948, -0.7004169, -2.530635, 0.9843137, 1, 0, 1,
-0.8881016, -0.3897938, -1.20746, 0.9803922, 1, 0, 1,
-0.8856315, -0.8827114, -3.082249, 0.972549, 1, 0, 1,
-0.8740765, -2.007107, -2.499285, 0.9686275, 1, 0, 1,
-0.8721508, 0.8900985, -0.4938942, 0.9607843, 1, 0, 1,
-0.8696337, 1.246973, -1.463392, 0.9568627, 1, 0, 1,
-0.8695915, 0.009627464, -1.99237, 0.9490196, 1, 0, 1,
-0.867917, 0.549765, 0.8646196, 0.945098, 1, 0, 1,
-0.8672143, 0.9558069, -0.9809992, 0.9372549, 1, 0, 1,
-0.8660339, 1.311659, -1.342259, 0.9333333, 1, 0, 1,
-0.8600101, 1.356762, -2.175177, 0.9254902, 1, 0, 1,
-0.85348, -0.108097, -1.07776, 0.9215686, 1, 0, 1,
-0.8513066, -0.2012658, -1.287333, 0.9137255, 1, 0, 1,
-0.8449351, -1.301857, -1.694156, 0.9098039, 1, 0, 1,
-0.8422912, -0.3318349, -1.893201, 0.9019608, 1, 0, 1,
-0.8407359, -1.565245, -1.870489, 0.8941177, 1, 0, 1,
-0.8403559, 0.3447575, -1.038347, 0.8901961, 1, 0, 1,
-0.8380793, 0.6738104, 0.631349, 0.8823529, 1, 0, 1,
-0.8277401, -0.8214475, -2.499068, 0.8784314, 1, 0, 1,
-0.8256378, -1.066856, -1.702742, 0.8705882, 1, 0, 1,
-0.8253981, 1.481763, -1.741084, 0.8666667, 1, 0, 1,
-0.820704, -0.5043069, -2.387709, 0.8588235, 1, 0, 1,
-0.8160706, 0.07612482, -0.7953752, 0.854902, 1, 0, 1,
-0.8139259, -0.1811862, -1.806134, 0.8470588, 1, 0, 1,
-0.8129537, -0.2679, -0.8409808, 0.8431373, 1, 0, 1,
-0.812499, -0.7095168, -0.4414646, 0.8352941, 1, 0, 1,
-0.8111454, 0.8552257, -1.146948, 0.8313726, 1, 0, 1,
-0.8033476, -0.9238832, -2.552162, 0.8235294, 1, 0, 1,
-0.8018765, -2.09584, -3.072754, 0.8196079, 1, 0, 1,
-0.8003449, -0.2299924, -1.206632, 0.8117647, 1, 0, 1,
-0.7972876, -0.8788999, -2.270183, 0.8078431, 1, 0, 1,
-0.7959251, 0.04939461, 0.01217979, 0.8, 1, 0, 1,
-0.7908866, 0.4432664, -0.2332274, 0.7921569, 1, 0, 1,
-0.78479, -0.5625951, -3.739979, 0.7882353, 1, 0, 1,
-0.7781341, -0.7421223, -2.427168, 0.7803922, 1, 0, 1,
-0.7770755, 0.5192381, 1.212136, 0.7764706, 1, 0, 1,
-0.7680453, 1.659261, -0.9769444, 0.7686275, 1, 0, 1,
-0.7653667, 1.056329, 0.1584248, 0.7647059, 1, 0, 1,
-0.7646019, -0.5064049, -3.359533, 0.7568628, 1, 0, 1,
-0.7615768, 0.5695984, 0.5140111, 0.7529412, 1, 0, 1,
-0.7607118, -0.7063088, -1.509748, 0.7450981, 1, 0, 1,
-0.7601664, 0.4889693, 0.180731, 0.7411765, 1, 0, 1,
-0.7561709, 0.6060708, -1.95181, 0.7333333, 1, 0, 1,
-0.7547818, -0.4103372, -1.565621, 0.7294118, 1, 0, 1,
-0.7547478, -0.9933106, -3.026842, 0.7215686, 1, 0, 1,
-0.7533681, 0.1352507, -0.9431899, 0.7176471, 1, 0, 1,
-0.7528268, -0.1170277, -1.605405, 0.7098039, 1, 0, 1,
-0.7497886, 0.3931328, -3.407853, 0.7058824, 1, 0, 1,
-0.7459965, -0.4961835, -2.418151, 0.6980392, 1, 0, 1,
-0.7342528, -0.7991279, -1.286853, 0.6901961, 1, 0, 1,
-0.7284053, -0.1604876, -1.688373, 0.6862745, 1, 0, 1,
-0.7249345, -0.3770808, 0.09759003, 0.6784314, 1, 0, 1,
-0.7242067, 0.6194131, -0.4151596, 0.6745098, 1, 0, 1,
-0.7229789, 0.7539043, -0.09660257, 0.6666667, 1, 0, 1,
-0.72026, -0.2343928, -2.025475, 0.6627451, 1, 0, 1,
-0.7178017, -0.7771581, -2.872111, 0.654902, 1, 0, 1,
-0.7164764, 1.663432, 2.40166, 0.6509804, 1, 0, 1,
-0.7164459, 0.1287423, -0.4261298, 0.6431373, 1, 0, 1,
-0.7163295, 1.809887, -1.25339, 0.6392157, 1, 0, 1,
-0.7149939, -0.8873255, -1.751775, 0.6313726, 1, 0, 1,
-0.713094, 0.7159185, -0.5342245, 0.627451, 1, 0, 1,
-0.7107354, -0.2599727, -2.006993, 0.6196079, 1, 0, 1,
-0.7106668, -0.4548393, -0.6071802, 0.6156863, 1, 0, 1,
-0.7074684, 0.7368818, -0.2636856, 0.6078432, 1, 0, 1,
-0.7001603, -1.520124, -2.150177, 0.6039216, 1, 0, 1,
-0.6968002, 1.757973, -0.6950493, 0.5960785, 1, 0, 1,
-0.6964544, -0.2357281, -0.1666202, 0.5882353, 1, 0, 1,
-0.6941453, 0.04973668, -1.929595, 0.5843138, 1, 0, 1,
-0.6940081, 1.035998, -1.642313, 0.5764706, 1, 0, 1,
-0.6932566, -1.649323, -2.68335, 0.572549, 1, 0, 1,
-0.6897209, -0.8939839, -3.7137, 0.5647059, 1, 0, 1,
-0.6859591, 0.7074583, -0.3574511, 0.5607843, 1, 0, 1,
-0.6778639, 2.169688, -1.417729, 0.5529412, 1, 0, 1,
-0.6748642, -0.799011, -2.63597, 0.5490196, 1, 0, 1,
-0.6646935, -1.291348, -2.211103, 0.5411765, 1, 0, 1,
-0.6519001, -0.4843772, -2.617026, 0.5372549, 1, 0, 1,
-0.6497438, 0.02764079, -1.344169, 0.5294118, 1, 0, 1,
-0.647532, -0.195006, -2.642559, 0.5254902, 1, 0, 1,
-0.6450496, 0.3190772, -0.2796181, 0.5176471, 1, 0, 1,
-0.6390687, -1.692773, -3.62392, 0.5137255, 1, 0, 1,
-0.6387222, 1.864085, 1.201578, 0.5058824, 1, 0, 1,
-0.636205, 0.7753386, -2.529387, 0.5019608, 1, 0, 1,
-0.6321689, -0.4569416, -2.922299, 0.4941176, 1, 0, 1,
-0.6301628, 1.111548, 0.02533822, 0.4862745, 1, 0, 1,
-0.6242752, -1.538546, -1.481477, 0.4823529, 1, 0, 1,
-0.6224313, 0.2155335, -0.9803972, 0.4745098, 1, 0, 1,
-0.6205786, 1.275005, 1.265465, 0.4705882, 1, 0, 1,
-0.6144907, -1.625534, -1.900784, 0.4627451, 1, 0, 1,
-0.6140845, 0.8943958, -0.3880309, 0.4588235, 1, 0, 1,
-0.6130803, 1.009501, -1.283842, 0.4509804, 1, 0, 1,
-0.6128815, -0.1763274, -2.097065, 0.4470588, 1, 0, 1,
-0.6120794, -0.4562448, -1.515427, 0.4392157, 1, 0, 1,
-0.6037501, -0.02447021, -0.4320726, 0.4352941, 1, 0, 1,
-0.6031272, 0.03181813, -2.709012, 0.427451, 1, 0, 1,
-0.6011615, 0.5609801, -0.07386726, 0.4235294, 1, 0, 1,
-0.6001857, 0.100448, -1.944601, 0.4156863, 1, 0, 1,
-0.5974142, -1.841338, -3.244515, 0.4117647, 1, 0, 1,
-0.5958531, -0.1806415, -0.8892636, 0.4039216, 1, 0, 1,
-0.5830812, 0.2951236, -1.159059, 0.3960784, 1, 0, 1,
-0.5821611, 1.766496, 0.6103882, 0.3921569, 1, 0, 1,
-0.5773907, -1.044797, -2.990665, 0.3843137, 1, 0, 1,
-0.5653324, -0.7580561, -4.370379, 0.3803922, 1, 0, 1,
-0.563466, 0.8788775, 0.3227025, 0.372549, 1, 0, 1,
-0.5592099, 0.06113008, 0.879927, 0.3686275, 1, 0, 1,
-0.5591611, -0.926105, -2.043203, 0.3607843, 1, 0, 1,
-0.5515883, -0.05237311, -0.3494999, 0.3568628, 1, 0, 1,
-0.5447021, -0.5079033, -4.115536, 0.3490196, 1, 0, 1,
-0.5425555, 0.3561463, -1.965737, 0.345098, 1, 0, 1,
-0.5420248, 0.1689309, -2.216533, 0.3372549, 1, 0, 1,
-0.5412964, 0.6801132, 0.3346316, 0.3333333, 1, 0, 1,
-0.5392921, 1.124524, 0.1470072, 0.3254902, 1, 0, 1,
-0.5286517, -0.7047536, -1.333993, 0.3215686, 1, 0, 1,
-0.5238137, -0.1724446, -1.504652, 0.3137255, 1, 0, 1,
-0.5215617, -1.012179, -2.129661, 0.3098039, 1, 0, 1,
-0.51959, 1.871836, -0.6592977, 0.3019608, 1, 0, 1,
-0.5173218, 0.4355255, -0.7113806, 0.2941177, 1, 0, 1,
-0.511555, 1.108366, 0.3238707, 0.2901961, 1, 0, 1,
-0.5020079, -1.563942, -4.220343, 0.282353, 1, 0, 1,
-0.4977053, -0.3767507, -2.712726, 0.2784314, 1, 0, 1,
-0.4976108, -1.235054, -1.448574, 0.2705882, 1, 0, 1,
-0.4918309, 1.944582, 1.378412, 0.2666667, 1, 0, 1,
-0.4893145, -0.7433892, -1.232482, 0.2588235, 1, 0, 1,
-0.4887563, -0.5498807, -3.127268, 0.254902, 1, 0, 1,
-0.4887343, -0.09806241, -0.5970237, 0.2470588, 1, 0, 1,
-0.4795746, 0.592458, -0.9397959, 0.2431373, 1, 0, 1,
-0.475859, 0.5924566, -0.9081995, 0.2352941, 1, 0, 1,
-0.4716873, 0.08848596, -1.791231, 0.2313726, 1, 0, 1,
-0.4665778, -0.7621602, -3.369701, 0.2235294, 1, 0, 1,
-0.4632746, 1.605099, -0.3852775, 0.2196078, 1, 0, 1,
-0.4610997, -1.036712, -2.359781, 0.2117647, 1, 0, 1,
-0.4582834, 0.1050995, -2.048819, 0.2078431, 1, 0, 1,
-0.4553818, -0.9014691, -2.45026, 0.2, 1, 0, 1,
-0.4528411, 2.192196, 0.7579336, 0.1921569, 1, 0, 1,
-0.4514741, -0.0984721, -1.858438, 0.1882353, 1, 0, 1,
-0.4507888, 0.9279889, -1.037632, 0.1803922, 1, 0, 1,
-0.44487, 0.4722493, -1.618275, 0.1764706, 1, 0, 1,
-0.4398788, 1.134022, -1.41463, 0.1686275, 1, 0, 1,
-0.4383717, -0.4920159, -2.333265, 0.1647059, 1, 0, 1,
-0.4362268, 0.3754625, 0.1933637, 0.1568628, 1, 0, 1,
-0.4352923, -0.2704256, -1.634728, 0.1529412, 1, 0, 1,
-0.4319092, -0.6279523, -1.122667, 0.145098, 1, 0, 1,
-0.4314302, 1.180531, -1.862228, 0.1411765, 1, 0, 1,
-0.4301743, -1.245045, -1.24978, 0.1333333, 1, 0, 1,
-0.4297433, 1.745946, 0.07808625, 0.1294118, 1, 0, 1,
-0.4237659, 1.138337, 0.3825604, 0.1215686, 1, 0, 1,
-0.4190144, 1.390284, -0.9643067, 0.1176471, 1, 0, 1,
-0.4171643, -0.8072684, -2.757841, 0.1098039, 1, 0, 1,
-0.4121056, 0.4957472, -0.992666, 0.1058824, 1, 0, 1,
-0.4102696, -2.030388, -3.429994, 0.09803922, 1, 0, 1,
-0.3998612, -1.436268, -2.621717, 0.09019608, 1, 0, 1,
-0.3973412, -0.3965293, -4.808526, 0.08627451, 1, 0, 1,
-0.3939551, 0.6995235, -0.5007816, 0.07843138, 1, 0, 1,
-0.3907384, -1.632557, -2.546736, 0.07450981, 1, 0, 1,
-0.3906949, -0.5077595, -1.35502, 0.06666667, 1, 0, 1,
-0.3904272, 0.005269698, -2.296443, 0.0627451, 1, 0, 1,
-0.3843152, 0.3947298, -0.7969908, 0.05490196, 1, 0, 1,
-0.3758763, -0.4874473, -3.545954, 0.05098039, 1, 0, 1,
-0.3720227, -0.6101514, -2.437124, 0.04313726, 1, 0, 1,
-0.3697402, 1.467971, -1.658895, 0.03921569, 1, 0, 1,
-0.3651328, 1.231907, -0.231213, 0.03137255, 1, 0, 1,
-0.3647045, -0.5347073, -3.730537, 0.02745098, 1, 0, 1,
-0.3639598, -1.072176, -3.054185, 0.01960784, 1, 0, 1,
-0.3624182, -1.297882, -2.644266, 0.01568628, 1, 0, 1,
-0.361124, 1.164102, -0.2186792, 0.007843138, 1, 0, 1,
-0.3598772, -0.6868558, -2.384337, 0.003921569, 1, 0, 1,
-0.3572352, 0.5891301, -0.930814, 0, 1, 0.003921569, 1,
-0.3559404, -1.353061, -3.177186, 0, 1, 0.01176471, 1,
-0.3522848, -1.271503, -0.8132777, 0, 1, 0.01568628, 1,
-0.3495701, -1.732005, -2.921053, 0, 1, 0.02352941, 1,
-0.3454044, -1.22682, -3.102484, 0, 1, 0.02745098, 1,
-0.3452978, 0.9758139, -0.1946512, 0, 1, 0.03529412, 1,
-0.3449336, -1.590065, -2.20824, 0, 1, 0.03921569, 1,
-0.344584, 1.341614, 1.033593, 0, 1, 0.04705882, 1,
-0.339545, 0.1409724, -2.118881, 0, 1, 0.05098039, 1,
-0.3395204, 2.26947, -0.884146, 0, 1, 0.05882353, 1,
-0.3360202, -1.476277, -4.321684, 0, 1, 0.0627451, 1,
-0.3347843, -1.700926, -2.707165, 0, 1, 0.07058824, 1,
-0.3333568, -1.05707, -3.185899, 0, 1, 0.07450981, 1,
-0.3278472, 0.8462269, -0.5159313, 0, 1, 0.08235294, 1,
-0.3216608, -0.3142062, -2.678291, 0, 1, 0.08627451, 1,
-0.3182608, 1.359493, -2.120439, 0, 1, 0.09411765, 1,
-0.3158863, -0.4030967, -3.510778, 0, 1, 0.1019608, 1,
-0.312574, 0.3814465, -0.3347487, 0, 1, 0.1058824, 1,
-0.3105402, -1.721695, -1.649302, 0, 1, 0.1137255, 1,
-0.3050948, 0.3885442, -0.6216769, 0, 1, 0.1176471, 1,
-0.3042067, 0.9153432, -0.9520864, 0, 1, 0.1254902, 1,
-0.3034527, -1.258178, -2.526562, 0, 1, 0.1294118, 1,
-0.2984461, -0.8466275, -2.64672, 0, 1, 0.1372549, 1,
-0.293644, 0.4721668, -1.682014, 0, 1, 0.1411765, 1,
-0.293056, -0.4257196, -3.560358, 0, 1, 0.1490196, 1,
-0.2858584, -0.1751925, -2.739046, 0, 1, 0.1529412, 1,
-0.2840096, 0.748996, 0.03795416, 0, 1, 0.1607843, 1,
-0.2830829, -0.04685548, -2.00848, 0, 1, 0.1647059, 1,
-0.2794057, -0.582565, -3.391263, 0, 1, 0.172549, 1,
-0.2741031, 1.271142, 0.03550091, 0, 1, 0.1764706, 1,
-0.2720798, 1.311901, -1.954129, 0, 1, 0.1843137, 1,
-0.2718248, 0.3592547, -0.2559002, 0, 1, 0.1882353, 1,
-0.2715644, 0.6371461, -2.469762, 0, 1, 0.1960784, 1,
-0.2712377, 0.04271467, -0.6611946, 0, 1, 0.2039216, 1,
-0.2601194, 0.8734674, -1.529406, 0, 1, 0.2078431, 1,
-0.2564782, 0.6666886, 0.02591989, 0, 1, 0.2156863, 1,
-0.2540024, -0.2112358, -2.166371, 0, 1, 0.2196078, 1,
-0.2532952, -1.597333, -2.736909, 0, 1, 0.227451, 1,
-0.2513803, -1.592605, -3.51768, 0, 1, 0.2313726, 1,
-0.2497057, 0.3758475, -1.057737, 0, 1, 0.2392157, 1,
-0.2486207, -1.260839, -2.134168, 0, 1, 0.2431373, 1,
-0.2476873, -0.6979555, -2.71448, 0, 1, 0.2509804, 1,
-0.2461019, 0.4727986, -0.492523, 0, 1, 0.254902, 1,
-0.2440537, -0.8128442, -3.068727, 0, 1, 0.2627451, 1,
-0.241234, 0.4342806, 1.12866, 0, 1, 0.2666667, 1,
-0.2370176, -1.116886, -1.183623, 0, 1, 0.2745098, 1,
-0.2345394, -0.5751583, -2.405824, 0, 1, 0.2784314, 1,
-0.2304299, 0.5300862, -0.9029454, 0, 1, 0.2862745, 1,
-0.2301383, -1.283413, -2.299097, 0, 1, 0.2901961, 1,
-0.2270182, 0.5848842, -2.166281, 0, 1, 0.2980392, 1,
-0.2269253, 0.04858491, -0.7176698, 0, 1, 0.3058824, 1,
-0.2247278, -1.080628, -2.148965, 0, 1, 0.3098039, 1,
-0.2237929, -0.188558, -2.632316, 0, 1, 0.3176471, 1,
-0.2217661, 0.9930112, -1.13463, 0, 1, 0.3215686, 1,
-0.2204505, -0.8815092, -2.608529, 0, 1, 0.3294118, 1,
-0.2169069, 0.3385017, -0.6203371, 0, 1, 0.3333333, 1,
-0.2157751, -1.329565, -4.176835, 0, 1, 0.3411765, 1,
-0.2130955, -0.7350017, -2.281922, 0, 1, 0.345098, 1,
-0.2123609, 0.04347593, -1.771138, 0, 1, 0.3529412, 1,
-0.2115615, 0.3778268, -0.457794, 0, 1, 0.3568628, 1,
-0.2104787, 0.08936465, -2.249436, 0, 1, 0.3647059, 1,
-0.206985, 1.334435, -0.5098873, 0, 1, 0.3686275, 1,
-0.2042682, 0.7818891, -0.6935282, 0, 1, 0.3764706, 1,
-0.204159, -0.7150269, -4.007131, 0, 1, 0.3803922, 1,
-0.2019429, -0.6666873, -1.781345, 0, 1, 0.3882353, 1,
-0.201061, -0.1069347, -0.04022741, 0, 1, 0.3921569, 1,
-0.1994414, -1.68516, -4.385022, 0, 1, 0.4, 1,
-0.1944782, -0.8534428, -4.047776, 0, 1, 0.4078431, 1,
-0.1939393, -2.040129, -3.394835, 0, 1, 0.4117647, 1,
-0.193495, 0.6611306, -0.600798, 0, 1, 0.4196078, 1,
-0.1905912, 0.681235, -0.1530679, 0, 1, 0.4235294, 1,
-0.1873576, 1.254428, -0.3927152, 0, 1, 0.4313726, 1,
-0.1843878, 0.5613378, -2.657761, 0, 1, 0.4352941, 1,
-0.1839333, 0.4341373, -2.602626, 0, 1, 0.4431373, 1,
-0.1839309, 0.2482151, 0.6709465, 0, 1, 0.4470588, 1,
-0.1811712, -0.8104813, -1.979854, 0, 1, 0.454902, 1,
-0.178121, -0.4775302, -3.116307, 0, 1, 0.4588235, 1,
-0.1777208, -0.637137, -4.676191, 0, 1, 0.4666667, 1,
-0.1771674, -0.9027043, -3.017062, 0, 1, 0.4705882, 1,
-0.1758691, -0.4332019, -2.00332, 0, 1, 0.4784314, 1,
-0.1742224, -1.048287, -5.591575, 0, 1, 0.4823529, 1,
-0.1644271, -2.185679, -3.488809, 0, 1, 0.4901961, 1,
-0.1627454, 0.4122588, -0.05461287, 0, 1, 0.4941176, 1,
-0.1614501, 1.411347, 1.074758, 0, 1, 0.5019608, 1,
-0.1611336, 0.01248505, 1.699898, 0, 1, 0.509804, 1,
-0.1610235, -1.192982, -2.922772, 0, 1, 0.5137255, 1,
-0.1600548, 1.300923, -0.7846364, 0, 1, 0.5215687, 1,
-0.1577589, -1.944234, -1.297745, 0, 1, 0.5254902, 1,
-0.1569248, -0.4503486, -3.58245, 0, 1, 0.5333334, 1,
-0.1553026, -0.2037059, -2.427354, 0, 1, 0.5372549, 1,
-0.152189, 2.081513, 0.9969284, 0, 1, 0.5450981, 1,
-0.1518392, 0.04999021, -3.084092, 0, 1, 0.5490196, 1,
-0.1485886, 0.798664, -1.0483, 0, 1, 0.5568628, 1,
-0.1427782, 2.72993, 0.1898044, 0, 1, 0.5607843, 1,
-0.1387238, -1.637008, -2.68047, 0, 1, 0.5686275, 1,
-0.1334386, 1.142255, -0.9381462, 0, 1, 0.572549, 1,
-0.1316465, -0.06361298, -4.42545, 0, 1, 0.5803922, 1,
-0.1304123, -1.350975, -3.690576, 0, 1, 0.5843138, 1,
-0.1303613, 1.488947, -1.387486, 0, 1, 0.5921569, 1,
-0.1280017, -0.4520018, -1.265197, 0, 1, 0.5960785, 1,
-0.1255368, -1.584617, -3.235193, 0, 1, 0.6039216, 1,
-0.1240039, 0.879173, 0.4313663, 0, 1, 0.6117647, 1,
-0.1207463, 1.752103, 0.896673, 0, 1, 0.6156863, 1,
-0.1170582, -0.7945754, -2.399918, 0, 1, 0.6235294, 1,
-0.1159406, -0.207746, -2.808225, 0, 1, 0.627451, 1,
-0.1148786, 1.206766, 0.7133613, 0, 1, 0.6352941, 1,
-0.1147507, 0.3100462, -1.050958, 0, 1, 0.6392157, 1,
-0.1140921, 1.04574, 0.9467844, 0, 1, 0.6470588, 1,
-0.113929, -0.9149847, -1.953523, 0, 1, 0.6509804, 1,
-0.1116952, 0.8017116, 0.8517519, 0, 1, 0.6588235, 1,
-0.111593, 1.054915, -2.047884, 0, 1, 0.6627451, 1,
-0.1105889, -0.6351154, -3.974424, 0, 1, 0.6705883, 1,
-0.1094518, -0.5128427, -2.404757, 0, 1, 0.6745098, 1,
-0.1088424, 0.1782836, -0.1188087, 0, 1, 0.682353, 1,
-0.1081602, -1.061234, -3.472541, 0, 1, 0.6862745, 1,
-0.10811, -0.06973634, -1.715509, 0, 1, 0.6941177, 1,
-0.1014817, -0.8977398, -2.399882, 0, 1, 0.7019608, 1,
-0.1002706, 1.747488, 0.6913651, 0, 1, 0.7058824, 1,
-0.1001672, 0.8920873, 0.9603342, 0, 1, 0.7137255, 1,
-0.09945265, 2.194282, 0.7098348, 0, 1, 0.7176471, 1,
-0.09849554, -0.2388831, -3.622191, 0, 1, 0.7254902, 1,
-0.09682788, 0.6718549, 0.3343224, 0, 1, 0.7294118, 1,
-0.09582927, -0.4449122, -2.355995, 0, 1, 0.7372549, 1,
-0.08892746, 1.292093, 1.622853, 0, 1, 0.7411765, 1,
-0.08554713, 0.3065966, -0.9401886, 0, 1, 0.7490196, 1,
-0.0845541, 0.0818799, -2.68847, 0, 1, 0.7529412, 1,
-0.08443576, -0.08417667, -1.288319, 0, 1, 0.7607843, 1,
-0.08253817, -0.7363616, -2.923217, 0, 1, 0.7647059, 1,
-0.08090623, 0.1504898, -1.165395, 0, 1, 0.772549, 1,
-0.07453045, 0.4154397, 0.6850235, 0, 1, 0.7764706, 1,
-0.07405938, -1.519688, -3.390793, 0, 1, 0.7843137, 1,
-0.06613801, 2.385553, 0.5197303, 0, 1, 0.7882353, 1,
-0.06528811, -0.4892506, -2.572406, 0, 1, 0.7960784, 1,
-0.06026199, -0.7207441, -2.820277, 0, 1, 0.8039216, 1,
-0.0593957, 1.010096, -0.2088183, 0, 1, 0.8078431, 1,
-0.05615138, 1.006822, -1.551593, 0, 1, 0.8156863, 1,
-0.05577372, -0.7579394, -4.043611, 0, 1, 0.8196079, 1,
-0.05551606, 0.08636223, -0.3423783, 0, 1, 0.827451, 1,
-0.05455118, -0.293085, -3.141776, 0, 1, 0.8313726, 1,
-0.05231941, -1.483604, -3.438684, 0, 1, 0.8392157, 1,
-0.04791426, -2.54615, -2.379089, 0, 1, 0.8431373, 1,
-0.04746578, 0.1670517, -0.069484, 0, 1, 0.8509804, 1,
-0.04509491, 1.133888, -1.397075, 0, 1, 0.854902, 1,
-0.04203484, -0.7564633, -2.840862, 0, 1, 0.8627451, 1,
-0.0419472, -1.177279, -3.738843, 0, 1, 0.8666667, 1,
-0.04120444, -1.669795, -3.395772, 0, 1, 0.8745098, 1,
-0.04090331, -0.5146626, -3.788071, 0, 1, 0.8784314, 1,
-0.03854895, -2.055007, -3.645167, 0, 1, 0.8862745, 1,
-0.035903, 0.2184658, 0.1212139, 0, 1, 0.8901961, 1,
-0.03547056, 0.5427738, 0.4942083, 0, 1, 0.8980392, 1,
-0.03439299, -0.9766902, -4.091415, 0, 1, 0.9058824, 1,
-0.03176414, -0.5849165, -2.374482, 0, 1, 0.9098039, 1,
-0.02758513, -0.2532955, -2.354048, 0, 1, 0.9176471, 1,
-0.0267085, 0.6202563, 0.586599, 0, 1, 0.9215686, 1,
-0.02622138, -1.064126, -0.8765076, 0, 1, 0.9294118, 1,
-0.02435037, -0.4632244, -3.431805, 0, 1, 0.9333333, 1,
-0.02226555, -1.078456, -2.148678, 0, 1, 0.9411765, 1,
-0.02108477, -0.02561578, -3.538384, 0, 1, 0.945098, 1,
-0.02016218, 0.4413351, 1.831194, 0, 1, 0.9529412, 1,
-0.01674901, 0.2082607, -1.980943, 0, 1, 0.9568627, 1,
-0.01609414, 1.308702, -1.242566, 0, 1, 0.9647059, 1,
-0.0142195, 0.3724119, 0.9673996, 0, 1, 0.9686275, 1,
-0.01383531, 0.1997381, -1.262956, 0, 1, 0.9764706, 1,
-0.0117659, 1.079971, -0.4832829, 0, 1, 0.9803922, 1,
-0.006417134, -0.2644365, -0.7161638, 0, 1, 0.9882353, 1,
-0.003864224, -0.5819935, -3.168722, 0, 1, 0.9921569, 1,
-0.001480038, 0.736294, -0.1689528, 0, 1, 1, 1,
-0.00014651, 1.058212, 0.4686753, 0, 0.9921569, 1, 1,
7.78048e-05, -0.2457446, 2.814656, 0, 0.9882353, 1, 1,
0.001394736, -0.7120204, 4.741195, 0, 0.9803922, 1, 1,
0.002406303, 0.9952282, 1.529949, 0, 0.9764706, 1, 1,
0.004144392, 0.3605233, 0.2668677, 0, 0.9686275, 1, 1,
0.006367715, -0.8087441, 2.483865, 0, 0.9647059, 1, 1,
0.007721897, -0.4171121, 2.962759, 0, 0.9568627, 1, 1,
0.009619065, 1.491994, -0.3348116, 0, 0.9529412, 1, 1,
0.009663325, -1.390401, 2.105419, 0, 0.945098, 1, 1,
0.01381269, 1.52809, 0.6071044, 0, 0.9411765, 1, 1,
0.01675503, -1.226824, 2.489616, 0, 0.9333333, 1, 1,
0.01849023, 1.882056, 0.244844, 0, 0.9294118, 1, 1,
0.02809567, 1.130129, 1.128484, 0, 0.9215686, 1, 1,
0.02944067, -1.451578, 2.246775, 0, 0.9176471, 1, 1,
0.03090772, -0.5366006, 2.567054, 0, 0.9098039, 1, 1,
0.03574108, -0.2805695, 0.6713221, 0, 0.9058824, 1, 1,
0.04061784, -0.7001041, 3.349506, 0, 0.8980392, 1, 1,
0.04103766, 0.3011788, -0.2563319, 0, 0.8901961, 1, 1,
0.04437778, -0.1179842, 4.140364, 0, 0.8862745, 1, 1,
0.04615098, 0.04687891, 0.4963765, 0, 0.8784314, 1, 1,
0.04638498, -0.9452174, 3.389266, 0, 0.8745098, 1, 1,
0.04745816, -0.1768169, 2.514239, 0, 0.8666667, 1, 1,
0.05233188, -0.6819457, 3.545878, 0, 0.8627451, 1, 1,
0.05490894, -1.407755, 2.464505, 0, 0.854902, 1, 1,
0.05689377, 0.9492168, 1.121716, 0, 0.8509804, 1, 1,
0.05871729, 0.3544115, -0.1513205, 0, 0.8431373, 1, 1,
0.06149628, -0.3077943, 4.066675, 0, 0.8392157, 1, 1,
0.0658736, 0.6211315, 0.5212615, 0, 0.8313726, 1, 1,
0.06629583, -0.3561982, 2.036194, 0, 0.827451, 1, 1,
0.06945883, -0.931444, 3.260533, 0, 0.8196079, 1, 1,
0.07329392, -1.39801, 3.711841, 0, 0.8156863, 1, 1,
0.07517543, 0.3797602, -0.630079, 0, 0.8078431, 1, 1,
0.0764276, -0.8113674, 2.83164, 0, 0.8039216, 1, 1,
0.07766202, -2.761147, 1.899233, 0, 0.7960784, 1, 1,
0.07899129, -0.8905382, 1.235237, 0, 0.7882353, 1, 1,
0.08489223, 0.5433304, -1.029678, 0, 0.7843137, 1, 1,
0.08525826, -0.8424104, 2.547315, 0, 0.7764706, 1, 1,
0.08758108, -1.00604, 4.116429, 0, 0.772549, 1, 1,
0.08764023, 0.2597863, 1.60784, 0, 0.7647059, 1, 1,
0.08841248, 0.1544309, 1.561442, 0, 0.7607843, 1, 1,
0.08950277, -0.3941569, 3.651284, 0, 0.7529412, 1, 1,
0.09060021, 0.3106557, 0.8246079, 0, 0.7490196, 1, 1,
0.09332284, -0.7888768, 3.527421, 0, 0.7411765, 1, 1,
0.09471413, 1.028135, -1.011505, 0, 0.7372549, 1, 1,
0.09601678, 1.090436, -0.9369708, 0, 0.7294118, 1, 1,
0.09631093, -1.232838, 1.44425, 0, 0.7254902, 1, 1,
0.09772483, 1.418602, -1.124482, 0, 0.7176471, 1, 1,
0.09991346, 0.253607, -0.4811446, 0, 0.7137255, 1, 1,
0.1012832, 0.01548668, 0.3612998, 0, 0.7058824, 1, 1,
0.1013148, 0.06656598, 1.888989, 0, 0.6980392, 1, 1,
0.1017854, 0.6628095, 0.5253624, 0, 0.6941177, 1, 1,
0.1085749, 0.4080963, 0.6293176, 0, 0.6862745, 1, 1,
0.1091817, -1.061198, 3.272144, 0, 0.682353, 1, 1,
0.1097725, 0.5082086, 0.3836541, 0, 0.6745098, 1, 1,
0.1122979, -0.8563094, 2.080068, 0, 0.6705883, 1, 1,
0.1130419, 1.276931, 1.054769, 0, 0.6627451, 1, 1,
0.1143847, -0.3026221, 2.983171, 0, 0.6588235, 1, 1,
0.1256414, -1.327578, 3.295415, 0, 0.6509804, 1, 1,
0.1314246, 2.022346, 0.3386381, 0, 0.6470588, 1, 1,
0.134073, 2.123621, 1.260244, 0, 0.6392157, 1, 1,
0.138163, -0.858978, 4.810259, 0, 0.6352941, 1, 1,
0.1402066, 0.7730951, 2.101907, 0, 0.627451, 1, 1,
0.1402324, -0.65894, 2.797898, 0, 0.6235294, 1, 1,
0.1427528, -1.446957, 2.600763, 0, 0.6156863, 1, 1,
0.1430169, 0.8494191, 0.08429454, 0, 0.6117647, 1, 1,
0.144747, 0.2971186, 2.368642, 0, 0.6039216, 1, 1,
0.1450184, 0.5743505, 2.249342, 0, 0.5960785, 1, 1,
0.1527561, -0.5845461, 0.6022527, 0, 0.5921569, 1, 1,
0.1617424, 0.6643144, -2.067312, 0, 0.5843138, 1, 1,
0.1620343, 2.81032, -1.011064, 0, 0.5803922, 1, 1,
0.164333, -0.7722039, 4.013356, 0, 0.572549, 1, 1,
0.1677542, -0.073566, 0.8614967, 0, 0.5686275, 1, 1,
0.1713772, 1.968474, 0.1964112, 0, 0.5607843, 1, 1,
0.1829457, -0.6031256, 4.016392, 0, 0.5568628, 1, 1,
0.1846539, -0.7286795, 2.043536, 0, 0.5490196, 1, 1,
0.1857354, -1.78401, 3.010834, 0, 0.5450981, 1, 1,
0.1877859, -2.563196, 3.229679, 0, 0.5372549, 1, 1,
0.2106676, -0.05624913, 3.783279, 0, 0.5333334, 1, 1,
0.2109987, -0.9080503, 4.216672, 0, 0.5254902, 1, 1,
0.2128695, -0.3247845, 3.716056, 0, 0.5215687, 1, 1,
0.2156294, -1.762752, 1.992056, 0, 0.5137255, 1, 1,
0.2180447, 0.567184, 1.049081, 0, 0.509804, 1, 1,
0.2188912, -1.437336, 3.896804, 0, 0.5019608, 1, 1,
0.2194377, 1.110565, -0.7985892, 0, 0.4941176, 1, 1,
0.2220352, 0.8802914, 0.8851374, 0, 0.4901961, 1, 1,
0.2255722, 1.280855, 1.805961, 0, 0.4823529, 1, 1,
0.227947, -0.1179729, 2.052652, 0, 0.4784314, 1, 1,
0.228649, -1.568106, 3.614996, 0, 0.4705882, 1, 1,
0.2290054, -1.141704, 3.813278, 0, 0.4666667, 1, 1,
0.2415102, -0.9462944, 2.909298, 0, 0.4588235, 1, 1,
0.2446805, -0.2287825, 3.378394, 0, 0.454902, 1, 1,
0.2448177, -1.889367, 1.546054, 0, 0.4470588, 1, 1,
0.2493929, 1.19416, 1.42653, 0, 0.4431373, 1, 1,
0.2522846, 0.5108339, -0.2443157, 0, 0.4352941, 1, 1,
0.2523505, -0.01660169, 1.327872, 0, 0.4313726, 1, 1,
0.2553602, 0.1584753, 0.660876, 0, 0.4235294, 1, 1,
0.2563621, 0.6782383, -0.779601, 0, 0.4196078, 1, 1,
0.2575382, 0.9545627, 1.793633, 0, 0.4117647, 1, 1,
0.2605356, -1.176889, 3.17905, 0, 0.4078431, 1, 1,
0.264924, 1.36175, 1.246062, 0, 0.4, 1, 1,
0.2661346, -0.908588, 3.363365, 0, 0.3921569, 1, 1,
0.2665813, -0.6813579, 2.45757, 0, 0.3882353, 1, 1,
0.2729628, -0.5994056, 3.4551, 0, 0.3803922, 1, 1,
0.2740926, 1.293333, 1.356488, 0, 0.3764706, 1, 1,
0.2748128, 1.670118, -0.2229144, 0, 0.3686275, 1, 1,
0.2824299, -1.266411, 3.199068, 0, 0.3647059, 1, 1,
0.2849583, -0.559276, 1.634117, 0, 0.3568628, 1, 1,
0.2865438, 0.4383585, -0.4548845, 0, 0.3529412, 1, 1,
0.291441, 0.433791, 2.064341, 0, 0.345098, 1, 1,
0.2942331, 0.06700343, 2.306266, 0, 0.3411765, 1, 1,
0.294913, -0.119913, 1.850832, 0, 0.3333333, 1, 1,
0.2955417, 0.309545, 0.7070146, 0, 0.3294118, 1, 1,
0.2993325, 1.116886, 0.826487, 0, 0.3215686, 1, 1,
0.3027191, -0.8250253, 1.965315, 0, 0.3176471, 1, 1,
0.3031509, -0.3238627, 1.558762, 0, 0.3098039, 1, 1,
0.3032518, 0.5020507, 0.8922913, 0, 0.3058824, 1, 1,
0.3102396, 0.3958283, 2.527107, 0, 0.2980392, 1, 1,
0.3120302, 1.372594, -0.1524327, 0, 0.2901961, 1, 1,
0.3145894, 0.09390868, -0.421354, 0, 0.2862745, 1, 1,
0.3212794, -0.6403978, 1.174995, 0, 0.2784314, 1, 1,
0.3282891, 0.1808388, -0.01801968, 0, 0.2745098, 1, 1,
0.3322585, 1.389226, 0.8902694, 0, 0.2666667, 1, 1,
0.3351823, 0.6491934, -0.07687999, 0, 0.2627451, 1, 1,
0.3421831, -0.502557, -0.1659655, 0, 0.254902, 1, 1,
0.3440309, -0.9061073, 1.88215, 0, 0.2509804, 1, 1,
0.3446461, 0.864545, 1.909229, 0, 0.2431373, 1, 1,
0.3463203, -1.334812, 1.832665, 0, 0.2392157, 1, 1,
0.3482449, -0.2431718, 1.811958, 0, 0.2313726, 1, 1,
0.3489797, 1.10617, 0.2528782, 0, 0.227451, 1, 1,
0.3496994, -0.7720562, 1.005097, 0, 0.2196078, 1, 1,
0.3498215, -1.253657, 3.360215, 0, 0.2156863, 1, 1,
0.3521808, -0.278973, 2.691627, 0, 0.2078431, 1, 1,
0.3532198, 0.6233942, 0.676299, 0, 0.2039216, 1, 1,
0.353518, 1.197452, -0.1120932, 0, 0.1960784, 1, 1,
0.3543593, -1.39631, 0.9464417, 0, 0.1882353, 1, 1,
0.3546254, 1.181897, -0.6562456, 0, 0.1843137, 1, 1,
0.3671984, -0.05118301, -0.3656399, 0, 0.1764706, 1, 1,
0.3710824, -0.5260952, 1.90679, 0, 0.172549, 1, 1,
0.3741698, 1.872391, -1.759752, 0, 0.1647059, 1, 1,
0.3781702, -0.6627197, 2.502252, 0, 0.1607843, 1, 1,
0.386159, 0.2777169, 1.891077, 0, 0.1529412, 1, 1,
0.3887872, -0.2971053, 0.5316949, 0, 0.1490196, 1, 1,
0.3896792, -0.4654585, 2.043319, 0, 0.1411765, 1, 1,
0.390391, -0.6146388, 3.81182, 0, 0.1372549, 1, 1,
0.3904603, -1.655202, 3.017178, 0, 0.1294118, 1, 1,
0.391497, 1.708513, -0.7709784, 0, 0.1254902, 1, 1,
0.3936803, 1.375498, -0.9181539, 0, 0.1176471, 1, 1,
0.3953697, 0.988336, 0.8183619, 0, 0.1137255, 1, 1,
0.3979465, -1.03679, 3.950041, 0, 0.1058824, 1, 1,
0.4011431, 0.2808522, 1.168704, 0, 0.09803922, 1, 1,
0.4026958, -0.04862637, 0.402721, 0, 0.09411765, 1, 1,
0.4093708, 0.8680297, 1.908778, 0, 0.08627451, 1, 1,
0.4100183, -0.9362475, 2.665605, 0, 0.08235294, 1, 1,
0.4129975, 1.880038, 1.749961, 0, 0.07450981, 1, 1,
0.4151973, -0.9650667, 3.923485, 0, 0.07058824, 1, 1,
0.4161555, 1.248342, 0.5193154, 0, 0.0627451, 1, 1,
0.4220749, 1.926287, 0.5602086, 0, 0.05882353, 1, 1,
0.4222906, 0.5593709, 1.087548, 0, 0.05098039, 1, 1,
0.4237286, 0.6977639, -1.039324, 0, 0.04705882, 1, 1,
0.424357, 1.321312, 1.298473, 0, 0.03921569, 1, 1,
0.4309355, -1.059537, 2.612495, 0, 0.03529412, 1, 1,
0.4367127, 0.2179431, 0.7393169, 0, 0.02745098, 1, 1,
0.437048, 0.1308385, 1.637725, 0, 0.02352941, 1, 1,
0.4387841, -2.13131, 3.831929, 0, 0.01568628, 1, 1,
0.4402374, 0.7792503, 0.6664883, 0, 0.01176471, 1, 1,
0.4422705, 0.4761477, -0.9215885, 0, 0.003921569, 1, 1,
0.4431001, -0.3807286, 2.177194, 0.003921569, 0, 1, 1,
0.4443224, 0.3782373, -0.7687494, 0.007843138, 0, 1, 1,
0.4446428, 0.3256555, 2.283123, 0.01568628, 0, 1, 1,
0.4503318, -0.954718, 3.047375, 0.01960784, 0, 1, 1,
0.4505489, 0.08820149, 2.913797, 0.02745098, 0, 1, 1,
0.4535766, -1.051711, 4.234914, 0.03137255, 0, 1, 1,
0.4568413, -0.9086134, 2.648703, 0.03921569, 0, 1, 1,
0.4591465, 0.2200959, 1.688409, 0.04313726, 0, 1, 1,
0.4613289, 0.09973506, 1.787874, 0.05098039, 0, 1, 1,
0.4619873, -0.7117355, 2.347458, 0.05490196, 0, 1, 1,
0.4636561, -2.036927, 1.165237, 0.0627451, 0, 1, 1,
0.4646853, -0.02488343, 3.577126, 0.06666667, 0, 1, 1,
0.4653223, 1.627868, -0.9706538, 0.07450981, 0, 1, 1,
0.4875686, -0.771269, 3.267755, 0.07843138, 0, 1, 1,
0.4952254, 0.7455277, 0.294576, 0.08627451, 0, 1, 1,
0.4976655, 0.6461329, 1.239009, 0.09019608, 0, 1, 1,
0.5053402, 0.07351357, 2.405799, 0.09803922, 0, 1, 1,
0.5065978, -0.1766645, 1.459449, 0.1058824, 0, 1, 1,
0.5091568, -0.3410511, 2.942308, 0.1098039, 0, 1, 1,
0.5104396, -0.4141078, 1.88227, 0.1176471, 0, 1, 1,
0.5130239, -0.5384417, 2.757456, 0.1215686, 0, 1, 1,
0.5140506, -1.524745, 4.4378, 0.1294118, 0, 1, 1,
0.5171771, -0.3154777, 1.78014, 0.1333333, 0, 1, 1,
0.5263134, -0.5740107, 1.861708, 0.1411765, 0, 1, 1,
0.5297107, -0.5707777, 1.66657, 0.145098, 0, 1, 1,
0.5300107, -0.4106933, 3.388333, 0.1529412, 0, 1, 1,
0.5327423, 0.2715865, 0.5702285, 0.1568628, 0, 1, 1,
0.5429429, 0.1772602, 1.323693, 0.1647059, 0, 1, 1,
0.5496491, -0.4336888, 2.666359, 0.1686275, 0, 1, 1,
0.5500987, -1.386775, 1.833007, 0.1764706, 0, 1, 1,
0.5507013, 0.4508879, 3.139725, 0.1803922, 0, 1, 1,
0.5532987, 0.06546103, 1.938836, 0.1882353, 0, 1, 1,
0.5557001, -0.4890669, 1.493699, 0.1921569, 0, 1, 1,
0.5661343, 1.010342, 1.851683, 0.2, 0, 1, 1,
0.5661461, 0.5518739, 1.681118, 0.2078431, 0, 1, 1,
0.5735356, -1.565476, 4.579092, 0.2117647, 0, 1, 1,
0.5794632, 0.9863962, 2.118179, 0.2196078, 0, 1, 1,
0.5855163, 0.6793828, 0.6285855, 0.2235294, 0, 1, 1,
0.600437, -0.6189095, 2.848079, 0.2313726, 0, 1, 1,
0.6053205, -1.153171, 3.348781, 0.2352941, 0, 1, 1,
0.6212994, 0.471976, 0.6723255, 0.2431373, 0, 1, 1,
0.6214833, -0.7318834, 1.239715, 0.2470588, 0, 1, 1,
0.622105, 0.5890893, 0.2617025, 0.254902, 0, 1, 1,
0.6248367, -0.5773556, 1.029217, 0.2588235, 0, 1, 1,
0.6279451, -1.497633, 3.727196, 0.2666667, 0, 1, 1,
0.6289185, 0.3821751, -0.9653975, 0.2705882, 0, 1, 1,
0.6295224, 1.206135, 1.732125, 0.2784314, 0, 1, 1,
0.6300811, -0.1756164, 0.2606757, 0.282353, 0, 1, 1,
0.6323601, -0.2213118, 2.30028, 0.2901961, 0, 1, 1,
0.6363091, 1.856539, 0.7108883, 0.2941177, 0, 1, 1,
0.6417214, -0.03481963, -0.3890217, 0.3019608, 0, 1, 1,
0.6426113, 0.8514768, 0.6213624, 0.3098039, 0, 1, 1,
0.6480933, -0.2561241, 1.462797, 0.3137255, 0, 1, 1,
0.6531866, 0.6591868, 2.473284, 0.3215686, 0, 1, 1,
0.6552756, -0.8037331, 2.400064, 0.3254902, 0, 1, 1,
0.6583717, -0.4297101, 2.815628, 0.3333333, 0, 1, 1,
0.6679242, 1.369129, 1.785017, 0.3372549, 0, 1, 1,
0.6680948, -1.235242, 3.113148, 0.345098, 0, 1, 1,
0.6688526, 0.3940766, -0.6511245, 0.3490196, 0, 1, 1,
0.669129, 1.790344, -0.3405347, 0.3568628, 0, 1, 1,
0.6733415, 0.6212436, 0.08990078, 0.3607843, 0, 1, 1,
0.6758144, 0.1878846, 1.18104, 0.3686275, 0, 1, 1,
0.676398, -0.565142, 2.61504, 0.372549, 0, 1, 1,
0.6770572, -0.4926645, 2.949916, 0.3803922, 0, 1, 1,
0.6793897, -1.484075, 4.697448, 0.3843137, 0, 1, 1,
0.6801962, 0.1909433, 2.087851, 0.3921569, 0, 1, 1,
0.6844079, 0.1833128, 0.7226561, 0.3960784, 0, 1, 1,
0.6851392, -0.2714763, 2.787431, 0.4039216, 0, 1, 1,
0.6876245, -0.2684875, 3.338491, 0.4117647, 0, 1, 1,
0.6940644, 0.5941373, 1.215658, 0.4156863, 0, 1, 1,
0.7002578, -0.5498655, 4.06372, 0.4235294, 0, 1, 1,
0.7100542, 0.8238336, 0.3844832, 0.427451, 0, 1, 1,
0.7111517, 1.392514, 0.8827103, 0.4352941, 0, 1, 1,
0.7133943, 0.7122166, -0.1208726, 0.4392157, 0, 1, 1,
0.7143436, 0.6699783, -1.344136, 0.4470588, 0, 1, 1,
0.7151396, -0.2429727, 2.53512, 0.4509804, 0, 1, 1,
0.7156363, 1.556033, 0.248784, 0.4588235, 0, 1, 1,
0.7165671, -0.9649626, 2.23399, 0.4627451, 0, 1, 1,
0.7179309, 0.04390326, 0.8266124, 0.4705882, 0, 1, 1,
0.7187428, -0.4083837, 2.389983, 0.4745098, 0, 1, 1,
0.7256994, -1.712001, 3.057368, 0.4823529, 0, 1, 1,
0.7264796, 0.6027231, 0.4651147, 0.4862745, 0, 1, 1,
0.7289194, 0.4676307, 1.832224, 0.4941176, 0, 1, 1,
0.7365566, 0.8820075, 2.956464, 0.5019608, 0, 1, 1,
0.7380261, 0.0110017, 0.03573738, 0.5058824, 0, 1, 1,
0.7427758, -0.4432541, 2.48568, 0.5137255, 0, 1, 1,
0.7458977, -0.2580465, 1.829362, 0.5176471, 0, 1, 1,
0.7502971, -0.4521635, 1.240732, 0.5254902, 0, 1, 1,
0.7526912, -1.158146, 3.259153, 0.5294118, 0, 1, 1,
0.7546887, -0.6293095, 2.411545, 0.5372549, 0, 1, 1,
0.7611471, -0.2696926, 2.137533, 0.5411765, 0, 1, 1,
0.7638435, 0.4041842, 1.825176, 0.5490196, 0, 1, 1,
0.7648916, -0.9670956, 2.638812, 0.5529412, 0, 1, 1,
0.766807, -0.9984272, -0.3517801, 0.5607843, 0, 1, 1,
0.7692934, -1.023836, 2.086057, 0.5647059, 0, 1, 1,
0.7703198, 0.03538955, 1.286559, 0.572549, 0, 1, 1,
0.7885822, 1.433789, 1.055853, 0.5764706, 0, 1, 1,
0.7904108, -1.692167, 3.265836, 0.5843138, 0, 1, 1,
0.7906913, -1.347775, 3.28293, 0.5882353, 0, 1, 1,
0.7927799, 0.8323373, 0.06536321, 0.5960785, 0, 1, 1,
0.7953213, -1.0977, 3.845645, 0.6039216, 0, 1, 1,
0.796317, -0.920586, 2.318679, 0.6078432, 0, 1, 1,
0.7992597, -2.088245, 3.660287, 0.6156863, 0, 1, 1,
0.8093061, 0.8377093, 1.208028, 0.6196079, 0, 1, 1,
0.8144736, -1.786445, 1.310997, 0.627451, 0, 1, 1,
0.8171937, 0.8696172, 1.519337, 0.6313726, 0, 1, 1,
0.8176038, 0.1891644, 2.490209, 0.6392157, 0, 1, 1,
0.8346359, -2.915071, 2.504947, 0.6431373, 0, 1, 1,
0.8386956, -0.4332466, 1.780312, 0.6509804, 0, 1, 1,
0.8411921, 0.3406183, 2.635483, 0.654902, 0, 1, 1,
0.8415616, 1.202833, 0.3241001, 0.6627451, 0, 1, 1,
0.8449263, 0.3312862, 1.044137, 0.6666667, 0, 1, 1,
0.8452215, 0.5917283, 0.5076277, 0.6745098, 0, 1, 1,
0.853933, -0.3975514, 3.130743, 0.6784314, 0, 1, 1,
0.8584492, 0.259217, 3.810117, 0.6862745, 0, 1, 1,
0.8596552, -0.6591706, 3.504818, 0.6901961, 0, 1, 1,
0.8609473, 1.3501, 0.1329281, 0.6980392, 0, 1, 1,
0.8638843, -0.07700212, 2.4793, 0.7058824, 0, 1, 1,
0.8654831, 0.5165171, 1.235571, 0.7098039, 0, 1, 1,
0.8660622, -0.9464369, 2.512204, 0.7176471, 0, 1, 1,
0.8679355, -0.4229422, 2.131853, 0.7215686, 0, 1, 1,
0.8787617, 0.4295817, 2.248048, 0.7294118, 0, 1, 1,
0.8818523, -0.01961388, 0.4731524, 0.7333333, 0, 1, 1,
0.8833525, 0.7791333, 0.3959657, 0.7411765, 0, 1, 1,
0.8835424, 0.4729481, 2.292121, 0.7450981, 0, 1, 1,
0.8845554, 0.9196629, 1.8833, 0.7529412, 0, 1, 1,
0.8974776, -1.193124, 3.365983, 0.7568628, 0, 1, 1,
0.8983918, -0.172517, 3.430881, 0.7647059, 0, 1, 1,
0.9004876, -0.3268578, 2.157561, 0.7686275, 0, 1, 1,
0.9024956, -0.83829, 3.228148, 0.7764706, 0, 1, 1,
0.9040629, -1.118556, 2.197717, 0.7803922, 0, 1, 1,
0.9047259, 0.6709483, 2.431379, 0.7882353, 0, 1, 1,
0.9238968, 2.397079, 0.7062799, 0.7921569, 0, 1, 1,
0.9260657, -1.185004, 2.942336, 0.8, 0, 1, 1,
0.9283783, -0.5934482, 3.092307, 0.8078431, 0, 1, 1,
0.9290867, -1.246606, 2.692648, 0.8117647, 0, 1, 1,
0.9300162, -1.108412, 3.198011, 0.8196079, 0, 1, 1,
0.9351921, 0.1972132, 2.171912, 0.8235294, 0, 1, 1,
0.9425691, -0.1366356, 0.9756134, 0.8313726, 0, 1, 1,
0.9576418, -1.568638, 2.099428, 0.8352941, 0, 1, 1,
0.9579439, 0.8663354, -1.801067, 0.8431373, 0, 1, 1,
0.9615018, 1.507072, 0.585148, 0.8470588, 0, 1, 1,
0.9650083, -0.7393425, 0.5569398, 0.854902, 0, 1, 1,
0.9673408, 0.9601729, 1.639536, 0.8588235, 0, 1, 1,
0.9681088, 1.924412, 0.6049772, 0.8666667, 0, 1, 1,
0.9717039, 0.9019023, 0.9765074, 0.8705882, 0, 1, 1,
0.9762928, 0.5095567, 0.8238613, 0.8784314, 0, 1, 1,
0.9807518, 2.531296, 1.226022, 0.8823529, 0, 1, 1,
0.9823083, -0.6279843, 3.14295, 0.8901961, 0, 1, 1,
0.9828734, 0.5155214, 0.2654748, 0.8941177, 0, 1, 1,
0.9888871, -0.6194988, 2.622708, 0.9019608, 0, 1, 1,
0.9913035, 0.2836142, 2.126013, 0.9098039, 0, 1, 1,
0.9920167, 1.327386, -0.09425628, 0.9137255, 0, 1, 1,
0.9964718, -0.1448485, 1.503146, 0.9215686, 0, 1, 1,
1.000333, -0.1532617, 2.203671, 0.9254902, 0, 1, 1,
1.001007, -1.812487, 1.001343, 0.9333333, 0, 1, 1,
1.00282, 1.093316, 0.08014417, 0.9372549, 0, 1, 1,
1.003318, 0.6322315, 1.692118, 0.945098, 0, 1, 1,
1.016663, -0.2686563, 0.1064032, 0.9490196, 0, 1, 1,
1.025478, -0.1402001, 1.448368, 0.9568627, 0, 1, 1,
1.031168, 0.6759002, -0.7853055, 0.9607843, 0, 1, 1,
1.038802, -2.234618, 3.67016, 0.9686275, 0, 1, 1,
1.039195, -1.844395, 2.484187, 0.972549, 0, 1, 1,
1.041626, 0.1016818, -0.6774226, 0.9803922, 0, 1, 1,
1.045289, -0.441595, 0.09861689, 0.9843137, 0, 1, 1,
1.046004, -0.9529433, 3.069638, 0.9921569, 0, 1, 1,
1.050334, -1.501423, 4.448972, 0.9960784, 0, 1, 1,
1.057036, -0.5047734, 2.796295, 1, 0, 0.9960784, 1,
1.057263, 0.7559776, 1.777442, 1, 0, 0.9882353, 1,
1.060729, 1.231945, 2.702781, 1, 0, 0.9843137, 1,
1.067129, -0.8727595, 1.599334, 1, 0, 0.9764706, 1,
1.067191, -1.432099, 1.047203, 1, 0, 0.972549, 1,
1.068138, -0.135382, -0.8140069, 1, 0, 0.9647059, 1,
1.069826, -0.4787806, 2.589318, 1, 0, 0.9607843, 1,
1.074766, -0.004441516, 2.408107, 1, 0, 0.9529412, 1,
1.078478, 1.457003, -1.267663, 1, 0, 0.9490196, 1,
1.080983, -0.177144, 2.093034, 1, 0, 0.9411765, 1,
1.082499, 0.7206351, 1.583712, 1, 0, 0.9372549, 1,
1.086452, 1.790908, -0.3276382, 1, 0, 0.9294118, 1,
1.096366, -2.338166, 1.047661, 1, 0, 0.9254902, 1,
1.102803, -1.711263, 2.096943, 1, 0, 0.9176471, 1,
1.106934, -2.073448, 3.31531, 1, 0, 0.9137255, 1,
1.113564, -1.459583, 1.115138, 1, 0, 0.9058824, 1,
1.114811, 0.3986157, 1.979125, 1, 0, 0.9019608, 1,
1.117901, -0.2273232, 1.951833, 1, 0, 0.8941177, 1,
1.124613, 1.431223, -0.7410813, 1, 0, 0.8862745, 1,
1.124856, -0.4985913, 1.561272, 1, 0, 0.8823529, 1,
1.134482, -1.322871, 1.266698, 1, 0, 0.8745098, 1,
1.135594, -0.9395319, 3.267025, 1, 0, 0.8705882, 1,
1.147323, 0.03929238, 0.1574678, 1, 0, 0.8627451, 1,
1.152443, 0.1158056, 1.27333, 1, 0, 0.8588235, 1,
1.158579, 0.7236115, -1.198853, 1, 0, 0.8509804, 1,
1.158942, -0.2027732, 0.06996329, 1, 0, 0.8470588, 1,
1.161084, 0.7133534, 0.5454684, 1, 0, 0.8392157, 1,
1.162187, -0.2441389, 0.1997258, 1, 0, 0.8352941, 1,
1.166385, -1.015869, 2.819116, 1, 0, 0.827451, 1,
1.168273, -0.4610667, 0.9723281, 1, 0, 0.8235294, 1,
1.172111, 0.3040449, 1.650169, 1, 0, 0.8156863, 1,
1.178445, -1.995828, 1.270101, 1, 0, 0.8117647, 1,
1.178457, 0.03025202, 1.698676, 1, 0, 0.8039216, 1,
1.180434, -0.4050686, 2.638265, 1, 0, 0.7960784, 1,
1.182104, 1.047604, 0.5747729, 1, 0, 0.7921569, 1,
1.186998, 1.653185, 1.870372, 1, 0, 0.7843137, 1,
1.187941, -1.242343, 1.302119, 1, 0, 0.7803922, 1,
1.198691, 0.6893681, 0.9307565, 1, 0, 0.772549, 1,
1.201653, -0.4971929, 1.520842, 1, 0, 0.7686275, 1,
1.225238, -0.9453266, 0.2532934, 1, 0, 0.7607843, 1,
1.226353, 0.5944539, 0.3243298, 1, 0, 0.7568628, 1,
1.23439, 1.267846, 1.592537, 1, 0, 0.7490196, 1,
1.235338, 0.2434641, 0.6018841, 1, 0, 0.7450981, 1,
1.237435, -0.04381729, 1.688936, 1, 0, 0.7372549, 1,
1.238884, -0.2572836, 2.395508, 1, 0, 0.7333333, 1,
1.243245, 0.281963, 1.319512, 1, 0, 0.7254902, 1,
1.248823, 1.252204, 0.1529333, 1, 0, 0.7215686, 1,
1.255291, 0.03856646, 3.153187, 1, 0, 0.7137255, 1,
1.256176, 0.5611477, 0.7084286, 1, 0, 0.7098039, 1,
1.268879, 1.151202, 3.325547, 1, 0, 0.7019608, 1,
1.276043, -0.6849498, 2.847259, 1, 0, 0.6941177, 1,
1.287589, -0.06143885, 1.88289, 1, 0, 0.6901961, 1,
1.309361, -0.3270649, -0.4291065, 1, 0, 0.682353, 1,
1.312463, -1.778828, 0.9789894, 1, 0, 0.6784314, 1,
1.321869, -0.4625117, 1.117255, 1, 0, 0.6705883, 1,
1.325459, -1.079443, 0.7490512, 1, 0, 0.6666667, 1,
1.331618, 1.447396, -1.342429, 1, 0, 0.6588235, 1,
1.336092, -0.5423343, 2.671875, 1, 0, 0.654902, 1,
1.33686, -2.169673, 1.907026, 1, 0, 0.6470588, 1,
1.34152, -2.088852, 2.625394, 1, 0, 0.6431373, 1,
1.342092, 1.466642, -1.286425, 1, 0, 0.6352941, 1,
1.345752, -1.294174, 2.474685, 1, 0, 0.6313726, 1,
1.348502, -0.9252369, 1.09576, 1, 0, 0.6235294, 1,
1.348714, 0.8222409, 0.1400935, 1, 0, 0.6196079, 1,
1.349136, 0.6761398, 2.046472, 1, 0, 0.6117647, 1,
1.355022, 0.6378046, 0.4919829, 1, 0, 0.6078432, 1,
1.357033, 1.5778, 0.3871364, 1, 0, 0.6, 1,
1.357364, -1.300816, 3.647063, 1, 0, 0.5921569, 1,
1.364637, -1.232392, 0.2700279, 1, 0, 0.5882353, 1,
1.368918, -0.7283887, 1.808668, 1, 0, 0.5803922, 1,
1.372686, 0.1614202, 2.671965, 1, 0, 0.5764706, 1,
1.378193, 0.2514334, 2.207802, 1, 0, 0.5686275, 1,
1.378946, 0.2353127, 2.561761, 1, 0, 0.5647059, 1,
1.379102, 0.4083778, 0.2911263, 1, 0, 0.5568628, 1,
1.382314, -0.06012053, 4.242759, 1, 0, 0.5529412, 1,
1.38338, 1.61838, 1.259927, 1, 0, 0.5450981, 1,
1.419237, 0.7733856, 1.58522, 1, 0, 0.5411765, 1,
1.420387, 1.341976, -0.1450716, 1, 0, 0.5333334, 1,
1.422962, -2.239299, 2.11357, 1, 0, 0.5294118, 1,
1.423706, -0.6261905, 2.369356, 1, 0, 0.5215687, 1,
1.423824, -0.9637216, 2.065578, 1, 0, 0.5176471, 1,
1.425453, 0.2386551, 0.2734712, 1, 0, 0.509804, 1,
1.430186, -1.306062, 1.792089, 1, 0, 0.5058824, 1,
1.440176, -0.1855809, 2.285994, 1, 0, 0.4980392, 1,
1.446203, 1.15524, 0.2404723, 1, 0, 0.4901961, 1,
1.446789, -0.9399022, 2.748231, 1, 0, 0.4862745, 1,
1.462308, 1.625238, 1.306587, 1, 0, 0.4784314, 1,
1.472593, -0.2170194, 0.002617427, 1, 0, 0.4745098, 1,
1.477071, -0.2147902, 2.006133, 1, 0, 0.4666667, 1,
1.478836, 0.05500929, 2.28055, 1, 0, 0.4627451, 1,
1.483832, 1.047073, 2.038919, 1, 0, 0.454902, 1,
1.501336, 1.313734, 0.7536485, 1, 0, 0.4509804, 1,
1.517104, 0.107576, 1.530002, 1, 0, 0.4431373, 1,
1.518828, 1.272876, 1.356625, 1, 0, 0.4392157, 1,
1.523748, -0.2824069, 2.32869, 1, 0, 0.4313726, 1,
1.530457, -1.080358, 1.182055, 1, 0, 0.427451, 1,
1.539837, 1.280522, 2.706069, 1, 0, 0.4196078, 1,
1.54548, -0.4860218, 2.008506, 1, 0, 0.4156863, 1,
1.56989, -1.053888, 3.225796, 1, 0, 0.4078431, 1,
1.578901, -0.4631305, 1.073246, 1, 0, 0.4039216, 1,
1.581846, -2.391751, 1.990986, 1, 0, 0.3960784, 1,
1.588146, -1.377319, 3.023517, 1, 0, 0.3882353, 1,
1.58983, 1.793128, 1.863107, 1, 0, 0.3843137, 1,
1.592478, -0.5140525, 1.827323, 1, 0, 0.3764706, 1,
1.592927, -0.545527, 1.971673, 1, 0, 0.372549, 1,
1.599005, 0.334636, 2.132981, 1, 0, 0.3647059, 1,
1.607949, -0.4120634, 1.577246, 1, 0, 0.3607843, 1,
1.621471, 0.6475858, 1.393878, 1, 0, 0.3529412, 1,
1.641875, 0.02499994, 0.3614794, 1, 0, 0.3490196, 1,
1.646653, -0.4258026, 3.007668, 1, 0, 0.3411765, 1,
1.662575, -0.9839536, 1.815512, 1, 0, 0.3372549, 1,
1.664576, -0.1550638, 2.960709, 1, 0, 0.3294118, 1,
1.668704, -0.8757815, 1.370572, 1, 0, 0.3254902, 1,
1.669651, 0.6536464, 1.239901, 1, 0, 0.3176471, 1,
1.671863, 0.7413571, -0.9600903, 1, 0, 0.3137255, 1,
1.679608, 0.9111266, -0.4063674, 1, 0, 0.3058824, 1,
1.684804, -0.1455205, 1.16738, 1, 0, 0.2980392, 1,
1.687979, 1.102728, -0.1944358, 1, 0, 0.2941177, 1,
1.688249, 0.6804404, 0.6069713, 1, 0, 0.2862745, 1,
1.690362, -0.6455563, 4.490856, 1, 0, 0.282353, 1,
1.71349, 0.949112, 0.904696, 1, 0, 0.2745098, 1,
1.721895, 2.484193, -0.8343295, 1, 0, 0.2705882, 1,
1.722249, 0.08949059, 1.87589, 1, 0, 0.2627451, 1,
1.72341, -0.3450444, 0.5465785, 1, 0, 0.2588235, 1,
1.742168, -0.1585851, 3.086711, 1, 0, 0.2509804, 1,
1.752333, -0.5278137, 0.747131, 1, 0, 0.2470588, 1,
1.753083, -0.3206402, 1.920114, 1, 0, 0.2392157, 1,
1.758248, 0.08137887, 0.09715258, 1, 0, 0.2352941, 1,
1.776131, -0.82851, 1.02435, 1, 0, 0.227451, 1,
1.777958, 1.764814, 1.203176, 1, 0, 0.2235294, 1,
1.778865, -0.115022, -0.01621114, 1, 0, 0.2156863, 1,
1.78677, 0.8090326, -0.5917416, 1, 0, 0.2117647, 1,
1.82732, 0.4691611, 0.1615304, 1, 0, 0.2039216, 1,
1.831733, 0.3903676, 2.037999, 1, 0, 0.1960784, 1,
1.838427, 1.77802, 1.402867, 1, 0, 0.1921569, 1,
1.850741, 0.6015819, 1.052348, 1, 0, 0.1843137, 1,
1.856755, -0.245459, 0.6585335, 1, 0, 0.1803922, 1,
1.857748, -0.8692114, 0.7992744, 1, 0, 0.172549, 1,
1.869255, 0.129529, 0.6877042, 1, 0, 0.1686275, 1,
1.880014, 0.3669374, -0.07698879, 1, 0, 0.1607843, 1,
1.905601, 1.071046, 1.252706, 1, 0, 0.1568628, 1,
1.90935, -0.7899455, 1.95882, 1, 0, 0.1490196, 1,
1.913191, -0.2144974, 0.5584639, 1, 0, 0.145098, 1,
1.934211, 0.9158555, -0.5745778, 1, 0, 0.1372549, 1,
1.937833, -0.01411971, 3.290937, 1, 0, 0.1333333, 1,
1.946215, -2.922534, 1.921762, 1, 0, 0.1254902, 1,
2.005642, -2.106837, 4.708282, 1, 0, 0.1215686, 1,
2.024094, -1.999811, 3.564396, 1, 0, 0.1137255, 1,
2.047749, 0.06209902, 1.120714, 1, 0, 0.1098039, 1,
2.056372, -0.3270657, 0.2397612, 1, 0, 0.1019608, 1,
2.09687, -1.379858, 0.8672444, 1, 0, 0.09411765, 1,
2.097193, 1.339284, -0.099595, 1, 0, 0.09019608, 1,
2.098239, -0.4879364, 1.240276, 1, 0, 0.08235294, 1,
2.116549, 0.05138298, 2.422852, 1, 0, 0.07843138, 1,
2.175388, 0.2753946, 0.3053327, 1, 0, 0.07058824, 1,
2.188341, -0.4681551, 1.471087, 1, 0, 0.06666667, 1,
2.213096, 0.7824994, 1.274442, 1, 0, 0.05882353, 1,
2.322576, -1.155538, 2.060287, 1, 0, 0.05490196, 1,
2.340111, -0.8584628, 2.663403, 1, 0, 0.04705882, 1,
2.408871, 0.9062626, 0.02958321, 1, 0, 0.04313726, 1,
2.458089, 0.8053485, 1.059669, 1, 0, 0.03529412, 1,
2.538435, -0.8780722, 2.843537, 1, 0, 0.03137255, 1,
2.549218, 0.6183347, 1.933056, 1, 0, 0.02352941, 1,
2.57801, 0.5120791, 1.567933, 1, 0, 0.01960784, 1,
2.63042, -1.032871, 1.962023, 1, 0, 0.01176471, 1,
3.319029, -0.04457391, 1.55416, 1, 0, 0.007843138, 1
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
0.3133097, -3.894252, -7.572833, 0, -0.5, 0.5, 0.5,
0.3133097, -3.894252, -7.572833, 1, -0.5, 0.5, 0.5,
0.3133097, -3.894252, -7.572833, 1, 1.5, 0.5, 0.5,
0.3133097, -3.894252, -7.572833, 0, 1.5, 0.5, 0.5
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
-3.711348, -0.05610693, -7.572833, 0, -0.5, 0.5, 0.5,
-3.711348, -0.05610693, -7.572833, 1, -0.5, 0.5, 0.5,
-3.711348, -0.05610693, -7.572833, 1, 1.5, 0.5, 0.5,
-3.711348, -0.05610693, -7.572833, 0, 1.5, 0.5, 0.5
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
-3.711348, -3.894252, -0.483923, 0, -0.5, 0.5, 0.5,
-3.711348, -3.894252, -0.483923, 1, -0.5, 0.5, 0.5,
-3.711348, -3.894252, -0.483923, 1, 1.5, 0.5, 0.5,
-3.711348, -3.894252, -0.483923, 0, 1.5, 0.5, 0.5
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
-2, -3.008526, -5.936931,
3, -3.008526, -5.936931,
-2, -3.008526, -5.936931,
-2, -3.156147, -6.209581,
-1, -3.008526, -5.936931,
-1, -3.156147, -6.209581,
0, -3.008526, -5.936931,
0, -3.156147, -6.209581,
1, -3.008526, -5.936931,
1, -3.156147, -6.209581,
2, -3.008526, -5.936931,
2, -3.156147, -6.209581,
3, -3.008526, -5.936931,
3, -3.156147, -6.209581
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
-2, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
-2, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
-2, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
-2, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5,
-1, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
-1, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
-1, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
-1, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5,
0, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
0, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
0, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
0, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5,
1, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
1, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
1, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
1, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5,
2, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
2, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
2, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
2, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5,
3, -3.451389, -6.754882, 0, -0.5, 0.5, 0.5,
3, -3.451389, -6.754882, 1, -0.5, 0.5, 0.5,
3, -3.451389, -6.754882, 1, 1.5, 0.5, 0.5,
3, -3.451389, -6.754882, 0, 1.5, 0.5, 0.5
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
-2.782581, -2, -5.936931,
-2.782581, 2, -5.936931,
-2.782581, -2, -5.936931,
-2.937376, -2, -6.209581,
-2.782581, -1, -5.936931,
-2.937376, -1, -6.209581,
-2.782581, 0, -5.936931,
-2.937376, 0, -6.209581,
-2.782581, 1, -5.936931,
-2.937376, 1, -6.209581,
-2.782581, 2, -5.936931,
-2.937376, 2, -6.209581
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
-3.246965, -2, -6.754882, 0, -0.5, 0.5, 0.5,
-3.246965, -2, -6.754882, 1, -0.5, 0.5, 0.5,
-3.246965, -2, -6.754882, 1, 1.5, 0.5, 0.5,
-3.246965, -2, -6.754882, 0, 1.5, 0.5, 0.5,
-3.246965, -1, -6.754882, 0, -0.5, 0.5, 0.5,
-3.246965, -1, -6.754882, 1, -0.5, 0.5, 0.5,
-3.246965, -1, -6.754882, 1, 1.5, 0.5, 0.5,
-3.246965, -1, -6.754882, 0, 1.5, 0.5, 0.5,
-3.246965, 0, -6.754882, 0, -0.5, 0.5, 0.5,
-3.246965, 0, -6.754882, 1, -0.5, 0.5, 0.5,
-3.246965, 0, -6.754882, 1, 1.5, 0.5, 0.5,
-3.246965, 0, -6.754882, 0, 1.5, 0.5, 0.5,
-3.246965, 1, -6.754882, 0, -0.5, 0.5, 0.5,
-3.246965, 1, -6.754882, 1, -0.5, 0.5, 0.5,
-3.246965, 1, -6.754882, 1, 1.5, 0.5, 0.5,
-3.246965, 1, -6.754882, 0, 1.5, 0.5, 0.5,
-3.246965, 2, -6.754882, 0, -0.5, 0.5, 0.5,
-3.246965, 2, -6.754882, 1, -0.5, 0.5, 0.5,
-3.246965, 2, -6.754882, 1, 1.5, 0.5, 0.5,
-3.246965, 2, -6.754882, 0, 1.5, 0.5, 0.5
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
-2.782581, -3.008526, -4,
-2.782581, -3.008526, 4,
-2.782581, -3.008526, -4,
-2.937376, -3.156147, -4,
-2.782581, -3.008526, -2,
-2.937376, -3.156147, -2,
-2.782581, -3.008526, 0,
-2.937376, -3.156147, 0,
-2.782581, -3.008526, 2,
-2.937376, -3.156147, 2,
-2.782581, -3.008526, 4,
-2.937376, -3.156147, 4
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
-3.246965, -3.451389, -4, 0, -0.5, 0.5, 0.5,
-3.246965, -3.451389, -4, 1, -0.5, 0.5, 0.5,
-3.246965, -3.451389, -4, 1, 1.5, 0.5, 0.5,
-3.246965, -3.451389, -4, 0, 1.5, 0.5, 0.5,
-3.246965, -3.451389, -2, 0, -0.5, 0.5, 0.5,
-3.246965, -3.451389, -2, 1, -0.5, 0.5, 0.5,
-3.246965, -3.451389, -2, 1, 1.5, 0.5, 0.5,
-3.246965, -3.451389, -2, 0, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 0, 0, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 0, 1, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 0, 1, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 0, 0, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 2, 0, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 2, 1, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 2, 1, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 2, 0, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 4, 0, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 4, 1, -0.5, 0.5, 0.5,
-3.246965, -3.451389, 4, 1, 1.5, 0.5, 0.5,
-3.246965, -3.451389, 4, 0, 1.5, 0.5, 0.5
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
-2.782581, -3.008526, -5.936931,
-2.782581, 2.896312, -5.936931,
-2.782581, -3.008526, 4.969085,
-2.782581, 2.896312, 4.969085,
-2.782581, -3.008526, -5.936931,
-2.782581, -3.008526, 4.969085,
-2.782581, 2.896312, -5.936931,
-2.782581, 2.896312, 4.969085,
-2.782581, -3.008526, -5.936931,
3.4092, -3.008526, -5.936931,
-2.782581, -3.008526, 4.969085,
3.4092, -3.008526, 4.969085,
-2.782581, 2.896312, -5.936931,
3.4092, 2.896312, -5.936931,
-2.782581, 2.896312, 4.969085,
3.4092, 2.896312, 4.969085,
3.4092, -3.008526, -5.936931,
3.4092, 2.896312, -5.936931,
3.4092, -3.008526, 4.969085,
3.4092, 2.896312, 4.969085,
3.4092, -3.008526, -5.936931,
3.4092, -3.008526, 4.969085,
3.4092, 2.896312, -5.936931,
3.4092, 2.896312, 4.969085
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
var radius = 7.401873;
var distance = 32.93177;
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
mvMatrix.translate( -0.3133097, 0.05610693, 0.483923 );
mvMatrix.scale( 1.292528, 1.355338, 0.7338198 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.93177);
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
fenhexamid<-read.table("fenhexamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenhexamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenhexamid' not found
```

```r
y<-fenhexamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenhexamid' not found
```

```r
z<-fenhexamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenhexamid' not found
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
-2.69241, 0.03376481, -0.696959, 0, 0, 1, 1, 1,
-2.580667, -0.1594155, -5.778105, 1, 0, 0, 1, 1,
-2.528916, -2.632572, -1.566924, 1, 0, 0, 1, 1,
-2.43673, -0.4057502, -0.6736677, 1, 0, 0, 1, 1,
-2.431948, 0.5980009, -1.612495, 1, 0, 0, 1, 1,
-2.416492, 0.4823584, -1.600612, 1, 0, 0, 1, 1,
-2.315897, 0.8431441, -2.288531, 0, 0, 0, 1, 1,
-2.290462, -0.1682453, -1.343741, 0, 0, 0, 1, 1,
-2.290345, 0.3530306, -1.138038, 0, 0, 0, 1, 1,
-2.267295, -0.3108903, -1.717531, 0, 0, 0, 1, 1,
-2.246558, -0.3468472, -0.7124706, 0, 0, 0, 1, 1,
-2.090712, -1.929369, -3.367382, 0, 0, 0, 1, 1,
-2.024388, 0.3250293, -1.362095, 0, 0, 0, 1, 1,
-2.018697, 0.6095906, -0.8524595, 1, 1, 1, 1, 1,
-2.012176, 1.33994, -2.059217, 1, 1, 1, 1, 1,
-1.981765, -0.4922786, -0.533419, 1, 1, 1, 1, 1,
-1.979307, 0.8964222, -1.051005, 1, 1, 1, 1, 1,
-1.954538, -0.6622679, -2.619533, 1, 1, 1, 1, 1,
-1.947342, -1.32042, -1.471726, 1, 1, 1, 1, 1,
-1.943322, 0.1408389, -2.638189, 1, 1, 1, 1, 1,
-1.928938, 1.128073, -1.514759, 1, 1, 1, 1, 1,
-1.926124, 0.3054264, -2.31772, 1, 1, 1, 1, 1,
-1.919683, 0.5571358, 0.07206742, 1, 1, 1, 1, 1,
-1.899934, 1.710376, -1.673887, 1, 1, 1, 1, 1,
-1.881163, 0.2534952, -1.357229, 1, 1, 1, 1, 1,
-1.863818, 0.07737301, -2.897072, 1, 1, 1, 1, 1,
-1.854611, -2.111876, -1.864445, 1, 1, 1, 1, 1,
-1.84585, -0.06284019, -3.487994, 1, 1, 1, 1, 1,
-1.832494, 1.242981, -1.77126, 0, 0, 1, 1, 1,
-1.80527, -0.3418978, -0.9983938, 1, 0, 0, 1, 1,
-1.78033, 0.5295393, -1.86527, 1, 0, 0, 1, 1,
-1.774869, 1.306571, -2.468959, 1, 0, 0, 1, 1,
-1.769355, -0.03363908, -0.8550329, 1, 0, 0, 1, 1,
-1.764181, -0.3257921, -0.8761103, 1, 0, 0, 1, 1,
-1.742256, 1.596638, -1.735813, 0, 0, 0, 1, 1,
-1.738931, -0.8885891, -1.263772, 0, 0, 0, 1, 1,
-1.7386, 0.6042657, -0.5701393, 0, 0, 0, 1, 1,
-1.710789, -1.726894, -2.809722, 0, 0, 0, 1, 1,
-1.709025, 0.1331689, -2.448681, 0, 0, 0, 1, 1,
-1.707645, 0.6035081, -2.192691, 0, 0, 0, 1, 1,
-1.706396, 0.04346411, -2.655427, 0, 0, 0, 1, 1,
-1.680811, 1.756632, -0.9791924, 1, 1, 1, 1, 1,
-1.659475, -1.134229, -1.513903, 1, 1, 1, 1, 1,
-1.615628, 1.129697, -2.134716, 1, 1, 1, 1, 1,
-1.598092, -0.3526833, -2.826162, 1, 1, 1, 1, 1,
-1.591915, -1.712613, -2.742664, 1, 1, 1, 1, 1,
-1.570656, -1.188673, -1.28859, 1, 1, 1, 1, 1,
-1.544262, 0.669903, -0.5571315, 1, 1, 1, 1, 1,
-1.53427, -1.193101, -3.272502, 1, 1, 1, 1, 1,
-1.511387, -1.312467, -2.612583, 1, 1, 1, 1, 1,
-1.509702, 1.551488, -0.467374, 1, 1, 1, 1, 1,
-1.503604, -0.8919398, -3.314836, 1, 1, 1, 1, 1,
-1.489801, 0.2034019, -0.7569501, 1, 1, 1, 1, 1,
-1.483465, -0.332752, -0.09309258, 1, 1, 1, 1, 1,
-1.455534, -0.5471148, -0.3899182, 1, 1, 1, 1, 1,
-1.454776, 0.366208, -0.5437552, 1, 1, 1, 1, 1,
-1.45157, 0.2919803, -1.104001, 0, 0, 1, 1, 1,
-1.44934, -0.5051636, -2.170954, 1, 0, 0, 1, 1,
-1.433619, 2.068657, -0.9421464, 1, 0, 0, 1, 1,
-1.42653, 0.08011144, -1.646054, 1, 0, 0, 1, 1,
-1.41139, -1.420653, -3.141016, 1, 0, 0, 1, 1,
-1.39289, -2.393584, -0.03618393, 1, 0, 0, 1, 1,
-1.391469, -0.5863358, -3.350266, 0, 0, 0, 1, 1,
-1.385897, 0.9737102, -2.351071, 0, 0, 0, 1, 1,
-1.381947, 0.490592, -1.333053, 0, 0, 0, 1, 1,
-1.374208, -0.4477934, -2.554073, 0, 0, 0, 1, 1,
-1.36053, 0.5964513, -1.327281, 0, 0, 0, 1, 1,
-1.35116, -1.162981, -2.443052, 0, 0, 0, 1, 1,
-1.346572, 2.516428, -0.6119804, 0, 0, 0, 1, 1,
-1.340539, 2.496692, -0.1160452, 1, 1, 1, 1, 1,
-1.340356, -0.05613415, 0.1892096, 1, 1, 1, 1, 1,
-1.332294, -0.9526388, -2.379238, 1, 1, 1, 1, 1,
-1.323928, -0.2232859, -1.100371, 1, 1, 1, 1, 1,
-1.32167, -0.6179491, -1.803249, 1, 1, 1, 1, 1,
-1.30907, -1.318829, -3.000348, 1, 1, 1, 1, 1,
-1.300077, -1.144603, -2.864953, 1, 1, 1, 1, 1,
-1.291267, 2.332518, 0.4431152, 1, 1, 1, 1, 1,
-1.286837, 1.248079, 0.8135183, 1, 1, 1, 1, 1,
-1.279222, 0.1307447, 0.9339933, 1, 1, 1, 1, 1,
-1.278688, -2.636266, -2.345482, 1, 1, 1, 1, 1,
-1.272774, -1.326761, -1.648396, 1, 1, 1, 1, 1,
-1.266933, -1.042492, -0.7895214, 1, 1, 1, 1, 1,
-1.265201, 1.953655, -0.6469778, 1, 1, 1, 1, 1,
-1.256012, 1.292732, 0.2564074, 1, 1, 1, 1, 1,
-1.246419, -0.8783942, -1.918867, 0, 0, 1, 1, 1,
-1.24186, 0.0436236, -0.8091443, 1, 0, 0, 1, 1,
-1.241244, 0.79223, -1.09183, 1, 0, 0, 1, 1,
-1.236266, -1.436038, -3.860053, 1, 0, 0, 1, 1,
-1.236038, 0.1407862, -2.535354, 1, 0, 0, 1, 1,
-1.221903, -0.1618585, -0.9550033, 1, 0, 0, 1, 1,
-1.216434, 0.6702241, -1.260064, 0, 0, 0, 1, 1,
-1.205792, 0.2322742, -3.787551, 0, 0, 0, 1, 1,
-1.202821, -1.377088, -2.852218, 0, 0, 0, 1, 1,
-1.197361, -0.2387363, -0.6859051, 0, 0, 0, 1, 1,
-1.196904, -0.7820424, -3.421491, 0, 0, 0, 1, 1,
-1.185102, -0.3690445, -2.967854, 0, 0, 0, 1, 1,
-1.180016, 1.690904, 1.718692, 0, 0, 0, 1, 1,
-1.173139, -1.148052, -1.830914, 1, 1, 1, 1, 1,
-1.169873, -1.831764, -1.961374, 1, 1, 1, 1, 1,
-1.168902, -1.884413, -2.861304, 1, 1, 1, 1, 1,
-1.166848, 1.042539, -0.7904729, 1, 1, 1, 1, 1,
-1.161536, -1.122431, -2.267655, 1, 1, 1, 1, 1,
-1.152483, -0.8857927, -1.957313, 1, 1, 1, 1, 1,
-1.142761, -0.200119, 1.059165, 1, 1, 1, 1, 1,
-1.140189, 0.07035425, 0.09883711, 1, 1, 1, 1, 1,
-1.137414, -0.5803668, -1.515845, 1, 1, 1, 1, 1,
-1.136018, -1.151741, -2.596704, 1, 1, 1, 1, 1,
-1.135675, 1.471779, -1.739106, 1, 1, 1, 1, 1,
-1.134184, -0.01370494, -1.753239, 1, 1, 1, 1, 1,
-1.12906, 1.014322, -1.87125, 1, 1, 1, 1, 1,
-1.129031, 0.2023739, -1.415284, 1, 1, 1, 1, 1,
-1.128595, 0.9052877, -1.609782, 1, 1, 1, 1, 1,
-1.123365, 1.871692, -1.836289, 0, 0, 1, 1, 1,
-1.117242, -0.1515861, -1.177404, 1, 0, 0, 1, 1,
-1.115905, 0.7633314, 0.1258102, 1, 0, 0, 1, 1,
-1.113868, -0.6444191, -2.825642, 1, 0, 0, 1, 1,
-1.110745, 0.6525109, -1.906156, 1, 0, 0, 1, 1,
-1.107876, 0.3742505, -1.319372, 1, 0, 0, 1, 1,
-1.107622, -0.7910874, -2.257975, 0, 0, 0, 1, 1,
-1.107418, 0.7481532, 0.2546011, 0, 0, 0, 1, 1,
-1.103022, -0.8709334, -3.008673, 0, 0, 0, 1, 1,
-1.102407, 0.3476402, -0.7119611, 0, 0, 0, 1, 1,
-1.093454, -0.361027, -0.3619951, 0, 0, 0, 1, 1,
-1.092473, 1.912678, 1.007976, 0, 0, 0, 1, 1,
-1.08957, -1.193946, -2.511235, 0, 0, 0, 1, 1,
-1.081799, 0.5318921, -2.081878, 1, 1, 1, 1, 1,
-1.074076, -0.2223171, -2.787307, 1, 1, 1, 1, 1,
-1.073945, 0.08725429, -1.510414, 1, 1, 1, 1, 1,
-1.070021, -0.9549421, -1.468761, 1, 1, 1, 1, 1,
-1.066085, 0.699979, -0.9975271, 1, 1, 1, 1, 1,
-1.063791, 1.623855, 0.8115067, 1, 1, 1, 1, 1,
-1.058384, 0.4516966, -0.9148424, 1, 1, 1, 1, 1,
-1.056696, 0.1063194, -0.5991827, 1, 1, 1, 1, 1,
-1.048245, -0.3870951, 0.6634243, 1, 1, 1, 1, 1,
-1.046302, -0.7431026, -4.099225, 1, 1, 1, 1, 1,
-1.039021, -0.312899, -1.047994, 1, 1, 1, 1, 1,
-1.03853, -0.7120416, -1.82483, 1, 1, 1, 1, 1,
-1.035816, 0.8256614, -1.692541, 1, 1, 1, 1, 1,
-1.03427, 0.6189039, -1.196059, 1, 1, 1, 1, 1,
-1.028311, -0.3606369, -1.103782, 1, 1, 1, 1, 1,
-1.019902, -0.4005231, -1.394118, 0, 0, 1, 1, 1,
-1.012321, 0.925339, -1.096885, 1, 0, 0, 1, 1,
-1.007498, -0.8815423, -1.699495, 1, 0, 0, 1, 1,
-1.006837, 2.42065, -1.935766, 1, 0, 0, 1, 1,
-1.004643, -0.02737886, -1.282407, 1, 0, 0, 1, 1,
-1.002583, -0.8461615, -1.586584, 1, 0, 0, 1, 1,
-0.9990005, 0.6128742, 0.2536812, 0, 0, 0, 1, 1,
-0.9925425, 0.2200932, -1.332613, 0, 0, 0, 1, 1,
-0.9858627, 0.8047807, 0.4560987, 0, 0, 0, 1, 1,
-0.9846561, -0.2704069, -0.4266339, 0, 0, 0, 1, 1,
-0.9825763, -0.2573366, -1.948173, 0, 0, 0, 1, 1,
-0.9824226, 0.9273341, 1.742316, 0, 0, 0, 1, 1,
-0.9734604, 0.316195, -1.215241, 0, 0, 0, 1, 1,
-0.9681883, 1.978788, -1.144874, 1, 1, 1, 1, 1,
-0.9609606, -0.4737371, -2.787562, 1, 1, 1, 1, 1,
-0.9483096, -2.464502, -2.248173, 1, 1, 1, 1, 1,
-0.9449053, 1.331063, 1.570889, 1, 1, 1, 1, 1,
-0.9410177, -0.1664974, -1.265211, 1, 1, 1, 1, 1,
-0.9406657, 0.4952829, -1.55566, 1, 1, 1, 1, 1,
-0.9393728, 0.8527084, -2.270844, 1, 1, 1, 1, 1,
-0.9328411, 0.6241987, -1.217496, 1, 1, 1, 1, 1,
-0.9277832, 1.329886, 0.9488094, 1, 1, 1, 1, 1,
-0.924218, -0.3911758, -2.967498, 1, 1, 1, 1, 1,
-0.9213707, -1.065317, -1.957641, 1, 1, 1, 1, 1,
-0.9119952, -0.3114163, -1.175293, 1, 1, 1, 1, 1,
-0.9118035, 0.2346665, -1.264301, 1, 1, 1, 1, 1,
-0.9112146, 1.276945, -1.73146, 1, 1, 1, 1, 1,
-0.909707, -0.3610191, -0.8481307, 1, 1, 1, 1, 1,
-0.9061234, -0.02978104, -1.687418, 0, 0, 1, 1, 1,
-0.8915948, -0.7004169, -2.530635, 1, 0, 0, 1, 1,
-0.8881016, -0.3897938, -1.20746, 1, 0, 0, 1, 1,
-0.8856315, -0.8827114, -3.082249, 1, 0, 0, 1, 1,
-0.8740765, -2.007107, -2.499285, 1, 0, 0, 1, 1,
-0.8721508, 0.8900985, -0.4938942, 1, 0, 0, 1, 1,
-0.8696337, 1.246973, -1.463392, 0, 0, 0, 1, 1,
-0.8695915, 0.009627464, -1.99237, 0, 0, 0, 1, 1,
-0.867917, 0.549765, 0.8646196, 0, 0, 0, 1, 1,
-0.8672143, 0.9558069, -0.9809992, 0, 0, 0, 1, 1,
-0.8660339, 1.311659, -1.342259, 0, 0, 0, 1, 1,
-0.8600101, 1.356762, -2.175177, 0, 0, 0, 1, 1,
-0.85348, -0.108097, -1.07776, 0, 0, 0, 1, 1,
-0.8513066, -0.2012658, -1.287333, 1, 1, 1, 1, 1,
-0.8449351, -1.301857, -1.694156, 1, 1, 1, 1, 1,
-0.8422912, -0.3318349, -1.893201, 1, 1, 1, 1, 1,
-0.8407359, -1.565245, -1.870489, 1, 1, 1, 1, 1,
-0.8403559, 0.3447575, -1.038347, 1, 1, 1, 1, 1,
-0.8380793, 0.6738104, 0.631349, 1, 1, 1, 1, 1,
-0.8277401, -0.8214475, -2.499068, 1, 1, 1, 1, 1,
-0.8256378, -1.066856, -1.702742, 1, 1, 1, 1, 1,
-0.8253981, 1.481763, -1.741084, 1, 1, 1, 1, 1,
-0.820704, -0.5043069, -2.387709, 1, 1, 1, 1, 1,
-0.8160706, 0.07612482, -0.7953752, 1, 1, 1, 1, 1,
-0.8139259, -0.1811862, -1.806134, 1, 1, 1, 1, 1,
-0.8129537, -0.2679, -0.8409808, 1, 1, 1, 1, 1,
-0.812499, -0.7095168, -0.4414646, 1, 1, 1, 1, 1,
-0.8111454, 0.8552257, -1.146948, 1, 1, 1, 1, 1,
-0.8033476, -0.9238832, -2.552162, 0, 0, 1, 1, 1,
-0.8018765, -2.09584, -3.072754, 1, 0, 0, 1, 1,
-0.8003449, -0.2299924, -1.206632, 1, 0, 0, 1, 1,
-0.7972876, -0.8788999, -2.270183, 1, 0, 0, 1, 1,
-0.7959251, 0.04939461, 0.01217979, 1, 0, 0, 1, 1,
-0.7908866, 0.4432664, -0.2332274, 1, 0, 0, 1, 1,
-0.78479, -0.5625951, -3.739979, 0, 0, 0, 1, 1,
-0.7781341, -0.7421223, -2.427168, 0, 0, 0, 1, 1,
-0.7770755, 0.5192381, 1.212136, 0, 0, 0, 1, 1,
-0.7680453, 1.659261, -0.9769444, 0, 0, 0, 1, 1,
-0.7653667, 1.056329, 0.1584248, 0, 0, 0, 1, 1,
-0.7646019, -0.5064049, -3.359533, 0, 0, 0, 1, 1,
-0.7615768, 0.5695984, 0.5140111, 0, 0, 0, 1, 1,
-0.7607118, -0.7063088, -1.509748, 1, 1, 1, 1, 1,
-0.7601664, 0.4889693, 0.180731, 1, 1, 1, 1, 1,
-0.7561709, 0.6060708, -1.95181, 1, 1, 1, 1, 1,
-0.7547818, -0.4103372, -1.565621, 1, 1, 1, 1, 1,
-0.7547478, -0.9933106, -3.026842, 1, 1, 1, 1, 1,
-0.7533681, 0.1352507, -0.9431899, 1, 1, 1, 1, 1,
-0.7528268, -0.1170277, -1.605405, 1, 1, 1, 1, 1,
-0.7497886, 0.3931328, -3.407853, 1, 1, 1, 1, 1,
-0.7459965, -0.4961835, -2.418151, 1, 1, 1, 1, 1,
-0.7342528, -0.7991279, -1.286853, 1, 1, 1, 1, 1,
-0.7284053, -0.1604876, -1.688373, 1, 1, 1, 1, 1,
-0.7249345, -0.3770808, 0.09759003, 1, 1, 1, 1, 1,
-0.7242067, 0.6194131, -0.4151596, 1, 1, 1, 1, 1,
-0.7229789, 0.7539043, -0.09660257, 1, 1, 1, 1, 1,
-0.72026, -0.2343928, -2.025475, 1, 1, 1, 1, 1,
-0.7178017, -0.7771581, -2.872111, 0, 0, 1, 1, 1,
-0.7164764, 1.663432, 2.40166, 1, 0, 0, 1, 1,
-0.7164459, 0.1287423, -0.4261298, 1, 0, 0, 1, 1,
-0.7163295, 1.809887, -1.25339, 1, 0, 0, 1, 1,
-0.7149939, -0.8873255, -1.751775, 1, 0, 0, 1, 1,
-0.713094, 0.7159185, -0.5342245, 1, 0, 0, 1, 1,
-0.7107354, -0.2599727, -2.006993, 0, 0, 0, 1, 1,
-0.7106668, -0.4548393, -0.6071802, 0, 0, 0, 1, 1,
-0.7074684, 0.7368818, -0.2636856, 0, 0, 0, 1, 1,
-0.7001603, -1.520124, -2.150177, 0, 0, 0, 1, 1,
-0.6968002, 1.757973, -0.6950493, 0, 0, 0, 1, 1,
-0.6964544, -0.2357281, -0.1666202, 0, 0, 0, 1, 1,
-0.6941453, 0.04973668, -1.929595, 0, 0, 0, 1, 1,
-0.6940081, 1.035998, -1.642313, 1, 1, 1, 1, 1,
-0.6932566, -1.649323, -2.68335, 1, 1, 1, 1, 1,
-0.6897209, -0.8939839, -3.7137, 1, 1, 1, 1, 1,
-0.6859591, 0.7074583, -0.3574511, 1, 1, 1, 1, 1,
-0.6778639, 2.169688, -1.417729, 1, 1, 1, 1, 1,
-0.6748642, -0.799011, -2.63597, 1, 1, 1, 1, 1,
-0.6646935, -1.291348, -2.211103, 1, 1, 1, 1, 1,
-0.6519001, -0.4843772, -2.617026, 1, 1, 1, 1, 1,
-0.6497438, 0.02764079, -1.344169, 1, 1, 1, 1, 1,
-0.647532, -0.195006, -2.642559, 1, 1, 1, 1, 1,
-0.6450496, 0.3190772, -0.2796181, 1, 1, 1, 1, 1,
-0.6390687, -1.692773, -3.62392, 1, 1, 1, 1, 1,
-0.6387222, 1.864085, 1.201578, 1, 1, 1, 1, 1,
-0.636205, 0.7753386, -2.529387, 1, 1, 1, 1, 1,
-0.6321689, -0.4569416, -2.922299, 1, 1, 1, 1, 1,
-0.6301628, 1.111548, 0.02533822, 0, 0, 1, 1, 1,
-0.6242752, -1.538546, -1.481477, 1, 0, 0, 1, 1,
-0.6224313, 0.2155335, -0.9803972, 1, 0, 0, 1, 1,
-0.6205786, 1.275005, 1.265465, 1, 0, 0, 1, 1,
-0.6144907, -1.625534, -1.900784, 1, 0, 0, 1, 1,
-0.6140845, 0.8943958, -0.3880309, 1, 0, 0, 1, 1,
-0.6130803, 1.009501, -1.283842, 0, 0, 0, 1, 1,
-0.6128815, -0.1763274, -2.097065, 0, 0, 0, 1, 1,
-0.6120794, -0.4562448, -1.515427, 0, 0, 0, 1, 1,
-0.6037501, -0.02447021, -0.4320726, 0, 0, 0, 1, 1,
-0.6031272, 0.03181813, -2.709012, 0, 0, 0, 1, 1,
-0.6011615, 0.5609801, -0.07386726, 0, 0, 0, 1, 1,
-0.6001857, 0.100448, -1.944601, 0, 0, 0, 1, 1,
-0.5974142, -1.841338, -3.244515, 1, 1, 1, 1, 1,
-0.5958531, -0.1806415, -0.8892636, 1, 1, 1, 1, 1,
-0.5830812, 0.2951236, -1.159059, 1, 1, 1, 1, 1,
-0.5821611, 1.766496, 0.6103882, 1, 1, 1, 1, 1,
-0.5773907, -1.044797, -2.990665, 1, 1, 1, 1, 1,
-0.5653324, -0.7580561, -4.370379, 1, 1, 1, 1, 1,
-0.563466, 0.8788775, 0.3227025, 1, 1, 1, 1, 1,
-0.5592099, 0.06113008, 0.879927, 1, 1, 1, 1, 1,
-0.5591611, -0.926105, -2.043203, 1, 1, 1, 1, 1,
-0.5515883, -0.05237311, -0.3494999, 1, 1, 1, 1, 1,
-0.5447021, -0.5079033, -4.115536, 1, 1, 1, 1, 1,
-0.5425555, 0.3561463, -1.965737, 1, 1, 1, 1, 1,
-0.5420248, 0.1689309, -2.216533, 1, 1, 1, 1, 1,
-0.5412964, 0.6801132, 0.3346316, 1, 1, 1, 1, 1,
-0.5392921, 1.124524, 0.1470072, 1, 1, 1, 1, 1,
-0.5286517, -0.7047536, -1.333993, 0, 0, 1, 1, 1,
-0.5238137, -0.1724446, -1.504652, 1, 0, 0, 1, 1,
-0.5215617, -1.012179, -2.129661, 1, 0, 0, 1, 1,
-0.51959, 1.871836, -0.6592977, 1, 0, 0, 1, 1,
-0.5173218, 0.4355255, -0.7113806, 1, 0, 0, 1, 1,
-0.511555, 1.108366, 0.3238707, 1, 0, 0, 1, 1,
-0.5020079, -1.563942, -4.220343, 0, 0, 0, 1, 1,
-0.4977053, -0.3767507, -2.712726, 0, 0, 0, 1, 1,
-0.4976108, -1.235054, -1.448574, 0, 0, 0, 1, 1,
-0.4918309, 1.944582, 1.378412, 0, 0, 0, 1, 1,
-0.4893145, -0.7433892, -1.232482, 0, 0, 0, 1, 1,
-0.4887563, -0.5498807, -3.127268, 0, 0, 0, 1, 1,
-0.4887343, -0.09806241, -0.5970237, 0, 0, 0, 1, 1,
-0.4795746, 0.592458, -0.9397959, 1, 1, 1, 1, 1,
-0.475859, 0.5924566, -0.9081995, 1, 1, 1, 1, 1,
-0.4716873, 0.08848596, -1.791231, 1, 1, 1, 1, 1,
-0.4665778, -0.7621602, -3.369701, 1, 1, 1, 1, 1,
-0.4632746, 1.605099, -0.3852775, 1, 1, 1, 1, 1,
-0.4610997, -1.036712, -2.359781, 1, 1, 1, 1, 1,
-0.4582834, 0.1050995, -2.048819, 1, 1, 1, 1, 1,
-0.4553818, -0.9014691, -2.45026, 1, 1, 1, 1, 1,
-0.4528411, 2.192196, 0.7579336, 1, 1, 1, 1, 1,
-0.4514741, -0.0984721, -1.858438, 1, 1, 1, 1, 1,
-0.4507888, 0.9279889, -1.037632, 1, 1, 1, 1, 1,
-0.44487, 0.4722493, -1.618275, 1, 1, 1, 1, 1,
-0.4398788, 1.134022, -1.41463, 1, 1, 1, 1, 1,
-0.4383717, -0.4920159, -2.333265, 1, 1, 1, 1, 1,
-0.4362268, 0.3754625, 0.1933637, 1, 1, 1, 1, 1,
-0.4352923, -0.2704256, -1.634728, 0, 0, 1, 1, 1,
-0.4319092, -0.6279523, -1.122667, 1, 0, 0, 1, 1,
-0.4314302, 1.180531, -1.862228, 1, 0, 0, 1, 1,
-0.4301743, -1.245045, -1.24978, 1, 0, 0, 1, 1,
-0.4297433, 1.745946, 0.07808625, 1, 0, 0, 1, 1,
-0.4237659, 1.138337, 0.3825604, 1, 0, 0, 1, 1,
-0.4190144, 1.390284, -0.9643067, 0, 0, 0, 1, 1,
-0.4171643, -0.8072684, -2.757841, 0, 0, 0, 1, 1,
-0.4121056, 0.4957472, -0.992666, 0, 0, 0, 1, 1,
-0.4102696, -2.030388, -3.429994, 0, 0, 0, 1, 1,
-0.3998612, -1.436268, -2.621717, 0, 0, 0, 1, 1,
-0.3973412, -0.3965293, -4.808526, 0, 0, 0, 1, 1,
-0.3939551, 0.6995235, -0.5007816, 0, 0, 0, 1, 1,
-0.3907384, -1.632557, -2.546736, 1, 1, 1, 1, 1,
-0.3906949, -0.5077595, -1.35502, 1, 1, 1, 1, 1,
-0.3904272, 0.005269698, -2.296443, 1, 1, 1, 1, 1,
-0.3843152, 0.3947298, -0.7969908, 1, 1, 1, 1, 1,
-0.3758763, -0.4874473, -3.545954, 1, 1, 1, 1, 1,
-0.3720227, -0.6101514, -2.437124, 1, 1, 1, 1, 1,
-0.3697402, 1.467971, -1.658895, 1, 1, 1, 1, 1,
-0.3651328, 1.231907, -0.231213, 1, 1, 1, 1, 1,
-0.3647045, -0.5347073, -3.730537, 1, 1, 1, 1, 1,
-0.3639598, -1.072176, -3.054185, 1, 1, 1, 1, 1,
-0.3624182, -1.297882, -2.644266, 1, 1, 1, 1, 1,
-0.361124, 1.164102, -0.2186792, 1, 1, 1, 1, 1,
-0.3598772, -0.6868558, -2.384337, 1, 1, 1, 1, 1,
-0.3572352, 0.5891301, -0.930814, 1, 1, 1, 1, 1,
-0.3559404, -1.353061, -3.177186, 1, 1, 1, 1, 1,
-0.3522848, -1.271503, -0.8132777, 0, 0, 1, 1, 1,
-0.3495701, -1.732005, -2.921053, 1, 0, 0, 1, 1,
-0.3454044, -1.22682, -3.102484, 1, 0, 0, 1, 1,
-0.3452978, 0.9758139, -0.1946512, 1, 0, 0, 1, 1,
-0.3449336, -1.590065, -2.20824, 1, 0, 0, 1, 1,
-0.344584, 1.341614, 1.033593, 1, 0, 0, 1, 1,
-0.339545, 0.1409724, -2.118881, 0, 0, 0, 1, 1,
-0.3395204, 2.26947, -0.884146, 0, 0, 0, 1, 1,
-0.3360202, -1.476277, -4.321684, 0, 0, 0, 1, 1,
-0.3347843, -1.700926, -2.707165, 0, 0, 0, 1, 1,
-0.3333568, -1.05707, -3.185899, 0, 0, 0, 1, 1,
-0.3278472, 0.8462269, -0.5159313, 0, 0, 0, 1, 1,
-0.3216608, -0.3142062, -2.678291, 0, 0, 0, 1, 1,
-0.3182608, 1.359493, -2.120439, 1, 1, 1, 1, 1,
-0.3158863, -0.4030967, -3.510778, 1, 1, 1, 1, 1,
-0.312574, 0.3814465, -0.3347487, 1, 1, 1, 1, 1,
-0.3105402, -1.721695, -1.649302, 1, 1, 1, 1, 1,
-0.3050948, 0.3885442, -0.6216769, 1, 1, 1, 1, 1,
-0.3042067, 0.9153432, -0.9520864, 1, 1, 1, 1, 1,
-0.3034527, -1.258178, -2.526562, 1, 1, 1, 1, 1,
-0.2984461, -0.8466275, -2.64672, 1, 1, 1, 1, 1,
-0.293644, 0.4721668, -1.682014, 1, 1, 1, 1, 1,
-0.293056, -0.4257196, -3.560358, 1, 1, 1, 1, 1,
-0.2858584, -0.1751925, -2.739046, 1, 1, 1, 1, 1,
-0.2840096, 0.748996, 0.03795416, 1, 1, 1, 1, 1,
-0.2830829, -0.04685548, -2.00848, 1, 1, 1, 1, 1,
-0.2794057, -0.582565, -3.391263, 1, 1, 1, 1, 1,
-0.2741031, 1.271142, 0.03550091, 1, 1, 1, 1, 1,
-0.2720798, 1.311901, -1.954129, 0, 0, 1, 1, 1,
-0.2718248, 0.3592547, -0.2559002, 1, 0, 0, 1, 1,
-0.2715644, 0.6371461, -2.469762, 1, 0, 0, 1, 1,
-0.2712377, 0.04271467, -0.6611946, 1, 0, 0, 1, 1,
-0.2601194, 0.8734674, -1.529406, 1, 0, 0, 1, 1,
-0.2564782, 0.6666886, 0.02591989, 1, 0, 0, 1, 1,
-0.2540024, -0.2112358, -2.166371, 0, 0, 0, 1, 1,
-0.2532952, -1.597333, -2.736909, 0, 0, 0, 1, 1,
-0.2513803, -1.592605, -3.51768, 0, 0, 0, 1, 1,
-0.2497057, 0.3758475, -1.057737, 0, 0, 0, 1, 1,
-0.2486207, -1.260839, -2.134168, 0, 0, 0, 1, 1,
-0.2476873, -0.6979555, -2.71448, 0, 0, 0, 1, 1,
-0.2461019, 0.4727986, -0.492523, 0, 0, 0, 1, 1,
-0.2440537, -0.8128442, -3.068727, 1, 1, 1, 1, 1,
-0.241234, 0.4342806, 1.12866, 1, 1, 1, 1, 1,
-0.2370176, -1.116886, -1.183623, 1, 1, 1, 1, 1,
-0.2345394, -0.5751583, -2.405824, 1, 1, 1, 1, 1,
-0.2304299, 0.5300862, -0.9029454, 1, 1, 1, 1, 1,
-0.2301383, -1.283413, -2.299097, 1, 1, 1, 1, 1,
-0.2270182, 0.5848842, -2.166281, 1, 1, 1, 1, 1,
-0.2269253, 0.04858491, -0.7176698, 1, 1, 1, 1, 1,
-0.2247278, -1.080628, -2.148965, 1, 1, 1, 1, 1,
-0.2237929, -0.188558, -2.632316, 1, 1, 1, 1, 1,
-0.2217661, 0.9930112, -1.13463, 1, 1, 1, 1, 1,
-0.2204505, -0.8815092, -2.608529, 1, 1, 1, 1, 1,
-0.2169069, 0.3385017, -0.6203371, 1, 1, 1, 1, 1,
-0.2157751, -1.329565, -4.176835, 1, 1, 1, 1, 1,
-0.2130955, -0.7350017, -2.281922, 1, 1, 1, 1, 1,
-0.2123609, 0.04347593, -1.771138, 0, 0, 1, 1, 1,
-0.2115615, 0.3778268, -0.457794, 1, 0, 0, 1, 1,
-0.2104787, 0.08936465, -2.249436, 1, 0, 0, 1, 1,
-0.206985, 1.334435, -0.5098873, 1, 0, 0, 1, 1,
-0.2042682, 0.7818891, -0.6935282, 1, 0, 0, 1, 1,
-0.204159, -0.7150269, -4.007131, 1, 0, 0, 1, 1,
-0.2019429, -0.6666873, -1.781345, 0, 0, 0, 1, 1,
-0.201061, -0.1069347, -0.04022741, 0, 0, 0, 1, 1,
-0.1994414, -1.68516, -4.385022, 0, 0, 0, 1, 1,
-0.1944782, -0.8534428, -4.047776, 0, 0, 0, 1, 1,
-0.1939393, -2.040129, -3.394835, 0, 0, 0, 1, 1,
-0.193495, 0.6611306, -0.600798, 0, 0, 0, 1, 1,
-0.1905912, 0.681235, -0.1530679, 0, 0, 0, 1, 1,
-0.1873576, 1.254428, -0.3927152, 1, 1, 1, 1, 1,
-0.1843878, 0.5613378, -2.657761, 1, 1, 1, 1, 1,
-0.1839333, 0.4341373, -2.602626, 1, 1, 1, 1, 1,
-0.1839309, 0.2482151, 0.6709465, 1, 1, 1, 1, 1,
-0.1811712, -0.8104813, -1.979854, 1, 1, 1, 1, 1,
-0.178121, -0.4775302, -3.116307, 1, 1, 1, 1, 1,
-0.1777208, -0.637137, -4.676191, 1, 1, 1, 1, 1,
-0.1771674, -0.9027043, -3.017062, 1, 1, 1, 1, 1,
-0.1758691, -0.4332019, -2.00332, 1, 1, 1, 1, 1,
-0.1742224, -1.048287, -5.591575, 1, 1, 1, 1, 1,
-0.1644271, -2.185679, -3.488809, 1, 1, 1, 1, 1,
-0.1627454, 0.4122588, -0.05461287, 1, 1, 1, 1, 1,
-0.1614501, 1.411347, 1.074758, 1, 1, 1, 1, 1,
-0.1611336, 0.01248505, 1.699898, 1, 1, 1, 1, 1,
-0.1610235, -1.192982, -2.922772, 1, 1, 1, 1, 1,
-0.1600548, 1.300923, -0.7846364, 0, 0, 1, 1, 1,
-0.1577589, -1.944234, -1.297745, 1, 0, 0, 1, 1,
-0.1569248, -0.4503486, -3.58245, 1, 0, 0, 1, 1,
-0.1553026, -0.2037059, -2.427354, 1, 0, 0, 1, 1,
-0.152189, 2.081513, 0.9969284, 1, 0, 0, 1, 1,
-0.1518392, 0.04999021, -3.084092, 1, 0, 0, 1, 1,
-0.1485886, 0.798664, -1.0483, 0, 0, 0, 1, 1,
-0.1427782, 2.72993, 0.1898044, 0, 0, 0, 1, 1,
-0.1387238, -1.637008, -2.68047, 0, 0, 0, 1, 1,
-0.1334386, 1.142255, -0.9381462, 0, 0, 0, 1, 1,
-0.1316465, -0.06361298, -4.42545, 0, 0, 0, 1, 1,
-0.1304123, -1.350975, -3.690576, 0, 0, 0, 1, 1,
-0.1303613, 1.488947, -1.387486, 0, 0, 0, 1, 1,
-0.1280017, -0.4520018, -1.265197, 1, 1, 1, 1, 1,
-0.1255368, -1.584617, -3.235193, 1, 1, 1, 1, 1,
-0.1240039, 0.879173, 0.4313663, 1, 1, 1, 1, 1,
-0.1207463, 1.752103, 0.896673, 1, 1, 1, 1, 1,
-0.1170582, -0.7945754, -2.399918, 1, 1, 1, 1, 1,
-0.1159406, -0.207746, -2.808225, 1, 1, 1, 1, 1,
-0.1148786, 1.206766, 0.7133613, 1, 1, 1, 1, 1,
-0.1147507, 0.3100462, -1.050958, 1, 1, 1, 1, 1,
-0.1140921, 1.04574, 0.9467844, 1, 1, 1, 1, 1,
-0.113929, -0.9149847, -1.953523, 1, 1, 1, 1, 1,
-0.1116952, 0.8017116, 0.8517519, 1, 1, 1, 1, 1,
-0.111593, 1.054915, -2.047884, 1, 1, 1, 1, 1,
-0.1105889, -0.6351154, -3.974424, 1, 1, 1, 1, 1,
-0.1094518, -0.5128427, -2.404757, 1, 1, 1, 1, 1,
-0.1088424, 0.1782836, -0.1188087, 1, 1, 1, 1, 1,
-0.1081602, -1.061234, -3.472541, 0, 0, 1, 1, 1,
-0.10811, -0.06973634, -1.715509, 1, 0, 0, 1, 1,
-0.1014817, -0.8977398, -2.399882, 1, 0, 0, 1, 1,
-0.1002706, 1.747488, 0.6913651, 1, 0, 0, 1, 1,
-0.1001672, 0.8920873, 0.9603342, 1, 0, 0, 1, 1,
-0.09945265, 2.194282, 0.7098348, 1, 0, 0, 1, 1,
-0.09849554, -0.2388831, -3.622191, 0, 0, 0, 1, 1,
-0.09682788, 0.6718549, 0.3343224, 0, 0, 0, 1, 1,
-0.09582927, -0.4449122, -2.355995, 0, 0, 0, 1, 1,
-0.08892746, 1.292093, 1.622853, 0, 0, 0, 1, 1,
-0.08554713, 0.3065966, -0.9401886, 0, 0, 0, 1, 1,
-0.0845541, 0.0818799, -2.68847, 0, 0, 0, 1, 1,
-0.08443576, -0.08417667, -1.288319, 0, 0, 0, 1, 1,
-0.08253817, -0.7363616, -2.923217, 1, 1, 1, 1, 1,
-0.08090623, 0.1504898, -1.165395, 1, 1, 1, 1, 1,
-0.07453045, 0.4154397, 0.6850235, 1, 1, 1, 1, 1,
-0.07405938, -1.519688, -3.390793, 1, 1, 1, 1, 1,
-0.06613801, 2.385553, 0.5197303, 1, 1, 1, 1, 1,
-0.06528811, -0.4892506, -2.572406, 1, 1, 1, 1, 1,
-0.06026199, -0.7207441, -2.820277, 1, 1, 1, 1, 1,
-0.0593957, 1.010096, -0.2088183, 1, 1, 1, 1, 1,
-0.05615138, 1.006822, -1.551593, 1, 1, 1, 1, 1,
-0.05577372, -0.7579394, -4.043611, 1, 1, 1, 1, 1,
-0.05551606, 0.08636223, -0.3423783, 1, 1, 1, 1, 1,
-0.05455118, -0.293085, -3.141776, 1, 1, 1, 1, 1,
-0.05231941, -1.483604, -3.438684, 1, 1, 1, 1, 1,
-0.04791426, -2.54615, -2.379089, 1, 1, 1, 1, 1,
-0.04746578, 0.1670517, -0.069484, 1, 1, 1, 1, 1,
-0.04509491, 1.133888, -1.397075, 0, 0, 1, 1, 1,
-0.04203484, -0.7564633, -2.840862, 1, 0, 0, 1, 1,
-0.0419472, -1.177279, -3.738843, 1, 0, 0, 1, 1,
-0.04120444, -1.669795, -3.395772, 1, 0, 0, 1, 1,
-0.04090331, -0.5146626, -3.788071, 1, 0, 0, 1, 1,
-0.03854895, -2.055007, -3.645167, 1, 0, 0, 1, 1,
-0.035903, 0.2184658, 0.1212139, 0, 0, 0, 1, 1,
-0.03547056, 0.5427738, 0.4942083, 0, 0, 0, 1, 1,
-0.03439299, -0.9766902, -4.091415, 0, 0, 0, 1, 1,
-0.03176414, -0.5849165, -2.374482, 0, 0, 0, 1, 1,
-0.02758513, -0.2532955, -2.354048, 0, 0, 0, 1, 1,
-0.0267085, 0.6202563, 0.586599, 0, 0, 0, 1, 1,
-0.02622138, -1.064126, -0.8765076, 0, 0, 0, 1, 1,
-0.02435037, -0.4632244, -3.431805, 1, 1, 1, 1, 1,
-0.02226555, -1.078456, -2.148678, 1, 1, 1, 1, 1,
-0.02108477, -0.02561578, -3.538384, 1, 1, 1, 1, 1,
-0.02016218, 0.4413351, 1.831194, 1, 1, 1, 1, 1,
-0.01674901, 0.2082607, -1.980943, 1, 1, 1, 1, 1,
-0.01609414, 1.308702, -1.242566, 1, 1, 1, 1, 1,
-0.0142195, 0.3724119, 0.9673996, 1, 1, 1, 1, 1,
-0.01383531, 0.1997381, -1.262956, 1, 1, 1, 1, 1,
-0.0117659, 1.079971, -0.4832829, 1, 1, 1, 1, 1,
-0.006417134, -0.2644365, -0.7161638, 1, 1, 1, 1, 1,
-0.003864224, -0.5819935, -3.168722, 1, 1, 1, 1, 1,
-0.001480038, 0.736294, -0.1689528, 1, 1, 1, 1, 1,
-0.00014651, 1.058212, 0.4686753, 1, 1, 1, 1, 1,
7.78048e-05, -0.2457446, 2.814656, 1, 1, 1, 1, 1,
0.001394736, -0.7120204, 4.741195, 1, 1, 1, 1, 1,
0.002406303, 0.9952282, 1.529949, 0, 0, 1, 1, 1,
0.004144392, 0.3605233, 0.2668677, 1, 0, 0, 1, 1,
0.006367715, -0.8087441, 2.483865, 1, 0, 0, 1, 1,
0.007721897, -0.4171121, 2.962759, 1, 0, 0, 1, 1,
0.009619065, 1.491994, -0.3348116, 1, 0, 0, 1, 1,
0.009663325, -1.390401, 2.105419, 1, 0, 0, 1, 1,
0.01381269, 1.52809, 0.6071044, 0, 0, 0, 1, 1,
0.01675503, -1.226824, 2.489616, 0, 0, 0, 1, 1,
0.01849023, 1.882056, 0.244844, 0, 0, 0, 1, 1,
0.02809567, 1.130129, 1.128484, 0, 0, 0, 1, 1,
0.02944067, -1.451578, 2.246775, 0, 0, 0, 1, 1,
0.03090772, -0.5366006, 2.567054, 0, 0, 0, 1, 1,
0.03574108, -0.2805695, 0.6713221, 0, 0, 0, 1, 1,
0.04061784, -0.7001041, 3.349506, 1, 1, 1, 1, 1,
0.04103766, 0.3011788, -0.2563319, 1, 1, 1, 1, 1,
0.04437778, -0.1179842, 4.140364, 1, 1, 1, 1, 1,
0.04615098, 0.04687891, 0.4963765, 1, 1, 1, 1, 1,
0.04638498, -0.9452174, 3.389266, 1, 1, 1, 1, 1,
0.04745816, -0.1768169, 2.514239, 1, 1, 1, 1, 1,
0.05233188, -0.6819457, 3.545878, 1, 1, 1, 1, 1,
0.05490894, -1.407755, 2.464505, 1, 1, 1, 1, 1,
0.05689377, 0.9492168, 1.121716, 1, 1, 1, 1, 1,
0.05871729, 0.3544115, -0.1513205, 1, 1, 1, 1, 1,
0.06149628, -0.3077943, 4.066675, 1, 1, 1, 1, 1,
0.0658736, 0.6211315, 0.5212615, 1, 1, 1, 1, 1,
0.06629583, -0.3561982, 2.036194, 1, 1, 1, 1, 1,
0.06945883, -0.931444, 3.260533, 1, 1, 1, 1, 1,
0.07329392, -1.39801, 3.711841, 1, 1, 1, 1, 1,
0.07517543, 0.3797602, -0.630079, 0, 0, 1, 1, 1,
0.0764276, -0.8113674, 2.83164, 1, 0, 0, 1, 1,
0.07766202, -2.761147, 1.899233, 1, 0, 0, 1, 1,
0.07899129, -0.8905382, 1.235237, 1, 0, 0, 1, 1,
0.08489223, 0.5433304, -1.029678, 1, 0, 0, 1, 1,
0.08525826, -0.8424104, 2.547315, 1, 0, 0, 1, 1,
0.08758108, -1.00604, 4.116429, 0, 0, 0, 1, 1,
0.08764023, 0.2597863, 1.60784, 0, 0, 0, 1, 1,
0.08841248, 0.1544309, 1.561442, 0, 0, 0, 1, 1,
0.08950277, -0.3941569, 3.651284, 0, 0, 0, 1, 1,
0.09060021, 0.3106557, 0.8246079, 0, 0, 0, 1, 1,
0.09332284, -0.7888768, 3.527421, 0, 0, 0, 1, 1,
0.09471413, 1.028135, -1.011505, 0, 0, 0, 1, 1,
0.09601678, 1.090436, -0.9369708, 1, 1, 1, 1, 1,
0.09631093, -1.232838, 1.44425, 1, 1, 1, 1, 1,
0.09772483, 1.418602, -1.124482, 1, 1, 1, 1, 1,
0.09991346, 0.253607, -0.4811446, 1, 1, 1, 1, 1,
0.1012832, 0.01548668, 0.3612998, 1, 1, 1, 1, 1,
0.1013148, 0.06656598, 1.888989, 1, 1, 1, 1, 1,
0.1017854, 0.6628095, 0.5253624, 1, 1, 1, 1, 1,
0.1085749, 0.4080963, 0.6293176, 1, 1, 1, 1, 1,
0.1091817, -1.061198, 3.272144, 1, 1, 1, 1, 1,
0.1097725, 0.5082086, 0.3836541, 1, 1, 1, 1, 1,
0.1122979, -0.8563094, 2.080068, 1, 1, 1, 1, 1,
0.1130419, 1.276931, 1.054769, 1, 1, 1, 1, 1,
0.1143847, -0.3026221, 2.983171, 1, 1, 1, 1, 1,
0.1256414, -1.327578, 3.295415, 1, 1, 1, 1, 1,
0.1314246, 2.022346, 0.3386381, 1, 1, 1, 1, 1,
0.134073, 2.123621, 1.260244, 0, 0, 1, 1, 1,
0.138163, -0.858978, 4.810259, 1, 0, 0, 1, 1,
0.1402066, 0.7730951, 2.101907, 1, 0, 0, 1, 1,
0.1402324, -0.65894, 2.797898, 1, 0, 0, 1, 1,
0.1427528, -1.446957, 2.600763, 1, 0, 0, 1, 1,
0.1430169, 0.8494191, 0.08429454, 1, 0, 0, 1, 1,
0.144747, 0.2971186, 2.368642, 0, 0, 0, 1, 1,
0.1450184, 0.5743505, 2.249342, 0, 0, 0, 1, 1,
0.1527561, -0.5845461, 0.6022527, 0, 0, 0, 1, 1,
0.1617424, 0.6643144, -2.067312, 0, 0, 0, 1, 1,
0.1620343, 2.81032, -1.011064, 0, 0, 0, 1, 1,
0.164333, -0.7722039, 4.013356, 0, 0, 0, 1, 1,
0.1677542, -0.073566, 0.8614967, 0, 0, 0, 1, 1,
0.1713772, 1.968474, 0.1964112, 1, 1, 1, 1, 1,
0.1829457, -0.6031256, 4.016392, 1, 1, 1, 1, 1,
0.1846539, -0.7286795, 2.043536, 1, 1, 1, 1, 1,
0.1857354, -1.78401, 3.010834, 1, 1, 1, 1, 1,
0.1877859, -2.563196, 3.229679, 1, 1, 1, 1, 1,
0.2106676, -0.05624913, 3.783279, 1, 1, 1, 1, 1,
0.2109987, -0.9080503, 4.216672, 1, 1, 1, 1, 1,
0.2128695, -0.3247845, 3.716056, 1, 1, 1, 1, 1,
0.2156294, -1.762752, 1.992056, 1, 1, 1, 1, 1,
0.2180447, 0.567184, 1.049081, 1, 1, 1, 1, 1,
0.2188912, -1.437336, 3.896804, 1, 1, 1, 1, 1,
0.2194377, 1.110565, -0.7985892, 1, 1, 1, 1, 1,
0.2220352, 0.8802914, 0.8851374, 1, 1, 1, 1, 1,
0.2255722, 1.280855, 1.805961, 1, 1, 1, 1, 1,
0.227947, -0.1179729, 2.052652, 1, 1, 1, 1, 1,
0.228649, -1.568106, 3.614996, 0, 0, 1, 1, 1,
0.2290054, -1.141704, 3.813278, 1, 0, 0, 1, 1,
0.2415102, -0.9462944, 2.909298, 1, 0, 0, 1, 1,
0.2446805, -0.2287825, 3.378394, 1, 0, 0, 1, 1,
0.2448177, -1.889367, 1.546054, 1, 0, 0, 1, 1,
0.2493929, 1.19416, 1.42653, 1, 0, 0, 1, 1,
0.2522846, 0.5108339, -0.2443157, 0, 0, 0, 1, 1,
0.2523505, -0.01660169, 1.327872, 0, 0, 0, 1, 1,
0.2553602, 0.1584753, 0.660876, 0, 0, 0, 1, 1,
0.2563621, 0.6782383, -0.779601, 0, 0, 0, 1, 1,
0.2575382, 0.9545627, 1.793633, 0, 0, 0, 1, 1,
0.2605356, -1.176889, 3.17905, 0, 0, 0, 1, 1,
0.264924, 1.36175, 1.246062, 0, 0, 0, 1, 1,
0.2661346, -0.908588, 3.363365, 1, 1, 1, 1, 1,
0.2665813, -0.6813579, 2.45757, 1, 1, 1, 1, 1,
0.2729628, -0.5994056, 3.4551, 1, 1, 1, 1, 1,
0.2740926, 1.293333, 1.356488, 1, 1, 1, 1, 1,
0.2748128, 1.670118, -0.2229144, 1, 1, 1, 1, 1,
0.2824299, -1.266411, 3.199068, 1, 1, 1, 1, 1,
0.2849583, -0.559276, 1.634117, 1, 1, 1, 1, 1,
0.2865438, 0.4383585, -0.4548845, 1, 1, 1, 1, 1,
0.291441, 0.433791, 2.064341, 1, 1, 1, 1, 1,
0.2942331, 0.06700343, 2.306266, 1, 1, 1, 1, 1,
0.294913, -0.119913, 1.850832, 1, 1, 1, 1, 1,
0.2955417, 0.309545, 0.7070146, 1, 1, 1, 1, 1,
0.2993325, 1.116886, 0.826487, 1, 1, 1, 1, 1,
0.3027191, -0.8250253, 1.965315, 1, 1, 1, 1, 1,
0.3031509, -0.3238627, 1.558762, 1, 1, 1, 1, 1,
0.3032518, 0.5020507, 0.8922913, 0, 0, 1, 1, 1,
0.3102396, 0.3958283, 2.527107, 1, 0, 0, 1, 1,
0.3120302, 1.372594, -0.1524327, 1, 0, 0, 1, 1,
0.3145894, 0.09390868, -0.421354, 1, 0, 0, 1, 1,
0.3212794, -0.6403978, 1.174995, 1, 0, 0, 1, 1,
0.3282891, 0.1808388, -0.01801968, 1, 0, 0, 1, 1,
0.3322585, 1.389226, 0.8902694, 0, 0, 0, 1, 1,
0.3351823, 0.6491934, -0.07687999, 0, 0, 0, 1, 1,
0.3421831, -0.502557, -0.1659655, 0, 0, 0, 1, 1,
0.3440309, -0.9061073, 1.88215, 0, 0, 0, 1, 1,
0.3446461, 0.864545, 1.909229, 0, 0, 0, 1, 1,
0.3463203, -1.334812, 1.832665, 0, 0, 0, 1, 1,
0.3482449, -0.2431718, 1.811958, 0, 0, 0, 1, 1,
0.3489797, 1.10617, 0.2528782, 1, 1, 1, 1, 1,
0.3496994, -0.7720562, 1.005097, 1, 1, 1, 1, 1,
0.3498215, -1.253657, 3.360215, 1, 1, 1, 1, 1,
0.3521808, -0.278973, 2.691627, 1, 1, 1, 1, 1,
0.3532198, 0.6233942, 0.676299, 1, 1, 1, 1, 1,
0.353518, 1.197452, -0.1120932, 1, 1, 1, 1, 1,
0.3543593, -1.39631, 0.9464417, 1, 1, 1, 1, 1,
0.3546254, 1.181897, -0.6562456, 1, 1, 1, 1, 1,
0.3671984, -0.05118301, -0.3656399, 1, 1, 1, 1, 1,
0.3710824, -0.5260952, 1.90679, 1, 1, 1, 1, 1,
0.3741698, 1.872391, -1.759752, 1, 1, 1, 1, 1,
0.3781702, -0.6627197, 2.502252, 1, 1, 1, 1, 1,
0.386159, 0.2777169, 1.891077, 1, 1, 1, 1, 1,
0.3887872, -0.2971053, 0.5316949, 1, 1, 1, 1, 1,
0.3896792, -0.4654585, 2.043319, 1, 1, 1, 1, 1,
0.390391, -0.6146388, 3.81182, 0, 0, 1, 1, 1,
0.3904603, -1.655202, 3.017178, 1, 0, 0, 1, 1,
0.391497, 1.708513, -0.7709784, 1, 0, 0, 1, 1,
0.3936803, 1.375498, -0.9181539, 1, 0, 0, 1, 1,
0.3953697, 0.988336, 0.8183619, 1, 0, 0, 1, 1,
0.3979465, -1.03679, 3.950041, 1, 0, 0, 1, 1,
0.4011431, 0.2808522, 1.168704, 0, 0, 0, 1, 1,
0.4026958, -0.04862637, 0.402721, 0, 0, 0, 1, 1,
0.4093708, 0.8680297, 1.908778, 0, 0, 0, 1, 1,
0.4100183, -0.9362475, 2.665605, 0, 0, 0, 1, 1,
0.4129975, 1.880038, 1.749961, 0, 0, 0, 1, 1,
0.4151973, -0.9650667, 3.923485, 0, 0, 0, 1, 1,
0.4161555, 1.248342, 0.5193154, 0, 0, 0, 1, 1,
0.4220749, 1.926287, 0.5602086, 1, 1, 1, 1, 1,
0.4222906, 0.5593709, 1.087548, 1, 1, 1, 1, 1,
0.4237286, 0.6977639, -1.039324, 1, 1, 1, 1, 1,
0.424357, 1.321312, 1.298473, 1, 1, 1, 1, 1,
0.4309355, -1.059537, 2.612495, 1, 1, 1, 1, 1,
0.4367127, 0.2179431, 0.7393169, 1, 1, 1, 1, 1,
0.437048, 0.1308385, 1.637725, 1, 1, 1, 1, 1,
0.4387841, -2.13131, 3.831929, 1, 1, 1, 1, 1,
0.4402374, 0.7792503, 0.6664883, 1, 1, 1, 1, 1,
0.4422705, 0.4761477, -0.9215885, 1, 1, 1, 1, 1,
0.4431001, -0.3807286, 2.177194, 1, 1, 1, 1, 1,
0.4443224, 0.3782373, -0.7687494, 1, 1, 1, 1, 1,
0.4446428, 0.3256555, 2.283123, 1, 1, 1, 1, 1,
0.4503318, -0.954718, 3.047375, 1, 1, 1, 1, 1,
0.4505489, 0.08820149, 2.913797, 1, 1, 1, 1, 1,
0.4535766, -1.051711, 4.234914, 0, 0, 1, 1, 1,
0.4568413, -0.9086134, 2.648703, 1, 0, 0, 1, 1,
0.4591465, 0.2200959, 1.688409, 1, 0, 0, 1, 1,
0.4613289, 0.09973506, 1.787874, 1, 0, 0, 1, 1,
0.4619873, -0.7117355, 2.347458, 1, 0, 0, 1, 1,
0.4636561, -2.036927, 1.165237, 1, 0, 0, 1, 1,
0.4646853, -0.02488343, 3.577126, 0, 0, 0, 1, 1,
0.4653223, 1.627868, -0.9706538, 0, 0, 0, 1, 1,
0.4875686, -0.771269, 3.267755, 0, 0, 0, 1, 1,
0.4952254, 0.7455277, 0.294576, 0, 0, 0, 1, 1,
0.4976655, 0.6461329, 1.239009, 0, 0, 0, 1, 1,
0.5053402, 0.07351357, 2.405799, 0, 0, 0, 1, 1,
0.5065978, -0.1766645, 1.459449, 0, 0, 0, 1, 1,
0.5091568, -0.3410511, 2.942308, 1, 1, 1, 1, 1,
0.5104396, -0.4141078, 1.88227, 1, 1, 1, 1, 1,
0.5130239, -0.5384417, 2.757456, 1, 1, 1, 1, 1,
0.5140506, -1.524745, 4.4378, 1, 1, 1, 1, 1,
0.5171771, -0.3154777, 1.78014, 1, 1, 1, 1, 1,
0.5263134, -0.5740107, 1.861708, 1, 1, 1, 1, 1,
0.5297107, -0.5707777, 1.66657, 1, 1, 1, 1, 1,
0.5300107, -0.4106933, 3.388333, 1, 1, 1, 1, 1,
0.5327423, 0.2715865, 0.5702285, 1, 1, 1, 1, 1,
0.5429429, 0.1772602, 1.323693, 1, 1, 1, 1, 1,
0.5496491, -0.4336888, 2.666359, 1, 1, 1, 1, 1,
0.5500987, -1.386775, 1.833007, 1, 1, 1, 1, 1,
0.5507013, 0.4508879, 3.139725, 1, 1, 1, 1, 1,
0.5532987, 0.06546103, 1.938836, 1, 1, 1, 1, 1,
0.5557001, -0.4890669, 1.493699, 1, 1, 1, 1, 1,
0.5661343, 1.010342, 1.851683, 0, 0, 1, 1, 1,
0.5661461, 0.5518739, 1.681118, 1, 0, 0, 1, 1,
0.5735356, -1.565476, 4.579092, 1, 0, 0, 1, 1,
0.5794632, 0.9863962, 2.118179, 1, 0, 0, 1, 1,
0.5855163, 0.6793828, 0.6285855, 1, 0, 0, 1, 1,
0.600437, -0.6189095, 2.848079, 1, 0, 0, 1, 1,
0.6053205, -1.153171, 3.348781, 0, 0, 0, 1, 1,
0.6212994, 0.471976, 0.6723255, 0, 0, 0, 1, 1,
0.6214833, -0.7318834, 1.239715, 0, 0, 0, 1, 1,
0.622105, 0.5890893, 0.2617025, 0, 0, 0, 1, 1,
0.6248367, -0.5773556, 1.029217, 0, 0, 0, 1, 1,
0.6279451, -1.497633, 3.727196, 0, 0, 0, 1, 1,
0.6289185, 0.3821751, -0.9653975, 0, 0, 0, 1, 1,
0.6295224, 1.206135, 1.732125, 1, 1, 1, 1, 1,
0.6300811, -0.1756164, 0.2606757, 1, 1, 1, 1, 1,
0.6323601, -0.2213118, 2.30028, 1, 1, 1, 1, 1,
0.6363091, 1.856539, 0.7108883, 1, 1, 1, 1, 1,
0.6417214, -0.03481963, -0.3890217, 1, 1, 1, 1, 1,
0.6426113, 0.8514768, 0.6213624, 1, 1, 1, 1, 1,
0.6480933, -0.2561241, 1.462797, 1, 1, 1, 1, 1,
0.6531866, 0.6591868, 2.473284, 1, 1, 1, 1, 1,
0.6552756, -0.8037331, 2.400064, 1, 1, 1, 1, 1,
0.6583717, -0.4297101, 2.815628, 1, 1, 1, 1, 1,
0.6679242, 1.369129, 1.785017, 1, 1, 1, 1, 1,
0.6680948, -1.235242, 3.113148, 1, 1, 1, 1, 1,
0.6688526, 0.3940766, -0.6511245, 1, 1, 1, 1, 1,
0.669129, 1.790344, -0.3405347, 1, 1, 1, 1, 1,
0.6733415, 0.6212436, 0.08990078, 1, 1, 1, 1, 1,
0.6758144, 0.1878846, 1.18104, 0, 0, 1, 1, 1,
0.676398, -0.565142, 2.61504, 1, 0, 0, 1, 1,
0.6770572, -0.4926645, 2.949916, 1, 0, 0, 1, 1,
0.6793897, -1.484075, 4.697448, 1, 0, 0, 1, 1,
0.6801962, 0.1909433, 2.087851, 1, 0, 0, 1, 1,
0.6844079, 0.1833128, 0.7226561, 1, 0, 0, 1, 1,
0.6851392, -0.2714763, 2.787431, 0, 0, 0, 1, 1,
0.6876245, -0.2684875, 3.338491, 0, 0, 0, 1, 1,
0.6940644, 0.5941373, 1.215658, 0, 0, 0, 1, 1,
0.7002578, -0.5498655, 4.06372, 0, 0, 0, 1, 1,
0.7100542, 0.8238336, 0.3844832, 0, 0, 0, 1, 1,
0.7111517, 1.392514, 0.8827103, 0, 0, 0, 1, 1,
0.7133943, 0.7122166, -0.1208726, 0, 0, 0, 1, 1,
0.7143436, 0.6699783, -1.344136, 1, 1, 1, 1, 1,
0.7151396, -0.2429727, 2.53512, 1, 1, 1, 1, 1,
0.7156363, 1.556033, 0.248784, 1, 1, 1, 1, 1,
0.7165671, -0.9649626, 2.23399, 1, 1, 1, 1, 1,
0.7179309, 0.04390326, 0.8266124, 1, 1, 1, 1, 1,
0.7187428, -0.4083837, 2.389983, 1, 1, 1, 1, 1,
0.7256994, -1.712001, 3.057368, 1, 1, 1, 1, 1,
0.7264796, 0.6027231, 0.4651147, 1, 1, 1, 1, 1,
0.7289194, 0.4676307, 1.832224, 1, 1, 1, 1, 1,
0.7365566, 0.8820075, 2.956464, 1, 1, 1, 1, 1,
0.7380261, 0.0110017, 0.03573738, 1, 1, 1, 1, 1,
0.7427758, -0.4432541, 2.48568, 1, 1, 1, 1, 1,
0.7458977, -0.2580465, 1.829362, 1, 1, 1, 1, 1,
0.7502971, -0.4521635, 1.240732, 1, 1, 1, 1, 1,
0.7526912, -1.158146, 3.259153, 1, 1, 1, 1, 1,
0.7546887, -0.6293095, 2.411545, 0, 0, 1, 1, 1,
0.7611471, -0.2696926, 2.137533, 1, 0, 0, 1, 1,
0.7638435, 0.4041842, 1.825176, 1, 0, 0, 1, 1,
0.7648916, -0.9670956, 2.638812, 1, 0, 0, 1, 1,
0.766807, -0.9984272, -0.3517801, 1, 0, 0, 1, 1,
0.7692934, -1.023836, 2.086057, 1, 0, 0, 1, 1,
0.7703198, 0.03538955, 1.286559, 0, 0, 0, 1, 1,
0.7885822, 1.433789, 1.055853, 0, 0, 0, 1, 1,
0.7904108, -1.692167, 3.265836, 0, 0, 0, 1, 1,
0.7906913, -1.347775, 3.28293, 0, 0, 0, 1, 1,
0.7927799, 0.8323373, 0.06536321, 0, 0, 0, 1, 1,
0.7953213, -1.0977, 3.845645, 0, 0, 0, 1, 1,
0.796317, -0.920586, 2.318679, 0, 0, 0, 1, 1,
0.7992597, -2.088245, 3.660287, 1, 1, 1, 1, 1,
0.8093061, 0.8377093, 1.208028, 1, 1, 1, 1, 1,
0.8144736, -1.786445, 1.310997, 1, 1, 1, 1, 1,
0.8171937, 0.8696172, 1.519337, 1, 1, 1, 1, 1,
0.8176038, 0.1891644, 2.490209, 1, 1, 1, 1, 1,
0.8346359, -2.915071, 2.504947, 1, 1, 1, 1, 1,
0.8386956, -0.4332466, 1.780312, 1, 1, 1, 1, 1,
0.8411921, 0.3406183, 2.635483, 1, 1, 1, 1, 1,
0.8415616, 1.202833, 0.3241001, 1, 1, 1, 1, 1,
0.8449263, 0.3312862, 1.044137, 1, 1, 1, 1, 1,
0.8452215, 0.5917283, 0.5076277, 1, 1, 1, 1, 1,
0.853933, -0.3975514, 3.130743, 1, 1, 1, 1, 1,
0.8584492, 0.259217, 3.810117, 1, 1, 1, 1, 1,
0.8596552, -0.6591706, 3.504818, 1, 1, 1, 1, 1,
0.8609473, 1.3501, 0.1329281, 1, 1, 1, 1, 1,
0.8638843, -0.07700212, 2.4793, 0, 0, 1, 1, 1,
0.8654831, 0.5165171, 1.235571, 1, 0, 0, 1, 1,
0.8660622, -0.9464369, 2.512204, 1, 0, 0, 1, 1,
0.8679355, -0.4229422, 2.131853, 1, 0, 0, 1, 1,
0.8787617, 0.4295817, 2.248048, 1, 0, 0, 1, 1,
0.8818523, -0.01961388, 0.4731524, 1, 0, 0, 1, 1,
0.8833525, 0.7791333, 0.3959657, 0, 0, 0, 1, 1,
0.8835424, 0.4729481, 2.292121, 0, 0, 0, 1, 1,
0.8845554, 0.9196629, 1.8833, 0, 0, 0, 1, 1,
0.8974776, -1.193124, 3.365983, 0, 0, 0, 1, 1,
0.8983918, -0.172517, 3.430881, 0, 0, 0, 1, 1,
0.9004876, -0.3268578, 2.157561, 0, 0, 0, 1, 1,
0.9024956, -0.83829, 3.228148, 0, 0, 0, 1, 1,
0.9040629, -1.118556, 2.197717, 1, 1, 1, 1, 1,
0.9047259, 0.6709483, 2.431379, 1, 1, 1, 1, 1,
0.9238968, 2.397079, 0.7062799, 1, 1, 1, 1, 1,
0.9260657, -1.185004, 2.942336, 1, 1, 1, 1, 1,
0.9283783, -0.5934482, 3.092307, 1, 1, 1, 1, 1,
0.9290867, -1.246606, 2.692648, 1, 1, 1, 1, 1,
0.9300162, -1.108412, 3.198011, 1, 1, 1, 1, 1,
0.9351921, 0.1972132, 2.171912, 1, 1, 1, 1, 1,
0.9425691, -0.1366356, 0.9756134, 1, 1, 1, 1, 1,
0.9576418, -1.568638, 2.099428, 1, 1, 1, 1, 1,
0.9579439, 0.8663354, -1.801067, 1, 1, 1, 1, 1,
0.9615018, 1.507072, 0.585148, 1, 1, 1, 1, 1,
0.9650083, -0.7393425, 0.5569398, 1, 1, 1, 1, 1,
0.9673408, 0.9601729, 1.639536, 1, 1, 1, 1, 1,
0.9681088, 1.924412, 0.6049772, 1, 1, 1, 1, 1,
0.9717039, 0.9019023, 0.9765074, 0, 0, 1, 1, 1,
0.9762928, 0.5095567, 0.8238613, 1, 0, 0, 1, 1,
0.9807518, 2.531296, 1.226022, 1, 0, 0, 1, 1,
0.9823083, -0.6279843, 3.14295, 1, 0, 0, 1, 1,
0.9828734, 0.5155214, 0.2654748, 1, 0, 0, 1, 1,
0.9888871, -0.6194988, 2.622708, 1, 0, 0, 1, 1,
0.9913035, 0.2836142, 2.126013, 0, 0, 0, 1, 1,
0.9920167, 1.327386, -0.09425628, 0, 0, 0, 1, 1,
0.9964718, -0.1448485, 1.503146, 0, 0, 0, 1, 1,
1.000333, -0.1532617, 2.203671, 0, 0, 0, 1, 1,
1.001007, -1.812487, 1.001343, 0, 0, 0, 1, 1,
1.00282, 1.093316, 0.08014417, 0, 0, 0, 1, 1,
1.003318, 0.6322315, 1.692118, 0, 0, 0, 1, 1,
1.016663, -0.2686563, 0.1064032, 1, 1, 1, 1, 1,
1.025478, -0.1402001, 1.448368, 1, 1, 1, 1, 1,
1.031168, 0.6759002, -0.7853055, 1, 1, 1, 1, 1,
1.038802, -2.234618, 3.67016, 1, 1, 1, 1, 1,
1.039195, -1.844395, 2.484187, 1, 1, 1, 1, 1,
1.041626, 0.1016818, -0.6774226, 1, 1, 1, 1, 1,
1.045289, -0.441595, 0.09861689, 1, 1, 1, 1, 1,
1.046004, -0.9529433, 3.069638, 1, 1, 1, 1, 1,
1.050334, -1.501423, 4.448972, 1, 1, 1, 1, 1,
1.057036, -0.5047734, 2.796295, 1, 1, 1, 1, 1,
1.057263, 0.7559776, 1.777442, 1, 1, 1, 1, 1,
1.060729, 1.231945, 2.702781, 1, 1, 1, 1, 1,
1.067129, -0.8727595, 1.599334, 1, 1, 1, 1, 1,
1.067191, -1.432099, 1.047203, 1, 1, 1, 1, 1,
1.068138, -0.135382, -0.8140069, 1, 1, 1, 1, 1,
1.069826, -0.4787806, 2.589318, 0, 0, 1, 1, 1,
1.074766, -0.004441516, 2.408107, 1, 0, 0, 1, 1,
1.078478, 1.457003, -1.267663, 1, 0, 0, 1, 1,
1.080983, -0.177144, 2.093034, 1, 0, 0, 1, 1,
1.082499, 0.7206351, 1.583712, 1, 0, 0, 1, 1,
1.086452, 1.790908, -0.3276382, 1, 0, 0, 1, 1,
1.096366, -2.338166, 1.047661, 0, 0, 0, 1, 1,
1.102803, -1.711263, 2.096943, 0, 0, 0, 1, 1,
1.106934, -2.073448, 3.31531, 0, 0, 0, 1, 1,
1.113564, -1.459583, 1.115138, 0, 0, 0, 1, 1,
1.114811, 0.3986157, 1.979125, 0, 0, 0, 1, 1,
1.117901, -0.2273232, 1.951833, 0, 0, 0, 1, 1,
1.124613, 1.431223, -0.7410813, 0, 0, 0, 1, 1,
1.124856, -0.4985913, 1.561272, 1, 1, 1, 1, 1,
1.134482, -1.322871, 1.266698, 1, 1, 1, 1, 1,
1.135594, -0.9395319, 3.267025, 1, 1, 1, 1, 1,
1.147323, 0.03929238, 0.1574678, 1, 1, 1, 1, 1,
1.152443, 0.1158056, 1.27333, 1, 1, 1, 1, 1,
1.158579, 0.7236115, -1.198853, 1, 1, 1, 1, 1,
1.158942, -0.2027732, 0.06996329, 1, 1, 1, 1, 1,
1.161084, 0.7133534, 0.5454684, 1, 1, 1, 1, 1,
1.162187, -0.2441389, 0.1997258, 1, 1, 1, 1, 1,
1.166385, -1.015869, 2.819116, 1, 1, 1, 1, 1,
1.168273, -0.4610667, 0.9723281, 1, 1, 1, 1, 1,
1.172111, 0.3040449, 1.650169, 1, 1, 1, 1, 1,
1.178445, -1.995828, 1.270101, 1, 1, 1, 1, 1,
1.178457, 0.03025202, 1.698676, 1, 1, 1, 1, 1,
1.180434, -0.4050686, 2.638265, 1, 1, 1, 1, 1,
1.182104, 1.047604, 0.5747729, 0, 0, 1, 1, 1,
1.186998, 1.653185, 1.870372, 1, 0, 0, 1, 1,
1.187941, -1.242343, 1.302119, 1, 0, 0, 1, 1,
1.198691, 0.6893681, 0.9307565, 1, 0, 0, 1, 1,
1.201653, -0.4971929, 1.520842, 1, 0, 0, 1, 1,
1.225238, -0.9453266, 0.2532934, 1, 0, 0, 1, 1,
1.226353, 0.5944539, 0.3243298, 0, 0, 0, 1, 1,
1.23439, 1.267846, 1.592537, 0, 0, 0, 1, 1,
1.235338, 0.2434641, 0.6018841, 0, 0, 0, 1, 1,
1.237435, -0.04381729, 1.688936, 0, 0, 0, 1, 1,
1.238884, -0.2572836, 2.395508, 0, 0, 0, 1, 1,
1.243245, 0.281963, 1.319512, 0, 0, 0, 1, 1,
1.248823, 1.252204, 0.1529333, 0, 0, 0, 1, 1,
1.255291, 0.03856646, 3.153187, 1, 1, 1, 1, 1,
1.256176, 0.5611477, 0.7084286, 1, 1, 1, 1, 1,
1.268879, 1.151202, 3.325547, 1, 1, 1, 1, 1,
1.276043, -0.6849498, 2.847259, 1, 1, 1, 1, 1,
1.287589, -0.06143885, 1.88289, 1, 1, 1, 1, 1,
1.309361, -0.3270649, -0.4291065, 1, 1, 1, 1, 1,
1.312463, -1.778828, 0.9789894, 1, 1, 1, 1, 1,
1.321869, -0.4625117, 1.117255, 1, 1, 1, 1, 1,
1.325459, -1.079443, 0.7490512, 1, 1, 1, 1, 1,
1.331618, 1.447396, -1.342429, 1, 1, 1, 1, 1,
1.336092, -0.5423343, 2.671875, 1, 1, 1, 1, 1,
1.33686, -2.169673, 1.907026, 1, 1, 1, 1, 1,
1.34152, -2.088852, 2.625394, 1, 1, 1, 1, 1,
1.342092, 1.466642, -1.286425, 1, 1, 1, 1, 1,
1.345752, -1.294174, 2.474685, 1, 1, 1, 1, 1,
1.348502, -0.9252369, 1.09576, 0, 0, 1, 1, 1,
1.348714, 0.8222409, 0.1400935, 1, 0, 0, 1, 1,
1.349136, 0.6761398, 2.046472, 1, 0, 0, 1, 1,
1.355022, 0.6378046, 0.4919829, 1, 0, 0, 1, 1,
1.357033, 1.5778, 0.3871364, 1, 0, 0, 1, 1,
1.357364, -1.300816, 3.647063, 1, 0, 0, 1, 1,
1.364637, -1.232392, 0.2700279, 0, 0, 0, 1, 1,
1.368918, -0.7283887, 1.808668, 0, 0, 0, 1, 1,
1.372686, 0.1614202, 2.671965, 0, 0, 0, 1, 1,
1.378193, 0.2514334, 2.207802, 0, 0, 0, 1, 1,
1.378946, 0.2353127, 2.561761, 0, 0, 0, 1, 1,
1.379102, 0.4083778, 0.2911263, 0, 0, 0, 1, 1,
1.382314, -0.06012053, 4.242759, 0, 0, 0, 1, 1,
1.38338, 1.61838, 1.259927, 1, 1, 1, 1, 1,
1.419237, 0.7733856, 1.58522, 1, 1, 1, 1, 1,
1.420387, 1.341976, -0.1450716, 1, 1, 1, 1, 1,
1.422962, -2.239299, 2.11357, 1, 1, 1, 1, 1,
1.423706, -0.6261905, 2.369356, 1, 1, 1, 1, 1,
1.423824, -0.9637216, 2.065578, 1, 1, 1, 1, 1,
1.425453, 0.2386551, 0.2734712, 1, 1, 1, 1, 1,
1.430186, -1.306062, 1.792089, 1, 1, 1, 1, 1,
1.440176, -0.1855809, 2.285994, 1, 1, 1, 1, 1,
1.446203, 1.15524, 0.2404723, 1, 1, 1, 1, 1,
1.446789, -0.9399022, 2.748231, 1, 1, 1, 1, 1,
1.462308, 1.625238, 1.306587, 1, 1, 1, 1, 1,
1.472593, -0.2170194, 0.002617427, 1, 1, 1, 1, 1,
1.477071, -0.2147902, 2.006133, 1, 1, 1, 1, 1,
1.478836, 0.05500929, 2.28055, 1, 1, 1, 1, 1,
1.483832, 1.047073, 2.038919, 0, 0, 1, 1, 1,
1.501336, 1.313734, 0.7536485, 1, 0, 0, 1, 1,
1.517104, 0.107576, 1.530002, 1, 0, 0, 1, 1,
1.518828, 1.272876, 1.356625, 1, 0, 0, 1, 1,
1.523748, -0.2824069, 2.32869, 1, 0, 0, 1, 1,
1.530457, -1.080358, 1.182055, 1, 0, 0, 1, 1,
1.539837, 1.280522, 2.706069, 0, 0, 0, 1, 1,
1.54548, -0.4860218, 2.008506, 0, 0, 0, 1, 1,
1.56989, -1.053888, 3.225796, 0, 0, 0, 1, 1,
1.578901, -0.4631305, 1.073246, 0, 0, 0, 1, 1,
1.581846, -2.391751, 1.990986, 0, 0, 0, 1, 1,
1.588146, -1.377319, 3.023517, 0, 0, 0, 1, 1,
1.58983, 1.793128, 1.863107, 0, 0, 0, 1, 1,
1.592478, -0.5140525, 1.827323, 1, 1, 1, 1, 1,
1.592927, -0.545527, 1.971673, 1, 1, 1, 1, 1,
1.599005, 0.334636, 2.132981, 1, 1, 1, 1, 1,
1.607949, -0.4120634, 1.577246, 1, 1, 1, 1, 1,
1.621471, 0.6475858, 1.393878, 1, 1, 1, 1, 1,
1.641875, 0.02499994, 0.3614794, 1, 1, 1, 1, 1,
1.646653, -0.4258026, 3.007668, 1, 1, 1, 1, 1,
1.662575, -0.9839536, 1.815512, 1, 1, 1, 1, 1,
1.664576, -0.1550638, 2.960709, 1, 1, 1, 1, 1,
1.668704, -0.8757815, 1.370572, 1, 1, 1, 1, 1,
1.669651, 0.6536464, 1.239901, 1, 1, 1, 1, 1,
1.671863, 0.7413571, -0.9600903, 1, 1, 1, 1, 1,
1.679608, 0.9111266, -0.4063674, 1, 1, 1, 1, 1,
1.684804, -0.1455205, 1.16738, 1, 1, 1, 1, 1,
1.687979, 1.102728, -0.1944358, 1, 1, 1, 1, 1,
1.688249, 0.6804404, 0.6069713, 0, 0, 1, 1, 1,
1.690362, -0.6455563, 4.490856, 1, 0, 0, 1, 1,
1.71349, 0.949112, 0.904696, 1, 0, 0, 1, 1,
1.721895, 2.484193, -0.8343295, 1, 0, 0, 1, 1,
1.722249, 0.08949059, 1.87589, 1, 0, 0, 1, 1,
1.72341, -0.3450444, 0.5465785, 1, 0, 0, 1, 1,
1.742168, -0.1585851, 3.086711, 0, 0, 0, 1, 1,
1.752333, -0.5278137, 0.747131, 0, 0, 0, 1, 1,
1.753083, -0.3206402, 1.920114, 0, 0, 0, 1, 1,
1.758248, 0.08137887, 0.09715258, 0, 0, 0, 1, 1,
1.776131, -0.82851, 1.02435, 0, 0, 0, 1, 1,
1.777958, 1.764814, 1.203176, 0, 0, 0, 1, 1,
1.778865, -0.115022, -0.01621114, 0, 0, 0, 1, 1,
1.78677, 0.8090326, -0.5917416, 1, 1, 1, 1, 1,
1.82732, 0.4691611, 0.1615304, 1, 1, 1, 1, 1,
1.831733, 0.3903676, 2.037999, 1, 1, 1, 1, 1,
1.838427, 1.77802, 1.402867, 1, 1, 1, 1, 1,
1.850741, 0.6015819, 1.052348, 1, 1, 1, 1, 1,
1.856755, -0.245459, 0.6585335, 1, 1, 1, 1, 1,
1.857748, -0.8692114, 0.7992744, 1, 1, 1, 1, 1,
1.869255, 0.129529, 0.6877042, 1, 1, 1, 1, 1,
1.880014, 0.3669374, -0.07698879, 1, 1, 1, 1, 1,
1.905601, 1.071046, 1.252706, 1, 1, 1, 1, 1,
1.90935, -0.7899455, 1.95882, 1, 1, 1, 1, 1,
1.913191, -0.2144974, 0.5584639, 1, 1, 1, 1, 1,
1.934211, 0.9158555, -0.5745778, 1, 1, 1, 1, 1,
1.937833, -0.01411971, 3.290937, 1, 1, 1, 1, 1,
1.946215, -2.922534, 1.921762, 1, 1, 1, 1, 1,
2.005642, -2.106837, 4.708282, 0, 0, 1, 1, 1,
2.024094, -1.999811, 3.564396, 1, 0, 0, 1, 1,
2.047749, 0.06209902, 1.120714, 1, 0, 0, 1, 1,
2.056372, -0.3270657, 0.2397612, 1, 0, 0, 1, 1,
2.09687, -1.379858, 0.8672444, 1, 0, 0, 1, 1,
2.097193, 1.339284, -0.099595, 1, 0, 0, 1, 1,
2.098239, -0.4879364, 1.240276, 0, 0, 0, 1, 1,
2.116549, 0.05138298, 2.422852, 0, 0, 0, 1, 1,
2.175388, 0.2753946, 0.3053327, 0, 0, 0, 1, 1,
2.188341, -0.4681551, 1.471087, 0, 0, 0, 1, 1,
2.213096, 0.7824994, 1.274442, 0, 0, 0, 1, 1,
2.322576, -1.155538, 2.060287, 0, 0, 0, 1, 1,
2.340111, -0.8584628, 2.663403, 0, 0, 0, 1, 1,
2.408871, 0.9062626, 0.02958321, 1, 1, 1, 1, 1,
2.458089, 0.8053485, 1.059669, 1, 1, 1, 1, 1,
2.538435, -0.8780722, 2.843537, 1, 1, 1, 1, 1,
2.549218, 0.6183347, 1.933056, 1, 1, 1, 1, 1,
2.57801, 0.5120791, 1.567933, 1, 1, 1, 1, 1,
2.63042, -1.032871, 1.962023, 1, 1, 1, 1, 1,
3.319029, -0.04457391, 1.55416, 1, 1, 1, 1, 1
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
var radius = 9.243389;
var distance = 32.46701;
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
mvMatrix.translate( -0.3133097, 0.05610693, 0.483923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.46701);
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