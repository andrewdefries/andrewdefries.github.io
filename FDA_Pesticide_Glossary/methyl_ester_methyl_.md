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
-3.303428, -1.362957, -0.9421248, 1, 0, 0, 1,
-2.980193, -0.6216443, -1.357638, 1, 0.007843138, 0, 1,
-2.907181, 1.669646, -0.2455253, 1, 0.01176471, 0, 1,
-2.835596, 0.05205591, 0.6781498, 1, 0.01960784, 0, 1,
-2.804345, 0.4678022, -1.497978, 1, 0.02352941, 0, 1,
-2.798287, 0.2148599, -1.893646, 1, 0.03137255, 0, 1,
-2.776653, -0.1954919, -0.6873097, 1, 0.03529412, 0, 1,
-2.681875, -0.7473252, 0.3544959, 1, 0.04313726, 0, 1,
-2.515085, -0.4810943, -0.7118005, 1, 0.04705882, 0, 1,
-2.51447, 1.487565, -0.6869971, 1, 0.05490196, 0, 1,
-2.513124, -0.3823575, -0.01752521, 1, 0.05882353, 0, 1,
-2.456743, -1.543744, -2.758024, 1, 0.06666667, 0, 1,
-2.432333, -0.7959143, -3.430445, 1, 0.07058824, 0, 1,
-2.426428, -1.241076, -0.9076887, 1, 0.07843138, 0, 1,
-2.420913, -1.843414, -0.2335069, 1, 0.08235294, 0, 1,
-2.359826, 0.5437114, -1.122237, 1, 0.09019608, 0, 1,
-2.342972, -0.6450012, -1.529886, 1, 0.09411765, 0, 1,
-2.320729, -0.7043629, -1.600509, 1, 0.1019608, 0, 1,
-2.311456, -0.513316, -2.371125, 1, 0.1098039, 0, 1,
-2.285281, 0.2731228, -1.76598, 1, 0.1137255, 0, 1,
-2.269993, 0.3414893, -2.341, 1, 0.1215686, 0, 1,
-2.211203, 0.004531324, -3.030946, 1, 0.1254902, 0, 1,
-2.196786, 0.3332491, -1.194384, 1, 0.1333333, 0, 1,
-2.183794, 0.1361097, -2.561338, 1, 0.1372549, 0, 1,
-2.181467, -0.3987466, -1.313985, 1, 0.145098, 0, 1,
-2.178827, 1.494331, -0.7089915, 1, 0.1490196, 0, 1,
-2.158088, -1.776855, -0.1219196, 1, 0.1568628, 0, 1,
-2.153935, 1.292817, -1.086922, 1, 0.1607843, 0, 1,
-2.134734, -0.112387, -1.243451, 1, 0.1686275, 0, 1,
-2.112582, -1.517367, -3.120647, 1, 0.172549, 0, 1,
-2.09685, 1.320083, -0.8954358, 1, 0.1803922, 0, 1,
-2.081427, 0.2349063, -1.003877, 1, 0.1843137, 0, 1,
-2.073062, 0.2845873, -2.635271, 1, 0.1921569, 0, 1,
-2.06674, 0.4163963, -1.681856, 1, 0.1960784, 0, 1,
-2.058685, -0.2403217, -0.3305081, 1, 0.2039216, 0, 1,
-2.051891, -0.7554321, -1.706304, 1, 0.2117647, 0, 1,
-2.017541, -0.9426873, -3.050866, 1, 0.2156863, 0, 1,
-2.006899, 0.2077541, -1.298179, 1, 0.2235294, 0, 1,
-2.00522, 0.8592203, -2.94911, 1, 0.227451, 0, 1,
-1.992164, -1.36602, -3.370128, 1, 0.2352941, 0, 1,
-1.938844, 0.2475051, -0.9698148, 1, 0.2392157, 0, 1,
-1.92936, 0.1153641, -0.86141, 1, 0.2470588, 0, 1,
-1.896349, 1.314338, -0.6202623, 1, 0.2509804, 0, 1,
-1.894583, -3.116718, -1.094327, 1, 0.2588235, 0, 1,
-1.889829, -0.3545842, -3.56803, 1, 0.2627451, 0, 1,
-1.875117, 2.406667, -1.110168, 1, 0.2705882, 0, 1,
-1.861709, -0.2259055, -0.7899405, 1, 0.2745098, 0, 1,
-1.818088, 1.587853, -0.7102064, 1, 0.282353, 0, 1,
-1.805551, -0.6330395, -1.539752, 1, 0.2862745, 0, 1,
-1.805324, 0.05549408, -0.9066148, 1, 0.2941177, 0, 1,
-1.80407, 0.1712895, -1.925906, 1, 0.3019608, 0, 1,
-1.802768, 1.376786, -0.8345523, 1, 0.3058824, 0, 1,
-1.798269, 0.2277293, 0.5737947, 1, 0.3137255, 0, 1,
-1.788239, -1.227748, -4.448441, 1, 0.3176471, 0, 1,
-1.786379, -1.787649, -3.060103, 1, 0.3254902, 0, 1,
-1.775808, 1.020178, -0.71898, 1, 0.3294118, 0, 1,
-1.774006, -0.1443558, -0.8102317, 1, 0.3372549, 0, 1,
-1.754547, 0.07799348, -1.578291, 1, 0.3411765, 0, 1,
-1.724014, -0.07953949, -2.997185, 1, 0.3490196, 0, 1,
-1.718192, 0.04350631, -0.7533308, 1, 0.3529412, 0, 1,
-1.699165, -1.005317, -1.897558, 1, 0.3607843, 0, 1,
-1.695906, 1.229549, -0.1364706, 1, 0.3647059, 0, 1,
-1.690548, -1.42954, -4.135518, 1, 0.372549, 0, 1,
-1.683633, 0.7999251, 0.5081168, 1, 0.3764706, 0, 1,
-1.6807, 0.2331611, 0.6449678, 1, 0.3843137, 0, 1,
-1.677593, 0.935993, 0.5517891, 1, 0.3882353, 0, 1,
-1.669093, 1.351908, 0.3426265, 1, 0.3960784, 0, 1,
-1.659671, -1.830123, -1.824651, 1, 0.4039216, 0, 1,
-1.656585, 0.4801183, -1.396721, 1, 0.4078431, 0, 1,
-1.654627, -1.841728, -1.400326, 1, 0.4156863, 0, 1,
-1.640934, 1.840342, -0.9888191, 1, 0.4196078, 0, 1,
-1.635671, -2.176302, -2.978738, 1, 0.427451, 0, 1,
-1.634292, 0.08739533, -1.008256, 1, 0.4313726, 0, 1,
-1.616654, 0.4746696, -1.863709, 1, 0.4392157, 0, 1,
-1.60245, -0.6871414, -1.676365, 1, 0.4431373, 0, 1,
-1.595989, -1.433578, -2.520297, 1, 0.4509804, 0, 1,
-1.59497, 0.4647992, -2.183208, 1, 0.454902, 0, 1,
-1.578201, 1.05264, -1.49691, 1, 0.4627451, 0, 1,
-1.57259, -0.8172569, -2.935802, 1, 0.4666667, 0, 1,
-1.53663, 0.73706, -0.609428, 1, 0.4745098, 0, 1,
-1.523005, -1.592718, -1.653494, 1, 0.4784314, 0, 1,
-1.521445, -1.452257, -0.05364959, 1, 0.4862745, 0, 1,
-1.519245, -0.208665, -1.599461, 1, 0.4901961, 0, 1,
-1.504526, -1.354218, -2.859552, 1, 0.4980392, 0, 1,
-1.496345, 0.1766108, -2.444848, 1, 0.5058824, 0, 1,
-1.491611, -0.3668277, -2.226434, 1, 0.509804, 0, 1,
-1.486421, -0.5985902, -2.391934, 1, 0.5176471, 0, 1,
-1.47869, -1.081871, -2.966197, 1, 0.5215687, 0, 1,
-1.471755, -0.4739646, -2.333238, 1, 0.5294118, 0, 1,
-1.46478, 1.224377, -2.502993, 1, 0.5333334, 0, 1,
-1.456074, -0.5115798, -3.423783, 1, 0.5411765, 0, 1,
-1.45058, 1.085401, -1.354185, 1, 0.5450981, 0, 1,
-1.446061, 0.3737421, -0.2853778, 1, 0.5529412, 0, 1,
-1.439401, 0.1690284, -0.9728063, 1, 0.5568628, 0, 1,
-1.436775, -0.01663144, -2.686378, 1, 0.5647059, 0, 1,
-1.436269, -0.3231175, -1.717119, 1, 0.5686275, 0, 1,
-1.43231, 0.1234904, -1.11465, 1, 0.5764706, 0, 1,
-1.43228, -0.3492256, -1.70388, 1, 0.5803922, 0, 1,
-1.427269, -0.2437565, -1.165487, 1, 0.5882353, 0, 1,
-1.423342, 0.5864038, 0.117291, 1, 0.5921569, 0, 1,
-1.415106, -0.9643512, -3.0307, 1, 0.6, 0, 1,
-1.413785, -0.3364111, -0.1027841, 1, 0.6078432, 0, 1,
-1.396465, 1.237127, -2.075325, 1, 0.6117647, 0, 1,
-1.385746, -0.863088, -1.247933, 1, 0.6196079, 0, 1,
-1.381937, 1.328437, 0.4057868, 1, 0.6235294, 0, 1,
-1.373685, 0.3073604, -0.5205158, 1, 0.6313726, 0, 1,
-1.366516, -0.4755427, -1.04015, 1, 0.6352941, 0, 1,
-1.345733, 0.2256911, -2.274346, 1, 0.6431373, 0, 1,
-1.343495, 1.467168, -1.083343, 1, 0.6470588, 0, 1,
-1.327845, -0.1387169, -3.587893, 1, 0.654902, 0, 1,
-1.320928, -0.6363475, -3.379793, 1, 0.6588235, 0, 1,
-1.309504, -0.9740711, -1.804208, 1, 0.6666667, 0, 1,
-1.305163, 0.3051125, -1.824461, 1, 0.6705883, 0, 1,
-1.295005, -0.7253065, -2.990431, 1, 0.6784314, 0, 1,
-1.290192, -0.8076626, -2.759519, 1, 0.682353, 0, 1,
-1.284068, 0.07443132, -2.902325, 1, 0.6901961, 0, 1,
-1.2826, -0.9990746, -1.838649, 1, 0.6941177, 0, 1,
-1.282208, 0.07373732, 0.5960426, 1, 0.7019608, 0, 1,
-1.278372, 0.1050573, -2.687239, 1, 0.7098039, 0, 1,
-1.276301, 0.05842387, -1.432939, 1, 0.7137255, 0, 1,
-1.267169, 0.3507357, -1.189576, 1, 0.7215686, 0, 1,
-1.266611, 1.455819, -1.518698, 1, 0.7254902, 0, 1,
-1.257489, 0.8023621, -0.2773443, 1, 0.7333333, 0, 1,
-1.248598, 0.6327959, -0.5470949, 1, 0.7372549, 0, 1,
-1.227987, 0.5170742, -1.769569, 1, 0.7450981, 0, 1,
-1.22665, -0.03348088, -0.6559453, 1, 0.7490196, 0, 1,
-1.220306, 0.3099838, -0.6990808, 1, 0.7568628, 0, 1,
-1.214622, -0.8940929, -3.196363, 1, 0.7607843, 0, 1,
-1.21391, 1.976474, -1.557777, 1, 0.7686275, 0, 1,
-1.196739, 0.1855962, -0.9496242, 1, 0.772549, 0, 1,
-1.184538, -0.2400472, -2.007179, 1, 0.7803922, 0, 1,
-1.183803, -0.7915069, -3.561666, 1, 0.7843137, 0, 1,
-1.178988, 0.2536435, -2.630396, 1, 0.7921569, 0, 1,
-1.178855, 0.5189138, -0.6073672, 1, 0.7960784, 0, 1,
-1.17496, 0.9379197, -0.7836421, 1, 0.8039216, 0, 1,
-1.172708, -1.296931, -1.915326, 1, 0.8117647, 0, 1,
-1.166036, 0.8469199, -1.051095, 1, 0.8156863, 0, 1,
-1.163035, -1.666129, -1.166785, 1, 0.8235294, 0, 1,
-1.15807, -0.7665152, -3.535692, 1, 0.827451, 0, 1,
-1.154562, 0.890304, -1.429102, 1, 0.8352941, 0, 1,
-1.152617, -0.4070674, -1.751675, 1, 0.8392157, 0, 1,
-1.15167, 0.0402438, -2.251781, 1, 0.8470588, 0, 1,
-1.151285, -0.3283125, -1.975662, 1, 0.8509804, 0, 1,
-1.14002, 0.3915744, -1.198697, 1, 0.8588235, 0, 1,
-1.136093, -1.712735, -1.020378, 1, 0.8627451, 0, 1,
-1.125234, -0.266048, -1.152541, 1, 0.8705882, 0, 1,
-1.120835, -1.738858, -3.442594, 1, 0.8745098, 0, 1,
-1.102225, -1.370177, -1.937122, 1, 0.8823529, 0, 1,
-1.100283, 0.9231433, -0.6824768, 1, 0.8862745, 0, 1,
-1.099634, -0.3311826, -1.013309, 1, 0.8941177, 0, 1,
-1.097946, 0.6942858, -0.2166841, 1, 0.8980392, 0, 1,
-1.093637, -0.227473, -1.191593, 1, 0.9058824, 0, 1,
-1.088531, 0.06715506, -2.260939, 1, 0.9137255, 0, 1,
-1.087506, 0.511456, -1.174409, 1, 0.9176471, 0, 1,
-1.084068, -1.546053, -4.087715, 1, 0.9254902, 0, 1,
-1.076048, 0.3623274, -2.909774, 1, 0.9294118, 0, 1,
-1.072874, 0.9407221, -1.508079, 1, 0.9372549, 0, 1,
-1.072122, 0.6256806, 0.2081278, 1, 0.9411765, 0, 1,
-1.071448, -1.337302, -2.465364, 1, 0.9490196, 0, 1,
-1.06473, 0.8956306, -1.520751, 1, 0.9529412, 0, 1,
-1.063088, 1.228758, -1.898852, 1, 0.9607843, 0, 1,
-1.060039, -0.4371412, -2.214316, 1, 0.9647059, 0, 1,
-1.056362, 1.397874, 0.5014867, 1, 0.972549, 0, 1,
-1.055386, 0.8306882, 0.01888644, 1, 0.9764706, 0, 1,
-1.048827, -0.264984, -2.739652, 1, 0.9843137, 0, 1,
-1.045287, -0.6247109, -0.6440523, 1, 0.9882353, 0, 1,
-1.037741, 1.105083, -1.914742, 1, 0.9960784, 0, 1,
-1.032944, 1.20673, -1.134287, 0.9960784, 1, 0, 1,
-1.029391, -0.9831213, -2.869862, 0.9921569, 1, 0, 1,
-1.027779, -0.7814522, -2.601469, 0.9843137, 1, 0, 1,
-1.023819, -1.395493, -3.642903, 0.9803922, 1, 0, 1,
-1.018537, 0.4608531, -0.9758525, 0.972549, 1, 0, 1,
-1.014809, 0.1882426, -1.011829, 0.9686275, 1, 0, 1,
-1.006539, -0.0954498, -0.4842145, 0.9607843, 1, 0, 1,
-1.002154, 0.4857608, -0.2820658, 0.9568627, 1, 0, 1,
-1.001605, -0.8016894, -1.2409, 0.9490196, 1, 0, 1,
-1.000946, 0.07519422, -1.850406, 0.945098, 1, 0, 1,
-0.9980974, 1.29654, -0.2211991, 0.9372549, 1, 0, 1,
-0.9972946, 1.046814, -0.5762811, 0.9333333, 1, 0, 1,
-0.996244, -0.5604498, -1.625583, 0.9254902, 1, 0, 1,
-0.991495, 1.484028, -1.316012, 0.9215686, 1, 0, 1,
-0.9879331, 0.1787796, -0.6160851, 0.9137255, 1, 0, 1,
-0.985577, -1.273087, -2.794081, 0.9098039, 1, 0, 1,
-0.9767103, -0.4491242, -0.6225237, 0.9019608, 1, 0, 1,
-0.9747684, -0.8676378, -1.500031, 0.8941177, 1, 0, 1,
-0.9728336, -1.308798, -2.421411, 0.8901961, 1, 0, 1,
-0.9718555, -0.3431043, -3.968885, 0.8823529, 1, 0, 1,
-0.9668808, 0.3503999, 0.1999236, 0.8784314, 1, 0, 1,
-0.9576008, -0.06273903, 0.056558, 0.8705882, 1, 0, 1,
-0.9484532, -0.9388749, -0.9887632, 0.8666667, 1, 0, 1,
-0.946367, 1.000368, 0.6748749, 0.8588235, 1, 0, 1,
-0.9431841, 0.7531358, -1.27575, 0.854902, 1, 0, 1,
-0.9347786, 1.840946, 0.2693553, 0.8470588, 1, 0, 1,
-0.9325683, -0.8289959, -1.397776, 0.8431373, 1, 0, 1,
-0.9313585, 0.9455291, -1.555909, 0.8352941, 1, 0, 1,
-0.9310514, 1.644632, -0.8671184, 0.8313726, 1, 0, 1,
-0.9301059, -1.35104, -2.038655, 0.8235294, 1, 0, 1,
-0.9265352, -1.508283, -2.584006, 0.8196079, 1, 0, 1,
-0.9254111, -1.567536, -3.717068, 0.8117647, 1, 0, 1,
-0.9239683, -0.8455328, -0.8933462, 0.8078431, 1, 0, 1,
-0.9224736, -0.4593148, -1.636507, 0.8, 1, 0, 1,
-0.9219783, 0.008879703, -2.935933, 0.7921569, 1, 0, 1,
-0.921249, 1.902987, 0.6793091, 0.7882353, 1, 0, 1,
-0.9177352, -0.4731031, -1.721203, 0.7803922, 1, 0, 1,
-0.9085038, 1.049358, -0.3113259, 0.7764706, 1, 0, 1,
-0.9024097, -0.5597382, -1.10958, 0.7686275, 1, 0, 1,
-0.8947366, 0.3579259, -1.249797, 0.7647059, 1, 0, 1,
-0.8905978, 1.030256, -0.5613301, 0.7568628, 1, 0, 1,
-0.8887529, 0.9039084, -0.9382499, 0.7529412, 1, 0, 1,
-0.8884252, -1.166678, -2.149308, 0.7450981, 1, 0, 1,
-0.8869044, -0.06914029, -4.548992, 0.7411765, 1, 0, 1,
-0.8829401, -0.533959, -1.72907, 0.7333333, 1, 0, 1,
-0.8817956, 0.4812198, -0.5640072, 0.7294118, 1, 0, 1,
-0.8789598, -0.4717206, -2.36302, 0.7215686, 1, 0, 1,
-0.8706646, 0.8611704, 0.3849451, 0.7176471, 1, 0, 1,
-0.8693528, -0.7856702, -3.226098, 0.7098039, 1, 0, 1,
-0.8636307, -0.9314268, -3.880578, 0.7058824, 1, 0, 1,
-0.8544426, -1.392625, -2.525614, 0.6980392, 1, 0, 1,
-0.8518807, -1.397948, -3.260174, 0.6901961, 1, 0, 1,
-0.8516358, 1.217471, 1.373761, 0.6862745, 1, 0, 1,
-0.8504106, 2.663666, -0.4918667, 0.6784314, 1, 0, 1,
-0.8493258, -0.2636956, -3.985872, 0.6745098, 1, 0, 1,
-0.8484581, -1.206748, -0.6376741, 0.6666667, 1, 0, 1,
-0.8448505, 0.3019642, -0.1779203, 0.6627451, 1, 0, 1,
-0.8369082, 3.058074, 0.4551273, 0.654902, 1, 0, 1,
-0.8348696, 0.73398, -2.076475, 0.6509804, 1, 0, 1,
-0.8290328, -1.830746, -2.814531, 0.6431373, 1, 0, 1,
-0.8207113, -0.2204056, -2.150556, 0.6392157, 1, 0, 1,
-0.819052, 0.05626802, -2.000129, 0.6313726, 1, 0, 1,
-0.8151197, -0.1874754, -2.990329, 0.627451, 1, 0, 1,
-0.8106532, -0.979511, -0.4244095, 0.6196079, 1, 0, 1,
-0.8073908, 0.1098836, 0.3038681, 0.6156863, 1, 0, 1,
-0.8070441, -1.095244, -4.60949, 0.6078432, 1, 0, 1,
-0.8035465, 0.8722925, -1.687449, 0.6039216, 1, 0, 1,
-0.7994753, -1.226824, -2.168067, 0.5960785, 1, 0, 1,
-0.7990097, -0.1474822, -0.9949133, 0.5882353, 1, 0, 1,
-0.7976269, 0.8696047, -2.289397, 0.5843138, 1, 0, 1,
-0.7924827, -1.573641, -2.206904, 0.5764706, 1, 0, 1,
-0.7856425, -1.441009, -3.620098, 0.572549, 1, 0, 1,
-0.7855775, 0.6473979, -0.4382001, 0.5647059, 1, 0, 1,
-0.7853265, 0.06995455, -0.865537, 0.5607843, 1, 0, 1,
-0.7830401, 0.6409362, -1.958373, 0.5529412, 1, 0, 1,
-0.7755929, 0.5736605, 0.9789404, 0.5490196, 1, 0, 1,
-0.7715287, 0.7095466, -0.7938502, 0.5411765, 1, 0, 1,
-0.7614647, 0.09120341, -1.693698, 0.5372549, 1, 0, 1,
-0.7586191, 0.769363, -1.933885, 0.5294118, 1, 0, 1,
-0.7572585, 0.5912991, -0.2711336, 0.5254902, 1, 0, 1,
-0.7562345, -0.358069, -0.0841236, 0.5176471, 1, 0, 1,
-0.7521773, 1.790295, 0.6156494, 0.5137255, 1, 0, 1,
-0.7504699, -0.3152601, -1.027775, 0.5058824, 1, 0, 1,
-0.7498378, -0.249416, -1.89949, 0.5019608, 1, 0, 1,
-0.748983, 1.670405, -1.916243, 0.4941176, 1, 0, 1,
-0.746469, 0.5536079, -1.051447, 0.4862745, 1, 0, 1,
-0.7446609, 0.3270693, -2.594851, 0.4823529, 1, 0, 1,
-0.736921, -0.2948183, -1.574629, 0.4745098, 1, 0, 1,
-0.7341223, 1.035591, -0.07253896, 0.4705882, 1, 0, 1,
-0.7314711, 0.05709492, -2.79401, 0.4627451, 1, 0, 1,
-0.7241462, -0.9169592, -3.394576, 0.4588235, 1, 0, 1,
-0.7232486, 0.1270446, -1.800243, 0.4509804, 1, 0, 1,
-0.7206935, 2.311454, -0.5494481, 0.4470588, 1, 0, 1,
-0.7189847, 0.5081733, -0.670918, 0.4392157, 1, 0, 1,
-0.7153521, -0.8341193, -1.636029, 0.4352941, 1, 0, 1,
-0.7126934, -1.168333, -0.9278498, 0.427451, 1, 0, 1,
-0.7080684, -0.6574956, -3.229788, 0.4235294, 1, 0, 1,
-0.7032074, 0.02259454, -2.113616, 0.4156863, 1, 0, 1,
-0.6983552, -0.1466025, 0.7342696, 0.4117647, 1, 0, 1,
-0.6975583, 1.93595, 0.3339876, 0.4039216, 1, 0, 1,
-0.6954556, -1.614623, -3.752819, 0.3960784, 1, 0, 1,
-0.6943665, 1.792602, -0.962038, 0.3921569, 1, 0, 1,
-0.6907355, -0.9759858, -1.638112, 0.3843137, 1, 0, 1,
-0.6873387, 0.7132692, -0.03392935, 0.3803922, 1, 0, 1,
-0.6790853, -2.978951, -3.573411, 0.372549, 1, 0, 1,
-0.6782573, -0.93608, -2.080393, 0.3686275, 1, 0, 1,
-0.6706789, -0.4926483, -1.404299, 0.3607843, 1, 0, 1,
-0.6655282, -0.1940688, -1.171773, 0.3568628, 1, 0, 1,
-0.6638586, 0.2404709, -1.34267, 0.3490196, 1, 0, 1,
-0.6636831, -1.198797, -0.3412264, 0.345098, 1, 0, 1,
-0.6496212, 0.8550745, -0.4859242, 0.3372549, 1, 0, 1,
-0.6435707, -0.9106724, -2.138358, 0.3333333, 1, 0, 1,
-0.6391715, -0.5189861, -2.467432, 0.3254902, 1, 0, 1,
-0.6387904, -1.837889, -2.703462, 0.3215686, 1, 0, 1,
-0.6365176, -0.7092883, -0.560152, 0.3137255, 1, 0, 1,
-0.6354384, -0.5044158, -0.3433837, 0.3098039, 1, 0, 1,
-0.6346912, -0.8768463, -1.428327, 0.3019608, 1, 0, 1,
-0.6273114, 0.08648777, -1.036331, 0.2941177, 1, 0, 1,
-0.6245646, 1.440528, -0.185788, 0.2901961, 1, 0, 1,
-0.6245372, -1.168986, -3.009651, 0.282353, 1, 0, 1,
-0.6245332, 0.2161485, -1.309378, 0.2784314, 1, 0, 1,
-0.6214039, -0.8918784, -2.654691, 0.2705882, 1, 0, 1,
-0.6159425, 0.204101, -1.034088, 0.2666667, 1, 0, 1,
-0.6148992, 1.247114, -0.5306953, 0.2588235, 1, 0, 1,
-0.6126599, 1.289876, -0.5168573, 0.254902, 1, 0, 1,
-0.6053621, 0.1919707, -0.7479622, 0.2470588, 1, 0, 1,
-0.6053205, -1.606454, -1.010507, 0.2431373, 1, 0, 1,
-0.5975884, -0.556766, -1.721917, 0.2352941, 1, 0, 1,
-0.5908896, -0.8345119, -4.463105, 0.2313726, 1, 0, 1,
-0.5882918, 0.6615787, 0.3613756, 0.2235294, 1, 0, 1,
-0.5851928, -0.5099485, -2.63017, 0.2196078, 1, 0, 1,
-0.5769055, -0.6211025, -2.594175, 0.2117647, 1, 0, 1,
-0.5766051, -0.1695036, -1.247257, 0.2078431, 1, 0, 1,
-0.5695466, -1.367883, -3.22711, 0.2, 1, 0, 1,
-0.5684215, 0.5397023, -0.03702519, 0.1921569, 1, 0, 1,
-0.5667938, -1.858854, -4.180695, 0.1882353, 1, 0, 1,
-0.5599321, -1.127698, -3.760586, 0.1803922, 1, 0, 1,
-0.5568861, 0.3851583, -1.60244, 0.1764706, 1, 0, 1,
-0.5563992, 0.2496919, 0.2901942, 0.1686275, 1, 0, 1,
-0.5563893, 1.028966, 0.7429106, 0.1647059, 1, 0, 1,
-0.5561335, -3.199583, -4.968311, 0.1568628, 1, 0, 1,
-0.5547262, 0.8167852, -1.205398, 0.1529412, 1, 0, 1,
-0.5531462, -1.789469, -4.181682, 0.145098, 1, 0, 1,
-0.5512897, 1.173913, -1.27009, 0.1411765, 1, 0, 1,
-0.5450523, 0.1259875, -2.185999, 0.1333333, 1, 0, 1,
-0.5433722, 1.917105, 0.03112264, 0.1294118, 1, 0, 1,
-0.5430523, -0.6864579, -3.44643, 0.1215686, 1, 0, 1,
-0.5420449, 0.5097156, -2.427777, 0.1176471, 1, 0, 1,
-0.5410441, -0.1915917, -3.329401, 0.1098039, 1, 0, 1,
-0.5391597, 0.9183273, 1.400467, 0.1058824, 1, 0, 1,
-0.5386258, 1.186194, -0.7918201, 0.09803922, 1, 0, 1,
-0.5364594, -0.4093682, -3.112862, 0.09019608, 1, 0, 1,
-0.5340924, 0.01460517, -1.664277, 0.08627451, 1, 0, 1,
-0.5338464, 1.832869, -1.710929, 0.07843138, 1, 0, 1,
-0.5315014, 0.7227129, 0.6516158, 0.07450981, 1, 0, 1,
-0.5302367, -0.3292562, -4.614674, 0.06666667, 1, 0, 1,
-0.5286872, 3.30411, -0.3392742, 0.0627451, 1, 0, 1,
-0.5274341, -0.2883648, -3.082277, 0.05490196, 1, 0, 1,
-0.5272289, -0.7155162, -3.915172, 0.05098039, 1, 0, 1,
-0.5230544, 0.6249211, -0.76169, 0.04313726, 1, 0, 1,
-0.5229445, -0.2592129, -2.558414, 0.03921569, 1, 0, 1,
-0.5175082, 0.6470906, 1.372957, 0.03137255, 1, 0, 1,
-0.516382, 0.8505397, -1.230445, 0.02745098, 1, 0, 1,
-0.5149771, 1.937417, -1.083074, 0.01960784, 1, 0, 1,
-0.5127857, -1.416711, -1.974398, 0.01568628, 1, 0, 1,
-0.5061861, -0.3866994, -4.08297, 0.007843138, 1, 0, 1,
-0.5010061, 0.9895313, -1.775035, 0.003921569, 1, 0, 1,
-0.4996154, -1.069225, -1.153524, 0, 1, 0.003921569, 1,
-0.4958864, -1.408384, -2.633906, 0, 1, 0.01176471, 1,
-0.494285, 0.5649132, -0.6872232, 0, 1, 0.01568628, 1,
-0.4928029, 0.7034708, 0.2277266, 0, 1, 0.02352941, 1,
-0.4916305, 0.9026794, -1.175582, 0, 1, 0.02745098, 1,
-0.4913989, -0.07675692, -2.349341, 0, 1, 0.03529412, 1,
-0.4905031, -2.088939, -3.030261, 0, 1, 0.03921569, 1,
-0.4858983, -0.4255504, -4.039932, 0, 1, 0.04705882, 1,
-0.4824019, 0.4473041, -1.394146, 0, 1, 0.05098039, 1,
-0.470796, 0.6038206, 0.2496695, 0, 1, 0.05882353, 1,
-0.4645533, -1.170769, -0.9474063, 0, 1, 0.0627451, 1,
-0.4590752, -0.9094599, -4.273715, 0, 1, 0.07058824, 1,
-0.4588791, 0.01714798, -0.2740309, 0, 1, 0.07450981, 1,
-0.4573168, 0.6615221, -1.528068, 0, 1, 0.08235294, 1,
-0.4542617, -1.256287, -3.693264, 0, 1, 0.08627451, 1,
-0.4534608, 1.42616, 1.163235, 0, 1, 0.09411765, 1,
-0.4501885, 1.363965, -1.248654, 0, 1, 0.1019608, 1,
-0.4489093, -0.5155919, -2.443861, 0, 1, 0.1058824, 1,
-0.4424234, -0.4711875, -3.440951, 0, 1, 0.1137255, 1,
-0.4397269, 0.2561513, -2.464467, 0, 1, 0.1176471, 1,
-0.4256234, 0.1296427, -0.9637365, 0, 1, 0.1254902, 1,
-0.4250985, -0.5173796, -2.943378, 0, 1, 0.1294118, 1,
-0.4221557, 2.853989, -1.392241, 0, 1, 0.1372549, 1,
-0.4215253, 1.255234, 0.4676304, 0, 1, 0.1411765, 1,
-0.4212412, -0.9845738, -1.898172, 0, 1, 0.1490196, 1,
-0.4210843, -0.9196713, -2.683715, 0, 1, 0.1529412, 1,
-0.4205156, -1.440187, -2.365891, 0, 1, 0.1607843, 1,
-0.4152263, 0.2832781, -0.02909195, 0, 1, 0.1647059, 1,
-0.4107874, -1.796708, -4.54914, 0, 1, 0.172549, 1,
-0.4095897, -0.2920206, -1.076278, 0, 1, 0.1764706, 1,
-0.4086689, 1.799925, -2.000829, 0, 1, 0.1843137, 1,
-0.407957, 1.250214, 1.393793, 0, 1, 0.1882353, 1,
-0.4040051, -0.7382444, -2.335946, 0, 1, 0.1960784, 1,
-0.4012625, -1.598889, -3.750947, 0, 1, 0.2039216, 1,
-0.4012173, -0.7239646, -2.839113, 0, 1, 0.2078431, 1,
-0.3984545, -1.100751, -4.06499, 0, 1, 0.2156863, 1,
-0.3968256, 1.312924, -0.417942, 0, 1, 0.2196078, 1,
-0.3958773, 0.381405, -1.198559, 0, 1, 0.227451, 1,
-0.3952319, -1.434566, -2.823199, 0, 1, 0.2313726, 1,
-0.3863214, 0.4019554, -1.800189, 0, 1, 0.2392157, 1,
-0.3840702, -0.6912949, -3.782697, 0, 1, 0.2431373, 1,
-0.3837322, 0.2882312, -1.579299, 0, 1, 0.2509804, 1,
-0.377304, 0.1446352, -0.2759463, 0, 1, 0.254902, 1,
-0.3715791, -0.6129839, -3.574335, 0, 1, 0.2627451, 1,
-0.369702, -3.226702, -3.823277, 0, 1, 0.2666667, 1,
-0.3659476, -0.3098716, -1.28222, 0, 1, 0.2745098, 1,
-0.3658882, -1.082773, -1.549676, 0, 1, 0.2784314, 1,
-0.3560721, -1.153496, -4.758693, 0, 1, 0.2862745, 1,
-0.3554598, -0.02352241, -0.6937134, 0, 1, 0.2901961, 1,
-0.3548713, 2.270258, -0.3929365, 0, 1, 0.2980392, 1,
-0.3528578, 0.5824535, -1.948749, 0, 1, 0.3058824, 1,
-0.3525387, -0.3099987, -3.594862, 0, 1, 0.3098039, 1,
-0.3515122, 0.7034861, -0.6047055, 0, 1, 0.3176471, 1,
-0.3513911, 0.03881643, -2.339089, 0, 1, 0.3215686, 1,
-0.3452694, 0.3280593, -0.4436199, 0, 1, 0.3294118, 1,
-0.3385372, 0.2463504, -1.358485, 0, 1, 0.3333333, 1,
-0.3384156, 0.3023358, -1.34648, 0, 1, 0.3411765, 1,
-0.3365623, -0.4321684, -1.167552, 0, 1, 0.345098, 1,
-0.3340758, -0.5663871, -2.75091, 0, 1, 0.3529412, 1,
-0.3324244, -0.7529323, -2.949014, 0, 1, 0.3568628, 1,
-0.3281801, -0.6408488, -3.603333, 0, 1, 0.3647059, 1,
-0.3278464, 0.6612014, 0.6016918, 0, 1, 0.3686275, 1,
-0.3252759, 0.1525857, -1.190588, 0, 1, 0.3764706, 1,
-0.3218982, -0.3470174, 0.2803547, 0, 1, 0.3803922, 1,
-0.3192506, 1.20741, 0.2263958, 0, 1, 0.3882353, 1,
-0.3163744, 0.2119419, -0.3460257, 0, 1, 0.3921569, 1,
-0.3145854, 0.3078084, -1.218908, 0, 1, 0.4, 1,
-0.3133598, -1.90992, -2.929075, 0, 1, 0.4078431, 1,
-0.3082977, 0.6917213, -0.8780342, 0, 1, 0.4117647, 1,
-0.3081474, -0.9814432, -3.657428, 0, 1, 0.4196078, 1,
-0.2975197, -0.4889861, -3.305178, 0, 1, 0.4235294, 1,
-0.2962651, 0.6493078, -0.03305214, 0, 1, 0.4313726, 1,
-0.2942649, -0.1233716, -1.829268, 0, 1, 0.4352941, 1,
-0.2937256, -0.3011909, -2.935234, 0, 1, 0.4431373, 1,
-0.2901312, 0.7625722, -1.564846, 0, 1, 0.4470588, 1,
-0.2876168, -0.492103, -2.098719, 0, 1, 0.454902, 1,
-0.2875952, 0.7363942, 2.266188, 0, 1, 0.4588235, 1,
-0.2819355, -0.6939333, -2.920709, 0, 1, 0.4666667, 1,
-0.2782937, 1.060111, -1.618323, 0, 1, 0.4705882, 1,
-0.2773534, 1.079715, -2.306506, 0, 1, 0.4784314, 1,
-0.2754148, 1.098959, -0.9690422, 0, 1, 0.4823529, 1,
-0.2734015, -1.61049, -3.131155, 0, 1, 0.4901961, 1,
-0.2703796, 1.173663, -0.2768495, 0, 1, 0.4941176, 1,
-0.2691173, -0.3208014, -1.604742, 0, 1, 0.5019608, 1,
-0.26544, -0.1593129, -2.126481, 0, 1, 0.509804, 1,
-0.2632828, 0.66576, -1.84102, 0, 1, 0.5137255, 1,
-0.2595869, -0.383252, -2.297583, 0, 1, 0.5215687, 1,
-0.2569961, -1.046426, -2.577717, 0, 1, 0.5254902, 1,
-0.2569532, 0.3053853, 0.09662539, 0, 1, 0.5333334, 1,
-0.2556912, -0.4344206, -2.862782, 0, 1, 0.5372549, 1,
-0.2451137, -0.7089427, -2.419585, 0, 1, 0.5450981, 1,
-0.2441746, -2.658487, -5.003854, 0, 1, 0.5490196, 1,
-0.2369427, 1.580097, 0.6590385, 0, 1, 0.5568628, 1,
-0.2368753, 0.2103924, -0.918062, 0, 1, 0.5607843, 1,
-0.2349127, -0.1043884, -2.019604, 0, 1, 0.5686275, 1,
-0.2349058, -0.3897221, -4.161485, 0, 1, 0.572549, 1,
-0.2344702, 1.567283, -0.438879, 0, 1, 0.5803922, 1,
-0.2314212, 1.537784, -1.36887, 0, 1, 0.5843138, 1,
-0.2312204, -0.3903156, -2.622835, 0, 1, 0.5921569, 1,
-0.2270413, -1.73266, -4.931028, 0, 1, 0.5960785, 1,
-0.2206286, -0.8003157, -2.86901, 0, 1, 0.6039216, 1,
-0.2163642, 1.248839, -0.09696554, 0, 1, 0.6117647, 1,
-0.2141143, 0.1272446, 0.8749071, 0, 1, 0.6156863, 1,
-0.2064651, 0.4234698, 1.762031, 0, 1, 0.6235294, 1,
-0.2029798, -0.3661086, -3.673772, 0, 1, 0.627451, 1,
-0.2025768, -0.8863978, -3.444698, 0, 1, 0.6352941, 1,
-0.2000941, 0.5747313, -1.655304, 0, 1, 0.6392157, 1,
-0.1978569, -0.02339382, -0.5319804, 0, 1, 0.6470588, 1,
-0.1954815, -1.021682, -3.233069, 0, 1, 0.6509804, 1,
-0.1936896, 1.209304, -0.2157907, 0, 1, 0.6588235, 1,
-0.1872366, 1.024584, -0.6079629, 0, 1, 0.6627451, 1,
-0.1853501, -1.155681, -3.463113, 0, 1, 0.6705883, 1,
-0.1847552, 1.879487, -1.068213, 0, 1, 0.6745098, 1,
-0.1822682, -0.1106667, -1.002181, 0, 1, 0.682353, 1,
-0.1796286, -1.329686, -1.798286, 0, 1, 0.6862745, 1,
-0.1783725, -0.9880021, -5.05546, 0, 1, 0.6941177, 1,
-0.1758022, -0.469731, -1.939858, 0, 1, 0.7019608, 1,
-0.1700762, -1.145082, -2.392843, 0, 1, 0.7058824, 1,
-0.1685535, -1.701288, -3.341063, 0, 1, 0.7137255, 1,
-0.1620465, 1.233667, -0.1304354, 0, 1, 0.7176471, 1,
-0.1551785, -0.5006091, -1.521715, 0, 1, 0.7254902, 1,
-0.1545864, 0.6872314, -0.37535, 0, 1, 0.7294118, 1,
-0.151986, 0.7369196, -0.6086872, 0, 1, 0.7372549, 1,
-0.1444965, 0.6819251, 1.457037, 0, 1, 0.7411765, 1,
-0.1436116, -0.04111034, -2.347799, 0, 1, 0.7490196, 1,
-0.1423756, -0.8729491, -4.140913, 0, 1, 0.7529412, 1,
-0.1339639, 0.8257669, 0.5521895, 0, 1, 0.7607843, 1,
-0.1337586, 1.326838, 0.7435642, 0, 1, 0.7647059, 1,
-0.1309466, 0.2455678, -0.4156558, 0, 1, 0.772549, 1,
-0.1267327, 0.1562103, -0.7729745, 0, 1, 0.7764706, 1,
-0.126422, 0.009834879, -1.363015, 0, 1, 0.7843137, 1,
-0.125728, 0.3183561, 1.194162, 0, 1, 0.7882353, 1,
-0.1195415, 0.3623347, 0.7718686, 0, 1, 0.7960784, 1,
-0.1193334, -0.8305959, -3.841224, 0, 1, 0.8039216, 1,
-0.119127, 1.304855, 0.9313003, 0, 1, 0.8078431, 1,
-0.1185549, -0.1603643, -0.8342166, 0, 1, 0.8156863, 1,
-0.1093032, 0.472078, -1.012467, 0, 1, 0.8196079, 1,
-0.1092906, -1.28731, -3.120685, 0, 1, 0.827451, 1,
-0.1084626, -1.607323, -4.531845, 0, 1, 0.8313726, 1,
-0.09400429, 1.094025, -1.147063, 0, 1, 0.8392157, 1,
-0.09055206, -0.4111973, -3.327741, 0, 1, 0.8431373, 1,
-0.08232418, -0.9597394, -1.844512, 0, 1, 0.8509804, 1,
-0.07584891, -1.435306, -5.503829, 0, 1, 0.854902, 1,
-0.07561329, 0.2558827, 0.4154874, 0, 1, 0.8627451, 1,
-0.0751906, -0.6020779, -2.365472, 0, 1, 0.8666667, 1,
-0.0750908, -1.149717, -3.868702, 0, 1, 0.8745098, 1,
-0.07085695, -0.9987978, -3.841092, 0, 1, 0.8784314, 1,
-0.06315326, 0.6960038, 0.6937817, 0, 1, 0.8862745, 1,
-0.06088986, 1.394646, -1.051661, 0, 1, 0.8901961, 1,
-0.05219788, 0.8839697, -1.247011, 0, 1, 0.8980392, 1,
-0.04931327, -0.08015884, -3.064864, 0, 1, 0.9058824, 1,
-0.04287863, -0.1969986, -2.396544, 0, 1, 0.9098039, 1,
-0.04253999, 0.8289068, -0.1263756, 0, 1, 0.9176471, 1,
-0.04105681, 0.2845011, -1.410327, 0, 1, 0.9215686, 1,
-0.0401968, 0.1335898, 0.3199666, 0, 1, 0.9294118, 1,
-0.03433139, 1.500201, 0.3946524, 0, 1, 0.9333333, 1,
-0.03387243, 2.001621, 0.3813264, 0, 1, 0.9411765, 1,
-0.02838633, -1.64925, -3.942437, 0, 1, 0.945098, 1,
-0.02632566, -0.0303528, -2.568795, 0, 1, 0.9529412, 1,
-0.02620785, 0.8022674, -0.1194475, 0, 1, 0.9568627, 1,
-0.02588373, -0.005627174, -2.375494, 0, 1, 0.9647059, 1,
-0.01824972, 0.277373, 0.174196, 0, 1, 0.9686275, 1,
-0.01335066, -2.640449, -3.805803, 0, 1, 0.9764706, 1,
-0.01331549, 0.8496099, 1.067428, 0, 1, 0.9803922, 1,
-0.01139436, 0.5646592, -1.212645, 0, 1, 0.9882353, 1,
-0.004080432, 0.4968407, 0.3018093, 0, 1, 0.9921569, 1,
-0.001701309, 0.09631586, -2.041764, 0, 1, 1, 1,
-0.0001008177, -0.02711137, -2.895274, 0, 0.9921569, 1, 1,
0.002031959, 0.184193, -0.3726292, 0, 0.9882353, 1, 1,
0.002875452, -0.4324309, 1.912313, 0, 0.9803922, 1, 1,
0.01037416, -1.406114, 3.819188, 0, 0.9764706, 1, 1,
0.01127848, 0.1424579, 0.5312367, 0, 0.9686275, 1, 1,
0.01166098, -0.9113041, 5.161718, 0, 0.9647059, 1, 1,
0.01383417, -1.278449, 2.198873, 0, 0.9568627, 1, 1,
0.01405601, 1.727911, -1.145275, 0, 0.9529412, 1, 1,
0.01445618, -0.742979, 2.610262, 0, 0.945098, 1, 1,
0.01888218, 0.9523205, 1.262268, 0, 0.9411765, 1, 1,
0.02071199, 0.07975148, 0.04467753, 0, 0.9333333, 1, 1,
0.02777549, 0.7198389, -0.5270038, 0, 0.9294118, 1, 1,
0.0349649, -0.2642488, 5.450414, 0, 0.9215686, 1, 1,
0.03652079, 0.9237292, 1.667322, 0, 0.9176471, 1, 1,
0.04030959, 0.2534175, 0.5447585, 0, 0.9098039, 1, 1,
0.04116843, -0.2023532, 2.588857, 0, 0.9058824, 1, 1,
0.04351598, 0.1876248, 0.2608789, 0, 0.8980392, 1, 1,
0.04969574, -0.03242509, 0.86939, 0, 0.8901961, 1, 1,
0.04998174, 1.582112, -0.3331524, 0, 0.8862745, 1, 1,
0.05227605, 0.1694321, -0.7416469, 0, 0.8784314, 1, 1,
0.05665955, 0.4088368, 0.8865881, 0, 0.8745098, 1, 1,
0.05694843, 1.397861, 0.4889299, 0, 0.8666667, 1, 1,
0.05722843, -2.317579, 1.475492, 0, 0.8627451, 1, 1,
0.05755819, -0.5762426, 3.731564, 0, 0.854902, 1, 1,
0.06442469, 0.05657135, 0.9375254, 0, 0.8509804, 1, 1,
0.06498561, 0.7150148, -1.067974, 0, 0.8431373, 1, 1,
0.06670003, 0.3058087, -2.023402, 0, 0.8392157, 1, 1,
0.06726964, 0.008629849, 1.796766, 0, 0.8313726, 1, 1,
0.07954159, -1.115104, 1.639599, 0, 0.827451, 1, 1,
0.08079179, 0.06695908, -1.142534, 0, 0.8196079, 1, 1,
0.08344528, -0.9732009, 2.093181, 0, 0.8156863, 1, 1,
0.0911043, -1.593771, 1.253373, 0, 0.8078431, 1, 1,
0.09181708, 0.48898, -1.005687, 0, 0.8039216, 1, 1,
0.09330727, -0.4366564, 2.767649, 0, 0.7960784, 1, 1,
0.09998362, 2.888734, 1.873524, 0, 0.7882353, 1, 1,
0.1018482, 0.2698498, 0.1641257, 0, 0.7843137, 1, 1,
0.1074374, 0.6813709, 1.262657, 0, 0.7764706, 1, 1,
0.1124828, -1.096702, 1.890804, 0, 0.772549, 1, 1,
0.1146958, -0.7155542, 6.634494, 0, 0.7647059, 1, 1,
0.1164363, 1.342706, 1.121852, 0, 0.7607843, 1, 1,
0.1190575, -0.328124, 2.136466, 0, 0.7529412, 1, 1,
0.1244981, -1.746424, 2.926888, 0, 0.7490196, 1, 1,
0.1251992, -1.698857, 2.404629, 0, 0.7411765, 1, 1,
0.1270699, -0.1834446, 3.063621, 0, 0.7372549, 1, 1,
0.1274434, -0.08844911, 0.9203763, 0, 0.7294118, 1, 1,
0.1302505, -1.182416, 3.8028, 0, 0.7254902, 1, 1,
0.1315705, 1.465241, -1.379409, 0, 0.7176471, 1, 1,
0.1354112, -0.7735165, 3.370996, 0, 0.7137255, 1, 1,
0.1400717, -1.781521, 2.94788, 0, 0.7058824, 1, 1,
0.143711, 1.333531, 1.815654, 0, 0.6980392, 1, 1,
0.1463709, -0.6472372, 2.52766, 0, 0.6941177, 1, 1,
0.1487085, 3.898055, 0.6523226, 0, 0.6862745, 1, 1,
0.1597058, 0.5924132, 0.5782596, 0, 0.682353, 1, 1,
0.1616854, 2.965262, -0.342583, 0, 0.6745098, 1, 1,
0.1649517, 0.4618303, -0.2366653, 0, 0.6705883, 1, 1,
0.1653454, 0.4784753, -1.142739, 0, 0.6627451, 1, 1,
0.1707006, 1.136075, -0.8078201, 0, 0.6588235, 1, 1,
0.1722656, 0.1092621, 2.605138, 0, 0.6509804, 1, 1,
0.1739464, 0.3484643, 1.424762, 0, 0.6470588, 1, 1,
0.1779985, -1.417645, 2.879583, 0, 0.6392157, 1, 1,
0.1815042, 1.201149, 0.9271936, 0, 0.6352941, 1, 1,
0.1983889, -0.8223778, 1.839389, 0, 0.627451, 1, 1,
0.200338, 0.5230849, -0.1550462, 0, 0.6235294, 1, 1,
0.2012111, 1.031634, -0.3206009, 0, 0.6156863, 1, 1,
0.2019785, -0.0318846, 0.6159987, 0, 0.6117647, 1, 1,
0.2048081, -0.4878579, 2.549818, 0, 0.6039216, 1, 1,
0.2112208, -0.1936247, 2.883045, 0, 0.5960785, 1, 1,
0.2119613, 0.8843254, 1.094626, 0, 0.5921569, 1, 1,
0.2127751, 0.1280754, 2.156815, 0, 0.5843138, 1, 1,
0.2149866, -0.8563879, 4.223426, 0, 0.5803922, 1, 1,
0.2323289, -0.9525027, 2.428993, 0, 0.572549, 1, 1,
0.2341871, 0.4713098, 2.366633, 0, 0.5686275, 1, 1,
0.2355455, 0.2374161, -0.06791818, 0, 0.5607843, 1, 1,
0.2380872, 0.2587345, -0.4142207, 0, 0.5568628, 1, 1,
0.2427176, -2.365428, 4.21477, 0, 0.5490196, 1, 1,
0.2435948, 0.04334502, 0.2351459, 0, 0.5450981, 1, 1,
0.2471252, 0.5410178, 2.459352, 0, 0.5372549, 1, 1,
0.2476692, -2.520592, 2.48678, 0, 0.5333334, 1, 1,
0.2510872, 1.014497, -1.504454, 0, 0.5254902, 1, 1,
0.2529624, -1.265675, 3.50434, 0, 0.5215687, 1, 1,
0.2548791, -0.705885, 2.715816, 0, 0.5137255, 1, 1,
0.2560622, 1.103302, -0.2658051, 0, 0.509804, 1, 1,
0.2572723, 0.2010236, 0.4162757, 0, 0.5019608, 1, 1,
0.2581376, -0.04411332, 4.204769, 0, 0.4941176, 1, 1,
0.2658649, 0.5569342, 0.5696735, 0, 0.4901961, 1, 1,
0.2681108, 1.010895, -0.5591147, 0, 0.4823529, 1, 1,
0.271324, -0.3272567, 2.489227, 0, 0.4784314, 1, 1,
0.2729854, -0.2906128, 2.350218, 0, 0.4705882, 1, 1,
0.2736442, -0.8701888, 2.852411, 0, 0.4666667, 1, 1,
0.2749417, 0.7274714, 0.3187729, 0, 0.4588235, 1, 1,
0.2785643, -0.6589819, 1.410177, 0, 0.454902, 1, 1,
0.2805572, 0.9053521, 0.05594638, 0, 0.4470588, 1, 1,
0.2849272, 0.02607346, 1.777463, 0, 0.4431373, 1, 1,
0.28553, -0.119927, 2.92188, 0, 0.4352941, 1, 1,
0.285545, -0.6530569, 2.382576, 0, 0.4313726, 1, 1,
0.2898311, 0.4173739, 2.489966, 0, 0.4235294, 1, 1,
0.2931291, -0.164552, 2.244148, 0, 0.4196078, 1, 1,
0.2934036, -1.430118, 3.529345, 0, 0.4117647, 1, 1,
0.2978922, -0.1379669, 2.455343, 0, 0.4078431, 1, 1,
0.3022532, -2.201886, 3.630442, 0, 0.4, 1, 1,
0.3045317, -0.04212292, 2.611127, 0, 0.3921569, 1, 1,
0.3053594, 0.3201092, 0.4818982, 0, 0.3882353, 1, 1,
0.3161397, 0.1539477, 0.5012359, 0, 0.3803922, 1, 1,
0.3169083, -0.05915501, 1.955096, 0, 0.3764706, 1, 1,
0.3194027, 0.1500469, 2.047692, 0, 0.3686275, 1, 1,
0.3208182, -2.139359, 3.667796, 0, 0.3647059, 1, 1,
0.3213479, -0.04031564, 3.030352, 0, 0.3568628, 1, 1,
0.3221589, 2.977985, 0.1192458, 0, 0.3529412, 1, 1,
0.3317419, 2.513452, 1.325663, 0, 0.345098, 1, 1,
0.3329771, -0.7524673, 3.058806, 0, 0.3411765, 1, 1,
0.3488252, -0.05746672, 1.337464, 0, 0.3333333, 1, 1,
0.3488934, -0.8665085, 3.267103, 0, 0.3294118, 1, 1,
0.3528121, -0.05647469, 0.6361715, 0, 0.3215686, 1, 1,
0.3549147, 1.66571, -0.6569574, 0, 0.3176471, 1, 1,
0.3562601, -0.3756307, 2.484494, 0, 0.3098039, 1, 1,
0.3572558, -1.174402, 3.41941, 0, 0.3058824, 1, 1,
0.3630493, -0.2985137, 2.726816, 0, 0.2980392, 1, 1,
0.3697874, 0.7618274, 1.284671, 0, 0.2901961, 1, 1,
0.3713298, 2.452817, 1.306707, 0, 0.2862745, 1, 1,
0.3731979, -1.604711, 1.834156, 0, 0.2784314, 1, 1,
0.374934, 0.89135, -0.7586917, 0, 0.2745098, 1, 1,
0.3758625, 0.6934252, 0.3515393, 0, 0.2666667, 1, 1,
0.3770858, 1.071445, -0.5904254, 0, 0.2627451, 1, 1,
0.378836, -0.1214705, 1.187776, 0, 0.254902, 1, 1,
0.3799279, 1.143345, -1.557482, 0, 0.2509804, 1, 1,
0.38063, 0.1020135, -0.8207266, 0, 0.2431373, 1, 1,
0.381569, -1.554254, 4.07625, 0, 0.2392157, 1, 1,
0.3839221, -0.08650003, 1.876032, 0, 0.2313726, 1, 1,
0.3851638, -0.5302596, 2.733952, 0, 0.227451, 1, 1,
0.391362, 1.106264, -0.5406222, 0, 0.2196078, 1, 1,
0.3916074, 1.230915, 0.497235, 0, 0.2156863, 1, 1,
0.391838, -0.734731, 2.405795, 0, 0.2078431, 1, 1,
0.3933935, -0.05438934, 3.100097, 0, 0.2039216, 1, 1,
0.3956009, -0.6940998, 2.725037, 0, 0.1960784, 1, 1,
0.400256, -0.5026529, 1.720585, 0, 0.1882353, 1, 1,
0.406797, -0.05043629, 0.50721, 0, 0.1843137, 1, 1,
0.407923, -1.315701, 2.610766, 0, 0.1764706, 1, 1,
0.4088185, -0.8339424, 4.484347, 0, 0.172549, 1, 1,
0.4100588, -0.2313934, 3.344685, 0, 0.1647059, 1, 1,
0.4116001, 2.04012, -0.1683714, 0, 0.1607843, 1, 1,
0.4132232, -0.8986775, 2.819277, 0, 0.1529412, 1, 1,
0.4138654, 1.745265, 0.7859088, 0, 0.1490196, 1, 1,
0.4150313, -0.03565423, 1.914342, 0, 0.1411765, 1, 1,
0.4159112, -0.2971822, 2.485461, 0, 0.1372549, 1, 1,
0.4195599, -1.122081, 2.481101, 0, 0.1294118, 1, 1,
0.4224106, 1.693939, 1.539695, 0, 0.1254902, 1, 1,
0.4312256, -0.944125, 1.95268, 0, 0.1176471, 1, 1,
0.4330093, 1.11621, 0.4182756, 0, 0.1137255, 1, 1,
0.4442016, -0.7357221, 2.772743, 0, 0.1058824, 1, 1,
0.4482353, 0.715432, 0.8998273, 0, 0.09803922, 1, 1,
0.4504851, -0.2563533, 1.362161, 0, 0.09411765, 1, 1,
0.4530968, 1.967999, 0.3512601, 0, 0.08627451, 1, 1,
0.4555063, -1.640744, 3.083421, 0, 0.08235294, 1, 1,
0.4584973, -0.04620133, 1.334776, 0, 0.07450981, 1, 1,
0.4591142, 0.06062407, 3.307788, 0, 0.07058824, 1, 1,
0.459456, 0.6560772, 0.7249525, 0, 0.0627451, 1, 1,
0.4604165, 0.7681601, 0.151205, 0, 0.05882353, 1, 1,
0.4673031, 0.4732099, 1.400601, 0, 0.05098039, 1, 1,
0.4702562, -1.524998, 2.191879, 0, 0.04705882, 1, 1,
0.4742295, 0.7271153, 1.220331, 0, 0.03921569, 1, 1,
0.4774663, 0.01052233, -0.632365, 0, 0.03529412, 1, 1,
0.4775908, 0.3094102, -0.2364945, 0, 0.02745098, 1, 1,
0.4817224, -0.4873407, 3.093267, 0, 0.02352941, 1, 1,
0.4821106, 0.5846165, 1.831364, 0, 0.01568628, 1, 1,
0.4873524, -1.904311, 2.124627, 0, 0.01176471, 1, 1,
0.5033031, 0.1383815, 2.375761, 0, 0.003921569, 1, 1,
0.5071739, 0.3212078, 2.384142, 0.003921569, 0, 1, 1,
0.5087497, 0.03042338, 0.1741861, 0.007843138, 0, 1, 1,
0.5105053, -0.6784469, 0.6333509, 0.01568628, 0, 1, 1,
0.5196624, -0.7613971, 1.837447, 0.01960784, 0, 1, 1,
0.5204918, -2.398904, 3.095908, 0.02745098, 0, 1, 1,
0.5208228, 0.9631613, 2.054468, 0.03137255, 0, 1, 1,
0.5223327, 1.409452, 0.7178148, 0.03921569, 0, 1, 1,
0.5264976, 2.871694, 0.4042464, 0.04313726, 0, 1, 1,
0.5275944, -0.389323, 2.659317, 0.05098039, 0, 1, 1,
0.5355327, 0.624216, -0.2672493, 0.05490196, 0, 1, 1,
0.5398233, -0.9772988, 2.714082, 0.0627451, 0, 1, 1,
0.5407293, 1.136119, 1.619616, 0.06666667, 0, 1, 1,
0.5432731, 0.7283807, 0.4665929, 0.07450981, 0, 1, 1,
0.5457024, 0.9568698, 0.7299505, 0.07843138, 0, 1, 1,
0.5475003, 0.3655859, -0.1970391, 0.08627451, 0, 1, 1,
0.5525159, -1.316212, 2.405336, 0.09019608, 0, 1, 1,
0.5538323, 0.0818636, 0.1410449, 0.09803922, 0, 1, 1,
0.5588059, 0.6151054, -0.2461362, 0.1058824, 0, 1, 1,
0.5623219, 1.884179, 0.2329889, 0.1098039, 0, 1, 1,
0.5633778, 0.3652968, 0.7452657, 0.1176471, 0, 1, 1,
0.5634252, 0.08745909, 1.995177, 0.1215686, 0, 1, 1,
0.5660326, 0.5789723, 0.3633945, 0.1294118, 0, 1, 1,
0.5825687, -0.3705076, 2.775122, 0.1333333, 0, 1, 1,
0.5878729, 0.9563209, 1.18784, 0.1411765, 0, 1, 1,
0.589548, 0.9253897, 1.423724, 0.145098, 0, 1, 1,
0.5896966, -2.333068, 3.032824, 0.1529412, 0, 1, 1,
0.5899618, -0.7796682, 2.851322, 0.1568628, 0, 1, 1,
0.5900205, -0.9467494, 1.977867, 0.1647059, 0, 1, 1,
0.5908412, 1.364695, 0.0002361993, 0.1686275, 0, 1, 1,
0.592564, -0.1517058, 1.736393, 0.1764706, 0, 1, 1,
0.5937933, 1.594797, 3.385078, 0.1803922, 0, 1, 1,
0.594574, 0.4406389, 1.101426, 0.1882353, 0, 1, 1,
0.5950874, 1.001682, 0.5469199, 0.1921569, 0, 1, 1,
0.6041489, -0.3441735, 2.583125, 0.2, 0, 1, 1,
0.6074291, 1.082963, -0.2331902, 0.2078431, 0, 1, 1,
0.6083902, 0.7340738, -0.2324987, 0.2117647, 0, 1, 1,
0.6134708, 0.2829342, -0.233323, 0.2196078, 0, 1, 1,
0.6155749, -0.1685922, 3.155181, 0.2235294, 0, 1, 1,
0.6207356, 1.462768, -0.02284256, 0.2313726, 0, 1, 1,
0.6216378, -2.149957, 2.679106, 0.2352941, 0, 1, 1,
0.6237141, -0.4245353, 3.706214, 0.2431373, 0, 1, 1,
0.6285905, -0.2052281, 3.416356, 0.2470588, 0, 1, 1,
0.628646, -0.259791, 4.181165, 0.254902, 0, 1, 1,
0.6314433, -0.9551169, 1.871754, 0.2588235, 0, 1, 1,
0.6319516, 0.4655008, 1.810194, 0.2666667, 0, 1, 1,
0.6324232, 1.661395, -1.364747, 0.2705882, 0, 1, 1,
0.633094, -0.2449872, 1.114982, 0.2784314, 0, 1, 1,
0.6376333, 1.327261, -0.1022073, 0.282353, 0, 1, 1,
0.6376357, 1.789262, 0.4694284, 0.2901961, 0, 1, 1,
0.6510699, -1.921459, 1.494681, 0.2941177, 0, 1, 1,
0.6548587, 1.102528, -1.049267, 0.3019608, 0, 1, 1,
0.6557836, -1.749382, 2.343408, 0.3098039, 0, 1, 1,
0.6578854, -0.1402024, 1.35779, 0.3137255, 0, 1, 1,
0.6597784, 1.161574, 1.376069, 0.3215686, 0, 1, 1,
0.6608897, 1.767557, 1.613701, 0.3254902, 0, 1, 1,
0.6626133, -1.408747, 3.089802, 0.3333333, 0, 1, 1,
0.6627777, 1.205724, 2.364155, 0.3372549, 0, 1, 1,
0.6667452, 0.5639576, 2.858967, 0.345098, 0, 1, 1,
0.6682255, -0.3316149, 0.902347, 0.3490196, 0, 1, 1,
0.6693857, 0.08657116, 1.198663, 0.3568628, 0, 1, 1,
0.6712103, 0.4362615, 0.2773236, 0.3607843, 0, 1, 1,
0.6758689, -0.1151784, 3.546489, 0.3686275, 0, 1, 1,
0.6777495, 1.463712, 0.6339629, 0.372549, 0, 1, 1,
0.6799471, -1.240811, 2.629344, 0.3803922, 0, 1, 1,
0.6802312, 0.9785458, 0.8265698, 0.3843137, 0, 1, 1,
0.6815768, -0.3949085, 2.120228, 0.3921569, 0, 1, 1,
0.6848316, 0.8299614, 1.235216, 0.3960784, 0, 1, 1,
0.6876689, -0.1415179, 1.166711, 0.4039216, 0, 1, 1,
0.6896314, -0.2537715, 2.98112, 0.4117647, 0, 1, 1,
0.6907203, -1.147953, 1.45519, 0.4156863, 0, 1, 1,
0.6943597, -1.027575, 4.043766, 0.4235294, 0, 1, 1,
0.6944232, -0.6146875, 2.977053, 0.427451, 0, 1, 1,
0.6956292, 1.146248, 2.006583, 0.4352941, 0, 1, 1,
0.7075444, -0.3518838, 2.179717, 0.4392157, 0, 1, 1,
0.7078691, -0.6755555, 1.457435, 0.4470588, 0, 1, 1,
0.7084784, 0.5044186, 0.05544258, 0.4509804, 0, 1, 1,
0.7119559, 0.5217797, 1.016475, 0.4588235, 0, 1, 1,
0.7150589, -0.8446081, 2.164343, 0.4627451, 0, 1, 1,
0.7155979, -1.018155, 2.038281, 0.4705882, 0, 1, 1,
0.7164703, 0.1321534, 0.7550969, 0.4745098, 0, 1, 1,
0.719453, 0.06496499, 1.637801, 0.4823529, 0, 1, 1,
0.7268887, -0.3861466, 2.18504, 0.4862745, 0, 1, 1,
0.7273071, 0.4760231, 1.791968, 0.4941176, 0, 1, 1,
0.7275512, -0.03605101, 1.187873, 0.5019608, 0, 1, 1,
0.7280452, -0.03281906, 1.290254, 0.5058824, 0, 1, 1,
0.7280881, -0.7699823, 2.524116, 0.5137255, 0, 1, 1,
0.729692, -2.475205, 0.9562689, 0.5176471, 0, 1, 1,
0.7343525, 0.2395001, 0.4734008, 0.5254902, 0, 1, 1,
0.7346007, 0.7267624, -0.8412744, 0.5294118, 0, 1, 1,
0.7391316, 0.2727624, 1.335627, 0.5372549, 0, 1, 1,
0.7391837, 0.4317814, 2.151925, 0.5411765, 0, 1, 1,
0.7421694, 0.7435648, 2.661996, 0.5490196, 0, 1, 1,
0.7445754, -0.1360955, 2.338084, 0.5529412, 0, 1, 1,
0.7458656, -1.350329, 3.731776, 0.5607843, 0, 1, 1,
0.748096, -0.2601844, 2.107387, 0.5647059, 0, 1, 1,
0.7503598, 1.107183, -0.03485129, 0.572549, 0, 1, 1,
0.7556206, 0.8046242, 0.9632888, 0.5764706, 0, 1, 1,
0.7556682, 0.8064281, -1.625279, 0.5843138, 0, 1, 1,
0.7654708, -0.4677836, 2.932368, 0.5882353, 0, 1, 1,
0.7694294, -1.054127, 2.282406, 0.5960785, 0, 1, 1,
0.7695022, 0.5150166, -0.6721091, 0.6039216, 0, 1, 1,
0.7722658, 0.6338807, 1.340797, 0.6078432, 0, 1, 1,
0.7798569, 0.0857141, 1.835608, 0.6156863, 0, 1, 1,
0.7855914, 0.3716949, -0.1680759, 0.6196079, 0, 1, 1,
0.7888969, 0.1285944, 1.347551, 0.627451, 0, 1, 1,
0.790077, -0.6597175, 2.074049, 0.6313726, 0, 1, 1,
0.7927467, 0.7394814, 0.8799775, 0.6392157, 0, 1, 1,
0.7929867, 0.7324329, 2.289334, 0.6431373, 0, 1, 1,
0.7936109, 0.5283207, -0.3605955, 0.6509804, 0, 1, 1,
0.7960531, 1.250014, -0.7700858, 0.654902, 0, 1, 1,
0.8015508, -1.188987, 2.084501, 0.6627451, 0, 1, 1,
0.8032934, -1.029577, 1.999332, 0.6666667, 0, 1, 1,
0.8081722, 1.187256, 0.4114595, 0.6745098, 0, 1, 1,
0.8108199, 1.19964, 0.1960082, 0.6784314, 0, 1, 1,
0.8137017, -0.3380429, 1.661891, 0.6862745, 0, 1, 1,
0.8152866, 1.164176, 1.779279, 0.6901961, 0, 1, 1,
0.816086, 1.242567, 1.73673, 0.6980392, 0, 1, 1,
0.8164813, 0.5710539, 2.958365, 0.7058824, 0, 1, 1,
0.816949, -0.3893455, 2.896055, 0.7098039, 0, 1, 1,
0.8173641, 0.3293327, 2.441065, 0.7176471, 0, 1, 1,
0.818529, 0.927749, -0.3753127, 0.7215686, 0, 1, 1,
0.8193744, 1.037723, 2.396608, 0.7294118, 0, 1, 1,
0.8220717, -0.977244, 2.659061, 0.7333333, 0, 1, 1,
0.8287376, -0.09930185, 2.020691, 0.7411765, 0, 1, 1,
0.8320153, 0.1341908, 1.518, 0.7450981, 0, 1, 1,
0.8322112, 0.01323738, 2.341957, 0.7529412, 0, 1, 1,
0.8327169, -1.456226, 2.503293, 0.7568628, 0, 1, 1,
0.8347675, 1.211791, 0.7092845, 0.7647059, 0, 1, 1,
0.8349357, 0.8236648, 1.486239, 0.7686275, 0, 1, 1,
0.835387, 0.357947, 1.276069, 0.7764706, 0, 1, 1,
0.8367544, -0.3248988, 1.575072, 0.7803922, 0, 1, 1,
0.8452569, 0.1763259, 0.7202933, 0.7882353, 0, 1, 1,
0.8491648, -0.04025094, 2.501461, 0.7921569, 0, 1, 1,
0.8500425, -0.5800367, 3.463647, 0.8, 0, 1, 1,
0.850163, -1.190902, 4.497415, 0.8078431, 0, 1, 1,
0.8558074, 1.051333, 1.187202, 0.8117647, 0, 1, 1,
0.8583342, -0.1831681, 0.9138511, 0.8196079, 0, 1, 1,
0.8596306, -0.5320387, 1.700498, 0.8235294, 0, 1, 1,
0.8619254, 0.1356259, 1.742698, 0.8313726, 0, 1, 1,
0.870045, -0.6671848, 0.5458011, 0.8352941, 0, 1, 1,
0.8794023, -1.235007, 4.150671, 0.8431373, 0, 1, 1,
0.881743, 0.4083286, 1.079543, 0.8470588, 0, 1, 1,
0.8840698, -0.02250415, 2.041531, 0.854902, 0, 1, 1,
0.884736, 0.3232236, 0.6543671, 0.8588235, 0, 1, 1,
0.8877765, -2.406219, 3.248648, 0.8666667, 0, 1, 1,
0.8980232, 1.513767, 0.4350725, 0.8705882, 0, 1, 1,
0.9039207, 0.7081208, 1.482262, 0.8784314, 0, 1, 1,
0.904565, -0.3012127, 0.2458068, 0.8823529, 0, 1, 1,
0.9077624, 1.104048, 1.389415, 0.8901961, 0, 1, 1,
0.9119391, -1.913873, 3.358122, 0.8941177, 0, 1, 1,
0.912985, 1.737326, -0.247721, 0.9019608, 0, 1, 1,
0.9140539, -0.4116192, 1.267172, 0.9098039, 0, 1, 1,
0.9143946, -1.007381, 4.847838, 0.9137255, 0, 1, 1,
0.9179085, -0.1710279, 1.588839, 0.9215686, 0, 1, 1,
0.9256962, 1.184228, 0.4258602, 0.9254902, 0, 1, 1,
0.9262446, -0.659908, 3.016757, 0.9333333, 0, 1, 1,
0.9435136, 0.9053645, -0.3576434, 0.9372549, 0, 1, 1,
0.9439397, 0.09606121, 2.655548, 0.945098, 0, 1, 1,
0.9521402, 0.3555656, 0.6456439, 0.9490196, 0, 1, 1,
0.9523695, 0.1845548, 0.7383476, 0.9568627, 0, 1, 1,
0.955714, 0.4043693, -0.2731923, 0.9607843, 0, 1, 1,
0.9582187, -0.6543688, 2.583308, 0.9686275, 0, 1, 1,
0.9638044, -2.425559, 3.543441, 0.972549, 0, 1, 1,
0.967101, -0.0207417, 3.591484, 0.9803922, 0, 1, 1,
0.9676147, -1.332619, 1.549663, 0.9843137, 0, 1, 1,
0.971891, -0.3611357, 1.656711, 0.9921569, 0, 1, 1,
0.9778303, 1.03995, -0.07907283, 0.9960784, 0, 1, 1,
0.9798638, -2.0979, 2.094248, 1, 0, 0.9960784, 1,
0.9826314, -0.2125451, 2.143645, 1, 0, 0.9882353, 1,
0.9831833, -0.3786376, 2.052518, 1, 0, 0.9843137, 1,
0.9853445, 0.5873068, 1.164412, 1, 0, 0.9764706, 1,
0.9897809, 0.08177391, 0.3013017, 1, 0, 0.972549, 1,
0.9898685, 1.544774, 0.05978289, 1, 0, 0.9647059, 1,
0.9954159, -0.5978035, 1.352296, 1, 0, 0.9607843, 1,
0.9962138, 1.409245, -1.014163, 1, 0, 0.9529412, 1,
1.013543, -0.5815256, 1.849525, 1, 0, 0.9490196, 1,
1.014717, -0.6045234, 3.907794, 1, 0, 0.9411765, 1,
1.01603, -1.147625, 2.82707, 1, 0, 0.9372549, 1,
1.023283, 0.1674579, 0.9554404, 1, 0, 0.9294118, 1,
1.035085, 1.241987, 0.8968292, 1, 0, 0.9254902, 1,
1.035709, -0.07939278, 1.404006, 1, 0, 0.9176471, 1,
1.038692, -0.5676441, 2.120776, 1, 0, 0.9137255, 1,
1.043756, -1.458341, 2.325326, 1, 0, 0.9058824, 1,
1.044629, -1.095042, 1.789063, 1, 0, 0.9019608, 1,
1.055781, -0.6925741, 3.785271, 1, 0, 0.8941177, 1,
1.055839, 2.365432, 0.9020458, 1, 0, 0.8862745, 1,
1.057135, -0.9171336, 0.8847538, 1, 0, 0.8823529, 1,
1.057149, -0.5177131, 1.424656, 1, 0, 0.8745098, 1,
1.05814, -0.1956164, -0.05534751, 1, 0, 0.8705882, 1,
1.058493, 1.058291, 0.7705387, 1, 0, 0.8627451, 1,
1.067751, -2.023735, 2.632454, 1, 0, 0.8588235, 1,
1.069743, -0.7695923, 3.491464, 1, 0, 0.8509804, 1,
1.073874, 0.4029638, 2.257069, 1, 0, 0.8470588, 1,
1.076856, 1.437323, 1.706856, 1, 0, 0.8392157, 1,
1.077285, 0.3197103, 0.3419799, 1, 0, 0.8352941, 1,
1.083335, 0.06229772, 0.6131306, 1, 0, 0.827451, 1,
1.083674, -0.6364205, 2.930652, 1, 0, 0.8235294, 1,
1.088531, 0.1204343, 0.9259669, 1, 0, 0.8156863, 1,
1.103504, -0.1169055, 2.025879, 1, 0, 0.8117647, 1,
1.107387, 0.1751007, 0.08267431, 1, 0, 0.8039216, 1,
1.114672, 0.8232381, 1.634534, 1, 0, 0.7960784, 1,
1.114973, 0.9585588, 1.116354, 1, 0, 0.7921569, 1,
1.115779, 1.62776, 0.2765556, 1, 0, 0.7843137, 1,
1.115839, 1.051422, -0.8724554, 1, 0, 0.7803922, 1,
1.117373, -0.6210469, 1.450898, 1, 0, 0.772549, 1,
1.124063, -0.4102842, 1.920771, 1, 0, 0.7686275, 1,
1.127837, -1.61964, 4.379748, 1, 0, 0.7607843, 1,
1.140427, 0.2111024, 0.3003025, 1, 0, 0.7568628, 1,
1.1434, -1.177007, 2.02144, 1, 0, 0.7490196, 1,
1.148077, 1.385491, 2.053309, 1, 0, 0.7450981, 1,
1.151268, 0.05480911, 2.390325, 1, 0, 0.7372549, 1,
1.15463, -0.2511815, 1.095976, 1, 0, 0.7333333, 1,
1.156747, -0.4934809, 1.66105, 1, 0, 0.7254902, 1,
1.175317, 0.1285143, 0.09211659, 1, 0, 0.7215686, 1,
1.180669, 1.418159, 0.6861791, 1, 0, 0.7137255, 1,
1.185006, -0.05193738, 1.48296, 1, 0, 0.7098039, 1,
1.185148, 0.2642633, 2.329512, 1, 0, 0.7019608, 1,
1.187578, -1.944351, 1.613971, 1, 0, 0.6941177, 1,
1.19366, -2.791925, 1.933762, 1, 0, 0.6901961, 1,
1.196881, 0.5209308, -1.579652, 1, 0, 0.682353, 1,
1.208713, -1.329854, 2.638853, 1, 0, 0.6784314, 1,
1.212003, -0.1534541, 1.727598, 1, 0, 0.6705883, 1,
1.215554, -1.216648, 2.397028, 1, 0, 0.6666667, 1,
1.221769, 1.673398, 1.449326, 1, 0, 0.6588235, 1,
1.222153, -0.6460522, 1.191067, 1, 0, 0.654902, 1,
1.225093, -0.04002696, 2.510459, 1, 0, 0.6470588, 1,
1.230979, 0.2963067, 1.358485, 1, 0, 0.6431373, 1,
1.237582, 1.839334, 0.5019518, 1, 0, 0.6352941, 1,
1.241477, 0.371125, 1.303698, 1, 0, 0.6313726, 1,
1.241833, -0.9199401, 1.620463, 1, 0, 0.6235294, 1,
1.243184, 1.850423, 0.3388096, 1, 0, 0.6196079, 1,
1.250554, 0.6970851, 1.930951, 1, 0, 0.6117647, 1,
1.263495, -0.6254406, 0.4352569, 1, 0, 0.6078432, 1,
1.268925, -0.8103957, 1.93557, 1, 0, 0.6, 1,
1.274615, -1.188537, 0.82228, 1, 0, 0.5921569, 1,
1.283697, -0.1435763, 1.045311, 1, 0, 0.5882353, 1,
1.283982, 0.7361175, 1.405646, 1, 0, 0.5803922, 1,
1.286091, -0.72969, 1.098666, 1, 0, 0.5764706, 1,
1.293065, -0.3930551, 3.577673, 1, 0, 0.5686275, 1,
1.293358, 0.05833746, 1.034339, 1, 0, 0.5647059, 1,
1.295919, 0.5073364, 0.8490373, 1, 0, 0.5568628, 1,
1.301103, 0.4897148, 3.190085, 1, 0, 0.5529412, 1,
1.306469, 1.462111, 1.549818, 1, 0, 0.5450981, 1,
1.306507, 1.434052, 0.2741018, 1, 0, 0.5411765, 1,
1.310681, 0.7053189, 1.73888, 1, 0, 0.5333334, 1,
1.32404, 0.4796374, 0.7336645, 1, 0, 0.5294118, 1,
1.331029, 0.8129713, 2.358069, 1, 0, 0.5215687, 1,
1.341238, -1.144755, 3.63802, 1, 0, 0.5176471, 1,
1.349623, 1.488786, 0.4754333, 1, 0, 0.509804, 1,
1.360471, -0.2627543, 2.251289, 1, 0, 0.5058824, 1,
1.364979, 0.5190858, -0.1997183, 1, 0, 0.4980392, 1,
1.365683, -1.495432, 3.076241, 1, 0, 0.4901961, 1,
1.380251, 0.4927016, 2.099007, 1, 0, 0.4862745, 1,
1.382826, -0.1972527, 0.3724683, 1, 0, 0.4784314, 1,
1.388181, -2.007489, 1.134923, 1, 0, 0.4745098, 1,
1.391106, 0.4065148, -0.05955108, 1, 0, 0.4666667, 1,
1.393158, -1.649842, 1.621046, 1, 0, 0.4627451, 1,
1.396275, 0.1062396, 1.276841, 1, 0, 0.454902, 1,
1.413675, -0.3408511, 1.747625, 1, 0, 0.4509804, 1,
1.41522, 1.04894, 1.384722, 1, 0, 0.4431373, 1,
1.421807, 0.4608598, 0.781329, 1, 0, 0.4392157, 1,
1.428306, 1.549304, 2.597951, 1, 0, 0.4313726, 1,
1.43293, 1.318422, 0.6950896, 1, 0, 0.427451, 1,
1.444761, 0.8107501, 1.376469, 1, 0, 0.4196078, 1,
1.461937, -0.07741705, 2.739487, 1, 0, 0.4156863, 1,
1.480669, -0.6056856, 1.60164, 1, 0, 0.4078431, 1,
1.49674, 0.6335635, 2.925061, 1, 0, 0.4039216, 1,
1.499166, 0.9646531, 1.548691, 1, 0, 0.3960784, 1,
1.502642, 0.4500545, 1.096075, 1, 0, 0.3882353, 1,
1.515022, 0.9854367, 0.6856487, 1, 0, 0.3843137, 1,
1.531447, -0.7144897, 1.296709, 1, 0, 0.3764706, 1,
1.533736, -0.8367367, 3.732127, 1, 0, 0.372549, 1,
1.535883, -0.4799381, 2.913166, 1, 0, 0.3647059, 1,
1.544668, -0.1578151, 2.077423, 1, 0, 0.3607843, 1,
1.567466, 1.764883, -0.9618052, 1, 0, 0.3529412, 1,
1.569627, 1.056203, 1.928756, 1, 0, 0.3490196, 1,
1.57145, -0.6590105, 1.024171, 1, 0, 0.3411765, 1,
1.586849, -1.609852, 0.2196897, 1, 0, 0.3372549, 1,
1.600526, 0.3914807, 1.476972, 1, 0, 0.3294118, 1,
1.608225, 1.702389, 0.0686055, 1, 0, 0.3254902, 1,
1.620109, 2.091856, 2.156199, 1, 0, 0.3176471, 1,
1.639931, -1.617358, 1.716709, 1, 0, 0.3137255, 1,
1.662779, 1.57954, 1.523993, 1, 0, 0.3058824, 1,
1.662807, 0.2911826, 3.983021, 1, 0, 0.2980392, 1,
1.66533, 0.4927485, 0.6999489, 1, 0, 0.2941177, 1,
1.669755, -1.533307, 1.484423, 1, 0, 0.2862745, 1,
1.670105, 0.2815689, 1.068182, 1, 0, 0.282353, 1,
1.685639, 0.7102647, 2.083912, 1, 0, 0.2745098, 1,
1.692184, -0.007657477, 1.760747, 1, 0, 0.2705882, 1,
1.697538, -0.6355246, 2.373096, 1, 0, 0.2627451, 1,
1.71403, -0.05234287, 1.602879, 1, 0, 0.2588235, 1,
1.7259, -0.7913542, 1.982621, 1, 0, 0.2509804, 1,
1.730185, 0.1980542, 1.120482, 1, 0, 0.2470588, 1,
1.731405, -1.437792, 0.9989571, 1, 0, 0.2392157, 1,
1.7324, 1.308588, 0.1632657, 1, 0, 0.2352941, 1,
1.735153, 1.323508, 1.046667, 1, 0, 0.227451, 1,
1.745132, 0.2494455, 2.157593, 1, 0, 0.2235294, 1,
1.757437, 1.838342, 0.7834561, 1, 0, 0.2156863, 1,
1.768466, -0.6741774, 2.094293, 1, 0, 0.2117647, 1,
1.778175, -1.25965, 1.485665, 1, 0, 0.2039216, 1,
1.78387, 0.7094957, 1.123449, 1, 0, 0.1960784, 1,
1.785696, 1.653907, -0.03663207, 1, 0, 0.1921569, 1,
1.79486, -1.464953, 1.324589, 1, 0, 0.1843137, 1,
1.81998, -0.2495281, 0.8615758, 1, 0, 0.1803922, 1,
1.826717, 0.4850365, 0.7868468, 1, 0, 0.172549, 1,
1.833965, 0.3468509, 3.609903, 1, 0, 0.1686275, 1,
1.836321, 0.1816226, -0.02898421, 1, 0, 0.1607843, 1,
1.842947, 1.011658, -0.2763919, 1, 0, 0.1568628, 1,
1.875253, -0.5797705, 2.44945, 1, 0, 0.1490196, 1,
1.882965, 1.692459, 1.091854, 1, 0, 0.145098, 1,
1.892538, -0.306674, 0.9205027, 1, 0, 0.1372549, 1,
1.980909, -2.445655, 1.581254, 1, 0, 0.1333333, 1,
1.990359, 0.9888773, 0.4022383, 1, 0, 0.1254902, 1,
2.026836, -0.6392081, 1.629732, 1, 0, 0.1215686, 1,
2.078089, -0.004704407, 1.032769, 1, 0, 0.1137255, 1,
2.093306, 0.6688246, 1.515584, 1, 0, 0.1098039, 1,
2.133219, -0.2717912, -0.09023425, 1, 0, 0.1019608, 1,
2.171205, -1.007118, 2.647003, 1, 0, 0.09411765, 1,
2.179413, -1.1364, 1.405153, 1, 0, 0.09019608, 1,
2.213489, 0.8942561, 1.280515, 1, 0, 0.08235294, 1,
2.346813, 1.297418, 0.1972497, 1, 0, 0.07843138, 1,
2.369578, 1.597093, 0.7297401, 1, 0, 0.07058824, 1,
2.402027, -1.049074, 2.739645, 1, 0, 0.06666667, 1,
2.402415, 0.0310142, 0.4938843, 1, 0, 0.05882353, 1,
2.415275, -0.02269307, 0.8454264, 1, 0, 0.05490196, 1,
2.469412, 0.8394491, 2.455621, 1, 0, 0.04705882, 1,
2.484834, -0.2075778, 2.180409, 1, 0, 0.04313726, 1,
2.538772, 0.5534079, 1.03338, 1, 0, 0.03529412, 1,
2.685076, 1.749221, 1.328696, 1, 0, 0.03137255, 1,
2.694217, 1.223605, 2.568206, 1, 0, 0.02352941, 1,
2.77433, 0.4775285, 1.129143, 1, 0, 0.01960784, 1,
2.933928, -0.4162639, 1.746536, 1, 0, 0.01176471, 1,
3.370113, 1.178211, 2.561032, 1, 0, 0.007843138, 1
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
0.03334236, -4.434349, -7.561275, 0, -0.5, 0.5, 0.5,
0.03334236, -4.434349, -7.561275, 1, -0.5, 0.5, 0.5,
0.03334236, -4.434349, -7.561275, 1, 1.5, 0.5, 0.5,
0.03334236, -4.434349, -7.561275, 0, 1.5, 0.5, 0.5
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
-4.434593, 0.3356763, -7.561275, 0, -0.5, 0.5, 0.5,
-4.434593, 0.3356763, -7.561275, 1, -0.5, 0.5, 0.5,
-4.434593, 0.3356763, -7.561275, 1, 1.5, 0.5, 0.5,
-4.434593, 0.3356763, -7.561275, 0, 1.5, 0.5, 0.5
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
-4.434593, -4.434349, 0.5653324, 0, -0.5, 0.5, 0.5,
-4.434593, -4.434349, 0.5653324, 1, -0.5, 0.5, 0.5,
-4.434593, -4.434349, 0.5653324, 1, 1.5, 0.5, 0.5,
-4.434593, -4.434349, 0.5653324, 0, 1.5, 0.5, 0.5
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
-3, -3.333574, -5.685905,
3, -3.333574, -5.685905,
-3, -3.333574, -5.685905,
-3, -3.517036, -5.998466,
-2, -3.333574, -5.685905,
-2, -3.517036, -5.998466,
-1, -3.333574, -5.685905,
-1, -3.517036, -5.998466,
0, -3.333574, -5.685905,
0, -3.517036, -5.998466,
1, -3.333574, -5.685905,
1, -3.517036, -5.998466,
2, -3.333574, -5.685905,
2, -3.517036, -5.998466,
3, -3.333574, -5.685905,
3, -3.517036, -5.998466
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
-3, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
-3, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
-3, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
-3, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
-2, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
-2, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
-2, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
-2, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
-1, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
-1, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
-1, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
-1, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
0, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
0, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
0, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
0, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
1, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
1, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
1, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
1, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
2, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
2, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
2, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
2, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5,
3, -3.883961, -6.62359, 0, -0.5, 0.5, 0.5,
3, -3.883961, -6.62359, 1, -0.5, 0.5, 0.5,
3, -3.883961, -6.62359, 1, 1.5, 0.5, 0.5,
3, -3.883961, -6.62359, 0, 1.5, 0.5, 0.5
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
-3.403531, -2, -5.685905,
-3.403531, 2, -5.685905,
-3.403531, -2, -5.685905,
-3.575375, -2, -5.998466,
-3.403531, 0, -5.685905,
-3.575375, 0, -5.998466,
-3.403531, 2, -5.685905,
-3.575375, 2, -5.998466
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
-3.919062, -2, -6.62359, 0, -0.5, 0.5, 0.5,
-3.919062, -2, -6.62359, 1, -0.5, 0.5, 0.5,
-3.919062, -2, -6.62359, 1, 1.5, 0.5, 0.5,
-3.919062, -2, -6.62359, 0, 1.5, 0.5, 0.5,
-3.919062, 0, -6.62359, 0, -0.5, 0.5, 0.5,
-3.919062, 0, -6.62359, 1, -0.5, 0.5, 0.5,
-3.919062, 0, -6.62359, 1, 1.5, 0.5, 0.5,
-3.919062, 0, -6.62359, 0, 1.5, 0.5, 0.5,
-3.919062, 2, -6.62359, 0, -0.5, 0.5, 0.5,
-3.919062, 2, -6.62359, 1, -0.5, 0.5, 0.5,
-3.919062, 2, -6.62359, 1, 1.5, 0.5, 0.5,
-3.919062, 2, -6.62359, 0, 1.5, 0.5, 0.5
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
-3.403531, -3.333574, -4,
-3.403531, -3.333574, 6,
-3.403531, -3.333574, -4,
-3.575375, -3.517036, -4,
-3.403531, -3.333574, -2,
-3.575375, -3.517036, -2,
-3.403531, -3.333574, 0,
-3.575375, -3.517036, 0,
-3.403531, -3.333574, 2,
-3.575375, -3.517036, 2,
-3.403531, -3.333574, 4,
-3.575375, -3.517036, 4,
-3.403531, -3.333574, 6,
-3.575375, -3.517036, 6
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
-3.919062, -3.883961, -4, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, -4, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, -4, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, -4, 0, 1.5, 0.5, 0.5,
-3.919062, -3.883961, -2, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, -2, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, -2, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, -2, 0, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 0, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 0, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 0, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 0, 0, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 2, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 2, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 2, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 2, 0, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 4, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 4, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 4, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 4, 0, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 6, 0, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 6, 1, -0.5, 0.5, 0.5,
-3.919062, -3.883961, 6, 1, 1.5, 0.5, 0.5,
-3.919062, -3.883961, 6, 0, 1.5, 0.5, 0.5
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
-3.403531, -3.333574, -5.685905,
-3.403531, 4.004926, -5.685905,
-3.403531, -3.333574, 6.816569,
-3.403531, 4.004926, 6.816569,
-3.403531, -3.333574, -5.685905,
-3.403531, -3.333574, 6.816569,
-3.403531, 4.004926, -5.685905,
-3.403531, 4.004926, 6.816569,
-3.403531, -3.333574, -5.685905,
3.470216, -3.333574, -5.685905,
-3.403531, -3.333574, 6.816569,
3.470216, -3.333574, 6.816569,
-3.403531, 4.004926, -5.685905,
3.470216, 4.004926, -5.685905,
-3.403531, 4.004926, 6.816569,
3.470216, 4.004926, 6.816569,
3.470216, -3.333574, -5.685905,
3.470216, 4.004926, -5.685905,
3.470216, -3.333574, 6.816569,
3.470216, 4.004926, 6.816569,
3.470216, -3.333574, -5.685905,
3.470216, -3.333574, 6.816569,
3.470216, 4.004926, -5.685905,
3.470216, 4.004926, 6.816569
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
var radius = 8.567249;
var distance = 38.11666;
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
mvMatrix.translate( -0.03334236, -0.3356763, -0.5653324 );
mvMatrix.scale( 1.347602, 1.262258, 0.7408996 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.11666);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
methyl_ester_methyl_<-read.table("methyl_ester_methyl_.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-methyl_ester_methyl_$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester_methyl_' not found
```

```r
y<-methyl_ester_methyl_$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester_methyl_' not found
```

```r
z<-methyl_ester_methyl_$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester_methyl_' not found
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
-3.303428, -1.362957, -0.9421248, 0, 0, 1, 1, 1,
-2.980193, -0.6216443, -1.357638, 1, 0, 0, 1, 1,
-2.907181, 1.669646, -0.2455253, 1, 0, 0, 1, 1,
-2.835596, 0.05205591, 0.6781498, 1, 0, 0, 1, 1,
-2.804345, 0.4678022, -1.497978, 1, 0, 0, 1, 1,
-2.798287, 0.2148599, -1.893646, 1, 0, 0, 1, 1,
-2.776653, -0.1954919, -0.6873097, 0, 0, 0, 1, 1,
-2.681875, -0.7473252, 0.3544959, 0, 0, 0, 1, 1,
-2.515085, -0.4810943, -0.7118005, 0, 0, 0, 1, 1,
-2.51447, 1.487565, -0.6869971, 0, 0, 0, 1, 1,
-2.513124, -0.3823575, -0.01752521, 0, 0, 0, 1, 1,
-2.456743, -1.543744, -2.758024, 0, 0, 0, 1, 1,
-2.432333, -0.7959143, -3.430445, 0, 0, 0, 1, 1,
-2.426428, -1.241076, -0.9076887, 1, 1, 1, 1, 1,
-2.420913, -1.843414, -0.2335069, 1, 1, 1, 1, 1,
-2.359826, 0.5437114, -1.122237, 1, 1, 1, 1, 1,
-2.342972, -0.6450012, -1.529886, 1, 1, 1, 1, 1,
-2.320729, -0.7043629, -1.600509, 1, 1, 1, 1, 1,
-2.311456, -0.513316, -2.371125, 1, 1, 1, 1, 1,
-2.285281, 0.2731228, -1.76598, 1, 1, 1, 1, 1,
-2.269993, 0.3414893, -2.341, 1, 1, 1, 1, 1,
-2.211203, 0.004531324, -3.030946, 1, 1, 1, 1, 1,
-2.196786, 0.3332491, -1.194384, 1, 1, 1, 1, 1,
-2.183794, 0.1361097, -2.561338, 1, 1, 1, 1, 1,
-2.181467, -0.3987466, -1.313985, 1, 1, 1, 1, 1,
-2.178827, 1.494331, -0.7089915, 1, 1, 1, 1, 1,
-2.158088, -1.776855, -0.1219196, 1, 1, 1, 1, 1,
-2.153935, 1.292817, -1.086922, 1, 1, 1, 1, 1,
-2.134734, -0.112387, -1.243451, 0, 0, 1, 1, 1,
-2.112582, -1.517367, -3.120647, 1, 0, 0, 1, 1,
-2.09685, 1.320083, -0.8954358, 1, 0, 0, 1, 1,
-2.081427, 0.2349063, -1.003877, 1, 0, 0, 1, 1,
-2.073062, 0.2845873, -2.635271, 1, 0, 0, 1, 1,
-2.06674, 0.4163963, -1.681856, 1, 0, 0, 1, 1,
-2.058685, -0.2403217, -0.3305081, 0, 0, 0, 1, 1,
-2.051891, -0.7554321, -1.706304, 0, 0, 0, 1, 1,
-2.017541, -0.9426873, -3.050866, 0, 0, 0, 1, 1,
-2.006899, 0.2077541, -1.298179, 0, 0, 0, 1, 1,
-2.00522, 0.8592203, -2.94911, 0, 0, 0, 1, 1,
-1.992164, -1.36602, -3.370128, 0, 0, 0, 1, 1,
-1.938844, 0.2475051, -0.9698148, 0, 0, 0, 1, 1,
-1.92936, 0.1153641, -0.86141, 1, 1, 1, 1, 1,
-1.896349, 1.314338, -0.6202623, 1, 1, 1, 1, 1,
-1.894583, -3.116718, -1.094327, 1, 1, 1, 1, 1,
-1.889829, -0.3545842, -3.56803, 1, 1, 1, 1, 1,
-1.875117, 2.406667, -1.110168, 1, 1, 1, 1, 1,
-1.861709, -0.2259055, -0.7899405, 1, 1, 1, 1, 1,
-1.818088, 1.587853, -0.7102064, 1, 1, 1, 1, 1,
-1.805551, -0.6330395, -1.539752, 1, 1, 1, 1, 1,
-1.805324, 0.05549408, -0.9066148, 1, 1, 1, 1, 1,
-1.80407, 0.1712895, -1.925906, 1, 1, 1, 1, 1,
-1.802768, 1.376786, -0.8345523, 1, 1, 1, 1, 1,
-1.798269, 0.2277293, 0.5737947, 1, 1, 1, 1, 1,
-1.788239, -1.227748, -4.448441, 1, 1, 1, 1, 1,
-1.786379, -1.787649, -3.060103, 1, 1, 1, 1, 1,
-1.775808, 1.020178, -0.71898, 1, 1, 1, 1, 1,
-1.774006, -0.1443558, -0.8102317, 0, 0, 1, 1, 1,
-1.754547, 0.07799348, -1.578291, 1, 0, 0, 1, 1,
-1.724014, -0.07953949, -2.997185, 1, 0, 0, 1, 1,
-1.718192, 0.04350631, -0.7533308, 1, 0, 0, 1, 1,
-1.699165, -1.005317, -1.897558, 1, 0, 0, 1, 1,
-1.695906, 1.229549, -0.1364706, 1, 0, 0, 1, 1,
-1.690548, -1.42954, -4.135518, 0, 0, 0, 1, 1,
-1.683633, 0.7999251, 0.5081168, 0, 0, 0, 1, 1,
-1.6807, 0.2331611, 0.6449678, 0, 0, 0, 1, 1,
-1.677593, 0.935993, 0.5517891, 0, 0, 0, 1, 1,
-1.669093, 1.351908, 0.3426265, 0, 0, 0, 1, 1,
-1.659671, -1.830123, -1.824651, 0, 0, 0, 1, 1,
-1.656585, 0.4801183, -1.396721, 0, 0, 0, 1, 1,
-1.654627, -1.841728, -1.400326, 1, 1, 1, 1, 1,
-1.640934, 1.840342, -0.9888191, 1, 1, 1, 1, 1,
-1.635671, -2.176302, -2.978738, 1, 1, 1, 1, 1,
-1.634292, 0.08739533, -1.008256, 1, 1, 1, 1, 1,
-1.616654, 0.4746696, -1.863709, 1, 1, 1, 1, 1,
-1.60245, -0.6871414, -1.676365, 1, 1, 1, 1, 1,
-1.595989, -1.433578, -2.520297, 1, 1, 1, 1, 1,
-1.59497, 0.4647992, -2.183208, 1, 1, 1, 1, 1,
-1.578201, 1.05264, -1.49691, 1, 1, 1, 1, 1,
-1.57259, -0.8172569, -2.935802, 1, 1, 1, 1, 1,
-1.53663, 0.73706, -0.609428, 1, 1, 1, 1, 1,
-1.523005, -1.592718, -1.653494, 1, 1, 1, 1, 1,
-1.521445, -1.452257, -0.05364959, 1, 1, 1, 1, 1,
-1.519245, -0.208665, -1.599461, 1, 1, 1, 1, 1,
-1.504526, -1.354218, -2.859552, 1, 1, 1, 1, 1,
-1.496345, 0.1766108, -2.444848, 0, 0, 1, 1, 1,
-1.491611, -0.3668277, -2.226434, 1, 0, 0, 1, 1,
-1.486421, -0.5985902, -2.391934, 1, 0, 0, 1, 1,
-1.47869, -1.081871, -2.966197, 1, 0, 0, 1, 1,
-1.471755, -0.4739646, -2.333238, 1, 0, 0, 1, 1,
-1.46478, 1.224377, -2.502993, 1, 0, 0, 1, 1,
-1.456074, -0.5115798, -3.423783, 0, 0, 0, 1, 1,
-1.45058, 1.085401, -1.354185, 0, 0, 0, 1, 1,
-1.446061, 0.3737421, -0.2853778, 0, 0, 0, 1, 1,
-1.439401, 0.1690284, -0.9728063, 0, 0, 0, 1, 1,
-1.436775, -0.01663144, -2.686378, 0, 0, 0, 1, 1,
-1.436269, -0.3231175, -1.717119, 0, 0, 0, 1, 1,
-1.43231, 0.1234904, -1.11465, 0, 0, 0, 1, 1,
-1.43228, -0.3492256, -1.70388, 1, 1, 1, 1, 1,
-1.427269, -0.2437565, -1.165487, 1, 1, 1, 1, 1,
-1.423342, 0.5864038, 0.117291, 1, 1, 1, 1, 1,
-1.415106, -0.9643512, -3.0307, 1, 1, 1, 1, 1,
-1.413785, -0.3364111, -0.1027841, 1, 1, 1, 1, 1,
-1.396465, 1.237127, -2.075325, 1, 1, 1, 1, 1,
-1.385746, -0.863088, -1.247933, 1, 1, 1, 1, 1,
-1.381937, 1.328437, 0.4057868, 1, 1, 1, 1, 1,
-1.373685, 0.3073604, -0.5205158, 1, 1, 1, 1, 1,
-1.366516, -0.4755427, -1.04015, 1, 1, 1, 1, 1,
-1.345733, 0.2256911, -2.274346, 1, 1, 1, 1, 1,
-1.343495, 1.467168, -1.083343, 1, 1, 1, 1, 1,
-1.327845, -0.1387169, -3.587893, 1, 1, 1, 1, 1,
-1.320928, -0.6363475, -3.379793, 1, 1, 1, 1, 1,
-1.309504, -0.9740711, -1.804208, 1, 1, 1, 1, 1,
-1.305163, 0.3051125, -1.824461, 0, 0, 1, 1, 1,
-1.295005, -0.7253065, -2.990431, 1, 0, 0, 1, 1,
-1.290192, -0.8076626, -2.759519, 1, 0, 0, 1, 1,
-1.284068, 0.07443132, -2.902325, 1, 0, 0, 1, 1,
-1.2826, -0.9990746, -1.838649, 1, 0, 0, 1, 1,
-1.282208, 0.07373732, 0.5960426, 1, 0, 0, 1, 1,
-1.278372, 0.1050573, -2.687239, 0, 0, 0, 1, 1,
-1.276301, 0.05842387, -1.432939, 0, 0, 0, 1, 1,
-1.267169, 0.3507357, -1.189576, 0, 0, 0, 1, 1,
-1.266611, 1.455819, -1.518698, 0, 0, 0, 1, 1,
-1.257489, 0.8023621, -0.2773443, 0, 0, 0, 1, 1,
-1.248598, 0.6327959, -0.5470949, 0, 0, 0, 1, 1,
-1.227987, 0.5170742, -1.769569, 0, 0, 0, 1, 1,
-1.22665, -0.03348088, -0.6559453, 1, 1, 1, 1, 1,
-1.220306, 0.3099838, -0.6990808, 1, 1, 1, 1, 1,
-1.214622, -0.8940929, -3.196363, 1, 1, 1, 1, 1,
-1.21391, 1.976474, -1.557777, 1, 1, 1, 1, 1,
-1.196739, 0.1855962, -0.9496242, 1, 1, 1, 1, 1,
-1.184538, -0.2400472, -2.007179, 1, 1, 1, 1, 1,
-1.183803, -0.7915069, -3.561666, 1, 1, 1, 1, 1,
-1.178988, 0.2536435, -2.630396, 1, 1, 1, 1, 1,
-1.178855, 0.5189138, -0.6073672, 1, 1, 1, 1, 1,
-1.17496, 0.9379197, -0.7836421, 1, 1, 1, 1, 1,
-1.172708, -1.296931, -1.915326, 1, 1, 1, 1, 1,
-1.166036, 0.8469199, -1.051095, 1, 1, 1, 1, 1,
-1.163035, -1.666129, -1.166785, 1, 1, 1, 1, 1,
-1.15807, -0.7665152, -3.535692, 1, 1, 1, 1, 1,
-1.154562, 0.890304, -1.429102, 1, 1, 1, 1, 1,
-1.152617, -0.4070674, -1.751675, 0, 0, 1, 1, 1,
-1.15167, 0.0402438, -2.251781, 1, 0, 0, 1, 1,
-1.151285, -0.3283125, -1.975662, 1, 0, 0, 1, 1,
-1.14002, 0.3915744, -1.198697, 1, 0, 0, 1, 1,
-1.136093, -1.712735, -1.020378, 1, 0, 0, 1, 1,
-1.125234, -0.266048, -1.152541, 1, 0, 0, 1, 1,
-1.120835, -1.738858, -3.442594, 0, 0, 0, 1, 1,
-1.102225, -1.370177, -1.937122, 0, 0, 0, 1, 1,
-1.100283, 0.9231433, -0.6824768, 0, 0, 0, 1, 1,
-1.099634, -0.3311826, -1.013309, 0, 0, 0, 1, 1,
-1.097946, 0.6942858, -0.2166841, 0, 0, 0, 1, 1,
-1.093637, -0.227473, -1.191593, 0, 0, 0, 1, 1,
-1.088531, 0.06715506, -2.260939, 0, 0, 0, 1, 1,
-1.087506, 0.511456, -1.174409, 1, 1, 1, 1, 1,
-1.084068, -1.546053, -4.087715, 1, 1, 1, 1, 1,
-1.076048, 0.3623274, -2.909774, 1, 1, 1, 1, 1,
-1.072874, 0.9407221, -1.508079, 1, 1, 1, 1, 1,
-1.072122, 0.6256806, 0.2081278, 1, 1, 1, 1, 1,
-1.071448, -1.337302, -2.465364, 1, 1, 1, 1, 1,
-1.06473, 0.8956306, -1.520751, 1, 1, 1, 1, 1,
-1.063088, 1.228758, -1.898852, 1, 1, 1, 1, 1,
-1.060039, -0.4371412, -2.214316, 1, 1, 1, 1, 1,
-1.056362, 1.397874, 0.5014867, 1, 1, 1, 1, 1,
-1.055386, 0.8306882, 0.01888644, 1, 1, 1, 1, 1,
-1.048827, -0.264984, -2.739652, 1, 1, 1, 1, 1,
-1.045287, -0.6247109, -0.6440523, 1, 1, 1, 1, 1,
-1.037741, 1.105083, -1.914742, 1, 1, 1, 1, 1,
-1.032944, 1.20673, -1.134287, 1, 1, 1, 1, 1,
-1.029391, -0.9831213, -2.869862, 0, 0, 1, 1, 1,
-1.027779, -0.7814522, -2.601469, 1, 0, 0, 1, 1,
-1.023819, -1.395493, -3.642903, 1, 0, 0, 1, 1,
-1.018537, 0.4608531, -0.9758525, 1, 0, 0, 1, 1,
-1.014809, 0.1882426, -1.011829, 1, 0, 0, 1, 1,
-1.006539, -0.0954498, -0.4842145, 1, 0, 0, 1, 1,
-1.002154, 0.4857608, -0.2820658, 0, 0, 0, 1, 1,
-1.001605, -0.8016894, -1.2409, 0, 0, 0, 1, 1,
-1.000946, 0.07519422, -1.850406, 0, 0, 0, 1, 1,
-0.9980974, 1.29654, -0.2211991, 0, 0, 0, 1, 1,
-0.9972946, 1.046814, -0.5762811, 0, 0, 0, 1, 1,
-0.996244, -0.5604498, -1.625583, 0, 0, 0, 1, 1,
-0.991495, 1.484028, -1.316012, 0, 0, 0, 1, 1,
-0.9879331, 0.1787796, -0.6160851, 1, 1, 1, 1, 1,
-0.985577, -1.273087, -2.794081, 1, 1, 1, 1, 1,
-0.9767103, -0.4491242, -0.6225237, 1, 1, 1, 1, 1,
-0.9747684, -0.8676378, -1.500031, 1, 1, 1, 1, 1,
-0.9728336, -1.308798, -2.421411, 1, 1, 1, 1, 1,
-0.9718555, -0.3431043, -3.968885, 1, 1, 1, 1, 1,
-0.9668808, 0.3503999, 0.1999236, 1, 1, 1, 1, 1,
-0.9576008, -0.06273903, 0.056558, 1, 1, 1, 1, 1,
-0.9484532, -0.9388749, -0.9887632, 1, 1, 1, 1, 1,
-0.946367, 1.000368, 0.6748749, 1, 1, 1, 1, 1,
-0.9431841, 0.7531358, -1.27575, 1, 1, 1, 1, 1,
-0.9347786, 1.840946, 0.2693553, 1, 1, 1, 1, 1,
-0.9325683, -0.8289959, -1.397776, 1, 1, 1, 1, 1,
-0.9313585, 0.9455291, -1.555909, 1, 1, 1, 1, 1,
-0.9310514, 1.644632, -0.8671184, 1, 1, 1, 1, 1,
-0.9301059, -1.35104, -2.038655, 0, 0, 1, 1, 1,
-0.9265352, -1.508283, -2.584006, 1, 0, 0, 1, 1,
-0.9254111, -1.567536, -3.717068, 1, 0, 0, 1, 1,
-0.9239683, -0.8455328, -0.8933462, 1, 0, 0, 1, 1,
-0.9224736, -0.4593148, -1.636507, 1, 0, 0, 1, 1,
-0.9219783, 0.008879703, -2.935933, 1, 0, 0, 1, 1,
-0.921249, 1.902987, 0.6793091, 0, 0, 0, 1, 1,
-0.9177352, -0.4731031, -1.721203, 0, 0, 0, 1, 1,
-0.9085038, 1.049358, -0.3113259, 0, 0, 0, 1, 1,
-0.9024097, -0.5597382, -1.10958, 0, 0, 0, 1, 1,
-0.8947366, 0.3579259, -1.249797, 0, 0, 0, 1, 1,
-0.8905978, 1.030256, -0.5613301, 0, 0, 0, 1, 1,
-0.8887529, 0.9039084, -0.9382499, 0, 0, 0, 1, 1,
-0.8884252, -1.166678, -2.149308, 1, 1, 1, 1, 1,
-0.8869044, -0.06914029, -4.548992, 1, 1, 1, 1, 1,
-0.8829401, -0.533959, -1.72907, 1, 1, 1, 1, 1,
-0.8817956, 0.4812198, -0.5640072, 1, 1, 1, 1, 1,
-0.8789598, -0.4717206, -2.36302, 1, 1, 1, 1, 1,
-0.8706646, 0.8611704, 0.3849451, 1, 1, 1, 1, 1,
-0.8693528, -0.7856702, -3.226098, 1, 1, 1, 1, 1,
-0.8636307, -0.9314268, -3.880578, 1, 1, 1, 1, 1,
-0.8544426, -1.392625, -2.525614, 1, 1, 1, 1, 1,
-0.8518807, -1.397948, -3.260174, 1, 1, 1, 1, 1,
-0.8516358, 1.217471, 1.373761, 1, 1, 1, 1, 1,
-0.8504106, 2.663666, -0.4918667, 1, 1, 1, 1, 1,
-0.8493258, -0.2636956, -3.985872, 1, 1, 1, 1, 1,
-0.8484581, -1.206748, -0.6376741, 1, 1, 1, 1, 1,
-0.8448505, 0.3019642, -0.1779203, 1, 1, 1, 1, 1,
-0.8369082, 3.058074, 0.4551273, 0, 0, 1, 1, 1,
-0.8348696, 0.73398, -2.076475, 1, 0, 0, 1, 1,
-0.8290328, -1.830746, -2.814531, 1, 0, 0, 1, 1,
-0.8207113, -0.2204056, -2.150556, 1, 0, 0, 1, 1,
-0.819052, 0.05626802, -2.000129, 1, 0, 0, 1, 1,
-0.8151197, -0.1874754, -2.990329, 1, 0, 0, 1, 1,
-0.8106532, -0.979511, -0.4244095, 0, 0, 0, 1, 1,
-0.8073908, 0.1098836, 0.3038681, 0, 0, 0, 1, 1,
-0.8070441, -1.095244, -4.60949, 0, 0, 0, 1, 1,
-0.8035465, 0.8722925, -1.687449, 0, 0, 0, 1, 1,
-0.7994753, -1.226824, -2.168067, 0, 0, 0, 1, 1,
-0.7990097, -0.1474822, -0.9949133, 0, 0, 0, 1, 1,
-0.7976269, 0.8696047, -2.289397, 0, 0, 0, 1, 1,
-0.7924827, -1.573641, -2.206904, 1, 1, 1, 1, 1,
-0.7856425, -1.441009, -3.620098, 1, 1, 1, 1, 1,
-0.7855775, 0.6473979, -0.4382001, 1, 1, 1, 1, 1,
-0.7853265, 0.06995455, -0.865537, 1, 1, 1, 1, 1,
-0.7830401, 0.6409362, -1.958373, 1, 1, 1, 1, 1,
-0.7755929, 0.5736605, 0.9789404, 1, 1, 1, 1, 1,
-0.7715287, 0.7095466, -0.7938502, 1, 1, 1, 1, 1,
-0.7614647, 0.09120341, -1.693698, 1, 1, 1, 1, 1,
-0.7586191, 0.769363, -1.933885, 1, 1, 1, 1, 1,
-0.7572585, 0.5912991, -0.2711336, 1, 1, 1, 1, 1,
-0.7562345, -0.358069, -0.0841236, 1, 1, 1, 1, 1,
-0.7521773, 1.790295, 0.6156494, 1, 1, 1, 1, 1,
-0.7504699, -0.3152601, -1.027775, 1, 1, 1, 1, 1,
-0.7498378, -0.249416, -1.89949, 1, 1, 1, 1, 1,
-0.748983, 1.670405, -1.916243, 1, 1, 1, 1, 1,
-0.746469, 0.5536079, -1.051447, 0, 0, 1, 1, 1,
-0.7446609, 0.3270693, -2.594851, 1, 0, 0, 1, 1,
-0.736921, -0.2948183, -1.574629, 1, 0, 0, 1, 1,
-0.7341223, 1.035591, -0.07253896, 1, 0, 0, 1, 1,
-0.7314711, 0.05709492, -2.79401, 1, 0, 0, 1, 1,
-0.7241462, -0.9169592, -3.394576, 1, 0, 0, 1, 1,
-0.7232486, 0.1270446, -1.800243, 0, 0, 0, 1, 1,
-0.7206935, 2.311454, -0.5494481, 0, 0, 0, 1, 1,
-0.7189847, 0.5081733, -0.670918, 0, 0, 0, 1, 1,
-0.7153521, -0.8341193, -1.636029, 0, 0, 0, 1, 1,
-0.7126934, -1.168333, -0.9278498, 0, 0, 0, 1, 1,
-0.7080684, -0.6574956, -3.229788, 0, 0, 0, 1, 1,
-0.7032074, 0.02259454, -2.113616, 0, 0, 0, 1, 1,
-0.6983552, -0.1466025, 0.7342696, 1, 1, 1, 1, 1,
-0.6975583, 1.93595, 0.3339876, 1, 1, 1, 1, 1,
-0.6954556, -1.614623, -3.752819, 1, 1, 1, 1, 1,
-0.6943665, 1.792602, -0.962038, 1, 1, 1, 1, 1,
-0.6907355, -0.9759858, -1.638112, 1, 1, 1, 1, 1,
-0.6873387, 0.7132692, -0.03392935, 1, 1, 1, 1, 1,
-0.6790853, -2.978951, -3.573411, 1, 1, 1, 1, 1,
-0.6782573, -0.93608, -2.080393, 1, 1, 1, 1, 1,
-0.6706789, -0.4926483, -1.404299, 1, 1, 1, 1, 1,
-0.6655282, -0.1940688, -1.171773, 1, 1, 1, 1, 1,
-0.6638586, 0.2404709, -1.34267, 1, 1, 1, 1, 1,
-0.6636831, -1.198797, -0.3412264, 1, 1, 1, 1, 1,
-0.6496212, 0.8550745, -0.4859242, 1, 1, 1, 1, 1,
-0.6435707, -0.9106724, -2.138358, 1, 1, 1, 1, 1,
-0.6391715, -0.5189861, -2.467432, 1, 1, 1, 1, 1,
-0.6387904, -1.837889, -2.703462, 0, 0, 1, 1, 1,
-0.6365176, -0.7092883, -0.560152, 1, 0, 0, 1, 1,
-0.6354384, -0.5044158, -0.3433837, 1, 0, 0, 1, 1,
-0.6346912, -0.8768463, -1.428327, 1, 0, 0, 1, 1,
-0.6273114, 0.08648777, -1.036331, 1, 0, 0, 1, 1,
-0.6245646, 1.440528, -0.185788, 1, 0, 0, 1, 1,
-0.6245372, -1.168986, -3.009651, 0, 0, 0, 1, 1,
-0.6245332, 0.2161485, -1.309378, 0, 0, 0, 1, 1,
-0.6214039, -0.8918784, -2.654691, 0, 0, 0, 1, 1,
-0.6159425, 0.204101, -1.034088, 0, 0, 0, 1, 1,
-0.6148992, 1.247114, -0.5306953, 0, 0, 0, 1, 1,
-0.6126599, 1.289876, -0.5168573, 0, 0, 0, 1, 1,
-0.6053621, 0.1919707, -0.7479622, 0, 0, 0, 1, 1,
-0.6053205, -1.606454, -1.010507, 1, 1, 1, 1, 1,
-0.5975884, -0.556766, -1.721917, 1, 1, 1, 1, 1,
-0.5908896, -0.8345119, -4.463105, 1, 1, 1, 1, 1,
-0.5882918, 0.6615787, 0.3613756, 1, 1, 1, 1, 1,
-0.5851928, -0.5099485, -2.63017, 1, 1, 1, 1, 1,
-0.5769055, -0.6211025, -2.594175, 1, 1, 1, 1, 1,
-0.5766051, -0.1695036, -1.247257, 1, 1, 1, 1, 1,
-0.5695466, -1.367883, -3.22711, 1, 1, 1, 1, 1,
-0.5684215, 0.5397023, -0.03702519, 1, 1, 1, 1, 1,
-0.5667938, -1.858854, -4.180695, 1, 1, 1, 1, 1,
-0.5599321, -1.127698, -3.760586, 1, 1, 1, 1, 1,
-0.5568861, 0.3851583, -1.60244, 1, 1, 1, 1, 1,
-0.5563992, 0.2496919, 0.2901942, 1, 1, 1, 1, 1,
-0.5563893, 1.028966, 0.7429106, 1, 1, 1, 1, 1,
-0.5561335, -3.199583, -4.968311, 1, 1, 1, 1, 1,
-0.5547262, 0.8167852, -1.205398, 0, 0, 1, 1, 1,
-0.5531462, -1.789469, -4.181682, 1, 0, 0, 1, 1,
-0.5512897, 1.173913, -1.27009, 1, 0, 0, 1, 1,
-0.5450523, 0.1259875, -2.185999, 1, 0, 0, 1, 1,
-0.5433722, 1.917105, 0.03112264, 1, 0, 0, 1, 1,
-0.5430523, -0.6864579, -3.44643, 1, 0, 0, 1, 1,
-0.5420449, 0.5097156, -2.427777, 0, 0, 0, 1, 1,
-0.5410441, -0.1915917, -3.329401, 0, 0, 0, 1, 1,
-0.5391597, 0.9183273, 1.400467, 0, 0, 0, 1, 1,
-0.5386258, 1.186194, -0.7918201, 0, 0, 0, 1, 1,
-0.5364594, -0.4093682, -3.112862, 0, 0, 0, 1, 1,
-0.5340924, 0.01460517, -1.664277, 0, 0, 0, 1, 1,
-0.5338464, 1.832869, -1.710929, 0, 0, 0, 1, 1,
-0.5315014, 0.7227129, 0.6516158, 1, 1, 1, 1, 1,
-0.5302367, -0.3292562, -4.614674, 1, 1, 1, 1, 1,
-0.5286872, 3.30411, -0.3392742, 1, 1, 1, 1, 1,
-0.5274341, -0.2883648, -3.082277, 1, 1, 1, 1, 1,
-0.5272289, -0.7155162, -3.915172, 1, 1, 1, 1, 1,
-0.5230544, 0.6249211, -0.76169, 1, 1, 1, 1, 1,
-0.5229445, -0.2592129, -2.558414, 1, 1, 1, 1, 1,
-0.5175082, 0.6470906, 1.372957, 1, 1, 1, 1, 1,
-0.516382, 0.8505397, -1.230445, 1, 1, 1, 1, 1,
-0.5149771, 1.937417, -1.083074, 1, 1, 1, 1, 1,
-0.5127857, -1.416711, -1.974398, 1, 1, 1, 1, 1,
-0.5061861, -0.3866994, -4.08297, 1, 1, 1, 1, 1,
-0.5010061, 0.9895313, -1.775035, 1, 1, 1, 1, 1,
-0.4996154, -1.069225, -1.153524, 1, 1, 1, 1, 1,
-0.4958864, -1.408384, -2.633906, 1, 1, 1, 1, 1,
-0.494285, 0.5649132, -0.6872232, 0, 0, 1, 1, 1,
-0.4928029, 0.7034708, 0.2277266, 1, 0, 0, 1, 1,
-0.4916305, 0.9026794, -1.175582, 1, 0, 0, 1, 1,
-0.4913989, -0.07675692, -2.349341, 1, 0, 0, 1, 1,
-0.4905031, -2.088939, -3.030261, 1, 0, 0, 1, 1,
-0.4858983, -0.4255504, -4.039932, 1, 0, 0, 1, 1,
-0.4824019, 0.4473041, -1.394146, 0, 0, 0, 1, 1,
-0.470796, 0.6038206, 0.2496695, 0, 0, 0, 1, 1,
-0.4645533, -1.170769, -0.9474063, 0, 0, 0, 1, 1,
-0.4590752, -0.9094599, -4.273715, 0, 0, 0, 1, 1,
-0.4588791, 0.01714798, -0.2740309, 0, 0, 0, 1, 1,
-0.4573168, 0.6615221, -1.528068, 0, 0, 0, 1, 1,
-0.4542617, -1.256287, -3.693264, 0, 0, 0, 1, 1,
-0.4534608, 1.42616, 1.163235, 1, 1, 1, 1, 1,
-0.4501885, 1.363965, -1.248654, 1, 1, 1, 1, 1,
-0.4489093, -0.5155919, -2.443861, 1, 1, 1, 1, 1,
-0.4424234, -0.4711875, -3.440951, 1, 1, 1, 1, 1,
-0.4397269, 0.2561513, -2.464467, 1, 1, 1, 1, 1,
-0.4256234, 0.1296427, -0.9637365, 1, 1, 1, 1, 1,
-0.4250985, -0.5173796, -2.943378, 1, 1, 1, 1, 1,
-0.4221557, 2.853989, -1.392241, 1, 1, 1, 1, 1,
-0.4215253, 1.255234, 0.4676304, 1, 1, 1, 1, 1,
-0.4212412, -0.9845738, -1.898172, 1, 1, 1, 1, 1,
-0.4210843, -0.9196713, -2.683715, 1, 1, 1, 1, 1,
-0.4205156, -1.440187, -2.365891, 1, 1, 1, 1, 1,
-0.4152263, 0.2832781, -0.02909195, 1, 1, 1, 1, 1,
-0.4107874, -1.796708, -4.54914, 1, 1, 1, 1, 1,
-0.4095897, -0.2920206, -1.076278, 1, 1, 1, 1, 1,
-0.4086689, 1.799925, -2.000829, 0, 0, 1, 1, 1,
-0.407957, 1.250214, 1.393793, 1, 0, 0, 1, 1,
-0.4040051, -0.7382444, -2.335946, 1, 0, 0, 1, 1,
-0.4012625, -1.598889, -3.750947, 1, 0, 0, 1, 1,
-0.4012173, -0.7239646, -2.839113, 1, 0, 0, 1, 1,
-0.3984545, -1.100751, -4.06499, 1, 0, 0, 1, 1,
-0.3968256, 1.312924, -0.417942, 0, 0, 0, 1, 1,
-0.3958773, 0.381405, -1.198559, 0, 0, 0, 1, 1,
-0.3952319, -1.434566, -2.823199, 0, 0, 0, 1, 1,
-0.3863214, 0.4019554, -1.800189, 0, 0, 0, 1, 1,
-0.3840702, -0.6912949, -3.782697, 0, 0, 0, 1, 1,
-0.3837322, 0.2882312, -1.579299, 0, 0, 0, 1, 1,
-0.377304, 0.1446352, -0.2759463, 0, 0, 0, 1, 1,
-0.3715791, -0.6129839, -3.574335, 1, 1, 1, 1, 1,
-0.369702, -3.226702, -3.823277, 1, 1, 1, 1, 1,
-0.3659476, -0.3098716, -1.28222, 1, 1, 1, 1, 1,
-0.3658882, -1.082773, -1.549676, 1, 1, 1, 1, 1,
-0.3560721, -1.153496, -4.758693, 1, 1, 1, 1, 1,
-0.3554598, -0.02352241, -0.6937134, 1, 1, 1, 1, 1,
-0.3548713, 2.270258, -0.3929365, 1, 1, 1, 1, 1,
-0.3528578, 0.5824535, -1.948749, 1, 1, 1, 1, 1,
-0.3525387, -0.3099987, -3.594862, 1, 1, 1, 1, 1,
-0.3515122, 0.7034861, -0.6047055, 1, 1, 1, 1, 1,
-0.3513911, 0.03881643, -2.339089, 1, 1, 1, 1, 1,
-0.3452694, 0.3280593, -0.4436199, 1, 1, 1, 1, 1,
-0.3385372, 0.2463504, -1.358485, 1, 1, 1, 1, 1,
-0.3384156, 0.3023358, -1.34648, 1, 1, 1, 1, 1,
-0.3365623, -0.4321684, -1.167552, 1, 1, 1, 1, 1,
-0.3340758, -0.5663871, -2.75091, 0, 0, 1, 1, 1,
-0.3324244, -0.7529323, -2.949014, 1, 0, 0, 1, 1,
-0.3281801, -0.6408488, -3.603333, 1, 0, 0, 1, 1,
-0.3278464, 0.6612014, 0.6016918, 1, 0, 0, 1, 1,
-0.3252759, 0.1525857, -1.190588, 1, 0, 0, 1, 1,
-0.3218982, -0.3470174, 0.2803547, 1, 0, 0, 1, 1,
-0.3192506, 1.20741, 0.2263958, 0, 0, 0, 1, 1,
-0.3163744, 0.2119419, -0.3460257, 0, 0, 0, 1, 1,
-0.3145854, 0.3078084, -1.218908, 0, 0, 0, 1, 1,
-0.3133598, -1.90992, -2.929075, 0, 0, 0, 1, 1,
-0.3082977, 0.6917213, -0.8780342, 0, 0, 0, 1, 1,
-0.3081474, -0.9814432, -3.657428, 0, 0, 0, 1, 1,
-0.2975197, -0.4889861, -3.305178, 0, 0, 0, 1, 1,
-0.2962651, 0.6493078, -0.03305214, 1, 1, 1, 1, 1,
-0.2942649, -0.1233716, -1.829268, 1, 1, 1, 1, 1,
-0.2937256, -0.3011909, -2.935234, 1, 1, 1, 1, 1,
-0.2901312, 0.7625722, -1.564846, 1, 1, 1, 1, 1,
-0.2876168, -0.492103, -2.098719, 1, 1, 1, 1, 1,
-0.2875952, 0.7363942, 2.266188, 1, 1, 1, 1, 1,
-0.2819355, -0.6939333, -2.920709, 1, 1, 1, 1, 1,
-0.2782937, 1.060111, -1.618323, 1, 1, 1, 1, 1,
-0.2773534, 1.079715, -2.306506, 1, 1, 1, 1, 1,
-0.2754148, 1.098959, -0.9690422, 1, 1, 1, 1, 1,
-0.2734015, -1.61049, -3.131155, 1, 1, 1, 1, 1,
-0.2703796, 1.173663, -0.2768495, 1, 1, 1, 1, 1,
-0.2691173, -0.3208014, -1.604742, 1, 1, 1, 1, 1,
-0.26544, -0.1593129, -2.126481, 1, 1, 1, 1, 1,
-0.2632828, 0.66576, -1.84102, 1, 1, 1, 1, 1,
-0.2595869, -0.383252, -2.297583, 0, 0, 1, 1, 1,
-0.2569961, -1.046426, -2.577717, 1, 0, 0, 1, 1,
-0.2569532, 0.3053853, 0.09662539, 1, 0, 0, 1, 1,
-0.2556912, -0.4344206, -2.862782, 1, 0, 0, 1, 1,
-0.2451137, -0.7089427, -2.419585, 1, 0, 0, 1, 1,
-0.2441746, -2.658487, -5.003854, 1, 0, 0, 1, 1,
-0.2369427, 1.580097, 0.6590385, 0, 0, 0, 1, 1,
-0.2368753, 0.2103924, -0.918062, 0, 0, 0, 1, 1,
-0.2349127, -0.1043884, -2.019604, 0, 0, 0, 1, 1,
-0.2349058, -0.3897221, -4.161485, 0, 0, 0, 1, 1,
-0.2344702, 1.567283, -0.438879, 0, 0, 0, 1, 1,
-0.2314212, 1.537784, -1.36887, 0, 0, 0, 1, 1,
-0.2312204, -0.3903156, -2.622835, 0, 0, 0, 1, 1,
-0.2270413, -1.73266, -4.931028, 1, 1, 1, 1, 1,
-0.2206286, -0.8003157, -2.86901, 1, 1, 1, 1, 1,
-0.2163642, 1.248839, -0.09696554, 1, 1, 1, 1, 1,
-0.2141143, 0.1272446, 0.8749071, 1, 1, 1, 1, 1,
-0.2064651, 0.4234698, 1.762031, 1, 1, 1, 1, 1,
-0.2029798, -0.3661086, -3.673772, 1, 1, 1, 1, 1,
-0.2025768, -0.8863978, -3.444698, 1, 1, 1, 1, 1,
-0.2000941, 0.5747313, -1.655304, 1, 1, 1, 1, 1,
-0.1978569, -0.02339382, -0.5319804, 1, 1, 1, 1, 1,
-0.1954815, -1.021682, -3.233069, 1, 1, 1, 1, 1,
-0.1936896, 1.209304, -0.2157907, 1, 1, 1, 1, 1,
-0.1872366, 1.024584, -0.6079629, 1, 1, 1, 1, 1,
-0.1853501, -1.155681, -3.463113, 1, 1, 1, 1, 1,
-0.1847552, 1.879487, -1.068213, 1, 1, 1, 1, 1,
-0.1822682, -0.1106667, -1.002181, 1, 1, 1, 1, 1,
-0.1796286, -1.329686, -1.798286, 0, 0, 1, 1, 1,
-0.1783725, -0.9880021, -5.05546, 1, 0, 0, 1, 1,
-0.1758022, -0.469731, -1.939858, 1, 0, 0, 1, 1,
-0.1700762, -1.145082, -2.392843, 1, 0, 0, 1, 1,
-0.1685535, -1.701288, -3.341063, 1, 0, 0, 1, 1,
-0.1620465, 1.233667, -0.1304354, 1, 0, 0, 1, 1,
-0.1551785, -0.5006091, -1.521715, 0, 0, 0, 1, 1,
-0.1545864, 0.6872314, -0.37535, 0, 0, 0, 1, 1,
-0.151986, 0.7369196, -0.6086872, 0, 0, 0, 1, 1,
-0.1444965, 0.6819251, 1.457037, 0, 0, 0, 1, 1,
-0.1436116, -0.04111034, -2.347799, 0, 0, 0, 1, 1,
-0.1423756, -0.8729491, -4.140913, 0, 0, 0, 1, 1,
-0.1339639, 0.8257669, 0.5521895, 0, 0, 0, 1, 1,
-0.1337586, 1.326838, 0.7435642, 1, 1, 1, 1, 1,
-0.1309466, 0.2455678, -0.4156558, 1, 1, 1, 1, 1,
-0.1267327, 0.1562103, -0.7729745, 1, 1, 1, 1, 1,
-0.126422, 0.009834879, -1.363015, 1, 1, 1, 1, 1,
-0.125728, 0.3183561, 1.194162, 1, 1, 1, 1, 1,
-0.1195415, 0.3623347, 0.7718686, 1, 1, 1, 1, 1,
-0.1193334, -0.8305959, -3.841224, 1, 1, 1, 1, 1,
-0.119127, 1.304855, 0.9313003, 1, 1, 1, 1, 1,
-0.1185549, -0.1603643, -0.8342166, 1, 1, 1, 1, 1,
-0.1093032, 0.472078, -1.012467, 1, 1, 1, 1, 1,
-0.1092906, -1.28731, -3.120685, 1, 1, 1, 1, 1,
-0.1084626, -1.607323, -4.531845, 1, 1, 1, 1, 1,
-0.09400429, 1.094025, -1.147063, 1, 1, 1, 1, 1,
-0.09055206, -0.4111973, -3.327741, 1, 1, 1, 1, 1,
-0.08232418, -0.9597394, -1.844512, 1, 1, 1, 1, 1,
-0.07584891, -1.435306, -5.503829, 0, 0, 1, 1, 1,
-0.07561329, 0.2558827, 0.4154874, 1, 0, 0, 1, 1,
-0.0751906, -0.6020779, -2.365472, 1, 0, 0, 1, 1,
-0.0750908, -1.149717, -3.868702, 1, 0, 0, 1, 1,
-0.07085695, -0.9987978, -3.841092, 1, 0, 0, 1, 1,
-0.06315326, 0.6960038, 0.6937817, 1, 0, 0, 1, 1,
-0.06088986, 1.394646, -1.051661, 0, 0, 0, 1, 1,
-0.05219788, 0.8839697, -1.247011, 0, 0, 0, 1, 1,
-0.04931327, -0.08015884, -3.064864, 0, 0, 0, 1, 1,
-0.04287863, -0.1969986, -2.396544, 0, 0, 0, 1, 1,
-0.04253999, 0.8289068, -0.1263756, 0, 0, 0, 1, 1,
-0.04105681, 0.2845011, -1.410327, 0, 0, 0, 1, 1,
-0.0401968, 0.1335898, 0.3199666, 0, 0, 0, 1, 1,
-0.03433139, 1.500201, 0.3946524, 1, 1, 1, 1, 1,
-0.03387243, 2.001621, 0.3813264, 1, 1, 1, 1, 1,
-0.02838633, -1.64925, -3.942437, 1, 1, 1, 1, 1,
-0.02632566, -0.0303528, -2.568795, 1, 1, 1, 1, 1,
-0.02620785, 0.8022674, -0.1194475, 1, 1, 1, 1, 1,
-0.02588373, -0.005627174, -2.375494, 1, 1, 1, 1, 1,
-0.01824972, 0.277373, 0.174196, 1, 1, 1, 1, 1,
-0.01335066, -2.640449, -3.805803, 1, 1, 1, 1, 1,
-0.01331549, 0.8496099, 1.067428, 1, 1, 1, 1, 1,
-0.01139436, 0.5646592, -1.212645, 1, 1, 1, 1, 1,
-0.004080432, 0.4968407, 0.3018093, 1, 1, 1, 1, 1,
-0.001701309, 0.09631586, -2.041764, 1, 1, 1, 1, 1,
-0.0001008177, -0.02711137, -2.895274, 1, 1, 1, 1, 1,
0.002031959, 0.184193, -0.3726292, 1, 1, 1, 1, 1,
0.002875452, -0.4324309, 1.912313, 1, 1, 1, 1, 1,
0.01037416, -1.406114, 3.819188, 0, 0, 1, 1, 1,
0.01127848, 0.1424579, 0.5312367, 1, 0, 0, 1, 1,
0.01166098, -0.9113041, 5.161718, 1, 0, 0, 1, 1,
0.01383417, -1.278449, 2.198873, 1, 0, 0, 1, 1,
0.01405601, 1.727911, -1.145275, 1, 0, 0, 1, 1,
0.01445618, -0.742979, 2.610262, 1, 0, 0, 1, 1,
0.01888218, 0.9523205, 1.262268, 0, 0, 0, 1, 1,
0.02071199, 0.07975148, 0.04467753, 0, 0, 0, 1, 1,
0.02777549, 0.7198389, -0.5270038, 0, 0, 0, 1, 1,
0.0349649, -0.2642488, 5.450414, 0, 0, 0, 1, 1,
0.03652079, 0.9237292, 1.667322, 0, 0, 0, 1, 1,
0.04030959, 0.2534175, 0.5447585, 0, 0, 0, 1, 1,
0.04116843, -0.2023532, 2.588857, 0, 0, 0, 1, 1,
0.04351598, 0.1876248, 0.2608789, 1, 1, 1, 1, 1,
0.04969574, -0.03242509, 0.86939, 1, 1, 1, 1, 1,
0.04998174, 1.582112, -0.3331524, 1, 1, 1, 1, 1,
0.05227605, 0.1694321, -0.7416469, 1, 1, 1, 1, 1,
0.05665955, 0.4088368, 0.8865881, 1, 1, 1, 1, 1,
0.05694843, 1.397861, 0.4889299, 1, 1, 1, 1, 1,
0.05722843, -2.317579, 1.475492, 1, 1, 1, 1, 1,
0.05755819, -0.5762426, 3.731564, 1, 1, 1, 1, 1,
0.06442469, 0.05657135, 0.9375254, 1, 1, 1, 1, 1,
0.06498561, 0.7150148, -1.067974, 1, 1, 1, 1, 1,
0.06670003, 0.3058087, -2.023402, 1, 1, 1, 1, 1,
0.06726964, 0.008629849, 1.796766, 1, 1, 1, 1, 1,
0.07954159, -1.115104, 1.639599, 1, 1, 1, 1, 1,
0.08079179, 0.06695908, -1.142534, 1, 1, 1, 1, 1,
0.08344528, -0.9732009, 2.093181, 1, 1, 1, 1, 1,
0.0911043, -1.593771, 1.253373, 0, 0, 1, 1, 1,
0.09181708, 0.48898, -1.005687, 1, 0, 0, 1, 1,
0.09330727, -0.4366564, 2.767649, 1, 0, 0, 1, 1,
0.09998362, 2.888734, 1.873524, 1, 0, 0, 1, 1,
0.1018482, 0.2698498, 0.1641257, 1, 0, 0, 1, 1,
0.1074374, 0.6813709, 1.262657, 1, 0, 0, 1, 1,
0.1124828, -1.096702, 1.890804, 0, 0, 0, 1, 1,
0.1146958, -0.7155542, 6.634494, 0, 0, 0, 1, 1,
0.1164363, 1.342706, 1.121852, 0, 0, 0, 1, 1,
0.1190575, -0.328124, 2.136466, 0, 0, 0, 1, 1,
0.1244981, -1.746424, 2.926888, 0, 0, 0, 1, 1,
0.1251992, -1.698857, 2.404629, 0, 0, 0, 1, 1,
0.1270699, -0.1834446, 3.063621, 0, 0, 0, 1, 1,
0.1274434, -0.08844911, 0.9203763, 1, 1, 1, 1, 1,
0.1302505, -1.182416, 3.8028, 1, 1, 1, 1, 1,
0.1315705, 1.465241, -1.379409, 1, 1, 1, 1, 1,
0.1354112, -0.7735165, 3.370996, 1, 1, 1, 1, 1,
0.1400717, -1.781521, 2.94788, 1, 1, 1, 1, 1,
0.143711, 1.333531, 1.815654, 1, 1, 1, 1, 1,
0.1463709, -0.6472372, 2.52766, 1, 1, 1, 1, 1,
0.1487085, 3.898055, 0.6523226, 1, 1, 1, 1, 1,
0.1597058, 0.5924132, 0.5782596, 1, 1, 1, 1, 1,
0.1616854, 2.965262, -0.342583, 1, 1, 1, 1, 1,
0.1649517, 0.4618303, -0.2366653, 1, 1, 1, 1, 1,
0.1653454, 0.4784753, -1.142739, 1, 1, 1, 1, 1,
0.1707006, 1.136075, -0.8078201, 1, 1, 1, 1, 1,
0.1722656, 0.1092621, 2.605138, 1, 1, 1, 1, 1,
0.1739464, 0.3484643, 1.424762, 1, 1, 1, 1, 1,
0.1779985, -1.417645, 2.879583, 0, 0, 1, 1, 1,
0.1815042, 1.201149, 0.9271936, 1, 0, 0, 1, 1,
0.1983889, -0.8223778, 1.839389, 1, 0, 0, 1, 1,
0.200338, 0.5230849, -0.1550462, 1, 0, 0, 1, 1,
0.2012111, 1.031634, -0.3206009, 1, 0, 0, 1, 1,
0.2019785, -0.0318846, 0.6159987, 1, 0, 0, 1, 1,
0.2048081, -0.4878579, 2.549818, 0, 0, 0, 1, 1,
0.2112208, -0.1936247, 2.883045, 0, 0, 0, 1, 1,
0.2119613, 0.8843254, 1.094626, 0, 0, 0, 1, 1,
0.2127751, 0.1280754, 2.156815, 0, 0, 0, 1, 1,
0.2149866, -0.8563879, 4.223426, 0, 0, 0, 1, 1,
0.2323289, -0.9525027, 2.428993, 0, 0, 0, 1, 1,
0.2341871, 0.4713098, 2.366633, 0, 0, 0, 1, 1,
0.2355455, 0.2374161, -0.06791818, 1, 1, 1, 1, 1,
0.2380872, 0.2587345, -0.4142207, 1, 1, 1, 1, 1,
0.2427176, -2.365428, 4.21477, 1, 1, 1, 1, 1,
0.2435948, 0.04334502, 0.2351459, 1, 1, 1, 1, 1,
0.2471252, 0.5410178, 2.459352, 1, 1, 1, 1, 1,
0.2476692, -2.520592, 2.48678, 1, 1, 1, 1, 1,
0.2510872, 1.014497, -1.504454, 1, 1, 1, 1, 1,
0.2529624, -1.265675, 3.50434, 1, 1, 1, 1, 1,
0.2548791, -0.705885, 2.715816, 1, 1, 1, 1, 1,
0.2560622, 1.103302, -0.2658051, 1, 1, 1, 1, 1,
0.2572723, 0.2010236, 0.4162757, 1, 1, 1, 1, 1,
0.2581376, -0.04411332, 4.204769, 1, 1, 1, 1, 1,
0.2658649, 0.5569342, 0.5696735, 1, 1, 1, 1, 1,
0.2681108, 1.010895, -0.5591147, 1, 1, 1, 1, 1,
0.271324, -0.3272567, 2.489227, 1, 1, 1, 1, 1,
0.2729854, -0.2906128, 2.350218, 0, 0, 1, 1, 1,
0.2736442, -0.8701888, 2.852411, 1, 0, 0, 1, 1,
0.2749417, 0.7274714, 0.3187729, 1, 0, 0, 1, 1,
0.2785643, -0.6589819, 1.410177, 1, 0, 0, 1, 1,
0.2805572, 0.9053521, 0.05594638, 1, 0, 0, 1, 1,
0.2849272, 0.02607346, 1.777463, 1, 0, 0, 1, 1,
0.28553, -0.119927, 2.92188, 0, 0, 0, 1, 1,
0.285545, -0.6530569, 2.382576, 0, 0, 0, 1, 1,
0.2898311, 0.4173739, 2.489966, 0, 0, 0, 1, 1,
0.2931291, -0.164552, 2.244148, 0, 0, 0, 1, 1,
0.2934036, -1.430118, 3.529345, 0, 0, 0, 1, 1,
0.2978922, -0.1379669, 2.455343, 0, 0, 0, 1, 1,
0.3022532, -2.201886, 3.630442, 0, 0, 0, 1, 1,
0.3045317, -0.04212292, 2.611127, 1, 1, 1, 1, 1,
0.3053594, 0.3201092, 0.4818982, 1, 1, 1, 1, 1,
0.3161397, 0.1539477, 0.5012359, 1, 1, 1, 1, 1,
0.3169083, -0.05915501, 1.955096, 1, 1, 1, 1, 1,
0.3194027, 0.1500469, 2.047692, 1, 1, 1, 1, 1,
0.3208182, -2.139359, 3.667796, 1, 1, 1, 1, 1,
0.3213479, -0.04031564, 3.030352, 1, 1, 1, 1, 1,
0.3221589, 2.977985, 0.1192458, 1, 1, 1, 1, 1,
0.3317419, 2.513452, 1.325663, 1, 1, 1, 1, 1,
0.3329771, -0.7524673, 3.058806, 1, 1, 1, 1, 1,
0.3488252, -0.05746672, 1.337464, 1, 1, 1, 1, 1,
0.3488934, -0.8665085, 3.267103, 1, 1, 1, 1, 1,
0.3528121, -0.05647469, 0.6361715, 1, 1, 1, 1, 1,
0.3549147, 1.66571, -0.6569574, 1, 1, 1, 1, 1,
0.3562601, -0.3756307, 2.484494, 1, 1, 1, 1, 1,
0.3572558, -1.174402, 3.41941, 0, 0, 1, 1, 1,
0.3630493, -0.2985137, 2.726816, 1, 0, 0, 1, 1,
0.3697874, 0.7618274, 1.284671, 1, 0, 0, 1, 1,
0.3713298, 2.452817, 1.306707, 1, 0, 0, 1, 1,
0.3731979, -1.604711, 1.834156, 1, 0, 0, 1, 1,
0.374934, 0.89135, -0.7586917, 1, 0, 0, 1, 1,
0.3758625, 0.6934252, 0.3515393, 0, 0, 0, 1, 1,
0.3770858, 1.071445, -0.5904254, 0, 0, 0, 1, 1,
0.378836, -0.1214705, 1.187776, 0, 0, 0, 1, 1,
0.3799279, 1.143345, -1.557482, 0, 0, 0, 1, 1,
0.38063, 0.1020135, -0.8207266, 0, 0, 0, 1, 1,
0.381569, -1.554254, 4.07625, 0, 0, 0, 1, 1,
0.3839221, -0.08650003, 1.876032, 0, 0, 0, 1, 1,
0.3851638, -0.5302596, 2.733952, 1, 1, 1, 1, 1,
0.391362, 1.106264, -0.5406222, 1, 1, 1, 1, 1,
0.3916074, 1.230915, 0.497235, 1, 1, 1, 1, 1,
0.391838, -0.734731, 2.405795, 1, 1, 1, 1, 1,
0.3933935, -0.05438934, 3.100097, 1, 1, 1, 1, 1,
0.3956009, -0.6940998, 2.725037, 1, 1, 1, 1, 1,
0.400256, -0.5026529, 1.720585, 1, 1, 1, 1, 1,
0.406797, -0.05043629, 0.50721, 1, 1, 1, 1, 1,
0.407923, -1.315701, 2.610766, 1, 1, 1, 1, 1,
0.4088185, -0.8339424, 4.484347, 1, 1, 1, 1, 1,
0.4100588, -0.2313934, 3.344685, 1, 1, 1, 1, 1,
0.4116001, 2.04012, -0.1683714, 1, 1, 1, 1, 1,
0.4132232, -0.8986775, 2.819277, 1, 1, 1, 1, 1,
0.4138654, 1.745265, 0.7859088, 1, 1, 1, 1, 1,
0.4150313, -0.03565423, 1.914342, 1, 1, 1, 1, 1,
0.4159112, -0.2971822, 2.485461, 0, 0, 1, 1, 1,
0.4195599, -1.122081, 2.481101, 1, 0, 0, 1, 1,
0.4224106, 1.693939, 1.539695, 1, 0, 0, 1, 1,
0.4312256, -0.944125, 1.95268, 1, 0, 0, 1, 1,
0.4330093, 1.11621, 0.4182756, 1, 0, 0, 1, 1,
0.4442016, -0.7357221, 2.772743, 1, 0, 0, 1, 1,
0.4482353, 0.715432, 0.8998273, 0, 0, 0, 1, 1,
0.4504851, -0.2563533, 1.362161, 0, 0, 0, 1, 1,
0.4530968, 1.967999, 0.3512601, 0, 0, 0, 1, 1,
0.4555063, -1.640744, 3.083421, 0, 0, 0, 1, 1,
0.4584973, -0.04620133, 1.334776, 0, 0, 0, 1, 1,
0.4591142, 0.06062407, 3.307788, 0, 0, 0, 1, 1,
0.459456, 0.6560772, 0.7249525, 0, 0, 0, 1, 1,
0.4604165, 0.7681601, 0.151205, 1, 1, 1, 1, 1,
0.4673031, 0.4732099, 1.400601, 1, 1, 1, 1, 1,
0.4702562, -1.524998, 2.191879, 1, 1, 1, 1, 1,
0.4742295, 0.7271153, 1.220331, 1, 1, 1, 1, 1,
0.4774663, 0.01052233, -0.632365, 1, 1, 1, 1, 1,
0.4775908, 0.3094102, -0.2364945, 1, 1, 1, 1, 1,
0.4817224, -0.4873407, 3.093267, 1, 1, 1, 1, 1,
0.4821106, 0.5846165, 1.831364, 1, 1, 1, 1, 1,
0.4873524, -1.904311, 2.124627, 1, 1, 1, 1, 1,
0.5033031, 0.1383815, 2.375761, 1, 1, 1, 1, 1,
0.5071739, 0.3212078, 2.384142, 1, 1, 1, 1, 1,
0.5087497, 0.03042338, 0.1741861, 1, 1, 1, 1, 1,
0.5105053, -0.6784469, 0.6333509, 1, 1, 1, 1, 1,
0.5196624, -0.7613971, 1.837447, 1, 1, 1, 1, 1,
0.5204918, -2.398904, 3.095908, 1, 1, 1, 1, 1,
0.5208228, 0.9631613, 2.054468, 0, 0, 1, 1, 1,
0.5223327, 1.409452, 0.7178148, 1, 0, 0, 1, 1,
0.5264976, 2.871694, 0.4042464, 1, 0, 0, 1, 1,
0.5275944, -0.389323, 2.659317, 1, 0, 0, 1, 1,
0.5355327, 0.624216, -0.2672493, 1, 0, 0, 1, 1,
0.5398233, -0.9772988, 2.714082, 1, 0, 0, 1, 1,
0.5407293, 1.136119, 1.619616, 0, 0, 0, 1, 1,
0.5432731, 0.7283807, 0.4665929, 0, 0, 0, 1, 1,
0.5457024, 0.9568698, 0.7299505, 0, 0, 0, 1, 1,
0.5475003, 0.3655859, -0.1970391, 0, 0, 0, 1, 1,
0.5525159, -1.316212, 2.405336, 0, 0, 0, 1, 1,
0.5538323, 0.0818636, 0.1410449, 0, 0, 0, 1, 1,
0.5588059, 0.6151054, -0.2461362, 0, 0, 0, 1, 1,
0.5623219, 1.884179, 0.2329889, 1, 1, 1, 1, 1,
0.5633778, 0.3652968, 0.7452657, 1, 1, 1, 1, 1,
0.5634252, 0.08745909, 1.995177, 1, 1, 1, 1, 1,
0.5660326, 0.5789723, 0.3633945, 1, 1, 1, 1, 1,
0.5825687, -0.3705076, 2.775122, 1, 1, 1, 1, 1,
0.5878729, 0.9563209, 1.18784, 1, 1, 1, 1, 1,
0.589548, 0.9253897, 1.423724, 1, 1, 1, 1, 1,
0.5896966, -2.333068, 3.032824, 1, 1, 1, 1, 1,
0.5899618, -0.7796682, 2.851322, 1, 1, 1, 1, 1,
0.5900205, -0.9467494, 1.977867, 1, 1, 1, 1, 1,
0.5908412, 1.364695, 0.0002361993, 1, 1, 1, 1, 1,
0.592564, -0.1517058, 1.736393, 1, 1, 1, 1, 1,
0.5937933, 1.594797, 3.385078, 1, 1, 1, 1, 1,
0.594574, 0.4406389, 1.101426, 1, 1, 1, 1, 1,
0.5950874, 1.001682, 0.5469199, 1, 1, 1, 1, 1,
0.6041489, -0.3441735, 2.583125, 0, 0, 1, 1, 1,
0.6074291, 1.082963, -0.2331902, 1, 0, 0, 1, 1,
0.6083902, 0.7340738, -0.2324987, 1, 0, 0, 1, 1,
0.6134708, 0.2829342, -0.233323, 1, 0, 0, 1, 1,
0.6155749, -0.1685922, 3.155181, 1, 0, 0, 1, 1,
0.6207356, 1.462768, -0.02284256, 1, 0, 0, 1, 1,
0.6216378, -2.149957, 2.679106, 0, 0, 0, 1, 1,
0.6237141, -0.4245353, 3.706214, 0, 0, 0, 1, 1,
0.6285905, -0.2052281, 3.416356, 0, 0, 0, 1, 1,
0.628646, -0.259791, 4.181165, 0, 0, 0, 1, 1,
0.6314433, -0.9551169, 1.871754, 0, 0, 0, 1, 1,
0.6319516, 0.4655008, 1.810194, 0, 0, 0, 1, 1,
0.6324232, 1.661395, -1.364747, 0, 0, 0, 1, 1,
0.633094, -0.2449872, 1.114982, 1, 1, 1, 1, 1,
0.6376333, 1.327261, -0.1022073, 1, 1, 1, 1, 1,
0.6376357, 1.789262, 0.4694284, 1, 1, 1, 1, 1,
0.6510699, -1.921459, 1.494681, 1, 1, 1, 1, 1,
0.6548587, 1.102528, -1.049267, 1, 1, 1, 1, 1,
0.6557836, -1.749382, 2.343408, 1, 1, 1, 1, 1,
0.6578854, -0.1402024, 1.35779, 1, 1, 1, 1, 1,
0.6597784, 1.161574, 1.376069, 1, 1, 1, 1, 1,
0.6608897, 1.767557, 1.613701, 1, 1, 1, 1, 1,
0.6626133, -1.408747, 3.089802, 1, 1, 1, 1, 1,
0.6627777, 1.205724, 2.364155, 1, 1, 1, 1, 1,
0.6667452, 0.5639576, 2.858967, 1, 1, 1, 1, 1,
0.6682255, -0.3316149, 0.902347, 1, 1, 1, 1, 1,
0.6693857, 0.08657116, 1.198663, 1, 1, 1, 1, 1,
0.6712103, 0.4362615, 0.2773236, 1, 1, 1, 1, 1,
0.6758689, -0.1151784, 3.546489, 0, 0, 1, 1, 1,
0.6777495, 1.463712, 0.6339629, 1, 0, 0, 1, 1,
0.6799471, -1.240811, 2.629344, 1, 0, 0, 1, 1,
0.6802312, 0.9785458, 0.8265698, 1, 0, 0, 1, 1,
0.6815768, -0.3949085, 2.120228, 1, 0, 0, 1, 1,
0.6848316, 0.8299614, 1.235216, 1, 0, 0, 1, 1,
0.6876689, -0.1415179, 1.166711, 0, 0, 0, 1, 1,
0.6896314, -0.2537715, 2.98112, 0, 0, 0, 1, 1,
0.6907203, -1.147953, 1.45519, 0, 0, 0, 1, 1,
0.6943597, -1.027575, 4.043766, 0, 0, 0, 1, 1,
0.6944232, -0.6146875, 2.977053, 0, 0, 0, 1, 1,
0.6956292, 1.146248, 2.006583, 0, 0, 0, 1, 1,
0.7075444, -0.3518838, 2.179717, 0, 0, 0, 1, 1,
0.7078691, -0.6755555, 1.457435, 1, 1, 1, 1, 1,
0.7084784, 0.5044186, 0.05544258, 1, 1, 1, 1, 1,
0.7119559, 0.5217797, 1.016475, 1, 1, 1, 1, 1,
0.7150589, -0.8446081, 2.164343, 1, 1, 1, 1, 1,
0.7155979, -1.018155, 2.038281, 1, 1, 1, 1, 1,
0.7164703, 0.1321534, 0.7550969, 1, 1, 1, 1, 1,
0.719453, 0.06496499, 1.637801, 1, 1, 1, 1, 1,
0.7268887, -0.3861466, 2.18504, 1, 1, 1, 1, 1,
0.7273071, 0.4760231, 1.791968, 1, 1, 1, 1, 1,
0.7275512, -0.03605101, 1.187873, 1, 1, 1, 1, 1,
0.7280452, -0.03281906, 1.290254, 1, 1, 1, 1, 1,
0.7280881, -0.7699823, 2.524116, 1, 1, 1, 1, 1,
0.729692, -2.475205, 0.9562689, 1, 1, 1, 1, 1,
0.7343525, 0.2395001, 0.4734008, 1, 1, 1, 1, 1,
0.7346007, 0.7267624, -0.8412744, 1, 1, 1, 1, 1,
0.7391316, 0.2727624, 1.335627, 0, 0, 1, 1, 1,
0.7391837, 0.4317814, 2.151925, 1, 0, 0, 1, 1,
0.7421694, 0.7435648, 2.661996, 1, 0, 0, 1, 1,
0.7445754, -0.1360955, 2.338084, 1, 0, 0, 1, 1,
0.7458656, -1.350329, 3.731776, 1, 0, 0, 1, 1,
0.748096, -0.2601844, 2.107387, 1, 0, 0, 1, 1,
0.7503598, 1.107183, -0.03485129, 0, 0, 0, 1, 1,
0.7556206, 0.8046242, 0.9632888, 0, 0, 0, 1, 1,
0.7556682, 0.8064281, -1.625279, 0, 0, 0, 1, 1,
0.7654708, -0.4677836, 2.932368, 0, 0, 0, 1, 1,
0.7694294, -1.054127, 2.282406, 0, 0, 0, 1, 1,
0.7695022, 0.5150166, -0.6721091, 0, 0, 0, 1, 1,
0.7722658, 0.6338807, 1.340797, 0, 0, 0, 1, 1,
0.7798569, 0.0857141, 1.835608, 1, 1, 1, 1, 1,
0.7855914, 0.3716949, -0.1680759, 1, 1, 1, 1, 1,
0.7888969, 0.1285944, 1.347551, 1, 1, 1, 1, 1,
0.790077, -0.6597175, 2.074049, 1, 1, 1, 1, 1,
0.7927467, 0.7394814, 0.8799775, 1, 1, 1, 1, 1,
0.7929867, 0.7324329, 2.289334, 1, 1, 1, 1, 1,
0.7936109, 0.5283207, -0.3605955, 1, 1, 1, 1, 1,
0.7960531, 1.250014, -0.7700858, 1, 1, 1, 1, 1,
0.8015508, -1.188987, 2.084501, 1, 1, 1, 1, 1,
0.8032934, -1.029577, 1.999332, 1, 1, 1, 1, 1,
0.8081722, 1.187256, 0.4114595, 1, 1, 1, 1, 1,
0.8108199, 1.19964, 0.1960082, 1, 1, 1, 1, 1,
0.8137017, -0.3380429, 1.661891, 1, 1, 1, 1, 1,
0.8152866, 1.164176, 1.779279, 1, 1, 1, 1, 1,
0.816086, 1.242567, 1.73673, 1, 1, 1, 1, 1,
0.8164813, 0.5710539, 2.958365, 0, 0, 1, 1, 1,
0.816949, -0.3893455, 2.896055, 1, 0, 0, 1, 1,
0.8173641, 0.3293327, 2.441065, 1, 0, 0, 1, 1,
0.818529, 0.927749, -0.3753127, 1, 0, 0, 1, 1,
0.8193744, 1.037723, 2.396608, 1, 0, 0, 1, 1,
0.8220717, -0.977244, 2.659061, 1, 0, 0, 1, 1,
0.8287376, -0.09930185, 2.020691, 0, 0, 0, 1, 1,
0.8320153, 0.1341908, 1.518, 0, 0, 0, 1, 1,
0.8322112, 0.01323738, 2.341957, 0, 0, 0, 1, 1,
0.8327169, -1.456226, 2.503293, 0, 0, 0, 1, 1,
0.8347675, 1.211791, 0.7092845, 0, 0, 0, 1, 1,
0.8349357, 0.8236648, 1.486239, 0, 0, 0, 1, 1,
0.835387, 0.357947, 1.276069, 0, 0, 0, 1, 1,
0.8367544, -0.3248988, 1.575072, 1, 1, 1, 1, 1,
0.8452569, 0.1763259, 0.7202933, 1, 1, 1, 1, 1,
0.8491648, -0.04025094, 2.501461, 1, 1, 1, 1, 1,
0.8500425, -0.5800367, 3.463647, 1, 1, 1, 1, 1,
0.850163, -1.190902, 4.497415, 1, 1, 1, 1, 1,
0.8558074, 1.051333, 1.187202, 1, 1, 1, 1, 1,
0.8583342, -0.1831681, 0.9138511, 1, 1, 1, 1, 1,
0.8596306, -0.5320387, 1.700498, 1, 1, 1, 1, 1,
0.8619254, 0.1356259, 1.742698, 1, 1, 1, 1, 1,
0.870045, -0.6671848, 0.5458011, 1, 1, 1, 1, 1,
0.8794023, -1.235007, 4.150671, 1, 1, 1, 1, 1,
0.881743, 0.4083286, 1.079543, 1, 1, 1, 1, 1,
0.8840698, -0.02250415, 2.041531, 1, 1, 1, 1, 1,
0.884736, 0.3232236, 0.6543671, 1, 1, 1, 1, 1,
0.8877765, -2.406219, 3.248648, 1, 1, 1, 1, 1,
0.8980232, 1.513767, 0.4350725, 0, 0, 1, 1, 1,
0.9039207, 0.7081208, 1.482262, 1, 0, 0, 1, 1,
0.904565, -0.3012127, 0.2458068, 1, 0, 0, 1, 1,
0.9077624, 1.104048, 1.389415, 1, 0, 0, 1, 1,
0.9119391, -1.913873, 3.358122, 1, 0, 0, 1, 1,
0.912985, 1.737326, -0.247721, 1, 0, 0, 1, 1,
0.9140539, -0.4116192, 1.267172, 0, 0, 0, 1, 1,
0.9143946, -1.007381, 4.847838, 0, 0, 0, 1, 1,
0.9179085, -0.1710279, 1.588839, 0, 0, 0, 1, 1,
0.9256962, 1.184228, 0.4258602, 0, 0, 0, 1, 1,
0.9262446, -0.659908, 3.016757, 0, 0, 0, 1, 1,
0.9435136, 0.9053645, -0.3576434, 0, 0, 0, 1, 1,
0.9439397, 0.09606121, 2.655548, 0, 0, 0, 1, 1,
0.9521402, 0.3555656, 0.6456439, 1, 1, 1, 1, 1,
0.9523695, 0.1845548, 0.7383476, 1, 1, 1, 1, 1,
0.955714, 0.4043693, -0.2731923, 1, 1, 1, 1, 1,
0.9582187, -0.6543688, 2.583308, 1, 1, 1, 1, 1,
0.9638044, -2.425559, 3.543441, 1, 1, 1, 1, 1,
0.967101, -0.0207417, 3.591484, 1, 1, 1, 1, 1,
0.9676147, -1.332619, 1.549663, 1, 1, 1, 1, 1,
0.971891, -0.3611357, 1.656711, 1, 1, 1, 1, 1,
0.9778303, 1.03995, -0.07907283, 1, 1, 1, 1, 1,
0.9798638, -2.0979, 2.094248, 1, 1, 1, 1, 1,
0.9826314, -0.2125451, 2.143645, 1, 1, 1, 1, 1,
0.9831833, -0.3786376, 2.052518, 1, 1, 1, 1, 1,
0.9853445, 0.5873068, 1.164412, 1, 1, 1, 1, 1,
0.9897809, 0.08177391, 0.3013017, 1, 1, 1, 1, 1,
0.9898685, 1.544774, 0.05978289, 1, 1, 1, 1, 1,
0.9954159, -0.5978035, 1.352296, 0, 0, 1, 1, 1,
0.9962138, 1.409245, -1.014163, 1, 0, 0, 1, 1,
1.013543, -0.5815256, 1.849525, 1, 0, 0, 1, 1,
1.014717, -0.6045234, 3.907794, 1, 0, 0, 1, 1,
1.01603, -1.147625, 2.82707, 1, 0, 0, 1, 1,
1.023283, 0.1674579, 0.9554404, 1, 0, 0, 1, 1,
1.035085, 1.241987, 0.8968292, 0, 0, 0, 1, 1,
1.035709, -0.07939278, 1.404006, 0, 0, 0, 1, 1,
1.038692, -0.5676441, 2.120776, 0, 0, 0, 1, 1,
1.043756, -1.458341, 2.325326, 0, 0, 0, 1, 1,
1.044629, -1.095042, 1.789063, 0, 0, 0, 1, 1,
1.055781, -0.6925741, 3.785271, 0, 0, 0, 1, 1,
1.055839, 2.365432, 0.9020458, 0, 0, 0, 1, 1,
1.057135, -0.9171336, 0.8847538, 1, 1, 1, 1, 1,
1.057149, -0.5177131, 1.424656, 1, 1, 1, 1, 1,
1.05814, -0.1956164, -0.05534751, 1, 1, 1, 1, 1,
1.058493, 1.058291, 0.7705387, 1, 1, 1, 1, 1,
1.067751, -2.023735, 2.632454, 1, 1, 1, 1, 1,
1.069743, -0.7695923, 3.491464, 1, 1, 1, 1, 1,
1.073874, 0.4029638, 2.257069, 1, 1, 1, 1, 1,
1.076856, 1.437323, 1.706856, 1, 1, 1, 1, 1,
1.077285, 0.3197103, 0.3419799, 1, 1, 1, 1, 1,
1.083335, 0.06229772, 0.6131306, 1, 1, 1, 1, 1,
1.083674, -0.6364205, 2.930652, 1, 1, 1, 1, 1,
1.088531, 0.1204343, 0.9259669, 1, 1, 1, 1, 1,
1.103504, -0.1169055, 2.025879, 1, 1, 1, 1, 1,
1.107387, 0.1751007, 0.08267431, 1, 1, 1, 1, 1,
1.114672, 0.8232381, 1.634534, 1, 1, 1, 1, 1,
1.114973, 0.9585588, 1.116354, 0, 0, 1, 1, 1,
1.115779, 1.62776, 0.2765556, 1, 0, 0, 1, 1,
1.115839, 1.051422, -0.8724554, 1, 0, 0, 1, 1,
1.117373, -0.6210469, 1.450898, 1, 0, 0, 1, 1,
1.124063, -0.4102842, 1.920771, 1, 0, 0, 1, 1,
1.127837, -1.61964, 4.379748, 1, 0, 0, 1, 1,
1.140427, 0.2111024, 0.3003025, 0, 0, 0, 1, 1,
1.1434, -1.177007, 2.02144, 0, 0, 0, 1, 1,
1.148077, 1.385491, 2.053309, 0, 0, 0, 1, 1,
1.151268, 0.05480911, 2.390325, 0, 0, 0, 1, 1,
1.15463, -0.2511815, 1.095976, 0, 0, 0, 1, 1,
1.156747, -0.4934809, 1.66105, 0, 0, 0, 1, 1,
1.175317, 0.1285143, 0.09211659, 0, 0, 0, 1, 1,
1.180669, 1.418159, 0.6861791, 1, 1, 1, 1, 1,
1.185006, -0.05193738, 1.48296, 1, 1, 1, 1, 1,
1.185148, 0.2642633, 2.329512, 1, 1, 1, 1, 1,
1.187578, -1.944351, 1.613971, 1, 1, 1, 1, 1,
1.19366, -2.791925, 1.933762, 1, 1, 1, 1, 1,
1.196881, 0.5209308, -1.579652, 1, 1, 1, 1, 1,
1.208713, -1.329854, 2.638853, 1, 1, 1, 1, 1,
1.212003, -0.1534541, 1.727598, 1, 1, 1, 1, 1,
1.215554, -1.216648, 2.397028, 1, 1, 1, 1, 1,
1.221769, 1.673398, 1.449326, 1, 1, 1, 1, 1,
1.222153, -0.6460522, 1.191067, 1, 1, 1, 1, 1,
1.225093, -0.04002696, 2.510459, 1, 1, 1, 1, 1,
1.230979, 0.2963067, 1.358485, 1, 1, 1, 1, 1,
1.237582, 1.839334, 0.5019518, 1, 1, 1, 1, 1,
1.241477, 0.371125, 1.303698, 1, 1, 1, 1, 1,
1.241833, -0.9199401, 1.620463, 0, 0, 1, 1, 1,
1.243184, 1.850423, 0.3388096, 1, 0, 0, 1, 1,
1.250554, 0.6970851, 1.930951, 1, 0, 0, 1, 1,
1.263495, -0.6254406, 0.4352569, 1, 0, 0, 1, 1,
1.268925, -0.8103957, 1.93557, 1, 0, 0, 1, 1,
1.274615, -1.188537, 0.82228, 1, 0, 0, 1, 1,
1.283697, -0.1435763, 1.045311, 0, 0, 0, 1, 1,
1.283982, 0.7361175, 1.405646, 0, 0, 0, 1, 1,
1.286091, -0.72969, 1.098666, 0, 0, 0, 1, 1,
1.293065, -0.3930551, 3.577673, 0, 0, 0, 1, 1,
1.293358, 0.05833746, 1.034339, 0, 0, 0, 1, 1,
1.295919, 0.5073364, 0.8490373, 0, 0, 0, 1, 1,
1.301103, 0.4897148, 3.190085, 0, 0, 0, 1, 1,
1.306469, 1.462111, 1.549818, 1, 1, 1, 1, 1,
1.306507, 1.434052, 0.2741018, 1, 1, 1, 1, 1,
1.310681, 0.7053189, 1.73888, 1, 1, 1, 1, 1,
1.32404, 0.4796374, 0.7336645, 1, 1, 1, 1, 1,
1.331029, 0.8129713, 2.358069, 1, 1, 1, 1, 1,
1.341238, -1.144755, 3.63802, 1, 1, 1, 1, 1,
1.349623, 1.488786, 0.4754333, 1, 1, 1, 1, 1,
1.360471, -0.2627543, 2.251289, 1, 1, 1, 1, 1,
1.364979, 0.5190858, -0.1997183, 1, 1, 1, 1, 1,
1.365683, -1.495432, 3.076241, 1, 1, 1, 1, 1,
1.380251, 0.4927016, 2.099007, 1, 1, 1, 1, 1,
1.382826, -0.1972527, 0.3724683, 1, 1, 1, 1, 1,
1.388181, -2.007489, 1.134923, 1, 1, 1, 1, 1,
1.391106, 0.4065148, -0.05955108, 1, 1, 1, 1, 1,
1.393158, -1.649842, 1.621046, 1, 1, 1, 1, 1,
1.396275, 0.1062396, 1.276841, 0, 0, 1, 1, 1,
1.413675, -0.3408511, 1.747625, 1, 0, 0, 1, 1,
1.41522, 1.04894, 1.384722, 1, 0, 0, 1, 1,
1.421807, 0.4608598, 0.781329, 1, 0, 0, 1, 1,
1.428306, 1.549304, 2.597951, 1, 0, 0, 1, 1,
1.43293, 1.318422, 0.6950896, 1, 0, 0, 1, 1,
1.444761, 0.8107501, 1.376469, 0, 0, 0, 1, 1,
1.461937, -0.07741705, 2.739487, 0, 0, 0, 1, 1,
1.480669, -0.6056856, 1.60164, 0, 0, 0, 1, 1,
1.49674, 0.6335635, 2.925061, 0, 0, 0, 1, 1,
1.499166, 0.9646531, 1.548691, 0, 0, 0, 1, 1,
1.502642, 0.4500545, 1.096075, 0, 0, 0, 1, 1,
1.515022, 0.9854367, 0.6856487, 0, 0, 0, 1, 1,
1.531447, -0.7144897, 1.296709, 1, 1, 1, 1, 1,
1.533736, -0.8367367, 3.732127, 1, 1, 1, 1, 1,
1.535883, -0.4799381, 2.913166, 1, 1, 1, 1, 1,
1.544668, -0.1578151, 2.077423, 1, 1, 1, 1, 1,
1.567466, 1.764883, -0.9618052, 1, 1, 1, 1, 1,
1.569627, 1.056203, 1.928756, 1, 1, 1, 1, 1,
1.57145, -0.6590105, 1.024171, 1, 1, 1, 1, 1,
1.586849, -1.609852, 0.2196897, 1, 1, 1, 1, 1,
1.600526, 0.3914807, 1.476972, 1, 1, 1, 1, 1,
1.608225, 1.702389, 0.0686055, 1, 1, 1, 1, 1,
1.620109, 2.091856, 2.156199, 1, 1, 1, 1, 1,
1.639931, -1.617358, 1.716709, 1, 1, 1, 1, 1,
1.662779, 1.57954, 1.523993, 1, 1, 1, 1, 1,
1.662807, 0.2911826, 3.983021, 1, 1, 1, 1, 1,
1.66533, 0.4927485, 0.6999489, 1, 1, 1, 1, 1,
1.669755, -1.533307, 1.484423, 0, 0, 1, 1, 1,
1.670105, 0.2815689, 1.068182, 1, 0, 0, 1, 1,
1.685639, 0.7102647, 2.083912, 1, 0, 0, 1, 1,
1.692184, -0.007657477, 1.760747, 1, 0, 0, 1, 1,
1.697538, -0.6355246, 2.373096, 1, 0, 0, 1, 1,
1.71403, -0.05234287, 1.602879, 1, 0, 0, 1, 1,
1.7259, -0.7913542, 1.982621, 0, 0, 0, 1, 1,
1.730185, 0.1980542, 1.120482, 0, 0, 0, 1, 1,
1.731405, -1.437792, 0.9989571, 0, 0, 0, 1, 1,
1.7324, 1.308588, 0.1632657, 0, 0, 0, 1, 1,
1.735153, 1.323508, 1.046667, 0, 0, 0, 1, 1,
1.745132, 0.2494455, 2.157593, 0, 0, 0, 1, 1,
1.757437, 1.838342, 0.7834561, 0, 0, 0, 1, 1,
1.768466, -0.6741774, 2.094293, 1, 1, 1, 1, 1,
1.778175, -1.25965, 1.485665, 1, 1, 1, 1, 1,
1.78387, 0.7094957, 1.123449, 1, 1, 1, 1, 1,
1.785696, 1.653907, -0.03663207, 1, 1, 1, 1, 1,
1.79486, -1.464953, 1.324589, 1, 1, 1, 1, 1,
1.81998, -0.2495281, 0.8615758, 1, 1, 1, 1, 1,
1.826717, 0.4850365, 0.7868468, 1, 1, 1, 1, 1,
1.833965, 0.3468509, 3.609903, 1, 1, 1, 1, 1,
1.836321, 0.1816226, -0.02898421, 1, 1, 1, 1, 1,
1.842947, 1.011658, -0.2763919, 1, 1, 1, 1, 1,
1.875253, -0.5797705, 2.44945, 1, 1, 1, 1, 1,
1.882965, 1.692459, 1.091854, 1, 1, 1, 1, 1,
1.892538, -0.306674, 0.9205027, 1, 1, 1, 1, 1,
1.980909, -2.445655, 1.581254, 1, 1, 1, 1, 1,
1.990359, 0.9888773, 0.4022383, 1, 1, 1, 1, 1,
2.026836, -0.6392081, 1.629732, 0, 0, 1, 1, 1,
2.078089, -0.004704407, 1.032769, 1, 0, 0, 1, 1,
2.093306, 0.6688246, 1.515584, 1, 0, 0, 1, 1,
2.133219, -0.2717912, -0.09023425, 1, 0, 0, 1, 1,
2.171205, -1.007118, 2.647003, 1, 0, 0, 1, 1,
2.179413, -1.1364, 1.405153, 1, 0, 0, 1, 1,
2.213489, 0.8942561, 1.280515, 0, 0, 0, 1, 1,
2.346813, 1.297418, 0.1972497, 0, 0, 0, 1, 1,
2.369578, 1.597093, 0.7297401, 0, 0, 0, 1, 1,
2.402027, -1.049074, 2.739645, 0, 0, 0, 1, 1,
2.402415, 0.0310142, 0.4938843, 0, 0, 0, 1, 1,
2.415275, -0.02269307, 0.8454264, 0, 0, 0, 1, 1,
2.469412, 0.8394491, 2.455621, 0, 0, 0, 1, 1,
2.484834, -0.2075778, 2.180409, 1, 1, 1, 1, 1,
2.538772, 0.5534079, 1.03338, 1, 1, 1, 1, 1,
2.685076, 1.749221, 1.328696, 1, 1, 1, 1, 1,
2.694217, 1.223605, 2.568206, 1, 1, 1, 1, 1,
2.77433, 0.4775285, 1.129143, 1, 1, 1, 1, 1,
2.933928, -0.4162639, 1.746536, 1, 1, 1, 1, 1,
3.370113, 1.178211, 2.561032, 1, 1, 1, 1, 1
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
var radius = 10.41206;
var distance = 36.57193;
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
mvMatrix.translate( -0.03334236, -0.3356764, -0.5653324 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.57193);
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
