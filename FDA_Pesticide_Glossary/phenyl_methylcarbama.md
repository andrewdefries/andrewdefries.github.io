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
-2.966191, 0.7321221, -1.722757, 1, 0, 0, 1,
-2.598122, -0.9699833, -2.328983, 1, 0.007843138, 0, 1,
-2.502862, 0.940087, -2.514771, 1, 0.01176471, 0, 1,
-2.377953, -1.668584, -2.425815, 1, 0.01960784, 0, 1,
-2.340542, -0.9515824, -2.167144, 1, 0.02352941, 0, 1,
-2.261781, 1.922081, -1.024778, 1, 0.03137255, 0, 1,
-2.245986, -1.144708, -1.370493, 1, 0.03529412, 0, 1,
-2.169312, -0.3679067, -1.921633, 1, 0.04313726, 0, 1,
-2.159271, -0.9842477, -2.425145, 1, 0.04705882, 0, 1,
-2.151083, 2.083817, -1.930179, 1, 0.05490196, 0, 1,
-2.145718, -0.09002447, -1.704888, 1, 0.05882353, 0, 1,
-2.136677, 0.3045218, -0.4030314, 1, 0.06666667, 0, 1,
-2.125887, -1.581027, -2.652123, 1, 0.07058824, 0, 1,
-2.079943, -1.647983, -1.97339, 1, 0.07843138, 0, 1,
-2.072676, -0.465453, -2.140031, 1, 0.08235294, 0, 1,
-2.042542, 0.07937367, -2.107497, 1, 0.09019608, 0, 1,
-2.022735, 0.04117891, -2.372159, 1, 0.09411765, 0, 1,
-2.002959, 0.6899468, -3.006038, 1, 0.1019608, 0, 1,
-1.962205, -0.3622674, -2.339353, 1, 0.1098039, 0, 1,
-1.93598, -0.5900944, -1.703004, 1, 0.1137255, 0, 1,
-1.914072, 0.2837965, -0.02138532, 1, 0.1215686, 0, 1,
-1.906984, 0.8648024, -0.9095243, 1, 0.1254902, 0, 1,
-1.905656, -0.7579936, -3.289639, 1, 0.1333333, 0, 1,
-1.888142, 1.771289, 0.4701999, 1, 0.1372549, 0, 1,
-1.877616, 0.08960377, -0.9722409, 1, 0.145098, 0, 1,
-1.864837, -0.5011928, -1.187358, 1, 0.1490196, 0, 1,
-1.857082, 0.3081459, -3.155381, 1, 0.1568628, 0, 1,
-1.855229, -0.9622928, -4.707521, 1, 0.1607843, 0, 1,
-1.85456, 2.313567, 0.9201678, 1, 0.1686275, 0, 1,
-1.843105, 0.651174, -1.951281, 1, 0.172549, 0, 1,
-1.839823, -0.8459714, -3.079934, 1, 0.1803922, 0, 1,
-1.799181, -1.524577, -3.123286, 1, 0.1843137, 0, 1,
-1.790554, -0.6310802, 0.2476119, 1, 0.1921569, 0, 1,
-1.78671, 0.04035173, -2.168012, 1, 0.1960784, 0, 1,
-1.779244, 0.4863185, -3.653544, 1, 0.2039216, 0, 1,
-1.752043, -0.07669335, -3.228008, 1, 0.2117647, 0, 1,
-1.749308, 0.8035281, -1.007761, 1, 0.2156863, 0, 1,
-1.749048, 1.463601, -1.141328, 1, 0.2235294, 0, 1,
-1.749014, -0.3495628, -1.941353, 1, 0.227451, 0, 1,
-1.744044, -0.8049772, -1.353357, 1, 0.2352941, 0, 1,
-1.731391, -0.04751014, -1.508976, 1, 0.2392157, 0, 1,
-1.730423, -0.2830234, -0.8141122, 1, 0.2470588, 0, 1,
-1.728161, -1.267931, -3.090398, 1, 0.2509804, 0, 1,
-1.716186, -1.607412, -2.368967, 1, 0.2588235, 0, 1,
-1.702485, 1.18125, -2.491046, 1, 0.2627451, 0, 1,
-1.683755, 1.502137, -1.031662, 1, 0.2705882, 0, 1,
-1.672329, 1.347405, -1.858501, 1, 0.2745098, 0, 1,
-1.649097, 0.6249191, -1.467889, 1, 0.282353, 0, 1,
-1.642635, 0.5801551, 0.382503, 1, 0.2862745, 0, 1,
-1.641384, 1.442171, -0.3819153, 1, 0.2941177, 0, 1,
-1.641252, 0.3596383, -0.1851322, 1, 0.3019608, 0, 1,
-1.639761, -0.4201869, -2.00316, 1, 0.3058824, 0, 1,
-1.636338, -0.09601276, -1.50241, 1, 0.3137255, 0, 1,
-1.616374, -1.140536, -2.327161, 1, 0.3176471, 0, 1,
-1.611245, 1.012288, -1.144376, 1, 0.3254902, 0, 1,
-1.605816, 0.1258023, -2.223078, 1, 0.3294118, 0, 1,
-1.598718, -0.5437293, -1.652569, 1, 0.3372549, 0, 1,
-1.589983, 0.3245723, -0.5274412, 1, 0.3411765, 0, 1,
-1.586979, -0.05421434, -1.163968, 1, 0.3490196, 0, 1,
-1.584625, -0.828889, -1.460138, 1, 0.3529412, 0, 1,
-1.584553, -0.8156416, -2.383928, 1, 0.3607843, 0, 1,
-1.56937, 0.6464174, -0.5059831, 1, 0.3647059, 0, 1,
-1.565818, -1.150027, 0.03790627, 1, 0.372549, 0, 1,
-1.557715, 0.382355, -4.058329, 1, 0.3764706, 0, 1,
-1.54781, -0.8083012, -2.196677, 1, 0.3843137, 0, 1,
-1.523629, 0.09518116, -0.6097824, 1, 0.3882353, 0, 1,
-1.519876, 0.822672, -0.9099352, 1, 0.3960784, 0, 1,
-1.518086, 2.579084, -1.099787, 1, 0.4039216, 0, 1,
-1.515891, 0.5345231, -2.657483, 1, 0.4078431, 0, 1,
-1.514392, -1.301005, -3.677823, 1, 0.4156863, 0, 1,
-1.503307, -0.2060859, -1.475971, 1, 0.4196078, 0, 1,
-1.48995, -0.500657, -2.335585, 1, 0.427451, 0, 1,
-1.488456, -0.2731352, -2.075314, 1, 0.4313726, 0, 1,
-1.470187, -0.7650687, -3.086853, 1, 0.4392157, 0, 1,
-1.464636, 0.1945836, -3.305459, 1, 0.4431373, 0, 1,
-1.430769, 2.225587, -3.069621, 1, 0.4509804, 0, 1,
-1.426948, 0.714305, -1.94096, 1, 0.454902, 0, 1,
-1.424328, -1.626212, -1.736142, 1, 0.4627451, 0, 1,
-1.42152, -0.8776156, -3.211319, 1, 0.4666667, 0, 1,
-1.411988, 0.8163878, -0.2918892, 1, 0.4745098, 0, 1,
-1.402797, -0.0828471, -0.3654054, 1, 0.4784314, 0, 1,
-1.399866, 0.1177395, -2.761422, 1, 0.4862745, 0, 1,
-1.38756, -2.43274, -2.904545, 1, 0.4901961, 0, 1,
-1.369259, 0.3585743, -2.423435, 1, 0.4980392, 0, 1,
-1.360807, 0.4897705, 0.1345246, 1, 0.5058824, 0, 1,
-1.360757, 0.4393428, -1.02022, 1, 0.509804, 0, 1,
-1.357535, 0.3212748, -0.897354, 1, 0.5176471, 0, 1,
-1.356909, -0.3786897, -1.987782, 1, 0.5215687, 0, 1,
-1.348528, 0.5001076, -0.7982672, 1, 0.5294118, 0, 1,
-1.343441, -1.064948, -1.642078, 1, 0.5333334, 0, 1,
-1.342397, -0.298449, -0.707634, 1, 0.5411765, 0, 1,
-1.338696, -0.6017013, -0.8909416, 1, 0.5450981, 0, 1,
-1.33544, 0.2407811, -1.969824, 1, 0.5529412, 0, 1,
-1.329058, -0.7620632, -3.773002, 1, 0.5568628, 0, 1,
-1.321582, 0.5751772, -0.5361313, 1, 0.5647059, 0, 1,
-1.309453, -0.1769128, -2.731264, 1, 0.5686275, 0, 1,
-1.303683, -0.3255362, -1.697216, 1, 0.5764706, 0, 1,
-1.301203, 0.1987039, -1.784705, 1, 0.5803922, 0, 1,
-1.298542, 0.6535926, -0.3684846, 1, 0.5882353, 0, 1,
-1.296914, 0.06637887, -1.26281, 1, 0.5921569, 0, 1,
-1.280329, 0.3761665, -0.2517946, 1, 0.6, 0, 1,
-1.270246, 0.5606207, -1.097252, 1, 0.6078432, 0, 1,
-1.268732, 0.4783297, -0.2558944, 1, 0.6117647, 0, 1,
-1.262355, -0.01068961, -1.936347, 1, 0.6196079, 0, 1,
-1.256478, 1.935561, 0.9634871, 1, 0.6235294, 0, 1,
-1.253329, 0.8668395, -3.086319, 1, 0.6313726, 0, 1,
-1.25083, 0.6319711, -1.489538, 1, 0.6352941, 0, 1,
-1.248222, -1.780336, -2.98535, 1, 0.6431373, 0, 1,
-1.24407, -1.877427, -1.847175, 1, 0.6470588, 0, 1,
-1.243413, 1.289051, -2.288882, 1, 0.654902, 0, 1,
-1.237751, -1.957348, -1.422252, 1, 0.6588235, 0, 1,
-1.235805, 0.1390219, 0.6285989, 1, 0.6666667, 0, 1,
-1.232738, 0.786054, -1.569874, 1, 0.6705883, 0, 1,
-1.225481, -0.7624611, -2.16919, 1, 0.6784314, 0, 1,
-1.222316, 0.7597072, 0.6017289, 1, 0.682353, 0, 1,
-1.218788, -0.5379101, -3.49756, 1, 0.6901961, 0, 1,
-1.215283, -1.615736, -2.001301, 1, 0.6941177, 0, 1,
-1.214519, -0.3187265, -2.42712, 1, 0.7019608, 0, 1,
-1.212475, -1.815547, -4.345814, 1, 0.7098039, 0, 1,
-1.205986, -1.246982, -2.601073, 1, 0.7137255, 0, 1,
-1.204357, -0.4383354, -1.163393, 1, 0.7215686, 0, 1,
-1.201266, 0.6582133, -1.354911, 1, 0.7254902, 0, 1,
-1.199512, -0.3244097, -1.841388, 1, 0.7333333, 0, 1,
-1.194777, 0.6649983, -0.4709087, 1, 0.7372549, 0, 1,
-1.19318, 0.7461487, 0.5944813, 1, 0.7450981, 0, 1,
-1.189694, -0.3259588, -2.159429, 1, 0.7490196, 0, 1,
-1.189465, 1.939934, -0.323402, 1, 0.7568628, 0, 1,
-1.18383, -3.002241, -2.511026, 1, 0.7607843, 0, 1,
-1.176928, -0.9003239, -2.421015, 1, 0.7686275, 0, 1,
-1.166461, -0.8622199, -2.510247, 1, 0.772549, 0, 1,
-1.156846, 1.011112, 0.3227837, 1, 0.7803922, 0, 1,
-1.152782, -1.489285, -3.072173, 1, 0.7843137, 0, 1,
-1.144032, -1.409302, -0.9937463, 1, 0.7921569, 0, 1,
-1.141289, 0.4271156, -1.64395, 1, 0.7960784, 0, 1,
-1.128104, -0.01719913, -0.8938434, 1, 0.8039216, 0, 1,
-1.120294, 0.3761629, 0.3238578, 1, 0.8117647, 0, 1,
-1.11848, -0.1345846, -2.762003, 1, 0.8156863, 0, 1,
-1.110313, 0.3897325, -0.6564766, 1, 0.8235294, 0, 1,
-1.108938, 1.197296, -0.2498782, 1, 0.827451, 0, 1,
-1.1086, -0.2414329, -2.299526, 1, 0.8352941, 0, 1,
-1.105443, -2.83016, -2.611692, 1, 0.8392157, 0, 1,
-1.104478, 0.4181023, -1.389904, 1, 0.8470588, 0, 1,
-1.097542, 1.920126, -1.234908, 1, 0.8509804, 0, 1,
-1.092576, -0.1398615, -2.230764, 1, 0.8588235, 0, 1,
-1.091681, -0.7918861, -1.495764, 1, 0.8627451, 0, 1,
-1.086058, 0.5947275, -2.202146, 1, 0.8705882, 0, 1,
-1.081587, 0.6833356, -2.712296, 1, 0.8745098, 0, 1,
-1.078995, 0.7923723, -0.5938339, 1, 0.8823529, 0, 1,
-1.077827, 1.699636, 0.02013635, 1, 0.8862745, 0, 1,
-1.074804, -0.1923286, -1.28829, 1, 0.8941177, 0, 1,
-1.061804, 2.216758, -0.2783822, 1, 0.8980392, 0, 1,
-1.061646, 0.05097378, -0.947643, 1, 0.9058824, 0, 1,
-1.057402, -1.882233, -2.261087, 1, 0.9137255, 0, 1,
-1.057376, -1.909838, -3.09565, 1, 0.9176471, 0, 1,
-1.057146, -0.7307272, -1.119178, 1, 0.9254902, 0, 1,
-1.054926, -0.5875424, -0.67644, 1, 0.9294118, 0, 1,
-1.042685, 0.7992936, -1.66535, 1, 0.9372549, 0, 1,
-1.0421, 1.026114, -1.948846, 1, 0.9411765, 0, 1,
-1.040111, 1.05298, 0.2093069, 1, 0.9490196, 0, 1,
-1.027418, 1.446247, -0.4845009, 1, 0.9529412, 0, 1,
-1.02668, -0.2480503, -2.27308, 1, 0.9607843, 0, 1,
-1.021548, -0.4900801, -1.997865, 1, 0.9647059, 0, 1,
-1.021068, 0.752516, 1.238556, 1, 0.972549, 0, 1,
-1.018264, -1.034449, -1.889763, 1, 0.9764706, 0, 1,
-1.006556, 0.1631064, -0.8827225, 1, 0.9843137, 0, 1,
-1.006437, 0.4803998, 0.1582186, 1, 0.9882353, 0, 1,
-1.000657, 2.219331, 0.4204215, 1, 0.9960784, 0, 1,
-0.9985243, -0.2631777, -2.101709, 0.9960784, 1, 0, 1,
-0.9960972, -0.52013, -2.348112, 0.9921569, 1, 0, 1,
-0.9912227, -0.1565206, -3.56321, 0.9843137, 1, 0, 1,
-0.9874144, -1.261958, -2.433184, 0.9803922, 1, 0, 1,
-0.9760863, 0.0466557, -1.80615, 0.972549, 1, 0, 1,
-0.9733512, -0.7712676, -3.918085, 0.9686275, 1, 0, 1,
-0.9711794, 0.0126571, -2.799631, 0.9607843, 1, 0, 1,
-0.9655094, 2.394997, -0.7405316, 0.9568627, 1, 0, 1,
-0.9604301, 0.06291442, -0.8543877, 0.9490196, 1, 0, 1,
-0.9555193, 0.008159383, -2.41946, 0.945098, 1, 0, 1,
-0.9546309, -1.278732, -2.191769, 0.9372549, 1, 0, 1,
-0.9533786, 1.31884, -0.715685, 0.9333333, 1, 0, 1,
-0.9462985, 0.2130604, -2.661638, 0.9254902, 1, 0, 1,
-0.942228, -2.133235, -3.851788, 0.9215686, 1, 0, 1,
-0.9410108, -0.307451, -0.9234047, 0.9137255, 1, 0, 1,
-0.9391517, 1.431597, 0.3770793, 0.9098039, 1, 0, 1,
-0.9361442, 0.9559255, -0.4927599, 0.9019608, 1, 0, 1,
-0.9345946, 2.219947, 0.6265666, 0.8941177, 1, 0, 1,
-0.932981, 1.582639, -0.04349706, 0.8901961, 1, 0, 1,
-0.92931, -2.241524, -3.273325, 0.8823529, 1, 0, 1,
-0.9246537, 0.491308, -1.772805, 0.8784314, 1, 0, 1,
-0.9202374, -0.0346182, -0.7525658, 0.8705882, 1, 0, 1,
-0.9201498, 1.189496, -0.6309146, 0.8666667, 1, 0, 1,
-0.9178264, -0.3315517, -1.565681, 0.8588235, 1, 0, 1,
-0.9129125, 0.6927662, -1.904491, 0.854902, 1, 0, 1,
-0.9054424, 0.892202, 0.2056526, 0.8470588, 1, 0, 1,
-0.9011132, -1.287486, -1.9801, 0.8431373, 1, 0, 1,
-0.8986279, -0.173266, -3.010073, 0.8352941, 1, 0, 1,
-0.8985633, -0.374626, -2.86233, 0.8313726, 1, 0, 1,
-0.8973232, 2.001925, 0.2941271, 0.8235294, 1, 0, 1,
-0.8964956, -0.1879024, -2.651865, 0.8196079, 1, 0, 1,
-0.8952138, -0.1617256, -1.510245, 0.8117647, 1, 0, 1,
-0.8902403, -0.8087603, -2.001674, 0.8078431, 1, 0, 1,
-0.8849153, -1.634838, -1.836019, 0.8, 1, 0, 1,
-0.8812076, 1.256733, -1.225547, 0.7921569, 1, 0, 1,
-0.8800451, -1.285387, -0.7699154, 0.7882353, 1, 0, 1,
-0.8668414, 0.8789392, -0.8209119, 0.7803922, 1, 0, 1,
-0.8545994, -1.481447, -2.051095, 0.7764706, 1, 0, 1,
-0.8479462, -0.8663433, -3.158881, 0.7686275, 1, 0, 1,
-0.8427303, -0.6144489, -1.604993, 0.7647059, 1, 0, 1,
-0.8395767, 0.6216424, -1.383188, 0.7568628, 1, 0, 1,
-0.8391601, -1.183366, -0.3094829, 0.7529412, 1, 0, 1,
-0.8330977, 0.5096753, -1.872259, 0.7450981, 1, 0, 1,
-0.8271927, -0.4707007, -2.760318, 0.7411765, 1, 0, 1,
-0.8245942, -0.2974063, -0.6533579, 0.7333333, 1, 0, 1,
-0.8231761, -0.2748876, -1.719367, 0.7294118, 1, 0, 1,
-0.8222101, -0.7869227, -3.457934, 0.7215686, 1, 0, 1,
-0.8155309, 2.391414, -0.6510609, 0.7176471, 1, 0, 1,
-0.8079607, -1.020162, -2.734596, 0.7098039, 1, 0, 1,
-0.8069735, -0.4776086, -1.540684, 0.7058824, 1, 0, 1,
-0.7969577, -1.048545, -1.35878, 0.6980392, 1, 0, 1,
-0.7931095, 1.180671, -0.008109499, 0.6901961, 1, 0, 1,
-0.7908493, -0.1618081, -1.235531, 0.6862745, 1, 0, 1,
-0.7904237, 1.960846, 0.5421884, 0.6784314, 1, 0, 1,
-0.7896408, 0.526545, -0.291366, 0.6745098, 1, 0, 1,
-0.7885255, 0.3554578, -2.180248, 0.6666667, 1, 0, 1,
-0.7837835, 2.185274, -0.1354783, 0.6627451, 1, 0, 1,
-0.7803882, 0.5344064, -1.220469, 0.654902, 1, 0, 1,
-0.780066, -1.375707, -2.565818, 0.6509804, 1, 0, 1,
-0.7774304, -0.5346934, -1.381327, 0.6431373, 1, 0, 1,
-0.762915, 0.8092319, 0.4340446, 0.6392157, 1, 0, 1,
-0.7541074, -1.148782, -2.4912, 0.6313726, 1, 0, 1,
-0.7507095, 0.7508191, -1.621526, 0.627451, 1, 0, 1,
-0.749158, -1.035196, -0.1575295, 0.6196079, 1, 0, 1,
-0.7459123, -0.5068473, -0.8907326, 0.6156863, 1, 0, 1,
-0.7420521, -0.374497, -1.465245, 0.6078432, 1, 0, 1,
-0.7413907, -1.464651, -2.472303, 0.6039216, 1, 0, 1,
-0.7334847, -1.555266, -2.502625, 0.5960785, 1, 0, 1,
-0.7317499, -0.7981617, -2.777838, 0.5882353, 1, 0, 1,
-0.7270666, -0.2864893, -1.697733, 0.5843138, 1, 0, 1,
-0.7232116, 0.02089763, -0.3226357, 0.5764706, 1, 0, 1,
-0.7224714, 2.238186, -0.7931071, 0.572549, 1, 0, 1,
-0.7208908, 0.550046, -1.328355, 0.5647059, 1, 0, 1,
-0.7112458, -0.5328603, -2.701266, 0.5607843, 1, 0, 1,
-0.707505, 0.6378783, -2.759576, 0.5529412, 1, 0, 1,
-0.7066744, -1.454692, -3.222264, 0.5490196, 1, 0, 1,
-0.6972474, -0.4188978, -2.273792, 0.5411765, 1, 0, 1,
-0.6959084, 1.012018, 0.5098162, 0.5372549, 1, 0, 1,
-0.6951909, -0.562463, -2.308947, 0.5294118, 1, 0, 1,
-0.6947643, 0.06721506, -2.501504, 0.5254902, 1, 0, 1,
-0.6903532, 0.4181232, -3.198103, 0.5176471, 1, 0, 1,
-0.6871723, 0.7131977, 0.3540289, 0.5137255, 1, 0, 1,
-0.6867666, -0.03839592, -0.9024628, 0.5058824, 1, 0, 1,
-0.6843247, -1.041993, -3.233183, 0.5019608, 1, 0, 1,
-0.6834717, 0.03705341, -1.566341, 0.4941176, 1, 0, 1,
-0.6741947, 1.57721, -0.04337621, 0.4862745, 1, 0, 1,
-0.6720866, -1.952364, -2.366509, 0.4823529, 1, 0, 1,
-0.6706716, 0.5937017, -0.6156964, 0.4745098, 1, 0, 1,
-0.6680667, 1.470724, 0.2997769, 0.4705882, 1, 0, 1,
-0.6655922, 1.297703, -0.5322827, 0.4627451, 1, 0, 1,
-0.6611317, -0.2367977, -1.744224, 0.4588235, 1, 0, 1,
-0.6583558, -1.084267, -2.300967, 0.4509804, 1, 0, 1,
-0.6576828, -0.9087942, -3.009353, 0.4470588, 1, 0, 1,
-0.6562309, -0.1867315, -1.990805, 0.4392157, 1, 0, 1,
-0.647214, -0.3187706, -1.702627, 0.4352941, 1, 0, 1,
-0.6449185, -1.900276, -3.907521, 0.427451, 1, 0, 1,
-0.6437643, -1.16706, -0.9639927, 0.4235294, 1, 0, 1,
-0.6404958, -1.108589, -2.139043, 0.4156863, 1, 0, 1,
-0.6393644, 1.122295, 0.9086363, 0.4117647, 1, 0, 1,
-0.6345038, -1.456577, -4.828808, 0.4039216, 1, 0, 1,
-0.6320715, -0.4297334, -1.358144, 0.3960784, 1, 0, 1,
-0.6278459, -0.874233, -2.015272, 0.3921569, 1, 0, 1,
-0.6276547, -0.8683088, -2.762408, 0.3843137, 1, 0, 1,
-0.624669, -1.072016, -1.127969, 0.3803922, 1, 0, 1,
-0.623276, -0.1959285, -2.215067, 0.372549, 1, 0, 1,
-0.6198063, -1.248284, -2.755363, 0.3686275, 1, 0, 1,
-0.617985, 1.14187, 0.006715683, 0.3607843, 1, 0, 1,
-0.6174566, -1.398535, -1.613292, 0.3568628, 1, 0, 1,
-0.6140083, -0.3938372, -2.123547, 0.3490196, 1, 0, 1,
-0.6117859, -1.83181, -1.848061, 0.345098, 1, 0, 1,
-0.6112088, 0.08744672, -2.885756, 0.3372549, 1, 0, 1,
-0.6102183, -0.9655437, -3.902049, 0.3333333, 1, 0, 1,
-0.6071594, 0.371062, -2.428303, 0.3254902, 1, 0, 1,
-0.6047067, 0.811993, -1.027081, 0.3215686, 1, 0, 1,
-0.6010457, -2.761158, -1.89959, 0.3137255, 1, 0, 1,
-0.5998952, -0.5943175, -2.770535, 0.3098039, 1, 0, 1,
-0.5990087, 0.5240999, -0.2843056, 0.3019608, 1, 0, 1,
-0.5981475, 1.217544, -0.6301482, 0.2941177, 1, 0, 1,
-0.5974876, -1.231221, -5.886424, 0.2901961, 1, 0, 1,
-0.5960648, -1.91094, -1.082136, 0.282353, 1, 0, 1,
-0.5938888, 0.6124828, -0.4233881, 0.2784314, 1, 0, 1,
-0.5922982, -1.532809, -1.776988, 0.2705882, 1, 0, 1,
-0.5894974, -0.06237518, -1.890365, 0.2666667, 1, 0, 1,
-0.5886111, 1.441441, -0.3250968, 0.2588235, 1, 0, 1,
-0.588093, 0.5330524, -0.8019597, 0.254902, 1, 0, 1,
-0.5880572, 0.210562, -0.6730869, 0.2470588, 1, 0, 1,
-0.583256, 0.8332821, 0.4741755, 0.2431373, 1, 0, 1,
-0.581822, -2.250153, -2.370952, 0.2352941, 1, 0, 1,
-0.5786367, 0.581457, 0.04205173, 0.2313726, 1, 0, 1,
-0.5730708, -0.2059257, -1.412569, 0.2235294, 1, 0, 1,
-0.5726793, 0.8170902, -0.2764177, 0.2196078, 1, 0, 1,
-0.5708545, -0.09794149, -1.439016, 0.2117647, 1, 0, 1,
-0.5672114, 0.8125653, 0.3301164, 0.2078431, 1, 0, 1,
-0.5649925, 1.071386, 1.375511, 0.2, 1, 0, 1,
-0.56464, 0.0282226, -0.7391358, 0.1921569, 1, 0, 1,
-0.5628854, -0.9261729, -2.246978, 0.1882353, 1, 0, 1,
-0.560194, -0.1199033, -3.161753, 0.1803922, 1, 0, 1,
-0.5583605, -0.9965034, -3.548126, 0.1764706, 1, 0, 1,
-0.5558156, -0.1407924, -0.4309929, 0.1686275, 1, 0, 1,
-0.5535861, -0.8851004, -4.042061, 0.1647059, 1, 0, 1,
-0.553079, 0.4030432, -0.8046408, 0.1568628, 1, 0, 1,
-0.5516039, 1.422171, 0.2491579, 0.1529412, 1, 0, 1,
-0.5469508, 1.29134, -1.238744, 0.145098, 1, 0, 1,
-0.5422146, -0.4598202, -1.52173, 0.1411765, 1, 0, 1,
-0.5393243, -0.6854545, -1.384026, 0.1333333, 1, 0, 1,
-0.5351715, -0.07736786, -2.121342, 0.1294118, 1, 0, 1,
-0.5346245, 0.1195399, -0.06567876, 0.1215686, 1, 0, 1,
-0.5303685, -0.4497154, -0.5617995, 0.1176471, 1, 0, 1,
-0.5274622, 0.9109172, -0.9001544, 0.1098039, 1, 0, 1,
-0.5256553, 0.8236281, -0.493148, 0.1058824, 1, 0, 1,
-0.5255237, -0.775723, -2.170988, 0.09803922, 1, 0, 1,
-0.5232158, 1.844495, 0.4763759, 0.09019608, 1, 0, 1,
-0.5185282, 1.291811, -1.459257, 0.08627451, 1, 0, 1,
-0.5143588, -0.4271856, -0.9080337, 0.07843138, 1, 0, 1,
-0.5136345, -0.4327294, -2.325416, 0.07450981, 1, 0, 1,
-0.5130715, 0.7202512, 0.03513113, 0.06666667, 1, 0, 1,
-0.5061269, 0.4929405, -1.109339, 0.0627451, 1, 0, 1,
-0.502257, 0.4905887, 0.06500003, 0.05490196, 1, 0, 1,
-0.5010838, 0.07027856, -0.7772682, 0.05098039, 1, 0, 1,
-0.5004821, 0.4841772, -1.162925, 0.04313726, 1, 0, 1,
-0.4992014, 0.05108982, -0.941327, 0.03921569, 1, 0, 1,
-0.4958745, -2.213514, -2.605672, 0.03137255, 1, 0, 1,
-0.4940395, 1.372609, 0.2504122, 0.02745098, 1, 0, 1,
-0.4911922, -1.782149, -2.004573, 0.01960784, 1, 0, 1,
-0.485595, -0.5348418, -1.639584, 0.01568628, 1, 0, 1,
-0.4845119, -0.4380857, -3.080291, 0.007843138, 1, 0, 1,
-0.4833942, 1.688013, 0.3725584, 0.003921569, 1, 0, 1,
-0.4805425, 0.1577587, -1.383501, 0, 1, 0.003921569, 1,
-0.478068, -0.9290403, -1.564904, 0, 1, 0.01176471, 1,
-0.4759388, -0.7716861, -3.421293, 0, 1, 0.01568628, 1,
-0.4728832, -0.1713615, -2.533595, 0, 1, 0.02352941, 1,
-0.4696991, -0.728754, -2.694969, 0, 1, 0.02745098, 1,
-0.4640789, -0.05134702, -0.6877787, 0, 1, 0.03529412, 1,
-0.4531949, 2.100214, 0.8549056, 0, 1, 0.03921569, 1,
-0.4516869, -0.7868245, -2.666371, 0, 1, 0.04705882, 1,
-0.4503132, -0.6239387, -3.874061, 0, 1, 0.05098039, 1,
-0.4500766, -0.3271369, -2.327163, 0, 1, 0.05882353, 1,
-0.4433845, 0.3733622, 0.1143909, 0, 1, 0.0627451, 1,
-0.4416081, -1.358155, -1.629813, 0, 1, 0.07058824, 1,
-0.4384677, 0.03009881, -2.545724, 0, 1, 0.07450981, 1,
-0.4291524, -0.4139257, -0.5313882, 0, 1, 0.08235294, 1,
-0.4272848, -0.4085039, -2.627102, 0, 1, 0.08627451, 1,
-0.42428, 0.1769162, 0.5855903, 0, 1, 0.09411765, 1,
-0.4234095, -1.923611, -2.873552, 0, 1, 0.1019608, 1,
-0.4206485, -0.3239781, -3.105736, 0, 1, 0.1058824, 1,
-0.4142153, 0.8143951, -1.432817, 0, 1, 0.1137255, 1,
-0.4082299, 0.3056617, -1.152423, 0, 1, 0.1176471, 1,
-0.4067582, 1.004192, -0.9731914, 0, 1, 0.1254902, 1,
-0.4063624, -0.3187179, -2.998873, 0, 1, 0.1294118, 1,
-0.3991609, -0.004894191, -1.909599, 0, 1, 0.1372549, 1,
-0.3968982, 2.448352, 1.158437, 0, 1, 0.1411765, 1,
-0.3957536, 0.1830053, -0.03810729, 0, 1, 0.1490196, 1,
-0.3909244, -0.2309852, -1.207345, 0, 1, 0.1529412, 1,
-0.38962, -0.2291199, -3.419693, 0, 1, 0.1607843, 1,
-0.3880355, 0.6881399, -0.3647654, 0, 1, 0.1647059, 1,
-0.3794995, 0.06446905, -3.007018, 0, 1, 0.172549, 1,
-0.3682587, 0.7873359, -0.885884, 0, 1, 0.1764706, 1,
-0.3674419, 0.3999214, -1.806838, 0, 1, 0.1843137, 1,
-0.3661776, 0.7813999, -1.635185, 0, 1, 0.1882353, 1,
-0.3585992, 1.615878, 1.529029, 0, 1, 0.1960784, 1,
-0.3583137, -1.342463, -4.009466, 0, 1, 0.2039216, 1,
-0.3564215, 0.4221834, 0.2186131, 0, 1, 0.2078431, 1,
-0.3533724, 0.2214992, -0.3444192, 0, 1, 0.2156863, 1,
-0.3525288, -0.7676379, -1.90897, 0, 1, 0.2196078, 1,
-0.3509746, 0.6689042, -0.6996644, 0, 1, 0.227451, 1,
-0.3470942, -0.594566, -1.379209, 0, 1, 0.2313726, 1,
-0.346069, 0.001758678, -0.6468671, 0, 1, 0.2392157, 1,
-0.3459496, 1.146016, 1.154561, 0, 1, 0.2431373, 1,
-0.3426339, 0.5094582, -0.588888, 0, 1, 0.2509804, 1,
-0.3426122, -0.184461, -0.8000007, 0, 1, 0.254902, 1,
-0.342137, -0.06769502, -4.027328, 0, 1, 0.2627451, 1,
-0.3403761, 1.75115, 0.9519796, 0, 1, 0.2666667, 1,
-0.3388927, -0.9325252, -3.928761, 0, 1, 0.2745098, 1,
-0.3363596, 0.4757285, -0.875913, 0, 1, 0.2784314, 1,
-0.3334477, -0.7597248, -4.385401, 0, 1, 0.2862745, 1,
-0.3320549, -0.6589123, -2.753184, 0, 1, 0.2901961, 1,
-0.3296666, 0.8524588, -3.270719, 0, 1, 0.2980392, 1,
-0.3289091, 0.4330068, -0.04650509, 0, 1, 0.3058824, 1,
-0.3262635, 0.1500311, -0.1341089, 0, 1, 0.3098039, 1,
-0.3246399, -1.594771, -2.827031, 0, 1, 0.3176471, 1,
-0.3238968, -1.80412, -2.126544, 0, 1, 0.3215686, 1,
-0.3235406, -0.4747972, -1.633884, 0, 1, 0.3294118, 1,
-0.3222633, -0.810847, -3.705188, 0, 1, 0.3333333, 1,
-0.3210602, -0.7756477, -2.423491, 0, 1, 0.3411765, 1,
-0.3206833, -0.183367, -2.345762, 0, 1, 0.345098, 1,
-0.3194795, 1.705366, -0.7442697, 0, 1, 0.3529412, 1,
-0.3163901, -0.1173788, -2.743557, 0, 1, 0.3568628, 1,
-0.3118227, 0.1572113, -1.833891, 0, 1, 0.3647059, 1,
-0.311165, -0.8829624, -4.141722, 0, 1, 0.3686275, 1,
-0.3106737, -1.648553, -5.257068, 0, 1, 0.3764706, 1,
-0.3081706, 0.476412, 0.7190849, 0, 1, 0.3803922, 1,
-0.3053729, 0.3534195, 0.02513671, 0, 1, 0.3882353, 1,
-0.2986013, 0.9075528, 1.029045, 0, 1, 0.3921569, 1,
-0.2943594, -0.3319316, -2.955261, 0, 1, 0.4, 1,
-0.2926164, -0.4092824, -2.374123, 0, 1, 0.4078431, 1,
-0.2910675, -0.7489458, -1.687977, 0, 1, 0.4117647, 1,
-0.2870928, -0.8245437, -3.522784, 0, 1, 0.4196078, 1,
-0.2839752, -0.8611573, -1.257049, 0, 1, 0.4235294, 1,
-0.2805631, 0.4445517, -2.646672, 0, 1, 0.4313726, 1,
-0.2798111, 2.107878, -1.830935, 0, 1, 0.4352941, 1,
-0.2769876, 0.07642679, 0.05099142, 0, 1, 0.4431373, 1,
-0.2741219, -1.734524, -6.168269, 0, 1, 0.4470588, 1,
-0.2729304, 0.3589201, -1.866456, 0, 1, 0.454902, 1,
-0.2682092, 0.7270449, -0.6959699, 0, 1, 0.4588235, 1,
-0.2667243, -1.333292, -1.875909, 0, 1, 0.4666667, 1,
-0.2658942, -1.408086, -3.864543, 0, 1, 0.4705882, 1,
-0.2588285, -0.7087989, -3.136606, 0, 1, 0.4784314, 1,
-0.2577923, -0.03767285, -3.224633, 0, 1, 0.4823529, 1,
-0.2530845, 0.2112927, 0.1090079, 0, 1, 0.4901961, 1,
-0.2494237, 1.365027, 0.5417892, 0, 1, 0.4941176, 1,
-0.2476155, 0.1684817, -1.812227, 0, 1, 0.5019608, 1,
-0.2461717, -0.4861212, -1.683835, 0, 1, 0.509804, 1,
-0.2404994, -0.2626516, -1.882571, 0, 1, 0.5137255, 1,
-0.2395714, -0.1038487, -1.772584, 0, 1, 0.5215687, 1,
-0.2394813, -0.5714095, -2.381357, 0, 1, 0.5254902, 1,
-0.2383033, 0.3079778, -0.7938962, 0, 1, 0.5333334, 1,
-0.2378253, -0.2029089, -3.46773, 0, 1, 0.5372549, 1,
-0.2320522, 1.154081, 0.3968879, 0, 1, 0.5450981, 1,
-0.2314734, 0.7208474, -2.092867, 0, 1, 0.5490196, 1,
-0.2271634, -0.6973299, -1.738981, 0, 1, 0.5568628, 1,
-0.2246671, -1.139745, -2.714434, 0, 1, 0.5607843, 1,
-0.223084, 1.477044, 1.070617, 0, 1, 0.5686275, 1,
-0.2194272, 0.2309713, 0.5425601, 0, 1, 0.572549, 1,
-0.2154427, -0.02024276, -2.715685, 0, 1, 0.5803922, 1,
-0.2129251, 0.2310576, -1.234216, 0, 1, 0.5843138, 1,
-0.2067161, -0.6938475, -2.377171, 0, 1, 0.5921569, 1,
-0.2064653, -0.7357522, -3.29826, 0, 1, 0.5960785, 1,
-0.2056101, 0.6446919, 0.327534, 0, 1, 0.6039216, 1,
-0.201619, 1.158456, 0.02670204, 0, 1, 0.6117647, 1,
-0.1979242, -0.5054496, -3.191065, 0, 1, 0.6156863, 1,
-0.1965638, -0.6802328, -2.870787, 0, 1, 0.6235294, 1,
-0.1962296, 0.9670846, -0.9102983, 0, 1, 0.627451, 1,
-0.1902571, -0.3576542, -2.67489, 0, 1, 0.6352941, 1,
-0.1886329, -1.041408, -2.719669, 0, 1, 0.6392157, 1,
-0.1859275, 1.978194, -0.5236959, 0, 1, 0.6470588, 1,
-0.1816338, 0.2709584, 0.8921082, 0, 1, 0.6509804, 1,
-0.1790339, 0.5088537, 1.440318, 0, 1, 0.6588235, 1,
-0.1779275, 2.239085, -0.206668, 0, 1, 0.6627451, 1,
-0.1779263, -1.649051, -4.194757, 0, 1, 0.6705883, 1,
-0.1741315, -1.072612, -3.358177, 0, 1, 0.6745098, 1,
-0.1738791, 0.8643991, -0.7533362, 0, 1, 0.682353, 1,
-0.1731996, -2.119572, -4.764779, 0, 1, 0.6862745, 1,
-0.1719064, 0.3755196, -1.117355, 0, 1, 0.6941177, 1,
-0.1701221, 1.880542, 0.9121687, 0, 1, 0.7019608, 1,
-0.1686172, -2.464884, -2.571385, 0, 1, 0.7058824, 1,
-0.1646299, 0.06576958, -0.8886163, 0, 1, 0.7137255, 1,
-0.160998, -0.1914725, -1.340364, 0, 1, 0.7176471, 1,
-0.1599697, -1.058088, -4.252787, 0, 1, 0.7254902, 1,
-0.159173, 0.6391993, -0.8916016, 0, 1, 0.7294118, 1,
-0.159088, 0.7301131, 1.440657, 0, 1, 0.7372549, 1,
-0.1526891, 0.7597088, 0.03999515, 0, 1, 0.7411765, 1,
-0.1526277, -1.532151, -2.982366, 0, 1, 0.7490196, 1,
-0.1495882, 1.018185, -0.6286709, 0, 1, 0.7529412, 1,
-0.1487713, 1.120845, -0.03473184, 0, 1, 0.7607843, 1,
-0.1465242, 0.7734002, 0.3176564, 0, 1, 0.7647059, 1,
-0.1434519, -0.3613946, -1.39354, 0, 1, 0.772549, 1,
-0.1423398, 2.071034, 0.5587524, 0, 1, 0.7764706, 1,
-0.141767, 0.2816724, -0.3837744, 0, 1, 0.7843137, 1,
-0.136019, 0.179501, 0.3689629, 0, 1, 0.7882353, 1,
-0.1332666, 1.929925, -0.3862689, 0, 1, 0.7960784, 1,
-0.1329783, 0.5138169, 0.7366268, 0, 1, 0.8039216, 1,
-0.132649, 0.4745356, 1.880502, 0, 1, 0.8078431, 1,
-0.1310737, -1.362869, -3.834687, 0, 1, 0.8156863, 1,
-0.1302274, 0.5798678, 0.1590918, 0, 1, 0.8196079, 1,
-0.1259924, 0.9761756, -0.1245807, 0, 1, 0.827451, 1,
-0.1247765, -0.9636129, -5.015062, 0, 1, 0.8313726, 1,
-0.1242013, -0.2511614, -3.375051, 0, 1, 0.8392157, 1,
-0.1233324, 0.3214913, -1.786963, 0, 1, 0.8431373, 1,
-0.1221839, -0.634394, -4.452925, 0, 1, 0.8509804, 1,
-0.1209943, 0.3795199, -0.6302581, 0, 1, 0.854902, 1,
-0.111151, -0.3782117, -4.017815, 0, 1, 0.8627451, 1,
-0.1062702, 0.7105519, 0.8537678, 0, 1, 0.8666667, 1,
-0.1052086, 0.3333226, 0.4089813, 0, 1, 0.8745098, 1,
-0.1028326, -0.2001224, -2.632353, 0, 1, 0.8784314, 1,
-0.1028226, 0.4260356, 0.6258583, 0, 1, 0.8862745, 1,
-0.1017373, -1.875249, -3.987102, 0, 1, 0.8901961, 1,
-0.1009166, 1.61638, -1.619352, 0, 1, 0.8980392, 1,
-0.09584188, 0.2200431, -1.896326, 0, 1, 0.9058824, 1,
-0.09373951, -0.7727526, -3.043364, 0, 1, 0.9098039, 1,
-0.09293348, 1.67349, -0.8140954, 0, 1, 0.9176471, 1,
-0.08836314, 0.4049518, 0.9907763, 0, 1, 0.9215686, 1,
-0.08810522, 1.960737, -0.7195969, 0, 1, 0.9294118, 1,
-0.08331738, 1.574605, 1.122174, 0, 1, 0.9333333, 1,
-0.08239248, -0.08714151, -3.264292, 0, 1, 0.9411765, 1,
-0.07816441, 0.2146779, 0.9867278, 0, 1, 0.945098, 1,
-0.07354648, -0.5350035, -2.319802, 0, 1, 0.9529412, 1,
-0.07105777, 1.013068, -0.1772275, 0, 1, 0.9568627, 1,
-0.06495789, -1.347989, -4.319308, 0, 1, 0.9647059, 1,
-0.06377674, -0.07791062, -1.64218, 0, 1, 0.9686275, 1,
-0.06254786, 1.006036, -0.5639021, 0, 1, 0.9764706, 1,
-0.05933893, -1.208867, -2.942964, 0, 1, 0.9803922, 1,
-0.05914109, -0.3851614, -2.870123, 0, 1, 0.9882353, 1,
-0.05778425, -0.08178213, -3.401278, 0, 1, 0.9921569, 1,
-0.05130073, -0.1813558, -1.430281, 0, 1, 1, 1,
-0.05029174, 1.266102, -1.212783, 0, 0.9921569, 1, 1,
-0.04949829, -1.136268, -2.829901, 0, 0.9882353, 1, 1,
-0.04273184, -0.6066378, -2.673573, 0, 0.9803922, 1, 1,
-0.03735663, 0.9829292, 1.118505, 0, 0.9764706, 1, 1,
-0.03714798, 0.1819366, -2.000335, 0, 0.9686275, 1, 1,
-0.03145905, -0.186682, -3.746691, 0, 0.9647059, 1, 1,
-0.02903506, -0.445467, -2.742223, 0, 0.9568627, 1, 1,
-0.02434248, 1.158305, 1.745723, 0, 0.9529412, 1, 1,
-0.02269966, -1.16126, -3.553821, 0, 0.945098, 1, 1,
-0.01556662, -1.979293, -4.943073, 0, 0.9411765, 1, 1,
-0.01506537, 0.2622242, 1.18173, 0, 0.9333333, 1, 1,
-0.01406777, -0.1487638, -3.773116, 0, 0.9294118, 1, 1,
-0.01374436, -0.552031, -2.729447, 0, 0.9215686, 1, 1,
-0.01318452, 0.4164138, 1.742757, 0, 0.9176471, 1, 1,
-0.01042423, -0.5337545, -2.135417, 0, 0.9098039, 1, 1,
0.005537963, -0.3316037, 3.047318, 0, 0.9058824, 1, 1,
0.0106409, 0.3814959, 0.6855728, 0, 0.8980392, 1, 1,
0.01688509, 1.717276, -0.7545075, 0, 0.8901961, 1, 1,
0.01956161, -0.4902193, 5.095701, 0, 0.8862745, 1, 1,
0.02154535, 1.491821, -1.348022, 0, 0.8784314, 1, 1,
0.02574131, 0.3511531, 1.027941, 0, 0.8745098, 1, 1,
0.02580236, -0.5565397, 3.29381, 0, 0.8666667, 1, 1,
0.02582232, -0.3153994, 3.461961, 0, 0.8627451, 1, 1,
0.02943634, 0.7549418, 0.0973792, 0, 0.854902, 1, 1,
0.03215866, -1.168967, 4.549449, 0, 0.8509804, 1, 1,
0.03253751, 0.3877219, 0.1042815, 0, 0.8431373, 1, 1,
0.03963473, 1.067021, 0.01766546, 0, 0.8392157, 1, 1,
0.04371993, -2.437592, 2.630702, 0, 0.8313726, 1, 1,
0.04889083, 1.334137, -1.666457, 0, 0.827451, 1, 1,
0.05028405, -1.379803, 1.777767, 0, 0.8196079, 1, 1,
0.05679492, -0.2230919, 3.073316, 0, 0.8156863, 1, 1,
0.05769772, 0.5674119, 0.2702658, 0, 0.8078431, 1, 1,
0.05878976, 0.01468845, 0.9554631, 0, 0.8039216, 1, 1,
0.06139946, -0.01150328, 2.605432, 0, 0.7960784, 1, 1,
0.0624121, -1.724684, 3.971859, 0, 0.7882353, 1, 1,
0.06735582, -1.488538, 3.330674, 0, 0.7843137, 1, 1,
0.0736715, 0.3247936, 1.340417, 0, 0.7764706, 1, 1,
0.07644783, -0.8564022, 2.446533, 0, 0.772549, 1, 1,
0.07780683, -0.3570518, 1.752848, 0, 0.7647059, 1, 1,
0.07987339, -2.49175, 2.239146, 0, 0.7607843, 1, 1,
0.08283732, 0.5594206, -0.4325012, 0, 0.7529412, 1, 1,
0.08594405, 0.1546357, 1.189133, 0, 0.7490196, 1, 1,
0.08596014, -0.6708993, 2.429185, 0, 0.7411765, 1, 1,
0.08701366, -0.521339, 3.43782, 0, 0.7372549, 1, 1,
0.08810987, -1.008427, 2.01601, 0, 0.7294118, 1, 1,
0.08950248, 1.438843, 0.8399789, 0, 0.7254902, 1, 1,
0.09370393, -0.4583701, 0.988073, 0, 0.7176471, 1, 1,
0.09549079, 2.32914, -1.433111, 0, 0.7137255, 1, 1,
0.09986735, 2.625828, -1.068536, 0, 0.7058824, 1, 1,
0.1003087, 0.2559627, -1.024566, 0, 0.6980392, 1, 1,
0.1012828, 0.2562219, -0.45939, 0, 0.6941177, 1, 1,
0.1031771, -1.154367, 2.061804, 0, 0.6862745, 1, 1,
0.1034024, 1.426496, 0.1503953, 0, 0.682353, 1, 1,
0.1044828, -1.328226, 4.06064, 0, 0.6745098, 1, 1,
0.1077885, -0.3162634, 4.249429, 0, 0.6705883, 1, 1,
0.1138386, 0.2861001, 0.6285123, 0, 0.6627451, 1, 1,
0.1182394, 1.697223, -1.337241, 0, 0.6588235, 1, 1,
0.1200845, -0.2077269, 3.033689, 0, 0.6509804, 1, 1,
0.1223473, 0.08823393, 2.498419, 0, 0.6470588, 1, 1,
0.1233342, 0.357889, 0.6461911, 0, 0.6392157, 1, 1,
0.123569, -0.8106202, 4.749438, 0, 0.6352941, 1, 1,
0.1243108, -0.577726, 0.8211544, 0, 0.627451, 1, 1,
0.1261182, -0.4596356, 3.283334, 0, 0.6235294, 1, 1,
0.1286286, -0.4701756, 3.544863, 0, 0.6156863, 1, 1,
0.1290304, -0.7986853, 1.937271, 0, 0.6117647, 1, 1,
0.1296736, 0.3895745, 1.386547, 0, 0.6039216, 1, 1,
0.1304916, -1.37826, 2.138203, 0, 0.5960785, 1, 1,
0.1313337, -1.267047, 2.833497, 0, 0.5921569, 1, 1,
0.1316893, -1.232484, 2.982111, 0, 0.5843138, 1, 1,
0.1321476, 1.208921, 0.4676243, 0, 0.5803922, 1, 1,
0.1333345, 0.4746903, -1.119773, 0, 0.572549, 1, 1,
0.1336628, 0.1026552, 0.3187038, 0, 0.5686275, 1, 1,
0.1418731, 0.8053749, 0.3875644, 0, 0.5607843, 1, 1,
0.1464071, -1.491893, 3.27617, 0, 0.5568628, 1, 1,
0.1481447, -0.144093, 1.857496, 0, 0.5490196, 1, 1,
0.1557937, 0.009228486, 2.120065, 0, 0.5450981, 1, 1,
0.1592993, -1.075803, 3.781992, 0, 0.5372549, 1, 1,
0.1599524, 0.9539962, 1.057705, 0, 0.5333334, 1, 1,
0.1606298, 1.454419, 1.069824, 0, 0.5254902, 1, 1,
0.1606896, 0.07671681, 0.5850268, 0, 0.5215687, 1, 1,
0.1642773, -0.6573421, 4.293919, 0, 0.5137255, 1, 1,
0.1645051, 2.144069, -0.3236875, 0, 0.509804, 1, 1,
0.1652787, -0.6199985, 1.113396, 0, 0.5019608, 1, 1,
0.1663755, 0.2392651, 1.848693, 0, 0.4941176, 1, 1,
0.1683866, -0.6813276, 1.072496, 0, 0.4901961, 1, 1,
0.1684771, -0.5537512, 2.666364, 0, 0.4823529, 1, 1,
0.1718381, -1.240864, 3.000654, 0, 0.4784314, 1, 1,
0.1719582, -0.9429376, 2.534029, 0, 0.4705882, 1, 1,
0.1751265, 1.093836, 0.1000037, 0, 0.4666667, 1, 1,
0.1806448, -1.179796, 3.794132, 0, 0.4588235, 1, 1,
0.1846957, -0.03015615, 1.410958, 0, 0.454902, 1, 1,
0.1852272, -1.557813, 4.164176, 0, 0.4470588, 1, 1,
0.1878944, -0.02574229, 3.652941, 0, 0.4431373, 1, 1,
0.1966415, -1.062299, 3.000248, 0, 0.4352941, 1, 1,
0.1985527, -0.2926852, 2.631978, 0, 0.4313726, 1, 1,
0.2045367, -1.488912, 4.741346, 0, 0.4235294, 1, 1,
0.2092181, -0.5650077, 3.738197, 0, 0.4196078, 1, 1,
0.2129484, -0.2043906, 2.990912, 0, 0.4117647, 1, 1,
0.2151791, 0.9084391, 0.6652033, 0, 0.4078431, 1, 1,
0.215227, -1.787442, 4.454108, 0, 0.4, 1, 1,
0.2179267, 1.171341, 0.6643785, 0, 0.3921569, 1, 1,
0.2180495, -0.03942779, 0.696049, 0, 0.3882353, 1, 1,
0.2248351, 1.571797, 0.9671937, 0, 0.3803922, 1, 1,
0.2282474, -1.129901, 1.989486, 0, 0.3764706, 1, 1,
0.2324074, -1.662109, 4.128873, 0, 0.3686275, 1, 1,
0.2352971, 0.8165739, 0.5759567, 0, 0.3647059, 1, 1,
0.2354174, -0.743087, 3.227497, 0, 0.3568628, 1, 1,
0.2398761, 0.514101, -1.963878, 0, 0.3529412, 1, 1,
0.2424127, 0.9977914, 0.410372, 0, 0.345098, 1, 1,
0.2432127, 0.887576, -0.2382298, 0, 0.3411765, 1, 1,
0.24495, 0.808888, -0.03666639, 0, 0.3333333, 1, 1,
0.2454679, 1.119292, -0.5216084, 0, 0.3294118, 1, 1,
0.2514691, 0.178835, 0.6847568, 0, 0.3215686, 1, 1,
0.2542215, 1.121783, 0.07936344, 0, 0.3176471, 1, 1,
0.2551593, 0.3814075, 0.7085772, 0, 0.3098039, 1, 1,
0.2601263, -0.2044464, 3.717692, 0, 0.3058824, 1, 1,
0.2633754, 0.6457114, 0.7907138, 0, 0.2980392, 1, 1,
0.2659774, 0.2289283, 2.034693, 0, 0.2901961, 1, 1,
0.2688778, 0.8615503, 1.469095, 0, 0.2862745, 1, 1,
0.2692695, 0.3494479, 2.335145, 0, 0.2784314, 1, 1,
0.2697643, 1.195881, 0.3986391, 0, 0.2745098, 1, 1,
0.2704287, -1.517007, 5.59275, 0, 0.2666667, 1, 1,
0.2715526, -0.7427374, 2.037845, 0, 0.2627451, 1, 1,
0.2718191, 0.1147725, 2.209705, 0, 0.254902, 1, 1,
0.2737252, 0.6907694, 1.867933, 0, 0.2509804, 1, 1,
0.2740606, 0.6169719, -0.09923125, 0, 0.2431373, 1, 1,
0.2791461, 0.1903678, 1.715712, 0, 0.2392157, 1, 1,
0.2801085, 0.641875, 2.119333, 0, 0.2313726, 1, 1,
0.2806436, -0.8052291, 3.331787, 0, 0.227451, 1, 1,
0.2906691, -0.9571646, 3.087359, 0, 0.2196078, 1, 1,
0.2935003, 0.6576827, -0.1644194, 0, 0.2156863, 1, 1,
0.2988198, -0.2333481, 3.029075, 0, 0.2078431, 1, 1,
0.3028518, -0.3171915, 3.644646, 0, 0.2039216, 1, 1,
0.3034921, 0.02375335, 0.08529822, 0, 0.1960784, 1, 1,
0.3049914, 0.8007573, -0.4436085, 0, 0.1882353, 1, 1,
0.3105674, -2.334202, 3.32212, 0, 0.1843137, 1, 1,
0.3111649, -0.03860445, 2.187979, 0, 0.1764706, 1, 1,
0.311894, -0.1504872, 3.753932, 0, 0.172549, 1, 1,
0.3127574, 0.7192224, 0.7911987, 0, 0.1647059, 1, 1,
0.3153597, 1.328374, -0.6143439, 0, 0.1607843, 1, 1,
0.3154272, -0.5973142, 2.254848, 0, 0.1529412, 1, 1,
0.3170589, -0.003766558, 2.058661, 0, 0.1490196, 1, 1,
0.3202941, -0.1138491, 3.770489, 0, 0.1411765, 1, 1,
0.3217403, -0.4434317, 2.895464, 0, 0.1372549, 1, 1,
0.3220571, -0.7791778, 2.584953, 0, 0.1294118, 1, 1,
0.3259903, 0.1650438, 1.278142, 0, 0.1254902, 1, 1,
0.3283279, -0.9858367, 2.420989, 0, 0.1176471, 1, 1,
0.3344835, -0.3174843, 2.007999, 0, 0.1137255, 1, 1,
0.3390612, -1.994563, 4.699126, 0, 0.1058824, 1, 1,
0.3421359, -0.1531347, 1.85871, 0, 0.09803922, 1, 1,
0.3432141, -0.6109831, 2.88157, 0, 0.09411765, 1, 1,
0.348679, -0.9336168, 4.081254, 0, 0.08627451, 1, 1,
0.349429, -0.78588, 1.356595, 0, 0.08235294, 1, 1,
0.3510357, -1.113184, 0.5696752, 0, 0.07450981, 1, 1,
0.3517296, -0.8741237, 2.703238, 0, 0.07058824, 1, 1,
0.3523517, 1.017924, -0.09341796, 0, 0.0627451, 1, 1,
0.3536631, 1.042879, 1.006537, 0, 0.05882353, 1, 1,
0.3540236, 0.196516, 0.6106519, 0, 0.05098039, 1, 1,
0.354074, -0.00482325, 1.521696, 0, 0.04705882, 1, 1,
0.354076, 1.55699, -1.74985, 0, 0.03921569, 1, 1,
0.3555293, -0.4375733, 2.236029, 0, 0.03529412, 1, 1,
0.3575844, 0.211614, -0.01260815, 0, 0.02745098, 1, 1,
0.3600496, -0.05344652, -0.1978417, 0, 0.02352941, 1, 1,
0.374373, -1.243082, 3.618454, 0, 0.01568628, 1, 1,
0.3831174, -0.3398481, 2.223917, 0, 0.01176471, 1, 1,
0.3842813, 0.9920112, -0.04735464, 0, 0.003921569, 1, 1,
0.3912214, 0.6557095, 0.7789558, 0.003921569, 0, 1, 1,
0.3912421, -1.041434, 3.506016, 0.007843138, 0, 1, 1,
0.3973517, -0.4674112, 2.819355, 0.01568628, 0, 1, 1,
0.3983642, -0.6365741, 2.704682, 0.01960784, 0, 1, 1,
0.3983692, -0.06740446, 1.722568, 0.02745098, 0, 1, 1,
0.3991315, 2.500945, 1.403876, 0.03137255, 0, 1, 1,
0.4015631, 0.8500943, -0.9224339, 0.03921569, 0, 1, 1,
0.4022999, -0.00456779, 0.7103213, 0.04313726, 0, 1, 1,
0.4081497, -1.297873, 2.406499, 0.05098039, 0, 1, 1,
0.4089246, 0.6751071, 1.663524, 0.05490196, 0, 1, 1,
0.4164679, -1.112309, 2.876947, 0.0627451, 0, 1, 1,
0.4165323, -0.2964127, 1.860895, 0.06666667, 0, 1, 1,
0.4236809, -0.197915, 1.059442, 0.07450981, 0, 1, 1,
0.4274699, 0.1965102, -0.9608877, 0.07843138, 0, 1, 1,
0.4275076, -0.09672865, 1.846406, 0.08627451, 0, 1, 1,
0.4358123, 0.1145516, 2.965376, 0.09019608, 0, 1, 1,
0.436367, 0.1333738, 2.103443, 0.09803922, 0, 1, 1,
0.439279, 0.9004501, 0.7204712, 0.1058824, 0, 1, 1,
0.4399924, 0.07833015, 2.329974, 0.1098039, 0, 1, 1,
0.4457417, 0.4083525, 1.987667, 0.1176471, 0, 1, 1,
0.4514587, 0.6450183, 1.148607, 0.1215686, 0, 1, 1,
0.4545508, 1.896405, 2.051128, 0.1294118, 0, 1, 1,
0.4579563, 0.8330635, 2.28521, 0.1333333, 0, 1, 1,
0.4611563, 1.47841, 0.2554022, 0.1411765, 0, 1, 1,
0.4624763, 1.140478, -0.179037, 0.145098, 0, 1, 1,
0.4625489, -1.408998, 3.818358, 0.1529412, 0, 1, 1,
0.4633601, 1.090507, -1.025522, 0.1568628, 0, 1, 1,
0.4649398, 1.490594, 1.827009, 0.1647059, 0, 1, 1,
0.4721011, 0.7113518, 0.08312093, 0.1686275, 0, 1, 1,
0.4745436, 0.2638936, 0.6363935, 0.1764706, 0, 1, 1,
0.476335, -0.4230861, 1.292395, 0.1803922, 0, 1, 1,
0.4846011, -0.204081, 4.087231, 0.1882353, 0, 1, 1,
0.4934882, 0.7726011, 0.02096673, 0.1921569, 0, 1, 1,
0.4969325, -1.138614, 2.078304, 0.2, 0, 1, 1,
0.4981852, -0.03882824, 0.2069298, 0.2078431, 0, 1, 1,
0.5032392, -2.189527, 1.718282, 0.2117647, 0, 1, 1,
0.5068429, 0.4842946, 1.793666, 0.2196078, 0, 1, 1,
0.5074072, 1.007293, 1.33591, 0.2235294, 0, 1, 1,
0.5076815, 1.035894, -1.066957, 0.2313726, 0, 1, 1,
0.5080344, -0.2730318, 1.992278, 0.2352941, 0, 1, 1,
0.5085825, 0.2133224, 1.753253, 0.2431373, 0, 1, 1,
0.5118064, 1.178313, 1.172659, 0.2470588, 0, 1, 1,
0.5161508, -0.4426915, 1.343687, 0.254902, 0, 1, 1,
0.5218536, -1.390389, 1.09972, 0.2588235, 0, 1, 1,
0.526835, -0.856945, 2.273309, 0.2666667, 0, 1, 1,
0.5273026, -1.454969, 1.830442, 0.2705882, 0, 1, 1,
0.5363692, -0.2697968, 3.776692, 0.2784314, 0, 1, 1,
0.5403695, 0.7352854, 0.7828737, 0.282353, 0, 1, 1,
0.5447407, 1.174972, -0.7165738, 0.2901961, 0, 1, 1,
0.5467945, -0.07769385, -0.1935823, 0.2941177, 0, 1, 1,
0.5498856, -0.1813759, 2.12589, 0.3019608, 0, 1, 1,
0.5505887, 1.113481, 1.319127, 0.3098039, 0, 1, 1,
0.5613279, -0.3931856, 2.832311, 0.3137255, 0, 1, 1,
0.5615795, -1.248757, 3.96099, 0.3215686, 0, 1, 1,
0.5620287, 0.1433482, 2.243427, 0.3254902, 0, 1, 1,
0.5652258, -0.5121599, 2.761666, 0.3333333, 0, 1, 1,
0.5665925, 0.08262026, 0.9376485, 0.3372549, 0, 1, 1,
0.5683268, 0.411201, 2.102379, 0.345098, 0, 1, 1,
0.5744686, 0.7785589, 0.564935, 0.3490196, 0, 1, 1,
0.5750561, -0.2527668, 2.889883, 0.3568628, 0, 1, 1,
0.5791006, -0.2478779, 1.073139, 0.3607843, 0, 1, 1,
0.5810203, 1.732313, 0.6829043, 0.3686275, 0, 1, 1,
0.581301, 1.212149, -0.2122917, 0.372549, 0, 1, 1,
0.587787, -0.475971, 2.802994, 0.3803922, 0, 1, 1,
0.5887128, -1.980404, 1.535293, 0.3843137, 0, 1, 1,
0.5897591, 0.6018965, 1.920085, 0.3921569, 0, 1, 1,
0.593033, 0.730395, 2.598401, 0.3960784, 0, 1, 1,
0.5958369, 0.6251505, 0.6627247, 0.4039216, 0, 1, 1,
0.6043412, -0.1421478, 1.436504, 0.4117647, 0, 1, 1,
0.607061, -0.507193, 1.817907, 0.4156863, 0, 1, 1,
0.6079114, 0.4697086, 0.5704238, 0.4235294, 0, 1, 1,
0.6089581, -0.9041743, 3.857366, 0.427451, 0, 1, 1,
0.611929, 0.9595775, 0.07444068, 0.4352941, 0, 1, 1,
0.6130428, -0.4458359, 1.117059, 0.4392157, 0, 1, 1,
0.6179351, -1.625004, 2.983422, 0.4470588, 0, 1, 1,
0.6181456, 0.09509662, 3.045692, 0.4509804, 0, 1, 1,
0.6197605, 0.3935176, 1.856091, 0.4588235, 0, 1, 1,
0.621054, 0.9064096, -0.4542363, 0.4627451, 0, 1, 1,
0.6248549, 1.260258, 0.9380652, 0.4705882, 0, 1, 1,
0.6272742, 0.1178209, -0.1047293, 0.4745098, 0, 1, 1,
0.6327854, -0.9642416, 1.921143, 0.4823529, 0, 1, 1,
0.6374804, -0.5901685, 2.873815, 0.4862745, 0, 1, 1,
0.6416603, 0.763164, -0.4134946, 0.4941176, 0, 1, 1,
0.6427129, -0.8189843, 2.78389, 0.5019608, 0, 1, 1,
0.6565254, 0.1661126, 1.352664, 0.5058824, 0, 1, 1,
0.6592687, -1.39111, 1.71301, 0.5137255, 0, 1, 1,
0.6676375, -0.4606965, 1.578839, 0.5176471, 0, 1, 1,
0.6678058, -0.8381561, 3.296536, 0.5254902, 0, 1, 1,
0.6714452, 2.176248, 1.211417, 0.5294118, 0, 1, 1,
0.6752192, 0.6541927, 1.566716, 0.5372549, 0, 1, 1,
0.6753834, 0.6181974, 0.9206372, 0.5411765, 0, 1, 1,
0.6850031, -0.7391886, 1.666752, 0.5490196, 0, 1, 1,
0.6910955, 0.05446997, 1.161102, 0.5529412, 0, 1, 1,
0.7060884, -2.321898, 2.626146, 0.5607843, 0, 1, 1,
0.716749, -0.1491141, 0.9568844, 0.5647059, 0, 1, 1,
0.7209831, -0.2281517, 2.944062, 0.572549, 0, 1, 1,
0.7222793, 0.6659808, 1.912619, 0.5764706, 0, 1, 1,
0.7264059, 0.07140732, 2.692297, 0.5843138, 0, 1, 1,
0.7311282, 2.254412, 0.9189371, 0.5882353, 0, 1, 1,
0.7320585, -0.3773166, 3.365532, 0.5960785, 0, 1, 1,
0.7377201, -1.001294, 1.841848, 0.6039216, 0, 1, 1,
0.7430363, 0.4005604, 1.29879, 0.6078432, 0, 1, 1,
0.7535608, 0.6120427, 0.9761999, 0.6156863, 0, 1, 1,
0.757041, 0.5072015, 2.064518, 0.6196079, 0, 1, 1,
0.7620274, 2.421579, -0.6617483, 0.627451, 0, 1, 1,
0.7621999, 0.1903842, 1.291079, 0.6313726, 0, 1, 1,
0.7665185, 0.3590138, 0.0160306, 0.6392157, 0, 1, 1,
0.7690345, 0.8777087, 0.5078496, 0.6431373, 0, 1, 1,
0.7690607, -0.9708397, 1.504889, 0.6509804, 0, 1, 1,
0.7731941, 0.8014882, -0.1713708, 0.654902, 0, 1, 1,
0.7734016, 1.379406, 0.4325252, 0.6627451, 0, 1, 1,
0.7752013, -0.4227449, 2.744833, 0.6666667, 0, 1, 1,
0.7889734, 0.6518326, -0.07796086, 0.6745098, 0, 1, 1,
0.7895415, 0.223676, 1.866139, 0.6784314, 0, 1, 1,
0.7923911, -1.234397, 2.451793, 0.6862745, 0, 1, 1,
0.7938569, 0.4338957, 2.355783, 0.6901961, 0, 1, 1,
0.8027682, -0.152731, 2.345262, 0.6980392, 0, 1, 1,
0.8056166, 0.002938733, 3.336767, 0.7058824, 0, 1, 1,
0.8058901, 0.3096978, 0.5532651, 0.7098039, 0, 1, 1,
0.811215, 1.029499, 1.00315, 0.7176471, 0, 1, 1,
0.8112273, -0.8406754, 3.023298, 0.7215686, 0, 1, 1,
0.8142542, 0.4884776, 1.033433, 0.7294118, 0, 1, 1,
0.8293402, -0.6607659, 3.395431, 0.7333333, 0, 1, 1,
0.8324972, 2.015373, -0.638231, 0.7411765, 0, 1, 1,
0.8332819, 1.382147, 2.666761, 0.7450981, 0, 1, 1,
0.8355039, 0.5362793, 0.220323, 0.7529412, 0, 1, 1,
0.8380826, 0.5566271, 1.944091, 0.7568628, 0, 1, 1,
0.8414894, 0.6556519, 0.8496539, 0.7647059, 0, 1, 1,
0.8422272, -0.7031313, 3.167202, 0.7686275, 0, 1, 1,
0.8537233, -0.04417186, 2.386323, 0.7764706, 0, 1, 1,
0.8539889, -1.162432, 3.740184, 0.7803922, 0, 1, 1,
0.8591016, 0.04186307, 3.965758, 0.7882353, 0, 1, 1,
0.86416, 0.6619449, 1.98087, 0.7921569, 0, 1, 1,
0.865862, 1.826649, -1.147657, 0.8, 0, 1, 1,
0.8802264, 1.241007, -0.5573963, 0.8078431, 0, 1, 1,
0.8810939, -0.4255073, 1.947747, 0.8117647, 0, 1, 1,
0.8888956, 0.05831442, -0.4639495, 0.8196079, 0, 1, 1,
0.889068, -1.371899, 2.924634, 0.8235294, 0, 1, 1,
0.8952451, -0.6331258, 2.179822, 0.8313726, 0, 1, 1,
0.8956174, 0.7189404, 1.585382, 0.8352941, 0, 1, 1,
0.897355, 0.499021, 2.979302, 0.8431373, 0, 1, 1,
0.9088742, -0.3336833, 1.444545, 0.8470588, 0, 1, 1,
0.9202511, 0.4908766, -0.04229424, 0.854902, 0, 1, 1,
0.9241711, 1.467632, -1.116862, 0.8588235, 0, 1, 1,
0.9297517, -0.052286, 1.282068, 0.8666667, 0, 1, 1,
0.9298438, 0.3425873, 0.5766372, 0.8705882, 0, 1, 1,
0.9308801, 0.1471688, 2.170278, 0.8784314, 0, 1, 1,
0.9363428, 1.100996, 1.408874, 0.8823529, 0, 1, 1,
0.936654, 0.3101822, 2.325454, 0.8901961, 0, 1, 1,
0.9371598, -1.79492, 1.941813, 0.8941177, 0, 1, 1,
0.9371769, 0.5661393, 1.82336, 0.9019608, 0, 1, 1,
0.9401011, 0.4833058, 1.793636, 0.9098039, 0, 1, 1,
0.9403757, 1.495219, 0.2566584, 0.9137255, 0, 1, 1,
0.9425603, 0.8711165, -0.7851325, 0.9215686, 0, 1, 1,
0.9475875, -0.5540532, 0.9391962, 0.9254902, 0, 1, 1,
0.9486429, 0.8520964, 1.142071, 0.9333333, 0, 1, 1,
0.9541981, -0.7485595, 0.5812903, 0.9372549, 0, 1, 1,
0.9599314, -0.9047428, 3.179584, 0.945098, 0, 1, 1,
0.9603047, -0.3713737, 2.600377, 0.9490196, 0, 1, 1,
0.9643576, 0.2045907, 2.550867, 0.9568627, 0, 1, 1,
0.9654349, 0.7958244, 1.556585, 0.9607843, 0, 1, 1,
0.9665135, -0.6979919, -0.02666228, 0.9686275, 0, 1, 1,
0.9758381, -1.151338, 1.39055, 0.972549, 0, 1, 1,
0.9780185, -1.192965, 3.583292, 0.9803922, 0, 1, 1,
0.9821405, -0.8272457, 0.6069157, 0.9843137, 0, 1, 1,
0.9857709, -1.861755, 2.279369, 0.9921569, 0, 1, 1,
0.9865996, 0.314516, 1.895568, 0.9960784, 0, 1, 1,
0.9867015, 1.966439, 0.03115057, 1, 0, 0.9960784, 1,
0.9884573, 0.835819, 1.626738, 1, 0, 0.9882353, 1,
0.9917299, -0.8303077, 3.543394, 1, 0, 0.9843137, 1,
0.9942726, -1.321806, 2.558355, 1, 0, 0.9764706, 1,
0.9952599, 0.9456111, -0.02330492, 1, 0, 0.972549, 1,
0.9998845, 0.2836263, 2.171105, 1, 0, 0.9647059, 1,
1.002769, 0.04404082, 2.703687, 1, 0, 0.9607843, 1,
1.006357, -0.5217589, 3.755221, 1, 0, 0.9529412, 1,
1.007025, -0.1780109, 2.305628, 1, 0, 0.9490196, 1,
1.034276, 0.5929587, 2.361196, 1, 0, 0.9411765, 1,
1.034421, -0.9392892, 0.6829867, 1, 0, 0.9372549, 1,
1.034888, -1.102553, 0.8507975, 1, 0, 0.9294118, 1,
1.035089, 1.226153, 0.6979167, 1, 0, 0.9254902, 1,
1.03654, 0.3282703, 0.8246301, 1, 0, 0.9176471, 1,
1.038687, -0.4202147, 2.711633, 1, 0, 0.9137255, 1,
1.053233, 0.263502, 1.225989, 1, 0, 0.9058824, 1,
1.055661, -0.6634563, 1.700646, 1, 0, 0.9019608, 1,
1.064893, -0.1218613, 3.501727, 1, 0, 0.8941177, 1,
1.073686, 1.419216, -1.579775, 1, 0, 0.8862745, 1,
1.074494, -0.1619986, -0.3928697, 1, 0, 0.8823529, 1,
1.074577, 0.339146, 2.596512, 1, 0, 0.8745098, 1,
1.075487, -0.8115, 3.410798, 1, 0, 0.8705882, 1,
1.07683, 1.570608, -0.7058127, 1, 0, 0.8627451, 1,
1.078045, -1.64388, 1.407418, 1, 0, 0.8588235, 1,
1.085343, -0.575489, 2.179888, 1, 0, 0.8509804, 1,
1.086994, -0.6996282, 2.073127, 1, 0, 0.8470588, 1,
1.087304, -1.246287, 2.839956, 1, 0, 0.8392157, 1,
1.105219, 0.0006899236, -0.3566603, 1, 0, 0.8352941, 1,
1.105913, -0.5790435, 2.762118, 1, 0, 0.827451, 1,
1.10596, -1.123841, 1.864452, 1, 0, 0.8235294, 1,
1.106273, -0.3293631, 1.981887, 1, 0, 0.8156863, 1,
1.111878, 1.474021, 0.6517646, 1, 0, 0.8117647, 1,
1.11717, 1.711264, 0.6982697, 1, 0, 0.8039216, 1,
1.11884, 0.08034433, 2.412801, 1, 0, 0.7960784, 1,
1.121249, -0.8348286, 2.670184, 1, 0, 0.7921569, 1,
1.122988, -0.1360325, 2.727015, 1, 0, 0.7843137, 1,
1.123482, 0.046014, 1.102876, 1, 0, 0.7803922, 1,
1.130681, -2.366036, 4.070879, 1, 0, 0.772549, 1,
1.130803, 0.7224586, 1.078108, 1, 0, 0.7686275, 1,
1.131271, -1.467151, 3.413287, 1, 0, 0.7607843, 1,
1.14441, -0.05780668, 1.263159, 1, 0, 0.7568628, 1,
1.144958, -0.313277, 0.8790003, 1, 0, 0.7490196, 1,
1.158412, -1.156116, 3.47923, 1, 0, 0.7450981, 1,
1.162075, -0.03418919, 1.506628, 1, 0, 0.7372549, 1,
1.162367, -1.999701, 2.298138, 1, 0, 0.7333333, 1,
1.17129, -0.2157685, 0.5560353, 1, 0, 0.7254902, 1,
1.177645, -0.5315068, 1.832702, 1, 0, 0.7215686, 1,
1.178721, 0.209347, 1.277991, 1, 0, 0.7137255, 1,
1.179979, 1.574997, 3.198945, 1, 0, 0.7098039, 1,
1.181006, -1.031552, 1.693795, 1, 0, 0.7019608, 1,
1.18298, -1.420012, 2.559028, 1, 0, 0.6941177, 1,
1.18324, -0.9616912, 2.62953, 1, 0, 0.6901961, 1,
1.191379, 0.3718775, 1.155162, 1, 0, 0.682353, 1,
1.196035, 0.5876301, 2.080591, 1, 0, 0.6784314, 1,
1.207725, 0.5588766, 2.192701, 1, 0, 0.6705883, 1,
1.211756, -0.1095292, 2.25443, 1, 0, 0.6666667, 1,
1.212492, 0.4268168, 0.1995402, 1, 0, 0.6588235, 1,
1.216349, -0.1327619, 0.425316, 1, 0, 0.654902, 1,
1.216824, -3.015533, 2.811494, 1, 0, 0.6470588, 1,
1.219803, -0.06471545, 1.51999, 1, 0, 0.6431373, 1,
1.223797, -0.03369973, 1.813684, 1, 0, 0.6352941, 1,
1.239526, 0.1504435, 0.9930596, 1, 0, 0.6313726, 1,
1.246811, 0.1671231, 1.974114, 1, 0, 0.6235294, 1,
1.250302, -0.8242397, 2.184483, 1, 0, 0.6196079, 1,
1.25159, -0.970408, 3.339324, 1, 0, 0.6117647, 1,
1.265996, -1.267095, 3.857664, 1, 0, 0.6078432, 1,
1.274287, 1.778841, -1.08982, 1, 0, 0.6, 1,
1.277847, -1.575323, 2.171728, 1, 0, 0.5921569, 1,
1.280846, -0.7049187, 1.547674, 1, 0, 0.5882353, 1,
1.284191, -0.02482763, 2.304094, 1, 0, 0.5803922, 1,
1.284582, 0.7669539, 0.790207, 1, 0, 0.5764706, 1,
1.306844, -0.08930448, -0.1387744, 1, 0, 0.5686275, 1,
1.308086, 0.8349585, 1.912174, 1, 0, 0.5647059, 1,
1.312193, 0.9709554, -0.1546074, 1, 0, 0.5568628, 1,
1.312627, 1.133739, -0.1337288, 1, 0, 0.5529412, 1,
1.314365, 0.2486752, -0.8260849, 1, 0, 0.5450981, 1,
1.316548, -1.554031, 2.883364, 1, 0, 0.5411765, 1,
1.32665, 0.3983338, 2.297577, 1, 0, 0.5333334, 1,
1.326926, 1.068645, 1.923537, 1, 0, 0.5294118, 1,
1.330401, 1.067383, 1.161674, 1, 0, 0.5215687, 1,
1.352661, 0.2412468, 2.146587, 1, 0, 0.5176471, 1,
1.359513, 0.9807061, 2.360145, 1, 0, 0.509804, 1,
1.363412, 2.122648, 0.6429675, 1, 0, 0.5058824, 1,
1.370992, -1.297526, 1.199122, 1, 0, 0.4980392, 1,
1.374853, -1.08655, 3.547832, 1, 0, 0.4901961, 1,
1.377078, 0.8436043, 1.251769, 1, 0, 0.4862745, 1,
1.377883, 1.576048, 1.433196, 1, 0, 0.4784314, 1,
1.38137, 1.722071, 0.8699211, 1, 0, 0.4745098, 1,
1.383937, -0.768105, 1.658273, 1, 0, 0.4666667, 1,
1.394842, -0.8920088, 1.042549, 1, 0, 0.4627451, 1,
1.400576, 1.063522, 0.2838167, 1, 0, 0.454902, 1,
1.400843, -0.3893554, 1.429703, 1, 0, 0.4509804, 1,
1.407447, 1.593935, 1.768645, 1, 0, 0.4431373, 1,
1.410129, -1.142698, 1.77575, 1, 0, 0.4392157, 1,
1.417128, -0.3577832, 0.9383635, 1, 0, 0.4313726, 1,
1.418755, -1.73079, 2.984489, 1, 0, 0.427451, 1,
1.421935, -0.4683781, 1.967843, 1, 0, 0.4196078, 1,
1.428632, -0.6360506, 0.8661547, 1, 0, 0.4156863, 1,
1.439803, 0.4077543, 0.4575005, 1, 0, 0.4078431, 1,
1.448387, -0.01792204, 0.2332031, 1, 0, 0.4039216, 1,
1.454016, 1.401121, 0.04600918, 1, 0, 0.3960784, 1,
1.455481, 0.630254, 2.984316, 1, 0, 0.3882353, 1,
1.469899, 0.9484281, -1.30183, 1, 0, 0.3843137, 1,
1.503869, 0.8332934, 0.8377148, 1, 0, 0.3764706, 1,
1.509908, -1.139505, 3.522153, 1, 0, 0.372549, 1,
1.517928, -0.9489967, -0.6903903, 1, 0, 0.3647059, 1,
1.520436, -0.4116616, 2.962374, 1, 0, 0.3607843, 1,
1.522472, 1.344428, 2.762388, 1, 0, 0.3529412, 1,
1.525426, -0.9634909, 2.493743, 1, 0, 0.3490196, 1,
1.547058, 0.8252804, 1.161735, 1, 0, 0.3411765, 1,
1.554252, 0.08780091, 1.834147, 1, 0, 0.3372549, 1,
1.557159, -0.6716501, 2.720029, 1, 0, 0.3294118, 1,
1.559241, 0.441456, 1.876271, 1, 0, 0.3254902, 1,
1.567354, -1.89236, 1.713168, 1, 0, 0.3176471, 1,
1.58391, 0.4596178, 1.460258, 1, 0, 0.3137255, 1,
1.586713, 0.5668247, 2.389913, 1, 0, 0.3058824, 1,
1.587179, -1.471478, 0.2508108, 1, 0, 0.2980392, 1,
1.587571, 1.028165, 0.6188768, 1, 0, 0.2941177, 1,
1.588329, 0.8669277, -0.4130428, 1, 0, 0.2862745, 1,
1.611597, -0.3237878, 1.969593, 1, 0, 0.282353, 1,
1.616004, -0.05594784, 1.616875, 1, 0, 0.2745098, 1,
1.619014, 0.4360055, 0.1462969, 1, 0, 0.2705882, 1,
1.622713, -0.2502423, 2.796172, 1, 0, 0.2627451, 1,
1.631539, 0.711966, 2.632346, 1, 0, 0.2588235, 1,
1.637087, -0.7186689, 1.583858, 1, 0, 0.2509804, 1,
1.647256, 0.2726405, 0.4740703, 1, 0, 0.2470588, 1,
1.65313, 0.2847321, 1.372479, 1, 0, 0.2392157, 1,
1.711916, 0.3773617, 2.002229, 1, 0, 0.2352941, 1,
1.714776, 0.3197249, 1.530576, 1, 0, 0.227451, 1,
1.726044, -1.626271, 2.583292, 1, 0, 0.2235294, 1,
1.735042, 0.9432327, 1.249743, 1, 0, 0.2156863, 1,
1.755497, -0.7264698, 2.449854, 1, 0, 0.2117647, 1,
1.768765, 0.7211064, 1.082617, 1, 0, 0.2039216, 1,
1.770606, 0.534771, 2.638278, 1, 0, 0.1960784, 1,
1.786547, 1.04913, 1.081378, 1, 0, 0.1921569, 1,
1.800148, -0.03184223, 0.4850409, 1, 0, 0.1843137, 1,
1.801899, -0.6049185, 3.255053, 1, 0, 0.1803922, 1,
1.843674, 0.08123044, 1.71504, 1, 0, 0.172549, 1,
1.856966, -1.002038, 2.592862, 1, 0, 0.1686275, 1,
1.879167, 0.3755784, 1.829753, 1, 0, 0.1607843, 1,
1.898976, -0.2989999, 2.347103, 1, 0, 0.1568628, 1,
1.928861, 1.33479, 1.812095, 1, 0, 0.1490196, 1,
1.931881, 0.5823905, 0.5856397, 1, 0, 0.145098, 1,
1.947069, -1.120597, 2.417719, 1, 0, 0.1372549, 1,
1.957491, -2.549247, 2.384384, 1, 0, 0.1333333, 1,
1.999578, -0.1047633, 3.528721, 1, 0, 0.1254902, 1,
2.010906, -2.197774, -0.07686126, 1, 0, 0.1215686, 1,
2.01666, 0.2500421, 1.446652, 1, 0, 0.1137255, 1,
2.041005, -0.9157102, 1.258641, 1, 0, 0.1098039, 1,
2.080552, 0.2242009, -0.002064811, 1, 0, 0.1019608, 1,
2.087676, 1.090226, -0.3392797, 1, 0, 0.09411765, 1,
2.099746, 0.5194732, 3.032868, 1, 0, 0.09019608, 1,
2.112142, 1.006014, 1.030665, 1, 0, 0.08235294, 1,
2.182557, -1.00852, 2.254796, 1, 0, 0.07843138, 1,
2.219296, 1.174074, 1.728486, 1, 0, 0.07058824, 1,
2.231849, -0.7876687, 3.904062, 1, 0, 0.06666667, 1,
2.305867, 0.348355, 1.054927, 1, 0, 0.05882353, 1,
2.346124, 0.05582208, 2.200295, 1, 0, 0.05490196, 1,
2.410031, 0.3139428, 0.8558604, 1, 0, 0.04705882, 1,
2.432169, -0.7368785, 2.953811, 1, 0, 0.04313726, 1,
2.474977, -1.270919, 2.038148, 1, 0, 0.03529412, 1,
2.477965, -2.122717, 0.9700156, 1, 0, 0.03137255, 1,
2.484434, -0.05157974, 1.273606, 1, 0, 0.02352941, 1,
2.599142, -2.191483, 1.608404, 1, 0, 0.01960784, 1,
2.673463, -1.019908, 2.65083, 1, 0, 0.01176471, 1,
2.95657, -1.378678, 2.676357, 1, 0, 0.007843138, 1
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
-0.004810214, -3.971744, -8.161761, 0, -0.5, 0.5, 0.5,
-0.004810214, -3.971744, -8.161761, 1, -0.5, 0.5, 0.5,
-0.004810214, -3.971744, -8.161761, 1, 1.5, 0.5, 0.5,
-0.004810214, -3.971744, -8.161761, 0, 1.5, 0.5, 0.5
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
-3.970098, -0.1948528, -8.161761, 0, -0.5, 0.5, 0.5,
-3.970098, -0.1948528, -8.161761, 1, -0.5, 0.5, 0.5,
-3.970098, -0.1948528, -8.161761, 1, 1.5, 0.5, 0.5,
-3.970098, -0.1948528, -8.161761, 0, 1.5, 0.5, 0.5
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
-3.970098, -3.971744, -0.2877595, 0, -0.5, 0.5, 0.5,
-3.970098, -3.971744, -0.2877595, 1, -0.5, 0.5, 0.5,
-3.970098, -3.971744, -0.2877595, 1, 1.5, 0.5, 0.5,
-3.970098, -3.971744, -0.2877595, 0, 1.5, 0.5, 0.5
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
-2, -3.100154, -6.344684,
2, -3.100154, -6.344684,
-2, -3.100154, -6.344684,
-2, -3.245419, -6.64753,
-1, -3.100154, -6.344684,
-1, -3.245419, -6.64753,
0, -3.100154, -6.344684,
0, -3.245419, -6.64753,
1, -3.100154, -6.344684,
1, -3.245419, -6.64753,
2, -3.100154, -6.344684,
2, -3.245419, -6.64753
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
-2, -3.535949, -7.253222, 0, -0.5, 0.5, 0.5,
-2, -3.535949, -7.253222, 1, -0.5, 0.5, 0.5,
-2, -3.535949, -7.253222, 1, 1.5, 0.5, 0.5,
-2, -3.535949, -7.253222, 0, 1.5, 0.5, 0.5,
-1, -3.535949, -7.253222, 0, -0.5, 0.5, 0.5,
-1, -3.535949, -7.253222, 1, -0.5, 0.5, 0.5,
-1, -3.535949, -7.253222, 1, 1.5, 0.5, 0.5,
-1, -3.535949, -7.253222, 0, 1.5, 0.5, 0.5,
0, -3.535949, -7.253222, 0, -0.5, 0.5, 0.5,
0, -3.535949, -7.253222, 1, -0.5, 0.5, 0.5,
0, -3.535949, -7.253222, 1, 1.5, 0.5, 0.5,
0, -3.535949, -7.253222, 0, 1.5, 0.5, 0.5,
1, -3.535949, -7.253222, 0, -0.5, 0.5, 0.5,
1, -3.535949, -7.253222, 1, -0.5, 0.5, 0.5,
1, -3.535949, -7.253222, 1, 1.5, 0.5, 0.5,
1, -3.535949, -7.253222, 0, 1.5, 0.5, 0.5,
2, -3.535949, -7.253222, 0, -0.5, 0.5, 0.5,
2, -3.535949, -7.253222, 1, -0.5, 0.5, 0.5,
2, -3.535949, -7.253222, 1, 1.5, 0.5, 0.5,
2, -3.535949, -7.253222, 0, 1.5, 0.5, 0.5
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
-3.055032, -3, -6.344684,
-3.055032, 2, -6.344684,
-3.055032, -3, -6.344684,
-3.207543, -3, -6.64753,
-3.055032, -2, -6.344684,
-3.207543, -2, -6.64753,
-3.055032, -1, -6.344684,
-3.207543, -1, -6.64753,
-3.055032, 0, -6.344684,
-3.207543, 0, -6.64753,
-3.055032, 1, -6.344684,
-3.207543, 1, -6.64753,
-3.055032, 2, -6.344684,
-3.207543, 2, -6.64753
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
-3.512565, -3, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, -3, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, -3, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, -3, -7.253222, 0, 1.5, 0.5, 0.5,
-3.512565, -2, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, -2, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, -2, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, -2, -7.253222, 0, 1.5, 0.5, 0.5,
-3.512565, -1, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, -1, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, -1, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, -1, -7.253222, 0, 1.5, 0.5, 0.5,
-3.512565, 0, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, 0, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, 0, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, 0, -7.253222, 0, 1.5, 0.5, 0.5,
-3.512565, 1, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, 1, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, 1, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, 1, -7.253222, 0, 1.5, 0.5, 0.5,
-3.512565, 2, -7.253222, 0, -0.5, 0.5, 0.5,
-3.512565, 2, -7.253222, 1, -0.5, 0.5, 0.5,
-3.512565, 2, -7.253222, 1, 1.5, 0.5, 0.5,
-3.512565, 2, -7.253222, 0, 1.5, 0.5, 0.5
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
-3.055032, -3.100154, -6,
-3.055032, -3.100154, 4,
-3.055032, -3.100154, -6,
-3.207543, -3.245419, -6,
-3.055032, -3.100154, -4,
-3.207543, -3.245419, -4,
-3.055032, -3.100154, -2,
-3.207543, -3.245419, -2,
-3.055032, -3.100154, 0,
-3.207543, -3.245419, 0,
-3.055032, -3.100154, 2,
-3.207543, -3.245419, 2,
-3.055032, -3.100154, 4,
-3.207543, -3.245419, 4
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
"-6",
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
-3.512565, -3.535949, -6, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -6, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -6, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, -6, 0, 1.5, 0.5, 0.5,
-3.512565, -3.535949, -4, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -4, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -4, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, -4, 0, 1.5, 0.5, 0.5,
-3.512565, -3.535949, -2, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -2, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, -2, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, -2, 0, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 0, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 0, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 0, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 0, 0, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 2, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 2, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 2, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 2, 0, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 4, 0, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 4, 1, -0.5, 0.5, 0.5,
-3.512565, -3.535949, 4, 1, 1.5, 0.5, 0.5,
-3.512565, -3.535949, 4, 0, 1.5, 0.5, 0.5
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
-3.055032, -3.100154, -6.344684,
-3.055032, 2.710448, -6.344684,
-3.055032, -3.100154, 5.769165,
-3.055032, 2.710448, 5.769165,
-3.055032, -3.100154, -6.344684,
-3.055032, -3.100154, 5.769165,
-3.055032, 2.710448, -6.344684,
-3.055032, 2.710448, 5.769165,
-3.055032, -3.100154, -6.344684,
3.045412, -3.100154, -6.344684,
-3.055032, -3.100154, 5.769165,
3.045412, -3.100154, 5.769165,
-3.055032, 2.710448, -6.344684,
3.045412, 2.710448, -6.344684,
-3.055032, 2.710448, 5.769165,
3.045412, 2.710448, 5.769165,
3.045412, -3.100154, -6.344684,
3.045412, 2.710448, -6.344684,
3.045412, -3.100154, 5.769165,
3.045412, 2.710448, 5.769165,
3.045412, -3.100154, -6.344684,
3.045412, -3.100154, 5.769165,
3.045412, 2.710448, -6.344684,
3.045412, 2.710448, 5.769165
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
var radius = 7.879133;
var distance = 35.05516;
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
mvMatrix.translate( 0.004810214, 0.1948528, 0.2877595 );
mvMatrix.scale( 1.396468, 1.466126, 0.7032508 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05516);
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
phenyl_methylcarbama<-read.table("phenyl_methylcarbama.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenyl_methylcarbama$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenyl_methylcarbama' not found
```

```r
y<-phenyl_methylcarbama$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenyl_methylcarbama' not found
```

```r
z<-phenyl_methylcarbama$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenyl_methylcarbama' not found
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
-2.966191, 0.7321221, -1.722757, 0, 0, 1, 1, 1,
-2.598122, -0.9699833, -2.328983, 1, 0, 0, 1, 1,
-2.502862, 0.940087, -2.514771, 1, 0, 0, 1, 1,
-2.377953, -1.668584, -2.425815, 1, 0, 0, 1, 1,
-2.340542, -0.9515824, -2.167144, 1, 0, 0, 1, 1,
-2.261781, 1.922081, -1.024778, 1, 0, 0, 1, 1,
-2.245986, -1.144708, -1.370493, 0, 0, 0, 1, 1,
-2.169312, -0.3679067, -1.921633, 0, 0, 0, 1, 1,
-2.159271, -0.9842477, -2.425145, 0, 0, 0, 1, 1,
-2.151083, 2.083817, -1.930179, 0, 0, 0, 1, 1,
-2.145718, -0.09002447, -1.704888, 0, 0, 0, 1, 1,
-2.136677, 0.3045218, -0.4030314, 0, 0, 0, 1, 1,
-2.125887, -1.581027, -2.652123, 0, 0, 0, 1, 1,
-2.079943, -1.647983, -1.97339, 1, 1, 1, 1, 1,
-2.072676, -0.465453, -2.140031, 1, 1, 1, 1, 1,
-2.042542, 0.07937367, -2.107497, 1, 1, 1, 1, 1,
-2.022735, 0.04117891, -2.372159, 1, 1, 1, 1, 1,
-2.002959, 0.6899468, -3.006038, 1, 1, 1, 1, 1,
-1.962205, -0.3622674, -2.339353, 1, 1, 1, 1, 1,
-1.93598, -0.5900944, -1.703004, 1, 1, 1, 1, 1,
-1.914072, 0.2837965, -0.02138532, 1, 1, 1, 1, 1,
-1.906984, 0.8648024, -0.9095243, 1, 1, 1, 1, 1,
-1.905656, -0.7579936, -3.289639, 1, 1, 1, 1, 1,
-1.888142, 1.771289, 0.4701999, 1, 1, 1, 1, 1,
-1.877616, 0.08960377, -0.9722409, 1, 1, 1, 1, 1,
-1.864837, -0.5011928, -1.187358, 1, 1, 1, 1, 1,
-1.857082, 0.3081459, -3.155381, 1, 1, 1, 1, 1,
-1.855229, -0.9622928, -4.707521, 1, 1, 1, 1, 1,
-1.85456, 2.313567, 0.9201678, 0, 0, 1, 1, 1,
-1.843105, 0.651174, -1.951281, 1, 0, 0, 1, 1,
-1.839823, -0.8459714, -3.079934, 1, 0, 0, 1, 1,
-1.799181, -1.524577, -3.123286, 1, 0, 0, 1, 1,
-1.790554, -0.6310802, 0.2476119, 1, 0, 0, 1, 1,
-1.78671, 0.04035173, -2.168012, 1, 0, 0, 1, 1,
-1.779244, 0.4863185, -3.653544, 0, 0, 0, 1, 1,
-1.752043, -0.07669335, -3.228008, 0, 0, 0, 1, 1,
-1.749308, 0.8035281, -1.007761, 0, 0, 0, 1, 1,
-1.749048, 1.463601, -1.141328, 0, 0, 0, 1, 1,
-1.749014, -0.3495628, -1.941353, 0, 0, 0, 1, 1,
-1.744044, -0.8049772, -1.353357, 0, 0, 0, 1, 1,
-1.731391, -0.04751014, -1.508976, 0, 0, 0, 1, 1,
-1.730423, -0.2830234, -0.8141122, 1, 1, 1, 1, 1,
-1.728161, -1.267931, -3.090398, 1, 1, 1, 1, 1,
-1.716186, -1.607412, -2.368967, 1, 1, 1, 1, 1,
-1.702485, 1.18125, -2.491046, 1, 1, 1, 1, 1,
-1.683755, 1.502137, -1.031662, 1, 1, 1, 1, 1,
-1.672329, 1.347405, -1.858501, 1, 1, 1, 1, 1,
-1.649097, 0.6249191, -1.467889, 1, 1, 1, 1, 1,
-1.642635, 0.5801551, 0.382503, 1, 1, 1, 1, 1,
-1.641384, 1.442171, -0.3819153, 1, 1, 1, 1, 1,
-1.641252, 0.3596383, -0.1851322, 1, 1, 1, 1, 1,
-1.639761, -0.4201869, -2.00316, 1, 1, 1, 1, 1,
-1.636338, -0.09601276, -1.50241, 1, 1, 1, 1, 1,
-1.616374, -1.140536, -2.327161, 1, 1, 1, 1, 1,
-1.611245, 1.012288, -1.144376, 1, 1, 1, 1, 1,
-1.605816, 0.1258023, -2.223078, 1, 1, 1, 1, 1,
-1.598718, -0.5437293, -1.652569, 0, 0, 1, 1, 1,
-1.589983, 0.3245723, -0.5274412, 1, 0, 0, 1, 1,
-1.586979, -0.05421434, -1.163968, 1, 0, 0, 1, 1,
-1.584625, -0.828889, -1.460138, 1, 0, 0, 1, 1,
-1.584553, -0.8156416, -2.383928, 1, 0, 0, 1, 1,
-1.56937, 0.6464174, -0.5059831, 1, 0, 0, 1, 1,
-1.565818, -1.150027, 0.03790627, 0, 0, 0, 1, 1,
-1.557715, 0.382355, -4.058329, 0, 0, 0, 1, 1,
-1.54781, -0.8083012, -2.196677, 0, 0, 0, 1, 1,
-1.523629, 0.09518116, -0.6097824, 0, 0, 0, 1, 1,
-1.519876, 0.822672, -0.9099352, 0, 0, 0, 1, 1,
-1.518086, 2.579084, -1.099787, 0, 0, 0, 1, 1,
-1.515891, 0.5345231, -2.657483, 0, 0, 0, 1, 1,
-1.514392, -1.301005, -3.677823, 1, 1, 1, 1, 1,
-1.503307, -0.2060859, -1.475971, 1, 1, 1, 1, 1,
-1.48995, -0.500657, -2.335585, 1, 1, 1, 1, 1,
-1.488456, -0.2731352, -2.075314, 1, 1, 1, 1, 1,
-1.470187, -0.7650687, -3.086853, 1, 1, 1, 1, 1,
-1.464636, 0.1945836, -3.305459, 1, 1, 1, 1, 1,
-1.430769, 2.225587, -3.069621, 1, 1, 1, 1, 1,
-1.426948, 0.714305, -1.94096, 1, 1, 1, 1, 1,
-1.424328, -1.626212, -1.736142, 1, 1, 1, 1, 1,
-1.42152, -0.8776156, -3.211319, 1, 1, 1, 1, 1,
-1.411988, 0.8163878, -0.2918892, 1, 1, 1, 1, 1,
-1.402797, -0.0828471, -0.3654054, 1, 1, 1, 1, 1,
-1.399866, 0.1177395, -2.761422, 1, 1, 1, 1, 1,
-1.38756, -2.43274, -2.904545, 1, 1, 1, 1, 1,
-1.369259, 0.3585743, -2.423435, 1, 1, 1, 1, 1,
-1.360807, 0.4897705, 0.1345246, 0, 0, 1, 1, 1,
-1.360757, 0.4393428, -1.02022, 1, 0, 0, 1, 1,
-1.357535, 0.3212748, -0.897354, 1, 0, 0, 1, 1,
-1.356909, -0.3786897, -1.987782, 1, 0, 0, 1, 1,
-1.348528, 0.5001076, -0.7982672, 1, 0, 0, 1, 1,
-1.343441, -1.064948, -1.642078, 1, 0, 0, 1, 1,
-1.342397, -0.298449, -0.707634, 0, 0, 0, 1, 1,
-1.338696, -0.6017013, -0.8909416, 0, 0, 0, 1, 1,
-1.33544, 0.2407811, -1.969824, 0, 0, 0, 1, 1,
-1.329058, -0.7620632, -3.773002, 0, 0, 0, 1, 1,
-1.321582, 0.5751772, -0.5361313, 0, 0, 0, 1, 1,
-1.309453, -0.1769128, -2.731264, 0, 0, 0, 1, 1,
-1.303683, -0.3255362, -1.697216, 0, 0, 0, 1, 1,
-1.301203, 0.1987039, -1.784705, 1, 1, 1, 1, 1,
-1.298542, 0.6535926, -0.3684846, 1, 1, 1, 1, 1,
-1.296914, 0.06637887, -1.26281, 1, 1, 1, 1, 1,
-1.280329, 0.3761665, -0.2517946, 1, 1, 1, 1, 1,
-1.270246, 0.5606207, -1.097252, 1, 1, 1, 1, 1,
-1.268732, 0.4783297, -0.2558944, 1, 1, 1, 1, 1,
-1.262355, -0.01068961, -1.936347, 1, 1, 1, 1, 1,
-1.256478, 1.935561, 0.9634871, 1, 1, 1, 1, 1,
-1.253329, 0.8668395, -3.086319, 1, 1, 1, 1, 1,
-1.25083, 0.6319711, -1.489538, 1, 1, 1, 1, 1,
-1.248222, -1.780336, -2.98535, 1, 1, 1, 1, 1,
-1.24407, -1.877427, -1.847175, 1, 1, 1, 1, 1,
-1.243413, 1.289051, -2.288882, 1, 1, 1, 1, 1,
-1.237751, -1.957348, -1.422252, 1, 1, 1, 1, 1,
-1.235805, 0.1390219, 0.6285989, 1, 1, 1, 1, 1,
-1.232738, 0.786054, -1.569874, 0, 0, 1, 1, 1,
-1.225481, -0.7624611, -2.16919, 1, 0, 0, 1, 1,
-1.222316, 0.7597072, 0.6017289, 1, 0, 0, 1, 1,
-1.218788, -0.5379101, -3.49756, 1, 0, 0, 1, 1,
-1.215283, -1.615736, -2.001301, 1, 0, 0, 1, 1,
-1.214519, -0.3187265, -2.42712, 1, 0, 0, 1, 1,
-1.212475, -1.815547, -4.345814, 0, 0, 0, 1, 1,
-1.205986, -1.246982, -2.601073, 0, 0, 0, 1, 1,
-1.204357, -0.4383354, -1.163393, 0, 0, 0, 1, 1,
-1.201266, 0.6582133, -1.354911, 0, 0, 0, 1, 1,
-1.199512, -0.3244097, -1.841388, 0, 0, 0, 1, 1,
-1.194777, 0.6649983, -0.4709087, 0, 0, 0, 1, 1,
-1.19318, 0.7461487, 0.5944813, 0, 0, 0, 1, 1,
-1.189694, -0.3259588, -2.159429, 1, 1, 1, 1, 1,
-1.189465, 1.939934, -0.323402, 1, 1, 1, 1, 1,
-1.18383, -3.002241, -2.511026, 1, 1, 1, 1, 1,
-1.176928, -0.9003239, -2.421015, 1, 1, 1, 1, 1,
-1.166461, -0.8622199, -2.510247, 1, 1, 1, 1, 1,
-1.156846, 1.011112, 0.3227837, 1, 1, 1, 1, 1,
-1.152782, -1.489285, -3.072173, 1, 1, 1, 1, 1,
-1.144032, -1.409302, -0.9937463, 1, 1, 1, 1, 1,
-1.141289, 0.4271156, -1.64395, 1, 1, 1, 1, 1,
-1.128104, -0.01719913, -0.8938434, 1, 1, 1, 1, 1,
-1.120294, 0.3761629, 0.3238578, 1, 1, 1, 1, 1,
-1.11848, -0.1345846, -2.762003, 1, 1, 1, 1, 1,
-1.110313, 0.3897325, -0.6564766, 1, 1, 1, 1, 1,
-1.108938, 1.197296, -0.2498782, 1, 1, 1, 1, 1,
-1.1086, -0.2414329, -2.299526, 1, 1, 1, 1, 1,
-1.105443, -2.83016, -2.611692, 0, 0, 1, 1, 1,
-1.104478, 0.4181023, -1.389904, 1, 0, 0, 1, 1,
-1.097542, 1.920126, -1.234908, 1, 0, 0, 1, 1,
-1.092576, -0.1398615, -2.230764, 1, 0, 0, 1, 1,
-1.091681, -0.7918861, -1.495764, 1, 0, 0, 1, 1,
-1.086058, 0.5947275, -2.202146, 1, 0, 0, 1, 1,
-1.081587, 0.6833356, -2.712296, 0, 0, 0, 1, 1,
-1.078995, 0.7923723, -0.5938339, 0, 0, 0, 1, 1,
-1.077827, 1.699636, 0.02013635, 0, 0, 0, 1, 1,
-1.074804, -0.1923286, -1.28829, 0, 0, 0, 1, 1,
-1.061804, 2.216758, -0.2783822, 0, 0, 0, 1, 1,
-1.061646, 0.05097378, -0.947643, 0, 0, 0, 1, 1,
-1.057402, -1.882233, -2.261087, 0, 0, 0, 1, 1,
-1.057376, -1.909838, -3.09565, 1, 1, 1, 1, 1,
-1.057146, -0.7307272, -1.119178, 1, 1, 1, 1, 1,
-1.054926, -0.5875424, -0.67644, 1, 1, 1, 1, 1,
-1.042685, 0.7992936, -1.66535, 1, 1, 1, 1, 1,
-1.0421, 1.026114, -1.948846, 1, 1, 1, 1, 1,
-1.040111, 1.05298, 0.2093069, 1, 1, 1, 1, 1,
-1.027418, 1.446247, -0.4845009, 1, 1, 1, 1, 1,
-1.02668, -0.2480503, -2.27308, 1, 1, 1, 1, 1,
-1.021548, -0.4900801, -1.997865, 1, 1, 1, 1, 1,
-1.021068, 0.752516, 1.238556, 1, 1, 1, 1, 1,
-1.018264, -1.034449, -1.889763, 1, 1, 1, 1, 1,
-1.006556, 0.1631064, -0.8827225, 1, 1, 1, 1, 1,
-1.006437, 0.4803998, 0.1582186, 1, 1, 1, 1, 1,
-1.000657, 2.219331, 0.4204215, 1, 1, 1, 1, 1,
-0.9985243, -0.2631777, -2.101709, 1, 1, 1, 1, 1,
-0.9960972, -0.52013, -2.348112, 0, 0, 1, 1, 1,
-0.9912227, -0.1565206, -3.56321, 1, 0, 0, 1, 1,
-0.9874144, -1.261958, -2.433184, 1, 0, 0, 1, 1,
-0.9760863, 0.0466557, -1.80615, 1, 0, 0, 1, 1,
-0.9733512, -0.7712676, -3.918085, 1, 0, 0, 1, 1,
-0.9711794, 0.0126571, -2.799631, 1, 0, 0, 1, 1,
-0.9655094, 2.394997, -0.7405316, 0, 0, 0, 1, 1,
-0.9604301, 0.06291442, -0.8543877, 0, 0, 0, 1, 1,
-0.9555193, 0.008159383, -2.41946, 0, 0, 0, 1, 1,
-0.9546309, -1.278732, -2.191769, 0, 0, 0, 1, 1,
-0.9533786, 1.31884, -0.715685, 0, 0, 0, 1, 1,
-0.9462985, 0.2130604, -2.661638, 0, 0, 0, 1, 1,
-0.942228, -2.133235, -3.851788, 0, 0, 0, 1, 1,
-0.9410108, -0.307451, -0.9234047, 1, 1, 1, 1, 1,
-0.9391517, 1.431597, 0.3770793, 1, 1, 1, 1, 1,
-0.9361442, 0.9559255, -0.4927599, 1, 1, 1, 1, 1,
-0.9345946, 2.219947, 0.6265666, 1, 1, 1, 1, 1,
-0.932981, 1.582639, -0.04349706, 1, 1, 1, 1, 1,
-0.92931, -2.241524, -3.273325, 1, 1, 1, 1, 1,
-0.9246537, 0.491308, -1.772805, 1, 1, 1, 1, 1,
-0.9202374, -0.0346182, -0.7525658, 1, 1, 1, 1, 1,
-0.9201498, 1.189496, -0.6309146, 1, 1, 1, 1, 1,
-0.9178264, -0.3315517, -1.565681, 1, 1, 1, 1, 1,
-0.9129125, 0.6927662, -1.904491, 1, 1, 1, 1, 1,
-0.9054424, 0.892202, 0.2056526, 1, 1, 1, 1, 1,
-0.9011132, -1.287486, -1.9801, 1, 1, 1, 1, 1,
-0.8986279, -0.173266, -3.010073, 1, 1, 1, 1, 1,
-0.8985633, -0.374626, -2.86233, 1, 1, 1, 1, 1,
-0.8973232, 2.001925, 0.2941271, 0, 0, 1, 1, 1,
-0.8964956, -0.1879024, -2.651865, 1, 0, 0, 1, 1,
-0.8952138, -0.1617256, -1.510245, 1, 0, 0, 1, 1,
-0.8902403, -0.8087603, -2.001674, 1, 0, 0, 1, 1,
-0.8849153, -1.634838, -1.836019, 1, 0, 0, 1, 1,
-0.8812076, 1.256733, -1.225547, 1, 0, 0, 1, 1,
-0.8800451, -1.285387, -0.7699154, 0, 0, 0, 1, 1,
-0.8668414, 0.8789392, -0.8209119, 0, 0, 0, 1, 1,
-0.8545994, -1.481447, -2.051095, 0, 0, 0, 1, 1,
-0.8479462, -0.8663433, -3.158881, 0, 0, 0, 1, 1,
-0.8427303, -0.6144489, -1.604993, 0, 0, 0, 1, 1,
-0.8395767, 0.6216424, -1.383188, 0, 0, 0, 1, 1,
-0.8391601, -1.183366, -0.3094829, 0, 0, 0, 1, 1,
-0.8330977, 0.5096753, -1.872259, 1, 1, 1, 1, 1,
-0.8271927, -0.4707007, -2.760318, 1, 1, 1, 1, 1,
-0.8245942, -0.2974063, -0.6533579, 1, 1, 1, 1, 1,
-0.8231761, -0.2748876, -1.719367, 1, 1, 1, 1, 1,
-0.8222101, -0.7869227, -3.457934, 1, 1, 1, 1, 1,
-0.8155309, 2.391414, -0.6510609, 1, 1, 1, 1, 1,
-0.8079607, -1.020162, -2.734596, 1, 1, 1, 1, 1,
-0.8069735, -0.4776086, -1.540684, 1, 1, 1, 1, 1,
-0.7969577, -1.048545, -1.35878, 1, 1, 1, 1, 1,
-0.7931095, 1.180671, -0.008109499, 1, 1, 1, 1, 1,
-0.7908493, -0.1618081, -1.235531, 1, 1, 1, 1, 1,
-0.7904237, 1.960846, 0.5421884, 1, 1, 1, 1, 1,
-0.7896408, 0.526545, -0.291366, 1, 1, 1, 1, 1,
-0.7885255, 0.3554578, -2.180248, 1, 1, 1, 1, 1,
-0.7837835, 2.185274, -0.1354783, 1, 1, 1, 1, 1,
-0.7803882, 0.5344064, -1.220469, 0, 0, 1, 1, 1,
-0.780066, -1.375707, -2.565818, 1, 0, 0, 1, 1,
-0.7774304, -0.5346934, -1.381327, 1, 0, 0, 1, 1,
-0.762915, 0.8092319, 0.4340446, 1, 0, 0, 1, 1,
-0.7541074, -1.148782, -2.4912, 1, 0, 0, 1, 1,
-0.7507095, 0.7508191, -1.621526, 1, 0, 0, 1, 1,
-0.749158, -1.035196, -0.1575295, 0, 0, 0, 1, 1,
-0.7459123, -0.5068473, -0.8907326, 0, 0, 0, 1, 1,
-0.7420521, -0.374497, -1.465245, 0, 0, 0, 1, 1,
-0.7413907, -1.464651, -2.472303, 0, 0, 0, 1, 1,
-0.7334847, -1.555266, -2.502625, 0, 0, 0, 1, 1,
-0.7317499, -0.7981617, -2.777838, 0, 0, 0, 1, 1,
-0.7270666, -0.2864893, -1.697733, 0, 0, 0, 1, 1,
-0.7232116, 0.02089763, -0.3226357, 1, 1, 1, 1, 1,
-0.7224714, 2.238186, -0.7931071, 1, 1, 1, 1, 1,
-0.7208908, 0.550046, -1.328355, 1, 1, 1, 1, 1,
-0.7112458, -0.5328603, -2.701266, 1, 1, 1, 1, 1,
-0.707505, 0.6378783, -2.759576, 1, 1, 1, 1, 1,
-0.7066744, -1.454692, -3.222264, 1, 1, 1, 1, 1,
-0.6972474, -0.4188978, -2.273792, 1, 1, 1, 1, 1,
-0.6959084, 1.012018, 0.5098162, 1, 1, 1, 1, 1,
-0.6951909, -0.562463, -2.308947, 1, 1, 1, 1, 1,
-0.6947643, 0.06721506, -2.501504, 1, 1, 1, 1, 1,
-0.6903532, 0.4181232, -3.198103, 1, 1, 1, 1, 1,
-0.6871723, 0.7131977, 0.3540289, 1, 1, 1, 1, 1,
-0.6867666, -0.03839592, -0.9024628, 1, 1, 1, 1, 1,
-0.6843247, -1.041993, -3.233183, 1, 1, 1, 1, 1,
-0.6834717, 0.03705341, -1.566341, 1, 1, 1, 1, 1,
-0.6741947, 1.57721, -0.04337621, 0, 0, 1, 1, 1,
-0.6720866, -1.952364, -2.366509, 1, 0, 0, 1, 1,
-0.6706716, 0.5937017, -0.6156964, 1, 0, 0, 1, 1,
-0.6680667, 1.470724, 0.2997769, 1, 0, 0, 1, 1,
-0.6655922, 1.297703, -0.5322827, 1, 0, 0, 1, 1,
-0.6611317, -0.2367977, -1.744224, 1, 0, 0, 1, 1,
-0.6583558, -1.084267, -2.300967, 0, 0, 0, 1, 1,
-0.6576828, -0.9087942, -3.009353, 0, 0, 0, 1, 1,
-0.6562309, -0.1867315, -1.990805, 0, 0, 0, 1, 1,
-0.647214, -0.3187706, -1.702627, 0, 0, 0, 1, 1,
-0.6449185, -1.900276, -3.907521, 0, 0, 0, 1, 1,
-0.6437643, -1.16706, -0.9639927, 0, 0, 0, 1, 1,
-0.6404958, -1.108589, -2.139043, 0, 0, 0, 1, 1,
-0.6393644, 1.122295, 0.9086363, 1, 1, 1, 1, 1,
-0.6345038, -1.456577, -4.828808, 1, 1, 1, 1, 1,
-0.6320715, -0.4297334, -1.358144, 1, 1, 1, 1, 1,
-0.6278459, -0.874233, -2.015272, 1, 1, 1, 1, 1,
-0.6276547, -0.8683088, -2.762408, 1, 1, 1, 1, 1,
-0.624669, -1.072016, -1.127969, 1, 1, 1, 1, 1,
-0.623276, -0.1959285, -2.215067, 1, 1, 1, 1, 1,
-0.6198063, -1.248284, -2.755363, 1, 1, 1, 1, 1,
-0.617985, 1.14187, 0.006715683, 1, 1, 1, 1, 1,
-0.6174566, -1.398535, -1.613292, 1, 1, 1, 1, 1,
-0.6140083, -0.3938372, -2.123547, 1, 1, 1, 1, 1,
-0.6117859, -1.83181, -1.848061, 1, 1, 1, 1, 1,
-0.6112088, 0.08744672, -2.885756, 1, 1, 1, 1, 1,
-0.6102183, -0.9655437, -3.902049, 1, 1, 1, 1, 1,
-0.6071594, 0.371062, -2.428303, 1, 1, 1, 1, 1,
-0.6047067, 0.811993, -1.027081, 0, 0, 1, 1, 1,
-0.6010457, -2.761158, -1.89959, 1, 0, 0, 1, 1,
-0.5998952, -0.5943175, -2.770535, 1, 0, 0, 1, 1,
-0.5990087, 0.5240999, -0.2843056, 1, 0, 0, 1, 1,
-0.5981475, 1.217544, -0.6301482, 1, 0, 0, 1, 1,
-0.5974876, -1.231221, -5.886424, 1, 0, 0, 1, 1,
-0.5960648, -1.91094, -1.082136, 0, 0, 0, 1, 1,
-0.5938888, 0.6124828, -0.4233881, 0, 0, 0, 1, 1,
-0.5922982, -1.532809, -1.776988, 0, 0, 0, 1, 1,
-0.5894974, -0.06237518, -1.890365, 0, 0, 0, 1, 1,
-0.5886111, 1.441441, -0.3250968, 0, 0, 0, 1, 1,
-0.588093, 0.5330524, -0.8019597, 0, 0, 0, 1, 1,
-0.5880572, 0.210562, -0.6730869, 0, 0, 0, 1, 1,
-0.583256, 0.8332821, 0.4741755, 1, 1, 1, 1, 1,
-0.581822, -2.250153, -2.370952, 1, 1, 1, 1, 1,
-0.5786367, 0.581457, 0.04205173, 1, 1, 1, 1, 1,
-0.5730708, -0.2059257, -1.412569, 1, 1, 1, 1, 1,
-0.5726793, 0.8170902, -0.2764177, 1, 1, 1, 1, 1,
-0.5708545, -0.09794149, -1.439016, 1, 1, 1, 1, 1,
-0.5672114, 0.8125653, 0.3301164, 1, 1, 1, 1, 1,
-0.5649925, 1.071386, 1.375511, 1, 1, 1, 1, 1,
-0.56464, 0.0282226, -0.7391358, 1, 1, 1, 1, 1,
-0.5628854, -0.9261729, -2.246978, 1, 1, 1, 1, 1,
-0.560194, -0.1199033, -3.161753, 1, 1, 1, 1, 1,
-0.5583605, -0.9965034, -3.548126, 1, 1, 1, 1, 1,
-0.5558156, -0.1407924, -0.4309929, 1, 1, 1, 1, 1,
-0.5535861, -0.8851004, -4.042061, 1, 1, 1, 1, 1,
-0.553079, 0.4030432, -0.8046408, 1, 1, 1, 1, 1,
-0.5516039, 1.422171, 0.2491579, 0, 0, 1, 1, 1,
-0.5469508, 1.29134, -1.238744, 1, 0, 0, 1, 1,
-0.5422146, -0.4598202, -1.52173, 1, 0, 0, 1, 1,
-0.5393243, -0.6854545, -1.384026, 1, 0, 0, 1, 1,
-0.5351715, -0.07736786, -2.121342, 1, 0, 0, 1, 1,
-0.5346245, 0.1195399, -0.06567876, 1, 0, 0, 1, 1,
-0.5303685, -0.4497154, -0.5617995, 0, 0, 0, 1, 1,
-0.5274622, 0.9109172, -0.9001544, 0, 0, 0, 1, 1,
-0.5256553, 0.8236281, -0.493148, 0, 0, 0, 1, 1,
-0.5255237, -0.775723, -2.170988, 0, 0, 0, 1, 1,
-0.5232158, 1.844495, 0.4763759, 0, 0, 0, 1, 1,
-0.5185282, 1.291811, -1.459257, 0, 0, 0, 1, 1,
-0.5143588, -0.4271856, -0.9080337, 0, 0, 0, 1, 1,
-0.5136345, -0.4327294, -2.325416, 1, 1, 1, 1, 1,
-0.5130715, 0.7202512, 0.03513113, 1, 1, 1, 1, 1,
-0.5061269, 0.4929405, -1.109339, 1, 1, 1, 1, 1,
-0.502257, 0.4905887, 0.06500003, 1, 1, 1, 1, 1,
-0.5010838, 0.07027856, -0.7772682, 1, 1, 1, 1, 1,
-0.5004821, 0.4841772, -1.162925, 1, 1, 1, 1, 1,
-0.4992014, 0.05108982, -0.941327, 1, 1, 1, 1, 1,
-0.4958745, -2.213514, -2.605672, 1, 1, 1, 1, 1,
-0.4940395, 1.372609, 0.2504122, 1, 1, 1, 1, 1,
-0.4911922, -1.782149, -2.004573, 1, 1, 1, 1, 1,
-0.485595, -0.5348418, -1.639584, 1, 1, 1, 1, 1,
-0.4845119, -0.4380857, -3.080291, 1, 1, 1, 1, 1,
-0.4833942, 1.688013, 0.3725584, 1, 1, 1, 1, 1,
-0.4805425, 0.1577587, -1.383501, 1, 1, 1, 1, 1,
-0.478068, -0.9290403, -1.564904, 1, 1, 1, 1, 1,
-0.4759388, -0.7716861, -3.421293, 0, 0, 1, 1, 1,
-0.4728832, -0.1713615, -2.533595, 1, 0, 0, 1, 1,
-0.4696991, -0.728754, -2.694969, 1, 0, 0, 1, 1,
-0.4640789, -0.05134702, -0.6877787, 1, 0, 0, 1, 1,
-0.4531949, 2.100214, 0.8549056, 1, 0, 0, 1, 1,
-0.4516869, -0.7868245, -2.666371, 1, 0, 0, 1, 1,
-0.4503132, -0.6239387, -3.874061, 0, 0, 0, 1, 1,
-0.4500766, -0.3271369, -2.327163, 0, 0, 0, 1, 1,
-0.4433845, 0.3733622, 0.1143909, 0, 0, 0, 1, 1,
-0.4416081, -1.358155, -1.629813, 0, 0, 0, 1, 1,
-0.4384677, 0.03009881, -2.545724, 0, 0, 0, 1, 1,
-0.4291524, -0.4139257, -0.5313882, 0, 0, 0, 1, 1,
-0.4272848, -0.4085039, -2.627102, 0, 0, 0, 1, 1,
-0.42428, 0.1769162, 0.5855903, 1, 1, 1, 1, 1,
-0.4234095, -1.923611, -2.873552, 1, 1, 1, 1, 1,
-0.4206485, -0.3239781, -3.105736, 1, 1, 1, 1, 1,
-0.4142153, 0.8143951, -1.432817, 1, 1, 1, 1, 1,
-0.4082299, 0.3056617, -1.152423, 1, 1, 1, 1, 1,
-0.4067582, 1.004192, -0.9731914, 1, 1, 1, 1, 1,
-0.4063624, -0.3187179, -2.998873, 1, 1, 1, 1, 1,
-0.3991609, -0.004894191, -1.909599, 1, 1, 1, 1, 1,
-0.3968982, 2.448352, 1.158437, 1, 1, 1, 1, 1,
-0.3957536, 0.1830053, -0.03810729, 1, 1, 1, 1, 1,
-0.3909244, -0.2309852, -1.207345, 1, 1, 1, 1, 1,
-0.38962, -0.2291199, -3.419693, 1, 1, 1, 1, 1,
-0.3880355, 0.6881399, -0.3647654, 1, 1, 1, 1, 1,
-0.3794995, 0.06446905, -3.007018, 1, 1, 1, 1, 1,
-0.3682587, 0.7873359, -0.885884, 1, 1, 1, 1, 1,
-0.3674419, 0.3999214, -1.806838, 0, 0, 1, 1, 1,
-0.3661776, 0.7813999, -1.635185, 1, 0, 0, 1, 1,
-0.3585992, 1.615878, 1.529029, 1, 0, 0, 1, 1,
-0.3583137, -1.342463, -4.009466, 1, 0, 0, 1, 1,
-0.3564215, 0.4221834, 0.2186131, 1, 0, 0, 1, 1,
-0.3533724, 0.2214992, -0.3444192, 1, 0, 0, 1, 1,
-0.3525288, -0.7676379, -1.90897, 0, 0, 0, 1, 1,
-0.3509746, 0.6689042, -0.6996644, 0, 0, 0, 1, 1,
-0.3470942, -0.594566, -1.379209, 0, 0, 0, 1, 1,
-0.346069, 0.001758678, -0.6468671, 0, 0, 0, 1, 1,
-0.3459496, 1.146016, 1.154561, 0, 0, 0, 1, 1,
-0.3426339, 0.5094582, -0.588888, 0, 0, 0, 1, 1,
-0.3426122, -0.184461, -0.8000007, 0, 0, 0, 1, 1,
-0.342137, -0.06769502, -4.027328, 1, 1, 1, 1, 1,
-0.3403761, 1.75115, 0.9519796, 1, 1, 1, 1, 1,
-0.3388927, -0.9325252, -3.928761, 1, 1, 1, 1, 1,
-0.3363596, 0.4757285, -0.875913, 1, 1, 1, 1, 1,
-0.3334477, -0.7597248, -4.385401, 1, 1, 1, 1, 1,
-0.3320549, -0.6589123, -2.753184, 1, 1, 1, 1, 1,
-0.3296666, 0.8524588, -3.270719, 1, 1, 1, 1, 1,
-0.3289091, 0.4330068, -0.04650509, 1, 1, 1, 1, 1,
-0.3262635, 0.1500311, -0.1341089, 1, 1, 1, 1, 1,
-0.3246399, -1.594771, -2.827031, 1, 1, 1, 1, 1,
-0.3238968, -1.80412, -2.126544, 1, 1, 1, 1, 1,
-0.3235406, -0.4747972, -1.633884, 1, 1, 1, 1, 1,
-0.3222633, -0.810847, -3.705188, 1, 1, 1, 1, 1,
-0.3210602, -0.7756477, -2.423491, 1, 1, 1, 1, 1,
-0.3206833, -0.183367, -2.345762, 1, 1, 1, 1, 1,
-0.3194795, 1.705366, -0.7442697, 0, 0, 1, 1, 1,
-0.3163901, -0.1173788, -2.743557, 1, 0, 0, 1, 1,
-0.3118227, 0.1572113, -1.833891, 1, 0, 0, 1, 1,
-0.311165, -0.8829624, -4.141722, 1, 0, 0, 1, 1,
-0.3106737, -1.648553, -5.257068, 1, 0, 0, 1, 1,
-0.3081706, 0.476412, 0.7190849, 1, 0, 0, 1, 1,
-0.3053729, 0.3534195, 0.02513671, 0, 0, 0, 1, 1,
-0.2986013, 0.9075528, 1.029045, 0, 0, 0, 1, 1,
-0.2943594, -0.3319316, -2.955261, 0, 0, 0, 1, 1,
-0.2926164, -0.4092824, -2.374123, 0, 0, 0, 1, 1,
-0.2910675, -0.7489458, -1.687977, 0, 0, 0, 1, 1,
-0.2870928, -0.8245437, -3.522784, 0, 0, 0, 1, 1,
-0.2839752, -0.8611573, -1.257049, 0, 0, 0, 1, 1,
-0.2805631, 0.4445517, -2.646672, 1, 1, 1, 1, 1,
-0.2798111, 2.107878, -1.830935, 1, 1, 1, 1, 1,
-0.2769876, 0.07642679, 0.05099142, 1, 1, 1, 1, 1,
-0.2741219, -1.734524, -6.168269, 1, 1, 1, 1, 1,
-0.2729304, 0.3589201, -1.866456, 1, 1, 1, 1, 1,
-0.2682092, 0.7270449, -0.6959699, 1, 1, 1, 1, 1,
-0.2667243, -1.333292, -1.875909, 1, 1, 1, 1, 1,
-0.2658942, -1.408086, -3.864543, 1, 1, 1, 1, 1,
-0.2588285, -0.7087989, -3.136606, 1, 1, 1, 1, 1,
-0.2577923, -0.03767285, -3.224633, 1, 1, 1, 1, 1,
-0.2530845, 0.2112927, 0.1090079, 1, 1, 1, 1, 1,
-0.2494237, 1.365027, 0.5417892, 1, 1, 1, 1, 1,
-0.2476155, 0.1684817, -1.812227, 1, 1, 1, 1, 1,
-0.2461717, -0.4861212, -1.683835, 1, 1, 1, 1, 1,
-0.2404994, -0.2626516, -1.882571, 1, 1, 1, 1, 1,
-0.2395714, -0.1038487, -1.772584, 0, 0, 1, 1, 1,
-0.2394813, -0.5714095, -2.381357, 1, 0, 0, 1, 1,
-0.2383033, 0.3079778, -0.7938962, 1, 0, 0, 1, 1,
-0.2378253, -0.2029089, -3.46773, 1, 0, 0, 1, 1,
-0.2320522, 1.154081, 0.3968879, 1, 0, 0, 1, 1,
-0.2314734, 0.7208474, -2.092867, 1, 0, 0, 1, 1,
-0.2271634, -0.6973299, -1.738981, 0, 0, 0, 1, 1,
-0.2246671, -1.139745, -2.714434, 0, 0, 0, 1, 1,
-0.223084, 1.477044, 1.070617, 0, 0, 0, 1, 1,
-0.2194272, 0.2309713, 0.5425601, 0, 0, 0, 1, 1,
-0.2154427, -0.02024276, -2.715685, 0, 0, 0, 1, 1,
-0.2129251, 0.2310576, -1.234216, 0, 0, 0, 1, 1,
-0.2067161, -0.6938475, -2.377171, 0, 0, 0, 1, 1,
-0.2064653, -0.7357522, -3.29826, 1, 1, 1, 1, 1,
-0.2056101, 0.6446919, 0.327534, 1, 1, 1, 1, 1,
-0.201619, 1.158456, 0.02670204, 1, 1, 1, 1, 1,
-0.1979242, -0.5054496, -3.191065, 1, 1, 1, 1, 1,
-0.1965638, -0.6802328, -2.870787, 1, 1, 1, 1, 1,
-0.1962296, 0.9670846, -0.9102983, 1, 1, 1, 1, 1,
-0.1902571, -0.3576542, -2.67489, 1, 1, 1, 1, 1,
-0.1886329, -1.041408, -2.719669, 1, 1, 1, 1, 1,
-0.1859275, 1.978194, -0.5236959, 1, 1, 1, 1, 1,
-0.1816338, 0.2709584, 0.8921082, 1, 1, 1, 1, 1,
-0.1790339, 0.5088537, 1.440318, 1, 1, 1, 1, 1,
-0.1779275, 2.239085, -0.206668, 1, 1, 1, 1, 1,
-0.1779263, -1.649051, -4.194757, 1, 1, 1, 1, 1,
-0.1741315, -1.072612, -3.358177, 1, 1, 1, 1, 1,
-0.1738791, 0.8643991, -0.7533362, 1, 1, 1, 1, 1,
-0.1731996, -2.119572, -4.764779, 0, 0, 1, 1, 1,
-0.1719064, 0.3755196, -1.117355, 1, 0, 0, 1, 1,
-0.1701221, 1.880542, 0.9121687, 1, 0, 0, 1, 1,
-0.1686172, -2.464884, -2.571385, 1, 0, 0, 1, 1,
-0.1646299, 0.06576958, -0.8886163, 1, 0, 0, 1, 1,
-0.160998, -0.1914725, -1.340364, 1, 0, 0, 1, 1,
-0.1599697, -1.058088, -4.252787, 0, 0, 0, 1, 1,
-0.159173, 0.6391993, -0.8916016, 0, 0, 0, 1, 1,
-0.159088, 0.7301131, 1.440657, 0, 0, 0, 1, 1,
-0.1526891, 0.7597088, 0.03999515, 0, 0, 0, 1, 1,
-0.1526277, -1.532151, -2.982366, 0, 0, 0, 1, 1,
-0.1495882, 1.018185, -0.6286709, 0, 0, 0, 1, 1,
-0.1487713, 1.120845, -0.03473184, 0, 0, 0, 1, 1,
-0.1465242, 0.7734002, 0.3176564, 1, 1, 1, 1, 1,
-0.1434519, -0.3613946, -1.39354, 1, 1, 1, 1, 1,
-0.1423398, 2.071034, 0.5587524, 1, 1, 1, 1, 1,
-0.141767, 0.2816724, -0.3837744, 1, 1, 1, 1, 1,
-0.136019, 0.179501, 0.3689629, 1, 1, 1, 1, 1,
-0.1332666, 1.929925, -0.3862689, 1, 1, 1, 1, 1,
-0.1329783, 0.5138169, 0.7366268, 1, 1, 1, 1, 1,
-0.132649, 0.4745356, 1.880502, 1, 1, 1, 1, 1,
-0.1310737, -1.362869, -3.834687, 1, 1, 1, 1, 1,
-0.1302274, 0.5798678, 0.1590918, 1, 1, 1, 1, 1,
-0.1259924, 0.9761756, -0.1245807, 1, 1, 1, 1, 1,
-0.1247765, -0.9636129, -5.015062, 1, 1, 1, 1, 1,
-0.1242013, -0.2511614, -3.375051, 1, 1, 1, 1, 1,
-0.1233324, 0.3214913, -1.786963, 1, 1, 1, 1, 1,
-0.1221839, -0.634394, -4.452925, 1, 1, 1, 1, 1,
-0.1209943, 0.3795199, -0.6302581, 0, 0, 1, 1, 1,
-0.111151, -0.3782117, -4.017815, 1, 0, 0, 1, 1,
-0.1062702, 0.7105519, 0.8537678, 1, 0, 0, 1, 1,
-0.1052086, 0.3333226, 0.4089813, 1, 0, 0, 1, 1,
-0.1028326, -0.2001224, -2.632353, 1, 0, 0, 1, 1,
-0.1028226, 0.4260356, 0.6258583, 1, 0, 0, 1, 1,
-0.1017373, -1.875249, -3.987102, 0, 0, 0, 1, 1,
-0.1009166, 1.61638, -1.619352, 0, 0, 0, 1, 1,
-0.09584188, 0.2200431, -1.896326, 0, 0, 0, 1, 1,
-0.09373951, -0.7727526, -3.043364, 0, 0, 0, 1, 1,
-0.09293348, 1.67349, -0.8140954, 0, 0, 0, 1, 1,
-0.08836314, 0.4049518, 0.9907763, 0, 0, 0, 1, 1,
-0.08810522, 1.960737, -0.7195969, 0, 0, 0, 1, 1,
-0.08331738, 1.574605, 1.122174, 1, 1, 1, 1, 1,
-0.08239248, -0.08714151, -3.264292, 1, 1, 1, 1, 1,
-0.07816441, 0.2146779, 0.9867278, 1, 1, 1, 1, 1,
-0.07354648, -0.5350035, -2.319802, 1, 1, 1, 1, 1,
-0.07105777, 1.013068, -0.1772275, 1, 1, 1, 1, 1,
-0.06495789, -1.347989, -4.319308, 1, 1, 1, 1, 1,
-0.06377674, -0.07791062, -1.64218, 1, 1, 1, 1, 1,
-0.06254786, 1.006036, -0.5639021, 1, 1, 1, 1, 1,
-0.05933893, -1.208867, -2.942964, 1, 1, 1, 1, 1,
-0.05914109, -0.3851614, -2.870123, 1, 1, 1, 1, 1,
-0.05778425, -0.08178213, -3.401278, 1, 1, 1, 1, 1,
-0.05130073, -0.1813558, -1.430281, 1, 1, 1, 1, 1,
-0.05029174, 1.266102, -1.212783, 1, 1, 1, 1, 1,
-0.04949829, -1.136268, -2.829901, 1, 1, 1, 1, 1,
-0.04273184, -0.6066378, -2.673573, 1, 1, 1, 1, 1,
-0.03735663, 0.9829292, 1.118505, 0, 0, 1, 1, 1,
-0.03714798, 0.1819366, -2.000335, 1, 0, 0, 1, 1,
-0.03145905, -0.186682, -3.746691, 1, 0, 0, 1, 1,
-0.02903506, -0.445467, -2.742223, 1, 0, 0, 1, 1,
-0.02434248, 1.158305, 1.745723, 1, 0, 0, 1, 1,
-0.02269966, -1.16126, -3.553821, 1, 0, 0, 1, 1,
-0.01556662, -1.979293, -4.943073, 0, 0, 0, 1, 1,
-0.01506537, 0.2622242, 1.18173, 0, 0, 0, 1, 1,
-0.01406777, -0.1487638, -3.773116, 0, 0, 0, 1, 1,
-0.01374436, -0.552031, -2.729447, 0, 0, 0, 1, 1,
-0.01318452, 0.4164138, 1.742757, 0, 0, 0, 1, 1,
-0.01042423, -0.5337545, -2.135417, 0, 0, 0, 1, 1,
0.005537963, -0.3316037, 3.047318, 0, 0, 0, 1, 1,
0.0106409, 0.3814959, 0.6855728, 1, 1, 1, 1, 1,
0.01688509, 1.717276, -0.7545075, 1, 1, 1, 1, 1,
0.01956161, -0.4902193, 5.095701, 1, 1, 1, 1, 1,
0.02154535, 1.491821, -1.348022, 1, 1, 1, 1, 1,
0.02574131, 0.3511531, 1.027941, 1, 1, 1, 1, 1,
0.02580236, -0.5565397, 3.29381, 1, 1, 1, 1, 1,
0.02582232, -0.3153994, 3.461961, 1, 1, 1, 1, 1,
0.02943634, 0.7549418, 0.0973792, 1, 1, 1, 1, 1,
0.03215866, -1.168967, 4.549449, 1, 1, 1, 1, 1,
0.03253751, 0.3877219, 0.1042815, 1, 1, 1, 1, 1,
0.03963473, 1.067021, 0.01766546, 1, 1, 1, 1, 1,
0.04371993, -2.437592, 2.630702, 1, 1, 1, 1, 1,
0.04889083, 1.334137, -1.666457, 1, 1, 1, 1, 1,
0.05028405, -1.379803, 1.777767, 1, 1, 1, 1, 1,
0.05679492, -0.2230919, 3.073316, 1, 1, 1, 1, 1,
0.05769772, 0.5674119, 0.2702658, 0, 0, 1, 1, 1,
0.05878976, 0.01468845, 0.9554631, 1, 0, 0, 1, 1,
0.06139946, -0.01150328, 2.605432, 1, 0, 0, 1, 1,
0.0624121, -1.724684, 3.971859, 1, 0, 0, 1, 1,
0.06735582, -1.488538, 3.330674, 1, 0, 0, 1, 1,
0.0736715, 0.3247936, 1.340417, 1, 0, 0, 1, 1,
0.07644783, -0.8564022, 2.446533, 0, 0, 0, 1, 1,
0.07780683, -0.3570518, 1.752848, 0, 0, 0, 1, 1,
0.07987339, -2.49175, 2.239146, 0, 0, 0, 1, 1,
0.08283732, 0.5594206, -0.4325012, 0, 0, 0, 1, 1,
0.08594405, 0.1546357, 1.189133, 0, 0, 0, 1, 1,
0.08596014, -0.6708993, 2.429185, 0, 0, 0, 1, 1,
0.08701366, -0.521339, 3.43782, 0, 0, 0, 1, 1,
0.08810987, -1.008427, 2.01601, 1, 1, 1, 1, 1,
0.08950248, 1.438843, 0.8399789, 1, 1, 1, 1, 1,
0.09370393, -0.4583701, 0.988073, 1, 1, 1, 1, 1,
0.09549079, 2.32914, -1.433111, 1, 1, 1, 1, 1,
0.09986735, 2.625828, -1.068536, 1, 1, 1, 1, 1,
0.1003087, 0.2559627, -1.024566, 1, 1, 1, 1, 1,
0.1012828, 0.2562219, -0.45939, 1, 1, 1, 1, 1,
0.1031771, -1.154367, 2.061804, 1, 1, 1, 1, 1,
0.1034024, 1.426496, 0.1503953, 1, 1, 1, 1, 1,
0.1044828, -1.328226, 4.06064, 1, 1, 1, 1, 1,
0.1077885, -0.3162634, 4.249429, 1, 1, 1, 1, 1,
0.1138386, 0.2861001, 0.6285123, 1, 1, 1, 1, 1,
0.1182394, 1.697223, -1.337241, 1, 1, 1, 1, 1,
0.1200845, -0.2077269, 3.033689, 1, 1, 1, 1, 1,
0.1223473, 0.08823393, 2.498419, 1, 1, 1, 1, 1,
0.1233342, 0.357889, 0.6461911, 0, 0, 1, 1, 1,
0.123569, -0.8106202, 4.749438, 1, 0, 0, 1, 1,
0.1243108, -0.577726, 0.8211544, 1, 0, 0, 1, 1,
0.1261182, -0.4596356, 3.283334, 1, 0, 0, 1, 1,
0.1286286, -0.4701756, 3.544863, 1, 0, 0, 1, 1,
0.1290304, -0.7986853, 1.937271, 1, 0, 0, 1, 1,
0.1296736, 0.3895745, 1.386547, 0, 0, 0, 1, 1,
0.1304916, -1.37826, 2.138203, 0, 0, 0, 1, 1,
0.1313337, -1.267047, 2.833497, 0, 0, 0, 1, 1,
0.1316893, -1.232484, 2.982111, 0, 0, 0, 1, 1,
0.1321476, 1.208921, 0.4676243, 0, 0, 0, 1, 1,
0.1333345, 0.4746903, -1.119773, 0, 0, 0, 1, 1,
0.1336628, 0.1026552, 0.3187038, 0, 0, 0, 1, 1,
0.1418731, 0.8053749, 0.3875644, 1, 1, 1, 1, 1,
0.1464071, -1.491893, 3.27617, 1, 1, 1, 1, 1,
0.1481447, -0.144093, 1.857496, 1, 1, 1, 1, 1,
0.1557937, 0.009228486, 2.120065, 1, 1, 1, 1, 1,
0.1592993, -1.075803, 3.781992, 1, 1, 1, 1, 1,
0.1599524, 0.9539962, 1.057705, 1, 1, 1, 1, 1,
0.1606298, 1.454419, 1.069824, 1, 1, 1, 1, 1,
0.1606896, 0.07671681, 0.5850268, 1, 1, 1, 1, 1,
0.1642773, -0.6573421, 4.293919, 1, 1, 1, 1, 1,
0.1645051, 2.144069, -0.3236875, 1, 1, 1, 1, 1,
0.1652787, -0.6199985, 1.113396, 1, 1, 1, 1, 1,
0.1663755, 0.2392651, 1.848693, 1, 1, 1, 1, 1,
0.1683866, -0.6813276, 1.072496, 1, 1, 1, 1, 1,
0.1684771, -0.5537512, 2.666364, 1, 1, 1, 1, 1,
0.1718381, -1.240864, 3.000654, 1, 1, 1, 1, 1,
0.1719582, -0.9429376, 2.534029, 0, 0, 1, 1, 1,
0.1751265, 1.093836, 0.1000037, 1, 0, 0, 1, 1,
0.1806448, -1.179796, 3.794132, 1, 0, 0, 1, 1,
0.1846957, -0.03015615, 1.410958, 1, 0, 0, 1, 1,
0.1852272, -1.557813, 4.164176, 1, 0, 0, 1, 1,
0.1878944, -0.02574229, 3.652941, 1, 0, 0, 1, 1,
0.1966415, -1.062299, 3.000248, 0, 0, 0, 1, 1,
0.1985527, -0.2926852, 2.631978, 0, 0, 0, 1, 1,
0.2045367, -1.488912, 4.741346, 0, 0, 0, 1, 1,
0.2092181, -0.5650077, 3.738197, 0, 0, 0, 1, 1,
0.2129484, -0.2043906, 2.990912, 0, 0, 0, 1, 1,
0.2151791, 0.9084391, 0.6652033, 0, 0, 0, 1, 1,
0.215227, -1.787442, 4.454108, 0, 0, 0, 1, 1,
0.2179267, 1.171341, 0.6643785, 1, 1, 1, 1, 1,
0.2180495, -0.03942779, 0.696049, 1, 1, 1, 1, 1,
0.2248351, 1.571797, 0.9671937, 1, 1, 1, 1, 1,
0.2282474, -1.129901, 1.989486, 1, 1, 1, 1, 1,
0.2324074, -1.662109, 4.128873, 1, 1, 1, 1, 1,
0.2352971, 0.8165739, 0.5759567, 1, 1, 1, 1, 1,
0.2354174, -0.743087, 3.227497, 1, 1, 1, 1, 1,
0.2398761, 0.514101, -1.963878, 1, 1, 1, 1, 1,
0.2424127, 0.9977914, 0.410372, 1, 1, 1, 1, 1,
0.2432127, 0.887576, -0.2382298, 1, 1, 1, 1, 1,
0.24495, 0.808888, -0.03666639, 1, 1, 1, 1, 1,
0.2454679, 1.119292, -0.5216084, 1, 1, 1, 1, 1,
0.2514691, 0.178835, 0.6847568, 1, 1, 1, 1, 1,
0.2542215, 1.121783, 0.07936344, 1, 1, 1, 1, 1,
0.2551593, 0.3814075, 0.7085772, 1, 1, 1, 1, 1,
0.2601263, -0.2044464, 3.717692, 0, 0, 1, 1, 1,
0.2633754, 0.6457114, 0.7907138, 1, 0, 0, 1, 1,
0.2659774, 0.2289283, 2.034693, 1, 0, 0, 1, 1,
0.2688778, 0.8615503, 1.469095, 1, 0, 0, 1, 1,
0.2692695, 0.3494479, 2.335145, 1, 0, 0, 1, 1,
0.2697643, 1.195881, 0.3986391, 1, 0, 0, 1, 1,
0.2704287, -1.517007, 5.59275, 0, 0, 0, 1, 1,
0.2715526, -0.7427374, 2.037845, 0, 0, 0, 1, 1,
0.2718191, 0.1147725, 2.209705, 0, 0, 0, 1, 1,
0.2737252, 0.6907694, 1.867933, 0, 0, 0, 1, 1,
0.2740606, 0.6169719, -0.09923125, 0, 0, 0, 1, 1,
0.2791461, 0.1903678, 1.715712, 0, 0, 0, 1, 1,
0.2801085, 0.641875, 2.119333, 0, 0, 0, 1, 1,
0.2806436, -0.8052291, 3.331787, 1, 1, 1, 1, 1,
0.2906691, -0.9571646, 3.087359, 1, 1, 1, 1, 1,
0.2935003, 0.6576827, -0.1644194, 1, 1, 1, 1, 1,
0.2988198, -0.2333481, 3.029075, 1, 1, 1, 1, 1,
0.3028518, -0.3171915, 3.644646, 1, 1, 1, 1, 1,
0.3034921, 0.02375335, 0.08529822, 1, 1, 1, 1, 1,
0.3049914, 0.8007573, -0.4436085, 1, 1, 1, 1, 1,
0.3105674, -2.334202, 3.32212, 1, 1, 1, 1, 1,
0.3111649, -0.03860445, 2.187979, 1, 1, 1, 1, 1,
0.311894, -0.1504872, 3.753932, 1, 1, 1, 1, 1,
0.3127574, 0.7192224, 0.7911987, 1, 1, 1, 1, 1,
0.3153597, 1.328374, -0.6143439, 1, 1, 1, 1, 1,
0.3154272, -0.5973142, 2.254848, 1, 1, 1, 1, 1,
0.3170589, -0.003766558, 2.058661, 1, 1, 1, 1, 1,
0.3202941, -0.1138491, 3.770489, 1, 1, 1, 1, 1,
0.3217403, -0.4434317, 2.895464, 0, 0, 1, 1, 1,
0.3220571, -0.7791778, 2.584953, 1, 0, 0, 1, 1,
0.3259903, 0.1650438, 1.278142, 1, 0, 0, 1, 1,
0.3283279, -0.9858367, 2.420989, 1, 0, 0, 1, 1,
0.3344835, -0.3174843, 2.007999, 1, 0, 0, 1, 1,
0.3390612, -1.994563, 4.699126, 1, 0, 0, 1, 1,
0.3421359, -0.1531347, 1.85871, 0, 0, 0, 1, 1,
0.3432141, -0.6109831, 2.88157, 0, 0, 0, 1, 1,
0.348679, -0.9336168, 4.081254, 0, 0, 0, 1, 1,
0.349429, -0.78588, 1.356595, 0, 0, 0, 1, 1,
0.3510357, -1.113184, 0.5696752, 0, 0, 0, 1, 1,
0.3517296, -0.8741237, 2.703238, 0, 0, 0, 1, 1,
0.3523517, 1.017924, -0.09341796, 0, 0, 0, 1, 1,
0.3536631, 1.042879, 1.006537, 1, 1, 1, 1, 1,
0.3540236, 0.196516, 0.6106519, 1, 1, 1, 1, 1,
0.354074, -0.00482325, 1.521696, 1, 1, 1, 1, 1,
0.354076, 1.55699, -1.74985, 1, 1, 1, 1, 1,
0.3555293, -0.4375733, 2.236029, 1, 1, 1, 1, 1,
0.3575844, 0.211614, -0.01260815, 1, 1, 1, 1, 1,
0.3600496, -0.05344652, -0.1978417, 1, 1, 1, 1, 1,
0.374373, -1.243082, 3.618454, 1, 1, 1, 1, 1,
0.3831174, -0.3398481, 2.223917, 1, 1, 1, 1, 1,
0.3842813, 0.9920112, -0.04735464, 1, 1, 1, 1, 1,
0.3912214, 0.6557095, 0.7789558, 1, 1, 1, 1, 1,
0.3912421, -1.041434, 3.506016, 1, 1, 1, 1, 1,
0.3973517, -0.4674112, 2.819355, 1, 1, 1, 1, 1,
0.3983642, -0.6365741, 2.704682, 1, 1, 1, 1, 1,
0.3983692, -0.06740446, 1.722568, 1, 1, 1, 1, 1,
0.3991315, 2.500945, 1.403876, 0, 0, 1, 1, 1,
0.4015631, 0.8500943, -0.9224339, 1, 0, 0, 1, 1,
0.4022999, -0.00456779, 0.7103213, 1, 0, 0, 1, 1,
0.4081497, -1.297873, 2.406499, 1, 0, 0, 1, 1,
0.4089246, 0.6751071, 1.663524, 1, 0, 0, 1, 1,
0.4164679, -1.112309, 2.876947, 1, 0, 0, 1, 1,
0.4165323, -0.2964127, 1.860895, 0, 0, 0, 1, 1,
0.4236809, -0.197915, 1.059442, 0, 0, 0, 1, 1,
0.4274699, 0.1965102, -0.9608877, 0, 0, 0, 1, 1,
0.4275076, -0.09672865, 1.846406, 0, 0, 0, 1, 1,
0.4358123, 0.1145516, 2.965376, 0, 0, 0, 1, 1,
0.436367, 0.1333738, 2.103443, 0, 0, 0, 1, 1,
0.439279, 0.9004501, 0.7204712, 0, 0, 0, 1, 1,
0.4399924, 0.07833015, 2.329974, 1, 1, 1, 1, 1,
0.4457417, 0.4083525, 1.987667, 1, 1, 1, 1, 1,
0.4514587, 0.6450183, 1.148607, 1, 1, 1, 1, 1,
0.4545508, 1.896405, 2.051128, 1, 1, 1, 1, 1,
0.4579563, 0.8330635, 2.28521, 1, 1, 1, 1, 1,
0.4611563, 1.47841, 0.2554022, 1, 1, 1, 1, 1,
0.4624763, 1.140478, -0.179037, 1, 1, 1, 1, 1,
0.4625489, -1.408998, 3.818358, 1, 1, 1, 1, 1,
0.4633601, 1.090507, -1.025522, 1, 1, 1, 1, 1,
0.4649398, 1.490594, 1.827009, 1, 1, 1, 1, 1,
0.4721011, 0.7113518, 0.08312093, 1, 1, 1, 1, 1,
0.4745436, 0.2638936, 0.6363935, 1, 1, 1, 1, 1,
0.476335, -0.4230861, 1.292395, 1, 1, 1, 1, 1,
0.4846011, -0.204081, 4.087231, 1, 1, 1, 1, 1,
0.4934882, 0.7726011, 0.02096673, 1, 1, 1, 1, 1,
0.4969325, -1.138614, 2.078304, 0, 0, 1, 1, 1,
0.4981852, -0.03882824, 0.2069298, 1, 0, 0, 1, 1,
0.5032392, -2.189527, 1.718282, 1, 0, 0, 1, 1,
0.5068429, 0.4842946, 1.793666, 1, 0, 0, 1, 1,
0.5074072, 1.007293, 1.33591, 1, 0, 0, 1, 1,
0.5076815, 1.035894, -1.066957, 1, 0, 0, 1, 1,
0.5080344, -0.2730318, 1.992278, 0, 0, 0, 1, 1,
0.5085825, 0.2133224, 1.753253, 0, 0, 0, 1, 1,
0.5118064, 1.178313, 1.172659, 0, 0, 0, 1, 1,
0.5161508, -0.4426915, 1.343687, 0, 0, 0, 1, 1,
0.5218536, -1.390389, 1.09972, 0, 0, 0, 1, 1,
0.526835, -0.856945, 2.273309, 0, 0, 0, 1, 1,
0.5273026, -1.454969, 1.830442, 0, 0, 0, 1, 1,
0.5363692, -0.2697968, 3.776692, 1, 1, 1, 1, 1,
0.5403695, 0.7352854, 0.7828737, 1, 1, 1, 1, 1,
0.5447407, 1.174972, -0.7165738, 1, 1, 1, 1, 1,
0.5467945, -0.07769385, -0.1935823, 1, 1, 1, 1, 1,
0.5498856, -0.1813759, 2.12589, 1, 1, 1, 1, 1,
0.5505887, 1.113481, 1.319127, 1, 1, 1, 1, 1,
0.5613279, -0.3931856, 2.832311, 1, 1, 1, 1, 1,
0.5615795, -1.248757, 3.96099, 1, 1, 1, 1, 1,
0.5620287, 0.1433482, 2.243427, 1, 1, 1, 1, 1,
0.5652258, -0.5121599, 2.761666, 1, 1, 1, 1, 1,
0.5665925, 0.08262026, 0.9376485, 1, 1, 1, 1, 1,
0.5683268, 0.411201, 2.102379, 1, 1, 1, 1, 1,
0.5744686, 0.7785589, 0.564935, 1, 1, 1, 1, 1,
0.5750561, -0.2527668, 2.889883, 1, 1, 1, 1, 1,
0.5791006, -0.2478779, 1.073139, 1, 1, 1, 1, 1,
0.5810203, 1.732313, 0.6829043, 0, 0, 1, 1, 1,
0.581301, 1.212149, -0.2122917, 1, 0, 0, 1, 1,
0.587787, -0.475971, 2.802994, 1, 0, 0, 1, 1,
0.5887128, -1.980404, 1.535293, 1, 0, 0, 1, 1,
0.5897591, 0.6018965, 1.920085, 1, 0, 0, 1, 1,
0.593033, 0.730395, 2.598401, 1, 0, 0, 1, 1,
0.5958369, 0.6251505, 0.6627247, 0, 0, 0, 1, 1,
0.6043412, -0.1421478, 1.436504, 0, 0, 0, 1, 1,
0.607061, -0.507193, 1.817907, 0, 0, 0, 1, 1,
0.6079114, 0.4697086, 0.5704238, 0, 0, 0, 1, 1,
0.6089581, -0.9041743, 3.857366, 0, 0, 0, 1, 1,
0.611929, 0.9595775, 0.07444068, 0, 0, 0, 1, 1,
0.6130428, -0.4458359, 1.117059, 0, 0, 0, 1, 1,
0.6179351, -1.625004, 2.983422, 1, 1, 1, 1, 1,
0.6181456, 0.09509662, 3.045692, 1, 1, 1, 1, 1,
0.6197605, 0.3935176, 1.856091, 1, 1, 1, 1, 1,
0.621054, 0.9064096, -0.4542363, 1, 1, 1, 1, 1,
0.6248549, 1.260258, 0.9380652, 1, 1, 1, 1, 1,
0.6272742, 0.1178209, -0.1047293, 1, 1, 1, 1, 1,
0.6327854, -0.9642416, 1.921143, 1, 1, 1, 1, 1,
0.6374804, -0.5901685, 2.873815, 1, 1, 1, 1, 1,
0.6416603, 0.763164, -0.4134946, 1, 1, 1, 1, 1,
0.6427129, -0.8189843, 2.78389, 1, 1, 1, 1, 1,
0.6565254, 0.1661126, 1.352664, 1, 1, 1, 1, 1,
0.6592687, -1.39111, 1.71301, 1, 1, 1, 1, 1,
0.6676375, -0.4606965, 1.578839, 1, 1, 1, 1, 1,
0.6678058, -0.8381561, 3.296536, 1, 1, 1, 1, 1,
0.6714452, 2.176248, 1.211417, 1, 1, 1, 1, 1,
0.6752192, 0.6541927, 1.566716, 0, 0, 1, 1, 1,
0.6753834, 0.6181974, 0.9206372, 1, 0, 0, 1, 1,
0.6850031, -0.7391886, 1.666752, 1, 0, 0, 1, 1,
0.6910955, 0.05446997, 1.161102, 1, 0, 0, 1, 1,
0.7060884, -2.321898, 2.626146, 1, 0, 0, 1, 1,
0.716749, -0.1491141, 0.9568844, 1, 0, 0, 1, 1,
0.7209831, -0.2281517, 2.944062, 0, 0, 0, 1, 1,
0.7222793, 0.6659808, 1.912619, 0, 0, 0, 1, 1,
0.7264059, 0.07140732, 2.692297, 0, 0, 0, 1, 1,
0.7311282, 2.254412, 0.9189371, 0, 0, 0, 1, 1,
0.7320585, -0.3773166, 3.365532, 0, 0, 0, 1, 1,
0.7377201, -1.001294, 1.841848, 0, 0, 0, 1, 1,
0.7430363, 0.4005604, 1.29879, 0, 0, 0, 1, 1,
0.7535608, 0.6120427, 0.9761999, 1, 1, 1, 1, 1,
0.757041, 0.5072015, 2.064518, 1, 1, 1, 1, 1,
0.7620274, 2.421579, -0.6617483, 1, 1, 1, 1, 1,
0.7621999, 0.1903842, 1.291079, 1, 1, 1, 1, 1,
0.7665185, 0.3590138, 0.0160306, 1, 1, 1, 1, 1,
0.7690345, 0.8777087, 0.5078496, 1, 1, 1, 1, 1,
0.7690607, -0.9708397, 1.504889, 1, 1, 1, 1, 1,
0.7731941, 0.8014882, -0.1713708, 1, 1, 1, 1, 1,
0.7734016, 1.379406, 0.4325252, 1, 1, 1, 1, 1,
0.7752013, -0.4227449, 2.744833, 1, 1, 1, 1, 1,
0.7889734, 0.6518326, -0.07796086, 1, 1, 1, 1, 1,
0.7895415, 0.223676, 1.866139, 1, 1, 1, 1, 1,
0.7923911, -1.234397, 2.451793, 1, 1, 1, 1, 1,
0.7938569, 0.4338957, 2.355783, 1, 1, 1, 1, 1,
0.8027682, -0.152731, 2.345262, 1, 1, 1, 1, 1,
0.8056166, 0.002938733, 3.336767, 0, 0, 1, 1, 1,
0.8058901, 0.3096978, 0.5532651, 1, 0, 0, 1, 1,
0.811215, 1.029499, 1.00315, 1, 0, 0, 1, 1,
0.8112273, -0.8406754, 3.023298, 1, 0, 0, 1, 1,
0.8142542, 0.4884776, 1.033433, 1, 0, 0, 1, 1,
0.8293402, -0.6607659, 3.395431, 1, 0, 0, 1, 1,
0.8324972, 2.015373, -0.638231, 0, 0, 0, 1, 1,
0.8332819, 1.382147, 2.666761, 0, 0, 0, 1, 1,
0.8355039, 0.5362793, 0.220323, 0, 0, 0, 1, 1,
0.8380826, 0.5566271, 1.944091, 0, 0, 0, 1, 1,
0.8414894, 0.6556519, 0.8496539, 0, 0, 0, 1, 1,
0.8422272, -0.7031313, 3.167202, 0, 0, 0, 1, 1,
0.8537233, -0.04417186, 2.386323, 0, 0, 0, 1, 1,
0.8539889, -1.162432, 3.740184, 1, 1, 1, 1, 1,
0.8591016, 0.04186307, 3.965758, 1, 1, 1, 1, 1,
0.86416, 0.6619449, 1.98087, 1, 1, 1, 1, 1,
0.865862, 1.826649, -1.147657, 1, 1, 1, 1, 1,
0.8802264, 1.241007, -0.5573963, 1, 1, 1, 1, 1,
0.8810939, -0.4255073, 1.947747, 1, 1, 1, 1, 1,
0.8888956, 0.05831442, -0.4639495, 1, 1, 1, 1, 1,
0.889068, -1.371899, 2.924634, 1, 1, 1, 1, 1,
0.8952451, -0.6331258, 2.179822, 1, 1, 1, 1, 1,
0.8956174, 0.7189404, 1.585382, 1, 1, 1, 1, 1,
0.897355, 0.499021, 2.979302, 1, 1, 1, 1, 1,
0.9088742, -0.3336833, 1.444545, 1, 1, 1, 1, 1,
0.9202511, 0.4908766, -0.04229424, 1, 1, 1, 1, 1,
0.9241711, 1.467632, -1.116862, 1, 1, 1, 1, 1,
0.9297517, -0.052286, 1.282068, 1, 1, 1, 1, 1,
0.9298438, 0.3425873, 0.5766372, 0, 0, 1, 1, 1,
0.9308801, 0.1471688, 2.170278, 1, 0, 0, 1, 1,
0.9363428, 1.100996, 1.408874, 1, 0, 0, 1, 1,
0.936654, 0.3101822, 2.325454, 1, 0, 0, 1, 1,
0.9371598, -1.79492, 1.941813, 1, 0, 0, 1, 1,
0.9371769, 0.5661393, 1.82336, 1, 0, 0, 1, 1,
0.9401011, 0.4833058, 1.793636, 0, 0, 0, 1, 1,
0.9403757, 1.495219, 0.2566584, 0, 0, 0, 1, 1,
0.9425603, 0.8711165, -0.7851325, 0, 0, 0, 1, 1,
0.9475875, -0.5540532, 0.9391962, 0, 0, 0, 1, 1,
0.9486429, 0.8520964, 1.142071, 0, 0, 0, 1, 1,
0.9541981, -0.7485595, 0.5812903, 0, 0, 0, 1, 1,
0.9599314, -0.9047428, 3.179584, 0, 0, 0, 1, 1,
0.9603047, -0.3713737, 2.600377, 1, 1, 1, 1, 1,
0.9643576, 0.2045907, 2.550867, 1, 1, 1, 1, 1,
0.9654349, 0.7958244, 1.556585, 1, 1, 1, 1, 1,
0.9665135, -0.6979919, -0.02666228, 1, 1, 1, 1, 1,
0.9758381, -1.151338, 1.39055, 1, 1, 1, 1, 1,
0.9780185, -1.192965, 3.583292, 1, 1, 1, 1, 1,
0.9821405, -0.8272457, 0.6069157, 1, 1, 1, 1, 1,
0.9857709, -1.861755, 2.279369, 1, 1, 1, 1, 1,
0.9865996, 0.314516, 1.895568, 1, 1, 1, 1, 1,
0.9867015, 1.966439, 0.03115057, 1, 1, 1, 1, 1,
0.9884573, 0.835819, 1.626738, 1, 1, 1, 1, 1,
0.9917299, -0.8303077, 3.543394, 1, 1, 1, 1, 1,
0.9942726, -1.321806, 2.558355, 1, 1, 1, 1, 1,
0.9952599, 0.9456111, -0.02330492, 1, 1, 1, 1, 1,
0.9998845, 0.2836263, 2.171105, 1, 1, 1, 1, 1,
1.002769, 0.04404082, 2.703687, 0, 0, 1, 1, 1,
1.006357, -0.5217589, 3.755221, 1, 0, 0, 1, 1,
1.007025, -0.1780109, 2.305628, 1, 0, 0, 1, 1,
1.034276, 0.5929587, 2.361196, 1, 0, 0, 1, 1,
1.034421, -0.9392892, 0.6829867, 1, 0, 0, 1, 1,
1.034888, -1.102553, 0.8507975, 1, 0, 0, 1, 1,
1.035089, 1.226153, 0.6979167, 0, 0, 0, 1, 1,
1.03654, 0.3282703, 0.8246301, 0, 0, 0, 1, 1,
1.038687, -0.4202147, 2.711633, 0, 0, 0, 1, 1,
1.053233, 0.263502, 1.225989, 0, 0, 0, 1, 1,
1.055661, -0.6634563, 1.700646, 0, 0, 0, 1, 1,
1.064893, -0.1218613, 3.501727, 0, 0, 0, 1, 1,
1.073686, 1.419216, -1.579775, 0, 0, 0, 1, 1,
1.074494, -0.1619986, -0.3928697, 1, 1, 1, 1, 1,
1.074577, 0.339146, 2.596512, 1, 1, 1, 1, 1,
1.075487, -0.8115, 3.410798, 1, 1, 1, 1, 1,
1.07683, 1.570608, -0.7058127, 1, 1, 1, 1, 1,
1.078045, -1.64388, 1.407418, 1, 1, 1, 1, 1,
1.085343, -0.575489, 2.179888, 1, 1, 1, 1, 1,
1.086994, -0.6996282, 2.073127, 1, 1, 1, 1, 1,
1.087304, -1.246287, 2.839956, 1, 1, 1, 1, 1,
1.105219, 0.0006899236, -0.3566603, 1, 1, 1, 1, 1,
1.105913, -0.5790435, 2.762118, 1, 1, 1, 1, 1,
1.10596, -1.123841, 1.864452, 1, 1, 1, 1, 1,
1.106273, -0.3293631, 1.981887, 1, 1, 1, 1, 1,
1.111878, 1.474021, 0.6517646, 1, 1, 1, 1, 1,
1.11717, 1.711264, 0.6982697, 1, 1, 1, 1, 1,
1.11884, 0.08034433, 2.412801, 1, 1, 1, 1, 1,
1.121249, -0.8348286, 2.670184, 0, 0, 1, 1, 1,
1.122988, -0.1360325, 2.727015, 1, 0, 0, 1, 1,
1.123482, 0.046014, 1.102876, 1, 0, 0, 1, 1,
1.130681, -2.366036, 4.070879, 1, 0, 0, 1, 1,
1.130803, 0.7224586, 1.078108, 1, 0, 0, 1, 1,
1.131271, -1.467151, 3.413287, 1, 0, 0, 1, 1,
1.14441, -0.05780668, 1.263159, 0, 0, 0, 1, 1,
1.144958, -0.313277, 0.8790003, 0, 0, 0, 1, 1,
1.158412, -1.156116, 3.47923, 0, 0, 0, 1, 1,
1.162075, -0.03418919, 1.506628, 0, 0, 0, 1, 1,
1.162367, -1.999701, 2.298138, 0, 0, 0, 1, 1,
1.17129, -0.2157685, 0.5560353, 0, 0, 0, 1, 1,
1.177645, -0.5315068, 1.832702, 0, 0, 0, 1, 1,
1.178721, 0.209347, 1.277991, 1, 1, 1, 1, 1,
1.179979, 1.574997, 3.198945, 1, 1, 1, 1, 1,
1.181006, -1.031552, 1.693795, 1, 1, 1, 1, 1,
1.18298, -1.420012, 2.559028, 1, 1, 1, 1, 1,
1.18324, -0.9616912, 2.62953, 1, 1, 1, 1, 1,
1.191379, 0.3718775, 1.155162, 1, 1, 1, 1, 1,
1.196035, 0.5876301, 2.080591, 1, 1, 1, 1, 1,
1.207725, 0.5588766, 2.192701, 1, 1, 1, 1, 1,
1.211756, -0.1095292, 2.25443, 1, 1, 1, 1, 1,
1.212492, 0.4268168, 0.1995402, 1, 1, 1, 1, 1,
1.216349, -0.1327619, 0.425316, 1, 1, 1, 1, 1,
1.216824, -3.015533, 2.811494, 1, 1, 1, 1, 1,
1.219803, -0.06471545, 1.51999, 1, 1, 1, 1, 1,
1.223797, -0.03369973, 1.813684, 1, 1, 1, 1, 1,
1.239526, 0.1504435, 0.9930596, 1, 1, 1, 1, 1,
1.246811, 0.1671231, 1.974114, 0, 0, 1, 1, 1,
1.250302, -0.8242397, 2.184483, 1, 0, 0, 1, 1,
1.25159, -0.970408, 3.339324, 1, 0, 0, 1, 1,
1.265996, -1.267095, 3.857664, 1, 0, 0, 1, 1,
1.274287, 1.778841, -1.08982, 1, 0, 0, 1, 1,
1.277847, -1.575323, 2.171728, 1, 0, 0, 1, 1,
1.280846, -0.7049187, 1.547674, 0, 0, 0, 1, 1,
1.284191, -0.02482763, 2.304094, 0, 0, 0, 1, 1,
1.284582, 0.7669539, 0.790207, 0, 0, 0, 1, 1,
1.306844, -0.08930448, -0.1387744, 0, 0, 0, 1, 1,
1.308086, 0.8349585, 1.912174, 0, 0, 0, 1, 1,
1.312193, 0.9709554, -0.1546074, 0, 0, 0, 1, 1,
1.312627, 1.133739, -0.1337288, 0, 0, 0, 1, 1,
1.314365, 0.2486752, -0.8260849, 1, 1, 1, 1, 1,
1.316548, -1.554031, 2.883364, 1, 1, 1, 1, 1,
1.32665, 0.3983338, 2.297577, 1, 1, 1, 1, 1,
1.326926, 1.068645, 1.923537, 1, 1, 1, 1, 1,
1.330401, 1.067383, 1.161674, 1, 1, 1, 1, 1,
1.352661, 0.2412468, 2.146587, 1, 1, 1, 1, 1,
1.359513, 0.9807061, 2.360145, 1, 1, 1, 1, 1,
1.363412, 2.122648, 0.6429675, 1, 1, 1, 1, 1,
1.370992, -1.297526, 1.199122, 1, 1, 1, 1, 1,
1.374853, -1.08655, 3.547832, 1, 1, 1, 1, 1,
1.377078, 0.8436043, 1.251769, 1, 1, 1, 1, 1,
1.377883, 1.576048, 1.433196, 1, 1, 1, 1, 1,
1.38137, 1.722071, 0.8699211, 1, 1, 1, 1, 1,
1.383937, -0.768105, 1.658273, 1, 1, 1, 1, 1,
1.394842, -0.8920088, 1.042549, 1, 1, 1, 1, 1,
1.400576, 1.063522, 0.2838167, 0, 0, 1, 1, 1,
1.400843, -0.3893554, 1.429703, 1, 0, 0, 1, 1,
1.407447, 1.593935, 1.768645, 1, 0, 0, 1, 1,
1.410129, -1.142698, 1.77575, 1, 0, 0, 1, 1,
1.417128, -0.3577832, 0.9383635, 1, 0, 0, 1, 1,
1.418755, -1.73079, 2.984489, 1, 0, 0, 1, 1,
1.421935, -0.4683781, 1.967843, 0, 0, 0, 1, 1,
1.428632, -0.6360506, 0.8661547, 0, 0, 0, 1, 1,
1.439803, 0.4077543, 0.4575005, 0, 0, 0, 1, 1,
1.448387, -0.01792204, 0.2332031, 0, 0, 0, 1, 1,
1.454016, 1.401121, 0.04600918, 0, 0, 0, 1, 1,
1.455481, 0.630254, 2.984316, 0, 0, 0, 1, 1,
1.469899, 0.9484281, -1.30183, 0, 0, 0, 1, 1,
1.503869, 0.8332934, 0.8377148, 1, 1, 1, 1, 1,
1.509908, -1.139505, 3.522153, 1, 1, 1, 1, 1,
1.517928, -0.9489967, -0.6903903, 1, 1, 1, 1, 1,
1.520436, -0.4116616, 2.962374, 1, 1, 1, 1, 1,
1.522472, 1.344428, 2.762388, 1, 1, 1, 1, 1,
1.525426, -0.9634909, 2.493743, 1, 1, 1, 1, 1,
1.547058, 0.8252804, 1.161735, 1, 1, 1, 1, 1,
1.554252, 0.08780091, 1.834147, 1, 1, 1, 1, 1,
1.557159, -0.6716501, 2.720029, 1, 1, 1, 1, 1,
1.559241, 0.441456, 1.876271, 1, 1, 1, 1, 1,
1.567354, -1.89236, 1.713168, 1, 1, 1, 1, 1,
1.58391, 0.4596178, 1.460258, 1, 1, 1, 1, 1,
1.586713, 0.5668247, 2.389913, 1, 1, 1, 1, 1,
1.587179, -1.471478, 0.2508108, 1, 1, 1, 1, 1,
1.587571, 1.028165, 0.6188768, 1, 1, 1, 1, 1,
1.588329, 0.8669277, -0.4130428, 0, 0, 1, 1, 1,
1.611597, -0.3237878, 1.969593, 1, 0, 0, 1, 1,
1.616004, -0.05594784, 1.616875, 1, 0, 0, 1, 1,
1.619014, 0.4360055, 0.1462969, 1, 0, 0, 1, 1,
1.622713, -0.2502423, 2.796172, 1, 0, 0, 1, 1,
1.631539, 0.711966, 2.632346, 1, 0, 0, 1, 1,
1.637087, -0.7186689, 1.583858, 0, 0, 0, 1, 1,
1.647256, 0.2726405, 0.4740703, 0, 0, 0, 1, 1,
1.65313, 0.2847321, 1.372479, 0, 0, 0, 1, 1,
1.711916, 0.3773617, 2.002229, 0, 0, 0, 1, 1,
1.714776, 0.3197249, 1.530576, 0, 0, 0, 1, 1,
1.726044, -1.626271, 2.583292, 0, 0, 0, 1, 1,
1.735042, 0.9432327, 1.249743, 0, 0, 0, 1, 1,
1.755497, -0.7264698, 2.449854, 1, 1, 1, 1, 1,
1.768765, 0.7211064, 1.082617, 1, 1, 1, 1, 1,
1.770606, 0.534771, 2.638278, 1, 1, 1, 1, 1,
1.786547, 1.04913, 1.081378, 1, 1, 1, 1, 1,
1.800148, -0.03184223, 0.4850409, 1, 1, 1, 1, 1,
1.801899, -0.6049185, 3.255053, 1, 1, 1, 1, 1,
1.843674, 0.08123044, 1.71504, 1, 1, 1, 1, 1,
1.856966, -1.002038, 2.592862, 1, 1, 1, 1, 1,
1.879167, 0.3755784, 1.829753, 1, 1, 1, 1, 1,
1.898976, -0.2989999, 2.347103, 1, 1, 1, 1, 1,
1.928861, 1.33479, 1.812095, 1, 1, 1, 1, 1,
1.931881, 0.5823905, 0.5856397, 1, 1, 1, 1, 1,
1.947069, -1.120597, 2.417719, 1, 1, 1, 1, 1,
1.957491, -2.549247, 2.384384, 1, 1, 1, 1, 1,
1.999578, -0.1047633, 3.528721, 1, 1, 1, 1, 1,
2.010906, -2.197774, -0.07686126, 0, 0, 1, 1, 1,
2.01666, 0.2500421, 1.446652, 1, 0, 0, 1, 1,
2.041005, -0.9157102, 1.258641, 1, 0, 0, 1, 1,
2.080552, 0.2242009, -0.002064811, 1, 0, 0, 1, 1,
2.087676, 1.090226, -0.3392797, 1, 0, 0, 1, 1,
2.099746, 0.5194732, 3.032868, 1, 0, 0, 1, 1,
2.112142, 1.006014, 1.030665, 0, 0, 0, 1, 1,
2.182557, -1.00852, 2.254796, 0, 0, 0, 1, 1,
2.219296, 1.174074, 1.728486, 0, 0, 0, 1, 1,
2.231849, -0.7876687, 3.904062, 0, 0, 0, 1, 1,
2.305867, 0.348355, 1.054927, 0, 0, 0, 1, 1,
2.346124, 0.05582208, 2.200295, 0, 0, 0, 1, 1,
2.410031, 0.3139428, 0.8558604, 0, 0, 0, 1, 1,
2.432169, -0.7368785, 2.953811, 1, 1, 1, 1, 1,
2.474977, -1.270919, 2.038148, 1, 1, 1, 1, 1,
2.477965, -2.122717, 0.9700156, 1, 1, 1, 1, 1,
2.484434, -0.05157974, 1.273606, 1, 1, 1, 1, 1,
2.599142, -2.191483, 1.608404, 1, 1, 1, 1, 1,
2.673463, -1.019908, 2.65083, 1, 1, 1, 1, 1,
2.95657, -1.378678, 2.676357, 1, 1, 1, 1, 1
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
var radius = 9.691964;
var distance = 34.04261;
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
mvMatrix.translate( 0.004810214, 0.1948528, 0.2877595 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04261);
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
