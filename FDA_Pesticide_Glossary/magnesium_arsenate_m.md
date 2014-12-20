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
-3.142421, -0.6006332, -0.8443311, 1, 0, 0, 1,
-2.871143, 0.6757505, -0.7499104, 1, 0.007843138, 0, 1,
-2.831611, 0.4680818, -1.875265, 1, 0.01176471, 0, 1,
-2.765782, -0.381869, -1.985842, 1, 0.01960784, 0, 1,
-2.672574, 1.01923, -0.339211, 1, 0.02352941, 0, 1,
-2.540004, -0.9000484, -2.849771, 1, 0.03137255, 0, 1,
-2.480709, -0.5946259, -1.811471, 1, 0.03529412, 0, 1,
-2.475365, -0.1604021, -0.1730495, 1, 0.04313726, 0, 1,
-2.4134, -0.5978425, -1.322233, 1, 0.04705882, 0, 1,
-2.404595, 0.6170245, 0.9751952, 1, 0.05490196, 0, 1,
-2.287234, -1.265441, -2.72809, 1, 0.05882353, 0, 1,
-2.25863, -0.7202171, -1.967475, 1, 0.06666667, 0, 1,
-2.184746, -0.4048634, -2.73884, 1, 0.07058824, 0, 1,
-2.146493, -0.6951392, -2.526954, 1, 0.07843138, 0, 1,
-2.139582, -0.3971465, -1.108006, 1, 0.08235294, 0, 1,
-2.110174, 1.04384, -1.24384, 1, 0.09019608, 0, 1,
-2.094334, -0.1878953, -1.512163, 1, 0.09411765, 0, 1,
-2.093803, 0.7866574, -1.306005, 1, 0.1019608, 0, 1,
-2.087731, 0.1254665, -1.707731, 1, 0.1098039, 0, 1,
-2.083244, 0.4387855, -3.252356, 1, 0.1137255, 0, 1,
-2.078335, -0.8885168, -3.450062, 1, 0.1215686, 0, 1,
-2.077654, -1.542525, -3.193281, 1, 0.1254902, 0, 1,
-2.073221, 0.0005833224, -2.715971, 1, 0.1333333, 0, 1,
-2.064464, 0.0569341, -1.553677, 1, 0.1372549, 0, 1,
-2.05873, -1.422994, -2.066047, 1, 0.145098, 0, 1,
-2.043559, 0.1580164, -1.398183, 1, 0.1490196, 0, 1,
-2.026113, -0.759383, -3.487174, 1, 0.1568628, 0, 1,
-2.025781, 1.121053, -0.3815064, 1, 0.1607843, 0, 1,
-1.973409, -0.6187143, -2.442946, 1, 0.1686275, 0, 1,
-1.928351, -0.9935807, -3.940536, 1, 0.172549, 0, 1,
-1.885719, 0.5994268, -1.35743, 1, 0.1803922, 0, 1,
-1.862096, 0.07501405, -0.530128, 1, 0.1843137, 0, 1,
-1.839694, 0.3037492, -1.597381, 1, 0.1921569, 0, 1,
-1.799577, 0.3023277, -2.161395, 1, 0.1960784, 0, 1,
-1.787728, -1.735132, -1.956818, 1, 0.2039216, 0, 1,
-1.755209, -0.8295203, -3.073885, 1, 0.2117647, 0, 1,
-1.736223, -0.9877824, -1.849772, 1, 0.2156863, 0, 1,
-1.726482, -0.8884321, -3.799812, 1, 0.2235294, 0, 1,
-1.717649, 0.06184944, -2.118771, 1, 0.227451, 0, 1,
-1.713647, 0.04929752, -2.693979, 1, 0.2352941, 0, 1,
-1.710424, 0.7809617, -0.7493754, 1, 0.2392157, 0, 1,
-1.697868, -0.7990808, -0.9966227, 1, 0.2470588, 0, 1,
-1.679009, 1.482267, -0.8546408, 1, 0.2509804, 0, 1,
-1.67017, 1.866481, -2.76405, 1, 0.2588235, 0, 1,
-1.66258, 0.8596265, -0.8615676, 1, 0.2627451, 0, 1,
-1.644012, -0.4008834, -3.306395, 1, 0.2705882, 0, 1,
-1.612002, -1.13148, -4.927183, 1, 0.2745098, 0, 1,
-1.605899, -0.6855885, -2.397525, 1, 0.282353, 0, 1,
-1.581993, 0.5162141, -1.14897, 1, 0.2862745, 0, 1,
-1.574653, -0.7245275, -1.963565, 1, 0.2941177, 0, 1,
-1.571305, 0.9553748, 1.516382, 1, 0.3019608, 0, 1,
-1.569925, 2.550858, -0.3821824, 1, 0.3058824, 0, 1,
-1.56786, 0.245582, -2.721566, 1, 0.3137255, 0, 1,
-1.563032, -0.09017049, -0.3534911, 1, 0.3176471, 0, 1,
-1.558826, 0.2315746, -1.368109, 1, 0.3254902, 0, 1,
-1.558703, -1.586116, -2.286852, 1, 0.3294118, 0, 1,
-1.548212, -1.411351, -3.761427, 1, 0.3372549, 0, 1,
-1.540604, 0.4766745, -0.4061734, 1, 0.3411765, 0, 1,
-1.538457, 0.9758174, -0.4477187, 1, 0.3490196, 0, 1,
-1.52503, -0.1706262, -2.396995, 1, 0.3529412, 0, 1,
-1.522463, 2.091722, 0.3013083, 1, 0.3607843, 0, 1,
-1.508343, 1.291056, -1.572965, 1, 0.3647059, 0, 1,
-1.499831, -1.119972, -5.13089, 1, 0.372549, 0, 1,
-1.497231, -1.50129, -3.043875, 1, 0.3764706, 0, 1,
-1.488253, -0.1452123, -3.505146, 1, 0.3843137, 0, 1,
-1.480139, -0.1323598, -2.340842, 1, 0.3882353, 0, 1,
-1.47414, 1.114986, 1.295751, 1, 0.3960784, 0, 1,
-1.471759, -0.424888, -0.8143862, 1, 0.4039216, 0, 1,
-1.470449, -1.127996, -4.216555, 1, 0.4078431, 0, 1,
-1.461847, 0.6480103, -1.069181, 1, 0.4156863, 0, 1,
-1.46162, -0.6118231, -2.121865, 1, 0.4196078, 0, 1,
-1.458774, -0.9466336, -2.882228, 1, 0.427451, 0, 1,
-1.458723, 1.025827, -0.5186379, 1, 0.4313726, 0, 1,
-1.456392, -0.9405916, -2.594939, 1, 0.4392157, 0, 1,
-1.452565, 2.02615, -0.05569468, 1, 0.4431373, 0, 1,
-1.448733, 0.313564, -0.1074628, 1, 0.4509804, 0, 1,
-1.443586, -1.952051, -2.518975, 1, 0.454902, 0, 1,
-1.439057, -0.05494509, -0.6984146, 1, 0.4627451, 0, 1,
-1.431997, 0.172872, -2.16186, 1, 0.4666667, 0, 1,
-1.411791, 1.246227, -2.129294, 1, 0.4745098, 0, 1,
-1.407468, -0.8667864, -2.087812, 1, 0.4784314, 0, 1,
-1.395386, -0.158205, -1.798495, 1, 0.4862745, 0, 1,
-1.387437, 1.178405, -0.336129, 1, 0.4901961, 0, 1,
-1.386844, -0.7538159, -1.479721, 1, 0.4980392, 0, 1,
-1.386582, -0.9418154, -2.899725, 1, 0.5058824, 0, 1,
-1.385164, -2.608927, -3.219755, 1, 0.509804, 0, 1,
-1.384341, -0.7191903, -0.9851727, 1, 0.5176471, 0, 1,
-1.379345, 1.752296, -1.875028, 1, 0.5215687, 0, 1,
-1.370774, 0.3190633, -1.973168, 1, 0.5294118, 0, 1,
-1.369682, 1.219934, 0.1688178, 1, 0.5333334, 0, 1,
-1.367737, 0.09951402, -1.534047, 1, 0.5411765, 0, 1,
-1.352378, -1.060375, -2.602215, 1, 0.5450981, 0, 1,
-1.344029, 0.5044028, -0.1665632, 1, 0.5529412, 0, 1,
-1.336434, -1.03218, -3.615272, 1, 0.5568628, 0, 1,
-1.334412, 0.03305981, -3.161472, 1, 0.5647059, 0, 1,
-1.329957, -1.154063, -3.275757, 1, 0.5686275, 0, 1,
-1.326656, -0.4138036, -2.82995, 1, 0.5764706, 0, 1,
-1.323259, 0.701048, -1.473851, 1, 0.5803922, 0, 1,
-1.321163, 1.709214, -1.691751, 1, 0.5882353, 0, 1,
-1.31595, -0.3270895, -3.414049, 1, 0.5921569, 0, 1,
-1.315369, -0.5886877, -0.8886303, 1, 0.6, 0, 1,
-1.310248, 1.408279, -1.033167, 1, 0.6078432, 0, 1,
-1.302113, 0.9997084, -0.968826, 1, 0.6117647, 0, 1,
-1.296917, 1.085604, -2.190034, 1, 0.6196079, 0, 1,
-1.285137, -0.7605275, -3.778651, 1, 0.6235294, 0, 1,
-1.284635, -1.83365, -3.374089, 1, 0.6313726, 0, 1,
-1.274487, 0.2958431, -0.4555241, 1, 0.6352941, 0, 1,
-1.270633, 1.539713, -0.1070804, 1, 0.6431373, 0, 1,
-1.265545, -0.291114, -2.06104, 1, 0.6470588, 0, 1,
-1.260839, -0.7448446, -1.464425, 1, 0.654902, 0, 1,
-1.253464, 0.6109582, -0.6235461, 1, 0.6588235, 0, 1,
-1.240915, 1.058719, -0.3017727, 1, 0.6666667, 0, 1,
-1.235737, 1.335669, -0.4922372, 1, 0.6705883, 0, 1,
-1.234752, 0.3554639, -2.375833, 1, 0.6784314, 0, 1,
-1.233959, 0.1284814, -2.110781, 1, 0.682353, 0, 1,
-1.226307, -0.2947574, -2.329759, 1, 0.6901961, 0, 1,
-1.222566, 0.05598497, -1.756344, 1, 0.6941177, 0, 1,
-1.22255, -0.5982974, -3.256532, 1, 0.7019608, 0, 1,
-1.213926, 1.335649, 0.2202433, 1, 0.7098039, 0, 1,
-1.20823, -0.2102655, -1.337409, 1, 0.7137255, 0, 1,
-1.193374, -1.106492, -1.639362, 1, 0.7215686, 0, 1,
-1.184357, -0.5301236, -2.888228, 1, 0.7254902, 0, 1,
-1.184132, -0.9402912, -1.877088, 1, 0.7333333, 0, 1,
-1.183769, 0.06483563, -1.947658, 1, 0.7372549, 0, 1,
-1.182638, 0.3802116, -1.771153, 1, 0.7450981, 0, 1,
-1.177137, -0.9876214, 0.03531433, 1, 0.7490196, 0, 1,
-1.16773, 0.6151049, -1.01435, 1, 0.7568628, 0, 1,
-1.162556, 0.3317584, -3.154222, 1, 0.7607843, 0, 1,
-1.153057, -0.2138478, -1.032621, 1, 0.7686275, 0, 1,
-1.145204, -1.409141, 0.01616642, 1, 0.772549, 0, 1,
-1.142915, -0.8303204, -0.7734356, 1, 0.7803922, 0, 1,
-1.140431, -1.372546, -2.13219, 1, 0.7843137, 0, 1,
-1.117569, 1.945895, -1.364731, 1, 0.7921569, 0, 1,
-1.114519, 0.1063593, -1.419318, 1, 0.7960784, 0, 1,
-1.102977, 1.426104, -0.8263132, 1, 0.8039216, 0, 1,
-1.095026, 0.885119, -3.037326, 1, 0.8117647, 0, 1,
-1.091837, 0.6117895, -0.8813722, 1, 0.8156863, 0, 1,
-1.082946, -0.6689544, -3.326088, 1, 0.8235294, 0, 1,
-1.075341, 0.2541532, -1.295614, 1, 0.827451, 0, 1,
-1.074749, 0.609643, -1.318137, 1, 0.8352941, 0, 1,
-1.068169, 0.1585714, -1.531965, 1, 0.8392157, 0, 1,
-1.063579, 0.2620788, -1.325026, 1, 0.8470588, 0, 1,
-1.060299, -0.8773077, -1.673874, 1, 0.8509804, 0, 1,
-1.056388, 0.4735479, -1.561814, 1, 0.8588235, 0, 1,
-1.055578, -0.7665958, -2.183902, 1, 0.8627451, 0, 1,
-1.055282, 0.4943797, 0.1211434, 1, 0.8705882, 0, 1,
-1.05502, 0.1878395, -0.4012053, 1, 0.8745098, 0, 1,
-1.051227, -0.4234576, -2.720958, 1, 0.8823529, 0, 1,
-1.037091, 0.5788152, -1.33842, 1, 0.8862745, 0, 1,
-1.029163, -1.306598, -0.648019, 1, 0.8941177, 0, 1,
-1.027117, -0.3668802, -0.9243088, 1, 0.8980392, 0, 1,
-1.026629, -0.4902474, -1.415122, 1, 0.9058824, 0, 1,
-1.024891, 0.8317374, -0.1356796, 1, 0.9137255, 0, 1,
-1.024028, 0.1650088, -0.4330232, 1, 0.9176471, 0, 1,
-1.011458, 0.2369489, 1.041863, 1, 0.9254902, 0, 1,
-0.9998451, -0.1188015, -0.7653244, 1, 0.9294118, 0, 1,
-0.9965565, 1.405942, 0.0001838607, 1, 0.9372549, 0, 1,
-0.9961224, 0.4749359, -1.66239, 1, 0.9411765, 0, 1,
-0.9929474, -0.5728704, -1.338381, 1, 0.9490196, 0, 1,
-0.9849536, -0.4650087, -1.53094, 1, 0.9529412, 0, 1,
-0.9788177, 1.319457, -0.5103695, 1, 0.9607843, 0, 1,
-0.9737777, -0.9403012, -2.46416, 1, 0.9647059, 0, 1,
-0.9662469, 0.5441687, -0.1671736, 1, 0.972549, 0, 1,
-0.9616051, 1.008375, -0.05810237, 1, 0.9764706, 0, 1,
-0.954122, -0.9120656, -0.4117146, 1, 0.9843137, 0, 1,
-0.9505755, 1.370061, -0.522482, 1, 0.9882353, 0, 1,
-0.9468167, -0.5648185, -2.225687, 1, 0.9960784, 0, 1,
-0.9424341, -0.8319728, -1.693628, 0.9960784, 1, 0, 1,
-0.9415768, 1.099845, 0.03083122, 0.9921569, 1, 0, 1,
-0.9372848, 1.938387, -1.996048, 0.9843137, 1, 0, 1,
-0.9362307, -0.2801531, -3.043234, 0.9803922, 1, 0, 1,
-0.9253926, 2.887668, -0.2756343, 0.972549, 1, 0, 1,
-0.9197933, -1.81972, -4.6058, 0.9686275, 1, 0, 1,
-0.9193848, 0.7215527, -0.4122452, 0.9607843, 1, 0, 1,
-0.9151418, 2.742166, -0.5550557, 0.9568627, 1, 0, 1,
-0.9129014, -0.2768679, -1.104382, 0.9490196, 1, 0, 1,
-0.9110996, -1.876907, -2.002845, 0.945098, 1, 0, 1,
-0.899088, -1.596161, -1.492044, 0.9372549, 1, 0, 1,
-0.8986145, -0.9422004, -1.432335, 0.9333333, 1, 0, 1,
-0.8843319, 0.2107985, 1.04487, 0.9254902, 1, 0, 1,
-0.8787367, -0.5940633, -2.261172, 0.9215686, 1, 0, 1,
-0.8773573, -0.3745684, -3.463193, 0.9137255, 1, 0, 1,
-0.8753639, -1.291954, -2.885903, 0.9098039, 1, 0, 1,
-0.8680218, 0.2222449, -0.8895104, 0.9019608, 1, 0, 1,
-0.8668193, 2.089021, -2.36133, 0.8941177, 1, 0, 1,
-0.8663529, -0.5086343, -1.101773, 0.8901961, 1, 0, 1,
-0.8619211, 1.498104, -1.101188, 0.8823529, 1, 0, 1,
-0.8592011, -0.750593, -2.576219, 0.8784314, 1, 0, 1,
-0.8535934, -0.9601237, -1.583804, 0.8705882, 1, 0, 1,
-0.8526298, 2.634239, -2.297233, 0.8666667, 1, 0, 1,
-0.8471282, 1.71041, -1.264534, 0.8588235, 1, 0, 1,
-0.8302559, -0.5375298, -2.894025, 0.854902, 1, 0, 1,
-0.8270743, 1.33391, -2.67002, 0.8470588, 1, 0, 1,
-0.8236487, -0.959644, -1.626543, 0.8431373, 1, 0, 1,
-0.8212018, -1.448452, -2.744774, 0.8352941, 1, 0, 1,
-0.8192379, 1.071209, -0.6763418, 0.8313726, 1, 0, 1,
-0.8156822, 0.09611566, 0.5687467, 0.8235294, 1, 0, 1,
-0.8083905, -0.739507, -3.42883, 0.8196079, 1, 0, 1,
-0.8051645, 0.1353917, -2.941882, 0.8117647, 1, 0, 1,
-0.8022879, -0.6283891, -3.241226, 0.8078431, 1, 0, 1,
-0.7910082, 0.8971827, 0.2645542, 0.8, 1, 0, 1,
-0.7871319, -2.01978, -3.452677, 0.7921569, 1, 0, 1,
-0.779846, -0.5834639, -2.816097, 0.7882353, 1, 0, 1,
-0.7746496, 0.502107, -0.4358881, 0.7803922, 1, 0, 1,
-0.770678, -0.3916923, -1.51188, 0.7764706, 1, 0, 1,
-0.767498, 0.6275774, -0.2626909, 0.7686275, 1, 0, 1,
-0.7634318, 0.4138392, -0.6738492, 0.7647059, 1, 0, 1,
-0.7612266, 0.1957161, -1.563417, 0.7568628, 1, 0, 1,
-0.7583939, -0.9221928, -2.934552, 0.7529412, 1, 0, 1,
-0.7579889, 0.3807964, 0.04532045, 0.7450981, 1, 0, 1,
-0.7567369, -1.260447, -2.483703, 0.7411765, 1, 0, 1,
-0.7554643, 0.1860713, -1.102742, 0.7333333, 1, 0, 1,
-0.7437144, -0.004947785, -2.544081, 0.7294118, 1, 0, 1,
-0.7418392, -0.2961274, -2.707119, 0.7215686, 1, 0, 1,
-0.731923, -0.313798, -1.557733, 0.7176471, 1, 0, 1,
-0.721074, -0.04926976, -2.471709, 0.7098039, 1, 0, 1,
-0.7206564, 1.026287, -1.752785, 0.7058824, 1, 0, 1,
-0.7160668, -0.194934, -2.580036, 0.6980392, 1, 0, 1,
-0.7083483, -0.6571533, -2.92164, 0.6901961, 1, 0, 1,
-0.7066414, 0.9492954, -1.84963, 0.6862745, 1, 0, 1,
-0.7001182, 1.03807, -0.03359237, 0.6784314, 1, 0, 1,
-0.6907096, 0.7968988, -1.670686, 0.6745098, 1, 0, 1,
-0.6898671, -2.020979, -2.854712, 0.6666667, 1, 0, 1,
-0.6894041, -1.941735, -2.723137, 0.6627451, 1, 0, 1,
-0.6861395, 0.5418572, -3.091213, 0.654902, 1, 0, 1,
-0.6843832, 0.3239638, -3.666046, 0.6509804, 1, 0, 1,
-0.6824829, 1.02989, -0.6379397, 0.6431373, 1, 0, 1,
-0.6821367, 0.4122529, -1.188193, 0.6392157, 1, 0, 1,
-0.6655061, 2.951968, 0.5381655, 0.6313726, 1, 0, 1,
-0.656777, 1.675931, 1.276374, 0.627451, 1, 0, 1,
-0.6513821, -0.2946593, -2.153015, 0.6196079, 1, 0, 1,
-0.6495335, -0.6748993, -3.833197, 0.6156863, 1, 0, 1,
-0.6488752, 1.006644, 0.1615916, 0.6078432, 1, 0, 1,
-0.6450344, -0.8006543, -3.112799, 0.6039216, 1, 0, 1,
-0.6445678, -0.7429162, -1.605199, 0.5960785, 1, 0, 1,
-0.6427004, 2.700792, -1.817098, 0.5882353, 1, 0, 1,
-0.641766, -1.375541, -0.8352861, 0.5843138, 1, 0, 1,
-0.6386345, -0.7389113, -2.929972, 0.5764706, 1, 0, 1,
-0.6378698, -0.584227, -1.562742, 0.572549, 1, 0, 1,
-0.6362273, -0.4878272, -1.142511, 0.5647059, 1, 0, 1,
-0.6290738, -0.7455021, -2.600225, 0.5607843, 1, 0, 1,
-0.6246141, 0.3189525, -0.5446476, 0.5529412, 1, 0, 1,
-0.6226531, 0.560207, -0.5762331, 0.5490196, 1, 0, 1,
-0.6215822, -0.04749072, -2.398584, 0.5411765, 1, 0, 1,
-0.6194659, -0.9397008, -3.862101, 0.5372549, 1, 0, 1,
-0.614429, -0.4312544, -1.252095, 0.5294118, 1, 0, 1,
-0.6125219, 1.053066, 0.7091911, 0.5254902, 1, 0, 1,
-0.6118365, 1.447535, 0.4101502, 0.5176471, 1, 0, 1,
-0.6116552, 0.3295951, -0.1091, 0.5137255, 1, 0, 1,
-0.6113759, -0.9416604, -3.495049, 0.5058824, 1, 0, 1,
-0.6080106, -0.06441635, -2.990363, 0.5019608, 1, 0, 1,
-0.6050043, 0.09659792, -0.8764423, 0.4941176, 1, 0, 1,
-0.6031223, 0.2959136, -0.3362645, 0.4862745, 1, 0, 1,
-0.6017678, -1.445169, -0.9441737, 0.4823529, 1, 0, 1,
-0.6013991, -0.132006, -2.237984, 0.4745098, 1, 0, 1,
-0.5922694, 0.7775348, -0.5445034, 0.4705882, 1, 0, 1,
-0.5905002, -0.3359225, -2.443403, 0.4627451, 1, 0, 1,
-0.5904407, -0.03588406, -2.780979, 0.4588235, 1, 0, 1,
-0.5902383, 1.156275, -2.754254, 0.4509804, 1, 0, 1,
-0.5889547, -1.033237, -2.098727, 0.4470588, 1, 0, 1,
-0.5876836, 0.9523162, -1.153451, 0.4392157, 1, 0, 1,
-0.5857564, 0.06844689, -1.381754, 0.4352941, 1, 0, 1,
-0.5850752, -1.000298, -3.981135, 0.427451, 1, 0, 1,
-0.5848312, -0.7310749, -3.18726, 0.4235294, 1, 0, 1,
-0.5787265, -0.5921906, -2.168607, 0.4156863, 1, 0, 1,
-0.5716435, 0.02792332, -0.8550081, 0.4117647, 1, 0, 1,
-0.5680621, -0.396936, -0.07155037, 0.4039216, 1, 0, 1,
-0.5656874, 0.6575594, 0.3451435, 0.3960784, 1, 0, 1,
-0.5645124, -0.3529517, -0.7424901, 0.3921569, 1, 0, 1,
-0.5625529, -0.4852805, -0.7197983, 0.3843137, 1, 0, 1,
-0.5597618, -1.369662, -2.79352, 0.3803922, 1, 0, 1,
-0.5583121, 0.375743, -0.7382665, 0.372549, 1, 0, 1,
-0.5540267, -0.1688319, -2.548929, 0.3686275, 1, 0, 1,
-0.553987, 0.7016722, -1.5783, 0.3607843, 1, 0, 1,
-0.5520754, 0.8988705, -0.7436526, 0.3568628, 1, 0, 1,
-0.5506495, -1.218334, -2.264348, 0.3490196, 1, 0, 1,
-0.5474234, 0.05340554, -2.973129, 0.345098, 1, 0, 1,
-0.5468989, 1.694469, -0.8756041, 0.3372549, 1, 0, 1,
-0.5443163, -3.070028, -1.381281, 0.3333333, 1, 0, 1,
-0.5424925, 0.7599683, 0.5149235, 0.3254902, 1, 0, 1,
-0.5400213, -0.523985, -1.271104, 0.3215686, 1, 0, 1,
-0.5363375, -0.742605, -3.953844, 0.3137255, 1, 0, 1,
-0.5348532, -1.267268, -3.204461, 0.3098039, 1, 0, 1,
-0.5315746, -1.406243, -2.626197, 0.3019608, 1, 0, 1,
-0.5256465, -0.5476185, -3.126212, 0.2941177, 1, 0, 1,
-0.5210159, -0.1846578, -2.19229, 0.2901961, 1, 0, 1,
-0.5204981, 0.732736, 1.212537, 0.282353, 1, 0, 1,
-0.5172444, 1.187142, 0.6773158, 0.2784314, 1, 0, 1,
-0.5170423, -0.573588, -2.83975, 0.2705882, 1, 0, 1,
-0.5137694, 1.475073, -0.1802895, 0.2666667, 1, 0, 1,
-0.5089415, -0.402054, -2.227094, 0.2588235, 1, 0, 1,
-0.5069184, -0.5786808, -2.648571, 0.254902, 1, 0, 1,
-0.4981659, 2.18467, -0.7450485, 0.2470588, 1, 0, 1,
-0.4937801, -0.523128, -2.621223, 0.2431373, 1, 0, 1,
-0.4924111, -0.7281245, -0.62737, 0.2352941, 1, 0, 1,
-0.4893117, 1.459381, -0.5102482, 0.2313726, 1, 0, 1,
-0.4868611, 0.2800914, -0.8670171, 0.2235294, 1, 0, 1,
-0.4849089, 0.9779822, -0.4626363, 0.2196078, 1, 0, 1,
-0.482432, -0.2333025, -4.998651, 0.2117647, 1, 0, 1,
-0.4810102, -1.831011, -2.188011, 0.2078431, 1, 0, 1,
-0.4802629, -0.7696007, -1.758867, 0.2, 1, 0, 1,
-0.4785055, -0.7267161, -2.61957, 0.1921569, 1, 0, 1,
-0.4781255, 1.430703, -0.3382103, 0.1882353, 1, 0, 1,
-0.4712985, -0.055356, -1.351849, 0.1803922, 1, 0, 1,
-0.470945, -1.407838, -2.915381, 0.1764706, 1, 0, 1,
-0.4697037, 0.1182672, -0.6453553, 0.1686275, 1, 0, 1,
-0.4647872, 0.5294571, -0.257535, 0.1647059, 1, 0, 1,
-0.4561668, 1.142142, -0.1500552, 0.1568628, 1, 0, 1,
-0.4555914, -2.026189, -3.286959, 0.1529412, 1, 0, 1,
-0.4529635, -0.4548475, -3.522274, 0.145098, 1, 0, 1,
-0.4525189, 1.497128, 0.6511853, 0.1411765, 1, 0, 1,
-0.452029, -1.046316, -2.48467, 0.1333333, 1, 0, 1,
-0.450803, 0.1173223, -0.1105651, 0.1294118, 1, 0, 1,
-0.4506775, 0.03565877, -2.167726, 0.1215686, 1, 0, 1,
-0.4450483, -0.3343757, -0.7884309, 0.1176471, 1, 0, 1,
-0.4433391, 1.244292, 0.1237594, 0.1098039, 1, 0, 1,
-0.4408614, -0.3141394, -2.934446, 0.1058824, 1, 0, 1,
-0.4407072, 1.238371, -1.266852, 0.09803922, 1, 0, 1,
-0.4367237, 0.9933907, 0.5744373, 0.09019608, 1, 0, 1,
-0.4306465, 0.6636081, -0.6019947, 0.08627451, 1, 0, 1,
-0.4298482, 0.03003335, -1.379215, 0.07843138, 1, 0, 1,
-0.4275462, -1.51806, -1.635903, 0.07450981, 1, 0, 1,
-0.4265464, 1.517507, 1.391394, 0.06666667, 1, 0, 1,
-0.424936, 1.156037, -0.4962091, 0.0627451, 1, 0, 1,
-0.4167122, 0.3079686, -0.568143, 0.05490196, 1, 0, 1,
-0.4146893, 0.3183293, 0.2322515, 0.05098039, 1, 0, 1,
-0.4132914, -2.411486, -2.883049, 0.04313726, 1, 0, 1,
-0.4129016, 1.05892, 1.311849, 0.03921569, 1, 0, 1,
-0.4017638, 1.953202, 0.585388, 0.03137255, 1, 0, 1,
-0.4010132, 1.37422, -0.9750301, 0.02745098, 1, 0, 1,
-0.4006195, -0.1362315, -0.2138579, 0.01960784, 1, 0, 1,
-0.396286, -1.275742, -2.593728, 0.01568628, 1, 0, 1,
-0.3916647, 0.4432386, 0.4325699, 0.007843138, 1, 0, 1,
-0.3915161, 1.15654, -0.8694091, 0.003921569, 1, 0, 1,
-0.3912846, 0.4156495, -1.501095, 0, 1, 0.003921569, 1,
-0.390056, -1.410517, -3.99503, 0, 1, 0.01176471, 1,
-0.3888887, -2.011791, -4.282182, 0, 1, 0.01568628, 1,
-0.3870712, -1.257081, -1.56354, 0, 1, 0.02352941, 1,
-0.3865832, 1.217966, 1.506154, 0, 1, 0.02745098, 1,
-0.3821027, -0.6391326, -1.358182, 0, 1, 0.03529412, 1,
-0.3805845, -0.7381604, -4.076971, 0, 1, 0.03921569, 1,
-0.3776607, 0.0589732, -2.056952, 0, 1, 0.04705882, 1,
-0.3755371, -0.8923618, -3.789382, 0, 1, 0.05098039, 1,
-0.373031, 0.5397956, -0.9371456, 0, 1, 0.05882353, 1,
-0.3723166, 0.84953, 0.4250438, 0, 1, 0.0627451, 1,
-0.3670867, 0.1133773, 1.02885, 0, 1, 0.07058824, 1,
-0.3632428, -1.126335, -2.84828, 0, 1, 0.07450981, 1,
-0.3620068, 0.0621815, -0.9652309, 0, 1, 0.08235294, 1,
-0.3594958, -0.8130105, -2.472843, 0, 1, 0.08627451, 1,
-0.354214, -1.168584, -2.469815, 0, 1, 0.09411765, 1,
-0.3542007, 0.07575265, 0.5092191, 0, 1, 0.1019608, 1,
-0.3492829, -1.923439, -3.095248, 0, 1, 0.1058824, 1,
-0.3449924, 0.03672368, -1.292859, 0, 1, 0.1137255, 1,
-0.3433203, 1.186104, -1.667717, 0, 1, 0.1176471, 1,
-0.3431561, -1.258776, -3.012379, 0, 1, 0.1254902, 1,
-0.3355764, -2.683591, -3.492119, 0, 1, 0.1294118, 1,
-0.335131, 1.58319, -1.120638, 0, 1, 0.1372549, 1,
-0.3335285, 0.8732646, 0.3235684, 0, 1, 0.1411765, 1,
-0.3334845, 0.1822199, 0.7539777, 0, 1, 0.1490196, 1,
-0.3324195, -0.1127634, -1.578173, 0, 1, 0.1529412, 1,
-0.3301796, -0.5919852, -2.540818, 0, 1, 0.1607843, 1,
-0.3254751, 0.6067806, -0.4658617, 0, 1, 0.1647059, 1,
-0.3223585, 1.196042, 0.4036468, 0, 1, 0.172549, 1,
-0.3221146, -0.1829722, 0.8829871, 0, 1, 0.1764706, 1,
-0.321221, -1.657989, -3.926129, 0, 1, 0.1843137, 1,
-0.3196207, -0.2386842, -2.257607, 0, 1, 0.1882353, 1,
-0.3194486, 0.4103811, -0.2380439, 0, 1, 0.1960784, 1,
-0.3180707, 0.1929915, -0.9940321, 0, 1, 0.2039216, 1,
-0.3167919, -1.094941, -3.510882, 0, 1, 0.2078431, 1,
-0.3146488, -2.058775, -2.955649, 0, 1, 0.2156863, 1,
-0.3134218, -0.3610433, -0.8082049, 0, 1, 0.2196078, 1,
-0.3110654, 1.582042, 1.103852, 0, 1, 0.227451, 1,
-0.3094535, 0.1776383, -1.144778, 0, 1, 0.2313726, 1,
-0.3073862, 0.9255565, 1.262699, 0, 1, 0.2392157, 1,
-0.3070817, -0.9181859, -3.298314, 0, 1, 0.2431373, 1,
-0.3067197, 1.653044, 0.3356583, 0, 1, 0.2509804, 1,
-0.3066316, 1.27288, 0.3087259, 0, 1, 0.254902, 1,
-0.3040493, -0.7961886, -2.786059, 0, 1, 0.2627451, 1,
-0.3039305, -1.357382, -2.559454, 0, 1, 0.2666667, 1,
-0.3035898, 1.644293, 0.6182007, 0, 1, 0.2745098, 1,
-0.2960342, 0.8252127, 1.26938, 0, 1, 0.2784314, 1,
-0.2881398, -0.8855852, -2.548152, 0, 1, 0.2862745, 1,
-0.2873228, -0.6394668, -2.10691, 0, 1, 0.2901961, 1,
-0.2868415, -0.3678217, -1.405662, 0, 1, 0.2980392, 1,
-0.2863658, 0.2408298, -0.65416, 0, 1, 0.3058824, 1,
-0.2848, -1.961462, -1.705969, 0, 1, 0.3098039, 1,
-0.2840461, 0.2191523, -0.01044199, 0, 1, 0.3176471, 1,
-0.2829533, 0.6246845, -1.596859, 0, 1, 0.3215686, 1,
-0.2805332, -0.8038459, -3.213594, 0, 1, 0.3294118, 1,
-0.2734721, 0.7631491, -0.4683771, 0, 1, 0.3333333, 1,
-0.2731422, -0.8458757, -1.403973, 0, 1, 0.3411765, 1,
-0.2690759, 0.4582514, -0.3172369, 0, 1, 0.345098, 1,
-0.2682561, -0.0433225, -3.106932, 0, 1, 0.3529412, 1,
-0.2661165, 0.5379808, -1.649912, 0, 1, 0.3568628, 1,
-0.2641132, -0.4338321, -2.023773, 0, 1, 0.3647059, 1,
-0.2638982, -0.5116457, -1.573938, 0, 1, 0.3686275, 1,
-0.263099, 0.2415096, 0.4336774, 0, 1, 0.3764706, 1,
-0.2628243, -0.5427974, -1.889476, 0, 1, 0.3803922, 1,
-0.2609065, 1.003441, -0.6545841, 0, 1, 0.3882353, 1,
-0.2594191, 2.69006, 1.013209, 0, 1, 0.3921569, 1,
-0.2570004, 1.087733, 0.1753915, 0, 1, 0.4, 1,
-0.252863, 0.1021002, -1.021224, 0, 1, 0.4078431, 1,
-0.2474556, -0.2166437, -2.532579, 0, 1, 0.4117647, 1,
-0.2452403, -1.61643, -3.226982, 0, 1, 0.4196078, 1,
-0.2435194, 0.4155413, -2.044445, 0, 1, 0.4235294, 1,
-0.24229, 0.1141202, -1.853257, 0, 1, 0.4313726, 1,
-0.2399343, -0.2102467, -2.138842, 0, 1, 0.4352941, 1,
-0.2389734, -0.09506834, -2.18296, 0, 1, 0.4431373, 1,
-0.2366065, -0.3065948, -3.567212, 0, 1, 0.4470588, 1,
-0.2337157, -1.100211, -1.176111, 0, 1, 0.454902, 1,
-0.2334208, -0.4787178, -1.010975, 0, 1, 0.4588235, 1,
-0.2280555, 0.6973839, 0.5184705, 0, 1, 0.4666667, 1,
-0.2223136, -0.01128947, -2.227895, 0, 1, 0.4705882, 1,
-0.2204561, -0.1040495, -1.028059, 0, 1, 0.4784314, 1,
-0.2186216, 1.739883, 0.4608466, 0, 1, 0.4823529, 1,
-0.2150966, 1.518622, 0.5530704, 0, 1, 0.4901961, 1,
-0.2113551, 0.5947114, 0.3701922, 0, 1, 0.4941176, 1,
-0.2106006, -0.6790904, -2.759718, 0, 1, 0.5019608, 1,
-0.2097492, 0.3272308, -1.317989, 0, 1, 0.509804, 1,
-0.2032598, -1.312931, -3.453092, 0, 1, 0.5137255, 1,
-0.1952891, 0.1666661, -1.040976, 0, 1, 0.5215687, 1,
-0.193952, -0.46663, -3.814856, 0, 1, 0.5254902, 1,
-0.1876386, 0.838091, -1.986475, 0, 1, 0.5333334, 1,
-0.1847814, -1.161517, -3.090299, 0, 1, 0.5372549, 1,
-0.1779173, 0.5167207, -0.9158202, 0, 1, 0.5450981, 1,
-0.1778714, -0.2457006, -2.449233, 0, 1, 0.5490196, 1,
-0.1778354, 0.5588687, -0.5906721, 0, 1, 0.5568628, 1,
-0.1733597, 0.3718184, 0.3384039, 0, 1, 0.5607843, 1,
-0.1713353, 0.164068, -2.132015, 0, 1, 0.5686275, 1,
-0.1694289, -0.6471898, -3.170291, 0, 1, 0.572549, 1,
-0.1681032, -1.891956, -3.363614, 0, 1, 0.5803922, 1,
-0.1637221, 0.4899746, 0.2526194, 0, 1, 0.5843138, 1,
-0.1630387, 0.4008498, -0.9942688, 0, 1, 0.5921569, 1,
-0.1592992, 1.70189, 0.04739222, 0, 1, 0.5960785, 1,
-0.1585124, -0.1646069, -2.552311, 0, 1, 0.6039216, 1,
-0.1568647, -0.06910078, -3.190733, 0, 1, 0.6117647, 1,
-0.1563468, 0.09422711, -0.4241396, 0, 1, 0.6156863, 1,
-0.1555194, 0.5875399, -0.4877358, 0, 1, 0.6235294, 1,
-0.1500586, -1.362586, -3.973441, 0, 1, 0.627451, 1,
-0.1376915, -1.203089, -4.822645, 0, 1, 0.6352941, 1,
-0.1372784, -1.769162, -1.534848, 0, 1, 0.6392157, 1,
-0.1321011, -0.7436544, -2.158322, 0, 1, 0.6470588, 1,
-0.130083, 0.89091, -0.8536808, 0, 1, 0.6509804, 1,
-0.1298612, -0.2190985, -1.299019, 0, 1, 0.6588235, 1,
-0.1283859, -1.17504, -2.245964, 0, 1, 0.6627451, 1,
-0.1280005, 0.1121585, -0.229243, 0, 1, 0.6705883, 1,
-0.1270372, 0.535902, -2.023222, 0, 1, 0.6745098, 1,
-0.1205873, 0.7834197, 0.2967085, 0, 1, 0.682353, 1,
-0.1185903, -0.7451056, -2.969301, 0, 1, 0.6862745, 1,
-0.1175876, 0.509481, -0.2878634, 0, 1, 0.6941177, 1,
-0.1159254, 0.6620057, -0.09138346, 0, 1, 0.7019608, 1,
-0.1157645, -0.7170919, -1.645582, 0, 1, 0.7058824, 1,
-0.1134692, 0.8517662, 0.310367, 0, 1, 0.7137255, 1,
-0.1078144, -0.2369176, -2.15365, 0, 1, 0.7176471, 1,
-0.1044161, 1.557931, -1.575408, 0, 1, 0.7254902, 1,
-0.1019249, 2.449835, -0.5540314, 0, 1, 0.7294118, 1,
-0.09763315, -0.7699169, -3.214228, 0, 1, 0.7372549, 1,
-0.09673256, 0.3127854, -0.5602005, 0, 1, 0.7411765, 1,
-0.09547023, 1.333887, -0.5745872, 0, 1, 0.7490196, 1,
-0.09522017, 0.4258569, -1.55681, 0, 1, 0.7529412, 1,
-0.0931072, -0.4173125, -2.417783, 0, 1, 0.7607843, 1,
-0.09049356, -1.078684, -2.446178, 0, 1, 0.7647059, 1,
-0.08831736, 0.5223843, -0.6141071, 0, 1, 0.772549, 1,
-0.0875711, -0.05480278, -2.23088, 0, 1, 0.7764706, 1,
-0.08661522, -0.09933506, -2.561353, 0, 1, 0.7843137, 1,
-0.08633254, 0.2402917, -2.129019, 0, 1, 0.7882353, 1,
-0.08429047, 1.046307, -1.853451, 0, 1, 0.7960784, 1,
-0.07728629, -1.059639, -3.596471, 0, 1, 0.8039216, 1,
-0.07562529, -1.474698, -3.69815, 0, 1, 0.8078431, 1,
-0.06989747, 0.1971556, -1.42941, 0, 1, 0.8156863, 1,
-0.06858128, -2.486241, -2.355879, 0, 1, 0.8196079, 1,
-0.06631611, 1.612304, -0.7067891, 0, 1, 0.827451, 1,
-0.06592125, 0.1017119, -0.3005681, 0, 1, 0.8313726, 1,
-0.06092981, 0.6780283, -0.5799413, 0, 1, 0.8392157, 1,
-0.05963156, 0.5752458, 1.60374, 0, 1, 0.8431373, 1,
-0.05715908, 2.581128, -0.2007533, 0, 1, 0.8509804, 1,
-0.05629838, 0.6527452, 0.77098, 0, 1, 0.854902, 1,
-0.05422853, 0.2448772, 1.107202, 0, 1, 0.8627451, 1,
-0.05407793, 2.372199, -0.8197998, 0, 1, 0.8666667, 1,
-0.05073128, -1.796941, -3.090451, 0, 1, 0.8745098, 1,
-0.04630859, -2.101301, -4.856494, 0, 1, 0.8784314, 1,
-0.04358239, -0.689099, -3.213147, 0, 1, 0.8862745, 1,
-0.03824485, -0.3954021, -4.186322, 0, 1, 0.8901961, 1,
-0.03235721, 1.497549, 1.226277, 0, 1, 0.8980392, 1,
-0.03163006, -0.9085926, -5.065899, 0, 1, 0.9058824, 1,
-0.02853701, -0.1560971, -3.467897, 0, 1, 0.9098039, 1,
-0.02535727, 0.2065625, -1.894995, 0, 1, 0.9176471, 1,
-0.02409465, -1.482364, -4.931083, 0, 1, 0.9215686, 1,
-0.02381199, -1.589769, -3.111336, 0, 1, 0.9294118, 1,
-0.02277401, -0.9540267, -4.732332, 0, 1, 0.9333333, 1,
-0.02257871, -0.1298861, -2.35199, 0, 1, 0.9411765, 1,
-0.02196541, 0.3461974, -1.327595, 0, 1, 0.945098, 1,
-0.02010571, -0.5102595, -3.078257, 0, 1, 0.9529412, 1,
-0.01533293, -0.3906329, -2.846839, 0, 1, 0.9568627, 1,
-0.01461407, -0.1181409, -2.828499, 0, 1, 0.9647059, 1,
-0.01200533, 0.1773761, 0.7009186, 0, 1, 0.9686275, 1,
-0.008857544, -0.9590735, -3.605497, 0, 1, 0.9764706, 1,
-0.004532345, 0.5763657, 0.7074699, 0, 1, 0.9803922, 1,
-0.002407361, 1.902331, 0.9943992, 0, 1, 0.9882353, 1,
0.00113211, 1.590012, 0.9956324, 0, 1, 0.9921569, 1,
0.003435577, 1.538651, -1.484848, 0, 1, 1, 1,
0.007502921, -0.6520886, 4.393212, 0, 0.9921569, 1, 1,
0.009526879, -0.5307649, 2.810691, 0, 0.9882353, 1, 1,
0.01036812, -1.371851, 3.189462, 0, 0.9803922, 1, 1,
0.01190386, -1.04159, 2.448219, 0, 0.9764706, 1, 1,
0.01660166, -1.526651, 2.457563, 0, 0.9686275, 1, 1,
0.01669163, 0.82377, -1.92252, 0, 0.9647059, 1, 1,
0.01682535, 0.6699698, 0.4772712, 0, 0.9568627, 1, 1,
0.01716783, -0.4188582, 3.068589, 0, 0.9529412, 1, 1,
0.01798728, 0.4684643, -0.2401721, 0, 0.945098, 1, 1,
0.01806344, -0.2146575, 4.301919, 0, 0.9411765, 1, 1,
0.01828412, 1.403454, -2.050315, 0, 0.9333333, 1, 1,
0.01830765, 1.194618, -0.2717706, 0, 0.9294118, 1, 1,
0.0204949, -0.4045146, 4.549858, 0, 0.9215686, 1, 1,
0.0220093, -0.5738124, 2.122365, 0, 0.9176471, 1, 1,
0.02306068, -0.6281825, 2.336239, 0, 0.9098039, 1, 1,
0.02319172, 0.658269, 0.5612738, 0, 0.9058824, 1, 1,
0.02487146, -2.26865, 3.565973, 0, 0.8980392, 1, 1,
0.02573784, -1.288465, 2.156254, 0, 0.8901961, 1, 1,
0.02888134, -0.7759928, 2.792601, 0, 0.8862745, 1, 1,
0.02966526, 0.1411537, 1.141515, 0, 0.8784314, 1, 1,
0.03023922, 0.1962582, -2.466733, 0, 0.8745098, 1, 1,
0.03291865, -0.8814148, 1.581364, 0, 0.8666667, 1, 1,
0.03312656, 0.3306526, 1.056667, 0, 0.8627451, 1, 1,
0.03409719, -0.2585387, 5.048071, 0, 0.854902, 1, 1,
0.04047824, 0.4770437, 1.435147, 0, 0.8509804, 1, 1,
0.04611433, 0.2265089, -0.7037587, 0, 0.8431373, 1, 1,
0.04735853, 0.6178785, -0.4274139, 0, 0.8392157, 1, 1,
0.05002594, -1.075501, 2.892832, 0, 0.8313726, 1, 1,
0.05048214, -0.8571821, 5.545024, 0, 0.827451, 1, 1,
0.05151062, -0.8060626, 4.044545, 0, 0.8196079, 1, 1,
0.05387311, -1.214473, 2.463548, 0, 0.8156863, 1, 1,
0.05534327, -0.133309, 2.566606, 0, 0.8078431, 1, 1,
0.05577797, 0.0936558, -0.4216575, 0, 0.8039216, 1, 1,
0.08498809, -0.006501024, 3.432732, 0, 0.7960784, 1, 1,
0.08557549, 0.7586901, 1.749287, 0, 0.7882353, 1, 1,
0.08606308, 0.2905941, 0.7536248, 0, 0.7843137, 1, 1,
0.08640615, -1.234912, 3.088338, 0, 0.7764706, 1, 1,
0.09156764, 1.869152, 1.812085, 0, 0.772549, 1, 1,
0.0929587, -0.2331547, 3.210036, 0, 0.7647059, 1, 1,
0.0934899, 0.5422069, 0.09735072, 0, 0.7607843, 1, 1,
0.0939526, 0.2785794, 1.911111, 0, 0.7529412, 1, 1,
0.09973141, 0.5958366, -0.1132766, 0, 0.7490196, 1, 1,
0.1068628, 1.014005, 0.1881051, 0, 0.7411765, 1, 1,
0.1079268, -1.769454, 3.599757, 0, 0.7372549, 1, 1,
0.1117135, -0.1842152, 2.730757, 0, 0.7294118, 1, 1,
0.1168462, 1.21633, 0.4967974, 0, 0.7254902, 1, 1,
0.1212763, -0.1670095, 1.757822, 0, 0.7176471, 1, 1,
0.1225652, -0.3931355, 2.17628, 0, 0.7137255, 1, 1,
0.1234853, -0.3233344, 2.182202, 0, 0.7058824, 1, 1,
0.1236257, 2.015152, -0.6945543, 0, 0.6980392, 1, 1,
0.1245782, 0.3432389, 1.273816, 0, 0.6941177, 1, 1,
0.1247132, -0.7112816, 3.679143, 0, 0.6862745, 1, 1,
0.1248935, 0.5853763, 0.8043002, 0, 0.682353, 1, 1,
0.124914, -0.04992441, 2.83932, 0, 0.6745098, 1, 1,
0.1282236, -0.3615212, 3.748342, 0, 0.6705883, 1, 1,
0.1312508, 0.2868155, 2.394466, 0, 0.6627451, 1, 1,
0.1394305, 0.6906009, -0.2201876, 0, 0.6588235, 1, 1,
0.144089, -1.731794, 2.591539, 0, 0.6509804, 1, 1,
0.1519017, -1.165411, 4.673697, 0, 0.6470588, 1, 1,
0.1537716, -0.3404014, 2.723094, 0, 0.6392157, 1, 1,
0.1555158, -1.581336, 2.592798, 0, 0.6352941, 1, 1,
0.1607918, -3.422368, 3.904014, 0, 0.627451, 1, 1,
0.1618658, -0.1099616, 2.210731, 0, 0.6235294, 1, 1,
0.1655536, 0.2228488, 0.7322191, 0, 0.6156863, 1, 1,
0.1764093, 1.363556, 1.61056, 0, 0.6117647, 1, 1,
0.1771993, -0.4531335, 3.454957, 0, 0.6039216, 1, 1,
0.1795836, -0.2769065, 2.911315, 0, 0.5960785, 1, 1,
0.1803135, -2.068254, 3.110963, 0, 0.5921569, 1, 1,
0.1804389, 0.07057619, 1.142383, 0, 0.5843138, 1, 1,
0.1814459, 0.6591554, -0.02687788, 0, 0.5803922, 1, 1,
0.1817804, 0.7858418, 2.54362, 0, 0.572549, 1, 1,
0.1838121, -0.1966634, 1.957143, 0, 0.5686275, 1, 1,
0.183872, -0.9889311, 4.730934, 0, 0.5607843, 1, 1,
0.1846846, -0.5466105, 3.38378, 0, 0.5568628, 1, 1,
0.1869379, -0.09400932, 1.409487, 0, 0.5490196, 1, 1,
0.1920459, 0.2276629, 0.2649223, 0, 0.5450981, 1, 1,
0.1964115, -1.680897, 3.40867, 0, 0.5372549, 1, 1,
0.1971122, -0.03863671, 1.743536, 0, 0.5333334, 1, 1,
0.1977093, -1.567572, 4.462811, 0, 0.5254902, 1, 1,
0.203661, 1.597525, 1.618023, 0, 0.5215687, 1, 1,
0.2039423, 0.8975263, -1.125779, 0, 0.5137255, 1, 1,
0.2040417, 1.483473, -0.8851139, 0, 0.509804, 1, 1,
0.2055225, 0.9071323, 0.400663, 0, 0.5019608, 1, 1,
0.2067635, -0.7174846, 2.202784, 0, 0.4941176, 1, 1,
0.2071873, -0.4228609, 4.357401, 0, 0.4901961, 1, 1,
0.2113137, 1.39031, 1.004032, 0, 0.4823529, 1, 1,
0.2131542, 0.594296, -0.8786477, 0, 0.4784314, 1, 1,
0.2141465, -0.2073499, 2.177082, 0, 0.4705882, 1, 1,
0.2251019, -1.04849, 3.996386, 0, 0.4666667, 1, 1,
0.2259702, 0.4119502, 0.7600373, 0, 0.4588235, 1, 1,
0.2348145, -0.7964696, 1.749214, 0, 0.454902, 1, 1,
0.2349684, -1.785506, 2.700496, 0, 0.4470588, 1, 1,
0.2357229, 0.3172682, 1.009944, 0, 0.4431373, 1, 1,
0.2383884, 0.008096204, 1.306916, 0, 0.4352941, 1, 1,
0.2430272, 0.4464927, 2.315972, 0, 0.4313726, 1, 1,
0.2432555, 0.5512911, 0.3662025, 0, 0.4235294, 1, 1,
0.2489086, 1.613034, 2.3049, 0, 0.4196078, 1, 1,
0.2504389, -1.239465, 1.242214, 0, 0.4117647, 1, 1,
0.2516073, -0.3039482, 2.522844, 0, 0.4078431, 1, 1,
0.2582172, 0.6220384, -0.8813449, 0, 0.4, 1, 1,
0.2624285, 0.3340977, -0.2671536, 0, 0.3921569, 1, 1,
0.2665835, -1.397125, 4.108263, 0, 0.3882353, 1, 1,
0.2710918, -0.5250556, 2.749595, 0, 0.3803922, 1, 1,
0.2801387, -0.1813524, 2.676457, 0, 0.3764706, 1, 1,
0.2817155, 0.8213789, 0.5281652, 0, 0.3686275, 1, 1,
0.2855128, -1.181183, 5.132342, 0, 0.3647059, 1, 1,
0.28651, -0.1880987, 2.371554, 0, 0.3568628, 1, 1,
0.2940699, -2.228296, 2.517079, 0, 0.3529412, 1, 1,
0.2949221, -0.7523805, 4.915986, 0, 0.345098, 1, 1,
0.294965, -1.156299, 3.039348, 0, 0.3411765, 1, 1,
0.2956279, -0.4184478, 2.884629, 0, 0.3333333, 1, 1,
0.2987567, 0.1280769, 2.792377, 0, 0.3294118, 1, 1,
0.3066439, 1.164758, 1.561886, 0, 0.3215686, 1, 1,
0.3088832, -0.5689791, 4.802827, 0, 0.3176471, 1, 1,
0.3180631, 1.771349, -0.1566902, 0, 0.3098039, 1, 1,
0.3181419, -0.07274108, 2.008794, 0, 0.3058824, 1, 1,
0.3199539, 0.2972797, 0.3573108, 0, 0.2980392, 1, 1,
0.3204928, 0.7886586, -0.3562804, 0, 0.2901961, 1, 1,
0.3205656, -0.3656417, 0.9328101, 0, 0.2862745, 1, 1,
0.3206952, -1.042557, 1.315463, 0, 0.2784314, 1, 1,
0.3214989, -0.3421517, 0.1959091, 0, 0.2745098, 1, 1,
0.3224526, 0.05795424, 1.260833, 0, 0.2666667, 1, 1,
0.3250427, -0.656476, 6.300524, 0, 0.2627451, 1, 1,
0.3282298, -1.523271, 2.416284, 0, 0.254902, 1, 1,
0.3308669, 0.500363, 1.694786, 0, 0.2509804, 1, 1,
0.3333496, -0.0999239, 0.6097385, 0, 0.2431373, 1, 1,
0.3342665, 0.3002277, 1.241981, 0, 0.2392157, 1, 1,
0.3367383, -0.4958444, 3.95241, 0, 0.2313726, 1, 1,
0.3382216, 0.5159468, 0.6420679, 0, 0.227451, 1, 1,
0.3419339, 0.7301601, 0.8419651, 0, 0.2196078, 1, 1,
0.3439001, 0.5605314, 2.475358, 0, 0.2156863, 1, 1,
0.3463916, -0.1127226, 1.56863, 0, 0.2078431, 1, 1,
0.3466778, -0.2328195, 1.504434, 0, 0.2039216, 1, 1,
0.3493956, 0.6295429, -1.628431, 0, 0.1960784, 1, 1,
0.3548443, 0.03336114, 0.3023111, 0, 0.1882353, 1, 1,
0.3607337, 0.4553805, -1.233262, 0, 0.1843137, 1, 1,
0.3615659, -1.825616, 2.893634, 0, 0.1764706, 1, 1,
0.3619267, -0.8570649, 3.758113, 0, 0.172549, 1, 1,
0.3622278, -0.382223, 2.600377, 0, 0.1647059, 1, 1,
0.3652472, -0.4035032, 3.878596, 0, 0.1607843, 1, 1,
0.3657656, 0.06136381, 3.571321, 0, 0.1529412, 1, 1,
0.3668398, -0.4973408, 0.885156, 0, 0.1490196, 1, 1,
0.3708881, 0.692351, 1.628542, 0, 0.1411765, 1, 1,
0.3710649, -0.4188436, 2.55653, 0, 0.1372549, 1, 1,
0.3728249, 0.7464178, 1.999066, 0, 0.1294118, 1, 1,
0.3758205, -0.2643755, 2.228895, 0, 0.1254902, 1, 1,
0.379905, -1.587072, 4.322311, 0, 0.1176471, 1, 1,
0.3803412, -1.170081, 3.142342, 0, 0.1137255, 1, 1,
0.3858184, -0.301383, 0.56441, 0, 0.1058824, 1, 1,
0.3949786, -0.6060384, 1.994847, 0, 0.09803922, 1, 1,
0.3967076, 2.373628, 0.2334122, 0, 0.09411765, 1, 1,
0.3997646, 0.1059417, 0.7543973, 0, 0.08627451, 1, 1,
0.4050812, 0.3355963, 0.05972563, 0, 0.08235294, 1, 1,
0.4116288, 0.2427552, 0.2141933, 0, 0.07450981, 1, 1,
0.4122257, -0.8968902, 4.418468, 0, 0.07058824, 1, 1,
0.4129128, 0.6753379, 0.5556257, 0, 0.0627451, 1, 1,
0.4138537, -0.9796084, 4.338433, 0, 0.05882353, 1, 1,
0.4140128, -1.404088, 4.166202, 0, 0.05098039, 1, 1,
0.4153062, -0.05803083, -0.2109811, 0, 0.04705882, 1, 1,
0.4174698, -0.06328464, 3.019642, 0, 0.03921569, 1, 1,
0.4189406, 0.937008, 0.6230838, 0, 0.03529412, 1, 1,
0.4189959, 0.9079888, -0.6163966, 0, 0.02745098, 1, 1,
0.4242155, -0.870392, 4.555731, 0, 0.02352941, 1, 1,
0.426127, -2.224188, 3.884517, 0, 0.01568628, 1, 1,
0.4324704, -1.41277, 3.579908, 0, 0.01176471, 1, 1,
0.4342936, 0.8059112, 0.1617138, 0, 0.003921569, 1, 1,
0.435109, 1.268292, 0.3812791, 0.003921569, 0, 1, 1,
0.4373834, 0.109161, 2.145803, 0.007843138, 0, 1, 1,
0.438581, 0.1343524, 0.7267899, 0.01568628, 0, 1, 1,
0.4399313, -1.36528, 2.436568, 0.01960784, 0, 1, 1,
0.4473054, -1.123465, 3.252409, 0.02745098, 0, 1, 1,
0.4478828, 0.9061548, 0.8645724, 0.03137255, 0, 1, 1,
0.4495007, 0.579008, 1.551388, 0.03921569, 0, 1, 1,
0.4532045, 1.197176, 1.320138, 0.04313726, 0, 1, 1,
0.4538702, 1.203444, 1.414971, 0.05098039, 0, 1, 1,
0.4555688, -0.4097922, 0.683248, 0.05490196, 0, 1, 1,
0.4566667, -0.09929264, 2.616745, 0.0627451, 0, 1, 1,
0.4566743, -0.5210095, 1.141631, 0.06666667, 0, 1, 1,
0.4575352, 0.01713089, 0.3068392, 0.07450981, 0, 1, 1,
0.458285, -0.09550866, 1.575342, 0.07843138, 0, 1, 1,
0.464406, -0.1529454, 1.579423, 0.08627451, 0, 1, 1,
0.4644919, -1.933425, 2.760884, 0.09019608, 0, 1, 1,
0.4676635, -0.8375428, 2.827219, 0.09803922, 0, 1, 1,
0.4704262, 0.4075321, -0.694643, 0.1058824, 0, 1, 1,
0.4750618, -0.9209597, 3.11669, 0.1098039, 0, 1, 1,
0.475739, 0.2101392, 1.113941, 0.1176471, 0, 1, 1,
0.4898482, 0.4450204, 0.3695706, 0.1215686, 0, 1, 1,
0.4946676, -1.317229, 4.156421, 0.1294118, 0, 1, 1,
0.4979656, 0.3578821, 0.6705782, 0.1333333, 0, 1, 1,
0.4998147, -0.6219269, 3.20605, 0.1411765, 0, 1, 1,
0.5007103, -1.05992, 4.171319, 0.145098, 0, 1, 1,
0.5052211, -1.76438, 4.641617, 0.1529412, 0, 1, 1,
0.5082164, -0.4766855, 2.321613, 0.1568628, 0, 1, 1,
0.5109502, 0.0316171, 1.082927, 0.1647059, 0, 1, 1,
0.5128148, -1.007726, 2.731932, 0.1686275, 0, 1, 1,
0.5174546, -0.07463522, 0.8299045, 0.1764706, 0, 1, 1,
0.5208112, 0.3991162, 1.418414, 0.1803922, 0, 1, 1,
0.5224384, 0.1375444, 1.221936, 0.1882353, 0, 1, 1,
0.5263504, 0.5547547, 1.553542, 0.1921569, 0, 1, 1,
0.5302017, -1.026632, 3.288943, 0.2, 0, 1, 1,
0.5433931, -0.3883186, 2.36431, 0.2078431, 0, 1, 1,
0.5440391, -0.5012059, 0.1762482, 0.2117647, 0, 1, 1,
0.545931, -1.279962, 1.300067, 0.2196078, 0, 1, 1,
0.5479057, 0.9759758, -1.165264, 0.2235294, 0, 1, 1,
0.5480413, -0.9557595, 3.092953, 0.2313726, 0, 1, 1,
0.5491894, 0.5960495, 0.5411, 0.2352941, 0, 1, 1,
0.5496508, -0.3148771, 1.673399, 0.2431373, 0, 1, 1,
0.555898, -1.088403, 0.4774333, 0.2470588, 0, 1, 1,
0.5569912, 0.1271899, 0.177868, 0.254902, 0, 1, 1,
0.5593155, 1.26099, -0.03042178, 0.2588235, 0, 1, 1,
0.5599748, -0.3760662, 3.311701, 0.2666667, 0, 1, 1,
0.5638618, -0.4689136, 2.438094, 0.2705882, 0, 1, 1,
0.5657017, -0.1216743, 1.583936, 0.2784314, 0, 1, 1,
0.5715981, -0.1332117, 0.2830838, 0.282353, 0, 1, 1,
0.572638, 0.1631083, 2.153211, 0.2901961, 0, 1, 1,
0.5733954, -0.736083, 2.340173, 0.2941177, 0, 1, 1,
0.5751376, 1.583623, 1.174146, 0.3019608, 0, 1, 1,
0.5755563, -0.4074, 4.300406, 0.3098039, 0, 1, 1,
0.5828235, -1.581279, 3.842168, 0.3137255, 0, 1, 1,
0.587548, -0.2406519, 2.56194, 0.3215686, 0, 1, 1,
0.5881276, 0.4111667, 2.788682, 0.3254902, 0, 1, 1,
0.5894986, 0.2927528, 1.23321, 0.3333333, 0, 1, 1,
0.5907564, 1.072768, 2.171848, 0.3372549, 0, 1, 1,
0.591624, -1.018586, 2.807472, 0.345098, 0, 1, 1,
0.5923247, 1.281185, 0.5285903, 0.3490196, 0, 1, 1,
0.5958189, -1.096419, 2.790068, 0.3568628, 0, 1, 1,
0.5979893, 0.08701609, 1.453462, 0.3607843, 0, 1, 1,
0.6038114, -0.3624804, 2.047109, 0.3686275, 0, 1, 1,
0.6038256, 0.2099438, 0.8773302, 0.372549, 0, 1, 1,
0.6071805, 2.473557, 0.8196234, 0.3803922, 0, 1, 1,
0.6103952, 0.5000179, 1.548055, 0.3843137, 0, 1, 1,
0.6159278, -1.430467, 1.991246, 0.3921569, 0, 1, 1,
0.6184983, -0.5280514, -0.08603047, 0.3960784, 0, 1, 1,
0.6191455, 1.840727, -0.7460138, 0.4039216, 0, 1, 1,
0.6225194, 0.3420906, 1.598072, 0.4117647, 0, 1, 1,
0.6252234, -0.536731, 1.254812, 0.4156863, 0, 1, 1,
0.6256541, -0.8109381, 2.138194, 0.4235294, 0, 1, 1,
0.6257261, 1.127877, 0.5897884, 0.427451, 0, 1, 1,
0.6312488, -1.352466, 1.391715, 0.4352941, 0, 1, 1,
0.635514, 0.8384736, 1.974935, 0.4392157, 0, 1, 1,
0.6388804, -0.7292089, 2.656667, 0.4470588, 0, 1, 1,
0.6390335, -1.268141, 2.602955, 0.4509804, 0, 1, 1,
0.6436377, 0.1874252, 0.7115045, 0.4588235, 0, 1, 1,
0.6529074, -1.024598, 2.818134, 0.4627451, 0, 1, 1,
0.6597108, 0.1556222, 1.711529, 0.4705882, 0, 1, 1,
0.665664, -0.7565166, 1.770429, 0.4745098, 0, 1, 1,
0.669781, -0.298324, 1.938382, 0.4823529, 0, 1, 1,
0.6707976, 1.111468, 0.5585923, 0.4862745, 0, 1, 1,
0.6787581, 0.2346684, 1.15964, 0.4941176, 0, 1, 1,
0.6795827, -0.5574299, 2.937141, 0.5019608, 0, 1, 1,
0.6804106, -0.786577, 1.834214, 0.5058824, 0, 1, 1,
0.6809213, -1.296774, 0.5940052, 0.5137255, 0, 1, 1,
0.6809964, -0.7888377, 2.580047, 0.5176471, 0, 1, 1,
0.6825561, -2.017835, 2.081502, 0.5254902, 0, 1, 1,
0.6845985, 0.4858173, -0.7518259, 0.5294118, 0, 1, 1,
0.6849887, -0.8752075, 3.833732, 0.5372549, 0, 1, 1,
0.6895584, 1.852724, 1.470091, 0.5411765, 0, 1, 1,
0.6907951, -0.8707656, 3.091276, 0.5490196, 0, 1, 1,
0.7038458, -0.9424846, 2.274053, 0.5529412, 0, 1, 1,
0.7040953, 0.4937519, 1.411022, 0.5607843, 0, 1, 1,
0.7086499, -0.5521519, 1.506548, 0.5647059, 0, 1, 1,
0.7092255, 1.256028, 1.686849, 0.572549, 0, 1, 1,
0.709243, -1.317867, 1.954435, 0.5764706, 0, 1, 1,
0.7106698, -1.383232, 3.695956, 0.5843138, 0, 1, 1,
0.7175897, -0.5048075, 0.3121866, 0.5882353, 0, 1, 1,
0.7177523, -1.593239, 2.012868, 0.5960785, 0, 1, 1,
0.7203869, -1.351089, 1.458365, 0.6039216, 0, 1, 1,
0.7222456, -0.6863611, 1.888826, 0.6078432, 0, 1, 1,
0.7307424, -0.869738, 3.601546, 0.6156863, 0, 1, 1,
0.730979, 0.9304322, 1.239257, 0.6196079, 0, 1, 1,
0.7324636, 0.8553094, 2.811492, 0.627451, 0, 1, 1,
0.7356625, -0.5597761, 2.59364, 0.6313726, 0, 1, 1,
0.741366, -0.6939167, 1.645263, 0.6392157, 0, 1, 1,
0.751332, 1.582703, 1.815719, 0.6431373, 0, 1, 1,
0.7552213, -1.517023, 1.595648, 0.6509804, 0, 1, 1,
0.7571213, 0.9523348, 0.9785238, 0.654902, 0, 1, 1,
0.7587035, 0.08142102, 0.9406031, 0.6627451, 0, 1, 1,
0.7598878, -0.3222352, 1.407838, 0.6666667, 0, 1, 1,
0.7629285, 0.1239116, 0.4924414, 0.6745098, 0, 1, 1,
0.765891, 0.443319, 3.133391, 0.6784314, 0, 1, 1,
0.7704051, 1.644681, 0.4953472, 0.6862745, 0, 1, 1,
0.7707347, -0.07259902, 2.288164, 0.6901961, 0, 1, 1,
0.7707745, -1.508978, 2.112062, 0.6980392, 0, 1, 1,
0.7713233, 1.226324, 0.3021713, 0.7058824, 0, 1, 1,
0.7767132, -1.503022, 3.304924, 0.7098039, 0, 1, 1,
0.7796937, -0.5829147, 2.912498, 0.7176471, 0, 1, 1,
0.7824643, -0.7104574, -0.5608689, 0.7215686, 0, 1, 1,
0.7834713, -0.1232339, 2.898241, 0.7294118, 0, 1, 1,
0.7934805, 1.148777, 2.476967, 0.7333333, 0, 1, 1,
0.794251, 0.2258785, 1.080381, 0.7411765, 0, 1, 1,
0.7951514, 0.2804625, 1.27177, 0.7450981, 0, 1, 1,
0.7961439, 1.265188, 1.650493, 0.7529412, 0, 1, 1,
0.7963802, 1.211044, 1.291901, 0.7568628, 0, 1, 1,
0.7972671, 1.602559, -0.1569863, 0.7647059, 0, 1, 1,
0.8004751, 0.3889177, 0.1806458, 0.7686275, 0, 1, 1,
0.8022924, -1.531942, 2.537121, 0.7764706, 0, 1, 1,
0.8082832, 1.470266, 1.114384, 0.7803922, 0, 1, 1,
0.8130031, 1.51867, 2.000336, 0.7882353, 0, 1, 1,
0.8133779, -1.009213, 0.8114787, 0.7921569, 0, 1, 1,
0.8148019, -1.507025, 3.033064, 0.8, 0, 1, 1,
0.8160018, -0.481973, 3.045442, 0.8078431, 0, 1, 1,
0.8172147, -0.3320941, 1.217065, 0.8117647, 0, 1, 1,
0.8245637, -0.4958006, 2.294495, 0.8196079, 0, 1, 1,
0.8357584, -1.3992, 3.842818, 0.8235294, 0, 1, 1,
0.8383671, -0.08372815, 1.587369, 0.8313726, 0, 1, 1,
0.8399138, 1.571836, 0.1381785, 0.8352941, 0, 1, 1,
0.8411949, -0.7786959, 1.499301, 0.8431373, 0, 1, 1,
0.860065, 1.515697, 1.196451, 0.8470588, 0, 1, 1,
0.8628983, -0.6578179, 2.804136, 0.854902, 0, 1, 1,
0.8662976, -2.263397, 3.680149, 0.8588235, 0, 1, 1,
0.8756723, -0.5252437, 1.583626, 0.8666667, 0, 1, 1,
0.8844689, 1.220108, 0.08522736, 0.8705882, 0, 1, 1,
0.8945214, -0.0718533, -0.336429, 0.8784314, 0, 1, 1,
0.8955743, -1.520177, 2.628452, 0.8823529, 0, 1, 1,
0.9086341, -0.02547128, 0.6957133, 0.8901961, 0, 1, 1,
0.9096594, -0.9789777, 1.611559, 0.8941177, 0, 1, 1,
0.9110023, -0.9712111, 2.601493, 0.9019608, 0, 1, 1,
0.9136618, -2.593817, 2.957971, 0.9098039, 0, 1, 1,
0.9212982, 1.781702, 1.674211, 0.9137255, 0, 1, 1,
0.922503, -0.5700077, 3.061409, 0.9215686, 0, 1, 1,
0.9269244, -1.196012, 2.848118, 0.9254902, 0, 1, 1,
0.9329458, -0.4157929, 1.404695, 0.9333333, 0, 1, 1,
0.9331602, -0.003485238, 0.7150149, 0.9372549, 0, 1, 1,
0.9341601, -1.727935, 2.266543, 0.945098, 0, 1, 1,
0.9349216, 0.3427043, 1.870135, 0.9490196, 0, 1, 1,
0.9413133, 0.5258845, 2.923373, 0.9568627, 0, 1, 1,
0.94333, 0.08725987, 1.458706, 0.9607843, 0, 1, 1,
0.9444148, 0.4858489, -0.2268565, 0.9686275, 0, 1, 1,
0.9445394, 1.19576, 1.369334, 0.972549, 0, 1, 1,
0.946328, 0.1602218, -0.01697746, 0.9803922, 0, 1, 1,
0.9464374, 0.8588316, 2.415118, 0.9843137, 0, 1, 1,
0.9494401, 0.5587491, -0.310965, 0.9921569, 0, 1, 1,
0.9537836, 0.4118565, 2.160412, 0.9960784, 0, 1, 1,
0.9556993, 0.4955602, 1.381184, 1, 0, 0.9960784, 1,
0.9670704, -1.29424, 3.092678, 1, 0, 0.9882353, 1,
0.9696116, 0.5024921, 0.6244403, 1, 0, 0.9843137, 1,
0.9813505, 0.7820133, 0.1188516, 1, 0, 0.9764706, 1,
0.984408, -0.7078472, 1.21088, 1, 0, 0.972549, 1,
0.9872373, 0.1743074, 2.351315, 1, 0, 0.9647059, 1,
0.9900623, -1.998995, 1.430904, 1, 0, 0.9607843, 1,
0.9936678, -0.3781296, 2.363591, 1, 0, 0.9529412, 1,
0.9994312, -1.278098, 0.9803209, 1, 0, 0.9490196, 1,
1.00452, -1.468953, 3.233476, 1, 0, 0.9411765, 1,
1.005045, -0.6653944, 1.664557, 1, 0, 0.9372549, 1,
1.012034, 2.474559, -1.099913, 1, 0, 0.9294118, 1,
1.013017, 0.3672195, 1.242546, 1, 0, 0.9254902, 1,
1.014592, -1.392264, 2.853445, 1, 0, 0.9176471, 1,
1.016287, -1.331002, 3.906344, 1, 0, 0.9137255, 1,
1.018043, 0.8178747, 1.170999, 1, 0, 0.9058824, 1,
1.022739, -1.153799, 3.306663, 1, 0, 0.9019608, 1,
1.029768, -0.05898357, 0.8196457, 1, 0, 0.8941177, 1,
1.03309, 1.675655, -0.009225513, 1, 0, 0.8862745, 1,
1.035215, -0.6629132, 3.6853, 1, 0, 0.8823529, 1,
1.043585, 0.7111731, 0.2448845, 1, 0, 0.8745098, 1,
1.047114, 1.081128, 2.027044, 1, 0, 0.8705882, 1,
1.048704, 1.121338, 0.1713683, 1, 0, 0.8627451, 1,
1.048907, 0.9043157, 0.6410956, 1, 0, 0.8588235, 1,
1.050344, 0.5205803, 1.308764, 1, 0, 0.8509804, 1,
1.060296, 2.228285, -0.3782629, 1, 0, 0.8470588, 1,
1.063567, 0.5479072, -1.83069, 1, 0, 0.8392157, 1,
1.075026, -0.6309351, 3.155884, 1, 0, 0.8352941, 1,
1.081675, -1.172962, 2.249461, 1, 0, 0.827451, 1,
1.098604, -1.357572, 2.611595, 1, 0, 0.8235294, 1,
1.098611, -1.324271, 1.817209, 1, 0, 0.8156863, 1,
1.107522, 0.7391017, 0.3220061, 1, 0, 0.8117647, 1,
1.111595, -1.758621, 1.629595, 1, 0, 0.8039216, 1,
1.117877, -0.2943076, 0.8537646, 1, 0, 0.7960784, 1,
1.118935, -0.3264113, 2.311015, 1, 0, 0.7921569, 1,
1.12094, -1.35901, 1.86387, 1, 0, 0.7843137, 1,
1.126724, 1.312787, 1.675009, 1, 0, 0.7803922, 1,
1.130572, 1.140886, -0.9698763, 1, 0, 0.772549, 1,
1.134724, 0.9766199, -0.5660448, 1, 0, 0.7686275, 1,
1.135481, 1.022397, 0.4474217, 1, 0, 0.7607843, 1,
1.139836, -0.846279, 2.990221, 1, 0, 0.7568628, 1,
1.141339, 0.9489987, 1.08768, 1, 0, 0.7490196, 1,
1.143132, 1.546878, 0.7798598, 1, 0, 0.7450981, 1,
1.151566, 0.8279518, 1.204695, 1, 0, 0.7372549, 1,
1.152438, 1.393573, 1.105142, 1, 0, 0.7333333, 1,
1.158633, 0.09574044, 1.14688, 1, 0, 0.7254902, 1,
1.167542, -0.7452044, 1.329437, 1, 0, 0.7215686, 1,
1.176296, 0.5978769, 1.254236, 1, 0, 0.7137255, 1,
1.183236, 1.169441, 1.335527, 1, 0, 0.7098039, 1,
1.185798, 1.416063, 1.443415, 1, 0, 0.7019608, 1,
1.185955, -0.6804175, 3.233638, 1, 0, 0.6941177, 1,
1.186776, -0.3929437, 1.700282, 1, 0, 0.6901961, 1,
1.189666, -0.371502, 2.419439, 1, 0, 0.682353, 1,
1.19732, -0.7195362, 1.036792, 1, 0, 0.6784314, 1,
1.203415, -0.2044439, -0.2702656, 1, 0, 0.6705883, 1,
1.208967, 0.3230174, -0.6899665, 1, 0, 0.6666667, 1,
1.212537, 0.1158669, 0.8631844, 1, 0, 0.6588235, 1,
1.216345, -0.9035859, 4.150421, 1, 0, 0.654902, 1,
1.219242, -0.1216118, 0.8774125, 1, 0, 0.6470588, 1,
1.23249, 1.13108, 1.258159, 1, 0, 0.6431373, 1,
1.244034, -0.410611, -0.288691, 1, 0, 0.6352941, 1,
1.256588, -0.1188173, 1.268331, 1, 0, 0.6313726, 1,
1.258557, 0.201604, 2.844193, 1, 0, 0.6235294, 1,
1.262341, -0.6285924, 1.220604, 1, 0, 0.6196079, 1,
1.266516, 1.009874, 0.6442299, 1, 0, 0.6117647, 1,
1.273478, 0.0818018, 2.931588, 1, 0, 0.6078432, 1,
1.274619, 0.6420488, 2.360623, 1, 0, 0.6, 1,
1.278462, 1.011489, 0.5065619, 1, 0, 0.5921569, 1,
1.283544, 0.5399426, 1.017521, 1, 0, 0.5882353, 1,
1.287799, 2.18924, 0.6677461, 1, 0, 0.5803922, 1,
1.290042, -1.045511, 3.033251, 1, 0, 0.5764706, 1,
1.290988, 0.8455225, -0.3481568, 1, 0, 0.5686275, 1,
1.291704, 0.4037669, 2.326663, 1, 0, 0.5647059, 1,
1.294621, -0.3632585, 0.580319, 1, 0, 0.5568628, 1,
1.295019, -1.072468, 2.617049, 1, 0, 0.5529412, 1,
1.31011, -0.2360777, 2.793331, 1, 0, 0.5450981, 1,
1.313127, 0.351094, 1.052334, 1, 0, 0.5411765, 1,
1.318747, 0.8199384, 0.7521316, 1, 0, 0.5333334, 1,
1.323913, -2.096368, 3.452189, 1, 0, 0.5294118, 1,
1.329762, -1.773953, -0.1834227, 1, 0, 0.5215687, 1,
1.339848, -0.3591124, 3.13275, 1, 0, 0.5176471, 1,
1.35243, 1.629669, 1.253283, 1, 0, 0.509804, 1,
1.355983, -0.336067, 2.253922, 1, 0, 0.5058824, 1,
1.374283, 0.308313, 2.618654, 1, 0, 0.4980392, 1,
1.381463, 0.557303, 1.721117, 1, 0, 0.4901961, 1,
1.393603, -1.381035, 3.620764, 1, 0, 0.4862745, 1,
1.399744, -1.840315, 3.067213, 1, 0, 0.4784314, 1,
1.407604, -0.8613704, 3.0391, 1, 0, 0.4745098, 1,
1.411146, 0.5257871, 2.280833, 1, 0, 0.4666667, 1,
1.417442, -0.2097517, 1.128064, 1, 0, 0.4627451, 1,
1.422773, 0.4802419, 1.356023, 1, 0, 0.454902, 1,
1.42587, -1.184242, 3.544155, 1, 0, 0.4509804, 1,
1.429225, -0.9677592, 1.997755, 1, 0, 0.4431373, 1,
1.434509, -0.7836155, 2.320606, 1, 0, 0.4392157, 1,
1.443912, 0.7638823, 2.030256, 1, 0, 0.4313726, 1,
1.444831, -0.4178151, 1.108927, 1, 0, 0.427451, 1,
1.448511, 0.07103535, 0.9942068, 1, 0, 0.4196078, 1,
1.449394, 1.128642, 1.932629, 1, 0, 0.4156863, 1,
1.476718, -0.1415349, 1.408036, 1, 0, 0.4078431, 1,
1.483496, 0.02546628, 0.01794719, 1, 0, 0.4039216, 1,
1.513517, -0.7491245, 1.926389, 1, 0, 0.3960784, 1,
1.518187, 0.3684995, 1.000067, 1, 0, 0.3882353, 1,
1.523317, 1.026284, 0.08857316, 1, 0, 0.3843137, 1,
1.524314, -0.4914039, 1.24914, 1, 0, 0.3764706, 1,
1.542708, 1.406111, -0.1299843, 1, 0, 0.372549, 1,
1.544985, -0.06320386, 2.175727, 1, 0, 0.3647059, 1,
1.562361, 0.7009885, 2.140273, 1, 0, 0.3607843, 1,
1.569811, -0.1939623, 2.989006, 1, 0, 0.3529412, 1,
1.571024, -0.6166357, 2.444168, 1, 0, 0.3490196, 1,
1.57233, -0.3616161, 2.750165, 1, 0, 0.3411765, 1,
1.573797, 0.4720478, 0.623403, 1, 0, 0.3372549, 1,
1.583826, 0.181779, 2.110069, 1, 0, 0.3294118, 1,
1.585298, -1.116437, 1.898965, 1, 0, 0.3254902, 1,
1.599054, -0.2929033, 0.4469566, 1, 0, 0.3176471, 1,
1.600004, -0.1444991, 1.277762, 1, 0, 0.3137255, 1,
1.608207, 1.682675, 0.9802509, 1, 0, 0.3058824, 1,
1.614102, 1.628909, 0.2491929, 1, 0, 0.2980392, 1,
1.624801, -0.4154713, 1.678539, 1, 0, 0.2941177, 1,
1.632844, -0.8534391, 2.049352, 1, 0, 0.2862745, 1,
1.639989, 0.5574463, 1.682445, 1, 0, 0.282353, 1,
1.648444, 0.4195768, 1.347372, 1, 0, 0.2745098, 1,
1.653544, 1.094288, 1.330722, 1, 0, 0.2705882, 1,
1.669001, 0.05695875, 1.667634, 1, 0, 0.2627451, 1,
1.67454, -1.046721, 2.690553, 1, 0, 0.2588235, 1,
1.674645, 1.457772, 2.533125, 1, 0, 0.2509804, 1,
1.711054, 0.9784698, 1.971863, 1, 0, 0.2470588, 1,
1.728671, -0.6365218, 3.15209, 1, 0, 0.2392157, 1,
1.741696, -0.67975, 1.7865, 1, 0, 0.2352941, 1,
1.747838, -1.479931, 0.9278001, 1, 0, 0.227451, 1,
1.755368, 0.2502905, 1.090337, 1, 0, 0.2235294, 1,
1.76829, 1.364664, 1.164348, 1, 0, 0.2156863, 1,
1.771572, 0.7667239, 0.8637131, 1, 0, 0.2117647, 1,
1.773162, 1.467494, 1.199522, 1, 0, 0.2039216, 1,
1.780201, -1.434149, 1.895234, 1, 0, 0.1960784, 1,
1.781659, 0.4115905, 4.031404, 1, 0, 0.1921569, 1,
1.784061, 0.5614179, 2.304724, 1, 0, 0.1843137, 1,
1.787618, 0.7443256, 1.123303, 1, 0, 0.1803922, 1,
1.806131, -0.8891742, 1.276801, 1, 0, 0.172549, 1,
1.818699, -0.5849025, 0.978845, 1, 0, 0.1686275, 1,
1.83059, -1.596032, 2.561967, 1, 0, 0.1607843, 1,
1.831265, -0.697344, 1.139613, 1, 0, 0.1568628, 1,
1.841623, 0.4291267, 3.271623, 1, 0, 0.1490196, 1,
1.845434, -1.323576, 0.8163983, 1, 0, 0.145098, 1,
1.862669, 0.9580831, 1.35593, 1, 0, 0.1372549, 1,
1.864118, -1.526883, 2.944811, 1, 0, 0.1333333, 1,
1.878543, -0.1431883, 1.797681, 1, 0, 0.1254902, 1,
1.911714, -0.7319993, 1.697201, 1, 0, 0.1215686, 1,
1.945838, 1.398999, 0.2491309, 1, 0, 0.1137255, 1,
2.040832, 1.87708, 1.337016, 1, 0, 0.1098039, 1,
2.055347, 0.4711111, 4.091658, 1, 0, 0.1019608, 1,
2.085388, 0.4515339, 3.125023, 1, 0, 0.09411765, 1,
2.090943, 0.8260607, 1.100673, 1, 0, 0.09019608, 1,
2.121424, -2.028821, 5.24457, 1, 0, 0.08235294, 1,
2.194736, -0.5160902, 3.838197, 1, 0, 0.07843138, 1,
2.211638, -0.614761, 2.154227, 1, 0, 0.07058824, 1,
2.239375, -2.395343, 2.359269, 1, 0, 0.06666667, 1,
2.279581, -0.162263, 2.246794, 1, 0, 0.05882353, 1,
2.312632, -1.45788, 1.565849, 1, 0, 0.05490196, 1,
2.365194, -0.8730915, 1.980659, 1, 0, 0.04705882, 1,
2.390411, -0.4662765, 0.3260523, 1, 0, 0.04313726, 1,
2.394201, 0.3879519, 2.801443, 1, 0, 0.03529412, 1,
2.40987, 1.118644, 0.2461888, 1, 0, 0.03137255, 1,
2.677688, 0.7766762, 1.943127, 1, 0, 0.02352941, 1,
2.70254, -1.916967, 2.935825, 1, 0, 0.01960784, 1,
3.307323, -1.653756, 2.157674, 1, 0, 0.01176471, 1,
3.589778, -0.3160318, 0.4726809, 1, 0, 0.007843138, 1
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
0.2236785, -4.502818, -7.068515, 0, -0.5, 0.5, 0.5,
0.2236785, -4.502818, -7.068515, 1, -0.5, 0.5, 0.5,
0.2236785, -4.502818, -7.068515, 1, 1.5, 0.5, 0.5,
0.2236785, -4.502818, -7.068515, 0, 1.5, 0.5, 0.5
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
-4.283529, -0.2351997, -7.068515, 0, -0.5, 0.5, 0.5,
-4.283529, -0.2351997, -7.068515, 1, -0.5, 0.5, 0.5,
-4.283529, -0.2351997, -7.068515, 1, 1.5, 0.5, 0.5,
-4.283529, -0.2351997, -7.068515, 0, 1.5, 0.5, 0.5
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
-4.283529, -4.502818, 0.5848167, 0, -0.5, 0.5, 0.5,
-4.283529, -4.502818, 0.5848167, 1, -0.5, 0.5, 0.5,
-4.283529, -4.502818, 0.5848167, 1, 1.5, 0.5, 0.5,
-4.283529, -4.502818, 0.5848167, 0, 1.5, 0.5, 0.5
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
-3, -3.517983, -5.302361,
3, -3.517983, -5.302361,
-3, -3.517983, -5.302361,
-3, -3.682122, -5.596721,
-2, -3.517983, -5.302361,
-2, -3.682122, -5.596721,
-1, -3.517983, -5.302361,
-1, -3.682122, -5.596721,
0, -3.517983, -5.302361,
0, -3.682122, -5.596721,
1, -3.517983, -5.302361,
1, -3.682122, -5.596721,
2, -3.517983, -5.302361,
2, -3.682122, -5.596721,
3, -3.517983, -5.302361,
3, -3.682122, -5.596721
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
-3, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
-3, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
-3, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
-3, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
-2, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
-2, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
-2, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
-2, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
-1, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
-1, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
-1, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
-1, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
0, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
0, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
0, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
0, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
1, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
1, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
1, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
1, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
2, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
2, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
2, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
2, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5,
3, -4.0104, -6.185438, 0, -0.5, 0.5, 0.5,
3, -4.0104, -6.185438, 1, -0.5, 0.5, 0.5,
3, -4.0104, -6.185438, 1, 1.5, 0.5, 0.5,
3, -4.0104, -6.185438, 0, 1.5, 0.5, 0.5
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
-3.243404, -3, -5.302361,
-3.243404, 2, -5.302361,
-3.243404, -3, -5.302361,
-3.416758, -3, -5.596721,
-3.243404, -2, -5.302361,
-3.416758, -2, -5.596721,
-3.243404, -1, -5.302361,
-3.416758, -1, -5.596721,
-3.243404, 0, -5.302361,
-3.416758, 0, -5.596721,
-3.243404, 1, -5.302361,
-3.416758, 1, -5.596721,
-3.243404, 2, -5.302361,
-3.416758, 2, -5.596721
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
-3.763467, -3, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, -3, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, -3, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, -3, -6.185438, 0, 1.5, 0.5, 0.5,
-3.763467, -2, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, -2, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, -2, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, -2, -6.185438, 0, 1.5, 0.5, 0.5,
-3.763467, -1, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, -1, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, -1, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, -1, -6.185438, 0, 1.5, 0.5, 0.5,
-3.763467, 0, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, 0, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, 0, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, 0, -6.185438, 0, 1.5, 0.5, 0.5,
-3.763467, 1, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, 1, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, 1, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, 1, -6.185438, 0, 1.5, 0.5, 0.5,
-3.763467, 2, -6.185438, 0, -0.5, 0.5, 0.5,
-3.763467, 2, -6.185438, 1, -0.5, 0.5, 0.5,
-3.763467, 2, -6.185438, 1, 1.5, 0.5, 0.5,
-3.763467, 2, -6.185438, 0, 1.5, 0.5, 0.5
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
-3.243404, -3.517983, -4,
-3.243404, -3.517983, 6,
-3.243404, -3.517983, -4,
-3.416758, -3.682122, -4,
-3.243404, -3.517983, -2,
-3.416758, -3.682122, -2,
-3.243404, -3.517983, 0,
-3.416758, -3.682122, 0,
-3.243404, -3.517983, 2,
-3.416758, -3.682122, 2,
-3.243404, -3.517983, 4,
-3.416758, -3.682122, 4,
-3.243404, -3.517983, 6,
-3.416758, -3.682122, 6
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
-3.763467, -4.0104, -4, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, -4, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, -4, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, -4, 0, 1.5, 0.5, 0.5,
-3.763467, -4.0104, -2, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, -2, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, -2, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, -2, 0, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 0, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 0, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 0, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 0, 0, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 2, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 2, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 2, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 2, 0, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 4, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 4, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 4, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 4, 0, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 6, 0, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 6, 1, -0.5, 0.5, 0.5,
-3.763467, -4.0104, 6, 1, 1.5, 0.5, 0.5,
-3.763467, -4.0104, 6, 0, 1.5, 0.5, 0.5
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
-3.243404, -3.517983, -5.302361,
-3.243404, 3.047584, -5.302361,
-3.243404, -3.517983, 6.471995,
-3.243404, 3.047584, 6.471995,
-3.243404, -3.517983, -5.302361,
-3.243404, -3.517983, 6.471995,
-3.243404, 3.047584, -5.302361,
-3.243404, 3.047584, 6.471995,
-3.243404, -3.517983, -5.302361,
3.690761, -3.517983, -5.302361,
-3.243404, -3.517983, 6.471995,
3.690761, -3.517983, 6.471995,
-3.243404, 3.047584, -5.302361,
3.690761, 3.047584, -5.302361,
-3.243404, 3.047584, 6.471995,
3.690761, 3.047584, 6.471995,
3.690761, -3.517983, -5.302361,
3.690761, 3.047584, -5.302361,
3.690761, -3.517983, 6.471995,
3.690761, 3.047584, 6.471995,
3.690761, -3.517983, -5.302361,
3.690761, -3.517983, 6.471995,
3.690761, 3.047584, -5.302361,
3.690761, 3.047584, 6.471995
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
var radius = 8.095131;
var distance = 36.01616;
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
mvMatrix.translate( -0.2236785, 0.2351997, -0.5848167 );
mvMatrix.scale( 1.262245, 1.333109, 0.7433624 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.01616);
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
magnesium_arsenate_m<-read.table("magnesium_arsenate_m.xyz", skip=1)
```

```
## Error in read.table("magnesium_arsenate_m.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-magnesium_arsenate_m$V2
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
```

```r
y<-magnesium_arsenate_m$V3
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
```

```r
z<-magnesium_arsenate_m$V4
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
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
-3.142421, -0.6006332, -0.8443311, 0, 0, 1, 1, 1,
-2.871143, 0.6757505, -0.7499104, 1, 0, 0, 1, 1,
-2.831611, 0.4680818, -1.875265, 1, 0, 0, 1, 1,
-2.765782, -0.381869, -1.985842, 1, 0, 0, 1, 1,
-2.672574, 1.01923, -0.339211, 1, 0, 0, 1, 1,
-2.540004, -0.9000484, -2.849771, 1, 0, 0, 1, 1,
-2.480709, -0.5946259, -1.811471, 0, 0, 0, 1, 1,
-2.475365, -0.1604021, -0.1730495, 0, 0, 0, 1, 1,
-2.4134, -0.5978425, -1.322233, 0, 0, 0, 1, 1,
-2.404595, 0.6170245, 0.9751952, 0, 0, 0, 1, 1,
-2.287234, -1.265441, -2.72809, 0, 0, 0, 1, 1,
-2.25863, -0.7202171, -1.967475, 0, 0, 0, 1, 1,
-2.184746, -0.4048634, -2.73884, 0, 0, 0, 1, 1,
-2.146493, -0.6951392, -2.526954, 1, 1, 1, 1, 1,
-2.139582, -0.3971465, -1.108006, 1, 1, 1, 1, 1,
-2.110174, 1.04384, -1.24384, 1, 1, 1, 1, 1,
-2.094334, -0.1878953, -1.512163, 1, 1, 1, 1, 1,
-2.093803, 0.7866574, -1.306005, 1, 1, 1, 1, 1,
-2.087731, 0.1254665, -1.707731, 1, 1, 1, 1, 1,
-2.083244, 0.4387855, -3.252356, 1, 1, 1, 1, 1,
-2.078335, -0.8885168, -3.450062, 1, 1, 1, 1, 1,
-2.077654, -1.542525, -3.193281, 1, 1, 1, 1, 1,
-2.073221, 0.0005833224, -2.715971, 1, 1, 1, 1, 1,
-2.064464, 0.0569341, -1.553677, 1, 1, 1, 1, 1,
-2.05873, -1.422994, -2.066047, 1, 1, 1, 1, 1,
-2.043559, 0.1580164, -1.398183, 1, 1, 1, 1, 1,
-2.026113, -0.759383, -3.487174, 1, 1, 1, 1, 1,
-2.025781, 1.121053, -0.3815064, 1, 1, 1, 1, 1,
-1.973409, -0.6187143, -2.442946, 0, 0, 1, 1, 1,
-1.928351, -0.9935807, -3.940536, 1, 0, 0, 1, 1,
-1.885719, 0.5994268, -1.35743, 1, 0, 0, 1, 1,
-1.862096, 0.07501405, -0.530128, 1, 0, 0, 1, 1,
-1.839694, 0.3037492, -1.597381, 1, 0, 0, 1, 1,
-1.799577, 0.3023277, -2.161395, 1, 0, 0, 1, 1,
-1.787728, -1.735132, -1.956818, 0, 0, 0, 1, 1,
-1.755209, -0.8295203, -3.073885, 0, 0, 0, 1, 1,
-1.736223, -0.9877824, -1.849772, 0, 0, 0, 1, 1,
-1.726482, -0.8884321, -3.799812, 0, 0, 0, 1, 1,
-1.717649, 0.06184944, -2.118771, 0, 0, 0, 1, 1,
-1.713647, 0.04929752, -2.693979, 0, 0, 0, 1, 1,
-1.710424, 0.7809617, -0.7493754, 0, 0, 0, 1, 1,
-1.697868, -0.7990808, -0.9966227, 1, 1, 1, 1, 1,
-1.679009, 1.482267, -0.8546408, 1, 1, 1, 1, 1,
-1.67017, 1.866481, -2.76405, 1, 1, 1, 1, 1,
-1.66258, 0.8596265, -0.8615676, 1, 1, 1, 1, 1,
-1.644012, -0.4008834, -3.306395, 1, 1, 1, 1, 1,
-1.612002, -1.13148, -4.927183, 1, 1, 1, 1, 1,
-1.605899, -0.6855885, -2.397525, 1, 1, 1, 1, 1,
-1.581993, 0.5162141, -1.14897, 1, 1, 1, 1, 1,
-1.574653, -0.7245275, -1.963565, 1, 1, 1, 1, 1,
-1.571305, 0.9553748, 1.516382, 1, 1, 1, 1, 1,
-1.569925, 2.550858, -0.3821824, 1, 1, 1, 1, 1,
-1.56786, 0.245582, -2.721566, 1, 1, 1, 1, 1,
-1.563032, -0.09017049, -0.3534911, 1, 1, 1, 1, 1,
-1.558826, 0.2315746, -1.368109, 1, 1, 1, 1, 1,
-1.558703, -1.586116, -2.286852, 1, 1, 1, 1, 1,
-1.548212, -1.411351, -3.761427, 0, 0, 1, 1, 1,
-1.540604, 0.4766745, -0.4061734, 1, 0, 0, 1, 1,
-1.538457, 0.9758174, -0.4477187, 1, 0, 0, 1, 1,
-1.52503, -0.1706262, -2.396995, 1, 0, 0, 1, 1,
-1.522463, 2.091722, 0.3013083, 1, 0, 0, 1, 1,
-1.508343, 1.291056, -1.572965, 1, 0, 0, 1, 1,
-1.499831, -1.119972, -5.13089, 0, 0, 0, 1, 1,
-1.497231, -1.50129, -3.043875, 0, 0, 0, 1, 1,
-1.488253, -0.1452123, -3.505146, 0, 0, 0, 1, 1,
-1.480139, -0.1323598, -2.340842, 0, 0, 0, 1, 1,
-1.47414, 1.114986, 1.295751, 0, 0, 0, 1, 1,
-1.471759, -0.424888, -0.8143862, 0, 0, 0, 1, 1,
-1.470449, -1.127996, -4.216555, 0, 0, 0, 1, 1,
-1.461847, 0.6480103, -1.069181, 1, 1, 1, 1, 1,
-1.46162, -0.6118231, -2.121865, 1, 1, 1, 1, 1,
-1.458774, -0.9466336, -2.882228, 1, 1, 1, 1, 1,
-1.458723, 1.025827, -0.5186379, 1, 1, 1, 1, 1,
-1.456392, -0.9405916, -2.594939, 1, 1, 1, 1, 1,
-1.452565, 2.02615, -0.05569468, 1, 1, 1, 1, 1,
-1.448733, 0.313564, -0.1074628, 1, 1, 1, 1, 1,
-1.443586, -1.952051, -2.518975, 1, 1, 1, 1, 1,
-1.439057, -0.05494509, -0.6984146, 1, 1, 1, 1, 1,
-1.431997, 0.172872, -2.16186, 1, 1, 1, 1, 1,
-1.411791, 1.246227, -2.129294, 1, 1, 1, 1, 1,
-1.407468, -0.8667864, -2.087812, 1, 1, 1, 1, 1,
-1.395386, -0.158205, -1.798495, 1, 1, 1, 1, 1,
-1.387437, 1.178405, -0.336129, 1, 1, 1, 1, 1,
-1.386844, -0.7538159, -1.479721, 1, 1, 1, 1, 1,
-1.386582, -0.9418154, -2.899725, 0, 0, 1, 1, 1,
-1.385164, -2.608927, -3.219755, 1, 0, 0, 1, 1,
-1.384341, -0.7191903, -0.9851727, 1, 0, 0, 1, 1,
-1.379345, 1.752296, -1.875028, 1, 0, 0, 1, 1,
-1.370774, 0.3190633, -1.973168, 1, 0, 0, 1, 1,
-1.369682, 1.219934, 0.1688178, 1, 0, 0, 1, 1,
-1.367737, 0.09951402, -1.534047, 0, 0, 0, 1, 1,
-1.352378, -1.060375, -2.602215, 0, 0, 0, 1, 1,
-1.344029, 0.5044028, -0.1665632, 0, 0, 0, 1, 1,
-1.336434, -1.03218, -3.615272, 0, 0, 0, 1, 1,
-1.334412, 0.03305981, -3.161472, 0, 0, 0, 1, 1,
-1.329957, -1.154063, -3.275757, 0, 0, 0, 1, 1,
-1.326656, -0.4138036, -2.82995, 0, 0, 0, 1, 1,
-1.323259, 0.701048, -1.473851, 1, 1, 1, 1, 1,
-1.321163, 1.709214, -1.691751, 1, 1, 1, 1, 1,
-1.31595, -0.3270895, -3.414049, 1, 1, 1, 1, 1,
-1.315369, -0.5886877, -0.8886303, 1, 1, 1, 1, 1,
-1.310248, 1.408279, -1.033167, 1, 1, 1, 1, 1,
-1.302113, 0.9997084, -0.968826, 1, 1, 1, 1, 1,
-1.296917, 1.085604, -2.190034, 1, 1, 1, 1, 1,
-1.285137, -0.7605275, -3.778651, 1, 1, 1, 1, 1,
-1.284635, -1.83365, -3.374089, 1, 1, 1, 1, 1,
-1.274487, 0.2958431, -0.4555241, 1, 1, 1, 1, 1,
-1.270633, 1.539713, -0.1070804, 1, 1, 1, 1, 1,
-1.265545, -0.291114, -2.06104, 1, 1, 1, 1, 1,
-1.260839, -0.7448446, -1.464425, 1, 1, 1, 1, 1,
-1.253464, 0.6109582, -0.6235461, 1, 1, 1, 1, 1,
-1.240915, 1.058719, -0.3017727, 1, 1, 1, 1, 1,
-1.235737, 1.335669, -0.4922372, 0, 0, 1, 1, 1,
-1.234752, 0.3554639, -2.375833, 1, 0, 0, 1, 1,
-1.233959, 0.1284814, -2.110781, 1, 0, 0, 1, 1,
-1.226307, -0.2947574, -2.329759, 1, 0, 0, 1, 1,
-1.222566, 0.05598497, -1.756344, 1, 0, 0, 1, 1,
-1.22255, -0.5982974, -3.256532, 1, 0, 0, 1, 1,
-1.213926, 1.335649, 0.2202433, 0, 0, 0, 1, 1,
-1.20823, -0.2102655, -1.337409, 0, 0, 0, 1, 1,
-1.193374, -1.106492, -1.639362, 0, 0, 0, 1, 1,
-1.184357, -0.5301236, -2.888228, 0, 0, 0, 1, 1,
-1.184132, -0.9402912, -1.877088, 0, 0, 0, 1, 1,
-1.183769, 0.06483563, -1.947658, 0, 0, 0, 1, 1,
-1.182638, 0.3802116, -1.771153, 0, 0, 0, 1, 1,
-1.177137, -0.9876214, 0.03531433, 1, 1, 1, 1, 1,
-1.16773, 0.6151049, -1.01435, 1, 1, 1, 1, 1,
-1.162556, 0.3317584, -3.154222, 1, 1, 1, 1, 1,
-1.153057, -0.2138478, -1.032621, 1, 1, 1, 1, 1,
-1.145204, -1.409141, 0.01616642, 1, 1, 1, 1, 1,
-1.142915, -0.8303204, -0.7734356, 1, 1, 1, 1, 1,
-1.140431, -1.372546, -2.13219, 1, 1, 1, 1, 1,
-1.117569, 1.945895, -1.364731, 1, 1, 1, 1, 1,
-1.114519, 0.1063593, -1.419318, 1, 1, 1, 1, 1,
-1.102977, 1.426104, -0.8263132, 1, 1, 1, 1, 1,
-1.095026, 0.885119, -3.037326, 1, 1, 1, 1, 1,
-1.091837, 0.6117895, -0.8813722, 1, 1, 1, 1, 1,
-1.082946, -0.6689544, -3.326088, 1, 1, 1, 1, 1,
-1.075341, 0.2541532, -1.295614, 1, 1, 1, 1, 1,
-1.074749, 0.609643, -1.318137, 1, 1, 1, 1, 1,
-1.068169, 0.1585714, -1.531965, 0, 0, 1, 1, 1,
-1.063579, 0.2620788, -1.325026, 1, 0, 0, 1, 1,
-1.060299, -0.8773077, -1.673874, 1, 0, 0, 1, 1,
-1.056388, 0.4735479, -1.561814, 1, 0, 0, 1, 1,
-1.055578, -0.7665958, -2.183902, 1, 0, 0, 1, 1,
-1.055282, 0.4943797, 0.1211434, 1, 0, 0, 1, 1,
-1.05502, 0.1878395, -0.4012053, 0, 0, 0, 1, 1,
-1.051227, -0.4234576, -2.720958, 0, 0, 0, 1, 1,
-1.037091, 0.5788152, -1.33842, 0, 0, 0, 1, 1,
-1.029163, -1.306598, -0.648019, 0, 0, 0, 1, 1,
-1.027117, -0.3668802, -0.9243088, 0, 0, 0, 1, 1,
-1.026629, -0.4902474, -1.415122, 0, 0, 0, 1, 1,
-1.024891, 0.8317374, -0.1356796, 0, 0, 0, 1, 1,
-1.024028, 0.1650088, -0.4330232, 1, 1, 1, 1, 1,
-1.011458, 0.2369489, 1.041863, 1, 1, 1, 1, 1,
-0.9998451, -0.1188015, -0.7653244, 1, 1, 1, 1, 1,
-0.9965565, 1.405942, 0.0001838607, 1, 1, 1, 1, 1,
-0.9961224, 0.4749359, -1.66239, 1, 1, 1, 1, 1,
-0.9929474, -0.5728704, -1.338381, 1, 1, 1, 1, 1,
-0.9849536, -0.4650087, -1.53094, 1, 1, 1, 1, 1,
-0.9788177, 1.319457, -0.5103695, 1, 1, 1, 1, 1,
-0.9737777, -0.9403012, -2.46416, 1, 1, 1, 1, 1,
-0.9662469, 0.5441687, -0.1671736, 1, 1, 1, 1, 1,
-0.9616051, 1.008375, -0.05810237, 1, 1, 1, 1, 1,
-0.954122, -0.9120656, -0.4117146, 1, 1, 1, 1, 1,
-0.9505755, 1.370061, -0.522482, 1, 1, 1, 1, 1,
-0.9468167, -0.5648185, -2.225687, 1, 1, 1, 1, 1,
-0.9424341, -0.8319728, -1.693628, 1, 1, 1, 1, 1,
-0.9415768, 1.099845, 0.03083122, 0, 0, 1, 1, 1,
-0.9372848, 1.938387, -1.996048, 1, 0, 0, 1, 1,
-0.9362307, -0.2801531, -3.043234, 1, 0, 0, 1, 1,
-0.9253926, 2.887668, -0.2756343, 1, 0, 0, 1, 1,
-0.9197933, -1.81972, -4.6058, 1, 0, 0, 1, 1,
-0.9193848, 0.7215527, -0.4122452, 1, 0, 0, 1, 1,
-0.9151418, 2.742166, -0.5550557, 0, 0, 0, 1, 1,
-0.9129014, -0.2768679, -1.104382, 0, 0, 0, 1, 1,
-0.9110996, -1.876907, -2.002845, 0, 0, 0, 1, 1,
-0.899088, -1.596161, -1.492044, 0, 0, 0, 1, 1,
-0.8986145, -0.9422004, -1.432335, 0, 0, 0, 1, 1,
-0.8843319, 0.2107985, 1.04487, 0, 0, 0, 1, 1,
-0.8787367, -0.5940633, -2.261172, 0, 0, 0, 1, 1,
-0.8773573, -0.3745684, -3.463193, 1, 1, 1, 1, 1,
-0.8753639, -1.291954, -2.885903, 1, 1, 1, 1, 1,
-0.8680218, 0.2222449, -0.8895104, 1, 1, 1, 1, 1,
-0.8668193, 2.089021, -2.36133, 1, 1, 1, 1, 1,
-0.8663529, -0.5086343, -1.101773, 1, 1, 1, 1, 1,
-0.8619211, 1.498104, -1.101188, 1, 1, 1, 1, 1,
-0.8592011, -0.750593, -2.576219, 1, 1, 1, 1, 1,
-0.8535934, -0.9601237, -1.583804, 1, 1, 1, 1, 1,
-0.8526298, 2.634239, -2.297233, 1, 1, 1, 1, 1,
-0.8471282, 1.71041, -1.264534, 1, 1, 1, 1, 1,
-0.8302559, -0.5375298, -2.894025, 1, 1, 1, 1, 1,
-0.8270743, 1.33391, -2.67002, 1, 1, 1, 1, 1,
-0.8236487, -0.959644, -1.626543, 1, 1, 1, 1, 1,
-0.8212018, -1.448452, -2.744774, 1, 1, 1, 1, 1,
-0.8192379, 1.071209, -0.6763418, 1, 1, 1, 1, 1,
-0.8156822, 0.09611566, 0.5687467, 0, 0, 1, 1, 1,
-0.8083905, -0.739507, -3.42883, 1, 0, 0, 1, 1,
-0.8051645, 0.1353917, -2.941882, 1, 0, 0, 1, 1,
-0.8022879, -0.6283891, -3.241226, 1, 0, 0, 1, 1,
-0.7910082, 0.8971827, 0.2645542, 1, 0, 0, 1, 1,
-0.7871319, -2.01978, -3.452677, 1, 0, 0, 1, 1,
-0.779846, -0.5834639, -2.816097, 0, 0, 0, 1, 1,
-0.7746496, 0.502107, -0.4358881, 0, 0, 0, 1, 1,
-0.770678, -0.3916923, -1.51188, 0, 0, 0, 1, 1,
-0.767498, 0.6275774, -0.2626909, 0, 0, 0, 1, 1,
-0.7634318, 0.4138392, -0.6738492, 0, 0, 0, 1, 1,
-0.7612266, 0.1957161, -1.563417, 0, 0, 0, 1, 1,
-0.7583939, -0.9221928, -2.934552, 0, 0, 0, 1, 1,
-0.7579889, 0.3807964, 0.04532045, 1, 1, 1, 1, 1,
-0.7567369, -1.260447, -2.483703, 1, 1, 1, 1, 1,
-0.7554643, 0.1860713, -1.102742, 1, 1, 1, 1, 1,
-0.7437144, -0.004947785, -2.544081, 1, 1, 1, 1, 1,
-0.7418392, -0.2961274, -2.707119, 1, 1, 1, 1, 1,
-0.731923, -0.313798, -1.557733, 1, 1, 1, 1, 1,
-0.721074, -0.04926976, -2.471709, 1, 1, 1, 1, 1,
-0.7206564, 1.026287, -1.752785, 1, 1, 1, 1, 1,
-0.7160668, -0.194934, -2.580036, 1, 1, 1, 1, 1,
-0.7083483, -0.6571533, -2.92164, 1, 1, 1, 1, 1,
-0.7066414, 0.9492954, -1.84963, 1, 1, 1, 1, 1,
-0.7001182, 1.03807, -0.03359237, 1, 1, 1, 1, 1,
-0.6907096, 0.7968988, -1.670686, 1, 1, 1, 1, 1,
-0.6898671, -2.020979, -2.854712, 1, 1, 1, 1, 1,
-0.6894041, -1.941735, -2.723137, 1, 1, 1, 1, 1,
-0.6861395, 0.5418572, -3.091213, 0, 0, 1, 1, 1,
-0.6843832, 0.3239638, -3.666046, 1, 0, 0, 1, 1,
-0.6824829, 1.02989, -0.6379397, 1, 0, 0, 1, 1,
-0.6821367, 0.4122529, -1.188193, 1, 0, 0, 1, 1,
-0.6655061, 2.951968, 0.5381655, 1, 0, 0, 1, 1,
-0.656777, 1.675931, 1.276374, 1, 0, 0, 1, 1,
-0.6513821, -0.2946593, -2.153015, 0, 0, 0, 1, 1,
-0.6495335, -0.6748993, -3.833197, 0, 0, 0, 1, 1,
-0.6488752, 1.006644, 0.1615916, 0, 0, 0, 1, 1,
-0.6450344, -0.8006543, -3.112799, 0, 0, 0, 1, 1,
-0.6445678, -0.7429162, -1.605199, 0, 0, 0, 1, 1,
-0.6427004, 2.700792, -1.817098, 0, 0, 0, 1, 1,
-0.641766, -1.375541, -0.8352861, 0, 0, 0, 1, 1,
-0.6386345, -0.7389113, -2.929972, 1, 1, 1, 1, 1,
-0.6378698, -0.584227, -1.562742, 1, 1, 1, 1, 1,
-0.6362273, -0.4878272, -1.142511, 1, 1, 1, 1, 1,
-0.6290738, -0.7455021, -2.600225, 1, 1, 1, 1, 1,
-0.6246141, 0.3189525, -0.5446476, 1, 1, 1, 1, 1,
-0.6226531, 0.560207, -0.5762331, 1, 1, 1, 1, 1,
-0.6215822, -0.04749072, -2.398584, 1, 1, 1, 1, 1,
-0.6194659, -0.9397008, -3.862101, 1, 1, 1, 1, 1,
-0.614429, -0.4312544, -1.252095, 1, 1, 1, 1, 1,
-0.6125219, 1.053066, 0.7091911, 1, 1, 1, 1, 1,
-0.6118365, 1.447535, 0.4101502, 1, 1, 1, 1, 1,
-0.6116552, 0.3295951, -0.1091, 1, 1, 1, 1, 1,
-0.6113759, -0.9416604, -3.495049, 1, 1, 1, 1, 1,
-0.6080106, -0.06441635, -2.990363, 1, 1, 1, 1, 1,
-0.6050043, 0.09659792, -0.8764423, 1, 1, 1, 1, 1,
-0.6031223, 0.2959136, -0.3362645, 0, 0, 1, 1, 1,
-0.6017678, -1.445169, -0.9441737, 1, 0, 0, 1, 1,
-0.6013991, -0.132006, -2.237984, 1, 0, 0, 1, 1,
-0.5922694, 0.7775348, -0.5445034, 1, 0, 0, 1, 1,
-0.5905002, -0.3359225, -2.443403, 1, 0, 0, 1, 1,
-0.5904407, -0.03588406, -2.780979, 1, 0, 0, 1, 1,
-0.5902383, 1.156275, -2.754254, 0, 0, 0, 1, 1,
-0.5889547, -1.033237, -2.098727, 0, 0, 0, 1, 1,
-0.5876836, 0.9523162, -1.153451, 0, 0, 0, 1, 1,
-0.5857564, 0.06844689, -1.381754, 0, 0, 0, 1, 1,
-0.5850752, -1.000298, -3.981135, 0, 0, 0, 1, 1,
-0.5848312, -0.7310749, -3.18726, 0, 0, 0, 1, 1,
-0.5787265, -0.5921906, -2.168607, 0, 0, 0, 1, 1,
-0.5716435, 0.02792332, -0.8550081, 1, 1, 1, 1, 1,
-0.5680621, -0.396936, -0.07155037, 1, 1, 1, 1, 1,
-0.5656874, 0.6575594, 0.3451435, 1, 1, 1, 1, 1,
-0.5645124, -0.3529517, -0.7424901, 1, 1, 1, 1, 1,
-0.5625529, -0.4852805, -0.7197983, 1, 1, 1, 1, 1,
-0.5597618, -1.369662, -2.79352, 1, 1, 1, 1, 1,
-0.5583121, 0.375743, -0.7382665, 1, 1, 1, 1, 1,
-0.5540267, -0.1688319, -2.548929, 1, 1, 1, 1, 1,
-0.553987, 0.7016722, -1.5783, 1, 1, 1, 1, 1,
-0.5520754, 0.8988705, -0.7436526, 1, 1, 1, 1, 1,
-0.5506495, -1.218334, -2.264348, 1, 1, 1, 1, 1,
-0.5474234, 0.05340554, -2.973129, 1, 1, 1, 1, 1,
-0.5468989, 1.694469, -0.8756041, 1, 1, 1, 1, 1,
-0.5443163, -3.070028, -1.381281, 1, 1, 1, 1, 1,
-0.5424925, 0.7599683, 0.5149235, 1, 1, 1, 1, 1,
-0.5400213, -0.523985, -1.271104, 0, 0, 1, 1, 1,
-0.5363375, -0.742605, -3.953844, 1, 0, 0, 1, 1,
-0.5348532, -1.267268, -3.204461, 1, 0, 0, 1, 1,
-0.5315746, -1.406243, -2.626197, 1, 0, 0, 1, 1,
-0.5256465, -0.5476185, -3.126212, 1, 0, 0, 1, 1,
-0.5210159, -0.1846578, -2.19229, 1, 0, 0, 1, 1,
-0.5204981, 0.732736, 1.212537, 0, 0, 0, 1, 1,
-0.5172444, 1.187142, 0.6773158, 0, 0, 0, 1, 1,
-0.5170423, -0.573588, -2.83975, 0, 0, 0, 1, 1,
-0.5137694, 1.475073, -0.1802895, 0, 0, 0, 1, 1,
-0.5089415, -0.402054, -2.227094, 0, 0, 0, 1, 1,
-0.5069184, -0.5786808, -2.648571, 0, 0, 0, 1, 1,
-0.4981659, 2.18467, -0.7450485, 0, 0, 0, 1, 1,
-0.4937801, -0.523128, -2.621223, 1, 1, 1, 1, 1,
-0.4924111, -0.7281245, -0.62737, 1, 1, 1, 1, 1,
-0.4893117, 1.459381, -0.5102482, 1, 1, 1, 1, 1,
-0.4868611, 0.2800914, -0.8670171, 1, 1, 1, 1, 1,
-0.4849089, 0.9779822, -0.4626363, 1, 1, 1, 1, 1,
-0.482432, -0.2333025, -4.998651, 1, 1, 1, 1, 1,
-0.4810102, -1.831011, -2.188011, 1, 1, 1, 1, 1,
-0.4802629, -0.7696007, -1.758867, 1, 1, 1, 1, 1,
-0.4785055, -0.7267161, -2.61957, 1, 1, 1, 1, 1,
-0.4781255, 1.430703, -0.3382103, 1, 1, 1, 1, 1,
-0.4712985, -0.055356, -1.351849, 1, 1, 1, 1, 1,
-0.470945, -1.407838, -2.915381, 1, 1, 1, 1, 1,
-0.4697037, 0.1182672, -0.6453553, 1, 1, 1, 1, 1,
-0.4647872, 0.5294571, -0.257535, 1, 1, 1, 1, 1,
-0.4561668, 1.142142, -0.1500552, 1, 1, 1, 1, 1,
-0.4555914, -2.026189, -3.286959, 0, 0, 1, 1, 1,
-0.4529635, -0.4548475, -3.522274, 1, 0, 0, 1, 1,
-0.4525189, 1.497128, 0.6511853, 1, 0, 0, 1, 1,
-0.452029, -1.046316, -2.48467, 1, 0, 0, 1, 1,
-0.450803, 0.1173223, -0.1105651, 1, 0, 0, 1, 1,
-0.4506775, 0.03565877, -2.167726, 1, 0, 0, 1, 1,
-0.4450483, -0.3343757, -0.7884309, 0, 0, 0, 1, 1,
-0.4433391, 1.244292, 0.1237594, 0, 0, 0, 1, 1,
-0.4408614, -0.3141394, -2.934446, 0, 0, 0, 1, 1,
-0.4407072, 1.238371, -1.266852, 0, 0, 0, 1, 1,
-0.4367237, 0.9933907, 0.5744373, 0, 0, 0, 1, 1,
-0.4306465, 0.6636081, -0.6019947, 0, 0, 0, 1, 1,
-0.4298482, 0.03003335, -1.379215, 0, 0, 0, 1, 1,
-0.4275462, -1.51806, -1.635903, 1, 1, 1, 1, 1,
-0.4265464, 1.517507, 1.391394, 1, 1, 1, 1, 1,
-0.424936, 1.156037, -0.4962091, 1, 1, 1, 1, 1,
-0.4167122, 0.3079686, -0.568143, 1, 1, 1, 1, 1,
-0.4146893, 0.3183293, 0.2322515, 1, 1, 1, 1, 1,
-0.4132914, -2.411486, -2.883049, 1, 1, 1, 1, 1,
-0.4129016, 1.05892, 1.311849, 1, 1, 1, 1, 1,
-0.4017638, 1.953202, 0.585388, 1, 1, 1, 1, 1,
-0.4010132, 1.37422, -0.9750301, 1, 1, 1, 1, 1,
-0.4006195, -0.1362315, -0.2138579, 1, 1, 1, 1, 1,
-0.396286, -1.275742, -2.593728, 1, 1, 1, 1, 1,
-0.3916647, 0.4432386, 0.4325699, 1, 1, 1, 1, 1,
-0.3915161, 1.15654, -0.8694091, 1, 1, 1, 1, 1,
-0.3912846, 0.4156495, -1.501095, 1, 1, 1, 1, 1,
-0.390056, -1.410517, -3.99503, 1, 1, 1, 1, 1,
-0.3888887, -2.011791, -4.282182, 0, 0, 1, 1, 1,
-0.3870712, -1.257081, -1.56354, 1, 0, 0, 1, 1,
-0.3865832, 1.217966, 1.506154, 1, 0, 0, 1, 1,
-0.3821027, -0.6391326, -1.358182, 1, 0, 0, 1, 1,
-0.3805845, -0.7381604, -4.076971, 1, 0, 0, 1, 1,
-0.3776607, 0.0589732, -2.056952, 1, 0, 0, 1, 1,
-0.3755371, -0.8923618, -3.789382, 0, 0, 0, 1, 1,
-0.373031, 0.5397956, -0.9371456, 0, 0, 0, 1, 1,
-0.3723166, 0.84953, 0.4250438, 0, 0, 0, 1, 1,
-0.3670867, 0.1133773, 1.02885, 0, 0, 0, 1, 1,
-0.3632428, -1.126335, -2.84828, 0, 0, 0, 1, 1,
-0.3620068, 0.0621815, -0.9652309, 0, 0, 0, 1, 1,
-0.3594958, -0.8130105, -2.472843, 0, 0, 0, 1, 1,
-0.354214, -1.168584, -2.469815, 1, 1, 1, 1, 1,
-0.3542007, 0.07575265, 0.5092191, 1, 1, 1, 1, 1,
-0.3492829, -1.923439, -3.095248, 1, 1, 1, 1, 1,
-0.3449924, 0.03672368, -1.292859, 1, 1, 1, 1, 1,
-0.3433203, 1.186104, -1.667717, 1, 1, 1, 1, 1,
-0.3431561, -1.258776, -3.012379, 1, 1, 1, 1, 1,
-0.3355764, -2.683591, -3.492119, 1, 1, 1, 1, 1,
-0.335131, 1.58319, -1.120638, 1, 1, 1, 1, 1,
-0.3335285, 0.8732646, 0.3235684, 1, 1, 1, 1, 1,
-0.3334845, 0.1822199, 0.7539777, 1, 1, 1, 1, 1,
-0.3324195, -0.1127634, -1.578173, 1, 1, 1, 1, 1,
-0.3301796, -0.5919852, -2.540818, 1, 1, 1, 1, 1,
-0.3254751, 0.6067806, -0.4658617, 1, 1, 1, 1, 1,
-0.3223585, 1.196042, 0.4036468, 1, 1, 1, 1, 1,
-0.3221146, -0.1829722, 0.8829871, 1, 1, 1, 1, 1,
-0.321221, -1.657989, -3.926129, 0, 0, 1, 1, 1,
-0.3196207, -0.2386842, -2.257607, 1, 0, 0, 1, 1,
-0.3194486, 0.4103811, -0.2380439, 1, 0, 0, 1, 1,
-0.3180707, 0.1929915, -0.9940321, 1, 0, 0, 1, 1,
-0.3167919, -1.094941, -3.510882, 1, 0, 0, 1, 1,
-0.3146488, -2.058775, -2.955649, 1, 0, 0, 1, 1,
-0.3134218, -0.3610433, -0.8082049, 0, 0, 0, 1, 1,
-0.3110654, 1.582042, 1.103852, 0, 0, 0, 1, 1,
-0.3094535, 0.1776383, -1.144778, 0, 0, 0, 1, 1,
-0.3073862, 0.9255565, 1.262699, 0, 0, 0, 1, 1,
-0.3070817, -0.9181859, -3.298314, 0, 0, 0, 1, 1,
-0.3067197, 1.653044, 0.3356583, 0, 0, 0, 1, 1,
-0.3066316, 1.27288, 0.3087259, 0, 0, 0, 1, 1,
-0.3040493, -0.7961886, -2.786059, 1, 1, 1, 1, 1,
-0.3039305, -1.357382, -2.559454, 1, 1, 1, 1, 1,
-0.3035898, 1.644293, 0.6182007, 1, 1, 1, 1, 1,
-0.2960342, 0.8252127, 1.26938, 1, 1, 1, 1, 1,
-0.2881398, -0.8855852, -2.548152, 1, 1, 1, 1, 1,
-0.2873228, -0.6394668, -2.10691, 1, 1, 1, 1, 1,
-0.2868415, -0.3678217, -1.405662, 1, 1, 1, 1, 1,
-0.2863658, 0.2408298, -0.65416, 1, 1, 1, 1, 1,
-0.2848, -1.961462, -1.705969, 1, 1, 1, 1, 1,
-0.2840461, 0.2191523, -0.01044199, 1, 1, 1, 1, 1,
-0.2829533, 0.6246845, -1.596859, 1, 1, 1, 1, 1,
-0.2805332, -0.8038459, -3.213594, 1, 1, 1, 1, 1,
-0.2734721, 0.7631491, -0.4683771, 1, 1, 1, 1, 1,
-0.2731422, -0.8458757, -1.403973, 1, 1, 1, 1, 1,
-0.2690759, 0.4582514, -0.3172369, 1, 1, 1, 1, 1,
-0.2682561, -0.0433225, -3.106932, 0, 0, 1, 1, 1,
-0.2661165, 0.5379808, -1.649912, 1, 0, 0, 1, 1,
-0.2641132, -0.4338321, -2.023773, 1, 0, 0, 1, 1,
-0.2638982, -0.5116457, -1.573938, 1, 0, 0, 1, 1,
-0.263099, 0.2415096, 0.4336774, 1, 0, 0, 1, 1,
-0.2628243, -0.5427974, -1.889476, 1, 0, 0, 1, 1,
-0.2609065, 1.003441, -0.6545841, 0, 0, 0, 1, 1,
-0.2594191, 2.69006, 1.013209, 0, 0, 0, 1, 1,
-0.2570004, 1.087733, 0.1753915, 0, 0, 0, 1, 1,
-0.252863, 0.1021002, -1.021224, 0, 0, 0, 1, 1,
-0.2474556, -0.2166437, -2.532579, 0, 0, 0, 1, 1,
-0.2452403, -1.61643, -3.226982, 0, 0, 0, 1, 1,
-0.2435194, 0.4155413, -2.044445, 0, 0, 0, 1, 1,
-0.24229, 0.1141202, -1.853257, 1, 1, 1, 1, 1,
-0.2399343, -0.2102467, -2.138842, 1, 1, 1, 1, 1,
-0.2389734, -0.09506834, -2.18296, 1, 1, 1, 1, 1,
-0.2366065, -0.3065948, -3.567212, 1, 1, 1, 1, 1,
-0.2337157, -1.100211, -1.176111, 1, 1, 1, 1, 1,
-0.2334208, -0.4787178, -1.010975, 1, 1, 1, 1, 1,
-0.2280555, 0.6973839, 0.5184705, 1, 1, 1, 1, 1,
-0.2223136, -0.01128947, -2.227895, 1, 1, 1, 1, 1,
-0.2204561, -0.1040495, -1.028059, 1, 1, 1, 1, 1,
-0.2186216, 1.739883, 0.4608466, 1, 1, 1, 1, 1,
-0.2150966, 1.518622, 0.5530704, 1, 1, 1, 1, 1,
-0.2113551, 0.5947114, 0.3701922, 1, 1, 1, 1, 1,
-0.2106006, -0.6790904, -2.759718, 1, 1, 1, 1, 1,
-0.2097492, 0.3272308, -1.317989, 1, 1, 1, 1, 1,
-0.2032598, -1.312931, -3.453092, 1, 1, 1, 1, 1,
-0.1952891, 0.1666661, -1.040976, 0, 0, 1, 1, 1,
-0.193952, -0.46663, -3.814856, 1, 0, 0, 1, 1,
-0.1876386, 0.838091, -1.986475, 1, 0, 0, 1, 1,
-0.1847814, -1.161517, -3.090299, 1, 0, 0, 1, 1,
-0.1779173, 0.5167207, -0.9158202, 1, 0, 0, 1, 1,
-0.1778714, -0.2457006, -2.449233, 1, 0, 0, 1, 1,
-0.1778354, 0.5588687, -0.5906721, 0, 0, 0, 1, 1,
-0.1733597, 0.3718184, 0.3384039, 0, 0, 0, 1, 1,
-0.1713353, 0.164068, -2.132015, 0, 0, 0, 1, 1,
-0.1694289, -0.6471898, -3.170291, 0, 0, 0, 1, 1,
-0.1681032, -1.891956, -3.363614, 0, 0, 0, 1, 1,
-0.1637221, 0.4899746, 0.2526194, 0, 0, 0, 1, 1,
-0.1630387, 0.4008498, -0.9942688, 0, 0, 0, 1, 1,
-0.1592992, 1.70189, 0.04739222, 1, 1, 1, 1, 1,
-0.1585124, -0.1646069, -2.552311, 1, 1, 1, 1, 1,
-0.1568647, -0.06910078, -3.190733, 1, 1, 1, 1, 1,
-0.1563468, 0.09422711, -0.4241396, 1, 1, 1, 1, 1,
-0.1555194, 0.5875399, -0.4877358, 1, 1, 1, 1, 1,
-0.1500586, -1.362586, -3.973441, 1, 1, 1, 1, 1,
-0.1376915, -1.203089, -4.822645, 1, 1, 1, 1, 1,
-0.1372784, -1.769162, -1.534848, 1, 1, 1, 1, 1,
-0.1321011, -0.7436544, -2.158322, 1, 1, 1, 1, 1,
-0.130083, 0.89091, -0.8536808, 1, 1, 1, 1, 1,
-0.1298612, -0.2190985, -1.299019, 1, 1, 1, 1, 1,
-0.1283859, -1.17504, -2.245964, 1, 1, 1, 1, 1,
-0.1280005, 0.1121585, -0.229243, 1, 1, 1, 1, 1,
-0.1270372, 0.535902, -2.023222, 1, 1, 1, 1, 1,
-0.1205873, 0.7834197, 0.2967085, 1, 1, 1, 1, 1,
-0.1185903, -0.7451056, -2.969301, 0, 0, 1, 1, 1,
-0.1175876, 0.509481, -0.2878634, 1, 0, 0, 1, 1,
-0.1159254, 0.6620057, -0.09138346, 1, 0, 0, 1, 1,
-0.1157645, -0.7170919, -1.645582, 1, 0, 0, 1, 1,
-0.1134692, 0.8517662, 0.310367, 1, 0, 0, 1, 1,
-0.1078144, -0.2369176, -2.15365, 1, 0, 0, 1, 1,
-0.1044161, 1.557931, -1.575408, 0, 0, 0, 1, 1,
-0.1019249, 2.449835, -0.5540314, 0, 0, 0, 1, 1,
-0.09763315, -0.7699169, -3.214228, 0, 0, 0, 1, 1,
-0.09673256, 0.3127854, -0.5602005, 0, 0, 0, 1, 1,
-0.09547023, 1.333887, -0.5745872, 0, 0, 0, 1, 1,
-0.09522017, 0.4258569, -1.55681, 0, 0, 0, 1, 1,
-0.0931072, -0.4173125, -2.417783, 0, 0, 0, 1, 1,
-0.09049356, -1.078684, -2.446178, 1, 1, 1, 1, 1,
-0.08831736, 0.5223843, -0.6141071, 1, 1, 1, 1, 1,
-0.0875711, -0.05480278, -2.23088, 1, 1, 1, 1, 1,
-0.08661522, -0.09933506, -2.561353, 1, 1, 1, 1, 1,
-0.08633254, 0.2402917, -2.129019, 1, 1, 1, 1, 1,
-0.08429047, 1.046307, -1.853451, 1, 1, 1, 1, 1,
-0.07728629, -1.059639, -3.596471, 1, 1, 1, 1, 1,
-0.07562529, -1.474698, -3.69815, 1, 1, 1, 1, 1,
-0.06989747, 0.1971556, -1.42941, 1, 1, 1, 1, 1,
-0.06858128, -2.486241, -2.355879, 1, 1, 1, 1, 1,
-0.06631611, 1.612304, -0.7067891, 1, 1, 1, 1, 1,
-0.06592125, 0.1017119, -0.3005681, 1, 1, 1, 1, 1,
-0.06092981, 0.6780283, -0.5799413, 1, 1, 1, 1, 1,
-0.05963156, 0.5752458, 1.60374, 1, 1, 1, 1, 1,
-0.05715908, 2.581128, -0.2007533, 1, 1, 1, 1, 1,
-0.05629838, 0.6527452, 0.77098, 0, 0, 1, 1, 1,
-0.05422853, 0.2448772, 1.107202, 1, 0, 0, 1, 1,
-0.05407793, 2.372199, -0.8197998, 1, 0, 0, 1, 1,
-0.05073128, -1.796941, -3.090451, 1, 0, 0, 1, 1,
-0.04630859, -2.101301, -4.856494, 1, 0, 0, 1, 1,
-0.04358239, -0.689099, -3.213147, 1, 0, 0, 1, 1,
-0.03824485, -0.3954021, -4.186322, 0, 0, 0, 1, 1,
-0.03235721, 1.497549, 1.226277, 0, 0, 0, 1, 1,
-0.03163006, -0.9085926, -5.065899, 0, 0, 0, 1, 1,
-0.02853701, -0.1560971, -3.467897, 0, 0, 0, 1, 1,
-0.02535727, 0.2065625, -1.894995, 0, 0, 0, 1, 1,
-0.02409465, -1.482364, -4.931083, 0, 0, 0, 1, 1,
-0.02381199, -1.589769, -3.111336, 0, 0, 0, 1, 1,
-0.02277401, -0.9540267, -4.732332, 1, 1, 1, 1, 1,
-0.02257871, -0.1298861, -2.35199, 1, 1, 1, 1, 1,
-0.02196541, 0.3461974, -1.327595, 1, 1, 1, 1, 1,
-0.02010571, -0.5102595, -3.078257, 1, 1, 1, 1, 1,
-0.01533293, -0.3906329, -2.846839, 1, 1, 1, 1, 1,
-0.01461407, -0.1181409, -2.828499, 1, 1, 1, 1, 1,
-0.01200533, 0.1773761, 0.7009186, 1, 1, 1, 1, 1,
-0.008857544, -0.9590735, -3.605497, 1, 1, 1, 1, 1,
-0.004532345, 0.5763657, 0.7074699, 1, 1, 1, 1, 1,
-0.002407361, 1.902331, 0.9943992, 1, 1, 1, 1, 1,
0.00113211, 1.590012, 0.9956324, 1, 1, 1, 1, 1,
0.003435577, 1.538651, -1.484848, 1, 1, 1, 1, 1,
0.007502921, -0.6520886, 4.393212, 1, 1, 1, 1, 1,
0.009526879, -0.5307649, 2.810691, 1, 1, 1, 1, 1,
0.01036812, -1.371851, 3.189462, 1, 1, 1, 1, 1,
0.01190386, -1.04159, 2.448219, 0, 0, 1, 1, 1,
0.01660166, -1.526651, 2.457563, 1, 0, 0, 1, 1,
0.01669163, 0.82377, -1.92252, 1, 0, 0, 1, 1,
0.01682535, 0.6699698, 0.4772712, 1, 0, 0, 1, 1,
0.01716783, -0.4188582, 3.068589, 1, 0, 0, 1, 1,
0.01798728, 0.4684643, -0.2401721, 1, 0, 0, 1, 1,
0.01806344, -0.2146575, 4.301919, 0, 0, 0, 1, 1,
0.01828412, 1.403454, -2.050315, 0, 0, 0, 1, 1,
0.01830765, 1.194618, -0.2717706, 0, 0, 0, 1, 1,
0.0204949, -0.4045146, 4.549858, 0, 0, 0, 1, 1,
0.0220093, -0.5738124, 2.122365, 0, 0, 0, 1, 1,
0.02306068, -0.6281825, 2.336239, 0, 0, 0, 1, 1,
0.02319172, 0.658269, 0.5612738, 0, 0, 0, 1, 1,
0.02487146, -2.26865, 3.565973, 1, 1, 1, 1, 1,
0.02573784, -1.288465, 2.156254, 1, 1, 1, 1, 1,
0.02888134, -0.7759928, 2.792601, 1, 1, 1, 1, 1,
0.02966526, 0.1411537, 1.141515, 1, 1, 1, 1, 1,
0.03023922, 0.1962582, -2.466733, 1, 1, 1, 1, 1,
0.03291865, -0.8814148, 1.581364, 1, 1, 1, 1, 1,
0.03312656, 0.3306526, 1.056667, 1, 1, 1, 1, 1,
0.03409719, -0.2585387, 5.048071, 1, 1, 1, 1, 1,
0.04047824, 0.4770437, 1.435147, 1, 1, 1, 1, 1,
0.04611433, 0.2265089, -0.7037587, 1, 1, 1, 1, 1,
0.04735853, 0.6178785, -0.4274139, 1, 1, 1, 1, 1,
0.05002594, -1.075501, 2.892832, 1, 1, 1, 1, 1,
0.05048214, -0.8571821, 5.545024, 1, 1, 1, 1, 1,
0.05151062, -0.8060626, 4.044545, 1, 1, 1, 1, 1,
0.05387311, -1.214473, 2.463548, 1, 1, 1, 1, 1,
0.05534327, -0.133309, 2.566606, 0, 0, 1, 1, 1,
0.05577797, 0.0936558, -0.4216575, 1, 0, 0, 1, 1,
0.08498809, -0.006501024, 3.432732, 1, 0, 0, 1, 1,
0.08557549, 0.7586901, 1.749287, 1, 0, 0, 1, 1,
0.08606308, 0.2905941, 0.7536248, 1, 0, 0, 1, 1,
0.08640615, -1.234912, 3.088338, 1, 0, 0, 1, 1,
0.09156764, 1.869152, 1.812085, 0, 0, 0, 1, 1,
0.0929587, -0.2331547, 3.210036, 0, 0, 0, 1, 1,
0.0934899, 0.5422069, 0.09735072, 0, 0, 0, 1, 1,
0.0939526, 0.2785794, 1.911111, 0, 0, 0, 1, 1,
0.09973141, 0.5958366, -0.1132766, 0, 0, 0, 1, 1,
0.1068628, 1.014005, 0.1881051, 0, 0, 0, 1, 1,
0.1079268, -1.769454, 3.599757, 0, 0, 0, 1, 1,
0.1117135, -0.1842152, 2.730757, 1, 1, 1, 1, 1,
0.1168462, 1.21633, 0.4967974, 1, 1, 1, 1, 1,
0.1212763, -0.1670095, 1.757822, 1, 1, 1, 1, 1,
0.1225652, -0.3931355, 2.17628, 1, 1, 1, 1, 1,
0.1234853, -0.3233344, 2.182202, 1, 1, 1, 1, 1,
0.1236257, 2.015152, -0.6945543, 1, 1, 1, 1, 1,
0.1245782, 0.3432389, 1.273816, 1, 1, 1, 1, 1,
0.1247132, -0.7112816, 3.679143, 1, 1, 1, 1, 1,
0.1248935, 0.5853763, 0.8043002, 1, 1, 1, 1, 1,
0.124914, -0.04992441, 2.83932, 1, 1, 1, 1, 1,
0.1282236, -0.3615212, 3.748342, 1, 1, 1, 1, 1,
0.1312508, 0.2868155, 2.394466, 1, 1, 1, 1, 1,
0.1394305, 0.6906009, -0.2201876, 1, 1, 1, 1, 1,
0.144089, -1.731794, 2.591539, 1, 1, 1, 1, 1,
0.1519017, -1.165411, 4.673697, 1, 1, 1, 1, 1,
0.1537716, -0.3404014, 2.723094, 0, 0, 1, 1, 1,
0.1555158, -1.581336, 2.592798, 1, 0, 0, 1, 1,
0.1607918, -3.422368, 3.904014, 1, 0, 0, 1, 1,
0.1618658, -0.1099616, 2.210731, 1, 0, 0, 1, 1,
0.1655536, 0.2228488, 0.7322191, 1, 0, 0, 1, 1,
0.1764093, 1.363556, 1.61056, 1, 0, 0, 1, 1,
0.1771993, -0.4531335, 3.454957, 0, 0, 0, 1, 1,
0.1795836, -0.2769065, 2.911315, 0, 0, 0, 1, 1,
0.1803135, -2.068254, 3.110963, 0, 0, 0, 1, 1,
0.1804389, 0.07057619, 1.142383, 0, 0, 0, 1, 1,
0.1814459, 0.6591554, -0.02687788, 0, 0, 0, 1, 1,
0.1817804, 0.7858418, 2.54362, 0, 0, 0, 1, 1,
0.1838121, -0.1966634, 1.957143, 0, 0, 0, 1, 1,
0.183872, -0.9889311, 4.730934, 1, 1, 1, 1, 1,
0.1846846, -0.5466105, 3.38378, 1, 1, 1, 1, 1,
0.1869379, -0.09400932, 1.409487, 1, 1, 1, 1, 1,
0.1920459, 0.2276629, 0.2649223, 1, 1, 1, 1, 1,
0.1964115, -1.680897, 3.40867, 1, 1, 1, 1, 1,
0.1971122, -0.03863671, 1.743536, 1, 1, 1, 1, 1,
0.1977093, -1.567572, 4.462811, 1, 1, 1, 1, 1,
0.203661, 1.597525, 1.618023, 1, 1, 1, 1, 1,
0.2039423, 0.8975263, -1.125779, 1, 1, 1, 1, 1,
0.2040417, 1.483473, -0.8851139, 1, 1, 1, 1, 1,
0.2055225, 0.9071323, 0.400663, 1, 1, 1, 1, 1,
0.2067635, -0.7174846, 2.202784, 1, 1, 1, 1, 1,
0.2071873, -0.4228609, 4.357401, 1, 1, 1, 1, 1,
0.2113137, 1.39031, 1.004032, 1, 1, 1, 1, 1,
0.2131542, 0.594296, -0.8786477, 1, 1, 1, 1, 1,
0.2141465, -0.2073499, 2.177082, 0, 0, 1, 1, 1,
0.2251019, -1.04849, 3.996386, 1, 0, 0, 1, 1,
0.2259702, 0.4119502, 0.7600373, 1, 0, 0, 1, 1,
0.2348145, -0.7964696, 1.749214, 1, 0, 0, 1, 1,
0.2349684, -1.785506, 2.700496, 1, 0, 0, 1, 1,
0.2357229, 0.3172682, 1.009944, 1, 0, 0, 1, 1,
0.2383884, 0.008096204, 1.306916, 0, 0, 0, 1, 1,
0.2430272, 0.4464927, 2.315972, 0, 0, 0, 1, 1,
0.2432555, 0.5512911, 0.3662025, 0, 0, 0, 1, 1,
0.2489086, 1.613034, 2.3049, 0, 0, 0, 1, 1,
0.2504389, -1.239465, 1.242214, 0, 0, 0, 1, 1,
0.2516073, -0.3039482, 2.522844, 0, 0, 0, 1, 1,
0.2582172, 0.6220384, -0.8813449, 0, 0, 0, 1, 1,
0.2624285, 0.3340977, -0.2671536, 1, 1, 1, 1, 1,
0.2665835, -1.397125, 4.108263, 1, 1, 1, 1, 1,
0.2710918, -0.5250556, 2.749595, 1, 1, 1, 1, 1,
0.2801387, -0.1813524, 2.676457, 1, 1, 1, 1, 1,
0.2817155, 0.8213789, 0.5281652, 1, 1, 1, 1, 1,
0.2855128, -1.181183, 5.132342, 1, 1, 1, 1, 1,
0.28651, -0.1880987, 2.371554, 1, 1, 1, 1, 1,
0.2940699, -2.228296, 2.517079, 1, 1, 1, 1, 1,
0.2949221, -0.7523805, 4.915986, 1, 1, 1, 1, 1,
0.294965, -1.156299, 3.039348, 1, 1, 1, 1, 1,
0.2956279, -0.4184478, 2.884629, 1, 1, 1, 1, 1,
0.2987567, 0.1280769, 2.792377, 1, 1, 1, 1, 1,
0.3066439, 1.164758, 1.561886, 1, 1, 1, 1, 1,
0.3088832, -0.5689791, 4.802827, 1, 1, 1, 1, 1,
0.3180631, 1.771349, -0.1566902, 1, 1, 1, 1, 1,
0.3181419, -0.07274108, 2.008794, 0, 0, 1, 1, 1,
0.3199539, 0.2972797, 0.3573108, 1, 0, 0, 1, 1,
0.3204928, 0.7886586, -0.3562804, 1, 0, 0, 1, 1,
0.3205656, -0.3656417, 0.9328101, 1, 0, 0, 1, 1,
0.3206952, -1.042557, 1.315463, 1, 0, 0, 1, 1,
0.3214989, -0.3421517, 0.1959091, 1, 0, 0, 1, 1,
0.3224526, 0.05795424, 1.260833, 0, 0, 0, 1, 1,
0.3250427, -0.656476, 6.300524, 0, 0, 0, 1, 1,
0.3282298, -1.523271, 2.416284, 0, 0, 0, 1, 1,
0.3308669, 0.500363, 1.694786, 0, 0, 0, 1, 1,
0.3333496, -0.0999239, 0.6097385, 0, 0, 0, 1, 1,
0.3342665, 0.3002277, 1.241981, 0, 0, 0, 1, 1,
0.3367383, -0.4958444, 3.95241, 0, 0, 0, 1, 1,
0.3382216, 0.5159468, 0.6420679, 1, 1, 1, 1, 1,
0.3419339, 0.7301601, 0.8419651, 1, 1, 1, 1, 1,
0.3439001, 0.5605314, 2.475358, 1, 1, 1, 1, 1,
0.3463916, -0.1127226, 1.56863, 1, 1, 1, 1, 1,
0.3466778, -0.2328195, 1.504434, 1, 1, 1, 1, 1,
0.3493956, 0.6295429, -1.628431, 1, 1, 1, 1, 1,
0.3548443, 0.03336114, 0.3023111, 1, 1, 1, 1, 1,
0.3607337, 0.4553805, -1.233262, 1, 1, 1, 1, 1,
0.3615659, -1.825616, 2.893634, 1, 1, 1, 1, 1,
0.3619267, -0.8570649, 3.758113, 1, 1, 1, 1, 1,
0.3622278, -0.382223, 2.600377, 1, 1, 1, 1, 1,
0.3652472, -0.4035032, 3.878596, 1, 1, 1, 1, 1,
0.3657656, 0.06136381, 3.571321, 1, 1, 1, 1, 1,
0.3668398, -0.4973408, 0.885156, 1, 1, 1, 1, 1,
0.3708881, 0.692351, 1.628542, 1, 1, 1, 1, 1,
0.3710649, -0.4188436, 2.55653, 0, 0, 1, 1, 1,
0.3728249, 0.7464178, 1.999066, 1, 0, 0, 1, 1,
0.3758205, -0.2643755, 2.228895, 1, 0, 0, 1, 1,
0.379905, -1.587072, 4.322311, 1, 0, 0, 1, 1,
0.3803412, -1.170081, 3.142342, 1, 0, 0, 1, 1,
0.3858184, -0.301383, 0.56441, 1, 0, 0, 1, 1,
0.3949786, -0.6060384, 1.994847, 0, 0, 0, 1, 1,
0.3967076, 2.373628, 0.2334122, 0, 0, 0, 1, 1,
0.3997646, 0.1059417, 0.7543973, 0, 0, 0, 1, 1,
0.4050812, 0.3355963, 0.05972563, 0, 0, 0, 1, 1,
0.4116288, 0.2427552, 0.2141933, 0, 0, 0, 1, 1,
0.4122257, -0.8968902, 4.418468, 0, 0, 0, 1, 1,
0.4129128, 0.6753379, 0.5556257, 0, 0, 0, 1, 1,
0.4138537, -0.9796084, 4.338433, 1, 1, 1, 1, 1,
0.4140128, -1.404088, 4.166202, 1, 1, 1, 1, 1,
0.4153062, -0.05803083, -0.2109811, 1, 1, 1, 1, 1,
0.4174698, -0.06328464, 3.019642, 1, 1, 1, 1, 1,
0.4189406, 0.937008, 0.6230838, 1, 1, 1, 1, 1,
0.4189959, 0.9079888, -0.6163966, 1, 1, 1, 1, 1,
0.4242155, -0.870392, 4.555731, 1, 1, 1, 1, 1,
0.426127, -2.224188, 3.884517, 1, 1, 1, 1, 1,
0.4324704, -1.41277, 3.579908, 1, 1, 1, 1, 1,
0.4342936, 0.8059112, 0.1617138, 1, 1, 1, 1, 1,
0.435109, 1.268292, 0.3812791, 1, 1, 1, 1, 1,
0.4373834, 0.109161, 2.145803, 1, 1, 1, 1, 1,
0.438581, 0.1343524, 0.7267899, 1, 1, 1, 1, 1,
0.4399313, -1.36528, 2.436568, 1, 1, 1, 1, 1,
0.4473054, -1.123465, 3.252409, 1, 1, 1, 1, 1,
0.4478828, 0.9061548, 0.8645724, 0, 0, 1, 1, 1,
0.4495007, 0.579008, 1.551388, 1, 0, 0, 1, 1,
0.4532045, 1.197176, 1.320138, 1, 0, 0, 1, 1,
0.4538702, 1.203444, 1.414971, 1, 0, 0, 1, 1,
0.4555688, -0.4097922, 0.683248, 1, 0, 0, 1, 1,
0.4566667, -0.09929264, 2.616745, 1, 0, 0, 1, 1,
0.4566743, -0.5210095, 1.141631, 0, 0, 0, 1, 1,
0.4575352, 0.01713089, 0.3068392, 0, 0, 0, 1, 1,
0.458285, -0.09550866, 1.575342, 0, 0, 0, 1, 1,
0.464406, -0.1529454, 1.579423, 0, 0, 0, 1, 1,
0.4644919, -1.933425, 2.760884, 0, 0, 0, 1, 1,
0.4676635, -0.8375428, 2.827219, 0, 0, 0, 1, 1,
0.4704262, 0.4075321, -0.694643, 0, 0, 0, 1, 1,
0.4750618, -0.9209597, 3.11669, 1, 1, 1, 1, 1,
0.475739, 0.2101392, 1.113941, 1, 1, 1, 1, 1,
0.4898482, 0.4450204, 0.3695706, 1, 1, 1, 1, 1,
0.4946676, -1.317229, 4.156421, 1, 1, 1, 1, 1,
0.4979656, 0.3578821, 0.6705782, 1, 1, 1, 1, 1,
0.4998147, -0.6219269, 3.20605, 1, 1, 1, 1, 1,
0.5007103, -1.05992, 4.171319, 1, 1, 1, 1, 1,
0.5052211, -1.76438, 4.641617, 1, 1, 1, 1, 1,
0.5082164, -0.4766855, 2.321613, 1, 1, 1, 1, 1,
0.5109502, 0.0316171, 1.082927, 1, 1, 1, 1, 1,
0.5128148, -1.007726, 2.731932, 1, 1, 1, 1, 1,
0.5174546, -0.07463522, 0.8299045, 1, 1, 1, 1, 1,
0.5208112, 0.3991162, 1.418414, 1, 1, 1, 1, 1,
0.5224384, 0.1375444, 1.221936, 1, 1, 1, 1, 1,
0.5263504, 0.5547547, 1.553542, 1, 1, 1, 1, 1,
0.5302017, -1.026632, 3.288943, 0, 0, 1, 1, 1,
0.5433931, -0.3883186, 2.36431, 1, 0, 0, 1, 1,
0.5440391, -0.5012059, 0.1762482, 1, 0, 0, 1, 1,
0.545931, -1.279962, 1.300067, 1, 0, 0, 1, 1,
0.5479057, 0.9759758, -1.165264, 1, 0, 0, 1, 1,
0.5480413, -0.9557595, 3.092953, 1, 0, 0, 1, 1,
0.5491894, 0.5960495, 0.5411, 0, 0, 0, 1, 1,
0.5496508, -0.3148771, 1.673399, 0, 0, 0, 1, 1,
0.555898, -1.088403, 0.4774333, 0, 0, 0, 1, 1,
0.5569912, 0.1271899, 0.177868, 0, 0, 0, 1, 1,
0.5593155, 1.26099, -0.03042178, 0, 0, 0, 1, 1,
0.5599748, -0.3760662, 3.311701, 0, 0, 0, 1, 1,
0.5638618, -0.4689136, 2.438094, 0, 0, 0, 1, 1,
0.5657017, -0.1216743, 1.583936, 1, 1, 1, 1, 1,
0.5715981, -0.1332117, 0.2830838, 1, 1, 1, 1, 1,
0.572638, 0.1631083, 2.153211, 1, 1, 1, 1, 1,
0.5733954, -0.736083, 2.340173, 1, 1, 1, 1, 1,
0.5751376, 1.583623, 1.174146, 1, 1, 1, 1, 1,
0.5755563, -0.4074, 4.300406, 1, 1, 1, 1, 1,
0.5828235, -1.581279, 3.842168, 1, 1, 1, 1, 1,
0.587548, -0.2406519, 2.56194, 1, 1, 1, 1, 1,
0.5881276, 0.4111667, 2.788682, 1, 1, 1, 1, 1,
0.5894986, 0.2927528, 1.23321, 1, 1, 1, 1, 1,
0.5907564, 1.072768, 2.171848, 1, 1, 1, 1, 1,
0.591624, -1.018586, 2.807472, 1, 1, 1, 1, 1,
0.5923247, 1.281185, 0.5285903, 1, 1, 1, 1, 1,
0.5958189, -1.096419, 2.790068, 1, 1, 1, 1, 1,
0.5979893, 0.08701609, 1.453462, 1, 1, 1, 1, 1,
0.6038114, -0.3624804, 2.047109, 0, 0, 1, 1, 1,
0.6038256, 0.2099438, 0.8773302, 1, 0, 0, 1, 1,
0.6071805, 2.473557, 0.8196234, 1, 0, 0, 1, 1,
0.6103952, 0.5000179, 1.548055, 1, 0, 0, 1, 1,
0.6159278, -1.430467, 1.991246, 1, 0, 0, 1, 1,
0.6184983, -0.5280514, -0.08603047, 1, 0, 0, 1, 1,
0.6191455, 1.840727, -0.7460138, 0, 0, 0, 1, 1,
0.6225194, 0.3420906, 1.598072, 0, 0, 0, 1, 1,
0.6252234, -0.536731, 1.254812, 0, 0, 0, 1, 1,
0.6256541, -0.8109381, 2.138194, 0, 0, 0, 1, 1,
0.6257261, 1.127877, 0.5897884, 0, 0, 0, 1, 1,
0.6312488, -1.352466, 1.391715, 0, 0, 0, 1, 1,
0.635514, 0.8384736, 1.974935, 0, 0, 0, 1, 1,
0.6388804, -0.7292089, 2.656667, 1, 1, 1, 1, 1,
0.6390335, -1.268141, 2.602955, 1, 1, 1, 1, 1,
0.6436377, 0.1874252, 0.7115045, 1, 1, 1, 1, 1,
0.6529074, -1.024598, 2.818134, 1, 1, 1, 1, 1,
0.6597108, 0.1556222, 1.711529, 1, 1, 1, 1, 1,
0.665664, -0.7565166, 1.770429, 1, 1, 1, 1, 1,
0.669781, -0.298324, 1.938382, 1, 1, 1, 1, 1,
0.6707976, 1.111468, 0.5585923, 1, 1, 1, 1, 1,
0.6787581, 0.2346684, 1.15964, 1, 1, 1, 1, 1,
0.6795827, -0.5574299, 2.937141, 1, 1, 1, 1, 1,
0.6804106, -0.786577, 1.834214, 1, 1, 1, 1, 1,
0.6809213, -1.296774, 0.5940052, 1, 1, 1, 1, 1,
0.6809964, -0.7888377, 2.580047, 1, 1, 1, 1, 1,
0.6825561, -2.017835, 2.081502, 1, 1, 1, 1, 1,
0.6845985, 0.4858173, -0.7518259, 1, 1, 1, 1, 1,
0.6849887, -0.8752075, 3.833732, 0, 0, 1, 1, 1,
0.6895584, 1.852724, 1.470091, 1, 0, 0, 1, 1,
0.6907951, -0.8707656, 3.091276, 1, 0, 0, 1, 1,
0.7038458, -0.9424846, 2.274053, 1, 0, 0, 1, 1,
0.7040953, 0.4937519, 1.411022, 1, 0, 0, 1, 1,
0.7086499, -0.5521519, 1.506548, 1, 0, 0, 1, 1,
0.7092255, 1.256028, 1.686849, 0, 0, 0, 1, 1,
0.709243, -1.317867, 1.954435, 0, 0, 0, 1, 1,
0.7106698, -1.383232, 3.695956, 0, 0, 0, 1, 1,
0.7175897, -0.5048075, 0.3121866, 0, 0, 0, 1, 1,
0.7177523, -1.593239, 2.012868, 0, 0, 0, 1, 1,
0.7203869, -1.351089, 1.458365, 0, 0, 0, 1, 1,
0.7222456, -0.6863611, 1.888826, 0, 0, 0, 1, 1,
0.7307424, -0.869738, 3.601546, 1, 1, 1, 1, 1,
0.730979, 0.9304322, 1.239257, 1, 1, 1, 1, 1,
0.7324636, 0.8553094, 2.811492, 1, 1, 1, 1, 1,
0.7356625, -0.5597761, 2.59364, 1, 1, 1, 1, 1,
0.741366, -0.6939167, 1.645263, 1, 1, 1, 1, 1,
0.751332, 1.582703, 1.815719, 1, 1, 1, 1, 1,
0.7552213, -1.517023, 1.595648, 1, 1, 1, 1, 1,
0.7571213, 0.9523348, 0.9785238, 1, 1, 1, 1, 1,
0.7587035, 0.08142102, 0.9406031, 1, 1, 1, 1, 1,
0.7598878, -0.3222352, 1.407838, 1, 1, 1, 1, 1,
0.7629285, 0.1239116, 0.4924414, 1, 1, 1, 1, 1,
0.765891, 0.443319, 3.133391, 1, 1, 1, 1, 1,
0.7704051, 1.644681, 0.4953472, 1, 1, 1, 1, 1,
0.7707347, -0.07259902, 2.288164, 1, 1, 1, 1, 1,
0.7707745, -1.508978, 2.112062, 1, 1, 1, 1, 1,
0.7713233, 1.226324, 0.3021713, 0, 0, 1, 1, 1,
0.7767132, -1.503022, 3.304924, 1, 0, 0, 1, 1,
0.7796937, -0.5829147, 2.912498, 1, 0, 0, 1, 1,
0.7824643, -0.7104574, -0.5608689, 1, 0, 0, 1, 1,
0.7834713, -0.1232339, 2.898241, 1, 0, 0, 1, 1,
0.7934805, 1.148777, 2.476967, 1, 0, 0, 1, 1,
0.794251, 0.2258785, 1.080381, 0, 0, 0, 1, 1,
0.7951514, 0.2804625, 1.27177, 0, 0, 0, 1, 1,
0.7961439, 1.265188, 1.650493, 0, 0, 0, 1, 1,
0.7963802, 1.211044, 1.291901, 0, 0, 0, 1, 1,
0.7972671, 1.602559, -0.1569863, 0, 0, 0, 1, 1,
0.8004751, 0.3889177, 0.1806458, 0, 0, 0, 1, 1,
0.8022924, -1.531942, 2.537121, 0, 0, 0, 1, 1,
0.8082832, 1.470266, 1.114384, 1, 1, 1, 1, 1,
0.8130031, 1.51867, 2.000336, 1, 1, 1, 1, 1,
0.8133779, -1.009213, 0.8114787, 1, 1, 1, 1, 1,
0.8148019, -1.507025, 3.033064, 1, 1, 1, 1, 1,
0.8160018, -0.481973, 3.045442, 1, 1, 1, 1, 1,
0.8172147, -0.3320941, 1.217065, 1, 1, 1, 1, 1,
0.8245637, -0.4958006, 2.294495, 1, 1, 1, 1, 1,
0.8357584, -1.3992, 3.842818, 1, 1, 1, 1, 1,
0.8383671, -0.08372815, 1.587369, 1, 1, 1, 1, 1,
0.8399138, 1.571836, 0.1381785, 1, 1, 1, 1, 1,
0.8411949, -0.7786959, 1.499301, 1, 1, 1, 1, 1,
0.860065, 1.515697, 1.196451, 1, 1, 1, 1, 1,
0.8628983, -0.6578179, 2.804136, 1, 1, 1, 1, 1,
0.8662976, -2.263397, 3.680149, 1, 1, 1, 1, 1,
0.8756723, -0.5252437, 1.583626, 1, 1, 1, 1, 1,
0.8844689, 1.220108, 0.08522736, 0, 0, 1, 1, 1,
0.8945214, -0.0718533, -0.336429, 1, 0, 0, 1, 1,
0.8955743, -1.520177, 2.628452, 1, 0, 0, 1, 1,
0.9086341, -0.02547128, 0.6957133, 1, 0, 0, 1, 1,
0.9096594, -0.9789777, 1.611559, 1, 0, 0, 1, 1,
0.9110023, -0.9712111, 2.601493, 1, 0, 0, 1, 1,
0.9136618, -2.593817, 2.957971, 0, 0, 0, 1, 1,
0.9212982, 1.781702, 1.674211, 0, 0, 0, 1, 1,
0.922503, -0.5700077, 3.061409, 0, 0, 0, 1, 1,
0.9269244, -1.196012, 2.848118, 0, 0, 0, 1, 1,
0.9329458, -0.4157929, 1.404695, 0, 0, 0, 1, 1,
0.9331602, -0.003485238, 0.7150149, 0, 0, 0, 1, 1,
0.9341601, -1.727935, 2.266543, 0, 0, 0, 1, 1,
0.9349216, 0.3427043, 1.870135, 1, 1, 1, 1, 1,
0.9413133, 0.5258845, 2.923373, 1, 1, 1, 1, 1,
0.94333, 0.08725987, 1.458706, 1, 1, 1, 1, 1,
0.9444148, 0.4858489, -0.2268565, 1, 1, 1, 1, 1,
0.9445394, 1.19576, 1.369334, 1, 1, 1, 1, 1,
0.946328, 0.1602218, -0.01697746, 1, 1, 1, 1, 1,
0.9464374, 0.8588316, 2.415118, 1, 1, 1, 1, 1,
0.9494401, 0.5587491, -0.310965, 1, 1, 1, 1, 1,
0.9537836, 0.4118565, 2.160412, 1, 1, 1, 1, 1,
0.9556993, 0.4955602, 1.381184, 1, 1, 1, 1, 1,
0.9670704, -1.29424, 3.092678, 1, 1, 1, 1, 1,
0.9696116, 0.5024921, 0.6244403, 1, 1, 1, 1, 1,
0.9813505, 0.7820133, 0.1188516, 1, 1, 1, 1, 1,
0.984408, -0.7078472, 1.21088, 1, 1, 1, 1, 1,
0.9872373, 0.1743074, 2.351315, 1, 1, 1, 1, 1,
0.9900623, -1.998995, 1.430904, 0, 0, 1, 1, 1,
0.9936678, -0.3781296, 2.363591, 1, 0, 0, 1, 1,
0.9994312, -1.278098, 0.9803209, 1, 0, 0, 1, 1,
1.00452, -1.468953, 3.233476, 1, 0, 0, 1, 1,
1.005045, -0.6653944, 1.664557, 1, 0, 0, 1, 1,
1.012034, 2.474559, -1.099913, 1, 0, 0, 1, 1,
1.013017, 0.3672195, 1.242546, 0, 0, 0, 1, 1,
1.014592, -1.392264, 2.853445, 0, 0, 0, 1, 1,
1.016287, -1.331002, 3.906344, 0, 0, 0, 1, 1,
1.018043, 0.8178747, 1.170999, 0, 0, 0, 1, 1,
1.022739, -1.153799, 3.306663, 0, 0, 0, 1, 1,
1.029768, -0.05898357, 0.8196457, 0, 0, 0, 1, 1,
1.03309, 1.675655, -0.009225513, 0, 0, 0, 1, 1,
1.035215, -0.6629132, 3.6853, 1, 1, 1, 1, 1,
1.043585, 0.7111731, 0.2448845, 1, 1, 1, 1, 1,
1.047114, 1.081128, 2.027044, 1, 1, 1, 1, 1,
1.048704, 1.121338, 0.1713683, 1, 1, 1, 1, 1,
1.048907, 0.9043157, 0.6410956, 1, 1, 1, 1, 1,
1.050344, 0.5205803, 1.308764, 1, 1, 1, 1, 1,
1.060296, 2.228285, -0.3782629, 1, 1, 1, 1, 1,
1.063567, 0.5479072, -1.83069, 1, 1, 1, 1, 1,
1.075026, -0.6309351, 3.155884, 1, 1, 1, 1, 1,
1.081675, -1.172962, 2.249461, 1, 1, 1, 1, 1,
1.098604, -1.357572, 2.611595, 1, 1, 1, 1, 1,
1.098611, -1.324271, 1.817209, 1, 1, 1, 1, 1,
1.107522, 0.7391017, 0.3220061, 1, 1, 1, 1, 1,
1.111595, -1.758621, 1.629595, 1, 1, 1, 1, 1,
1.117877, -0.2943076, 0.8537646, 1, 1, 1, 1, 1,
1.118935, -0.3264113, 2.311015, 0, 0, 1, 1, 1,
1.12094, -1.35901, 1.86387, 1, 0, 0, 1, 1,
1.126724, 1.312787, 1.675009, 1, 0, 0, 1, 1,
1.130572, 1.140886, -0.9698763, 1, 0, 0, 1, 1,
1.134724, 0.9766199, -0.5660448, 1, 0, 0, 1, 1,
1.135481, 1.022397, 0.4474217, 1, 0, 0, 1, 1,
1.139836, -0.846279, 2.990221, 0, 0, 0, 1, 1,
1.141339, 0.9489987, 1.08768, 0, 0, 0, 1, 1,
1.143132, 1.546878, 0.7798598, 0, 0, 0, 1, 1,
1.151566, 0.8279518, 1.204695, 0, 0, 0, 1, 1,
1.152438, 1.393573, 1.105142, 0, 0, 0, 1, 1,
1.158633, 0.09574044, 1.14688, 0, 0, 0, 1, 1,
1.167542, -0.7452044, 1.329437, 0, 0, 0, 1, 1,
1.176296, 0.5978769, 1.254236, 1, 1, 1, 1, 1,
1.183236, 1.169441, 1.335527, 1, 1, 1, 1, 1,
1.185798, 1.416063, 1.443415, 1, 1, 1, 1, 1,
1.185955, -0.6804175, 3.233638, 1, 1, 1, 1, 1,
1.186776, -0.3929437, 1.700282, 1, 1, 1, 1, 1,
1.189666, -0.371502, 2.419439, 1, 1, 1, 1, 1,
1.19732, -0.7195362, 1.036792, 1, 1, 1, 1, 1,
1.203415, -0.2044439, -0.2702656, 1, 1, 1, 1, 1,
1.208967, 0.3230174, -0.6899665, 1, 1, 1, 1, 1,
1.212537, 0.1158669, 0.8631844, 1, 1, 1, 1, 1,
1.216345, -0.9035859, 4.150421, 1, 1, 1, 1, 1,
1.219242, -0.1216118, 0.8774125, 1, 1, 1, 1, 1,
1.23249, 1.13108, 1.258159, 1, 1, 1, 1, 1,
1.244034, -0.410611, -0.288691, 1, 1, 1, 1, 1,
1.256588, -0.1188173, 1.268331, 1, 1, 1, 1, 1,
1.258557, 0.201604, 2.844193, 0, 0, 1, 1, 1,
1.262341, -0.6285924, 1.220604, 1, 0, 0, 1, 1,
1.266516, 1.009874, 0.6442299, 1, 0, 0, 1, 1,
1.273478, 0.0818018, 2.931588, 1, 0, 0, 1, 1,
1.274619, 0.6420488, 2.360623, 1, 0, 0, 1, 1,
1.278462, 1.011489, 0.5065619, 1, 0, 0, 1, 1,
1.283544, 0.5399426, 1.017521, 0, 0, 0, 1, 1,
1.287799, 2.18924, 0.6677461, 0, 0, 0, 1, 1,
1.290042, -1.045511, 3.033251, 0, 0, 0, 1, 1,
1.290988, 0.8455225, -0.3481568, 0, 0, 0, 1, 1,
1.291704, 0.4037669, 2.326663, 0, 0, 0, 1, 1,
1.294621, -0.3632585, 0.580319, 0, 0, 0, 1, 1,
1.295019, -1.072468, 2.617049, 0, 0, 0, 1, 1,
1.31011, -0.2360777, 2.793331, 1, 1, 1, 1, 1,
1.313127, 0.351094, 1.052334, 1, 1, 1, 1, 1,
1.318747, 0.8199384, 0.7521316, 1, 1, 1, 1, 1,
1.323913, -2.096368, 3.452189, 1, 1, 1, 1, 1,
1.329762, -1.773953, -0.1834227, 1, 1, 1, 1, 1,
1.339848, -0.3591124, 3.13275, 1, 1, 1, 1, 1,
1.35243, 1.629669, 1.253283, 1, 1, 1, 1, 1,
1.355983, -0.336067, 2.253922, 1, 1, 1, 1, 1,
1.374283, 0.308313, 2.618654, 1, 1, 1, 1, 1,
1.381463, 0.557303, 1.721117, 1, 1, 1, 1, 1,
1.393603, -1.381035, 3.620764, 1, 1, 1, 1, 1,
1.399744, -1.840315, 3.067213, 1, 1, 1, 1, 1,
1.407604, -0.8613704, 3.0391, 1, 1, 1, 1, 1,
1.411146, 0.5257871, 2.280833, 1, 1, 1, 1, 1,
1.417442, -0.2097517, 1.128064, 1, 1, 1, 1, 1,
1.422773, 0.4802419, 1.356023, 0, 0, 1, 1, 1,
1.42587, -1.184242, 3.544155, 1, 0, 0, 1, 1,
1.429225, -0.9677592, 1.997755, 1, 0, 0, 1, 1,
1.434509, -0.7836155, 2.320606, 1, 0, 0, 1, 1,
1.443912, 0.7638823, 2.030256, 1, 0, 0, 1, 1,
1.444831, -0.4178151, 1.108927, 1, 0, 0, 1, 1,
1.448511, 0.07103535, 0.9942068, 0, 0, 0, 1, 1,
1.449394, 1.128642, 1.932629, 0, 0, 0, 1, 1,
1.476718, -0.1415349, 1.408036, 0, 0, 0, 1, 1,
1.483496, 0.02546628, 0.01794719, 0, 0, 0, 1, 1,
1.513517, -0.7491245, 1.926389, 0, 0, 0, 1, 1,
1.518187, 0.3684995, 1.000067, 0, 0, 0, 1, 1,
1.523317, 1.026284, 0.08857316, 0, 0, 0, 1, 1,
1.524314, -0.4914039, 1.24914, 1, 1, 1, 1, 1,
1.542708, 1.406111, -0.1299843, 1, 1, 1, 1, 1,
1.544985, -0.06320386, 2.175727, 1, 1, 1, 1, 1,
1.562361, 0.7009885, 2.140273, 1, 1, 1, 1, 1,
1.569811, -0.1939623, 2.989006, 1, 1, 1, 1, 1,
1.571024, -0.6166357, 2.444168, 1, 1, 1, 1, 1,
1.57233, -0.3616161, 2.750165, 1, 1, 1, 1, 1,
1.573797, 0.4720478, 0.623403, 1, 1, 1, 1, 1,
1.583826, 0.181779, 2.110069, 1, 1, 1, 1, 1,
1.585298, -1.116437, 1.898965, 1, 1, 1, 1, 1,
1.599054, -0.2929033, 0.4469566, 1, 1, 1, 1, 1,
1.600004, -0.1444991, 1.277762, 1, 1, 1, 1, 1,
1.608207, 1.682675, 0.9802509, 1, 1, 1, 1, 1,
1.614102, 1.628909, 0.2491929, 1, 1, 1, 1, 1,
1.624801, -0.4154713, 1.678539, 1, 1, 1, 1, 1,
1.632844, -0.8534391, 2.049352, 0, 0, 1, 1, 1,
1.639989, 0.5574463, 1.682445, 1, 0, 0, 1, 1,
1.648444, 0.4195768, 1.347372, 1, 0, 0, 1, 1,
1.653544, 1.094288, 1.330722, 1, 0, 0, 1, 1,
1.669001, 0.05695875, 1.667634, 1, 0, 0, 1, 1,
1.67454, -1.046721, 2.690553, 1, 0, 0, 1, 1,
1.674645, 1.457772, 2.533125, 0, 0, 0, 1, 1,
1.711054, 0.9784698, 1.971863, 0, 0, 0, 1, 1,
1.728671, -0.6365218, 3.15209, 0, 0, 0, 1, 1,
1.741696, -0.67975, 1.7865, 0, 0, 0, 1, 1,
1.747838, -1.479931, 0.9278001, 0, 0, 0, 1, 1,
1.755368, 0.2502905, 1.090337, 0, 0, 0, 1, 1,
1.76829, 1.364664, 1.164348, 0, 0, 0, 1, 1,
1.771572, 0.7667239, 0.8637131, 1, 1, 1, 1, 1,
1.773162, 1.467494, 1.199522, 1, 1, 1, 1, 1,
1.780201, -1.434149, 1.895234, 1, 1, 1, 1, 1,
1.781659, 0.4115905, 4.031404, 1, 1, 1, 1, 1,
1.784061, 0.5614179, 2.304724, 1, 1, 1, 1, 1,
1.787618, 0.7443256, 1.123303, 1, 1, 1, 1, 1,
1.806131, -0.8891742, 1.276801, 1, 1, 1, 1, 1,
1.818699, -0.5849025, 0.978845, 1, 1, 1, 1, 1,
1.83059, -1.596032, 2.561967, 1, 1, 1, 1, 1,
1.831265, -0.697344, 1.139613, 1, 1, 1, 1, 1,
1.841623, 0.4291267, 3.271623, 1, 1, 1, 1, 1,
1.845434, -1.323576, 0.8163983, 1, 1, 1, 1, 1,
1.862669, 0.9580831, 1.35593, 1, 1, 1, 1, 1,
1.864118, -1.526883, 2.944811, 1, 1, 1, 1, 1,
1.878543, -0.1431883, 1.797681, 1, 1, 1, 1, 1,
1.911714, -0.7319993, 1.697201, 0, 0, 1, 1, 1,
1.945838, 1.398999, 0.2491309, 1, 0, 0, 1, 1,
2.040832, 1.87708, 1.337016, 1, 0, 0, 1, 1,
2.055347, 0.4711111, 4.091658, 1, 0, 0, 1, 1,
2.085388, 0.4515339, 3.125023, 1, 0, 0, 1, 1,
2.090943, 0.8260607, 1.100673, 1, 0, 0, 1, 1,
2.121424, -2.028821, 5.24457, 0, 0, 0, 1, 1,
2.194736, -0.5160902, 3.838197, 0, 0, 0, 1, 1,
2.211638, -0.614761, 2.154227, 0, 0, 0, 1, 1,
2.239375, -2.395343, 2.359269, 0, 0, 0, 1, 1,
2.279581, -0.162263, 2.246794, 0, 0, 0, 1, 1,
2.312632, -1.45788, 1.565849, 0, 0, 0, 1, 1,
2.365194, -0.8730915, 1.980659, 0, 0, 0, 1, 1,
2.390411, -0.4662765, 0.3260523, 1, 1, 1, 1, 1,
2.394201, 0.3879519, 2.801443, 1, 1, 1, 1, 1,
2.40987, 1.118644, 0.2461888, 1, 1, 1, 1, 1,
2.677688, 0.7766762, 1.943127, 1, 1, 1, 1, 1,
2.70254, -1.916967, 2.935825, 1, 1, 1, 1, 1,
3.307323, -1.653756, 2.157674, 1, 1, 1, 1, 1,
3.589778, -0.3160318, 0.4726809, 1, 1, 1, 1, 1
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
var radius = 9.942438;
var distance = 34.92239;
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
mvMatrix.translate( -0.2236784, 0.2351998, -0.5848167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92239);
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
