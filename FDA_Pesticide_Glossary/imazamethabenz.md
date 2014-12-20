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
-3.018438, -1.036793, -3.106078, 1, 0, 0, 1,
-2.900514, -0.2518902, -2.973107, 1, 0.007843138, 0, 1,
-2.586143, -0.6654007, -1.717478, 1, 0.01176471, 0, 1,
-2.517623, -0.1900016, -1.546609, 1, 0.01960784, 0, 1,
-2.445115, 1.617525, -3.243308, 1, 0.02352941, 0, 1,
-2.390631, 1.284657, -2.118064, 1, 0.03137255, 0, 1,
-2.320025, 1.622046, -0.1386664, 1, 0.03529412, 0, 1,
-2.306825, 1.362993, -1.035554, 1, 0.04313726, 0, 1,
-2.285627, 1.301703, -1.792449, 1, 0.04705882, 0, 1,
-2.26249, -0.1205266, -2.076328, 1, 0.05490196, 0, 1,
-2.244622, 0.1800224, -1.055529, 1, 0.05882353, 0, 1,
-2.180937, -0.006338097, -2.683339, 1, 0.06666667, 0, 1,
-2.153109, -1.229159, -2.11334, 1, 0.07058824, 0, 1,
-2.112591, 0.966473, -0.8330777, 1, 0.07843138, 0, 1,
-2.071514, 1.550417, -1.33075, 1, 0.08235294, 0, 1,
-2.063624, 1.117274, 1.420924, 1, 0.09019608, 0, 1,
-2.03966, -0.6210946, -2.84468, 1, 0.09411765, 0, 1,
-2.027773, -1.619146, -1.282788, 1, 0.1019608, 0, 1,
-1.98314, -0.09168584, -1.925522, 1, 0.1098039, 0, 1,
-1.954246, 1.224343, -2.316234, 1, 0.1137255, 0, 1,
-1.935597, -0.7944332, -2.40548, 1, 0.1215686, 0, 1,
-1.917565, 0.2840768, 0.1768194, 1, 0.1254902, 0, 1,
-1.894701, 0.5319923, -0.2467521, 1, 0.1333333, 0, 1,
-1.869205, 0.9687108, -1.572464, 1, 0.1372549, 0, 1,
-1.836964, 1.330603, 0.00815487, 1, 0.145098, 0, 1,
-1.803531, -1.845048, -2.135095, 1, 0.1490196, 0, 1,
-1.800935, -0.2079786, -1.974508, 1, 0.1568628, 0, 1,
-1.777948, 0.1052686, -2.038386, 1, 0.1607843, 0, 1,
-1.764198, -0.2588399, -0.927735, 1, 0.1686275, 0, 1,
-1.73697, -0.6268327, -2.082731, 1, 0.172549, 0, 1,
-1.732846, 0.809022, -0.07874358, 1, 0.1803922, 0, 1,
-1.727052, -1.642916, -2.149717, 1, 0.1843137, 0, 1,
-1.709799, -0.9401772, -1.391027, 1, 0.1921569, 0, 1,
-1.709567, 0.1858021, -2.301669, 1, 0.1960784, 0, 1,
-1.687037, -1.245979, -0.5366186, 1, 0.2039216, 0, 1,
-1.685687, -0.6568627, -3.720741, 1, 0.2117647, 0, 1,
-1.669861, -0.7706681, -0.9303612, 1, 0.2156863, 0, 1,
-1.669419, 0.7597457, -1.744648, 1, 0.2235294, 0, 1,
-1.657242, -0.01031793, -3.204402, 1, 0.227451, 0, 1,
-1.642358, -0.661693, -1.176635, 1, 0.2352941, 0, 1,
-1.630899, 1.127533, -1.124745, 1, 0.2392157, 0, 1,
-1.623218, -0.8459411, -2.598963, 1, 0.2470588, 0, 1,
-1.608844, 0.8838207, -0.4593926, 1, 0.2509804, 0, 1,
-1.604337, 1.420215, -1.743376, 1, 0.2588235, 0, 1,
-1.603893, -1.513427, -2.449663, 1, 0.2627451, 0, 1,
-1.597952, -0.62528, -1.246126, 1, 0.2705882, 0, 1,
-1.597445, 0.02250396, -1.016557, 1, 0.2745098, 0, 1,
-1.592323, 0.01765362, -3.025016, 1, 0.282353, 0, 1,
-1.536232, -0.2917469, -0.6802109, 1, 0.2862745, 0, 1,
-1.530541, 0.1815715, -2.194527, 1, 0.2941177, 0, 1,
-1.510175, 1.287513, -0.4058308, 1, 0.3019608, 0, 1,
-1.498307, -0.5786201, -1.277933, 1, 0.3058824, 0, 1,
-1.489481, 0.6169429, -1.281072, 1, 0.3137255, 0, 1,
-1.475671, -0.2362562, -3.423361, 1, 0.3176471, 0, 1,
-1.47353, 0.9058031, -2.830377, 1, 0.3254902, 0, 1,
-1.46914, -0.03100451, 0.06130477, 1, 0.3294118, 0, 1,
-1.468218, -0.3608024, -1.595197, 1, 0.3372549, 0, 1,
-1.461889, -1.316225, -2.980504, 1, 0.3411765, 0, 1,
-1.448818, 0.1072769, -1.143427, 1, 0.3490196, 0, 1,
-1.444109, -1.120804, -0.9843004, 1, 0.3529412, 0, 1,
-1.442412, 0.567982, -0.8611821, 1, 0.3607843, 0, 1,
-1.440519, 0.2031681, -1.067516, 1, 0.3647059, 0, 1,
-1.435062, 0.8239571, -1.003733, 1, 0.372549, 0, 1,
-1.434582, -0.1023619, -0.7201591, 1, 0.3764706, 0, 1,
-1.428218, 0.8403306, -0.7312042, 1, 0.3843137, 0, 1,
-1.427927, -1.549141, -3.339413, 1, 0.3882353, 0, 1,
-1.425876, -0.3557007, -2.887763, 1, 0.3960784, 0, 1,
-1.422848, 1.544704, -1.258012, 1, 0.4039216, 0, 1,
-1.419345, -1.094563, -0.8403028, 1, 0.4078431, 0, 1,
-1.41859, -1.334759, -1.050799, 1, 0.4156863, 0, 1,
-1.41162, -0.1512105, -2.332557, 1, 0.4196078, 0, 1,
-1.407516, 0.03908903, -2.709006, 1, 0.427451, 0, 1,
-1.406828, 0.7464607, -0.6524751, 1, 0.4313726, 0, 1,
-1.402829, -0.9186925, -2.29721, 1, 0.4392157, 0, 1,
-1.402065, 0.9741783, 0.7391473, 1, 0.4431373, 0, 1,
-1.393252, -1.025973, -0.5189818, 1, 0.4509804, 0, 1,
-1.383674, -0.5331947, -1.076438, 1, 0.454902, 0, 1,
-1.377865, 1.658079, -1.337427, 1, 0.4627451, 0, 1,
-1.36306, 0.5541876, -1.948359, 1, 0.4666667, 0, 1,
-1.354832, 0.9155511, -0.9989375, 1, 0.4745098, 0, 1,
-1.350546, -0.6675335, -2.253954, 1, 0.4784314, 0, 1,
-1.336138, 0.7726792, -1.096803, 1, 0.4862745, 0, 1,
-1.325477, 0.1215154, -1.892192, 1, 0.4901961, 0, 1,
-1.323143, -0.9851831, -2.991175, 1, 0.4980392, 0, 1,
-1.319185, 0.4254576, -1.602046, 1, 0.5058824, 0, 1,
-1.313517, -1.358384, -1.946301, 1, 0.509804, 0, 1,
-1.310995, 0.5639771, -1.590577, 1, 0.5176471, 0, 1,
-1.305928, 0.1214401, -0.6932365, 1, 0.5215687, 0, 1,
-1.304949, -0.7997668, -2.718893, 1, 0.5294118, 0, 1,
-1.299481, -0.4045038, -0.7327822, 1, 0.5333334, 0, 1,
-1.290199, 1.847613, 1.548199, 1, 0.5411765, 0, 1,
-1.289333, -0.3245278, -2.625651, 1, 0.5450981, 0, 1,
-1.289214, 1.981548, -0.617588, 1, 0.5529412, 0, 1,
-1.281201, -1.009308, -1.738853, 1, 0.5568628, 0, 1,
-1.277461, 1.155496, -1.50669, 1, 0.5647059, 0, 1,
-1.262651, 0.2690237, -1.489099, 1, 0.5686275, 0, 1,
-1.228336, -0.6441885, -4.040627, 1, 0.5764706, 0, 1,
-1.221386, 0.7676339, -1.455667, 1, 0.5803922, 0, 1,
-1.22059, 0.6762189, -0.8991956, 1, 0.5882353, 0, 1,
-1.218763, -1.306687, -4.936306, 1, 0.5921569, 0, 1,
-1.21541, -0.09325471, -0.865528, 1, 0.6, 0, 1,
-1.215234, 0.1699308, 0.4096542, 1, 0.6078432, 0, 1,
-1.215118, -0.5953659, -2.428763, 1, 0.6117647, 0, 1,
-1.214841, 0.3679265, 0.690924, 1, 0.6196079, 0, 1,
-1.210109, -1.439023, -4.494444, 1, 0.6235294, 0, 1,
-1.202311, 0.3335376, 0.8477736, 1, 0.6313726, 0, 1,
-1.199643, -0.5253621, -0.9376324, 1, 0.6352941, 0, 1,
-1.196168, 0.5674208, -1.838947, 1, 0.6431373, 0, 1,
-1.17319, -0.4452843, -2.765383, 1, 0.6470588, 0, 1,
-1.172024, -1.043608, 0.3295874, 1, 0.654902, 0, 1,
-1.164283, 0.2174706, -0.8190283, 1, 0.6588235, 0, 1,
-1.155453, -2.286315, -1.414697, 1, 0.6666667, 0, 1,
-1.141896, 1.666011, -0.9347472, 1, 0.6705883, 0, 1,
-1.140431, -1.250317, -2.598025, 1, 0.6784314, 0, 1,
-1.134641, -0.5267091, -0.5975024, 1, 0.682353, 0, 1,
-1.13414, 0.4518538, -1.68733, 1, 0.6901961, 0, 1,
-1.134057, -0.7734514, 0.1377269, 1, 0.6941177, 0, 1,
-1.133199, 1.2849, 0.1788048, 1, 0.7019608, 0, 1,
-1.132869, 0.9323656, -0.6603963, 1, 0.7098039, 0, 1,
-1.132038, 1.715699, -0.9547871, 1, 0.7137255, 0, 1,
-1.129318, -0.1313494, -1.255466, 1, 0.7215686, 0, 1,
-1.129099, 0.696237, -0.980876, 1, 0.7254902, 0, 1,
-1.124064, 1.468111, -0.03644648, 1, 0.7333333, 0, 1,
-1.121651, 1.006114, -1.742761, 1, 0.7372549, 0, 1,
-1.119714, -0.6291094, -2.81596, 1, 0.7450981, 0, 1,
-1.108725, -2.01558, -2.896197, 1, 0.7490196, 0, 1,
-1.106438, 0.4508163, -2.147293, 1, 0.7568628, 0, 1,
-1.099738, -1.15669, -2.217178, 1, 0.7607843, 0, 1,
-1.095173, -1.671182, -2.348638, 1, 0.7686275, 0, 1,
-1.094945, -1.501876, -1.547074, 1, 0.772549, 0, 1,
-1.082532, 0.3469656, -0.8582977, 1, 0.7803922, 0, 1,
-1.080966, 0.3421482, -1.715488, 1, 0.7843137, 0, 1,
-1.080954, 0.3378934, -1.213801, 1, 0.7921569, 0, 1,
-1.080428, -0.6347418, -3.961915, 1, 0.7960784, 0, 1,
-1.078773, 0.6050823, -0.06587574, 1, 0.8039216, 0, 1,
-1.072854, -0.4941578, 1.068982, 1, 0.8117647, 0, 1,
-1.067057, -1.053743, -2.092616, 1, 0.8156863, 0, 1,
-1.066368, -1.875822, -2.552862, 1, 0.8235294, 0, 1,
-1.062414, 0.4601824, -1.545943, 1, 0.827451, 0, 1,
-1.049933, 0.462572, 0.4017871, 1, 0.8352941, 0, 1,
-1.047154, -0.2257927, -2.521125, 1, 0.8392157, 0, 1,
-1.043197, -0.1397624, -2.581976, 1, 0.8470588, 0, 1,
-1.031181, -0.01803191, -1.423728, 1, 0.8509804, 0, 1,
-1.027712, -1.490842, -3.120019, 1, 0.8588235, 0, 1,
-1.019686, -0.2716426, -1.854017, 1, 0.8627451, 0, 1,
-1.009838, 0.653168, -2.555487, 1, 0.8705882, 0, 1,
-0.9989151, -1.179204, -2.10996, 1, 0.8745098, 0, 1,
-0.9963638, -0.7122177, -3.187011, 1, 0.8823529, 0, 1,
-0.9957669, -0.2258351, -1.096695, 1, 0.8862745, 0, 1,
-0.9941192, -0.2694491, -2.096426, 1, 0.8941177, 0, 1,
-0.9873478, -0.3277901, -2.329188, 1, 0.8980392, 0, 1,
-0.9839749, -0.5019495, -2.114733, 1, 0.9058824, 0, 1,
-0.9803542, 0.1111326, 0.1417969, 1, 0.9137255, 0, 1,
-0.9782812, 0.2221814, -1.319653, 1, 0.9176471, 0, 1,
-0.9720688, 1.140867, 0.926531, 1, 0.9254902, 0, 1,
-0.9711438, 2.061497, -2.020945, 1, 0.9294118, 0, 1,
-0.9624872, 1.023537, -1.177046, 1, 0.9372549, 0, 1,
-0.9612611, -0.334803, -1.299198, 1, 0.9411765, 0, 1,
-0.958737, 0.1993302, -0.3049158, 1, 0.9490196, 0, 1,
-0.9457623, -2.009346, -3.842126, 1, 0.9529412, 0, 1,
-0.9418167, 0.05426122, -1.258927, 1, 0.9607843, 0, 1,
-0.9377103, 0.5044018, -0.5525054, 1, 0.9647059, 0, 1,
-0.9377091, 0.3860798, -2.767768, 1, 0.972549, 0, 1,
-0.9330854, 1.977646, -1.186997, 1, 0.9764706, 0, 1,
-0.9325555, -1.973911, -2.230863, 1, 0.9843137, 0, 1,
-0.9294157, -1.110421, -0.7348251, 1, 0.9882353, 0, 1,
-0.9210664, -1.012471, -2.97699, 1, 0.9960784, 0, 1,
-0.9143255, 0.8205084, -0.5480746, 0.9960784, 1, 0, 1,
-0.9138075, -0.818339, -1.722438, 0.9921569, 1, 0, 1,
-0.9110252, -0.538532, -0.6145209, 0.9843137, 1, 0, 1,
-0.9020921, -0.09630266, -2.72578, 0.9803922, 1, 0, 1,
-0.896313, 0.4964933, -1.264031, 0.972549, 1, 0, 1,
-0.8954007, 1.28898, 0.5761675, 0.9686275, 1, 0, 1,
-0.8937947, -0.1954199, -1.861228, 0.9607843, 1, 0, 1,
-0.8894274, 2.260525, 0.1712927, 0.9568627, 1, 0, 1,
-0.8827111, -0.4297819, -1.168478, 0.9490196, 1, 0, 1,
-0.8813224, -1.080448, -2.058983, 0.945098, 1, 0, 1,
-0.8747514, -2.184115, -4.589592, 0.9372549, 1, 0, 1,
-0.8732207, -0.7763107, -3.166892, 0.9333333, 1, 0, 1,
-0.8720672, -0.6709506, -3.11343, 0.9254902, 1, 0, 1,
-0.8712333, 0.4440262, 0.008293399, 0.9215686, 1, 0, 1,
-0.8646007, -1.323954, -3.116559, 0.9137255, 1, 0, 1,
-0.8601046, -1.163813, -2.045771, 0.9098039, 1, 0, 1,
-0.8573093, -1.979175, -3.326941, 0.9019608, 1, 0, 1,
-0.8548405, -0.4223596, -1.059931, 0.8941177, 1, 0, 1,
-0.8526647, 0.4809934, -1.302572, 0.8901961, 1, 0, 1,
-0.8501282, -0.5472743, -1.626858, 0.8823529, 1, 0, 1,
-0.8467424, -2.31905, -4.167541, 0.8784314, 1, 0, 1,
-0.845731, -0.8037456, -1.0362, 0.8705882, 1, 0, 1,
-0.8443959, -2.32154, -3.06858, 0.8666667, 1, 0, 1,
-0.8432782, 0.2723461, -1.702654, 0.8588235, 1, 0, 1,
-0.8422323, -1.305352, -2.88303, 0.854902, 1, 0, 1,
-0.8346429, 1.014073, -0.5130977, 0.8470588, 1, 0, 1,
-0.8121746, -0.6685966, -4.574147, 0.8431373, 1, 0, 1,
-0.8091613, 0.9400512, -0.3569582, 0.8352941, 1, 0, 1,
-0.8088657, 0.3258349, 0.2036217, 0.8313726, 1, 0, 1,
-0.806242, 0.5164195, -0.6630538, 0.8235294, 1, 0, 1,
-0.7912018, 0.2447777, -0.6998194, 0.8196079, 1, 0, 1,
-0.7899969, 1.206628, -0.3399613, 0.8117647, 1, 0, 1,
-0.7867613, 0.1805186, -0.9997712, 0.8078431, 1, 0, 1,
-0.7824574, -2.087594, -1.332981, 0.8, 1, 0, 1,
-0.7681636, -0.4450701, -0.6647658, 0.7921569, 1, 0, 1,
-0.768118, 0.2579945, -0.7592943, 0.7882353, 1, 0, 1,
-0.7661636, -0.02158691, -2.872858, 0.7803922, 1, 0, 1,
-0.7614989, 1.538474, 1.833657, 0.7764706, 1, 0, 1,
-0.7610034, -0.6294523, -2.413226, 0.7686275, 1, 0, 1,
-0.7602279, 0.5416719, -2.24542, 0.7647059, 1, 0, 1,
-0.7598823, 0.8832522, -2.454655, 0.7568628, 1, 0, 1,
-0.7578354, 0.4596495, 0.02642642, 0.7529412, 1, 0, 1,
-0.7571639, -0.4517776, -2.537747, 0.7450981, 1, 0, 1,
-0.7552147, 0.4016906, -1.655623, 0.7411765, 1, 0, 1,
-0.7513327, -1.508132, -2.164935, 0.7333333, 1, 0, 1,
-0.7412046, 0.4602177, 0.2336055, 0.7294118, 1, 0, 1,
-0.7396191, 1.40216, -0.520331, 0.7215686, 1, 0, 1,
-0.7391006, -1.258531, -3.734358, 0.7176471, 1, 0, 1,
-0.7376238, -1.21797, -3.197406, 0.7098039, 1, 0, 1,
-0.7271623, -0.2445742, -1.112088, 0.7058824, 1, 0, 1,
-0.7233661, 0.3929925, -1.725399, 0.6980392, 1, 0, 1,
-0.7202654, -1.145607, -1.141568, 0.6901961, 1, 0, 1,
-0.7186267, 0.6824427, -0.9449674, 0.6862745, 1, 0, 1,
-0.7104343, 0.1675972, -0.7888497, 0.6784314, 1, 0, 1,
-0.7091134, 0.2276512, -1.928983, 0.6745098, 1, 0, 1,
-0.7022439, -0.5404544, -2.14928, 0.6666667, 1, 0, 1,
-0.7021624, 1.149767, 0.7490009, 0.6627451, 1, 0, 1,
-0.6958005, 0.4808366, -1.034206, 0.654902, 1, 0, 1,
-0.6951934, -0.9638291, -2.154333, 0.6509804, 1, 0, 1,
-0.6951915, 0.3370977, -1.717864, 0.6431373, 1, 0, 1,
-0.6900414, 1.7023, -1.30757, 0.6392157, 1, 0, 1,
-0.6867084, -0.2524359, -0.3041562, 0.6313726, 1, 0, 1,
-0.6818671, -0.8261313, -2.207382, 0.627451, 1, 0, 1,
-0.6796259, -0.2347585, -1.489157, 0.6196079, 1, 0, 1,
-0.6728951, 0.1268379, -0.871394, 0.6156863, 1, 0, 1,
-0.6696739, -1.559727, 0.1799335, 0.6078432, 1, 0, 1,
-0.6636608, 0.8876315, -0.9726853, 0.6039216, 1, 0, 1,
-0.6615117, -0.04762761, -3.598285, 0.5960785, 1, 0, 1,
-0.65964, 1.113879, -1.005664, 0.5882353, 1, 0, 1,
-0.6467997, 2.076898, -0.4704409, 0.5843138, 1, 0, 1,
-0.6443836, 3.383967, 0.3019782, 0.5764706, 1, 0, 1,
-0.6434419, 1.43079, 0.6407918, 0.572549, 1, 0, 1,
-0.6434032, -1.121781, -1.673514, 0.5647059, 1, 0, 1,
-0.6337484, 0.1445172, -2.992785, 0.5607843, 1, 0, 1,
-0.6260892, 0.6511109, -1.214779, 0.5529412, 1, 0, 1,
-0.6255831, 0.8867344, -0.9634635, 0.5490196, 1, 0, 1,
-0.6249615, -2.211556, -2.971666, 0.5411765, 1, 0, 1,
-0.6240078, 0.2556163, -1.050532, 0.5372549, 1, 0, 1,
-0.6235078, -0.4892759, -1.797685, 0.5294118, 1, 0, 1,
-0.6201968, -0.1176277, -0.1138571, 0.5254902, 1, 0, 1,
-0.6177704, 0.7579117, -1.862317, 0.5176471, 1, 0, 1,
-0.6118312, 1.211498, -0.6198779, 0.5137255, 1, 0, 1,
-0.6098163, 1.462519, -0.4358131, 0.5058824, 1, 0, 1,
-0.6097092, 0.7099891, -0.1975087, 0.5019608, 1, 0, 1,
-0.6080562, -1.486109, -4.523183, 0.4941176, 1, 0, 1,
-0.6029917, -0.08729708, -2.273644, 0.4862745, 1, 0, 1,
-0.5949475, 0.04627192, -1.385635, 0.4823529, 1, 0, 1,
-0.5945249, -1.086675, -3.904374, 0.4745098, 1, 0, 1,
-0.5876802, 1.842861, -0.7537274, 0.4705882, 1, 0, 1,
-0.5874466, 0.2005745, -0.588525, 0.4627451, 1, 0, 1,
-0.5849448, 0.3234441, 0.2359634, 0.4588235, 1, 0, 1,
-0.5804924, -0.8772169, -2.759947, 0.4509804, 1, 0, 1,
-0.575938, 0.3243442, -0.947555, 0.4470588, 1, 0, 1,
-0.5753026, -1.074723, -1.681052, 0.4392157, 1, 0, 1,
-0.5700222, 1.450039, -0.1057608, 0.4352941, 1, 0, 1,
-0.5671929, -0.1142842, -2.416332, 0.427451, 1, 0, 1,
-0.5655182, 1.876473, -1.567012, 0.4235294, 1, 0, 1,
-0.5637792, -1.063408, -1.261026, 0.4156863, 1, 0, 1,
-0.5583044, 1.531734, -0.8220086, 0.4117647, 1, 0, 1,
-0.5543146, 0.4740713, -0.3431983, 0.4039216, 1, 0, 1,
-0.5503115, 0.1502233, -2.71425, 0.3960784, 1, 0, 1,
-0.5497783, -0.1944748, -0.3205415, 0.3921569, 1, 0, 1,
-0.5440428, -0.09530277, -1.205201, 0.3843137, 1, 0, 1,
-0.5415938, 0.2146324, -0.4072833, 0.3803922, 1, 0, 1,
-0.5364817, 0.1942456, -2.060801, 0.372549, 1, 0, 1,
-0.5289601, -0.4548111, -1.695123, 0.3686275, 1, 0, 1,
-0.5260304, 1.082455, -0.582275, 0.3607843, 1, 0, 1,
-0.5249963, -0.8471765, -3.646862, 0.3568628, 1, 0, 1,
-0.5189313, 0.5936701, -0.2181702, 0.3490196, 1, 0, 1,
-0.5091029, 1.47264, -0.6527995, 0.345098, 1, 0, 1,
-0.5085127, -0.2405455, -0.03199667, 0.3372549, 1, 0, 1,
-0.5048922, -1.027377, -2.217653, 0.3333333, 1, 0, 1,
-0.5039873, 1.222219, 1.964675, 0.3254902, 1, 0, 1,
-0.5003042, -1.076398, -2.524628, 0.3215686, 1, 0, 1,
-0.4997546, -0.7198113, -1.098867, 0.3137255, 1, 0, 1,
-0.4979302, -0.1372914, -3.199733, 0.3098039, 1, 0, 1,
-0.4962293, -0.5220279, -2.270162, 0.3019608, 1, 0, 1,
-0.4936216, -0.1977719, -2.820306, 0.2941177, 1, 0, 1,
-0.476103, -0.9491868, -2.832954, 0.2901961, 1, 0, 1,
-0.474558, -0.2431636, -4.781413, 0.282353, 1, 0, 1,
-0.4685196, -0.2469702, -1.11562, 0.2784314, 1, 0, 1,
-0.4670088, -1.099622, -2.944375, 0.2705882, 1, 0, 1,
-0.4659933, -2.410431, -4.26511, 0.2666667, 1, 0, 1,
-0.456875, -0.06966118, -1.219546, 0.2588235, 1, 0, 1,
-0.4469779, 0.3511242, 1.17321, 0.254902, 1, 0, 1,
-0.4459204, -0.3308282, -3.044975, 0.2470588, 1, 0, 1,
-0.4454904, -0.5235228, -1.823541, 0.2431373, 1, 0, 1,
-0.4437846, 1.00105, -0.5111366, 0.2352941, 1, 0, 1,
-0.4423788, -0.7937949, -2.931392, 0.2313726, 1, 0, 1,
-0.440914, -0.1644684, -0.5114703, 0.2235294, 1, 0, 1,
-0.4372468, -0.7076665, -2.145442, 0.2196078, 1, 0, 1,
-0.4354427, 0.05444596, -2.103033, 0.2117647, 1, 0, 1,
-0.4331231, -0.5277317, -0.4461699, 0.2078431, 1, 0, 1,
-0.4288076, -0.4028232, -2.881869, 0.2, 1, 0, 1,
-0.4275398, -0.1938913, -2.356467, 0.1921569, 1, 0, 1,
-0.4270258, -1.054734, -1.828566, 0.1882353, 1, 0, 1,
-0.4256305, 0.807656, 0.49444, 0.1803922, 1, 0, 1,
-0.4253548, -1.06513, -3.655911, 0.1764706, 1, 0, 1,
-0.4233853, -0.3363269, -2.600425, 0.1686275, 1, 0, 1,
-0.4208514, -1.246091, -4.090691, 0.1647059, 1, 0, 1,
-0.4194549, -1.187065, -4.063631, 0.1568628, 1, 0, 1,
-0.4151292, 0.1268114, -0.6611996, 0.1529412, 1, 0, 1,
-0.4138581, -0.01996315, 0.7361721, 0.145098, 1, 0, 1,
-0.4128507, -0.07448278, -1.981565, 0.1411765, 1, 0, 1,
-0.4116035, 0.2955498, -2.005265, 0.1333333, 1, 0, 1,
-0.4090484, 0.2885292, -1.116127, 0.1294118, 1, 0, 1,
-0.4003025, -1.103818, -2.859792, 0.1215686, 1, 0, 1,
-0.3936105, -0.264267, -0.9285929, 0.1176471, 1, 0, 1,
-0.393313, -0.9923688, -2.72576, 0.1098039, 1, 0, 1,
-0.3865097, -2.982208, -4.047617, 0.1058824, 1, 0, 1,
-0.3859889, -0.6450164, -1.843364, 0.09803922, 1, 0, 1,
-0.3857888, -0.01949267, -0.9233613, 0.09019608, 1, 0, 1,
-0.3842296, 0.7022427, -1.066858, 0.08627451, 1, 0, 1,
-0.3814624, -0.513666, -1.525885, 0.07843138, 1, 0, 1,
-0.3810616, 0.3050083, 0.3202461, 0.07450981, 1, 0, 1,
-0.3771194, -1.093925, -2.497371, 0.06666667, 1, 0, 1,
-0.3746141, 1.460827, -0.4815097, 0.0627451, 1, 0, 1,
-0.3727989, -0.6493213, -2.485603, 0.05490196, 1, 0, 1,
-0.3718366, -0.08720452, -2.138638, 0.05098039, 1, 0, 1,
-0.3689085, -0.2284715, -2.840658, 0.04313726, 1, 0, 1,
-0.3670674, 1.657568, 1.014891, 0.03921569, 1, 0, 1,
-0.3615832, -1.483443, -2.66981, 0.03137255, 1, 0, 1,
-0.3591698, 0.5177181, -0.6234363, 0.02745098, 1, 0, 1,
-0.3540286, -0.03663916, -3.797821, 0.01960784, 1, 0, 1,
-0.3517687, 0.1838099, -1.470886, 0.01568628, 1, 0, 1,
-0.3475873, 0.5387574, -1.300822, 0.007843138, 1, 0, 1,
-0.3473394, 1.315156, -0.9136541, 0.003921569, 1, 0, 1,
-0.3453071, 0.5832691, -0.1726814, 0, 1, 0.003921569, 1,
-0.3372433, 0.1744583, -2.980505, 0, 1, 0.01176471, 1,
-0.3341933, -1.19074, -2.373257, 0, 1, 0.01568628, 1,
-0.3332494, 0.8823057, -0.1366812, 0, 1, 0.02352941, 1,
-0.3320919, 1.009387, -0.8722115, 0, 1, 0.02745098, 1,
-0.3284474, 1.418719, -0.8479064, 0, 1, 0.03529412, 1,
-0.3278669, 0.2545074, 0.5266551, 0, 1, 0.03921569, 1,
-0.327698, 0.5300269, -0.8877947, 0, 1, 0.04705882, 1,
-0.327214, -0.6600052, -3.537519, 0, 1, 0.05098039, 1,
-0.3247982, 0.01955844, -0.7483897, 0, 1, 0.05882353, 1,
-0.3226264, 0.7829666, -0.2642359, 0, 1, 0.0627451, 1,
-0.3178248, -0.5375878, -2.645909, 0, 1, 0.07058824, 1,
-0.3149861, -0.3792155, -2.204821, 0, 1, 0.07450981, 1,
-0.3139668, 1.467977, -0.08948627, 0, 1, 0.08235294, 1,
-0.310459, -0.4298399, -3.784585, 0, 1, 0.08627451, 1,
-0.3053641, -0.7001448, -2.778309, 0, 1, 0.09411765, 1,
-0.3052587, -0.4752721, -4.022775, 0, 1, 0.1019608, 1,
-0.3047903, 0.5065994, -1.823804, 0, 1, 0.1058824, 1,
-0.3032365, 0.3427308, 0.2057962, 0, 1, 0.1137255, 1,
-0.3017179, -0.5729146, -0.8723664, 0, 1, 0.1176471, 1,
-0.2979839, -2.079151, -0.5753066, 0, 1, 0.1254902, 1,
-0.2954006, 0.1117143, -2.276892, 0, 1, 0.1294118, 1,
-0.2949082, 0.1485985, -1.866132, 0, 1, 0.1372549, 1,
-0.2888303, -0.4056587, -2.448104, 0, 1, 0.1411765, 1,
-0.2856818, -0.04677746, -0.9247003, 0, 1, 0.1490196, 1,
-0.2850904, -0.199826, -1.356337, 0, 1, 0.1529412, 1,
-0.2840266, -0.1496429, -3.463946, 0, 1, 0.1607843, 1,
-0.2832586, -0.9719164, -3.532663, 0, 1, 0.1647059, 1,
-0.279679, 0.5498324, -0.03409477, 0, 1, 0.172549, 1,
-0.2770441, -1.162065, -4.822802, 0, 1, 0.1764706, 1,
-0.2736497, -0.902591, -2.285357, 0, 1, 0.1843137, 1,
-0.2728736, -0.1914808, -3.125714, 0, 1, 0.1882353, 1,
-0.2726056, 2.619977, -0.3616899, 0, 1, 0.1960784, 1,
-0.271778, 2.073205, 1.115692, 0, 1, 0.2039216, 1,
-0.2683318, -0.04359058, -2.537982, 0, 1, 0.2078431, 1,
-0.2647148, 0.833483, -0.138551, 0, 1, 0.2156863, 1,
-0.2608403, -0.2722943, -2.871396, 0, 1, 0.2196078, 1,
-0.2593705, -3.070855, -4.637334, 0, 1, 0.227451, 1,
-0.2574806, -0.6031951, -1.911628, 0, 1, 0.2313726, 1,
-0.2522605, -0.1333848, -2.3512, 0, 1, 0.2392157, 1,
-0.247032, 0.144445, 0.1733996, 0, 1, 0.2431373, 1,
-0.2445678, 0.007004585, -3.50086, 0, 1, 0.2509804, 1,
-0.2435715, -1.07374, -3.149219, 0, 1, 0.254902, 1,
-0.242282, -0.3143851, -3.591779, 0, 1, 0.2627451, 1,
-0.2417726, -1.781359, -2.969709, 0, 1, 0.2666667, 1,
-0.2375043, 1.985361, 0.5734469, 0, 1, 0.2745098, 1,
-0.2310881, 0.4694805, -0.7490551, 0, 1, 0.2784314, 1,
-0.2296593, 1.477729, -0.5488423, 0, 1, 0.2862745, 1,
-0.2251756, -0.6325408, -2.153852, 0, 1, 0.2901961, 1,
-0.2240554, -0.4022241, -1.746764, 0, 1, 0.2980392, 1,
-0.2221727, -1.249949, -3.158811, 0, 1, 0.3058824, 1,
-0.219567, -0.2124918, -2.098866, 0, 1, 0.3098039, 1,
-0.214075, 0.3860648, -0.1982727, 0, 1, 0.3176471, 1,
-0.2132741, -0.8027686, -3.982796, 0, 1, 0.3215686, 1,
-0.2079039, -0.4428413, -1.952114, 0, 1, 0.3294118, 1,
-0.2050828, 0.26232, -0.588511, 0, 1, 0.3333333, 1,
-0.2022059, 0.4548308, -1.193877, 0, 1, 0.3411765, 1,
-0.2015485, -0.2816756, -2.846393, 0, 1, 0.345098, 1,
-0.2015214, -2.732946, -3.866521, 0, 1, 0.3529412, 1,
-0.198638, 0.07432145, 0.5475325, 0, 1, 0.3568628, 1,
-0.1948885, -0.259789, -2.545328, 0, 1, 0.3647059, 1,
-0.1924618, 0.2093939, -1.775733, 0, 1, 0.3686275, 1,
-0.1902172, -0.5953278, -3.114582, 0, 1, 0.3764706, 1,
-0.1847191, 0.07688417, -1.457891, 0, 1, 0.3803922, 1,
-0.1828785, -0.06062495, -1.149947, 0, 1, 0.3882353, 1,
-0.1823567, -0.08288583, -2.293373, 0, 1, 0.3921569, 1,
-0.1780169, 0.4979715, 0.7761865, 0, 1, 0.4, 1,
-0.177215, 0.4489972, -1.338826, 0, 1, 0.4078431, 1,
-0.1766279, -0.7530118, -2.88713, 0, 1, 0.4117647, 1,
-0.1757599, -0.7212499, -5.760436, 0, 1, 0.4196078, 1,
-0.1725252, 0.6639977, -0.6835846, 0, 1, 0.4235294, 1,
-0.1721619, 2.740301, -1.911657, 0, 1, 0.4313726, 1,
-0.1720098, 1.163602, -1.350331, 0, 1, 0.4352941, 1,
-0.1681571, 1.674958, 0.9817727, 0, 1, 0.4431373, 1,
-0.1641028, 0.2794476, 0.07797898, 0, 1, 0.4470588, 1,
-0.1627752, -1.101025, -3.048011, 0, 1, 0.454902, 1,
-0.1514979, 0.9594668, -0.9997231, 0, 1, 0.4588235, 1,
-0.1511793, -0.7018986, -3.065601, 0, 1, 0.4666667, 1,
-0.1450634, -0.1945694, -0.8225562, 0, 1, 0.4705882, 1,
-0.1444709, 1.342866, -1.366373, 0, 1, 0.4784314, 1,
-0.14382, -0.9985221, -2.502258, 0, 1, 0.4823529, 1,
-0.1422879, -0.3576404, -3.6195, 0, 1, 0.4901961, 1,
-0.1385041, 0.8782179, 0.1991638, 0, 1, 0.4941176, 1,
-0.1374601, -0.8389811, -3.088051, 0, 1, 0.5019608, 1,
-0.1370801, -0.6801627, -3.392514, 0, 1, 0.509804, 1,
-0.1365132, 0.5121804, -0.2772471, 0, 1, 0.5137255, 1,
-0.1353483, 0.2398678, 0.889358, 0, 1, 0.5215687, 1,
-0.1341032, 0.07800676, -0.7978056, 0, 1, 0.5254902, 1,
-0.1291905, -0.8647572, -2.460375, 0, 1, 0.5333334, 1,
-0.1285295, -0.02076897, -0.1127029, 0, 1, 0.5372549, 1,
-0.1279042, -0.2765101, -1.959764, 0, 1, 0.5450981, 1,
-0.1272814, -0.3459764, -4.221116, 0, 1, 0.5490196, 1,
-0.1262142, -0.08580463, -1.175516, 0, 1, 0.5568628, 1,
-0.1255866, -0.3686356, -1.448231, 0, 1, 0.5607843, 1,
-0.1255113, -0.6391387, -3.323357, 0, 1, 0.5686275, 1,
-0.1213885, -0.03426946, -1.909866, 0, 1, 0.572549, 1,
-0.1196297, -2.157346, -1.907068, 0, 1, 0.5803922, 1,
-0.1141783, -0.5656058, -2.914297, 0, 1, 0.5843138, 1,
-0.1057302, 0.6154587, 0.4929232, 0, 1, 0.5921569, 1,
-0.1054093, 1.040414, -0.1255616, 0, 1, 0.5960785, 1,
-0.1053257, 0.3372007, -1.52493, 0, 1, 0.6039216, 1,
-0.1038464, -0.7304491, -3.205062, 0, 1, 0.6117647, 1,
-0.1023983, -1.623884, -2.999683, 0, 1, 0.6156863, 1,
-0.1006697, 0.3455778, -0.04336968, 0, 1, 0.6235294, 1,
-0.09754115, -0.2332121, -3.909781, 0, 1, 0.627451, 1,
-0.0968909, -0.1033925, -3.495214, 0, 1, 0.6352941, 1,
-0.09658444, 0.5272097, -0.5370677, 0, 1, 0.6392157, 1,
-0.09567501, -1.187481, -1.876182, 0, 1, 0.6470588, 1,
-0.09380266, 1.302156, -0.7931461, 0, 1, 0.6509804, 1,
-0.08661084, -1.049514, -4.038895, 0, 1, 0.6588235, 1,
-0.07950412, 0.05269463, -0.574339, 0, 1, 0.6627451, 1,
-0.07795397, -0.5631641, -1.057397, 0, 1, 0.6705883, 1,
-0.07737159, 1.047995, -0.04533474, 0, 1, 0.6745098, 1,
-0.07728924, -0.8421999, -3.410474, 0, 1, 0.682353, 1,
-0.07484482, -0.1944292, -3.612173, 0, 1, 0.6862745, 1,
-0.0705651, -1.869579, -2.124519, 0, 1, 0.6941177, 1,
-0.06823577, 2.154007, 0.820174, 0, 1, 0.7019608, 1,
-0.06761738, -0.1077453, -3.241778, 0, 1, 0.7058824, 1,
-0.06048307, 0.563114, -0.260558, 0, 1, 0.7137255, 1,
-0.05991039, -0.2535736, -4.546497, 0, 1, 0.7176471, 1,
-0.05886526, -1.054916, -3.318812, 0, 1, 0.7254902, 1,
-0.05583008, 0.674368, 0.9790593, 0, 1, 0.7294118, 1,
-0.05511879, 0.7001392, 0.4162239, 0, 1, 0.7372549, 1,
-0.05256867, -0.1123001, -4.485368, 0, 1, 0.7411765, 1,
-0.05145177, 0.2564205, -0.7749944, 0, 1, 0.7490196, 1,
-0.04489602, 0.4428568, -0.7310604, 0, 1, 0.7529412, 1,
-0.04371925, -0.9889342, -2.882289, 0, 1, 0.7607843, 1,
-0.04236228, -0.3002047, -3.080771, 0, 1, 0.7647059, 1,
-0.04210636, 1.610108, -0.1066261, 0, 1, 0.772549, 1,
-0.04030883, 0.9967688, 0.4272802, 0, 1, 0.7764706, 1,
-0.03964807, 1.363827, 0.7706144, 0, 1, 0.7843137, 1,
-0.03921604, 0.9672355, -0.08680136, 0, 1, 0.7882353, 1,
-0.03733885, -1.596605, -2.314523, 0, 1, 0.7960784, 1,
-0.03356725, 2.068348, 0.5677624, 0, 1, 0.8039216, 1,
-0.03322813, -0.5756445, -2.813612, 0, 1, 0.8078431, 1,
-0.03264471, -0.8429328, -5.988704, 0, 1, 0.8156863, 1,
-0.02943919, 0.246878, 1.090654, 0, 1, 0.8196079, 1,
-0.0280906, -0.2559941, -2.89006, 0, 1, 0.827451, 1,
-0.02612622, 0.1435001, 0.4504438, 0, 1, 0.8313726, 1,
-0.02516767, -0.5996459, -0.7524444, 0, 1, 0.8392157, 1,
-0.02146134, -1.909107, -3.392794, 0, 1, 0.8431373, 1,
-0.02100806, 0.8508549, 0.4634942, 0, 1, 0.8509804, 1,
-0.01925692, -0.7229606, -2.046278, 0, 1, 0.854902, 1,
-0.01850498, 1.104604, -0.1654065, 0, 1, 0.8627451, 1,
-0.01035421, 1.48052, -0.2920513, 0, 1, 0.8666667, 1,
-0.004845702, 0.3209637, 2.34859, 0, 1, 0.8745098, 1,
-0.003630941, 0.4588561, 0.7533869, 0, 1, 0.8784314, 1,
-0.001785632, 0.968738, 1.123369, 0, 1, 0.8862745, 1,
-0.0007960129, -0.7723357, -2.514153, 0, 1, 0.8901961, 1,
-0.0003078488, 0.500855, -0.3612424, 0, 1, 0.8980392, 1,
0.003319459, 0.6168122, -1.179239, 0, 1, 0.9058824, 1,
0.004594828, 0.06309711, 1.138476, 0, 1, 0.9098039, 1,
0.005063185, 0.5333204, -0.4024563, 0, 1, 0.9176471, 1,
0.005162602, 1.356702, -0.5644668, 0, 1, 0.9215686, 1,
0.01524609, 0.3307581, 0.7570567, 0, 1, 0.9294118, 1,
0.02320096, -0.8906941, 2.99155, 0, 1, 0.9333333, 1,
0.02663593, -0.6058919, 3.576149, 0, 1, 0.9411765, 1,
0.03423486, 1.146777, -0.1647736, 0, 1, 0.945098, 1,
0.03462347, 1.487864, -0.8243132, 0, 1, 0.9529412, 1,
0.03546266, -0.8082227, 4.148503, 0, 1, 0.9568627, 1,
0.03549531, -0.901498, 3.187245, 0, 1, 0.9647059, 1,
0.0376261, 1.09607, 0.44462, 0, 1, 0.9686275, 1,
0.03824683, 1.477094, -0.6727345, 0, 1, 0.9764706, 1,
0.03871534, 0.9577782, -0.7372373, 0, 1, 0.9803922, 1,
0.04014177, 0.1962049, 1.221655, 0, 1, 0.9882353, 1,
0.0420758, -1.731843, 3.272522, 0, 1, 0.9921569, 1,
0.05501891, -1.624457, 1.819822, 0, 1, 1, 1,
0.05622612, -1.429583, 1.958868, 0, 0.9921569, 1, 1,
0.05709112, -1.033627, 2.733043, 0, 0.9882353, 1, 1,
0.05857467, -0.1340275, 1.193406, 0, 0.9803922, 1, 1,
0.06100635, 0.7765391, 0.2562912, 0, 0.9764706, 1, 1,
0.06357274, 0.6824338, 1.766628, 0, 0.9686275, 1, 1,
0.06728096, -0.885738, 1.694401, 0, 0.9647059, 1, 1,
0.07006218, 1.174941, 0.3768701, 0, 0.9568627, 1, 1,
0.07179073, -0.4914061, 3.436294, 0, 0.9529412, 1, 1,
0.0732268, 0.05946279, 0.5786248, 0, 0.945098, 1, 1,
0.07369457, -1.758706, 2.801666, 0, 0.9411765, 1, 1,
0.07563567, 0.8987106, 0.3862958, 0, 0.9333333, 1, 1,
0.07774779, 1.830381, 0.763672, 0, 0.9294118, 1, 1,
0.07876327, -1.980352, 5.490855, 0, 0.9215686, 1, 1,
0.08344837, 0.9575059, -1.00662, 0, 0.9176471, 1, 1,
0.08418608, -0.1421475, 4.453288, 0, 0.9098039, 1, 1,
0.08537632, 0.02102583, 0.4513946, 0, 0.9058824, 1, 1,
0.0858899, 0.4959509, 0.03894504, 0, 0.8980392, 1, 1,
0.08687269, 0.139901, 0.9904922, 0, 0.8901961, 1, 1,
0.08971842, -0.1467683, 2.17823, 0, 0.8862745, 1, 1,
0.1090805, -0.3743823, 3.367805, 0, 0.8784314, 1, 1,
0.1104585, 1.072047, 2.00058, 0, 0.8745098, 1, 1,
0.1131384, 1.547024, -2.525279, 0, 0.8666667, 1, 1,
0.1137046, -0.9943711, 2.159196, 0, 0.8627451, 1, 1,
0.1173866, 0.1475013, -0.8760751, 0, 0.854902, 1, 1,
0.1178817, -2.199863, 3.251194, 0, 0.8509804, 1, 1,
0.1197255, 1.320297, -0.3461014, 0, 0.8431373, 1, 1,
0.1210293, 0.01854481, 0.1218201, 0, 0.8392157, 1, 1,
0.1233539, 0.8996425, -0.1131559, 0, 0.8313726, 1, 1,
0.1331003, -0.7444971, 0.9803218, 0, 0.827451, 1, 1,
0.1333506, 1.296289, 0.4293917, 0, 0.8196079, 1, 1,
0.1336571, 0.727978, -0.0201404, 0, 0.8156863, 1, 1,
0.1341383, 1.001272, -2.064959, 0, 0.8078431, 1, 1,
0.1415597, 0.3994379, -0.5016364, 0, 0.8039216, 1, 1,
0.1459118, -0.6485755, 4.698189, 0, 0.7960784, 1, 1,
0.1539831, -1.689647, 5.046908, 0, 0.7882353, 1, 1,
0.1543794, 0.6190948, -0.3685288, 0, 0.7843137, 1, 1,
0.1596267, -0.766775, 2.164195, 0, 0.7764706, 1, 1,
0.1599326, 0.3688749, 1.109384, 0, 0.772549, 1, 1,
0.160238, 0.4103476, -2.413326, 0, 0.7647059, 1, 1,
0.1608448, -1.107369, 2.50317, 0, 0.7607843, 1, 1,
0.1609943, 0.2478898, 2.178468, 0, 0.7529412, 1, 1,
0.1615259, -0.8701872, 4.81204, 0, 0.7490196, 1, 1,
0.1640723, -0.9250256, 3.096668, 0, 0.7411765, 1, 1,
0.1684023, 0.702155, -0.8402749, 0, 0.7372549, 1, 1,
0.176155, 0.8555275, -0.0700966, 0, 0.7294118, 1, 1,
0.1837537, 0.471564, 0.12174, 0, 0.7254902, 1, 1,
0.1842812, 0.7284028, 0.5118306, 0, 0.7176471, 1, 1,
0.1847244, 2.728445, 0.03081883, 0, 0.7137255, 1, 1,
0.1853751, 2.104301, 0.9446397, 0, 0.7058824, 1, 1,
0.1879659, 1.410393, -1.2951, 0, 0.6980392, 1, 1,
0.1893355, -1.096231, 0.5046263, 0, 0.6941177, 1, 1,
0.1895067, 2.026233, 0.1488114, 0, 0.6862745, 1, 1,
0.1975357, 0.0418222, 2.683684, 0, 0.682353, 1, 1,
0.1980427, 0.4738081, 1.862433, 0, 0.6745098, 1, 1,
0.2011848, -1.750681, 5.027305, 0, 0.6705883, 1, 1,
0.2034872, -0.8993508, 2.470996, 0, 0.6627451, 1, 1,
0.2057285, -0.03339795, 2.357132, 0, 0.6588235, 1, 1,
0.2073737, -1.463726, 3.132408, 0, 0.6509804, 1, 1,
0.2075249, -0.09857856, 1.685045, 0, 0.6470588, 1, 1,
0.2126961, 1.270534, -1.227105, 0, 0.6392157, 1, 1,
0.2143231, 1.002215, 0.8356029, 0, 0.6352941, 1, 1,
0.2203325, 0.2579747, 1.159442, 0, 0.627451, 1, 1,
0.2206894, 0.9629117, -0.3718733, 0, 0.6235294, 1, 1,
0.2207296, -1.413407, 3.998372, 0, 0.6156863, 1, 1,
0.2230345, -0.8452122, 3.457715, 0, 0.6117647, 1, 1,
0.2241357, -0.1530243, 0.9989299, 0, 0.6039216, 1, 1,
0.2277108, 0.04837508, -0.7748124, 0, 0.5960785, 1, 1,
0.2306212, -0.3011691, 3.60346, 0, 0.5921569, 1, 1,
0.2325482, -1.442718, 1.947266, 0, 0.5843138, 1, 1,
0.2384273, -0.03039346, 2.074532, 0, 0.5803922, 1, 1,
0.2406267, -0.3936627, 2.807084, 0, 0.572549, 1, 1,
0.240947, -0.22346, 3.613779, 0, 0.5686275, 1, 1,
0.2457447, 0.5105796, 2.236917, 0, 0.5607843, 1, 1,
0.2470451, 0.1056324, 0.7641103, 0, 0.5568628, 1, 1,
0.2479007, -0.8046895, 2.839551, 0, 0.5490196, 1, 1,
0.2482419, -0.01896893, 0.3179117, 0, 0.5450981, 1, 1,
0.2490824, -0.5847504, 2.812783, 0, 0.5372549, 1, 1,
0.2492511, -0.4067137, 1.492382, 0, 0.5333334, 1, 1,
0.2560944, 1.388321, -1.209347, 0, 0.5254902, 1, 1,
0.2592793, -0.7893237, 2.531457, 0, 0.5215687, 1, 1,
0.2603039, -0.464226, 3.920105, 0, 0.5137255, 1, 1,
0.2611912, -1.565423, 2.996945, 0, 0.509804, 1, 1,
0.2625997, -0.1256398, 1.563186, 0, 0.5019608, 1, 1,
0.2627276, 0.1210017, -0.570034, 0, 0.4941176, 1, 1,
0.2661896, -0.03877087, 2.436154, 0, 0.4901961, 1, 1,
0.2665446, 0.252535, 1.775797, 0, 0.4823529, 1, 1,
0.2786852, 0.4185323, 1.987729, 0, 0.4784314, 1, 1,
0.2811424, 0.58926, 0.7873502, 0, 0.4705882, 1, 1,
0.282637, 0.3639453, 0.9987996, 0, 0.4666667, 1, 1,
0.2835634, -0.2274779, 1.515369, 0, 0.4588235, 1, 1,
0.2858621, 0.1017794, 1.919869, 0, 0.454902, 1, 1,
0.2897981, -1.210534, 3.908752, 0, 0.4470588, 1, 1,
0.291254, 0.910237, -0.07977805, 0, 0.4431373, 1, 1,
0.2933359, -1.961219, 3.731491, 0, 0.4352941, 1, 1,
0.2973455, 0.5547391, -1.209896, 0, 0.4313726, 1, 1,
0.2979599, -2.238633, 4.392796, 0, 0.4235294, 1, 1,
0.2982555, -0.7178987, 4.803901, 0, 0.4196078, 1, 1,
0.3007338, 0.6701354, -1.141111, 0, 0.4117647, 1, 1,
0.3017569, 0.2745495, 0.9190241, 0, 0.4078431, 1, 1,
0.3019527, 0.3162417, -0.003603294, 0, 0.4, 1, 1,
0.3030502, -0.1241413, 2.259788, 0, 0.3921569, 1, 1,
0.3046459, 2.739317, -1.023554, 0, 0.3882353, 1, 1,
0.3086655, -0.4374592, 3.223081, 0, 0.3803922, 1, 1,
0.3148537, 0.8716066, -1.640984, 0, 0.3764706, 1, 1,
0.3153535, -1.741511, 2.178269, 0, 0.3686275, 1, 1,
0.322159, -1.441326, 1.796232, 0, 0.3647059, 1, 1,
0.3229635, -3.012059, 3.745026, 0, 0.3568628, 1, 1,
0.32439, 0.2026705, 2.173974, 0, 0.3529412, 1, 1,
0.3315265, -0.7467716, 1.069368, 0, 0.345098, 1, 1,
0.3415176, 0.5464101, -0.6644945, 0, 0.3411765, 1, 1,
0.342497, -0.2890153, 2.052145, 0, 0.3333333, 1, 1,
0.3449984, 0.651053, 1.224083, 0, 0.3294118, 1, 1,
0.3467822, 1.605497, 0.863769, 0, 0.3215686, 1, 1,
0.3487019, -1.02467, 3.920932, 0, 0.3176471, 1, 1,
0.3529002, 1.085182, -0.8512127, 0, 0.3098039, 1, 1,
0.3553085, 0.009060209, 1.616679, 0, 0.3058824, 1, 1,
0.3570415, -0.6464853, 5.020237, 0, 0.2980392, 1, 1,
0.3577537, 0.506231, 0.2292165, 0, 0.2901961, 1, 1,
0.3590766, -1.184804, 1.550108, 0, 0.2862745, 1, 1,
0.3602778, -0.8869576, 2.766049, 0, 0.2784314, 1, 1,
0.3614496, 1.004481, 0.1196854, 0, 0.2745098, 1, 1,
0.363549, -0.3388816, 2.141253, 0, 0.2666667, 1, 1,
0.3647976, -0.1777288, 1.888321, 0, 0.2627451, 1, 1,
0.3669049, 0.7232824, 1.486865, 0, 0.254902, 1, 1,
0.3687171, 1.348733, 1.344329, 0, 0.2509804, 1, 1,
0.3687423, 0.3809435, 0.8797365, 0, 0.2431373, 1, 1,
0.3694116, -0.415446, 3.063145, 0, 0.2392157, 1, 1,
0.3714513, 0.3767853, 0.5637298, 0, 0.2313726, 1, 1,
0.3757387, -1.169561, 1.763696, 0, 0.227451, 1, 1,
0.3789507, -2.219612, 1.387073, 0, 0.2196078, 1, 1,
0.387727, -0.8579315, 0.2877621, 0, 0.2156863, 1, 1,
0.3900187, -0.2219561, 1.529723, 0, 0.2078431, 1, 1,
0.3910013, 0.1892249, 1.02819, 0, 0.2039216, 1, 1,
0.3921839, -0.5325666, 4.362231, 0, 0.1960784, 1, 1,
0.393773, -1.001449, 2.470462, 0, 0.1882353, 1, 1,
0.3996846, 1.095105, 3.082042, 0, 0.1843137, 1, 1,
0.4031108, -1.238248, 2.860542, 0, 0.1764706, 1, 1,
0.4041939, 0.341448, 1.661438, 0, 0.172549, 1, 1,
0.4062992, -0.05952682, 2.17226, 0, 0.1647059, 1, 1,
0.4165584, -0.7769983, 3.326234, 0, 0.1607843, 1, 1,
0.4223615, -1.091389, 2.025988, 0, 0.1529412, 1, 1,
0.4264024, 1.064783, -0.4037179, 0, 0.1490196, 1, 1,
0.4300673, 0.7807826, 1.612257, 0, 0.1411765, 1, 1,
0.433763, 0.283437, 1.807405, 0, 0.1372549, 1, 1,
0.4383723, -0.9165898, 3.021443, 0, 0.1294118, 1, 1,
0.4395715, -0.6520199, 0.5946739, 0, 0.1254902, 1, 1,
0.4408754, -0.6855075, 3.231694, 0, 0.1176471, 1, 1,
0.4490975, 1.148591, 1.429252, 0, 0.1137255, 1, 1,
0.4525982, 3.010854, 0.09272251, 0, 0.1058824, 1, 1,
0.4533495, -1.049538, 2.449545, 0, 0.09803922, 1, 1,
0.4555919, -0.5581734, 1.496771, 0, 0.09411765, 1, 1,
0.4587727, -0.9282961, 3.139374, 0, 0.08627451, 1, 1,
0.4657224, 1.891334, -0.02462298, 0, 0.08235294, 1, 1,
0.4666785, 0.145449, 2.345188, 0, 0.07450981, 1, 1,
0.4682815, 0.03272484, 2.389193, 0, 0.07058824, 1, 1,
0.4736392, -0.05464974, 1.704776, 0, 0.0627451, 1, 1,
0.4774926, 0.07565916, 1.915417, 0, 0.05882353, 1, 1,
0.4784874, 1.233945, 0.8651639, 0, 0.05098039, 1, 1,
0.4794719, 0.9403588, 0.3136932, 0, 0.04705882, 1, 1,
0.48002, 0.4544731, 0.2519921, 0, 0.03921569, 1, 1,
0.4824499, 0.7482235, 2.477695, 0, 0.03529412, 1, 1,
0.4829312, 0.7033907, 0.525596, 0, 0.02745098, 1, 1,
0.4834344, 0.2233874, 2.677422, 0, 0.02352941, 1, 1,
0.4845474, -0.7639146, 0.272254, 0, 0.01568628, 1, 1,
0.489529, 0.4174871, 1.836665, 0, 0.01176471, 1, 1,
0.4897315, -0.06906149, 2.48298, 0, 0.003921569, 1, 1,
0.4911328, 0.05945866, 1.23816, 0.003921569, 0, 1, 1,
0.4939904, -0.07624268, 2.498783, 0.007843138, 0, 1, 1,
0.4969747, 0.9874315, -0.2857063, 0.01568628, 0, 1, 1,
0.5008507, 1.809733, 1.47418, 0.01960784, 0, 1, 1,
0.5029873, -0.2792633, 1.593237, 0.02745098, 0, 1, 1,
0.5037779, 0.6338336, 0.8429694, 0.03137255, 0, 1, 1,
0.5045376, -0.1801931, 1.249502, 0.03921569, 0, 1, 1,
0.5140141, 0.7826478, 0.4678291, 0.04313726, 0, 1, 1,
0.5177028, -0.43681, 1.771127, 0.05098039, 0, 1, 1,
0.5220122, 1.134278, 0.8958983, 0.05490196, 0, 1, 1,
0.5221263, -0.3207448, 3.766963, 0.0627451, 0, 1, 1,
0.5260184, -0.1879196, 2.331108, 0.06666667, 0, 1, 1,
0.5290102, -2.923497, 2.399156, 0.07450981, 0, 1, 1,
0.5353858, 1.057025, 1.057704, 0.07843138, 0, 1, 1,
0.5372349, 0.3342027, -0.01342242, 0.08627451, 0, 1, 1,
0.5391983, 0.3807628, 1.94948, 0.09019608, 0, 1, 1,
0.5464122, 0.3725629, 1.066775, 0.09803922, 0, 1, 1,
0.5475622, -1.797841, 2.057589, 0.1058824, 0, 1, 1,
0.549124, -0.8994982, 2.829196, 0.1098039, 0, 1, 1,
0.5491657, -0.9398406, 2.319845, 0.1176471, 0, 1, 1,
0.5495926, -0.2243064, 1.296185, 0.1215686, 0, 1, 1,
0.5533347, -0.5977804, 1.880198, 0.1294118, 0, 1, 1,
0.5542929, 0.2139135, 1.851637, 0.1333333, 0, 1, 1,
0.5559313, -0.1670574, 0.519355, 0.1411765, 0, 1, 1,
0.5561634, -0.7640706, 3.329227, 0.145098, 0, 1, 1,
0.5580522, 0.3991742, 1.565266, 0.1529412, 0, 1, 1,
0.5619309, 0.3399433, 1.787646, 0.1568628, 0, 1, 1,
0.5634632, -0.05582787, 2.014015, 0.1647059, 0, 1, 1,
0.5641188, 1.219172, 0.3752486, 0.1686275, 0, 1, 1,
0.5688498, 0.736431, 1.103712, 0.1764706, 0, 1, 1,
0.5728693, 0.6901927, 1.493143, 0.1803922, 0, 1, 1,
0.5758951, 0.4223534, 0.323678, 0.1882353, 0, 1, 1,
0.5761931, 0.201089, 0.3050558, 0.1921569, 0, 1, 1,
0.5771627, 1.811418, 1.78476, 0.2, 0, 1, 1,
0.5790774, -0.6139612, 1.645217, 0.2078431, 0, 1, 1,
0.5814727, 0.218769, 3.714015, 0.2117647, 0, 1, 1,
0.5873052, -0.4324719, 4.378236, 0.2196078, 0, 1, 1,
0.5881001, -0.7788798, 2.731279, 0.2235294, 0, 1, 1,
0.5927004, -0.1482821, 2.732785, 0.2313726, 0, 1, 1,
0.5927665, 0.7553287, 1.148544, 0.2352941, 0, 1, 1,
0.5928198, -1.903364, 4.692304, 0.2431373, 0, 1, 1,
0.5987602, 0.07908726, 1.628132, 0.2470588, 0, 1, 1,
0.5998722, -1.80407, 3.714875, 0.254902, 0, 1, 1,
0.6031458, -0.9465221, -0.9436087, 0.2588235, 0, 1, 1,
0.6079327, 0.5997339, -0.6588079, 0.2666667, 0, 1, 1,
0.6107205, -0.7032403, 4.529031, 0.2705882, 0, 1, 1,
0.6143387, -0.2835577, 0.9582442, 0.2784314, 0, 1, 1,
0.6189713, 0.06376915, -0.07341646, 0.282353, 0, 1, 1,
0.6207472, -0.3690267, 2.347187, 0.2901961, 0, 1, 1,
0.6290311, -1.329154, 3.698079, 0.2941177, 0, 1, 1,
0.6299232, 0.8142166, -1.064728, 0.3019608, 0, 1, 1,
0.6311761, 1.100496, 1.41996, 0.3098039, 0, 1, 1,
0.6325033, 1.437977, 1.275796, 0.3137255, 0, 1, 1,
0.6365808, 1.286943, -0.6880322, 0.3215686, 0, 1, 1,
0.6370181, -2.662689, 2.815639, 0.3254902, 0, 1, 1,
0.6373766, 1.252647, 1.0805, 0.3333333, 0, 1, 1,
0.6413891, -0.5319611, 2.927648, 0.3372549, 0, 1, 1,
0.6451283, -1.255923, 2.390038, 0.345098, 0, 1, 1,
0.6452536, 0.4222029, 1.5776, 0.3490196, 0, 1, 1,
0.648221, -1.718952, 2.303428, 0.3568628, 0, 1, 1,
0.6485841, 0.6763821, 2.431359, 0.3607843, 0, 1, 1,
0.6501685, -0.5520279, 2.951426, 0.3686275, 0, 1, 1,
0.6537519, 1.74399, 0.7287414, 0.372549, 0, 1, 1,
0.6560819, 0.06522954, 2.091793, 0.3803922, 0, 1, 1,
0.6571213, -0.340545, 0.947456, 0.3843137, 0, 1, 1,
0.6673346, 0.2930264, 1.635568, 0.3921569, 0, 1, 1,
0.6799995, -2.321986, 3.082225, 0.3960784, 0, 1, 1,
0.6842541, 0.3735369, 0.1251976, 0.4039216, 0, 1, 1,
0.700709, 1.806238, -1.058577, 0.4117647, 0, 1, 1,
0.7012058, 0.348218, -0.9123424, 0.4156863, 0, 1, 1,
0.7024658, -1.175153, 2.737159, 0.4235294, 0, 1, 1,
0.7066612, -0.2741151, 2.34031, 0.427451, 0, 1, 1,
0.7084957, 0.03537828, -0.02690751, 0.4352941, 0, 1, 1,
0.7090099, -0.1847832, 3.166045, 0.4392157, 0, 1, 1,
0.7196277, 0.5955896, 0.9466166, 0.4470588, 0, 1, 1,
0.7216921, 0.1656824, 0.8805523, 0.4509804, 0, 1, 1,
0.7241051, -2.499395, 3.625824, 0.4588235, 0, 1, 1,
0.7330884, 0.9205129, 1.267389, 0.4627451, 0, 1, 1,
0.7354649, 0.2562639, 0.6496698, 0.4705882, 0, 1, 1,
0.7358783, 1.347861, 1.646885, 0.4745098, 0, 1, 1,
0.736905, -0.2550363, 3.540838, 0.4823529, 0, 1, 1,
0.7398003, -0.03008263, 0.5716324, 0.4862745, 0, 1, 1,
0.7476647, -1.244942, 2.996583, 0.4941176, 0, 1, 1,
0.7479138, 2.658607, -0.3412787, 0.5019608, 0, 1, 1,
0.7539246, -0.2092929, 1.418728, 0.5058824, 0, 1, 1,
0.7562274, 0.6621653, 0.4143923, 0.5137255, 0, 1, 1,
0.7562283, 1.873235, 0.8345097, 0.5176471, 0, 1, 1,
0.7572445, -0.8997167, 2.358539, 0.5254902, 0, 1, 1,
0.7625791, -0.2213909, 2.053237, 0.5294118, 0, 1, 1,
0.7627256, 0.2432886, 0.4740619, 0.5372549, 0, 1, 1,
0.7640966, 1.176177, -1.157528, 0.5411765, 0, 1, 1,
0.7748343, -0.8652255, 2.081722, 0.5490196, 0, 1, 1,
0.7824153, -0.9609077, 3.525245, 0.5529412, 0, 1, 1,
0.7847503, -0.8976242, 2.181223, 0.5607843, 0, 1, 1,
0.7907052, 0.4456442, -0.4584205, 0.5647059, 0, 1, 1,
0.7916327, 0.5508829, 1.880805, 0.572549, 0, 1, 1,
0.7921233, 0.2134439, 2.57885, 0.5764706, 0, 1, 1,
0.7983134, -1.303394, 2.321701, 0.5843138, 0, 1, 1,
0.799775, -0.8030578, 1.043439, 0.5882353, 0, 1, 1,
0.8006924, 1.36757, 2.731649, 0.5960785, 0, 1, 1,
0.8064328, 1.038198, 1.839798, 0.6039216, 0, 1, 1,
0.8101617, 0.3686085, 1.434188, 0.6078432, 0, 1, 1,
0.8102491, 0.1053004, 2.224263, 0.6156863, 0, 1, 1,
0.8108017, 1.676363, -0.5635136, 0.6196079, 0, 1, 1,
0.8144452, 0.4422682, 1.714594, 0.627451, 0, 1, 1,
0.8199794, 0.5677834, 1.891482, 0.6313726, 0, 1, 1,
0.8293203, -0.475141, 2.55398, 0.6392157, 0, 1, 1,
0.8334996, -0.5383155, 1.234758, 0.6431373, 0, 1, 1,
0.8361517, -0.9125243, 1.648113, 0.6509804, 0, 1, 1,
0.8364295, -1.293381, 2.472781, 0.654902, 0, 1, 1,
0.8366315, 0.1016691, 1.952136, 0.6627451, 0, 1, 1,
0.8592308, -1.110918, 1.521223, 0.6666667, 0, 1, 1,
0.8598567, -0.4506031, 4.134347, 0.6745098, 0, 1, 1,
0.8613933, 0.1649782, 1.785062, 0.6784314, 0, 1, 1,
0.862629, -0.437453, 2.464257, 0.6862745, 0, 1, 1,
0.8715338, 0.2924006, 1.320898, 0.6901961, 0, 1, 1,
0.8718542, 2.358635, 1.145787, 0.6980392, 0, 1, 1,
0.8734795, 0.7727954, 2.392535, 0.7058824, 0, 1, 1,
0.8758994, 0.3501488, -0.5427629, 0.7098039, 0, 1, 1,
0.8800603, 0.1660475, 2.720631, 0.7176471, 0, 1, 1,
0.8814189, 0.2479538, 0.05074318, 0.7215686, 0, 1, 1,
0.8815685, -0.2094046, 0.7567464, 0.7294118, 0, 1, 1,
0.8825234, 0.3868995, 1.320402, 0.7333333, 0, 1, 1,
0.8842676, -1.023812, 1.99842, 0.7411765, 0, 1, 1,
0.8874367, -1.020871, 2.668699, 0.7450981, 0, 1, 1,
0.8896841, 2.025183, -0.9763285, 0.7529412, 0, 1, 1,
0.897232, 1.803062, 1.983419, 0.7568628, 0, 1, 1,
0.8973158, 1.625421, -0.3779251, 0.7647059, 0, 1, 1,
0.8978443, 0.4435309, 1.222352, 0.7686275, 0, 1, 1,
0.8983259, -0.3917595, 0.0272505, 0.7764706, 0, 1, 1,
0.8994064, 0.9203944, 0.8615348, 0.7803922, 0, 1, 1,
0.9000096, -0.7546687, 3.19583, 0.7882353, 0, 1, 1,
0.9018164, 1.288923, 1.207282, 0.7921569, 0, 1, 1,
0.9079163, 1.242966, 1.819305, 0.8, 0, 1, 1,
0.9121736, 2.247631, 1.241586, 0.8078431, 0, 1, 1,
0.9130454, -1.773582, 2.85263, 0.8117647, 0, 1, 1,
0.9132725, 0.4682477, 3.287329, 0.8196079, 0, 1, 1,
0.9157885, 0.5420624, 1.48137, 0.8235294, 0, 1, 1,
0.9201576, 1.386093, 1.234668, 0.8313726, 0, 1, 1,
0.9264125, -0.06782533, 2.532769, 0.8352941, 0, 1, 1,
0.9283737, 0.6737581, 0.7431201, 0.8431373, 0, 1, 1,
0.9287096, 1.246633, 1.125571, 0.8470588, 0, 1, 1,
0.9299354, -1.009046, 3.798138, 0.854902, 0, 1, 1,
0.9310961, 1.216276, 1.423054, 0.8588235, 0, 1, 1,
0.935469, -0.2870223, 2.15304, 0.8666667, 0, 1, 1,
0.937783, -0.1293265, 1.541576, 0.8705882, 0, 1, 1,
0.9428272, -0.5092562, 1.868016, 0.8784314, 0, 1, 1,
0.9432201, -0.7035524, 2.478014, 0.8823529, 0, 1, 1,
0.947369, 0.05269756, 1.364642, 0.8901961, 0, 1, 1,
0.9515198, 1.183834, 0.9953993, 0.8941177, 0, 1, 1,
0.9518547, 0.057808, 2.110334, 0.9019608, 0, 1, 1,
0.9532327, 0.001397127, 1.236011, 0.9098039, 0, 1, 1,
0.9546376, 0.6404819, 2.517371, 0.9137255, 0, 1, 1,
0.9583148, 1.065071, 0.9418433, 0.9215686, 0, 1, 1,
0.9600947, 0.510566, 3.983979, 0.9254902, 0, 1, 1,
0.9631724, -0.4149914, 2.847564, 0.9333333, 0, 1, 1,
0.9640461, 0.1428642, -0.1097944, 0.9372549, 0, 1, 1,
0.9647741, -0.981116, 3.463455, 0.945098, 0, 1, 1,
0.9654486, 0.03048616, -0.4085283, 0.9490196, 0, 1, 1,
0.9681616, 0.4373404, 1.887718, 0.9568627, 0, 1, 1,
0.9713899, 0.9171257, 0.2636475, 0.9607843, 0, 1, 1,
0.9768112, 1.863083, 0.3933764, 0.9686275, 0, 1, 1,
0.9785142, 0.4162126, 1.114133, 0.972549, 0, 1, 1,
0.9844719, 0.112178, -0.8307555, 0.9803922, 0, 1, 1,
0.9875976, 0.436568, 0.2196387, 0.9843137, 0, 1, 1,
0.9984954, -0.3356108, 1.445979, 0.9921569, 0, 1, 1,
0.9988238, -0.498167, 1.793326, 0.9960784, 0, 1, 1,
1.008535, -0.7164727, 0.8727642, 1, 0, 0.9960784, 1,
1.009014, -0.4196938, 1.906929, 1, 0, 0.9882353, 1,
1.014725, 1.240936, -0.5021203, 1, 0, 0.9843137, 1,
1.01598, 0.8683606, -0.2526968, 1, 0, 0.9764706, 1,
1.016133, 0.4258795, 1.528814, 1, 0, 0.972549, 1,
1.016488, -0.1393433, 0.8114509, 1, 0, 0.9647059, 1,
1.018042, -2.989377, 1.466491, 1, 0, 0.9607843, 1,
1.01863, 0.4717593, -0.2500408, 1, 0, 0.9529412, 1,
1.022032, -1.564632, 5.228188, 1, 0, 0.9490196, 1,
1.022607, 0.5155343, 2.868982, 1, 0, 0.9411765, 1,
1.031893, 0.8523866, 2.234392, 1, 0, 0.9372549, 1,
1.044012, -0.1350923, 3.545217, 1, 0, 0.9294118, 1,
1.051687, 0.8796418, 0.08357438, 1, 0, 0.9254902, 1,
1.056969, -0.9502447, 3.221362, 1, 0, 0.9176471, 1,
1.062404, 2.913764, 2.762348, 1, 0, 0.9137255, 1,
1.078386, -0.8507553, 1.123354, 1, 0, 0.9058824, 1,
1.086331, -0.471462, 2.036078, 1, 0, 0.9019608, 1,
1.087442, -0.7240884, -0.3189524, 1, 0, 0.8941177, 1,
1.090515, -0.3789752, 2.711737, 1, 0, 0.8862745, 1,
1.091021, 1.094649, 1.753853, 1, 0, 0.8823529, 1,
1.092449, 0.930049, -2.291846, 1, 0, 0.8745098, 1,
1.094591, 0.7743621, -0.5664738, 1, 0, 0.8705882, 1,
1.097728, 2.216586, 0.914427, 1, 0, 0.8627451, 1,
1.098746, 0.4304528, 1.823094, 1, 0, 0.8588235, 1,
1.104377, -1.243563, 2.765463, 1, 0, 0.8509804, 1,
1.109175, 0.3696385, 2.046674, 1, 0, 0.8470588, 1,
1.111274, 1.513762, 0.09141034, 1, 0, 0.8392157, 1,
1.113697, 0.7527854, 1.315247, 1, 0, 0.8352941, 1,
1.117048, 0.3436565, 2.832022, 1, 0, 0.827451, 1,
1.119561, -0.08690161, 2.34649, 1, 0, 0.8235294, 1,
1.128724, 0.7468454, 1.142471, 1, 0, 0.8156863, 1,
1.13156, -0.3556245, 2.020322, 1, 0, 0.8117647, 1,
1.133971, 0.5373605, 0.4378434, 1, 0, 0.8039216, 1,
1.140241, 1.380121, 0.9268565, 1, 0, 0.7960784, 1,
1.140684, -0.9522868, 1.874305, 1, 0, 0.7921569, 1,
1.140934, -0.1749191, 3.058807, 1, 0, 0.7843137, 1,
1.146935, -1.130755, 0.8597443, 1, 0, 0.7803922, 1,
1.148544, -0.2692518, 2.551718, 1, 0, 0.772549, 1,
1.168766, -0.3231972, 1.514069, 1, 0, 0.7686275, 1,
1.17338, 0.9755423, 1.019068, 1, 0, 0.7607843, 1,
1.181225, -0.4693218, 1.914444, 1, 0, 0.7568628, 1,
1.185557, -0.4869985, 1.209127, 1, 0, 0.7490196, 1,
1.187909, 0.3482282, -0.0160658, 1, 0, 0.7450981, 1,
1.19722, 0.2572781, 1.199801, 1, 0, 0.7372549, 1,
1.198856, -0.2754109, 1.874776, 1, 0, 0.7333333, 1,
1.20752, -0.9004258, 1.091052, 1, 0, 0.7254902, 1,
1.209467, -1.094895, 2.222913, 1, 0, 0.7215686, 1,
1.215575, 0.8009992, 2.017277, 1, 0, 0.7137255, 1,
1.216951, -1.326011, 0.7630979, 1, 0, 0.7098039, 1,
1.219195, 1.249358, 0.1861802, 1, 0, 0.7019608, 1,
1.221818, 0.5324323, -1.78933, 1, 0, 0.6941177, 1,
1.236063, -0.4771823, 2.13573, 1, 0, 0.6901961, 1,
1.237186, 1.534808, -0.6120086, 1, 0, 0.682353, 1,
1.237558, 0.3152078, 0.488538, 1, 0, 0.6784314, 1,
1.244938, 0.6155161, 0.4681677, 1, 0, 0.6705883, 1,
1.246428, -0.5819739, 2.293157, 1, 0, 0.6666667, 1,
1.250575, -0.6648524, 1.574822, 1, 0, 0.6588235, 1,
1.250884, -2.159621, 2.351737, 1, 0, 0.654902, 1,
1.253329, -1.513641, 1.340596, 1, 0, 0.6470588, 1,
1.255818, -0.9470844, 4.00246, 1, 0, 0.6431373, 1,
1.256609, 1.488769, -0.4680226, 1, 0, 0.6352941, 1,
1.267121, -1.344656, 4.256021, 1, 0, 0.6313726, 1,
1.270054, 0.9972087, -0.4428096, 1, 0, 0.6235294, 1,
1.273872, -0.2036077, 2.250331, 1, 0, 0.6196079, 1,
1.275375, -1.542743, 2.513206, 1, 0, 0.6117647, 1,
1.278095, -1.657455, 2.783731, 1, 0, 0.6078432, 1,
1.279922, -0.4478258, 1.893736, 1, 0, 0.6, 1,
1.292066, 0.864146, 0.8491867, 1, 0, 0.5921569, 1,
1.300242, -0.3508641, 3.13089, 1, 0, 0.5882353, 1,
1.312046, -0.116496, 2.161493, 1, 0, 0.5803922, 1,
1.316868, -0.4654027, 1.281811, 1, 0, 0.5764706, 1,
1.317772, 0.5083449, 1.133188, 1, 0, 0.5686275, 1,
1.32424, -0.418661, 1.099075, 1, 0, 0.5647059, 1,
1.324327, -0.2092542, 1.550434, 1, 0, 0.5568628, 1,
1.32527, -1.250361, 3.280937, 1, 0, 0.5529412, 1,
1.32727, -1.446847, 4.044735, 1, 0, 0.5450981, 1,
1.33368, 0.3274567, -0.3066356, 1, 0, 0.5411765, 1,
1.344713, 0.02298053, 2.714238, 1, 0, 0.5333334, 1,
1.37427, -0.7821181, 0.434023, 1, 0, 0.5294118, 1,
1.374292, -0.6403032, 2.594834, 1, 0, 0.5215687, 1,
1.387759, -1.433735, 1.454903, 1, 0, 0.5176471, 1,
1.401394, 0.5027986, 0.6525283, 1, 0, 0.509804, 1,
1.401768, -0.02477065, 2.060401, 1, 0, 0.5058824, 1,
1.404865, -2.268096, 2.869961, 1, 0, 0.4980392, 1,
1.407889, 0.1316344, 2.690453, 1, 0, 0.4901961, 1,
1.412454, -0.6947381, 1.907329, 1, 0, 0.4862745, 1,
1.417151, 0.3127982, 0.7868696, 1, 0, 0.4784314, 1,
1.425277, -0.8763971, 2.451032, 1, 0, 0.4745098, 1,
1.448377, 0.6623242, 1.979521, 1, 0, 0.4666667, 1,
1.461665, -0.04070185, 1.711329, 1, 0, 0.4627451, 1,
1.469921, 0.02065934, 2.450428, 1, 0, 0.454902, 1,
1.474205, -0.2646106, 1.985448, 1, 0, 0.4509804, 1,
1.480262, 0.1648037, 2.177022, 1, 0, 0.4431373, 1,
1.486365, -0.2373672, 0.4812255, 1, 0, 0.4392157, 1,
1.487292, 0.3684624, -0.1077502, 1, 0, 0.4313726, 1,
1.489454, 1.279009, 1.538447, 1, 0, 0.427451, 1,
1.493814, -0.0002824033, 1.87041, 1, 0, 0.4196078, 1,
1.49887, 1.232089, 0.5981108, 1, 0, 0.4156863, 1,
1.502181, -0.2290745, 0.3645479, 1, 0, 0.4078431, 1,
1.510046, -0.3914048, 0.5661112, 1, 0, 0.4039216, 1,
1.527523, -0.5830127, 4.251418, 1, 0, 0.3960784, 1,
1.529321, -0.11629, 2.395033, 1, 0, 0.3882353, 1,
1.551607, -0.4563327, 3.219898, 1, 0, 0.3843137, 1,
1.561582, -0.09163439, 2.070831, 1, 0, 0.3764706, 1,
1.564862, -0.6829385, -0.00438774, 1, 0, 0.372549, 1,
1.58384, 0.3940251, 2.808228, 1, 0, 0.3647059, 1,
1.594465, -0.03956105, -0.3800845, 1, 0, 0.3607843, 1,
1.594838, 0.5358515, 3.09234, 1, 0, 0.3529412, 1,
1.606075, 0.2629256, 2.952791, 1, 0, 0.3490196, 1,
1.624822, -0.4730729, 2.601717, 1, 0, 0.3411765, 1,
1.625151, 0.2350202, 2.387372, 1, 0, 0.3372549, 1,
1.62888, 0.6558589, -0.4914432, 1, 0, 0.3294118, 1,
1.629672, -0.4453732, 2.414648, 1, 0, 0.3254902, 1,
1.630859, -0.8494682, 2.47659, 1, 0, 0.3176471, 1,
1.648843, -0.6179476, 2.781561, 1, 0, 0.3137255, 1,
1.661578, 0.01847757, 1.866145, 1, 0, 0.3058824, 1,
1.66665, -1.499204, 0.9689992, 1, 0, 0.2980392, 1,
1.675262, -0.2805792, 1.017664, 1, 0, 0.2941177, 1,
1.684187, 0.4914982, 1.725391, 1, 0, 0.2862745, 1,
1.691987, -1.696116, 2.716787, 1, 0, 0.282353, 1,
1.707018, 0.3603341, 0.3468009, 1, 0, 0.2745098, 1,
1.709838, -1.957087, 3.750474, 1, 0, 0.2705882, 1,
1.711693, -0.04559797, 0.02679584, 1, 0, 0.2627451, 1,
1.723798, 1.203275, 0.2898666, 1, 0, 0.2588235, 1,
1.725171, -0.08857914, 1.034601, 1, 0, 0.2509804, 1,
1.755416, -1.383206, 2.307543, 1, 0, 0.2470588, 1,
1.757526, 1.541696, 0.439908, 1, 0, 0.2392157, 1,
1.78429, -0.3892448, 3.426858, 1, 0, 0.2352941, 1,
1.817717, 1.123072, 1.138039, 1, 0, 0.227451, 1,
1.824477, 0.8712478, -0.136241, 1, 0, 0.2235294, 1,
1.825464, 2.475329, -0.2112223, 1, 0, 0.2156863, 1,
1.848673, 0.04737949, 1.862506, 1, 0, 0.2117647, 1,
1.849754, -1.860107, 0.3350916, 1, 0, 0.2039216, 1,
1.862578, -0.8543202, 2.971518, 1, 0, 0.1960784, 1,
1.885366, -0.6830161, 1.303203, 1, 0, 0.1921569, 1,
1.919672, 0.07096874, 2.825581, 1, 0, 0.1843137, 1,
1.924469, -0.2035518, 1.666941, 1, 0, 0.1803922, 1,
1.955195, 1.384881, 2.21213, 1, 0, 0.172549, 1,
2.033579, 0.05042882, 2.06086, 1, 0, 0.1686275, 1,
2.063899, -0.2500382, 1.123664, 1, 0, 0.1607843, 1,
2.086601, 0.726115, 0.1664758, 1, 0, 0.1568628, 1,
2.09153, 0.1887795, 0.8284335, 1, 0, 0.1490196, 1,
2.093413, 0.2373611, 1.714365, 1, 0, 0.145098, 1,
2.105613, 1.702411, -0.2726468, 1, 0, 0.1372549, 1,
2.119487, -1.789601, 2.465538, 1, 0, 0.1333333, 1,
2.126545, 0.373555, 1.024631, 1, 0, 0.1254902, 1,
2.162673, 0.0194154, 1.959936, 1, 0, 0.1215686, 1,
2.164383, -0.3763545, 2.366168, 1, 0, 0.1137255, 1,
2.203301, -3.33302, 1.921204, 1, 0, 0.1098039, 1,
2.226185, 0.2969067, 3.789483, 1, 0, 0.1019608, 1,
2.249387, 1.572207, 1.691117, 1, 0, 0.09411765, 1,
2.262, 1.250382, -0.4240929, 1, 0, 0.09019608, 1,
2.26727, 0.3078359, 0.9757683, 1, 0, 0.08235294, 1,
2.32847, -0.5592522, 2.294027, 1, 0, 0.07843138, 1,
2.361138, 0.7232685, 0.5079703, 1, 0, 0.07058824, 1,
2.37091, 0.5838255, 0.1492002, 1, 0, 0.06666667, 1,
2.388896, 0.8374762, 0.5126434, 1, 0, 0.05882353, 1,
2.394443, 1.36817, -0.6363477, 1, 0, 0.05490196, 1,
2.43634, 0.9187994, 0.4116292, 1, 0, 0.04705882, 1,
2.502941, -0.4891724, 2.666283, 1, 0, 0.04313726, 1,
2.530705, 1.399917, 0.987918, 1, 0, 0.03529412, 1,
2.553746, 0.3014736, 0.9788106, 1, 0, 0.03137255, 1,
2.625313, 0.2271001, 1.672582, 1, 0, 0.02352941, 1,
2.735656, 0.415177, -0.1846522, 1, 0, 0.01960784, 1,
2.791843, 1.10835, 3.211988, 1, 0, 0.01176471, 1,
3.036169, -2.721428, 2.192096, 1, 0, 0.007843138, 1
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
0.008865595, -4.47155, -7.934489, 0, -0.5, 0.5, 0.5,
0.008865595, -4.47155, -7.934489, 1, -0.5, 0.5, 0.5,
0.008865595, -4.47155, -7.934489, 1, 1.5, 0.5, 0.5,
0.008865595, -4.47155, -7.934489, 0, 1.5, 0.5, 0.5
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
-4.044693, 0.02547324, -7.934489, 0, -0.5, 0.5, 0.5,
-4.044693, 0.02547324, -7.934489, 1, -0.5, 0.5, 0.5,
-4.044693, 0.02547324, -7.934489, 1, 1.5, 0.5, 0.5,
-4.044693, 0.02547324, -7.934489, 0, 1.5, 0.5, 0.5
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
-4.044693, -4.47155, -0.2489247, 0, -0.5, 0.5, 0.5,
-4.044693, -4.47155, -0.2489247, 1, -0.5, 0.5, 0.5,
-4.044693, -4.47155, -0.2489247, 1, 1.5, 0.5, 0.5,
-4.044693, -4.47155, -0.2489247, 0, 1.5, 0.5, 0.5
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
-3, -3.433775, -6.160898,
3, -3.433775, -6.160898,
-3, -3.433775, -6.160898,
-3, -3.606737, -6.456496,
-2, -3.433775, -6.160898,
-2, -3.606737, -6.456496,
-1, -3.433775, -6.160898,
-1, -3.606737, -6.456496,
0, -3.433775, -6.160898,
0, -3.606737, -6.456496,
1, -3.433775, -6.160898,
1, -3.606737, -6.456496,
2, -3.433775, -6.160898,
2, -3.606737, -6.456496,
3, -3.433775, -6.160898,
3, -3.606737, -6.456496
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
-3, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
-3, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
-3, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
-3, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
-2, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
-2, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
-2, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
-2, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
-1, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
-1, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
-1, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
-1, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
0, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
0, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
0, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
0, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
1, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
1, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
1, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
1, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
2, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
2, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
2, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
2, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5,
3, -3.952662, -7.047694, 0, -0.5, 0.5, 0.5,
3, -3.952662, -7.047694, 1, -0.5, 0.5, 0.5,
3, -3.952662, -7.047694, 1, 1.5, 0.5, 0.5,
3, -3.952662, -7.047694, 0, 1.5, 0.5, 0.5
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
-3.109257, -3, -6.160898,
-3.109257, 3, -6.160898,
-3.109257, -3, -6.160898,
-3.265163, -3, -6.456496,
-3.109257, -2, -6.160898,
-3.265163, -2, -6.456496,
-3.109257, -1, -6.160898,
-3.265163, -1, -6.456496,
-3.109257, 0, -6.160898,
-3.265163, 0, -6.456496,
-3.109257, 1, -6.160898,
-3.265163, 1, -6.456496,
-3.109257, 2, -6.160898,
-3.265163, 2, -6.456496,
-3.109257, 3, -6.160898,
-3.265163, 3, -6.456496
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
-3.576975, -3, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, -3, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, -3, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, -3, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, -2, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, -2, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, -2, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, -2, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, -1, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, -1, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, -1, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, -1, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, 0, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, 0, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, 0, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, 0, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, 1, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, 1, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, 1, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, 1, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, 2, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, 2, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, 2, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, 2, -7.047694, 0, 1.5, 0.5, 0.5,
-3.576975, 3, -7.047694, 0, -0.5, 0.5, 0.5,
-3.576975, 3, -7.047694, 1, -0.5, 0.5, 0.5,
-3.576975, 3, -7.047694, 1, 1.5, 0.5, 0.5,
-3.576975, 3, -7.047694, 0, 1.5, 0.5, 0.5
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
-3.109257, -3.433775, -4,
-3.109257, -3.433775, 4,
-3.109257, -3.433775, -4,
-3.265163, -3.606737, -4,
-3.109257, -3.433775, -2,
-3.265163, -3.606737, -2,
-3.109257, -3.433775, 0,
-3.265163, -3.606737, 0,
-3.109257, -3.433775, 2,
-3.265163, -3.606737, 2,
-3.109257, -3.433775, 4,
-3.265163, -3.606737, 4
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
-3.576975, -3.952662, -4, 0, -0.5, 0.5, 0.5,
-3.576975, -3.952662, -4, 1, -0.5, 0.5, 0.5,
-3.576975, -3.952662, -4, 1, 1.5, 0.5, 0.5,
-3.576975, -3.952662, -4, 0, 1.5, 0.5, 0.5,
-3.576975, -3.952662, -2, 0, -0.5, 0.5, 0.5,
-3.576975, -3.952662, -2, 1, -0.5, 0.5, 0.5,
-3.576975, -3.952662, -2, 1, 1.5, 0.5, 0.5,
-3.576975, -3.952662, -2, 0, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 0, 0, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 0, 1, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 0, 1, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 0, 0, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 2, 0, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 2, 1, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 2, 1, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 2, 0, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 4, 0, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 4, 1, -0.5, 0.5, 0.5,
-3.576975, -3.952662, 4, 1, 1.5, 0.5, 0.5,
-3.576975, -3.952662, 4, 0, 1.5, 0.5, 0.5
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
-3.109257, -3.433775, -6.160898,
-3.109257, 3.484721, -6.160898,
-3.109257, -3.433775, 5.663048,
-3.109257, 3.484721, 5.663048,
-3.109257, -3.433775, -6.160898,
-3.109257, -3.433775, 5.663048,
-3.109257, 3.484721, -6.160898,
-3.109257, 3.484721, 5.663048,
-3.109257, -3.433775, -6.160898,
3.126988, -3.433775, -6.160898,
-3.109257, -3.433775, 5.663048,
3.126988, -3.433775, 5.663048,
-3.109257, 3.484721, -6.160898,
3.126988, 3.484721, -6.160898,
-3.109257, 3.484721, 5.663048,
3.126988, 3.484721, 5.663048,
3.126988, -3.433775, -6.160898,
3.126988, 3.484721, -6.160898,
3.126988, -3.433775, 5.663048,
3.126988, 3.484721, 5.663048,
3.126988, -3.433775, -6.160898,
3.126988, -3.433775, 5.663048,
3.126988, 3.484721, -6.160898,
3.126988, 3.484721, 5.663048
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
var radius = 8.037464;
var distance = 35.75958;
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
mvMatrix.translate( -0.008865595, -0.02547324, 0.2489247 );
mvMatrix.scale( 1.393509, 1.256091, 0.7349715 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75958);
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
imazamethabenz<-read.table("imazamethabenz.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazamethabenz$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
y<-imazamethabenz$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
z<-imazamethabenz$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
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
-3.018438, -1.036793, -3.106078, 0, 0, 1, 1, 1,
-2.900514, -0.2518902, -2.973107, 1, 0, 0, 1, 1,
-2.586143, -0.6654007, -1.717478, 1, 0, 0, 1, 1,
-2.517623, -0.1900016, -1.546609, 1, 0, 0, 1, 1,
-2.445115, 1.617525, -3.243308, 1, 0, 0, 1, 1,
-2.390631, 1.284657, -2.118064, 1, 0, 0, 1, 1,
-2.320025, 1.622046, -0.1386664, 0, 0, 0, 1, 1,
-2.306825, 1.362993, -1.035554, 0, 0, 0, 1, 1,
-2.285627, 1.301703, -1.792449, 0, 0, 0, 1, 1,
-2.26249, -0.1205266, -2.076328, 0, 0, 0, 1, 1,
-2.244622, 0.1800224, -1.055529, 0, 0, 0, 1, 1,
-2.180937, -0.006338097, -2.683339, 0, 0, 0, 1, 1,
-2.153109, -1.229159, -2.11334, 0, 0, 0, 1, 1,
-2.112591, 0.966473, -0.8330777, 1, 1, 1, 1, 1,
-2.071514, 1.550417, -1.33075, 1, 1, 1, 1, 1,
-2.063624, 1.117274, 1.420924, 1, 1, 1, 1, 1,
-2.03966, -0.6210946, -2.84468, 1, 1, 1, 1, 1,
-2.027773, -1.619146, -1.282788, 1, 1, 1, 1, 1,
-1.98314, -0.09168584, -1.925522, 1, 1, 1, 1, 1,
-1.954246, 1.224343, -2.316234, 1, 1, 1, 1, 1,
-1.935597, -0.7944332, -2.40548, 1, 1, 1, 1, 1,
-1.917565, 0.2840768, 0.1768194, 1, 1, 1, 1, 1,
-1.894701, 0.5319923, -0.2467521, 1, 1, 1, 1, 1,
-1.869205, 0.9687108, -1.572464, 1, 1, 1, 1, 1,
-1.836964, 1.330603, 0.00815487, 1, 1, 1, 1, 1,
-1.803531, -1.845048, -2.135095, 1, 1, 1, 1, 1,
-1.800935, -0.2079786, -1.974508, 1, 1, 1, 1, 1,
-1.777948, 0.1052686, -2.038386, 1, 1, 1, 1, 1,
-1.764198, -0.2588399, -0.927735, 0, 0, 1, 1, 1,
-1.73697, -0.6268327, -2.082731, 1, 0, 0, 1, 1,
-1.732846, 0.809022, -0.07874358, 1, 0, 0, 1, 1,
-1.727052, -1.642916, -2.149717, 1, 0, 0, 1, 1,
-1.709799, -0.9401772, -1.391027, 1, 0, 0, 1, 1,
-1.709567, 0.1858021, -2.301669, 1, 0, 0, 1, 1,
-1.687037, -1.245979, -0.5366186, 0, 0, 0, 1, 1,
-1.685687, -0.6568627, -3.720741, 0, 0, 0, 1, 1,
-1.669861, -0.7706681, -0.9303612, 0, 0, 0, 1, 1,
-1.669419, 0.7597457, -1.744648, 0, 0, 0, 1, 1,
-1.657242, -0.01031793, -3.204402, 0, 0, 0, 1, 1,
-1.642358, -0.661693, -1.176635, 0, 0, 0, 1, 1,
-1.630899, 1.127533, -1.124745, 0, 0, 0, 1, 1,
-1.623218, -0.8459411, -2.598963, 1, 1, 1, 1, 1,
-1.608844, 0.8838207, -0.4593926, 1, 1, 1, 1, 1,
-1.604337, 1.420215, -1.743376, 1, 1, 1, 1, 1,
-1.603893, -1.513427, -2.449663, 1, 1, 1, 1, 1,
-1.597952, -0.62528, -1.246126, 1, 1, 1, 1, 1,
-1.597445, 0.02250396, -1.016557, 1, 1, 1, 1, 1,
-1.592323, 0.01765362, -3.025016, 1, 1, 1, 1, 1,
-1.536232, -0.2917469, -0.6802109, 1, 1, 1, 1, 1,
-1.530541, 0.1815715, -2.194527, 1, 1, 1, 1, 1,
-1.510175, 1.287513, -0.4058308, 1, 1, 1, 1, 1,
-1.498307, -0.5786201, -1.277933, 1, 1, 1, 1, 1,
-1.489481, 0.6169429, -1.281072, 1, 1, 1, 1, 1,
-1.475671, -0.2362562, -3.423361, 1, 1, 1, 1, 1,
-1.47353, 0.9058031, -2.830377, 1, 1, 1, 1, 1,
-1.46914, -0.03100451, 0.06130477, 1, 1, 1, 1, 1,
-1.468218, -0.3608024, -1.595197, 0, 0, 1, 1, 1,
-1.461889, -1.316225, -2.980504, 1, 0, 0, 1, 1,
-1.448818, 0.1072769, -1.143427, 1, 0, 0, 1, 1,
-1.444109, -1.120804, -0.9843004, 1, 0, 0, 1, 1,
-1.442412, 0.567982, -0.8611821, 1, 0, 0, 1, 1,
-1.440519, 0.2031681, -1.067516, 1, 0, 0, 1, 1,
-1.435062, 0.8239571, -1.003733, 0, 0, 0, 1, 1,
-1.434582, -0.1023619, -0.7201591, 0, 0, 0, 1, 1,
-1.428218, 0.8403306, -0.7312042, 0, 0, 0, 1, 1,
-1.427927, -1.549141, -3.339413, 0, 0, 0, 1, 1,
-1.425876, -0.3557007, -2.887763, 0, 0, 0, 1, 1,
-1.422848, 1.544704, -1.258012, 0, 0, 0, 1, 1,
-1.419345, -1.094563, -0.8403028, 0, 0, 0, 1, 1,
-1.41859, -1.334759, -1.050799, 1, 1, 1, 1, 1,
-1.41162, -0.1512105, -2.332557, 1, 1, 1, 1, 1,
-1.407516, 0.03908903, -2.709006, 1, 1, 1, 1, 1,
-1.406828, 0.7464607, -0.6524751, 1, 1, 1, 1, 1,
-1.402829, -0.9186925, -2.29721, 1, 1, 1, 1, 1,
-1.402065, 0.9741783, 0.7391473, 1, 1, 1, 1, 1,
-1.393252, -1.025973, -0.5189818, 1, 1, 1, 1, 1,
-1.383674, -0.5331947, -1.076438, 1, 1, 1, 1, 1,
-1.377865, 1.658079, -1.337427, 1, 1, 1, 1, 1,
-1.36306, 0.5541876, -1.948359, 1, 1, 1, 1, 1,
-1.354832, 0.9155511, -0.9989375, 1, 1, 1, 1, 1,
-1.350546, -0.6675335, -2.253954, 1, 1, 1, 1, 1,
-1.336138, 0.7726792, -1.096803, 1, 1, 1, 1, 1,
-1.325477, 0.1215154, -1.892192, 1, 1, 1, 1, 1,
-1.323143, -0.9851831, -2.991175, 1, 1, 1, 1, 1,
-1.319185, 0.4254576, -1.602046, 0, 0, 1, 1, 1,
-1.313517, -1.358384, -1.946301, 1, 0, 0, 1, 1,
-1.310995, 0.5639771, -1.590577, 1, 0, 0, 1, 1,
-1.305928, 0.1214401, -0.6932365, 1, 0, 0, 1, 1,
-1.304949, -0.7997668, -2.718893, 1, 0, 0, 1, 1,
-1.299481, -0.4045038, -0.7327822, 1, 0, 0, 1, 1,
-1.290199, 1.847613, 1.548199, 0, 0, 0, 1, 1,
-1.289333, -0.3245278, -2.625651, 0, 0, 0, 1, 1,
-1.289214, 1.981548, -0.617588, 0, 0, 0, 1, 1,
-1.281201, -1.009308, -1.738853, 0, 0, 0, 1, 1,
-1.277461, 1.155496, -1.50669, 0, 0, 0, 1, 1,
-1.262651, 0.2690237, -1.489099, 0, 0, 0, 1, 1,
-1.228336, -0.6441885, -4.040627, 0, 0, 0, 1, 1,
-1.221386, 0.7676339, -1.455667, 1, 1, 1, 1, 1,
-1.22059, 0.6762189, -0.8991956, 1, 1, 1, 1, 1,
-1.218763, -1.306687, -4.936306, 1, 1, 1, 1, 1,
-1.21541, -0.09325471, -0.865528, 1, 1, 1, 1, 1,
-1.215234, 0.1699308, 0.4096542, 1, 1, 1, 1, 1,
-1.215118, -0.5953659, -2.428763, 1, 1, 1, 1, 1,
-1.214841, 0.3679265, 0.690924, 1, 1, 1, 1, 1,
-1.210109, -1.439023, -4.494444, 1, 1, 1, 1, 1,
-1.202311, 0.3335376, 0.8477736, 1, 1, 1, 1, 1,
-1.199643, -0.5253621, -0.9376324, 1, 1, 1, 1, 1,
-1.196168, 0.5674208, -1.838947, 1, 1, 1, 1, 1,
-1.17319, -0.4452843, -2.765383, 1, 1, 1, 1, 1,
-1.172024, -1.043608, 0.3295874, 1, 1, 1, 1, 1,
-1.164283, 0.2174706, -0.8190283, 1, 1, 1, 1, 1,
-1.155453, -2.286315, -1.414697, 1, 1, 1, 1, 1,
-1.141896, 1.666011, -0.9347472, 0, 0, 1, 1, 1,
-1.140431, -1.250317, -2.598025, 1, 0, 0, 1, 1,
-1.134641, -0.5267091, -0.5975024, 1, 0, 0, 1, 1,
-1.13414, 0.4518538, -1.68733, 1, 0, 0, 1, 1,
-1.134057, -0.7734514, 0.1377269, 1, 0, 0, 1, 1,
-1.133199, 1.2849, 0.1788048, 1, 0, 0, 1, 1,
-1.132869, 0.9323656, -0.6603963, 0, 0, 0, 1, 1,
-1.132038, 1.715699, -0.9547871, 0, 0, 0, 1, 1,
-1.129318, -0.1313494, -1.255466, 0, 0, 0, 1, 1,
-1.129099, 0.696237, -0.980876, 0, 0, 0, 1, 1,
-1.124064, 1.468111, -0.03644648, 0, 0, 0, 1, 1,
-1.121651, 1.006114, -1.742761, 0, 0, 0, 1, 1,
-1.119714, -0.6291094, -2.81596, 0, 0, 0, 1, 1,
-1.108725, -2.01558, -2.896197, 1, 1, 1, 1, 1,
-1.106438, 0.4508163, -2.147293, 1, 1, 1, 1, 1,
-1.099738, -1.15669, -2.217178, 1, 1, 1, 1, 1,
-1.095173, -1.671182, -2.348638, 1, 1, 1, 1, 1,
-1.094945, -1.501876, -1.547074, 1, 1, 1, 1, 1,
-1.082532, 0.3469656, -0.8582977, 1, 1, 1, 1, 1,
-1.080966, 0.3421482, -1.715488, 1, 1, 1, 1, 1,
-1.080954, 0.3378934, -1.213801, 1, 1, 1, 1, 1,
-1.080428, -0.6347418, -3.961915, 1, 1, 1, 1, 1,
-1.078773, 0.6050823, -0.06587574, 1, 1, 1, 1, 1,
-1.072854, -0.4941578, 1.068982, 1, 1, 1, 1, 1,
-1.067057, -1.053743, -2.092616, 1, 1, 1, 1, 1,
-1.066368, -1.875822, -2.552862, 1, 1, 1, 1, 1,
-1.062414, 0.4601824, -1.545943, 1, 1, 1, 1, 1,
-1.049933, 0.462572, 0.4017871, 1, 1, 1, 1, 1,
-1.047154, -0.2257927, -2.521125, 0, 0, 1, 1, 1,
-1.043197, -0.1397624, -2.581976, 1, 0, 0, 1, 1,
-1.031181, -0.01803191, -1.423728, 1, 0, 0, 1, 1,
-1.027712, -1.490842, -3.120019, 1, 0, 0, 1, 1,
-1.019686, -0.2716426, -1.854017, 1, 0, 0, 1, 1,
-1.009838, 0.653168, -2.555487, 1, 0, 0, 1, 1,
-0.9989151, -1.179204, -2.10996, 0, 0, 0, 1, 1,
-0.9963638, -0.7122177, -3.187011, 0, 0, 0, 1, 1,
-0.9957669, -0.2258351, -1.096695, 0, 0, 0, 1, 1,
-0.9941192, -0.2694491, -2.096426, 0, 0, 0, 1, 1,
-0.9873478, -0.3277901, -2.329188, 0, 0, 0, 1, 1,
-0.9839749, -0.5019495, -2.114733, 0, 0, 0, 1, 1,
-0.9803542, 0.1111326, 0.1417969, 0, 0, 0, 1, 1,
-0.9782812, 0.2221814, -1.319653, 1, 1, 1, 1, 1,
-0.9720688, 1.140867, 0.926531, 1, 1, 1, 1, 1,
-0.9711438, 2.061497, -2.020945, 1, 1, 1, 1, 1,
-0.9624872, 1.023537, -1.177046, 1, 1, 1, 1, 1,
-0.9612611, -0.334803, -1.299198, 1, 1, 1, 1, 1,
-0.958737, 0.1993302, -0.3049158, 1, 1, 1, 1, 1,
-0.9457623, -2.009346, -3.842126, 1, 1, 1, 1, 1,
-0.9418167, 0.05426122, -1.258927, 1, 1, 1, 1, 1,
-0.9377103, 0.5044018, -0.5525054, 1, 1, 1, 1, 1,
-0.9377091, 0.3860798, -2.767768, 1, 1, 1, 1, 1,
-0.9330854, 1.977646, -1.186997, 1, 1, 1, 1, 1,
-0.9325555, -1.973911, -2.230863, 1, 1, 1, 1, 1,
-0.9294157, -1.110421, -0.7348251, 1, 1, 1, 1, 1,
-0.9210664, -1.012471, -2.97699, 1, 1, 1, 1, 1,
-0.9143255, 0.8205084, -0.5480746, 1, 1, 1, 1, 1,
-0.9138075, -0.818339, -1.722438, 0, 0, 1, 1, 1,
-0.9110252, -0.538532, -0.6145209, 1, 0, 0, 1, 1,
-0.9020921, -0.09630266, -2.72578, 1, 0, 0, 1, 1,
-0.896313, 0.4964933, -1.264031, 1, 0, 0, 1, 1,
-0.8954007, 1.28898, 0.5761675, 1, 0, 0, 1, 1,
-0.8937947, -0.1954199, -1.861228, 1, 0, 0, 1, 1,
-0.8894274, 2.260525, 0.1712927, 0, 0, 0, 1, 1,
-0.8827111, -0.4297819, -1.168478, 0, 0, 0, 1, 1,
-0.8813224, -1.080448, -2.058983, 0, 0, 0, 1, 1,
-0.8747514, -2.184115, -4.589592, 0, 0, 0, 1, 1,
-0.8732207, -0.7763107, -3.166892, 0, 0, 0, 1, 1,
-0.8720672, -0.6709506, -3.11343, 0, 0, 0, 1, 1,
-0.8712333, 0.4440262, 0.008293399, 0, 0, 0, 1, 1,
-0.8646007, -1.323954, -3.116559, 1, 1, 1, 1, 1,
-0.8601046, -1.163813, -2.045771, 1, 1, 1, 1, 1,
-0.8573093, -1.979175, -3.326941, 1, 1, 1, 1, 1,
-0.8548405, -0.4223596, -1.059931, 1, 1, 1, 1, 1,
-0.8526647, 0.4809934, -1.302572, 1, 1, 1, 1, 1,
-0.8501282, -0.5472743, -1.626858, 1, 1, 1, 1, 1,
-0.8467424, -2.31905, -4.167541, 1, 1, 1, 1, 1,
-0.845731, -0.8037456, -1.0362, 1, 1, 1, 1, 1,
-0.8443959, -2.32154, -3.06858, 1, 1, 1, 1, 1,
-0.8432782, 0.2723461, -1.702654, 1, 1, 1, 1, 1,
-0.8422323, -1.305352, -2.88303, 1, 1, 1, 1, 1,
-0.8346429, 1.014073, -0.5130977, 1, 1, 1, 1, 1,
-0.8121746, -0.6685966, -4.574147, 1, 1, 1, 1, 1,
-0.8091613, 0.9400512, -0.3569582, 1, 1, 1, 1, 1,
-0.8088657, 0.3258349, 0.2036217, 1, 1, 1, 1, 1,
-0.806242, 0.5164195, -0.6630538, 0, 0, 1, 1, 1,
-0.7912018, 0.2447777, -0.6998194, 1, 0, 0, 1, 1,
-0.7899969, 1.206628, -0.3399613, 1, 0, 0, 1, 1,
-0.7867613, 0.1805186, -0.9997712, 1, 0, 0, 1, 1,
-0.7824574, -2.087594, -1.332981, 1, 0, 0, 1, 1,
-0.7681636, -0.4450701, -0.6647658, 1, 0, 0, 1, 1,
-0.768118, 0.2579945, -0.7592943, 0, 0, 0, 1, 1,
-0.7661636, -0.02158691, -2.872858, 0, 0, 0, 1, 1,
-0.7614989, 1.538474, 1.833657, 0, 0, 0, 1, 1,
-0.7610034, -0.6294523, -2.413226, 0, 0, 0, 1, 1,
-0.7602279, 0.5416719, -2.24542, 0, 0, 0, 1, 1,
-0.7598823, 0.8832522, -2.454655, 0, 0, 0, 1, 1,
-0.7578354, 0.4596495, 0.02642642, 0, 0, 0, 1, 1,
-0.7571639, -0.4517776, -2.537747, 1, 1, 1, 1, 1,
-0.7552147, 0.4016906, -1.655623, 1, 1, 1, 1, 1,
-0.7513327, -1.508132, -2.164935, 1, 1, 1, 1, 1,
-0.7412046, 0.4602177, 0.2336055, 1, 1, 1, 1, 1,
-0.7396191, 1.40216, -0.520331, 1, 1, 1, 1, 1,
-0.7391006, -1.258531, -3.734358, 1, 1, 1, 1, 1,
-0.7376238, -1.21797, -3.197406, 1, 1, 1, 1, 1,
-0.7271623, -0.2445742, -1.112088, 1, 1, 1, 1, 1,
-0.7233661, 0.3929925, -1.725399, 1, 1, 1, 1, 1,
-0.7202654, -1.145607, -1.141568, 1, 1, 1, 1, 1,
-0.7186267, 0.6824427, -0.9449674, 1, 1, 1, 1, 1,
-0.7104343, 0.1675972, -0.7888497, 1, 1, 1, 1, 1,
-0.7091134, 0.2276512, -1.928983, 1, 1, 1, 1, 1,
-0.7022439, -0.5404544, -2.14928, 1, 1, 1, 1, 1,
-0.7021624, 1.149767, 0.7490009, 1, 1, 1, 1, 1,
-0.6958005, 0.4808366, -1.034206, 0, 0, 1, 1, 1,
-0.6951934, -0.9638291, -2.154333, 1, 0, 0, 1, 1,
-0.6951915, 0.3370977, -1.717864, 1, 0, 0, 1, 1,
-0.6900414, 1.7023, -1.30757, 1, 0, 0, 1, 1,
-0.6867084, -0.2524359, -0.3041562, 1, 0, 0, 1, 1,
-0.6818671, -0.8261313, -2.207382, 1, 0, 0, 1, 1,
-0.6796259, -0.2347585, -1.489157, 0, 0, 0, 1, 1,
-0.6728951, 0.1268379, -0.871394, 0, 0, 0, 1, 1,
-0.6696739, -1.559727, 0.1799335, 0, 0, 0, 1, 1,
-0.6636608, 0.8876315, -0.9726853, 0, 0, 0, 1, 1,
-0.6615117, -0.04762761, -3.598285, 0, 0, 0, 1, 1,
-0.65964, 1.113879, -1.005664, 0, 0, 0, 1, 1,
-0.6467997, 2.076898, -0.4704409, 0, 0, 0, 1, 1,
-0.6443836, 3.383967, 0.3019782, 1, 1, 1, 1, 1,
-0.6434419, 1.43079, 0.6407918, 1, 1, 1, 1, 1,
-0.6434032, -1.121781, -1.673514, 1, 1, 1, 1, 1,
-0.6337484, 0.1445172, -2.992785, 1, 1, 1, 1, 1,
-0.6260892, 0.6511109, -1.214779, 1, 1, 1, 1, 1,
-0.6255831, 0.8867344, -0.9634635, 1, 1, 1, 1, 1,
-0.6249615, -2.211556, -2.971666, 1, 1, 1, 1, 1,
-0.6240078, 0.2556163, -1.050532, 1, 1, 1, 1, 1,
-0.6235078, -0.4892759, -1.797685, 1, 1, 1, 1, 1,
-0.6201968, -0.1176277, -0.1138571, 1, 1, 1, 1, 1,
-0.6177704, 0.7579117, -1.862317, 1, 1, 1, 1, 1,
-0.6118312, 1.211498, -0.6198779, 1, 1, 1, 1, 1,
-0.6098163, 1.462519, -0.4358131, 1, 1, 1, 1, 1,
-0.6097092, 0.7099891, -0.1975087, 1, 1, 1, 1, 1,
-0.6080562, -1.486109, -4.523183, 1, 1, 1, 1, 1,
-0.6029917, -0.08729708, -2.273644, 0, 0, 1, 1, 1,
-0.5949475, 0.04627192, -1.385635, 1, 0, 0, 1, 1,
-0.5945249, -1.086675, -3.904374, 1, 0, 0, 1, 1,
-0.5876802, 1.842861, -0.7537274, 1, 0, 0, 1, 1,
-0.5874466, 0.2005745, -0.588525, 1, 0, 0, 1, 1,
-0.5849448, 0.3234441, 0.2359634, 1, 0, 0, 1, 1,
-0.5804924, -0.8772169, -2.759947, 0, 0, 0, 1, 1,
-0.575938, 0.3243442, -0.947555, 0, 0, 0, 1, 1,
-0.5753026, -1.074723, -1.681052, 0, 0, 0, 1, 1,
-0.5700222, 1.450039, -0.1057608, 0, 0, 0, 1, 1,
-0.5671929, -0.1142842, -2.416332, 0, 0, 0, 1, 1,
-0.5655182, 1.876473, -1.567012, 0, 0, 0, 1, 1,
-0.5637792, -1.063408, -1.261026, 0, 0, 0, 1, 1,
-0.5583044, 1.531734, -0.8220086, 1, 1, 1, 1, 1,
-0.5543146, 0.4740713, -0.3431983, 1, 1, 1, 1, 1,
-0.5503115, 0.1502233, -2.71425, 1, 1, 1, 1, 1,
-0.5497783, -0.1944748, -0.3205415, 1, 1, 1, 1, 1,
-0.5440428, -0.09530277, -1.205201, 1, 1, 1, 1, 1,
-0.5415938, 0.2146324, -0.4072833, 1, 1, 1, 1, 1,
-0.5364817, 0.1942456, -2.060801, 1, 1, 1, 1, 1,
-0.5289601, -0.4548111, -1.695123, 1, 1, 1, 1, 1,
-0.5260304, 1.082455, -0.582275, 1, 1, 1, 1, 1,
-0.5249963, -0.8471765, -3.646862, 1, 1, 1, 1, 1,
-0.5189313, 0.5936701, -0.2181702, 1, 1, 1, 1, 1,
-0.5091029, 1.47264, -0.6527995, 1, 1, 1, 1, 1,
-0.5085127, -0.2405455, -0.03199667, 1, 1, 1, 1, 1,
-0.5048922, -1.027377, -2.217653, 1, 1, 1, 1, 1,
-0.5039873, 1.222219, 1.964675, 1, 1, 1, 1, 1,
-0.5003042, -1.076398, -2.524628, 0, 0, 1, 1, 1,
-0.4997546, -0.7198113, -1.098867, 1, 0, 0, 1, 1,
-0.4979302, -0.1372914, -3.199733, 1, 0, 0, 1, 1,
-0.4962293, -0.5220279, -2.270162, 1, 0, 0, 1, 1,
-0.4936216, -0.1977719, -2.820306, 1, 0, 0, 1, 1,
-0.476103, -0.9491868, -2.832954, 1, 0, 0, 1, 1,
-0.474558, -0.2431636, -4.781413, 0, 0, 0, 1, 1,
-0.4685196, -0.2469702, -1.11562, 0, 0, 0, 1, 1,
-0.4670088, -1.099622, -2.944375, 0, 0, 0, 1, 1,
-0.4659933, -2.410431, -4.26511, 0, 0, 0, 1, 1,
-0.456875, -0.06966118, -1.219546, 0, 0, 0, 1, 1,
-0.4469779, 0.3511242, 1.17321, 0, 0, 0, 1, 1,
-0.4459204, -0.3308282, -3.044975, 0, 0, 0, 1, 1,
-0.4454904, -0.5235228, -1.823541, 1, 1, 1, 1, 1,
-0.4437846, 1.00105, -0.5111366, 1, 1, 1, 1, 1,
-0.4423788, -0.7937949, -2.931392, 1, 1, 1, 1, 1,
-0.440914, -0.1644684, -0.5114703, 1, 1, 1, 1, 1,
-0.4372468, -0.7076665, -2.145442, 1, 1, 1, 1, 1,
-0.4354427, 0.05444596, -2.103033, 1, 1, 1, 1, 1,
-0.4331231, -0.5277317, -0.4461699, 1, 1, 1, 1, 1,
-0.4288076, -0.4028232, -2.881869, 1, 1, 1, 1, 1,
-0.4275398, -0.1938913, -2.356467, 1, 1, 1, 1, 1,
-0.4270258, -1.054734, -1.828566, 1, 1, 1, 1, 1,
-0.4256305, 0.807656, 0.49444, 1, 1, 1, 1, 1,
-0.4253548, -1.06513, -3.655911, 1, 1, 1, 1, 1,
-0.4233853, -0.3363269, -2.600425, 1, 1, 1, 1, 1,
-0.4208514, -1.246091, -4.090691, 1, 1, 1, 1, 1,
-0.4194549, -1.187065, -4.063631, 1, 1, 1, 1, 1,
-0.4151292, 0.1268114, -0.6611996, 0, 0, 1, 1, 1,
-0.4138581, -0.01996315, 0.7361721, 1, 0, 0, 1, 1,
-0.4128507, -0.07448278, -1.981565, 1, 0, 0, 1, 1,
-0.4116035, 0.2955498, -2.005265, 1, 0, 0, 1, 1,
-0.4090484, 0.2885292, -1.116127, 1, 0, 0, 1, 1,
-0.4003025, -1.103818, -2.859792, 1, 0, 0, 1, 1,
-0.3936105, -0.264267, -0.9285929, 0, 0, 0, 1, 1,
-0.393313, -0.9923688, -2.72576, 0, 0, 0, 1, 1,
-0.3865097, -2.982208, -4.047617, 0, 0, 0, 1, 1,
-0.3859889, -0.6450164, -1.843364, 0, 0, 0, 1, 1,
-0.3857888, -0.01949267, -0.9233613, 0, 0, 0, 1, 1,
-0.3842296, 0.7022427, -1.066858, 0, 0, 0, 1, 1,
-0.3814624, -0.513666, -1.525885, 0, 0, 0, 1, 1,
-0.3810616, 0.3050083, 0.3202461, 1, 1, 1, 1, 1,
-0.3771194, -1.093925, -2.497371, 1, 1, 1, 1, 1,
-0.3746141, 1.460827, -0.4815097, 1, 1, 1, 1, 1,
-0.3727989, -0.6493213, -2.485603, 1, 1, 1, 1, 1,
-0.3718366, -0.08720452, -2.138638, 1, 1, 1, 1, 1,
-0.3689085, -0.2284715, -2.840658, 1, 1, 1, 1, 1,
-0.3670674, 1.657568, 1.014891, 1, 1, 1, 1, 1,
-0.3615832, -1.483443, -2.66981, 1, 1, 1, 1, 1,
-0.3591698, 0.5177181, -0.6234363, 1, 1, 1, 1, 1,
-0.3540286, -0.03663916, -3.797821, 1, 1, 1, 1, 1,
-0.3517687, 0.1838099, -1.470886, 1, 1, 1, 1, 1,
-0.3475873, 0.5387574, -1.300822, 1, 1, 1, 1, 1,
-0.3473394, 1.315156, -0.9136541, 1, 1, 1, 1, 1,
-0.3453071, 0.5832691, -0.1726814, 1, 1, 1, 1, 1,
-0.3372433, 0.1744583, -2.980505, 1, 1, 1, 1, 1,
-0.3341933, -1.19074, -2.373257, 0, 0, 1, 1, 1,
-0.3332494, 0.8823057, -0.1366812, 1, 0, 0, 1, 1,
-0.3320919, 1.009387, -0.8722115, 1, 0, 0, 1, 1,
-0.3284474, 1.418719, -0.8479064, 1, 0, 0, 1, 1,
-0.3278669, 0.2545074, 0.5266551, 1, 0, 0, 1, 1,
-0.327698, 0.5300269, -0.8877947, 1, 0, 0, 1, 1,
-0.327214, -0.6600052, -3.537519, 0, 0, 0, 1, 1,
-0.3247982, 0.01955844, -0.7483897, 0, 0, 0, 1, 1,
-0.3226264, 0.7829666, -0.2642359, 0, 0, 0, 1, 1,
-0.3178248, -0.5375878, -2.645909, 0, 0, 0, 1, 1,
-0.3149861, -0.3792155, -2.204821, 0, 0, 0, 1, 1,
-0.3139668, 1.467977, -0.08948627, 0, 0, 0, 1, 1,
-0.310459, -0.4298399, -3.784585, 0, 0, 0, 1, 1,
-0.3053641, -0.7001448, -2.778309, 1, 1, 1, 1, 1,
-0.3052587, -0.4752721, -4.022775, 1, 1, 1, 1, 1,
-0.3047903, 0.5065994, -1.823804, 1, 1, 1, 1, 1,
-0.3032365, 0.3427308, 0.2057962, 1, 1, 1, 1, 1,
-0.3017179, -0.5729146, -0.8723664, 1, 1, 1, 1, 1,
-0.2979839, -2.079151, -0.5753066, 1, 1, 1, 1, 1,
-0.2954006, 0.1117143, -2.276892, 1, 1, 1, 1, 1,
-0.2949082, 0.1485985, -1.866132, 1, 1, 1, 1, 1,
-0.2888303, -0.4056587, -2.448104, 1, 1, 1, 1, 1,
-0.2856818, -0.04677746, -0.9247003, 1, 1, 1, 1, 1,
-0.2850904, -0.199826, -1.356337, 1, 1, 1, 1, 1,
-0.2840266, -0.1496429, -3.463946, 1, 1, 1, 1, 1,
-0.2832586, -0.9719164, -3.532663, 1, 1, 1, 1, 1,
-0.279679, 0.5498324, -0.03409477, 1, 1, 1, 1, 1,
-0.2770441, -1.162065, -4.822802, 1, 1, 1, 1, 1,
-0.2736497, -0.902591, -2.285357, 0, 0, 1, 1, 1,
-0.2728736, -0.1914808, -3.125714, 1, 0, 0, 1, 1,
-0.2726056, 2.619977, -0.3616899, 1, 0, 0, 1, 1,
-0.271778, 2.073205, 1.115692, 1, 0, 0, 1, 1,
-0.2683318, -0.04359058, -2.537982, 1, 0, 0, 1, 1,
-0.2647148, 0.833483, -0.138551, 1, 0, 0, 1, 1,
-0.2608403, -0.2722943, -2.871396, 0, 0, 0, 1, 1,
-0.2593705, -3.070855, -4.637334, 0, 0, 0, 1, 1,
-0.2574806, -0.6031951, -1.911628, 0, 0, 0, 1, 1,
-0.2522605, -0.1333848, -2.3512, 0, 0, 0, 1, 1,
-0.247032, 0.144445, 0.1733996, 0, 0, 0, 1, 1,
-0.2445678, 0.007004585, -3.50086, 0, 0, 0, 1, 1,
-0.2435715, -1.07374, -3.149219, 0, 0, 0, 1, 1,
-0.242282, -0.3143851, -3.591779, 1, 1, 1, 1, 1,
-0.2417726, -1.781359, -2.969709, 1, 1, 1, 1, 1,
-0.2375043, 1.985361, 0.5734469, 1, 1, 1, 1, 1,
-0.2310881, 0.4694805, -0.7490551, 1, 1, 1, 1, 1,
-0.2296593, 1.477729, -0.5488423, 1, 1, 1, 1, 1,
-0.2251756, -0.6325408, -2.153852, 1, 1, 1, 1, 1,
-0.2240554, -0.4022241, -1.746764, 1, 1, 1, 1, 1,
-0.2221727, -1.249949, -3.158811, 1, 1, 1, 1, 1,
-0.219567, -0.2124918, -2.098866, 1, 1, 1, 1, 1,
-0.214075, 0.3860648, -0.1982727, 1, 1, 1, 1, 1,
-0.2132741, -0.8027686, -3.982796, 1, 1, 1, 1, 1,
-0.2079039, -0.4428413, -1.952114, 1, 1, 1, 1, 1,
-0.2050828, 0.26232, -0.588511, 1, 1, 1, 1, 1,
-0.2022059, 0.4548308, -1.193877, 1, 1, 1, 1, 1,
-0.2015485, -0.2816756, -2.846393, 1, 1, 1, 1, 1,
-0.2015214, -2.732946, -3.866521, 0, 0, 1, 1, 1,
-0.198638, 0.07432145, 0.5475325, 1, 0, 0, 1, 1,
-0.1948885, -0.259789, -2.545328, 1, 0, 0, 1, 1,
-0.1924618, 0.2093939, -1.775733, 1, 0, 0, 1, 1,
-0.1902172, -0.5953278, -3.114582, 1, 0, 0, 1, 1,
-0.1847191, 0.07688417, -1.457891, 1, 0, 0, 1, 1,
-0.1828785, -0.06062495, -1.149947, 0, 0, 0, 1, 1,
-0.1823567, -0.08288583, -2.293373, 0, 0, 0, 1, 1,
-0.1780169, 0.4979715, 0.7761865, 0, 0, 0, 1, 1,
-0.177215, 0.4489972, -1.338826, 0, 0, 0, 1, 1,
-0.1766279, -0.7530118, -2.88713, 0, 0, 0, 1, 1,
-0.1757599, -0.7212499, -5.760436, 0, 0, 0, 1, 1,
-0.1725252, 0.6639977, -0.6835846, 0, 0, 0, 1, 1,
-0.1721619, 2.740301, -1.911657, 1, 1, 1, 1, 1,
-0.1720098, 1.163602, -1.350331, 1, 1, 1, 1, 1,
-0.1681571, 1.674958, 0.9817727, 1, 1, 1, 1, 1,
-0.1641028, 0.2794476, 0.07797898, 1, 1, 1, 1, 1,
-0.1627752, -1.101025, -3.048011, 1, 1, 1, 1, 1,
-0.1514979, 0.9594668, -0.9997231, 1, 1, 1, 1, 1,
-0.1511793, -0.7018986, -3.065601, 1, 1, 1, 1, 1,
-0.1450634, -0.1945694, -0.8225562, 1, 1, 1, 1, 1,
-0.1444709, 1.342866, -1.366373, 1, 1, 1, 1, 1,
-0.14382, -0.9985221, -2.502258, 1, 1, 1, 1, 1,
-0.1422879, -0.3576404, -3.6195, 1, 1, 1, 1, 1,
-0.1385041, 0.8782179, 0.1991638, 1, 1, 1, 1, 1,
-0.1374601, -0.8389811, -3.088051, 1, 1, 1, 1, 1,
-0.1370801, -0.6801627, -3.392514, 1, 1, 1, 1, 1,
-0.1365132, 0.5121804, -0.2772471, 1, 1, 1, 1, 1,
-0.1353483, 0.2398678, 0.889358, 0, 0, 1, 1, 1,
-0.1341032, 0.07800676, -0.7978056, 1, 0, 0, 1, 1,
-0.1291905, -0.8647572, -2.460375, 1, 0, 0, 1, 1,
-0.1285295, -0.02076897, -0.1127029, 1, 0, 0, 1, 1,
-0.1279042, -0.2765101, -1.959764, 1, 0, 0, 1, 1,
-0.1272814, -0.3459764, -4.221116, 1, 0, 0, 1, 1,
-0.1262142, -0.08580463, -1.175516, 0, 0, 0, 1, 1,
-0.1255866, -0.3686356, -1.448231, 0, 0, 0, 1, 1,
-0.1255113, -0.6391387, -3.323357, 0, 0, 0, 1, 1,
-0.1213885, -0.03426946, -1.909866, 0, 0, 0, 1, 1,
-0.1196297, -2.157346, -1.907068, 0, 0, 0, 1, 1,
-0.1141783, -0.5656058, -2.914297, 0, 0, 0, 1, 1,
-0.1057302, 0.6154587, 0.4929232, 0, 0, 0, 1, 1,
-0.1054093, 1.040414, -0.1255616, 1, 1, 1, 1, 1,
-0.1053257, 0.3372007, -1.52493, 1, 1, 1, 1, 1,
-0.1038464, -0.7304491, -3.205062, 1, 1, 1, 1, 1,
-0.1023983, -1.623884, -2.999683, 1, 1, 1, 1, 1,
-0.1006697, 0.3455778, -0.04336968, 1, 1, 1, 1, 1,
-0.09754115, -0.2332121, -3.909781, 1, 1, 1, 1, 1,
-0.0968909, -0.1033925, -3.495214, 1, 1, 1, 1, 1,
-0.09658444, 0.5272097, -0.5370677, 1, 1, 1, 1, 1,
-0.09567501, -1.187481, -1.876182, 1, 1, 1, 1, 1,
-0.09380266, 1.302156, -0.7931461, 1, 1, 1, 1, 1,
-0.08661084, -1.049514, -4.038895, 1, 1, 1, 1, 1,
-0.07950412, 0.05269463, -0.574339, 1, 1, 1, 1, 1,
-0.07795397, -0.5631641, -1.057397, 1, 1, 1, 1, 1,
-0.07737159, 1.047995, -0.04533474, 1, 1, 1, 1, 1,
-0.07728924, -0.8421999, -3.410474, 1, 1, 1, 1, 1,
-0.07484482, -0.1944292, -3.612173, 0, 0, 1, 1, 1,
-0.0705651, -1.869579, -2.124519, 1, 0, 0, 1, 1,
-0.06823577, 2.154007, 0.820174, 1, 0, 0, 1, 1,
-0.06761738, -0.1077453, -3.241778, 1, 0, 0, 1, 1,
-0.06048307, 0.563114, -0.260558, 1, 0, 0, 1, 1,
-0.05991039, -0.2535736, -4.546497, 1, 0, 0, 1, 1,
-0.05886526, -1.054916, -3.318812, 0, 0, 0, 1, 1,
-0.05583008, 0.674368, 0.9790593, 0, 0, 0, 1, 1,
-0.05511879, 0.7001392, 0.4162239, 0, 0, 0, 1, 1,
-0.05256867, -0.1123001, -4.485368, 0, 0, 0, 1, 1,
-0.05145177, 0.2564205, -0.7749944, 0, 0, 0, 1, 1,
-0.04489602, 0.4428568, -0.7310604, 0, 0, 0, 1, 1,
-0.04371925, -0.9889342, -2.882289, 0, 0, 0, 1, 1,
-0.04236228, -0.3002047, -3.080771, 1, 1, 1, 1, 1,
-0.04210636, 1.610108, -0.1066261, 1, 1, 1, 1, 1,
-0.04030883, 0.9967688, 0.4272802, 1, 1, 1, 1, 1,
-0.03964807, 1.363827, 0.7706144, 1, 1, 1, 1, 1,
-0.03921604, 0.9672355, -0.08680136, 1, 1, 1, 1, 1,
-0.03733885, -1.596605, -2.314523, 1, 1, 1, 1, 1,
-0.03356725, 2.068348, 0.5677624, 1, 1, 1, 1, 1,
-0.03322813, -0.5756445, -2.813612, 1, 1, 1, 1, 1,
-0.03264471, -0.8429328, -5.988704, 1, 1, 1, 1, 1,
-0.02943919, 0.246878, 1.090654, 1, 1, 1, 1, 1,
-0.0280906, -0.2559941, -2.89006, 1, 1, 1, 1, 1,
-0.02612622, 0.1435001, 0.4504438, 1, 1, 1, 1, 1,
-0.02516767, -0.5996459, -0.7524444, 1, 1, 1, 1, 1,
-0.02146134, -1.909107, -3.392794, 1, 1, 1, 1, 1,
-0.02100806, 0.8508549, 0.4634942, 1, 1, 1, 1, 1,
-0.01925692, -0.7229606, -2.046278, 0, 0, 1, 1, 1,
-0.01850498, 1.104604, -0.1654065, 1, 0, 0, 1, 1,
-0.01035421, 1.48052, -0.2920513, 1, 0, 0, 1, 1,
-0.004845702, 0.3209637, 2.34859, 1, 0, 0, 1, 1,
-0.003630941, 0.4588561, 0.7533869, 1, 0, 0, 1, 1,
-0.001785632, 0.968738, 1.123369, 1, 0, 0, 1, 1,
-0.0007960129, -0.7723357, -2.514153, 0, 0, 0, 1, 1,
-0.0003078488, 0.500855, -0.3612424, 0, 0, 0, 1, 1,
0.003319459, 0.6168122, -1.179239, 0, 0, 0, 1, 1,
0.004594828, 0.06309711, 1.138476, 0, 0, 0, 1, 1,
0.005063185, 0.5333204, -0.4024563, 0, 0, 0, 1, 1,
0.005162602, 1.356702, -0.5644668, 0, 0, 0, 1, 1,
0.01524609, 0.3307581, 0.7570567, 0, 0, 0, 1, 1,
0.02320096, -0.8906941, 2.99155, 1, 1, 1, 1, 1,
0.02663593, -0.6058919, 3.576149, 1, 1, 1, 1, 1,
0.03423486, 1.146777, -0.1647736, 1, 1, 1, 1, 1,
0.03462347, 1.487864, -0.8243132, 1, 1, 1, 1, 1,
0.03546266, -0.8082227, 4.148503, 1, 1, 1, 1, 1,
0.03549531, -0.901498, 3.187245, 1, 1, 1, 1, 1,
0.0376261, 1.09607, 0.44462, 1, 1, 1, 1, 1,
0.03824683, 1.477094, -0.6727345, 1, 1, 1, 1, 1,
0.03871534, 0.9577782, -0.7372373, 1, 1, 1, 1, 1,
0.04014177, 0.1962049, 1.221655, 1, 1, 1, 1, 1,
0.0420758, -1.731843, 3.272522, 1, 1, 1, 1, 1,
0.05501891, -1.624457, 1.819822, 1, 1, 1, 1, 1,
0.05622612, -1.429583, 1.958868, 1, 1, 1, 1, 1,
0.05709112, -1.033627, 2.733043, 1, 1, 1, 1, 1,
0.05857467, -0.1340275, 1.193406, 1, 1, 1, 1, 1,
0.06100635, 0.7765391, 0.2562912, 0, 0, 1, 1, 1,
0.06357274, 0.6824338, 1.766628, 1, 0, 0, 1, 1,
0.06728096, -0.885738, 1.694401, 1, 0, 0, 1, 1,
0.07006218, 1.174941, 0.3768701, 1, 0, 0, 1, 1,
0.07179073, -0.4914061, 3.436294, 1, 0, 0, 1, 1,
0.0732268, 0.05946279, 0.5786248, 1, 0, 0, 1, 1,
0.07369457, -1.758706, 2.801666, 0, 0, 0, 1, 1,
0.07563567, 0.8987106, 0.3862958, 0, 0, 0, 1, 1,
0.07774779, 1.830381, 0.763672, 0, 0, 0, 1, 1,
0.07876327, -1.980352, 5.490855, 0, 0, 0, 1, 1,
0.08344837, 0.9575059, -1.00662, 0, 0, 0, 1, 1,
0.08418608, -0.1421475, 4.453288, 0, 0, 0, 1, 1,
0.08537632, 0.02102583, 0.4513946, 0, 0, 0, 1, 1,
0.0858899, 0.4959509, 0.03894504, 1, 1, 1, 1, 1,
0.08687269, 0.139901, 0.9904922, 1, 1, 1, 1, 1,
0.08971842, -0.1467683, 2.17823, 1, 1, 1, 1, 1,
0.1090805, -0.3743823, 3.367805, 1, 1, 1, 1, 1,
0.1104585, 1.072047, 2.00058, 1, 1, 1, 1, 1,
0.1131384, 1.547024, -2.525279, 1, 1, 1, 1, 1,
0.1137046, -0.9943711, 2.159196, 1, 1, 1, 1, 1,
0.1173866, 0.1475013, -0.8760751, 1, 1, 1, 1, 1,
0.1178817, -2.199863, 3.251194, 1, 1, 1, 1, 1,
0.1197255, 1.320297, -0.3461014, 1, 1, 1, 1, 1,
0.1210293, 0.01854481, 0.1218201, 1, 1, 1, 1, 1,
0.1233539, 0.8996425, -0.1131559, 1, 1, 1, 1, 1,
0.1331003, -0.7444971, 0.9803218, 1, 1, 1, 1, 1,
0.1333506, 1.296289, 0.4293917, 1, 1, 1, 1, 1,
0.1336571, 0.727978, -0.0201404, 1, 1, 1, 1, 1,
0.1341383, 1.001272, -2.064959, 0, 0, 1, 1, 1,
0.1415597, 0.3994379, -0.5016364, 1, 0, 0, 1, 1,
0.1459118, -0.6485755, 4.698189, 1, 0, 0, 1, 1,
0.1539831, -1.689647, 5.046908, 1, 0, 0, 1, 1,
0.1543794, 0.6190948, -0.3685288, 1, 0, 0, 1, 1,
0.1596267, -0.766775, 2.164195, 1, 0, 0, 1, 1,
0.1599326, 0.3688749, 1.109384, 0, 0, 0, 1, 1,
0.160238, 0.4103476, -2.413326, 0, 0, 0, 1, 1,
0.1608448, -1.107369, 2.50317, 0, 0, 0, 1, 1,
0.1609943, 0.2478898, 2.178468, 0, 0, 0, 1, 1,
0.1615259, -0.8701872, 4.81204, 0, 0, 0, 1, 1,
0.1640723, -0.9250256, 3.096668, 0, 0, 0, 1, 1,
0.1684023, 0.702155, -0.8402749, 0, 0, 0, 1, 1,
0.176155, 0.8555275, -0.0700966, 1, 1, 1, 1, 1,
0.1837537, 0.471564, 0.12174, 1, 1, 1, 1, 1,
0.1842812, 0.7284028, 0.5118306, 1, 1, 1, 1, 1,
0.1847244, 2.728445, 0.03081883, 1, 1, 1, 1, 1,
0.1853751, 2.104301, 0.9446397, 1, 1, 1, 1, 1,
0.1879659, 1.410393, -1.2951, 1, 1, 1, 1, 1,
0.1893355, -1.096231, 0.5046263, 1, 1, 1, 1, 1,
0.1895067, 2.026233, 0.1488114, 1, 1, 1, 1, 1,
0.1975357, 0.0418222, 2.683684, 1, 1, 1, 1, 1,
0.1980427, 0.4738081, 1.862433, 1, 1, 1, 1, 1,
0.2011848, -1.750681, 5.027305, 1, 1, 1, 1, 1,
0.2034872, -0.8993508, 2.470996, 1, 1, 1, 1, 1,
0.2057285, -0.03339795, 2.357132, 1, 1, 1, 1, 1,
0.2073737, -1.463726, 3.132408, 1, 1, 1, 1, 1,
0.2075249, -0.09857856, 1.685045, 1, 1, 1, 1, 1,
0.2126961, 1.270534, -1.227105, 0, 0, 1, 1, 1,
0.2143231, 1.002215, 0.8356029, 1, 0, 0, 1, 1,
0.2203325, 0.2579747, 1.159442, 1, 0, 0, 1, 1,
0.2206894, 0.9629117, -0.3718733, 1, 0, 0, 1, 1,
0.2207296, -1.413407, 3.998372, 1, 0, 0, 1, 1,
0.2230345, -0.8452122, 3.457715, 1, 0, 0, 1, 1,
0.2241357, -0.1530243, 0.9989299, 0, 0, 0, 1, 1,
0.2277108, 0.04837508, -0.7748124, 0, 0, 0, 1, 1,
0.2306212, -0.3011691, 3.60346, 0, 0, 0, 1, 1,
0.2325482, -1.442718, 1.947266, 0, 0, 0, 1, 1,
0.2384273, -0.03039346, 2.074532, 0, 0, 0, 1, 1,
0.2406267, -0.3936627, 2.807084, 0, 0, 0, 1, 1,
0.240947, -0.22346, 3.613779, 0, 0, 0, 1, 1,
0.2457447, 0.5105796, 2.236917, 1, 1, 1, 1, 1,
0.2470451, 0.1056324, 0.7641103, 1, 1, 1, 1, 1,
0.2479007, -0.8046895, 2.839551, 1, 1, 1, 1, 1,
0.2482419, -0.01896893, 0.3179117, 1, 1, 1, 1, 1,
0.2490824, -0.5847504, 2.812783, 1, 1, 1, 1, 1,
0.2492511, -0.4067137, 1.492382, 1, 1, 1, 1, 1,
0.2560944, 1.388321, -1.209347, 1, 1, 1, 1, 1,
0.2592793, -0.7893237, 2.531457, 1, 1, 1, 1, 1,
0.2603039, -0.464226, 3.920105, 1, 1, 1, 1, 1,
0.2611912, -1.565423, 2.996945, 1, 1, 1, 1, 1,
0.2625997, -0.1256398, 1.563186, 1, 1, 1, 1, 1,
0.2627276, 0.1210017, -0.570034, 1, 1, 1, 1, 1,
0.2661896, -0.03877087, 2.436154, 1, 1, 1, 1, 1,
0.2665446, 0.252535, 1.775797, 1, 1, 1, 1, 1,
0.2786852, 0.4185323, 1.987729, 1, 1, 1, 1, 1,
0.2811424, 0.58926, 0.7873502, 0, 0, 1, 1, 1,
0.282637, 0.3639453, 0.9987996, 1, 0, 0, 1, 1,
0.2835634, -0.2274779, 1.515369, 1, 0, 0, 1, 1,
0.2858621, 0.1017794, 1.919869, 1, 0, 0, 1, 1,
0.2897981, -1.210534, 3.908752, 1, 0, 0, 1, 1,
0.291254, 0.910237, -0.07977805, 1, 0, 0, 1, 1,
0.2933359, -1.961219, 3.731491, 0, 0, 0, 1, 1,
0.2973455, 0.5547391, -1.209896, 0, 0, 0, 1, 1,
0.2979599, -2.238633, 4.392796, 0, 0, 0, 1, 1,
0.2982555, -0.7178987, 4.803901, 0, 0, 0, 1, 1,
0.3007338, 0.6701354, -1.141111, 0, 0, 0, 1, 1,
0.3017569, 0.2745495, 0.9190241, 0, 0, 0, 1, 1,
0.3019527, 0.3162417, -0.003603294, 0, 0, 0, 1, 1,
0.3030502, -0.1241413, 2.259788, 1, 1, 1, 1, 1,
0.3046459, 2.739317, -1.023554, 1, 1, 1, 1, 1,
0.3086655, -0.4374592, 3.223081, 1, 1, 1, 1, 1,
0.3148537, 0.8716066, -1.640984, 1, 1, 1, 1, 1,
0.3153535, -1.741511, 2.178269, 1, 1, 1, 1, 1,
0.322159, -1.441326, 1.796232, 1, 1, 1, 1, 1,
0.3229635, -3.012059, 3.745026, 1, 1, 1, 1, 1,
0.32439, 0.2026705, 2.173974, 1, 1, 1, 1, 1,
0.3315265, -0.7467716, 1.069368, 1, 1, 1, 1, 1,
0.3415176, 0.5464101, -0.6644945, 1, 1, 1, 1, 1,
0.342497, -0.2890153, 2.052145, 1, 1, 1, 1, 1,
0.3449984, 0.651053, 1.224083, 1, 1, 1, 1, 1,
0.3467822, 1.605497, 0.863769, 1, 1, 1, 1, 1,
0.3487019, -1.02467, 3.920932, 1, 1, 1, 1, 1,
0.3529002, 1.085182, -0.8512127, 1, 1, 1, 1, 1,
0.3553085, 0.009060209, 1.616679, 0, 0, 1, 1, 1,
0.3570415, -0.6464853, 5.020237, 1, 0, 0, 1, 1,
0.3577537, 0.506231, 0.2292165, 1, 0, 0, 1, 1,
0.3590766, -1.184804, 1.550108, 1, 0, 0, 1, 1,
0.3602778, -0.8869576, 2.766049, 1, 0, 0, 1, 1,
0.3614496, 1.004481, 0.1196854, 1, 0, 0, 1, 1,
0.363549, -0.3388816, 2.141253, 0, 0, 0, 1, 1,
0.3647976, -0.1777288, 1.888321, 0, 0, 0, 1, 1,
0.3669049, 0.7232824, 1.486865, 0, 0, 0, 1, 1,
0.3687171, 1.348733, 1.344329, 0, 0, 0, 1, 1,
0.3687423, 0.3809435, 0.8797365, 0, 0, 0, 1, 1,
0.3694116, -0.415446, 3.063145, 0, 0, 0, 1, 1,
0.3714513, 0.3767853, 0.5637298, 0, 0, 0, 1, 1,
0.3757387, -1.169561, 1.763696, 1, 1, 1, 1, 1,
0.3789507, -2.219612, 1.387073, 1, 1, 1, 1, 1,
0.387727, -0.8579315, 0.2877621, 1, 1, 1, 1, 1,
0.3900187, -0.2219561, 1.529723, 1, 1, 1, 1, 1,
0.3910013, 0.1892249, 1.02819, 1, 1, 1, 1, 1,
0.3921839, -0.5325666, 4.362231, 1, 1, 1, 1, 1,
0.393773, -1.001449, 2.470462, 1, 1, 1, 1, 1,
0.3996846, 1.095105, 3.082042, 1, 1, 1, 1, 1,
0.4031108, -1.238248, 2.860542, 1, 1, 1, 1, 1,
0.4041939, 0.341448, 1.661438, 1, 1, 1, 1, 1,
0.4062992, -0.05952682, 2.17226, 1, 1, 1, 1, 1,
0.4165584, -0.7769983, 3.326234, 1, 1, 1, 1, 1,
0.4223615, -1.091389, 2.025988, 1, 1, 1, 1, 1,
0.4264024, 1.064783, -0.4037179, 1, 1, 1, 1, 1,
0.4300673, 0.7807826, 1.612257, 1, 1, 1, 1, 1,
0.433763, 0.283437, 1.807405, 0, 0, 1, 1, 1,
0.4383723, -0.9165898, 3.021443, 1, 0, 0, 1, 1,
0.4395715, -0.6520199, 0.5946739, 1, 0, 0, 1, 1,
0.4408754, -0.6855075, 3.231694, 1, 0, 0, 1, 1,
0.4490975, 1.148591, 1.429252, 1, 0, 0, 1, 1,
0.4525982, 3.010854, 0.09272251, 1, 0, 0, 1, 1,
0.4533495, -1.049538, 2.449545, 0, 0, 0, 1, 1,
0.4555919, -0.5581734, 1.496771, 0, 0, 0, 1, 1,
0.4587727, -0.9282961, 3.139374, 0, 0, 0, 1, 1,
0.4657224, 1.891334, -0.02462298, 0, 0, 0, 1, 1,
0.4666785, 0.145449, 2.345188, 0, 0, 0, 1, 1,
0.4682815, 0.03272484, 2.389193, 0, 0, 0, 1, 1,
0.4736392, -0.05464974, 1.704776, 0, 0, 0, 1, 1,
0.4774926, 0.07565916, 1.915417, 1, 1, 1, 1, 1,
0.4784874, 1.233945, 0.8651639, 1, 1, 1, 1, 1,
0.4794719, 0.9403588, 0.3136932, 1, 1, 1, 1, 1,
0.48002, 0.4544731, 0.2519921, 1, 1, 1, 1, 1,
0.4824499, 0.7482235, 2.477695, 1, 1, 1, 1, 1,
0.4829312, 0.7033907, 0.525596, 1, 1, 1, 1, 1,
0.4834344, 0.2233874, 2.677422, 1, 1, 1, 1, 1,
0.4845474, -0.7639146, 0.272254, 1, 1, 1, 1, 1,
0.489529, 0.4174871, 1.836665, 1, 1, 1, 1, 1,
0.4897315, -0.06906149, 2.48298, 1, 1, 1, 1, 1,
0.4911328, 0.05945866, 1.23816, 1, 1, 1, 1, 1,
0.4939904, -0.07624268, 2.498783, 1, 1, 1, 1, 1,
0.4969747, 0.9874315, -0.2857063, 1, 1, 1, 1, 1,
0.5008507, 1.809733, 1.47418, 1, 1, 1, 1, 1,
0.5029873, -0.2792633, 1.593237, 1, 1, 1, 1, 1,
0.5037779, 0.6338336, 0.8429694, 0, 0, 1, 1, 1,
0.5045376, -0.1801931, 1.249502, 1, 0, 0, 1, 1,
0.5140141, 0.7826478, 0.4678291, 1, 0, 0, 1, 1,
0.5177028, -0.43681, 1.771127, 1, 0, 0, 1, 1,
0.5220122, 1.134278, 0.8958983, 1, 0, 0, 1, 1,
0.5221263, -0.3207448, 3.766963, 1, 0, 0, 1, 1,
0.5260184, -0.1879196, 2.331108, 0, 0, 0, 1, 1,
0.5290102, -2.923497, 2.399156, 0, 0, 0, 1, 1,
0.5353858, 1.057025, 1.057704, 0, 0, 0, 1, 1,
0.5372349, 0.3342027, -0.01342242, 0, 0, 0, 1, 1,
0.5391983, 0.3807628, 1.94948, 0, 0, 0, 1, 1,
0.5464122, 0.3725629, 1.066775, 0, 0, 0, 1, 1,
0.5475622, -1.797841, 2.057589, 0, 0, 0, 1, 1,
0.549124, -0.8994982, 2.829196, 1, 1, 1, 1, 1,
0.5491657, -0.9398406, 2.319845, 1, 1, 1, 1, 1,
0.5495926, -0.2243064, 1.296185, 1, 1, 1, 1, 1,
0.5533347, -0.5977804, 1.880198, 1, 1, 1, 1, 1,
0.5542929, 0.2139135, 1.851637, 1, 1, 1, 1, 1,
0.5559313, -0.1670574, 0.519355, 1, 1, 1, 1, 1,
0.5561634, -0.7640706, 3.329227, 1, 1, 1, 1, 1,
0.5580522, 0.3991742, 1.565266, 1, 1, 1, 1, 1,
0.5619309, 0.3399433, 1.787646, 1, 1, 1, 1, 1,
0.5634632, -0.05582787, 2.014015, 1, 1, 1, 1, 1,
0.5641188, 1.219172, 0.3752486, 1, 1, 1, 1, 1,
0.5688498, 0.736431, 1.103712, 1, 1, 1, 1, 1,
0.5728693, 0.6901927, 1.493143, 1, 1, 1, 1, 1,
0.5758951, 0.4223534, 0.323678, 1, 1, 1, 1, 1,
0.5761931, 0.201089, 0.3050558, 1, 1, 1, 1, 1,
0.5771627, 1.811418, 1.78476, 0, 0, 1, 1, 1,
0.5790774, -0.6139612, 1.645217, 1, 0, 0, 1, 1,
0.5814727, 0.218769, 3.714015, 1, 0, 0, 1, 1,
0.5873052, -0.4324719, 4.378236, 1, 0, 0, 1, 1,
0.5881001, -0.7788798, 2.731279, 1, 0, 0, 1, 1,
0.5927004, -0.1482821, 2.732785, 1, 0, 0, 1, 1,
0.5927665, 0.7553287, 1.148544, 0, 0, 0, 1, 1,
0.5928198, -1.903364, 4.692304, 0, 0, 0, 1, 1,
0.5987602, 0.07908726, 1.628132, 0, 0, 0, 1, 1,
0.5998722, -1.80407, 3.714875, 0, 0, 0, 1, 1,
0.6031458, -0.9465221, -0.9436087, 0, 0, 0, 1, 1,
0.6079327, 0.5997339, -0.6588079, 0, 0, 0, 1, 1,
0.6107205, -0.7032403, 4.529031, 0, 0, 0, 1, 1,
0.6143387, -0.2835577, 0.9582442, 1, 1, 1, 1, 1,
0.6189713, 0.06376915, -0.07341646, 1, 1, 1, 1, 1,
0.6207472, -0.3690267, 2.347187, 1, 1, 1, 1, 1,
0.6290311, -1.329154, 3.698079, 1, 1, 1, 1, 1,
0.6299232, 0.8142166, -1.064728, 1, 1, 1, 1, 1,
0.6311761, 1.100496, 1.41996, 1, 1, 1, 1, 1,
0.6325033, 1.437977, 1.275796, 1, 1, 1, 1, 1,
0.6365808, 1.286943, -0.6880322, 1, 1, 1, 1, 1,
0.6370181, -2.662689, 2.815639, 1, 1, 1, 1, 1,
0.6373766, 1.252647, 1.0805, 1, 1, 1, 1, 1,
0.6413891, -0.5319611, 2.927648, 1, 1, 1, 1, 1,
0.6451283, -1.255923, 2.390038, 1, 1, 1, 1, 1,
0.6452536, 0.4222029, 1.5776, 1, 1, 1, 1, 1,
0.648221, -1.718952, 2.303428, 1, 1, 1, 1, 1,
0.6485841, 0.6763821, 2.431359, 1, 1, 1, 1, 1,
0.6501685, -0.5520279, 2.951426, 0, 0, 1, 1, 1,
0.6537519, 1.74399, 0.7287414, 1, 0, 0, 1, 1,
0.6560819, 0.06522954, 2.091793, 1, 0, 0, 1, 1,
0.6571213, -0.340545, 0.947456, 1, 0, 0, 1, 1,
0.6673346, 0.2930264, 1.635568, 1, 0, 0, 1, 1,
0.6799995, -2.321986, 3.082225, 1, 0, 0, 1, 1,
0.6842541, 0.3735369, 0.1251976, 0, 0, 0, 1, 1,
0.700709, 1.806238, -1.058577, 0, 0, 0, 1, 1,
0.7012058, 0.348218, -0.9123424, 0, 0, 0, 1, 1,
0.7024658, -1.175153, 2.737159, 0, 0, 0, 1, 1,
0.7066612, -0.2741151, 2.34031, 0, 0, 0, 1, 1,
0.7084957, 0.03537828, -0.02690751, 0, 0, 0, 1, 1,
0.7090099, -0.1847832, 3.166045, 0, 0, 0, 1, 1,
0.7196277, 0.5955896, 0.9466166, 1, 1, 1, 1, 1,
0.7216921, 0.1656824, 0.8805523, 1, 1, 1, 1, 1,
0.7241051, -2.499395, 3.625824, 1, 1, 1, 1, 1,
0.7330884, 0.9205129, 1.267389, 1, 1, 1, 1, 1,
0.7354649, 0.2562639, 0.6496698, 1, 1, 1, 1, 1,
0.7358783, 1.347861, 1.646885, 1, 1, 1, 1, 1,
0.736905, -0.2550363, 3.540838, 1, 1, 1, 1, 1,
0.7398003, -0.03008263, 0.5716324, 1, 1, 1, 1, 1,
0.7476647, -1.244942, 2.996583, 1, 1, 1, 1, 1,
0.7479138, 2.658607, -0.3412787, 1, 1, 1, 1, 1,
0.7539246, -0.2092929, 1.418728, 1, 1, 1, 1, 1,
0.7562274, 0.6621653, 0.4143923, 1, 1, 1, 1, 1,
0.7562283, 1.873235, 0.8345097, 1, 1, 1, 1, 1,
0.7572445, -0.8997167, 2.358539, 1, 1, 1, 1, 1,
0.7625791, -0.2213909, 2.053237, 1, 1, 1, 1, 1,
0.7627256, 0.2432886, 0.4740619, 0, 0, 1, 1, 1,
0.7640966, 1.176177, -1.157528, 1, 0, 0, 1, 1,
0.7748343, -0.8652255, 2.081722, 1, 0, 0, 1, 1,
0.7824153, -0.9609077, 3.525245, 1, 0, 0, 1, 1,
0.7847503, -0.8976242, 2.181223, 1, 0, 0, 1, 1,
0.7907052, 0.4456442, -0.4584205, 1, 0, 0, 1, 1,
0.7916327, 0.5508829, 1.880805, 0, 0, 0, 1, 1,
0.7921233, 0.2134439, 2.57885, 0, 0, 0, 1, 1,
0.7983134, -1.303394, 2.321701, 0, 0, 0, 1, 1,
0.799775, -0.8030578, 1.043439, 0, 0, 0, 1, 1,
0.8006924, 1.36757, 2.731649, 0, 0, 0, 1, 1,
0.8064328, 1.038198, 1.839798, 0, 0, 0, 1, 1,
0.8101617, 0.3686085, 1.434188, 0, 0, 0, 1, 1,
0.8102491, 0.1053004, 2.224263, 1, 1, 1, 1, 1,
0.8108017, 1.676363, -0.5635136, 1, 1, 1, 1, 1,
0.8144452, 0.4422682, 1.714594, 1, 1, 1, 1, 1,
0.8199794, 0.5677834, 1.891482, 1, 1, 1, 1, 1,
0.8293203, -0.475141, 2.55398, 1, 1, 1, 1, 1,
0.8334996, -0.5383155, 1.234758, 1, 1, 1, 1, 1,
0.8361517, -0.9125243, 1.648113, 1, 1, 1, 1, 1,
0.8364295, -1.293381, 2.472781, 1, 1, 1, 1, 1,
0.8366315, 0.1016691, 1.952136, 1, 1, 1, 1, 1,
0.8592308, -1.110918, 1.521223, 1, 1, 1, 1, 1,
0.8598567, -0.4506031, 4.134347, 1, 1, 1, 1, 1,
0.8613933, 0.1649782, 1.785062, 1, 1, 1, 1, 1,
0.862629, -0.437453, 2.464257, 1, 1, 1, 1, 1,
0.8715338, 0.2924006, 1.320898, 1, 1, 1, 1, 1,
0.8718542, 2.358635, 1.145787, 1, 1, 1, 1, 1,
0.8734795, 0.7727954, 2.392535, 0, 0, 1, 1, 1,
0.8758994, 0.3501488, -0.5427629, 1, 0, 0, 1, 1,
0.8800603, 0.1660475, 2.720631, 1, 0, 0, 1, 1,
0.8814189, 0.2479538, 0.05074318, 1, 0, 0, 1, 1,
0.8815685, -0.2094046, 0.7567464, 1, 0, 0, 1, 1,
0.8825234, 0.3868995, 1.320402, 1, 0, 0, 1, 1,
0.8842676, -1.023812, 1.99842, 0, 0, 0, 1, 1,
0.8874367, -1.020871, 2.668699, 0, 0, 0, 1, 1,
0.8896841, 2.025183, -0.9763285, 0, 0, 0, 1, 1,
0.897232, 1.803062, 1.983419, 0, 0, 0, 1, 1,
0.8973158, 1.625421, -0.3779251, 0, 0, 0, 1, 1,
0.8978443, 0.4435309, 1.222352, 0, 0, 0, 1, 1,
0.8983259, -0.3917595, 0.0272505, 0, 0, 0, 1, 1,
0.8994064, 0.9203944, 0.8615348, 1, 1, 1, 1, 1,
0.9000096, -0.7546687, 3.19583, 1, 1, 1, 1, 1,
0.9018164, 1.288923, 1.207282, 1, 1, 1, 1, 1,
0.9079163, 1.242966, 1.819305, 1, 1, 1, 1, 1,
0.9121736, 2.247631, 1.241586, 1, 1, 1, 1, 1,
0.9130454, -1.773582, 2.85263, 1, 1, 1, 1, 1,
0.9132725, 0.4682477, 3.287329, 1, 1, 1, 1, 1,
0.9157885, 0.5420624, 1.48137, 1, 1, 1, 1, 1,
0.9201576, 1.386093, 1.234668, 1, 1, 1, 1, 1,
0.9264125, -0.06782533, 2.532769, 1, 1, 1, 1, 1,
0.9283737, 0.6737581, 0.7431201, 1, 1, 1, 1, 1,
0.9287096, 1.246633, 1.125571, 1, 1, 1, 1, 1,
0.9299354, -1.009046, 3.798138, 1, 1, 1, 1, 1,
0.9310961, 1.216276, 1.423054, 1, 1, 1, 1, 1,
0.935469, -0.2870223, 2.15304, 1, 1, 1, 1, 1,
0.937783, -0.1293265, 1.541576, 0, 0, 1, 1, 1,
0.9428272, -0.5092562, 1.868016, 1, 0, 0, 1, 1,
0.9432201, -0.7035524, 2.478014, 1, 0, 0, 1, 1,
0.947369, 0.05269756, 1.364642, 1, 0, 0, 1, 1,
0.9515198, 1.183834, 0.9953993, 1, 0, 0, 1, 1,
0.9518547, 0.057808, 2.110334, 1, 0, 0, 1, 1,
0.9532327, 0.001397127, 1.236011, 0, 0, 0, 1, 1,
0.9546376, 0.6404819, 2.517371, 0, 0, 0, 1, 1,
0.9583148, 1.065071, 0.9418433, 0, 0, 0, 1, 1,
0.9600947, 0.510566, 3.983979, 0, 0, 0, 1, 1,
0.9631724, -0.4149914, 2.847564, 0, 0, 0, 1, 1,
0.9640461, 0.1428642, -0.1097944, 0, 0, 0, 1, 1,
0.9647741, -0.981116, 3.463455, 0, 0, 0, 1, 1,
0.9654486, 0.03048616, -0.4085283, 1, 1, 1, 1, 1,
0.9681616, 0.4373404, 1.887718, 1, 1, 1, 1, 1,
0.9713899, 0.9171257, 0.2636475, 1, 1, 1, 1, 1,
0.9768112, 1.863083, 0.3933764, 1, 1, 1, 1, 1,
0.9785142, 0.4162126, 1.114133, 1, 1, 1, 1, 1,
0.9844719, 0.112178, -0.8307555, 1, 1, 1, 1, 1,
0.9875976, 0.436568, 0.2196387, 1, 1, 1, 1, 1,
0.9984954, -0.3356108, 1.445979, 1, 1, 1, 1, 1,
0.9988238, -0.498167, 1.793326, 1, 1, 1, 1, 1,
1.008535, -0.7164727, 0.8727642, 1, 1, 1, 1, 1,
1.009014, -0.4196938, 1.906929, 1, 1, 1, 1, 1,
1.014725, 1.240936, -0.5021203, 1, 1, 1, 1, 1,
1.01598, 0.8683606, -0.2526968, 1, 1, 1, 1, 1,
1.016133, 0.4258795, 1.528814, 1, 1, 1, 1, 1,
1.016488, -0.1393433, 0.8114509, 1, 1, 1, 1, 1,
1.018042, -2.989377, 1.466491, 0, 0, 1, 1, 1,
1.01863, 0.4717593, -0.2500408, 1, 0, 0, 1, 1,
1.022032, -1.564632, 5.228188, 1, 0, 0, 1, 1,
1.022607, 0.5155343, 2.868982, 1, 0, 0, 1, 1,
1.031893, 0.8523866, 2.234392, 1, 0, 0, 1, 1,
1.044012, -0.1350923, 3.545217, 1, 0, 0, 1, 1,
1.051687, 0.8796418, 0.08357438, 0, 0, 0, 1, 1,
1.056969, -0.9502447, 3.221362, 0, 0, 0, 1, 1,
1.062404, 2.913764, 2.762348, 0, 0, 0, 1, 1,
1.078386, -0.8507553, 1.123354, 0, 0, 0, 1, 1,
1.086331, -0.471462, 2.036078, 0, 0, 0, 1, 1,
1.087442, -0.7240884, -0.3189524, 0, 0, 0, 1, 1,
1.090515, -0.3789752, 2.711737, 0, 0, 0, 1, 1,
1.091021, 1.094649, 1.753853, 1, 1, 1, 1, 1,
1.092449, 0.930049, -2.291846, 1, 1, 1, 1, 1,
1.094591, 0.7743621, -0.5664738, 1, 1, 1, 1, 1,
1.097728, 2.216586, 0.914427, 1, 1, 1, 1, 1,
1.098746, 0.4304528, 1.823094, 1, 1, 1, 1, 1,
1.104377, -1.243563, 2.765463, 1, 1, 1, 1, 1,
1.109175, 0.3696385, 2.046674, 1, 1, 1, 1, 1,
1.111274, 1.513762, 0.09141034, 1, 1, 1, 1, 1,
1.113697, 0.7527854, 1.315247, 1, 1, 1, 1, 1,
1.117048, 0.3436565, 2.832022, 1, 1, 1, 1, 1,
1.119561, -0.08690161, 2.34649, 1, 1, 1, 1, 1,
1.128724, 0.7468454, 1.142471, 1, 1, 1, 1, 1,
1.13156, -0.3556245, 2.020322, 1, 1, 1, 1, 1,
1.133971, 0.5373605, 0.4378434, 1, 1, 1, 1, 1,
1.140241, 1.380121, 0.9268565, 1, 1, 1, 1, 1,
1.140684, -0.9522868, 1.874305, 0, 0, 1, 1, 1,
1.140934, -0.1749191, 3.058807, 1, 0, 0, 1, 1,
1.146935, -1.130755, 0.8597443, 1, 0, 0, 1, 1,
1.148544, -0.2692518, 2.551718, 1, 0, 0, 1, 1,
1.168766, -0.3231972, 1.514069, 1, 0, 0, 1, 1,
1.17338, 0.9755423, 1.019068, 1, 0, 0, 1, 1,
1.181225, -0.4693218, 1.914444, 0, 0, 0, 1, 1,
1.185557, -0.4869985, 1.209127, 0, 0, 0, 1, 1,
1.187909, 0.3482282, -0.0160658, 0, 0, 0, 1, 1,
1.19722, 0.2572781, 1.199801, 0, 0, 0, 1, 1,
1.198856, -0.2754109, 1.874776, 0, 0, 0, 1, 1,
1.20752, -0.9004258, 1.091052, 0, 0, 0, 1, 1,
1.209467, -1.094895, 2.222913, 0, 0, 0, 1, 1,
1.215575, 0.8009992, 2.017277, 1, 1, 1, 1, 1,
1.216951, -1.326011, 0.7630979, 1, 1, 1, 1, 1,
1.219195, 1.249358, 0.1861802, 1, 1, 1, 1, 1,
1.221818, 0.5324323, -1.78933, 1, 1, 1, 1, 1,
1.236063, -0.4771823, 2.13573, 1, 1, 1, 1, 1,
1.237186, 1.534808, -0.6120086, 1, 1, 1, 1, 1,
1.237558, 0.3152078, 0.488538, 1, 1, 1, 1, 1,
1.244938, 0.6155161, 0.4681677, 1, 1, 1, 1, 1,
1.246428, -0.5819739, 2.293157, 1, 1, 1, 1, 1,
1.250575, -0.6648524, 1.574822, 1, 1, 1, 1, 1,
1.250884, -2.159621, 2.351737, 1, 1, 1, 1, 1,
1.253329, -1.513641, 1.340596, 1, 1, 1, 1, 1,
1.255818, -0.9470844, 4.00246, 1, 1, 1, 1, 1,
1.256609, 1.488769, -0.4680226, 1, 1, 1, 1, 1,
1.267121, -1.344656, 4.256021, 1, 1, 1, 1, 1,
1.270054, 0.9972087, -0.4428096, 0, 0, 1, 1, 1,
1.273872, -0.2036077, 2.250331, 1, 0, 0, 1, 1,
1.275375, -1.542743, 2.513206, 1, 0, 0, 1, 1,
1.278095, -1.657455, 2.783731, 1, 0, 0, 1, 1,
1.279922, -0.4478258, 1.893736, 1, 0, 0, 1, 1,
1.292066, 0.864146, 0.8491867, 1, 0, 0, 1, 1,
1.300242, -0.3508641, 3.13089, 0, 0, 0, 1, 1,
1.312046, -0.116496, 2.161493, 0, 0, 0, 1, 1,
1.316868, -0.4654027, 1.281811, 0, 0, 0, 1, 1,
1.317772, 0.5083449, 1.133188, 0, 0, 0, 1, 1,
1.32424, -0.418661, 1.099075, 0, 0, 0, 1, 1,
1.324327, -0.2092542, 1.550434, 0, 0, 0, 1, 1,
1.32527, -1.250361, 3.280937, 0, 0, 0, 1, 1,
1.32727, -1.446847, 4.044735, 1, 1, 1, 1, 1,
1.33368, 0.3274567, -0.3066356, 1, 1, 1, 1, 1,
1.344713, 0.02298053, 2.714238, 1, 1, 1, 1, 1,
1.37427, -0.7821181, 0.434023, 1, 1, 1, 1, 1,
1.374292, -0.6403032, 2.594834, 1, 1, 1, 1, 1,
1.387759, -1.433735, 1.454903, 1, 1, 1, 1, 1,
1.401394, 0.5027986, 0.6525283, 1, 1, 1, 1, 1,
1.401768, -0.02477065, 2.060401, 1, 1, 1, 1, 1,
1.404865, -2.268096, 2.869961, 1, 1, 1, 1, 1,
1.407889, 0.1316344, 2.690453, 1, 1, 1, 1, 1,
1.412454, -0.6947381, 1.907329, 1, 1, 1, 1, 1,
1.417151, 0.3127982, 0.7868696, 1, 1, 1, 1, 1,
1.425277, -0.8763971, 2.451032, 1, 1, 1, 1, 1,
1.448377, 0.6623242, 1.979521, 1, 1, 1, 1, 1,
1.461665, -0.04070185, 1.711329, 1, 1, 1, 1, 1,
1.469921, 0.02065934, 2.450428, 0, 0, 1, 1, 1,
1.474205, -0.2646106, 1.985448, 1, 0, 0, 1, 1,
1.480262, 0.1648037, 2.177022, 1, 0, 0, 1, 1,
1.486365, -0.2373672, 0.4812255, 1, 0, 0, 1, 1,
1.487292, 0.3684624, -0.1077502, 1, 0, 0, 1, 1,
1.489454, 1.279009, 1.538447, 1, 0, 0, 1, 1,
1.493814, -0.0002824033, 1.87041, 0, 0, 0, 1, 1,
1.49887, 1.232089, 0.5981108, 0, 0, 0, 1, 1,
1.502181, -0.2290745, 0.3645479, 0, 0, 0, 1, 1,
1.510046, -0.3914048, 0.5661112, 0, 0, 0, 1, 1,
1.527523, -0.5830127, 4.251418, 0, 0, 0, 1, 1,
1.529321, -0.11629, 2.395033, 0, 0, 0, 1, 1,
1.551607, -0.4563327, 3.219898, 0, 0, 0, 1, 1,
1.561582, -0.09163439, 2.070831, 1, 1, 1, 1, 1,
1.564862, -0.6829385, -0.00438774, 1, 1, 1, 1, 1,
1.58384, 0.3940251, 2.808228, 1, 1, 1, 1, 1,
1.594465, -0.03956105, -0.3800845, 1, 1, 1, 1, 1,
1.594838, 0.5358515, 3.09234, 1, 1, 1, 1, 1,
1.606075, 0.2629256, 2.952791, 1, 1, 1, 1, 1,
1.624822, -0.4730729, 2.601717, 1, 1, 1, 1, 1,
1.625151, 0.2350202, 2.387372, 1, 1, 1, 1, 1,
1.62888, 0.6558589, -0.4914432, 1, 1, 1, 1, 1,
1.629672, -0.4453732, 2.414648, 1, 1, 1, 1, 1,
1.630859, -0.8494682, 2.47659, 1, 1, 1, 1, 1,
1.648843, -0.6179476, 2.781561, 1, 1, 1, 1, 1,
1.661578, 0.01847757, 1.866145, 1, 1, 1, 1, 1,
1.66665, -1.499204, 0.9689992, 1, 1, 1, 1, 1,
1.675262, -0.2805792, 1.017664, 1, 1, 1, 1, 1,
1.684187, 0.4914982, 1.725391, 0, 0, 1, 1, 1,
1.691987, -1.696116, 2.716787, 1, 0, 0, 1, 1,
1.707018, 0.3603341, 0.3468009, 1, 0, 0, 1, 1,
1.709838, -1.957087, 3.750474, 1, 0, 0, 1, 1,
1.711693, -0.04559797, 0.02679584, 1, 0, 0, 1, 1,
1.723798, 1.203275, 0.2898666, 1, 0, 0, 1, 1,
1.725171, -0.08857914, 1.034601, 0, 0, 0, 1, 1,
1.755416, -1.383206, 2.307543, 0, 0, 0, 1, 1,
1.757526, 1.541696, 0.439908, 0, 0, 0, 1, 1,
1.78429, -0.3892448, 3.426858, 0, 0, 0, 1, 1,
1.817717, 1.123072, 1.138039, 0, 0, 0, 1, 1,
1.824477, 0.8712478, -0.136241, 0, 0, 0, 1, 1,
1.825464, 2.475329, -0.2112223, 0, 0, 0, 1, 1,
1.848673, 0.04737949, 1.862506, 1, 1, 1, 1, 1,
1.849754, -1.860107, 0.3350916, 1, 1, 1, 1, 1,
1.862578, -0.8543202, 2.971518, 1, 1, 1, 1, 1,
1.885366, -0.6830161, 1.303203, 1, 1, 1, 1, 1,
1.919672, 0.07096874, 2.825581, 1, 1, 1, 1, 1,
1.924469, -0.2035518, 1.666941, 1, 1, 1, 1, 1,
1.955195, 1.384881, 2.21213, 1, 1, 1, 1, 1,
2.033579, 0.05042882, 2.06086, 1, 1, 1, 1, 1,
2.063899, -0.2500382, 1.123664, 1, 1, 1, 1, 1,
2.086601, 0.726115, 0.1664758, 1, 1, 1, 1, 1,
2.09153, 0.1887795, 0.8284335, 1, 1, 1, 1, 1,
2.093413, 0.2373611, 1.714365, 1, 1, 1, 1, 1,
2.105613, 1.702411, -0.2726468, 1, 1, 1, 1, 1,
2.119487, -1.789601, 2.465538, 1, 1, 1, 1, 1,
2.126545, 0.373555, 1.024631, 1, 1, 1, 1, 1,
2.162673, 0.0194154, 1.959936, 0, 0, 1, 1, 1,
2.164383, -0.3763545, 2.366168, 1, 0, 0, 1, 1,
2.203301, -3.33302, 1.921204, 1, 0, 0, 1, 1,
2.226185, 0.2969067, 3.789483, 1, 0, 0, 1, 1,
2.249387, 1.572207, 1.691117, 1, 0, 0, 1, 1,
2.262, 1.250382, -0.4240929, 1, 0, 0, 1, 1,
2.26727, 0.3078359, 0.9757683, 0, 0, 0, 1, 1,
2.32847, -0.5592522, 2.294027, 0, 0, 0, 1, 1,
2.361138, 0.7232685, 0.5079703, 0, 0, 0, 1, 1,
2.37091, 0.5838255, 0.1492002, 0, 0, 0, 1, 1,
2.388896, 0.8374762, 0.5126434, 0, 0, 0, 1, 1,
2.394443, 1.36817, -0.6363477, 0, 0, 0, 1, 1,
2.43634, 0.9187994, 0.4116292, 0, 0, 0, 1, 1,
2.502941, -0.4891724, 2.666283, 1, 1, 1, 1, 1,
2.530705, 1.399917, 0.987918, 1, 1, 1, 1, 1,
2.553746, 0.3014736, 0.9788106, 1, 1, 1, 1, 1,
2.625313, 0.2271001, 1.672582, 1, 1, 1, 1, 1,
2.735656, 0.415177, -0.1846522, 1, 1, 1, 1, 1,
2.791843, 1.10835, 3.211988, 1, 1, 1, 1, 1,
3.036169, -2.721428, 2.192096, 1, 1, 1, 1, 1
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
var radius = 9.877992;
var distance = 34.69603;
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
mvMatrix.translate( -0.008865833, -0.02547312, 0.2489247 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69603);
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
