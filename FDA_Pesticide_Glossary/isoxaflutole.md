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
-3.810442, -0.3427142, -0.8024214, 1, 0, 0, 1,
-3.61139, -1.042778, -3.375821, 1, 0.007843138, 0, 1,
-3.249855, 2.262918, 1.040498, 1, 0.01176471, 0, 1,
-3.14794, -0.1338578, -0.5709764, 1, 0.01960784, 0, 1,
-3.125522, -0.4905095, -2.306798, 1, 0.02352941, 0, 1,
-2.899544, 0.2638448, 0.1687057, 1, 0.03137255, 0, 1,
-2.807673, 1.481135, 0.1186299, 1, 0.03529412, 0, 1,
-2.636001, -0.9695631, -2.602124, 1, 0.04313726, 0, 1,
-2.630789, 1.096606, -1.985557, 1, 0.04705882, 0, 1,
-2.520006, 0.1064182, -0.5656231, 1, 0.05490196, 0, 1,
-2.500122, 1.318146, -1.504098, 1, 0.05882353, 0, 1,
-2.48807, 0.134164, -1.672763, 1, 0.06666667, 0, 1,
-2.468145, 0.2479087, -2.124602, 1, 0.07058824, 0, 1,
-2.395428, -0.3601317, -0.8484106, 1, 0.07843138, 0, 1,
-2.348788, 1.156025, -2.074178, 1, 0.08235294, 0, 1,
-2.212123, 0.4562786, -1.953907, 1, 0.09019608, 0, 1,
-2.089112, 0.7643476, 0.3863828, 1, 0.09411765, 0, 1,
-2.058484, 2.536531, -0.1180608, 1, 0.1019608, 0, 1,
-2.057687, 0.01399283, -2.7005, 1, 0.1098039, 0, 1,
-2.038883, 1.163695, 0.5505002, 1, 0.1137255, 0, 1,
-1.964542, 0.2288035, -1.6015, 1, 0.1215686, 0, 1,
-1.900748, -0.01554075, -3.543625, 1, 0.1254902, 0, 1,
-1.873453, 7.928326e-05, -2.170225, 1, 0.1333333, 0, 1,
-1.857527, -1.332613, -1.066596, 1, 0.1372549, 0, 1,
-1.828306, 1.542914, -0.07060163, 1, 0.145098, 0, 1,
-1.827362, 1.317805, -0.903649, 1, 0.1490196, 0, 1,
-1.816469, -1.306644, -0.8171806, 1, 0.1568628, 0, 1,
-1.809732, -0.9017903, -3.115702, 1, 0.1607843, 0, 1,
-1.803118, 0.17575, -1.273548, 1, 0.1686275, 0, 1,
-1.802217, -0.4716302, 0.1632064, 1, 0.172549, 0, 1,
-1.791641, 0.6597101, -1.812235, 1, 0.1803922, 0, 1,
-1.784486, 0.4120554, -0.595219, 1, 0.1843137, 0, 1,
-1.751586, -0.5703999, -1.390433, 1, 0.1921569, 0, 1,
-1.750877, -0.7184369, -2.022755, 1, 0.1960784, 0, 1,
-1.73281, 0.4399739, -2.436181, 1, 0.2039216, 0, 1,
-1.69464, -0.001564358, -0.9637423, 1, 0.2117647, 0, 1,
-1.688434, -0.633364, -0.9198636, 1, 0.2156863, 0, 1,
-1.671335, -0.8432763, -1.210196, 1, 0.2235294, 0, 1,
-1.658212, -0.6506064, -0.5426655, 1, 0.227451, 0, 1,
-1.647972, -0.4495827, -1.152221, 1, 0.2352941, 0, 1,
-1.614974, 0.8543213, -2.842418, 1, 0.2392157, 0, 1,
-1.607774, -0.6133986, -1.331154, 1, 0.2470588, 0, 1,
-1.591482, 1.879467, -0.1037717, 1, 0.2509804, 0, 1,
-1.577744, 0.7185304, 0.1233232, 1, 0.2588235, 0, 1,
-1.567172, 0.8243126, -1.20027, 1, 0.2627451, 0, 1,
-1.53754, -0.4063865, -0.913699, 1, 0.2705882, 0, 1,
-1.504548, -0.5465161, -2.075074, 1, 0.2745098, 0, 1,
-1.50115, -1.148087, -1.406164, 1, 0.282353, 0, 1,
-1.49633, 0.1085578, -1.51214, 1, 0.2862745, 0, 1,
-1.493362, -0.5776894, -3.607566, 1, 0.2941177, 0, 1,
-1.484032, 0.9527715, -0.7896684, 1, 0.3019608, 0, 1,
-1.480596, -1.079853, -1.154023, 1, 0.3058824, 0, 1,
-1.46913, -1.282286, -3.650913, 1, 0.3137255, 0, 1,
-1.468982, 0.1894128, -1.497688, 1, 0.3176471, 0, 1,
-1.451255, -0.1889951, -0.1161535, 1, 0.3254902, 0, 1,
-1.448508, 0.1207087, -1.707011, 1, 0.3294118, 0, 1,
-1.438493, -0.7314746, -1.609296, 1, 0.3372549, 0, 1,
-1.423449, 0.8390114, -0.204933, 1, 0.3411765, 0, 1,
-1.423374, -0.1000938, -0.9729145, 1, 0.3490196, 0, 1,
-1.418751, -0.07580619, -0.3112393, 1, 0.3529412, 0, 1,
-1.405537, -0.1322522, -2.008315, 1, 0.3607843, 0, 1,
-1.403295, -0.02783152, -2.374223, 1, 0.3647059, 0, 1,
-1.395543, -0.5066619, -1.390813, 1, 0.372549, 0, 1,
-1.393818, 0.06663252, -2.258603, 1, 0.3764706, 0, 1,
-1.387369, -0.04527303, -1.954562, 1, 0.3843137, 0, 1,
-1.362942, 0.4576456, 0.007831355, 1, 0.3882353, 0, 1,
-1.360915, -0.0898957, 0.8257454, 1, 0.3960784, 0, 1,
-1.360026, 1.607557, -1.460311, 1, 0.4039216, 0, 1,
-1.35102, 0.05302161, -0.4676147, 1, 0.4078431, 0, 1,
-1.343771, -1.156181, -2.756732, 1, 0.4156863, 0, 1,
-1.340342, -0.9290231, -2.75265, 1, 0.4196078, 0, 1,
-1.338566, -0.1507869, -2.052774, 1, 0.427451, 0, 1,
-1.325665, -0.3544975, -1.341729, 1, 0.4313726, 0, 1,
-1.324563, -0.359072, -2.425739, 1, 0.4392157, 0, 1,
-1.313549, -0.4314616, -1.905712, 1, 0.4431373, 0, 1,
-1.312718, 0.7042061, -0.387879, 1, 0.4509804, 0, 1,
-1.309527, -1.265326, -2.237293, 1, 0.454902, 0, 1,
-1.303917, -1.056255, -3.462022, 1, 0.4627451, 0, 1,
-1.300643, 0.314285, -1.698632, 1, 0.4666667, 0, 1,
-1.296344, -1.640851, -2.854627, 1, 0.4745098, 0, 1,
-1.291683, -0.3954285, -1.620726, 1, 0.4784314, 0, 1,
-1.284232, 1.863302, 0.1321068, 1, 0.4862745, 0, 1,
-1.280591, -1.323289, -1.490698, 1, 0.4901961, 0, 1,
-1.275581, 0.3199152, -0.3869895, 1, 0.4980392, 0, 1,
-1.274428, 0.4735498, -2.70732, 1, 0.5058824, 0, 1,
-1.266874, 0.7648556, -0.2195508, 1, 0.509804, 0, 1,
-1.256363, -0.1242375, -2.399993, 1, 0.5176471, 0, 1,
-1.252143, 0.6413907, -0.542787, 1, 0.5215687, 0, 1,
-1.243161, 0.5430293, 0.02835532, 1, 0.5294118, 0, 1,
-1.240131, 0.01147468, -0.9522066, 1, 0.5333334, 0, 1,
-1.230613, -0.8409312, -2.181637, 1, 0.5411765, 0, 1,
-1.21966, -0.7794681, -2.422716, 1, 0.5450981, 0, 1,
-1.216108, -1.295834, -2.935772, 1, 0.5529412, 0, 1,
-1.211078, 1.783879, 0.3900063, 1, 0.5568628, 0, 1,
-1.210816, 2.23962, -0.1663009, 1, 0.5647059, 0, 1,
-1.208945, -0.4791125, -0.5189892, 1, 0.5686275, 0, 1,
-1.206033, -1.285857, -2.914619, 1, 0.5764706, 0, 1,
-1.205692, -0.2499405, -2.978137, 1, 0.5803922, 0, 1,
-1.2024, 0.06218049, -0.9119744, 1, 0.5882353, 0, 1,
-1.196454, 0.6535932, -0.4653188, 1, 0.5921569, 0, 1,
-1.191882, -0.01410196, -2.355025, 1, 0.6, 0, 1,
-1.190942, 1.4543, -1.901065, 1, 0.6078432, 0, 1,
-1.188899, 0.8934016, -0.9569044, 1, 0.6117647, 0, 1,
-1.183908, -1.289849, -1.80121, 1, 0.6196079, 0, 1,
-1.181451, 2.278038, -2.672503, 1, 0.6235294, 0, 1,
-1.176561, -0.5583858, -2.358765, 1, 0.6313726, 0, 1,
-1.172574, 0.0546327, -0.5249441, 1, 0.6352941, 0, 1,
-1.159648, 0.7046155, -1.064358, 1, 0.6431373, 0, 1,
-1.156096, 0.6015279, 0.03801132, 1, 0.6470588, 0, 1,
-1.140482, -0.7406195, -3.781881, 1, 0.654902, 0, 1,
-1.138251, 0.9091557, -1.118842, 1, 0.6588235, 0, 1,
-1.126012, -0.9117078, -3.393796, 1, 0.6666667, 0, 1,
-1.121937, -0.620609, -2.873579, 1, 0.6705883, 0, 1,
-1.115088, 0.06893296, -2.778686, 1, 0.6784314, 0, 1,
-1.115065, 1.07179, -0.03991826, 1, 0.682353, 0, 1,
-1.111532, -0.8435413, -3.733902, 1, 0.6901961, 0, 1,
-1.101408, 0.5892711, -1.487068, 1, 0.6941177, 0, 1,
-1.101296, 1.507391, -2.216398, 1, 0.7019608, 0, 1,
-1.098239, -0.967801, -2.846853, 1, 0.7098039, 0, 1,
-1.097471, 0.4641433, -0.5878733, 1, 0.7137255, 0, 1,
-1.096197, 0.3323764, -2.661804, 1, 0.7215686, 0, 1,
-1.095642, 0.7570552, 0.4754236, 1, 0.7254902, 0, 1,
-1.088565, -0.3702546, -1.247376, 1, 0.7333333, 0, 1,
-1.074077, 0.2946379, -1.795981, 1, 0.7372549, 0, 1,
-1.073237, 0.08418458, -1.747803, 1, 0.7450981, 0, 1,
-1.069252, 0.3694838, -1.918583, 1, 0.7490196, 0, 1,
-1.067923, 0.000519748, -1.951433, 1, 0.7568628, 0, 1,
-1.062629, 0.1384644, -2.149858, 1, 0.7607843, 0, 1,
-1.055279, 0.7341906, -1.126443, 1, 0.7686275, 0, 1,
-1.053625, 1.958616, -0.2437168, 1, 0.772549, 0, 1,
-1.053414, -1.300169, -1.854448, 1, 0.7803922, 0, 1,
-1.049293, 0.1682754, -0.488045, 1, 0.7843137, 0, 1,
-1.048424, 1.197813, -2.004304, 1, 0.7921569, 0, 1,
-1.039219, 0.04019625, -0.8317702, 1, 0.7960784, 0, 1,
-1.038515, 1.720388, -0.3115164, 1, 0.8039216, 0, 1,
-1.027537, 0.9964572, -1.946682, 1, 0.8117647, 0, 1,
-1.022815, 0.2045286, -0.3549528, 1, 0.8156863, 0, 1,
-1.022784, -0.3747763, -1.00918, 1, 0.8235294, 0, 1,
-1.017273, 1.5058, -0.3240267, 1, 0.827451, 0, 1,
-1.016897, 1.959941, -0.6835127, 1, 0.8352941, 0, 1,
-1.001959, 0.5286916, -1.514438, 1, 0.8392157, 0, 1,
-1.001383, 0.5551265, 1.28668, 1, 0.8470588, 0, 1,
-1.000121, 0.4235042, -1.894225, 1, 0.8509804, 0, 1,
-0.9975382, 0.417916, -0.7382876, 1, 0.8588235, 0, 1,
-0.9951383, -0.9317912, -3.914377, 1, 0.8627451, 0, 1,
-0.9934388, 0.2467413, -2.450691, 1, 0.8705882, 0, 1,
-0.9820372, 1.508661, 1.530516, 1, 0.8745098, 0, 1,
-0.9796575, 0.01084108, -1.025557, 1, 0.8823529, 0, 1,
-0.9769834, 0.6120643, -1.660052, 1, 0.8862745, 0, 1,
-0.9750313, 0.3808111, 0.8081664, 1, 0.8941177, 0, 1,
-0.9604632, -0.196096, -0.8317218, 1, 0.8980392, 0, 1,
-0.9591467, -0.3584832, -3.676142, 1, 0.9058824, 0, 1,
-0.9571033, -0.04467795, -1.843764, 1, 0.9137255, 0, 1,
-0.9565897, -0.2390136, -1.254366, 1, 0.9176471, 0, 1,
-0.9527599, 0.7507159, -0.8202533, 1, 0.9254902, 0, 1,
-0.9353542, 0.3707189, -0.9328718, 1, 0.9294118, 0, 1,
-0.9306059, 0.8493569, -2.384976, 1, 0.9372549, 0, 1,
-0.919012, -0.9178852, -3.980429, 1, 0.9411765, 0, 1,
-0.9122756, 0.3864628, -0.4918325, 1, 0.9490196, 0, 1,
-0.9119757, 1.165952, -1.885356, 1, 0.9529412, 0, 1,
-0.9103357, 0.1213231, -1.311133, 1, 0.9607843, 0, 1,
-0.9058986, 0.2481852, -2.372923, 1, 0.9647059, 0, 1,
-0.9046396, 1.772406, -1.269912, 1, 0.972549, 0, 1,
-0.9021031, 2.008621, -0.9452499, 1, 0.9764706, 0, 1,
-0.9008756, -0.7491608, -2.212817, 1, 0.9843137, 0, 1,
-0.8872659, -0.5503651, -1.850338, 1, 0.9882353, 0, 1,
-0.8824005, 0.2037064, -2.267137, 1, 0.9960784, 0, 1,
-0.8813381, 0.2485489, -0.2438862, 0.9960784, 1, 0, 1,
-0.8708869, -1.170533, -2.300882, 0.9921569, 1, 0, 1,
-0.87001, -0.8692783, -1.130658, 0.9843137, 1, 0, 1,
-0.8675265, 0.4271903, -1.3526, 0.9803922, 1, 0, 1,
-0.8643155, 1.384633, -0.06743663, 0.972549, 1, 0, 1,
-0.8601953, -0.7580072, -1.9528, 0.9686275, 1, 0, 1,
-0.8579981, -0.7016476, -3.283752, 0.9607843, 1, 0, 1,
-0.8550249, 0.9647987, -0.01694131, 0.9568627, 1, 0, 1,
-0.848494, 0.3083399, -2.330444, 0.9490196, 1, 0, 1,
-0.8473424, -0.1763313, -2.090939, 0.945098, 1, 0, 1,
-0.8456958, -2.074225, -3.865651, 0.9372549, 1, 0, 1,
-0.8394899, -0.6208242, -1.306442, 0.9333333, 1, 0, 1,
-0.8379657, -1.129766, -2.045542, 0.9254902, 1, 0, 1,
-0.8326389, -1.469661, -0.5142549, 0.9215686, 1, 0, 1,
-0.8281687, -0.2519645, -2.382713, 0.9137255, 1, 0, 1,
-0.8258685, 0.384582, -0.3195879, 0.9098039, 1, 0, 1,
-0.8216673, -1.058728, -2.682346, 0.9019608, 1, 0, 1,
-0.8207109, 0.1432818, -0.8096942, 0.8941177, 1, 0, 1,
-0.8167908, -1.931322, -0.1830004, 0.8901961, 1, 0, 1,
-0.8165197, 0.04766765, -0.3898664, 0.8823529, 1, 0, 1,
-0.8147569, 0.7108431, -0.5803992, 0.8784314, 1, 0, 1,
-0.8141811, -0.3722276, -1.050315, 0.8705882, 1, 0, 1,
-0.8121428, -0.9445091, -2.665729, 0.8666667, 1, 0, 1,
-0.811505, -0.06049339, -2.310194, 0.8588235, 1, 0, 1,
-0.8082754, -0.7120501, -2.456573, 0.854902, 1, 0, 1,
-0.8026791, 1.515786, -1.497893, 0.8470588, 1, 0, 1,
-0.8008471, -0.1427139, -1.712249, 0.8431373, 1, 0, 1,
-0.7995566, -0.0139799, -2.000126, 0.8352941, 1, 0, 1,
-0.7984977, -1.414231, -2.542767, 0.8313726, 1, 0, 1,
-0.7982436, 0.1980533, -2.042686, 0.8235294, 1, 0, 1,
-0.7884071, 1.096825, -1.371402, 0.8196079, 1, 0, 1,
-0.7872609, 0.9232077, -1.401781, 0.8117647, 1, 0, 1,
-0.7839187, 1.133402, 0.06298115, 0.8078431, 1, 0, 1,
-0.7826172, -0.001040018, -0.6420302, 0.8, 1, 0, 1,
-0.7825565, -0.6604643, -2.303017, 0.7921569, 1, 0, 1,
-0.7823811, -0.4700106, -1.395496, 0.7882353, 1, 0, 1,
-0.7740008, -0.8173349, -1.565455, 0.7803922, 1, 0, 1,
-0.772795, -0.631223, -1.874676, 0.7764706, 1, 0, 1,
-0.7707105, 0.643787, -1.893978, 0.7686275, 1, 0, 1,
-0.7673756, -0.3316218, -2.6852, 0.7647059, 1, 0, 1,
-0.7643301, 0.9754729, -0.2852719, 0.7568628, 1, 0, 1,
-0.7638618, -0.1406122, -1.088745, 0.7529412, 1, 0, 1,
-0.7588866, -0.3490318, -1.976055, 0.7450981, 1, 0, 1,
-0.7567222, 0.9401149, -0.9055536, 0.7411765, 1, 0, 1,
-0.7558534, 0.6425051, -0.4087591, 0.7333333, 1, 0, 1,
-0.7557117, 1.073875, -0.4376003, 0.7294118, 1, 0, 1,
-0.7538809, 1.221192, -0.8179291, 0.7215686, 1, 0, 1,
-0.7537756, -0.2128267, -1.073158, 0.7176471, 1, 0, 1,
-0.7524394, -1.3836, -3.412623, 0.7098039, 1, 0, 1,
-0.7443532, 1.929929, -0.3943563, 0.7058824, 1, 0, 1,
-0.7423643, 1.638502, 1.458827, 0.6980392, 1, 0, 1,
-0.7380949, 1.434674, -1.228406, 0.6901961, 1, 0, 1,
-0.7335886, -0.5116856, -1.58443, 0.6862745, 1, 0, 1,
-0.730993, 1.032892, -2.309489, 0.6784314, 1, 0, 1,
-0.7306324, -1.347514, -5.206918, 0.6745098, 1, 0, 1,
-0.7293932, -0.4008923, 0.3420966, 0.6666667, 1, 0, 1,
-0.7275522, 0.02380133, 0.1300473, 0.6627451, 1, 0, 1,
-0.7230844, -1.179888, -3.193213, 0.654902, 1, 0, 1,
-0.7206094, -0.05300268, -4.220477, 0.6509804, 1, 0, 1,
-0.7193056, -0.8846353, -1.156974, 0.6431373, 1, 0, 1,
-0.7185535, 0.3200364, -0.3367508, 0.6392157, 1, 0, 1,
-0.7148293, -0.1497644, -1.610996, 0.6313726, 1, 0, 1,
-0.7141153, -0.2108832, -1.958187, 0.627451, 1, 0, 1,
-0.7136379, -2.219672, -1.683919, 0.6196079, 1, 0, 1,
-0.7128872, -0.09641644, -0.6231058, 0.6156863, 1, 0, 1,
-0.7110602, -0.1084383, -3.042906, 0.6078432, 1, 0, 1,
-0.7036484, -1.870254, -2.849972, 0.6039216, 1, 0, 1,
-0.6975372, 1.036946, -0.1663593, 0.5960785, 1, 0, 1,
-0.6962215, -1.017037, -2.675259, 0.5882353, 1, 0, 1,
-0.6798208, -0.3760936, -1.982546, 0.5843138, 1, 0, 1,
-0.6754357, -0.5669848, -0.2468615, 0.5764706, 1, 0, 1,
-0.6696019, -0.9794245, -1.657399, 0.572549, 1, 0, 1,
-0.6685823, -0.6757897, -0.8881623, 0.5647059, 1, 0, 1,
-0.6682028, -0.5617698, -3.249164, 0.5607843, 1, 0, 1,
-0.6647495, 0.8190587, -0.07206184, 0.5529412, 1, 0, 1,
-0.6555797, 1.041673, -0.9708794, 0.5490196, 1, 0, 1,
-0.6543018, 0.900277, 0.2813245, 0.5411765, 1, 0, 1,
-0.6537732, 0.1937208, -1.825736, 0.5372549, 1, 0, 1,
-0.6482669, 0.7912325, 0.4744722, 0.5294118, 1, 0, 1,
-0.648225, 0.4769966, -0.5155254, 0.5254902, 1, 0, 1,
-0.6424888, -1.220982, -3.120587, 0.5176471, 1, 0, 1,
-0.6406501, -0.9182798, -1.285626, 0.5137255, 1, 0, 1,
-0.6364973, -2.487897, -2.998398, 0.5058824, 1, 0, 1,
-0.6313006, -0.3952459, -1.19724, 0.5019608, 1, 0, 1,
-0.6281704, 0.2078844, -1.939083, 0.4941176, 1, 0, 1,
-0.6219131, -1.786724, -1.294083, 0.4862745, 1, 0, 1,
-0.6198574, -1.944672, -2.974261, 0.4823529, 1, 0, 1,
-0.6171625, -1.115609, -1.106209, 0.4745098, 1, 0, 1,
-0.6161455, 0.4138735, -2.854389, 0.4705882, 1, 0, 1,
-0.615506, -2.212139, -3.743573, 0.4627451, 1, 0, 1,
-0.6153672, 0.3707371, 0.3043136, 0.4588235, 1, 0, 1,
-0.6114125, -1.106697, -3.727029, 0.4509804, 1, 0, 1,
-0.6097789, 1.700371, -2.048973, 0.4470588, 1, 0, 1,
-0.6095766, -1.123404, -3.190603, 0.4392157, 1, 0, 1,
-0.6074607, 0.9353728, -0.3274479, 0.4352941, 1, 0, 1,
-0.6071425, 0.6170731, -0.1677868, 0.427451, 1, 0, 1,
-0.6008179, 1.036956, -1.140113, 0.4235294, 1, 0, 1,
-0.6004164, 0.6216475, -1.849146, 0.4156863, 1, 0, 1,
-0.6002188, -0.4366432, -0.1216293, 0.4117647, 1, 0, 1,
-0.5810465, 0.7388841, -0.1657391, 0.4039216, 1, 0, 1,
-0.5738934, 1.714661, 1.276747, 0.3960784, 1, 0, 1,
-0.5692102, -1.23441, -1.466409, 0.3921569, 1, 0, 1,
-0.5672028, 1.083653, -1.682307, 0.3843137, 1, 0, 1,
-0.5650728, 0.7708316, -0.5101382, 0.3803922, 1, 0, 1,
-0.5595875, -1.323355, -4.10919, 0.372549, 1, 0, 1,
-0.5504913, 1.115156, -0.4372486, 0.3686275, 1, 0, 1,
-0.5484574, 1.258746, -2.67357, 0.3607843, 1, 0, 1,
-0.547579, -0.1597236, -2.304819, 0.3568628, 1, 0, 1,
-0.5460518, -0.4015869, -1.970647, 0.3490196, 1, 0, 1,
-0.5452523, -0.8296576, -2.524667, 0.345098, 1, 0, 1,
-0.5448505, -0.7540414, -2.785201, 0.3372549, 1, 0, 1,
-0.5418224, -2.259379, -3.01771, 0.3333333, 1, 0, 1,
-0.5404279, 0.131798, -0.4484223, 0.3254902, 1, 0, 1,
-0.5393432, -1.861245, -1.564056, 0.3215686, 1, 0, 1,
-0.5387268, -0.0494035, -1.458848, 0.3137255, 1, 0, 1,
-0.5318313, 0.198465, 0.188382, 0.3098039, 1, 0, 1,
-0.5280365, -0.8069158, -1.673722, 0.3019608, 1, 0, 1,
-0.5271555, 2.134433, 0.1184682, 0.2941177, 1, 0, 1,
-0.5156659, -0.8289831, -4.040635, 0.2901961, 1, 0, 1,
-0.5136591, -0.219868, -2.854029, 0.282353, 1, 0, 1,
-0.5073113, 0.8609397, -0.9984637, 0.2784314, 1, 0, 1,
-0.5039666, 1.055984, -1.308197, 0.2705882, 1, 0, 1,
-0.5035282, -0.2042911, -1.400398, 0.2666667, 1, 0, 1,
-0.5011703, 1.636833, 2.51722, 0.2588235, 1, 0, 1,
-0.498538, -1.422128, -3.835668, 0.254902, 1, 0, 1,
-0.4972101, 0.5688085, -1.275348, 0.2470588, 1, 0, 1,
-0.4957544, 0.1497491, -2.59592, 0.2431373, 1, 0, 1,
-0.4956808, 0.9059489, -0.3773517, 0.2352941, 1, 0, 1,
-0.493935, 0.3672272, -0.6830255, 0.2313726, 1, 0, 1,
-0.4821468, 0.432321, -0.5786092, 0.2235294, 1, 0, 1,
-0.477609, 1.184676, 2.146088, 0.2196078, 1, 0, 1,
-0.4762033, -0.4010669, -0.6651415, 0.2117647, 1, 0, 1,
-0.4735469, -0.6199262, -2.944139, 0.2078431, 1, 0, 1,
-0.472208, 0.3224317, -1.999148, 0.2, 1, 0, 1,
-0.4688948, 0.8146739, -0.7223338, 0.1921569, 1, 0, 1,
-0.4675102, 0.4876602, -1.225865, 0.1882353, 1, 0, 1,
-0.4652681, 2.618562, 1.856056, 0.1803922, 1, 0, 1,
-0.4605934, -1.282111, -3.414952, 0.1764706, 1, 0, 1,
-0.4579473, -0.3194603, -1.190401, 0.1686275, 1, 0, 1,
-0.4478821, 0.01469972, -2.556166, 0.1647059, 1, 0, 1,
-0.4455655, -0.8586877, -3.950333, 0.1568628, 1, 0, 1,
-0.4446744, 1.305535, -2.930399, 0.1529412, 1, 0, 1,
-0.4391961, 1.318547, 0.8821613, 0.145098, 1, 0, 1,
-0.4376386, 0.5333719, 0.6144608, 0.1411765, 1, 0, 1,
-0.4309247, -0.7845916, -3.3978, 0.1333333, 1, 0, 1,
-0.4295845, -1.375045, -2.429809, 0.1294118, 1, 0, 1,
-0.4289016, 0.9010559, -0.1192705, 0.1215686, 1, 0, 1,
-0.4284346, -0.3745518, -1.656859, 0.1176471, 1, 0, 1,
-0.4280399, -0.3720101, -1.735844, 0.1098039, 1, 0, 1,
-0.4276935, 0.08685593, -3.594063, 0.1058824, 1, 0, 1,
-0.4170785, 0.9836591, -1.291917, 0.09803922, 1, 0, 1,
-0.4135678, -0.6923969, -3.624076, 0.09019608, 1, 0, 1,
-0.4094932, 1.128138, 0.3040653, 0.08627451, 1, 0, 1,
-0.4059139, 1.45449, 1.701786, 0.07843138, 1, 0, 1,
-0.4045959, 0.1161791, -2.352741, 0.07450981, 1, 0, 1,
-0.4023326, -0.9009129, -1.28505, 0.06666667, 1, 0, 1,
-0.4012933, -0.5119698, -2.957278, 0.0627451, 1, 0, 1,
-0.3999073, -0.08083817, -2.963309, 0.05490196, 1, 0, 1,
-0.398726, 0.8554276, 1.073951, 0.05098039, 1, 0, 1,
-0.3949869, 1.863824, -0.5228214, 0.04313726, 1, 0, 1,
-0.393926, -1.555598, -4.247293, 0.03921569, 1, 0, 1,
-0.3927371, -0.9505521, -2.494458, 0.03137255, 1, 0, 1,
-0.383458, -0.1071931, -0.5812042, 0.02745098, 1, 0, 1,
-0.3778068, 0.1346331, -1.156544, 0.01960784, 1, 0, 1,
-0.375132, 0.7511316, -0.3394091, 0.01568628, 1, 0, 1,
-0.374471, -0.5593901, -1.90619, 0.007843138, 1, 0, 1,
-0.3715182, -0.6808217, -2.866174, 0.003921569, 1, 0, 1,
-0.3703554, -0.1543598, -2.236542, 0, 1, 0.003921569, 1,
-0.368464, 0.9103222, 0.2307322, 0, 1, 0.01176471, 1,
-0.3652885, 1.331974, -1.742327, 0, 1, 0.01568628, 1,
-0.3642555, -0.1119959, -2.254739, 0, 1, 0.02352941, 1,
-0.3598846, -1.093361, -3.038783, 0, 1, 0.02745098, 1,
-0.3476373, -2.189227, -3.636184, 0, 1, 0.03529412, 1,
-0.3468346, -1.425328, -3.22503, 0, 1, 0.03921569, 1,
-0.3454776, 0.01754129, -1.932346, 0, 1, 0.04705882, 1,
-0.3452704, 0.6105838, -0.6465332, 0, 1, 0.05098039, 1,
-0.3403953, 0.5954366, 0.08017716, 0, 1, 0.05882353, 1,
-0.3353817, 0.688663, -0.291256, 0, 1, 0.0627451, 1,
-0.3344823, -0.288432, -3.369367, 0, 1, 0.07058824, 1,
-0.3324855, -0.01672111, -2.448186, 0, 1, 0.07450981, 1,
-0.3277106, 0.1860074, -1.874826, 0, 1, 0.08235294, 1,
-0.3273856, -0.8073817, -2.660717, 0, 1, 0.08627451, 1,
-0.3262357, -0.2970991, -4.045132, 0, 1, 0.09411765, 1,
-0.3247793, -0.3900234, 0.7525179, 0, 1, 0.1019608, 1,
-0.3239134, -1.109073, -0.6856034, 0, 1, 0.1058824, 1,
-0.321904, 1.96393, -0.3305512, 0, 1, 0.1137255, 1,
-0.3184833, -0.6455818, -2.402934, 0, 1, 0.1176471, 1,
-0.3138863, -0.4242579, -3.986145, 0, 1, 0.1254902, 1,
-0.3097146, -0.09981544, -2.732287, 0, 1, 0.1294118, 1,
-0.3070444, -1.10408, -1.472921, 0, 1, 0.1372549, 1,
-0.3055913, -0.1856912, -3.484926, 0, 1, 0.1411765, 1,
-0.3052266, 0.6014125, -1.22149, 0, 1, 0.1490196, 1,
-0.3038822, -0.8959692, -3.556374, 0, 1, 0.1529412, 1,
-0.3023799, 0.05259751, -2.336977, 0, 1, 0.1607843, 1,
-0.3023511, -1.58977, -3.271494, 0, 1, 0.1647059, 1,
-0.2922446, -0.6850501, -2.231683, 0, 1, 0.172549, 1,
-0.2843877, -0.493661, -3.954418, 0, 1, 0.1764706, 1,
-0.2811086, -0.226695, -1.747577, 0, 1, 0.1843137, 1,
-0.2781689, -1.229688, -1.565417, 0, 1, 0.1882353, 1,
-0.2780104, -0.3137527, -1.426549, 0, 1, 0.1960784, 1,
-0.2740162, -0.8537167, -3.241962, 0, 1, 0.2039216, 1,
-0.2738849, 0.5020616, -1.039352, 0, 1, 0.2078431, 1,
-0.2707951, -0.8015751, -2.561304, 0, 1, 0.2156863, 1,
-0.2680262, 0.8883064, 0.8861203, 0, 1, 0.2196078, 1,
-0.2668639, -1.231732, -4.057019, 0, 1, 0.227451, 1,
-0.2648987, -0.2320823, -2.152008, 0, 1, 0.2313726, 1,
-0.2620504, -0.3193259, -1.670479, 0, 1, 0.2392157, 1,
-0.2607475, 0.8761963, 0.6663122, 0, 1, 0.2431373, 1,
-0.2599729, 0.1793521, -2.415094, 0, 1, 0.2509804, 1,
-0.2584675, -0.662145, -3.592881, 0, 1, 0.254902, 1,
-0.2568599, 1.259822, -0.1699182, 0, 1, 0.2627451, 1,
-0.2517652, -0.5981187, -4.712277, 0, 1, 0.2666667, 1,
-0.251462, -1.465313, -2.819373, 0, 1, 0.2745098, 1,
-0.2511376, -0.04439892, -2.593825, 0, 1, 0.2784314, 1,
-0.2496334, 0.3038624, 0.1979262, 0, 1, 0.2862745, 1,
-0.2461252, -0.7325084, -2.330839, 0, 1, 0.2901961, 1,
-0.2431553, 1.181799, 0.006363808, 0, 1, 0.2980392, 1,
-0.2427178, -1.110979, -3.198895, 0, 1, 0.3058824, 1,
-0.2393251, -1.072314, -3.936808, 0, 1, 0.3098039, 1,
-0.2356622, 0.06433792, -0.9136507, 0, 1, 0.3176471, 1,
-0.2354615, -0.3828748, -2.84177, 0, 1, 0.3215686, 1,
-0.2314201, 0.09316575, -1.710158, 0, 1, 0.3294118, 1,
-0.2271935, 0.3472485, -0.4499891, 0, 1, 0.3333333, 1,
-0.2264657, 0.3057158, -1.159031, 0, 1, 0.3411765, 1,
-0.2258768, -0.8426571, -2.9935, 0, 1, 0.345098, 1,
-0.2238547, 1.33861, -0.03208497, 0, 1, 0.3529412, 1,
-0.2229782, -1.91503, -2.209929, 0, 1, 0.3568628, 1,
-0.2201188, 0.9454558, 0.3666756, 0, 1, 0.3647059, 1,
-0.2200592, -1.339541, -3.919736, 0, 1, 0.3686275, 1,
-0.2185533, -1.737633, -1.875879, 0, 1, 0.3764706, 1,
-0.2169158, 1.569798, -0.7732235, 0, 1, 0.3803922, 1,
-0.2123353, 1.118719, 0.453354, 0, 1, 0.3882353, 1,
-0.2117389, -1.742255, -3.10203, 0, 1, 0.3921569, 1,
-0.211541, -0.908429, -2.732085, 0, 1, 0.4, 1,
-0.2083294, -1.057805, -3.881099, 0, 1, 0.4078431, 1,
-0.2048373, 2.858645, -1.405141, 0, 1, 0.4117647, 1,
-0.2030365, 1.986953, 0.4892823, 0, 1, 0.4196078, 1,
-0.1972956, 0.9214032, 0.8731185, 0, 1, 0.4235294, 1,
-0.1968169, 1.972464, 1.52205, 0, 1, 0.4313726, 1,
-0.1959983, -0.5228353, -4.10532, 0, 1, 0.4352941, 1,
-0.1958928, 1.3078, 0.9616602, 0, 1, 0.4431373, 1,
-0.1896129, -0.7797382, -1.097106, 0, 1, 0.4470588, 1,
-0.1889658, 0.563562, 1.208784, 0, 1, 0.454902, 1,
-0.1878613, -1.826867, -1.781316, 0, 1, 0.4588235, 1,
-0.1845875, 0.0006438288, -2.65731, 0, 1, 0.4666667, 1,
-0.1806122, -1.252829, -2.909761, 0, 1, 0.4705882, 1,
-0.1804371, -0.7566629, -3.466544, 0, 1, 0.4784314, 1,
-0.1801762, 0.5116718, -0.6651608, 0, 1, 0.4823529, 1,
-0.1791622, -0.2251477, -1.17825, 0, 1, 0.4901961, 1,
-0.17811, 0.1310318, -1.753198, 0, 1, 0.4941176, 1,
-0.1775798, 0.4811586, 0.03258441, 0, 1, 0.5019608, 1,
-0.1765522, -0.6450698, -2.383607, 0, 1, 0.509804, 1,
-0.1722851, 0.5553749, 2.28984, 0, 1, 0.5137255, 1,
-0.1683632, -0.1055068, -2.054843, 0, 1, 0.5215687, 1,
-0.1680374, 0.5458984, -0.844337, 0, 1, 0.5254902, 1,
-0.1645768, -0.9794298, -3.740815, 0, 1, 0.5333334, 1,
-0.1590891, -0.163502, -4.310944, 0, 1, 0.5372549, 1,
-0.1590129, -0.3301399, -1.763901, 0, 1, 0.5450981, 1,
-0.1564046, 0.8748649, -0.6291283, 0, 1, 0.5490196, 1,
-0.1544496, 0.6528956, -2.570427, 0, 1, 0.5568628, 1,
-0.1532676, 0.7150553, 0.7437907, 0, 1, 0.5607843, 1,
-0.1515944, -0.448172, -0.9778953, 0, 1, 0.5686275, 1,
-0.1502948, -0.02916473, -0.3939595, 0, 1, 0.572549, 1,
-0.1492093, -0.345938, -3.153636, 0, 1, 0.5803922, 1,
-0.1398697, 1.272046, 0.482376, 0, 1, 0.5843138, 1,
-0.1382954, 0.4073822, 0.3477781, 0, 1, 0.5921569, 1,
-0.137726, -0.2655916, -2.827635, 0, 1, 0.5960785, 1,
-0.1372461, -0.1732007, -3.418871, 0, 1, 0.6039216, 1,
-0.1351727, -0.3329144, -1.726612, 0, 1, 0.6117647, 1,
-0.133948, 1.34416, -0.1711952, 0, 1, 0.6156863, 1,
-0.1328618, 0.8143374, -0.3103426, 0, 1, 0.6235294, 1,
-0.1283258, -0.7524596, -3.213789, 0, 1, 0.627451, 1,
-0.1273928, -0.7334512, -3.919634, 0, 1, 0.6352941, 1,
-0.1217896, 0.2990488, -1.644951, 0, 1, 0.6392157, 1,
-0.1214681, 0.8044835, -2.066908, 0, 1, 0.6470588, 1,
-0.1210056, 1.029882, -0.4710819, 0, 1, 0.6509804, 1,
-0.1191339, -1.462465, -4.236939, 0, 1, 0.6588235, 1,
-0.1179241, 1.035279, 0.5065419, 0, 1, 0.6627451, 1,
-0.1140053, -1.373158, -4.004516, 0, 1, 0.6705883, 1,
-0.1139892, -0.204701, -3.627245, 0, 1, 0.6745098, 1,
-0.110542, -0.3573228, -2.373418, 0, 1, 0.682353, 1,
-0.1090956, -0.4800963, -3.959114, 0, 1, 0.6862745, 1,
-0.1080848, -1.129161, -3.791848, 0, 1, 0.6941177, 1,
-0.1071644, 1.010404, -0.4651694, 0, 1, 0.7019608, 1,
-0.1021017, -1.545009, -3.597709, 0, 1, 0.7058824, 1,
-0.1002755, 1.001952, -0.6749184, 0, 1, 0.7137255, 1,
-0.1000178, -0.325827, -2.652356, 0, 1, 0.7176471, 1,
-0.09861466, 0.8215842, -0.04647387, 0, 1, 0.7254902, 1,
-0.09620938, 0.7747347, 0.6466258, 0, 1, 0.7294118, 1,
-0.08524967, 2.090237, -1.048595, 0, 1, 0.7372549, 1,
-0.08311862, -0.5005646, -3.344444, 0, 1, 0.7411765, 1,
-0.07652399, 0.4506215, -0.7547377, 0, 1, 0.7490196, 1,
-0.07461894, 0.179432, -0.3015095, 0, 1, 0.7529412, 1,
-0.07104718, -0.221501, -4.012524, 0, 1, 0.7607843, 1,
-0.07050606, 0.1605371, -1.047203, 0, 1, 0.7647059, 1,
-0.07015044, -1.635343, -4.587478, 0, 1, 0.772549, 1,
-0.06979839, 0.8283497, -0.3709854, 0, 1, 0.7764706, 1,
-0.06714983, 0.8811078, -1.095269, 0, 1, 0.7843137, 1,
-0.06358472, 0.4425762, 0.7297563, 0, 1, 0.7882353, 1,
-0.06259309, 0.2176127, 0.6773066, 0, 1, 0.7960784, 1,
-0.06123934, -0.4551789, -1.393691, 0, 1, 0.8039216, 1,
-0.0597772, -0.1380406, -0.767075, 0, 1, 0.8078431, 1,
-0.05869605, -1.629262, -2.035777, 0, 1, 0.8156863, 1,
-0.05622612, -0.1112088, -2.978678, 0, 1, 0.8196079, 1,
-0.05565468, -0.3990709, -4.789234, 0, 1, 0.827451, 1,
-0.05252981, 0.2628929, 0.7658975, 0, 1, 0.8313726, 1,
-0.05248746, -0.6427549, -2.787908, 0, 1, 0.8392157, 1,
-0.0516433, -1.052847, -3.368743, 0, 1, 0.8431373, 1,
-0.05077909, 0.9474378, 0.2552622, 0, 1, 0.8509804, 1,
-0.04844749, -0.7053173, -3.367954, 0, 1, 0.854902, 1,
-0.04794566, 1.182666, -2.262923, 0, 1, 0.8627451, 1,
-0.0397579, -0.3251384, -1.19931, 0, 1, 0.8666667, 1,
-0.03231289, -0.1753556, -3.842411, 0, 1, 0.8745098, 1,
-0.02709757, 1.187793, -0.4981277, 0, 1, 0.8784314, 1,
-0.02042804, -1.476585, -3.518535, 0, 1, 0.8862745, 1,
-0.02020674, 0.02433521, -1.265653, 0, 1, 0.8901961, 1,
-0.01796312, -0.3734637, -2.615024, 0, 1, 0.8980392, 1,
-0.01765831, -0.5428897, -1.353706, 0, 1, 0.9058824, 1,
-0.01700051, 1.019502, 0.04539615, 0, 1, 0.9098039, 1,
-0.01678453, -0.01476285, -1.589399, 0, 1, 0.9176471, 1,
-0.01505898, -0.4712492, -3.435144, 0, 1, 0.9215686, 1,
-0.01459213, 1.283343, 0.4121085, 0, 1, 0.9294118, 1,
-0.01334783, -1.081139, -4.282287, 0, 1, 0.9333333, 1,
-0.01214797, 0.449245, 1.447945, 0, 1, 0.9411765, 1,
-0.01015935, 0.3954189, -1.054807, 0, 1, 0.945098, 1,
-0.006706255, -0.2794073, -2.965979, 0, 1, 0.9529412, 1,
0.001773892, -0.3992142, 3.137565, 0, 1, 0.9568627, 1,
0.005564792, -0.2931915, 2.164191, 0, 1, 0.9647059, 1,
0.01078733, -1.531928, 3.646802, 0, 1, 0.9686275, 1,
0.01164905, -1.047768, 2.012488, 0, 1, 0.9764706, 1,
0.01168028, 0.726765, -0.5907093, 0, 1, 0.9803922, 1,
0.01828056, 0.2916228, 0.3081987, 0, 1, 0.9882353, 1,
0.01898178, -1.553776, 4.038878, 0, 1, 0.9921569, 1,
0.02027473, -0.3851811, 4.26423, 0, 1, 1, 1,
0.02215771, -0.01677044, 2.598635, 0, 0.9921569, 1, 1,
0.02414335, 0.1958342, 1.976985, 0, 0.9882353, 1, 1,
0.02415916, 0.7492654, 0.3653098, 0, 0.9803922, 1, 1,
0.02878828, -1.701875, 6.105196, 0, 0.9764706, 1, 1,
0.02973764, -0.1882725, 3.190956, 0, 0.9686275, 1, 1,
0.03115719, 1.774122, 0.0692351, 0, 0.9647059, 1, 1,
0.03236806, 0.6912863, -0.4166603, 0, 0.9568627, 1, 1,
0.03276097, 0.1468266, 1.357247, 0, 0.9529412, 1, 1,
0.03390183, 0.2282461, -0.8579234, 0, 0.945098, 1, 1,
0.03556214, -0.750124, 3.058474, 0, 0.9411765, 1, 1,
0.03782764, 0.3304765, -0.07257438, 0, 0.9333333, 1, 1,
0.0416251, 0.5056857, -1.413392, 0, 0.9294118, 1, 1,
0.04467908, -0.6515321, 3.403671, 0, 0.9215686, 1, 1,
0.04586375, -0.8967881, 4.095419, 0, 0.9176471, 1, 1,
0.04812703, -0.8947523, 4.491857, 0, 0.9098039, 1, 1,
0.04834253, -0.6279764, 1.327714, 0, 0.9058824, 1, 1,
0.04850467, -0.8721298, 1.994756, 0, 0.8980392, 1, 1,
0.05024493, 0.09462139, -1.434216, 0, 0.8901961, 1, 1,
0.05043316, -1.495717, 2.631541, 0, 0.8862745, 1, 1,
0.05079683, 0.4028584, 0.202975, 0, 0.8784314, 1, 1,
0.05120876, 0.1265636, -0.02987119, 0, 0.8745098, 1, 1,
0.05169449, 0.1739211, 0.4423541, 0, 0.8666667, 1, 1,
0.05566329, -1.039729, 3.000741, 0, 0.8627451, 1, 1,
0.05709637, -0.1707109, 3.492453, 0, 0.854902, 1, 1,
0.06664517, 1.643814, -0.3045088, 0, 0.8509804, 1, 1,
0.06938659, 0.7808901, 1.546904, 0, 0.8431373, 1, 1,
0.07093396, -2.317295, 3.649706, 0, 0.8392157, 1, 1,
0.07288433, -0.1841726, 3.23569, 0, 0.8313726, 1, 1,
0.07544824, -1.17176, 3.199314, 0, 0.827451, 1, 1,
0.07655479, -0.7203181, 0.8974223, 0, 0.8196079, 1, 1,
0.07729884, -1.674438, 1.527406, 0, 0.8156863, 1, 1,
0.07757063, 0.7629894, 2.040168, 0, 0.8078431, 1, 1,
0.07838941, -0.1366138, 3.391235, 0, 0.8039216, 1, 1,
0.08034087, 0.01600327, -1.78718, 0, 0.7960784, 1, 1,
0.08314223, -1.444251, 3.357567, 0, 0.7882353, 1, 1,
0.08378792, -2.09152, 2.684365, 0, 0.7843137, 1, 1,
0.08465413, 2.414114, -0.3759121, 0, 0.7764706, 1, 1,
0.08907509, 1.88416, -1.249843, 0, 0.772549, 1, 1,
0.09243407, -0.6241171, 2.676638, 0, 0.7647059, 1, 1,
0.1004028, -0.9639776, 3.781138, 0, 0.7607843, 1, 1,
0.1012567, -0.6745166, 1.992501, 0, 0.7529412, 1, 1,
0.1037983, 0.5005127, 1.148683, 0, 0.7490196, 1, 1,
0.1046742, 0.346713, -0.08262166, 0, 0.7411765, 1, 1,
0.1119122, 0.07658429, 1.28343, 0, 0.7372549, 1, 1,
0.1119148, 0.4787976, -0.4413731, 0, 0.7294118, 1, 1,
0.1142993, -0.09058224, 1.228051, 0, 0.7254902, 1, 1,
0.1175456, 0.7527772, -1.483043, 0, 0.7176471, 1, 1,
0.1226155, 0.8052492, -1.73783, 0, 0.7137255, 1, 1,
0.1286571, 0.5990692, 1.11508, 0, 0.7058824, 1, 1,
0.1326406, 1.440099, 0.2757126, 0, 0.6980392, 1, 1,
0.1337479, -2.326639, 2.292243, 0, 0.6941177, 1, 1,
0.1337513, 1.157936, -0.3820055, 0, 0.6862745, 1, 1,
0.138238, -1.552238, 3.615657, 0, 0.682353, 1, 1,
0.1395586, -0.7295902, 4.010204, 0, 0.6745098, 1, 1,
0.1410074, 0.6323628, 0.451255, 0, 0.6705883, 1, 1,
0.1423454, -1.82663, 3.503474, 0, 0.6627451, 1, 1,
0.1427597, -0.6451555, 2.220606, 0, 0.6588235, 1, 1,
0.1431973, -0.2669061, 4.191899, 0, 0.6509804, 1, 1,
0.148176, 0.08527328, -0.1668957, 0, 0.6470588, 1, 1,
0.1505407, -0.9023114, 3.062483, 0, 0.6392157, 1, 1,
0.1525362, -0.6468804, 2.011914, 0, 0.6352941, 1, 1,
0.154265, 0.0004875718, 2.992038, 0, 0.627451, 1, 1,
0.1546569, 0.7552853, 0.5586197, 0, 0.6235294, 1, 1,
0.1582016, 0.8309476, 1.012722, 0, 0.6156863, 1, 1,
0.1582168, -0.2342376, 3.087039, 0, 0.6117647, 1, 1,
0.1594887, -0.7464214, 3.600633, 0, 0.6039216, 1, 1,
0.1595564, -0.1651059, 3.148419, 0, 0.5960785, 1, 1,
0.1617835, 2.848016, -0.8898071, 0, 0.5921569, 1, 1,
0.1654057, -0.07400722, 2.2426, 0, 0.5843138, 1, 1,
0.1655997, -0.2460473, 2.917618, 0, 0.5803922, 1, 1,
0.171025, -0.4803589, 3.025144, 0, 0.572549, 1, 1,
0.1741391, -0.2384346, 1.009464, 0, 0.5686275, 1, 1,
0.1765156, 0.07891627, 1.158377, 0, 0.5607843, 1, 1,
0.1801432, -0.7127557, 2.918759, 0, 0.5568628, 1, 1,
0.1818907, 1.025612, -0.04604238, 0, 0.5490196, 1, 1,
0.1825769, -0.6362798, 3.790004, 0, 0.5450981, 1, 1,
0.1906544, -0.01958898, 2.311699, 0, 0.5372549, 1, 1,
0.1912239, 0.3714108, 1.370626, 0, 0.5333334, 1, 1,
0.1988129, 0.7696863, 0.8075153, 0, 0.5254902, 1, 1,
0.2011117, 0.2283178, 0.2474176, 0, 0.5215687, 1, 1,
0.2041611, -2.454238, 3.007304, 0, 0.5137255, 1, 1,
0.2059023, -0.9417964, 2.5022, 0, 0.509804, 1, 1,
0.2114142, -1.099247, 5.125193, 0, 0.5019608, 1, 1,
0.2115133, 0.8250878, 0.2564726, 0, 0.4941176, 1, 1,
0.2226719, 1.642513, 0.4724913, 0, 0.4901961, 1, 1,
0.2229396, 1.189457, 0.3794414, 0, 0.4823529, 1, 1,
0.2316263, -1.181986, 5.070682, 0, 0.4784314, 1, 1,
0.2325124, -1.350379, 2.306566, 0, 0.4705882, 1, 1,
0.2325472, -0.1354661, 2.938078, 0, 0.4666667, 1, 1,
0.2373137, -0.1410214, 0.8537913, 0, 0.4588235, 1, 1,
0.2385216, 0.3518817, 0.5882291, 0, 0.454902, 1, 1,
0.2396806, -0.5953625, 3.164269, 0, 0.4470588, 1, 1,
0.2478143, -1.784806, 3.435111, 0, 0.4431373, 1, 1,
0.2540745, 0.5647227, 0.4291589, 0, 0.4352941, 1, 1,
0.2557296, -0.0117321, 1.193732, 0, 0.4313726, 1, 1,
0.2580165, 0.9686824, 1.917328, 0, 0.4235294, 1, 1,
0.2581158, 1.630349, -0.9451848, 0, 0.4196078, 1, 1,
0.2621519, -0.8918162, 3.416376, 0, 0.4117647, 1, 1,
0.2640451, 0.4865027, 0.4640917, 0, 0.4078431, 1, 1,
0.2645548, 0.3339446, 2.108106, 0, 0.4, 1, 1,
0.2703196, -1.317037, 3.257243, 0, 0.3921569, 1, 1,
0.2714373, -0.3501642, 2.827927, 0, 0.3882353, 1, 1,
0.2718135, -0.8308322, 3.346887, 0, 0.3803922, 1, 1,
0.2724953, -1.600427, 2.8835, 0, 0.3764706, 1, 1,
0.2730671, 1.455673, 1.085859, 0, 0.3686275, 1, 1,
0.2736162, -0.6034937, 3.735859, 0, 0.3647059, 1, 1,
0.276551, 0.5840302, 0.04395886, 0, 0.3568628, 1, 1,
0.2836011, 0.3223416, 1.112628, 0, 0.3529412, 1, 1,
0.2837417, -0.4485607, 4.041462, 0, 0.345098, 1, 1,
0.2858111, 0.1634645, -1.391427, 0, 0.3411765, 1, 1,
0.2921804, 0.4798396, 1.884644, 0, 0.3333333, 1, 1,
0.2923117, -0.2153099, 1.512008, 0, 0.3294118, 1, 1,
0.2929147, -0.9187732, 1.632555, 0, 0.3215686, 1, 1,
0.2957686, 0.5807918, 0.898922, 0, 0.3176471, 1, 1,
0.29669, 0.7539452, 0.3644372, 0, 0.3098039, 1, 1,
0.3022593, -1.583068, 2.593575, 0, 0.3058824, 1, 1,
0.3023033, 0.05814225, 0.06566899, 0, 0.2980392, 1, 1,
0.3077892, -0.4552412, 2.199621, 0, 0.2901961, 1, 1,
0.3094731, -0.4663063, -0.4227278, 0, 0.2862745, 1, 1,
0.3102913, 0.8707064, 0.7700189, 0, 0.2784314, 1, 1,
0.3258833, 0.4615476, -0.6647675, 0, 0.2745098, 1, 1,
0.3287582, -0.2601092, 3.193634, 0, 0.2666667, 1, 1,
0.3296696, -1.392836, 0.3417455, 0, 0.2627451, 1, 1,
0.3324902, 0.9899191, -0.4183955, 0, 0.254902, 1, 1,
0.3369178, -1.09016, 5.441561, 0, 0.2509804, 1, 1,
0.3431532, 1.47205, 0.02618083, 0, 0.2431373, 1, 1,
0.3437721, 1.300251, -1.714705, 0, 0.2392157, 1, 1,
0.3477998, 2.407909, 0.1338371, 0, 0.2313726, 1, 1,
0.3486188, 0.7099245, -0.3599546, 0, 0.227451, 1, 1,
0.3555772, 0.4926013, -0.8550102, 0, 0.2196078, 1, 1,
0.357924, -0.8626552, 2.767792, 0, 0.2156863, 1, 1,
0.3591637, -1.742149, 2.623457, 0, 0.2078431, 1, 1,
0.3600491, 1.046167, 0.787549, 0, 0.2039216, 1, 1,
0.3625024, -0.3996884, 2.302649, 0, 0.1960784, 1, 1,
0.3659998, -0.4265463, 2.515642, 0, 0.1882353, 1, 1,
0.3716257, -1.583691, 3.141297, 0, 0.1843137, 1, 1,
0.3745674, 1.119055, 0.489095, 0, 0.1764706, 1, 1,
0.3756238, 1.490325, 0.1112169, 0, 0.172549, 1, 1,
0.3822173, 0.2052519, 0.49087, 0, 0.1647059, 1, 1,
0.3822232, -0.9054443, 1.95705, 0, 0.1607843, 1, 1,
0.3830366, -0.7545565, 1.13496, 0, 0.1529412, 1, 1,
0.3840695, 0.2882922, 1.984102, 0, 0.1490196, 1, 1,
0.3890655, -1.505272, 3.012659, 0, 0.1411765, 1, 1,
0.3915769, -0.1864178, 0.7432967, 0, 0.1372549, 1, 1,
0.4001215, 0.4446552, 0.6883014, 0, 0.1294118, 1, 1,
0.4023123, -0.5250818, 1.671924, 0, 0.1254902, 1, 1,
0.4031961, -0.8301388, 1.973208, 0, 0.1176471, 1, 1,
0.4048077, -0.2226509, 3.174059, 0, 0.1137255, 1, 1,
0.4076145, -0.3661558, 3.077255, 0, 0.1058824, 1, 1,
0.4086775, -1.5973, 2.252065, 0, 0.09803922, 1, 1,
0.409961, 0.4925331, -0.1897887, 0, 0.09411765, 1, 1,
0.4113764, 0.4158787, -0.7103091, 0, 0.08627451, 1, 1,
0.4154858, 0.05839642, 3.18604, 0, 0.08235294, 1, 1,
0.417875, -0.6700086, 2.840722, 0, 0.07450981, 1, 1,
0.4186641, -2.169554, 2.811635, 0, 0.07058824, 1, 1,
0.4255579, -1.35983, 1.012191, 0, 0.0627451, 1, 1,
0.4268954, 0.8124865, 1.655516, 0, 0.05882353, 1, 1,
0.4288231, 1.147863, -0.1938936, 0, 0.05098039, 1, 1,
0.429248, -0.3500512, 2.924136, 0, 0.04705882, 1, 1,
0.429875, 0.259463, 1.947337, 0, 0.03921569, 1, 1,
0.43076, -0.4466433, 3.127553, 0, 0.03529412, 1, 1,
0.4310209, 0.1801835, 0.0771196, 0, 0.02745098, 1, 1,
0.4313737, 0.5963428, 1.100244, 0, 0.02352941, 1, 1,
0.4335283, 1.170024, -0.6992163, 0, 0.01568628, 1, 1,
0.434841, -0.9916322, 2.91969, 0, 0.01176471, 1, 1,
0.4431407, 0.3416087, 0.6440275, 0, 0.003921569, 1, 1,
0.4455334, -0.207672, 3.574699, 0.003921569, 0, 1, 1,
0.4475137, 2.602923, 0.5711392, 0.007843138, 0, 1, 1,
0.4493984, -0.07637362, 2.891346, 0.01568628, 0, 1, 1,
0.4512248, -0.2153602, 2.735692, 0.01960784, 0, 1, 1,
0.4521112, -1.269102, 2.259007, 0.02745098, 0, 1, 1,
0.4526291, 0.2477402, 0.7202024, 0.03137255, 0, 1, 1,
0.4608442, 0.1197691, 1.571939, 0.03921569, 0, 1, 1,
0.4669397, -1.359503, 2.109385, 0.04313726, 0, 1, 1,
0.4756818, 0.0819876, 2.693445, 0.05098039, 0, 1, 1,
0.4776793, -0.1921619, 1.936154, 0.05490196, 0, 1, 1,
0.4779313, -0.8776653, 2.073562, 0.0627451, 0, 1, 1,
0.4789498, 0.02169978, 1.496018, 0.06666667, 0, 1, 1,
0.4790035, 0.4437585, -0.5183342, 0.07450981, 0, 1, 1,
0.4797982, -0.4614703, 3.341025, 0.07843138, 0, 1, 1,
0.4847109, -0.5172744, 3.234787, 0.08627451, 0, 1, 1,
0.4850359, 1.053656, 1.216444, 0.09019608, 0, 1, 1,
0.4881602, -0.8998485, 3.129432, 0.09803922, 0, 1, 1,
0.4919597, -1.192751, 3.50955, 0.1058824, 0, 1, 1,
0.493973, 0.5094213, 1.397242, 0.1098039, 0, 1, 1,
0.49556, 0.7770705, 0.5401484, 0.1176471, 0, 1, 1,
0.4971783, 0.2111197, 0.01049571, 0.1215686, 0, 1, 1,
0.5047054, -0.9862942, 2.347402, 0.1294118, 0, 1, 1,
0.5110946, 0.5423216, -0.03650158, 0.1333333, 0, 1, 1,
0.511653, 1.131954, 0.2825919, 0.1411765, 0, 1, 1,
0.5158673, -1.755935, 2.561285, 0.145098, 0, 1, 1,
0.5161438, 0.2600823, 0.9767313, 0.1529412, 0, 1, 1,
0.519559, 1.566031, 0.6643068, 0.1568628, 0, 1, 1,
0.521388, -0.6525158, 3.896947, 0.1647059, 0, 1, 1,
0.5257561, 0.9383963, -0.816626, 0.1686275, 0, 1, 1,
0.5274377, 1.80671, -0.7193191, 0.1764706, 0, 1, 1,
0.5287478, -0.734841, 3.55938, 0.1803922, 0, 1, 1,
0.5289227, -2.982083, 3.122065, 0.1882353, 0, 1, 1,
0.5309648, 1.795131, 1.167377, 0.1921569, 0, 1, 1,
0.5363048, -0.6440405, 3.244516, 0.2, 0, 1, 1,
0.5383636, -0.5692499, 3.781736, 0.2078431, 0, 1, 1,
0.5396505, -0.7583492, 3.797263, 0.2117647, 0, 1, 1,
0.5399354, 0.712777, 1.330827, 0.2196078, 0, 1, 1,
0.5428151, 1.699827, 0.7507142, 0.2235294, 0, 1, 1,
0.5468728, 0.498739, -0.2144926, 0.2313726, 0, 1, 1,
0.5469894, 0.3554493, 2.372914, 0.2352941, 0, 1, 1,
0.5489179, 1.612384, 0.8870713, 0.2431373, 0, 1, 1,
0.5491077, -0.8525215, 0.5647711, 0.2470588, 0, 1, 1,
0.5551811, -1.322462, 2.883894, 0.254902, 0, 1, 1,
0.5572562, 0.2014859, 2.923909, 0.2588235, 0, 1, 1,
0.5582458, 0.01748175, 1.39117, 0.2666667, 0, 1, 1,
0.560879, 0.201103, 0.4868878, 0.2705882, 0, 1, 1,
0.5656777, -2.16913, 2.774325, 0.2784314, 0, 1, 1,
0.5710547, 1.912964, 2.07515, 0.282353, 0, 1, 1,
0.5727298, 1.080222, 1.357724, 0.2901961, 0, 1, 1,
0.5730833, -0.7692196, 1.750623, 0.2941177, 0, 1, 1,
0.5790892, -0.4734248, 2.562808, 0.3019608, 0, 1, 1,
0.5810792, -1.96425, 2.480131, 0.3098039, 0, 1, 1,
0.5821956, -1.058852, 2.229393, 0.3137255, 0, 1, 1,
0.5842437, 1.006126, 1.57085, 0.3215686, 0, 1, 1,
0.5842557, -0.9909334, 1.662173, 0.3254902, 0, 1, 1,
0.5882949, 1.723468, -1.093988, 0.3333333, 0, 1, 1,
0.5932985, 0.3802426, 0.9318894, 0.3372549, 0, 1, 1,
0.5959893, -1.239778, 3.060347, 0.345098, 0, 1, 1,
0.5977196, 1.675983, -2.013508, 0.3490196, 0, 1, 1,
0.601022, -0.4197163, 1.826086, 0.3568628, 0, 1, 1,
0.601259, 2.28576, -1.971973, 0.3607843, 0, 1, 1,
0.6029555, 0.1191926, 1.711502, 0.3686275, 0, 1, 1,
0.6044765, -1.439758, 2.810129, 0.372549, 0, 1, 1,
0.6070766, -1.023702, 3.014406, 0.3803922, 0, 1, 1,
0.6119365, 0.1619806, 1.74701, 0.3843137, 0, 1, 1,
0.612983, -0.5353903, 3.768788, 0.3921569, 0, 1, 1,
0.6135066, -0.1734591, 1.719643, 0.3960784, 0, 1, 1,
0.6159648, -0.5992355, 2.924764, 0.4039216, 0, 1, 1,
0.6171167, 0.5099331, -0.1890896, 0.4117647, 0, 1, 1,
0.6207495, -1.613242, 3.498614, 0.4156863, 0, 1, 1,
0.6248032, 0.0779144, 0.08424638, 0.4235294, 0, 1, 1,
0.6253898, 0.7100129, 0.688064, 0.427451, 0, 1, 1,
0.630515, 1.007682, -0.0753288, 0.4352941, 0, 1, 1,
0.6305619, -0.1604937, 3.292885, 0.4392157, 0, 1, 1,
0.6329975, -1.561245, 1.051228, 0.4470588, 0, 1, 1,
0.6330911, 0.5854863, 0.982674, 0.4509804, 0, 1, 1,
0.634599, -0.3279369, 1.938471, 0.4588235, 0, 1, 1,
0.6388651, -0.2434288, 2.058462, 0.4627451, 0, 1, 1,
0.6389216, -0.1020587, -1.130642, 0.4705882, 0, 1, 1,
0.6416872, -0.7798805, 2.095382, 0.4745098, 0, 1, 1,
0.6442229, -2.382134, 2.27018, 0.4823529, 0, 1, 1,
0.6457701, 1.905797, 0.1664293, 0.4862745, 0, 1, 1,
0.6468071, 0.41113, -0.1123203, 0.4941176, 0, 1, 1,
0.6517521, -0.773043, 1.928145, 0.5019608, 0, 1, 1,
0.6528713, -1.574206, 4.214301, 0.5058824, 0, 1, 1,
0.6538972, 0.3275447, 2.507048, 0.5137255, 0, 1, 1,
0.6549038, -0.2301864, 1.800726, 0.5176471, 0, 1, 1,
0.6570423, -1.007895, 1.663048, 0.5254902, 0, 1, 1,
0.6576163, 2.258784, -0.5630094, 0.5294118, 0, 1, 1,
0.658475, -0.4994254, -0.02150708, 0.5372549, 0, 1, 1,
0.6598579, -0.5384547, 2.456515, 0.5411765, 0, 1, 1,
0.6600988, -0.7914422, 2.35416, 0.5490196, 0, 1, 1,
0.6654222, 1.247368, -0.3617976, 0.5529412, 0, 1, 1,
0.6664951, 0.6985614, 0.1332784, 0.5607843, 0, 1, 1,
0.6711386, 0.9276896, -0.3734834, 0.5647059, 0, 1, 1,
0.6735548, 1.164386, 1.613286, 0.572549, 0, 1, 1,
0.6741965, 1.205864, 0.718896, 0.5764706, 0, 1, 1,
0.6754419, 0.6351413, 0.01893659, 0.5843138, 0, 1, 1,
0.6788368, -1.320699, 0.8690962, 0.5882353, 0, 1, 1,
0.6848128, -0.3100399, 1.074978, 0.5960785, 0, 1, 1,
0.6880635, -0.4070779, 1.918104, 0.6039216, 0, 1, 1,
0.6887386, 0.1700463, 2.232187, 0.6078432, 0, 1, 1,
0.6980775, -0.903487, 3.49527, 0.6156863, 0, 1, 1,
0.7027826, -1.561735, 2.805255, 0.6196079, 0, 1, 1,
0.7043527, -1.513916, 3.938032, 0.627451, 0, 1, 1,
0.7047015, -0.3021339, 2.798206, 0.6313726, 0, 1, 1,
0.7050987, -0.5148582, 2.362253, 0.6392157, 0, 1, 1,
0.7110926, 0.9917347, -0.3841848, 0.6431373, 0, 1, 1,
0.7170461, 0.8043143, -0.8508537, 0.6509804, 0, 1, 1,
0.7183248, -0.3328092, 3.056259, 0.654902, 0, 1, 1,
0.7280769, -0.9170213, 2.005525, 0.6627451, 0, 1, 1,
0.7426961, 0.5332155, 2.047937, 0.6666667, 0, 1, 1,
0.7432643, -0.2609334, 3.254011, 0.6745098, 0, 1, 1,
0.7591711, 1.090301, 1.175114, 0.6784314, 0, 1, 1,
0.7620342, -0.2857286, 1.064199, 0.6862745, 0, 1, 1,
0.7651744, -0.5144333, 2.282025, 0.6901961, 0, 1, 1,
0.7663442, -1.930045, 2.362448, 0.6980392, 0, 1, 1,
0.7767102, -0.1423026, 1.406069, 0.7058824, 0, 1, 1,
0.7782885, -0.622172, 0.9084185, 0.7098039, 0, 1, 1,
0.7813158, -0.8711467, 1.039275, 0.7176471, 0, 1, 1,
0.7949862, -1.518584, 2.524219, 0.7215686, 0, 1, 1,
0.7971148, -1.066253, 1.614549, 0.7294118, 0, 1, 1,
0.8054281, 1.132772, 0.6263601, 0.7333333, 0, 1, 1,
0.8068079, 0.6677276, 1.001797, 0.7411765, 0, 1, 1,
0.8085015, -0.1696715, 2.337245, 0.7450981, 0, 1, 1,
0.8126664, 2.657028, -1.192074, 0.7529412, 0, 1, 1,
0.8147092, 0.4256276, 0.425272, 0.7568628, 0, 1, 1,
0.8153649, -1.04159, 1.995369, 0.7647059, 0, 1, 1,
0.8156185, -1.312757, 0.2524846, 0.7686275, 0, 1, 1,
0.8228053, -0.5729356, 1.3353, 0.7764706, 0, 1, 1,
0.8267935, 0.7831615, 1.196453, 0.7803922, 0, 1, 1,
0.8288112, -1.943741, 4.348908, 0.7882353, 0, 1, 1,
0.8288209, 0.6327983, 1.728939, 0.7921569, 0, 1, 1,
0.8311844, -1.007477, 0.1708734, 0.8, 0, 1, 1,
0.8346329, 0.1208486, 0.9904446, 0.8078431, 0, 1, 1,
0.8392526, -0.4067617, 2.319634, 0.8117647, 0, 1, 1,
0.8445603, -0.8029301, 2.250777, 0.8196079, 0, 1, 1,
0.8499481, 0.2064882, 2.097038, 0.8235294, 0, 1, 1,
0.8536809, 1.427431, 0.5929113, 0.8313726, 0, 1, 1,
0.8544996, 1.756211, 0.1719919, 0.8352941, 0, 1, 1,
0.8558422, -0.5957323, 1.23829, 0.8431373, 0, 1, 1,
0.8583108, -0.2416331, 2.782638, 0.8470588, 0, 1, 1,
0.8627267, 0.4975448, 0.2692405, 0.854902, 0, 1, 1,
0.8695555, -0.5292614, 3.973966, 0.8588235, 0, 1, 1,
0.871753, 2.072407, -1.086544, 0.8666667, 0, 1, 1,
0.8808129, 0.9658865, -0.1852186, 0.8705882, 0, 1, 1,
0.8812582, -0.2970843, 2.507833, 0.8784314, 0, 1, 1,
0.8832649, 1.591395, -0.2874271, 0.8823529, 0, 1, 1,
0.8863383, -0.3428504, 2.00173, 0.8901961, 0, 1, 1,
0.8900325, -0.3642838, 1.390292, 0.8941177, 0, 1, 1,
0.8914962, -0.9200641, 2.815945, 0.9019608, 0, 1, 1,
0.8940281, 0.8676297, 2.974487, 0.9098039, 0, 1, 1,
0.8963283, 0.3235994, 1.508262, 0.9137255, 0, 1, 1,
0.8970408, -0.7580392, 2.004259, 0.9215686, 0, 1, 1,
0.9055691, -0.01497224, 0.9399089, 0.9254902, 0, 1, 1,
0.9062215, -0.9458536, 1.889836, 0.9333333, 0, 1, 1,
0.9178247, 0.8695967, 0.9557529, 0.9372549, 0, 1, 1,
0.9261808, 0.1838816, 0.8126034, 0.945098, 0, 1, 1,
0.928812, 0.4525092, 1.997066, 0.9490196, 0, 1, 1,
0.9309679, -0.5072845, 2.068105, 0.9568627, 0, 1, 1,
0.9335259, -0.9032001, -0.1536634, 0.9607843, 0, 1, 1,
0.9355295, 0.8565285, 1.397794, 0.9686275, 0, 1, 1,
0.9370692, -0.4071523, 1.836312, 0.972549, 0, 1, 1,
0.9374459, -0.5601403, 3.777099, 0.9803922, 0, 1, 1,
0.9390858, -0.0466496, 2.298768, 0.9843137, 0, 1, 1,
0.9420463, -1.153998, 3.809555, 0.9921569, 0, 1, 1,
0.9433619, 0.4297492, 1.342342, 0.9960784, 0, 1, 1,
0.9482017, 0.7311623, 0.1575721, 1, 0, 0.9960784, 1,
0.9549086, 0.8799418, -0.0381351, 1, 0, 0.9882353, 1,
0.9578239, -0.5119094, 1.17996, 1, 0, 0.9843137, 1,
0.9587435, -0.5750704, 2.454138, 1, 0, 0.9764706, 1,
0.9589973, 0.005096217, 2.602744, 1, 0, 0.972549, 1,
0.9700624, 0.6779324, 2.396147, 1, 0, 0.9647059, 1,
0.970955, -1.27766, 2.641532, 1, 0, 0.9607843, 1,
0.971027, -0.1568086, -0.06959409, 1, 0, 0.9529412, 1,
0.9725773, -0.6478462, 2.237756, 1, 0, 0.9490196, 1,
0.9739892, -0.8275146, 3.133039, 1, 0, 0.9411765, 1,
0.9773511, -1.536033, 3.31134, 1, 0, 0.9372549, 1,
0.9805861, -1.656293, 2.09911, 1, 0, 0.9294118, 1,
0.9840519, 0.0540637, 1.017387, 1, 0, 0.9254902, 1,
0.9841812, 0.7152806, 2.123428, 1, 0, 0.9176471, 1,
0.9899333, -1.144549, 2.613495, 1, 0, 0.9137255, 1,
0.9916636, -2.048535, 3.28631, 1, 0, 0.9058824, 1,
0.9957083, -0.5087389, 3.286852, 1, 0, 0.9019608, 1,
1.001037, 0.5896133, 2.461418, 1, 0, 0.8941177, 1,
1.003524, 1.426072, -0.3616655, 1, 0, 0.8862745, 1,
1.005704, 0.6391096, 0.7581308, 1, 0, 0.8823529, 1,
1.005938, -0.3200468, 2.983681, 1, 0, 0.8745098, 1,
1.010172, 0.7433342, 1.601996, 1, 0, 0.8705882, 1,
1.013023, 0.3675034, 2.627689, 1, 0, 0.8627451, 1,
1.01728, 0.06069687, 2.244977, 1, 0, 0.8588235, 1,
1.020958, -2.094451, 2.589088, 1, 0, 0.8509804, 1,
1.026954, -0.7339736, 2.967201, 1, 0, 0.8470588, 1,
1.028542, 1.71669, 1.216189, 1, 0, 0.8392157, 1,
1.030816, -0.6385902, 0.76535, 1, 0, 0.8352941, 1,
1.036154, 1.751797, -0.2302399, 1, 0, 0.827451, 1,
1.042355, -0.2580714, 1.599507, 1, 0, 0.8235294, 1,
1.047757, -1.656482, 3.467536, 1, 0, 0.8156863, 1,
1.050694, -0.3618479, 1.362717, 1, 0, 0.8117647, 1,
1.051664, -0.366084, 2.678, 1, 0, 0.8039216, 1,
1.062688, 0.4666311, 0.2633058, 1, 0, 0.7960784, 1,
1.06559, -0.7919978, 0.6758316, 1, 0, 0.7921569, 1,
1.067278, 0.8582164, 0.6932452, 1, 0, 0.7843137, 1,
1.071315, 1.286682, 0.9839649, 1, 0, 0.7803922, 1,
1.072337, 0.4348482, 1.34936, 1, 0, 0.772549, 1,
1.080482, -1.131493, 3.811176, 1, 0, 0.7686275, 1,
1.085342, 0.6171058, 1.257963, 1, 0, 0.7607843, 1,
1.091824, 1.081733, -0.972979, 1, 0, 0.7568628, 1,
1.097165, -0.8797659, 1.973334, 1, 0, 0.7490196, 1,
1.098557, 1.144096, 1.678114, 1, 0, 0.7450981, 1,
1.10011, 0.2266455, 0.358613, 1, 0, 0.7372549, 1,
1.10479, 0.9923885, -0.2887095, 1, 0, 0.7333333, 1,
1.106467, 0.2120469, -0.1635045, 1, 0, 0.7254902, 1,
1.112164, -2.013592, 2.815642, 1, 0, 0.7215686, 1,
1.117127, 0.2407826, 3.375631, 1, 0, 0.7137255, 1,
1.120057, -0.3591125, 1.34666, 1, 0, 0.7098039, 1,
1.120274, 0.6804301, -0.9906245, 1, 0, 0.7019608, 1,
1.12855, -2.089359, 3.955585, 1, 0, 0.6941177, 1,
1.128836, -1.419, 4.037369, 1, 0, 0.6901961, 1,
1.130235, 0.2645724, 1.939818, 1, 0, 0.682353, 1,
1.130744, 1.186014, 1.396461, 1, 0, 0.6784314, 1,
1.138441, -0.9485738, 3.520177, 1, 0, 0.6705883, 1,
1.138442, -1.381299, 0.1882047, 1, 0, 0.6666667, 1,
1.140135, 1.203496, 1.391721, 1, 0, 0.6588235, 1,
1.140933, 0.7990148, 1.5018, 1, 0, 0.654902, 1,
1.148089, -1.700436, 3.628612, 1, 0, 0.6470588, 1,
1.148735, 0.7679248, 0.06787176, 1, 0, 0.6431373, 1,
1.150564, -0.7201417, 2.696321, 1, 0, 0.6352941, 1,
1.152889, 0.6886355, 1.926177, 1, 0, 0.6313726, 1,
1.175489, -0.2526819, 2.736526, 1, 0, 0.6235294, 1,
1.181841, -1.023914, 1.414899, 1, 0, 0.6196079, 1,
1.182614, -0.3612494, 1.463682, 1, 0, 0.6117647, 1,
1.185071, 0.241704, 2.075848, 1, 0, 0.6078432, 1,
1.19966, 0.8716782, 0.9671659, 1, 0, 0.6, 1,
1.209381, -0.6433953, 0.9277977, 1, 0, 0.5921569, 1,
1.211355, -0.4638118, 2.567024, 1, 0, 0.5882353, 1,
1.212042, 1.440249, 1.24217, 1, 0, 0.5803922, 1,
1.223197, -0.5484058, 1.68058, 1, 0, 0.5764706, 1,
1.224862, 0.6146506, 1.758898, 1, 0, 0.5686275, 1,
1.227114, -0.4229941, 2.567262, 1, 0, 0.5647059, 1,
1.231311, -0.5462503, 1.70752, 1, 0, 0.5568628, 1,
1.245061, 0.7650349, 0.6881187, 1, 0, 0.5529412, 1,
1.245883, 0.7397211, -0.3402597, 1, 0, 0.5450981, 1,
1.248142, 0.6098852, 0.1851146, 1, 0, 0.5411765, 1,
1.257669, 1.889042, 0.250887, 1, 0, 0.5333334, 1,
1.264826, 0.1960623, -0.9600613, 1, 0, 0.5294118, 1,
1.271626, -0.3773627, 1.731975, 1, 0, 0.5215687, 1,
1.274873, -0.4406956, 3.24819, 1, 0, 0.5176471, 1,
1.290069, -1.130058, 2.869372, 1, 0, 0.509804, 1,
1.293022, -0.3577827, 2.402997, 1, 0, 0.5058824, 1,
1.293341, 0.06243436, 3.219663, 1, 0, 0.4980392, 1,
1.295322, -0.7759007, 2.509479, 1, 0, 0.4901961, 1,
1.305174, -0.02603203, 2.635813, 1, 0, 0.4862745, 1,
1.32096, -1.634572, 3.56598, 1, 0, 0.4784314, 1,
1.336114, -0.7702571, 2.115888, 1, 0, 0.4745098, 1,
1.344659, 1.316764, 0.526746, 1, 0, 0.4666667, 1,
1.34913, -1.234257, 3.086958, 1, 0, 0.4627451, 1,
1.349692, -0.2822963, 2.295295, 1, 0, 0.454902, 1,
1.351812, 0.1974572, 0.3661982, 1, 0, 0.4509804, 1,
1.35494, 0.3484871, 1.439885, 1, 0, 0.4431373, 1,
1.362426, 1.076824, 1.742651, 1, 0, 0.4392157, 1,
1.376535, 0.8024908, 1.376078, 1, 0, 0.4313726, 1,
1.384934, -0.8672398, 0.8377334, 1, 0, 0.427451, 1,
1.387668, -0.6047668, 2.293469, 1, 0, 0.4196078, 1,
1.390892, -1.656788, 3.453152, 1, 0, 0.4156863, 1,
1.403502, -1.765653, 0.6721419, 1, 0, 0.4078431, 1,
1.424212, -0.6339424, 3.448778, 1, 0, 0.4039216, 1,
1.426882, -2.349241, 3.659866, 1, 0, 0.3960784, 1,
1.430667, -0.4069735, 2.943185, 1, 0, 0.3882353, 1,
1.432522, 0.07639888, 1.2449, 1, 0, 0.3843137, 1,
1.440456, -0.3198991, 1.272122, 1, 0, 0.3764706, 1,
1.450296, -1.359569, 1.841897, 1, 0, 0.372549, 1,
1.455696, 1.147255, 0.9158932, 1, 0, 0.3647059, 1,
1.46072, 1.379361, 2.739885, 1, 0, 0.3607843, 1,
1.470846, -1.560498, 3.392236, 1, 0, 0.3529412, 1,
1.477421, -0.5532348, 2.422714, 1, 0, 0.3490196, 1,
1.491503, -0.6993006, 1.841053, 1, 0, 0.3411765, 1,
1.498497, 0.6709549, 0.5560086, 1, 0, 0.3372549, 1,
1.498879, -0.8435465, 2.987984, 1, 0, 0.3294118, 1,
1.51386, 0.960242, -0.09486882, 1, 0, 0.3254902, 1,
1.527293, 0.8188106, 0.4720777, 1, 0, 0.3176471, 1,
1.528611, -1.169014, 1.769255, 1, 0, 0.3137255, 1,
1.53224, -0.1977392, 0.635829, 1, 0, 0.3058824, 1,
1.548064, 0.2925789, 1.604996, 1, 0, 0.2980392, 1,
1.557875, 0.4662915, 0.1194661, 1, 0, 0.2941177, 1,
1.583246, -0.3481549, -0.1556062, 1, 0, 0.2862745, 1,
1.586266, -1.485724, 2.017396, 1, 0, 0.282353, 1,
1.586288, 1.354677, -0.8997443, 1, 0, 0.2745098, 1,
1.589418, -1.141354, 2.590078, 1, 0, 0.2705882, 1,
1.607924, 1.407115, 0.9470783, 1, 0, 0.2627451, 1,
1.619695, 1.358352, 0.8581145, 1, 0, 0.2588235, 1,
1.623818, -0.6233897, 0.4683067, 1, 0, 0.2509804, 1,
1.634611, 0.2703959, 0.8898951, 1, 0, 0.2470588, 1,
1.637869, 1.034914, 0.5050516, 1, 0, 0.2392157, 1,
1.66662, -0.03000495, 2.515055, 1, 0, 0.2352941, 1,
1.674979, 1.843494, 1.804948, 1, 0, 0.227451, 1,
1.680547, -0.6208678, 2.606328, 1, 0, 0.2235294, 1,
1.691563, 0.8086707, -0.4437324, 1, 0, 0.2156863, 1,
1.707372, -0.4139389, 4.054741, 1, 0, 0.2117647, 1,
1.715119, 0.1560654, -0.2700188, 1, 0, 0.2039216, 1,
1.723141, 1.939434, 1.049014, 1, 0, 0.1960784, 1,
1.795643, 0.8301082, 0.4698271, 1, 0, 0.1921569, 1,
1.798495, -1.105909, 1.67752, 1, 0, 0.1843137, 1,
1.807582, 0.01004641, 2.198766, 1, 0, 0.1803922, 1,
1.843691, -0.6397996, 2.326806, 1, 0, 0.172549, 1,
1.850157, 0.5003914, 1.486919, 1, 0, 0.1686275, 1,
1.89125, -0.3300945, 1.382308, 1, 0, 0.1607843, 1,
1.932461, -0.3203669, 0.743106, 1, 0, 0.1568628, 1,
1.95013, 0.2279064, 1.261261, 1, 0, 0.1490196, 1,
1.963482, -1.479562, 3.20509, 1, 0, 0.145098, 1,
1.981446, -1.891604, 2.507748, 1, 0, 0.1372549, 1,
1.983194, -0.7267139, 2.011999, 1, 0, 0.1333333, 1,
1.984754, -1.008511, 1.915317, 1, 0, 0.1254902, 1,
2.011493, -0.195529, 1.621188, 1, 0, 0.1215686, 1,
2.04514, -0.3879745, 1.553576, 1, 0, 0.1137255, 1,
2.045255, -0.4019429, 1.634066, 1, 0, 0.1098039, 1,
2.064836, -0.6638375, 3.856331, 1, 0, 0.1019608, 1,
2.092291, -0.2208112, 0.3959342, 1, 0, 0.09411765, 1,
2.139997, 0.2648234, 1.96721, 1, 0, 0.09019608, 1,
2.157483, -0.3479032, 0.1563712, 1, 0, 0.08235294, 1,
2.206643, 0.04325129, 1.764169, 1, 0, 0.07843138, 1,
2.259286, 0.2204861, -0.4776924, 1, 0, 0.07058824, 1,
2.261606, 1.301637, 1.054627, 1, 0, 0.06666667, 1,
2.369042, 1.241156, 0.713773, 1, 0, 0.05882353, 1,
2.40041, 0.2360729, 1.267342, 1, 0, 0.05490196, 1,
2.401273, -1.545914, 1.971833, 1, 0, 0.04705882, 1,
2.402677, 1.239779, 1.10856, 1, 0, 0.04313726, 1,
2.444182, -0.6875531, 2.853312, 1, 0, 0.03529412, 1,
2.690254, -0.5104225, 2.270601, 1, 0, 0.03137255, 1,
2.714314, 0.6326157, 1.737919, 1, 0, 0.02352941, 1,
2.992657, 0.8608519, -0.9691336, 1, 0, 0.01960784, 1,
3.354675, 0.3669783, 1.263575, 1, 0, 0.01176471, 1,
3.457903, -1.003506, 2.227092, 1, 0, 0.007843138, 1
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
-0.1762694, -3.972086, -7.124321, 0, -0.5, 0.5, 0.5,
-0.1762694, -3.972086, -7.124321, 1, -0.5, 0.5, 0.5,
-0.1762694, -3.972086, -7.124321, 1, 1.5, 0.5, 0.5,
-0.1762694, -3.972086, -7.124321, 0, 1.5, 0.5, 0.5
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
-5.042426, -0.06171906, -7.124321, 0, -0.5, 0.5, 0.5,
-5.042426, -0.06171906, -7.124321, 1, -0.5, 0.5, 0.5,
-5.042426, -0.06171906, -7.124321, 1, 1.5, 0.5, 0.5,
-5.042426, -0.06171906, -7.124321, 0, 1.5, 0.5, 0.5
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
-5.042426, -3.972086, 0.4491389, 0, -0.5, 0.5, 0.5,
-5.042426, -3.972086, 0.4491389, 1, -0.5, 0.5, 0.5,
-5.042426, -3.972086, 0.4491389, 1, 1.5, 0.5, 0.5,
-5.042426, -3.972086, 0.4491389, 0, 1.5, 0.5, 0.5
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
-2, -3.069694, -5.376599,
2, -3.069694, -5.376599,
-2, -3.069694, -5.376599,
-2, -3.220093, -5.667886,
0, -3.069694, -5.376599,
0, -3.220093, -5.667886,
2, -3.069694, -5.376599,
2, -3.220093, -5.667886
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
"0",
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
-2, -3.52089, -6.25046, 0, -0.5, 0.5, 0.5,
-2, -3.52089, -6.25046, 1, -0.5, 0.5, 0.5,
-2, -3.52089, -6.25046, 1, 1.5, 0.5, 0.5,
-2, -3.52089, -6.25046, 0, 1.5, 0.5, 0.5,
0, -3.52089, -6.25046, 0, -0.5, 0.5, 0.5,
0, -3.52089, -6.25046, 1, -0.5, 0.5, 0.5,
0, -3.52089, -6.25046, 1, 1.5, 0.5, 0.5,
0, -3.52089, -6.25046, 0, 1.5, 0.5, 0.5,
2, -3.52089, -6.25046, 0, -0.5, 0.5, 0.5,
2, -3.52089, -6.25046, 1, -0.5, 0.5, 0.5,
2, -3.52089, -6.25046, 1, 1.5, 0.5, 0.5,
2, -3.52089, -6.25046, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.919467, -2, -5.376599,
-3.919467, 2, -5.376599,
-3.919467, -2, -5.376599,
-4.106627, -2, -5.667886,
-3.919467, -1, -5.376599,
-4.106627, -1, -5.667886,
-3.919467, 0, -5.376599,
-4.106627, 0, -5.667886,
-3.919467, 1, -5.376599,
-4.106627, 1, -5.667886,
-3.919467, 2, -5.376599,
-4.106627, 2, -5.667886
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
-4.480947, -2, -6.25046, 0, -0.5, 0.5, 0.5,
-4.480947, -2, -6.25046, 1, -0.5, 0.5, 0.5,
-4.480947, -2, -6.25046, 1, 1.5, 0.5, 0.5,
-4.480947, -2, -6.25046, 0, 1.5, 0.5, 0.5,
-4.480947, -1, -6.25046, 0, -0.5, 0.5, 0.5,
-4.480947, -1, -6.25046, 1, -0.5, 0.5, 0.5,
-4.480947, -1, -6.25046, 1, 1.5, 0.5, 0.5,
-4.480947, -1, -6.25046, 0, 1.5, 0.5, 0.5,
-4.480947, 0, -6.25046, 0, -0.5, 0.5, 0.5,
-4.480947, 0, -6.25046, 1, -0.5, 0.5, 0.5,
-4.480947, 0, -6.25046, 1, 1.5, 0.5, 0.5,
-4.480947, 0, -6.25046, 0, 1.5, 0.5, 0.5,
-4.480947, 1, -6.25046, 0, -0.5, 0.5, 0.5,
-4.480947, 1, -6.25046, 1, -0.5, 0.5, 0.5,
-4.480947, 1, -6.25046, 1, 1.5, 0.5, 0.5,
-4.480947, 1, -6.25046, 0, 1.5, 0.5, 0.5,
-4.480947, 2, -6.25046, 0, -0.5, 0.5, 0.5,
-4.480947, 2, -6.25046, 1, -0.5, 0.5, 0.5,
-4.480947, 2, -6.25046, 1, 1.5, 0.5, 0.5,
-4.480947, 2, -6.25046, 0, 1.5, 0.5, 0.5
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
-3.919467, -3.069694, -4,
-3.919467, -3.069694, 6,
-3.919467, -3.069694, -4,
-4.106627, -3.220093, -4,
-3.919467, -3.069694, -2,
-4.106627, -3.220093, -2,
-3.919467, -3.069694, 0,
-4.106627, -3.220093, 0,
-3.919467, -3.069694, 2,
-4.106627, -3.220093, 2,
-3.919467, -3.069694, 4,
-4.106627, -3.220093, 4,
-3.919467, -3.069694, 6,
-4.106627, -3.220093, 6
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
-4.480947, -3.52089, -4, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, -4, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, -4, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, -4, 0, 1.5, 0.5, 0.5,
-4.480947, -3.52089, -2, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, -2, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, -2, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, -2, 0, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 0, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 0, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 0, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 0, 0, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 2, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 2, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 2, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 2, 0, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 4, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 4, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 4, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 4, 0, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 6, 0, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 6, 1, -0.5, 0.5, 0.5,
-4.480947, -3.52089, 6, 1, 1.5, 0.5, 0.5,
-4.480947, -3.52089, 6, 0, 1.5, 0.5, 0.5
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
-3.919467, -3.069694, -5.376599,
-3.919467, 2.946256, -5.376599,
-3.919467, -3.069694, 6.274877,
-3.919467, 2.946256, 6.274877,
-3.919467, -3.069694, -5.376599,
-3.919467, -3.069694, 6.274877,
-3.919467, 2.946256, -5.376599,
-3.919467, 2.946256, 6.274877,
-3.919467, -3.069694, -5.376599,
3.566928, -3.069694, -5.376599,
-3.919467, -3.069694, 6.274877,
3.566928, -3.069694, 6.274877,
-3.919467, 2.946256, -5.376599,
3.566928, 2.946256, -5.376599,
-3.919467, 2.946256, 6.274877,
3.566928, 2.946256, 6.274877,
3.566928, -3.069694, -5.376599,
3.566928, 2.946256, -5.376599,
3.566928, -3.069694, 6.274877,
3.566928, 2.946256, 6.274877,
3.566928, -3.069694, -5.376599,
3.566928, -3.069694, 6.274877,
3.566928, 2.946256, -5.376599,
3.566928, 2.946256, 6.274877
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
var radius = 8.062836;
var distance = 35.87247;
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
mvMatrix.translate( 0.1762694, 0.06171906, -0.4491389 );
mvMatrix.scale( 1.164472, 1.449097, 0.7482052 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.87247);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
isoxaflutole<-read.table("isoxaflutole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxaflutole$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
```

```r
y<-isoxaflutole$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
```

```r
z<-isoxaflutole$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
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
-3.810442, -0.3427142, -0.8024214, 0, 0, 1, 1, 1,
-3.61139, -1.042778, -3.375821, 1, 0, 0, 1, 1,
-3.249855, 2.262918, 1.040498, 1, 0, 0, 1, 1,
-3.14794, -0.1338578, -0.5709764, 1, 0, 0, 1, 1,
-3.125522, -0.4905095, -2.306798, 1, 0, 0, 1, 1,
-2.899544, 0.2638448, 0.1687057, 1, 0, 0, 1, 1,
-2.807673, 1.481135, 0.1186299, 0, 0, 0, 1, 1,
-2.636001, -0.9695631, -2.602124, 0, 0, 0, 1, 1,
-2.630789, 1.096606, -1.985557, 0, 0, 0, 1, 1,
-2.520006, 0.1064182, -0.5656231, 0, 0, 0, 1, 1,
-2.500122, 1.318146, -1.504098, 0, 0, 0, 1, 1,
-2.48807, 0.134164, -1.672763, 0, 0, 0, 1, 1,
-2.468145, 0.2479087, -2.124602, 0, 0, 0, 1, 1,
-2.395428, -0.3601317, -0.8484106, 1, 1, 1, 1, 1,
-2.348788, 1.156025, -2.074178, 1, 1, 1, 1, 1,
-2.212123, 0.4562786, -1.953907, 1, 1, 1, 1, 1,
-2.089112, 0.7643476, 0.3863828, 1, 1, 1, 1, 1,
-2.058484, 2.536531, -0.1180608, 1, 1, 1, 1, 1,
-2.057687, 0.01399283, -2.7005, 1, 1, 1, 1, 1,
-2.038883, 1.163695, 0.5505002, 1, 1, 1, 1, 1,
-1.964542, 0.2288035, -1.6015, 1, 1, 1, 1, 1,
-1.900748, -0.01554075, -3.543625, 1, 1, 1, 1, 1,
-1.873453, 7.928326e-05, -2.170225, 1, 1, 1, 1, 1,
-1.857527, -1.332613, -1.066596, 1, 1, 1, 1, 1,
-1.828306, 1.542914, -0.07060163, 1, 1, 1, 1, 1,
-1.827362, 1.317805, -0.903649, 1, 1, 1, 1, 1,
-1.816469, -1.306644, -0.8171806, 1, 1, 1, 1, 1,
-1.809732, -0.9017903, -3.115702, 1, 1, 1, 1, 1,
-1.803118, 0.17575, -1.273548, 0, 0, 1, 1, 1,
-1.802217, -0.4716302, 0.1632064, 1, 0, 0, 1, 1,
-1.791641, 0.6597101, -1.812235, 1, 0, 0, 1, 1,
-1.784486, 0.4120554, -0.595219, 1, 0, 0, 1, 1,
-1.751586, -0.5703999, -1.390433, 1, 0, 0, 1, 1,
-1.750877, -0.7184369, -2.022755, 1, 0, 0, 1, 1,
-1.73281, 0.4399739, -2.436181, 0, 0, 0, 1, 1,
-1.69464, -0.001564358, -0.9637423, 0, 0, 0, 1, 1,
-1.688434, -0.633364, -0.9198636, 0, 0, 0, 1, 1,
-1.671335, -0.8432763, -1.210196, 0, 0, 0, 1, 1,
-1.658212, -0.6506064, -0.5426655, 0, 0, 0, 1, 1,
-1.647972, -0.4495827, -1.152221, 0, 0, 0, 1, 1,
-1.614974, 0.8543213, -2.842418, 0, 0, 0, 1, 1,
-1.607774, -0.6133986, -1.331154, 1, 1, 1, 1, 1,
-1.591482, 1.879467, -0.1037717, 1, 1, 1, 1, 1,
-1.577744, 0.7185304, 0.1233232, 1, 1, 1, 1, 1,
-1.567172, 0.8243126, -1.20027, 1, 1, 1, 1, 1,
-1.53754, -0.4063865, -0.913699, 1, 1, 1, 1, 1,
-1.504548, -0.5465161, -2.075074, 1, 1, 1, 1, 1,
-1.50115, -1.148087, -1.406164, 1, 1, 1, 1, 1,
-1.49633, 0.1085578, -1.51214, 1, 1, 1, 1, 1,
-1.493362, -0.5776894, -3.607566, 1, 1, 1, 1, 1,
-1.484032, 0.9527715, -0.7896684, 1, 1, 1, 1, 1,
-1.480596, -1.079853, -1.154023, 1, 1, 1, 1, 1,
-1.46913, -1.282286, -3.650913, 1, 1, 1, 1, 1,
-1.468982, 0.1894128, -1.497688, 1, 1, 1, 1, 1,
-1.451255, -0.1889951, -0.1161535, 1, 1, 1, 1, 1,
-1.448508, 0.1207087, -1.707011, 1, 1, 1, 1, 1,
-1.438493, -0.7314746, -1.609296, 0, 0, 1, 1, 1,
-1.423449, 0.8390114, -0.204933, 1, 0, 0, 1, 1,
-1.423374, -0.1000938, -0.9729145, 1, 0, 0, 1, 1,
-1.418751, -0.07580619, -0.3112393, 1, 0, 0, 1, 1,
-1.405537, -0.1322522, -2.008315, 1, 0, 0, 1, 1,
-1.403295, -0.02783152, -2.374223, 1, 0, 0, 1, 1,
-1.395543, -0.5066619, -1.390813, 0, 0, 0, 1, 1,
-1.393818, 0.06663252, -2.258603, 0, 0, 0, 1, 1,
-1.387369, -0.04527303, -1.954562, 0, 0, 0, 1, 1,
-1.362942, 0.4576456, 0.007831355, 0, 0, 0, 1, 1,
-1.360915, -0.0898957, 0.8257454, 0, 0, 0, 1, 1,
-1.360026, 1.607557, -1.460311, 0, 0, 0, 1, 1,
-1.35102, 0.05302161, -0.4676147, 0, 0, 0, 1, 1,
-1.343771, -1.156181, -2.756732, 1, 1, 1, 1, 1,
-1.340342, -0.9290231, -2.75265, 1, 1, 1, 1, 1,
-1.338566, -0.1507869, -2.052774, 1, 1, 1, 1, 1,
-1.325665, -0.3544975, -1.341729, 1, 1, 1, 1, 1,
-1.324563, -0.359072, -2.425739, 1, 1, 1, 1, 1,
-1.313549, -0.4314616, -1.905712, 1, 1, 1, 1, 1,
-1.312718, 0.7042061, -0.387879, 1, 1, 1, 1, 1,
-1.309527, -1.265326, -2.237293, 1, 1, 1, 1, 1,
-1.303917, -1.056255, -3.462022, 1, 1, 1, 1, 1,
-1.300643, 0.314285, -1.698632, 1, 1, 1, 1, 1,
-1.296344, -1.640851, -2.854627, 1, 1, 1, 1, 1,
-1.291683, -0.3954285, -1.620726, 1, 1, 1, 1, 1,
-1.284232, 1.863302, 0.1321068, 1, 1, 1, 1, 1,
-1.280591, -1.323289, -1.490698, 1, 1, 1, 1, 1,
-1.275581, 0.3199152, -0.3869895, 1, 1, 1, 1, 1,
-1.274428, 0.4735498, -2.70732, 0, 0, 1, 1, 1,
-1.266874, 0.7648556, -0.2195508, 1, 0, 0, 1, 1,
-1.256363, -0.1242375, -2.399993, 1, 0, 0, 1, 1,
-1.252143, 0.6413907, -0.542787, 1, 0, 0, 1, 1,
-1.243161, 0.5430293, 0.02835532, 1, 0, 0, 1, 1,
-1.240131, 0.01147468, -0.9522066, 1, 0, 0, 1, 1,
-1.230613, -0.8409312, -2.181637, 0, 0, 0, 1, 1,
-1.21966, -0.7794681, -2.422716, 0, 0, 0, 1, 1,
-1.216108, -1.295834, -2.935772, 0, 0, 0, 1, 1,
-1.211078, 1.783879, 0.3900063, 0, 0, 0, 1, 1,
-1.210816, 2.23962, -0.1663009, 0, 0, 0, 1, 1,
-1.208945, -0.4791125, -0.5189892, 0, 0, 0, 1, 1,
-1.206033, -1.285857, -2.914619, 0, 0, 0, 1, 1,
-1.205692, -0.2499405, -2.978137, 1, 1, 1, 1, 1,
-1.2024, 0.06218049, -0.9119744, 1, 1, 1, 1, 1,
-1.196454, 0.6535932, -0.4653188, 1, 1, 1, 1, 1,
-1.191882, -0.01410196, -2.355025, 1, 1, 1, 1, 1,
-1.190942, 1.4543, -1.901065, 1, 1, 1, 1, 1,
-1.188899, 0.8934016, -0.9569044, 1, 1, 1, 1, 1,
-1.183908, -1.289849, -1.80121, 1, 1, 1, 1, 1,
-1.181451, 2.278038, -2.672503, 1, 1, 1, 1, 1,
-1.176561, -0.5583858, -2.358765, 1, 1, 1, 1, 1,
-1.172574, 0.0546327, -0.5249441, 1, 1, 1, 1, 1,
-1.159648, 0.7046155, -1.064358, 1, 1, 1, 1, 1,
-1.156096, 0.6015279, 0.03801132, 1, 1, 1, 1, 1,
-1.140482, -0.7406195, -3.781881, 1, 1, 1, 1, 1,
-1.138251, 0.9091557, -1.118842, 1, 1, 1, 1, 1,
-1.126012, -0.9117078, -3.393796, 1, 1, 1, 1, 1,
-1.121937, -0.620609, -2.873579, 0, 0, 1, 1, 1,
-1.115088, 0.06893296, -2.778686, 1, 0, 0, 1, 1,
-1.115065, 1.07179, -0.03991826, 1, 0, 0, 1, 1,
-1.111532, -0.8435413, -3.733902, 1, 0, 0, 1, 1,
-1.101408, 0.5892711, -1.487068, 1, 0, 0, 1, 1,
-1.101296, 1.507391, -2.216398, 1, 0, 0, 1, 1,
-1.098239, -0.967801, -2.846853, 0, 0, 0, 1, 1,
-1.097471, 0.4641433, -0.5878733, 0, 0, 0, 1, 1,
-1.096197, 0.3323764, -2.661804, 0, 0, 0, 1, 1,
-1.095642, 0.7570552, 0.4754236, 0, 0, 0, 1, 1,
-1.088565, -0.3702546, -1.247376, 0, 0, 0, 1, 1,
-1.074077, 0.2946379, -1.795981, 0, 0, 0, 1, 1,
-1.073237, 0.08418458, -1.747803, 0, 0, 0, 1, 1,
-1.069252, 0.3694838, -1.918583, 1, 1, 1, 1, 1,
-1.067923, 0.000519748, -1.951433, 1, 1, 1, 1, 1,
-1.062629, 0.1384644, -2.149858, 1, 1, 1, 1, 1,
-1.055279, 0.7341906, -1.126443, 1, 1, 1, 1, 1,
-1.053625, 1.958616, -0.2437168, 1, 1, 1, 1, 1,
-1.053414, -1.300169, -1.854448, 1, 1, 1, 1, 1,
-1.049293, 0.1682754, -0.488045, 1, 1, 1, 1, 1,
-1.048424, 1.197813, -2.004304, 1, 1, 1, 1, 1,
-1.039219, 0.04019625, -0.8317702, 1, 1, 1, 1, 1,
-1.038515, 1.720388, -0.3115164, 1, 1, 1, 1, 1,
-1.027537, 0.9964572, -1.946682, 1, 1, 1, 1, 1,
-1.022815, 0.2045286, -0.3549528, 1, 1, 1, 1, 1,
-1.022784, -0.3747763, -1.00918, 1, 1, 1, 1, 1,
-1.017273, 1.5058, -0.3240267, 1, 1, 1, 1, 1,
-1.016897, 1.959941, -0.6835127, 1, 1, 1, 1, 1,
-1.001959, 0.5286916, -1.514438, 0, 0, 1, 1, 1,
-1.001383, 0.5551265, 1.28668, 1, 0, 0, 1, 1,
-1.000121, 0.4235042, -1.894225, 1, 0, 0, 1, 1,
-0.9975382, 0.417916, -0.7382876, 1, 0, 0, 1, 1,
-0.9951383, -0.9317912, -3.914377, 1, 0, 0, 1, 1,
-0.9934388, 0.2467413, -2.450691, 1, 0, 0, 1, 1,
-0.9820372, 1.508661, 1.530516, 0, 0, 0, 1, 1,
-0.9796575, 0.01084108, -1.025557, 0, 0, 0, 1, 1,
-0.9769834, 0.6120643, -1.660052, 0, 0, 0, 1, 1,
-0.9750313, 0.3808111, 0.8081664, 0, 0, 0, 1, 1,
-0.9604632, -0.196096, -0.8317218, 0, 0, 0, 1, 1,
-0.9591467, -0.3584832, -3.676142, 0, 0, 0, 1, 1,
-0.9571033, -0.04467795, -1.843764, 0, 0, 0, 1, 1,
-0.9565897, -0.2390136, -1.254366, 1, 1, 1, 1, 1,
-0.9527599, 0.7507159, -0.8202533, 1, 1, 1, 1, 1,
-0.9353542, 0.3707189, -0.9328718, 1, 1, 1, 1, 1,
-0.9306059, 0.8493569, -2.384976, 1, 1, 1, 1, 1,
-0.919012, -0.9178852, -3.980429, 1, 1, 1, 1, 1,
-0.9122756, 0.3864628, -0.4918325, 1, 1, 1, 1, 1,
-0.9119757, 1.165952, -1.885356, 1, 1, 1, 1, 1,
-0.9103357, 0.1213231, -1.311133, 1, 1, 1, 1, 1,
-0.9058986, 0.2481852, -2.372923, 1, 1, 1, 1, 1,
-0.9046396, 1.772406, -1.269912, 1, 1, 1, 1, 1,
-0.9021031, 2.008621, -0.9452499, 1, 1, 1, 1, 1,
-0.9008756, -0.7491608, -2.212817, 1, 1, 1, 1, 1,
-0.8872659, -0.5503651, -1.850338, 1, 1, 1, 1, 1,
-0.8824005, 0.2037064, -2.267137, 1, 1, 1, 1, 1,
-0.8813381, 0.2485489, -0.2438862, 1, 1, 1, 1, 1,
-0.8708869, -1.170533, -2.300882, 0, 0, 1, 1, 1,
-0.87001, -0.8692783, -1.130658, 1, 0, 0, 1, 1,
-0.8675265, 0.4271903, -1.3526, 1, 0, 0, 1, 1,
-0.8643155, 1.384633, -0.06743663, 1, 0, 0, 1, 1,
-0.8601953, -0.7580072, -1.9528, 1, 0, 0, 1, 1,
-0.8579981, -0.7016476, -3.283752, 1, 0, 0, 1, 1,
-0.8550249, 0.9647987, -0.01694131, 0, 0, 0, 1, 1,
-0.848494, 0.3083399, -2.330444, 0, 0, 0, 1, 1,
-0.8473424, -0.1763313, -2.090939, 0, 0, 0, 1, 1,
-0.8456958, -2.074225, -3.865651, 0, 0, 0, 1, 1,
-0.8394899, -0.6208242, -1.306442, 0, 0, 0, 1, 1,
-0.8379657, -1.129766, -2.045542, 0, 0, 0, 1, 1,
-0.8326389, -1.469661, -0.5142549, 0, 0, 0, 1, 1,
-0.8281687, -0.2519645, -2.382713, 1, 1, 1, 1, 1,
-0.8258685, 0.384582, -0.3195879, 1, 1, 1, 1, 1,
-0.8216673, -1.058728, -2.682346, 1, 1, 1, 1, 1,
-0.8207109, 0.1432818, -0.8096942, 1, 1, 1, 1, 1,
-0.8167908, -1.931322, -0.1830004, 1, 1, 1, 1, 1,
-0.8165197, 0.04766765, -0.3898664, 1, 1, 1, 1, 1,
-0.8147569, 0.7108431, -0.5803992, 1, 1, 1, 1, 1,
-0.8141811, -0.3722276, -1.050315, 1, 1, 1, 1, 1,
-0.8121428, -0.9445091, -2.665729, 1, 1, 1, 1, 1,
-0.811505, -0.06049339, -2.310194, 1, 1, 1, 1, 1,
-0.8082754, -0.7120501, -2.456573, 1, 1, 1, 1, 1,
-0.8026791, 1.515786, -1.497893, 1, 1, 1, 1, 1,
-0.8008471, -0.1427139, -1.712249, 1, 1, 1, 1, 1,
-0.7995566, -0.0139799, -2.000126, 1, 1, 1, 1, 1,
-0.7984977, -1.414231, -2.542767, 1, 1, 1, 1, 1,
-0.7982436, 0.1980533, -2.042686, 0, 0, 1, 1, 1,
-0.7884071, 1.096825, -1.371402, 1, 0, 0, 1, 1,
-0.7872609, 0.9232077, -1.401781, 1, 0, 0, 1, 1,
-0.7839187, 1.133402, 0.06298115, 1, 0, 0, 1, 1,
-0.7826172, -0.001040018, -0.6420302, 1, 0, 0, 1, 1,
-0.7825565, -0.6604643, -2.303017, 1, 0, 0, 1, 1,
-0.7823811, -0.4700106, -1.395496, 0, 0, 0, 1, 1,
-0.7740008, -0.8173349, -1.565455, 0, 0, 0, 1, 1,
-0.772795, -0.631223, -1.874676, 0, 0, 0, 1, 1,
-0.7707105, 0.643787, -1.893978, 0, 0, 0, 1, 1,
-0.7673756, -0.3316218, -2.6852, 0, 0, 0, 1, 1,
-0.7643301, 0.9754729, -0.2852719, 0, 0, 0, 1, 1,
-0.7638618, -0.1406122, -1.088745, 0, 0, 0, 1, 1,
-0.7588866, -0.3490318, -1.976055, 1, 1, 1, 1, 1,
-0.7567222, 0.9401149, -0.9055536, 1, 1, 1, 1, 1,
-0.7558534, 0.6425051, -0.4087591, 1, 1, 1, 1, 1,
-0.7557117, 1.073875, -0.4376003, 1, 1, 1, 1, 1,
-0.7538809, 1.221192, -0.8179291, 1, 1, 1, 1, 1,
-0.7537756, -0.2128267, -1.073158, 1, 1, 1, 1, 1,
-0.7524394, -1.3836, -3.412623, 1, 1, 1, 1, 1,
-0.7443532, 1.929929, -0.3943563, 1, 1, 1, 1, 1,
-0.7423643, 1.638502, 1.458827, 1, 1, 1, 1, 1,
-0.7380949, 1.434674, -1.228406, 1, 1, 1, 1, 1,
-0.7335886, -0.5116856, -1.58443, 1, 1, 1, 1, 1,
-0.730993, 1.032892, -2.309489, 1, 1, 1, 1, 1,
-0.7306324, -1.347514, -5.206918, 1, 1, 1, 1, 1,
-0.7293932, -0.4008923, 0.3420966, 1, 1, 1, 1, 1,
-0.7275522, 0.02380133, 0.1300473, 1, 1, 1, 1, 1,
-0.7230844, -1.179888, -3.193213, 0, 0, 1, 1, 1,
-0.7206094, -0.05300268, -4.220477, 1, 0, 0, 1, 1,
-0.7193056, -0.8846353, -1.156974, 1, 0, 0, 1, 1,
-0.7185535, 0.3200364, -0.3367508, 1, 0, 0, 1, 1,
-0.7148293, -0.1497644, -1.610996, 1, 0, 0, 1, 1,
-0.7141153, -0.2108832, -1.958187, 1, 0, 0, 1, 1,
-0.7136379, -2.219672, -1.683919, 0, 0, 0, 1, 1,
-0.7128872, -0.09641644, -0.6231058, 0, 0, 0, 1, 1,
-0.7110602, -0.1084383, -3.042906, 0, 0, 0, 1, 1,
-0.7036484, -1.870254, -2.849972, 0, 0, 0, 1, 1,
-0.6975372, 1.036946, -0.1663593, 0, 0, 0, 1, 1,
-0.6962215, -1.017037, -2.675259, 0, 0, 0, 1, 1,
-0.6798208, -0.3760936, -1.982546, 0, 0, 0, 1, 1,
-0.6754357, -0.5669848, -0.2468615, 1, 1, 1, 1, 1,
-0.6696019, -0.9794245, -1.657399, 1, 1, 1, 1, 1,
-0.6685823, -0.6757897, -0.8881623, 1, 1, 1, 1, 1,
-0.6682028, -0.5617698, -3.249164, 1, 1, 1, 1, 1,
-0.6647495, 0.8190587, -0.07206184, 1, 1, 1, 1, 1,
-0.6555797, 1.041673, -0.9708794, 1, 1, 1, 1, 1,
-0.6543018, 0.900277, 0.2813245, 1, 1, 1, 1, 1,
-0.6537732, 0.1937208, -1.825736, 1, 1, 1, 1, 1,
-0.6482669, 0.7912325, 0.4744722, 1, 1, 1, 1, 1,
-0.648225, 0.4769966, -0.5155254, 1, 1, 1, 1, 1,
-0.6424888, -1.220982, -3.120587, 1, 1, 1, 1, 1,
-0.6406501, -0.9182798, -1.285626, 1, 1, 1, 1, 1,
-0.6364973, -2.487897, -2.998398, 1, 1, 1, 1, 1,
-0.6313006, -0.3952459, -1.19724, 1, 1, 1, 1, 1,
-0.6281704, 0.2078844, -1.939083, 1, 1, 1, 1, 1,
-0.6219131, -1.786724, -1.294083, 0, 0, 1, 1, 1,
-0.6198574, -1.944672, -2.974261, 1, 0, 0, 1, 1,
-0.6171625, -1.115609, -1.106209, 1, 0, 0, 1, 1,
-0.6161455, 0.4138735, -2.854389, 1, 0, 0, 1, 1,
-0.615506, -2.212139, -3.743573, 1, 0, 0, 1, 1,
-0.6153672, 0.3707371, 0.3043136, 1, 0, 0, 1, 1,
-0.6114125, -1.106697, -3.727029, 0, 0, 0, 1, 1,
-0.6097789, 1.700371, -2.048973, 0, 0, 0, 1, 1,
-0.6095766, -1.123404, -3.190603, 0, 0, 0, 1, 1,
-0.6074607, 0.9353728, -0.3274479, 0, 0, 0, 1, 1,
-0.6071425, 0.6170731, -0.1677868, 0, 0, 0, 1, 1,
-0.6008179, 1.036956, -1.140113, 0, 0, 0, 1, 1,
-0.6004164, 0.6216475, -1.849146, 0, 0, 0, 1, 1,
-0.6002188, -0.4366432, -0.1216293, 1, 1, 1, 1, 1,
-0.5810465, 0.7388841, -0.1657391, 1, 1, 1, 1, 1,
-0.5738934, 1.714661, 1.276747, 1, 1, 1, 1, 1,
-0.5692102, -1.23441, -1.466409, 1, 1, 1, 1, 1,
-0.5672028, 1.083653, -1.682307, 1, 1, 1, 1, 1,
-0.5650728, 0.7708316, -0.5101382, 1, 1, 1, 1, 1,
-0.5595875, -1.323355, -4.10919, 1, 1, 1, 1, 1,
-0.5504913, 1.115156, -0.4372486, 1, 1, 1, 1, 1,
-0.5484574, 1.258746, -2.67357, 1, 1, 1, 1, 1,
-0.547579, -0.1597236, -2.304819, 1, 1, 1, 1, 1,
-0.5460518, -0.4015869, -1.970647, 1, 1, 1, 1, 1,
-0.5452523, -0.8296576, -2.524667, 1, 1, 1, 1, 1,
-0.5448505, -0.7540414, -2.785201, 1, 1, 1, 1, 1,
-0.5418224, -2.259379, -3.01771, 1, 1, 1, 1, 1,
-0.5404279, 0.131798, -0.4484223, 1, 1, 1, 1, 1,
-0.5393432, -1.861245, -1.564056, 0, 0, 1, 1, 1,
-0.5387268, -0.0494035, -1.458848, 1, 0, 0, 1, 1,
-0.5318313, 0.198465, 0.188382, 1, 0, 0, 1, 1,
-0.5280365, -0.8069158, -1.673722, 1, 0, 0, 1, 1,
-0.5271555, 2.134433, 0.1184682, 1, 0, 0, 1, 1,
-0.5156659, -0.8289831, -4.040635, 1, 0, 0, 1, 1,
-0.5136591, -0.219868, -2.854029, 0, 0, 0, 1, 1,
-0.5073113, 0.8609397, -0.9984637, 0, 0, 0, 1, 1,
-0.5039666, 1.055984, -1.308197, 0, 0, 0, 1, 1,
-0.5035282, -0.2042911, -1.400398, 0, 0, 0, 1, 1,
-0.5011703, 1.636833, 2.51722, 0, 0, 0, 1, 1,
-0.498538, -1.422128, -3.835668, 0, 0, 0, 1, 1,
-0.4972101, 0.5688085, -1.275348, 0, 0, 0, 1, 1,
-0.4957544, 0.1497491, -2.59592, 1, 1, 1, 1, 1,
-0.4956808, 0.9059489, -0.3773517, 1, 1, 1, 1, 1,
-0.493935, 0.3672272, -0.6830255, 1, 1, 1, 1, 1,
-0.4821468, 0.432321, -0.5786092, 1, 1, 1, 1, 1,
-0.477609, 1.184676, 2.146088, 1, 1, 1, 1, 1,
-0.4762033, -0.4010669, -0.6651415, 1, 1, 1, 1, 1,
-0.4735469, -0.6199262, -2.944139, 1, 1, 1, 1, 1,
-0.472208, 0.3224317, -1.999148, 1, 1, 1, 1, 1,
-0.4688948, 0.8146739, -0.7223338, 1, 1, 1, 1, 1,
-0.4675102, 0.4876602, -1.225865, 1, 1, 1, 1, 1,
-0.4652681, 2.618562, 1.856056, 1, 1, 1, 1, 1,
-0.4605934, -1.282111, -3.414952, 1, 1, 1, 1, 1,
-0.4579473, -0.3194603, -1.190401, 1, 1, 1, 1, 1,
-0.4478821, 0.01469972, -2.556166, 1, 1, 1, 1, 1,
-0.4455655, -0.8586877, -3.950333, 1, 1, 1, 1, 1,
-0.4446744, 1.305535, -2.930399, 0, 0, 1, 1, 1,
-0.4391961, 1.318547, 0.8821613, 1, 0, 0, 1, 1,
-0.4376386, 0.5333719, 0.6144608, 1, 0, 0, 1, 1,
-0.4309247, -0.7845916, -3.3978, 1, 0, 0, 1, 1,
-0.4295845, -1.375045, -2.429809, 1, 0, 0, 1, 1,
-0.4289016, 0.9010559, -0.1192705, 1, 0, 0, 1, 1,
-0.4284346, -0.3745518, -1.656859, 0, 0, 0, 1, 1,
-0.4280399, -0.3720101, -1.735844, 0, 0, 0, 1, 1,
-0.4276935, 0.08685593, -3.594063, 0, 0, 0, 1, 1,
-0.4170785, 0.9836591, -1.291917, 0, 0, 0, 1, 1,
-0.4135678, -0.6923969, -3.624076, 0, 0, 0, 1, 1,
-0.4094932, 1.128138, 0.3040653, 0, 0, 0, 1, 1,
-0.4059139, 1.45449, 1.701786, 0, 0, 0, 1, 1,
-0.4045959, 0.1161791, -2.352741, 1, 1, 1, 1, 1,
-0.4023326, -0.9009129, -1.28505, 1, 1, 1, 1, 1,
-0.4012933, -0.5119698, -2.957278, 1, 1, 1, 1, 1,
-0.3999073, -0.08083817, -2.963309, 1, 1, 1, 1, 1,
-0.398726, 0.8554276, 1.073951, 1, 1, 1, 1, 1,
-0.3949869, 1.863824, -0.5228214, 1, 1, 1, 1, 1,
-0.393926, -1.555598, -4.247293, 1, 1, 1, 1, 1,
-0.3927371, -0.9505521, -2.494458, 1, 1, 1, 1, 1,
-0.383458, -0.1071931, -0.5812042, 1, 1, 1, 1, 1,
-0.3778068, 0.1346331, -1.156544, 1, 1, 1, 1, 1,
-0.375132, 0.7511316, -0.3394091, 1, 1, 1, 1, 1,
-0.374471, -0.5593901, -1.90619, 1, 1, 1, 1, 1,
-0.3715182, -0.6808217, -2.866174, 1, 1, 1, 1, 1,
-0.3703554, -0.1543598, -2.236542, 1, 1, 1, 1, 1,
-0.368464, 0.9103222, 0.2307322, 1, 1, 1, 1, 1,
-0.3652885, 1.331974, -1.742327, 0, 0, 1, 1, 1,
-0.3642555, -0.1119959, -2.254739, 1, 0, 0, 1, 1,
-0.3598846, -1.093361, -3.038783, 1, 0, 0, 1, 1,
-0.3476373, -2.189227, -3.636184, 1, 0, 0, 1, 1,
-0.3468346, -1.425328, -3.22503, 1, 0, 0, 1, 1,
-0.3454776, 0.01754129, -1.932346, 1, 0, 0, 1, 1,
-0.3452704, 0.6105838, -0.6465332, 0, 0, 0, 1, 1,
-0.3403953, 0.5954366, 0.08017716, 0, 0, 0, 1, 1,
-0.3353817, 0.688663, -0.291256, 0, 0, 0, 1, 1,
-0.3344823, -0.288432, -3.369367, 0, 0, 0, 1, 1,
-0.3324855, -0.01672111, -2.448186, 0, 0, 0, 1, 1,
-0.3277106, 0.1860074, -1.874826, 0, 0, 0, 1, 1,
-0.3273856, -0.8073817, -2.660717, 0, 0, 0, 1, 1,
-0.3262357, -0.2970991, -4.045132, 1, 1, 1, 1, 1,
-0.3247793, -0.3900234, 0.7525179, 1, 1, 1, 1, 1,
-0.3239134, -1.109073, -0.6856034, 1, 1, 1, 1, 1,
-0.321904, 1.96393, -0.3305512, 1, 1, 1, 1, 1,
-0.3184833, -0.6455818, -2.402934, 1, 1, 1, 1, 1,
-0.3138863, -0.4242579, -3.986145, 1, 1, 1, 1, 1,
-0.3097146, -0.09981544, -2.732287, 1, 1, 1, 1, 1,
-0.3070444, -1.10408, -1.472921, 1, 1, 1, 1, 1,
-0.3055913, -0.1856912, -3.484926, 1, 1, 1, 1, 1,
-0.3052266, 0.6014125, -1.22149, 1, 1, 1, 1, 1,
-0.3038822, -0.8959692, -3.556374, 1, 1, 1, 1, 1,
-0.3023799, 0.05259751, -2.336977, 1, 1, 1, 1, 1,
-0.3023511, -1.58977, -3.271494, 1, 1, 1, 1, 1,
-0.2922446, -0.6850501, -2.231683, 1, 1, 1, 1, 1,
-0.2843877, -0.493661, -3.954418, 1, 1, 1, 1, 1,
-0.2811086, -0.226695, -1.747577, 0, 0, 1, 1, 1,
-0.2781689, -1.229688, -1.565417, 1, 0, 0, 1, 1,
-0.2780104, -0.3137527, -1.426549, 1, 0, 0, 1, 1,
-0.2740162, -0.8537167, -3.241962, 1, 0, 0, 1, 1,
-0.2738849, 0.5020616, -1.039352, 1, 0, 0, 1, 1,
-0.2707951, -0.8015751, -2.561304, 1, 0, 0, 1, 1,
-0.2680262, 0.8883064, 0.8861203, 0, 0, 0, 1, 1,
-0.2668639, -1.231732, -4.057019, 0, 0, 0, 1, 1,
-0.2648987, -0.2320823, -2.152008, 0, 0, 0, 1, 1,
-0.2620504, -0.3193259, -1.670479, 0, 0, 0, 1, 1,
-0.2607475, 0.8761963, 0.6663122, 0, 0, 0, 1, 1,
-0.2599729, 0.1793521, -2.415094, 0, 0, 0, 1, 1,
-0.2584675, -0.662145, -3.592881, 0, 0, 0, 1, 1,
-0.2568599, 1.259822, -0.1699182, 1, 1, 1, 1, 1,
-0.2517652, -0.5981187, -4.712277, 1, 1, 1, 1, 1,
-0.251462, -1.465313, -2.819373, 1, 1, 1, 1, 1,
-0.2511376, -0.04439892, -2.593825, 1, 1, 1, 1, 1,
-0.2496334, 0.3038624, 0.1979262, 1, 1, 1, 1, 1,
-0.2461252, -0.7325084, -2.330839, 1, 1, 1, 1, 1,
-0.2431553, 1.181799, 0.006363808, 1, 1, 1, 1, 1,
-0.2427178, -1.110979, -3.198895, 1, 1, 1, 1, 1,
-0.2393251, -1.072314, -3.936808, 1, 1, 1, 1, 1,
-0.2356622, 0.06433792, -0.9136507, 1, 1, 1, 1, 1,
-0.2354615, -0.3828748, -2.84177, 1, 1, 1, 1, 1,
-0.2314201, 0.09316575, -1.710158, 1, 1, 1, 1, 1,
-0.2271935, 0.3472485, -0.4499891, 1, 1, 1, 1, 1,
-0.2264657, 0.3057158, -1.159031, 1, 1, 1, 1, 1,
-0.2258768, -0.8426571, -2.9935, 1, 1, 1, 1, 1,
-0.2238547, 1.33861, -0.03208497, 0, 0, 1, 1, 1,
-0.2229782, -1.91503, -2.209929, 1, 0, 0, 1, 1,
-0.2201188, 0.9454558, 0.3666756, 1, 0, 0, 1, 1,
-0.2200592, -1.339541, -3.919736, 1, 0, 0, 1, 1,
-0.2185533, -1.737633, -1.875879, 1, 0, 0, 1, 1,
-0.2169158, 1.569798, -0.7732235, 1, 0, 0, 1, 1,
-0.2123353, 1.118719, 0.453354, 0, 0, 0, 1, 1,
-0.2117389, -1.742255, -3.10203, 0, 0, 0, 1, 1,
-0.211541, -0.908429, -2.732085, 0, 0, 0, 1, 1,
-0.2083294, -1.057805, -3.881099, 0, 0, 0, 1, 1,
-0.2048373, 2.858645, -1.405141, 0, 0, 0, 1, 1,
-0.2030365, 1.986953, 0.4892823, 0, 0, 0, 1, 1,
-0.1972956, 0.9214032, 0.8731185, 0, 0, 0, 1, 1,
-0.1968169, 1.972464, 1.52205, 1, 1, 1, 1, 1,
-0.1959983, -0.5228353, -4.10532, 1, 1, 1, 1, 1,
-0.1958928, 1.3078, 0.9616602, 1, 1, 1, 1, 1,
-0.1896129, -0.7797382, -1.097106, 1, 1, 1, 1, 1,
-0.1889658, 0.563562, 1.208784, 1, 1, 1, 1, 1,
-0.1878613, -1.826867, -1.781316, 1, 1, 1, 1, 1,
-0.1845875, 0.0006438288, -2.65731, 1, 1, 1, 1, 1,
-0.1806122, -1.252829, -2.909761, 1, 1, 1, 1, 1,
-0.1804371, -0.7566629, -3.466544, 1, 1, 1, 1, 1,
-0.1801762, 0.5116718, -0.6651608, 1, 1, 1, 1, 1,
-0.1791622, -0.2251477, -1.17825, 1, 1, 1, 1, 1,
-0.17811, 0.1310318, -1.753198, 1, 1, 1, 1, 1,
-0.1775798, 0.4811586, 0.03258441, 1, 1, 1, 1, 1,
-0.1765522, -0.6450698, -2.383607, 1, 1, 1, 1, 1,
-0.1722851, 0.5553749, 2.28984, 1, 1, 1, 1, 1,
-0.1683632, -0.1055068, -2.054843, 0, 0, 1, 1, 1,
-0.1680374, 0.5458984, -0.844337, 1, 0, 0, 1, 1,
-0.1645768, -0.9794298, -3.740815, 1, 0, 0, 1, 1,
-0.1590891, -0.163502, -4.310944, 1, 0, 0, 1, 1,
-0.1590129, -0.3301399, -1.763901, 1, 0, 0, 1, 1,
-0.1564046, 0.8748649, -0.6291283, 1, 0, 0, 1, 1,
-0.1544496, 0.6528956, -2.570427, 0, 0, 0, 1, 1,
-0.1532676, 0.7150553, 0.7437907, 0, 0, 0, 1, 1,
-0.1515944, -0.448172, -0.9778953, 0, 0, 0, 1, 1,
-0.1502948, -0.02916473, -0.3939595, 0, 0, 0, 1, 1,
-0.1492093, -0.345938, -3.153636, 0, 0, 0, 1, 1,
-0.1398697, 1.272046, 0.482376, 0, 0, 0, 1, 1,
-0.1382954, 0.4073822, 0.3477781, 0, 0, 0, 1, 1,
-0.137726, -0.2655916, -2.827635, 1, 1, 1, 1, 1,
-0.1372461, -0.1732007, -3.418871, 1, 1, 1, 1, 1,
-0.1351727, -0.3329144, -1.726612, 1, 1, 1, 1, 1,
-0.133948, 1.34416, -0.1711952, 1, 1, 1, 1, 1,
-0.1328618, 0.8143374, -0.3103426, 1, 1, 1, 1, 1,
-0.1283258, -0.7524596, -3.213789, 1, 1, 1, 1, 1,
-0.1273928, -0.7334512, -3.919634, 1, 1, 1, 1, 1,
-0.1217896, 0.2990488, -1.644951, 1, 1, 1, 1, 1,
-0.1214681, 0.8044835, -2.066908, 1, 1, 1, 1, 1,
-0.1210056, 1.029882, -0.4710819, 1, 1, 1, 1, 1,
-0.1191339, -1.462465, -4.236939, 1, 1, 1, 1, 1,
-0.1179241, 1.035279, 0.5065419, 1, 1, 1, 1, 1,
-0.1140053, -1.373158, -4.004516, 1, 1, 1, 1, 1,
-0.1139892, -0.204701, -3.627245, 1, 1, 1, 1, 1,
-0.110542, -0.3573228, -2.373418, 1, 1, 1, 1, 1,
-0.1090956, -0.4800963, -3.959114, 0, 0, 1, 1, 1,
-0.1080848, -1.129161, -3.791848, 1, 0, 0, 1, 1,
-0.1071644, 1.010404, -0.4651694, 1, 0, 0, 1, 1,
-0.1021017, -1.545009, -3.597709, 1, 0, 0, 1, 1,
-0.1002755, 1.001952, -0.6749184, 1, 0, 0, 1, 1,
-0.1000178, -0.325827, -2.652356, 1, 0, 0, 1, 1,
-0.09861466, 0.8215842, -0.04647387, 0, 0, 0, 1, 1,
-0.09620938, 0.7747347, 0.6466258, 0, 0, 0, 1, 1,
-0.08524967, 2.090237, -1.048595, 0, 0, 0, 1, 1,
-0.08311862, -0.5005646, -3.344444, 0, 0, 0, 1, 1,
-0.07652399, 0.4506215, -0.7547377, 0, 0, 0, 1, 1,
-0.07461894, 0.179432, -0.3015095, 0, 0, 0, 1, 1,
-0.07104718, -0.221501, -4.012524, 0, 0, 0, 1, 1,
-0.07050606, 0.1605371, -1.047203, 1, 1, 1, 1, 1,
-0.07015044, -1.635343, -4.587478, 1, 1, 1, 1, 1,
-0.06979839, 0.8283497, -0.3709854, 1, 1, 1, 1, 1,
-0.06714983, 0.8811078, -1.095269, 1, 1, 1, 1, 1,
-0.06358472, 0.4425762, 0.7297563, 1, 1, 1, 1, 1,
-0.06259309, 0.2176127, 0.6773066, 1, 1, 1, 1, 1,
-0.06123934, -0.4551789, -1.393691, 1, 1, 1, 1, 1,
-0.0597772, -0.1380406, -0.767075, 1, 1, 1, 1, 1,
-0.05869605, -1.629262, -2.035777, 1, 1, 1, 1, 1,
-0.05622612, -0.1112088, -2.978678, 1, 1, 1, 1, 1,
-0.05565468, -0.3990709, -4.789234, 1, 1, 1, 1, 1,
-0.05252981, 0.2628929, 0.7658975, 1, 1, 1, 1, 1,
-0.05248746, -0.6427549, -2.787908, 1, 1, 1, 1, 1,
-0.0516433, -1.052847, -3.368743, 1, 1, 1, 1, 1,
-0.05077909, 0.9474378, 0.2552622, 1, 1, 1, 1, 1,
-0.04844749, -0.7053173, -3.367954, 0, 0, 1, 1, 1,
-0.04794566, 1.182666, -2.262923, 1, 0, 0, 1, 1,
-0.0397579, -0.3251384, -1.19931, 1, 0, 0, 1, 1,
-0.03231289, -0.1753556, -3.842411, 1, 0, 0, 1, 1,
-0.02709757, 1.187793, -0.4981277, 1, 0, 0, 1, 1,
-0.02042804, -1.476585, -3.518535, 1, 0, 0, 1, 1,
-0.02020674, 0.02433521, -1.265653, 0, 0, 0, 1, 1,
-0.01796312, -0.3734637, -2.615024, 0, 0, 0, 1, 1,
-0.01765831, -0.5428897, -1.353706, 0, 0, 0, 1, 1,
-0.01700051, 1.019502, 0.04539615, 0, 0, 0, 1, 1,
-0.01678453, -0.01476285, -1.589399, 0, 0, 0, 1, 1,
-0.01505898, -0.4712492, -3.435144, 0, 0, 0, 1, 1,
-0.01459213, 1.283343, 0.4121085, 0, 0, 0, 1, 1,
-0.01334783, -1.081139, -4.282287, 1, 1, 1, 1, 1,
-0.01214797, 0.449245, 1.447945, 1, 1, 1, 1, 1,
-0.01015935, 0.3954189, -1.054807, 1, 1, 1, 1, 1,
-0.006706255, -0.2794073, -2.965979, 1, 1, 1, 1, 1,
0.001773892, -0.3992142, 3.137565, 1, 1, 1, 1, 1,
0.005564792, -0.2931915, 2.164191, 1, 1, 1, 1, 1,
0.01078733, -1.531928, 3.646802, 1, 1, 1, 1, 1,
0.01164905, -1.047768, 2.012488, 1, 1, 1, 1, 1,
0.01168028, 0.726765, -0.5907093, 1, 1, 1, 1, 1,
0.01828056, 0.2916228, 0.3081987, 1, 1, 1, 1, 1,
0.01898178, -1.553776, 4.038878, 1, 1, 1, 1, 1,
0.02027473, -0.3851811, 4.26423, 1, 1, 1, 1, 1,
0.02215771, -0.01677044, 2.598635, 1, 1, 1, 1, 1,
0.02414335, 0.1958342, 1.976985, 1, 1, 1, 1, 1,
0.02415916, 0.7492654, 0.3653098, 1, 1, 1, 1, 1,
0.02878828, -1.701875, 6.105196, 0, 0, 1, 1, 1,
0.02973764, -0.1882725, 3.190956, 1, 0, 0, 1, 1,
0.03115719, 1.774122, 0.0692351, 1, 0, 0, 1, 1,
0.03236806, 0.6912863, -0.4166603, 1, 0, 0, 1, 1,
0.03276097, 0.1468266, 1.357247, 1, 0, 0, 1, 1,
0.03390183, 0.2282461, -0.8579234, 1, 0, 0, 1, 1,
0.03556214, -0.750124, 3.058474, 0, 0, 0, 1, 1,
0.03782764, 0.3304765, -0.07257438, 0, 0, 0, 1, 1,
0.0416251, 0.5056857, -1.413392, 0, 0, 0, 1, 1,
0.04467908, -0.6515321, 3.403671, 0, 0, 0, 1, 1,
0.04586375, -0.8967881, 4.095419, 0, 0, 0, 1, 1,
0.04812703, -0.8947523, 4.491857, 0, 0, 0, 1, 1,
0.04834253, -0.6279764, 1.327714, 0, 0, 0, 1, 1,
0.04850467, -0.8721298, 1.994756, 1, 1, 1, 1, 1,
0.05024493, 0.09462139, -1.434216, 1, 1, 1, 1, 1,
0.05043316, -1.495717, 2.631541, 1, 1, 1, 1, 1,
0.05079683, 0.4028584, 0.202975, 1, 1, 1, 1, 1,
0.05120876, 0.1265636, -0.02987119, 1, 1, 1, 1, 1,
0.05169449, 0.1739211, 0.4423541, 1, 1, 1, 1, 1,
0.05566329, -1.039729, 3.000741, 1, 1, 1, 1, 1,
0.05709637, -0.1707109, 3.492453, 1, 1, 1, 1, 1,
0.06664517, 1.643814, -0.3045088, 1, 1, 1, 1, 1,
0.06938659, 0.7808901, 1.546904, 1, 1, 1, 1, 1,
0.07093396, -2.317295, 3.649706, 1, 1, 1, 1, 1,
0.07288433, -0.1841726, 3.23569, 1, 1, 1, 1, 1,
0.07544824, -1.17176, 3.199314, 1, 1, 1, 1, 1,
0.07655479, -0.7203181, 0.8974223, 1, 1, 1, 1, 1,
0.07729884, -1.674438, 1.527406, 1, 1, 1, 1, 1,
0.07757063, 0.7629894, 2.040168, 0, 0, 1, 1, 1,
0.07838941, -0.1366138, 3.391235, 1, 0, 0, 1, 1,
0.08034087, 0.01600327, -1.78718, 1, 0, 0, 1, 1,
0.08314223, -1.444251, 3.357567, 1, 0, 0, 1, 1,
0.08378792, -2.09152, 2.684365, 1, 0, 0, 1, 1,
0.08465413, 2.414114, -0.3759121, 1, 0, 0, 1, 1,
0.08907509, 1.88416, -1.249843, 0, 0, 0, 1, 1,
0.09243407, -0.6241171, 2.676638, 0, 0, 0, 1, 1,
0.1004028, -0.9639776, 3.781138, 0, 0, 0, 1, 1,
0.1012567, -0.6745166, 1.992501, 0, 0, 0, 1, 1,
0.1037983, 0.5005127, 1.148683, 0, 0, 0, 1, 1,
0.1046742, 0.346713, -0.08262166, 0, 0, 0, 1, 1,
0.1119122, 0.07658429, 1.28343, 0, 0, 0, 1, 1,
0.1119148, 0.4787976, -0.4413731, 1, 1, 1, 1, 1,
0.1142993, -0.09058224, 1.228051, 1, 1, 1, 1, 1,
0.1175456, 0.7527772, -1.483043, 1, 1, 1, 1, 1,
0.1226155, 0.8052492, -1.73783, 1, 1, 1, 1, 1,
0.1286571, 0.5990692, 1.11508, 1, 1, 1, 1, 1,
0.1326406, 1.440099, 0.2757126, 1, 1, 1, 1, 1,
0.1337479, -2.326639, 2.292243, 1, 1, 1, 1, 1,
0.1337513, 1.157936, -0.3820055, 1, 1, 1, 1, 1,
0.138238, -1.552238, 3.615657, 1, 1, 1, 1, 1,
0.1395586, -0.7295902, 4.010204, 1, 1, 1, 1, 1,
0.1410074, 0.6323628, 0.451255, 1, 1, 1, 1, 1,
0.1423454, -1.82663, 3.503474, 1, 1, 1, 1, 1,
0.1427597, -0.6451555, 2.220606, 1, 1, 1, 1, 1,
0.1431973, -0.2669061, 4.191899, 1, 1, 1, 1, 1,
0.148176, 0.08527328, -0.1668957, 1, 1, 1, 1, 1,
0.1505407, -0.9023114, 3.062483, 0, 0, 1, 1, 1,
0.1525362, -0.6468804, 2.011914, 1, 0, 0, 1, 1,
0.154265, 0.0004875718, 2.992038, 1, 0, 0, 1, 1,
0.1546569, 0.7552853, 0.5586197, 1, 0, 0, 1, 1,
0.1582016, 0.8309476, 1.012722, 1, 0, 0, 1, 1,
0.1582168, -0.2342376, 3.087039, 1, 0, 0, 1, 1,
0.1594887, -0.7464214, 3.600633, 0, 0, 0, 1, 1,
0.1595564, -0.1651059, 3.148419, 0, 0, 0, 1, 1,
0.1617835, 2.848016, -0.8898071, 0, 0, 0, 1, 1,
0.1654057, -0.07400722, 2.2426, 0, 0, 0, 1, 1,
0.1655997, -0.2460473, 2.917618, 0, 0, 0, 1, 1,
0.171025, -0.4803589, 3.025144, 0, 0, 0, 1, 1,
0.1741391, -0.2384346, 1.009464, 0, 0, 0, 1, 1,
0.1765156, 0.07891627, 1.158377, 1, 1, 1, 1, 1,
0.1801432, -0.7127557, 2.918759, 1, 1, 1, 1, 1,
0.1818907, 1.025612, -0.04604238, 1, 1, 1, 1, 1,
0.1825769, -0.6362798, 3.790004, 1, 1, 1, 1, 1,
0.1906544, -0.01958898, 2.311699, 1, 1, 1, 1, 1,
0.1912239, 0.3714108, 1.370626, 1, 1, 1, 1, 1,
0.1988129, 0.7696863, 0.8075153, 1, 1, 1, 1, 1,
0.2011117, 0.2283178, 0.2474176, 1, 1, 1, 1, 1,
0.2041611, -2.454238, 3.007304, 1, 1, 1, 1, 1,
0.2059023, -0.9417964, 2.5022, 1, 1, 1, 1, 1,
0.2114142, -1.099247, 5.125193, 1, 1, 1, 1, 1,
0.2115133, 0.8250878, 0.2564726, 1, 1, 1, 1, 1,
0.2226719, 1.642513, 0.4724913, 1, 1, 1, 1, 1,
0.2229396, 1.189457, 0.3794414, 1, 1, 1, 1, 1,
0.2316263, -1.181986, 5.070682, 1, 1, 1, 1, 1,
0.2325124, -1.350379, 2.306566, 0, 0, 1, 1, 1,
0.2325472, -0.1354661, 2.938078, 1, 0, 0, 1, 1,
0.2373137, -0.1410214, 0.8537913, 1, 0, 0, 1, 1,
0.2385216, 0.3518817, 0.5882291, 1, 0, 0, 1, 1,
0.2396806, -0.5953625, 3.164269, 1, 0, 0, 1, 1,
0.2478143, -1.784806, 3.435111, 1, 0, 0, 1, 1,
0.2540745, 0.5647227, 0.4291589, 0, 0, 0, 1, 1,
0.2557296, -0.0117321, 1.193732, 0, 0, 0, 1, 1,
0.2580165, 0.9686824, 1.917328, 0, 0, 0, 1, 1,
0.2581158, 1.630349, -0.9451848, 0, 0, 0, 1, 1,
0.2621519, -0.8918162, 3.416376, 0, 0, 0, 1, 1,
0.2640451, 0.4865027, 0.4640917, 0, 0, 0, 1, 1,
0.2645548, 0.3339446, 2.108106, 0, 0, 0, 1, 1,
0.2703196, -1.317037, 3.257243, 1, 1, 1, 1, 1,
0.2714373, -0.3501642, 2.827927, 1, 1, 1, 1, 1,
0.2718135, -0.8308322, 3.346887, 1, 1, 1, 1, 1,
0.2724953, -1.600427, 2.8835, 1, 1, 1, 1, 1,
0.2730671, 1.455673, 1.085859, 1, 1, 1, 1, 1,
0.2736162, -0.6034937, 3.735859, 1, 1, 1, 1, 1,
0.276551, 0.5840302, 0.04395886, 1, 1, 1, 1, 1,
0.2836011, 0.3223416, 1.112628, 1, 1, 1, 1, 1,
0.2837417, -0.4485607, 4.041462, 1, 1, 1, 1, 1,
0.2858111, 0.1634645, -1.391427, 1, 1, 1, 1, 1,
0.2921804, 0.4798396, 1.884644, 1, 1, 1, 1, 1,
0.2923117, -0.2153099, 1.512008, 1, 1, 1, 1, 1,
0.2929147, -0.9187732, 1.632555, 1, 1, 1, 1, 1,
0.2957686, 0.5807918, 0.898922, 1, 1, 1, 1, 1,
0.29669, 0.7539452, 0.3644372, 1, 1, 1, 1, 1,
0.3022593, -1.583068, 2.593575, 0, 0, 1, 1, 1,
0.3023033, 0.05814225, 0.06566899, 1, 0, 0, 1, 1,
0.3077892, -0.4552412, 2.199621, 1, 0, 0, 1, 1,
0.3094731, -0.4663063, -0.4227278, 1, 0, 0, 1, 1,
0.3102913, 0.8707064, 0.7700189, 1, 0, 0, 1, 1,
0.3258833, 0.4615476, -0.6647675, 1, 0, 0, 1, 1,
0.3287582, -0.2601092, 3.193634, 0, 0, 0, 1, 1,
0.3296696, -1.392836, 0.3417455, 0, 0, 0, 1, 1,
0.3324902, 0.9899191, -0.4183955, 0, 0, 0, 1, 1,
0.3369178, -1.09016, 5.441561, 0, 0, 0, 1, 1,
0.3431532, 1.47205, 0.02618083, 0, 0, 0, 1, 1,
0.3437721, 1.300251, -1.714705, 0, 0, 0, 1, 1,
0.3477998, 2.407909, 0.1338371, 0, 0, 0, 1, 1,
0.3486188, 0.7099245, -0.3599546, 1, 1, 1, 1, 1,
0.3555772, 0.4926013, -0.8550102, 1, 1, 1, 1, 1,
0.357924, -0.8626552, 2.767792, 1, 1, 1, 1, 1,
0.3591637, -1.742149, 2.623457, 1, 1, 1, 1, 1,
0.3600491, 1.046167, 0.787549, 1, 1, 1, 1, 1,
0.3625024, -0.3996884, 2.302649, 1, 1, 1, 1, 1,
0.3659998, -0.4265463, 2.515642, 1, 1, 1, 1, 1,
0.3716257, -1.583691, 3.141297, 1, 1, 1, 1, 1,
0.3745674, 1.119055, 0.489095, 1, 1, 1, 1, 1,
0.3756238, 1.490325, 0.1112169, 1, 1, 1, 1, 1,
0.3822173, 0.2052519, 0.49087, 1, 1, 1, 1, 1,
0.3822232, -0.9054443, 1.95705, 1, 1, 1, 1, 1,
0.3830366, -0.7545565, 1.13496, 1, 1, 1, 1, 1,
0.3840695, 0.2882922, 1.984102, 1, 1, 1, 1, 1,
0.3890655, -1.505272, 3.012659, 1, 1, 1, 1, 1,
0.3915769, -0.1864178, 0.7432967, 0, 0, 1, 1, 1,
0.4001215, 0.4446552, 0.6883014, 1, 0, 0, 1, 1,
0.4023123, -0.5250818, 1.671924, 1, 0, 0, 1, 1,
0.4031961, -0.8301388, 1.973208, 1, 0, 0, 1, 1,
0.4048077, -0.2226509, 3.174059, 1, 0, 0, 1, 1,
0.4076145, -0.3661558, 3.077255, 1, 0, 0, 1, 1,
0.4086775, -1.5973, 2.252065, 0, 0, 0, 1, 1,
0.409961, 0.4925331, -0.1897887, 0, 0, 0, 1, 1,
0.4113764, 0.4158787, -0.7103091, 0, 0, 0, 1, 1,
0.4154858, 0.05839642, 3.18604, 0, 0, 0, 1, 1,
0.417875, -0.6700086, 2.840722, 0, 0, 0, 1, 1,
0.4186641, -2.169554, 2.811635, 0, 0, 0, 1, 1,
0.4255579, -1.35983, 1.012191, 0, 0, 0, 1, 1,
0.4268954, 0.8124865, 1.655516, 1, 1, 1, 1, 1,
0.4288231, 1.147863, -0.1938936, 1, 1, 1, 1, 1,
0.429248, -0.3500512, 2.924136, 1, 1, 1, 1, 1,
0.429875, 0.259463, 1.947337, 1, 1, 1, 1, 1,
0.43076, -0.4466433, 3.127553, 1, 1, 1, 1, 1,
0.4310209, 0.1801835, 0.0771196, 1, 1, 1, 1, 1,
0.4313737, 0.5963428, 1.100244, 1, 1, 1, 1, 1,
0.4335283, 1.170024, -0.6992163, 1, 1, 1, 1, 1,
0.434841, -0.9916322, 2.91969, 1, 1, 1, 1, 1,
0.4431407, 0.3416087, 0.6440275, 1, 1, 1, 1, 1,
0.4455334, -0.207672, 3.574699, 1, 1, 1, 1, 1,
0.4475137, 2.602923, 0.5711392, 1, 1, 1, 1, 1,
0.4493984, -0.07637362, 2.891346, 1, 1, 1, 1, 1,
0.4512248, -0.2153602, 2.735692, 1, 1, 1, 1, 1,
0.4521112, -1.269102, 2.259007, 1, 1, 1, 1, 1,
0.4526291, 0.2477402, 0.7202024, 0, 0, 1, 1, 1,
0.4608442, 0.1197691, 1.571939, 1, 0, 0, 1, 1,
0.4669397, -1.359503, 2.109385, 1, 0, 0, 1, 1,
0.4756818, 0.0819876, 2.693445, 1, 0, 0, 1, 1,
0.4776793, -0.1921619, 1.936154, 1, 0, 0, 1, 1,
0.4779313, -0.8776653, 2.073562, 1, 0, 0, 1, 1,
0.4789498, 0.02169978, 1.496018, 0, 0, 0, 1, 1,
0.4790035, 0.4437585, -0.5183342, 0, 0, 0, 1, 1,
0.4797982, -0.4614703, 3.341025, 0, 0, 0, 1, 1,
0.4847109, -0.5172744, 3.234787, 0, 0, 0, 1, 1,
0.4850359, 1.053656, 1.216444, 0, 0, 0, 1, 1,
0.4881602, -0.8998485, 3.129432, 0, 0, 0, 1, 1,
0.4919597, -1.192751, 3.50955, 0, 0, 0, 1, 1,
0.493973, 0.5094213, 1.397242, 1, 1, 1, 1, 1,
0.49556, 0.7770705, 0.5401484, 1, 1, 1, 1, 1,
0.4971783, 0.2111197, 0.01049571, 1, 1, 1, 1, 1,
0.5047054, -0.9862942, 2.347402, 1, 1, 1, 1, 1,
0.5110946, 0.5423216, -0.03650158, 1, 1, 1, 1, 1,
0.511653, 1.131954, 0.2825919, 1, 1, 1, 1, 1,
0.5158673, -1.755935, 2.561285, 1, 1, 1, 1, 1,
0.5161438, 0.2600823, 0.9767313, 1, 1, 1, 1, 1,
0.519559, 1.566031, 0.6643068, 1, 1, 1, 1, 1,
0.521388, -0.6525158, 3.896947, 1, 1, 1, 1, 1,
0.5257561, 0.9383963, -0.816626, 1, 1, 1, 1, 1,
0.5274377, 1.80671, -0.7193191, 1, 1, 1, 1, 1,
0.5287478, -0.734841, 3.55938, 1, 1, 1, 1, 1,
0.5289227, -2.982083, 3.122065, 1, 1, 1, 1, 1,
0.5309648, 1.795131, 1.167377, 1, 1, 1, 1, 1,
0.5363048, -0.6440405, 3.244516, 0, 0, 1, 1, 1,
0.5383636, -0.5692499, 3.781736, 1, 0, 0, 1, 1,
0.5396505, -0.7583492, 3.797263, 1, 0, 0, 1, 1,
0.5399354, 0.712777, 1.330827, 1, 0, 0, 1, 1,
0.5428151, 1.699827, 0.7507142, 1, 0, 0, 1, 1,
0.5468728, 0.498739, -0.2144926, 1, 0, 0, 1, 1,
0.5469894, 0.3554493, 2.372914, 0, 0, 0, 1, 1,
0.5489179, 1.612384, 0.8870713, 0, 0, 0, 1, 1,
0.5491077, -0.8525215, 0.5647711, 0, 0, 0, 1, 1,
0.5551811, -1.322462, 2.883894, 0, 0, 0, 1, 1,
0.5572562, 0.2014859, 2.923909, 0, 0, 0, 1, 1,
0.5582458, 0.01748175, 1.39117, 0, 0, 0, 1, 1,
0.560879, 0.201103, 0.4868878, 0, 0, 0, 1, 1,
0.5656777, -2.16913, 2.774325, 1, 1, 1, 1, 1,
0.5710547, 1.912964, 2.07515, 1, 1, 1, 1, 1,
0.5727298, 1.080222, 1.357724, 1, 1, 1, 1, 1,
0.5730833, -0.7692196, 1.750623, 1, 1, 1, 1, 1,
0.5790892, -0.4734248, 2.562808, 1, 1, 1, 1, 1,
0.5810792, -1.96425, 2.480131, 1, 1, 1, 1, 1,
0.5821956, -1.058852, 2.229393, 1, 1, 1, 1, 1,
0.5842437, 1.006126, 1.57085, 1, 1, 1, 1, 1,
0.5842557, -0.9909334, 1.662173, 1, 1, 1, 1, 1,
0.5882949, 1.723468, -1.093988, 1, 1, 1, 1, 1,
0.5932985, 0.3802426, 0.9318894, 1, 1, 1, 1, 1,
0.5959893, -1.239778, 3.060347, 1, 1, 1, 1, 1,
0.5977196, 1.675983, -2.013508, 1, 1, 1, 1, 1,
0.601022, -0.4197163, 1.826086, 1, 1, 1, 1, 1,
0.601259, 2.28576, -1.971973, 1, 1, 1, 1, 1,
0.6029555, 0.1191926, 1.711502, 0, 0, 1, 1, 1,
0.6044765, -1.439758, 2.810129, 1, 0, 0, 1, 1,
0.6070766, -1.023702, 3.014406, 1, 0, 0, 1, 1,
0.6119365, 0.1619806, 1.74701, 1, 0, 0, 1, 1,
0.612983, -0.5353903, 3.768788, 1, 0, 0, 1, 1,
0.6135066, -0.1734591, 1.719643, 1, 0, 0, 1, 1,
0.6159648, -0.5992355, 2.924764, 0, 0, 0, 1, 1,
0.6171167, 0.5099331, -0.1890896, 0, 0, 0, 1, 1,
0.6207495, -1.613242, 3.498614, 0, 0, 0, 1, 1,
0.6248032, 0.0779144, 0.08424638, 0, 0, 0, 1, 1,
0.6253898, 0.7100129, 0.688064, 0, 0, 0, 1, 1,
0.630515, 1.007682, -0.0753288, 0, 0, 0, 1, 1,
0.6305619, -0.1604937, 3.292885, 0, 0, 0, 1, 1,
0.6329975, -1.561245, 1.051228, 1, 1, 1, 1, 1,
0.6330911, 0.5854863, 0.982674, 1, 1, 1, 1, 1,
0.634599, -0.3279369, 1.938471, 1, 1, 1, 1, 1,
0.6388651, -0.2434288, 2.058462, 1, 1, 1, 1, 1,
0.6389216, -0.1020587, -1.130642, 1, 1, 1, 1, 1,
0.6416872, -0.7798805, 2.095382, 1, 1, 1, 1, 1,
0.6442229, -2.382134, 2.27018, 1, 1, 1, 1, 1,
0.6457701, 1.905797, 0.1664293, 1, 1, 1, 1, 1,
0.6468071, 0.41113, -0.1123203, 1, 1, 1, 1, 1,
0.6517521, -0.773043, 1.928145, 1, 1, 1, 1, 1,
0.6528713, -1.574206, 4.214301, 1, 1, 1, 1, 1,
0.6538972, 0.3275447, 2.507048, 1, 1, 1, 1, 1,
0.6549038, -0.2301864, 1.800726, 1, 1, 1, 1, 1,
0.6570423, -1.007895, 1.663048, 1, 1, 1, 1, 1,
0.6576163, 2.258784, -0.5630094, 1, 1, 1, 1, 1,
0.658475, -0.4994254, -0.02150708, 0, 0, 1, 1, 1,
0.6598579, -0.5384547, 2.456515, 1, 0, 0, 1, 1,
0.6600988, -0.7914422, 2.35416, 1, 0, 0, 1, 1,
0.6654222, 1.247368, -0.3617976, 1, 0, 0, 1, 1,
0.6664951, 0.6985614, 0.1332784, 1, 0, 0, 1, 1,
0.6711386, 0.9276896, -0.3734834, 1, 0, 0, 1, 1,
0.6735548, 1.164386, 1.613286, 0, 0, 0, 1, 1,
0.6741965, 1.205864, 0.718896, 0, 0, 0, 1, 1,
0.6754419, 0.6351413, 0.01893659, 0, 0, 0, 1, 1,
0.6788368, -1.320699, 0.8690962, 0, 0, 0, 1, 1,
0.6848128, -0.3100399, 1.074978, 0, 0, 0, 1, 1,
0.6880635, -0.4070779, 1.918104, 0, 0, 0, 1, 1,
0.6887386, 0.1700463, 2.232187, 0, 0, 0, 1, 1,
0.6980775, -0.903487, 3.49527, 1, 1, 1, 1, 1,
0.7027826, -1.561735, 2.805255, 1, 1, 1, 1, 1,
0.7043527, -1.513916, 3.938032, 1, 1, 1, 1, 1,
0.7047015, -0.3021339, 2.798206, 1, 1, 1, 1, 1,
0.7050987, -0.5148582, 2.362253, 1, 1, 1, 1, 1,
0.7110926, 0.9917347, -0.3841848, 1, 1, 1, 1, 1,
0.7170461, 0.8043143, -0.8508537, 1, 1, 1, 1, 1,
0.7183248, -0.3328092, 3.056259, 1, 1, 1, 1, 1,
0.7280769, -0.9170213, 2.005525, 1, 1, 1, 1, 1,
0.7426961, 0.5332155, 2.047937, 1, 1, 1, 1, 1,
0.7432643, -0.2609334, 3.254011, 1, 1, 1, 1, 1,
0.7591711, 1.090301, 1.175114, 1, 1, 1, 1, 1,
0.7620342, -0.2857286, 1.064199, 1, 1, 1, 1, 1,
0.7651744, -0.5144333, 2.282025, 1, 1, 1, 1, 1,
0.7663442, -1.930045, 2.362448, 1, 1, 1, 1, 1,
0.7767102, -0.1423026, 1.406069, 0, 0, 1, 1, 1,
0.7782885, -0.622172, 0.9084185, 1, 0, 0, 1, 1,
0.7813158, -0.8711467, 1.039275, 1, 0, 0, 1, 1,
0.7949862, -1.518584, 2.524219, 1, 0, 0, 1, 1,
0.7971148, -1.066253, 1.614549, 1, 0, 0, 1, 1,
0.8054281, 1.132772, 0.6263601, 1, 0, 0, 1, 1,
0.8068079, 0.6677276, 1.001797, 0, 0, 0, 1, 1,
0.8085015, -0.1696715, 2.337245, 0, 0, 0, 1, 1,
0.8126664, 2.657028, -1.192074, 0, 0, 0, 1, 1,
0.8147092, 0.4256276, 0.425272, 0, 0, 0, 1, 1,
0.8153649, -1.04159, 1.995369, 0, 0, 0, 1, 1,
0.8156185, -1.312757, 0.2524846, 0, 0, 0, 1, 1,
0.8228053, -0.5729356, 1.3353, 0, 0, 0, 1, 1,
0.8267935, 0.7831615, 1.196453, 1, 1, 1, 1, 1,
0.8288112, -1.943741, 4.348908, 1, 1, 1, 1, 1,
0.8288209, 0.6327983, 1.728939, 1, 1, 1, 1, 1,
0.8311844, -1.007477, 0.1708734, 1, 1, 1, 1, 1,
0.8346329, 0.1208486, 0.9904446, 1, 1, 1, 1, 1,
0.8392526, -0.4067617, 2.319634, 1, 1, 1, 1, 1,
0.8445603, -0.8029301, 2.250777, 1, 1, 1, 1, 1,
0.8499481, 0.2064882, 2.097038, 1, 1, 1, 1, 1,
0.8536809, 1.427431, 0.5929113, 1, 1, 1, 1, 1,
0.8544996, 1.756211, 0.1719919, 1, 1, 1, 1, 1,
0.8558422, -0.5957323, 1.23829, 1, 1, 1, 1, 1,
0.8583108, -0.2416331, 2.782638, 1, 1, 1, 1, 1,
0.8627267, 0.4975448, 0.2692405, 1, 1, 1, 1, 1,
0.8695555, -0.5292614, 3.973966, 1, 1, 1, 1, 1,
0.871753, 2.072407, -1.086544, 1, 1, 1, 1, 1,
0.8808129, 0.9658865, -0.1852186, 0, 0, 1, 1, 1,
0.8812582, -0.2970843, 2.507833, 1, 0, 0, 1, 1,
0.8832649, 1.591395, -0.2874271, 1, 0, 0, 1, 1,
0.8863383, -0.3428504, 2.00173, 1, 0, 0, 1, 1,
0.8900325, -0.3642838, 1.390292, 1, 0, 0, 1, 1,
0.8914962, -0.9200641, 2.815945, 1, 0, 0, 1, 1,
0.8940281, 0.8676297, 2.974487, 0, 0, 0, 1, 1,
0.8963283, 0.3235994, 1.508262, 0, 0, 0, 1, 1,
0.8970408, -0.7580392, 2.004259, 0, 0, 0, 1, 1,
0.9055691, -0.01497224, 0.9399089, 0, 0, 0, 1, 1,
0.9062215, -0.9458536, 1.889836, 0, 0, 0, 1, 1,
0.9178247, 0.8695967, 0.9557529, 0, 0, 0, 1, 1,
0.9261808, 0.1838816, 0.8126034, 0, 0, 0, 1, 1,
0.928812, 0.4525092, 1.997066, 1, 1, 1, 1, 1,
0.9309679, -0.5072845, 2.068105, 1, 1, 1, 1, 1,
0.9335259, -0.9032001, -0.1536634, 1, 1, 1, 1, 1,
0.9355295, 0.8565285, 1.397794, 1, 1, 1, 1, 1,
0.9370692, -0.4071523, 1.836312, 1, 1, 1, 1, 1,
0.9374459, -0.5601403, 3.777099, 1, 1, 1, 1, 1,
0.9390858, -0.0466496, 2.298768, 1, 1, 1, 1, 1,
0.9420463, -1.153998, 3.809555, 1, 1, 1, 1, 1,
0.9433619, 0.4297492, 1.342342, 1, 1, 1, 1, 1,
0.9482017, 0.7311623, 0.1575721, 1, 1, 1, 1, 1,
0.9549086, 0.8799418, -0.0381351, 1, 1, 1, 1, 1,
0.9578239, -0.5119094, 1.17996, 1, 1, 1, 1, 1,
0.9587435, -0.5750704, 2.454138, 1, 1, 1, 1, 1,
0.9589973, 0.005096217, 2.602744, 1, 1, 1, 1, 1,
0.9700624, 0.6779324, 2.396147, 1, 1, 1, 1, 1,
0.970955, -1.27766, 2.641532, 0, 0, 1, 1, 1,
0.971027, -0.1568086, -0.06959409, 1, 0, 0, 1, 1,
0.9725773, -0.6478462, 2.237756, 1, 0, 0, 1, 1,
0.9739892, -0.8275146, 3.133039, 1, 0, 0, 1, 1,
0.9773511, -1.536033, 3.31134, 1, 0, 0, 1, 1,
0.9805861, -1.656293, 2.09911, 1, 0, 0, 1, 1,
0.9840519, 0.0540637, 1.017387, 0, 0, 0, 1, 1,
0.9841812, 0.7152806, 2.123428, 0, 0, 0, 1, 1,
0.9899333, -1.144549, 2.613495, 0, 0, 0, 1, 1,
0.9916636, -2.048535, 3.28631, 0, 0, 0, 1, 1,
0.9957083, -0.5087389, 3.286852, 0, 0, 0, 1, 1,
1.001037, 0.5896133, 2.461418, 0, 0, 0, 1, 1,
1.003524, 1.426072, -0.3616655, 0, 0, 0, 1, 1,
1.005704, 0.6391096, 0.7581308, 1, 1, 1, 1, 1,
1.005938, -0.3200468, 2.983681, 1, 1, 1, 1, 1,
1.010172, 0.7433342, 1.601996, 1, 1, 1, 1, 1,
1.013023, 0.3675034, 2.627689, 1, 1, 1, 1, 1,
1.01728, 0.06069687, 2.244977, 1, 1, 1, 1, 1,
1.020958, -2.094451, 2.589088, 1, 1, 1, 1, 1,
1.026954, -0.7339736, 2.967201, 1, 1, 1, 1, 1,
1.028542, 1.71669, 1.216189, 1, 1, 1, 1, 1,
1.030816, -0.6385902, 0.76535, 1, 1, 1, 1, 1,
1.036154, 1.751797, -0.2302399, 1, 1, 1, 1, 1,
1.042355, -0.2580714, 1.599507, 1, 1, 1, 1, 1,
1.047757, -1.656482, 3.467536, 1, 1, 1, 1, 1,
1.050694, -0.3618479, 1.362717, 1, 1, 1, 1, 1,
1.051664, -0.366084, 2.678, 1, 1, 1, 1, 1,
1.062688, 0.4666311, 0.2633058, 1, 1, 1, 1, 1,
1.06559, -0.7919978, 0.6758316, 0, 0, 1, 1, 1,
1.067278, 0.8582164, 0.6932452, 1, 0, 0, 1, 1,
1.071315, 1.286682, 0.9839649, 1, 0, 0, 1, 1,
1.072337, 0.4348482, 1.34936, 1, 0, 0, 1, 1,
1.080482, -1.131493, 3.811176, 1, 0, 0, 1, 1,
1.085342, 0.6171058, 1.257963, 1, 0, 0, 1, 1,
1.091824, 1.081733, -0.972979, 0, 0, 0, 1, 1,
1.097165, -0.8797659, 1.973334, 0, 0, 0, 1, 1,
1.098557, 1.144096, 1.678114, 0, 0, 0, 1, 1,
1.10011, 0.2266455, 0.358613, 0, 0, 0, 1, 1,
1.10479, 0.9923885, -0.2887095, 0, 0, 0, 1, 1,
1.106467, 0.2120469, -0.1635045, 0, 0, 0, 1, 1,
1.112164, -2.013592, 2.815642, 0, 0, 0, 1, 1,
1.117127, 0.2407826, 3.375631, 1, 1, 1, 1, 1,
1.120057, -0.3591125, 1.34666, 1, 1, 1, 1, 1,
1.120274, 0.6804301, -0.9906245, 1, 1, 1, 1, 1,
1.12855, -2.089359, 3.955585, 1, 1, 1, 1, 1,
1.128836, -1.419, 4.037369, 1, 1, 1, 1, 1,
1.130235, 0.2645724, 1.939818, 1, 1, 1, 1, 1,
1.130744, 1.186014, 1.396461, 1, 1, 1, 1, 1,
1.138441, -0.9485738, 3.520177, 1, 1, 1, 1, 1,
1.138442, -1.381299, 0.1882047, 1, 1, 1, 1, 1,
1.140135, 1.203496, 1.391721, 1, 1, 1, 1, 1,
1.140933, 0.7990148, 1.5018, 1, 1, 1, 1, 1,
1.148089, -1.700436, 3.628612, 1, 1, 1, 1, 1,
1.148735, 0.7679248, 0.06787176, 1, 1, 1, 1, 1,
1.150564, -0.7201417, 2.696321, 1, 1, 1, 1, 1,
1.152889, 0.6886355, 1.926177, 1, 1, 1, 1, 1,
1.175489, -0.2526819, 2.736526, 0, 0, 1, 1, 1,
1.181841, -1.023914, 1.414899, 1, 0, 0, 1, 1,
1.182614, -0.3612494, 1.463682, 1, 0, 0, 1, 1,
1.185071, 0.241704, 2.075848, 1, 0, 0, 1, 1,
1.19966, 0.8716782, 0.9671659, 1, 0, 0, 1, 1,
1.209381, -0.6433953, 0.9277977, 1, 0, 0, 1, 1,
1.211355, -0.4638118, 2.567024, 0, 0, 0, 1, 1,
1.212042, 1.440249, 1.24217, 0, 0, 0, 1, 1,
1.223197, -0.5484058, 1.68058, 0, 0, 0, 1, 1,
1.224862, 0.6146506, 1.758898, 0, 0, 0, 1, 1,
1.227114, -0.4229941, 2.567262, 0, 0, 0, 1, 1,
1.231311, -0.5462503, 1.70752, 0, 0, 0, 1, 1,
1.245061, 0.7650349, 0.6881187, 0, 0, 0, 1, 1,
1.245883, 0.7397211, -0.3402597, 1, 1, 1, 1, 1,
1.248142, 0.6098852, 0.1851146, 1, 1, 1, 1, 1,
1.257669, 1.889042, 0.250887, 1, 1, 1, 1, 1,
1.264826, 0.1960623, -0.9600613, 1, 1, 1, 1, 1,
1.271626, -0.3773627, 1.731975, 1, 1, 1, 1, 1,
1.274873, -0.4406956, 3.24819, 1, 1, 1, 1, 1,
1.290069, -1.130058, 2.869372, 1, 1, 1, 1, 1,
1.293022, -0.3577827, 2.402997, 1, 1, 1, 1, 1,
1.293341, 0.06243436, 3.219663, 1, 1, 1, 1, 1,
1.295322, -0.7759007, 2.509479, 1, 1, 1, 1, 1,
1.305174, -0.02603203, 2.635813, 1, 1, 1, 1, 1,
1.32096, -1.634572, 3.56598, 1, 1, 1, 1, 1,
1.336114, -0.7702571, 2.115888, 1, 1, 1, 1, 1,
1.344659, 1.316764, 0.526746, 1, 1, 1, 1, 1,
1.34913, -1.234257, 3.086958, 1, 1, 1, 1, 1,
1.349692, -0.2822963, 2.295295, 0, 0, 1, 1, 1,
1.351812, 0.1974572, 0.3661982, 1, 0, 0, 1, 1,
1.35494, 0.3484871, 1.439885, 1, 0, 0, 1, 1,
1.362426, 1.076824, 1.742651, 1, 0, 0, 1, 1,
1.376535, 0.8024908, 1.376078, 1, 0, 0, 1, 1,
1.384934, -0.8672398, 0.8377334, 1, 0, 0, 1, 1,
1.387668, -0.6047668, 2.293469, 0, 0, 0, 1, 1,
1.390892, -1.656788, 3.453152, 0, 0, 0, 1, 1,
1.403502, -1.765653, 0.6721419, 0, 0, 0, 1, 1,
1.424212, -0.6339424, 3.448778, 0, 0, 0, 1, 1,
1.426882, -2.349241, 3.659866, 0, 0, 0, 1, 1,
1.430667, -0.4069735, 2.943185, 0, 0, 0, 1, 1,
1.432522, 0.07639888, 1.2449, 0, 0, 0, 1, 1,
1.440456, -0.3198991, 1.272122, 1, 1, 1, 1, 1,
1.450296, -1.359569, 1.841897, 1, 1, 1, 1, 1,
1.455696, 1.147255, 0.9158932, 1, 1, 1, 1, 1,
1.46072, 1.379361, 2.739885, 1, 1, 1, 1, 1,
1.470846, -1.560498, 3.392236, 1, 1, 1, 1, 1,
1.477421, -0.5532348, 2.422714, 1, 1, 1, 1, 1,
1.491503, -0.6993006, 1.841053, 1, 1, 1, 1, 1,
1.498497, 0.6709549, 0.5560086, 1, 1, 1, 1, 1,
1.498879, -0.8435465, 2.987984, 1, 1, 1, 1, 1,
1.51386, 0.960242, -0.09486882, 1, 1, 1, 1, 1,
1.527293, 0.8188106, 0.4720777, 1, 1, 1, 1, 1,
1.528611, -1.169014, 1.769255, 1, 1, 1, 1, 1,
1.53224, -0.1977392, 0.635829, 1, 1, 1, 1, 1,
1.548064, 0.2925789, 1.604996, 1, 1, 1, 1, 1,
1.557875, 0.4662915, 0.1194661, 1, 1, 1, 1, 1,
1.583246, -0.3481549, -0.1556062, 0, 0, 1, 1, 1,
1.586266, -1.485724, 2.017396, 1, 0, 0, 1, 1,
1.586288, 1.354677, -0.8997443, 1, 0, 0, 1, 1,
1.589418, -1.141354, 2.590078, 1, 0, 0, 1, 1,
1.607924, 1.407115, 0.9470783, 1, 0, 0, 1, 1,
1.619695, 1.358352, 0.8581145, 1, 0, 0, 1, 1,
1.623818, -0.6233897, 0.4683067, 0, 0, 0, 1, 1,
1.634611, 0.2703959, 0.8898951, 0, 0, 0, 1, 1,
1.637869, 1.034914, 0.5050516, 0, 0, 0, 1, 1,
1.66662, -0.03000495, 2.515055, 0, 0, 0, 1, 1,
1.674979, 1.843494, 1.804948, 0, 0, 0, 1, 1,
1.680547, -0.6208678, 2.606328, 0, 0, 0, 1, 1,
1.691563, 0.8086707, -0.4437324, 0, 0, 0, 1, 1,
1.707372, -0.4139389, 4.054741, 1, 1, 1, 1, 1,
1.715119, 0.1560654, -0.2700188, 1, 1, 1, 1, 1,
1.723141, 1.939434, 1.049014, 1, 1, 1, 1, 1,
1.795643, 0.8301082, 0.4698271, 1, 1, 1, 1, 1,
1.798495, -1.105909, 1.67752, 1, 1, 1, 1, 1,
1.807582, 0.01004641, 2.198766, 1, 1, 1, 1, 1,
1.843691, -0.6397996, 2.326806, 1, 1, 1, 1, 1,
1.850157, 0.5003914, 1.486919, 1, 1, 1, 1, 1,
1.89125, -0.3300945, 1.382308, 1, 1, 1, 1, 1,
1.932461, -0.3203669, 0.743106, 1, 1, 1, 1, 1,
1.95013, 0.2279064, 1.261261, 1, 1, 1, 1, 1,
1.963482, -1.479562, 3.20509, 1, 1, 1, 1, 1,
1.981446, -1.891604, 2.507748, 1, 1, 1, 1, 1,
1.983194, -0.7267139, 2.011999, 1, 1, 1, 1, 1,
1.984754, -1.008511, 1.915317, 1, 1, 1, 1, 1,
2.011493, -0.195529, 1.621188, 0, 0, 1, 1, 1,
2.04514, -0.3879745, 1.553576, 1, 0, 0, 1, 1,
2.045255, -0.4019429, 1.634066, 1, 0, 0, 1, 1,
2.064836, -0.6638375, 3.856331, 1, 0, 0, 1, 1,
2.092291, -0.2208112, 0.3959342, 1, 0, 0, 1, 1,
2.139997, 0.2648234, 1.96721, 1, 0, 0, 1, 1,
2.157483, -0.3479032, 0.1563712, 0, 0, 0, 1, 1,
2.206643, 0.04325129, 1.764169, 0, 0, 0, 1, 1,
2.259286, 0.2204861, -0.4776924, 0, 0, 0, 1, 1,
2.261606, 1.301637, 1.054627, 0, 0, 0, 1, 1,
2.369042, 1.241156, 0.713773, 0, 0, 0, 1, 1,
2.40041, 0.2360729, 1.267342, 0, 0, 0, 1, 1,
2.401273, -1.545914, 1.971833, 0, 0, 0, 1, 1,
2.402677, 1.239779, 1.10856, 1, 1, 1, 1, 1,
2.444182, -0.6875531, 2.853312, 1, 1, 1, 1, 1,
2.690254, -0.5104225, 2.270601, 1, 1, 1, 1, 1,
2.714314, 0.6326157, 1.737919, 1, 1, 1, 1, 1,
2.992657, 0.8608519, -0.9691336, 1, 1, 1, 1, 1,
3.354675, 0.3669783, 1.263575, 1, 1, 1, 1, 1,
3.457903, -1.003506, 2.227092, 1, 1, 1, 1, 1
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
var radius = 9.909034;
var distance = 34.80506;
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
mvMatrix.translate( 0.1762695, 0.06171906, -0.4491389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.80506);
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
