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
-2.71443, -0.4368295, -1.773308, 1, 0, 0, 1,
-2.624114, 0.1324522, -2.92657, 1, 0.007843138, 0, 1,
-2.382722, 0.2432452, -0.6078465, 1, 0.01176471, 0, 1,
-2.349756, 1.492363, -1.831295, 1, 0.01960784, 0, 1,
-2.332143, 1.389997, -0.5618945, 1, 0.02352941, 0, 1,
-2.324371, 0.2501898, -2.964381, 1, 0.03137255, 0, 1,
-2.292065, -1.112821, -2.022517, 1, 0.03529412, 0, 1,
-2.238683, 1.246515, -0.1576451, 1, 0.04313726, 0, 1,
-2.21663, -0.9192601, -2.970966, 1, 0.04705882, 0, 1,
-2.182429, 0.130304, -1.217526, 1, 0.05490196, 0, 1,
-2.173635, 0.7526085, -2.558734, 1, 0.05882353, 0, 1,
-2.166997, -0.07929318, -2.790189, 1, 0.06666667, 0, 1,
-2.155245, 0.3891128, -1.483339, 1, 0.07058824, 0, 1,
-2.151487, 0.6074393, -2.823077, 1, 0.07843138, 0, 1,
-2.122425, -0.04068676, -1.465877, 1, 0.08235294, 0, 1,
-2.107017, 1.384036, -3.559988, 1, 0.09019608, 0, 1,
-2.093134, 0.7482643, -0.1572531, 1, 0.09411765, 0, 1,
-2.079576, -1.09311, -3.466913, 1, 0.1019608, 0, 1,
-2.065247, -1.08487, -2.215139, 1, 0.1098039, 0, 1,
-2.048109, 0.548741, -0.8517786, 1, 0.1137255, 0, 1,
-2.032502, -1.301498, -2.801527, 1, 0.1215686, 0, 1,
-2.014316, -0.6100026, -1.96848, 1, 0.1254902, 0, 1,
-1.971419, -0.3957734, -0.5427057, 1, 0.1333333, 0, 1,
-1.956709, 1.2937, -0.772391, 1, 0.1372549, 0, 1,
-1.954994, 0.7532204, -0.8965504, 1, 0.145098, 0, 1,
-1.940406, -0.4743417, -1.069352, 1, 0.1490196, 0, 1,
-1.920493, 1.208824, -1.276648, 1, 0.1568628, 0, 1,
-1.887823, 0.1372386, -1.546885, 1, 0.1607843, 0, 1,
-1.881316, -1.771983, -2.668863, 1, 0.1686275, 0, 1,
-1.878837, -1.109733, -2.004326, 1, 0.172549, 0, 1,
-1.856507, 0.06577516, -0.8799563, 1, 0.1803922, 0, 1,
-1.839956, 0.5075603, -1.62908, 1, 0.1843137, 0, 1,
-1.81209, 2.204529, -1.516723, 1, 0.1921569, 0, 1,
-1.801159, 1.819008, -1.615624, 1, 0.1960784, 0, 1,
-1.789436, -0.5100364, -3.536618, 1, 0.2039216, 0, 1,
-1.776177, 1.320264, -1.802477, 1, 0.2117647, 0, 1,
-1.756812, -2.074242, -1.473037, 1, 0.2156863, 0, 1,
-1.753545, 0.09106638, -2.753604, 1, 0.2235294, 0, 1,
-1.750221, -0.03847214, -3.470558, 1, 0.227451, 0, 1,
-1.749931, 2.920281, 1.024, 1, 0.2352941, 0, 1,
-1.748219, -0.6881157, -2.708843, 1, 0.2392157, 0, 1,
-1.713156, -1.207843, -3.689243, 1, 0.2470588, 0, 1,
-1.705746, -0.2962561, -0.8432029, 1, 0.2509804, 0, 1,
-1.674804, -0.8828711, -2.741498, 1, 0.2588235, 0, 1,
-1.655633, -0.5253038, -2.127791, 1, 0.2627451, 0, 1,
-1.651337, -0.03292722, -0.9870917, 1, 0.2705882, 0, 1,
-1.646965, -1.322765, -1.401377, 1, 0.2745098, 0, 1,
-1.638906, -0.3901741, -1.380226, 1, 0.282353, 0, 1,
-1.634798, -0.8245369, -1.541761, 1, 0.2862745, 0, 1,
-1.624986, -0.02809577, -0.6642192, 1, 0.2941177, 0, 1,
-1.614187, -1.336454, -0.5817093, 1, 0.3019608, 0, 1,
-1.598109, -0.04529687, -0.7828156, 1, 0.3058824, 0, 1,
-1.572631, 0.8936828, -0.8474569, 1, 0.3137255, 0, 1,
-1.569226, 2.648747, -2.562591, 1, 0.3176471, 0, 1,
-1.567451, 0.3913573, -2.293417, 1, 0.3254902, 0, 1,
-1.558854, 0.130413, -2.842397, 1, 0.3294118, 0, 1,
-1.556229, -1.125187, -0.2634127, 1, 0.3372549, 0, 1,
-1.552325, -0.1110358, -3.021295, 1, 0.3411765, 0, 1,
-1.551169, 1.092928, 0.3474586, 1, 0.3490196, 0, 1,
-1.546808, -1.262933, -0.6247385, 1, 0.3529412, 0, 1,
-1.546277, -0.5813439, -1.341213, 1, 0.3607843, 0, 1,
-1.543656, -1.043635, -3.225522, 1, 0.3647059, 0, 1,
-1.532582, 0.5190892, -1.669074, 1, 0.372549, 0, 1,
-1.527699, 0.7973999, -0.770067, 1, 0.3764706, 0, 1,
-1.523748, -0.1129279, -2.753613, 1, 0.3843137, 0, 1,
-1.51694, 0.7001789, -2.390772, 1, 0.3882353, 0, 1,
-1.507208, 1.840956, 0.1720676, 1, 0.3960784, 0, 1,
-1.503322, 0.1449167, -1.821682, 1, 0.4039216, 0, 1,
-1.494949, 1.529086, -1.386744, 1, 0.4078431, 0, 1,
-1.490193, -0.5522262, -2.201115, 1, 0.4156863, 0, 1,
-1.479569, 0.1986631, -0.1848572, 1, 0.4196078, 0, 1,
-1.477625, -0.4585469, -3.077106, 1, 0.427451, 0, 1,
-1.476202, -0.4402851, -1.047227, 1, 0.4313726, 0, 1,
-1.470177, 0.3905687, -2.157471, 1, 0.4392157, 0, 1,
-1.466464, -1.636102, -2.576729, 1, 0.4431373, 0, 1,
-1.459291, -1.071325, -0.6609216, 1, 0.4509804, 0, 1,
-1.444076, -2.061518, -2.035743, 1, 0.454902, 0, 1,
-1.440738, 0.03169912, -2.300385, 1, 0.4627451, 0, 1,
-1.430605, -1.583317, -2.990989, 1, 0.4666667, 0, 1,
-1.428158, 0.1556553, -0.9351426, 1, 0.4745098, 0, 1,
-1.427936, 0.9293103, -1.831132, 1, 0.4784314, 0, 1,
-1.424331, 1.006873, -0.2560578, 1, 0.4862745, 0, 1,
-1.423625, 0.4051174, -2.696867, 1, 0.4901961, 0, 1,
-1.419459, 1.047696, -0.07008315, 1, 0.4980392, 0, 1,
-1.402564, 0.5543581, -0.9306683, 1, 0.5058824, 0, 1,
-1.396539, -1.083259, -1.560892, 1, 0.509804, 0, 1,
-1.389008, 1.916342, -0.4939547, 1, 0.5176471, 0, 1,
-1.381715, -0.9728316, -2.364529, 1, 0.5215687, 0, 1,
-1.372436, 0.5543598, -1.389728, 1, 0.5294118, 0, 1,
-1.367007, -1.484144, -3.995731, 1, 0.5333334, 0, 1,
-1.365348, 0.2292453, -1.033517, 1, 0.5411765, 0, 1,
-1.353887, -0.3719904, -2.18462, 1, 0.5450981, 0, 1,
-1.345846, 1.106118, -1.797514, 1, 0.5529412, 0, 1,
-1.332967, 0.15797, -2.243403, 1, 0.5568628, 0, 1,
-1.325004, 0.3102833, -2.549585, 1, 0.5647059, 0, 1,
-1.322071, 0.6076139, -0.7965932, 1, 0.5686275, 0, 1,
-1.318635, -0.9600799, -2.200049, 1, 0.5764706, 0, 1,
-1.317663, -1.337905, -3.855612, 1, 0.5803922, 0, 1,
-1.312331, -0.756062, -1.269888, 1, 0.5882353, 0, 1,
-1.290222, 0.3293747, -1.777376, 1, 0.5921569, 0, 1,
-1.281422, 0.9450538, 2.08773, 1, 0.6, 0, 1,
-1.275588, -0.8821219, -3.274567, 1, 0.6078432, 0, 1,
-1.269023, 0.3952779, -1.354387, 1, 0.6117647, 0, 1,
-1.264292, 0.7559974, -1.318629, 1, 0.6196079, 0, 1,
-1.246403, -0.8148097, -3.126294, 1, 0.6235294, 0, 1,
-1.244664, -2.277766, -2.077028, 1, 0.6313726, 0, 1,
-1.233837, -0.3867085, -2.396942, 1, 0.6352941, 0, 1,
-1.21877, -0.2574076, -0.2221258, 1, 0.6431373, 0, 1,
-1.213246, 0.6910251, -1.060992, 1, 0.6470588, 0, 1,
-1.204159, 0.672973, -1.196128, 1, 0.654902, 0, 1,
-1.185605, 0.8494386, -1.100382, 1, 0.6588235, 0, 1,
-1.184317, -1.431971, -3.725853, 1, 0.6666667, 0, 1,
-1.175604, 1.442911, -1.107742, 1, 0.6705883, 0, 1,
-1.158578, 1.338613, 0.3224677, 1, 0.6784314, 0, 1,
-1.157927, 0.4759648, 0.5445502, 1, 0.682353, 0, 1,
-1.154133, 2.045031, 1.045391, 1, 0.6901961, 0, 1,
-1.145226, -1.72673, -1.446853, 1, 0.6941177, 0, 1,
-1.144545, -0.959377, -1.946366, 1, 0.7019608, 0, 1,
-1.132899, 0.2280628, -2.318667, 1, 0.7098039, 0, 1,
-1.127553, 0.8099738, -1.537991, 1, 0.7137255, 0, 1,
-1.122233, -0.3541117, -2.907844, 1, 0.7215686, 0, 1,
-1.10515, 0.01265316, -2.028472, 1, 0.7254902, 0, 1,
-1.103518, 0.8605525, -0.5018329, 1, 0.7333333, 0, 1,
-1.101951, -1.19471, -2.729611, 1, 0.7372549, 0, 1,
-1.09488, -1.549456, -4.08191, 1, 0.7450981, 0, 1,
-1.079649, 0.2607259, -1.363411, 1, 0.7490196, 0, 1,
-1.078528, 0.7941606, -1.987245, 1, 0.7568628, 0, 1,
-1.078103, -0.9491255, -0.8689829, 1, 0.7607843, 0, 1,
-1.073246, 0.4886032, -1.521939, 1, 0.7686275, 0, 1,
-1.071566, -0.01755073, -0.1782268, 1, 0.772549, 0, 1,
-1.069677, 1.243109, -0.7563445, 1, 0.7803922, 0, 1,
-1.065095, 0.4705361, -2.562398, 1, 0.7843137, 0, 1,
-1.062985, -0.1477598, -2.708962, 1, 0.7921569, 0, 1,
-1.060427, 0.3499499, -0.2667046, 1, 0.7960784, 0, 1,
-1.058992, -0.8745874, -1.784375, 1, 0.8039216, 0, 1,
-1.056837, -0.4246184, -2.075125, 1, 0.8117647, 0, 1,
-1.055106, 0.3780227, -1.245052, 1, 0.8156863, 0, 1,
-1.046147, -1.606807, -3.181972, 1, 0.8235294, 0, 1,
-1.023954, -0.6939234, -2.213924, 1, 0.827451, 0, 1,
-1.021806, -0.4060622, -2.03522, 1, 0.8352941, 0, 1,
-1.017238, 0.8895679, -1.451995, 1, 0.8392157, 0, 1,
-1.011547, 2.029453, 1.143273, 1, 0.8470588, 0, 1,
-1.007747, -0.8235406, -2.969893, 1, 0.8509804, 0, 1,
-1.007146, 0.05795209, -2.072369, 1, 0.8588235, 0, 1,
-1.004718, -0.7348101, -1.528383, 1, 0.8627451, 0, 1,
-1.004426, -0.6052758, -2.779659, 1, 0.8705882, 0, 1,
-1.00316, -1.868976, -1.875757, 1, 0.8745098, 0, 1,
-1.002224, 0.5175942, -1.412854, 1, 0.8823529, 0, 1,
-1.000631, -0.7759871, -1.606617, 1, 0.8862745, 0, 1,
-1.000384, -0.1444635, -1.09574, 1, 0.8941177, 0, 1,
-0.9973011, -2.028812, -2.305222, 1, 0.8980392, 0, 1,
-0.9969049, -0.06454697, -1.418271, 1, 0.9058824, 0, 1,
-0.9955824, 0.2341731, -1.465509, 1, 0.9137255, 0, 1,
-0.9874181, -1.727257, -2.992898, 1, 0.9176471, 0, 1,
-0.9743525, -1.764648, -3.040712, 1, 0.9254902, 0, 1,
-0.9738616, 0.5648057, -0.7089511, 1, 0.9294118, 0, 1,
-0.9635579, -0.7768878, -3.191086, 1, 0.9372549, 0, 1,
-0.9486913, -0.03576609, -1.222773, 1, 0.9411765, 0, 1,
-0.941144, -1.053556, -1.500504, 1, 0.9490196, 0, 1,
-0.9382148, 0.3808826, 0.13457, 1, 0.9529412, 0, 1,
-0.9304099, 1.069676, -1.713716, 1, 0.9607843, 0, 1,
-0.9219404, 1.782269, -0.6563341, 1, 0.9647059, 0, 1,
-0.9211111, 0.08262886, -2.285502, 1, 0.972549, 0, 1,
-0.9190474, -0.6945675, -3.384418, 1, 0.9764706, 0, 1,
-0.9170347, 1.345721, -1.080679, 1, 0.9843137, 0, 1,
-0.9137549, 2.343262, -0.7547016, 1, 0.9882353, 0, 1,
-0.9085476, 0.1099189, -1.308313, 1, 0.9960784, 0, 1,
-0.9074829, -1.153255, -1.604123, 0.9960784, 1, 0, 1,
-0.9055761, 0.5654723, -1.949212, 0.9921569, 1, 0, 1,
-0.8898087, 1.058235, 0.08101207, 0.9843137, 1, 0, 1,
-0.8882251, 0.3829872, 0.8925603, 0.9803922, 1, 0, 1,
-0.8848329, 1.354006, -0.6434056, 0.972549, 1, 0, 1,
-0.8834642, -0.7892922, -4.233128, 0.9686275, 1, 0, 1,
-0.8777529, 1.164061, 0.7860634, 0.9607843, 1, 0, 1,
-0.8765722, -0.8266092, -2.862495, 0.9568627, 1, 0, 1,
-0.8731983, 0.7528948, -1.219714, 0.9490196, 1, 0, 1,
-0.8724324, -0.9114162, -1.959697, 0.945098, 1, 0, 1,
-0.8704306, 2.05407, 0.7268417, 0.9372549, 1, 0, 1,
-0.8639673, 1.041867, -1.211747, 0.9333333, 1, 0, 1,
-0.8613629, -1.158914, -0.8077304, 0.9254902, 1, 0, 1,
-0.8597346, -1.442315, -2.086548, 0.9215686, 1, 0, 1,
-0.8491159, 0.7880527, -1.087134, 0.9137255, 1, 0, 1,
-0.8392501, -2.050586, -2.679472, 0.9098039, 1, 0, 1,
-0.8233989, 1.965623, 0.510895, 0.9019608, 1, 0, 1,
-0.8205475, 0.3043649, -0.5885399, 0.8941177, 1, 0, 1,
-0.8134226, 0.4283361, -1.390053, 0.8901961, 1, 0, 1,
-0.8097752, 0.3997905, -1.443264, 0.8823529, 1, 0, 1,
-0.807852, 0.4991767, -0.4282697, 0.8784314, 1, 0, 1,
-0.8078108, 0.9964648, -0.4066386, 0.8705882, 1, 0, 1,
-0.7984059, 1.129511, -2.769176, 0.8666667, 1, 0, 1,
-0.7812634, 0.1609595, -2.710495, 0.8588235, 1, 0, 1,
-0.7547166, -2.576698, -3.474591, 0.854902, 1, 0, 1,
-0.7506797, 1.057746, -0.03424203, 0.8470588, 1, 0, 1,
-0.750611, -0.5482444, -2.028515, 0.8431373, 1, 0, 1,
-0.7461424, 0.8890445, -2.496888, 0.8352941, 1, 0, 1,
-0.7451844, -0.7271017, -2.427528, 0.8313726, 1, 0, 1,
-0.7422804, -1.163414, -2.889297, 0.8235294, 1, 0, 1,
-0.7377203, 0.8779836, 0.9952579, 0.8196079, 1, 0, 1,
-0.7353671, -0.2867811, -2.908875, 0.8117647, 1, 0, 1,
-0.7343808, 0.608352, -1.98091, 0.8078431, 1, 0, 1,
-0.7327485, -1.01892, -3.881169, 0.8, 1, 0, 1,
-0.7214628, -0.7968719, -1.810082, 0.7921569, 1, 0, 1,
-0.7163008, -0.9971656, -1.895573, 0.7882353, 1, 0, 1,
-0.7144471, 1.501917, -0.614271, 0.7803922, 1, 0, 1,
-0.7064902, -1.577924, -2.470384, 0.7764706, 1, 0, 1,
-0.7059857, -0.05938299, -0.4198134, 0.7686275, 1, 0, 1,
-0.7058662, 0.1366383, 0.5225418, 0.7647059, 1, 0, 1,
-0.7001619, -0.0442517, -1.876495, 0.7568628, 1, 0, 1,
-0.6793149, 0.4288686, -0.06275633, 0.7529412, 1, 0, 1,
-0.6771669, 0.9977491, -0.3745829, 0.7450981, 1, 0, 1,
-0.6766768, 0.104305, -1.963445, 0.7411765, 1, 0, 1,
-0.6757234, -0.5885628, -1.194557, 0.7333333, 1, 0, 1,
-0.6661254, -0.1311549, -2.275484, 0.7294118, 1, 0, 1,
-0.6658909, -0.3396594, -0.6950592, 0.7215686, 1, 0, 1,
-0.6620625, -1.63154, -2.586052, 0.7176471, 1, 0, 1,
-0.6582962, 1.204186, -1.163713, 0.7098039, 1, 0, 1,
-0.6568126, -1.214733, -2.280893, 0.7058824, 1, 0, 1,
-0.6567243, -0.7540815, -4.013162, 0.6980392, 1, 0, 1,
-0.6528037, -0.4975572, -1.808145, 0.6901961, 1, 0, 1,
-0.6436195, -0.1278065, -2.851667, 0.6862745, 1, 0, 1,
-0.6418011, -0.09506725, -1.516977, 0.6784314, 1, 0, 1,
-0.6399852, -1.07617, -3.211464, 0.6745098, 1, 0, 1,
-0.6388147, 1.368757, 0.6905379, 0.6666667, 1, 0, 1,
-0.6313323, -0.5186108, -2.725878, 0.6627451, 1, 0, 1,
-0.6302581, -0.1681972, -1.857862, 0.654902, 1, 0, 1,
-0.6295502, 0.07901861, -0.9828988, 0.6509804, 1, 0, 1,
-0.6295255, -0.2467892, -1.777995, 0.6431373, 1, 0, 1,
-0.6272988, 2.692891, -1.021379, 0.6392157, 1, 0, 1,
-0.625571, 0.2880266, -0.4836801, 0.6313726, 1, 0, 1,
-0.6218675, 1.633152, -0.07570963, 0.627451, 1, 0, 1,
-0.6197653, 0.7507406, 0.8837547, 0.6196079, 1, 0, 1,
-0.618556, 0.3395374, -1.866479, 0.6156863, 1, 0, 1,
-0.6131724, 0.7460942, 0.6341767, 0.6078432, 1, 0, 1,
-0.6076176, -1.304852, -3.213145, 0.6039216, 1, 0, 1,
-0.6069352, -1.492894, -2.682142, 0.5960785, 1, 0, 1,
-0.6045122, 0.7375705, -1.256677, 0.5882353, 1, 0, 1,
-0.6026459, -0.5964462, -3.357364, 0.5843138, 1, 0, 1,
-0.6005964, -0.8439689, -1.733688, 0.5764706, 1, 0, 1,
-0.5989652, -1.721261, -1.800186, 0.572549, 1, 0, 1,
-0.5970612, 0.6018435, 0.6218533, 0.5647059, 1, 0, 1,
-0.5939811, 0.3282238, -1.91979, 0.5607843, 1, 0, 1,
-0.5889194, -0.3527819, -2.359774, 0.5529412, 1, 0, 1,
-0.5878724, -1.428004, -2.98852, 0.5490196, 1, 0, 1,
-0.5875718, -0.6023644, -3.182746, 0.5411765, 1, 0, 1,
-0.5847986, -1.905892, -1.958653, 0.5372549, 1, 0, 1,
-0.5820638, -0.4414363, -0.9441637, 0.5294118, 1, 0, 1,
-0.5809892, -1.052116, -0.9836981, 0.5254902, 1, 0, 1,
-0.5808651, -1.073833, -4.320066, 0.5176471, 1, 0, 1,
-0.580724, -1.225026, -2.872097, 0.5137255, 1, 0, 1,
-0.5749007, -1.190058, -1.801474, 0.5058824, 1, 0, 1,
-0.5706394, 1.073189, -0.04118426, 0.5019608, 1, 0, 1,
-0.5684238, 0.8343929, -2.152012, 0.4941176, 1, 0, 1,
-0.5679464, 1.939805, -1.056409, 0.4862745, 1, 0, 1,
-0.5662712, -0.9751456, -2.583136, 0.4823529, 1, 0, 1,
-0.5610682, 0.6586215, -0.8990053, 0.4745098, 1, 0, 1,
-0.5562299, 0.2981763, -0.8036641, 0.4705882, 1, 0, 1,
-0.5542693, 0.1898718, -0.9703166, 0.4627451, 1, 0, 1,
-0.5517264, 0.05539954, -2.65666, 0.4588235, 1, 0, 1,
-0.5482072, -0.9668986, -2.16117, 0.4509804, 1, 0, 1,
-0.5466737, -0.07590485, -1.425398, 0.4470588, 1, 0, 1,
-0.5465496, -0.7058262, -3.452115, 0.4392157, 1, 0, 1,
-0.5348368, 0.6066136, -1.833522, 0.4352941, 1, 0, 1,
-0.5320362, 0.3824278, -0.42559, 0.427451, 1, 0, 1,
-0.524151, 0.4871019, -0.9584017, 0.4235294, 1, 0, 1,
-0.5229318, 0.4553006, -0.09337907, 0.4156863, 1, 0, 1,
-0.5220705, 0.3217097, -1.988061, 0.4117647, 1, 0, 1,
-0.517663, 0.2039225, -2.399119, 0.4039216, 1, 0, 1,
-0.5156123, -1.417855, -2.96829, 0.3960784, 1, 0, 1,
-0.5111177, -0.8195964, -2.54666, 0.3921569, 1, 0, 1,
-0.5053562, -0.1661907, -1.058606, 0.3843137, 1, 0, 1,
-0.4997732, 1.134915, -0.3239334, 0.3803922, 1, 0, 1,
-0.4979324, 0.01090456, -0.2990793, 0.372549, 1, 0, 1,
-0.4970047, -0.8837995, -2.704765, 0.3686275, 1, 0, 1,
-0.4964727, 0.5960652, -1.052925, 0.3607843, 1, 0, 1,
-0.4945558, 0.9316772, -1.344432, 0.3568628, 1, 0, 1,
-0.4920961, -0.9403496, -3.855706, 0.3490196, 1, 0, 1,
-0.4906485, 1.505828, -2.358329, 0.345098, 1, 0, 1,
-0.4904195, 0.5562695, -0.2140445, 0.3372549, 1, 0, 1,
-0.4895221, -0.79777, -2.589979, 0.3333333, 1, 0, 1,
-0.4888027, -0.7445073, -2.969363, 0.3254902, 1, 0, 1,
-0.4877527, -0.6253155, -3.101137, 0.3215686, 1, 0, 1,
-0.4876553, -0.4723017, -4.302462, 0.3137255, 1, 0, 1,
-0.4850305, 0.9699671, -0.4200684, 0.3098039, 1, 0, 1,
-0.4835061, 0.8803083, 0.1587987, 0.3019608, 1, 0, 1,
-0.4833599, 0.6786559, 0.005541082, 0.2941177, 1, 0, 1,
-0.4788603, -0.1509257, -2.594796, 0.2901961, 1, 0, 1,
-0.477946, 0.8602105, -1.109235, 0.282353, 1, 0, 1,
-0.473491, 0.1169253, -0.2042518, 0.2784314, 1, 0, 1,
-0.4724531, -0.7535328, -2.59199, 0.2705882, 1, 0, 1,
-0.4714942, -1.060504, -2.938482, 0.2666667, 1, 0, 1,
-0.4697651, -0.428299, -1.807677, 0.2588235, 1, 0, 1,
-0.4673959, -0.5980254, -2.036633, 0.254902, 1, 0, 1,
-0.4663949, -0.3119811, -1.500337, 0.2470588, 1, 0, 1,
-0.4640269, 0.5498419, -0.3563996, 0.2431373, 1, 0, 1,
-0.4624977, -0.4544458, -1.840439, 0.2352941, 1, 0, 1,
-0.4616304, -0.04490985, -1.515767, 0.2313726, 1, 0, 1,
-0.4588669, -0.1301878, -2.543082, 0.2235294, 1, 0, 1,
-0.4585669, 0.118201, -0.8843822, 0.2196078, 1, 0, 1,
-0.45788, -0.3188787, -2.052348, 0.2117647, 1, 0, 1,
-0.4539258, -0.3562164, -2.406556, 0.2078431, 1, 0, 1,
-0.4522365, -0.6044058, -2.757029, 0.2, 1, 0, 1,
-0.4475096, -0.02590879, -0.7212363, 0.1921569, 1, 0, 1,
-0.4449608, -1.011006, -3.31972, 0.1882353, 1, 0, 1,
-0.4449136, 0.02237172, 1.446652, 0.1803922, 1, 0, 1,
-0.4430863, 1.093647, 0.9271314, 0.1764706, 1, 0, 1,
-0.4332957, 0.5885741, -2.201308, 0.1686275, 1, 0, 1,
-0.4295481, -0.6213071, -2.327096, 0.1647059, 1, 0, 1,
-0.4251544, 0.4659839, 0.4313767, 0.1568628, 1, 0, 1,
-0.4195396, 1.552141, 0.03940158, 0.1529412, 1, 0, 1,
-0.4186743, -1.798052, -2.52299, 0.145098, 1, 0, 1,
-0.4175954, -1.381101, -2.238185, 0.1411765, 1, 0, 1,
-0.4104641, 0.8771318, 0.180696, 0.1333333, 1, 0, 1,
-0.4103721, 0.5550935, -0.8144062, 0.1294118, 1, 0, 1,
-0.4079393, -0.3261128, -1.514766, 0.1215686, 1, 0, 1,
-0.4025272, -0.5003705, -2.906693, 0.1176471, 1, 0, 1,
-0.4003645, 0.7488177, 0.4794447, 0.1098039, 1, 0, 1,
-0.398347, 0.7374167, -0.3168284, 0.1058824, 1, 0, 1,
-0.3974945, -0.3649507, -2.385637, 0.09803922, 1, 0, 1,
-0.3942695, -1.085132, -3.08366, 0.09019608, 1, 0, 1,
-0.3876155, -1.659374, -2.915756, 0.08627451, 1, 0, 1,
-0.3867777, -1.630079, -3.492319, 0.07843138, 1, 0, 1,
-0.3854988, -0.2586786, -1.814918, 0.07450981, 1, 0, 1,
-0.383699, 1.290783, 0.7474712, 0.06666667, 1, 0, 1,
-0.3829536, 0.06422091, -2.166864, 0.0627451, 1, 0, 1,
-0.3828619, -1.261569, -2.890768, 0.05490196, 1, 0, 1,
-0.3749422, -0.4062376, -1.025478, 0.05098039, 1, 0, 1,
-0.3722363, 0.4587197, 0.8871626, 0.04313726, 1, 0, 1,
-0.3712897, -0.2053982, -2.785335, 0.03921569, 1, 0, 1,
-0.3631741, 1.391292, -0.9546422, 0.03137255, 1, 0, 1,
-0.3590724, -1.005925, -3.414296, 0.02745098, 1, 0, 1,
-0.3573052, 0.9901379, 0.3374706, 0.01960784, 1, 0, 1,
-0.3477745, -1.608498, -3.091234, 0.01568628, 1, 0, 1,
-0.3467253, -0.9897383, -2.438423, 0.007843138, 1, 0, 1,
-0.3374501, -0.3056699, -1.814696, 0.003921569, 1, 0, 1,
-0.3374085, -0.3630193, -0.08979546, 0, 1, 0.003921569, 1,
-0.3358821, -0.559077, -2.306498, 0, 1, 0.01176471, 1,
-0.333763, -1.233084, -3.841595, 0, 1, 0.01568628, 1,
-0.3302863, -0.2313583, -1.279043, 0, 1, 0.02352941, 1,
-0.3163299, 0.8602276, -0.5081999, 0, 1, 0.02745098, 1,
-0.3151261, 1.413431, -0.4835434, 0, 1, 0.03529412, 1,
-0.3140625, -0.004412801, -1.999842, 0, 1, 0.03921569, 1,
-0.314056, -0.778863, -4.773584, 0, 1, 0.04705882, 1,
-0.3063458, 1.917853, 1.432145, 0, 1, 0.05098039, 1,
-0.3063135, 0.04648006, -0.3422859, 0, 1, 0.05882353, 1,
-0.2996725, 0.5865923, -0.7819699, 0, 1, 0.0627451, 1,
-0.2985566, -1.364499, -2.729936, 0, 1, 0.07058824, 1,
-0.2981833, -1.587667, -3.286616, 0, 1, 0.07450981, 1,
-0.2961743, 1.429317, 0.3348561, 0, 1, 0.08235294, 1,
-0.2949264, 0.8601208, 0.3428608, 0, 1, 0.08627451, 1,
-0.2895748, -1.763148, -3.816828, 0, 1, 0.09411765, 1,
-0.286519, -1.422431, -0.8848959, 0, 1, 0.1019608, 1,
-0.2861263, -0.8343337, -3.620793, 0, 1, 0.1058824, 1,
-0.2793759, 0.3092758, 1.254432, 0, 1, 0.1137255, 1,
-0.2784417, 2.51118, -0.4418416, 0, 1, 0.1176471, 1,
-0.275323, 2.04512, 0.934471, 0, 1, 0.1254902, 1,
-0.2747674, 0.5526002, 0.3859011, 0, 1, 0.1294118, 1,
-0.2736546, 0.1431744, -1.226076, 0, 1, 0.1372549, 1,
-0.271881, -0.2946585, -3.335877, 0, 1, 0.1411765, 1,
-0.270436, 0.3262027, -0.2032913, 0, 1, 0.1490196, 1,
-0.2685479, 1.403543, 0.1090993, 0, 1, 0.1529412, 1,
-0.2575764, -0.05961705, -5.098155, 0, 1, 0.1607843, 1,
-0.2567474, 0.6020006, 0.4696135, 0, 1, 0.1647059, 1,
-0.2515351, 0.8514134, -1.119755, 0, 1, 0.172549, 1,
-0.2515041, -0.419129, -1.275925, 0, 1, 0.1764706, 1,
-0.2490821, 0.5024498, -0.7623964, 0, 1, 0.1843137, 1,
-0.2484604, -1.332306, -2.126002, 0, 1, 0.1882353, 1,
-0.2471177, 0.4735494, -1.490916, 0, 1, 0.1960784, 1,
-0.2443876, -0.2365352, -3.109435, 0, 1, 0.2039216, 1,
-0.2440542, 1.639166, 0.2554283, 0, 1, 0.2078431, 1,
-0.2387341, -1.386049, -3.894444, 0, 1, 0.2156863, 1,
-0.2373259, 0.4298345, -0.9078169, 0, 1, 0.2196078, 1,
-0.2343485, 1.508381, -0.3099388, 0, 1, 0.227451, 1,
-0.2320772, 1.064672, -1.73622, 0, 1, 0.2313726, 1,
-0.23035, 1.505384, -2.724758, 0, 1, 0.2392157, 1,
-0.2296309, -0.5318392, -2.306144, 0, 1, 0.2431373, 1,
-0.2285946, 0.6281431, -0.4608374, 0, 1, 0.2509804, 1,
-0.2266016, 1.369076, 0.1300257, 0, 1, 0.254902, 1,
-0.2253638, -1.331525, -2.567584, 0, 1, 0.2627451, 1,
-0.2243398, 1.399842, 0.4870638, 0, 1, 0.2666667, 1,
-0.2215063, 1.149257, 0.5119972, 0, 1, 0.2745098, 1,
-0.2202359, -1.547789, -2.012142, 0, 1, 0.2784314, 1,
-0.2182565, 0.39487, -1.567858, 0, 1, 0.2862745, 1,
-0.2162456, -0.2589803, -1.466985, 0, 1, 0.2901961, 1,
-0.2116018, -0.1830921, -1.127561, 0, 1, 0.2980392, 1,
-0.2104848, 1.271179, 1.268079, 0, 1, 0.3058824, 1,
-0.210431, 0.3180191, -1.357289, 0, 1, 0.3098039, 1,
-0.2091324, -0.6596949, -2.54131, 0, 1, 0.3176471, 1,
-0.2046149, -0.2598826, -2.532174, 0, 1, 0.3215686, 1,
-0.2040858, 1.448531, 1.797969, 0, 1, 0.3294118, 1,
-0.2018759, 0.1707316, -1.498074, 0, 1, 0.3333333, 1,
-0.2004941, 0.1315174, -0.3849544, 0, 1, 0.3411765, 1,
-0.1997646, -0.323126, -0.1401561, 0, 1, 0.345098, 1,
-0.1949307, -0.6920255, -1.344463, 0, 1, 0.3529412, 1,
-0.1934532, 0.1743855, -0.5848003, 0, 1, 0.3568628, 1,
-0.1928448, -1.728455, -1.863339, 0, 1, 0.3647059, 1,
-0.1909356, -1.616933, -2.178704, 0, 1, 0.3686275, 1,
-0.190891, -0.1566091, 0.2506839, 0, 1, 0.3764706, 1,
-0.1786652, 0.2050504, -0.4255654, 0, 1, 0.3803922, 1,
-0.1784296, -2.755975, -4.443223, 0, 1, 0.3882353, 1,
-0.1726782, 1.070273, -0.6328704, 0, 1, 0.3921569, 1,
-0.1697387, 1.26352, -0.902597, 0, 1, 0.4, 1,
-0.1656715, 1.023138, 0.4005512, 0, 1, 0.4078431, 1,
-0.159563, -1.634664, -3.103251, 0, 1, 0.4117647, 1,
-0.1584439, -0.216548, 1.1273, 0, 1, 0.4196078, 1,
-0.1562334, 1.365262, 0.5780755, 0, 1, 0.4235294, 1,
-0.1508577, 0.7437955, 0.6470259, 0, 1, 0.4313726, 1,
-0.1494062, 0.9617975, -0.2331425, 0, 1, 0.4352941, 1,
-0.1471345, 1.193692, 0.4376316, 0, 1, 0.4431373, 1,
-0.1378658, -0.9040493, -2.497455, 0, 1, 0.4470588, 1,
-0.1327609, -1.005912, -1.6868, 0, 1, 0.454902, 1,
-0.1285609, 0.961205, -0.3019617, 0, 1, 0.4588235, 1,
-0.1267668, -0.121589, -2.830115, 0, 1, 0.4666667, 1,
-0.1258958, -1.297759, -2.726144, 0, 1, 0.4705882, 1,
-0.1199251, 0.7263733, 0.3097458, 0, 1, 0.4784314, 1,
-0.1177478, 0.9852505, -0.9099109, 0, 1, 0.4823529, 1,
-0.1164895, -0.4251137, -2.716999, 0, 1, 0.4901961, 1,
-0.1151674, 0.522664, -1.554193, 0, 1, 0.4941176, 1,
-0.1132641, -1.551652, -3.314569, 0, 1, 0.5019608, 1,
-0.112771, -0.816551, -2.391365, 0, 1, 0.509804, 1,
-0.1120318, -1.460736, -3.211765, 0, 1, 0.5137255, 1,
-0.1119712, 0.4902254, -2.17103, 0, 1, 0.5215687, 1,
-0.1116779, -1.565715, -0.02794098, 0, 1, 0.5254902, 1,
-0.109837, 0.6482207, -1.565595, 0, 1, 0.5333334, 1,
-0.1057092, -1.876504, -3.113476, 0, 1, 0.5372549, 1,
-0.1054596, -0.2629356, -2.069811, 0, 1, 0.5450981, 1,
-0.1003884, -1.28278, -3.944851, 0, 1, 0.5490196, 1,
-0.09943888, -0.1381516, -3.220967, 0, 1, 0.5568628, 1,
-0.09863923, 0.5249248, -0.7504963, 0, 1, 0.5607843, 1,
-0.09564561, 0.1712225, -0.2402058, 0, 1, 0.5686275, 1,
-0.09195295, 0.07889701, -1.952155, 0, 1, 0.572549, 1,
-0.08964883, -0.6012583, -2.270752, 0, 1, 0.5803922, 1,
-0.08775512, 1.197454, -0.9504323, 0, 1, 0.5843138, 1,
-0.08730077, 0.2263527, 0.1694455, 0, 1, 0.5921569, 1,
-0.08384974, -0.04645956, -1.830955, 0, 1, 0.5960785, 1,
-0.08124258, 0.1916019, 1.25898, 0, 1, 0.6039216, 1,
-0.08086199, -2.46779, -3.67421, 0, 1, 0.6117647, 1,
-0.08072519, 1.293277, -0.06904338, 0, 1, 0.6156863, 1,
-0.07458501, 0.04402456, -2.084385, 0, 1, 0.6235294, 1,
-0.07329179, 0.05012025, -2.767962, 0, 1, 0.627451, 1,
-0.06933245, -0.8786666, -3.265291, 0, 1, 0.6352941, 1,
-0.06774876, -1.603933, -2.885624, 0, 1, 0.6392157, 1,
-0.06700757, -1.603648, -2.058306, 0, 1, 0.6470588, 1,
-0.06483406, 0.435501, -1.401471, 0, 1, 0.6509804, 1,
-0.05375464, 0.06953497, -1.15904, 0, 1, 0.6588235, 1,
-0.05309586, -0.3429623, -4.311752, 0, 1, 0.6627451, 1,
-0.05284258, -0.203493, -3.448115, 0, 1, 0.6705883, 1,
-0.05233, 0.9384497, 1.409201, 0, 1, 0.6745098, 1,
-0.05027148, -0.52972, -2.445481, 0, 1, 0.682353, 1,
-0.0499806, -0.1382173, -2.440494, 0, 1, 0.6862745, 1,
-0.04952021, -0.4734378, -2.969906, 0, 1, 0.6941177, 1,
-0.04548573, -0.3163316, -0.8873712, 0, 1, 0.7019608, 1,
-0.03662921, -1.027491, -3.444372, 0, 1, 0.7058824, 1,
-0.03557266, -1.200365, -3.132147, 0, 1, 0.7137255, 1,
-0.03528143, 0.8924218, -0.2302019, 0, 1, 0.7176471, 1,
-0.03525137, -0.8219516, -3.9415, 0, 1, 0.7254902, 1,
-0.03423046, -0.2661254, -3.397248, 0, 1, 0.7294118, 1,
-0.02950612, -0.6940889, -2.999777, 0, 1, 0.7372549, 1,
-0.02930086, -0.1287041, -3.272571, 0, 1, 0.7411765, 1,
-0.02545024, 1.278279, -1.511004, 0, 1, 0.7490196, 1,
-0.02522416, -0.8361462, -3.065308, 0, 1, 0.7529412, 1,
-0.01559561, -0.003198201, -1.236601, 0, 1, 0.7607843, 1,
-0.01488935, 0.4810505, 0.5825863, 0, 1, 0.7647059, 1,
-0.01347673, 0.6170271, 0.4225796, 0, 1, 0.772549, 1,
-0.008872502, 0.9353225, 1.301649, 0, 1, 0.7764706, 1,
-0.00630235, -1.503886, -4.001918, 0, 1, 0.7843137, 1,
-0.005250776, -0.01169503, -3.363427, 0, 1, 0.7882353, 1,
0.005100636, 0.1850727, 0.5062281, 0, 1, 0.7960784, 1,
0.007516061, -0.1582331, 4.03202, 0, 1, 0.8039216, 1,
0.01004335, -1.174777, 3.238378, 0, 1, 0.8078431, 1,
0.01047715, 0.4852354, -1.025714, 0, 1, 0.8156863, 1,
0.0155856, 0.318645, -0.1895106, 0, 1, 0.8196079, 1,
0.01714501, -1.212865, 4.590346, 0, 1, 0.827451, 1,
0.01773949, 0.6836423, 2.333906, 0, 1, 0.8313726, 1,
0.01776698, 1.361506, 2.694509, 0, 1, 0.8392157, 1,
0.01945075, 1.36835, 1.423707, 0, 1, 0.8431373, 1,
0.0198678, -0.3407291, 3.339038, 0, 1, 0.8509804, 1,
0.02409462, 0.336735, -2.029439, 0, 1, 0.854902, 1,
0.03078213, 0.6246858, 0.6339435, 0, 1, 0.8627451, 1,
0.03168822, 1.088363, 0.04469158, 0, 1, 0.8666667, 1,
0.03248534, 1.004672, 1.240714, 0, 1, 0.8745098, 1,
0.03310321, 0.4574761, -0.8911061, 0, 1, 0.8784314, 1,
0.03422128, -0.0274489, 3.613368, 0, 1, 0.8862745, 1,
0.03441279, -0.3971778, 4.084594, 0, 1, 0.8901961, 1,
0.03618089, -1.728092, 3.866952, 0, 1, 0.8980392, 1,
0.03906438, -0.1886806, 1.432304, 0, 1, 0.9058824, 1,
0.03952916, -1.108277, 2.338449, 0, 1, 0.9098039, 1,
0.04089222, -0.5774232, 3.06207, 0, 1, 0.9176471, 1,
0.04843463, -0.5449814, 2.110144, 0, 1, 0.9215686, 1,
0.04912043, -0.29558, 3.92032, 0, 1, 0.9294118, 1,
0.05046077, -0.2142788, 4.440684, 0, 1, 0.9333333, 1,
0.05199253, -0.9473367, 3.040479, 0, 1, 0.9411765, 1,
0.05510185, -0.1468336, 2.589766, 0, 1, 0.945098, 1,
0.05734492, -0.2390361, 1.90545, 0, 1, 0.9529412, 1,
0.05879908, 0.4975842, 1.157104, 0, 1, 0.9568627, 1,
0.05949291, 0.2084017, -0.06508137, 0, 1, 0.9647059, 1,
0.06278659, 0.615615, 0.3470876, 0, 1, 0.9686275, 1,
0.064584, 1.799352, 0.9020302, 0, 1, 0.9764706, 1,
0.06784824, 0.6064236, -0.4074519, 0, 1, 0.9803922, 1,
0.06953532, -0.2277941, 2.231657, 0, 1, 0.9882353, 1,
0.07495372, 0.716177, 1.496881, 0, 1, 0.9921569, 1,
0.07524213, 1.203285, -0.8239314, 0, 1, 1, 1,
0.07619795, 0.6302107, -0.8982911, 0, 0.9921569, 1, 1,
0.07873303, 0.3452983, -0.8457767, 0, 0.9882353, 1, 1,
0.08093084, -0.6383008, 2.914507, 0, 0.9803922, 1, 1,
0.08406764, 0.848045, -1.458797, 0, 0.9764706, 1, 1,
0.08502673, 0.3764461, -0.4097632, 0, 0.9686275, 1, 1,
0.08511982, 0.01276306, 0.01958785, 0, 0.9647059, 1, 1,
0.08668961, -0.04721558, 3.718244, 0, 0.9568627, 1, 1,
0.0909754, -1.807694, 3.307941, 0, 0.9529412, 1, 1,
0.09272105, -2.136456, 2.525025, 0, 0.945098, 1, 1,
0.09920151, -1.406495, 3.23038, 0, 0.9411765, 1, 1,
0.1011607, 1.615089, 2.132629, 0, 0.9333333, 1, 1,
0.1046242, 0.8619767, -1.773656, 0, 0.9294118, 1, 1,
0.1070353, 1.92451, -0.4765579, 0, 0.9215686, 1, 1,
0.1071438, 0.2343572, -1.158527, 0, 0.9176471, 1, 1,
0.1076517, 1.328166, -0.8122445, 0, 0.9098039, 1, 1,
0.1077432, -0.9869947, 2.22278, 0, 0.9058824, 1, 1,
0.11255, -0.5776599, 1.794766, 0, 0.8980392, 1, 1,
0.113434, -0.3961757, 2.553285, 0, 0.8901961, 1, 1,
0.1134402, 0.1973654, 1.335664, 0, 0.8862745, 1, 1,
0.1155616, -1.280765, 2.811442, 0, 0.8784314, 1, 1,
0.1160721, -0.1307199, 5.336994, 0, 0.8745098, 1, 1,
0.1185424, -0.1402209, 2.121456, 0, 0.8666667, 1, 1,
0.1212451, 0.7912999, 0.4046415, 0, 0.8627451, 1, 1,
0.1277375, -2.310081, 2.294544, 0, 0.854902, 1, 1,
0.1282126, 0.7207072, 0.522505, 0, 0.8509804, 1, 1,
0.1289655, 0.2322808, 0.7304779, 0, 0.8431373, 1, 1,
0.1293593, 1.371034, 0.9425232, 0, 0.8392157, 1, 1,
0.1311188, 0.485917, 1.736984, 0, 0.8313726, 1, 1,
0.1317781, -0.8567601, 4.713283, 0, 0.827451, 1, 1,
0.1365044, 1.880353, 0.9742275, 0, 0.8196079, 1, 1,
0.136529, 0.7532132, 0.8674591, 0, 0.8156863, 1, 1,
0.1401611, -0.5508038, 0.700626, 0, 0.8078431, 1, 1,
0.1404313, -0.5340003, 2.434006, 0, 0.8039216, 1, 1,
0.1434355, 1.421655, 0.05277101, 0, 0.7960784, 1, 1,
0.1473576, 1.534616, 0.02205463, 0, 0.7882353, 1, 1,
0.1536867, -0.2160244, 1.676746, 0, 0.7843137, 1, 1,
0.1546061, -2.683338, 2.380711, 0, 0.7764706, 1, 1,
0.1596677, -1.534963, 1.965732, 0, 0.772549, 1, 1,
0.1604814, 1.014863, 0.1764374, 0, 0.7647059, 1, 1,
0.1619357, 0.1616473, -0.3844102, 0, 0.7607843, 1, 1,
0.1635265, 0.1153042, 1.424625, 0, 0.7529412, 1, 1,
0.1658984, 0.3432395, 1.796705, 0, 0.7490196, 1, 1,
0.166024, 0.2826211, 0.5979408, 0, 0.7411765, 1, 1,
0.1692433, -0.213326, 3.238283, 0, 0.7372549, 1, 1,
0.1712739, -1.675918, 2.69912, 0, 0.7294118, 1, 1,
0.1778815, 0.008728028, 1.48947, 0, 0.7254902, 1, 1,
0.1796318, -1.942588, 3.009216, 0, 0.7176471, 1, 1,
0.1816954, -1.1851, 2.753029, 0, 0.7137255, 1, 1,
0.1818976, 0.7778175, -0.1721893, 0, 0.7058824, 1, 1,
0.1846363, 1.301071, 0.882623, 0, 0.6980392, 1, 1,
0.18479, 2.009418, -1.07779, 0, 0.6941177, 1, 1,
0.1856327, -0.8683747, 2.737505, 0, 0.6862745, 1, 1,
0.18676, -0.9913909, 3.273999, 0, 0.682353, 1, 1,
0.1921005, 0.8527074, 0.9526286, 0, 0.6745098, 1, 1,
0.1941753, 0.1478645, 0.05630488, 0, 0.6705883, 1, 1,
0.1953477, -1.602095, 1.612856, 0, 0.6627451, 1, 1,
0.1963344, 0.8386651, 0.7324897, 0, 0.6588235, 1, 1,
0.1971135, -0.4438382, 4.493085, 0, 0.6509804, 1, 1,
0.1977757, -0.06668446, 2.678029, 0, 0.6470588, 1, 1,
0.1979897, -0.347203, 2.261763, 0, 0.6392157, 1, 1,
0.1992051, 0.8737214, -0.1443501, 0, 0.6352941, 1, 1,
0.2062726, -0.3054518, 3.515157, 0, 0.627451, 1, 1,
0.2075897, -0.5328408, 0.2183265, 0, 0.6235294, 1, 1,
0.2077753, -0.1448664, 3.197411, 0, 0.6156863, 1, 1,
0.2089344, 0.6568988, 0.5953642, 0, 0.6117647, 1, 1,
0.2099583, 1.20537, 0.4390941, 0, 0.6039216, 1, 1,
0.2120356, -0.2052609, 3.517105, 0, 0.5960785, 1, 1,
0.2159241, 0.5254474, -1.092896, 0, 0.5921569, 1, 1,
0.2162576, 0.8399188, 1.064842, 0, 0.5843138, 1, 1,
0.2169345, -0.8679981, 4.660616, 0, 0.5803922, 1, 1,
0.218117, 1.380775, -0.627295, 0, 0.572549, 1, 1,
0.2182995, -1.650851, 3.486539, 0, 0.5686275, 1, 1,
0.2195659, -0.3178937, 1.711911, 0, 0.5607843, 1, 1,
0.2218976, -0.1239391, 3.305237, 0, 0.5568628, 1, 1,
0.2250257, 0.6646411, 0.458026, 0, 0.5490196, 1, 1,
0.225382, 1.688924, 1.150162, 0, 0.5450981, 1, 1,
0.2280599, -1.568599, 3.491099, 0, 0.5372549, 1, 1,
0.2388764, 0.6700283, -1.620497, 0, 0.5333334, 1, 1,
0.240984, 2.236484, 0.9158981, 0, 0.5254902, 1, 1,
0.2446057, -1.478556, 4.601603, 0, 0.5215687, 1, 1,
0.2472849, -0.02142261, -0.1088138, 0, 0.5137255, 1, 1,
0.2581202, 1.810547, 0.8598508, 0, 0.509804, 1, 1,
0.2592395, 0.3500741, 2.026265, 0, 0.5019608, 1, 1,
0.2649831, -0.2731968, 1.663045, 0, 0.4941176, 1, 1,
0.2695742, -0.670635, 2.120333, 0, 0.4901961, 1, 1,
0.2705645, -1.045991, 2.977604, 0, 0.4823529, 1, 1,
0.2784818, 0.1739577, -0.9970179, 0, 0.4784314, 1, 1,
0.2801241, -0.1779799, 1.809956, 0, 0.4705882, 1, 1,
0.2803565, -0.3584649, 2.147192, 0, 0.4666667, 1, 1,
0.281695, -0.7736295, 2.820679, 0, 0.4588235, 1, 1,
0.2822109, 1.23872, 1.973645, 0, 0.454902, 1, 1,
0.2854779, 0.2034285, 0.5530332, 0, 0.4470588, 1, 1,
0.2857967, 0.7966565, 0.244617, 0, 0.4431373, 1, 1,
0.2871164, 1.38543, 0.5347626, 0, 0.4352941, 1, 1,
0.2874371, 1.025069, 0.1695992, 0, 0.4313726, 1, 1,
0.289251, -2.320349, 2.444539, 0, 0.4235294, 1, 1,
0.2945464, -1.627154, 3.332837, 0, 0.4196078, 1, 1,
0.295746, 0.9020427, -0.001561017, 0, 0.4117647, 1, 1,
0.2958344, -0.7230608, 2.234953, 0, 0.4078431, 1, 1,
0.2960697, 0.09429601, 0.7541587, 0, 0.4, 1, 1,
0.2965442, 1.718396, -0.7710912, 0, 0.3921569, 1, 1,
0.2967699, 0.9501615, -0.320649, 0, 0.3882353, 1, 1,
0.2997187, -0.8402283, 3.416064, 0, 0.3803922, 1, 1,
0.3019689, 0.1680083, -0.4180334, 0, 0.3764706, 1, 1,
0.3023571, -1.199996, 0.9847, 0, 0.3686275, 1, 1,
0.3126092, -1.033866, 1.570299, 0, 0.3647059, 1, 1,
0.3174396, -0.987609, 3.522385, 0, 0.3568628, 1, 1,
0.3222394, 0.4716672, 1.56095, 0, 0.3529412, 1, 1,
0.3226658, 1.024551, 0.3583408, 0, 0.345098, 1, 1,
0.323234, -1.845789, -0.4056306, 0, 0.3411765, 1, 1,
0.3238411, 1.001748, 0.5415342, 0, 0.3333333, 1, 1,
0.3244479, 0.9725382, 1.914548, 0, 0.3294118, 1, 1,
0.3279062, 0.949115, 0.7896239, 0, 0.3215686, 1, 1,
0.3285735, -0.7480308, 1.906442, 0, 0.3176471, 1, 1,
0.332211, -1.150632, 3.422769, 0, 0.3098039, 1, 1,
0.3357733, -0.276236, 2.40547, 0, 0.3058824, 1, 1,
0.3371843, -0.4109245, 4.281324, 0, 0.2980392, 1, 1,
0.3376071, -0.8296666, 2.946939, 0, 0.2901961, 1, 1,
0.3383176, 1.347248, 0.8169227, 0, 0.2862745, 1, 1,
0.3389718, 0.5584736, 0.3214758, 0, 0.2784314, 1, 1,
0.3399797, 0.5140557, 3.775441, 0, 0.2745098, 1, 1,
0.3415886, 1.646303, 0.7707776, 0, 0.2666667, 1, 1,
0.344149, -1.53061, 3.04103, 0, 0.2627451, 1, 1,
0.3446052, 0.7395539, 1.574565, 0, 0.254902, 1, 1,
0.3488558, -0.1868661, 1.592357, 0, 0.2509804, 1, 1,
0.349095, 1.01615, 1.734862, 0, 0.2431373, 1, 1,
0.3491342, -0.2326401, 1.749902, 0, 0.2392157, 1, 1,
0.3527987, 1.375886, -0.2451168, 0, 0.2313726, 1, 1,
0.3553097, -0.6161444, 1.854542, 0, 0.227451, 1, 1,
0.3553247, -0.2902437, 0.8990476, 0, 0.2196078, 1, 1,
0.3574785, 2.304732, 0.2791289, 0, 0.2156863, 1, 1,
0.3596962, 0.6274639, 1.705268, 0, 0.2078431, 1, 1,
0.3629645, -0.01050449, 2.326477, 0, 0.2039216, 1, 1,
0.3649046, -0.1098164, 3.020092, 0, 0.1960784, 1, 1,
0.3666705, -1.429114, 1.723299, 0, 0.1882353, 1, 1,
0.3701532, -0.7363248, 4.050903, 0, 0.1843137, 1, 1,
0.3704638, -0.01070014, 2.269005, 0, 0.1764706, 1, 1,
0.377687, -0.04810226, 1.018235, 0, 0.172549, 1, 1,
0.3829842, -0.8954628, 3.21756, 0, 0.1647059, 1, 1,
0.3831588, 1.086598, 1.918707, 0, 0.1607843, 1, 1,
0.3865469, -1.823687, 2.077486, 0, 0.1529412, 1, 1,
0.3866954, -0.4916181, 1.301076, 0, 0.1490196, 1, 1,
0.3869479, -1.016082, 2.497851, 0, 0.1411765, 1, 1,
0.3897644, -1.344102, 1.457044, 0, 0.1372549, 1, 1,
0.3903369, 1.589328, 0.5272708, 0, 0.1294118, 1, 1,
0.3908838, 0.4150049, 1.29854, 0, 0.1254902, 1, 1,
0.3942536, -0.1859816, 2.816478, 0, 0.1176471, 1, 1,
0.3955562, -0.8998488, 1.780305, 0, 0.1137255, 1, 1,
0.3956541, -0.7920558, 3.498717, 0, 0.1058824, 1, 1,
0.3958586, 1.270386, 1.225728, 0, 0.09803922, 1, 1,
0.3965337, -0.6549695, 3.468066, 0, 0.09411765, 1, 1,
0.3966369, -0.7976134, 1.777553, 0, 0.08627451, 1, 1,
0.3981201, -0.1988482, 1.005873, 0, 0.08235294, 1, 1,
0.4017998, -0.2482714, 1.854549, 0, 0.07450981, 1, 1,
0.4031968, 0.03884474, 2.034145, 0, 0.07058824, 1, 1,
0.4072405, 0.5783312, 1.095557, 0, 0.0627451, 1, 1,
0.4089109, -1.586654, 1.832911, 0, 0.05882353, 1, 1,
0.4191048, 0.140224, -0.1094693, 0, 0.05098039, 1, 1,
0.4227979, -0.6135756, 1.509306, 0, 0.04705882, 1, 1,
0.42439, -0.2256576, 2.072267, 0, 0.03921569, 1, 1,
0.4249853, -0.05202963, 2.673547, 0, 0.03529412, 1, 1,
0.4347271, -1.752016, 2.57461, 0, 0.02745098, 1, 1,
0.4375946, -0.695983, 3.68485, 0, 0.02352941, 1, 1,
0.4376433, 0.7034696, -0.5881746, 0, 0.01568628, 1, 1,
0.4388802, -1.831016, 3.820391, 0, 0.01176471, 1, 1,
0.4397736, 0.6449341, -0.9884322, 0, 0.003921569, 1, 1,
0.4448898, 0.9103573, 2.095669, 0.003921569, 0, 1, 1,
0.4452595, -0.4009676, 0.9941779, 0.007843138, 0, 1, 1,
0.4494846, -1.137876, 4.094407, 0.01568628, 0, 1, 1,
0.4553975, -0.6577485, 2.678343, 0.01960784, 0, 1, 1,
0.4622415, -0.6953515, 2.129828, 0.02745098, 0, 1, 1,
0.4630619, 0.1254331, 2.490792, 0.03137255, 0, 1, 1,
0.4757336, -1.565126, 2.200842, 0.03921569, 0, 1, 1,
0.4778445, -0.07222373, 2.9736, 0.04313726, 0, 1, 1,
0.4938591, 2.081908, 0.3406489, 0.05098039, 0, 1, 1,
0.4975314, 0.8731889, 1.39408, 0.05490196, 0, 1, 1,
0.4981374, 0.1139336, 1.30136, 0.0627451, 0, 1, 1,
0.499128, 0.4364256, 0.4356253, 0.06666667, 0, 1, 1,
0.499227, -1.093665, 2.917389, 0.07450981, 0, 1, 1,
0.501792, -2.409261, 1.513533, 0.07843138, 0, 1, 1,
0.5020912, -0.3496424, 1.771847, 0.08627451, 0, 1, 1,
0.5023251, 1.313467, 0.9646583, 0.09019608, 0, 1, 1,
0.5025151, 0.08352168, -0.05519858, 0.09803922, 0, 1, 1,
0.5074013, -0.96372, 1.614284, 0.1058824, 0, 1, 1,
0.51798, -0.07889949, 2.72642, 0.1098039, 0, 1, 1,
0.5190291, -0.9734686, 1.61334, 0.1176471, 0, 1, 1,
0.5223094, -0.3947852, 1.031639, 0.1215686, 0, 1, 1,
0.522733, 1.21063, -0.1828762, 0.1294118, 0, 1, 1,
0.5231126, -1.022652, 4.153933, 0.1333333, 0, 1, 1,
0.5299186, -0.2355774, 2.370098, 0.1411765, 0, 1, 1,
0.5307711, 1.538262, -0.2471709, 0.145098, 0, 1, 1,
0.5334327, -0.7989452, 0.6155566, 0.1529412, 0, 1, 1,
0.5354216, -0.5721612, 3.23799, 0.1568628, 0, 1, 1,
0.5355567, -0.6908157, 2.223691, 0.1647059, 0, 1, 1,
0.5363351, 0.3168782, 0.8068891, 0.1686275, 0, 1, 1,
0.5389323, 0.2467328, 1.501022, 0.1764706, 0, 1, 1,
0.5405942, -0.3158736, 1.728179, 0.1803922, 0, 1, 1,
0.5419737, 0.2436153, 0.6030401, 0.1882353, 0, 1, 1,
0.5424629, 0.9897519, -0.3762833, 0.1921569, 0, 1, 1,
0.5428818, -1.972004, 2.072078, 0.2, 0, 1, 1,
0.5504745, 0.3497263, -0.05007941, 0.2078431, 0, 1, 1,
0.5553817, -0.8176948, 1.69985, 0.2117647, 0, 1, 1,
0.5554596, -2.537815, 3.608392, 0.2196078, 0, 1, 1,
0.5578595, 1.272585, 0.3518988, 0.2235294, 0, 1, 1,
0.5589285, 0.7070605, -0.8344461, 0.2313726, 0, 1, 1,
0.5664245, -0.3646391, 1.968529, 0.2352941, 0, 1, 1,
0.5667298, 0.407296, 2.801171, 0.2431373, 0, 1, 1,
0.570573, -1.379728, 2.729627, 0.2470588, 0, 1, 1,
0.5767847, 0.8173415, 1.222917, 0.254902, 0, 1, 1,
0.5879983, 0.2922172, -0.2902105, 0.2588235, 0, 1, 1,
0.591668, 0.8416042, 2.018426, 0.2666667, 0, 1, 1,
0.5935169, -1.529699, 4.324372, 0.2705882, 0, 1, 1,
0.5937315, -1.485352, 2.483608, 0.2784314, 0, 1, 1,
0.5996313, -0.6110046, 0.7334828, 0.282353, 0, 1, 1,
0.601608, -0.7788877, 2.142599, 0.2901961, 0, 1, 1,
0.601909, 0.9816095, 1.852061, 0.2941177, 0, 1, 1,
0.60338, -1.39336, 3.499352, 0.3019608, 0, 1, 1,
0.6036433, 0.1840704, 0.03928724, 0.3098039, 0, 1, 1,
0.6043186, -0.1247346, 2.2111, 0.3137255, 0, 1, 1,
0.6131831, 0.3167436, 0.7944382, 0.3215686, 0, 1, 1,
0.6150432, 0.1047811, 1.147007, 0.3254902, 0, 1, 1,
0.6157746, 1.821905, 0.5904437, 0.3333333, 0, 1, 1,
0.6201437, -1.686016, 2.09259, 0.3372549, 0, 1, 1,
0.6246839, -0.9426217, 1.911092, 0.345098, 0, 1, 1,
0.6271034, 0.4531756, 0.903425, 0.3490196, 0, 1, 1,
0.629185, -1.339783, 3.956807, 0.3568628, 0, 1, 1,
0.6293315, 1.197346, 1.049877, 0.3607843, 0, 1, 1,
0.6325222, 0.2517045, 2.798793, 0.3686275, 0, 1, 1,
0.6346284, -0.9165509, 2.101876, 0.372549, 0, 1, 1,
0.6418038, 1.61544, -0.7874673, 0.3803922, 0, 1, 1,
0.6422389, -0.5841497, 3.735407, 0.3843137, 0, 1, 1,
0.643497, -0.05264513, 2.261181, 0.3921569, 0, 1, 1,
0.6437192, -1.089785, 1.637935, 0.3960784, 0, 1, 1,
0.6532558, -0.4228878, 1.889642, 0.4039216, 0, 1, 1,
0.6564981, 0.03226805, 0.5087799, 0.4117647, 0, 1, 1,
0.6593053, 0.6177821, 1.172425, 0.4156863, 0, 1, 1,
0.6594758, 0.7835661, 1.511161, 0.4235294, 0, 1, 1,
0.6608523, 0.1133807, 0.9392899, 0.427451, 0, 1, 1,
0.6690754, -1.140687, 1.322973, 0.4352941, 0, 1, 1,
0.6704228, 0.04589275, 1.807039, 0.4392157, 0, 1, 1,
0.6708274, 0.7900121, -0.1906851, 0.4470588, 0, 1, 1,
0.6807463, -0.6523586, 2.179317, 0.4509804, 0, 1, 1,
0.6823474, -0.4089124, 2.298122, 0.4588235, 0, 1, 1,
0.6912549, 0.01444908, 1.621773, 0.4627451, 0, 1, 1,
0.6913112, 0.3133455, 0.2401246, 0.4705882, 0, 1, 1,
0.6915084, -0.695039, 2.239679, 0.4745098, 0, 1, 1,
0.6946265, 1.070986, 1.853556, 0.4823529, 0, 1, 1,
0.6976379, 0.2057319, 0.1191765, 0.4862745, 0, 1, 1,
0.6990768, 0.192876, 2.896926, 0.4941176, 0, 1, 1,
0.7076366, -2.096963, 2.552811, 0.5019608, 0, 1, 1,
0.7127659, 0.541513, 0.6466258, 0.5058824, 0, 1, 1,
0.7131534, -0.5536058, 2.640176, 0.5137255, 0, 1, 1,
0.7162243, 0.08851044, 0.3137462, 0.5176471, 0, 1, 1,
0.7168519, 0.9770526, 2.082875, 0.5254902, 0, 1, 1,
0.717474, -0.0660505, 3.362618, 0.5294118, 0, 1, 1,
0.7222509, 0.9804671, 3.919821, 0.5372549, 0, 1, 1,
0.7266966, -0.4828058, 2.874819, 0.5411765, 0, 1, 1,
0.7275451, 0.7031983, 2.44137, 0.5490196, 0, 1, 1,
0.7283439, -1.466291, 3.210483, 0.5529412, 0, 1, 1,
0.7283459, -0.1672967, 1.885608, 0.5607843, 0, 1, 1,
0.7445564, 1.944611, -0.3178047, 0.5647059, 0, 1, 1,
0.7471331, 0.2159683, -0.5450234, 0.572549, 0, 1, 1,
0.7472883, 0.4717855, 0.9095514, 0.5764706, 0, 1, 1,
0.7510975, -0.1804599, 4.041071, 0.5843138, 0, 1, 1,
0.753374, 2.337731, 0.1898578, 0.5882353, 0, 1, 1,
0.7549791, -0.9123644, 1.53001, 0.5960785, 0, 1, 1,
0.7592406, -0.1017627, 1.376486, 0.6039216, 0, 1, 1,
0.7640335, -0.497272, 1.676858, 0.6078432, 0, 1, 1,
0.7736701, 2.151986, 0.5328534, 0.6156863, 0, 1, 1,
0.7744886, 0.4343117, 1.352785, 0.6196079, 0, 1, 1,
0.7755073, -0.6121067, 2.020495, 0.627451, 0, 1, 1,
0.7783485, -0.04173417, 1.828544, 0.6313726, 0, 1, 1,
0.7801799, -1.076817, 3.340547, 0.6392157, 0, 1, 1,
0.7820882, 0.3989767, 0.1900937, 0.6431373, 0, 1, 1,
0.798381, 0.03198128, 1.617081, 0.6509804, 0, 1, 1,
0.799631, 0.5710717, 0.3034823, 0.654902, 0, 1, 1,
0.8031733, -1.857927, 1.520149, 0.6627451, 0, 1, 1,
0.8035392, -0.9055769, 2.194695, 0.6666667, 0, 1, 1,
0.8038897, 1.039652, 1.330167, 0.6745098, 0, 1, 1,
0.8070963, -0.9131011, 2.033267, 0.6784314, 0, 1, 1,
0.8143183, -0.9382597, 3.284607, 0.6862745, 0, 1, 1,
0.820797, -0.4960988, 3.496957, 0.6901961, 0, 1, 1,
0.825048, 1.316541, -0.4120737, 0.6980392, 0, 1, 1,
0.8272134, -0.644594, 1.736895, 0.7058824, 0, 1, 1,
0.8275593, 1.613266, 0.2834026, 0.7098039, 0, 1, 1,
0.8337331, 0.960211, -0.3057565, 0.7176471, 0, 1, 1,
0.837002, -0.5024232, 2.608675, 0.7215686, 0, 1, 1,
0.841328, 0.06482462, 1.551697, 0.7294118, 0, 1, 1,
0.84161, 0.2009057, 2.403478, 0.7333333, 0, 1, 1,
0.8456613, -0.7850196, 1.87633, 0.7411765, 0, 1, 1,
0.850952, -0.5401349, 1.391777, 0.7450981, 0, 1, 1,
0.8562055, 0.1846177, 2.380686, 0.7529412, 0, 1, 1,
0.8579761, -1.869999, 1.475084, 0.7568628, 0, 1, 1,
0.8618836, -0.1210243, 2.003863, 0.7647059, 0, 1, 1,
0.862465, -1.38613, 2.257328, 0.7686275, 0, 1, 1,
0.867299, -0.1041263, 0.2724, 0.7764706, 0, 1, 1,
0.869686, -0.4327793, 3.113698, 0.7803922, 0, 1, 1,
0.8710122, 0.7329061, 1.036137, 0.7882353, 0, 1, 1,
0.8733718, -0.09380626, 0.6898969, 0.7921569, 0, 1, 1,
0.8756534, -0.5535549, 2.193828, 0.8, 0, 1, 1,
0.8768306, -0.9350287, 3.57047, 0.8078431, 0, 1, 1,
0.8812691, 0.2674357, -0.4373134, 0.8117647, 0, 1, 1,
0.8870686, -0.4851557, 0.6530004, 0.8196079, 0, 1, 1,
0.8893183, -2.069748, 1.726956, 0.8235294, 0, 1, 1,
0.8896189, -2.759173, 3.412117, 0.8313726, 0, 1, 1,
0.899573, -1.744963, 2.603378, 0.8352941, 0, 1, 1,
0.9108364, -0.2460479, 1.336461, 0.8431373, 0, 1, 1,
0.9158251, -0.9301841, 1.293004, 0.8470588, 0, 1, 1,
0.9161853, 0.009360491, 1.505, 0.854902, 0, 1, 1,
0.921056, -0.2265476, 2.355409, 0.8588235, 0, 1, 1,
0.9217901, -0.5544968, 1.553917, 0.8666667, 0, 1, 1,
0.9256718, 0.8427511, 2.743773, 0.8705882, 0, 1, 1,
0.9261469, 2.024823, -0.1462103, 0.8784314, 0, 1, 1,
0.930604, 1.589538, 1.629774, 0.8823529, 0, 1, 1,
0.9319812, 1.277567, 0.8894764, 0.8901961, 0, 1, 1,
0.931987, -0.2219657, 2.545791, 0.8941177, 0, 1, 1,
0.9324654, -1.739697, 3.026994, 0.9019608, 0, 1, 1,
0.9379237, 0.493929, 1.618597, 0.9098039, 0, 1, 1,
0.9390539, -1.224939, 3.743534, 0.9137255, 0, 1, 1,
0.9417224, -1.221165, 2.00753, 0.9215686, 0, 1, 1,
0.9484978, -0.3256849, 1.327384, 0.9254902, 0, 1, 1,
0.9485732, 0.2671284, -0.7921473, 0.9333333, 0, 1, 1,
0.9519479, 0.6361232, 0.2158927, 0.9372549, 0, 1, 1,
0.9565414, -1.117214, 2.879905, 0.945098, 0, 1, 1,
0.9577916, -1.456104, 1.398673, 0.9490196, 0, 1, 1,
0.9590113, -1.022692, 2.039041, 0.9568627, 0, 1, 1,
0.9623031, -0.553543, 2.357444, 0.9607843, 0, 1, 1,
0.9661105, -1.898745, 3.129812, 0.9686275, 0, 1, 1,
0.97701, -0.7673838, 3.59588, 0.972549, 0, 1, 1,
0.9776874, -0.217782, 4.798814, 0.9803922, 0, 1, 1,
0.981205, -0.7438256, 2.108491, 0.9843137, 0, 1, 1,
0.9826676, 0.4827433, 1.517349, 0.9921569, 0, 1, 1,
0.9870178, 1.109934, 0.1626131, 0.9960784, 0, 1, 1,
0.9879739, -0.4213164, 1.988731, 1, 0, 0.9960784, 1,
0.9949709, -0.3635614, 3.711734, 1, 0, 0.9882353, 1,
0.9974459, 1.007756, 1.357459, 1, 0, 0.9843137, 1,
1.001496, -2.495755, 2.803995, 1, 0, 0.9764706, 1,
1.004177, 1.406537, 0.09862934, 1, 0, 0.972549, 1,
1.01725, 0.1974378, 1.626385, 1, 0, 0.9647059, 1,
1.01914, 1.766343, 1.201375, 1, 0, 0.9607843, 1,
1.023337, -0.2944607, 0.7422816, 1, 0, 0.9529412, 1,
1.02404, 0.00448314, 2.315978, 1, 0, 0.9490196, 1,
1.030098, 0.3024993, 0.5091664, 1, 0, 0.9411765, 1,
1.032521, 0.358383, -0.7106813, 1, 0, 0.9372549, 1,
1.033829, 0.7627816, 1.71154, 1, 0, 0.9294118, 1,
1.034457, -0.01526138, 0.7118531, 1, 0, 0.9254902, 1,
1.03836, -0.08916197, -0.1291585, 1, 0, 0.9176471, 1,
1.041664, 0.4139808, 0.3104256, 1, 0, 0.9137255, 1,
1.043103, -0.762128, 1.942261, 1, 0, 0.9058824, 1,
1.04748, -0.8560993, 3.608895, 1, 0, 0.9019608, 1,
1.04854, 0.6484619, 0.9608669, 1, 0, 0.8941177, 1,
1.049927, -0.9241964, 1.275892, 1, 0, 0.8862745, 1,
1.05337, 0.06488357, 2.827864, 1, 0, 0.8823529, 1,
1.063724, 0.9517648, 0.09401712, 1, 0, 0.8745098, 1,
1.075806, 0.851612, 0.4825726, 1, 0, 0.8705882, 1,
1.081112, -0.7550194, 1.360522, 1, 0, 0.8627451, 1,
1.089636, -0.07756957, 4.224246, 1, 0, 0.8588235, 1,
1.102959, -0.1943191, 1.497641, 1, 0, 0.8509804, 1,
1.115427, 0.4541418, 1.225585, 1, 0, 0.8470588, 1,
1.116547, -1.797851, 1.278162, 1, 0, 0.8392157, 1,
1.121859, 2.010994, 1.171664, 1, 0, 0.8352941, 1,
1.128226, -0.3345461, 2.652351, 1, 0, 0.827451, 1,
1.134081, -0.08466059, 0.1373672, 1, 0, 0.8235294, 1,
1.141607, 0.2208411, 1.760282, 1, 0, 0.8156863, 1,
1.14327, -0.001451229, 2.258863, 1, 0, 0.8117647, 1,
1.144537, -2.493331, 2.956582, 1, 0, 0.8039216, 1,
1.14686, 0.8359407, 0.755868, 1, 0, 0.7960784, 1,
1.156076, -0.539351, 1.343997, 1, 0, 0.7921569, 1,
1.162977, -0.8906869, 3.97499, 1, 0, 0.7843137, 1,
1.167592, -0.6625805, 2.278391, 1, 0, 0.7803922, 1,
1.175354, -1.866722, 0.5557982, 1, 0, 0.772549, 1,
1.182234, 0.6840394, 1.485408, 1, 0, 0.7686275, 1,
1.184064, -0.3182054, 2.266047, 1, 0, 0.7607843, 1,
1.187892, 0.7840778, 0.1317004, 1, 0, 0.7568628, 1,
1.203504, 0.6033382, 1.472567, 1, 0, 0.7490196, 1,
1.208568, 0.6951856, -0.2094375, 1, 0, 0.7450981, 1,
1.20904, 0.6638895, 1.732095, 1, 0, 0.7372549, 1,
1.212456, -1.039586, 0.6221789, 1, 0, 0.7333333, 1,
1.221759, 0.5965378, 2.255141, 1, 0, 0.7254902, 1,
1.228062, 0.4327034, 0.786016, 1, 0, 0.7215686, 1,
1.230604, 1.945233, 0.5118234, 1, 0, 0.7137255, 1,
1.230936, 0.1259822, 0.8248046, 1, 0, 0.7098039, 1,
1.239226, 0.5428826, 2.286258, 1, 0, 0.7019608, 1,
1.239683, -0.01039037, -0.04573603, 1, 0, 0.6941177, 1,
1.242714, 0.188486, 2.013798, 1, 0, 0.6901961, 1,
1.256882, -0.5231436, 1.494745, 1, 0, 0.682353, 1,
1.267538, -0.3868553, 0.6847931, 1, 0, 0.6784314, 1,
1.268711, 0.1402912, 1.757111, 1, 0, 0.6705883, 1,
1.270768, 1.575324, 1.164078, 1, 0, 0.6666667, 1,
1.280717, -1.887474, 3.067782, 1, 0, 0.6588235, 1,
1.295272, -0.3082074, 0.3178123, 1, 0, 0.654902, 1,
1.30993, -0.269054, 1.570499, 1, 0, 0.6470588, 1,
1.310373, 0.8372721, 0.7100831, 1, 0, 0.6431373, 1,
1.316081, 0.7783062, 2.505966, 1, 0, 0.6352941, 1,
1.32095, 2.503501, -0.5863681, 1, 0, 0.6313726, 1,
1.322456, -0.02152137, 1.377142, 1, 0, 0.6235294, 1,
1.322761, -0.1290746, 2.46826, 1, 0, 0.6196079, 1,
1.324715, -1.018859, 1.794523, 1, 0, 0.6117647, 1,
1.333119, -1.275612, 2.287471, 1, 0, 0.6078432, 1,
1.340733, 0.1827625, 1.599399, 1, 0, 0.6, 1,
1.346153, 0.4084818, 1.166701, 1, 0, 0.5921569, 1,
1.347388, -0.68365, 2.494504, 1, 0, 0.5882353, 1,
1.349838, 0.3796222, 2.116395, 1, 0, 0.5803922, 1,
1.35012, 0.7827567, 0.6508834, 1, 0, 0.5764706, 1,
1.35228, 1.081625, 1.098457, 1, 0, 0.5686275, 1,
1.364025, -0.7149705, 2.419089, 1, 0, 0.5647059, 1,
1.366243, -1.757644, 3.348005, 1, 0, 0.5568628, 1,
1.368133, 0.1635252, -0.3896702, 1, 0, 0.5529412, 1,
1.375556, -1.352817, 3.177932, 1, 0, 0.5450981, 1,
1.38, -1.148198, 2.527025, 1, 0, 0.5411765, 1,
1.381503, 1.589371, 0.6559884, 1, 0, 0.5333334, 1,
1.391966, -1.083731, 0.7574412, 1, 0, 0.5294118, 1,
1.392973, -0.670082, 1.941114, 1, 0, 0.5215687, 1,
1.39362, 1.202189, 1.341608, 1, 0, 0.5176471, 1,
1.400131, -1.292226, 3.540031, 1, 0, 0.509804, 1,
1.405408, -0.999932, 1.25918, 1, 0, 0.5058824, 1,
1.407947, 1.511766, 2.054703, 1, 0, 0.4980392, 1,
1.413863, 2.08871, 0.02950466, 1, 0, 0.4901961, 1,
1.415689, -2.050963, 2.671217, 1, 0, 0.4862745, 1,
1.417032, -0.8934905, 2.87293, 1, 0, 0.4784314, 1,
1.439186, 0.3048803, 1.494437, 1, 0, 0.4745098, 1,
1.440507, 0.5800421, 0.290377, 1, 0, 0.4666667, 1,
1.444255, -0.8372327, 2.897476, 1, 0, 0.4627451, 1,
1.460801, 0.161924, 2.253827, 1, 0, 0.454902, 1,
1.463463, 1.355962, -0.05627736, 1, 0, 0.4509804, 1,
1.476214, 1.56914, 0.8296001, 1, 0, 0.4431373, 1,
1.487855, -0.06106664, 3.238978, 1, 0, 0.4392157, 1,
1.490955, -2.423355, 2.058997, 1, 0, 0.4313726, 1,
1.494277, -0.274561, 1.521804, 1, 0, 0.427451, 1,
1.498464, 2.000757, 1.943287, 1, 0, 0.4196078, 1,
1.504511, 0.02956562, 1.533807, 1, 0, 0.4156863, 1,
1.523816, -1.484485, 2.904023, 1, 0, 0.4078431, 1,
1.529987, 0.2824795, 0.4082175, 1, 0, 0.4039216, 1,
1.532624, -0.9055658, 3.850739, 1, 0, 0.3960784, 1,
1.536964, -0.3712507, 0.8460815, 1, 0, 0.3882353, 1,
1.538824, -0.4670413, 2.382761, 1, 0, 0.3843137, 1,
1.542571, -0.503539, -0.1094945, 1, 0, 0.3764706, 1,
1.556244, -0.8710852, 4.305734, 1, 0, 0.372549, 1,
1.557178, -0.7264413, 2.601643, 1, 0, 0.3647059, 1,
1.560068, -0.2119659, 2.69047, 1, 0, 0.3607843, 1,
1.562001, -1.007478, 1.973609, 1, 0, 0.3529412, 1,
1.570639, 1.13211, -0.05589233, 1, 0, 0.3490196, 1,
1.57116, -2.076631, 1.880207, 1, 0, 0.3411765, 1,
1.581123, -1.771163, 0.199028, 1, 0, 0.3372549, 1,
1.595217, -0.0817728, 3.310296, 1, 0, 0.3294118, 1,
1.598085, 1.718923, -0.1599955, 1, 0, 0.3254902, 1,
1.60007, -0.2171861, 1.084523, 1, 0, 0.3176471, 1,
1.600677, -0.995208, 2.769222, 1, 0, 0.3137255, 1,
1.628662, -0.1747524, 2.871481, 1, 0, 0.3058824, 1,
1.632394, -1.297275, 2.132682, 1, 0, 0.2980392, 1,
1.635676, -0.5282175, 0.4155734, 1, 0, 0.2941177, 1,
1.64901, -1.688784, 3.115968, 1, 0, 0.2862745, 1,
1.651335, -0.8244355, 1.813897, 1, 0, 0.282353, 1,
1.667482, -1.443393, 3.947661, 1, 0, 0.2745098, 1,
1.66957, -0.9162382, 2.931243, 1, 0, 0.2705882, 1,
1.672749, -1.328572, 1.189722, 1, 0, 0.2627451, 1,
1.676991, -0.08945192, -0.3497534, 1, 0, 0.2588235, 1,
1.689723, 0.4198223, 1.953197, 1, 0, 0.2509804, 1,
1.690359, -0.38182, 1.264565, 1, 0, 0.2470588, 1,
1.69271, 2.00651, -0.4871313, 1, 0, 0.2392157, 1,
1.6945, -0.3123033, 0.7641026, 1, 0, 0.2352941, 1,
1.711983, -0.4130087, 1.635143, 1, 0, 0.227451, 1,
1.716939, -0.1988727, 2.405135, 1, 0, 0.2235294, 1,
1.71859, -1.448385, 1.08587, 1, 0, 0.2156863, 1,
1.721463, -1.000003, 1.739201, 1, 0, 0.2117647, 1,
1.726043, -0.1573209, 2.008256, 1, 0, 0.2039216, 1,
1.741794, 0.6251484, 2.756037, 1, 0, 0.1960784, 1,
1.75474, -0.5457675, 2.552198, 1, 0, 0.1921569, 1,
1.772162, 1.706021, 0.2792691, 1, 0, 0.1843137, 1,
1.799086, -0.4235123, 2.007643, 1, 0, 0.1803922, 1,
1.822432, 1.389766, 2.132327, 1, 0, 0.172549, 1,
1.832875, 1.055793, 1.845501, 1, 0, 0.1686275, 1,
1.885987, -0.5393542, 3.7083, 1, 0, 0.1607843, 1,
1.886474, 0.6290776, 1.789588, 1, 0, 0.1568628, 1,
1.929947, 0.2066865, 1.192169, 1, 0, 0.1490196, 1,
1.93561, -0.3750711, 1.921972, 1, 0, 0.145098, 1,
1.949207, -0.6239507, 1.482274, 1, 0, 0.1372549, 1,
1.959779, -1.090103, 3.297359, 1, 0, 0.1333333, 1,
1.966018, 1.145118, 0.09440389, 1, 0, 0.1254902, 1,
1.988948, -0.5768756, 1.070309, 1, 0, 0.1215686, 1,
2.002888, -1.762611, 2.990529, 1, 0, 0.1137255, 1,
2.034422, 1.825747, 2.642431, 1, 0, 0.1098039, 1,
2.048088, 0.2843096, 1.773587, 1, 0, 0.1019608, 1,
2.066019, -0.3558932, 3.827499, 1, 0, 0.09411765, 1,
2.10755, -0.4202089, 2.046995, 1, 0, 0.09019608, 1,
2.11323, 1.360948, 0.4068274, 1, 0, 0.08235294, 1,
2.135343, -1.821457, 2.422029, 1, 0, 0.07843138, 1,
2.189763, 0.3605627, 1.463876, 1, 0, 0.07058824, 1,
2.319052, 0.4879354, 1.404147, 1, 0, 0.06666667, 1,
2.363142, -1.087311, 1.154301, 1, 0, 0.05882353, 1,
2.429999, 0.6081372, -0.2823848, 1, 0, 0.05490196, 1,
2.4375, 0.4837817, 1.548586, 1, 0, 0.04705882, 1,
2.671005, -1.583952, 1.75098, 1, 0, 0.04313726, 1,
2.77659, -0.2098595, 0.7843093, 1, 0, 0.03529412, 1,
2.807027, 0.1189098, 3.22028, 1, 0, 0.03137255, 1,
2.942991, 0.4320726, 0.6204035, 1, 0, 0.02352941, 1,
3.250782, -0.3196345, 3.834658, 1, 0, 0.01960784, 1,
3.272787, 1.111208, 1.045633, 1, 0, 0.01176471, 1,
3.432229, -0.4412935, 2.145787, 1, 0, 0.007843138, 1
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
0.3588996, -3.721841, -6.866913, 0, -0.5, 0.5, 0.5,
0.3588996, -3.721841, -6.866913, 1, -0.5, 0.5, 0.5,
0.3588996, -3.721841, -6.866913, 1, 1.5, 0.5, 0.5,
0.3588996, -3.721841, -6.866913, 0, 1.5, 0.5, 0.5
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
-3.756289, 0.08055401, -6.866913, 0, -0.5, 0.5, 0.5,
-3.756289, 0.08055401, -6.866913, 1, -0.5, 0.5, 0.5,
-3.756289, 0.08055401, -6.866913, 1, 1.5, 0.5, 0.5,
-3.756289, 0.08055401, -6.866913, 0, 1.5, 0.5, 0.5
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
-3.756289, -3.721841, 0.1194191, 0, -0.5, 0.5, 0.5,
-3.756289, -3.721841, 0.1194191, 1, -0.5, 0.5, 0.5,
-3.756289, -3.721841, 0.1194191, 1, 1.5, 0.5, 0.5,
-3.756289, -3.721841, 0.1194191, 0, 1.5, 0.5, 0.5
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
-2, -2.844365, -5.254683,
3, -2.844365, -5.254683,
-2, -2.844365, -5.254683,
-2, -2.990611, -5.523388,
-1, -2.844365, -5.254683,
-1, -2.990611, -5.523388,
0, -2.844365, -5.254683,
0, -2.990611, -5.523388,
1, -2.844365, -5.254683,
1, -2.990611, -5.523388,
2, -2.844365, -5.254683,
2, -2.990611, -5.523388,
3, -2.844365, -5.254683,
3, -2.990611, -5.523388
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
-2, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
-2, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
-2, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
-2, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5,
-1, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
-1, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
-1, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
-1, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5,
0, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
0, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
0, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
0, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5,
1, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
1, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
1, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
1, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5,
2, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
2, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
2, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
2, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5,
3, -3.283103, -6.060798, 0, -0.5, 0.5, 0.5,
3, -3.283103, -6.060798, 1, -0.5, 0.5, 0.5,
3, -3.283103, -6.060798, 1, 1.5, 0.5, 0.5,
3, -3.283103, -6.060798, 0, 1.5, 0.5, 0.5
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
-2.80663, -2, -5.254683,
-2.80663, 2, -5.254683,
-2.80663, -2, -5.254683,
-2.964906, -2, -5.523388,
-2.80663, -1, -5.254683,
-2.964906, -1, -5.523388,
-2.80663, 0, -5.254683,
-2.964906, 0, -5.523388,
-2.80663, 1, -5.254683,
-2.964906, 1, -5.523388,
-2.80663, 2, -5.254683,
-2.964906, 2, -5.523388
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
-3.281459, -2, -6.060798, 0, -0.5, 0.5, 0.5,
-3.281459, -2, -6.060798, 1, -0.5, 0.5, 0.5,
-3.281459, -2, -6.060798, 1, 1.5, 0.5, 0.5,
-3.281459, -2, -6.060798, 0, 1.5, 0.5, 0.5,
-3.281459, -1, -6.060798, 0, -0.5, 0.5, 0.5,
-3.281459, -1, -6.060798, 1, -0.5, 0.5, 0.5,
-3.281459, -1, -6.060798, 1, 1.5, 0.5, 0.5,
-3.281459, -1, -6.060798, 0, 1.5, 0.5, 0.5,
-3.281459, 0, -6.060798, 0, -0.5, 0.5, 0.5,
-3.281459, 0, -6.060798, 1, -0.5, 0.5, 0.5,
-3.281459, 0, -6.060798, 1, 1.5, 0.5, 0.5,
-3.281459, 0, -6.060798, 0, 1.5, 0.5, 0.5,
-3.281459, 1, -6.060798, 0, -0.5, 0.5, 0.5,
-3.281459, 1, -6.060798, 1, -0.5, 0.5, 0.5,
-3.281459, 1, -6.060798, 1, 1.5, 0.5, 0.5,
-3.281459, 1, -6.060798, 0, 1.5, 0.5, 0.5,
-3.281459, 2, -6.060798, 0, -0.5, 0.5, 0.5,
-3.281459, 2, -6.060798, 1, -0.5, 0.5, 0.5,
-3.281459, 2, -6.060798, 1, 1.5, 0.5, 0.5,
-3.281459, 2, -6.060798, 0, 1.5, 0.5, 0.5
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
-2.80663, -2.844365, -4,
-2.80663, -2.844365, 4,
-2.80663, -2.844365, -4,
-2.964906, -2.990611, -4,
-2.80663, -2.844365, -2,
-2.964906, -2.990611, -2,
-2.80663, -2.844365, 0,
-2.964906, -2.990611, 0,
-2.80663, -2.844365, 2,
-2.964906, -2.990611, 2,
-2.80663, -2.844365, 4,
-2.964906, -2.990611, 4
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
-3.281459, -3.283103, -4, 0, -0.5, 0.5, 0.5,
-3.281459, -3.283103, -4, 1, -0.5, 0.5, 0.5,
-3.281459, -3.283103, -4, 1, 1.5, 0.5, 0.5,
-3.281459, -3.283103, -4, 0, 1.5, 0.5, 0.5,
-3.281459, -3.283103, -2, 0, -0.5, 0.5, 0.5,
-3.281459, -3.283103, -2, 1, -0.5, 0.5, 0.5,
-3.281459, -3.283103, -2, 1, 1.5, 0.5, 0.5,
-3.281459, -3.283103, -2, 0, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 0, 0, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 0, 1, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 0, 1, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 0, 0, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 2, 0, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 2, 1, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 2, 1, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 2, 0, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 4, 0, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 4, 1, -0.5, 0.5, 0.5,
-3.281459, -3.283103, 4, 1, 1.5, 0.5, 0.5,
-3.281459, -3.283103, 4, 0, 1.5, 0.5, 0.5
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
-2.80663, -2.844365, -5.254683,
-2.80663, 3.005473, -5.254683,
-2.80663, -2.844365, 5.493521,
-2.80663, 3.005473, 5.493521,
-2.80663, -2.844365, -5.254683,
-2.80663, -2.844365, 5.493521,
-2.80663, 3.005473, -5.254683,
-2.80663, 3.005473, 5.493521,
-2.80663, -2.844365, -5.254683,
3.524429, -2.844365, -5.254683,
-2.80663, -2.844365, 5.493521,
3.524429, -2.844365, 5.493521,
-2.80663, 3.005473, -5.254683,
3.524429, 3.005473, -5.254683,
-2.80663, 3.005473, 5.493521,
3.524429, 3.005473, 5.493521,
3.524429, -2.844365, -5.254683,
3.524429, 3.005473, -5.254683,
3.524429, -2.844365, 5.493521,
3.524429, 3.005473, 5.493521,
3.524429, -2.844365, -5.254683,
3.524429, -2.844365, 5.493521,
3.524429, 3.005473, -5.254683,
3.524429, 3.005473, 5.493521
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
var radius = 7.357059;
var distance = 32.73238;
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
mvMatrix.translate( -0.3588996, -0.08055401, -0.1194191 );
mvMatrix.scale( 1.25644, 1.359798, 0.7400861 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.73238);
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
oxadiazon_2-tert-but<-read.table("oxadiazon_2-tert-but.xyz")
```

```
## Error in read.table("oxadiazon_2-tert-but.xyz"): no lines available in input
```

```r
x<-oxadiazon_2-tert-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
```

```r
y<-oxadiazon_2-tert-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
```

```r
z<-oxadiazon_2-tert-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
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
-2.71443, -0.4368295, -1.773308, 0, 0, 1, 1, 1,
-2.624114, 0.1324522, -2.92657, 1, 0, 0, 1, 1,
-2.382722, 0.2432452, -0.6078465, 1, 0, 0, 1, 1,
-2.349756, 1.492363, -1.831295, 1, 0, 0, 1, 1,
-2.332143, 1.389997, -0.5618945, 1, 0, 0, 1, 1,
-2.324371, 0.2501898, -2.964381, 1, 0, 0, 1, 1,
-2.292065, -1.112821, -2.022517, 0, 0, 0, 1, 1,
-2.238683, 1.246515, -0.1576451, 0, 0, 0, 1, 1,
-2.21663, -0.9192601, -2.970966, 0, 0, 0, 1, 1,
-2.182429, 0.130304, -1.217526, 0, 0, 0, 1, 1,
-2.173635, 0.7526085, -2.558734, 0, 0, 0, 1, 1,
-2.166997, -0.07929318, -2.790189, 0, 0, 0, 1, 1,
-2.155245, 0.3891128, -1.483339, 0, 0, 0, 1, 1,
-2.151487, 0.6074393, -2.823077, 1, 1, 1, 1, 1,
-2.122425, -0.04068676, -1.465877, 1, 1, 1, 1, 1,
-2.107017, 1.384036, -3.559988, 1, 1, 1, 1, 1,
-2.093134, 0.7482643, -0.1572531, 1, 1, 1, 1, 1,
-2.079576, -1.09311, -3.466913, 1, 1, 1, 1, 1,
-2.065247, -1.08487, -2.215139, 1, 1, 1, 1, 1,
-2.048109, 0.548741, -0.8517786, 1, 1, 1, 1, 1,
-2.032502, -1.301498, -2.801527, 1, 1, 1, 1, 1,
-2.014316, -0.6100026, -1.96848, 1, 1, 1, 1, 1,
-1.971419, -0.3957734, -0.5427057, 1, 1, 1, 1, 1,
-1.956709, 1.2937, -0.772391, 1, 1, 1, 1, 1,
-1.954994, 0.7532204, -0.8965504, 1, 1, 1, 1, 1,
-1.940406, -0.4743417, -1.069352, 1, 1, 1, 1, 1,
-1.920493, 1.208824, -1.276648, 1, 1, 1, 1, 1,
-1.887823, 0.1372386, -1.546885, 1, 1, 1, 1, 1,
-1.881316, -1.771983, -2.668863, 0, 0, 1, 1, 1,
-1.878837, -1.109733, -2.004326, 1, 0, 0, 1, 1,
-1.856507, 0.06577516, -0.8799563, 1, 0, 0, 1, 1,
-1.839956, 0.5075603, -1.62908, 1, 0, 0, 1, 1,
-1.81209, 2.204529, -1.516723, 1, 0, 0, 1, 1,
-1.801159, 1.819008, -1.615624, 1, 0, 0, 1, 1,
-1.789436, -0.5100364, -3.536618, 0, 0, 0, 1, 1,
-1.776177, 1.320264, -1.802477, 0, 0, 0, 1, 1,
-1.756812, -2.074242, -1.473037, 0, 0, 0, 1, 1,
-1.753545, 0.09106638, -2.753604, 0, 0, 0, 1, 1,
-1.750221, -0.03847214, -3.470558, 0, 0, 0, 1, 1,
-1.749931, 2.920281, 1.024, 0, 0, 0, 1, 1,
-1.748219, -0.6881157, -2.708843, 0, 0, 0, 1, 1,
-1.713156, -1.207843, -3.689243, 1, 1, 1, 1, 1,
-1.705746, -0.2962561, -0.8432029, 1, 1, 1, 1, 1,
-1.674804, -0.8828711, -2.741498, 1, 1, 1, 1, 1,
-1.655633, -0.5253038, -2.127791, 1, 1, 1, 1, 1,
-1.651337, -0.03292722, -0.9870917, 1, 1, 1, 1, 1,
-1.646965, -1.322765, -1.401377, 1, 1, 1, 1, 1,
-1.638906, -0.3901741, -1.380226, 1, 1, 1, 1, 1,
-1.634798, -0.8245369, -1.541761, 1, 1, 1, 1, 1,
-1.624986, -0.02809577, -0.6642192, 1, 1, 1, 1, 1,
-1.614187, -1.336454, -0.5817093, 1, 1, 1, 1, 1,
-1.598109, -0.04529687, -0.7828156, 1, 1, 1, 1, 1,
-1.572631, 0.8936828, -0.8474569, 1, 1, 1, 1, 1,
-1.569226, 2.648747, -2.562591, 1, 1, 1, 1, 1,
-1.567451, 0.3913573, -2.293417, 1, 1, 1, 1, 1,
-1.558854, 0.130413, -2.842397, 1, 1, 1, 1, 1,
-1.556229, -1.125187, -0.2634127, 0, 0, 1, 1, 1,
-1.552325, -0.1110358, -3.021295, 1, 0, 0, 1, 1,
-1.551169, 1.092928, 0.3474586, 1, 0, 0, 1, 1,
-1.546808, -1.262933, -0.6247385, 1, 0, 0, 1, 1,
-1.546277, -0.5813439, -1.341213, 1, 0, 0, 1, 1,
-1.543656, -1.043635, -3.225522, 1, 0, 0, 1, 1,
-1.532582, 0.5190892, -1.669074, 0, 0, 0, 1, 1,
-1.527699, 0.7973999, -0.770067, 0, 0, 0, 1, 1,
-1.523748, -0.1129279, -2.753613, 0, 0, 0, 1, 1,
-1.51694, 0.7001789, -2.390772, 0, 0, 0, 1, 1,
-1.507208, 1.840956, 0.1720676, 0, 0, 0, 1, 1,
-1.503322, 0.1449167, -1.821682, 0, 0, 0, 1, 1,
-1.494949, 1.529086, -1.386744, 0, 0, 0, 1, 1,
-1.490193, -0.5522262, -2.201115, 1, 1, 1, 1, 1,
-1.479569, 0.1986631, -0.1848572, 1, 1, 1, 1, 1,
-1.477625, -0.4585469, -3.077106, 1, 1, 1, 1, 1,
-1.476202, -0.4402851, -1.047227, 1, 1, 1, 1, 1,
-1.470177, 0.3905687, -2.157471, 1, 1, 1, 1, 1,
-1.466464, -1.636102, -2.576729, 1, 1, 1, 1, 1,
-1.459291, -1.071325, -0.6609216, 1, 1, 1, 1, 1,
-1.444076, -2.061518, -2.035743, 1, 1, 1, 1, 1,
-1.440738, 0.03169912, -2.300385, 1, 1, 1, 1, 1,
-1.430605, -1.583317, -2.990989, 1, 1, 1, 1, 1,
-1.428158, 0.1556553, -0.9351426, 1, 1, 1, 1, 1,
-1.427936, 0.9293103, -1.831132, 1, 1, 1, 1, 1,
-1.424331, 1.006873, -0.2560578, 1, 1, 1, 1, 1,
-1.423625, 0.4051174, -2.696867, 1, 1, 1, 1, 1,
-1.419459, 1.047696, -0.07008315, 1, 1, 1, 1, 1,
-1.402564, 0.5543581, -0.9306683, 0, 0, 1, 1, 1,
-1.396539, -1.083259, -1.560892, 1, 0, 0, 1, 1,
-1.389008, 1.916342, -0.4939547, 1, 0, 0, 1, 1,
-1.381715, -0.9728316, -2.364529, 1, 0, 0, 1, 1,
-1.372436, 0.5543598, -1.389728, 1, 0, 0, 1, 1,
-1.367007, -1.484144, -3.995731, 1, 0, 0, 1, 1,
-1.365348, 0.2292453, -1.033517, 0, 0, 0, 1, 1,
-1.353887, -0.3719904, -2.18462, 0, 0, 0, 1, 1,
-1.345846, 1.106118, -1.797514, 0, 0, 0, 1, 1,
-1.332967, 0.15797, -2.243403, 0, 0, 0, 1, 1,
-1.325004, 0.3102833, -2.549585, 0, 0, 0, 1, 1,
-1.322071, 0.6076139, -0.7965932, 0, 0, 0, 1, 1,
-1.318635, -0.9600799, -2.200049, 0, 0, 0, 1, 1,
-1.317663, -1.337905, -3.855612, 1, 1, 1, 1, 1,
-1.312331, -0.756062, -1.269888, 1, 1, 1, 1, 1,
-1.290222, 0.3293747, -1.777376, 1, 1, 1, 1, 1,
-1.281422, 0.9450538, 2.08773, 1, 1, 1, 1, 1,
-1.275588, -0.8821219, -3.274567, 1, 1, 1, 1, 1,
-1.269023, 0.3952779, -1.354387, 1, 1, 1, 1, 1,
-1.264292, 0.7559974, -1.318629, 1, 1, 1, 1, 1,
-1.246403, -0.8148097, -3.126294, 1, 1, 1, 1, 1,
-1.244664, -2.277766, -2.077028, 1, 1, 1, 1, 1,
-1.233837, -0.3867085, -2.396942, 1, 1, 1, 1, 1,
-1.21877, -0.2574076, -0.2221258, 1, 1, 1, 1, 1,
-1.213246, 0.6910251, -1.060992, 1, 1, 1, 1, 1,
-1.204159, 0.672973, -1.196128, 1, 1, 1, 1, 1,
-1.185605, 0.8494386, -1.100382, 1, 1, 1, 1, 1,
-1.184317, -1.431971, -3.725853, 1, 1, 1, 1, 1,
-1.175604, 1.442911, -1.107742, 0, 0, 1, 1, 1,
-1.158578, 1.338613, 0.3224677, 1, 0, 0, 1, 1,
-1.157927, 0.4759648, 0.5445502, 1, 0, 0, 1, 1,
-1.154133, 2.045031, 1.045391, 1, 0, 0, 1, 1,
-1.145226, -1.72673, -1.446853, 1, 0, 0, 1, 1,
-1.144545, -0.959377, -1.946366, 1, 0, 0, 1, 1,
-1.132899, 0.2280628, -2.318667, 0, 0, 0, 1, 1,
-1.127553, 0.8099738, -1.537991, 0, 0, 0, 1, 1,
-1.122233, -0.3541117, -2.907844, 0, 0, 0, 1, 1,
-1.10515, 0.01265316, -2.028472, 0, 0, 0, 1, 1,
-1.103518, 0.8605525, -0.5018329, 0, 0, 0, 1, 1,
-1.101951, -1.19471, -2.729611, 0, 0, 0, 1, 1,
-1.09488, -1.549456, -4.08191, 0, 0, 0, 1, 1,
-1.079649, 0.2607259, -1.363411, 1, 1, 1, 1, 1,
-1.078528, 0.7941606, -1.987245, 1, 1, 1, 1, 1,
-1.078103, -0.9491255, -0.8689829, 1, 1, 1, 1, 1,
-1.073246, 0.4886032, -1.521939, 1, 1, 1, 1, 1,
-1.071566, -0.01755073, -0.1782268, 1, 1, 1, 1, 1,
-1.069677, 1.243109, -0.7563445, 1, 1, 1, 1, 1,
-1.065095, 0.4705361, -2.562398, 1, 1, 1, 1, 1,
-1.062985, -0.1477598, -2.708962, 1, 1, 1, 1, 1,
-1.060427, 0.3499499, -0.2667046, 1, 1, 1, 1, 1,
-1.058992, -0.8745874, -1.784375, 1, 1, 1, 1, 1,
-1.056837, -0.4246184, -2.075125, 1, 1, 1, 1, 1,
-1.055106, 0.3780227, -1.245052, 1, 1, 1, 1, 1,
-1.046147, -1.606807, -3.181972, 1, 1, 1, 1, 1,
-1.023954, -0.6939234, -2.213924, 1, 1, 1, 1, 1,
-1.021806, -0.4060622, -2.03522, 1, 1, 1, 1, 1,
-1.017238, 0.8895679, -1.451995, 0, 0, 1, 1, 1,
-1.011547, 2.029453, 1.143273, 1, 0, 0, 1, 1,
-1.007747, -0.8235406, -2.969893, 1, 0, 0, 1, 1,
-1.007146, 0.05795209, -2.072369, 1, 0, 0, 1, 1,
-1.004718, -0.7348101, -1.528383, 1, 0, 0, 1, 1,
-1.004426, -0.6052758, -2.779659, 1, 0, 0, 1, 1,
-1.00316, -1.868976, -1.875757, 0, 0, 0, 1, 1,
-1.002224, 0.5175942, -1.412854, 0, 0, 0, 1, 1,
-1.000631, -0.7759871, -1.606617, 0, 0, 0, 1, 1,
-1.000384, -0.1444635, -1.09574, 0, 0, 0, 1, 1,
-0.9973011, -2.028812, -2.305222, 0, 0, 0, 1, 1,
-0.9969049, -0.06454697, -1.418271, 0, 0, 0, 1, 1,
-0.9955824, 0.2341731, -1.465509, 0, 0, 0, 1, 1,
-0.9874181, -1.727257, -2.992898, 1, 1, 1, 1, 1,
-0.9743525, -1.764648, -3.040712, 1, 1, 1, 1, 1,
-0.9738616, 0.5648057, -0.7089511, 1, 1, 1, 1, 1,
-0.9635579, -0.7768878, -3.191086, 1, 1, 1, 1, 1,
-0.9486913, -0.03576609, -1.222773, 1, 1, 1, 1, 1,
-0.941144, -1.053556, -1.500504, 1, 1, 1, 1, 1,
-0.9382148, 0.3808826, 0.13457, 1, 1, 1, 1, 1,
-0.9304099, 1.069676, -1.713716, 1, 1, 1, 1, 1,
-0.9219404, 1.782269, -0.6563341, 1, 1, 1, 1, 1,
-0.9211111, 0.08262886, -2.285502, 1, 1, 1, 1, 1,
-0.9190474, -0.6945675, -3.384418, 1, 1, 1, 1, 1,
-0.9170347, 1.345721, -1.080679, 1, 1, 1, 1, 1,
-0.9137549, 2.343262, -0.7547016, 1, 1, 1, 1, 1,
-0.9085476, 0.1099189, -1.308313, 1, 1, 1, 1, 1,
-0.9074829, -1.153255, -1.604123, 1, 1, 1, 1, 1,
-0.9055761, 0.5654723, -1.949212, 0, 0, 1, 1, 1,
-0.8898087, 1.058235, 0.08101207, 1, 0, 0, 1, 1,
-0.8882251, 0.3829872, 0.8925603, 1, 0, 0, 1, 1,
-0.8848329, 1.354006, -0.6434056, 1, 0, 0, 1, 1,
-0.8834642, -0.7892922, -4.233128, 1, 0, 0, 1, 1,
-0.8777529, 1.164061, 0.7860634, 1, 0, 0, 1, 1,
-0.8765722, -0.8266092, -2.862495, 0, 0, 0, 1, 1,
-0.8731983, 0.7528948, -1.219714, 0, 0, 0, 1, 1,
-0.8724324, -0.9114162, -1.959697, 0, 0, 0, 1, 1,
-0.8704306, 2.05407, 0.7268417, 0, 0, 0, 1, 1,
-0.8639673, 1.041867, -1.211747, 0, 0, 0, 1, 1,
-0.8613629, -1.158914, -0.8077304, 0, 0, 0, 1, 1,
-0.8597346, -1.442315, -2.086548, 0, 0, 0, 1, 1,
-0.8491159, 0.7880527, -1.087134, 1, 1, 1, 1, 1,
-0.8392501, -2.050586, -2.679472, 1, 1, 1, 1, 1,
-0.8233989, 1.965623, 0.510895, 1, 1, 1, 1, 1,
-0.8205475, 0.3043649, -0.5885399, 1, 1, 1, 1, 1,
-0.8134226, 0.4283361, -1.390053, 1, 1, 1, 1, 1,
-0.8097752, 0.3997905, -1.443264, 1, 1, 1, 1, 1,
-0.807852, 0.4991767, -0.4282697, 1, 1, 1, 1, 1,
-0.8078108, 0.9964648, -0.4066386, 1, 1, 1, 1, 1,
-0.7984059, 1.129511, -2.769176, 1, 1, 1, 1, 1,
-0.7812634, 0.1609595, -2.710495, 1, 1, 1, 1, 1,
-0.7547166, -2.576698, -3.474591, 1, 1, 1, 1, 1,
-0.7506797, 1.057746, -0.03424203, 1, 1, 1, 1, 1,
-0.750611, -0.5482444, -2.028515, 1, 1, 1, 1, 1,
-0.7461424, 0.8890445, -2.496888, 1, 1, 1, 1, 1,
-0.7451844, -0.7271017, -2.427528, 1, 1, 1, 1, 1,
-0.7422804, -1.163414, -2.889297, 0, 0, 1, 1, 1,
-0.7377203, 0.8779836, 0.9952579, 1, 0, 0, 1, 1,
-0.7353671, -0.2867811, -2.908875, 1, 0, 0, 1, 1,
-0.7343808, 0.608352, -1.98091, 1, 0, 0, 1, 1,
-0.7327485, -1.01892, -3.881169, 1, 0, 0, 1, 1,
-0.7214628, -0.7968719, -1.810082, 1, 0, 0, 1, 1,
-0.7163008, -0.9971656, -1.895573, 0, 0, 0, 1, 1,
-0.7144471, 1.501917, -0.614271, 0, 0, 0, 1, 1,
-0.7064902, -1.577924, -2.470384, 0, 0, 0, 1, 1,
-0.7059857, -0.05938299, -0.4198134, 0, 0, 0, 1, 1,
-0.7058662, 0.1366383, 0.5225418, 0, 0, 0, 1, 1,
-0.7001619, -0.0442517, -1.876495, 0, 0, 0, 1, 1,
-0.6793149, 0.4288686, -0.06275633, 0, 0, 0, 1, 1,
-0.6771669, 0.9977491, -0.3745829, 1, 1, 1, 1, 1,
-0.6766768, 0.104305, -1.963445, 1, 1, 1, 1, 1,
-0.6757234, -0.5885628, -1.194557, 1, 1, 1, 1, 1,
-0.6661254, -0.1311549, -2.275484, 1, 1, 1, 1, 1,
-0.6658909, -0.3396594, -0.6950592, 1, 1, 1, 1, 1,
-0.6620625, -1.63154, -2.586052, 1, 1, 1, 1, 1,
-0.6582962, 1.204186, -1.163713, 1, 1, 1, 1, 1,
-0.6568126, -1.214733, -2.280893, 1, 1, 1, 1, 1,
-0.6567243, -0.7540815, -4.013162, 1, 1, 1, 1, 1,
-0.6528037, -0.4975572, -1.808145, 1, 1, 1, 1, 1,
-0.6436195, -0.1278065, -2.851667, 1, 1, 1, 1, 1,
-0.6418011, -0.09506725, -1.516977, 1, 1, 1, 1, 1,
-0.6399852, -1.07617, -3.211464, 1, 1, 1, 1, 1,
-0.6388147, 1.368757, 0.6905379, 1, 1, 1, 1, 1,
-0.6313323, -0.5186108, -2.725878, 1, 1, 1, 1, 1,
-0.6302581, -0.1681972, -1.857862, 0, 0, 1, 1, 1,
-0.6295502, 0.07901861, -0.9828988, 1, 0, 0, 1, 1,
-0.6295255, -0.2467892, -1.777995, 1, 0, 0, 1, 1,
-0.6272988, 2.692891, -1.021379, 1, 0, 0, 1, 1,
-0.625571, 0.2880266, -0.4836801, 1, 0, 0, 1, 1,
-0.6218675, 1.633152, -0.07570963, 1, 0, 0, 1, 1,
-0.6197653, 0.7507406, 0.8837547, 0, 0, 0, 1, 1,
-0.618556, 0.3395374, -1.866479, 0, 0, 0, 1, 1,
-0.6131724, 0.7460942, 0.6341767, 0, 0, 0, 1, 1,
-0.6076176, -1.304852, -3.213145, 0, 0, 0, 1, 1,
-0.6069352, -1.492894, -2.682142, 0, 0, 0, 1, 1,
-0.6045122, 0.7375705, -1.256677, 0, 0, 0, 1, 1,
-0.6026459, -0.5964462, -3.357364, 0, 0, 0, 1, 1,
-0.6005964, -0.8439689, -1.733688, 1, 1, 1, 1, 1,
-0.5989652, -1.721261, -1.800186, 1, 1, 1, 1, 1,
-0.5970612, 0.6018435, 0.6218533, 1, 1, 1, 1, 1,
-0.5939811, 0.3282238, -1.91979, 1, 1, 1, 1, 1,
-0.5889194, -0.3527819, -2.359774, 1, 1, 1, 1, 1,
-0.5878724, -1.428004, -2.98852, 1, 1, 1, 1, 1,
-0.5875718, -0.6023644, -3.182746, 1, 1, 1, 1, 1,
-0.5847986, -1.905892, -1.958653, 1, 1, 1, 1, 1,
-0.5820638, -0.4414363, -0.9441637, 1, 1, 1, 1, 1,
-0.5809892, -1.052116, -0.9836981, 1, 1, 1, 1, 1,
-0.5808651, -1.073833, -4.320066, 1, 1, 1, 1, 1,
-0.580724, -1.225026, -2.872097, 1, 1, 1, 1, 1,
-0.5749007, -1.190058, -1.801474, 1, 1, 1, 1, 1,
-0.5706394, 1.073189, -0.04118426, 1, 1, 1, 1, 1,
-0.5684238, 0.8343929, -2.152012, 1, 1, 1, 1, 1,
-0.5679464, 1.939805, -1.056409, 0, 0, 1, 1, 1,
-0.5662712, -0.9751456, -2.583136, 1, 0, 0, 1, 1,
-0.5610682, 0.6586215, -0.8990053, 1, 0, 0, 1, 1,
-0.5562299, 0.2981763, -0.8036641, 1, 0, 0, 1, 1,
-0.5542693, 0.1898718, -0.9703166, 1, 0, 0, 1, 1,
-0.5517264, 0.05539954, -2.65666, 1, 0, 0, 1, 1,
-0.5482072, -0.9668986, -2.16117, 0, 0, 0, 1, 1,
-0.5466737, -0.07590485, -1.425398, 0, 0, 0, 1, 1,
-0.5465496, -0.7058262, -3.452115, 0, 0, 0, 1, 1,
-0.5348368, 0.6066136, -1.833522, 0, 0, 0, 1, 1,
-0.5320362, 0.3824278, -0.42559, 0, 0, 0, 1, 1,
-0.524151, 0.4871019, -0.9584017, 0, 0, 0, 1, 1,
-0.5229318, 0.4553006, -0.09337907, 0, 0, 0, 1, 1,
-0.5220705, 0.3217097, -1.988061, 1, 1, 1, 1, 1,
-0.517663, 0.2039225, -2.399119, 1, 1, 1, 1, 1,
-0.5156123, -1.417855, -2.96829, 1, 1, 1, 1, 1,
-0.5111177, -0.8195964, -2.54666, 1, 1, 1, 1, 1,
-0.5053562, -0.1661907, -1.058606, 1, 1, 1, 1, 1,
-0.4997732, 1.134915, -0.3239334, 1, 1, 1, 1, 1,
-0.4979324, 0.01090456, -0.2990793, 1, 1, 1, 1, 1,
-0.4970047, -0.8837995, -2.704765, 1, 1, 1, 1, 1,
-0.4964727, 0.5960652, -1.052925, 1, 1, 1, 1, 1,
-0.4945558, 0.9316772, -1.344432, 1, 1, 1, 1, 1,
-0.4920961, -0.9403496, -3.855706, 1, 1, 1, 1, 1,
-0.4906485, 1.505828, -2.358329, 1, 1, 1, 1, 1,
-0.4904195, 0.5562695, -0.2140445, 1, 1, 1, 1, 1,
-0.4895221, -0.79777, -2.589979, 1, 1, 1, 1, 1,
-0.4888027, -0.7445073, -2.969363, 1, 1, 1, 1, 1,
-0.4877527, -0.6253155, -3.101137, 0, 0, 1, 1, 1,
-0.4876553, -0.4723017, -4.302462, 1, 0, 0, 1, 1,
-0.4850305, 0.9699671, -0.4200684, 1, 0, 0, 1, 1,
-0.4835061, 0.8803083, 0.1587987, 1, 0, 0, 1, 1,
-0.4833599, 0.6786559, 0.005541082, 1, 0, 0, 1, 1,
-0.4788603, -0.1509257, -2.594796, 1, 0, 0, 1, 1,
-0.477946, 0.8602105, -1.109235, 0, 0, 0, 1, 1,
-0.473491, 0.1169253, -0.2042518, 0, 0, 0, 1, 1,
-0.4724531, -0.7535328, -2.59199, 0, 0, 0, 1, 1,
-0.4714942, -1.060504, -2.938482, 0, 0, 0, 1, 1,
-0.4697651, -0.428299, -1.807677, 0, 0, 0, 1, 1,
-0.4673959, -0.5980254, -2.036633, 0, 0, 0, 1, 1,
-0.4663949, -0.3119811, -1.500337, 0, 0, 0, 1, 1,
-0.4640269, 0.5498419, -0.3563996, 1, 1, 1, 1, 1,
-0.4624977, -0.4544458, -1.840439, 1, 1, 1, 1, 1,
-0.4616304, -0.04490985, -1.515767, 1, 1, 1, 1, 1,
-0.4588669, -0.1301878, -2.543082, 1, 1, 1, 1, 1,
-0.4585669, 0.118201, -0.8843822, 1, 1, 1, 1, 1,
-0.45788, -0.3188787, -2.052348, 1, 1, 1, 1, 1,
-0.4539258, -0.3562164, -2.406556, 1, 1, 1, 1, 1,
-0.4522365, -0.6044058, -2.757029, 1, 1, 1, 1, 1,
-0.4475096, -0.02590879, -0.7212363, 1, 1, 1, 1, 1,
-0.4449608, -1.011006, -3.31972, 1, 1, 1, 1, 1,
-0.4449136, 0.02237172, 1.446652, 1, 1, 1, 1, 1,
-0.4430863, 1.093647, 0.9271314, 1, 1, 1, 1, 1,
-0.4332957, 0.5885741, -2.201308, 1, 1, 1, 1, 1,
-0.4295481, -0.6213071, -2.327096, 1, 1, 1, 1, 1,
-0.4251544, 0.4659839, 0.4313767, 1, 1, 1, 1, 1,
-0.4195396, 1.552141, 0.03940158, 0, 0, 1, 1, 1,
-0.4186743, -1.798052, -2.52299, 1, 0, 0, 1, 1,
-0.4175954, -1.381101, -2.238185, 1, 0, 0, 1, 1,
-0.4104641, 0.8771318, 0.180696, 1, 0, 0, 1, 1,
-0.4103721, 0.5550935, -0.8144062, 1, 0, 0, 1, 1,
-0.4079393, -0.3261128, -1.514766, 1, 0, 0, 1, 1,
-0.4025272, -0.5003705, -2.906693, 0, 0, 0, 1, 1,
-0.4003645, 0.7488177, 0.4794447, 0, 0, 0, 1, 1,
-0.398347, 0.7374167, -0.3168284, 0, 0, 0, 1, 1,
-0.3974945, -0.3649507, -2.385637, 0, 0, 0, 1, 1,
-0.3942695, -1.085132, -3.08366, 0, 0, 0, 1, 1,
-0.3876155, -1.659374, -2.915756, 0, 0, 0, 1, 1,
-0.3867777, -1.630079, -3.492319, 0, 0, 0, 1, 1,
-0.3854988, -0.2586786, -1.814918, 1, 1, 1, 1, 1,
-0.383699, 1.290783, 0.7474712, 1, 1, 1, 1, 1,
-0.3829536, 0.06422091, -2.166864, 1, 1, 1, 1, 1,
-0.3828619, -1.261569, -2.890768, 1, 1, 1, 1, 1,
-0.3749422, -0.4062376, -1.025478, 1, 1, 1, 1, 1,
-0.3722363, 0.4587197, 0.8871626, 1, 1, 1, 1, 1,
-0.3712897, -0.2053982, -2.785335, 1, 1, 1, 1, 1,
-0.3631741, 1.391292, -0.9546422, 1, 1, 1, 1, 1,
-0.3590724, -1.005925, -3.414296, 1, 1, 1, 1, 1,
-0.3573052, 0.9901379, 0.3374706, 1, 1, 1, 1, 1,
-0.3477745, -1.608498, -3.091234, 1, 1, 1, 1, 1,
-0.3467253, -0.9897383, -2.438423, 1, 1, 1, 1, 1,
-0.3374501, -0.3056699, -1.814696, 1, 1, 1, 1, 1,
-0.3374085, -0.3630193, -0.08979546, 1, 1, 1, 1, 1,
-0.3358821, -0.559077, -2.306498, 1, 1, 1, 1, 1,
-0.333763, -1.233084, -3.841595, 0, 0, 1, 1, 1,
-0.3302863, -0.2313583, -1.279043, 1, 0, 0, 1, 1,
-0.3163299, 0.8602276, -0.5081999, 1, 0, 0, 1, 1,
-0.3151261, 1.413431, -0.4835434, 1, 0, 0, 1, 1,
-0.3140625, -0.004412801, -1.999842, 1, 0, 0, 1, 1,
-0.314056, -0.778863, -4.773584, 1, 0, 0, 1, 1,
-0.3063458, 1.917853, 1.432145, 0, 0, 0, 1, 1,
-0.3063135, 0.04648006, -0.3422859, 0, 0, 0, 1, 1,
-0.2996725, 0.5865923, -0.7819699, 0, 0, 0, 1, 1,
-0.2985566, -1.364499, -2.729936, 0, 0, 0, 1, 1,
-0.2981833, -1.587667, -3.286616, 0, 0, 0, 1, 1,
-0.2961743, 1.429317, 0.3348561, 0, 0, 0, 1, 1,
-0.2949264, 0.8601208, 0.3428608, 0, 0, 0, 1, 1,
-0.2895748, -1.763148, -3.816828, 1, 1, 1, 1, 1,
-0.286519, -1.422431, -0.8848959, 1, 1, 1, 1, 1,
-0.2861263, -0.8343337, -3.620793, 1, 1, 1, 1, 1,
-0.2793759, 0.3092758, 1.254432, 1, 1, 1, 1, 1,
-0.2784417, 2.51118, -0.4418416, 1, 1, 1, 1, 1,
-0.275323, 2.04512, 0.934471, 1, 1, 1, 1, 1,
-0.2747674, 0.5526002, 0.3859011, 1, 1, 1, 1, 1,
-0.2736546, 0.1431744, -1.226076, 1, 1, 1, 1, 1,
-0.271881, -0.2946585, -3.335877, 1, 1, 1, 1, 1,
-0.270436, 0.3262027, -0.2032913, 1, 1, 1, 1, 1,
-0.2685479, 1.403543, 0.1090993, 1, 1, 1, 1, 1,
-0.2575764, -0.05961705, -5.098155, 1, 1, 1, 1, 1,
-0.2567474, 0.6020006, 0.4696135, 1, 1, 1, 1, 1,
-0.2515351, 0.8514134, -1.119755, 1, 1, 1, 1, 1,
-0.2515041, -0.419129, -1.275925, 1, 1, 1, 1, 1,
-0.2490821, 0.5024498, -0.7623964, 0, 0, 1, 1, 1,
-0.2484604, -1.332306, -2.126002, 1, 0, 0, 1, 1,
-0.2471177, 0.4735494, -1.490916, 1, 0, 0, 1, 1,
-0.2443876, -0.2365352, -3.109435, 1, 0, 0, 1, 1,
-0.2440542, 1.639166, 0.2554283, 1, 0, 0, 1, 1,
-0.2387341, -1.386049, -3.894444, 1, 0, 0, 1, 1,
-0.2373259, 0.4298345, -0.9078169, 0, 0, 0, 1, 1,
-0.2343485, 1.508381, -0.3099388, 0, 0, 0, 1, 1,
-0.2320772, 1.064672, -1.73622, 0, 0, 0, 1, 1,
-0.23035, 1.505384, -2.724758, 0, 0, 0, 1, 1,
-0.2296309, -0.5318392, -2.306144, 0, 0, 0, 1, 1,
-0.2285946, 0.6281431, -0.4608374, 0, 0, 0, 1, 1,
-0.2266016, 1.369076, 0.1300257, 0, 0, 0, 1, 1,
-0.2253638, -1.331525, -2.567584, 1, 1, 1, 1, 1,
-0.2243398, 1.399842, 0.4870638, 1, 1, 1, 1, 1,
-0.2215063, 1.149257, 0.5119972, 1, 1, 1, 1, 1,
-0.2202359, -1.547789, -2.012142, 1, 1, 1, 1, 1,
-0.2182565, 0.39487, -1.567858, 1, 1, 1, 1, 1,
-0.2162456, -0.2589803, -1.466985, 1, 1, 1, 1, 1,
-0.2116018, -0.1830921, -1.127561, 1, 1, 1, 1, 1,
-0.2104848, 1.271179, 1.268079, 1, 1, 1, 1, 1,
-0.210431, 0.3180191, -1.357289, 1, 1, 1, 1, 1,
-0.2091324, -0.6596949, -2.54131, 1, 1, 1, 1, 1,
-0.2046149, -0.2598826, -2.532174, 1, 1, 1, 1, 1,
-0.2040858, 1.448531, 1.797969, 1, 1, 1, 1, 1,
-0.2018759, 0.1707316, -1.498074, 1, 1, 1, 1, 1,
-0.2004941, 0.1315174, -0.3849544, 1, 1, 1, 1, 1,
-0.1997646, -0.323126, -0.1401561, 1, 1, 1, 1, 1,
-0.1949307, -0.6920255, -1.344463, 0, 0, 1, 1, 1,
-0.1934532, 0.1743855, -0.5848003, 1, 0, 0, 1, 1,
-0.1928448, -1.728455, -1.863339, 1, 0, 0, 1, 1,
-0.1909356, -1.616933, -2.178704, 1, 0, 0, 1, 1,
-0.190891, -0.1566091, 0.2506839, 1, 0, 0, 1, 1,
-0.1786652, 0.2050504, -0.4255654, 1, 0, 0, 1, 1,
-0.1784296, -2.755975, -4.443223, 0, 0, 0, 1, 1,
-0.1726782, 1.070273, -0.6328704, 0, 0, 0, 1, 1,
-0.1697387, 1.26352, -0.902597, 0, 0, 0, 1, 1,
-0.1656715, 1.023138, 0.4005512, 0, 0, 0, 1, 1,
-0.159563, -1.634664, -3.103251, 0, 0, 0, 1, 1,
-0.1584439, -0.216548, 1.1273, 0, 0, 0, 1, 1,
-0.1562334, 1.365262, 0.5780755, 0, 0, 0, 1, 1,
-0.1508577, 0.7437955, 0.6470259, 1, 1, 1, 1, 1,
-0.1494062, 0.9617975, -0.2331425, 1, 1, 1, 1, 1,
-0.1471345, 1.193692, 0.4376316, 1, 1, 1, 1, 1,
-0.1378658, -0.9040493, -2.497455, 1, 1, 1, 1, 1,
-0.1327609, -1.005912, -1.6868, 1, 1, 1, 1, 1,
-0.1285609, 0.961205, -0.3019617, 1, 1, 1, 1, 1,
-0.1267668, -0.121589, -2.830115, 1, 1, 1, 1, 1,
-0.1258958, -1.297759, -2.726144, 1, 1, 1, 1, 1,
-0.1199251, 0.7263733, 0.3097458, 1, 1, 1, 1, 1,
-0.1177478, 0.9852505, -0.9099109, 1, 1, 1, 1, 1,
-0.1164895, -0.4251137, -2.716999, 1, 1, 1, 1, 1,
-0.1151674, 0.522664, -1.554193, 1, 1, 1, 1, 1,
-0.1132641, -1.551652, -3.314569, 1, 1, 1, 1, 1,
-0.112771, -0.816551, -2.391365, 1, 1, 1, 1, 1,
-0.1120318, -1.460736, -3.211765, 1, 1, 1, 1, 1,
-0.1119712, 0.4902254, -2.17103, 0, 0, 1, 1, 1,
-0.1116779, -1.565715, -0.02794098, 1, 0, 0, 1, 1,
-0.109837, 0.6482207, -1.565595, 1, 0, 0, 1, 1,
-0.1057092, -1.876504, -3.113476, 1, 0, 0, 1, 1,
-0.1054596, -0.2629356, -2.069811, 1, 0, 0, 1, 1,
-0.1003884, -1.28278, -3.944851, 1, 0, 0, 1, 1,
-0.09943888, -0.1381516, -3.220967, 0, 0, 0, 1, 1,
-0.09863923, 0.5249248, -0.7504963, 0, 0, 0, 1, 1,
-0.09564561, 0.1712225, -0.2402058, 0, 0, 0, 1, 1,
-0.09195295, 0.07889701, -1.952155, 0, 0, 0, 1, 1,
-0.08964883, -0.6012583, -2.270752, 0, 0, 0, 1, 1,
-0.08775512, 1.197454, -0.9504323, 0, 0, 0, 1, 1,
-0.08730077, 0.2263527, 0.1694455, 0, 0, 0, 1, 1,
-0.08384974, -0.04645956, -1.830955, 1, 1, 1, 1, 1,
-0.08124258, 0.1916019, 1.25898, 1, 1, 1, 1, 1,
-0.08086199, -2.46779, -3.67421, 1, 1, 1, 1, 1,
-0.08072519, 1.293277, -0.06904338, 1, 1, 1, 1, 1,
-0.07458501, 0.04402456, -2.084385, 1, 1, 1, 1, 1,
-0.07329179, 0.05012025, -2.767962, 1, 1, 1, 1, 1,
-0.06933245, -0.8786666, -3.265291, 1, 1, 1, 1, 1,
-0.06774876, -1.603933, -2.885624, 1, 1, 1, 1, 1,
-0.06700757, -1.603648, -2.058306, 1, 1, 1, 1, 1,
-0.06483406, 0.435501, -1.401471, 1, 1, 1, 1, 1,
-0.05375464, 0.06953497, -1.15904, 1, 1, 1, 1, 1,
-0.05309586, -0.3429623, -4.311752, 1, 1, 1, 1, 1,
-0.05284258, -0.203493, -3.448115, 1, 1, 1, 1, 1,
-0.05233, 0.9384497, 1.409201, 1, 1, 1, 1, 1,
-0.05027148, -0.52972, -2.445481, 1, 1, 1, 1, 1,
-0.0499806, -0.1382173, -2.440494, 0, 0, 1, 1, 1,
-0.04952021, -0.4734378, -2.969906, 1, 0, 0, 1, 1,
-0.04548573, -0.3163316, -0.8873712, 1, 0, 0, 1, 1,
-0.03662921, -1.027491, -3.444372, 1, 0, 0, 1, 1,
-0.03557266, -1.200365, -3.132147, 1, 0, 0, 1, 1,
-0.03528143, 0.8924218, -0.2302019, 1, 0, 0, 1, 1,
-0.03525137, -0.8219516, -3.9415, 0, 0, 0, 1, 1,
-0.03423046, -0.2661254, -3.397248, 0, 0, 0, 1, 1,
-0.02950612, -0.6940889, -2.999777, 0, 0, 0, 1, 1,
-0.02930086, -0.1287041, -3.272571, 0, 0, 0, 1, 1,
-0.02545024, 1.278279, -1.511004, 0, 0, 0, 1, 1,
-0.02522416, -0.8361462, -3.065308, 0, 0, 0, 1, 1,
-0.01559561, -0.003198201, -1.236601, 0, 0, 0, 1, 1,
-0.01488935, 0.4810505, 0.5825863, 1, 1, 1, 1, 1,
-0.01347673, 0.6170271, 0.4225796, 1, 1, 1, 1, 1,
-0.008872502, 0.9353225, 1.301649, 1, 1, 1, 1, 1,
-0.00630235, -1.503886, -4.001918, 1, 1, 1, 1, 1,
-0.005250776, -0.01169503, -3.363427, 1, 1, 1, 1, 1,
0.005100636, 0.1850727, 0.5062281, 1, 1, 1, 1, 1,
0.007516061, -0.1582331, 4.03202, 1, 1, 1, 1, 1,
0.01004335, -1.174777, 3.238378, 1, 1, 1, 1, 1,
0.01047715, 0.4852354, -1.025714, 1, 1, 1, 1, 1,
0.0155856, 0.318645, -0.1895106, 1, 1, 1, 1, 1,
0.01714501, -1.212865, 4.590346, 1, 1, 1, 1, 1,
0.01773949, 0.6836423, 2.333906, 1, 1, 1, 1, 1,
0.01776698, 1.361506, 2.694509, 1, 1, 1, 1, 1,
0.01945075, 1.36835, 1.423707, 1, 1, 1, 1, 1,
0.0198678, -0.3407291, 3.339038, 1, 1, 1, 1, 1,
0.02409462, 0.336735, -2.029439, 0, 0, 1, 1, 1,
0.03078213, 0.6246858, 0.6339435, 1, 0, 0, 1, 1,
0.03168822, 1.088363, 0.04469158, 1, 0, 0, 1, 1,
0.03248534, 1.004672, 1.240714, 1, 0, 0, 1, 1,
0.03310321, 0.4574761, -0.8911061, 1, 0, 0, 1, 1,
0.03422128, -0.0274489, 3.613368, 1, 0, 0, 1, 1,
0.03441279, -0.3971778, 4.084594, 0, 0, 0, 1, 1,
0.03618089, -1.728092, 3.866952, 0, 0, 0, 1, 1,
0.03906438, -0.1886806, 1.432304, 0, 0, 0, 1, 1,
0.03952916, -1.108277, 2.338449, 0, 0, 0, 1, 1,
0.04089222, -0.5774232, 3.06207, 0, 0, 0, 1, 1,
0.04843463, -0.5449814, 2.110144, 0, 0, 0, 1, 1,
0.04912043, -0.29558, 3.92032, 0, 0, 0, 1, 1,
0.05046077, -0.2142788, 4.440684, 1, 1, 1, 1, 1,
0.05199253, -0.9473367, 3.040479, 1, 1, 1, 1, 1,
0.05510185, -0.1468336, 2.589766, 1, 1, 1, 1, 1,
0.05734492, -0.2390361, 1.90545, 1, 1, 1, 1, 1,
0.05879908, 0.4975842, 1.157104, 1, 1, 1, 1, 1,
0.05949291, 0.2084017, -0.06508137, 1, 1, 1, 1, 1,
0.06278659, 0.615615, 0.3470876, 1, 1, 1, 1, 1,
0.064584, 1.799352, 0.9020302, 1, 1, 1, 1, 1,
0.06784824, 0.6064236, -0.4074519, 1, 1, 1, 1, 1,
0.06953532, -0.2277941, 2.231657, 1, 1, 1, 1, 1,
0.07495372, 0.716177, 1.496881, 1, 1, 1, 1, 1,
0.07524213, 1.203285, -0.8239314, 1, 1, 1, 1, 1,
0.07619795, 0.6302107, -0.8982911, 1, 1, 1, 1, 1,
0.07873303, 0.3452983, -0.8457767, 1, 1, 1, 1, 1,
0.08093084, -0.6383008, 2.914507, 1, 1, 1, 1, 1,
0.08406764, 0.848045, -1.458797, 0, 0, 1, 1, 1,
0.08502673, 0.3764461, -0.4097632, 1, 0, 0, 1, 1,
0.08511982, 0.01276306, 0.01958785, 1, 0, 0, 1, 1,
0.08668961, -0.04721558, 3.718244, 1, 0, 0, 1, 1,
0.0909754, -1.807694, 3.307941, 1, 0, 0, 1, 1,
0.09272105, -2.136456, 2.525025, 1, 0, 0, 1, 1,
0.09920151, -1.406495, 3.23038, 0, 0, 0, 1, 1,
0.1011607, 1.615089, 2.132629, 0, 0, 0, 1, 1,
0.1046242, 0.8619767, -1.773656, 0, 0, 0, 1, 1,
0.1070353, 1.92451, -0.4765579, 0, 0, 0, 1, 1,
0.1071438, 0.2343572, -1.158527, 0, 0, 0, 1, 1,
0.1076517, 1.328166, -0.8122445, 0, 0, 0, 1, 1,
0.1077432, -0.9869947, 2.22278, 0, 0, 0, 1, 1,
0.11255, -0.5776599, 1.794766, 1, 1, 1, 1, 1,
0.113434, -0.3961757, 2.553285, 1, 1, 1, 1, 1,
0.1134402, 0.1973654, 1.335664, 1, 1, 1, 1, 1,
0.1155616, -1.280765, 2.811442, 1, 1, 1, 1, 1,
0.1160721, -0.1307199, 5.336994, 1, 1, 1, 1, 1,
0.1185424, -0.1402209, 2.121456, 1, 1, 1, 1, 1,
0.1212451, 0.7912999, 0.4046415, 1, 1, 1, 1, 1,
0.1277375, -2.310081, 2.294544, 1, 1, 1, 1, 1,
0.1282126, 0.7207072, 0.522505, 1, 1, 1, 1, 1,
0.1289655, 0.2322808, 0.7304779, 1, 1, 1, 1, 1,
0.1293593, 1.371034, 0.9425232, 1, 1, 1, 1, 1,
0.1311188, 0.485917, 1.736984, 1, 1, 1, 1, 1,
0.1317781, -0.8567601, 4.713283, 1, 1, 1, 1, 1,
0.1365044, 1.880353, 0.9742275, 1, 1, 1, 1, 1,
0.136529, 0.7532132, 0.8674591, 1, 1, 1, 1, 1,
0.1401611, -0.5508038, 0.700626, 0, 0, 1, 1, 1,
0.1404313, -0.5340003, 2.434006, 1, 0, 0, 1, 1,
0.1434355, 1.421655, 0.05277101, 1, 0, 0, 1, 1,
0.1473576, 1.534616, 0.02205463, 1, 0, 0, 1, 1,
0.1536867, -0.2160244, 1.676746, 1, 0, 0, 1, 1,
0.1546061, -2.683338, 2.380711, 1, 0, 0, 1, 1,
0.1596677, -1.534963, 1.965732, 0, 0, 0, 1, 1,
0.1604814, 1.014863, 0.1764374, 0, 0, 0, 1, 1,
0.1619357, 0.1616473, -0.3844102, 0, 0, 0, 1, 1,
0.1635265, 0.1153042, 1.424625, 0, 0, 0, 1, 1,
0.1658984, 0.3432395, 1.796705, 0, 0, 0, 1, 1,
0.166024, 0.2826211, 0.5979408, 0, 0, 0, 1, 1,
0.1692433, -0.213326, 3.238283, 0, 0, 0, 1, 1,
0.1712739, -1.675918, 2.69912, 1, 1, 1, 1, 1,
0.1778815, 0.008728028, 1.48947, 1, 1, 1, 1, 1,
0.1796318, -1.942588, 3.009216, 1, 1, 1, 1, 1,
0.1816954, -1.1851, 2.753029, 1, 1, 1, 1, 1,
0.1818976, 0.7778175, -0.1721893, 1, 1, 1, 1, 1,
0.1846363, 1.301071, 0.882623, 1, 1, 1, 1, 1,
0.18479, 2.009418, -1.07779, 1, 1, 1, 1, 1,
0.1856327, -0.8683747, 2.737505, 1, 1, 1, 1, 1,
0.18676, -0.9913909, 3.273999, 1, 1, 1, 1, 1,
0.1921005, 0.8527074, 0.9526286, 1, 1, 1, 1, 1,
0.1941753, 0.1478645, 0.05630488, 1, 1, 1, 1, 1,
0.1953477, -1.602095, 1.612856, 1, 1, 1, 1, 1,
0.1963344, 0.8386651, 0.7324897, 1, 1, 1, 1, 1,
0.1971135, -0.4438382, 4.493085, 1, 1, 1, 1, 1,
0.1977757, -0.06668446, 2.678029, 1, 1, 1, 1, 1,
0.1979897, -0.347203, 2.261763, 0, 0, 1, 1, 1,
0.1992051, 0.8737214, -0.1443501, 1, 0, 0, 1, 1,
0.2062726, -0.3054518, 3.515157, 1, 0, 0, 1, 1,
0.2075897, -0.5328408, 0.2183265, 1, 0, 0, 1, 1,
0.2077753, -0.1448664, 3.197411, 1, 0, 0, 1, 1,
0.2089344, 0.6568988, 0.5953642, 1, 0, 0, 1, 1,
0.2099583, 1.20537, 0.4390941, 0, 0, 0, 1, 1,
0.2120356, -0.2052609, 3.517105, 0, 0, 0, 1, 1,
0.2159241, 0.5254474, -1.092896, 0, 0, 0, 1, 1,
0.2162576, 0.8399188, 1.064842, 0, 0, 0, 1, 1,
0.2169345, -0.8679981, 4.660616, 0, 0, 0, 1, 1,
0.218117, 1.380775, -0.627295, 0, 0, 0, 1, 1,
0.2182995, -1.650851, 3.486539, 0, 0, 0, 1, 1,
0.2195659, -0.3178937, 1.711911, 1, 1, 1, 1, 1,
0.2218976, -0.1239391, 3.305237, 1, 1, 1, 1, 1,
0.2250257, 0.6646411, 0.458026, 1, 1, 1, 1, 1,
0.225382, 1.688924, 1.150162, 1, 1, 1, 1, 1,
0.2280599, -1.568599, 3.491099, 1, 1, 1, 1, 1,
0.2388764, 0.6700283, -1.620497, 1, 1, 1, 1, 1,
0.240984, 2.236484, 0.9158981, 1, 1, 1, 1, 1,
0.2446057, -1.478556, 4.601603, 1, 1, 1, 1, 1,
0.2472849, -0.02142261, -0.1088138, 1, 1, 1, 1, 1,
0.2581202, 1.810547, 0.8598508, 1, 1, 1, 1, 1,
0.2592395, 0.3500741, 2.026265, 1, 1, 1, 1, 1,
0.2649831, -0.2731968, 1.663045, 1, 1, 1, 1, 1,
0.2695742, -0.670635, 2.120333, 1, 1, 1, 1, 1,
0.2705645, -1.045991, 2.977604, 1, 1, 1, 1, 1,
0.2784818, 0.1739577, -0.9970179, 1, 1, 1, 1, 1,
0.2801241, -0.1779799, 1.809956, 0, 0, 1, 1, 1,
0.2803565, -0.3584649, 2.147192, 1, 0, 0, 1, 1,
0.281695, -0.7736295, 2.820679, 1, 0, 0, 1, 1,
0.2822109, 1.23872, 1.973645, 1, 0, 0, 1, 1,
0.2854779, 0.2034285, 0.5530332, 1, 0, 0, 1, 1,
0.2857967, 0.7966565, 0.244617, 1, 0, 0, 1, 1,
0.2871164, 1.38543, 0.5347626, 0, 0, 0, 1, 1,
0.2874371, 1.025069, 0.1695992, 0, 0, 0, 1, 1,
0.289251, -2.320349, 2.444539, 0, 0, 0, 1, 1,
0.2945464, -1.627154, 3.332837, 0, 0, 0, 1, 1,
0.295746, 0.9020427, -0.001561017, 0, 0, 0, 1, 1,
0.2958344, -0.7230608, 2.234953, 0, 0, 0, 1, 1,
0.2960697, 0.09429601, 0.7541587, 0, 0, 0, 1, 1,
0.2965442, 1.718396, -0.7710912, 1, 1, 1, 1, 1,
0.2967699, 0.9501615, -0.320649, 1, 1, 1, 1, 1,
0.2997187, -0.8402283, 3.416064, 1, 1, 1, 1, 1,
0.3019689, 0.1680083, -0.4180334, 1, 1, 1, 1, 1,
0.3023571, -1.199996, 0.9847, 1, 1, 1, 1, 1,
0.3126092, -1.033866, 1.570299, 1, 1, 1, 1, 1,
0.3174396, -0.987609, 3.522385, 1, 1, 1, 1, 1,
0.3222394, 0.4716672, 1.56095, 1, 1, 1, 1, 1,
0.3226658, 1.024551, 0.3583408, 1, 1, 1, 1, 1,
0.323234, -1.845789, -0.4056306, 1, 1, 1, 1, 1,
0.3238411, 1.001748, 0.5415342, 1, 1, 1, 1, 1,
0.3244479, 0.9725382, 1.914548, 1, 1, 1, 1, 1,
0.3279062, 0.949115, 0.7896239, 1, 1, 1, 1, 1,
0.3285735, -0.7480308, 1.906442, 1, 1, 1, 1, 1,
0.332211, -1.150632, 3.422769, 1, 1, 1, 1, 1,
0.3357733, -0.276236, 2.40547, 0, 0, 1, 1, 1,
0.3371843, -0.4109245, 4.281324, 1, 0, 0, 1, 1,
0.3376071, -0.8296666, 2.946939, 1, 0, 0, 1, 1,
0.3383176, 1.347248, 0.8169227, 1, 0, 0, 1, 1,
0.3389718, 0.5584736, 0.3214758, 1, 0, 0, 1, 1,
0.3399797, 0.5140557, 3.775441, 1, 0, 0, 1, 1,
0.3415886, 1.646303, 0.7707776, 0, 0, 0, 1, 1,
0.344149, -1.53061, 3.04103, 0, 0, 0, 1, 1,
0.3446052, 0.7395539, 1.574565, 0, 0, 0, 1, 1,
0.3488558, -0.1868661, 1.592357, 0, 0, 0, 1, 1,
0.349095, 1.01615, 1.734862, 0, 0, 0, 1, 1,
0.3491342, -0.2326401, 1.749902, 0, 0, 0, 1, 1,
0.3527987, 1.375886, -0.2451168, 0, 0, 0, 1, 1,
0.3553097, -0.6161444, 1.854542, 1, 1, 1, 1, 1,
0.3553247, -0.2902437, 0.8990476, 1, 1, 1, 1, 1,
0.3574785, 2.304732, 0.2791289, 1, 1, 1, 1, 1,
0.3596962, 0.6274639, 1.705268, 1, 1, 1, 1, 1,
0.3629645, -0.01050449, 2.326477, 1, 1, 1, 1, 1,
0.3649046, -0.1098164, 3.020092, 1, 1, 1, 1, 1,
0.3666705, -1.429114, 1.723299, 1, 1, 1, 1, 1,
0.3701532, -0.7363248, 4.050903, 1, 1, 1, 1, 1,
0.3704638, -0.01070014, 2.269005, 1, 1, 1, 1, 1,
0.377687, -0.04810226, 1.018235, 1, 1, 1, 1, 1,
0.3829842, -0.8954628, 3.21756, 1, 1, 1, 1, 1,
0.3831588, 1.086598, 1.918707, 1, 1, 1, 1, 1,
0.3865469, -1.823687, 2.077486, 1, 1, 1, 1, 1,
0.3866954, -0.4916181, 1.301076, 1, 1, 1, 1, 1,
0.3869479, -1.016082, 2.497851, 1, 1, 1, 1, 1,
0.3897644, -1.344102, 1.457044, 0, 0, 1, 1, 1,
0.3903369, 1.589328, 0.5272708, 1, 0, 0, 1, 1,
0.3908838, 0.4150049, 1.29854, 1, 0, 0, 1, 1,
0.3942536, -0.1859816, 2.816478, 1, 0, 0, 1, 1,
0.3955562, -0.8998488, 1.780305, 1, 0, 0, 1, 1,
0.3956541, -0.7920558, 3.498717, 1, 0, 0, 1, 1,
0.3958586, 1.270386, 1.225728, 0, 0, 0, 1, 1,
0.3965337, -0.6549695, 3.468066, 0, 0, 0, 1, 1,
0.3966369, -0.7976134, 1.777553, 0, 0, 0, 1, 1,
0.3981201, -0.1988482, 1.005873, 0, 0, 0, 1, 1,
0.4017998, -0.2482714, 1.854549, 0, 0, 0, 1, 1,
0.4031968, 0.03884474, 2.034145, 0, 0, 0, 1, 1,
0.4072405, 0.5783312, 1.095557, 0, 0, 0, 1, 1,
0.4089109, -1.586654, 1.832911, 1, 1, 1, 1, 1,
0.4191048, 0.140224, -0.1094693, 1, 1, 1, 1, 1,
0.4227979, -0.6135756, 1.509306, 1, 1, 1, 1, 1,
0.42439, -0.2256576, 2.072267, 1, 1, 1, 1, 1,
0.4249853, -0.05202963, 2.673547, 1, 1, 1, 1, 1,
0.4347271, -1.752016, 2.57461, 1, 1, 1, 1, 1,
0.4375946, -0.695983, 3.68485, 1, 1, 1, 1, 1,
0.4376433, 0.7034696, -0.5881746, 1, 1, 1, 1, 1,
0.4388802, -1.831016, 3.820391, 1, 1, 1, 1, 1,
0.4397736, 0.6449341, -0.9884322, 1, 1, 1, 1, 1,
0.4448898, 0.9103573, 2.095669, 1, 1, 1, 1, 1,
0.4452595, -0.4009676, 0.9941779, 1, 1, 1, 1, 1,
0.4494846, -1.137876, 4.094407, 1, 1, 1, 1, 1,
0.4553975, -0.6577485, 2.678343, 1, 1, 1, 1, 1,
0.4622415, -0.6953515, 2.129828, 1, 1, 1, 1, 1,
0.4630619, 0.1254331, 2.490792, 0, 0, 1, 1, 1,
0.4757336, -1.565126, 2.200842, 1, 0, 0, 1, 1,
0.4778445, -0.07222373, 2.9736, 1, 0, 0, 1, 1,
0.4938591, 2.081908, 0.3406489, 1, 0, 0, 1, 1,
0.4975314, 0.8731889, 1.39408, 1, 0, 0, 1, 1,
0.4981374, 0.1139336, 1.30136, 1, 0, 0, 1, 1,
0.499128, 0.4364256, 0.4356253, 0, 0, 0, 1, 1,
0.499227, -1.093665, 2.917389, 0, 0, 0, 1, 1,
0.501792, -2.409261, 1.513533, 0, 0, 0, 1, 1,
0.5020912, -0.3496424, 1.771847, 0, 0, 0, 1, 1,
0.5023251, 1.313467, 0.9646583, 0, 0, 0, 1, 1,
0.5025151, 0.08352168, -0.05519858, 0, 0, 0, 1, 1,
0.5074013, -0.96372, 1.614284, 0, 0, 0, 1, 1,
0.51798, -0.07889949, 2.72642, 1, 1, 1, 1, 1,
0.5190291, -0.9734686, 1.61334, 1, 1, 1, 1, 1,
0.5223094, -0.3947852, 1.031639, 1, 1, 1, 1, 1,
0.522733, 1.21063, -0.1828762, 1, 1, 1, 1, 1,
0.5231126, -1.022652, 4.153933, 1, 1, 1, 1, 1,
0.5299186, -0.2355774, 2.370098, 1, 1, 1, 1, 1,
0.5307711, 1.538262, -0.2471709, 1, 1, 1, 1, 1,
0.5334327, -0.7989452, 0.6155566, 1, 1, 1, 1, 1,
0.5354216, -0.5721612, 3.23799, 1, 1, 1, 1, 1,
0.5355567, -0.6908157, 2.223691, 1, 1, 1, 1, 1,
0.5363351, 0.3168782, 0.8068891, 1, 1, 1, 1, 1,
0.5389323, 0.2467328, 1.501022, 1, 1, 1, 1, 1,
0.5405942, -0.3158736, 1.728179, 1, 1, 1, 1, 1,
0.5419737, 0.2436153, 0.6030401, 1, 1, 1, 1, 1,
0.5424629, 0.9897519, -0.3762833, 1, 1, 1, 1, 1,
0.5428818, -1.972004, 2.072078, 0, 0, 1, 1, 1,
0.5504745, 0.3497263, -0.05007941, 1, 0, 0, 1, 1,
0.5553817, -0.8176948, 1.69985, 1, 0, 0, 1, 1,
0.5554596, -2.537815, 3.608392, 1, 0, 0, 1, 1,
0.5578595, 1.272585, 0.3518988, 1, 0, 0, 1, 1,
0.5589285, 0.7070605, -0.8344461, 1, 0, 0, 1, 1,
0.5664245, -0.3646391, 1.968529, 0, 0, 0, 1, 1,
0.5667298, 0.407296, 2.801171, 0, 0, 0, 1, 1,
0.570573, -1.379728, 2.729627, 0, 0, 0, 1, 1,
0.5767847, 0.8173415, 1.222917, 0, 0, 0, 1, 1,
0.5879983, 0.2922172, -0.2902105, 0, 0, 0, 1, 1,
0.591668, 0.8416042, 2.018426, 0, 0, 0, 1, 1,
0.5935169, -1.529699, 4.324372, 0, 0, 0, 1, 1,
0.5937315, -1.485352, 2.483608, 1, 1, 1, 1, 1,
0.5996313, -0.6110046, 0.7334828, 1, 1, 1, 1, 1,
0.601608, -0.7788877, 2.142599, 1, 1, 1, 1, 1,
0.601909, 0.9816095, 1.852061, 1, 1, 1, 1, 1,
0.60338, -1.39336, 3.499352, 1, 1, 1, 1, 1,
0.6036433, 0.1840704, 0.03928724, 1, 1, 1, 1, 1,
0.6043186, -0.1247346, 2.2111, 1, 1, 1, 1, 1,
0.6131831, 0.3167436, 0.7944382, 1, 1, 1, 1, 1,
0.6150432, 0.1047811, 1.147007, 1, 1, 1, 1, 1,
0.6157746, 1.821905, 0.5904437, 1, 1, 1, 1, 1,
0.6201437, -1.686016, 2.09259, 1, 1, 1, 1, 1,
0.6246839, -0.9426217, 1.911092, 1, 1, 1, 1, 1,
0.6271034, 0.4531756, 0.903425, 1, 1, 1, 1, 1,
0.629185, -1.339783, 3.956807, 1, 1, 1, 1, 1,
0.6293315, 1.197346, 1.049877, 1, 1, 1, 1, 1,
0.6325222, 0.2517045, 2.798793, 0, 0, 1, 1, 1,
0.6346284, -0.9165509, 2.101876, 1, 0, 0, 1, 1,
0.6418038, 1.61544, -0.7874673, 1, 0, 0, 1, 1,
0.6422389, -0.5841497, 3.735407, 1, 0, 0, 1, 1,
0.643497, -0.05264513, 2.261181, 1, 0, 0, 1, 1,
0.6437192, -1.089785, 1.637935, 1, 0, 0, 1, 1,
0.6532558, -0.4228878, 1.889642, 0, 0, 0, 1, 1,
0.6564981, 0.03226805, 0.5087799, 0, 0, 0, 1, 1,
0.6593053, 0.6177821, 1.172425, 0, 0, 0, 1, 1,
0.6594758, 0.7835661, 1.511161, 0, 0, 0, 1, 1,
0.6608523, 0.1133807, 0.9392899, 0, 0, 0, 1, 1,
0.6690754, -1.140687, 1.322973, 0, 0, 0, 1, 1,
0.6704228, 0.04589275, 1.807039, 0, 0, 0, 1, 1,
0.6708274, 0.7900121, -0.1906851, 1, 1, 1, 1, 1,
0.6807463, -0.6523586, 2.179317, 1, 1, 1, 1, 1,
0.6823474, -0.4089124, 2.298122, 1, 1, 1, 1, 1,
0.6912549, 0.01444908, 1.621773, 1, 1, 1, 1, 1,
0.6913112, 0.3133455, 0.2401246, 1, 1, 1, 1, 1,
0.6915084, -0.695039, 2.239679, 1, 1, 1, 1, 1,
0.6946265, 1.070986, 1.853556, 1, 1, 1, 1, 1,
0.6976379, 0.2057319, 0.1191765, 1, 1, 1, 1, 1,
0.6990768, 0.192876, 2.896926, 1, 1, 1, 1, 1,
0.7076366, -2.096963, 2.552811, 1, 1, 1, 1, 1,
0.7127659, 0.541513, 0.6466258, 1, 1, 1, 1, 1,
0.7131534, -0.5536058, 2.640176, 1, 1, 1, 1, 1,
0.7162243, 0.08851044, 0.3137462, 1, 1, 1, 1, 1,
0.7168519, 0.9770526, 2.082875, 1, 1, 1, 1, 1,
0.717474, -0.0660505, 3.362618, 1, 1, 1, 1, 1,
0.7222509, 0.9804671, 3.919821, 0, 0, 1, 1, 1,
0.7266966, -0.4828058, 2.874819, 1, 0, 0, 1, 1,
0.7275451, 0.7031983, 2.44137, 1, 0, 0, 1, 1,
0.7283439, -1.466291, 3.210483, 1, 0, 0, 1, 1,
0.7283459, -0.1672967, 1.885608, 1, 0, 0, 1, 1,
0.7445564, 1.944611, -0.3178047, 1, 0, 0, 1, 1,
0.7471331, 0.2159683, -0.5450234, 0, 0, 0, 1, 1,
0.7472883, 0.4717855, 0.9095514, 0, 0, 0, 1, 1,
0.7510975, -0.1804599, 4.041071, 0, 0, 0, 1, 1,
0.753374, 2.337731, 0.1898578, 0, 0, 0, 1, 1,
0.7549791, -0.9123644, 1.53001, 0, 0, 0, 1, 1,
0.7592406, -0.1017627, 1.376486, 0, 0, 0, 1, 1,
0.7640335, -0.497272, 1.676858, 0, 0, 0, 1, 1,
0.7736701, 2.151986, 0.5328534, 1, 1, 1, 1, 1,
0.7744886, 0.4343117, 1.352785, 1, 1, 1, 1, 1,
0.7755073, -0.6121067, 2.020495, 1, 1, 1, 1, 1,
0.7783485, -0.04173417, 1.828544, 1, 1, 1, 1, 1,
0.7801799, -1.076817, 3.340547, 1, 1, 1, 1, 1,
0.7820882, 0.3989767, 0.1900937, 1, 1, 1, 1, 1,
0.798381, 0.03198128, 1.617081, 1, 1, 1, 1, 1,
0.799631, 0.5710717, 0.3034823, 1, 1, 1, 1, 1,
0.8031733, -1.857927, 1.520149, 1, 1, 1, 1, 1,
0.8035392, -0.9055769, 2.194695, 1, 1, 1, 1, 1,
0.8038897, 1.039652, 1.330167, 1, 1, 1, 1, 1,
0.8070963, -0.9131011, 2.033267, 1, 1, 1, 1, 1,
0.8143183, -0.9382597, 3.284607, 1, 1, 1, 1, 1,
0.820797, -0.4960988, 3.496957, 1, 1, 1, 1, 1,
0.825048, 1.316541, -0.4120737, 1, 1, 1, 1, 1,
0.8272134, -0.644594, 1.736895, 0, 0, 1, 1, 1,
0.8275593, 1.613266, 0.2834026, 1, 0, 0, 1, 1,
0.8337331, 0.960211, -0.3057565, 1, 0, 0, 1, 1,
0.837002, -0.5024232, 2.608675, 1, 0, 0, 1, 1,
0.841328, 0.06482462, 1.551697, 1, 0, 0, 1, 1,
0.84161, 0.2009057, 2.403478, 1, 0, 0, 1, 1,
0.8456613, -0.7850196, 1.87633, 0, 0, 0, 1, 1,
0.850952, -0.5401349, 1.391777, 0, 0, 0, 1, 1,
0.8562055, 0.1846177, 2.380686, 0, 0, 0, 1, 1,
0.8579761, -1.869999, 1.475084, 0, 0, 0, 1, 1,
0.8618836, -0.1210243, 2.003863, 0, 0, 0, 1, 1,
0.862465, -1.38613, 2.257328, 0, 0, 0, 1, 1,
0.867299, -0.1041263, 0.2724, 0, 0, 0, 1, 1,
0.869686, -0.4327793, 3.113698, 1, 1, 1, 1, 1,
0.8710122, 0.7329061, 1.036137, 1, 1, 1, 1, 1,
0.8733718, -0.09380626, 0.6898969, 1, 1, 1, 1, 1,
0.8756534, -0.5535549, 2.193828, 1, 1, 1, 1, 1,
0.8768306, -0.9350287, 3.57047, 1, 1, 1, 1, 1,
0.8812691, 0.2674357, -0.4373134, 1, 1, 1, 1, 1,
0.8870686, -0.4851557, 0.6530004, 1, 1, 1, 1, 1,
0.8893183, -2.069748, 1.726956, 1, 1, 1, 1, 1,
0.8896189, -2.759173, 3.412117, 1, 1, 1, 1, 1,
0.899573, -1.744963, 2.603378, 1, 1, 1, 1, 1,
0.9108364, -0.2460479, 1.336461, 1, 1, 1, 1, 1,
0.9158251, -0.9301841, 1.293004, 1, 1, 1, 1, 1,
0.9161853, 0.009360491, 1.505, 1, 1, 1, 1, 1,
0.921056, -0.2265476, 2.355409, 1, 1, 1, 1, 1,
0.9217901, -0.5544968, 1.553917, 1, 1, 1, 1, 1,
0.9256718, 0.8427511, 2.743773, 0, 0, 1, 1, 1,
0.9261469, 2.024823, -0.1462103, 1, 0, 0, 1, 1,
0.930604, 1.589538, 1.629774, 1, 0, 0, 1, 1,
0.9319812, 1.277567, 0.8894764, 1, 0, 0, 1, 1,
0.931987, -0.2219657, 2.545791, 1, 0, 0, 1, 1,
0.9324654, -1.739697, 3.026994, 1, 0, 0, 1, 1,
0.9379237, 0.493929, 1.618597, 0, 0, 0, 1, 1,
0.9390539, -1.224939, 3.743534, 0, 0, 0, 1, 1,
0.9417224, -1.221165, 2.00753, 0, 0, 0, 1, 1,
0.9484978, -0.3256849, 1.327384, 0, 0, 0, 1, 1,
0.9485732, 0.2671284, -0.7921473, 0, 0, 0, 1, 1,
0.9519479, 0.6361232, 0.2158927, 0, 0, 0, 1, 1,
0.9565414, -1.117214, 2.879905, 0, 0, 0, 1, 1,
0.9577916, -1.456104, 1.398673, 1, 1, 1, 1, 1,
0.9590113, -1.022692, 2.039041, 1, 1, 1, 1, 1,
0.9623031, -0.553543, 2.357444, 1, 1, 1, 1, 1,
0.9661105, -1.898745, 3.129812, 1, 1, 1, 1, 1,
0.97701, -0.7673838, 3.59588, 1, 1, 1, 1, 1,
0.9776874, -0.217782, 4.798814, 1, 1, 1, 1, 1,
0.981205, -0.7438256, 2.108491, 1, 1, 1, 1, 1,
0.9826676, 0.4827433, 1.517349, 1, 1, 1, 1, 1,
0.9870178, 1.109934, 0.1626131, 1, 1, 1, 1, 1,
0.9879739, -0.4213164, 1.988731, 1, 1, 1, 1, 1,
0.9949709, -0.3635614, 3.711734, 1, 1, 1, 1, 1,
0.9974459, 1.007756, 1.357459, 1, 1, 1, 1, 1,
1.001496, -2.495755, 2.803995, 1, 1, 1, 1, 1,
1.004177, 1.406537, 0.09862934, 1, 1, 1, 1, 1,
1.01725, 0.1974378, 1.626385, 1, 1, 1, 1, 1,
1.01914, 1.766343, 1.201375, 0, 0, 1, 1, 1,
1.023337, -0.2944607, 0.7422816, 1, 0, 0, 1, 1,
1.02404, 0.00448314, 2.315978, 1, 0, 0, 1, 1,
1.030098, 0.3024993, 0.5091664, 1, 0, 0, 1, 1,
1.032521, 0.358383, -0.7106813, 1, 0, 0, 1, 1,
1.033829, 0.7627816, 1.71154, 1, 0, 0, 1, 1,
1.034457, -0.01526138, 0.7118531, 0, 0, 0, 1, 1,
1.03836, -0.08916197, -0.1291585, 0, 0, 0, 1, 1,
1.041664, 0.4139808, 0.3104256, 0, 0, 0, 1, 1,
1.043103, -0.762128, 1.942261, 0, 0, 0, 1, 1,
1.04748, -0.8560993, 3.608895, 0, 0, 0, 1, 1,
1.04854, 0.6484619, 0.9608669, 0, 0, 0, 1, 1,
1.049927, -0.9241964, 1.275892, 0, 0, 0, 1, 1,
1.05337, 0.06488357, 2.827864, 1, 1, 1, 1, 1,
1.063724, 0.9517648, 0.09401712, 1, 1, 1, 1, 1,
1.075806, 0.851612, 0.4825726, 1, 1, 1, 1, 1,
1.081112, -0.7550194, 1.360522, 1, 1, 1, 1, 1,
1.089636, -0.07756957, 4.224246, 1, 1, 1, 1, 1,
1.102959, -0.1943191, 1.497641, 1, 1, 1, 1, 1,
1.115427, 0.4541418, 1.225585, 1, 1, 1, 1, 1,
1.116547, -1.797851, 1.278162, 1, 1, 1, 1, 1,
1.121859, 2.010994, 1.171664, 1, 1, 1, 1, 1,
1.128226, -0.3345461, 2.652351, 1, 1, 1, 1, 1,
1.134081, -0.08466059, 0.1373672, 1, 1, 1, 1, 1,
1.141607, 0.2208411, 1.760282, 1, 1, 1, 1, 1,
1.14327, -0.001451229, 2.258863, 1, 1, 1, 1, 1,
1.144537, -2.493331, 2.956582, 1, 1, 1, 1, 1,
1.14686, 0.8359407, 0.755868, 1, 1, 1, 1, 1,
1.156076, -0.539351, 1.343997, 0, 0, 1, 1, 1,
1.162977, -0.8906869, 3.97499, 1, 0, 0, 1, 1,
1.167592, -0.6625805, 2.278391, 1, 0, 0, 1, 1,
1.175354, -1.866722, 0.5557982, 1, 0, 0, 1, 1,
1.182234, 0.6840394, 1.485408, 1, 0, 0, 1, 1,
1.184064, -0.3182054, 2.266047, 1, 0, 0, 1, 1,
1.187892, 0.7840778, 0.1317004, 0, 0, 0, 1, 1,
1.203504, 0.6033382, 1.472567, 0, 0, 0, 1, 1,
1.208568, 0.6951856, -0.2094375, 0, 0, 0, 1, 1,
1.20904, 0.6638895, 1.732095, 0, 0, 0, 1, 1,
1.212456, -1.039586, 0.6221789, 0, 0, 0, 1, 1,
1.221759, 0.5965378, 2.255141, 0, 0, 0, 1, 1,
1.228062, 0.4327034, 0.786016, 0, 0, 0, 1, 1,
1.230604, 1.945233, 0.5118234, 1, 1, 1, 1, 1,
1.230936, 0.1259822, 0.8248046, 1, 1, 1, 1, 1,
1.239226, 0.5428826, 2.286258, 1, 1, 1, 1, 1,
1.239683, -0.01039037, -0.04573603, 1, 1, 1, 1, 1,
1.242714, 0.188486, 2.013798, 1, 1, 1, 1, 1,
1.256882, -0.5231436, 1.494745, 1, 1, 1, 1, 1,
1.267538, -0.3868553, 0.6847931, 1, 1, 1, 1, 1,
1.268711, 0.1402912, 1.757111, 1, 1, 1, 1, 1,
1.270768, 1.575324, 1.164078, 1, 1, 1, 1, 1,
1.280717, -1.887474, 3.067782, 1, 1, 1, 1, 1,
1.295272, -0.3082074, 0.3178123, 1, 1, 1, 1, 1,
1.30993, -0.269054, 1.570499, 1, 1, 1, 1, 1,
1.310373, 0.8372721, 0.7100831, 1, 1, 1, 1, 1,
1.316081, 0.7783062, 2.505966, 1, 1, 1, 1, 1,
1.32095, 2.503501, -0.5863681, 1, 1, 1, 1, 1,
1.322456, -0.02152137, 1.377142, 0, 0, 1, 1, 1,
1.322761, -0.1290746, 2.46826, 1, 0, 0, 1, 1,
1.324715, -1.018859, 1.794523, 1, 0, 0, 1, 1,
1.333119, -1.275612, 2.287471, 1, 0, 0, 1, 1,
1.340733, 0.1827625, 1.599399, 1, 0, 0, 1, 1,
1.346153, 0.4084818, 1.166701, 1, 0, 0, 1, 1,
1.347388, -0.68365, 2.494504, 0, 0, 0, 1, 1,
1.349838, 0.3796222, 2.116395, 0, 0, 0, 1, 1,
1.35012, 0.7827567, 0.6508834, 0, 0, 0, 1, 1,
1.35228, 1.081625, 1.098457, 0, 0, 0, 1, 1,
1.364025, -0.7149705, 2.419089, 0, 0, 0, 1, 1,
1.366243, -1.757644, 3.348005, 0, 0, 0, 1, 1,
1.368133, 0.1635252, -0.3896702, 0, 0, 0, 1, 1,
1.375556, -1.352817, 3.177932, 1, 1, 1, 1, 1,
1.38, -1.148198, 2.527025, 1, 1, 1, 1, 1,
1.381503, 1.589371, 0.6559884, 1, 1, 1, 1, 1,
1.391966, -1.083731, 0.7574412, 1, 1, 1, 1, 1,
1.392973, -0.670082, 1.941114, 1, 1, 1, 1, 1,
1.39362, 1.202189, 1.341608, 1, 1, 1, 1, 1,
1.400131, -1.292226, 3.540031, 1, 1, 1, 1, 1,
1.405408, -0.999932, 1.25918, 1, 1, 1, 1, 1,
1.407947, 1.511766, 2.054703, 1, 1, 1, 1, 1,
1.413863, 2.08871, 0.02950466, 1, 1, 1, 1, 1,
1.415689, -2.050963, 2.671217, 1, 1, 1, 1, 1,
1.417032, -0.8934905, 2.87293, 1, 1, 1, 1, 1,
1.439186, 0.3048803, 1.494437, 1, 1, 1, 1, 1,
1.440507, 0.5800421, 0.290377, 1, 1, 1, 1, 1,
1.444255, -0.8372327, 2.897476, 1, 1, 1, 1, 1,
1.460801, 0.161924, 2.253827, 0, 0, 1, 1, 1,
1.463463, 1.355962, -0.05627736, 1, 0, 0, 1, 1,
1.476214, 1.56914, 0.8296001, 1, 0, 0, 1, 1,
1.487855, -0.06106664, 3.238978, 1, 0, 0, 1, 1,
1.490955, -2.423355, 2.058997, 1, 0, 0, 1, 1,
1.494277, -0.274561, 1.521804, 1, 0, 0, 1, 1,
1.498464, 2.000757, 1.943287, 0, 0, 0, 1, 1,
1.504511, 0.02956562, 1.533807, 0, 0, 0, 1, 1,
1.523816, -1.484485, 2.904023, 0, 0, 0, 1, 1,
1.529987, 0.2824795, 0.4082175, 0, 0, 0, 1, 1,
1.532624, -0.9055658, 3.850739, 0, 0, 0, 1, 1,
1.536964, -0.3712507, 0.8460815, 0, 0, 0, 1, 1,
1.538824, -0.4670413, 2.382761, 0, 0, 0, 1, 1,
1.542571, -0.503539, -0.1094945, 1, 1, 1, 1, 1,
1.556244, -0.8710852, 4.305734, 1, 1, 1, 1, 1,
1.557178, -0.7264413, 2.601643, 1, 1, 1, 1, 1,
1.560068, -0.2119659, 2.69047, 1, 1, 1, 1, 1,
1.562001, -1.007478, 1.973609, 1, 1, 1, 1, 1,
1.570639, 1.13211, -0.05589233, 1, 1, 1, 1, 1,
1.57116, -2.076631, 1.880207, 1, 1, 1, 1, 1,
1.581123, -1.771163, 0.199028, 1, 1, 1, 1, 1,
1.595217, -0.0817728, 3.310296, 1, 1, 1, 1, 1,
1.598085, 1.718923, -0.1599955, 1, 1, 1, 1, 1,
1.60007, -0.2171861, 1.084523, 1, 1, 1, 1, 1,
1.600677, -0.995208, 2.769222, 1, 1, 1, 1, 1,
1.628662, -0.1747524, 2.871481, 1, 1, 1, 1, 1,
1.632394, -1.297275, 2.132682, 1, 1, 1, 1, 1,
1.635676, -0.5282175, 0.4155734, 1, 1, 1, 1, 1,
1.64901, -1.688784, 3.115968, 0, 0, 1, 1, 1,
1.651335, -0.8244355, 1.813897, 1, 0, 0, 1, 1,
1.667482, -1.443393, 3.947661, 1, 0, 0, 1, 1,
1.66957, -0.9162382, 2.931243, 1, 0, 0, 1, 1,
1.672749, -1.328572, 1.189722, 1, 0, 0, 1, 1,
1.676991, -0.08945192, -0.3497534, 1, 0, 0, 1, 1,
1.689723, 0.4198223, 1.953197, 0, 0, 0, 1, 1,
1.690359, -0.38182, 1.264565, 0, 0, 0, 1, 1,
1.69271, 2.00651, -0.4871313, 0, 0, 0, 1, 1,
1.6945, -0.3123033, 0.7641026, 0, 0, 0, 1, 1,
1.711983, -0.4130087, 1.635143, 0, 0, 0, 1, 1,
1.716939, -0.1988727, 2.405135, 0, 0, 0, 1, 1,
1.71859, -1.448385, 1.08587, 0, 0, 0, 1, 1,
1.721463, -1.000003, 1.739201, 1, 1, 1, 1, 1,
1.726043, -0.1573209, 2.008256, 1, 1, 1, 1, 1,
1.741794, 0.6251484, 2.756037, 1, 1, 1, 1, 1,
1.75474, -0.5457675, 2.552198, 1, 1, 1, 1, 1,
1.772162, 1.706021, 0.2792691, 1, 1, 1, 1, 1,
1.799086, -0.4235123, 2.007643, 1, 1, 1, 1, 1,
1.822432, 1.389766, 2.132327, 1, 1, 1, 1, 1,
1.832875, 1.055793, 1.845501, 1, 1, 1, 1, 1,
1.885987, -0.5393542, 3.7083, 1, 1, 1, 1, 1,
1.886474, 0.6290776, 1.789588, 1, 1, 1, 1, 1,
1.929947, 0.2066865, 1.192169, 1, 1, 1, 1, 1,
1.93561, -0.3750711, 1.921972, 1, 1, 1, 1, 1,
1.949207, -0.6239507, 1.482274, 1, 1, 1, 1, 1,
1.959779, -1.090103, 3.297359, 1, 1, 1, 1, 1,
1.966018, 1.145118, 0.09440389, 1, 1, 1, 1, 1,
1.988948, -0.5768756, 1.070309, 0, 0, 1, 1, 1,
2.002888, -1.762611, 2.990529, 1, 0, 0, 1, 1,
2.034422, 1.825747, 2.642431, 1, 0, 0, 1, 1,
2.048088, 0.2843096, 1.773587, 1, 0, 0, 1, 1,
2.066019, -0.3558932, 3.827499, 1, 0, 0, 1, 1,
2.10755, -0.4202089, 2.046995, 1, 0, 0, 1, 1,
2.11323, 1.360948, 0.4068274, 0, 0, 0, 1, 1,
2.135343, -1.821457, 2.422029, 0, 0, 0, 1, 1,
2.189763, 0.3605627, 1.463876, 0, 0, 0, 1, 1,
2.319052, 0.4879354, 1.404147, 0, 0, 0, 1, 1,
2.363142, -1.087311, 1.154301, 0, 0, 0, 1, 1,
2.429999, 0.6081372, -0.2823848, 0, 0, 0, 1, 1,
2.4375, 0.4837817, 1.548586, 0, 0, 0, 1, 1,
2.671005, -1.583952, 1.75098, 1, 1, 1, 1, 1,
2.77659, -0.2098595, 0.7843093, 1, 1, 1, 1, 1,
2.807027, 0.1189098, 3.22028, 1, 1, 1, 1, 1,
2.942991, 0.4320726, 0.6204035, 1, 1, 1, 1, 1,
3.250782, -0.3196345, 3.834658, 1, 1, 1, 1, 1,
3.272787, 1.111208, 1.045633, 1, 1, 1, 1, 1,
3.432229, -0.4412935, 2.145787, 1, 1, 1, 1, 1
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
var radius = 9.20285;
var distance = 32.32462;
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
mvMatrix.translate( -0.3588995, -0.08055401, -0.1194191 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32462);
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
