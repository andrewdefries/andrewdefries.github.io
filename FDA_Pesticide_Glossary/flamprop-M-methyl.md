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
-2.706967, 1.178495, -0.2898659, 1, 0, 0, 1,
-2.64558, 0.1049569, -1.598409, 1, 0.007843138, 0, 1,
-2.639525, -2.849842, -3.259567, 1, 0.01176471, 0, 1,
-2.460402, -1.946084, -1.924087, 1, 0.01960784, 0, 1,
-2.40959, 0.8494709, -2.319918, 1, 0.02352941, 0, 1,
-2.392565, -0.8503715, -2.478644, 1, 0.03137255, 0, 1,
-2.328417, 0.5339516, -0.6095333, 1, 0.03529412, 0, 1,
-2.266615, -1.044522, -1.695519, 1, 0.04313726, 0, 1,
-2.170814, -0.4229714, -0.7854208, 1, 0.04705882, 0, 1,
-2.169616, -1.031782, -0.4404233, 1, 0.05490196, 0, 1,
-2.130445, -1.112255, -1.427589, 1, 0.05882353, 0, 1,
-2.128577, 0.04098286, -1.418936, 1, 0.06666667, 0, 1,
-2.110999, -1.602142, -3.046321, 1, 0.07058824, 0, 1,
-2.091706, -1.112904, -2.019337, 1, 0.07843138, 0, 1,
-2.058457, 1.423821, -1.173576, 1, 0.08235294, 0, 1,
-2.035985, -2.386638, -3.694399, 1, 0.09019608, 0, 1,
-2.00655, -0.1465189, -1.009147, 1, 0.09411765, 0, 1,
-1.979317, -0.3647856, -1.509672, 1, 0.1019608, 0, 1,
-1.969163, 0.2310037, -3.066599, 1, 0.1098039, 0, 1,
-1.944316, 0.08335795, -2.413515, 1, 0.1137255, 0, 1,
-1.937297, 0.161377, -0.6930586, 1, 0.1215686, 0, 1,
-1.93567, 1.725209, -2.590909, 1, 0.1254902, 0, 1,
-1.926506, 1.288497, -2.211247, 1, 0.1333333, 0, 1,
-1.923027, 0.009749465, -1.38303, 1, 0.1372549, 0, 1,
-1.914824, -0.5792168, -2.617819, 1, 0.145098, 0, 1,
-1.909396, 0.9836481, 0.139592, 1, 0.1490196, 0, 1,
-1.897572, 1.175434, -0.803598, 1, 0.1568628, 0, 1,
-1.886026, -0.7125487, -4.608086, 1, 0.1607843, 0, 1,
-1.87929, 1.535618, -1.795195, 1, 0.1686275, 0, 1,
-1.874928, 0.3146861, -1.792361, 1, 0.172549, 0, 1,
-1.859773, 1.551386, 0.2878909, 1, 0.1803922, 0, 1,
-1.817325, -0.5640359, -2.420475, 1, 0.1843137, 0, 1,
-1.806156, -1.786215, -4.176178, 1, 0.1921569, 0, 1,
-1.778122, 1.444882, -0.6523753, 1, 0.1960784, 0, 1,
-1.776671, -0.4839273, -3.074526, 1, 0.2039216, 0, 1,
-1.762108, 1.350636, -0.3228492, 1, 0.2117647, 0, 1,
-1.73383, -2.12252, -3.207907, 1, 0.2156863, 0, 1,
-1.705976, -0.3544827, -3.595324, 1, 0.2235294, 0, 1,
-1.697534, -0.9953473, -2.132142, 1, 0.227451, 0, 1,
-1.694661, 0.3278595, -3.051729, 1, 0.2352941, 0, 1,
-1.67167, 0.1385438, -2.321791, 1, 0.2392157, 0, 1,
-1.667107, 2.046829, -1.612473, 1, 0.2470588, 0, 1,
-1.645486, -1.146016, -0.9967749, 1, 0.2509804, 0, 1,
-1.634123, 0.2028366, -0.2396311, 1, 0.2588235, 0, 1,
-1.633227, 0.2018473, -0.5093742, 1, 0.2627451, 0, 1,
-1.631979, 0.0172485, -0.6663073, 1, 0.2705882, 0, 1,
-1.62751, 0.06856203, -1.531408, 1, 0.2745098, 0, 1,
-1.603807, 0.03510169, -1.19747, 1, 0.282353, 0, 1,
-1.5965, 0.6450127, 0.08605674, 1, 0.2862745, 0, 1,
-1.579694, 0.6165529, -0.8370554, 1, 0.2941177, 0, 1,
-1.579008, 1.366798, 0.8118608, 1, 0.3019608, 0, 1,
-1.577914, -0.3689567, -0.8945742, 1, 0.3058824, 0, 1,
-1.575583, 0.6334708, -1.127141, 1, 0.3137255, 0, 1,
-1.573281, 0.8419635, -1.195868, 1, 0.3176471, 0, 1,
-1.566665, -0.916484, -2.283875, 1, 0.3254902, 0, 1,
-1.559399, -0.3300673, 0.122072, 1, 0.3294118, 0, 1,
-1.550433, -1.036876, -1.313581, 1, 0.3372549, 0, 1,
-1.549003, 0.1882953, -1.772772, 1, 0.3411765, 0, 1,
-1.543436, -0.6835879, 0.2235333, 1, 0.3490196, 0, 1,
-1.53646, 0.5288085, -1.867083, 1, 0.3529412, 0, 1,
-1.536298, 0.06969265, -0.1383241, 1, 0.3607843, 0, 1,
-1.479213, -0.3854846, -0.9880015, 1, 0.3647059, 0, 1,
-1.467602, -0.4998194, -1.320851, 1, 0.372549, 0, 1,
-1.451094, -0.9833409, -1.998304, 1, 0.3764706, 0, 1,
-1.447476, 0.05447759, -1.736228, 1, 0.3843137, 0, 1,
-1.445075, 1.514946, -0.2092005, 1, 0.3882353, 0, 1,
-1.438411, -0.9109042, -3.591828, 1, 0.3960784, 0, 1,
-1.43716, -0.2898051, -1.936389, 1, 0.4039216, 0, 1,
-1.434724, -0.4088662, -2.488006, 1, 0.4078431, 0, 1,
-1.434288, 0.1336852, -1.152569, 1, 0.4156863, 0, 1,
-1.421125, 0.004706729, -0.6374196, 1, 0.4196078, 0, 1,
-1.409337, 0.1205138, -0.2566153, 1, 0.427451, 0, 1,
-1.392, -1.217688, -2.23436, 1, 0.4313726, 0, 1,
-1.389541, 0.9747061, 0.07879817, 1, 0.4392157, 0, 1,
-1.37092, -1.037814, -2.836865, 1, 0.4431373, 0, 1,
-1.365328, -0.001234666, -2.343112, 1, 0.4509804, 0, 1,
-1.35308, 0.6723284, -1.259334, 1, 0.454902, 0, 1,
-1.353054, -1.020516, 0.0571754, 1, 0.4627451, 0, 1,
-1.333126, -0.8628828, 1.067541, 1, 0.4666667, 0, 1,
-1.31221, 0.9473704, -1.931395, 1, 0.4745098, 0, 1,
-1.307646, -0.516049, -1.570366, 1, 0.4784314, 0, 1,
-1.304772, -0.1082922, -1.299309, 1, 0.4862745, 0, 1,
-1.303418, 0.4547656, 0.31715, 1, 0.4901961, 0, 1,
-1.299748, 1.178155, -1.351817, 1, 0.4980392, 0, 1,
-1.286588, 0.6911942, -1.202202, 1, 0.5058824, 0, 1,
-1.275801, -0.756045, -0.7287875, 1, 0.509804, 0, 1,
-1.269744, -0.5849674, -3.601852, 1, 0.5176471, 0, 1,
-1.263819, 0.2615947, -1.809505, 1, 0.5215687, 0, 1,
-1.261458, 0.463536, -1.520847, 1, 0.5294118, 0, 1,
-1.260631, 0.7910677, -0.5308118, 1, 0.5333334, 0, 1,
-1.249401, 1.130528, -0.7113635, 1, 0.5411765, 0, 1,
-1.245634, -1.454333, 0.1918669, 1, 0.5450981, 0, 1,
-1.241059, 1.397757, -1.401973, 1, 0.5529412, 0, 1,
-1.240577, -0.2199639, -1.882011, 1, 0.5568628, 0, 1,
-1.238862, -0.1436307, -0.8251336, 1, 0.5647059, 0, 1,
-1.237123, 0.3155247, 0.3877651, 1, 0.5686275, 0, 1,
-1.23121, 0.5854973, 0.8437155, 1, 0.5764706, 0, 1,
-1.218766, -0.9641625, -1.007864, 1, 0.5803922, 0, 1,
-1.21133, 1.787524, 0.002581783, 1, 0.5882353, 0, 1,
-1.208689, 1.443573, -1.140206, 1, 0.5921569, 0, 1,
-1.197471, 0.823594, 0.5278454, 1, 0.6, 0, 1,
-1.197322, -0.339278, -0.9024404, 1, 0.6078432, 0, 1,
-1.197024, -0.1308639, -3.435377, 1, 0.6117647, 0, 1,
-1.196826, -0.654475, -3.298178, 1, 0.6196079, 0, 1,
-1.195914, 0.3617733, -2.071565, 1, 0.6235294, 0, 1,
-1.187187, 0.7935655, -1.74214, 1, 0.6313726, 0, 1,
-1.179937, -2.122186, -1.443485, 1, 0.6352941, 0, 1,
-1.171723, -0.6476884, -1.888176, 1, 0.6431373, 0, 1,
-1.169326, 0.05311663, -1.594587, 1, 0.6470588, 0, 1,
-1.166645, -0.1077829, -1.342306, 1, 0.654902, 0, 1,
-1.164324, -1.061693, -3.000412, 1, 0.6588235, 0, 1,
-1.158915, 0.6439273, -0.4380414, 1, 0.6666667, 0, 1,
-1.153271, 1.635756, 0.2955868, 1, 0.6705883, 0, 1,
-1.137902, 0.8509127, 0.02957457, 1, 0.6784314, 0, 1,
-1.137107, -0.666503, -2.209323, 1, 0.682353, 0, 1,
-1.135955, 0.8064175, -2.192807, 1, 0.6901961, 0, 1,
-1.135369, 0.5654608, -2.003854, 1, 0.6941177, 0, 1,
-1.132736, -0.9228796, -3.242452, 1, 0.7019608, 0, 1,
-1.121662, -0.6073005, -0.8861692, 1, 0.7098039, 0, 1,
-1.12039, 0.5256352, -1.382047, 1, 0.7137255, 0, 1,
-1.117343, 0.5361834, -1.613565, 1, 0.7215686, 0, 1,
-1.116902, 0.9243522, -1.507454, 1, 0.7254902, 0, 1,
-1.11685, 0.5846866, -1.598432, 1, 0.7333333, 0, 1,
-1.109281, -0.645716, -1.760566, 1, 0.7372549, 0, 1,
-1.108878, 1.157168, 0.7494845, 1, 0.7450981, 0, 1,
-1.108793, 1.192181, -0.1590516, 1, 0.7490196, 0, 1,
-1.10732, -0.4600223, -1.15217, 1, 0.7568628, 0, 1,
-1.10592, 1.023063, 0.3565107, 1, 0.7607843, 0, 1,
-1.090948, 0.7984459, -1.838679, 1, 0.7686275, 0, 1,
-1.085887, 1.462868, -0.3131474, 1, 0.772549, 0, 1,
-1.083526, 0.2370968, -0.9934596, 1, 0.7803922, 0, 1,
-1.077837, 0.6910295, -0.692103, 1, 0.7843137, 0, 1,
-1.070038, 0.2012014, -0.8137319, 1, 0.7921569, 0, 1,
-1.069257, 0.6171144, 0.2472882, 1, 0.7960784, 0, 1,
-1.066829, 1.462795, -0.04380942, 1, 0.8039216, 0, 1,
-1.066267, -2.057031, -2.978843, 1, 0.8117647, 0, 1,
-1.065843, -1.510704, -1.182302, 1, 0.8156863, 0, 1,
-1.062589, -1.327503, -2.854893, 1, 0.8235294, 0, 1,
-1.055943, 0.1123934, -0.691085, 1, 0.827451, 0, 1,
-1.049402, 0.5977335, -0.812888, 1, 0.8352941, 0, 1,
-1.045502, 1.361203, -1.89343, 1, 0.8392157, 0, 1,
-1.045259, 0.5008911, -1.566292, 1, 0.8470588, 0, 1,
-1.038833, 0.801145, -0.7034619, 1, 0.8509804, 0, 1,
-1.038659, -0.8238496, -2.658794, 1, 0.8588235, 0, 1,
-1.03577, 1.352052, -1.485997, 1, 0.8627451, 0, 1,
-1.033822, 1.140043, -0.5979123, 1, 0.8705882, 0, 1,
-1.02482, -1.963782, -0.3944762, 1, 0.8745098, 0, 1,
-1.016475, -0.9905534, -2.770432, 1, 0.8823529, 0, 1,
-1.015102, 0.8066872, -2.701798, 1, 0.8862745, 0, 1,
-1.013745, 0.8927436, -0.1778578, 1, 0.8941177, 0, 1,
-1.010536, 0.3886584, -1.672152, 1, 0.8980392, 0, 1,
-1.009758, 1.103052, -1.481907, 1, 0.9058824, 0, 1,
-1.008365, -1.543849, -3.186703, 1, 0.9137255, 0, 1,
-1.007569, -0.7188044, -2.809372, 1, 0.9176471, 0, 1,
-1.003655, -1.057005, -0.8014023, 1, 0.9254902, 0, 1,
-0.9995195, 0.08418304, -0.4348001, 1, 0.9294118, 0, 1,
-0.9969811, -0.6914716, -2.721684, 1, 0.9372549, 0, 1,
-0.9933856, 1.000747, 0.1104189, 1, 0.9411765, 0, 1,
-0.9889255, 0.8264852, -0.5663171, 1, 0.9490196, 0, 1,
-0.9887187, -1.181095, -0.818433, 1, 0.9529412, 0, 1,
-0.9836504, -0.5416511, -1.209765, 1, 0.9607843, 0, 1,
-0.9813991, 0.6100971, -1.370777, 1, 0.9647059, 0, 1,
-0.9808674, -1.201364, -2.905411, 1, 0.972549, 0, 1,
-0.9804157, 0.1578806, -1.037371, 1, 0.9764706, 0, 1,
-0.9789714, 0.2485715, -1.950866, 1, 0.9843137, 0, 1,
-0.9770471, -0.5318151, -2.54596, 1, 0.9882353, 0, 1,
-0.9687085, -1.42889, -3.504454, 1, 0.9960784, 0, 1,
-0.9670851, -0.003588452, -3.929563, 0.9960784, 1, 0, 1,
-0.9546118, -1.294265, -2.771306, 0.9921569, 1, 0, 1,
-0.9500189, -0.9629338, -2.685753, 0.9843137, 1, 0, 1,
-0.948812, 0.6274616, -0.988017, 0.9803922, 1, 0, 1,
-0.9452703, 1.213083, -2.181955, 0.972549, 1, 0, 1,
-0.942794, -1.060058, -1.213757, 0.9686275, 1, 0, 1,
-0.940414, 0.2440977, 1.235176, 0.9607843, 1, 0, 1,
-0.9388573, -0.4560055, -4.495654, 0.9568627, 1, 0, 1,
-0.9387013, -1.401476, -2.23172, 0.9490196, 1, 0, 1,
-0.9373632, 0.03221695, -1.242224, 0.945098, 1, 0, 1,
-0.9337579, -0.3443277, -1.611364, 0.9372549, 1, 0, 1,
-0.9293161, 0.7921826, -0.02039288, 0.9333333, 1, 0, 1,
-0.9262962, -1.837246, -2.813237, 0.9254902, 1, 0, 1,
-0.9260389, 2.045277, -0.712404, 0.9215686, 1, 0, 1,
-0.9247223, -0.682843, -0.8220356, 0.9137255, 1, 0, 1,
-0.9207253, -0.03834954, -1.636432, 0.9098039, 1, 0, 1,
-0.9181107, 0.5183421, -1.285516, 0.9019608, 1, 0, 1,
-0.9117008, -0.4476376, -2.549816, 0.8941177, 1, 0, 1,
-0.907267, 1.163587, 1.152546, 0.8901961, 1, 0, 1,
-0.9050027, -0.9782944, -3.18187, 0.8823529, 1, 0, 1,
-0.8995108, -0.1869592, -1.07083, 0.8784314, 1, 0, 1,
-0.8974478, 0.2327517, -2.190195, 0.8705882, 1, 0, 1,
-0.8930933, 0.2146942, -0.3485145, 0.8666667, 1, 0, 1,
-0.8917518, 0.1936404, -0.01402297, 0.8588235, 1, 0, 1,
-0.8888708, 0.8584651, -0.4450676, 0.854902, 1, 0, 1,
-0.8842992, -0.2659879, -2.136622, 0.8470588, 1, 0, 1,
-0.8739452, 0.730597, -2.157934, 0.8431373, 1, 0, 1,
-0.873549, 0.8269451, -0.756787, 0.8352941, 1, 0, 1,
-0.8716186, -0.3448829, -1.141746, 0.8313726, 1, 0, 1,
-0.868829, -0.1571838, 0.3473786, 0.8235294, 1, 0, 1,
-0.8660637, -0.0273092, -0.8793041, 0.8196079, 1, 0, 1,
-0.8592281, -1.823497, -3.719438, 0.8117647, 1, 0, 1,
-0.8591985, 1.06873, 0.2458959, 0.8078431, 1, 0, 1,
-0.8526034, -0.7527073, -1.89116, 0.8, 1, 0, 1,
-0.8499955, -0.8910111, -1.821, 0.7921569, 1, 0, 1,
-0.843652, -0.2527795, -2.061516, 0.7882353, 1, 0, 1,
-0.8411145, 0.3894386, 0.07753426, 0.7803922, 1, 0, 1,
-0.8270518, -0.5378748, -2.15433, 0.7764706, 1, 0, 1,
-0.8212276, 0.1131248, -2.084322, 0.7686275, 1, 0, 1,
-0.8169923, -1.816959, -4.580078, 0.7647059, 1, 0, 1,
-0.8152676, -0.4773022, -2.766302, 0.7568628, 1, 0, 1,
-0.8109108, 0.07349048, -2.140705, 0.7529412, 1, 0, 1,
-0.8064337, 0.2455181, -2.426293, 0.7450981, 1, 0, 1,
-0.8013743, -0.1423773, -0.9739937, 0.7411765, 1, 0, 1,
-0.7995958, -0.1213984, -2.515887, 0.7333333, 1, 0, 1,
-0.7953027, -0.1819461, -1.983989, 0.7294118, 1, 0, 1,
-0.7895645, -0.6491018, -1.105569, 0.7215686, 1, 0, 1,
-0.7821446, 0.6441924, -1.687315, 0.7176471, 1, 0, 1,
-0.7803398, 2.02217, 0.2165943, 0.7098039, 1, 0, 1,
-0.7798771, 0.2194531, -0.7436036, 0.7058824, 1, 0, 1,
-0.7772394, 0.1414108, -1.520165, 0.6980392, 1, 0, 1,
-0.7703248, 1.009791, -0.8370897, 0.6901961, 1, 0, 1,
-0.7624729, 0.6491119, -0.1363588, 0.6862745, 1, 0, 1,
-0.7571825, 1.332902, 0.01688707, 0.6784314, 1, 0, 1,
-0.75475, 0.6043748, 0.09617712, 0.6745098, 1, 0, 1,
-0.7451813, 0.805303, -0.708827, 0.6666667, 1, 0, 1,
-0.7390545, -0.4018429, -2.968962, 0.6627451, 1, 0, 1,
-0.7379062, 0.6532702, -0.164842, 0.654902, 1, 0, 1,
-0.7352767, 0.3315377, 0.499241, 0.6509804, 1, 0, 1,
-0.7310867, 1.050242, -1.809512, 0.6431373, 1, 0, 1,
-0.7265285, -0.9662482, -3.500456, 0.6392157, 1, 0, 1,
-0.7239611, 0.8034595, -0.203731, 0.6313726, 1, 0, 1,
-0.7238218, -1.28082, -1.602056, 0.627451, 1, 0, 1,
-0.722525, -1.303122, -1.765862, 0.6196079, 1, 0, 1,
-0.721987, -1.20123, -1.658309, 0.6156863, 1, 0, 1,
-0.7175163, 1.145796, -0.5049123, 0.6078432, 1, 0, 1,
-0.7148972, 1.395577, 0.7169198, 0.6039216, 1, 0, 1,
-0.7126061, -0.7719119, -2.099621, 0.5960785, 1, 0, 1,
-0.7103825, 0.2584557, -0.4017027, 0.5882353, 1, 0, 1,
-0.7014635, 0.1912146, -0.7695909, 0.5843138, 1, 0, 1,
-0.6972984, -1.564409, -3.52855, 0.5764706, 1, 0, 1,
-0.6949958, 0.9417642, -0.9933507, 0.572549, 1, 0, 1,
-0.6829188, 0.8062226, -0.5227632, 0.5647059, 1, 0, 1,
-0.6786316, -0.1652737, -2.220672, 0.5607843, 1, 0, 1,
-0.677705, -1.965534, -2.448674, 0.5529412, 1, 0, 1,
-0.6760894, 0.7107112, -2.113217, 0.5490196, 1, 0, 1,
-0.6669275, -0.8251266, -2.179523, 0.5411765, 1, 0, 1,
-0.6662121, 0.0989171, -2.99506, 0.5372549, 1, 0, 1,
-0.6635383, -1.35743, -3.858757, 0.5294118, 1, 0, 1,
-0.6628361, 1.373977, -2.172713, 0.5254902, 1, 0, 1,
-0.649868, -1.311493, -2.736013, 0.5176471, 1, 0, 1,
-0.6458634, -1.388528, -3.61811, 0.5137255, 1, 0, 1,
-0.6430553, -0.1297661, -2.57871, 0.5058824, 1, 0, 1,
-0.6419963, 1.077259, -1.479331, 0.5019608, 1, 0, 1,
-0.6383686, -1.262583, -3.305468, 0.4941176, 1, 0, 1,
-0.637073, -0.430311, -1.469016, 0.4862745, 1, 0, 1,
-0.6367595, 0.9236231, -1.8995, 0.4823529, 1, 0, 1,
-0.6312747, -2.447999, -4.488161, 0.4745098, 1, 0, 1,
-0.6250353, -1.035555, -3.162399, 0.4705882, 1, 0, 1,
-0.6189743, -0.6476708, -1.237529, 0.4627451, 1, 0, 1,
-0.6103389, 0.6998739, -1.094162, 0.4588235, 1, 0, 1,
-0.6100112, -0.6876683, -1.219156, 0.4509804, 1, 0, 1,
-0.609308, -1.043578, -3.263822, 0.4470588, 1, 0, 1,
-0.5892393, 0.7449901, -1.456567, 0.4392157, 1, 0, 1,
-0.5878098, 1.087729, -0.4292439, 0.4352941, 1, 0, 1,
-0.5869121, 0.4103612, 0.07338656, 0.427451, 1, 0, 1,
-0.5843794, 0.3975301, -1.490621, 0.4235294, 1, 0, 1,
-0.5833373, -2.48385, -1.06512, 0.4156863, 1, 0, 1,
-0.5817325, -2.148352, -3.972449, 0.4117647, 1, 0, 1,
-0.5807167, -0.3682154, -1.648142, 0.4039216, 1, 0, 1,
-0.5788846, 0.8847578, -1.775359, 0.3960784, 1, 0, 1,
-0.5738724, 0.5844842, 0.2466597, 0.3921569, 1, 0, 1,
-0.5719346, -0.04104358, -1.503337, 0.3843137, 1, 0, 1,
-0.5707562, -1.216884, -4.815565, 0.3803922, 1, 0, 1,
-0.5688933, -0.3421158, -1.718424, 0.372549, 1, 0, 1,
-0.5676515, 0.05597584, -1.312272, 0.3686275, 1, 0, 1,
-0.566406, 0.5169164, -2.237634, 0.3607843, 1, 0, 1,
-0.5647028, -0.117789, -0.9479975, 0.3568628, 1, 0, 1,
-0.5622553, 1.036441, 1.227657, 0.3490196, 1, 0, 1,
-0.5601557, 0.1639801, -1.421988, 0.345098, 1, 0, 1,
-0.5591151, 0.1219054, -1.27333, 0.3372549, 1, 0, 1,
-0.5578472, 0.3741998, -0.7764509, 0.3333333, 1, 0, 1,
-0.5548345, 0.8285339, 0.3627573, 0.3254902, 1, 0, 1,
-0.5492588, 0.6144738, -0.1020954, 0.3215686, 1, 0, 1,
-0.5466654, 1.258084, -0.09273557, 0.3137255, 1, 0, 1,
-0.544548, 0.3048046, -0.5056629, 0.3098039, 1, 0, 1,
-0.5435516, 0.7370048, -0.4483367, 0.3019608, 1, 0, 1,
-0.5387447, 0.2382748, -0.7247602, 0.2941177, 1, 0, 1,
-0.53226, 0.2064522, -1.160673, 0.2901961, 1, 0, 1,
-0.5322452, -0.6484457, -3.6665, 0.282353, 1, 0, 1,
-0.5320624, -1.017219, -2.656849, 0.2784314, 1, 0, 1,
-0.529591, 0.7350653, -0.1139533, 0.2705882, 1, 0, 1,
-0.5246592, 0.1861472, -0.7974268, 0.2666667, 1, 0, 1,
-0.5193604, -0.2998637, -1.46507, 0.2588235, 1, 0, 1,
-0.5170889, 0.6728874, -0.9620878, 0.254902, 1, 0, 1,
-0.5163598, -1.334941, -3.069473, 0.2470588, 1, 0, 1,
-0.5159296, -0.1225133, -3.876032, 0.2431373, 1, 0, 1,
-0.5152366, 0.5264051, -1.240859, 0.2352941, 1, 0, 1,
-0.5123489, -1.488406, -3.02808, 0.2313726, 1, 0, 1,
-0.5108195, -1.948675, -2.598493, 0.2235294, 1, 0, 1,
-0.5017641, 0.1827672, -1.11027, 0.2196078, 1, 0, 1,
-0.5002565, 0.4502942, 0.1322531, 0.2117647, 1, 0, 1,
-0.4980653, -1.468629, -2.681655, 0.2078431, 1, 0, 1,
-0.4870794, 0.3320958, -0.9863601, 0.2, 1, 0, 1,
-0.4818904, -0.4044633, -2.127783, 0.1921569, 1, 0, 1,
-0.4807992, -2.20544, -4.415839, 0.1882353, 1, 0, 1,
-0.4805567, -0.1498254, -2.369651, 0.1803922, 1, 0, 1,
-0.4792219, -0.751839, -2.954944, 0.1764706, 1, 0, 1,
-0.4771614, 0.653527, -1.108933, 0.1686275, 1, 0, 1,
-0.4744212, -0.3964546, -0.7614943, 0.1647059, 1, 0, 1,
-0.4717973, 1.852233, -0.5172675, 0.1568628, 1, 0, 1,
-0.4641042, 0.4732057, -0.8841735, 0.1529412, 1, 0, 1,
-0.4603995, 1.13071, 0.08810448, 0.145098, 1, 0, 1,
-0.4600453, 0.02627153, -0.603657, 0.1411765, 1, 0, 1,
-0.4573115, 0.8636413, -0.8596065, 0.1333333, 1, 0, 1,
-0.4490496, -1.002812, -3.522371, 0.1294118, 1, 0, 1,
-0.4448889, -1.599835, -3.688878, 0.1215686, 1, 0, 1,
-0.4350215, 1.381094, 0.6266483, 0.1176471, 1, 0, 1,
-0.4331067, 0.2687501, -0.287086, 0.1098039, 1, 0, 1,
-0.4330496, -0.6029803, -1.409044, 0.1058824, 1, 0, 1,
-0.4214368, -1.636507, -2.363328, 0.09803922, 1, 0, 1,
-0.4198643, 0.5852538, -0.06729325, 0.09019608, 1, 0, 1,
-0.4168531, -0.3495245, -2.893185, 0.08627451, 1, 0, 1,
-0.4164983, -1.304931, -1.085889, 0.07843138, 1, 0, 1,
-0.4127247, -0.1674709, -1.56797, 0.07450981, 1, 0, 1,
-0.4113539, 1.770511, -1.324258, 0.06666667, 1, 0, 1,
-0.4105222, 0.09997128, -0.6887454, 0.0627451, 1, 0, 1,
-0.4075177, 0.8709541, -0.1210935, 0.05490196, 1, 0, 1,
-0.4073197, -1.295295, -3.002642, 0.05098039, 1, 0, 1,
-0.4000773, -0.07030723, -2.446231, 0.04313726, 1, 0, 1,
-0.3989541, -0.806794, -1.77153, 0.03921569, 1, 0, 1,
-0.3963355, -0.8653855, 0.09886526, 0.03137255, 1, 0, 1,
-0.3960767, 0.3640459, -1.231216, 0.02745098, 1, 0, 1,
-0.3883637, -0.1347279, -0.7904093, 0.01960784, 1, 0, 1,
-0.3797795, -0.5012612, -3.976962, 0.01568628, 1, 0, 1,
-0.3794863, 0.1891571, -0.9749844, 0.007843138, 1, 0, 1,
-0.3782195, -0.6041195, -1.7704, 0.003921569, 1, 0, 1,
-0.3738078, 0.2713935, 0.002726082, 0, 1, 0.003921569, 1,
-0.3729734, 0.1325806, -1.798027, 0, 1, 0.01176471, 1,
-0.3724005, 0.5082864, -2.356067, 0, 1, 0.01568628, 1,
-0.3709266, -1.138083, -2.261785, 0, 1, 0.02352941, 1,
-0.3661046, 1.01598, -0.2372365, 0, 1, 0.02745098, 1,
-0.3655817, 0.06180788, -1.361683, 0, 1, 0.03529412, 1,
-0.365214, 0.7687293, 0.01583008, 0, 1, 0.03921569, 1,
-0.3650463, -0.08709262, -0.9902711, 0, 1, 0.04705882, 1,
-0.361925, -0.5990967, -2.602298, 0, 1, 0.05098039, 1,
-0.3600078, -1.258187, -2.752995, 0, 1, 0.05882353, 1,
-0.3598486, -0.9963202, -3.50965, 0, 1, 0.0627451, 1,
-0.3551121, 0.5933887, -0.04866404, 0, 1, 0.07058824, 1,
-0.3538666, -1.968281, -0.7341717, 0, 1, 0.07450981, 1,
-0.3519985, -0.5165979, -3.378468, 0, 1, 0.08235294, 1,
-0.3476835, 0.07881785, -2.788331, 0, 1, 0.08627451, 1,
-0.3419498, -0.7161238, -2.80555, 0, 1, 0.09411765, 1,
-0.3408426, 1.182191, -0.85303, 0, 1, 0.1019608, 1,
-0.3399878, -1.232539, -2.183043, 0, 1, 0.1058824, 1,
-0.3346183, -1.340483, -2.349656, 0, 1, 0.1137255, 1,
-0.3341669, 0.1400964, -0.7345176, 0, 1, 0.1176471, 1,
-0.3290894, -0.217155, -1.761837, 0, 1, 0.1254902, 1,
-0.3276794, 0.7962933, -2.327317, 0, 1, 0.1294118, 1,
-0.3226311, -1.572708, -2.561041, 0, 1, 0.1372549, 1,
-0.3221866, -1.549536, -2.901742, 0, 1, 0.1411765, 1,
-0.3213373, -1.215811, -1.78338, 0, 1, 0.1490196, 1,
-0.3204975, 0.2796424, -2.142677, 0, 1, 0.1529412, 1,
-0.3199677, -0.7270525, -3.846378, 0, 1, 0.1607843, 1,
-0.3168364, 0.5232348, -0.7629721, 0, 1, 0.1647059, 1,
-0.3148634, -1.892346, 0.8439005, 0, 1, 0.172549, 1,
-0.3128497, 0.8480514, -0.3018618, 0, 1, 0.1764706, 1,
-0.3122432, -0.01797099, -1.699196, 0, 1, 0.1843137, 1,
-0.3117248, -0.3881412, -3.693618, 0, 1, 0.1882353, 1,
-0.3115404, -0.374411, -1.940308, 0, 1, 0.1960784, 1,
-0.3048672, 0.06943212, -1.458354, 0, 1, 0.2039216, 1,
-0.3044681, -2.465063, -3.159212, 0, 1, 0.2078431, 1,
-0.2958162, 1.034552, -0.2105691, 0, 1, 0.2156863, 1,
-0.292229, 0.594382, -0.5721294, 0, 1, 0.2196078, 1,
-0.2912732, -0.182641, -3.682153, 0, 1, 0.227451, 1,
-0.2910957, 0.378627, -1.09814, 0, 1, 0.2313726, 1,
-0.2905308, -0.4616434, -2.013774, 0, 1, 0.2392157, 1,
-0.2899663, 1.636893, 1.191306, 0, 1, 0.2431373, 1,
-0.2898478, 1.379794, -0.3024125, 0, 1, 0.2509804, 1,
-0.2840202, 0.639604, 0.9579965, 0, 1, 0.254902, 1,
-0.2789637, 1.007087, -0.1820984, 0, 1, 0.2627451, 1,
-0.2732708, -0.2579379, -1.365882, 0, 1, 0.2666667, 1,
-0.2684616, 1.396581, -0.9987935, 0, 1, 0.2745098, 1,
-0.2683615, -2.322014, -2.436739, 0, 1, 0.2784314, 1,
-0.2664988, 0.6205435, 0.154456, 0, 1, 0.2862745, 1,
-0.2625598, 1.394233, 0.1724595, 0, 1, 0.2901961, 1,
-0.2601924, -0.2202327, -3.354575, 0, 1, 0.2980392, 1,
-0.2591403, -0.8129532, -2.086984, 0, 1, 0.3058824, 1,
-0.2591367, 0.8620604, 0.5938318, 0, 1, 0.3098039, 1,
-0.257543, 0.1118529, -1.435543, 0, 1, 0.3176471, 1,
-0.2504158, -2.262775, -3.659949, 0, 1, 0.3215686, 1,
-0.249651, 2.329553, -0.1989268, 0, 1, 0.3294118, 1,
-0.247719, 0.2252929, 0.5383344, 0, 1, 0.3333333, 1,
-0.2427041, 0.2168115, 0.3330327, 0, 1, 0.3411765, 1,
-0.2408901, -1.712914, -1.278661, 0, 1, 0.345098, 1,
-0.2387093, 1.467784, -0.3292666, 0, 1, 0.3529412, 1,
-0.2366115, -1.320369, -2.852112, 0, 1, 0.3568628, 1,
-0.2305297, 0.8560312, 0.2231952, 0, 1, 0.3647059, 1,
-0.227434, 1.365312, 0.526427, 0, 1, 0.3686275, 1,
-0.2272193, 0.6176204, 0.4974419, 0, 1, 0.3764706, 1,
-0.2268676, 0.1114276, -1.62233, 0, 1, 0.3803922, 1,
-0.2252393, -2.24412, -2.063649, 0, 1, 0.3882353, 1,
-0.2167749, -0.3555903, -1.349175, 0, 1, 0.3921569, 1,
-0.2150586, 0.2332797, 0.1015142, 0, 1, 0.4, 1,
-0.2064029, 0.400543, -0.9257637, 0, 1, 0.4078431, 1,
-0.2058753, -0.6103742, -2.267645, 0, 1, 0.4117647, 1,
-0.2032803, 0.4858148, 1.399745, 0, 1, 0.4196078, 1,
-0.2024235, -0.1097995, -2.442759, 0, 1, 0.4235294, 1,
-0.2023059, 1.582389, 1.04691, 0, 1, 0.4313726, 1,
-0.1992809, 0.8171829, 1.790337, 0, 1, 0.4352941, 1,
-0.1966916, 0.4083772, -1.316151, 0, 1, 0.4431373, 1,
-0.1862978, -0.3469641, -3.152173, 0, 1, 0.4470588, 1,
-0.1851821, -0.1414759, -0.1326167, 0, 1, 0.454902, 1,
-0.1847584, 0.5990666, -1.512944, 0, 1, 0.4588235, 1,
-0.184085, 2.681806, -0.7465978, 0, 1, 0.4666667, 1,
-0.1820176, -0.752208, -2.410357, 0, 1, 0.4705882, 1,
-0.1811993, 0.6164756, -0.6572838, 0, 1, 0.4784314, 1,
-0.1782725, -0.6221877, -4.044075, 0, 1, 0.4823529, 1,
-0.17674, 0.2544101, 1.029508, 0, 1, 0.4901961, 1,
-0.1755955, -1.936721, -2.325492, 0, 1, 0.4941176, 1,
-0.1727149, -0.556075, -3.041121, 0, 1, 0.5019608, 1,
-0.169102, 0.1911789, -0.781796, 0, 1, 0.509804, 1,
-0.1660152, 0.1130329, -0.9099224, 0, 1, 0.5137255, 1,
-0.1646561, 0.5512384, 1.394983, 0, 1, 0.5215687, 1,
-0.1626353, 0.1364283, -2.111624, 0, 1, 0.5254902, 1,
-0.1564115, -0.1435977, -1.543325, 0, 1, 0.5333334, 1,
-0.1553975, 0.5215552, -0.110891, 0, 1, 0.5372549, 1,
-0.1506422, -0.2885882, -1.906672, 0, 1, 0.5450981, 1,
-0.1461952, -2.095435, -4.15375, 0, 1, 0.5490196, 1,
-0.1444018, 1.157089, -0.4830455, 0, 1, 0.5568628, 1,
-0.1432626, -0.4780067, -3.441688, 0, 1, 0.5607843, 1,
-0.1409176, -0.5796236, -2.299065, 0, 1, 0.5686275, 1,
-0.1378144, -1.25045, -2.904204, 0, 1, 0.572549, 1,
-0.1374066, -0.3295326, -2.993754, 0, 1, 0.5803922, 1,
-0.1366413, 0.4009857, -0.9177399, 0, 1, 0.5843138, 1,
-0.1358304, 0.4335176, 0.7306477, 0, 1, 0.5921569, 1,
-0.1357213, -1.128295, -0.8213131, 0, 1, 0.5960785, 1,
-0.1323617, -1.48054, -1.991146, 0, 1, 0.6039216, 1,
-0.121225, 0.3893735, -0.1014438, 0, 1, 0.6117647, 1,
-0.120669, 0.1099697, -1.956721, 0, 1, 0.6156863, 1,
-0.1204179, -0.3021006, -3.002061, 0, 1, 0.6235294, 1,
-0.120212, 1.268789, 1.219616, 0, 1, 0.627451, 1,
-0.1153821, 0.5694542, 0.8603928, 0, 1, 0.6352941, 1,
-0.1134051, -1.493548, -2.486077, 0, 1, 0.6392157, 1,
-0.1077918, -0.1881648, -1.387507, 0, 1, 0.6470588, 1,
-0.1059606, 1.233393, -1.292547, 0, 1, 0.6509804, 1,
-0.105548, 0.4311053, 1.093832, 0, 1, 0.6588235, 1,
-0.1051654, -2.04091, -2.776808, 0, 1, 0.6627451, 1,
-0.101636, 0.1579777, -0.6664087, 0, 1, 0.6705883, 1,
-0.1009367, 1.475447, 0.8564014, 0, 1, 0.6745098, 1,
-0.09932021, -1.120536, -2.632451, 0, 1, 0.682353, 1,
-0.09901606, 0.2106427, -0.1464804, 0, 1, 0.6862745, 1,
-0.09553405, 0.5622418, 0.8348695, 0, 1, 0.6941177, 1,
-0.09145544, -0.4517856, -3.117496, 0, 1, 0.7019608, 1,
-0.09021395, 0.0283068, -1.824649, 0, 1, 0.7058824, 1,
-0.08823918, 1.45766, -1.074988, 0, 1, 0.7137255, 1,
-0.0864497, -0.1064707, -3.213193, 0, 1, 0.7176471, 1,
-0.08305167, 1.09157, -0.06180646, 0, 1, 0.7254902, 1,
-0.0824183, 0.2550851, -2.582902, 0, 1, 0.7294118, 1,
-0.08195766, -0.5025399, -2.66801, 0, 1, 0.7372549, 1,
-0.08061846, 2.940665, -0.613487, 0, 1, 0.7411765, 1,
-0.07652714, -1.839113, -2.124869, 0, 1, 0.7490196, 1,
-0.07227596, -0.8548243, -3.410588, 0, 1, 0.7529412, 1,
-0.07129309, -1.967833, -3.265349, 0, 1, 0.7607843, 1,
-0.07036877, 0.4123774, -1.658972, 0, 1, 0.7647059, 1,
-0.06963406, -0.2323005, -1.895214, 0, 1, 0.772549, 1,
-0.06824806, -0.7737354, -2.816108, 0, 1, 0.7764706, 1,
-0.06532723, 1.270656, -1.626899, 0, 1, 0.7843137, 1,
-0.06340359, -0.7178589, -3.057875, 0, 1, 0.7882353, 1,
-0.06136991, -0.3572939, -4.859772, 0, 1, 0.7960784, 1,
-0.05871628, 0.7885599, 0.1645322, 0, 1, 0.8039216, 1,
-0.05734003, 1.137487, 0.6794112, 0, 1, 0.8078431, 1,
-0.05697756, 0.6511938, 0.318152, 0, 1, 0.8156863, 1,
-0.05593334, -1.241254, -2.595898, 0, 1, 0.8196079, 1,
-0.05479106, 0.3982008, 0.1168657, 0, 1, 0.827451, 1,
-0.05455088, -0.1101782, -2.773502, 0, 1, 0.8313726, 1,
-0.05416032, -0.6096869, -3.802796, 0, 1, 0.8392157, 1,
-0.05002451, 0.3656436, -0.2943442, 0, 1, 0.8431373, 1,
-0.04640022, -0.01104895, -1.269666, 0, 1, 0.8509804, 1,
-0.04493926, -2.406095, -2.035369, 0, 1, 0.854902, 1,
-0.04465281, -1.705959, -4.952744, 0, 1, 0.8627451, 1,
-0.03841555, 0.08710539, -0.4549392, 0, 1, 0.8666667, 1,
-0.03507878, 0.07791303, -0.1831859, 0, 1, 0.8745098, 1,
-0.03455079, 0.1092455, 0.4085529, 0, 1, 0.8784314, 1,
-0.03353533, -0.6332963, -4.798038, 0, 1, 0.8862745, 1,
-0.03082078, -2.217066, -2.46393, 0, 1, 0.8901961, 1,
-0.02763366, 0.2250172, 2.061252, 0, 1, 0.8980392, 1,
-0.02501863, 0.8858709, 1.831868, 0, 1, 0.9058824, 1,
-0.02316577, -1.260877, -2.310015, 0, 1, 0.9098039, 1,
-0.02134852, -1.027067, -4.82333, 0, 1, 0.9176471, 1,
-0.02031028, -0.4586541, -4.924042, 0, 1, 0.9215686, 1,
-0.01297302, -1.356289, -2.096073, 0, 1, 0.9294118, 1,
-0.01272997, -1.532505, -3.304513, 0, 1, 0.9333333, 1,
-0.01064714, 1.591205, 0.5927358, 0, 1, 0.9411765, 1,
-0.008249948, 0.5995012, -1.18045, 0, 1, 0.945098, 1,
-0.008148371, -0.6007553, -1.837767, 0, 1, 0.9529412, 1,
-0.004725409, -0.8207265, -2.768245, 0, 1, 0.9568627, 1,
-6.834055e-06, 0.7302858, 0.3033062, 0, 1, 0.9647059, 1,
0.001428599, -0.4356894, 2.944814, 0, 1, 0.9686275, 1,
0.002254199, -0.4773511, 3.347806, 0, 1, 0.9764706, 1,
0.003905575, -0.6136372, 3.120915, 0, 1, 0.9803922, 1,
0.006935592, -1.527439, 1.909811, 0, 1, 0.9882353, 1,
0.007281548, -0.6960471, 2.229698, 0, 1, 0.9921569, 1,
0.007306281, -1.236678, 1.916535, 0, 1, 1, 1,
0.008218839, -0.1222019, 3.686294, 0, 0.9921569, 1, 1,
0.008753312, -0.1011278, 3.089633, 0, 0.9882353, 1, 1,
0.01060076, 0.5547704, 0.05922602, 0, 0.9803922, 1, 1,
0.01145477, -0.6279563, 2.933582, 0, 0.9764706, 1, 1,
0.01164832, 2.79178, -0.5435386, 0, 0.9686275, 1, 1,
0.01235154, 0.222016, 0.5051163, 0, 0.9647059, 1, 1,
0.01265704, -0.1368657, 4.059615, 0, 0.9568627, 1, 1,
0.01418949, 2.230959, 0.6572266, 0, 0.9529412, 1, 1,
0.01575361, 0.3356835, -0.2073102, 0, 0.945098, 1, 1,
0.01625612, 0.03190648, -0.4701575, 0, 0.9411765, 1, 1,
0.02019576, 1.146622, -0.03549335, 0, 0.9333333, 1, 1,
0.02053285, 0.9129149, 1.156469, 0, 0.9294118, 1, 1,
0.02060632, 1.523167, 0.2238921, 0, 0.9215686, 1, 1,
0.02215377, -0.5683299, 1.08146, 0, 0.9176471, 1, 1,
0.02585585, -1.297112, 2.31803, 0, 0.9098039, 1, 1,
0.0272461, -2.71637, 3.748737, 0, 0.9058824, 1, 1,
0.02867237, 0.9247433, -0.1454232, 0, 0.8980392, 1, 1,
0.03139054, 0.5901726, 1.786775, 0, 0.8901961, 1, 1,
0.03192914, 0.8644369, 0.09591573, 0, 0.8862745, 1, 1,
0.03604125, 1.352773, 1.314317, 0, 0.8784314, 1, 1,
0.0373981, -0.2014539, 4.242915, 0, 0.8745098, 1, 1,
0.03817817, -0.3884686, 1.934389, 0, 0.8666667, 1, 1,
0.03867987, 1.228848, -0.4997339, 0, 0.8627451, 1, 1,
0.04214945, -0.2465851, 1.154102, 0, 0.854902, 1, 1,
0.04390011, 1.501652, 1.291751, 0, 0.8509804, 1, 1,
0.04597833, 1.001153, -1.188644, 0, 0.8431373, 1, 1,
0.04658629, 0.1235, 0.6936173, 0, 0.8392157, 1, 1,
0.046726, -0.6979787, 3.790776, 0, 0.8313726, 1, 1,
0.04915345, -0.06873768, 2.667028, 0, 0.827451, 1, 1,
0.05148668, 0.6240562, 1.342486, 0, 0.8196079, 1, 1,
0.05264223, 0.1330656, 1.229082, 0, 0.8156863, 1, 1,
0.05280825, 0.5416009, -1.793273, 0, 0.8078431, 1, 1,
0.05949232, -0.04899742, 2.65384, 0, 0.8039216, 1, 1,
0.0656932, -0.832627, 1.763353, 0, 0.7960784, 1, 1,
0.07216658, 1.257301, 0.405536, 0, 0.7882353, 1, 1,
0.07254971, 0.4399938, -0.246685, 0, 0.7843137, 1, 1,
0.07299781, -0.1772355, 3.086152, 0, 0.7764706, 1, 1,
0.07720874, 0.2693426, -0.4722549, 0, 0.772549, 1, 1,
0.08197162, -1.210457, 2.621735, 0, 0.7647059, 1, 1,
0.08409206, -1.613065, 2.391891, 0, 0.7607843, 1, 1,
0.08846292, -1.095389, 3.234816, 0, 0.7529412, 1, 1,
0.09220814, 2.058856, 0.5092789, 0, 0.7490196, 1, 1,
0.09257766, 0.4161187, -0.2694832, 0, 0.7411765, 1, 1,
0.09455243, 0.1596669, -0.275051, 0, 0.7372549, 1, 1,
0.1041452, 2.117361, -0.1388002, 0, 0.7294118, 1, 1,
0.1085521, -0.2448894, 2.449043, 0, 0.7254902, 1, 1,
0.1165864, -0.800747, 1.722351, 0, 0.7176471, 1, 1,
0.1176358, 0.7628058, -1.619137, 0, 0.7137255, 1, 1,
0.1195442, 0.2943152, -1.001731, 0, 0.7058824, 1, 1,
0.1211892, -0.5719339, 1.841164, 0, 0.6980392, 1, 1,
0.1256083, -0.1157623, 1.513032, 0, 0.6941177, 1, 1,
0.1287553, 1.417599, -1.094034, 0, 0.6862745, 1, 1,
0.1291942, 1.377725, 1.20935, 0, 0.682353, 1, 1,
0.1299456, 0.9502861, -1.253545, 0, 0.6745098, 1, 1,
0.1299487, 0.3012386, 0.6684538, 0, 0.6705883, 1, 1,
0.1311317, -0.9414222, 0.5491357, 0, 0.6627451, 1, 1,
0.132826, -1.83453, 1.548372, 0, 0.6588235, 1, 1,
0.1341171, 0.7031237, 0.4435433, 0, 0.6509804, 1, 1,
0.1395173, 0.4949357, -0.3679516, 0, 0.6470588, 1, 1,
0.1408014, -1.087166, 4.222469, 0, 0.6392157, 1, 1,
0.1434109, 0.1192313, 0.3216191, 0, 0.6352941, 1, 1,
0.1456109, 0.2558454, 0.1122932, 0, 0.627451, 1, 1,
0.1460323, 1.367421, -0.1442971, 0, 0.6235294, 1, 1,
0.1497409, -1.374779, 2.941858, 0, 0.6156863, 1, 1,
0.161918, -1.050058, 2.670196, 0, 0.6117647, 1, 1,
0.1632038, 0.6548703, -1.47577, 0, 0.6039216, 1, 1,
0.16568, 2.440114, 0.4811537, 0, 0.5960785, 1, 1,
0.1662761, 0.6398331, 1.140198, 0, 0.5921569, 1, 1,
0.1707902, -0.7519099, 4.336309, 0, 0.5843138, 1, 1,
0.1761556, -1.849892, 3.357546, 0, 0.5803922, 1, 1,
0.1773625, 0.214349, 0.571328, 0, 0.572549, 1, 1,
0.1774366, 0.7494453, -0.6835303, 0, 0.5686275, 1, 1,
0.1778759, 0.3241946, -1.352252, 0, 0.5607843, 1, 1,
0.183509, -0.4510744, 1.487572, 0, 0.5568628, 1, 1,
0.1838283, -1.017463, 4.04814, 0, 0.5490196, 1, 1,
0.1841068, 1.113126, 0.5565771, 0, 0.5450981, 1, 1,
0.188309, 1.708652, 1.129912, 0, 0.5372549, 1, 1,
0.1898992, 0.1573329, 0.2143152, 0, 0.5333334, 1, 1,
0.1947006, 0.5903336, 1.303332, 0, 0.5254902, 1, 1,
0.2038631, 2.193958, -0.6639166, 0, 0.5215687, 1, 1,
0.2055823, 1.77072, 0.3691025, 0, 0.5137255, 1, 1,
0.2077019, 0.03755207, 2.525144, 0, 0.509804, 1, 1,
0.2122888, -0.6742089, 2.488439, 0, 0.5019608, 1, 1,
0.2171165, -0.5610985, 2.587731, 0, 0.4941176, 1, 1,
0.2241537, -1.466155, 4.55232, 0, 0.4901961, 1, 1,
0.2248495, -0.4298657, 3.274997, 0, 0.4823529, 1, 1,
0.2286031, 1.929965, 0.5910527, 0, 0.4784314, 1, 1,
0.2307315, -1.399162, 3.871448, 0, 0.4705882, 1, 1,
0.2415216, -1.377049, 1.79434, 0, 0.4666667, 1, 1,
0.241859, -0.07680735, 1.583583, 0, 0.4588235, 1, 1,
0.245353, -0.4903002, 2.635447, 0, 0.454902, 1, 1,
0.2462664, 0.3329851, 0.1365405, 0, 0.4470588, 1, 1,
0.2479045, 0.2497946, 0.6171761, 0, 0.4431373, 1, 1,
0.2482244, -0.7929161, 3.962409, 0, 0.4352941, 1, 1,
0.249575, -0.5674734, 5.330942, 0, 0.4313726, 1, 1,
0.251767, -1.222769, 3.611768, 0, 0.4235294, 1, 1,
0.2607239, -1.834131, 4.225306, 0, 0.4196078, 1, 1,
0.2626464, -0.6147421, 2.999055, 0, 0.4117647, 1, 1,
0.2677611, 1.311111, 0.4073543, 0, 0.4078431, 1, 1,
0.2714676, 0.2528003, -0.03306423, 0, 0.4, 1, 1,
0.2763677, 0.6037374, 0.38745, 0, 0.3921569, 1, 1,
0.2783116, 0.3332101, 1.228614, 0, 0.3882353, 1, 1,
0.2802736, 0.06148534, -0.1186605, 0, 0.3803922, 1, 1,
0.2897741, 1.588691, -1.947137, 0, 0.3764706, 1, 1,
0.2899913, -0.9594254, 1.605321, 0, 0.3686275, 1, 1,
0.2928485, 1.935831, 0.9917922, 0, 0.3647059, 1, 1,
0.2974858, -0.8996186, 3.934229, 0, 0.3568628, 1, 1,
0.3026274, 0.5467283, 1.816253, 0, 0.3529412, 1, 1,
0.3030299, -0.08494519, 1.963767, 0, 0.345098, 1, 1,
0.3051719, -0.4924475, 2.96579, 0, 0.3411765, 1, 1,
0.3093113, 1.560626, 1.227291, 0, 0.3333333, 1, 1,
0.3095733, 0.3719442, 1.069804, 0, 0.3294118, 1, 1,
0.3124121, -0.05287598, 1.780761, 0, 0.3215686, 1, 1,
0.3155571, -2.78039, 3.61147, 0, 0.3176471, 1, 1,
0.315561, -0.917401, 1.777922, 0, 0.3098039, 1, 1,
0.3158408, 0.178593, 2.436851, 0, 0.3058824, 1, 1,
0.3280108, 0.07144658, 1.942855, 0, 0.2980392, 1, 1,
0.3281585, 0.02193812, 2.902551, 0, 0.2901961, 1, 1,
0.3321953, -0.6446843, 2.179608, 0, 0.2862745, 1, 1,
0.3326001, 0.7207856, 0.2095252, 0, 0.2784314, 1, 1,
0.3330657, -0.6718002, 1.879261, 0, 0.2745098, 1, 1,
0.3360123, -0.4316872, 2.608978, 0, 0.2666667, 1, 1,
0.3366278, -0.2050796, 0.8513159, 0, 0.2627451, 1, 1,
0.3366543, -0.4857212, 2.37404, 0, 0.254902, 1, 1,
0.3389507, 0.3252304, 1.383577, 0, 0.2509804, 1, 1,
0.3397717, 0.6642956, 1.041133, 0, 0.2431373, 1, 1,
0.3411589, 0.776693, 0.1349737, 0, 0.2392157, 1, 1,
0.3414479, 0.3498865, 1.186874, 0, 0.2313726, 1, 1,
0.3424737, -1.352759, 1.852182, 0, 0.227451, 1, 1,
0.3456724, -1.164465, 2.356247, 0, 0.2196078, 1, 1,
0.3467091, -1.9448, 0.9701779, 0, 0.2156863, 1, 1,
0.3497893, -0.5222954, 2.743596, 0, 0.2078431, 1, 1,
0.3515895, 0.4137259, 1.57074, 0, 0.2039216, 1, 1,
0.3557246, -0.9400276, 2.115247, 0, 0.1960784, 1, 1,
0.3587925, 1.749016, -0.4909196, 0, 0.1882353, 1, 1,
0.3671474, 0.6515039, -1.165177, 0, 0.1843137, 1, 1,
0.3730832, 0.8444223, -0.687778, 0, 0.1764706, 1, 1,
0.375, -0.5421081, 3.016346, 0, 0.172549, 1, 1,
0.3750201, -0.09720375, 3.19926, 0, 0.1647059, 1, 1,
0.3760521, 1.416657, 0.529711, 0, 0.1607843, 1, 1,
0.3776176, 0.1681378, -0.1481524, 0, 0.1529412, 1, 1,
0.379033, 0.5002502, 0.9615804, 0, 0.1490196, 1, 1,
0.3794212, -0.1099598, 2.181757, 0, 0.1411765, 1, 1,
0.3802152, 1.513976, 1.660653, 0, 0.1372549, 1, 1,
0.3808958, 0.8900217, -0.3638714, 0, 0.1294118, 1, 1,
0.3828737, -0.06939253, 3.045, 0, 0.1254902, 1, 1,
0.383827, -1.421531, 2.283046, 0, 0.1176471, 1, 1,
0.3847287, -0.3470832, 3.272817, 0, 0.1137255, 1, 1,
0.385367, 0.4864697, 2.544795, 0, 0.1058824, 1, 1,
0.3914392, 0.1444156, 0.1789692, 0, 0.09803922, 1, 1,
0.3928313, 0.81567, 2.17076, 0, 0.09411765, 1, 1,
0.395422, -0.3469855, 2.401082, 0, 0.08627451, 1, 1,
0.3965345, -1.534815, 2.769266, 0, 0.08235294, 1, 1,
0.3966671, -0.0742489, 2.641597, 0, 0.07450981, 1, 1,
0.406788, -0.4899179, 1.559676, 0, 0.07058824, 1, 1,
0.4127426, -1.245887, 2.693349, 0, 0.0627451, 1, 1,
0.415424, -0.6680964, 3.243898, 0, 0.05882353, 1, 1,
0.4175677, -0.4701463, 3.368697, 0, 0.05098039, 1, 1,
0.4193313, -1.005087, 3.404447, 0, 0.04705882, 1, 1,
0.4254303, -1.081699, 3.103863, 0, 0.03921569, 1, 1,
0.4264669, 0.1717503, -0.5219643, 0, 0.03529412, 1, 1,
0.4324356, -0.6161085, 2.941466, 0, 0.02745098, 1, 1,
0.4329999, -0.2221545, 2.219813, 0, 0.02352941, 1, 1,
0.4389055, -0.4437208, 1.08876, 0, 0.01568628, 1, 1,
0.4414282, 0.7057754, 1.356581, 0, 0.01176471, 1, 1,
0.442535, 0.1812305, 1.283567, 0, 0.003921569, 1, 1,
0.4465003, -1.605311, 3.372411, 0.003921569, 0, 1, 1,
0.4467685, -0.8433776, 0.8385054, 0.007843138, 0, 1, 1,
0.4546356, -0.5904582, 2.942028, 0.01568628, 0, 1, 1,
0.4551326, 2.440673, -0.2404413, 0.01960784, 0, 1, 1,
0.4592079, -0.5658835, 2.518236, 0.02745098, 0, 1, 1,
0.459881, 0.06249821, 1.565326, 0.03137255, 0, 1, 1,
0.4664805, 1.367753, -0.4818316, 0.03921569, 0, 1, 1,
0.4696444, 0.1895615, 1.259629, 0.04313726, 0, 1, 1,
0.4717811, 1.417098, 1.868386, 0.05098039, 0, 1, 1,
0.4772236, -0.9529698, 3.626413, 0.05490196, 0, 1, 1,
0.482939, -0.7642854, 1.395728, 0.0627451, 0, 1, 1,
0.4861632, -0.1847848, 0.2929679, 0.06666667, 0, 1, 1,
0.4930205, -1.247879, 1.902936, 0.07450981, 0, 1, 1,
0.4932641, -0.1369726, 2.003273, 0.07843138, 0, 1, 1,
0.495649, -0.4542284, 2.519064, 0.08627451, 0, 1, 1,
0.5024811, 1.769248, 1.553648, 0.09019608, 0, 1, 1,
0.504325, -1.392639, 4.444109, 0.09803922, 0, 1, 1,
0.5048808, -0.7409985, 2.693276, 0.1058824, 0, 1, 1,
0.5056508, 1.060259, 0.5319744, 0.1098039, 0, 1, 1,
0.5060731, 0.4480523, 1.683853, 0.1176471, 0, 1, 1,
0.5077401, -1.49899, 2.761358, 0.1215686, 0, 1, 1,
0.5092816, -0.3427931, 1.540172, 0.1294118, 0, 1, 1,
0.5123398, -0.3493907, 4.34496, 0.1333333, 0, 1, 1,
0.5128101, -1.249826, 2.400979, 0.1411765, 0, 1, 1,
0.5205458, 0.3255696, 2.315495, 0.145098, 0, 1, 1,
0.5211515, 1.367609, -1.687276, 0.1529412, 0, 1, 1,
0.5216418, -0.327583, 2.658442, 0.1568628, 0, 1, 1,
0.5226353, -1.591354, 3.666157, 0.1647059, 0, 1, 1,
0.5284416, 1.172378, 0.4338667, 0.1686275, 0, 1, 1,
0.5300441, 0.2225779, -0.2563024, 0.1764706, 0, 1, 1,
0.5323246, -1.822194, 3.455913, 0.1803922, 0, 1, 1,
0.5378613, -0.824915, 3.271214, 0.1882353, 0, 1, 1,
0.5387126, 0.569872, 1.007631, 0.1921569, 0, 1, 1,
0.541128, -1.503615, 1.762321, 0.2, 0, 1, 1,
0.5426813, -0.5172775, 1.36158, 0.2078431, 0, 1, 1,
0.5470992, -1.579937, 3.646393, 0.2117647, 0, 1, 1,
0.5515819, -0.3570128, 1.484245, 0.2196078, 0, 1, 1,
0.5550076, -1.668382, 2.707496, 0.2235294, 0, 1, 1,
0.5566282, -0.1411153, 1.503853, 0.2313726, 0, 1, 1,
0.5637016, 1.02139, 0.4925658, 0.2352941, 0, 1, 1,
0.5644776, -0.3366651, 3.775528, 0.2431373, 0, 1, 1,
0.5663257, -0.4699991, 1.674287, 0.2470588, 0, 1, 1,
0.5725285, -1.579356, 3.688451, 0.254902, 0, 1, 1,
0.5759063, -1.525252, 2.810714, 0.2588235, 0, 1, 1,
0.57669, 0.2458663, -0.05964609, 0.2666667, 0, 1, 1,
0.5815603, -1.125491, 4.117395, 0.2705882, 0, 1, 1,
0.5865808, -0.1857605, 2.763928, 0.2784314, 0, 1, 1,
0.5870501, -0.5455699, 1.238602, 0.282353, 0, 1, 1,
0.5892575, -2.985605, 2.846097, 0.2901961, 0, 1, 1,
0.5906762, 0.8574067, 0.5286713, 0.2941177, 0, 1, 1,
0.5982046, -0.8724695, 3.791802, 0.3019608, 0, 1, 1,
0.6056726, 0.4516653, -0.9736455, 0.3098039, 0, 1, 1,
0.6063484, 0.5416967, 2.620776, 0.3137255, 0, 1, 1,
0.6064238, 0.856101, -0.8604746, 0.3215686, 0, 1, 1,
0.6089985, 1.215034, -1.170079, 0.3254902, 0, 1, 1,
0.6175771, 0.6405207, 1.210557, 0.3333333, 0, 1, 1,
0.6208493, -0.2051043, 2.778775, 0.3372549, 0, 1, 1,
0.6215249, 1.064049, 1.52966, 0.345098, 0, 1, 1,
0.6269986, 1.874146, 1.432, 0.3490196, 0, 1, 1,
0.6290293, 2.106683, -0.09314886, 0.3568628, 0, 1, 1,
0.6332725, -0.6920782, 0.7077753, 0.3607843, 0, 1, 1,
0.6369905, -0.1320374, 3.924554, 0.3686275, 0, 1, 1,
0.6387151, 0.4307408, 0.1741904, 0.372549, 0, 1, 1,
0.6394938, 1.486576, -0.0323008, 0.3803922, 0, 1, 1,
0.6410421, 0.6493199, 0.2708573, 0.3843137, 0, 1, 1,
0.643379, 1.450271, 1.457105, 0.3921569, 0, 1, 1,
0.6433816, -0.7567354, 3.052105, 0.3960784, 0, 1, 1,
0.6438486, -0.65288, 2.079103, 0.4039216, 0, 1, 1,
0.6518926, -1.821407, 4.307151, 0.4117647, 0, 1, 1,
0.6598439, 0.001291829, 2.329651, 0.4156863, 0, 1, 1,
0.6599809, -1.117567, 2.973239, 0.4235294, 0, 1, 1,
0.6657493, 0.1596258, 2.94688, 0.427451, 0, 1, 1,
0.6662871, -0.4441235, 1.641587, 0.4352941, 0, 1, 1,
0.6675564, 0.6495882, 2.108839, 0.4392157, 0, 1, 1,
0.6679913, 0.4683987, 1.372723, 0.4470588, 0, 1, 1,
0.6689798, 0.5876241, -0.02205743, 0.4509804, 0, 1, 1,
0.6723208, -1.142455, 2.417274, 0.4588235, 0, 1, 1,
0.6729494, -0.463887, 2.688257, 0.4627451, 0, 1, 1,
0.6730721, 1.644994, 1.041315, 0.4705882, 0, 1, 1,
0.6744352, 0.4524142, 0.63028, 0.4745098, 0, 1, 1,
0.6843475, 2.672228, -1.144866, 0.4823529, 0, 1, 1,
0.6890228, 1.218601, 0.8422663, 0.4862745, 0, 1, 1,
0.691039, 1.694881, 0.2555912, 0.4941176, 0, 1, 1,
0.6913177, -0.7710253, 3.520133, 0.5019608, 0, 1, 1,
0.6980922, -1.12054, 2.730667, 0.5058824, 0, 1, 1,
0.7005439, 0.5728461, -0.6810365, 0.5137255, 0, 1, 1,
0.7008768, 1.216816, 1.71494, 0.5176471, 0, 1, 1,
0.7108817, -0.2965751, 1.506478, 0.5254902, 0, 1, 1,
0.7119103, -0.7059925, 0.6852987, 0.5294118, 0, 1, 1,
0.7134702, 0.2180347, 0.7162634, 0.5372549, 0, 1, 1,
0.7175035, 0.6768087, 2.220169, 0.5411765, 0, 1, 1,
0.7228931, -0.204332, 1.440024, 0.5490196, 0, 1, 1,
0.7344075, 0.2399866, 1.161675, 0.5529412, 0, 1, 1,
0.7433987, 1.155174, 1.222182, 0.5607843, 0, 1, 1,
0.7440677, -0.08004919, 2.171736, 0.5647059, 0, 1, 1,
0.7450351, 2.158634, 0.06930305, 0.572549, 0, 1, 1,
0.74554, 0.8511686, 1.578857, 0.5764706, 0, 1, 1,
0.747733, 0.5221069, -0.3000815, 0.5843138, 0, 1, 1,
0.7488639, 0.03126998, 0.3407756, 0.5882353, 0, 1, 1,
0.7538344, -0.4268511, 0.2210642, 0.5960785, 0, 1, 1,
0.7575515, 0.04412993, 2.682357, 0.6039216, 0, 1, 1,
0.7584915, -0.4305292, 2.163569, 0.6078432, 0, 1, 1,
0.76275, -0.423307, 2.171645, 0.6156863, 0, 1, 1,
0.7631055, 0.3576106, 0.8144245, 0.6196079, 0, 1, 1,
0.7697754, 0.7037364, 0.4329545, 0.627451, 0, 1, 1,
0.7742966, 0.6438062, 1.076076, 0.6313726, 0, 1, 1,
0.7813592, -0.3052642, 1.209186, 0.6392157, 0, 1, 1,
0.783931, 1.180332, 1.206409, 0.6431373, 0, 1, 1,
0.7891347, 0.3431547, 1.562605, 0.6509804, 0, 1, 1,
0.7898949, 0.2061403, 2.377358, 0.654902, 0, 1, 1,
0.7947199, -0.466125, 4.097231, 0.6627451, 0, 1, 1,
0.7984788, 0.3689086, 1.88702, 0.6666667, 0, 1, 1,
0.8006725, 0.2789843, 1.541219, 0.6745098, 0, 1, 1,
0.8028774, -0.8700728, 3.115987, 0.6784314, 0, 1, 1,
0.8070709, 1.613944, 0.7226483, 0.6862745, 0, 1, 1,
0.8093217, 0.003107901, 0.1178618, 0.6901961, 0, 1, 1,
0.8100221, -1.352824, 2.435597, 0.6980392, 0, 1, 1,
0.8112591, 0.9761023, 1.351055, 0.7058824, 0, 1, 1,
0.8148082, 0.3745925, 3.336323, 0.7098039, 0, 1, 1,
0.8149064, -0.1640932, 0.8164954, 0.7176471, 0, 1, 1,
0.8176444, -0.7743099, 1.200388, 0.7215686, 0, 1, 1,
0.8212407, 0.23667, 2.831137, 0.7294118, 0, 1, 1,
0.8220767, -1.457625, 2.78395, 0.7333333, 0, 1, 1,
0.8247776, -1.279571, 2.39755, 0.7411765, 0, 1, 1,
0.8319439, -0.3947871, 2.51419, 0.7450981, 0, 1, 1,
0.8359824, 0.1188712, 1.061032, 0.7529412, 0, 1, 1,
0.8364102, 1.325743, 1.420844, 0.7568628, 0, 1, 1,
0.837813, 0.2793014, -0.1084092, 0.7647059, 0, 1, 1,
0.8381139, -1.454954, 1.737369, 0.7686275, 0, 1, 1,
0.8508995, 0.4665435, 2.353989, 0.7764706, 0, 1, 1,
0.856098, 0.1126497, -0.3301929, 0.7803922, 0, 1, 1,
0.8561198, -0.1144344, 1.222584, 0.7882353, 0, 1, 1,
0.8600047, 0.9714271, 0.7697884, 0.7921569, 0, 1, 1,
0.8611771, -0.9037372, 2.118894, 0.8, 0, 1, 1,
0.8620445, -0.3348737, 1.020459, 0.8078431, 0, 1, 1,
0.8647445, -1.085804, 2.351164, 0.8117647, 0, 1, 1,
0.8665502, -0.4782019, 1.647594, 0.8196079, 0, 1, 1,
0.8713329, -1.549105, 2.699812, 0.8235294, 0, 1, 1,
0.8718597, 0.7921315, 0.9181875, 0.8313726, 0, 1, 1,
0.8773604, -0.5399436, 2.745718, 0.8352941, 0, 1, 1,
0.8794391, 0.7212915, 2.131901, 0.8431373, 0, 1, 1,
0.8880544, 0.01471256, -0.532721, 0.8470588, 0, 1, 1,
0.8913054, 2.741621, 0.5288615, 0.854902, 0, 1, 1,
0.8963068, 1.186237, 0.6628158, 0.8588235, 0, 1, 1,
0.8983297, -0.1663931, 2.539214, 0.8666667, 0, 1, 1,
0.8984617, 1.717773, 0.7665105, 0.8705882, 0, 1, 1,
0.9007874, 1.676201, 1.442919, 0.8784314, 0, 1, 1,
0.9010798, 1.041788, 0.4366436, 0.8823529, 0, 1, 1,
0.9017914, 0.3837549, 0.7110646, 0.8901961, 0, 1, 1,
0.9037573, 0.7881675, 0.4581243, 0.8941177, 0, 1, 1,
0.9047363, 0.3621858, 1.711664, 0.9019608, 0, 1, 1,
0.9059747, 0.8708475, 2.634717, 0.9098039, 0, 1, 1,
0.90636, 0.9655402, 1.326531, 0.9137255, 0, 1, 1,
0.9078608, -0.4428403, 3.40658, 0.9215686, 0, 1, 1,
0.9117529, 0.4448879, -0.2194768, 0.9254902, 0, 1, 1,
0.9139519, -0.3611737, 1.042773, 0.9333333, 0, 1, 1,
0.9156315, 1.154041, -1.605542, 0.9372549, 0, 1, 1,
0.9214197, 0.2013273, 1.478826, 0.945098, 0, 1, 1,
0.9247476, -0.7169967, 1.556254, 0.9490196, 0, 1, 1,
0.9306399, 1.013785, 1.578518, 0.9568627, 0, 1, 1,
0.9365596, 1.784932, 0.08017982, 0.9607843, 0, 1, 1,
0.9448552, 0.6853837, 1.649034, 0.9686275, 0, 1, 1,
0.9460357, -2.693017, 1.859425, 0.972549, 0, 1, 1,
0.9598739, -0.005277833, 1.75953, 0.9803922, 0, 1, 1,
0.9620727, 0.8235949, 0.4449142, 0.9843137, 0, 1, 1,
0.9698476, -0.1794131, 1.846184, 0.9921569, 0, 1, 1,
0.9707105, -0.06360786, 0.7501417, 0.9960784, 0, 1, 1,
0.9713952, 0.365826, -0.3144905, 1, 0, 0.9960784, 1,
0.9727052, -0.6623257, 3.755411, 1, 0, 0.9882353, 1,
0.9727425, -0.4573335, 1.998094, 1, 0, 0.9843137, 1,
0.9771299, 0.09550466, 1.219757, 1, 0, 0.9764706, 1,
0.9782954, 0.3308516, 1.133718, 1, 0, 0.972549, 1,
0.9791295, -0.5580569, 2.352155, 1, 0, 0.9647059, 1,
0.984507, 1.602209, 1.319607, 1, 0, 0.9607843, 1,
0.985082, -1.679288, 2.981379, 1, 0, 0.9529412, 1,
0.9891257, -0.3036675, 2.767055, 1, 0, 0.9490196, 1,
0.9931191, -2.469061, 4.053725, 1, 0, 0.9411765, 1,
0.994105, 1.25875, 2.117211, 1, 0, 0.9372549, 1,
1.00348, 1.778817, 1.41108, 1, 0, 0.9294118, 1,
1.003532, 0.3887649, 0.7965358, 1, 0, 0.9254902, 1,
1.016886, 2.060522, 1.602491, 1, 0, 0.9176471, 1,
1.021281, 2.04302, 1.084905, 1, 0, 0.9137255, 1,
1.02777, 1.175726, 0.4762263, 1, 0, 0.9058824, 1,
1.029771, 1.385622, 3.332126, 1, 0, 0.9019608, 1,
1.030896, 0.3395147, -1.106901, 1, 0, 0.8941177, 1,
1.032045, 0.9452171, -0.8664066, 1, 0, 0.8862745, 1,
1.032687, 0.5702142, 2.751635, 1, 0, 0.8823529, 1,
1.039158, 0.6758511, 1.312423, 1, 0, 0.8745098, 1,
1.040577, 0.6795171, 1.94161, 1, 0, 0.8705882, 1,
1.044058, -0.6564016, 2.251881, 1, 0, 0.8627451, 1,
1.04563, 1.724152, 1.09799, 1, 0, 0.8588235, 1,
1.051345, 0.1188785, 0.2705188, 1, 0, 0.8509804, 1,
1.063083, 0.8299553, 1.384586, 1, 0, 0.8470588, 1,
1.068717, -0.3295024, 3.132965, 1, 0, 0.8392157, 1,
1.068779, -1.326201, 0.4321086, 1, 0, 0.8352941, 1,
1.078853, -1.221621, 0.9678566, 1, 0, 0.827451, 1,
1.082518, -0.2920623, 2.345967, 1, 0, 0.8235294, 1,
1.082683, -1.113381, 2.411262, 1, 0, 0.8156863, 1,
1.087361, -1.383584, 1.382959, 1, 0, 0.8117647, 1,
1.089186, 0.3083247, 0.2501082, 1, 0, 0.8039216, 1,
1.097055, -1.528524, 2.233164, 1, 0, 0.7960784, 1,
1.0971, 0.798411, 0.9575419, 1, 0, 0.7921569, 1,
1.098506, -0.3060699, 4.017566, 1, 0, 0.7843137, 1,
1.098716, 0.1674493, 1.263548, 1, 0, 0.7803922, 1,
1.100816, 0.1042213, 1.763764, 1, 0, 0.772549, 1,
1.108168, -1.140203, 3.197543, 1, 0, 0.7686275, 1,
1.113279, 0.5926315, 1.811068, 1, 0, 0.7607843, 1,
1.113416, -0.2485868, 2.307163, 1, 0, 0.7568628, 1,
1.125363, 0.6960059, 2.158115, 1, 0, 0.7490196, 1,
1.126356, 2.026397, 0.8128226, 1, 0, 0.7450981, 1,
1.145375, -0.7571925, 1.297262, 1, 0, 0.7372549, 1,
1.159294, -0.1752115, 2.546639, 1, 0, 0.7333333, 1,
1.1683, -0.4143099, 2.172604, 1, 0, 0.7254902, 1,
1.17401, 1.17978, 1.317674, 1, 0, 0.7215686, 1,
1.190382, -1.329736, 2.228755, 1, 0, 0.7137255, 1,
1.191185, 0.01768223, 1.039405, 1, 0, 0.7098039, 1,
1.202021, 0.4447118, -0.2656525, 1, 0, 0.7019608, 1,
1.212337, -0.041644, 1.54115, 1, 0, 0.6941177, 1,
1.213254, -0.5263686, 1.530074, 1, 0, 0.6901961, 1,
1.21805, -0.2312482, 3.005993, 1, 0, 0.682353, 1,
1.222482, 0.9394246, -0.158362, 1, 0, 0.6784314, 1,
1.23224, -0.6292545, 2.825264, 1, 0, 0.6705883, 1,
1.232956, 0.1257661, 1.4189, 1, 0, 0.6666667, 1,
1.233338, 1.719473, -0.1011768, 1, 0, 0.6588235, 1,
1.243679, -2.286744, 0.7604189, 1, 0, 0.654902, 1,
1.251441, -0.662823, 1.345556, 1, 0, 0.6470588, 1,
1.259916, 0.8601637, -0.3037909, 1, 0, 0.6431373, 1,
1.261717, -0.2945909, 2.176473, 1, 0, 0.6352941, 1,
1.264284, 0.7836365, 1.037436, 1, 0, 0.6313726, 1,
1.266254, 1.253072, -1.265566, 1, 0, 0.6235294, 1,
1.270786, 1.002986, 1.206588, 1, 0, 0.6196079, 1,
1.279099, -2.34074, 0.9017152, 1, 0, 0.6117647, 1,
1.284441, 0.6807784, -0.1076955, 1, 0, 0.6078432, 1,
1.29094, 1.421854, 0.6254859, 1, 0, 0.6, 1,
1.297253, -0.6661078, 0.5317839, 1, 0, 0.5921569, 1,
1.303638, -0.557581, 2.346015, 1, 0, 0.5882353, 1,
1.30436, -0.4438541, 1.192043, 1, 0, 0.5803922, 1,
1.305507, 0.9496106, -0.826043, 1, 0, 0.5764706, 1,
1.306685, 0.04915944, 2.680336, 1, 0, 0.5686275, 1,
1.310472, -0.395406, 1.099363, 1, 0, 0.5647059, 1,
1.341385, -0.8092141, 1.405376, 1, 0, 0.5568628, 1,
1.344345, -0.1362653, -0.1846712, 1, 0, 0.5529412, 1,
1.345439, 1.563401, -0.1430415, 1, 0, 0.5450981, 1,
1.35437, -0.7777945, 1.73634, 1, 0, 0.5411765, 1,
1.359198, -0.5425742, 2.374373, 1, 0, 0.5333334, 1,
1.36602, -1.508667, 2.576457, 1, 0, 0.5294118, 1,
1.372477, 0.9006921, -0.4396579, 1, 0, 0.5215687, 1,
1.378077, -0.364718, 0.664658, 1, 0, 0.5176471, 1,
1.384474, -0.4157223, 1.913907, 1, 0, 0.509804, 1,
1.392229, 0.09180802, 1.024666, 1, 0, 0.5058824, 1,
1.403541, -1.521098, 3.034, 1, 0, 0.4980392, 1,
1.409378, -0.4377598, 2.67684, 1, 0, 0.4901961, 1,
1.419345, -0.1832025, 1.310811, 1, 0, 0.4862745, 1,
1.425004, -0.2253525, 2.968972, 1, 0, 0.4784314, 1,
1.426112, -0.6871375, 0.6932003, 1, 0, 0.4745098, 1,
1.4363, 0.5099967, 1.18373, 1, 0, 0.4666667, 1,
1.445058, -1.163805, 5.045853, 1, 0, 0.4627451, 1,
1.445871, 0.5670589, 0.06743024, 1, 0, 0.454902, 1,
1.447205, 1.555892, 0.06956092, 1, 0, 0.4509804, 1,
1.453244, 0.3605557, 1.161666, 1, 0, 0.4431373, 1,
1.455386, -2.0726, 4.79246, 1, 0, 0.4392157, 1,
1.459282, -0.8096641, 0.953687, 1, 0, 0.4313726, 1,
1.467861, 0.432747, 3.31541, 1, 0, 0.427451, 1,
1.480906, -0.1334027, 2.930764, 1, 0, 0.4196078, 1,
1.498346, 0.08748844, 1.678758, 1, 0, 0.4156863, 1,
1.50683, -2.571083, 3.336066, 1, 0, 0.4078431, 1,
1.507116, -1.019866, 3.648197, 1, 0, 0.4039216, 1,
1.538309, 0.58563, -0.202458, 1, 0, 0.3960784, 1,
1.539139, 1.37089, 0.6019387, 1, 0, 0.3882353, 1,
1.546845, -0.2683171, 1.032301, 1, 0, 0.3843137, 1,
1.554345, -0.08702553, 1.080994, 1, 0, 0.3764706, 1,
1.568678, -0.8964047, 2.566213, 1, 0, 0.372549, 1,
1.575195, -1.544471, 2.530681, 1, 0, 0.3647059, 1,
1.583432, -0.3649202, 0.9071974, 1, 0, 0.3607843, 1,
1.586702, 1.254165, 1.836926, 1, 0, 0.3529412, 1,
1.588389, 1.099972, 1.048778, 1, 0, 0.3490196, 1,
1.601601, 0.4118098, 1.218882, 1, 0, 0.3411765, 1,
1.612567, -0.876544, 0.5798033, 1, 0, 0.3372549, 1,
1.615547, 0.3923259, 2.001122, 1, 0, 0.3294118, 1,
1.62324, 1.553965, 1.163698, 1, 0, 0.3254902, 1,
1.626943, -0.4525883, 0.6967748, 1, 0, 0.3176471, 1,
1.628915, 0.6046898, 0.8890384, 1, 0, 0.3137255, 1,
1.633128, 1.820826, 0.8715263, 1, 0, 0.3058824, 1,
1.640117, -0.686562, 2.757607, 1, 0, 0.2980392, 1,
1.661916, 0.8118747, 0.8135419, 1, 0, 0.2941177, 1,
1.666553, -1.412092, 0.7579314, 1, 0, 0.2862745, 1,
1.677791, -0.3789173, 1.149871, 1, 0, 0.282353, 1,
1.683838, 0.9806025, 0.3830422, 1, 0, 0.2745098, 1,
1.720276, -0.7806742, 2.702428, 1, 0, 0.2705882, 1,
1.720765, -0.7723628, 3.055402, 1, 0, 0.2627451, 1,
1.722995, 1.182745, -0.09838945, 1, 0, 0.2588235, 1,
1.727636, 0.07090295, 0.7145935, 1, 0, 0.2509804, 1,
1.736072, -1.278731, 2.559079, 1, 0, 0.2470588, 1,
1.740104, -0.4209914, 2.914681, 1, 0, 0.2392157, 1,
1.742817, -1.217729, 1.667699, 1, 0, 0.2352941, 1,
1.750111, 0.2145571, 2.12986, 1, 0, 0.227451, 1,
1.770529, 0.5648626, 1.163911, 1, 0, 0.2235294, 1,
1.773604, -0.6204916, 2.207242, 1, 0, 0.2156863, 1,
1.781668, 0.2844862, 1.491262, 1, 0, 0.2117647, 1,
1.791944, -0.8220743, 2.569055, 1, 0, 0.2039216, 1,
1.809252, 1.226163, 1.697512, 1, 0, 0.1960784, 1,
1.811659, -0.2312774, 2.295405, 1, 0, 0.1921569, 1,
1.811719, -0.7774557, 1.925189, 1, 0, 0.1843137, 1,
1.814843, 0.5349858, -0.8390455, 1, 0, 0.1803922, 1,
1.825393, -0.507035, 3.061351, 1, 0, 0.172549, 1,
1.8273, 0.6464769, 0.354197, 1, 0, 0.1686275, 1,
1.850339, -0.0913142, 0.4506923, 1, 0, 0.1607843, 1,
1.864828, -1.845897, 3.572793, 1, 0, 0.1568628, 1,
1.872824, 0.3531285, 1.753902, 1, 0, 0.1490196, 1,
1.907707, -0.3010749, 0.6435465, 1, 0, 0.145098, 1,
1.99536, 0.9131275, 0.2837434, 1, 0, 0.1372549, 1,
2.020241, -0.02797777, 2.808014, 1, 0, 0.1333333, 1,
2.026883, 1.561008, 1.355278, 1, 0, 0.1254902, 1,
2.038496, 0.1367586, 2.527189, 1, 0, 0.1215686, 1,
2.159406, 0.01754425, 1.776582, 1, 0, 0.1137255, 1,
2.187074, -1.897621, 2.021052, 1, 0, 0.1098039, 1,
2.222696, -0.4776821, 2.887199, 1, 0, 0.1019608, 1,
2.231198, -0.3854144, 3.684083, 1, 0, 0.09411765, 1,
2.25362, 1.78505, 0.6871195, 1, 0, 0.09019608, 1,
2.367336, -0.2782684, -0.6489733, 1, 0, 0.08235294, 1,
2.392349, -0.6277467, 1.129526, 1, 0, 0.07843138, 1,
2.400672, 0.8089395, 2.385127, 1, 0, 0.07058824, 1,
2.412153, -1.659589, -0.8731921, 1, 0, 0.06666667, 1,
2.450454, -1.251528, 3.236819, 1, 0, 0.05882353, 1,
2.499052, 0.7772146, 2.11142, 1, 0, 0.05490196, 1,
2.511958, 0.5741571, -0.4367392, 1, 0, 0.04705882, 1,
2.585056, -1.358976, 1.766229, 1, 0, 0.04313726, 1,
2.707538, -0.2333733, 2.758382, 1, 0, 0.03529412, 1,
2.755214, -0.03821428, 1.930554, 1, 0, 0.03137255, 1,
2.836194, 0.7568667, 2.430911, 1, 0, 0.02352941, 1,
2.8849, -1.771116, 1.938524, 1, 0, 0.01960784, 1,
2.931822, -0.6242515, 1.64158, 1, 0, 0.01176471, 1,
3.318106, -0.4413273, 1.988595, 1, 0, 0.007843138, 1
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
0.3055695, -3.990108, -6.695829, 0, -0.5, 0.5, 0.5,
0.3055695, -3.990108, -6.695829, 1, -0.5, 0.5, 0.5,
0.3055695, -3.990108, -6.695829, 1, 1.5, 0.5, 0.5,
0.3055695, -3.990108, -6.695829, 0, 1.5, 0.5, 0.5
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
-3.728216, -0.02247, -6.695829, 0, -0.5, 0.5, 0.5,
-3.728216, -0.02247, -6.695829, 1, -0.5, 0.5, 0.5,
-3.728216, -0.02247, -6.695829, 1, 1.5, 0.5, 0.5,
-3.728216, -0.02247, -6.695829, 0, 1.5, 0.5, 0.5
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
-3.728216, -3.990108, 0.1890988, 0, -0.5, 0.5, 0.5,
-3.728216, -3.990108, 0.1890988, 1, -0.5, 0.5, 0.5,
-3.728216, -3.990108, 0.1890988, 1, 1.5, 0.5, 0.5,
-3.728216, -3.990108, 0.1890988, 0, 1.5, 0.5, 0.5
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
-2, -3.074499, -5.106999,
3, -3.074499, -5.106999,
-2, -3.074499, -5.106999,
-2, -3.227101, -5.371804,
-1, -3.074499, -5.106999,
-1, -3.227101, -5.371804,
0, -3.074499, -5.106999,
0, -3.227101, -5.371804,
1, -3.074499, -5.106999,
1, -3.227101, -5.371804,
2, -3.074499, -5.106999,
2, -3.227101, -5.371804,
3, -3.074499, -5.106999,
3, -3.227101, -5.371804
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
-2, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
-2, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
-2, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
-2, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5,
-1, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
-1, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
-1, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
-1, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5,
0, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
0, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
0, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
0, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5,
1, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
1, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
1, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
1, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5,
2, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
2, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
2, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
2, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5,
3, -3.532303, -5.901414, 0, -0.5, 0.5, 0.5,
3, -3.532303, -5.901414, 1, -0.5, 0.5, 0.5,
3, -3.532303, -5.901414, 1, 1.5, 0.5, 0.5,
3, -3.532303, -5.901414, 0, 1.5, 0.5, 0.5
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
-2.797343, -2, -5.106999,
-2.797343, 2, -5.106999,
-2.797343, -2, -5.106999,
-2.952488, -2, -5.371804,
-2.797343, -1, -5.106999,
-2.952488, -1, -5.371804,
-2.797343, 0, -5.106999,
-2.952488, 0, -5.371804,
-2.797343, 1, -5.106999,
-2.952488, 1, -5.371804,
-2.797343, 2, -5.106999,
-2.952488, 2, -5.371804
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
-3.262779, -2, -5.901414, 0, -0.5, 0.5, 0.5,
-3.262779, -2, -5.901414, 1, -0.5, 0.5, 0.5,
-3.262779, -2, -5.901414, 1, 1.5, 0.5, 0.5,
-3.262779, -2, -5.901414, 0, 1.5, 0.5, 0.5,
-3.262779, -1, -5.901414, 0, -0.5, 0.5, 0.5,
-3.262779, -1, -5.901414, 1, -0.5, 0.5, 0.5,
-3.262779, -1, -5.901414, 1, 1.5, 0.5, 0.5,
-3.262779, -1, -5.901414, 0, 1.5, 0.5, 0.5,
-3.262779, 0, -5.901414, 0, -0.5, 0.5, 0.5,
-3.262779, 0, -5.901414, 1, -0.5, 0.5, 0.5,
-3.262779, 0, -5.901414, 1, 1.5, 0.5, 0.5,
-3.262779, 0, -5.901414, 0, 1.5, 0.5, 0.5,
-3.262779, 1, -5.901414, 0, -0.5, 0.5, 0.5,
-3.262779, 1, -5.901414, 1, -0.5, 0.5, 0.5,
-3.262779, 1, -5.901414, 1, 1.5, 0.5, 0.5,
-3.262779, 1, -5.901414, 0, 1.5, 0.5, 0.5,
-3.262779, 2, -5.901414, 0, -0.5, 0.5, 0.5,
-3.262779, 2, -5.901414, 1, -0.5, 0.5, 0.5,
-3.262779, 2, -5.901414, 1, 1.5, 0.5, 0.5,
-3.262779, 2, -5.901414, 0, 1.5, 0.5, 0.5
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
-2.797343, -3.074499, -4,
-2.797343, -3.074499, 4,
-2.797343, -3.074499, -4,
-2.952488, -3.227101, -4,
-2.797343, -3.074499, -2,
-2.952488, -3.227101, -2,
-2.797343, -3.074499, 0,
-2.952488, -3.227101, 0,
-2.797343, -3.074499, 2,
-2.952488, -3.227101, 2,
-2.797343, -3.074499, 4,
-2.952488, -3.227101, 4
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
-3.262779, -3.532303, -4, 0, -0.5, 0.5, 0.5,
-3.262779, -3.532303, -4, 1, -0.5, 0.5, 0.5,
-3.262779, -3.532303, -4, 1, 1.5, 0.5, 0.5,
-3.262779, -3.532303, -4, 0, 1.5, 0.5, 0.5,
-3.262779, -3.532303, -2, 0, -0.5, 0.5, 0.5,
-3.262779, -3.532303, -2, 1, -0.5, 0.5, 0.5,
-3.262779, -3.532303, -2, 1, 1.5, 0.5, 0.5,
-3.262779, -3.532303, -2, 0, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 0, 0, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 0, 1, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 0, 1, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 0, 0, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 2, 0, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 2, 1, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 2, 1, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 2, 0, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 4, 0, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 4, 1, -0.5, 0.5, 0.5,
-3.262779, -3.532303, 4, 1, 1.5, 0.5, 0.5,
-3.262779, -3.532303, 4, 0, 1.5, 0.5, 0.5
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
-2.797343, -3.074499, -5.106999,
-2.797343, 3.029559, -5.106999,
-2.797343, -3.074499, 5.485197,
-2.797343, 3.029559, 5.485197,
-2.797343, -3.074499, -5.106999,
-2.797343, -3.074499, 5.485197,
-2.797343, 3.029559, -5.106999,
-2.797343, 3.029559, 5.485197,
-2.797343, -3.074499, -5.106999,
3.408482, -3.074499, -5.106999,
-2.797343, -3.074499, 5.485197,
3.408482, -3.074499, 5.485197,
-2.797343, 3.029559, -5.106999,
3.408482, 3.029559, -5.106999,
-2.797343, 3.029559, 5.485197,
3.408482, 3.029559, 5.485197,
3.408482, -3.074499, -5.106999,
3.408482, 3.029559, -5.106999,
3.408482, -3.074499, 5.485197,
3.408482, 3.029559, 5.485197,
3.408482, -3.074499, -5.106999,
3.408482, -3.074499, 5.485197,
3.408482, 3.029559, -5.106999,
3.408482, 3.029559, 5.485197
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
var radius = 7.320919;
var distance = 32.57159;
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
mvMatrix.translate( -0.3055695, 0.02247, -0.1890988 );
mvMatrix.scale( 1.275499, 1.296764, 0.7472974 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.57159);
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
flamprop-M-methyl<-read.table("flamprop-M-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flamprop-M-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
y<-flamprop-M-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
z<-flamprop-M-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
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
-2.706967, 1.178495, -0.2898659, 0, 0, 1, 1, 1,
-2.64558, 0.1049569, -1.598409, 1, 0, 0, 1, 1,
-2.639525, -2.849842, -3.259567, 1, 0, 0, 1, 1,
-2.460402, -1.946084, -1.924087, 1, 0, 0, 1, 1,
-2.40959, 0.8494709, -2.319918, 1, 0, 0, 1, 1,
-2.392565, -0.8503715, -2.478644, 1, 0, 0, 1, 1,
-2.328417, 0.5339516, -0.6095333, 0, 0, 0, 1, 1,
-2.266615, -1.044522, -1.695519, 0, 0, 0, 1, 1,
-2.170814, -0.4229714, -0.7854208, 0, 0, 0, 1, 1,
-2.169616, -1.031782, -0.4404233, 0, 0, 0, 1, 1,
-2.130445, -1.112255, -1.427589, 0, 0, 0, 1, 1,
-2.128577, 0.04098286, -1.418936, 0, 0, 0, 1, 1,
-2.110999, -1.602142, -3.046321, 0, 0, 0, 1, 1,
-2.091706, -1.112904, -2.019337, 1, 1, 1, 1, 1,
-2.058457, 1.423821, -1.173576, 1, 1, 1, 1, 1,
-2.035985, -2.386638, -3.694399, 1, 1, 1, 1, 1,
-2.00655, -0.1465189, -1.009147, 1, 1, 1, 1, 1,
-1.979317, -0.3647856, -1.509672, 1, 1, 1, 1, 1,
-1.969163, 0.2310037, -3.066599, 1, 1, 1, 1, 1,
-1.944316, 0.08335795, -2.413515, 1, 1, 1, 1, 1,
-1.937297, 0.161377, -0.6930586, 1, 1, 1, 1, 1,
-1.93567, 1.725209, -2.590909, 1, 1, 1, 1, 1,
-1.926506, 1.288497, -2.211247, 1, 1, 1, 1, 1,
-1.923027, 0.009749465, -1.38303, 1, 1, 1, 1, 1,
-1.914824, -0.5792168, -2.617819, 1, 1, 1, 1, 1,
-1.909396, 0.9836481, 0.139592, 1, 1, 1, 1, 1,
-1.897572, 1.175434, -0.803598, 1, 1, 1, 1, 1,
-1.886026, -0.7125487, -4.608086, 1, 1, 1, 1, 1,
-1.87929, 1.535618, -1.795195, 0, 0, 1, 1, 1,
-1.874928, 0.3146861, -1.792361, 1, 0, 0, 1, 1,
-1.859773, 1.551386, 0.2878909, 1, 0, 0, 1, 1,
-1.817325, -0.5640359, -2.420475, 1, 0, 0, 1, 1,
-1.806156, -1.786215, -4.176178, 1, 0, 0, 1, 1,
-1.778122, 1.444882, -0.6523753, 1, 0, 0, 1, 1,
-1.776671, -0.4839273, -3.074526, 0, 0, 0, 1, 1,
-1.762108, 1.350636, -0.3228492, 0, 0, 0, 1, 1,
-1.73383, -2.12252, -3.207907, 0, 0, 0, 1, 1,
-1.705976, -0.3544827, -3.595324, 0, 0, 0, 1, 1,
-1.697534, -0.9953473, -2.132142, 0, 0, 0, 1, 1,
-1.694661, 0.3278595, -3.051729, 0, 0, 0, 1, 1,
-1.67167, 0.1385438, -2.321791, 0, 0, 0, 1, 1,
-1.667107, 2.046829, -1.612473, 1, 1, 1, 1, 1,
-1.645486, -1.146016, -0.9967749, 1, 1, 1, 1, 1,
-1.634123, 0.2028366, -0.2396311, 1, 1, 1, 1, 1,
-1.633227, 0.2018473, -0.5093742, 1, 1, 1, 1, 1,
-1.631979, 0.0172485, -0.6663073, 1, 1, 1, 1, 1,
-1.62751, 0.06856203, -1.531408, 1, 1, 1, 1, 1,
-1.603807, 0.03510169, -1.19747, 1, 1, 1, 1, 1,
-1.5965, 0.6450127, 0.08605674, 1, 1, 1, 1, 1,
-1.579694, 0.6165529, -0.8370554, 1, 1, 1, 1, 1,
-1.579008, 1.366798, 0.8118608, 1, 1, 1, 1, 1,
-1.577914, -0.3689567, -0.8945742, 1, 1, 1, 1, 1,
-1.575583, 0.6334708, -1.127141, 1, 1, 1, 1, 1,
-1.573281, 0.8419635, -1.195868, 1, 1, 1, 1, 1,
-1.566665, -0.916484, -2.283875, 1, 1, 1, 1, 1,
-1.559399, -0.3300673, 0.122072, 1, 1, 1, 1, 1,
-1.550433, -1.036876, -1.313581, 0, 0, 1, 1, 1,
-1.549003, 0.1882953, -1.772772, 1, 0, 0, 1, 1,
-1.543436, -0.6835879, 0.2235333, 1, 0, 0, 1, 1,
-1.53646, 0.5288085, -1.867083, 1, 0, 0, 1, 1,
-1.536298, 0.06969265, -0.1383241, 1, 0, 0, 1, 1,
-1.479213, -0.3854846, -0.9880015, 1, 0, 0, 1, 1,
-1.467602, -0.4998194, -1.320851, 0, 0, 0, 1, 1,
-1.451094, -0.9833409, -1.998304, 0, 0, 0, 1, 1,
-1.447476, 0.05447759, -1.736228, 0, 0, 0, 1, 1,
-1.445075, 1.514946, -0.2092005, 0, 0, 0, 1, 1,
-1.438411, -0.9109042, -3.591828, 0, 0, 0, 1, 1,
-1.43716, -0.2898051, -1.936389, 0, 0, 0, 1, 1,
-1.434724, -0.4088662, -2.488006, 0, 0, 0, 1, 1,
-1.434288, 0.1336852, -1.152569, 1, 1, 1, 1, 1,
-1.421125, 0.004706729, -0.6374196, 1, 1, 1, 1, 1,
-1.409337, 0.1205138, -0.2566153, 1, 1, 1, 1, 1,
-1.392, -1.217688, -2.23436, 1, 1, 1, 1, 1,
-1.389541, 0.9747061, 0.07879817, 1, 1, 1, 1, 1,
-1.37092, -1.037814, -2.836865, 1, 1, 1, 1, 1,
-1.365328, -0.001234666, -2.343112, 1, 1, 1, 1, 1,
-1.35308, 0.6723284, -1.259334, 1, 1, 1, 1, 1,
-1.353054, -1.020516, 0.0571754, 1, 1, 1, 1, 1,
-1.333126, -0.8628828, 1.067541, 1, 1, 1, 1, 1,
-1.31221, 0.9473704, -1.931395, 1, 1, 1, 1, 1,
-1.307646, -0.516049, -1.570366, 1, 1, 1, 1, 1,
-1.304772, -0.1082922, -1.299309, 1, 1, 1, 1, 1,
-1.303418, 0.4547656, 0.31715, 1, 1, 1, 1, 1,
-1.299748, 1.178155, -1.351817, 1, 1, 1, 1, 1,
-1.286588, 0.6911942, -1.202202, 0, 0, 1, 1, 1,
-1.275801, -0.756045, -0.7287875, 1, 0, 0, 1, 1,
-1.269744, -0.5849674, -3.601852, 1, 0, 0, 1, 1,
-1.263819, 0.2615947, -1.809505, 1, 0, 0, 1, 1,
-1.261458, 0.463536, -1.520847, 1, 0, 0, 1, 1,
-1.260631, 0.7910677, -0.5308118, 1, 0, 0, 1, 1,
-1.249401, 1.130528, -0.7113635, 0, 0, 0, 1, 1,
-1.245634, -1.454333, 0.1918669, 0, 0, 0, 1, 1,
-1.241059, 1.397757, -1.401973, 0, 0, 0, 1, 1,
-1.240577, -0.2199639, -1.882011, 0, 0, 0, 1, 1,
-1.238862, -0.1436307, -0.8251336, 0, 0, 0, 1, 1,
-1.237123, 0.3155247, 0.3877651, 0, 0, 0, 1, 1,
-1.23121, 0.5854973, 0.8437155, 0, 0, 0, 1, 1,
-1.218766, -0.9641625, -1.007864, 1, 1, 1, 1, 1,
-1.21133, 1.787524, 0.002581783, 1, 1, 1, 1, 1,
-1.208689, 1.443573, -1.140206, 1, 1, 1, 1, 1,
-1.197471, 0.823594, 0.5278454, 1, 1, 1, 1, 1,
-1.197322, -0.339278, -0.9024404, 1, 1, 1, 1, 1,
-1.197024, -0.1308639, -3.435377, 1, 1, 1, 1, 1,
-1.196826, -0.654475, -3.298178, 1, 1, 1, 1, 1,
-1.195914, 0.3617733, -2.071565, 1, 1, 1, 1, 1,
-1.187187, 0.7935655, -1.74214, 1, 1, 1, 1, 1,
-1.179937, -2.122186, -1.443485, 1, 1, 1, 1, 1,
-1.171723, -0.6476884, -1.888176, 1, 1, 1, 1, 1,
-1.169326, 0.05311663, -1.594587, 1, 1, 1, 1, 1,
-1.166645, -0.1077829, -1.342306, 1, 1, 1, 1, 1,
-1.164324, -1.061693, -3.000412, 1, 1, 1, 1, 1,
-1.158915, 0.6439273, -0.4380414, 1, 1, 1, 1, 1,
-1.153271, 1.635756, 0.2955868, 0, 0, 1, 1, 1,
-1.137902, 0.8509127, 0.02957457, 1, 0, 0, 1, 1,
-1.137107, -0.666503, -2.209323, 1, 0, 0, 1, 1,
-1.135955, 0.8064175, -2.192807, 1, 0, 0, 1, 1,
-1.135369, 0.5654608, -2.003854, 1, 0, 0, 1, 1,
-1.132736, -0.9228796, -3.242452, 1, 0, 0, 1, 1,
-1.121662, -0.6073005, -0.8861692, 0, 0, 0, 1, 1,
-1.12039, 0.5256352, -1.382047, 0, 0, 0, 1, 1,
-1.117343, 0.5361834, -1.613565, 0, 0, 0, 1, 1,
-1.116902, 0.9243522, -1.507454, 0, 0, 0, 1, 1,
-1.11685, 0.5846866, -1.598432, 0, 0, 0, 1, 1,
-1.109281, -0.645716, -1.760566, 0, 0, 0, 1, 1,
-1.108878, 1.157168, 0.7494845, 0, 0, 0, 1, 1,
-1.108793, 1.192181, -0.1590516, 1, 1, 1, 1, 1,
-1.10732, -0.4600223, -1.15217, 1, 1, 1, 1, 1,
-1.10592, 1.023063, 0.3565107, 1, 1, 1, 1, 1,
-1.090948, 0.7984459, -1.838679, 1, 1, 1, 1, 1,
-1.085887, 1.462868, -0.3131474, 1, 1, 1, 1, 1,
-1.083526, 0.2370968, -0.9934596, 1, 1, 1, 1, 1,
-1.077837, 0.6910295, -0.692103, 1, 1, 1, 1, 1,
-1.070038, 0.2012014, -0.8137319, 1, 1, 1, 1, 1,
-1.069257, 0.6171144, 0.2472882, 1, 1, 1, 1, 1,
-1.066829, 1.462795, -0.04380942, 1, 1, 1, 1, 1,
-1.066267, -2.057031, -2.978843, 1, 1, 1, 1, 1,
-1.065843, -1.510704, -1.182302, 1, 1, 1, 1, 1,
-1.062589, -1.327503, -2.854893, 1, 1, 1, 1, 1,
-1.055943, 0.1123934, -0.691085, 1, 1, 1, 1, 1,
-1.049402, 0.5977335, -0.812888, 1, 1, 1, 1, 1,
-1.045502, 1.361203, -1.89343, 0, 0, 1, 1, 1,
-1.045259, 0.5008911, -1.566292, 1, 0, 0, 1, 1,
-1.038833, 0.801145, -0.7034619, 1, 0, 0, 1, 1,
-1.038659, -0.8238496, -2.658794, 1, 0, 0, 1, 1,
-1.03577, 1.352052, -1.485997, 1, 0, 0, 1, 1,
-1.033822, 1.140043, -0.5979123, 1, 0, 0, 1, 1,
-1.02482, -1.963782, -0.3944762, 0, 0, 0, 1, 1,
-1.016475, -0.9905534, -2.770432, 0, 0, 0, 1, 1,
-1.015102, 0.8066872, -2.701798, 0, 0, 0, 1, 1,
-1.013745, 0.8927436, -0.1778578, 0, 0, 0, 1, 1,
-1.010536, 0.3886584, -1.672152, 0, 0, 0, 1, 1,
-1.009758, 1.103052, -1.481907, 0, 0, 0, 1, 1,
-1.008365, -1.543849, -3.186703, 0, 0, 0, 1, 1,
-1.007569, -0.7188044, -2.809372, 1, 1, 1, 1, 1,
-1.003655, -1.057005, -0.8014023, 1, 1, 1, 1, 1,
-0.9995195, 0.08418304, -0.4348001, 1, 1, 1, 1, 1,
-0.9969811, -0.6914716, -2.721684, 1, 1, 1, 1, 1,
-0.9933856, 1.000747, 0.1104189, 1, 1, 1, 1, 1,
-0.9889255, 0.8264852, -0.5663171, 1, 1, 1, 1, 1,
-0.9887187, -1.181095, -0.818433, 1, 1, 1, 1, 1,
-0.9836504, -0.5416511, -1.209765, 1, 1, 1, 1, 1,
-0.9813991, 0.6100971, -1.370777, 1, 1, 1, 1, 1,
-0.9808674, -1.201364, -2.905411, 1, 1, 1, 1, 1,
-0.9804157, 0.1578806, -1.037371, 1, 1, 1, 1, 1,
-0.9789714, 0.2485715, -1.950866, 1, 1, 1, 1, 1,
-0.9770471, -0.5318151, -2.54596, 1, 1, 1, 1, 1,
-0.9687085, -1.42889, -3.504454, 1, 1, 1, 1, 1,
-0.9670851, -0.003588452, -3.929563, 1, 1, 1, 1, 1,
-0.9546118, -1.294265, -2.771306, 0, 0, 1, 1, 1,
-0.9500189, -0.9629338, -2.685753, 1, 0, 0, 1, 1,
-0.948812, 0.6274616, -0.988017, 1, 0, 0, 1, 1,
-0.9452703, 1.213083, -2.181955, 1, 0, 0, 1, 1,
-0.942794, -1.060058, -1.213757, 1, 0, 0, 1, 1,
-0.940414, 0.2440977, 1.235176, 1, 0, 0, 1, 1,
-0.9388573, -0.4560055, -4.495654, 0, 0, 0, 1, 1,
-0.9387013, -1.401476, -2.23172, 0, 0, 0, 1, 1,
-0.9373632, 0.03221695, -1.242224, 0, 0, 0, 1, 1,
-0.9337579, -0.3443277, -1.611364, 0, 0, 0, 1, 1,
-0.9293161, 0.7921826, -0.02039288, 0, 0, 0, 1, 1,
-0.9262962, -1.837246, -2.813237, 0, 0, 0, 1, 1,
-0.9260389, 2.045277, -0.712404, 0, 0, 0, 1, 1,
-0.9247223, -0.682843, -0.8220356, 1, 1, 1, 1, 1,
-0.9207253, -0.03834954, -1.636432, 1, 1, 1, 1, 1,
-0.9181107, 0.5183421, -1.285516, 1, 1, 1, 1, 1,
-0.9117008, -0.4476376, -2.549816, 1, 1, 1, 1, 1,
-0.907267, 1.163587, 1.152546, 1, 1, 1, 1, 1,
-0.9050027, -0.9782944, -3.18187, 1, 1, 1, 1, 1,
-0.8995108, -0.1869592, -1.07083, 1, 1, 1, 1, 1,
-0.8974478, 0.2327517, -2.190195, 1, 1, 1, 1, 1,
-0.8930933, 0.2146942, -0.3485145, 1, 1, 1, 1, 1,
-0.8917518, 0.1936404, -0.01402297, 1, 1, 1, 1, 1,
-0.8888708, 0.8584651, -0.4450676, 1, 1, 1, 1, 1,
-0.8842992, -0.2659879, -2.136622, 1, 1, 1, 1, 1,
-0.8739452, 0.730597, -2.157934, 1, 1, 1, 1, 1,
-0.873549, 0.8269451, -0.756787, 1, 1, 1, 1, 1,
-0.8716186, -0.3448829, -1.141746, 1, 1, 1, 1, 1,
-0.868829, -0.1571838, 0.3473786, 0, 0, 1, 1, 1,
-0.8660637, -0.0273092, -0.8793041, 1, 0, 0, 1, 1,
-0.8592281, -1.823497, -3.719438, 1, 0, 0, 1, 1,
-0.8591985, 1.06873, 0.2458959, 1, 0, 0, 1, 1,
-0.8526034, -0.7527073, -1.89116, 1, 0, 0, 1, 1,
-0.8499955, -0.8910111, -1.821, 1, 0, 0, 1, 1,
-0.843652, -0.2527795, -2.061516, 0, 0, 0, 1, 1,
-0.8411145, 0.3894386, 0.07753426, 0, 0, 0, 1, 1,
-0.8270518, -0.5378748, -2.15433, 0, 0, 0, 1, 1,
-0.8212276, 0.1131248, -2.084322, 0, 0, 0, 1, 1,
-0.8169923, -1.816959, -4.580078, 0, 0, 0, 1, 1,
-0.8152676, -0.4773022, -2.766302, 0, 0, 0, 1, 1,
-0.8109108, 0.07349048, -2.140705, 0, 0, 0, 1, 1,
-0.8064337, 0.2455181, -2.426293, 1, 1, 1, 1, 1,
-0.8013743, -0.1423773, -0.9739937, 1, 1, 1, 1, 1,
-0.7995958, -0.1213984, -2.515887, 1, 1, 1, 1, 1,
-0.7953027, -0.1819461, -1.983989, 1, 1, 1, 1, 1,
-0.7895645, -0.6491018, -1.105569, 1, 1, 1, 1, 1,
-0.7821446, 0.6441924, -1.687315, 1, 1, 1, 1, 1,
-0.7803398, 2.02217, 0.2165943, 1, 1, 1, 1, 1,
-0.7798771, 0.2194531, -0.7436036, 1, 1, 1, 1, 1,
-0.7772394, 0.1414108, -1.520165, 1, 1, 1, 1, 1,
-0.7703248, 1.009791, -0.8370897, 1, 1, 1, 1, 1,
-0.7624729, 0.6491119, -0.1363588, 1, 1, 1, 1, 1,
-0.7571825, 1.332902, 0.01688707, 1, 1, 1, 1, 1,
-0.75475, 0.6043748, 0.09617712, 1, 1, 1, 1, 1,
-0.7451813, 0.805303, -0.708827, 1, 1, 1, 1, 1,
-0.7390545, -0.4018429, -2.968962, 1, 1, 1, 1, 1,
-0.7379062, 0.6532702, -0.164842, 0, 0, 1, 1, 1,
-0.7352767, 0.3315377, 0.499241, 1, 0, 0, 1, 1,
-0.7310867, 1.050242, -1.809512, 1, 0, 0, 1, 1,
-0.7265285, -0.9662482, -3.500456, 1, 0, 0, 1, 1,
-0.7239611, 0.8034595, -0.203731, 1, 0, 0, 1, 1,
-0.7238218, -1.28082, -1.602056, 1, 0, 0, 1, 1,
-0.722525, -1.303122, -1.765862, 0, 0, 0, 1, 1,
-0.721987, -1.20123, -1.658309, 0, 0, 0, 1, 1,
-0.7175163, 1.145796, -0.5049123, 0, 0, 0, 1, 1,
-0.7148972, 1.395577, 0.7169198, 0, 0, 0, 1, 1,
-0.7126061, -0.7719119, -2.099621, 0, 0, 0, 1, 1,
-0.7103825, 0.2584557, -0.4017027, 0, 0, 0, 1, 1,
-0.7014635, 0.1912146, -0.7695909, 0, 0, 0, 1, 1,
-0.6972984, -1.564409, -3.52855, 1, 1, 1, 1, 1,
-0.6949958, 0.9417642, -0.9933507, 1, 1, 1, 1, 1,
-0.6829188, 0.8062226, -0.5227632, 1, 1, 1, 1, 1,
-0.6786316, -0.1652737, -2.220672, 1, 1, 1, 1, 1,
-0.677705, -1.965534, -2.448674, 1, 1, 1, 1, 1,
-0.6760894, 0.7107112, -2.113217, 1, 1, 1, 1, 1,
-0.6669275, -0.8251266, -2.179523, 1, 1, 1, 1, 1,
-0.6662121, 0.0989171, -2.99506, 1, 1, 1, 1, 1,
-0.6635383, -1.35743, -3.858757, 1, 1, 1, 1, 1,
-0.6628361, 1.373977, -2.172713, 1, 1, 1, 1, 1,
-0.649868, -1.311493, -2.736013, 1, 1, 1, 1, 1,
-0.6458634, -1.388528, -3.61811, 1, 1, 1, 1, 1,
-0.6430553, -0.1297661, -2.57871, 1, 1, 1, 1, 1,
-0.6419963, 1.077259, -1.479331, 1, 1, 1, 1, 1,
-0.6383686, -1.262583, -3.305468, 1, 1, 1, 1, 1,
-0.637073, -0.430311, -1.469016, 0, 0, 1, 1, 1,
-0.6367595, 0.9236231, -1.8995, 1, 0, 0, 1, 1,
-0.6312747, -2.447999, -4.488161, 1, 0, 0, 1, 1,
-0.6250353, -1.035555, -3.162399, 1, 0, 0, 1, 1,
-0.6189743, -0.6476708, -1.237529, 1, 0, 0, 1, 1,
-0.6103389, 0.6998739, -1.094162, 1, 0, 0, 1, 1,
-0.6100112, -0.6876683, -1.219156, 0, 0, 0, 1, 1,
-0.609308, -1.043578, -3.263822, 0, 0, 0, 1, 1,
-0.5892393, 0.7449901, -1.456567, 0, 0, 0, 1, 1,
-0.5878098, 1.087729, -0.4292439, 0, 0, 0, 1, 1,
-0.5869121, 0.4103612, 0.07338656, 0, 0, 0, 1, 1,
-0.5843794, 0.3975301, -1.490621, 0, 0, 0, 1, 1,
-0.5833373, -2.48385, -1.06512, 0, 0, 0, 1, 1,
-0.5817325, -2.148352, -3.972449, 1, 1, 1, 1, 1,
-0.5807167, -0.3682154, -1.648142, 1, 1, 1, 1, 1,
-0.5788846, 0.8847578, -1.775359, 1, 1, 1, 1, 1,
-0.5738724, 0.5844842, 0.2466597, 1, 1, 1, 1, 1,
-0.5719346, -0.04104358, -1.503337, 1, 1, 1, 1, 1,
-0.5707562, -1.216884, -4.815565, 1, 1, 1, 1, 1,
-0.5688933, -0.3421158, -1.718424, 1, 1, 1, 1, 1,
-0.5676515, 0.05597584, -1.312272, 1, 1, 1, 1, 1,
-0.566406, 0.5169164, -2.237634, 1, 1, 1, 1, 1,
-0.5647028, -0.117789, -0.9479975, 1, 1, 1, 1, 1,
-0.5622553, 1.036441, 1.227657, 1, 1, 1, 1, 1,
-0.5601557, 0.1639801, -1.421988, 1, 1, 1, 1, 1,
-0.5591151, 0.1219054, -1.27333, 1, 1, 1, 1, 1,
-0.5578472, 0.3741998, -0.7764509, 1, 1, 1, 1, 1,
-0.5548345, 0.8285339, 0.3627573, 1, 1, 1, 1, 1,
-0.5492588, 0.6144738, -0.1020954, 0, 0, 1, 1, 1,
-0.5466654, 1.258084, -0.09273557, 1, 0, 0, 1, 1,
-0.544548, 0.3048046, -0.5056629, 1, 0, 0, 1, 1,
-0.5435516, 0.7370048, -0.4483367, 1, 0, 0, 1, 1,
-0.5387447, 0.2382748, -0.7247602, 1, 0, 0, 1, 1,
-0.53226, 0.2064522, -1.160673, 1, 0, 0, 1, 1,
-0.5322452, -0.6484457, -3.6665, 0, 0, 0, 1, 1,
-0.5320624, -1.017219, -2.656849, 0, 0, 0, 1, 1,
-0.529591, 0.7350653, -0.1139533, 0, 0, 0, 1, 1,
-0.5246592, 0.1861472, -0.7974268, 0, 0, 0, 1, 1,
-0.5193604, -0.2998637, -1.46507, 0, 0, 0, 1, 1,
-0.5170889, 0.6728874, -0.9620878, 0, 0, 0, 1, 1,
-0.5163598, -1.334941, -3.069473, 0, 0, 0, 1, 1,
-0.5159296, -0.1225133, -3.876032, 1, 1, 1, 1, 1,
-0.5152366, 0.5264051, -1.240859, 1, 1, 1, 1, 1,
-0.5123489, -1.488406, -3.02808, 1, 1, 1, 1, 1,
-0.5108195, -1.948675, -2.598493, 1, 1, 1, 1, 1,
-0.5017641, 0.1827672, -1.11027, 1, 1, 1, 1, 1,
-0.5002565, 0.4502942, 0.1322531, 1, 1, 1, 1, 1,
-0.4980653, -1.468629, -2.681655, 1, 1, 1, 1, 1,
-0.4870794, 0.3320958, -0.9863601, 1, 1, 1, 1, 1,
-0.4818904, -0.4044633, -2.127783, 1, 1, 1, 1, 1,
-0.4807992, -2.20544, -4.415839, 1, 1, 1, 1, 1,
-0.4805567, -0.1498254, -2.369651, 1, 1, 1, 1, 1,
-0.4792219, -0.751839, -2.954944, 1, 1, 1, 1, 1,
-0.4771614, 0.653527, -1.108933, 1, 1, 1, 1, 1,
-0.4744212, -0.3964546, -0.7614943, 1, 1, 1, 1, 1,
-0.4717973, 1.852233, -0.5172675, 1, 1, 1, 1, 1,
-0.4641042, 0.4732057, -0.8841735, 0, 0, 1, 1, 1,
-0.4603995, 1.13071, 0.08810448, 1, 0, 0, 1, 1,
-0.4600453, 0.02627153, -0.603657, 1, 0, 0, 1, 1,
-0.4573115, 0.8636413, -0.8596065, 1, 0, 0, 1, 1,
-0.4490496, -1.002812, -3.522371, 1, 0, 0, 1, 1,
-0.4448889, -1.599835, -3.688878, 1, 0, 0, 1, 1,
-0.4350215, 1.381094, 0.6266483, 0, 0, 0, 1, 1,
-0.4331067, 0.2687501, -0.287086, 0, 0, 0, 1, 1,
-0.4330496, -0.6029803, -1.409044, 0, 0, 0, 1, 1,
-0.4214368, -1.636507, -2.363328, 0, 0, 0, 1, 1,
-0.4198643, 0.5852538, -0.06729325, 0, 0, 0, 1, 1,
-0.4168531, -0.3495245, -2.893185, 0, 0, 0, 1, 1,
-0.4164983, -1.304931, -1.085889, 0, 0, 0, 1, 1,
-0.4127247, -0.1674709, -1.56797, 1, 1, 1, 1, 1,
-0.4113539, 1.770511, -1.324258, 1, 1, 1, 1, 1,
-0.4105222, 0.09997128, -0.6887454, 1, 1, 1, 1, 1,
-0.4075177, 0.8709541, -0.1210935, 1, 1, 1, 1, 1,
-0.4073197, -1.295295, -3.002642, 1, 1, 1, 1, 1,
-0.4000773, -0.07030723, -2.446231, 1, 1, 1, 1, 1,
-0.3989541, -0.806794, -1.77153, 1, 1, 1, 1, 1,
-0.3963355, -0.8653855, 0.09886526, 1, 1, 1, 1, 1,
-0.3960767, 0.3640459, -1.231216, 1, 1, 1, 1, 1,
-0.3883637, -0.1347279, -0.7904093, 1, 1, 1, 1, 1,
-0.3797795, -0.5012612, -3.976962, 1, 1, 1, 1, 1,
-0.3794863, 0.1891571, -0.9749844, 1, 1, 1, 1, 1,
-0.3782195, -0.6041195, -1.7704, 1, 1, 1, 1, 1,
-0.3738078, 0.2713935, 0.002726082, 1, 1, 1, 1, 1,
-0.3729734, 0.1325806, -1.798027, 1, 1, 1, 1, 1,
-0.3724005, 0.5082864, -2.356067, 0, 0, 1, 1, 1,
-0.3709266, -1.138083, -2.261785, 1, 0, 0, 1, 1,
-0.3661046, 1.01598, -0.2372365, 1, 0, 0, 1, 1,
-0.3655817, 0.06180788, -1.361683, 1, 0, 0, 1, 1,
-0.365214, 0.7687293, 0.01583008, 1, 0, 0, 1, 1,
-0.3650463, -0.08709262, -0.9902711, 1, 0, 0, 1, 1,
-0.361925, -0.5990967, -2.602298, 0, 0, 0, 1, 1,
-0.3600078, -1.258187, -2.752995, 0, 0, 0, 1, 1,
-0.3598486, -0.9963202, -3.50965, 0, 0, 0, 1, 1,
-0.3551121, 0.5933887, -0.04866404, 0, 0, 0, 1, 1,
-0.3538666, -1.968281, -0.7341717, 0, 0, 0, 1, 1,
-0.3519985, -0.5165979, -3.378468, 0, 0, 0, 1, 1,
-0.3476835, 0.07881785, -2.788331, 0, 0, 0, 1, 1,
-0.3419498, -0.7161238, -2.80555, 1, 1, 1, 1, 1,
-0.3408426, 1.182191, -0.85303, 1, 1, 1, 1, 1,
-0.3399878, -1.232539, -2.183043, 1, 1, 1, 1, 1,
-0.3346183, -1.340483, -2.349656, 1, 1, 1, 1, 1,
-0.3341669, 0.1400964, -0.7345176, 1, 1, 1, 1, 1,
-0.3290894, -0.217155, -1.761837, 1, 1, 1, 1, 1,
-0.3276794, 0.7962933, -2.327317, 1, 1, 1, 1, 1,
-0.3226311, -1.572708, -2.561041, 1, 1, 1, 1, 1,
-0.3221866, -1.549536, -2.901742, 1, 1, 1, 1, 1,
-0.3213373, -1.215811, -1.78338, 1, 1, 1, 1, 1,
-0.3204975, 0.2796424, -2.142677, 1, 1, 1, 1, 1,
-0.3199677, -0.7270525, -3.846378, 1, 1, 1, 1, 1,
-0.3168364, 0.5232348, -0.7629721, 1, 1, 1, 1, 1,
-0.3148634, -1.892346, 0.8439005, 1, 1, 1, 1, 1,
-0.3128497, 0.8480514, -0.3018618, 1, 1, 1, 1, 1,
-0.3122432, -0.01797099, -1.699196, 0, 0, 1, 1, 1,
-0.3117248, -0.3881412, -3.693618, 1, 0, 0, 1, 1,
-0.3115404, -0.374411, -1.940308, 1, 0, 0, 1, 1,
-0.3048672, 0.06943212, -1.458354, 1, 0, 0, 1, 1,
-0.3044681, -2.465063, -3.159212, 1, 0, 0, 1, 1,
-0.2958162, 1.034552, -0.2105691, 1, 0, 0, 1, 1,
-0.292229, 0.594382, -0.5721294, 0, 0, 0, 1, 1,
-0.2912732, -0.182641, -3.682153, 0, 0, 0, 1, 1,
-0.2910957, 0.378627, -1.09814, 0, 0, 0, 1, 1,
-0.2905308, -0.4616434, -2.013774, 0, 0, 0, 1, 1,
-0.2899663, 1.636893, 1.191306, 0, 0, 0, 1, 1,
-0.2898478, 1.379794, -0.3024125, 0, 0, 0, 1, 1,
-0.2840202, 0.639604, 0.9579965, 0, 0, 0, 1, 1,
-0.2789637, 1.007087, -0.1820984, 1, 1, 1, 1, 1,
-0.2732708, -0.2579379, -1.365882, 1, 1, 1, 1, 1,
-0.2684616, 1.396581, -0.9987935, 1, 1, 1, 1, 1,
-0.2683615, -2.322014, -2.436739, 1, 1, 1, 1, 1,
-0.2664988, 0.6205435, 0.154456, 1, 1, 1, 1, 1,
-0.2625598, 1.394233, 0.1724595, 1, 1, 1, 1, 1,
-0.2601924, -0.2202327, -3.354575, 1, 1, 1, 1, 1,
-0.2591403, -0.8129532, -2.086984, 1, 1, 1, 1, 1,
-0.2591367, 0.8620604, 0.5938318, 1, 1, 1, 1, 1,
-0.257543, 0.1118529, -1.435543, 1, 1, 1, 1, 1,
-0.2504158, -2.262775, -3.659949, 1, 1, 1, 1, 1,
-0.249651, 2.329553, -0.1989268, 1, 1, 1, 1, 1,
-0.247719, 0.2252929, 0.5383344, 1, 1, 1, 1, 1,
-0.2427041, 0.2168115, 0.3330327, 1, 1, 1, 1, 1,
-0.2408901, -1.712914, -1.278661, 1, 1, 1, 1, 1,
-0.2387093, 1.467784, -0.3292666, 0, 0, 1, 1, 1,
-0.2366115, -1.320369, -2.852112, 1, 0, 0, 1, 1,
-0.2305297, 0.8560312, 0.2231952, 1, 0, 0, 1, 1,
-0.227434, 1.365312, 0.526427, 1, 0, 0, 1, 1,
-0.2272193, 0.6176204, 0.4974419, 1, 0, 0, 1, 1,
-0.2268676, 0.1114276, -1.62233, 1, 0, 0, 1, 1,
-0.2252393, -2.24412, -2.063649, 0, 0, 0, 1, 1,
-0.2167749, -0.3555903, -1.349175, 0, 0, 0, 1, 1,
-0.2150586, 0.2332797, 0.1015142, 0, 0, 0, 1, 1,
-0.2064029, 0.400543, -0.9257637, 0, 0, 0, 1, 1,
-0.2058753, -0.6103742, -2.267645, 0, 0, 0, 1, 1,
-0.2032803, 0.4858148, 1.399745, 0, 0, 0, 1, 1,
-0.2024235, -0.1097995, -2.442759, 0, 0, 0, 1, 1,
-0.2023059, 1.582389, 1.04691, 1, 1, 1, 1, 1,
-0.1992809, 0.8171829, 1.790337, 1, 1, 1, 1, 1,
-0.1966916, 0.4083772, -1.316151, 1, 1, 1, 1, 1,
-0.1862978, -0.3469641, -3.152173, 1, 1, 1, 1, 1,
-0.1851821, -0.1414759, -0.1326167, 1, 1, 1, 1, 1,
-0.1847584, 0.5990666, -1.512944, 1, 1, 1, 1, 1,
-0.184085, 2.681806, -0.7465978, 1, 1, 1, 1, 1,
-0.1820176, -0.752208, -2.410357, 1, 1, 1, 1, 1,
-0.1811993, 0.6164756, -0.6572838, 1, 1, 1, 1, 1,
-0.1782725, -0.6221877, -4.044075, 1, 1, 1, 1, 1,
-0.17674, 0.2544101, 1.029508, 1, 1, 1, 1, 1,
-0.1755955, -1.936721, -2.325492, 1, 1, 1, 1, 1,
-0.1727149, -0.556075, -3.041121, 1, 1, 1, 1, 1,
-0.169102, 0.1911789, -0.781796, 1, 1, 1, 1, 1,
-0.1660152, 0.1130329, -0.9099224, 1, 1, 1, 1, 1,
-0.1646561, 0.5512384, 1.394983, 0, 0, 1, 1, 1,
-0.1626353, 0.1364283, -2.111624, 1, 0, 0, 1, 1,
-0.1564115, -0.1435977, -1.543325, 1, 0, 0, 1, 1,
-0.1553975, 0.5215552, -0.110891, 1, 0, 0, 1, 1,
-0.1506422, -0.2885882, -1.906672, 1, 0, 0, 1, 1,
-0.1461952, -2.095435, -4.15375, 1, 0, 0, 1, 1,
-0.1444018, 1.157089, -0.4830455, 0, 0, 0, 1, 1,
-0.1432626, -0.4780067, -3.441688, 0, 0, 0, 1, 1,
-0.1409176, -0.5796236, -2.299065, 0, 0, 0, 1, 1,
-0.1378144, -1.25045, -2.904204, 0, 0, 0, 1, 1,
-0.1374066, -0.3295326, -2.993754, 0, 0, 0, 1, 1,
-0.1366413, 0.4009857, -0.9177399, 0, 0, 0, 1, 1,
-0.1358304, 0.4335176, 0.7306477, 0, 0, 0, 1, 1,
-0.1357213, -1.128295, -0.8213131, 1, 1, 1, 1, 1,
-0.1323617, -1.48054, -1.991146, 1, 1, 1, 1, 1,
-0.121225, 0.3893735, -0.1014438, 1, 1, 1, 1, 1,
-0.120669, 0.1099697, -1.956721, 1, 1, 1, 1, 1,
-0.1204179, -0.3021006, -3.002061, 1, 1, 1, 1, 1,
-0.120212, 1.268789, 1.219616, 1, 1, 1, 1, 1,
-0.1153821, 0.5694542, 0.8603928, 1, 1, 1, 1, 1,
-0.1134051, -1.493548, -2.486077, 1, 1, 1, 1, 1,
-0.1077918, -0.1881648, -1.387507, 1, 1, 1, 1, 1,
-0.1059606, 1.233393, -1.292547, 1, 1, 1, 1, 1,
-0.105548, 0.4311053, 1.093832, 1, 1, 1, 1, 1,
-0.1051654, -2.04091, -2.776808, 1, 1, 1, 1, 1,
-0.101636, 0.1579777, -0.6664087, 1, 1, 1, 1, 1,
-0.1009367, 1.475447, 0.8564014, 1, 1, 1, 1, 1,
-0.09932021, -1.120536, -2.632451, 1, 1, 1, 1, 1,
-0.09901606, 0.2106427, -0.1464804, 0, 0, 1, 1, 1,
-0.09553405, 0.5622418, 0.8348695, 1, 0, 0, 1, 1,
-0.09145544, -0.4517856, -3.117496, 1, 0, 0, 1, 1,
-0.09021395, 0.0283068, -1.824649, 1, 0, 0, 1, 1,
-0.08823918, 1.45766, -1.074988, 1, 0, 0, 1, 1,
-0.0864497, -0.1064707, -3.213193, 1, 0, 0, 1, 1,
-0.08305167, 1.09157, -0.06180646, 0, 0, 0, 1, 1,
-0.0824183, 0.2550851, -2.582902, 0, 0, 0, 1, 1,
-0.08195766, -0.5025399, -2.66801, 0, 0, 0, 1, 1,
-0.08061846, 2.940665, -0.613487, 0, 0, 0, 1, 1,
-0.07652714, -1.839113, -2.124869, 0, 0, 0, 1, 1,
-0.07227596, -0.8548243, -3.410588, 0, 0, 0, 1, 1,
-0.07129309, -1.967833, -3.265349, 0, 0, 0, 1, 1,
-0.07036877, 0.4123774, -1.658972, 1, 1, 1, 1, 1,
-0.06963406, -0.2323005, -1.895214, 1, 1, 1, 1, 1,
-0.06824806, -0.7737354, -2.816108, 1, 1, 1, 1, 1,
-0.06532723, 1.270656, -1.626899, 1, 1, 1, 1, 1,
-0.06340359, -0.7178589, -3.057875, 1, 1, 1, 1, 1,
-0.06136991, -0.3572939, -4.859772, 1, 1, 1, 1, 1,
-0.05871628, 0.7885599, 0.1645322, 1, 1, 1, 1, 1,
-0.05734003, 1.137487, 0.6794112, 1, 1, 1, 1, 1,
-0.05697756, 0.6511938, 0.318152, 1, 1, 1, 1, 1,
-0.05593334, -1.241254, -2.595898, 1, 1, 1, 1, 1,
-0.05479106, 0.3982008, 0.1168657, 1, 1, 1, 1, 1,
-0.05455088, -0.1101782, -2.773502, 1, 1, 1, 1, 1,
-0.05416032, -0.6096869, -3.802796, 1, 1, 1, 1, 1,
-0.05002451, 0.3656436, -0.2943442, 1, 1, 1, 1, 1,
-0.04640022, -0.01104895, -1.269666, 1, 1, 1, 1, 1,
-0.04493926, -2.406095, -2.035369, 0, 0, 1, 1, 1,
-0.04465281, -1.705959, -4.952744, 1, 0, 0, 1, 1,
-0.03841555, 0.08710539, -0.4549392, 1, 0, 0, 1, 1,
-0.03507878, 0.07791303, -0.1831859, 1, 0, 0, 1, 1,
-0.03455079, 0.1092455, 0.4085529, 1, 0, 0, 1, 1,
-0.03353533, -0.6332963, -4.798038, 1, 0, 0, 1, 1,
-0.03082078, -2.217066, -2.46393, 0, 0, 0, 1, 1,
-0.02763366, 0.2250172, 2.061252, 0, 0, 0, 1, 1,
-0.02501863, 0.8858709, 1.831868, 0, 0, 0, 1, 1,
-0.02316577, -1.260877, -2.310015, 0, 0, 0, 1, 1,
-0.02134852, -1.027067, -4.82333, 0, 0, 0, 1, 1,
-0.02031028, -0.4586541, -4.924042, 0, 0, 0, 1, 1,
-0.01297302, -1.356289, -2.096073, 0, 0, 0, 1, 1,
-0.01272997, -1.532505, -3.304513, 1, 1, 1, 1, 1,
-0.01064714, 1.591205, 0.5927358, 1, 1, 1, 1, 1,
-0.008249948, 0.5995012, -1.18045, 1, 1, 1, 1, 1,
-0.008148371, -0.6007553, -1.837767, 1, 1, 1, 1, 1,
-0.004725409, -0.8207265, -2.768245, 1, 1, 1, 1, 1,
-6.834055e-06, 0.7302858, 0.3033062, 1, 1, 1, 1, 1,
0.001428599, -0.4356894, 2.944814, 1, 1, 1, 1, 1,
0.002254199, -0.4773511, 3.347806, 1, 1, 1, 1, 1,
0.003905575, -0.6136372, 3.120915, 1, 1, 1, 1, 1,
0.006935592, -1.527439, 1.909811, 1, 1, 1, 1, 1,
0.007281548, -0.6960471, 2.229698, 1, 1, 1, 1, 1,
0.007306281, -1.236678, 1.916535, 1, 1, 1, 1, 1,
0.008218839, -0.1222019, 3.686294, 1, 1, 1, 1, 1,
0.008753312, -0.1011278, 3.089633, 1, 1, 1, 1, 1,
0.01060076, 0.5547704, 0.05922602, 1, 1, 1, 1, 1,
0.01145477, -0.6279563, 2.933582, 0, 0, 1, 1, 1,
0.01164832, 2.79178, -0.5435386, 1, 0, 0, 1, 1,
0.01235154, 0.222016, 0.5051163, 1, 0, 0, 1, 1,
0.01265704, -0.1368657, 4.059615, 1, 0, 0, 1, 1,
0.01418949, 2.230959, 0.6572266, 1, 0, 0, 1, 1,
0.01575361, 0.3356835, -0.2073102, 1, 0, 0, 1, 1,
0.01625612, 0.03190648, -0.4701575, 0, 0, 0, 1, 1,
0.02019576, 1.146622, -0.03549335, 0, 0, 0, 1, 1,
0.02053285, 0.9129149, 1.156469, 0, 0, 0, 1, 1,
0.02060632, 1.523167, 0.2238921, 0, 0, 0, 1, 1,
0.02215377, -0.5683299, 1.08146, 0, 0, 0, 1, 1,
0.02585585, -1.297112, 2.31803, 0, 0, 0, 1, 1,
0.0272461, -2.71637, 3.748737, 0, 0, 0, 1, 1,
0.02867237, 0.9247433, -0.1454232, 1, 1, 1, 1, 1,
0.03139054, 0.5901726, 1.786775, 1, 1, 1, 1, 1,
0.03192914, 0.8644369, 0.09591573, 1, 1, 1, 1, 1,
0.03604125, 1.352773, 1.314317, 1, 1, 1, 1, 1,
0.0373981, -0.2014539, 4.242915, 1, 1, 1, 1, 1,
0.03817817, -0.3884686, 1.934389, 1, 1, 1, 1, 1,
0.03867987, 1.228848, -0.4997339, 1, 1, 1, 1, 1,
0.04214945, -0.2465851, 1.154102, 1, 1, 1, 1, 1,
0.04390011, 1.501652, 1.291751, 1, 1, 1, 1, 1,
0.04597833, 1.001153, -1.188644, 1, 1, 1, 1, 1,
0.04658629, 0.1235, 0.6936173, 1, 1, 1, 1, 1,
0.046726, -0.6979787, 3.790776, 1, 1, 1, 1, 1,
0.04915345, -0.06873768, 2.667028, 1, 1, 1, 1, 1,
0.05148668, 0.6240562, 1.342486, 1, 1, 1, 1, 1,
0.05264223, 0.1330656, 1.229082, 1, 1, 1, 1, 1,
0.05280825, 0.5416009, -1.793273, 0, 0, 1, 1, 1,
0.05949232, -0.04899742, 2.65384, 1, 0, 0, 1, 1,
0.0656932, -0.832627, 1.763353, 1, 0, 0, 1, 1,
0.07216658, 1.257301, 0.405536, 1, 0, 0, 1, 1,
0.07254971, 0.4399938, -0.246685, 1, 0, 0, 1, 1,
0.07299781, -0.1772355, 3.086152, 1, 0, 0, 1, 1,
0.07720874, 0.2693426, -0.4722549, 0, 0, 0, 1, 1,
0.08197162, -1.210457, 2.621735, 0, 0, 0, 1, 1,
0.08409206, -1.613065, 2.391891, 0, 0, 0, 1, 1,
0.08846292, -1.095389, 3.234816, 0, 0, 0, 1, 1,
0.09220814, 2.058856, 0.5092789, 0, 0, 0, 1, 1,
0.09257766, 0.4161187, -0.2694832, 0, 0, 0, 1, 1,
0.09455243, 0.1596669, -0.275051, 0, 0, 0, 1, 1,
0.1041452, 2.117361, -0.1388002, 1, 1, 1, 1, 1,
0.1085521, -0.2448894, 2.449043, 1, 1, 1, 1, 1,
0.1165864, -0.800747, 1.722351, 1, 1, 1, 1, 1,
0.1176358, 0.7628058, -1.619137, 1, 1, 1, 1, 1,
0.1195442, 0.2943152, -1.001731, 1, 1, 1, 1, 1,
0.1211892, -0.5719339, 1.841164, 1, 1, 1, 1, 1,
0.1256083, -0.1157623, 1.513032, 1, 1, 1, 1, 1,
0.1287553, 1.417599, -1.094034, 1, 1, 1, 1, 1,
0.1291942, 1.377725, 1.20935, 1, 1, 1, 1, 1,
0.1299456, 0.9502861, -1.253545, 1, 1, 1, 1, 1,
0.1299487, 0.3012386, 0.6684538, 1, 1, 1, 1, 1,
0.1311317, -0.9414222, 0.5491357, 1, 1, 1, 1, 1,
0.132826, -1.83453, 1.548372, 1, 1, 1, 1, 1,
0.1341171, 0.7031237, 0.4435433, 1, 1, 1, 1, 1,
0.1395173, 0.4949357, -0.3679516, 1, 1, 1, 1, 1,
0.1408014, -1.087166, 4.222469, 0, 0, 1, 1, 1,
0.1434109, 0.1192313, 0.3216191, 1, 0, 0, 1, 1,
0.1456109, 0.2558454, 0.1122932, 1, 0, 0, 1, 1,
0.1460323, 1.367421, -0.1442971, 1, 0, 0, 1, 1,
0.1497409, -1.374779, 2.941858, 1, 0, 0, 1, 1,
0.161918, -1.050058, 2.670196, 1, 0, 0, 1, 1,
0.1632038, 0.6548703, -1.47577, 0, 0, 0, 1, 1,
0.16568, 2.440114, 0.4811537, 0, 0, 0, 1, 1,
0.1662761, 0.6398331, 1.140198, 0, 0, 0, 1, 1,
0.1707902, -0.7519099, 4.336309, 0, 0, 0, 1, 1,
0.1761556, -1.849892, 3.357546, 0, 0, 0, 1, 1,
0.1773625, 0.214349, 0.571328, 0, 0, 0, 1, 1,
0.1774366, 0.7494453, -0.6835303, 0, 0, 0, 1, 1,
0.1778759, 0.3241946, -1.352252, 1, 1, 1, 1, 1,
0.183509, -0.4510744, 1.487572, 1, 1, 1, 1, 1,
0.1838283, -1.017463, 4.04814, 1, 1, 1, 1, 1,
0.1841068, 1.113126, 0.5565771, 1, 1, 1, 1, 1,
0.188309, 1.708652, 1.129912, 1, 1, 1, 1, 1,
0.1898992, 0.1573329, 0.2143152, 1, 1, 1, 1, 1,
0.1947006, 0.5903336, 1.303332, 1, 1, 1, 1, 1,
0.2038631, 2.193958, -0.6639166, 1, 1, 1, 1, 1,
0.2055823, 1.77072, 0.3691025, 1, 1, 1, 1, 1,
0.2077019, 0.03755207, 2.525144, 1, 1, 1, 1, 1,
0.2122888, -0.6742089, 2.488439, 1, 1, 1, 1, 1,
0.2171165, -0.5610985, 2.587731, 1, 1, 1, 1, 1,
0.2241537, -1.466155, 4.55232, 1, 1, 1, 1, 1,
0.2248495, -0.4298657, 3.274997, 1, 1, 1, 1, 1,
0.2286031, 1.929965, 0.5910527, 1, 1, 1, 1, 1,
0.2307315, -1.399162, 3.871448, 0, 0, 1, 1, 1,
0.2415216, -1.377049, 1.79434, 1, 0, 0, 1, 1,
0.241859, -0.07680735, 1.583583, 1, 0, 0, 1, 1,
0.245353, -0.4903002, 2.635447, 1, 0, 0, 1, 1,
0.2462664, 0.3329851, 0.1365405, 1, 0, 0, 1, 1,
0.2479045, 0.2497946, 0.6171761, 1, 0, 0, 1, 1,
0.2482244, -0.7929161, 3.962409, 0, 0, 0, 1, 1,
0.249575, -0.5674734, 5.330942, 0, 0, 0, 1, 1,
0.251767, -1.222769, 3.611768, 0, 0, 0, 1, 1,
0.2607239, -1.834131, 4.225306, 0, 0, 0, 1, 1,
0.2626464, -0.6147421, 2.999055, 0, 0, 0, 1, 1,
0.2677611, 1.311111, 0.4073543, 0, 0, 0, 1, 1,
0.2714676, 0.2528003, -0.03306423, 0, 0, 0, 1, 1,
0.2763677, 0.6037374, 0.38745, 1, 1, 1, 1, 1,
0.2783116, 0.3332101, 1.228614, 1, 1, 1, 1, 1,
0.2802736, 0.06148534, -0.1186605, 1, 1, 1, 1, 1,
0.2897741, 1.588691, -1.947137, 1, 1, 1, 1, 1,
0.2899913, -0.9594254, 1.605321, 1, 1, 1, 1, 1,
0.2928485, 1.935831, 0.9917922, 1, 1, 1, 1, 1,
0.2974858, -0.8996186, 3.934229, 1, 1, 1, 1, 1,
0.3026274, 0.5467283, 1.816253, 1, 1, 1, 1, 1,
0.3030299, -0.08494519, 1.963767, 1, 1, 1, 1, 1,
0.3051719, -0.4924475, 2.96579, 1, 1, 1, 1, 1,
0.3093113, 1.560626, 1.227291, 1, 1, 1, 1, 1,
0.3095733, 0.3719442, 1.069804, 1, 1, 1, 1, 1,
0.3124121, -0.05287598, 1.780761, 1, 1, 1, 1, 1,
0.3155571, -2.78039, 3.61147, 1, 1, 1, 1, 1,
0.315561, -0.917401, 1.777922, 1, 1, 1, 1, 1,
0.3158408, 0.178593, 2.436851, 0, 0, 1, 1, 1,
0.3280108, 0.07144658, 1.942855, 1, 0, 0, 1, 1,
0.3281585, 0.02193812, 2.902551, 1, 0, 0, 1, 1,
0.3321953, -0.6446843, 2.179608, 1, 0, 0, 1, 1,
0.3326001, 0.7207856, 0.2095252, 1, 0, 0, 1, 1,
0.3330657, -0.6718002, 1.879261, 1, 0, 0, 1, 1,
0.3360123, -0.4316872, 2.608978, 0, 0, 0, 1, 1,
0.3366278, -0.2050796, 0.8513159, 0, 0, 0, 1, 1,
0.3366543, -0.4857212, 2.37404, 0, 0, 0, 1, 1,
0.3389507, 0.3252304, 1.383577, 0, 0, 0, 1, 1,
0.3397717, 0.6642956, 1.041133, 0, 0, 0, 1, 1,
0.3411589, 0.776693, 0.1349737, 0, 0, 0, 1, 1,
0.3414479, 0.3498865, 1.186874, 0, 0, 0, 1, 1,
0.3424737, -1.352759, 1.852182, 1, 1, 1, 1, 1,
0.3456724, -1.164465, 2.356247, 1, 1, 1, 1, 1,
0.3467091, -1.9448, 0.9701779, 1, 1, 1, 1, 1,
0.3497893, -0.5222954, 2.743596, 1, 1, 1, 1, 1,
0.3515895, 0.4137259, 1.57074, 1, 1, 1, 1, 1,
0.3557246, -0.9400276, 2.115247, 1, 1, 1, 1, 1,
0.3587925, 1.749016, -0.4909196, 1, 1, 1, 1, 1,
0.3671474, 0.6515039, -1.165177, 1, 1, 1, 1, 1,
0.3730832, 0.8444223, -0.687778, 1, 1, 1, 1, 1,
0.375, -0.5421081, 3.016346, 1, 1, 1, 1, 1,
0.3750201, -0.09720375, 3.19926, 1, 1, 1, 1, 1,
0.3760521, 1.416657, 0.529711, 1, 1, 1, 1, 1,
0.3776176, 0.1681378, -0.1481524, 1, 1, 1, 1, 1,
0.379033, 0.5002502, 0.9615804, 1, 1, 1, 1, 1,
0.3794212, -0.1099598, 2.181757, 1, 1, 1, 1, 1,
0.3802152, 1.513976, 1.660653, 0, 0, 1, 1, 1,
0.3808958, 0.8900217, -0.3638714, 1, 0, 0, 1, 1,
0.3828737, -0.06939253, 3.045, 1, 0, 0, 1, 1,
0.383827, -1.421531, 2.283046, 1, 0, 0, 1, 1,
0.3847287, -0.3470832, 3.272817, 1, 0, 0, 1, 1,
0.385367, 0.4864697, 2.544795, 1, 0, 0, 1, 1,
0.3914392, 0.1444156, 0.1789692, 0, 0, 0, 1, 1,
0.3928313, 0.81567, 2.17076, 0, 0, 0, 1, 1,
0.395422, -0.3469855, 2.401082, 0, 0, 0, 1, 1,
0.3965345, -1.534815, 2.769266, 0, 0, 0, 1, 1,
0.3966671, -0.0742489, 2.641597, 0, 0, 0, 1, 1,
0.406788, -0.4899179, 1.559676, 0, 0, 0, 1, 1,
0.4127426, -1.245887, 2.693349, 0, 0, 0, 1, 1,
0.415424, -0.6680964, 3.243898, 1, 1, 1, 1, 1,
0.4175677, -0.4701463, 3.368697, 1, 1, 1, 1, 1,
0.4193313, -1.005087, 3.404447, 1, 1, 1, 1, 1,
0.4254303, -1.081699, 3.103863, 1, 1, 1, 1, 1,
0.4264669, 0.1717503, -0.5219643, 1, 1, 1, 1, 1,
0.4324356, -0.6161085, 2.941466, 1, 1, 1, 1, 1,
0.4329999, -0.2221545, 2.219813, 1, 1, 1, 1, 1,
0.4389055, -0.4437208, 1.08876, 1, 1, 1, 1, 1,
0.4414282, 0.7057754, 1.356581, 1, 1, 1, 1, 1,
0.442535, 0.1812305, 1.283567, 1, 1, 1, 1, 1,
0.4465003, -1.605311, 3.372411, 1, 1, 1, 1, 1,
0.4467685, -0.8433776, 0.8385054, 1, 1, 1, 1, 1,
0.4546356, -0.5904582, 2.942028, 1, 1, 1, 1, 1,
0.4551326, 2.440673, -0.2404413, 1, 1, 1, 1, 1,
0.4592079, -0.5658835, 2.518236, 1, 1, 1, 1, 1,
0.459881, 0.06249821, 1.565326, 0, 0, 1, 1, 1,
0.4664805, 1.367753, -0.4818316, 1, 0, 0, 1, 1,
0.4696444, 0.1895615, 1.259629, 1, 0, 0, 1, 1,
0.4717811, 1.417098, 1.868386, 1, 0, 0, 1, 1,
0.4772236, -0.9529698, 3.626413, 1, 0, 0, 1, 1,
0.482939, -0.7642854, 1.395728, 1, 0, 0, 1, 1,
0.4861632, -0.1847848, 0.2929679, 0, 0, 0, 1, 1,
0.4930205, -1.247879, 1.902936, 0, 0, 0, 1, 1,
0.4932641, -0.1369726, 2.003273, 0, 0, 0, 1, 1,
0.495649, -0.4542284, 2.519064, 0, 0, 0, 1, 1,
0.5024811, 1.769248, 1.553648, 0, 0, 0, 1, 1,
0.504325, -1.392639, 4.444109, 0, 0, 0, 1, 1,
0.5048808, -0.7409985, 2.693276, 0, 0, 0, 1, 1,
0.5056508, 1.060259, 0.5319744, 1, 1, 1, 1, 1,
0.5060731, 0.4480523, 1.683853, 1, 1, 1, 1, 1,
0.5077401, -1.49899, 2.761358, 1, 1, 1, 1, 1,
0.5092816, -0.3427931, 1.540172, 1, 1, 1, 1, 1,
0.5123398, -0.3493907, 4.34496, 1, 1, 1, 1, 1,
0.5128101, -1.249826, 2.400979, 1, 1, 1, 1, 1,
0.5205458, 0.3255696, 2.315495, 1, 1, 1, 1, 1,
0.5211515, 1.367609, -1.687276, 1, 1, 1, 1, 1,
0.5216418, -0.327583, 2.658442, 1, 1, 1, 1, 1,
0.5226353, -1.591354, 3.666157, 1, 1, 1, 1, 1,
0.5284416, 1.172378, 0.4338667, 1, 1, 1, 1, 1,
0.5300441, 0.2225779, -0.2563024, 1, 1, 1, 1, 1,
0.5323246, -1.822194, 3.455913, 1, 1, 1, 1, 1,
0.5378613, -0.824915, 3.271214, 1, 1, 1, 1, 1,
0.5387126, 0.569872, 1.007631, 1, 1, 1, 1, 1,
0.541128, -1.503615, 1.762321, 0, 0, 1, 1, 1,
0.5426813, -0.5172775, 1.36158, 1, 0, 0, 1, 1,
0.5470992, -1.579937, 3.646393, 1, 0, 0, 1, 1,
0.5515819, -0.3570128, 1.484245, 1, 0, 0, 1, 1,
0.5550076, -1.668382, 2.707496, 1, 0, 0, 1, 1,
0.5566282, -0.1411153, 1.503853, 1, 0, 0, 1, 1,
0.5637016, 1.02139, 0.4925658, 0, 0, 0, 1, 1,
0.5644776, -0.3366651, 3.775528, 0, 0, 0, 1, 1,
0.5663257, -0.4699991, 1.674287, 0, 0, 0, 1, 1,
0.5725285, -1.579356, 3.688451, 0, 0, 0, 1, 1,
0.5759063, -1.525252, 2.810714, 0, 0, 0, 1, 1,
0.57669, 0.2458663, -0.05964609, 0, 0, 0, 1, 1,
0.5815603, -1.125491, 4.117395, 0, 0, 0, 1, 1,
0.5865808, -0.1857605, 2.763928, 1, 1, 1, 1, 1,
0.5870501, -0.5455699, 1.238602, 1, 1, 1, 1, 1,
0.5892575, -2.985605, 2.846097, 1, 1, 1, 1, 1,
0.5906762, 0.8574067, 0.5286713, 1, 1, 1, 1, 1,
0.5982046, -0.8724695, 3.791802, 1, 1, 1, 1, 1,
0.6056726, 0.4516653, -0.9736455, 1, 1, 1, 1, 1,
0.6063484, 0.5416967, 2.620776, 1, 1, 1, 1, 1,
0.6064238, 0.856101, -0.8604746, 1, 1, 1, 1, 1,
0.6089985, 1.215034, -1.170079, 1, 1, 1, 1, 1,
0.6175771, 0.6405207, 1.210557, 1, 1, 1, 1, 1,
0.6208493, -0.2051043, 2.778775, 1, 1, 1, 1, 1,
0.6215249, 1.064049, 1.52966, 1, 1, 1, 1, 1,
0.6269986, 1.874146, 1.432, 1, 1, 1, 1, 1,
0.6290293, 2.106683, -0.09314886, 1, 1, 1, 1, 1,
0.6332725, -0.6920782, 0.7077753, 1, 1, 1, 1, 1,
0.6369905, -0.1320374, 3.924554, 0, 0, 1, 1, 1,
0.6387151, 0.4307408, 0.1741904, 1, 0, 0, 1, 1,
0.6394938, 1.486576, -0.0323008, 1, 0, 0, 1, 1,
0.6410421, 0.6493199, 0.2708573, 1, 0, 0, 1, 1,
0.643379, 1.450271, 1.457105, 1, 0, 0, 1, 1,
0.6433816, -0.7567354, 3.052105, 1, 0, 0, 1, 1,
0.6438486, -0.65288, 2.079103, 0, 0, 0, 1, 1,
0.6518926, -1.821407, 4.307151, 0, 0, 0, 1, 1,
0.6598439, 0.001291829, 2.329651, 0, 0, 0, 1, 1,
0.6599809, -1.117567, 2.973239, 0, 0, 0, 1, 1,
0.6657493, 0.1596258, 2.94688, 0, 0, 0, 1, 1,
0.6662871, -0.4441235, 1.641587, 0, 0, 0, 1, 1,
0.6675564, 0.6495882, 2.108839, 0, 0, 0, 1, 1,
0.6679913, 0.4683987, 1.372723, 1, 1, 1, 1, 1,
0.6689798, 0.5876241, -0.02205743, 1, 1, 1, 1, 1,
0.6723208, -1.142455, 2.417274, 1, 1, 1, 1, 1,
0.6729494, -0.463887, 2.688257, 1, 1, 1, 1, 1,
0.6730721, 1.644994, 1.041315, 1, 1, 1, 1, 1,
0.6744352, 0.4524142, 0.63028, 1, 1, 1, 1, 1,
0.6843475, 2.672228, -1.144866, 1, 1, 1, 1, 1,
0.6890228, 1.218601, 0.8422663, 1, 1, 1, 1, 1,
0.691039, 1.694881, 0.2555912, 1, 1, 1, 1, 1,
0.6913177, -0.7710253, 3.520133, 1, 1, 1, 1, 1,
0.6980922, -1.12054, 2.730667, 1, 1, 1, 1, 1,
0.7005439, 0.5728461, -0.6810365, 1, 1, 1, 1, 1,
0.7008768, 1.216816, 1.71494, 1, 1, 1, 1, 1,
0.7108817, -0.2965751, 1.506478, 1, 1, 1, 1, 1,
0.7119103, -0.7059925, 0.6852987, 1, 1, 1, 1, 1,
0.7134702, 0.2180347, 0.7162634, 0, 0, 1, 1, 1,
0.7175035, 0.6768087, 2.220169, 1, 0, 0, 1, 1,
0.7228931, -0.204332, 1.440024, 1, 0, 0, 1, 1,
0.7344075, 0.2399866, 1.161675, 1, 0, 0, 1, 1,
0.7433987, 1.155174, 1.222182, 1, 0, 0, 1, 1,
0.7440677, -0.08004919, 2.171736, 1, 0, 0, 1, 1,
0.7450351, 2.158634, 0.06930305, 0, 0, 0, 1, 1,
0.74554, 0.8511686, 1.578857, 0, 0, 0, 1, 1,
0.747733, 0.5221069, -0.3000815, 0, 0, 0, 1, 1,
0.7488639, 0.03126998, 0.3407756, 0, 0, 0, 1, 1,
0.7538344, -0.4268511, 0.2210642, 0, 0, 0, 1, 1,
0.7575515, 0.04412993, 2.682357, 0, 0, 0, 1, 1,
0.7584915, -0.4305292, 2.163569, 0, 0, 0, 1, 1,
0.76275, -0.423307, 2.171645, 1, 1, 1, 1, 1,
0.7631055, 0.3576106, 0.8144245, 1, 1, 1, 1, 1,
0.7697754, 0.7037364, 0.4329545, 1, 1, 1, 1, 1,
0.7742966, 0.6438062, 1.076076, 1, 1, 1, 1, 1,
0.7813592, -0.3052642, 1.209186, 1, 1, 1, 1, 1,
0.783931, 1.180332, 1.206409, 1, 1, 1, 1, 1,
0.7891347, 0.3431547, 1.562605, 1, 1, 1, 1, 1,
0.7898949, 0.2061403, 2.377358, 1, 1, 1, 1, 1,
0.7947199, -0.466125, 4.097231, 1, 1, 1, 1, 1,
0.7984788, 0.3689086, 1.88702, 1, 1, 1, 1, 1,
0.8006725, 0.2789843, 1.541219, 1, 1, 1, 1, 1,
0.8028774, -0.8700728, 3.115987, 1, 1, 1, 1, 1,
0.8070709, 1.613944, 0.7226483, 1, 1, 1, 1, 1,
0.8093217, 0.003107901, 0.1178618, 1, 1, 1, 1, 1,
0.8100221, -1.352824, 2.435597, 1, 1, 1, 1, 1,
0.8112591, 0.9761023, 1.351055, 0, 0, 1, 1, 1,
0.8148082, 0.3745925, 3.336323, 1, 0, 0, 1, 1,
0.8149064, -0.1640932, 0.8164954, 1, 0, 0, 1, 1,
0.8176444, -0.7743099, 1.200388, 1, 0, 0, 1, 1,
0.8212407, 0.23667, 2.831137, 1, 0, 0, 1, 1,
0.8220767, -1.457625, 2.78395, 1, 0, 0, 1, 1,
0.8247776, -1.279571, 2.39755, 0, 0, 0, 1, 1,
0.8319439, -0.3947871, 2.51419, 0, 0, 0, 1, 1,
0.8359824, 0.1188712, 1.061032, 0, 0, 0, 1, 1,
0.8364102, 1.325743, 1.420844, 0, 0, 0, 1, 1,
0.837813, 0.2793014, -0.1084092, 0, 0, 0, 1, 1,
0.8381139, -1.454954, 1.737369, 0, 0, 0, 1, 1,
0.8508995, 0.4665435, 2.353989, 0, 0, 0, 1, 1,
0.856098, 0.1126497, -0.3301929, 1, 1, 1, 1, 1,
0.8561198, -0.1144344, 1.222584, 1, 1, 1, 1, 1,
0.8600047, 0.9714271, 0.7697884, 1, 1, 1, 1, 1,
0.8611771, -0.9037372, 2.118894, 1, 1, 1, 1, 1,
0.8620445, -0.3348737, 1.020459, 1, 1, 1, 1, 1,
0.8647445, -1.085804, 2.351164, 1, 1, 1, 1, 1,
0.8665502, -0.4782019, 1.647594, 1, 1, 1, 1, 1,
0.8713329, -1.549105, 2.699812, 1, 1, 1, 1, 1,
0.8718597, 0.7921315, 0.9181875, 1, 1, 1, 1, 1,
0.8773604, -0.5399436, 2.745718, 1, 1, 1, 1, 1,
0.8794391, 0.7212915, 2.131901, 1, 1, 1, 1, 1,
0.8880544, 0.01471256, -0.532721, 1, 1, 1, 1, 1,
0.8913054, 2.741621, 0.5288615, 1, 1, 1, 1, 1,
0.8963068, 1.186237, 0.6628158, 1, 1, 1, 1, 1,
0.8983297, -0.1663931, 2.539214, 1, 1, 1, 1, 1,
0.8984617, 1.717773, 0.7665105, 0, 0, 1, 1, 1,
0.9007874, 1.676201, 1.442919, 1, 0, 0, 1, 1,
0.9010798, 1.041788, 0.4366436, 1, 0, 0, 1, 1,
0.9017914, 0.3837549, 0.7110646, 1, 0, 0, 1, 1,
0.9037573, 0.7881675, 0.4581243, 1, 0, 0, 1, 1,
0.9047363, 0.3621858, 1.711664, 1, 0, 0, 1, 1,
0.9059747, 0.8708475, 2.634717, 0, 0, 0, 1, 1,
0.90636, 0.9655402, 1.326531, 0, 0, 0, 1, 1,
0.9078608, -0.4428403, 3.40658, 0, 0, 0, 1, 1,
0.9117529, 0.4448879, -0.2194768, 0, 0, 0, 1, 1,
0.9139519, -0.3611737, 1.042773, 0, 0, 0, 1, 1,
0.9156315, 1.154041, -1.605542, 0, 0, 0, 1, 1,
0.9214197, 0.2013273, 1.478826, 0, 0, 0, 1, 1,
0.9247476, -0.7169967, 1.556254, 1, 1, 1, 1, 1,
0.9306399, 1.013785, 1.578518, 1, 1, 1, 1, 1,
0.9365596, 1.784932, 0.08017982, 1, 1, 1, 1, 1,
0.9448552, 0.6853837, 1.649034, 1, 1, 1, 1, 1,
0.9460357, -2.693017, 1.859425, 1, 1, 1, 1, 1,
0.9598739, -0.005277833, 1.75953, 1, 1, 1, 1, 1,
0.9620727, 0.8235949, 0.4449142, 1, 1, 1, 1, 1,
0.9698476, -0.1794131, 1.846184, 1, 1, 1, 1, 1,
0.9707105, -0.06360786, 0.7501417, 1, 1, 1, 1, 1,
0.9713952, 0.365826, -0.3144905, 1, 1, 1, 1, 1,
0.9727052, -0.6623257, 3.755411, 1, 1, 1, 1, 1,
0.9727425, -0.4573335, 1.998094, 1, 1, 1, 1, 1,
0.9771299, 0.09550466, 1.219757, 1, 1, 1, 1, 1,
0.9782954, 0.3308516, 1.133718, 1, 1, 1, 1, 1,
0.9791295, -0.5580569, 2.352155, 1, 1, 1, 1, 1,
0.984507, 1.602209, 1.319607, 0, 0, 1, 1, 1,
0.985082, -1.679288, 2.981379, 1, 0, 0, 1, 1,
0.9891257, -0.3036675, 2.767055, 1, 0, 0, 1, 1,
0.9931191, -2.469061, 4.053725, 1, 0, 0, 1, 1,
0.994105, 1.25875, 2.117211, 1, 0, 0, 1, 1,
1.00348, 1.778817, 1.41108, 1, 0, 0, 1, 1,
1.003532, 0.3887649, 0.7965358, 0, 0, 0, 1, 1,
1.016886, 2.060522, 1.602491, 0, 0, 0, 1, 1,
1.021281, 2.04302, 1.084905, 0, 0, 0, 1, 1,
1.02777, 1.175726, 0.4762263, 0, 0, 0, 1, 1,
1.029771, 1.385622, 3.332126, 0, 0, 0, 1, 1,
1.030896, 0.3395147, -1.106901, 0, 0, 0, 1, 1,
1.032045, 0.9452171, -0.8664066, 0, 0, 0, 1, 1,
1.032687, 0.5702142, 2.751635, 1, 1, 1, 1, 1,
1.039158, 0.6758511, 1.312423, 1, 1, 1, 1, 1,
1.040577, 0.6795171, 1.94161, 1, 1, 1, 1, 1,
1.044058, -0.6564016, 2.251881, 1, 1, 1, 1, 1,
1.04563, 1.724152, 1.09799, 1, 1, 1, 1, 1,
1.051345, 0.1188785, 0.2705188, 1, 1, 1, 1, 1,
1.063083, 0.8299553, 1.384586, 1, 1, 1, 1, 1,
1.068717, -0.3295024, 3.132965, 1, 1, 1, 1, 1,
1.068779, -1.326201, 0.4321086, 1, 1, 1, 1, 1,
1.078853, -1.221621, 0.9678566, 1, 1, 1, 1, 1,
1.082518, -0.2920623, 2.345967, 1, 1, 1, 1, 1,
1.082683, -1.113381, 2.411262, 1, 1, 1, 1, 1,
1.087361, -1.383584, 1.382959, 1, 1, 1, 1, 1,
1.089186, 0.3083247, 0.2501082, 1, 1, 1, 1, 1,
1.097055, -1.528524, 2.233164, 1, 1, 1, 1, 1,
1.0971, 0.798411, 0.9575419, 0, 0, 1, 1, 1,
1.098506, -0.3060699, 4.017566, 1, 0, 0, 1, 1,
1.098716, 0.1674493, 1.263548, 1, 0, 0, 1, 1,
1.100816, 0.1042213, 1.763764, 1, 0, 0, 1, 1,
1.108168, -1.140203, 3.197543, 1, 0, 0, 1, 1,
1.113279, 0.5926315, 1.811068, 1, 0, 0, 1, 1,
1.113416, -0.2485868, 2.307163, 0, 0, 0, 1, 1,
1.125363, 0.6960059, 2.158115, 0, 0, 0, 1, 1,
1.126356, 2.026397, 0.8128226, 0, 0, 0, 1, 1,
1.145375, -0.7571925, 1.297262, 0, 0, 0, 1, 1,
1.159294, -0.1752115, 2.546639, 0, 0, 0, 1, 1,
1.1683, -0.4143099, 2.172604, 0, 0, 0, 1, 1,
1.17401, 1.17978, 1.317674, 0, 0, 0, 1, 1,
1.190382, -1.329736, 2.228755, 1, 1, 1, 1, 1,
1.191185, 0.01768223, 1.039405, 1, 1, 1, 1, 1,
1.202021, 0.4447118, -0.2656525, 1, 1, 1, 1, 1,
1.212337, -0.041644, 1.54115, 1, 1, 1, 1, 1,
1.213254, -0.5263686, 1.530074, 1, 1, 1, 1, 1,
1.21805, -0.2312482, 3.005993, 1, 1, 1, 1, 1,
1.222482, 0.9394246, -0.158362, 1, 1, 1, 1, 1,
1.23224, -0.6292545, 2.825264, 1, 1, 1, 1, 1,
1.232956, 0.1257661, 1.4189, 1, 1, 1, 1, 1,
1.233338, 1.719473, -0.1011768, 1, 1, 1, 1, 1,
1.243679, -2.286744, 0.7604189, 1, 1, 1, 1, 1,
1.251441, -0.662823, 1.345556, 1, 1, 1, 1, 1,
1.259916, 0.8601637, -0.3037909, 1, 1, 1, 1, 1,
1.261717, -0.2945909, 2.176473, 1, 1, 1, 1, 1,
1.264284, 0.7836365, 1.037436, 1, 1, 1, 1, 1,
1.266254, 1.253072, -1.265566, 0, 0, 1, 1, 1,
1.270786, 1.002986, 1.206588, 1, 0, 0, 1, 1,
1.279099, -2.34074, 0.9017152, 1, 0, 0, 1, 1,
1.284441, 0.6807784, -0.1076955, 1, 0, 0, 1, 1,
1.29094, 1.421854, 0.6254859, 1, 0, 0, 1, 1,
1.297253, -0.6661078, 0.5317839, 1, 0, 0, 1, 1,
1.303638, -0.557581, 2.346015, 0, 0, 0, 1, 1,
1.30436, -0.4438541, 1.192043, 0, 0, 0, 1, 1,
1.305507, 0.9496106, -0.826043, 0, 0, 0, 1, 1,
1.306685, 0.04915944, 2.680336, 0, 0, 0, 1, 1,
1.310472, -0.395406, 1.099363, 0, 0, 0, 1, 1,
1.341385, -0.8092141, 1.405376, 0, 0, 0, 1, 1,
1.344345, -0.1362653, -0.1846712, 0, 0, 0, 1, 1,
1.345439, 1.563401, -0.1430415, 1, 1, 1, 1, 1,
1.35437, -0.7777945, 1.73634, 1, 1, 1, 1, 1,
1.359198, -0.5425742, 2.374373, 1, 1, 1, 1, 1,
1.36602, -1.508667, 2.576457, 1, 1, 1, 1, 1,
1.372477, 0.9006921, -0.4396579, 1, 1, 1, 1, 1,
1.378077, -0.364718, 0.664658, 1, 1, 1, 1, 1,
1.384474, -0.4157223, 1.913907, 1, 1, 1, 1, 1,
1.392229, 0.09180802, 1.024666, 1, 1, 1, 1, 1,
1.403541, -1.521098, 3.034, 1, 1, 1, 1, 1,
1.409378, -0.4377598, 2.67684, 1, 1, 1, 1, 1,
1.419345, -0.1832025, 1.310811, 1, 1, 1, 1, 1,
1.425004, -0.2253525, 2.968972, 1, 1, 1, 1, 1,
1.426112, -0.6871375, 0.6932003, 1, 1, 1, 1, 1,
1.4363, 0.5099967, 1.18373, 1, 1, 1, 1, 1,
1.445058, -1.163805, 5.045853, 1, 1, 1, 1, 1,
1.445871, 0.5670589, 0.06743024, 0, 0, 1, 1, 1,
1.447205, 1.555892, 0.06956092, 1, 0, 0, 1, 1,
1.453244, 0.3605557, 1.161666, 1, 0, 0, 1, 1,
1.455386, -2.0726, 4.79246, 1, 0, 0, 1, 1,
1.459282, -0.8096641, 0.953687, 1, 0, 0, 1, 1,
1.467861, 0.432747, 3.31541, 1, 0, 0, 1, 1,
1.480906, -0.1334027, 2.930764, 0, 0, 0, 1, 1,
1.498346, 0.08748844, 1.678758, 0, 0, 0, 1, 1,
1.50683, -2.571083, 3.336066, 0, 0, 0, 1, 1,
1.507116, -1.019866, 3.648197, 0, 0, 0, 1, 1,
1.538309, 0.58563, -0.202458, 0, 0, 0, 1, 1,
1.539139, 1.37089, 0.6019387, 0, 0, 0, 1, 1,
1.546845, -0.2683171, 1.032301, 0, 0, 0, 1, 1,
1.554345, -0.08702553, 1.080994, 1, 1, 1, 1, 1,
1.568678, -0.8964047, 2.566213, 1, 1, 1, 1, 1,
1.575195, -1.544471, 2.530681, 1, 1, 1, 1, 1,
1.583432, -0.3649202, 0.9071974, 1, 1, 1, 1, 1,
1.586702, 1.254165, 1.836926, 1, 1, 1, 1, 1,
1.588389, 1.099972, 1.048778, 1, 1, 1, 1, 1,
1.601601, 0.4118098, 1.218882, 1, 1, 1, 1, 1,
1.612567, -0.876544, 0.5798033, 1, 1, 1, 1, 1,
1.615547, 0.3923259, 2.001122, 1, 1, 1, 1, 1,
1.62324, 1.553965, 1.163698, 1, 1, 1, 1, 1,
1.626943, -0.4525883, 0.6967748, 1, 1, 1, 1, 1,
1.628915, 0.6046898, 0.8890384, 1, 1, 1, 1, 1,
1.633128, 1.820826, 0.8715263, 1, 1, 1, 1, 1,
1.640117, -0.686562, 2.757607, 1, 1, 1, 1, 1,
1.661916, 0.8118747, 0.8135419, 1, 1, 1, 1, 1,
1.666553, -1.412092, 0.7579314, 0, 0, 1, 1, 1,
1.677791, -0.3789173, 1.149871, 1, 0, 0, 1, 1,
1.683838, 0.9806025, 0.3830422, 1, 0, 0, 1, 1,
1.720276, -0.7806742, 2.702428, 1, 0, 0, 1, 1,
1.720765, -0.7723628, 3.055402, 1, 0, 0, 1, 1,
1.722995, 1.182745, -0.09838945, 1, 0, 0, 1, 1,
1.727636, 0.07090295, 0.7145935, 0, 0, 0, 1, 1,
1.736072, -1.278731, 2.559079, 0, 0, 0, 1, 1,
1.740104, -0.4209914, 2.914681, 0, 0, 0, 1, 1,
1.742817, -1.217729, 1.667699, 0, 0, 0, 1, 1,
1.750111, 0.2145571, 2.12986, 0, 0, 0, 1, 1,
1.770529, 0.5648626, 1.163911, 0, 0, 0, 1, 1,
1.773604, -0.6204916, 2.207242, 0, 0, 0, 1, 1,
1.781668, 0.2844862, 1.491262, 1, 1, 1, 1, 1,
1.791944, -0.8220743, 2.569055, 1, 1, 1, 1, 1,
1.809252, 1.226163, 1.697512, 1, 1, 1, 1, 1,
1.811659, -0.2312774, 2.295405, 1, 1, 1, 1, 1,
1.811719, -0.7774557, 1.925189, 1, 1, 1, 1, 1,
1.814843, 0.5349858, -0.8390455, 1, 1, 1, 1, 1,
1.825393, -0.507035, 3.061351, 1, 1, 1, 1, 1,
1.8273, 0.6464769, 0.354197, 1, 1, 1, 1, 1,
1.850339, -0.0913142, 0.4506923, 1, 1, 1, 1, 1,
1.864828, -1.845897, 3.572793, 1, 1, 1, 1, 1,
1.872824, 0.3531285, 1.753902, 1, 1, 1, 1, 1,
1.907707, -0.3010749, 0.6435465, 1, 1, 1, 1, 1,
1.99536, 0.9131275, 0.2837434, 1, 1, 1, 1, 1,
2.020241, -0.02797777, 2.808014, 1, 1, 1, 1, 1,
2.026883, 1.561008, 1.355278, 1, 1, 1, 1, 1,
2.038496, 0.1367586, 2.527189, 0, 0, 1, 1, 1,
2.159406, 0.01754425, 1.776582, 1, 0, 0, 1, 1,
2.187074, -1.897621, 2.021052, 1, 0, 0, 1, 1,
2.222696, -0.4776821, 2.887199, 1, 0, 0, 1, 1,
2.231198, -0.3854144, 3.684083, 1, 0, 0, 1, 1,
2.25362, 1.78505, 0.6871195, 1, 0, 0, 1, 1,
2.367336, -0.2782684, -0.6489733, 0, 0, 0, 1, 1,
2.392349, -0.6277467, 1.129526, 0, 0, 0, 1, 1,
2.400672, 0.8089395, 2.385127, 0, 0, 0, 1, 1,
2.412153, -1.659589, -0.8731921, 0, 0, 0, 1, 1,
2.450454, -1.251528, 3.236819, 0, 0, 0, 1, 1,
2.499052, 0.7772146, 2.11142, 0, 0, 0, 1, 1,
2.511958, 0.5741571, -0.4367392, 0, 0, 0, 1, 1,
2.585056, -1.358976, 1.766229, 1, 1, 1, 1, 1,
2.707538, -0.2333733, 2.758382, 1, 1, 1, 1, 1,
2.755214, -0.03821428, 1.930554, 1, 1, 1, 1, 1,
2.836194, 0.7568667, 2.430911, 1, 1, 1, 1, 1,
2.8849, -1.771116, 1.938524, 1, 1, 1, 1, 1,
2.931822, -0.6242515, 1.64158, 1, 1, 1, 1, 1,
3.318106, -0.4413273, 1.988595, 1, 1, 1, 1, 1
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
var radius = 9.172253;
var distance = 32.21715;
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
mvMatrix.translate( -0.3055695, 0.02247, -0.1890988 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.21715);
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
