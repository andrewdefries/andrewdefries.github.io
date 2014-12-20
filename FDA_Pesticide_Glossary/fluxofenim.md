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
-3.146173, -0.6874943, -1.484065, 1, 0, 0, 1,
-2.939508, -0.3966541, -2.102038, 1, 0.007843138, 0, 1,
-2.751617, 0.7774515, -1.490383, 1, 0.01176471, 0, 1,
-2.740175, -1.192436, -2.140456, 1, 0.01960784, 0, 1,
-2.650925, 0.4714271, -1.157967, 1, 0.02352941, 0, 1,
-2.64117, 2.229767, 0.7452015, 1, 0.03137255, 0, 1,
-2.576427, 1.443264, 1.129328, 1, 0.03529412, 0, 1,
-2.564564, 1.192536, -1.723817, 1, 0.04313726, 0, 1,
-2.563621, 1.332436, -1.136551, 1, 0.04705882, 0, 1,
-2.461356, 0.6936095, -1.579842, 1, 0.05490196, 0, 1,
-2.412505, 0.08665621, -2.903322, 1, 0.05882353, 0, 1,
-2.405711, 0.3082559, -1.446604, 1, 0.06666667, 0, 1,
-2.389143, 0.05092394, -0.7181597, 1, 0.07058824, 0, 1,
-2.361962, -1.466752, -1.914676, 1, 0.07843138, 0, 1,
-2.332031, -2.374589, -3.145336, 1, 0.08235294, 0, 1,
-2.311566, 1.215126, -1.436848, 1, 0.09019608, 0, 1,
-2.273379, 1.287385, -0.003478305, 1, 0.09411765, 0, 1,
-2.167064, 1.491301, -1.037423, 1, 0.1019608, 0, 1,
-2.146789, -1.629134, -0.5463387, 1, 0.1098039, 0, 1,
-2.134255, -1.245897, -1.840863, 1, 0.1137255, 0, 1,
-2.133709, 1.989002, -0.5677866, 1, 0.1215686, 0, 1,
-2.12764, 1.300151, -1.64985, 1, 0.1254902, 0, 1,
-2.092256, -0.700734, -1.573562, 1, 0.1333333, 0, 1,
-2.087507, -1.123864, -2.942188, 1, 0.1372549, 0, 1,
-2.083807, -1.394046, -2.374131, 1, 0.145098, 0, 1,
-2.082634, 0.9219486, -1.155258, 1, 0.1490196, 0, 1,
-2.062205, -2.054211, -4.426114, 1, 0.1568628, 0, 1,
-2.045006, 0.6590398, -2.805984, 1, 0.1607843, 0, 1,
-2.035193, -0.08239385, -1.00769, 1, 0.1686275, 0, 1,
-1.986856, -1.135623, -1.095647, 1, 0.172549, 0, 1,
-1.957582, 0.5199029, -0.6708308, 1, 0.1803922, 0, 1,
-1.951478, -1.054893, -2.758628, 1, 0.1843137, 0, 1,
-1.913479, -0.5046147, -2.945924, 1, 0.1921569, 0, 1,
-1.872438, 2.854357, -2.085028, 1, 0.1960784, 0, 1,
-1.870124, 0.2910863, -2.192268, 1, 0.2039216, 0, 1,
-1.869655, -1.751773, -1.4803, 1, 0.2117647, 0, 1,
-1.86527, 0.636529, -0.8571116, 1, 0.2156863, 0, 1,
-1.841474, 0.479511, 1.045258, 1, 0.2235294, 0, 1,
-1.837175, -0.4142198, -2.001579, 1, 0.227451, 0, 1,
-1.818355, -0.02338419, -3.317322, 1, 0.2352941, 0, 1,
-1.786486, 1.68336, -1.22824, 1, 0.2392157, 0, 1,
-1.774947, 0.9405278, 0.1797805, 1, 0.2470588, 0, 1,
-1.773952, -0.8797324, -3.249553, 1, 0.2509804, 0, 1,
-1.763913, 1.126258, -0.5801249, 1, 0.2588235, 0, 1,
-1.751822, 0.6442996, -3.199226, 1, 0.2627451, 0, 1,
-1.751148, -1.069442, -4.047689, 1, 0.2705882, 0, 1,
-1.750386, 0.5058188, -1.09071, 1, 0.2745098, 0, 1,
-1.74609, -1.083937, -2.537529, 1, 0.282353, 0, 1,
-1.724618, -0.5467359, -0.9188055, 1, 0.2862745, 0, 1,
-1.717317, 1.014168, -1.211977, 1, 0.2941177, 0, 1,
-1.714913, -0.3272504, -1.860189, 1, 0.3019608, 0, 1,
-1.711196, 1.355978, -1.380696, 1, 0.3058824, 0, 1,
-1.678771, -0.000748714, -4.609491, 1, 0.3137255, 0, 1,
-1.66667, -0.50951, -2.87007, 1, 0.3176471, 0, 1,
-1.654827, 0.04978739, -2.04332, 1, 0.3254902, 0, 1,
-1.653798, 0.9006404, -0.4204465, 1, 0.3294118, 0, 1,
-1.641352, 0.7541761, -0.005679424, 1, 0.3372549, 0, 1,
-1.6186, 0.6864815, -0.194561, 1, 0.3411765, 0, 1,
-1.563349, -0.7273545, 0.03815748, 1, 0.3490196, 0, 1,
-1.555733, 0.4981526, -2.033835, 1, 0.3529412, 0, 1,
-1.550663, 1.175385, -0.8420038, 1, 0.3607843, 0, 1,
-1.535119, -0.7410877, -2.366459, 1, 0.3647059, 0, 1,
-1.52951, 0.1208821, -0.6949933, 1, 0.372549, 0, 1,
-1.516331, -0.2836278, 0.5476269, 1, 0.3764706, 0, 1,
-1.515316, 1.556068, 0.4730762, 1, 0.3843137, 0, 1,
-1.505427, -0.3435093, -3.465463, 1, 0.3882353, 0, 1,
-1.503407, 0.8764442, -1.962732, 1, 0.3960784, 0, 1,
-1.496782, 1.433466, -0.290106, 1, 0.4039216, 0, 1,
-1.483278, -0.6330315, -2.366328, 1, 0.4078431, 0, 1,
-1.467794, -0.4301344, -2.376928, 1, 0.4156863, 0, 1,
-1.460863, -1.339855, -3.425945, 1, 0.4196078, 0, 1,
-1.457239, -0.1721284, -2.085518, 1, 0.427451, 0, 1,
-1.455165, -0.3194093, -4.454184, 1, 0.4313726, 0, 1,
-1.453766, -0.357566, -1.960735, 1, 0.4392157, 0, 1,
-1.42858, 0.6639647, -0.529936, 1, 0.4431373, 0, 1,
-1.425667, -1.352245, -1.26961, 1, 0.4509804, 0, 1,
-1.422556, -0.482023, -2.226415, 1, 0.454902, 0, 1,
-1.417922, -0.7281586, -3.771235, 1, 0.4627451, 0, 1,
-1.416042, -0.6255891, -1.211486, 1, 0.4666667, 0, 1,
-1.415314, -0.7131584, -2.184616, 1, 0.4745098, 0, 1,
-1.414047, 0.484897, -1.304633, 1, 0.4784314, 0, 1,
-1.41172, -0.2181221, -3.042051, 1, 0.4862745, 0, 1,
-1.409097, -1.09311, -3.835033, 1, 0.4901961, 0, 1,
-1.403569, 1.231158, -1.520262, 1, 0.4980392, 0, 1,
-1.403011, -0.1905943, -1.517104, 1, 0.5058824, 0, 1,
-1.383617, 1.497977, -0.1360594, 1, 0.509804, 0, 1,
-1.374602, 0.2605016, -2.458952, 1, 0.5176471, 0, 1,
-1.371023, -0.6202582, -0.8729439, 1, 0.5215687, 0, 1,
-1.368469, -0.8214145, -4.064402, 1, 0.5294118, 0, 1,
-1.366911, -2.066533, -2.858764, 1, 0.5333334, 0, 1,
-1.364566, -0.3390588, -2.532071, 1, 0.5411765, 0, 1,
-1.362534, 0.06845444, -1.363256, 1, 0.5450981, 0, 1,
-1.348895, -0.2281712, -1.243969, 1, 0.5529412, 0, 1,
-1.33113, -0.2175781, -0.8903825, 1, 0.5568628, 0, 1,
-1.328894, -1.191676, -3.063995, 1, 0.5647059, 0, 1,
-1.327757, -1.432371, -3.012603, 1, 0.5686275, 0, 1,
-1.32329, -0.8537236, -1.60081, 1, 0.5764706, 0, 1,
-1.311528, -1.582841, -1.842094, 1, 0.5803922, 0, 1,
-1.308157, 0.4784001, -0.07739135, 1, 0.5882353, 0, 1,
-1.305624, 0.1506036, -1.034913, 1, 0.5921569, 0, 1,
-1.302008, 0.001412055, -1.677806, 1, 0.6, 0, 1,
-1.286498, 0.1340493, -3.380776, 1, 0.6078432, 0, 1,
-1.27779, 0.3453597, -0.3162994, 1, 0.6117647, 0, 1,
-1.272654, 0.05981463, -1.698063, 1, 0.6196079, 0, 1,
-1.270787, 0.103789, -0.2817662, 1, 0.6235294, 0, 1,
-1.26811, -0.4694732, -2.230411, 1, 0.6313726, 0, 1,
-1.259604, 1.121815, -0.3251677, 1, 0.6352941, 0, 1,
-1.259321, -0.9003294, -3.040164, 1, 0.6431373, 0, 1,
-1.258593, 0.01406485, -1.734396, 1, 0.6470588, 0, 1,
-1.249018, 1.789007, -0.5676461, 1, 0.654902, 0, 1,
-1.237777, 0.4144485, -1.765066, 1, 0.6588235, 0, 1,
-1.225644, -1.015241, -3.473138, 1, 0.6666667, 0, 1,
-1.220908, 0.6133607, -0.1676562, 1, 0.6705883, 0, 1,
-1.206607, -1.191252, -0.8970392, 1, 0.6784314, 0, 1,
-1.20578, 0.3323808, -1.455889, 1, 0.682353, 0, 1,
-1.201233, -0.02321054, 0.7527825, 1, 0.6901961, 0, 1,
-1.17759, -0.7087803, 0.002443295, 1, 0.6941177, 0, 1,
-1.173634, 0.5950336, 0.3207821, 1, 0.7019608, 0, 1,
-1.16384, 0.6346487, -1.600396, 1, 0.7098039, 0, 1,
-1.160835, -0.7848371, -1.446115, 1, 0.7137255, 0, 1,
-1.157812, -0.8811406, -2.48761, 1, 0.7215686, 0, 1,
-1.153479, 0.4646262, -0.1479142, 1, 0.7254902, 0, 1,
-1.149996, -0.1671472, -3.543868, 1, 0.7333333, 0, 1,
-1.144846, -2.005815, -4.258044, 1, 0.7372549, 0, 1,
-1.140142, 0.1015186, -1.87117, 1, 0.7450981, 0, 1,
-1.136189, 0.2500203, -3.052403, 1, 0.7490196, 0, 1,
-1.1361, 0.5457913, -0.8869711, 1, 0.7568628, 0, 1,
-1.12667, -0.5213683, -2.41884, 1, 0.7607843, 0, 1,
-1.11508, 0.862676, -1.60011, 1, 0.7686275, 0, 1,
-1.113288, 1.204525, -0.5829652, 1, 0.772549, 0, 1,
-1.112152, -0.4520711, 0.03779165, 1, 0.7803922, 0, 1,
-1.11088, 0.7641553, 0.3634491, 1, 0.7843137, 0, 1,
-1.109325, 0.2425895, -1.485194, 1, 0.7921569, 0, 1,
-1.10393, 0.4662929, -0.6946845, 1, 0.7960784, 0, 1,
-1.093471, -1.893269, -3.403998, 1, 0.8039216, 0, 1,
-1.087352, -0.3093981, -2.076071, 1, 0.8117647, 0, 1,
-1.085753, -0.4447036, -3.357465, 1, 0.8156863, 0, 1,
-1.083325, -1.363022, -0.3988254, 1, 0.8235294, 0, 1,
-1.076614, -0.07404653, -1.126512, 1, 0.827451, 0, 1,
-1.067981, 0.03189595, -1.79324, 1, 0.8352941, 0, 1,
-1.066792, 0.5439107, -0.992853, 1, 0.8392157, 0, 1,
-1.058644, 0.0554174, -2.370987, 1, 0.8470588, 0, 1,
-1.054403, 0.3000827, -1.198403, 1, 0.8509804, 0, 1,
-1.051936, -0.9176625, -4.102428, 1, 0.8588235, 0, 1,
-1.036656, 1.025587, -1.131252, 1, 0.8627451, 0, 1,
-1.024436, -0.7077235, -1.29504, 1, 0.8705882, 0, 1,
-1.022901, -1.450277, -3.221595, 1, 0.8745098, 0, 1,
-1.014237, 0.394253, -0.8667483, 1, 0.8823529, 0, 1,
-1.00742, 0.3904237, -1.33051, 1, 0.8862745, 0, 1,
-1.007345, -1.162232, -0.5608343, 1, 0.8941177, 0, 1,
-1.005014, 0.7275881, -0.7252563, 1, 0.8980392, 0, 1,
-0.9943033, 2.007974, -0.6733763, 1, 0.9058824, 0, 1,
-0.9939919, -0.6844074, -2.048849, 1, 0.9137255, 0, 1,
-0.9922463, -0.6017462, -3.150173, 1, 0.9176471, 0, 1,
-0.9918749, 1.316036, 0.08214306, 1, 0.9254902, 0, 1,
-0.9855437, -0.03814342, -2.890112, 1, 0.9294118, 0, 1,
-0.9841178, -0.9170907, -2.332696, 1, 0.9372549, 0, 1,
-0.9813107, -1.098902, -2.666529, 1, 0.9411765, 0, 1,
-0.980283, 1.84567, 0.5090908, 1, 0.9490196, 0, 1,
-0.9747267, 0.2883306, -0.5750893, 1, 0.9529412, 0, 1,
-0.974287, -0.7587991, -2.740068, 1, 0.9607843, 0, 1,
-0.9692405, -0.6130527, -2.533996, 1, 0.9647059, 0, 1,
-0.9667922, 0.1649681, -3.141232, 1, 0.972549, 0, 1,
-0.9646208, 1.53114, 0.2344179, 1, 0.9764706, 0, 1,
-0.9581875, -0.6745926, -3.912315, 1, 0.9843137, 0, 1,
-0.952727, 0.05624183, -0.3762535, 1, 0.9882353, 0, 1,
-0.9486845, -1.169207, -1.176535, 1, 0.9960784, 0, 1,
-0.947429, 1.508445, -1.487912, 0.9960784, 1, 0, 1,
-0.9457301, -0.2922498, -1.00906, 0.9921569, 1, 0, 1,
-0.9432439, -1.214786, -2.430532, 0.9843137, 1, 0, 1,
-0.9405732, -0.731424, -3.613397, 0.9803922, 1, 0, 1,
-0.9389064, -0.205666, -2.653028, 0.972549, 1, 0, 1,
-0.9315298, -0.2124524, 0.3262524, 0.9686275, 1, 0, 1,
-0.9258531, 0.7837525, -1.276317, 0.9607843, 1, 0, 1,
-0.9219599, -1.602474, -2.575693, 0.9568627, 1, 0, 1,
-0.9194906, -2.305867, -2.746861, 0.9490196, 1, 0, 1,
-0.9181641, -0.5676929, -1.844518, 0.945098, 1, 0, 1,
-0.9177651, -0.5757666, -2.805341, 0.9372549, 1, 0, 1,
-0.8886897, -2.272446, -3.127655, 0.9333333, 1, 0, 1,
-0.8885698, 0.1648805, -2.048044, 0.9254902, 1, 0, 1,
-0.885509, -0.5918479, -2.234385, 0.9215686, 1, 0, 1,
-0.8829921, 0.6204872, -1.624504, 0.9137255, 1, 0, 1,
-0.8821668, -0.3263723, -0.4571022, 0.9098039, 1, 0, 1,
-0.8816205, -0.5304912, -3.091107, 0.9019608, 1, 0, 1,
-0.8788908, 1.798673, 0.2820267, 0.8941177, 1, 0, 1,
-0.8724664, 1.129363, 0.3154129, 0.8901961, 1, 0, 1,
-0.8721194, -0.004458538, -2.296162, 0.8823529, 1, 0, 1,
-0.8686592, 1.580827, 0.1760526, 0.8784314, 1, 0, 1,
-0.8677109, -0.1682052, -2.593033, 0.8705882, 1, 0, 1,
-0.8656621, -0.1947276, -0.2775018, 0.8666667, 1, 0, 1,
-0.8625249, 2.194245, -1.363507, 0.8588235, 1, 0, 1,
-0.8603538, -0.5042618, -2.610985, 0.854902, 1, 0, 1,
-0.854905, -1.704039, -1.75882, 0.8470588, 1, 0, 1,
-0.8533757, 0.6560938, -1.47663, 0.8431373, 1, 0, 1,
-0.8498507, -0.1332307, -2.155315, 0.8352941, 1, 0, 1,
-0.8452355, 0.1381557, 0.4173649, 0.8313726, 1, 0, 1,
-0.8427749, 1.039235, -1.344915, 0.8235294, 1, 0, 1,
-0.8418938, -1.447362, -3.515514, 0.8196079, 1, 0, 1,
-0.839767, -0.865661, -2.187214, 0.8117647, 1, 0, 1,
-0.8397137, -0.7101744, -3.244935, 0.8078431, 1, 0, 1,
-0.8391773, 1.266521, -0.7619255, 0.8, 1, 0, 1,
-0.8371506, 0.06476941, -0.4002777, 0.7921569, 1, 0, 1,
-0.8358388, -1.153863, -0.5691106, 0.7882353, 1, 0, 1,
-0.8299211, -0.8579662, -2.261017, 0.7803922, 1, 0, 1,
-0.8181618, -0.4842748, -3.036456, 0.7764706, 1, 0, 1,
-0.8136685, 2.060484, -2.777581, 0.7686275, 1, 0, 1,
-0.8099265, 1.758079, -0.1949253, 0.7647059, 1, 0, 1,
-0.8097281, 0.4661624, -0.4980129, 0.7568628, 1, 0, 1,
-0.8052379, -0.1248518, -0.8397581, 0.7529412, 1, 0, 1,
-0.8046859, -0.598268, -0.4186709, 0.7450981, 1, 0, 1,
-0.8011152, -0.09770137, -3.547729, 0.7411765, 1, 0, 1,
-0.7997952, 1.90426, -1.979941, 0.7333333, 1, 0, 1,
-0.7994125, 0.7501162, -1.000434, 0.7294118, 1, 0, 1,
-0.792718, -0.05854796, -1.357055, 0.7215686, 1, 0, 1,
-0.7926691, -1.48176, -1.544917, 0.7176471, 1, 0, 1,
-0.787899, 1.317687, -0.005798655, 0.7098039, 1, 0, 1,
-0.784274, 0.5375159, 0.816173, 0.7058824, 1, 0, 1,
-0.7795753, 0.07278376, -2.48648, 0.6980392, 1, 0, 1,
-0.7720416, 0.4405202, 0.347935, 0.6901961, 1, 0, 1,
-0.7668424, -1.069865, -1.530495, 0.6862745, 1, 0, 1,
-0.7617136, 0.5807634, 0.9637718, 0.6784314, 1, 0, 1,
-0.7588348, -1.27637, -2.755295, 0.6745098, 1, 0, 1,
-0.7526951, 1.072719, -0.8267822, 0.6666667, 1, 0, 1,
-0.7470354, -0.8038073, -1.914059, 0.6627451, 1, 0, 1,
-0.7469823, 0.02696193, -3.724357, 0.654902, 1, 0, 1,
-0.7446682, -0.2930914, -2.068938, 0.6509804, 1, 0, 1,
-0.7430005, -0.5814795, -2.877562, 0.6431373, 1, 0, 1,
-0.7408783, -0.7797189, -2.85432, 0.6392157, 1, 0, 1,
-0.7406436, -1.021204, -2.289977, 0.6313726, 1, 0, 1,
-0.732738, 0.1031208, -0.8670924, 0.627451, 1, 0, 1,
-0.7299415, 1.305927, -0.6360348, 0.6196079, 1, 0, 1,
-0.7275319, 0.08467828, -1.002491, 0.6156863, 1, 0, 1,
-0.725929, -0.85625, -2.142648, 0.6078432, 1, 0, 1,
-0.7258962, 0.9625322, -1.323145, 0.6039216, 1, 0, 1,
-0.7254498, 0.2535513, 0.08180609, 0.5960785, 1, 0, 1,
-0.7209438, -0.944488, -2.322849, 0.5882353, 1, 0, 1,
-0.7131571, 0.664196, -0.6453096, 0.5843138, 1, 0, 1,
-0.7116681, -1.175431, -2.852142, 0.5764706, 1, 0, 1,
-0.7100383, -0.589891, -3.485682, 0.572549, 1, 0, 1,
-0.7055151, 1.613212, -0.02999904, 0.5647059, 1, 0, 1,
-0.7054216, -0.5816612, -0.5759635, 0.5607843, 1, 0, 1,
-0.7039731, 0.05324171, -0.07407013, 0.5529412, 1, 0, 1,
-0.7035482, 1.119975, -1.421918, 0.5490196, 1, 0, 1,
-0.6930581, -0.0563831, -3.179162, 0.5411765, 1, 0, 1,
-0.6925349, 0.2538351, -2.492682, 0.5372549, 1, 0, 1,
-0.6856013, -0.3173611, -2.306744, 0.5294118, 1, 0, 1,
-0.6796178, 1.193489, -1.264711, 0.5254902, 1, 0, 1,
-0.6785582, 1.561591, 1.340988, 0.5176471, 1, 0, 1,
-0.6723899, 1.820735, 0.9152389, 0.5137255, 1, 0, 1,
-0.6720451, 1.066528, -2.163456, 0.5058824, 1, 0, 1,
-0.6717747, 1.0038, -0.9918762, 0.5019608, 1, 0, 1,
-0.6703785, 0.7233905, -0.9805933, 0.4941176, 1, 0, 1,
-0.6690978, 0.04514777, 0.5313504, 0.4862745, 1, 0, 1,
-0.6688351, -1.037654, -2.145057, 0.4823529, 1, 0, 1,
-0.6663528, 0.1079458, 0.441411, 0.4745098, 1, 0, 1,
-0.6636016, 0.2520718, -3.063797, 0.4705882, 1, 0, 1,
-0.6614151, 0.3913894, -2.094987, 0.4627451, 1, 0, 1,
-0.6593568, -0.1038028, -1.46309, 0.4588235, 1, 0, 1,
-0.6569157, -0.6410373, -2.588331, 0.4509804, 1, 0, 1,
-0.6554241, 0.3870999, -0.464081, 0.4470588, 1, 0, 1,
-0.6509137, -0.04717558, -3.514404, 0.4392157, 1, 0, 1,
-0.6451079, -0.270541, -2.476528, 0.4352941, 1, 0, 1,
-0.6430942, -0.1178693, -0.9119578, 0.427451, 1, 0, 1,
-0.6414965, -0.202856, -1.039623, 0.4235294, 1, 0, 1,
-0.6399698, -0.4650876, -1.69523, 0.4156863, 1, 0, 1,
-0.6393175, -1.397489, -1.471333, 0.4117647, 1, 0, 1,
-0.638805, -0.32992, -2.118611, 0.4039216, 1, 0, 1,
-0.6313776, -1.410959, -3.007992, 0.3960784, 1, 0, 1,
-0.6296588, 0.4034494, -0.3370489, 0.3921569, 1, 0, 1,
-0.6252396, -0.638927, -0.6332326, 0.3843137, 1, 0, 1,
-0.6231383, -0.6875911, -3.349457, 0.3803922, 1, 0, 1,
-0.6230689, 1.278363, -1.215395, 0.372549, 1, 0, 1,
-0.6214896, 0.6147961, -1.362612, 0.3686275, 1, 0, 1,
-0.6152267, -0.5109635, -2.145528, 0.3607843, 1, 0, 1,
-0.612886, -2.219994, -3.684248, 0.3568628, 1, 0, 1,
-0.6113687, -0.1831429, -2.019267, 0.3490196, 1, 0, 1,
-0.6082454, 0.3731494, -1.706567, 0.345098, 1, 0, 1,
-0.6071294, 1.228758, -2.765926, 0.3372549, 1, 0, 1,
-0.6053474, 0.6298904, -0.5957944, 0.3333333, 1, 0, 1,
-0.6024883, -2.698084, -3.652934, 0.3254902, 1, 0, 1,
-0.6011809, 0.1985063, 0.2645564, 0.3215686, 1, 0, 1,
-0.6008549, -0.4496351, -3.538298, 0.3137255, 1, 0, 1,
-0.5989509, -0.1532538, -0.1873056, 0.3098039, 1, 0, 1,
-0.5972905, -0.2760707, -3.280487, 0.3019608, 1, 0, 1,
-0.5972436, -0.8006307, -2.08204, 0.2941177, 1, 0, 1,
-0.5967828, 0.2141892, -2.450318, 0.2901961, 1, 0, 1,
-0.5961306, -0.01810388, -0.1843364, 0.282353, 1, 0, 1,
-0.5956237, -0.3239191, -2.172434, 0.2784314, 1, 0, 1,
-0.5909511, 0.8181224, 0.5407173, 0.2705882, 1, 0, 1,
-0.589065, 0.9450561, -1.27356, 0.2666667, 1, 0, 1,
-0.5818028, -0.6137387, -2.600912, 0.2588235, 1, 0, 1,
-0.5755001, -0.1972953, -1.997007, 0.254902, 1, 0, 1,
-0.570311, 0.787135, 0.9899693, 0.2470588, 1, 0, 1,
-0.5676708, -0.7067647, -2.513485, 0.2431373, 1, 0, 1,
-0.5630937, -0.3990879, -3.58079, 0.2352941, 1, 0, 1,
-0.5614315, -0.8563179, -4.10043, 0.2313726, 1, 0, 1,
-0.5543555, 1.398245, -0.9457948, 0.2235294, 1, 0, 1,
-0.55242, -2.437746, -4.462835, 0.2196078, 1, 0, 1,
-0.547793, -0.6853487, -1.131834, 0.2117647, 1, 0, 1,
-0.5474022, -0.3278968, -2.718006, 0.2078431, 1, 0, 1,
-0.5431452, -1.011147, -1.418828, 0.2, 1, 0, 1,
-0.540282, -2.67524, -4.208033, 0.1921569, 1, 0, 1,
-0.5392404, -1.193471, -3.785073, 0.1882353, 1, 0, 1,
-0.5333862, 1.049272, -2.074661, 0.1803922, 1, 0, 1,
-0.5321935, -1.015622, -1.839857, 0.1764706, 1, 0, 1,
-0.5272575, 0.5428262, -1.256179, 0.1686275, 1, 0, 1,
-0.5247626, -0.149353, -3.206684, 0.1647059, 1, 0, 1,
-0.5233851, -1.574113, -2.225567, 0.1568628, 1, 0, 1,
-0.5124915, 1.574546, 0.5230706, 0.1529412, 1, 0, 1,
-0.5100699, -0.6325251, -2.896049, 0.145098, 1, 0, 1,
-0.5063754, -0.5055197, -2.136298, 0.1411765, 1, 0, 1,
-0.5007738, 0.4707975, 0.6894195, 0.1333333, 1, 0, 1,
-0.4956894, 0.2853727, -0.752834, 0.1294118, 1, 0, 1,
-0.4940328, 0.1318494, -0.5392703, 0.1215686, 1, 0, 1,
-0.4909597, -0.7395667, -1.79042, 0.1176471, 1, 0, 1,
-0.4908762, -0.1091705, -2.081203, 0.1098039, 1, 0, 1,
-0.4897167, 0.2552581, 0.1334091, 0.1058824, 1, 0, 1,
-0.4892118, 0.7345486, -1.896515, 0.09803922, 1, 0, 1,
-0.4823848, -0.04037975, -1.213395, 0.09019608, 1, 0, 1,
-0.4819427, 0.3358831, -0.1413728, 0.08627451, 1, 0, 1,
-0.4636234, 0.4951358, -1.319435, 0.07843138, 1, 0, 1,
-0.4620404, 1.470825, -0.988675, 0.07450981, 1, 0, 1,
-0.4593492, -1.689911, -2.029341, 0.06666667, 1, 0, 1,
-0.4558519, -1.007727, -4.46924, 0.0627451, 1, 0, 1,
-0.4547863, -0.4001888, -1.816215, 0.05490196, 1, 0, 1,
-0.4500242, 1.626247, 0.1371907, 0.05098039, 1, 0, 1,
-0.4448372, -0.5265654, -3.02364, 0.04313726, 1, 0, 1,
-0.4440081, 0.6063951, -1.938317, 0.03921569, 1, 0, 1,
-0.439694, 1.245329, 0.164643, 0.03137255, 1, 0, 1,
-0.4372307, -0.8959711, -1.554784, 0.02745098, 1, 0, 1,
-0.4361736, -3.549943, -2.731881, 0.01960784, 1, 0, 1,
-0.4326546, -0.4807529, -1.447386, 0.01568628, 1, 0, 1,
-0.4285533, 0.664737, -0.3664086, 0.007843138, 1, 0, 1,
-0.4282813, -0.2695141, -2.497288, 0.003921569, 1, 0, 1,
-0.4248551, 0.4159956, -2.911331, 0, 1, 0.003921569, 1,
-0.4192964, 0.3468471, 0.3132229, 0, 1, 0.01176471, 1,
-0.4174364, 0.0273739, -1.497412, 0, 1, 0.01568628, 1,
-0.4166118, 1.089148, 0.668684, 0, 1, 0.02352941, 1,
-0.4163408, 0.962624, -0.939281, 0, 1, 0.02745098, 1,
-0.4131505, 0.2373196, -1.332569, 0, 1, 0.03529412, 1,
-0.4107485, 0.5846422, -0.2415931, 0, 1, 0.03921569, 1,
-0.4021579, 1.334445, 0.5639569, 0, 1, 0.04705882, 1,
-0.3970831, -0.8758038, -2.821648, 0, 1, 0.05098039, 1,
-0.3958311, 0.01004116, -2.873334, 0, 1, 0.05882353, 1,
-0.3952954, -0.343615, -2.157965, 0, 1, 0.0627451, 1,
-0.3923353, 1.050171, -0.9909099, 0, 1, 0.07058824, 1,
-0.3920034, 1.891843, -1.068245, 0, 1, 0.07450981, 1,
-0.3894319, 0.2292816, -1.692965, 0, 1, 0.08235294, 1,
-0.3833677, -0.259271, -2.855433, 0, 1, 0.08627451, 1,
-0.3783824, 0.7222212, -1.230845, 0, 1, 0.09411765, 1,
-0.3768554, -0.743162, -1.842751, 0, 1, 0.1019608, 1,
-0.3755852, -0.4340214, -3.725815, 0, 1, 0.1058824, 1,
-0.3753176, 0.2322285, -1.900216, 0, 1, 0.1137255, 1,
-0.3721453, 0.2761145, 1.51962, 0, 1, 0.1176471, 1,
-0.3718586, 1.786242, -0.8467981, 0, 1, 0.1254902, 1,
-0.3692482, 1.073325, 0.3383894, 0, 1, 0.1294118, 1,
-0.3670034, -0.5677888, -1.586312, 0, 1, 0.1372549, 1,
-0.3648603, -0.664261, -2.253332, 0, 1, 0.1411765, 1,
-0.3532303, 1.912436, 1.466389, 0, 1, 0.1490196, 1,
-0.3532284, -1.283688, -1.187629, 0, 1, 0.1529412, 1,
-0.3531392, 0.724799, -2.155765, 0, 1, 0.1607843, 1,
-0.3527166, -0.3207, -2.870196, 0, 1, 0.1647059, 1,
-0.350641, 0.2649199, -1.296198, 0, 1, 0.172549, 1,
-0.3506102, -1.894535, -2.126665, 0, 1, 0.1764706, 1,
-0.3462886, 0.004594977, -1.775931, 0, 1, 0.1843137, 1,
-0.3403343, -0.0456849, -0.804352, 0, 1, 0.1882353, 1,
-0.3376819, 0.7929063, -1.770048, 0, 1, 0.1960784, 1,
-0.3369256, 0.1336651, -1.83094, 0, 1, 0.2039216, 1,
-0.3293807, 0.6424245, 0.6830793, 0, 1, 0.2078431, 1,
-0.3290734, -0.08715122, -1.565838, 0, 1, 0.2156863, 1,
-0.3267787, 0.8302876, -1.956829, 0, 1, 0.2196078, 1,
-0.3253094, -0.4856733, -2.407155, 0, 1, 0.227451, 1,
-0.318167, 0.5768971, -0.7365901, 0, 1, 0.2313726, 1,
-0.3135177, -0.3018662, -1.0357, 0, 1, 0.2392157, 1,
-0.3109442, -0.1042888, -0.7786468, 0, 1, 0.2431373, 1,
-0.3003906, 0.3648408, -0.6581712, 0, 1, 0.2509804, 1,
-0.3002839, 1.125994, -0.1155226, 0, 1, 0.254902, 1,
-0.3002754, 1.498718, 0.545212, 0, 1, 0.2627451, 1,
-0.2986944, -0.425889, -2.926744, 0, 1, 0.2666667, 1,
-0.2969888, -0.4769081, -1.835997, 0, 1, 0.2745098, 1,
-0.2957058, -1.653379, -2.820217, 0, 1, 0.2784314, 1,
-0.2940843, 0.2041577, -3.16835, 0, 1, 0.2862745, 1,
-0.2939942, -1.186701, -3.526744, 0, 1, 0.2901961, 1,
-0.2910165, -1.358001, -2.242359, 0, 1, 0.2980392, 1,
-0.2905091, 2.516899, -0.07702181, 0, 1, 0.3058824, 1,
-0.2870491, -0.6182298, -0.7065291, 0, 1, 0.3098039, 1,
-0.2849327, -0.9431651, -2.592177, 0, 1, 0.3176471, 1,
-0.2827801, -0.811693, -3.304347, 0, 1, 0.3215686, 1,
-0.2798631, 0.8182874, 0.7377313, 0, 1, 0.3294118, 1,
-0.2767664, 0.4795502, -2.315895, 0, 1, 0.3333333, 1,
-0.2711338, -2.444084, -3.535233, 0, 1, 0.3411765, 1,
-0.266994, -0.4411089, -1.890649, 0, 1, 0.345098, 1,
-0.2611447, -2.765251, -2.261919, 0, 1, 0.3529412, 1,
-0.2545344, -0.7696448, -3.243469, 0, 1, 0.3568628, 1,
-0.2523787, 0.1041801, -1.217707, 0, 1, 0.3647059, 1,
-0.2490044, -0.527094, -2.604871, 0, 1, 0.3686275, 1,
-0.2463974, 0.152194, -0.8303719, 0, 1, 0.3764706, 1,
-0.2463587, -0.368179, -3.933129, 0, 1, 0.3803922, 1,
-0.2446794, -0.7997194, -3.794235, 0, 1, 0.3882353, 1,
-0.2313208, -0.3135668, -1.420593, 0, 1, 0.3921569, 1,
-0.228688, 0.4330282, -3.042082, 0, 1, 0.4, 1,
-0.2211322, 0.3853723, -0.7673575, 0, 1, 0.4078431, 1,
-0.2189422, -0.3597539, -3.135257, 0, 1, 0.4117647, 1,
-0.2179629, 0.1510875, -1.781653, 0, 1, 0.4196078, 1,
-0.217949, -2.560643, -3.534248, 0, 1, 0.4235294, 1,
-0.2155047, 0.8187857, 0.7464517, 0, 1, 0.4313726, 1,
-0.2146572, 0.2428558, 0.2065106, 0, 1, 0.4352941, 1,
-0.2140874, 2.287244, 0.5992365, 0, 1, 0.4431373, 1,
-0.2137215, 0.8329841, 0.04433058, 0, 1, 0.4470588, 1,
-0.2127276, 1.057874, 0.7963257, 0, 1, 0.454902, 1,
-0.2013444, 0.6406335, -0.00872678, 0, 1, 0.4588235, 1,
-0.2000675, -0.07486297, -2.400546, 0, 1, 0.4666667, 1,
-0.1978536, -0.896376, -3.150534, 0, 1, 0.4705882, 1,
-0.1963987, -0.5802572, -2.204967, 0, 1, 0.4784314, 1,
-0.1921274, 0.2691153, -0.6736783, 0, 1, 0.4823529, 1,
-0.1918927, 0.7834209, -0.9543099, 0, 1, 0.4901961, 1,
-0.1911709, 1.489619, -0.7157553, 0, 1, 0.4941176, 1,
-0.1903342, -0.6292042, -3.422259, 0, 1, 0.5019608, 1,
-0.1869969, 0.4205063, -0.6367124, 0, 1, 0.509804, 1,
-0.1842135, 0.8254775, -0.8098388, 0, 1, 0.5137255, 1,
-0.1835255, -0.08071192, -3.006223, 0, 1, 0.5215687, 1,
-0.1830508, 1.848331, -0.2517027, 0, 1, 0.5254902, 1,
-0.1817657, 0.07250795, -0.7255271, 0, 1, 0.5333334, 1,
-0.1761567, -1.273194, -3.159732, 0, 1, 0.5372549, 1,
-0.1758375, 0.05692673, -1.049491, 0, 1, 0.5450981, 1,
-0.1746311, -0.7878137, -1.242042, 0, 1, 0.5490196, 1,
-0.1739102, 1.326479, -0.4042579, 0, 1, 0.5568628, 1,
-0.1708869, 0.735087, -0.246043, 0, 1, 0.5607843, 1,
-0.1699657, 1.554579, -0.9761615, 0, 1, 0.5686275, 1,
-0.1698867, -0.7725794, -2.223153, 0, 1, 0.572549, 1,
-0.1698788, 1.346505, -1.587965, 0, 1, 0.5803922, 1,
-0.1641744, -0.5400251, -4.094771, 0, 1, 0.5843138, 1,
-0.1641134, 0.7770355, -2.561342, 0, 1, 0.5921569, 1,
-0.1641077, -1.026467, -2.936074, 0, 1, 0.5960785, 1,
-0.1630974, 0.1582995, 0.6540622, 0, 1, 0.6039216, 1,
-0.1574042, 1.478669, -0.4976226, 0, 1, 0.6117647, 1,
-0.1548085, 0.5712873, -0.3460939, 0, 1, 0.6156863, 1,
-0.1499063, 1.401589, -0.8566037, 0, 1, 0.6235294, 1,
-0.143256, -1.482997, -2.754605, 0, 1, 0.627451, 1,
-0.1431131, -0.1765883, -1.88621, 0, 1, 0.6352941, 1,
-0.1402082, -1.684087, -4.016413, 0, 1, 0.6392157, 1,
-0.13948, -1.234697, -4.514442, 0, 1, 0.6470588, 1,
-0.1345217, -0.4239853, -4.087087, 0, 1, 0.6509804, 1,
-0.1252736, 0.1414776, 0.1509064, 0, 1, 0.6588235, 1,
-0.1139352, 0.9996519, -0.343582, 0, 1, 0.6627451, 1,
-0.1074833, 0.5965191, 1.406798, 0, 1, 0.6705883, 1,
-0.1040856, 0.006582668, -1.589736, 0, 1, 0.6745098, 1,
-0.09507959, -0.50157, -2.645683, 0, 1, 0.682353, 1,
-0.09430726, 1.123351, -0.3104942, 0, 1, 0.6862745, 1,
-0.09126058, 0.09923784, -0.1140326, 0, 1, 0.6941177, 1,
-0.09050222, -1.788009, -3.223329, 0, 1, 0.7019608, 1,
-0.09004267, -0.8788995, -4.065407, 0, 1, 0.7058824, 1,
-0.08842338, 0.1190515, -1.181992, 0, 1, 0.7137255, 1,
-0.08700613, -1.096065, -3.439387, 0, 1, 0.7176471, 1,
-0.08280357, 0.4254556, -0.2633302, 0, 1, 0.7254902, 1,
-0.07937851, 0.3720376, -1.775928, 0, 1, 0.7294118, 1,
-0.07408571, 0.9267809, 0.5643045, 0, 1, 0.7372549, 1,
-0.07150307, -0.5181594, -3.308886, 0, 1, 0.7411765, 1,
-0.06665052, 1.949923, -1.734143, 0, 1, 0.7490196, 1,
-0.0616808, 1.183258, 1.206428, 0, 1, 0.7529412, 1,
-0.05607355, -1.432867, -3.010171, 0, 1, 0.7607843, 1,
-0.05511639, -0.05088053, -1.429678, 0, 1, 0.7647059, 1,
-0.05452513, -0.8259555, -6.222106, 0, 1, 0.772549, 1,
-0.04371496, -0.6791256, -4.026304, 0, 1, 0.7764706, 1,
-0.04148822, 0.1680645, 0.4991683, 0, 1, 0.7843137, 1,
-0.04058071, -0.734561, -3.882007, 0, 1, 0.7882353, 1,
-0.03418383, 0.04114371, -1.328657, 0, 1, 0.7960784, 1,
-0.02982701, -0.7593902, -3.783578, 0, 1, 0.8039216, 1,
-0.02523773, 1.024043, 2.535524, 0, 1, 0.8078431, 1,
-0.02111068, 2.054482, -0.002029157, 0, 1, 0.8156863, 1,
-0.0194738, -0.6205394, -3.402042, 0, 1, 0.8196079, 1,
-0.0114084, 2.291009, -0.09520812, 0, 1, 0.827451, 1,
-0.008991794, -1.955747, -1.394479, 0, 1, 0.8313726, 1,
-0.00775913, 0.5805057, 2.104792, 0, 1, 0.8392157, 1,
-0.007335238, -0.58965, -3.473922, 0, 1, 0.8431373, 1,
-0.006166342, -0.2503377, -2.981995, 0, 1, 0.8509804, 1,
-0.0005699703, 1.142849, -1.39171, 0, 1, 0.854902, 1,
0.0002840213, -0.6903247, 2.230224, 0, 1, 0.8627451, 1,
0.002212616, -0.1670959, 2.623343, 0, 1, 0.8666667, 1,
0.002228269, 1.948375, 0.5109897, 0, 1, 0.8745098, 1,
0.003447864, -1.639255, 3.075741, 0, 1, 0.8784314, 1,
0.004408089, 1.666397, 1.291561, 0, 1, 0.8862745, 1,
0.005468406, 0.1713312, -0.6715918, 0, 1, 0.8901961, 1,
0.007796, 0.9335242, 0.1519333, 0, 1, 0.8980392, 1,
0.009844892, -0.2899895, 4.158365, 0, 1, 0.9058824, 1,
0.0122293, -1.722567, 2.204092, 0, 1, 0.9098039, 1,
0.01569487, 0.5281502, -0.108912, 0, 1, 0.9176471, 1,
0.02415641, -0.3298311, 2.347677, 0, 1, 0.9215686, 1,
0.02631381, -2.028813, 3.78955, 0, 1, 0.9294118, 1,
0.02702978, -1.371261, 3.107443, 0, 1, 0.9333333, 1,
0.02764913, 1.098066, 1.184564, 0, 1, 0.9411765, 1,
0.03027754, 2.059497, -1.739652, 0, 1, 0.945098, 1,
0.03032016, -1.935353, 2.836671, 0, 1, 0.9529412, 1,
0.03182315, -0.3652218, 2.413425, 0, 1, 0.9568627, 1,
0.0350276, 1.345765, 1.309476, 0, 1, 0.9647059, 1,
0.04129482, 1.683458, 0.9749259, 0, 1, 0.9686275, 1,
0.04185938, -1.154931, 3.103336, 0, 1, 0.9764706, 1,
0.04452109, 0.6286968, 0.4530165, 0, 1, 0.9803922, 1,
0.04577308, 0.6775324, -1.169285, 0, 1, 0.9882353, 1,
0.04671512, 0.733732, -0.3975562, 0, 1, 0.9921569, 1,
0.04843567, -0.2875547, 2.613473, 0, 1, 1, 1,
0.05408005, -1.309358, 4.314285, 0, 0.9921569, 1, 1,
0.05430317, -0.4669974, 4.12289, 0, 0.9882353, 1, 1,
0.05674637, 1.352409, -0.09135878, 0, 0.9803922, 1, 1,
0.05678604, -2.16973, 2.516123, 0, 0.9764706, 1, 1,
0.05705077, 0.4460739, -0.00532485, 0, 0.9686275, 1, 1,
0.05836473, -0.1589333, 1.587182, 0, 0.9647059, 1, 1,
0.06009165, 0.2494608, -0.9853262, 0, 0.9568627, 1, 1,
0.06446093, 0.1236632, 1.700096, 0, 0.9529412, 1, 1,
0.072776, 0.2269341, -0.2318778, 0, 0.945098, 1, 1,
0.07826809, 1.634849, 0.859486, 0, 0.9411765, 1, 1,
0.08336351, -0.3306741, 3.841828, 0, 0.9333333, 1, 1,
0.08681753, -0.7231668, 4.037797, 0, 0.9294118, 1, 1,
0.08726773, -0.668312, 3.201347, 0, 0.9215686, 1, 1,
0.08835994, -0.1641785, 1.542331, 0, 0.9176471, 1, 1,
0.09048973, 0.5955827, -0.919715, 0, 0.9098039, 1, 1,
0.09348691, 0.04395602, 1.838356, 0, 0.9058824, 1, 1,
0.09551436, -1.242265, 2.567009, 0, 0.8980392, 1, 1,
0.0958219, 0.5800691, 0.7167728, 0, 0.8901961, 1, 1,
0.1013877, -0.04603757, 1.479343, 0, 0.8862745, 1, 1,
0.1014448, 0.3269349, -0.5426093, 0, 0.8784314, 1, 1,
0.1033385, -0.5280664, 2.650059, 0, 0.8745098, 1, 1,
0.1074148, -0.05637695, 2.876559, 0, 0.8666667, 1, 1,
0.1099101, 0.008301291, 2.358816, 0, 0.8627451, 1, 1,
0.1143033, -0.7642202, 3.318085, 0, 0.854902, 1, 1,
0.1165366, -0.6116471, 3.33534, 0, 0.8509804, 1, 1,
0.1182368, 1.09932, 0.7013446, 0, 0.8431373, 1, 1,
0.1194317, -0.379683, 2.321758, 0, 0.8392157, 1, 1,
0.1205015, 0.3081514, 0.4269755, 0, 0.8313726, 1, 1,
0.1212518, -0.4016765, 1.868518, 0, 0.827451, 1, 1,
0.1233812, -0.2671056, 1.631975, 0, 0.8196079, 1, 1,
0.124654, -0.512232, 2.766257, 0, 0.8156863, 1, 1,
0.1259031, 0.4644349, 0.2650905, 0, 0.8078431, 1, 1,
0.1351015, 0.9620994, 1.089631, 0, 0.8039216, 1, 1,
0.1365092, 0.2825909, -0.1719617, 0, 0.7960784, 1, 1,
0.1373011, -0.2252954, 3.607195, 0, 0.7882353, 1, 1,
0.1394372, -0.9182494, 4.841057, 0, 0.7843137, 1, 1,
0.1400589, -0.09128599, 0.4304198, 0, 0.7764706, 1, 1,
0.1462821, -0.2190177, 2.409287, 0, 0.772549, 1, 1,
0.154852, -0.7546682, 2.364287, 0, 0.7647059, 1, 1,
0.1562963, -0.8652317, 4.712752, 0, 0.7607843, 1, 1,
0.1564691, 0.3396392, -0.764712, 0, 0.7529412, 1, 1,
0.1590332, 0.1653484, 0.1138127, 0, 0.7490196, 1, 1,
0.1603171, 0.8000947, -0.003045129, 0, 0.7411765, 1, 1,
0.1643974, 0.5307145, 1.247785, 0, 0.7372549, 1, 1,
0.1718665, 0.08926526, 0.5663621, 0, 0.7294118, 1, 1,
0.1721862, -0.1042931, 2.534768, 0, 0.7254902, 1, 1,
0.1749912, 1.020334, 0.6595353, 0, 0.7176471, 1, 1,
0.1791531, -1.269436, 2.491427, 0, 0.7137255, 1, 1,
0.1799791, 2.500776, 0.2660357, 0, 0.7058824, 1, 1,
0.1863633, -0.1346312, 2.185054, 0, 0.6980392, 1, 1,
0.186716, -1.226112, 3.318638, 0, 0.6941177, 1, 1,
0.1925994, -0.6988768, 1.596437, 0, 0.6862745, 1, 1,
0.1926117, -0.5383877, 4.119466, 0, 0.682353, 1, 1,
0.1964984, 0.2088885, 1.12791, 0, 0.6745098, 1, 1,
0.197357, -0.8305455, 4.518398, 0, 0.6705883, 1, 1,
0.1974546, 1.295873, 0.9875215, 0, 0.6627451, 1, 1,
0.1997511, -0.6629651, 4.080354, 0, 0.6588235, 1, 1,
0.2083335, -0.3550802, 2.608706, 0, 0.6509804, 1, 1,
0.2124832, -1.688057, 3.289258, 0, 0.6470588, 1, 1,
0.213052, 0.1727165, 1.355283, 0, 0.6392157, 1, 1,
0.2148366, 0.3759306, 1.943935, 0, 0.6352941, 1, 1,
0.2182964, -0.9297727, 3.601412, 0, 0.627451, 1, 1,
0.2189963, -0.07932304, 2.735261, 0, 0.6235294, 1, 1,
0.2197095, 0.2745723, 1.003138, 0, 0.6156863, 1, 1,
0.2212608, -0.480385, 3.121762, 0, 0.6117647, 1, 1,
0.2232172, 0.4677521, 1.305647, 0, 0.6039216, 1, 1,
0.2333824, -1.106323, 3.431855, 0, 0.5960785, 1, 1,
0.2369195, -1.153876, 2.67474, 0, 0.5921569, 1, 1,
0.2381323, 1.245152, -1.439187, 0, 0.5843138, 1, 1,
0.2385171, 0.3022635, 1.176104, 0, 0.5803922, 1, 1,
0.248422, -1.500857, 3.245248, 0, 0.572549, 1, 1,
0.2515037, 2.543924, -0.7136495, 0, 0.5686275, 1, 1,
0.2540437, -0.7150509, 2.464158, 0, 0.5607843, 1, 1,
0.2628836, 0.7639635, 0.4094909, 0, 0.5568628, 1, 1,
0.2681955, 0.698014, 0.8360374, 0, 0.5490196, 1, 1,
0.2720171, -0.7001309, 6.392035, 0, 0.5450981, 1, 1,
0.2776324, 1.673973, 1.10963, 0, 0.5372549, 1, 1,
0.282172, -1.133783, 2.04399, 0, 0.5333334, 1, 1,
0.2841395, -0.8867785, -0.02674079, 0, 0.5254902, 1, 1,
0.285515, -0.3233577, 1.926515, 0, 0.5215687, 1, 1,
0.2866184, -0.9003288, 4.039804, 0, 0.5137255, 1, 1,
0.2892458, 0.01374453, 1.0188, 0, 0.509804, 1, 1,
0.2910577, -0.2381573, 2.190895, 0, 0.5019608, 1, 1,
0.2958727, -1.322424, 2.643863, 0, 0.4941176, 1, 1,
0.2972306, -1.780946, 3.812007, 0, 0.4901961, 1, 1,
0.2985555, -1.182233, 2.551064, 0, 0.4823529, 1, 1,
0.3035783, -0.03336335, 1.748713, 0, 0.4784314, 1, 1,
0.3075542, 0.3195937, 0.9028902, 0, 0.4705882, 1, 1,
0.3099507, 1.807542, 0.04847175, 0, 0.4666667, 1, 1,
0.3126079, 1.357433, 0.8452989, 0, 0.4588235, 1, 1,
0.3193791, -1.006901, 3.696159, 0, 0.454902, 1, 1,
0.3204897, 1.713342, -2.921965, 0, 0.4470588, 1, 1,
0.3336549, 0.4256216, 0.904573, 0, 0.4431373, 1, 1,
0.3336728, -1.904244, -0.1646982, 0, 0.4352941, 1, 1,
0.3339971, -2.301642, 5.161679, 0, 0.4313726, 1, 1,
0.3382528, -0.7171425, 1.999137, 0, 0.4235294, 1, 1,
0.3384284, 0.03618658, 1.598325, 0, 0.4196078, 1, 1,
0.3393818, -0.7696636, 2.035194, 0, 0.4117647, 1, 1,
0.3418133, -1.819189, 2.141692, 0, 0.4078431, 1, 1,
0.3455802, 0.6720558, 0.4384579, 0, 0.4, 1, 1,
0.3461896, -0.1710117, 0.9200587, 0, 0.3921569, 1, 1,
0.3494626, -1.136938, 2.992934, 0, 0.3882353, 1, 1,
0.3497063, -0.2662056, 2.51322, 0, 0.3803922, 1, 1,
0.3515077, -0.823741, 3.155773, 0, 0.3764706, 1, 1,
0.3527741, -0.168484, 3.375822, 0, 0.3686275, 1, 1,
0.3531624, -0.6322747, 1.462276, 0, 0.3647059, 1, 1,
0.3596235, -0.1671564, 2.74702, 0, 0.3568628, 1, 1,
0.3599425, 0.2063392, -0.5412287, 0, 0.3529412, 1, 1,
0.3611944, -0.1128248, 1.367855, 0, 0.345098, 1, 1,
0.3673546, -0.1645709, 2.40822, 0, 0.3411765, 1, 1,
0.3673609, 0.381592, 0.7733568, 0, 0.3333333, 1, 1,
0.3674142, -0.4639043, 3.417252, 0, 0.3294118, 1, 1,
0.3694867, 0.6258457, -0.1226309, 0, 0.3215686, 1, 1,
0.3716264, -0.314264, 2.621411, 0, 0.3176471, 1, 1,
0.3736839, 0.1129387, 1.270302, 0, 0.3098039, 1, 1,
0.374595, -0.5518161, 2.629569, 0, 0.3058824, 1, 1,
0.378702, 1.047062, 0.4217087, 0, 0.2980392, 1, 1,
0.3799582, -0.5759519, 3.251207, 0, 0.2901961, 1, 1,
0.3856427, 1.533235, 0.9505571, 0, 0.2862745, 1, 1,
0.3858916, -1.887672, 1.142759, 0, 0.2784314, 1, 1,
0.3859325, 0.5373881, -0.2137832, 0, 0.2745098, 1, 1,
0.387141, 0.9545944, 0.9811663, 0, 0.2666667, 1, 1,
0.3915916, 0.2829236, 1.311701, 0, 0.2627451, 1, 1,
0.3918363, -0.153332, 1.346344, 0, 0.254902, 1, 1,
0.3925675, 1.616386, 1.021391, 0, 0.2509804, 1, 1,
0.3955766, 0.1771588, 1.210948, 0, 0.2431373, 1, 1,
0.3973981, 0.3632881, 0.2817323, 0, 0.2392157, 1, 1,
0.3976462, -0.750144, 4.918476, 0, 0.2313726, 1, 1,
0.4004391, -1.462247, 2.66829, 0, 0.227451, 1, 1,
0.4075056, 0.4024636, 3.351505, 0, 0.2196078, 1, 1,
0.4132984, 0.2840076, 1.598336, 0, 0.2156863, 1, 1,
0.4136808, 0.675302, -1.408962, 0, 0.2078431, 1, 1,
0.414113, -1.058134, 4.63711, 0, 0.2039216, 1, 1,
0.4154514, 1.325204, 0.4175289, 0, 0.1960784, 1, 1,
0.4159112, 0.9384158, 0.9763574, 0, 0.1882353, 1, 1,
0.4185224, 0.4919653, -0.722006, 0, 0.1843137, 1, 1,
0.4193374, 1.004179, 0.9521285, 0, 0.1764706, 1, 1,
0.4195307, -0.01459244, 1.492776, 0, 0.172549, 1, 1,
0.4205432, -1.084557, 1.389995, 0, 0.1647059, 1, 1,
0.4218319, 0.8839369, -0.7828953, 0, 0.1607843, 1, 1,
0.4244951, -0.9053096, 3.128892, 0, 0.1529412, 1, 1,
0.4252375, 1.540832, 1.505622, 0, 0.1490196, 1, 1,
0.4269088, -1.490188, 2.806293, 0, 0.1411765, 1, 1,
0.4290177, 0.1497371, 1.2603, 0, 0.1372549, 1, 1,
0.4296326, 0.2104548, 3.763597, 0, 0.1294118, 1, 1,
0.4307748, -0.7008813, 2.401074, 0, 0.1254902, 1, 1,
0.431048, 0.190956, 1.990429, 0, 0.1176471, 1, 1,
0.4313612, -0.8451461, 3.238359, 0, 0.1137255, 1, 1,
0.4340279, 1.153841, -0.9623353, 0, 0.1058824, 1, 1,
0.4344531, -1.064628, 1.057298, 0, 0.09803922, 1, 1,
0.4359408, -0.8917663, 4.315747, 0, 0.09411765, 1, 1,
0.4400651, -2.210015, 4.679202, 0, 0.08627451, 1, 1,
0.4447786, -1.007286, 2.340344, 0, 0.08235294, 1, 1,
0.4469158, -0.3367511, 1.4458, 0, 0.07450981, 1, 1,
0.4471327, 0.1372029, 0.6164461, 0, 0.07058824, 1, 1,
0.4478962, -1.810778, 3.17973, 0, 0.0627451, 1, 1,
0.4553395, -0.9097621, 3.272933, 0, 0.05882353, 1, 1,
0.4553949, 0.1129519, 1.234035, 0, 0.05098039, 1, 1,
0.4592735, 1.667864, 1.534921, 0, 0.04705882, 1, 1,
0.4613651, -1.085418, 3.138686, 0, 0.03921569, 1, 1,
0.4615935, -1.820384, 3.356504, 0, 0.03529412, 1, 1,
0.4641022, -1.597703, 1.80921, 0, 0.02745098, 1, 1,
0.4679916, -0.9172641, 1.784, 0, 0.02352941, 1, 1,
0.4690772, -0.6252543, 3.206672, 0, 0.01568628, 1, 1,
0.4692086, 1.431447, -0.6126871, 0, 0.01176471, 1, 1,
0.4702215, 1.010948, -0.5388878, 0, 0.003921569, 1, 1,
0.4757735, 1.027861, -0.4787387, 0.003921569, 0, 1, 1,
0.4766422, 0.1625061, 1.433718, 0.007843138, 0, 1, 1,
0.4821755, -0.4351153, 2.548556, 0.01568628, 0, 1, 1,
0.4844291, -0.3343283, 1.663534, 0.01960784, 0, 1, 1,
0.4891997, -0.649061, 2.129824, 0.02745098, 0, 1, 1,
0.4994479, -1.381683, 2.500082, 0.03137255, 0, 1, 1,
0.5015218, -0.09669056, 1.655838, 0.03921569, 0, 1, 1,
0.5025938, 1.012071, 0.8469899, 0.04313726, 0, 1, 1,
0.503993, -1.340648, 3.094223, 0.05098039, 0, 1, 1,
0.5062435, -0.3200413, 1.609051, 0.05490196, 0, 1, 1,
0.5150191, -2.004673, 3.856941, 0.0627451, 0, 1, 1,
0.5161459, 0.4413207, 1.590997, 0.06666667, 0, 1, 1,
0.5217327, 0.7511573, 1.001022, 0.07450981, 0, 1, 1,
0.5223908, -0.3360725, 1.802271, 0.07843138, 0, 1, 1,
0.5297775, -1.177254, 3.048881, 0.08627451, 0, 1, 1,
0.5306308, 0.456343, 0.8086675, 0.09019608, 0, 1, 1,
0.5310036, 0.1513384, 2.059131, 0.09803922, 0, 1, 1,
0.5312098, -1.41219, 2.543513, 0.1058824, 0, 1, 1,
0.5317897, -0.3906207, 2.946224, 0.1098039, 0, 1, 1,
0.5338879, 0.2533429, 2.426501, 0.1176471, 0, 1, 1,
0.5397542, -0.276172, 3.697136, 0.1215686, 0, 1, 1,
0.5398917, 0.3135815, 0.9747295, 0.1294118, 0, 1, 1,
0.5425714, -0.142467, 1.286972, 0.1333333, 0, 1, 1,
0.5434272, 0.2254343, 1.061847, 0.1411765, 0, 1, 1,
0.5463677, 1.369539, 0.8948334, 0.145098, 0, 1, 1,
0.5514072, -0.560787, 2.061713, 0.1529412, 0, 1, 1,
0.5535831, -0.2215935, 1.684239, 0.1568628, 0, 1, 1,
0.5553849, 0.07006416, 2.012077, 0.1647059, 0, 1, 1,
0.5580184, 1.068513, 1.546255, 0.1686275, 0, 1, 1,
0.5587647, -0.9139822, 1.482535, 0.1764706, 0, 1, 1,
0.5607651, -0.2039611, 1.021147, 0.1803922, 0, 1, 1,
0.5614641, 0.2260018, -1.325033, 0.1882353, 0, 1, 1,
0.5632539, -0.1656149, 0.7956269, 0.1921569, 0, 1, 1,
0.5637343, -1.136554, 3.180477, 0.2, 0, 1, 1,
0.5651404, -0.1503506, 2.163718, 0.2078431, 0, 1, 1,
0.5653185, 0.8195686, 1.327977, 0.2117647, 0, 1, 1,
0.5661155, 0.2702174, 0.5286341, 0.2196078, 0, 1, 1,
0.5662944, -0.5050494, 3.097409, 0.2235294, 0, 1, 1,
0.5683942, 2.261189, 0.9407901, 0.2313726, 0, 1, 1,
0.5689024, -0.6409542, 1.09519, 0.2352941, 0, 1, 1,
0.5738, 1.646014, 1.535278, 0.2431373, 0, 1, 1,
0.5738005, 1.453242, -1.300187, 0.2470588, 0, 1, 1,
0.5743082, -0.1100614, 2.655092, 0.254902, 0, 1, 1,
0.5753448, -0.8388472, 3.540705, 0.2588235, 0, 1, 1,
0.5758023, 0.5894201, 0.6428997, 0.2666667, 0, 1, 1,
0.5800138, -0.7494552, 3.510198, 0.2705882, 0, 1, 1,
0.586052, -1.850101, 4.534293, 0.2784314, 0, 1, 1,
0.5906059, 1.166006, 0.1755977, 0.282353, 0, 1, 1,
0.5925016, -0.7838569, 4.739035, 0.2901961, 0, 1, 1,
0.5936062, 1.276922, 0.6979848, 0.2941177, 0, 1, 1,
0.5947325, 0.4524977, 1.550716, 0.3019608, 0, 1, 1,
0.5968401, 1.928683, 0.7469534, 0.3098039, 0, 1, 1,
0.5988679, -0.5132021, 1.593333, 0.3137255, 0, 1, 1,
0.5994972, 1.990693, -1.166164, 0.3215686, 0, 1, 1,
0.604511, -0.7846196, 3.652111, 0.3254902, 0, 1, 1,
0.6125755, 0.5312635, 1.157672, 0.3333333, 0, 1, 1,
0.6139975, 0.7320099, -0.3385499, 0.3372549, 0, 1, 1,
0.6146409, -0.08574311, 1.445112, 0.345098, 0, 1, 1,
0.6151971, 2.071424, 1.173068, 0.3490196, 0, 1, 1,
0.6227175, -1.173458, 3.449111, 0.3568628, 0, 1, 1,
0.6254844, -0.5182013, 0.7967049, 0.3607843, 0, 1, 1,
0.6259145, 0.3409211, 0.5158489, 0.3686275, 0, 1, 1,
0.6286957, -0.4023183, 0.8623107, 0.372549, 0, 1, 1,
0.6288947, -0.1892658, 3.285701, 0.3803922, 0, 1, 1,
0.6292546, 0.9389964, 0.2668076, 0.3843137, 0, 1, 1,
0.6327307, 1.379783, 0.9924048, 0.3921569, 0, 1, 1,
0.6346195, 1.143387, 0.9635742, 0.3960784, 0, 1, 1,
0.637687, 1.200509, -0.518803, 0.4039216, 0, 1, 1,
0.6405006, 0.9480062, -1.273922, 0.4117647, 0, 1, 1,
0.6428763, -0.0826191, 1.258774, 0.4156863, 0, 1, 1,
0.6432391, -0.1146314, 2.070627, 0.4235294, 0, 1, 1,
0.6483566, -0.09229708, 3.599609, 0.427451, 0, 1, 1,
0.6498007, -0.009435619, 0.8109179, 0.4352941, 0, 1, 1,
0.6558868, -1.488753, 3.672425, 0.4392157, 0, 1, 1,
0.6573541, -1.73989, 3.199777, 0.4470588, 0, 1, 1,
0.6634243, 0.4221458, 1.910248, 0.4509804, 0, 1, 1,
0.6638649, -1.08619, 2.298869, 0.4588235, 0, 1, 1,
0.6638973, 0.9006069, -0.5106903, 0.4627451, 0, 1, 1,
0.6655857, 1.507551, -0.7281536, 0.4705882, 0, 1, 1,
0.6703252, 1.336973, 1.968035, 0.4745098, 0, 1, 1,
0.6713622, -1.217771, 2.808263, 0.4823529, 0, 1, 1,
0.6724283, -1.42755, 5.059528, 0.4862745, 0, 1, 1,
0.6770067, 1.252443, -1.122612, 0.4941176, 0, 1, 1,
0.6799546, 1.8702, -0.9198117, 0.5019608, 0, 1, 1,
0.689873, -0.02142508, 2.104568, 0.5058824, 0, 1, 1,
0.6927999, 0.3800516, 1.06982, 0.5137255, 0, 1, 1,
0.6935789, -0.8059787, 2.688205, 0.5176471, 0, 1, 1,
0.6970556, 1.314853, 0.4112003, 0.5254902, 0, 1, 1,
0.6986332, -0.06048147, 1.881237, 0.5294118, 0, 1, 1,
0.7015547, 0.2420371, 0.9704567, 0.5372549, 0, 1, 1,
0.702051, -0.4405628, 0.4605253, 0.5411765, 0, 1, 1,
0.7078596, -1.780509, 3.412946, 0.5490196, 0, 1, 1,
0.7082261, 0.9778145, 0.01742403, 0.5529412, 0, 1, 1,
0.7089077, 0.9313903, -0.2831261, 0.5607843, 0, 1, 1,
0.7144524, -1.699997, 0.7595626, 0.5647059, 0, 1, 1,
0.7170148, -0.6735899, 2.002078, 0.572549, 0, 1, 1,
0.7188923, -0.05806875, 0.7895778, 0.5764706, 0, 1, 1,
0.7188993, 0.003646052, 1.296326, 0.5843138, 0, 1, 1,
0.7234657, 0.1254918, 3.494282, 0.5882353, 0, 1, 1,
0.7283423, 0.02823632, 2.875874, 0.5960785, 0, 1, 1,
0.7288506, -0.7574953, 2.720906, 0.6039216, 0, 1, 1,
0.7303304, -0.8205044, 2.212426, 0.6078432, 0, 1, 1,
0.7332736, -0.2987998, 1.190441, 0.6156863, 0, 1, 1,
0.7432913, 0.04674171, -0.03858687, 0.6196079, 0, 1, 1,
0.7441661, -1.113959, 4.184105, 0.627451, 0, 1, 1,
0.7500561, -1.567757, 3.778051, 0.6313726, 0, 1, 1,
0.7531248, 0.008184862, 1.573765, 0.6392157, 0, 1, 1,
0.754751, 0.278446, 0.9524728, 0.6431373, 0, 1, 1,
0.7555948, 1.029693, 0.5946785, 0.6509804, 0, 1, 1,
0.7609519, -0.005751664, 1.382029, 0.654902, 0, 1, 1,
0.7618228, 0.1782418, 0.9899136, 0.6627451, 0, 1, 1,
0.7636961, 0.1802151, 1.005913, 0.6666667, 0, 1, 1,
0.7663509, -0.2175028, 0.9440834, 0.6745098, 0, 1, 1,
0.7710196, -1.027473, 2.929355, 0.6784314, 0, 1, 1,
0.7750799, 0.9637362, 0.5565489, 0.6862745, 0, 1, 1,
0.7763619, -0.6817057, 3.213845, 0.6901961, 0, 1, 1,
0.781615, 1.148999, 1.33887, 0.6980392, 0, 1, 1,
0.7831452, -0.4481891, 3.467731, 0.7058824, 0, 1, 1,
0.7851645, 0.07352383, -1.187251, 0.7098039, 0, 1, 1,
0.7912817, -0.2909431, 3.164833, 0.7176471, 0, 1, 1,
0.7967532, -0.9275514, 5.433041, 0.7215686, 0, 1, 1,
0.7975168, -0.934, 1.671759, 0.7294118, 0, 1, 1,
0.7989143, 1.874448, 1.498307, 0.7333333, 0, 1, 1,
0.7992953, 0.402139, 0.5309356, 0.7411765, 0, 1, 1,
0.8039773, 0.7080052, 1.123584, 0.7450981, 0, 1, 1,
0.8040685, -0.8115371, 0.6514755, 0.7529412, 0, 1, 1,
0.8047807, -0.01433096, 2.760469, 0.7568628, 0, 1, 1,
0.8049007, -1.280171, 4.127166, 0.7647059, 0, 1, 1,
0.807166, -1.04958, 2.246491, 0.7686275, 0, 1, 1,
0.813982, -0.6893516, 2.358921, 0.7764706, 0, 1, 1,
0.8199254, 0.7227954, -0.2524593, 0.7803922, 0, 1, 1,
0.8283018, 0.4687591, 2.180949, 0.7882353, 0, 1, 1,
0.8303151, -1.465435, 3.640291, 0.7921569, 0, 1, 1,
0.8335142, -1.733497, 1.759165, 0.8, 0, 1, 1,
0.8356028, -0.03363799, 4.508588, 0.8078431, 0, 1, 1,
0.8363982, -0.8111261, 1.466356, 0.8117647, 0, 1, 1,
0.8430883, -1.104683, 3.361013, 0.8196079, 0, 1, 1,
0.844264, -1.121677, 3.714489, 0.8235294, 0, 1, 1,
0.8465853, 0.4165394, -1.499364, 0.8313726, 0, 1, 1,
0.8733431, -1.420023, 3.390509, 0.8352941, 0, 1, 1,
0.8733597, -0.1936387, 1.629868, 0.8431373, 0, 1, 1,
0.8748766, 0.2259915, 1.209887, 0.8470588, 0, 1, 1,
0.8780316, 1.654638, 1.422581, 0.854902, 0, 1, 1,
0.8785924, 1.258538, -0.8368723, 0.8588235, 0, 1, 1,
0.878911, -0.6204057, 2.424036, 0.8666667, 0, 1, 1,
0.8811309, 2.167313, 0.9853573, 0.8705882, 0, 1, 1,
0.88128, 1.916649, -1.534895, 0.8784314, 0, 1, 1,
0.8813103, 0.9946545, 1.39507, 0.8823529, 0, 1, 1,
0.886714, -2.716178, 3.167551, 0.8901961, 0, 1, 1,
0.8898247, -1.810313, 2.406342, 0.8941177, 0, 1, 1,
0.8941491, -0.2063291, 2.995898, 0.9019608, 0, 1, 1,
0.894753, 1.186693, 0.007410712, 0.9098039, 0, 1, 1,
0.897968, 0.6843624, 2.103604, 0.9137255, 0, 1, 1,
0.90001, -0.5964597, 1.290086, 0.9215686, 0, 1, 1,
0.9008871, -0.5049101, -0.4130771, 0.9254902, 0, 1, 1,
0.905671, 0.1049775, 1.921537, 0.9333333, 0, 1, 1,
0.9123976, -0.6489705, 1.431841, 0.9372549, 0, 1, 1,
0.9170299, -0.2041803, 2.310214, 0.945098, 0, 1, 1,
0.9227203, 0.1868436, 1.989346, 0.9490196, 0, 1, 1,
0.9266361, 0.5483345, -0.03524617, 0.9568627, 0, 1, 1,
0.9286387, 0.7349428, 1.18113, 0.9607843, 0, 1, 1,
0.9329257, -0.6187994, 1.550851, 0.9686275, 0, 1, 1,
0.9367299, -1.521091, 2.323708, 0.972549, 0, 1, 1,
0.942988, 1.084961, 1.863332, 0.9803922, 0, 1, 1,
0.9461498, -0.7103673, 3.238019, 0.9843137, 0, 1, 1,
0.9477427, 0.1800566, 0.02583602, 0.9921569, 0, 1, 1,
0.9514101, -0.1547868, 1.564417, 0.9960784, 0, 1, 1,
0.9589558, -0.5466192, 1.682829, 1, 0, 0.9960784, 1,
0.9719908, -2.332449, 3.232175, 1, 0, 0.9882353, 1,
0.9721361, 0.7595392, -0.5257987, 1, 0, 0.9843137, 1,
0.9828982, -1.184002, 3.49299, 1, 0, 0.9764706, 1,
0.9836209, -0.5204685, 1.062808, 1, 0, 0.972549, 1,
0.9878144, -1.470214, 1.41971, 1, 0, 0.9647059, 1,
0.989496, 0.4785345, 2.973768, 1, 0, 0.9607843, 1,
0.9942905, 0.6717848, 0.5498759, 1, 0, 0.9529412, 1,
0.9957978, -0.06284554, 0.2443675, 1, 0, 0.9490196, 1,
1.003681, 0.7374711, -0.1696609, 1, 0, 0.9411765, 1,
1.005443, -0.07408837, 2.531115, 1, 0, 0.9372549, 1,
1.00647, 0.9950654, 0.6696553, 1, 0, 0.9294118, 1,
1.017549, -1.2504, 1.615525, 1, 0, 0.9254902, 1,
1.021425, 0.2542353, 1.332783, 1, 0, 0.9176471, 1,
1.026303, 0.9412871, -1.393436, 1, 0, 0.9137255, 1,
1.034994, -1.222327, 0.9811932, 1, 0, 0.9058824, 1,
1.03712, -0.0003750757, 1.751536, 1, 0, 0.9019608, 1,
1.03839, 1.08709, -0.6995609, 1, 0, 0.8941177, 1,
1.042335, -0.3170496, 1.280128, 1, 0, 0.8862745, 1,
1.058703, 1.024217, 0.01944263, 1, 0, 0.8823529, 1,
1.063317, -0.3462885, 3.365757, 1, 0, 0.8745098, 1,
1.065682, -2.259601, 0.7795971, 1, 0, 0.8705882, 1,
1.066143, -0.1611184, 2.140851, 1, 0, 0.8627451, 1,
1.069601, 0.6327132, 1.063887, 1, 0, 0.8588235, 1,
1.072452, 1.859989, -0.2362042, 1, 0, 0.8509804, 1,
1.076418, -0.7252111, 1.821399, 1, 0, 0.8470588, 1,
1.08239, 0.3963588, 1.198038, 1, 0, 0.8392157, 1,
1.084542, 1.388967, 2.427318, 1, 0, 0.8352941, 1,
1.08868, 0.2608058, 1.101429, 1, 0, 0.827451, 1,
1.090493, -0.8402252, 2.658926, 1, 0, 0.8235294, 1,
1.090757, 0.1311597, 2.185126, 1, 0, 0.8156863, 1,
1.091549, 0.5389004, 0.1391899, 1, 0, 0.8117647, 1,
1.093619, 0.3735228, 0.6230571, 1, 0, 0.8039216, 1,
1.096406, -0.5715494, 1.764793, 1, 0, 0.7960784, 1,
1.10125, -0.2851811, 2.972604, 1, 0, 0.7921569, 1,
1.106809, -0.1382641, 1.919513, 1, 0, 0.7843137, 1,
1.11274, -0.005841035, 1.162279, 1, 0, 0.7803922, 1,
1.117799, -2.111851, 2.040785, 1, 0, 0.772549, 1,
1.130538, 0.1967215, 1.848367, 1, 0, 0.7686275, 1,
1.131539, -0.3066313, 1.457085, 1, 0, 0.7607843, 1,
1.144787, -1.567892, 0.6564421, 1, 0, 0.7568628, 1,
1.161847, 2.241851, 0.7174265, 1, 0, 0.7490196, 1,
1.162262, -0.8377758, 3.876748, 1, 0, 0.7450981, 1,
1.175374, -0.6472061, 2.506026, 1, 0, 0.7372549, 1,
1.175572, 0.2537417, 0.3009562, 1, 0, 0.7333333, 1,
1.176802, -2.190282, 3.722268, 1, 0, 0.7254902, 1,
1.18226, 0.9094343, 0.1642168, 1, 0, 0.7215686, 1,
1.184454, -0.6844083, 2.1171, 1, 0, 0.7137255, 1,
1.187818, 0.1803028, 1.046696, 1, 0, 0.7098039, 1,
1.190299, 0.04998023, 2.194196, 1, 0, 0.7019608, 1,
1.191244, 0.1319221, 1.724657, 1, 0, 0.6941177, 1,
1.192251, -0.1586095, -0.9273555, 1, 0, 0.6901961, 1,
1.192774, -0.3219225, 0.7209615, 1, 0, 0.682353, 1,
1.19329, -0.609301, -0.5984728, 1, 0, 0.6784314, 1,
1.200248, -1.024396, 1.915403, 1, 0, 0.6705883, 1,
1.202266, 1.589155, 0.5873161, 1, 0, 0.6666667, 1,
1.202717, 1.257585, 1.686082, 1, 0, 0.6588235, 1,
1.206918, 0.3641987, 1.534344, 1, 0, 0.654902, 1,
1.207633, 2.181053, 1.788042, 1, 0, 0.6470588, 1,
1.212902, -2.479271, 2.463338, 1, 0, 0.6431373, 1,
1.221974, 0.7022529, 1.443649, 1, 0, 0.6352941, 1,
1.223382, -0.5472103, 1.150054, 1, 0, 0.6313726, 1,
1.226039, -0.3946082, 1.838468, 1, 0, 0.6235294, 1,
1.230015, 0.1061274, 0.9894599, 1, 0, 0.6196079, 1,
1.232819, 1.436534, 0.8748926, 1, 0, 0.6117647, 1,
1.248576, -0.02413415, -0.0109991, 1, 0, 0.6078432, 1,
1.25027, -0.6789306, 2.392373, 1, 0, 0.6, 1,
1.25147, -0.7428228, 1.400973, 1, 0, 0.5921569, 1,
1.25414, -0.006712168, 1.582567, 1, 0, 0.5882353, 1,
1.257739, 0.9980414, 0.9924905, 1, 0, 0.5803922, 1,
1.261539, -1.577176, 3.651244, 1, 0, 0.5764706, 1,
1.261771, -1.667998, 2.566724, 1, 0, 0.5686275, 1,
1.265893, -0.4286722, 1.42444, 1, 0, 0.5647059, 1,
1.268485, 1.199432, 0.3727257, 1, 0, 0.5568628, 1,
1.268935, -1.296354, 2.459153, 1, 0, 0.5529412, 1,
1.269864, -0.8014346, 1.712315, 1, 0, 0.5450981, 1,
1.271882, 1.511805, 0.9119718, 1, 0, 0.5411765, 1,
1.272387, -0.04521995, 0.3566151, 1, 0, 0.5333334, 1,
1.281634, 0.7119974, 1.396742, 1, 0, 0.5294118, 1,
1.290082, 1.244208, -0.09420552, 1, 0, 0.5215687, 1,
1.302158, -0.7370988, 2.759084, 1, 0, 0.5176471, 1,
1.30523, 0.1047228, 2.341086, 1, 0, 0.509804, 1,
1.306367, 0.3655806, 1.585854, 1, 0, 0.5058824, 1,
1.310848, 1.061063, -0.3520938, 1, 0, 0.4980392, 1,
1.321846, -0.2382443, 1.60604, 1, 0, 0.4901961, 1,
1.327751, 1.383157, 1.036142, 1, 0, 0.4862745, 1,
1.333308, 0.8803101, 1.199814, 1, 0, 0.4784314, 1,
1.341164, -0.2182892, 1.045754, 1, 0, 0.4745098, 1,
1.348312, 0.7043453, 1.831474, 1, 0, 0.4666667, 1,
1.355322, -1.021883, 2.830278, 1, 0, 0.4627451, 1,
1.357027, 0.7993065, 0.4361357, 1, 0, 0.454902, 1,
1.365554, 0.006264847, 2.023974, 1, 0, 0.4509804, 1,
1.3659, 0.8884713, -0.3852728, 1, 0, 0.4431373, 1,
1.368192, -1.19442, 0.2309913, 1, 0, 0.4392157, 1,
1.37145, -1.184321, 3.238299, 1, 0, 0.4313726, 1,
1.375865, 0.9579085, 0.8175089, 1, 0, 0.427451, 1,
1.384023, -1.370601, 1.997117, 1, 0, 0.4196078, 1,
1.405907, 0.9265417, 1.238256, 1, 0, 0.4156863, 1,
1.408066, 0.8353672, 1.147182, 1, 0, 0.4078431, 1,
1.413463, 0.5506145, 2.241485, 1, 0, 0.4039216, 1,
1.416977, 1.299194, 0.2258796, 1, 0, 0.3960784, 1,
1.419049, 0.214239, 0.4943834, 1, 0, 0.3882353, 1,
1.420279, -0.8809006, 3.650466, 1, 0, 0.3843137, 1,
1.424155, 0.204169, 1.493604, 1, 0, 0.3764706, 1,
1.425387, 1.24885, 0.8925297, 1, 0, 0.372549, 1,
1.434044, -0.7549025, 2.020869, 1, 0, 0.3647059, 1,
1.451691, -0.03074163, 2.041298, 1, 0, 0.3607843, 1,
1.451704, -2.481587, 2.816197, 1, 0, 0.3529412, 1,
1.452984, -0.1296383, 1.703006, 1, 0, 0.3490196, 1,
1.454509, 0.8331977, 1.528878, 1, 0, 0.3411765, 1,
1.456328, -0.8953001, 4.147928, 1, 0, 0.3372549, 1,
1.457099, 1.702068, -0.3131197, 1, 0, 0.3294118, 1,
1.458184, -0.8934547, -0.3931864, 1, 0, 0.3254902, 1,
1.498405, 0.7191499, 0.5806937, 1, 0, 0.3176471, 1,
1.50055, -0.7324849, 0.8898029, 1, 0, 0.3137255, 1,
1.507772, 0.4661801, 0.3901042, 1, 0, 0.3058824, 1,
1.509436, 1.346953, 0.833555, 1, 0, 0.2980392, 1,
1.516452, 1.242036, 1.928902, 1, 0, 0.2941177, 1,
1.52067, -0.3404337, -0.4926008, 1, 0, 0.2862745, 1,
1.574912, -0.9498234, 2.885903, 1, 0, 0.282353, 1,
1.581536, 1.564546, 2.152802, 1, 0, 0.2745098, 1,
1.587364, 0.02510795, 1.181194, 1, 0, 0.2705882, 1,
1.605748, 0.04195255, 2.434862, 1, 0, 0.2627451, 1,
1.611077, -1.048647, 1.362715, 1, 0, 0.2588235, 1,
1.619111, -0.577691, 1.281668, 1, 0, 0.2509804, 1,
1.621881, 0.2868619, 0.8926551, 1, 0, 0.2470588, 1,
1.625934, -0.577209, 2.298761, 1, 0, 0.2392157, 1,
1.647656, -0.9429229, 1.340838, 1, 0, 0.2352941, 1,
1.673915, 1.283589, 1.469594, 1, 0, 0.227451, 1,
1.684857, -1.307469, 3.279898, 1, 0, 0.2235294, 1,
1.691055, 1.17783, 0.08901886, 1, 0, 0.2156863, 1,
1.700197, 0.7669768, 2.327065, 1, 0, 0.2117647, 1,
1.725591, -1.318992, 1.980893, 1, 0, 0.2039216, 1,
1.737563, 0.5091067, 0.5001735, 1, 0, 0.1960784, 1,
1.75428, -0.516739, 2.770725, 1, 0, 0.1921569, 1,
1.769685, -1.163731, 0.6482357, 1, 0, 0.1843137, 1,
1.789887, 0.6036329, -0.09813556, 1, 0, 0.1803922, 1,
1.797014, -0.22057, 1.83272, 1, 0, 0.172549, 1,
1.811988, -0.8839773, 2.484033, 1, 0, 0.1686275, 1,
1.814413, -1.616608, 2.508092, 1, 0, 0.1607843, 1,
1.823486, 0.6841437, 1.324938, 1, 0, 0.1568628, 1,
1.87328, 0.173497, 2.045281, 1, 0, 0.1490196, 1,
1.967001, -0.06822194, 3.474663, 1, 0, 0.145098, 1,
1.971184, -1.064298, 2.2445, 1, 0, 0.1372549, 1,
1.991058, -2.078706, 2.299921, 1, 0, 0.1333333, 1,
2.006171, -0.4445536, 4.076966, 1, 0, 0.1254902, 1,
2.00946, -0.6393759, 2.810058, 1, 0, 0.1215686, 1,
2.019226, -0.3867107, 1.700277, 1, 0, 0.1137255, 1,
2.050648, -0.06895284, 1.410813, 1, 0, 0.1098039, 1,
2.099467, -1.888145, 1.647885, 1, 0, 0.1019608, 1,
2.111463, 0.2518722, 4.120549, 1, 0, 0.09411765, 1,
2.116644, -0.9629524, 2.629765, 1, 0, 0.09019608, 1,
2.125347, -0.1769106, 3.091128, 1, 0, 0.08235294, 1,
2.267959, 1.522962, 1.923833, 1, 0, 0.07843138, 1,
2.288932, -0.5350417, 2.064918, 1, 0, 0.07058824, 1,
2.328168, -0.205496, 2.164653, 1, 0, 0.06666667, 1,
2.343721, -0.6558012, 2.141421, 1, 0, 0.05882353, 1,
2.366635, 0.3907211, 0.7187212, 1, 0, 0.05490196, 1,
2.369089, 0.2051579, 1.161387, 1, 0, 0.04705882, 1,
2.375422, 0.06043167, 2.500612, 1, 0, 0.04313726, 1,
2.648875, -0.2272731, 2.781659, 1, 0, 0.03529412, 1,
2.868153, -1.487578, -0.5559891, 1, 0, 0.03137255, 1,
3.068899, -0.8348157, 1.976911, 1, 0, 0.02352941, 1,
3.272562, -1.425471, 2.344677, 1, 0, 0.01960784, 1,
3.276971, 0.9487785, 1.239005, 1, 0, 0.01176471, 1,
3.505275, -0.3865745, 3.241868, 1, 0, 0.007843138, 1
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
0.1795506, -4.635472, -8.360203, 0, -0.5, 0.5, 0.5,
0.1795506, -4.635472, -8.360203, 1, -0.5, 0.5, 0.5,
0.1795506, -4.635472, -8.360203, 1, 1.5, 0.5, 0.5,
0.1795506, -4.635472, -8.360203, 0, 1.5, 0.5, 0.5
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
-4.273594, -0.347793, -8.360203, 0, -0.5, 0.5, 0.5,
-4.273594, -0.347793, -8.360203, 1, -0.5, 0.5, 0.5,
-4.273594, -0.347793, -8.360203, 1, 1.5, 0.5, 0.5,
-4.273594, -0.347793, -8.360203, 0, 1.5, 0.5, 0.5
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
-4.273594, -4.635472, 0.08496451, 0, -0.5, 0.5, 0.5,
-4.273594, -4.635472, 0.08496451, 1, -0.5, 0.5, 0.5,
-4.273594, -4.635472, 0.08496451, 1, 1.5, 0.5, 0.5,
-4.273594, -4.635472, 0.08496451, 0, 1.5, 0.5, 0.5
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
-3, -3.646008, -6.411318,
3, -3.646008, -6.411318,
-3, -3.646008, -6.411318,
-3, -3.810919, -6.736132,
-2, -3.646008, -6.411318,
-2, -3.810919, -6.736132,
-1, -3.646008, -6.411318,
-1, -3.810919, -6.736132,
0, -3.646008, -6.411318,
0, -3.810919, -6.736132,
1, -3.646008, -6.411318,
1, -3.810919, -6.736132,
2, -3.646008, -6.411318,
2, -3.810919, -6.736132,
3, -3.646008, -6.411318,
3, -3.810919, -6.736132
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
-3, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
-3, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
-3, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
-3, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
-2, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
-2, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
-2, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
-2, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
-1, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
-1, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
-1, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
-1, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
0, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
0, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
0, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
0, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
1, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
1, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
1, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
1, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
2, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
2, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
2, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
2, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5,
3, -4.14074, -7.38576, 0, -0.5, 0.5, 0.5,
3, -4.14074, -7.38576, 1, -0.5, 0.5, 0.5,
3, -4.14074, -7.38576, 1, 1.5, 0.5, 0.5,
3, -4.14074, -7.38576, 0, 1.5, 0.5, 0.5
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
-3.245945, -3, -6.411318,
-3.245945, 2, -6.411318,
-3.245945, -3, -6.411318,
-3.41722, -3, -6.736132,
-3.245945, -2, -6.411318,
-3.41722, -2, -6.736132,
-3.245945, -1, -6.411318,
-3.41722, -1, -6.736132,
-3.245945, 0, -6.411318,
-3.41722, 0, -6.736132,
-3.245945, 1, -6.411318,
-3.41722, 1, -6.736132,
-3.245945, 2, -6.411318,
-3.41722, 2, -6.736132
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
-3.75977, -3, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, -3, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, -3, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, -3, -7.38576, 0, 1.5, 0.5, 0.5,
-3.75977, -2, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, -2, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, -2, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, -2, -7.38576, 0, 1.5, 0.5, 0.5,
-3.75977, -1, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, -1, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, -1, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, -1, -7.38576, 0, 1.5, 0.5, 0.5,
-3.75977, 0, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, 0, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, 0, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, 0, -7.38576, 0, 1.5, 0.5, 0.5,
-3.75977, 1, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, 1, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, 1, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, 1, -7.38576, 0, 1.5, 0.5, 0.5,
-3.75977, 2, -7.38576, 0, -0.5, 0.5, 0.5,
-3.75977, 2, -7.38576, 1, -0.5, 0.5, 0.5,
-3.75977, 2, -7.38576, 1, 1.5, 0.5, 0.5,
-3.75977, 2, -7.38576, 0, 1.5, 0.5, 0.5
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
-3.245945, -3.646008, -6,
-3.245945, -3.646008, 6,
-3.245945, -3.646008, -6,
-3.41722, -3.810919, -6,
-3.245945, -3.646008, -4,
-3.41722, -3.810919, -4,
-3.245945, -3.646008, -2,
-3.41722, -3.810919, -2,
-3.245945, -3.646008, 0,
-3.41722, -3.810919, 0,
-3.245945, -3.646008, 2,
-3.41722, -3.810919, 2,
-3.245945, -3.646008, 4,
-3.41722, -3.810919, 4,
-3.245945, -3.646008, 6,
-3.41722, -3.810919, 6
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
"-6",
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
-3.75977, -4.14074, -6, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -6, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -6, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, -6, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, -4, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -4, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -4, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, -4, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, -2, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -2, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, -2, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, -2, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 0, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 0, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 0, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 0, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 2, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 2, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 2, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 2, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 4, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 4, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 4, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 4, 0, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 6, 0, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 6, 1, -0.5, 0.5, 0.5,
-3.75977, -4.14074, 6, 1, 1.5, 0.5, 0.5,
-3.75977, -4.14074, 6, 0, 1.5, 0.5, 0.5
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
-3.245945, -3.646008, -6.411318,
-3.245945, 2.950422, -6.411318,
-3.245945, -3.646008, 6.581247,
-3.245945, 2.950422, 6.581247,
-3.245945, -3.646008, -6.411318,
-3.245945, -3.646008, 6.581247,
-3.245945, 2.950422, -6.411318,
-3.245945, 2.950422, 6.581247,
-3.245945, -3.646008, -6.411318,
3.605047, -3.646008, -6.411318,
-3.245945, -3.646008, 6.581247,
3.605047, -3.646008, 6.581247,
-3.245945, 2.950422, -6.411318,
3.605047, 2.950422, -6.411318,
-3.245945, 2.950422, 6.581247,
3.605047, 2.950422, 6.581247,
3.605047, -3.646008, -6.411318,
3.605047, 2.950422, -6.411318,
3.605047, -3.646008, 6.581247,
3.605047, 2.950422, 6.581247,
3.605047, -3.646008, -6.411318,
3.605047, -3.646008, 6.581247,
3.605047, 2.950422, -6.411318,
3.605047, 2.950422, 6.581247
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
var radius = 8.597845;
var distance = 38.25278;
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
mvMatrix.translate( -0.1795506, 0.347793, -0.08496451 );
mvMatrix.scale( 1.356907, 1.409271, 0.7154983 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.25278);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
fluxofenim<-read.table("fluxofenim.xyz")
```

```
## Error in read.table("fluxofenim.xyz"): no lines available in input
```

```r
x<-fluxofenim$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
y<-fluxofenim$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
z<-fluxofenim$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
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
-3.146173, -0.6874943, -1.484065, 0, 0, 1, 1, 1,
-2.939508, -0.3966541, -2.102038, 1, 0, 0, 1, 1,
-2.751617, 0.7774515, -1.490383, 1, 0, 0, 1, 1,
-2.740175, -1.192436, -2.140456, 1, 0, 0, 1, 1,
-2.650925, 0.4714271, -1.157967, 1, 0, 0, 1, 1,
-2.64117, 2.229767, 0.7452015, 1, 0, 0, 1, 1,
-2.576427, 1.443264, 1.129328, 0, 0, 0, 1, 1,
-2.564564, 1.192536, -1.723817, 0, 0, 0, 1, 1,
-2.563621, 1.332436, -1.136551, 0, 0, 0, 1, 1,
-2.461356, 0.6936095, -1.579842, 0, 0, 0, 1, 1,
-2.412505, 0.08665621, -2.903322, 0, 0, 0, 1, 1,
-2.405711, 0.3082559, -1.446604, 0, 0, 0, 1, 1,
-2.389143, 0.05092394, -0.7181597, 0, 0, 0, 1, 1,
-2.361962, -1.466752, -1.914676, 1, 1, 1, 1, 1,
-2.332031, -2.374589, -3.145336, 1, 1, 1, 1, 1,
-2.311566, 1.215126, -1.436848, 1, 1, 1, 1, 1,
-2.273379, 1.287385, -0.003478305, 1, 1, 1, 1, 1,
-2.167064, 1.491301, -1.037423, 1, 1, 1, 1, 1,
-2.146789, -1.629134, -0.5463387, 1, 1, 1, 1, 1,
-2.134255, -1.245897, -1.840863, 1, 1, 1, 1, 1,
-2.133709, 1.989002, -0.5677866, 1, 1, 1, 1, 1,
-2.12764, 1.300151, -1.64985, 1, 1, 1, 1, 1,
-2.092256, -0.700734, -1.573562, 1, 1, 1, 1, 1,
-2.087507, -1.123864, -2.942188, 1, 1, 1, 1, 1,
-2.083807, -1.394046, -2.374131, 1, 1, 1, 1, 1,
-2.082634, 0.9219486, -1.155258, 1, 1, 1, 1, 1,
-2.062205, -2.054211, -4.426114, 1, 1, 1, 1, 1,
-2.045006, 0.6590398, -2.805984, 1, 1, 1, 1, 1,
-2.035193, -0.08239385, -1.00769, 0, 0, 1, 1, 1,
-1.986856, -1.135623, -1.095647, 1, 0, 0, 1, 1,
-1.957582, 0.5199029, -0.6708308, 1, 0, 0, 1, 1,
-1.951478, -1.054893, -2.758628, 1, 0, 0, 1, 1,
-1.913479, -0.5046147, -2.945924, 1, 0, 0, 1, 1,
-1.872438, 2.854357, -2.085028, 1, 0, 0, 1, 1,
-1.870124, 0.2910863, -2.192268, 0, 0, 0, 1, 1,
-1.869655, -1.751773, -1.4803, 0, 0, 0, 1, 1,
-1.86527, 0.636529, -0.8571116, 0, 0, 0, 1, 1,
-1.841474, 0.479511, 1.045258, 0, 0, 0, 1, 1,
-1.837175, -0.4142198, -2.001579, 0, 0, 0, 1, 1,
-1.818355, -0.02338419, -3.317322, 0, 0, 0, 1, 1,
-1.786486, 1.68336, -1.22824, 0, 0, 0, 1, 1,
-1.774947, 0.9405278, 0.1797805, 1, 1, 1, 1, 1,
-1.773952, -0.8797324, -3.249553, 1, 1, 1, 1, 1,
-1.763913, 1.126258, -0.5801249, 1, 1, 1, 1, 1,
-1.751822, 0.6442996, -3.199226, 1, 1, 1, 1, 1,
-1.751148, -1.069442, -4.047689, 1, 1, 1, 1, 1,
-1.750386, 0.5058188, -1.09071, 1, 1, 1, 1, 1,
-1.74609, -1.083937, -2.537529, 1, 1, 1, 1, 1,
-1.724618, -0.5467359, -0.9188055, 1, 1, 1, 1, 1,
-1.717317, 1.014168, -1.211977, 1, 1, 1, 1, 1,
-1.714913, -0.3272504, -1.860189, 1, 1, 1, 1, 1,
-1.711196, 1.355978, -1.380696, 1, 1, 1, 1, 1,
-1.678771, -0.000748714, -4.609491, 1, 1, 1, 1, 1,
-1.66667, -0.50951, -2.87007, 1, 1, 1, 1, 1,
-1.654827, 0.04978739, -2.04332, 1, 1, 1, 1, 1,
-1.653798, 0.9006404, -0.4204465, 1, 1, 1, 1, 1,
-1.641352, 0.7541761, -0.005679424, 0, 0, 1, 1, 1,
-1.6186, 0.6864815, -0.194561, 1, 0, 0, 1, 1,
-1.563349, -0.7273545, 0.03815748, 1, 0, 0, 1, 1,
-1.555733, 0.4981526, -2.033835, 1, 0, 0, 1, 1,
-1.550663, 1.175385, -0.8420038, 1, 0, 0, 1, 1,
-1.535119, -0.7410877, -2.366459, 1, 0, 0, 1, 1,
-1.52951, 0.1208821, -0.6949933, 0, 0, 0, 1, 1,
-1.516331, -0.2836278, 0.5476269, 0, 0, 0, 1, 1,
-1.515316, 1.556068, 0.4730762, 0, 0, 0, 1, 1,
-1.505427, -0.3435093, -3.465463, 0, 0, 0, 1, 1,
-1.503407, 0.8764442, -1.962732, 0, 0, 0, 1, 1,
-1.496782, 1.433466, -0.290106, 0, 0, 0, 1, 1,
-1.483278, -0.6330315, -2.366328, 0, 0, 0, 1, 1,
-1.467794, -0.4301344, -2.376928, 1, 1, 1, 1, 1,
-1.460863, -1.339855, -3.425945, 1, 1, 1, 1, 1,
-1.457239, -0.1721284, -2.085518, 1, 1, 1, 1, 1,
-1.455165, -0.3194093, -4.454184, 1, 1, 1, 1, 1,
-1.453766, -0.357566, -1.960735, 1, 1, 1, 1, 1,
-1.42858, 0.6639647, -0.529936, 1, 1, 1, 1, 1,
-1.425667, -1.352245, -1.26961, 1, 1, 1, 1, 1,
-1.422556, -0.482023, -2.226415, 1, 1, 1, 1, 1,
-1.417922, -0.7281586, -3.771235, 1, 1, 1, 1, 1,
-1.416042, -0.6255891, -1.211486, 1, 1, 1, 1, 1,
-1.415314, -0.7131584, -2.184616, 1, 1, 1, 1, 1,
-1.414047, 0.484897, -1.304633, 1, 1, 1, 1, 1,
-1.41172, -0.2181221, -3.042051, 1, 1, 1, 1, 1,
-1.409097, -1.09311, -3.835033, 1, 1, 1, 1, 1,
-1.403569, 1.231158, -1.520262, 1, 1, 1, 1, 1,
-1.403011, -0.1905943, -1.517104, 0, 0, 1, 1, 1,
-1.383617, 1.497977, -0.1360594, 1, 0, 0, 1, 1,
-1.374602, 0.2605016, -2.458952, 1, 0, 0, 1, 1,
-1.371023, -0.6202582, -0.8729439, 1, 0, 0, 1, 1,
-1.368469, -0.8214145, -4.064402, 1, 0, 0, 1, 1,
-1.366911, -2.066533, -2.858764, 1, 0, 0, 1, 1,
-1.364566, -0.3390588, -2.532071, 0, 0, 0, 1, 1,
-1.362534, 0.06845444, -1.363256, 0, 0, 0, 1, 1,
-1.348895, -0.2281712, -1.243969, 0, 0, 0, 1, 1,
-1.33113, -0.2175781, -0.8903825, 0, 0, 0, 1, 1,
-1.328894, -1.191676, -3.063995, 0, 0, 0, 1, 1,
-1.327757, -1.432371, -3.012603, 0, 0, 0, 1, 1,
-1.32329, -0.8537236, -1.60081, 0, 0, 0, 1, 1,
-1.311528, -1.582841, -1.842094, 1, 1, 1, 1, 1,
-1.308157, 0.4784001, -0.07739135, 1, 1, 1, 1, 1,
-1.305624, 0.1506036, -1.034913, 1, 1, 1, 1, 1,
-1.302008, 0.001412055, -1.677806, 1, 1, 1, 1, 1,
-1.286498, 0.1340493, -3.380776, 1, 1, 1, 1, 1,
-1.27779, 0.3453597, -0.3162994, 1, 1, 1, 1, 1,
-1.272654, 0.05981463, -1.698063, 1, 1, 1, 1, 1,
-1.270787, 0.103789, -0.2817662, 1, 1, 1, 1, 1,
-1.26811, -0.4694732, -2.230411, 1, 1, 1, 1, 1,
-1.259604, 1.121815, -0.3251677, 1, 1, 1, 1, 1,
-1.259321, -0.9003294, -3.040164, 1, 1, 1, 1, 1,
-1.258593, 0.01406485, -1.734396, 1, 1, 1, 1, 1,
-1.249018, 1.789007, -0.5676461, 1, 1, 1, 1, 1,
-1.237777, 0.4144485, -1.765066, 1, 1, 1, 1, 1,
-1.225644, -1.015241, -3.473138, 1, 1, 1, 1, 1,
-1.220908, 0.6133607, -0.1676562, 0, 0, 1, 1, 1,
-1.206607, -1.191252, -0.8970392, 1, 0, 0, 1, 1,
-1.20578, 0.3323808, -1.455889, 1, 0, 0, 1, 1,
-1.201233, -0.02321054, 0.7527825, 1, 0, 0, 1, 1,
-1.17759, -0.7087803, 0.002443295, 1, 0, 0, 1, 1,
-1.173634, 0.5950336, 0.3207821, 1, 0, 0, 1, 1,
-1.16384, 0.6346487, -1.600396, 0, 0, 0, 1, 1,
-1.160835, -0.7848371, -1.446115, 0, 0, 0, 1, 1,
-1.157812, -0.8811406, -2.48761, 0, 0, 0, 1, 1,
-1.153479, 0.4646262, -0.1479142, 0, 0, 0, 1, 1,
-1.149996, -0.1671472, -3.543868, 0, 0, 0, 1, 1,
-1.144846, -2.005815, -4.258044, 0, 0, 0, 1, 1,
-1.140142, 0.1015186, -1.87117, 0, 0, 0, 1, 1,
-1.136189, 0.2500203, -3.052403, 1, 1, 1, 1, 1,
-1.1361, 0.5457913, -0.8869711, 1, 1, 1, 1, 1,
-1.12667, -0.5213683, -2.41884, 1, 1, 1, 1, 1,
-1.11508, 0.862676, -1.60011, 1, 1, 1, 1, 1,
-1.113288, 1.204525, -0.5829652, 1, 1, 1, 1, 1,
-1.112152, -0.4520711, 0.03779165, 1, 1, 1, 1, 1,
-1.11088, 0.7641553, 0.3634491, 1, 1, 1, 1, 1,
-1.109325, 0.2425895, -1.485194, 1, 1, 1, 1, 1,
-1.10393, 0.4662929, -0.6946845, 1, 1, 1, 1, 1,
-1.093471, -1.893269, -3.403998, 1, 1, 1, 1, 1,
-1.087352, -0.3093981, -2.076071, 1, 1, 1, 1, 1,
-1.085753, -0.4447036, -3.357465, 1, 1, 1, 1, 1,
-1.083325, -1.363022, -0.3988254, 1, 1, 1, 1, 1,
-1.076614, -0.07404653, -1.126512, 1, 1, 1, 1, 1,
-1.067981, 0.03189595, -1.79324, 1, 1, 1, 1, 1,
-1.066792, 0.5439107, -0.992853, 0, 0, 1, 1, 1,
-1.058644, 0.0554174, -2.370987, 1, 0, 0, 1, 1,
-1.054403, 0.3000827, -1.198403, 1, 0, 0, 1, 1,
-1.051936, -0.9176625, -4.102428, 1, 0, 0, 1, 1,
-1.036656, 1.025587, -1.131252, 1, 0, 0, 1, 1,
-1.024436, -0.7077235, -1.29504, 1, 0, 0, 1, 1,
-1.022901, -1.450277, -3.221595, 0, 0, 0, 1, 1,
-1.014237, 0.394253, -0.8667483, 0, 0, 0, 1, 1,
-1.00742, 0.3904237, -1.33051, 0, 0, 0, 1, 1,
-1.007345, -1.162232, -0.5608343, 0, 0, 0, 1, 1,
-1.005014, 0.7275881, -0.7252563, 0, 0, 0, 1, 1,
-0.9943033, 2.007974, -0.6733763, 0, 0, 0, 1, 1,
-0.9939919, -0.6844074, -2.048849, 0, 0, 0, 1, 1,
-0.9922463, -0.6017462, -3.150173, 1, 1, 1, 1, 1,
-0.9918749, 1.316036, 0.08214306, 1, 1, 1, 1, 1,
-0.9855437, -0.03814342, -2.890112, 1, 1, 1, 1, 1,
-0.9841178, -0.9170907, -2.332696, 1, 1, 1, 1, 1,
-0.9813107, -1.098902, -2.666529, 1, 1, 1, 1, 1,
-0.980283, 1.84567, 0.5090908, 1, 1, 1, 1, 1,
-0.9747267, 0.2883306, -0.5750893, 1, 1, 1, 1, 1,
-0.974287, -0.7587991, -2.740068, 1, 1, 1, 1, 1,
-0.9692405, -0.6130527, -2.533996, 1, 1, 1, 1, 1,
-0.9667922, 0.1649681, -3.141232, 1, 1, 1, 1, 1,
-0.9646208, 1.53114, 0.2344179, 1, 1, 1, 1, 1,
-0.9581875, -0.6745926, -3.912315, 1, 1, 1, 1, 1,
-0.952727, 0.05624183, -0.3762535, 1, 1, 1, 1, 1,
-0.9486845, -1.169207, -1.176535, 1, 1, 1, 1, 1,
-0.947429, 1.508445, -1.487912, 1, 1, 1, 1, 1,
-0.9457301, -0.2922498, -1.00906, 0, 0, 1, 1, 1,
-0.9432439, -1.214786, -2.430532, 1, 0, 0, 1, 1,
-0.9405732, -0.731424, -3.613397, 1, 0, 0, 1, 1,
-0.9389064, -0.205666, -2.653028, 1, 0, 0, 1, 1,
-0.9315298, -0.2124524, 0.3262524, 1, 0, 0, 1, 1,
-0.9258531, 0.7837525, -1.276317, 1, 0, 0, 1, 1,
-0.9219599, -1.602474, -2.575693, 0, 0, 0, 1, 1,
-0.9194906, -2.305867, -2.746861, 0, 0, 0, 1, 1,
-0.9181641, -0.5676929, -1.844518, 0, 0, 0, 1, 1,
-0.9177651, -0.5757666, -2.805341, 0, 0, 0, 1, 1,
-0.8886897, -2.272446, -3.127655, 0, 0, 0, 1, 1,
-0.8885698, 0.1648805, -2.048044, 0, 0, 0, 1, 1,
-0.885509, -0.5918479, -2.234385, 0, 0, 0, 1, 1,
-0.8829921, 0.6204872, -1.624504, 1, 1, 1, 1, 1,
-0.8821668, -0.3263723, -0.4571022, 1, 1, 1, 1, 1,
-0.8816205, -0.5304912, -3.091107, 1, 1, 1, 1, 1,
-0.8788908, 1.798673, 0.2820267, 1, 1, 1, 1, 1,
-0.8724664, 1.129363, 0.3154129, 1, 1, 1, 1, 1,
-0.8721194, -0.004458538, -2.296162, 1, 1, 1, 1, 1,
-0.8686592, 1.580827, 0.1760526, 1, 1, 1, 1, 1,
-0.8677109, -0.1682052, -2.593033, 1, 1, 1, 1, 1,
-0.8656621, -0.1947276, -0.2775018, 1, 1, 1, 1, 1,
-0.8625249, 2.194245, -1.363507, 1, 1, 1, 1, 1,
-0.8603538, -0.5042618, -2.610985, 1, 1, 1, 1, 1,
-0.854905, -1.704039, -1.75882, 1, 1, 1, 1, 1,
-0.8533757, 0.6560938, -1.47663, 1, 1, 1, 1, 1,
-0.8498507, -0.1332307, -2.155315, 1, 1, 1, 1, 1,
-0.8452355, 0.1381557, 0.4173649, 1, 1, 1, 1, 1,
-0.8427749, 1.039235, -1.344915, 0, 0, 1, 1, 1,
-0.8418938, -1.447362, -3.515514, 1, 0, 0, 1, 1,
-0.839767, -0.865661, -2.187214, 1, 0, 0, 1, 1,
-0.8397137, -0.7101744, -3.244935, 1, 0, 0, 1, 1,
-0.8391773, 1.266521, -0.7619255, 1, 0, 0, 1, 1,
-0.8371506, 0.06476941, -0.4002777, 1, 0, 0, 1, 1,
-0.8358388, -1.153863, -0.5691106, 0, 0, 0, 1, 1,
-0.8299211, -0.8579662, -2.261017, 0, 0, 0, 1, 1,
-0.8181618, -0.4842748, -3.036456, 0, 0, 0, 1, 1,
-0.8136685, 2.060484, -2.777581, 0, 0, 0, 1, 1,
-0.8099265, 1.758079, -0.1949253, 0, 0, 0, 1, 1,
-0.8097281, 0.4661624, -0.4980129, 0, 0, 0, 1, 1,
-0.8052379, -0.1248518, -0.8397581, 0, 0, 0, 1, 1,
-0.8046859, -0.598268, -0.4186709, 1, 1, 1, 1, 1,
-0.8011152, -0.09770137, -3.547729, 1, 1, 1, 1, 1,
-0.7997952, 1.90426, -1.979941, 1, 1, 1, 1, 1,
-0.7994125, 0.7501162, -1.000434, 1, 1, 1, 1, 1,
-0.792718, -0.05854796, -1.357055, 1, 1, 1, 1, 1,
-0.7926691, -1.48176, -1.544917, 1, 1, 1, 1, 1,
-0.787899, 1.317687, -0.005798655, 1, 1, 1, 1, 1,
-0.784274, 0.5375159, 0.816173, 1, 1, 1, 1, 1,
-0.7795753, 0.07278376, -2.48648, 1, 1, 1, 1, 1,
-0.7720416, 0.4405202, 0.347935, 1, 1, 1, 1, 1,
-0.7668424, -1.069865, -1.530495, 1, 1, 1, 1, 1,
-0.7617136, 0.5807634, 0.9637718, 1, 1, 1, 1, 1,
-0.7588348, -1.27637, -2.755295, 1, 1, 1, 1, 1,
-0.7526951, 1.072719, -0.8267822, 1, 1, 1, 1, 1,
-0.7470354, -0.8038073, -1.914059, 1, 1, 1, 1, 1,
-0.7469823, 0.02696193, -3.724357, 0, 0, 1, 1, 1,
-0.7446682, -0.2930914, -2.068938, 1, 0, 0, 1, 1,
-0.7430005, -0.5814795, -2.877562, 1, 0, 0, 1, 1,
-0.7408783, -0.7797189, -2.85432, 1, 0, 0, 1, 1,
-0.7406436, -1.021204, -2.289977, 1, 0, 0, 1, 1,
-0.732738, 0.1031208, -0.8670924, 1, 0, 0, 1, 1,
-0.7299415, 1.305927, -0.6360348, 0, 0, 0, 1, 1,
-0.7275319, 0.08467828, -1.002491, 0, 0, 0, 1, 1,
-0.725929, -0.85625, -2.142648, 0, 0, 0, 1, 1,
-0.7258962, 0.9625322, -1.323145, 0, 0, 0, 1, 1,
-0.7254498, 0.2535513, 0.08180609, 0, 0, 0, 1, 1,
-0.7209438, -0.944488, -2.322849, 0, 0, 0, 1, 1,
-0.7131571, 0.664196, -0.6453096, 0, 0, 0, 1, 1,
-0.7116681, -1.175431, -2.852142, 1, 1, 1, 1, 1,
-0.7100383, -0.589891, -3.485682, 1, 1, 1, 1, 1,
-0.7055151, 1.613212, -0.02999904, 1, 1, 1, 1, 1,
-0.7054216, -0.5816612, -0.5759635, 1, 1, 1, 1, 1,
-0.7039731, 0.05324171, -0.07407013, 1, 1, 1, 1, 1,
-0.7035482, 1.119975, -1.421918, 1, 1, 1, 1, 1,
-0.6930581, -0.0563831, -3.179162, 1, 1, 1, 1, 1,
-0.6925349, 0.2538351, -2.492682, 1, 1, 1, 1, 1,
-0.6856013, -0.3173611, -2.306744, 1, 1, 1, 1, 1,
-0.6796178, 1.193489, -1.264711, 1, 1, 1, 1, 1,
-0.6785582, 1.561591, 1.340988, 1, 1, 1, 1, 1,
-0.6723899, 1.820735, 0.9152389, 1, 1, 1, 1, 1,
-0.6720451, 1.066528, -2.163456, 1, 1, 1, 1, 1,
-0.6717747, 1.0038, -0.9918762, 1, 1, 1, 1, 1,
-0.6703785, 0.7233905, -0.9805933, 1, 1, 1, 1, 1,
-0.6690978, 0.04514777, 0.5313504, 0, 0, 1, 1, 1,
-0.6688351, -1.037654, -2.145057, 1, 0, 0, 1, 1,
-0.6663528, 0.1079458, 0.441411, 1, 0, 0, 1, 1,
-0.6636016, 0.2520718, -3.063797, 1, 0, 0, 1, 1,
-0.6614151, 0.3913894, -2.094987, 1, 0, 0, 1, 1,
-0.6593568, -0.1038028, -1.46309, 1, 0, 0, 1, 1,
-0.6569157, -0.6410373, -2.588331, 0, 0, 0, 1, 1,
-0.6554241, 0.3870999, -0.464081, 0, 0, 0, 1, 1,
-0.6509137, -0.04717558, -3.514404, 0, 0, 0, 1, 1,
-0.6451079, -0.270541, -2.476528, 0, 0, 0, 1, 1,
-0.6430942, -0.1178693, -0.9119578, 0, 0, 0, 1, 1,
-0.6414965, -0.202856, -1.039623, 0, 0, 0, 1, 1,
-0.6399698, -0.4650876, -1.69523, 0, 0, 0, 1, 1,
-0.6393175, -1.397489, -1.471333, 1, 1, 1, 1, 1,
-0.638805, -0.32992, -2.118611, 1, 1, 1, 1, 1,
-0.6313776, -1.410959, -3.007992, 1, 1, 1, 1, 1,
-0.6296588, 0.4034494, -0.3370489, 1, 1, 1, 1, 1,
-0.6252396, -0.638927, -0.6332326, 1, 1, 1, 1, 1,
-0.6231383, -0.6875911, -3.349457, 1, 1, 1, 1, 1,
-0.6230689, 1.278363, -1.215395, 1, 1, 1, 1, 1,
-0.6214896, 0.6147961, -1.362612, 1, 1, 1, 1, 1,
-0.6152267, -0.5109635, -2.145528, 1, 1, 1, 1, 1,
-0.612886, -2.219994, -3.684248, 1, 1, 1, 1, 1,
-0.6113687, -0.1831429, -2.019267, 1, 1, 1, 1, 1,
-0.6082454, 0.3731494, -1.706567, 1, 1, 1, 1, 1,
-0.6071294, 1.228758, -2.765926, 1, 1, 1, 1, 1,
-0.6053474, 0.6298904, -0.5957944, 1, 1, 1, 1, 1,
-0.6024883, -2.698084, -3.652934, 1, 1, 1, 1, 1,
-0.6011809, 0.1985063, 0.2645564, 0, 0, 1, 1, 1,
-0.6008549, -0.4496351, -3.538298, 1, 0, 0, 1, 1,
-0.5989509, -0.1532538, -0.1873056, 1, 0, 0, 1, 1,
-0.5972905, -0.2760707, -3.280487, 1, 0, 0, 1, 1,
-0.5972436, -0.8006307, -2.08204, 1, 0, 0, 1, 1,
-0.5967828, 0.2141892, -2.450318, 1, 0, 0, 1, 1,
-0.5961306, -0.01810388, -0.1843364, 0, 0, 0, 1, 1,
-0.5956237, -0.3239191, -2.172434, 0, 0, 0, 1, 1,
-0.5909511, 0.8181224, 0.5407173, 0, 0, 0, 1, 1,
-0.589065, 0.9450561, -1.27356, 0, 0, 0, 1, 1,
-0.5818028, -0.6137387, -2.600912, 0, 0, 0, 1, 1,
-0.5755001, -0.1972953, -1.997007, 0, 0, 0, 1, 1,
-0.570311, 0.787135, 0.9899693, 0, 0, 0, 1, 1,
-0.5676708, -0.7067647, -2.513485, 1, 1, 1, 1, 1,
-0.5630937, -0.3990879, -3.58079, 1, 1, 1, 1, 1,
-0.5614315, -0.8563179, -4.10043, 1, 1, 1, 1, 1,
-0.5543555, 1.398245, -0.9457948, 1, 1, 1, 1, 1,
-0.55242, -2.437746, -4.462835, 1, 1, 1, 1, 1,
-0.547793, -0.6853487, -1.131834, 1, 1, 1, 1, 1,
-0.5474022, -0.3278968, -2.718006, 1, 1, 1, 1, 1,
-0.5431452, -1.011147, -1.418828, 1, 1, 1, 1, 1,
-0.540282, -2.67524, -4.208033, 1, 1, 1, 1, 1,
-0.5392404, -1.193471, -3.785073, 1, 1, 1, 1, 1,
-0.5333862, 1.049272, -2.074661, 1, 1, 1, 1, 1,
-0.5321935, -1.015622, -1.839857, 1, 1, 1, 1, 1,
-0.5272575, 0.5428262, -1.256179, 1, 1, 1, 1, 1,
-0.5247626, -0.149353, -3.206684, 1, 1, 1, 1, 1,
-0.5233851, -1.574113, -2.225567, 1, 1, 1, 1, 1,
-0.5124915, 1.574546, 0.5230706, 0, 0, 1, 1, 1,
-0.5100699, -0.6325251, -2.896049, 1, 0, 0, 1, 1,
-0.5063754, -0.5055197, -2.136298, 1, 0, 0, 1, 1,
-0.5007738, 0.4707975, 0.6894195, 1, 0, 0, 1, 1,
-0.4956894, 0.2853727, -0.752834, 1, 0, 0, 1, 1,
-0.4940328, 0.1318494, -0.5392703, 1, 0, 0, 1, 1,
-0.4909597, -0.7395667, -1.79042, 0, 0, 0, 1, 1,
-0.4908762, -0.1091705, -2.081203, 0, 0, 0, 1, 1,
-0.4897167, 0.2552581, 0.1334091, 0, 0, 0, 1, 1,
-0.4892118, 0.7345486, -1.896515, 0, 0, 0, 1, 1,
-0.4823848, -0.04037975, -1.213395, 0, 0, 0, 1, 1,
-0.4819427, 0.3358831, -0.1413728, 0, 0, 0, 1, 1,
-0.4636234, 0.4951358, -1.319435, 0, 0, 0, 1, 1,
-0.4620404, 1.470825, -0.988675, 1, 1, 1, 1, 1,
-0.4593492, -1.689911, -2.029341, 1, 1, 1, 1, 1,
-0.4558519, -1.007727, -4.46924, 1, 1, 1, 1, 1,
-0.4547863, -0.4001888, -1.816215, 1, 1, 1, 1, 1,
-0.4500242, 1.626247, 0.1371907, 1, 1, 1, 1, 1,
-0.4448372, -0.5265654, -3.02364, 1, 1, 1, 1, 1,
-0.4440081, 0.6063951, -1.938317, 1, 1, 1, 1, 1,
-0.439694, 1.245329, 0.164643, 1, 1, 1, 1, 1,
-0.4372307, -0.8959711, -1.554784, 1, 1, 1, 1, 1,
-0.4361736, -3.549943, -2.731881, 1, 1, 1, 1, 1,
-0.4326546, -0.4807529, -1.447386, 1, 1, 1, 1, 1,
-0.4285533, 0.664737, -0.3664086, 1, 1, 1, 1, 1,
-0.4282813, -0.2695141, -2.497288, 1, 1, 1, 1, 1,
-0.4248551, 0.4159956, -2.911331, 1, 1, 1, 1, 1,
-0.4192964, 0.3468471, 0.3132229, 1, 1, 1, 1, 1,
-0.4174364, 0.0273739, -1.497412, 0, 0, 1, 1, 1,
-0.4166118, 1.089148, 0.668684, 1, 0, 0, 1, 1,
-0.4163408, 0.962624, -0.939281, 1, 0, 0, 1, 1,
-0.4131505, 0.2373196, -1.332569, 1, 0, 0, 1, 1,
-0.4107485, 0.5846422, -0.2415931, 1, 0, 0, 1, 1,
-0.4021579, 1.334445, 0.5639569, 1, 0, 0, 1, 1,
-0.3970831, -0.8758038, -2.821648, 0, 0, 0, 1, 1,
-0.3958311, 0.01004116, -2.873334, 0, 0, 0, 1, 1,
-0.3952954, -0.343615, -2.157965, 0, 0, 0, 1, 1,
-0.3923353, 1.050171, -0.9909099, 0, 0, 0, 1, 1,
-0.3920034, 1.891843, -1.068245, 0, 0, 0, 1, 1,
-0.3894319, 0.2292816, -1.692965, 0, 0, 0, 1, 1,
-0.3833677, -0.259271, -2.855433, 0, 0, 0, 1, 1,
-0.3783824, 0.7222212, -1.230845, 1, 1, 1, 1, 1,
-0.3768554, -0.743162, -1.842751, 1, 1, 1, 1, 1,
-0.3755852, -0.4340214, -3.725815, 1, 1, 1, 1, 1,
-0.3753176, 0.2322285, -1.900216, 1, 1, 1, 1, 1,
-0.3721453, 0.2761145, 1.51962, 1, 1, 1, 1, 1,
-0.3718586, 1.786242, -0.8467981, 1, 1, 1, 1, 1,
-0.3692482, 1.073325, 0.3383894, 1, 1, 1, 1, 1,
-0.3670034, -0.5677888, -1.586312, 1, 1, 1, 1, 1,
-0.3648603, -0.664261, -2.253332, 1, 1, 1, 1, 1,
-0.3532303, 1.912436, 1.466389, 1, 1, 1, 1, 1,
-0.3532284, -1.283688, -1.187629, 1, 1, 1, 1, 1,
-0.3531392, 0.724799, -2.155765, 1, 1, 1, 1, 1,
-0.3527166, -0.3207, -2.870196, 1, 1, 1, 1, 1,
-0.350641, 0.2649199, -1.296198, 1, 1, 1, 1, 1,
-0.3506102, -1.894535, -2.126665, 1, 1, 1, 1, 1,
-0.3462886, 0.004594977, -1.775931, 0, 0, 1, 1, 1,
-0.3403343, -0.0456849, -0.804352, 1, 0, 0, 1, 1,
-0.3376819, 0.7929063, -1.770048, 1, 0, 0, 1, 1,
-0.3369256, 0.1336651, -1.83094, 1, 0, 0, 1, 1,
-0.3293807, 0.6424245, 0.6830793, 1, 0, 0, 1, 1,
-0.3290734, -0.08715122, -1.565838, 1, 0, 0, 1, 1,
-0.3267787, 0.8302876, -1.956829, 0, 0, 0, 1, 1,
-0.3253094, -0.4856733, -2.407155, 0, 0, 0, 1, 1,
-0.318167, 0.5768971, -0.7365901, 0, 0, 0, 1, 1,
-0.3135177, -0.3018662, -1.0357, 0, 0, 0, 1, 1,
-0.3109442, -0.1042888, -0.7786468, 0, 0, 0, 1, 1,
-0.3003906, 0.3648408, -0.6581712, 0, 0, 0, 1, 1,
-0.3002839, 1.125994, -0.1155226, 0, 0, 0, 1, 1,
-0.3002754, 1.498718, 0.545212, 1, 1, 1, 1, 1,
-0.2986944, -0.425889, -2.926744, 1, 1, 1, 1, 1,
-0.2969888, -0.4769081, -1.835997, 1, 1, 1, 1, 1,
-0.2957058, -1.653379, -2.820217, 1, 1, 1, 1, 1,
-0.2940843, 0.2041577, -3.16835, 1, 1, 1, 1, 1,
-0.2939942, -1.186701, -3.526744, 1, 1, 1, 1, 1,
-0.2910165, -1.358001, -2.242359, 1, 1, 1, 1, 1,
-0.2905091, 2.516899, -0.07702181, 1, 1, 1, 1, 1,
-0.2870491, -0.6182298, -0.7065291, 1, 1, 1, 1, 1,
-0.2849327, -0.9431651, -2.592177, 1, 1, 1, 1, 1,
-0.2827801, -0.811693, -3.304347, 1, 1, 1, 1, 1,
-0.2798631, 0.8182874, 0.7377313, 1, 1, 1, 1, 1,
-0.2767664, 0.4795502, -2.315895, 1, 1, 1, 1, 1,
-0.2711338, -2.444084, -3.535233, 1, 1, 1, 1, 1,
-0.266994, -0.4411089, -1.890649, 1, 1, 1, 1, 1,
-0.2611447, -2.765251, -2.261919, 0, 0, 1, 1, 1,
-0.2545344, -0.7696448, -3.243469, 1, 0, 0, 1, 1,
-0.2523787, 0.1041801, -1.217707, 1, 0, 0, 1, 1,
-0.2490044, -0.527094, -2.604871, 1, 0, 0, 1, 1,
-0.2463974, 0.152194, -0.8303719, 1, 0, 0, 1, 1,
-0.2463587, -0.368179, -3.933129, 1, 0, 0, 1, 1,
-0.2446794, -0.7997194, -3.794235, 0, 0, 0, 1, 1,
-0.2313208, -0.3135668, -1.420593, 0, 0, 0, 1, 1,
-0.228688, 0.4330282, -3.042082, 0, 0, 0, 1, 1,
-0.2211322, 0.3853723, -0.7673575, 0, 0, 0, 1, 1,
-0.2189422, -0.3597539, -3.135257, 0, 0, 0, 1, 1,
-0.2179629, 0.1510875, -1.781653, 0, 0, 0, 1, 1,
-0.217949, -2.560643, -3.534248, 0, 0, 0, 1, 1,
-0.2155047, 0.8187857, 0.7464517, 1, 1, 1, 1, 1,
-0.2146572, 0.2428558, 0.2065106, 1, 1, 1, 1, 1,
-0.2140874, 2.287244, 0.5992365, 1, 1, 1, 1, 1,
-0.2137215, 0.8329841, 0.04433058, 1, 1, 1, 1, 1,
-0.2127276, 1.057874, 0.7963257, 1, 1, 1, 1, 1,
-0.2013444, 0.6406335, -0.00872678, 1, 1, 1, 1, 1,
-0.2000675, -0.07486297, -2.400546, 1, 1, 1, 1, 1,
-0.1978536, -0.896376, -3.150534, 1, 1, 1, 1, 1,
-0.1963987, -0.5802572, -2.204967, 1, 1, 1, 1, 1,
-0.1921274, 0.2691153, -0.6736783, 1, 1, 1, 1, 1,
-0.1918927, 0.7834209, -0.9543099, 1, 1, 1, 1, 1,
-0.1911709, 1.489619, -0.7157553, 1, 1, 1, 1, 1,
-0.1903342, -0.6292042, -3.422259, 1, 1, 1, 1, 1,
-0.1869969, 0.4205063, -0.6367124, 1, 1, 1, 1, 1,
-0.1842135, 0.8254775, -0.8098388, 1, 1, 1, 1, 1,
-0.1835255, -0.08071192, -3.006223, 0, 0, 1, 1, 1,
-0.1830508, 1.848331, -0.2517027, 1, 0, 0, 1, 1,
-0.1817657, 0.07250795, -0.7255271, 1, 0, 0, 1, 1,
-0.1761567, -1.273194, -3.159732, 1, 0, 0, 1, 1,
-0.1758375, 0.05692673, -1.049491, 1, 0, 0, 1, 1,
-0.1746311, -0.7878137, -1.242042, 1, 0, 0, 1, 1,
-0.1739102, 1.326479, -0.4042579, 0, 0, 0, 1, 1,
-0.1708869, 0.735087, -0.246043, 0, 0, 0, 1, 1,
-0.1699657, 1.554579, -0.9761615, 0, 0, 0, 1, 1,
-0.1698867, -0.7725794, -2.223153, 0, 0, 0, 1, 1,
-0.1698788, 1.346505, -1.587965, 0, 0, 0, 1, 1,
-0.1641744, -0.5400251, -4.094771, 0, 0, 0, 1, 1,
-0.1641134, 0.7770355, -2.561342, 0, 0, 0, 1, 1,
-0.1641077, -1.026467, -2.936074, 1, 1, 1, 1, 1,
-0.1630974, 0.1582995, 0.6540622, 1, 1, 1, 1, 1,
-0.1574042, 1.478669, -0.4976226, 1, 1, 1, 1, 1,
-0.1548085, 0.5712873, -0.3460939, 1, 1, 1, 1, 1,
-0.1499063, 1.401589, -0.8566037, 1, 1, 1, 1, 1,
-0.143256, -1.482997, -2.754605, 1, 1, 1, 1, 1,
-0.1431131, -0.1765883, -1.88621, 1, 1, 1, 1, 1,
-0.1402082, -1.684087, -4.016413, 1, 1, 1, 1, 1,
-0.13948, -1.234697, -4.514442, 1, 1, 1, 1, 1,
-0.1345217, -0.4239853, -4.087087, 1, 1, 1, 1, 1,
-0.1252736, 0.1414776, 0.1509064, 1, 1, 1, 1, 1,
-0.1139352, 0.9996519, -0.343582, 1, 1, 1, 1, 1,
-0.1074833, 0.5965191, 1.406798, 1, 1, 1, 1, 1,
-0.1040856, 0.006582668, -1.589736, 1, 1, 1, 1, 1,
-0.09507959, -0.50157, -2.645683, 1, 1, 1, 1, 1,
-0.09430726, 1.123351, -0.3104942, 0, 0, 1, 1, 1,
-0.09126058, 0.09923784, -0.1140326, 1, 0, 0, 1, 1,
-0.09050222, -1.788009, -3.223329, 1, 0, 0, 1, 1,
-0.09004267, -0.8788995, -4.065407, 1, 0, 0, 1, 1,
-0.08842338, 0.1190515, -1.181992, 1, 0, 0, 1, 1,
-0.08700613, -1.096065, -3.439387, 1, 0, 0, 1, 1,
-0.08280357, 0.4254556, -0.2633302, 0, 0, 0, 1, 1,
-0.07937851, 0.3720376, -1.775928, 0, 0, 0, 1, 1,
-0.07408571, 0.9267809, 0.5643045, 0, 0, 0, 1, 1,
-0.07150307, -0.5181594, -3.308886, 0, 0, 0, 1, 1,
-0.06665052, 1.949923, -1.734143, 0, 0, 0, 1, 1,
-0.0616808, 1.183258, 1.206428, 0, 0, 0, 1, 1,
-0.05607355, -1.432867, -3.010171, 0, 0, 0, 1, 1,
-0.05511639, -0.05088053, -1.429678, 1, 1, 1, 1, 1,
-0.05452513, -0.8259555, -6.222106, 1, 1, 1, 1, 1,
-0.04371496, -0.6791256, -4.026304, 1, 1, 1, 1, 1,
-0.04148822, 0.1680645, 0.4991683, 1, 1, 1, 1, 1,
-0.04058071, -0.734561, -3.882007, 1, 1, 1, 1, 1,
-0.03418383, 0.04114371, -1.328657, 1, 1, 1, 1, 1,
-0.02982701, -0.7593902, -3.783578, 1, 1, 1, 1, 1,
-0.02523773, 1.024043, 2.535524, 1, 1, 1, 1, 1,
-0.02111068, 2.054482, -0.002029157, 1, 1, 1, 1, 1,
-0.0194738, -0.6205394, -3.402042, 1, 1, 1, 1, 1,
-0.0114084, 2.291009, -0.09520812, 1, 1, 1, 1, 1,
-0.008991794, -1.955747, -1.394479, 1, 1, 1, 1, 1,
-0.00775913, 0.5805057, 2.104792, 1, 1, 1, 1, 1,
-0.007335238, -0.58965, -3.473922, 1, 1, 1, 1, 1,
-0.006166342, -0.2503377, -2.981995, 1, 1, 1, 1, 1,
-0.0005699703, 1.142849, -1.39171, 0, 0, 1, 1, 1,
0.0002840213, -0.6903247, 2.230224, 1, 0, 0, 1, 1,
0.002212616, -0.1670959, 2.623343, 1, 0, 0, 1, 1,
0.002228269, 1.948375, 0.5109897, 1, 0, 0, 1, 1,
0.003447864, -1.639255, 3.075741, 1, 0, 0, 1, 1,
0.004408089, 1.666397, 1.291561, 1, 0, 0, 1, 1,
0.005468406, 0.1713312, -0.6715918, 0, 0, 0, 1, 1,
0.007796, 0.9335242, 0.1519333, 0, 0, 0, 1, 1,
0.009844892, -0.2899895, 4.158365, 0, 0, 0, 1, 1,
0.0122293, -1.722567, 2.204092, 0, 0, 0, 1, 1,
0.01569487, 0.5281502, -0.108912, 0, 0, 0, 1, 1,
0.02415641, -0.3298311, 2.347677, 0, 0, 0, 1, 1,
0.02631381, -2.028813, 3.78955, 0, 0, 0, 1, 1,
0.02702978, -1.371261, 3.107443, 1, 1, 1, 1, 1,
0.02764913, 1.098066, 1.184564, 1, 1, 1, 1, 1,
0.03027754, 2.059497, -1.739652, 1, 1, 1, 1, 1,
0.03032016, -1.935353, 2.836671, 1, 1, 1, 1, 1,
0.03182315, -0.3652218, 2.413425, 1, 1, 1, 1, 1,
0.0350276, 1.345765, 1.309476, 1, 1, 1, 1, 1,
0.04129482, 1.683458, 0.9749259, 1, 1, 1, 1, 1,
0.04185938, -1.154931, 3.103336, 1, 1, 1, 1, 1,
0.04452109, 0.6286968, 0.4530165, 1, 1, 1, 1, 1,
0.04577308, 0.6775324, -1.169285, 1, 1, 1, 1, 1,
0.04671512, 0.733732, -0.3975562, 1, 1, 1, 1, 1,
0.04843567, -0.2875547, 2.613473, 1, 1, 1, 1, 1,
0.05408005, -1.309358, 4.314285, 1, 1, 1, 1, 1,
0.05430317, -0.4669974, 4.12289, 1, 1, 1, 1, 1,
0.05674637, 1.352409, -0.09135878, 1, 1, 1, 1, 1,
0.05678604, -2.16973, 2.516123, 0, 0, 1, 1, 1,
0.05705077, 0.4460739, -0.00532485, 1, 0, 0, 1, 1,
0.05836473, -0.1589333, 1.587182, 1, 0, 0, 1, 1,
0.06009165, 0.2494608, -0.9853262, 1, 0, 0, 1, 1,
0.06446093, 0.1236632, 1.700096, 1, 0, 0, 1, 1,
0.072776, 0.2269341, -0.2318778, 1, 0, 0, 1, 1,
0.07826809, 1.634849, 0.859486, 0, 0, 0, 1, 1,
0.08336351, -0.3306741, 3.841828, 0, 0, 0, 1, 1,
0.08681753, -0.7231668, 4.037797, 0, 0, 0, 1, 1,
0.08726773, -0.668312, 3.201347, 0, 0, 0, 1, 1,
0.08835994, -0.1641785, 1.542331, 0, 0, 0, 1, 1,
0.09048973, 0.5955827, -0.919715, 0, 0, 0, 1, 1,
0.09348691, 0.04395602, 1.838356, 0, 0, 0, 1, 1,
0.09551436, -1.242265, 2.567009, 1, 1, 1, 1, 1,
0.0958219, 0.5800691, 0.7167728, 1, 1, 1, 1, 1,
0.1013877, -0.04603757, 1.479343, 1, 1, 1, 1, 1,
0.1014448, 0.3269349, -0.5426093, 1, 1, 1, 1, 1,
0.1033385, -0.5280664, 2.650059, 1, 1, 1, 1, 1,
0.1074148, -0.05637695, 2.876559, 1, 1, 1, 1, 1,
0.1099101, 0.008301291, 2.358816, 1, 1, 1, 1, 1,
0.1143033, -0.7642202, 3.318085, 1, 1, 1, 1, 1,
0.1165366, -0.6116471, 3.33534, 1, 1, 1, 1, 1,
0.1182368, 1.09932, 0.7013446, 1, 1, 1, 1, 1,
0.1194317, -0.379683, 2.321758, 1, 1, 1, 1, 1,
0.1205015, 0.3081514, 0.4269755, 1, 1, 1, 1, 1,
0.1212518, -0.4016765, 1.868518, 1, 1, 1, 1, 1,
0.1233812, -0.2671056, 1.631975, 1, 1, 1, 1, 1,
0.124654, -0.512232, 2.766257, 1, 1, 1, 1, 1,
0.1259031, 0.4644349, 0.2650905, 0, 0, 1, 1, 1,
0.1351015, 0.9620994, 1.089631, 1, 0, 0, 1, 1,
0.1365092, 0.2825909, -0.1719617, 1, 0, 0, 1, 1,
0.1373011, -0.2252954, 3.607195, 1, 0, 0, 1, 1,
0.1394372, -0.9182494, 4.841057, 1, 0, 0, 1, 1,
0.1400589, -0.09128599, 0.4304198, 1, 0, 0, 1, 1,
0.1462821, -0.2190177, 2.409287, 0, 0, 0, 1, 1,
0.154852, -0.7546682, 2.364287, 0, 0, 0, 1, 1,
0.1562963, -0.8652317, 4.712752, 0, 0, 0, 1, 1,
0.1564691, 0.3396392, -0.764712, 0, 0, 0, 1, 1,
0.1590332, 0.1653484, 0.1138127, 0, 0, 0, 1, 1,
0.1603171, 0.8000947, -0.003045129, 0, 0, 0, 1, 1,
0.1643974, 0.5307145, 1.247785, 0, 0, 0, 1, 1,
0.1718665, 0.08926526, 0.5663621, 1, 1, 1, 1, 1,
0.1721862, -0.1042931, 2.534768, 1, 1, 1, 1, 1,
0.1749912, 1.020334, 0.6595353, 1, 1, 1, 1, 1,
0.1791531, -1.269436, 2.491427, 1, 1, 1, 1, 1,
0.1799791, 2.500776, 0.2660357, 1, 1, 1, 1, 1,
0.1863633, -0.1346312, 2.185054, 1, 1, 1, 1, 1,
0.186716, -1.226112, 3.318638, 1, 1, 1, 1, 1,
0.1925994, -0.6988768, 1.596437, 1, 1, 1, 1, 1,
0.1926117, -0.5383877, 4.119466, 1, 1, 1, 1, 1,
0.1964984, 0.2088885, 1.12791, 1, 1, 1, 1, 1,
0.197357, -0.8305455, 4.518398, 1, 1, 1, 1, 1,
0.1974546, 1.295873, 0.9875215, 1, 1, 1, 1, 1,
0.1997511, -0.6629651, 4.080354, 1, 1, 1, 1, 1,
0.2083335, -0.3550802, 2.608706, 1, 1, 1, 1, 1,
0.2124832, -1.688057, 3.289258, 1, 1, 1, 1, 1,
0.213052, 0.1727165, 1.355283, 0, 0, 1, 1, 1,
0.2148366, 0.3759306, 1.943935, 1, 0, 0, 1, 1,
0.2182964, -0.9297727, 3.601412, 1, 0, 0, 1, 1,
0.2189963, -0.07932304, 2.735261, 1, 0, 0, 1, 1,
0.2197095, 0.2745723, 1.003138, 1, 0, 0, 1, 1,
0.2212608, -0.480385, 3.121762, 1, 0, 0, 1, 1,
0.2232172, 0.4677521, 1.305647, 0, 0, 0, 1, 1,
0.2333824, -1.106323, 3.431855, 0, 0, 0, 1, 1,
0.2369195, -1.153876, 2.67474, 0, 0, 0, 1, 1,
0.2381323, 1.245152, -1.439187, 0, 0, 0, 1, 1,
0.2385171, 0.3022635, 1.176104, 0, 0, 0, 1, 1,
0.248422, -1.500857, 3.245248, 0, 0, 0, 1, 1,
0.2515037, 2.543924, -0.7136495, 0, 0, 0, 1, 1,
0.2540437, -0.7150509, 2.464158, 1, 1, 1, 1, 1,
0.2628836, 0.7639635, 0.4094909, 1, 1, 1, 1, 1,
0.2681955, 0.698014, 0.8360374, 1, 1, 1, 1, 1,
0.2720171, -0.7001309, 6.392035, 1, 1, 1, 1, 1,
0.2776324, 1.673973, 1.10963, 1, 1, 1, 1, 1,
0.282172, -1.133783, 2.04399, 1, 1, 1, 1, 1,
0.2841395, -0.8867785, -0.02674079, 1, 1, 1, 1, 1,
0.285515, -0.3233577, 1.926515, 1, 1, 1, 1, 1,
0.2866184, -0.9003288, 4.039804, 1, 1, 1, 1, 1,
0.2892458, 0.01374453, 1.0188, 1, 1, 1, 1, 1,
0.2910577, -0.2381573, 2.190895, 1, 1, 1, 1, 1,
0.2958727, -1.322424, 2.643863, 1, 1, 1, 1, 1,
0.2972306, -1.780946, 3.812007, 1, 1, 1, 1, 1,
0.2985555, -1.182233, 2.551064, 1, 1, 1, 1, 1,
0.3035783, -0.03336335, 1.748713, 1, 1, 1, 1, 1,
0.3075542, 0.3195937, 0.9028902, 0, 0, 1, 1, 1,
0.3099507, 1.807542, 0.04847175, 1, 0, 0, 1, 1,
0.3126079, 1.357433, 0.8452989, 1, 0, 0, 1, 1,
0.3193791, -1.006901, 3.696159, 1, 0, 0, 1, 1,
0.3204897, 1.713342, -2.921965, 1, 0, 0, 1, 1,
0.3336549, 0.4256216, 0.904573, 1, 0, 0, 1, 1,
0.3336728, -1.904244, -0.1646982, 0, 0, 0, 1, 1,
0.3339971, -2.301642, 5.161679, 0, 0, 0, 1, 1,
0.3382528, -0.7171425, 1.999137, 0, 0, 0, 1, 1,
0.3384284, 0.03618658, 1.598325, 0, 0, 0, 1, 1,
0.3393818, -0.7696636, 2.035194, 0, 0, 0, 1, 1,
0.3418133, -1.819189, 2.141692, 0, 0, 0, 1, 1,
0.3455802, 0.6720558, 0.4384579, 0, 0, 0, 1, 1,
0.3461896, -0.1710117, 0.9200587, 1, 1, 1, 1, 1,
0.3494626, -1.136938, 2.992934, 1, 1, 1, 1, 1,
0.3497063, -0.2662056, 2.51322, 1, 1, 1, 1, 1,
0.3515077, -0.823741, 3.155773, 1, 1, 1, 1, 1,
0.3527741, -0.168484, 3.375822, 1, 1, 1, 1, 1,
0.3531624, -0.6322747, 1.462276, 1, 1, 1, 1, 1,
0.3596235, -0.1671564, 2.74702, 1, 1, 1, 1, 1,
0.3599425, 0.2063392, -0.5412287, 1, 1, 1, 1, 1,
0.3611944, -0.1128248, 1.367855, 1, 1, 1, 1, 1,
0.3673546, -0.1645709, 2.40822, 1, 1, 1, 1, 1,
0.3673609, 0.381592, 0.7733568, 1, 1, 1, 1, 1,
0.3674142, -0.4639043, 3.417252, 1, 1, 1, 1, 1,
0.3694867, 0.6258457, -0.1226309, 1, 1, 1, 1, 1,
0.3716264, -0.314264, 2.621411, 1, 1, 1, 1, 1,
0.3736839, 0.1129387, 1.270302, 1, 1, 1, 1, 1,
0.374595, -0.5518161, 2.629569, 0, 0, 1, 1, 1,
0.378702, 1.047062, 0.4217087, 1, 0, 0, 1, 1,
0.3799582, -0.5759519, 3.251207, 1, 0, 0, 1, 1,
0.3856427, 1.533235, 0.9505571, 1, 0, 0, 1, 1,
0.3858916, -1.887672, 1.142759, 1, 0, 0, 1, 1,
0.3859325, 0.5373881, -0.2137832, 1, 0, 0, 1, 1,
0.387141, 0.9545944, 0.9811663, 0, 0, 0, 1, 1,
0.3915916, 0.2829236, 1.311701, 0, 0, 0, 1, 1,
0.3918363, -0.153332, 1.346344, 0, 0, 0, 1, 1,
0.3925675, 1.616386, 1.021391, 0, 0, 0, 1, 1,
0.3955766, 0.1771588, 1.210948, 0, 0, 0, 1, 1,
0.3973981, 0.3632881, 0.2817323, 0, 0, 0, 1, 1,
0.3976462, -0.750144, 4.918476, 0, 0, 0, 1, 1,
0.4004391, -1.462247, 2.66829, 1, 1, 1, 1, 1,
0.4075056, 0.4024636, 3.351505, 1, 1, 1, 1, 1,
0.4132984, 0.2840076, 1.598336, 1, 1, 1, 1, 1,
0.4136808, 0.675302, -1.408962, 1, 1, 1, 1, 1,
0.414113, -1.058134, 4.63711, 1, 1, 1, 1, 1,
0.4154514, 1.325204, 0.4175289, 1, 1, 1, 1, 1,
0.4159112, 0.9384158, 0.9763574, 1, 1, 1, 1, 1,
0.4185224, 0.4919653, -0.722006, 1, 1, 1, 1, 1,
0.4193374, 1.004179, 0.9521285, 1, 1, 1, 1, 1,
0.4195307, -0.01459244, 1.492776, 1, 1, 1, 1, 1,
0.4205432, -1.084557, 1.389995, 1, 1, 1, 1, 1,
0.4218319, 0.8839369, -0.7828953, 1, 1, 1, 1, 1,
0.4244951, -0.9053096, 3.128892, 1, 1, 1, 1, 1,
0.4252375, 1.540832, 1.505622, 1, 1, 1, 1, 1,
0.4269088, -1.490188, 2.806293, 1, 1, 1, 1, 1,
0.4290177, 0.1497371, 1.2603, 0, 0, 1, 1, 1,
0.4296326, 0.2104548, 3.763597, 1, 0, 0, 1, 1,
0.4307748, -0.7008813, 2.401074, 1, 0, 0, 1, 1,
0.431048, 0.190956, 1.990429, 1, 0, 0, 1, 1,
0.4313612, -0.8451461, 3.238359, 1, 0, 0, 1, 1,
0.4340279, 1.153841, -0.9623353, 1, 0, 0, 1, 1,
0.4344531, -1.064628, 1.057298, 0, 0, 0, 1, 1,
0.4359408, -0.8917663, 4.315747, 0, 0, 0, 1, 1,
0.4400651, -2.210015, 4.679202, 0, 0, 0, 1, 1,
0.4447786, -1.007286, 2.340344, 0, 0, 0, 1, 1,
0.4469158, -0.3367511, 1.4458, 0, 0, 0, 1, 1,
0.4471327, 0.1372029, 0.6164461, 0, 0, 0, 1, 1,
0.4478962, -1.810778, 3.17973, 0, 0, 0, 1, 1,
0.4553395, -0.9097621, 3.272933, 1, 1, 1, 1, 1,
0.4553949, 0.1129519, 1.234035, 1, 1, 1, 1, 1,
0.4592735, 1.667864, 1.534921, 1, 1, 1, 1, 1,
0.4613651, -1.085418, 3.138686, 1, 1, 1, 1, 1,
0.4615935, -1.820384, 3.356504, 1, 1, 1, 1, 1,
0.4641022, -1.597703, 1.80921, 1, 1, 1, 1, 1,
0.4679916, -0.9172641, 1.784, 1, 1, 1, 1, 1,
0.4690772, -0.6252543, 3.206672, 1, 1, 1, 1, 1,
0.4692086, 1.431447, -0.6126871, 1, 1, 1, 1, 1,
0.4702215, 1.010948, -0.5388878, 1, 1, 1, 1, 1,
0.4757735, 1.027861, -0.4787387, 1, 1, 1, 1, 1,
0.4766422, 0.1625061, 1.433718, 1, 1, 1, 1, 1,
0.4821755, -0.4351153, 2.548556, 1, 1, 1, 1, 1,
0.4844291, -0.3343283, 1.663534, 1, 1, 1, 1, 1,
0.4891997, -0.649061, 2.129824, 1, 1, 1, 1, 1,
0.4994479, -1.381683, 2.500082, 0, 0, 1, 1, 1,
0.5015218, -0.09669056, 1.655838, 1, 0, 0, 1, 1,
0.5025938, 1.012071, 0.8469899, 1, 0, 0, 1, 1,
0.503993, -1.340648, 3.094223, 1, 0, 0, 1, 1,
0.5062435, -0.3200413, 1.609051, 1, 0, 0, 1, 1,
0.5150191, -2.004673, 3.856941, 1, 0, 0, 1, 1,
0.5161459, 0.4413207, 1.590997, 0, 0, 0, 1, 1,
0.5217327, 0.7511573, 1.001022, 0, 0, 0, 1, 1,
0.5223908, -0.3360725, 1.802271, 0, 0, 0, 1, 1,
0.5297775, -1.177254, 3.048881, 0, 0, 0, 1, 1,
0.5306308, 0.456343, 0.8086675, 0, 0, 0, 1, 1,
0.5310036, 0.1513384, 2.059131, 0, 0, 0, 1, 1,
0.5312098, -1.41219, 2.543513, 0, 0, 0, 1, 1,
0.5317897, -0.3906207, 2.946224, 1, 1, 1, 1, 1,
0.5338879, 0.2533429, 2.426501, 1, 1, 1, 1, 1,
0.5397542, -0.276172, 3.697136, 1, 1, 1, 1, 1,
0.5398917, 0.3135815, 0.9747295, 1, 1, 1, 1, 1,
0.5425714, -0.142467, 1.286972, 1, 1, 1, 1, 1,
0.5434272, 0.2254343, 1.061847, 1, 1, 1, 1, 1,
0.5463677, 1.369539, 0.8948334, 1, 1, 1, 1, 1,
0.5514072, -0.560787, 2.061713, 1, 1, 1, 1, 1,
0.5535831, -0.2215935, 1.684239, 1, 1, 1, 1, 1,
0.5553849, 0.07006416, 2.012077, 1, 1, 1, 1, 1,
0.5580184, 1.068513, 1.546255, 1, 1, 1, 1, 1,
0.5587647, -0.9139822, 1.482535, 1, 1, 1, 1, 1,
0.5607651, -0.2039611, 1.021147, 1, 1, 1, 1, 1,
0.5614641, 0.2260018, -1.325033, 1, 1, 1, 1, 1,
0.5632539, -0.1656149, 0.7956269, 1, 1, 1, 1, 1,
0.5637343, -1.136554, 3.180477, 0, 0, 1, 1, 1,
0.5651404, -0.1503506, 2.163718, 1, 0, 0, 1, 1,
0.5653185, 0.8195686, 1.327977, 1, 0, 0, 1, 1,
0.5661155, 0.2702174, 0.5286341, 1, 0, 0, 1, 1,
0.5662944, -0.5050494, 3.097409, 1, 0, 0, 1, 1,
0.5683942, 2.261189, 0.9407901, 1, 0, 0, 1, 1,
0.5689024, -0.6409542, 1.09519, 0, 0, 0, 1, 1,
0.5738, 1.646014, 1.535278, 0, 0, 0, 1, 1,
0.5738005, 1.453242, -1.300187, 0, 0, 0, 1, 1,
0.5743082, -0.1100614, 2.655092, 0, 0, 0, 1, 1,
0.5753448, -0.8388472, 3.540705, 0, 0, 0, 1, 1,
0.5758023, 0.5894201, 0.6428997, 0, 0, 0, 1, 1,
0.5800138, -0.7494552, 3.510198, 0, 0, 0, 1, 1,
0.586052, -1.850101, 4.534293, 1, 1, 1, 1, 1,
0.5906059, 1.166006, 0.1755977, 1, 1, 1, 1, 1,
0.5925016, -0.7838569, 4.739035, 1, 1, 1, 1, 1,
0.5936062, 1.276922, 0.6979848, 1, 1, 1, 1, 1,
0.5947325, 0.4524977, 1.550716, 1, 1, 1, 1, 1,
0.5968401, 1.928683, 0.7469534, 1, 1, 1, 1, 1,
0.5988679, -0.5132021, 1.593333, 1, 1, 1, 1, 1,
0.5994972, 1.990693, -1.166164, 1, 1, 1, 1, 1,
0.604511, -0.7846196, 3.652111, 1, 1, 1, 1, 1,
0.6125755, 0.5312635, 1.157672, 1, 1, 1, 1, 1,
0.6139975, 0.7320099, -0.3385499, 1, 1, 1, 1, 1,
0.6146409, -0.08574311, 1.445112, 1, 1, 1, 1, 1,
0.6151971, 2.071424, 1.173068, 1, 1, 1, 1, 1,
0.6227175, -1.173458, 3.449111, 1, 1, 1, 1, 1,
0.6254844, -0.5182013, 0.7967049, 1, 1, 1, 1, 1,
0.6259145, 0.3409211, 0.5158489, 0, 0, 1, 1, 1,
0.6286957, -0.4023183, 0.8623107, 1, 0, 0, 1, 1,
0.6288947, -0.1892658, 3.285701, 1, 0, 0, 1, 1,
0.6292546, 0.9389964, 0.2668076, 1, 0, 0, 1, 1,
0.6327307, 1.379783, 0.9924048, 1, 0, 0, 1, 1,
0.6346195, 1.143387, 0.9635742, 1, 0, 0, 1, 1,
0.637687, 1.200509, -0.518803, 0, 0, 0, 1, 1,
0.6405006, 0.9480062, -1.273922, 0, 0, 0, 1, 1,
0.6428763, -0.0826191, 1.258774, 0, 0, 0, 1, 1,
0.6432391, -0.1146314, 2.070627, 0, 0, 0, 1, 1,
0.6483566, -0.09229708, 3.599609, 0, 0, 0, 1, 1,
0.6498007, -0.009435619, 0.8109179, 0, 0, 0, 1, 1,
0.6558868, -1.488753, 3.672425, 0, 0, 0, 1, 1,
0.6573541, -1.73989, 3.199777, 1, 1, 1, 1, 1,
0.6634243, 0.4221458, 1.910248, 1, 1, 1, 1, 1,
0.6638649, -1.08619, 2.298869, 1, 1, 1, 1, 1,
0.6638973, 0.9006069, -0.5106903, 1, 1, 1, 1, 1,
0.6655857, 1.507551, -0.7281536, 1, 1, 1, 1, 1,
0.6703252, 1.336973, 1.968035, 1, 1, 1, 1, 1,
0.6713622, -1.217771, 2.808263, 1, 1, 1, 1, 1,
0.6724283, -1.42755, 5.059528, 1, 1, 1, 1, 1,
0.6770067, 1.252443, -1.122612, 1, 1, 1, 1, 1,
0.6799546, 1.8702, -0.9198117, 1, 1, 1, 1, 1,
0.689873, -0.02142508, 2.104568, 1, 1, 1, 1, 1,
0.6927999, 0.3800516, 1.06982, 1, 1, 1, 1, 1,
0.6935789, -0.8059787, 2.688205, 1, 1, 1, 1, 1,
0.6970556, 1.314853, 0.4112003, 1, 1, 1, 1, 1,
0.6986332, -0.06048147, 1.881237, 1, 1, 1, 1, 1,
0.7015547, 0.2420371, 0.9704567, 0, 0, 1, 1, 1,
0.702051, -0.4405628, 0.4605253, 1, 0, 0, 1, 1,
0.7078596, -1.780509, 3.412946, 1, 0, 0, 1, 1,
0.7082261, 0.9778145, 0.01742403, 1, 0, 0, 1, 1,
0.7089077, 0.9313903, -0.2831261, 1, 0, 0, 1, 1,
0.7144524, -1.699997, 0.7595626, 1, 0, 0, 1, 1,
0.7170148, -0.6735899, 2.002078, 0, 0, 0, 1, 1,
0.7188923, -0.05806875, 0.7895778, 0, 0, 0, 1, 1,
0.7188993, 0.003646052, 1.296326, 0, 0, 0, 1, 1,
0.7234657, 0.1254918, 3.494282, 0, 0, 0, 1, 1,
0.7283423, 0.02823632, 2.875874, 0, 0, 0, 1, 1,
0.7288506, -0.7574953, 2.720906, 0, 0, 0, 1, 1,
0.7303304, -0.8205044, 2.212426, 0, 0, 0, 1, 1,
0.7332736, -0.2987998, 1.190441, 1, 1, 1, 1, 1,
0.7432913, 0.04674171, -0.03858687, 1, 1, 1, 1, 1,
0.7441661, -1.113959, 4.184105, 1, 1, 1, 1, 1,
0.7500561, -1.567757, 3.778051, 1, 1, 1, 1, 1,
0.7531248, 0.008184862, 1.573765, 1, 1, 1, 1, 1,
0.754751, 0.278446, 0.9524728, 1, 1, 1, 1, 1,
0.7555948, 1.029693, 0.5946785, 1, 1, 1, 1, 1,
0.7609519, -0.005751664, 1.382029, 1, 1, 1, 1, 1,
0.7618228, 0.1782418, 0.9899136, 1, 1, 1, 1, 1,
0.7636961, 0.1802151, 1.005913, 1, 1, 1, 1, 1,
0.7663509, -0.2175028, 0.9440834, 1, 1, 1, 1, 1,
0.7710196, -1.027473, 2.929355, 1, 1, 1, 1, 1,
0.7750799, 0.9637362, 0.5565489, 1, 1, 1, 1, 1,
0.7763619, -0.6817057, 3.213845, 1, 1, 1, 1, 1,
0.781615, 1.148999, 1.33887, 1, 1, 1, 1, 1,
0.7831452, -0.4481891, 3.467731, 0, 0, 1, 1, 1,
0.7851645, 0.07352383, -1.187251, 1, 0, 0, 1, 1,
0.7912817, -0.2909431, 3.164833, 1, 0, 0, 1, 1,
0.7967532, -0.9275514, 5.433041, 1, 0, 0, 1, 1,
0.7975168, -0.934, 1.671759, 1, 0, 0, 1, 1,
0.7989143, 1.874448, 1.498307, 1, 0, 0, 1, 1,
0.7992953, 0.402139, 0.5309356, 0, 0, 0, 1, 1,
0.8039773, 0.7080052, 1.123584, 0, 0, 0, 1, 1,
0.8040685, -0.8115371, 0.6514755, 0, 0, 0, 1, 1,
0.8047807, -0.01433096, 2.760469, 0, 0, 0, 1, 1,
0.8049007, -1.280171, 4.127166, 0, 0, 0, 1, 1,
0.807166, -1.04958, 2.246491, 0, 0, 0, 1, 1,
0.813982, -0.6893516, 2.358921, 0, 0, 0, 1, 1,
0.8199254, 0.7227954, -0.2524593, 1, 1, 1, 1, 1,
0.8283018, 0.4687591, 2.180949, 1, 1, 1, 1, 1,
0.8303151, -1.465435, 3.640291, 1, 1, 1, 1, 1,
0.8335142, -1.733497, 1.759165, 1, 1, 1, 1, 1,
0.8356028, -0.03363799, 4.508588, 1, 1, 1, 1, 1,
0.8363982, -0.8111261, 1.466356, 1, 1, 1, 1, 1,
0.8430883, -1.104683, 3.361013, 1, 1, 1, 1, 1,
0.844264, -1.121677, 3.714489, 1, 1, 1, 1, 1,
0.8465853, 0.4165394, -1.499364, 1, 1, 1, 1, 1,
0.8733431, -1.420023, 3.390509, 1, 1, 1, 1, 1,
0.8733597, -0.1936387, 1.629868, 1, 1, 1, 1, 1,
0.8748766, 0.2259915, 1.209887, 1, 1, 1, 1, 1,
0.8780316, 1.654638, 1.422581, 1, 1, 1, 1, 1,
0.8785924, 1.258538, -0.8368723, 1, 1, 1, 1, 1,
0.878911, -0.6204057, 2.424036, 1, 1, 1, 1, 1,
0.8811309, 2.167313, 0.9853573, 0, 0, 1, 1, 1,
0.88128, 1.916649, -1.534895, 1, 0, 0, 1, 1,
0.8813103, 0.9946545, 1.39507, 1, 0, 0, 1, 1,
0.886714, -2.716178, 3.167551, 1, 0, 0, 1, 1,
0.8898247, -1.810313, 2.406342, 1, 0, 0, 1, 1,
0.8941491, -0.2063291, 2.995898, 1, 0, 0, 1, 1,
0.894753, 1.186693, 0.007410712, 0, 0, 0, 1, 1,
0.897968, 0.6843624, 2.103604, 0, 0, 0, 1, 1,
0.90001, -0.5964597, 1.290086, 0, 0, 0, 1, 1,
0.9008871, -0.5049101, -0.4130771, 0, 0, 0, 1, 1,
0.905671, 0.1049775, 1.921537, 0, 0, 0, 1, 1,
0.9123976, -0.6489705, 1.431841, 0, 0, 0, 1, 1,
0.9170299, -0.2041803, 2.310214, 0, 0, 0, 1, 1,
0.9227203, 0.1868436, 1.989346, 1, 1, 1, 1, 1,
0.9266361, 0.5483345, -0.03524617, 1, 1, 1, 1, 1,
0.9286387, 0.7349428, 1.18113, 1, 1, 1, 1, 1,
0.9329257, -0.6187994, 1.550851, 1, 1, 1, 1, 1,
0.9367299, -1.521091, 2.323708, 1, 1, 1, 1, 1,
0.942988, 1.084961, 1.863332, 1, 1, 1, 1, 1,
0.9461498, -0.7103673, 3.238019, 1, 1, 1, 1, 1,
0.9477427, 0.1800566, 0.02583602, 1, 1, 1, 1, 1,
0.9514101, -0.1547868, 1.564417, 1, 1, 1, 1, 1,
0.9589558, -0.5466192, 1.682829, 1, 1, 1, 1, 1,
0.9719908, -2.332449, 3.232175, 1, 1, 1, 1, 1,
0.9721361, 0.7595392, -0.5257987, 1, 1, 1, 1, 1,
0.9828982, -1.184002, 3.49299, 1, 1, 1, 1, 1,
0.9836209, -0.5204685, 1.062808, 1, 1, 1, 1, 1,
0.9878144, -1.470214, 1.41971, 1, 1, 1, 1, 1,
0.989496, 0.4785345, 2.973768, 0, 0, 1, 1, 1,
0.9942905, 0.6717848, 0.5498759, 1, 0, 0, 1, 1,
0.9957978, -0.06284554, 0.2443675, 1, 0, 0, 1, 1,
1.003681, 0.7374711, -0.1696609, 1, 0, 0, 1, 1,
1.005443, -0.07408837, 2.531115, 1, 0, 0, 1, 1,
1.00647, 0.9950654, 0.6696553, 1, 0, 0, 1, 1,
1.017549, -1.2504, 1.615525, 0, 0, 0, 1, 1,
1.021425, 0.2542353, 1.332783, 0, 0, 0, 1, 1,
1.026303, 0.9412871, -1.393436, 0, 0, 0, 1, 1,
1.034994, -1.222327, 0.9811932, 0, 0, 0, 1, 1,
1.03712, -0.0003750757, 1.751536, 0, 0, 0, 1, 1,
1.03839, 1.08709, -0.6995609, 0, 0, 0, 1, 1,
1.042335, -0.3170496, 1.280128, 0, 0, 0, 1, 1,
1.058703, 1.024217, 0.01944263, 1, 1, 1, 1, 1,
1.063317, -0.3462885, 3.365757, 1, 1, 1, 1, 1,
1.065682, -2.259601, 0.7795971, 1, 1, 1, 1, 1,
1.066143, -0.1611184, 2.140851, 1, 1, 1, 1, 1,
1.069601, 0.6327132, 1.063887, 1, 1, 1, 1, 1,
1.072452, 1.859989, -0.2362042, 1, 1, 1, 1, 1,
1.076418, -0.7252111, 1.821399, 1, 1, 1, 1, 1,
1.08239, 0.3963588, 1.198038, 1, 1, 1, 1, 1,
1.084542, 1.388967, 2.427318, 1, 1, 1, 1, 1,
1.08868, 0.2608058, 1.101429, 1, 1, 1, 1, 1,
1.090493, -0.8402252, 2.658926, 1, 1, 1, 1, 1,
1.090757, 0.1311597, 2.185126, 1, 1, 1, 1, 1,
1.091549, 0.5389004, 0.1391899, 1, 1, 1, 1, 1,
1.093619, 0.3735228, 0.6230571, 1, 1, 1, 1, 1,
1.096406, -0.5715494, 1.764793, 1, 1, 1, 1, 1,
1.10125, -0.2851811, 2.972604, 0, 0, 1, 1, 1,
1.106809, -0.1382641, 1.919513, 1, 0, 0, 1, 1,
1.11274, -0.005841035, 1.162279, 1, 0, 0, 1, 1,
1.117799, -2.111851, 2.040785, 1, 0, 0, 1, 1,
1.130538, 0.1967215, 1.848367, 1, 0, 0, 1, 1,
1.131539, -0.3066313, 1.457085, 1, 0, 0, 1, 1,
1.144787, -1.567892, 0.6564421, 0, 0, 0, 1, 1,
1.161847, 2.241851, 0.7174265, 0, 0, 0, 1, 1,
1.162262, -0.8377758, 3.876748, 0, 0, 0, 1, 1,
1.175374, -0.6472061, 2.506026, 0, 0, 0, 1, 1,
1.175572, 0.2537417, 0.3009562, 0, 0, 0, 1, 1,
1.176802, -2.190282, 3.722268, 0, 0, 0, 1, 1,
1.18226, 0.9094343, 0.1642168, 0, 0, 0, 1, 1,
1.184454, -0.6844083, 2.1171, 1, 1, 1, 1, 1,
1.187818, 0.1803028, 1.046696, 1, 1, 1, 1, 1,
1.190299, 0.04998023, 2.194196, 1, 1, 1, 1, 1,
1.191244, 0.1319221, 1.724657, 1, 1, 1, 1, 1,
1.192251, -0.1586095, -0.9273555, 1, 1, 1, 1, 1,
1.192774, -0.3219225, 0.7209615, 1, 1, 1, 1, 1,
1.19329, -0.609301, -0.5984728, 1, 1, 1, 1, 1,
1.200248, -1.024396, 1.915403, 1, 1, 1, 1, 1,
1.202266, 1.589155, 0.5873161, 1, 1, 1, 1, 1,
1.202717, 1.257585, 1.686082, 1, 1, 1, 1, 1,
1.206918, 0.3641987, 1.534344, 1, 1, 1, 1, 1,
1.207633, 2.181053, 1.788042, 1, 1, 1, 1, 1,
1.212902, -2.479271, 2.463338, 1, 1, 1, 1, 1,
1.221974, 0.7022529, 1.443649, 1, 1, 1, 1, 1,
1.223382, -0.5472103, 1.150054, 1, 1, 1, 1, 1,
1.226039, -0.3946082, 1.838468, 0, 0, 1, 1, 1,
1.230015, 0.1061274, 0.9894599, 1, 0, 0, 1, 1,
1.232819, 1.436534, 0.8748926, 1, 0, 0, 1, 1,
1.248576, -0.02413415, -0.0109991, 1, 0, 0, 1, 1,
1.25027, -0.6789306, 2.392373, 1, 0, 0, 1, 1,
1.25147, -0.7428228, 1.400973, 1, 0, 0, 1, 1,
1.25414, -0.006712168, 1.582567, 0, 0, 0, 1, 1,
1.257739, 0.9980414, 0.9924905, 0, 0, 0, 1, 1,
1.261539, -1.577176, 3.651244, 0, 0, 0, 1, 1,
1.261771, -1.667998, 2.566724, 0, 0, 0, 1, 1,
1.265893, -0.4286722, 1.42444, 0, 0, 0, 1, 1,
1.268485, 1.199432, 0.3727257, 0, 0, 0, 1, 1,
1.268935, -1.296354, 2.459153, 0, 0, 0, 1, 1,
1.269864, -0.8014346, 1.712315, 1, 1, 1, 1, 1,
1.271882, 1.511805, 0.9119718, 1, 1, 1, 1, 1,
1.272387, -0.04521995, 0.3566151, 1, 1, 1, 1, 1,
1.281634, 0.7119974, 1.396742, 1, 1, 1, 1, 1,
1.290082, 1.244208, -0.09420552, 1, 1, 1, 1, 1,
1.302158, -0.7370988, 2.759084, 1, 1, 1, 1, 1,
1.30523, 0.1047228, 2.341086, 1, 1, 1, 1, 1,
1.306367, 0.3655806, 1.585854, 1, 1, 1, 1, 1,
1.310848, 1.061063, -0.3520938, 1, 1, 1, 1, 1,
1.321846, -0.2382443, 1.60604, 1, 1, 1, 1, 1,
1.327751, 1.383157, 1.036142, 1, 1, 1, 1, 1,
1.333308, 0.8803101, 1.199814, 1, 1, 1, 1, 1,
1.341164, -0.2182892, 1.045754, 1, 1, 1, 1, 1,
1.348312, 0.7043453, 1.831474, 1, 1, 1, 1, 1,
1.355322, -1.021883, 2.830278, 1, 1, 1, 1, 1,
1.357027, 0.7993065, 0.4361357, 0, 0, 1, 1, 1,
1.365554, 0.006264847, 2.023974, 1, 0, 0, 1, 1,
1.3659, 0.8884713, -0.3852728, 1, 0, 0, 1, 1,
1.368192, -1.19442, 0.2309913, 1, 0, 0, 1, 1,
1.37145, -1.184321, 3.238299, 1, 0, 0, 1, 1,
1.375865, 0.9579085, 0.8175089, 1, 0, 0, 1, 1,
1.384023, -1.370601, 1.997117, 0, 0, 0, 1, 1,
1.405907, 0.9265417, 1.238256, 0, 0, 0, 1, 1,
1.408066, 0.8353672, 1.147182, 0, 0, 0, 1, 1,
1.413463, 0.5506145, 2.241485, 0, 0, 0, 1, 1,
1.416977, 1.299194, 0.2258796, 0, 0, 0, 1, 1,
1.419049, 0.214239, 0.4943834, 0, 0, 0, 1, 1,
1.420279, -0.8809006, 3.650466, 0, 0, 0, 1, 1,
1.424155, 0.204169, 1.493604, 1, 1, 1, 1, 1,
1.425387, 1.24885, 0.8925297, 1, 1, 1, 1, 1,
1.434044, -0.7549025, 2.020869, 1, 1, 1, 1, 1,
1.451691, -0.03074163, 2.041298, 1, 1, 1, 1, 1,
1.451704, -2.481587, 2.816197, 1, 1, 1, 1, 1,
1.452984, -0.1296383, 1.703006, 1, 1, 1, 1, 1,
1.454509, 0.8331977, 1.528878, 1, 1, 1, 1, 1,
1.456328, -0.8953001, 4.147928, 1, 1, 1, 1, 1,
1.457099, 1.702068, -0.3131197, 1, 1, 1, 1, 1,
1.458184, -0.8934547, -0.3931864, 1, 1, 1, 1, 1,
1.498405, 0.7191499, 0.5806937, 1, 1, 1, 1, 1,
1.50055, -0.7324849, 0.8898029, 1, 1, 1, 1, 1,
1.507772, 0.4661801, 0.3901042, 1, 1, 1, 1, 1,
1.509436, 1.346953, 0.833555, 1, 1, 1, 1, 1,
1.516452, 1.242036, 1.928902, 1, 1, 1, 1, 1,
1.52067, -0.3404337, -0.4926008, 0, 0, 1, 1, 1,
1.574912, -0.9498234, 2.885903, 1, 0, 0, 1, 1,
1.581536, 1.564546, 2.152802, 1, 0, 0, 1, 1,
1.587364, 0.02510795, 1.181194, 1, 0, 0, 1, 1,
1.605748, 0.04195255, 2.434862, 1, 0, 0, 1, 1,
1.611077, -1.048647, 1.362715, 1, 0, 0, 1, 1,
1.619111, -0.577691, 1.281668, 0, 0, 0, 1, 1,
1.621881, 0.2868619, 0.8926551, 0, 0, 0, 1, 1,
1.625934, -0.577209, 2.298761, 0, 0, 0, 1, 1,
1.647656, -0.9429229, 1.340838, 0, 0, 0, 1, 1,
1.673915, 1.283589, 1.469594, 0, 0, 0, 1, 1,
1.684857, -1.307469, 3.279898, 0, 0, 0, 1, 1,
1.691055, 1.17783, 0.08901886, 0, 0, 0, 1, 1,
1.700197, 0.7669768, 2.327065, 1, 1, 1, 1, 1,
1.725591, -1.318992, 1.980893, 1, 1, 1, 1, 1,
1.737563, 0.5091067, 0.5001735, 1, 1, 1, 1, 1,
1.75428, -0.516739, 2.770725, 1, 1, 1, 1, 1,
1.769685, -1.163731, 0.6482357, 1, 1, 1, 1, 1,
1.789887, 0.6036329, -0.09813556, 1, 1, 1, 1, 1,
1.797014, -0.22057, 1.83272, 1, 1, 1, 1, 1,
1.811988, -0.8839773, 2.484033, 1, 1, 1, 1, 1,
1.814413, -1.616608, 2.508092, 1, 1, 1, 1, 1,
1.823486, 0.6841437, 1.324938, 1, 1, 1, 1, 1,
1.87328, 0.173497, 2.045281, 1, 1, 1, 1, 1,
1.967001, -0.06822194, 3.474663, 1, 1, 1, 1, 1,
1.971184, -1.064298, 2.2445, 1, 1, 1, 1, 1,
1.991058, -2.078706, 2.299921, 1, 1, 1, 1, 1,
2.006171, -0.4445536, 4.076966, 1, 1, 1, 1, 1,
2.00946, -0.6393759, 2.810058, 0, 0, 1, 1, 1,
2.019226, -0.3867107, 1.700277, 1, 0, 0, 1, 1,
2.050648, -0.06895284, 1.410813, 1, 0, 0, 1, 1,
2.099467, -1.888145, 1.647885, 1, 0, 0, 1, 1,
2.111463, 0.2518722, 4.120549, 1, 0, 0, 1, 1,
2.116644, -0.9629524, 2.629765, 1, 0, 0, 1, 1,
2.125347, -0.1769106, 3.091128, 0, 0, 0, 1, 1,
2.267959, 1.522962, 1.923833, 0, 0, 0, 1, 1,
2.288932, -0.5350417, 2.064918, 0, 0, 0, 1, 1,
2.328168, -0.205496, 2.164653, 0, 0, 0, 1, 1,
2.343721, -0.6558012, 2.141421, 0, 0, 0, 1, 1,
2.366635, 0.3907211, 0.7187212, 0, 0, 0, 1, 1,
2.369089, 0.2051579, 1.161387, 0, 0, 0, 1, 1,
2.375422, 0.06043167, 2.500612, 1, 1, 1, 1, 1,
2.648875, -0.2272731, 2.781659, 1, 1, 1, 1, 1,
2.868153, -1.487578, -0.5559891, 1, 1, 1, 1, 1,
3.068899, -0.8348157, 1.976911, 1, 1, 1, 1, 1,
3.272562, -1.425471, 2.344677, 1, 1, 1, 1, 1,
3.276971, 0.9487785, 1.239005, 1, 1, 1, 1, 1,
3.505275, -0.3865745, 3.241868, 1, 1, 1, 1, 1
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
var radius = 10.42178;
var distance = 36.60607;
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
mvMatrix.translate( -0.1795506, 0.3477929, -0.08496451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.60607);
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
