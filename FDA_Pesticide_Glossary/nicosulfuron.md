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
-2.686216, 0.05032995, -3.310152, 1, 0, 0, 1,
-2.56172, -0.07066509, -2.7731, 1, 0.007843138, 0, 1,
-2.44089, 1.337882, -0.5618018, 1, 0.01176471, 0, 1,
-2.401587, 0.4607814, -1.665855, 1, 0.01960784, 0, 1,
-2.336847, 0.5764937, -0.004164915, 1, 0.02352941, 0, 1,
-2.289785, -1.307078, -0.8339436, 1, 0.03137255, 0, 1,
-2.247559, -0.2266661, -3.616844, 1, 0.03529412, 0, 1,
-2.226301, 1.155473, -1.444554, 1, 0.04313726, 0, 1,
-2.206333, -0.5715303, -1.317821, 1, 0.04705882, 0, 1,
-2.119125, 1.097651, -4.582899, 1, 0.05490196, 0, 1,
-2.035092, -0.374664, 0.2327271, 1, 0.05882353, 0, 1,
-2.031404, -0.3611232, -0.6493477, 1, 0.06666667, 0, 1,
-2.024147, -1.143043, -2.508677, 1, 0.07058824, 0, 1,
-1.962302, -1.812924, -1.802301, 1, 0.07843138, 0, 1,
-1.958071, -0.3462323, -1.084791, 1, 0.08235294, 0, 1,
-1.9513, 1.383907, -1.002056, 1, 0.09019608, 0, 1,
-1.937304, 0.9695043, -0.1776546, 1, 0.09411765, 0, 1,
-1.933811, 2.061762, 0.08238431, 1, 0.1019608, 0, 1,
-1.917593, 0.644974, -0.7953966, 1, 0.1098039, 0, 1,
-1.895102, -0.1541632, -1.128865, 1, 0.1137255, 0, 1,
-1.858976, -0.5817987, 0.822827, 1, 0.1215686, 0, 1,
-1.846348, -1.202545, -2.443571, 1, 0.1254902, 0, 1,
-1.827577, 0.8861165, -2.472132, 1, 0.1333333, 0, 1,
-1.798459, 0.3365389, -2.511569, 1, 0.1372549, 0, 1,
-1.792866, -0.1233124, -1.132327, 1, 0.145098, 0, 1,
-1.779712, 0.3506542, -2.062742, 1, 0.1490196, 0, 1,
-1.776786, -0.7094062, -2.846489, 1, 0.1568628, 0, 1,
-1.770748, 0.266089, -1.36933, 1, 0.1607843, 0, 1,
-1.769047, 0.8833288, -0.3429675, 1, 0.1686275, 0, 1,
-1.765052, 0.2802936, -0.8669615, 1, 0.172549, 0, 1,
-1.711178, 2.214997, -2.00649, 1, 0.1803922, 0, 1,
-1.705718, 1.126294, 0.02395371, 1, 0.1843137, 0, 1,
-1.698051, 0.05826803, -2.486393, 1, 0.1921569, 0, 1,
-1.657367, -0.1176354, -0.3175963, 1, 0.1960784, 0, 1,
-1.653197, -0.01905253, -3.579895, 1, 0.2039216, 0, 1,
-1.628579, 0.6527466, -3.82602, 1, 0.2117647, 0, 1,
-1.618971, 0.4719502, -1.946577, 1, 0.2156863, 0, 1,
-1.609677, 0.7090521, -0.183363, 1, 0.2235294, 0, 1,
-1.601628, -0.4543342, -1.988033, 1, 0.227451, 0, 1,
-1.580109, -0.2858675, -1.68505, 1, 0.2352941, 0, 1,
-1.579505, -0.06241199, -0.2867337, 1, 0.2392157, 0, 1,
-1.5709, -0.6694638, -0.838178, 1, 0.2470588, 0, 1,
-1.570188, -0.026318, -2.293653, 1, 0.2509804, 0, 1,
-1.537828, -0.3345058, -2.574612, 1, 0.2588235, 0, 1,
-1.531081, 0.384574, -0.61751, 1, 0.2627451, 0, 1,
-1.52767, 1.538349, -0.9151565, 1, 0.2705882, 0, 1,
-1.527511, -1.647217, -1.380467, 1, 0.2745098, 0, 1,
-1.520132, 0.3190047, -1.024918, 1, 0.282353, 0, 1,
-1.518809, -0.4765957, -1.07654, 1, 0.2862745, 0, 1,
-1.508564, 0.6960281, -0.02716979, 1, 0.2941177, 0, 1,
-1.478773, 0.3573555, -2.590103, 1, 0.3019608, 0, 1,
-1.476332, -1.563669, -2.285082, 1, 0.3058824, 0, 1,
-1.450861, -1.158173, -2.09825, 1, 0.3137255, 0, 1,
-1.443344, 0.4564501, -0.9998189, 1, 0.3176471, 0, 1,
-1.440729, -0.05879293, -1.838504, 1, 0.3254902, 0, 1,
-1.403742, 1.928389, 1.219922, 1, 0.3294118, 0, 1,
-1.403506, 0.2790184, -1.864052, 1, 0.3372549, 0, 1,
-1.393246, 1.642862, -0.4826895, 1, 0.3411765, 0, 1,
-1.392531, 0.5585189, -2.70176, 1, 0.3490196, 0, 1,
-1.391074, 0.1732016, -1.37475, 1, 0.3529412, 0, 1,
-1.365286, -1.237362, -4.900307, 1, 0.3607843, 0, 1,
-1.356088, -0.5966126, -2.629105, 1, 0.3647059, 0, 1,
-1.351609, -0.5341591, -1.006481, 1, 0.372549, 0, 1,
-1.35129, -0.8359604, -2.68813, 1, 0.3764706, 0, 1,
-1.344736, -0.02218672, -1.279145, 1, 0.3843137, 0, 1,
-1.333431, 0.4792004, -1.261562, 1, 0.3882353, 0, 1,
-1.32989, -0.5245558, -1.630655, 1, 0.3960784, 0, 1,
-1.324362, 2.392912, -0.6508816, 1, 0.4039216, 0, 1,
-1.321876, 0.4468551, -0.9312127, 1, 0.4078431, 0, 1,
-1.291276, 0.2054967, -2.041091, 1, 0.4156863, 0, 1,
-1.286888, 0.4143336, 0.06155767, 1, 0.4196078, 0, 1,
-1.280131, 0.3830844, -0.6796825, 1, 0.427451, 0, 1,
-1.277932, 0.9411969, 0.8277462, 1, 0.4313726, 0, 1,
-1.270458, -0.8425376, -0.3699181, 1, 0.4392157, 0, 1,
-1.266348, -1.323531, -2.239641, 1, 0.4431373, 0, 1,
-1.25692, 1.319088, -1.914309, 1, 0.4509804, 0, 1,
-1.25057, -0.2281759, -2.911158, 1, 0.454902, 0, 1,
-1.249329, 1.457254, -0.8289302, 1, 0.4627451, 0, 1,
-1.240893, -0.3381962, -2.874488, 1, 0.4666667, 0, 1,
-1.240227, 2.131265, -0.09215067, 1, 0.4745098, 0, 1,
-1.234587, -0.8340859, -1.220738, 1, 0.4784314, 0, 1,
-1.234196, -0.9688948, -2.950278, 1, 0.4862745, 0, 1,
-1.231048, -0.1392536, -2.1651, 1, 0.4901961, 0, 1,
-1.22181, 0.2677049, -1.918998, 1, 0.4980392, 0, 1,
-1.218204, 0.7594922, -1.920458, 1, 0.5058824, 0, 1,
-1.210025, -0.5854366, -3.115262, 1, 0.509804, 0, 1,
-1.186803, 0.04966684, -1.320784, 1, 0.5176471, 0, 1,
-1.186599, -0.6719531, -3.574266, 1, 0.5215687, 0, 1,
-1.179274, 0.243312, -1.445337, 1, 0.5294118, 0, 1,
-1.170545, 1.439669, 0.1893456, 1, 0.5333334, 0, 1,
-1.169217, 1.043421, -0.2805675, 1, 0.5411765, 0, 1,
-1.166251, 0.4342271, -1.102823, 1, 0.5450981, 0, 1,
-1.165146, 0.6365895, -1.530425, 1, 0.5529412, 0, 1,
-1.164162, 1.165381, -0.8230872, 1, 0.5568628, 0, 1,
-1.155686, 0.8411958, -0.2998783, 1, 0.5647059, 0, 1,
-1.155164, -0.7351789, -0.3389159, 1, 0.5686275, 0, 1,
-1.149132, 0.687278, -1.738033, 1, 0.5764706, 0, 1,
-1.148434, 0.4249091, -1.37028, 1, 0.5803922, 0, 1,
-1.142686, -1.843933, -2.043925, 1, 0.5882353, 0, 1,
-1.14128, 1.019907, -1.591111, 1, 0.5921569, 0, 1,
-1.140985, 1.577071, -0.7349163, 1, 0.6, 0, 1,
-1.136097, -0.4155535, -2.60351, 1, 0.6078432, 0, 1,
-1.121021, -0.190996, -3.191313, 1, 0.6117647, 0, 1,
-1.099407, -0.7641611, -2.642587, 1, 0.6196079, 0, 1,
-1.097416, -2.249853, -2.486833, 1, 0.6235294, 0, 1,
-1.096604, 1.776364, -0.3315165, 1, 0.6313726, 0, 1,
-1.089341, -1.325212, -3.555281, 1, 0.6352941, 0, 1,
-1.083011, -0.1601546, 0.4752763, 1, 0.6431373, 0, 1,
-1.07563, 0.3534182, -1.624127, 1, 0.6470588, 0, 1,
-1.065264, -2.334799, -3.826459, 1, 0.654902, 0, 1,
-1.064643, -3.21556, -2.607331, 1, 0.6588235, 0, 1,
-1.049717, -0.04670653, 0.05332244, 1, 0.6666667, 0, 1,
-1.046441, 0.04199268, -0.2898219, 1, 0.6705883, 0, 1,
-1.039077, -1.864199, -2.069789, 1, 0.6784314, 0, 1,
-1.039064, -1.38082, -0.2368763, 1, 0.682353, 0, 1,
-1.038151, 0.6686218, -2.277314, 1, 0.6901961, 0, 1,
-1.036752, -0.8813503, -2.225446, 1, 0.6941177, 0, 1,
-1.021839, -0.249722, -0.8105506, 1, 0.7019608, 0, 1,
-1.017012, -0.04811921, -1.6102, 1, 0.7098039, 0, 1,
-1.014954, -0.8364756, -1.587076, 1, 0.7137255, 0, 1,
-1.013666, -0.01933097, -2.330013, 1, 0.7215686, 0, 1,
-1.01021, 0.4970097, -0.652084, 1, 0.7254902, 0, 1,
-1.006779, 0.9913508, 1.865902, 1, 0.7333333, 0, 1,
-1.004297, 1.057907, -1.262806, 1, 0.7372549, 0, 1,
-1.003078, -0.4255743, -1.828403, 1, 0.7450981, 0, 1,
-1.000758, 0.4446938, -1.16901, 1, 0.7490196, 0, 1,
-0.993821, 2.667928, 0.06730964, 1, 0.7568628, 0, 1,
-0.9890283, -0.7652626, -3.413719, 1, 0.7607843, 0, 1,
-0.9841563, 0.1638869, -3.315651, 1, 0.7686275, 0, 1,
-0.9829484, 0.4116451, -0.4693737, 1, 0.772549, 0, 1,
-0.9661377, 0.1848779, -2.702302, 1, 0.7803922, 0, 1,
-0.9605115, 0.1321975, -0.6736493, 1, 0.7843137, 0, 1,
-0.9561967, 1.066684, -0.4137339, 1, 0.7921569, 0, 1,
-0.9554373, -0.1358554, -2.862591, 1, 0.7960784, 0, 1,
-0.9550018, -1.270867, -2.018327, 1, 0.8039216, 0, 1,
-0.9526473, -0.174163, -2.52042, 1, 0.8117647, 0, 1,
-0.9480782, 2.093309, 0.405194, 1, 0.8156863, 0, 1,
-0.9400443, -0.4354787, -0.04689407, 1, 0.8235294, 0, 1,
-0.9373294, -1.565038, -1.893968, 1, 0.827451, 0, 1,
-0.9368022, -0.1027966, -3.551944, 1, 0.8352941, 0, 1,
-0.9317318, -0.3478727, -2.509105, 1, 0.8392157, 0, 1,
-0.9301977, 0.1167135, -1.291445, 1, 0.8470588, 0, 1,
-0.9289514, 0.4902118, -0.2638229, 1, 0.8509804, 0, 1,
-0.9289433, 0.7359366, -0.6339197, 1, 0.8588235, 0, 1,
-0.9283759, -1.834349, -1.99509, 1, 0.8627451, 0, 1,
-0.9206913, -0.5328113, -3.686734, 1, 0.8705882, 0, 1,
-0.9182468, 0.8989581, -0.6942105, 1, 0.8745098, 0, 1,
-0.9173901, -0.7852544, -2.163181, 1, 0.8823529, 0, 1,
-0.9145794, 0.3522777, 0.012664, 1, 0.8862745, 0, 1,
-0.9084833, -1.832999, -3.29093, 1, 0.8941177, 0, 1,
-0.9064196, 1.329238, -0.4222517, 1, 0.8980392, 0, 1,
-0.9031599, 0.3442007, -0.1465091, 1, 0.9058824, 0, 1,
-0.8981665, 2.062607, -0.888591, 1, 0.9137255, 0, 1,
-0.8924783, 0.5994698, -2.034995, 1, 0.9176471, 0, 1,
-0.8910355, -0.5299506, -0.3283386, 1, 0.9254902, 0, 1,
-0.8886696, 0.2501682, -0.5065939, 1, 0.9294118, 0, 1,
-0.8741397, -1.345776, -1.037667, 1, 0.9372549, 0, 1,
-0.8657634, -0.8207167, -1.247135, 1, 0.9411765, 0, 1,
-0.8633071, -0.05858322, -1.932097, 1, 0.9490196, 0, 1,
-0.8540097, -1.247229, -1.374189, 1, 0.9529412, 0, 1,
-0.849071, 0.64423, -2.305994, 1, 0.9607843, 0, 1,
-0.8485883, 0.1841051, -1.95425, 1, 0.9647059, 0, 1,
-0.8462695, -1.003656, -3.191647, 1, 0.972549, 0, 1,
-0.8228756, 2.225786, 0.7233978, 1, 0.9764706, 0, 1,
-0.822439, -1.430483, -2.483119, 1, 0.9843137, 0, 1,
-0.817807, -2.172579, -2.063532, 1, 0.9882353, 0, 1,
-0.8118695, 0.6831028, 0.299782, 1, 0.9960784, 0, 1,
-0.8104049, -1.400593, -1.43688, 0.9960784, 1, 0, 1,
-0.8056912, 1.089571, -0.9512733, 0.9921569, 1, 0, 1,
-0.7995565, 1.416049, -0.9904298, 0.9843137, 1, 0, 1,
-0.7984324, 0.78567, -1.051246, 0.9803922, 1, 0, 1,
-0.7980382, 0.1554727, -2.044587, 0.972549, 1, 0, 1,
-0.7953163, 0.176773, -1.922493, 0.9686275, 1, 0, 1,
-0.7942873, -1.641472, -2.158455, 0.9607843, 1, 0, 1,
-0.7937981, -0.2285128, -0.8759242, 0.9568627, 1, 0, 1,
-0.7884529, 1.791885, -1.102363, 0.9490196, 1, 0, 1,
-0.7808521, -0.8099803, -4.468937, 0.945098, 1, 0, 1,
-0.7765215, 0.2139657, -0.933822, 0.9372549, 1, 0, 1,
-0.7758948, 1.110912, -0.5043752, 0.9333333, 1, 0, 1,
-0.7730987, 1.085342, -0.5096559, 0.9254902, 1, 0, 1,
-0.7701415, -0.5352378, -3.158961, 0.9215686, 1, 0, 1,
-0.7688437, 1.072354, -0.9897409, 0.9137255, 1, 0, 1,
-0.7673002, -1.479243, -3.097947, 0.9098039, 1, 0, 1,
-0.7672647, 1.492372, 0.2919835, 0.9019608, 1, 0, 1,
-0.7666906, 0.0464895, -2.755356, 0.8941177, 1, 0, 1,
-0.7617948, -0.9183126, -2.917844, 0.8901961, 1, 0, 1,
-0.7596043, -0.4082872, -0.9340783, 0.8823529, 1, 0, 1,
-0.759244, 1.264078, -1.473008, 0.8784314, 1, 0, 1,
-0.7568159, 0.1243449, -1.92654, 0.8705882, 1, 0, 1,
-0.7560856, 1.235574, 0.4606918, 0.8666667, 1, 0, 1,
-0.7537897, 0.2146653, -1.374503, 0.8588235, 1, 0, 1,
-0.7532817, -0.9824702, -3.899024, 0.854902, 1, 0, 1,
-0.7526766, -1.189864, -1.536332, 0.8470588, 1, 0, 1,
-0.7513402, 0.3514875, -1.687664, 0.8431373, 1, 0, 1,
-0.7480234, 0.3259301, 0.2669803, 0.8352941, 1, 0, 1,
-0.7466395, -0.7593163, -3.226544, 0.8313726, 1, 0, 1,
-0.7458404, 0.0538362, -2.640423, 0.8235294, 1, 0, 1,
-0.744462, -0.8286778, -3.114619, 0.8196079, 1, 0, 1,
-0.7441294, 2.137901, 1.026087, 0.8117647, 1, 0, 1,
-0.7415823, -0.1389097, -1.320256, 0.8078431, 1, 0, 1,
-0.7394555, -1.207083, -2.08384, 0.8, 1, 0, 1,
-0.7383593, -2.555768, -4.014424, 0.7921569, 1, 0, 1,
-0.7356799, 0.1847496, -1.238238, 0.7882353, 1, 0, 1,
-0.7355179, 1.096078, 0.3565301, 0.7803922, 1, 0, 1,
-0.7282103, 0.7079228, -2.485186, 0.7764706, 1, 0, 1,
-0.725845, -2.670866, -3.939847, 0.7686275, 1, 0, 1,
-0.7142155, 2.048841, -0.2540208, 0.7647059, 1, 0, 1,
-0.7125053, -0.6322768, -1.934195, 0.7568628, 1, 0, 1,
-0.7119273, -0.3462652, -1.958853, 0.7529412, 1, 0, 1,
-0.7100645, 0.7944586, 1.123909, 0.7450981, 1, 0, 1,
-0.7065307, 0.7654107, -1.706835, 0.7411765, 1, 0, 1,
-0.7003496, 0.8301821, 0.2514076, 0.7333333, 1, 0, 1,
-0.6988219, -0.4394383, -1.645072, 0.7294118, 1, 0, 1,
-0.694952, -0.4371746, -1.66197, 0.7215686, 1, 0, 1,
-0.6909038, 0.1329831, -0.7175043, 0.7176471, 1, 0, 1,
-0.6908462, -0.297731, -2.691677, 0.7098039, 1, 0, 1,
-0.6843333, 1.120825, -0.4790312, 0.7058824, 1, 0, 1,
-0.6843106, -0.06663366, -2.057181, 0.6980392, 1, 0, 1,
-0.6812446, 0.5020997, -2.513282, 0.6901961, 1, 0, 1,
-0.6741961, -0.6762871, -0.645428, 0.6862745, 1, 0, 1,
-0.6731969, -1.124283, -3.101421, 0.6784314, 1, 0, 1,
-0.673178, -1.272682, -1.420134, 0.6745098, 1, 0, 1,
-0.6720284, -0.7029172, -1.104371, 0.6666667, 1, 0, 1,
-0.670109, 0.9982985, -1.047472, 0.6627451, 1, 0, 1,
-0.6680642, 0.736232, -1.872544, 0.654902, 1, 0, 1,
-0.6657681, -0.4622192, -2.236954, 0.6509804, 1, 0, 1,
-0.6657043, -0.7732849, -0.4714638, 0.6431373, 1, 0, 1,
-0.6639617, 0.9901219, -2.177171, 0.6392157, 1, 0, 1,
-0.6618707, -0.4084215, -1.088356, 0.6313726, 1, 0, 1,
-0.657084, 1.874272, -1.416387, 0.627451, 1, 0, 1,
-0.656525, -1.697818, -2.932001, 0.6196079, 1, 0, 1,
-0.6464897, 0.5918476, -0.8370431, 0.6156863, 1, 0, 1,
-0.6451936, 0.9806169, -1.346882, 0.6078432, 1, 0, 1,
-0.6447232, -0.6821794, -2.808084, 0.6039216, 1, 0, 1,
-0.6409302, -0.5097184, -3.527185, 0.5960785, 1, 0, 1,
-0.6387168, -2.013815, -2.180268, 0.5882353, 1, 0, 1,
-0.638666, 0.5036806, -1.074109, 0.5843138, 1, 0, 1,
-0.6380597, -2.067792, -2.097007, 0.5764706, 1, 0, 1,
-0.6366352, 0.09551282, 1.017857, 0.572549, 1, 0, 1,
-0.6326899, -0.7500074, -2.204375, 0.5647059, 1, 0, 1,
-0.6317387, -0.2596714, -2.19178, 0.5607843, 1, 0, 1,
-0.6295972, -0.6877698, -3.049811, 0.5529412, 1, 0, 1,
-0.6242183, -1.236519, -3.421686, 0.5490196, 1, 0, 1,
-0.6211369, 0.5136391, -1.876981, 0.5411765, 1, 0, 1,
-0.6161922, -0.2004301, -2.560729, 0.5372549, 1, 0, 1,
-0.6161355, 1.13112, -0.1993561, 0.5294118, 1, 0, 1,
-0.6149897, 0.4032264, -2.454587, 0.5254902, 1, 0, 1,
-0.6145626, -1.457683, -2.101404, 0.5176471, 1, 0, 1,
-0.6099557, -0.5320233, -2.677867, 0.5137255, 1, 0, 1,
-0.6049649, -1.130616, -3.057503, 0.5058824, 1, 0, 1,
-0.6047488, 1.134111, -0.1188444, 0.5019608, 1, 0, 1,
-0.602695, 1.356313, -0.1709539, 0.4941176, 1, 0, 1,
-0.6007065, 0.06951786, -1.45513, 0.4862745, 1, 0, 1,
-0.5980099, 0.3020228, 0.02722205, 0.4823529, 1, 0, 1,
-0.5963044, 0.3503352, -0.67493, 0.4745098, 1, 0, 1,
-0.5958244, 1.197343, -0.8929067, 0.4705882, 1, 0, 1,
-0.585528, -0.4076577, -3.033059, 0.4627451, 1, 0, 1,
-0.580332, 0.1815878, -2.128237, 0.4588235, 1, 0, 1,
-0.5776136, 0.6046348, -2.1992, 0.4509804, 1, 0, 1,
-0.5762895, 0.612034, 2.29986, 0.4470588, 1, 0, 1,
-0.573884, -0.07817835, -0.7806296, 0.4392157, 1, 0, 1,
-0.572547, 0.1192902, -1.395535, 0.4352941, 1, 0, 1,
-0.5725289, -0.9533181, -3.050372, 0.427451, 1, 0, 1,
-0.568934, 2.353632, -1.437191, 0.4235294, 1, 0, 1,
-0.5651739, 0.742875, -1.507369, 0.4156863, 1, 0, 1,
-0.561794, 0.07887608, -1.999575, 0.4117647, 1, 0, 1,
-0.5612339, 0.06301633, -1.982128, 0.4039216, 1, 0, 1,
-0.5604079, -0.3013349, -1.090724, 0.3960784, 1, 0, 1,
-0.5579383, 1.404121, 0.2398147, 0.3921569, 1, 0, 1,
-0.5569561, -0.7240732, -1.929865, 0.3843137, 1, 0, 1,
-0.5557491, 0.600296, -1.275095, 0.3803922, 1, 0, 1,
-0.5531228, 0.2172893, -0.7122531, 0.372549, 1, 0, 1,
-0.5517098, 0.1627037, -2.105911, 0.3686275, 1, 0, 1,
-0.5499413, 2.152818, 0.1909454, 0.3607843, 1, 0, 1,
-0.5487542, 1.602978, -2.37158, 0.3568628, 1, 0, 1,
-0.5466162, -0.5225308, -2.305798, 0.3490196, 1, 0, 1,
-0.5457549, 0.3221096, -2.4089, 0.345098, 1, 0, 1,
-0.5441163, 0.5078852, -0.4075456, 0.3372549, 1, 0, 1,
-0.5418739, 0.4268559, -0.6498119, 0.3333333, 1, 0, 1,
-0.5404177, 0.7202718, -0.6484591, 0.3254902, 1, 0, 1,
-0.5338977, 1.845222, -0.760305, 0.3215686, 1, 0, 1,
-0.5315391, 0.2642707, -3.114567, 0.3137255, 1, 0, 1,
-0.5300362, 0.8199409, -1.378478, 0.3098039, 1, 0, 1,
-0.5298666, 0.829787, -1.893765, 0.3019608, 1, 0, 1,
-0.5289703, 0.08090846, -0.5733258, 0.2941177, 1, 0, 1,
-0.52055, 0.9506429, -0.6169629, 0.2901961, 1, 0, 1,
-0.5164938, 1.297328, -0.501709, 0.282353, 1, 0, 1,
-0.5155532, 0.4913048, -1.862603, 0.2784314, 1, 0, 1,
-0.5120651, 1.885296, -0.3211167, 0.2705882, 1, 0, 1,
-0.5115532, -0.6048111, -0.9479822, 0.2666667, 1, 0, 1,
-0.5103241, -0.6580176, -1.968799, 0.2588235, 1, 0, 1,
-0.5070904, -0.6824971, -2.092873, 0.254902, 1, 0, 1,
-0.5061003, 0.950518, -0.3979607, 0.2470588, 1, 0, 1,
-0.5059774, 0.6978087, -0.3430592, 0.2431373, 1, 0, 1,
-0.5047569, 1.188154, -1.388189, 0.2352941, 1, 0, 1,
-0.5019219, -0.5299477, -1.991589, 0.2313726, 1, 0, 1,
-0.4947129, 0.144294, -0.4410447, 0.2235294, 1, 0, 1,
-0.4925208, -3.547005, -2.068139, 0.2196078, 1, 0, 1,
-0.4887602, 1.064919, -0.708897, 0.2117647, 1, 0, 1,
-0.4881655, -0.3235723, -1.826063, 0.2078431, 1, 0, 1,
-0.4847621, -0.9303554, -2.740628, 0.2, 1, 0, 1,
-0.4845027, -1.438673, -3.256673, 0.1921569, 1, 0, 1,
-0.4805813, -0.6712225, -2.781983, 0.1882353, 1, 0, 1,
-0.478742, 0.2120366, -2.440162, 0.1803922, 1, 0, 1,
-0.4782649, 0.5989302, 1.251474, 0.1764706, 1, 0, 1,
-0.474957, -1.194093, -3.222401, 0.1686275, 1, 0, 1,
-0.472899, 0.1320101, -0.7931948, 0.1647059, 1, 0, 1,
-0.4713327, -0.3162696, -3.092843, 0.1568628, 1, 0, 1,
-0.4711685, 0.7244698, -0.9939235, 0.1529412, 1, 0, 1,
-0.4710696, -1.433439, -2.556592, 0.145098, 1, 0, 1,
-0.4709641, 0.03199845, -2.238577, 0.1411765, 1, 0, 1,
-0.4686159, -1.141775, -2.233843, 0.1333333, 1, 0, 1,
-0.4677932, -0.7490811, -3.309053, 0.1294118, 1, 0, 1,
-0.4653133, -0.4818416, -2.304701, 0.1215686, 1, 0, 1,
-0.46454, -1.740489, -2.295964, 0.1176471, 1, 0, 1,
-0.4615803, -0.04666015, -0.02143505, 0.1098039, 1, 0, 1,
-0.4608974, 0.8645287, 1.46157, 0.1058824, 1, 0, 1,
-0.4601963, -0.07507191, -2.402299, 0.09803922, 1, 0, 1,
-0.455453, -0.8606637, -2.403977, 0.09019608, 1, 0, 1,
-0.4494118, 1.638507, -0.3483618, 0.08627451, 1, 0, 1,
-0.4485665, -1.033406, -2.472309, 0.07843138, 1, 0, 1,
-0.4417357, 0.3499755, -1.51953, 0.07450981, 1, 0, 1,
-0.4326283, 1.992931, -0.8485944, 0.06666667, 1, 0, 1,
-0.4308742, -0.8746471, -3.747072, 0.0627451, 1, 0, 1,
-0.4273873, -0.1249483, -1.122369, 0.05490196, 1, 0, 1,
-0.4270246, 1.250608, -1.835278, 0.05098039, 1, 0, 1,
-0.4196909, 1.09456, -0.6694458, 0.04313726, 1, 0, 1,
-0.4178059, -0.7946106, -1.814895, 0.03921569, 1, 0, 1,
-0.4164168, -0.7267395, -2.315311, 0.03137255, 1, 0, 1,
-0.4163052, 0.4543639, 0.2011392, 0.02745098, 1, 0, 1,
-0.4116217, -0.7513514, -3.683702, 0.01960784, 1, 0, 1,
-0.4075455, -1.916095, -3.386207, 0.01568628, 1, 0, 1,
-0.4020883, 0.4686087, -0.4811942, 0.007843138, 1, 0, 1,
-0.4020281, 1.601288, -0.6126187, 0.003921569, 1, 0, 1,
-0.4017645, 0.9700719, 0.07388056, 0, 1, 0.003921569, 1,
-0.4014083, -1.419206, -5.458108, 0, 1, 0.01176471, 1,
-0.3977751, 1.710608, -0.3000876, 0, 1, 0.01568628, 1,
-0.3908954, -0.3254151, -2.564667, 0, 1, 0.02352941, 1,
-0.3888495, 1.058218, 0.3347328, 0, 1, 0.02745098, 1,
-0.3886573, -0.06799625, -1.333296, 0, 1, 0.03529412, 1,
-0.3868603, -0.2773947, -2.192602, 0, 1, 0.03921569, 1,
-0.385902, -0.06058335, -2.529628, 0, 1, 0.04705882, 1,
-0.3854586, 0.3225585, -0.5948886, 0, 1, 0.05098039, 1,
-0.3839083, -0.274876, -0.8166503, 0, 1, 0.05882353, 1,
-0.3816637, 0.6803342, -0.2134541, 0, 1, 0.0627451, 1,
-0.3797595, 0.2218121, -0.4438118, 0, 1, 0.07058824, 1,
-0.378473, 0.8810353, -0.2449537, 0, 1, 0.07450981, 1,
-0.3764399, 1.958626, 0.5259376, 0, 1, 0.08235294, 1,
-0.3722018, 0.2115168, -1.699634, 0, 1, 0.08627451, 1,
-0.3685419, 0.2189656, -0.1077658, 0, 1, 0.09411765, 1,
-0.3684805, -1.803666, -4.435629, 0, 1, 0.1019608, 1,
-0.3645129, 0.131682, 0.07733704, 0, 1, 0.1058824, 1,
-0.3637848, 0.8058013, -1.665702, 0, 1, 0.1137255, 1,
-0.3630873, -0.7651227, -4.125119, 0, 1, 0.1176471, 1,
-0.3562559, -0.9142221, -1.482808, 0, 1, 0.1254902, 1,
-0.3558899, -0.06126022, -2.014477, 0, 1, 0.1294118, 1,
-0.3547992, -0.3362207, -3.09892, 0, 1, 0.1372549, 1,
-0.3538411, 0.5953282, -0.4783505, 0, 1, 0.1411765, 1,
-0.3466133, 1.190495, -0.08343441, 0, 1, 0.1490196, 1,
-0.3451415, -1.873127, -3.303744, 0, 1, 0.1529412, 1,
-0.3445054, 0.6819954, 1.078613, 0, 1, 0.1607843, 1,
-0.3405611, 0.9908159, -0.3343307, 0, 1, 0.1647059, 1,
-0.333451, 0.1604031, 0.03650948, 0, 1, 0.172549, 1,
-0.3328797, 0.02038438, -2.478095, 0, 1, 0.1764706, 1,
-0.3269927, 0.9295768, -0.9202924, 0, 1, 0.1843137, 1,
-0.3173425, -0.5321373, -3.107202, 0, 1, 0.1882353, 1,
-0.3096467, -0.2273942, -3.181156, 0, 1, 0.1960784, 1,
-0.3096358, 1.626534, -1.039783, 0, 1, 0.2039216, 1,
-0.3083354, -0.6781952, -2.381093, 0, 1, 0.2078431, 1,
-0.3023597, -0.5839642, -3.551233, 0, 1, 0.2156863, 1,
-0.3003739, 0.9074245, 0.3800533, 0, 1, 0.2196078, 1,
-0.3000745, -0.7733202, -3.87907, 0, 1, 0.227451, 1,
-0.3000333, 0.6994869, -0.7321272, 0, 1, 0.2313726, 1,
-0.2999787, -0.9738426, -2.280627, 0, 1, 0.2392157, 1,
-0.2993939, -0.950053, -2.466447, 0, 1, 0.2431373, 1,
-0.298972, 0.6248878, -1.037252, 0, 1, 0.2509804, 1,
-0.2962218, -0.6085459, -1.467966, 0, 1, 0.254902, 1,
-0.2958697, -0.2295845, -1.819357, 0, 1, 0.2627451, 1,
-0.2955394, 0.2882136, -1.785851, 0, 1, 0.2666667, 1,
-0.2942522, 1.211931, -1.146572, 0, 1, 0.2745098, 1,
-0.2934792, -0.2771872, -1.656005, 0, 1, 0.2784314, 1,
-0.2923464, 1.91033, 0.8755715, 0, 1, 0.2862745, 1,
-0.2909861, 0.7789342, 1.329064, 0, 1, 0.2901961, 1,
-0.2830805, -0.4510882, -2.567548, 0, 1, 0.2980392, 1,
-0.2817516, 1.796205, -1.334092, 0, 1, 0.3058824, 1,
-0.2799504, 1.77969, -0.6709703, 0, 1, 0.3098039, 1,
-0.27994, 1.455033, -0.5732177, 0, 1, 0.3176471, 1,
-0.2795624, 0.7659121, 1.601919, 0, 1, 0.3215686, 1,
-0.2780377, -0.5143251, -2.876438, 0, 1, 0.3294118, 1,
-0.2777784, -0.8606231, -3.633389, 0, 1, 0.3333333, 1,
-0.2776181, -1.421994, -0.9914364, 0, 1, 0.3411765, 1,
-0.276989, -0.1654747, -1.237607, 0, 1, 0.345098, 1,
-0.2736322, -0.09798919, -1.906388, 0, 1, 0.3529412, 1,
-0.2709314, -0.5054225, -1.947508, 0, 1, 0.3568628, 1,
-0.2699945, -1.904004, -2.486412, 0, 1, 0.3647059, 1,
-0.267095, 1.749098, 0.433038, 0, 1, 0.3686275, 1,
-0.2637082, -0.5616653, -2.673473, 0, 1, 0.3764706, 1,
-0.2609169, 1.885354, 0.2451908, 0, 1, 0.3803922, 1,
-0.2581712, 0.5839936, 2.019547, 0, 1, 0.3882353, 1,
-0.2580449, 0.1169647, -1.146569, 0, 1, 0.3921569, 1,
-0.2576528, 1.171208, -1.101295, 0, 1, 0.4, 1,
-0.2493237, 0.07426579, -1.831966, 0, 1, 0.4078431, 1,
-0.2490351, 1.428303, 0.4852582, 0, 1, 0.4117647, 1,
-0.2479935, -0.2927784, -2.644825, 0, 1, 0.4196078, 1,
-0.2465133, 1.188272, 0.5428436, 0, 1, 0.4235294, 1,
-0.2455612, -0.408705, -5.024518, 0, 1, 0.4313726, 1,
-0.2445633, 0.4992442, -1.042018, 0, 1, 0.4352941, 1,
-0.2444754, 0.1336295, -0.5895886, 0, 1, 0.4431373, 1,
-0.2343292, 0.3943777, -0.8906406, 0, 1, 0.4470588, 1,
-0.2337983, -0.6954888, -2.339485, 0, 1, 0.454902, 1,
-0.2299032, -0.9171353, -2.99518, 0, 1, 0.4588235, 1,
-0.2236635, -0.03919506, -1.663883, 0, 1, 0.4666667, 1,
-0.2236565, -0.2412034, -2.561115, 0, 1, 0.4705882, 1,
-0.2218146, 0.2240715, 0.9124288, 0, 1, 0.4784314, 1,
-0.2185953, 0.8632765, -0.2274481, 0, 1, 0.4823529, 1,
-0.2178181, -0.5896752, -2.724152, 0, 1, 0.4901961, 1,
-0.2166645, -1.174708, -3.988571, 0, 1, 0.4941176, 1,
-0.2146491, 2.128392, 0.2688903, 0, 1, 0.5019608, 1,
-0.2126653, 0.6252528, 0.0224432, 0, 1, 0.509804, 1,
-0.2096847, 0.4727057, 0.6166603, 0, 1, 0.5137255, 1,
-0.2095691, -0.7049763, -2.635347, 0, 1, 0.5215687, 1,
-0.2084468, -0.1374052, -1.743131, 0, 1, 0.5254902, 1,
-0.2063778, -1.724279, -3.597994, 0, 1, 0.5333334, 1,
-0.2062511, 0.1471622, -1.764298, 0, 1, 0.5372549, 1,
-0.2021272, -0.8361169, -4.203385, 0, 1, 0.5450981, 1,
-0.1932852, 0.7793078, 0.6896118, 0, 1, 0.5490196, 1,
-0.1905083, -0.3936086, -3.19418, 0, 1, 0.5568628, 1,
-0.1896384, 1.863643, -1.162579, 0, 1, 0.5607843, 1,
-0.1860851, -0.272439, -2.506802, 0, 1, 0.5686275, 1,
-0.1818644, 0.2237992, -0.298265, 0, 1, 0.572549, 1,
-0.1743132, -1.092685, -3.054199, 0, 1, 0.5803922, 1,
-0.1684971, 0.1645301, -0.5136858, 0, 1, 0.5843138, 1,
-0.1679576, -0.3778436, -3.394834, 0, 1, 0.5921569, 1,
-0.1663442, 1.513313, 0.7294517, 0, 1, 0.5960785, 1,
-0.1659615, -0.4282397, -3.6154, 0, 1, 0.6039216, 1,
-0.1626658, 1.027837, -0.1909483, 0, 1, 0.6117647, 1,
-0.1594518, 0.5033987, -0.316987, 0, 1, 0.6156863, 1,
-0.1588245, 0.4899896, -0.6370043, 0, 1, 0.6235294, 1,
-0.1576142, 1.93895, -0.5935947, 0, 1, 0.627451, 1,
-0.1471098, -0.5411727, -1.922775, 0, 1, 0.6352941, 1,
-0.1468646, 1.089905, 0.934162, 0, 1, 0.6392157, 1,
-0.1423928, 0.6228521, 1.29206, 0, 1, 0.6470588, 1,
-0.1387454, -1.295353, -3.562961, 0, 1, 0.6509804, 1,
-0.1367228, -1.29403, -4.013214, 0, 1, 0.6588235, 1,
-0.1349703, 0.7683862, -0.8775336, 0, 1, 0.6627451, 1,
-0.1343134, 0.2883264, -1.673206, 0, 1, 0.6705883, 1,
-0.1299006, 1.580431, -2.381395, 0, 1, 0.6745098, 1,
-0.1297746, 0.3992568, -0.4698772, 0, 1, 0.682353, 1,
-0.1208021, -0.2880649, -3.672729, 0, 1, 0.6862745, 1,
-0.1203949, 0.1617894, -0.8688133, 0, 1, 0.6941177, 1,
-0.1196129, -0.02789166, -2.470481, 0, 1, 0.7019608, 1,
-0.117929, -0.3630255, -2.033094, 0, 1, 0.7058824, 1,
-0.1175071, 0.2269125, -0.5475073, 0, 1, 0.7137255, 1,
-0.1164411, 0.8939478, 0.4403411, 0, 1, 0.7176471, 1,
-0.1161739, -0.152051, -3.876299, 0, 1, 0.7254902, 1,
-0.116092, -0.1537786, -1.324299, 0, 1, 0.7294118, 1,
-0.1111805, -0.3920298, -1.752299, 0, 1, 0.7372549, 1,
-0.103797, -0.2220189, -2.027913, 0, 1, 0.7411765, 1,
-0.1025832, 1.69682, -1.150213, 0, 1, 0.7490196, 1,
-0.1004414, -0.1241665, -3.558319, 0, 1, 0.7529412, 1,
-0.09949473, 1.209713, -0.1146266, 0, 1, 0.7607843, 1,
-0.09700055, -1.394766, -4.156628, 0, 1, 0.7647059, 1,
-0.09599311, 1.143802, -2.81086, 0, 1, 0.772549, 1,
-0.09481023, 1.006752, 0.1911823, 0, 1, 0.7764706, 1,
-0.09272766, -2.260028, -1.587525, 0, 1, 0.7843137, 1,
-0.08947168, -0.784793, -3.153587, 0, 1, 0.7882353, 1,
-0.08753012, 0.8225393, 0.1539973, 0, 1, 0.7960784, 1,
-0.08392517, -0.1997991, -2.181176, 0, 1, 0.8039216, 1,
-0.07766949, -1.106571, -3.290253, 0, 1, 0.8078431, 1,
-0.07588562, 1.441681, -0.8057541, 0, 1, 0.8156863, 1,
-0.07274593, -0.3359557, -3.653592, 0, 1, 0.8196079, 1,
-0.0706948, 0.01246911, -0.8842251, 0, 1, 0.827451, 1,
-0.07000812, -0.8557596, -4.208576, 0, 1, 0.8313726, 1,
-0.06021228, 0.6200914, -0.849391, 0, 1, 0.8392157, 1,
-0.056903, -0.8194806, -1.893916, 0, 1, 0.8431373, 1,
-0.05105897, 1.201962, -0.6021615, 0, 1, 0.8509804, 1,
-0.04601567, 1.74997, -0.7036293, 0, 1, 0.854902, 1,
-0.04569578, 0.2684373, -0.4947166, 0, 1, 0.8627451, 1,
-0.04391713, 0.892381, 0.6258373, 0, 1, 0.8666667, 1,
-0.04142883, 0.607281, -0.3971148, 0, 1, 0.8745098, 1,
-0.0408547, -1.391454, -2.948697, 0, 1, 0.8784314, 1,
-0.03573755, -0.7437662, -2.364397, 0, 1, 0.8862745, 1,
-0.03489679, 1.390355, -0.1546374, 0, 1, 0.8901961, 1,
-0.02659687, 0.03304215, -1.80128, 0, 1, 0.8980392, 1,
-0.02504997, -1.902288, -5.589674, 0, 1, 0.9058824, 1,
-0.02472462, 1.054668, -0.2614793, 0, 1, 0.9098039, 1,
-0.02168353, -0.9048483, -1.660676, 0, 1, 0.9176471, 1,
-0.02043807, -1.083699, -4.129629, 0, 1, 0.9215686, 1,
-0.01330686, -0.52841, -2.050852, 0, 1, 0.9294118, 1,
-0.01247971, -0.09325594, -3.607196, 0, 1, 0.9333333, 1,
-0.01154612, -0.9163114, -4.047823, 0, 1, 0.9411765, 1,
-0.01015553, 0.8295478, 0.645803, 0, 1, 0.945098, 1,
-0.008778733, -1.085501, -2.48011, 0, 1, 0.9529412, 1,
-0.008719448, 1.016907, -0.3536667, 0, 1, 0.9568627, 1,
-0.00305736, -1.006365, -3.661306, 0, 1, 0.9647059, 1,
0.002995475, 0.9273497, 0.2378935, 0, 1, 0.9686275, 1,
0.005407189, 0.2013032, 1.273198, 0, 1, 0.9764706, 1,
0.00619008, -1.803984, 3.311173, 0, 1, 0.9803922, 1,
0.008827055, 0.2753496, 2.181172, 0, 1, 0.9882353, 1,
0.009304553, 1.623415, -0.3380668, 0, 1, 0.9921569, 1,
0.01203465, -1.549765, 2.695801, 0, 1, 1, 1,
0.01294378, 1.887707, -0.325326, 0, 0.9921569, 1, 1,
0.01607346, -1.468234, 3.262949, 0, 0.9882353, 1, 1,
0.01684994, 1.609179, 0.9951246, 0, 0.9803922, 1, 1,
0.02275487, -0.6560665, 2.030051, 0, 0.9764706, 1, 1,
0.02556215, -0.4103854, 4.761804, 0, 0.9686275, 1, 1,
0.0268316, -1.310023, 1.878244, 0, 0.9647059, 1, 1,
0.02702507, -0.7739074, 2.328945, 0, 0.9568627, 1, 1,
0.03062439, 0.1352862, -0.8904761, 0, 0.9529412, 1, 1,
0.0331258, -0.9831181, 2.89769, 0, 0.945098, 1, 1,
0.03472738, -0.3076382, 3.165814, 0, 0.9411765, 1, 1,
0.0404321, -0.5346669, 3.411967, 0, 0.9333333, 1, 1,
0.04226705, -0.8164746, 3.807349, 0, 0.9294118, 1, 1,
0.04738904, -2.039578, 3.038274, 0, 0.9215686, 1, 1,
0.04933273, -0.2335307, 3.938759, 0, 0.9176471, 1, 1,
0.05111852, 0.4753108, -0.3156634, 0, 0.9098039, 1, 1,
0.05164981, -0.3037993, 3.244168, 0, 0.9058824, 1, 1,
0.05811249, 0.41377, -0.4421556, 0, 0.8980392, 1, 1,
0.05891768, -1.158387, 4.982853, 0, 0.8901961, 1, 1,
0.06013838, -1.037603, 0.5250325, 0, 0.8862745, 1, 1,
0.06931809, -0.4884163, 3.70057, 0, 0.8784314, 1, 1,
0.0719071, 0.7980183, 0.2685009, 0, 0.8745098, 1, 1,
0.07231259, 0.08617979, 0.501955, 0, 0.8666667, 1, 1,
0.07399523, 0.07496715, 2.112645, 0, 0.8627451, 1, 1,
0.07733683, -0.1202634, 1.788785, 0, 0.854902, 1, 1,
0.07781797, -1.532737, 3.287814, 0, 0.8509804, 1, 1,
0.07927928, -0.9265015, 2.777415, 0, 0.8431373, 1, 1,
0.08097189, -0.1127832, 1.67893, 0, 0.8392157, 1, 1,
0.08219457, 0.9945083, 0.5948493, 0, 0.8313726, 1, 1,
0.08576738, -1.470062, 2.398498, 0, 0.827451, 1, 1,
0.0869659, 0.909932, 0.6403577, 0, 0.8196079, 1, 1,
0.08866441, -0.1455507, 2.838564, 0, 0.8156863, 1, 1,
0.09072682, 0.4450966, -0.5860592, 0, 0.8078431, 1, 1,
0.09189373, 0.1595653, 0.1757036, 0, 0.8039216, 1, 1,
0.09228542, 0.2170206, 1.40859, 0, 0.7960784, 1, 1,
0.09329516, 0.8254749, -0.9031985, 0, 0.7882353, 1, 1,
0.09382775, 1.405677, 0.1825914, 0, 0.7843137, 1, 1,
0.09755698, -1.049726, 2.03913, 0, 0.7764706, 1, 1,
0.1038022, 0.7587852, 0.1209771, 0, 0.772549, 1, 1,
0.1045268, 0.4092623, -1.135693, 0, 0.7647059, 1, 1,
0.107011, 0.9314494, 0.3553957, 0, 0.7607843, 1, 1,
0.1086461, 0.2154046, 0.4368586, 0, 0.7529412, 1, 1,
0.1124153, 0.3299665, 0.4298435, 0, 0.7490196, 1, 1,
0.1131917, 2.309267, 0.5970991, 0, 0.7411765, 1, 1,
0.1144547, 1.030297, -0.07016679, 0, 0.7372549, 1, 1,
0.1163221, -1.541907, 3.463148, 0, 0.7294118, 1, 1,
0.1183922, -0.7619345, 2.886113, 0, 0.7254902, 1, 1,
0.1246852, 0.8031798, -1.691536, 0, 0.7176471, 1, 1,
0.1254759, 0.7608045, -0.9666931, 0, 0.7137255, 1, 1,
0.125927, 0.06460521, 0.1378965, 0, 0.7058824, 1, 1,
0.1268163, 1.462292, -0.1537188, 0, 0.6980392, 1, 1,
0.1272217, -0.6129831, 3.21282, 0, 0.6941177, 1, 1,
0.1291638, 0.2612103, -0.2150823, 0, 0.6862745, 1, 1,
0.1330184, -1.108136, 4.897331, 0, 0.682353, 1, 1,
0.1333915, -1.324947, 2.182503, 0, 0.6745098, 1, 1,
0.1363808, -0.1524788, 3.4, 0, 0.6705883, 1, 1,
0.1415078, -1.765832, 2.216924, 0, 0.6627451, 1, 1,
0.1484985, -1.051197, 3.45602, 0, 0.6588235, 1, 1,
0.1489698, 0.1907154, 1.802562, 0, 0.6509804, 1, 1,
0.1521073, -0.06446121, 1.488514, 0, 0.6470588, 1, 1,
0.1547602, -0.7489877, 4.098476, 0, 0.6392157, 1, 1,
0.1632779, -0.6862666, 3.05818, 0, 0.6352941, 1, 1,
0.1659819, 0.9107565, 0.4468844, 0, 0.627451, 1, 1,
0.169721, -0.2999178, 2.05947, 0, 0.6235294, 1, 1,
0.1726935, -0.5663789, 1.876941, 0, 0.6156863, 1, 1,
0.1728675, 1.706927, 0.6330217, 0, 0.6117647, 1, 1,
0.174562, 1.736977, 1.504561, 0, 0.6039216, 1, 1,
0.1750121, -0.09726418, 1.419888, 0, 0.5960785, 1, 1,
0.1779321, -0.8057914, 2.910645, 0, 0.5921569, 1, 1,
0.1837928, 0.1037207, 0.4217482, 0, 0.5843138, 1, 1,
0.1866225, 0.5699211, 1.386962, 0, 0.5803922, 1, 1,
0.1905539, -0.7385349, 2.37794, 0, 0.572549, 1, 1,
0.2007628, 1.330389, -0.1100055, 0, 0.5686275, 1, 1,
0.204111, 0.6737401, -0.3519213, 0, 0.5607843, 1, 1,
0.2194103, -1.242661, 1.649735, 0, 0.5568628, 1, 1,
0.2200142, -1.180762, 2.16885, 0, 0.5490196, 1, 1,
0.2242147, 1.163812, 0.08808496, 0, 0.5450981, 1, 1,
0.2267699, 0.759209, 1.238867, 0, 0.5372549, 1, 1,
0.231599, 1.473105, 0.05907313, 0, 0.5333334, 1, 1,
0.2318643, -0.2612872, 1.495989, 0, 0.5254902, 1, 1,
0.2349856, 1.19922, 0.3228989, 0, 0.5215687, 1, 1,
0.2374261, 1.462858, 1.948098, 0, 0.5137255, 1, 1,
0.2398776, 0.8207945, 1.553272, 0, 0.509804, 1, 1,
0.2433695, -1.79465, 3.914315, 0, 0.5019608, 1, 1,
0.2441936, 0.2360854, -0.1970915, 0, 0.4941176, 1, 1,
0.244484, -1.326521, 2.396557, 0, 0.4901961, 1, 1,
0.2453711, 0.5276364, 0.6853871, 0, 0.4823529, 1, 1,
0.2467623, -0.9821176, 2.263192, 0, 0.4784314, 1, 1,
0.2476564, -0.9810578, 3.066834, 0, 0.4705882, 1, 1,
0.2528298, 1.246359, 0.7610701, 0, 0.4666667, 1, 1,
0.2533759, -2.244705, 3.037425, 0, 0.4588235, 1, 1,
0.2545625, 0.3469115, -0.7067822, 0, 0.454902, 1, 1,
0.2555613, -0.9061108, 1.751271, 0, 0.4470588, 1, 1,
0.2562692, -0.7742324, 3.60906, 0, 0.4431373, 1, 1,
0.2571379, -0.3422931, 1.274399, 0, 0.4352941, 1, 1,
0.258266, 0.6514609, 0.2928925, 0, 0.4313726, 1, 1,
0.2625533, -0.287899, 2.741649, 0, 0.4235294, 1, 1,
0.2630819, 0.7910394, 0.41015, 0, 0.4196078, 1, 1,
0.2631136, -0.3075232, 3.653245, 0, 0.4117647, 1, 1,
0.2649026, 0.3161114, 0.8704093, 0, 0.4078431, 1, 1,
0.2654323, 2.358597, 0.2390815, 0, 0.4, 1, 1,
0.2662049, -1.340367, 2.772894, 0, 0.3921569, 1, 1,
0.268075, -0.3585543, 3.14464, 0, 0.3882353, 1, 1,
0.2694961, -0.06678367, 2.313097, 0, 0.3803922, 1, 1,
0.2789789, -0.8840373, 2.034947, 0, 0.3764706, 1, 1,
0.2809512, -0.1601686, 1.420196, 0, 0.3686275, 1, 1,
0.2843299, 0.4450421, 0.9446113, 0, 0.3647059, 1, 1,
0.2908561, -0.5528362, 2.963442, 0, 0.3568628, 1, 1,
0.2942975, -1.012798, 3.59049, 0, 0.3529412, 1, 1,
0.2973058, -1.046474, 1.818508, 0, 0.345098, 1, 1,
0.2991229, 0.3034969, 0.08115353, 0, 0.3411765, 1, 1,
0.2998716, -1.174362, 2.980381, 0, 0.3333333, 1, 1,
0.3015885, -0.7220569, 3.007507, 0, 0.3294118, 1, 1,
0.3028885, 0.9372692, 1.056767, 0, 0.3215686, 1, 1,
0.305841, -0.6936538, 0.9039408, 0, 0.3176471, 1, 1,
0.3065401, -1.291535, 3.846433, 0, 0.3098039, 1, 1,
0.3073325, -0.814223, 2.929091, 0, 0.3058824, 1, 1,
0.3099134, -0.5631741, 2.489219, 0, 0.2980392, 1, 1,
0.310287, -0.8824871, 2.20858, 0, 0.2901961, 1, 1,
0.314598, 0.09740639, 1.778615, 0, 0.2862745, 1, 1,
0.3150782, -0.5711483, 2.494488, 0, 0.2784314, 1, 1,
0.316613, -1.20928, 3.067375, 0, 0.2745098, 1, 1,
0.3172227, -2.298775, 0.6803131, 0, 0.2666667, 1, 1,
0.3195715, -1.351938, 3.111134, 0, 0.2627451, 1, 1,
0.3206384, -0.7993696, 4.064586, 0, 0.254902, 1, 1,
0.3237387, 0.4695144, -0.1250408, 0, 0.2509804, 1, 1,
0.3250362, -0.5058769, 1.367026, 0, 0.2431373, 1, 1,
0.3252952, 0.4029541, 2.015021, 0, 0.2392157, 1, 1,
0.326867, -0.4452455, 3.706342, 0, 0.2313726, 1, 1,
0.3281977, 1.290262, -2.585509, 0, 0.227451, 1, 1,
0.3294157, -1.158977, 2.948682, 0, 0.2196078, 1, 1,
0.332002, -0.8658695, 2.623865, 0, 0.2156863, 1, 1,
0.3383292, -0.7395732, 3.376481, 0, 0.2078431, 1, 1,
0.3396299, 0.2256456, 1.093341, 0, 0.2039216, 1, 1,
0.3399677, 0.05666057, 1.246376, 0, 0.1960784, 1, 1,
0.3420903, -0.5773312, 2.513206, 0, 0.1882353, 1, 1,
0.3441426, -0.9659579, 3.115027, 0, 0.1843137, 1, 1,
0.3485669, -1.215375, 2.88904, 0, 0.1764706, 1, 1,
0.3515286, 0.1766001, 1.039564, 0, 0.172549, 1, 1,
0.3541987, -0.6337239, 2.636438, 0, 0.1647059, 1, 1,
0.3555988, -0.9606703, 2.452311, 0, 0.1607843, 1, 1,
0.3573477, 0.6234909, 0.1888876, 0, 0.1529412, 1, 1,
0.3591865, 0.2404844, 0.425961, 0, 0.1490196, 1, 1,
0.3604777, 0.980495, 1.212392, 0, 0.1411765, 1, 1,
0.3660021, 0.5450666, -0.2891618, 0, 0.1372549, 1, 1,
0.3707148, 0.07470814, -0.6043935, 0, 0.1294118, 1, 1,
0.3732675, -1.026326, 3.639656, 0, 0.1254902, 1, 1,
0.375228, 0.6964199, 0.7837412, 0, 0.1176471, 1, 1,
0.3798009, 0.7324657, 0.202031, 0, 0.1137255, 1, 1,
0.3804369, -1.466587, 3.917873, 0, 0.1058824, 1, 1,
0.3817782, 1.320073, 0.7888281, 0, 0.09803922, 1, 1,
0.3830882, 0.5654981, 0.7531098, 0, 0.09411765, 1, 1,
0.3848489, -1.533227, 2.635993, 0, 0.08627451, 1, 1,
0.3877319, -0.6775586, 2.169352, 0, 0.08235294, 1, 1,
0.3878269, 0.2119315, 0.4734415, 0, 0.07450981, 1, 1,
0.3927161, -2.329657, 1.646713, 0, 0.07058824, 1, 1,
0.3946676, 0.01322784, 2.292122, 0, 0.0627451, 1, 1,
0.3948302, 0.1562894, 0.2279817, 0, 0.05882353, 1, 1,
0.3963373, -0.224778, 2.072727, 0, 0.05098039, 1, 1,
0.4033931, -1.69638, 4.056703, 0, 0.04705882, 1, 1,
0.4035433, 1.8824, 1.378764, 0, 0.03921569, 1, 1,
0.4087567, 1.660096, -0.7744674, 0, 0.03529412, 1, 1,
0.4187682, 0.6103216, -1.844426, 0, 0.02745098, 1, 1,
0.4203207, 0.1284271, 2.101921, 0, 0.02352941, 1, 1,
0.4203656, -0.110668, 3.136161, 0, 0.01568628, 1, 1,
0.4298097, 1.368376, -0.1502819, 0, 0.01176471, 1, 1,
0.433966, -0.2086093, 2.063864, 0, 0.003921569, 1, 1,
0.4360947, 1.54171, -0.526913, 0.003921569, 0, 1, 1,
0.4406479, 0.1121044, 0.9371912, 0.007843138, 0, 1, 1,
0.4463361, -0.2594419, 0.8976517, 0.01568628, 0, 1, 1,
0.4463506, 1.532803, 1.283191, 0.01960784, 0, 1, 1,
0.4474745, -0.8511154, 2.495679, 0.02745098, 0, 1, 1,
0.4533071, -0.1883115, 3.250119, 0.03137255, 0, 1, 1,
0.4551798, 0.5574354, -0.7010458, 0.03921569, 0, 1, 1,
0.4578155, -1.242761, 2.650069, 0.04313726, 0, 1, 1,
0.4591765, 0.6893364, -0.05159865, 0.05098039, 0, 1, 1,
0.46536, -0.7990376, 2.701638, 0.05490196, 0, 1, 1,
0.4660379, -1.943396, 1.88058, 0.0627451, 0, 1, 1,
0.4663864, -0.9516632, 2.04277, 0.06666667, 0, 1, 1,
0.4718654, 0.6623055, 0.4187268, 0.07450981, 0, 1, 1,
0.4722187, -1.589557, 3.187862, 0.07843138, 0, 1, 1,
0.4733381, -0.3739332, 0.6914816, 0.08627451, 0, 1, 1,
0.4735904, -0.2575499, 1.832862, 0.09019608, 0, 1, 1,
0.4748498, 0.9966893, 0.8130281, 0.09803922, 0, 1, 1,
0.4753495, -1.263212, 2.489175, 0.1058824, 0, 1, 1,
0.4766571, 0.5252537, 0.6502681, 0.1098039, 0, 1, 1,
0.4786004, -1.517471, 3.834381, 0.1176471, 0, 1, 1,
0.4797621, 0.6087035, 0.6516738, 0.1215686, 0, 1, 1,
0.4825341, 1.548224, -0.6206508, 0.1294118, 0, 1, 1,
0.4886931, 0.7821535, 0.7629113, 0.1333333, 0, 1, 1,
0.4894876, -0.7212296, 3.867613, 0.1411765, 0, 1, 1,
0.492402, 1.348083, -1.690918, 0.145098, 0, 1, 1,
0.4931895, -0.5429663, 1.795425, 0.1529412, 0, 1, 1,
0.4976673, 0.9764192, -0.5352358, 0.1568628, 0, 1, 1,
0.4999428, 0.4757099, -0.3435953, 0.1647059, 0, 1, 1,
0.5053366, 0.02314866, 1.970405, 0.1686275, 0, 1, 1,
0.5067114, -0.6182655, 3.215394, 0.1764706, 0, 1, 1,
0.5067781, -3.729176, 2.991737, 0.1803922, 0, 1, 1,
0.5076373, 0.2266962, 2.080415, 0.1882353, 0, 1, 1,
0.5165685, -1.204791, 3.832424, 0.1921569, 0, 1, 1,
0.5180253, 2.270568, -0.8914632, 0.2, 0, 1, 1,
0.5186824, -0.04713762, 2.250001, 0.2078431, 0, 1, 1,
0.5197856, 0.6278445, 0.3178051, 0.2117647, 0, 1, 1,
0.5214917, -1.423084, 4.668525, 0.2196078, 0, 1, 1,
0.5241536, 0.113093, 2.59687, 0.2235294, 0, 1, 1,
0.5278333, -0.4540526, 2.008812, 0.2313726, 0, 1, 1,
0.5295228, 0.5954772, 0.377836, 0.2352941, 0, 1, 1,
0.5305259, 0.1484828, 0.3924867, 0.2431373, 0, 1, 1,
0.5316442, 1.033852, -0.2232597, 0.2470588, 0, 1, 1,
0.5329102, 0.2011448, 1.384934, 0.254902, 0, 1, 1,
0.5352783, 0.5360145, 0.1037547, 0.2588235, 0, 1, 1,
0.5354386, 1.924343, -1.241156, 0.2666667, 0, 1, 1,
0.5408999, 0.394501, 2.861827, 0.2705882, 0, 1, 1,
0.5431732, 1.045495, 0.439486, 0.2784314, 0, 1, 1,
0.5434844, -2.01753, 3.870476, 0.282353, 0, 1, 1,
0.5457975, 0.4764776, 0.4997675, 0.2901961, 0, 1, 1,
0.5465672, -0.2847304, 2.714433, 0.2941177, 0, 1, 1,
0.548308, -1.188166, 3.421049, 0.3019608, 0, 1, 1,
0.5486147, -0.322592, -0.263133, 0.3098039, 0, 1, 1,
0.552334, 2.790427, 0.3423215, 0.3137255, 0, 1, 1,
0.5542318, -0.2350491, 0.5890648, 0.3215686, 0, 1, 1,
0.5577436, -0.6374694, 1.871109, 0.3254902, 0, 1, 1,
0.5629501, -0.08718271, 2.23887, 0.3333333, 0, 1, 1,
0.5651146, -2.25521, 2.114474, 0.3372549, 0, 1, 1,
0.5728708, 0.2889615, 0.214548, 0.345098, 0, 1, 1,
0.5767505, 0.7201393, 0.1587043, 0.3490196, 0, 1, 1,
0.5777318, -0.7535893, 2.995856, 0.3568628, 0, 1, 1,
0.5785801, -0.9068925, 3.846432, 0.3607843, 0, 1, 1,
0.5807623, 0.1595414, -0.1408894, 0.3686275, 0, 1, 1,
0.5820346, -0.464971, 2.186564, 0.372549, 0, 1, 1,
0.5822201, 1.307716, 0.1774318, 0.3803922, 0, 1, 1,
0.5824474, -1.360984, 2.999133, 0.3843137, 0, 1, 1,
0.5832008, -0.007094549, 1.088919, 0.3921569, 0, 1, 1,
0.5858755, 1.026192, 1.227232, 0.3960784, 0, 1, 1,
0.599267, 0.8450177, -1.047209, 0.4039216, 0, 1, 1,
0.6007464, -2.450077, 1.729833, 0.4117647, 0, 1, 1,
0.602699, 1.477813, -1.595924, 0.4156863, 0, 1, 1,
0.6102615, 0.9163764, 1.579616, 0.4235294, 0, 1, 1,
0.6115561, -0.056616, 0.795777, 0.427451, 0, 1, 1,
0.6123992, 0.554281, 1.538475, 0.4352941, 0, 1, 1,
0.6136916, 0.2753347, 3.318763, 0.4392157, 0, 1, 1,
0.6183383, 1.997715, 0.6575462, 0.4470588, 0, 1, 1,
0.6265395, 0.0148003, 0.9437005, 0.4509804, 0, 1, 1,
0.6275219, -1.985426, 3.755737, 0.4588235, 0, 1, 1,
0.6369271, -0.4184086, 2.767792, 0.4627451, 0, 1, 1,
0.6416739, -1.081874, 2.560936, 0.4705882, 0, 1, 1,
0.6450605, 0.8603782, 2.370867, 0.4745098, 0, 1, 1,
0.6460809, -0.8080744, 2.499547, 0.4823529, 0, 1, 1,
0.6499166, -0.3982614, 1.588579, 0.4862745, 0, 1, 1,
0.6515818, -0.0359174, 2.959845, 0.4941176, 0, 1, 1,
0.6521704, 1.311748, 0.7446123, 0.5019608, 0, 1, 1,
0.6524506, 2.34384, 0.592743, 0.5058824, 0, 1, 1,
0.6531796, 0.2340707, 1.513352, 0.5137255, 0, 1, 1,
0.6624178, -0.6347193, 1.95053, 0.5176471, 0, 1, 1,
0.6632687, 0.2301046, 1.876609, 0.5254902, 0, 1, 1,
0.6650572, 0.09290279, 2.483277, 0.5294118, 0, 1, 1,
0.6693207, -0.4840253, 1.701771, 0.5372549, 0, 1, 1,
0.6710039, 1.616428, 0.3013105, 0.5411765, 0, 1, 1,
0.6750476, 0.2268317, 3.450449, 0.5490196, 0, 1, 1,
0.6752563, 1.423138, 0.4016607, 0.5529412, 0, 1, 1,
0.6768593, -0.04475281, 1.212429, 0.5607843, 0, 1, 1,
0.6854798, -0.5259126, 1.855505, 0.5647059, 0, 1, 1,
0.6893537, -1.55991, 2.042955, 0.572549, 0, 1, 1,
0.6930586, 0.04394178, 2.337912, 0.5764706, 0, 1, 1,
0.6960467, -1.206279, 4.812402, 0.5843138, 0, 1, 1,
0.6990095, 1.078423, -1.212181, 0.5882353, 0, 1, 1,
0.6997029, 0.5121516, 1.792251, 0.5960785, 0, 1, 1,
0.7008731, -0.8086278, 3.370175, 0.6039216, 0, 1, 1,
0.7050683, -1.314868, 1.592558, 0.6078432, 0, 1, 1,
0.7073491, -1.453158, 3.379198, 0.6156863, 0, 1, 1,
0.7106861, -1.266555, 5.017952, 0.6196079, 0, 1, 1,
0.7170511, -1.507924, 3.299435, 0.627451, 0, 1, 1,
0.7205255, -0.5541294, 1.473005, 0.6313726, 0, 1, 1,
0.7281395, -0.6246176, 3.536524, 0.6392157, 0, 1, 1,
0.7326763, 0.6110715, 2.040488, 0.6431373, 0, 1, 1,
0.7361165, -1.335491, 4.617253, 0.6509804, 0, 1, 1,
0.7389238, -0.1886252, 0.6982411, 0.654902, 0, 1, 1,
0.7398622, -0.514309, 2.815917, 0.6627451, 0, 1, 1,
0.7501768, -0.2436851, 3.690502, 0.6666667, 0, 1, 1,
0.7502173, -0.620179, 2.49229, 0.6745098, 0, 1, 1,
0.7502238, 1.014219, 0.19208, 0.6784314, 0, 1, 1,
0.7546616, -0.3355038, 0.909454, 0.6862745, 0, 1, 1,
0.7547962, 0.585075, -0.04414354, 0.6901961, 0, 1, 1,
0.7604493, 0.9604107, 1.183411, 0.6980392, 0, 1, 1,
0.762326, -1.083154, 2.020192, 0.7058824, 0, 1, 1,
0.7627002, 0.8846844, 1.739475, 0.7098039, 0, 1, 1,
0.7657567, 0.08077981, 1.288231, 0.7176471, 0, 1, 1,
0.7707642, -1.287575, 2.939059, 0.7215686, 0, 1, 1,
0.7714393, -0.1304192, 1.370602, 0.7294118, 0, 1, 1,
0.7741058, -1.955691, 1.836497, 0.7333333, 0, 1, 1,
0.7817165, -0.01901051, 2.446317, 0.7411765, 0, 1, 1,
0.7825151, 1.70293, -0.6068059, 0.7450981, 0, 1, 1,
0.7876728, 0.5700125, -1.509933, 0.7529412, 0, 1, 1,
0.7895378, -1.886143, 2.137598, 0.7568628, 0, 1, 1,
0.7907876, -1.05438, 3.84321, 0.7647059, 0, 1, 1,
0.7924063, -0.07163132, 1.634018, 0.7686275, 0, 1, 1,
0.7947825, -0.7391258, 2.043735, 0.7764706, 0, 1, 1,
0.797508, 0.5844261, 0.6315528, 0.7803922, 0, 1, 1,
0.8008834, -0.7618669, 4.279186, 0.7882353, 0, 1, 1,
0.801542, 2.165194, 1.270056, 0.7921569, 0, 1, 1,
0.8058066, 1.426208, 1.683994, 0.8, 0, 1, 1,
0.8079345, 0.5385806, 1.848851, 0.8078431, 0, 1, 1,
0.8097566, -0.6567315, 4.117962, 0.8117647, 0, 1, 1,
0.8120351, -0.4214679, 3.881374, 0.8196079, 0, 1, 1,
0.8291853, 0.1277843, 0.6208645, 0.8235294, 0, 1, 1,
0.8432164, -0.7996055, 2.926843, 0.8313726, 0, 1, 1,
0.8534704, -1.434462, 3.059653, 0.8352941, 0, 1, 1,
0.8579077, 0.5591434, 2.6238, 0.8431373, 0, 1, 1,
0.8606816, 1.426468, 1.171871, 0.8470588, 0, 1, 1,
0.8615817, 0.6548675, 1.288461, 0.854902, 0, 1, 1,
0.8782114, 1.67721, 2.592331, 0.8588235, 0, 1, 1,
0.8786798, -1.256549, 2.567489, 0.8666667, 0, 1, 1,
0.8827729, 0.3034437, 1.587689, 0.8705882, 0, 1, 1,
0.8855106, -0.2156752, 1.995765, 0.8784314, 0, 1, 1,
0.8858809, -2.015724, 4.106597, 0.8823529, 0, 1, 1,
0.8881143, 0.5670788, 0.1288486, 0.8901961, 0, 1, 1,
0.8884802, 0.04367431, 2.336073, 0.8941177, 0, 1, 1,
0.9046857, 0.2316745, 2.145225, 0.9019608, 0, 1, 1,
0.9147661, -0.562422, 0.695801, 0.9098039, 0, 1, 1,
0.9196111, -0.4247304, 2.247355, 0.9137255, 0, 1, 1,
0.9293694, -2.200671, 2.957972, 0.9215686, 0, 1, 1,
0.9317867, -0.1622629, 1.807731, 0.9254902, 0, 1, 1,
0.9341773, -0.3846352, 4.359251, 0.9333333, 0, 1, 1,
0.9342023, -0.8804327, 3.248483, 0.9372549, 0, 1, 1,
0.9429425, -0.9054984, 2.509452, 0.945098, 0, 1, 1,
0.9492342, -0.3032624, 3.125065, 0.9490196, 0, 1, 1,
0.9507259, -0.3574815, 1.023807, 0.9568627, 0, 1, 1,
0.9514434, -0.5498624, 1.376922, 0.9607843, 0, 1, 1,
0.9578572, -1.484056, 2.645487, 0.9686275, 0, 1, 1,
0.9647239, 0.6570676, 1.643714, 0.972549, 0, 1, 1,
0.9647757, -0.1597064, 2.360633, 0.9803922, 0, 1, 1,
0.9670802, -0.9928735, 3.479744, 0.9843137, 0, 1, 1,
0.9717676, -0.8300042, 3.518955, 0.9921569, 0, 1, 1,
0.9801816, -0.5767222, 1.906068, 0.9960784, 0, 1, 1,
0.9830852, 1.481811, -0.2681421, 1, 0, 0.9960784, 1,
0.9868155, 0.9447963, -1.547789, 1, 0, 0.9882353, 1,
0.9876527, 0.2865301, -0.5236974, 1, 0, 0.9843137, 1,
0.9918958, -1.456621, 0.2504761, 1, 0, 0.9764706, 1,
0.992738, -0.2188652, 2.462143, 1, 0, 0.972549, 1,
0.9937791, -0.3056944, 1.457185, 1, 0, 0.9647059, 1,
0.9962621, -0.3794189, 1.867075, 1, 0, 0.9607843, 1,
0.9964364, 0.6401234, 1.26019, 1, 0, 0.9529412, 1,
1.010424, 1.390363, 2.870077, 1, 0, 0.9490196, 1,
1.012955, -0.2376234, 1.238793, 1, 0, 0.9411765, 1,
1.016058, 1.414466, 1.076366, 1, 0, 0.9372549, 1,
1.017965, -1.751837, 2.658784, 1, 0, 0.9294118, 1,
1.018172, -1.012315, 2.132493, 1, 0, 0.9254902, 1,
1.022378, -0.07930144, -0.04937743, 1, 0, 0.9176471, 1,
1.028277, -1.953175, 4.250835, 1, 0, 0.9137255, 1,
1.03184, -1.489755, 2.324439, 1, 0, 0.9058824, 1,
1.034584, 1.300288, -0.6954629, 1, 0, 0.9019608, 1,
1.040451, -0.4842779, 2.142583, 1, 0, 0.8941177, 1,
1.041589, 0.230703, 0.9989328, 1, 0, 0.8862745, 1,
1.053852, 2.021454, 1.974424, 1, 0, 0.8823529, 1,
1.054425, -0.0437476, 0.8806894, 1, 0, 0.8745098, 1,
1.062151, 0.981594, 1.553142, 1, 0, 0.8705882, 1,
1.065899, 0.2719319, -0.4868306, 1, 0, 0.8627451, 1,
1.068375, -0.9854199, 1.866818, 1, 0, 0.8588235, 1,
1.075503, 1.236679, -0.1042, 1, 0, 0.8509804, 1,
1.075714, -0.6456257, 0.6347172, 1, 0, 0.8470588, 1,
1.079412, -0.4051195, 2.071862, 1, 0, 0.8392157, 1,
1.08572, 1.514416, 2.532542, 1, 0, 0.8352941, 1,
1.087917, -0.6389903, 1.901642, 1, 0, 0.827451, 1,
1.111359, -0.2098808, -0.1124788, 1, 0, 0.8235294, 1,
1.118973, -0.8657954, 1.564932, 1, 0, 0.8156863, 1,
1.121064, 0.303643, 2.590129, 1, 0, 0.8117647, 1,
1.127661, -0.3230853, 0.7396258, 1, 0, 0.8039216, 1,
1.128543, -1.508343, 2.634629, 1, 0, 0.7960784, 1,
1.129248, 0.3126815, 1.382162, 1, 0, 0.7921569, 1,
1.132767, -0.147659, 2.138142, 1, 0, 0.7843137, 1,
1.133004, 1.329143, 1.75343, 1, 0, 0.7803922, 1,
1.133834, 1.648944, 0.8227749, 1, 0, 0.772549, 1,
1.158751, 2.855371, 0.776279, 1, 0, 0.7686275, 1,
1.160742, 0.5405437, 2.052305, 1, 0, 0.7607843, 1,
1.161698, 1.263567, 0.6675411, 1, 0, 0.7568628, 1,
1.165554, -2.034354, 1.722695, 1, 0, 0.7490196, 1,
1.188302, -0.34049, 0.5368053, 1, 0, 0.7450981, 1,
1.191628, 0.5313039, 0.8912615, 1, 0, 0.7372549, 1,
1.197432, 0.2060199, 0.05978338, 1, 0, 0.7333333, 1,
1.201384, -0.794656, 0.4701334, 1, 0, 0.7254902, 1,
1.203962, -0.5444085, 1.491385, 1, 0, 0.7215686, 1,
1.208304, 0.9962783, 1.14408, 1, 0, 0.7137255, 1,
1.212161, -0.8675419, 1.423624, 1, 0, 0.7098039, 1,
1.219222, -0.6017848, 2.307522, 1, 0, 0.7019608, 1,
1.223304, -1.305761, 5.425146, 1, 0, 0.6941177, 1,
1.224658, -1.741846, 3.26294, 1, 0, 0.6901961, 1,
1.249153, 0.5290639, 0.767334, 1, 0, 0.682353, 1,
1.250947, 1.187917, 2.334964, 1, 0, 0.6784314, 1,
1.259191, 0.8330349, 1.567747, 1, 0, 0.6705883, 1,
1.260388, 1.414966, 0.5885595, 1, 0, 0.6666667, 1,
1.277349, 0.7768416, 0.5853806, 1, 0, 0.6588235, 1,
1.278962, 0.572221, 2.73095, 1, 0, 0.654902, 1,
1.293864, 0.9634676, 0.1198141, 1, 0, 0.6470588, 1,
1.298507, -1.674428, 3.402074, 1, 0, 0.6431373, 1,
1.30687, -0.7128106, 1.545675, 1, 0, 0.6352941, 1,
1.309626, 1.654029, 2.543743, 1, 0, 0.6313726, 1,
1.317374, 0.1646466, 3.237235, 1, 0, 0.6235294, 1,
1.321918, 0.4794677, 3.783595, 1, 0, 0.6196079, 1,
1.326457, -0.6438954, 2.408434, 1, 0, 0.6117647, 1,
1.329217, 0.165039, 2.171365, 1, 0, 0.6078432, 1,
1.330115, 0.4243401, 0.07030504, 1, 0, 0.6, 1,
1.331059, -1.289428, 2.313007, 1, 0, 0.5921569, 1,
1.336157, 0.4455739, 0.9353829, 1, 0, 0.5882353, 1,
1.368496, 0.5718488, 1.001741, 1, 0, 0.5803922, 1,
1.371554, 0.6633076, 0.8111426, 1, 0, 0.5764706, 1,
1.379035, 1.855741, 1.047554, 1, 0, 0.5686275, 1,
1.379203, 0.7292259, -0.1600213, 1, 0, 0.5647059, 1,
1.381816, -0.2097699, 0.8431386, 1, 0, 0.5568628, 1,
1.389428, -0.2271387, 1.638281, 1, 0, 0.5529412, 1,
1.390336, 0.4273432, 0.5921891, 1, 0, 0.5450981, 1,
1.400545, 0.7848056, 2.571899, 1, 0, 0.5411765, 1,
1.410306, 1.363032, 3.796255, 1, 0, 0.5333334, 1,
1.417933, 0.6212565, 0.221273, 1, 0, 0.5294118, 1,
1.422951, 0.2149732, 0.9485399, 1, 0, 0.5215687, 1,
1.440062, -0.5979133, 0.5101306, 1, 0, 0.5176471, 1,
1.449696, -1.688881, 3.197545, 1, 0, 0.509804, 1,
1.451042, -2.757626, 1.921528, 1, 0, 0.5058824, 1,
1.45242, 0.5682741, 2.511413, 1, 0, 0.4980392, 1,
1.452564, 1.748327, -1.253003, 1, 0, 0.4901961, 1,
1.454025, -0.02876839, 3.490864, 1, 0, 0.4862745, 1,
1.455016, -1.838981, 2.365765, 1, 0, 0.4784314, 1,
1.464754, 1.242007, -0.4072312, 1, 0, 0.4745098, 1,
1.470399, 0.53316, 1.741267, 1, 0, 0.4666667, 1,
1.492922, -0.6116882, 2.004839, 1, 0, 0.4627451, 1,
1.493742, 0.2469676, 2.141109, 1, 0, 0.454902, 1,
1.494722, 0.8939189, 2.783055, 1, 0, 0.4509804, 1,
1.496484, -0.3356994, 2.015613, 1, 0, 0.4431373, 1,
1.497508, 0.2531026, 0.4498546, 1, 0, 0.4392157, 1,
1.498901, -2.11427, 4.093375, 1, 0, 0.4313726, 1,
1.503018, -0.5745213, 3.596632, 1, 0, 0.427451, 1,
1.503494, -0.7288985, 0.8353191, 1, 0, 0.4196078, 1,
1.513467, -1.04331, 2.616521, 1, 0, 0.4156863, 1,
1.514397, 0.4365615, 1.838199, 1, 0, 0.4078431, 1,
1.523332, 1.141095, 1.153321, 1, 0, 0.4039216, 1,
1.536656, -0.6398469, 3.246471, 1, 0, 0.3960784, 1,
1.537954, 1.266946, 1.292552, 1, 0, 0.3882353, 1,
1.541017, 1.241461, 2.182237, 1, 0, 0.3843137, 1,
1.559725, 0.6116097, 1.13115, 1, 0, 0.3764706, 1,
1.563192, -0.02004111, 1.340508, 1, 0, 0.372549, 1,
1.565273, -1.325458, 3.730618, 1, 0, 0.3647059, 1,
1.567822, -0.06061897, 1.374603, 1, 0, 0.3607843, 1,
1.569684, -0.01593193, 1.407308, 1, 0, 0.3529412, 1,
1.57442, 0.0494468, -0.8486789, 1, 0, 0.3490196, 1,
1.588411, 0.5458768, 1.824383, 1, 0, 0.3411765, 1,
1.589055, 1.22755, 1.777177, 1, 0, 0.3372549, 1,
1.623053, -0.6387851, 1.449756, 1, 0, 0.3294118, 1,
1.626805, -0.5075219, 1.907346, 1, 0, 0.3254902, 1,
1.642535, -0.3726338, 4.133886, 1, 0, 0.3176471, 1,
1.644812, 0.2603487, 2.929369, 1, 0, 0.3137255, 1,
1.64633, 0.5714948, 1.872417, 1, 0, 0.3058824, 1,
1.650167, -1.728498, 1.893225, 1, 0, 0.2980392, 1,
1.651604, 0.261212, 2.332643, 1, 0, 0.2941177, 1,
1.668579, -0.5559042, 2.909885, 1, 0, 0.2862745, 1,
1.682062, 1.076124, 1.011185, 1, 0, 0.282353, 1,
1.714028, -0.9183307, 1.648903, 1, 0, 0.2745098, 1,
1.715394, -0.6905413, 1.979706, 1, 0, 0.2705882, 1,
1.722382, -0.2958043, 1.845576, 1, 0, 0.2627451, 1,
1.743615, 1.70387, 1.163845, 1, 0, 0.2588235, 1,
1.754524, 0.81857, 0.9946599, 1, 0, 0.2509804, 1,
1.78354, -1.320653, 2.654337, 1, 0, 0.2470588, 1,
1.786132, 0.448931, 1.962146, 1, 0, 0.2392157, 1,
1.796317, -0.7054114, 2.49472, 1, 0, 0.2352941, 1,
1.800565, 1.621083, -0.3324044, 1, 0, 0.227451, 1,
1.819318, -1.69802, 3.27269, 1, 0, 0.2235294, 1,
1.834766, -1.149859, 1.384381, 1, 0, 0.2156863, 1,
1.84895, 1.721839, -0.5224414, 1, 0, 0.2117647, 1,
1.860274, 0.3735288, 2.762691, 1, 0, 0.2039216, 1,
1.860956, -0.7181116, 2.440191, 1, 0, 0.1960784, 1,
1.868614, 0.2663755, 3.10043, 1, 0, 0.1921569, 1,
1.882692, -0.08442083, 0.5576192, 1, 0, 0.1843137, 1,
1.898715, 0.9126751, 0.9961169, 1, 0, 0.1803922, 1,
1.913015, 1.484719, 1.368085, 1, 0, 0.172549, 1,
1.938286, 0.580461, 1.774393, 1, 0, 0.1686275, 1,
1.947457, 0.1617968, 1.031367, 1, 0, 0.1607843, 1,
1.950564, -0.3489094, 2.110085, 1, 0, 0.1568628, 1,
1.969541, 1.726419, 2.165087, 1, 0, 0.1490196, 1,
1.992457, -1.080346, 1.674933, 1, 0, 0.145098, 1,
2.002003, -1.133485, 3.046491, 1, 0, 0.1372549, 1,
2.009295, -0.6636815, 3.917149, 1, 0, 0.1333333, 1,
2.04575, 0.3507523, 3.939976, 1, 0, 0.1254902, 1,
2.060205, 0.4966496, 0.09385373, 1, 0, 0.1215686, 1,
2.082528, -0.5039915, 3.105175, 1, 0, 0.1137255, 1,
2.117222, -1.038754, 3.289999, 1, 0, 0.1098039, 1,
2.144185, -1.052696, 2.709416, 1, 0, 0.1019608, 1,
2.151832, 0.2447337, 2.294338, 1, 0, 0.09411765, 1,
2.153456, -0.8242212, 1.972508, 1, 0, 0.09019608, 1,
2.177128, 1.423811, 2.152028, 1, 0, 0.08235294, 1,
2.194921, -1.102646, 2.660293, 1, 0, 0.07843138, 1,
2.264556, 0.005746821, 1.267906, 1, 0, 0.07058824, 1,
2.307611, -0.5807706, 1.060978, 1, 0, 0.06666667, 1,
2.312183, -0.9848024, 1.414762, 1, 0, 0.05882353, 1,
2.433737, -0.2521123, 1.456774, 1, 0, 0.05490196, 1,
2.437072, 0.3673329, 0.8538783, 1, 0, 0.04705882, 1,
2.53121, 1.311108, 0.9309477, 1, 0, 0.04313726, 1,
2.569089, 0.6155375, 2.498103, 1, 0, 0.03529412, 1,
2.661657, -0.09603495, 1.955951, 1, 0, 0.03137255, 1,
2.878491, -0.3282028, 2.913215, 1, 0, 0.02352941, 1,
2.898247, 0.9043887, 0.1963499, 1, 0, 0.01960784, 1,
2.959003, 1.189725, 0.5526427, 1, 0, 0.01176471, 1,
3.106272, 0.6729546, 2.337408, 1, 0, 0.007843138, 1
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
0.2100283, -4.845257, -7.456686, 0, -0.5, 0.5, 0.5,
0.2100283, -4.845257, -7.456686, 1, -0.5, 0.5, 0.5,
0.2100283, -4.845257, -7.456686, 1, 1.5, 0.5, 0.5,
0.2100283, -4.845257, -7.456686, 0, 1.5, 0.5, 0.5
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
-3.668042, -0.4369024, -7.456686, 0, -0.5, 0.5, 0.5,
-3.668042, -0.4369024, -7.456686, 1, -0.5, 0.5, 0.5,
-3.668042, -0.4369024, -7.456686, 1, 1.5, 0.5, 0.5,
-3.668042, -0.4369024, -7.456686, 0, 1.5, 0.5, 0.5
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
-3.668042, -4.845257, -0.08226395, 0, -0.5, 0.5, 0.5,
-3.668042, -4.845257, -0.08226395, 1, -0.5, 0.5, 0.5,
-3.668042, -4.845257, -0.08226395, 1, 1.5, 0.5, 0.5,
-3.668042, -4.845257, -0.08226395, 0, 1.5, 0.5, 0.5
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
-2, -3.827945, -5.754896,
3, -3.827945, -5.754896,
-2, -3.827945, -5.754896,
-2, -3.997497, -6.038527,
-1, -3.827945, -5.754896,
-1, -3.997497, -6.038527,
0, -3.827945, -5.754896,
0, -3.997497, -6.038527,
1, -3.827945, -5.754896,
1, -3.997497, -6.038527,
2, -3.827945, -5.754896,
2, -3.997497, -6.038527,
3, -3.827945, -5.754896,
3, -3.997497, -6.038527
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
-2, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
-2, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
-2, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
-2, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5,
-1, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
-1, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
-1, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
-1, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5,
0, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
0, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
0, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
0, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5,
1, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
1, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
1, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
1, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5,
2, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
2, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
2, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
2, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5,
3, -4.336601, -6.605791, 0, -0.5, 0.5, 0.5,
3, -4.336601, -6.605791, 1, -0.5, 0.5, 0.5,
3, -4.336601, -6.605791, 1, 1.5, 0.5, 0.5,
3, -4.336601, -6.605791, 0, 1.5, 0.5, 0.5
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
-2.773103, -3, -5.754896,
-2.773103, 2, -5.754896,
-2.773103, -3, -5.754896,
-2.92226, -3, -6.038527,
-2.773103, -2, -5.754896,
-2.92226, -2, -6.038527,
-2.773103, -1, -5.754896,
-2.92226, -1, -6.038527,
-2.773103, 0, -5.754896,
-2.92226, 0, -6.038527,
-2.773103, 1, -5.754896,
-2.92226, 1, -6.038527,
-2.773103, 2, -5.754896,
-2.92226, 2, -6.038527
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
-3.220573, -3, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, -3, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, -3, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, -3, -6.605791, 0, 1.5, 0.5, 0.5,
-3.220573, -2, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, -2, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, -2, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, -2, -6.605791, 0, 1.5, 0.5, 0.5,
-3.220573, -1, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, -1, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, -1, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, -1, -6.605791, 0, 1.5, 0.5, 0.5,
-3.220573, 0, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, 0, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, 0, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, 0, -6.605791, 0, 1.5, 0.5, 0.5,
-3.220573, 1, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, 1, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, 1, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, 1, -6.605791, 0, 1.5, 0.5, 0.5,
-3.220573, 2, -6.605791, 0, -0.5, 0.5, 0.5,
-3.220573, 2, -6.605791, 1, -0.5, 0.5, 0.5,
-3.220573, 2, -6.605791, 1, 1.5, 0.5, 0.5,
-3.220573, 2, -6.605791, 0, 1.5, 0.5, 0.5
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
-2.773103, -3.827945, -4,
-2.773103, -3.827945, 4,
-2.773103, -3.827945, -4,
-2.92226, -3.997497, -4,
-2.773103, -3.827945, -2,
-2.92226, -3.997497, -2,
-2.773103, -3.827945, 0,
-2.92226, -3.997497, 0,
-2.773103, -3.827945, 2,
-2.92226, -3.997497, 2,
-2.773103, -3.827945, 4,
-2.92226, -3.997497, 4
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
-3.220573, -4.336601, -4, 0, -0.5, 0.5, 0.5,
-3.220573, -4.336601, -4, 1, -0.5, 0.5, 0.5,
-3.220573, -4.336601, -4, 1, 1.5, 0.5, 0.5,
-3.220573, -4.336601, -4, 0, 1.5, 0.5, 0.5,
-3.220573, -4.336601, -2, 0, -0.5, 0.5, 0.5,
-3.220573, -4.336601, -2, 1, -0.5, 0.5, 0.5,
-3.220573, -4.336601, -2, 1, 1.5, 0.5, 0.5,
-3.220573, -4.336601, -2, 0, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 0, 0, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 0, 1, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 0, 1, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 0, 0, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 2, 0, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 2, 1, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 2, 1, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 2, 0, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 4, 0, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 4, 1, -0.5, 0.5, 0.5,
-3.220573, -4.336601, 4, 1, 1.5, 0.5, 0.5,
-3.220573, -4.336601, 4, 0, 1.5, 0.5, 0.5
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
-2.773103, -3.827945, -5.754896,
-2.773103, 2.95414, -5.754896,
-2.773103, -3.827945, 5.590368,
-2.773103, 2.95414, 5.590368,
-2.773103, -3.827945, -5.754896,
-2.773103, -3.827945, 5.590368,
-2.773103, 2.95414, -5.754896,
-2.773103, 2.95414, 5.590368,
-2.773103, -3.827945, -5.754896,
3.19316, -3.827945, -5.754896,
-2.773103, -3.827945, 5.590368,
3.19316, -3.827945, 5.590368,
-2.773103, 2.95414, -5.754896,
3.19316, 2.95414, -5.754896,
-2.773103, 2.95414, 5.590368,
3.19316, 2.95414, 5.590368,
3.19316, -3.827945, -5.754896,
3.19316, 2.95414, -5.754896,
3.19316, -3.827945, 5.590368,
3.19316, 2.95414, 5.590368,
3.19316, -3.827945, -5.754896,
3.19316, -3.827945, 5.590368,
3.19316, 2.95414, -5.754896,
3.19316, 2.95414, 5.590368
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
var radius = 7.743786;
var distance = 34.45298;
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
mvMatrix.translate( -0.2100283, 0.4369024, 0.08226395 );
mvMatrix.scale( 1.403346, 1.234537, 0.7379937 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45298);
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
nicosulfuron<-read.table("nicosulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nicosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
y<-nicosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
z<-nicosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
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
-2.686216, 0.05032995, -3.310152, 0, 0, 1, 1, 1,
-2.56172, -0.07066509, -2.7731, 1, 0, 0, 1, 1,
-2.44089, 1.337882, -0.5618018, 1, 0, 0, 1, 1,
-2.401587, 0.4607814, -1.665855, 1, 0, 0, 1, 1,
-2.336847, 0.5764937, -0.004164915, 1, 0, 0, 1, 1,
-2.289785, -1.307078, -0.8339436, 1, 0, 0, 1, 1,
-2.247559, -0.2266661, -3.616844, 0, 0, 0, 1, 1,
-2.226301, 1.155473, -1.444554, 0, 0, 0, 1, 1,
-2.206333, -0.5715303, -1.317821, 0, 0, 0, 1, 1,
-2.119125, 1.097651, -4.582899, 0, 0, 0, 1, 1,
-2.035092, -0.374664, 0.2327271, 0, 0, 0, 1, 1,
-2.031404, -0.3611232, -0.6493477, 0, 0, 0, 1, 1,
-2.024147, -1.143043, -2.508677, 0, 0, 0, 1, 1,
-1.962302, -1.812924, -1.802301, 1, 1, 1, 1, 1,
-1.958071, -0.3462323, -1.084791, 1, 1, 1, 1, 1,
-1.9513, 1.383907, -1.002056, 1, 1, 1, 1, 1,
-1.937304, 0.9695043, -0.1776546, 1, 1, 1, 1, 1,
-1.933811, 2.061762, 0.08238431, 1, 1, 1, 1, 1,
-1.917593, 0.644974, -0.7953966, 1, 1, 1, 1, 1,
-1.895102, -0.1541632, -1.128865, 1, 1, 1, 1, 1,
-1.858976, -0.5817987, 0.822827, 1, 1, 1, 1, 1,
-1.846348, -1.202545, -2.443571, 1, 1, 1, 1, 1,
-1.827577, 0.8861165, -2.472132, 1, 1, 1, 1, 1,
-1.798459, 0.3365389, -2.511569, 1, 1, 1, 1, 1,
-1.792866, -0.1233124, -1.132327, 1, 1, 1, 1, 1,
-1.779712, 0.3506542, -2.062742, 1, 1, 1, 1, 1,
-1.776786, -0.7094062, -2.846489, 1, 1, 1, 1, 1,
-1.770748, 0.266089, -1.36933, 1, 1, 1, 1, 1,
-1.769047, 0.8833288, -0.3429675, 0, 0, 1, 1, 1,
-1.765052, 0.2802936, -0.8669615, 1, 0, 0, 1, 1,
-1.711178, 2.214997, -2.00649, 1, 0, 0, 1, 1,
-1.705718, 1.126294, 0.02395371, 1, 0, 0, 1, 1,
-1.698051, 0.05826803, -2.486393, 1, 0, 0, 1, 1,
-1.657367, -0.1176354, -0.3175963, 1, 0, 0, 1, 1,
-1.653197, -0.01905253, -3.579895, 0, 0, 0, 1, 1,
-1.628579, 0.6527466, -3.82602, 0, 0, 0, 1, 1,
-1.618971, 0.4719502, -1.946577, 0, 0, 0, 1, 1,
-1.609677, 0.7090521, -0.183363, 0, 0, 0, 1, 1,
-1.601628, -0.4543342, -1.988033, 0, 0, 0, 1, 1,
-1.580109, -0.2858675, -1.68505, 0, 0, 0, 1, 1,
-1.579505, -0.06241199, -0.2867337, 0, 0, 0, 1, 1,
-1.5709, -0.6694638, -0.838178, 1, 1, 1, 1, 1,
-1.570188, -0.026318, -2.293653, 1, 1, 1, 1, 1,
-1.537828, -0.3345058, -2.574612, 1, 1, 1, 1, 1,
-1.531081, 0.384574, -0.61751, 1, 1, 1, 1, 1,
-1.52767, 1.538349, -0.9151565, 1, 1, 1, 1, 1,
-1.527511, -1.647217, -1.380467, 1, 1, 1, 1, 1,
-1.520132, 0.3190047, -1.024918, 1, 1, 1, 1, 1,
-1.518809, -0.4765957, -1.07654, 1, 1, 1, 1, 1,
-1.508564, 0.6960281, -0.02716979, 1, 1, 1, 1, 1,
-1.478773, 0.3573555, -2.590103, 1, 1, 1, 1, 1,
-1.476332, -1.563669, -2.285082, 1, 1, 1, 1, 1,
-1.450861, -1.158173, -2.09825, 1, 1, 1, 1, 1,
-1.443344, 0.4564501, -0.9998189, 1, 1, 1, 1, 1,
-1.440729, -0.05879293, -1.838504, 1, 1, 1, 1, 1,
-1.403742, 1.928389, 1.219922, 1, 1, 1, 1, 1,
-1.403506, 0.2790184, -1.864052, 0, 0, 1, 1, 1,
-1.393246, 1.642862, -0.4826895, 1, 0, 0, 1, 1,
-1.392531, 0.5585189, -2.70176, 1, 0, 0, 1, 1,
-1.391074, 0.1732016, -1.37475, 1, 0, 0, 1, 1,
-1.365286, -1.237362, -4.900307, 1, 0, 0, 1, 1,
-1.356088, -0.5966126, -2.629105, 1, 0, 0, 1, 1,
-1.351609, -0.5341591, -1.006481, 0, 0, 0, 1, 1,
-1.35129, -0.8359604, -2.68813, 0, 0, 0, 1, 1,
-1.344736, -0.02218672, -1.279145, 0, 0, 0, 1, 1,
-1.333431, 0.4792004, -1.261562, 0, 0, 0, 1, 1,
-1.32989, -0.5245558, -1.630655, 0, 0, 0, 1, 1,
-1.324362, 2.392912, -0.6508816, 0, 0, 0, 1, 1,
-1.321876, 0.4468551, -0.9312127, 0, 0, 0, 1, 1,
-1.291276, 0.2054967, -2.041091, 1, 1, 1, 1, 1,
-1.286888, 0.4143336, 0.06155767, 1, 1, 1, 1, 1,
-1.280131, 0.3830844, -0.6796825, 1, 1, 1, 1, 1,
-1.277932, 0.9411969, 0.8277462, 1, 1, 1, 1, 1,
-1.270458, -0.8425376, -0.3699181, 1, 1, 1, 1, 1,
-1.266348, -1.323531, -2.239641, 1, 1, 1, 1, 1,
-1.25692, 1.319088, -1.914309, 1, 1, 1, 1, 1,
-1.25057, -0.2281759, -2.911158, 1, 1, 1, 1, 1,
-1.249329, 1.457254, -0.8289302, 1, 1, 1, 1, 1,
-1.240893, -0.3381962, -2.874488, 1, 1, 1, 1, 1,
-1.240227, 2.131265, -0.09215067, 1, 1, 1, 1, 1,
-1.234587, -0.8340859, -1.220738, 1, 1, 1, 1, 1,
-1.234196, -0.9688948, -2.950278, 1, 1, 1, 1, 1,
-1.231048, -0.1392536, -2.1651, 1, 1, 1, 1, 1,
-1.22181, 0.2677049, -1.918998, 1, 1, 1, 1, 1,
-1.218204, 0.7594922, -1.920458, 0, 0, 1, 1, 1,
-1.210025, -0.5854366, -3.115262, 1, 0, 0, 1, 1,
-1.186803, 0.04966684, -1.320784, 1, 0, 0, 1, 1,
-1.186599, -0.6719531, -3.574266, 1, 0, 0, 1, 1,
-1.179274, 0.243312, -1.445337, 1, 0, 0, 1, 1,
-1.170545, 1.439669, 0.1893456, 1, 0, 0, 1, 1,
-1.169217, 1.043421, -0.2805675, 0, 0, 0, 1, 1,
-1.166251, 0.4342271, -1.102823, 0, 0, 0, 1, 1,
-1.165146, 0.6365895, -1.530425, 0, 0, 0, 1, 1,
-1.164162, 1.165381, -0.8230872, 0, 0, 0, 1, 1,
-1.155686, 0.8411958, -0.2998783, 0, 0, 0, 1, 1,
-1.155164, -0.7351789, -0.3389159, 0, 0, 0, 1, 1,
-1.149132, 0.687278, -1.738033, 0, 0, 0, 1, 1,
-1.148434, 0.4249091, -1.37028, 1, 1, 1, 1, 1,
-1.142686, -1.843933, -2.043925, 1, 1, 1, 1, 1,
-1.14128, 1.019907, -1.591111, 1, 1, 1, 1, 1,
-1.140985, 1.577071, -0.7349163, 1, 1, 1, 1, 1,
-1.136097, -0.4155535, -2.60351, 1, 1, 1, 1, 1,
-1.121021, -0.190996, -3.191313, 1, 1, 1, 1, 1,
-1.099407, -0.7641611, -2.642587, 1, 1, 1, 1, 1,
-1.097416, -2.249853, -2.486833, 1, 1, 1, 1, 1,
-1.096604, 1.776364, -0.3315165, 1, 1, 1, 1, 1,
-1.089341, -1.325212, -3.555281, 1, 1, 1, 1, 1,
-1.083011, -0.1601546, 0.4752763, 1, 1, 1, 1, 1,
-1.07563, 0.3534182, -1.624127, 1, 1, 1, 1, 1,
-1.065264, -2.334799, -3.826459, 1, 1, 1, 1, 1,
-1.064643, -3.21556, -2.607331, 1, 1, 1, 1, 1,
-1.049717, -0.04670653, 0.05332244, 1, 1, 1, 1, 1,
-1.046441, 0.04199268, -0.2898219, 0, 0, 1, 1, 1,
-1.039077, -1.864199, -2.069789, 1, 0, 0, 1, 1,
-1.039064, -1.38082, -0.2368763, 1, 0, 0, 1, 1,
-1.038151, 0.6686218, -2.277314, 1, 0, 0, 1, 1,
-1.036752, -0.8813503, -2.225446, 1, 0, 0, 1, 1,
-1.021839, -0.249722, -0.8105506, 1, 0, 0, 1, 1,
-1.017012, -0.04811921, -1.6102, 0, 0, 0, 1, 1,
-1.014954, -0.8364756, -1.587076, 0, 0, 0, 1, 1,
-1.013666, -0.01933097, -2.330013, 0, 0, 0, 1, 1,
-1.01021, 0.4970097, -0.652084, 0, 0, 0, 1, 1,
-1.006779, 0.9913508, 1.865902, 0, 0, 0, 1, 1,
-1.004297, 1.057907, -1.262806, 0, 0, 0, 1, 1,
-1.003078, -0.4255743, -1.828403, 0, 0, 0, 1, 1,
-1.000758, 0.4446938, -1.16901, 1, 1, 1, 1, 1,
-0.993821, 2.667928, 0.06730964, 1, 1, 1, 1, 1,
-0.9890283, -0.7652626, -3.413719, 1, 1, 1, 1, 1,
-0.9841563, 0.1638869, -3.315651, 1, 1, 1, 1, 1,
-0.9829484, 0.4116451, -0.4693737, 1, 1, 1, 1, 1,
-0.9661377, 0.1848779, -2.702302, 1, 1, 1, 1, 1,
-0.9605115, 0.1321975, -0.6736493, 1, 1, 1, 1, 1,
-0.9561967, 1.066684, -0.4137339, 1, 1, 1, 1, 1,
-0.9554373, -0.1358554, -2.862591, 1, 1, 1, 1, 1,
-0.9550018, -1.270867, -2.018327, 1, 1, 1, 1, 1,
-0.9526473, -0.174163, -2.52042, 1, 1, 1, 1, 1,
-0.9480782, 2.093309, 0.405194, 1, 1, 1, 1, 1,
-0.9400443, -0.4354787, -0.04689407, 1, 1, 1, 1, 1,
-0.9373294, -1.565038, -1.893968, 1, 1, 1, 1, 1,
-0.9368022, -0.1027966, -3.551944, 1, 1, 1, 1, 1,
-0.9317318, -0.3478727, -2.509105, 0, 0, 1, 1, 1,
-0.9301977, 0.1167135, -1.291445, 1, 0, 0, 1, 1,
-0.9289514, 0.4902118, -0.2638229, 1, 0, 0, 1, 1,
-0.9289433, 0.7359366, -0.6339197, 1, 0, 0, 1, 1,
-0.9283759, -1.834349, -1.99509, 1, 0, 0, 1, 1,
-0.9206913, -0.5328113, -3.686734, 1, 0, 0, 1, 1,
-0.9182468, 0.8989581, -0.6942105, 0, 0, 0, 1, 1,
-0.9173901, -0.7852544, -2.163181, 0, 0, 0, 1, 1,
-0.9145794, 0.3522777, 0.012664, 0, 0, 0, 1, 1,
-0.9084833, -1.832999, -3.29093, 0, 0, 0, 1, 1,
-0.9064196, 1.329238, -0.4222517, 0, 0, 0, 1, 1,
-0.9031599, 0.3442007, -0.1465091, 0, 0, 0, 1, 1,
-0.8981665, 2.062607, -0.888591, 0, 0, 0, 1, 1,
-0.8924783, 0.5994698, -2.034995, 1, 1, 1, 1, 1,
-0.8910355, -0.5299506, -0.3283386, 1, 1, 1, 1, 1,
-0.8886696, 0.2501682, -0.5065939, 1, 1, 1, 1, 1,
-0.8741397, -1.345776, -1.037667, 1, 1, 1, 1, 1,
-0.8657634, -0.8207167, -1.247135, 1, 1, 1, 1, 1,
-0.8633071, -0.05858322, -1.932097, 1, 1, 1, 1, 1,
-0.8540097, -1.247229, -1.374189, 1, 1, 1, 1, 1,
-0.849071, 0.64423, -2.305994, 1, 1, 1, 1, 1,
-0.8485883, 0.1841051, -1.95425, 1, 1, 1, 1, 1,
-0.8462695, -1.003656, -3.191647, 1, 1, 1, 1, 1,
-0.8228756, 2.225786, 0.7233978, 1, 1, 1, 1, 1,
-0.822439, -1.430483, -2.483119, 1, 1, 1, 1, 1,
-0.817807, -2.172579, -2.063532, 1, 1, 1, 1, 1,
-0.8118695, 0.6831028, 0.299782, 1, 1, 1, 1, 1,
-0.8104049, -1.400593, -1.43688, 1, 1, 1, 1, 1,
-0.8056912, 1.089571, -0.9512733, 0, 0, 1, 1, 1,
-0.7995565, 1.416049, -0.9904298, 1, 0, 0, 1, 1,
-0.7984324, 0.78567, -1.051246, 1, 0, 0, 1, 1,
-0.7980382, 0.1554727, -2.044587, 1, 0, 0, 1, 1,
-0.7953163, 0.176773, -1.922493, 1, 0, 0, 1, 1,
-0.7942873, -1.641472, -2.158455, 1, 0, 0, 1, 1,
-0.7937981, -0.2285128, -0.8759242, 0, 0, 0, 1, 1,
-0.7884529, 1.791885, -1.102363, 0, 0, 0, 1, 1,
-0.7808521, -0.8099803, -4.468937, 0, 0, 0, 1, 1,
-0.7765215, 0.2139657, -0.933822, 0, 0, 0, 1, 1,
-0.7758948, 1.110912, -0.5043752, 0, 0, 0, 1, 1,
-0.7730987, 1.085342, -0.5096559, 0, 0, 0, 1, 1,
-0.7701415, -0.5352378, -3.158961, 0, 0, 0, 1, 1,
-0.7688437, 1.072354, -0.9897409, 1, 1, 1, 1, 1,
-0.7673002, -1.479243, -3.097947, 1, 1, 1, 1, 1,
-0.7672647, 1.492372, 0.2919835, 1, 1, 1, 1, 1,
-0.7666906, 0.0464895, -2.755356, 1, 1, 1, 1, 1,
-0.7617948, -0.9183126, -2.917844, 1, 1, 1, 1, 1,
-0.7596043, -0.4082872, -0.9340783, 1, 1, 1, 1, 1,
-0.759244, 1.264078, -1.473008, 1, 1, 1, 1, 1,
-0.7568159, 0.1243449, -1.92654, 1, 1, 1, 1, 1,
-0.7560856, 1.235574, 0.4606918, 1, 1, 1, 1, 1,
-0.7537897, 0.2146653, -1.374503, 1, 1, 1, 1, 1,
-0.7532817, -0.9824702, -3.899024, 1, 1, 1, 1, 1,
-0.7526766, -1.189864, -1.536332, 1, 1, 1, 1, 1,
-0.7513402, 0.3514875, -1.687664, 1, 1, 1, 1, 1,
-0.7480234, 0.3259301, 0.2669803, 1, 1, 1, 1, 1,
-0.7466395, -0.7593163, -3.226544, 1, 1, 1, 1, 1,
-0.7458404, 0.0538362, -2.640423, 0, 0, 1, 1, 1,
-0.744462, -0.8286778, -3.114619, 1, 0, 0, 1, 1,
-0.7441294, 2.137901, 1.026087, 1, 0, 0, 1, 1,
-0.7415823, -0.1389097, -1.320256, 1, 0, 0, 1, 1,
-0.7394555, -1.207083, -2.08384, 1, 0, 0, 1, 1,
-0.7383593, -2.555768, -4.014424, 1, 0, 0, 1, 1,
-0.7356799, 0.1847496, -1.238238, 0, 0, 0, 1, 1,
-0.7355179, 1.096078, 0.3565301, 0, 0, 0, 1, 1,
-0.7282103, 0.7079228, -2.485186, 0, 0, 0, 1, 1,
-0.725845, -2.670866, -3.939847, 0, 0, 0, 1, 1,
-0.7142155, 2.048841, -0.2540208, 0, 0, 0, 1, 1,
-0.7125053, -0.6322768, -1.934195, 0, 0, 0, 1, 1,
-0.7119273, -0.3462652, -1.958853, 0, 0, 0, 1, 1,
-0.7100645, 0.7944586, 1.123909, 1, 1, 1, 1, 1,
-0.7065307, 0.7654107, -1.706835, 1, 1, 1, 1, 1,
-0.7003496, 0.8301821, 0.2514076, 1, 1, 1, 1, 1,
-0.6988219, -0.4394383, -1.645072, 1, 1, 1, 1, 1,
-0.694952, -0.4371746, -1.66197, 1, 1, 1, 1, 1,
-0.6909038, 0.1329831, -0.7175043, 1, 1, 1, 1, 1,
-0.6908462, -0.297731, -2.691677, 1, 1, 1, 1, 1,
-0.6843333, 1.120825, -0.4790312, 1, 1, 1, 1, 1,
-0.6843106, -0.06663366, -2.057181, 1, 1, 1, 1, 1,
-0.6812446, 0.5020997, -2.513282, 1, 1, 1, 1, 1,
-0.6741961, -0.6762871, -0.645428, 1, 1, 1, 1, 1,
-0.6731969, -1.124283, -3.101421, 1, 1, 1, 1, 1,
-0.673178, -1.272682, -1.420134, 1, 1, 1, 1, 1,
-0.6720284, -0.7029172, -1.104371, 1, 1, 1, 1, 1,
-0.670109, 0.9982985, -1.047472, 1, 1, 1, 1, 1,
-0.6680642, 0.736232, -1.872544, 0, 0, 1, 1, 1,
-0.6657681, -0.4622192, -2.236954, 1, 0, 0, 1, 1,
-0.6657043, -0.7732849, -0.4714638, 1, 0, 0, 1, 1,
-0.6639617, 0.9901219, -2.177171, 1, 0, 0, 1, 1,
-0.6618707, -0.4084215, -1.088356, 1, 0, 0, 1, 1,
-0.657084, 1.874272, -1.416387, 1, 0, 0, 1, 1,
-0.656525, -1.697818, -2.932001, 0, 0, 0, 1, 1,
-0.6464897, 0.5918476, -0.8370431, 0, 0, 0, 1, 1,
-0.6451936, 0.9806169, -1.346882, 0, 0, 0, 1, 1,
-0.6447232, -0.6821794, -2.808084, 0, 0, 0, 1, 1,
-0.6409302, -0.5097184, -3.527185, 0, 0, 0, 1, 1,
-0.6387168, -2.013815, -2.180268, 0, 0, 0, 1, 1,
-0.638666, 0.5036806, -1.074109, 0, 0, 0, 1, 1,
-0.6380597, -2.067792, -2.097007, 1, 1, 1, 1, 1,
-0.6366352, 0.09551282, 1.017857, 1, 1, 1, 1, 1,
-0.6326899, -0.7500074, -2.204375, 1, 1, 1, 1, 1,
-0.6317387, -0.2596714, -2.19178, 1, 1, 1, 1, 1,
-0.6295972, -0.6877698, -3.049811, 1, 1, 1, 1, 1,
-0.6242183, -1.236519, -3.421686, 1, 1, 1, 1, 1,
-0.6211369, 0.5136391, -1.876981, 1, 1, 1, 1, 1,
-0.6161922, -0.2004301, -2.560729, 1, 1, 1, 1, 1,
-0.6161355, 1.13112, -0.1993561, 1, 1, 1, 1, 1,
-0.6149897, 0.4032264, -2.454587, 1, 1, 1, 1, 1,
-0.6145626, -1.457683, -2.101404, 1, 1, 1, 1, 1,
-0.6099557, -0.5320233, -2.677867, 1, 1, 1, 1, 1,
-0.6049649, -1.130616, -3.057503, 1, 1, 1, 1, 1,
-0.6047488, 1.134111, -0.1188444, 1, 1, 1, 1, 1,
-0.602695, 1.356313, -0.1709539, 1, 1, 1, 1, 1,
-0.6007065, 0.06951786, -1.45513, 0, 0, 1, 1, 1,
-0.5980099, 0.3020228, 0.02722205, 1, 0, 0, 1, 1,
-0.5963044, 0.3503352, -0.67493, 1, 0, 0, 1, 1,
-0.5958244, 1.197343, -0.8929067, 1, 0, 0, 1, 1,
-0.585528, -0.4076577, -3.033059, 1, 0, 0, 1, 1,
-0.580332, 0.1815878, -2.128237, 1, 0, 0, 1, 1,
-0.5776136, 0.6046348, -2.1992, 0, 0, 0, 1, 1,
-0.5762895, 0.612034, 2.29986, 0, 0, 0, 1, 1,
-0.573884, -0.07817835, -0.7806296, 0, 0, 0, 1, 1,
-0.572547, 0.1192902, -1.395535, 0, 0, 0, 1, 1,
-0.5725289, -0.9533181, -3.050372, 0, 0, 0, 1, 1,
-0.568934, 2.353632, -1.437191, 0, 0, 0, 1, 1,
-0.5651739, 0.742875, -1.507369, 0, 0, 0, 1, 1,
-0.561794, 0.07887608, -1.999575, 1, 1, 1, 1, 1,
-0.5612339, 0.06301633, -1.982128, 1, 1, 1, 1, 1,
-0.5604079, -0.3013349, -1.090724, 1, 1, 1, 1, 1,
-0.5579383, 1.404121, 0.2398147, 1, 1, 1, 1, 1,
-0.5569561, -0.7240732, -1.929865, 1, 1, 1, 1, 1,
-0.5557491, 0.600296, -1.275095, 1, 1, 1, 1, 1,
-0.5531228, 0.2172893, -0.7122531, 1, 1, 1, 1, 1,
-0.5517098, 0.1627037, -2.105911, 1, 1, 1, 1, 1,
-0.5499413, 2.152818, 0.1909454, 1, 1, 1, 1, 1,
-0.5487542, 1.602978, -2.37158, 1, 1, 1, 1, 1,
-0.5466162, -0.5225308, -2.305798, 1, 1, 1, 1, 1,
-0.5457549, 0.3221096, -2.4089, 1, 1, 1, 1, 1,
-0.5441163, 0.5078852, -0.4075456, 1, 1, 1, 1, 1,
-0.5418739, 0.4268559, -0.6498119, 1, 1, 1, 1, 1,
-0.5404177, 0.7202718, -0.6484591, 1, 1, 1, 1, 1,
-0.5338977, 1.845222, -0.760305, 0, 0, 1, 1, 1,
-0.5315391, 0.2642707, -3.114567, 1, 0, 0, 1, 1,
-0.5300362, 0.8199409, -1.378478, 1, 0, 0, 1, 1,
-0.5298666, 0.829787, -1.893765, 1, 0, 0, 1, 1,
-0.5289703, 0.08090846, -0.5733258, 1, 0, 0, 1, 1,
-0.52055, 0.9506429, -0.6169629, 1, 0, 0, 1, 1,
-0.5164938, 1.297328, -0.501709, 0, 0, 0, 1, 1,
-0.5155532, 0.4913048, -1.862603, 0, 0, 0, 1, 1,
-0.5120651, 1.885296, -0.3211167, 0, 0, 0, 1, 1,
-0.5115532, -0.6048111, -0.9479822, 0, 0, 0, 1, 1,
-0.5103241, -0.6580176, -1.968799, 0, 0, 0, 1, 1,
-0.5070904, -0.6824971, -2.092873, 0, 0, 0, 1, 1,
-0.5061003, 0.950518, -0.3979607, 0, 0, 0, 1, 1,
-0.5059774, 0.6978087, -0.3430592, 1, 1, 1, 1, 1,
-0.5047569, 1.188154, -1.388189, 1, 1, 1, 1, 1,
-0.5019219, -0.5299477, -1.991589, 1, 1, 1, 1, 1,
-0.4947129, 0.144294, -0.4410447, 1, 1, 1, 1, 1,
-0.4925208, -3.547005, -2.068139, 1, 1, 1, 1, 1,
-0.4887602, 1.064919, -0.708897, 1, 1, 1, 1, 1,
-0.4881655, -0.3235723, -1.826063, 1, 1, 1, 1, 1,
-0.4847621, -0.9303554, -2.740628, 1, 1, 1, 1, 1,
-0.4845027, -1.438673, -3.256673, 1, 1, 1, 1, 1,
-0.4805813, -0.6712225, -2.781983, 1, 1, 1, 1, 1,
-0.478742, 0.2120366, -2.440162, 1, 1, 1, 1, 1,
-0.4782649, 0.5989302, 1.251474, 1, 1, 1, 1, 1,
-0.474957, -1.194093, -3.222401, 1, 1, 1, 1, 1,
-0.472899, 0.1320101, -0.7931948, 1, 1, 1, 1, 1,
-0.4713327, -0.3162696, -3.092843, 1, 1, 1, 1, 1,
-0.4711685, 0.7244698, -0.9939235, 0, 0, 1, 1, 1,
-0.4710696, -1.433439, -2.556592, 1, 0, 0, 1, 1,
-0.4709641, 0.03199845, -2.238577, 1, 0, 0, 1, 1,
-0.4686159, -1.141775, -2.233843, 1, 0, 0, 1, 1,
-0.4677932, -0.7490811, -3.309053, 1, 0, 0, 1, 1,
-0.4653133, -0.4818416, -2.304701, 1, 0, 0, 1, 1,
-0.46454, -1.740489, -2.295964, 0, 0, 0, 1, 1,
-0.4615803, -0.04666015, -0.02143505, 0, 0, 0, 1, 1,
-0.4608974, 0.8645287, 1.46157, 0, 0, 0, 1, 1,
-0.4601963, -0.07507191, -2.402299, 0, 0, 0, 1, 1,
-0.455453, -0.8606637, -2.403977, 0, 0, 0, 1, 1,
-0.4494118, 1.638507, -0.3483618, 0, 0, 0, 1, 1,
-0.4485665, -1.033406, -2.472309, 0, 0, 0, 1, 1,
-0.4417357, 0.3499755, -1.51953, 1, 1, 1, 1, 1,
-0.4326283, 1.992931, -0.8485944, 1, 1, 1, 1, 1,
-0.4308742, -0.8746471, -3.747072, 1, 1, 1, 1, 1,
-0.4273873, -0.1249483, -1.122369, 1, 1, 1, 1, 1,
-0.4270246, 1.250608, -1.835278, 1, 1, 1, 1, 1,
-0.4196909, 1.09456, -0.6694458, 1, 1, 1, 1, 1,
-0.4178059, -0.7946106, -1.814895, 1, 1, 1, 1, 1,
-0.4164168, -0.7267395, -2.315311, 1, 1, 1, 1, 1,
-0.4163052, 0.4543639, 0.2011392, 1, 1, 1, 1, 1,
-0.4116217, -0.7513514, -3.683702, 1, 1, 1, 1, 1,
-0.4075455, -1.916095, -3.386207, 1, 1, 1, 1, 1,
-0.4020883, 0.4686087, -0.4811942, 1, 1, 1, 1, 1,
-0.4020281, 1.601288, -0.6126187, 1, 1, 1, 1, 1,
-0.4017645, 0.9700719, 0.07388056, 1, 1, 1, 1, 1,
-0.4014083, -1.419206, -5.458108, 1, 1, 1, 1, 1,
-0.3977751, 1.710608, -0.3000876, 0, 0, 1, 1, 1,
-0.3908954, -0.3254151, -2.564667, 1, 0, 0, 1, 1,
-0.3888495, 1.058218, 0.3347328, 1, 0, 0, 1, 1,
-0.3886573, -0.06799625, -1.333296, 1, 0, 0, 1, 1,
-0.3868603, -0.2773947, -2.192602, 1, 0, 0, 1, 1,
-0.385902, -0.06058335, -2.529628, 1, 0, 0, 1, 1,
-0.3854586, 0.3225585, -0.5948886, 0, 0, 0, 1, 1,
-0.3839083, -0.274876, -0.8166503, 0, 0, 0, 1, 1,
-0.3816637, 0.6803342, -0.2134541, 0, 0, 0, 1, 1,
-0.3797595, 0.2218121, -0.4438118, 0, 0, 0, 1, 1,
-0.378473, 0.8810353, -0.2449537, 0, 0, 0, 1, 1,
-0.3764399, 1.958626, 0.5259376, 0, 0, 0, 1, 1,
-0.3722018, 0.2115168, -1.699634, 0, 0, 0, 1, 1,
-0.3685419, 0.2189656, -0.1077658, 1, 1, 1, 1, 1,
-0.3684805, -1.803666, -4.435629, 1, 1, 1, 1, 1,
-0.3645129, 0.131682, 0.07733704, 1, 1, 1, 1, 1,
-0.3637848, 0.8058013, -1.665702, 1, 1, 1, 1, 1,
-0.3630873, -0.7651227, -4.125119, 1, 1, 1, 1, 1,
-0.3562559, -0.9142221, -1.482808, 1, 1, 1, 1, 1,
-0.3558899, -0.06126022, -2.014477, 1, 1, 1, 1, 1,
-0.3547992, -0.3362207, -3.09892, 1, 1, 1, 1, 1,
-0.3538411, 0.5953282, -0.4783505, 1, 1, 1, 1, 1,
-0.3466133, 1.190495, -0.08343441, 1, 1, 1, 1, 1,
-0.3451415, -1.873127, -3.303744, 1, 1, 1, 1, 1,
-0.3445054, 0.6819954, 1.078613, 1, 1, 1, 1, 1,
-0.3405611, 0.9908159, -0.3343307, 1, 1, 1, 1, 1,
-0.333451, 0.1604031, 0.03650948, 1, 1, 1, 1, 1,
-0.3328797, 0.02038438, -2.478095, 1, 1, 1, 1, 1,
-0.3269927, 0.9295768, -0.9202924, 0, 0, 1, 1, 1,
-0.3173425, -0.5321373, -3.107202, 1, 0, 0, 1, 1,
-0.3096467, -0.2273942, -3.181156, 1, 0, 0, 1, 1,
-0.3096358, 1.626534, -1.039783, 1, 0, 0, 1, 1,
-0.3083354, -0.6781952, -2.381093, 1, 0, 0, 1, 1,
-0.3023597, -0.5839642, -3.551233, 1, 0, 0, 1, 1,
-0.3003739, 0.9074245, 0.3800533, 0, 0, 0, 1, 1,
-0.3000745, -0.7733202, -3.87907, 0, 0, 0, 1, 1,
-0.3000333, 0.6994869, -0.7321272, 0, 0, 0, 1, 1,
-0.2999787, -0.9738426, -2.280627, 0, 0, 0, 1, 1,
-0.2993939, -0.950053, -2.466447, 0, 0, 0, 1, 1,
-0.298972, 0.6248878, -1.037252, 0, 0, 0, 1, 1,
-0.2962218, -0.6085459, -1.467966, 0, 0, 0, 1, 1,
-0.2958697, -0.2295845, -1.819357, 1, 1, 1, 1, 1,
-0.2955394, 0.2882136, -1.785851, 1, 1, 1, 1, 1,
-0.2942522, 1.211931, -1.146572, 1, 1, 1, 1, 1,
-0.2934792, -0.2771872, -1.656005, 1, 1, 1, 1, 1,
-0.2923464, 1.91033, 0.8755715, 1, 1, 1, 1, 1,
-0.2909861, 0.7789342, 1.329064, 1, 1, 1, 1, 1,
-0.2830805, -0.4510882, -2.567548, 1, 1, 1, 1, 1,
-0.2817516, 1.796205, -1.334092, 1, 1, 1, 1, 1,
-0.2799504, 1.77969, -0.6709703, 1, 1, 1, 1, 1,
-0.27994, 1.455033, -0.5732177, 1, 1, 1, 1, 1,
-0.2795624, 0.7659121, 1.601919, 1, 1, 1, 1, 1,
-0.2780377, -0.5143251, -2.876438, 1, 1, 1, 1, 1,
-0.2777784, -0.8606231, -3.633389, 1, 1, 1, 1, 1,
-0.2776181, -1.421994, -0.9914364, 1, 1, 1, 1, 1,
-0.276989, -0.1654747, -1.237607, 1, 1, 1, 1, 1,
-0.2736322, -0.09798919, -1.906388, 0, 0, 1, 1, 1,
-0.2709314, -0.5054225, -1.947508, 1, 0, 0, 1, 1,
-0.2699945, -1.904004, -2.486412, 1, 0, 0, 1, 1,
-0.267095, 1.749098, 0.433038, 1, 0, 0, 1, 1,
-0.2637082, -0.5616653, -2.673473, 1, 0, 0, 1, 1,
-0.2609169, 1.885354, 0.2451908, 1, 0, 0, 1, 1,
-0.2581712, 0.5839936, 2.019547, 0, 0, 0, 1, 1,
-0.2580449, 0.1169647, -1.146569, 0, 0, 0, 1, 1,
-0.2576528, 1.171208, -1.101295, 0, 0, 0, 1, 1,
-0.2493237, 0.07426579, -1.831966, 0, 0, 0, 1, 1,
-0.2490351, 1.428303, 0.4852582, 0, 0, 0, 1, 1,
-0.2479935, -0.2927784, -2.644825, 0, 0, 0, 1, 1,
-0.2465133, 1.188272, 0.5428436, 0, 0, 0, 1, 1,
-0.2455612, -0.408705, -5.024518, 1, 1, 1, 1, 1,
-0.2445633, 0.4992442, -1.042018, 1, 1, 1, 1, 1,
-0.2444754, 0.1336295, -0.5895886, 1, 1, 1, 1, 1,
-0.2343292, 0.3943777, -0.8906406, 1, 1, 1, 1, 1,
-0.2337983, -0.6954888, -2.339485, 1, 1, 1, 1, 1,
-0.2299032, -0.9171353, -2.99518, 1, 1, 1, 1, 1,
-0.2236635, -0.03919506, -1.663883, 1, 1, 1, 1, 1,
-0.2236565, -0.2412034, -2.561115, 1, 1, 1, 1, 1,
-0.2218146, 0.2240715, 0.9124288, 1, 1, 1, 1, 1,
-0.2185953, 0.8632765, -0.2274481, 1, 1, 1, 1, 1,
-0.2178181, -0.5896752, -2.724152, 1, 1, 1, 1, 1,
-0.2166645, -1.174708, -3.988571, 1, 1, 1, 1, 1,
-0.2146491, 2.128392, 0.2688903, 1, 1, 1, 1, 1,
-0.2126653, 0.6252528, 0.0224432, 1, 1, 1, 1, 1,
-0.2096847, 0.4727057, 0.6166603, 1, 1, 1, 1, 1,
-0.2095691, -0.7049763, -2.635347, 0, 0, 1, 1, 1,
-0.2084468, -0.1374052, -1.743131, 1, 0, 0, 1, 1,
-0.2063778, -1.724279, -3.597994, 1, 0, 0, 1, 1,
-0.2062511, 0.1471622, -1.764298, 1, 0, 0, 1, 1,
-0.2021272, -0.8361169, -4.203385, 1, 0, 0, 1, 1,
-0.1932852, 0.7793078, 0.6896118, 1, 0, 0, 1, 1,
-0.1905083, -0.3936086, -3.19418, 0, 0, 0, 1, 1,
-0.1896384, 1.863643, -1.162579, 0, 0, 0, 1, 1,
-0.1860851, -0.272439, -2.506802, 0, 0, 0, 1, 1,
-0.1818644, 0.2237992, -0.298265, 0, 0, 0, 1, 1,
-0.1743132, -1.092685, -3.054199, 0, 0, 0, 1, 1,
-0.1684971, 0.1645301, -0.5136858, 0, 0, 0, 1, 1,
-0.1679576, -0.3778436, -3.394834, 0, 0, 0, 1, 1,
-0.1663442, 1.513313, 0.7294517, 1, 1, 1, 1, 1,
-0.1659615, -0.4282397, -3.6154, 1, 1, 1, 1, 1,
-0.1626658, 1.027837, -0.1909483, 1, 1, 1, 1, 1,
-0.1594518, 0.5033987, -0.316987, 1, 1, 1, 1, 1,
-0.1588245, 0.4899896, -0.6370043, 1, 1, 1, 1, 1,
-0.1576142, 1.93895, -0.5935947, 1, 1, 1, 1, 1,
-0.1471098, -0.5411727, -1.922775, 1, 1, 1, 1, 1,
-0.1468646, 1.089905, 0.934162, 1, 1, 1, 1, 1,
-0.1423928, 0.6228521, 1.29206, 1, 1, 1, 1, 1,
-0.1387454, -1.295353, -3.562961, 1, 1, 1, 1, 1,
-0.1367228, -1.29403, -4.013214, 1, 1, 1, 1, 1,
-0.1349703, 0.7683862, -0.8775336, 1, 1, 1, 1, 1,
-0.1343134, 0.2883264, -1.673206, 1, 1, 1, 1, 1,
-0.1299006, 1.580431, -2.381395, 1, 1, 1, 1, 1,
-0.1297746, 0.3992568, -0.4698772, 1, 1, 1, 1, 1,
-0.1208021, -0.2880649, -3.672729, 0, 0, 1, 1, 1,
-0.1203949, 0.1617894, -0.8688133, 1, 0, 0, 1, 1,
-0.1196129, -0.02789166, -2.470481, 1, 0, 0, 1, 1,
-0.117929, -0.3630255, -2.033094, 1, 0, 0, 1, 1,
-0.1175071, 0.2269125, -0.5475073, 1, 0, 0, 1, 1,
-0.1164411, 0.8939478, 0.4403411, 1, 0, 0, 1, 1,
-0.1161739, -0.152051, -3.876299, 0, 0, 0, 1, 1,
-0.116092, -0.1537786, -1.324299, 0, 0, 0, 1, 1,
-0.1111805, -0.3920298, -1.752299, 0, 0, 0, 1, 1,
-0.103797, -0.2220189, -2.027913, 0, 0, 0, 1, 1,
-0.1025832, 1.69682, -1.150213, 0, 0, 0, 1, 1,
-0.1004414, -0.1241665, -3.558319, 0, 0, 0, 1, 1,
-0.09949473, 1.209713, -0.1146266, 0, 0, 0, 1, 1,
-0.09700055, -1.394766, -4.156628, 1, 1, 1, 1, 1,
-0.09599311, 1.143802, -2.81086, 1, 1, 1, 1, 1,
-0.09481023, 1.006752, 0.1911823, 1, 1, 1, 1, 1,
-0.09272766, -2.260028, -1.587525, 1, 1, 1, 1, 1,
-0.08947168, -0.784793, -3.153587, 1, 1, 1, 1, 1,
-0.08753012, 0.8225393, 0.1539973, 1, 1, 1, 1, 1,
-0.08392517, -0.1997991, -2.181176, 1, 1, 1, 1, 1,
-0.07766949, -1.106571, -3.290253, 1, 1, 1, 1, 1,
-0.07588562, 1.441681, -0.8057541, 1, 1, 1, 1, 1,
-0.07274593, -0.3359557, -3.653592, 1, 1, 1, 1, 1,
-0.0706948, 0.01246911, -0.8842251, 1, 1, 1, 1, 1,
-0.07000812, -0.8557596, -4.208576, 1, 1, 1, 1, 1,
-0.06021228, 0.6200914, -0.849391, 1, 1, 1, 1, 1,
-0.056903, -0.8194806, -1.893916, 1, 1, 1, 1, 1,
-0.05105897, 1.201962, -0.6021615, 1, 1, 1, 1, 1,
-0.04601567, 1.74997, -0.7036293, 0, 0, 1, 1, 1,
-0.04569578, 0.2684373, -0.4947166, 1, 0, 0, 1, 1,
-0.04391713, 0.892381, 0.6258373, 1, 0, 0, 1, 1,
-0.04142883, 0.607281, -0.3971148, 1, 0, 0, 1, 1,
-0.0408547, -1.391454, -2.948697, 1, 0, 0, 1, 1,
-0.03573755, -0.7437662, -2.364397, 1, 0, 0, 1, 1,
-0.03489679, 1.390355, -0.1546374, 0, 0, 0, 1, 1,
-0.02659687, 0.03304215, -1.80128, 0, 0, 0, 1, 1,
-0.02504997, -1.902288, -5.589674, 0, 0, 0, 1, 1,
-0.02472462, 1.054668, -0.2614793, 0, 0, 0, 1, 1,
-0.02168353, -0.9048483, -1.660676, 0, 0, 0, 1, 1,
-0.02043807, -1.083699, -4.129629, 0, 0, 0, 1, 1,
-0.01330686, -0.52841, -2.050852, 0, 0, 0, 1, 1,
-0.01247971, -0.09325594, -3.607196, 1, 1, 1, 1, 1,
-0.01154612, -0.9163114, -4.047823, 1, 1, 1, 1, 1,
-0.01015553, 0.8295478, 0.645803, 1, 1, 1, 1, 1,
-0.008778733, -1.085501, -2.48011, 1, 1, 1, 1, 1,
-0.008719448, 1.016907, -0.3536667, 1, 1, 1, 1, 1,
-0.00305736, -1.006365, -3.661306, 1, 1, 1, 1, 1,
0.002995475, 0.9273497, 0.2378935, 1, 1, 1, 1, 1,
0.005407189, 0.2013032, 1.273198, 1, 1, 1, 1, 1,
0.00619008, -1.803984, 3.311173, 1, 1, 1, 1, 1,
0.008827055, 0.2753496, 2.181172, 1, 1, 1, 1, 1,
0.009304553, 1.623415, -0.3380668, 1, 1, 1, 1, 1,
0.01203465, -1.549765, 2.695801, 1, 1, 1, 1, 1,
0.01294378, 1.887707, -0.325326, 1, 1, 1, 1, 1,
0.01607346, -1.468234, 3.262949, 1, 1, 1, 1, 1,
0.01684994, 1.609179, 0.9951246, 1, 1, 1, 1, 1,
0.02275487, -0.6560665, 2.030051, 0, 0, 1, 1, 1,
0.02556215, -0.4103854, 4.761804, 1, 0, 0, 1, 1,
0.0268316, -1.310023, 1.878244, 1, 0, 0, 1, 1,
0.02702507, -0.7739074, 2.328945, 1, 0, 0, 1, 1,
0.03062439, 0.1352862, -0.8904761, 1, 0, 0, 1, 1,
0.0331258, -0.9831181, 2.89769, 1, 0, 0, 1, 1,
0.03472738, -0.3076382, 3.165814, 0, 0, 0, 1, 1,
0.0404321, -0.5346669, 3.411967, 0, 0, 0, 1, 1,
0.04226705, -0.8164746, 3.807349, 0, 0, 0, 1, 1,
0.04738904, -2.039578, 3.038274, 0, 0, 0, 1, 1,
0.04933273, -0.2335307, 3.938759, 0, 0, 0, 1, 1,
0.05111852, 0.4753108, -0.3156634, 0, 0, 0, 1, 1,
0.05164981, -0.3037993, 3.244168, 0, 0, 0, 1, 1,
0.05811249, 0.41377, -0.4421556, 1, 1, 1, 1, 1,
0.05891768, -1.158387, 4.982853, 1, 1, 1, 1, 1,
0.06013838, -1.037603, 0.5250325, 1, 1, 1, 1, 1,
0.06931809, -0.4884163, 3.70057, 1, 1, 1, 1, 1,
0.0719071, 0.7980183, 0.2685009, 1, 1, 1, 1, 1,
0.07231259, 0.08617979, 0.501955, 1, 1, 1, 1, 1,
0.07399523, 0.07496715, 2.112645, 1, 1, 1, 1, 1,
0.07733683, -0.1202634, 1.788785, 1, 1, 1, 1, 1,
0.07781797, -1.532737, 3.287814, 1, 1, 1, 1, 1,
0.07927928, -0.9265015, 2.777415, 1, 1, 1, 1, 1,
0.08097189, -0.1127832, 1.67893, 1, 1, 1, 1, 1,
0.08219457, 0.9945083, 0.5948493, 1, 1, 1, 1, 1,
0.08576738, -1.470062, 2.398498, 1, 1, 1, 1, 1,
0.0869659, 0.909932, 0.6403577, 1, 1, 1, 1, 1,
0.08866441, -0.1455507, 2.838564, 1, 1, 1, 1, 1,
0.09072682, 0.4450966, -0.5860592, 0, 0, 1, 1, 1,
0.09189373, 0.1595653, 0.1757036, 1, 0, 0, 1, 1,
0.09228542, 0.2170206, 1.40859, 1, 0, 0, 1, 1,
0.09329516, 0.8254749, -0.9031985, 1, 0, 0, 1, 1,
0.09382775, 1.405677, 0.1825914, 1, 0, 0, 1, 1,
0.09755698, -1.049726, 2.03913, 1, 0, 0, 1, 1,
0.1038022, 0.7587852, 0.1209771, 0, 0, 0, 1, 1,
0.1045268, 0.4092623, -1.135693, 0, 0, 0, 1, 1,
0.107011, 0.9314494, 0.3553957, 0, 0, 0, 1, 1,
0.1086461, 0.2154046, 0.4368586, 0, 0, 0, 1, 1,
0.1124153, 0.3299665, 0.4298435, 0, 0, 0, 1, 1,
0.1131917, 2.309267, 0.5970991, 0, 0, 0, 1, 1,
0.1144547, 1.030297, -0.07016679, 0, 0, 0, 1, 1,
0.1163221, -1.541907, 3.463148, 1, 1, 1, 1, 1,
0.1183922, -0.7619345, 2.886113, 1, 1, 1, 1, 1,
0.1246852, 0.8031798, -1.691536, 1, 1, 1, 1, 1,
0.1254759, 0.7608045, -0.9666931, 1, 1, 1, 1, 1,
0.125927, 0.06460521, 0.1378965, 1, 1, 1, 1, 1,
0.1268163, 1.462292, -0.1537188, 1, 1, 1, 1, 1,
0.1272217, -0.6129831, 3.21282, 1, 1, 1, 1, 1,
0.1291638, 0.2612103, -0.2150823, 1, 1, 1, 1, 1,
0.1330184, -1.108136, 4.897331, 1, 1, 1, 1, 1,
0.1333915, -1.324947, 2.182503, 1, 1, 1, 1, 1,
0.1363808, -0.1524788, 3.4, 1, 1, 1, 1, 1,
0.1415078, -1.765832, 2.216924, 1, 1, 1, 1, 1,
0.1484985, -1.051197, 3.45602, 1, 1, 1, 1, 1,
0.1489698, 0.1907154, 1.802562, 1, 1, 1, 1, 1,
0.1521073, -0.06446121, 1.488514, 1, 1, 1, 1, 1,
0.1547602, -0.7489877, 4.098476, 0, 0, 1, 1, 1,
0.1632779, -0.6862666, 3.05818, 1, 0, 0, 1, 1,
0.1659819, 0.9107565, 0.4468844, 1, 0, 0, 1, 1,
0.169721, -0.2999178, 2.05947, 1, 0, 0, 1, 1,
0.1726935, -0.5663789, 1.876941, 1, 0, 0, 1, 1,
0.1728675, 1.706927, 0.6330217, 1, 0, 0, 1, 1,
0.174562, 1.736977, 1.504561, 0, 0, 0, 1, 1,
0.1750121, -0.09726418, 1.419888, 0, 0, 0, 1, 1,
0.1779321, -0.8057914, 2.910645, 0, 0, 0, 1, 1,
0.1837928, 0.1037207, 0.4217482, 0, 0, 0, 1, 1,
0.1866225, 0.5699211, 1.386962, 0, 0, 0, 1, 1,
0.1905539, -0.7385349, 2.37794, 0, 0, 0, 1, 1,
0.2007628, 1.330389, -0.1100055, 0, 0, 0, 1, 1,
0.204111, 0.6737401, -0.3519213, 1, 1, 1, 1, 1,
0.2194103, -1.242661, 1.649735, 1, 1, 1, 1, 1,
0.2200142, -1.180762, 2.16885, 1, 1, 1, 1, 1,
0.2242147, 1.163812, 0.08808496, 1, 1, 1, 1, 1,
0.2267699, 0.759209, 1.238867, 1, 1, 1, 1, 1,
0.231599, 1.473105, 0.05907313, 1, 1, 1, 1, 1,
0.2318643, -0.2612872, 1.495989, 1, 1, 1, 1, 1,
0.2349856, 1.19922, 0.3228989, 1, 1, 1, 1, 1,
0.2374261, 1.462858, 1.948098, 1, 1, 1, 1, 1,
0.2398776, 0.8207945, 1.553272, 1, 1, 1, 1, 1,
0.2433695, -1.79465, 3.914315, 1, 1, 1, 1, 1,
0.2441936, 0.2360854, -0.1970915, 1, 1, 1, 1, 1,
0.244484, -1.326521, 2.396557, 1, 1, 1, 1, 1,
0.2453711, 0.5276364, 0.6853871, 1, 1, 1, 1, 1,
0.2467623, -0.9821176, 2.263192, 1, 1, 1, 1, 1,
0.2476564, -0.9810578, 3.066834, 0, 0, 1, 1, 1,
0.2528298, 1.246359, 0.7610701, 1, 0, 0, 1, 1,
0.2533759, -2.244705, 3.037425, 1, 0, 0, 1, 1,
0.2545625, 0.3469115, -0.7067822, 1, 0, 0, 1, 1,
0.2555613, -0.9061108, 1.751271, 1, 0, 0, 1, 1,
0.2562692, -0.7742324, 3.60906, 1, 0, 0, 1, 1,
0.2571379, -0.3422931, 1.274399, 0, 0, 0, 1, 1,
0.258266, 0.6514609, 0.2928925, 0, 0, 0, 1, 1,
0.2625533, -0.287899, 2.741649, 0, 0, 0, 1, 1,
0.2630819, 0.7910394, 0.41015, 0, 0, 0, 1, 1,
0.2631136, -0.3075232, 3.653245, 0, 0, 0, 1, 1,
0.2649026, 0.3161114, 0.8704093, 0, 0, 0, 1, 1,
0.2654323, 2.358597, 0.2390815, 0, 0, 0, 1, 1,
0.2662049, -1.340367, 2.772894, 1, 1, 1, 1, 1,
0.268075, -0.3585543, 3.14464, 1, 1, 1, 1, 1,
0.2694961, -0.06678367, 2.313097, 1, 1, 1, 1, 1,
0.2789789, -0.8840373, 2.034947, 1, 1, 1, 1, 1,
0.2809512, -0.1601686, 1.420196, 1, 1, 1, 1, 1,
0.2843299, 0.4450421, 0.9446113, 1, 1, 1, 1, 1,
0.2908561, -0.5528362, 2.963442, 1, 1, 1, 1, 1,
0.2942975, -1.012798, 3.59049, 1, 1, 1, 1, 1,
0.2973058, -1.046474, 1.818508, 1, 1, 1, 1, 1,
0.2991229, 0.3034969, 0.08115353, 1, 1, 1, 1, 1,
0.2998716, -1.174362, 2.980381, 1, 1, 1, 1, 1,
0.3015885, -0.7220569, 3.007507, 1, 1, 1, 1, 1,
0.3028885, 0.9372692, 1.056767, 1, 1, 1, 1, 1,
0.305841, -0.6936538, 0.9039408, 1, 1, 1, 1, 1,
0.3065401, -1.291535, 3.846433, 1, 1, 1, 1, 1,
0.3073325, -0.814223, 2.929091, 0, 0, 1, 1, 1,
0.3099134, -0.5631741, 2.489219, 1, 0, 0, 1, 1,
0.310287, -0.8824871, 2.20858, 1, 0, 0, 1, 1,
0.314598, 0.09740639, 1.778615, 1, 0, 0, 1, 1,
0.3150782, -0.5711483, 2.494488, 1, 0, 0, 1, 1,
0.316613, -1.20928, 3.067375, 1, 0, 0, 1, 1,
0.3172227, -2.298775, 0.6803131, 0, 0, 0, 1, 1,
0.3195715, -1.351938, 3.111134, 0, 0, 0, 1, 1,
0.3206384, -0.7993696, 4.064586, 0, 0, 0, 1, 1,
0.3237387, 0.4695144, -0.1250408, 0, 0, 0, 1, 1,
0.3250362, -0.5058769, 1.367026, 0, 0, 0, 1, 1,
0.3252952, 0.4029541, 2.015021, 0, 0, 0, 1, 1,
0.326867, -0.4452455, 3.706342, 0, 0, 0, 1, 1,
0.3281977, 1.290262, -2.585509, 1, 1, 1, 1, 1,
0.3294157, -1.158977, 2.948682, 1, 1, 1, 1, 1,
0.332002, -0.8658695, 2.623865, 1, 1, 1, 1, 1,
0.3383292, -0.7395732, 3.376481, 1, 1, 1, 1, 1,
0.3396299, 0.2256456, 1.093341, 1, 1, 1, 1, 1,
0.3399677, 0.05666057, 1.246376, 1, 1, 1, 1, 1,
0.3420903, -0.5773312, 2.513206, 1, 1, 1, 1, 1,
0.3441426, -0.9659579, 3.115027, 1, 1, 1, 1, 1,
0.3485669, -1.215375, 2.88904, 1, 1, 1, 1, 1,
0.3515286, 0.1766001, 1.039564, 1, 1, 1, 1, 1,
0.3541987, -0.6337239, 2.636438, 1, 1, 1, 1, 1,
0.3555988, -0.9606703, 2.452311, 1, 1, 1, 1, 1,
0.3573477, 0.6234909, 0.1888876, 1, 1, 1, 1, 1,
0.3591865, 0.2404844, 0.425961, 1, 1, 1, 1, 1,
0.3604777, 0.980495, 1.212392, 1, 1, 1, 1, 1,
0.3660021, 0.5450666, -0.2891618, 0, 0, 1, 1, 1,
0.3707148, 0.07470814, -0.6043935, 1, 0, 0, 1, 1,
0.3732675, -1.026326, 3.639656, 1, 0, 0, 1, 1,
0.375228, 0.6964199, 0.7837412, 1, 0, 0, 1, 1,
0.3798009, 0.7324657, 0.202031, 1, 0, 0, 1, 1,
0.3804369, -1.466587, 3.917873, 1, 0, 0, 1, 1,
0.3817782, 1.320073, 0.7888281, 0, 0, 0, 1, 1,
0.3830882, 0.5654981, 0.7531098, 0, 0, 0, 1, 1,
0.3848489, -1.533227, 2.635993, 0, 0, 0, 1, 1,
0.3877319, -0.6775586, 2.169352, 0, 0, 0, 1, 1,
0.3878269, 0.2119315, 0.4734415, 0, 0, 0, 1, 1,
0.3927161, -2.329657, 1.646713, 0, 0, 0, 1, 1,
0.3946676, 0.01322784, 2.292122, 0, 0, 0, 1, 1,
0.3948302, 0.1562894, 0.2279817, 1, 1, 1, 1, 1,
0.3963373, -0.224778, 2.072727, 1, 1, 1, 1, 1,
0.4033931, -1.69638, 4.056703, 1, 1, 1, 1, 1,
0.4035433, 1.8824, 1.378764, 1, 1, 1, 1, 1,
0.4087567, 1.660096, -0.7744674, 1, 1, 1, 1, 1,
0.4187682, 0.6103216, -1.844426, 1, 1, 1, 1, 1,
0.4203207, 0.1284271, 2.101921, 1, 1, 1, 1, 1,
0.4203656, -0.110668, 3.136161, 1, 1, 1, 1, 1,
0.4298097, 1.368376, -0.1502819, 1, 1, 1, 1, 1,
0.433966, -0.2086093, 2.063864, 1, 1, 1, 1, 1,
0.4360947, 1.54171, -0.526913, 1, 1, 1, 1, 1,
0.4406479, 0.1121044, 0.9371912, 1, 1, 1, 1, 1,
0.4463361, -0.2594419, 0.8976517, 1, 1, 1, 1, 1,
0.4463506, 1.532803, 1.283191, 1, 1, 1, 1, 1,
0.4474745, -0.8511154, 2.495679, 1, 1, 1, 1, 1,
0.4533071, -0.1883115, 3.250119, 0, 0, 1, 1, 1,
0.4551798, 0.5574354, -0.7010458, 1, 0, 0, 1, 1,
0.4578155, -1.242761, 2.650069, 1, 0, 0, 1, 1,
0.4591765, 0.6893364, -0.05159865, 1, 0, 0, 1, 1,
0.46536, -0.7990376, 2.701638, 1, 0, 0, 1, 1,
0.4660379, -1.943396, 1.88058, 1, 0, 0, 1, 1,
0.4663864, -0.9516632, 2.04277, 0, 0, 0, 1, 1,
0.4718654, 0.6623055, 0.4187268, 0, 0, 0, 1, 1,
0.4722187, -1.589557, 3.187862, 0, 0, 0, 1, 1,
0.4733381, -0.3739332, 0.6914816, 0, 0, 0, 1, 1,
0.4735904, -0.2575499, 1.832862, 0, 0, 0, 1, 1,
0.4748498, 0.9966893, 0.8130281, 0, 0, 0, 1, 1,
0.4753495, -1.263212, 2.489175, 0, 0, 0, 1, 1,
0.4766571, 0.5252537, 0.6502681, 1, 1, 1, 1, 1,
0.4786004, -1.517471, 3.834381, 1, 1, 1, 1, 1,
0.4797621, 0.6087035, 0.6516738, 1, 1, 1, 1, 1,
0.4825341, 1.548224, -0.6206508, 1, 1, 1, 1, 1,
0.4886931, 0.7821535, 0.7629113, 1, 1, 1, 1, 1,
0.4894876, -0.7212296, 3.867613, 1, 1, 1, 1, 1,
0.492402, 1.348083, -1.690918, 1, 1, 1, 1, 1,
0.4931895, -0.5429663, 1.795425, 1, 1, 1, 1, 1,
0.4976673, 0.9764192, -0.5352358, 1, 1, 1, 1, 1,
0.4999428, 0.4757099, -0.3435953, 1, 1, 1, 1, 1,
0.5053366, 0.02314866, 1.970405, 1, 1, 1, 1, 1,
0.5067114, -0.6182655, 3.215394, 1, 1, 1, 1, 1,
0.5067781, -3.729176, 2.991737, 1, 1, 1, 1, 1,
0.5076373, 0.2266962, 2.080415, 1, 1, 1, 1, 1,
0.5165685, -1.204791, 3.832424, 1, 1, 1, 1, 1,
0.5180253, 2.270568, -0.8914632, 0, 0, 1, 1, 1,
0.5186824, -0.04713762, 2.250001, 1, 0, 0, 1, 1,
0.5197856, 0.6278445, 0.3178051, 1, 0, 0, 1, 1,
0.5214917, -1.423084, 4.668525, 1, 0, 0, 1, 1,
0.5241536, 0.113093, 2.59687, 1, 0, 0, 1, 1,
0.5278333, -0.4540526, 2.008812, 1, 0, 0, 1, 1,
0.5295228, 0.5954772, 0.377836, 0, 0, 0, 1, 1,
0.5305259, 0.1484828, 0.3924867, 0, 0, 0, 1, 1,
0.5316442, 1.033852, -0.2232597, 0, 0, 0, 1, 1,
0.5329102, 0.2011448, 1.384934, 0, 0, 0, 1, 1,
0.5352783, 0.5360145, 0.1037547, 0, 0, 0, 1, 1,
0.5354386, 1.924343, -1.241156, 0, 0, 0, 1, 1,
0.5408999, 0.394501, 2.861827, 0, 0, 0, 1, 1,
0.5431732, 1.045495, 0.439486, 1, 1, 1, 1, 1,
0.5434844, -2.01753, 3.870476, 1, 1, 1, 1, 1,
0.5457975, 0.4764776, 0.4997675, 1, 1, 1, 1, 1,
0.5465672, -0.2847304, 2.714433, 1, 1, 1, 1, 1,
0.548308, -1.188166, 3.421049, 1, 1, 1, 1, 1,
0.5486147, -0.322592, -0.263133, 1, 1, 1, 1, 1,
0.552334, 2.790427, 0.3423215, 1, 1, 1, 1, 1,
0.5542318, -0.2350491, 0.5890648, 1, 1, 1, 1, 1,
0.5577436, -0.6374694, 1.871109, 1, 1, 1, 1, 1,
0.5629501, -0.08718271, 2.23887, 1, 1, 1, 1, 1,
0.5651146, -2.25521, 2.114474, 1, 1, 1, 1, 1,
0.5728708, 0.2889615, 0.214548, 1, 1, 1, 1, 1,
0.5767505, 0.7201393, 0.1587043, 1, 1, 1, 1, 1,
0.5777318, -0.7535893, 2.995856, 1, 1, 1, 1, 1,
0.5785801, -0.9068925, 3.846432, 1, 1, 1, 1, 1,
0.5807623, 0.1595414, -0.1408894, 0, 0, 1, 1, 1,
0.5820346, -0.464971, 2.186564, 1, 0, 0, 1, 1,
0.5822201, 1.307716, 0.1774318, 1, 0, 0, 1, 1,
0.5824474, -1.360984, 2.999133, 1, 0, 0, 1, 1,
0.5832008, -0.007094549, 1.088919, 1, 0, 0, 1, 1,
0.5858755, 1.026192, 1.227232, 1, 0, 0, 1, 1,
0.599267, 0.8450177, -1.047209, 0, 0, 0, 1, 1,
0.6007464, -2.450077, 1.729833, 0, 0, 0, 1, 1,
0.602699, 1.477813, -1.595924, 0, 0, 0, 1, 1,
0.6102615, 0.9163764, 1.579616, 0, 0, 0, 1, 1,
0.6115561, -0.056616, 0.795777, 0, 0, 0, 1, 1,
0.6123992, 0.554281, 1.538475, 0, 0, 0, 1, 1,
0.6136916, 0.2753347, 3.318763, 0, 0, 0, 1, 1,
0.6183383, 1.997715, 0.6575462, 1, 1, 1, 1, 1,
0.6265395, 0.0148003, 0.9437005, 1, 1, 1, 1, 1,
0.6275219, -1.985426, 3.755737, 1, 1, 1, 1, 1,
0.6369271, -0.4184086, 2.767792, 1, 1, 1, 1, 1,
0.6416739, -1.081874, 2.560936, 1, 1, 1, 1, 1,
0.6450605, 0.8603782, 2.370867, 1, 1, 1, 1, 1,
0.6460809, -0.8080744, 2.499547, 1, 1, 1, 1, 1,
0.6499166, -0.3982614, 1.588579, 1, 1, 1, 1, 1,
0.6515818, -0.0359174, 2.959845, 1, 1, 1, 1, 1,
0.6521704, 1.311748, 0.7446123, 1, 1, 1, 1, 1,
0.6524506, 2.34384, 0.592743, 1, 1, 1, 1, 1,
0.6531796, 0.2340707, 1.513352, 1, 1, 1, 1, 1,
0.6624178, -0.6347193, 1.95053, 1, 1, 1, 1, 1,
0.6632687, 0.2301046, 1.876609, 1, 1, 1, 1, 1,
0.6650572, 0.09290279, 2.483277, 1, 1, 1, 1, 1,
0.6693207, -0.4840253, 1.701771, 0, 0, 1, 1, 1,
0.6710039, 1.616428, 0.3013105, 1, 0, 0, 1, 1,
0.6750476, 0.2268317, 3.450449, 1, 0, 0, 1, 1,
0.6752563, 1.423138, 0.4016607, 1, 0, 0, 1, 1,
0.6768593, -0.04475281, 1.212429, 1, 0, 0, 1, 1,
0.6854798, -0.5259126, 1.855505, 1, 0, 0, 1, 1,
0.6893537, -1.55991, 2.042955, 0, 0, 0, 1, 1,
0.6930586, 0.04394178, 2.337912, 0, 0, 0, 1, 1,
0.6960467, -1.206279, 4.812402, 0, 0, 0, 1, 1,
0.6990095, 1.078423, -1.212181, 0, 0, 0, 1, 1,
0.6997029, 0.5121516, 1.792251, 0, 0, 0, 1, 1,
0.7008731, -0.8086278, 3.370175, 0, 0, 0, 1, 1,
0.7050683, -1.314868, 1.592558, 0, 0, 0, 1, 1,
0.7073491, -1.453158, 3.379198, 1, 1, 1, 1, 1,
0.7106861, -1.266555, 5.017952, 1, 1, 1, 1, 1,
0.7170511, -1.507924, 3.299435, 1, 1, 1, 1, 1,
0.7205255, -0.5541294, 1.473005, 1, 1, 1, 1, 1,
0.7281395, -0.6246176, 3.536524, 1, 1, 1, 1, 1,
0.7326763, 0.6110715, 2.040488, 1, 1, 1, 1, 1,
0.7361165, -1.335491, 4.617253, 1, 1, 1, 1, 1,
0.7389238, -0.1886252, 0.6982411, 1, 1, 1, 1, 1,
0.7398622, -0.514309, 2.815917, 1, 1, 1, 1, 1,
0.7501768, -0.2436851, 3.690502, 1, 1, 1, 1, 1,
0.7502173, -0.620179, 2.49229, 1, 1, 1, 1, 1,
0.7502238, 1.014219, 0.19208, 1, 1, 1, 1, 1,
0.7546616, -0.3355038, 0.909454, 1, 1, 1, 1, 1,
0.7547962, 0.585075, -0.04414354, 1, 1, 1, 1, 1,
0.7604493, 0.9604107, 1.183411, 1, 1, 1, 1, 1,
0.762326, -1.083154, 2.020192, 0, 0, 1, 1, 1,
0.7627002, 0.8846844, 1.739475, 1, 0, 0, 1, 1,
0.7657567, 0.08077981, 1.288231, 1, 0, 0, 1, 1,
0.7707642, -1.287575, 2.939059, 1, 0, 0, 1, 1,
0.7714393, -0.1304192, 1.370602, 1, 0, 0, 1, 1,
0.7741058, -1.955691, 1.836497, 1, 0, 0, 1, 1,
0.7817165, -0.01901051, 2.446317, 0, 0, 0, 1, 1,
0.7825151, 1.70293, -0.6068059, 0, 0, 0, 1, 1,
0.7876728, 0.5700125, -1.509933, 0, 0, 0, 1, 1,
0.7895378, -1.886143, 2.137598, 0, 0, 0, 1, 1,
0.7907876, -1.05438, 3.84321, 0, 0, 0, 1, 1,
0.7924063, -0.07163132, 1.634018, 0, 0, 0, 1, 1,
0.7947825, -0.7391258, 2.043735, 0, 0, 0, 1, 1,
0.797508, 0.5844261, 0.6315528, 1, 1, 1, 1, 1,
0.8008834, -0.7618669, 4.279186, 1, 1, 1, 1, 1,
0.801542, 2.165194, 1.270056, 1, 1, 1, 1, 1,
0.8058066, 1.426208, 1.683994, 1, 1, 1, 1, 1,
0.8079345, 0.5385806, 1.848851, 1, 1, 1, 1, 1,
0.8097566, -0.6567315, 4.117962, 1, 1, 1, 1, 1,
0.8120351, -0.4214679, 3.881374, 1, 1, 1, 1, 1,
0.8291853, 0.1277843, 0.6208645, 1, 1, 1, 1, 1,
0.8432164, -0.7996055, 2.926843, 1, 1, 1, 1, 1,
0.8534704, -1.434462, 3.059653, 1, 1, 1, 1, 1,
0.8579077, 0.5591434, 2.6238, 1, 1, 1, 1, 1,
0.8606816, 1.426468, 1.171871, 1, 1, 1, 1, 1,
0.8615817, 0.6548675, 1.288461, 1, 1, 1, 1, 1,
0.8782114, 1.67721, 2.592331, 1, 1, 1, 1, 1,
0.8786798, -1.256549, 2.567489, 1, 1, 1, 1, 1,
0.8827729, 0.3034437, 1.587689, 0, 0, 1, 1, 1,
0.8855106, -0.2156752, 1.995765, 1, 0, 0, 1, 1,
0.8858809, -2.015724, 4.106597, 1, 0, 0, 1, 1,
0.8881143, 0.5670788, 0.1288486, 1, 0, 0, 1, 1,
0.8884802, 0.04367431, 2.336073, 1, 0, 0, 1, 1,
0.9046857, 0.2316745, 2.145225, 1, 0, 0, 1, 1,
0.9147661, -0.562422, 0.695801, 0, 0, 0, 1, 1,
0.9196111, -0.4247304, 2.247355, 0, 0, 0, 1, 1,
0.9293694, -2.200671, 2.957972, 0, 0, 0, 1, 1,
0.9317867, -0.1622629, 1.807731, 0, 0, 0, 1, 1,
0.9341773, -0.3846352, 4.359251, 0, 0, 0, 1, 1,
0.9342023, -0.8804327, 3.248483, 0, 0, 0, 1, 1,
0.9429425, -0.9054984, 2.509452, 0, 0, 0, 1, 1,
0.9492342, -0.3032624, 3.125065, 1, 1, 1, 1, 1,
0.9507259, -0.3574815, 1.023807, 1, 1, 1, 1, 1,
0.9514434, -0.5498624, 1.376922, 1, 1, 1, 1, 1,
0.9578572, -1.484056, 2.645487, 1, 1, 1, 1, 1,
0.9647239, 0.6570676, 1.643714, 1, 1, 1, 1, 1,
0.9647757, -0.1597064, 2.360633, 1, 1, 1, 1, 1,
0.9670802, -0.9928735, 3.479744, 1, 1, 1, 1, 1,
0.9717676, -0.8300042, 3.518955, 1, 1, 1, 1, 1,
0.9801816, -0.5767222, 1.906068, 1, 1, 1, 1, 1,
0.9830852, 1.481811, -0.2681421, 1, 1, 1, 1, 1,
0.9868155, 0.9447963, -1.547789, 1, 1, 1, 1, 1,
0.9876527, 0.2865301, -0.5236974, 1, 1, 1, 1, 1,
0.9918958, -1.456621, 0.2504761, 1, 1, 1, 1, 1,
0.992738, -0.2188652, 2.462143, 1, 1, 1, 1, 1,
0.9937791, -0.3056944, 1.457185, 1, 1, 1, 1, 1,
0.9962621, -0.3794189, 1.867075, 0, 0, 1, 1, 1,
0.9964364, 0.6401234, 1.26019, 1, 0, 0, 1, 1,
1.010424, 1.390363, 2.870077, 1, 0, 0, 1, 1,
1.012955, -0.2376234, 1.238793, 1, 0, 0, 1, 1,
1.016058, 1.414466, 1.076366, 1, 0, 0, 1, 1,
1.017965, -1.751837, 2.658784, 1, 0, 0, 1, 1,
1.018172, -1.012315, 2.132493, 0, 0, 0, 1, 1,
1.022378, -0.07930144, -0.04937743, 0, 0, 0, 1, 1,
1.028277, -1.953175, 4.250835, 0, 0, 0, 1, 1,
1.03184, -1.489755, 2.324439, 0, 0, 0, 1, 1,
1.034584, 1.300288, -0.6954629, 0, 0, 0, 1, 1,
1.040451, -0.4842779, 2.142583, 0, 0, 0, 1, 1,
1.041589, 0.230703, 0.9989328, 0, 0, 0, 1, 1,
1.053852, 2.021454, 1.974424, 1, 1, 1, 1, 1,
1.054425, -0.0437476, 0.8806894, 1, 1, 1, 1, 1,
1.062151, 0.981594, 1.553142, 1, 1, 1, 1, 1,
1.065899, 0.2719319, -0.4868306, 1, 1, 1, 1, 1,
1.068375, -0.9854199, 1.866818, 1, 1, 1, 1, 1,
1.075503, 1.236679, -0.1042, 1, 1, 1, 1, 1,
1.075714, -0.6456257, 0.6347172, 1, 1, 1, 1, 1,
1.079412, -0.4051195, 2.071862, 1, 1, 1, 1, 1,
1.08572, 1.514416, 2.532542, 1, 1, 1, 1, 1,
1.087917, -0.6389903, 1.901642, 1, 1, 1, 1, 1,
1.111359, -0.2098808, -0.1124788, 1, 1, 1, 1, 1,
1.118973, -0.8657954, 1.564932, 1, 1, 1, 1, 1,
1.121064, 0.303643, 2.590129, 1, 1, 1, 1, 1,
1.127661, -0.3230853, 0.7396258, 1, 1, 1, 1, 1,
1.128543, -1.508343, 2.634629, 1, 1, 1, 1, 1,
1.129248, 0.3126815, 1.382162, 0, 0, 1, 1, 1,
1.132767, -0.147659, 2.138142, 1, 0, 0, 1, 1,
1.133004, 1.329143, 1.75343, 1, 0, 0, 1, 1,
1.133834, 1.648944, 0.8227749, 1, 0, 0, 1, 1,
1.158751, 2.855371, 0.776279, 1, 0, 0, 1, 1,
1.160742, 0.5405437, 2.052305, 1, 0, 0, 1, 1,
1.161698, 1.263567, 0.6675411, 0, 0, 0, 1, 1,
1.165554, -2.034354, 1.722695, 0, 0, 0, 1, 1,
1.188302, -0.34049, 0.5368053, 0, 0, 0, 1, 1,
1.191628, 0.5313039, 0.8912615, 0, 0, 0, 1, 1,
1.197432, 0.2060199, 0.05978338, 0, 0, 0, 1, 1,
1.201384, -0.794656, 0.4701334, 0, 0, 0, 1, 1,
1.203962, -0.5444085, 1.491385, 0, 0, 0, 1, 1,
1.208304, 0.9962783, 1.14408, 1, 1, 1, 1, 1,
1.212161, -0.8675419, 1.423624, 1, 1, 1, 1, 1,
1.219222, -0.6017848, 2.307522, 1, 1, 1, 1, 1,
1.223304, -1.305761, 5.425146, 1, 1, 1, 1, 1,
1.224658, -1.741846, 3.26294, 1, 1, 1, 1, 1,
1.249153, 0.5290639, 0.767334, 1, 1, 1, 1, 1,
1.250947, 1.187917, 2.334964, 1, 1, 1, 1, 1,
1.259191, 0.8330349, 1.567747, 1, 1, 1, 1, 1,
1.260388, 1.414966, 0.5885595, 1, 1, 1, 1, 1,
1.277349, 0.7768416, 0.5853806, 1, 1, 1, 1, 1,
1.278962, 0.572221, 2.73095, 1, 1, 1, 1, 1,
1.293864, 0.9634676, 0.1198141, 1, 1, 1, 1, 1,
1.298507, -1.674428, 3.402074, 1, 1, 1, 1, 1,
1.30687, -0.7128106, 1.545675, 1, 1, 1, 1, 1,
1.309626, 1.654029, 2.543743, 1, 1, 1, 1, 1,
1.317374, 0.1646466, 3.237235, 0, 0, 1, 1, 1,
1.321918, 0.4794677, 3.783595, 1, 0, 0, 1, 1,
1.326457, -0.6438954, 2.408434, 1, 0, 0, 1, 1,
1.329217, 0.165039, 2.171365, 1, 0, 0, 1, 1,
1.330115, 0.4243401, 0.07030504, 1, 0, 0, 1, 1,
1.331059, -1.289428, 2.313007, 1, 0, 0, 1, 1,
1.336157, 0.4455739, 0.9353829, 0, 0, 0, 1, 1,
1.368496, 0.5718488, 1.001741, 0, 0, 0, 1, 1,
1.371554, 0.6633076, 0.8111426, 0, 0, 0, 1, 1,
1.379035, 1.855741, 1.047554, 0, 0, 0, 1, 1,
1.379203, 0.7292259, -0.1600213, 0, 0, 0, 1, 1,
1.381816, -0.2097699, 0.8431386, 0, 0, 0, 1, 1,
1.389428, -0.2271387, 1.638281, 0, 0, 0, 1, 1,
1.390336, 0.4273432, 0.5921891, 1, 1, 1, 1, 1,
1.400545, 0.7848056, 2.571899, 1, 1, 1, 1, 1,
1.410306, 1.363032, 3.796255, 1, 1, 1, 1, 1,
1.417933, 0.6212565, 0.221273, 1, 1, 1, 1, 1,
1.422951, 0.2149732, 0.9485399, 1, 1, 1, 1, 1,
1.440062, -0.5979133, 0.5101306, 1, 1, 1, 1, 1,
1.449696, -1.688881, 3.197545, 1, 1, 1, 1, 1,
1.451042, -2.757626, 1.921528, 1, 1, 1, 1, 1,
1.45242, 0.5682741, 2.511413, 1, 1, 1, 1, 1,
1.452564, 1.748327, -1.253003, 1, 1, 1, 1, 1,
1.454025, -0.02876839, 3.490864, 1, 1, 1, 1, 1,
1.455016, -1.838981, 2.365765, 1, 1, 1, 1, 1,
1.464754, 1.242007, -0.4072312, 1, 1, 1, 1, 1,
1.470399, 0.53316, 1.741267, 1, 1, 1, 1, 1,
1.492922, -0.6116882, 2.004839, 1, 1, 1, 1, 1,
1.493742, 0.2469676, 2.141109, 0, 0, 1, 1, 1,
1.494722, 0.8939189, 2.783055, 1, 0, 0, 1, 1,
1.496484, -0.3356994, 2.015613, 1, 0, 0, 1, 1,
1.497508, 0.2531026, 0.4498546, 1, 0, 0, 1, 1,
1.498901, -2.11427, 4.093375, 1, 0, 0, 1, 1,
1.503018, -0.5745213, 3.596632, 1, 0, 0, 1, 1,
1.503494, -0.7288985, 0.8353191, 0, 0, 0, 1, 1,
1.513467, -1.04331, 2.616521, 0, 0, 0, 1, 1,
1.514397, 0.4365615, 1.838199, 0, 0, 0, 1, 1,
1.523332, 1.141095, 1.153321, 0, 0, 0, 1, 1,
1.536656, -0.6398469, 3.246471, 0, 0, 0, 1, 1,
1.537954, 1.266946, 1.292552, 0, 0, 0, 1, 1,
1.541017, 1.241461, 2.182237, 0, 0, 0, 1, 1,
1.559725, 0.6116097, 1.13115, 1, 1, 1, 1, 1,
1.563192, -0.02004111, 1.340508, 1, 1, 1, 1, 1,
1.565273, -1.325458, 3.730618, 1, 1, 1, 1, 1,
1.567822, -0.06061897, 1.374603, 1, 1, 1, 1, 1,
1.569684, -0.01593193, 1.407308, 1, 1, 1, 1, 1,
1.57442, 0.0494468, -0.8486789, 1, 1, 1, 1, 1,
1.588411, 0.5458768, 1.824383, 1, 1, 1, 1, 1,
1.589055, 1.22755, 1.777177, 1, 1, 1, 1, 1,
1.623053, -0.6387851, 1.449756, 1, 1, 1, 1, 1,
1.626805, -0.5075219, 1.907346, 1, 1, 1, 1, 1,
1.642535, -0.3726338, 4.133886, 1, 1, 1, 1, 1,
1.644812, 0.2603487, 2.929369, 1, 1, 1, 1, 1,
1.64633, 0.5714948, 1.872417, 1, 1, 1, 1, 1,
1.650167, -1.728498, 1.893225, 1, 1, 1, 1, 1,
1.651604, 0.261212, 2.332643, 1, 1, 1, 1, 1,
1.668579, -0.5559042, 2.909885, 0, 0, 1, 1, 1,
1.682062, 1.076124, 1.011185, 1, 0, 0, 1, 1,
1.714028, -0.9183307, 1.648903, 1, 0, 0, 1, 1,
1.715394, -0.6905413, 1.979706, 1, 0, 0, 1, 1,
1.722382, -0.2958043, 1.845576, 1, 0, 0, 1, 1,
1.743615, 1.70387, 1.163845, 1, 0, 0, 1, 1,
1.754524, 0.81857, 0.9946599, 0, 0, 0, 1, 1,
1.78354, -1.320653, 2.654337, 0, 0, 0, 1, 1,
1.786132, 0.448931, 1.962146, 0, 0, 0, 1, 1,
1.796317, -0.7054114, 2.49472, 0, 0, 0, 1, 1,
1.800565, 1.621083, -0.3324044, 0, 0, 0, 1, 1,
1.819318, -1.69802, 3.27269, 0, 0, 0, 1, 1,
1.834766, -1.149859, 1.384381, 0, 0, 0, 1, 1,
1.84895, 1.721839, -0.5224414, 1, 1, 1, 1, 1,
1.860274, 0.3735288, 2.762691, 1, 1, 1, 1, 1,
1.860956, -0.7181116, 2.440191, 1, 1, 1, 1, 1,
1.868614, 0.2663755, 3.10043, 1, 1, 1, 1, 1,
1.882692, -0.08442083, 0.5576192, 1, 1, 1, 1, 1,
1.898715, 0.9126751, 0.9961169, 1, 1, 1, 1, 1,
1.913015, 1.484719, 1.368085, 1, 1, 1, 1, 1,
1.938286, 0.580461, 1.774393, 1, 1, 1, 1, 1,
1.947457, 0.1617968, 1.031367, 1, 1, 1, 1, 1,
1.950564, -0.3489094, 2.110085, 1, 1, 1, 1, 1,
1.969541, 1.726419, 2.165087, 1, 1, 1, 1, 1,
1.992457, -1.080346, 1.674933, 1, 1, 1, 1, 1,
2.002003, -1.133485, 3.046491, 1, 1, 1, 1, 1,
2.009295, -0.6636815, 3.917149, 1, 1, 1, 1, 1,
2.04575, 0.3507523, 3.939976, 1, 1, 1, 1, 1,
2.060205, 0.4966496, 0.09385373, 0, 0, 1, 1, 1,
2.082528, -0.5039915, 3.105175, 1, 0, 0, 1, 1,
2.117222, -1.038754, 3.289999, 1, 0, 0, 1, 1,
2.144185, -1.052696, 2.709416, 1, 0, 0, 1, 1,
2.151832, 0.2447337, 2.294338, 1, 0, 0, 1, 1,
2.153456, -0.8242212, 1.972508, 1, 0, 0, 1, 1,
2.177128, 1.423811, 2.152028, 0, 0, 0, 1, 1,
2.194921, -1.102646, 2.660293, 0, 0, 0, 1, 1,
2.264556, 0.005746821, 1.267906, 0, 0, 0, 1, 1,
2.307611, -0.5807706, 1.060978, 0, 0, 0, 1, 1,
2.312183, -0.9848024, 1.414762, 0, 0, 0, 1, 1,
2.433737, -0.2521123, 1.456774, 0, 0, 0, 1, 1,
2.437072, 0.3673329, 0.8538783, 0, 0, 0, 1, 1,
2.53121, 1.311108, 0.9309477, 1, 1, 1, 1, 1,
2.569089, 0.6155375, 2.498103, 1, 1, 1, 1, 1,
2.661657, -0.09603495, 1.955951, 1, 1, 1, 1, 1,
2.878491, -0.3282028, 2.913215, 1, 1, 1, 1, 1,
2.898247, 0.9043887, 0.1963499, 1, 1, 1, 1, 1,
2.959003, 1.189725, 0.5526427, 1, 1, 1, 1, 1,
3.106272, 0.6729546, 2.337408, 1, 1, 1, 1, 1
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
var radius = 9.586468;
var distance = 33.67206;
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
mvMatrix.translate( -0.2100283, 0.4369025, 0.08226395 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.67206);
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
