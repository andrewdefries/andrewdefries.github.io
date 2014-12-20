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
-3.359924, 0.9973481, 0.4377032, 1, 0, 0, 1,
-3.172081, 0.3338741, -1.319574, 1, 0.007843138, 0, 1,
-3.069582, 1.697711, -2.286609, 1, 0.01176471, 0, 1,
-3.00456, -0.9088074, -1.608531, 1, 0.01960784, 0, 1,
-2.85038, 0.3783416, 0.3011624, 1, 0.02352941, 0, 1,
-2.76796, -0.7630396, -1.838251, 1, 0.03137255, 0, 1,
-2.761539, 0.1631235, -1.512936, 1, 0.03529412, 0, 1,
-2.705275, 1.917472, -2.274571, 1, 0.04313726, 0, 1,
-2.67995, 1.435192, -0.8253297, 1, 0.04705882, 0, 1,
-2.676962, 0.3354242, 0.1443774, 1, 0.05490196, 0, 1,
-2.626431, -0.5573041, -0.1271588, 1, 0.05882353, 0, 1,
-2.612085, 0.4339873, 0.2017571, 1, 0.06666667, 0, 1,
-2.518611, -0.1195213, -0.9719982, 1, 0.07058824, 0, 1,
-2.464088, -1.431657, -3.905177, 1, 0.07843138, 0, 1,
-2.426486, 0.4434267, -1.399056, 1, 0.08235294, 0, 1,
-2.342749, 0.2141898, -1.287356, 1, 0.09019608, 0, 1,
-2.34169, 0.3276483, -1.021537, 1, 0.09411765, 0, 1,
-2.336988, -0.5071895, -0.8330994, 1, 0.1019608, 0, 1,
-2.297567, 1.064329, -2.194614, 1, 0.1098039, 0, 1,
-2.273305, -0.7387555, -1.293973, 1, 0.1137255, 0, 1,
-2.224043, 0.1074719, -1.878974, 1, 0.1215686, 0, 1,
-2.216792, 2.142889, 0.4593162, 1, 0.1254902, 0, 1,
-2.15442, -0.4196137, -1.853125, 1, 0.1333333, 0, 1,
-2.124344, -1.735041, -3.138464, 1, 0.1372549, 0, 1,
-2.087406, -0.06919064, -1.057071, 1, 0.145098, 0, 1,
-2.063018, -0.2975455, -3.328106, 1, 0.1490196, 0, 1,
-2.031044, -0.1175357, -1.471837, 1, 0.1568628, 0, 1,
-2.013888, -0.1356452, -0.9046694, 1, 0.1607843, 0, 1,
-1.93019, -0.3636419, -1.202412, 1, 0.1686275, 0, 1,
-1.916995, 1.004818, -1.911398, 1, 0.172549, 0, 1,
-1.880119, -1.190913, -1.489205, 1, 0.1803922, 0, 1,
-1.843042, -0.0170416, -2.386692, 1, 0.1843137, 0, 1,
-1.840894, -0.256794, -1.695924, 1, 0.1921569, 0, 1,
-1.813467, 0.06553896, -3.111782, 1, 0.1960784, 0, 1,
-1.811668, 0.1123382, -1.543823, 1, 0.2039216, 0, 1,
-1.777477, 1.717982, -0.08469189, 1, 0.2117647, 0, 1,
-1.76822, 1.522727, -0.646091, 1, 0.2156863, 0, 1,
-1.762142, -1.609566, -1.140965, 1, 0.2235294, 0, 1,
-1.749562, -0.02080185, -0.4149518, 1, 0.227451, 0, 1,
-1.741228, 0.6412289, -1.96177, 1, 0.2352941, 0, 1,
-1.737694, 0.07982761, -0.1178677, 1, 0.2392157, 0, 1,
-1.702445, 2.042639, 0.8884106, 1, 0.2470588, 0, 1,
-1.701075, -0.3445033, -3.175905, 1, 0.2509804, 0, 1,
-1.699446, 0.4507471, -3.06422, 1, 0.2588235, 0, 1,
-1.693361, -0.5842831, -1.534321, 1, 0.2627451, 0, 1,
-1.687677, -0.08614673, -0.7297298, 1, 0.2705882, 0, 1,
-1.679088, 0.2099903, -2.583992, 1, 0.2745098, 0, 1,
-1.671793, 0.3086141, -1.089731, 1, 0.282353, 0, 1,
-1.659827, -0.2732061, -2.209408, 1, 0.2862745, 0, 1,
-1.651374, 0.5627247, 0.2689978, 1, 0.2941177, 0, 1,
-1.635712, -0.3290628, -0.6289362, 1, 0.3019608, 0, 1,
-1.628512, -0.9445, -0.05590209, 1, 0.3058824, 0, 1,
-1.620437, -0.1368072, -1.821713, 1, 0.3137255, 0, 1,
-1.616953, 0.5013087, 0.6311958, 1, 0.3176471, 0, 1,
-1.597416, 1.138103, 0.3590082, 1, 0.3254902, 0, 1,
-1.587506, -0.004965607, -4.434403, 1, 0.3294118, 0, 1,
-1.586691, -0.308387, -2.008327, 1, 0.3372549, 0, 1,
-1.558423, 0.5657617, -0.4814562, 1, 0.3411765, 0, 1,
-1.544218, 0.2788723, -0.7766616, 1, 0.3490196, 0, 1,
-1.544014, -0.9179469, -3.66392, 1, 0.3529412, 0, 1,
-1.540844, 0.9759929, -0.7836165, 1, 0.3607843, 0, 1,
-1.530832, 0.583712, 0.7035943, 1, 0.3647059, 0, 1,
-1.517383, 0.1297784, -1.587459, 1, 0.372549, 0, 1,
-1.5151, -0.1149276, -4.153949, 1, 0.3764706, 0, 1,
-1.50935, 0.2551328, -2.697728, 1, 0.3843137, 0, 1,
-1.492474, -0.2741802, -1.352801, 1, 0.3882353, 0, 1,
-1.484834, 0.2306299, -2.205724, 1, 0.3960784, 0, 1,
-1.483147, -0.3776273, -0.8358572, 1, 0.4039216, 0, 1,
-1.47502, -1.040513, -1.376015, 1, 0.4078431, 0, 1,
-1.44561, 0.9929017, 0.639113, 1, 0.4156863, 0, 1,
-1.445299, -1.050997, -2.518104, 1, 0.4196078, 0, 1,
-1.423695, 0.5563021, -1.450396, 1, 0.427451, 0, 1,
-1.420144, -0.6219647, -2.89971, 1, 0.4313726, 0, 1,
-1.417523, -0.5881281, -2.842827, 1, 0.4392157, 0, 1,
-1.407099, -0.7156021, -2.081409, 1, 0.4431373, 0, 1,
-1.405056, 0.4991521, -0.3298871, 1, 0.4509804, 0, 1,
-1.401471, 0.6092895, -0.774458, 1, 0.454902, 0, 1,
-1.399221, -0.1663837, -2.266947, 1, 0.4627451, 0, 1,
-1.396888, -1.215072, -2.529048, 1, 0.4666667, 0, 1,
-1.396451, -0.0466629, -1.176975, 1, 0.4745098, 0, 1,
-1.388081, 0.8892819, -0.1973238, 1, 0.4784314, 0, 1,
-1.38759, 0.7275341, -1.892645, 1, 0.4862745, 0, 1,
-1.386974, -1.259601, -2.86668, 1, 0.4901961, 0, 1,
-1.383236, -0.4161019, -1.842635, 1, 0.4980392, 0, 1,
-1.382315, 0.02176226, -1.004303, 1, 0.5058824, 0, 1,
-1.37448, 0.5803096, -1.544683, 1, 0.509804, 0, 1,
-1.359839, 1.465584, -0.3891496, 1, 0.5176471, 0, 1,
-1.355443, -0.2510563, -2.249035, 1, 0.5215687, 0, 1,
-1.349933, -0.1885212, -3.447808, 1, 0.5294118, 0, 1,
-1.332635, 1.473684, -0.2046917, 1, 0.5333334, 0, 1,
-1.332521, -0.3220318, -2.533178, 1, 0.5411765, 0, 1,
-1.321718, -0.5809099, -2.589165, 1, 0.5450981, 0, 1,
-1.306205, 0.3012747, -2.675727, 1, 0.5529412, 0, 1,
-1.305688, 0.4515171, -0.4514705, 1, 0.5568628, 0, 1,
-1.298291, -1.774728, -2.613681, 1, 0.5647059, 0, 1,
-1.278018, -2.271582, -1.555032, 1, 0.5686275, 0, 1,
-1.254706, -0.2773766, -1.006396, 1, 0.5764706, 0, 1,
-1.253845, 1.888261, -1.593531, 1, 0.5803922, 0, 1,
-1.252206, 0.03077647, -2.821879, 1, 0.5882353, 0, 1,
-1.243171, -0.3076196, -1.174094, 1, 0.5921569, 0, 1,
-1.238763, 0.0224061, -1.970435, 1, 0.6, 0, 1,
-1.237514, 1.652584, -1.696533, 1, 0.6078432, 0, 1,
-1.228886, 3.645908, -0.9302241, 1, 0.6117647, 0, 1,
-1.228512, 0.1739126, -2.696858, 1, 0.6196079, 0, 1,
-1.22666, 0.01987537, -0.9918892, 1, 0.6235294, 0, 1,
-1.223978, 0.2567148, -0.2103952, 1, 0.6313726, 0, 1,
-1.221423, 0.3588442, -0.6549776, 1, 0.6352941, 0, 1,
-1.217824, 1.644949, 0.01706176, 1, 0.6431373, 0, 1,
-1.210742, 1.547908, -1.86864, 1, 0.6470588, 0, 1,
-1.209988, 1.951767, -0.6984761, 1, 0.654902, 0, 1,
-1.20438, 0.2158759, -1.337473, 1, 0.6588235, 0, 1,
-1.197366, -0.6061182, -3.165524, 1, 0.6666667, 0, 1,
-1.195795, 1.227451, 0.1420338, 1, 0.6705883, 0, 1,
-1.187961, -1.929042, -2.250361, 1, 0.6784314, 0, 1,
-1.187878, 0.6903327, -1.773963, 1, 0.682353, 0, 1,
-1.187444, 0.1039726, -1.844251, 1, 0.6901961, 0, 1,
-1.176828, -0.9626527, -4.165014, 1, 0.6941177, 0, 1,
-1.169886, 0.2694534, -2.141239, 1, 0.7019608, 0, 1,
-1.167138, -1.056647, -2.741648, 1, 0.7098039, 0, 1,
-1.164929, -1.11093, -4.23766, 1, 0.7137255, 0, 1,
-1.150346, -1.691442, -1.950855, 1, 0.7215686, 0, 1,
-1.141271, -1.197667, -3.011026, 1, 0.7254902, 0, 1,
-1.141051, 1.292885, -1.198017, 1, 0.7333333, 0, 1,
-1.136416, 1.717596, -0.9282244, 1, 0.7372549, 0, 1,
-1.125167, 0.3808929, -1.78681, 1, 0.7450981, 0, 1,
-1.12287, 0.1342853, -2.231, 1, 0.7490196, 0, 1,
-1.105779, 0.01393975, -1.703788, 1, 0.7568628, 0, 1,
-1.098165, -0.2286361, -0.8287488, 1, 0.7607843, 0, 1,
-1.08867, 0.05823951, -1.71334, 1, 0.7686275, 0, 1,
-1.082359, 0.6691316, -2.360245, 1, 0.772549, 0, 1,
-1.081793, -0.4781992, -2.114208, 1, 0.7803922, 0, 1,
-1.081484, -0.6891121, -3.174681, 1, 0.7843137, 0, 1,
-1.07751, -0.600608, -2.389811, 1, 0.7921569, 0, 1,
-1.075854, -0.2269458, -1.867473, 1, 0.7960784, 0, 1,
-1.069542, 1.692815, 0.7440953, 1, 0.8039216, 0, 1,
-1.069456, 2.58013, 0.6062888, 1, 0.8117647, 0, 1,
-1.060941, 1.339611, -1.379369, 1, 0.8156863, 0, 1,
-1.054324, -0.4088794, -1.753429, 1, 0.8235294, 0, 1,
-1.053265, -1.503424, -2.923343, 1, 0.827451, 0, 1,
-1.052588, 0.5313608, -1.448483, 1, 0.8352941, 0, 1,
-1.048925, 0.3628818, -1.507191, 1, 0.8392157, 0, 1,
-1.048053, -0.454738, -0.4336632, 1, 0.8470588, 0, 1,
-1.047641, -0.5788999, -1.334201, 1, 0.8509804, 0, 1,
-1.045327, -0.5644471, -1.03402, 1, 0.8588235, 0, 1,
-1.039842, -0.02765741, -2.655785, 1, 0.8627451, 0, 1,
-1.03226, -0.05491634, -0.8824828, 1, 0.8705882, 0, 1,
-1.024264, -0.5797331, -0.6482683, 1, 0.8745098, 0, 1,
-1.024086, 1.210919, -0.6980826, 1, 0.8823529, 0, 1,
-1.023578, -0.5353496, -0.1120363, 1, 0.8862745, 0, 1,
-1.021223, -1.608509, -3.561023, 1, 0.8941177, 0, 1,
-1.01448, 0.3973174, -2.333424, 1, 0.8980392, 0, 1,
-1.011161, 0.5262293, -1.899133, 1, 0.9058824, 0, 1,
-1.00594, 0.3380205, -0.1989148, 1, 0.9137255, 0, 1,
-0.9983432, 0.9321062, -0.2318504, 1, 0.9176471, 0, 1,
-0.9934298, 0.8137404, 0.5212581, 1, 0.9254902, 0, 1,
-0.9764229, 0.09379511, 0.3380693, 1, 0.9294118, 0, 1,
-0.9748827, -0.4544096, -1.30972, 1, 0.9372549, 0, 1,
-0.9730004, -0.2869024, -0.6667634, 1, 0.9411765, 0, 1,
-0.9724217, 0.2482996, -1.414351, 1, 0.9490196, 0, 1,
-0.9702242, 2.363717, 0.4277018, 1, 0.9529412, 0, 1,
-0.9604464, 1.175209, 1.407997, 1, 0.9607843, 0, 1,
-0.9570419, -0.2092866, -1.281252, 1, 0.9647059, 0, 1,
-0.9536915, 0.6874393, -1.738627, 1, 0.972549, 0, 1,
-0.9347184, 0.5069136, -1.490569, 1, 0.9764706, 0, 1,
-0.9319893, 0.3627113, -3.25686, 1, 0.9843137, 0, 1,
-0.928323, -0.5899115, -1.990796, 1, 0.9882353, 0, 1,
-0.9204914, -0.1366458, -3.177742, 1, 0.9960784, 0, 1,
-0.9193983, -0.3167368, -1.789748, 0.9960784, 1, 0, 1,
-0.9188705, -0.5821208, -2.404824, 0.9921569, 1, 0, 1,
-0.9185663, -0.4704845, -0.761233, 0.9843137, 1, 0, 1,
-0.9151055, -0.3321145, -2.536032, 0.9803922, 1, 0, 1,
-0.9149114, -0.7221101, -2.568841, 0.972549, 1, 0, 1,
-0.9144683, -0.6091123, -2.228225, 0.9686275, 1, 0, 1,
-0.9141015, 1.763708, -0.7435225, 0.9607843, 1, 0, 1,
-0.9119915, 0.281903, -3.115615, 0.9568627, 1, 0, 1,
-0.9051049, 1.054264, 0.07837328, 0.9490196, 1, 0, 1,
-0.9001993, 0.04533356, -0.6364539, 0.945098, 1, 0, 1,
-0.8991129, 0.07744215, -2.770941, 0.9372549, 1, 0, 1,
-0.8982755, -0.2326162, -0.3309847, 0.9333333, 1, 0, 1,
-0.8974481, -0.2064076, -2.353817, 0.9254902, 1, 0, 1,
-0.8937773, 0.2960332, -0.2251976, 0.9215686, 1, 0, 1,
-0.8900872, -0.1681177, -1.817233, 0.9137255, 1, 0, 1,
-0.8877931, 0.7026291, -1.623435, 0.9098039, 1, 0, 1,
-0.8863024, -0.2768886, -2.134707, 0.9019608, 1, 0, 1,
-0.8856478, 2.619597, -0.279485, 0.8941177, 1, 0, 1,
-0.865177, -1.61676, -3.548325, 0.8901961, 1, 0, 1,
-0.8615544, -1.140501, -0.2995087, 0.8823529, 1, 0, 1,
-0.8603898, -1.428679, -2.485826, 0.8784314, 1, 0, 1,
-0.8482798, -0.3321005, -0.344114, 0.8705882, 1, 0, 1,
-0.8411049, 0.2281324, -0.2889636, 0.8666667, 1, 0, 1,
-0.8401181, -1.144657, -1.776072, 0.8588235, 1, 0, 1,
-0.8398569, -0.1409539, -2.256345, 0.854902, 1, 0, 1,
-0.8313822, 1.803216, -0.6829527, 0.8470588, 1, 0, 1,
-0.8250062, -1.76321, -1.241754, 0.8431373, 1, 0, 1,
-0.8244625, -1.077461, -3.060759, 0.8352941, 1, 0, 1,
-0.8202197, -1.110426, -1.844929, 0.8313726, 1, 0, 1,
-0.8196949, 1.312122, -0.9559216, 0.8235294, 1, 0, 1,
-0.8191744, -0.2624008, -2.384983, 0.8196079, 1, 0, 1,
-0.8159378, -0.8235993, -1.281854, 0.8117647, 1, 0, 1,
-0.8130773, -1.054915, -1.241157, 0.8078431, 1, 0, 1,
-0.8123346, -1.386699, -4.39869, 0.8, 1, 0, 1,
-0.8114647, -0.8836291, -2.128607, 0.7921569, 1, 0, 1,
-0.809463, 0.2033296, -1.385158, 0.7882353, 1, 0, 1,
-0.8067604, -0.8989043, -1.697518, 0.7803922, 1, 0, 1,
-0.8041065, 0.7105032, -2.942198, 0.7764706, 1, 0, 1,
-0.801658, 0.1196399, -1.882702, 0.7686275, 1, 0, 1,
-0.8015454, 0.8374775, -1.006618, 0.7647059, 1, 0, 1,
-0.7850367, 0.2097893, 0.4927097, 0.7568628, 1, 0, 1,
-0.7799774, 0.01153759, -2.329313, 0.7529412, 1, 0, 1,
-0.7678875, -0.6977218, -0.4387177, 0.7450981, 1, 0, 1,
-0.7624936, 0.2100181, -2.265487, 0.7411765, 1, 0, 1,
-0.7595567, -0.8650386, -3.719282, 0.7333333, 1, 0, 1,
-0.7588722, -0.8095853, -2.237282, 0.7294118, 1, 0, 1,
-0.7584119, 0.714689, -1.512211, 0.7215686, 1, 0, 1,
-0.7513107, 1.389119, -1.334122, 0.7176471, 1, 0, 1,
-0.7495552, 0.6579669, -1.676049, 0.7098039, 1, 0, 1,
-0.7427595, -1.053818, -2.546838, 0.7058824, 1, 0, 1,
-0.742476, 0.9559845, -0.03354814, 0.6980392, 1, 0, 1,
-0.7382926, -0.1295625, -2.697599, 0.6901961, 1, 0, 1,
-0.7345339, 0.3152098, -1.60297, 0.6862745, 1, 0, 1,
-0.7342469, 0.9734928, -0.1456926, 0.6784314, 1, 0, 1,
-0.7329181, 0.7821395, -0.9385322, 0.6745098, 1, 0, 1,
-0.7304625, 1.849067, 0.2855297, 0.6666667, 1, 0, 1,
-0.7271175, 0.3023433, -1.335637, 0.6627451, 1, 0, 1,
-0.7270511, -0.6225587, -1.627556, 0.654902, 1, 0, 1,
-0.7259535, -0.4197179, -1.459798, 0.6509804, 1, 0, 1,
-0.720404, 0.09529953, -1.597352, 0.6431373, 1, 0, 1,
-0.7139795, 0.5659048, -0.2000639, 0.6392157, 1, 0, 1,
-0.7070182, -1.086495, -1.000661, 0.6313726, 1, 0, 1,
-0.7051488, -0.9585833, -1.329675, 0.627451, 1, 0, 1,
-0.7024872, 1.008943, -1.811288, 0.6196079, 1, 0, 1,
-0.7001946, -0.7985078, -1.819446, 0.6156863, 1, 0, 1,
-0.6955367, 0.6244362, -0.02298664, 0.6078432, 1, 0, 1,
-0.6909911, 1.768765, 0.1356314, 0.6039216, 1, 0, 1,
-0.6805888, -0.9916888, -0.8737885, 0.5960785, 1, 0, 1,
-0.6773815, -0.01466836, -0.6965094, 0.5882353, 1, 0, 1,
-0.6744359, -2.099498, -1.970538, 0.5843138, 1, 0, 1,
-0.6548975, 2.207938, -0.2796916, 0.5764706, 1, 0, 1,
-0.6508259, 0.6230863, -0.6549796, 0.572549, 1, 0, 1,
-0.6507748, 0.3903903, -1.636778, 0.5647059, 1, 0, 1,
-0.6503925, 0.02872779, -1.775898, 0.5607843, 1, 0, 1,
-0.6487582, -0.3492918, -3.619313, 0.5529412, 1, 0, 1,
-0.6475212, 0.8222947, -1.849414, 0.5490196, 1, 0, 1,
-0.6473861, -0.6582178, -1.880125, 0.5411765, 1, 0, 1,
-0.6467772, 1.454259, -0.4762308, 0.5372549, 1, 0, 1,
-0.6462944, -0.1638238, -2.731842, 0.5294118, 1, 0, 1,
-0.6389071, -0.7539814, -3.492985, 0.5254902, 1, 0, 1,
-0.6378686, 1.047171, 0.8564477, 0.5176471, 1, 0, 1,
-0.6368929, 1.338721, -1.619251, 0.5137255, 1, 0, 1,
-0.6339106, 1.407062, 0.3313205, 0.5058824, 1, 0, 1,
-0.6303304, 0.7588574, -1.357418, 0.5019608, 1, 0, 1,
-0.6273845, 0.5456077, 0.5008869, 0.4941176, 1, 0, 1,
-0.6271526, -0.9784319, -1.67407, 0.4862745, 1, 0, 1,
-0.6265293, -0.3211749, -2.908313, 0.4823529, 1, 0, 1,
-0.6187084, -0.3697746, -2.327852, 0.4745098, 1, 0, 1,
-0.6163211, -0.1429764, -2.396962, 0.4705882, 1, 0, 1,
-0.6131998, -1.373435, -3.056305, 0.4627451, 1, 0, 1,
-0.6120828, -0.0110357, -0.9256313, 0.4588235, 1, 0, 1,
-0.6115921, 0.5376744, 0.4182677, 0.4509804, 1, 0, 1,
-0.6101902, -1.32476, -3.607493, 0.4470588, 1, 0, 1,
-0.6088159, 0.5439942, -0.08259223, 0.4392157, 1, 0, 1,
-0.6036414, -2.047759, -0.1455414, 0.4352941, 1, 0, 1,
-0.6031556, 0.3968723, -1.68211, 0.427451, 1, 0, 1,
-0.5997241, -0.3347074, -0.8955998, 0.4235294, 1, 0, 1,
-0.5881411, 0.08729485, -0.7191859, 0.4156863, 1, 0, 1,
-0.5861748, -1.343563, -1.948605, 0.4117647, 1, 0, 1,
-0.5783441, 1.784878, 0.9108068, 0.4039216, 1, 0, 1,
-0.5781752, 1.870174, -1.514281, 0.3960784, 1, 0, 1,
-0.5758362, -0.8122245, -2.912824, 0.3921569, 1, 0, 1,
-0.5734872, -0.483271, -1.404757, 0.3843137, 1, 0, 1,
-0.5716942, -0.3991014, -2.873029, 0.3803922, 1, 0, 1,
-0.5709096, -1.156086, -0.4280384, 0.372549, 1, 0, 1,
-0.5693085, 2.59625, 0.3235592, 0.3686275, 1, 0, 1,
-0.5623509, 1.939296, -1.912372, 0.3607843, 1, 0, 1,
-0.561603, -0.3688825, -2.963647, 0.3568628, 1, 0, 1,
-0.5611414, 0.9086482, -2.320629, 0.3490196, 1, 0, 1,
-0.5538317, 1.096349, -1.651728, 0.345098, 1, 0, 1,
-0.5534536, 0.3970681, -1.815061, 0.3372549, 1, 0, 1,
-0.5494727, -0.3480313, -0.4181134, 0.3333333, 1, 0, 1,
-0.5489233, 0.2289655, -1.227099, 0.3254902, 1, 0, 1,
-0.5473651, -1.283721, -4.05147, 0.3215686, 1, 0, 1,
-0.5450342, -0.8978588, -1.68801, 0.3137255, 1, 0, 1,
-0.5415043, -0.3215269, -1.562556, 0.3098039, 1, 0, 1,
-0.5318701, -1.631328, -1.65296, 0.3019608, 1, 0, 1,
-0.5268372, 1.713185, -0.679382, 0.2941177, 1, 0, 1,
-0.5235585, 0.3460478, -0.2375964, 0.2901961, 1, 0, 1,
-0.5204493, 0.4086793, 0.1412605, 0.282353, 1, 0, 1,
-0.5202672, -1.404824, -2.33354, 0.2784314, 1, 0, 1,
-0.5174682, -1.428888, -3.252675, 0.2705882, 1, 0, 1,
-0.5142217, 1.514026, -0.03000089, 0.2666667, 1, 0, 1,
-0.5141188, 1.123634, -1.373689, 0.2588235, 1, 0, 1,
-0.51319, -1.288609, -3.629412, 0.254902, 1, 0, 1,
-0.5095153, -0.2607977, -2.061829, 0.2470588, 1, 0, 1,
-0.5085865, -0.394156, -2.920516, 0.2431373, 1, 0, 1,
-0.5073042, 0.5660933, -0.4987029, 0.2352941, 1, 0, 1,
-0.5065172, 0.5938291, -1.32246, 0.2313726, 1, 0, 1,
-0.5044843, -0.01620441, -1.966036, 0.2235294, 1, 0, 1,
-0.502246, -0.6103879, -4.759291, 0.2196078, 1, 0, 1,
-0.4947447, -1.241051, -3.991827, 0.2117647, 1, 0, 1,
-0.4943529, 0.3078332, -0.9759776, 0.2078431, 1, 0, 1,
-0.492682, 0.3771625, -0.9820295, 0.2, 1, 0, 1,
-0.4899774, 0.7554265, 0.01556479, 0.1921569, 1, 0, 1,
-0.489445, 1.327945, -0.9494233, 0.1882353, 1, 0, 1,
-0.4893593, -0.3885032, -3.296726, 0.1803922, 1, 0, 1,
-0.4835869, -0.002184827, -0.4213812, 0.1764706, 1, 0, 1,
-0.4766264, -0.6536065, -2.219714, 0.1686275, 1, 0, 1,
-0.4755383, -0.8469484, -2.905995, 0.1647059, 1, 0, 1,
-0.466524, 2.067416, 0.01836214, 0.1568628, 1, 0, 1,
-0.4606294, 0.1294866, 0.05384657, 0.1529412, 1, 0, 1,
-0.4602863, -0.7072154, -5.523637, 0.145098, 1, 0, 1,
-0.4591566, -0.7224995, -2.805117, 0.1411765, 1, 0, 1,
-0.4551092, -1.552237, -2.308932, 0.1333333, 1, 0, 1,
-0.4539132, 0.6538805, -0.4640101, 0.1294118, 1, 0, 1,
-0.4530025, 0.02825634, -2.452459, 0.1215686, 1, 0, 1,
-0.4459585, -0.7940018, -4.131532, 0.1176471, 1, 0, 1,
-0.4448442, 0.52826, -1.348964, 0.1098039, 1, 0, 1,
-0.441314, -0.491938, -4.06856, 0.1058824, 1, 0, 1,
-0.4387951, 0.3464767, 1.434483, 0.09803922, 1, 0, 1,
-0.4360615, -0.3227877, -2.728264, 0.09019608, 1, 0, 1,
-0.4349289, 0.008043843, -1.980589, 0.08627451, 1, 0, 1,
-0.4333473, 0.7683825, -0.8471481, 0.07843138, 1, 0, 1,
-0.4301324, -0.51323, -2.212067, 0.07450981, 1, 0, 1,
-0.428661, 0.8812203, -0.104274, 0.06666667, 1, 0, 1,
-0.4275078, -0.4296809, -2.508943, 0.0627451, 1, 0, 1,
-0.4247541, 0.6675216, -1.409681, 0.05490196, 1, 0, 1,
-0.4215071, 0.1071421, -3.025194, 0.05098039, 1, 0, 1,
-0.4187374, 0.4281, -0.1162274, 0.04313726, 1, 0, 1,
-0.417466, 0.003872937, 2.166961, 0.03921569, 1, 0, 1,
-0.4162345, 0.2299688, -0.4470038, 0.03137255, 1, 0, 1,
-0.4139087, -0.3304806, -4.275122, 0.02745098, 1, 0, 1,
-0.4120836, 1.033841, 0.9940073, 0.01960784, 1, 0, 1,
-0.4112532, -1.384833, -3.211203, 0.01568628, 1, 0, 1,
-0.4090757, -1.021355, -3.163677, 0.007843138, 1, 0, 1,
-0.4059735, -0.3523825, -1.646193, 0.003921569, 1, 0, 1,
-0.4059638, -1.600337, -2.962596, 0, 1, 0.003921569, 1,
-0.4057802, 0.6133021, -1.020671, 0, 1, 0.01176471, 1,
-0.4056139, -1.357201, -2.772231, 0, 1, 0.01568628, 1,
-0.4049061, 1.654757, 0.2433735, 0, 1, 0.02352941, 1,
-0.3995658, 0.3120239, -1.182031, 0, 1, 0.02745098, 1,
-0.3984996, 0.3438621, -1.6383, 0, 1, 0.03529412, 1,
-0.3984114, 0.04918632, -0.6093079, 0, 1, 0.03921569, 1,
-0.393314, 1.989028, 0.6627608, 0, 1, 0.04705882, 1,
-0.3898053, 0.9520956, -0.02250983, 0, 1, 0.05098039, 1,
-0.3872583, 0.1241651, -0.6424891, 0, 1, 0.05882353, 1,
-0.3802944, 0.552399, 0.1430618, 0, 1, 0.0627451, 1,
-0.376202, 0.2451306, 0.07065196, 0, 1, 0.07058824, 1,
-0.3743805, -0.4927046, -2.006805, 0, 1, 0.07450981, 1,
-0.3703465, 0.1233659, 0.5257733, 0, 1, 0.08235294, 1,
-0.3687858, -0.5150871, -2.643574, 0, 1, 0.08627451, 1,
-0.3681846, -0.5167204, -3.285029, 0, 1, 0.09411765, 1,
-0.3678375, 1.234168, -0.4138213, 0, 1, 0.1019608, 1,
-0.3654193, -1.774638, -3.434279, 0, 1, 0.1058824, 1,
-0.365303, -2.467662, -3.427989, 0, 1, 0.1137255, 1,
-0.3646563, -1.5425, -2.661194, 0, 1, 0.1176471, 1,
-0.3636939, -0.1848901, -3.440822, 0, 1, 0.1254902, 1,
-0.3612472, -0.7912917, -1.107636, 0, 1, 0.1294118, 1,
-0.3610692, -0.1622707, -0.8255654, 0, 1, 0.1372549, 1,
-0.3590125, 0.5992784, -1.100434, 0, 1, 0.1411765, 1,
-0.35447, -1.126009, -1.99962, 0, 1, 0.1490196, 1,
-0.351838, -0.2096819, -3.09409, 0, 1, 0.1529412, 1,
-0.3463487, 1.75748, -1.3943, 0, 1, 0.1607843, 1,
-0.3384912, 0.3546488, -3.420009, 0, 1, 0.1647059, 1,
-0.337524, -0.4666403, -5.208831, 0, 1, 0.172549, 1,
-0.3316194, 0.7875834, -0.6252515, 0, 1, 0.1764706, 1,
-0.3313339, -1.70761, -2.953673, 0, 1, 0.1843137, 1,
-0.3310441, -1.496533, -4.074436, 0, 1, 0.1882353, 1,
-0.3295916, -0.5571377, -2.200221, 0, 1, 0.1960784, 1,
-0.3295637, -0.5457447, -2.945077, 0, 1, 0.2039216, 1,
-0.3248358, -0.9594201, -4.632591, 0, 1, 0.2078431, 1,
-0.3224413, 0.0199111, -0.1854084, 0, 1, 0.2156863, 1,
-0.3209316, 0.4303164, 1.389366, 0, 1, 0.2196078, 1,
-0.3137594, -0.4615356, -2.225736, 0, 1, 0.227451, 1,
-0.3127792, -2.220125, -4.247092, 0, 1, 0.2313726, 1,
-0.3109889, 0.3198575, 0.4998517, 0, 1, 0.2392157, 1,
-0.3096296, 1.086542, -1.33442, 0, 1, 0.2431373, 1,
-0.3070372, 1.168227, 0.3704871, 0, 1, 0.2509804, 1,
-0.2993839, -1.860657, -0.5133798, 0, 1, 0.254902, 1,
-0.2965555, 2.486984, -1.456464, 0, 1, 0.2627451, 1,
-0.2939892, 0.04768017, -1.512338, 0, 1, 0.2666667, 1,
-0.2907394, 0.3777391, -0.7671426, 0, 1, 0.2745098, 1,
-0.285069, -1.002604, -1.814967, 0, 1, 0.2784314, 1,
-0.2769307, 0.4788883, 0.2211037, 0, 1, 0.2862745, 1,
-0.2742063, 0.9199173, 0.2983395, 0, 1, 0.2901961, 1,
-0.2717341, 0.7493657, 0.7427127, 0, 1, 0.2980392, 1,
-0.270277, -0.4071709, -1.918429, 0, 1, 0.3058824, 1,
-0.2694531, 0.3619729, -1.146496, 0, 1, 0.3098039, 1,
-0.2682235, -0.5096452, -1.197888, 0, 1, 0.3176471, 1,
-0.2678849, 0.3975409, -0.498687, 0, 1, 0.3215686, 1,
-0.267213, 0.6065466, -1.759986, 0, 1, 0.3294118, 1,
-0.2629938, -0.4493593, -2.809049, 0, 1, 0.3333333, 1,
-0.2600657, -0.7527343, -1.152403, 0, 1, 0.3411765, 1,
-0.2572998, 0.08660958, -0.9860498, 0, 1, 0.345098, 1,
-0.253043, 0.01684941, -0.9676976, 0, 1, 0.3529412, 1,
-0.2521934, -0.1279718, -1.629408, 0, 1, 0.3568628, 1,
-0.2494479, 1.480198, 0.254722, 0, 1, 0.3647059, 1,
-0.2473667, -0.2622434, -3.242328, 0, 1, 0.3686275, 1,
-0.2456165, -0.5258211, -1.98692, 0, 1, 0.3764706, 1,
-0.244013, -0.7890571, -1.62101, 0, 1, 0.3803922, 1,
-0.2430612, -0.06358162, -2.627142, 0, 1, 0.3882353, 1,
-0.2400493, 0.5035893, 1.854971, 0, 1, 0.3921569, 1,
-0.2395076, 1.609771, 0.7092266, 0, 1, 0.4, 1,
-0.2384607, 0.4008869, -0.5680279, 0, 1, 0.4078431, 1,
-0.2377135, -0.2976156, -2.42031, 0, 1, 0.4117647, 1,
-0.2364704, -0.18116, -3.371376, 0, 1, 0.4196078, 1,
-0.2360124, -1.045582, -3.051539, 0, 1, 0.4235294, 1,
-0.2326164, 2.454948, -0.59312, 0, 1, 0.4313726, 1,
-0.2251014, -1.120304, -3.754805, 0, 1, 0.4352941, 1,
-0.2250753, -0.3799704, -4.215631, 0, 1, 0.4431373, 1,
-0.2243924, 0.8639017, -0.8362969, 0, 1, 0.4470588, 1,
-0.2203837, 0.07007895, -0.4184994, 0, 1, 0.454902, 1,
-0.2149469, 0.3546704, 0.1731237, 0, 1, 0.4588235, 1,
-0.2088132, 0.3405301, 0.1859194, 0, 1, 0.4666667, 1,
-0.2082543, -1.234129, -4.368379, 0, 1, 0.4705882, 1,
-0.2055009, -0.2061179, -2.810213, 0, 1, 0.4784314, 1,
-0.2047572, 0.6991237, -1.614416, 0, 1, 0.4823529, 1,
-0.2044902, 0.6159572, 0.1717002, 0, 1, 0.4901961, 1,
-0.202989, 0.03457962, -0.5246877, 0, 1, 0.4941176, 1,
-0.1979875, 0.02289749, -1.573865, 0, 1, 0.5019608, 1,
-0.1972796, 0.4450659, 1.156127, 0, 1, 0.509804, 1,
-0.196742, 0.04822185, -0.5257905, 0, 1, 0.5137255, 1,
-0.1966764, -0.9810066, -2.78051, 0, 1, 0.5215687, 1,
-0.19133, 0.6270501, -2.322669, 0, 1, 0.5254902, 1,
-0.1908108, -1.998192, -3.829932, 0, 1, 0.5333334, 1,
-0.1886045, -0.499365, -3.330592, 0, 1, 0.5372549, 1,
-0.1880514, 0.9329944, -0.2632179, 0, 1, 0.5450981, 1,
-0.1842047, -4.114034, -3.871364, 0, 1, 0.5490196, 1,
-0.1814684, -0.338051, -3.283494, 0, 1, 0.5568628, 1,
-0.1801717, 0.6709717, -0.1940411, 0, 1, 0.5607843, 1,
-0.1742851, -2.095116, -1.249514, 0, 1, 0.5686275, 1,
-0.173665, 0.2309199, 0.6213758, 0, 1, 0.572549, 1,
-0.1693794, 0.02394785, -1.67688, 0, 1, 0.5803922, 1,
-0.168163, -0.2037381, -0.7966719, 0, 1, 0.5843138, 1,
-0.163507, -1.595023, -5.303668, 0, 1, 0.5921569, 1,
-0.1613997, -0.4553056, -1.854368, 0, 1, 0.5960785, 1,
-0.1595899, 1.376435, -0.5499251, 0, 1, 0.6039216, 1,
-0.1571577, 0.9912682, 0.1525342, 0, 1, 0.6117647, 1,
-0.1534684, -0.9466837, -3.211103, 0, 1, 0.6156863, 1,
-0.1524915, 1.106455, 0.9467689, 0, 1, 0.6235294, 1,
-0.1518007, -1.53311, -2.461672, 0, 1, 0.627451, 1,
-0.1492049, -0.6137547, -1.581543, 0, 1, 0.6352941, 1,
-0.1467414, 1.504584, -0.3605916, 0, 1, 0.6392157, 1,
-0.1446799, -1.294649, -2.800984, 0, 1, 0.6470588, 1,
-0.1426793, 1.012451, -1.818693, 0, 1, 0.6509804, 1,
-0.1363278, -0.5078261, -3.705266, 0, 1, 0.6588235, 1,
-0.135645, -0.8407953, -3.841549, 0, 1, 0.6627451, 1,
-0.1353711, 0.04057518, -1.447477, 0, 1, 0.6705883, 1,
-0.1353618, -0.1133618, -3.266585, 0, 1, 0.6745098, 1,
-0.1349852, 0.2290643, -0.2765912, 0, 1, 0.682353, 1,
-0.1311174, 0.6842992, 0.7155622, 0, 1, 0.6862745, 1,
-0.1299087, -1.214998, -2.217833, 0, 1, 0.6941177, 1,
-0.1291679, -1.507774, -2.34976, 0, 1, 0.7019608, 1,
-0.1265796, 0.8210795, -0.8626433, 0, 1, 0.7058824, 1,
-0.1250613, 1.604407, -0.07697645, 0, 1, 0.7137255, 1,
-0.1136253, -0.1306406, -3.769205, 0, 1, 0.7176471, 1,
-0.1130317, -0.5133835, -4.408333, 0, 1, 0.7254902, 1,
-0.1119994, 3.103786, -0.831879, 0, 1, 0.7294118, 1,
-0.1076812, 1.174333, -0.3272693, 0, 1, 0.7372549, 1,
-0.103389, -0.9187114, -3.699531, 0, 1, 0.7411765, 1,
-0.1019501, -0.7529671, -2.453791, 0, 1, 0.7490196, 1,
-0.09882633, 1.009801, 0.2426061, 0, 1, 0.7529412, 1,
-0.0974906, 0.2867232, -0.3591148, 0, 1, 0.7607843, 1,
-0.09372064, -0.3597962, -2.974483, 0, 1, 0.7647059, 1,
-0.09332963, 1.64396, -0.1357882, 0, 1, 0.772549, 1,
-0.0921548, -0.7183066, -2.130018, 0, 1, 0.7764706, 1,
-0.09096039, 2.287286, 0.9326698, 0, 1, 0.7843137, 1,
-0.08753461, -0.7764966, -3.267017, 0, 1, 0.7882353, 1,
-0.08081481, -0.4891032, -1.760201, 0, 1, 0.7960784, 1,
-0.08000235, 0.8367373, -0.02637289, 0, 1, 0.8039216, 1,
-0.07541545, 0.3362633, 0.7493662, 0, 1, 0.8078431, 1,
-0.07318018, -1.126896, -4.606812, 0, 1, 0.8156863, 1,
-0.0680069, -0.7346783, -3.811145, 0, 1, 0.8196079, 1,
-0.06413339, -0.1510934, -4.675617, 0, 1, 0.827451, 1,
-0.061049, 0.6522963, 0.04677321, 0, 1, 0.8313726, 1,
-0.05883325, -0.3211081, -3.762652, 0, 1, 0.8392157, 1,
-0.05442804, 1.994241, -0.6061725, 0, 1, 0.8431373, 1,
-0.04978802, -0.8283464, -0.9508845, 0, 1, 0.8509804, 1,
-0.04688761, 0.5008249, 0.7174065, 0, 1, 0.854902, 1,
-0.04107565, 0.2839513, -1.304213, 0, 1, 0.8627451, 1,
-0.04022368, 0.06496639, -1.484361, 0, 1, 0.8666667, 1,
-0.03859965, -0.3657638, -1.79826, 0, 1, 0.8745098, 1,
-0.03669666, -0.7841724, -2.363444, 0, 1, 0.8784314, 1,
-0.03476236, 0.4049201, -0.001472897, 0, 1, 0.8862745, 1,
-0.03320695, 0.05608857, -0.208687, 0, 1, 0.8901961, 1,
-0.0305962, -1.564882, -3.522224, 0, 1, 0.8980392, 1,
-0.02909593, -1.105696, -2.60353, 0, 1, 0.9058824, 1,
-0.02574377, 0.8462067, -0.9253368, 0, 1, 0.9098039, 1,
-0.02318337, -0.1629219, -1.244668, 0, 1, 0.9176471, 1,
-0.01886635, -1.495218, -1.935137, 0, 1, 0.9215686, 1,
-0.0167079, 1.4302, 0.7234167, 0, 1, 0.9294118, 1,
-0.01616022, -0.02476372, -2.573857, 0, 1, 0.9333333, 1,
-0.01404453, 1.314812, 0.2079962, 0, 1, 0.9411765, 1,
-0.0129662, -1.213411, -2.830503, 0, 1, 0.945098, 1,
-0.01210933, 1.492429, -1.017066, 0, 1, 0.9529412, 1,
-0.01186252, 1.027384, 0.7127885, 0, 1, 0.9568627, 1,
-0.008327113, 0.5785578, -1.066116, 0, 1, 0.9647059, 1,
-0.001033282, 0.3516991, 1.689583, 0, 1, 0.9686275, 1,
8.912203e-05, -1.248328, 2.109067, 0, 1, 0.9764706, 1,
0.002103767, -0.1728152, 2.603747, 0, 1, 0.9803922, 1,
0.002133799, -0.4267756, 3.218034, 0, 1, 0.9882353, 1,
0.002556092, -0.7877687, 3.558337, 0, 1, 0.9921569, 1,
0.008043955, -1.27967, 3.5776, 0, 1, 1, 1,
0.01591351, -0.8441682, 2.916335, 0, 0.9921569, 1, 1,
0.01633966, 0.5487716, 2.051548, 0, 0.9882353, 1, 1,
0.02048311, 0.3890366, 1.522941, 0, 0.9803922, 1, 1,
0.020607, 0.8828047, -0.1491505, 0, 0.9764706, 1, 1,
0.02571701, -0.3268272, 1.617534, 0, 0.9686275, 1, 1,
0.02585997, -2.303965, 2.6394, 0, 0.9647059, 1, 1,
0.02729125, -0.931033, 2.852978, 0, 0.9568627, 1, 1,
0.03099687, 0.1655181, -0.05030462, 0, 0.9529412, 1, 1,
0.03313954, -0.7564156, 3.944379, 0, 0.945098, 1, 1,
0.03420365, 0.5276453, -0.6473305, 0, 0.9411765, 1, 1,
0.04316917, -0.2887155, 2.791375, 0, 0.9333333, 1, 1,
0.04760704, -0.2575947, 3.270877, 0, 0.9294118, 1, 1,
0.04928894, 0.786414, -0.6578519, 0, 0.9215686, 1, 1,
0.04973228, 0.3818601, 1.589445, 0, 0.9176471, 1, 1,
0.05092647, 0.06176241, -1.183098, 0, 0.9098039, 1, 1,
0.05244389, -0.3085041, 3.678233, 0, 0.9058824, 1, 1,
0.052589, 0.9093971, 0.7970335, 0, 0.8980392, 1, 1,
0.05309963, -0.8622417, 3.079898, 0, 0.8901961, 1, 1,
0.05438856, 0.7621793, 0.5403659, 0, 0.8862745, 1, 1,
0.05674754, -1.421163, 2.373577, 0, 0.8784314, 1, 1,
0.05757136, -0.3739567, 2.724218, 0, 0.8745098, 1, 1,
0.05855438, -1.57603, 3.108622, 0, 0.8666667, 1, 1,
0.06021624, 0.01747504, 1.356943, 0, 0.8627451, 1, 1,
0.06093723, -0.1415486, 1.507185, 0, 0.854902, 1, 1,
0.06859981, 0.813388, 0.03576733, 0, 0.8509804, 1, 1,
0.07572928, 0.8457329, 2.038897, 0, 0.8431373, 1, 1,
0.07752109, -0.3061213, 2.420641, 0, 0.8392157, 1, 1,
0.0793011, 1.67931, -1.186978, 0, 0.8313726, 1, 1,
0.08544306, -0.2586693, 3.096733, 0, 0.827451, 1, 1,
0.08572957, 1.40201, -1.279104, 0, 0.8196079, 1, 1,
0.08694935, 0.766295, 0.6366318, 0, 0.8156863, 1, 1,
0.08839323, 0.4897553, 0.6148455, 0, 0.8078431, 1, 1,
0.09223931, -0.02009699, 2.134958, 0, 0.8039216, 1, 1,
0.09421211, 0.3873471, 2.361663, 0, 0.7960784, 1, 1,
0.09607456, 0.471498, -0.3666021, 0, 0.7882353, 1, 1,
0.09735674, -0.5698106, 2.3926, 0, 0.7843137, 1, 1,
0.09736189, -0.7802818, 1.29273, 0, 0.7764706, 1, 1,
0.1011054, 2.192744, 0.3269229, 0, 0.772549, 1, 1,
0.1037834, -1.105469, 4.353772, 0, 0.7647059, 1, 1,
0.1043559, -0.6607382, 3.54409, 0, 0.7607843, 1, 1,
0.1081736, 0.1493413, 1.184732, 0, 0.7529412, 1, 1,
0.1114884, 0.244976, -0.3784622, 0, 0.7490196, 1, 1,
0.1146403, -0.2574196, 0.59651, 0, 0.7411765, 1, 1,
0.1172484, -1.375013, 3.388869, 0, 0.7372549, 1, 1,
0.1172638, 0.5318479, 0.6649067, 0, 0.7294118, 1, 1,
0.1184894, -0.1581395, 1.214586, 0, 0.7254902, 1, 1,
0.1233394, 1.607199, 1.860157, 0, 0.7176471, 1, 1,
0.1238719, -0.4467065, 4.097204, 0, 0.7137255, 1, 1,
0.1334846, 0.59087, 0.2787517, 0, 0.7058824, 1, 1,
0.1364309, -1.041831, 2.319612, 0, 0.6980392, 1, 1,
0.1376656, 0.6616763, -0.400351, 0, 0.6941177, 1, 1,
0.1412942, 2.324784, -1.42492, 0, 0.6862745, 1, 1,
0.1434237, 0.1252456, -0.5671031, 0, 0.682353, 1, 1,
0.1463604, 2.541354, 1.231394, 0, 0.6745098, 1, 1,
0.1491874, -0.3790131, 2.142413, 0, 0.6705883, 1, 1,
0.1545988, 2.153545, -0.00453217, 0, 0.6627451, 1, 1,
0.161385, -0.5820584, 2.585716, 0, 0.6588235, 1, 1,
0.1641639, -1.171875, 1.642992, 0, 0.6509804, 1, 1,
0.1647963, 0.7160815, 0.8203755, 0, 0.6470588, 1, 1,
0.1676155, 0.04118542, 0.9433971, 0, 0.6392157, 1, 1,
0.1690494, 0.615593, 0.3698459, 0, 0.6352941, 1, 1,
0.1711258, -0.5574939, 2.524012, 0, 0.627451, 1, 1,
0.1731585, -1.24311, 2.898129, 0, 0.6235294, 1, 1,
0.1794333, 0.7145093, 0.7885515, 0, 0.6156863, 1, 1,
0.1811989, -0.5849587, 2.025191, 0, 0.6117647, 1, 1,
0.1845905, -0.478063, 4.182048, 0, 0.6039216, 1, 1,
0.1913589, -0.3298703, 1.987225, 0, 0.5960785, 1, 1,
0.1934644, -1.11064, 3.27712, 0, 0.5921569, 1, 1,
0.1936318, -0.6241691, 3.910275, 0, 0.5843138, 1, 1,
0.1944519, 0.1129775, 0.1982259, 0, 0.5803922, 1, 1,
0.1955508, -1.153332, 2.651339, 0, 0.572549, 1, 1,
0.1968672, 0.2641519, 1.68727, 0, 0.5686275, 1, 1,
0.1976694, -1.137951, 2.667509, 0, 0.5607843, 1, 1,
0.1984895, 0.3595648, -0.2722366, 0, 0.5568628, 1, 1,
0.1990501, -0.5863047, 2.021663, 0, 0.5490196, 1, 1,
0.2005164, 0.1791965, 0.5176828, 0, 0.5450981, 1, 1,
0.2012135, -0.5547879, 2.49334, 0, 0.5372549, 1, 1,
0.2016788, 1.416656, 0.2797753, 0, 0.5333334, 1, 1,
0.2022252, -0.3142956, 1.904863, 0, 0.5254902, 1, 1,
0.2047918, 1.159178, 0.1684025, 0, 0.5215687, 1, 1,
0.2060894, -0.5260935, 0.9785542, 0, 0.5137255, 1, 1,
0.2065095, -0.1323573, 0.4634154, 0, 0.509804, 1, 1,
0.215658, 1.182458, -0.337056, 0, 0.5019608, 1, 1,
0.2164273, 0.2616907, 2.03637, 0, 0.4941176, 1, 1,
0.2169133, 0.6618621, -0.7716191, 0, 0.4901961, 1, 1,
0.2211529, -0.4508014, 2.23415, 0, 0.4823529, 1, 1,
0.2217196, -0.5442407, 0.2770416, 0, 0.4784314, 1, 1,
0.2225999, 0.4073671, 0.7382042, 0, 0.4705882, 1, 1,
0.2259115, -0.8835624, 1.376713, 0, 0.4666667, 1, 1,
0.2259356, 1.826404, -2.223819, 0, 0.4588235, 1, 1,
0.2329375, -1.287916, 4.361013, 0, 0.454902, 1, 1,
0.2333796, 0.1865943, -0.6611873, 0, 0.4470588, 1, 1,
0.2342619, -0.2534278, 2.729352, 0, 0.4431373, 1, 1,
0.2377268, -0.1433439, 3.210321, 0, 0.4352941, 1, 1,
0.243786, 0.1588048, 1.474568, 0, 0.4313726, 1, 1,
0.2448668, 2.206766, 1.017926, 0, 0.4235294, 1, 1,
0.2449053, 1.226113, 2.226028, 0, 0.4196078, 1, 1,
0.2467991, -1.141292, 4.40119, 0, 0.4117647, 1, 1,
0.2472666, -0.1484071, 2.407629, 0, 0.4078431, 1, 1,
0.2494433, 0.2492182, 0.598628, 0, 0.4, 1, 1,
0.2510945, 0.286315, 0.8563521, 0, 0.3921569, 1, 1,
0.2549718, 1.105509, -0.5708586, 0, 0.3882353, 1, 1,
0.2552093, -1.245241, 4.97518, 0, 0.3803922, 1, 1,
0.262501, 0.1348582, 0.6103789, 0, 0.3764706, 1, 1,
0.2673789, 0.3873953, 0.3183381, 0, 0.3686275, 1, 1,
0.2712032, -0.2967799, 1.007168, 0, 0.3647059, 1, 1,
0.2714374, 2.221296, 0.8658425, 0, 0.3568628, 1, 1,
0.2721338, 0.1875776, 2.061611, 0, 0.3529412, 1, 1,
0.2727056, -0.4861275, 4.048891, 0, 0.345098, 1, 1,
0.2758551, -0.3750658, 1.868507, 0, 0.3411765, 1, 1,
0.2767165, 0.02757674, 0.6252346, 0, 0.3333333, 1, 1,
0.2777062, -2.223661, 0.6704559, 0, 0.3294118, 1, 1,
0.286038, 1.258651, -0.4464254, 0, 0.3215686, 1, 1,
0.2893577, -0.5528852, 1.079851, 0, 0.3176471, 1, 1,
0.2899916, 1.958468, -0.8299256, 0, 0.3098039, 1, 1,
0.2969618, 0.492926, 0.1247039, 0, 0.3058824, 1, 1,
0.2978822, -0.8779128, 2.451016, 0, 0.2980392, 1, 1,
0.2985258, 0.3121145, 1.320919, 0, 0.2901961, 1, 1,
0.2987546, 0.8575615, 0.1786264, 0, 0.2862745, 1, 1,
0.3000579, -1.111239, 3.584468, 0, 0.2784314, 1, 1,
0.3025473, -0.3446409, 2.404751, 0, 0.2745098, 1, 1,
0.3052383, 2.334228, 0.3963565, 0, 0.2666667, 1, 1,
0.3057971, -0.4899207, 2.919536, 0, 0.2627451, 1, 1,
0.3066952, -1.163911, 2.839478, 0, 0.254902, 1, 1,
0.311635, 1.490959, -0.5322182, 0, 0.2509804, 1, 1,
0.3124547, 0.197228, 0.3885806, 0, 0.2431373, 1, 1,
0.3149661, 0.5520604, -1.013729, 0, 0.2392157, 1, 1,
0.318313, 0.03848873, 2.396795, 0, 0.2313726, 1, 1,
0.318363, -1.462211, 3.286095, 0, 0.227451, 1, 1,
0.3216713, -0.2254288, 3.999911, 0, 0.2196078, 1, 1,
0.3218794, -0.7056591, 1.84427, 0, 0.2156863, 1, 1,
0.3219651, 0.1477599, 1.180565, 0, 0.2078431, 1, 1,
0.3224874, -1.26658, 3.556071, 0, 0.2039216, 1, 1,
0.3280677, 0.3258585, 0.6724903, 0, 0.1960784, 1, 1,
0.3295155, -0.1922243, 1.546911, 0, 0.1882353, 1, 1,
0.3296835, 1.205161, 0.3617209, 0, 0.1843137, 1, 1,
0.3343483, -0.3419192, 4.399912, 0, 0.1764706, 1, 1,
0.34524, -1.161185, 2.413192, 0, 0.172549, 1, 1,
0.3493111, -1.030324, 3.753356, 0, 0.1647059, 1, 1,
0.3594464, 0.2060345, 0.8470719, 0, 0.1607843, 1, 1,
0.3598046, -2.381343, 3.33303, 0, 0.1529412, 1, 1,
0.3614843, 0.4437056, 1.497925, 0, 0.1490196, 1, 1,
0.3661654, 1.420353, 0.3697967, 0, 0.1411765, 1, 1,
0.3666732, -1.299241, 3.145036, 0, 0.1372549, 1, 1,
0.3669724, 3.031275, -1.472217, 0, 0.1294118, 1, 1,
0.3673912, -0.5636655, 1.554499, 0, 0.1254902, 1, 1,
0.3691435, -0.3185895, 2.162625, 0, 0.1176471, 1, 1,
0.3715198, 0.04880569, 1.232224, 0, 0.1137255, 1, 1,
0.3748358, 1.806355, -1.134338, 0, 0.1058824, 1, 1,
0.376183, -1.925306, 2.917054, 0, 0.09803922, 1, 1,
0.3765858, -0.3440156, 2.393863, 0, 0.09411765, 1, 1,
0.382895, 1.128882, 0.9587106, 0, 0.08627451, 1, 1,
0.3844412, -0.3791296, 0.8861798, 0, 0.08235294, 1, 1,
0.3844667, -0.5713353, 3.833461, 0, 0.07450981, 1, 1,
0.3846414, -0.3661907, 2.003982, 0, 0.07058824, 1, 1,
0.3852735, 1.992523, 0.7877066, 0, 0.0627451, 1, 1,
0.387261, 1.186023, -2.371557, 0, 0.05882353, 1, 1,
0.3894764, -0.8469173, 2.292011, 0, 0.05098039, 1, 1,
0.3938434, 1.532793, 0.09031545, 0, 0.04705882, 1, 1,
0.3949713, 0.3962092, 1.23552, 0, 0.03921569, 1, 1,
0.394983, 0.3879417, 1.280106, 0, 0.03529412, 1, 1,
0.4000453, 0.1137516, 0.1852851, 0, 0.02745098, 1, 1,
0.4086452, 2.025099, 0.2330558, 0, 0.02352941, 1, 1,
0.4119068, 0.5874282, 0.5253666, 0, 0.01568628, 1, 1,
0.4129303, 0.08789735, 2.544498, 0, 0.01176471, 1, 1,
0.4297023, -0.6340896, 3.006636, 0, 0.003921569, 1, 1,
0.4314217, -0.2694166, 2.529307, 0.003921569, 0, 1, 1,
0.4322386, -0.2746328, 2.073597, 0.007843138, 0, 1, 1,
0.4346482, -0.82236, 4.22814, 0.01568628, 0, 1, 1,
0.434854, 0.1057016, 1.242794, 0.01960784, 0, 1, 1,
0.4372573, -0.23337, 1.49605, 0.02745098, 0, 1, 1,
0.4395541, -0.2576084, 2.41403, 0.03137255, 0, 1, 1,
0.4413046, -0.9816563, 3.918712, 0.03921569, 0, 1, 1,
0.4420614, -0.1493632, 0.6911, 0.04313726, 0, 1, 1,
0.4434115, 0.6690419, 1.686952, 0.05098039, 0, 1, 1,
0.4473833, -1.783202, 3.571941, 0.05490196, 0, 1, 1,
0.4502869, 0.291926, 0.7409221, 0.0627451, 0, 1, 1,
0.4517611, -1.474429, 2.098042, 0.06666667, 0, 1, 1,
0.4524414, 0.3294773, -0.03865666, 0.07450981, 0, 1, 1,
0.4543333, 2.392513, 0.6232835, 0.07843138, 0, 1, 1,
0.4564748, -0.1292473, 1.875556, 0.08627451, 0, 1, 1,
0.4657505, 0.7119266, -0.4295537, 0.09019608, 0, 1, 1,
0.4674048, -0.3237463, 2.506684, 0.09803922, 0, 1, 1,
0.4674944, 1.098488, 1.701166, 0.1058824, 0, 1, 1,
0.4707196, -1.706023, 2.026854, 0.1098039, 0, 1, 1,
0.4719115, -0.7994805, 4.283406, 0.1176471, 0, 1, 1,
0.4739158, -1.5615, 3.166608, 0.1215686, 0, 1, 1,
0.4742264, 0.5126234, 1.747999, 0.1294118, 0, 1, 1,
0.4757874, 2.173657, 1.876162, 0.1333333, 0, 1, 1,
0.4775575, -0.7444153, 2.160872, 0.1411765, 0, 1, 1,
0.4779187, 1.780621, 1.094273, 0.145098, 0, 1, 1,
0.4782783, -1.255352, 3.002657, 0.1529412, 0, 1, 1,
0.4827534, 0.6427099, -0.7452397, 0.1568628, 0, 1, 1,
0.4850123, 1.632191, -1.017176, 0.1647059, 0, 1, 1,
0.486473, 1.028835, 0.5155572, 0.1686275, 0, 1, 1,
0.4907762, 0.2758795, 1.274063, 0.1764706, 0, 1, 1,
0.4919142, 0.8787052, 0.4106886, 0.1803922, 0, 1, 1,
0.4932774, -0.2726956, 3.272788, 0.1882353, 0, 1, 1,
0.4976185, 1.619071, -0.4295348, 0.1921569, 0, 1, 1,
0.5128074, -0.5195677, 1.833934, 0.2, 0, 1, 1,
0.5147766, 0.01761758, 1.525386, 0.2078431, 0, 1, 1,
0.5162235, -1.282579, 2.219291, 0.2117647, 0, 1, 1,
0.5208226, 1.604474, -1.072094, 0.2196078, 0, 1, 1,
0.5231988, -1.506508, 1.89132, 0.2235294, 0, 1, 1,
0.5254605, 0.01635932, 0.161988, 0.2313726, 0, 1, 1,
0.5287215, -0.4109685, 1.72045, 0.2352941, 0, 1, 1,
0.5364174, -1.440859, -0.03468865, 0.2431373, 0, 1, 1,
0.5436932, 0.3143783, 0.1199378, 0.2470588, 0, 1, 1,
0.5520087, -1.358809, 2.27312, 0.254902, 0, 1, 1,
0.55221, 0.8989996, 1.612112, 0.2588235, 0, 1, 1,
0.5554402, 0.4863971, 0.7786539, 0.2666667, 0, 1, 1,
0.5575821, 0.6498508, 0.59699, 0.2705882, 0, 1, 1,
0.5618836, 0.4755543, 0.2458497, 0.2784314, 0, 1, 1,
0.5618847, -0.4406914, 4.50406, 0.282353, 0, 1, 1,
0.5658908, -1.076661, 2.728515, 0.2901961, 0, 1, 1,
0.5672201, 0.4879577, -0.1305597, 0.2941177, 0, 1, 1,
0.5695049, -0.8309837, 1.954124, 0.3019608, 0, 1, 1,
0.5738931, -1.333608, 3.477698, 0.3098039, 0, 1, 1,
0.5740442, -0.3957962, 1.211715, 0.3137255, 0, 1, 1,
0.5753354, -0.2800116, 1.616231, 0.3215686, 0, 1, 1,
0.5779418, 1.274284, 1.22252, 0.3254902, 0, 1, 1,
0.5812737, -1.187445, 2.525533, 0.3333333, 0, 1, 1,
0.5818026, -1.023792, 0.9851631, 0.3372549, 0, 1, 1,
0.5818028, 0.7464678, 1.333351, 0.345098, 0, 1, 1,
0.5827893, 2.042344, 0.2872704, 0.3490196, 0, 1, 1,
0.5836007, -0.2534099, 0.5551191, 0.3568628, 0, 1, 1,
0.5859841, -0.2805177, 2.110993, 0.3607843, 0, 1, 1,
0.5890165, -0.516902, 2.416493, 0.3686275, 0, 1, 1,
0.589098, 1.279077, 0.4462887, 0.372549, 0, 1, 1,
0.5903077, -1.630841, 3.465597, 0.3803922, 0, 1, 1,
0.5913039, -1.508443, 2.92836, 0.3843137, 0, 1, 1,
0.5914878, -0.388717, 2.639439, 0.3921569, 0, 1, 1,
0.5933633, 0.5938467, 2.829911, 0.3960784, 0, 1, 1,
0.5948772, -0.5202742, 1.27035, 0.4039216, 0, 1, 1,
0.5968516, -0.5042924, 2.342067, 0.4117647, 0, 1, 1,
0.5968801, 0.04529528, 0.3916852, 0.4156863, 0, 1, 1,
0.5982698, 1.474187, -1.319198, 0.4235294, 0, 1, 1,
0.5984691, 0.9709783, 1.94517, 0.427451, 0, 1, 1,
0.6109146, -0.2571317, 2.887808, 0.4352941, 0, 1, 1,
0.6120718, 1.1393, -0.1376267, 0.4392157, 0, 1, 1,
0.6137831, -0.5695227, 3.216566, 0.4470588, 0, 1, 1,
0.6205234, -0.8072278, 1.146651, 0.4509804, 0, 1, 1,
0.6213533, -0.3071742, 2.911321, 0.4588235, 0, 1, 1,
0.6228931, 3.041637, 1.766316, 0.4627451, 0, 1, 1,
0.6298308, 0.2657245, 0.1229076, 0.4705882, 0, 1, 1,
0.6303317, -0.949976, 0.390788, 0.4745098, 0, 1, 1,
0.6334866, 0.08678929, 2.00968, 0.4823529, 0, 1, 1,
0.6348943, -0.7762735, 3.701123, 0.4862745, 0, 1, 1,
0.6498896, 0.2585799, 1.597604, 0.4941176, 0, 1, 1,
0.6513133, -1.988662, 2.776428, 0.5019608, 0, 1, 1,
0.651751, 1.865904, 0.4503863, 0.5058824, 0, 1, 1,
0.6527271, 1.50928, 0.6965362, 0.5137255, 0, 1, 1,
0.6570848, 0.1184864, 3.650666, 0.5176471, 0, 1, 1,
0.6612632, -1.287601, 2.37683, 0.5254902, 0, 1, 1,
0.6706846, 1.834809, -2.444148, 0.5294118, 0, 1, 1,
0.6710402, 1.63341, 0.9682037, 0.5372549, 0, 1, 1,
0.6763008, -0.5099218, 1.739555, 0.5411765, 0, 1, 1,
0.6804597, 1.949477, -1.32744, 0.5490196, 0, 1, 1,
0.6804982, -1.810503, 2.273659, 0.5529412, 0, 1, 1,
0.6812891, 0.3653848, -0.418491, 0.5607843, 0, 1, 1,
0.6861644, 0.2676176, 2.052224, 0.5647059, 0, 1, 1,
0.6866895, -0.4153833, 2.798813, 0.572549, 0, 1, 1,
0.687077, -0.3658329, 2.021726, 0.5764706, 0, 1, 1,
0.6951094, 0.8022891, 0.6281523, 0.5843138, 0, 1, 1,
0.7065132, 0.7092718, 1.049778, 0.5882353, 0, 1, 1,
0.7100385, 2.010859, 1.693693, 0.5960785, 0, 1, 1,
0.7106941, 0.09545553, 1.051423, 0.6039216, 0, 1, 1,
0.71826, 0.02926921, 1.735937, 0.6078432, 0, 1, 1,
0.7207719, 0.1658371, 1.259434, 0.6156863, 0, 1, 1,
0.7208536, 0.3381093, 0.9070048, 0.6196079, 0, 1, 1,
0.7215644, -0.4229639, 1.293503, 0.627451, 0, 1, 1,
0.7383906, 0.7901407, 1.789835, 0.6313726, 0, 1, 1,
0.7447, -0.5268874, 4.157429, 0.6392157, 0, 1, 1,
0.7457397, 0.200242, 2.280778, 0.6431373, 0, 1, 1,
0.7494326, 0.3079145, 0.1069527, 0.6509804, 0, 1, 1,
0.7495469, -0.06430234, 1.945819, 0.654902, 0, 1, 1,
0.7576621, -0.6015818, 1.366907, 0.6627451, 0, 1, 1,
0.7632638, 0.5750769, 2.284701, 0.6666667, 0, 1, 1,
0.7642907, 0.4399647, 2.340541, 0.6745098, 0, 1, 1,
0.7713748, -0.9221741, 3.751136, 0.6784314, 0, 1, 1,
0.7769193, -0.4931029, 1.602755, 0.6862745, 0, 1, 1,
0.778016, 1.302691, 0.0689122, 0.6901961, 0, 1, 1,
0.7790494, 1.886961, 1.167516, 0.6980392, 0, 1, 1,
0.7829688, 2.177932, 2.458874, 0.7058824, 0, 1, 1,
0.7835708, 0.1745551, 2.75954, 0.7098039, 0, 1, 1,
0.7845418, 1.107828, 1.433443, 0.7176471, 0, 1, 1,
0.7851868, 1.443603, 1.288736, 0.7215686, 0, 1, 1,
0.7876654, -1.691719, 2.267155, 0.7294118, 0, 1, 1,
0.7891616, -1.621066, 2.609597, 0.7333333, 0, 1, 1,
0.800271, -0.3690642, 2.784232, 0.7411765, 0, 1, 1,
0.8010499, 0.03790191, 2.704097, 0.7450981, 0, 1, 1,
0.8020755, -1.979395, 1.771762, 0.7529412, 0, 1, 1,
0.8049682, 0.4559717, 1.89895, 0.7568628, 0, 1, 1,
0.8093606, -0.3497548, 0.8233195, 0.7647059, 0, 1, 1,
0.8102975, -1.919799, 1.81832, 0.7686275, 0, 1, 1,
0.8118158, 0.9219231, 2.008564, 0.7764706, 0, 1, 1,
0.8162286, -0.8377763, 1.431012, 0.7803922, 0, 1, 1,
0.8205788, -0.8418097, 2.924974, 0.7882353, 0, 1, 1,
0.8304861, -0.8376045, 2.111067, 0.7921569, 0, 1, 1,
0.8319775, -0.8544133, 2.206146, 0.8, 0, 1, 1,
0.8356342, 0.441754, 1.231838, 0.8078431, 0, 1, 1,
0.8484223, 0.3574998, 1.105685, 0.8117647, 0, 1, 1,
0.8525604, 0.7049914, 0.5170855, 0.8196079, 0, 1, 1,
0.8535312, -0.7561103, 2.019185, 0.8235294, 0, 1, 1,
0.8540025, -0.3776754, 2.120263, 0.8313726, 0, 1, 1,
0.8544601, 0.3427666, 1.100953, 0.8352941, 0, 1, 1,
0.8564876, -0.5334841, 2.129441, 0.8431373, 0, 1, 1,
0.859157, -0.7035673, 2.161713, 0.8470588, 0, 1, 1,
0.8592627, -0.06824019, 2.193262, 0.854902, 0, 1, 1,
0.8679887, 0.4759419, 1.11903, 0.8588235, 0, 1, 1,
0.8692341, 0.1056448, 1.145516, 0.8666667, 0, 1, 1,
0.8725834, -0.2226186, 3.372638, 0.8705882, 0, 1, 1,
0.8741941, -0.5507622, 1.098483, 0.8784314, 0, 1, 1,
0.8844119, 0.3747286, 1.59426, 0.8823529, 0, 1, 1,
0.8915334, -0.8997161, 2.474952, 0.8901961, 0, 1, 1,
0.8920113, 0.2378179, 1.999777, 0.8941177, 0, 1, 1,
0.8964618, -0.1358827, 1.913525, 0.9019608, 0, 1, 1,
0.8995529, 0.3377164, 0.4342124, 0.9098039, 0, 1, 1,
0.9033321, 0.67952, 1.763507, 0.9137255, 0, 1, 1,
0.9127278, -1.422241, 4.119423, 0.9215686, 0, 1, 1,
0.9154558, 0.4282654, 1.665513, 0.9254902, 0, 1, 1,
0.9161419, 0.4655334, 1.556458, 0.9333333, 0, 1, 1,
0.9163432, 1.247565, 1.063568, 0.9372549, 0, 1, 1,
0.9192237, -1.779763, 2.383508, 0.945098, 0, 1, 1,
0.9314835, 0.7818109, 2.00439, 0.9490196, 0, 1, 1,
0.9345751, 0.4696428, 1.120231, 0.9568627, 0, 1, 1,
0.9422474, -0.08573914, 0.2409258, 0.9607843, 0, 1, 1,
0.9527504, 1.30091, 1.661613, 0.9686275, 0, 1, 1,
0.9553915, 0.0762564, 1.268292, 0.972549, 0, 1, 1,
0.9586819, 2.323273, 0.6085023, 0.9803922, 0, 1, 1,
0.9601976, -0.1016473, 1.895535, 0.9843137, 0, 1, 1,
0.9628211, -0.5055087, 0.8055004, 0.9921569, 0, 1, 1,
0.9641336, -0.2725898, 1.467994, 0.9960784, 0, 1, 1,
0.9651995, 0.7377458, 0.7119626, 1, 0, 0.9960784, 1,
0.9727742, -0.2117018, 0.4972793, 1, 0, 0.9882353, 1,
0.9730309, -0.7849151, 2.987109, 1, 0, 0.9843137, 1,
0.9746684, -1.722526, 1.894206, 1, 0, 0.9764706, 1,
0.9845403, 0.01106499, 0.2579949, 1, 0, 0.972549, 1,
0.9846968, 3.499329, 1.395121, 1, 0, 0.9647059, 1,
0.9910484, 1.173885, 2.582424, 1, 0, 0.9607843, 1,
0.9925212, -0.6439043, 1.577847, 1, 0, 0.9529412, 1,
0.9928944, -0.6978028, 2.024099, 1, 0, 0.9490196, 1,
0.9946451, 0.7278236, 1.62139, 1, 0, 0.9411765, 1,
0.9967175, 0.9413287, 1.173026, 1, 0, 0.9372549, 1,
1.004127, 1.914073, -0.2111706, 1, 0, 0.9294118, 1,
1.004175, 0.9070911, 0.6637079, 1, 0, 0.9254902, 1,
1.014902, -1.764837, 1.94301, 1, 0, 0.9176471, 1,
1.019685, 0.1362057, 1.114421, 1, 0, 0.9137255, 1,
1.023966, 0.8423389, -0.1984036, 1, 0, 0.9058824, 1,
1.025852, 0.2309325, 0.6843227, 1, 0, 0.9019608, 1,
1.026803, -0.9648913, 3.284447, 1, 0, 0.8941177, 1,
1.032011, -0.6974888, 3.061684, 1, 0, 0.8862745, 1,
1.035438, 0.1456907, 1.640604, 1, 0, 0.8823529, 1,
1.04167, 0.4094971, 1.66645, 1, 0, 0.8745098, 1,
1.045481, 0.219587, -0.9724925, 1, 0, 0.8705882, 1,
1.049125, 1.471383, -0.06220209, 1, 0, 0.8627451, 1,
1.050041, 0.4690175, 1.215436, 1, 0, 0.8588235, 1,
1.051459, 0.2654909, -0.8361186, 1, 0, 0.8509804, 1,
1.053189, 0.8272475, 0.700744, 1, 0, 0.8470588, 1,
1.053548, -1.187522, 3.733435, 1, 0, 0.8392157, 1,
1.057131, 1.177398, -0.2133907, 1, 0, 0.8352941, 1,
1.057883, -0.5588352, 1.360493, 1, 0, 0.827451, 1,
1.067574, 0.2047345, 0.7242856, 1, 0, 0.8235294, 1,
1.07384, 1.272708, -2.18396, 1, 0, 0.8156863, 1,
1.091988, 0.2158196, 0.1526523, 1, 0, 0.8117647, 1,
1.09966, 1.667319, -2.070884, 1, 0, 0.8039216, 1,
1.103682, 1.108801, 0.6973786, 1, 0, 0.7960784, 1,
1.10622, -2.25905, 3.173212, 1, 0, 0.7921569, 1,
1.113543, 0.5035464, 1.760581, 1, 0, 0.7843137, 1,
1.114578, -0.6004021, 3.995373, 1, 0, 0.7803922, 1,
1.120729, -0.309652, 0.9755933, 1, 0, 0.772549, 1,
1.123992, -1.566326, 1.017784, 1, 0, 0.7686275, 1,
1.124113, 1.764457, 1.028787, 1, 0, 0.7607843, 1,
1.133425, -1.88023, 1.761047, 1, 0, 0.7568628, 1,
1.140334, 0.3057525, -0.4506103, 1, 0, 0.7490196, 1,
1.144027, 0.583173, 1.338707, 1, 0, 0.7450981, 1,
1.163775, 0.0001565539, 1.388277, 1, 0, 0.7372549, 1,
1.177349, 0.5363739, 1.35971, 1, 0, 0.7333333, 1,
1.179944, -0.7105266, 1.835181, 1, 0, 0.7254902, 1,
1.191329, -1.264104, 3.059597, 1, 0, 0.7215686, 1,
1.19894, -0.6299903, 1.664596, 1, 0, 0.7137255, 1,
1.202713, 0.3467503, 2.19983, 1, 0, 0.7098039, 1,
1.20833, 1.664862, 1.63687, 1, 0, 0.7019608, 1,
1.208647, -0.5986952, 1.068882, 1, 0, 0.6941177, 1,
1.210324, 0.3460685, -0.5575265, 1, 0, 0.6901961, 1,
1.218133, 0.7604496, 3.354173, 1, 0, 0.682353, 1,
1.219296, -0.223454, 2.342718, 1, 0, 0.6784314, 1,
1.221881, 0.8635349, 1.292822, 1, 0, 0.6705883, 1,
1.230387, 0.9758025, 0.6625992, 1, 0, 0.6666667, 1,
1.231356, -1.349439, 3.674067, 1, 0, 0.6588235, 1,
1.231961, -0.3470596, 1.505111, 1, 0, 0.654902, 1,
1.233275, 0.6138764, 2.191318, 1, 0, 0.6470588, 1,
1.238761, 1.076029, -0.9249259, 1, 0, 0.6431373, 1,
1.239249, -0.03171967, 0.1623194, 1, 0, 0.6352941, 1,
1.240859, -2.19359, 2.461653, 1, 0, 0.6313726, 1,
1.253521, -0.03813037, 1.586431, 1, 0, 0.6235294, 1,
1.254037, -1.720507, 1.45018, 1, 0, 0.6196079, 1,
1.254133, 1.915625, 0.7457024, 1, 0, 0.6117647, 1,
1.254613, -0.04979115, 0.3931723, 1, 0, 0.6078432, 1,
1.261514, -0.1984241, 0.1780352, 1, 0, 0.6, 1,
1.26783, -0.2656331, 0.6866482, 1, 0, 0.5921569, 1,
1.274168, -0.6297333, 0.4160276, 1, 0, 0.5882353, 1,
1.276523, -0.8221778, 0.8886129, 1, 0, 0.5803922, 1,
1.277972, 0.9224982, -0.812681, 1, 0, 0.5764706, 1,
1.283671, -0.3806506, 2.726317, 1, 0, 0.5686275, 1,
1.285458, 0.4137029, -0.2815577, 1, 0, 0.5647059, 1,
1.301128, -0.9127674, 1.300936, 1, 0, 0.5568628, 1,
1.302879, 1.661705, 0.0004373094, 1, 0, 0.5529412, 1,
1.308428, 0.9482206, 0.3549274, 1, 0, 0.5450981, 1,
1.317496, -0.6784465, 1.904471, 1, 0, 0.5411765, 1,
1.334451, 0.2652441, 0.9057101, 1, 0, 0.5333334, 1,
1.34108, 0.2517701, 1.562821, 1, 0, 0.5294118, 1,
1.341309, 1.38767, 1.095371, 1, 0, 0.5215687, 1,
1.342916, -0.09367996, 1.640754, 1, 0, 0.5176471, 1,
1.373301, -1.213914, 3.082072, 1, 0, 0.509804, 1,
1.385345, 0.7652397, 1.02566, 1, 0, 0.5058824, 1,
1.39423, -0.7756426, 0.7593086, 1, 0, 0.4980392, 1,
1.402146, -1.585831, 1.360117, 1, 0, 0.4901961, 1,
1.402875, 0.8011505, 2.281994, 1, 0, 0.4862745, 1,
1.404904, -1.275363, 2.206079, 1, 0, 0.4784314, 1,
1.414598, 0.084639, 2.078554, 1, 0, 0.4745098, 1,
1.423067, 0.966068, 2.461872, 1, 0, 0.4666667, 1,
1.423357, 0.9538187, -0.811506, 1, 0, 0.4627451, 1,
1.438814, 0.7417401, -0.1025986, 1, 0, 0.454902, 1,
1.456292, -1.774693, 0.702712, 1, 0, 0.4509804, 1,
1.459401, -1.393546, 2.67332, 1, 0, 0.4431373, 1,
1.469982, 0.4982596, 0.6459607, 1, 0, 0.4392157, 1,
1.472143, -2.148421, 2.87242, 1, 0, 0.4313726, 1,
1.475718, 0.5551711, 1.118515, 1, 0, 0.427451, 1,
1.482929, -0.2184293, 2.389081, 1, 0, 0.4196078, 1,
1.487448, -1.068061, 2.866154, 1, 0, 0.4156863, 1,
1.490671, -0.1153403, 2.207211, 1, 0, 0.4078431, 1,
1.495708, -0.5811534, 3.039531, 1, 0, 0.4039216, 1,
1.510368, -0.5921671, 0.216377, 1, 0, 0.3960784, 1,
1.514608, 1.731554, 2.939074, 1, 0, 0.3882353, 1,
1.516797, -0.9337023, 1.685509, 1, 0, 0.3843137, 1,
1.530464, 0.8978235, 2.600667, 1, 0, 0.3764706, 1,
1.546344, 1.061294, 0.8349517, 1, 0, 0.372549, 1,
1.546709, -0.4377311, 0.0934988, 1, 0, 0.3647059, 1,
1.548568, -0.03960696, 0.4783501, 1, 0, 0.3607843, 1,
1.557736, -0.7672874, 1.677734, 1, 0, 0.3529412, 1,
1.558093, 2.35206, 0.3474639, 1, 0, 0.3490196, 1,
1.562019, 0.4290759, 0.9968387, 1, 0, 0.3411765, 1,
1.577034, -0.4928025, 2.527465, 1, 0, 0.3372549, 1,
1.579044, 0.812175, 2.897644, 1, 0, 0.3294118, 1,
1.585393, -1.719569, 2.701676, 1, 0, 0.3254902, 1,
1.609887, 1.247106, 2.98734, 1, 0, 0.3176471, 1,
1.616822, 1.565466, -1.071378, 1, 0, 0.3137255, 1,
1.631715, 0.03621262, 1.882745, 1, 0, 0.3058824, 1,
1.652081, -1.571139, 1.723505, 1, 0, 0.2980392, 1,
1.663942, -0.2091942, 3.613218, 1, 0, 0.2941177, 1,
1.670603, -1.822971, 2.327703, 1, 0, 0.2862745, 1,
1.682765, -0.758873, 1.556115, 1, 0, 0.282353, 1,
1.684613, 0.5923864, 0.5557845, 1, 0, 0.2745098, 1,
1.686678, -1.645854, 2.742984, 1, 0, 0.2705882, 1,
1.702051, -0.9018213, 2.092465, 1, 0, 0.2627451, 1,
1.712423, -0.5999445, 1.867853, 1, 0, 0.2588235, 1,
1.716382, -0.8565537, 1.720222, 1, 0, 0.2509804, 1,
1.728276, -1.342266, 0.05269956, 1, 0, 0.2470588, 1,
1.735074, 0.3252591, 3.41719, 1, 0, 0.2392157, 1,
1.746265, 1.188684, -0.5223694, 1, 0, 0.2352941, 1,
1.775996, 0.2270788, 0.7266946, 1, 0, 0.227451, 1,
1.786131, -0.5456003, 1.313631, 1, 0, 0.2235294, 1,
1.797397, 1.476298, -0.2105612, 1, 0, 0.2156863, 1,
1.80933, 0.9785353, 0.5301846, 1, 0, 0.2117647, 1,
1.821922, -0.5506557, 2.079834, 1, 0, 0.2039216, 1,
1.829886, -0.02123596, 2.860616, 1, 0, 0.1960784, 1,
1.836723, 2.291466, 1.211324, 1, 0, 0.1921569, 1,
1.861616, 1.622851, 0.2664935, 1, 0, 0.1843137, 1,
1.879792, -0.7723441, 2.363541, 1, 0, 0.1803922, 1,
1.900496, -0.1471674, 0.8565171, 1, 0, 0.172549, 1,
1.925654, -0.763402, 2.158644, 1, 0, 0.1686275, 1,
1.943057, -0.5397131, 3.899734, 1, 0, 0.1607843, 1,
1.950492, 1.103226, 1.303052, 1, 0, 0.1568628, 1,
1.983305, 0.02510305, 2.736641, 1, 0, 0.1490196, 1,
2.012049, 0.4138154, 1.972103, 1, 0, 0.145098, 1,
2.037055, -1.199444, 3.018651, 1, 0, 0.1372549, 1,
2.041607, -1.152956, 3.22051, 1, 0, 0.1333333, 1,
2.059747, 1.096074, 1.707196, 1, 0, 0.1254902, 1,
2.061224, 0.1691037, 1.808245, 1, 0, 0.1215686, 1,
2.097291, -0.5545322, 3.323336, 1, 0, 0.1137255, 1,
2.116786, 1.05586, 1.714171, 1, 0, 0.1098039, 1,
2.127573, -0.3818418, 2.876486, 1, 0, 0.1019608, 1,
2.134912, -0.8039903, 1.906451, 1, 0, 0.09411765, 1,
2.136311, -1.494263, 2.443172, 1, 0, 0.09019608, 1,
2.153267, -1.451473, 2.47665, 1, 0, 0.08235294, 1,
2.189895, 0.2311244, 0.7914006, 1, 0, 0.07843138, 1,
2.232458, 1.014276, -0.933828, 1, 0, 0.07058824, 1,
2.301028, -1.019773, 2.470438, 1, 0, 0.06666667, 1,
2.305313, -0.4608419, 0.5754629, 1, 0, 0.05882353, 1,
2.352168, -0.3615725, 0.02805382, 1, 0, 0.05490196, 1,
2.522147, -0.4502851, 2.377405, 1, 0, 0.04705882, 1,
2.584921, -3.022827, 1.806593, 1, 0, 0.04313726, 1,
2.594277, -0.255584, 1.340777, 1, 0, 0.03529412, 1,
2.599893, 0.6252483, 2.599889, 1, 0, 0.03137255, 1,
2.632182, 0.3408464, 1.223728, 1, 0, 0.02352941, 1,
2.692786, 1.682839, 1.324702, 1, 0, 0.01960784, 1,
2.795729, -1.500696, 1.750722, 1, 0, 0.01176471, 1,
2.931737, 0.7851567, 0.8608412, 1, 0, 0.007843138, 1
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
-0.2140933, -5.429345, -7.303187, 0, -0.5, 0.5, 0.5,
-0.2140933, -5.429345, -7.303187, 1, -0.5, 0.5, 0.5,
-0.2140933, -5.429345, -7.303187, 1, 1.5, 0.5, 0.5,
-0.2140933, -5.429345, -7.303187, 0, 1.5, 0.5, 0.5
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
-4.426361, -0.2340629, -7.303187, 0, -0.5, 0.5, 0.5,
-4.426361, -0.2340629, -7.303187, 1, -0.5, 0.5, 0.5,
-4.426361, -0.2340629, -7.303187, 1, 1.5, 0.5, 0.5,
-4.426361, -0.2340629, -7.303187, 0, 1.5, 0.5, 0.5
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
-4.426361, -5.429345, -0.2742288, 0, -0.5, 0.5, 0.5,
-4.426361, -5.429345, -0.2742288, 1, -0.5, 0.5, 0.5,
-4.426361, -5.429345, -0.2742288, 1, 1.5, 0.5, 0.5,
-4.426361, -5.429345, -0.2742288, 0, 1.5, 0.5, 0.5
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
-3, -4.230433, -5.681119,
2, -4.230433, -5.681119,
-3, -4.230433, -5.681119,
-3, -4.430252, -5.951464,
-2, -4.230433, -5.681119,
-2, -4.430252, -5.951464,
-1, -4.230433, -5.681119,
-1, -4.430252, -5.951464,
0, -4.230433, -5.681119,
0, -4.430252, -5.951464,
1, -4.230433, -5.681119,
1, -4.430252, -5.951464,
2, -4.230433, -5.681119,
2, -4.430252, -5.951464
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
-3, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
-3, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
-3, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
-3, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5,
-2, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
-2, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
-2, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
-2, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5,
-1, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
-1, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
-1, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
-1, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5,
0, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
0, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
0, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
0, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5,
1, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
1, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
1, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
1, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5,
2, -4.829889, -6.492153, 0, -0.5, 0.5, 0.5,
2, -4.829889, -6.492153, 1, -0.5, 0.5, 0.5,
2, -4.829889, -6.492153, 1, 1.5, 0.5, 0.5,
2, -4.829889, -6.492153, 0, 1.5, 0.5, 0.5
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
-3.454299, -4, -5.681119,
-3.454299, 2, -5.681119,
-3.454299, -4, -5.681119,
-3.616309, -4, -5.951464,
-3.454299, -2, -5.681119,
-3.616309, -2, -5.951464,
-3.454299, 0, -5.681119,
-3.616309, 0, -5.951464,
-3.454299, 2, -5.681119,
-3.616309, 2, -5.951464
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
-3.94033, -4, -6.492153, 0, -0.5, 0.5, 0.5,
-3.94033, -4, -6.492153, 1, -0.5, 0.5, 0.5,
-3.94033, -4, -6.492153, 1, 1.5, 0.5, 0.5,
-3.94033, -4, -6.492153, 0, 1.5, 0.5, 0.5,
-3.94033, -2, -6.492153, 0, -0.5, 0.5, 0.5,
-3.94033, -2, -6.492153, 1, -0.5, 0.5, 0.5,
-3.94033, -2, -6.492153, 1, 1.5, 0.5, 0.5,
-3.94033, -2, -6.492153, 0, 1.5, 0.5, 0.5,
-3.94033, 0, -6.492153, 0, -0.5, 0.5, 0.5,
-3.94033, 0, -6.492153, 1, -0.5, 0.5, 0.5,
-3.94033, 0, -6.492153, 1, 1.5, 0.5, 0.5,
-3.94033, 0, -6.492153, 0, 1.5, 0.5, 0.5,
-3.94033, 2, -6.492153, 0, -0.5, 0.5, 0.5,
-3.94033, 2, -6.492153, 1, -0.5, 0.5, 0.5,
-3.94033, 2, -6.492153, 1, 1.5, 0.5, 0.5,
-3.94033, 2, -6.492153, 0, 1.5, 0.5, 0.5
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
-3.454299, -4.230433, -4,
-3.454299, -4.230433, 4,
-3.454299, -4.230433, -4,
-3.616309, -4.430252, -4,
-3.454299, -4.230433, -2,
-3.616309, -4.430252, -2,
-3.454299, -4.230433, 0,
-3.616309, -4.430252, 0,
-3.454299, -4.230433, 2,
-3.616309, -4.430252, 2,
-3.454299, -4.230433, 4,
-3.616309, -4.430252, 4
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
-3.94033, -4.829889, -4, 0, -0.5, 0.5, 0.5,
-3.94033, -4.829889, -4, 1, -0.5, 0.5, 0.5,
-3.94033, -4.829889, -4, 1, 1.5, 0.5, 0.5,
-3.94033, -4.829889, -4, 0, 1.5, 0.5, 0.5,
-3.94033, -4.829889, -2, 0, -0.5, 0.5, 0.5,
-3.94033, -4.829889, -2, 1, -0.5, 0.5, 0.5,
-3.94033, -4.829889, -2, 1, 1.5, 0.5, 0.5,
-3.94033, -4.829889, -2, 0, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 0, 0, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 0, 1, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 0, 1, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 0, 0, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 2, 0, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 2, 1, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 2, 1, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 2, 0, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 4, 0, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 4, 1, -0.5, 0.5, 0.5,
-3.94033, -4.829889, 4, 1, 1.5, 0.5, 0.5,
-3.94033, -4.829889, 4, 0, 1.5, 0.5, 0.5
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
-3.454299, -4.230433, -5.681119,
-3.454299, 3.762307, -5.681119,
-3.454299, -4.230433, 5.132662,
-3.454299, 3.762307, 5.132662,
-3.454299, -4.230433, -5.681119,
-3.454299, -4.230433, 5.132662,
-3.454299, 3.762307, -5.681119,
-3.454299, 3.762307, 5.132662,
-3.454299, -4.230433, -5.681119,
3.026112, -4.230433, -5.681119,
-3.454299, -4.230433, 5.132662,
3.026112, -4.230433, 5.132662,
-3.454299, 3.762307, -5.681119,
3.026112, 3.762307, -5.681119,
-3.454299, 3.762307, 5.132662,
3.026112, 3.762307, 5.132662,
3.026112, -4.230433, -5.681119,
3.026112, 3.762307, -5.681119,
3.026112, -4.230433, 5.132662,
3.026112, 3.762307, 5.132662,
3.026112, -4.230433, -5.681119,
3.026112, -4.230433, 5.132662,
3.026112, 3.762307, -5.681119,
3.026112, 3.762307, 5.132662
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
var radius = 7.970767;
var distance = 35.46284;
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
mvMatrix.translate( 0.2140933, 0.2340629, 0.2742288 );
mvMatrix.scale( 1.329877, 1.078247, 0.7969598 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46284);
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
oxyfluorfen<-read.table("oxyfluorfen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxyfluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
y<-oxyfluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
z<-oxyfluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
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
-3.359924, 0.9973481, 0.4377032, 0, 0, 1, 1, 1,
-3.172081, 0.3338741, -1.319574, 1, 0, 0, 1, 1,
-3.069582, 1.697711, -2.286609, 1, 0, 0, 1, 1,
-3.00456, -0.9088074, -1.608531, 1, 0, 0, 1, 1,
-2.85038, 0.3783416, 0.3011624, 1, 0, 0, 1, 1,
-2.76796, -0.7630396, -1.838251, 1, 0, 0, 1, 1,
-2.761539, 0.1631235, -1.512936, 0, 0, 0, 1, 1,
-2.705275, 1.917472, -2.274571, 0, 0, 0, 1, 1,
-2.67995, 1.435192, -0.8253297, 0, 0, 0, 1, 1,
-2.676962, 0.3354242, 0.1443774, 0, 0, 0, 1, 1,
-2.626431, -0.5573041, -0.1271588, 0, 0, 0, 1, 1,
-2.612085, 0.4339873, 0.2017571, 0, 0, 0, 1, 1,
-2.518611, -0.1195213, -0.9719982, 0, 0, 0, 1, 1,
-2.464088, -1.431657, -3.905177, 1, 1, 1, 1, 1,
-2.426486, 0.4434267, -1.399056, 1, 1, 1, 1, 1,
-2.342749, 0.2141898, -1.287356, 1, 1, 1, 1, 1,
-2.34169, 0.3276483, -1.021537, 1, 1, 1, 1, 1,
-2.336988, -0.5071895, -0.8330994, 1, 1, 1, 1, 1,
-2.297567, 1.064329, -2.194614, 1, 1, 1, 1, 1,
-2.273305, -0.7387555, -1.293973, 1, 1, 1, 1, 1,
-2.224043, 0.1074719, -1.878974, 1, 1, 1, 1, 1,
-2.216792, 2.142889, 0.4593162, 1, 1, 1, 1, 1,
-2.15442, -0.4196137, -1.853125, 1, 1, 1, 1, 1,
-2.124344, -1.735041, -3.138464, 1, 1, 1, 1, 1,
-2.087406, -0.06919064, -1.057071, 1, 1, 1, 1, 1,
-2.063018, -0.2975455, -3.328106, 1, 1, 1, 1, 1,
-2.031044, -0.1175357, -1.471837, 1, 1, 1, 1, 1,
-2.013888, -0.1356452, -0.9046694, 1, 1, 1, 1, 1,
-1.93019, -0.3636419, -1.202412, 0, 0, 1, 1, 1,
-1.916995, 1.004818, -1.911398, 1, 0, 0, 1, 1,
-1.880119, -1.190913, -1.489205, 1, 0, 0, 1, 1,
-1.843042, -0.0170416, -2.386692, 1, 0, 0, 1, 1,
-1.840894, -0.256794, -1.695924, 1, 0, 0, 1, 1,
-1.813467, 0.06553896, -3.111782, 1, 0, 0, 1, 1,
-1.811668, 0.1123382, -1.543823, 0, 0, 0, 1, 1,
-1.777477, 1.717982, -0.08469189, 0, 0, 0, 1, 1,
-1.76822, 1.522727, -0.646091, 0, 0, 0, 1, 1,
-1.762142, -1.609566, -1.140965, 0, 0, 0, 1, 1,
-1.749562, -0.02080185, -0.4149518, 0, 0, 0, 1, 1,
-1.741228, 0.6412289, -1.96177, 0, 0, 0, 1, 1,
-1.737694, 0.07982761, -0.1178677, 0, 0, 0, 1, 1,
-1.702445, 2.042639, 0.8884106, 1, 1, 1, 1, 1,
-1.701075, -0.3445033, -3.175905, 1, 1, 1, 1, 1,
-1.699446, 0.4507471, -3.06422, 1, 1, 1, 1, 1,
-1.693361, -0.5842831, -1.534321, 1, 1, 1, 1, 1,
-1.687677, -0.08614673, -0.7297298, 1, 1, 1, 1, 1,
-1.679088, 0.2099903, -2.583992, 1, 1, 1, 1, 1,
-1.671793, 0.3086141, -1.089731, 1, 1, 1, 1, 1,
-1.659827, -0.2732061, -2.209408, 1, 1, 1, 1, 1,
-1.651374, 0.5627247, 0.2689978, 1, 1, 1, 1, 1,
-1.635712, -0.3290628, -0.6289362, 1, 1, 1, 1, 1,
-1.628512, -0.9445, -0.05590209, 1, 1, 1, 1, 1,
-1.620437, -0.1368072, -1.821713, 1, 1, 1, 1, 1,
-1.616953, 0.5013087, 0.6311958, 1, 1, 1, 1, 1,
-1.597416, 1.138103, 0.3590082, 1, 1, 1, 1, 1,
-1.587506, -0.004965607, -4.434403, 1, 1, 1, 1, 1,
-1.586691, -0.308387, -2.008327, 0, 0, 1, 1, 1,
-1.558423, 0.5657617, -0.4814562, 1, 0, 0, 1, 1,
-1.544218, 0.2788723, -0.7766616, 1, 0, 0, 1, 1,
-1.544014, -0.9179469, -3.66392, 1, 0, 0, 1, 1,
-1.540844, 0.9759929, -0.7836165, 1, 0, 0, 1, 1,
-1.530832, 0.583712, 0.7035943, 1, 0, 0, 1, 1,
-1.517383, 0.1297784, -1.587459, 0, 0, 0, 1, 1,
-1.5151, -0.1149276, -4.153949, 0, 0, 0, 1, 1,
-1.50935, 0.2551328, -2.697728, 0, 0, 0, 1, 1,
-1.492474, -0.2741802, -1.352801, 0, 0, 0, 1, 1,
-1.484834, 0.2306299, -2.205724, 0, 0, 0, 1, 1,
-1.483147, -0.3776273, -0.8358572, 0, 0, 0, 1, 1,
-1.47502, -1.040513, -1.376015, 0, 0, 0, 1, 1,
-1.44561, 0.9929017, 0.639113, 1, 1, 1, 1, 1,
-1.445299, -1.050997, -2.518104, 1, 1, 1, 1, 1,
-1.423695, 0.5563021, -1.450396, 1, 1, 1, 1, 1,
-1.420144, -0.6219647, -2.89971, 1, 1, 1, 1, 1,
-1.417523, -0.5881281, -2.842827, 1, 1, 1, 1, 1,
-1.407099, -0.7156021, -2.081409, 1, 1, 1, 1, 1,
-1.405056, 0.4991521, -0.3298871, 1, 1, 1, 1, 1,
-1.401471, 0.6092895, -0.774458, 1, 1, 1, 1, 1,
-1.399221, -0.1663837, -2.266947, 1, 1, 1, 1, 1,
-1.396888, -1.215072, -2.529048, 1, 1, 1, 1, 1,
-1.396451, -0.0466629, -1.176975, 1, 1, 1, 1, 1,
-1.388081, 0.8892819, -0.1973238, 1, 1, 1, 1, 1,
-1.38759, 0.7275341, -1.892645, 1, 1, 1, 1, 1,
-1.386974, -1.259601, -2.86668, 1, 1, 1, 1, 1,
-1.383236, -0.4161019, -1.842635, 1, 1, 1, 1, 1,
-1.382315, 0.02176226, -1.004303, 0, 0, 1, 1, 1,
-1.37448, 0.5803096, -1.544683, 1, 0, 0, 1, 1,
-1.359839, 1.465584, -0.3891496, 1, 0, 0, 1, 1,
-1.355443, -0.2510563, -2.249035, 1, 0, 0, 1, 1,
-1.349933, -0.1885212, -3.447808, 1, 0, 0, 1, 1,
-1.332635, 1.473684, -0.2046917, 1, 0, 0, 1, 1,
-1.332521, -0.3220318, -2.533178, 0, 0, 0, 1, 1,
-1.321718, -0.5809099, -2.589165, 0, 0, 0, 1, 1,
-1.306205, 0.3012747, -2.675727, 0, 0, 0, 1, 1,
-1.305688, 0.4515171, -0.4514705, 0, 0, 0, 1, 1,
-1.298291, -1.774728, -2.613681, 0, 0, 0, 1, 1,
-1.278018, -2.271582, -1.555032, 0, 0, 0, 1, 1,
-1.254706, -0.2773766, -1.006396, 0, 0, 0, 1, 1,
-1.253845, 1.888261, -1.593531, 1, 1, 1, 1, 1,
-1.252206, 0.03077647, -2.821879, 1, 1, 1, 1, 1,
-1.243171, -0.3076196, -1.174094, 1, 1, 1, 1, 1,
-1.238763, 0.0224061, -1.970435, 1, 1, 1, 1, 1,
-1.237514, 1.652584, -1.696533, 1, 1, 1, 1, 1,
-1.228886, 3.645908, -0.9302241, 1, 1, 1, 1, 1,
-1.228512, 0.1739126, -2.696858, 1, 1, 1, 1, 1,
-1.22666, 0.01987537, -0.9918892, 1, 1, 1, 1, 1,
-1.223978, 0.2567148, -0.2103952, 1, 1, 1, 1, 1,
-1.221423, 0.3588442, -0.6549776, 1, 1, 1, 1, 1,
-1.217824, 1.644949, 0.01706176, 1, 1, 1, 1, 1,
-1.210742, 1.547908, -1.86864, 1, 1, 1, 1, 1,
-1.209988, 1.951767, -0.6984761, 1, 1, 1, 1, 1,
-1.20438, 0.2158759, -1.337473, 1, 1, 1, 1, 1,
-1.197366, -0.6061182, -3.165524, 1, 1, 1, 1, 1,
-1.195795, 1.227451, 0.1420338, 0, 0, 1, 1, 1,
-1.187961, -1.929042, -2.250361, 1, 0, 0, 1, 1,
-1.187878, 0.6903327, -1.773963, 1, 0, 0, 1, 1,
-1.187444, 0.1039726, -1.844251, 1, 0, 0, 1, 1,
-1.176828, -0.9626527, -4.165014, 1, 0, 0, 1, 1,
-1.169886, 0.2694534, -2.141239, 1, 0, 0, 1, 1,
-1.167138, -1.056647, -2.741648, 0, 0, 0, 1, 1,
-1.164929, -1.11093, -4.23766, 0, 0, 0, 1, 1,
-1.150346, -1.691442, -1.950855, 0, 0, 0, 1, 1,
-1.141271, -1.197667, -3.011026, 0, 0, 0, 1, 1,
-1.141051, 1.292885, -1.198017, 0, 0, 0, 1, 1,
-1.136416, 1.717596, -0.9282244, 0, 0, 0, 1, 1,
-1.125167, 0.3808929, -1.78681, 0, 0, 0, 1, 1,
-1.12287, 0.1342853, -2.231, 1, 1, 1, 1, 1,
-1.105779, 0.01393975, -1.703788, 1, 1, 1, 1, 1,
-1.098165, -0.2286361, -0.8287488, 1, 1, 1, 1, 1,
-1.08867, 0.05823951, -1.71334, 1, 1, 1, 1, 1,
-1.082359, 0.6691316, -2.360245, 1, 1, 1, 1, 1,
-1.081793, -0.4781992, -2.114208, 1, 1, 1, 1, 1,
-1.081484, -0.6891121, -3.174681, 1, 1, 1, 1, 1,
-1.07751, -0.600608, -2.389811, 1, 1, 1, 1, 1,
-1.075854, -0.2269458, -1.867473, 1, 1, 1, 1, 1,
-1.069542, 1.692815, 0.7440953, 1, 1, 1, 1, 1,
-1.069456, 2.58013, 0.6062888, 1, 1, 1, 1, 1,
-1.060941, 1.339611, -1.379369, 1, 1, 1, 1, 1,
-1.054324, -0.4088794, -1.753429, 1, 1, 1, 1, 1,
-1.053265, -1.503424, -2.923343, 1, 1, 1, 1, 1,
-1.052588, 0.5313608, -1.448483, 1, 1, 1, 1, 1,
-1.048925, 0.3628818, -1.507191, 0, 0, 1, 1, 1,
-1.048053, -0.454738, -0.4336632, 1, 0, 0, 1, 1,
-1.047641, -0.5788999, -1.334201, 1, 0, 0, 1, 1,
-1.045327, -0.5644471, -1.03402, 1, 0, 0, 1, 1,
-1.039842, -0.02765741, -2.655785, 1, 0, 0, 1, 1,
-1.03226, -0.05491634, -0.8824828, 1, 0, 0, 1, 1,
-1.024264, -0.5797331, -0.6482683, 0, 0, 0, 1, 1,
-1.024086, 1.210919, -0.6980826, 0, 0, 0, 1, 1,
-1.023578, -0.5353496, -0.1120363, 0, 0, 0, 1, 1,
-1.021223, -1.608509, -3.561023, 0, 0, 0, 1, 1,
-1.01448, 0.3973174, -2.333424, 0, 0, 0, 1, 1,
-1.011161, 0.5262293, -1.899133, 0, 0, 0, 1, 1,
-1.00594, 0.3380205, -0.1989148, 0, 0, 0, 1, 1,
-0.9983432, 0.9321062, -0.2318504, 1, 1, 1, 1, 1,
-0.9934298, 0.8137404, 0.5212581, 1, 1, 1, 1, 1,
-0.9764229, 0.09379511, 0.3380693, 1, 1, 1, 1, 1,
-0.9748827, -0.4544096, -1.30972, 1, 1, 1, 1, 1,
-0.9730004, -0.2869024, -0.6667634, 1, 1, 1, 1, 1,
-0.9724217, 0.2482996, -1.414351, 1, 1, 1, 1, 1,
-0.9702242, 2.363717, 0.4277018, 1, 1, 1, 1, 1,
-0.9604464, 1.175209, 1.407997, 1, 1, 1, 1, 1,
-0.9570419, -0.2092866, -1.281252, 1, 1, 1, 1, 1,
-0.9536915, 0.6874393, -1.738627, 1, 1, 1, 1, 1,
-0.9347184, 0.5069136, -1.490569, 1, 1, 1, 1, 1,
-0.9319893, 0.3627113, -3.25686, 1, 1, 1, 1, 1,
-0.928323, -0.5899115, -1.990796, 1, 1, 1, 1, 1,
-0.9204914, -0.1366458, -3.177742, 1, 1, 1, 1, 1,
-0.9193983, -0.3167368, -1.789748, 1, 1, 1, 1, 1,
-0.9188705, -0.5821208, -2.404824, 0, 0, 1, 1, 1,
-0.9185663, -0.4704845, -0.761233, 1, 0, 0, 1, 1,
-0.9151055, -0.3321145, -2.536032, 1, 0, 0, 1, 1,
-0.9149114, -0.7221101, -2.568841, 1, 0, 0, 1, 1,
-0.9144683, -0.6091123, -2.228225, 1, 0, 0, 1, 1,
-0.9141015, 1.763708, -0.7435225, 1, 0, 0, 1, 1,
-0.9119915, 0.281903, -3.115615, 0, 0, 0, 1, 1,
-0.9051049, 1.054264, 0.07837328, 0, 0, 0, 1, 1,
-0.9001993, 0.04533356, -0.6364539, 0, 0, 0, 1, 1,
-0.8991129, 0.07744215, -2.770941, 0, 0, 0, 1, 1,
-0.8982755, -0.2326162, -0.3309847, 0, 0, 0, 1, 1,
-0.8974481, -0.2064076, -2.353817, 0, 0, 0, 1, 1,
-0.8937773, 0.2960332, -0.2251976, 0, 0, 0, 1, 1,
-0.8900872, -0.1681177, -1.817233, 1, 1, 1, 1, 1,
-0.8877931, 0.7026291, -1.623435, 1, 1, 1, 1, 1,
-0.8863024, -0.2768886, -2.134707, 1, 1, 1, 1, 1,
-0.8856478, 2.619597, -0.279485, 1, 1, 1, 1, 1,
-0.865177, -1.61676, -3.548325, 1, 1, 1, 1, 1,
-0.8615544, -1.140501, -0.2995087, 1, 1, 1, 1, 1,
-0.8603898, -1.428679, -2.485826, 1, 1, 1, 1, 1,
-0.8482798, -0.3321005, -0.344114, 1, 1, 1, 1, 1,
-0.8411049, 0.2281324, -0.2889636, 1, 1, 1, 1, 1,
-0.8401181, -1.144657, -1.776072, 1, 1, 1, 1, 1,
-0.8398569, -0.1409539, -2.256345, 1, 1, 1, 1, 1,
-0.8313822, 1.803216, -0.6829527, 1, 1, 1, 1, 1,
-0.8250062, -1.76321, -1.241754, 1, 1, 1, 1, 1,
-0.8244625, -1.077461, -3.060759, 1, 1, 1, 1, 1,
-0.8202197, -1.110426, -1.844929, 1, 1, 1, 1, 1,
-0.8196949, 1.312122, -0.9559216, 0, 0, 1, 1, 1,
-0.8191744, -0.2624008, -2.384983, 1, 0, 0, 1, 1,
-0.8159378, -0.8235993, -1.281854, 1, 0, 0, 1, 1,
-0.8130773, -1.054915, -1.241157, 1, 0, 0, 1, 1,
-0.8123346, -1.386699, -4.39869, 1, 0, 0, 1, 1,
-0.8114647, -0.8836291, -2.128607, 1, 0, 0, 1, 1,
-0.809463, 0.2033296, -1.385158, 0, 0, 0, 1, 1,
-0.8067604, -0.8989043, -1.697518, 0, 0, 0, 1, 1,
-0.8041065, 0.7105032, -2.942198, 0, 0, 0, 1, 1,
-0.801658, 0.1196399, -1.882702, 0, 0, 0, 1, 1,
-0.8015454, 0.8374775, -1.006618, 0, 0, 0, 1, 1,
-0.7850367, 0.2097893, 0.4927097, 0, 0, 0, 1, 1,
-0.7799774, 0.01153759, -2.329313, 0, 0, 0, 1, 1,
-0.7678875, -0.6977218, -0.4387177, 1, 1, 1, 1, 1,
-0.7624936, 0.2100181, -2.265487, 1, 1, 1, 1, 1,
-0.7595567, -0.8650386, -3.719282, 1, 1, 1, 1, 1,
-0.7588722, -0.8095853, -2.237282, 1, 1, 1, 1, 1,
-0.7584119, 0.714689, -1.512211, 1, 1, 1, 1, 1,
-0.7513107, 1.389119, -1.334122, 1, 1, 1, 1, 1,
-0.7495552, 0.6579669, -1.676049, 1, 1, 1, 1, 1,
-0.7427595, -1.053818, -2.546838, 1, 1, 1, 1, 1,
-0.742476, 0.9559845, -0.03354814, 1, 1, 1, 1, 1,
-0.7382926, -0.1295625, -2.697599, 1, 1, 1, 1, 1,
-0.7345339, 0.3152098, -1.60297, 1, 1, 1, 1, 1,
-0.7342469, 0.9734928, -0.1456926, 1, 1, 1, 1, 1,
-0.7329181, 0.7821395, -0.9385322, 1, 1, 1, 1, 1,
-0.7304625, 1.849067, 0.2855297, 1, 1, 1, 1, 1,
-0.7271175, 0.3023433, -1.335637, 1, 1, 1, 1, 1,
-0.7270511, -0.6225587, -1.627556, 0, 0, 1, 1, 1,
-0.7259535, -0.4197179, -1.459798, 1, 0, 0, 1, 1,
-0.720404, 0.09529953, -1.597352, 1, 0, 0, 1, 1,
-0.7139795, 0.5659048, -0.2000639, 1, 0, 0, 1, 1,
-0.7070182, -1.086495, -1.000661, 1, 0, 0, 1, 1,
-0.7051488, -0.9585833, -1.329675, 1, 0, 0, 1, 1,
-0.7024872, 1.008943, -1.811288, 0, 0, 0, 1, 1,
-0.7001946, -0.7985078, -1.819446, 0, 0, 0, 1, 1,
-0.6955367, 0.6244362, -0.02298664, 0, 0, 0, 1, 1,
-0.6909911, 1.768765, 0.1356314, 0, 0, 0, 1, 1,
-0.6805888, -0.9916888, -0.8737885, 0, 0, 0, 1, 1,
-0.6773815, -0.01466836, -0.6965094, 0, 0, 0, 1, 1,
-0.6744359, -2.099498, -1.970538, 0, 0, 0, 1, 1,
-0.6548975, 2.207938, -0.2796916, 1, 1, 1, 1, 1,
-0.6508259, 0.6230863, -0.6549796, 1, 1, 1, 1, 1,
-0.6507748, 0.3903903, -1.636778, 1, 1, 1, 1, 1,
-0.6503925, 0.02872779, -1.775898, 1, 1, 1, 1, 1,
-0.6487582, -0.3492918, -3.619313, 1, 1, 1, 1, 1,
-0.6475212, 0.8222947, -1.849414, 1, 1, 1, 1, 1,
-0.6473861, -0.6582178, -1.880125, 1, 1, 1, 1, 1,
-0.6467772, 1.454259, -0.4762308, 1, 1, 1, 1, 1,
-0.6462944, -0.1638238, -2.731842, 1, 1, 1, 1, 1,
-0.6389071, -0.7539814, -3.492985, 1, 1, 1, 1, 1,
-0.6378686, 1.047171, 0.8564477, 1, 1, 1, 1, 1,
-0.6368929, 1.338721, -1.619251, 1, 1, 1, 1, 1,
-0.6339106, 1.407062, 0.3313205, 1, 1, 1, 1, 1,
-0.6303304, 0.7588574, -1.357418, 1, 1, 1, 1, 1,
-0.6273845, 0.5456077, 0.5008869, 1, 1, 1, 1, 1,
-0.6271526, -0.9784319, -1.67407, 0, 0, 1, 1, 1,
-0.6265293, -0.3211749, -2.908313, 1, 0, 0, 1, 1,
-0.6187084, -0.3697746, -2.327852, 1, 0, 0, 1, 1,
-0.6163211, -0.1429764, -2.396962, 1, 0, 0, 1, 1,
-0.6131998, -1.373435, -3.056305, 1, 0, 0, 1, 1,
-0.6120828, -0.0110357, -0.9256313, 1, 0, 0, 1, 1,
-0.6115921, 0.5376744, 0.4182677, 0, 0, 0, 1, 1,
-0.6101902, -1.32476, -3.607493, 0, 0, 0, 1, 1,
-0.6088159, 0.5439942, -0.08259223, 0, 0, 0, 1, 1,
-0.6036414, -2.047759, -0.1455414, 0, 0, 0, 1, 1,
-0.6031556, 0.3968723, -1.68211, 0, 0, 0, 1, 1,
-0.5997241, -0.3347074, -0.8955998, 0, 0, 0, 1, 1,
-0.5881411, 0.08729485, -0.7191859, 0, 0, 0, 1, 1,
-0.5861748, -1.343563, -1.948605, 1, 1, 1, 1, 1,
-0.5783441, 1.784878, 0.9108068, 1, 1, 1, 1, 1,
-0.5781752, 1.870174, -1.514281, 1, 1, 1, 1, 1,
-0.5758362, -0.8122245, -2.912824, 1, 1, 1, 1, 1,
-0.5734872, -0.483271, -1.404757, 1, 1, 1, 1, 1,
-0.5716942, -0.3991014, -2.873029, 1, 1, 1, 1, 1,
-0.5709096, -1.156086, -0.4280384, 1, 1, 1, 1, 1,
-0.5693085, 2.59625, 0.3235592, 1, 1, 1, 1, 1,
-0.5623509, 1.939296, -1.912372, 1, 1, 1, 1, 1,
-0.561603, -0.3688825, -2.963647, 1, 1, 1, 1, 1,
-0.5611414, 0.9086482, -2.320629, 1, 1, 1, 1, 1,
-0.5538317, 1.096349, -1.651728, 1, 1, 1, 1, 1,
-0.5534536, 0.3970681, -1.815061, 1, 1, 1, 1, 1,
-0.5494727, -0.3480313, -0.4181134, 1, 1, 1, 1, 1,
-0.5489233, 0.2289655, -1.227099, 1, 1, 1, 1, 1,
-0.5473651, -1.283721, -4.05147, 0, 0, 1, 1, 1,
-0.5450342, -0.8978588, -1.68801, 1, 0, 0, 1, 1,
-0.5415043, -0.3215269, -1.562556, 1, 0, 0, 1, 1,
-0.5318701, -1.631328, -1.65296, 1, 0, 0, 1, 1,
-0.5268372, 1.713185, -0.679382, 1, 0, 0, 1, 1,
-0.5235585, 0.3460478, -0.2375964, 1, 0, 0, 1, 1,
-0.5204493, 0.4086793, 0.1412605, 0, 0, 0, 1, 1,
-0.5202672, -1.404824, -2.33354, 0, 0, 0, 1, 1,
-0.5174682, -1.428888, -3.252675, 0, 0, 0, 1, 1,
-0.5142217, 1.514026, -0.03000089, 0, 0, 0, 1, 1,
-0.5141188, 1.123634, -1.373689, 0, 0, 0, 1, 1,
-0.51319, -1.288609, -3.629412, 0, 0, 0, 1, 1,
-0.5095153, -0.2607977, -2.061829, 0, 0, 0, 1, 1,
-0.5085865, -0.394156, -2.920516, 1, 1, 1, 1, 1,
-0.5073042, 0.5660933, -0.4987029, 1, 1, 1, 1, 1,
-0.5065172, 0.5938291, -1.32246, 1, 1, 1, 1, 1,
-0.5044843, -0.01620441, -1.966036, 1, 1, 1, 1, 1,
-0.502246, -0.6103879, -4.759291, 1, 1, 1, 1, 1,
-0.4947447, -1.241051, -3.991827, 1, 1, 1, 1, 1,
-0.4943529, 0.3078332, -0.9759776, 1, 1, 1, 1, 1,
-0.492682, 0.3771625, -0.9820295, 1, 1, 1, 1, 1,
-0.4899774, 0.7554265, 0.01556479, 1, 1, 1, 1, 1,
-0.489445, 1.327945, -0.9494233, 1, 1, 1, 1, 1,
-0.4893593, -0.3885032, -3.296726, 1, 1, 1, 1, 1,
-0.4835869, -0.002184827, -0.4213812, 1, 1, 1, 1, 1,
-0.4766264, -0.6536065, -2.219714, 1, 1, 1, 1, 1,
-0.4755383, -0.8469484, -2.905995, 1, 1, 1, 1, 1,
-0.466524, 2.067416, 0.01836214, 1, 1, 1, 1, 1,
-0.4606294, 0.1294866, 0.05384657, 0, 0, 1, 1, 1,
-0.4602863, -0.7072154, -5.523637, 1, 0, 0, 1, 1,
-0.4591566, -0.7224995, -2.805117, 1, 0, 0, 1, 1,
-0.4551092, -1.552237, -2.308932, 1, 0, 0, 1, 1,
-0.4539132, 0.6538805, -0.4640101, 1, 0, 0, 1, 1,
-0.4530025, 0.02825634, -2.452459, 1, 0, 0, 1, 1,
-0.4459585, -0.7940018, -4.131532, 0, 0, 0, 1, 1,
-0.4448442, 0.52826, -1.348964, 0, 0, 0, 1, 1,
-0.441314, -0.491938, -4.06856, 0, 0, 0, 1, 1,
-0.4387951, 0.3464767, 1.434483, 0, 0, 0, 1, 1,
-0.4360615, -0.3227877, -2.728264, 0, 0, 0, 1, 1,
-0.4349289, 0.008043843, -1.980589, 0, 0, 0, 1, 1,
-0.4333473, 0.7683825, -0.8471481, 0, 0, 0, 1, 1,
-0.4301324, -0.51323, -2.212067, 1, 1, 1, 1, 1,
-0.428661, 0.8812203, -0.104274, 1, 1, 1, 1, 1,
-0.4275078, -0.4296809, -2.508943, 1, 1, 1, 1, 1,
-0.4247541, 0.6675216, -1.409681, 1, 1, 1, 1, 1,
-0.4215071, 0.1071421, -3.025194, 1, 1, 1, 1, 1,
-0.4187374, 0.4281, -0.1162274, 1, 1, 1, 1, 1,
-0.417466, 0.003872937, 2.166961, 1, 1, 1, 1, 1,
-0.4162345, 0.2299688, -0.4470038, 1, 1, 1, 1, 1,
-0.4139087, -0.3304806, -4.275122, 1, 1, 1, 1, 1,
-0.4120836, 1.033841, 0.9940073, 1, 1, 1, 1, 1,
-0.4112532, -1.384833, -3.211203, 1, 1, 1, 1, 1,
-0.4090757, -1.021355, -3.163677, 1, 1, 1, 1, 1,
-0.4059735, -0.3523825, -1.646193, 1, 1, 1, 1, 1,
-0.4059638, -1.600337, -2.962596, 1, 1, 1, 1, 1,
-0.4057802, 0.6133021, -1.020671, 1, 1, 1, 1, 1,
-0.4056139, -1.357201, -2.772231, 0, 0, 1, 1, 1,
-0.4049061, 1.654757, 0.2433735, 1, 0, 0, 1, 1,
-0.3995658, 0.3120239, -1.182031, 1, 0, 0, 1, 1,
-0.3984996, 0.3438621, -1.6383, 1, 0, 0, 1, 1,
-0.3984114, 0.04918632, -0.6093079, 1, 0, 0, 1, 1,
-0.393314, 1.989028, 0.6627608, 1, 0, 0, 1, 1,
-0.3898053, 0.9520956, -0.02250983, 0, 0, 0, 1, 1,
-0.3872583, 0.1241651, -0.6424891, 0, 0, 0, 1, 1,
-0.3802944, 0.552399, 0.1430618, 0, 0, 0, 1, 1,
-0.376202, 0.2451306, 0.07065196, 0, 0, 0, 1, 1,
-0.3743805, -0.4927046, -2.006805, 0, 0, 0, 1, 1,
-0.3703465, 0.1233659, 0.5257733, 0, 0, 0, 1, 1,
-0.3687858, -0.5150871, -2.643574, 0, 0, 0, 1, 1,
-0.3681846, -0.5167204, -3.285029, 1, 1, 1, 1, 1,
-0.3678375, 1.234168, -0.4138213, 1, 1, 1, 1, 1,
-0.3654193, -1.774638, -3.434279, 1, 1, 1, 1, 1,
-0.365303, -2.467662, -3.427989, 1, 1, 1, 1, 1,
-0.3646563, -1.5425, -2.661194, 1, 1, 1, 1, 1,
-0.3636939, -0.1848901, -3.440822, 1, 1, 1, 1, 1,
-0.3612472, -0.7912917, -1.107636, 1, 1, 1, 1, 1,
-0.3610692, -0.1622707, -0.8255654, 1, 1, 1, 1, 1,
-0.3590125, 0.5992784, -1.100434, 1, 1, 1, 1, 1,
-0.35447, -1.126009, -1.99962, 1, 1, 1, 1, 1,
-0.351838, -0.2096819, -3.09409, 1, 1, 1, 1, 1,
-0.3463487, 1.75748, -1.3943, 1, 1, 1, 1, 1,
-0.3384912, 0.3546488, -3.420009, 1, 1, 1, 1, 1,
-0.337524, -0.4666403, -5.208831, 1, 1, 1, 1, 1,
-0.3316194, 0.7875834, -0.6252515, 1, 1, 1, 1, 1,
-0.3313339, -1.70761, -2.953673, 0, 0, 1, 1, 1,
-0.3310441, -1.496533, -4.074436, 1, 0, 0, 1, 1,
-0.3295916, -0.5571377, -2.200221, 1, 0, 0, 1, 1,
-0.3295637, -0.5457447, -2.945077, 1, 0, 0, 1, 1,
-0.3248358, -0.9594201, -4.632591, 1, 0, 0, 1, 1,
-0.3224413, 0.0199111, -0.1854084, 1, 0, 0, 1, 1,
-0.3209316, 0.4303164, 1.389366, 0, 0, 0, 1, 1,
-0.3137594, -0.4615356, -2.225736, 0, 0, 0, 1, 1,
-0.3127792, -2.220125, -4.247092, 0, 0, 0, 1, 1,
-0.3109889, 0.3198575, 0.4998517, 0, 0, 0, 1, 1,
-0.3096296, 1.086542, -1.33442, 0, 0, 0, 1, 1,
-0.3070372, 1.168227, 0.3704871, 0, 0, 0, 1, 1,
-0.2993839, -1.860657, -0.5133798, 0, 0, 0, 1, 1,
-0.2965555, 2.486984, -1.456464, 1, 1, 1, 1, 1,
-0.2939892, 0.04768017, -1.512338, 1, 1, 1, 1, 1,
-0.2907394, 0.3777391, -0.7671426, 1, 1, 1, 1, 1,
-0.285069, -1.002604, -1.814967, 1, 1, 1, 1, 1,
-0.2769307, 0.4788883, 0.2211037, 1, 1, 1, 1, 1,
-0.2742063, 0.9199173, 0.2983395, 1, 1, 1, 1, 1,
-0.2717341, 0.7493657, 0.7427127, 1, 1, 1, 1, 1,
-0.270277, -0.4071709, -1.918429, 1, 1, 1, 1, 1,
-0.2694531, 0.3619729, -1.146496, 1, 1, 1, 1, 1,
-0.2682235, -0.5096452, -1.197888, 1, 1, 1, 1, 1,
-0.2678849, 0.3975409, -0.498687, 1, 1, 1, 1, 1,
-0.267213, 0.6065466, -1.759986, 1, 1, 1, 1, 1,
-0.2629938, -0.4493593, -2.809049, 1, 1, 1, 1, 1,
-0.2600657, -0.7527343, -1.152403, 1, 1, 1, 1, 1,
-0.2572998, 0.08660958, -0.9860498, 1, 1, 1, 1, 1,
-0.253043, 0.01684941, -0.9676976, 0, 0, 1, 1, 1,
-0.2521934, -0.1279718, -1.629408, 1, 0, 0, 1, 1,
-0.2494479, 1.480198, 0.254722, 1, 0, 0, 1, 1,
-0.2473667, -0.2622434, -3.242328, 1, 0, 0, 1, 1,
-0.2456165, -0.5258211, -1.98692, 1, 0, 0, 1, 1,
-0.244013, -0.7890571, -1.62101, 1, 0, 0, 1, 1,
-0.2430612, -0.06358162, -2.627142, 0, 0, 0, 1, 1,
-0.2400493, 0.5035893, 1.854971, 0, 0, 0, 1, 1,
-0.2395076, 1.609771, 0.7092266, 0, 0, 0, 1, 1,
-0.2384607, 0.4008869, -0.5680279, 0, 0, 0, 1, 1,
-0.2377135, -0.2976156, -2.42031, 0, 0, 0, 1, 1,
-0.2364704, -0.18116, -3.371376, 0, 0, 0, 1, 1,
-0.2360124, -1.045582, -3.051539, 0, 0, 0, 1, 1,
-0.2326164, 2.454948, -0.59312, 1, 1, 1, 1, 1,
-0.2251014, -1.120304, -3.754805, 1, 1, 1, 1, 1,
-0.2250753, -0.3799704, -4.215631, 1, 1, 1, 1, 1,
-0.2243924, 0.8639017, -0.8362969, 1, 1, 1, 1, 1,
-0.2203837, 0.07007895, -0.4184994, 1, 1, 1, 1, 1,
-0.2149469, 0.3546704, 0.1731237, 1, 1, 1, 1, 1,
-0.2088132, 0.3405301, 0.1859194, 1, 1, 1, 1, 1,
-0.2082543, -1.234129, -4.368379, 1, 1, 1, 1, 1,
-0.2055009, -0.2061179, -2.810213, 1, 1, 1, 1, 1,
-0.2047572, 0.6991237, -1.614416, 1, 1, 1, 1, 1,
-0.2044902, 0.6159572, 0.1717002, 1, 1, 1, 1, 1,
-0.202989, 0.03457962, -0.5246877, 1, 1, 1, 1, 1,
-0.1979875, 0.02289749, -1.573865, 1, 1, 1, 1, 1,
-0.1972796, 0.4450659, 1.156127, 1, 1, 1, 1, 1,
-0.196742, 0.04822185, -0.5257905, 1, 1, 1, 1, 1,
-0.1966764, -0.9810066, -2.78051, 0, 0, 1, 1, 1,
-0.19133, 0.6270501, -2.322669, 1, 0, 0, 1, 1,
-0.1908108, -1.998192, -3.829932, 1, 0, 0, 1, 1,
-0.1886045, -0.499365, -3.330592, 1, 0, 0, 1, 1,
-0.1880514, 0.9329944, -0.2632179, 1, 0, 0, 1, 1,
-0.1842047, -4.114034, -3.871364, 1, 0, 0, 1, 1,
-0.1814684, -0.338051, -3.283494, 0, 0, 0, 1, 1,
-0.1801717, 0.6709717, -0.1940411, 0, 0, 0, 1, 1,
-0.1742851, -2.095116, -1.249514, 0, 0, 0, 1, 1,
-0.173665, 0.2309199, 0.6213758, 0, 0, 0, 1, 1,
-0.1693794, 0.02394785, -1.67688, 0, 0, 0, 1, 1,
-0.168163, -0.2037381, -0.7966719, 0, 0, 0, 1, 1,
-0.163507, -1.595023, -5.303668, 0, 0, 0, 1, 1,
-0.1613997, -0.4553056, -1.854368, 1, 1, 1, 1, 1,
-0.1595899, 1.376435, -0.5499251, 1, 1, 1, 1, 1,
-0.1571577, 0.9912682, 0.1525342, 1, 1, 1, 1, 1,
-0.1534684, -0.9466837, -3.211103, 1, 1, 1, 1, 1,
-0.1524915, 1.106455, 0.9467689, 1, 1, 1, 1, 1,
-0.1518007, -1.53311, -2.461672, 1, 1, 1, 1, 1,
-0.1492049, -0.6137547, -1.581543, 1, 1, 1, 1, 1,
-0.1467414, 1.504584, -0.3605916, 1, 1, 1, 1, 1,
-0.1446799, -1.294649, -2.800984, 1, 1, 1, 1, 1,
-0.1426793, 1.012451, -1.818693, 1, 1, 1, 1, 1,
-0.1363278, -0.5078261, -3.705266, 1, 1, 1, 1, 1,
-0.135645, -0.8407953, -3.841549, 1, 1, 1, 1, 1,
-0.1353711, 0.04057518, -1.447477, 1, 1, 1, 1, 1,
-0.1353618, -0.1133618, -3.266585, 1, 1, 1, 1, 1,
-0.1349852, 0.2290643, -0.2765912, 1, 1, 1, 1, 1,
-0.1311174, 0.6842992, 0.7155622, 0, 0, 1, 1, 1,
-0.1299087, -1.214998, -2.217833, 1, 0, 0, 1, 1,
-0.1291679, -1.507774, -2.34976, 1, 0, 0, 1, 1,
-0.1265796, 0.8210795, -0.8626433, 1, 0, 0, 1, 1,
-0.1250613, 1.604407, -0.07697645, 1, 0, 0, 1, 1,
-0.1136253, -0.1306406, -3.769205, 1, 0, 0, 1, 1,
-0.1130317, -0.5133835, -4.408333, 0, 0, 0, 1, 1,
-0.1119994, 3.103786, -0.831879, 0, 0, 0, 1, 1,
-0.1076812, 1.174333, -0.3272693, 0, 0, 0, 1, 1,
-0.103389, -0.9187114, -3.699531, 0, 0, 0, 1, 1,
-0.1019501, -0.7529671, -2.453791, 0, 0, 0, 1, 1,
-0.09882633, 1.009801, 0.2426061, 0, 0, 0, 1, 1,
-0.0974906, 0.2867232, -0.3591148, 0, 0, 0, 1, 1,
-0.09372064, -0.3597962, -2.974483, 1, 1, 1, 1, 1,
-0.09332963, 1.64396, -0.1357882, 1, 1, 1, 1, 1,
-0.0921548, -0.7183066, -2.130018, 1, 1, 1, 1, 1,
-0.09096039, 2.287286, 0.9326698, 1, 1, 1, 1, 1,
-0.08753461, -0.7764966, -3.267017, 1, 1, 1, 1, 1,
-0.08081481, -0.4891032, -1.760201, 1, 1, 1, 1, 1,
-0.08000235, 0.8367373, -0.02637289, 1, 1, 1, 1, 1,
-0.07541545, 0.3362633, 0.7493662, 1, 1, 1, 1, 1,
-0.07318018, -1.126896, -4.606812, 1, 1, 1, 1, 1,
-0.0680069, -0.7346783, -3.811145, 1, 1, 1, 1, 1,
-0.06413339, -0.1510934, -4.675617, 1, 1, 1, 1, 1,
-0.061049, 0.6522963, 0.04677321, 1, 1, 1, 1, 1,
-0.05883325, -0.3211081, -3.762652, 1, 1, 1, 1, 1,
-0.05442804, 1.994241, -0.6061725, 1, 1, 1, 1, 1,
-0.04978802, -0.8283464, -0.9508845, 1, 1, 1, 1, 1,
-0.04688761, 0.5008249, 0.7174065, 0, 0, 1, 1, 1,
-0.04107565, 0.2839513, -1.304213, 1, 0, 0, 1, 1,
-0.04022368, 0.06496639, -1.484361, 1, 0, 0, 1, 1,
-0.03859965, -0.3657638, -1.79826, 1, 0, 0, 1, 1,
-0.03669666, -0.7841724, -2.363444, 1, 0, 0, 1, 1,
-0.03476236, 0.4049201, -0.001472897, 1, 0, 0, 1, 1,
-0.03320695, 0.05608857, -0.208687, 0, 0, 0, 1, 1,
-0.0305962, -1.564882, -3.522224, 0, 0, 0, 1, 1,
-0.02909593, -1.105696, -2.60353, 0, 0, 0, 1, 1,
-0.02574377, 0.8462067, -0.9253368, 0, 0, 0, 1, 1,
-0.02318337, -0.1629219, -1.244668, 0, 0, 0, 1, 1,
-0.01886635, -1.495218, -1.935137, 0, 0, 0, 1, 1,
-0.0167079, 1.4302, 0.7234167, 0, 0, 0, 1, 1,
-0.01616022, -0.02476372, -2.573857, 1, 1, 1, 1, 1,
-0.01404453, 1.314812, 0.2079962, 1, 1, 1, 1, 1,
-0.0129662, -1.213411, -2.830503, 1, 1, 1, 1, 1,
-0.01210933, 1.492429, -1.017066, 1, 1, 1, 1, 1,
-0.01186252, 1.027384, 0.7127885, 1, 1, 1, 1, 1,
-0.008327113, 0.5785578, -1.066116, 1, 1, 1, 1, 1,
-0.001033282, 0.3516991, 1.689583, 1, 1, 1, 1, 1,
8.912203e-05, -1.248328, 2.109067, 1, 1, 1, 1, 1,
0.002103767, -0.1728152, 2.603747, 1, 1, 1, 1, 1,
0.002133799, -0.4267756, 3.218034, 1, 1, 1, 1, 1,
0.002556092, -0.7877687, 3.558337, 1, 1, 1, 1, 1,
0.008043955, -1.27967, 3.5776, 1, 1, 1, 1, 1,
0.01591351, -0.8441682, 2.916335, 1, 1, 1, 1, 1,
0.01633966, 0.5487716, 2.051548, 1, 1, 1, 1, 1,
0.02048311, 0.3890366, 1.522941, 1, 1, 1, 1, 1,
0.020607, 0.8828047, -0.1491505, 0, 0, 1, 1, 1,
0.02571701, -0.3268272, 1.617534, 1, 0, 0, 1, 1,
0.02585997, -2.303965, 2.6394, 1, 0, 0, 1, 1,
0.02729125, -0.931033, 2.852978, 1, 0, 0, 1, 1,
0.03099687, 0.1655181, -0.05030462, 1, 0, 0, 1, 1,
0.03313954, -0.7564156, 3.944379, 1, 0, 0, 1, 1,
0.03420365, 0.5276453, -0.6473305, 0, 0, 0, 1, 1,
0.04316917, -0.2887155, 2.791375, 0, 0, 0, 1, 1,
0.04760704, -0.2575947, 3.270877, 0, 0, 0, 1, 1,
0.04928894, 0.786414, -0.6578519, 0, 0, 0, 1, 1,
0.04973228, 0.3818601, 1.589445, 0, 0, 0, 1, 1,
0.05092647, 0.06176241, -1.183098, 0, 0, 0, 1, 1,
0.05244389, -0.3085041, 3.678233, 0, 0, 0, 1, 1,
0.052589, 0.9093971, 0.7970335, 1, 1, 1, 1, 1,
0.05309963, -0.8622417, 3.079898, 1, 1, 1, 1, 1,
0.05438856, 0.7621793, 0.5403659, 1, 1, 1, 1, 1,
0.05674754, -1.421163, 2.373577, 1, 1, 1, 1, 1,
0.05757136, -0.3739567, 2.724218, 1, 1, 1, 1, 1,
0.05855438, -1.57603, 3.108622, 1, 1, 1, 1, 1,
0.06021624, 0.01747504, 1.356943, 1, 1, 1, 1, 1,
0.06093723, -0.1415486, 1.507185, 1, 1, 1, 1, 1,
0.06859981, 0.813388, 0.03576733, 1, 1, 1, 1, 1,
0.07572928, 0.8457329, 2.038897, 1, 1, 1, 1, 1,
0.07752109, -0.3061213, 2.420641, 1, 1, 1, 1, 1,
0.0793011, 1.67931, -1.186978, 1, 1, 1, 1, 1,
0.08544306, -0.2586693, 3.096733, 1, 1, 1, 1, 1,
0.08572957, 1.40201, -1.279104, 1, 1, 1, 1, 1,
0.08694935, 0.766295, 0.6366318, 1, 1, 1, 1, 1,
0.08839323, 0.4897553, 0.6148455, 0, 0, 1, 1, 1,
0.09223931, -0.02009699, 2.134958, 1, 0, 0, 1, 1,
0.09421211, 0.3873471, 2.361663, 1, 0, 0, 1, 1,
0.09607456, 0.471498, -0.3666021, 1, 0, 0, 1, 1,
0.09735674, -0.5698106, 2.3926, 1, 0, 0, 1, 1,
0.09736189, -0.7802818, 1.29273, 1, 0, 0, 1, 1,
0.1011054, 2.192744, 0.3269229, 0, 0, 0, 1, 1,
0.1037834, -1.105469, 4.353772, 0, 0, 0, 1, 1,
0.1043559, -0.6607382, 3.54409, 0, 0, 0, 1, 1,
0.1081736, 0.1493413, 1.184732, 0, 0, 0, 1, 1,
0.1114884, 0.244976, -0.3784622, 0, 0, 0, 1, 1,
0.1146403, -0.2574196, 0.59651, 0, 0, 0, 1, 1,
0.1172484, -1.375013, 3.388869, 0, 0, 0, 1, 1,
0.1172638, 0.5318479, 0.6649067, 1, 1, 1, 1, 1,
0.1184894, -0.1581395, 1.214586, 1, 1, 1, 1, 1,
0.1233394, 1.607199, 1.860157, 1, 1, 1, 1, 1,
0.1238719, -0.4467065, 4.097204, 1, 1, 1, 1, 1,
0.1334846, 0.59087, 0.2787517, 1, 1, 1, 1, 1,
0.1364309, -1.041831, 2.319612, 1, 1, 1, 1, 1,
0.1376656, 0.6616763, -0.400351, 1, 1, 1, 1, 1,
0.1412942, 2.324784, -1.42492, 1, 1, 1, 1, 1,
0.1434237, 0.1252456, -0.5671031, 1, 1, 1, 1, 1,
0.1463604, 2.541354, 1.231394, 1, 1, 1, 1, 1,
0.1491874, -0.3790131, 2.142413, 1, 1, 1, 1, 1,
0.1545988, 2.153545, -0.00453217, 1, 1, 1, 1, 1,
0.161385, -0.5820584, 2.585716, 1, 1, 1, 1, 1,
0.1641639, -1.171875, 1.642992, 1, 1, 1, 1, 1,
0.1647963, 0.7160815, 0.8203755, 1, 1, 1, 1, 1,
0.1676155, 0.04118542, 0.9433971, 0, 0, 1, 1, 1,
0.1690494, 0.615593, 0.3698459, 1, 0, 0, 1, 1,
0.1711258, -0.5574939, 2.524012, 1, 0, 0, 1, 1,
0.1731585, -1.24311, 2.898129, 1, 0, 0, 1, 1,
0.1794333, 0.7145093, 0.7885515, 1, 0, 0, 1, 1,
0.1811989, -0.5849587, 2.025191, 1, 0, 0, 1, 1,
0.1845905, -0.478063, 4.182048, 0, 0, 0, 1, 1,
0.1913589, -0.3298703, 1.987225, 0, 0, 0, 1, 1,
0.1934644, -1.11064, 3.27712, 0, 0, 0, 1, 1,
0.1936318, -0.6241691, 3.910275, 0, 0, 0, 1, 1,
0.1944519, 0.1129775, 0.1982259, 0, 0, 0, 1, 1,
0.1955508, -1.153332, 2.651339, 0, 0, 0, 1, 1,
0.1968672, 0.2641519, 1.68727, 0, 0, 0, 1, 1,
0.1976694, -1.137951, 2.667509, 1, 1, 1, 1, 1,
0.1984895, 0.3595648, -0.2722366, 1, 1, 1, 1, 1,
0.1990501, -0.5863047, 2.021663, 1, 1, 1, 1, 1,
0.2005164, 0.1791965, 0.5176828, 1, 1, 1, 1, 1,
0.2012135, -0.5547879, 2.49334, 1, 1, 1, 1, 1,
0.2016788, 1.416656, 0.2797753, 1, 1, 1, 1, 1,
0.2022252, -0.3142956, 1.904863, 1, 1, 1, 1, 1,
0.2047918, 1.159178, 0.1684025, 1, 1, 1, 1, 1,
0.2060894, -0.5260935, 0.9785542, 1, 1, 1, 1, 1,
0.2065095, -0.1323573, 0.4634154, 1, 1, 1, 1, 1,
0.215658, 1.182458, -0.337056, 1, 1, 1, 1, 1,
0.2164273, 0.2616907, 2.03637, 1, 1, 1, 1, 1,
0.2169133, 0.6618621, -0.7716191, 1, 1, 1, 1, 1,
0.2211529, -0.4508014, 2.23415, 1, 1, 1, 1, 1,
0.2217196, -0.5442407, 0.2770416, 1, 1, 1, 1, 1,
0.2225999, 0.4073671, 0.7382042, 0, 0, 1, 1, 1,
0.2259115, -0.8835624, 1.376713, 1, 0, 0, 1, 1,
0.2259356, 1.826404, -2.223819, 1, 0, 0, 1, 1,
0.2329375, -1.287916, 4.361013, 1, 0, 0, 1, 1,
0.2333796, 0.1865943, -0.6611873, 1, 0, 0, 1, 1,
0.2342619, -0.2534278, 2.729352, 1, 0, 0, 1, 1,
0.2377268, -0.1433439, 3.210321, 0, 0, 0, 1, 1,
0.243786, 0.1588048, 1.474568, 0, 0, 0, 1, 1,
0.2448668, 2.206766, 1.017926, 0, 0, 0, 1, 1,
0.2449053, 1.226113, 2.226028, 0, 0, 0, 1, 1,
0.2467991, -1.141292, 4.40119, 0, 0, 0, 1, 1,
0.2472666, -0.1484071, 2.407629, 0, 0, 0, 1, 1,
0.2494433, 0.2492182, 0.598628, 0, 0, 0, 1, 1,
0.2510945, 0.286315, 0.8563521, 1, 1, 1, 1, 1,
0.2549718, 1.105509, -0.5708586, 1, 1, 1, 1, 1,
0.2552093, -1.245241, 4.97518, 1, 1, 1, 1, 1,
0.262501, 0.1348582, 0.6103789, 1, 1, 1, 1, 1,
0.2673789, 0.3873953, 0.3183381, 1, 1, 1, 1, 1,
0.2712032, -0.2967799, 1.007168, 1, 1, 1, 1, 1,
0.2714374, 2.221296, 0.8658425, 1, 1, 1, 1, 1,
0.2721338, 0.1875776, 2.061611, 1, 1, 1, 1, 1,
0.2727056, -0.4861275, 4.048891, 1, 1, 1, 1, 1,
0.2758551, -0.3750658, 1.868507, 1, 1, 1, 1, 1,
0.2767165, 0.02757674, 0.6252346, 1, 1, 1, 1, 1,
0.2777062, -2.223661, 0.6704559, 1, 1, 1, 1, 1,
0.286038, 1.258651, -0.4464254, 1, 1, 1, 1, 1,
0.2893577, -0.5528852, 1.079851, 1, 1, 1, 1, 1,
0.2899916, 1.958468, -0.8299256, 1, 1, 1, 1, 1,
0.2969618, 0.492926, 0.1247039, 0, 0, 1, 1, 1,
0.2978822, -0.8779128, 2.451016, 1, 0, 0, 1, 1,
0.2985258, 0.3121145, 1.320919, 1, 0, 0, 1, 1,
0.2987546, 0.8575615, 0.1786264, 1, 0, 0, 1, 1,
0.3000579, -1.111239, 3.584468, 1, 0, 0, 1, 1,
0.3025473, -0.3446409, 2.404751, 1, 0, 0, 1, 1,
0.3052383, 2.334228, 0.3963565, 0, 0, 0, 1, 1,
0.3057971, -0.4899207, 2.919536, 0, 0, 0, 1, 1,
0.3066952, -1.163911, 2.839478, 0, 0, 0, 1, 1,
0.311635, 1.490959, -0.5322182, 0, 0, 0, 1, 1,
0.3124547, 0.197228, 0.3885806, 0, 0, 0, 1, 1,
0.3149661, 0.5520604, -1.013729, 0, 0, 0, 1, 1,
0.318313, 0.03848873, 2.396795, 0, 0, 0, 1, 1,
0.318363, -1.462211, 3.286095, 1, 1, 1, 1, 1,
0.3216713, -0.2254288, 3.999911, 1, 1, 1, 1, 1,
0.3218794, -0.7056591, 1.84427, 1, 1, 1, 1, 1,
0.3219651, 0.1477599, 1.180565, 1, 1, 1, 1, 1,
0.3224874, -1.26658, 3.556071, 1, 1, 1, 1, 1,
0.3280677, 0.3258585, 0.6724903, 1, 1, 1, 1, 1,
0.3295155, -0.1922243, 1.546911, 1, 1, 1, 1, 1,
0.3296835, 1.205161, 0.3617209, 1, 1, 1, 1, 1,
0.3343483, -0.3419192, 4.399912, 1, 1, 1, 1, 1,
0.34524, -1.161185, 2.413192, 1, 1, 1, 1, 1,
0.3493111, -1.030324, 3.753356, 1, 1, 1, 1, 1,
0.3594464, 0.2060345, 0.8470719, 1, 1, 1, 1, 1,
0.3598046, -2.381343, 3.33303, 1, 1, 1, 1, 1,
0.3614843, 0.4437056, 1.497925, 1, 1, 1, 1, 1,
0.3661654, 1.420353, 0.3697967, 1, 1, 1, 1, 1,
0.3666732, -1.299241, 3.145036, 0, 0, 1, 1, 1,
0.3669724, 3.031275, -1.472217, 1, 0, 0, 1, 1,
0.3673912, -0.5636655, 1.554499, 1, 0, 0, 1, 1,
0.3691435, -0.3185895, 2.162625, 1, 0, 0, 1, 1,
0.3715198, 0.04880569, 1.232224, 1, 0, 0, 1, 1,
0.3748358, 1.806355, -1.134338, 1, 0, 0, 1, 1,
0.376183, -1.925306, 2.917054, 0, 0, 0, 1, 1,
0.3765858, -0.3440156, 2.393863, 0, 0, 0, 1, 1,
0.382895, 1.128882, 0.9587106, 0, 0, 0, 1, 1,
0.3844412, -0.3791296, 0.8861798, 0, 0, 0, 1, 1,
0.3844667, -0.5713353, 3.833461, 0, 0, 0, 1, 1,
0.3846414, -0.3661907, 2.003982, 0, 0, 0, 1, 1,
0.3852735, 1.992523, 0.7877066, 0, 0, 0, 1, 1,
0.387261, 1.186023, -2.371557, 1, 1, 1, 1, 1,
0.3894764, -0.8469173, 2.292011, 1, 1, 1, 1, 1,
0.3938434, 1.532793, 0.09031545, 1, 1, 1, 1, 1,
0.3949713, 0.3962092, 1.23552, 1, 1, 1, 1, 1,
0.394983, 0.3879417, 1.280106, 1, 1, 1, 1, 1,
0.4000453, 0.1137516, 0.1852851, 1, 1, 1, 1, 1,
0.4086452, 2.025099, 0.2330558, 1, 1, 1, 1, 1,
0.4119068, 0.5874282, 0.5253666, 1, 1, 1, 1, 1,
0.4129303, 0.08789735, 2.544498, 1, 1, 1, 1, 1,
0.4297023, -0.6340896, 3.006636, 1, 1, 1, 1, 1,
0.4314217, -0.2694166, 2.529307, 1, 1, 1, 1, 1,
0.4322386, -0.2746328, 2.073597, 1, 1, 1, 1, 1,
0.4346482, -0.82236, 4.22814, 1, 1, 1, 1, 1,
0.434854, 0.1057016, 1.242794, 1, 1, 1, 1, 1,
0.4372573, -0.23337, 1.49605, 1, 1, 1, 1, 1,
0.4395541, -0.2576084, 2.41403, 0, 0, 1, 1, 1,
0.4413046, -0.9816563, 3.918712, 1, 0, 0, 1, 1,
0.4420614, -0.1493632, 0.6911, 1, 0, 0, 1, 1,
0.4434115, 0.6690419, 1.686952, 1, 0, 0, 1, 1,
0.4473833, -1.783202, 3.571941, 1, 0, 0, 1, 1,
0.4502869, 0.291926, 0.7409221, 1, 0, 0, 1, 1,
0.4517611, -1.474429, 2.098042, 0, 0, 0, 1, 1,
0.4524414, 0.3294773, -0.03865666, 0, 0, 0, 1, 1,
0.4543333, 2.392513, 0.6232835, 0, 0, 0, 1, 1,
0.4564748, -0.1292473, 1.875556, 0, 0, 0, 1, 1,
0.4657505, 0.7119266, -0.4295537, 0, 0, 0, 1, 1,
0.4674048, -0.3237463, 2.506684, 0, 0, 0, 1, 1,
0.4674944, 1.098488, 1.701166, 0, 0, 0, 1, 1,
0.4707196, -1.706023, 2.026854, 1, 1, 1, 1, 1,
0.4719115, -0.7994805, 4.283406, 1, 1, 1, 1, 1,
0.4739158, -1.5615, 3.166608, 1, 1, 1, 1, 1,
0.4742264, 0.5126234, 1.747999, 1, 1, 1, 1, 1,
0.4757874, 2.173657, 1.876162, 1, 1, 1, 1, 1,
0.4775575, -0.7444153, 2.160872, 1, 1, 1, 1, 1,
0.4779187, 1.780621, 1.094273, 1, 1, 1, 1, 1,
0.4782783, -1.255352, 3.002657, 1, 1, 1, 1, 1,
0.4827534, 0.6427099, -0.7452397, 1, 1, 1, 1, 1,
0.4850123, 1.632191, -1.017176, 1, 1, 1, 1, 1,
0.486473, 1.028835, 0.5155572, 1, 1, 1, 1, 1,
0.4907762, 0.2758795, 1.274063, 1, 1, 1, 1, 1,
0.4919142, 0.8787052, 0.4106886, 1, 1, 1, 1, 1,
0.4932774, -0.2726956, 3.272788, 1, 1, 1, 1, 1,
0.4976185, 1.619071, -0.4295348, 1, 1, 1, 1, 1,
0.5128074, -0.5195677, 1.833934, 0, 0, 1, 1, 1,
0.5147766, 0.01761758, 1.525386, 1, 0, 0, 1, 1,
0.5162235, -1.282579, 2.219291, 1, 0, 0, 1, 1,
0.5208226, 1.604474, -1.072094, 1, 0, 0, 1, 1,
0.5231988, -1.506508, 1.89132, 1, 0, 0, 1, 1,
0.5254605, 0.01635932, 0.161988, 1, 0, 0, 1, 1,
0.5287215, -0.4109685, 1.72045, 0, 0, 0, 1, 1,
0.5364174, -1.440859, -0.03468865, 0, 0, 0, 1, 1,
0.5436932, 0.3143783, 0.1199378, 0, 0, 0, 1, 1,
0.5520087, -1.358809, 2.27312, 0, 0, 0, 1, 1,
0.55221, 0.8989996, 1.612112, 0, 0, 0, 1, 1,
0.5554402, 0.4863971, 0.7786539, 0, 0, 0, 1, 1,
0.5575821, 0.6498508, 0.59699, 0, 0, 0, 1, 1,
0.5618836, 0.4755543, 0.2458497, 1, 1, 1, 1, 1,
0.5618847, -0.4406914, 4.50406, 1, 1, 1, 1, 1,
0.5658908, -1.076661, 2.728515, 1, 1, 1, 1, 1,
0.5672201, 0.4879577, -0.1305597, 1, 1, 1, 1, 1,
0.5695049, -0.8309837, 1.954124, 1, 1, 1, 1, 1,
0.5738931, -1.333608, 3.477698, 1, 1, 1, 1, 1,
0.5740442, -0.3957962, 1.211715, 1, 1, 1, 1, 1,
0.5753354, -0.2800116, 1.616231, 1, 1, 1, 1, 1,
0.5779418, 1.274284, 1.22252, 1, 1, 1, 1, 1,
0.5812737, -1.187445, 2.525533, 1, 1, 1, 1, 1,
0.5818026, -1.023792, 0.9851631, 1, 1, 1, 1, 1,
0.5818028, 0.7464678, 1.333351, 1, 1, 1, 1, 1,
0.5827893, 2.042344, 0.2872704, 1, 1, 1, 1, 1,
0.5836007, -0.2534099, 0.5551191, 1, 1, 1, 1, 1,
0.5859841, -0.2805177, 2.110993, 1, 1, 1, 1, 1,
0.5890165, -0.516902, 2.416493, 0, 0, 1, 1, 1,
0.589098, 1.279077, 0.4462887, 1, 0, 0, 1, 1,
0.5903077, -1.630841, 3.465597, 1, 0, 0, 1, 1,
0.5913039, -1.508443, 2.92836, 1, 0, 0, 1, 1,
0.5914878, -0.388717, 2.639439, 1, 0, 0, 1, 1,
0.5933633, 0.5938467, 2.829911, 1, 0, 0, 1, 1,
0.5948772, -0.5202742, 1.27035, 0, 0, 0, 1, 1,
0.5968516, -0.5042924, 2.342067, 0, 0, 0, 1, 1,
0.5968801, 0.04529528, 0.3916852, 0, 0, 0, 1, 1,
0.5982698, 1.474187, -1.319198, 0, 0, 0, 1, 1,
0.5984691, 0.9709783, 1.94517, 0, 0, 0, 1, 1,
0.6109146, -0.2571317, 2.887808, 0, 0, 0, 1, 1,
0.6120718, 1.1393, -0.1376267, 0, 0, 0, 1, 1,
0.6137831, -0.5695227, 3.216566, 1, 1, 1, 1, 1,
0.6205234, -0.8072278, 1.146651, 1, 1, 1, 1, 1,
0.6213533, -0.3071742, 2.911321, 1, 1, 1, 1, 1,
0.6228931, 3.041637, 1.766316, 1, 1, 1, 1, 1,
0.6298308, 0.2657245, 0.1229076, 1, 1, 1, 1, 1,
0.6303317, -0.949976, 0.390788, 1, 1, 1, 1, 1,
0.6334866, 0.08678929, 2.00968, 1, 1, 1, 1, 1,
0.6348943, -0.7762735, 3.701123, 1, 1, 1, 1, 1,
0.6498896, 0.2585799, 1.597604, 1, 1, 1, 1, 1,
0.6513133, -1.988662, 2.776428, 1, 1, 1, 1, 1,
0.651751, 1.865904, 0.4503863, 1, 1, 1, 1, 1,
0.6527271, 1.50928, 0.6965362, 1, 1, 1, 1, 1,
0.6570848, 0.1184864, 3.650666, 1, 1, 1, 1, 1,
0.6612632, -1.287601, 2.37683, 1, 1, 1, 1, 1,
0.6706846, 1.834809, -2.444148, 1, 1, 1, 1, 1,
0.6710402, 1.63341, 0.9682037, 0, 0, 1, 1, 1,
0.6763008, -0.5099218, 1.739555, 1, 0, 0, 1, 1,
0.6804597, 1.949477, -1.32744, 1, 0, 0, 1, 1,
0.6804982, -1.810503, 2.273659, 1, 0, 0, 1, 1,
0.6812891, 0.3653848, -0.418491, 1, 0, 0, 1, 1,
0.6861644, 0.2676176, 2.052224, 1, 0, 0, 1, 1,
0.6866895, -0.4153833, 2.798813, 0, 0, 0, 1, 1,
0.687077, -0.3658329, 2.021726, 0, 0, 0, 1, 1,
0.6951094, 0.8022891, 0.6281523, 0, 0, 0, 1, 1,
0.7065132, 0.7092718, 1.049778, 0, 0, 0, 1, 1,
0.7100385, 2.010859, 1.693693, 0, 0, 0, 1, 1,
0.7106941, 0.09545553, 1.051423, 0, 0, 0, 1, 1,
0.71826, 0.02926921, 1.735937, 0, 0, 0, 1, 1,
0.7207719, 0.1658371, 1.259434, 1, 1, 1, 1, 1,
0.7208536, 0.3381093, 0.9070048, 1, 1, 1, 1, 1,
0.7215644, -0.4229639, 1.293503, 1, 1, 1, 1, 1,
0.7383906, 0.7901407, 1.789835, 1, 1, 1, 1, 1,
0.7447, -0.5268874, 4.157429, 1, 1, 1, 1, 1,
0.7457397, 0.200242, 2.280778, 1, 1, 1, 1, 1,
0.7494326, 0.3079145, 0.1069527, 1, 1, 1, 1, 1,
0.7495469, -0.06430234, 1.945819, 1, 1, 1, 1, 1,
0.7576621, -0.6015818, 1.366907, 1, 1, 1, 1, 1,
0.7632638, 0.5750769, 2.284701, 1, 1, 1, 1, 1,
0.7642907, 0.4399647, 2.340541, 1, 1, 1, 1, 1,
0.7713748, -0.9221741, 3.751136, 1, 1, 1, 1, 1,
0.7769193, -0.4931029, 1.602755, 1, 1, 1, 1, 1,
0.778016, 1.302691, 0.0689122, 1, 1, 1, 1, 1,
0.7790494, 1.886961, 1.167516, 1, 1, 1, 1, 1,
0.7829688, 2.177932, 2.458874, 0, 0, 1, 1, 1,
0.7835708, 0.1745551, 2.75954, 1, 0, 0, 1, 1,
0.7845418, 1.107828, 1.433443, 1, 0, 0, 1, 1,
0.7851868, 1.443603, 1.288736, 1, 0, 0, 1, 1,
0.7876654, -1.691719, 2.267155, 1, 0, 0, 1, 1,
0.7891616, -1.621066, 2.609597, 1, 0, 0, 1, 1,
0.800271, -0.3690642, 2.784232, 0, 0, 0, 1, 1,
0.8010499, 0.03790191, 2.704097, 0, 0, 0, 1, 1,
0.8020755, -1.979395, 1.771762, 0, 0, 0, 1, 1,
0.8049682, 0.4559717, 1.89895, 0, 0, 0, 1, 1,
0.8093606, -0.3497548, 0.8233195, 0, 0, 0, 1, 1,
0.8102975, -1.919799, 1.81832, 0, 0, 0, 1, 1,
0.8118158, 0.9219231, 2.008564, 0, 0, 0, 1, 1,
0.8162286, -0.8377763, 1.431012, 1, 1, 1, 1, 1,
0.8205788, -0.8418097, 2.924974, 1, 1, 1, 1, 1,
0.8304861, -0.8376045, 2.111067, 1, 1, 1, 1, 1,
0.8319775, -0.8544133, 2.206146, 1, 1, 1, 1, 1,
0.8356342, 0.441754, 1.231838, 1, 1, 1, 1, 1,
0.8484223, 0.3574998, 1.105685, 1, 1, 1, 1, 1,
0.8525604, 0.7049914, 0.5170855, 1, 1, 1, 1, 1,
0.8535312, -0.7561103, 2.019185, 1, 1, 1, 1, 1,
0.8540025, -0.3776754, 2.120263, 1, 1, 1, 1, 1,
0.8544601, 0.3427666, 1.100953, 1, 1, 1, 1, 1,
0.8564876, -0.5334841, 2.129441, 1, 1, 1, 1, 1,
0.859157, -0.7035673, 2.161713, 1, 1, 1, 1, 1,
0.8592627, -0.06824019, 2.193262, 1, 1, 1, 1, 1,
0.8679887, 0.4759419, 1.11903, 1, 1, 1, 1, 1,
0.8692341, 0.1056448, 1.145516, 1, 1, 1, 1, 1,
0.8725834, -0.2226186, 3.372638, 0, 0, 1, 1, 1,
0.8741941, -0.5507622, 1.098483, 1, 0, 0, 1, 1,
0.8844119, 0.3747286, 1.59426, 1, 0, 0, 1, 1,
0.8915334, -0.8997161, 2.474952, 1, 0, 0, 1, 1,
0.8920113, 0.2378179, 1.999777, 1, 0, 0, 1, 1,
0.8964618, -0.1358827, 1.913525, 1, 0, 0, 1, 1,
0.8995529, 0.3377164, 0.4342124, 0, 0, 0, 1, 1,
0.9033321, 0.67952, 1.763507, 0, 0, 0, 1, 1,
0.9127278, -1.422241, 4.119423, 0, 0, 0, 1, 1,
0.9154558, 0.4282654, 1.665513, 0, 0, 0, 1, 1,
0.9161419, 0.4655334, 1.556458, 0, 0, 0, 1, 1,
0.9163432, 1.247565, 1.063568, 0, 0, 0, 1, 1,
0.9192237, -1.779763, 2.383508, 0, 0, 0, 1, 1,
0.9314835, 0.7818109, 2.00439, 1, 1, 1, 1, 1,
0.9345751, 0.4696428, 1.120231, 1, 1, 1, 1, 1,
0.9422474, -0.08573914, 0.2409258, 1, 1, 1, 1, 1,
0.9527504, 1.30091, 1.661613, 1, 1, 1, 1, 1,
0.9553915, 0.0762564, 1.268292, 1, 1, 1, 1, 1,
0.9586819, 2.323273, 0.6085023, 1, 1, 1, 1, 1,
0.9601976, -0.1016473, 1.895535, 1, 1, 1, 1, 1,
0.9628211, -0.5055087, 0.8055004, 1, 1, 1, 1, 1,
0.9641336, -0.2725898, 1.467994, 1, 1, 1, 1, 1,
0.9651995, 0.7377458, 0.7119626, 1, 1, 1, 1, 1,
0.9727742, -0.2117018, 0.4972793, 1, 1, 1, 1, 1,
0.9730309, -0.7849151, 2.987109, 1, 1, 1, 1, 1,
0.9746684, -1.722526, 1.894206, 1, 1, 1, 1, 1,
0.9845403, 0.01106499, 0.2579949, 1, 1, 1, 1, 1,
0.9846968, 3.499329, 1.395121, 1, 1, 1, 1, 1,
0.9910484, 1.173885, 2.582424, 0, 0, 1, 1, 1,
0.9925212, -0.6439043, 1.577847, 1, 0, 0, 1, 1,
0.9928944, -0.6978028, 2.024099, 1, 0, 0, 1, 1,
0.9946451, 0.7278236, 1.62139, 1, 0, 0, 1, 1,
0.9967175, 0.9413287, 1.173026, 1, 0, 0, 1, 1,
1.004127, 1.914073, -0.2111706, 1, 0, 0, 1, 1,
1.004175, 0.9070911, 0.6637079, 0, 0, 0, 1, 1,
1.014902, -1.764837, 1.94301, 0, 0, 0, 1, 1,
1.019685, 0.1362057, 1.114421, 0, 0, 0, 1, 1,
1.023966, 0.8423389, -0.1984036, 0, 0, 0, 1, 1,
1.025852, 0.2309325, 0.6843227, 0, 0, 0, 1, 1,
1.026803, -0.9648913, 3.284447, 0, 0, 0, 1, 1,
1.032011, -0.6974888, 3.061684, 0, 0, 0, 1, 1,
1.035438, 0.1456907, 1.640604, 1, 1, 1, 1, 1,
1.04167, 0.4094971, 1.66645, 1, 1, 1, 1, 1,
1.045481, 0.219587, -0.9724925, 1, 1, 1, 1, 1,
1.049125, 1.471383, -0.06220209, 1, 1, 1, 1, 1,
1.050041, 0.4690175, 1.215436, 1, 1, 1, 1, 1,
1.051459, 0.2654909, -0.8361186, 1, 1, 1, 1, 1,
1.053189, 0.8272475, 0.700744, 1, 1, 1, 1, 1,
1.053548, -1.187522, 3.733435, 1, 1, 1, 1, 1,
1.057131, 1.177398, -0.2133907, 1, 1, 1, 1, 1,
1.057883, -0.5588352, 1.360493, 1, 1, 1, 1, 1,
1.067574, 0.2047345, 0.7242856, 1, 1, 1, 1, 1,
1.07384, 1.272708, -2.18396, 1, 1, 1, 1, 1,
1.091988, 0.2158196, 0.1526523, 1, 1, 1, 1, 1,
1.09966, 1.667319, -2.070884, 1, 1, 1, 1, 1,
1.103682, 1.108801, 0.6973786, 1, 1, 1, 1, 1,
1.10622, -2.25905, 3.173212, 0, 0, 1, 1, 1,
1.113543, 0.5035464, 1.760581, 1, 0, 0, 1, 1,
1.114578, -0.6004021, 3.995373, 1, 0, 0, 1, 1,
1.120729, -0.309652, 0.9755933, 1, 0, 0, 1, 1,
1.123992, -1.566326, 1.017784, 1, 0, 0, 1, 1,
1.124113, 1.764457, 1.028787, 1, 0, 0, 1, 1,
1.133425, -1.88023, 1.761047, 0, 0, 0, 1, 1,
1.140334, 0.3057525, -0.4506103, 0, 0, 0, 1, 1,
1.144027, 0.583173, 1.338707, 0, 0, 0, 1, 1,
1.163775, 0.0001565539, 1.388277, 0, 0, 0, 1, 1,
1.177349, 0.5363739, 1.35971, 0, 0, 0, 1, 1,
1.179944, -0.7105266, 1.835181, 0, 0, 0, 1, 1,
1.191329, -1.264104, 3.059597, 0, 0, 0, 1, 1,
1.19894, -0.6299903, 1.664596, 1, 1, 1, 1, 1,
1.202713, 0.3467503, 2.19983, 1, 1, 1, 1, 1,
1.20833, 1.664862, 1.63687, 1, 1, 1, 1, 1,
1.208647, -0.5986952, 1.068882, 1, 1, 1, 1, 1,
1.210324, 0.3460685, -0.5575265, 1, 1, 1, 1, 1,
1.218133, 0.7604496, 3.354173, 1, 1, 1, 1, 1,
1.219296, -0.223454, 2.342718, 1, 1, 1, 1, 1,
1.221881, 0.8635349, 1.292822, 1, 1, 1, 1, 1,
1.230387, 0.9758025, 0.6625992, 1, 1, 1, 1, 1,
1.231356, -1.349439, 3.674067, 1, 1, 1, 1, 1,
1.231961, -0.3470596, 1.505111, 1, 1, 1, 1, 1,
1.233275, 0.6138764, 2.191318, 1, 1, 1, 1, 1,
1.238761, 1.076029, -0.9249259, 1, 1, 1, 1, 1,
1.239249, -0.03171967, 0.1623194, 1, 1, 1, 1, 1,
1.240859, -2.19359, 2.461653, 1, 1, 1, 1, 1,
1.253521, -0.03813037, 1.586431, 0, 0, 1, 1, 1,
1.254037, -1.720507, 1.45018, 1, 0, 0, 1, 1,
1.254133, 1.915625, 0.7457024, 1, 0, 0, 1, 1,
1.254613, -0.04979115, 0.3931723, 1, 0, 0, 1, 1,
1.261514, -0.1984241, 0.1780352, 1, 0, 0, 1, 1,
1.26783, -0.2656331, 0.6866482, 1, 0, 0, 1, 1,
1.274168, -0.6297333, 0.4160276, 0, 0, 0, 1, 1,
1.276523, -0.8221778, 0.8886129, 0, 0, 0, 1, 1,
1.277972, 0.9224982, -0.812681, 0, 0, 0, 1, 1,
1.283671, -0.3806506, 2.726317, 0, 0, 0, 1, 1,
1.285458, 0.4137029, -0.2815577, 0, 0, 0, 1, 1,
1.301128, -0.9127674, 1.300936, 0, 0, 0, 1, 1,
1.302879, 1.661705, 0.0004373094, 0, 0, 0, 1, 1,
1.308428, 0.9482206, 0.3549274, 1, 1, 1, 1, 1,
1.317496, -0.6784465, 1.904471, 1, 1, 1, 1, 1,
1.334451, 0.2652441, 0.9057101, 1, 1, 1, 1, 1,
1.34108, 0.2517701, 1.562821, 1, 1, 1, 1, 1,
1.341309, 1.38767, 1.095371, 1, 1, 1, 1, 1,
1.342916, -0.09367996, 1.640754, 1, 1, 1, 1, 1,
1.373301, -1.213914, 3.082072, 1, 1, 1, 1, 1,
1.385345, 0.7652397, 1.02566, 1, 1, 1, 1, 1,
1.39423, -0.7756426, 0.7593086, 1, 1, 1, 1, 1,
1.402146, -1.585831, 1.360117, 1, 1, 1, 1, 1,
1.402875, 0.8011505, 2.281994, 1, 1, 1, 1, 1,
1.404904, -1.275363, 2.206079, 1, 1, 1, 1, 1,
1.414598, 0.084639, 2.078554, 1, 1, 1, 1, 1,
1.423067, 0.966068, 2.461872, 1, 1, 1, 1, 1,
1.423357, 0.9538187, -0.811506, 1, 1, 1, 1, 1,
1.438814, 0.7417401, -0.1025986, 0, 0, 1, 1, 1,
1.456292, -1.774693, 0.702712, 1, 0, 0, 1, 1,
1.459401, -1.393546, 2.67332, 1, 0, 0, 1, 1,
1.469982, 0.4982596, 0.6459607, 1, 0, 0, 1, 1,
1.472143, -2.148421, 2.87242, 1, 0, 0, 1, 1,
1.475718, 0.5551711, 1.118515, 1, 0, 0, 1, 1,
1.482929, -0.2184293, 2.389081, 0, 0, 0, 1, 1,
1.487448, -1.068061, 2.866154, 0, 0, 0, 1, 1,
1.490671, -0.1153403, 2.207211, 0, 0, 0, 1, 1,
1.495708, -0.5811534, 3.039531, 0, 0, 0, 1, 1,
1.510368, -0.5921671, 0.216377, 0, 0, 0, 1, 1,
1.514608, 1.731554, 2.939074, 0, 0, 0, 1, 1,
1.516797, -0.9337023, 1.685509, 0, 0, 0, 1, 1,
1.530464, 0.8978235, 2.600667, 1, 1, 1, 1, 1,
1.546344, 1.061294, 0.8349517, 1, 1, 1, 1, 1,
1.546709, -0.4377311, 0.0934988, 1, 1, 1, 1, 1,
1.548568, -0.03960696, 0.4783501, 1, 1, 1, 1, 1,
1.557736, -0.7672874, 1.677734, 1, 1, 1, 1, 1,
1.558093, 2.35206, 0.3474639, 1, 1, 1, 1, 1,
1.562019, 0.4290759, 0.9968387, 1, 1, 1, 1, 1,
1.577034, -0.4928025, 2.527465, 1, 1, 1, 1, 1,
1.579044, 0.812175, 2.897644, 1, 1, 1, 1, 1,
1.585393, -1.719569, 2.701676, 1, 1, 1, 1, 1,
1.609887, 1.247106, 2.98734, 1, 1, 1, 1, 1,
1.616822, 1.565466, -1.071378, 1, 1, 1, 1, 1,
1.631715, 0.03621262, 1.882745, 1, 1, 1, 1, 1,
1.652081, -1.571139, 1.723505, 1, 1, 1, 1, 1,
1.663942, -0.2091942, 3.613218, 1, 1, 1, 1, 1,
1.670603, -1.822971, 2.327703, 0, 0, 1, 1, 1,
1.682765, -0.758873, 1.556115, 1, 0, 0, 1, 1,
1.684613, 0.5923864, 0.5557845, 1, 0, 0, 1, 1,
1.686678, -1.645854, 2.742984, 1, 0, 0, 1, 1,
1.702051, -0.9018213, 2.092465, 1, 0, 0, 1, 1,
1.712423, -0.5999445, 1.867853, 1, 0, 0, 1, 1,
1.716382, -0.8565537, 1.720222, 0, 0, 0, 1, 1,
1.728276, -1.342266, 0.05269956, 0, 0, 0, 1, 1,
1.735074, 0.3252591, 3.41719, 0, 0, 0, 1, 1,
1.746265, 1.188684, -0.5223694, 0, 0, 0, 1, 1,
1.775996, 0.2270788, 0.7266946, 0, 0, 0, 1, 1,
1.786131, -0.5456003, 1.313631, 0, 0, 0, 1, 1,
1.797397, 1.476298, -0.2105612, 0, 0, 0, 1, 1,
1.80933, 0.9785353, 0.5301846, 1, 1, 1, 1, 1,
1.821922, -0.5506557, 2.079834, 1, 1, 1, 1, 1,
1.829886, -0.02123596, 2.860616, 1, 1, 1, 1, 1,
1.836723, 2.291466, 1.211324, 1, 1, 1, 1, 1,
1.861616, 1.622851, 0.2664935, 1, 1, 1, 1, 1,
1.879792, -0.7723441, 2.363541, 1, 1, 1, 1, 1,
1.900496, -0.1471674, 0.8565171, 1, 1, 1, 1, 1,
1.925654, -0.763402, 2.158644, 1, 1, 1, 1, 1,
1.943057, -0.5397131, 3.899734, 1, 1, 1, 1, 1,
1.950492, 1.103226, 1.303052, 1, 1, 1, 1, 1,
1.983305, 0.02510305, 2.736641, 1, 1, 1, 1, 1,
2.012049, 0.4138154, 1.972103, 1, 1, 1, 1, 1,
2.037055, -1.199444, 3.018651, 1, 1, 1, 1, 1,
2.041607, -1.152956, 3.22051, 1, 1, 1, 1, 1,
2.059747, 1.096074, 1.707196, 1, 1, 1, 1, 1,
2.061224, 0.1691037, 1.808245, 0, 0, 1, 1, 1,
2.097291, -0.5545322, 3.323336, 1, 0, 0, 1, 1,
2.116786, 1.05586, 1.714171, 1, 0, 0, 1, 1,
2.127573, -0.3818418, 2.876486, 1, 0, 0, 1, 1,
2.134912, -0.8039903, 1.906451, 1, 0, 0, 1, 1,
2.136311, -1.494263, 2.443172, 1, 0, 0, 1, 1,
2.153267, -1.451473, 2.47665, 0, 0, 0, 1, 1,
2.189895, 0.2311244, 0.7914006, 0, 0, 0, 1, 1,
2.232458, 1.014276, -0.933828, 0, 0, 0, 1, 1,
2.301028, -1.019773, 2.470438, 0, 0, 0, 1, 1,
2.305313, -0.4608419, 0.5754629, 0, 0, 0, 1, 1,
2.352168, -0.3615725, 0.02805382, 0, 0, 0, 1, 1,
2.522147, -0.4502851, 2.377405, 0, 0, 0, 1, 1,
2.584921, -3.022827, 1.806593, 1, 1, 1, 1, 1,
2.594277, -0.255584, 1.340777, 1, 1, 1, 1, 1,
2.599893, 0.6252483, 2.599889, 1, 1, 1, 1, 1,
2.632182, 0.3408464, 1.223728, 1, 1, 1, 1, 1,
2.692786, 1.682839, 1.324702, 1, 1, 1, 1, 1,
2.795729, -1.500696, 1.750722, 1, 1, 1, 1, 1,
2.931737, 0.7851567, 0.8608412, 1, 1, 1, 1, 1
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
var radius = 9.842212;
var distance = 34.57035;
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
mvMatrix.translate( 0.2140934, 0.2340629, 0.2742288 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57035);
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
