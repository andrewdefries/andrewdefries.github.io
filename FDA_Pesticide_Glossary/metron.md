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
-2.946854, 0.7084277, -2.441655, 1, 0, 0, 1,
-2.93234, -1.749457, -3.394621, 1, 0.007843138, 0, 1,
-2.923319, -2.895328, -0.9468507, 1, 0.01176471, 0, 1,
-2.844657, -0.4454509, -1.906377, 1, 0.01960784, 0, 1,
-2.639623, -0.6331261, -2.155459, 1, 0.02352941, 0, 1,
-2.600393, 1.049598, -3.115988, 1, 0.03137255, 0, 1,
-2.467254, -0.3861127, -2.003086, 1, 0.03529412, 0, 1,
-2.421356, -1.917321, -2.799908, 1, 0.04313726, 0, 1,
-2.31389, -0.4129432, -3.159698, 1, 0.04705882, 0, 1,
-2.277561, 1.042527, -1.333596, 1, 0.05490196, 0, 1,
-2.210112, 0.3150532, -1.19638, 1, 0.05882353, 0, 1,
-2.191722, -0.5104629, -1.003793, 1, 0.06666667, 0, 1,
-2.125251, -0.4447707, -1.62933, 1, 0.07058824, 0, 1,
-2.122144, -0.4425153, -1.597796, 1, 0.07843138, 0, 1,
-2.105672, 0.9434832, -1.210328, 1, 0.08235294, 0, 1,
-2.104576, 0.2620748, -3.76856, 1, 0.09019608, 0, 1,
-2.077291, -0.4875278, -2.68171, 1, 0.09411765, 0, 1,
-2.062072, 1.435059, -1.379879, 1, 0.1019608, 0, 1,
-2.05794, -0.3822817, -2.952038, 1, 0.1098039, 0, 1,
-2.05617, -1.014799, -3.54645, 1, 0.1137255, 0, 1,
-2.024996, 0.7420966, -4.063886, 1, 0.1215686, 0, 1,
-1.961617, -0.02215049, -2.485469, 1, 0.1254902, 0, 1,
-1.955968, 1.109897, -3.310903, 1, 0.1333333, 0, 1,
-1.930823, 1.195915, -1.536019, 1, 0.1372549, 0, 1,
-1.918425, 1.297357, -1.857688, 1, 0.145098, 0, 1,
-1.899816, 1.900096, -2.695248, 1, 0.1490196, 0, 1,
-1.892231, 0.5736332, -2.134017, 1, 0.1568628, 0, 1,
-1.888228, -0.1499978, -1.894498, 1, 0.1607843, 0, 1,
-1.86702, 0.3743621, -2.273479, 1, 0.1686275, 0, 1,
-1.857279, -0.705447, -2.933697, 1, 0.172549, 0, 1,
-1.853512, -0.5228261, -0.9158443, 1, 0.1803922, 0, 1,
-1.841436, 1.411973, 0.2201156, 1, 0.1843137, 0, 1,
-1.82059, -0.2522551, -0.9427205, 1, 0.1921569, 0, 1,
-1.814319, -0.5978641, -0.7681568, 1, 0.1960784, 0, 1,
-1.81146, 0.5416253, -1.824725, 1, 0.2039216, 0, 1,
-1.793282, -0.306798, -1.635529, 1, 0.2117647, 0, 1,
-1.786133, 0.6726137, -1.373689, 1, 0.2156863, 0, 1,
-1.785334, 0.2780738, -0.8735219, 1, 0.2235294, 0, 1,
-1.785235, 0.9360394, -1.531693, 1, 0.227451, 0, 1,
-1.78372, -0.1587118, 0.5211316, 1, 0.2352941, 0, 1,
-1.757975, 2.341904, -1.44635, 1, 0.2392157, 0, 1,
-1.7576, 0.4067138, -1.659386, 1, 0.2470588, 0, 1,
-1.752169, 1.169828, 1.443039, 1, 0.2509804, 0, 1,
-1.750823, -0.4040985, -0.4652821, 1, 0.2588235, 0, 1,
-1.748299, 0.4324616, -1.08644, 1, 0.2627451, 0, 1,
-1.737919, 2.385396, -0.5395467, 1, 0.2705882, 0, 1,
-1.727513, -0.1975051, -3.257231, 1, 0.2745098, 0, 1,
-1.710773, -1.16269, -1.775596, 1, 0.282353, 0, 1,
-1.700656, -0.2983706, -3.040818, 1, 0.2862745, 0, 1,
-1.696164, -0.6644045, -0.02672659, 1, 0.2941177, 0, 1,
-1.694891, 0.5429979, -0.9141384, 1, 0.3019608, 0, 1,
-1.692882, 0.5957912, 0.1326908, 1, 0.3058824, 0, 1,
-1.6902, 0.6617721, -0.448517, 1, 0.3137255, 0, 1,
-1.689938, 0.785393, 0.3064108, 1, 0.3176471, 0, 1,
-1.688577, 0.7523097, -0.5497738, 1, 0.3254902, 0, 1,
-1.687225, 0.08644077, 0.4389718, 1, 0.3294118, 0, 1,
-1.684285, 1.03442, -0.7326132, 1, 0.3372549, 0, 1,
-1.675683, 1.4847, -0.9963388, 1, 0.3411765, 0, 1,
-1.65639, -1.395167, -2.1055, 1, 0.3490196, 0, 1,
-1.642024, -1.785971, -3.323876, 1, 0.3529412, 0, 1,
-1.628966, 0.9465318, -1.516161, 1, 0.3607843, 0, 1,
-1.625505, -0.7086522, -3.230343, 1, 0.3647059, 0, 1,
-1.616044, -0.5521288, -0.8146388, 1, 0.372549, 0, 1,
-1.59063, 1.022403, -0.1353137, 1, 0.3764706, 0, 1,
-1.583353, -0.9759966, -1.82971, 1, 0.3843137, 0, 1,
-1.575056, -0.3201811, -0.3083259, 1, 0.3882353, 0, 1,
-1.544456, -0.9303898, -2.185546, 1, 0.3960784, 0, 1,
-1.543945, -0.2177687, -0.6958909, 1, 0.4039216, 0, 1,
-1.536864, 1.667247, -1.017906, 1, 0.4078431, 0, 1,
-1.527879, -0.888306, -2.488341, 1, 0.4156863, 0, 1,
-1.520267, 0.5231394, -0.008933094, 1, 0.4196078, 0, 1,
-1.512928, 0.3552629, 0.5210472, 1, 0.427451, 0, 1,
-1.508093, 0.9867804, -0.9938898, 1, 0.4313726, 0, 1,
-1.506489, -0.6700745, -2.329396, 1, 0.4392157, 0, 1,
-1.505724, -1.238641, -2.251932, 1, 0.4431373, 0, 1,
-1.495603, 0.5504574, -3.119418, 1, 0.4509804, 0, 1,
-1.492886, -1.094756, -1.069248, 1, 0.454902, 0, 1,
-1.492442, -0.5061953, -0.9059745, 1, 0.4627451, 0, 1,
-1.488478, 0.4993404, -1.520675, 1, 0.4666667, 0, 1,
-1.478054, 0.08084726, -1.128377, 1, 0.4745098, 0, 1,
-1.47706, -0.9589051, -1.805271, 1, 0.4784314, 0, 1,
-1.469972, -0.9255902, -3.718652, 1, 0.4862745, 0, 1,
-1.468876, 1.255895, -0.2489094, 1, 0.4901961, 0, 1,
-1.463752, 0.1598354, -2.061634, 1, 0.4980392, 0, 1,
-1.46056, 0.4943933, -1.285131, 1, 0.5058824, 0, 1,
-1.445119, -0.7461044, -0.9087462, 1, 0.509804, 0, 1,
-1.434315, 0.7914648, -1.752041, 1, 0.5176471, 0, 1,
-1.433748, -0.8215204, -2.445286, 1, 0.5215687, 0, 1,
-1.430602, -1.037351, -2.241493, 1, 0.5294118, 0, 1,
-1.417452, 0.9628424, -1.126159, 1, 0.5333334, 0, 1,
-1.413163, -0.6362371, -2.153085, 1, 0.5411765, 0, 1,
-1.413008, 1.124017, -2.195435, 1, 0.5450981, 0, 1,
-1.401837, -0.854234, -3.898897, 1, 0.5529412, 0, 1,
-1.400861, 0.6250049, 0.1552665, 1, 0.5568628, 0, 1,
-1.395797, 1.567014, -0.9105998, 1, 0.5647059, 0, 1,
-1.39019, 0.7748044, -0.08422859, 1, 0.5686275, 0, 1,
-1.378137, -0.4059234, -0.7662762, 1, 0.5764706, 0, 1,
-1.368207, -0.5701638, -0.654873, 1, 0.5803922, 0, 1,
-1.364218, -0.08252271, -5.077166, 1, 0.5882353, 0, 1,
-1.354134, -0.4137187, -2.680927, 1, 0.5921569, 0, 1,
-1.351622, 1.390573, -1.883457, 1, 0.6, 0, 1,
-1.351493, -1.523808, -0.002570267, 1, 0.6078432, 0, 1,
-1.34608, 1.273813, -1.57053, 1, 0.6117647, 0, 1,
-1.324986, 0.2360866, -0.3738579, 1, 0.6196079, 0, 1,
-1.305463, 0.3249348, -0.5559826, 1, 0.6235294, 0, 1,
-1.276885, 0.4088716, -0.6138053, 1, 0.6313726, 0, 1,
-1.265634, -0.2099812, -1.676799, 1, 0.6352941, 0, 1,
-1.262938, -1.406859, -2.10064, 1, 0.6431373, 0, 1,
-1.25933, 0.5271765, -0.2798513, 1, 0.6470588, 0, 1,
-1.25706, 0.1871198, -2.852772, 1, 0.654902, 0, 1,
-1.254879, -1.070648, -1.689558, 1, 0.6588235, 0, 1,
-1.237252, 1.055238, 0.5335858, 1, 0.6666667, 0, 1,
-1.236005, -0.1517705, -3.345175, 1, 0.6705883, 0, 1,
-1.224425, 0.6045576, 0.1259097, 1, 0.6784314, 0, 1,
-1.209647, 1.283626, 0.4041727, 1, 0.682353, 0, 1,
-1.202555, 0.8184144, -0.4937767, 1, 0.6901961, 0, 1,
-1.193546, -0.1647462, -1.836459, 1, 0.6941177, 0, 1,
-1.192757, 0.4071536, 0.8215863, 1, 0.7019608, 0, 1,
-1.189265, 1.572352, 0.5254988, 1, 0.7098039, 0, 1,
-1.189216, 1.105542, -0.7902488, 1, 0.7137255, 0, 1,
-1.188404, -0.2481745, -1.721676, 1, 0.7215686, 0, 1,
-1.179385, 0.01672557, -1.040962, 1, 0.7254902, 0, 1,
-1.177328, 1.539759, -2.089793, 1, 0.7333333, 0, 1,
-1.173446, 0.05417715, -1.22846, 1, 0.7372549, 0, 1,
-1.171596, 1.947985, -0.6350363, 1, 0.7450981, 0, 1,
-1.169738, 0.1222805, -1.522227, 1, 0.7490196, 0, 1,
-1.164701, 1.703091, 0.4011825, 1, 0.7568628, 0, 1,
-1.161193, -0.5755837, -1.148038, 1, 0.7607843, 0, 1,
-1.159273, -0.3996034, -2.799496, 1, 0.7686275, 0, 1,
-1.154015, -2.190929, -1.59772, 1, 0.772549, 0, 1,
-1.145661, -0.7038285, -3.289453, 1, 0.7803922, 0, 1,
-1.143685, 0.6938311, -1.381147, 1, 0.7843137, 0, 1,
-1.143282, -0.1688363, -0.4110895, 1, 0.7921569, 0, 1,
-1.140942, 1.355826, -0.4351751, 1, 0.7960784, 0, 1,
-1.136836, 1.81632, -1.227512, 1, 0.8039216, 0, 1,
-1.128943, 0.8593192, -1.845603, 1, 0.8117647, 0, 1,
-1.12815, -1.610597, -3.098206, 1, 0.8156863, 0, 1,
-1.127241, -0.5109137, -2.269929, 1, 0.8235294, 0, 1,
-1.12527, 0.284107, -1.4079, 1, 0.827451, 0, 1,
-1.125082, 0.2558368, 0.05727566, 1, 0.8352941, 0, 1,
-1.11001, -1.051229, -1.068519, 1, 0.8392157, 0, 1,
-1.102569, 0.4818118, -1.844504, 1, 0.8470588, 0, 1,
-1.101563, 0.6778993, -1.077435, 1, 0.8509804, 0, 1,
-1.094701, 0.4205659, -0.9358513, 1, 0.8588235, 0, 1,
-1.085917, -0.9861388, -2.310809, 1, 0.8627451, 0, 1,
-1.08469, 0.7044259, -1.956514, 1, 0.8705882, 0, 1,
-1.081319, -0.2411048, -1.205089, 1, 0.8745098, 0, 1,
-1.076275, -0.4131872, -2.352712, 1, 0.8823529, 0, 1,
-1.072507, -0.6904864, -1.758422, 1, 0.8862745, 0, 1,
-1.06913, 1.329358, -0.2711398, 1, 0.8941177, 0, 1,
-1.068794, 1.397404, 1.103788, 1, 0.8980392, 0, 1,
-1.065773, -0.506341, -2.512806, 1, 0.9058824, 0, 1,
-1.062036, -2.216437, -1.600571, 1, 0.9137255, 0, 1,
-1.059566, -0.5977721, -1.767687, 1, 0.9176471, 0, 1,
-1.057438, -2.756593, -3.75728, 1, 0.9254902, 0, 1,
-1.055254, -1.404867, -1.723018, 1, 0.9294118, 0, 1,
-1.050579, 1.005401, -0.7947278, 1, 0.9372549, 0, 1,
-1.047784, 0.1220069, 0.2149857, 1, 0.9411765, 0, 1,
-1.045756, -0.2780279, -1.262648, 1, 0.9490196, 0, 1,
-1.044664, 1.046157, -1.707196, 1, 0.9529412, 0, 1,
-1.04381, 1.601446, -0.1718518, 1, 0.9607843, 0, 1,
-1.035709, -0.2911329, -1.339858, 1, 0.9647059, 0, 1,
-1.035666, -1.000539, -3.40452, 1, 0.972549, 0, 1,
-1.031734, -0.009151507, -2.890256, 1, 0.9764706, 0, 1,
-1.02362, 1.461595, 0.9985281, 1, 0.9843137, 0, 1,
-1.020641, -2.336385, -3.570622, 1, 0.9882353, 0, 1,
-1.018569, -0.004140118, -0.9540765, 1, 0.9960784, 0, 1,
-1.015666, 0.460994, -1.395921, 0.9960784, 1, 0, 1,
-1.01307, -0.01786221, -2.572955, 0.9921569, 1, 0, 1,
-1.011787, -0.6886215, -1.66006, 0.9843137, 1, 0, 1,
-1.00382, -0.3109713, -0.6720424, 0.9803922, 1, 0, 1,
-1.003567, 1.433475, 1.635957, 0.972549, 1, 0, 1,
-1.003313, 0.7706081, -0.5394431, 0.9686275, 1, 0, 1,
-1.001035, -0.50463, -1.972467, 0.9607843, 1, 0, 1,
-0.9904482, -0.4582651, -1.359048, 0.9568627, 1, 0, 1,
-0.9868056, -0.4144162, -2.738486, 0.9490196, 1, 0, 1,
-0.9856295, 0.5767426, -1.19411, 0.945098, 1, 0, 1,
-0.9849983, 1.701996, 1.328542, 0.9372549, 1, 0, 1,
-0.9795049, 0.7012179, -0.6909602, 0.9333333, 1, 0, 1,
-0.9792957, 1.744238, -0.7615337, 0.9254902, 1, 0, 1,
-0.9745082, 1.76246, -0.3251941, 0.9215686, 1, 0, 1,
-0.9713615, 0.3936746, -1.94564, 0.9137255, 1, 0, 1,
-0.9664997, 0.7113381, -0.9155872, 0.9098039, 1, 0, 1,
-0.9495213, 0.09844159, -2.526522, 0.9019608, 1, 0, 1,
-0.944688, 0.3862501, -0.756575, 0.8941177, 1, 0, 1,
-0.942831, 0.4799242, -1.327125, 0.8901961, 1, 0, 1,
-0.9379141, 0.2322828, -1.039759, 0.8823529, 1, 0, 1,
-0.934527, -0.3595591, -1.776328, 0.8784314, 1, 0, 1,
-0.9340735, -2.333848, -2.076806, 0.8705882, 1, 0, 1,
-0.9333978, -0.3774588, -0.2103548, 0.8666667, 1, 0, 1,
-0.930314, 0.4666513, -1.234229, 0.8588235, 1, 0, 1,
-0.9283941, 0.8820678, 0.4081041, 0.854902, 1, 0, 1,
-0.9257796, -0.6204472, -1.812826, 0.8470588, 1, 0, 1,
-0.9254119, -0.4863126, -1.492927, 0.8431373, 1, 0, 1,
-0.9242542, -1.238074, -1.843545, 0.8352941, 1, 0, 1,
-0.9186699, -0.6690943, -3.418741, 0.8313726, 1, 0, 1,
-0.9146057, 0.7347566, 0.1695067, 0.8235294, 1, 0, 1,
-0.9126804, 1.37967, -0.09029377, 0.8196079, 1, 0, 1,
-0.9105334, -0.2949908, -0.7873299, 0.8117647, 1, 0, 1,
-0.9089363, 0.5730743, -0.8421625, 0.8078431, 1, 0, 1,
-0.9087498, -0.2845318, -2.84748, 0.8, 1, 0, 1,
-0.9047019, -0.37549, -0.3604458, 0.7921569, 1, 0, 1,
-0.8813411, -0.9776163, -0.827365, 0.7882353, 1, 0, 1,
-0.8783319, -3.402367, -5.005849, 0.7803922, 1, 0, 1,
-0.8779318, 0.1989746, -1.600089, 0.7764706, 1, 0, 1,
-0.870872, -1.386555, -0.8217149, 0.7686275, 1, 0, 1,
-0.8707588, 0.2296134, -1.805704, 0.7647059, 1, 0, 1,
-0.8672379, 0.09579968, -1.61921, 0.7568628, 1, 0, 1,
-0.8662807, -1.078707, -2.839617, 0.7529412, 1, 0, 1,
-0.8620173, -0.4874067, -1.907109, 0.7450981, 1, 0, 1,
-0.857805, -1.688777, -3.917167, 0.7411765, 1, 0, 1,
-0.8557712, 0.7849815, -2.63533, 0.7333333, 1, 0, 1,
-0.8553478, -0.3178324, -1.927845, 0.7294118, 1, 0, 1,
-0.8521892, 0.398371, -2.102846, 0.7215686, 1, 0, 1,
-0.8387136, 1.568066, -1.608099, 0.7176471, 1, 0, 1,
-0.8383633, -1.086352, -3.382437, 0.7098039, 1, 0, 1,
-0.8339646, -0.3357195, -2.13457, 0.7058824, 1, 0, 1,
-0.8288931, 0.1558809, -1.852688, 0.6980392, 1, 0, 1,
-0.8285553, 1.644062, 0.4113001, 0.6901961, 1, 0, 1,
-0.8241479, -0.8554792, -2.865794, 0.6862745, 1, 0, 1,
-0.8240237, -1.145056, -4.285755, 0.6784314, 1, 0, 1,
-0.815361, -0.3153476, -1.256815, 0.6745098, 1, 0, 1,
-0.8085861, 2.712856, -1.50949, 0.6666667, 1, 0, 1,
-0.8036827, 1.001964, -3.324389, 0.6627451, 1, 0, 1,
-0.79583, -1.394171, -1.777946, 0.654902, 1, 0, 1,
-0.7930545, 1.545251, 0.3669074, 0.6509804, 1, 0, 1,
-0.7895598, 0.2480201, -2.272257, 0.6431373, 1, 0, 1,
-0.7768128, -1.308694, -2.847929, 0.6392157, 1, 0, 1,
-0.7670147, -0.8801271, 0.07365048, 0.6313726, 1, 0, 1,
-0.7616033, -0.3613699, -3.110151, 0.627451, 1, 0, 1,
-0.7592456, -2.939697, -3.877283, 0.6196079, 1, 0, 1,
-0.755105, 0.128726, -0.8784982, 0.6156863, 1, 0, 1,
-0.7533053, 0.779197, -1.459973, 0.6078432, 1, 0, 1,
-0.7460958, 0.7541057, 0.6790207, 0.6039216, 1, 0, 1,
-0.7424349, -0.1811822, -1.278212, 0.5960785, 1, 0, 1,
-0.7408369, 1.304381, 0.7455649, 0.5882353, 1, 0, 1,
-0.7372109, 0.6358376, -0.02591243, 0.5843138, 1, 0, 1,
-0.7347824, -0.8644841, -2.918282, 0.5764706, 1, 0, 1,
-0.732179, 0.1698966, -1.342062, 0.572549, 1, 0, 1,
-0.7297154, -0.8640052, -0.6545185, 0.5647059, 1, 0, 1,
-0.726881, 1.529768, -0.5253976, 0.5607843, 1, 0, 1,
-0.7242968, 0.7055432, 1.134911, 0.5529412, 1, 0, 1,
-0.7185441, -2.877999, -2.682343, 0.5490196, 1, 0, 1,
-0.7057536, 1.056418, -1.23633, 0.5411765, 1, 0, 1,
-0.6983656, 1.106455, 0.02987808, 0.5372549, 1, 0, 1,
-0.6971002, -0.8807423, -2.826924, 0.5294118, 1, 0, 1,
-0.6943641, 0.7275874, -0.1114101, 0.5254902, 1, 0, 1,
-0.6896023, 0.002468429, -1.193319, 0.5176471, 1, 0, 1,
-0.6893491, -0.9620919, -1.990592, 0.5137255, 1, 0, 1,
-0.6869407, 1.340635, 1.13302, 0.5058824, 1, 0, 1,
-0.6798425, 1.392759, -1.171019, 0.5019608, 1, 0, 1,
-0.6787204, -0.3744314, -2.426394, 0.4941176, 1, 0, 1,
-0.6783065, -0.06763014, -1.400519, 0.4862745, 1, 0, 1,
-0.6780536, -1.181194, -3.918355, 0.4823529, 1, 0, 1,
-0.6773365, -0.3551378, -2.232654, 0.4745098, 1, 0, 1,
-0.6725413, 1.284842, 0.209541, 0.4705882, 1, 0, 1,
-0.6687728, 0.9042115, -0.5874422, 0.4627451, 1, 0, 1,
-0.668459, -0.1335708, -0.928511, 0.4588235, 1, 0, 1,
-0.6629611, 1.269116, -0.03419716, 0.4509804, 1, 0, 1,
-0.6628762, -0.1899702, -4.069202, 0.4470588, 1, 0, 1,
-0.6566482, 0.2099306, 0.884131, 0.4392157, 1, 0, 1,
-0.654975, -1.352071, -1.657766, 0.4352941, 1, 0, 1,
-0.6539671, -0.1374103, -2.953402, 0.427451, 1, 0, 1,
-0.6425712, 2.153058, -0.5858971, 0.4235294, 1, 0, 1,
-0.6397286, -0.5691939, -2.44393, 0.4156863, 1, 0, 1,
-0.6387821, -0.8354338, -2.277412, 0.4117647, 1, 0, 1,
-0.6375271, -0.06071286, -0.1548626, 0.4039216, 1, 0, 1,
-0.6348752, 0.7833517, -0.2206781, 0.3960784, 1, 0, 1,
-0.6348127, -0.1757449, -0.7630484, 0.3921569, 1, 0, 1,
-0.6341742, 0.312251, -1.013627, 0.3843137, 1, 0, 1,
-0.6333824, 2.120317, -0.6219433, 0.3803922, 1, 0, 1,
-0.6298429, 1.087609, -0.2582876, 0.372549, 1, 0, 1,
-0.6292997, 0.4958476, -1.19112, 0.3686275, 1, 0, 1,
-0.6252713, 0.4331446, -0.6906042, 0.3607843, 1, 0, 1,
-0.6163666, 0.2707575, -0.2664347, 0.3568628, 1, 0, 1,
-0.6141917, -1.34033, -2.5121, 0.3490196, 1, 0, 1,
-0.6115217, -0.4366793, -2.499816, 0.345098, 1, 0, 1,
-0.6052393, -1.259578, -4.55904, 0.3372549, 1, 0, 1,
-0.6026531, 1.008231, -0.211597, 0.3333333, 1, 0, 1,
-0.5992942, 0.5521191, -2.085177, 0.3254902, 1, 0, 1,
-0.5968805, -0.4353592, -1.74007, 0.3215686, 1, 0, 1,
-0.5915347, 0.4599099, -0.06419862, 0.3137255, 1, 0, 1,
-0.589693, -1.133911, -1.781974, 0.3098039, 1, 0, 1,
-0.5853115, 0.6411462, -1.454202, 0.3019608, 1, 0, 1,
-0.5818734, -1.178039, -2.674804, 0.2941177, 1, 0, 1,
-0.580986, -0.1863414, -4.390628, 0.2901961, 1, 0, 1,
-0.5804191, 0.164729, -1.449164, 0.282353, 1, 0, 1,
-0.5783249, 0.01723712, -1.154864, 0.2784314, 1, 0, 1,
-0.5765042, -1.512471, -2.860981, 0.2705882, 1, 0, 1,
-0.5726265, 0.1415767, -0.7243639, 0.2666667, 1, 0, 1,
-0.5703299, 1.898548, 0.8975213, 0.2588235, 1, 0, 1,
-0.5691258, -1.024264, -2.335886, 0.254902, 1, 0, 1,
-0.5670829, -0.08291648, -1.096405, 0.2470588, 1, 0, 1,
-0.5651729, 0.4085953, -1.273476, 0.2431373, 1, 0, 1,
-0.5635093, -2.111614, -2.815772, 0.2352941, 1, 0, 1,
-0.5630639, 0.4356521, -1.902212, 0.2313726, 1, 0, 1,
-0.558211, 0.0009597944, -1.516576, 0.2235294, 1, 0, 1,
-0.5522506, -0.2315067, -3.976623, 0.2196078, 1, 0, 1,
-0.5474452, 0.8782494, -0.4331525, 0.2117647, 1, 0, 1,
-0.5441427, -0.2359045, -0.7913999, 0.2078431, 1, 0, 1,
-0.5425586, 1.540169, 0.4116253, 0.2, 1, 0, 1,
-0.5406518, -0.1553222, -2.192428, 0.1921569, 1, 0, 1,
-0.5371073, -0.4290687, -2.973689, 0.1882353, 1, 0, 1,
-0.5199063, -0.3510043, -2.092128, 0.1803922, 1, 0, 1,
-0.5146819, 0.4831626, 1.026149, 0.1764706, 1, 0, 1,
-0.5124153, 1.670789, 0.9844518, 0.1686275, 1, 0, 1,
-0.5052745, 0.3673306, -2.237602, 0.1647059, 1, 0, 1,
-0.5048935, -0.7202369, -4.462541, 0.1568628, 1, 0, 1,
-0.5037858, -0.825487, -3.159149, 0.1529412, 1, 0, 1,
-0.5029713, -0.5871039, -3.100932, 0.145098, 1, 0, 1,
-0.5016577, -1.109164, -3.753963, 0.1411765, 1, 0, 1,
-0.5008587, 1.12459, 0.6829994, 0.1333333, 1, 0, 1,
-0.4923141, 0.9843642, -1.812697, 0.1294118, 1, 0, 1,
-0.4909634, 0.6721696, 0.1367019, 0.1215686, 1, 0, 1,
-0.4883361, 1.062599, -0.1743176, 0.1176471, 1, 0, 1,
-0.4866963, -0.01818557, -2.016496, 0.1098039, 1, 0, 1,
-0.48222, -1.88871, -1.271924, 0.1058824, 1, 0, 1,
-0.4785484, 1.340754, 1.350232, 0.09803922, 1, 0, 1,
-0.4733285, -0.233068, -3.121765, 0.09019608, 1, 0, 1,
-0.4718707, -2.27078, -5.250585, 0.08627451, 1, 0, 1,
-0.4678953, -1.656586, -4.275288, 0.07843138, 1, 0, 1,
-0.4590143, -1.928016, -2.52994, 0.07450981, 1, 0, 1,
-0.4553201, 1.460121, -0.6600504, 0.06666667, 1, 0, 1,
-0.4550655, -0.6650287, -1.805649, 0.0627451, 1, 0, 1,
-0.4504284, 1.393526, -1.031168, 0.05490196, 1, 0, 1,
-0.4496653, 1.374136, -0.6511215, 0.05098039, 1, 0, 1,
-0.4474561, 0.6965321, -0.2211414, 0.04313726, 1, 0, 1,
-0.4435098, 0.321784, 1.064819, 0.03921569, 1, 0, 1,
-0.4401481, 1.091171, -1.054698, 0.03137255, 1, 0, 1,
-0.4384773, 1.221663, -0.9075227, 0.02745098, 1, 0, 1,
-0.4371039, -0.316101, -1.193577, 0.01960784, 1, 0, 1,
-0.4356498, 0.4638382, 0.2596161, 0.01568628, 1, 0, 1,
-0.4323127, 1.400108, -0.1050266, 0.007843138, 1, 0, 1,
-0.430209, 0.9595079, 0.9458221, 0.003921569, 1, 0, 1,
-0.4293467, -0.63175, -2.233582, 0, 1, 0.003921569, 1,
-0.4277523, -0.9537535, -0.6242135, 0, 1, 0.01176471, 1,
-0.4203442, -0.4321971, -2.317538, 0, 1, 0.01568628, 1,
-0.418268, -1.265222, -4.158125, 0, 1, 0.02352941, 1,
-0.4175336, -0.4576395, -1.713822, 0, 1, 0.02745098, 1,
-0.4146034, 0.80354, -0.9794459, 0, 1, 0.03529412, 1,
-0.4116202, 0.7957013, -1.257522, 0, 1, 0.03921569, 1,
-0.407176, -1.084317, -0.3721139, 0, 1, 0.04705882, 1,
-0.4008553, -0.8492703, -3.968497, 0, 1, 0.05098039, 1,
-0.3981717, 0.2869856, 0.2658889, 0, 1, 0.05882353, 1,
-0.3961728, -0.1303656, -2.974511, 0, 1, 0.0627451, 1,
-0.3958094, 0.1370575, -1.987629, 0, 1, 0.07058824, 1,
-0.3955739, 0.120879, 0.2620124, 0, 1, 0.07450981, 1,
-0.3951573, -0.2222116, -1.511444, 0, 1, 0.08235294, 1,
-0.3921086, 1.039674, -0.3209466, 0, 1, 0.08627451, 1,
-0.3875398, 0.3869655, -1.42964, 0, 1, 0.09411765, 1,
-0.3779049, -1.947449, -3.353861, 0, 1, 0.1019608, 1,
-0.3762333, 1.723538, -0.8100744, 0, 1, 0.1058824, 1,
-0.3762187, -0.8125491, -3.250574, 0, 1, 0.1137255, 1,
-0.3747176, 0.2177816, -0.1603079, 0, 1, 0.1176471, 1,
-0.3725359, 0.8047028, -0.2736765, 0, 1, 0.1254902, 1,
-0.3706205, 1.164051, 0.6929237, 0, 1, 0.1294118, 1,
-0.3695002, -0.839961, -2.291297, 0, 1, 0.1372549, 1,
-0.3630379, -1.499654, -2.892155, 0, 1, 0.1411765, 1,
-0.3560394, 1.496353, -1.346005, 0, 1, 0.1490196, 1,
-0.3556909, 1.399298, -1.297714, 0, 1, 0.1529412, 1,
-0.3520372, 0.7251929, -1.59733, 0, 1, 0.1607843, 1,
-0.3464865, 0.3731361, -0.4073075, 0, 1, 0.1647059, 1,
-0.345396, 0.3676552, 0.6232536, 0, 1, 0.172549, 1,
-0.3452674, -0.3724367, -2.718344, 0, 1, 0.1764706, 1,
-0.3392061, -1.072997, -2.998385, 0, 1, 0.1843137, 1,
-0.3312471, 3.179771, -1.70929, 0, 1, 0.1882353, 1,
-0.329979, -0.5104597, -1.669061, 0, 1, 0.1960784, 1,
-0.3295332, -0.1621793, -1.621616, 0, 1, 0.2039216, 1,
-0.3255491, -1.000434, -1.059281, 0, 1, 0.2078431, 1,
-0.3198982, -0.3162998, -3.537931, 0, 1, 0.2156863, 1,
-0.3153869, 0.8806295, 0.9953366, 0, 1, 0.2196078, 1,
-0.304458, -0.5125727, -2.203738, 0, 1, 0.227451, 1,
-0.3044178, 0.1360925, 0.2620985, 0, 1, 0.2313726, 1,
-0.3040067, 0.1468738, -1.535238, 0, 1, 0.2392157, 1,
-0.2989267, -0.3377774, -2.340482, 0, 1, 0.2431373, 1,
-0.2965598, 0.1679523, -0.7160999, 0, 1, 0.2509804, 1,
-0.2960661, -0.7672536, -3.408344, 0, 1, 0.254902, 1,
-0.2959994, -0.238749, -3.128732, 0, 1, 0.2627451, 1,
-0.2957285, 2.229758, -2.62275, 0, 1, 0.2666667, 1,
-0.2937577, 0.5689983, 1.645204, 0, 1, 0.2745098, 1,
-0.2926778, -1.596062, -5.031252, 0, 1, 0.2784314, 1,
-0.2901646, -0.4894101, -1.697597, 0, 1, 0.2862745, 1,
-0.2880475, -0.6037768, -4.029881, 0, 1, 0.2901961, 1,
-0.287139, -0.1939092, -2.242173, 0, 1, 0.2980392, 1,
-0.2863798, -1.392037, -2.30635, 0, 1, 0.3058824, 1,
-0.2862926, -1.103161, -2.918507, 0, 1, 0.3098039, 1,
-0.2824143, -0.1120401, -2.571532, 0, 1, 0.3176471, 1,
-0.2755433, 0.4595218, -1.214808, 0, 1, 0.3215686, 1,
-0.2721724, -0.7515035, -1.877126, 0, 1, 0.3294118, 1,
-0.2674888, 0.4614792, -1.42576, 0, 1, 0.3333333, 1,
-0.2663127, 0.3970192, -0.2519657, 0, 1, 0.3411765, 1,
-0.2554478, -1.092445, -3.778529, 0, 1, 0.345098, 1,
-0.2514547, 0.7225116, -0.4250053, 0, 1, 0.3529412, 1,
-0.251238, -1.217815, -1.165955, 0, 1, 0.3568628, 1,
-0.2485975, 1.060869, -0.3839917, 0, 1, 0.3647059, 1,
-0.2458817, -0.6315194, -0.7849616, 0, 1, 0.3686275, 1,
-0.2451526, -1.245023, -3.577734, 0, 1, 0.3764706, 1,
-0.2437301, -1.14453, -1.761225, 0, 1, 0.3803922, 1,
-0.2407559, 0.04772712, -2.320807, 0, 1, 0.3882353, 1,
-0.2386083, -0.4593319, -3.616728, 0, 1, 0.3921569, 1,
-0.232774, 0.2533319, 0.1171158, 0, 1, 0.4, 1,
-0.2325312, 1.341685, -1.541151, 0, 1, 0.4078431, 1,
-0.2309761, 0.6466323, -1.82734, 0, 1, 0.4117647, 1,
-0.2284323, 0.5122947, -2.702897, 0, 1, 0.4196078, 1,
-0.2262223, -0.3356891, -1.81341, 0, 1, 0.4235294, 1,
-0.2256274, -0.5458357, -3.066657, 0, 1, 0.4313726, 1,
-0.2247363, 0.8403457, -0.3488783, 0, 1, 0.4352941, 1,
-0.2241065, 0.6679801, -2.093169, 0, 1, 0.4431373, 1,
-0.2102121, 1.335037, -0.7662401, 0, 1, 0.4470588, 1,
-0.2098524, 0.4547025, 0.7820579, 0, 1, 0.454902, 1,
-0.207895, -1.388029, -2.356021, 0, 1, 0.4588235, 1,
-0.206359, 0.3014967, -2.569315, 0, 1, 0.4666667, 1,
-0.2043868, -0.5847382, -1.796654, 0, 1, 0.4705882, 1,
-0.2037025, -1.276439, -2.271361, 0, 1, 0.4784314, 1,
-0.2015913, 1.717246, -1.406531, 0, 1, 0.4823529, 1,
-0.2005301, -0.6934437, -1.256641, 0, 1, 0.4901961, 1,
-0.1988092, -0.7973315, -3.817264, 0, 1, 0.4941176, 1,
-0.1986768, -0.6785111, -3.948551, 0, 1, 0.5019608, 1,
-0.1952412, 1.021347, -0.08144831, 0, 1, 0.509804, 1,
-0.1915796, 1.27526, 0.1035243, 0, 1, 0.5137255, 1,
-0.1898885, -0.1784853, -2.095155, 0, 1, 0.5215687, 1,
-0.1869452, 1.622454, 0.01928268, 0, 1, 0.5254902, 1,
-0.1863022, -0.5758426, -2.555261, 0, 1, 0.5333334, 1,
-0.1845787, 1.506994, -1.428141, 0, 1, 0.5372549, 1,
-0.1834746, -1.035546, -3.324724, 0, 1, 0.5450981, 1,
-0.1793068, 0.4742065, -1.395585, 0, 1, 0.5490196, 1,
-0.1691881, -0.3539089, -3.017839, 0, 1, 0.5568628, 1,
-0.1606582, -0.9360606, -2.749165, 0, 1, 0.5607843, 1,
-0.1432008, -0.8031765, -2.48307, 0, 1, 0.5686275, 1,
-0.1429316, 0.8218037, -0.2677686, 0, 1, 0.572549, 1,
-0.1417693, -1.485141, -2.255646, 0, 1, 0.5803922, 1,
-0.1405305, -0.3816089, -2.151717, 0, 1, 0.5843138, 1,
-0.1357981, -1.544316, -3.031555, 0, 1, 0.5921569, 1,
-0.1354275, -0.06705573, -1.828029, 0, 1, 0.5960785, 1,
-0.1270053, 0.3648564, -0.7227657, 0, 1, 0.6039216, 1,
-0.1265008, -0.908691, -1.336182, 0, 1, 0.6117647, 1,
-0.118533, -0.9925768, -2.895845, 0, 1, 0.6156863, 1,
-0.117895, 0.4049321, -0.2498853, 0, 1, 0.6235294, 1,
-0.1156031, -0.6160708, -2.419331, 0, 1, 0.627451, 1,
-0.1066257, 0.4844642, 0.2836031, 0, 1, 0.6352941, 1,
-0.1063244, 1.862815, -0.93365, 0, 1, 0.6392157, 1,
-0.1040799, -1.373292, -3.215766, 0, 1, 0.6470588, 1,
-0.100664, 1.146617, 0.7473469, 0, 1, 0.6509804, 1,
-0.09950899, 0.7023144, -0.1024724, 0, 1, 0.6588235, 1,
-0.09935242, -0.2467571, -3.316283, 0, 1, 0.6627451, 1,
-0.0985815, 0.04921113, -0.9251722, 0, 1, 0.6705883, 1,
-0.09691338, 1.549807, -1.950985, 0, 1, 0.6745098, 1,
-0.09471609, -0.2970245, -4.464101, 0, 1, 0.682353, 1,
-0.09378196, -1.036056, -2.447225, 0, 1, 0.6862745, 1,
-0.0919633, -0.05004885, -1.689365, 0, 1, 0.6941177, 1,
-0.08940463, 0.4931723, 1.072697, 0, 1, 0.7019608, 1,
-0.08837993, 0.7439908, -0.3337798, 0, 1, 0.7058824, 1,
-0.08652772, 0.4387005, 0.9276782, 0, 1, 0.7137255, 1,
-0.08302198, -0.03681563, -2.421214, 0, 1, 0.7176471, 1,
-0.08026297, 0.5448604, -0.2481762, 0, 1, 0.7254902, 1,
-0.07962579, -0.06178181, -1.581908, 0, 1, 0.7294118, 1,
-0.07736484, -0.6801926, -1.972811, 0, 1, 0.7372549, 1,
-0.07717278, 1.399191, 1.275679, 0, 1, 0.7411765, 1,
-0.07578772, -1.121864, -3.984505, 0, 1, 0.7490196, 1,
-0.07445085, 1.161239, 1.00464, 0, 1, 0.7529412, 1,
-0.07326816, 1.349391, 2.086145, 0, 1, 0.7607843, 1,
-0.06533342, -1.97077, -3.862628, 0, 1, 0.7647059, 1,
-0.06508397, 1.13934, -0.4658732, 0, 1, 0.772549, 1,
-0.06206274, 0.1368583, -1.870793, 0, 1, 0.7764706, 1,
-0.06104273, -0.2228078, -3.363355, 0, 1, 0.7843137, 1,
-0.05597404, 1.094895, 1.275135, 0, 1, 0.7882353, 1,
-0.05544037, -0.8207832, -2.147082, 0, 1, 0.7960784, 1,
-0.05493559, 1.382965, -0.8861359, 0, 1, 0.8039216, 1,
-0.05330806, 0.5177859, -1.61659, 0, 1, 0.8078431, 1,
-0.04974461, 0.2646839, 0.8506576, 0, 1, 0.8156863, 1,
-0.04817158, -0.843381, -3.239076, 0, 1, 0.8196079, 1,
-0.04706526, 0.8884041, -0.4046762, 0, 1, 0.827451, 1,
-0.04617292, -0.2955235, -3.096555, 0, 1, 0.8313726, 1,
-0.04426242, 0.001215764, -1.511356, 0, 1, 0.8392157, 1,
-0.0438905, -0.2202775, -2.780311, 0, 1, 0.8431373, 1,
-0.03923361, -1.629284, -3.361033, 0, 1, 0.8509804, 1,
-0.03864033, -1.393048, -3.13727, 0, 1, 0.854902, 1,
-0.03781898, 1.527039, 2.407763, 0, 1, 0.8627451, 1,
-0.03732698, 2.556529, 1.33494, 0, 1, 0.8666667, 1,
-0.0363982, 0.8079987, -0.2338304, 0, 1, 0.8745098, 1,
-0.03306818, -0.8126093, -2.031747, 0, 1, 0.8784314, 1,
-0.03292519, 2.003558, 0.1082752, 0, 1, 0.8862745, 1,
-0.02990487, -0.4104405, -1.446596, 0, 1, 0.8901961, 1,
-0.02893831, -0.9436892, -1.912949, 0, 1, 0.8980392, 1,
-0.02621748, -1.063653, -2.439259, 0, 1, 0.9058824, 1,
-0.0254348, -0.4820408, -3.98061, 0, 1, 0.9098039, 1,
-0.0253153, 0.4145627, -0.2739786, 0, 1, 0.9176471, 1,
-0.02525066, -0.3519644, -2.470866, 0, 1, 0.9215686, 1,
-0.02384924, 1.323159, -0.7912572, 0, 1, 0.9294118, 1,
-0.0218387, -1.402628, -1.963264, 0, 1, 0.9333333, 1,
-0.01825787, 1.334345, -0.1969382, 0, 1, 0.9411765, 1,
-0.01611127, 1.492545, -1.43438, 0, 1, 0.945098, 1,
-0.01115808, 0.6664492, 0.6295558, 0, 1, 0.9529412, 1,
-0.009689776, 0.386923, 0.1180392, 0, 1, 0.9568627, 1,
-0.00929742, 1.407076, 0.1665717, 0, 1, 0.9647059, 1,
-0.0071107, 2.511096, -0.3435206, 0, 1, 0.9686275, 1,
-0.003521896, -0.1924208, -4.216866, 0, 1, 0.9764706, 1,
-0.002449639, -0.3360427, -3.132869, 0, 1, 0.9803922, 1,
0.001797073, 1.026465, -1.604597, 0, 1, 0.9882353, 1,
0.004826049, -1.096974, 3.926836, 0, 1, 0.9921569, 1,
0.005618426, -1.019117, 4.165245, 0, 1, 1, 1,
0.00703865, -2.035005, 4.062233, 0, 0.9921569, 1, 1,
0.009178722, -0.2388331, 2.410632, 0, 0.9882353, 1, 1,
0.01180906, -0.859415, 4.879819, 0, 0.9803922, 1, 1,
0.01444442, -0.606591, 1.647763, 0, 0.9764706, 1, 1,
0.01485705, -1.222053, 3.268738, 0, 0.9686275, 1, 1,
0.01487029, -0.8471786, 3.410253, 0, 0.9647059, 1, 1,
0.01781829, 1.335268, 0.391358, 0, 0.9568627, 1, 1,
0.01803494, -1.761972, 3.804353, 0, 0.9529412, 1, 1,
0.01864675, 1.093173, 0.5599788, 0, 0.945098, 1, 1,
0.01910005, 0.8175377, 0.5060692, 0, 0.9411765, 1, 1,
0.01974428, 0.3481764, 0.6553032, 0, 0.9333333, 1, 1,
0.02046787, 0.8600159, 0.2735854, 0, 0.9294118, 1, 1,
0.02354435, -0.4133104, 3.622041, 0, 0.9215686, 1, 1,
0.02776278, 0.5587536, -1.92068, 0, 0.9176471, 1, 1,
0.02964376, -0.4991024, 2.477674, 0, 0.9098039, 1, 1,
0.02999449, 0.2935526, 0.6040859, 0, 0.9058824, 1, 1,
0.03088881, -0.05791778, 1.455295, 0, 0.8980392, 1, 1,
0.03535541, 0.134052, 0.9135802, 0, 0.8901961, 1, 1,
0.03549189, 0.6156098, 0.6053408, 0, 0.8862745, 1, 1,
0.03645714, -0.4139562, 2.826798, 0, 0.8784314, 1, 1,
0.0376884, -0.4279584, 3.599586, 0, 0.8745098, 1, 1,
0.03915456, 0.1746237, -0.6390992, 0, 0.8666667, 1, 1,
0.04189255, 0.01205392, 1.475364, 0, 0.8627451, 1, 1,
0.04298284, -0.1631058, 2.313237, 0, 0.854902, 1, 1,
0.04305905, 0.7114642, -0.9711934, 0, 0.8509804, 1, 1,
0.04378873, 1.083573, -0.008622067, 0, 0.8431373, 1, 1,
0.04980282, -0.1401405, 4.570266, 0, 0.8392157, 1, 1,
0.05778681, 0.8623652, -0.1850301, 0, 0.8313726, 1, 1,
0.06218842, 0.7939352, 0.523276, 0, 0.827451, 1, 1,
0.06521052, 0.4324987, -0.6041982, 0, 0.8196079, 1, 1,
0.0671135, 0.9899388, -0.4643542, 0, 0.8156863, 1, 1,
0.06743783, -2.395374, 3.799339, 0, 0.8078431, 1, 1,
0.075195, 2.100946, 0.1722891, 0, 0.8039216, 1, 1,
0.07681751, -1.197662, 2.200607, 0, 0.7960784, 1, 1,
0.07849312, -1.107364, 4.076949, 0, 0.7882353, 1, 1,
0.07982962, 0.8118173, 1.85258, 0, 0.7843137, 1, 1,
0.08491488, -0.1781318, 2.858464, 0, 0.7764706, 1, 1,
0.08609107, -1.66527, 3.417526, 0, 0.772549, 1, 1,
0.09225378, -0.03378564, 3.209517, 0, 0.7647059, 1, 1,
0.0948161, 0.7296786, 0.213449, 0, 0.7607843, 1, 1,
0.09646045, 0.1198581, 0.4361445, 0, 0.7529412, 1, 1,
0.108054, 0.3079412, 0.9580734, 0, 0.7490196, 1, 1,
0.115089, 0.9270779, 0.1527429, 0, 0.7411765, 1, 1,
0.1154355, -0.1338938, 3.8358, 0, 0.7372549, 1, 1,
0.1191329, -0.5606235, 5.068721, 0, 0.7294118, 1, 1,
0.119675, -0.9874499, 0.8441326, 0, 0.7254902, 1, 1,
0.1211601, -1.858881, 1.846934, 0, 0.7176471, 1, 1,
0.1238483, -1.080591, 0.9225923, 0, 0.7137255, 1, 1,
0.1260048, -0.5763108, 3.741488, 0, 0.7058824, 1, 1,
0.1289557, 0.02078046, 1.466217, 0, 0.6980392, 1, 1,
0.1340834, 1.490396, 2.28057, 0, 0.6941177, 1, 1,
0.1388079, 0.00415484, 1.31792, 0, 0.6862745, 1, 1,
0.1427264, -1.110672, 3.586933, 0, 0.682353, 1, 1,
0.1479457, -0.2257062, 2.812295, 0, 0.6745098, 1, 1,
0.1575791, 0.05674666, -0.8752531, 0, 0.6705883, 1, 1,
0.1654282, 0.741582, -0.0324556, 0, 0.6627451, 1, 1,
0.1661853, 0.3471911, 0.07853684, 0, 0.6588235, 1, 1,
0.1732061, 1.007925, -0.9941915, 0, 0.6509804, 1, 1,
0.1753486, 0.2684157, -0.01113405, 0, 0.6470588, 1, 1,
0.1759361, -0.2181395, 2.675225, 0, 0.6392157, 1, 1,
0.182899, 0.1616893, 2.277283, 0, 0.6352941, 1, 1,
0.1849717, 0.04544383, 0.1269128, 0, 0.627451, 1, 1,
0.1889067, -0.3640731, 2.748938, 0, 0.6235294, 1, 1,
0.196169, 0.8753936, 0.14422, 0, 0.6156863, 1, 1,
0.2005664, 0.8555385, -0.8210385, 0, 0.6117647, 1, 1,
0.2016163, 2.553909, -0.1014188, 0, 0.6039216, 1, 1,
0.2067431, 0.05272531, 2.364724, 0, 0.5960785, 1, 1,
0.2075416, 0.2054438, 2.510715, 0, 0.5921569, 1, 1,
0.208178, -1.805873, 3.406512, 0, 0.5843138, 1, 1,
0.2153705, -1.5273, 3.399639, 0, 0.5803922, 1, 1,
0.2191304, -1.164061, 1.4027, 0, 0.572549, 1, 1,
0.2226699, -0.8222593, 0.7612281, 0, 0.5686275, 1, 1,
0.2236683, 0.9730607, 0.5520716, 0, 0.5607843, 1, 1,
0.2239939, 0.118571, 2.049627, 0, 0.5568628, 1, 1,
0.2323188, 0.04398596, 1.383017, 0, 0.5490196, 1, 1,
0.2390514, -0.0749317, 2.626234, 0, 0.5450981, 1, 1,
0.239476, 0.6461158, 1.463801, 0, 0.5372549, 1, 1,
0.2408276, -0.07913569, 1.251684, 0, 0.5333334, 1, 1,
0.242219, -1.339728, 2.857079, 0, 0.5254902, 1, 1,
0.2435418, -1.205088, 2.771328, 0, 0.5215687, 1, 1,
0.2440909, -0.03840525, 1.270522, 0, 0.5137255, 1, 1,
0.2444915, 1.709382, 0.8211403, 0, 0.509804, 1, 1,
0.2524649, -0.09042452, 2.240577, 0, 0.5019608, 1, 1,
0.2573622, -0.6049475, 0.882741, 0, 0.4941176, 1, 1,
0.2593892, 0.6922014, 0.7452254, 0, 0.4901961, 1, 1,
0.2624903, -0.4841911, 3.102641, 0, 0.4823529, 1, 1,
0.2636311, -0.3503175, 2.978174, 0, 0.4784314, 1, 1,
0.26415, 1.270023, -0.07515436, 0, 0.4705882, 1, 1,
0.2689029, 1.164063, 1.282256, 0, 0.4666667, 1, 1,
0.2718143, -0.09477277, 3.698418, 0, 0.4588235, 1, 1,
0.2741994, -1.779977, 2.288073, 0, 0.454902, 1, 1,
0.2746487, 0.3649658, -0.728101, 0, 0.4470588, 1, 1,
0.2746763, -0.6998637, 1.062649, 0, 0.4431373, 1, 1,
0.2750577, -0.1300899, 2.225568, 0, 0.4352941, 1, 1,
0.2753537, -0.3333811, 2.718638, 0, 0.4313726, 1, 1,
0.2767176, 1.285807, -0.7007286, 0, 0.4235294, 1, 1,
0.2794911, 0.101858, 1.302153, 0, 0.4196078, 1, 1,
0.2814046, 0.9071661, 0.02096807, 0, 0.4117647, 1, 1,
0.2878808, -1.33282, 3.106091, 0, 0.4078431, 1, 1,
0.2903891, -0.8600439, 1.916114, 0, 0.4, 1, 1,
0.2962634, -0.4517785, 3.819245, 0, 0.3921569, 1, 1,
0.3015919, 1.329862, 0.3125273, 0, 0.3882353, 1, 1,
0.301825, -1.014168, 4.085738, 0, 0.3803922, 1, 1,
0.3019219, -0.1612195, 0.4911913, 0, 0.3764706, 1, 1,
0.3020569, 0.005392363, 0.4891271, 0, 0.3686275, 1, 1,
0.3023676, 0.2565485, 1.093541, 0, 0.3647059, 1, 1,
0.305126, 1.067936, 0.9049783, 0, 0.3568628, 1, 1,
0.3117254, -1.842606, 1.533204, 0, 0.3529412, 1, 1,
0.3125656, 1.20053, -0.5829694, 0, 0.345098, 1, 1,
0.3132996, 0.3659633, 0.1017191, 0, 0.3411765, 1, 1,
0.316626, 1.843488, -0.6496448, 0, 0.3333333, 1, 1,
0.3181863, 2.039907, 0.7413424, 0, 0.3294118, 1, 1,
0.3187792, -0.2138159, 2.407514, 0, 0.3215686, 1, 1,
0.3200185, 0.07758003, 2.444112, 0, 0.3176471, 1, 1,
0.3208729, -0.9342065, 2.5896, 0, 0.3098039, 1, 1,
0.3237688, -0.9824256, 1.642502, 0, 0.3058824, 1, 1,
0.3257621, -0.4928897, 2.070394, 0, 0.2980392, 1, 1,
0.3265001, -0.03595015, 1.431565, 0, 0.2901961, 1, 1,
0.3290972, -0.5396996, 2.549991, 0, 0.2862745, 1, 1,
0.3342149, -0.6471751, 2.73403, 0, 0.2784314, 1, 1,
0.3348832, 1.068973, -0.8700708, 0, 0.2745098, 1, 1,
0.3386008, 0.3698522, -1.116466, 0, 0.2666667, 1, 1,
0.3387893, -0.2090277, 1.798826, 0, 0.2627451, 1, 1,
0.3449006, 0.311993, 2.235852, 0, 0.254902, 1, 1,
0.352315, 0.3573482, -0.6076837, 0, 0.2509804, 1, 1,
0.3571351, -0.3027324, 1.945951, 0, 0.2431373, 1, 1,
0.3619286, 0.304003, -0.9464723, 0, 0.2392157, 1, 1,
0.3627288, -0.3408387, 1.713267, 0, 0.2313726, 1, 1,
0.3632166, 0.1984692, 1.148908, 0, 0.227451, 1, 1,
0.3644391, -0.8341623, 2.763768, 0, 0.2196078, 1, 1,
0.3679025, 1.112495, -0.9643548, 0, 0.2156863, 1, 1,
0.3722995, 1.14393, -0.5147853, 0, 0.2078431, 1, 1,
0.3746493, -0.3189016, 2.692127, 0, 0.2039216, 1, 1,
0.3751242, -0.7926728, 2.163203, 0, 0.1960784, 1, 1,
0.3755621, 0.4168114, 0.641311, 0, 0.1882353, 1, 1,
0.3767667, -0.9620371, 0.5489821, 0, 0.1843137, 1, 1,
0.3782417, -0.5341005, 2.767298, 0, 0.1764706, 1, 1,
0.3784493, 0.07944288, 1.536604, 0, 0.172549, 1, 1,
0.3793284, 0.369557, 1.957461, 0, 0.1647059, 1, 1,
0.384784, -0.3861071, 2.696218, 0, 0.1607843, 1, 1,
0.3918339, 0.5264137, 1.319305, 0, 0.1529412, 1, 1,
0.3919575, -0.748584, 2.28495, 0, 0.1490196, 1, 1,
0.3980676, 0.7327891, 0.9783783, 0, 0.1411765, 1, 1,
0.4017722, -0.9115386, 3.445105, 0, 0.1372549, 1, 1,
0.4064504, -0.11979, 2.160247, 0, 0.1294118, 1, 1,
0.411648, 0.9800814, -0.03565592, 0, 0.1254902, 1, 1,
0.4122637, -1.372852, 3.150697, 0, 0.1176471, 1, 1,
0.4191225, 0.5723469, 1.938254, 0, 0.1137255, 1, 1,
0.4343347, 0.03600537, 2.372161, 0, 0.1058824, 1, 1,
0.4354213, 0.3241152, 0.7282293, 0, 0.09803922, 1, 1,
0.4457203, 0.5551198, 0.1388334, 0, 0.09411765, 1, 1,
0.4547376, 0.02219901, 0.7589511, 0, 0.08627451, 1, 1,
0.4559762, 0.1530554, 1.712438, 0, 0.08235294, 1, 1,
0.4595724, 0.03396288, -0.8557674, 0, 0.07450981, 1, 1,
0.4599326, 0.341166, -0.6767885, 0, 0.07058824, 1, 1,
0.4612078, -0.1573002, 3.271293, 0, 0.0627451, 1, 1,
0.4658464, -0.9432321, 2.960318, 0, 0.05882353, 1, 1,
0.4664465, 1.14871, 1.048681, 0, 0.05098039, 1, 1,
0.4690649, -0.8214712, 3.134449, 0, 0.04705882, 1, 1,
0.4701449, 1.821452, -0.5183561, 0, 0.03921569, 1, 1,
0.4718825, 1.255993, 0.3418471, 0, 0.03529412, 1, 1,
0.4827664, -1.292999, 5.945232, 0, 0.02745098, 1, 1,
0.4833494, -0.3522601, 2.642716, 0, 0.02352941, 1, 1,
0.4897726, 1.978423, 0.5523603, 0, 0.01568628, 1, 1,
0.4907879, -0.2430561, 0.5456498, 0, 0.01176471, 1, 1,
0.4909119, 0.34615, 0.8001134, 0, 0.003921569, 1, 1,
0.5024056, -0.158922, 1.72702, 0.003921569, 0, 1, 1,
0.5071892, -1.576406, 4.061312, 0.007843138, 0, 1, 1,
0.5074529, -0.1984246, 4.222702, 0.01568628, 0, 1, 1,
0.5083581, -0.9033663, 2.233789, 0.01960784, 0, 1, 1,
0.5094026, -0.9066782, 4.363111, 0.02745098, 0, 1, 1,
0.5119266, 0.4960607, 1.206401, 0.03137255, 0, 1, 1,
0.5119941, 1.201855, 1.853027, 0.03921569, 0, 1, 1,
0.5175147, -1.022289, 3.69697, 0.04313726, 0, 1, 1,
0.5182165, 1.048138, -0.0347741, 0.05098039, 0, 1, 1,
0.5189509, -0.03401191, 3.469655, 0.05490196, 0, 1, 1,
0.5265778, 0.4137736, 0.9385577, 0.0627451, 0, 1, 1,
0.5273079, -1.528741, 2.031882, 0.06666667, 0, 1, 1,
0.5286286, 0.9070207, 2.369433, 0.07450981, 0, 1, 1,
0.5289376, 0.6336235, 0.3444429, 0.07843138, 0, 1, 1,
0.5299979, -0.484178, 0.3651806, 0.08627451, 0, 1, 1,
0.5407556, 1.055467, -0.2515692, 0.09019608, 0, 1, 1,
0.5443606, 1.033402, 0.1934375, 0.09803922, 0, 1, 1,
0.5467727, -0.6009367, 2.384251, 0.1058824, 0, 1, 1,
0.5483645, 1.040133, 0.05353153, 0.1098039, 0, 1, 1,
0.5534768, 0.3194894, -0.1081417, 0.1176471, 0, 1, 1,
0.5554026, -0.558755, 3.376808, 0.1215686, 0, 1, 1,
0.5557938, 0.4019771, 1.917704, 0.1294118, 0, 1, 1,
0.5575216, 0.08643022, 2.542554, 0.1333333, 0, 1, 1,
0.5608565, 0.5408685, 1.163963, 0.1411765, 0, 1, 1,
0.5625315, 1.928303, 0.3748028, 0.145098, 0, 1, 1,
0.5643123, -0.4942624, 0.7955982, 0.1529412, 0, 1, 1,
0.5672382, -0.5780082, 2.424946, 0.1568628, 0, 1, 1,
0.5676464, -1.147751, 4.31971, 0.1647059, 0, 1, 1,
0.56863, -0.461519, 3.953254, 0.1686275, 0, 1, 1,
0.5719385, 0.08576107, -0.270871, 0.1764706, 0, 1, 1,
0.5749459, 0.2057697, 0.9710304, 0.1803922, 0, 1, 1,
0.575632, 0.08891056, 0.5030246, 0.1882353, 0, 1, 1,
0.5766889, 0.9996276, 1.197114, 0.1921569, 0, 1, 1,
0.5786678, 0.4549023, 1.218962, 0.2, 0, 1, 1,
0.5812321, 1.164959, -0.5394647, 0.2078431, 0, 1, 1,
0.5819348, -0.5993146, 0.09505899, 0.2117647, 0, 1, 1,
0.5833893, 0.5549039, 1.799672, 0.2196078, 0, 1, 1,
0.5835994, 1.618941, -0.09611133, 0.2235294, 0, 1, 1,
0.5849154, -1.341557, 0.7749138, 0.2313726, 0, 1, 1,
0.586555, -0.4610399, 3.779974, 0.2352941, 0, 1, 1,
0.5866898, 0.191653, 2.282549, 0.2431373, 0, 1, 1,
0.5882768, 0.5744251, 0.4247651, 0.2470588, 0, 1, 1,
0.5949545, 1.111115, 1.964442, 0.254902, 0, 1, 1,
0.595553, -0.4523418, 2.146122, 0.2588235, 0, 1, 1,
0.5978686, -0.7447009, 3.012699, 0.2666667, 0, 1, 1,
0.5980809, 0.4156691, 0.4184197, 0.2705882, 0, 1, 1,
0.6008297, -0.1646744, 3.363184, 0.2784314, 0, 1, 1,
0.6111764, -1.097696, 4.57477, 0.282353, 0, 1, 1,
0.6156177, 0.2973271, 0.5955532, 0.2901961, 0, 1, 1,
0.6192483, -0.5002857, 2.808985, 0.2941177, 0, 1, 1,
0.6210369, -0.04394728, 1.435417, 0.3019608, 0, 1, 1,
0.6252598, -1.206693, 2.073196, 0.3098039, 0, 1, 1,
0.6267101, 0.5750822, 1.865764, 0.3137255, 0, 1, 1,
0.6310562, -1.227394, 2.148751, 0.3215686, 0, 1, 1,
0.6310661, 0.7955154, 0.4076182, 0.3254902, 0, 1, 1,
0.6325307, -1.100953, 2.735492, 0.3333333, 0, 1, 1,
0.6350583, -0.5793337, 1.26521, 0.3372549, 0, 1, 1,
0.6385402, -0.6122899, 2.49334, 0.345098, 0, 1, 1,
0.6409296, 0.7141983, -0.8087453, 0.3490196, 0, 1, 1,
0.6438538, 0.1847716, 0.7656711, 0.3568628, 0, 1, 1,
0.6444221, -0.6781716, 1.825702, 0.3607843, 0, 1, 1,
0.6472095, 0.05787985, 1.143681, 0.3686275, 0, 1, 1,
0.6526248, -2.232833, 3.146809, 0.372549, 0, 1, 1,
0.6560863, 0.0372829, 0.7470738, 0.3803922, 0, 1, 1,
0.6570695, 0.7179531, -1.77986, 0.3843137, 0, 1, 1,
0.6586313, 0.4535109, 0.2748799, 0.3921569, 0, 1, 1,
0.6622389, -0.3899485, 1.88364, 0.3960784, 0, 1, 1,
0.6712567, -0.6868774, 0.2967991, 0.4039216, 0, 1, 1,
0.6756986, 0.5344558, 0.04948402, 0.4117647, 0, 1, 1,
0.6764786, -0.6936698, 3.795738, 0.4156863, 0, 1, 1,
0.6778158, 0.8866637, 0.6394061, 0.4235294, 0, 1, 1,
0.680483, 0.7351521, 1.65258, 0.427451, 0, 1, 1,
0.6816644, 1.645669, -2.268651, 0.4352941, 0, 1, 1,
0.6823152, -0.646627, 3.263518, 0.4392157, 0, 1, 1,
0.6844715, 1.89833, 0.798734, 0.4470588, 0, 1, 1,
0.6877238, 0.190173, -0.2141895, 0.4509804, 0, 1, 1,
0.6916471, 1.040323, 0.8404052, 0.4588235, 0, 1, 1,
0.6947926, 0.2888956, 1.307509, 0.4627451, 0, 1, 1,
0.6951622, 0.1922604, 0.8191937, 0.4705882, 0, 1, 1,
0.6951914, 1.491269, 1.623332, 0.4745098, 0, 1, 1,
0.6970925, -0.5190061, 2.261338, 0.4823529, 0, 1, 1,
0.6972521, 0.4263031, 0.9790735, 0.4862745, 0, 1, 1,
0.7025794, -0.6713478, 4.051053, 0.4941176, 0, 1, 1,
0.7059924, -0.5512237, 1.270527, 0.5019608, 0, 1, 1,
0.7133858, -0.7213055, 3.060917, 0.5058824, 0, 1, 1,
0.7277266, -0.5841506, 2.8378, 0.5137255, 0, 1, 1,
0.7289421, 0.008416369, 3.339965, 0.5176471, 0, 1, 1,
0.7370492, 0.1943064, 1.448893, 0.5254902, 0, 1, 1,
0.7389908, -0.5453414, 2.105923, 0.5294118, 0, 1, 1,
0.7396443, 0.3804685, 1.901247, 0.5372549, 0, 1, 1,
0.7396946, 0.1479796, 0.8716478, 0.5411765, 0, 1, 1,
0.7463825, 0.3305658, 1.763767, 0.5490196, 0, 1, 1,
0.746515, 0.1260881, 1.672176, 0.5529412, 0, 1, 1,
0.7473297, 0.7784093, 0.3876224, 0.5607843, 0, 1, 1,
0.7506903, 1.019848, -0.1448338, 0.5647059, 0, 1, 1,
0.7518895, -1.408955, 1.996352, 0.572549, 0, 1, 1,
0.7537962, 0.7326157, 1.527671, 0.5764706, 0, 1, 1,
0.7653657, 1.076851, 0.6730096, 0.5843138, 0, 1, 1,
0.768505, 0.4148845, 0.6308428, 0.5882353, 0, 1, 1,
0.7700387, 0.9076818, 0.3728851, 0.5960785, 0, 1, 1,
0.7758645, -0.8208354, 2.01168, 0.6039216, 0, 1, 1,
0.7759795, 0.3696026, -0.1176765, 0.6078432, 0, 1, 1,
0.7868367, 0.09104243, 1.725242, 0.6156863, 0, 1, 1,
0.7931902, -1.16223, 2.34858, 0.6196079, 0, 1, 1,
0.7944697, 0.1370607, 0.405412, 0.627451, 0, 1, 1,
0.8066847, 1.033385, 1.654103, 0.6313726, 0, 1, 1,
0.8145269, -1.21445, 4.195383, 0.6392157, 0, 1, 1,
0.814706, -0.4299608, 0.8753391, 0.6431373, 0, 1, 1,
0.8167978, -1.561081, 3.708489, 0.6509804, 0, 1, 1,
0.8183582, 0.389389, 0.4201423, 0.654902, 0, 1, 1,
0.818385, 1.139163, 0.1353952, 0.6627451, 0, 1, 1,
0.8197339, 0.4391376, 1.330835, 0.6666667, 0, 1, 1,
0.8216489, 0.7506995, -0.2479241, 0.6745098, 0, 1, 1,
0.8231213, 0.147196, 1.846764, 0.6784314, 0, 1, 1,
0.8291591, 0.6901965, 0.780759, 0.6862745, 0, 1, 1,
0.829874, 0.2707234, 2.862932, 0.6901961, 0, 1, 1,
0.8300325, -0.3706094, 1.052532, 0.6980392, 0, 1, 1,
0.8308792, 0.09829106, 2.093503, 0.7058824, 0, 1, 1,
0.8319741, -2.220365, 3.564298, 0.7098039, 0, 1, 1,
0.8359054, 1.865638, -0.3511856, 0.7176471, 0, 1, 1,
0.8362702, 0.939984, 2.2807, 0.7215686, 0, 1, 1,
0.8365418, -1.772259, 1.558963, 0.7294118, 0, 1, 1,
0.8397875, -0.5926899, 2.039706, 0.7333333, 0, 1, 1,
0.8448117, 2.468426, 0.2125315, 0.7411765, 0, 1, 1,
0.8513049, -0.7879275, 3.22976, 0.7450981, 0, 1, 1,
0.8522997, 0.3359703, 2.077567, 0.7529412, 0, 1, 1,
0.855715, -0.05043443, 2.025225, 0.7568628, 0, 1, 1,
0.8559982, 0.4980891, -0.6538958, 0.7647059, 0, 1, 1,
0.8601798, 0.3416347, 2.085602, 0.7686275, 0, 1, 1,
0.8610752, -0.1185529, -0.07608129, 0.7764706, 0, 1, 1,
0.8685297, -0.7528244, 2.0549, 0.7803922, 0, 1, 1,
0.874626, 0.9853622, 1.040498, 0.7882353, 0, 1, 1,
0.8785932, -0.2813856, 2.804125, 0.7921569, 0, 1, 1,
0.8789494, 1.858859, 0.3572614, 0.8, 0, 1, 1,
0.8861493, -0.5340444, 3.863211, 0.8078431, 0, 1, 1,
0.8884125, -1.567939, 1.131553, 0.8117647, 0, 1, 1,
0.8885422, -0.8038081, 1.705167, 0.8196079, 0, 1, 1,
0.891848, -0.9878355, 3.092875, 0.8235294, 0, 1, 1,
0.8925233, 0.9862759, 0.44124, 0.8313726, 0, 1, 1,
0.8944012, 0.2592114, 1.364925, 0.8352941, 0, 1, 1,
0.8958153, 0.7969674, 1.280084, 0.8431373, 0, 1, 1,
0.8974551, -0.3024743, 2.600291, 0.8470588, 0, 1, 1,
0.8989296, 1.900408, -0.317892, 0.854902, 0, 1, 1,
0.8996322, 0.4126958, -0.3413822, 0.8588235, 0, 1, 1,
0.9000853, 0.6509871, 1.933256, 0.8666667, 0, 1, 1,
0.9018548, -2.850247, 0.1582251, 0.8705882, 0, 1, 1,
0.9029487, 0.09092724, 2.435409, 0.8784314, 0, 1, 1,
0.9035538, -0.008803923, 2.44312, 0.8823529, 0, 1, 1,
0.9094058, 0.4098082, 0.6365759, 0.8901961, 0, 1, 1,
0.9107694, -2.142947, 2.625285, 0.8941177, 0, 1, 1,
0.9114016, -0.3727185, 3.806525, 0.9019608, 0, 1, 1,
0.9168071, 0.6920338, 0.6192334, 0.9098039, 0, 1, 1,
0.9217671, -1.85252, 0.5945969, 0.9137255, 0, 1, 1,
0.9331052, 0.8749516, -0.6517078, 0.9215686, 0, 1, 1,
0.9342201, -0.7916015, 2.728652, 0.9254902, 0, 1, 1,
0.9357054, 0.4456614, 0.3510633, 0.9333333, 0, 1, 1,
0.9378709, -0.005105659, 1.302891, 0.9372549, 0, 1, 1,
0.9382069, 1.622492, -0.1666147, 0.945098, 0, 1, 1,
0.9438153, 0.1213632, 0.7863424, 0.9490196, 0, 1, 1,
0.9500002, -1.206683, 3.075603, 0.9568627, 0, 1, 1,
0.9643402, 0.8442631, 1.060375, 0.9607843, 0, 1, 1,
0.9650357, 1.000735, 1.427617, 0.9686275, 0, 1, 1,
0.9673468, -1.577819, 3.03704, 0.972549, 0, 1, 1,
0.9687571, 0.7613234, 3.286058, 0.9803922, 0, 1, 1,
0.9758673, -0.03497033, 1.030689, 0.9843137, 0, 1, 1,
0.9786091, -1.984143, 3.014986, 0.9921569, 0, 1, 1,
0.9859276, -1.617285, 2.509611, 0.9960784, 0, 1, 1,
0.9885443, -0.2645866, 1.866331, 1, 0, 0.9960784, 1,
0.9926825, 1.001223, 0.03790181, 1, 0, 0.9882353, 1,
0.9941898, -1.028398, 2.386989, 1, 0, 0.9843137, 1,
0.9967412, -1.531728, 1.635889, 1, 0, 0.9764706, 1,
0.9980161, -0.2627121, 2.759362, 1, 0, 0.972549, 1,
1.002061, 0.9336068, 1.570141, 1, 0, 0.9647059, 1,
1.007764, -0.3471101, 1.347369, 1, 0, 0.9607843, 1,
1.010623, -0.1417287, 0.2954118, 1, 0, 0.9529412, 1,
1.013876, -0.2510804, 1.639875, 1, 0, 0.9490196, 1,
1.015389, -0.7114521, 1.714655, 1, 0, 0.9411765, 1,
1.019625, -0.9918275, 2.471207, 1, 0, 0.9372549, 1,
1.025909, 0.2179742, 1.801499, 1, 0, 0.9294118, 1,
1.026487, 0.3851986, 1.019705, 1, 0, 0.9254902, 1,
1.027564, 0.3875332, 2.009776, 1, 0, 0.9176471, 1,
1.033957, -0.6200038, 3.292409, 1, 0, 0.9137255, 1,
1.037294, 0.4208879, 2.607274, 1, 0, 0.9058824, 1,
1.039616, 1.924004, 1.245724, 1, 0, 0.9019608, 1,
1.041225, 0.9634669, 0.5064354, 1, 0, 0.8941177, 1,
1.046974, 1.255533, 1.394975, 1, 0, 0.8862745, 1,
1.046981, -1.829475, 2.886033, 1, 0, 0.8823529, 1,
1.052874, 0.9186542, 0.4439443, 1, 0, 0.8745098, 1,
1.063216, 0.2492492, 0.6106993, 1, 0, 0.8705882, 1,
1.065234, 0.8726292, -0.6486191, 1, 0, 0.8627451, 1,
1.066153, 0.6260605, 1.219907, 1, 0, 0.8588235, 1,
1.066879, 0.7116551, -0.2536467, 1, 0, 0.8509804, 1,
1.079947, -0.1149941, 1.863777, 1, 0, 0.8470588, 1,
1.080917, -0.7643502, 1.096937, 1, 0, 0.8392157, 1,
1.085271, -0.7015384, 3.21126, 1, 0, 0.8352941, 1,
1.094615, 1.253238, 1.178891, 1, 0, 0.827451, 1,
1.09916, 0.318684, 0.04891499, 1, 0, 0.8235294, 1,
1.102344, -0.01376127, 2.817564, 1, 0, 0.8156863, 1,
1.112622, -0.3082363, -0.3104095, 1, 0, 0.8117647, 1,
1.120891, 0.04216693, 1.012975, 1, 0, 0.8039216, 1,
1.120914, -1.39169, 0.599045, 1, 0, 0.7960784, 1,
1.150653, 0.1550178, 2.765917, 1, 0, 0.7921569, 1,
1.15443, 2.045045, 1.250279, 1, 0, 0.7843137, 1,
1.162976, 1.270841, 0.4990129, 1, 0, 0.7803922, 1,
1.167358, -1.3179, 3.902036, 1, 0, 0.772549, 1,
1.174187, -0.28455, 2.093008, 1, 0, 0.7686275, 1,
1.18657, 0.9296089, 2.330337, 1, 0, 0.7607843, 1,
1.190771, -1.879039, 2.234165, 1, 0, 0.7568628, 1,
1.194392, 1.893805, -0.6382634, 1, 0, 0.7490196, 1,
1.204082, -0.4167716, 1.03245, 1, 0, 0.7450981, 1,
1.223514, -2.48, 2.045063, 1, 0, 0.7372549, 1,
1.232087, -0.2077262, 0.002028716, 1, 0, 0.7333333, 1,
1.240279, -0.07125778, 2.314664, 1, 0, 0.7254902, 1,
1.2554, 0.3661665, 1.249347, 1, 0, 0.7215686, 1,
1.25793, 1.088068, -0.01040237, 1, 0, 0.7137255, 1,
1.25865, -0.3198726, 2.998352, 1, 0, 0.7098039, 1,
1.266443, -0.2407351, -0.0204702, 1, 0, 0.7019608, 1,
1.268274, 0.4934429, 3.817909, 1, 0, 0.6941177, 1,
1.271118, 0.5463148, 0.7030528, 1, 0, 0.6901961, 1,
1.276117, 0.895784, 0.4994215, 1, 0, 0.682353, 1,
1.286309, 1.288807, 0.03736547, 1, 0, 0.6784314, 1,
1.29373, 0.2697702, 3.478093, 1, 0, 0.6705883, 1,
1.299202, -0.5291805, 3.177142, 1, 0, 0.6666667, 1,
1.300533, -0.5543126, 2.485698, 1, 0, 0.6588235, 1,
1.312755, -1.463085, 3.445921, 1, 0, 0.654902, 1,
1.313293, -0.6648438, 2.417775, 1, 0, 0.6470588, 1,
1.321891, -0.6428653, 2.145319, 1, 0, 0.6431373, 1,
1.326134, -0.9152299, 3.703063, 1, 0, 0.6352941, 1,
1.335831, -0.09964037, 1.917971, 1, 0, 0.6313726, 1,
1.352152, -0.354551, -0.1405421, 1, 0, 0.6235294, 1,
1.357368, -2.815872, 3.19213, 1, 0, 0.6196079, 1,
1.372853, 0.5997441, 0.7976311, 1, 0, 0.6117647, 1,
1.374522, 0.8334183, 2.71721, 1, 0, 0.6078432, 1,
1.377787, 1.993565, 1.613893, 1, 0, 0.6, 1,
1.379287, 0.6405864, 0.1471871, 1, 0, 0.5921569, 1,
1.383042, 1.767532, 1.38799, 1, 0, 0.5882353, 1,
1.383538, -0.7451234, 2.123611, 1, 0, 0.5803922, 1,
1.38567, 0.2574844, 1.032259, 1, 0, 0.5764706, 1,
1.387731, -0.9423154, 2.215155, 1, 0, 0.5686275, 1,
1.388748, -2.292606, 1.937942, 1, 0, 0.5647059, 1,
1.399458, -0.4898049, 3.141105, 1, 0, 0.5568628, 1,
1.401871, -0.5513755, 4.44404, 1, 0, 0.5529412, 1,
1.402943, -1.334602, 1.519225, 1, 0, 0.5450981, 1,
1.40365, 0.3822417, 0.9490113, 1, 0, 0.5411765, 1,
1.40959, 1.042351, 0.9139822, 1, 0, 0.5333334, 1,
1.409759, -0.7118562, 3.419487, 1, 0, 0.5294118, 1,
1.42239, 1.328656, -0.6811273, 1, 0, 0.5215687, 1,
1.434054, 0.1653573, 1.030319, 1, 0, 0.5176471, 1,
1.436378, 0.6977267, 0.5264519, 1, 0, 0.509804, 1,
1.441096, 0.4093978, 1.106195, 1, 0, 0.5058824, 1,
1.446976, -0.1337571, 0.7623559, 1, 0, 0.4980392, 1,
1.447681, -1.314253, 2.665788, 1, 0, 0.4901961, 1,
1.454437, 1.641145, 1.270214, 1, 0, 0.4862745, 1,
1.458602, 0.4574848, 0.4986523, 1, 0, 0.4784314, 1,
1.492404, 1.28984, 0.4484327, 1, 0, 0.4745098, 1,
1.49476, -0.1312726, 0.4788205, 1, 0, 0.4666667, 1,
1.505853, -2.121783, 2.319476, 1, 0, 0.4627451, 1,
1.508675, -0.5183199, 1.447332, 1, 0, 0.454902, 1,
1.511751, -0.2774706, 1.804091, 1, 0, 0.4509804, 1,
1.513283, 1.345498, -1.235936, 1, 0, 0.4431373, 1,
1.535479, -0.4447592, 2.220389, 1, 0, 0.4392157, 1,
1.53781, -1.336427, 1.999629, 1, 0, 0.4313726, 1,
1.54037, 0.1182265, -0.586892, 1, 0, 0.427451, 1,
1.550477, 0.5440598, 1.535597, 1, 0, 0.4196078, 1,
1.553952, -0.7887538, 2.817781, 1, 0, 0.4156863, 1,
1.559384, 0.5325332, 0.6962298, 1, 0, 0.4078431, 1,
1.566399, -0.7467398, 1.901339, 1, 0, 0.4039216, 1,
1.5709, 0.9518749, 1.739663, 1, 0, 0.3960784, 1,
1.573066, -0.2930596, 1.365425, 1, 0, 0.3882353, 1,
1.575975, -1.910151, 1.327571, 1, 0, 0.3843137, 1,
1.57679, -0.1562783, 1.189959, 1, 0, 0.3764706, 1,
1.584074, -0.9998713, 2.80239, 1, 0, 0.372549, 1,
1.591064, 0.6784539, 0.8199705, 1, 0, 0.3647059, 1,
1.599071, 0.0965916, 0.01446396, 1, 0, 0.3607843, 1,
1.603123, -0.01852293, 0.06347519, 1, 0, 0.3529412, 1,
1.613132, -0.8398055, 1.056272, 1, 0, 0.3490196, 1,
1.618647, 0.2472079, 1.460673, 1, 0, 0.3411765, 1,
1.621382, 0.8270919, -0.4425303, 1, 0, 0.3372549, 1,
1.626517, 0.6661635, -0.07009652, 1, 0, 0.3294118, 1,
1.645347, 0.3643569, 1.062356, 1, 0, 0.3254902, 1,
1.653427, 1.884654, 1.079598, 1, 0, 0.3176471, 1,
1.65347, 0.4640273, 2.095748, 1, 0, 0.3137255, 1,
1.658825, 0.3244163, 1.460479, 1, 0, 0.3058824, 1,
1.661402, 0.182629, 1.981365, 1, 0, 0.2980392, 1,
1.666409, -2.116122, 3.474156, 1, 0, 0.2941177, 1,
1.712209, 0.5246099, 1.212303, 1, 0, 0.2862745, 1,
1.727461, -0.3161769, 0.7192651, 1, 0, 0.282353, 1,
1.733609, 0.1891087, 0.2582337, 1, 0, 0.2745098, 1,
1.736928, -1.282441, 2.930846, 1, 0, 0.2705882, 1,
1.738461, -0.6919492, 3.521938, 1, 0, 0.2627451, 1,
1.743785, 0.01128941, 2.126726, 1, 0, 0.2588235, 1,
1.745129, 1.842385, 2.648401, 1, 0, 0.2509804, 1,
1.747637, -1.500808, 1.292598, 1, 0, 0.2470588, 1,
1.780723, -0.4293631, 1.981918, 1, 0, 0.2392157, 1,
1.803625, -0.1637938, 2.220385, 1, 0, 0.2352941, 1,
1.805992, -1.726289, 2.064602, 1, 0, 0.227451, 1,
1.817712, 0.3356992, 1.588682, 1, 0, 0.2235294, 1,
1.825431, -1.953795, 3.198169, 1, 0, 0.2156863, 1,
1.832574, -1.257256, 1.322526, 1, 0, 0.2117647, 1,
1.844482, 0.2719127, 0.0647407, 1, 0, 0.2039216, 1,
1.849962, 0.7098869, 3.441044, 1, 0, 0.1960784, 1,
1.890375, 1.142222, 0.324063, 1, 0, 0.1921569, 1,
1.895654, 0.5902804, 1.786084, 1, 0, 0.1843137, 1,
1.90237, -0.2503928, 1.653389, 1, 0, 0.1803922, 1,
1.912109, -2.391709, 3.520406, 1, 0, 0.172549, 1,
1.947248, 0.1765713, 4.691994, 1, 0, 0.1686275, 1,
1.952501, -0.943708, 0.09322761, 1, 0, 0.1607843, 1,
1.97751, 1.340508, 0.8998153, 1, 0, 0.1568628, 1,
1.99141, 0.5524552, -0.2168689, 1, 0, 0.1490196, 1,
2.004973, 1.958151, -0.1231656, 1, 0, 0.145098, 1,
2.017981, -2.075156, 2.236902, 1, 0, 0.1372549, 1,
2.018455, -0.5397336, 2.823451, 1, 0, 0.1333333, 1,
2.036228, -0.8095996, 2.94836, 1, 0, 0.1254902, 1,
2.038742, 1.047969, 0.7757801, 1, 0, 0.1215686, 1,
2.083519, 1.94406, 0.2262098, 1, 0, 0.1137255, 1,
2.092137, 0.9932566, 1.609029, 1, 0, 0.1098039, 1,
2.098674, -0.8174192, 2.816427, 1, 0, 0.1019608, 1,
2.100742, 0.5433862, 2.382708, 1, 0, 0.09411765, 1,
2.21211, -0.01825532, 4.114617, 1, 0, 0.09019608, 1,
2.245988, -2.367902, 1.452204, 1, 0, 0.08235294, 1,
2.248046, -1.465024, 0.8546237, 1, 0, 0.07843138, 1,
2.307131, 0.5092261, 0.3910328, 1, 0, 0.07058824, 1,
2.370561, -0.01450494, 1.979577, 1, 0, 0.06666667, 1,
2.387486, -0.6143795, 3.47347, 1, 0, 0.05882353, 1,
2.414294, -0.1488426, 1.792876, 1, 0, 0.05490196, 1,
2.476456, 0.1600818, 3.838223, 1, 0, 0.04705882, 1,
2.535548, -1.108202, 1.136532, 1, 0, 0.04313726, 1,
2.673081, 0.376967, 0.7074834, 1, 0, 0.03529412, 1,
2.682061, -0.08034733, 3.409911, 1, 0, 0.03137255, 1,
2.737781, 1.445809, 1.507033, 1, 0, 0.02352941, 1,
2.993276, 0.4483336, 0.6388243, 1, 0, 0.01960784, 1,
3.010135, -1.953312, 2.77455, 1, 0, 0.01176471, 1,
3.10918, 0.206267, -0.0769369, 1, 0, 0.007843138, 1
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
0.08116293, -4.51804, -7.148275, 0, -0.5, 0.5, 0.5,
0.08116293, -4.51804, -7.148275, 1, -0.5, 0.5, 0.5,
0.08116293, -4.51804, -7.148275, 1, 1.5, 0.5, 0.5,
0.08116293, -4.51804, -7.148275, 0, 1.5, 0.5, 0.5
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
-3.973352, -0.1112981, -7.148275, 0, -0.5, 0.5, 0.5,
-3.973352, -0.1112981, -7.148275, 1, -0.5, 0.5, 0.5,
-3.973352, -0.1112981, -7.148275, 1, 1.5, 0.5, 0.5,
-3.973352, -0.1112981, -7.148275, 0, 1.5, 0.5, 0.5
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
-3.973352, -4.51804, 0.3473237, 0, -0.5, 0.5, 0.5,
-3.973352, -4.51804, 0.3473237, 1, -0.5, 0.5, 0.5,
-3.973352, -4.51804, 0.3473237, 1, 1.5, 0.5, 0.5,
-3.973352, -4.51804, 0.3473237, 0, 1.5, 0.5, 0.5
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
-2, -3.501099, -5.418522,
3, -3.501099, -5.418522,
-2, -3.501099, -5.418522,
-2, -3.670589, -5.706814,
-1, -3.501099, -5.418522,
-1, -3.670589, -5.706814,
0, -3.501099, -5.418522,
0, -3.670589, -5.706814,
1, -3.501099, -5.418522,
1, -3.670589, -5.706814,
2, -3.501099, -5.418522,
2, -3.670589, -5.706814,
3, -3.501099, -5.418522,
3, -3.670589, -5.706814
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
-2, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
-2, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
-2, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
-2, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5,
-1, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
-1, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
-1, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
-1, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5,
0, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
0, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
0, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
0, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5,
1, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
1, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
1, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
1, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5,
2, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
2, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
2, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
2, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5,
3, -4.00957, -6.283399, 0, -0.5, 0.5, 0.5,
3, -4.00957, -6.283399, 1, -0.5, 0.5, 0.5,
3, -4.00957, -6.283399, 1, 1.5, 0.5, 0.5,
3, -4.00957, -6.283399, 0, 1.5, 0.5, 0.5
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
-3.037695, -3, -5.418522,
-3.037695, 3, -5.418522,
-3.037695, -3, -5.418522,
-3.193638, -3, -5.706814,
-3.037695, -2, -5.418522,
-3.193638, -2, -5.706814,
-3.037695, -1, -5.418522,
-3.193638, -1, -5.706814,
-3.037695, 0, -5.418522,
-3.193638, 0, -5.706814,
-3.037695, 1, -5.418522,
-3.193638, 1, -5.706814,
-3.037695, 2, -5.418522,
-3.193638, 2, -5.706814,
-3.037695, 3, -5.418522,
-3.193638, 3, -5.706814
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
-3.505523, -3, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, -3, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, -3, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, -3, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, -2, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, -2, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, -2, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, -2, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, -1, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, -1, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, -1, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, -1, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, 0, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, 0, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, 0, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, 0, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, 1, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, 1, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, 1, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, 1, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, 2, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, 2, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, 2, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, 2, -6.283399, 0, 1.5, 0.5, 0.5,
-3.505523, 3, -6.283399, 0, -0.5, 0.5, 0.5,
-3.505523, 3, -6.283399, 1, -0.5, 0.5, 0.5,
-3.505523, 3, -6.283399, 1, 1.5, 0.5, 0.5,
-3.505523, 3, -6.283399, 0, 1.5, 0.5, 0.5
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
-3.037695, -3.501099, -4,
-3.037695, -3.501099, 4,
-3.037695, -3.501099, -4,
-3.193638, -3.670589, -4,
-3.037695, -3.501099, -2,
-3.193638, -3.670589, -2,
-3.037695, -3.501099, 0,
-3.193638, -3.670589, 0,
-3.037695, -3.501099, 2,
-3.193638, -3.670589, 2,
-3.037695, -3.501099, 4,
-3.193638, -3.670589, 4
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
-3.505523, -4.00957, -4, 0, -0.5, 0.5, 0.5,
-3.505523, -4.00957, -4, 1, -0.5, 0.5, 0.5,
-3.505523, -4.00957, -4, 1, 1.5, 0.5, 0.5,
-3.505523, -4.00957, -4, 0, 1.5, 0.5, 0.5,
-3.505523, -4.00957, -2, 0, -0.5, 0.5, 0.5,
-3.505523, -4.00957, -2, 1, -0.5, 0.5, 0.5,
-3.505523, -4.00957, -2, 1, 1.5, 0.5, 0.5,
-3.505523, -4.00957, -2, 0, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 0, 0, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 0, 1, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 0, 1, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 0, 0, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 2, 0, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 2, 1, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 2, 1, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 2, 0, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 4, 0, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 4, 1, -0.5, 0.5, 0.5,
-3.505523, -4.00957, 4, 1, 1.5, 0.5, 0.5,
-3.505523, -4.00957, 4, 0, 1.5, 0.5, 0.5
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
-3.037695, -3.501099, -5.418522,
-3.037695, 3.278503, -5.418522,
-3.037695, -3.501099, 6.113169,
-3.037695, 3.278503, 6.113169,
-3.037695, -3.501099, -5.418522,
-3.037695, -3.501099, 6.113169,
-3.037695, 3.278503, -5.418522,
-3.037695, 3.278503, 6.113169,
-3.037695, -3.501099, -5.418522,
3.200021, -3.501099, -5.418522,
-3.037695, -3.501099, 6.113169,
3.200021, -3.501099, 6.113169,
-3.037695, 3.278503, -5.418522,
3.200021, 3.278503, -5.418522,
-3.037695, 3.278503, 6.113169,
3.200021, 3.278503, 6.113169,
3.200021, -3.501099, -5.418522,
3.200021, 3.278503, -5.418522,
3.200021, -3.501099, 6.113169,
3.200021, 3.278503, 6.113169,
3.200021, -3.501099, -5.418522,
3.200021, -3.501099, 6.113169,
3.200021, 3.278503, -5.418522,
3.200021, 3.278503, 6.113169
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
var radius = 7.881452;
var distance = 35.06547;
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
mvMatrix.translate( -0.08116293, 0.1112981, -0.3473237 );
mvMatrix.scale( 1.366138, 1.256944, 0.7389706 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06547);
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
metron<-read.table("metron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
```

```r
y<-metron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
```

```r
z<-metron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
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
-2.946854, 0.7084277, -2.441655, 0, 0, 1, 1, 1,
-2.93234, -1.749457, -3.394621, 1, 0, 0, 1, 1,
-2.923319, -2.895328, -0.9468507, 1, 0, 0, 1, 1,
-2.844657, -0.4454509, -1.906377, 1, 0, 0, 1, 1,
-2.639623, -0.6331261, -2.155459, 1, 0, 0, 1, 1,
-2.600393, 1.049598, -3.115988, 1, 0, 0, 1, 1,
-2.467254, -0.3861127, -2.003086, 0, 0, 0, 1, 1,
-2.421356, -1.917321, -2.799908, 0, 0, 0, 1, 1,
-2.31389, -0.4129432, -3.159698, 0, 0, 0, 1, 1,
-2.277561, 1.042527, -1.333596, 0, 0, 0, 1, 1,
-2.210112, 0.3150532, -1.19638, 0, 0, 0, 1, 1,
-2.191722, -0.5104629, -1.003793, 0, 0, 0, 1, 1,
-2.125251, -0.4447707, -1.62933, 0, 0, 0, 1, 1,
-2.122144, -0.4425153, -1.597796, 1, 1, 1, 1, 1,
-2.105672, 0.9434832, -1.210328, 1, 1, 1, 1, 1,
-2.104576, 0.2620748, -3.76856, 1, 1, 1, 1, 1,
-2.077291, -0.4875278, -2.68171, 1, 1, 1, 1, 1,
-2.062072, 1.435059, -1.379879, 1, 1, 1, 1, 1,
-2.05794, -0.3822817, -2.952038, 1, 1, 1, 1, 1,
-2.05617, -1.014799, -3.54645, 1, 1, 1, 1, 1,
-2.024996, 0.7420966, -4.063886, 1, 1, 1, 1, 1,
-1.961617, -0.02215049, -2.485469, 1, 1, 1, 1, 1,
-1.955968, 1.109897, -3.310903, 1, 1, 1, 1, 1,
-1.930823, 1.195915, -1.536019, 1, 1, 1, 1, 1,
-1.918425, 1.297357, -1.857688, 1, 1, 1, 1, 1,
-1.899816, 1.900096, -2.695248, 1, 1, 1, 1, 1,
-1.892231, 0.5736332, -2.134017, 1, 1, 1, 1, 1,
-1.888228, -0.1499978, -1.894498, 1, 1, 1, 1, 1,
-1.86702, 0.3743621, -2.273479, 0, 0, 1, 1, 1,
-1.857279, -0.705447, -2.933697, 1, 0, 0, 1, 1,
-1.853512, -0.5228261, -0.9158443, 1, 0, 0, 1, 1,
-1.841436, 1.411973, 0.2201156, 1, 0, 0, 1, 1,
-1.82059, -0.2522551, -0.9427205, 1, 0, 0, 1, 1,
-1.814319, -0.5978641, -0.7681568, 1, 0, 0, 1, 1,
-1.81146, 0.5416253, -1.824725, 0, 0, 0, 1, 1,
-1.793282, -0.306798, -1.635529, 0, 0, 0, 1, 1,
-1.786133, 0.6726137, -1.373689, 0, 0, 0, 1, 1,
-1.785334, 0.2780738, -0.8735219, 0, 0, 0, 1, 1,
-1.785235, 0.9360394, -1.531693, 0, 0, 0, 1, 1,
-1.78372, -0.1587118, 0.5211316, 0, 0, 0, 1, 1,
-1.757975, 2.341904, -1.44635, 0, 0, 0, 1, 1,
-1.7576, 0.4067138, -1.659386, 1, 1, 1, 1, 1,
-1.752169, 1.169828, 1.443039, 1, 1, 1, 1, 1,
-1.750823, -0.4040985, -0.4652821, 1, 1, 1, 1, 1,
-1.748299, 0.4324616, -1.08644, 1, 1, 1, 1, 1,
-1.737919, 2.385396, -0.5395467, 1, 1, 1, 1, 1,
-1.727513, -0.1975051, -3.257231, 1, 1, 1, 1, 1,
-1.710773, -1.16269, -1.775596, 1, 1, 1, 1, 1,
-1.700656, -0.2983706, -3.040818, 1, 1, 1, 1, 1,
-1.696164, -0.6644045, -0.02672659, 1, 1, 1, 1, 1,
-1.694891, 0.5429979, -0.9141384, 1, 1, 1, 1, 1,
-1.692882, 0.5957912, 0.1326908, 1, 1, 1, 1, 1,
-1.6902, 0.6617721, -0.448517, 1, 1, 1, 1, 1,
-1.689938, 0.785393, 0.3064108, 1, 1, 1, 1, 1,
-1.688577, 0.7523097, -0.5497738, 1, 1, 1, 1, 1,
-1.687225, 0.08644077, 0.4389718, 1, 1, 1, 1, 1,
-1.684285, 1.03442, -0.7326132, 0, 0, 1, 1, 1,
-1.675683, 1.4847, -0.9963388, 1, 0, 0, 1, 1,
-1.65639, -1.395167, -2.1055, 1, 0, 0, 1, 1,
-1.642024, -1.785971, -3.323876, 1, 0, 0, 1, 1,
-1.628966, 0.9465318, -1.516161, 1, 0, 0, 1, 1,
-1.625505, -0.7086522, -3.230343, 1, 0, 0, 1, 1,
-1.616044, -0.5521288, -0.8146388, 0, 0, 0, 1, 1,
-1.59063, 1.022403, -0.1353137, 0, 0, 0, 1, 1,
-1.583353, -0.9759966, -1.82971, 0, 0, 0, 1, 1,
-1.575056, -0.3201811, -0.3083259, 0, 0, 0, 1, 1,
-1.544456, -0.9303898, -2.185546, 0, 0, 0, 1, 1,
-1.543945, -0.2177687, -0.6958909, 0, 0, 0, 1, 1,
-1.536864, 1.667247, -1.017906, 0, 0, 0, 1, 1,
-1.527879, -0.888306, -2.488341, 1, 1, 1, 1, 1,
-1.520267, 0.5231394, -0.008933094, 1, 1, 1, 1, 1,
-1.512928, 0.3552629, 0.5210472, 1, 1, 1, 1, 1,
-1.508093, 0.9867804, -0.9938898, 1, 1, 1, 1, 1,
-1.506489, -0.6700745, -2.329396, 1, 1, 1, 1, 1,
-1.505724, -1.238641, -2.251932, 1, 1, 1, 1, 1,
-1.495603, 0.5504574, -3.119418, 1, 1, 1, 1, 1,
-1.492886, -1.094756, -1.069248, 1, 1, 1, 1, 1,
-1.492442, -0.5061953, -0.9059745, 1, 1, 1, 1, 1,
-1.488478, 0.4993404, -1.520675, 1, 1, 1, 1, 1,
-1.478054, 0.08084726, -1.128377, 1, 1, 1, 1, 1,
-1.47706, -0.9589051, -1.805271, 1, 1, 1, 1, 1,
-1.469972, -0.9255902, -3.718652, 1, 1, 1, 1, 1,
-1.468876, 1.255895, -0.2489094, 1, 1, 1, 1, 1,
-1.463752, 0.1598354, -2.061634, 1, 1, 1, 1, 1,
-1.46056, 0.4943933, -1.285131, 0, 0, 1, 1, 1,
-1.445119, -0.7461044, -0.9087462, 1, 0, 0, 1, 1,
-1.434315, 0.7914648, -1.752041, 1, 0, 0, 1, 1,
-1.433748, -0.8215204, -2.445286, 1, 0, 0, 1, 1,
-1.430602, -1.037351, -2.241493, 1, 0, 0, 1, 1,
-1.417452, 0.9628424, -1.126159, 1, 0, 0, 1, 1,
-1.413163, -0.6362371, -2.153085, 0, 0, 0, 1, 1,
-1.413008, 1.124017, -2.195435, 0, 0, 0, 1, 1,
-1.401837, -0.854234, -3.898897, 0, 0, 0, 1, 1,
-1.400861, 0.6250049, 0.1552665, 0, 0, 0, 1, 1,
-1.395797, 1.567014, -0.9105998, 0, 0, 0, 1, 1,
-1.39019, 0.7748044, -0.08422859, 0, 0, 0, 1, 1,
-1.378137, -0.4059234, -0.7662762, 0, 0, 0, 1, 1,
-1.368207, -0.5701638, -0.654873, 1, 1, 1, 1, 1,
-1.364218, -0.08252271, -5.077166, 1, 1, 1, 1, 1,
-1.354134, -0.4137187, -2.680927, 1, 1, 1, 1, 1,
-1.351622, 1.390573, -1.883457, 1, 1, 1, 1, 1,
-1.351493, -1.523808, -0.002570267, 1, 1, 1, 1, 1,
-1.34608, 1.273813, -1.57053, 1, 1, 1, 1, 1,
-1.324986, 0.2360866, -0.3738579, 1, 1, 1, 1, 1,
-1.305463, 0.3249348, -0.5559826, 1, 1, 1, 1, 1,
-1.276885, 0.4088716, -0.6138053, 1, 1, 1, 1, 1,
-1.265634, -0.2099812, -1.676799, 1, 1, 1, 1, 1,
-1.262938, -1.406859, -2.10064, 1, 1, 1, 1, 1,
-1.25933, 0.5271765, -0.2798513, 1, 1, 1, 1, 1,
-1.25706, 0.1871198, -2.852772, 1, 1, 1, 1, 1,
-1.254879, -1.070648, -1.689558, 1, 1, 1, 1, 1,
-1.237252, 1.055238, 0.5335858, 1, 1, 1, 1, 1,
-1.236005, -0.1517705, -3.345175, 0, 0, 1, 1, 1,
-1.224425, 0.6045576, 0.1259097, 1, 0, 0, 1, 1,
-1.209647, 1.283626, 0.4041727, 1, 0, 0, 1, 1,
-1.202555, 0.8184144, -0.4937767, 1, 0, 0, 1, 1,
-1.193546, -0.1647462, -1.836459, 1, 0, 0, 1, 1,
-1.192757, 0.4071536, 0.8215863, 1, 0, 0, 1, 1,
-1.189265, 1.572352, 0.5254988, 0, 0, 0, 1, 1,
-1.189216, 1.105542, -0.7902488, 0, 0, 0, 1, 1,
-1.188404, -0.2481745, -1.721676, 0, 0, 0, 1, 1,
-1.179385, 0.01672557, -1.040962, 0, 0, 0, 1, 1,
-1.177328, 1.539759, -2.089793, 0, 0, 0, 1, 1,
-1.173446, 0.05417715, -1.22846, 0, 0, 0, 1, 1,
-1.171596, 1.947985, -0.6350363, 0, 0, 0, 1, 1,
-1.169738, 0.1222805, -1.522227, 1, 1, 1, 1, 1,
-1.164701, 1.703091, 0.4011825, 1, 1, 1, 1, 1,
-1.161193, -0.5755837, -1.148038, 1, 1, 1, 1, 1,
-1.159273, -0.3996034, -2.799496, 1, 1, 1, 1, 1,
-1.154015, -2.190929, -1.59772, 1, 1, 1, 1, 1,
-1.145661, -0.7038285, -3.289453, 1, 1, 1, 1, 1,
-1.143685, 0.6938311, -1.381147, 1, 1, 1, 1, 1,
-1.143282, -0.1688363, -0.4110895, 1, 1, 1, 1, 1,
-1.140942, 1.355826, -0.4351751, 1, 1, 1, 1, 1,
-1.136836, 1.81632, -1.227512, 1, 1, 1, 1, 1,
-1.128943, 0.8593192, -1.845603, 1, 1, 1, 1, 1,
-1.12815, -1.610597, -3.098206, 1, 1, 1, 1, 1,
-1.127241, -0.5109137, -2.269929, 1, 1, 1, 1, 1,
-1.12527, 0.284107, -1.4079, 1, 1, 1, 1, 1,
-1.125082, 0.2558368, 0.05727566, 1, 1, 1, 1, 1,
-1.11001, -1.051229, -1.068519, 0, 0, 1, 1, 1,
-1.102569, 0.4818118, -1.844504, 1, 0, 0, 1, 1,
-1.101563, 0.6778993, -1.077435, 1, 0, 0, 1, 1,
-1.094701, 0.4205659, -0.9358513, 1, 0, 0, 1, 1,
-1.085917, -0.9861388, -2.310809, 1, 0, 0, 1, 1,
-1.08469, 0.7044259, -1.956514, 1, 0, 0, 1, 1,
-1.081319, -0.2411048, -1.205089, 0, 0, 0, 1, 1,
-1.076275, -0.4131872, -2.352712, 0, 0, 0, 1, 1,
-1.072507, -0.6904864, -1.758422, 0, 0, 0, 1, 1,
-1.06913, 1.329358, -0.2711398, 0, 0, 0, 1, 1,
-1.068794, 1.397404, 1.103788, 0, 0, 0, 1, 1,
-1.065773, -0.506341, -2.512806, 0, 0, 0, 1, 1,
-1.062036, -2.216437, -1.600571, 0, 0, 0, 1, 1,
-1.059566, -0.5977721, -1.767687, 1, 1, 1, 1, 1,
-1.057438, -2.756593, -3.75728, 1, 1, 1, 1, 1,
-1.055254, -1.404867, -1.723018, 1, 1, 1, 1, 1,
-1.050579, 1.005401, -0.7947278, 1, 1, 1, 1, 1,
-1.047784, 0.1220069, 0.2149857, 1, 1, 1, 1, 1,
-1.045756, -0.2780279, -1.262648, 1, 1, 1, 1, 1,
-1.044664, 1.046157, -1.707196, 1, 1, 1, 1, 1,
-1.04381, 1.601446, -0.1718518, 1, 1, 1, 1, 1,
-1.035709, -0.2911329, -1.339858, 1, 1, 1, 1, 1,
-1.035666, -1.000539, -3.40452, 1, 1, 1, 1, 1,
-1.031734, -0.009151507, -2.890256, 1, 1, 1, 1, 1,
-1.02362, 1.461595, 0.9985281, 1, 1, 1, 1, 1,
-1.020641, -2.336385, -3.570622, 1, 1, 1, 1, 1,
-1.018569, -0.004140118, -0.9540765, 1, 1, 1, 1, 1,
-1.015666, 0.460994, -1.395921, 1, 1, 1, 1, 1,
-1.01307, -0.01786221, -2.572955, 0, 0, 1, 1, 1,
-1.011787, -0.6886215, -1.66006, 1, 0, 0, 1, 1,
-1.00382, -0.3109713, -0.6720424, 1, 0, 0, 1, 1,
-1.003567, 1.433475, 1.635957, 1, 0, 0, 1, 1,
-1.003313, 0.7706081, -0.5394431, 1, 0, 0, 1, 1,
-1.001035, -0.50463, -1.972467, 1, 0, 0, 1, 1,
-0.9904482, -0.4582651, -1.359048, 0, 0, 0, 1, 1,
-0.9868056, -0.4144162, -2.738486, 0, 0, 0, 1, 1,
-0.9856295, 0.5767426, -1.19411, 0, 0, 0, 1, 1,
-0.9849983, 1.701996, 1.328542, 0, 0, 0, 1, 1,
-0.9795049, 0.7012179, -0.6909602, 0, 0, 0, 1, 1,
-0.9792957, 1.744238, -0.7615337, 0, 0, 0, 1, 1,
-0.9745082, 1.76246, -0.3251941, 0, 0, 0, 1, 1,
-0.9713615, 0.3936746, -1.94564, 1, 1, 1, 1, 1,
-0.9664997, 0.7113381, -0.9155872, 1, 1, 1, 1, 1,
-0.9495213, 0.09844159, -2.526522, 1, 1, 1, 1, 1,
-0.944688, 0.3862501, -0.756575, 1, 1, 1, 1, 1,
-0.942831, 0.4799242, -1.327125, 1, 1, 1, 1, 1,
-0.9379141, 0.2322828, -1.039759, 1, 1, 1, 1, 1,
-0.934527, -0.3595591, -1.776328, 1, 1, 1, 1, 1,
-0.9340735, -2.333848, -2.076806, 1, 1, 1, 1, 1,
-0.9333978, -0.3774588, -0.2103548, 1, 1, 1, 1, 1,
-0.930314, 0.4666513, -1.234229, 1, 1, 1, 1, 1,
-0.9283941, 0.8820678, 0.4081041, 1, 1, 1, 1, 1,
-0.9257796, -0.6204472, -1.812826, 1, 1, 1, 1, 1,
-0.9254119, -0.4863126, -1.492927, 1, 1, 1, 1, 1,
-0.9242542, -1.238074, -1.843545, 1, 1, 1, 1, 1,
-0.9186699, -0.6690943, -3.418741, 1, 1, 1, 1, 1,
-0.9146057, 0.7347566, 0.1695067, 0, 0, 1, 1, 1,
-0.9126804, 1.37967, -0.09029377, 1, 0, 0, 1, 1,
-0.9105334, -0.2949908, -0.7873299, 1, 0, 0, 1, 1,
-0.9089363, 0.5730743, -0.8421625, 1, 0, 0, 1, 1,
-0.9087498, -0.2845318, -2.84748, 1, 0, 0, 1, 1,
-0.9047019, -0.37549, -0.3604458, 1, 0, 0, 1, 1,
-0.8813411, -0.9776163, -0.827365, 0, 0, 0, 1, 1,
-0.8783319, -3.402367, -5.005849, 0, 0, 0, 1, 1,
-0.8779318, 0.1989746, -1.600089, 0, 0, 0, 1, 1,
-0.870872, -1.386555, -0.8217149, 0, 0, 0, 1, 1,
-0.8707588, 0.2296134, -1.805704, 0, 0, 0, 1, 1,
-0.8672379, 0.09579968, -1.61921, 0, 0, 0, 1, 1,
-0.8662807, -1.078707, -2.839617, 0, 0, 0, 1, 1,
-0.8620173, -0.4874067, -1.907109, 1, 1, 1, 1, 1,
-0.857805, -1.688777, -3.917167, 1, 1, 1, 1, 1,
-0.8557712, 0.7849815, -2.63533, 1, 1, 1, 1, 1,
-0.8553478, -0.3178324, -1.927845, 1, 1, 1, 1, 1,
-0.8521892, 0.398371, -2.102846, 1, 1, 1, 1, 1,
-0.8387136, 1.568066, -1.608099, 1, 1, 1, 1, 1,
-0.8383633, -1.086352, -3.382437, 1, 1, 1, 1, 1,
-0.8339646, -0.3357195, -2.13457, 1, 1, 1, 1, 1,
-0.8288931, 0.1558809, -1.852688, 1, 1, 1, 1, 1,
-0.8285553, 1.644062, 0.4113001, 1, 1, 1, 1, 1,
-0.8241479, -0.8554792, -2.865794, 1, 1, 1, 1, 1,
-0.8240237, -1.145056, -4.285755, 1, 1, 1, 1, 1,
-0.815361, -0.3153476, -1.256815, 1, 1, 1, 1, 1,
-0.8085861, 2.712856, -1.50949, 1, 1, 1, 1, 1,
-0.8036827, 1.001964, -3.324389, 1, 1, 1, 1, 1,
-0.79583, -1.394171, -1.777946, 0, 0, 1, 1, 1,
-0.7930545, 1.545251, 0.3669074, 1, 0, 0, 1, 1,
-0.7895598, 0.2480201, -2.272257, 1, 0, 0, 1, 1,
-0.7768128, -1.308694, -2.847929, 1, 0, 0, 1, 1,
-0.7670147, -0.8801271, 0.07365048, 1, 0, 0, 1, 1,
-0.7616033, -0.3613699, -3.110151, 1, 0, 0, 1, 1,
-0.7592456, -2.939697, -3.877283, 0, 0, 0, 1, 1,
-0.755105, 0.128726, -0.8784982, 0, 0, 0, 1, 1,
-0.7533053, 0.779197, -1.459973, 0, 0, 0, 1, 1,
-0.7460958, 0.7541057, 0.6790207, 0, 0, 0, 1, 1,
-0.7424349, -0.1811822, -1.278212, 0, 0, 0, 1, 1,
-0.7408369, 1.304381, 0.7455649, 0, 0, 0, 1, 1,
-0.7372109, 0.6358376, -0.02591243, 0, 0, 0, 1, 1,
-0.7347824, -0.8644841, -2.918282, 1, 1, 1, 1, 1,
-0.732179, 0.1698966, -1.342062, 1, 1, 1, 1, 1,
-0.7297154, -0.8640052, -0.6545185, 1, 1, 1, 1, 1,
-0.726881, 1.529768, -0.5253976, 1, 1, 1, 1, 1,
-0.7242968, 0.7055432, 1.134911, 1, 1, 1, 1, 1,
-0.7185441, -2.877999, -2.682343, 1, 1, 1, 1, 1,
-0.7057536, 1.056418, -1.23633, 1, 1, 1, 1, 1,
-0.6983656, 1.106455, 0.02987808, 1, 1, 1, 1, 1,
-0.6971002, -0.8807423, -2.826924, 1, 1, 1, 1, 1,
-0.6943641, 0.7275874, -0.1114101, 1, 1, 1, 1, 1,
-0.6896023, 0.002468429, -1.193319, 1, 1, 1, 1, 1,
-0.6893491, -0.9620919, -1.990592, 1, 1, 1, 1, 1,
-0.6869407, 1.340635, 1.13302, 1, 1, 1, 1, 1,
-0.6798425, 1.392759, -1.171019, 1, 1, 1, 1, 1,
-0.6787204, -0.3744314, -2.426394, 1, 1, 1, 1, 1,
-0.6783065, -0.06763014, -1.400519, 0, 0, 1, 1, 1,
-0.6780536, -1.181194, -3.918355, 1, 0, 0, 1, 1,
-0.6773365, -0.3551378, -2.232654, 1, 0, 0, 1, 1,
-0.6725413, 1.284842, 0.209541, 1, 0, 0, 1, 1,
-0.6687728, 0.9042115, -0.5874422, 1, 0, 0, 1, 1,
-0.668459, -0.1335708, -0.928511, 1, 0, 0, 1, 1,
-0.6629611, 1.269116, -0.03419716, 0, 0, 0, 1, 1,
-0.6628762, -0.1899702, -4.069202, 0, 0, 0, 1, 1,
-0.6566482, 0.2099306, 0.884131, 0, 0, 0, 1, 1,
-0.654975, -1.352071, -1.657766, 0, 0, 0, 1, 1,
-0.6539671, -0.1374103, -2.953402, 0, 0, 0, 1, 1,
-0.6425712, 2.153058, -0.5858971, 0, 0, 0, 1, 1,
-0.6397286, -0.5691939, -2.44393, 0, 0, 0, 1, 1,
-0.6387821, -0.8354338, -2.277412, 1, 1, 1, 1, 1,
-0.6375271, -0.06071286, -0.1548626, 1, 1, 1, 1, 1,
-0.6348752, 0.7833517, -0.2206781, 1, 1, 1, 1, 1,
-0.6348127, -0.1757449, -0.7630484, 1, 1, 1, 1, 1,
-0.6341742, 0.312251, -1.013627, 1, 1, 1, 1, 1,
-0.6333824, 2.120317, -0.6219433, 1, 1, 1, 1, 1,
-0.6298429, 1.087609, -0.2582876, 1, 1, 1, 1, 1,
-0.6292997, 0.4958476, -1.19112, 1, 1, 1, 1, 1,
-0.6252713, 0.4331446, -0.6906042, 1, 1, 1, 1, 1,
-0.6163666, 0.2707575, -0.2664347, 1, 1, 1, 1, 1,
-0.6141917, -1.34033, -2.5121, 1, 1, 1, 1, 1,
-0.6115217, -0.4366793, -2.499816, 1, 1, 1, 1, 1,
-0.6052393, -1.259578, -4.55904, 1, 1, 1, 1, 1,
-0.6026531, 1.008231, -0.211597, 1, 1, 1, 1, 1,
-0.5992942, 0.5521191, -2.085177, 1, 1, 1, 1, 1,
-0.5968805, -0.4353592, -1.74007, 0, 0, 1, 1, 1,
-0.5915347, 0.4599099, -0.06419862, 1, 0, 0, 1, 1,
-0.589693, -1.133911, -1.781974, 1, 0, 0, 1, 1,
-0.5853115, 0.6411462, -1.454202, 1, 0, 0, 1, 1,
-0.5818734, -1.178039, -2.674804, 1, 0, 0, 1, 1,
-0.580986, -0.1863414, -4.390628, 1, 0, 0, 1, 1,
-0.5804191, 0.164729, -1.449164, 0, 0, 0, 1, 1,
-0.5783249, 0.01723712, -1.154864, 0, 0, 0, 1, 1,
-0.5765042, -1.512471, -2.860981, 0, 0, 0, 1, 1,
-0.5726265, 0.1415767, -0.7243639, 0, 0, 0, 1, 1,
-0.5703299, 1.898548, 0.8975213, 0, 0, 0, 1, 1,
-0.5691258, -1.024264, -2.335886, 0, 0, 0, 1, 1,
-0.5670829, -0.08291648, -1.096405, 0, 0, 0, 1, 1,
-0.5651729, 0.4085953, -1.273476, 1, 1, 1, 1, 1,
-0.5635093, -2.111614, -2.815772, 1, 1, 1, 1, 1,
-0.5630639, 0.4356521, -1.902212, 1, 1, 1, 1, 1,
-0.558211, 0.0009597944, -1.516576, 1, 1, 1, 1, 1,
-0.5522506, -0.2315067, -3.976623, 1, 1, 1, 1, 1,
-0.5474452, 0.8782494, -0.4331525, 1, 1, 1, 1, 1,
-0.5441427, -0.2359045, -0.7913999, 1, 1, 1, 1, 1,
-0.5425586, 1.540169, 0.4116253, 1, 1, 1, 1, 1,
-0.5406518, -0.1553222, -2.192428, 1, 1, 1, 1, 1,
-0.5371073, -0.4290687, -2.973689, 1, 1, 1, 1, 1,
-0.5199063, -0.3510043, -2.092128, 1, 1, 1, 1, 1,
-0.5146819, 0.4831626, 1.026149, 1, 1, 1, 1, 1,
-0.5124153, 1.670789, 0.9844518, 1, 1, 1, 1, 1,
-0.5052745, 0.3673306, -2.237602, 1, 1, 1, 1, 1,
-0.5048935, -0.7202369, -4.462541, 1, 1, 1, 1, 1,
-0.5037858, -0.825487, -3.159149, 0, 0, 1, 1, 1,
-0.5029713, -0.5871039, -3.100932, 1, 0, 0, 1, 1,
-0.5016577, -1.109164, -3.753963, 1, 0, 0, 1, 1,
-0.5008587, 1.12459, 0.6829994, 1, 0, 0, 1, 1,
-0.4923141, 0.9843642, -1.812697, 1, 0, 0, 1, 1,
-0.4909634, 0.6721696, 0.1367019, 1, 0, 0, 1, 1,
-0.4883361, 1.062599, -0.1743176, 0, 0, 0, 1, 1,
-0.4866963, -0.01818557, -2.016496, 0, 0, 0, 1, 1,
-0.48222, -1.88871, -1.271924, 0, 0, 0, 1, 1,
-0.4785484, 1.340754, 1.350232, 0, 0, 0, 1, 1,
-0.4733285, -0.233068, -3.121765, 0, 0, 0, 1, 1,
-0.4718707, -2.27078, -5.250585, 0, 0, 0, 1, 1,
-0.4678953, -1.656586, -4.275288, 0, 0, 0, 1, 1,
-0.4590143, -1.928016, -2.52994, 1, 1, 1, 1, 1,
-0.4553201, 1.460121, -0.6600504, 1, 1, 1, 1, 1,
-0.4550655, -0.6650287, -1.805649, 1, 1, 1, 1, 1,
-0.4504284, 1.393526, -1.031168, 1, 1, 1, 1, 1,
-0.4496653, 1.374136, -0.6511215, 1, 1, 1, 1, 1,
-0.4474561, 0.6965321, -0.2211414, 1, 1, 1, 1, 1,
-0.4435098, 0.321784, 1.064819, 1, 1, 1, 1, 1,
-0.4401481, 1.091171, -1.054698, 1, 1, 1, 1, 1,
-0.4384773, 1.221663, -0.9075227, 1, 1, 1, 1, 1,
-0.4371039, -0.316101, -1.193577, 1, 1, 1, 1, 1,
-0.4356498, 0.4638382, 0.2596161, 1, 1, 1, 1, 1,
-0.4323127, 1.400108, -0.1050266, 1, 1, 1, 1, 1,
-0.430209, 0.9595079, 0.9458221, 1, 1, 1, 1, 1,
-0.4293467, -0.63175, -2.233582, 1, 1, 1, 1, 1,
-0.4277523, -0.9537535, -0.6242135, 1, 1, 1, 1, 1,
-0.4203442, -0.4321971, -2.317538, 0, 0, 1, 1, 1,
-0.418268, -1.265222, -4.158125, 1, 0, 0, 1, 1,
-0.4175336, -0.4576395, -1.713822, 1, 0, 0, 1, 1,
-0.4146034, 0.80354, -0.9794459, 1, 0, 0, 1, 1,
-0.4116202, 0.7957013, -1.257522, 1, 0, 0, 1, 1,
-0.407176, -1.084317, -0.3721139, 1, 0, 0, 1, 1,
-0.4008553, -0.8492703, -3.968497, 0, 0, 0, 1, 1,
-0.3981717, 0.2869856, 0.2658889, 0, 0, 0, 1, 1,
-0.3961728, -0.1303656, -2.974511, 0, 0, 0, 1, 1,
-0.3958094, 0.1370575, -1.987629, 0, 0, 0, 1, 1,
-0.3955739, 0.120879, 0.2620124, 0, 0, 0, 1, 1,
-0.3951573, -0.2222116, -1.511444, 0, 0, 0, 1, 1,
-0.3921086, 1.039674, -0.3209466, 0, 0, 0, 1, 1,
-0.3875398, 0.3869655, -1.42964, 1, 1, 1, 1, 1,
-0.3779049, -1.947449, -3.353861, 1, 1, 1, 1, 1,
-0.3762333, 1.723538, -0.8100744, 1, 1, 1, 1, 1,
-0.3762187, -0.8125491, -3.250574, 1, 1, 1, 1, 1,
-0.3747176, 0.2177816, -0.1603079, 1, 1, 1, 1, 1,
-0.3725359, 0.8047028, -0.2736765, 1, 1, 1, 1, 1,
-0.3706205, 1.164051, 0.6929237, 1, 1, 1, 1, 1,
-0.3695002, -0.839961, -2.291297, 1, 1, 1, 1, 1,
-0.3630379, -1.499654, -2.892155, 1, 1, 1, 1, 1,
-0.3560394, 1.496353, -1.346005, 1, 1, 1, 1, 1,
-0.3556909, 1.399298, -1.297714, 1, 1, 1, 1, 1,
-0.3520372, 0.7251929, -1.59733, 1, 1, 1, 1, 1,
-0.3464865, 0.3731361, -0.4073075, 1, 1, 1, 1, 1,
-0.345396, 0.3676552, 0.6232536, 1, 1, 1, 1, 1,
-0.3452674, -0.3724367, -2.718344, 1, 1, 1, 1, 1,
-0.3392061, -1.072997, -2.998385, 0, 0, 1, 1, 1,
-0.3312471, 3.179771, -1.70929, 1, 0, 0, 1, 1,
-0.329979, -0.5104597, -1.669061, 1, 0, 0, 1, 1,
-0.3295332, -0.1621793, -1.621616, 1, 0, 0, 1, 1,
-0.3255491, -1.000434, -1.059281, 1, 0, 0, 1, 1,
-0.3198982, -0.3162998, -3.537931, 1, 0, 0, 1, 1,
-0.3153869, 0.8806295, 0.9953366, 0, 0, 0, 1, 1,
-0.304458, -0.5125727, -2.203738, 0, 0, 0, 1, 1,
-0.3044178, 0.1360925, 0.2620985, 0, 0, 0, 1, 1,
-0.3040067, 0.1468738, -1.535238, 0, 0, 0, 1, 1,
-0.2989267, -0.3377774, -2.340482, 0, 0, 0, 1, 1,
-0.2965598, 0.1679523, -0.7160999, 0, 0, 0, 1, 1,
-0.2960661, -0.7672536, -3.408344, 0, 0, 0, 1, 1,
-0.2959994, -0.238749, -3.128732, 1, 1, 1, 1, 1,
-0.2957285, 2.229758, -2.62275, 1, 1, 1, 1, 1,
-0.2937577, 0.5689983, 1.645204, 1, 1, 1, 1, 1,
-0.2926778, -1.596062, -5.031252, 1, 1, 1, 1, 1,
-0.2901646, -0.4894101, -1.697597, 1, 1, 1, 1, 1,
-0.2880475, -0.6037768, -4.029881, 1, 1, 1, 1, 1,
-0.287139, -0.1939092, -2.242173, 1, 1, 1, 1, 1,
-0.2863798, -1.392037, -2.30635, 1, 1, 1, 1, 1,
-0.2862926, -1.103161, -2.918507, 1, 1, 1, 1, 1,
-0.2824143, -0.1120401, -2.571532, 1, 1, 1, 1, 1,
-0.2755433, 0.4595218, -1.214808, 1, 1, 1, 1, 1,
-0.2721724, -0.7515035, -1.877126, 1, 1, 1, 1, 1,
-0.2674888, 0.4614792, -1.42576, 1, 1, 1, 1, 1,
-0.2663127, 0.3970192, -0.2519657, 1, 1, 1, 1, 1,
-0.2554478, -1.092445, -3.778529, 1, 1, 1, 1, 1,
-0.2514547, 0.7225116, -0.4250053, 0, 0, 1, 1, 1,
-0.251238, -1.217815, -1.165955, 1, 0, 0, 1, 1,
-0.2485975, 1.060869, -0.3839917, 1, 0, 0, 1, 1,
-0.2458817, -0.6315194, -0.7849616, 1, 0, 0, 1, 1,
-0.2451526, -1.245023, -3.577734, 1, 0, 0, 1, 1,
-0.2437301, -1.14453, -1.761225, 1, 0, 0, 1, 1,
-0.2407559, 0.04772712, -2.320807, 0, 0, 0, 1, 1,
-0.2386083, -0.4593319, -3.616728, 0, 0, 0, 1, 1,
-0.232774, 0.2533319, 0.1171158, 0, 0, 0, 1, 1,
-0.2325312, 1.341685, -1.541151, 0, 0, 0, 1, 1,
-0.2309761, 0.6466323, -1.82734, 0, 0, 0, 1, 1,
-0.2284323, 0.5122947, -2.702897, 0, 0, 0, 1, 1,
-0.2262223, -0.3356891, -1.81341, 0, 0, 0, 1, 1,
-0.2256274, -0.5458357, -3.066657, 1, 1, 1, 1, 1,
-0.2247363, 0.8403457, -0.3488783, 1, 1, 1, 1, 1,
-0.2241065, 0.6679801, -2.093169, 1, 1, 1, 1, 1,
-0.2102121, 1.335037, -0.7662401, 1, 1, 1, 1, 1,
-0.2098524, 0.4547025, 0.7820579, 1, 1, 1, 1, 1,
-0.207895, -1.388029, -2.356021, 1, 1, 1, 1, 1,
-0.206359, 0.3014967, -2.569315, 1, 1, 1, 1, 1,
-0.2043868, -0.5847382, -1.796654, 1, 1, 1, 1, 1,
-0.2037025, -1.276439, -2.271361, 1, 1, 1, 1, 1,
-0.2015913, 1.717246, -1.406531, 1, 1, 1, 1, 1,
-0.2005301, -0.6934437, -1.256641, 1, 1, 1, 1, 1,
-0.1988092, -0.7973315, -3.817264, 1, 1, 1, 1, 1,
-0.1986768, -0.6785111, -3.948551, 1, 1, 1, 1, 1,
-0.1952412, 1.021347, -0.08144831, 1, 1, 1, 1, 1,
-0.1915796, 1.27526, 0.1035243, 1, 1, 1, 1, 1,
-0.1898885, -0.1784853, -2.095155, 0, 0, 1, 1, 1,
-0.1869452, 1.622454, 0.01928268, 1, 0, 0, 1, 1,
-0.1863022, -0.5758426, -2.555261, 1, 0, 0, 1, 1,
-0.1845787, 1.506994, -1.428141, 1, 0, 0, 1, 1,
-0.1834746, -1.035546, -3.324724, 1, 0, 0, 1, 1,
-0.1793068, 0.4742065, -1.395585, 1, 0, 0, 1, 1,
-0.1691881, -0.3539089, -3.017839, 0, 0, 0, 1, 1,
-0.1606582, -0.9360606, -2.749165, 0, 0, 0, 1, 1,
-0.1432008, -0.8031765, -2.48307, 0, 0, 0, 1, 1,
-0.1429316, 0.8218037, -0.2677686, 0, 0, 0, 1, 1,
-0.1417693, -1.485141, -2.255646, 0, 0, 0, 1, 1,
-0.1405305, -0.3816089, -2.151717, 0, 0, 0, 1, 1,
-0.1357981, -1.544316, -3.031555, 0, 0, 0, 1, 1,
-0.1354275, -0.06705573, -1.828029, 1, 1, 1, 1, 1,
-0.1270053, 0.3648564, -0.7227657, 1, 1, 1, 1, 1,
-0.1265008, -0.908691, -1.336182, 1, 1, 1, 1, 1,
-0.118533, -0.9925768, -2.895845, 1, 1, 1, 1, 1,
-0.117895, 0.4049321, -0.2498853, 1, 1, 1, 1, 1,
-0.1156031, -0.6160708, -2.419331, 1, 1, 1, 1, 1,
-0.1066257, 0.4844642, 0.2836031, 1, 1, 1, 1, 1,
-0.1063244, 1.862815, -0.93365, 1, 1, 1, 1, 1,
-0.1040799, -1.373292, -3.215766, 1, 1, 1, 1, 1,
-0.100664, 1.146617, 0.7473469, 1, 1, 1, 1, 1,
-0.09950899, 0.7023144, -0.1024724, 1, 1, 1, 1, 1,
-0.09935242, -0.2467571, -3.316283, 1, 1, 1, 1, 1,
-0.0985815, 0.04921113, -0.9251722, 1, 1, 1, 1, 1,
-0.09691338, 1.549807, -1.950985, 1, 1, 1, 1, 1,
-0.09471609, -0.2970245, -4.464101, 1, 1, 1, 1, 1,
-0.09378196, -1.036056, -2.447225, 0, 0, 1, 1, 1,
-0.0919633, -0.05004885, -1.689365, 1, 0, 0, 1, 1,
-0.08940463, 0.4931723, 1.072697, 1, 0, 0, 1, 1,
-0.08837993, 0.7439908, -0.3337798, 1, 0, 0, 1, 1,
-0.08652772, 0.4387005, 0.9276782, 1, 0, 0, 1, 1,
-0.08302198, -0.03681563, -2.421214, 1, 0, 0, 1, 1,
-0.08026297, 0.5448604, -0.2481762, 0, 0, 0, 1, 1,
-0.07962579, -0.06178181, -1.581908, 0, 0, 0, 1, 1,
-0.07736484, -0.6801926, -1.972811, 0, 0, 0, 1, 1,
-0.07717278, 1.399191, 1.275679, 0, 0, 0, 1, 1,
-0.07578772, -1.121864, -3.984505, 0, 0, 0, 1, 1,
-0.07445085, 1.161239, 1.00464, 0, 0, 0, 1, 1,
-0.07326816, 1.349391, 2.086145, 0, 0, 0, 1, 1,
-0.06533342, -1.97077, -3.862628, 1, 1, 1, 1, 1,
-0.06508397, 1.13934, -0.4658732, 1, 1, 1, 1, 1,
-0.06206274, 0.1368583, -1.870793, 1, 1, 1, 1, 1,
-0.06104273, -0.2228078, -3.363355, 1, 1, 1, 1, 1,
-0.05597404, 1.094895, 1.275135, 1, 1, 1, 1, 1,
-0.05544037, -0.8207832, -2.147082, 1, 1, 1, 1, 1,
-0.05493559, 1.382965, -0.8861359, 1, 1, 1, 1, 1,
-0.05330806, 0.5177859, -1.61659, 1, 1, 1, 1, 1,
-0.04974461, 0.2646839, 0.8506576, 1, 1, 1, 1, 1,
-0.04817158, -0.843381, -3.239076, 1, 1, 1, 1, 1,
-0.04706526, 0.8884041, -0.4046762, 1, 1, 1, 1, 1,
-0.04617292, -0.2955235, -3.096555, 1, 1, 1, 1, 1,
-0.04426242, 0.001215764, -1.511356, 1, 1, 1, 1, 1,
-0.0438905, -0.2202775, -2.780311, 1, 1, 1, 1, 1,
-0.03923361, -1.629284, -3.361033, 1, 1, 1, 1, 1,
-0.03864033, -1.393048, -3.13727, 0, 0, 1, 1, 1,
-0.03781898, 1.527039, 2.407763, 1, 0, 0, 1, 1,
-0.03732698, 2.556529, 1.33494, 1, 0, 0, 1, 1,
-0.0363982, 0.8079987, -0.2338304, 1, 0, 0, 1, 1,
-0.03306818, -0.8126093, -2.031747, 1, 0, 0, 1, 1,
-0.03292519, 2.003558, 0.1082752, 1, 0, 0, 1, 1,
-0.02990487, -0.4104405, -1.446596, 0, 0, 0, 1, 1,
-0.02893831, -0.9436892, -1.912949, 0, 0, 0, 1, 1,
-0.02621748, -1.063653, -2.439259, 0, 0, 0, 1, 1,
-0.0254348, -0.4820408, -3.98061, 0, 0, 0, 1, 1,
-0.0253153, 0.4145627, -0.2739786, 0, 0, 0, 1, 1,
-0.02525066, -0.3519644, -2.470866, 0, 0, 0, 1, 1,
-0.02384924, 1.323159, -0.7912572, 0, 0, 0, 1, 1,
-0.0218387, -1.402628, -1.963264, 1, 1, 1, 1, 1,
-0.01825787, 1.334345, -0.1969382, 1, 1, 1, 1, 1,
-0.01611127, 1.492545, -1.43438, 1, 1, 1, 1, 1,
-0.01115808, 0.6664492, 0.6295558, 1, 1, 1, 1, 1,
-0.009689776, 0.386923, 0.1180392, 1, 1, 1, 1, 1,
-0.00929742, 1.407076, 0.1665717, 1, 1, 1, 1, 1,
-0.0071107, 2.511096, -0.3435206, 1, 1, 1, 1, 1,
-0.003521896, -0.1924208, -4.216866, 1, 1, 1, 1, 1,
-0.002449639, -0.3360427, -3.132869, 1, 1, 1, 1, 1,
0.001797073, 1.026465, -1.604597, 1, 1, 1, 1, 1,
0.004826049, -1.096974, 3.926836, 1, 1, 1, 1, 1,
0.005618426, -1.019117, 4.165245, 1, 1, 1, 1, 1,
0.00703865, -2.035005, 4.062233, 1, 1, 1, 1, 1,
0.009178722, -0.2388331, 2.410632, 1, 1, 1, 1, 1,
0.01180906, -0.859415, 4.879819, 1, 1, 1, 1, 1,
0.01444442, -0.606591, 1.647763, 0, 0, 1, 1, 1,
0.01485705, -1.222053, 3.268738, 1, 0, 0, 1, 1,
0.01487029, -0.8471786, 3.410253, 1, 0, 0, 1, 1,
0.01781829, 1.335268, 0.391358, 1, 0, 0, 1, 1,
0.01803494, -1.761972, 3.804353, 1, 0, 0, 1, 1,
0.01864675, 1.093173, 0.5599788, 1, 0, 0, 1, 1,
0.01910005, 0.8175377, 0.5060692, 0, 0, 0, 1, 1,
0.01974428, 0.3481764, 0.6553032, 0, 0, 0, 1, 1,
0.02046787, 0.8600159, 0.2735854, 0, 0, 0, 1, 1,
0.02354435, -0.4133104, 3.622041, 0, 0, 0, 1, 1,
0.02776278, 0.5587536, -1.92068, 0, 0, 0, 1, 1,
0.02964376, -0.4991024, 2.477674, 0, 0, 0, 1, 1,
0.02999449, 0.2935526, 0.6040859, 0, 0, 0, 1, 1,
0.03088881, -0.05791778, 1.455295, 1, 1, 1, 1, 1,
0.03535541, 0.134052, 0.9135802, 1, 1, 1, 1, 1,
0.03549189, 0.6156098, 0.6053408, 1, 1, 1, 1, 1,
0.03645714, -0.4139562, 2.826798, 1, 1, 1, 1, 1,
0.0376884, -0.4279584, 3.599586, 1, 1, 1, 1, 1,
0.03915456, 0.1746237, -0.6390992, 1, 1, 1, 1, 1,
0.04189255, 0.01205392, 1.475364, 1, 1, 1, 1, 1,
0.04298284, -0.1631058, 2.313237, 1, 1, 1, 1, 1,
0.04305905, 0.7114642, -0.9711934, 1, 1, 1, 1, 1,
0.04378873, 1.083573, -0.008622067, 1, 1, 1, 1, 1,
0.04980282, -0.1401405, 4.570266, 1, 1, 1, 1, 1,
0.05778681, 0.8623652, -0.1850301, 1, 1, 1, 1, 1,
0.06218842, 0.7939352, 0.523276, 1, 1, 1, 1, 1,
0.06521052, 0.4324987, -0.6041982, 1, 1, 1, 1, 1,
0.0671135, 0.9899388, -0.4643542, 1, 1, 1, 1, 1,
0.06743783, -2.395374, 3.799339, 0, 0, 1, 1, 1,
0.075195, 2.100946, 0.1722891, 1, 0, 0, 1, 1,
0.07681751, -1.197662, 2.200607, 1, 0, 0, 1, 1,
0.07849312, -1.107364, 4.076949, 1, 0, 0, 1, 1,
0.07982962, 0.8118173, 1.85258, 1, 0, 0, 1, 1,
0.08491488, -0.1781318, 2.858464, 1, 0, 0, 1, 1,
0.08609107, -1.66527, 3.417526, 0, 0, 0, 1, 1,
0.09225378, -0.03378564, 3.209517, 0, 0, 0, 1, 1,
0.0948161, 0.7296786, 0.213449, 0, 0, 0, 1, 1,
0.09646045, 0.1198581, 0.4361445, 0, 0, 0, 1, 1,
0.108054, 0.3079412, 0.9580734, 0, 0, 0, 1, 1,
0.115089, 0.9270779, 0.1527429, 0, 0, 0, 1, 1,
0.1154355, -0.1338938, 3.8358, 0, 0, 0, 1, 1,
0.1191329, -0.5606235, 5.068721, 1, 1, 1, 1, 1,
0.119675, -0.9874499, 0.8441326, 1, 1, 1, 1, 1,
0.1211601, -1.858881, 1.846934, 1, 1, 1, 1, 1,
0.1238483, -1.080591, 0.9225923, 1, 1, 1, 1, 1,
0.1260048, -0.5763108, 3.741488, 1, 1, 1, 1, 1,
0.1289557, 0.02078046, 1.466217, 1, 1, 1, 1, 1,
0.1340834, 1.490396, 2.28057, 1, 1, 1, 1, 1,
0.1388079, 0.00415484, 1.31792, 1, 1, 1, 1, 1,
0.1427264, -1.110672, 3.586933, 1, 1, 1, 1, 1,
0.1479457, -0.2257062, 2.812295, 1, 1, 1, 1, 1,
0.1575791, 0.05674666, -0.8752531, 1, 1, 1, 1, 1,
0.1654282, 0.741582, -0.0324556, 1, 1, 1, 1, 1,
0.1661853, 0.3471911, 0.07853684, 1, 1, 1, 1, 1,
0.1732061, 1.007925, -0.9941915, 1, 1, 1, 1, 1,
0.1753486, 0.2684157, -0.01113405, 1, 1, 1, 1, 1,
0.1759361, -0.2181395, 2.675225, 0, 0, 1, 1, 1,
0.182899, 0.1616893, 2.277283, 1, 0, 0, 1, 1,
0.1849717, 0.04544383, 0.1269128, 1, 0, 0, 1, 1,
0.1889067, -0.3640731, 2.748938, 1, 0, 0, 1, 1,
0.196169, 0.8753936, 0.14422, 1, 0, 0, 1, 1,
0.2005664, 0.8555385, -0.8210385, 1, 0, 0, 1, 1,
0.2016163, 2.553909, -0.1014188, 0, 0, 0, 1, 1,
0.2067431, 0.05272531, 2.364724, 0, 0, 0, 1, 1,
0.2075416, 0.2054438, 2.510715, 0, 0, 0, 1, 1,
0.208178, -1.805873, 3.406512, 0, 0, 0, 1, 1,
0.2153705, -1.5273, 3.399639, 0, 0, 0, 1, 1,
0.2191304, -1.164061, 1.4027, 0, 0, 0, 1, 1,
0.2226699, -0.8222593, 0.7612281, 0, 0, 0, 1, 1,
0.2236683, 0.9730607, 0.5520716, 1, 1, 1, 1, 1,
0.2239939, 0.118571, 2.049627, 1, 1, 1, 1, 1,
0.2323188, 0.04398596, 1.383017, 1, 1, 1, 1, 1,
0.2390514, -0.0749317, 2.626234, 1, 1, 1, 1, 1,
0.239476, 0.6461158, 1.463801, 1, 1, 1, 1, 1,
0.2408276, -0.07913569, 1.251684, 1, 1, 1, 1, 1,
0.242219, -1.339728, 2.857079, 1, 1, 1, 1, 1,
0.2435418, -1.205088, 2.771328, 1, 1, 1, 1, 1,
0.2440909, -0.03840525, 1.270522, 1, 1, 1, 1, 1,
0.2444915, 1.709382, 0.8211403, 1, 1, 1, 1, 1,
0.2524649, -0.09042452, 2.240577, 1, 1, 1, 1, 1,
0.2573622, -0.6049475, 0.882741, 1, 1, 1, 1, 1,
0.2593892, 0.6922014, 0.7452254, 1, 1, 1, 1, 1,
0.2624903, -0.4841911, 3.102641, 1, 1, 1, 1, 1,
0.2636311, -0.3503175, 2.978174, 1, 1, 1, 1, 1,
0.26415, 1.270023, -0.07515436, 0, 0, 1, 1, 1,
0.2689029, 1.164063, 1.282256, 1, 0, 0, 1, 1,
0.2718143, -0.09477277, 3.698418, 1, 0, 0, 1, 1,
0.2741994, -1.779977, 2.288073, 1, 0, 0, 1, 1,
0.2746487, 0.3649658, -0.728101, 1, 0, 0, 1, 1,
0.2746763, -0.6998637, 1.062649, 1, 0, 0, 1, 1,
0.2750577, -0.1300899, 2.225568, 0, 0, 0, 1, 1,
0.2753537, -0.3333811, 2.718638, 0, 0, 0, 1, 1,
0.2767176, 1.285807, -0.7007286, 0, 0, 0, 1, 1,
0.2794911, 0.101858, 1.302153, 0, 0, 0, 1, 1,
0.2814046, 0.9071661, 0.02096807, 0, 0, 0, 1, 1,
0.2878808, -1.33282, 3.106091, 0, 0, 0, 1, 1,
0.2903891, -0.8600439, 1.916114, 0, 0, 0, 1, 1,
0.2962634, -0.4517785, 3.819245, 1, 1, 1, 1, 1,
0.3015919, 1.329862, 0.3125273, 1, 1, 1, 1, 1,
0.301825, -1.014168, 4.085738, 1, 1, 1, 1, 1,
0.3019219, -0.1612195, 0.4911913, 1, 1, 1, 1, 1,
0.3020569, 0.005392363, 0.4891271, 1, 1, 1, 1, 1,
0.3023676, 0.2565485, 1.093541, 1, 1, 1, 1, 1,
0.305126, 1.067936, 0.9049783, 1, 1, 1, 1, 1,
0.3117254, -1.842606, 1.533204, 1, 1, 1, 1, 1,
0.3125656, 1.20053, -0.5829694, 1, 1, 1, 1, 1,
0.3132996, 0.3659633, 0.1017191, 1, 1, 1, 1, 1,
0.316626, 1.843488, -0.6496448, 1, 1, 1, 1, 1,
0.3181863, 2.039907, 0.7413424, 1, 1, 1, 1, 1,
0.3187792, -0.2138159, 2.407514, 1, 1, 1, 1, 1,
0.3200185, 0.07758003, 2.444112, 1, 1, 1, 1, 1,
0.3208729, -0.9342065, 2.5896, 1, 1, 1, 1, 1,
0.3237688, -0.9824256, 1.642502, 0, 0, 1, 1, 1,
0.3257621, -0.4928897, 2.070394, 1, 0, 0, 1, 1,
0.3265001, -0.03595015, 1.431565, 1, 0, 0, 1, 1,
0.3290972, -0.5396996, 2.549991, 1, 0, 0, 1, 1,
0.3342149, -0.6471751, 2.73403, 1, 0, 0, 1, 1,
0.3348832, 1.068973, -0.8700708, 1, 0, 0, 1, 1,
0.3386008, 0.3698522, -1.116466, 0, 0, 0, 1, 1,
0.3387893, -0.2090277, 1.798826, 0, 0, 0, 1, 1,
0.3449006, 0.311993, 2.235852, 0, 0, 0, 1, 1,
0.352315, 0.3573482, -0.6076837, 0, 0, 0, 1, 1,
0.3571351, -0.3027324, 1.945951, 0, 0, 0, 1, 1,
0.3619286, 0.304003, -0.9464723, 0, 0, 0, 1, 1,
0.3627288, -0.3408387, 1.713267, 0, 0, 0, 1, 1,
0.3632166, 0.1984692, 1.148908, 1, 1, 1, 1, 1,
0.3644391, -0.8341623, 2.763768, 1, 1, 1, 1, 1,
0.3679025, 1.112495, -0.9643548, 1, 1, 1, 1, 1,
0.3722995, 1.14393, -0.5147853, 1, 1, 1, 1, 1,
0.3746493, -0.3189016, 2.692127, 1, 1, 1, 1, 1,
0.3751242, -0.7926728, 2.163203, 1, 1, 1, 1, 1,
0.3755621, 0.4168114, 0.641311, 1, 1, 1, 1, 1,
0.3767667, -0.9620371, 0.5489821, 1, 1, 1, 1, 1,
0.3782417, -0.5341005, 2.767298, 1, 1, 1, 1, 1,
0.3784493, 0.07944288, 1.536604, 1, 1, 1, 1, 1,
0.3793284, 0.369557, 1.957461, 1, 1, 1, 1, 1,
0.384784, -0.3861071, 2.696218, 1, 1, 1, 1, 1,
0.3918339, 0.5264137, 1.319305, 1, 1, 1, 1, 1,
0.3919575, -0.748584, 2.28495, 1, 1, 1, 1, 1,
0.3980676, 0.7327891, 0.9783783, 1, 1, 1, 1, 1,
0.4017722, -0.9115386, 3.445105, 0, 0, 1, 1, 1,
0.4064504, -0.11979, 2.160247, 1, 0, 0, 1, 1,
0.411648, 0.9800814, -0.03565592, 1, 0, 0, 1, 1,
0.4122637, -1.372852, 3.150697, 1, 0, 0, 1, 1,
0.4191225, 0.5723469, 1.938254, 1, 0, 0, 1, 1,
0.4343347, 0.03600537, 2.372161, 1, 0, 0, 1, 1,
0.4354213, 0.3241152, 0.7282293, 0, 0, 0, 1, 1,
0.4457203, 0.5551198, 0.1388334, 0, 0, 0, 1, 1,
0.4547376, 0.02219901, 0.7589511, 0, 0, 0, 1, 1,
0.4559762, 0.1530554, 1.712438, 0, 0, 0, 1, 1,
0.4595724, 0.03396288, -0.8557674, 0, 0, 0, 1, 1,
0.4599326, 0.341166, -0.6767885, 0, 0, 0, 1, 1,
0.4612078, -0.1573002, 3.271293, 0, 0, 0, 1, 1,
0.4658464, -0.9432321, 2.960318, 1, 1, 1, 1, 1,
0.4664465, 1.14871, 1.048681, 1, 1, 1, 1, 1,
0.4690649, -0.8214712, 3.134449, 1, 1, 1, 1, 1,
0.4701449, 1.821452, -0.5183561, 1, 1, 1, 1, 1,
0.4718825, 1.255993, 0.3418471, 1, 1, 1, 1, 1,
0.4827664, -1.292999, 5.945232, 1, 1, 1, 1, 1,
0.4833494, -0.3522601, 2.642716, 1, 1, 1, 1, 1,
0.4897726, 1.978423, 0.5523603, 1, 1, 1, 1, 1,
0.4907879, -0.2430561, 0.5456498, 1, 1, 1, 1, 1,
0.4909119, 0.34615, 0.8001134, 1, 1, 1, 1, 1,
0.5024056, -0.158922, 1.72702, 1, 1, 1, 1, 1,
0.5071892, -1.576406, 4.061312, 1, 1, 1, 1, 1,
0.5074529, -0.1984246, 4.222702, 1, 1, 1, 1, 1,
0.5083581, -0.9033663, 2.233789, 1, 1, 1, 1, 1,
0.5094026, -0.9066782, 4.363111, 1, 1, 1, 1, 1,
0.5119266, 0.4960607, 1.206401, 0, 0, 1, 1, 1,
0.5119941, 1.201855, 1.853027, 1, 0, 0, 1, 1,
0.5175147, -1.022289, 3.69697, 1, 0, 0, 1, 1,
0.5182165, 1.048138, -0.0347741, 1, 0, 0, 1, 1,
0.5189509, -0.03401191, 3.469655, 1, 0, 0, 1, 1,
0.5265778, 0.4137736, 0.9385577, 1, 0, 0, 1, 1,
0.5273079, -1.528741, 2.031882, 0, 0, 0, 1, 1,
0.5286286, 0.9070207, 2.369433, 0, 0, 0, 1, 1,
0.5289376, 0.6336235, 0.3444429, 0, 0, 0, 1, 1,
0.5299979, -0.484178, 0.3651806, 0, 0, 0, 1, 1,
0.5407556, 1.055467, -0.2515692, 0, 0, 0, 1, 1,
0.5443606, 1.033402, 0.1934375, 0, 0, 0, 1, 1,
0.5467727, -0.6009367, 2.384251, 0, 0, 0, 1, 1,
0.5483645, 1.040133, 0.05353153, 1, 1, 1, 1, 1,
0.5534768, 0.3194894, -0.1081417, 1, 1, 1, 1, 1,
0.5554026, -0.558755, 3.376808, 1, 1, 1, 1, 1,
0.5557938, 0.4019771, 1.917704, 1, 1, 1, 1, 1,
0.5575216, 0.08643022, 2.542554, 1, 1, 1, 1, 1,
0.5608565, 0.5408685, 1.163963, 1, 1, 1, 1, 1,
0.5625315, 1.928303, 0.3748028, 1, 1, 1, 1, 1,
0.5643123, -0.4942624, 0.7955982, 1, 1, 1, 1, 1,
0.5672382, -0.5780082, 2.424946, 1, 1, 1, 1, 1,
0.5676464, -1.147751, 4.31971, 1, 1, 1, 1, 1,
0.56863, -0.461519, 3.953254, 1, 1, 1, 1, 1,
0.5719385, 0.08576107, -0.270871, 1, 1, 1, 1, 1,
0.5749459, 0.2057697, 0.9710304, 1, 1, 1, 1, 1,
0.575632, 0.08891056, 0.5030246, 1, 1, 1, 1, 1,
0.5766889, 0.9996276, 1.197114, 1, 1, 1, 1, 1,
0.5786678, 0.4549023, 1.218962, 0, 0, 1, 1, 1,
0.5812321, 1.164959, -0.5394647, 1, 0, 0, 1, 1,
0.5819348, -0.5993146, 0.09505899, 1, 0, 0, 1, 1,
0.5833893, 0.5549039, 1.799672, 1, 0, 0, 1, 1,
0.5835994, 1.618941, -0.09611133, 1, 0, 0, 1, 1,
0.5849154, -1.341557, 0.7749138, 1, 0, 0, 1, 1,
0.586555, -0.4610399, 3.779974, 0, 0, 0, 1, 1,
0.5866898, 0.191653, 2.282549, 0, 0, 0, 1, 1,
0.5882768, 0.5744251, 0.4247651, 0, 0, 0, 1, 1,
0.5949545, 1.111115, 1.964442, 0, 0, 0, 1, 1,
0.595553, -0.4523418, 2.146122, 0, 0, 0, 1, 1,
0.5978686, -0.7447009, 3.012699, 0, 0, 0, 1, 1,
0.5980809, 0.4156691, 0.4184197, 0, 0, 0, 1, 1,
0.6008297, -0.1646744, 3.363184, 1, 1, 1, 1, 1,
0.6111764, -1.097696, 4.57477, 1, 1, 1, 1, 1,
0.6156177, 0.2973271, 0.5955532, 1, 1, 1, 1, 1,
0.6192483, -0.5002857, 2.808985, 1, 1, 1, 1, 1,
0.6210369, -0.04394728, 1.435417, 1, 1, 1, 1, 1,
0.6252598, -1.206693, 2.073196, 1, 1, 1, 1, 1,
0.6267101, 0.5750822, 1.865764, 1, 1, 1, 1, 1,
0.6310562, -1.227394, 2.148751, 1, 1, 1, 1, 1,
0.6310661, 0.7955154, 0.4076182, 1, 1, 1, 1, 1,
0.6325307, -1.100953, 2.735492, 1, 1, 1, 1, 1,
0.6350583, -0.5793337, 1.26521, 1, 1, 1, 1, 1,
0.6385402, -0.6122899, 2.49334, 1, 1, 1, 1, 1,
0.6409296, 0.7141983, -0.8087453, 1, 1, 1, 1, 1,
0.6438538, 0.1847716, 0.7656711, 1, 1, 1, 1, 1,
0.6444221, -0.6781716, 1.825702, 1, 1, 1, 1, 1,
0.6472095, 0.05787985, 1.143681, 0, 0, 1, 1, 1,
0.6526248, -2.232833, 3.146809, 1, 0, 0, 1, 1,
0.6560863, 0.0372829, 0.7470738, 1, 0, 0, 1, 1,
0.6570695, 0.7179531, -1.77986, 1, 0, 0, 1, 1,
0.6586313, 0.4535109, 0.2748799, 1, 0, 0, 1, 1,
0.6622389, -0.3899485, 1.88364, 1, 0, 0, 1, 1,
0.6712567, -0.6868774, 0.2967991, 0, 0, 0, 1, 1,
0.6756986, 0.5344558, 0.04948402, 0, 0, 0, 1, 1,
0.6764786, -0.6936698, 3.795738, 0, 0, 0, 1, 1,
0.6778158, 0.8866637, 0.6394061, 0, 0, 0, 1, 1,
0.680483, 0.7351521, 1.65258, 0, 0, 0, 1, 1,
0.6816644, 1.645669, -2.268651, 0, 0, 0, 1, 1,
0.6823152, -0.646627, 3.263518, 0, 0, 0, 1, 1,
0.6844715, 1.89833, 0.798734, 1, 1, 1, 1, 1,
0.6877238, 0.190173, -0.2141895, 1, 1, 1, 1, 1,
0.6916471, 1.040323, 0.8404052, 1, 1, 1, 1, 1,
0.6947926, 0.2888956, 1.307509, 1, 1, 1, 1, 1,
0.6951622, 0.1922604, 0.8191937, 1, 1, 1, 1, 1,
0.6951914, 1.491269, 1.623332, 1, 1, 1, 1, 1,
0.6970925, -0.5190061, 2.261338, 1, 1, 1, 1, 1,
0.6972521, 0.4263031, 0.9790735, 1, 1, 1, 1, 1,
0.7025794, -0.6713478, 4.051053, 1, 1, 1, 1, 1,
0.7059924, -0.5512237, 1.270527, 1, 1, 1, 1, 1,
0.7133858, -0.7213055, 3.060917, 1, 1, 1, 1, 1,
0.7277266, -0.5841506, 2.8378, 1, 1, 1, 1, 1,
0.7289421, 0.008416369, 3.339965, 1, 1, 1, 1, 1,
0.7370492, 0.1943064, 1.448893, 1, 1, 1, 1, 1,
0.7389908, -0.5453414, 2.105923, 1, 1, 1, 1, 1,
0.7396443, 0.3804685, 1.901247, 0, 0, 1, 1, 1,
0.7396946, 0.1479796, 0.8716478, 1, 0, 0, 1, 1,
0.7463825, 0.3305658, 1.763767, 1, 0, 0, 1, 1,
0.746515, 0.1260881, 1.672176, 1, 0, 0, 1, 1,
0.7473297, 0.7784093, 0.3876224, 1, 0, 0, 1, 1,
0.7506903, 1.019848, -0.1448338, 1, 0, 0, 1, 1,
0.7518895, -1.408955, 1.996352, 0, 0, 0, 1, 1,
0.7537962, 0.7326157, 1.527671, 0, 0, 0, 1, 1,
0.7653657, 1.076851, 0.6730096, 0, 0, 0, 1, 1,
0.768505, 0.4148845, 0.6308428, 0, 0, 0, 1, 1,
0.7700387, 0.9076818, 0.3728851, 0, 0, 0, 1, 1,
0.7758645, -0.8208354, 2.01168, 0, 0, 0, 1, 1,
0.7759795, 0.3696026, -0.1176765, 0, 0, 0, 1, 1,
0.7868367, 0.09104243, 1.725242, 1, 1, 1, 1, 1,
0.7931902, -1.16223, 2.34858, 1, 1, 1, 1, 1,
0.7944697, 0.1370607, 0.405412, 1, 1, 1, 1, 1,
0.8066847, 1.033385, 1.654103, 1, 1, 1, 1, 1,
0.8145269, -1.21445, 4.195383, 1, 1, 1, 1, 1,
0.814706, -0.4299608, 0.8753391, 1, 1, 1, 1, 1,
0.8167978, -1.561081, 3.708489, 1, 1, 1, 1, 1,
0.8183582, 0.389389, 0.4201423, 1, 1, 1, 1, 1,
0.818385, 1.139163, 0.1353952, 1, 1, 1, 1, 1,
0.8197339, 0.4391376, 1.330835, 1, 1, 1, 1, 1,
0.8216489, 0.7506995, -0.2479241, 1, 1, 1, 1, 1,
0.8231213, 0.147196, 1.846764, 1, 1, 1, 1, 1,
0.8291591, 0.6901965, 0.780759, 1, 1, 1, 1, 1,
0.829874, 0.2707234, 2.862932, 1, 1, 1, 1, 1,
0.8300325, -0.3706094, 1.052532, 1, 1, 1, 1, 1,
0.8308792, 0.09829106, 2.093503, 0, 0, 1, 1, 1,
0.8319741, -2.220365, 3.564298, 1, 0, 0, 1, 1,
0.8359054, 1.865638, -0.3511856, 1, 0, 0, 1, 1,
0.8362702, 0.939984, 2.2807, 1, 0, 0, 1, 1,
0.8365418, -1.772259, 1.558963, 1, 0, 0, 1, 1,
0.8397875, -0.5926899, 2.039706, 1, 0, 0, 1, 1,
0.8448117, 2.468426, 0.2125315, 0, 0, 0, 1, 1,
0.8513049, -0.7879275, 3.22976, 0, 0, 0, 1, 1,
0.8522997, 0.3359703, 2.077567, 0, 0, 0, 1, 1,
0.855715, -0.05043443, 2.025225, 0, 0, 0, 1, 1,
0.8559982, 0.4980891, -0.6538958, 0, 0, 0, 1, 1,
0.8601798, 0.3416347, 2.085602, 0, 0, 0, 1, 1,
0.8610752, -0.1185529, -0.07608129, 0, 0, 0, 1, 1,
0.8685297, -0.7528244, 2.0549, 1, 1, 1, 1, 1,
0.874626, 0.9853622, 1.040498, 1, 1, 1, 1, 1,
0.8785932, -0.2813856, 2.804125, 1, 1, 1, 1, 1,
0.8789494, 1.858859, 0.3572614, 1, 1, 1, 1, 1,
0.8861493, -0.5340444, 3.863211, 1, 1, 1, 1, 1,
0.8884125, -1.567939, 1.131553, 1, 1, 1, 1, 1,
0.8885422, -0.8038081, 1.705167, 1, 1, 1, 1, 1,
0.891848, -0.9878355, 3.092875, 1, 1, 1, 1, 1,
0.8925233, 0.9862759, 0.44124, 1, 1, 1, 1, 1,
0.8944012, 0.2592114, 1.364925, 1, 1, 1, 1, 1,
0.8958153, 0.7969674, 1.280084, 1, 1, 1, 1, 1,
0.8974551, -0.3024743, 2.600291, 1, 1, 1, 1, 1,
0.8989296, 1.900408, -0.317892, 1, 1, 1, 1, 1,
0.8996322, 0.4126958, -0.3413822, 1, 1, 1, 1, 1,
0.9000853, 0.6509871, 1.933256, 1, 1, 1, 1, 1,
0.9018548, -2.850247, 0.1582251, 0, 0, 1, 1, 1,
0.9029487, 0.09092724, 2.435409, 1, 0, 0, 1, 1,
0.9035538, -0.008803923, 2.44312, 1, 0, 0, 1, 1,
0.9094058, 0.4098082, 0.6365759, 1, 0, 0, 1, 1,
0.9107694, -2.142947, 2.625285, 1, 0, 0, 1, 1,
0.9114016, -0.3727185, 3.806525, 1, 0, 0, 1, 1,
0.9168071, 0.6920338, 0.6192334, 0, 0, 0, 1, 1,
0.9217671, -1.85252, 0.5945969, 0, 0, 0, 1, 1,
0.9331052, 0.8749516, -0.6517078, 0, 0, 0, 1, 1,
0.9342201, -0.7916015, 2.728652, 0, 0, 0, 1, 1,
0.9357054, 0.4456614, 0.3510633, 0, 0, 0, 1, 1,
0.9378709, -0.005105659, 1.302891, 0, 0, 0, 1, 1,
0.9382069, 1.622492, -0.1666147, 0, 0, 0, 1, 1,
0.9438153, 0.1213632, 0.7863424, 1, 1, 1, 1, 1,
0.9500002, -1.206683, 3.075603, 1, 1, 1, 1, 1,
0.9643402, 0.8442631, 1.060375, 1, 1, 1, 1, 1,
0.9650357, 1.000735, 1.427617, 1, 1, 1, 1, 1,
0.9673468, -1.577819, 3.03704, 1, 1, 1, 1, 1,
0.9687571, 0.7613234, 3.286058, 1, 1, 1, 1, 1,
0.9758673, -0.03497033, 1.030689, 1, 1, 1, 1, 1,
0.9786091, -1.984143, 3.014986, 1, 1, 1, 1, 1,
0.9859276, -1.617285, 2.509611, 1, 1, 1, 1, 1,
0.9885443, -0.2645866, 1.866331, 1, 1, 1, 1, 1,
0.9926825, 1.001223, 0.03790181, 1, 1, 1, 1, 1,
0.9941898, -1.028398, 2.386989, 1, 1, 1, 1, 1,
0.9967412, -1.531728, 1.635889, 1, 1, 1, 1, 1,
0.9980161, -0.2627121, 2.759362, 1, 1, 1, 1, 1,
1.002061, 0.9336068, 1.570141, 1, 1, 1, 1, 1,
1.007764, -0.3471101, 1.347369, 0, 0, 1, 1, 1,
1.010623, -0.1417287, 0.2954118, 1, 0, 0, 1, 1,
1.013876, -0.2510804, 1.639875, 1, 0, 0, 1, 1,
1.015389, -0.7114521, 1.714655, 1, 0, 0, 1, 1,
1.019625, -0.9918275, 2.471207, 1, 0, 0, 1, 1,
1.025909, 0.2179742, 1.801499, 1, 0, 0, 1, 1,
1.026487, 0.3851986, 1.019705, 0, 0, 0, 1, 1,
1.027564, 0.3875332, 2.009776, 0, 0, 0, 1, 1,
1.033957, -0.6200038, 3.292409, 0, 0, 0, 1, 1,
1.037294, 0.4208879, 2.607274, 0, 0, 0, 1, 1,
1.039616, 1.924004, 1.245724, 0, 0, 0, 1, 1,
1.041225, 0.9634669, 0.5064354, 0, 0, 0, 1, 1,
1.046974, 1.255533, 1.394975, 0, 0, 0, 1, 1,
1.046981, -1.829475, 2.886033, 1, 1, 1, 1, 1,
1.052874, 0.9186542, 0.4439443, 1, 1, 1, 1, 1,
1.063216, 0.2492492, 0.6106993, 1, 1, 1, 1, 1,
1.065234, 0.8726292, -0.6486191, 1, 1, 1, 1, 1,
1.066153, 0.6260605, 1.219907, 1, 1, 1, 1, 1,
1.066879, 0.7116551, -0.2536467, 1, 1, 1, 1, 1,
1.079947, -0.1149941, 1.863777, 1, 1, 1, 1, 1,
1.080917, -0.7643502, 1.096937, 1, 1, 1, 1, 1,
1.085271, -0.7015384, 3.21126, 1, 1, 1, 1, 1,
1.094615, 1.253238, 1.178891, 1, 1, 1, 1, 1,
1.09916, 0.318684, 0.04891499, 1, 1, 1, 1, 1,
1.102344, -0.01376127, 2.817564, 1, 1, 1, 1, 1,
1.112622, -0.3082363, -0.3104095, 1, 1, 1, 1, 1,
1.120891, 0.04216693, 1.012975, 1, 1, 1, 1, 1,
1.120914, -1.39169, 0.599045, 1, 1, 1, 1, 1,
1.150653, 0.1550178, 2.765917, 0, 0, 1, 1, 1,
1.15443, 2.045045, 1.250279, 1, 0, 0, 1, 1,
1.162976, 1.270841, 0.4990129, 1, 0, 0, 1, 1,
1.167358, -1.3179, 3.902036, 1, 0, 0, 1, 1,
1.174187, -0.28455, 2.093008, 1, 0, 0, 1, 1,
1.18657, 0.9296089, 2.330337, 1, 0, 0, 1, 1,
1.190771, -1.879039, 2.234165, 0, 0, 0, 1, 1,
1.194392, 1.893805, -0.6382634, 0, 0, 0, 1, 1,
1.204082, -0.4167716, 1.03245, 0, 0, 0, 1, 1,
1.223514, -2.48, 2.045063, 0, 0, 0, 1, 1,
1.232087, -0.2077262, 0.002028716, 0, 0, 0, 1, 1,
1.240279, -0.07125778, 2.314664, 0, 0, 0, 1, 1,
1.2554, 0.3661665, 1.249347, 0, 0, 0, 1, 1,
1.25793, 1.088068, -0.01040237, 1, 1, 1, 1, 1,
1.25865, -0.3198726, 2.998352, 1, 1, 1, 1, 1,
1.266443, -0.2407351, -0.0204702, 1, 1, 1, 1, 1,
1.268274, 0.4934429, 3.817909, 1, 1, 1, 1, 1,
1.271118, 0.5463148, 0.7030528, 1, 1, 1, 1, 1,
1.276117, 0.895784, 0.4994215, 1, 1, 1, 1, 1,
1.286309, 1.288807, 0.03736547, 1, 1, 1, 1, 1,
1.29373, 0.2697702, 3.478093, 1, 1, 1, 1, 1,
1.299202, -0.5291805, 3.177142, 1, 1, 1, 1, 1,
1.300533, -0.5543126, 2.485698, 1, 1, 1, 1, 1,
1.312755, -1.463085, 3.445921, 1, 1, 1, 1, 1,
1.313293, -0.6648438, 2.417775, 1, 1, 1, 1, 1,
1.321891, -0.6428653, 2.145319, 1, 1, 1, 1, 1,
1.326134, -0.9152299, 3.703063, 1, 1, 1, 1, 1,
1.335831, -0.09964037, 1.917971, 1, 1, 1, 1, 1,
1.352152, -0.354551, -0.1405421, 0, 0, 1, 1, 1,
1.357368, -2.815872, 3.19213, 1, 0, 0, 1, 1,
1.372853, 0.5997441, 0.7976311, 1, 0, 0, 1, 1,
1.374522, 0.8334183, 2.71721, 1, 0, 0, 1, 1,
1.377787, 1.993565, 1.613893, 1, 0, 0, 1, 1,
1.379287, 0.6405864, 0.1471871, 1, 0, 0, 1, 1,
1.383042, 1.767532, 1.38799, 0, 0, 0, 1, 1,
1.383538, -0.7451234, 2.123611, 0, 0, 0, 1, 1,
1.38567, 0.2574844, 1.032259, 0, 0, 0, 1, 1,
1.387731, -0.9423154, 2.215155, 0, 0, 0, 1, 1,
1.388748, -2.292606, 1.937942, 0, 0, 0, 1, 1,
1.399458, -0.4898049, 3.141105, 0, 0, 0, 1, 1,
1.401871, -0.5513755, 4.44404, 0, 0, 0, 1, 1,
1.402943, -1.334602, 1.519225, 1, 1, 1, 1, 1,
1.40365, 0.3822417, 0.9490113, 1, 1, 1, 1, 1,
1.40959, 1.042351, 0.9139822, 1, 1, 1, 1, 1,
1.409759, -0.7118562, 3.419487, 1, 1, 1, 1, 1,
1.42239, 1.328656, -0.6811273, 1, 1, 1, 1, 1,
1.434054, 0.1653573, 1.030319, 1, 1, 1, 1, 1,
1.436378, 0.6977267, 0.5264519, 1, 1, 1, 1, 1,
1.441096, 0.4093978, 1.106195, 1, 1, 1, 1, 1,
1.446976, -0.1337571, 0.7623559, 1, 1, 1, 1, 1,
1.447681, -1.314253, 2.665788, 1, 1, 1, 1, 1,
1.454437, 1.641145, 1.270214, 1, 1, 1, 1, 1,
1.458602, 0.4574848, 0.4986523, 1, 1, 1, 1, 1,
1.492404, 1.28984, 0.4484327, 1, 1, 1, 1, 1,
1.49476, -0.1312726, 0.4788205, 1, 1, 1, 1, 1,
1.505853, -2.121783, 2.319476, 1, 1, 1, 1, 1,
1.508675, -0.5183199, 1.447332, 0, 0, 1, 1, 1,
1.511751, -0.2774706, 1.804091, 1, 0, 0, 1, 1,
1.513283, 1.345498, -1.235936, 1, 0, 0, 1, 1,
1.535479, -0.4447592, 2.220389, 1, 0, 0, 1, 1,
1.53781, -1.336427, 1.999629, 1, 0, 0, 1, 1,
1.54037, 0.1182265, -0.586892, 1, 0, 0, 1, 1,
1.550477, 0.5440598, 1.535597, 0, 0, 0, 1, 1,
1.553952, -0.7887538, 2.817781, 0, 0, 0, 1, 1,
1.559384, 0.5325332, 0.6962298, 0, 0, 0, 1, 1,
1.566399, -0.7467398, 1.901339, 0, 0, 0, 1, 1,
1.5709, 0.9518749, 1.739663, 0, 0, 0, 1, 1,
1.573066, -0.2930596, 1.365425, 0, 0, 0, 1, 1,
1.575975, -1.910151, 1.327571, 0, 0, 0, 1, 1,
1.57679, -0.1562783, 1.189959, 1, 1, 1, 1, 1,
1.584074, -0.9998713, 2.80239, 1, 1, 1, 1, 1,
1.591064, 0.6784539, 0.8199705, 1, 1, 1, 1, 1,
1.599071, 0.0965916, 0.01446396, 1, 1, 1, 1, 1,
1.603123, -0.01852293, 0.06347519, 1, 1, 1, 1, 1,
1.613132, -0.8398055, 1.056272, 1, 1, 1, 1, 1,
1.618647, 0.2472079, 1.460673, 1, 1, 1, 1, 1,
1.621382, 0.8270919, -0.4425303, 1, 1, 1, 1, 1,
1.626517, 0.6661635, -0.07009652, 1, 1, 1, 1, 1,
1.645347, 0.3643569, 1.062356, 1, 1, 1, 1, 1,
1.653427, 1.884654, 1.079598, 1, 1, 1, 1, 1,
1.65347, 0.4640273, 2.095748, 1, 1, 1, 1, 1,
1.658825, 0.3244163, 1.460479, 1, 1, 1, 1, 1,
1.661402, 0.182629, 1.981365, 1, 1, 1, 1, 1,
1.666409, -2.116122, 3.474156, 1, 1, 1, 1, 1,
1.712209, 0.5246099, 1.212303, 0, 0, 1, 1, 1,
1.727461, -0.3161769, 0.7192651, 1, 0, 0, 1, 1,
1.733609, 0.1891087, 0.2582337, 1, 0, 0, 1, 1,
1.736928, -1.282441, 2.930846, 1, 0, 0, 1, 1,
1.738461, -0.6919492, 3.521938, 1, 0, 0, 1, 1,
1.743785, 0.01128941, 2.126726, 1, 0, 0, 1, 1,
1.745129, 1.842385, 2.648401, 0, 0, 0, 1, 1,
1.747637, -1.500808, 1.292598, 0, 0, 0, 1, 1,
1.780723, -0.4293631, 1.981918, 0, 0, 0, 1, 1,
1.803625, -0.1637938, 2.220385, 0, 0, 0, 1, 1,
1.805992, -1.726289, 2.064602, 0, 0, 0, 1, 1,
1.817712, 0.3356992, 1.588682, 0, 0, 0, 1, 1,
1.825431, -1.953795, 3.198169, 0, 0, 0, 1, 1,
1.832574, -1.257256, 1.322526, 1, 1, 1, 1, 1,
1.844482, 0.2719127, 0.0647407, 1, 1, 1, 1, 1,
1.849962, 0.7098869, 3.441044, 1, 1, 1, 1, 1,
1.890375, 1.142222, 0.324063, 1, 1, 1, 1, 1,
1.895654, 0.5902804, 1.786084, 1, 1, 1, 1, 1,
1.90237, -0.2503928, 1.653389, 1, 1, 1, 1, 1,
1.912109, -2.391709, 3.520406, 1, 1, 1, 1, 1,
1.947248, 0.1765713, 4.691994, 1, 1, 1, 1, 1,
1.952501, -0.943708, 0.09322761, 1, 1, 1, 1, 1,
1.97751, 1.340508, 0.8998153, 1, 1, 1, 1, 1,
1.99141, 0.5524552, -0.2168689, 1, 1, 1, 1, 1,
2.004973, 1.958151, -0.1231656, 1, 1, 1, 1, 1,
2.017981, -2.075156, 2.236902, 1, 1, 1, 1, 1,
2.018455, -0.5397336, 2.823451, 1, 1, 1, 1, 1,
2.036228, -0.8095996, 2.94836, 1, 1, 1, 1, 1,
2.038742, 1.047969, 0.7757801, 0, 0, 1, 1, 1,
2.083519, 1.94406, 0.2262098, 1, 0, 0, 1, 1,
2.092137, 0.9932566, 1.609029, 1, 0, 0, 1, 1,
2.098674, -0.8174192, 2.816427, 1, 0, 0, 1, 1,
2.100742, 0.5433862, 2.382708, 1, 0, 0, 1, 1,
2.21211, -0.01825532, 4.114617, 1, 0, 0, 1, 1,
2.245988, -2.367902, 1.452204, 0, 0, 0, 1, 1,
2.248046, -1.465024, 0.8546237, 0, 0, 0, 1, 1,
2.307131, 0.5092261, 0.3910328, 0, 0, 0, 1, 1,
2.370561, -0.01450494, 1.979577, 0, 0, 0, 1, 1,
2.387486, -0.6143795, 3.47347, 0, 0, 0, 1, 1,
2.414294, -0.1488426, 1.792876, 0, 0, 0, 1, 1,
2.476456, 0.1600818, 3.838223, 0, 0, 0, 1, 1,
2.535548, -1.108202, 1.136532, 1, 1, 1, 1, 1,
2.673081, 0.376967, 0.7074834, 1, 1, 1, 1, 1,
2.682061, -0.08034733, 3.409911, 1, 1, 1, 1, 1,
2.737781, 1.445809, 1.507033, 1, 1, 1, 1, 1,
2.993276, 0.4483336, 0.6388243, 1, 1, 1, 1, 1,
3.010135, -1.953312, 2.77455, 1, 1, 1, 1, 1,
3.10918, 0.206267, -0.0769369, 1, 1, 1, 1, 1
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
var radius = 9.725555;
var distance = 34.1606;
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
mvMatrix.translate( -0.08116305, 0.1112981, -0.3473237 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1606);
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
