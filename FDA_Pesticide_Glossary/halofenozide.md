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
-3.715991, -0.2678846, -1.641404, 1, 0, 0, 1,
-2.663733, 0.006846397, -1.164477, 1, 0.007843138, 0, 1,
-2.602851, -0.7070138, -2.166917, 1, 0.01176471, 0, 1,
-2.563236, -0.733877, -0.7089399, 1, 0.01960784, 0, 1,
-2.454765, -0.2766836, -1.766029, 1, 0.02352941, 0, 1,
-2.454664, -0.5285143, -2.023044, 1, 0.03137255, 0, 1,
-2.436981, -1.19632, -2.405223, 1, 0.03529412, 0, 1,
-2.330456, -0.4358187, -1.889137, 1, 0.04313726, 0, 1,
-2.312451, 0.9851835, -1.744014, 1, 0.04705882, 0, 1,
-2.282648, -0.8777404, -2.293255, 1, 0.05490196, 0, 1,
-2.261679, -1.764241, -3.054973, 1, 0.05882353, 0, 1,
-2.233493, -0.04655478, -4.210652, 1, 0.06666667, 0, 1,
-2.232914, 2.575459, -1.487562, 1, 0.07058824, 0, 1,
-2.217619, 1.325511, -0.7656983, 1, 0.07843138, 0, 1,
-2.178519, 0.3708415, -1.105175, 1, 0.08235294, 0, 1,
-2.1628, -1.682621, -1.176894, 1, 0.09019608, 0, 1,
-2.14897, 0.3401665, -2.46296, 1, 0.09411765, 0, 1,
-2.120711, 1.577629, -0.4410619, 1, 0.1019608, 0, 1,
-2.085181, -1.072698, 1.273296, 1, 0.1098039, 0, 1,
-2.066438, 1.56842, -0.4177718, 1, 0.1137255, 0, 1,
-2.053258, 1.122363, -0.8909373, 1, 0.1215686, 0, 1,
-2.047338, 0.317399, -1.264121, 1, 0.1254902, 0, 1,
-2.043217, 1.31931, -1.17845, 1, 0.1333333, 0, 1,
-2.036304, -0.3301373, -1.802416, 1, 0.1372549, 0, 1,
-2.031301, -2.83254, -1.438791, 1, 0.145098, 0, 1,
-2.002498, -1.399004, -3.30308, 1, 0.1490196, 0, 1,
-2.000799, -0.2960636, -0.2762803, 1, 0.1568628, 0, 1,
-1.96142, -1.102453, -2.103261, 1, 0.1607843, 0, 1,
-1.959329, 0.6341493, -1.174321, 1, 0.1686275, 0, 1,
-1.947871, 0.6818334, -1.47307, 1, 0.172549, 0, 1,
-1.942726, -0.09680054, -0.6682866, 1, 0.1803922, 0, 1,
-1.937281, -0.7193886, -1.333658, 1, 0.1843137, 0, 1,
-1.92772, -0.1147017, -1.072051, 1, 0.1921569, 0, 1,
-1.915445, -0.489301, 0.160151, 1, 0.1960784, 0, 1,
-1.890679, 0.009229745, -0.458813, 1, 0.2039216, 0, 1,
-1.889127, 1.135121, -0.6628398, 1, 0.2117647, 0, 1,
-1.882149, -0.6003537, -3.110365, 1, 0.2156863, 0, 1,
-1.878747, -0.7549398, -2.261373, 1, 0.2235294, 0, 1,
-1.866854, -0.2082138, -1.013575, 1, 0.227451, 0, 1,
-1.84821, 0.2674042, -1.853234, 1, 0.2352941, 0, 1,
-1.819323, -0.4914604, -1.265077, 1, 0.2392157, 0, 1,
-1.814999, -0.516241, 0.2890808, 1, 0.2470588, 0, 1,
-1.800725, 0.4949377, 0.2866713, 1, 0.2509804, 0, 1,
-1.757417, -2.984267, -4.30249, 1, 0.2588235, 0, 1,
-1.721843, -0.8159225, -2.585721, 1, 0.2627451, 0, 1,
-1.721734, -1.187206, -1.309728, 1, 0.2705882, 0, 1,
-1.718807, -0.09478889, -0.7439042, 1, 0.2745098, 0, 1,
-1.703539, -2.224952, -1.879499, 1, 0.282353, 0, 1,
-1.700653, 0.09670779, 0.2336272, 1, 0.2862745, 0, 1,
-1.700118, 0.1100608, -0.323507, 1, 0.2941177, 0, 1,
-1.690207, 1.716291, -1.394776, 1, 0.3019608, 0, 1,
-1.688127, 2.395056, -0.8749737, 1, 0.3058824, 0, 1,
-1.669756, -0.1675967, -1.457378, 1, 0.3137255, 0, 1,
-1.665492, 0.5428968, -0.06515447, 1, 0.3176471, 0, 1,
-1.665285, -0.393185, -0.3679458, 1, 0.3254902, 0, 1,
-1.66017, 0.5618453, -0.364186, 1, 0.3294118, 0, 1,
-1.639614, -0.2567807, -0.988627, 1, 0.3372549, 0, 1,
-1.637552, -0.2812164, -2.401333, 1, 0.3411765, 0, 1,
-1.62384, 1.586786, -0.2884237, 1, 0.3490196, 0, 1,
-1.616496, -0.06378693, -3.326637, 1, 0.3529412, 0, 1,
-1.604138, 0.3938036, -0.9402516, 1, 0.3607843, 0, 1,
-1.591239, -2.155422, -2.222502, 1, 0.3647059, 0, 1,
-1.585689, -0.02856983, -1.640096, 1, 0.372549, 0, 1,
-1.579186, -0.3761986, -1.610723, 1, 0.3764706, 0, 1,
-1.562412, -1.005872, -1.873509, 1, 0.3843137, 0, 1,
-1.547483, 0.8282284, -0.7792501, 1, 0.3882353, 0, 1,
-1.545625, -0.9133483, -1.18697, 1, 0.3960784, 0, 1,
-1.543722, -0.3623901, -2.024852, 1, 0.4039216, 0, 1,
-1.541273, -1.216237, -2.70198, 1, 0.4078431, 0, 1,
-1.534488, 1.238295, -0.417109, 1, 0.4156863, 0, 1,
-1.533268, 0.4523005, -3.033368, 1, 0.4196078, 0, 1,
-1.525608, -0.355144, -1.999353, 1, 0.427451, 0, 1,
-1.525002, -1.647333, -2.867482, 1, 0.4313726, 0, 1,
-1.523504, -0.3915587, -2.830613, 1, 0.4392157, 0, 1,
-1.522346, -0.07167993, -0.8281674, 1, 0.4431373, 0, 1,
-1.515696, -0.05736878, -2.243947, 1, 0.4509804, 0, 1,
-1.509491, 0.02712733, -1.969122, 1, 0.454902, 0, 1,
-1.506782, -1.030572, -2.566896, 1, 0.4627451, 0, 1,
-1.504054, 0.414861, -2.340008, 1, 0.4666667, 0, 1,
-1.485768, 0.2469427, -1.388035, 1, 0.4745098, 0, 1,
-1.482348, 0.1140022, -1.668195, 1, 0.4784314, 0, 1,
-1.479644, 2.26912, -1.593633, 1, 0.4862745, 0, 1,
-1.474478, 1.096309, -0.766978, 1, 0.4901961, 0, 1,
-1.470851, 0.6581544, -2.125736, 1, 0.4980392, 0, 1,
-1.460956, 0.2155992, -0.7448771, 1, 0.5058824, 0, 1,
-1.456491, -0.01016501, -2.813073, 1, 0.509804, 0, 1,
-1.423339, 0.07107425, -1.273802, 1, 0.5176471, 0, 1,
-1.419476, 0.9397769, -1.125791, 1, 0.5215687, 0, 1,
-1.413487, -0.06101051, -0.3103203, 1, 0.5294118, 0, 1,
-1.411705, 1.584229, 0.01252739, 1, 0.5333334, 0, 1,
-1.410375, -0.5358065, -3.628451, 1, 0.5411765, 0, 1,
-1.410141, -1.746462, -2.303799, 1, 0.5450981, 0, 1,
-1.400983, -0.1079821, -0.374244, 1, 0.5529412, 0, 1,
-1.383304, 1.015308, 2.172384, 1, 0.5568628, 0, 1,
-1.371695, -0.05459171, -2.392703, 1, 0.5647059, 0, 1,
-1.366697, 0.1171864, -3.103658, 1, 0.5686275, 0, 1,
-1.366458, -0.8135197, -3.91828, 1, 0.5764706, 0, 1,
-1.366086, -0.08270594, -0.4839175, 1, 0.5803922, 0, 1,
-1.338674, 1.887139, 0.4754854, 1, 0.5882353, 0, 1,
-1.326136, 1.134938, 1.174582, 1, 0.5921569, 0, 1,
-1.325531, 2.722973, 0.18477, 1, 0.6, 0, 1,
-1.324522, 1.105307, -1.096469, 1, 0.6078432, 0, 1,
-1.318934, 2.102278, -1.775876, 1, 0.6117647, 0, 1,
-1.317923, -0.3398304, -3.556228, 1, 0.6196079, 0, 1,
-1.3141, -0.1934358, -1.224785, 1, 0.6235294, 0, 1,
-1.313188, 0.2127472, -0.6159201, 1, 0.6313726, 0, 1,
-1.310351, 1.277743, -0.90554, 1, 0.6352941, 0, 1,
-1.305195, 0.313427, -1.847189, 1, 0.6431373, 0, 1,
-1.302203, -0.4223869, -0.3464978, 1, 0.6470588, 0, 1,
-1.291321, 0.6515918, -0.05557603, 1, 0.654902, 0, 1,
-1.287441, 0.1423676, -1.49556, 1, 0.6588235, 0, 1,
-1.286448, -0.8898467, -2.373813, 1, 0.6666667, 0, 1,
-1.28029, 1.35027, -1.39818, 1, 0.6705883, 0, 1,
-1.277779, -0.7833028, -3.026815, 1, 0.6784314, 0, 1,
-1.265275, 1.088688, -0.7577122, 1, 0.682353, 0, 1,
-1.259877, -1.118403, -1.592059, 1, 0.6901961, 0, 1,
-1.258715, 0.9863915, -2.097704, 1, 0.6941177, 0, 1,
-1.242874, 0.09610468, -2.523096, 1, 0.7019608, 0, 1,
-1.24218, -0.1400398, -0.8560326, 1, 0.7098039, 0, 1,
-1.241062, 0.4400533, -1.928722, 1, 0.7137255, 0, 1,
-1.229092, -1.558275, -2.66852, 1, 0.7215686, 0, 1,
-1.220615, 1.145107, 0.8618209, 1, 0.7254902, 0, 1,
-1.206224, 0.02072181, 1.009228, 1, 0.7333333, 0, 1,
-1.200671, 2.26984, 0.4187399, 1, 0.7372549, 0, 1,
-1.198556, 2.34128, -0.5740509, 1, 0.7450981, 0, 1,
-1.196993, -0.381076, -1.766175, 1, 0.7490196, 0, 1,
-1.190368, -0.474869, -1.364346, 1, 0.7568628, 0, 1,
-1.188584, -1.261807, -3.477441, 1, 0.7607843, 0, 1,
-1.16977, 0.1172931, -1.390852, 1, 0.7686275, 0, 1,
-1.164866, 1.341421, 0.7031931, 1, 0.772549, 0, 1,
-1.162946, 0.5619237, -1.306457, 1, 0.7803922, 0, 1,
-1.157159, -0.03578085, -0.3905945, 1, 0.7843137, 0, 1,
-1.156008, 1.033685, -0.7850754, 1, 0.7921569, 0, 1,
-1.155648, -0.68725, -1.765808, 1, 0.7960784, 0, 1,
-1.154741, -0.3955269, -1.400138, 1, 0.8039216, 0, 1,
-1.15147, -1.426453, -3.067335, 1, 0.8117647, 0, 1,
-1.138027, 1.343742, 1.108296, 1, 0.8156863, 0, 1,
-1.137897, -0.5213019, -2.142607, 1, 0.8235294, 0, 1,
-1.13462, 0.8521476, -3.480558, 1, 0.827451, 0, 1,
-1.129608, 0.317182, -1.126959, 1, 0.8352941, 0, 1,
-1.122838, 0.8072412, -0.4919447, 1, 0.8392157, 0, 1,
-1.111549, 1.162763, 0.9891645, 1, 0.8470588, 0, 1,
-1.103581, -1.575912, -2.705594, 1, 0.8509804, 0, 1,
-1.102459, 0.2207005, -1.038684, 1, 0.8588235, 0, 1,
-1.101909, -0.4183321, -1.630522, 1, 0.8627451, 0, 1,
-1.094413, 0.2596837, -3.593977, 1, 0.8705882, 0, 1,
-1.09161, -1.349875, -1.062567, 1, 0.8745098, 0, 1,
-1.088744, 0.4719686, -1.329502, 1, 0.8823529, 0, 1,
-1.077948, 1.670429, -1.901286, 1, 0.8862745, 0, 1,
-1.070447, -0.4939979, -0.9658195, 1, 0.8941177, 0, 1,
-1.070287, 0.9946625, -1.731363, 1, 0.8980392, 0, 1,
-1.065371, -0.6925434, -0.6229275, 1, 0.9058824, 0, 1,
-1.059687, 1.026795, 0.8317717, 1, 0.9137255, 0, 1,
-1.053855, 0.7339607, -2.472153, 1, 0.9176471, 0, 1,
-1.051287, -1.055758, -2.399463, 1, 0.9254902, 0, 1,
-1.051182, 0.4215255, -1.299207, 1, 0.9294118, 0, 1,
-1.049908, 0.9897299, -1.862888, 1, 0.9372549, 0, 1,
-1.048117, 0.2985356, -1.805433, 1, 0.9411765, 0, 1,
-1.042469, 1.571497, 0.1965206, 1, 0.9490196, 0, 1,
-1.042441, -0.9491462, -3.328178, 1, 0.9529412, 0, 1,
-1.039412, 0.2414891, -0.5071328, 1, 0.9607843, 0, 1,
-1.037295, 0.7358127, -1.760058, 1, 0.9647059, 0, 1,
-1.035991, 0.3235729, -0.3124209, 1, 0.972549, 0, 1,
-1.03386, -0.8016041, 0.6253157, 1, 0.9764706, 0, 1,
-1.032253, -0.1596853, 0.2885093, 1, 0.9843137, 0, 1,
-1.029643, -0.4850754, -4.887137, 1, 0.9882353, 0, 1,
-1.028013, -0.3637877, -3.017323, 1, 0.9960784, 0, 1,
-1.019169, 0.4159952, -2.247896, 0.9960784, 1, 0, 1,
-1.01583, 0.1148776, -1.317436, 0.9921569, 1, 0, 1,
-1.01296, -0.2333382, -2.775719, 0.9843137, 1, 0, 1,
-1.01138, -0.5239421, 1.401029, 0.9803922, 1, 0, 1,
-1.011233, -1.850053, -3.368209, 0.972549, 1, 0, 1,
-1.008963, 1.024913, -1.042911, 0.9686275, 1, 0, 1,
-1.006903, 0.9044951, 0.3330815, 0.9607843, 1, 0, 1,
-1.005888, 1.844852, -1.977918, 0.9568627, 1, 0, 1,
-1.002001, -0.7008733, -1.436007, 0.9490196, 1, 0, 1,
-1.000908, 1.130961, 0.4292153, 0.945098, 1, 0, 1,
-0.9945671, 1.034725, -3.634432, 0.9372549, 1, 0, 1,
-0.9939228, 1.42651, -2.39015, 0.9333333, 1, 0, 1,
-0.9899583, 0.7999215, -1.429693, 0.9254902, 1, 0, 1,
-0.9808787, -1.42767, -3.475384, 0.9215686, 1, 0, 1,
-0.9733151, -2.603566, -3.232043, 0.9137255, 1, 0, 1,
-0.9726881, -0.7677646, -2.286856, 0.9098039, 1, 0, 1,
-0.9699273, -0.1514871, -1.637076, 0.9019608, 1, 0, 1,
-0.9695652, -0.1276813, -2.269183, 0.8941177, 1, 0, 1,
-0.9556931, 1.028514, -1.062658, 0.8901961, 1, 0, 1,
-0.9548154, 0.003089691, -1.879562, 0.8823529, 1, 0, 1,
-0.9500335, 0.4557617, 0.467694, 0.8784314, 1, 0, 1,
-0.9482261, 0.2110277, -3.685004, 0.8705882, 1, 0, 1,
-0.9418119, 0.3219625, -2.279489, 0.8666667, 1, 0, 1,
-0.9267364, -0.6283484, -0.8148236, 0.8588235, 1, 0, 1,
-0.9240426, -1.340307, -2.687011, 0.854902, 1, 0, 1,
-0.9179149, -0.4631214, -2.702845, 0.8470588, 1, 0, 1,
-0.915587, 0.03579928, -0.5913946, 0.8431373, 1, 0, 1,
-0.9091405, 0.01236416, -0.8262551, 0.8352941, 1, 0, 1,
-0.9037514, -1.403251, -1.969405, 0.8313726, 1, 0, 1,
-0.900516, -1.241032, -2.23845, 0.8235294, 1, 0, 1,
-0.8924895, 1.699518, -0.2825327, 0.8196079, 1, 0, 1,
-0.8915324, -0.5865456, -2.187198, 0.8117647, 1, 0, 1,
-0.8883833, -1.266074, -3.434075, 0.8078431, 1, 0, 1,
-0.887758, -0.2032914, -3.291984, 0.8, 1, 0, 1,
-0.8805534, 0.1941356, -2.893058, 0.7921569, 1, 0, 1,
-0.8783582, -2.43981, -3.865479, 0.7882353, 1, 0, 1,
-0.8772971, 0.09144325, -0.2990513, 0.7803922, 1, 0, 1,
-0.8749593, 0.7787167, -1.344224, 0.7764706, 1, 0, 1,
-0.8681466, -1.470312, -1.767812, 0.7686275, 1, 0, 1,
-0.8652549, 1.256807, -2.062718, 0.7647059, 1, 0, 1,
-0.8604987, -1.026956, -1.745428, 0.7568628, 1, 0, 1,
-0.8595265, -1.393771, -0.297421, 0.7529412, 1, 0, 1,
-0.8565044, -1.067426, -2.23974, 0.7450981, 1, 0, 1,
-0.8499525, -2.061424, -2.392198, 0.7411765, 1, 0, 1,
-0.8469533, -0.4228829, -3.14882, 0.7333333, 1, 0, 1,
-0.8467783, 1.515692, -0.3699845, 0.7294118, 1, 0, 1,
-0.8441523, 0.04625015, -3.607053, 0.7215686, 1, 0, 1,
-0.8434856, 0.2121396, -0.6184664, 0.7176471, 1, 0, 1,
-0.8430426, 1.56734, 0.8933514, 0.7098039, 1, 0, 1,
-0.8350087, -0.0736898, -0.8387045, 0.7058824, 1, 0, 1,
-0.8315211, -0.04214631, -2.732543, 0.6980392, 1, 0, 1,
-0.8288507, -1.333553, -1.304761, 0.6901961, 1, 0, 1,
-0.8280635, -0.2049614, -2.08231, 0.6862745, 1, 0, 1,
-0.8277199, -0.4016868, -2.449525, 0.6784314, 1, 0, 1,
-0.8262681, 0.1767422, -0.6091387, 0.6745098, 1, 0, 1,
-0.8247048, -0.5967041, -2.815183, 0.6666667, 1, 0, 1,
-0.8187581, 0.2731442, -1.23829, 0.6627451, 1, 0, 1,
-0.8088674, -1.149416, -2.707631, 0.654902, 1, 0, 1,
-0.8079568, -2.536831, -2.682328, 0.6509804, 1, 0, 1,
-0.8019674, 1.182061, -1.717944, 0.6431373, 1, 0, 1,
-0.8019025, -1.171247, -2.432279, 0.6392157, 1, 0, 1,
-0.8006022, 1.329185, -0.1605141, 0.6313726, 1, 0, 1,
-0.7970781, 0.818804, -0.6851887, 0.627451, 1, 0, 1,
-0.7952524, 0.9046835, 0.2861178, 0.6196079, 1, 0, 1,
-0.7932537, 1.347984, -2.49653, 0.6156863, 1, 0, 1,
-0.7907244, 0.6266274, -0.3259054, 0.6078432, 1, 0, 1,
-0.7822062, 0.7364854, 0.9725111, 0.6039216, 1, 0, 1,
-0.7793809, 0.1328652, 0.1544734, 0.5960785, 1, 0, 1,
-0.77099, -0.002314565, -1.432484, 0.5882353, 1, 0, 1,
-0.7695263, 0.2345671, -0.82074, 0.5843138, 1, 0, 1,
-0.7687275, 0.6761891, -0.4360946, 0.5764706, 1, 0, 1,
-0.760346, 0.7071722, -3.215767, 0.572549, 1, 0, 1,
-0.7571629, -1.629878, -0.1181664, 0.5647059, 1, 0, 1,
-0.754547, -1.253835, -3.848319, 0.5607843, 1, 0, 1,
-0.7528678, -0.9294108, -1.703323, 0.5529412, 1, 0, 1,
-0.7526031, 1.033762, 0.6583821, 0.5490196, 1, 0, 1,
-0.7501707, 0.2669183, -0.5772926, 0.5411765, 1, 0, 1,
-0.7460961, -0.7969377, -2.921504, 0.5372549, 1, 0, 1,
-0.7436746, -1.054827, -1.122473, 0.5294118, 1, 0, 1,
-0.7432731, -0.00567172, -2.295864, 0.5254902, 1, 0, 1,
-0.740981, 0.5424044, -1.239252, 0.5176471, 1, 0, 1,
-0.7408258, 0.2051022, -1.680821, 0.5137255, 1, 0, 1,
-0.7380021, 0.4944928, -2.088451, 0.5058824, 1, 0, 1,
-0.73668, -1.096827, -2.761096, 0.5019608, 1, 0, 1,
-0.7366263, 0.4950452, 0.07415237, 0.4941176, 1, 0, 1,
-0.735212, 0.5852817, -0.867978, 0.4862745, 1, 0, 1,
-0.7276174, 0.09001708, 0.8103502, 0.4823529, 1, 0, 1,
-0.7168463, 0.2272467, -2.676786, 0.4745098, 1, 0, 1,
-0.7149131, -0.5679356, -4.292373, 0.4705882, 1, 0, 1,
-0.7147998, -1.169783, -3.341919, 0.4627451, 1, 0, 1,
-0.7110881, -1.340055, -2.663554, 0.4588235, 1, 0, 1,
-0.7109916, -0.4928735, -1.414793, 0.4509804, 1, 0, 1,
-0.7093739, 1.463579, -0.05257572, 0.4470588, 1, 0, 1,
-0.706385, 0.1918073, -2.568795, 0.4392157, 1, 0, 1,
-0.7059496, 2.190505, -0.9737176, 0.4352941, 1, 0, 1,
-0.7058424, -0.6400967, -2.742448, 0.427451, 1, 0, 1,
-0.702382, 1.017236, -1.570849, 0.4235294, 1, 0, 1,
-0.6993969, -1.77064, -3.575537, 0.4156863, 1, 0, 1,
-0.6885496, -1.243986, -3.235215, 0.4117647, 1, 0, 1,
-0.686109, -1.771814, -1.993478, 0.4039216, 1, 0, 1,
-0.6822829, -0.3541176, -2.213171, 0.3960784, 1, 0, 1,
-0.6816576, -0.139609, -2.543762, 0.3921569, 1, 0, 1,
-0.6816273, 0.4965293, -0.1860603, 0.3843137, 1, 0, 1,
-0.6808908, -1.305269, -2.846701, 0.3803922, 1, 0, 1,
-0.6784137, 1.417364, -2.175795, 0.372549, 1, 0, 1,
-0.6768029, 0.03222759, 0.2876769, 0.3686275, 1, 0, 1,
-0.6760648, -0.3346486, -2.253325, 0.3607843, 1, 0, 1,
-0.6730872, 0.3116266, -0.9985348, 0.3568628, 1, 0, 1,
-0.6652156, -0.3004253, -1.150753, 0.3490196, 1, 0, 1,
-0.6586393, 1.874985, -0.186953, 0.345098, 1, 0, 1,
-0.6565347, 0.1053822, -2.17505, 0.3372549, 1, 0, 1,
-0.6542349, 0.6934881, 0.9367873, 0.3333333, 1, 0, 1,
-0.6424472, -1.613551, -4.002789, 0.3254902, 1, 0, 1,
-0.6373696, 1.919232, -1.123225, 0.3215686, 1, 0, 1,
-0.6362631, -0.5926465, -3.360497, 0.3137255, 1, 0, 1,
-0.634833, -0.18219, -1.374021, 0.3098039, 1, 0, 1,
-0.6304509, 0.4076074, -0.1259327, 0.3019608, 1, 0, 1,
-0.6296858, -0.6895114, -1.741478, 0.2941177, 1, 0, 1,
-0.6265414, -0.4240132, -3.800959, 0.2901961, 1, 0, 1,
-0.6239536, -0.2682545, -2.463776, 0.282353, 1, 0, 1,
-0.6228481, 0.1517861, -3.3754, 0.2784314, 1, 0, 1,
-0.6184915, 0.7468213, 0.6028044, 0.2705882, 1, 0, 1,
-0.6130236, 1.211262, -0.2635826, 0.2666667, 1, 0, 1,
-0.6108428, 1.062091, 0.2808183, 0.2588235, 1, 0, 1,
-0.609242, -0.340363, -1.69632, 0.254902, 1, 0, 1,
-0.6087355, -1.00926, -3.477114, 0.2470588, 1, 0, 1,
-0.6087051, -1.162193, -1.535654, 0.2431373, 1, 0, 1,
-0.60637, 0.9040917, -1.194118, 0.2352941, 1, 0, 1,
-0.6045584, 0.4110031, 1.796368, 0.2313726, 1, 0, 1,
-0.6034097, -0.6826873, -2.598217, 0.2235294, 1, 0, 1,
-0.6019424, -2.776141, -2.789151, 0.2196078, 1, 0, 1,
-0.5995365, 0.9014583, 0.1061471, 0.2117647, 1, 0, 1,
-0.5975484, 1.027058, 0.0816307, 0.2078431, 1, 0, 1,
-0.5939782, -1.012752, -3.258921, 0.2, 1, 0, 1,
-0.5905764, 1.47564, -0.3760689, 0.1921569, 1, 0, 1,
-0.5898936, 0.3690737, 1.014746, 0.1882353, 1, 0, 1,
-0.5897723, 0.9466678, -0.7757204, 0.1803922, 1, 0, 1,
-0.5821937, 1.585905, -1.568938, 0.1764706, 1, 0, 1,
-0.5816205, 0.2520463, -0.1968779, 0.1686275, 1, 0, 1,
-0.5816166, -0.3818601, -1.2597, 0.1647059, 1, 0, 1,
-0.5802634, 1.006648, -0.732685, 0.1568628, 1, 0, 1,
-0.5801697, -1.802989, -2.270262, 0.1529412, 1, 0, 1,
-0.5792897, -2.141723, -1.890074, 0.145098, 1, 0, 1,
-0.5730245, 0.2257707, -1.107708, 0.1411765, 1, 0, 1,
-0.571898, 1.405968, -2.684777, 0.1333333, 1, 0, 1,
-0.5682703, -0.4390518, -1.678034, 0.1294118, 1, 0, 1,
-0.566632, 0.3209153, -0.5577186, 0.1215686, 1, 0, 1,
-0.5636916, 0.1287332, -1.48806, 0.1176471, 1, 0, 1,
-0.5622103, -1.31951, -4.189391, 0.1098039, 1, 0, 1,
-0.550178, 0.04859333, -1.11491, 0.1058824, 1, 0, 1,
-0.5496947, 1.0011, -0.4785255, 0.09803922, 1, 0, 1,
-0.5496405, -1.23406, -2.529692, 0.09019608, 1, 0, 1,
-0.547672, 0.8747219, -1.437322, 0.08627451, 1, 0, 1,
-0.5470626, 0.2788354, -2.24611, 0.07843138, 1, 0, 1,
-0.546317, -0.8530369, -3.174236, 0.07450981, 1, 0, 1,
-0.5404844, -0.3304973, -2.374387, 0.06666667, 1, 0, 1,
-0.5181004, 0.1491314, -0.8379689, 0.0627451, 1, 0, 1,
-0.513335, 1.25887, 0.4073057, 0.05490196, 1, 0, 1,
-0.5078936, 0.7390962, 0.7431281, 0.05098039, 1, 0, 1,
-0.5030761, 0.5510656, -1.721744, 0.04313726, 1, 0, 1,
-0.499561, 2.056388, -0.7155806, 0.03921569, 1, 0, 1,
-0.4914722, 1.451219, 0.04037833, 0.03137255, 1, 0, 1,
-0.4841996, 0.4417614, -1.562448, 0.02745098, 1, 0, 1,
-0.4808844, 1.349265, 0.3634846, 0.01960784, 1, 0, 1,
-0.4807723, 0.0718079, -0.3648079, 0.01568628, 1, 0, 1,
-0.4773826, 0.1250015, -0.1991103, 0.007843138, 1, 0, 1,
-0.4766987, -1.238507, -2.320729, 0.003921569, 1, 0, 1,
-0.472663, 0.4319, -2.927411, 0, 1, 0.003921569, 1,
-0.4702051, -0.676124, -2.180761, 0, 1, 0.01176471, 1,
-0.4671734, -1.097656, -2.336216, 0, 1, 0.01568628, 1,
-0.4653226, -0.4416668, -2.617632, 0, 1, 0.02352941, 1,
-0.4635129, 0.6815721, -1.010078, 0, 1, 0.02745098, 1,
-0.461255, -0.1002206, -3.283284, 0, 1, 0.03529412, 1,
-0.4573441, -1.076406, -3.294724, 0, 1, 0.03921569, 1,
-0.4570695, -0.7807598, -3.556646, 0, 1, 0.04705882, 1,
-0.455635, -1.218208, -3.223232, 0, 1, 0.05098039, 1,
-0.4531233, -0.354645, -0.7353569, 0, 1, 0.05882353, 1,
-0.452932, -0.0196689, 0.09075721, 0, 1, 0.0627451, 1,
-0.451985, 0.1221383, -0.2637862, 0, 1, 0.07058824, 1,
-0.4506113, 0.3166851, 0.9265368, 0, 1, 0.07450981, 1,
-0.4496656, -0.3235874, -3.094167, 0, 1, 0.08235294, 1,
-0.4476059, -0.3081528, -2.578298, 0, 1, 0.08627451, 1,
-0.4469998, -0.6551665, -2.450597, 0, 1, 0.09411765, 1,
-0.4468151, -0.2263311, -2.01866, 0, 1, 0.1019608, 1,
-0.4437516, -1.20964, -2.05478, 0, 1, 0.1058824, 1,
-0.4414253, 0.07801284, -0.4710691, 0, 1, 0.1137255, 1,
-0.4386235, -0.6099685, -1.945414, 0, 1, 0.1176471, 1,
-0.4342808, 0.8740336, -0.8379806, 0, 1, 0.1254902, 1,
-0.4317604, 1.774014, 0.0124688, 0, 1, 0.1294118, 1,
-0.4306969, 0.8190178, -0.4040931, 0, 1, 0.1372549, 1,
-0.4303402, 0.14042, -0.9692445, 0, 1, 0.1411765, 1,
-0.4278913, 0.2428963, -0.8460756, 0, 1, 0.1490196, 1,
-0.4258505, -0.4895296, -2.347075, 0, 1, 0.1529412, 1,
-0.4257889, -0.20896, -0.8568966, 0, 1, 0.1607843, 1,
-0.4257127, -0.2644581, -1.950765, 0, 1, 0.1647059, 1,
-0.422891, 0.8419938, 0.05970192, 0, 1, 0.172549, 1,
-0.4183921, -0.1386778, -0.4801095, 0, 1, 0.1764706, 1,
-0.4146513, -0.2940492, -1.637906, 0, 1, 0.1843137, 1,
-0.4075471, -1.403753, -2.983713, 0, 1, 0.1882353, 1,
-0.4033864, 0.8230826, 1.259812, 0, 1, 0.1960784, 1,
-0.4023213, 1.352734, 2.00389, 0, 1, 0.2039216, 1,
-0.4018906, 1.484877, -0.6685659, 0, 1, 0.2078431, 1,
-0.4003695, 0.8160469, -0.8087459, 0, 1, 0.2156863, 1,
-0.391015, -0.2592455, -4.050808, 0, 1, 0.2196078, 1,
-0.3811829, 1.099768, -1.577046, 0, 1, 0.227451, 1,
-0.3782228, 1.391761, -0.02888782, 0, 1, 0.2313726, 1,
-0.378117, 0.09198343, -0.4368029, 0, 1, 0.2392157, 1,
-0.3764114, 0.7889187, 0.4213254, 0, 1, 0.2431373, 1,
-0.3737452, -0.4228269, -2.945534, 0, 1, 0.2509804, 1,
-0.3716982, -0.4823138, -2.897506, 0, 1, 0.254902, 1,
-0.363373, -1.307987, -3.78321, 0, 1, 0.2627451, 1,
-0.3600481, 0.467512, -1.565956, 0, 1, 0.2666667, 1,
-0.3588076, 2.263408, -1.093024, 0, 1, 0.2745098, 1,
-0.3574645, 0.7603232, -1.891695, 0, 1, 0.2784314, 1,
-0.3479056, 0.3223639, -0.796294, 0, 1, 0.2862745, 1,
-0.3450124, -0.6643215, -3.039158, 0, 1, 0.2901961, 1,
-0.344251, 1.158293, -0.1980826, 0, 1, 0.2980392, 1,
-0.3430949, -0.02115353, -0.6957148, 0, 1, 0.3058824, 1,
-0.3425115, -2.001741, -4.040792, 0, 1, 0.3098039, 1,
-0.3396001, 0.378721, -0.7118444, 0, 1, 0.3176471, 1,
-0.3360329, 0.5485004, 0.7312912, 0, 1, 0.3215686, 1,
-0.3343085, 0.1165487, -1.920551, 0, 1, 0.3294118, 1,
-0.3340558, -0.5550777, -2.029645, 0, 1, 0.3333333, 1,
-0.33307, 0.58221, -1.411591, 0, 1, 0.3411765, 1,
-0.3211478, 0.717406, -2.137233, 0, 1, 0.345098, 1,
-0.3182763, 0.5752026, -0.8877117, 0, 1, 0.3529412, 1,
-0.3120687, -1.052631, -2.853427, 0, 1, 0.3568628, 1,
-0.3082508, -2.139469, -3.674298, 0, 1, 0.3647059, 1,
-0.3074275, -1.349177, -3.597452, 0, 1, 0.3686275, 1,
-0.3052409, 0.4497879, -0.3735034, 0, 1, 0.3764706, 1,
-0.3017371, -1.027842, -3.50596, 0, 1, 0.3803922, 1,
-0.3006209, 0.8763425, -1.838936, 0, 1, 0.3882353, 1,
-0.289518, -0.5687335, -2.54055, 0, 1, 0.3921569, 1,
-0.2827621, -0.6189561, -3.588676, 0, 1, 0.4, 1,
-0.2762304, -1.937804, -3.411722, 0, 1, 0.4078431, 1,
-0.2751576, 1.508628, -0.6602776, 0, 1, 0.4117647, 1,
-0.2704946, 0.6899134, -0.4034409, 0, 1, 0.4196078, 1,
-0.2676453, -0.1982539, -1.741194, 0, 1, 0.4235294, 1,
-0.2658391, -0.8760864, -1.931114, 0, 1, 0.4313726, 1,
-0.2630918, 1.841961, 0.9611704, 0, 1, 0.4352941, 1,
-0.2606784, -1.367924, -2.355205, 0, 1, 0.4431373, 1,
-0.2562435, -2.330156, -4.290693, 0, 1, 0.4470588, 1,
-0.2501927, 1.581042, -0.7174456, 0, 1, 0.454902, 1,
-0.2498139, -0.5391601, -2.798559, 0, 1, 0.4588235, 1,
-0.2496667, -0.3544415, -1.39332, 0, 1, 0.4666667, 1,
-0.2487354, -0.1570962, -1.565961, 0, 1, 0.4705882, 1,
-0.2471261, -0.383134, -2.544639, 0, 1, 0.4784314, 1,
-0.2456684, 0.5010726, -0.9580579, 0, 1, 0.4823529, 1,
-0.2451491, -0.2695639, -4.150564, 0, 1, 0.4901961, 1,
-0.2436672, 0.3080888, 0.7522171, 0, 1, 0.4941176, 1,
-0.2432353, -1.692426, -3.427895, 0, 1, 0.5019608, 1,
-0.2421498, 0.04400255, -0.5664997, 0, 1, 0.509804, 1,
-0.2313424, 0.6614252, 0.822772, 0, 1, 0.5137255, 1,
-0.22716, 1.408251, -0.8808638, 0, 1, 0.5215687, 1,
-0.2269924, 0.5319124, -0.3353243, 0, 1, 0.5254902, 1,
-0.2240904, 1.216691, 0.2629871, 0, 1, 0.5333334, 1,
-0.2169136, 0.5331854, -1.304953, 0, 1, 0.5372549, 1,
-0.2151337, 0.7626553, -2.001874, 0, 1, 0.5450981, 1,
-0.2149426, 0.05707489, -0.03642774, 0, 1, 0.5490196, 1,
-0.2124816, 1.462523, 0.5782754, 0, 1, 0.5568628, 1,
-0.2122217, 0.3468331, 1.24504, 0, 1, 0.5607843, 1,
-0.2083463, -0.8610104, -2.677592, 0, 1, 0.5686275, 1,
-0.2030365, 1.525444, -2.218807, 0, 1, 0.572549, 1,
-0.2018152, -0.1383152, -1.22016, 0, 1, 0.5803922, 1,
-0.2004894, -0.2194131, -4.024144, 0, 1, 0.5843138, 1,
-0.1989463, -1.069691, -2.768538, 0, 1, 0.5921569, 1,
-0.1919945, 0.5934322, 1.086943, 0, 1, 0.5960785, 1,
-0.191617, -0.4751707, -2.973653, 0, 1, 0.6039216, 1,
-0.1897663, -0.05180798, -2.757922, 0, 1, 0.6117647, 1,
-0.1889759, 1.20853, -2.787282, 0, 1, 0.6156863, 1,
-0.1822415, 1.158406, -1.993161, 0, 1, 0.6235294, 1,
-0.1760427, -0.7748998, -2.244654, 0, 1, 0.627451, 1,
-0.1755064, 0.9123361, 1.04953, 0, 1, 0.6352941, 1,
-0.1751512, -0.744706, -3.814964, 0, 1, 0.6392157, 1,
-0.1720015, -0.6711608, -5.271973, 0, 1, 0.6470588, 1,
-0.1716038, -2.435701, -3.866347, 0, 1, 0.6509804, 1,
-0.1683871, -0.17181, -3.276567, 0, 1, 0.6588235, 1,
-0.165581, -1.430141, -1.252367, 0, 1, 0.6627451, 1,
-0.1654032, 0.2948621, -2.996507, 0, 1, 0.6705883, 1,
-0.1542128, 0.9758258, -0.06180597, 0, 1, 0.6745098, 1,
-0.1535342, -1.997023, -4.499999, 0, 1, 0.682353, 1,
-0.1497974, 0.4355907, 0.5951233, 0, 1, 0.6862745, 1,
-0.146727, 0.1016985, -1.499228, 0, 1, 0.6941177, 1,
-0.1416703, -0.8914554, -1.626979, 0, 1, 0.7019608, 1,
-0.1364148, -0.4200644, -4.362452, 0, 1, 0.7058824, 1,
-0.1356786, 0.7857155, 0.3522122, 0, 1, 0.7137255, 1,
-0.1298888, 0.4899384, -0.6581332, 0, 1, 0.7176471, 1,
-0.1295002, -1.267685, -1.979411, 0, 1, 0.7254902, 1,
-0.1256317, 2.59247, 0.9412141, 0, 1, 0.7294118, 1,
-0.1234933, 1.702023, 1.210869, 0, 1, 0.7372549, 1,
-0.1219041, 0.672672, 1.698494, 0, 1, 0.7411765, 1,
-0.1206753, -0.2726298, 0.2839658, 0, 1, 0.7490196, 1,
-0.119744, -0.1795936, -4.870891, 0, 1, 0.7529412, 1,
-0.1187028, 0.2493508, -2.057799, 0, 1, 0.7607843, 1,
-0.118626, 1.196592, -0.8916343, 0, 1, 0.7647059, 1,
-0.1175342, 0.7178063, -0.6475531, 0, 1, 0.772549, 1,
-0.114474, -0.2574086, -2.785554, 0, 1, 0.7764706, 1,
-0.1121734, 1.676876, 0.3215348, 0, 1, 0.7843137, 1,
-0.1107999, 1.44168, 1.16288, 0, 1, 0.7882353, 1,
-0.1106194, 0.1663403, -0.4371263, 0, 1, 0.7960784, 1,
-0.1058555, 0.2937061, -0.1722596, 0, 1, 0.8039216, 1,
-0.1042836, 0.4191844, -0.1011204, 0, 1, 0.8078431, 1,
-0.1033405, 1.308176, -0.7681352, 0, 1, 0.8156863, 1,
-0.1010881, 0.8605607, -1.174096, 0, 1, 0.8196079, 1,
-0.09841444, -1.381842, -5.153179, 0, 1, 0.827451, 1,
-0.09500679, 0.1554877, -1.603039, 0, 1, 0.8313726, 1,
-0.09495381, 0.02071716, -1.675008, 0, 1, 0.8392157, 1,
-0.08933819, -1.021398, -4.805066, 0, 1, 0.8431373, 1,
-0.08773345, 0.1287722, -1.954678, 0, 1, 0.8509804, 1,
-0.07982763, -0.3961636, -2.599607, 0, 1, 0.854902, 1,
-0.07961184, 0.2935941, 1.356751, 0, 1, 0.8627451, 1,
-0.0732787, 0.9720564, 1.427897, 0, 1, 0.8666667, 1,
-0.07144447, 0.9681816, -0.7281304, 0, 1, 0.8745098, 1,
-0.06944121, -0.1373409, -3.245225, 0, 1, 0.8784314, 1,
-0.06943324, -1.30691, -3.502184, 0, 1, 0.8862745, 1,
-0.06827234, -1.452803, -2.359785, 0, 1, 0.8901961, 1,
-0.06567191, 1.453886, 0.06719594, 0, 1, 0.8980392, 1,
-0.05774156, 1.105946, -1.243829, 0, 1, 0.9058824, 1,
-0.04998783, -1.032803, -1.094546, 0, 1, 0.9098039, 1,
-0.04508877, -0.591871, -3.033753, 0, 1, 0.9176471, 1,
-0.04113222, -1.126783, -3.076943, 0, 1, 0.9215686, 1,
-0.0368723, -2.210394, -3.722594, 0, 1, 0.9294118, 1,
-0.02922103, -1.120565, -2.696143, 0, 1, 0.9333333, 1,
-0.02813863, -0.129973, -2.102986, 0, 1, 0.9411765, 1,
-0.02705065, -0.8902999, -2.98853, 0, 1, 0.945098, 1,
-0.02459417, 0.2095945, -0.1566774, 0, 1, 0.9529412, 1,
-0.0215989, -0.787415, -4.183727, 0, 1, 0.9568627, 1,
-0.0215807, 1.138537, -1.055732, 0, 1, 0.9647059, 1,
-0.02058351, 1.851707, -0.5197397, 0, 1, 0.9686275, 1,
-0.02002341, 0.6455578, 0.7944073, 0, 1, 0.9764706, 1,
-0.01260072, -0.9658448, -3.475458, 0, 1, 0.9803922, 1,
-0.01150031, -0.5528365, -4.225977, 0, 1, 0.9882353, 1,
-0.006223771, -1.07681, -4.744679, 0, 1, 0.9921569, 1,
-0.00290414, -0.6349767, -3.203146, 0, 1, 1, 1,
-0.0006739375, -1.739248, -2.800786, 0, 0.9921569, 1, 1,
0.002248, -0.8405784, 4.402175, 0, 0.9882353, 1, 1,
0.003953781, 0.1118981, 0.09404768, 0, 0.9803922, 1, 1,
0.004708823, -0.05180189, 2.534812, 0, 0.9764706, 1, 1,
0.004778461, -1.106695, 4.084554, 0, 0.9686275, 1, 1,
0.007649178, 0.8844298, 0.6867133, 0, 0.9647059, 1, 1,
0.009182164, -0.2492062, 2.476396, 0, 0.9568627, 1, 1,
0.01431976, 1.436177, 0.8605618, 0, 0.9529412, 1, 1,
0.02310987, -0.3720319, 4.003949, 0, 0.945098, 1, 1,
0.02454579, 1.295717, -0.3578736, 0, 0.9411765, 1, 1,
0.0248939, -1.27111, 4.594069, 0, 0.9333333, 1, 1,
0.02616878, -0.767626, 2.979847, 0, 0.9294118, 1, 1,
0.02776377, -0.9855908, 4.098544, 0, 0.9215686, 1, 1,
0.03125127, -0.3011973, 5.171299, 0, 0.9176471, 1, 1,
0.03190691, 0.3291371, 1.933472, 0, 0.9098039, 1, 1,
0.03960014, -0.07521967, 3.772074, 0, 0.9058824, 1, 1,
0.04607424, -0.2799068, 3.23473, 0, 0.8980392, 1, 1,
0.05041184, 0.3827974, -1.024372, 0, 0.8901961, 1, 1,
0.05059886, -0.3280191, 4.89013, 0, 0.8862745, 1, 1,
0.05109717, 0.1448094, 0.9981288, 0, 0.8784314, 1, 1,
0.0523078, -0.9903292, 3.863918, 0, 0.8745098, 1, 1,
0.05616707, 0.8484187, -0.1227402, 0, 0.8666667, 1, 1,
0.0561693, 0.9953813, -0.7674195, 0, 0.8627451, 1, 1,
0.05642058, -0.7577007, 3.348806, 0, 0.854902, 1, 1,
0.06150898, 0.4327054, 0.07264861, 0, 0.8509804, 1, 1,
0.06473812, -0.8702703, 1.874924, 0, 0.8431373, 1, 1,
0.06689041, 0.2253692, 0.3646593, 0, 0.8392157, 1, 1,
0.07154614, 1.156194, -0.03882942, 0, 0.8313726, 1, 1,
0.07640857, -0.4850685, 3.220953, 0, 0.827451, 1, 1,
0.081135, -0.4874222, 3.080091, 0, 0.8196079, 1, 1,
0.08347397, -1.189183, 2.225872, 0, 0.8156863, 1, 1,
0.0877867, 0.4796259, 0.3330868, 0, 0.8078431, 1, 1,
0.08926508, -1.143359, 4.624879, 0, 0.8039216, 1, 1,
0.0950452, -0.01420873, 1.460904, 0, 0.7960784, 1, 1,
0.09584202, 0.8761112, -0.3698055, 0, 0.7882353, 1, 1,
0.09639598, 1.522769, 2.382737, 0, 0.7843137, 1, 1,
0.0997651, 0.4010785, 0.7712564, 0, 0.7764706, 1, 1,
0.101762, 0.5792176, -0.05693021, 0, 0.772549, 1, 1,
0.1023883, -1.704382, 2.972327, 0, 0.7647059, 1, 1,
0.1042053, -1.289911, 3.86395, 0, 0.7607843, 1, 1,
0.114736, -1.1649, 3.731371, 0, 0.7529412, 1, 1,
0.1159262, 1.758279, 0.2405248, 0, 0.7490196, 1, 1,
0.1174949, 1.222107, 0.535781, 0, 0.7411765, 1, 1,
0.1226539, 1.776837, 0.7459403, 0, 0.7372549, 1, 1,
0.1268201, -0.5884343, 2.968207, 0, 0.7294118, 1, 1,
0.1279818, 0.2139131, 0.2509995, 0, 0.7254902, 1, 1,
0.1301304, -0.611841, 2.545691, 0, 0.7176471, 1, 1,
0.1311334, 0.09968192, -0.2967907, 0, 0.7137255, 1, 1,
0.1321443, -1.30455, 2.088656, 0, 0.7058824, 1, 1,
0.1363867, -0.03346706, 2.327378, 0, 0.6980392, 1, 1,
0.1393609, -0.1814429, 2.259883, 0, 0.6941177, 1, 1,
0.141386, 1.103914, -1.217018, 0, 0.6862745, 1, 1,
0.1494156, 2.035844, -0.9123521, 0, 0.682353, 1, 1,
0.1532949, -0.6433569, 2.723145, 0, 0.6745098, 1, 1,
0.1562338, 0.03676574, 2.487344, 0, 0.6705883, 1, 1,
0.157028, -1.242943, 2.884303, 0, 0.6627451, 1, 1,
0.1579773, -1.099093, 4.45694, 0, 0.6588235, 1, 1,
0.166407, -0.6265913, 4.923581, 0, 0.6509804, 1, 1,
0.1690016, 0.03182724, 0.5950545, 0, 0.6470588, 1, 1,
0.171617, 0.3160123, -0.3005848, 0, 0.6392157, 1, 1,
0.1716462, -1.129754, 2.72019, 0, 0.6352941, 1, 1,
0.1726861, 0.9505783, -0.9528074, 0, 0.627451, 1, 1,
0.1730415, 0.4261001, -0.01901736, 0, 0.6235294, 1, 1,
0.1822789, -0.3176947, 1.967254, 0, 0.6156863, 1, 1,
0.1929929, 1.470582, -0.5932422, 0, 0.6117647, 1, 1,
0.1944667, -0.1272126, 3.15043, 0, 0.6039216, 1, 1,
0.200558, -0.8781235, 3.455171, 0, 0.5960785, 1, 1,
0.210987, 0.01606592, 2.215012, 0, 0.5921569, 1, 1,
0.2118567, 2.209954, 1.199613, 0, 0.5843138, 1, 1,
0.2119415, -1.509677, 2.8225, 0, 0.5803922, 1, 1,
0.2121502, -1.675299, 4.144325, 0, 0.572549, 1, 1,
0.2127462, -0.949127, 4.00946, 0, 0.5686275, 1, 1,
0.2145952, 0.1063288, 0.1540368, 0, 0.5607843, 1, 1,
0.2152607, -0.4852743, 3.659863, 0, 0.5568628, 1, 1,
0.2199884, 0.6683457, 1.340352, 0, 0.5490196, 1, 1,
0.2276572, 0.746534, -0.1936102, 0, 0.5450981, 1, 1,
0.2328871, 1.684294, -0.4340626, 0, 0.5372549, 1, 1,
0.2336348, -0.163648, 0.0508682, 0, 0.5333334, 1, 1,
0.235663, -1.081527, 3.287099, 0, 0.5254902, 1, 1,
0.2367319, -0.2801628, 1.625816, 0, 0.5215687, 1, 1,
0.2368435, -0.5984386, 1.678138, 0, 0.5137255, 1, 1,
0.2414662, -1.307825, 4.076471, 0, 0.509804, 1, 1,
0.2433125, 1.080601, -0.7452342, 0, 0.5019608, 1, 1,
0.2443366, -1.198201, 1.605919, 0, 0.4941176, 1, 1,
0.2451654, 0.9869264, 1.41666, 0, 0.4901961, 1, 1,
0.2459463, -0.7873498, 1.766838, 0, 0.4823529, 1, 1,
0.2467403, -1.413633, 2.177527, 0, 0.4784314, 1, 1,
0.2474362, -0.3678133, 3.654048, 0, 0.4705882, 1, 1,
0.2486526, -0.5630146, 1.734342, 0, 0.4666667, 1, 1,
0.2510201, -0.926951, 2.796654, 0, 0.4588235, 1, 1,
0.2518112, 0.2617007, 0.5556797, 0, 0.454902, 1, 1,
0.258845, 0.384271, 1.682161, 0, 0.4470588, 1, 1,
0.2651753, 0.905663, -0.05531804, 0, 0.4431373, 1, 1,
0.2708874, -0.8535671, 3.863464, 0, 0.4352941, 1, 1,
0.2741412, -0.2538065, 4.323267, 0, 0.4313726, 1, 1,
0.276171, 0.06282131, 1.718402, 0, 0.4235294, 1, 1,
0.2775834, 0.5980838, -0.117396, 0, 0.4196078, 1, 1,
0.2777991, 0.8155717, -0.2756868, 0, 0.4117647, 1, 1,
0.2787366, -0.737488, 1.605329, 0, 0.4078431, 1, 1,
0.2798882, 0.5076774, -2.271764, 0, 0.4, 1, 1,
0.2804188, -0.5533299, 1.866989, 0, 0.3921569, 1, 1,
0.2893448, 1.055141, -1.005628, 0, 0.3882353, 1, 1,
0.2920501, -0.9389228, 4.234728, 0, 0.3803922, 1, 1,
0.2957123, -1.3491, 3.285787, 0, 0.3764706, 1, 1,
0.299328, -0.7479057, 1.94792, 0, 0.3686275, 1, 1,
0.3010693, 0.02344491, 3.710329, 0, 0.3647059, 1, 1,
0.3025173, -0.7796955, 2.380343, 0, 0.3568628, 1, 1,
0.3044727, -0.04779002, 2.65758, 0, 0.3529412, 1, 1,
0.3093895, 0.7191518, 0.9378563, 0, 0.345098, 1, 1,
0.309609, 0.6292446, 1.108156, 0, 0.3411765, 1, 1,
0.3113037, 0.5075272, 2.652666, 0, 0.3333333, 1, 1,
0.312393, 0.8602639, 0.1412875, 0, 0.3294118, 1, 1,
0.3129207, -0.5397881, 2.851137, 0, 0.3215686, 1, 1,
0.3150599, -0.2566935, -0.9548233, 0, 0.3176471, 1, 1,
0.3162278, 0.1631637, -0.5885869, 0, 0.3098039, 1, 1,
0.317332, 0.6279711, 0.1083352, 0, 0.3058824, 1, 1,
0.320223, -0.7483882, 3.220645, 0, 0.2980392, 1, 1,
0.3211203, -0.1413712, 2.745222, 0, 0.2901961, 1, 1,
0.3234785, 0.7353501, 0.8580205, 0, 0.2862745, 1, 1,
0.3241508, 0.4144447, 0.7248984, 0, 0.2784314, 1, 1,
0.3243611, 1.731049, 0.9235935, 0, 0.2745098, 1, 1,
0.3303331, 0.9259174, 0.4176191, 0, 0.2666667, 1, 1,
0.3349545, 0.7825456, 1.381022, 0, 0.2627451, 1, 1,
0.3397006, 1.214586, 1.185407, 0, 0.254902, 1, 1,
0.3397922, 1.683429, 0.3911683, 0, 0.2509804, 1, 1,
0.3406383, -0.3524651, -0.3898093, 0, 0.2431373, 1, 1,
0.3486317, -0.07358749, 0.8406196, 0, 0.2392157, 1, 1,
0.3513833, -0.9124621, 2.70495, 0, 0.2313726, 1, 1,
0.3517545, 0.2414309, 2.720016, 0, 0.227451, 1, 1,
0.3631976, 1.392399, 0.7363427, 0, 0.2196078, 1, 1,
0.3672296, 0.5997654, 3.028035, 0, 0.2156863, 1, 1,
0.3715502, 0.5078107, 2.007717, 0, 0.2078431, 1, 1,
0.3734361, 1.395669, 1.55257, 0, 0.2039216, 1, 1,
0.3772803, 0.5248265, 2.073058, 0, 0.1960784, 1, 1,
0.3781435, -1.077651, 3.796791, 0, 0.1882353, 1, 1,
0.3793502, -0.5912357, 3.726323, 0, 0.1843137, 1, 1,
0.380119, 0.6830652, 0.09036373, 0, 0.1764706, 1, 1,
0.3812346, 0.5628795, 0.4733415, 0, 0.172549, 1, 1,
0.3924338, -1.280446, 1.133881, 0, 0.1647059, 1, 1,
0.3959963, -1.326566, 3.878996, 0, 0.1607843, 1, 1,
0.3973165, -0.4818708, 2.977712, 0, 0.1529412, 1, 1,
0.3977448, 0.8340943, 1.431881, 0, 0.1490196, 1, 1,
0.3985263, 0.3803363, 0.346936, 0, 0.1411765, 1, 1,
0.399446, -2.186228, 3.315605, 0, 0.1372549, 1, 1,
0.4029553, -0.9323353, 1.872873, 0, 0.1294118, 1, 1,
0.4051067, 0.01907172, 1.206409, 0, 0.1254902, 1, 1,
0.4097927, 0.775662, 0.9922262, 0, 0.1176471, 1, 1,
0.4135575, -0.6426482, 3.182189, 0, 0.1137255, 1, 1,
0.415178, -2.112412, 1.071588, 0, 0.1058824, 1, 1,
0.4186811, 0.1947385, 0.6789363, 0, 0.09803922, 1, 1,
0.4214603, -0.0892031, 3.752173, 0, 0.09411765, 1, 1,
0.4215119, 2.065302, -0.7179279, 0, 0.08627451, 1, 1,
0.4306724, 0.008043746, 0.06765919, 0, 0.08235294, 1, 1,
0.4362923, -1.272713, 3.127695, 0, 0.07450981, 1, 1,
0.4369249, -0.5073569, 3.248702, 0, 0.07058824, 1, 1,
0.4384483, -0.9564152, 3.524351, 0, 0.0627451, 1, 1,
0.4397393, 1.181926, 1.724282, 0, 0.05882353, 1, 1,
0.4400431, -0.7038596, 1.256942, 0, 0.05098039, 1, 1,
0.4450079, 1.280595, -0.08570153, 0, 0.04705882, 1, 1,
0.4460672, -0.3963423, 2.111458, 0, 0.03921569, 1, 1,
0.448091, -1.243795, 4.722836, 0, 0.03529412, 1, 1,
0.4518273, 1.411043, 0.2909639, 0, 0.02745098, 1, 1,
0.4537162, 1.802063, 1.005049, 0, 0.02352941, 1, 1,
0.454162, -0.3499848, 1.893646, 0, 0.01568628, 1, 1,
0.4579962, 0.810674, -0.3547579, 0, 0.01176471, 1, 1,
0.4594882, -0.1167798, 2.137506, 0, 0.003921569, 1, 1,
0.4602785, -0.3412337, 2.640347, 0.003921569, 0, 1, 1,
0.4625652, -0.2583724, 1.858418, 0.007843138, 0, 1, 1,
0.4661895, -0.2591108, 1.859056, 0.01568628, 0, 1, 1,
0.4675835, 1.042046, -0.2874762, 0.01960784, 0, 1, 1,
0.4694518, 1.139858, 0.254054, 0.02745098, 0, 1, 1,
0.4697842, 0.2969747, -0.06254494, 0.03137255, 0, 1, 1,
0.4747443, -0.1598764, 2.030974, 0.03921569, 0, 1, 1,
0.4761237, -0.6692112, 2.741817, 0.04313726, 0, 1, 1,
0.4805684, 0.8804392, 1.680101, 0.05098039, 0, 1, 1,
0.5008697, -1.285437, 4.170833, 0.05490196, 0, 1, 1,
0.5014271, -0.1136749, 2.015985, 0.0627451, 0, 1, 1,
0.5024426, -1.055793, 4.683141, 0.06666667, 0, 1, 1,
0.5072073, -0.4713399, 2.779635, 0.07450981, 0, 1, 1,
0.5080827, 0.9111779, 0.2908179, 0.07843138, 0, 1, 1,
0.5096188, 0.2663538, 0.9854826, 0.08627451, 0, 1, 1,
0.5149119, 0.8280318, 0.8826076, 0.09019608, 0, 1, 1,
0.5260856, 0.2040822, 1.346782, 0.09803922, 0, 1, 1,
0.5302008, -0.7635145, 2.982745, 0.1058824, 0, 1, 1,
0.5310611, -0.1898343, 1.530296, 0.1098039, 0, 1, 1,
0.5313702, 1.020255, -0.8993027, 0.1176471, 0, 1, 1,
0.5324233, -1.120341, 4.243926, 0.1215686, 0, 1, 1,
0.5330659, -2.01502, 4.217815, 0.1294118, 0, 1, 1,
0.5352299, -1.598605, 3.879451, 0.1333333, 0, 1, 1,
0.5353155, -0.2030522, 0.04508696, 0.1411765, 0, 1, 1,
0.5398017, 0.5635278, 1.432072, 0.145098, 0, 1, 1,
0.5419996, 0.7879989, 0.9800486, 0.1529412, 0, 1, 1,
0.5522397, -0.5527166, 2.025901, 0.1568628, 0, 1, 1,
0.5534171, -0.198791, 1.526963, 0.1647059, 0, 1, 1,
0.5542172, -0.3865369, 0.8850349, 0.1686275, 0, 1, 1,
0.5556597, 0.8070809, -0.3637909, 0.1764706, 0, 1, 1,
0.5579581, 0.7735777, 1.236076, 0.1803922, 0, 1, 1,
0.5596147, -1.018385, 2.636277, 0.1882353, 0, 1, 1,
0.5602077, 1.667542, 1.293586, 0.1921569, 0, 1, 1,
0.5615502, -0.3804172, 2.231276, 0.2, 0, 1, 1,
0.5632883, 0.1463057, -0.383943, 0.2078431, 0, 1, 1,
0.5651588, -1.042311, 4.844782, 0.2117647, 0, 1, 1,
0.5653983, 0.1150277, -0.5348032, 0.2196078, 0, 1, 1,
0.5669354, -1.199801, 0.6312873, 0.2235294, 0, 1, 1,
0.5688108, -0.3384447, 3.298323, 0.2313726, 0, 1, 1,
0.5705786, -0.3875553, 0.1392141, 0.2352941, 0, 1, 1,
0.5712444, -1.097369, 3.263026, 0.2431373, 0, 1, 1,
0.5736343, -0.5542971, 1.015531, 0.2470588, 0, 1, 1,
0.5770848, 1.511203, 1.535438, 0.254902, 0, 1, 1,
0.5779199, -0.9062369, 4.311995, 0.2588235, 0, 1, 1,
0.5804024, -0.3223322, 3.848384, 0.2666667, 0, 1, 1,
0.5826648, 1.042969, 2.108704, 0.2705882, 0, 1, 1,
0.5870425, 0.4288602, 0.5470139, 0.2784314, 0, 1, 1,
0.5875769, -0.1800571, 0.8058372, 0.282353, 0, 1, 1,
0.5902979, -0.2573522, 2.706042, 0.2901961, 0, 1, 1,
0.5933126, -0.5151147, 1.397457, 0.2941177, 0, 1, 1,
0.5970291, 0.2439985, 3.264373, 0.3019608, 0, 1, 1,
0.5987728, 1.421539, 0.1403055, 0.3098039, 0, 1, 1,
0.6002834, -1.366972, 3.172092, 0.3137255, 0, 1, 1,
0.6023542, -1.227125, 0.9068782, 0.3215686, 0, 1, 1,
0.6031654, 0.1979685, 1.460113, 0.3254902, 0, 1, 1,
0.6037399, -1.284793, 3.040282, 0.3333333, 0, 1, 1,
0.6075018, -0.5291162, 2.668491, 0.3372549, 0, 1, 1,
0.6099175, 0.3401447, 3.145375, 0.345098, 0, 1, 1,
0.610333, 2.517268, 0.8630102, 0.3490196, 0, 1, 1,
0.6170893, -1.312688, 3.284407, 0.3568628, 0, 1, 1,
0.6210545, -0.220564, 3.103787, 0.3607843, 0, 1, 1,
0.6230816, 0.7374895, 0.501282, 0.3686275, 0, 1, 1,
0.6240795, -0.4496606, 3.377925, 0.372549, 0, 1, 1,
0.6252014, -1.071224, 2.829929, 0.3803922, 0, 1, 1,
0.6258858, 0.8862971, 0.8082471, 0.3843137, 0, 1, 1,
0.6307564, -1.304026, 3.679524, 0.3921569, 0, 1, 1,
0.6372275, -0.6168414, 2.128218, 0.3960784, 0, 1, 1,
0.6393816, -0.1216883, 2.352856, 0.4039216, 0, 1, 1,
0.6495339, -0.698127, 1.9423, 0.4117647, 0, 1, 1,
0.6500679, -2.123297, 3.853775, 0.4156863, 0, 1, 1,
0.6518756, 0.6023246, 1.506617, 0.4235294, 0, 1, 1,
0.651911, 0.6907708, 2.172728, 0.427451, 0, 1, 1,
0.6584045, -0.3598145, 1.45049, 0.4352941, 0, 1, 1,
0.6657988, -0.5273477, 2.008107, 0.4392157, 0, 1, 1,
0.6681472, -1.049067, 2.464997, 0.4470588, 0, 1, 1,
0.6704023, -0.1795878, 0.1124289, 0.4509804, 0, 1, 1,
0.672527, -0.2898143, 0.3638538, 0.4588235, 0, 1, 1,
0.6795049, -0.5496523, 2.010246, 0.4627451, 0, 1, 1,
0.6866897, -0.6418202, 3.668609, 0.4705882, 0, 1, 1,
0.6923883, -2.119733, 2.0824, 0.4745098, 0, 1, 1,
0.6924025, -0.9837477, 2.825137, 0.4823529, 0, 1, 1,
0.6931537, 0.9279935, -0.2909502, 0.4862745, 0, 1, 1,
0.6944357, 1.996755, -0.9832169, 0.4941176, 0, 1, 1,
0.6953831, 0.7768356, -0.9713629, 0.5019608, 0, 1, 1,
0.6963894, 0.896138, 0.0677225, 0.5058824, 0, 1, 1,
0.7090382, 1.436081, 0.8110023, 0.5137255, 0, 1, 1,
0.7091436, 1.900393, 2.25807, 0.5176471, 0, 1, 1,
0.7105061, 0.4774152, 1.205891, 0.5254902, 0, 1, 1,
0.7157223, -0.4488242, 1.557787, 0.5294118, 0, 1, 1,
0.7185808, -0.6511267, 1.88788, 0.5372549, 0, 1, 1,
0.7197152, -0.02878032, 1.933613, 0.5411765, 0, 1, 1,
0.7247868, -0.2310318, 2.730236, 0.5490196, 0, 1, 1,
0.7372503, 1.889612, -0.6608021, 0.5529412, 0, 1, 1,
0.7389807, 0.298195, -0.9483361, 0.5607843, 0, 1, 1,
0.7525189, -1.536685, 2.324411, 0.5647059, 0, 1, 1,
0.7541864, -0.3685542, 0.8831999, 0.572549, 0, 1, 1,
0.7606179, -1.367358, 2.595618, 0.5764706, 0, 1, 1,
0.7609951, -0.04727913, -0.3901724, 0.5843138, 0, 1, 1,
0.7624495, 0.5285369, 0.6769689, 0.5882353, 0, 1, 1,
0.7676446, -1.6037, 2.471202, 0.5960785, 0, 1, 1,
0.769102, -0.2186075, 2.08397, 0.6039216, 0, 1, 1,
0.769732, -0.1531591, 3.278708, 0.6078432, 0, 1, 1,
0.7731928, -0.2023408, 1.592513, 0.6156863, 0, 1, 1,
0.7774497, 0.533187, 0.8197975, 0.6196079, 0, 1, 1,
0.7776436, 0.2850395, 0.2981777, 0.627451, 0, 1, 1,
0.7835057, -1.039034, 2.770654, 0.6313726, 0, 1, 1,
0.7837607, -1.356164, 3.139819, 0.6392157, 0, 1, 1,
0.7910725, 1.235737, 1.64248, 0.6431373, 0, 1, 1,
0.796504, 0.4797703, 1.233209, 0.6509804, 0, 1, 1,
0.8008643, -0.5115436, 0.753087, 0.654902, 0, 1, 1,
0.8015918, -1.463827, 3.956432, 0.6627451, 0, 1, 1,
0.8025069, 0.004505796, 1.890514, 0.6666667, 0, 1, 1,
0.8026136, -0.9919583, 3.131504, 0.6745098, 0, 1, 1,
0.8044909, 0.7675237, 0.3444946, 0.6784314, 0, 1, 1,
0.8066791, -0.1202373, 0.388343, 0.6862745, 0, 1, 1,
0.8074181, 0.3862073, 1.486029, 0.6901961, 0, 1, 1,
0.811034, 0.5559449, 2.001091, 0.6980392, 0, 1, 1,
0.8318928, 0.3202712, 0.2848743, 0.7058824, 0, 1, 1,
0.8363479, 0.9267579, 2.134771, 0.7098039, 0, 1, 1,
0.8412253, 0.8012779, 1.663293, 0.7176471, 0, 1, 1,
0.8423233, 1.084482, 0.9158667, 0.7215686, 0, 1, 1,
0.8488995, -0.5217795, 2.3265, 0.7294118, 0, 1, 1,
0.8525012, -0.2527912, 1.757703, 0.7333333, 0, 1, 1,
0.8551102, 1.323978, -0.4301758, 0.7411765, 0, 1, 1,
0.8551203, -1.44254, 3.332423, 0.7450981, 0, 1, 1,
0.8557058, 0.2421121, 1.96447, 0.7529412, 0, 1, 1,
0.8718784, 0.6542702, 1.699651, 0.7568628, 0, 1, 1,
0.8790188, 0.03258914, -1.193493, 0.7647059, 0, 1, 1,
0.8800876, 0.6541562, 0.8160187, 0.7686275, 0, 1, 1,
0.8808468, 0.6535253, 0.8437257, 0.7764706, 0, 1, 1,
0.8813332, -1.670527, 2.586475, 0.7803922, 0, 1, 1,
0.8820408, 1.944698, 3.234835, 0.7882353, 0, 1, 1,
0.8867594, -1.374953, 3.051258, 0.7921569, 0, 1, 1,
0.8871462, -0.1775288, 2.86098, 0.8, 0, 1, 1,
0.891093, 0.3667015, 1.405339, 0.8078431, 0, 1, 1,
0.8959727, -0.8629216, 3.37299, 0.8117647, 0, 1, 1,
0.8994668, 0.4779552, -0.564684, 0.8196079, 0, 1, 1,
0.9061167, -0.03503431, 1.040882, 0.8235294, 0, 1, 1,
0.9094839, 1.296905, 1.868049, 0.8313726, 0, 1, 1,
0.911489, 0.7781189, -0.1942482, 0.8352941, 0, 1, 1,
0.9127932, -1.327558, 1.449636, 0.8431373, 0, 1, 1,
0.9154213, 0.795131, 0.1031336, 0.8470588, 0, 1, 1,
0.9194841, 0.6678048, -0.3813387, 0.854902, 0, 1, 1,
0.9251098, 1.882366, 1.733741, 0.8588235, 0, 1, 1,
0.9298956, 0.8103893, 0.6564248, 0.8666667, 0, 1, 1,
0.9342473, 0.03973339, 2.345279, 0.8705882, 0, 1, 1,
0.934647, -1.769581, 1.460886, 0.8784314, 0, 1, 1,
0.9411905, -1.048547, 4.023139, 0.8823529, 0, 1, 1,
0.9548493, -0.9857624, 2.417328, 0.8901961, 0, 1, 1,
0.9594812, -0.3152978, 0.6559916, 0.8941177, 0, 1, 1,
0.9621809, -1.604655, 2.781318, 0.9019608, 0, 1, 1,
0.9690403, 1.237164, 1.915729, 0.9098039, 0, 1, 1,
0.9691801, 0.4775585, 2.15665, 0.9137255, 0, 1, 1,
0.9779181, 0.5895754, 1.642969, 0.9215686, 0, 1, 1,
0.9816644, -0.846585, 2.548428, 0.9254902, 0, 1, 1,
0.9892096, -0.8751055, 3.202948, 0.9333333, 0, 1, 1,
1.002336, -1.308066, 4.050231, 0.9372549, 0, 1, 1,
1.004019, -1.293815, 4.177972, 0.945098, 0, 1, 1,
1.004693, -1.473963, 2.441685, 0.9490196, 0, 1, 1,
1.005656, 0.3252828, 2.663744, 0.9568627, 0, 1, 1,
1.006349, -1.764882, 2.628922, 0.9607843, 0, 1, 1,
1.009786, 0.4802666, 0.962595, 0.9686275, 0, 1, 1,
1.010199, 0.4268394, 1.218081, 0.972549, 0, 1, 1,
1.016292, 1.391254, 2.372472, 0.9803922, 0, 1, 1,
1.016994, -0.7190752, 3.825644, 0.9843137, 0, 1, 1,
1.019941, 1.904187, 0.3913931, 0.9921569, 0, 1, 1,
1.029115, -0.03832868, 1.643277, 0.9960784, 0, 1, 1,
1.032724, 0.1394638, 0.7914687, 1, 0, 0.9960784, 1,
1.033269, -1.242787, 1.425042, 1, 0, 0.9882353, 1,
1.034324, -0.4329692, 2.547046, 1, 0, 0.9843137, 1,
1.037771, 2.847466, -0.2656746, 1, 0, 0.9764706, 1,
1.045399, 0.610839, 0.4077397, 1, 0, 0.972549, 1,
1.047483, -1.986873, 2.368397, 1, 0, 0.9647059, 1,
1.049479, 1.53592, -1.48601, 1, 0, 0.9607843, 1,
1.050262, 0.5784206, 1.309795, 1, 0, 0.9529412, 1,
1.055807, 0.6135807, 3.082667, 1, 0, 0.9490196, 1,
1.059046, 1.561269, -0.1927424, 1, 0, 0.9411765, 1,
1.059217, -0.5841408, -0.3308524, 1, 0, 0.9372549, 1,
1.072527, -0.290827, 1.25465, 1, 0, 0.9294118, 1,
1.074872, -0.967629, 2.492126, 1, 0, 0.9254902, 1,
1.075861, -1.030369, 2.330489, 1, 0, 0.9176471, 1,
1.080572, -0.4782667, 1.050517, 1, 0, 0.9137255, 1,
1.082596, 0.1430601, 1.746655, 1, 0, 0.9058824, 1,
1.092922, -0.0818425, 2.272463, 1, 0, 0.9019608, 1,
1.093913, 1.041262, -0.4387038, 1, 0, 0.8941177, 1,
1.096269, -1.494962, 4.834768, 1, 0, 0.8862745, 1,
1.100159, -0.1974326, 3.093453, 1, 0, 0.8823529, 1,
1.102188, 1.372669, 1.662328, 1, 0, 0.8745098, 1,
1.102769, 1.287722, 1.082558, 1, 0, 0.8705882, 1,
1.105449, -0.3126613, 2.630123, 1, 0, 0.8627451, 1,
1.112201, -0.6660591, 1.344712, 1, 0, 0.8588235, 1,
1.113651, -0.5946698, 2.443671, 1, 0, 0.8509804, 1,
1.117889, 1.073348, 1.665714, 1, 0, 0.8470588, 1,
1.122009, 0.1355326, 2.993848, 1, 0, 0.8392157, 1,
1.122791, -0.6551979, 0.8698585, 1, 0, 0.8352941, 1,
1.130689, -0.05953779, 1.577034, 1, 0, 0.827451, 1,
1.140618, -0.9852621, 3.000044, 1, 0, 0.8235294, 1,
1.144696, 1.344552, 1.58722, 1, 0, 0.8156863, 1,
1.153277, 0.1537999, 2.406896, 1, 0, 0.8117647, 1,
1.158659, 0.2307289, 2.420897, 1, 0, 0.8039216, 1,
1.163161, -0.06068354, 2.237016, 1, 0, 0.7960784, 1,
1.1645, -0.2044188, -0.1860173, 1, 0, 0.7921569, 1,
1.167123, 1.264824, 1.844241, 1, 0, 0.7843137, 1,
1.167308, 0.1770655, 0.09470046, 1, 0, 0.7803922, 1,
1.174516, 0.9958752, 1.355558, 1, 0, 0.772549, 1,
1.178685, -1.064737, 2.558866, 1, 0, 0.7686275, 1,
1.182035, -0.1161085, 0.1875447, 1, 0, 0.7607843, 1,
1.189217, 0.5932499, 1.345431, 1, 0, 0.7568628, 1,
1.191346, 0.3514062, 1.451715, 1, 0, 0.7490196, 1,
1.191565, 2.173147, 0.5161103, 1, 0, 0.7450981, 1,
1.20389, -0.3785094, 1.245703, 1, 0, 0.7372549, 1,
1.204326, -0.1775478, 3.243524, 1, 0, 0.7333333, 1,
1.212632, -0.05491081, 2.41422, 1, 0, 0.7254902, 1,
1.216619, -0.7353951, 2.109436, 1, 0, 0.7215686, 1,
1.217435, 0.3359576, 0.909171, 1, 0, 0.7137255, 1,
1.219019, -1.750116, 2.613272, 1, 0, 0.7098039, 1,
1.219525, -0.6837698, 1.859176, 1, 0, 0.7019608, 1,
1.231083, -0.4809008, 1.988816, 1, 0, 0.6941177, 1,
1.237578, -0.05135191, 1.644526, 1, 0, 0.6901961, 1,
1.237708, 0.7435373, 2.635312, 1, 0, 0.682353, 1,
1.24003, -1.065312, 1.533344, 1, 0, 0.6784314, 1,
1.241332, -0.3393854, 1.801896, 1, 0, 0.6705883, 1,
1.246128, -0.3672506, 1.772132, 1, 0, 0.6666667, 1,
1.248524, -0.8375717, 2.009276, 1, 0, 0.6588235, 1,
1.248657, -0.450743, 3.579718, 1, 0, 0.654902, 1,
1.250373, 0.5467116, 1.115298, 1, 0, 0.6470588, 1,
1.25739, -0.5699499, 1.529712, 1, 0, 0.6431373, 1,
1.257483, -0.2960157, 1.881359, 1, 0, 0.6352941, 1,
1.264323, -1.150784, 2.606835, 1, 0, 0.6313726, 1,
1.265951, 0.8881196, 2.783504, 1, 0, 0.6235294, 1,
1.266461, 0.3941753, 1.717916, 1, 0, 0.6196079, 1,
1.267387, 0.3140541, 1.404892, 1, 0, 0.6117647, 1,
1.272865, 0.3867729, -0.1802708, 1, 0, 0.6078432, 1,
1.279687, -2.124275, 3.123352, 1, 0, 0.6, 1,
1.281135, 0.8755127, 2.885282, 1, 0, 0.5921569, 1,
1.282896, -0.7787752, 2.530163, 1, 0, 0.5882353, 1,
1.284726, -1.103789, 1.750126, 1, 0, 0.5803922, 1,
1.294305, 0.4826739, -0.8296917, 1, 0, 0.5764706, 1,
1.295681, 0.275684, 1.612497, 1, 0, 0.5686275, 1,
1.296411, -1.875262, 2.092351, 1, 0, 0.5647059, 1,
1.30211, -1.052005, 3.206972, 1, 0, 0.5568628, 1,
1.307104, -0.4546814, 2.371753, 1, 0, 0.5529412, 1,
1.307316, -1.749117, 4.163416, 1, 0, 0.5450981, 1,
1.308446, 1.146294, 0.6236376, 1, 0, 0.5411765, 1,
1.309771, -0.5097985, 2.326236, 1, 0, 0.5333334, 1,
1.316404, -0.8470138, 0.9477049, 1, 0, 0.5294118, 1,
1.321105, -0.4752024, 4.621159, 1, 0, 0.5215687, 1,
1.336655, -1.109218, 2.795879, 1, 0, 0.5176471, 1,
1.353098, -1.147684, 1.626623, 1, 0, 0.509804, 1,
1.364937, 1.454595, 0.03929061, 1, 0, 0.5058824, 1,
1.368788, 0.4400028, 0.2046785, 1, 0, 0.4980392, 1,
1.376071, 0.01775929, 2.874668, 1, 0, 0.4901961, 1,
1.388727, 0.01536803, 1.75759, 1, 0, 0.4862745, 1,
1.390134, 0.2474358, 0.00398854, 1, 0, 0.4784314, 1,
1.403092, -0.2660024, 1.826697, 1, 0, 0.4745098, 1,
1.411275, -0.6708387, 1.35744, 1, 0, 0.4666667, 1,
1.417033, 1.45146, -1.542706, 1, 0, 0.4627451, 1,
1.419477, -1.299632, 0.5555944, 1, 0, 0.454902, 1,
1.419855, 0.0593527, 1.358503, 1, 0, 0.4509804, 1,
1.42165, 1.312443, 0.178297, 1, 0, 0.4431373, 1,
1.427826, -0.3050413, 2.307995, 1, 0, 0.4392157, 1,
1.429326, 1.632445, -0.02400103, 1, 0, 0.4313726, 1,
1.443759, 0.4047948, 1.324699, 1, 0, 0.427451, 1,
1.448496, 0.9135348, 0.7947786, 1, 0, 0.4196078, 1,
1.464373, 1.304643, 1.009899, 1, 0, 0.4156863, 1,
1.470773, 0.1964522, 2.197959, 1, 0, 0.4078431, 1,
1.473722, -0.2132961, 1.400704, 1, 0, 0.4039216, 1,
1.477971, 0.04602569, 1.01797, 1, 0, 0.3960784, 1,
1.480087, 0.0251991, 1.935561, 1, 0, 0.3882353, 1,
1.485701, 1.412978, 0.7316918, 1, 0, 0.3843137, 1,
1.488223, 1.719313, -0.8342394, 1, 0, 0.3764706, 1,
1.497124, -1.956066, 2.905775, 1, 0, 0.372549, 1,
1.498201, 0.7704288, 2.436392, 1, 0, 0.3647059, 1,
1.520102, -1.502585, 2.888937, 1, 0, 0.3607843, 1,
1.522496, -0.1395499, 3.380759, 1, 0, 0.3529412, 1,
1.529676, 1.567543, 1.056964, 1, 0, 0.3490196, 1,
1.535936, 0.8534584, 0.5803979, 1, 0, 0.3411765, 1,
1.543517, 0.7738869, 1.981529, 1, 0, 0.3372549, 1,
1.551905, -0.148905, 2.178489, 1, 0, 0.3294118, 1,
1.577819, 1.100423, 1.043829, 1, 0, 0.3254902, 1,
1.579344, 1.017542, 0.774404, 1, 0, 0.3176471, 1,
1.596626, 1.614081, -0.8032895, 1, 0, 0.3137255, 1,
1.597111, -0.618706, 2.784327, 1, 0, 0.3058824, 1,
1.614166, -0.153367, -0.5551214, 1, 0, 0.2980392, 1,
1.634488, -0.903785, 0.9550456, 1, 0, 0.2941177, 1,
1.645475, 1.209064, 0.6431156, 1, 0, 0.2862745, 1,
1.662999, 0.2015221, 2.226173, 1, 0, 0.282353, 1,
1.664708, 1.860952, 1.270582, 1, 0, 0.2745098, 1,
1.665854, -0.6076076, 0.6150998, 1, 0, 0.2705882, 1,
1.673568, 1.478327, 1.2321, 1, 0, 0.2627451, 1,
1.702927, -1.194209, 0.9554039, 1, 0, 0.2588235, 1,
1.704414, -1.541127, 2.842951, 1, 0, 0.2509804, 1,
1.704997, -1.109177, 2.45616, 1, 0, 0.2470588, 1,
1.73063, 0.6436062, 0.1087515, 1, 0, 0.2392157, 1,
1.732308, 1.100187, -0.7895017, 1, 0, 0.2352941, 1,
1.737569, -1.564976, 3.008003, 1, 0, 0.227451, 1,
1.762047, 0.824627, 1.159438, 1, 0, 0.2235294, 1,
1.768426, -0.4054869, 2.254589, 1, 0, 0.2156863, 1,
1.781421, 1.091039, 3.370379, 1, 0, 0.2117647, 1,
1.812836, 0.3377205, 0.7886853, 1, 0, 0.2039216, 1,
1.816149, -1.488085, 0.3331666, 1, 0, 0.1960784, 1,
1.82002, -1.543579, 1.318151, 1, 0, 0.1921569, 1,
1.838911, 1.428508, -0.2023768, 1, 0, 0.1843137, 1,
1.87725, -1.207471, 1.557953, 1, 0, 0.1803922, 1,
1.886023, 1.448912, 0.3314156, 1, 0, 0.172549, 1,
1.924266, -0.7126032, 3.370971, 1, 0, 0.1686275, 1,
1.924504, -1.149354, 1.874656, 1, 0, 0.1607843, 1,
1.938352, 0.5869454, 1.487419, 1, 0, 0.1568628, 1,
1.956582, 2.163323, 0.949112, 1, 0, 0.1490196, 1,
2.002403, 0.7351375, 3.9725, 1, 0, 0.145098, 1,
2.003949, -1.6003, 2.811358, 1, 0, 0.1372549, 1,
2.022895, 1.174578, 2.909393, 1, 0, 0.1333333, 1,
2.027439, -1.417818, 1.010699, 1, 0, 0.1254902, 1,
2.039289, -0.5159252, 1.441945, 1, 0, 0.1215686, 1,
2.060016, -1.647947, 1.568163, 1, 0, 0.1137255, 1,
2.060978, 0.01018826, 2.105744, 1, 0, 0.1098039, 1,
2.137411, -0.5795053, 2.872434, 1, 0, 0.1019608, 1,
2.142416, 1.034419, 1.620908, 1, 0, 0.09411765, 1,
2.14946, 0.4234144, 2.626663, 1, 0, 0.09019608, 1,
2.164705, 0.9443815, 2.422251, 1, 0, 0.08235294, 1,
2.214909, -0.09806392, 0.870083, 1, 0, 0.07843138, 1,
2.233286, 1.348772, 2.264188, 1, 0, 0.07058824, 1,
2.240106, 1.259151, 0.03964195, 1, 0, 0.06666667, 1,
2.245289, 0.551012, 1.468949, 1, 0, 0.05882353, 1,
2.307616, 0.4690698, 0.5435302, 1, 0, 0.05490196, 1,
2.360968, 1.23677, 1.576885, 1, 0, 0.04705882, 1,
2.393016, 0.8755139, -0.6240414, 1, 0, 0.04313726, 1,
2.41069, 0.001726018, 1.484501, 1, 0, 0.03529412, 1,
2.573994, -0.3301316, 0.5389932, 1, 0, 0.03137255, 1,
2.697558, 1.214519, 0.7293205, 1, 0, 0.02352941, 1,
2.770882, 0.5388889, 1.726069, 1, 0, 0.01960784, 1,
2.793592, -1.683082, 2.343576, 1, 0, 0.01176471, 1,
2.875488, -0.1514385, 3.831295, 1, 0, 0.007843138, 1
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
-0.4202515, -3.972746, -7.042107, 0, -0.5, 0.5, 0.5,
-0.4202515, -3.972746, -7.042107, 1, -0.5, 0.5, 0.5,
-0.4202515, -3.972746, -7.042107, 1, 1.5, 0.5, 0.5,
-0.4202515, -3.972746, -7.042107, 0, 1.5, 0.5, 0.5
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
-4.833247, -0.06840086, -7.042107, 0, -0.5, 0.5, 0.5,
-4.833247, -0.06840086, -7.042107, 1, -0.5, 0.5, 0.5,
-4.833247, -0.06840086, -7.042107, 1, 1.5, 0.5, 0.5,
-4.833247, -0.06840086, -7.042107, 0, 1.5, 0.5, 0.5
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
-4.833247, -3.972746, -0.0503366, 0, -0.5, 0.5, 0.5,
-4.833247, -3.972746, -0.0503366, 1, -0.5, 0.5, 0.5,
-4.833247, -3.972746, -0.0503366, 1, 1.5, 0.5, 0.5,
-4.833247, -3.972746, -0.0503366, 0, 1.5, 0.5, 0.5
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
-3, -3.071743, -5.428622,
2, -3.071743, -5.428622,
-3, -3.071743, -5.428622,
-3, -3.221911, -5.697536,
-2, -3.071743, -5.428622,
-2, -3.221911, -5.697536,
-1, -3.071743, -5.428622,
-1, -3.221911, -5.697536,
0, -3.071743, -5.428622,
0, -3.221911, -5.697536,
1, -3.071743, -5.428622,
1, -3.221911, -5.697536,
2, -3.071743, -5.428622,
2, -3.221911, -5.697536
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
-3, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
-3, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
-3, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
-3, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5,
-2, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
-2, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
-2, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
-2, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5,
-1, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
-1, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
-1, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
-1, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5,
0, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
0, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
0, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
0, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5,
1, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
1, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
1, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
1, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5,
2, -3.522245, -6.235364, 0, -0.5, 0.5, 0.5,
2, -3.522245, -6.235364, 1, -0.5, 0.5, 0.5,
2, -3.522245, -6.235364, 1, 1.5, 0.5, 0.5,
2, -3.522245, -6.235364, 0, 1.5, 0.5, 0.5
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
-3.814863, -2, -5.428622,
-3.814863, 2, -5.428622,
-3.814863, -2, -5.428622,
-3.984594, -2, -5.697536,
-3.814863, -1, -5.428622,
-3.984594, -1, -5.697536,
-3.814863, 0, -5.428622,
-3.984594, 0, -5.697536,
-3.814863, 1, -5.428622,
-3.984594, 1, -5.697536,
-3.814863, 2, -5.428622,
-3.984594, 2, -5.697536
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
-4.324055, -2, -6.235364, 0, -0.5, 0.5, 0.5,
-4.324055, -2, -6.235364, 1, -0.5, 0.5, 0.5,
-4.324055, -2, -6.235364, 1, 1.5, 0.5, 0.5,
-4.324055, -2, -6.235364, 0, 1.5, 0.5, 0.5,
-4.324055, -1, -6.235364, 0, -0.5, 0.5, 0.5,
-4.324055, -1, -6.235364, 1, -0.5, 0.5, 0.5,
-4.324055, -1, -6.235364, 1, 1.5, 0.5, 0.5,
-4.324055, -1, -6.235364, 0, 1.5, 0.5, 0.5,
-4.324055, 0, -6.235364, 0, -0.5, 0.5, 0.5,
-4.324055, 0, -6.235364, 1, -0.5, 0.5, 0.5,
-4.324055, 0, -6.235364, 1, 1.5, 0.5, 0.5,
-4.324055, 0, -6.235364, 0, 1.5, 0.5, 0.5,
-4.324055, 1, -6.235364, 0, -0.5, 0.5, 0.5,
-4.324055, 1, -6.235364, 1, -0.5, 0.5, 0.5,
-4.324055, 1, -6.235364, 1, 1.5, 0.5, 0.5,
-4.324055, 1, -6.235364, 0, 1.5, 0.5, 0.5,
-4.324055, 2, -6.235364, 0, -0.5, 0.5, 0.5,
-4.324055, 2, -6.235364, 1, -0.5, 0.5, 0.5,
-4.324055, 2, -6.235364, 1, 1.5, 0.5, 0.5,
-4.324055, 2, -6.235364, 0, 1.5, 0.5, 0.5
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
-3.814863, -3.071743, -4,
-3.814863, -3.071743, 4,
-3.814863, -3.071743, -4,
-3.984594, -3.221911, -4,
-3.814863, -3.071743, -2,
-3.984594, -3.221911, -2,
-3.814863, -3.071743, 0,
-3.984594, -3.221911, 0,
-3.814863, -3.071743, 2,
-3.984594, -3.221911, 2,
-3.814863, -3.071743, 4,
-3.984594, -3.221911, 4
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
-4.324055, -3.522245, -4, 0, -0.5, 0.5, 0.5,
-4.324055, -3.522245, -4, 1, -0.5, 0.5, 0.5,
-4.324055, -3.522245, -4, 1, 1.5, 0.5, 0.5,
-4.324055, -3.522245, -4, 0, 1.5, 0.5, 0.5,
-4.324055, -3.522245, -2, 0, -0.5, 0.5, 0.5,
-4.324055, -3.522245, -2, 1, -0.5, 0.5, 0.5,
-4.324055, -3.522245, -2, 1, 1.5, 0.5, 0.5,
-4.324055, -3.522245, -2, 0, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 0, 0, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 0, 1, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 0, 1, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 0, 0, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 2, 0, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 2, 1, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 2, 1, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 2, 0, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 4, 0, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 4, 1, -0.5, 0.5, 0.5,
-4.324055, -3.522245, 4, 1, 1.5, 0.5, 0.5,
-4.324055, -3.522245, 4, 0, 1.5, 0.5, 0.5
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
-3.814863, -3.071743, -5.428622,
-3.814863, 2.934942, -5.428622,
-3.814863, -3.071743, 5.327949,
-3.814863, 2.934942, 5.327949,
-3.814863, -3.071743, -5.428622,
-3.814863, -3.071743, 5.327949,
-3.814863, 2.934942, -5.428622,
-3.814863, 2.934942, 5.327949,
-3.814863, -3.071743, -5.428622,
2.97436, -3.071743, -5.428622,
-3.814863, -3.071743, 5.327949,
2.97436, -3.071743, 5.327949,
-3.814863, 2.934942, -5.428622,
2.97436, 2.934942, -5.428622,
-3.814863, 2.934942, 5.327949,
2.97436, 2.934942, 5.327949,
2.97436, -3.071743, -5.428622,
2.97436, 2.934942, -5.428622,
2.97436, -3.071743, 5.327949,
2.97436, 2.934942, 5.327949,
2.97436, -3.071743, -5.428622,
2.97436, -3.071743, 5.327949,
2.97436, 2.934942, -5.428622,
2.97436, 2.934942, 5.327949
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
var radius = 7.51145;
var distance = 33.41929;
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
mvMatrix.translate( 0.4202515, 0.06840086, 0.0503366 );
mvMatrix.scale( 1.196238, 1.352081, 0.7550294 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41929);
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
halofenozide<-read.table("halofenozide.xyz")
```

```
## Error in read.table("halofenozide.xyz"): no lines available in input
```

```r
x<-halofenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
y<-halofenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
z<-halofenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
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
-3.715991, -0.2678846, -1.641404, 0, 0, 1, 1, 1,
-2.663733, 0.006846397, -1.164477, 1, 0, 0, 1, 1,
-2.602851, -0.7070138, -2.166917, 1, 0, 0, 1, 1,
-2.563236, -0.733877, -0.7089399, 1, 0, 0, 1, 1,
-2.454765, -0.2766836, -1.766029, 1, 0, 0, 1, 1,
-2.454664, -0.5285143, -2.023044, 1, 0, 0, 1, 1,
-2.436981, -1.19632, -2.405223, 0, 0, 0, 1, 1,
-2.330456, -0.4358187, -1.889137, 0, 0, 0, 1, 1,
-2.312451, 0.9851835, -1.744014, 0, 0, 0, 1, 1,
-2.282648, -0.8777404, -2.293255, 0, 0, 0, 1, 1,
-2.261679, -1.764241, -3.054973, 0, 0, 0, 1, 1,
-2.233493, -0.04655478, -4.210652, 0, 0, 0, 1, 1,
-2.232914, 2.575459, -1.487562, 0, 0, 0, 1, 1,
-2.217619, 1.325511, -0.7656983, 1, 1, 1, 1, 1,
-2.178519, 0.3708415, -1.105175, 1, 1, 1, 1, 1,
-2.1628, -1.682621, -1.176894, 1, 1, 1, 1, 1,
-2.14897, 0.3401665, -2.46296, 1, 1, 1, 1, 1,
-2.120711, 1.577629, -0.4410619, 1, 1, 1, 1, 1,
-2.085181, -1.072698, 1.273296, 1, 1, 1, 1, 1,
-2.066438, 1.56842, -0.4177718, 1, 1, 1, 1, 1,
-2.053258, 1.122363, -0.8909373, 1, 1, 1, 1, 1,
-2.047338, 0.317399, -1.264121, 1, 1, 1, 1, 1,
-2.043217, 1.31931, -1.17845, 1, 1, 1, 1, 1,
-2.036304, -0.3301373, -1.802416, 1, 1, 1, 1, 1,
-2.031301, -2.83254, -1.438791, 1, 1, 1, 1, 1,
-2.002498, -1.399004, -3.30308, 1, 1, 1, 1, 1,
-2.000799, -0.2960636, -0.2762803, 1, 1, 1, 1, 1,
-1.96142, -1.102453, -2.103261, 1, 1, 1, 1, 1,
-1.959329, 0.6341493, -1.174321, 0, 0, 1, 1, 1,
-1.947871, 0.6818334, -1.47307, 1, 0, 0, 1, 1,
-1.942726, -0.09680054, -0.6682866, 1, 0, 0, 1, 1,
-1.937281, -0.7193886, -1.333658, 1, 0, 0, 1, 1,
-1.92772, -0.1147017, -1.072051, 1, 0, 0, 1, 1,
-1.915445, -0.489301, 0.160151, 1, 0, 0, 1, 1,
-1.890679, 0.009229745, -0.458813, 0, 0, 0, 1, 1,
-1.889127, 1.135121, -0.6628398, 0, 0, 0, 1, 1,
-1.882149, -0.6003537, -3.110365, 0, 0, 0, 1, 1,
-1.878747, -0.7549398, -2.261373, 0, 0, 0, 1, 1,
-1.866854, -0.2082138, -1.013575, 0, 0, 0, 1, 1,
-1.84821, 0.2674042, -1.853234, 0, 0, 0, 1, 1,
-1.819323, -0.4914604, -1.265077, 0, 0, 0, 1, 1,
-1.814999, -0.516241, 0.2890808, 1, 1, 1, 1, 1,
-1.800725, 0.4949377, 0.2866713, 1, 1, 1, 1, 1,
-1.757417, -2.984267, -4.30249, 1, 1, 1, 1, 1,
-1.721843, -0.8159225, -2.585721, 1, 1, 1, 1, 1,
-1.721734, -1.187206, -1.309728, 1, 1, 1, 1, 1,
-1.718807, -0.09478889, -0.7439042, 1, 1, 1, 1, 1,
-1.703539, -2.224952, -1.879499, 1, 1, 1, 1, 1,
-1.700653, 0.09670779, 0.2336272, 1, 1, 1, 1, 1,
-1.700118, 0.1100608, -0.323507, 1, 1, 1, 1, 1,
-1.690207, 1.716291, -1.394776, 1, 1, 1, 1, 1,
-1.688127, 2.395056, -0.8749737, 1, 1, 1, 1, 1,
-1.669756, -0.1675967, -1.457378, 1, 1, 1, 1, 1,
-1.665492, 0.5428968, -0.06515447, 1, 1, 1, 1, 1,
-1.665285, -0.393185, -0.3679458, 1, 1, 1, 1, 1,
-1.66017, 0.5618453, -0.364186, 1, 1, 1, 1, 1,
-1.639614, -0.2567807, -0.988627, 0, 0, 1, 1, 1,
-1.637552, -0.2812164, -2.401333, 1, 0, 0, 1, 1,
-1.62384, 1.586786, -0.2884237, 1, 0, 0, 1, 1,
-1.616496, -0.06378693, -3.326637, 1, 0, 0, 1, 1,
-1.604138, 0.3938036, -0.9402516, 1, 0, 0, 1, 1,
-1.591239, -2.155422, -2.222502, 1, 0, 0, 1, 1,
-1.585689, -0.02856983, -1.640096, 0, 0, 0, 1, 1,
-1.579186, -0.3761986, -1.610723, 0, 0, 0, 1, 1,
-1.562412, -1.005872, -1.873509, 0, 0, 0, 1, 1,
-1.547483, 0.8282284, -0.7792501, 0, 0, 0, 1, 1,
-1.545625, -0.9133483, -1.18697, 0, 0, 0, 1, 1,
-1.543722, -0.3623901, -2.024852, 0, 0, 0, 1, 1,
-1.541273, -1.216237, -2.70198, 0, 0, 0, 1, 1,
-1.534488, 1.238295, -0.417109, 1, 1, 1, 1, 1,
-1.533268, 0.4523005, -3.033368, 1, 1, 1, 1, 1,
-1.525608, -0.355144, -1.999353, 1, 1, 1, 1, 1,
-1.525002, -1.647333, -2.867482, 1, 1, 1, 1, 1,
-1.523504, -0.3915587, -2.830613, 1, 1, 1, 1, 1,
-1.522346, -0.07167993, -0.8281674, 1, 1, 1, 1, 1,
-1.515696, -0.05736878, -2.243947, 1, 1, 1, 1, 1,
-1.509491, 0.02712733, -1.969122, 1, 1, 1, 1, 1,
-1.506782, -1.030572, -2.566896, 1, 1, 1, 1, 1,
-1.504054, 0.414861, -2.340008, 1, 1, 1, 1, 1,
-1.485768, 0.2469427, -1.388035, 1, 1, 1, 1, 1,
-1.482348, 0.1140022, -1.668195, 1, 1, 1, 1, 1,
-1.479644, 2.26912, -1.593633, 1, 1, 1, 1, 1,
-1.474478, 1.096309, -0.766978, 1, 1, 1, 1, 1,
-1.470851, 0.6581544, -2.125736, 1, 1, 1, 1, 1,
-1.460956, 0.2155992, -0.7448771, 0, 0, 1, 1, 1,
-1.456491, -0.01016501, -2.813073, 1, 0, 0, 1, 1,
-1.423339, 0.07107425, -1.273802, 1, 0, 0, 1, 1,
-1.419476, 0.9397769, -1.125791, 1, 0, 0, 1, 1,
-1.413487, -0.06101051, -0.3103203, 1, 0, 0, 1, 1,
-1.411705, 1.584229, 0.01252739, 1, 0, 0, 1, 1,
-1.410375, -0.5358065, -3.628451, 0, 0, 0, 1, 1,
-1.410141, -1.746462, -2.303799, 0, 0, 0, 1, 1,
-1.400983, -0.1079821, -0.374244, 0, 0, 0, 1, 1,
-1.383304, 1.015308, 2.172384, 0, 0, 0, 1, 1,
-1.371695, -0.05459171, -2.392703, 0, 0, 0, 1, 1,
-1.366697, 0.1171864, -3.103658, 0, 0, 0, 1, 1,
-1.366458, -0.8135197, -3.91828, 0, 0, 0, 1, 1,
-1.366086, -0.08270594, -0.4839175, 1, 1, 1, 1, 1,
-1.338674, 1.887139, 0.4754854, 1, 1, 1, 1, 1,
-1.326136, 1.134938, 1.174582, 1, 1, 1, 1, 1,
-1.325531, 2.722973, 0.18477, 1, 1, 1, 1, 1,
-1.324522, 1.105307, -1.096469, 1, 1, 1, 1, 1,
-1.318934, 2.102278, -1.775876, 1, 1, 1, 1, 1,
-1.317923, -0.3398304, -3.556228, 1, 1, 1, 1, 1,
-1.3141, -0.1934358, -1.224785, 1, 1, 1, 1, 1,
-1.313188, 0.2127472, -0.6159201, 1, 1, 1, 1, 1,
-1.310351, 1.277743, -0.90554, 1, 1, 1, 1, 1,
-1.305195, 0.313427, -1.847189, 1, 1, 1, 1, 1,
-1.302203, -0.4223869, -0.3464978, 1, 1, 1, 1, 1,
-1.291321, 0.6515918, -0.05557603, 1, 1, 1, 1, 1,
-1.287441, 0.1423676, -1.49556, 1, 1, 1, 1, 1,
-1.286448, -0.8898467, -2.373813, 1, 1, 1, 1, 1,
-1.28029, 1.35027, -1.39818, 0, 0, 1, 1, 1,
-1.277779, -0.7833028, -3.026815, 1, 0, 0, 1, 1,
-1.265275, 1.088688, -0.7577122, 1, 0, 0, 1, 1,
-1.259877, -1.118403, -1.592059, 1, 0, 0, 1, 1,
-1.258715, 0.9863915, -2.097704, 1, 0, 0, 1, 1,
-1.242874, 0.09610468, -2.523096, 1, 0, 0, 1, 1,
-1.24218, -0.1400398, -0.8560326, 0, 0, 0, 1, 1,
-1.241062, 0.4400533, -1.928722, 0, 0, 0, 1, 1,
-1.229092, -1.558275, -2.66852, 0, 0, 0, 1, 1,
-1.220615, 1.145107, 0.8618209, 0, 0, 0, 1, 1,
-1.206224, 0.02072181, 1.009228, 0, 0, 0, 1, 1,
-1.200671, 2.26984, 0.4187399, 0, 0, 0, 1, 1,
-1.198556, 2.34128, -0.5740509, 0, 0, 0, 1, 1,
-1.196993, -0.381076, -1.766175, 1, 1, 1, 1, 1,
-1.190368, -0.474869, -1.364346, 1, 1, 1, 1, 1,
-1.188584, -1.261807, -3.477441, 1, 1, 1, 1, 1,
-1.16977, 0.1172931, -1.390852, 1, 1, 1, 1, 1,
-1.164866, 1.341421, 0.7031931, 1, 1, 1, 1, 1,
-1.162946, 0.5619237, -1.306457, 1, 1, 1, 1, 1,
-1.157159, -0.03578085, -0.3905945, 1, 1, 1, 1, 1,
-1.156008, 1.033685, -0.7850754, 1, 1, 1, 1, 1,
-1.155648, -0.68725, -1.765808, 1, 1, 1, 1, 1,
-1.154741, -0.3955269, -1.400138, 1, 1, 1, 1, 1,
-1.15147, -1.426453, -3.067335, 1, 1, 1, 1, 1,
-1.138027, 1.343742, 1.108296, 1, 1, 1, 1, 1,
-1.137897, -0.5213019, -2.142607, 1, 1, 1, 1, 1,
-1.13462, 0.8521476, -3.480558, 1, 1, 1, 1, 1,
-1.129608, 0.317182, -1.126959, 1, 1, 1, 1, 1,
-1.122838, 0.8072412, -0.4919447, 0, 0, 1, 1, 1,
-1.111549, 1.162763, 0.9891645, 1, 0, 0, 1, 1,
-1.103581, -1.575912, -2.705594, 1, 0, 0, 1, 1,
-1.102459, 0.2207005, -1.038684, 1, 0, 0, 1, 1,
-1.101909, -0.4183321, -1.630522, 1, 0, 0, 1, 1,
-1.094413, 0.2596837, -3.593977, 1, 0, 0, 1, 1,
-1.09161, -1.349875, -1.062567, 0, 0, 0, 1, 1,
-1.088744, 0.4719686, -1.329502, 0, 0, 0, 1, 1,
-1.077948, 1.670429, -1.901286, 0, 0, 0, 1, 1,
-1.070447, -0.4939979, -0.9658195, 0, 0, 0, 1, 1,
-1.070287, 0.9946625, -1.731363, 0, 0, 0, 1, 1,
-1.065371, -0.6925434, -0.6229275, 0, 0, 0, 1, 1,
-1.059687, 1.026795, 0.8317717, 0, 0, 0, 1, 1,
-1.053855, 0.7339607, -2.472153, 1, 1, 1, 1, 1,
-1.051287, -1.055758, -2.399463, 1, 1, 1, 1, 1,
-1.051182, 0.4215255, -1.299207, 1, 1, 1, 1, 1,
-1.049908, 0.9897299, -1.862888, 1, 1, 1, 1, 1,
-1.048117, 0.2985356, -1.805433, 1, 1, 1, 1, 1,
-1.042469, 1.571497, 0.1965206, 1, 1, 1, 1, 1,
-1.042441, -0.9491462, -3.328178, 1, 1, 1, 1, 1,
-1.039412, 0.2414891, -0.5071328, 1, 1, 1, 1, 1,
-1.037295, 0.7358127, -1.760058, 1, 1, 1, 1, 1,
-1.035991, 0.3235729, -0.3124209, 1, 1, 1, 1, 1,
-1.03386, -0.8016041, 0.6253157, 1, 1, 1, 1, 1,
-1.032253, -0.1596853, 0.2885093, 1, 1, 1, 1, 1,
-1.029643, -0.4850754, -4.887137, 1, 1, 1, 1, 1,
-1.028013, -0.3637877, -3.017323, 1, 1, 1, 1, 1,
-1.019169, 0.4159952, -2.247896, 1, 1, 1, 1, 1,
-1.01583, 0.1148776, -1.317436, 0, 0, 1, 1, 1,
-1.01296, -0.2333382, -2.775719, 1, 0, 0, 1, 1,
-1.01138, -0.5239421, 1.401029, 1, 0, 0, 1, 1,
-1.011233, -1.850053, -3.368209, 1, 0, 0, 1, 1,
-1.008963, 1.024913, -1.042911, 1, 0, 0, 1, 1,
-1.006903, 0.9044951, 0.3330815, 1, 0, 0, 1, 1,
-1.005888, 1.844852, -1.977918, 0, 0, 0, 1, 1,
-1.002001, -0.7008733, -1.436007, 0, 0, 0, 1, 1,
-1.000908, 1.130961, 0.4292153, 0, 0, 0, 1, 1,
-0.9945671, 1.034725, -3.634432, 0, 0, 0, 1, 1,
-0.9939228, 1.42651, -2.39015, 0, 0, 0, 1, 1,
-0.9899583, 0.7999215, -1.429693, 0, 0, 0, 1, 1,
-0.9808787, -1.42767, -3.475384, 0, 0, 0, 1, 1,
-0.9733151, -2.603566, -3.232043, 1, 1, 1, 1, 1,
-0.9726881, -0.7677646, -2.286856, 1, 1, 1, 1, 1,
-0.9699273, -0.1514871, -1.637076, 1, 1, 1, 1, 1,
-0.9695652, -0.1276813, -2.269183, 1, 1, 1, 1, 1,
-0.9556931, 1.028514, -1.062658, 1, 1, 1, 1, 1,
-0.9548154, 0.003089691, -1.879562, 1, 1, 1, 1, 1,
-0.9500335, 0.4557617, 0.467694, 1, 1, 1, 1, 1,
-0.9482261, 0.2110277, -3.685004, 1, 1, 1, 1, 1,
-0.9418119, 0.3219625, -2.279489, 1, 1, 1, 1, 1,
-0.9267364, -0.6283484, -0.8148236, 1, 1, 1, 1, 1,
-0.9240426, -1.340307, -2.687011, 1, 1, 1, 1, 1,
-0.9179149, -0.4631214, -2.702845, 1, 1, 1, 1, 1,
-0.915587, 0.03579928, -0.5913946, 1, 1, 1, 1, 1,
-0.9091405, 0.01236416, -0.8262551, 1, 1, 1, 1, 1,
-0.9037514, -1.403251, -1.969405, 1, 1, 1, 1, 1,
-0.900516, -1.241032, -2.23845, 0, 0, 1, 1, 1,
-0.8924895, 1.699518, -0.2825327, 1, 0, 0, 1, 1,
-0.8915324, -0.5865456, -2.187198, 1, 0, 0, 1, 1,
-0.8883833, -1.266074, -3.434075, 1, 0, 0, 1, 1,
-0.887758, -0.2032914, -3.291984, 1, 0, 0, 1, 1,
-0.8805534, 0.1941356, -2.893058, 1, 0, 0, 1, 1,
-0.8783582, -2.43981, -3.865479, 0, 0, 0, 1, 1,
-0.8772971, 0.09144325, -0.2990513, 0, 0, 0, 1, 1,
-0.8749593, 0.7787167, -1.344224, 0, 0, 0, 1, 1,
-0.8681466, -1.470312, -1.767812, 0, 0, 0, 1, 1,
-0.8652549, 1.256807, -2.062718, 0, 0, 0, 1, 1,
-0.8604987, -1.026956, -1.745428, 0, 0, 0, 1, 1,
-0.8595265, -1.393771, -0.297421, 0, 0, 0, 1, 1,
-0.8565044, -1.067426, -2.23974, 1, 1, 1, 1, 1,
-0.8499525, -2.061424, -2.392198, 1, 1, 1, 1, 1,
-0.8469533, -0.4228829, -3.14882, 1, 1, 1, 1, 1,
-0.8467783, 1.515692, -0.3699845, 1, 1, 1, 1, 1,
-0.8441523, 0.04625015, -3.607053, 1, 1, 1, 1, 1,
-0.8434856, 0.2121396, -0.6184664, 1, 1, 1, 1, 1,
-0.8430426, 1.56734, 0.8933514, 1, 1, 1, 1, 1,
-0.8350087, -0.0736898, -0.8387045, 1, 1, 1, 1, 1,
-0.8315211, -0.04214631, -2.732543, 1, 1, 1, 1, 1,
-0.8288507, -1.333553, -1.304761, 1, 1, 1, 1, 1,
-0.8280635, -0.2049614, -2.08231, 1, 1, 1, 1, 1,
-0.8277199, -0.4016868, -2.449525, 1, 1, 1, 1, 1,
-0.8262681, 0.1767422, -0.6091387, 1, 1, 1, 1, 1,
-0.8247048, -0.5967041, -2.815183, 1, 1, 1, 1, 1,
-0.8187581, 0.2731442, -1.23829, 1, 1, 1, 1, 1,
-0.8088674, -1.149416, -2.707631, 0, 0, 1, 1, 1,
-0.8079568, -2.536831, -2.682328, 1, 0, 0, 1, 1,
-0.8019674, 1.182061, -1.717944, 1, 0, 0, 1, 1,
-0.8019025, -1.171247, -2.432279, 1, 0, 0, 1, 1,
-0.8006022, 1.329185, -0.1605141, 1, 0, 0, 1, 1,
-0.7970781, 0.818804, -0.6851887, 1, 0, 0, 1, 1,
-0.7952524, 0.9046835, 0.2861178, 0, 0, 0, 1, 1,
-0.7932537, 1.347984, -2.49653, 0, 0, 0, 1, 1,
-0.7907244, 0.6266274, -0.3259054, 0, 0, 0, 1, 1,
-0.7822062, 0.7364854, 0.9725111, 0, 0, 0, 1, 1,
-0.7793809, 0.1328652, 0.1544734, 0, 0, 0, 1, 1,
-0.77099, -0.002314565, -1.432484, 0, 0, 0, 1, 1,
-0.7695263, 0.2345671, -0.82074, 0, 0, 0, 1, 1,
-0.7687275, 0.6761891, -0.4360946, 1, 1, 1, 1, 1,
-0.760346, 0.7071722, -3.215767, 1, 1, 1, 1, 1,
-0.7571629, -1.629878, -0.1181664, 1, 1, 1, 1, 1,
-0.754547, -1.253835, -3.848319, 1, 1, 1, 1, 1,
-0.7528678, -0.9294108, -1.703323, 1, 1, 1, 1, 1,
-0.7526031, 1.033762, 0.6583821, 1, 1, 1, 1, 1,
-0.7501707, 0.2669183, -0.5772926, 1, 1, 1, 1, 1,
-0.7460961, -0.7969377, -2.921504, 1, 1, 1, 1, 1,
-0.7436746, -1.054827, -1.122473, 1, 1, 1, 1, 1,
-0.7432731, -0.00567172, -2.295864, 1, 1, 1, 1, 1,
-0.740981, 0.5424044, -1.239252, 1, 1, 1, 1, 1,
-0.7408258, 0.2051022, -1.680821, 1, 1, 1, 1, 1,
-0.7380021, 0.4944928, -2.088451, 1, 1, 1, 1, 1,
-0.73668, -1.096827, -2.761096, 1, 1, 1, 1, 1,
-0.7366263, 0.4950452, 0.07415237, 1, 1, 1, 1, 1,
-0.735212, 0.5852817, -0.867978, 0, 0, 1, 1, 1,
-0.7276174, 0.09001708, 0.8103502, 1, 0, 0, 1, 1,
-0.7168463, 0.2272467, -2.676786, 1, 0, 0, 1, 1,
-0.7149131, -0.5679356, -4.292373, 1, 0, 0, 1, 1,
-0.7147998, -1.169783, -3.341919, 1, 0, 0, 1, 1,
-0.7110881, -1.340055, -2.663554, 1, 0, 0, 1, 1,
-0.7109916, -0.4928735, -1.414793, 0, 0, 0, 1, 1,
-0.7093739, 1.463579, -0.05257572, 0, 0, 0, 1, 1,
-0.706385, 0.1918073, -2.568795, 0, 0, 0, 1, 1,
-0.7059496, 2.190505, -0.9737176, 0, 0, 0, 1, 1,
-0.7058424, -0.6400967, -2.742448, 0, 0, 0, 1, 1,
-0.702382, 1.017236, -1.570849, 0, 0, 0, 1, 1,
-0.6993969, -1.77064, -3.575537, 0, 0, 0, 1, 1,
-0.6885496, -1.243986, -3.235215, 1, 1, 1, 1, 1,
-0.686109, -1.771814, -1.993478, 1, 1, 1, 1, 1,
-0.6822829, -0.3541176, -2.213171, 1, 1, 1, 1, 1,
-0.6816576, -0.139609, -2.543762, 1, 1, 1, 1, 1,
-0.6816273, 0.4965293, -0.1860603, 1, 1, 1, 1, 1,
-0.6808908, -1.305269, -2.846701, 1, 1, 1, 1, 1,
-0.6784137, 1.417364, -2.175795, 1, 1, 1, 1, 1,
-0.6768029, 0.03222759, 0.2876769, 1, 1, 1, 1, 1,
-0.6760648, -0.3346486, -2.253325, 1, 1, 1, 1, 1,
-0.6730872, 0.3116266, -0.9985348, 1, 1, 1, 1, 1,
-0.6652156, -0.3004253, -1.150753, 1, 1, 1, 1, 1,
-0.6586393, 1.874985, -0.186953, 1, 1, 1, 1, 1,
-0.6565347, 0.1053822, -2.17505, 1, 1, 1, 1, 1,
-0.6542349, 0.6934881, 0.9367873, 1, 1, 1, 1, 1,
-0.6424472, -1.613551, -4.002789, 1, 1, 1, 1, 1,
-0.6373696, 1.919232, -1.123225, 0, 0, 1, 1, 1,
-0.6362631, -0.5926465, -3.360497, 1, 0, 0, 1, 1,
-0.634833, -0.18219, -1.374021, 1, 0, 0, 1, 1,
-0.6304509, 0.4076074, -0.1259327, 1, 0, 0, 1, 1,
-0.6296858, -0.6895114, -1.741478, 1, 0, 0, 1, 1,
-0.6265414, -0.4240132, -3.800959, 1, 0, 0, 1, 1,
-0.6239536, -0.2682545, -2.463776, 0, 0, 0, 1, 1,
-0.6228481, 0.1517861, -3.3754, 0, 0, 0, 1, 1,
-0.6184915, 0.7468213, 0.6028044, 0, 0, 0, 1, 1,
-0.6130236, 1.211262, -0.2635826, 0, 0, 0, 1, 1,
-0.6108428, 1.062091, 0.2808183, 0, 0, 0, 1, 1,
-0.609242, -0.340363, -1.69632, 0, 0, 0, 1, 1,
-0.6087355, -1.00926, -3.477114, 0, 0, 0, 1, 1,
-0.6087051, -1.162193, -1.535654, 1, 1, 1, 1, 1,
-0.60637, 0.9040917, -1.194118, 1, 1, 1, 1, 1,
-0.6045584, 0.4110031, 1.796368, 1, 1, 1, 1, 1,
-0.6034097, -0.6826873, -2.598217, 1, 1, 1, 1, 1,
-0.6019424, -2.776141, -2.789151, 1, 1, 1, 1, 1,
-0.5995365, 0.9014583, 0.1061471, 1, 1, 1, 1, 1,
-0.5975484, 1.027058, 0.0816307, 1, 1, 1, 1, 1,
-0.5939782, -1.012752, -3.258921, 1, 1, 1, 1, 1,
-0.5905764, 1.47564, -0.3760689, 1, 1, 1, 1, 1,
-0.5898936, 0.3690737, 1.014746, 1, 1, 1, 1, 1,
-0.5897723, 0.9466678, -0.7757204, 1, 1, 1, 1, 1,
-0.5821937, 1.585905, -1.568938, 1, 1, 1, 1, 1,
-0.5816205, 0.2520463, -0.1968779, 1, 1, 1, 1, 1,
-0.5816166, -0.3818601, -1.2597, 1, 1, 1, 1, 1,
-0.5802634, 1.006648, -0.732685, 1, 1, 1, 1, 1,
-0.5801697, -1.802989, -2.270262, 0, 0, 1, 1, 1,
-0.5792897, -2.141723, -1.890074, 1, 0, 0, 1, 1,
-0.5730245, 0.2257707, -1.107708, 1, 0, 0, 1, 1,
-0.571898, 1.405968, -2.684777, 1, 0, 0, 1, 1,
-0.5682703, -0.4390518, -1.678034, 1, 0, 0, 1, 1,
-0.566632, 0.3209153, -0.5577186, 1, 0, 0, 1, 1,
-0.5636916, 0.1287332, -1.48806, 0, 0, 0, 1, 1,
-0.5622103, -1.31951, -4.189391, 0, 0, 0, 1, 1,
-0.550178, 0.04859333, -1.11491, 0, 0, 0, 1, 1,
-0.5496947, 1.0011, -0.4785255, 0, 0, 0, 1, 1,
-0.5496405, -1.23406, -2.529692, 0, 0, 0, 1, 1,
-0.547672, 0.8747219, -1.437322, 0, 0, 0, 1, 1,
-0.5470626, 0.2788354, -2.24611, 0, 0, 0, 1, 1,
-0.546317, -0.8530369, -3.174236, 1, 1, 1, 1, 1,
-0.5404844, -0.3304973, -2.374387, 1, 1, 1, 1, 1,
-0.5181004, 0.1491314, -0.8379689, 1, 1, 1, 1, 1,
-0.513335, 1.25887, 0.4073057, 1, 1, 1, 1, 1,
-0.5078936, 0.7390962, 0.7431281, 1, 1, 1, 1, 1,
-0.5030761, 0.5510656, -1.721744, 1, 1, 1, 1, 1,
-0.499561, 2.056388, -0.7155806, 1, 1, 1, 1, 1,
-0.4914722, 1.451219, 0.04037833, 1, 1, 1, 1, 1,
-0.4841996, 0.4417614, -1.562448, 1, 1, 1, 1, 1,
-0.4808844, 1.349265, 0.3634846, 1, 1, 1, 1, 1,
-0.4807723, 0.0718079, -0.3648079, 1, 1, 1, 1, 1,
-0.4773826, 0.1250015, -0.1991103, 1, 1, 1, 1, 1,
-0.4766987, -1.238507, -2.320729, 1, 1, 1, 1, 1,
-0.472663, 0.4319, -2.927411, 1, 1, 1, 1, 1,
-0.4702051, -0.676124, -2.180761, 1, 1, 1, 1, 1,
-0.4671734, -1.097656, -2.336216, 0, 0, 1, 1, 1,
-0.4653226, -0.4416668, -2.617632, 1, 0, 0, 1, 1,
-0.4635129, 0.6815721, -1.010078, 1, 0, 0, 1, 1,
-0.461255, -0.1002206, -3.283284, 1, 0, 0, 1, 1,
-0.4573441, -1.076406, -3.294724, 1, 0, 0, 1, 1,
-0.4570695, -0.7807598, -3.556646, 1, 0, 0, 1, 1,
-0.455635, -1.218208, -3.223232, 0, 0, 0, 1, 1,
-0.4531233, -0.354645, -0.7353569, 0, 0, 0, 1, 1,
-0.452932, -0.0196689, 0.09075721, 0, 0, 0, 1, 1,
-0.451985, 0.1221383, -0.2637862, 0, 0, 0, 1, 1,
-0.4506113, 0.3166851, 0.9265368, 0, 0, 0, 1, 1,
-0.4496656, -0.3235874, -3.094167, 0, 0, 0, 1, 1,
-0.4476059, -0.3081528, -2.578298, 0, 0, 0, 1, 1,
-0.4469998, -0.6551665, -2.450597, 1, 1, 1, 1, 1,
-0.4468151, -0.2263311, -2.01866, 1, 1, 1, 1, 1,
-0.4437516, -1.20964, -2.05478, 1, 1, 1, 1, 1,
-0.4414253, 0.07801284, -0.4710691, 1, 1, 1, 1, 1,
-0.4386235, -0.6099685, -1.945414, 1, 1, 1, 1, 1,
-0.4342808, 0.8740336, -0.8379806, 1, 1, 1, 1, 1,
-0.4317604, 1.774014, 0.0124688, 1, 1, 1, 1, 1,
-0.4306969, 0.8190178, -0.4040931, 1, 1, 1, 1, 1,
-0.4303402, 0.14042, -0.9692445, 1, 1, 1, 1, 1,
-0.4278913, 0.2428963, -0.8460756, 1, 1, 1, 1, 1,
-0.4258505, -0.4895296, -2.347075, 1, 1, 1, 1, 1,
-0.4257889, -0.20896, -0.8568966, 1, 1, 1, 1, 1,
-0.4257127, -0.2644581, -1.950765, 1, 1, 1, 1, 1,
-0.422891, 0.8419938, 0.05970192, 1, 1, 1, 1, 1,
-0.4183921, -0.1386778, -0.4801095, 1, 1, 1, 1, 1,
-0.4146513, -0.2940492, -1.637906, 0, 0, 1, 1, 1,
-0.4075471, -1.403753, -2.983713, 1, 0, 0, 1, 1,
-0.4033864, 0.8230826, 1.259812, 1, 0, 0, 1, 1,
-0.4023213, 1.352734, 2.00389, 1, 0, 0, 1, 1,
-0.4018906, 1.484877, -0.6685659, 1, 0, 0, 1, 1,
-0.4003695, 0.8160469, -0.8087459, 1, 0, 0, 1, 1,
-0.391015, -0.2592455, -4.050808, 0, 0, 0, 1, 1,
-0.3811829, 1.099768, -1.577046, 0, 0, 0, 1, 1,
-0.3782228, 1.391761, -0.02888782, 0, 0, 0, 1, 1,
-0.378117, 0.09198343, -0.4368029, 0, 0, 0, 1, 1,
-0.3764114, 0.7889187, 0.4213254, 0, 0, 0, 1, 1,
-0.3737452, -0.4228269, -2.945534, 0, 0, 0, 1, 1,
-0.3716982, -0.4823138, -2.897506, 0, 0, 0, 1, 1,
-0.363373, -1.307987, -3.78321, 1, 1, 1, 1, 1,
-0.3600481, 0.467512, -1.565956, 1, 1, 1, 1, 1,
-0.3588076, 2.263408, -1.093024, 1, 1, 1, 1, 1,
-0.3574645, 0.7603232, -1.891695, 1, 1, 1, 1, 1,
-0.3479056, 0.3223639, -0.796294, 1, 1, 1, 1, 1,
-0.3450124, -0.6643215, -3.039158, 1, 1, 1, 1, 1,
-0.344251, 1.158293, -0.1980826, 1, 1, 1, 1, 1,
-0.3430949, -0.02115353, -0.6957148, 1, 1, 1, 1, 1,
-0.3425115, -2.001741, -4.040792, 1, 1, 1, 1, 1,
-0.3396001, 0.378721, -0.7118444, 1, 1, 1, 1, 1,
-0.3360329, 0.5485004, 0.7312912, 1, 1, 1, 1, 1,
-0.3343085, 0.1165487, -1.920551, 1, 1, 1, 1, 1,
-0.3340558, -0.5550777, -2.029645, 1, 1, 1, 1, 1,
-0.33307, 0.58221, -1.411591, 1, 1, 1, 1, 1,
-0.3211478, 0.717406, -2.137233, 1, 1, 1, 1, 1,
-0.3182763, 0.5752026, -0.8877117, 0, 0, 1, 1, 1,
-0.3120687, -1.052631, -2.853427, 1, 0, 0, 1, 1,
-0.3082508, -2.139469, -3.674298, 1, 0, 0, 1, 1,
-0.3074275, -1.349177, -3.597452, 1, 0, 0, 1, 1,
-0.3052409, 0.4497879, -0.3735034, 1, 0, 0, 1, 1,
-0.3017371, -1.027842, -3.50596, 1, 0, 0, 1, 1,
-0.3006209, 0.8763425, -1.838936, 0, 0, 0, 1, 1,
-0.289518, -0.5687335, -2.54055, 0, 0, 0, 1, 1,
-0.2827621, -0.6189561, -3.588676, 0, 0, 0, 1, 1,
-0.2762304, -1.937804, -3.411722, 0, 0, 0, 1, 1,
-0.2751576, 1.508628, -0.6602776, 0, 0, 0, 1, 1,
-0.2704946, 0.6899134, -0.4034409, 0, 0, 0, 1, 1,
-0.2676453, -0.1982539, -1.741194, 0, 0, 0, 1, 1,
-0.2658391, -0.8760864, -1.931114, 1, 1, 1, 1, 1,
-0.2630918, 1.841961, 0.9611704, 1, 1, 1, 1, 1,
-0.2606784, -1.367924, -2.355205, 1, 1, 1, 1, 1,
-0.2562435, -2.330156, -4.290693, 1, 1, 1, 1, 1,
-0.2501927, 1.581042, -0.7174456, 1, 1, 1, 1, 1,
-0.2498139, -0.5391601, -2.798559, 1, 1, 1, 1, 1,
-0.2496667, -0.3544415, -1.39332, 1, 1, 1, 1, 1,
-0.2487354, -0.1570962, -1.565961, 1, 1, 1, 1, 1,
-0.2471261, -0.383134, -2.544639, 1, 1, 1, 1, 1,
-0.2456684, 0.5010726, -0.9580579, 1, 1, 1, 1, 1,
-0.2451491, -0.2695639, -4.150564, 1, 1, 1, 1, 1,
-0.2436672, 0.3080888, 0.7522171, 1, 1, 1, 1, 1,
-0.2432353, -1.692426, -3.427895, 1, 1, 1, 1, 1,
-0.2421498, 0.04400255, -0.5664997, 1, 1, 1, 1, 1,
-0.2313424, 0.6614252, 0.822772, 1, 1, 1, 1, 1,
-0.22716, 1.408251, -0.8808638, 0, 0, 1, 1, 1,
-0.2269924, 0.5319124, -0.3353243, 1, 0, 0, 1, 1,
-0.2240904, 1.216691, 0.2629871, 1, 0, 0, 1, 1,
-0.2169136, 0.5331854, -1.304953, 1, 0, 0, 1, 1,
-0.2151337, 0.7626553, -2.001874, 1, 0, 0, 1, 1,
-0.2149426, 0.05707489, -0.03642774, 1, 0, 0, 1, 1,
-0.2124816, 1.462523, 0.5782754, 0, 0, 0, 1, 1,
-0.2122217, 0.3468331, 1.24504, 0, 0, 0, 1, 1,
-0.2083463, -0.8610104, -2.677592, 0, 0, 0, 1, 1,
-0.2030365, 1.525444, -2.218807, 0, 0, 0, 1, 1,
-0.2018152, -0.1383152, -1.22016, 0, 0, 0, 1, 1,
-0.2004894, -0.2194131, -4.024144, 0, 0, 0, 1, 1,
-0.1989463, -1.069691, -2.768538, 0, 0, 0, 1, 1,
-0.1919945, 0.5934322, 1.086943, 1, 1, 1, 1, 1,
-0.191617, -0.4751707, -2.973653, 1, 1, 1, 1, 1,
-0.1897663, -0.05180798, -2.757922, 1, 1, 1, 1, 1,
-0.1889759, 1.20853, -2.787282, 1, 1, 1, 1, 1,
-0.1822415, 1.158406, -1.993161, 1, 1, 1, 1, 1,
-0.1760427, -0.7748998, -2.244654, 1, 1, 1, 1, 1,
-0.1755064, 0.9123361, 1.04953, 1, 1, 1, 1, 1,
-0.1751512, -0.744706, -3.814964, 1, 1, 1, 1, 1,
-0.1720015, -0.6711608, -5.271973, 1, 1, 1, 1, 1,
-0.1716038, -2.435701, -3.866347, 1, 1, 1, 1, 1,
-0.1683871, -0.17181, -3.276567, 1, 1, 1, 1, 1,
-0.165581, -1.430141, -1.252367, 1, 1, 1, 1, 1,
-0.1654032, 0.2948621, -2.996507, 1, 1, 1, 1, 1,
-0.1542128, 0.9758258, -0.06180597, 1, 1, 1, 1, 1,
-0.1535342, -1.997023, -4.499999, 1, 1, 1, 1, 1,
-0.1497974, 0.4355907, 0.5951233, 0, 0, 1, 1, 1,
-0.146727, 0.1016985, -1.499228, 1, 0, 0, 1, 1,
-0.1416703, -0.8914554, -1.626979, 1, 0, 0, 1, 1,
-0.1364148, -0.4200644, -4.362452, 1, 0, 0, 1, 1,
-0.1356786, 0.7857155, 0.3522122, 1, 0, 0, 1, 1,
-0.1298888, 0.4899384, -0.6581332, 1, 0, 0, 1, 1,
-0.1295002, -1.267685, -1.979411, 0, 0, 0, 1, 1,
-0.1256317, 2.59247, 0.9412141, 0, 0, 0, 1, 1,
-0.1234933, 1.702023, 1.210869, 0, 0, 0, 1, 1,
-0.1219041, 0.672672, 1.698494, 0, 0, 0, 1, 1,
-0.1206753, -0.2726298, 0.2839658, 0, 0, 0, 1, 1,
-0.119744, -0.1795936, -4.870891, 0, 0, 0, 1, 1,
-0.1187028, 0.2493508, -2.057799, 0, 0, 0, 1, 1,
-0.118626, 1.196592, -0.8916343, 1, 1, 1, 1, 1,
-0.1175342, 0.7178063, -0.6475531, 1, 1, 1, 1, 1,
-0.114474, -0.2574086, -2.785554, 1, 1, 1, 1, 1,
-0.1121734, 1.676876, 0.3215348, 1, 1, 1, 1, 1,
-0.1107999, 1.44168, 1.16288, 1, 1, 1, 1, 1,
-0.1106194, 0.1663403, -0.4371263, 1, 1, 1, 1, 1,
-0.1058555, 0.2937061, -0.1722596, 1, 1, 1, 1, 1,
-0.1042836, 0.4191844, -0.1011204, 1, 1, 1, 1, 1,
-0.1033405, 1.308176, -0.7681352, 1, 1, 1, 1, 1,
-0.1010881, 0.8605607, -1.174096, 1, 1, 1, 1, 1,
-0.09841444, -1.381842, -5.153179, 1, 1, 1, 1, 1,
-0.09500679, 0.1554877, -1.603039, 1, 1, 1, 1, 1,
-0.09495381, 0.02071716, -1.675008, 1, 1, 1, 1, 1,
-0.08933819, -1.021398, -4.805066, 1, 1, 1, 1, 1,
-0.08773345, 0.1287722, -1.954678, 1, 1, 1, 1, 1,
-0.07982763, -0.3961636, -2.599607, 0, 0, 1, 1, 1,
-0.07961184, 0.2935941, 1.356751, 1, 0, 0, 1, 1,
-0.0732787, 0.9720564, 1.427897, 1, 0, 0, 1, 1,
-0.07144447, 0.9681816, -0.7281304, 1, 0, 0, 1, 1,
-0.06944121, -0.1373409, -3.245225, 1, 0, 0, 1, 1,
-0.06943324, -1.30691, -3.502184, 1, 0, 0, 1, 1,
-0.06827234, -1.452803, -2.359785, 0, 0, 0, 1, 1,
-0.06567191, 1.453886, 0.06719594, 0, 0, 0, 1, 1,
-0.05774156, 1.105946, -1.243829, 0, 0, 0, 1, 1,
-0.04998783, -1.032803, -1.094546, 0, 0, 0, 1, 1,
-0.04508877, -0.591871, -3.033753, 0, 0, 0, 1, 1,
-0.04113222, -1.126783, -3.076943, 0, 0, 0, 1, 1,
-0.0368723, -2.210394, -3.722594, 0, 0, 0, 1, 1,
-0.02922103, -1.120565, -2.696143, 1, 1, 1, 1, 1,
-0.02813863, -0.129973, -2.102986, 1, 1, 1, 1, 1,
-0.02705065, -0.8902999, -2.98853, 1, 1, 1, 1, 1,
-0.02459417, 0.2095945, -0.1566774, 1, 1, 1, 1, 1,
-0.0215989, -0.787415, -4.183727, 1, 1, 1, 1, 1,
-0.0215807, 1.138537, -1.055732, 1, 1, 1, 1, 1,
-0.02058351, 1.851707, -0.5197397, 1, 1, 1, 1, 1,
-0.02002341, 0.6455578, 0.7944073, 1, 1, 1, 1, 1,
-0.01260072, -0.9658448, -3.475458, 1, 1, 1, 1, 1,
-0.01150031, -0.5528365, -4.225977, 1, 1, 1, 1, 1,
-0.006223771, -1.07681, -4.744679, 1, 1, 1, 1, 1,
-0.00290414, -0.6349767, -3.203146, 1, 1, 1, 1, 1,
-0.0006739375, -1.739248, -2.800786, 1, 1, 1, 1, 1,
0.002248, -0.8405784, 4.402175, 1, 1, 1, 1, 1,
0.003953781, 0.1118981, 0.09404768, 1, 1, 1, 1, 1,
0.004708823, -0.05180189, 2.534812, 0, 0, 1, 1, 1,
0.004778461, -1.106695, 4.084554, 1, 0, 0, 1, 1,
0.007649178, 0.8844298, 0.6867133, 1, 0, 0, 1, 1,
0.009182164, -0.2492062, 2.476396, 1, 0, 0, 1, 1,
0.01431976, 1.436177, 0.8605618, 1, 0, 0, 1, 1,
0.02310987, -0.3720319, 4.003949, 1, 0, 0, 1, 1,
0.02454579, 1.295717, -0.3578736, 0, 0, 0, 1, 1,
0.0248939, -1.27111, 4.594069, 0, 0, 0, 1, 1,
0.02616878, -0.767626, 2.979847, 0, 0, 0, 1, 1,
0.02776377, -0.9855908, 4.098544, 0, 0, 0, 1, 1,
0.03125127, -0.3011973, 5.171299, 0, 0, 0, 1, 1,
0.03190691, 0.3291371, 1.933472, 0, 0, 0, 1, 1,
0.03960014, -0.07521967, 3.772074, 0, 0, 0, 1, 1,
0.04607424, -0.2799068, 3.23473, 1, 1, 1, 1, 1,
0.05041184, 0.3827974, -1.024372, 1, 1, 1, 1, 1,
0.05059886, -0.3280191, 4.89013, 1, 1, 1, 1, 1,
0.05109717, 0.1448094, 0.9981288, 1, 1, 1, 1, 1,
0.0523078, -0.9903292, 3.863918, 1, 1, 1, 1, 1,
0.05616707, 0.8484187, -0.1227402, 1, 1, 1, 1, 1,
0.0561693, 0.9953813, -0.7674195, 1, 1, 1, 1, 1,
0.05642058, -0.7577007, 3.348806, 1, 1, 1, 1, 1,
0.06150898, 0.4327054, 0.07264861, 1, 1, 1, 1, 1,
0.06473812, -0.8702703, 1.874924, 1, 1, 1, 1, 1,
0.06689041, 0.2253692, 0.3646593, 1, 1, 1, 1, 1,
0.07154614, 1.156194, -0.03882942, 1, 1, 1, 1, 1,
0.07640857, -0.4850685, 3.220953, 1, 1, 1, 1, 1,
0.081135, -0.4874222, 3.080091, 1, 1, 1, 1, 1,
0.08347397, -1.189183, 2.225872, 1, 1, 1, 1, 1,
0.0877867, 0.4796259, 0.3330868, 0, 0, 1, 1, 1,
0.08926508, -1.143359, 4.624879, 1, 0, 0, 1, 1,
0.0950452, -0.01420873, 1.460904, 1, 0, 0, 1, 1,
0.09584202, 0.8761112, -0.3698055, 1, 0, 0, 1, 1,
0.09639598, 1.522769, 2.382737, 1, 0, 0, 1, 1,
0.0997651, 0.4010785, 0.7712564, 1, 0, 0, 1, 1,
0.101762, 0.5792176, -0.05693021, 0, 0, 0, 1, 1,
0.1023883, -1.704382, 2.972327, 0, 0, 0, 1, 1,
0.1042053, -1.289911, 3.86395, 0, 0, 0, 1, 1,
0.114736, -1.1649, 3.731371, 0, 0, 0, 1, 1,
0.1159262, 1.758279, 0.2405248, 0, 0, 0, 1, 1,
0.1174949, 1.222107, 0.535781, 0, 0, 0, 1, 1,
0.1226539, 1.776837, 0.7459403, 0, 0, 0, 1, 1,
0.1268201, -0.5884343, 2.968207, 1, 1, 1, 1, 1,
0.1279818, 0.2139131, 0.2509995, 1, 1, 1, 1, 1,
0.1301304, -0.611841, 2.545691, 1, 1, 1, 1, 1,
0.1311334, 0.09968192, -0.2967907, 1, 1, 1, 1, 1,
0.1321443, -1.30455, 2.088656, 1, 1, 1, 1, 1,
0.1363867, -0.03346706, 2.327378, 1, 1, 1, 1, 1,
0.1393609, -0.1814429, 2.259883, 1, 1, 1, 1, 1,
0.141386, 1.103914, -1.217018, 1, 1, 1, 1, 1,
0.1494156, 2.035844, -0.9123521, 1, 1, 1, 1, 1,
0.1532949, -0.6433569, 2.723145, 1, 1, 1, 1, 1,
0.1562338, 0.03676574, 2.487344, 1, 1, 1, 1, 1,
0.157028, -1.242943, 2.884303, 1, 1, 1, 1, 1,
0.1579773, -1.099093, 4.45694, 1, 1, 1, 1, 1,
0.166407, -0.6265913, 4.923581, 1, 1, 1, 1, 1,
0.1690016, 0.03182724, 0.5950545, 1, 1, 1, 1, 1,
0.171617, 0.3160123, -0.3005848, 0, 0, 1, 1, 1,
0.1716462, -1.129754, 2.72019, 1, 0, 0, 1, 1,
0.1726861, 0.9505783, -0.9528074, 1, 0, 0, 1, 1,
0.1730415, 0.4261001, -0.01901736, 1, 0, 0, 1, 1,
0.1822789, -0.3176947, 1.967254, 1, 0, 0, 1, 1,
0.1929929, 1.470582, -0.5932422, 1, 0, 0, 1, 1,
0.1944667, -0.1272126, 3.15043, 0, 0, 0, 1, 1,
0.200558, -0.8781235, 3.455171, 0, 0, 0, 1, 1,
0.210987, 0.01606592, 2.215012, 0, 0, 0, 1, 1,
0.2118567, 2.209954, 1.199613, 0, 0, 0, 1, 1,
0.2119415, -1.509677, 2.8225, 0, 0, 0, 1, 1,
0.2121502, -1.675299, 4.144325, 0, 0, 0, 1, 1,
0.2127462, -0.949127, 4.00946, 0, 0, 0, 1, 1,
0.2145952, 0.1063288, 0.1540368, 1, 1, 1, 1, 1,
0.2152607, -0.4852743, 3.659863, 1, 1, 1, 1, 1,
0.2199884, 0.6683457, 1.340352, 1, 1, 1, 1, 1,
0.2276572, 0.746534, -0.1936102, 1, 1, 1, 1, 1,
0.2328871, 1.684294, -0.4340626, 1, 1, 1, 1, 1,
0.2336348, -0.163648, 0.0508682, 1, 1, 1, 1, 1,
0.235663, -1.081527, 3.287099, 1, 1, 1, 1, 1,
0.2367319, -0.2801628, 1.625816, 1, 1, 1, 1, 1,
0.2368435, -0.5984386, 1.678138, 1, 1, 1, 1, 1,
0.2414662, -1.307825, 4.076471, 1, 1, 1, 1, 1,
0.2433125, 1.080601, -0.7452342, 1, 1, 1, 1, 1,
0.2443366, -1.198201, 1.605919, 1, 1, 1, 1, 1,
0.2451654, 0.9869264, 1.41666, 1, 1, 1, 1, 1,
0.2459463, -0.7873498, 1.766838, 1, 1, 1, 1, 1,
0.2467403, -1.413633, 2.177527, 1, 1, 1, 1, 1,
0.2474362, -0.3678133, 3.654048, 0, 0, 1, 1, 1,
0.2486526, -0.5630146, 1.734342, 1, 0, 0, 1, 1,
0.2510201, -0.926951, 2.796654, 1, 0, 0, 1, 1,
0.2518112, 0.2617007, 0.5556797, 1, 0, 0, 1, 1,
0.258845, 0.384271, 1.682161, 1, 0, 0, 1, 1,
0.2651753, 0.905663, -0.05531804, 1, 0, 0, 1, 1,
0.2708874, -0.8535671, 3.863464, 0, 0, 0, 1, 1,
0.2741412, -0.2538065, 4.323267, 0, 0, 0, 1, 1,
0.276171, 0.06282131, 1.718402, 0, 0, 0, 1, 1,
0.2775834, 0.5980838, -0.117396, 0, 0, 0, 1, 1,
0.2777991, 0.8155717, -0.2756868, 0, 0, 0, 1, 1,
0.2787366, -0.737488, 1.605329, 0, 0, 0, 1, 1,
0.2798882, 0.5076774, -2.271764, 0, 0, 0, 1, 1,
0.2804188, -0.5533299, 1.866989, 1, 1, 1, 1, 1,
0.2893448, 1.055141, -1.005628, 1, 1, 1, 1, 1,
0.2920501, -0.9389228, 4.234728, 1, 1, 1, 1, 1,
0.2957123, -1.3491, 3.285787, 1, 1, 1, 1, 1,
0.299328, -0.7479057, 1.94792, 1, 1, 1, 1, 1,
0.3010693, 0.02344491, 3.710329, 1, 1, 1, 1, 1,
0.3025173, -0.7796955, 2.380343, 1, 1, 1, 1, 1,
0.3044727, -0.04779002, 2.65758, 1, 1, 1, 1, 1,
0.3093895, 0.7191518, 0.9378563, 1, 1, 1, 1, 1,
0.309609, 0.6292446, 1.108156, 1, 1, 1, 1, 1,
0.3113037, 0.5075272, 2.652666, 1, 1, 1, 1, 1,
0.312393, 0.8602639, 0.1412875, 1, 1, 1, 1, 1,
0.3129207, -0.5397881, 2.851137, 1, 1, 1, 1, 1,
0.3150599, -0.2566935, -0.9548233, 1, 1, 1, 1, 1,
0.3162278, 0.1631637, -0.5885869, 1, 1, 1, 1, 1,
0.317332, 0.6279711, 0.1083352, 0, 0, 1, 1, 1,
0.320223, -0.7483882, 3.220645, 1, 0, 0, 1, 1,
0.3211203, -0.1413712, 2.745222, 1, 0, 0, 1, 1,
0.3234785, 0.7353501, 0.8580205, 1, 0, 0, 1, 1,
0.3241508, 0.4144447, 0.7248984, 1, 0, 0, 1, 1,
0.3243611, 1.731049, 0.9235935, 1, 0, 0, 1, 1,
0.3303331, 0.9259174, 0.4176191, 0, 0, 0, 1, 1,
0.3349545, 0.7825456, 1.381022, 0, 0, 0, 1, 1,
0.3397006, 1.214586, 1.185407, 0, 0, 0, 1, 1,
0.3397922, 1.683429, 0.3911683, 0, 0, 0, 1, 1,
0.3406383, -0.3524651, -0.3898093, 0, 0, 0, 1, 1,
0.3486317, -0.07358749, 0.8406196, 0, 0, 0, 1, 1,
0.3513833, -0.9124621, 2.70495, 0, 0, 0, 1, 1,
0.3517545, 0.2414309, 2.720016, 1, 1, 1, 1, 1,
0.3631976, 1.392399, 0.7363427, 1, 1, 1, 1, 1,
0.3672296, 0.5997654, 3.028035, 1, 1, 1, 1, 1,
0.3715502, 0.5078107, 2.007717, 1, 1, 1, 1, 1,
0.3734361, 1.395669, 1.55257, 1, 1, 1, 1, 1,
0.3772803, 0.5248265, 2.073058, 1, 1, 1, 1, 1,
0.3781435, -1.077651, 3.796791, 1, 1, 1, 1, 1,
0.3793502, -0.5912357, 3.726323, 1, 1, 1, 1, 1,
0.380119, 0.6830652, 0.09036373, 1, 1, 1, 1, 1,
0.3812346, 0.5628795, 0.4733415, 1, 1, 1, 1, 1,
0.3924338, -1.280446, 1.133881, 1, 1, 1, 1, 1,
0.3959963, -1.326566, 3.878996, 1, 1, 1, 1, 1,
0.3973165, -0.4818708, 2.977712, 1, 1, 1, 1, 1,
0.3977448, 0.8340943, 1.431881, 1, 1, 1, 1, 1,
0.3985263, 0.3803363, 0.346936, 1, 1, 1, 1, 1,
0.399446, -2.186228, 3.315605, 0, 0, 1, 1, 1,
0.4029553, -0.9323353, 1.872873, 1, 0, 0, 1, 1,
0.4051067, 0.01907172, 1.206409, 1, 0, 0, 1, 1,
0.4097927, 0.775662, 0.9922262, 1, 0, 0, 1, 1,
0.4135575, -0.6426482, 3.182189, 1, 0, 0, 1, 1,
0.415178, -2.112412, 1.071588, 1, 0, 0, 1, 1,
0.4186811, 0.1947385, 0.6789363, 0, 0, 0, 1, 1,
0.4214603, -0.0892031, 3.752173, 0, 0, 0, 1, 1,
0.4215119, 2.065302, -0.7179279, 0, 0, 0, 1, 1,
0.4306724, 0.008043746, 0.06765919, 0, 0, 0, 1, 1,
0.4362923, -1.272713, 3.127695, 0, 0, 0, 1, 1,
0.4369249, -0.5073569, 3.248702, 0, 0, 0, 1, 1,
0.4384483, -0.9564152, 3.524351, 0, 0, 0, 1, 1,
0.4397393, 1.181926, 1.724282, 1, 1, 1, 1, 1,
0.4400431, -0.7038596, 1.256942, 1, 1, 1, 1, 1,
0.4450079, 1.280595, -0.08570153, 1, 1, 1, 1, 1,
0.4460672, -0.3963423, 2.111458, 1, 1, 1, 1, 1,
0.448091, -1.243795, 4.722836, 1, 1, 1, 1, 1,
0.4518273, 1.411043, 0.2909639, 1, 1, 1, 1, 1,
0.4537162, 1.802063, 1.005049, 1, 1, 1, 1, 1,
0.454162, -0.3499848, 1.893646, 1, 1, 1, 1, 1,
0.4579962, 0.810674, -0.3547579, 1, 1, 1, 1, 1,
0.4594882, -0.1167798, 2.137506, 1, 1, 1, 1, 1,
0.4602785, -0.3412337, 2.640347, 1, 1, 1, 1, 1,
0.4625652, -0.2583724, 1.858418, 1, 1, 1, 1, 1,
0.4661895, -0.2591108, 1.859056, 1, 1, 1, 1, 1,
0.4675835, 1.042046, -0.2874762, 1, 1, 1, 1, 1,
0.4694518, 1.139858, 0.254054, 1, 1, 1, 1, 1,
0.4697842, 0.2969747, -0.06254494, 0, 0, 1, 1, 1,
0.4747443, -0.1598764, 2.030974, 1, 0, 0, 1, 1,
0.4761237, -0.6692112, 2.741817, 1, 0, 0, 1, 1,
0.4805684, 0.8804392, 1.680101, 1, 0, 0, 1, 1,
0.5008697, -1.285437, 4.170833, 1, 0, 0, 1, 1,
0.5014271, -0.1136749, 2.015985, 1, 0, 0, 1, 1,
0.5024426, -1.055793, 4.683141, 0, 0, 0, 1, 1,
0.5072073, -0.4713399, 2.779635, 0, 0, 0, 1, 1,
0.5080827, 0.9111779, 0.2908179, 0, 0, 0, 1, 1,
0.5096188, 0.2663538, 0.9854826, 0, 0, 0, 1, 1,
0.5149119, 0.8280318, 0.8826076, 0, 0, 0, 1, 1,
0.5260856, 0.2040822, 1.346782, 0, 0, 0, 1, 1,
0.5302008, -0.7635145, 2.982745, 0, 0, 0, 1, 1,
0.5310611, -0.1898343, 1.530296, 1, 1, 1, 1, 1,
0.5313702, 1.020255, -0.8993027, 1, 1, 1, 1, 1,
0.5324233, -1.120341, 4.243926, 1, 1, 1, 1, 1,
0.5330659, -2.01502, 4.217815, 1, 1, 1, 1, 1,
0.5352299, -1.598605, 3.879451, 1, 1, 1, 1, 1,
0.5353155, -0.2030522, 0.04508696, 1, 1, 1, 1, 1,
0.5398017, 0.5635278, 1.432072, 1, 1, 1, 1, 1,
0.5419996, 0.7879989, 0.9800486, 1, 1, 1, 1, 1,
0.5522397, -0.5527166, 2.025901, 1, 1, 1, 1, 1,
0.5534171, -0.198791, 1.526963, 1, 1, 1, 1, 1,
0.5542172, -0.3865369, 0.8850349, 1, 1, 1, 1, 1,
0.5556597, 0.8070809, -0.3637909, 1, 1, 1, 1, 1,
0.5579581, 0.7735777, 1.236076, 1, 1, 1, 1, 1,
0.5596147, -1.018385, 2.636277, 1, 1, 1, 1, 1,
0.5602077, 1.667542, 1.293586, 1, 1, 1, 1, 1,
0.5615502, -0.3804172, 2.231276, 0, 0, 1, 1, 1,
0.5632883, 0.1463057, -0.383943, 1, 0, 0, 1, 1,
0.5651588, -1.042311, 4.844782, 1, 0, 0, 1, 1,
0.5653983, 0.1150277, -0.5348032, 1, 0, 0, 1, 1,
0.5669354, -1.199801, 0.6312873, 1, 0, 0, 1, 1,
0.5688108, -0.3384447, 3.298323, 1, 0, 0, 1, 1,
0.5705786, -0.3875553, 0.1392141, 0, 0, 0, 1, 1,
0.5712444, -1.097369, 3.263026, 0, 0, 0, 1, 1,
0.5736343, -0.5542971, 1.015531, 0, 0, 0, 1, 1,
0.5770848, 1.511203, 1.535438, 0, 0, 0, 1, 1,
0.5779199, -0.9062369, 4.311995, 0, 0, 0, 1, 1,
0.5804024, -0.3223322, 3.848384, 0, 0, 0, 1, 1,
0.5826648, 1.042969, 2.108704, 0, 0, 0, 1, 1,
0.5870425, 0.4288602, 0.5470139, 1, 1, 1, 1, 1,
0.5875769, -0.1800571, 0.8058372, 1, 1, 1, 1, 1,
0.5902979, -0.2573522, 2.706042, 1, 1, 1, 1, 1,
0.5933126, -0.5151147, 1.397457, 1, 1, 1, 1, 1,
0.5970291, 0.2439985, 3.264373, 1, 1, 1, 1, 1,
0.5987728, 1.421539, 0.1403055, 1, 1, 1, 1, 1,
0.6002834, -1.366972, 3.172092, 1, 1, 1, 1, 1,
0.6023542, -1.227125, 0.9068782, 1, 1, 1, 1, 1,
0.6031654, 0.1979685, 1.460113, 1, 1, 1, 1, 1,
0.6037399, -1.284793, 3.040282, 1, 1, 1, 1, 1,
0.6075018, -0.5291162, 2.668491, 1, 1, 1, 1, 1,
0.6099175, 0.3401447, 3.145375, 1, 1, 1, 1, 1,
0.610333, 2.517268, 0.8630102, 1, 1, 1, 1, 1,
0.6170893, -1.312688, 3.284407, 1, 1, 1, 1, 1,
0.6210545, -0.220564, 3.103787, 1, 1, 1, 1, 1,
0.6230816, 0.7374895, 0.501282, 0, 0, 1, 1, 1,
0.6240795, -0.4496606, 3.377925, 1, 0, 0, 1, 1,
0.6252014, -1.071224, 2.829929, 1, 0, 0, 1, 1,
0.6258858, 0.8862971, 0.8082471, 1, 0, 0, 1, 1,
0.6307564, -1.304026, 3.679524, 1, 0, 0, 1, 1,
0.6372275, -0.6168414, 2.128218, 1, 0, 0, 1, 1,
0.6393816, -0.1216883, 2.352856, 0, 0, 0, 1, 1,
0.6495339, -0.698127, 1.9423, 0, 0, 0, 1, 1,
0.6500679, -2.123297, 3.853775, 0, 0, 0, 1, 1,
0.6518756, 0.6023246, 1.506617, 0, 0, 0, 1, 1,
0.651911, 0.6907708, 2.172728, 0, 0, 0, 1, 1,
0.6584045, -0.3598145, 1.45049, 0, 0, 0, 1, 1,
0.6657988, -0.5273477, 2.008107, 0, 0, 0, 1, 1,
0.6681472, -1.049067, 2.464997, 1, 1, 1, 1, 1,
0.6704023, -0.1795878, 0.1124289, 1, 1, 1, 1, 1,
0.672527, -0.2898143, 0.3638538, 1, 1, 1, 1, 1,
0.6795049, -0.5496523, 2.010246, 1, 1, 1, 1, 1,
0.6866897, -0.6418202, 3.668609, 1, 1, 1, 1, 1,
0.6923883, -2.119733, 2.0824, 1, 1, 1, 1, 1,
0.6924025, -0.9837477, 2.825137, 1, 1, 1, 1, 1,
0.6931537, 0.9279935, -0.2909502, 1, 1, 1, 1, 1,
0.6944357, 1.996755, -0.9832169, 1, 1, 1, 1, 1,
0.6953831, 0.7768356, -0.9713629, 1, 1, 1, 1, 1,
0.6963894, 0.896138, 0.0677225, 1, 1, 1, 1, 1,
0.7090382, 1.436081, 0.8110023, 1, 1, 1, 1, 1,
0.7091436, 1.900393, 2.25807, 1, 1, 1, 1, 1,
0.7105061, 0.4774152, 1.205891, 1, 1, 1, 1, 1,
0.7157223, -0.4488242, 1.557787, 1, 1, 1, 1, 1,
0.7185808, -0.6511267, 1.88788, 0, 0, 1, 1, 1,
0.7197152, -0.02878032, 1.933613, 1, 0, 0, 1, 1,
0.7247868, -0.2310318, 2.730236, 1, 0, 0, 1, 1,
0.7372503, 1.889612, -0.6608021, 1, 0, 0, 1, 1,
0.7389807, 0.298195, -0.9483361, 1, 0, 0, 1, 1,
0.7525189, -1.536685, 2.324411, 1, 0, 0, 1, 1,
0.7541864, -0.3685542, 0.8831999, 0, 0, 0, 1, 1,
0.7606179, -1.367358, 2.595618, 0, 0, 0, 1, 1,
0.7609951, -0.04727913, -0.3901724, 0, 0, 0, 1, 1,
0.7624495, 0.5285369, 0.6769689, 0, 0, 0, 1, 1,
0.7676446, -1.6037, 2.471202, 0, 0, 0, 1, 1,
0.769102, -0.2186075, 2.08397, 0, 0, 0, 1, 1,
0.769732, -0.1531591, 3.278708, 0, 0, 0, 1, 1,
0.7731928, -0.2023408, 1.592513, 1, 1, 1, 1, 1,
0.7774497, 0.533187, 0.8197975, 1, 1, 1, 1, 1,
0.7776436, 0.2850395, 0.2981777, 1, 1, 1, 1, 1,
0.7835057, -1.039034, 2.770654, 1, 1, 1, 1, 1,
0.7837607, -1.356164, 3.139819, 1, 1, 1, 1, 1,
0.7910725, 1.235737, 1.64248, 1, 1, 1, 1, 1,
0.796504, 0.4797703, 1.233209, 1, 1, 1, 1, 1,
0.8008643, -0.5115436, 0.753087, 1, 1, 1, 1, 1,
0.8015918, -1.463827, 3.956432, 1, 1, 1, 1, 1,
0.8025069, 0.004505796, 1.890514, 1, 1, 1, 1, 1,
0.8026136, -0.9919583, 3.131504, 1, 1, 1, 1, 1,
0.8044909, 0.7675237, 0.3444946, 1, 1, 1, 1, 1,
0.8066791, -0.1202373, 0.388343, 1, 1, 1, 1, 1,
0.8074181, 0.3862073, 1.486029, 1, 1, 1, 1, 1,
0.811034, 0.5559449, 2.001091, 1, 1, 1, 1, 1,
0.8318928, 0.3202712, 0.2848743, 0, 0, 1, 1, 1,
0.8363479, 0.9267579, 2.134771, 1, 0, 0, 1, 1,
0.8412253, 0.8012779, 1.663293, 1, 0, 0, 1, 1,
0.8423233, 1.084482, 0.9158667, 1, 0, 0, 1, 1,
0.8488995, -0.5217795, 2.3265, 1, 0, 0, 1, 1,
0.8525012, -0.2527912, 1.757703, 1, 0, 0, 1, 1,
0.8551102, 1.323978, -0.4301758, 0, 0, 0, 1, 1,
0.8551203, -1.44254, 3.332423, 0, 0, 0, 1, 1,
0.8557058, 0.2421121, 1.96447, 0, 0, 0, 1, 1,
0.8718784, 0.6542702, 1.699651, 0, 0, 0, 1, 1,
0.8790188, 0.03258914, -1.193493, 0, 0, 0, 1, 1,
0.8800876, 0.6541562, 0.8160187, 0, 0, 0, 1, 1,
0.8808468, 0.6535253, 0.8437257, 0, 0, 0, 1, 1,
0.8813332, -1.670527, 2.586475, 1, 1, 1, 1, 1,
0.8820408, 1.944698, 3.234835, 1, 1, 1, 1, 1,
0.8867594, -1.374953, 3.051258, 1, 1, 1, 1, 1,
0.8871462, -0.1775288, 2.86098, 1, 1, 1, 1, 1,
0.891093, 0.3667015, 1.405339, 1, 1, 1, 1, 1,
0.8959727, -0.8629216, 3.37299, 1, 1, 1, 1, 1,
0.8994668, 0.4779552, -0.564684, 1, 1, 1, 1, 1,
0.9061167, -0.03503431, 1.040882, 1, 1, 1, 1, 1,
0.9094839, 1.296905, 1.868049, 1, 1, 1, 1, 1,
0.911489, 0.7781189, -0.1942482, 1, 1, 1, 1, 1,
0.9127932, -1.327558, 1.449636, 1, 1, 1, 1, 1,
0.9154213, 0.795131, 0.1031336, 1, 1, 1, 1, 1,
0.9194841, 0.6678048, -0.3813387, 1, 1, 1, 1, 1,
0.9251098, 1.882366, 1.733741, 1, 1, 1, 1, 1,
0.9298956, 0.8103893, 0.6564248, 1, 1, 1, 1, 1,
0.9342473, 0.03973339, 2.345279, 0, 0, 1, 1, 1,
0.934647, -1.769581, 1.460886, 1, 0, 0, 1, 1,
0.9411905, -1.048547, 4.023139, 1, 0, 0, 1, 1,
0.9548493, -0.9857624, 2.417328, 1, 0, 0, 1, 1,
0.9594812, -0.3152978, 0.6559916, 1, 0, 0, 1, 1,
0.9621809, -1.604655, 2.781318, 1, 0, 0, 1, 1,
0.9690403, 1.237164, 1.915729, 0, 0, 0, 1, 1,
0.9691801, 0.4775585, 2.15665, 0, 0, 0, 1, 1,
0.9779181, 0.5895754, 1.642969, 0, 0, 0, 1, 1,
0.9816644, -0.846585, 2.548428, 0, 0, 0, 1, 1,
0.9892096, -0.8751055, 3.202948, 0, 0, 0, 1, 1,
1.002336, -1.308066, 4.050231, 0, 0, 0, 1, 1,
1.004019, -1.293815, 4.177972, 0, 0, 0, 1, 1,
1.004693, -1.473963, 2.441685, 1, 1, 1, 1, 1,
1.005656, 0.3252828, 2.663744, 1, 1, 1, 1, 1,
1.006349, -1.764882, 2.628922, 1, 1, 1, 1, 1,
1.009786, 0.4802666, 0.962595, 1, 1, 1, 1, 1,
1.010199, 0.4268394, 1.218081, 1, 1, 1, 1, 1,
1.016292, 1.391254, 2.372472, 1, 1, 1, 1, 1,
1.016994, -0.7190752, 3.825644, 1, 1, 1, 1, 1,
1.019941, 1.904187, 0.3913931, 1, 1, 1, 1, 1,
1.029115, -0.03832868, 1.643277, 1, 1, 1, 1, 1,
1.032724, 0.1394638, 0.7914687, 1, 1, 1, 1, 1,
1.033269, -1.242787, 1.425042, 1, 1, 1, 1, 1,
1.034324, -0.4329692, 2.547046, 1, 1, 1, 1, 1,
1.037771, 2.847466, -0.2656746, 1, 1, 1, 1, 1,
1.045399, 0.610839, 0.4077397, 1, 1, 1, 1, 1,
1.047483, -1.986873, 2.368397, 1, 1, 1, 1, 1,
1.049479, 1.53592, -1.48601, 0, 0, 1, 1, 1,
1.050262, 0.5784206, 1.309795, 1, 0, 0, 1, 1,
1.055807, 0.6135807, 3.082667, 1, 0, 0, 1, 1,
1.059046, 1.561269, -0.1927424, 1, 0, 0, 1, 1,
1.059217, -0.5841408, -0.3308524, 1, 0, 0, 1, 1,
1.072527, -0.290827, 1.25465, 1, 0, 0, 1, 1,
1.074872, -0.967629, 2.492126, 0, 0, 0, 1, 1,
1.075861, -1.030369, 2.330489, 0, 0, 0, 1, 1,
1.080572, -0.4782667, 1.050517, 0, 0, 0, 1, 1,
1.082596, 0.1430601, 1.746655, 0, 0, 0, 1, 1,
1.092922, -0.0818425, 2.272463, 0, 0, 0, 1, 1,
1.093913, 1.041262, -0.4387038, 0, 0, 0, 1, 1,
1.096269, -1.494962, 4.834768, 0, 0, 0, 1, 1,
1.100159, -0.1974326, 3.093453, 1, 1, 1, 1, 1,
1.102188, 1.372669, 1.662328, 1, 1, 1, 1, 1,
1.102769, 1.287722, 1.082558, 1, 1, 1, 1, 1,
1.105449, -0.3126613, 2.630123, 1, 1, 1, 1, 1,
1.112201, -0.6660591, 1.344712, 1, 1, 1, 1, 1,
1.113651, -0.5946698, 2.443671, 1, 1, 1, 1, 1,
1.117889, 1.073348, 1.665714, 1, 1, 1, 1, 1,
1.122009, 0.1355326, 2.993848, 1, 1, 1, 1, 1,
1.122791, -0.6551979, 0.8698585, 1, 1, 1, 1, 1,
1.130689, -0.05953779, 1.577034, 1, 1, 1, 1, 1,
1.140618, -0.9852621, 3.000044, 1, 1, 1, 1, 1,
1.144696, 1.344552, 1.58722, 1, 1, 1, 1, 1,
1.153277, 0.1537999, 2.406896, 1, 1, 1, 1, 1,
1.158659, 0.2307289, 2.420897, 1, 1, 1, 1, 1,
1.163161, -0.06068354, 2.237016, 1, 1, 1, 1, 1,
1.1645, -0.2044188, -0.1860173, 0, 0, 1, 1, 1,
1.167123, 1.264824, 1.844241, 1, 0, 0, 1, 1,
1.167308, 0.1770655, 0.09470046, 1, 0, 0, 1, 1,
1.174516, 0.9958752, 1.355558, 1, 0, 0, 1, 1,
1.178685, -1.064737, 2.558866, 1, 0, 0, 1, 1,
1.182035, -0.1161085, 0.1875447, 1, 0, 0, 1, 1,
1.189217, 0.5932499, 1.345431, 0, 0, 0, 1, 1,
1.191346, 0.3514062, 1.451715, 0, 0, 0, 1, 1,
1.191565, 2.173147, 0.5161103, 0, 0, 0, 1, 1,
1.20389, -0.3785094, 1.245703, 0, 0, 0, 1, 1,
1.204326, -0.1775478, 3.243524, 0, 0, 0, 1, 1,
1.212632, -0.05491081, 2.41422, 0, 0, 0, 1, 1,
1.216619, -0.7353951, 2.109436, 0, 0, 0, 1, 1,
1.217435, 0.3359576, 0.909171, 1, 1, 1, 1, 1,
1.219019, -1.750116, 2.613272, 1, 1, 1, 1, 1,
1.219525, -0.6837698, 1.859176, 1, 1, 1, 1, 1,
1.231083, -0.4809008, 1.988816, 1, 1, 1, 1, 1,
1.237578, -0.05135191, 1.644526, 1, 1, 1, 1, 1,
1.237708, 0.7435373, 2.635312, 1, 1, 1, 1, 1,
1.24003, -1.065312, 1.533344, 1, 1, 1, 1, 1,
1.241332, -0.3393854, 1.801896, 1, 1, 1, 1, 1,
1.246128, -0.3672506, 1.772132, 1, 1, 1, 1, 1,
1.248524, -0.8375717, 2.009276, 1, 1, 1, 1, 1,
1.248657, -0.450743, 3.579718, 1, 1, 1, 1, 1,
1.250373, 0.5467116, 1.115298, 1, 1, 1, 1, 1,
1.25739, -0.5699499, 1.529712, 1, 1, 1, 1, 1,
1.257483, -0.2960157, 1.881359, 1, 1, 1, 1, 1,
1.264323, -1.150784, 2.606835, 1, 1, 1, 1, 1,
1.265951, 0.8881196, 2.783504, 0, 0, 1, 1, 1,
1.266461, 0.3941753, 1.717916, 1, 0, 0, 1, 1,
1.267387, 0.3140541, 1.404892, 1, 0, 0, 1, 1,
1.272865, 0.3867729, -0.1802708, 1, 0, 0, 1, 1,
1.279687, -2.124275, 3.123352, 1, 0, 0, 1, 1,
1.281135, 0.8755127, 2.885282, 1, 0, 0, 1, 1,
1.282896, -0.7787752, 2.530163, 0, 0, 0, 1, 1,
1.284726, -1.103789, 1.750126, 0, 0, 0, 1, 1,
1.294305, 0.4826739, -0.8296917, 0, 0, 0, 1, 1,
1.295681, 0.275684, 1.612497, 0, 0, 0, 1, 1,
1.296411, -1.875262, 2.092351, 0, 0, 0, 1, 1,
1.30211, -1.052005, 3.206972, 0, 0, 0, 1, 1,
1.307104, -0.4546814, 2.371753, 0, 0, 0, 1, 1,
1.307316, -1.749117, 4.163416, 1, 1, 1, 1, 1,
1.308446, 1.146294, 0.6236376, 1, 1, 1, 1, 1,
1.309771, -0.5097985, 2.326236, 1, 1, 1, 1, 1,
1.316404, -0.8470138, 0.9477049, 1, 1, 1, 1, 1,
1.321105, -0.4752024, 4.621159, 1, 1, 1, 1, 1,
1.336655, -1.109218, 2.795879, 1, 1, 1, 1, 1,
1.353098, -1.147684, 1.626623, 1, 1, 1, 1, 1,
1.364937, 1.454595, 0.03929061, 1, 1, 1, 1, 1,
1.368788, 0.4400028, 0.2046785, 1, 1, 1, 1, 1,
1.376071, 0.01775929, 2.874668, 1, 1, 1, 1, 1,
1.388727, 0.01536803, 1.75759, 1, 1, 1, 1, 1,
1.390134, 0.2474358, 0.00398854, 1, 1, 1, 1, 1,
1.403092, -0.2660024, 1.826697, 1, 1, 1, 1, 1,
1.411275, -0.6708387, 1.35744, 1, 1, 1, 1, 1,
1.417033, 1.45146, -1.542706, 1, 1, 1, 1, 1,
1.419477, -1.299632, 0.5555944, 0, 0, 1, 1, 1,
1.419855, 0.0593527, 1.358503, 1, 0, 0, 1, 1,
1.42165, 1.312443, 0.178297, 1, 0, 0, 1, 1,
1.427826, -0.3050413, 2.307995, 1, 0, 0, 1, 1,
1.429326, 1.632445, -0.02400103, 1, 0, 0, 1, 1,
1.443759, 0.4047948, 1.324699, 1, 0, 0, 1, 1,
1.448496, 0.9135348, 0.7947786, 0, 0, 0, 1, 1,
1.464373, 1.304643, 1.009899, 0, 0, 0, 1, 1,
1.470773, 0.1964522, 2.197959, 0, 0, 0, 1, 1,
1.473722, -0.2132961, 1.400704, 0, 0, 0, 1, 1,
1.477971, 0.04602569, 1.01797, 0, 0, 0, 1, 1,
1.480087, 0.0251991, 1.935561, 0, 0, 0, 1, 1,
1.485701, 1.412978, 0.7316918, 0, 0, 0, 1, 1,
1.488223, 1.719313, -0.8342394, 1, 1, 1, 1, 1,
1.497124, -1.956066, 2.905775, 1, 1, 1, 1, 1,
1.498201, 0.7704288, 2.436392, 1, 1, 1, 1, 1,
1.520102, -1.502585, 2.888937, 1, 1, 1, 1, 1,
1.522496, -0.1395499, 3.380759, 1, 1, 1, 1, 1,
1.529676, 1.567543, 1.056964, 1, 1, 1, 1, 1,
1.535936, 0.8534584, 0.5803979, 1, 1, 1, 1, 1,
1.543517, 0.7738869, 1.981529, 1, 1, 1, 1, 1,
1.551905, -0.148905, 2.178489, 1, 1, 1, 1, 1,
1.577819, 1.100423, 1.043829, 1, 1, 1, 1, 1,
1.579344, 1.017542, 0.774404, 1, 1, 1, 1, 1,
1.596626, 1.614081, -0.8032895, 1, 1, 1, 1, 1,
1.597111, -0.618706, 2.784327, 1, 1, 1, 1, 1,
1.614166, -0.153367, -0.5551214, 1, 1, 1, 1, 1,
1.634488, -0.903785, 0.9550456, 1, 1, 1, 1, 1,
1.645475, 1.209064, 0.6431156, 0, 0, 1, 1, 1,
1.662999, 0.2015221, 2.226173, 1, 0, 0, 1, 1,
1.664708, 1.860952, 1.270582, 1, 0, 0, 1, 1,
1.665854, -0.6076076, 0.6150998, 1, 0, 0, 1, 1,
1.673568, 1.478327, 1.2321, 1, 0, 0, 1, 1,
1.702927, -1.194209, 0.9554039, 1, 0, 0, 1, 1,
1.704414, -1.541127, 2.842951, 0, 0, 0, 1, 1,
1.704997, -1.109177, 2.45616, 0, 0, 0, 1, 1,
1.73063, 0.6436062, 0.1087515, 0, 0, 0, 1, 1,
1.732308, 1.100187, -0.7895017, 0, 0, 0, 1, 1,
1.737569, -1.564976, 3.008003, 0, 0, 0, 1, 1,
1.762047, 0.824627, 1.159438, 0, 0, 0, 1, 1,
1.768426, -0.4054869, 2.254589, 0, 0, 0, 1, 1,
1.781421, 1.091039, 3.370379, 1, 1, 1, 1, 1,
1.812836, 0.3377205, 0.7886853, 1, 1, 1, 1, 1,
1.816149, -1.488085, 0.3331666, 1, 1, 1, 1, 1,
1.82002, -1.543579, 1.318151, 1, 1, 1, 1, 1,
1.838911, 1.428508, -0.2023768, 1, 1, 1, 1, 1,
1.87725, -1.207471, 1.557953, 1, 1, 1, 1, 1,
1.886023, 1.448912, 0.3314156, 1, 1, 1, 1, 1,
1.924266, -0.7126032, 3.370971, 1, 1, 1, 1, 1,
1.924504, -1.149354, 1.874656, 1, 1, 1, 1, 1,
1.938352, 0.5869454, 1.487419, 1, 1, 1, 1, 1,
1.956582, 2.163323, 0.949112, 1, 1, 1, 1, 1,
2.002403, 0.7351375, 3.9725, 1, 1, 1, 1, 1,
2.003949, -1.6003, 2.811358, 1, 1, 1, 1, 1,
2.022895, 1.174578, 2.909393, 1, 1, 1, 1, 1,
2.027439, -1.417818, 1.010699, 1, 1, 1, 1, 1,
2.039289, -0.5159252, 1.441945, 0, 0, 1, 1, 1,
2.060016, -1.647947, 1.568163, 1, 0, 0, 1, 1,
2.060978, 0.01018826, 2.105744, 1, 0, 0, 1, 1,
2.137411, -0.5795053, 2.872434, 1, 0, 0, 1, 1,
2.142416, 1.034419, 1.620908, 1, 0, 0, 1, 1,
2.14946, 0.4234144, 2.626663, 1, 0, 0, 1, 1,
2.164705, 0.9443815, 2.422251, 0, 0, 0, 1, 1,
2.214909, -0.09806392, 0.870083, 0, 0, 0, 1, 1,
2.233286, 1.348772, 2.264188, 0, 0, 0, 1, 1,
2.240106, 1.259151, 0.03964195, 0, 0, 0, 1, 1,
2.245289, 0.551012, 1.468949, 0, 0, 0, 1, 1,
2.307616, 0.4690698, 0.5435302, 0, 0, 0, 1, 1,
2.360968, 1.23677, 1.576885, 0, 0, 0, 1, 1,
2.393016, 0.8755139, -0.6240414, 1, 1, 1, 1, 1,
2.41069, 0.001726018, 1.484501, 1, 1, 1, 1, 1,
2.573994, -0.3301316, 0.5389932, 1, 1, 1, 1, 1,
2.697558, 1.214519, 0.7293205, 1, 1, 1, 1, 1,
2.770882, 0.5388889, 1.726069, 1, 1, 1, 1, 1,
2.793592, -1.683082, 2.343576, 1, 1, 1, 1, 1,
2.875488, -0.1514385, 3.831295, 1, 1, 1, 1, 1
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
var radius = 9.365913;
var distance = 32.89737;
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
mvMatrix.translate( 0.4202515, 0.06840086, 0.0503366 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89737);
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
