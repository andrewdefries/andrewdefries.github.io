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
-2.941486, -0.3721904, -4.147739, 1, 0, 0, 1,
-2.820733, -0.1493638, -1.844848, 1, 0.007843138, 0, 1,
-2.76135, -1.029166, -1.344839, 1, 0.01176471, 0, 1,
-2.688572, -0.7945604, -1.925815, 1, 0.01960784, 0, 1,
-2.533183, -0.6978578, -2.651866, 1, 0.02352941, 0, 1,
-2.529505, -1.57149, 0.1351452, 1, 0.03137255, 0, 1,
-2.474121, 0.3083949, -1.723827, 1, 0.03529412, 0, 1,
-2.424154, -0.2180876, -1.878672, 1, 0.04313726, 0, 1,
-2.39133, -0.4360837, -3.216006, 1, 0.04705882, 0, 1,
-2.235701, -0.1504544, -0.5738271, 1, 0.05490196, 0, 1,
-2.214057, 0.006055925, 0.6568895, 1, 0.05882353, 0, 1,
-2.212918, -0.7364587, -0.3315545, 1, 0.06666667, 0, 1,
-2.175138, 0.007050413, -0.2452164, 1, 0.07058824, 0, 1,
-2.14658, 0.3988302, -0.794656, 1, 0.07843138, 0, 1,
-2.086493, -0.7334248, -1.516491, 1, 0.08235294, 0, 1,
-2.027877, 0.6009147, -2.076574, 1, 0.09019608, 0, 1,
-2.003241, 0.62103, -1.879242, 1, 0.09411765, 0, 1,
-2.002923, 0.2121321, -2.202919, 1, 0.1019608, 0, 1,
-1.999659, -0.5582678, -0.3181801, 1, 0.1098039, 0, 1,
-1.976793, -0.3858447, -2.69816, 1, 0.1137255, 0, 1,
-1.966388, 0.2342495, -2.708484, 1, 0.1215686, 0, 1,
-1.965398, -1.58409, -2.018996, 1, 0.1254902, 0, 1,
-1.960883, -0.1602624, -1.836495, 1, 0.1333333, 0, 1,
-1.925521, -0.931106, -2.833424, 1, 0.1372549, 0, 1,
-1.916209, -0.5768419, -0.07157618, 1, 0.145098, 0, 1,
-1.909357, -0.8224201, -3.713347, 1, 0.1490196, 0, 1,
-1.8954, -1.677606, -1.690182, 1, 0.1568628, 0, 1,
-1.881464, 0.298749, -1.230885, 1, 0.1607843, 0, 1,
-1.879397, 0.9798761, -0.8214936, 1, 0.1686275, 0, 1,
-1.854667, -0.2846241, -1.660849, 1, 0.172549, 0, 1,
-1.840429, -0.9901236, -0.4071356, 1, 0.1803922, 0, 1,
-1.796761, 2.203419, -0.3221175, 1, 0.1843137, 0, 1,
-1.775027, 0.1473562, -0.5959921, 1, 0.1921569, 0, 1,
-1.767629, -1.010204, -3.130774, 1, 0.1960784, 0, 1,
-1.755919, 0.2997443, -2.245207, 1, 0.2039216, 0, 1,
-1.752064, -0.5709694, -2.712168, 1, 0.2117647, 0, 1,
-1.750713, 1.082352, -0.8383968, 1, 0.2156863, 0, 1,
-1.73522, 0.1715933, -0.5092837, 1, 0.2235294, 0, 1,
-1.73152, 0.21009, 0.432534, 1, 0.227451, 0, 1,
-1.729332, -4.092458, -2.631101, 1, 0.2352941, 0, 1,
-1.715724, -1.884282, -2.488849, 1, 0.2392157, 0, 1,
-1.703533, 2.058692, -0.5018082, 1, 0.2470588, 0, 1,
-1.668825, -1.070817, -0.5017778, 1, 0.2509804, 0, 1,
-1.668159, 0.0450115, -1.502838, 1, 0.2588235, 0, 1,
-1.650832, 0.02596896, -1.831279, 1, 0.2627451, 0, 1,
-1.640888, 0.9621061, -1.277144, 1, 0.2705882, 0, 1,
-1.627485, 0.4787425, -1.356308, 1, 0.2745098, 0, 1,
-1.627127, 0.2589351, -1.512305, 1, 0.282353, 0, 1,
-1.62383, -0.2492775, -1.491807, 1, 0.2862745, 0, 1,
-1.599037, 0.7481428, -2.505468, 1, 0.2941177, 0, 1,
-1.584232, 0.2993979, -2.195308, 1, 0.3019608, 0, 1,
-1.564245, -0.1130585, -1.936011, 1, 0.3058824, 0, 1,
-1.550538, -0.8691986, -0.5296673, 1, 0.3137255, 0, 1,
-1.529487, 1.165176, -0.8000309, 1, 0.3176471, 0, 1,
-1.524083, -0.7274047, -1.339275, 1, 0.3254902, 0, 1,
-1.522978, 0.882546, -2.11668, 1, 0.3294118, 0, 1,
-1.518396, 0.6653995, 0.07425611, 1, 0.3372549, 0, 1,
-1.510446, 0.7371572, -1.088937, 1, 0.3411765, 0, 1,
-1.4993, -0.3729778, -1.061431, 1, 0.3490196, 0, 1,
-1.497279, -1.743263, -2.139935, 1, 0.3529412, 0, 1,
-1.487476, 1.421726, 0.2499939, 1, 0.3607843, 0, 1,
-1.474241, 1.435312, -1.398603, 1, 0.3647059, 0, 1,
-1.472391, 1.218358, -2.727766, 1, 0.372549, 0, 1,
-1.471842, 0.1028632, -2.188105, 1, 0.3764706, 0, 1,
-1.460182, 0.4471301, -2.198771, 1, 0.3843137, 0, 1,
-1.456282, -0.01997524, -0.284671, 1, 0.3882353, 0, 1,
-1.446105, 0.8378443, -3.918385, 1, 0.3960784, 0, 1,
-1.44504, -0.4375491, -4.440267, 1, 0.4039216, 0, 1,
-1.430039, -0.30977, -1.921558, 1, 0.4078431, 0, 1,
-1.423866, 0.5147437, -0.6064547, 1, 0.4156863, 0, 1,
-1.410223, -0.6795699, -2.106533, 1, 0.4196078, 0, 1,
-1.405614, 1.236966, -2.07196, 1, 0.427451, 0, 1,
-1.395207, 0.4942762, 0.7716382, 1, 0.4313726, 0, 1,
-1.393872, 0.8644605, -1.247339, 1, 0.4392157, 0, 1,
-1.389666, 0.9327284, 0.3929272, 1, 0.4431373, 0, 1,
-1.372811, -1.697542, -3.2116, 1, 0.4509804, 0, 1,
-1.356578, 0.7336118, -2.112517, 1, 0.454902, 0, 1,
-1.347774, 1.244816, -1.886614, 1, 0.4627451, 0, 1,
-1.340466, 0.136373, -0.1568718, 1, 0.4666667, 0, 1,
-1.33035, 1.085122, -2.038151, 1, 0.4745098, 0, 1,
-1.328717, -1.095982, -1.904864, 1, 0.4784314, 0, 1,
-1.321396, -0.7982066, -3.64472, 1, 0.4862745, 0, 1,
-1.319612, -0.8831226, -2.209735, 1, 0.4901961, 0, 1,
-1.311538, -1.358632, -2.915909, 1, 0.4980392, 0, 1,
-1.310854, -1.386864, -2.235569, 1, 0.5058824, 0, 1,
-1.306024, -1.769118, -2.424237, 1, 0.509804, 0, 1,
-1.29192, 0.4616363, -0.09466984, 1, 0.5176471, 0, 1,
-1.289296, 1.082293, 0.2342598, 1, 0.5215687, 0, 1,
-1.288696, 1.671957, -0.213595, 1, 0.5294118, 0, 1,
-1.288272, -0.9410103, -1.340701, 1, 0.5333334, 0, 1,
-1.275732, 0.16465, -2.641433, 1, 0.5411765, 0, 1,
-1.274962, 1.374058, 1.434645, 1, 0.5450981, 0, 1,
-1.274064, -0.03410555, -2.74827, 1, 0.5529412, 0, 1,
-1.268613, -1.293746, -3.045692, 1, 0.5568628, 0, 1,
-1.264846, 2.615217, -2.537629, 1, 0.5647059, 0, 1,
-1.251997, 0.6452073, -0.2377236, 1, 0.5686275, 0, 1,
-1.241581, 0.1424928, -2.611709, 1, 0.5764706, 0, 1,
-1.235589, 0.9846101, -0.943249, 1, 0.5803922, 0, 1,
-1.208862, 1.119857, -1.437481, 1, 0.5882353, 0, 1,
-1.207793, -0.06087922, 0.3796118, 1, 0.5921569, 0, 1,
-1.197769, 0.6893789, -0.09094918, 1, 0.6, 0, 1,
-1.196666, -1.381796, -2.656167, 1, 0.6078432, 0, 1,
-1.195435, -1.215449, -1.626629, 1, 0.6117647, 0, 1,
-1.194708, 2.520297, -0.7068364, 1, 0.6196079, 0, 1,
-1.179348, 1.222461, -1.738869, 1, 0.6235294, 0, 1,
-1.179137, 0.9822056, -1.320979, 1, 0.6313726, 0, 1,
-1.170786, 1.459952, -1.542546, 1, 0.6352941, 0, 1,
-1.170684, 0.480542, -2.465451, 1, 0.6431373, 0, 1,
-1.16284, -0.8100876, -0.5458907, 1, 0.6470588, 0, 1,
-1.14711, -0.3404167, -4.173717, 1, 0.654902, 0, 1,
-1.142131, -1.415591, -1.364146, 1, 0.6588235, 0, 1,
-1.138525, 1.111008, -0.5489137, 1, 0.6666667, 0, 1,
-1.129526, -0.4742485, -2.138585, 1, 0.6705883, 0, 1,
-1.122689, -0.03254981, -1.946729, 1, 0.6784314, 0, 1,
-1.113289, 0.1145297, -0.6327134, 1, 0.682353, 0, 1,
-1.101375, -0.5002574, -3.810165, 1, 0.6901961, 0, 1,
-1.097528, -0.3294039, -3.018101, 1, 0.6941177, 0, 1,
-1.097515, 0.005225574, -3.065046, 1, 0.7019608, 0, 1,
-1.087017, 0.3611625, -2.105329, 1, 0.7098039, 0, 1,
-1.076812, -2.398469, -3.623847, 1, 0.7137255, 0, 1,
-1.073599, -0.1379738, -2.134541, 1, 0.7215686, 0, 1,
-1.072569, 1.532062, -1.827424, 1, 0.7254902, 0, 1,
-1.071559, 0.696932, -1.217103, 1, 0.7333333, 0, 1,
-1.059898, -0.1896686, -1.89247, 1, 0.7372549, 0, 1,
-1.050238, 0.05468429, -1.460202, 1, 0.7450981, 0, 1,
-1.047451, -0.6306182, -2.554679, 1, 0.7490196, 0, 1,
-1.046165, 0.6400754, 1.077959, 1, 0.7568628, 0, 1,
-1.032416, 1.20575, -1.5084, 1, 0.7607843, 0, 1,
-1.024823, -0.344531, -1.839621, 1, 0.7686275, 0, 1,
-1.022288, -1.319549, -2.073994, 1, 0.772549, 0, 1,
-1.022173, 0.3218895, -0.9374548, 1, 0.7803922, 0, 1,
-1.021497, 0.6149068, -2.218281, 1, 0.7843137, 0, 1,
-1.020622, -1.310842, -2.453014, 1, 0.7921569, 0, 1,
-1.016, -1.632629, -2.92924, 1, 0.7960784, 0, 1,
-1.0117, -0.482679, -1.333663, 1, 0.8039216, 0, 1,
-0.9945124, -0.7192135, -2.082611, 1, 0.8117647, 0, 1,
-0.9932308, 1.226877, -0.4005987, 1, 0.8156863, 0, 1,
-0.9882556, -0.8626984, -1.980464, 1, 0.8235294, 0, 1,
-0.9804513, 0.4448341, -0.7252653, 1, 0.827451, 0, 1,
-0.9587708, 0.3104187, 0.1966126, 1, 0.8352941, 0, 1,
-0.9567986, -1.377515, -3.309581, 1, 0.8392157, 0, 1,
-0.9557027, 0.3495986, 0.02915398, 1, 0.8470588, 0, 1,
-0.9535807, -0.0497616, -3.185254, 1, 0.8509804, 0, 1,
-0.953449, 0.5118573, -2.612652, 1, 0.8588235, 0, 1,
-0.9533851, -0.4095219, -2.71591, 1, 0.8627451, 0, 1,
-0.9527524, 0.2783446, -0.02026925, 1, 0.8705882, 0, 1,
-0.9514937, 0.8062464, -2.20598, 1, 0.8745098, 0, 1,
-0.9494344, -0.4724887, -3.384987, 1, 0.8823529, 0, 1,
-0.9492143, 0.009914957, -1.291981, 1, 0.8862745, 0, 1,
-0.9488796, -2.010173, -1.876785, 1, 0.8941177, 0, 1,
-0.9480602, 0.294199, -1.306994, 1, 0.8980392, 0, 1,
-0.9460123, 0.9631169, -0.9349311, 1, 0.9058824, 0, 1,
-0.9399348, -1.354552, -2.342613, 1, 0.9137255, 0, 1,
-0.9389942, 1.4198, -2.450556, 1, 0.9176471, 0, 1,
-0.9343929, -0.0005234646, -1.04397, 1, 0.9254902, 0, 1,
-0.93331, -1.622343, -1.408437, 1, 0.9294118, 0, 1,
-0.9317194, -0.5416726, -1.826118, 1, 0.9372549, 0, 1,
-0.9195355, 1.442407, -0.8204077, 1, 0.9411765, 0, 1,
-0.9090033, 0.712378, -2.376193, 1, 0.9490196, 0, 1,
-0.9011289, -0.1560251, -1.219453, 1, 0.9529412, 0, 1,
-0.8988541, 1.164758, -1.017443, 1, 0.9607843, 0, 1,
-0.8978701, -0.8490472, -1.034909, 1, 0.9647059, 0, 1,
-0.8973701, 0.4330506, -1.310589, 1, 0.972549, 0, 1,
-0.8946509, 1.508206, 0.856702, 1, 0.9764706, 0, 1,
-0.8913119, 0.4898072, -1.05322, 1, 0.9843137, 0, 1,
-0.8889962, -0.6038753, -3.206881, 1, 0.9882353, 0, 1,
-0.885091, 3.526647, 0.8590176, 1, 0.9960784, 0, 1,
-0.8831709, 2.17788, -1.31521, 0.9960784, 1, 0, 1,
-0.8812814, -1.218292, -2.448634, 0.9921569, 1, 0, 1,
-0.8772478, 0.07358607, 0.4031435, 0.9843137, 1, 0, 1,
-0.8707129, 0.7561048, -0.6646722, 0.9803922, 1, 0, 1,
-0.8706847, 1.465278, -0.826419, 0.972549, 1, 0, 1,
-0.8687894, -0.5417222, -0.7656454, 0.9686275, 1, 0, 1,
-0.8665532, -0.3663564, -1.361084, 0.9607843, 1, 0, 1,
-0.8661122, 0.8857287, -2.267122, 0.9568627, 1, 0, 1,
-0.8635957, 0.06418462, -1.085507, 0.9490196, 1, 0, 1,
-0.8596154, -0.4062063, -1.497876, 0.945098, 1, 0, 1,
-0.8575426, -0.7013346, -1.885345, 0.9372549, 1, 0, 1,
-0.8569282, 0.3555725, -0.7868664, 0.9333333, 1, 0, 1,
-0.8549432, -1.726408, -4.847763, 0.9254902, 1, 0, 1,
-0.8443959, -0.8600664, -1.696546, 0.9215686, 1, 0, 1,
-0.8423449, -1.066893, -4.114448, 0.9137255, 1, 0, 1,
-0.8383581, 0.9420463, -1.537496, 0.9098039, 1, 0, 1,
-0.837225, 1.098919, -1.860508, 0.9019608, 1, 0, 1,
-0.8360678, 2.128297, -0.3088672, 0.8941177, 1, 0, 1,
-0.8329445, 0.5677098, -1.928973, 0.8901961, 1, 0, 1,
-0.8285776, -0.132238, -2.525485, 0.8823529, 1, 0, 1,
-0.8280371, -0.2906083, -1.760388, 0.8784314, 1, 0, 1,
-0.8277521, 0.7954239, -0.6950325, 0.8705882, 1, 0, 1,
-0.8228367, 1.00025, 0.03315643, 0.8666667, 1, 0, 1,
-0.8164104, 1.157132, -0.696968, 0.8588235, 1, 0, 1,
-0.8076661, -0.3114616, -1.558501, 0.854902, 1, 0, 1,
-0.8021201, -0.8937753, -2.397372, 0.8470588, 1, 0, 1,
-0.8019365, 1.250606, -0.2805161, 0.8431373, 1, 0, 1,
-0.7993658, -0.4488583, -2.417087, 0.8352941, 1, 0, 1,
-0.7991982, -1.218104, -4.033175, 0.8313726, 1, 0, 1,
-0.7949974, -0.3409981, -1.368589, 0.8235294, 1, 0, 1,
-0.7894298, -0.4216765, -3.344456, 0.8196079, 1, 0, 1,
-0.784008, -0.1398978, -2.669363, 0.8117647, 1, 0, 1,
-0.7795545, -0.5635898, -1.996415, 0.8078431, 1, 0, 1,
-0.7791454, 0.6139141, -2.09701, 0.8, 1, 0, 1,
-0.7772982, 0.5412986, -0.2041088, 0.7921569, 1, 0, 1,
-0.7731598, 0.2707632, -0.6040038, 0.7882353, 1, 0, 1,
-0.7714376, 1.36953, -0.4453838, 0.7803922, 1, 0, 1,
-0.7647914, 1.350615, -0.3910022, 0.7764706, 1, 0, 1,
-0.7535983, 1.613997, -1.495182, 0.7686275, 1, 0, 1,
-0.7491795, 0.6894258, 0.5006422, 0.7647059, 1, 0, 1,
-0.7476794, -1.516165, -1.988653, 0.7568628, 1, 0, 1,
-0.7456868, 0.6126953, -1.055865, 0.7529412, 1, 0, 1,
-0.7390708, 2.253706, -2.038716, 0.7450981, 1, 0, 1,
-0.7333221, 0.2496688, -0.6028023, 0.7411765, 1, 0, 1,
-0.7332178, -0.6441651, -2.416793, 0.7333333, 1, 0, 1,
-0.7282552, 0.2275477, -1.784327, 0.7294118, 1, 0, 1,
-0.7275414, -0.869989, -3.351757, 0.7215686, 1, 0, 1,
-0.7274857, 1.356495, -0.4005409, 0.7176471, 1, 0, 1,
-0.7274265, 0.2268403, -1.251604, 0.7098039, 1, 0, 1,
-0.7246051, -0.9188236, -3.212942, 0.7058824, 1, 0, 1,
-0.722743, -0.1028843, -1.413493, 0.6980392, 1, 0, 1,
-0.7208599, 2.634927, -0.8412638, 0.6901961, 1, 0, 1,
-0.7192872, -1.277735, -3.338889, 0.6862745, 1, 0, 1,
-0.7177858, -0.7990193, -1.58787, 0.6784314, 1, 0, 1,
-0.7167, -0.6041991, -0.4189935, 0.6745098, 1, 0, 1,
-0.7156762, -0.8479841, -1.835284, 0.6666667, 1, 0, 1,
-0.7147556, 0.9521869, -0.6884885, 0.6627451, 1, 0, 1,
-0.7086756, -1.169741, -1.42327, 0.654902, 1, 0, 1,
-0.7071693, -2.260741, -0.6386636, 0.6509804, 1, 0, 1,
-0.7069532, 0.383693, -0.7899883, 0.6431373, 1, 0, 1,
-0.7055307, -0.6797909, -2.852064, 0.6392157, 1, 0, 1,
-0.6979821, 0.3384869, -2.537665, 0.6313726, 1, 0, 1,
-0.6967291, -1.27809, -4.066569, 0.627451, 1, 0, 1,
-0.6797482, 0.6085433, -1.074997, 0.6196079, 1, 0, 1,
-0.6788874, 0.5926285, -2.087993, 0.6156863, 1, 0, 1,
-0.6698275, 0.7403704, -1.207086, 0.6078432, 1, 0, 1,
-0.6683413, 0.6031595, -0.887267, 0.6039216, 1, 0, 1,
-0.6664589, -1.179817, -3.572227, 0.5960785, 1, 0, 1,
-0.665825, -1.074458, -2.200004, 0.5882353, 1, 0, 1,
-0.6657929, -1.514215, -2.475785, 0.5843138, 1, 0, 1,
-0.6656454, -0.01984154, -1.173164, 0.5764706, 1, 0, 1,
-0.6650919, 0.328919, -1.080917, 0.572549, 1, 0, 1,
-0.6606599, -1.223922, -4.088313, 0.5647059, 1, 0, 1,
-0.6588476, -1.794318, -3.180764, 0.5607843, 1, 0, 1,
-0.6496425, 0.3045682, -0.9472498, 0.5529412, 1, 0, 1,
-0.6467441, -2.018036, -2.355482, 0.5490196, 1, 0, 1,
-0.6433234, 0.5189677, -1.22652, 0.5411765, 1, 0, 1,
-0.6422011, -0.5702738, -2.82312, 0.5372549, 1, 0, 1,
-0.6391536, -1.114054, -3.457328, 0.5294118, 1, 0, 1,
-0.637039, 1.024518, -0.768653, 0.5254902, 1, 0, 1,
-0.6361061, -0.6419098, -1.456384, 0.5176471, 1, 0, 1,
-0.6354233, 2.758701, -0.1884168, 0.5137255, 1, 0, 1,
-0.6341968, 0.4885438, -0.8362224, 0.5058824, 1, 0, 1,
-0.631941, 0.1405695, 0.1184205, 0.5019608, 1, 0, 1,
-0.6300614, -0.9837835, -2.257951, 0.4941176, 1, 0, 1,
-0.629777, -2.068138, -2.296398, 0.4862745, 1, 0, 1,
-0.626675, 0.07360792, -1.370061, 0.4823529, 1, 0, 1,
-0.6251907, -1.931834, -4.016399, 0.4745098, 1, 0, 1,
-0.6250042, 0.234799, -2.851196, 0.4705882, 1, 0, 1,
-0.6144494, -1.03863, -2.540292, 0.4627451, 1, 0, 1,
-0.6036433, -0.4882389, -1.390132, 0.4588235, 1, 0, 1,
-0.6018586, -1.005943, -2.029994, 0.4509804, 1, 0, 1,
-0.5997836, -0.6677576, -2.983592, 0.4470588, 1, 0, 1,
-0.5986893, -0.6198313, -1.903957, 0.4392157, 1, 0, 1,
-0.590703, -1.30679, -1.835629, 0.4352941, 1, 0, 1,
-0.5880722, 1.575419, -0.4582674, 0.427451, 1, 0, 1,
-0.5822923, -0.0117902, -1.72388, 0.4235294, 1, 0, 1,
-0.5812015, -0.5818597, -2.40656, 0.4156863, 1, 0, 1,
-0.5800603, 0.2931713, -2.236143, 0.4117647, 1, 0, 1,
-0.5777142, 0.3601505, -3.351734, 0.4039216, 1, 0, 1,
-0.5736014, 0.3317825, -1.675484, 0.3960784, 1, 0, 1,
-0.5709499, -1.019983, -3.458513, 0.3921569, 1, 0, 1,
-0.5666751, 0.7495807, 0.01125665, 0.3843137, 1, 0, 1,
-0.5663376, -1.115125, -2.618232, 0.3803922, 1, 0, 1,
-0.5626697, -0.3610346, -2.903117, 0.372549, 1, 0, 1,
-0.5620259, -0.930585, -3.097938, 0.3686275, 1, 0, 1,
-0.552002, -1.236868, -3.409544, 0.3607843, 1, 0, 1,
-0.551829, -0.1185072, -1.802833, 0.3568628, 1, 0, 1,
-0.5511091, 0.958268, -0.1285451, 0.3490196, 1, 0, 1,
-0.5509744, -2.392019, -3.534957, 0.345098, 1, 0, 1,
-0.5449181, 2.426433, -0.376145, 0.3372549, 1, 0, 1,
-0.5387604, -1.099669, -1.098279, 0.3333333, 1, 0, 1,
-0.5338727, 0.632198, -0.3542159, 0.3254902, 1, 0, 1,
-0.5278782, -0.9547034, -3.372104, 0.3215686, 1, 0, 1,
-0.5272461, -0.646456, -1.004735, 0.3137255, 1, 0, 1,
-0.5212106, -0.8148541, -3.984929, 0.3098039, 1, 0, 1,
-0.517946, -1.350979, -3.583012, 0.3019608, 1, 0, 1,
-0.5150493, -0.0145901, -1.450183, 0.2941177, 1, 0, 1,
-0.5116416, 1.587196, -0.5661895, 0.2901961, 1, 0, 1,
-0.5102794, 1.136289, 0.5502253, 0.282353, 1, 0, 1,
-0.5094669, -0.4861763, -1.660611, 0.2784314, 1, 0, 1,
-0.5033044, -0.4327883, -3.53747, 0.2705882, 1, 0, 1,
-0.5032256, 0.4706725, -0.1617084, 0.2666667, 1, 0, 1,
-0.5008312, 0.03202321, 0.4404537, 0.2588235, 1, 0, 1,
-0.5007337, 3.169251, -0.4914034, 0.254902, 1, 0, 1,
-0.4980032, 0.7485743, 0.681869, 0.2470588, 1, 0, 1,
-0.496101, -0.1555436, -2.494539, 0.2431373, 1, 0, 1,
-0.4939181, 0.7495121, -0.2148295, 0.2352941, 1, 0, 1,
-0.4915666, 1.934178, 0.3545474, 0.2313726, 1, 0, 1,
-0.4832395, 0.411606, 0.5126414, 0.2235294, 1, 0, 1,
-0.4826268, 0.7972847, -1.664657, 0.2196078, 1, 0, 1,
-0.4787929, 0.3929162, -0.6360452, 0.2117647, 1, 0, 1,
-0.477032, -1.186651, -3.246802, 0.2078431, 1, 0, 1,
-0.4767366, 0.6942586, 0.3490157, 0.2, 1, 0, 1,
-0.4763264, 0.3473883, 0.2555162, 0.1921569, 1, 0, 1,
-0.4741421, 0.3716109, -1.438997, 0.1882353, 1, 0, 1,
-0.4727578, -1.104828, -3.402865, 0.1803922, 1, 0, 1,
-0.4707345, -0.5694399, -2.739828, 0.1764706, 1, 0, 1,
-0.4669431, -0.8499643, -3.172548, 0.1686275, 1, 0, 1,
-0.4662976, -0.4842746, -0.9658812, 0.1647059, 1, 0, 1,
-0.4606126, -1.297761, -3.086811, 0.1568628, 1, 0, 1,
-0.4595414, -1.562181, -1.983527, 0.1529412, 1, 0, 1,
-0.4505553, 0.6808608, -2.941906, 0.145098, 1, 0, 1,
-0.4501449, 0.6686628, -1.208746, 0.1411765, 1, 0, 1,
-0.4434777, 0.2322682, -2.138839, 0.1333333, 1, 0, 1,
-0.4426631, 0.8846931, 0.9678511, 0.1294118, 1, 0, 1,
-0.4394238, 0.5526071, 0.6866609, 0.1215686, 1, 0, 1,
-0.439065, -0.6955095, -2.475142, 0.1176471, 1, 0, 1,
-0.4366466, -0.8933728, -1.865803, 0.1098039, 1, 0, 1,
-0.4359213, 2.252715, -1.220857, 0.1058824, 1, 0, 1,
-0.4335075, -0.8440303, -4.603334, 0.09803922, 1, 0, 1,
-0.4329229, -0.2871828, -4.492833, 0.09019608, 1, 0, 1,
-0.426178, -1.329235, -2.041111, 0.08627451, 1, 0, 1,
-0.42259, 0.5604598, -0.9404209, 0.07843138, 1, 0, 1,
-0.4225804, -0.1552125, -1.142182, 0.07450981, 1, 0, 1,
-0.4186779, 1.166885, 0.9185934, 0.06666667, 1, 0, 1,
-0.4165604, -0.7869304, -4.12665, 0.0627451, 1, 0, 1,
-0.4154694, -0.5261477, -1.807674, 0.05490196, 1, 0, 1,
-0.414379, 0.7669927, -1.175669, 0.05098039, 1, 0, 1,
-0.4103426, -1.210726, -2.576425, 0.04313726, 1, 0, 1,
-0.4091718, 0.8326018, 0.2746997, 0.03921569, 1, 0, 1,
-0.4038686, -1.157194, -2.832684, 0.03137255, 1, 0, 1,
-0.402782, -0.4066619, -3.539671, 0.02745098, 1, 0, 1,
-0.4026718, -2.883511, -2.873876, 0.01960784, 1, 0, 1,
-0.4011241, -0.578957, -4.005467, 0.01568628, 1, 0, 1,
-0.4003866, -0.4549894, -1.914434, 0.007843138, 1, 0, 1,
-0.3991811, 0.09521595, -0.1428779, 0.003921569, 1, 0, 1,
-0.3969423, -0.195301, 0.168003, 0, 1, 0.003921569, 1,
-0.3952724, 0.3630509, -1.268959, 0, 1, 0.01176471, 1,
-0.3914397, -1.07002, -1.941697, 0, 1, 0.01568628, 1,
-0.3867159, 1.110039, 0.141529, 0, 1, 0.02352941, 1,
-0.3860534, -2.328488, -3.177871, 0, 1, 0.02745098, 1,
-0.3815449, -0.3226984, -2.217622, 0, 1, 0.03529412, 1,
-0.3799694, 1.034552, -1.543524, 0, 1, 0.03921569, 1,
-0.3777465, -0.1887726, -0.704771, 0, 1, 0.04705882, 1,
-0.3775702, 0.5173977, -1.161844, 0, 1, 0.05098039, 1,
-0.373137, 0.5304174, 0.7423588, 0, 1, 0.05882353, 1,
-0.3720647, -0.5810323, -1.303149, 0, 1, 0.0627451, 1,
-0.3717021, -1.363313, -1.901064, 0, 1, 0.07058824, 1,
-0.3703599, 0.1586426, -2.018049, 0, 1, 0.07450981, 1,
-0.3691337, -0.2106808, -1.752182, 0, 1, 0.08235294, 1,
-0.3690289, -0.5592223, -1.59947, 0, 1, 0.08627451, 1,
-0.3685706, 0.8214632, -0.4147722, 0, 1, 0.09411765, 1,
-0.3614319, -0.718976, -3.675107, 0, 1, 0.1019608, 1,
-0.3597756, 0.9760281, 0.6322356, 0, 1, 0.1058824, 1,
-0.357212, 0.2548709, -2.25599, 0, 1, 0.1137255, 1,
-0.3570369, 1.056095, -2.661327, 0, 1, 0.1176471, 1,
-0.3501872, -0.3274965, -3.019067, 0, 1, 0.1254902, 1,
-0.34658, 0.9082829, -0.3097099, 0, 1, 0.1294118, 1,
-0.3432618, -0.6423546, -2.686394, 0, 1, 0.1372549, 1,
-0.3408755, -0.8972396, -1.787314, 0, 1, 0.1411765, 1,
-0.3354163, 0.3573267, -0.2495354, 0, 1, 0.1490196, 1,
-0.3349286, -0.636247, -5.335826, 0, 1, 0.1529412, 1,
-0.3334413, 0.3853761, -1.218245, 0, 1, 0.1607843, 1,
-0.3290804, 0.3231905, 0.04407218, 0, 1, 0.1647059, 1,
-0.3277446, 0.3475061, -1.840401, 0, 1, 0.172549, 1,
-0.323174, 0.05625838, -1.540531, 0, 1, 0.1764706, 1,
-0.3187907, 0.4738083, -0.1507833, 0, 1, 0.1843137, 1,
-0.3184802, 0.3399407, 0.1348104, 0, 1, 0.1882353, 1,
-0.3184371, -0.3331935, -3.030674, 0, 1, 0.1960784, 1,
-0.318075, 0.3524746, -1.23193, 0, 1, 0.2039216, 1,
-0.3160831, -0.0746209, -1.325449, 0, 1, 0.2078431, 1,
-0.3069893, 2.236639, 0.03796333, 0, 1, 0.2156863, 1,
-0.3055572, 0.585161, -1.804602, 0, 1, 0.2196078, 1,
-0.3007115, 0.8797901, -0.2206666, 0, 1, 0.227451, 1,
-0.299134, -0.1862515, -1.957979, 0, 1, 0.2313726, 1,
-0.2963335, 0.7498853, -0.8702233, 0, 1, 0.2392157, 1,
-0.293349, -0.4453082, -1.89727, 0, 1, 0.2431373, 1,
-0.2892624, 1.310789, -0.9073738, 0, 1, 0.2509804, 1,
-0.2855192, -1.366968, -3.051523, 0, 1, 0.254902, 1,
-0.2796563, -0.1359449, -2.266113, 0, 1, 0.2627451, 1,
-0.2792901, -0.6270689, -3.561376, 0, 1, 0.2666667, 1,
-0.278802, -0.04288093, -2.074145, 0, 1, 0.2745098, 1,
-0.2784138, -0.145141, -2.542008, 0, 1, 0.2784314, 1,
-0.2751664, 0.3949789, -1.719708, 0, 1, 0.2862745, 1,
-0.273199, -0.6988178, -4.523817, 0, 1, 0.2901961, 1,
-0.2729219, -0.3594569, -2.643058, 0, 1, 0.2980392, 1,
-0.2671682, -1.060331, -2.758444, 0, 1, 0.3058824, 1,
-0.2637596, 1.160926, 1.424713, 0, 1, 0.3098039, 1,
-0.2636572, -0.00628379, -1.107898, 0, 1, 0.3176471, 1,
-0.2619231, -0.7794783, -3.435906, 0, 1, 0.3215686, 1,
-0.2581095, -0.2722695, -2.894592, 0, 1, 0.3294118, 1,
-0.2536275, -0.8749532, -2.255775, 0, 1, 0.3333333, 1,
-0.2507463, 0.03459879, -2.357639, 0, 1, 0.3411765, 1,
-0.2505164, -0.5973785, -3.531112, 0, 1, 0.345098, 1,
-0.2478827, 0.3175299, 0.01730934, 0, 1, 0.3529412, 1,
-0.2455553, 0.008008476, -2.353784, 0, 1, 0.3568628, 1,
-0.2443688, -0.5867012, -1.482442, 0, 1, 0.3647059, 1,
-0.2441068, 1.379158, -0.702895, 0, 1, 0.3686275, 1,
-0.2404224, 1.464302, -0.6421257, 0, 1, 0.3764706, 1,
-0.2392417, 0.5748033, -1.066516, 0, 1, 0.3803922, 1,
-0.2326254, -0.4288505, -1.31968, 0, 1, 0.3882353, 1,
-0.2322479, -0.9387122, -3.985753, 0, 1, 0.3921569, 1,
-0.2264353, -0.5566904, -4.338478, 0, 1, 0.4, 1,
-0.2200397, 0.1449664, -0.9795107, 0, 1, 0.4078431, 1,
-0.2190197, 1.534396, 0.9118178, 0, 1, 0.4117647, 1,
-0.218783, -0.6236503, -3.124663, 0, 1, 0.4196078, 1,
-0.2143117, -0.5690114, -3.386795, 0, 1, 0.4235294, 1,
-0.2072297, 0.5453109, -0.5050032, 0, 1, 0.4313726, 1,
-0.2015437, 0.03602886, -2.184493, 0, 1, 0.4352941, 1,
-0.196252, 1.46538, 1.080059, 0, 1, 0.4431373, 1,
-0.1912275, -0.847644, -4.732267, 0, 1, 0.4470588, 1,
-0.1898466, -0.2145562, -2.721493, 0, 1, 0.454902, 1,
-0.1884867, -0.7623231, -3.735455, 0, 1, 0.4588235, 1,
-0.185676, -1.508301, -5.836733, 0, 1, 0.4666667, 1,
-0.1766016, 1.909992, -0.4307708, 0, 1, 0.4705882, 1,
-0.1751968, 0.4633189, 0.1997103, 0, 1, 0.4784314, 1,
-0.1751806, 1.067371, 0.182156, 0, 1, 0.4823529, 1,
-0.1740905, -0.9750073, -2.678413, 0, 1, 0.4901961, 1,
-0.1731374, 0.847838, 0.392555, 0, 1, 0.4941176, 1,
-0.1715347, 0.9589123, 1.401995, 0, 1, 0.5019608, 1,
-0.1710124, 0.00872155, 2.346537, 0, 1, 0.509804, 1,
-0.1646001, 1.404453, 0.4991024, 0, 1, 0.5137255, 1,
-0.1644237, -0.7616454, -2.792975, 0, 1, 0.5215687, 1,
-0.1613218, 0.01137944, -0.7366307, 0, 1, 0.5254902, 1,
-0.1611909, -0.9496634, -2.669129, 0, 1, 0.5333334, 1,
-0.1558922, 0.6265991, -0.332458, 0, 1, 0.5372549, 1,
-0.1481874, 1.557722, -1.578468, 0, 1, 0.5450981, 1,
-0.1456619, 0.04375845, -0.4980228, 0, 1, 0.5490196, 1,
-0.1433229, -0.3095709, -3.879234, 0, 1, 0.5568628, 1,
-0.143134, 0.4429601, -0.1604315, 0, 1, 0.5607843, 1,
-0.1418811, -0.6851828, -2.685719, 0, 1, 0.5686275, 1,
-0.1414738, 2.068539, -0.1569483, 0, 1, 0.572549, 1,
-0.1411677, -1.218355, -3.511556, 0, 1, 0.5803922, 1,
-0.1386508, -0.8296395, -4.799218, 0, 1, 0.5843138, 1,
-0.1368964, 1.331797, -0.8967883, 0, 1, 0.5921569, 1,
-0.1320501, 0.1252666, -0.5491595, 0, 1, 0.5960785, 1,
-0.1267141, 0.9567875, 1.765756, 0, 1, 0.6039216, 1,
-0.1265189, -0.1213011, -2.576151, 0, 1, 0.6117647, 1,
-0.1262815, -0.1170585, -2.503526, 0, 1, 0.6156863, 1,
-0.1254435, -0.08375988, -2.289539, 0, 1, 0.6235294, 1,
-0.1229492, -0.2086018, -3.309023, 0, 1, 0.627451, 1,
-0.1211176, -1.719094, -3.519317, 0, 1, 0.6352941, 1,
-0.1204763, -1.725445, -2.288827, 0, 1, 0.6392157, 1,
-0.1201071, 1.29336, 0.1273823, 0, 1, 0.6470588, 1,
-0.1179911, -2.134295, -4.230901, 0, 1, 0.6509804, 1,
-0.1166675, -0.5807871, -2.176424, 0, 1, 0.6588235, 1,
-0.1134188, -0.3271332, -3.996241, 0, 1, 0.6627451, 1,
-0.1115968, 0.4255927, -1.409512, 0, 1, 0.6705883, 1,
-0.1068379, 0.2522565, -0.197263, 0, 1, 0.6745098, 1,
-0.103268, -0.009956648, -1.515135, 0, 1, 0.682353, 1,
-0.1026626, 0.06604299, 0.7338812, 0, 1, 0.6862745, 1,
-0.1019871, 0.5656253, 0.6023421, 0, 1, 0.6941177, 1,
-0.09963418, 1.025111, 0.4329286, 0, 1, 0.7019608, 1,
-0.0932541, -0.004056664, -1.675244, 0, 1, 0.7058824, 1,
-0.08946133, 0.9240771, -1.306796, 0, 1, 0.7137255, 1,
-0.08622145, 1.095714, -0.3003528, 0, 1, 0.7176471, 1,
-0.08479286, 0.1564562, -0.8834167, 0, 1, 0.7254902, 1,
-0.08415424, 1.05863, -1.720292, 0, 1, 0.7294118, 1,
-0.08127153, -0.4200229, -3.399261, 0, 1, 0.7372549, 1,
-0.07906497, 0.869258, 1.275306, 0, 1, 0.7411765, 1,
-0.07740658, 0.449765, 0.4382704, 0, 1, 0.7490196, 1,
-0.07673301, -0.2118521, -3.12998, 0, 1, 0.7529412, 1,
-0.06390009, -1.013661, -2.320671, 0, 1, 0.7607843, 1,
-0.06118632, -0.1409341, -4.155174, 0, 1, 0.7647059, 1,
-0.06090576, 0.6362427, 0.09250458, 0, 1, 0.772549, 1,
-0.05110097, 0.3470929, 0.8467716, 0, 1, 0.7764706, 1,
-0.04939368, -2.031482, -2.565586, 0, 1, 0.7843137, 1,
-0.04885809, -0.005398259, -1.654371, 0, 1, 0.7882353, 1,
-0.04610599, 0.3233173, -1.64061, 0, 1, 0.7960784, 1,
-0.04162655, -0.07766204, -2.086611, 0, 1, 0.8039216, 1,
-0.04074852, 0.2748358, 0.3404149, 0, 1, 0.8078431, 1,
-0.03945019, -0.4140352, -3.995553, 0, 1, 0.8156863, 1,
-0.03940897, 0.2176473, -1.50437, 0, 1, 0.8196079, 1,
-0.03704688, -0.3767123, -2.290391, 0, 1, 0.827451, 1,
-0.03696486, 3.27314, 0.8134826, 0, 1, 0.8313726, 1,
-0.03601239, -1.13578, -3.783869, 0, 1, 0.8392157, 1,
-0.03588273, 1.379661, -0.2966015, 0, 1, 0.8431373, 1,
-0.03424894, 0.3437945, -0.1958711, 0, 1, 0.8509804, 1,
-0.03320668, 0.5356699, -1.085697, 0, 1, 0.854902, 1,
-0.03227568, 0.1597923, 0.4611025, 0, 1, 0.8627451, 1,
-0.02317505, -1.356648, -1.730717, 0, 1, 0.8666667, 1,
-0.01990536, 1.588071, 0.5521564, 0, 1, 0.8745098, 1,
-0.01624636, 0.2721375, -0.4001892, 0, 1, 0.8784314, 1,
-0.01604132, -1.286377, -3.70751, 0, 1, 0.8862745, 1,
-0.01247014, -0.09872921, -4.332538, 0, 1, 0.8901961, 1,
0.003537521, 0.4164087, 1.363732, 0, 1, 0.8980392, 1,
0.01078523, 0.4884146, -0.1808843, 0, 1, 0.9058824, 1,
0.01360194, 2.169458, 0.2570668, 0, 1, 0.9098039, 1,
0.01891212, -0.3092397, 2.976168, 0, 1, 0.9176471, 1,
0.0192825, 0.980666, -0.8795871, 0, 1, 0.9215686, 1,
0.02075728, -1.764245, 1.913755, 0, 1, 0.9294118, 1,
0.02170552, -1.165294, 3.652793, 0, 1, 0.9333333, 1,
0.02224387, -0.5126294, 4.498264, 0, 1, 0.9411765, 1,
0.02571162, -0.6863424, 3.018435, 0, 1, 0.945098, 1,
0.02848339, -0.4076422, 3.632737, 0, 1, 0.9529412, 1,
0.03080022, -1.139513, 3.278975, 0, 1, 0.9568627, 1,
0.03093308, 0.123566, 0.5104851, 0, 1, 0.9647059, 1,
0.03423598, -1.900761, 3.605503, 0, 1, 0.9686275, 1,
0.03577261, 3.753046, -0.7277349, 0, 1, 0.9764706, 1,
0.03767581, -0.4061643, 3.42754, 0, 1, 0.9803922, 1,
0.04280415, 1.022929, -0.985086, 0, 1, 0.9882353, 1,
0.04291048, 0.2959515, 1.203706, 0, 1, 0.9921569, 1,
0.04331769, -1.946827, 3.01071, 0, 1, 1, 1,
0.0444392, 1.194159, 0.6822011, 0, 0.9921569, 1, 1,
0.04551764, -0.4061607, 3.771856, 0, 0.9882353, 1, 1,
0.04739129, 1.239755, -1.215076, 0, 0.9803922, 1, 1,
0.04821974, -0.4495192, 2.898127, 0, 0.9764706, 1, 1,
0.04950508, 0.8103582, 1.551381, 0, 0.9686275, 1, 1,
0.05041012, -0.1878961, 1.021937, 0, 0.9647059, 1, 1,
0.05244433, 1.478692, 0.1911581, 0, 0.9568627, 1, 1,
0.0550037, 0.02833897, 0.2506203, 0, 0.9529412, 1, 1,
0.05503038, 0.6294321, 0.7105671, 0, 0.945098, 1, 1,
0.05668654, 0.9467832, 2.753486, 0, 0.9411765, 1, 1,
0.05957521, 0.9563597, 0.2301558, 0, 0.9333333, 1, 1,
0.07101643, -0.05953696, 3.189794, 0, 0.9294118, 1, 1,
0.07234051, -0.1272125, 3.903071, 0, 0.9215686, 1, 1,
0.07440114, -0.4577707, 2.292934, 0, 0.9176471, 1, 1,
0.0762312, -1.052573, 2.458277, 0, 0.9098039, 1, 1,
0.07865987, -0.008294184, 2.476363, 0, 0.9058824, 1, 1,
0.08236746, -0.7069137, 5.375085, 0, 0.8980392, 1, 1,
0.08388465, 0.01146035, 0.4120803, 0, 0.8901961, 1, 1,
0.08561913, 0.2045764, 0.8644063, 0, 0.8862745, 1, 1,
0.08899835, -0.9192863, 1.708164, 0, 0.8784314, 1, 1,
0.09186678, -0.9157496, 3.432851, 0, 0.8745098, 1, 1,
0.09404768, 0.358083, 0.7722892, 0, 0.8666667, 1, 1,
0.09412242, 0.2516841, 0.7830031, 0, 0.8627451, 1, 1,
0.09514249, -1.561201, 4.176101, 0, 0.854902, 1, 1,
0.09677526, -0.4907068, 2.169701, 0, 0.8509804, 1, 1,
0.09800635, -0.4618246, 2.314435, 0, 0.8431373, 1, 1,
0.1008814, -0.4117366, 3.767808, 0, 0.8392157, 1, 1,
0.1013082, -2.347236, 2.870473, 0, 0.8313726, 1, 1,
0.1030163, -1.55579, 2.854045, 0, 0.827451, 1, 1,
0.1042104, 1.637903, -0.1955391, 0, 0.8196079, 1, 1,
0.1044626, 0.9735784, 0.4446993, 0, 0.8156863, 1, 1,
0.1045171, 1.170174, 0.3876058, 0, 0.8078431, 1, 1,
0.1057081, 1.010227, 0.3654688, 0, 0.8039216, 1, 1,
0.1067177, 1.233315, 1.049758, 0, 0.7960784, 1, 1,
0.1086516, -1.46137, 0.6819615, 0, 0.7882353, 1, 1,
0.1097226, 0.4029777, -0.350837, 0, 0.7843137, 1, 1,
0.1108845, 1.188979, 1.259787, 0, 0.7764706, 1, 1,
0.1118764, -0.6055331, 4.19129, 0, 0.772549, 1, 1,
0.1121526, -0.6268207, 4.355432, 0, 0.7647059, 1, 1,
0.1122153, -0.8940036, 3.959408, 0, 0.7607843, 1, 1,
0.1132516, -1.072252, 4.483328, 0, 0.7529412, 1, 1,
0.1136208, 0.5559431, 1.095208, 0, 0.7490196, 1, 1,
0.1139409, 1.142729, 0.64152, 0, 0.7411765, 1, 1,
0.1148379, -0.05443561, 0.7948653, 0, 0.7372549, 1, 1,
0.1165699, -1.359646, 2.865901, 0, 0.7294118, 1, 1,
0.1166292, -0.879374, 2.792237, 0, 0.7254902, 1, 1,
0.1179263, -0.2873846, 3.125772, 0, 0.7176471, 1, 1,
0.1205347, 0.1542222, 0.543091, 0, 0.7137255, 1, 1,
0.1206931, -0.1785476, 1.301542, 0, 0.7058824, 1, 1,
0.1220158, 0.8431114, 0.1607936, 0, 0.6980392, 1, 1,
0.1226655, 0.7018203, 1.247613, 0, 0.6941177, 1, 1,
0.1229267, -2.222794, 3.466607, 0, 0.6862745, 1, 1,
0.1240877, 0.1831706, -0.7018805, 0, 0.682353, 1, 1,
0.1250982, 1.080254, -0.4229494, 0, 0.6745098, 1, 1,
0.1253127, 0.2645823, 1.027167, 0, 0.6705883, 1, 1,
0.1268957, 1.186637, -0.4010326, 0, 0.6627451, 1, 1,
0.1278016, -0.8995141, 3.765762, 0, 0.6588235, 1, 1,
0.1295812, 1.288733, 1.335845, 0, 0.6509804, 1, 1,
0.1309161, 0.5437645, 0.08038232, 0, 0.6470588, 1, 1,
0.130947, 1.643301, 1.365495, 0, 0.6392157, 1, 1,
0.1333594, -0.2538452, 2.364979, 0, 0.6352941, 1, 1,
0.1340869, 1.498143, -1.054793, 0, 0.627451, 1, 1,
0.1344816, -1.311134, 4.220719, 0, 0.6235294, 1, 1,
0.1377718, -2.979043, 4.413326, 0, 0.6156863, 1, 1,
0.1378262, 0.6466519, 0.4326469, 0, 0.6117647, 1, 1,
0.1398986, -0.3804188, 3.850046, 0, 0.6039216, 1, 1,
0.1431167, -0.2985482, 2.940034, 0, 0.5960785, 1, 1,
0.1432797, 0.6514149, 0.7108353, 0, 0.5921569, 1, 1,
0.1449846, -2.551079, 2.60976, 0, 0.5843138, 1, 1,
0.1450562, -0.7234387, 2.833268, 0, 0.5803922, 1, 1,
0.1498987, 1.136359, -0.7468167, 0, 0.572549, 1, 1,
0.1534789, -1.502804, 0.2189661, 0, 0.5686275, 1, 1,
0.1562072, 0.9673739, -0.4626051, 0, 0.5607843, 1, 1,
0.1567322, 0.02472244, 2.340168, 0, 0.5568628, 1, 1,
0.1587523, 1.486039, 1.425492, 0, 0.5490196, 1, 1,
0.1593907, -0.1151818, 3.131029, 0, 0.5450981, 1, 1,
0.1594536, 0.1810043, -0.7770274, 0, 0.5372549, 1, 1,
0.1605069, 0.08818822, 1.13231, 0, 0.5333334, 1, 1,
0.160698, -1.143843, 3.460037, 0, 0.5254902, 1, 1,
0.1610631, 2.260871, 1.715097, 0, 0.5215687, 1, 1,
0.1688219, 1.264934, -0.09001148, 0, 0.5137255, 1, 1,
0.1689305, -1.816287, 3.792599, 0, 0.509804, 1, 1,
0.1711263, -0.1010163, 2.651399, 0, 0.5019608, 1, 1,
0.1756067, -0.710076, 2.750816, 0, 0.4941176, 1, 1,
0.1757689, 1.089608, -0.8660555, 0, 0.4901961, 1, 1,
0.1854477, 0.4681545, -0.3550714, 0, 0.4823529, 1, 1,
0.1858527, 0.8115241, 0.08466151, 0, 0.4784314, 1, 1,
0.1861366, -0.7826871, 2.393579, 0, 0.4705882, 1, 1,
0.1910379, 0.2014555, 0.8799039, 0, 0.4666667, 1, 1,
0.1946917, -1.681703, 2.135566, 0, 0.4588235, 1, 1,
0.1972003, -0.2772275, 3.78142, 0, 0.454902, 1, 1,
0.198861, -0.9162425, 2.133955, 0, 0.4470588, 1, 1,
0.2007855, 0.03813743, 0.5376908, 0, 0.4431373, 1, 1,
0.2035636, 0.05739503, 1.024456, 0, 0.4352941, 1, 1,
0.2036204, 0.8555647, 0.3988398, 0, 0.4313726, 1, 1,
0.2083713, -1.282365, 4.144003, 0, 0.4235294, 1, 1,
0.2146557, 0.40821, 0.3546495, 0, 0.4196078, 1, 1,
0.2263164, -0.140508, 1.662206, 0, 0.4117647, 1, 1,
0.2267126, 0.4633506, 1.266181, 0, 0.4078431, 1, 1,
0.2272626, 1.318175, -0.7699569, 0, 0.4, 1, 1,
0.2277226, -0.1553247, 1.095377, 0, 0.3921569, 1, 1,
0.2290094, -0.6760156, 2.715708, 0, 0.3882353, 1, 1,
0.229636, 0.9125775, -2.012783, 0, 0.3803922, 1, 1,
0.2311506, -0.9897442, 2.07231, 0, 0.3764706, 1, 1,
0.2334061, 0.4239378, 1.565097, 0, 0.3686275, 1, 1,
0.2342747, 0.4115753, 1.171205, 0, 0.3647059, 1, 1,
0.2371362, -0.2137745, 2.629164, 0, 0.3568628, 1, 1,
0.2383161, -0.5529728, 3.546195, 0, 0.3529412, 1, 1,
0.2387864, -1.871389, 1.536221, 0, 0.345098, 1, 1,
0.2389746, 0.6476954, 1.230762, 0, 0.3411765, 1, 1,
0.2490201, -1.327421, 3.971675, 0, 0.3333333, 1, 1,
0.2498929, 0.7069922, -0.1351955, 0, 0.3294118, 1, 1,
0.255574, -0.1804251, 1.588024, 0, 0.3215686, 1, 1,
0.2562637, 0.6374661, 1.878517, 0, 0.3176471, 1, 1,
0.257649, 0.4172882, 0.4742651, 0, 0.3098039, 1, 1,
0.2577766, -1.678382, 3.340281, 0, 0.3058824, 1, 1,
0.2708424, 1.119452, -1.300695, 0, 0.2980392, 1, 1,
0.2714281, 0.354111, 0.6585782, 0, 0.2901961, 1, 1,
0.2714599, 0.6119074, 0.8188041, 0, 0.2862745, 1, 1,
0.2754255, -0.7734326, 1.987239, 0, 0.2784314, 1, 1,
0.2775066, 1.577259, 0.6100976, 0, 0.2745098, 1, 1,
0.2792886, 0.883004, 1.69708, 0, 0.2666667, 1, 1,
0.2829199, -0.1642871, 3.067953, 0, 0.2627451, 1, 1,
0.2902039, -0.8053902, 2.096351, 0, 0.254902, 1, 1,
0.2923522, -1.379242, 2.623181, 0, 0.2509804, 1, 1,
0.2934647, 0.208736, 3.003963, 0, 0.2431373, 1, 1,
0.3003842, -1.778042, 2.147292, 0, 0.2392157, 1, 1,
0.3021643, 1.446046, -0.6437162, 0, 0.2313726, 1, 1,
0.3022562, -1.292274, 5.136436, 0, 0.227451, 1, 1,
0.3152559, 0.4314305, -0.002847743, 0, 0.2196078, 1, 1,
0.318702, -0.5811192, 3.705088, 0, 0.2156863, 1, 1,
0.3207201, -0.07221257, 3.641164, 0, 0.2078431, 1, 1,
0.3223239, -1.298703, 4.04219, 0, 0.2039216, 1, 1,
0.3300323, 1.981767, -0.3662646, 0, 0.1960784, 1, 1,
0.3321042, -0.5101847, 4.054353, 0, 0.1882353, 1, 1,
0.3352387, 0.3540049, 0.4228071, 0, 0.1843137, 1, 1,
0.3404122, 2.318913, -0.4090891, 0, 0.1764706, 1, 1,
0.3463906, 0.4420823, 2.346573, 0, 0.172549, 1, 1,
0.347792, 0.5024403, -0.6275222, 0, 0.1647059, 1, 1,
0.3518911, -0.8993019, 3.243078, 0, 0.1607843, 1, 1,
0.3520155, -0.2016758, 4.022723, 0, 0.1529412, 1, 1,
0.3586368, 0.2829602, 2.381495, 0, 0.1490196, 1, 1,
0.3603352, -2.314531, 2.035196, 0, 0.1411765, 1, 1,
0.3638145, -0.4233199, 1.791777, 0, 0.1372549, 1, 1,
0.3654676, -0.5402088, 0.9860181, 0, 0.1294118, 1, 1,
0.3665678, 0.252628, 0.4332875, 0, 0.1254902, 1, 1,
0.368037, 1.347026, 0.9763451, 0, 0.1176471, 1, 1,
0.3680603, 0.2244177, 0.446481, 0, 0.1137255, 1, 1,
0.3699259, 1.095482, 2.068403, 0, 0.1058824, 1, 1,
0.3732423, 1.520308, 0.7144834, 0, 0.09803922, 1, 1,
0.3737262, 0.2617373, -0.3782045, 0, 0.09411765, 1, 1,
0.375489, 0.104984, 2.116614, 0, 0.08627451, 1, 1,
0.378163, -1.415746, 1.83845, 0, 0.08235294, 1, 1,
0.380721, -0.04421163, 3.350816, 0, 0.07450981, 1, 1,
0.3814515, -1.722142, 4.171456, 0, 0.07058824, 1, 1,
0.3858252, -0.9860418, 2.371031, 0, 0.0627451, 1, 1,
0.3871958, 0.4102368, 2.592475, 0, 0.05882353, 1, 1,
0.3877252, -0.6641128, 1.092998, 0, 0.05098039, 1, 1,
0.3931287, -0.3958598, 1.083748, 0, 0.04705882, 1, 1,
0.3975013, 1.674696, 0.3669418, 0, 0.03921569, 1, 1,
0.4020775, -1.928046, 3.527093, 0, 0.03529412, 1, 1,
0.4028558, -0.2188943, 1.918257, 0, 0.02745098, 1, 1,
0.4056194, -0.7531779, 3.7725, 0, 0.02352941, 1, 1,
0.406802, 0.1408608, 1.2674, 0, 0.01568628, 1, 1,
0.4103019, -0.1119502, 1.237244, 0, 0.01176471, 1, 1,
0.4122328, -0.2745595, 1.292706, 0, 0.003921569, 1, 1,
0.4181484, -0.2959937, 3.61192, 0.003921569, 0, 1, 1,
0.4194139, -0.1139532, 2.912371, 0.007843138, 0, 1, 1,
0.4203309, 0.07778672, 0.6121243, 0.01568628, 0, 1, 1,
0.4269581, 1.143422, 0.3988246, 0.01960784, 0, 1, 1,
0.4287842, -0.7214485, 4.01068, 0.02745098, 0, 1, 1,
0.4294976, -0.6289614, 1.713709, 0.03137255, 0, 1, 1,
0.4391806, -0.8249054, 1.330395, 0.03921569, 0, 1, 1,
0.4413632, 0.3950491, 0.5131036, 0.04313726, 0, 1, 1,
0.4445395, -0.7262783, 2.7874, 0.05098039, 0, 1, 1,
0.4476015, -0.9380584, 1.897201, 0.05490196, 0, 1, 1,
0.4555495, -0.1884174, 2.277504, 0.0627451, 0, 1, 1,
0.4582791, -0.5922047, 3.434128, 0.06666667, 0, 1, 1,
0.4600598, 0.1691901, -0.5904313, 0.07450981, 0, 1, 1,
0.4622528, -0.5675766, 1.443772, 0.07843138, 0, 1, 1,
0.4635862, 0.8748317, -0.6682226, 0.08627451, 0, 1, 1,
0.4670444, -0.6910762, 3.695979, 0.09019608, 0, 1, 1,
0.468196, 0.2567919, 1.165558, 0.09803922, 0, 1, 1,
0.4687793, -0.1433207, 0.7723891, 0.1058824, 0, 1, 1,
0.4752423, -0.2286283, 1.331216, 0.1098039, 0, 1, 1,
0.4773595, -0.8068275, 2.346015, 0.1176471, 0, 1, 1,
0.4794388, 0.3517562, -0.6683008, 0.1215686, 0, 1, 1,
0.4852906, -1.653974, 3.063974, 0.1294118, 0, 1, 1,
0.4892617, -0.3489119, 1.778419, 0.1333333, 0, 1, 1,
0.4913273, -0.9639471, 3.311656, 0.1411765, 0, 1, 1,
0.4915304, 0.01956631, 2.06025, 0.145098, 0, 1, 1,
0.4929793, -0.2524063, 1.874999, 0.1529412, 0, 1, 1,
0.4943348, 0.3186859, 0.7567366, 0.1568628, 0, 1, 1,
0.4954982, -0.701646, 3.09142, 0.1647059, 0, 1, 1,
0.4967485, -1.285286, 3.361683, 0.1686275, 0, 1, 1,
0.4968243, -1.147288, 2.030997, 0.1764706, 0, 1, 1,
0.4976262, -0.287817, 1.280114, 0.1803922, 0, 1, 1,
0.4978205, -0.3058671, 2.087115, 0.1882353, 0, 1, 1,
0.5116417, 1.505411, 1.703505, 0.1921569, 0, 1, 1,
0.5116455, -1.226516, 1.794169, 0.2, 0, 1, 1,
0.5125392, -0.3726582, 3.683708, 0.2078431, 0, 1, 1,
0.5171866, -0.9281861, 3.550647, 0.2117647, 0, 1, 1,
0.5199217, -0.2698491, 1.670065, 0.2196078, 0, 1, 1,
0.5212959, 1.223509, 1.091718, 0.2235294, 0, 1, 1,
0.5226044, 0.06599813, 3.65293, 0.2313726, 0, 1, 1,
0.5229005, 1.889561, -0.7821404, 0.2352941, 0, 1, 1,
0.5257795, -2.218645, 3.348828, 0.2431373, 0, 1, 1,
0.5299387, -0.2415889, 1.682477, 0.2470588, 0, 1, 1,
0.5316478, 0.7447538, 1.781674, 0.254902, 0, 1, 1,
0.5400807, -0.7671744, 2.313728, 0.2588235, 0, 1, 1,
0.5461646, -0.8938625, 4.231188, 0.2666667, 0, 1, 1,
0.546315, -0.1209594, 0.2165333, 0.2705882, 0, 1, 1,
0.5588008, 0.8372319, -0.2865004, 0.2784314, 0, 1, 1,
0.5620263, -0.2438798, 1.026945, 0.282353, 0, 1, 1,
0.5654142, -0.6548125, 2.997717, 0.2901961, 0, 1, 1,
0.5696998, 0.7956002, 0.5364431, 0.2941177, 0, 1, 1,
0.5714343, 0.7356269, 0.4629156, 0.3019608, 0, 1, 1,
0.5720939, 0.2087875, 0.384146, 0.3098039, 0, 1, 1,
0.5771624, -0.04720845, 2.779184, 0.3137255, 0, 1, 1,
0.5780303, -1.435117, 1.281903, 0.3215686, 0, 1, 1,
0.5784376, -0.01875013, 2.628452, 0.3254902, 0, 1, 1,
0.5795335, -0.7279302, 3.374738, 0.3333333, 0, 1, 1,
0.580032, -1.057483, 2.244348, 0.3372549, 0, 1, 1,
0.5821412, -0.7636037, 3.360541, 0.345098, 0, 1, 1,
0.583143, -0.05452448, 1.396138, 0.3490196, 0, 1, 1,
0.5945759, -0.4572204, 1.920431, 0.3568628, 0, 1, 1,
0.5961013, -0.6916012, 2.110508, 0.3607843, 0, 1, 1,
0.598639, -0.5071716, 1.358937, 0.3686275, 0, 1, 1,
0.6024134, -0.6356766, 4.188233, 0.372549, 0, 1, 1,
0.6044977, -0.4554825, 2.236109, 0.3803922, 0, 1, 1,
0.6067089, 0.3787324, 0.8151557, 0.3843137, 0, 1, 1,
0.607813, 0.464251, -0.4815601, 0.3921569, 0, 1, 1,
0.60783, 1.149096, -0.2816355, 0.3960784, 0, 1, 1,
0.6121199, -0.02286348, 1.278685, 0.4039216, 0, 1, 1,
0.6133398, -1.811027, 4.254925, 0.4117647, 0, 1, 1,
0.6134488, -1.094798, 4.324613, 0.4156863, 0, 1, 1,
0.6164446, 0.9148078, 0.3153425, 0.4235294, 0, 1, 1,
0.6192308, -0.5130684, 1.689378, 0.427451, 0, 1, 1,
0.6202247, 0.07318656, -0.3956206, 0.4352941, 0, 1, 1,
0.6205974, -0.63946, 2.77591, 0.4392157, 0, 1, 1,
0.6226046, 1.409757, -1.183191, 0.4470588, 0, 1, 1,
0.6228225, 0.4941895, 1.197379, 0.4509804, 0, 1, 1,
0.624956, -0.2711522, 1.717159, 0.4588235, 0, 1, 1,
0.6296007, 1.457491, -0.3186705, 0.4627451, 0, 1, 1,
0.6311681, 0.2532552, 0.5512146, 0.4705882, 0, 1, 1,
0.631362, -2.655007, 4.498661, 0.4745098, 0, 1, 1,
0.6335441, 0.743886, -0.2998697, 0.4823529, 0, 1, 1,
0.6373972, -1.553607, 3.216752, 0.4862745, 0, 1, 1,
0.6382734, -0.2703174, 1.053236, 0.4941176, 0, 1, 1,
0.6418685, 2.129109, -1.322374, 0.5019608, 0, 1, 1,
0.6423917, 0.1954335, 2.040195, 0.5058824, 0, 1, 1,
0.6440204, -0.6694808, 3.654591, 0.5137255, 0, 1, 1,
0.6469364, -0.3975631, 1.200184, 0.5176471, 0, 1, 1,
0.6510871, -0.28108, 1.021232, 0.5254902, 0, 1, 1,
0.6527091, -0.8248569, 3.323836, 0.5294118, 0, 1, 1,
0.6562775, 0.3487701, 1.829822, 0.5372549, 0, 1, 1,
0.6569529, 0.315845, 3.17689, 0.5411765, 0, 1, 1,
0.6588159, -0.3515105, 1.711389, 0.5490196, 0, 1, 1,
0.6639581, -0.3808369, 0.2842302, 0.5529412, 0, 1, 1,
0.6670868, -1.775747, 2.578936, 0.5607843, 0, 1, 1,
0.6676588, 1.116002, -1.473365, 0.5647059, 0, 1, 1,
0.6679859, -1.145431, 2.379533, 0.572549, 0, 1, 1,
0.6681468, 0.1688316, 0.7615302, 0.5764706, 0, 1, 1,
0.6739119, -1.300818, 1.566408, 0.5843138, 0, 1, 1,
0.676639, -0.2876424, 3.118771, 0.5882353, 0, 1, 1,
0.6780573, 0.6403334, -0.393966, 0.5960785, 0, 1, 1,
0.6782212, 0.2358524, 0.6725349, 0.6039216, 0, 1, 1,
0.6786956, -0.7106627, 3.11575, 0.6078432, 0, 1, 1,
0.6817278, 0.2868846, 0.3565871, 0.6156863, 0, 1, 1,
0.6825033, 0.8797674, 1.433136, 0.6196079, 0, 1, 1,
0.6880921, 0.8041253, 1.012874, 0.627451, 0, 1, 1,
0.6905307, 1.552143, -1.419962, 0.6313726, 0, 1, 1,
0.6952039, 2.88357, 0.6724951, 0.6392157, 0, 1, 1,
0.7014879, 0.600832, 1.375674, 0.6431373, 0, 1, 1,
0.7033407, 0.3745678, 2.310671, 0.6509804, 0, 1, 1,
0.7057123, 1.258465, 0.125108, 0.654902, 0, 1, 1,
0.7059226, 1.583664, 0.2232895, 0.6627451, 0, 1, 1,
0.7104811, 0.6098433, 1.773726, 0.6666667, 0, 1, 1,
0.7339361, 0.3024766, 2.245667, 0.6745098, 0, 1, 1,
0.7395211, 0.9286796, 1.395667, 0.6784314, 0, 1, 1,
0.7410278, 0.6537445, 2.774985, 0.6862745, 0, 1, 1,
0.7421119, -0.6898353, 2.457249, 0.6901961, 0, 1, 1,
0.7529162, -0.3344737, 3.808708, 0.6980392, 0, 1, 1,
0.7562999, 0.681066, 0.9122013, 0.7058824, 0, 1, 1,
0.7619673, 2.334672, 0.4148218, 0.7098039, 0, 1, 1,
0.7629079, 1.17134, 0.8051126, 0.7176471, 0, 1, 1,
0.7631928, -1.010969, 2.944474, 0.7215686, 0, 1, 1,
0.7632908, 1.48237, 1.624649, 0.7294118, 0, 1, 1,
0.7646236, 0.1489097, 1.474111, 0.7333333, 0, 1, 1,
0.7680715, 0.4650633, 2.665414, 0.7411765, 0, 1, 1,
0.7694684, -0.6977174, 2.103133, 0.7450981, 0, 1, 1,
0.773206, -0.4177798, 2.868367, 0.7529412, 0, 1, 1,
0.7735862, 1.458149, -0.472067, 0.7568628, 0, 1, 1,
0.7849842, 0.9708067, 1.083962, 0.7647059, 0, 1, 1,
0.7850121, -1.724898, 3.792223, 0.7686275, 0, 1, 1,
0.7915246, -0.3010197, 0.1280791, 0.7764706, 0, 1, 1,
0.7923198, 1.39974, -0.6259901, 0.7803922, 0, 1, 1,
0.7933713, 0.313734, 2.524981, 0.7882353, 0, 1, 1,
0.7976589, 0.002785699, 2.605316, 0.7921569, 0, 1, 1,
0.7999418, 0.8866233, 1.90579, 0.8, 0, 1, 1,
0.8050231, 0.444319, 0.2328592, 0.8078431, 0, 1, 1,
0.8072847, 1.504989, -2.147065, 0.8117647, 0, 1, 1,
0.8104059, 0.1307137, 1.237162, 0.8196079, 0, 1, 1,
0.8105102, -0.9955219, 1.332314, 0.8235294, 0, 1, 1,
0.8109035, 1.331473, 0.7576522, 0.8313726, 0, 1, 1,
0.8171243, -0.7303954, 3.121484, 0.8352941, 0, 1, 1,
0.82181, -0.1730411, 1.962988, 0.8431373, 0, 1, 1,
0.8237077, 1.386278, -0.8183349, 0.8470588, 0, 1, 1,
0.8247015, 1.855508, 1.814581, 0.854902, 0, 1, 1,
0.8257389, -2.368777, 2.954939, 0.8588235, 0, 1, 1,
0.8264819, 0.7433929, 2.840621, 0.8666667, 0, 1, 1,
0.8326538, 0.2345218, 0.226301, 0.8705882, 0, 1, 1,
0.8343484, 0.5207194, 0.1230335, 0.8784314, 0, 1, 1,
0.8351714, -0.1779446, 0.9014242, 0.8823529, 0, 1, 1,
0.8352123, -0.4303101, 3.696193, 0.8901961, 0, 1, 1,
0.8408099, -0.4940833, 2.413799, 0.8941177, 0, 1, 1,
0.8441426, -1.086159, 2.393632, 0.9019608, 0, 1, 1,
0.8450003, -1.719256, 2.425742, 0.9098039, 0, 1, 1,
0.8466629, -0.03980931, 1.298756, 0.9137255, 0, 1, 1,
0.8530174, 0.1799981, -0.2210933, 0.9215686, 0, 1, 1,
0.8562474, 0.2433664, -0.7479659, 0.9254902, 0, 1, 1,
0.86275, 0.531356, -0.5155541, 0.9333333, 0, 1, 1,
0.8659558, 1.302607, 2.155458, 0.9372549, 0, 1, 1,
0.8668059, -0.3214265, 3.305067, 0.945098, 0, 1, 1,
0.8682979, -0.256521, 2.451632, 0.9490196, 0, 1, 1,
0.8686672, 1.072634, -0.275836, 0.9568627, 0, 1, 1,
0.871681, -0.4597999, 2.75182, 0.9607843, 0, 1, 1,
0.8719115, -0.587391, 1.357536, 0.9686275, 0, 1, 1,
0.8727127, -0.429191, 1.831356, 0.972549, 0, 1, 1,
0.8750196, 1.330345, -0.1399775, 0.9803922, 0, 1, 1,
0.8790047, -0.5635862, 3.046641, 0.9843137, 0, 1, 1,
0.8840482, -1.235241, 1.928443, 0.9921569, 0, 1, 1,
0.8874099, 0.04030275, 0.06360122, 0.9960784, 0, 1, 1,
0.8918939, -0.6860102, 3.018926, 1, 0, 0.9960784, 1,
0.8925028, -1.209225, 2.012588, 1, 0, 0.9882353, 1,
0.8949421, -0.6662985, 2.591911, 1, 0, 0.9843137, 1,
0.9070975, 1.310332, -0.9794509, 1, 0, 0.9764706, 1,
0.9079174, 0.3941691, 3.138241, 1, 0, 0.972549, 1,
0.9218928, -0.8490244, 3.095202, 1, 0, 0.9647059, 1,
0.9232463, -0.3617812, 2.176599, 1, 0, 0.9607843, 1,
0.9365156, -0.9956018, 1.770838, 1, 0, 0.9529412, 1,
0.9388406, -1.00329, 3.182051, 1, 0, 0.9490196, 1,
0.9407732, -0.7129924, 2.134151, 1, 0, 0.9411765, 1,
0.9469621, -0.4798648, 2.355498, 1, 0, 0.9372549, 1,
0.952189, 0.4899714, 1.42864, 1, 0, 0.9294118, 1,
0.9531782, -1.56077, 1.414612, 1, 0, 0.9254902, 1,
0.9608066, -0.151896, 2.056632, 1, 0, 0.9176471, 1,
0.9662298, -0.4588655, 2.187741, 1, 0, 0.9137255, 1,
0.9682867, -1.210589, 2.700945, 1, 0, 0.9058824, 1,
0.9721901, -0.6034648, 0.3935048, 1, 0, 0.9019608, 1,
0.9762533, -0.8163298, 2.683504, 1, 0, 0.8941177, 1,
0.9801053, 0.8727937, 0.7110337, 1, 0, 0.8862745, 1,
0.9829848, -1.090939, 2.649254, 1, 0, 0.8823529, 1,
0.9853111, 1.30761, 0.01105866, 1, 0, 0.8745098, 1,
0.9910306, -1.069528, 2.798265, 1, 0, 0.8705882, 1,
0.9944211, -0.8207998, 1.569028, 1, 0, 0.8627451, 1,
0.9987868, 0.9225541, 0.09094559, 1, 0, 0.8588235, 1,
1.003888, 0.2836212, 2.885387, 1, 0, 0.8509804, 1,
1.006055, -0.3899721, 3.322564, 1, 0, 0.8470588, 1,
1.012419, -2.723434, 3.515481, 1, 0, 0.8392157, 1,
1.015116, 0.2674519, 0.3385728, 1, 0, 0.8352941, 1,
1.019055, 0.96233, 0.8737128, 1, 0, 0.827451, 1,
1.019866, 1.244187, 0.9046748, 1, 0, 0.8235294, 1,
1.025661, -0.4129398, 2.918152, 1, 0, 0.8156863, 1,
1.027081, 1.857771, 1.593853, 1, 0, 0.8117647, 1,
1.028279, 1.849958, 1.460179, 1, 0, 0.8039216, 1,
1.030702, 0.5627953, -0.1724994, 1, 0, 0.7960784, 1,
1.032558, -0.08908263, 0.03572327, 1, 0, 0.7921569, 1,
1.033886, -0.5884746, 1.790213, 1, 0, 0.7843137, 1,
1.040509, -1.233562, 2.796819, 1, 0, 0.7803922, 1,
1.041303, -1.52327, 4.649368, 1, 0, 0.772549, 1,
1.045748, 0.04313298, 1.558767, 1, 0, 0.7686275, 1,
1.045997, 1.519821, 1.435758, 1, 0, 0.7607843, 1,
1.047903, -0.6176878, 0.5669954, 1, 0, 0.7568628, 1,
1.061131, -0.7630059, 2.012156, 1, 0, 0.7490196, 1,
1.062875, 0.3492838, 0.4295785, 1, 0, 0.7450981, 1,
1.064712, -0.2266995, 1.744186, 1, 0, 0.7372549, 1,
1.066177, -0.6847622, 1.062584, 1, 0, 0.7333333, 1,
1.068051, -0.08103891, 3.011482, 1, 0, 0.7254902, 1,
1.074389, 0.5259963, 1.219672, 1, 0, 0.7215686, 1,
1.093165, 0.7356479, -0.4460198, 1, 0, 0.7137255, 1,
1.099334, 0.4215447, -1.783326, 1, 0, 0.7098039, 1,
1.100062, -0.8779922, 2.935735, 1, 0, 0.7019608, 1,
1.104683, 0.6459399, 0.8706833, 1, 0, 0.6941177, 1,
1.105661, -0.3282302, -0.5511672, 1, 0, 0.6901961, 1,
1.116871, -1.45336, 2.41189, 1, 0, 0.682353, 1,
1.136915, -0.6579995, 3.118807, 1, 0, 0.6784314, 1,
1.149547, 0.7072797, 0.98093, 1, 0, 0.6705883, 1,
1.153889, -0.2118085, 2.621564, 1, 0, 0.6666667, 1,
1.175497, 1.10813, 0.7463456, 1, 0, 0.6588235, 1,
1.180047, 0.1083613, 2.396786, 1, 0, 0.654902, 1,
1.180334, 1.069002, -0.3797544, 1, 0, 0.6470588, 1,
1.190259, 1.595842, 1.454308, 1, 0, 0.6431373, 1,
1.204093, 1.695833, -0.7486383, 1, 0, 0.6352941, 1,
1.204116, 0.4398598, 1.889449, 1, 0, 0.6313726, 1,
1.206202, -0.08676709, 1.455306, 1, 0, 0.6235294, 1,
1.216255, -0.08671395, 1.894974, 1, 0, 0.6196079, 1,
1.222935, -0.4350436, 1.111852, 1, 0, 0.6117647, 1,
1.229375, 0.3026199, 1.417531, 1, 0, 0.6078432, 1,
1.230578, -0.1072989, 2.465992, 1, 0, 0.6, 1,
1.236139, -1.231014, 2.557535, 1, 0, 0.5921569, 1,
1.238064, 1.084568, 0.8079119, 1, 0, 0.5882353, 1,
1.243571, -0.1355786, 1.212102, 1, 0, 0.5803922, 1,
1.252253, -0.4155045, 2.913833, 1, 0, 0.5764706, 1,
1.255043, 0.8501131, 1.19781, 1, 0, 0.5686275, 1,
1.257355, -0.7692652, 1.535066, 1, 0, 0.5647059, 1,
1.259898, -0.4235275, 1.889055, 1, 0, 0.5568628, 1,
1.282675, -0.7913284, 3.072221, 1, 0, 0.5529412, 1,
1.283692, -1.162274, 2.816034, 1, 0, 0.5450981, 1,
1.288265, 0.6904743, 1.401112, 1, 0, 0.5411765, 1,
1.29202, 0.6468259, 0.01626601, 1, 0, 0.5333334, 1,
1.305797, -1.7614, 2.672681, 1, 0, 0.5294118, 1,
1.319371, 0.6069542, 1.527331, 1, 0, 0.5215687, 1,
1.31988, 0.948709, 0.6864193, 1, 0, 0.5176471, 1,
1.320495, 0.8364675, -1.063843, 1, 0, 0.509804, 1,
1.3277, 2.14698, -0.760322, 1, 0, 0.5058824, 1,
1.332759, -1.87892, 2.537203, 1, 0, 0.4980392, 1,
1.334351, -1.094397, 2.260118, 1, 0, 0.4901961, 1,
1.335844, -0.02979022, 2.46765, 1, 0, 0.4862745, 1,
1.340469, -0.5548639, 1.160725, 1, 0, 0.4784314, 1,
1.342662, -0.1285485, 0.5703178, 1, 0, 0.4745098, 1,
1.353407, -0.1134076, 2.68654, 1, 0, 0.4666667, 1,
1.357658, 0.3592507, 2.341414, 1, 0, 0.4627451, 1,
1.35837, -0.2502119, 1.256225, 1, 0, 0.454902, 1,
1.364177, 1.7413, 1.750731, 1, 0, 0.4509804, 1,
1.369343, 0.4184442, 0.6188765, 1, 0, 0.4431373, 1,
1.369457, -0.2398019, 1.259736, 1, 0, 0.4392157, 1,
1.376604, -1.137521, 2.424149, 1, 0, 0.4313726, 1,
1.380689, 0.6724749, -0.7481535, 1, 0, 0.427451, 1,
1.39098, 0.6739292, 1.234872, 1, 0, 0.4196078, 1,
1.393225, -0.4587457, 2.154941, 1, 0, 0.4156863, 1,
1.401373, 0.371287, 0.5237365, 1, 0, 0.4078431, 1,
1.404253, -1.380064, 2.904669, 1, 0, 0.4039216, 1,
1.405066, -0.03721207, 1.432307, 1, 0, 0.3960784, 1,
1.417524, 0.9428982, 0.9587224, 1, 0, 0.3882353, 1,
1.418149, -2.349803, 3.603347, 1, 0, 0.3843137, 1,
1.423216, 0.308365, 1.525457, 1, 0, 0.3764706, 1,
1.427214, -0.01638235, 0.6856207, 1, 0, 0.372549, 1,
1.430083, -0.4156091, -0.8109644, 1, 0, 0.3647059, 1,
1.433044, 1.221416, -0.1343744, 1, 0, 0.3607843, 1,
1.457608, -0.4162399, 0.8226435, 1, 0, 0.3529412, 1,
1.4821, -0.8515311, 3.117206, 1, 0, 0.3490196, 1,
1.491985, 1.711085, -0.6352405, 1, 0, 0.3411765, 1,
1.529467, 1.643982, 1.609281, 1, 0, 0.3372549, 1,
1.540216, 0.7065535, 0.3385739, 1, 0, 0.3294118, 1,
1.540469, 0.7689816, 0.1452238, 1, 0, 0.3254902, 1,
1.543176, 0.3991078, 2.597795, 1, 0, 0.3176471, 1,
1.552402, -0.2924636, 3.742435, 1, 0, 0.3137255, 1,
1.565372, -0.7699364, 2.753034, 1, 0, 0.3058824, 1,
1.583143, -0.1836474, 2.012604, 1, 0, 0.2980392, 1,
1.595344, -1.017976, 2.517221, 1, 0, 0.2941177, 1,
1.629856, 0.4066381, 2.722399, 1, 0, 0.2862745, 1,
1.637166, -1.534297, 2.477578, 1, 0, 0.282353, 1,
1.654126, -0.789344, 3.881, 1, 0, 0.2745098, 1,
1.656116, -0.2822679, 2.735168, 1, 0, 0.2705882, 1,
1.674005, 0.02188297, 0.5181575, 1, 0, 0.2627451, 1,
1.6906, 1.171019, 1.528969, 1, 0, 0.2588235, 1,
1.691086, -0.439768, 2.252375, 1, 0, 0.2509804, 1,
1.695728, -0.3108959, 2.538407, 1, 0, 0.2470588, 1,
1.696215, 1.814922, 0.8149995, 1, 0, 0.2392157, 1,
1.699996, 0.6187693, 1.485846, 1, 0, 0.2352941, 1,
1.716403, 0.891506, 0.5982611, 1, 0, 0.227451, 1,
1.721191, 0.3091846, 1.117325, 1, 0, 0.2235294, 1,
1.728011, -0.4255587, 2.917003, 1, 0, 0.2156863, 1,
1.740577, 1.502831, 0.7255533, 1, 0, 0.2117647, 1,
1.772315, 0.5352122, -1.460442, 1, 0, 0.2039216, 1,
1.774758, -0.9863518, 2.16391, 1, 0, 0.1960784, 1,
1.787011, -1.994901, 2.347702, 1, 0, 0.1921569, 1,
1.829148, 1.475214, 0.8588433, 1, 0, 0.1843137, 1,
1.832144, -0.7533779, 2.369786, 1, 0, 0.1803922, 1,
1.851327, 1.110277, -0.662454, 1, 0, 0.172549, 1,
1.877861, -2.480839, 2.8083, 1, 0, 0.1686275, 1,
1.878142, 0.5689758, 0.8901466, 1, 0, 0.1607843, 1,
1.928567, -0.7791595, 2.326056, 1, 0, 0.1568628, 1,
1.942433, -0.2413827, 1.426275, 1, 0, 0.1490196, 1,
1.964358, -0.4290318, 0.3770318, 1, 0, 0.145098, 1,
1.96812, -1.897348, 2.657179, 1, 0, 0.1372549, 1,
1.973432, 0.4093668, 0.6130311, 1, 0, 0.1333333, 1,
1.974253, -1.403836, 3.216085, 1, 0, 0.1254902, 1,
1.976744, 1.603531, 0.02351042, 1, 0, 0.1215686, 1,
1.983826, 0.3152983, 1.470487, 1, 0, 0.1137255, 1,
2.008265, -0.4557059, 4.241091, 1, 0, 0.1098039, 1,
2.026063, -0.4928824, 2.389424, 1, 0, 0.1019608, 1,
2.039404, -0.7547978, 1.739535, 1, 0, 0.09411765, 1,
2.050954, 0.552561, 1.103664, 1, 0, 0.09019608, 1,
2.086457, -1.520279, 1.226047, 1, 0, 0.08235294, 1,
2.091327, -0.5646304, -0.2346646, 1, 0, 0.07843138, 1,
2.145141, -0.1587839, 0.493524, 1, 0, 0.07058824, 1,
2.180345, 0.1384355, 1.704347, 1, 0, 0.06666667, 1,
2.296964, -0.6046495, 4.305786, 1, 0, 0.05882353, 1,
2.325421, 1.46735, 1.484946, 1, 0, 0.05490196, 1,
2.398136, 0.9365854, 1.128756, 1, 0, 0.04705882, 1,
2.49867, 0.05625528, 3.843306, 1, 0, 0.04313726, 1,
2.561323, -0.323201, 2.533262, 1, 0, 0.03529412, 1,
2.564681, 0.1994887, 1.396139, 1, 0, 0.03137255, 1,
2.565336, -0.8588282, 1.265935, 1, 0, 0.02352941, 1,
2.589481, 0.8159307, -0.6996896, 1, 0, 0.01960784, 1,
2.6423, -0.2794046, 1.403607, 1, 0, 0.01176471, 1,
3.279279, -0.6869606, 1.595349, 1, 0, 0.007843138, 1
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
0.1688966, -5.422271, -7.737136, 0, -0.5, 0.5, 0.5,
0.1688966, -5.422271, -7.737136, 1, -0.5, 0.5, 0.5,
0.1688966, -5.422271, -7.737136, 1, 1.5, 0.5, 0.5,
0.1688966, -5.422271, -7.737136, 0, 1.5, 0.5, 0.5
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
-3.995906, -0.1697061, -7.737136, 0, -0.5, 0.5, 0.5,
-3.995906, -0.1697061, -7.737136, 1, -0.5, 0.5, 0.5,
-3.995906, -0.1697061, -7.737136, 1, 1.5, 0.5, 0.5,
-3.995906, -0.1697061, -7.737136, 0, 1.5, 0.5, 0.5
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
-3.995906, -5.422271, -0.230824, 0, -0.5, 0.5, 0.5,
-3.995906, -5.422271, -0.230824, 1, -0.5, 0.5, 0.5,
-3.995906, -5.422271, -0.230824, 1, 1.5, 0.5, 0.5,
-3.995906, -5.422271, -0.230824, 0, 1.5, 0.5, 0.5
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
-2, -4.21014, -6.00491,
3, -4.21014, -6.00491,
-2, -4.21014, -6.00491,
-2, -4.412162, -6.293614,
-1, -4.21014, -6.00491,
-1, -4.412162, -6.293614,
0, -4.21014, -6.00491,
0, -4.412162, -6.293614,
1, -4.21014, -6.00491,
1, -4.412162, -6.293614,
2, -4.21014, -6.00491,
2, -4.412162, -6.293614,
3, -4.21014, -6.00491,
3, -4.412162, -6.293614
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
-2, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
-2, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
-2, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
-2, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5,
-1, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
-1, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
-1, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
-1, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5,
0, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
0, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
0, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
0, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5,
1, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
1, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
1, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
1, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5,
2, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
2, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
2, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
2, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5,
3, -4.816206, -6.871023, 0, -0.5, 0.5, 0.5,
3, -4.816206, -6.871023, 1, -0.5, 0.5, 0.5,
3, -4.816206, -6.871023, 1, 1.5, 0.5, 0.5,
3, -4.816206, -6.871023, 0, 1.5, 0.5, 0.5
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
-3.034798, -4, -6.00491,
-3.034798, 2, -6.00491,
-3.034798, -4, -6.00491,
-3.194982, -4, -6.293614,
-3.034798, -2, -6.00491,
-3.194982, -2, -6.293614,
-3.034798, 0, -6.00491,
-3.194982, 0, -6.293614,
-3.034798, 2, -6.00491,
-3.194982, 2, -6.293614
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
"-4",
"-2",
"0",
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
-3.515352, -4, -6.871023, 0, -0.5, 0.5, 0.5,
-3.515352, -4, -6.871023, 1, -0.5, 0.5, 0.5,
-3.515352, -4, -6.871023, 1, 1.5, 0.5, 0.5,
-3.515352, -4, -6.871023, 0, 1.5, 0.5, 0.5,
-3.515352, -2, -6.871023, 0, -0.5, 0.5, 0.5,
-3.515352, -2, -6.871023, 1, -0.5, 0.5, 0.5,
-3.515352, -2, -6.871023, 1, 1.5, 0.5, 0.5,
-3.515352, -2, -6.871023, 0, 1.5, 0.5, 0.5,
-3.515352, 0, -6.871023, 0, -0.5, 0.5, 0.5,
-3.515352, 0, -6.871023, 1, -0.5, 0.5, 0.5,
-3.515352, 0, -6.871023, 1, 1.5, 0.5, 0.5,
-3.515352, 0, -6.871023, 0, 1.5, 0.5, 0.5,
-3.515352, 2, -6.871023, 0, -0.5, 0.5, 0.5,
-3.515352, 2, -6.871023, 1, -0.5, 0.5, 0.5,
-3.515352, 2, -6.871023, 1, 1.5, 0.5, 0.5,
-3.515352, 2, -6.871023, 0, 1.5, 0.5, 0.5
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
-3.034798, -4.21014, -4,
-3.034798, -4.21014, 4,
-3.034798, -4.21014, -4,
-3.194982, -4.412162, -4,
-3.034798, -4.21014, -2,
-3.194982, -4.412162, -2,
-3.034798, -4.21014, 0,
-3.194982, -4.412162, 0,
-3.034798, -4.21014, 2,
-3.194982, -4.412162, 2,
-3.034798, -4.21014, 4,
-3.194982, -4.412162, 4
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
-3.515352, -4.816206, -4, 0, -0.5, 0.5, 0.5,
-3.515352, -4.816206, -4, 1, -0.5, 0.5, 0.5,
-3.515352, -4.816206, -4, 1, 1.5, 0.5, 0.5,
-3.515352, -4.816206, -4, 0, 1.5, 0.5, 0.5,
-3.515352, -4.816206, -2, 0, -0.5, 0.5, 0.5,
-3.515352, -4.816206, -2, 1, -0.5, 0.5, 0.5,
-3.515352, -4.816206, -2, 1, 1.5, 0.5, 0.5,
-3.515352, -4.816206, -2, 0, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 0, 0, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 0, 1, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 0, 1, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 0, 0, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 2, 0, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 2, 1, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 2, 1, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 2, 0, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 4, 0, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 4, 1, -0.5, 0.5, 0.5,
-3.515352, -4.816206, 4, 1, 1.5, 0.5, 0.5,
-3.515352, -4.816206, 4, 0, 1.5, 0.5, 0.5
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
-3.034798, -4.21014, -6.00491,
-3.034798, 3.870728, -6.00491,
-3.034798, -4.21014, 5.543262,
-3.034798, 3.870728, 5.543262,
-3.034798, -4.21014, -6.00491,
-3.034798, -4.21014, 5.543262,
-3.034798, 3.870728, -6.00491,
-3.034798, 3.870728, 5.543262,
-3.034798, -4.21014, -6.00491,
3.372591, -4.21014, -6.00491,
-3.034798, -4.21014, 5.543262,
3.372591, -4.21014, 5.543262,
-3.034798, 3.870728, -6.00491,
3.372591, 3.870728, -6.00491,
-3.034798, 3.870728, 5.543262,
3.372591, 3.870728, 5.543262,
3.372591, -4.21014, -6.00491,
3.372591, 3.870728, -6.00491,
3.372591, -4.21014, 5.543262,
3.372591, 3.870728, 5.543262,
3.372591, -4.21014, -6.00491,
3.372591, -4.21014, 5.543262,
3.372591, 3.870728, -6.00491,
3.372591, 3.870728, 5.543262
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
var radius = 8.267484;
var distance = 36.78297;
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
mvMatrix.translate( -0.1688966, 0.1697061, 0.230824 );
mvMatrix.scale( 1.395103, 1.106189, 0.7740589 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.78297);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
flumioxazin<-read.table("flumioxazin.xyz")
```

```
## Error in read.table("flumioxazin.xyz"): no lines available in input
```

```r
x<-flumioxazin$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
```

```r
y<-flumioxazin$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
```

```r
z<-flumioxazin$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
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
-2.941486, -0.3721904, -4.147739, 0, 0, 1, 1, 1,
-2.820733, -0.1493638, -1.844848, 1, 0, 0, 1, 1,
-2.76135, -1.029166, -1.344839, 1, 0, 0, 1, 1,
-2.688572, -0.7945604, -1.925815, 1, 0, 0, 1, 1,
-2.533183, -0.6978578, -2.651866, 1, 0, 0, 1, 1,
-2.529505, -1.57149, 0.1351452, 1, 0, 0, 1, 1,
-2.474121, 0.3083949, -1.723827, 0, 0, 0, 1, 1,
-2.424154, -0.2180876, -1.878672, 0, 0, 0, 1, 1,
-2.39133, -0.4360837, -3.216006, 0, 0, 0, 1, 1,
-2.235701, -0.1504544, -0.5738271, 0, 0, 0, 1, 1,
-2.214057, 0.006055925, 0.6568895, 0, 0, 0, 1, 1,
-2.212918, -0.7364587, -0.3315545, 0, 0, 0, 1, 1,
-2.175138, 0.007050413, -0.2452164, 0, 0, 0, 1, 1,
-2.14658, 0.3988302, -0.794656, 1, 1, 1, 1, 1,
-2.086493, -0.7334248, -1.516491, 1, 1, 1, 1, 1,
-2.027877, 0.6009147, -2.076574, 1, 1, 1, 1, 1,
-2.003241, 0.62103, -1.879242, 1, 1, 1, 1, 1,
-2.002923, 0.2121321, -2.202919, 1, 1, 1, 1, 1,
-1.999659, -0.5582678, -0.3181801, 1, 1, 1, 1, 1,
-1.976793, -0.3858447, -2.69816, 1, 1, 1, 1, 1,
-1.966388, 0.2342495, -2.708484, 1, 1, 1, 1, 1,
-1.965398, -1.58409, -2.018996, 1, 1, 1, 1, 1,
-1.960883, -0.1602624, -1.836495, 1, 1, 1, 1, 1,
-1.925521, -0.931106, -2.833424, 1, 1, 1, 1, 1,
-1.916209, -0.5768419, -0.07157618, 1, 1, 1, 1, 1,
-1.909357, -0.8224201, -3.713347, 1, 1, 1, 1, 1,
-1.8954, -1.677606, -1.690182, 1, 1, 1, 1, 1,
-1.881464, 0.298749, -1.230885, 1, 1, 1, 1, 1,
-1.879397, 0.9798761, -0.8214936, 0, 0, 1, 1, 1,
-1.854667, -0.2846241, -1.660849, 1, 0, 0, 1, 1,
-1.840429, -0.9901236, -0.4071356, 1, 0, 0, 1, 1,
-1.796761, 2.203419, -0.3221175, 1, 0, 0, 1, 1,
-1.775027, 0.1473562, -0.5959921, 1, 0, 0, 1, 1,
-1.767629, -1.010204, -3.130774, 1, 0, 0, 1, 1,
-1.755919, 0.2997443, -2.245207, 0, 0, 0, 1, 1,
-1.752064, -0.5709694, -2.712168, 0, 0, 0, 1, 1,
-1.750713, 1.082352, -0.8383968, 0, 0, 0, 1, 1,
-1.73522, 0.1715933, -0.5092837, 0, 0, 0, 1, 1,
-1.73152, 0.21009, 0.432534, 0, 0, 0, 1, 1,
-1.729332, -4.092458, -2.631101, 0, 0, 0, 1, 1,
-1.715724, -1.884282, -2.488849, 0, 0, 0, 1, 1,
-1.703533, 2.058692, -0.5018082, 1, 1, 1, 1, 1,
-1.668825, -1.070817, -0.5017778, 1, 1, 1, 1, 1,
-1.668159, 0.0450115, -1.502838, 1, 1, 1, 1, 1,
-1.650832, 0.02596896, -1.831279, 1, 1, 1, 1, 1,
-1.640888, 0.9621061, -1.277144, 1, 1, 1, 1, 1,
-1.627485, 0.4787425, -1.356308, 1, 1, 1, 1, 1,
-1.627127, 0.2589351, -1.512305, 1, 1, 1, 1, 1,
-1.62383, -0.2492775, -1.491807, 1, 1, 1, 1, 1,
-1.599037, 0.7481428, -2.505468, 1, 1, 1, 1, 1,
-1.584232, 0.2993979, -2.195308, 1, 1, 1, 1, 1,
-1.564245, -0.1130585, -1.936011, 1, 1, 1, 1, 1,
-1.550538, -0.8691986, -0.5296673, 1, 1, 1, 1, 1,
-1.529487, 1.165176, -0.8000309, 1, 1, 1, 1, 1,
-1.524083, -0.7274047, -1.339275, 1, 1, 1, 1, 1,
-1.522978, 0.882546, -2.11668, 1, 1, 1, 1, 1,
-1.518396, 0.6653995, 0.07425611, 0, 0, 1, 1, 1,
-1.510446, 0.7371572, -1.088937, 1, 0, 0, 1, 1,
-1.4993, -0.3729778, -1.061431, 1, 0, 0, 1, 1,
-1.497279, -1.743263, -2.139935, 1, 0, 0, 1, 1,
-1.487476, 1.421726, 0.2499939, 1, 0, 0, 1, 1,
-1.474241, 1.435312, -1.398603, 1, 0, 0, 1, 1,
-1.472391, 1.218358, -2.727766, 0, 0, 0, 1, 1,
-1.471842, 0.1028632, -2.188105, 0, 0, 0, 1, 1,
-1.460182, 0.4471301, -2.198771, 0, 0, 0, 1, 1,
-1.456282, -0.01997524, -0.284671, 0, 0, 0, 1, 1,
-1.446105, 0.8378443, -3.918385, 0, 0, 0, 1, 1,
-1.44504, -0.4375491, -4.440267, 0, 0, 0, 1, 1,
-1.430039, -0.30977, -1.921558, 0, 0, 0, 1, 1,
-1.423866, 0.5147437, -0.6064547, 1, 1, 1, 1, 1,
-1.410223, -0.6795699, -2.106533, 1, 1, 1, 1, 1,
-1.405614, 1.236966, -2.07196, 1, 1, 1, 1, 1,
-1.395207, 0.4942762, 0.7716382, 1, 1, 1, 1, 1,
-1.393872, 0.8644605, -1.247339, 1, 1, 1, 1, 1,
-1.389666, 0.9327284, 0.3929272, 1, 1, 1, 1, 1,
-1.372811, -1.697542, -3.2116, 1, 1, 1, 1, 1,
-1.356578, 0.7336118, -2.112517, 1, 1, 1, 1, 1,
-1.347774, 1.244816, -1.886614, 1, 1, 1, 1, 1,
-1.340466, 0.136373, -0.1568718, 1, 1, 1, 1, 1,
-1.33035, 1.085122, -2.038151, 1, 1, 1, 1, 1,
-1.328717, -1.095982, -1.904864, 1, 1, 1, 1, 1,
-1.321396, -0.7982066, -3.64472, 1, 1, 1, 1, 1,
-1.319612, -0.8831226, -2.209735, 1, 1, 1, 1, 1,
-1.311538, -1.358632, -2.915909, 1, 1, 1, 1, 1,
-1.310854, -1.386864, -2.235569, 0, 0, 1, 1, 1,
-1.306024, -1.769118, -2.424237, 1, 0, 0, 1, 1,
-1.29192, 0.4616363, -0.09466984, 1, 0, 0, 1, 1,
-1.289296, 1.082293, 0.2342598, 1, 0, 0, 1, 1,
-1.288696, 1.671957, -0.213595, 1, 0, 0, 1, 1,
-1.288272, -0.9410103, -1.340701, 1, 0, 0, 1, 1,
-1.275732, 0.16465, -2.641433, 0, 0, 0, 1, 1,
-1.274962, 1.374058, 1.434645, 0, 0, 0, 1, 1,
-1.274064, -0.03410555, -2.74827, 0, 0, 0, 1, 1,
-1.268613, -1.293746, -3.045692, 0, 0, 0, 1, 1,
-1.264846, 2.615217, -2.537629, 0, 0, 0, 1, 1,
-1.251997, 0.6452073, -0.2377236, 0, 0, 0, 1, 1,
-1.241581, 0.1424928, -2.611709, 0, 0, 0, 1, 1,
-1.235589, 0.9846101, -0.943249, 1, 1, 1, 1, 1,
-1.208862, 1.119857, -1.437481, 1, 1, 1, 1, 1,
-1.207793, -0.06087922, 0.3796118, 1, 1, 1, 1, 1,
-1.197769, 0.6893789, -0.09094918, 1, 1, 1, 1, 1,
-1.196666, -1.381796, -2.656167, 1, 1, 1, 1, 1,
-1.195435, -1.215449, -1.626629, 1, 1, 1, 1, 1,
-1.194708, 2.520297, -0.7068364, 1, 1, 1, 1, 1,
-1.179348, 1.222461, -1.738869, 1, 1, 1, 1, 1,
-1.179137, 0.9822056, -1.320979, 1, 1, 1, 1, 1,
-1.170786, 1.459952, -1.542546, 1, 1, 1, 1, 1,
-1.170684, 0.480542, -2.465451, 1, 1, 1, 1, 1,
-1.16284, -0.8100876, -0.5458907, 1, 1, 1, 1, 1,
-1.14711, -0.3404167, -4.173717, 1, 1, 1, 1, 1,
-1.142131, -1.415591, -1.364146, 1, 1, 1, 1, 1,
-1.138525, 1.111008, -0.5489137, 1, 1, 1, 1, 1,
-1.129526, -0.4742485, -2.138585, 0, 0, 1, 1, 1,
-1.122689, -0.03254981, -1.946729, 1, 0, 0, 1, 1,
-1.113289, 0.1145297, -0.6327134, 1, 0, 0, 1, 1,
-1.101375, -0.5002574, -3.810165, 1, 0, 0, 1, 1,
-1.097528, -0.3294039, -3.018101, 1, 0, 0, 1, 1,
-1.097515, 0.005225574, -3.065046, 1, 0, 0, 1, 1,
-1.087017, 0.3611625, -2.105329, 0, 0, 0, 1, 1,
-1.076812, -2.398469, -3.623847, 0, 0, 0, 1, 1,
-1.073599, -0.1379738, -2.134541, 0, 0, 0, 1, 1,
-1.072569, 1.532062, -1.827424, 0, 0, 0, 1, 1,
-1.071559, 0.696932, -1.217103, 0, 0, 0, 1, 1,
-1.059898, -0.1896686, -1.89247, 0, 0, 0, 1, 1,
-1.050238, 0.05468429, -1.460202, 0, 0, 0, 1, 1,
-1.047451, -0.6306182, -2.554679, 1, 1, 1, 1, 1,
-1.046165, 0.6400754, 1.077959, 1, 1, 1, 1, 1,
-1.032416, 1.20575, -1.5084, 1, 1, 1, 1, 1,
-1.024823, -0.344531, -1.839621, 1, 1, 1, 1, 1,
-1.022288, -1.319549, -2.073994, 1, 1, 1, 1, 1,
-1.022173, 0.3218895, -0.9374548, 1, 1, 1, 1, 1,
-1.021497, 0.6149068, -2.218281, 1, 1, 1, 1, 1,
-1.020622, -1.310842, -2.453014, 1, 1, 1, 1, 1,
-1.016, -1.632629, -2.92924, 1, 1, 1, 1, 1,
-1.0117, -0.482679, -1.333663, 1, 1, 1, 1, 1,
-0.9945124, -0.7192135, -2.082611, 1, 1, 1, 1, 1,
-0.9932308, 1.226877, -0.4005987, 1, 1, 1, 1, 1,
-0.9882556, -0.8626984, -1.980464, 1, 1, 1, 1, 1,
-0.9804513, 0.4448341, -0.7252653, 1, 1, 1, 1, 1,
-0.9587708, 0.3104187, 0.1966126, 1, 1, 1, 1, 1,
-0.9567986, -1.377515, -3.309581, 0, 0, 1, 1, 1,
-0.9557027, 0.3495986, 0.02915398, 1, 0, 0, 1, 1,
-0.9535807, -0.0497616, -3.185254, 1, 0, 0, 1, 1,
-0.953449, 0.5118573, -2.612652, 1, 0, 0, 1, 1,
-0.9533851, -0.4095219, -2.71591, 1, 0, 0, 1, 1,
-0.9527524, 0.2783446, -0.02026925, 1, 0, 0, 1, 1,
-0.9514937, 0.8062464, -2.20598, 0, 0, 0, 1, 1,
-0.9494344, -0.4724887, -3.384987, 0, 0, 0, 1, 1,
-0.9492143, 0.009914957, -1.291981, 0, 0, 0, 1, 1,
-0.9488796, -2.010173, -1.876785, 0, 0, 0, 1, 1,
-0.9480602, 0.294199, -1.306994, 0, 0, 0, 1, 1,
-0.9460123, 0.9631169, -0.9349311, 0, 0, 0, 1, 1,
-0.9399348, -1.354552, -2.342613, 0, 0, 0, 1, 1,
-0.9389942, 1.4198, -2.450556, 1, 1, 1, 1, 1,
-0.9343929, -0.0005234646, -1.04397, 1, 1, 1, 1, 1,
-0.93331, -1.622343, -1.408437, 1, 1, 1, 1, 1,
-0.9317194, -0.5416726, -1.826118, 1, 1, 1, 1, 1,
-0.9195355, 1.442407, -0.8204077, 1, 1, 1, 1, 1,
-0.9090033, 0.712378, -2.376193, 1, 1, 1, 1, 1,
-0.9011289, -0.1560251, -1.219453, 1, 1, 1, 1, 1,
-0.8988541, 1.164758, -1.017443, 1, 1, 1, 1, 1,
-0.8978701, -0.8490472, -1.034909, 1, 1, 1, 1, 1,
-0.8973701, 0.4330506, -1.310589, 1, 1, 1, 1, 1,
-0.8946509, 1.508206, 0.856702, 1, 1, 1, 1, 1,
-0.8913119, 0.4898072, -1.05322, 1, 1, 1, 1, 1,
-0.8889962, -0.6038753, -3.206881, 1, 1, 1, 1, 1,
-0.885091, 3.526647, 0.8590176, 1, 1, 1, 1, 1,
-0.8831709, 2.17788, -1.31521, 1, 1, 1, 1, 1,
-0.8812814, -1.218292, -2.448634, 0, 0, 1, 1, 1,
-0.8772478, 0.07358607, 0.4031435, 1, 0, 0, 1, 1,
-0.8707129, 0.7561048, -0.6646722, 1, 0, 0, 1, 1,
-0.8706847, 1.465278, -0.826419, 1, 0, 0, 1, 1,
-0.8687894, -0.5417222, -0.7656454, 1, 0, 0, 1, 1,
-0.8665532, -0.3663564, -1.361084, 1, 0, 0, 1, 1,
-0.8661122, 0.8857287, -2.267122, 0, 0, 0, 1, 1,
-0.8635957, 0.06418462, -1.085507, 0, 0, 0, 1, 1,
-0.8596154, -0.4062063, -1.497876, 0, 0, 0, 1, 1,
-0.8575426, -0.7013346, -1.885345, 0, 0, 0, 1, 1,
-0.8569282, 0.3555725, -0.7868664, 0, 0, 0, 1, 1,
-0.8549432, -1.726408, -4.847763, 0, 0, 0, 1, 1,
-0.8443959, -0.8600664, -1.696546, 0, 0, 0, 1, 1,
-0.8423449, -1.066893, -4.114448, 1, 1, 1, 1, 1,
-0.8383581, 0.9420463, -1.537496, 1, 1, 1, 1, 1,
-0.837225, 1.098919, -1.860508, 1, 1, 1, 1, 1,
-0.8360678, 2.128297, -0.3088672, 1, 1, 1, 1, 1,
-0.8329445, 0.5677098, -1.928973, 1, 1, 1, 1, 1,
-0.8285776, -0.132238, -2.525485, 1, 1, 1, 1, 1,
-0.8280371, -0.2906083, -1.760388, 1, 1, 1, 1, 1,
-0.8277521, 0.7954239, -0.6950325, 1, 1, 1, 1, 1,
-0.8228367, 1.00025, 0.03315643, 1, 1, 1, 1, 1,
-0.8164104, 1.157132, -0.696968, 1, 1, 1, 1, 1,
-0.8076661, -0.3114616, -1.558501, 1, 1, 1, 1, 1,
-0.8021201, -0.8937753, -2.397372, 1, 1, 1, 1, 1,
-0.8019365, 1.250606, -0.2805161, 1, 1, 1, 1, 1,
-0.7993658, -0.4488583, -2.417087, 1, 1, 1, 1, 1,
-0.7991982, -1.218104, -4.033175, 1, 1, 1, 1, 1,
-0.7949974, -0.3409981, -1.368589, 0, 0, 1, 1, 1,
-0.7894298, -0.4216765, -3.344456, 1, 0, 0, 1, 1,
-0.784008, -0.1398978, -2.669363, 1, 0, 0, 1, 1,
-0.7795545, -0.5635898, -1.996415, 1, 0, 0, 1, 1,
-0.7791454, 0.6139141, -2.09701, 1, 0, 0, 1, 1,
-0.7772982, 0.5412986, -0.2041088, 1, 0, 0, 1, 1,
-0.7731598, 0.2707632, -0.6040038, 0, 0, 0, 1, 1,
-0.7714376, 1.36953, -0.4453838, 0, 0, 0, 1, 1,
-0.7647914, 1.350615, -0.3910022, 0, 0, 0, 1, 1,
-0.7535983, 1.613997, -1.495182, 0, 0, 0, 1, 1,
-0.7491795, 0.6894258, 0.5006422, 0, 0, 0, 1, 1,
-0.7476794, -1.516165, -1.988653, 0, 0, 0, 1, 1,
-0.7456868, 0.6126953, -1.055865, 0, 0, 0, 1, 1,
-0.7390708, 2.253706, -2.038716, 1, 1, 1, 1, 1,
-0.7333221, 0.2496688, -0.6028023, 1, 1, 1, 1, 1,
-0.7332178, -0.6441651, -2.416793, 1, 1, 1, 1, 1,
-0.7282552, 0.2275477, -1.784327, 1, 1, 1, 1, 1,
-0.7275414, -0.869989, -3.351757, 1, 1, 1, 1, 1,
-0.7274857, 1.356495, -0.4005409, 1, 1, 1, 1, 1,
-0.7274265, 0.2268403, -1.251604, 1, 1, 1, 1, 1,
-0.7246051, -0.9188236, -3.212942, 1, 1, 1, 1, 1,
-0.722743, -0.1028843, -1.413493, 1, 1, 1, 1, 1,
-0.7208599, 2.634927, -0.8412638, 1, 1, 1, 1, 1,
-0.7192872, -1.277735, -3.338889, 1, 1, 1, 1, 1,
-0.7177858, -0.7990193, -1.58787, 1, 1, 1, 1, 1,
-0.7167, -0.6041991, -0.4189935, 1, 1, 1, 1, 1,
-0.7156762, -0.8479841, -1.835284, 1, 1, 1, 1, 1,
-0.7147556, 0.9521869, -0.6884885, 1, 1, 1, 1, 1,
-0.7086756, -1.169741, -1.42327, 0, 0, 1, 1, 1,
-0.7071693, -2.260741, -0.6386636, 1, 0, 0, 1, 1,
-0.7069532, 0.383693, -0.7899883, 1, 0, 0, 1, 1,
-0.7055307, -0.6797909, -2.852064, 1, 0, 0, 1, 1,
-0.6979821, 0.3384869, -2.537665, 1, 0, 0, 1, 1,
-0.6967291, -1.27809, -4.066569, 1, 0, 0, 1, 1,
-0.6797482, 0.6085433, -1.074997, 0, 0, 0, 1, 1,
-0.6788874, 0.5926285, -2.087993, 0, 0, 0, 1, 1,
-0.6698275, 0.7403704, -1.207086, 0, 0, 0, 1, 1,
-0.6683413, 0.6031595, -0.887267, 0, 0, 0, 1, 1,
-0.6664589, -1.179817, -3.572227, 0, 0, 0, 1, 1,
-0.665825, -1.074458, -2.200004, 0, 0, 0, 1, 1,
-0.6657929, -1.514215, -2.475785, 0, 0, 0, 1, 1,
-0.6656454, -0.01984154, -1.173164, 1, 1, 1, 1, 1,
-0.6650919, 0.328919, -1.080917, 1, 1, 1, 1, 1,
-0.6606599, -1.223922, -4.088313, 1, 1, 1, 1, 1,
-0.6588476, -1.794318, -3.180764, 1, 1, 1, 1, 1,
-0.6496425, 0.3045682, -0.9472498, 1, 1, 1, 1, 1,
-0.6467441, -2.018036, -2.355482, 1, 1, 1, 1, 1,
-0.6433234, 0.5189677, -1.22652, 1, 1, 1, 1, 1,
-0.6422011, -0.5702738, -2.82312, 1, 1, 1, 1, 1,
-0.6391536, -1.114054, -3.457328, 1, 1, 1, 1, 1,
-0.637039, 1.024518, -0.768653, 1, 1, 1, 1, 1,
-0.6361061, -0.6419098, -1.456384, 1, 1, 1, 1, 1,
-0.6354233, 2.758701, -0.1884168, 1, 1, 1, 1, 1,
-0.6341968, 0.4885438, -0.8362224, 1, 1, 1, 1, 1,
-0.631941, 0.1405695, 0.1184205, 1, 1, 1, 1, 1,
-0.6300614, -0.9837835, -2.257951, 1, 1, 1, 1, 1,
-0.629777, -2.068138, -2.296398, 0, 0, 1, 1, 1,
-0.626675, 0.07360792, -1.370061, 1, 0, 0, 1, 1,
-0.6251907, -1.931834, -4.016399, 1, 0, 0, 1, 1,
-0.6250042, 0.234799, -2.851196, 1, 0, 0, 1, 1,
-0.6144494, -1.03863, -2.540292, 1, 0, 0, 1, 1,
-0.6036433, -0.4882389, -1.390132, 1, 0, 0, 1, 1,
-0.6018586, -1.005943, -2.029994, 0, 0, 0, 1, 1,
-0.5997836, -0.6677576, -2.983592, 0, 0, 0, 1, 1,
-0.5986893, -0.6198313, -1.903957, 0, 0, 0, 1, 1,
-0.590703, -1.30679, -1.835629, 0, 0, 0, 1, 1,
-0.5880722, 1.575419, -0.4582674, 0, 0, 0, 1, 1,
-0.5822923, -0.0117902, -1.72388, 0, 0, 0, 1, 1,
-0.5812015, -0.5818597, -2.40656, 0, 0, 0, 1, 1,
-0.5800603, 0.2931713, -2.236143, 1, 1, 1, 1, 1,
-0.5777142, 0.3601505, -3.351734, 1, 1, 1, 1, 1,
-0.5736014, 0.3317825, -1.675484, 1, 1, 1, 1, 1,
-0.5709499, -1.019983, -3.458513, 1, 1, 1, 1, 1,
-0.5666751, 0.7495807, 0.01125665, 1, 1, 1, 1, 1,
-0.5663376, -1.115125, -2.618232, 1, 1, 1, 1, 1,
-0.5626697, -0.3610346, -2.903117, 1, 1, 1, 1, 1,
-0.5620259, -0.930585, -3.097938, 1, 1, 1, 1, 1,
-0.552002, -1.236868, -3.409544, 1, 1, 1, 1, 1,
-0.551829, -0.1185072, -1.802833, 1, 1, 1, 1, 1,
-0.5511091, 0.958268, -0.1285451, 1, 1, 1, 1, 1,
-0.5509744, -2.392019, -3.534957, 1, 1, 1, 1, 1,
-0.5449181, 2.426433, -0.376145, 1, 1, 1, 1, 1,
-0.5387604, -1.099669, -1.098279, 1, 1, 1, 1, 1,
-0.5338727, 0.632198, -0.3542159, 1, 1, 1, 1, 1,
-0.5278782, -0.9547034, -3.372104, 0, 0, 1, 1, 1,
-0.5272461, -0.646456, -1.004735, 1, 0, 0, 1, 1,
-0.5212106, -0.8148541, -3.984929, 1, 0, 0, 1, 1,
-0.517946, -1.350979, -3.583012, 1, 0, 0, 1, 1,
-0.5150493, -0.0145901, -1.450183, 1, 0, 0, 1, 1,
-0.5116416, 1.587196, -0.5661895, 1, 0, 0, 1, 1,
-0.5102794, 1.136289, 0.5502253, 0, 0, 0, 1, 1,
-0.5094669, -0.4861763, -1.660611, 0, 0, 0, 1, 1,
-0.5033044, -0.4327883, -3.53747, 0, 0, 0, 1, 1,
-0.5032256, 0.4706725, -0.1617084, 0, 0, 0, 1, 1,
-0.5008312, 0.03202321, 0.4404537, 0, 0, 0, 1, 1,
-0.5007337, 3.169251, -0.4914034, 0, 0, 0, 1, 1,
-0.4980032, 0.7485743, 0.681869, 0, 0, 0, 1, 1,
-0.496101, -0.1555436, -2.494539, 1, 1, 1, 1, 1,
-0.4939181, 0.7495121, -0.2148295, 1, 1, 1, 1, 1,
-0.4915666, 1.934178, 0.3545474, 1, 1, 1, 1, 1,
-0.4832395, 0.411606, 0.5126414, 1, 1, 1, 1, 1,
-0.4826268, 0.7972847, -1.664657, 1, 1, 1, 1, 1,
-0.4787929, 0.3929162, -0.6360452, 1, 1, 1, 1, 1,
-0.477032, -1.186651, -3.246802, 1, 1, 1, 1, 1,
-0.4767366, 0.6942586, 0.3490157, 1, 1, 1, 1, 1,
-0.4763264, 0.3473883, 0.2555162, 1, 1, 1, 1, 1,
-0.4741421, 0.3716109, -1.438997, 1, 1, 1, 1, 1,
-0.4727578, -1.104828, -3.402865, 1, 1, 1, 1, 1,
-0.4707345, -0.5694399, -2.739828, 1, 1, 1, 1, 1,
-0.4669431, -0.8499643, -3.172548, 1, 1, 1, 1, 1,
-0.4662976, -0.4842746, -0.9658812, 1, 1, 1, 1, 1,
-0.4606126, -1.297761, -3.086811, 1, 1, 1, 1, 1,
-0.4595414, -1.562181, -1.983527, 0, 0, 1, 1, 1,
-0.4505553, 0.6808608, -2.941906, 1, 0, 0, 1, 1,
-0.4501449, 0.6686628, -1.208746, 1, 0, 0, 1, 1,
-0.4434777, 0.2322682, -2.138839, 1, 0, 0, 1, 1,
-0.4426631, 0.8846931, 0.9678511, 1, 0, 0, 1, 1,
-0.4394238, 0.5526071, 0.6866609, 1, 0, 0, 1, 1,
-0.439065, -0.6955095, -2.475142, 0, 0, 0, 1, 1,
-0.4366466, -0.8933728, -1.865803, 0, 0, 0, 1, 1,
-0.4359213, 2.252715, -1.220857, 0, 0, 0, 1, 1,
-0.4335075, -0.8440303, -4.603334, 0, 0, 0, 1, 1,
-0.4329229, -0.2871828, -4.492833, 0, 0, 0, 1, 1,
-0.426178, -1.329235, -2.041111, 0, 0, 0, 1, 1,
-0.42259, 0.5604598, -0.9404209, 0, 0, 0, 1, 1,
-0.4225804, -0.1552125, -1.142182, 1, 1, 1, 1, 1,
-0.4186779, 1.166885, 0.9185934, 1, 1, 1, 1, 1,
-0.4165604, -0.7869304, -4.12665, 1, 1, 1, 1, 1,
-0.4154694, -0.5261477, -1.807674, 1, 1, 1, 1, 1,
-0.414379, 0.7669927, -1.175669, 1, 1, 1, 1, 1,
-0.4103426, -1.210726, -2.576425, 1, 1, 1, 1, 1,
-0.4091718, 0.8326018, 0.2746997, 1, 1, 1, 1, 1,
-0.4038686, -1.157194, -2.832684, 1, 1, 1, 1, 1,
-0.402782, -0.4066619, -3.539671, 1, 1, 1, 1, 1,
-0.4026718, -2.883511, -2.873876, 1, 1, 1, 1, 1,
-0.4011241, -0.578957, -4.005467, 1, 1, 1, 1, 1,
-0.4003866, -0.4549894, -1.914434, 1, 1, 1, 1, 1,
-0.3991811, 0.09521595, -0.1428779, 1, 1, 1, 1, 1,
-0.3969423, -0.195301, 0.168003, 1, 1, 1, 1, 1,
-0.3952724, 0.3630509, -1.268959, 1, 1, 1, 1, 1,
-0.3914397, -1.07002, -1.941697, 0, 0, 1, 1, 1,
-0.3867159, 1.110039, 0.141529, 1, 0, 0, 1, 1,
-0.3860534, -2.328488, -3.177871, 1, 0, 0, 1, 1,
-0.3815449, -0.3226984, -2.217622, 1, 0, 0, 1, 1,
-0.3799694, 1.034552, -1.543524, 1, 0, 0, 1, 1,
-0.3777465, -0.1887726, -0.704771, 1, 0, 0, 1, 1,
-0.3775702, 0.5173977, -1.161844, 0, 0, 0, 1, 1,
-0.373137, 0.5304174, 0.7423588, 0, 0, 0, 1, 1,
-0.3720647, -0.5810323, -1.303149, 0, 0, 0, 1, 1,
-0.3717021, -1.363313, -1.901064, 0, 0, 0, 1, 1,
-0.3703599, 0.1586426, -2.018049, 0, 0, 0, 1, 1,
-0.3691337, -0.2106808, -1.752182, 0, 0, 0, 1, 1,
-0.3690289, -0.5592223, -1.59947, 0, 0, 0, 1, 1,
-0.3685706, 0.8214632, -0.4147722, 1, 1, 1, 1, 1,
-0.3614319, -0.718976, -3.675107, 1, 1, 1, 1, 1,
-0.3597756, 0.9760281, 0.6322356, 1, 1, 1, 1, 1,
-0.357212, 0.2548709, -2.25599, 1, 1, 1, 1, 1,
-0.3570369, 1.056095, -2.661327, 1, 1, 1, 1, 1,
-0.3501872, -0.3274965, -3.019067, 1, 1, 1, 1, 1,
-0.34658, 0.9082829, -0.3097099, 1, 1, 1, 1, 1,
-0.3432618, -0.6423546, -2.686394, 1, 1, 1, 1, 1,
-0.3408755, -0.8972396, -1.787314, 1, 1, 1, 1, 1,
-0.3354163, 0.3573267, -0.2495354, 1, 1, 1, 1, 1,
-0.3349286, -0.636247, -5.335826, 1, 1, 1, 1, 1,
-0.3334413, 0.3853761, -1.218245, 1, 1, 1, 1, 1,
-0.3290804, 0.3231905, 0.04407218, 1, 1, 1, 1, 1,
-0.3277446, 0.3475061, -1.840401, 1, 1, 1, 1, 1,
-0.323174, 0.05625838, -1.540531, 1, 1, 1, 1, 1,
-0.3187907, 0.4738083, -0.1507833, 0, 0, 1, 1, 1,
-0.3184802, 0.3399407, 0.1348104, 1, 0, 0, 1, 1,
-0.3184371, -0.3331935, -3.030674, 1, 0, 0, 1, 1,
-0.318075, 0.3524746, -1.23193, 1, 0, 0, 1, 1,
-0.3160831, -0.0746209, -1.325449, 1, 0, 0, 1, 1,
-0.3069893, 2.236639, 0.03796333, 1, 0, 0, 1, 1,
-0.3055572, 0.585161, -1.804602, 0, 0, 0, 1, 1,
-0.3007115, 0.8797901, -0.2206666, 0, 0, 0, 1, 1,
-0.299134, -0.1862515, -1.957979, 0, 0, 0, 1, 1,
-0.2963335, 0.7498853, -0.8702233, 0, 0, 0, 1, 1,
-0.293349, -0.4453082, -1.89727, 0, 0, 0, 1, 1,
-0.2892624, 1.310789, -0.9073738, 0, 0, 0, 1, 1,
-0.2855192, -1.366968, -3.051523, 0, 0, 0, 1, 1,
-0.2796563, -0.1359449, -2.266113, 1, 1, 1, 1, 1,
-0.2792901, -0.6270689, -3.561376, 1, 1, 1, 1, 1,
-0.278802, -0.04288093, -2.074145, 1, 1, 1, 1, 1,
-0.2784138, -0.145141, -2.542008, 1, 1, 1, 1, 1,
-0.2751664, 0.3949789, -1.719708, 1, 1, 1, 1, 1,
-0.273199, -0.6988178, -4.523817, 1, 1, 1, 1, 1,
-0.2729219, -0.3594569, -2.643058, 1, 1, 1, 1, 1,
-0.2671682, -1.060331, -2.758444, 1, 1, 1, 1, 1,
-0.2637596, 1.160926, 1.424713, 1, 1, 1, 1, 1,
-0.2636572, -0.00628379, -1.107898, 1, 1, 1, 1, 1,
-0.2619231, -0.7794783, -3.435906, 1, 1, 1, 1, 1,
-0.2581095, -0.2722695, -2.894592, 1, 1, 1, 1, 1,
-0.2536275, -0.8749532, -2.255775, 1, 1, 1, 1, 1,
-0.2507463, 0.03459879, -2.357639, 1, 1, 1, 1, 1,
-0.2505164, -0.5973785, -3.531112, 1, 1, 1, 1, 1,
-0.2478827, 0.3175299, 0.01730934, 0, 0, 1, 1, 1,
-0.2455553, 0.008008476, -2.353784, 1, 0, 0, 1, 1,
-0.2443688, -0.5867012, -1.482442, 1, 0, 0, 1, 1,
-0.2441068, 1.379158, -0.702895, 1, 0, 0, 1, 1,
-0.2404224, 1.464302, -0.6421257, 1, 0, 0, 1, 1,
-0.2392417, 0.5748033, -1.066516, 1, 0, 0, 1, 1,
-0.2326254, -0.4288505, -1.31968, 0, 0, 0, 1, 1,
-0.2322479, -0.9387122, -3.985753, 0, 0, 0, 1, 1,
-0.2264353, -0.5566904, -4.338478, 0, 0, 0, 1, 1,
-0.2200397, 0.1449664, -0.9795107, 0, 0, 0, 1, 1,
-0.2190197, 1.534396, 0.9118178, 0, 0, 0, 1, 1,
-0.218783, -0.6236503, -3.124663, 0, 0, 0, 1, 1,
-0.2143117, -0.5690114, -3.386795, 0, 0, 0, 1, 1,
-0.2072297, 0.5453109, -0.5050032, 1, 1, 1, 1, 1,
-0.2015437, 0.03602886, -2.184493, 1, 1, 1, 1, 1,
-0.196252, 1.46538, 1.080059, 1, 1, 1, 1, 1,
-0.1912275, -0.847644, -4.732267, 1, 1, 1, 1, 1,
-0.1898466, -0.2145562, -2.721493, 1, 1, 1, 1, 1,
-0.1884867, -0.7623231, -3.735455, 1, 1, 1, 1, 1,
-0.185676, -1.508301, -5.836733, 1, 1, 1, 1, 1,
-0.1766016, 1.909992, -0.4307708, 1, 1, 1, 1, 1,
-0.1751968, 0.4633189, 0.1997103, 1, 1, 1, 1, 1,
-0.1751806, 1.067371, 0.182156, 1, 1, 1, 1, 1,
-0.1740905, -0.9750073, -2.678413, 1, 1, 1, 1, 1,
-0.1731374, 0.847838, 0.392555, 1, 1, 1, 1, 1,
-0.1715347, 0.9589123, 1.401995, 1, 1, 1, 1, 1,
-0.1710124, 0.00872155, 2.346537, 1, 1, 1, 1, 1,
-0.1646001, 1.404453, 0.4991024, 1, 1, 1, 1, 1,
-0.1644237, -0.7616454, -2.792975, 0, 0, 1, 1, 1,
-0.1613218, 0.01137944, -0.7366307, 1, 0, 0, 1, 1,
-0.1611909, -0.9496634, -2.669129, 1, 0, 0, 1, 1,
-0.1558922, 0.6265991, -0.332458, 1, 0, 0, 1, 1,
-0.1481874, 1.557722, -1.578468, 1, 0, 0, 1, 1,
-0.1456619, 0.04375845, -0.4980228, 1, 0, 0, 1, 1,
-0.1433229, -0.3095709, -3.879234, 0, 0, 0, 1, 1,
-0.143134, 0.4429601, -0.1604315, 0, 0, 0, 1, 1,
-0.1418811, -0.6851828, -2.685719, 0, 0, 0, 1, 1,
-0.1414738, 2.068539, -0.1569483, 0, 0, 0, 1, 1,
-0.1411677, -1.218355, -3.511556, 0, 0, 0, 1, 1,
-0.1386508, -0.8296395, -4.799218, 0, 0, 0, 1, 1,
-0.1368964, 1.331797, -0.8967883, 0, 0, 0, 1, 1,
-0.1320501, 0.1252666, -0.5491595, 1, 1, 1, 1, 1,
-0.1267141, 0.9567875, 1.765756, 1, 1, 1, 1, 1,
-0.1265189, -0.1213011, -2.576151, 1, 1, 1, 1, 1,
-0.1262815, -0.1170585, -2.503526, 1, 1, 1, 1, 1,
-0.1254435, -0.08375988, -2.289539, 1, 1, 1, 1, 1,
-0.1229492, -0.2086018, -3.309023, 1, 1, 1, 1, 1,
-0.1211176, -1.719094, -3.519317, 1, 1, 1, 1, 1,
-0.1204763, -1.725445, -2.288827, 1, 1, 1, 1, 1,
-0.1201071, 1.29336, 0.1273823, 1, 1, 1, 1, 1,
-0.1179911, -2.134295, -4.230901, 1, 1, 1, 1, 1,
-0.1166675, -0.5807871, -2.176424, 1, 1, 1, 1, 1,
-0.1134188, -0.3271332, -3.996241, 1, 1, 1, 1, 1,
-0.1115968, 0.4255927, -1.409512, 1, 1, 1, 1, 1,
-0.1068379, 0.2522565, -0.197263, 1, 1, 1, 1, 1,
-0.103268, -0.009956648, -1.515135, 1, 1, 1, 1, 1,
-0.1026626, 0.06604299, 0.7338812, 0, 0, 1, 1, 1,
-0.1019871, 0.5656253, 0.6023421, 1, 0, 0, 1, 1,
-0.09963418, 1.025111, 0.4329286, 1, 0, 0, 1, 1,
-0.0932541, -0.004056664, -1.675244, 1, 0, 0, 1, 1,
-0.08946133, 0.9240771, -1.306796, 1, 0, 0, 1, 1,
-0.08622145, 1.095714, -0.3003528, 1, 0, 0, 1, 1,
-0.08479286, 0.1564562, -0.8834167, 0, 0, 0, 1, 1,
-0.08415424, 1.05863, -1.720292, 0, 0, 0, 1, 1,
-0.08127153, -0.4200229, -3.399261, 0, 0, 0, 1, 1,
-0.07906497, 0.869258, 1.275306, 0, 0, 0, 1, 1,
-0.07740658, 0.449765, 0.4382704, 0, 0, 0, 1, 1,
-0.07673301, -0.2118521, -3.12998, 0, 0, 0, 1, 1,
-0.06390009, -1.013661, -2.320671, 0, 0, 0, 1, 1,
-0.06118632, -0.1409341, -4.155174, 1, 1, 1, 1, 1,
-0.06090576, 0.6362427, 0.09250458, 1, 1, 1, 1, 1,
-0.05110097, 0.3470929, 0.8467716, 1, 1, 1, 1, 1,
-0.04939368, -2.031482, -2.565586, 1, 1, 1, 1, 1,
-0.04885809, -0.005398259, -1.654371, 1, 1, 1, 1, 1,
-0.04610599, 0.3233173, -1.64061, 1, 1, 1, 1, 1,
-0.04162655, -0.07766204, -2.086611, 1, 1, 1, 1, 1,
-0.04074852, 0.2748358, 0.3404149, 1, 1, 1, 1, 1,
-0.03945019, -0.4140352, -3.995553, 1, 1, 1, 1, 1,
-0.03940897, 0.2176473, -1.50437, 1, 1, 1, 1, 1,
-0.03704688, -0.3767123, -2.290391, 1, 1, 1, 1, 1,
-0.03696486, 3.27314, 0.8134826, 1, 1, 1, 1, 1,
-0.03601239, -1.13578, -3.783869, 1, 1, 1, 1, 1,
-0.03588273, 1.379661, -0.2966015, 1, 1, 1, 1, 1,
-0.03424894, 0.3437945, -0.1958711, 1, 1, 1, 1, 1,
-0.03320668, 0.5356699, -1.085697, 0, 0, 1, 1, 1,
-0.03227568, 0.1597923, 0.4611025, 1, 0, 0, 1, 1,
-0.02317505, -1.356648, -1.730717, 1, 0, 0, 1, 1,
-0.01990536, 1.588071, 0.5521564, 1, 0, 0, 1, 1,
-0.01624636, 0.2721375, -0.4001892, 1, 0, 0, 1, 1,
-0.01604132, -1.286377, -3.70751, 1, 0, 0, 1, 1,
-0.01247014, -0.09872921, -4.332538, 0, 0, 0, 1, 1,
0.003537521, 0.4164087, 1.363732, 0, 0, 0, 1, 1,
0.01078523, 0.4884146, -0.1808843, 0, 0, 0, 1, 1,
0.01360194, 2.169458, 0.2570668, 0, 0, 0, 1, 1,
0.01891212, -0.3092397, 2.976168, 0, 0, 0, 1, 1,
0.0192825, 0.980666, -0.8795871, 0, 0, 0, 1, 1,
0.02075728, -1.764245, 1.913755, 0, 0, 0, 1, 1,
0.02170552, -1.165294, 3.652793, 1, 1, 1, 1, 1,
0.02224387, -0.5126294, 4.498264, 1, 1, 1, 1, 1,
0.02571162, -0.6863424, 3.018435, 1, 1, 1, 1, 1,
0.02848339, -0.4076422, 3.632737, 1, 1, 1, 1, 1,
0.03080022, -1.139513, 3.278975, 1, 1, 1, 1, 1,
0.03093308, 0.123566, 0.5104851, 1, 1, 1, 1, 1,
0.03423598, -1.900761, 3.605503, 1, 1, 1, 1, 1,
0.03577261, 3.753046, -0.7277349, 1, 1, 1, 1, 1,
0.03767581, -0.4061643, 3.42754, 1, 1, 1, 1, 1,
0.04280415, 1.022929, -0.985086, 1, 1, 1, 1, 1,
0.04291048, 0.2959515, 1.203706, 1, 1, 1, 1, 1,
0.04331769, -1.946827, 3.01071, 1, 1, 1, 1, 1,
0.0444392, 1.194159, 0.6822011, 1, 1, 1, 1, 1,
0.04551764, -0.4061607, 3.771856, 1, 1, 1, 1, 1,
0.04739129, 1.239755, -1.215076, 1, 1, 1, 1, 1,
0.04821974, -0.4495192, 2.898127, 0, 0, 1, 1, 1,
0.04950508, 0.8103582, 1.551381, 1, 0, 0, 1, 1,
0.05041012, -0.1878961, 1.021937, 1, 0, 0, 1, 1,
0.05244433, 1.478692, 0.1911581, 1, 0, 0, 1, 1,
0.0550037, 0.02833897, 0.2506203, 1, 0, 0, 1, 1,
0.05503038, 0.6294321, 0.7105671, 1, 0, 0, 1, 1,
0.05668654, 0.9467832, 2.753486, 0, 0, 0, 1, 1,
0.05957521, 0.9563597, 0.2301558, 0, 0, 0, 1, 1,
0.07101643, -0.05953696, 3.189794, 0, 0, 0, 1, 1,
0.07234051, -0.1272125, 3.903071, 0, 0, 0, 1, 1,
0.07440114, -0.4577707, 2.292934, 0, 0, 0, 1, 1,
0.0762312, -1.052573, 2.458277, 0, 0, 0, 1, 1,
0.07865987, -0.008294184, 2.476363, 0, 0, 0, 1, 1,
0.08236746, -0.7069137, 5.375085, 1, 1, 1, 1, 1,
0.08388465, 0.01146035, 0.4120803, 1, 1, 1, 1, 1,
0.08561913, 0.2045764, 0.8644063, 1, 1, 1, 1, 1,
0.08899835, -0.9192863, 1.708164, 1, 1, 1, 1, 1,
0.09186678, -0.9157496, 3.432851, 1, 1, 1, 1, 1,
0.09404768, 0.358083, 0.7722892, 1, 1, 1, 1, 1,
0.09412242, 0.2516841, 0.7830031, 1, 1, 1, 1, 1,
0.09514249, -1.561201, 4.176101, 1, 1, 1, 1, 1,
0.09677526, -0.4907068, 2.169701, 1, 1, 1, 1, 1,
0.09800635, -0.4618246, 2.314435, 1, 1, 1, 1, 1,
0.1008814, -0.4117366, 3.767808, 1, 1, 1, 1, 1,
0.1013082, -2.347236, 2.870473, 1, 1, 1, 1, 1,
0.1030163, -1.55579, 2.854045, 1, 1, 1, 1, 1,
0.1042104, 1.637903, -0.1955391, 1, 1, 1, 1, 1,
0.1044626, 0.9735784, 0.4446993, 1, 1, 1, 1, 1,
0.1045171, 1.170174, 0.3876058, 0, 0, 1, 1, 1,
0.1057081, 1.010227, 0.3654688, 1, 0, 0, 1, 1,
0.1067177, 1.233315, 1.049758, 1, 0, 0, 1, 1,
0.1086516, -1.46137, 0.6819615, 1, 0, 0, 1, 1,
0.1097226, 0.4029777, -0.350837, 1, 0, 0, 1, 1,
0.1108845, 1.188979, 1.259787, 1, 0, 0, 1, 1,
0.1118764, -0.6055331, 4.19129, 0, 0, 0, 1, 1,
0.1121526, -0.6268207, 4.355432, 0, 0, 0, 1, 1,
0.1122153, -0.8940036, 3.959408, 0, 0, 0, 1, 1,
0.1132516, -1.072252, 4.483328, 0, 0, 0, 1, 1,
0.1136208, 0.5559431, 1.095208, 0, 0, 0, 1, 1,
0.1139409, 1.142729, 0.64152, 0, 0, 0, 1, 1,
0.1148379, -0.05443561, 0.7948653, 0, 0, 0, 1, 1,
0.1165699, -1.359646, 2.865901, 1, 1, 1, 1, 1,
0.1166292, -0.879374, 2.792237, 1, 1, 1, 1, 1,
0.1179263, -0.2873846, 3.125772, 1, 1, 1, 1, 1,
0.1205347, 0.1542222, 0.543091, 1, 1, 1, 1, 1,
0.1206931, -0.1785476, 1.301542, 1, 1, 1, 1, 1,
0.1220158, 0.8431114, 0.1607936, 1, 1, 1, 1, 1,
0.1226655, 0.7018203, 1.247613, 1, 1, 1, 1, 1,
0.1229267, -2.222794, 3.466607, 1, 1, 1, 1, 1,
0.1240877, 0.1831706, -0.7018805, 1, 1, 1, 1, 1,
0.1250982, 1.080254, -0.4229494, 1, 1, 1, 1, 1,
0.1253127, 0.2645823, 1.027167, 1, 1, 1, 1, 1,
0.1268957, 1.186637, -0.4010326, 1, 1, 1, 1, 1,
0.1278016, -0.8995141, 3.765762, 1, 1, 1, 1, 1,
0.1295812, 1.288733, 1.335845, 1, 1, 1, 1, 1,
0.1309161, 0.5437645, 0.08038232, 1, 1, 1, 1, 1,
0.130947, 1.643301, 1.365495, 0, 0, 1, 1, 1,
0.1333594, -0.2538452, 2.364979, 1, 0, 0, 1, 1,
0.1340869, 1.498143, -1.054793, 1, 0, 0, 1, 1,
0.1344816, -1.311134, 4.220719, 1, 0, 0, 1, 1,
0.1377718, -2.979043, 4.413326, 1, 0, 0, 1, 1,
0.1378262, 0.6466519, 0.4326469, 1, 0, 0, 1, 1,
0.1398986, -0.3804188, 3.850046, 0, 0, 0, 1, 1,
0.1431167, -0.2985482, 2.940034, 0, 0, 0, 1, 1,
0.1432797, 0.6514149, 0.7108353, 0, 0, 0, 1, 1,
0.1449846, -2.551079, 2.60976, 0, 0, 0, 1, 1,
0.1450562, -0.7234387, 2.833268, 0, 0, 0, 1, 1,
0.1498987, 1.136359, -0.7468167, 0, 0, 0, 1, 1,
0.1534789, -1.502804, 0.2189661, 0, 0, 0, 1, 1,
0.1562072, 0.9673739, -0.4626051, 1, 1, 1, 1, 1,
0.1567322, 0.02472244, 2.340168, 1, 1, 1, 1, 1,
0.1587523, 1.486039, 1.425492, 1, 1, 1, 1, 1,
0.1593907, -0.1151818, 3.131029, 1, 1, 1, 1, 1,
0.1594536, 0.1810043, -0.7770274, 1, 1, 1, 1, 1,
0.1605069, 0.08818822, 1.13231, 1, 1, 1, 1, 1,
0.160698, -1.143843, 3.460037, 1, 1, 1, 1, 1,
0.1610631, 2.260871, 1.715097, 1, 1, 1, 1, 1,
0.1688219, 1.264934, -0.09001148, 1, 1, 1, 1, 1,
0.1689305, -1.816287, 3.792599, 1, 1, 1, 1, 1,
0.1711263, -0.1010163, 2.651399, 1, 1, 1, 1, 1,
0.1756067, -0.710076, 2.750816, 1, 1, 1, 1, 1,
0.1757689, 1.089608, -0.8660555, 1, 1, 1, 1, 1,
0.1854477, 0.4681545, -0.3550714, 1, 1, 1, 1, 1,
0.1858527, 0.8115241, 0.08466151, 1, 1, 1, 1, 1,
0.1861366, -0.7826871, 2.393579, 0, 0, 1, 1, 1,
0.1910379, 0.2014555, 0.8799039, 1, 0, 0, 1, 1,
0.1946917, -1.681703, 2.135566, 1, 0, 0, 1, 1,
0.1972003, -0.2772275, 3.78142, 1, 0, 0, 1, 1,
0.198861, -0.9162425, 2.133955, 1, 0, 0, 1, 1,
0.2007855, 0.03813743, 0.5376908, 1, 0, 0, 1, 1,
0.2035636, 0.05739503, 1.024456, 0, 0, 0, 1, 1,
0.2036204, 0.8555647, 0.3988398, 0, 0, 0, 1, 1,
0.2083713, -1.282365, 4.144003, 0, 0, 0, 1, 1,
0.2146557, 0.40821, 0.3546495, 0, 0, 0, 1, 1,
0.2263164, -0.140508, 1.662206, 0, 0, 0, 1, 1,
0.2267126, 0.4633506, 1.266181, 0, 0, 0, 1, 1,
0.2272626, 1.318175, -0.7699569, 0, 0, 0, 1, 1,
0.2277226, -0.1553247, 1.095377, 1, 1, 1, 1, 1,
0.2290094, -0.6760156, 2.715708, 1, 1, 1, 1, 1,
0.229636, 0.9125775, -2.012783, 1, 1, 1, 1, 1,
0.2311506, -0.9897442, 2.07231, 1, 1, 1, 1, 1,
0.2334061, 0.4239378, 1.565097, 1, 1, 1, 1, 1,
0.2342747, 0.4115753, 1.171205, 1, 1, 1, 1, 1,
0.2371362, -0.2137745, 2.629164, 1, 1, 1, 1, 1,
0.2383161, -0.5529728, 3.546195, 1, 1, 1, 1, 1,
0.2387864, -1.871389, 1.536221, 1, 1, 1, 1, 1,
0.2389746, 0.6476954, 1.230762, 1, 1, 1, 1, 1,
0.2490201, -1.327421, 3.971675, 1, 1, 1, 1, 1,
0.2498929, 0.7069922, -0.1351955, 1, 1, 1, 1, 1,
0.255574, -0.1804251, 1.588024, 1, 1, 1, 1, 1,
0.2562637, 0.6374661, 1.878517, 1, 1, 1, 1, 1,
0.257649, 0.4172882, 0.4742651, 1, 1, 1, 1, 1,
0.2577766, -1.678382, 3.340281, 0, 0, 1, 1, 1,
0.2708424, 1.119452, -1.300695, 1, 0, 0, 1, 1,
0.2714281, 0.354111, 0.6585782, 1, 0, 0, 1, 1,
0.2714599, 0.6119074, 0.8188041, 1, 0, 0, 1, 1,
0.2754255, -0.7734326, 1.987239, 1, 0, 0, 1, 1,
0.2775066, 1.577259, 0.6100976, 1, 0, 0, 1, 1,
0.2792886, 0.883004, 1.69708, 0, 0, 0, 1, 1,
0.2829199, -0.1642871, 3.067953, 0, 0, 0, 1, 1,
0.2902039, -0.8053902, 2.096351, 0, 0, 0, 1, 1,
0.2923522, -1.379242, 2.623181, 0, 0, 0, 1, 1,
0.2934647, 0.208736, 3.003963, 0, 0, 0, 1, 1,
0.3003842, -1.778042, 2.147292, 0, 0, 0, 1, 1,
0.3021643, 1.446046, -0.6437162, 0, 0, 0, 1, 1,
0.3022562, -1.292274, 5.136436, 1, 1, 1, 1, 1,
0.3152559, 0.4314305, -0.002847743, 1, 1, 1, 1, 1,
0.318702, -0.5811192, 3.705088, 1, 1, 1, 1, 1,
0.3207201, -0.07221257, 3.641164, 1, 1, 1, 1, 1,
0.3223239, -1.298703, 4.04219, 1, 1, 1, 1, 1,
0.3300323, 1.981767, -0.3662646, 1, 1, 1, 1, 1,
0.3321042, -0.5101847, 4.054353, 1, 1, 1, 1, 1,
0.3352387, 0.3540049, 0.4228071, 1, 1, 1, 1, 1,
0.3404122, 2.318913, -0.4090891, 1, 1, 1, 1, 1,
0.3463906, 0.4420823, 2.346573, 1, 1, 1, 1, 1,
0.347792, 0.5024403, -0.6275222, 1, 1, 1, 1, 1,
0.3518911, -0.8993019, 3.243078, 1, 1, 1, 1, 1,
0.3520155, -0.2016758, 4.022723, 1, 1, 1, 1, 1,
0.3586368, 0.2829602, 2.381495, 1, 1, 1, 1, 1,
0.3603352, -2.314531, 2.035196, 1, 1, 1, 1, 1,
0.3638145, -0.4233199, 1.791777, 0, 0, 1, 1, 1,
0.3654676, -0.5402088, 0.9860181, 1, 0, 0, 1, 1,
0.3665678, 0.252628, 0.4332875, 1, 0, 0, 1, 1,
0.368037, 1.347026, 0.9763451, 1, 0, 0, 1, 1,
0.3680603, 0.2244177, 0.446481, 1, 0, 0, 1, 1,
0.3699259, 1.095482, 2.068403, 1, 0, 0, 1, 1,
0.3732423, 1.520308, 0.7144834, 0, 0, 0, 1, 1,
0.3737262, 0.2617373, -0.3782045, 0, 0, 0, 1, 1,
0.375489, 0.104984, 2.116614, 0, 0, 0, 1, 1,
0.378163, -1.415746, 1.83845, 0, 0, 0, 1, 1,
0.380721, -0.04421163, 3.350816, 0, 0, 0, 1, 1,
0.3814515, -1.722142, 4.171456, 0, 0, 0, 1, 1,
0.3858252, -0.9860418, 2.371031, 0, 0, 0, 1, 1,
0.3871958, 0.4102368, 2.592475, 1, 1, 1, 1, 1,
0.3877252, -0.6641128, 1.092998, 1, 1, 1, 1, 1,
0.3931287, -0.3958598, 1.083748, 1, 1, 1, 1, 1,
0.3975013, 1.674696, 0.3669418, 1, 1, 1, 1, 1,
0.4020775, -1.928046, 3.527093, 1, 1, 1, 1, 1,
0.4028558, -0.2188943, 1.918257, 1, 1, 1, 1, 1,
0.4056194, -0.7531779, 3.7725, 1, 1, 1, 1, 1,
0.406802, 0.1408608, 1.2674, 1, 1, 1, 1, 1,
0.4103019, -0.1119502, 1.237244, 1, 1, 1, 1, 1,
0.4122328, -0.2745595, 1.292706, 1, 1, 1, 1, 1,
0.4181484, -0.2959937, 3.61192, 1, 1, 1, 1, 1,
0.4194139, -0.1139532, 2.912371, 1, 1, 1, 1, 1,
0.4203309, 0.07778672, 0.6121243, 1, 1, 1, 1, 1,
0.4269581, 1.143422, 0.3988246, 1, 1, 1, 1, 1,
0.4287842, -0.7214485, 4.01068, 1, 1, 1, 1, 1,
0.4294976, -0.6289614, 1.713709, 0, 0, 1, 1, 1,
0.4391806, -0.8249054, 1.330395, 1, 0, 0, 1, 1,
0.4413632, 0.3950491, 0.5131036, 1, 0, 0, 1, 1,
0.4445395, -0.7262783, 2.7874, 1, 0, 0, 1, 1,
0.4476015, -0.9380584, 1.897201, 1, 0, 0, 1, 1,
0.4555495, -0.1884174, 2.277504, 1, 0, 0, 1, 1,
0.4582791, -0.5922047, 3.434128, 0, 0, 0, 1, 1,
0.4600598, 0.1691901, -0.5904313, 0, 0, 0, 1, 1,
0.4622528, -0.5675766, 1.443772, 0, 0, 0, 1, 1,
0.4635862, 0.8748317, -0.6682226, 0, 0, 0, 1, 1,
0.4670444, -0.6910762, 3.695979, 0, 0, 0, 1, 1,
0.468196, 0.2567919, 1.165558, 0, 0, 0, 1, 1,
0.4687793, -0.1433207, 0.7723891, 0, 0, 0, 1, 1,
0.4752423, -0.2286283, 1.331216, 1, 1, 1, 1, 1,
0.4773595, -0.8068275, 2.346015, 1, 1, 1, 1, 1,
0.4794388, 0.3517562, -0.6683008, 1, 1, 1, 1, 1,
0.4852906, -1.653974, 3.063974, 1, 1, 1, 1, 1,
0.4892617, -0.3489119, 1.778419, 1, 1, 1, 1, 1,
0.4913273, -0.9639471, 3.311656, 1, 1, 1, 1, 1,
0.4915304, 0.01956631, 2.06025, 1, 1, 1, 1, 1,
0.4929793, -0.2524063, 1.874999, 1, 1, 1, 1, 1,
0.4943348, 0.3186859, 0.7567366, 1, 1, 1, 1, 1,
0.4954982, -0.701646, 3.09142, 1, 1, 1, 1, 1,
0.4967485, -1.285286, 3.361683, 1, 1, 1, 1, 1,
0.4968243, -1.147288, 2.030997, 1, 1, 1, 1, 1,
0.4976262, -0.287817, 1.280114, 1, 1, 1, 1, 1,
0.4978205, -0.3058671, 2.087115, 1, 1, 1, 1, 1,
0.5116417, 1.505411, 1.703505, 1, 1, 1, 1, 1,
0.5116455, -1.226516, 1.794169, 0, 0, 1, 1, 1,
0.5125392, -0.3726582, 3.683708, 1, 0, 0, 1, 1,
0.5171866, -0.9281861, 3.550647, 1, 0, 0, 1, 1,
0.5199217, -0.2698491, 1.670065, 1, 0, 0, 1, 1,
0.5212959, 1.223509, 1.091718, 1, 0, 0, 1, 1,
0.5226044, 0.06599813, 3.65293, 1, 0, 0, 1, 1,
0.5229005, 1.889561, -0.7821404, 0, 0, 0, 1, 1,
0.5257795, -2.218645, 3.348828, 0, 0, 0, 1, 1,
0.5299387, -0.2415889, 1.682477, 0, 0, 0, 1, 1,
0.5316478, 0.7447538, 1.781674, 0, 0, 0, 1, 1,
0.5400807, -0.7671744, 2.313728, 0, 0, 0, 1, 1,
0.5461646, -0.8938625, 4.231188, 0, 0, 0, 1, 1,
0.546315, -0.1209594, 0.2165333, 0, 0, 0, 1, 1,
0.5588008, 0.8372319, -0.2865004, 1, 1, 1, 1, 1,
0.5620263, -0.2438798, 1.026945, 1, 1, 1, 1, 1,
0.5654142, -0.6548125, 2.997717, 1, 1, 1, 1, 1,
0.5696998, 0.7956002, 0.5364431, 1, 1, 1, 1, 1,
0.5714343, 0.7356269, 0.4629156, 1, 1, 1, 1, 1,
0.5720939, 0.2087875, 0.384146, 1, 1, 1, 1, 1,
0.5771624, -0.04720845, 2.779184, 1, 1, 1, 1, 1,
0.5780303, -1.435117, 1.281903, 1, 1, 1, 1, 1,
0.5784376, -0.01875013, 2.628452, 1, 1, 1, 1, 1,
0.5795335, -0.7279302, 3.374738, 1, 1, 1, 1, 1,
0.580032, -1.057483, 2.244348, 1, 1, 1, 1, 1,
0.5821412, -0.7636037, 3.360541, 1, 1, 1, 1, 1,
0.583143, -0.05452448, 1.396138, 1, 1, 1, 1, 1,
0.5945759, -0.4572204, 1.920431, 1, 1, 1, 1, 1,
0.5961013, -0.6916012, 2.110508, 1, 1, 1, 1, 1,
0.598639, -0.5071716, 1.358937, 0, 0, 1, 1, 1,
0.6024134, -0.6356766, 4.188233, 1, 0, 0, 1, 1,
0.6044977, -0.4554825, 2.236109, 1, 0, 0, 1, 1,
0.6067089, 0.3787324, 0.8151557, 1, 0, 0, 1, 1,
0.607813, 0.464251, -0.4815601, 1, 0, 0, 1, 1,
0.60783, 1.149096, -0.2816355, 1, 0, 0, 1, 1,
0.6121199, -0.02286348, 1.278685, 0, 0, 0, 1, 1,
0.6133398, -1.811027, 4.254925, 0, 0, 0, 1, 1,
0.6134488, -1.094798, 4.324613, 0, 0, 0, 1, 1,
0.6164446, 0.9148078, 0.3153425, 0, 0, 0, 1, 1,
0.6192308, -0.5130684, 1.689378, 0, 0, 0, 1, 1,
0.6202247, 0.07318656, -0.3956206, 0, 0, 0, 1, 1,
0.6205974, -0.63946, 2.77591, 0, 0, 0, 1, 1,
0.6226046, 1.409757, -1.183191, 1, 1, 1, 1, 1,
0.6228225, 0.4941895, 1.197379, 1, 1, 1, 1, 1,
0.624956, -0.2711522, 1.717159, 1, 1, 1, 1, 1,
0.6296007, 1.457491, -0.3186705, 1, 1, 1, 1, 1,
0.6311681, 0.2532552, 0.5512146, 1, 1, 1, 1, 1,
0.631362, -2.655007, 4.498661, 1, 1, 1, 1, 1,
0.6335441, 0.743886, -0.2998697, 1, 1, 1, 1, 1,
0.6373972, -1.553607, 3.216752, 1, 1, 1, 1, 1,
0.6382734, -0.2703174, 1.053236, 1, 1, 1, 1, 1,
0.6418685, 2.129109, -1.322374, 1, 1, 1, 1, 1,
0.6423917, 0.1954335, 2.040195, 1, 1, 1, 1, 1,
0.6440204, -0.6694808, 3.654591, 1, 1, 1, 1, 1,
0.6469364, -0.3975631, 1.200184, 1, 1, 1, 1, 1,
0.6510871, -0.28108, 1.021232, 1, 1, 1, 1, 1,
0.6527091, -0.8248569, 3.323836, 1, 1, 1, 1, 1,
0.6562775, 0.3487701, 1.829822, 0, 0, 1, 1, 1,
0.6569529, 0.315845, 3.17689, 1, 0, 0, 1, 1,
0.6588159, -0.3515105, 1.711389, 1, 0, 0, 1, 1,
0.6639581, -0.3808369, 0.2842302, 1, 0, 0, 1, 1,
0.6670868, -1.775747, 2.578936, 1, 0, 0, 1, 1,
0.6676588, 1.116002, -1.473365, 1, 0, 0, 1, 1,
0.6679859, -1.145431, 2.379533, 0, 0, 0, 1, 1,
0.6681468, 0.1688316, 0.7615302, 0, 0, 0, 1, 1,
0.6739119, -1.300818, 1.566408, 0, 0, 0, 1, 1,
0.676639, -0.2876424, 3.118771, 0, 0, 0, 1, 1,
0.6780573, 0.6403334, -0.393966, 0, 0, 0, 1, 1,
0.6782212, 0.2358524, 0.6725349, 0, 0, 0, 1, 1,
0.6786956, -0.7106627, 3.11575, 0, 0, 0, 1, 1,
0.6817278, 0.2868846, 0.3565871, 1, 1, 1, 1, 1,
0.6825033, 0.8797674, 1.433136, 1, 1, 1, 1, 1,
0.6880921, 0.8041253, 1.012874, 1, 1, 1, 1, 1,
0.6905307, 1.552143, -1.419962, 1, 1, 1, 1, 1,
0.6952039, 2.88357, 0.6724951, 1, 1, 1, 1, 1,
0.7014879, 0.600832, 1.375674, 1, 1, 1, 1, 1,
0.7033407, 0.3745678, 2.310671, 1, 1, 1, 1, 1,
0.7057123, 1.258465, 0.125108, 1, 1, 1, 1, 1,
0.7059226, 1.583664, 0.2232895, 1, 1, 1, 1, 1,
0.7104811, 0.6098433, 1.773726, 1, 1, 1, 1, 1,
0.7339361, 0.3024766, 2.245667, 1, 1, 1, 1, 1,
0.7395211, 0.9286796, 1.395667, 1, 1, 1, 1, 1,
0.7410278, 0.6537445, 2.774985, 1, 1, 1, 1, 1,
0.7421119, -0.6898353, 2.457249, 1, 1, 1, 1, 1,
0.7529162, -0.3344737, 3.808708, 1, 1, 1, 1, 1,
0.7562999, 0.681066, 0.9122013, 0, 0, 1, 1, 1,
0.7619673, 2.334672, 0.4148218, 1, 0, 0, 1, 1,
0.7629079, 1.17134, 0.8051126, 1, 0, 0, 1, 1,
0.7631928, -1.010969, 2.944474, 1, 0, 0, 1, 1,
0.7632908, 1.48237, 1.624649, 1, 0, 0, 1, 1,
0.7646236, 0.1489097, 1.474111, 1, 0, 0, 1, 1,
0.7680715, 0.4650633, 2.665414, 0, 0, 0, 1, 1,
0.7694684, -0.6977174, 2.103133, 0, 0, 0, 1, 1,
0.773206, -0.4177798, 2.868367, 0, 0, 0, 1, 1,
0.7735862, 1.458149, -0.472067, 0, 0, 0, 1, 1,
0.7849842, 0.9708067, 1.083962, 0, 0, 0, 1, 1,
0.7850121, -1.724898, 3.792223, 0, 0, 0, 1, 1,
0.7915246, -0.3010197, 0.1280791, 0, 0, 0, 1, 1,
0.7923198, 1.39974, -0.6259901, 1, 1, 1, 1, 1,
0.7933713, 0.313734, 2.524981, 1, 1, 1, 1, 1,
0.7976589, 0.002785699, 2.605316, 1, 1, 1, 1, 1,
0.7999418, 0.8866233, 1.90579, 1, 1, 1, 1, 1,
0.8050231, 0.444319, 0.2328592, 1, 1, 1, 1, 1,
0.8072847, 1.504989, -2.147065, 1, 1, 1, 1, 1,
0.8104059, 0.1307137, 1.237162, 1, 1, 1, 1, 1,
0.8105102, -0.9955219, 1.332314, 1, 1, 1, 1, 1,
0.8109035, 1.331473, 0.7576522, 1, 1, 1, 1, 1,
0.8171243, -0.7303954, 3.121484, 1, 1, 1, 1, 1,
0.82181, -0.1730411, 1.962988, 1, 1, 1, 1, 1,
0.8237077, 1.386278, -0.8183349, 1, 1, 1, 1, 1,
0.8247015, 1.855508, 1.814581, 1, 1, 1, 1, 1,
0.8257389, -2.368777, 2.954939, 1, 1, 1, 1, 1,
0.8264819, 0.7433929, 2.840621, 1, 1, 1, 1, 1,
0.8326538, 0.2345218, 0.226301, 0, 0, 1, 1, 1,
0.8343484, 0.5207194, 0.1230335, 1, 0, 0, 1, 1,
0.8351714, -0.1779446, 0.9014242, 1, 0, 0, 1, 1,
0.8352123, -0.4303101, 3.696193, 1, 0, 0, 1, 1,
0.8408099, -0.4940833, 2.413799, 1, 0, 0, 1, 1,
0.8441426, -1.086159, 2.393632, 1, 0, 0, 1, 1,
0.8450003, -1.719256, 2.425742, 0, 0, 0, 1, 1,
0.8466629, -0.03980931, 1.298756, 0, 0, 0, 1, 1,
0.8530174, 0.1799981, -0.2210933, 0, 0, 0, 1, 1,
0.8562474, 0.2433664, -0.7479659, 0, 0, 0, 1, 1,
0.86275, 0.531356, -0.5155541, 0, 0, 0, 1, 1,
0.8659558, 1.302607, 2.155458, 0, 0, 0, 1, 1,
0.8668059, -0.3214265, 3.305067, 0, 0, 0, 1, 1,
0.8682979, -0.256521, 2.451632, 1, 1, 1, 1, 1,
0.8686672, 1.072634, -0.275836, 1, 1, 1, 1, 1,
0.871681, -0.4597999, 2.75182, 1, 1, 1, 1, 1,
0.8719115, -0.587391, 1.357536, 1, 1, 1, 1, 1,
0.8727127, -0.429191, 1.831356, 1, 1, 1, 1, 1,
0.8750196, 1.330345, -0.1399775, 1, 1, 1, 1, 1,
0.8790047, -0.5635862, 3.046641, 1, 1, 1, 1, 1,
0.8840482, -1.235241, 1.928443, 1, 1, 1, 1, 1,
0.8874099, 0.04030275, 0.06360122, 1, 1, 1, 1, 1,
0.8918939, -0.6860102, 3.018926, 1, 1, 1, 1, 1,
0.8925028, -1.209225, 2.012588, 1, 1, 1, 1, 1,
0.8949421, -0.6662985, 2.591911, 1, 1, 1, 1, 1,
0.9070975, 1.310332, -0.9794509, 1, 1, 1, 1, 1,
0.9079174, 0.3941691, 3.138241, 1, 1, 1, 1, 1,
0.9218928, -0.8490244, 3.095202, 1, 1, 1, 1, 1,
0.9232463, -0.3617812, 2.176599, 0, 0, 1, 1, 1,
0.9365156, -0.9956018, 1.770838, 1, 0, 0, 1, 1,
0.9388406, -1.00329, 3.182051, 1, 0, 0, 1, 1,
0.9407732, -0.7129924, 2.134151, 1, 0, 0, 1, 1,
0.9469621, -0.4798648, 2.355498, 1, 0, 0, 1, 1,
0.952189, 0.4899714, 1.42864, 1, 0, 0, 1, 1,
0.9531782, -1.56077, 1.414612, 0, 0, 0, 1, 1,
0.9608066, -0.151896, 2.056632, 0, 0, 0, 1, 1,
0.9662298, -0.4588655, 2.187741, 0, 0, 0, 1, 1,
0.9682867, -1.210589, 2.700945, 0, 0, 0, 1, 1,
0.9721901, -0.6034648, 0.3935048, 0, 0, 0, 1, 1,
0.9762533, -0.8163298, 2.683504, 0, 0, 0, 1, 1,
0.9801053, 0.8727937, 0.7110337, 0, 0, 0, 1, 1,
0.9829848, -1.090939, 2.649254, 1, 1, 1, 1, 1,
0.9853111, 1.30761, 0.01105866, 1, 1, 1, 1, 1,
0.9910306, -1.069528, 2.798265, 1, 1, 1, 1, 1,
0.9944211, -0.8207998, 1.569028, 1, 1, 1, 1, 1,
0.9987868, 0.9225541, 0.09094559, 1, 1, 1, 1, 1,
1.003888, 0.2836212, 2.885387, 1, 1, 1, 1, 1,
1.006055, -0.3899721, 3.322564, 1, 1, 1, 1, 1,
1.012419, -2.723434, 3.515481, 1, 1, 1, 1, 1,
1.015116, 0.2674519, 0.3385728, 1, 1, 1, 1, 1,
1.019055, 0.96233, 0.8737128, 1, 1, 1, 1, 1,
1.019866, 1.244187, 0.9046748, 1, 1, 1, 1, 1,
1.025661, -0.4129398, 2.918152, 1, 1, 1, 1, 1,
1.027081, 1.857771, 1.593853, 1, 1, 1, 1, 1,
1.028279, 1.849958, 1.460179, 1, 1, 1, 1, 1,
1.030702, 0.5627953, -0.1724994, 1, 1, 1, 1, 1,
1.032558, -0.08908263, 0.03572327, 0, 0, 1, 1, 1,
1.033886, -0.5884746, 1.790213, 1, 0, 0, 1, 1,
1.040509, -1.233562, 2.796819, 1, 0, 0, 1, 1,
1.041303, -1.52327, 4.649368, 1, 0, 0, 1, 1,
1.045748, 0.04313298, 1.558767, 1, 0, 0, 1, 1,
1.045997, 1.519821, 1.435758, 1, 0, 0, 1, 1,
1.047903, -0.6176878, 0.5669954, 0, 0, 0, 1, 1,
1.061131, -0.7630059, 2.012156, 0, 0, 0, 1, 1,
1.062875, 0.3492838, 0.4295785, 0, 0, 0, 1, 1,
1.064712, -0.2266995, 1.744186, 0, 0, 0, 1, 1,
1.066177, -0.6847622, 1.062584, 0, 0, 0, 1, 1,
1.068051, -0.08103891, 3.011482, 0, 0, 0, 1, 1,
1.074389, 0.5259963, 1.219672, 0, 0, 0, 1, 1,
1.093165, 0.7356479, -0.4460198, 1, 1, 1, 1, 1,
1.099334, 0.4215447, -1.783326, 1, 1, 1, 1, 1,
1.100062, -0.8779922, 2.935735, 1, 1, 1, 1, 1,
1.104683, 0.6459399, 0.8706833, 1, 1, 1, 1, 1,
1.105661, -0.3282302, -0.5511672, 1, 1, 1, 1, 1,
1.116871, -1.45336, 2.41189, 1, 1, 1, 1, 1,
1.136915, -0.6579995, 3.118807, 1, 1, 1, 1, 1,
1.149547, 0.7072797, 0.98093, 1, 1, 1, 1, 1,
1.153889, -0.2118085, 2.621564, 1, 1, 1, 1, 1,
1.175497, 1.10813, 0.7463456, 1, 1, 1, 1, 1,
1.180047, 0.1083613, 2.396786, 1, 1, 1, 1, 1,
1.180334, 1.069002, -0.3797544, 1, 1, 1, 1, 1,
1.190259, 1.595842, 1.454308, 1, 1, 1, 1, 1,
1.204093, 1.695833, -0.7486383, 1, 1, 1, 1, 1,
1.204116, 0.4398598, 1.889449, 1, 1, 1, 1, 1,
1.206202, -0.08676709, 1.455306, 0, 0, 1, 1, 1,
1.216255, -0.08671395, 1.894974, 1, 0, 0, 1, 1,
1.222935, -0.4350436, 1.111852, 1, 0, 0, 1, 1,
1.229375, 0.3026199, 1.417531, 1, 0, 0, 1, 1,
1.230578, -0.1072989, 2.465992, 1, 0, 0, 1, 1,
1.236139, -1.231014, 2.557535, 1, 0, 0, 1, 1,
1.238064, 1.084568, 0.8079119, 0, 0, 0, 1, 1,
1.243571, -0.1355786, 1.212102, 0, 0, 0, 1, 1,
1.252253, -0.4155045, 2.913833, 0, 0, 0, 1, 1,
1.255043, 0.8501131, 1.19781, 0, 0, 0, 1, 1,
1.257355, -0.7692652, 1.535066, 0, 0, 0, 1, 1,
1.259898, -0.4235275, 1.889055, 0, 0, 0, 1, 1,
1.282675, -0.7913284, 3.072221, 0, 0, 0, 1, 1,
1.283692, -1.162274, 2.816034, 1, 1, 1, 1, 1,
1.288265, 0.6904743, 1.401112, 1, 1, 1, 1, 1,
1.29202, 0.6468259, 0.01626601, 1, 1, 1, 1, 1,
1.305797, -1.7614, 2.672681, 1, 1, 1, 1, 1,
1.319371, 0.6069542, 1.527331, 1, 1, 1, 1, 1,
1.31988, 0.948709, 0.6864193, 1, 1, 1, 1, 1,
1.320495, 0.8364675, -1.063843, 1, 1, 1, 1, 1,
1.3277, 2.14698, -0.760322, 1, 1, 1, 1, 1,
1.332759, -1.87892, 2.537203, 1, 1, 1, 1, 1,
1.334351, -1.094397, 2.260118, 1, 1, 1, 1, 1,
1.335844, -0.02979022, 2.46765, 1, 1, 1, 1, 1,
1.340469, -0.5548639, 1.160725, 1, 1, 1, 1, 1,
1.342662, -0.1285485, 0.5703178, 1, 1, 1, 1, 1,
1.353407, -0.1134076, 2.68654, 1, 1, 1, 1, 1,
1.357658, 0.3592507, 2.341414, 1, 1, 1, 1, 1,
1.35837, -0.2502119, 1.256225, 0, 0, 1, 1, 1,
1.364177, 1.7413, 1.750731, 1, 0, 0, 1, 1,
1.369343, 0.4184442, 0.6188765, 1, 0, 0, 1, 1,
1.369457, -0.2398019, 1.259736, 1, 0, 0, 1, 1,
1.376604, -1.137521, 2.424149, 1, 0, 0, 1, 1,
1.380689, 0.6724749, -0.7481535, 1, 0, 0, 1, 1,
1.39098, 0.6739292, 1.234872, 0, 0, 0, 1, 1,
1.393225, -0.4587457, 2.154941, 0, 0, 0, 1, 1,
1.401373, 0.371287, 0.5237365, 0, 0, 0, 1, 1,
1.404253, -1.380064, 2.904669, 0, 0, 0, 1, 1,
1.405066, -0.03721207, 1.432307, 0, 0, 0, 1, 1,
1.417524, 0.9428982, 0.9587224, 0, 0, 0, 1, 1,
1.418149, -2.349803, 3.603347, 0, 0, 0, 1, 1,
1.423216, 0.308365, 1.525457, 1, 1, 1, 1, 1,
1.427214, -0.01638235, 0.6856207, 1, 1, 1, 1, 1,
1.430083, -0.4156091, -0.8109644, 1, 1, 1, 1, 1,
1.433044, 1.221416, -0.1343744, 1, 1, 1, 1, 1,
1.457608, -0.4162399, 0.8226435, 1, 1, 1, 1, 1,
1.4821, -0.8515311, 3.117206, 1, 1, 1, 1, 1,
1.491985, 1.711085, -0.6352405, 1, 1, 1, 1, 1,
1.529467, 1.643982, 1.609281, 1, 1, 1, 1, 1,
1.540216, 0.7065535, 0.3385739, 1, 1, 1, 1, 1,
1.540469, 0.7689816, 0.1452238, 1, 1, 1, 1, 1,
1.543176, 0.3991078, 2.597795, 1, 1, 1, 1, 1,
1.552402, -0.2924636, 3.742435, 1, 1, 1, 1, 1,
1.565372, -0.7699364, 2.753034, 1, 1, 1, 1, 1,
1.583143, -0.1836474, 2.012604, 1, 1, 1, 1, 1,
1.595344, -1.017976, 2.517221, 1, 1, 1, 1, 1,
1.629856, 0.4066381, 2.722399, 0, 0, 1, 1, 1,
1.637166, -1.534297, 2.477578, 1, 0, 0, 1, 1,
1.654126, -0.789344, 3.881, 1, 0, 0, 1, 1,
1.656116, -0.2822679, 2.735168, 1, 0, 0, 1, 1,
1.674005, 0.02188297, 0.5181575, 1, 0, 0, 1, 1,
1.6906, 1.171019, 1.528969, 1, 0, 0, 1, 1,
1.691086, -0.439768, 2.252375, 0, 0, 0, 1, 1,
1.695728, -0.3108959, 2.538407, 0, 0, 0, 1, 1,
1.696215, 1.814922, 0.8149995, 0, 0, 0, 1, 1,
1.699996, 0.6187693, 1.485846, 0, 0, 0, 1, 1,
1.716403, 0.891506, 0.5982611, 0, 0, 0, 1, 1,
1.721191, 0.3091846, 1.117325, 0, 0, 0, 1, 1,
1.728011, -0.4255587, 2.917003, 0, 0, 0, 1, 1,
1.740577, 1.502831, 0.7255533, 1, 1, 1, 1, 1,
1.772315, 0.5352122, -1.460442, 1, 1, 1, 1, 1,
1.774758, -0.9863518, 2.16391, 1, 1, 1, 1, 1,
1.787011, -1.994901, 2.347702, 1, 1, 1, 1, 1,
1.829148, 1.475214, 0.8588433, 1, 1, 1, 1, 1,
1.832144, -0.7533779, 2.369786, 1, 1, 1, 1, 1,
1.851327, 1.110277, -0.662454, 1, 1, 1, 1, 1,
1.877861, -2.480839, 2.8083, 1, 1, 1, 1, 1,
1.878142, 0.5689758, 0.8901466, 1, 1, 1, 1, 1,
1.928567, -0.7791595, 2.326056, 1, 1, 1, 1, 1,
1.942433, -0.2413827, 1.426275, 1, 1, 1, 1, 1,
1.964358, -0.4290318, 0.3770318, 1, 1, 1, 1, 1,
1.96812, -1.897348, 2.657179, 1, 1, 1, 1, 1,
1.973432, 0.4093668, 0.6130311, 1, 1, 1, 1, 1,
1.974253, -1.403836, 3.216085, 1, 1, 1, 1, 1,
1.976744, 1.603531, 0.02351042, 0, 0, 1, 1, 1,
1.983826, 0.3152983, 1.470487, 1, 0, 0, 1, 1,
2.008265, -0.4557059, 4.241091, 1, 0, 0, 1, 1,
2.026063, -0.4928824, 2.389424, 1, 0, 0, 1, 1,
2.039404, -0.7547978, 1.739535, 1, 0, 0, 1, 1,
2.050954, 0.552561, 1.103664, 1, 0, 0, 1, 1,
2.086457, -1.520279, 1.226047, 0, 0, 0, 1, 1,
2.091327, -0.5646304, -0.2346646, 0, 0, 0, 1, 1,
2.145141, -0.1587839, 0.493524, 0, 0, 0, 1, 1,
2.180345, 0.1384355, 1.704347, 0, 0, 0, 1, 1,
2.296964, -0.6046495, 4.305786, 0, 0, 0, 1, 1,
2.325421, 1.46735, 1.484946, 0, 0, 0, 1, 1,
2.398136, 0.9365854, 1.128756, 0, 0, 0, 1, 1,
2.49867, 0.05625528, 3.843306, 1, 1, 1, 1, 1,
2.561323, -0.323201, 2.533262, 1, 1, 1, 1, 1,
2.564681, 0.1994887, 1.396139, 1, 1, 1, 1, 1,
2.565336, -0.8588282, 1.265935, 1, 1, 1, 1, 1,
2.589481, 0.8159307, -0.6996896, 1, 1, 1, 1, 1,
2.6423, -0.2794046, 1.403607, 1, 1, 1, 1, 1,
3.279279, -0.6869606, 1.595349, 1, 1, 1, 1, 1
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
var radius = 10.12758;
var distance = 35.57268;
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
mvMatrix.translate( -0.1688966, 0.1697061, 0.230824 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.57268);
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
