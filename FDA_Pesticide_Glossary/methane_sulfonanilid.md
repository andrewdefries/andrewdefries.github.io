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
-2.922856, -2.251654, -2.414739, 1, 0, 0, 1,
-2.894341, -1.32752, -3.165697, 1, 0.007843138, 0, 1,
-2.789302, -1.567496, -1.772602, 1, 0.01176471, 0, 1,
-2.753472, -0.7281891, -2.914503, 1, 0.01960784, 0, 1,
-2.716627, -1.024653, -2.476177, 1, 0.02352941, 0, 1,
-2.592432, 1.045661, 0.5562552, 1, 0.03137255, 0, 1,
-2.562089, -0.9394424, -2.187829, 1, 0.03529412, 0, 1,
-2.523602, -0.0267848, -0.4687137, 1, 0.04313726, 0, 1,
-2.404877, 1.372024, -0.04221397, 1, 0.04705882, 0, 1,
-2.39089, -2.204451, -2.174627, 1, 0.05490196, 0, 1,
-2.348228, -1.163517, -2.190773, 1, 0.05882353, 0, 1,
-2.326146, -0.2702626, -2.420808, 1, 0.06666667, 0, 1,
-2.278912, 0.5735055, -2.595073, 1, 0.07058824, 0, 1,
-2.277277, 1.585437, -2.309644, 1, 0.07843138, 0, 1,
-2.260687, -0.5121139, -1.46227, 1, 0.08235294, 0, 1,
-2.239022, 0.208541, -1.306104, 1, 0.09019608, 0, 1,
-2.18296, -1.213888, -2.25262, 1, 0.09411765, 0, 1,
-2.182127, -0.8166835, -2.60499, 1, 0.1019608, 0, 1,
-2.176379, 0.2288893, -2.045173, 1, 0.1098039, 0, 1,
-2.144321, 0.3565158, -1.243326, 1, 0.1137255, 0, 1,
-2.12169, 0.3073647, -1.958492, 1, 0.1215686, 0, 1,
-2.088019, 0.01601746, -1.545105, 1, 0.1254902, 0, 1,
-2.084332, 0.3236985, -1.081535, 1, 0.1333333, 0, 1,
-2.077582, -0.8839121, -1.253819, 1, 0.1372549, 0, 1,
-2.074533, 0.4699365, -1.479659, 1, 0.145098, 0, 1,
-2.056381, 0.2398061, -0.6006593, 1, 0.1490196, 0, 1,
-2.045274, 0.8714631, -0.4825166, 1, 0.1568628, 0, 1,
-2.040208, -0.3521642, -1.268526, 1, 0.1607843, 0, 1,
-2.036983, -0.8685859, -2.909961, 1, 0.1686275, 0, 1,
-2.0313, -1.11271, -1.441159, 1, 0.172549, 0, 1,
-2.016859, 0.7961041, -0.797101, 1, 0.1803922, 0, 1,
-2.012993, 0.2049586, -0.4015528, 1, 0.1843137, 0, 1,
-1.984417, 0.2539446, -2.408308, 1, 0.1921569, 0, 1,
-1.955069, 0.1030283, -1.806716, 1, 0.1960784, 0, 1,
-1.949212, -1.794489, -2.975791, 1, 0.2039216, 0, 1,
-1.932231, -2.311402, -3.300898, 1, 0.2117647, 0, 1,
-1.92447, -0.2342843, -1.375196, 1, 0.2156863, 0, 1,
-1.912861, -0.4575437, -1.367524, 1, 0.2235294, 0, 1,
-1.910826, -1.808649, -1.30346, 1, 0.227451, 0, 1,
-1.887567, 1.840028, 1.945819, 1, 0.2352941, 0, 1,
-1.858163, -0.7190434, -1.376305, 1, 0.2392157, 0, 1,
-1.856953, -0.1451475, -1.276123, 1, 0.2470588, 0, 1,
-1.855982, -0.02613117, -1.912184, 1, 0.2509804, 0, 1,
-1.843711, -0.137727, -0.7441077, 1, 0.2588235, 0, 1,
-1.793013, -0.1819744, -1.98136, 1, 0.2627451, 0, 1,
-1.786478, -1.422022, -2.008087, 1, 0.2705882, 0, 1,
-1.75535, -0.5552211, -2.059487, 1, 0.2745098, 0, 1,
-1.751597, -0.9991892, -2.272513, 1, 0.282353, 0, 1,
-1.73323, 0.2267824, 0.100601, 1, 0.2862745, 0, 1,
-1.693215, 0.1435234, -0.8605233, 1, 0.2941177, 0, 1,
-1.683904, -0.5625827, -2.088753, 1, 0.3019608, 0, 1,
-1.680467, 0.1453251, -1.014264, 1, 0.3058824, 0, 1,
-1.669773, 2.145613, 0.1296632, 1, 0.3137255, 0, 1,
-1.669261, 1.502465, -3.092315, 1, 0.3176471, 0, 1,
-1.66615, 0.401356, -0.3694833, 1, 0.3254902, 0, 1,
-1.630171, -0.9377573, -3.328436, 1, 0.3294118, 0, 1,
-1.615395, -0.8933935, -2.184112, 1, 0.3372549, 0, 1,
-1.614366, -0.4262929, -3.296203, 1, 0.3411765, 0, 1,
-1.611249, -1.159219, -2.515714, 1, 0.3490196, 0, 1,
-1.604595, -0.1907651, -2.118848, 1, 0.3529412, 0, 1,
-1.583387, -1.064011, -1.503114, 1, 0.3607843, 0, 1,
-1.569593, -0.8704621, -2.763865, 1, 0.3647059, 0, 1,
-1.563356, 1.047796, -0.1665211, 1, 0.372549, 0, 1,
-1.56036, -2.102537, -2.712196, 1, 0.3764706, 0, 1,
-1.553215, -0.9709008, -0.9413372, 1, 0.3843137, 0, 1,
-1.548765, 0.337528, -0.9644461, 1, 0.3882353, 0, 1,
-1.538633, -0.8190678, -2.660468, 1, 0.3960784, 0, 1,
-1.523841, -0.6873646, -1.539753, 1, 0.4039216, 0, 1,
-1.509327, -0.01989485, -1.075699, 1, 0.4078431, 0, 1,
-1.507364, -1.603056, -1.487241, 1, 0.4156863, 0, 1,
-1.49567, -0.6759356, -2.030165, 1, 0.4196078, 0, 1,
-1.482484, 0.7986733, -0.7240221, 1, 0.427451, 0, 1,
-1.470471, 1.378897, 1.032674, 1, 0.4313726, 0, 1,
-1.462966, -0.4429153, -3.386345, 1, 0.4392157, 0, 1,
-1.454701, 0.22334, -0.4384389, 1, 0.4431373, 0, 1,
-1.449841, -0.424253, -2.810638, 1, 0.4509804, 0, 1,
-1.426987, 1.645783, 0.6757337, 1, 0.454902, 0, 1,
-1.410591, -0.2809235, -0.8931681, 1, 0.4627451, 0, 1,
-1.405827, 0.1052111, -0.6421657, 1, 0.4666667, 0, 1,
-1.404852, 0.2089248, -2.1828, 1, 0.4745098, 0, 1,
-1.400891, 0.7024615, -1.252719, 1, 0.4784314, 0, 1,
-1.400798, -1.808619, -3.100157, 1, 0.4862745, 0, 1,
-1.384079, -0.957041, -2.255613, 1, 0.4901961, 0, 1,
-1.383635, 2.63107, 0.2043213, 1, 0.4980392, 0, 1,
-1.372342, -1.304618, -3.052791, 1, 0.5058824, 0, 1,
-1.365587, -0.4633656, -1.401138, 1, 0.509804, 0, 1,
-1.352469, 0.6156766, -1.968428, 1, 0.5176471, 0, 1,
-1.34699, -1.652176, -3.083233, 1, 0.5215687, 0, 1,
-1.344285, -1.873393, -3.596746, 1, 0.5294118, 0, 1,
-1.3369, 2.618819, -1.483373, 1, 0.5333334, 0, 1,
-1.324714, 0.995968, -0.9622095, 1, 0.5411765, 0, 1,
-1.323783, -0.8264419, -3.735085, 1, 0.5450981, 0, 1,
-1.318755, -1.769604, -1.462622, 1, 0.5529412, 0, 1,
-1.31289, 1.069046, -1.541223, 1, 0.5568628, 0, 1,
-1.311878, 0.3186998, -1.359893, 1, 0.5647059, 0, 1,
-1.295232, 0.5642787, -2.15282, 1, 0.5686275, 0, 1,
-1.28728, 0.4627599, -1.598626, 1, 0.5764706, 0, 1,
-1.266869, -0.4228119, -1.991531, 1, 0.5803922, 0, 1,
-1.260556, 0.4420247, -0.6027358, 1, 0.5882353, 0, 1,
-1.258302, 1.229282, -2.098406, 1, 0.5921569, 0, 1,
-1.253819, -1.336594, -1.673819, 1, 0.6, 0, 1,
-1.251907, -1.610488, -2.495785, 1, 0.6078432, 0, 1,
-1.249583, 0.3470347, -1.120755, 1, 0.6117647, 0, 1,
-1.246303, -0.9465078, -1.681841, 1, 0.6196079, 0, 1,
-1.233208, -1.821019, -1.3465, 1, 0.6235294, 0, 1,
-1.225698, -0.1457686, -1.923401, 1, 0.6313726, 0, 1,
-1.219267, 0.6979968, -1.265863, 1, 0.6352941, 0, 1,
-1.215233, 0.9847382, 0.7250488, 1, 0.6431373, 0, 1,
-1.210045, 1.580029, -0.8340285, 1, 0.6470588, 0, 1,
-1.209734, 1.505591, -0.9356087, 1, 0.654902, 0, 1,
-1.206398, -2.058095, -2.137663, 1, 0.6588235, 0, 1,
-1.205188, 1.853998, -0.9617635, 1, 0.6666667, 0, 1,
-1.193896, -0.7345842, -1.868071, 1, 0.6705883, 0, 1,
-1.189891, -0.08615573, -2.180234, 1, 0.6784314, 0, 1,
-1.187115, -2.35167, -0.7125462, 1, 0.682353, 0, 1,
-1.171921, -1.284303, -3.787547, 1, 0.6901961, 0, 1,
-1.170723, 1.119739, -1.463999, 1, 0.6941177, 0, 1,
-1.15978, 0.1236103, -2.402637, 1, 0.7019608, 0, 1,
-1.154977, -1.403758, -2.562243, 1, 0.7098039, 0, 1,
-1.151494, -1.061241, -2.494882, 1, 0.7137255, 0, 1,
-1.151484, 1.003022, -0.2838156, 1, 0.7215686, 0, 1,
-1.138855, -0.5546495, -1.343792, 1, 0.7254902, 0, 1,
-1.138041, -1.625436, -1.545348, 1, 0.7333333, 0, 1,
-1.131934, -0.6547256, -1.915436, 1, 0.7372549, 0, 1,
-1.131547, 0.2604385, -1.794297, 1, 0.7450981, 0, 1,
-1.12977, -0.6259572, -1.478752, 1, 0.7490196, 0, 1,
-1.119358, -0.1130487, 1.349124, 1, 0.7568628, 0, 1,
-1.108164, -1.312174, -2.29776, 1, 0.7607843, 0, 1,
-1.10507, -1.099005, -2.588885, 1, 0.7686275, 0, 1,
-1.103008, -0.6733668, -2.996791, 1, 0.772549, 0, 1,
-1.101261, 1.768927, -0.329188, 1, 0.7803922, 0, 1,
-1.09918, 0.3059349, -1.168632, 1, 0.7843137, 0, 1,
-1.096939, 0.2204468, -1.733621, 1, 0.7921569, 0, 1,
-1.095488, 0.5234852, -1.317746, 1, 0.7960784, 0, 1,
-1.091617, 0.01133846, -1.685652, 1, 0.8039216, 0, 1,
-1.084151, 0.576496, -1.23003, 1, 0.8117647, 0, 1,
-1.083806, -0.9277889, -3.813242, 1, 0.8156863, 0, 1,
-1.082277, -0.7730587, -2.940348, 1, 0.8235294, 0, 1,
-1.081232, -1.754872, -3.482035, 1, 0.827451, 0, 1,
-1.080426, 0.4997841, -0.9431503, 1, 0.8352941, 0, 1,
-1.075375, 0.3637619, 0.2484286, 1, 0.8392157, 0, 1,
-1.074563, 0.2602604, -2.715554, 1, 0.8470588, 0, 1,
-1.0662, -0.4678489, -2.248188, 1, 0.8509804, 0, 1,
-1.063869, -1.449035, -2.480219, 1, 0.8588235, 0, 1,
-1.059373, 1.341191, -0.3302973, 1, 0.8627451, 0, 1,
-1.056053, -0.2659786, -1.122832, 1, 0.8705882, 0, 1,
-1.054955, 1.222586, -0.6483867, 1, 0.8745098, 0, 1,
-1.053105, -0.2677033, -2.105215, 1, 0.8823529, 0, 1,
-1.050753, 0.914781, -2.189874, 1, 0.8862745, 0, 1,
-1.046242, -1.518916, -2.266914, 1, 0.8941177, 0, 1,
-1.04522, -1.196964, -3.592809, 1, 0.8980392, 0, 1,
-1.043502, 1.358483, 0.7731686, 1, 0.9058824, 0, 1,
-1.042667, 2.025327, -1.085198, 1, 0.9137255, 0, 1,
-1.034946, -0.328102, -0.6754708, 1, 0.9176471, 0, 1,
-1.034834, -0.1262126, -0.1096585, 1, 0.9254902, 0, 1,
-1.024167, -1.090701, -2.826539, 1, 0.9294118, 0, 1,
-1.021594, 0.4117464, -1.049841, 1, 0.9372549, 0, 1,
-1.012959, -1.747775, -1.701464, 1, 0.9411765, 0, 1,
-1.012829, -1.067746, -3.479395, 1, 0.9490196, 0, 1,
-1.005595, 2.581178, -1.792461, 1, 0.9529412, 0, 1,
-0.9991135, 1.852448, -1.463495, 1, 0.9607843, 0, 1,
-0.9987173, -1.595581, -2.900529, 1, 0.9647059, 0, 1,
-0.995339, -0.1147863, -2.220775, 1, 0.972549, 0, 1,
-0.9951825, 0.06500851, -0.2036177, 1, 0.9764706, 0, 1,
-0.992899, 0.3244669, -1.369125, 1, 0.9843137, 0, 1,
-0.9878602, 1.296553, -0.5864112, 1, 0.9882353, 0, 1,
-0.9852166, 1.26096, 0.8226622, 1, 0.9960784, 0, 1,
-0.9772216, 0.1647389, -2.104331, 0.9960784, 1, 0, 1,
-0.9768732, 0.4601123, -1.444188, 0.9921569, 1, 0, 1,
-0.9703997, 0.7929848, -1.211529, 0.9843137, 1, 0, 1,
-0.9576584, 1.137174, -0.9918482, 0.9803922, 1, 0, 1,
-0.9550908, 0.3686146, -1.776284, 0.972549, 1, 0, 1,
-0.9549005, 0.2545851, -2.312017, 0.9686275, 1, 0, 1,
-0.9468417, -0.1257823, -2.033684, 0.9607843, 1, 0, 1,
-0.9389535, -0.4233703, -0.01773865, 0.9568627, 1, 0, 1,
-0.9364564, 1.767654, -1.419732, 0.9490196, 1, 0, 1,
-0.9356223, 0.7575085, 0.9309429, 0.945098, 1, 0, 1,
-0.926171, -0.3250727, -1.415408, 0.9372549, 1, 0, 1,
-0.9255418, -1.267487, -3.455008, 0.9333333, 1, 0, 1,
-0.9028193, -0.4155054, -2.763565, 0.9254902, 1, 0, 1,
-0.9022503, 2.106077, 0.5492367, 0.9215686, 1, 0, 1,
-0.9017807, -0.8864816, -1.885164, 0.9137255, 1, 0, 1,
-0.9005867, 0.07621736, -0.9761778, 0.9098039, 1, 0, 1,
-0.9000841, -0.4496669, -2.071706, 0.9019608, 1, 0, 1,
-0.8971015, 0.3277222, -1.593846, 0.8941177, 1, 0, 1,
-0.8942969, 1.455346, -0.8145556, 0.8901961, 1, 0, 1,
-0.892728, -1.600757, -2.505919, 0.8823529, 1, 0, 1,
-0.8894711, -0.0837973, -2.436486, 0.8784314, 1, 0, 1,
-0.8887424, 0.623789, 1.025735, 0.8705882, 1, 0, 1,
-0.8838128, 1.535307, -0.4066664, 0.8666667, 1, 0, 1,
-0.8770593, 0.2567323, -0.3722863, 0.8588235, 1, 0, 1,
-0.8721409, -1.895763, -1.299951, 0.854902, 1, 0, 1,
-0.8692746, -0.82925, -2.493413, 0.8470588, 1, 0, 1,
-0.8677206, 0.490776, -1.338619, 0.8431373, 1, 0, 1,
-0.8663529, -0.739784, -2.685332, 0.8352941, 1, 0, 1,
-0.8641671, -2.059538, -2.492818, 0.8313726, 1, 0, 1,
-0.8639079, 0.5077428, -1.280849, 0.8235294, 1, 0, 1,
-0.8607985, -0.8418023, -1.514997, 0.8196079, 1, 0, 1,
-0.8585217, -1.629933, -1.843736, 0.8117647, 1, 0, 1,
-0.8442049, -0.03838079, -0.09361771, 0.8078431, 1, 0, 1,
-0.8413665, 1.450558, 1.155892, 0.8, 1, 0, 1,
-0.8364128, -0.3388629, -0.7123026, 0.7921569, 1, 0, 1,
-0.8241715, -0.5849664, -1.371082, 0.7882353, 1, 0, 1,
-0.8228284, 1.513503, 0.09170897, 0.7803922, 1, 0, 1,
-0.814138, -1.131498, -3.358509, 0.7764706, 1, 0, 1,
-0.8108327, -1.810663, -3.761477, 0.7686275, 1, 0, 1,
-0.8090019, -0.6668366, -2.830738, 0.7647059, 1, 0, 1,
-0.8089886, 1.787894, -0.1817823, 0.7568628, 1, 0, 1,
-0.8026102, -0.1473037, -0.9918302, 0.7529412, 1, 0, 1,
-0.7986849, -0.5218987, -1.898976, 0.7450981, 1, 0, 1,
-0.7953548, 1.893196, 0.1479252, 0.7411765, 1, 0, 1,
-0.7936442, 0.5144899, -1.207727, 0.7333333, 1, 0, 1,
-0.7888185, -0.5145941, -2.113293, 0.7294118, 1, 0, 1,
-0.7886289, -0.417557, -1.459862, 0.7215686, 1, 0, 1,
-0.781724, 0.9167534, -0.8408096, 0.7176471, 1, 0, 1,
-0.776348, -1.536908, -2.841543, 0.7098039, 1, 0, 1,
-0.775692, 0.4622012, -2.159418, 0.7058824, 1, 0, 1,
-0.7756008, 0.2844856, 2.434365, 0.6980392, 1, 0, 1,
-0.7742517, -1.607886, -1.81794, 0.6901961, 1, 0, 1,
-0.7697792, -1.710236, -2.562945, 0.6862745, 1, 0, 1,
-0.7668722, 0.5501647, 0.02973376, 0.6784314, 1, 0, 1,
-0.7591705, -0.2957397, -1.609985, 0.6745098, 1, 0, 1,
-0.7585446, -0.4015919, -1.237892, 0.6666667, 1, 0, 1,
-0.7567459, 0.4792863, -0.5202504, 0.6627451, 1, 0, 1,
-0.7479557, -0.2927785, -2.104189, 0.654902, 1, 0, 1,
-0.7474228, 0.9880219, -0.8906903, 0.6509804, 1, 0, 1,
-0.7461749, -0.1850473, -0.5403265, 0.6431373, 1, 0, 1,
-0.7395756, -0.5289375, -1.776108, 0.6392157, 1, 0, 1,
-0.7381248, -0.2131782, -2.909914, 0.6313726, 1, 0, 1,
-0.7362719, -0.4166308, -3.346956, 0.627451, 1, 0, 1,
-0.7353761, 0.624485, -3.358035, 0.6196079, 1, 0, 1,
-0.7348174, 0.1318517, -2.047393, 0.6156863, 1, 0, 1,
-0.7295746, -0.2985052, -1.127171, 0.6078432, 1, 0, 1,
-0.7152541, 0.7415062, -1.269431, 0.6039216, 1, 0, 1,
-0.7132178, -1.370803, -2.187304, 0.5960785, 1, 0, 1,
-0.7097449, 0.7651771, -1.157987, 0.5882353, 1, 0, 1,
-0.7074897, 0.5921315, -1.410537, 0.5843138, 1, 0, 1,
-0.6998433, 0.04911492, -2.163816, 0.5764706, 1, 0, 1,
-0.6990215, 0.9763297, -0.5835399, 0.572549, 1, 0, 1,
-0.6953979, -1.280152, -1.841589, 0.5647059, 1, 0, 1,
-0.6934204, 0.02254033, -2.184992, 0.5607843, 1, 0, 1,
-0.6926734, -0.6538547, -1.913967, 0.5529412, 1, 0, 1,
-0.6906317, 0.1730154, 0.3546676, 0.5490196, 1, 0, 1,
-0.6786035, 0.8842978, -0.7867079, 0.5411765, 1, 0, 1,
-0.6777946, -0.35566, -2.851904, 0.5372549, 1, 0, 1,
-0.6736042, 0.5491688, -0.5853902, 0.5294118, 1, 0, 1,
-0.6617126, 0.5006135, 0.04922814, 0.5254902, 1, 0, 1,
-0.6614577, -0.04902708, -2.323554, 0.5176471, 1, 0, 1,
-0.6586986, 0.4219473, -0.9739581, 0.5137255, 1, 0, 1,
-0.6562629, -0.6848767, -1.063715, 0.5058824, 1, 0, 1,
-0.653093, 0.3615724, -1.016208, 0.5019608, 1, 0, 1,
-0.6517436, -0.5912378, -3.56912, 0.4941176, 1, 0, 1,
-0.6505236, -1.178758, -3.103968, 0.4862745, 1, 0, 1,
-0.6499507, 0.3663428, -2.038531, 0.4823529, 1, 0, 1,
-0.6410879, 1.689906, -1.004099, 0.4745098, 1, 0, 1,
-0.6376416, 0.2674974, -1.567216, 0.4705882, 1, 0, 1,
-0.6365198, -0.9367372, -2.598943, 0.4627451, 1, 0, 1,
-0.6344526, -1.226768, -4.928583, 0.4588235, 1, 0, 1,
-0.6342511, -0.5852706, -4.107968, 0.4509804, 1, 0, 1,
-0.6336037, 0.8715459, -0.8156423, 0.4470588, 1, 0, 1,
-0.6302583, 0.3018762, -4.172676, 0.4392157, 1, 0, 1,
-0.6293464, 1.321078, -2.163099, 0.4352941, 1, 0, 1,
-0.6266245, -1.488726, -2.901493, 0.427451, 1, 0, 1,
-0.6264583, -0.886167, -4.013007, 0.4235294, 1, 0, 1,
-0.6254438, 0.5220945, -0.9019969, 0.4156863, 1, 0, 1,
-0.6245591, 1.645733, 0.5905225, 0.4117647, 1, 0, 1,
-0.6192849, -0.7794899, -2.986575, 0.4039216, 1, 0, 1,
-0.6169149, -1.016431, -2.365024, 0.3960784, 1, 0, 1,
-0.6108675, -1.21738, -4.753337, 0.3921569, 1, 0, 1,
-0.6102051, -0.5432361, -3.726363, 0.3843137, 1, 0, 1,
-0.6044744, 1.389768, -1.557869, 0.3803922, 1, 0, 1,
-0.6008576, -0.196414, -2.583076, 0.372549, 1, 0, 1,
-0.5984404, -1.040771, -0.9644755, 0.3686275, 1, 0, 1,
-0.5957325, 1.623747, -2.104423, 0.3607843, 1, 0, 1,
-0.5929062, -0.571137, -3.227498, 0.3568628, 1, 0, 1,
-0.58456, -0.9184549, -2.233662, 0.3490196, 1, 0, 1,
-0.574099, -0.5869984, -3.958819, 0.345098, 1, 0, 1,
-0.5736666, -0.3223939, -2.514284, 0.3372549, 1, 0, 1,
-0.5727216, 1.237067, -0.4031161, 0.3333333, 1, 0, 1,
-0.5704141, -0.9134514, -3.472313, 0.3254902, 1, 0, 1,
-0.5666601, 0.4712903, -3.546375, 0.3215686, 1, 0, 1,
-0.565389, -1.256838, -3.35107, 0.3137255, 1, 0, 1,
-0.5639599, -0.03603739, -3.192198, 0.3098039, 1, 0, 1,
-0.5581747, 0.4406236, -0.2817935, 0.3019608, 1, 0, 1,
-0.5528937, -0.3632008, -1.763789, 0.2941177, 1, 0, 1,
-0.5520388, -1.431528, -1.232492, 0.2901961, 1, 0, 1,
-0.5501192, -0.7818961, -2.034577, 0.282353, 1, 0, 1,
-0.5491834, -0.2166618, -2.368197, 0.2784314, 1, 0, 1,
-0.5481458, -1.103046, -2.238297, 0.2705882, 1, 0, 1,
-0.5472788, 0.9766644, -0.1724427, 0.2666667, 1, 0, 1,
-0.541263, -0.8346859, -2.759357, 0.2588235, 1, 0, 1,
-0.5380737, -0.6966749, -2.788348, 0.254902, 1, 0, 1,
-0.5263892, -0.4763323, -3.352656, 0.2470588, 1, 0, 1,
-0.5257878, 1.137271, -0.8603165, 0.2431373, 1, 0, 1,
-0.5254024, 0.9687207, -3.350909, 0.2352941, 1, 0, 1,
-0.5243476, -1.054122, -4.989164, 0.2313726, 1, 0, 1,
-0.5232618, -0.196599, -1.726026, 0.2235294, 1, 0, 1,
-0.5199525, -0.007098333, -1.979477, 0.2196078, 1, 0, 1,
-0.5196558, -1.347446, -2.494804, 0.2117647, 1, 0, 1,
-0.5164123, 0.9907185, 0.4813792, 0.2078431, 1, 0, 1,
-0.5116711, 0.8730944, -0.8296944, 0.2, 1, 0, 1,
-0.5084631, 1.529937, -0.002886542, 0.1921569, 1, 0, 1,
-0.5044658, -0.6548513, -3.872941, 0.1882353, 1, 0, 1,
-0.4920179, 0.2020832, -2.218662, 0.1803922, 1, 0, 1,
-0.4901999, 0.5916159, -1.562755, 0.1764706, 1, 0, 1,
-0.4889117, -0.5156326, -2.243683, 0.1686275, 1, 0, 1,
-0.4828775, -0.3784534, -0.6646578, 0.1647059, 1, 0, 1,
-0.4816774, -0.9705112, -3.965171, 0.1568628, 1, 0, 1,
-0.4810627, -0.6517544, -2.648033, 0.1529412, 1, 0, 1,
-0.4807873, -0.5116022, -2.790367, 0.145098, 1, 0, 1,
-0.4804202, 0.8784072, -1.922511, 0.1411765, 1, 0, 1,
-0.4799826, -0.4034661, -2.883157, 0.1333333, 1, 0, 1,
-0.4752143, -1.862382, -1.688731, 0.1294118, 1, 0, 1,
-0.4735715, -0.4605183, -1.467498, 0.1215686, 1, 0, 1,
-0.472609, 0.3561544, -2.117067, 0.1176471, 1, 0, 1,
-0.4709682, 0.9184009, 1.335995, 0.1098039, 1, 0, 1,
-0.4663293, -1.159893, -2.08184, 0.1058824, 1, 0, 1,
-0.4607071, 1.282633, 0.108594, 0.09803922, 1, 0, 1,
-0.4605931, 0.749793, 0.09032384, 0.09019608, 1, 0, 1,
-0.4594531, 0.9734823, -0.4964194, 0.08627451, 1, 0, 1,
-0.4573623, -1.755144, -3.277863, 0.07843138, 1, 0, 1,
-0.4572259, -1.179122, -3.486655, 0.07450981, 1, 0, 1,
-0.4531891, -1.338083, -2.751823, 0.06666667, 1, 0, 1,
-0.4513884, 0.5207356, -1.834682, 0.0627451, 1, 0, 1,
-0.4481382, -1.11424, -1.873252, 0.05490196, 1, 0, 1,
-0.4476602, -0.05357051, -1.768243, 0.05098039, 1, 0, 1,
-0.4464099, -0.03649127, -1.118712, 0.04313726, 1, 0, 1,
-0.4455515, 0.981412, 1.81275, 0.03921569, 1, 0, 1,
-0.4446984, -0.1879427, -2.641057, 0.03137255, 1, 0, 1,
-0.4443268, -0.1498889, -2.9386, 0.02745098, 1, 0, 1,
-0.440812, -1.943916, -3.809582, 0.01960784, 1, 0, 1,
-0.4381797, -0.1871065, -2.284979, 0.01568628, 1, 0, 1,
-0.4370425, -1.298643, -3.543746, 0.007843138, 1, 0, 1,
-0.4354217, 0.8113562, -0.9276457, 0.003921569, 1, 0, 1,
-0.4309275, 0.7598907, -0.414053, 0, 1, 0.003921569, 1,
-0.4269664, -0.3906983, -4.160676, 0, 1, 0.01176471, 1,
-0.4268826, 0.9835133, -1.635637, 0, 1, 0.01568628, 1,
-0.4229642, -1.838693, -3.547661, 0, 1, 0.02352941, 1,
-0.4192383, 2.302246, -0.5277773, 0, 1, 0.02745098, 1,
-0.4175414, -0.5239428, -1.359218, 0, 1, 0.03529412, 1,
-0.4141645, -0.9699836, -2.276303, 0, 1, 0.03921569, 1,
-0.4127024, -2.249034, -2.862095, 0, 1, 0.04705882, 1,
-0.4084679, 0.4933225, -0.05524099, 0, 1, 0.05098039, 1,
-0.4083456, 0.662692, -0.6119571, 0, 1, 0.05882353, 1,
-0.4049675, 0.2892553, -1.098613, 0, 1, 0.0627451, 1,
-0.4042559, 0.03165483, -2.097782, 0, 1, 0.07058824, 1,
-0.398339, -0.4104837, -3.073629, 0, 1, 0.07450981, 1,
-0.3976423, 0.4056837, -1.124586, 0, 1, 0.08235294, 1,
-0.3950549, 1.853975, 0.4768307, 0, 1, 0.08627451, 1,
-0.3891459, -0.1271971, -2.948703, 0, 1, 0.09411765, 1,
-0.3882729, -1.961394, -2.029917, 0, 1, 0.1019608, 1,
-0.3880077, 1.311405, 1.040866, 0, 1, 0.1058824, 1,
-0.3851281, -0.3737632, -3.052485, 0, 1, 0.1137255, 1,
-0.3832782, 0.1934945, -2.504151, 0, 1, 0.1176471, 1,
-0.3829237, -1.285011, -1.700755, 0, 1, 0.1254902, 1,
-0.3789481, -0.3281274, -2.106825, 0, 1, 0.1294118, 1,
-0.3740306, 0.9286093, 0.4005983, 0, 1, 0.1372549, 1,
-0.3731983, 1.237044, -0.8749788, 0, 1, 0.1411765, 1,
-0.3660776, 0.4190881, -1.397235, 0, 1, 0.1490196, 1,
-0.3641745, 0.3650121, 1.614317, 0, 1, 0.1529412, 1,
-0.3612431, 0.0270473, -0.8776002, 0, 1, 0.1607843, 1,
-0.3607837, -2.732035, -0.6140093, 0, 1, 0.1647059, 1,
-0.3596666, 0.02207462, -1.122337, 0, 1, 0.172549, 1,
-0.3493133, 0.6843472, 0.1334308, 0, 1, 0.1764706, 1,
-0.3438457, 1.524333, -0.5942625, 0, 1, 0.1843137, 1,
-0.3434063, -0.8969586, -1.995397, 0, 1, 0.1882353, 1,
-0.3424506, -1.183243, -1.427128, 0, 1, 0.1960784, 1,
-0.3305921, -0.4619076, -1.229428, 0, 1, 0.2039216, 1,
-0.3283166, 0.313248, -0.7594408, 0, 1, 0.2078431, 1,
-0.3282292, 1.105656, -0.1701783, 0, 1, 0.2156863, 1,
-0.3259021, 0.3382534, -0.8880419, 0, 1, 0.2196078, 1,
-0.3237529, 1.542908, -2.730045, 0, 1, 0.227451, 1,
-0.3228182, 0.3636191, 1.432039, 0, 1, 0.2313726, 1,
-0.3215962, 0.1886289, -0.671728, 0, 1, 0.2392157, 1,
-0.3208561, -1.70071, -3.077987, 0, 1, 0.2431373, 1,
-0.3181484, 0.052656, -1.922677, 0, 1, 0.2509804, 1,
-0.3172317, -0.560143, -1.494619, 0, 1, 0.254902, 1,
-0.3148846, 0.3904861, -0.1904756, 0, 1, 0.2627451, 1,
-0.3130312, -1.32964, -2.794981, 0, 1, 0.2666667, 1,
-0.3119545, 0.5304309, -0.1097689, 0, 1, 0.2745098, 1,
-0.3111943, 1.18546, -0.1168103, 0, 1, 0.2784314, 1,
-0.3076097, -0.1285339, -1.936503, 0, 1, 0.2862745, 1,
-0.3051681, -0.3236748, -1.274638, 0, 1, 0.2901961, 1,
-0.304358, 1.185355, 0.6734641, 0, 1, 0.2980392, 1,
-0.3029183, -1.239439, -2.886871, 0, 1, 0.3058824, 1,
-0.3014688, -1.698135, -2.704829, 0, 1, 0.3098039, 1,
-0.3000537, -0.06592622, 0.3317442, 0, 1, 0.3176471, 1,
-0.2999789, 1.990109, -1.945536, 0, 1, 0.3215686, 1,
-0.2917396, 1.427951, -0.2952856, 0, 1, 0.3294118, 1,
-0.2894427, -1.185585, -2.307606, 0, 1, 0.3333333, 1,
-0.2845363, -0.123293, -3.090207, 0, 1, 0.3411765, 1,
-0.2839904, 0.599953, -1.033279, 0, 1, 0.345098, 1,
-0.2823541, 0.8259301, -0.2033393, 0, 1, 0.3529412, 1,
-0.2766163, 0.4895705, 0.5898275, 0, 1, 0.3568628, 1,
-0.2741718, -0.8386565, -5.384067, 0, 1, 0.3647059, 1,
-0.270017, -1.306405, -4.291932, 0, 1, 0.3686275, 1,
-0.2688489, 0.1692828, 0.1360513, 0, 1, 0.3764706, 1,
-0.265857, -0.9160672, -3.926858, 0, 1, 0.3803922, 1,
-0.2654441, 0.1236163, 0.5425477, 0, 1, 0.3882353, 1,
-0.2648637, -0.9097657, -3.828897, 0, 1, 0.3921569, 1,
-0.2626524, -0.3380455, -2.660292, 0, 1, 0.4, 1,
-0.2617787, -0.254874, -5.311755, 0, 1, 0.4078431, 1,
-0.260012, -1.598073, -4.466072, 0, 1, 0.4117647, 1,
-0.2530264, 2.521643, 0.7866963, 0, 1, 0.4196078, 1,
-0.252022, -0.09419252, -2.289826, 0, 1, 0.4235294, 1,
-0.2520091, -0.5068812, -3.086255, 0, 1, 0.4313726, 1,
-0.2402015, 0.2785244, -1.292658, 0, 1, 0.4352941, 1,
-0.2383891, -0.8430595, -1.29519, 0, 1, 0.4431373, 1,
-0.2308657, -0.9125069, -3.080314, 0, 1, 0.4470588, 1,
-0.2300699, -0.6001229, -2.996944, 0, 1, 0.454902, 1,
-0.2269477, 0.2808391, -1.579398, 0, 1, 0.4588235, 1,
-0.2233598, 0.3685718, -0.07417496, 0, 1, 0.4666667, 1,
-0.220879, -0.4034117, -3.247074, 0, 1, 0.4705882, 1,
-0.219855, 0.5652842, -0.6089675, 0, 1, 0.4784314, 1,
-0.2132853, -0.6408461, -2.647226, 0, 1, 0.4823529, 1,
-0.2119375, 0.07781646, -1.354232, 0, 1, 0.4901961, 1,
-0.210979, 1.72006, 0.7928343, 0, 1, 0.4941176, 1,
-0.2094805, -1.046624, -2.622307, 0, 1, 0.5019608, 1,
-0.2058176, -0.912801, -2.539504, 0, 1, 0.509804, 1,
-0.2051532, 0.9908406, -1.041435, 0, 1, 0.5137255, 1,
-0.2038773, 1.444782, -1.71973, 0, 1, 0.5215687, 1,
-0.2024346, -1.417846, -0.8908231, 0, 1, 0.5254902, 1,
-0.2019692, -0.3563359, -3.387789, 0, 1, 0.5333334, 1,
-0.2011787, -0.3068112, -0.7498561, 0, 1, 0.5372549, 1,
-0.2000003, 0.175895, -0.4177965, 0, 1, 0.5450981, 1,
-0.1999132, -0.006942211, -0.9618521, 0, 1, 0.5490196, 1,
-0.1932426, 1.352219, 0.85008, 0, 1, 0.5568628, 1,
-0.1892643, -0.2524048, -2.523949, 0, 1, 0.5607843, 1,
-0.1767815, -0.6731412, -2.235187, 0, 1, 0.5686275, 1,
-0.1702326, 1.828377, 0.6240819, 0, 1, 0.572549, 1,
-0.1557874, 0.5819092, -0.5405524, 0, 1, 0.5803922, 1,
-0.154904, 0.7727734, -1.816836, 0, 1, 0.5843138, 1,
-0.1543918, 2.932746, -0.9900938, 0, 1, 0.5921569, 1,
-0.1531593, -1.049938, -2.210777, 0, 1, 0.5960785, 1,
-0.150972, -0.6748161, -2.909291, 0, 1, 0.6039216, 1,
-0.1475725, 1.099163, -0.2217892, 0, 1, 0.6117647, 1,
-0.1447123, 1.414719, 0.2747808, 0, 1, 0.6156863, 1,
-0.1408152, 0.136752, 0.1567929, 0, 1, 0.6235294, 1,
-0.140698, -0.4965622, -4.524425, 0, 1, 0.627451, 1,
-0.1395365, 1.243904, 0.1331772, 0, 1, 0.6352941, 1,
-0.1353698, 0.8797206, -0.09595901, 0, 1, 0.6392157, 1,
-0.1348617, 1.207416, -0.02256823, 0, 1, 0.6470588, 1,
-0.1342573, 0.5657124, -1.004726, 0, 1, 0.6509804, 1,
-0.1339324, -0.2414851, -2.211462, 0, 1, 0.6588235, 1,
-0.1328965, 0.727128, -1.020904, 0, 1, 0.6627451, 1,
-0.1274287, -0.5369856, -1.622555, 0, 1, 0.6705883, 1,
-0.1271233, -0.7789668, -3.08359, 0, 1, 0.6745098, 1,
-0.1261068, -0.1741186, -2.428251, 0, 1, 0.682353, 1,
-0.1254137, -0.875532, -1.876206, 0, 1, 0.6862745, 1,
-0.1250057, -0.7305244, -2.896254, 0, 1, 0.6941177, 1,
-0.1223359, -1.033412, -2.250429, 0, 1, 0.7019608, 1,
-0.1217373, 0.4945028, 1.247864, 0, 1, 0.7058824, 1,
-0.121328, -1.173101, -2.213617, 0, 1, 0.7137255, 1,
-0.116305, -0.3482936, -2.966322, 0, 1, 0.7176471, 1,
-0.1153028, 2.393999, -1.209651, 0, 1, 0.7254902, 1,
-0.1100381, -0.857957, -1.197624, 0, 1, 0.7294118, 1,
-0.1077081, -0.8402504, -1.760273, 0, 1, 0.7372549, 1,
-0.1070674, -0.1953574, -2.175936, 0, 1, 0.7411765, 1,
-0.1050149, 0.09249685, 0.412734, 0, 1, 0.7490196, 1,
-0.1032167, 2.192433, 1.138296, 0, 1, 0.7529412, 1,
-0.1022851, 0.6191458, 1.117498, 0, 1, 0.7607843, 1,
-0.1017865, -1.369765, -3.1533, 0, 1, 0.7647059, 1,
-0.09888114, 0.1861449, -0.1644262, 0, 1, 0.772549, 1,
-0.0982741, -1.114839, -3.036164, 0, 1, 0.7764706, 1,
-0.09704982, -0.3638446, -1.590349, 0, 1, 0.7843137, 1,
-0.09677473, 0.3573168, 0.7625822, 0, 1, 0.7882353, 1,
-0.08977284, -1.454421, -2.725122, 0, 1, 0.7960784, 1,
-0.08359318, 0.3034806, -0.2585664, 0, 1, 0.8039216, 1,
-0.07394443, -0.01977129, -3.283514, 0, 1, 0.8078431, 1,
-0.06840963, 0.8598585, 0.8135653, 0, 1, 0.8156863, 1,
-0.06152407, 0.5627659, -0.9650941, 0, 1, 0.8196079, 1,
-0.05702569, 0.6723099, -1.511114, 0, 1, 0.827451, 1,
-0.0564191, 0.3019292, -1.557554, 0, 1, 0.8313726, 1,
-0.05367119, 0.7702086, 1.748334, 0, 1, 0.8392157, 1,
-0.0529444, 1.297805, 0.5497833, 0, 1, 0.8431373, 1,
-0.05212366, -0.4120959, -3.590232, 0, 1, 0.8509804, 1,
-0.04837629, 1.42274, 0.8225647, 0, 1, 0.854902, 1,
-0.04535928, -0.6225936, -3.293242, 0, 1, 0.8627451, 1,
-0.04126541, 0.4779236, -0.6083089, 0, 1, 0.8666667, 1,
-0.03893177, 0.08005793, 0.3962978, 0, 1, 0.8745098, 1,
-0.03782069, -0.6429591, -3.416733, 0, 1, 0.8784314, 1,
-0.03290532, -0.09523179, -2.275291, 0, 1, 0.8862745, 1,
-0.0298979, -0.1769903, -2.014426, 0, 1, 0.8901961, 1,
-0.02057902, -0.1731486, -1.548566, 0, 1, 0.8980392, 1,
-0.01718504, 0.3216023, 0.1232557, 0, 1, 0.9058824, 1,
-0.01314371, 0.7327446, 0.6633266, 0, 1, 0.9098039, 1,
-0.01311592, 1.113116, -0.5980781, 0, 1, 0.9176471, 1,
-0.01285462, -1.895098, -2.969744, 0, 1, 0.9215686, 1,
-0.01024026, 1.599798, -1.103945, 0, 1, 0.9294118, 1,
-0.009713919, -0.1925509, -1.294563, 0, 1, 0.9333333, 1,
-0.006468864, 0.4236324, -0.9687175, 0, 1, 0.9411765, 1,
-0.004437713, 1.144463, 0.6162115, 0, 1, 0.945098, 1,
0.00901878, 0.7006729, -1.314986, 0, 1, 0.9529412, 1,
0.009523902, 1.697919, 0.295718, 0, 1, 0.9568627, 1,
0.01018739, -1.142106, 4.389409, 0, 1, 0.9647059, 1,
0.01283901, -1.919233, 2.380594, 0, 1, 0.9686275, 1,
0.01691822, 0.4042363, 0.7435808, 0, 1, 0.9764706, 1,
0.01921182, -0.7982324, 4.549397, 0, 1, 0.9803922, 1,
0.02145123, -0.1845652, 3.256162, 0, 1, 0.9882353, 1,
0.02248389, 0.2033761, -1.946745, 0, 1, 0.9921569, 1,
0.02276961, -0.6704181, 3.132875, 0, 1, 1, 1,
0.02322243, 0.5981382, 0.2954915, 0, 0.9921569, 1, 1,
0.02517598, 1.076213, -0.1961791, 0, 0.9882353, 1, 1,
0.02629166, -1.180626, 2.834747, 0, 0.9803922, 1, 1,
0.02713143, 0.558491, 0.4453881, 0, 0.9764706, 1, 1,
0.02822498, 2.032077, 0.9303551, 0, 0.9686275, 1, 1,
0.02882175, 0.9455013, -0.1434941, 0, 0.9647059, 1, 1,
0.02971627, -0.09364092, 1.16952, 0, 0.9568627, 1, 1,
0.03793004, 1.653031, -0.4948236, 0, 0.9529412, 1, 1,
0.03894499, -0.2371942, 2.717313, 0, 0.945098, 1, 1,
0.04231688, -2.162509, 5.830253, 0, 0.9411765, 1, 1,
0.04304407, -0.3851716, 2.194166, 0, 0.9333333, 1, 1,
0.04516356, -1.144446, 3.569935, 0, 0.9294118, 1, 1,
0.04896435, 0.02956114, -0.03628675, 0, 0.9215686, 1, 1,
0.05372955, 1.062753, 0.2740095, 0, 0.9176471, 1, 1,
0.05748757, 2.256495, -0.8442025, 0, 0.9098039, 1, 1,
0.06051243, 0.0646602, -0.3472887, 0, 0.9058824, 1, 1,
0.06176816, 0.9527754, 0.6396788, 0, 0.8980392, 1, 1,
0.06286492, 0.7322114, 0.4718252, 0, 0.8901961, 1, 1,
0.06752916, 0.5081623, 0.6121554, 0, 0.8862745, 1, 1,
0.0680491, 0.7927765, 2.474031, 0, 0.8784314, 1, 1,
0.07009561, -0.7742584, 5.096357, 0, 0.8745098, 1, 1,
0.07322869, -1.090306, 2.37723, 0, 0.8666667, 1, 1,
0.07502788, -1.088482, 1.596424, 0, 0.8627451, 1, 1,
0.07740427, 1.509721, -1.360386, 0, 0.854902, 1, 1,
0.07786454, -0.7999108, 5.060121, 0, 0.8509804, 1, 1,
0.07792407, -0.3723229, 2.347591, 0, 0.8431373, 1, 1,
0.08301929, 1.98703, -0.4735313, 0, 0.8392157, 1, 1,
0.08811688, 0.440708, 1.496035, 0, 0.8313726, 1, 1,
0.08841136, 0.1849234, -0.7174436, 0, 0.827451, 1, 1,
0.08892611, -0.2366467, 3.006672, 0, 0.8196079, 1, 1,
0.08907244, -0.005705274, 1.710049, 0, 0.8156863, 1, 1,
0.08973835, 1.065278, 0.2702889, 0, 0.8078431, 1, 1,
0.09052518, 0.2674233, 1.524974, 0, 0.8039216, 1, 1,
0.09065644, 1.041946, 2.210782, 0, 0.7960784, 1, 1,
0.09263039, -0.5931222, 0.7906002, 0, 0.7882353, 1, 1,
0.09765559, 0.2085251, 0.6632143, 0, 0.7843137, 1, 1,
0.1006664, 0.1332088, 0.8072057, 0, 0.7764706, 1, 1,
0.1015773, -0.1070893, 2.284841, 0, 0.772549, 1, 1,
0.1020671, -1.815992, 3.41588, 0, 0.7647059, 1, 1,
0.1064156, -0.3558752, 2.706274, 0, 0.7607843, 1, 1,
0.1180522, 2.778713, -0.2574452, 0, 0.7529412, 1, 1,
0.1187888, -0.7852783, 2.911182, 0, 0.7490196, 1, 1,
0.12101, 0.1025773, 1.481528, 0, 0.7411765, 1, 1,
0.1217195, -0.4160866, 4.78056, 0, 0.7372549, 1, 1,
0.1293764, -0.4925917, 4.301245, 0, 0.7294118, 1, 1,
0.1326948, -1.854953, 3.890318, 0, 0.7254902, 1, 1,
0.1332228, -0.9481423, 3.515122, 0, 0.7176471, 1, 1,
0.1343109, -0.541438, 4.555915, 0, 0.7137255, 1, 1,
0.1356045, 0.09915789, 1.131515, 0, 0.7058824, 1, 1,
0.1379694, 2.223812, -0.3104464, 0, 0.6980392, 1, 1,
0.1409443, -0.8934047, 3.527689, 0, 0.6941177, 1, 1,
0.1450864, -0.7726725, 3.147407, 0, 0.6862745, 1, 1,
0.148696, -0.2036171, 2.423654, 0, 0.682353, 1, 1,
0.1494994, -0.2556417, 2.316668, 0, 0.6745098, 1, 1,
0.1515855, 0.4611625, 0.5258619, 0, 0.6705883, 1, 1,
0.1565849, -0.480429, 3.092911, 0, 0.6627451, 1, 1,
0.1622302, 0.210843, -0.5968642, 0, 0.6588235, 1, 1,
0.172534, 1.064857, -0.4346718, 0, 0.6509804, 1, 1,
0.1731666, -0.5967732, 0.8785144, 0, 0.6470588, 1, 1,
0.179359, -0.5135127, 1.219025, 0, 0.6392157, 1, 1,
0.1815361, -0.6853124, 2.135762, 0, 0.6352941, 1, 1,
0.1816918, -1.650926, 1.95336, 0, 0.627451, 1, 1,
0.1817851, 0.7802007, 1.039447, 0, 0.6235294, 1, 1,
0.1851427, -2.801779, 3.264453, 0, 0.6156863, 1, 1,
0.1863856, -1.133044, 2.406644, 0, 0.6117647, 1, 1,
0.1883713, -2.059266, 3.957691, 0, 0.6039216, 1, 1,
0.1887361, -0.9245971, 1.551861, 0, 0.5960785, 1, 1,
0.1904029, -0.6008734, 2.350236, 0, 0.5921569, 1, 1,
0.2010126, 0.006427712, 2.168054, 0, 0.5843138, 1, 1,
0.2023921, -0.968814, 3.719748, 0, 0.5803922, 1, 1,
0.203563, -0.1209545, 2.471779, 0, 0.572549, 1, 1,
0.2040435, 0.06717666, 1.733131, 0, 0.5686275, 1, 1,
0.2067744, -0.6913709, 2.226884, 0, 0.5607843, 1, 1,
0.2091109, -2.203163, 2.300519, 0, 0.5568628, 1, 1,
0.2140583, 0.6504079, 0.5631754, 0, 0.5490196, 1, 1,
0.2144446, 1.627589, 0.1643338, 0, 0.5450981, 1, 1,
0.2150963, 1.487358, -0.9707081, 0, 0.5372549, 1, 1,
0.2163179, 0.3711157, -0.185401, 0, 0.5333334, 1, 1,
0.2168462, 0.1690324, 0.4452722, 0, 0.5254902, 1, 1,
0.2304089, 0.1644907, 0.7847655, 0, 0.5215687, 1, 1,
0.2328302, 0.2669244, -0.2529142, 0, 0.5137255, 1, 1,
0.2357217, 0.6410899, 2.286066, 0, 0.509804, 1, 1,
0.2364598, -0.08144115, 2.03951, 0, 0.5019608, 1, 1,
0.2386188, 0.09402139, 2.941425, 0, 0.4941176, 1, 1,
0.2398428, 0.6668085, 1.669495, 0, 0.4901961, 1, 1,
0.2446028, 0.4316915, 1.180542, 0, 0.4823529, 1, 1,
0.2447562, -0.4299336, 2.262287, 0, 0.4784314, 1, 1,
0.245297, 0.2252384, 0.4805934, 0, 0.4705882, 1, 1,
0.2454346, -0.3910879, 2.782903, 0, 0.4666667, 1, 1,
0.2457105, -0.4573601, 1.3355, 0, 0.4588235, 1, 1,
0.2502949, -1.207357, 1.09104, 0, 0.454902, 1, 1,
0.2581511, 0.1484898, -0.5361872, 0, 0.4470588, 1, 1,
0.2643429, 1.233509, 2.512625, 0, 0.4431373, 1, 1,
0.2654873, 2.433708, -0.9420478, 0, 0.4352941, 1, 1,
0.267823, 0.3641412, -0.6973506, 0, 0.4313726, 1, 1,
0.2716001, 0.544493, 0.07976529, 0, 0.4235294, 1, 1,
0.2720821, 0.7058504, -0.07225429, 0, 0.4196078, 1, 1,
0.2731569, 0.7502044, 1.45974, 0, 0.4117647, 1, 1,
0.2739605, 2.193627, 0.3519569, 0, 0.4078431, 1, 1,
0.2761962, -1.705848, 2.375962, 0, 0.4, 1, 1,
0.2766939, -0.2599362, 2.54267, 0, 0.3921569, 1, 1,
0.2805491, 2.081151, 2.132449, 0, 0.3882353, 1, 1,
0.281186, -0.6832459, 2.96078, 0, 0.3803922, 1, 1,
0.2822645, -1.324377, 3.264454, 0, 0.3764706, 1, 1,
0.2860799, -0.6610598, 2.155137, 0, 0.3686275, 1, 1,
0.2865499, 0.8738719, 0.8250613, 0, 0.3647059, 1, 1,
0.294676, 1.805407, 0.2439156, 0, 0.3568628, 1, 1,
0.2985972, 0.5752571, 1.561504, 0, 0.3529412, 1, 1,
0.298658, 1.429428, -0.979689, 0, 0.345098, 1, 1,
0.3033693, -1.355935, 3.065984, 0, 0.3411765, 1, 1,
0.3058344, 0.1906292, 0.6662652, 0, 0.3333333, 1, 1,
0.3101622, -0.2812517, 1.019819, 0, 0.3294118, 1, 1,
0.3132089, 0.06446717, 1.253047, 0, 0.3215686, 1, 1,
0.3188853, -1.440054, 2.187522, 0, 0.3176471, 1, 1,
0.3190289, 1.257452, 2.204376, 0, 0.3098039, 1, 1,
0.3199268, -0.5331301, 2.213599, 0, 0.3058824, 1, 1,
0.3206983, -1.630151, 4.445532, 0, 0.2980392, 1, 1,
0.3214436, -0.5968974, 2.744133, 0, 0.2901961, 1, 1,
0.3228022, 0.9806733, 0.6364641, 0, 0.2862745, 1, 1,
0.3321466, -0.6854727, 3.090955, 0, 0.2784314, 1, 1,
0.3347945, 0.8279269, 0.0720577, 0, 0.2745098, 1, 1,
0.345515, -0.06323188, 4.093508, 0, 0.2666667, 1, 1,
0.3478591, 0.9948332, -0.4705639, 0, 0.2627451, 1, 1,
0.3500907, 0.1379518, 1.08103, 0, 0.254902, 1, 1,
0.353696, -0.6907048, 3.908873, 0, 0.2509804, 1, 1,
0.3541744, 0.2042679, 0.1368951, 0, 0.2431373, 1, 1,
0.3583428, -1.478874, 2.353961, 0, 0.2392157, 1, 1,
0.3586179, -2.566809, 3.122094, 0, 0.2313726, 1, 1,
0.3594794, -0.05754276, 1.798332, 0, 0.227451, 1, 1,
0.3614497, -0.7277272, 3.486331, 0, 0.2196078, 1, 1,
0.3648966, -0.02755006, 1.545361, 0, 0.2156863, 1, 1,
0.3716792, 0.9340207, -0.06727877, 0, 0.2078431, 1, 1,
0.37517, -0.742459, 2.300313, 0, 0.2039216, 1, 1,
0.3765958, 0.4611259, 2.076276, 0, 0.1960784, 1, 1,
0.3767968, 0.9623036, 1.406199, 0, 0.1882353, 1, 1,
0.3789462, 1.823557, -0.7350943, 0, 0.1843137, 1, 1,
0.3806558, 0.9365197, 0.5736193, 0, 0.1764706, 1, 1,
0.3813036, -0.7633433, 1.300125, 0, 0.172549, 1, 1,
0.3816601, 0.7198337, 0.7437767, 0, 0.1647059, 1, 1,
0.3827169, -0.4053782, 2.317819, 0, 0.1607843, 1, 1,
0.3835544, 0.6209875, -0.03929546, 0, 0.1529412, 1, 1,
0.3847116, 0.5195133, 0.177182, 0, 0.1490196, 1, 1,
0.3862695, -0.7306014, 3.454642, 0, 0.1411765, 1, 1,
0.3863241, 0.1937953, 0.7607387, 0, 0.1372549, 1, 1,
0.38909, 1.121996, -0.7554606, 0, 0.1294118, 1, 1,
0.3909588, -0.5478719, 1.672461, 0, 0.1254902, 1, 1,
0.3919491, -0.3111203, 3.958212, 0, 0.1176471, 1, 1,
0.3919948, -0.5898464, 3.119131, 0, 0.1137255, 1, 1,
0.3956381, -0.2351048, 1.988461, 0, 0.1058824, 1, 1,
0.4007829, 0.8041281, -0.6221392, 0, 0.09803922, 1, 1,
0.4051912, -1.701998, 2.209594, 0, 0.09411765, 1, 1,
0.4072275, 1.535796, 0.3942978, 0, 0.08627451, 1, 1,
0.4089227, -0.7674763, 1.263545, 0, 0.08235294, 1, 1,
0.4116282, 2.17232, -1.791399, 0, 0.07450981, 1, 1,
0.4177938, 1.302606, 0.6354166, 0, 0.07058824, 1, 1,
0.418746, 1.485206, 0.06291999, 0, 0.0627451, 1, 1,
0.4200427, 0.724728, 0.345631, 0, 0.05882353, 1, 1,
0.4219208, -0.2526217, 0.5354609, 0, 0.05098039, 1, 1,
0.4245493, -0.08023188, 1.464858, 0, 0.04705882, 1, 1,
0.4246669, -0.4263827, 1.264811, 0, 0.03921569, 1, 1,
0.4332468, 0.6630853, 0.09944791, 0, 0.03529412, 1, 1,
0.4345471, 1.732096, 0.1160966, 0, 0.02745098, 1, 1,
0.4351636, 0.5492737, -0.1989328, 0, 0.02352941, 1, 1,
0.4364529, -0.8283005, 2.683493, 0, 0.01568628, 1, 1,
0.4379582, 2.019629, -1.563625, 0, 0.01176471, 1, 1,
0.4402627, -0.2854502, 1.985373, 0, 0.003921569, 1, 1,
0.4469691, 0.06602786, 1.381593, 0.003921569, 0, 1, 1,
0.4484279, -1.068637, 0.9954144, 0.007843138, 0, 1, 1,
0.4492866, -0.6567408, 0.4334719, 0.01568628, 0, 1, 1,
0.4519315, 0.7753525, -0.08610827, 0.01960784, 0, 1, 1,
0.4568397, -1.026685, 3.426138, 0.02745098, 0, 1, 1,
0.460862, -0.3784716, 2.8505, 0.03137255, 0, 1, 1,
0.4616051, 0.2479478, 2.375028, 0.03921569, 0, 1, 1,
0.4630608, 0.08580773, 1.386481, 0.04313726, 0, 1, 1,
0.4651936, 0.2741923, 1.121696, 0.05098039, 0, 1, 1,
0.4697925, 0.4514716, 0.2153352, 0.05490196, 0, 1, 1,
0.4756929, -0.1187847, 1.866265, 0.0627451, 0, 1, 1,
0.480455, -0.294565, 1.721583, 0.06666667, 0, 1, 1,
0.4807802, -1.816153, 3.066884, 0.07450981, 0, 1, 1,
0.4832703, 0.5120129, -1.314354, 0.07843138, 0, 1, 1,
0.4839123, 0.2643881, 0.5601878, 0.08627451, 0, 1, 1,
0.4849585, -1.731234, 1.980562, 0.09019608, 0, 1, 1,
0.4855811, 0.5317962, -0.202358, 0.09803922, 0, 1, 1,
0.4868841, 0.499043, 0.8917997, 0.1058824, 0, 1, 1,
0.4874446, -0.0501411, 1.086734, 0.1098039, 0, 1, 1,
0.4888146, -0.6946176, 2.63028, 0.1176471, 0, 1, 1,
0.4943091, 0.4933397, 0.2560112, 0.1215686, 0, 1, 1,
0.4966229, -0.8527699, 4.06567, 0.1294118, 0, 1, 1,
0.4997787, 0.9522233, 0.5795631, 0.1333333, 0, 1, 1,
0.503985, 0.4188222, 1.374145, 0.1411765, 0, 1, 1,
0.5066294, -1.212134, 4.631589, 0.145098, 0, 1, 1,
0.5072572, 0.2859125, 0.4915326, 0.1529412, 0, 1, 1,
0.5139706, 1.930896, -0.4018537, 0.1568628, 0, 1, 1,
0.5144089, -0.6759912, 1.546691, 0.1647059, 0, 1, 1,
0.5247411, -0.08354369, 2.198807, 0.1686275, 0, 1, 1,
0.5273669, -0.5576327, 1.273238, 0.1764706, 0, 1, 1,
0.5301734, 0.7771525, 1.349525, 0.1803922, 0, 1, 1,
0.5325635, 1.816811, -0.8260229, 0.1882353, 0, 1, 1,
0.5341491, -1.482182, 3.985481, 0.1921569, 0, 1, 1,
0.5434936, -1.828955, 4.757212, 0.2, 0, 1, 1,
0.5440283, -0.421353, 2.109601, 0.2078431, 0, 1, 1,
0.5462064, 0.006784115, 1.83429, 0.2117647, 0, 1, 1,
0.5486757, -0.6398177, 1.535436, 0.2196078, 0, 1, 1,
0.5487387, -2.163012, 3.715612, 0.2235294, 0, 1, 1,
0.5502111, -1.099603, 0.966616, 0.2313726, 0, 1, 1,
0.5538434, -0.7187295, 0.7376558, 0.2352941, 0, 1, 1,
0.5586725, -0.7180607, 4.167738, 0.2431373, 0, 1, 1,
0.5591064, -1.718196, 2.627842, 0.2470588, 0, 1, 1,
0.5591459, 1.179654, 0.1526967, 0.254902, 0, 1, 1,
0.5642859, 0.9828769, 3.198951, 0.2588235, 0, 1, 1,
0.5686258, 1.377434, 0.2912172, 0.2666667, 0, 1, 1,
0.5707827, -1.214078, 3.158149, 0.2705882, 0, 1, 1,
0.5718257, 1.06811, 1.611984, 0.2784314, 0, 1, 1,
0.5744791, -0.5951892, 4.007047, 0.282353, 0, 1, 1,
0.5757322, -1.300214, 2.01515, 0.2901961, 0, 1, 1,
0.5761321, -0.8558424, 1.671955, 0.2941177, 0, 1, 1,
0.5784683, 0.002694909, 1.935096, 0.3019608, 0, 1, 1,
0.5862651, 0.1327658, 2.039395, 0.3098039, 0, 1, 1,
0.5914519, 0.4747448, 1.196549, 0.3137255, 0, 1, 1,
0.5931606, 0.7973424, -0.3145084, 0.3215686, 0, 1, 1,
0.5995343, -0.4727877, 2.526633, 0.3254902, 0, 1, 1,
0.6080947, 0.7161381, -0.3547538, 0.3333333, 0, 1, 1,
0.6091571, -0.02072001, 1.862499, 0.3372549, 0, 1, 1,
0.6104272, 0.2270402, -0.5910609, 0.345098, 0, 1, 1,
0.6155188, 0.2151589, 0.6691843, 0.3490196, 0, 1, 1,
0.616993, -0.8922135, 1.098457, 0.3568628, 0, 1, 1,
0.6176735, -1.037053, 1.18118, 0.3607843, 0, 1, 1,
0.6233956, -0.2290026, 2.430161, 0.3686275, 0, 1, 1,
0.6277449, -0.7339731, 2.616433, 0.372549, 0, 1, 1,
0.6297141, 1.178385, 1.419275, 0.3803922, 0, 1, 1,
0.6312226, -0.7895673, 3.139445, 0.3843137, 0, 1, 1,
0.6330624, 1.277269, 1.422663, 0.3921569, 0, 1, 1,
0.6346707, -0.8507109, 3.439291, 0.3960784, 0, 1, 1,
0.6394323, -1.436645, 3.899105, 0.4039216, 0, 1, 1,
0.6418346, 0.4331182, 0.6512125, 0.4117647, 0, 1, 1,
0.6444595, -0.5507566, 3.203198, 0.4156863, 0, 1, 1,
0.6462348, -1.23773, 3.529168, 0.4235294, 0, 1, 1,
0.6480802, 0.1810787, 1.48525, 0.427451, 0, 1, 1,
0.6511193, -1.703964, 2.288429, 0.4352941, 0, 1, 1,
0.6516378, -0.05649035, 0.8708397, 0.4392157, 0, 1, 1,
0.6518195, -0.4711552, 1.256175, 0.4470588, 0, 1, 1,
0.6543744, 0.6212563, -0.04323395, 0.4509804, 0, 1, 1,
0.654557, -0.4909876, 2.081188, 0.4588235, 0, 1, 1,
0.6567277, 0.2289591, 1.144018, 0.4627451, 0, 1, 1,
0.6576162, 0.448014, 3.985055, 0.4705882, 0, 1, 1,
0.6591663, -0.7096865, 1.492301, 0.4745098, 0, 1, 1,
0.6601585, -0.1249535, 0.5033568, 0.4823529, 0, 1, 1,
0.668272, 0.5855495, 2.175126, 0.4862745, 0, 1, 1,
0.6719806, -0.9178895, 3.04604, 0.4941176, 0, 1, 1,
0.6764147, 0.4141636, 0.9041821, 0.5019608, 0, 1, 1,
0.6767074, 0.8862115, -1.681265, 0.5058824, 0, 1, 1,
0.680638, -0.2133186, 2.433814, 0.5137255, 0, 1, 1,
0.6830512, 0.1815961, 1.916295, 0.5176471, 0, 1, 1,
0.688852, 0.4990252, 1.940076, 0.5254902, 0, 1, 1,
0.6962416, -1.83078, 2.588559, 0.5294118, 0, 1, 1,
0.6963168, 0.06213161, 0.9200034, 0.5372549, 0, 1, 1,
0.6969766, 0.08347585, 1.367112, 0.5411765, 0, 1, 1,
0.6989883, -1.506202, 4.298635, 0.5490196, 0, 1, 1,
0.7027478, -2.138681, 1.777219, 0.5529412, 0, 1, 1,
0.7064671, 1.17391, -0.5247849, 0.5607843, 0, 1, 1,
0.7083182, -1.582934, 2.876169, 0.5647059, 0, 1, 1,
0.7137182, 0.914112, -0.681938, 0.572549, 0, 1, 1,
0.7160441, -0.9231892, 2.010316, 0.5764706, 0, 1, 1,
0.7160507, -0.2789406, 1.214036, 0.5843138, 0, 1, 1,
0.7190961, 1.545765, -0.8766379, 0.5882353, 0, 1, 1,
0.7202771, 1.082311, 0.139451, 0.5960785, 0, 1, 1,
0.7225859, 0.1161091, 1.356904, 0.6039216, 0, 1, 1,
0.7231336, -1.936702, 1.384676, 0.6078432, 0, 1, 1,
0.7250126, 1.251801, 1.697766, 0.6156863, 0, 1, 1,
0.7317332, 2.179609, 1.137995, 0.6196079, 0, 1, 1,
0.7400149, -1.456183, 1.851055, 0.627451, 0, 1, 1,
0.7404031, -1.466573, 1.501249, 0.6313726, 0, 1, 1,
0.742874, -0.2388225, 2.456784, 0.6392157, 0, 1, 1,
0.7441259, 0.2912094, 1.186254, 0.6431373, 0, 1, 1,
0.7441783, -0.5783808, 2.230133, 0.6509804, 0, 1, 1,
0.748377, 2.47893, 1.437891, 0.654902, 0, 1, 1,
0.7583624, -0.1409364, 1.396164, 0.6627451, 0, 1, 1,
0.760506, -0.5006222, 2.937123, 0.6666667, 0, 1, 1,
0.7613862, -2.030228, 1.35898, 0.6745098, 0, 1, 1,
0.7689519, 1.803664, 0.850876, 0.6784314, 0, 1, 1,
0.7705101, -0.272757, 2.746173, 0.6862745, 0, 1, 1,
0.776684, -0.171638, 1.017091, 0.6901961, 0, 1, 1,
0.7808654, 0.202952, 1.190215, 0.6980392, 0, 1, 1,
0.7827942, 1.125071, 0.8473555, 0.7058824, 0, 1, 1,
0.7836588, -0.871891, 3.731565, 0.7098039, 0, 1, 1,
0.7836843, -1.311639, 1.195839, 0.7176471, 0, 1, 1,
0.7839459, 0.1950641, 1.545771, 0.7215686, 0, 1, 1,
0.7855964, -0.3703042, 0.7928422, 0.7294118, 0, 1, 1,
0.7883679, -1.190083, 2.117555, 0.7333333, 0, 1, 1,
0.7935708, 0.6625026, -0.5653743, 0.7411765, 0, 1, 1,
0.7981003, 1.226521, 1.614334, 0.7450981, 0, 1, 1,
0.8010958, -0.09390113, 0.2986737, 0.7529412, 0, 1, 1,
0.8016231, 0.5736028, 0.830353, 0.7568628, 0, 1, 1,
0.8036977, 1.052511, 1.449254, 0.7647059, 0, 1, 1,
0.8080764, -1.691761, 4.141689, 0.7686275, 0, 1, 1,
0.811473, 0.481982, 3.041269, 0.7764706, 0, 1, 1,
0.8117288, -1.278729, 1.101656, 0.7803922, 0, 1, 1,
0.8121454, -1.302941, 1.673205, 0.7882353, 0, 1, 1,
0.8128266, 0.5207264, 1.015357, 0.7921569, 0, 1, 1,
0.8163412, 0.3982033, 2.549044, 0.8, 0, 1, 1,
0.8192161, 1.192027, 0.1105283, 0.8078431, 0, 1, 1,
0.82466, 0.2995505, 2.091223, 0.8117647, 0, 1, 1,
0.8281543, -0.9885471, 2.491102, 0.8196079, 0, 1, 1,
0.8289272, -1.74404, 1.550036, 0.8235294, 0, 1, 1,
0.8396516, 0.9510868, -0.2532184, 0.8313726, 0, 1, 1,
0.8529746, -0.7525132, 2.024239, 0.8352941, 0, 1, 1,
0.8535255, -1.755979, 2.733318, 0.8431373, 0, 1, 1,
0.8537205, -0.3556911, 1.457679, 0.8470588, 0, 1, 1,
0.8557131, -1.541775, 2.363789, 0.854902, 0, 1, 1,
0.8581559, 1.05563, 0.3437251, 0.8588235, 0, 1, 1,
0.8628608, -0.822454, 3.350623, 0.8666667, 0, 1, 1,
0.8685196, -0.119355, 2.088246, 0.8705882, 0, 1, 1,
0.8695399, 0.423887, 2.187839, 0.8784314, 0, 1, 1,
0.8696773, -0.8773792, 1.817938, 0.8823529, 0, 1, 1,
0.8757979, 1.121046, 0.3786637, 0.8901961, 0, 1, 1,
0.8803926, 0.3983312, 0.3348321, 0.8941177, 0, 1, 1,
0.8811694, 0.9944574, 1.555062, 0.9019608, 0, 1, 1,
0.8855981, -0.2434047, 1.739663, 0.9098039, 0, 1, 1,
0.8857029, 0.3096865, 0.9868598, 0.9137255, 0, 1, 1,
0.8965876, -0.7578439, 4.167404, 0.9215686, 0, 1, 1,
0.8992501, 0.09924944, 1.575956, 0.9254902, 0, 1, 1,
0.8998135, 0.7982096, 3.040909, 0.9333333, 0, 1, 1,
0.9009295, -1.48735, 3.525706, 0.9372549, 0, 1, 1,
0.9078903, 0.1640213, 2.346972, 0.945098, 0, 1, 1,
0.909485, 0.7785459, -0.01467702, 0.9490196, 0, 1, 1,
0.9100342, -0.06501558, 0.8952074, 0.9568627, 0, 1, 1,
0.9144746, -1.849655, 4.356173, 0.9607843, 0, 1, 1,
0.9145057, -0.7435219, 1.271691, 0.9686275, 0, 1, 1,
0.9207288, -1.196752, 0.79082, 0.972549, 0, 1, 1,
0.9227695, 0.01253577, 0.8260587, 0.9803922, 0, 1, 1,
0.9301952, -0.8144548, 1.174643, 0.9843137, 0, 1, 1,
0.9321001, 0.852196, 1.868092, 0.9921569, 0, 1, 1,
0.9321176, 0.6041726, 0.8164726, 0.9960784, 0, 1, 1,
0.9369071, -0.8306991, 3.001741, 1, 0, 0.9960784, 1,
0.9513065, -1.130929, 2.532272, 1, 0, 0.9882353, 1,
0.9522993, -1.236765, 2.166793, 1, 0, 0.9843137, 1,
0.9547019, 2.071929, 0.6223394, 1, 0, 0.9764706, 1,
0.9571738, -0.2553218, 4.967205, 1, 0, 0.972549, 1,
0.9638622, 1.042006, 0.2835257, 1, 0, 0.9647059, 1,
0.9744166, 0.2706771, 3.026386, 1, 0, 0.9607843, 1,
0.9749699, 1.046489, -1.000306, 1, 0, 0.9529412, 1,
0.9836558, -3.297118, 4.163538, 1, 0, 0.9490196, 1,
0.9938182, 1.624402, 0.3769628, 1, 0, 0.9411765, 1,
1.004809, -0.5851611, 3.370226, 1, 0, 0.9372549, 1,
1.005307, 0.4289376, 1.371275, 1, 0, 0.9294118, 1,
1.007486, 0.5771602, 1.020448, 1, 0, 0.9254902, 1,
1.008051, -0.6592094, 2.492051, 1, 0, 0.9176471, 1,
1.010874, 1.088108, 0.5238419, 1, 0, 0.9137255, 1,
1.021396, 0.3827719, 1.820004, 1, 0, 0.9058824, 1,
1.021445, -0.6520081, 1.808115, 1, 0, 0.9019608, 1,
1.030349, 0.4936035, 2.483274, 1, 0, 0.8941177, 1,
1.035645, -0.07903923, -0.9261294, 1, 0, 0.8862745, 1,
1.036885, 0.3841586, 2.278487, 1, 0, 0.8823529, 1,
1.037159, -1.618811, 2.317743, 1, 0, 0.8745098, 1,
1.0385, 1.380375, 0.05238759, 1, 0, 0.8705882, 1,
1.043843, 0.2245969, 2.072438, 1, 0, 0.8627451, 1,
1.050735, 1.12379, 0.1325691, 1, 0, 0.8588235, 1,
1.06697, 1.360668, 0.9786233, 1, 0, 0.8509804, 1,
1.071647, 0.5019478, 2.091388, 1, 0, 0.8470588, 1,
1.079619, 1.338404, 1.76905, 1, 0, 0.8392157, 1,
1.083036, -0.02478884, 1.647616, 1, 0, 0.8352941, 1,
1.085021, -1.231136, 3.755423, 1, 0, 0.827451, 1,
1.089989, -0.7345861, 1.181911, 1, 0, 0.8235294, 1,
1.095637, 0.9137877, -0.2905368, 1, 0, 0.8156863, 1,
1.095885, 0.6036119, 1.819159, 1, 0, 0.8117647, 1,
1.099623, -0.6464473, 0.1505188, 1, 0, 0.8039216, 1,
1.106868, -2.172632, 1.080598, 1, 0, 0.7960784, 1,
1.111445, -0.8750137, 2.069288, 1, 0, 0.7921569, 1,
1.113879, 0.5670792, -0.08104248, 1, 0, 0.7843137, 1,
1.117998, -1.110236, 3.571194, 1, 0, 0.7803922, 1,
1.118744, -1.203824, 1.353926, 1, 0, 0.772549, 1,
1.127388, -2.381162, 3.727399, 1, 0, 0.7686275, 1,
1.128608, -2.5021, 1.035671, 1, 0, 0.7607843, 1,
1.130977, -0.8381187, 2.173285, 1, 0, 0.7568628, 1,
1.13827, 0.973211, 0.4342617, 1, 0, 0.7490196, 1,
1.142579, -1.391806, 2.11375, 1, 0, 0.7450981, 1,
1.150061, 0.6237493, 1.02133, 1, 0, 0.7372549, 1,
1.153335, 0.2259809, 1.060091, 1, 0, 0.7333333, 1,
1.160407, 0.6279381, -0.4392547, 1, 0, 0.7254902, 1,
1.163867, 0.1424937, 1.318538, 1, 0, 0.7215686, 1,
1.165665, -0.8306094, 2.327401, 1, 0, 0.7137255, 1,
1.168205, 0.9428506, 1.369263, 1, 0, 0.7098039, 1,
1.169954, -0.1744935, 3.101425, 1, 0, 0.7019608, 1,
1.176422, 0.855514, -0.5667358, 1, 0, 0.6941177, 1,
1.185563, 0.2882731, 2.345803, 1, 0, 0.6901961, 1,
1.18724, -0.525212, 0.9012983, 1, 0, 0.682353, 1,
1.199234, -1.57215, 3.28299, 1, 0, 0.6784314, 1,
1.200351, 0.4121746, 0.7010205, 1, 0, 0.6705883, 1,
1.206287, 1.844451, -0.8961215, 1, 0, 0.6666667, 1,
1.20958, 0.6027344, 1.400945, 1, 0, 0.6588235, 1,
1.210922, 0.9722113, 0.5151623, 1, 0, 0.654902, 1,
1.221818, 1.558463, -0.1251654, 1, 0, 0.6470588, 1,
1.235024, -0.4777716, 1.663977, 1, 0, 0.6431373, 1,
1.235513, 1.959781, -0.2047762, 1, 0, 0.6352941, 1,
1.235568, 1.760793, 0.822732, 1, 0, 0.6313726, 1,
1.247567, -1.355751, 2.163431, 1, 0, 0.6235294, 1,
1.258273, -0.4529167, 2.938676, 1, 0, 0.6196079, 1,
1.260115, -0.2722242, 2.277915, 1, 0, 0.6117647, 1,
1.261629, 1.226539, 0.5410377, 1, 0, 0.6078432, 1,
1.269422, -1.070614, 2.615413, 1, 0, 0.6, 1,
1.281138, 0.1419447, 1.491722, 1, 0, 0.5921569, 1,
1.286178, -0.3014984, 1.21938, 1, 0, 0.5882353, 1,
1.287661, -0.1153363, 1.288823, 1, 0, 0.5803922, 1,
1.290224, -0.2392599, 1.143036, 1, 0, 0.5764706, 1,
1.29628, 1.756005, 0.346427, 1, 0, 0.5686275, 1,
1.297372, -1.42695, 4.138885, 1, 0, 0.5647059, 1,
1.298657, 0.7452695, -0.3618557, 1, 0, 0.5568628, 1,
1.305264, -1.629913, 2.044528, 1, 0, 0.5529412, 1,
1.306797, -0.9184699, 0.9164165, 1, 0, 0.5450981, 1,
1.309248, 0.3319939, 0.8677763, 1, 0, 0.5411765, 1,
1.313278, -1.722384, 0.4367109, 1, 0, 0.5333334, 1,
1.316323, 0.587971, 1.907622, 1, 0, 0.5294118, 1,
1.321369, -0.3728583, 0.6983897, 1, 0, 0.5215687, 1,
1.323114, 1.272509, 0.6150592, 1, 0, 0.5176471, 1,
1.329562, 0.583472, 0.081441, 1, 0, 0.509804, 1,
1.363757, 0.3587624, 0.7865845, 1, 0, 0.5058824, 1,
1.369033, 0.4469534, 1.3111, 1, 0, 0.4980392, 1,
1.392045, -0.06315126, 1.11535, 1, 0, 0.4901961, 1,
1.396843, -0.8422812, 3.726206, 1, 0, 0.4862745, 1,
1.402672, -0.7909686, 2.338835, 1, 0, 0.4784314, 1,
1.405087, -0.3246844, 2.120236, 1, 0, 0.4745098, 1,
1.414232, 1.625998, -0.4729102, 1, 0, 0.4666667, 1,
1.438858, 1.098654, 0.593668, 1, 0, 0.4627451, 1,
1.4399, -0.3367869, 2.746307, 1, 0, 0.454902, 1,
1.453668, -0.8435476, 2.734865, 1, 0, 0.4509804, 1,
1.461948, -0.3457619, 1.863863, 1, 0, 0.4431373, 1,
1.46871, 0.5421956, 0.2092607, 1, 0, 0.4392157, 1,
1.478466, 2.067359, 0.03216791, 1, 0, 0.4313726, 1,
1.485156, 1.333198, -0.9142541, 1, 0, 0.427451, 1,
1.486506, -0.7589774, 0.7402982, 1, 0, 0.4196078, 1,
1.501171, 0.2593831, 2.854679, 1, 0, 0.4156863, 1,
1.505069, -1.233583, 0.8611712, 1, 0, 0.4078431, 1,
1.51625, 1.440165, 1.559917, 1, 0, 0.4039216, 1,
1.521221, -0.9251335, 0.7141077, 1, 0, 0.3960784, 1,
1.523757, 0.5739583, 1.806973, 1, 0, 0.3882353, 1,
1.532127, 0.4300584, 1.337965, 1, 0, 0.3843137, 1,
1.541739, 0.4448802, 0.4827941, 1, 0, 0.3764706, 1,
1.541743, -0.4757957, 1.670946, 1, 0, 0.372549, 1,
1.55769, -0.8942315, 4.030643, 1, 0, 0.3647059, 1,
1.559043, 0.9928358, 2.226263, 1, 0, 0.3607843, 1,
1.570352, 1.586892, 0.4372512, 1, 0, 0.3529412, 1,
1.587959, 0.4349709, 0.9154289, 1, 0, 0.3490196, 1,
1.592161, 1.414042, 0.9876374, 1, 0, 0.3411765, 1,
1.606077, 0.8633696, 1.204887, 1, 0, 0.3372549, 1,
1.622521, 1.024517, 1.634206, 1, 0, 0.3294118, 1,
1.622723, 0.6461118, 2.139486, 1, 0, 0.3254902, 1,
1.623273, -0.1228476, 1.555067, 1, 0, 0.3176471, 1,
1.624532, 1.358587, 0.1104617, 1, 0, 0.3137255, 1,
1.62508, 0.977978, -0.5438998, 1, 0, 0.3058824, 1,
1.639994, -0.5728021, 2.522217, 1, 0, 0.2980392, 1,
1.640437, 0.9980152, -0.4454972, 1, 0, 0.2941177, 1,
1.642229, 1.029374, 0.7977152, 1, 0, 0.2862745, 1,
1.658418, -0.6489829, 3.455925, 1, 0, 0.282353, 1,
1.659953, -1.246637, 1.639267, 1, 0, 0.2745098, 1,
1.681925, 1.703372, 1.593243, 1, 0, 0.2705882, 1,
1.682653, 0.6833531, -0.1503417, 1, 0, 0.2627451, 1,
1.687353, 0.3009477, 1.02228, 1, 0, 0.2588235, 1,
1.700777, 0.1924869, 0.5182238, 1, 0, 0.2509804, 1,
1.71127, -2.026832, 1.929168, 1, 0, 0.2470588, 1,
1.732478, 1.902783, 1.189384, 1, 0, 0.2392157, 1,
1.734481, 0.2220594, 1.259233, 1, 0, 0.2352941, 1,
1.751864, 0.391225, 2.662539, 1, 0, 0.227451, 1,
1.757867, 1.169191, 1.705809, 1, 0, 0.2235294, 1,
1.758724, -0.6269904, 2.433075, 1, 0, 0.2156863, 1,
1.77726, -0.9072019, 1.363253, 1, 0, 0.2117647, 1,
1.77867, -1.872521, 2.608778, 1, 0, 0.2039216, 1,
1.780917, 1.601555, 1.065807, 1, 0, 0.1960784, 1,
1.797329, 0.517443, 1.6622, 1, 0, 0.1921569, 1,
1.815154, -0.1198859, 1.964245, 1, 0, 0.1843137, 1,
1.819598, 0.7930715, -1.401693, 1, 0, 0.1803922, 1,
1.820968, -0.748115, 1.068986, 1, 0, 0.172549, 1,
1.85018, 0.7571157, 0.5918621, 1, 0, 0.1686275, 1,
1.860454, -1.164419, 2.693754, 1, 0, 0.1607843, 1,
1.869333, 0.6441619, 1.710354, 1, 0, 0.1568628, 1,
1.877427, 1.291925, 1.416446, 1, 0, 0.1490196, 1,
1.89913, -0.7051963, 0.72686, 1, 0, 0.145098, 1,
1.914905, 0.7925601, 0.4876143, 1, 0, 0.1372549, 1,
1.920579, -0.192802, 1.156642, 1, 0, 0.1333333, 1,
1.939181, -0.5229689, 1.477692, 1, 0, 0.1254902, 1,
1.941777, -0.7733012, 2.299639, 1, 0, 0.1215686, 1,
1.964218, 0.1030517, 2.048529, 1, 0, 0.1137255, 1,
2.035002, -0.2436435, 3.898633, 1, 0, 0.1098039, 1,
2.062711, 0.02905016, 2.570657, 1, 0, 0.1019608, 1,
2.178766, 1.820861, 1.058974, 1, 0, 0.09411765, 1,
2.192856, -0.5959647, 0.5548208, 1, 0, 0.09019608, 1,
2.204057, -1.484367, 2.71792, 1, 0, 0.08235294, 1,
2.252076, 1.150218, -0.1323341, 1, 0, 0.07843138, 1,
2.266013, -1.215306, 0.9219368, 1, 0, 0.07058824, 1,
2.368182, -1.635623, 1.646871, 1, 0, 0.06666667, 1,
2.384807, -0.2805442, 2.49574, 1, 0, 0.05882353, 1,
2.389433, 0.616569, 2.140077, 1, 0, 0.05490196, 1,
2.443211, -2.598104, 1.980446, 1, 0, 0.04705882, 1,
2.449457, -0.7622451, 0.02503505, 1, 0, 0.04313726, 1,
2.4748, 0.0746968, 2.679667, 1, 0, 0.03529412, 1,
2.502697, -0.1907458, 1.336543, 1, 0, 0.03137255, 1,
2.526894, -0.43927, 0.4396073, 1, 0, 0.02352941, 1,
2.652953, 0.4290755, 2.491402, 1, 0, 0.01960784, 1,
2.690269, 0.04378657, 0.0645781, 1, 0, 0.01176471, 1,
2.754663, 0.6954231, 1.881484, 1, 0, 0.007843138, 1
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
-0.08409655, -4.35308, -7.284894, 0, -0.5, 0.5, 0.5,
-0.08409655, -4.35308, -7.284894, 1, -0.5, 0.5, 0.5,
-0.08409655, -4.35308, -7.284894, 1, 1.5, 0.5, 0.5,
-0.08409655, -4.35308, -7.284894, 0, 1.5, 0.5, 0.5
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
-3.885196, -0.1821862, -7.284894, 0, -0.5, 0.5, 0.5,
-3.885196, -0.1821862, -7.284894, 1, -0.5, 0.5, 0.5,
-3.885196, -0.1821862, -7.284894, 1, 1.5, 0.5, 0.5,
-3.885196, -0.1821862, -7.284894, 0, 1.5, 0.5, 0.5
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
-3.885196, -4.35308, 0.223093, 0, -0.5, 0.5, 0.5,
-3.885196, -4.35308, 0.223093, 1, -0.5, 0.5, 0.5,
-3.885196, -4.35308, 0.223093, 1, 1.5, 0.5, 0.5,
-3.885196, -4.35308, 0.223093, 0, 1.5, 0.5, 0.5
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
-2, -3.390566, -5.552281,
2, -3.390566, -5.552281,
-2, -3.390566, -5.552281,
-2, -3.550985, -5.84105,
-1, -3.390566, -5.552281,
-1, -3.550985, -5.84105,
0, -3.390566, -5.552281,
0, -3.550985, -5.84105,
1, -3.390566, -5.552281,
1, -3.550985, -5.84105,
2, -3.390566, -5.552281,
2, -3.550985, -5.84105
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
-2, -3.871823, -6.418588, 0, -0.5, 0.5, 0.5,
-2, -3.871823, -6.418588, 1, -0.5, 0.5, 0.5,
-2, -3.871823, -6.418588, 1, 1.5, 0.5, 0.5,
-2, -3.871823, -6.418588, 0, 1.5, 0.5, 0.5,
-1, -3.871823, -6.418588, 0, -0.5, 0.5, 0.5,
-1, -3.871823, -6.418588, 1, -0.5, 0.5, 0.5,
-1, -3.871823, -6.418588, 1, 1.5, 0.5, 0.5,
-1, -3.871823, -6.418588, 0, 1.5, 0.5, 0.5,
0, -3.871823, -6.418588, 0, -0.5, 0.5, 0.5,
0, -3.871823, -6.418588, 1, -0.5, 0.5, 0.5,
0, -3.871823, -6.418588, 1, 1.5, 0.5, 0.5,
0, -3.871823, -6.418588, 0, 1.5, 0.5, 0.5,
1, -3.871823, -6.418588, 0, -0.5, 0.5, 0.5,
1, -3.871823, -6.418588, 1, -0.5, 0.5, 0.5,
1, -3.871823, -6.418588, 1, 1.5, 0.5, 0.5,
1, -3.871823, -6.418588, 0, 1.5, 0.5, 0.5,
2, -3.871823, -6.418588, 0, -0.5, 0.5, 0.5,
2, -3.871823, -6.418588, 1, -0.5, 0.5, 0.5,
2, -3.871823, -6.418588, 1, 1.5, 0.5, 0.5,
2, -3.871823, -6.418588, 0, 1.5, 0.5, 0.5
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
-3.008019, -3, -5.552281,
-3.008019, 2, -5.552281,
-3.008019, -3, -5.552281,
-3.154215, -3, -5.84105,
-3.008019, -2, -5.552281,
-3.154215, -2, -5.84105,
-3.008019, -1, -5.552281,
-3.154215, -1, -5.84105,
-3.008019, 0, -5.552281,
-3.154215, 0, -5.84105,
-3.008019, 1, -5.552281,
-3.154215, 1, -5.84105,
-3.008019, 2, -5.552281,
-3.154215, 2, -5.84105
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
-3.446608, -3, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, -3, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, -3, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, -3, -6.418588, 0, 1.5, 0.5, 0.5,
-3.446608, -2, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, -2, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, -2, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, -2, -6.418588, 0, 1.5, 0.5, 0.5,
-3.446608, -1, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, -1, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, -1, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, -1, -6.418588, 0, 1.5, 0.5, 0.5,
-3.446608, 0, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, 0, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, 0, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, 0, -6.418588, 0, 1.5, 0.5, 0.5,
-3.446608, 1, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, 1, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, 1, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, 1, -6.418588, 0, 1.5, 0.5, 0.5,
-3.446608, 2, -6.418588, 0, -0.5, 0.5, 0.5,
-3.446608, 2, -6.418588, 1, -0.5, 0.5, 0.5,
-3.446608, 2, -6.418588, 1, 1.5, 0.5, 0.5,
-3.446608, 2, -6.418588, 0, 1.5, 0.5, 0.5
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
-3.008019, -3.390566, -4,
-3.008019, -3.390566, 4,
-3.008019, -3.390566, -4,
-3.154215, -3.550985, -4,
-3.008019, -3.390566, -2,
-3.154215, -3.550985, -2,
-3.008019, -3.390566, 0,
-3.154215, -3.550985, 0,
-3.008019, -3.390566, 2,
-3.154215, -3.550985, 2,
-3.008019, -3.390566, 4,
-3.154215, -3.550985, 4
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
-3.446608, -3.871823, -4, 0, -0.5, 0.5, 0.5,
-3.446608, -3.871823, -4, 1, -0.5, 0.5, 0.5,
-3.446608, -3.871823, -4, 1, 1.5, 0.5, 0.5,
-3.446608, -3.871823, -4, 0, 1.5, 0.5, 0.5,
-3.446608, -3.871823, -2, 0, -0.5, 0.5, 0.5,
-3.446608, -3.871823, -2, 1, -0.5, 0.5, 0.5,
-3.446608, -3.871823, -2, 1, 1.5, 0.5, 0.5,
-3.446608, -3.871823, -2, 0, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 0, 0, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 0, 1, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 0, 1, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 0, 0, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 2, 0, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 2, 1, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 2, 1, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 2, 0, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 4, 0, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 4, 1, -0.5, 0.5, 0.5,
-3.446608, -3.871823, 4, 1, 1.5, 0.5, 0.5,
-3.446608, -3.871823, 4, 0, 1.5, 0.5, 0.5
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
-3.008019, -3.390566, -5.552281,
-3.008019, 3.026194, -5.552281,
-3.008019, -3.390566, 5.998467,
-3.008019, 3.026194, 5.998467,
-3.008019, -3.390566, -5.552281,
-3.008019, -3.390566, 5.998467,
-3.008019, 3.026194, -5.552281,
-3.008019, 3.026194, 5.998467,
-3.008019, -3.390566, -5.552281,
2.839826, -3.390566, -5.552281,
-3.008019, -3.390566, 5.998467,
2.839826, -3.390566, 5.998467,
-3.008019, 3.026194, -5.552281,
2.839826, 3.026194, -5.552281,
-3.008019, 3.026194, 5.998467,
2.839826, 3.026194, 5.998467,
2.839826, -3.390566, -5.552281,
2.839826, 3.026194, -5.552281,
2.839826, -3.390566, 5.998467,
2.839826, 3.026194, 5.998467,
2.839826, -3.390566, -5.552281,
2.839826, -3.390566, 5.998467,
2.839826, 3.026194, -5.552281,
2.839826, 3.026194, 5.998467
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
var radius = 7.715824;
var distance = 34.32857;
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
mvMatrix.translate( 0.08409655, 0.1821862, -0.223093 );
mvMatrix.scale( 1.426594, 1.300111, 0.7222475 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.32857);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
methane_sulfonanilid<-read.table("methane_sulfonanilid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methane_sulfonanilid$V2
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
```

```r
y<-methane_sulfonanilid$V3
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
```

```r
z<-methane_sulfonanilid$V4
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
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
-2.922856, -2.251654, -2.414739, 0, 0, 1, 1, 1,
-2.894341, -1.32752, -3.165697, 1, 0, 0, 1, 1,
-2.789302, -1.567496, -1.772602, 1, 0, 0, 1, 1,
-2.753472, -0.7281891, -2.914503, 1, 0, 0, 1, 1,
-2.716627, -1.024653, -2.476177, 1, 0, 0, 1, 1,
-2.592432, 1.045661, 0.5562552, 1, 0, 0, 1, 1,
-2.562089, -0.9394424, -2.187829, 0, 0, 0, 1, 1,
-2.523602, -0.0267848, -0.4687137, 0, 0, 0, 1, 1,
-2.404877, 1.372024, -0.04221397, 0, 0, 0, 1, 1,
-2.39089, -2.204451, -2.174627, 0, 0, 0, 1, 1,
-2.348228, -1.163517, -2.190773, 0, 0, 0, 1, 1,
-2.326146, -0.2702626, -2.420808, 0, 0, 0, 1, 1,
-2.278912, 0.5735055, -2.595073, 0, 0, 0, 1, 1,
-2.277277, 1.585437, -2.309644, 1, 1, 1, 1, 1,
-2.260687, -0.5121139, -1.46227, 1, 1, 1, 1, 1,
-2.239022, 0.208541, -1.306104, 1, 1, 1, 1, 1,
-2.18296, -1.213888, -2.25262, 1, 1, 1, 1, 1,
-2.182127, -0.8166835, -2.60499, 1, 1, 1, 1, 1,
-2.176379, 0.2288893, -2.045173, 1, 1, 1, 1, 1,
-2.144321, 0.3565158, -1.243326, 1, 1, 1, 1, 1,
-2.12169, 0.3073647, -1.958492, 1, 1, 1, 1, 1,
-2.088019, 0.01601746, -1.545105, 1, 1, 1, 1, 1,
-2.084332, 0.3236985, -1.081535, 1, 1, 1, 1, 1,
-2.077582, -0.8839121, -1.253819, 1, 1, 1, 1, 1,
-2.074533, 0.4699365, -1.479659, 1, 1, 1, 1, 1,
-2.056381, 0.2398061, -0.6006593, 1, 1, 1, 1, 1,
-2.045274, 0.8714631, -0.4825166, 1, 1, 1, 1, 1,
-2.040208, -0.3521642, -1.268526, 1, 1, 1, 1, 1,
-2.036983, -0.8685859, -2.909961, 0, 0, 1, 1, 1,
-2.0313, -1.11271, -1.441159, 1, 0, 0, 1, 1,
-2.016859, 0.7961041, -0.797101, 1, 0, 0, 1, 1,
-2.012993, 0.2049586, -0.4015528, 1, 0, 0, 1, 1,
-1.984417, 0.2539446, -2.408308, 1, 0, 0, 1, 1,
-1.955069, 0.1030283, -1.806716, 1, 0, 0, 1, 1,
-1.949212, -1.794489, -2.975791, 0, 0, 0, 1, 1,
-1.932231, -2.311402, -3.300898, 0, 0, 0, 1, 1,
-1.92447, -0.2342843, -1.375196, 0, 0, 0, 1, 1,
-1.912861, -0.4575437, -1.367524, 0, 0, 0, 1, 1,
-1.910826, -1.808649, -1.30346, 0, 0, 0, 1, 1,
-1.887567, 1.840028, 1.945819, 0, 0, 0, 1, 1,
-1.858163, -0.7190434, -1.376305, 0, 0, 0, 1, 1,
-1.856953, -0.1451475, -1.276123, 1, 1, 1, 1, 1,
-1.855982, -0.02613117, -1.912184, 1, 1, 1, 1, 1,
-1.843711, -0.137727, -0.7441077, 1, 1, 1, 1, 1,
-1.793013, -0.1819744, -1.98136, 1, 1, 1, 1, 1,
-1.786478, -1.422022, -2.008087, 1, 1, 1, 1, 1,
-1.75535, -0.5552211, -2.059487, 1, 1, 1, 1, 1,
-1.751597, -0.9991892, -2.272513, 1, 1, 1, 1, 1,
-1.73323, 0.2267824, 0.100601, 1, 1, 1, 1, 1,
-1.693215, 0.1435234, -0.8605233, 1, 1, 1, 1, 1,
-1.683904, -0.5625827, -2.088753, 1, 1, 1, 1, 1,
-1.680467, 0.1453251, -1.014264, 1, 1, 1, 1, 1,
-1.669773, 2.145613, 0.1296632, 1, 1, 1, 1, 1,
-1.669261, 1.502465, -3.092315, 1, 1, 1, 1, 1,
-1.66615, 0.401356, -0.3694833, 1, 1, 1, 1, 1,
-1.630171, -0.9377573, -3.328436, 1, 1, 1, 1, 1,
-1.615395, -0.8933935, -2.184112, 0, 0, 1, 1, 1,
-1.614366, -0.4262929, -3.296203, 1, 0, 0, 1, 1,
-1.611249, -1.159219, -2.515714, 1, 0, 0, 1, 1,
-1.604595, -0.1907651, -2.118848, 1, 0, 0, 1, 1,
-1.583387, -1.064011, -1.503114, 1, 0, 0, 1, 1,
-1.569593, -0.8704621, -2.763865, 1, 0, 0, 1, 1,
-1.563356, 1.047796, -0.1665211, 0, 0, 0, 1, 1,
-1.56036, -2.102537, -2.712196, 0, 0, 0, 1, 1,
-1.553215, -0.9709008, -0.9413372, 0, 0, 0, 1, 1,
-1.548765, 0.337528, -0.9644461, 0, 0, 0, 1, 1,
-1.538633, -0.8190678, -2.660468, 0, 0, 0, 1, 1,
-1.523841, -0.6873646, -1.539753, 0, 0, 0, 1, 1,
-1.509327, -0.01989485, -1.075699, 0, 0, 0, 1, 1,
-1.507364, -1.603056, -1.487241, 1, 1, 1, 1, 1,
-1.49567, -0.6759356, -2.030165, 1, 1, 1, 1, 1,
-1.482484, 0.7986733, -0.7240221, 1, 1, 1, 1, 1,
-1.470471, 1.378897, 1.032674, 1, 1, 1, 1, 1,
-1.462966, -0.4429153, -3.386345, 1, 1, 1, 1, 1,
-1.454701, 0.22334, -0.4384389, 1, 1, 1, 1, 1,
-1.449841, -0.424253, -2.810638, 1, 1, 1, 1, 1,
-1.426987, 1.645783, 0.6757337, 1, 1, 1, 1, 1,
-1.410591, -0.2809235, -0.8931681, 1, 1, 1, 1, 1,
-1.405827, 0.1052111, -0.6421657, 1, 1, 1, 1, 1,
-1.404852, 0.2089248, -2.1828, 1, 1, 1, 1, 1,
-1.400891, 0.7024615, -1.252719, 1, 1, 1, 1, 1,
-1.400798, -1.808619, -3.100157, 1, 1, 1, 1, 1,
-1.384079, -0.957041, -2.255613, 1, 1, 1, 1, 1,
-1.383635, 2.63107, 0.2043213, 1, 1, 1, 1, 1,
-1.372342, -1.304618, -3.052791, 0, 0, 1, 1, 1,
-1.365587, -0.4633656, -1.401138, 1, 0, 0, 1, 1,
-1.352469, 0.6156766, -1.968428, 1, 0, 0, 1, 1,
-1.34699, -1.652176, -3.083233, 1, 0, 0, 1, 1,
-1.344285, -1.873393, -3.596746, 1, 0, 0, 1, 1,
-1.3369, 2.618819, -1.483373, 1, 0, 0, 1, 1,
-1.324714, 0.995968, -0.9622095, 0, 0, 0, 1, 1,
-1.323783, -0.8264419, -3.735085, 0, 0, 0, 1, 1,
-1.318755, -1.769604, -1.462622, 0, 0, 0, 1, 1,
-1.31289, 1.069046, -1.541223, 0, 0, 0, 1, 1,
-1.311878, 0.3186998, -1.359893, 0, 0, 0, 1, 1,
-1.295232, 0.5642787, -2.15282, 0, 0, 0, 1, 1,
-1.28728, 0.4627599, -1.598626, 0, 0, 0, 1, 1,
-1.266869, -0.4228119, -1.991531, 1, 1, 1, 1, 1,
-1.260556, 0.4420247, -0.6027358, 1, 1, 1, 1, 1,
-1.258302, 1.229282, -2.098406, 1, 1, 1, 1, 1,
-1.253819, -1.336594, -1.673819, 1, 1, 1, 1, 1,
-1.251907, -1.610488, -2.495785, 1, 1, 1, 1, 1,
-1.249583, 0.3470347, -1.120755, 1, 1, 1, 1, 1,
-1.246303, -0.9465078, -1.681841, 1, 1, 1, 1, 1,
-1.233208, -1.821019, -1.3465, 1, 1, 1, 1, 1,
-1.225698, -0.1457686, -1.923401, 1, 1, 1, 1, 1,
-1.219267, 0.6979968, -1.265863, 1, 1, 1, 1, 1,
-1.215233, 0.9847382, 0.7250488, 1, 1, 1, 1, 1,
-1.210045, 1.580029, -0.8340285, 1, 1, 1, 1, 1,
-1.209734, 1.505591, -0.9356087, 1, 1, 1, 1, 1,
-1.206398, -2.058095, -2.137663, 1, 1, 1, 1, 1,
-1.205188, 1.853998, -0.9617635, 1, 1, 1, 1, 1,
-1.193896, -0.7345842, -1.868071, 0, 0, 1, 1, 1,
-1.189891, -0.08615573, -2.180234, 1, 0, 0, 1, 1,
-1.187115, -2.35167, -0.7125462, 1, 0, 0, 1, 1,
-1.171921, -1.284303, -3.787547, 1, 0, 0, 1, 1,
-1.170723, 1.119739, -1.463999, 1, 0, 0, 1, 1,
-1.15978, 0.1236103, -2.402637, 1, 0, 0, 1, 1,
-1.154977, -1.403758, -2.562243, 0, 0, 0, 1, 1,
-1.151494, -1.061241, -2.494882, 0, 0, 0, 1, 1,
-1.151484, 1.003022, -0.2838156, 0, 0, 0, 1, 1,
-1.138855, -0.5546495, -1.343792, 0, 0, 0, 1, 1,
-1.138041, -1.625436, -1.545348, 0, 0, 0, 1, 1,
-1.131934, -0.6547256, -1.915436, 0, 0, 0, 1, 1,
-1.131547, 0.2604385, -1.794297, 0, 0, 0, 1, 1,
-1.12977, -0.6259572, -1.478752, 1, 1, 1, 1, 1,
-1.119358, -0.1130487, 1.349124, 1, 1, 1, 1, 1,
-1.108164, -1.312174, -2.29776, 1, 1, 1, 1, 1,
-1.10507, -1.099005, -2.588885, 1, 1, 1, 1, 1,
-1.103008, -0.6733668, -2.996791, 1, 1, 1, 1, 1,
-1.101261, 1.768927, -0.329188, 1, 1, 1, 1, 1,
-1.09918, 0.3059349, -1.168632, 1, 1, 1, 1, 1,
-1.096939, 0.2204468, -1.733621, 1, 1, 1, 1, 1,
-1.095488, 0.5234852, -1.317746, 1, 1, 1, 1, 1,
-1.091617, 0.01133846, -1.685652, 1, 1, 1, 1, 1,
-1.084151, 0.576496, -1.23003, 1, 1, 1, 1, 1,
-1.083806, -0.9277889, -3.813242, 1, 1, 1, 1, 1,
-1.082277, -0.7730587, -2.940348, 1, 1, 1, 1, 1,
-1.081232, -1.754872, -3.482035, 1, 1, 1, 1, 1,
-1.080426, 0.4997841, -0.9431503, 1, 1, 1, 1, 1,
-1.075375, 0.3637619, 0.2484286, 0, 0, 1, 1, 1,
-1.074563, 0.2602604, -2.715554, 1, 0, 0, 1, 1,
-1.0662, -0.4678489, -2.248188, 1, 0, 0, 1, 1,
-1.063869, -1.449035, -2.480219, 1, 0, 0, 1, 1,
-1.059373, 1.341191, -0.3302973, 1, 0, 0, 1, 1,
-1.056053, -0.2659786, -1.122832, 1, 0, 0, 1, 1,
-1.054955, 1.222586, -0.6483867, 0, 0, 0, 1, 1,
-1.053105, -0.2677033, -2.105215, 0, 0, 0, 1, 1,
-1.050753, 0.914781, -2.189874, 0, 0, 0, 1, 1,
-1.046242, -1.518916, -2.266914, 0, 0, 0, 1, 1,
-1.04522, -1.196964, -3.592809, 0, 0, 0, 1, 1,
-1.043502, 1.358483, 0.7731686, 0, 0, 0, 1, 1,
-1.042667, 2.025327, -1.085198, 0, 0, 0, 1, 1,
-1.034946, -0.328102, -0.6754708, 1, 1, 1, 1, 1,
-1.034834, -0.1262126, -0.1096585, 1, 1, 1, 1, 1,
-1.024167, -1.090701, -2.826539, 1, 1, 1, 1, 1,
-1.021594, 0.4117464, -1.049841, 1, 1, 1, 1, 1,
-1.012959, -1.747775, -1.701464, 1, 1, 1, 1, 1,
-1.012829, -1.067746, -3.479395, 1, 1, 1, 1, 1,
-1.005595, 2.581178, -1.792461, 1, 1, 1, 1, 1,
-0.9991135, 1.852448, -1.463495, 1, 1, 1, 1, 1,
-0.9987173, -1.595581, -2.900529, 1, 1, 1, 1, 1,
-0.995339, -0.1147863, -2.220775, 1, 1, 1, 1, 1,
-0.9951825, 0.06500851, -0.2036177, 1, 1, 1, 1, 1,
-0.992899, 0.3244669, -1.369125, 1, 1, 1, 1, 1,
-0.9878602, 1.296553, -0.5864112, 1, 1, 1, 1, 1,
-0.9852166, 1.26096, 0.8226622, 1, 1, 1, 1, 1,
-0.9772216, 0.1647389, -2.104331, 1, 1, 1, 1, 1,
-0.9768732, 0.4601123, -1.444188, 0, 0, 1, 1, 1,
-0.9703997, 0.7929848, -1.211529, 1, 0, 0, 1, 1,
-0.9576584, 1.137174, -0.9918482, 1, 0, 0, 1, 1,
-0.9550908, 0.3686146, -1.776284, 1, 0, 0, 1, 1,
-0.9549005, 0.2545851, -2.312017, 1, 0, 0, 1, 1,
-0.9468417, -0.1257823, -2.033684, 1, 0, 0, 1, 1,
-0.9389535, -0.4233703, -0.01773865, 0, 0, 0, 1, 1,
-0.9364564, 1.767654, -1.419732, 0, 0, 0, 1, 1,
-0.9356223, 0.7575085, 0.9309429, 0, 0, 0, 1, 1,
-0.926171, -0.3250727, -1.415408, 0, 0, 0, 1, 1,
-0.9255418, -1.267487, -3.455008, 0, 0, 0, 1, 1,
-0.9028193, -0.4155054, -2.763565, 0, 0, 0, 1, 1,
-0.9022503, 2.106077, 0.5492367, 0, 0, 0, 1, 1,
-0.9017807, -0.8864816, -1.885164, 1, 1, 1, 1, 1,
-0.9005867, 0.07621736, -0.9761778, 1, 1, 1, 1, 1,
-0.9000841, -0.4496669, -2.071706, 1, 1, 1, 1, 1,
-0.8971015, 0.3277222, -1.593846, 1, 1, 1, 1, 1,
-0.8942969, 1.455346, -0.8145556, 1, 1, 1, 1, 1,
-0.892728, -1.600757, -2.505919, 1, 1, 1, 1, 1,
-0.8894711, -0.0837973, -2.436486, 1, 1, 1, 1, 1,
-0.8887424, 0.623789, 1.025735, 1, 1, 1, 1, 1,
-0.8838128, 1.535307, -0.4066664, 1, 1, 1, 1, 1,
-0.8770593, 0.2567323, -0.3722863, 1, 1, 1, 1, 1,
-0.8721409, -1.895763, -1.299951, 1, 1, 1, 1, 1,
-0.8692746, -0.82925, -2.493413, 1, 1, 1, 1, 1,
-0.8677206, 0.490776, -1.338619, 1, 1, 1, 1, 1,
-0.8663529, -0.739784, -2.685332, 1, 1, 1, 1, 1,
-0.8641671, -2.059538, -2.492818, 1, 1, 1, 1, 1,
-0.8639079, 0.5077428, -1.280849, 0, 0, 1, 1, 1,
-0.8607985, -0.8418023, -1.514997, 1, 0, 0, 1, 1,
-0.8585217, -1.629933, -1.843736, 1, 0, 0, 1, 1,
-0.8442049, -0.03838079, -0.09361771, 1, 0, 0, 1, 1,
-0.8413665, 1.450558, 1.155892, 1, 0, 0, 1, 1,
-0.8364128, -0.3388629, -0.7123026, 1, 0, 0, 1, 1,
-0.8241715, -0.5849664, -1.371082, 0, 0, 0, 1, 1,
-0.8228284, 1.513503, 0.09170897, 0, 0, 0, 1, 1,
-0.814138, -1.131498, -3.358509, 0, 0, 0, 1, 1,
-0.8108327, -1.810663, -3.761477, 0, 0, 0, 1, 1,
-0.8090019, -0.6668366, -2.830738, 0, 0, 0, 1, 1,
-0.8089886, 1.787894, -0.1817823, 0, 0, 0, 1, 1,
-0.8026102, -0.1473037, -0.9918302, 0, 0, 0, 1, 1,
-0.7986849, -0.5218987, -1.898976, 1, 1, 1, 1, 1,
-0.7953548, 1.893196, 0.1479252, 1, 1, 1, 1, 1,
-0.7936442, 0.5144899, -1.207727, 1, 1, 1, 1, 1,
-0.7888185, -0.5145941, -2.113293, 1, 1, 1, 1, 1,
-0.7886289, -0.417557, -1.459862, 1, 1, 1, 1, 1,
-0.781724, 0.9167534, -0.8408096, 1, 1, 1, 1, 1,
-0.776348, -1.536908, -2.841543, 1, 1, 1, 1, 1,
-0.775692, 0.4622012, -2.159418, 1, 1, 1, 1, 1,
-0.7756008, 0.2844856, 2.434365, 1, 1, 1, 1, 1,
-0.7742517, -1.607886, -1.81794, 1, 1, 1, 1, 1,
-0.7697792, -1.710236, -2.562945, 1, 1, 1, 1, 1,
-0.7668722, 0.5501647, 0.02973376, 1, 1, 1, 1, 1,
-0.7591705, -0.2957397, -1.609985, 1, 1, 1, 1, 1,
-0.7585446, -0.4015919, -1.237892, 1, 1, 1, 1, 1,
-0.7567459, 0.4792863, -0.5202504, 1, 1, 1, 1, 1,
-0.7479557, -0.2927785, -2.104189, 0, 0, 1, 1, 1,
-0.7474228, 0.9880219, -0.8906903, 1, 0, 0, 1, 1,
-0.7461749, -0.1850473, -0.5403265, 1, 0, 0, 1, 1,
-0.7395756, -0.5289375, -1.776108, 1, 0, 0, 1, 1,
-0.7381248, -0.2131782, -2.909914, 1, 0, 0, 1, 1,
-0.7362719, -0.4166308, -3.346956, 1, 0, 0, 1, 1,
-0.7353761, 0.624485, -3.358035, 0, 0, 0, 1, 1,
-0.7348174, 0.1318517, -2.047393, 0, 0, 0, 1, 1,
-0.7295746, -0.2985052, -1.127171, 0, 0, 0, 1, 1,
-0.7152541, 0.7415062, -1.269431, 0, 0, 0, 1, 1,
-0.7132178, -1.370803, -2.187304, 0, 0, 0, 1, 1,
-0.7097449, 0.7651771, -1.157987, 0, 0, 0, 1, 1,
-0.7074897, 0.5921315, -1.410537, 0, 0, 0, 1, 1,
-0.6998433, 0.04911492, -2.163816, 1, 1, 1, 1, 1,
-0.6990215, 0.9763297, -0.5835399, 1, 1, 1, 1, 1,
-0.6953979, -1.280152, -1.841589, 1, 1, 1, 1, 1,
-0.6934204, 0.02254033, -2.184992, 1, 1, 1, 1, 1,
-0.6926734, -0.6538547, -1.913967, 1, 1, 1, 1, 1,
-0.6906317, 0.1730154, 0.3546676, 1, 1, 1, 1, 1,
-0.6786035, 0.8842978, -0.7867079, 1, 1, 1, 1, 1,
-0.6777946, -0.35566, -2.851904, 1, 1, 1, 1, 1,
-0.6736042, 0.5491688, -0.5853902, 1, 1, 1, 1, 1,
-0.6617126, 0.5006135, 0.04922814, 1, 1, 1, 1, 1,
-0.6614577, -0.04902708, -2.323554, 1, 1, 1, 1, 1,
-0.6586986, 0.4219473, -0.9739581, 1, 1, 1, 1, 1,
-0.6562629, -0.6848767, -1.063715, 1, 1, 1, 1, 1,
-0.653093, 0.3615724, -1.016208, 1, 1, 1, 1, 1,
-0.6517436, -0.5912378, -3.56912, 1, 1, 1, 1, 1,
-0.6505236, -1.178758, -3.103968, 0, 0, 1, 1, 1,
-0.6499507, 0.3663428, -2.038531, 1, 0, 0, 1, 1,
-0.6410879, 1.689906, -1.004099, 1, 0, 0, 1, 1,
-0.6376416, 0.2674974, -1.567216, 1, 0, 0, 1, 1,
-0.6365198, -0.9367372, -2.598943, 1, 0, 0, 1, 1,
-0.6344526, -1.226768, -4.928583, 1, 0, 0, 1, 1,
-0.6342511, -0.5852706, -4.107968, 0, 0, 0, 1, 1,
-0.6336037, 0.8715459, -0.8156423, 0, 0, 0, 1, 1,
-0.6302583, 0.3018762, -4.172676, 0, 0, 0, 1, 1,
-0.6293464, 1.321078, -2.163099, 0, 0, 0, 1, 1,
-0.6266245, -1.488726, -2.901493, 0, 0, 0, 1, 1,
-0.6264583, -0.886167, -4.013007, 0, 0, 0, 1, 1,
-0.6254438, 0.5220945, -0.9019969, 0, 0, 0, 1, 1,
-0.6245591, 1.645733, 0.5905225, 1, 1, 1, 1, 1,
-0.6192849, -0.7794899, -2.986575, 1, 1, 1, 1, 1,
-0.6169149, -1.016431, -2.365024, 1, 1, 1, 1, 1,
-0.6108675, -1.21738, -4.753337, 1, 1, 1, 1, 1,
-0.6102051, -0.5432361, -3.726363, 1, 1, 1, 1, 1,
-0.6044744, 1.389768, -1.557869, 1, 1, 1, 1, 1,
-0.6008576, -0.196414, -2.583076, 1, 1, 1, 1, 1,
-0.5984404, -1.040771, -0.9644755, 1, 1, 1, 1, 1,
-0.5957325, 1.623747, -2.104423, 1, 1, 1, 1, 1,
-0.5929062, -0.571137, -3.227498, 1, 1, 1, 1, 1,
-0.58456, -0.9184549, -2.233662, 1, 1, 1, 1, 1,
-0.574099, -0.5869984, -3.958819, 1, 1, 1, 1, 1,
-0.5736666, -0.3223939, -2.514284, 1, 1, 1, 1, 1,
-0.5727216, 1.237067, -0.4031161, 1, 1, 1, 1, 1,
-0.5704141, -0.9134514, -3.472313, 1, 1, 1, 1, 1,
-0.5666601, 0.4712903, -3.546375, 0, 0, 1, 1, 1,
-0.565389, -1.256838, -3.35107, 1, 0, 0, 1, 1,
-0.5639599, -0.03603739, -3.192198, 1, 0, 0, 1, 1,
-0.5581747, 0.4406236, -0.2817935, 1, 0, 0, 1, 1,
-0.5528937, -0.3632008, -1.763789, 1, 0, 0, 1, 1,
-0.5520388, -1.431528, -1.232492, 1, 0, 0, 1, 1,
-0.5501192, -0.7818961, -2.034577, 0, 0, 0, 1, 1,
-0.5491834, -0.2166618, -2.368197, 0, 0, 0, 1, 1,
-0.5481458, -1.103046, -2.238297, 0, 0, 0, 1, 1,
-0.5472788, 0.9766644, -0.1724427, 0, 0, 0, 1, 1,
-0.541263, -0.8346859, -2.759357, 0, 0, 0, 1, 1,
-0.5380737, -0.6966749, -2.788348, 0, 0, 0, 1, 1,
-0.5263892, -0.4763323, -3.352656, 0, 0, 0, 1, 1,
-0.5257878, 1.137271, -0.8603165, 1, 1, 1, 1, 1,
-0.5254024, 0.9687207, -3.350909, 1, 1, 1, 1, 1,
-0.5243476, -1.054122, -4.989164, 1, 1, 1, 1, 1,
-0.5232618, -0.196599, -1.726026, 1, 1, 1, 1, 1,
-0.5199525, -0.007098333, -1.979477, 1, 1, 1, 1, 1,
-0.5196558, -1.347446, -2.494804, 1, 1, 1, 1, 1,
-0.5164123, 0.9907185, 0.4813792, 1, 1, 1, 1, 1,
-0.5116711, 0.8730944, -0.8296944, 1, 1, 1, 1, 1,
-0.5084631, 1.529937, -0.002886542, 1, 1, 1, 1, 1,
-0.5044658, -0.6548513, -3.872941, 1, 1, 1, 1, 1,
-0.4920179, 0.2020832, -2.218662, 1, 1, 1, 1, 1,
-0.4901999, 0.5916159, -1.562755, 1, 1, 1, 1, 1,
-0.4889117, -0.5156326, -2.243683, 1, 1, 1, 1, 1,
-0.4828775, -0.3784534, -0.6646578, 1, 1, 1, 1, 1,
-0.4816774, -0.9705112, -3.965171, 1, 1, 1, 1, 1,
-0.4810627, -0.6517544, -2.648033, 0, 0, 1, 1, 1,
-0.4807873, -0.5116022, -2.790367, 1, 0, 0, 1, 1,
-0.4804202, 0.8784072, -1.922511, 1, 0, 0, 1, 1,
-0.4799826, -0.4034661, -2.883157, 1, 0, 0, 1, 1,
-0.4752143, -1.862382, -1.688731, 1, 0, 0, 1, 1,
-0.4735715, -0.4605183, -1.467498, 1, 0, 0, 1, 1,
-0.472609, 0.3561544, -2.117067, 0, 0, 0, 1, 1,
-0.4709682, 0.9184009, 1.335995, 0, 0, 0, 1, 1,
-0.4663293, -1.159893, -2.08184, 0, 0, 0, 1, 1,
-0.4607071, 1.282633, 0.108594, 0, 0, 0, 1, 1,
-0.4605931, 0.749793, 0.09032384, 0, 0, 0, 1, 1,
-0.4594531, 0.9734823, -0.4964194, 0, 0, 0, 1, 1,
-0.4573623, -1.755144, -3.277863, 0, 0, 0, 1, 1,
-0.4572259, -1.179122, -3.486655, 1, 1, 1, 1, 1,
-0.4531891, -1.338083, -2.751823, 1, 1, 1, 1, 1,
-0.4513884, 0.5207356, -1.834682, 1, 1, 1, 1, 1,
-0.4481382, -1.11424, -1.873252, 1, 1, 1, 1, 1,
-0.4476602, -0.05357051, -1.768243, 1, 1, 1, 1, 1,
-0.4464099, -0.03649127, -1.118712, 1, 1, 1, 1, 1,
-0.4455515, 0.981412, 1.81275, 1, 1, 1, 1, 1,
-0.4446984, -0.1879427, -2.641057, 1, 1, 1, 1, 1,
-0.4443268, -0.1498889, -2.9386, 1, 1, 1, 1, 1,
-0.440812, -1.943916, -3.809582, 1, 1, 1, 1, 1,
-0.4381797, -0.1871065, -2.284979, 1, 1, 1, 1, 1,
-0.4370425, -1.298643, -3.543746, 1, 1, 1, 1, 1,
-0.4354217, 0.8113562, -0.9276457, 1, 1, 1, 1, 1,
-0.4309275, 0.7598907, -0.414053, 1, 1, 1, 1, 1,
-0.4269664, -0.3906983, -4.160676, 1, 1, 1, 1, 1,
-0.4268826, 0.9835133, -1.635637, 0, 0, 1, 1, 1,
-0.4229642, -1.838693, -3.547661, 1, 0, 0, 1, 1,
-0.4192383, 2.302246, -0.5277773, 1, 0, 0, 1, 1,
-0.4175414, -0.5239428, -1.359218, 1, 0, 0, 1, 1,
-0.4141645, -0.9699836, -2.276303, 1, 0, 0, 1, 1,
-0.4127024, -2.249034, -2.862095, 1, 0, 0, 1, 1,
-0.4084679, 0.4933225, -0.05524099, 0, 0, 0, 1, 1,
-0.4083456, 0.662692, -0.6119571, 0, 0, 0, 1, 1,
-0.4049675, 0.2892553, -1.098613, 0, 0, 0, 1, 1,
-0.4042559, 0.03165483, -2.097782, 0, 0, 0, 1, 1,
-0.398339, -0.4104837, -3.073629, 0, 0, 0, 1, 1,
-0.3976423, 0.4056837, -1.124586, 0, 0, 0, 1, 1,
-0.3950549, 1.853975, 0.4768307, 0, 0, 0, 1, 1,
-0.3891459, -0.1271971, -2.948703, 1, 1, 1, 1, 1,
-0.3882729, -1.961394, -2.029917, 1, 1, 1, 1, 1,
-0.3880077, 1.311405, 1.040866, 1, 1, 1, 1, 1,
-0.3851281, -0.3737632, -3.052485, 1, 1, 1, 1, 1,
-0.3832782, 0.1934945, -2.504151, 1, 1, 1, 1, 1,
-0.3829237, -1.285011, -1.700755, 1, 1, 1, 1, 1,
-0.3789481, -0.3281274, -2.106825, 1, 1, 1, 1, 1,
-0.3740306, 0.9286093, 0.4005983, 1, 1, 1, 1, 1,
-0.3731983, 1.237044, -0.8749788, 1, 1, 1, 1, 1,
-0.3660776, 0.4190881, -1.397235, 1, 1, 1, 1, 1,
-0.3641745, 0.3650121, 1.614317, 1, 1, 1, 1, 1,
-0.3612431, 0.0270473, -0.8776002, 1, 1, 1, 1, 1,
-0.3607837, -2.732035, -0.6140093, 1, 1, 1, 1, 1,
-0.3596666, 0.02207462, -1.122337, 1, 1, 1, 1, 1,
-0.3493133, 0.6843472, 0.1334308, 1, 1, 1, 1, 1,
-0.3438457, 1.524333, -0.5942625, 0, 0, 1, 1, 1,
-0.3434063, -0.8969586, -1.995397, 1, 0, 0, 1, 1,
-0.3424506, -1.183243, -1.427128, 1, 0, 0, 1, 1,
-0.3305921, -0.4619076, -1.229428, 1, 0, 0, 1, 1,
-0.3283166, 0.313248, -0.7594408, 1, 0, 0, 1, 1,
-0.3282292, 1.105656, -0.1701783, 1, 0, 0, 1, 1,
-0.3259021, 0.3382534, -0.8880419, 0, 0, 0, 1, 1,
-0.3237529, 1.542908, -2.730045, 0, 0, 0, 1, 1,
-0.3228182, 0.3636191, 1.432039, 0, 0, 0, 1, 1,
-0.3215962, 0.1886289, -0.671728, 0, 0, 0, 1, 1,
-0.3208561, -1.70071, -3.077987, 0, 0, 0, 1, 1,
-0.3181484, 0.052656, -1.922677, 0, 0, 0, 1, 1,
-0.3172317, -0.560143, -1.494619, 0, 0, 0, 1, 1,
-0.3148846, 0.3904861, -0.1904756, 1, 1, 1, 1, 1,
-0.3130312, -1.32964, -2.794981, 1, 1, 1, 1, 1,
-0.3119545, 0.5304309, -0.1097689, 1, 1, 1, 1, 1,
-0.3111943, 1.18546, -0.1168103, 1, 1, 1, 1, 1,
-0.3076097, -0.1285339, -1.936503, 1, 1, 1, 1, 1,
-0.3051681, -0.3236748, -1.274638, 1, 1, 1, 1, 1,
-0.304358, 1.185355, 0.6734641, 1, 1, 1, 1, 1,
-0.3029183, -1.239439, -2.886871, 1, 1, 1, 1, 1,
-0.3014688, -1.698135, -2.704829, 1, 1, 1, 1, 1,
-0.3000537, -0.06592622, 0.3317442, 1, 1, 1, 1, 1,
-0.2999789, 1.990109, -1.945536, 1, 1, 1, 1, 1,
-0.2917396, 1.427951, -0.2952856, 1, 1, 1, 1, 1,
-0.2894427, -1.185585, -2.307606, 1, 1, 1, 1, 1,
-0.2845363, -0.123293, -3.090207, 1, 1, 1, 1, 1,
-0.2839904, 0.599953, -1.033279, 1, 1, 1, 1, 1,
-0.2823541, 0.8259301, -0.2033393, 0, 0, 1, 1, 1,
-0.2766163, 0.4895705, 0.5898275, 1, 0, 0, 1, 1,
-0.2741718, -0.8386565, -5.384067, 1, 0, 0, 1, 1,
-0.270017, -1.306405, -4.291932, 1, 0, 0, 1, 1,
-0.2688489, 0.1692828, 0.1360513, 1, 0, 0, 1, 1,
-0.265857, -0.9160672, -3.926858, 1, 0, 0, 1, 1,
-0.2654441, 0.1236163, 0.5425477, 0, 0, 0, 1, 1,
-0.2648637, -0.9097657, -3.828897, 0, 0, 0, 1, 1,
-0.2626524, -0.3380455, -2.660292, 0, 0, 0, 1, 1,
-0.2617787, -0.254874, -5.311755, 0, 0, 0, 1, 1,
-0.260012, -1.598073, -4.466072, 0, 0, 0, 1, 1,
-0.2530264, 2.521643, 0.7866963, 0, 0, 0, 1, 1,
-0.252022, -0.09419252, -2.289826, 0, 0, 0, 1, 1,
-0.2520091, -0.5068812, -3.086255, 1, 1, 1, 1, 1,
-0.2402015, 0.2785244, -1.292658, 1, 1, 1, 1, 1,
-0.2383891, -0.8430595, -1.29519, 1, 1, 1, 1, 1,
-0.2308657, -0.9125069, -3.080314, 1, 1, 1, 1, 1,
-0.2300699, -0.6001229, -2.996944, 1, 1, 1, 1, 1,
-0.2269477, 0.2808391, -1.579398, 1, 1, 1, 1, 1,
-0.2233598, 0.3685718, -0.07417496, 1, 1, 1, 1, 1,
-0.220879, -0.4034117, -3.247074, 1, 1, 1, 1, 1,
-0.219855, 0.5652842, -0.6089675, 1, 1, 1, 1, 1,
-0.2132853, -0.6408461, -2.647226, 1, 1, 1, 1, 1,
-0.2119375, 0.07781646, -1.354232, 1, 1, 1, 1, 1,
-0.210979, 1.72006, 0.7928343, 1, 1, 1, 1, 1,
-0.2094805, -1.046624, -2.622307, 1, 1, 1, 1, 1,
-0.2058176, -0.912801, -2.539504, 1, 1, 1, 1, 1,
-0.2051532, 0.9908406, -1.041435, 1, 1, 1, 1, 1,
-0.2038773, 1.444782, -1.71973, 0, 0, 1, 1, 1,
-0.2024346, -1.417846, -0.8908231, 1, 0, 0, 1, 1,
-0.2019692, -0.3563359, -3.387789, 1, 0, 0, 1, 1,
-0.2011787, -0.3068112, -0.7498561, 1, 0, 0, 1, 1,
-0.2000003, 0.175895, -0.4177965, 1, 0, 0, 1, 1,
-0.1999132, -0.006942211, -0.9618521, 1, 0, 0, 1, 1,
-0.1932426, 1.352219, 0.85008, 0, 0, 0, 1, 1,
-0.1892643, -0.2524048, -2.523949, 0, 0, 0, 1, 1,
-0.1767815, -0.6731412, -2.235187, 0, 0, 0, 1, 1,
-0.1702326, 1.828377, 0.6240819, 0, 0, 0, 1, 1,
-0.1557874, 0.5819092, -0.5405524, 0, 0, 0, 1, 1,
-0.154904, 0.7727734, -1.816836, 0, 0, 0, 1, 1,
-0.1543918, 2.932746, -0.9900938, 0, 0, 0, 1, 1,
-0.1531593, -1.049938, -2.210777, 1, 1, 1, 1, 1,
-0.150972, -0.6748161, -2.909291, 1, 1, 1, 1, 1,
-0.1475725, 1.099163, -0.2217892, 1, 1, 1, 1, 1,
-0.1447123, 1.414719, 0.2747808, 1, 1, 1, 1, 1,
-0.1408152, 0.136752, 0.1567929, 1, 1, 1, 1, 1,
-0.140698, -0.4965622, -4.524425, 1, 1, 1, 1, 1,
-0.1395365, 1.243904, 0.1331772, 1, 1, 1, 1, 1,
-0.1353698, 0.8797206, -0.09595901, 1, 1, 1, 1, 1,
-0.1348617, 1.207416, -0.02256823, 1, 1, 1, 1, 1,
-0.1342573, 0.5657124, -1.004726, 1, 1, 1, 1, 1,
-0.1339324, -0.2414851, -2.211462, 1, 1, 1, 1, 1,
-0.1328965, 0.727128, -1.020904, 1, 1, 1, 1, 1,
-0.1274287, -0.5369856, -1.622555, 1, 1, 1, 1, 1,
-0.1271233, -0.7789668, -3.08359, 1, 1, 1, 1, 1,
-0.1261068, -0.1741186, -2.428251, 1, 1, 1, 1, 1,
-0.1254137, -0.875532, -1.876206, 0, 0, 1, 1, 1,
-0.1250057, -0.7305244, -2.896254, 1, 0, 0, 1, 1,
-0.1223359, -1.033412, -2.250429, 1, 0, 0, 1, 1,
-0.1217373, 0.4945028, 1.247864, 1, 0, 0, 1, 1,
-0.121328, -1.173101, -2.213617, 1, 0, 0, 1, 1,
-0.116305, -0.3482936, -2.966322, 1, 0, 0, 1, 1,
-0.1153028, 2.393999, -1.209651, 0, 0, 0, 1, 1,
-0.1100381, -0.857957, -1.197624, 0, 0, 0, 1, 1,
-0.1077081, -0.8402504, -1.760273, 0, 0, 0, 1, 1,
-0.1070674, -0.1953574, -2.175936, 0, 0, 0, 1, 1,
-0.1050149, 0.09249685, 0.412734, 0, 0, 0, 1, 1,
-0.1032167, 2.192433, 1.138296, 0, 0, 0, 1, 1,
-0.1022851, 0.6191458, 1.117498, 0, 0, 0, 1, 1,
-0.1017865, -1.369765, -3.1533, 1, 1, 1, 1, 1,
-0.09888114, 0.1861449, -0.1644262, 1, 1, 1, 1, 1,
-0.0982741, -1.114839, -3.036164, 1, 1, 1, 1, 1,
-0.09704982, -0.3638446, -1.590349, 1, 1, 1, 1, 1,
-0.09677473, 0.3573168, 0.7625822, 1, 1, 1, 1, 1,
-0.08977284, -1.454421, -2.725122, 1, 1, 1, 1, 1,
-0.08359318, 0.3034806, -0.2585664, 1, 1, 1, 1, 1,
-0.07394443, -0.01977129, -3.283514, 1, 1, 1, 1, 1,
-0.06840963, 0.8598585, 0.8135653, 1, 1, 1, 1, 1,
-0.06152407, 0.5627659, -0.9650941, 1, 1, 1, 1, 1,
-0.05702569, 0.6723099, -1.511114, 1, 1, 1, 1, 1,
-0.0564191, 0.3019292, -1.557554, 1, 1, 1, 1, 1,
-0.05367119, 0.7702086, 1.748334, 1, 1, 1, 1, 1,
-0.0529444, 1.297805, 0.5497833, 1, 1, 1, 1, 1,
-0.05212366, -0.4120959, -3.590232, 1, 1, 1, 1, 1,
-0.04837629, 1.42274, 0.8225647, 0, 0, 1, 1, 1,
-0.04535928, -0.6225936, -3.293242, 1, 0, 0, 1, 1,
-0.04126541, 0.4779236, -0.6083089, 1, 0, 0, 1, 1,
-0.03893177, 0.08005793, 0.3962978, 1, 0, 0, 1, 1,
-0.03782069, -0.6429591, -3.416733, 1, 0, 0, 1, 1,
-0.03290532, -0.09523179, -2.275291, 1, 0, 0, 1, 1,
-0.0298979, -0.1769903, -2.014426, 0, 0, 0, 1, 1,
-0.02057902, -0.1731486, -1.548566, 0, 0, 0, 1, 1,
-0.01718504, 0.3216023, 0.1232557, 0, 0, 0, 1, 1,
-0.01314371, 0.7327446, 0.6633266, 0, 0, 0, 1, 1,
-0.01311592, 1.113116, -0.5980781, 0, 0, 0, 1, 1,
-0.01285462, -1.895098, -2.969744, 0, 0, 0, 1, 1,
-0.01024026, 1.599798, -1.103945, 0, 0, 0, 1, 1,
-0.009713919, -0.1925509, -1.294563, 1, 1, 1, 1, 1,
-0.006468864, 0.4236324, -0.9687175, 1, 1, 1, 1, 1,
-0.004437713, 1.144463, 0.6162115, 1, 1, 1, 1, 1,
0.00901878, 0.7006729, -1.314986, 1, 1, 1, 1, 1,
0.009523902, 1.697919, 0.295718, 1, 1, 1, 1, 1,
0.01018739, -1.142106, 4.389409, 1, 1, 1, 1, 1,
0.01283901, -1.919233, 2.380594, 1, 1, 1, 1, 1,
0.01691822, 0.4042363, 0.7435808, 1, 1, 1, 1, 1,
0.01921182, -0.7982324, 4.549397, 1, 1, 1, 1, 1,
0.02145123, -0.1845652, 3.256162, 1, 1, 1, 1, 1,
0.02248389, 0.2033761, -1.946745, 1, 1, 1, 1, 1,
0.02276961, -0.6704181, 3.132875, 1, 1, 1, 1, 1,
0.02322243, 0.5981382, 0.2954915, 1, 1, 1, 1, 1,
0.02517598, 1.076213, -0.1961791, 1, 1, 1, 1, 1,
0.02629166, -1.180626, 2.834747, 1, 1, 1, 1, 1,
0.02713143, 0.558491, 0.4453881, 0, 0, 1, 1, 1,
0.02822498, 2.032077, 0.9303551, 1, 0, 0, 1, 1,
0.02882175, 0.9455013, -0.1434941, 1, 0, 0, 1, 1,
0.02971627, -0.09364092, 1.16952, 1, 0, 0, 1, 1,
0.03793004, 1.653031, -0.4948236, 1, 0, 0, 1, 1,
0.03894499, -0.2371942, 2.717313, 1, 0, 0, 1, 1,
0.04231688, -2.162509, 5.830253, 0, 0, 0, 1, 1,
0.04304407, -0.3851716, 2.194166, 0, 0, 0, 1, 1,
0.04516356, -1.144446, 3.569935, 0, 0, 0, 1, 1,
0.04896435, 0.02956114, -0.03628675, 0, 0, 0, 1, 1,
0.05372955, 1.062753, 0.2740095, 0, 0, 0, 1, 1,
0.05748757, 2.256495, -0.8442025, 0, 0, 0, 1, 1,
0.06051243, 0.0646602, -0.3472887, 0, 0, 0, 1, 1,
0.06176816, 0.9527754, 0.6396788, 1, 1, 1, 1, 1,
0.06286492, 0.7322114, 0.4718252, 1, 1, 1, 1, 1,
0.06752916, 0.5081623, 0.6121554, 1, 1, 1, 1, 1,
0.0680491, 0.7927765, 2.474031, 1, 1, 1, 1, 1,
0.07009561, -0.7742584, 5.096357, 1, 1, 1, 1, 1,
0.07322869, -1.090306, 2.37723, 1, 1, 1, 1, 1,
0.07502788, -1.088482, 1.596424, 1, 1, 1, 1, 1,
0.07740427, 1.509721, -1.360386, 1, 1, 1, 1, 1,
0.07786454, -0.7999108, 5.060121, 1, 1, 1, 1, 1,
0.07792407, -0.3723229, 2.347591, 1, 1, 1, 1, 1,
0.08301929, 1.98703, -0.4735313, 1, 1, 1, 1, 1,
0.08811688, 0.440708, 1.496035, 1, 1, 1, 1, 1,
0.08841136, 0.1849234, -0.7174436, 1, 1, 1, 1, 1,
0.08892611, -0.2366467, 3.006672, 1, 1, 1, 1, 1,
0.08907244, -0.005705274, 1.710049, 1, 1, 1, 1, 1,
0.08973835, 1.065278, 0.2702889, 0, 0, 1, 1, 1,
0.09052518, 0.2674233, 1.524974, 1, 0, 0, 1, 1,
0.09065644, 1.041946, 2.210782, 1, 0, 0, 1, 1,
0.09263039, -0.5931222, 0.7906002, 1, 0, 0, 1, 1,
0.09765559, 0.2085251, 0.6632143, 1, 0, 0, 1, 1,
0.1006664, 0.1332088, 0.8072057, 1, 0, 0, 1, 1,
0.1015773, -0.1070893, 2.284841, 0, 0, 0, 1, 1,
0.1020671, -1.815992, 3.41588, 0, 0, 0, 1, 1,
0.1064156, -0.3558752, 2.706274, 0, 0, 0, 1, 1,
0.1180522, 2.778713, -0.2574452, 0, 0, 0, 1, 1,
0.1187888, -0.7852783, 2.911182, 0, 0, 0, 1, 1,
0.12101, 0.1025773, 1.481528, 0, 0, 0, 1, 1,
0.1217195, -0.4160866, 4.78056, 0, 0, 0, 1, 1,
0.1293764, -0.4925917, 4.301245, 1, 1, 1, 1, 1,
0.1326948, -1.854953, 3.890318, 1, 1, 1, 1, 1,
0.1332228, -0.9481423, 3.515122, 1, 1, 1, 1, 1,
0.1343109, -0.541438, 4.555915, 1, 1, 1, 1, 1,
0.1356045, 0.09915789, 1.131515, 1, 1, 1, 1, 1,
0.1379694, 2.223812, -0.3104464, 1, 1, 1, 1, 1,
0.1409443, -0.8934047, 3.527689, 1, 1, 1, 1, 1,
0.1450864, -0.7726725, 3.147407, 1, 1, 1, 1, 1,
0.148696, -0.2036171, 2.423654, 1, 1, 1, 1, 1,
0.1494994, -0.2556417, 2.316668, 1, 1, 1, 1, 1,
0.1515855, 0.4611625, 0.5258619, 1, 1, 1, 1, 1,
0.1565849, -0.480429, 3.092911, 1, 1, 1, 1, 1,
0.1622302, 0.210843, -0.5968642, 1, 1, 1, 1, 1,
0.172534, 1.064857, -0.4346718, 1, 1, 1, 1, 1,
0.1731666, -0.5967732, 0.8785144, 1, 1, 1, 1, 1,
0.179359, -0.5135127, 1.219025, 0, 0, 1, 1, 1,
0.1815361, -0.6853124, 2.135762, 1, 0, 0, 1, 1,
0.1816918, -1.650926, 1.95336, 1, 0, 0, 1, 1,
0.1817851, 0.7802007, 1.039447, 1, 0, 0, 1, 1,
0.1851427, -2.801779, 3.264453, 1, 0, 0, 1, 1,
0.1863856, -1.133044, 2.406644, 1, 0, 0, 1, 1,
0.1883713, -2.059266, 3.957691, 0, 0, 0, 1, 1,
0.1887361, -0.9245971, 1.551861, 0, 0, 0, 1, 1,
0.1904029, -0.6008734, 2.350236, 0, 0, 0, 1, 1,
0.2010126, 0.006427712, 2.168054, 0, 0, 0, 1, 1,
0.2023921, -0.968814, 3.719748, 0, 0, 0, 1, 1,
0.203563, -0.1209545, 2.471779, 0, 0, 0, 1, 1,
0.2040435, 0.06717666, 1.733131, 0, 0, 0, 1, 1,
0.2067744, -0.6913709, 2.226884, 1, 1, 1, 1, 1,
0.2091109, -2.203163, 2.300519, 1, 1, 1, 1, 1,
0.2140583, 0.6504079, 0.5631754, 1, 1, 1, 1, 1,
0.2144446, 1.627589, 0.1643338, 1, 1, 1, 1, 1,
0.2150963, 1.487358, -0.9707081, 1, 1, 1, 1, 1,
0.2163179, 0.3711157, -0.185401, 1, 1, 1, 1, 1,
0.2168462, 0.1690324, 0.4452722, 1, 1, 1, 1, 1,
0.2304089, 0.1644907, 0.7847655, 1, 1, 1, 1, 1,
0.2328302, 0.2669244, -0.2529142, 1, 1, 1, 1, 1,
0.2357217, 0.6410899, 2.286066, 1, 1, 1, 1, 1,
0.2364598, -0.08144115, 2.03951, 1, 1, 1, 1, 1,
0.2386188, 0.09402139, 2.941425, 1, 1, 1, 1, 1,
0.2398428, 0.6668085, 1.669495, 1, 1, 1, 1, 1,
0.2446028, 0.4316915, 1.180542, 1, 1, 1, 1, 1,
0.2447562, -0.4299336, 2.262287, 1, 1, 1, 1, 1,
0.245297, 0.2252384, 0.4805934, 0, 0, 1, 1, 1,
0.2454346, -0.3910879, 2.782903, 1, 0, 0, 1, 1,
0.2457105, -0.4573601, 1.3355, 1, 0, 0, 1, 1,
0.2502949, -1.207357, 1.09104, 1, 0, 0, 1, 1,
0.2581511, 0.1484898, -0.5361872, 1, 0, 0, 1, 1,
0.2643429, 1.233509, 2.512625, 1, 0, 0, 1, 1,
0.2654873, 2.433708, -0.9420478, 0, 0, 0, 1, 1,
0.267823, 0.3641412, -0.6973506, 0, 0, 0, 1, 1,
0.2716001, 0.544493, 0.07976529, 0, 0, 0, 1, 1,
0.2720821, 0.7058504, -0.07225429, 0, 0, 0, 1, 1,
0.2731569, 0.7502044, 1.45974, 0, 0, 0, 1, 1,
0.2739605, 2.193627, 0.3519569, 0, 0, 0, 1, 1,
0.2761962, -1.705848, 2.375962, 0, 0, 0, 1, 1,
0.2766939, -0.2599362, 2.54267, 1, 1, 1, 1, 1,
0.2805491, 2.081151, 2.132449, 1, 1, 1, 1, 1,
0.281186, -0.6832459, 2.96078, 1, 1, 1, 1, 1,
0.2822645, -1.324377, 3.264454, 1, 1, 1, 1, 1,
0.2860799, -0.6610598, 2.155137, 1, 1, 1, 1, 1,
0.2865499, 0.8738719, 0.8250613, 1, 1, 1, 1, 1,
0.294676, 1.805407, 0.2439156, 1, 1, 1, 1, 1,
0.2985972, 0.5752571, 1.561504, 1, 1, 1, 1, 1,
0.298658, 1.429428, -0.979689, 1, 1, 1, 1, 1,
0.3033693, -1.355935, 3.065984, 1, 1, 1, 1, 1,
0.3058344, 0.1906292, 0.6662652, 1, 1, 1, 1, 1,
0.3101622, -0.2812517, 1.019819, 1, 1, 1, 1, 1,
0.3132089, 0.06446717, 1.253047, 1, 1, 1, 1, 1,
0.3188853, -1.440054, 2.187522, 1, 1, 1, 1, 1,
0.3190289, 1.257452, 2.204376, 1, 1, 1, 1, 1,
0.3199268, -0.5331301, 2.213599, 0, 0, 1, 1, 1,
0.3206983, -1.630151, 4.445532, 1, 0, 0, 1, 1,
0.3214436, -0.5968974, 2.744133, 1, 0, 0, 1, 1,
0.3228022, 0.9806733, 0.6364641, 1, 0, 0, 1, 1,
0.3321466, -0.6854727, 3.090955, 1, 0, 0, 1, 1,
0.3347945, 0.8279269, 0.0720577, 1, 0, 0, 1, 1,
0.345515, -0.06323188, 4.093508, 0, 0, 0, 1, 1,
0.3478591, 0.9948332, -0.4705639, 0, 0, 0, 1, 1,
0.3500907, 0.1379518, 1.08103, 0, 0, 0, 1, 1,
0.353696, -0.6907048, 3.908873, 0, 0, 0, 1, 1,
0.3541744, 0.2042679, 0.1368951, 0, 0, 0, 1, 1,
0.3583428, -1.478874, 2.353961, 0, 0, 0, 1, 1,
0.3586179, -2.566809, 3.122094, 0, 0, 0, 1, 1,
0.3594794, -0.05754276, 1.798332, 1, 1, 1, 1, 1,
0.3614497, -0.7277272, 3.486331, 1, 1, 1, 1, 1,
0.3648966, -0.02755006, 1.545361, 1, 1, 1, 1, 1,
0.3716792, 0.9340207, -0.06727877, 1, 1, 1, 1, 1,
0.37517, -0.742459, 2.300313, 1, 1, 1, 1, 1,
0.3765958, 0.4611259, 2.076276, 1, 1, 1, 1, 1,
0.3767968, 0.9623036, 1.406199, 1, 1, 1, 1, 1,
0.3789462, 1.823557, -0.7350943, 1, 1, 1, 1, 1,
0.3806558, 0.9365197, 0.5736193, 1, 1, 1, 1, 1,
0.3813036, -0.7633433, 1.300125, 1, 1, 1, 1, 1,
0.3816601, 0.7198337, 0.7437767, 1, 1, 1, 1, 1,
0.3827169, -0.4053782, 2.317819, 1, 1, 1, 1, 1,
0.3835544, 0.6209875, -0.03929546, 1, 1, 1, 1, 1,
0.3847116, 0.5195133, 0.177182, 1, 1, 1, 1, 1,
0.3862695, -0.7306014, 3.454642, 1, 1, 1, 1, 1,
0.3863241, 0.1937953, 0.7607387, 0, 0, 1, 1, 1,
0.38909, 1.121996, -0.7554606, 1, 0, 0, 1, 1,
0.3909588, -0.5478719, 1.672461, 1, 0, 0, 1, 1,
0.3919491, -0.3111203, 3.958212, 1, 0, 0, 1, 1,
0.3919948, -0.5898464, 3.119131, 1, 0, 0, 1, 1,
0.3956381, -0.2351048, 1.988461, 1, 0, 0, 1, 1,
0.4007829, 0.8041281, -0.6221392, 0, 0, 0, 1, 1,
0.4051912, -1.701998, 2.209594, 0, 0, 0, 1, 1,
0.4072275, 1.535796, 0.3942978, 0, 0, 0, 1, 1,
0.4089227, -0.7674763, 1.263545, 0, 0, 0, 1, 1,
0.4116282, 2.17232, -1.791399, 0, 0, 0, 1, 1,
0.4177938, 1.302606, 0.6354166, 0, 0, 0, 1, 1,
0.418746, 1.485206, 0.06291999, 0, 0, 0, 1, 1,
0.4200427, 0.724728, 0.345631, 1, 1, 1, 1, 1,
0.4219208, -0.2526217, 0.5354609, 1, 1, 1, 1, 1,
0.4245493, -0.08023188, 1.464858, 1, 1, 1, 1, 1,
0.4246669, -0.4263827, 1.264811, 1, 1, 1, 1, 1,
0.4332468, 0.6630853, 0.09944791, 1, 1, 1, 1, 1,
0.4345471, 1.732096, 0.1160966, 1, 1, 1, 1, 1,
0.4351636, 0.5492737, -0.1989328, 1, 1, 1, 1, 1,
0.4364529, -0.8283005, 2.683493, 1, 1, 1, 1, 1,
0.4379582, 2.019629, -1.563625, 1, 1, 1, 1, 1,
0.4402627, -0.2854502, 1.985373, 1, 1, 1, 1, 1,
0.4469691, 0.06602786, 1.381593, 1, 1, 1, 1, 1,
0.4484279, -1.068637, 0.9954144, 1, 1, 1, 1, 1,
0.4492866, -0.6567408, 0.4334719, 1, 1, 1, 1, 1,
0.4519315, 0.7753525, -0.08610827, 1, 1, 1, 1, 1,
0.4568397, -1.026685, 3.426138, 1, 1, 1, 1, 1,
0.460862, -0.3784716, 2.8505, 0, 0, 1, 1, 1,
0.4616051, 0.2479478, 2.375028, 1, 0, 0, 1, 1,
0.4630608, 0.08580773, 1.386481, 1, 0, 0, 1, 1,
0.4651936, 0.2741923, 1.121696, 1, 0, 0, 1, 1,
0.4697925, 0.4514716, 0.2153352, 1, 0, 0, 1, 1,
0.4756929, -0.1187847, 1.866265, 1, 0, 0, 1, 1,
0.480455, -0.294565, 1.721583, 0, 0, 0, 1, 1,
0.4807802, -1.816153, 3.066884, 0, 0, 0, 1, 1,
0.4832703, 0.5120129, -1.314354, 0, 0, 0, 1, 1,
0.4839123, 0.2643881, 0.5601878, 0, 0, 0, 1, 1,
0.4849585, -1.731234, 1.980562, 0, 0, 0, 1, 1,
0.4855811, 0.5317962, -0.202358, 0, 0, 0, 1, 1,
0.4868841, 0.499043, 0.8917997, 0, 0, 0, 1, 1,
0.4874446, -0.0501411, 1.086734, 1, 1, 1, 1, 1,
0.4888146, -0.6946176, 2.63028, 1, 1, 1, 1, 1,
0.4943091, 0.4933397, 0.2560112, 1, 1, 1, 1, 1,
0.4966229, -0.8527699, 4.06567, 1, 1, 1, 1, 1,
0.4997787, 0.9522233, 0.5795631, 1, 1, 1, 1, 1,
0.503985, 0.4188222, 1.374145, 1, 1, 1, 1, 1,
0.5066294, -1.212134, 4.631589, 1, 1, 1, 1, 1,
0.5072572, 0.2859125, 0.4915326, 1, 1, 1, 1, 1,
0.5139706, 1.930896, -0.4018537, 1, 1, 1, 1, 1,
0.5144089, -0.6759912, 1.546691, 1, 1, 1, 1, 1,
0.5247411, -0.08354369, 2.198807, 1, 1, 1, 1, 1,
0.5273669, -0.5576327, 1.273238, 1, 1, 1, 1, 1,
0.5301734, 0.7771525, 1.349525, 1, 1, 1, 1, 1,
0.5325635, 1.816811, -0.8260229, 1, 1, 1, 1, 1,
0.5341491, -1.482182, 3.985481, 1, 1, 1, 1, 1,
0.5434936, -1.828955, 4.757212, 0, 0, 1, 1, 1,
0.5440283, -0.421353, 2.109601, 1, 0, 0, 1, 1,
0.5462064, 0.006784115, 1.83429, 1, 0, 0, 1, 1,
0.5486757, -0.6398177, 1.535436, 1, 0, 0, 1, 1,
0.5487387, -2.163012, 3.715612, 1, 0, 0, 1, 1,
0.5502111, -1.099603, 0.966616, 1, 0, 0, 1, 1,
0.5538434, -0.7187295, 0.7376558, 0, 0, 0, 1, 1,
0.5586725, -0.7180607, 4.167738, 0, 0, 0, 1, 1,
0.5591064, -1.718196, 2.627842, 0, 0, 0, 1, 1,
0.5591459, 1.179654, 0.1526967, 0, 0, 0, 1, 1,
0.5642859, 0.9828769, 3.198951, 0, 0, 0, 1, 1,
0.5686258, 1.377434, 0.2912172, 0, 0, 0, 1, 1,
0.5707827, -1.214078, 3.158149, 0, 0, 0, 1, 1,
0.5718257, 1.06811, 1.611984, 1, 1, 1, 1, 1,
0.5744791, -0.5951892, 4.007047, 1, 1, 1, 1, 1,
0.5757322, -1.300214, 2.01515, 1, 1, 1, 1, 1,
0.5761321, -0.8558424, 1.671955, 1, 1, 1, 1, 1,
0.5784683, 0.002694909, 1.935096, 1, 1, 1, 1, 1,
0.5862651, 0.1327658, 2.039395, 1, 1, 1, 1, 1,
0.5914519, 0.4747448, 1.196549, 1, 1, 1, 1, 1,
0.5931606, 0.7973424, -0.3145084, 1, 1, 1, 1, 1,
0.5995343, -0.4727877, 2.526633, 1, 1, 1, 1, 1,
0.6080947, 0.7161381, -0.3547538, 1, 1, 1, 1, 1,
0.6091571, -0.02072001, 1.862499, 1, 1, 1, 1, 1,
0.6104272, 0.2270402, -0.5910609, 1, 1, 1, 1, 1,
0.6155188, 0.2151589, 0.6691843, 1, 1, 1, 1, 1,
0.616993, -0.8922135, 1.098457, 1, 1, 1, 1, 1,
0.6176735, -1.037053, 1.18118, 1, 1, 1, 1, 1,
0.6233956, -0.2290026, 2.430161, 0, 0, 1, 1, 1,
0.6277449, -0.7339731, 2.616433, 1, 0, 0, 1, 1,
0.6297141, 1.178385, 1.419275, 1, 0, 0, 1, 1,
0.6312226, -0.7895673, 3.139445, 1, 0, 0, 1, 1,
0.6330624, 1.277269, 1.422663, 1, 0, 0, 1, 1,
0.6346707, -0.8507109, 3.439291, 1, 0, 0, 1, 1,
0.6394323, -1.436645, 3.899105, 0, 0, 0, 1, 1,
0.6418346, 0.4331182, 0.6512125, 0, 0, 0, 1, 1,
0.6444595, -0.5507566, 3.203198, 0, 0, 0, 1, 1,
0.6462348, -1.23773, 3.529168, 0, 0, 0, 1, 1,
0.6480802, 0.1810787, 1.48525, 0, 0, 0, 1, 1,
0.6511193, -1.703964, 2.288429, 0, 0, 0, 1, 1,
0.6516378, -0.05649035, 0.8708397, 0, 0, 0, 1, 1,
0.6518195, -0.4711552, 1.256175, 1, 1, 1, 1, 1,
0.6543744, 0.6212563, -0.04323395, 1, 1, 1, 1, 1,
0.654557, -0.4909876, 2.081188, 1, 1, 1, 1, 1,
0.6567277, 0.2289591, 1.144018, 1, 1, 1, 1, 1,
0.6576162, 0.448014, 3.985055, 1, 1, 1, 1, 1,
0.6591663, -0.7096865, 1.492301, 1, 1, 1, 1, 1,
0.6601585, -0.1249535, 0.5033568, 1, 1, 1, 1, 1,
0.668272, 0.5855495, 2.175126, 1, 1, 1, 1, 1,
0.6719806, -0.9178895, 3.04604, 1, 1, 1, 1, 1,
0.6764147, 0.4141636, 0.9041821, 1, 1, 1, 1, 1,
0.6767074, 0.8862115, -1.681265, 1, 1, 1, 1, 1,
0.680638, -0.2133186, 2.433814, 1, 1, 1, 1, 1,
0.6830512, 0.1815961, 1.916295, 1, 1, 1, 1, 1,
0.688852, 0.4990252, 1.940076, 1, 1, 1, 1, 1,
0.6962416, -1.83078, 2.588559, 1, 1, 1, 1, 1,
0.6963168, 0.06213161, 0.9200034, 0, 0, 1, 1, 1,
0.6969766, 0.08347585, 1.367112, 1, 0, 0, 1, 1,
0.6989883, -1.506202, 4.298635, 1, 0, 0, 1, 1,
0.7027478, -2.138681, 1.777219, 1, 0, 0, 1, 1,
0.7064671, 1.17391, -0.5247849, 1, 0, 0, 1, 1,
0.7083182, -1.582934, 2.876169, 1, 0, 0, 1, 1,
0.7137182, 0.914112, -0.681938, 0, 0, 0, 1, 1,
0.7160441, -0.9231892, 2.010316, 0, 0, 0, 1, 1,
0.7160507, -0.2789406, 1.214036, 0, 0, 0, 1, 1,
0.7190961, 1.545765, -0.8766379, 0, 0, 0, 1, 1,
0.7202771, 1.082311, 0.139451, 0, 0, 0, 1, 1,
0.7225859, 0.1161091, 1.356904, 0, 0, 0, 1, 1,
0.7231336, -1.936702, 1.384676, 0, 0, 0, 1, 1,
0.7250126, 1.251801, 1.697766, 1, 1, 1, 1, 1,
0.7317332, 2.179609, 1.137995, 1, 1, 1, 1, 1,
0.7400149, -1.456183, 1.851055, 1, 1, 1, 1, 1,
0.7404031, -1.466573, 1.501249, 1, 1, 1, 1, 1,
0.742874, -0.2388225, 2.456784, 1, 1, 1, 1, 1,
0.7441259, 0.2912094, 1.186254, 1, 1, 1, 1, 1,
0.7441783, -0.5783808, 2.230133, 1, 1, 1, 1, 1,
0.748377, 2.47893, 1.437891, 1, 1, 1, 1, 1,
0.7583624, -0.1409364, 1.396164, 1, 1, 1, 1, 1,
0.760506, -0.5006222, 2.937123, 1, 1, 1, 1, 1,
0.7613862, -2.030228, 1.35898, 1, 1, 1, 1, 1,
0.7689519, 1.803664, 0.850876, 1, 1, 1, 1, 1,
0.7705101, -0.272757, 2.746173, 1, 1, 1, 1, 1,
0.776684, -0.171638, 1.017091, 1, 1, 1, 1, 1,
0.7808654, 0.202952, 1.190215, 1, 1, 1, 1, 1,
0.7827942, 1.125071, 0.8473555, 0, 0, 1, 1, 1,
0.7836588, -0.871891, 3.731565, 1, 0, 0, 1, 1,
0.7836843, -1.311639, 1.195839, 1, 0, 0, 1, 1,
0.7839459, 0.1950641, 1.545771, 1, 0, 0, 1, 1,
0.7855964, -0.3703042, 0.7928422, 1, 0, 0, 1, 1,
0.7883679, -1.190083, 2.117555, 1, 0, 0, 1, 1,
0.7935708, 0.6625026, -0.5653743, 0, 0, 0, 1, 1,
0.7981003, 1.226521, 1.614334, 0, 0, 0, 1, 1,
0.8010958, -0.09390113, 0.2986737, 0, 0, 0, 1, 1,
0.8016231, 0.5736028, 0.830353, 0, 0, 0, 1, 1,
0.8036977, 1.052511, 1.449254, 0, 0, 0, 1, 1,
0.8080764, -1.691761, 4.141689, 0, 0, 0, 1, 1,
0.811473, 0.481982, 3.041269, 0, 0, 0, 1, 1,
0.8117288, -1.278729, 1.101656, 1, 1, 1, 1, 1,
0.8121454, -1.302941, 1.673205, 1, 1, 1, 1, 1,
0.8128266, 0.5207264, 1.015357, 1, 1, 1, 1, 1,
0.8163412, 0.3982033, 2.549044, 1, 1, 1, 1, 1,
0.8192161, 1.192027, 0.1105283, 1, 1, 1, 1, 1,
0.82466, 0.2995505, 2.091223, 1, 1, 1, 1, 1,
0.8281543, -0.9885471, 2.491102, 1, 1, 1, 1, 1,
0.8289272, -1.74404, 1.550036, 1, 1, 1, 1, 1,
0.8396516, 0.9510868, -0.2532184, 1, 1, 1, 1, 1,
0.8529746, -0.7525132, 2.024239, 1, 1, 1, 1, 1,
0.8535255, -1.755979, 2.733318, 1, 1, 1, 1, 1,
0.8537205, -0.3556911, 1.457679, 1, 1, 1, 1, 1,
0.8557131, -1.541775, 2.363789, 1, 1, 1, 1, 1,
0.8581559, 1.05563, 0.3437251, 1, 1, 1, 1, 1,
0.8628608, -0.822454, 3.350623, 1, 1, 1, 1, 1,
0.8685196, -0.119355, 2.088246, 0, 0, 1, 1, 1,
0.8695399, 0.423887, 2.187839, 1, 0, 0, 1, 1,
0.8696773, -0.8773792, 1.817938, 1, 0, 0, 1, 1,
0.8757979, 1.121046, 0.3786637, 1, 0, 0, 1, 1,
0.8803926, 0.3983312, 0.3348321, 1, 0, 0, 1, 1,
0.8811694, 0.9944574, 1.555062, 1, 0, 0, 1, 1,
0.8855981, -0.2434047, 1.739663, 0, 0, 0, 1, 1,
0.8857029, 0.3096865, 0.9868598, 0, 0, 0, 1, 1,
0.8965876, -0.7578439, 4.167404, 0, 0, 0, 1, 1,
0.8992501, 0.09924944, 1.575956, 0, 0, 0, 1, 1,
0.8998135, 0.7982096, 3.040909, 0, 0, 0, 1, 1,
0.9009295, -1.48735, 3.525706, 0, 0, 0, 1, 1,
0.9078903, 0.1640213, 2.346972, 0, 0, 0, 1, 1,
0.909485, 0.7785459, -0.01467702, 1, 1, 1, 1, 1,
0.9100342, -0.06501558, 0.8952074, 1, 1, 1, 1, 1,
0.9144746, -1.849655, 4.356173, 1, 1, 1, 1, 1,
0.9145057, -0.7435219, 1.271691, 1, 1, 1, 1, 1,
0.9207288, -1.196752, 0.79082, 1, 1, 1, 1, 1,
0.9227695, 0.01253577, 0.8260587, 1, 1, 1, 1, 1,
0.9301952, -0.8144548, 1.174643, 1, 1, 1, 1, 1,
0.9321001, 0.852196, 1.868092, 1, 1, 1, 1, 1,
0.9321176, 0.6041726, 0.8164726, 1, 1, 1, 1, 1,
0.9369071, -0.8306991, 3.001741, 1, 1, 1, 1, 1,
0.9513065, -1.130929, 2.532272, 1, 1, 1, 1, 1,
0.9522993, -1.236765, 2.166793, 1, 1, 1, 1, 1,
0.9547019, 2.071929, 0.6223394, 1, 1, 1, 1, 1,
0.9571738, -0.2553218, 4.967205, 1, 1, 1, 1, 1,
0.9638622, 1.042006, 0.2835257, 1, 1, 1, 1, 1,
0.9744166, 0.2706771, 3.026386, 0, 0, 1, 1, 1,
0.9749699, 1.046489, -1.000306, 1, 0, 0, 1, 1,
0.9836558, -3.297118, 4.163538, 1, 0, 0, 1, 1,
0.9938182, 1.624402, 0.3769628, 1, 0, 0, 1, 1,
1.004809, -0.5851611, 3.370226, 1, 0, 0, 1, 1,
1.005307, 0.4289376, 1.371275, 1, 0, 0, 1, 1,
1.007486, 0.5771602, 1.020448, 0, 0, 0, 1, 1,
1.008051, -0.6592094, 2.492051, 0, 0, 0, 1, 1,
1.010874, 1.088108, 0.5238419, 0, 0, 0, 1, 1,
1.021396, 0.3827719, 1.820004, 0, 0, 0, 1, 1,
1.021445, -0.6520081, 1.808115, 0, 0, 0, 1, 1,
1.030349, 0.4936035, 2.483274, 0, 0, 0, 1, 1,
1.035645, -0.07903923, -0.9261294, 0, 0, 0, 1, 1,
1.036885, 0.3841586, 2.278487, 1, 1, 1, 1, 1,
1.037159, -1.618811, 2.317743, 1, 1, 1, 1, 1,
1.0385, 1.380375, 0.05238759, 1, 1, 1, 1, 1,
1.043843, 0.2245969, 2.072438, 1, 1, 1, 1, 1,
1.050735, 1.12379, 0.1325691, 1, 1, 1, 1, 1,
1.06697, 1.360668, 0.9786233, 1, 1, 1, 1, 1,
1.071647, 0.5019478, 2.091388, 1, 1, 1, 1, 1,
1.079619, 1.338404, 1.76905, 1, 1, 1, 1, 1,
1.083036, -0.02478884, 1.647616, 1, 1, 1, 1, 1,
1.085021, -1.231136, 3.755423, 1, 1, 1, 1, 1,
1.089989, -0.7345861, 1.181911, 1, 1, 1, 1, 1,
1.095637, 0.9137877, -0.2905368, 1, 1, 1, 1, 1,
1.095885, 0.6036119, 1.819159, 1, 1, 1, 1, 1,
1.099623, -0.6464473, 0.1505188, 1, 1, 1, 1, 1,
1.106868, -2.172632, 1.080598, 1, 1, 1, 1, 1,
1.111445, -0.8750137, 2.069288, 0, 0, 1, 1, 1,
1.113879, 0.5670792, -0.08104248, 1, 0, 0, 1, 1,
1.117998, -1.110236, 3.571194, 1, 0, 0, 1, 1,
1.118744, -1.203824, 1.353926, 1, 0, 0, 1, 1,
1.127388, -2.381162, 3.727399, 1, 0, 0, 1, 1,
1.128608, -2.5021, 1.035671, 1, 0, 0, 1, 1,
1.130977, -0.8381187, 2.173285, 0, 0, 0, 1, 1,
1.13827, 0.973211, 0.4342617, 0, 0, 0, 1, 1,
1.142579, -1.391806, 2.11375, 0, 0, 0, 1, 1,
1.150061, 0.6237493, 1.02133, 0, 0, 0, 1, 1,
1.153335, 0.2259809, 1.060091, 0, 0, 0, 1, 1,
1.160407, 0.6279381, -0.4392547, 0, 0, 0, 1, 1,
1.163867, 0.1424937, 1.318538, 0, 0, 0, 1, 1,
1.165665, -0.8306094, 2.327401, 1, 1, 1, 1, 1,
1.168205, 0.9428506, 1.369263, 1, 1, 1, 1, 1,
1.169954, -0.1744935, 3.101425, 1, 1, 1, 1, 1,
1.176422, 0.855514, -0.5667358, 1, 1, 1, 1, 1,
1.185563, 0.2882731, 2.345803, 1, 1, 1, 1, 1,
1.18724, -0.525212, 0.9012983, 1, 1, 1, 1, 1,
1.199234, -1.57215, 3.28299, 1, 1, 1, 1, 1,
1.200351, 0.4121746, 0.7010205, 1, 1, 1, 1, 1,
1.206287, 1.844451, -0.8961215, 1, 1, 1, 1, 1,
1.20958, 0.6027344, 1.400945, 1, 1, 1, 1, 1,
1.210922, 0.9722113, 0.5151623, 1, 1, 1, 1, 1,
1.221818, 1.558463, -0.1251654, 1, 1, 1, 1, 1,
1.235024, -0.4777716, 1.663977, 1, 1, 1, 1, 1,
1.235513, 1.959781, -0.2047762, 1, 1, 1, 1, 1,
1.235568, 1.760793, 0.822732, 1, 1, 1, 1, 1,
1.247567, -1.355751, 2.163431, 0, 0, 1, 1, 1,
1.258273, -0.4529167, 2.938676, 1, 0, 0, 1, 1,
1.260115, -0.2722242, 2.277915, 1, 0, 0, 1, 1,
1.261629, 1.226539, 0.5410377, 1, 0, 0, 1, 1,
1.269422, -1.070614, 2.615413, 1, 0, 0, 1, 1,
1.281138, 0.1419447, 1.491722, 1, 0, 0, 1, 1,
1.286178, -0.3014984, 1.21938, 0, 0, 0, 1, 1,
1.287661, -0.1153363, 1.288823, 0, 0, 0, 1, 1,
1.290224, -0.2392599, 1.143036, 0, 0, 0, 1, 1,
1.29628, 1.756005, 0.346427, 0, 0, 0, 1, 1,
1.297372, -1.42695, 4.138885, 0, 0, 0, 1, 1,
1.298657, 0.7452695, -0.3618557, 0, 0, 0, 1, 1,
1.305264, -1.629913, 2.044528, 0, 0, 0, 1, 1,
1.306797, -0.9184699, 0.9164165, 1, 1, 1, 1, 1,
1.309248, 0.3319939, 0.8677763, 1, 1, 1, 1, 1,
1.313278, -1.722384, 0.4367109, 1, 1, 1, 1, 1,
1.316323, 0.587971, 1.907622, 1, 1, 1, 1, 1,
1.321369, -0.3728583, 0.6983897, 1, 1, 1, 1, 1,
1.323114, 1.272509, 0.6150592, 1, 1, 1, 1, 1,
1.329562, 0.583472, 0.081441, 1, 1, 1, 1, 1,
1.363757, 0.3587624, 0.7865845, 1, 1, 1, 1, 1,
1.369033, 0.4469534, 1.3111, 1, 1, 1, 1, 1,
1.392045, -0.06315126, 1.11535, 1, 1, 1, 1, 1,
1.396843, -0.8422812, 3.726206, 1, 1, 1, 1, 1,
1.402672, -0.7909686, 2.338835, 1, 1, 1, 1, 1,
1.405087, -0.3246844, 2.120236, 1, 1, 1, 1, 1,
1.414232, 1.625998, -0.4729102, 1, 1, 1, 1, 1,
1.438858, 1.098654, 0.593668, 1, 1, 1, 1, 1,
1.4399, -0.3367869, 2.746307, 0, 0, 1, 1, 1,
1.453668, -0.8435476, 2.734865, 1, 0, 0, 1, 1,
1.461948, -0.3457619, 1.863863, 1, 0, 0, 1, 1,
1.46871, 0.5421956, 0.2092607, 1, 0, 0, 1, 1,
1.478466, 2.067359, 0.03216791, 1, 0, 0, 1, 1,
1.485156, 1.333198, -0.9142541, 1, 0, 0, 1, 1,
1.486506, -0.7589774, 0.7402982, 0, 0, 0, 1, 1,
1.501171, 0.2593831, 2.854679, 0, 0, 0, 1, 1,
1.505069, -1.233583, 0.8611712, 0, 0, 0, 1, 1,
1.51625, 1.440165, 1.559917, 0, 0, 0, 1, 1,
1.521221, -0.9251335, 0.7141077, 0, 0, 0, 1, 1,
1.523757, 0.5739583, 1.806973, 0, 0, 0, 1, 1,
1.532127, 0.4300584, 1.337965, 0, 0, 0, 1, 1,
1.541739, 0.4448802, 0.4827941, 1, 1, 1, 1, 1,
1.541743, -0.4757957, 1.670946, 1, 1, 1, 1, 1,
1.55769, -0.8942315, 4.030643, 1, 1, 1, 1, 1,
1.559043, 0.9928358, 2.226263, 1, 1, 1, 1, 1,
1.570352, 1.586892, 0.4372512, 1, 1, 1, 1, 1,
1.587959, 0.4349709, 0.9154289, 1, 1, 1, 1, 1,
1.592161, 1.414042, 0.9876374, 1, 1, 1, 1, 1,
1.606077, 0.8633696, 1.204887, 1, 1, 1, 1, 1,
1.622521, 1.024517, 1.634206, 1, 1, 1, 1, 1,
1.622723, 0.6461118, 2.139486, 1, 1, 1, 1, 1,
1.623273, -0.1228476, 1.555067, 1, 1, 1, 1, 1,
1.624532, 1.358587, 0.1104617, 1, 1, 1, 1, 1,
1.62508, 0.977978, -0.5438998, 1, 1, 1, 1, 1,
1.639994, -0.5728021, 2.522217, 1, 1, 1, 1, 1,
1.640437, 0.9980152, -0.4454972, 1, 1, 1, 1, 1,
1.642229, 1.029374, 0.7977152, 0, 0, 1, 1, 1,
1.658418, -0.6489829, 3.455925, 1, 0, 0, 1, 1,
1.659953, -1.246637, 1.639267, 1, 0, 0, 1, 1,
1.681925, 1.703372, 1.593243, 1, 0, 0, 1, 1,
1.682653, 0.6833531, -0.1503417, 1, 0, 0, 1, 1,
1.687353, 0.3009477, 1.02228, 1, 0, 0, 1, 1,
1.700777, 0.1924869, 0.5182238, 0, 0, 0, 1, 1,
1.71127, -2.026832, 1.929168, 0, 0, 0, 1, 1,
1.732478, 1.902783, 1.189384, 0, 0, 0, 1, 1,
1.734481, 0.2220594, 1.259233, 0, 0, 0, 1, 1,
1.751864, 0.391225, 2.662539, 0, 0, 0, 1, 1,
1.757867, 1.169191, 1.705809, 0, 0, 0, 1, 1,
1.758724, -0.6269904, 2.433075, 0, 0, 0, 1, 1,
1.77726, -0.9072019, 1.363253, 1, 1, 1, 1, 1,
1.77867, -1.872521, 2.608778, 1, 1, 1, 1, 1,
1.780917, 1.601555, 1.065807, 1, 1, 1, 1, 1,
1.797329, 0.517443, 1.6622, 1, 1, 1, 1, 1,
1.815154, -0.1198859, 1.964245, 1, 1, 1, 1, 1,
1.819598, 0.7930715, -1.401693, 1, 1, 1, 1, 1,
1.820968, -0.748115, 1.068986, 1, 1, 1, 1, 1,
1.85018, 0.7571157, 0.5918621, 1, 1, 1, 1, 1,
1.860454, -1.164419, 2.693754, 1, 1, 1, 1, 1,
1.869333, 0.6441619, 1.710354, 1, 1, 1, 1, 1,
1.877427, 1.291925, 1.416446, 1, 1, 1, 1, 1,
1.89913, -0.7051963, 0.72686, 1, 1, 1, 1, 1,
1.914905, 0.7925601, 0.4876143, 1, 1, 1, 1, 1,
1.920579, -0.192802, 1.156642, 1, 1, 1, 1, 1,
1.939181, -0.5229689, 1.477692, 1, 1, 1, 1, 1,
1.941777, -0.7733012, 2.299639, 0, 0, 1, 1, 1,
1.964218, 0.1030517, 2.048529, 1, 0, 0, 1, 1,
2.035002, -0.2436435, 3.898633, 1, 0, 0, 1, 1,
2.062711, 0.02905016, 2.570657, 1, 0, 0, 1, 1,
2.178766, 1.820861, 1.058974, 1, 0, 0, 1, 1,
2.192856, -0.5959647, 0.5548208, 1, 0, 0, 1, 1,
2.204057, -1.484367, 2.71792, 0, 0, 0, 1, 1,
2.252076, 1.150218, -0.1323341, 0, 0, 0, 1, 1,
2.266013, -1.215306, 0.9219368, 0, 0, 0, 1, 1,
2.368182, -1.635623, 1.646871, 0, 0, 0, 1, 1,
2.384807, -0.2805442, 2.49574, 0, 0, 0, 1, 1,
2.389433, 0.616569, 2.140077, 0, 0, 0, 1, 1,
2.443211, -2.598104, 1.980446, 0, 0, 0, 1, 1,
2.449457, -0.7622451, 0.02503505, 1, 1, 1, 1, 1,
2.4748, 0.0746968, 2.679667, 1, 1, 1, 1, 1,
2.502697, -0.1907458, 1.336543, 1, 1, 1, 1, 1,
2.526894, -0.43927, 0.4396073, 1, 1, 1, 1, 1,
2.652953, 0.4290755, 2.491402, 1, 1, 1, 1, 1,
2.690269, 0.04378657, 0.0645781, 1, 1, 1, 1, 1,
2.754663, 0.6954231, 1.881484, 1, 1, 1, 1, 1
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
var radius = 9.54679;
var distance = 33.5327;
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
mvMatrix.translate( 0.08409655, 0.1821861, -0.223093 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5327);
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