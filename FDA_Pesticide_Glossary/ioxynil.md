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
-3.279765, -1.186805, -2.377284, 1, 0, 0, 1,
-3.145706, 0.1471712, -0.07693898, 1, 0.007843138, 0, 1,
-3.005111, 0.2004061, -1.270949, 1, 0.01176471, 0, 1,
-2.834043, -1.477341, -4.22196, 1, 0.01960784, 0, 1,
-2.701136, -0.8451146, -1.098773, 1, 0.02352941, 0, 1,
-2.67904, -1.112286, -1.896689, 1, 0.03137255, 0, 1,
-2.57678, 1.241033, -0.45751, 1, 0.03529412, 0, 1,
-2.575148, -0.1205578, -0.5899166, 1, 0.04313726, 0, 1,
-2.543504, -1.018079, -2.730618, 1, 0.04705882, 0, 1,
-2.470844, -1.227301, -1.736064, 1, 0.05490196, 0, 1,
-2.413035, -0.1082599, -0.6845039, 1, 0.05882353, 0, 1,
-2.321217, 1.075866, -2.626611, 1, 0.06666667, 0, 1,
-2.276066, 0.1799504, -1.113899, 1, 0.07058824, 0, 1,
-2.252526, 1.094349, -0.4803947, 1, 0.07843138, 0, 1,
-2.234122, 0.5262296, -1.906549, 1, 0.08235294, 0, 1,
-2.122027, 0.2167188, -3.671089, 1, 0.09019608, 0, 1,
-2.087076, 0.8247213, -1.698718, 1, 0.09411765, 0, 1,
-2.002071, -1.753927, -1.363828, 1, 0.1019608, 0, 1,
-1.987248, 0.5631706, -0.2420233, 1, 0.1098039, 0, 1,
-1.981487, 0.673377, -1.342791, 1, 0.1137255, 0, 1,
-1.940587, -0.2330579, -2.792117, 1, 0.1215686, 0, 1,
-1.939408, 3.851848, -0.8916772, 1, 0.1254902, 0, 1,
-1.914516, -0.9621097, -2.456151, 1, 0.1333333, 0, 1,
-1.911376, -0.4148585, -2.64544, 1, 0.1372549, 0, 1,
-1.900481, -0.02726077, -1.972754, 1, 0.145098, 0, 1,
-1.890501, 1.259446, -0.8731307, 1, 0.1490196, 0, 1,
-1.859913, 1.376083, 0.2215138, 1, 0.1568628, 0, 1,
-1.835115, 1.547193, -0.314382, 1, 0.1607843, 0, 1,
-1.832113, -0.8052679, -2.838024, 1, 0.1686275, 0, 1,
-1.817084, 0.3498906, -1.258792, 1, 0.172549, 0, 1,
-1.79727, 1.688746, -1.181257, 1, 0.1803922, 0, 1,
-1.79216, -0.2928278, -1.524326, 1, 0.1843137, 0, 1,
-1.789171, 0.4729199, -2.755584, 1, 0.1921569, 0, 1,
-1.787428, 0.297932, -2.240952, 1, 0.1960784, 0, 1,
-1.759822, 0.8099157, -1.102353, 1, 0.2039216, 0, 1,
-1.74895, -0.002150472, -1.671506, 1, 0.2117647, 0, 1,
-1.725437, 0.4607851, -1.395572, 1, 0.2156863, 0, 1,
-1.707052, 0.7180572, -0.736266, 1, 0.2235294, 0, 1,
-1.688036, -2.290425, -2.072158, 1, 0.227451, 0, 1,
-1.687281, 0.5310467, -1.603646, 1, 0.2352941, 0, 1,
-1.66328, 1.162507, 1.306543, 1, 0.2392157, 0, 1,
-1.659155, -0.1717763, -2.326472, 1, 0.2470588, 0, 1,
-1.652788, 0.765784, -1.336426, 1, 0.2509804, 0, 1,
-1.635104, 0.206421, -1.49107, 1, 0.2588235, 0, 1,
-1.626108, -0.4247459, -3.048252, 1, 0.2627451, 0, 1,
-1.621006, -0.09791146, -1.658359, 1, 0.2705882, 0, 1,
-1.620305, 0.5991434, -1.127592, 1, 0.2745098, 0, 1,
-1.586886, 0.3329422, -2.792214, 1, 0.282353, 0, 1,
-1.583924, 0.8190174, -0.509582, 1, 0.2862745, 0, 1,
-1.577406, -0.6418407, -3.495064, 1, 0.2941177, 0, 1,
-1.574577, 1.883863, -0.9905052, 1, 0.3019608, 0, 1,
-1.566798, -0.3232539, -3.263775, 1, 0.3058824, 0, 1,
-1.565675, -0.8646795, -0.06598417, 1, 0.3137255, 0, 1,
-1.546959, 0.4559333, -0.3950492, 1, 0.3176471, 0, 1,
-1.545711, 0.8214658, -2.252932, 1, 0.3254902, 0, 1,
-1.543884, 1.539623, 0.3020491, 1, 0.3294118, 0, 1,
-1.542152, -1.496622, -2.059867, 1, 0.3372549, 0, 1,
-1.541259, -1.519197, -0.998835, 1, 0.3411765, 0, 1,
-1.533735, -0.7471836, -2.25701, 1, 0.3490196, 0, 1,
-1.5337, 0.05848628, -0.2014649, 1, 0.3529412, 0, 1,
-1.529074, 0.7158378, 0.4997242, 1, 0.3607843, 0, 1,
-1.523433, -1.702255, -4.771173, 1, 0.3647059, 0, 1,
-1.517751, 1.805869, -0.3271711, 1, 0.372549, 0, 1,
-1.50292, 1.329119, -0.9927719, 1, 0.3764706, 0, 1,
-1.496023, -1.689647, -2.610118, 1, 0.3843137, 0, 1,
-1.490809, -0.1692268, -1.982502, 1, 0.3882353, 0, 1,
-1.486044, -0.02478882, -1.233923, 1, 0.3960784, 0, 1,
-1.485975, 1.793939, 0.2244729, 1, 0.4039216, 0, 1,
-1.475965, -0.7579265, -3.121962, 1, 0.4078431, 0, 1,
-1.454648, -0.2058569, -2.783763, 1, 0.4156863, 0, 1,
-1.442416, 0.5876311, 0.4819041, 1, 0.4196078, 0, 1,
-1.436621, 1.214062, -2.273648, 1, 0.427451, 0, 1,
-1.432243, 1.55721, -0.7434267, 1, 0.4313726, 0, 1,
-1.426502, -1.255899, -1.140692, 1, 0.4392157, 0, 1,
-1.425092, 0.4709296, -1.432857, 1, 0.4431373, 0, 1,
-1.414971, 0.5777897, -1.504924, 1, 0.4509804, 0, 1,
-1.409526, -0.3320408, -1.541497, 1, 0.454902, 0, 1,
-1.404297, -0.2111359, -2.167663, 1, 0.4627451, 0, 1,
-1.402448, 1.690804, -0.6344932, 1, 0.4666667, 0, 1,
-1.396388, 1.887596, -1.806199, 1, 0.4745098, 0, 1,
-1.385989, -0.0169778, -2.119854, 1, 0.4784314, 0, 1,
-1.385159, -1.966135, -1.489386, 1, 0.4862745, 0, 1,
-1.384395, 0.3434245, -2.339386, 1, 0.4901961, 0, 1,
-1.381654, 1.302879, -1.717022, 1, 0.4980392, 0, 1,
-1.378754, 1.400946, -2.035926, 1, 0.5058824, 0, 1,
-1.340965, 0.6138873, 1.429732, 1, 0.509804, 0, 1,
-1.339869, 0.1409962, -1.571361, 1, 0.5176471, 0, 1,
-1.335762, -0.05334659, -0.3181818, 1, 0.5215687, 0, 1,
-1.335296, -1.461406, -2.730707, 1, 0.5294118, 0, 1,
-1.33352, -0.08739211, -1.758302, 1, 0.5333334, 0, 1,
-1.329925, 0.5715152, -3.304236, 1, 0.5411765, 0, 1,
-1.324312, -1.290971, -3.274567, 1, 0.5450981, 0, 1,
-1.323994, 0.8538551, -0.6292852, 1, 0.5529412, 0, 1,
-1.323963, 1.615054, -0.5490147, 1, 0.5568628, 0, 1,
-1.311393, 0.1849714, -2.573938, 1, 0.5647059, 0, 1,
-1.308127, -0.4818349, -2.441796, 1, 0.5686275, 0, 1,
-1.307585, -0.04028919, -2.193805, 1, 0.5764706, 0, 1,
-1.294304, 0.3235543, -2.146092, 1, 0.5803922, 0, 1,
-1.29289, -1.976251, -0.8315233, 1, 0.5882353, 0, 1,
-1.291527, 0.6350517, -0.8437795, 1, 0.5921569, 0, 1,
-1.286851, 0.7316289, -1.872447, 1, 0.6, 0, 1,
-1.285858, -0.5604323, -2.544411, 1, 0.6078432, 0, 1,
-1.274883, 0.2872431, -1.587871, 1, 0.6117647, 0, 1,
-1.273358, 0.5571494, -0.3225179, 1, 0.6196079, 0, 1,
-1.270142, -0.5074267, -3.72928, 1, 0.6235294, 0, 1,
-1.268239, -2.549365, -3.009241, 1, 0.6313726, 0, 1,
-1.267642, 1.22732, -0.788873, 1, 0.6352941, 0, 1,
-1.265327, 0.32168, -1.288152, 1, 0.6431373, 0, 1,
-1.262254, -0.8273409, -2.201243, 1, 0.6470588, 0, 1,
-1.250962, -0.417549, -1.576106, 1, 0.654902, 0, 1,
-1.250109, -0.9555346, -2.460099, 1, 0.6588235, 0, 1,
-1.250098, 1.088667, -1.009558, 1, 0.6666667, 0, 1,
-1.246061, -0.4230661, -0.2259511, 1, 0.6705883, 0, 1,
-1.245143, -1.763435, -3.700761, 1, 0.6784314, 0, 1,
-1.244487, -0.4790702, -2.715691, 1, 0.682353, 0, 1,
-1.241189, 1.281992, -1.184355, 1, 0.6901961, 0, 1,
-1.240681, 1.300103, 0.2474796, 1, 0.6941177, 0, 1,
-1.240198, 0.2839914, -0.9263774, 1, 0.7019608, 0, 1,
-1.238307, -0.5664141, -3.123331, 1, 0.7098039, 0, 1,
-1.238036, -0.1386294, -2.544283, 1, 0.7137255, 0, 1,
-1.231144, -0.1312089, -1.414635, 1, 0.7215686, 0, 1,
-1.22631, -0.04831091, -3.549324, 1, 0.7254902, 0, 1,
-1.223142, -1.827921, -3.26072, 1, 0.7333333, 0, 1,
-1.222517, 1.224797, -1.305982, 1, 0.7372549, 0, 1,
-1.211213, 1.054013, 0.5989231, 1, 0.7450981, 0, 1,
-1.191085, 0.308144, -2.620544, 1, 0.7490196, 0, 1,
-1.190579, 1.011485, -2.007127, 1, 0.7568628, 0, 1,
-1.177103, 2.015655, -1.800991, 1, 0.7607843, 0, 1,
-1.173215, -1.481983, -2.379328, 1, 0.7686275, 0, 1,
-1.158912, -0.7487458, -2.34666, 1, 0.772549, 0, 1,
-1.157722, 1.288368, 0.7645749, 1, 0.7803922, 0, 1,
-1.150971, -0.8275719, -2.166766, 1, 0.7843137, 0, 1,
-1.141677, -0.8545511, -3.282781, 1, 0.7921569, 0, 1,
-1.129877, 0.3958967, -2.832526, 1, 0.7960784, 0, 1,
-1.124995, -0.7797123, -1.414135, 1, 0.8039216, 0, 1,
-1.115915, -0.7805092, -2.551249, 1, 0.8117647, 0, 1,
-1.115285, 0.1286077, -0.7309076, 1, 0.8156863, 0, 1,
-1.110708, -0.4215597, -2.452028, 1, 0.8235294, 0, 1,
-1.110327, 1.379725, -1.666728, 1, 0.827451, 0, 1,
-1.107812, 0.8300797, -1.743255, 1, 0.8352941, 0, 1,
-1.10741, 0.6802634, 0.06461366, 1, 0.8392157, 0, 1,
-1.103261, 0.2504628, -2.595806, 1, 0.8470588, 0, 1,
-1.102279, 1.759933, -1.723336, 1, 0.8509804, 0, 1,
-1.100251, 0.2037413, -0.2963635, 1, 0.8588235, 0, 1,
-1.097474, 2.427907, -0.8201529, 1, 0.8627451, 0, 1,
-1.093711, -0.4555869, -2.891252, 1, 0.8705882, 0, 1,
-1.091918, -0.6055428, -0.2189282, 1, 0.8745098, 0, 1,
-1.087927, -0.2762063, -1.267503, 1, 0.8823529, 0, 1,
-1.087897, -1.351536, -1.620781, 1, 0.8862745, 0, 1,
-1.080014, 0.1002995, -1.883955, 1, 0.8941177, 0, 1,
-1.077656, -0.07779533, -2.778295, 1, 0.8980392, 0, 1,
-1.072741, 2.216798, -0.6841362, 1, 0.9058824, 0, 1,
-1.06305, -0.400472, -0.1390708, 1, 0.9137255, 0, 1,
-1.062942, 0.5317429, -0.5679863, 1, 0.9176471, 0, 1,
-1.05667, -0.1372982, -1.521312, 1, 0.9254902, 0, 1,
-1.054491, 0.4854701, -0.4588046, 1, 0.9294118, 0, 1,
-1.046313, -1.213824, -3.228331, 1, 0.9372549, 0, 1,
-1.046106, -1.070968, -4.883805, 1, 0.9411765, 0, 1,
-1.045388, -0.02802933, -2.208083, 1, 0.9490196, 0, 1,
-1.027133, -1.213589, -1.592772, 1, 0.9529412, 0, 1,
-1.021435, 0.7238163, -0.8438063, 1, 0.9607843, 0, 1,
-1.020183, 1.890988, -0.3416835, 1, 0.9647059, 0, 1,
-1.010669, -0.9783, -4.969274, 1, 0.972549, 0, 1,
-0.9919773, 0.764183, -2.559074, 1, 0.9764706, 0, 1,
-0.9823508, -1.30673, -1.84363, 1, 0.9843137, 0, 1,
-0.9750177, -0.6242267, -2.111264, 1, 0.9882353, 0, 1,
-0.9725847, 2.368993, -1.873332, 1, 0.9960784, 0, 1,
-0.9702773, -1.334417, -3.604858, 0.9960784, 1, 0, 1,
-0.9693176, 1.419231, 0.1059247, 0.9921569, 1, 0, 1,
-0.968621, 0.1086046, -1.878311, 0.9843137, 1, 0, 1,
-0.9673668, -0.6497853, -4.065826, 0.9803922, 1, 0, 1,
-0.9632091, -0.5846692, -1.24675, 0.972549, 1, 0, 1,
-0.9609125, 0.5391864, -0.8449776, 0.9686275, 1, 0, 1,
-0.9556252, 0.2444886, 1.0987, 0.9607843, 1, 0, 1,
-0.9540521, -0.10424, -1.558254, 0.9568627, 1, 0, 1,
-0.9519494, -1.15284, -2.075828, 0.9490196, 1, 0, 1,
-0.9513642, 0.3139401, -0.1995712, 0.945098, 1, 0, 1,
-0.9419774, 1.073851, -0.02477209, 0.9372549, 1, 0, 1,
-0.9381353, -0.6291233, -1.139695, 0.9333333, 1, 0, 1,
-0.9345042, -1.437988, -3.047923, 0.9254902, 1, 0, 1,
-0.9303413, -0.274152, -3.637706, 0.9215686, 1, 0, 1,
-0.9280796, 0.009928752, -1.944191, 0.9137255, 1, 0, 1,
-0.926531, -1.455954, -2.312519, 0.9098039, 1, 0, 1,
-0.9173142, 2.076642, 0.09444394, 0.9019608, 1, 0, 1,
-0.9151658, 3.340039, -0.7798641, 0.8941177, 1, 0, 1,
-0.9135619, -1.479527, -2.435374, 0.8901961, 1, 0, 1,
-0.908869, -0.527639, -0.7060012, 0.8823529, 1, 0, 1,
-0.9076108, -0.102172, -1.641613, 0.8784314, 1, 0, 1,
-0.9073478, 0.1713569, -1.434731, 0.8705882, 1, 0, 1,
-0.9026039, -0.4223053, -2.414006, 0.8666667, 1, 0, 1,
-0.9002549, -0.7103056, -2.737472, 0.8588235, 1, 0, 1,
-0.8967044, -0.495108, -2.68769, 0.854902, 1, 0, 1,
-0.8963317, -1.567926, -3.633066, 0.8470588, 1, 0, 1,
-0.8941946, -0.09595868, -2.051757, 0.8431373, 1, 0, 1,
-0.8935173, -0.06513358, -2.16579, 0.8352941, 1, 0, 1,
-0.890467, 1.639097, -1.24652, 0.8313726, 1, 0, 1,
-0.8874814, 0.360188, -2.007126, 0.8235294, 1, 0, 1,
-0.8767403, 0.1884288, -0.5712055, 0.8196079, 1, 0, 1,
-0.8728843, 0.7593783, -1.145398, 0.8117647, 1, 0, 1,
-0.8671707, 1.708582, -1.194158, 0.8078431, 1, 0, 1,
-0.8615977, 2.203352, 0.3790972, 0.8, 1, 0, 1,
-0.8563509, 1.183212, 2.239541, 0.7921569, 1, 0, 1,
-0.8562254, 0.2024277, 0.09983337, 0.7882353, 1, 0, 1,
-0.8527415, 0.9647671, -0.3573771, 0.7803922, 1, 0, 1,
-0.8521125, 0.9024525, -0.2597942, 0.7764706, 1, 0, 1,
-0.8408905, 0.3313454, 0.971557, 0.7686275, 1, 0, 1,
-0.8382497, 0.8244981, -2.005185, 0.7647059, 1, 0, 1,
-0.8370645, 0.02665002, -1.98955, 0.7568628, 1, 0, 1,
-0.8268667, -0.7230374, -2.376802, 0.7529412, 1, 0, 1,
-0.8206761, 0.5640808, -0.7087451, 0.7450981, 1, 0, 1,
-0.8196441, 0.3408064, -1.422992, 0.7411765, 1, 0, 1,
-0.8152983, -0.4512895, -1.405908, 0.7333333, 1, 0, 1,
-0.8079108, 0.09846892, -3.204726, 0.7294118, 1, 0, 1,
-0.8016929, -0.2388029, -0.5346258, 0.7215686, 1, 0, 1,
-0.7986932, -0.09670511, -2.319127, 0.7176471, 1, 0, 1,
-0.796585, 0.1159444, -1.11805, 0.7098039, 1, 0, 1,
-0.7951275, 0.3512074, -1.756679, 0.7058824, 1, 0, 1,
-0.7878289, 1.759526, -0.5125256, 0.6980392, 1, 0, 1,
-0.7730044, -0.1100875, -1.484835, 0.6901961, 1, 0, 1,
-0.7718865, 1.00452, -1.211395, 0.6862745, 1, 0, 1,
-0.7696308, 2.19153, -1.835312, 0.6784314, 1, 0, 1,
-0.7653444, -0.7354038, -3.104436, 0.6745098, 1, 0, 1,
-0.7642972, -1.178375, -2.032853, 0.6666667, 1, 0, 1,
-0.760097, 0.7697296, -1.698308, 0.6627451, 1, 0, 1,
-0.7588994, -0.2229338, -1.100941, 0.654902, 1, 0, 1,
-0.7576118, -0.3951434, -1.317169, 0.6509804, 1, 0, 1,
-0.7509395, -0.7015897, -1.505997, 0.6431373, 1, 0, 1,
-0.7482414, -0.09342106, -1.390415, 0.6392157, 1, 0, 1,
-0.7409999, -0.2004452, -1.684656, 0.6313726, 1, 0, 1,
-0.7402508, 0.104504, -0.02552988, 0.627451, 1, 0, 1,
-0.7387787, 0.1896344, -1.408357, 0.6196079, 1, 0, 1,
-0.7347688, 1.691515, -0.9403968, 0.6156863, 1, 0, 1,
-0.7336198, -0.4431058, -2.224397, 0.6078432, 1, 0, 1,
-0.7313486, -1.73736, -2.716789, 0.6039216, 1, 0, 1,
-0.7219471, 0.7835808, 0.2951972, 0.5960785, 1, 0, 1,
-0.719198, 2.357658, -0.6729165, 0.5882353, 1, 0, 1,
-0.7165703, 1.149711, -0.863297, 0.5843138, 1, 0, 1,
-0.7155448, -0.7214289, -2.364293, 0.5764706, 1, 0, 1,
-0.7078271, -0.285198, -3.19559, 0.572549, 1, 0, 1,
-0.7074564, 0.4497366, -1.634976, 0.5647059, 1, 0, 1,
-0.7036266, -0.2943098, -2.707493, 0.5607843, 1, 0, 1,
-0.7022928, 0.1610655, -1.69961, 0.5529412, 1, 0, 1,
-0.7018359, 1.031366, 0.9477134, 0.5490196, 1, 0, 1,
-0.7013621, -0.8115299, -2.244878, 0.5411765, 1, 0, 1,
-0.6982076, -0.02352636, -1.107652, 0.5372549, 1, 0, 1,
-0.6981002, -0.1987687, -0.9604176, 0.5294118, 1, 0, 1,
-0.6969751, 1.170853, 0.1795198, 0.5254902, 1, 0, 1,
-0.6954405, 0.09936393, -0.8334058, 0.5176471, 1, 0, 1,
-0.6948686, 0.695769, -0.1312407, 0.5137255, 1, 0, 1,
-0.6942949, 0.6903465, -0.6852089, 0.5058824, 1, 0, 1,
-0.6832115, -0.3718513, -3.659836, 0.5019608, 1, 0, 1,
-0.6657536, -0.8635715, -3.226784, 0.4941176, 1, 0, 1,
-0.6602666, 0.3583246, -1.485225, 0.4862745, 1, 0, 1,
-0.6549805, -0.7304751, -2.164638, 0.4823529, 1, 0, 1,
-0.6540458, 0.138463, 0.1025947, 0.4745098, 1, 0, 1,
-0.6512878, 0.1116079, -2.805795, 0.4705882, 1, 0, 1,
-0.6420715, 0.3807646, -0.5414979, 0.4627451, 1, 0, 1,
-0.6413667, 0.02102163, -1.373608, 0.4588235, 1, 0, 1,
-0.6404118, -0.1305185, -1.238584, 0.4509804, 1, 0, 1,
-0.6402437, 0.1456784, -0.9251476, 0.4470588, 1, 0, 1,
-0.6367058, 0.1250022, -1.221259, 0.4392157, 1, 0, 1,
-0.6355625, -0.3531217, -3.384859, 0.4352941, 1, 0, 1,
-0.6311097, 1.289506, -0.7208639, 0.427451, 1, 0, 1,
-0.6288539, -0.07604396, -1.109532, 0.4235294, 1, 0, 1,
-0.6224068, -0.3279241, -1.537048, 0.4156863, 1, 0, 1,
-0.6205616, -0.1673496, -1.484914, 0.4117647, 1, 0, 1,
-0.6196813, -0.3632993, -2.243554, 0.4039216, 1, 0, 1,
-0.6175649, 1.40997, -2.107739, 0.3960784, 1, 0, 1,
-0.6162265, -1.438046, -1.828625, 0.3921569, 1, 0, 1,
-0.6094148, 0.001942941, -1.31776, 0.3843137, 1, 0, 1,
-0.6062917, -0.8561983, -3.288397, 0.3803922, 1, 0, 1,
-0.6061508, 0.4245678, -0.3534411, 0.372549, 1, 0, 1,
-0.601815, -0.6912351, -2.549864, 0.3686275, 1, 0, 1,
-0.6017434, 1.689542, 2.532605, 0.3607843, 1, 0, 1,
-0.6004721, 1.162385, -0.5634129, 0.3568628, 1, 0, 1,
-0.5981576, 0.5190992, -0.9316009, 0.3490196, 1, 0, 1,
-0.5978539, 0.5266907, 0.8806235, 0.345098, 1, 0, 1,
-0.5961762, -1.021371, -1.431506, 0.3372549, 1, 0, 1,
-0.5955816, 0.2769149, -0.2887641, 0.3333333, 1, 0, 1,
-0.5944763, -2.089876, -3.390731, 0.3254902, 1, 0, 1,
-0.5905627, 0.2782308, -0.9871758, 0.3215686, 1, 0, 1,
-0.5900477, 1.009425, -1.732147, 0.3137255, 1, 0, 1,
-0.5880524, 0.4585046, -1.88273, 0.3098039, 1, 0, 1,
-0.5847579, -1.680706, -2.470829, 0.3019608, 1, 0, 1,
-0.5844033, 0.1134186, -0.8556271, 0.2941177, 1, 0, 1,
-0.5805778, 0.4570167, -0.5628407, 0.2901961, 1, 0, 1,
-0.5777695, 0.3670813, -1.400315, 0.282353, 1, 0, 1,
-0.573572, 0.6462601, -0.3356743, 0.2784314, 1, 0, 1,
-0.5719715, 0.4640681, -0.5679478, 0.2705882, 1, 0, 1,
-0.5649375, -1.361625, -3.668932, 0.2666667, 1, 0, 1,
-0.561907, -0.01313876, -0.2220287, 0.2588235, 1, 0, 1,
-0.5618556, 0.08682461, -2.691476, 0.254902, 1, 0, 1,
-0.5614662, 0.0494819, -2.659426, 0.2470588, 1, 0, 1,
-0.5571535, 0.6064618, -0.9690914, 0.2431373, 1, 0, 1,
-0.5410118, 0.766952, 0.2997082, 0.2352941, 1, 0, 1,
-0.5393953, 1.113407, -1.840403, 0.2313726, 1, 0, 1,
-0.5367858, 0.4516108, -0.1215837, 0.2235294, 1, 0, 1,
-0.5337014, -1.395289, -1.719903, 0.2196078, 1, 0, 1,
-0.5317551, 0.7727389, -0.4196933, 0.2117647, 1, 0, 1,
-0.5302289, -0.989342, -1.103892, 0.2078431, 1, 0, 1,
-0.5251503, -0.7791222, -1.026503, 0.2, 1, 0, 1,
-0.5230116, -0.1503438, -0.8556159, 0.1921569, 1, 0, 1,
-0.5189658, -1.603643, -2.815725, 0.1882353, 1, 0, 1,
-0.5141944, 1.934358, -1.329486, 0.1803922, 1, 0, 1,
-0.5104146, -0.239672, -3.132895, 0.1764706, 1, 0, 1,
-0.5054019, -1.373084, -2.668426, 0.1686275, 1, 0, 1,
-0.5020769, 0.5596493, -1.174438, 0.1647059, 1, 0, 1,
-0.5016372, -1.079373, -1.878034, 0.1568628, 1, 0, 1,
-0.4954196, 0.6579962, -1.468587, 0.1529412, 1, 0, 1,
-0.4936857, 1.227776, 0.5187087, 0.145098, 1, 0, 1,
-0.4928148, 0.001804545, -2.008286, 0.1411765, 1, 0, 1,
-0.4904862, 0.4625894, -2.161421, 0.1333333, 1, 0, 1,
-0.489114, 0.1976081, -0.3596781, 0.1294118, 1, 0, 1,
-0.4808454, -0.01949614, -1.700131, 0.1215686, 1, 0, 1,
-0.4734859, -0.1621889, -2.915371, 0.1176471, 1, 0, 1,
-0.4715184, 1.576053, 0.09311976, 0.1098039, 1, 0, 1,
-0.4712613, 1.51671, -0.184791, 0.1058824, 1, 0, 1,
-0.4706048, -1.26054, -2.676943, 0.09803922, 1, 0, 1,
-0.4674211, -0.3049539, -1.76886, 0.09019608, 1, 0, 1,
-0.466747, 0.08782266, -2.103516, 0.08627451, 1, 0, 1,
-0.4659439, 0.0009827529, -0.8069998, 0.07843138, 1, 0, 1,
-0.4655462, -2.218768, -1.892074, 0.07450981, 1, 0, 1,
-0.4620207, -0.1048437, -1.601348, 0.06666667, 1, 0, 1,
-0.4599161, 0.5201133, -1.214829, 0.0627451, 1, 0, 1,
-0.4544457, 1.65212, -1.038363, 0.05490196, 1, 0, 1,
-0.4503545, 0.561999, -2.474175, 0.05098039, 1, 0, 1,
-0.4497772, -1.18617, -2.061287, 0.04313726, 1, 0, 1,
-0.4440043, 1.202947, 0.08129648, 0.03921569, 1, 0, 1,
-0.4437645, 0.3654856, -0.8314844, 0.03137255, 1, 0, 1,
-0.4356237, 1.974025, -0.1521343, 0.02745098, 1, 0, 1,
-0.4344456, 1.210693, -0.4193968, 0.01960784, 1, 0, 1,
-0.4322084, -0.1836174, 0.1447566, 0.01568628, 1, 0, 1,
-0.428946, -0.6566382, -1.792773, 0.007843138, 1, 0, 1,
-0.4252571, -1.506744, -2.367599, 0.003921569, 1, 0, 1,
-0.4149794, 1.413273, -1.455309, 0, 1, 0.003921569, 1,
-0.4138159, 1.323246, -0.9896154, 0, 1, 0.01176471, 1,
-0.406584, -0.8093507, -1.891213, 0, 1, 0.01568628, 1,
-0.4055403, -1.314551, -3.084823, 0, 1, 0.02352941, 1,
-0.4052014, 0.03790924, -2.007761, 0, 1, 0.02745098, 1,
-0.4033999, -0.9214463, -1.908597, 0, 1, 0.03529412, 1,
-0.4032116, -0.2528331, -2.484451, 0, 1, 0.03921569, 1,
-0.4011548, 1.333884, 0.8968093, 0, 1, 0.04705882, 1,
-0.3990571, -0.1414887, -1.278076, 0, 1, 0.05098039, 1,
-0.3983785, 0.9178165, -0.1873802, 0, 1, 0.05882353, 1,
-0.3963711, -0.5567621, -2.181567, 0, 1, 0.0627451, 1,
-0.3952986, -0.01618688, -1.021898, 0, 1, 0.07058824, 1,
-0.3920068, -0.4679729, -2.021274, 0, 1, 0.07450981, 1,
-0.3911244, 0.5007815, 0.4108067, 0, 1, 0.08235294, 1,
-0.3899828, 2.278883, -1.924108, 0, 1, 0.08627451, 1,
-0.3892476, 0.3887663, -0.1900161, 0, 1, 0.09411765, 1,
-0.3890345, -0.8358049, -1.927308, 0, 1, 0.1019608, 1,
-0.3884785, -0.05915108, -3.413014, 0, 1, 0.1058824, 1,
-0.3883901, -1.604267, -2.222828, 0, 1, 0.1137255, 1,
-0.3878656, 1.783082, -0.7809154, 0, 1, 0.1176471, 1,
-0.3870335, 0.8528373, -1.336289, 0, 1, 0.1254902, 1,
-0.3802135, 0.1475993, 0.4047824, 0, 1, 0.1294118, 1,
-0.3737291, -0.4606394, -2.970653, 0, 1, 0.1372549, 1,
-0.3661426, -1.811169, -2.679923, 0, 1, 0.1411765, 1,
-0.3597344, -0.21516, -3.420762, 0, 1, 0.1490196, 1,
-0.3494957, -1.590378, -2.795252, 0, 1, 0.1529412, 1,
-0.3489223, 0.02239266, -0.6270274, 0, 1, 0.1607843, 1,
-0.3482787, -0.8700418, -2.314659, 0, 1, 0.1647059, 1,
-0.3468533, 0.3405861, -2.77729, 0, 1, 0.172549, 1,
-0.3451644, 0.8783913, -1.489585, 0, 1, 0.1764706, 1,
-0.344733, -0.1101945, -3.302268, 0, 1, 0.1843137, 1,
-0.3437823, 0.5427327, -0.778611, 0, 1, 0.1882353, 1,
-0.3406642, 0.1847631, 0.3179586, 0, 1, 0.1960784, 1,
-0.3371364, -1.215237, -2.845147, 0, 1, 0.2039216, 1,
-0.3328646, -0.6196077, -2.087202, 0, 1, 0.2078431, 1,
-0.3313055, -0.6583992, -1.797755, 0, 1, 0.2156863, 1,
-0.3306144, 1.169086, -0.2041177, 0, 1, 0.2196078, 1,
-0.3301336, 0.5590174, -3.319474, 0, 1, 0.227451, 1,
-0.3300977, 0.304107, 1.291958, 0, 1, 0.2313726, 1,
-0.3281178, 1.050019, -1.763054, 0, 1, 0.2392157, 1,
-0.3252876, -0.556886, -1.29372, 0, 1, 0.2431373, 1,
-0.3245349, -1.754215, -2.854844, 0, 1, 0.2509804, 1,
-0.3200151, 1.550777, 0.789528, 0, 1, 0.254902, 1,
-0.3160174, -0.5091658, -2.334641, 0, 1, 0.2627451, 1,
-0.3102759, 0.7156369, -0.664716, 0, 1, 0.2666667, 1,
-0.3055231, 1.420527, -0.07198437, 0, 1, 0.2745098, 1,
-0.3048216, -1.161996, -1.515029, 0, 1, 0.2784314, 1,
-0.3020653, -0.29834, -4.020178, 0, 1, 0.2862745, 1,
-0.3019426, 1.246266, 0.661079, 0, 1, 0.2901961, 1,
-0.3014624, 0.3078201, -1.05231, 0, 1, 0.2980392, 1,
-0.2969707, -0.07142881, -1.720853, 0, 1, 0.3058824, 1,
-0.2951713, -1.396727, -2.153364, 0, 1, 0.3098039, 1,
-0.2938991, -0.4029612, -1.288743, 0, 1, 0.3176471, 1,
-0.2917308, 1.159142, -0.3424346, 0, 1, 0.3215686, 1,
-0.291409, -0.02250228, -0.6992621, 0, 1, 0.3294118, 1,
-0.2902037, 0.09609064, -1.292049, 0, 1, 0.3333333, 1,
-0.2744997, -3.971211, -2.640091, 0, 1, 0.3411765, 1,
-0.2736217, 0.2628664, -1.100979, 0, 1, 0.345098, 1,
-0.2635903, 0.8386498, -1.036439, 0, 1, 0.3529412, 1,
-0.2634304, 0.8029569, -0.09477839, 0, 1, 0.3568628, 1,
-0.2627862, -0.3179764, -2.123058, 0, 1, 0.3647059, 1,
-0.2615651, -0.3340177, -4.160847, 0, 1, 0.3686275, 1,
-0.2565466, 1.391206, 2.217399, 0, 1, 0.3764706, 1,
-0.2548991, -0.281134, -3.725323, 0, 1, 0.3803922, 1,
-0.2400136, -0.07352025, -2.360674, 0, 1, 0.3882353, 1,
-0.2373323, -1.786315, -3.372896, 0, 1, 0.3921569, 1,
-0.2351572, 1.784624, -1.464503, 0, 1, 0.4, 1,
-0.2349661, 1.053636, 0.8075163, 0, 1, 0.4078431, 1,
-0.2326837, 0.6730574, -1.276877, 0, 1, 0.4117647, 1,
-0.2277926, 0.6885645, 0.03842946, 0, 1, 0.4196078, 1,
-0.2200128, -0.4061654, -4.221732, 0, 1, 0.4235294, 1,
-0.2188954, 0.8743895, 0.4891891, 0, 1, 0.4313726, 1,
-0.2182196, -1.403275, -2.29805, 0, 1, 0.4352941, 1,
-0.2140656, 0.7530074, 0.01206178, 0, 1, 0.4431373, 1,
-0.2133933, -0.7376706, -0.9050274, 0, 1, 0.4470588, 1,
-0.2000358, -0.3253455, -3.866267, 0, 1, 0.454902, 1,
-0.1988894, -1.477097, -2.655153, 0, 1, 0.4588235, 1,
-0.1974945, 2.465834, 0.06536946, 0, 1, 0.4666667, 1,
-0.1959273, -1.395825, -3.215507, 0, 1, 0.4705882, 1,
-0.1950211, -1.402404, -2.112285, 0, 1, 0.4784314, 1,
-0.1934074, -0.4509281, -2.391852, 0, 1, 0.4823529, 1,
-0.192542, -1.633424, -3.934429, 0, 1, 0.4901961, 1,
-0.1901815, 1.144045, -1.217785, 0, 1, 0.4941176, 1,
-0.1845268, 0.342037, -0.7126535, 0, 1, 0.5019608, 1,
-0.1779967, -0.1067824, -3.488173, 0, 1, 0.509804, 1,
-0.1774776, -1.643267, -3.051974, 0, 1, 0.5137255, 1,
-0.1764192, 0.1312437, 0.0274459, 0, 1, 0.5215687, 1,
-0.1730752, -0.5148091, -2.754344, 0, 1, 0.5254902, 1,
-0.1725183, -0.1187623, -3.280777, 0, 1, 0.5333334, 1,
-0.1722243, 0.06829822, 0.6215563, 0, 1, 0.5372549, 1,
-0.1711946, 1.267505, 1.981946, 0, 1, 0.5450981, 1,
-0.1681572, 1.183871, -0.8186045, 0, 1, 0.5490196, 1,
-0.1664089, 0.1489417, -1.267972, 0, 1, 0.5568628, 1,
-0.1654352, 0.3474365, 1.139393, 0, 1, 0.5607843, 1,
-0.1612495, -1.238416, -2.223178, 0, 1, 0.5686275, 1,
-0.1586369, -0.2769535, -2.19271, 0, 1, 0.572549, 1,
-0.1492829, -1.30635, -2.620154, 0, 1, 0.5803922, 1,
-0.1467216, 1.823092, -0.7444918, 0, 1, 0.5843138, 1,
-0.1458141, 1.409527, 1.188481, 0, 1, 0.5921569, 1,
-0.1449574, -0.04547045, -1.806647, 0, 1, 0.5960785, 1,
-0.1435511, 0.2074909, -1.346817, 0, 1, 0.6039216, 1,
-0.1412055, 1.526964, 0.3669834, 0, 1, 0.6117647, 1,
-0.1329347, -0.836026, -3.624513, 0, 1, 0.6156863, 1,
-0.1320655, -0.2080053, -3.353795, 0, 1, 0.6235294, 1,
-0.1303928, 0.4042794, 0.7327464, 0, 1, 0.627451, 1,
-0.1207939, -0.6641341, -1.356698, 0, 1, 0.6352941, 1,
-0.1204294, -0.4380517, -3.095641, 0, 1, 0.6392157, 1,
-0.1198525, -0.06018549, -3.16379, 0, 1, 0.6470588, 1,
-0.1151824, 0.6187086, -0.8627616, 0, 1, 0.6509804, 1,
-0.1144619, 0.9510776, 1.00989, 0, 1, 0.6588235, 1,
-0.1112229, -0.8592405, -2.454177, 0, 1, 0.6627451, 1,
-0.1091681, -1.135372, -3.164202, 0, 1, 0.6705883, 1,
-0.08710493, 1.817937, -0.808827, 0, 1, 0.6745098, 1,
-0.08453581, -0.7486715, -2.482186, 0, 1, 0.682353, 1,
-0.08231201, 0.9276329, -0.3747396, 0, 1, 0.6862745, 1,
-0.07613121, 0.1611574, 0.5162969, 0, 1, 0.6941177, 1,
-0.07279669, -1.130552, -3.071159, 0, 1, 0.7019608, 1,
-0.06960717, 0.5526096, 1.320205, 0, 1, 0.7058824, 1,
-0.05589966, 1.421962, 0.7357582, 0, 1, 0.7137255, 1,
-0.05056031, -0.7609789, -2.772887, 0, 1, 0.7176471, 1,
-0.04925121, -0.9735474, -3.328141, 0, 1, 0.7254902, 1,
-0.04822179, 0.5731548, -1.466592, 0, 1, 0.7294118, 1,
-0.04608979, 1.824742, 0.1421523, 0, 1, 0.7372549, 1,
-0.04454501, -1.680065, -1.908937, 0, 1, 0.7411765, 1,
-0.04410269, -0.2488647, -3.223211, 0, 1, 0.7490196, 1,
-0.03804834, 0.5068207, -1.870759, 0, 1, 0.7529412, 1,
-0.03537961, -0.4105044, -2.787399, 0, 1, 0.7607843, 1,
-0.03137185, 0.1461602, -0.3486581, 0, 1, 0.7647059, 1,
-0.03094354, 0.9503913, -0.3142714, 0, 1, 0.772549, 1,
-0.02885133, -0.5705187, -3.531383, 0, 1, 0.7764706, 1,
-0.02541076, -1.537797, -3.331088, 0, 1, 0.7843137, 1,
-0.02511118, 0.1872841, -1.579422, 0, 1, 0.7882353, 1,
-0.01972169, 0.7102922, -1.626032, 0, 1, 0.7960784, 1,
-0.01916282, 0.4349809, 1.730425, 0, 1, 0.8039216, 1,
-0.01899906, 0.7269489, 0.4063168, 0, 1, 0.8078431, 1,
-0.01893698, 0.9091545, -0.9359099, 0, 1, 0.8156863, 1,
-0.01484927, -0.2099274, -3.246384, 0, 1, 0.8196079, 1,
-0.01265066, -0.1863976, -3.083917, 0, 1, 0.827451, 1,
-0.01155251, 1.271261, 1.945424, 0, 1, 0.8313726, 1,
-0.01062271, 0.8307052, -0.2512076, 0, 1, 0.8392157, 1,
-0.007810974, -0.2252468, -4.000519, 0, 1, 0.8431373, 1,
-0.005955165, -0.2704629, -3.218987, 0, 1, 0.8509804, 1,
-0.004840596, -0.4476614, -2.157977, 0, 1, 0.854902, 1,
-0.002026739, 2.638991, -1.241999, 0, 1, 0.8627451, 1,
-9.019986e-06, -0.1029683, -3.154089, 0, 1, 0.8666667, 1,
0.0008179221, -1.927713, 1.598886, 0, 1, 0.8745098, 1,
0.007417357, -0.06863718, 3.424293, 0, 1, 0.8784314, 1,
0.009179869, -0.270398, 3.107125, 0, 1, 0.8862745, 1,
0.01109334, -1.014778, 3.075073, 0, 1, 0.8901961, 1,
0.01136206, -0.1172739, 1.663458, 0, 1, 0.8980392, 1,
0.01272081, 1.158209, 0.3069076, 0, 1, 0.9058824, 1,
0.02264179, 0.006320713, 1.710483, 0, 1, 0.9098039, 1,
0.02375296, 1.818379, 0.2679127, 0, 1, 0.9176471, 1,
0.02583438, -1.293994, 3.106274, 0, 1, 0.9215686, 1,
0.0329901, 0.2106951, 0.4700399, 0, 1, 0.9294118, 1,
0.03545593, -1.331857, 3.834626, 0, 1, 0.9333333, 1,
0.03968612, 0.3920381, 0.9946163, 0, 1, 0.9411765, 1,
0.04020889, 1.062208, -2.079733, 0, 1, 0.945098, 1,
0.04129526, -0.8787726, 4.889164, 0, 1, 0.9529412, 1,
0.04236303, -0.2522312, 3.551306, 0, 1, 0.9568627, 1,
0.04282881, 2.416428, 1.80911, 0, 1, 0.9647059, 1,
0.04425964, 1.079688, 0.8250908, 0, 1, 0.9686275, 1,
0.04471493, 0.8207834, -0.1281849, 0, 1, 0.9764706, 1,
0.04931696, -1.234006, 2.265726, 0, 1, 0.9803922, 1,
0.0556891, 0.2588049, -0.4820462, 0, 1, 0.9882353, 1,
0.06165477, 0.2790499, 0.6721321, 0, 1, 0.9921569, 1,
0.06207364, -0.5852274, 2.90277, 0, 1, 1, 1,
0.06291509, 1.368932, 0.2373228, 0, 0.9921569, 1, 1,
0.06833138, 1.441184, 1.315641, 0, 0.9882353, 1, 1,
0.07019522, -1.027902, 1.94919, 0, 0.9803922, 1, 1,
0.07100477, 1.625334, 0.8389621, 0, 0.9764706, 1, 1,
0.07244355, -2.496529, 4.732566, 0, 0.9686275, 1, 1,
0.07866813, -0.372768, 2.96323, 0, 0.9647059, 1, 1,
0.07975674, -0.343829, 2.441495, 0, 0.9568627, 1, 1,
0.08228975, 1.112639, 2.359711, 0, 0.9529412, 1, 1,
0.08336469, 0.007314148, 0.3048813, 0, 0.945098, 1, 1,
0.08354077, 0.3296069, -0.8737665, 0, 0.9411765, 1, 1,
0.0839854, 0.8112227, 0.4938024, 0, 0.9333333, 1, 1,
0.08495498, -1.400104, 1.555095, 0, 0.9294118, 1, 1,
0.08687472, -0.3409769, 1.503782, 0, 0.9215686, 1, 1,
0.08977444, 0.5503064, 0.2292666, 0, 0.9176471, 1, 1,
0.09092773, 1.931391, 0.8813142, 0, 0.9098039, 1, 1,
0.09324676, -0.7378805, 4.35427, 0, 0.9058824, 1, 1,
0.09381483, 2.568943, -0.01488423, 0, 0.8980392, 1, 1,
0.09572183, 0.2004827, 1.459282, 0, 0.8901961, 1, 1,
0.09639413, 0.151939, -2.052997, 0, 0.8862745, 1, 1,
0.09970082, -0.4774102, 4.27908, 0, 0.8784314, 1, 1,
0.1016885, 0.06299587, 3.17431, 0, 0.8745098, 1, 1,
0.103243, -0.7434918, 3.367463, 0, 0.8666667, 1, 1,
0.1044772, -1.245502, 2.918763, 0, 0.8627451, 1, 1,
0.1092588, 1.778893, 0.2758512, 0, 0.854902, 1, 1,
0.1104496, -1.069473, 2.142318, 0, 0.8509804, 1, 1,
0.1112264, 0.5292159, -0.925788, 0, 0.8431373, 1, 1,
0.1170759, 0.3361908, -0.6060771, 0, 0.8392157, 1, 1,
0.117087, -0.4694695, 3.199581, 0, 0.8313726, 1, 1,
0.1198737, 0.3373938, 0.5810469, 0, 0.827451, 1, 1,
0.1214571, -3.044611, 2.445247, 0, 0.8196079, 1, 1,
0.1242788, -0.7364827, 2.140069, 0, 0.8156863, 1, 1,
0.130507, -1.360107, 3.491071, 0, 0.8078431, 1, 1,
0.1306023, -0.5469161, 2.86377, 0, 0.8039216, 1, 1,
0.134639, 0.7535906, 0.5745879, 0, 0.7960784, 1, 1,
0.1385143, -0.6913664, 0.3837855, 0, 0.7882353, 1, 1,
0.1438625, -1.061709, 3.127328, 0, 0.7843137, 1, 1,
0.1452428, 0.8527203, -0.9345152, 0, 0.7764706, 1, 1,
0.147269, -2.244421, 3.261356, 0, 0.772549, 1, 1,
0.1490441, 0.5175288, 0.4295496, 0, 0.7647059, 1, 1,
0.1591577, 1.445489, 1.104145, 0, 0.7607843, 1, 1,
0.1607577, -0.1950447, 3.786754, 0, 0.7529412, 1, 1,
0.1611174, -2.201453, 5.464836, 0, 0.7490196, 1, 1,
0.1644772, 1.026898, 0.6905363, 0, 0.7411765, 1, 1,
0.1649259, 1.609953, -0.2984769, 0, 0.7372549, 1, 1,
0.1717618, 0.4146234, 1.414217, 0, 0.7294118, 1, 1,
0.1745853, -1.083033, 2.487598, 0, 0.7254902, 1, 1,
0.1747455, 1.503554, 0.9006335, 0, 0.7176471, 1, 1,
0.1798007, -1.030545, 2.33395, 0, 0.7137255, 1, 1,
0.1832786, -1.708056, 3.737, 0, 0.7058824, 1, 1,
0.1863362, 0.03952553, 1.273215, 0, 0.6980392, 1, 1,
0.1900717, -0.3867558, 4.071449, 0, 0.6941177, 1, 1,
0.1963054, 0.1498987, 0.7111313, 0, 0.6862745, 1, 1,
0.1985718, -0.420741, 2.167326, 0, 0.682353, 1, 1,
0.2010176, -0.6629409, 2.143192, 0, 0.6745098, 1, 1,
0.2049986, 0.944485, 0.5085639, 0, 0.6705883, 1, 1,
0.2065631, 0.1922621, 1.090879, 0, 0.6627451, 1, 1,
0.2074841, -0.6910539, 2.107402, 0, 0.6588235, 1, 1,
0.2136513, -0.411261, 2.706744, 0, 0.6509804, 1, 1,
0.2169329, -0.5146554, 2.651247, 0, 0.6470588, 1, 1,
0.2205614, -1.544463, 2.619584, 0, 0.6392157, 1, 1,
0.2210057, -0.4571379, 2.697472, 0, 0.6352941, 1, 1,
0.2212147, 0.7583108, 0.5894831, 0, 0.627451, 1, 1,
0.2279546, -0.4290062, 3.097378, 0, 0.6235294, 1, 1,
0.2286571, 0.6153268, -1.287959, 0, 0.6156863, 1, 1,
0.2296962, -1.894926, 2.7343, 0, 0.6117647, 1, 1,
0.231062, -0.7397615, 1.083411, 0, 0.6039216, 1, 1,
0.2326427, 0.007605345, 1.54151, 0, 0.5960785, 1, 1,
0.2336187, 1.044642, -0.08194312, 0, 0.5921569, 1, 1,
0.2358118, 1.806209, -0.4458327, 0, 0.5843138, 1, 1,
0.2443074, 0.3182937, 1.089314, 0, 0.5803922, 1, 1,
0.2452841, 0.09219422, 0.1110122, 0, 0.572549, 1, 1,
0.2474875, -2.937323, 2.294842, 0, 0.5686275, 1, 1,
0.2545227, -0.531311, 3.15529, 0, 0.5607843, 1, 1,
0.2563879, -0.6037274, 2.788387, 0, 0.5568628, 1, 1,
0.2589131, 0.4148565, -1.233102, 0, 0.5490196, 1, 1,
0.2650594, 0.450311, 1.285294, 0, 0.5450981, 1, 1,
0.2651981, -1.560955, 2.556512, 0, 0.5372549, 1, 1,
0.2658438, -0.1917997, 2.063291, 0, 0.5333334, 1, 1,
0.2667084, 0.5374161, 2.951612, 0, 0.5254902, 1, 1,
0.2685073, 0.5291947, 2.311, 0, 0.5215687, 1, 1,
0.273225, -0.9307495, 2.158469, 0, 0.5137255, 1, 1,
0.2745109, 1.103828, 1.200689, 0, 0.509804, 1, 1,
0.274655, -0.185449, 1.463878, 0, 0.5019608, 1, 1,
0.2771483, 0.7137283, 0.6106051, 0, 0.4941176, 1, 1,
0.2781828, -0.6642984, 2.146102, 0, 0.4901961, 1, 1,
0.2793577, 1.345865, -0.439892, 0, 0.4823529, 1, 1,
0.286101, -1.012684, 3.902777, 0, 0.4784314, 1, 1,
0.2916366, 0.4089928, 1.618279, 0, 0.4705882, 1, 1,
0.2933791, -0.6834555, 2.925716, 0, 0.4666667, 1, 1,
0.2944936, -1.119177, 3.171155, 0, 0.4588235, 1, 1,
0.2976601, 0.3306593, 1.028311, 0, 0.454902, 1, 1,
0.2995218, -0.6717172, 2.916227, 0, 0.4470588, 1, 1,
0.3001459, 0.6648583, 0.09223181, 0, 0.4431373, 1, 1,
0.3001904, 0.7841699, 0.3163607, 0, 0.4352941, 1, 1,
0.3004007, -1.46132, 2.926011, 0, 0.4313726, 1, 1,
0.3122736, -0.6976941, 2.752595, 0, 0.4235294, 1, 1,
0.3129821, 0.07138449, 0.9861322, 0, 0.4196078, 1, 1,
0.3146148, 0.6480618, 0.8867611, 0, 0.4117647, 1, 1,
0.3158509, 0.3998913, 2.291468, 0, 0.4078431, 1, 1,
0.322702, -0.3560445, 3.609059, 0, 0.4, 1, 1,
0.3247914, 1.118418, 1.818184, 0, 0.3921569, 1, 1,
0.3265782, 0.09338626, 1.920572, 0, 0.3882353, 1, 1,
0.330124, 0.1091188, 0.1049888, 0, 0.3803922, 1, 1,
0.3372641, -0.5404137, 2.244806, 0, 0.3764706, 1, 1,
0.3391838, -1.074086, 2.990979, 0, 0.3686275, 1, 1,
0.3418849, -0.4205358, 2.830681, 0, 0.3647059, 1, 1,
0.3436245, 0.889336, 0.9816039, 0, 0.3568628, 1, 1,
0.3452013, -1.650109, 3.339496, 0, 0.3529412, 1, 1,
0.3460777, -0.4253464, 0.7949022, 0, 0.345098, 1, 1,
0.3482607, -1.156365, 3.923344, 0, 0.3411765, 1, 1,
0.3522936, -1.076989, 3.716023, 0, 0.3333333, 1, 1,
0.3529814, 2.031344, 1.212971, 0, 0.3294118, 1, 1,
0.3555007, -1.231451, 3.214192, 0, 0.3215686, 1, 1,
0.3591435, 0.4894572, 0.9627539, 0, 0.3176471, 1, 1,
0.3601728, -1.234961, 1.406893, 0, 0.3098039, 1, 1,
0.3676911, -0.1243467, 0.1125316, 0, 0.3058824, 1, 1,
0.371031, -0.029173, 1.070734, 0, 0.2980392, 1, 1,
0.371717, 0.4903588, 1.11982, 0, 0.2901961, 1, 1,
0.3757444, 0.3347206, -0.1973304, 0, 0.2862745, 1, 1,
0.3765446, -1.49507, 4.243622, 0, 0.2784314, 1, 1,
0.3802608, 1.294631, -1.608394, 0, 0.2745098, 1, 1,
0.3817854, 0.642287, -0.01200095, 0, 0.2666667, 1, 1,
0.3829932, -0.4623147, 3.052788, 0, 0.2627451, 1, 1,
0.3831336, -1.015464, 3.843923, 0, 0.254902, 1, 1,
0.3837473, 0.2112511, 2.743097, 0, 0.2509804, 1, 1,
0.3842801, -1.712354, 1.592031, 0, 0.2431373, 1, 1,
0.3897451, -0.3838464, 0.3835689, 0, 0.2392157, 1, 1,
0.3905241, 1.028889, 0.6458161, 0, 0.2313726, 1, 1,
0.3931495, 1.337931, -0.1332867, 0, 0.227451, 1, 1,
0.3951291, 0.126761, 3.290332, 0, 0.2196078, 1, 1,
0.3993063, 0.3665845, 0.8508107, 0, 0.2156863, 1, 1,
0.4005573, -0.1974493, 3.477258, 0, 0.2078431, 1, 1,
0.4033782, 0.02149779, 1.67003, 0, 0.2039216, 1, 1,
0.4042917, -0.6291139, 3.378646, 0, 0.1960784, 1, 1,
0.4047622, -0.7040997, 4.411875, 0, 0.1882353, 1, 1,
0.4073738, 0.5156762, 3.03024, 0, 0.1843137, 1, 1,
0.4105958, 0.1364367, 3.329412, 0, 0.1764706, 1, 1,
0.4126735, 1.014576, -1.93502, 0, 0.172549, 1, 1,
0.4128701, -0.04489231, 1.983313, 0, 0.1647059, 1, 1,
0.413109, -0.6016262, 3.292297, 0, 0.1607843, 1, 1,
0.4149746, 1.572021, 0.7385256, 0, 0.1529412, 1, 1,
0.4169243, 1.507652, 1.076345, 0, 0.1490196, 1, 1,
0.4181043, -0.3856432, 0.939769, 0, 0.1411765, 1, 1,
0.4206273, 0.7771307, 0.1389702, 0, 0.1372549, 1, 1,
0.4216889, -0.3449541, 1.613853, 0, 0.1294118, 1, 1,
0.4219298, -4.254393, 3.357095, 0, 0.1254902, 1, 1,
0.4235035, -0.2652696, 2.45588, 0, 0.1176471, 1, 1,
0.4236266, -0.8563024, 4.774789, 0, 0.1137255, 1, 1,
0.4245898, 0.9145348, 0.7442877, 0, 0.1058824, 1, 1,
0.4317105, 0.1939647, 0.8505742, 0, 0.09803922, 1, 1,
0.4347743, 1.48201, 1.214972, 0, 0.09411765, 1, 1,
0.4363998, 0.2446225, -0.1259901, 0, 0.08627451, 1, 1,
0.4381597, 1.396408, 0.5265463, 0, 0.08235294, 1, 1,
0.4392536, 0.04148262, 0.9681618, 0, 0.07450981, 1, 1,
0.4404302, 0.814037, -1.392808, 0, 0.07058824, 1, 1,
0.4409395, -1.395915, 5.748192, 0, 0.0627451, 1, 1,
0.4600506, -0.5869877, 1.258225, 0, 0.05882353, 1, 1,
0.4609079, -0.1732354, 2.580101, 0, 0.05098039, 1, 1,
0.4637107, -0.02294745, 2.431606, 0, 0.04705882, 1, 1,
0.4751576, 0.7702991, -0.5050182, 0, 0.03921569, 1, 1,
0.4817413, -0.1139788, 1.184643, 0, 0.03529412, 1, 1,
0.4861378, -0.6963854, 2.470291, 0, 0.02745098, 1, 1,
0.4875973, -0.5378949, 1.780534, 0, 0.02352941, 1, 1,
0.4916914, 0.6259236, -0.2963618, 0, 0.01568628, 1, 1,
0.4925414, 0.5676466, 2.245562, 0, 0.01176471, 1, 1,
0.494164, 0.5715445, 1.013499, 0, 0.003921569, 1, 1,
0.4947004, 0.09893523, 0.7085391, 0.003921569, 0, 1, 1,
0.4955461, 0.3968142, 2.663944, 0.007843138, 0, 1, 1,
0.4985954, -1.712465, 3.21024, 0.01568628, 0, 1, 1,
0.5133005, -0.194551, 2.8715, 0.01960784, 0, 1, 1,
0.5147178, -0.4451993, 2.151586, 0.02745098, 0, 1, 1,
0.5194466, 1.249378, -0.4483055, 0.03137255, 0, 1, 1,
0.5197024, 1.309096, 0.590273, 0.03921569, 0, 1, 1,
0.5217103, 0.1909258, 0.9264444, 0.04313726, 0, 1, 1,
0.5255512, -0.006669256, 0.713506, 0.05098039, 0, 1, 1,
0.5256373, -0.726026, 0.8000212, 0.05490196, 0, 1, 1,
0.5272207, -0.2657927, 2.104214, 0.0627451, 0, 1, 1,
0.5317009, -1.070873, 3.022275, 0.06666667, 0, 1, 1,
0.5345536, 2.210818, 0.02480399, 0.07450981, 0, 1, 1,
0.5362857, 1.790269, -1.113034, 0.07843138, 0, 1, 1,
0.537015, -0.6984868, 1.759701, 0.08627451, 0, 1, 1,
0.5384595, 0.380945, 1.656421, 0.09019608, 0, 1, 1,
0.539135, -0.2073592, 0.746852, 0.09803922, 0, 1, 1,
0.5465236, 0.7113506, 0.1123457, 0.1058824, 0, 1, 1,
0.5493543, -0.4976979, 1.678763, 0.1098039, 0, 1, 1,
0.5574099, 0.4250061, 0.9724321, 0.1176471, 0, 1, 1,
0.5578055, -0.08955123, -0.2605928, 0.1215686, 0, 1, 1,
0.5590701, 0.3910032, 1.803777, 0.1294118, 0, 1, 1,
0.5608763, -1.090403, 2.957735, 0.1333333, 0, 1, 1,
0.5635953, 1.195853, 0.7207081, 0.1411765, 0, 1, 1,
0.5694976, 2.058429, -1.024274, 0.145098, 0, 1, 1,
0.5735189, -1.803382, 1.860785, 0.1529412, 0, 1, 1,
0.5754646, 0.4384273, -0.9526129, 0.1568628, 0, 1, 1,
0.5769991, -1.374582, 2.636291, 0.1647059, 0, 1, 1,
0.5780867, -0.6763553, 3.159525, 0.1686275, 0, 1, 1,
0.5833352, -0.7425243, 2.081915, 0.1764706, 0, 1, 1,
0.5834234, 1.391618, 1.403481, 0.1803922, 0, 1, 1,
0.5834849, 1.665249, 0.653882, 0.1882353, 0, 1, 1,
0.5866675, 1.054907, -0.257241, 0.1921569, 0, 1, 1,
0.5907913, 0.1934399, 2.419398, 0.2, 0, 1, 1,
0.5985646, 1.386014, -0.6334366, 0.2078431, 0, 1, 1,
0.6016686, -1.160591, 4.542369, 0.2117647, 0, 1, 1,
0.6149421, -0.1067686, 3.09507, 0.2196078, 0, 1, 1,
0.619863, -1.956811, 2.080838, 0.2235294, 0, 1, 1,
0.6202178, 2.992574, -0.05096985, 0.2313726, 0, 1, 1,
0.6205949, 0.4144543, -0.02806018, 0.2352941, 0, 1, 1,
0.6209939, -0.9177032, 2.498518, 0.2431373, 0, 1, 1,
0.6218306, 2.022718, -0.5427447, 0.2470588, 0, 1, 1,
0.6338407, 0.1158324, 2.260067, 0.254902, 0, 1, 1,
0.6388422, -0.4065022, 2.436172, 0.2588235, 0, 1, 1,
0.6609228, -1.036707, 0.4314376, 0.2666667, 0, 1, 1,
0.6626441, 0.6668881, -0.593249, 0.2705882, 0, 1, 1,
0.6708101, 0.6672237, 1.442155, 0.2784314, 0, 1, 1,
0.6752794, 0.2283788, 0.5829875, 0.282353, 0, 1, 1,
0.6756195, 0.1745142, 1.081033, 0.2901961, 0, 1, 1,
0.6763632, 0.5061885, 1.4532, 0.2941177, 0, 1, 1,
0.6771359, -3.259849, 1.284451, 0.3019608, 0, 1, 1,
0.6818367, -0.2289089, 2.150546, 0.3098039, 0, 1, 1,
0.6862871, -0.5123624, 0.3513676, 0.3137255, 0, 1, 1,
0.6908231, 0.4981098, 1.130807, 0.3215686, 0, 1, 1,
0.6913635, 1.48431, -0.01527165, 0.3254902, 0, 1, 1,
0.6933267, 1.88584, 1.082106, 0.3333333, 0, 1, 1,
0.694353, -1.783853, 5.198557, 0.3372549, 0, 1, 1,
0.6958913, -0.9483095, 2.059076, 0.345098, 0, 1, 1,
0.6973708, -0.6145816, 2.603672, 0.3490196, 0, 1, 1,
0.7024103, -1.397893, 1.045518, 0.3568628, 0, 1, 1,
0.7034985, 0.7303203, -0.08842805, 0.3607843, 0, 1, 1,
0.7056229, -0.06776454, 2.337597, 0.3686275, 0, 1, 1,
0.7107427, -0.1646704, 1.26766, 0.372549, 0, 1, 1,
0.7147831, 0.7353387, 1.095154, 0.3803922, 0, 1, 1,
0.715468, -0.3323137, 2.942936, 0.3843137, 0, 1, 1,
0.7204269, 1.685532, -1.032966, 0.3921569, 0, 1, 1,
0.7209615, -0.7348531, 3.511963, 0.3960784, 0, 1, 1,
0.7257632, 0.387775, 0.9275391, 0.4039216, 0, 1, 1,
0.7268445, 0.3487549, 0.1816296, 0.4117647, 0, 1, 1,
0.7270465, 2.221641, -0.5759864, 0.4156863, 0, 1, 1,
0.7383156, 1.097518, -0.3422236, 0.4235294, 0, 1, 1,
0.7391538, -0.2726608, 3.509082, 0.427451, 0, 1, 1,
0.7412058, -1.541833, 2.391946, 0.4352941, 0, 1, 1,
0.745426, -0.4314666, 4.391271, 0.4392157, 0, 1, 1,
0.747631, 0.5972516, 1.05069, 0.4470588, 0, 1, 1,
0.749635, -0.08044671, 0.6239585, 0.4509804, 0, 1, 1,
0.7540162, 0.06349199, 0.9485763, 0.4588235, 0, 1, 1,
0.7565957, -0.156504, 3.353848, 0.4627451, 0, 1, 1,
0.7586405, -0.6564275, 2.744484, 0.4705882, 0, 1, 1,
0.7685214, -0.9635652, 3.922923, 0.4745098, 0, 1, 1,
0.778221, 0.6515897, 3.113343, 0.4823529, 0, 1, 1,
0.7799325, 0.5465009, -1.212517, 0.4862745, 0, 1, 1,
0.7843711, 0.9830881, 1.622961, 0.4941176, 0, 1, 1,
0.7864611, 1.551735, 1.874918, 0.5019608, 0, 1, 1,
0.7865143, -0.9635736, 0.9420135, 0.5058824, 0, 1, 1,
0.7866462, -0.9134479, 2.126063, 0.5137255, 0, 1, 1,
0.7869226, -1.026696, 2.388137, 0.5176471, 0, 1, 1,
0.7890841, 0.6737902, 2.926004, 0.5254902, 0, 1, 1,
0.7904573, -0.5064148, 3.969717, 0.5294118, 0, 1, 1,
0.7970464, -0.5992587, 2.5194, 0.5372549, 0, 1, 1,
0.7973254, -1.405389, 2.330718, 0.5411765, 0, 1, 1,
0.798445, 0.6090287, 0.4293761, 0.5490196, 0, 1, 1,
0.7986578, 2.221483, 0.2467426, 0.5529412, 0, 1, 1,
0.8087773, -0.9052467, 4.199294, 0.5607843, 0, 1, 1,
0.8122786, 0.5573742, 1.595446, 0.5647059, 0, 1, 1,
0.8125396, -0.6308048, 1.933462, 0.572549, 0, 1, 1,
0.8137205, 0.38817, 1.284003, 0.5764706, 0, 1, 1,
0.814063, 0.2708519, -1.212862, 0.5843138, 0, 1, 1,
0.8152124, -0.136287, 1.176645, 0.5882353, 0, 1, 1,
0.8165576, -1.089507, 2.335078, 0.5960785, 0, 1, 1,
0.8184918, 1.968784, -1.245641, 0.6039216, 0, 1, 1,
0.8226365, 0.6135398, 1.515165, 0.6078432, 0, 1, 1,
0.8290688, 0.7411675, 2.894449, 0.6156863, 0, 1, 1,
0.8352289, -1.54619, 1.783199, 0.6196079, 0, 1, 1,
0.8379444, -1.252285, 3.090897, 0.627451, 0, 1, 1,
0.8400462, 0.2384904, 2.38413, 0.6313726, 0, 1, 1,
0.8401355, 1.203455, 0.7074488, 0.6392157, 0, 1, 1,
0.8406873, -1.50524, 2.80111, 0.6431373, 0, 1, 1,
0.8411478, -1.212083, 1.565722, 0.6509804, 0, 1, 1,
0.8484969, -0.7542874, 2.302871, 0.654902, 0, 1, 1,
0.8496613, 0.8201886, -0.2899547, 0.6627451, 0, 1, 1,
0.850009, -1.014567, 2.581089, 0.6666667, 0, 1, 1,
0.8509114, -1.737737, 3.553685, 0.6745098, 0, 1, 1,
0.8546426, 1.158852, 2.50865, 0.6784314, 0, 1, 1,
0.8555693, -0.4382248, 2.796474, 0.6862745, 0, 1, 1,
0.8597422, 0.1466473, 1.143846, 0.6901961, 0, 1, 1,
0.8651402, -0.155476, 1.838074, 0.6980392, 0, 1, 1,
0.8684677, 0.7455804, 0.8787352, 0.7058824, 0, 1, 1,
0.8700877, 0.6416212, 1.423623, 0.7098039, 0, 1, 1,
0.8722169, 0.7494983, 1.059538, 0.7176471, 0, 1, 1,
0.8739352, -0.2003993, 1.991839, 0.7215686, 0, 1, 1,
0.8748635, -0.00771101, 2.42714, 0.7294118, 0, 1, 1,
0.8806912, 0.1337076, 1.995361, 0.7333333, 0, 1, 1,
0.8829256, -0.4940127, 3.035531, 0.7411765, 0, 1, 1,
0.8855985, 0.6490805, 1.525791, 0.7450981, 0, 1, 1,
0.8865373, -0.1457671, 2.122556, 0.7529412, 0, 1, 1,
0.8899981, 0.01699704, 1.934087, 0.7568628, 0, 1, 1,
0.890179, -0.8418856, 4.076035, 0.7647059, 0, 1, 1,
0.8911715, -0.04280574, 1.881453, 0.7686275, 0, 1, 1,
0.8978958, 0.1901389, 1.509052, 0.7764706, 0, 1, 1,
0.9003909, -0.1855507, 1.566057, 0.7803922, 0, 1, 1,
0.907353, -1.924707, 2.033422, 0.7882353, 0, 1, 1,
0.9083134, 0.4512123, 0.7475054, 0.7921569, 0, 1, 1,
0.9091829, 2.238785, -0.09241989, 0.8, 0, 1, 1,
0.9140225, -1.278315, 3.238775, 0.8078431, 0, 1, 1,
0.9147737, -1.161866, 4.19136, 0.8117647, 0, 1, 1,
0.9192494, 0.6473116, 1.820015, 0.8196079, 0, 1, 1,
0.9263446, 0.8954235, 0.7875017, 0.8235294, 0, 1, 1,
0.9307963, -0.3940682, 1.963809, 0.8313726, 0, 1, 1,
0.930942, 0.3550953, 3.066908, 0.8352941, 0, 1, 1,
0.931627, 0.99137, -1.839921, 0.8431373, 0, 1, 1,
0.9316955, 0.03154097, 2.265669, 0.8470588, 0, 1, 1,
0.9352009, 0.2326511, 1.434026, 0.854902, 0, 1, 1,
0.9410191, 0.001308507, 1.567069, 0.8588235, 0, 1, 1,
0.9418103, 0.3066827, 2.451246, 0.8666667, 0, 1, 1,
0.9421449, -1.342008, 2.135067, 0.8705882, 0, 1, 1,
0.9434612, -0.3659578, 3.911887, 0.8784314, 0, 1, 1,
0.9464867, 1.291484, 0.04348493, 0.8823529, 0, 1, 1,
0.9483455, 0.5498855, 2.152291, 0.8901961, 0, 1, 1,
0.950525, 0.02019073, 1.672415, 0.8941177, 0, 1, 1,
0.9511395, 0.07866761, 0.3336743, 0.9019608, 0, 1, 1,
0.9586625, -1.339246, 2.013612, 0.9098039, 0, 1, 1,
0.9597563, 0.4432781, 1.016824, 0.9137255, 0, 1, 1,
0.9608402, 2.412851, 0.52716, 0.9215686, 0, 1, 1,
0.9626825, -0.1836593, 3.33746, 0.9254902, 0, 1, 1,
0.9627259, 0.74991, 0.8555924, 0.9333333, 0, 1, 1,
0.964296, -0.2429035, 1.332132, 0.9372549, 0, 1, 1,
0.9650171, -0.1317481, 0.4873264, 0.945098, 0, 1, 1,
0.9676355, -1.830643, 3.028856, 0.9490196, 0, 1, 1,
0.9693316, 0.1172668, 0.5521876, 0.9568627, 0, 1, 1,
0.970145, -1.545518, 2.495323, 0.9607843, 0, 1, 1,
0.9712656, 1.192551, 0.3575336, 0.9686275, 0, 1, 1,
0.9741451, -0.6326426, 3.733292, 0.972549, 0, 1, 1,
0.9754412, -0.9685103, 0.2743688, 0.9803922, 0, 1, 1,
0.9766485, 0.7572212, 0.7136407, 0.9843137, 0, 1, 1,
0.9782707, 1.01392, 0.8012096, 0.9921569, 0, 1, 1,
0.9808145, 0.4428583, 1.476119, 0.9960784, 0, 1, 1,
0.9896042, -1.224896, 2.822655, 1, 0, 0.9960784, 1,
0.9952609, 0.2057777, 1.075124, 1, 0, 0.9882353, 1,
1.015826, 0.5859342, 0.791488, 1, 0, 0.9843137, 1,
1.01604, 0.3395632, 2.235035, 1, 0, 0.9764706, 1,
1.016961, 0.5353245, 0.1680523, 1, 0, 0.972549, 1,
1.019678, -1.743083, 2.105134, 1, 0, 0.9647059, 1,
1.02, -0.4859062, 1.863894, 1, 0, 0.9607843, 1,
1.025218, 0.2397301, -0.1737469, 1, 0, 0.9529412, 1,
1.03081, 1.091046, 0.9579512, 1, 0, 0.9490196, 1,
1.03565, -0.3500016, 2.55597, 1, 0, 0.9411765, 1,
1.036559, -0.4870518, 1.879012, 1, 0, 0.9372549, 1,
1.038091, 0.2148291, 0.1368034, 1, 0, 0.9294118, 1,
1.044493, -0.1004118, 3.720252, 1, 0, 0.9254902, 1,
1.049082, -0.9051175, 1.759208, 1, 0, 0.9176471, 1,
1.055414, -0.3037936, 3.970552, 1, 0, 0.9137255, 1,
1.059706, 0.3571328, 2.302264, 1, 0, 0.9058824, 1,
1.062335, -1.047957, 2.8965, 1, 0, 0.9019608, 1,
1.068601, -0.3687817, 0.5979347, 1, 0, 0.8941177, 1,
1.070774, 0.294988, 1.069274, 1, 0, 0.8862745, 1,
1.075143, 2.699915, 0.7194918, 1, 0, 0.8823529, 1,
1.081033, 0.3312255, 3.458713, 1, 0, 0.8745098, 1,
1.081514, 0.5271465, 0.1544763, 1, 0, 0.8705882, 1,
1.082164, -0.901817, 1.359651, 1, 0, 0.8627451, 1,
1.085882, -1.974132, 1.166319, 1, 0, 0.8588235, 1,
1.096473, -2.434185, 3.473414, 1, 0, 0.8509804, 1,
1.104473, -0.7013707, 0.5458577, 1, 0, 0.8470588, 1,
1.116006, -1.066177, 1.803645, 1, 0, 0.8392157, 1,
1.117627, 1.099258, 1.601342, 1, 0, 0.8352941, 1,
1.121822, -0.4633228, 2.589571, 1, 0, 0.827451, 1,
1.123881, -1.330844, 0.9423466, 1, 0, 0.8235294, 1,
1.132589, 1.181574, 0.6902542, 1, 0, 0.8156863, 1,
1.136124, 0.680104, 1.469456, 1, 0, 0.8117647, 1,
1.138408, -0.7072186, -0.2203888, 1, 0, 0.8039216, 1,
1.14106, -0.6780802, 1.99778, 1, 0, 0.7960784, 1,
1.142288, 0.6626163, 1.988859, 1, 0, 0.7921569, 1,
1.15098, 0.3183119, 1.669156, 1, 0, 0.7843137, 1,
1.159562, 0.2910958, 0.4006294, 1, 0, 0.7803922, 1,
1.168743, 1.308866, 0.03726602, 1, 0, 0.772549, 1,
1.192174, 0.9278874, 1.195326, 1, 0, 0.7686275, 1,
1.199337, 0.3291633, 2.43836, 1, 0, 0.7607843, 1,
1.204489, -1.186791, 1.610614, 1, 0, 0.7568628, 1,
1.206861, 0.5926351, 1.228024, 1, 0, 0.7490196, 1,
1.217482, -0.02601159, 2.39453, 1, 0, 0.7450981, 1,
1.220871, 1.393549, 0.5328856, 1, 0, 0.7372549, 1,
1.258518, -0.3442087, 1.790088, 1, 0, 0.7333333, 1,
1.260322, 1.587664, 1.880698, 1, 0, 0.7254902, 1,
1.261457, 0.08926792, 2.337016, 1, 0, 0.7215686, 1,
1.268537, -0.3695942, 3.020528, 1, 0, 0.7137255, 1,
1.272519, -0.913798, 2.966344, 1, 0, 0.7098039, 1,
1.274286, -0.9674129, 2.225797, 1, 0, 0.7019608, 1,
1.281069, 0.1908041, -1.102715, 1, 0, 0.6941177, 1,
1.28922, -1.23253, 1.888556, 1, 0, 0.6901961, 1,
1.289259, -0.04445255, 2.501258, 1, 0, 0.682353, 1,
1.295135, 0.06254763, 1.77917, 1, 0, 0.6784314, 1,
1.309405, -1.060986, 0.6944867, 1, 0, 0.6705883, 1,
1.309577, 0.7822531, 0.5996184, 1, 0, 0.6666667, 1,
1.316711, -0.594005, 1.595295, 1, 0, 0.6588235, 1,
1.321719, 0.6617179, 1.593915, 1, 0, 0.654902, 1,
1.327054, 0.3292917, 1.518196, 1, 0, 0.6470588, 1,
1.32741, -0.4972694, 2.216242, 1, 0, 0.6431373, 1,
1.332983, 1.649403, -0.7689394, 1, 0, 0.6352941, 1,
1.334822, 0.2645078, -0.215499, 1, 0, 0.6313726, 1,
1.340274, -0.3034503, 0.3017356, 1, 0, 0.6235294, 1,
1.345623, 0.1444075, 2.571432, 1, 0, 0.6196079, 1,
1.359249, -0.3838075, 2.765821, 1, 0, 0.6117647, 1,
1.361715, 0.01587224, 2.661089, 1, 0, 0.6078432, 1,
1.369512, -0.5858157, 0.8061811, 1, 0, 0.6, 1,
1.37313, -1.581288, 1.639919, 1, 0, 0.5921569, 1,
1.376039, 0.6569613, 1.316996, 1, 0, 0.5882353, 1,
1.377226, -1.005417, 2.531, 1, 0, 0.5803922, 1,
1.380611, -1.436582, 1.373367, 1, 0, 0.5764706, 1,
1.38286, 0.7954871, 0.9875178, 1, 0, 0.5686275, 1,
1.38596, 1.321622, 0.5651346, 1, 0, 0.5647059, 1,
1.38919, -1.91689, 3.625922, 1, 0, 0.5568628, 1,
1.408694, 0.7837877, 1.868015, 1, 0, 0.5529412, 1,
1.410087, 1.070588, 1.364827, 1, 0, 0.5450981, 1,
1.410718, 0.7195946, 1.517044, 1, 0, 0.5411765, 1,
1.413269, 0.3695459, 1.325193, 1, 0, 0.5333334, 1,
1.413874, 1.919682, -2.06782, 1, 0, 0.5294118, 1,
1.414475, -0.4746197, 2.006463, 1, 0, 0.5215687, 1,
1.415205, 0.4983424, 0.6664073, 1, 0, 0.5176471, 1,
1.41963, -0.182803, 1.845471, 1, 0, 0.509804, 1,
1.419936, -1.247217, 1.71279, 1, 0, 0.5058824, 1,
1.421555, 1.452907, -0.1437961, 1, 0, 0.4980392, 1,
1.426236, -0.2099829, 3.986895, 1, 0, 0.4901961, 1,
1.436438, -0.882688, 1.499241, 1, 0, 0.4862745, 1,
1.440511, 0.4714561, 0.8857531, 1, 0, 0.4784314, 1,
1.44833, 0.6037135, 0.7486406, 1, 0, 0.4745098, 1,
1.452431, 1.020649, -0.1392322, 1, 0, 0.4666667, 1,
1.45887, 1.654094, 1.876438, 1, 0, 0.4627451, 1,
1.466083, 0.580076, -0.3418966, 1, 0, 0.454902, 1,
1.482116, -1.339107, 3.468515, 1, 0, 0.4509804, 1,
1.485411, 0.6531371, 1.502372, 1, 0, 0.4431373, 1,
1.490951, 0.5064151, 3.297596, 1, 0, 0.4392157, 1,
1.496982, -0.06555006, 0.160838, 1, 0, 0.4313726, 1,
1.515015, 0.1047322, 0.8435727, 1, 0, 0.427451, 1,
1.522937, 0.1985566, 2.584407, 1, 0, 0.4196078, 1,
1.523132, -0.08309772, 2.059955, 1, 0, 0.4156863, 1,
1.526277, -1.081754, 2.068348, 1, 0, 0.4078431, 1,
1.538235, 0.8323244, 0.4780333, 1, 0, 0.4039216, 1,
1.543844, -0.4625143, 1.929465, 1, 0, 0.3960784, 1,
1.54827, 1.066366, 2.756873, 1, 0, 0.3882353, 1,
1.576479, 0.1418839, 4.425487, 1, 0, 0.3843137, 1,
1.581241, -0.3446319, 0.9891016, 1, 0, 0.3764706, 1,
1.587129, 0.1829271, 1.278872, 1, 0, 0.372549, 1,
1.587237, -0.9662984, 2.292419, 1, 0, 0.3647059, 1,
1.587695, -2.343162, 2.464363, 1, 0, 0.3607843, 1,
1.593536, -0.107466, 1.189857, 1, 0, 0.3529412, 1,
1.604934, 1.067245, 2.089844, 1, 0, 0.3490196, 1,
1.605856, -0.3717864, 1.74204, 1, 0, 0.3411765, 1,
1.612677, 0.8285806, 2.945492, 1, 0, 0.3372549, 1,
1.648541, 1.134614, -0.3731242, 1, 0, 0.3294118, 1,
1.653173, 1.15901, 1.178887, 1, 0, 0.3254902, 1,
1.654497, 0.5227942, -0.2921909, 1, 0, 0.3176471, 1,
1.67068, -0.4496923, 0.6855071, 1, 0, 0.3137255, 1,
1.678844, -1.47081, 0.9151269, 1, 0, 0.3058824, 1,
1.686325, 0.5918382, 0.7064621, 1, 0, 0.2980392, 1,
1.686548, -1.335572, 1.088848, 1, 0, 0.2941177, 1,
1.68806, -0.4208767, 1.282873, 1, 0, 0.2862745, 1,
1.712808, 1.28912, 1.120613, 1, 0, 0.282353, 1,
1.713383, -0.06159388, 0.800354, 1, 0, 0.2745098, 1,
1.722084, 0.2021987, 0.9457248, 1, 0, 0.2705882, 1,
1.724355, -0.668996, 3.329211, 1, 0, 0.2627451, 1,
1.74189, -0.8302479, 1.790477, 1, 0, 0.2588235, 1,
1.744332, 0.702867, 0.2732653, 1, 0, 0.2509804, 1,
1.749735, 2.956501, 0.7901995, 1, 0, 0.2470588, 1,
1.758074, -2.091482, 3.75492, 1, 0, 0.2392157, 1,
1.772711, -0.8892227, 2.351109, 1, 0, 0.2352941, 1,
1.809168, -0.867748, 4.268364, 1, 0, 0.227451, 1,
1.825602, -0.1370562, 2.274883, 1, 0, 0.2235294, 1,
1.845713, 0.3105381, 1.398771, 1, 0, 0.2156863, 1,
1.857875, -0.3458062, 2.17212, 1, 0, 0.2117647, 1,
1.880334, -1.448684, 0.8560606, 1, 0, 0.2039216, 1,
1.935867, -0.01611264, 2.186003, 1, 0, 0.1960784, 1,
1.968731, -0.2395068, 2.235661, 1, 0, 0.1921569, 1,
1.980857, -0.9210989, 2.042456, 1, 0, 0.1843137, 1,
1.984186, -0.7552974, 1.625133, 1, 0, 0.1803922, 1,
2.03766, 0.1672762, 1.091018, 1, 0, 0.172549, 1,
2.042311, -0.06369319, 0.569885, 1, 0, 0.1686275, 1,
2.04442, 0.8013266, 0.8499542, 1, 0, 0.1607843, 1,
2.052145, 0.0426956, 1.891629, 1, 0, 0.1568628, 1,
2.052187, -0.2821661, 2.666987, 1, 0, 0.1490196, 1,
2.116467, 0.1272379, 1.013444, 1, 0, 0.145098, 1,
2.126541, -1.838903, 1.521825, 1, 0, 0.1372549, 1,
2.144752, 1.153983, 0.2746056, 1, 0, 0.1333333, 1,
2.1993, 0.5046807, 3.704781, 1, 0, 0.1254902, 1,
2.217995, -1.688996, 2.890431, 1, 0, 0.1215686, 1,
2.249077, 0.7354381, 2.287006, 1, 0, 0.1137255, 1,
2.291021, 0.6341399, 2.720613, 1, 0, 0.1098039, 1,
2.311475, 0.4786012, -0.01084176, 1, 0, 0.1019608, 1,
2.36651, -0.5965043, 0.9264681, 1, 0, 0.09411765, 1,
2.375283, 0.1785687, 0.6782171, 1, 0, 0.09019608, 1,
2.385643, -0.7864864, 1.418707, 1, 0, 0.08235294, 1,
2.496086, -1.215364, 0.4733523, 1, 0, 0.07843138, 1,
2.508197, 0.6905235, 0.2263121, 1, 0, 0.07058824, 1,
2.586298, 0.6460438, -0.3280334, 1, 0, 0.06666667, 1,
2.629384, -0.6572599, -0.6589836, 1, 0, 0.05882353, 1,
2.636598, 0.2760167, 1.057188, 1, 0, 0.05490196, 1,
2.690222, -0.806797, 0.9476204, 1, 0, 0.04705882, 1,
2.757146, -0.2848867, 2.231097, 1, 0, 0.04313726, 1,
2.918011, -1.099753, 0.8760761, 1, 0, 0.03529412, 1,
2.938078, -0.6962616, 3.406174, 1, 0, 0.03137255, 1,
3.042016, -0.02375949, 0.006532351, 1, 0, 0.02352941, 1,
3.076359, 1.735665, 0.6629481, 1, 0, 0.01960784, 1,
3.151745, 0.41279, 1.601433, 1, 0, 0.01176471, 1,
3.220142, -0.444517, 1.831647, 1, 0, 0.007843138, 1
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
-0.02981174, -5.6284, -6.785884, 0, -0.5, 0.5, 0.5,
-0.02981174, -5.6284, -6.785884, 1, -0.5, 0.5, 0.5,
-0.02981174, -5.6284, -6.785884, 1, 1.5, 0.5, 0.5,
-0.02981174, -5.6284, -6.785884, 0, 1.5, 0.5, 0.5
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
-4.3815, -0.2012722, -6.785884, 0, -0.5, 0.5, 0.5,
-4.3815, -0.2012722, -6.785884, 1, -0.5, 0.5, 0.5,
-4.3815, -0.2012722, -6.785884, 1, 1.5, 0.5, 0.5,
-4.3815, -0.2012722, -6.785884, 0, 1.5, 0.5, 0.5
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
-4.3815, -5.6284, 0.3894594, 0, -0.5, 0.5, 0.5,
-4.3815, -5.6284, 0.3894594, 1, -0.5, 0.5, 0.5,
-4.3815, -5.6284, 0.3894594, 1, 1.5, 0.5, 0.5,
-4.3815, -5.6284, 0.3894594, 0, 1.5, 0.5, 0.5
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
-3, -4.375986, -5.130035,
3, -4.375986, -5.130035,
-3, -4.375986, -5.130035,
-3, -4.584722, -5.40601,
-2, -4.375986, -5.130035,
-2, -4.584722, -5.40601,
-1, -4.375986, -5.130035,
-1, -4.584722, -5.40601,
0, -4.375986, -5.130035,
0, -4.584722, -5.40601,
1, -4.375986, -5.130035,
1, -4.584722, -5.40601,
2, -4.375986, -5.130035,
2, -4.584722, -5.40601,
3, -4.375986, -5.130035,
3, -4.584722, -5.40601
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
-3, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
-3, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
-3, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
-3, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
-2, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
-2, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
-2, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
-2, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
-1, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
-1, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
-1, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
-1, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
0, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
0, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
0, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
0, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
1, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
1, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
1, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
1, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
2, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
2, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
2, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
2, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5,
3, -5.002193, -5.95796, 0, -0.5, 0.5, 0.5,
3, -5.002193, -5.95796, 1, -0.5, 0.5, 0.5,
3, -5.002193, -5.95796, 1, 1.5, 0.5, 0.5,
3, -5.002193, -5.95796, 0, 1.5, 0.5, 0.5
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
-3.377264, -4, -5.130035,
-3.377264, 2, -5.130035,
-3.377264, -4, -5.130035,
-3.544636, -4, -5.40601,
-3.377264, -2, -5.130035,
-3.544636, -2, -5.40601,
-3.377264, 0, -5.130035,
-3.544636, 0, -5.40601,
-3.377264, 2, -5.130035,
-3.544636, 2, -5.40601
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
-3.879382, -4, -5.95796, 0, -0.5, 0.5, 0.5,
-3.879382, -4, -5.95796, 1, -0.5, 0.5, 0.5,
-3.879382, -4, -5.95796, 1, 1.5, 0.5, 0.5,
-3.879382, -4, -5.95796, 0, 1.5, 0.5, 0.5,
-3.879382, -2, -5.95796, 0, -0.5, 0.5, 0.5,
-3.879382, -2, -5.95796, 1, -0.5, 0.5, 0.5,
-3.879382, -2, -5.95796, 1, 1.5, 0.5, 0.5,
-3.879382, -2, -5.95796, 0, 1.5, 0.5, 0.5,
-3.879382, 0, -5.95796, 0, -0.5, 0.5, 0.5,
-3.879382, 0, -5.95796, 1, -0.5, 0.5, 0.5,
-3.879382, 0, -5.95796, 1, 1.5, 0.5, 0.5,
-3.879382, 0, -5.95796, 0, 1.5, 0.5, 0.5,
-3.879382, 2, -5.95796, 0, -0.5, 0.5, 0.5,
-3.879382, 2, -5.95796, 1, -0.5, 0.5, 0.5,
-3.879382, 2, -5.95796, 1, 1.5, 0.5, 0.5,
-3.879382, 2, -5.95796, 0, 1.5, 0.5, 0.5
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
-3.377264, -4.375986, -4,
-3.377264, -4.375986, 4,
-3.377264, -4.375986, -4,
-3.544636, -4.584722, -4,
-3.377264, -4.375986, -2,
-3.544636, -4.584722, -2,
-3.377264, -4.375986, 0,
-3.544636, -4.584722, 0,
-3.377264, -4.375986, 2,
-3.544636, -4.584722, 2,
-3.377264, -4.375986, 4,
-3.544636, -4.584722, 4
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
-3.879382, -5.002193, -4, 0, -0.5, 0.5, 0.5,
-3.879382, -5.002193, -4, 1, -0.5, 0.5, 0.5,
-3.879382, -5.002193, -4, 1, 1.5, 0.5, 0.5,
-3.879382, -5.002193, -4, 0, 1.5, 0.5, 0.5,
-3.879382, -5.002193, -2, 0, -0.5, 0.5, 0.5,
-3.879382, -5.002193, -2, 1, -0.5, 0.5, 0.5,
-3.879382, -5.002193, -2, 1, 1.5, 0.5, 0.5,
-3.879382, -5.002193, -2, 0, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 0, 0, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 0, 1, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 0, 1, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 0, 0, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 2, 0, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 2, 1, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 2, 1, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 2, 0, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 4, 0, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 4, 1, -0.5, 0.5, 0.5,
-3.879382, -5.002193, 4, 1, 1.5, 0.5, 0.5,
-3.879382, -5.002193, 4, 0, 1.5, 0.5, 0.5
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
-3.377264, -4.375986, -5.130035,
-3.377264, 3.973442, -5.130035,
-3.377264, -4.375986, 5.908954,
-3.377264, 3.973442, 5.908954,
-3.377264, -4.375986, -5.130035,
-3.377264, -4.375986, 5.908954,
-3.377264, 3.973442, -5.130035,
-3.377264, 3.973442, 5.908954,
-3.377264, -4.375986, -5.130035,
3.317641, -4.375986, -5.130035,
-3.377264, -4.375986, 5.908954,
3.317641, -4.375986, 5.908954,
-3.377264, 3.973442, -5.130035,
3.317641, 3.973442, -5.130035,
-3.377264, 3.973442, 5.908954,
3.317641, 3.973442, 5.908954,
3.317641, -4.375986, -5.130035,
3.317641, 3.973442, -5.130035,
3.317641, -4.375986, 5.908954,
3.317641, 3.973442, 5.908954,
3.317641, -4.375986, -5.130035,
3.317641, -4.375986, 5.908954,
3.317641, 3.973442, -5.130035,
3.317641, 3.973442, 5.908954
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
var radius = 8.21001;
var distance = 36.52726;
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
mvMatrix.translate( 0.02981174, 0.2012722, -0.3894594 );
mvMatrix.scale( 1.325907, 1.063165, 0.8041337 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.52726);
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
ioxynil<-read.table("ioxynil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ioxynil$V2
```

```
## Error in eval(expr, envir, enclos): object 'ioxynil' not found
```

```r
y<-ioxynil$V3
```

```
## Error in eval(expr, envir, enclos): object 'ioxynil' not found
```

```r
z<-ioxynil$V4
```

```
## Error in eval(expr, envir, enclos): object 'ioxynil' not found
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
-3.279765, -1.186805, -2.377284, 0, 0, 1, 1, 1,
-3.145706, 0.1471712, -0.07693898, 1, 0, 0, 1, 1,
-3.005111, 0.2004061, -1.270949, 1, 0, 0, 1, 1,
-2.834043, -1.477341, -4.22196, 1, 0, 0, 1, 1,
-2.701136, -0.8451146, -1.098773, 1, 0, 0, 1, 1,
-2.67904, -1.112286, -1.896689, 1, 0, 0, 1, 1,
-2.57678, 1.241033, -0.45751, 0, 0, 0, 1, 1,
-2.575148, -0.1205578, -0.5899166, 0, 0, 0, 1, 1,
-2.543504, -1.018079, -2.730618, 0, 0, 0, 1, 1,
-2.470844, -1.227301, -1.736064, 0, 0, 0, 1, 1,
-2.413035, -0.1082599, -0.6845039, 0, 0, 0, 1, 1,
-2.321217, 1.075866, -2.626611, 0, 0, 0, 1, 1,
-2.276066, 0.1799504, -1.113899, 0, 0, 0, 1, 1,
-2.252526, 1.094349, -0.4803947, 1, 1, 1, 1, 1,
-2.234122, 0.5262296, -1.906549, 1, 1, 1, 1, 1,
-2.122027, 0.2167188, -3.671089, 1, 1, 1, 1, 1,
-2.087076, 0.8247213, -1.698718, 1, 1, 1, 1, 1,
-2.002071, -1.753927, -1.363828, 1, 1, 1, 1, 1,
-1.987248, 0.5631706, -0.2420233, 1, 1, 1, 1, 1,
-1.981487, 0.673377, -1.342791, 1, 1, 1, 1, 1,
-1.940587, -0.2330579, -2.792117, 1, 1, 1, 1, 1,
-1.939408, 3.851848, -0.8916772, 1, 1, 1, 1, 1,
-1.914516, -0.9621097, -2.456151, 1, 1, 1, 1, 1,
-1.911376, -0.4148585, -2.64544, 1, 1, 1, 1, 1,
-1.900481, -0.02726077, -1.972754, 1, 1, 1, 1, 1,
-1.890501, 1.259446, -0.8731307, 1, 1, 1, 1, 1,
-1.859913, 1.376083, 0.2215138, 1, 1, 1, 1, 1,
-1.835115, 1.547193, -0.314382, 1, 1, 1, 1, 1,
-1.832113, -0.8052679, -2.838024, 0, 0, 1, 1, 1,
-1.817084, 0.3498906, -1.258792, 1, 0, 0, 1, 1,
-1.79727, 1.688746, -1.181257, 1, 0, 0, 1, 1,
-1.79216, -0.2928278, -1.524326, 1, 0, 0, 1, 1,
-1.789171, 0.4729199, -2.755584, 1, 0, 0, 1, 1,
-1.787428, 0.297932, -2.240952, 1, 0, 0, 1, 1,
-1.759822, 0.8099157, -1.102353, 0, 0, 0, 1, 1,
-1.74895, -0.002150472, -1.671506, 0, 0, 0, 1, 1,
-1.725437, 0.4607851, -1.395572, 0, 0, 0, 1, 1,
-1.707052, 0.7180572, -0.736266, 0, 0, 0, 1, 1,
-1.688036, -2.290425, -2.072158, 0, 0, 0, 1, 1,
-1.687281, 0.5310467, -1.603646, 0, 0, 0, 1, 1,
-1.66328, 1.162507, 1.306543, 0, 0, 0, 1, 1,
-1.659155, -0.1717763, -2.326472, 1, 1, 1, 1, 1,
-1.652788, 0.765784, -1.336426, 1, 1, 1, 1, 1,
-1.635104, 0.206421, -1.49107, 1, 1, 1, 1, 1,
-1.626108, -0.4247459, -3.048252, 1, 1, 1, 1, 1,
-1.621006, -0.09791146, -1.658359, 1, 1, 1, 1, 1,
-1.620305, 0.5991434, -1.127592, 1, 1, 1, 1, 1,
-1.586886, 0.3329422, -2.792214, 1, 1, 1, 1, 1,
-1.583924, 0.8190174, -0.509582, 1, 1, 1, 1, 1,
-1.577406, -0.6418407, -3.495064, 1, 1, 1, 1, 1,
-1.574577, 1.883863, -0.9905052, 1, 1, 1, 1, 1,
-1.566798, -0.3232539, -3.263775, 1, 1, 1, 1, 1,
-1.565675, -0.8646795, -0.06598417, 1, 1, 1, 1, 1,
-1.546959, 0.4559333, -0.3950492, 1, 1, 1, 1, 1,
-1.545711, 0.8214658, -2.252932, 1, 1, 1, 1, 1,
-1.543884, 1.539623, 0.3020491, 1, 1, 1, 1, 1,
-1.542152, -1.496622, -2.059867, 0, 0, 1, 1, 1,
-1.541259, -1.519197, -0.998835, 1, 0, 0, 1, 1,
-1.533735, -0.7471836, -2.25701, 1, 0, 0, 1, 1,
-1.5337, 0.05848628, -0.2014649, 1, 0, 0, 1, 1,
-1.529074, 0.7158378, 0.4997242, 1, 0, 0, 1, 1,
-1.523433, -1.702255, -4.771173, 1, 0, 0, 1, 1,
-1.517751, 1.805869, -0.3271711, 0, 0, 0, 1, 1,
-1.50292, 1.329119, -0.9927719, 0, 0, 0, 1, 1,
-1.496023, -1.689647, -2.610118, 0, 0, 0, 1, 1,
-1.490809, -0.1692268, -1.982502, 0, 0, 0, 1, 1,
-1.486044, -0.02478882, -1.233923, 0, 0, 0, 1, 1,
-1.485975, 1.793939, 0.2244729, 0, 0, 0, 1, 1,
-1.475965, -0.7579265, -3.121962, 0, 0, 0, 1, 1,
-1.454648, -0.2058569, -2.783763, 1, 1, 1, 1, 1,
-1.442416, 0.5876311, 0.4819041, 1, 1, 1, 1, 1,
-1.436621, 1.214062, -2.273648, 1, 1, 1, 1, 1,
-1.432243, 1.55721, -0.7434267, 1, 1, 1, 1, 1,
-1.426502, -1.255899, -1.140692, 1, 1, 1, 1, 1,
-1.425092, 0.4709296, -1.432857, 1, 1, 1, 1, 1,
-1.414971, 0.5777897, -1.504924, 1, 1, 1, 1, 1,
-1.409526, -0.3320408, -1.541497, 1, 1, 1, 1, 1,
-1.404297, -0.2111359, -2.167663, 1, 1, 1, 1, 1,
-1.402448, 1.690804, -0.6344932, 1, 1, 1, 1, 1,
-1.396388, 1.887596, -1.806199, 1, 1, 1, 1, 1,
-1.385989, -0.0169778, -2.119854, 1, 1, 1, 1, 1,
-1.385159, -1.966135, -1.489386, 1, 1, 1, 1, 1,
-1.384395, 0.3434245, -2.339386, 1, 1, 1, 1, 1,
-1.381654, 1.302879, -1.717022, 1, 1, 1, 1, 1,
-1.378754, 1.400946, -2.035926, 0, 0, 1, 1, 1,
-1.340965, 0.6138873, 1.429732, 1, 0, 0, 1, 1,
-1.339869, 0.1409962, -1.571361, 1, 0, 0, 1, 1,
-1.335762, -0.05334659, -0.3181818, 1, 0, 0, 1, 1,
-1.335296, -1.461406, -2.730707, 1, 0, 0, 1, 1,
-1.33352, -0.08739211, -1.758302, 1, 0, 0, 1, 1,
-1.329925, 0.5715152, -3.304236, 0, 0, 0, 1, 1,
-1.324312, -1.290971, -3.274567, 0, 0, 0, 1, 1,
-1.323994, 0.8538551, -0.6292852, 0, 0, 0, 1, 1,
-1.323963, 1.615054, -0.5490147, 0, 0, 0, 1, 1,
-1.311393, 0.1849714, -2.573938, 0, 0, 0, 1, 1,
-1.308127, -0.4818349, -2.441796, 0, 0, 0, 1, 1,
-1.307585, -0.04028919, -2.193805, 0, 0, 0, 1, 1,
-1.294304, 0.3235543, -2.146092, 1, 1, 1, 1, 1,
-1.29289, -1.976251, -0.8315233, 1, 1, 1, 1, 1,
-1.291527, 0.6350517, -0.8437795, 1, 1, 1, 1, 1,
-1.286851, 0.7316289, -1.872447, 1, 1, 1, 1, 1,
-1.285858, -0.5604323, -2.544411, 1, 1, 1, 1, 1,
-1.274883, 0.2872431, -1.587871, 1, 1, 1, 1, 1,
-1.273358, 0.5571494, -0.3225179, 1, 1, 1, 1, 1,
-1.270142, -0.5074267, -3.72928, 1, 1, 1, 1, 1,
-1.268239, -2.549365, -3.009241, 1, 1, 1, 1, 1,
-1.267642, 1.22732, -0.788873, 1, 1, 1, 1, 1,
-1.265327, 0.32168, -1.288152, 1, 1, 1, 1, 1,
-1.262254, -0.8273409, -2.201243, 1, 1, 1, 1, 1,
-1.250962, -0.417549, -1.576106, 1, 1, 1, 1, 1,
-1.250109, -0.9555346, -2.460099, 1, 1, 1, 1, 1,
-1.250098, 1.088667, -1.009558, 1, 1, 1, 1, 1,
-1.246061, -0.4230661, -0.2259511, 0, 0, 1, 1, 1,
-1.245143, -1.763435, -3.700761, 1, 0, 0, 1, 1,
-1.244487, -0.4790702, -2.715691, 1, 0, 0, 1, 1,
-1.241189, 1.281992, -1.184355, 1, 0, 0, 1, 1,
-1.240681, 1.300103, 0.2474796, 1, 0, 0, 1, 1,
-1.240198, 0.2839914, -0.9263774, 1, 0, 0, 1, 1,
-1.238307, -0.5664141, -3.123331, 0, 0, 0, 1, 1,
-1.238036, -0.1386294, -2.544283, 0, 0, 0, 1, 1,
-1.231144, -0.1312089, -1.414635, 0, 0, 0, 1, 1,
-1.22631, -0.04831091, -3.549324, 0, 0, 0, 1, 1,
-1.223142, -1.827921, -3.26072, 0, 0, 0, 1, 1,
-1.222517, 1.224797, -1.305982, 0, 0, 0, 1, 1,
-1.211213, 1.054013, 0.5989231, 0, 0, 0, 1, 1,
-1.191085, 0.308144, -2.620544, 1, 1, 1, 1, 1,
-1.190579, 1.011485, -2.007127, 1, 1, 1, 1, 1,
-1.177103, 2.015655, -1.800991, 1, 1, 1, 1, 1,
-1.173215, -1.481983, -2.379328, 1, 1, 1, 1, 1,
-1.158912, -0.7487458, -2.34666, 1, 1, 1, 1, 1,
-1.157722, 1.288368, 0.7645749, 1, 1, 1, 1, 1,
-1.150971, -0.8275719, -2.166766, 1, 1, 1, 1, 1,
-1.141677, -0.8545511, -3.282781, 1, 1, 1, 1, 1,
-1.129877, 0.3958967, -2.832526, 1, 1, 1, 1, 1,
-1.124995, -0.7797123, -1.414135, 1, 1, 1, 1, 1,
-1.115915, -0.7805092, -2.551249, 1, 1, 1, 1, 1,
-1.115285, 0.1286077, -0.7309076, 1, 1, 1, 1, 1,
-1.110708, -0.4215597, -2.452028, 1, 1, 1, 1, 1,
-1.110327, 1.379725, -1.666728, 1, 1, 1, 1, 1,
-1.107812, 0.8300797, -1.743255, 1, 1, 1, 1, 1,
-1.10741, 0.6802634, 0.06461366, 0, 0, 1, 1, 1,
-1.103261, 0.2504628, -2.595806, 1, 0, 0, 1, 1,
-1.102279, 1.759933, -1.723336, 1, 0, 0, 1, 1,
-1.100251, 0.2037413, -0.2963635, 1, 0, 0, 1, 1,
-1.097474, 2.427907, -0.8201529, 1, 0, 0, 1, 1,
-1.093711, -0.4555869, -2.891252, 1, 0, 0, 1, 1,
-1.091918, -0.6055428, -0.2189282, 0, 0, 0, 1, 1,
-1.087927, -0.2762063, -1.267503, 0, 0, 0, 1, 1,
-1.087897, -1.351536, -1.620781, 0, 0, 0, 1, 1,
-1.080014, 0.1002995, -1.883955, 0, 0, 0, 1, 1,
-1.077656, -0.07779533, -2.778295, 0, 0, 0, 1, 1,
-1.072741, 2.216798, -0.6841362, 0, 0, 0, 1, 1,
-1.06305, -0.400472, -0.1390708, 0, 0, 0, 1, 1,
-1.062942, 0.5317429, -0.5679863, 1, 1, 1, 1, 1,
-1.05667, -0.1372982, -1.521312, 1, 1, 1, 1, 1,
-1.054491, 0.4854701, -0.4588046, 1, 1, 1, 1, 1,
-1.046313, -1.213824, -3.228331, 1, 1, 1, 1, 1,
-1.046106, -1.070968, -4.883805, 1, 1, 1, 1, 1,
-1.045388, -0.02802933, -2.208083, 1, 1, 1, 1, 1,
-1.027133, -1.213589, -1.592772, 1, 1, 1, 1, 1,
-1.021435, 0.7238163, -0.8438063, 1, 1, 1, 1, 1,
-1.020183, 1.890988, -0.3416835, 1, 1, 1, 1, 1,
-1.010669, -0.9783, -4.969274, 1, 1, 1, 1, 1,
-0.9919773, 0.764183, -2.559074, 1, 1, 1, 1, 1,
-0.9823508, -1.30673, -1.84363, 1, 1, 1, 1, 1,
-0.9750177, -0.6242267, -2.111264, 1, 1, 1, 1, 1,
-0.9725847, 2.368993, -1.873332, 1, 1, 1, 1, 1,
-0.9702773, -1.334417, -3.604858, 1, 1, 1, 1, 1,
-0.9693176, 1.419231, 0.1059247, 0, 0, 1, 1, 1,
-0.968621, 0.1086046, -1.878311, 1, 0, 0, 1, 1,
-0.9673668, -0.6497853, -4.065826, 1, 0, 0, 1, 1,
-0.9632091, -0.5846692, -1.24675, 1, 0, 0, 1, 1,
-0.9609125, 0.5391864, -0.8449776, 1, 0, 0, 1, 1,
-0.9556252, 0.2444886, 1.0987, 1, 0, 0, 1, 1,
-0.9540521, -0.10424, -1.558254, 0, 0, 0, 1, 1,
-0.9519494, -1.15284, -2.075828, 0, 0, 0, 1, 1,
-0.9513642, 0.3139401, -0.1995712, 0, 0, 0, 1, 1,
-0.9419774, 1.073851, -0.02477209, 0, 0, 0, 1, 1,
-0.9381353, -0.6291233, -1.139695, 0, 0, 0, 1, 1,
-0.9345042, -1.437988, -3.047923, 0, 0, 0, 1, 1,
-0.9303413, -0.274152, -3.637706, 0, 0, 0, 1, 1,
-0.9280796, 0.009928752, -1.944191, 1, 1, 1, 1, 1,
-0.926531, -1.455954, -2.312519, 1, 1, 1, 1, 1,
-0.9173142, 2.076642, 0.09444394, 1, 1, 1, 1, 1,
-0.9151658, 3.340039, -0.7798641, 1, 1, 1, 1, 1,
-0.9135619, -1.479527, -2.435374, 1, 1, 1, 1, 1,
-0.908869, -0.527639, -0.7060012, 1, 1, 1, 1, 1,
-0.9076108, -0.102172, -1.641613, 1, 1, 1, 1, 1,
-0.9073478, 0.1713569, -1.434731, 1, 1, 1, 1, 1,
-0.9026039, -0.4223053, -2.414006, 1, 1, 1, 1, 1,
-0.9002549, -0.7103056, -2.737472, 1, 1, 1, 1, 1,
-0.8967044, -0.495108, -2.68769, 1, 1, 1, 1, 1,
-0.8963317, -1.567926, -3.633066, 1, 1, 1, 1, 1,
-0.8941946, -0.09595868, -2.051757, 1, 1, 1, 1, 1,
-0.8935173, -0.06513358, -2.16579, 1, 1, 1, 1, 1,
-0.890467, 1.639097, -1.24652, 1, 1, 1, 1, 1,
-0.8874814, 0.360188, -2.007126, 0, 0, 1, 1, 1,
-0.8767403, 0.1884288, -0.5712055, 1, 0, 0, 1, 1,
-0.8728843, 0.7593783, -1.145398, 1, 0, 0, 1, 1,
-0.8671707, 1.708582, -1.194158, 1, 0, 0, 1, 1,
-0.8615977, 2.203352, 0.3790972, 1, 0, 0, 1, 1,
-0.8563509, 1.183212, 2.239541, 1, 0, 0, 1, 1,
-0.8562254, 0.2024277, 0.09983337, 0, 0, 0, 1, 1,
-0.8527415, 0.9647671, -0.3573771, 0, 0, 0, 1, 1,
-0.8521125, 0.9024525, -0.2597942, 0, 0, 0, 1, 1,
-0.8408905, 0.3313454, 0.971557, 0, 0, 0, 1, 1,
-0.8382497, 0.8244981, -2.005185, 0, 0, 0, 1, 1,
-0.8370645, 0.02665002, -1.98955, 0, 0, 0, 1, 1,
-0.8268667, -0.7230374, -2.376802, 0, 0, 0, 1, 1,
-0.8206761, 0.5640808, -0.7087451, 1, 1, 1, 1, 1,
-0.8196441, 0.3408064, -1.422992, 1, 1, 1, 1, 1,
-0.8152983, -0.4512895, -1.405908, 1, 1, 1, 1, 1,
-0.8079108, 0.09846892, -3.204726, 1, 1, 1, 1, 1,
-0.8016929, -0.2388029, -0.5346258, 1, 1, 1, 1, 1,
-0.7986932, -0.09670511, -2.319127, 1, 1, 1, 1, 1,
-0.796585, 0.1159444, -1.11805, 1, 1, 1, 1, 1,
-0.7951275, 0.3512074, -1.756679, 1, 1, 1, 1, 1,
-0.7878289, 1.759526, -0.5125256, 1, 1, 1, 1, 1,
-0.7730044, -0.1100875, -1.484835, 1, 1, 1, 1, 1,
-0.7718865, 1.00452, -1.211395, 1, 1, 1, 1, 1,
-0.7696308, 2.19153, -1.835312, 1, 1, 1, 1, 1,
-0.7653444, -0.7354038, -3.104436, 1, 1, 1, 1, 1,
-0.7642972, -1.178375, -2.032853, 1, 1, 1, 1, 1,
-0.760097, 0.7697296, -1.698308, 1, 1, 1, 1, 1,
-0.7588994, -0.2229338, -1.100941, 0, 0, 1, 1, 1,
-0.7576118, -0.3951434, -1.317169, 1, 0, 0, 1, 1,
-0.7509395, -0.7015897, -1.505997, 1, 0, 0, 1, 1,
-0.7482414, -0.09342106, -1.390415, 1, 0, 0, 1, 1,
-0.7409999, -0.2004452, -1.684656, 1, 0, 0, 1, 1,
-0.7402508, 0.104504, -0.02552988, 1, 0, 0, 1, 1,
-0.7387787, 0.1896344, -1.408357, 0, 0, 0, 1, 1,
-0.7347688, 1.691515, -0.9403968, 0, 0, 0, 1, 1,
-0.7336198, -0.4431058, -2.224397, 0, 0, 0, 1, 1,
-0.7313486, -1.73736, -2.716789, 0, 0, 0, 1, 1,
-0.7219471, 0.7835808, 0.2951972, 0, 0, 0, 1, 1,
-0.719198, 2.357658, -0.6729165, 0, 0, 0, 1, 1,
-0.7165703, 1.149711, -0.863297, 0, 0, 0, 1, 1,
-0.7155448, -0.7214289, -2.364293, 1, 1, 1, 1, 1,
-0.7078271, -0.285198, -3.19559, 1, 1, 1, 1, 1,
-0.7074564, 0.4497366, -1.634976, 1, 1, 1, 1, 1,
-0.7036266, -0.2943098, -2.707493, 1, 1, 1, 1, 1,
-0.7022928, 0.1610655, -1.69961, 1, 1, 1, 1, 1,
-0.7018359, 1.031366, 0.9477134, 1, 1, 1, 1, 1,
-0.7013621, -0.8115299, -2.244878, 1, 1, 1, 1, 1,
-0.6982076, -0.02352636, -1.107652, 1, 1, 1, 1, 1,
-0.6981002, -0.1987687, -0.9604176, 1, 1, 1, 1, 1,
-0.6969751, 1.170853, 0.1795198, 1, 1, 1, 1, 1,
-0.6954405, 0.09936393, -0.8334058, 1, 1, 1, 1, 1,
-0.6948686, 0.695769, -0.1312407, 1, 1, 1, 1, 1,
-0.6942949, 0.6903465, -0.6852089, 1, 1, 1, 1, 1,
-0.6832115, -0.3718513, -3.659836, 1, 1, 1, 1, 1,
-0.6657536, -0.8635715, -3.226784, 1, 1, 1, 1, 1,
-0.6602666, 0.3583246, -1.485225, 0, 0, 1, 1, 1,
-0.6549805, -0.7304751, -2.164638, 1, 0, 0, 1, 1,
-0.6540458, 0.138463, 0.1025947, 1, 0, 0, 1, 1,
-0.6512878, 0.1116079, -2.805795, 1, 0, 0, 1, 1,
-0.6420715, 0.3807646, -0.5414979, 1, 0, 0, 1, 1,
-0.6413667, 0.02102163, -1.373608, 1, 0, 0, 1, 1,
-0.6404118, -0.1305185, -1.238584, 0, 0, 0, 1, 1,
-0.6402437, 0.1456784, -0.9251476, 0, 0, 0, 1, 1,
-0.6367058, 0.1250022, -1.221259, 0, 0, 0, 1, 1,
-0.6355625, -0.3531217, -3.384859, 0, 0, 0, 1, 1,
-0.6311097, 1.289506, -0.7208639, 0, 0, 0, 1, 1,
-0.6288539, -0.07604396, -1.109532, 0, 0, 0, 1, 1,
-0.6224068, -0.3279241, -1.537048, 0, 0, 0, 1, 1,
-0.6205616, -0.1673496, -1.484914, 1, 1, 1, 1, 1,
-0.6196813, -0.3632993, -2.243554, 1, 1, 1, 1, 1,
-0.6175649, 1.40997, -2.107739, 1, 1, 1, 1, 1,
-0.6162265, -1.438046, -1.828625, 1, 1, 1, 1, 1,
-0.6094148, 0.001942941, -1.31776, 1, 1, 1, 1, 1,
-0.6062917, -0.8561983, -3.288397, 1, 1, 1, 1, 1,
-0.6061508, 0.4245678, -0.3534411, 1, 1, 1, 1, 1,
-0.601815, -0.6912351, -2.549864, 1, 1, 1, 1, 1,
-0.6017434, 1.689542, 2.532605, 1, 1, 1, 1, 1,
-0.6004721, 1.162385, -0.5634129, 1, 1, 1, 1, 1,
-0.5981576, 0.5190992, -0.9316009, 1, 1, 1, 1, 1,
-0.5978539, 0.5266907, 0.8806235, 1, 1, 1, 1, 1,
-0.5961762, -1.021371, -1.431506, 1, 1, 1, 1, 1,
-0.5955816, 0.2769149, -0.2887641, 1, 1, 1, 1, 1,
-0.5944763, -2.089876, -3.390731, 1, 1, 1, 1, 1,
-0.5905627, 0.2782308, -0.9871758, 0, 0, 1, 1, 1,
-0.5900477, 1.009425, -1.732147, 1, 0, 0, 1, 1,
-0.5880524, 0.4585046, -1.88273, 1, 0, 0, 1, 1,
-0.5847579, -1.680706, -2.470829, 1, 0, 0, 1, 1,
-0.5844033, 0.1134186, -0.8556271, 1, 0, 0, 1, 1,
-0.5805778, 0.4570167, -0.5628407, 1, 0, 0, 1, 1,
-0.5777695, 0.3670813, -1.400315, 0, 0, 0, 1, 1,
-0.573572, 0.6462601, -0.3356743, 0, 0, 0, 1, 1,
-0.5719715, 0.4640681, -0.5679478, 0, 0, 0, 1, 1,
-0.5649375, -1.361625, -3.668932, 0, 0, 0, 1, 1,
-0.561907, -0.01313876, -0.2220287, 0, 0, 0, 1, 1,
-0.5618556, 0.08682461, -2.691476, 0, 0, 0, 1, 1,
-0.5614662, 0.0494819, -2.659426, 0, 0, 0, 1, 1,
-0.5571535, 0.6064618, -0.9690914, 1, 1, 1, 1, 1,
-0.5410118, 0.766952, 0.2997082, 1, 1, 1, 1, 1,
-0.5393953, 1.113407, -1.840403, 1, 1, 1, 1, 1,
-0.5367858, 0.4516108, -0.1215837, 1, 1, 1, 1, 1,
-0.5337014, -1.395289, -1.719903, 1, 1, 1, 1, 1,
-0.5317551, 0.7727389, -0.4196933, 1, 1, 1, 1, 1,
-0.5302289, -0.989342, -1.103892, 1, 1, 1, 1, 1,
-0.5251503, -0.7791222, -1.026503, 1, 1, 1, 1, 1,
-0.5230116, -0.1503438, -0.8556159, 1, 1, 1, 1, 1,
-0.5189658, -1.603643, -2.815725, 1, 1, 1, 1, 1,
-0.5141944, 1.934358, -1.329486, 1, 1, 1, 1, 1,
-0.5104146, -0.239672, -3.132895, 1, 1, 1, 1, 1,
-0.5054019, -1.373084, -2.668426, 1, 1, 1, 1, 1,
-0.5020769, 0.5596493, -1.174438, 1, 1, 1, 1, 1,
-0.5016372, -1.079373, -1.878034, 1, 1, 1, 1, 1,
-0.4954196, 0.6579962, -1.468587, 0, 0, 1, 1, 1,
-0.4936857, 1.227776, 0.5187087, 1, 0, 0, 1, 1,
-0.4928148, 0.001804545, -2.008286, 1, 0, 0, 1, 1,
-0.4904862, 0.4625894, -2.161421, 1, 0, 0, 1, 1,
-0.489114, 0.1976081, -0.3596781, 1, 0, 0, 1, 1,
-0.4808454, -0.01949614, -1.700131, 1, 0, 0, 1, 1,
-0.4734859, -0.1621889, -2.915371, 0, 0, 0, 1, 1,
-0.4715184, 1.576053, 0.09311976, 0, 0, 0, 1, 1,
-0.4712613, 1.51671, -0.184791, 0, 0, 0, 1, 1,
-0.4706048, -1.26054, -2.676943, 0, 0, 0, 1, 1,
-0.4674211, -0.3049539, -1.76886, 0, 0, 0, 1, 1,
-0.466747, 0.08782266, -2.103516, 0, 0, 0, 1, 1,
-0.4659439, 0.0009827529, -0.8069998, 0, 0, 0, 1, 1,
-0.4655462, -2.218768, -1.892074, 1, 1, 1, 1, 1,
-0.4620207, -0.1048437, -1.601348, 1, 1, 1, 1, 1,
-0.4599161, 0.5201133, -1.214829, 1, 1, 1, 1, 1,
-0.4544457, 1.65212, -1.038363, 1, 1, 1, 1, 1,
-0.4503545, 0.561999, -2.474175, 1, 1, 1, 1, 1,
-0.4497772, -1.18617, -2.061287, 1, 1, 1, 1, 1,
-0.4440043, 1.202947, 0.08129648, 1, 1, 1, 1, 1,
-0.4437645, 0.3654856, -0.8314844, 1, 1, 1, 1, 1,
-0.4356237, 1.974025, -0.1521343, 1, 1, 1, 1, 1,
-0.4344456, 1.210693, -0.4193968, 1, 1, 1, 1, 1,
-0.4322084, -0.1836174, 0.1447566, 1, 1, 1, 1, 1,
-0.428946, -0.6566382, -1.792773, 1, 1, 1, 1, 1,
-0.4252571, -1.506744, -2.367599, 1, 1, 1, 1, 1,
-0.4149794, 1.413273, -1.455309, 1, 1, 1, 1, 1,
-0.4138159, 1.323246, -0.9896154, 1, 1, 1, 1, 1,
-0.406584, -0.8093507, -1.891213, 0, 0, 1, 1, 1,
-0.4055403, -1.314551, -3.084823, 1, 0, 0, 1, 1,
-0.4052014, 0.03790924, -2.007761, 1, 0, 0, 1, 1,
-0.4033999, -0.9214463, -1.908597, 1, 0, 0, 1, 1,
-0.4032116, -0.2528331, -2.484451, 1, 0, 0, 1, 1,
-0.4011548, 1.333884, 0.8968093, 1, 0, 0, 1, 1,
-0.3990571, -0.1414887, -1.278076, 0, 0, 0, 1, 1,
-0.3983785, 0.9178165, -0.1873802, 0, 0, 0, 1, 1,
-0.3963711, -0.5567621, -2.181567, 0, 0, 0, 1, 1,
-0.3952986, -0.01618688, -1.021898, 0, 0, 0, 1, 1,
-0.3920068, -0.4679729, -2.021274, 0, 0, 0, 1, 1,
-0.3911244, 0.5007815, 0.4108067, 0, 0, 0, 1, 1,
-0.3899828, 2.278883, -1.924108, 0, 0, 0, 1, 1,
-0.3892476, 0.3887663, -0.1900161, 1, 1, 1, 1, 1,
-0.3890345, -0.8358049, -1.927308, 1, 1, 1, 1, 1,
-0.3884785, -0.05915108, -3.413014, 1, 1, 1, 1, 1,
-0.3883901, -1.604267, -2.222828, 1, 1, 1, 1, 1,
-0.3878656, 1.783082, -0.7809154, 1, 1, 1, 1, 1,
-0.3870335, 0.8528373, -1.336289, 1, 1, 1, 1, 1,
-0.3802135, 0.1475993, 0.4047824, 1, 1, 1, 1, 1,
-0.3737291, -0.4606394, -2.970653, 1, 1, 1, 1, 1,
-0.3661426, -1.811169, -2.679923, 1, 1, 1, 1, 1,
-0.3597344, -0.21516, -3.420762, 1, 1, 1, 1, 1,
-0.3494957, -1.590378, -2.795252, 1, 1, 1, 1, 1,
-0.3489223, 0.02239266, -0.6270274, 1, 1, 1, 1, 1,
-0.3482787, -0.8700418, -2.314659, 1, 1, 1, 1, 1,
-0.3468533, 0.3405861, -2.77729, 1, 1, 1, 1, 1,
-0.3451644, 0.8783913, -1.489585, 1, 1, 1, 1, 1,
-0.344733, -0.1101945, -3.302268, 0, 0, 1, 1, 1,
-0.3437823, 0.5427327, -0.778611, 1, 0, 0, 1, 1,
-0.3406642, 0.1847631, 0.3179586, 1, 0, 0, 1, 1,
-0.3371364, -1.215237, -2.845147, 1, 0, 0, 1, 1,
-0.3328646, -0.6196077, -2.087202, 1, 0, 0, 1, 1,
-0.3313055, -0.6583992, -1.797755, 1, 0, 0, 1, 1,
-0.3306144, 1.169086, -0.2041177, 0, 0, 0, 1, 1,
-0.3301336, 0.5590174, -3.319474, 0, 0, 0, 1, 1,
-0.3300977, 0.304107, 1.291958, 0, 0, 0, 1, 1,
-0.3281178, 1.050019, -1.763054, 0, 0, 0, 1, 1,
-0.3252876, -0.556886, -1.29372, 0, 0, 0, 1, 1,
-0.3245349, -1.754215, -2.854844, 0, 0, 0, 1, 1,
-0.3200151, 1.550777, 0.789528, 0, 0, 0, 1, 1,
-0.3160174, -0.5091658, -2.334641, 1, 1, 1, 1, 1,
-0.3102759, 0.7156369, -0.664716, 1, 1, 1, 1, 1,
-0.3055231, 1.420527, -0.07198437, 1, 1, 1, 1, 1,
-0.3048216, -1.161996, -1.515029, 1, 1, 1, 1, 1,
-0.3020653, -0.29834, -4.020178, 1, 1, 1, 1, 1,
-0.3019426, 1.246266, 0.661079, 1, 1, 1, 1, 1,
-0.3014624, 0.3078201, -1.05231, 1, 1, 1, 1, 1,
-0.2969707, -0.07142881, -1.720853, 1, 1, 1, 1, 1,
-0.2951713, -1.396727, -2.153364, 1, 1, 1, 1, 1,
-0.2938991, -0.4029612, -1.288743, 1, 1, 1, 1, 1,
-0.2917308, 1.159142, -0.3424346, 1, 1, 1, 1, 1,
-0.291409, -0.02250228, -0.6992621, 1, 1, 1, 1, 1,
-0.2902037, 0.09609064, -1.292049, 1, 1, 1, 1, 1,
-0.2744997, -3.971211, -2.640091, 1, 1, 1, 1, 1,
-0.2736217, 0.2628664, -1.100979, 1, 1, 1, 1, 1,
-0.2635903, 0.8386498, -1.036439, 0, 0, 1, 1, 1,
-0.2634304, 0.8029569, -0.09477839, 1, 0, 0, 1, 1,
-0.2627862, -0.3179764, -2.123058, 1, 0, 0, 1, 1,
-0.2615651, -0.3340177, -4.160847, 1, 0, 0, 1, 1,
-0.2565466, 1.391206, 2.217399, 1, 0, 0, 1, 1,
-0.2548991, -0.281134, -3.725323, 1, 0, 0, 1, 1,
-0.2400136, -0.07352025, -2.360674, 0, 0, 0, 1, 1,
-0.2373323, -1.786315, -3.372896, 0, 0, 0, 1, 1,
-0.2351572, 1.784624, -1.464503, 0, 0, 0, 1, 1,
-0.2349661, 1.053636, 0.8075163, 0, 0, 0, 1, 1,
-0.2326837, 0.6730574, -1.276877, 0, 0, 0, 1, 1,
-0.2277926, 0.6885645, 0.03842946, 0, 0, 0, 1, 1,
-0.2200128, -0.4061654, -4.221732, 0, 0, 0, 1, 1,
-0.2188954, 0.8743895, 0.4891891, 1, 1, 1, 1, 1,
-0.2182196, -1.403275, -2.29805, 1, 1, 1, 1, 1,
-0.2140656, 0.7530074, 0.01206178, 1, 1, 1, 1, 1,
-0.2133933, -0.7376706, -0.9050274, 1, 1, 1, 1, 1,
-0.2000358, -0.3253455, -3.866267, 1, 1, 1, 1, 1,
-0.1988894, -1.477097, -2.655153, 1, 1, 1, 1, 1,
-0.1974945, 2.465834, 0.06536946, 1, 1, 1, 1, 1,
-0.1959273, -1.395825, -3.215507, 1, 1, 1, 1, 1,
-0.1950211, -1.402404, -2.112285, 1, 1, 1, 1, 1,
-0.1934074, -0.4509281, -2.391852, 1, 1, 1, 1, 1,
-0.192542, -1.633424, -3.934429, 1, 1, 1, 1, 1,
-0.1901815, 1.144045, -1.217785, 1, 1, 1, 1, 1,
-0.1845268, 0.342037, -0.7126535, 1, 1, 1, 1, 1,
-0.1779967, -0.1067824, -3.488173, 1, 1, 1, 1, 1,
-0.1774776, -1.643267, -3.051974, 1, 1, 1, 1, 1,
-0.1764192, 0.1312437, 0.0274459, 0, 0, 1, 1, 1,
-0.1730752, -0.5148091, -2.754344, 1, 0, 0, 1, 1,
-0.1725183, -0.1187623, -3.280777, 1, 0, 0, 1, 1,
-0.1722243, 0.06829822, 0.6215563, 1, 0, 0, 1, 1,
-0.1711946, 1.267505, 1.981946, 1, 0, 0, 1, 1,
-0.1681572, 1.183871, -0.8186045, 1, 0, 0, 1, 1,
-0.1664089, 0.1489417, -1.267972, 0, 0, 0, 1, 1,
-0.1654352, 0.3474365, 1.139393, 0, 0, 0, 1, 1,
-0.1612495, -1.238416, -2.223178, 0, 0, 0, 1, 1,
-0.1586369, -0.2769535, -2.19271, 0, 0, 0, 1, 1,
-0.1492829, -1.30635, -2.620154, 0, 0, 0, 1, 1,
-0.1467216, 1.823092, -0.7444918, 0, 0, 0, 1, 1,
-0.1458141, 1.409527, 1.188481, 0, 0, 0, 1, 1,
-0.1449574, -0.04547045, -1.806647, 1, 1, 1, 1, 1,
-0.1435511, 0.2074909, -1.346817, 1, 1, 1, 1, 1,
-0.1412055, 1.526964, 0.3669834, 1, 1, 1, 1, 1,
-0.1329347, -0.836026, -3.624513, 1, 1, 1, 1, 1,
-0.1320655, -0.2080053, -3.353795, 1, 1, 1, 1, 1,
-0.1303928, 0.4042794, 0.7327464, 1, 1, 1, 1, 1,
-0.1207939, -0.6641341, -1.356698, 1, 1, 1, 1, 1,
-0.1204294, -0.4380517, -3.095641, 1, 1, 1, 1, 1,
-0.1198525, -0.06018549, -3.16379, 1, 1, 1, 1, 1,
-0.1151824, 0.6187086, -0.8627616, 1, 1, 1, 1, 1,
-0.1144619, 0.9510776, 1.00989, 1, 1, 1, 1, 1,
-0.1112229, -0.8592405, -2.454177, 1, 1, 1, 1, 1,
-0.1091681, -1.135372, -3.164202, 1, 1, 1, 1, 1,
-0.08710493, 1.817937, -0.808827, 1, 1, 1, 1, 1,
-0.08453581, -0.7486715, -2.482186, 1, 1, 1, 1, 1,
-0.08231201, 0.9276329, -0.3747396, 0, 0, 1, 1, 1,
-0.07613121, 0.1611574, 0.5162969, 1, 0, 0, 1, 1,
-0.07279669, -1.130552, -3.071159, 1, 0, 0, 1, 1,
-0.06960717, 0.5526096, 1.320205, 1, 0, 0, 1, 1,
-0.05589966, 1.421962, 0.7357582, 1, 0, 0, 1, 1,
-0.05056031, -0.7609789, -2.772887, 1, 0, 0, 1, 1,
-0.04925121, -0.9735474, -3.328141, 0, 0, 0, 1, 1,
-0.04822179, 0.5731548, -1.466592, 0, 0, 0, 1, 1,
-0.04608979, 1.824742, 0.1421523, 0, 0, 0, 1, 1,
-0.04454501, -1.680065, -1.908937, 0, 0, 0, 1, 1,
-0.04410269, -0.2488647, -3.223211, 0, 0, 0, 1, 1,
-0.03804834, 0.5068207, -1.870759, 0, 0, 0, 1, 1,
-0.03537961, -0.4105044, -2.787399, 0, 0, 0, 1, 1,
-0.03137185, 0.1461602, -0.3486581, 1, 1, 1, 1, 1,
-0.03094354, 0.9503913, -0.3142714, 1, 1, 1, 1, 1,
-0.02885133, -0.5705187, -3.531383, 1, 1, 1, 1, 1,
-0.02541076, -1.537797, -3.331088, 1, 1, 1, 1, 1,
-0.02511118, 0.1872841, -1.579422, 1, 1, 1, 1, 1,
-0.01972169, 0.7102922, -1.626032, 1, 1, 1, 1, 1,
-0.01916282, 0.4349809, 1.730425, 1, 1, 1, 1, 1,
-0.01899906, 0.7269489, 0.4063168, 1, 1, 1, 1, 1,
-0.01893698, 0.9091545, -0.9359099, 1, 1, 1, 1, 1,
-0.01484927, -0.2099274, -3.246384, 1, 1, 1, 1, 1,
-0.01265066, -0.1863976, -3.083917, 1, 1, 1, 1, 1,
-0.01155251, 1.271261, 1.945424, 1, 1, 1, 1, 1,
-0.01062271, 0.8307052, -0.2512076, 1, 1, 1, 1, 1,
-0.007810974, -0.2252468, -4.000519, 1, 1, 1, 1, 1,
-0.005955165, -0.2704629, -3.218987, 1, 1, 1, 1, 1,
-0.004840596, -0.4476614, -2.157977, 0, 0, 1, 1, 1,
-0.002026739, 2.638991, -1.241999, 1, 0, 0, 1, 1,
-9.019986e-06, -0.1029683, -3.154089, 1, 0, 0, 1, 1,
0.0008179221, -1.927713, 1.598886, 1, 0, 0, 1, 1,
0.007417357, -0.06863718, 3.424293, 1, 0, 0, 1, 1,
0.009179869, -0.270398, 3.107125, 1, 0, 0, 1, 1,
0.01109334, -1.014778, 3.075073, 0, 0, 0, 1, 1,
0.01136206, -0.1172739, 1.663458, 0, 0, 0, 1, 1,
0.01272081, 1.158209, 0.3069076, 0, 0, 0, 1, 1,
0.02264179, 0.006320713, 1.710483, 0, 0, 0, 1, 1,
0.02375296, 1.818379, 0.2679127, 0, 0, 0, 1, 1,
0.02583438, -1.293994, 3.106274, 0, 0, 0, 1, 1,
0.0329901, 0.2106951, 0.4700399, 0, 0, 0, 1, 1,
0.03545593, -1.331857, 3.834626, 1, 1, 1, 1, 1,
0.03968612, 0.3920381, 0.9946163, 1, 1, 1, 1, 1,
0.04020889, 1.062208, -2.079733, 1, 1, 1, 1, 1,
0.04129526, -0.8787726, 4.889164, 1, 1, 1, 1, 1,
0.04236303, -0.2522312, 3.551306, 1, 1, 1, 1, 1,
0.04282881, 2.416428, 1.80911, 1, 1, 1, 1, 1,
0.04425964, 1.079688, 0.8250908, 1, 1, 1, 1, 1,
0.04471493, 0.8207834, -0.1281849, 1, 1, 1, 1, 1,
0.04931696, -1.234006, 2.265726, 1, 1, 1, 1, 1,
0.0556891, 0.2588049, -0.4820462, 1, 1, 1, 1, 1,
0.06165477, 0.2790499, 0.6721321, 1, 1, 1, 1, 1,
0.06207364, -0.5852274, 2.90277, 1, 1, 1, 1, 1,
0.06291509, 1.368932, 0.2373228, 1, 1, 1, 1, 1,
0.06833138, 1.441184, 1.315641, 1, 1, 1, 1, 1,
0.07019522, -1.027902, 1.94919, 1, 1, 1, 1, 1,
0.07100477, 1.625334, 0.8389621, 0, 0, 1, 1, 1,
0.07244355, -2.496529, 4.732566, 1, 0, 0, 1, 1,
0.07866813, -0.372768, 2.96323, 1, 0, 0, 1, 1,
0.07975674, -0.343829, 2.441495, 1, 0, 0, 1, 1,
0.08228975, 1.112639, 2.359711, 1, 0, 0, 1, 1,
0.08336469, 0.007314148, 0.3048813, 1, 0, 0, 1, 1,
0.08354077, 0.3296069, -0.8737665, 0, 0, 0, 1, 1,
0.0839854, 0.8112227, 0.4938024, 0, 0, 0, 1, 1,
0.08495498, -1.400104, 1.555095, 0, 0, 0, 1, 1,
0.08687472, -0.3409769, 1.503782, 0, 0, 0, 1, 1,
0.08977444, 0.5503064, 0.2292666, 0, 0, 0, 1, 1,
0.09092773, 1.931391, 0.8813142, 0, 0, 0, 1, 1,
0.09324676, -0.7378805, 4.35427, 0, 0, 0, 1, 1,
0.09381483, 2.568943, -0.01488423, 1, 1, 1, 1, 1,
0.09572183, 0.2004827, 1.459282, 1, 1, 1, 1, 1,
0.09639413, 0.151939, -2.052997, 1, 1, 1, 1, 1,
0.09970082, -0.4774102, 4.27908, 1, 1, 1, 1, 1,
0.1016885, 0.06299587, 3.17431, 1, 1, 1, 1, 1,
0.103243, -0.7434918, 3.367463, 1, 1, 1, 1, 1,
0.1044772, -1.245502, 2.918763, 1, 1, 1, 1, 1,
0.1092588, 1.778893, 0.2758512, 1, 1, 1, 1, 1,
0.1104496, -1.069473, 2.142318, 1, 1, 1, 1, 1,
0.1112264, 0.5292159, -0.925788, 1, 1, 1, 1, 1,
0.1170759, 0.3361908, -0.6060771, 1, 1, 1, 1, 1,
0.117087, -0.4694695, 3.199581, 1, 1, 1, 1, 1,
0.1198737, 0.3373938, 0.5810469, 1, 1, 1, 1, 1,
0.1214571, -3.044611, 2.445247, 1, 1, 1, 1, 1,
0.1242788, -0.7364827, 2.140069, 1, 1, 1, 1, 1,
0.130507, -1.360107, 3.491071, 0, 0, 1, 1, 1,
0.1306023, -0.5469161, 2.86377, 1, 0, 0, 1, 1,
0.134639, 0.7535906, 0.5745879, 1, 0, 0, 1, 1,
0.1385143, -0.6913664, 0.3837855, 1, 0, 0, 1, 1,
0.1438625, -1.061709, 3.127328, 1, 0, 0, 1, 1,
0.1452428, 0.8527203, -0.9345152, 1, 0, 0, 1, 1,
0.147269, -2.244421, 3.261356, 0, 0, 0, 1, 1,
0.1490441, 0.5175288, 0.4295496, 0, 0, 0, 1, 1,
0.1591577, 1.445489, 1.104145, 0, 0, 0, 1, 1,
0.1607577, -0.1950447, 3.786754, 0, 0, 0, 1, 1,
0.1611174, -2.201453, 5.464836, 0, 0, 0, 1, 1,
0.1644772, 1.026898, 0.6905363, 0, 0, 0, 1, 1,
0.1649259, 1.609953, -0.2984769, 0, 0, 0, 1, 1,
0.1717618, 0.4146234, 1.414217, 1, 1, 1, 1, 1,
0.1745853, -1.083033, 2.487598, 1, 1, 1, 1, 1,
0.1747455, 1.503554, 0.9006335, 1, 1, 1, 1, 1,
0.1798007, -1.030545, 2.33395, 1, 1, 1, 1, 1,
0.1832786, -1.708056, 3.737, 1, 1, 1, 1, 1,
0.1863362, 0.03952553, 1.273215, 1, 1, 1, 1, 1,
0.1900717, -0.3867558, 4.071449, 1, 1, 1, 1, 1,
0.1963054, 0.1498987, 0.7111313, 1, 1, 1, 1, 1,
0.1985718, -0.420741, 2.167326, 1, 1, 1, 1, 1,
0.2010176, -0.6629409, 2.143192, 1, 1, 1, 1, 1,
0.2049986, 0.944485, 0.5085639, 1, 1, 1, 1, 1,
0.2065631, 0.1922621, 1.090879, 1, 1, 1, 1, 1,
0.2074841, -0.6910539, 2.107402, 1, 1, 1, 1, 1,
0.2136513, -0.411261, 2.706744, 1, 1, 1, 1, 1,
0.2169329, -0.5146554, 2.651247, 1, 1, 1, 1, 1,
0.2205614, -1.544463, 2.619584, 0, 0, 1, 1, 1,
0.2210057, -0.4571379, 2.697472, 1, 0, 0, 1, 1,
0.2212147, 0.7583108, 0.5894831, 1, 0, 0, 1, 1,
0.2279546, -0.4290062, 3.097378, 1, 0, 0, 1, 1,
0.2286571, 0.6153268, -1.287959, 1, 0, 0, 1, 1,
0.2296962, -1.894926, 2.7343, 1, 0, 0, 1, 1,
0.231062, -0.7397615, 1.083411, 0, 0, 0, 1, 1,
0.2326427, 0.007605345, 1.54151, 0, 0, 0, 1, 1,
0.2336187, 1.044642, -0.08194312, 0, 0, 0, 1, 1,
0.2358118, 1.806209, -0.4458327, 0, 0, 0, 1, 1,
0.2443074, 0.3182937, 1.089314, 0, 0, 0, 1, 1,
0.2452841, 0.09219422, 0.1110122, 0, 0, 0, 1, 1,
0.2474875, -2.937323, 2.294842, 0, 0, 0, 1, 1,
0.2545227, -0.531311, 3.15529, 1, 1, 1, 1, 1,
0.2563879, -0.6037274, 2.788387, 1, 1, 1, 1, 1,
0.2589131, 0.4148565, -1.233102, 1, 1, 1, 1, 1,
0.2650594, 0.450311, 1.285294, 1, 1, 1, 1, 1,
0.2651981, -1.560955, 2.556512, 1, 1, 1, 1, 1,
0.2658438, -0.1917997, 2.063291, 1, 1, 1, 1, 1,
0.2667084, 0.5374161, 2.951612, 1, 1, 1, 1, 1,
0.2685073, 0.5291947, 2.311, 1, 1, 1, 1, 1,
0.273225, -0.9307495, 2.158469, 1, 1, 1, 1, 1,
0.2745109, 1.103828, 1.200689, 1, 1, 1, 1, 1,
0.274655, -0.185449, 1.463878, 1, 1, 1, 1, 1,
0.2771483, 0.7137283, 0.6106051, 1, 1, 1, 1, 1,
0.2781828, -0.6642984, 2.146102, 1, 1, 1, 1, 1,
0.2793577, 1.345865, -0.439892, 1, 1, 1, 1, 1,
0.286101, -1.012684, 3.902777, 1, 1, 1, 1, 1,
0.2916366, 0.4089928, 1.618279, 0, 0, 1, 1, 1,
0.2933791, -0.6834555, 2.925716, 1, 0, 0, 1, 1,
0.2944936, -1.119177, 3.171155, 1, 0, 0, 1, 1,
0.2976601, 0.3306593, 1.028311, 1, 0, 0, 1, 1,
0.2995218, -0.6717172, 2.916227, 1, 0, 0, 1, 1,
0.3001459, 0.6648583, 0.09223181, 1, 0, 0, 1, 1,
0.3001904, 0.7841699, 0.3163607, 0, 0, 0, 1, 1,
0.3004007, -1.46132, 2.926011, 0, 0, 0, 1, 1,
0.3122736, -0.6976941, 2.752595, 0, 0, 0, 1, 1,
0.3129821, 0.07138449, 0.9861322, 0, 0, 0, 1, 1,
0.3146148, 0.6480618, 0.8867611, 0, 0, 0, 1, 1,
0.3158509, 0.3998913, 2.291468, 0, 0, 0, 1, 1,
0.322702, -0.3560445, 3.609059, 0, 0, 0, 1, 1,
0.3247914, 1.118418, 1.818184, 1, 1, 1, 1, 1,
0.3265782, 0.09338626, 1.920572, 1, 1, 1, 1, 1,
0.330124, 0.1091188, 0.1049888, 1, 1, 1, 1, 1,
0.3372641, -0.5404137, 2.244806, 1, 1, 1, 1, 1,
0.3391838, -1.074086, 2.990979, 1, 1, 1, 1, 1,
0.3418849, -0.4205358, 2.830681, 1, 1, 1, 1, 1,
0.3436245, 0.889336, 0.9816039, 1, 1, 1, 1, 1,
0.3452013, -1.650109, 3.339496, 1, 1, 1, 1, 1,
0.3460777, -0.4253464, 0.7949022, 1, 1, 1, 1, 1,
0.3482607, -1.156365, 3.923344, 1, 1, 1, 1, 1,
0.3522936, -1.076989, 3.716023, 1, 1, 1, 1, 1,
0.3529814, 2.031344, 1.212971, 1, 1, 1, 1, 1,
0.3555007, -1.231451, 3.214192, 1, 1, 1, 1, 1,
0.3591435, 0.4894572, 0.9627539, 1, 1, 1, 1, 1,
0.3601728, -1.234961, 1.406893, 1, 1, 1, 1, 1,
0.3676911, -0.1243467, 0.1125316, 0, 0, 1, 1, 1,
0.371031, -0.029173, 1.070734, 1, 0, 0, 1, 1,
0.371717, 0.4903588, 1.11982, 1, 0, 0, 1, 1,
0.3757444, 0.3347206, -0.1973304, 1, 0, 0, 1, 1,
0.3765446, -1.49507, 4.243622, 1, 0, 0, 1, 1,
0.3802608, 1.294631, -1.608394, 1, 0, 0, 1, 1,
0.3817854, 0.642287, -0.01200095, 0, 0, 0, 1, 1,
0.3829932, -0.4623147, 3.052788, 0, 0, 0, 1, 1,
0.3831336, -1.015464, 3.843923, 0, 0, 0, 1, 1,
0.3837473, 0.2112511, 2.743097, 0, 0, 0, 1, 1,
0.3842801, -1.712354, 1.592031, 0, 0, 0, 1, 1,
0.3897451, -0.3838464, 0.3835689, 0, 0, 0, 1, 1,
0.3905241, 1.028889, 0.6458161, 0, 0, 0, 1, 1,
0.3931495, 1.337931, -0.1332867, 1, 1, 1, 1, 1,
0.3951291, 0.126761, 3.290332, 1, 1, 1, 1, 1,
0.3993063, 0.3665845, 0.8508107, 1, 1, 1, 1, 1,
0.4005573, -0.1974493, 3.477258, 1, 1, 1, 1, 1,
0.4033782, 0.02149779, 1.67003, 1, 1, 1, 1, 1,
0.4042917, -0.6291139, 3.378646, 1, 1, 1, 1, 1,
0.4047622, -0.7040997, 4.411875, 1, 1, 1, 1, 1,
0.4073738, 0.5156762, 3.03024, 1, 1, 1, 1, 1,
0.4105958, 0.1364367, 3.329412, 1, 1, 1, 1, 1,
0.4126735, 1.014576, -1.93502, 1, 1, 1, 1, 1,
0.4128701, -0.04489231, 1.983313, 1, 1, 1, 1, 1,
0.413109, -0.6016262, 3.292297, 1, 1, 1, 1, 1,
0.4149746, 1.572021, 0.7385256, 1, 1, 1, 1, 1,
0.4169243, 1.507652, 1.076345, 1, 1, 1, 1, 1,
0.4181043, -0.3856432, 0.939769, 1, 1, 1, 1, 1,
0.4206273, 0.7771307, 0.1389702, 0, 0, 1, 1, 1,
0.4216889, -0.3449541, 1.613853, 1, 0, 0, 1, 1,
0.4219298, -4.254393, 3.357095, 1, 0, 0, 1, 1,
0.4235035, -0.2652696, 2.45588, 1, 0, 0, 1, 1,
0.4236266, -0.8563024, 4.774789, 1, 0, 0, 1, 1,
0.4245898, 0.9145348, 0.7442877, 1, 0, 0, 1, 1,
0.4317105, 0.1939647, 0.8505742, 0, 0, 0, 1, 1,
0.4347743, 1.48201, 1.214972, 0, 0, 0, 1, 1,
0.4363998, 0.2446225, -0.1259901, 0, 0, 0, 1, 1,
0.4381597, 1.396408, 0.5265463, 0, 0, 0, 1, 1,
0.4392536, 0.04148262, 0.9681618, 0, 0, 0, 1, 1,
0.4404302, 0.814037, -1.392808, 0, 0, 0, 1, 1,
0.4409395, -1.395915, 5.748192, 0, 0, 0, 1, 1,
0.4600506, -0.5869877, 1.258225, 1, 1, 1, 1, 1,
0.4609079, -0.1732354, 2.580101, 1, 1, 1, 1, 1,
0.4637107, -0.02294745, 2.431606, 1, 1, 1, 1, 1,
0.4751576, 0.7702991, -0.5050182, 1, 1, 1, 1, 1,
0.4817413, -0.1139788, 1.184643, 1, 1, 1, 1, 1,
0.4861378, -0.6963854, 2.470291, 1, 1, 1, 1, 1,
0.4875973, -0.5378949, 1.780534, 1, 1, 1, 1, 1,
0.4916914, 0.6259236, -0.2963618, 1, 1, 1, 1, 1,
0.4925414, 0.5676466, 2.245562, 1, 1, 1, 1, 1,
0.494164, 0.5715445, 1.013499, 1, 1, 1, 1, 1,
0.4947004, 0.09893523, 0.7085391, 1, 1, 1, 1, 1,
0.4955461, 0.3968142, 2.663944, 1, 1, 1, 1, 1,
0.4985954, -1.712465, 3.21024, 1, 1, 1, 1, 1,
0.5133005, -0.194551, 2.8715, 1, 1, 1, 1, 1,
0.5147178, -0.4451993, 2.151586, 1, 1, 1, 1, 1,
0.5194466, 1.249378, -0.4483055, 0, 0, 1, 1, 1,
0.5197024, 1.309096, 0.590273, 1, 0, 0, 1, 1,
0.5217103, 0.1909258, 0.9264444, 1, 0, 0, 1, 1,
0.5255512, -0.006669256, 0.713506, 1, 0, 0, 1, 1,
0.5256373, -0.726026, 0.8000212, 1, 0, 0, 1, 1,
0.5272207, -0.2657927, 2.104214, 1, 0, 0, 1, 1,
0.5317009, -1.070873, 3.022275, 0, 0, 0, 1, 1,
0.5345536, 2.210818, 0.02480399, 0, 0, 0, 1, 1,
0.5362857, 1.790269, -1.113034, 0, 0, 0, 1, 1,
0.537015, -0.6984868, 1.759701, 0, 0, 0, 1, 1,
0.5384595, 0.380945, 1.656421, 0, 0, 0, 1, 1,
0.539135, -0.2073592, 0.746852, 0, 0, 0, 1, 1,
0.5465236, 0.7113506, 0.1123457, 0, 0, 0, 1, 1,
0.5493543, -0.4976979, 1.678763, 1, 1, 1, 1, 1,
0.5574099, 0.4250061, 0.9724321, 1, 1, 1, 1, 1,
0.5578055, -0.08955123, -0.2605928, 1, 1, 1, 1, 1,
0.5590701, 0.3910032, 1.803777, 1, 1, 1, 1, 1,
0.5608763, -1.090403, 2.957735, 1, 1, 1, 1, 1,
0.5635953, 1.195853, 0.7207081, 1, 1, 1, 1, 1,
0.5694976, 2.058429, -1.024274, 1, 1, 1, 1, 1,
0.5735189, -1.803382, 1.860785, 1, 1, 1, 1, 1,
0.5754646, 0.4384273, -0.9526129, 1, 1, 1, 1, 1,
0.5769991, -1.374582, 2.636291, 1, 1, 1, 1, 1,
0.5780867, -0.6763553, 3.159525, 1, 1, 1, 1, 1,
0.5833352, -0.7425243, 2.081915, 1, 1, 1, 1, 1,
0.5834234, 1.391618, 1.403481, 1, 1, 1, 1, 1,
0.5834849, 1.665249, 0.653882, 1, 1, 1, 1, 1,
0.5866675, 1.054907, -0.257241, 1, 1, 1, 1, 1,
0.5907913, 0.1934399, 2.419398, 0, 0, 1, 1, 1,
0.5985646, 1.386014, -0.6334366, 1, 0, 0, 1, 1,
0.6016686, -1.160591, 4.542369, 1, 0, 0, 1, 1,
0.6149421, -0.1067686, 3.09507, 1, 0, 0, 1, 1,
0.619863, -1.956811, 2.080838, 1, 0, 0, 1, 1,
0.6202178, 2.992574, -0.05096985, 1, 0, 0, 1, 1,
0.6205949, 0.4144543, -0.02806018, 0, 0, 0, 1, 1,
0.6209939, -0.9177032, 2.498518, 0, 0, 0, 1, 1,
0.6218306, 2.022718, -0.5427447, 0, 0, 0, 1, 1,
0.6338407, 0.1158324, 2.260067, 0, 0, 0, 1, 1,
0.6388422, -0.4065022, 2.436172, 0, 0, 0, 1, 1,
0.6609228, -1.036707, 0.4314376, 0, 0, 0, 1, 1,
0.6626441, 0.6668881, -0.593249, 0, 0, 0, 1, 1,
0.6708101, 0.6672237, 1.442155, 1, 1, 1, 1, 1,
0.6752794, 0.2283788, 0.5829875, 1, 1, 1, 1, 1,
0.6756195, 0.1745142, 1.081033, 1, 1, 1, 1, 1,
0.6763632, 0.5061885, 1.4532, 1, 1, 1, 1, 1,
0.6771359, -3.259849, 1.284451, 1, 1, 1, 1, 1,
0.6818367, -0.2289089, 2.150546, 1, 1, 1, 1, 1,
0.6862871, -0.5123624, 0.3513676, 1, 1, 1, 1, 1,
0.6908231, 0.4981098, 1.130807, 1, 1, 1, 1, 1,
0.6913635, 1.48431, -0.01527165, 1, 1, 1, 1, 1,
0.6933267, 1.88584, 1.082106, 1, 1, 1, 1, 1,
0.694353, -1.783853, 5.198557, 1, 1, 1, 1, 1,
0.6958913, -0.9483095, 2.059076, 1, 1, 1, 1, 1,
0.6973708, -0.6145816, 2.603672, 1, 1, 1, 1, 1,
0.7024103, -1.397893, 1.045518, 1, 1, 1, 1, 1,
0.7034985, 0.7303203, -0.08842805, 1, 1, 1, 1, 1,
0.7056229, -0.06776454, 2.337597, 0, 0, 1, 1, 1,
0.7107427, -0.1646704, 1.26766, 1, 0, 0, 1, 1,
0.7147831, 0.7353387, 1.095154, 1, 0, 0, 1, 1,
0.715468, -0.3323137, 2.942936, 1, 0, 0, 1, 1,
0.7204269, 1.685532, -1.032966, 1, 0, 0, 1, 1,
0.7209615, -0.7348531, 3.511963, 1, 0, 0, 1, 1,
0.7257632, 0.387775, 0.9275391, 0, 0, 0, 1, 1,
0.7268445, 0.3487549, 0.1816296, 0, 0, 0, 1, 1,
0.7270465, 2.221641, -0.5759864, 0, 0, 0, 1, 1,
0.7383156, 1.097518, -0.3422236, 0, 0, 0, 1, 1,
0.7391538, -0.2726608, 3.509082, 0, 0, 0, 1, 1,
0.7412058, -1.541833, 2.391946, 0, 0, 0, 1, 1,
0.745426, -0.4314666, 4.391271, 0, 0, 0, 1, 1,
0.747631, 0.5972516, 1.05069, 1, 1, 1, 1, 1,
0.749635, -0.08044671, 0.6239585, 1, 1, 1, 1, 1,
0.7540162, 0.06349199, 0.9485763, 1, 1, 1, 1, 1,
0.7565957, -0.156504, 3.353848, 1, 1, 1, 1, 1,
0.7586405, -0.6564275, 2.744484, 1, 1, 1, 1, 1,
0.7685214, -0.9635652, 3.922923, 1, 1, 1, 1, 1,
0.778221, 0.6515897, 3.113343, 1, 1, 1, 1, 1,
0.7799325, 0.5465009, -1.212517, 1, 1, 1, 1, 1,
0.7843711, 0.9830881, 1.622961, 1, 1, 1, 1, 1,
0.7864611, 1.551735, 1.874918, 1, 1, 1, 1, 1,
0.7865143, -0.9635736, 0.9420135, 1, 1, 1, 1, 1,
0.7866462, -0.9134479, 2.126063, 1, 1, 1, 1, 1,
0.7869226, -1.026696, 2.388137, 1, 1, 1, 1, 1,
0.7890841, 0.6737902, 2.926004, 1, 1, 1, 1, 1,
0.7904573, -0.5064148, 3.969717, 1, 1, 1, 1, 1,
0.7970464, -0.5992587, 2.5194, 0, 0, 1, 1, 1,
0.7973254, -1.405389, 2.330718, 1, 0, 0, 1, 1,
0.798445, 0.6090287, 0.4293761, 1, 0, 0, 1, 1,
0.7986578, 2.221483, 0.2467426, 1, 0, 0, 1, 1,
0.8087773, -0.9052467, 4.199294, 1, 0, 0, 1, 1,
0.8122786, 0.5573742, 1.595446, 1, 0, 0, 1, 1,
0.8125396, -0.6308048, 1.933462, 0, 0, 0, 1, 1,
0.8137205, 0.38817, 1.284003, 0, 0, 0, 1, 1,
0.814063, 0.2708519, -1.212862, 0, 0, 0, 1, 1,
0.8152124, -0.136287, 1.176645, 0, 0, 0, 1, 1,
0.8165576, -1.089507, 2.335078, 0, 0, 0, 1, 1,
0.8184918, 1.968784, -1.245641, 0, 0, 0, 1, 1,
0.8226365, 0.6135398, 1.515165, 0, 0, 0, 1, 1,
0.8290688, 0.7411675, 2.894449, 1, 1, 1, 1, 1,
0.8352289, -1.54619, 1.783199, 1, 1, 1, 1, 1,
0.8379444, -1.252285, 3.090897, 1, 1, 1, 1, 1,
0.8400462, 0.2384904, 2.38413, 1, 1, 1, 1, 1,
0.8401355, 1.203455, 0.7074488, 1, 1, 1, 1, 1,
0.8406873, -1.50524, 2.80111, 1, 1, 1, 1, 1,
0.8411478, -1.212083, 1.565722, 1, 1, 1, 1, 1,
0.8484969, -0.7542874, 2.302871, 1, 1, 1, 1, 1,
0.8496613, 0.8201886, -0.2899547, 1, 1, 1, 1, 1,
0.850009, -1.014567, 2.581089, 1, 1, 1, 1, 1,
0.8509114, -1.737737, 3.553685, 1, 1, 1, 1, 1,
0.8546426, 1.158852, 2.50865, 1, 1, 1, 1, 1,
0.8555693, -0.4382248, 2.796474, 1, 1, 1, 1, 1,
0.8597422, 0.1466473, 1.143846, 1, 1, 1, 1, 1,
0.8651402, -0.155476, 1.838074, 1, 1, 1, 1, 1,
0.8684677, 0.7455804, 0.8787352, 0, 0, 1, 1, 1,
0.8700877, 0.6416212, 1.423623, 1, 0, 0, 1, 1,
0.8722169, 0.7494983, 1.059538, 1, 0, 0, 1, 1,
0.8739352, -0.2003993, 1.991839, 1, 0, 0, 1, 1,
0.8748635, -0.00771101, 2.42714, 1, 0, 0, 1, 1,
0.8806912, 0.1337076, 1.995361, 1, 0, 0, 1, 1,
0.8829256, -0.4940127, 3.035531, 0, 0, 0, 1, 1,
0.8855985, 0.6490805, 1.525791, 0, 0, 0, 1, 1,
0.8865373, -0.1457671, 2.122556, 0, 0, 0, 1, 1,
0.8899981, 0.01699704, 1.934087, 0, 0, 0, 1, 1,
0.890179, -0.8418856, 4.076035, 0, 0, 0, 1, 1,
0.8911715, -0.04280574, 1.881453, 0, 0, 0, 1, 1,
0.8978958, 0.1901389, 1.509052, 0, 0, 0, 1, 1,
0.9003909, -0.1855507, 1.566057, 1, 1, 1, 1, 1,
0.907353, -1.924707, 2.033422, 1, 1, 1, 1, 1,
0.9083134, 0.4512123, 0.7475054, 1, 1, 1, 1, 1,
0.9091829, 2.238785, -0.09241989, 1, 1, 1, 1, 1,
0.9140225, -1.278315, 3.238775, 1, 1, 1, 1, 1,
0.9147737, -1.161866, 4.19136, 1, 1, 1, 1, 1,
0.9192494, 0.6473116, 1.820015, 1, 1, 1, 1, 1,
0.9263446, 0.8954235, 0.7875017, 1, 1, 1, 1, 1,
0.9307963, -0.3940682, 1.963809, 1, 1, 1, 1, 1,
0.930942, 0.3550953, 3.066908, 1, 1, 1, 1, 1,
0.931627, 0.99137, -1.839921, 1, 1, 1, 1, 1,
0.9316955, 0.03154097, 2.265669, 1, 1, 1, 1, 1,
0.9352009, 0.2326511, 1.434026, 1, 1, 1, 1, 1,
0.9410191, 0.001308507, 1.567069, 1, 1, 1, 1, 1,
0.9418103, 0.3066827, 2.451246, 1, 1, 1, 1, 1,
0.9421449, -1.342008, 2.135067, 0, 0, 1, 1, 1,
0.9434612, -0.3659578, 3.911887, 1, 0, 0, 1, 1,
0.9464867, 1.291484, 0.04348493, 1, 0, 0, 1, 1,
0.9483455, 0.5498855, 2.152291, 1, 0, 0, 1, 1,
0.950525, 0.02019073, 1.672415, 1, 0, 0, 1, 1,
0.9511395, 0.07866761, 0.3336743, 1, 0, 0, 1, 1,
0.9586625, -1.339246, 2.013612, 0, 0, 0, 1, 1,
0.9597563, 0.4432781, 1.016824, 0, 0, 0, 1, 1,
0.9608402, 2.412851, 0.52716, 0, 0, 0, 1, 1,
0.9626825, -0.1836593, 3.33746, 0, 0, 0, 1, 1,
0.9627259, 0.74991, 0.8555924, 0, 0, 0, 1, 1,
0.964296, -0.2429035, 1.332132, 0, 0, 0, 1, 1,
0.9650171, -0.1317481, 0.4873264, 0, 0, 0, 1, 1,
0.9676355, -1.830643, 3.028856, 1, 1, 1, 1, 1,
0.9693316, 0.1172668, 0.5521876, 1, 1, 1, 1, 1,
0.970145, -1.545518, 2.495323, 1, 1, 1, 1, 1,
0.9712656, 1.192551, 0.3575336, 1, 1, 1, 1, 1,
0.9741451, -0.6326426, 3.733292, 1, 1, 1, 1, 1,
0.9754412, -0.9685103, 0.2743688, 1, 1, 1, 1, 1,
0.9766485, 0.7572212, 0.7136407, 1, 1, 1, 1, 1,
0.9782707, 1.01392, 0.8012096, 1, 1, 1, 1, 1,
0.9808145, 0.4428583, 1.476119, 1, 1, 1, 1, 1,
0.9896042, -1.224896, 2.822655, 1, 1, 1, 1, 1,
0.9952609, 0.2057777, 1.075124, 1, 1, 1, 1, 1,
1.015826, 0.5859342, 0.791488, 1, 1, 1, 1, 1,
1.01604, 0.3395632, 2.235035, 1, 1, 1, 1, 1,
1.016961, 0.5353245, 0.1680523, 1, 1, 1, 1, 1,
1.019678, -1.743083, 2.105134, 1, 1, 1, 1, 1,
1.02, -0.4859062, 1.863894, 0, 0, 1, 1, 1,
1.025218, 0.2397301, -0.1737469, 1, 0, 0, 1, 1,
1.03081, 1.091046, 0.9579512, 1, 0, 0, 1, 1,
1.03565, -0.3500016, 2.55597, 1, 0, 0, 1, 1,
1.036559, -0.4870518, 1.879012, 1, 0, 0, 1, 1,
1.038091, 0.2148291, 0.1368034, 1, 0, 0, 1, 1,
1.044493, -0.1004118, 3.720252, 0, 0, 0, 1, 1,
1.049082, -0.9051175, 1.759208, 0, 0, 0, 1, 1,
1.055414, -0.3037936, 3.970552, 0, 0, 0, 1, 1,
1.059706, 0.3571328, 2.302264, 0, 0, 0, 1, 1,
1.062335, -1.047957, 2.8965, 0, 0, 0, 1, 1,
1.068601, -0.3687817, 0.5979347, 0, 0, 0, 1, 1,
1.070774, 0.294988, 1.069274, 0, 0, 0, 1, 1,
1.075143, 2.699915, 0.7194918, 1, 1, 1, 1, 1,
1.081033, 0.3312255, 3.458713, 1, 1, 1, 1, 1,
1.081514, 0.5271465, 0.1544763, 1, 1, 1, 1, 1,
1.082164, -0.901817, 1.359651, 1, 1, 1, 1, 1,
1.085882, -1.974132, 1.166319, 1, 1, 1, 1, 1,
1.096473, -2.434185, 3.473414, 1, 1, 1, 1, 1,
1.104473, -0.7013707, 0.5458577, 1, 1, 1, 1, 1,
1.116006, -1.066177, 1.803645, 1, 1, 1, 1, 1,
1.117627, 1.099258, 1.601342, 1, 1, 1, 1, 1,
1.121822, -0.4633228, 2.589571, 1, 1, 1, 1, 1,
1.123881, -1.330844, 0.9423466, 1, 1, 1, 1, 1,
1.132589, 1.181574, 0.6902542, 1, 1, 1, 1, 1,
1.136124, 0.680104, 1.469456, 1, 1, 1, 1, 1,
1.138408, -0.7072186, -0.2203888, 1, 1, 1, 1, 1,
1.14106, -0.6780802, 1.99778, 1, 1, 1, 1, 1,
1.142288, 0.6626163, 1.988859, 0, 0, 1, 1, 1,
1.15098, 0.3183119, 1.669156, 1, 0, 0, 1, 1,
1.159562, 0.2910958, 0.4006294, 1, 0, 0, 1, 1,
1.168743, 1.308866, 0.03726602, 1, 0, 0, 1, 1,
1.192174, 0.9278874, 1.195326, 1, 0, 0, 1, 1,
1.199337, 0.3291633, 2.43836, 1, 0, 0, 1, 1,
1.204489, -1.186791, 1.610614, 0, 0, 0, 1, 1,
1.206861, 0.5926351, 1.228024, 0, 0, 0, 1, 1,
1.217482, -0.02601159, 2.39453, 0, 0, 0, 1, 1,
1.220871, 1.393549, 0.5328856, 0, 0, 0, 1, 1,
1.258518, -0.3442087, 1.790088, 0, 0, 0, 1, 1,
1.260322, 1.587664, 1.880698, 0, 0, 0, 1, 1,
1.261457, 0.08926792, 2.337016, 0, 0, 0, 1, 1,
1.268537, -0.3695942, 3.020528, 1, 1, 1, 1, 1,
1.272519, -0.913798, 2.966344, 1, 1, 1, 1, 1,
1.274286, -0.9674129, 2.225797, 1, 1, 1, 1, 1,
1.281069, 0.1908041, -1.102715, 1, 1, 1, 1, 1,
1.28922, -1.23253, 1.888556, 1, 1, 1, 1, 1,
1.289259, -0.04445255, 2.501258, 1, 1, 1, 1, 1,
1.295135, 0.06254763, 1.77917, 1, 1, 1, 1, 1,
1.309405, -1.060986, 0.6944867, 1, 1, 1, 1, 1,
1.309577, 0.7822531, 0.5996184, 1, 1, 1, 1, 1,
1.316711, -0.594005, 1.595295, 1, 1, 1, 1, 1,
1.321719, 0.6617179, 1.593915, 1, 1, 1, 1, 1,
1.327054, 0.3292917, 1.518196, 1, 1, 1, 1, 1,
1.32741, -0.4972694, 2.216242, 1, 1, 1, 1, 1,
1.332983, 1.649403, -0.7689394, 1, 1, 1, 1, 1,
1.334822, 0.2645078, -0.215499, 1, 1, 1, 1, 1,
1.340274, -0.3034503, 0.3017356, 0, 0, 1, 1, 1,
1.345623, 0.1444075, 2.571432, 1, 0, 0, 1, 1,
1.359249, -0.3838075, 2.765821, 1, 0, 0, 1, 1,
1.361715, 0.01587224, 2.661089, 1, 0, 0, 1, 1,
1.369512, -0.5858157, 0.8061811, 1, 0, 0, 1, 1,
1.37313, -1.581288, 1.639919, 1, 0, 0, 1, 1,
1.376039, 0.6569613, 1.316996, 0, 0, 0, 1, 1,
1.377226, -1.005417, 2.531, 0, 0, 0, 1, 1,
1.380611, -1.436582, 1.373367, 0, 0, 0, 1, 1,
1.38286, 0.7954871, 0.9875178, 0, 0, 0, 1, 1,
1.38596, 1.321622, 0.5651346, 0, 0, 0, 1, 1,
1.38919, -1.91689, 3.625922, 0, 0, 0, 1, 1,
1.408694, 0.7837877, 1.868015, 0, 0, 0, 1, 1,
1.410087, 1.070588, 1.364827, 1, 1, 1, 1, 1,
1.410718, 0.7195946, 1.517044, 1, 1, 1, 1, 1,
1.413269, 0.3695459, 1.325193, 1, 1, 1, 1, 1,
1.413874, 1.919682, -2.06782, 1, 1, 1, 1, 1,
1.414475, -0.4746197, 2.006463, 1, 1, 1, 1, 1,
1.415205, 0.4983424, 0.6664073, 1, 1, 1, 1, 1,
1.41963, -0.182803, 1.845471, 1, 1, 1, 1, 1,
1.419936, -1.247217, 1.71279, 1, 1, 1, 1, 1,
1.421555, 1.452907, -0.1437961, 1, 1, 1, 1, 1,
1.426236, -0.2099829, 3.986895, 1, 1, 1, 1, 1,
1.436438, -0.882688, 1.499241, 1, 1, 1, 1, 1,
1.440511, 0.4714561, 0.8857531, 1, 1, 1, 1, 1,
1.44833, 0.6037135, 0.7486406, 1, 1, 1, 1, 1,
1.452431, 1.020649, -0.1392322, 1, 1, 1, 1, 1,
1.45887, 1.654094, 1.876438, 1, 1, 1, 1, 1,
1.466083, 0.580076, -0.3418966, 0, 0, 1, 1, 1,
1.482116, -1.339107, 3.468515, 1, 0, 0, 1, 1,
1.485411, 0.6531371, 1.502372, 1, 0, 0, 1, 1,
1.490951, 0.5064151, 3.297596, 1, 0, 0, 1, 1,
1.496982, -0.06555006, 0.160838, 1, 0, 0, 1, 1,
1.515015, 0.1047322, 0.8435727, 1, 0, 0, 1, 1,
1.522937, 0.1985566, 2.584407, 0, 0, 0, 1, 1,
1.523132, -0.08309772, 2.059955, 0, 0, 0, 1, 1,
1.526277, -1.081754, 2.068348, 0, 0, 0, 1, 1,
1.538235, 0.8323244, 0.4780333, 0, 0, 0, 1, 1,
1.543844, -0.4625143, 1.929465, 0, 0, 0, 1, 1,
1.54827, 1.066366, 2.756873, 0, 0, 0, 1, 1,
1.576479, 0.1418839, 4.425487, 0, 0, 0, 1, 1,
1.581241, -0.3446319, 0.9891016, 1, 1, 1, 1, 1,
1.587129, 0.1829271, 1.278872, 1, 1, 1, 1, 1,
1.587237, -0.9662984, 2.292419, 1, 1, 1, 1, 1,
1.587695, -2.343162, 2.464363, 1, 1, 1, 1, 1,
1.593536, -0.107466, 1.189857, 1, 1, 1, 1, 1,
1.604934, 1.067245, 2.089844, 1, 1, 1, 1, 1,
1.605856, -0.3717864, 1.74204, 1, 1, 1, 1, 1,
1.612677, 0.8285806, 2.945492, 1, 1, 1, 1, 1,
1.648541, 1.134614, -0.3731242, 1, 1, 1, 1, 1,
1.653173, 1.15901, 1.178887, 1, 1, 1, 1, 1,
1.654497, 0.5227942, -0.2921909, 1, 1, 1, 1, 1,
1.67068, -0.4496923, 0.6855071, 1, 1, 1, 1, 1,
1.678844, -1.47081, 0.9151269, 1, 1, 1, 1, 1,
1.686325, 0.5918382, 0.7064621, 1, 1, 1, 1, 1,
1.686548, -1.335572, 1.088848, 1, 1, 1, 1, 1,
1.68806, -0.4208767, 1.282873, 0, 0, 1, 1, 1,
1.712808, 1.28912, 1.120613, 1, 0, 0, 1, 1,
1.713383, -0.06159388, 0.800354, 1, 0, 0, 1, 1,
1.722084, 0.2021987, 0.9457248, 1, 0, 0, 1, 1,
1.724355, -0.668996, 3.329211, 1, 0, 0, 1, 1,
1.74189, -0.8302479, 1.790477, 1, 0, 0, 1, 1,
1.744332, 0.702867, 0.2732653, 0, 0, 0, 1, 1,
1.749735, 2.956501, 0.7901995, 0, 0, 0, 1, 1,
1.758074, -2.091482, 3.75492, 0, 0, 0, 1, 1,
1.772711, -0.8892227, 2.351109, 0, 0, 0, 1, 1,
1.809168, -0.867748, 4.268364, 0, 0, 0, 1, 1,
1.825602, -0.1370562, 2.274883, 0, 0, 0, 1, 1,
1.845713, 0.3105381, 1.398771, 0, 0, 0, 1, 1,
1.857875, -0.3458062, 2.17212, 1, 1, 1, 1, 1,
1.880334, -1.448684, 0.8560606, 1, 1, 1, 1, 1,
1.935867, -0.01611264, 2.186003, 1, 1, 1, 1, 1,
1.968731, -0.2395068, 2.235661, 1, 1, 1, 1, 1,
1.980857, -0.9210989, 2.042456, 1, 1, 1, 1, 1,
1.984186, -0.7552974, 1.625133, 1, 1, 1, 1, 1,
2.03766, 0.1672762, 1.091018, 1, 1, 1, 1, 1,
2.042311, -0.06369319, 0.569885, 1, 1, 1, 1, 1,
2.04442, 0.8013266, 0.8499542, 1, 1, 1, 1, 1,
2.052145, 0.0426956, 1.891629, 1, 1, 1, 1, 1,
2.052187, -0.2821661, 2.666987, 1, 1, 1, 1, 1,
2.116467, 0.1272379, 1.013444, 1, 1, 1, 1, 1,
2.126541, -1.838903, 1.521825, 1, 1, 1, 1, 1,
2.144752, 1.153983, 0.2746056, 1, 1, 1, 1, 1,
2.1993, 0.5046807, 3.704781, 1, 1, 1, 1, 1,
2.217995, -1.688996, 2.890431, 0, 0, 1, 1, 1,
2.249077, 0.7354381, 2.287006, 1, 0, 0, 1, 1,
2.291021, 0.6341399, 2.720613, 1, 0, 0, 1, 1,
2.311475, 0.4786012, -0.01084176, 1, 0, 0, 1, 1,
2.36651, -0.5965043, 0.9264681, 1, 0, 0, 1, 1,
2.375283, 0.1785687, 0.6782171, 1, 0, 0, 1, 1,
2.385643, -0.7864864, 1.418707, 0, 0, 0, 1, 1,
2.496086, -1.215364, 0.4733523, 0, 0, 0, 1, 1,
2.508197, 0.6905235, 0.2263121, 0, 0, 0, 1, 1,
2.586298, 0.6460438, -0.3280334, 0, 0, 0, 1, 1,
2.629384, -0.6572599, -0.6589836, 0, 0, 0, 1, 1,
2.636598, 0.2760167, 1.057188, 0, 0, 0, 1, 1,
2.690222, -0.806797, 0.9476204, 0, 0, 0, 1, 1,
2.757146, -0.2848867, 2.231097, 1, 1, 1, 1, 1,
2.918011, -1.099753, 0.8760761, 1, 1, 1, 1, 1,
2.938078, -0.6962616, 3.406174, 1, 1, 1, 1, 1,
3.042016, -0.02375949, 0.006532351, 1, 1, 1, 1, 1,
3.076359, 1.735665, 0.6629481, 1, 1, 1, 1, 1,
3.151745, 0.41279, 1.601433, 1, 1, 1, 1, 1,
3.220142, -0.444517, 1.831647, 1, 1, 1, 1, 1
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
var radius = 10.08344;
var distance = 35.41767;
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
mvMatrix.translate( 0.02981162, 0.2012722, -0.3894594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.41767);
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