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
-3.320598, -0.3309994, -2.197134, 1, 0, 0, 1,
-3.171666, -1.963187, -2.083681, 1, 0.007843138, 0, 1,
-3.169017, -0.6591741, -1.908842, 1, 0.01176471, 0, 1,
-2.990881, 0.1028435, -0.9049429, 1, 0.01960784, 0, 1,
-2.810765, 0.2487002, -1.6671, 1, 0.02352941, 0, 1,
-2.582374, -0.6221191, -2.895775, 1, 0.03137255, 0, 1,
-2.54809, -0.467082, -0.6283152, 1, 0.03529412, 0, 1,
-2.493705, 0.8698228, -1.903185, 1, 0.04313726, 0, 1,
-2.409768, 0.2250702, -2.397932, 1, 0.04705882, 0, 1,
-2.297698, 0.429116, -2.92225, 1, 0.05490196, 0, 1,
-2.202918, -0.9759893, -0.7929392, 1, 0.05882353, 0, 1,
-2.159246, -0.8430833, -0.6188376, 1, 0.06666667, 0, 1,
-2.157771, -1.353793, -2.698681, 1, 0.07058824, 0, 1,
-2.146785, 0.9738111, -1.807505, 1, 0.07843138, 0, 1,
-2.131453, -0.1944957, -1.38697, 1, 0.08235294, 0, 1,
-2.123557, 0.3030135, -2.596376, 1, 0.09019608, 0, 1,
-2.111724, -0.05531788, -0.9065155, 1, 0.09411765, 0, 1,
-2.110665, 0.3017284, -1.440706, 1, 0.1019608, 0, 1,
-2.090305, 0.9378554, -0.3618952, 1, 0.1098039, 0, 1,
-2.085615, -0.1184929, -0.9800193, 1, 0.1137255, 0, 1,
-2.080633, -0.3936337, -3.33592, 1, 0.1215686, 0, 1,
-2.068899, -0.2869954, -2.315209, 1, 0.1254902, 0, 1,
-2.039061, -0.2682912, -2.430841, 1, 0.1333333, 0, 1,
-2.007883, -0.457846, -1.237917, 1, 0.1372549, 0, 1,
-1.945023, 0.2454984, -0.2971416, 1, 0.145098, 0, 1,
-1.916501, -0.01433607, -2.15473, 1, 0.1490196, 0, 1,
-1.912569, -0.1469035, -1.035567, 1, 0.1568628, 0, 1,
-1.896075, -0.4051055, -1.319936, 1, 0.1607843, 0, 1,
-1.882624, -0.1119094, -1.697074, 1, 0.1686275, 0, 1,
-1.862896, -1.058929, -3.208137, 1, 0.172549, 0, 1,
-1.856359, 1.19378, -1.678513, 1, 0.1803922, 0, 1,
-1.847169, 0.2858381, -2.162794, 1, 0.1843137, 0, 1,
-1.845081, 0.6372029, -1.501032, 1, 0.1921569, 0, 1,
-1.836603, -0.4262811, -0.6390824, 1, 0.1960784, 0, 1,
-1.824347, -1.759096, -3.472293, 1, 0.2039216, 0, 1,
-1.817464, 0.7587199, -1.544438, 1, 0.2117647, 0, 1,
-1.815789, -0.0535745, -1.763172, 1, 0.2156863, 0, 1,
-1.771002, -0.4301787, -2.002481, 1, 0.2235294, 0, 1,
-1.764083, 0.1971135, -3.229825, 1, 0.227451, 0, 1,
-1.747677, 0.3383813, -2.884793, 1, 0.2352941, 0, 1,
-1.736273, -2.065057, -1.880283, 1, 0.2392157, 0, 1,
-1.7299, -1.506608, -1.674609, 1, 0.2470588, 0, 1,
-1.71885, -0.2933105, -0.8165742, 1, 0.2509804, 0, 1,
-1.705505, 0.6007443, -1.045485, 1, 0.2588235, 0, 1,
-1.70074, -0.1053675, -0.9427193, 1, 0.2627451, 0, 1,
-1.686097, 0.6126702, -1.013397, 1, 0.2705882, 0, 1,
-1.679981, -0.8318745, -0.6405235, 1, 0.2745098, 0, 1,
-1.678886, 2.253114, -0.6129675, 1, 0.282353, 0, 1,
-1.653426, -1.132099, -2.053906, 1, 0.2862745, 0, 1,
-1.631918, -0.3491049, -1.293137, 1, 0.2941177, 0, 1,
-1.602038, -0.2506697, -1.429557, 1, 0.3019608, 0, 1,
-1.593933, -0.5798315, -2.466983, 1, 0.3058824, 0, 1,
-1.593435, -1.237421, -1.881243, 1, 0.3137255, 0, 1,
-1.593089, -2.112314, -0.9629625, 1, 0.3176471, 0, 1,
-1.590306, 1.244644, -2.423548, 1, 0.3254902, 0, 1,
-1.582505, -1.213507, -0.5426647, 1, 0.3294118, 0, 1,
-1.580084, -1.958669, -2.524727, 1, 0.3372549, 0, 1,
-1.565588, -1.194688, -1.161938, 1, 0.3411765, 0, 1,
-1.559142, 0.7693952, 0.4120655, 1, 0.3490196, 0, 1,
-1.549368, 1.864776, -1.635081, 1, 0.3529412, 0, 1,
-1.546178, -0.4888264, -1.437273, 1, 0.3607843, 0, 1,
-1.544272, -0.3716333, -2.47896, 1, 0.3647059, 0, 1,
-1.544229, 0.2971623, 0.8871737, 1, 0.372549, 0, 1,
-1.521717, 0.4577902, -1.641634, 1, 0.3764706, 0, 1,
-1.520197, 0.1992791, 0.06637448, 1, 0.3843137, 0, 1,
-1.517091, -0.4745457, -1.182892, 1, 0.3882353, 0, 1,
-1.515886, -1.97904, -1.997575, 1, 0.3960784, 0, 1,
-1.512464, -0.8371258, -1.30303, 1, 0.4039216, 0, 1,
-1.497896, 2.517044, -0.9512131, 1, 0.4078431, 0, 1,
-1.49142, -0.6013439, -3.107184, 1, 0.4156863, 0, 1,
-1.481885, -1.297415, -1.564489, 1, 0.4196078, 0, 1,
-1.474684, -0.1925402, -1.511848, 1, 0.427451, 0, 1,
-1.457945, 1.163312, -0.2552829, 1, 0.4313726, 0, 1,
-1.455517, -0.08735078, -3.330512, 1, 0.4392157, 0, 1,
-1.455174, 1.669612, 0.04796692, 1, 0.4431373, 0, 1,
-1.425252, -0.831677, -2.874816, 1, 0.4509804, 0, 1,
-1.420675, -0.9205643, -2.2718, 1, 0.454902, 0, 1,
-1.407312, -0.7956191, -2.029027, 1, 0.4627451, 0, 1,
-1.390121, 1.063419, 0.07012681, 1, 0.4666667, 0, 1,
-1.389842, 0.09632687, -0.009757102, 1, 0.4745098, 0, 1,
-1.381876, -0.8102142, -1.456841, 1, 0.4784314, 0, 1,
-1.377477, 1.32876, -1.095899, 1, 0.4862745, 0, 1,
-1.374236, -0.2579505, -1.950563, 1, 0.4901961, 0, 1,
-1.372913, -0.7916875, -1.75545, 1, 0.4980392, 0, 1,
-1.372427, -0.648617, -0.991026, 1, 0.5058824, 0, 1,
-1.368416, -2.424027, -2.024389, 1, 0.509804, 0, 1,
-1.362566, -1.360101, -3.071514, 1, 0.5176471, 0, 1,
-1.359973, -0.1644588, -2.099844, 1, 0.5215687, 0, 1,
-1.35237, -1.92159, -0.9861284, 1, 0.5294118, 0, 1,
-1.345384, -2.039419, -2.808038, 1, 0.5333334, 0, 1,
-1.333168, -0.1948964, -1.352768, 1, 0.5411765, 0, 1,
-1.319683, 0.4184772, -2.244315, 1, 0.5450981, 0, 1,
-1.301573, 0.6462323, -0.9725206, 1, 0.5529412, 0, 1,
-1.296909, 1.800478, -1.972876, 1, 0.5568628, 0, 1,
-1.25898, -0.5977059, -3.114354, 1, 0.5647059, 0, 1,
-1.257128, 1.154387, -1.164788, 1, 0.5686275, 0, 1,
-1.247654, -1.115667, -1.610829, 1, 0.5764706, 0, 1,
-1.24551, -0.005993304, -0.4346777, 1, 0.5803922, 0, 1,
-1.233793, -0.8379794, -2.87786, 1, 0.5882353, 0, 1,
-1.229263, 0.01165169, -1.642072, 1, 0.5921569, 0, 1,
-1.222185, 0.8865468, -0.8805979, 1, 0.6, 0, 1,
-1.217847, 1.330204, -0.2355028, 1, 0.6078432, 0, 1,
-1.217439, 2.219399, 1.938246, 1, 0.6117647, 0, 1,
-1.21482, 1.324949, 0.1515002, 1, 0.6196079, 0, 1,
-1.205825, 0.1315372, 0.250189, 1, 0.6235294, 0, 1,
-1.187334, 1.184351, -2.384252, 1, 0.6313726, 0, 1,
-1.182727, 1.11919, -2.089302, 1, 0.6352941, 0, 1,
-1.176989, 0.9326316, -1.028245, 1, 0.6431373, 0, 1,
-1.175337, 0.06871116, -1.003251, 1, 0.6470588, 0, 1,
-1.173385, 1.175874, -0.1808111, 1, 0.654902, 0, 1,
-1.171713, -0.3275132, -2.610081, 1, 0.6588235, 0, 1,
-1.163248, 0.5893992, -2.009226, 1, 0.6666667, 0, 1,
-1.160207, -0.9539659, -0.8411525, 1, 0.6705883, 0, 1,
-1.156098, 0.08020328, -0.1613865, 1, 0.6784314, 0, 1,
-1.155844, 0.8923619, -0.09739745, 1, 0.682353, 0, 1,
-1.155621, -1.959017, -4.123465, 1, 0.6901961, 0, 1,
-1.154472, -1.176173, -1.128687, 1, 0.6941177, 0, 1,
-1.150611, -0.8768679, -0.3123677, 1, 0.7019608, 0, 1,
-1.150355, 0.5063055, -2.414371, 1, 0.7098039, 0, 1,
-1.146461, -1.380932, -3.145026, 1, 0.7137255, 0, 1,
-1.143163, 1.488669, -0.2726617, 1, 0.7215686, 0, 1,
-1.140184, 0.1191626, -2.19501, 1, 0.7254902, 0, 1,
-1.139614, -0.6264355, -1.921438, 1, 0.7333333, 0, 1,
-1.134623, -0.2515396, -1.556087, 1, 0.7372549, 0, 1,
-1.131939, -0.3865327, -1.392815, 1, 0.7450981, 0, 1,
-1.13124, -0.6933051, -2.310224, 1, 0.7490196, 0, 1,
-1.130512, -0.5630068, -3.414798, 1, 0.7568628, 0, 1,
-1.123632, 0.7724094, -0.4416386, 1, 0.7607843, 0, 1,
-1.122685, -0.4211954, -1.793471, 1, 0.7686275, 0, 1,
-1.120348, -1.227146, -1.636812, 1, 0.772549, 0, 1,
-1.11302, 0.7819327, 0.08202464, 1, 0.7803922, 0, 1,
-1.112449, -0.4204787, -0.5854796, 1, 0.7843137, 0, 1,
-1.112226, -0.7061083, -2.753104, 1, 0.7921569, 0, 1,
-1.111664, -0.2091595, -1.919593, 1, 0.7960784, 0, 1,
-1.107903, -0.910413, -1.226978, 1, 0.8039216, 0, 1,
-1.106828, -1.515618, -2.5504, 1, 0.8117647, 0, 1,
-1.10566, 0.986917, -0.1483593, 1, 0.8156863, 0, 1,
-1.103339, -1.950213, -2.609423, 1, 0.8235294, 0, 1,
-1.1008, 1.240547, -2.763256, 1, 0.827451, 0, 1,
-1.098737, -0.2283276, -1.395177, 1, 0.8352941, 0, 1,
-1.098559, -0.9619728, -2.220376, 1, 0.8392157, 0, 1,
-1.082448, 0.8592464, -0.6825113, 1, 0.8470588, 0, 1,
-1.072154, -1.067311, -2.424281, 1, 0.8509804, 0, 1,
-1.070448, 0.4457059, -2.709999, 1, 0.8588235, 0, 1,
-1.068222, 1.356158, -1.314186, 1, 0.8627451, 0, 1,
-1.06627, 1.340722, -1.095054, 1, 0.8705882, 0, 1,
-1.064379, 0.1193488, -1.295711, 1, 0.8745098, 0, 1,
-1.063222, -2.309425, -2.199307, 1, 0.8823529, 0, 1,
-1.06035, -1.606501, -1.143927, 1, 0.8862745, 0, 1,
-1.055339, -0.3853903, -3.458047, 1, 0.8941177, 0, 1,
-1.054781, -0.2221971, -1.085763, 1, 0.8980392, 0, 1,
-1.054475, 0.4255708, -1.110466, 1, 0.9058824, 0, 1,
-1.051648, -0.5112752, -0.3806689, 1, 0.9137255, 0, 1,
-1.051362, -2.002875, -2.018456, 1, 0.9176471, 0, 1,
-1.046059, 0.4970645, -3.287386, 1, 0.9254902, 0, 1,
-1.03563, -1.307487, -2.006846, 1, 0.9294118, 0, 1,
-1.035377, 0.8718587, -1.006836, 1, 0.9372549, 0, 1,
-1.027271, 1.077334, -1.203326, 1, 0.9411765, 0, 1,
-1.022318, 1.149705, -0.5691155, 1, 0.9490196, 0, 1,
-1.021692, 1.090361, 0.1866469, 1, 0.9529412, 0, 1,
-1.019141, -1.153794, -2.554646, 1, 0.9607843, 0, 1,
-1.013732, 0.03195698, -0.5214261, 1, 0.9647059, 0, 1,
-1.007897, -0.9970711, -1.934336, 1, 0.972549, 0, 1,
-1.004774, 0.9680334, -0.6788181, 1, 0.9764706, 0, 1,
-1.000442, -1.046829, -3.309874, 1, 0.9843137, 0, 1,
-0.9995776, -0.7277308, -2.981473, 1, 0.9882353, 0, 1,
-0.9938439, 0.5490007, -1.790221, 1, 0.9960784, 0, 1,
-0.9856831, -1.576645, -2.247581, 0.9960784, 1, 0, 1,
-0.9856415, 0.1945633, -0.4719228, 0.9921569, 1, 0, 1,
-0.9777032, -2.011425, -4.60783, 0.9843137, 1, 0, 1,
-0.9730541, -0.1329189, -2.489379, 0.9803922, 1, 0, 1,
-0.9648377, -1.010238, -3.796013, 0.972549, 1, 0, 1,
-0.964189, -0.426838, -2.573591, 0.9686275, 1, 0, 1,
-0.9526637, -1.433782, -2.757356, 0.9607843, 1, 0, 1,
-0.9512229, -0.02009727, -1.97313, 0.9568627, 1, 0, 1,
-0.9437684, 0.5277244, -1.132079, 0.9490196, 1, 0, 1,
-0.9391319, 0.490127, -0.00167846, 0.945098, 1, 0, 1,
-0.9159884, 0.2233072, -0.8823431, 0.9372549, 1, 0, 1,
-0.9097888, 2.877982, -0.630748, 0.9333333, 1, 0, 1,
-0.9085585, 1.137132, 0.2397434, 0.9254902, 1, 0, 1,
-0.8988189, -0.09661224, -1.787337, 0.9215686, 1, 0, 1,
-0.8888135, -0.3496368, -1.203224, 0.9137255, 1, 0, 1,
-0.8875864, -1.047799, -2.385727, 0.9098039, 1, 0, 1,
-0.8856212, 0.4598196, -3.102886, 0.9019608, 1, 0, 1,
-0.8841968, -0.4279978, -1.616363, 0.8941177, 1, 0, 1,
-0.8826007, -0.7045424, -1.757926, 0.8901961, 1, 0, 1,
-0.8784801, -0.1009184, -1.530768, 0.8823529, 1, 0, 1,
-0.8623703, 0.07955646, -1.523039, 0.8784314, 1, 0, 1,
-0.861236, -0.8378327, -1.998424, 0.8705882, 1, 0, 1,
-0.8605548, -0.9000012, -2.158078, 0.8666667, 1, 0, 1,
-0.8526738, 2.466307, 1.513949, 0.8588235, 1, 0, 1,
-0.8410951, 0.8755517, -1.913145, 0.854902, 1, 0, 1,
-0.8358899, 0.5559281, -1.67887, 0.8470588, 1, 0, 1,
-0.8341178, 0.440723, -1.548089, 0.8431373, 1, 0, 1,
-0.8310735, 1.217343, 0.2232474, 0.8352941, 1, 0, 1,
-0.821817, 0.3725039, -2.423118, 0.8313726, 1, 0, 1,
-0.8212615, 0.9145384, -1.559978, 0.8235294, 1, 0, 1,
-0.8171731, -1.831448, -3.572306, 0.8196079, 1, 0, 1,
-0.8101076, -0.6695342, -1.83913, 0.8117647, 1, 0, 1,
-0.8100586, 0.1998713, 0.710304, 0.8078431, 1, 0, 1,
-0.8083141, 0.890406, -1.172116, 0.8, 1, 0, 1,
-0.8077552, 0.9552388, -2.878426, 0.7921569, 1, 0, 1,
-0.8067515, -0.2572562, -1.342565, 0.7882353, 1, 0, 1,
-0.806513, 0.3605861, 0.04255534, 0.7803922, 1, 0, 1,
-0.8045088, 0.0300658, -1.88477, 0.7764706, 1, 0, 1,
-0.8042829, -0.1028671, -2.644563, 0.7686275, 1, 0, 1,
-0.8037194, -0.277062, -2.016107, 0.7647059, 1, 0, 1,
-0.8031346, -1.588024, -3.711473, 0.7568628, 1, 0, 1,
-0.797428, 0.2549815, -0.6161276, 0.7529412, 1, 0, 1,
-0.7959768, -0.3916597, -0.775044, 0.7450981, 1, 0, 1,
-0.7927307, -0.5534968, -2.630107, 0.7411765, 1, 0, 1,
-0.7922711, 0.2053726, -0.4058984, 0.7333333, 1, 0, 1,
-0.7871211, -0.09943024, -1.278844, 0.7294118, 1, 0, 1,
-0.7838909, -1.222692, -3.731682, 0.7215686, 1, 0, 1,
-0.7778907, 0.2085589, -0.9354093, 0.7176471, 1, 0, 1,
-0.7734228, 1.581459, -1.808913, 0.7098039, 1, 0, 1,
-0.7719769, 0.1538801, -3.769418, 0.7058824, 1, 0, 1,
-0.7691267, 0.545575, -1.001202, 0.6980392, 1, 0, 1,
-0.769025, -0.9428583, -2.975157, 0.6901961, 1, 0, 1,
-0.7646621, -1.040889, -1.354225, 0.6862745, 1, 0, 1,
-0.7613505, 1.730169, -1.365567, 0.6784314, 1, 0, 1,
-0.7519156, -1.155235, -1.412812, 0.6745098, 1, 0, 1,
-0.7516604, -0.4455561, -4.143934, 0.6666667, 1, 0, 1,
-0.749653, 0.6329534, -1.903866, 0.6627451, 1, 0, 1,
-0.7453434, -0.7087354, -2.856363, 0.654902, 1, 0, 1,
-0.7449522, 0.03057596, -2.430609, 0.6509804, 1, 0, 1,
-0.7441957, -2.199749, -1.949538, 0.6431373, 1, 0, 1,
-0.7376006, -0.6387074, -2.631411, 0.6392157, 1, 0, 1,
-0.7367871, 1.1029, -1.186847, 0.6313726, 1, 0, 1,
-0.7363456, -0.7395822, -3.969245, 0.627451, 1, 0, 1,
-0.7358977, -2.543311, -4.863922, 0.6196079, 1, 0, 1,
-0.7338071, 0.6103792, -0.4697088, 0.6156863, 1, 0, 1,
-0.730376, -0.7606265, -2.776306, 0.6078432, 1, 0, 1,
-0.7271703, -0.8167602, -0.6006333, 0.6039216, 1, 0, 1,
-0.7261069, -0.3187714, -1.826946, 0.5960785, 1, 0, 1,
-0.724631, 0.9350649, -0.8437449, 0.5882353, 1, 0, 1,
-0.7237201, 0.09897795, -0.01295086, 0.5843138, 1, 0, 1,
-0.7224368, -0.5081874, -1.486495, 0.5764706, 1, 0, 1,
-0.7217081, 0.9967801, -1.376302, 0.572549, 1, 0, 1,
-0.7181764, 0.1248737, -2.432575, 0.5647059, 1, 0, 1,
-0.7167533, 1.137402, -0.916559, 0.5607843, 1, 0, 1,
-0.715859, 0.1001244, -1.447968, 0.5529412, 1, 0, 1,
-0.713053, 1.489747, -0.5850657, 0.5490196, 1, 0, 1,
-0.7062403, -2.190773, -4.027439, 0.5411765, 1, 0, 1,
-0.7025305, 0.6612253, -1.934065, 0.5372549, 1, 0, 1,
-0.7008975, -0.9766983, -3.404333, 0.5294118, 1, 0, 1,
-0.6931946, 0.3774924, -1.029876, 0.5254902, 1, 0, 1,
-0.6931905, -0.7353659, -1.740258, 0.5176471, 1, 0, 1,
-0.6879877, 1.227164, -1.004485, 0.5137255, 1, 0, 1,
-0.6866428, 2.193734, -0.001847749, 0.5058824, 1, 0, 1,
-0.6865798, 0.09851087, -1.623464, 0.5019608, 1, 0, 1,
-0.6842991, 1.022563, -1.366664, 0.4941176, 1, 0, 1,
-0.6835588, 0.1585677, -0.4385126, 0.4862745, 1, 0, 1,
-0.6799176, -0.7205097, -2.993444, 0.4823529, 1, 0, 1,
-0.6745653, 0.5517575, -1.357092, 0.4745098, 1, 0, 1,
-0.6719105, 0.6210234, -1.801463, 0.4705882, 1, 0, 1,
-0.6714873, 0.3004146, -1.268743, 0.4627451, 1, 0, 1,
-0.6712306, 0.6605297, -0.9575178, 0.4588235, 1, 0, 1,
-0.6707409, -1.099237, -3.076751, 0.4509804, 1, 0, 1,
-0.6687495, 0.6978214, -1.783978, 0.4470588, 1, 0, 1,
-0.6635262, 0.6286204, -1.259602, 0.4392157, 1, 0, 1,
-0.6591933, 0.6731989, -2.795142, 0.4352941, 1, 0, 1,
-0.6535316, 2.541179, -0.3640387, 0.427451, 1, 0, 1,
-0.6508347, -2.461418, -3.625885, 0.4235294, 1, 0, 1,
-0.6481428, 0.04386126, -1.716523, 0.4156863, 1, 0, 1,
-0.646222, 2.040313, -2.717616, 0.4117647, 1, 0, 1,
-0.6425585, 1.491874, -0.2410342, 0.4039216, 1, 0, 1,
-0.6385084, -0.3558698, -1.333115, 0.3960784, 1, 0, 1,
-0.6366, 1.166881, -0.6571523, 0.3921569, 1, 0, 1,
-0.6336986, 0.2641446, -1.889732, 0.3843137, 1, 0, 1,
-0.6322696, -0.6320945, -1.370105, 0.3803922, 1, 0, 1,
-0.629185, -0.7665874, -0.5305911, 0.372549, 1, 0, 1,
-0.6202617, 0.9095193, -0.499723, 0.3686275, 1, 0, 1,
-0.6191465, 1.015281, -0.3601916, 0.3607843, 1, 0, 1,
-0.616142, 0.613978, -1.603182, 0.3568628, 1, 0, 1,
-0.6087053, -1.135994, -3.024892, 0.3490196, 1, 0, 1,
-0.605452, -1.639605, -1.266137, 0.345098, 1, 0, 1,
-0.6034967, -0.7287391, -0.9024, 0.3372549, 1, 0, 1,
-0.5986585, 1.206705, -0.4241928, 0.3333333, 1, 0, 1,
-0.5979089, 2.085843, -0.1373608, 0.3254902, 1, 0, 1,
-0.5968453, -0.5711761, -0.9802608, 0.3215686, 1, 0, 1,
-0.5964482, -0.05323242, -2.079561, 0.3137255, 1, 0, 1,
-0.5962572, -1.041747, -2.732473, 0.3098039, 1, 0, 1,
-0.5938464, -2.583697, -2.99109, 0.3019608, 1, 0, 1,
-0.5915754, 0.8008754, -1.102503, 0.2941177, 1, 0, 1,
-0.5866458, 1.557478, -1.654697, 0.2901961, 1, 0, 1,
-0.582674, 1.407376, -1.678776, 0.282353, 1, 0, 1,
-0.5792542, -0.5848813, -3.284746, 0.2784314, 1, 0, 1,
-0.5743037, -0.6494415, -2.694622, 0.2705882, 1, 0, 1,
-0.5721226, -2.700741, -2.326832, 0.2666667, 1, 0, 1,
-0.5697522, -0.3153213, -1.857928, 0.2588235, 1, 0, 1,
-0.5602101, -0.2870681, -2.423828, 0.254902, 1, 0, 1,
-0.5558471, -0.9249233, -2.026128, 0.2470588, 1, 0, 1,
-0.5552313, -0.6588708, -2.408338, 0.2431373, 1, 0, 1,
-0.5490055, 0.9014996, -1.622677, 0.2352941, 1, 0, 1,
-0.5476107, -0.3675311, -1.595052, 0.2313726, 1, 0, 1,
-0.5471298, 0.06905237, -1.622695, 0.2235294, 1, 0, 1,
-0.5448073, 0.7553109, -2.028705, 0.2196078, 1, 0, 1,
-0.5440724, -0.2334527, -1.674166, 0.2117647, 1, 0, 1,
-0.5425931, -0.2296826, -1.224352, 0.2078431, 1, 0, 1,
-0.5410423, -1.463157, -3.011146, 0.2, 1, 0, 1,
-0.5387422, 0.6370668, -1.202575, 0.1921569, 1, 0, 1,
-0.5370398, 0.2061415, -1.4216, 0.1882353, 1, 0, 1,
-0.5335777, 0.3835652, -1.558659, 0.1803922, 1, 0, 1,
-0.5218828, -2.440701, -2.051538, 0.1764706, 1, 0, 1,
-0.5193639, 0.2959405, -1.174278, 0.1686275, 1, 0, 1,
-0.5092378, -0.286441, -2.464601, 0.1647059, 1, 0, 1,
-0.5053877, 0.4898024, -1.30422, 0.1568628, 1, 0, 1,
-0.4996997, -2.445801, -2.761817, 0.1529412, 1, 0, 1,
-0.4990366, 0.2573719, 0.1779081, 0.145098, 1, 0, 1,
-0.498161, 0.7644683, 0.08616304, 0.1411765, 1, 0, 1,
-0.4979585, 0.5036256, -1.335018, 0.1333333, 1, 0, 1,
-0.4976243, 1.0782, 0.1608613, 0.1294118, 1, 0, 1,
-0.4971555, -0.483188, -2.696778, 0.1215686, 1, 0, 1,
-0.4969578, 1.071074, -0.2564539, 0.1176471, 1, 0, 1,
-0.4915134, -0.2803736, -3.197977, 0.1098039, 1, 0, 1,
-0.4913969, 0.6278264, 0.7253423, 0.1058824, 1, 0, 1,
-0.4888601, 2.481139, -1.021592, 0.09803922, 1, 0, 1,
-0.4838203, -1.078041, -3.913758, 0.09019608, 1, 0, 1,
-0.4831376, 1.576753, -0.3045607, 0.08627451, 1, 0, 1,
-0.4822027, -0.02973629, -2.330703, 0.07843138, 1, 0, 1,
-0.4810555, 0.2485983, -0.7490644, 0.07450981, 1, 0, 1,
-0.4771167, 0.1208025, -2.460785, 0.06666667, 1, 0, 1,
-0.4748936, -0.3355605, -1.449291, 0.0627451, 1, 0, 1,
-0.4733921, -1.246693, -1.230881, 0.05490196, 1, 0, 1,
-0.4725536, -0.3878008, -4.193804, 0.05098039, 1, 0, 1,
-0.4714882, 2.211155, -0.8519089, 0.04313726, 1, 0, 1,
-0.471439, 2.0622, -1.114037, 0.03921569, 1, 0, 1,
-0.4644824, -1.295377, -2.293257, 0.03137255, 1, 0, 1,
-0.4634147, -0.974662, -3.673455, 0.02745098, 1, 0, 1,
-0.4621451, -0.4013268, -1.46707, 0.01960784, 1, 0, 1,
-0.4599606, -0.5525875, -2.105933, 0.01568628, 1, 0, 1,
-0.459701, 0.7768887, 2.05735, 0.007843138, 1, 0, 1,
-0.4592859, 0.8597981, 1.826605, 0.003921569, 1, 0, 1,
-0.4584336, -0.1680465, -2.484926, 0, 1, 0.003921569, 1,
-0.4581421, -0.06913742, -1.171405, 0, 1, 0.01176471, 1,
-0.457756, 2.122512, -0.395261, 0, 1, 0.01568628, 1,
-0.4562534, -1.012891, -2.640117, 0, 1, 0.02352941, 1,
-0.4498497, 0.7072883, -1.833514, 0, 1, 0.02745098, 1,
-0.4475536, -1.123575, -3.369328, 0, 1, 0.03529412, 1,
-0.4447404, 1.204436, -2.509979, 0, 1, 0.03921569, 1,
-0.4388929, 0.8106387, 0.3803888, 0, 1, 0.04705882, 1,
-0.4304218, -0.4376451, -2.335706, 0, 1, 0.05098039, 1,
-0.4302806, -1.352883, -3.148329, 0, 1, 0.05882353, 1,
-0.4301324, -0.02626671, -1.334511, 0, 1, 0.0627451, 1,
-0.4289179, 0.02162838, -1.36483, 0, 1, 0.07058824, 1,
-0.4278577, 1.085437, 0.8050855, 0, 1, 0.07450981, 1,
-0.4262986, -0.7584623, -2.411364, 0, 1, 0.08235294, 1,
-0.424873, -0.6778301, -2.72038, 0, 1, 0.08627451, 1,
-0.4217319, 0.1320629, 0.5464481, 0, 1, 0.09411765, 1,
-0.4190337, -1.84638, -2.417625, 0, 1, 0.1019608, 1,
-0.4139673, -0.9079449, -2.151693, 0, 1, 0.1058824, 1,
-0.4133279, -1.243126, -2.075689, 0, 1, 0.1137255, 1,
-0.4099086, 0.9448999, 0.05634896, 0, 1, 0.1176471, 1,
-0.4087977, -1.841241, -2.274211, 0, 1, 0.1254902, 1,
-0.4087729, -0.2934278, -1.965708, 0, 1, 0.1294118, 1,
-0.4069182, -0.518398, -3.388863, 0, 1, 0.1372549, 1,
-0.4054164, -0.8026651, -2.647904, 0, 1, 0.1411765, 1,
-0.4034414, -1.365123, -2.801244, 0, 1, 0.1490196, 1,
-0.4011563, 1.005169, 1.222641, 0, 1, 0.1529412, 1,
-0.3996535, 0.725728, -0.3318249, 0, 1, 0.1607843, 1,
-0.3993216, -1.493422, -2.960804, 0, 1, 0.1647059, 1,
-0.3990296, 0.883127, -0.2843187, 0, 1, 0.172549, 1,
-0.3982576, 0.5434482, -1.080244, 0, 1, 0.1764706, 1,
-0.3978292, 0.1758451, -0.2555583, 0, 1, 0.1843137, 1,
-0.3947345, -0.1669144, -2.383251, 0, 1, 0.1882353, 1,
-0.3876975, -0.1100183, -2.837381, 0, 1, 0.1960784, 1,
-0.3804575, -0.597511, -2.174532, 0, 1, 0.2039216, 1,
-0.3765433, -1.759093, -3.744301, 0, 1, 0.2078431, 1,
-0.3741606, 1.423035, -1.011298, 0, 1, 0.2156863, 1,
-0.3712743, 1.908839, -0.4869852, 0, 1, 0.2196078, 1,
-0.3703979, 0.6490351, -2.229838, 0, 1, 0.227451, 1,
-0.3627972, -0.1009884, -1.442956, 0, 1, 0.2313726, 1,
-0.3589514, -0.9501321, -2.891323, 0, 1, 0.2392157, 1,
-0.355281, 0.5077326, -0.23924, 0, 1, 0.2431373, 1,
-0.3511588, 0.05770073, -0.7986857, 0, 1, 0.2509804, 1,
-0.3507994, 0.747184, -1.505443, 0, 1, 0.254902, 1,
-0.350707, -0.9371063, -2.897042, 0, 1, 0.2627451, 1,
-0.3450084, 1.302547, 0.5485689, 0, 1, 0.2666667, 1,
-0.3446212, -1.086948, -3.673836, 0, 1, 0.2745098, 1,
-0.3320407, -0.4068708, -3.613969, 0, 1, 0.2784314, 1,
-0.3317642, -1.084032, -2.683631, 0, 1, 0.2862745, 1,
-0.3308276, 0.6488956, 0.1506698, 0, 1, 0.2901961, 1,
-0.3297558, 0.1196159, -1.312818, 0, 1, 0.2980392, 1,
-0.3231481, 0.152385, -0.3490324, 0, 1, 0.3058824, 1,
-0.3194705, 0.9626873, -0.01575178, 0, 1, 0.3098039, 1,
-0.3143339, 1.989336, -0.411653, 0, 1, 0.3176471, 1,
-0.3073442, 0.1340092, 0.1417554, 0, 1, 0.3215686, 1,
-0.307154, 0.1501358, 0.04304521, 0, 1, 0.3294118, 1,
-0.3065877, -0.2265163, -3.278685, 0, 1, 0.3333333, 1,
-0.3009714, 0.6709325, -0.7329992, 0, 1, 0.3411765, 1,
-0.2956078, 0.2288469, -0.7661415, 0, 1, 0.345098, 1,
-0.292252, -1.568333, -2.299063, 0, 1, 0.3529412, 1,
-0.2917106, 0.5050588, -0.6333282, 0, 1, 0.3568628, 1,
-0.2911751, -0.1240896, -0.04555078, 0, 1, 0.3647059, 1,
-0.2822823, -0.3227838, -1.515813, 0, 1, 0.3686275, 1,
-0.2784521, -0.5034931, -1.670964, 0, 1, 0.3764706, 1,
-0.273298, -0.5925898, -2.337986, 0, 1, 0.3803922, 1,
-0.2727325, -0.85677, -3.46025, 0, 1, 0.3882353, 1,
-0.2699075, 0.7710171, -1.3892, 0, 1, 0.3921569, 1,
-0.2659835, 1.003526, 0.1471922, 0, 1, 0.4, 1,
-0.2656974, 1.598422, -0.4599509, 0, 1, 0.4078431, 1,
-0.2646052, 1.053862, 0.723515, 0, 1, 0.4117647, 1,
-0.2587102, 0.6839105, -1.131833, 0, 1, 0.4196078, 1,
-0.2559317, -0.457855, -2.780766, 0, 1, 0.4235294, 1,
-0.248694, -0.4543537, -2.567426, 0, 1, 0.4313726, 1,
-0.2470391, 0.7091084, -1.346519, 0, 1, 0.4352941, 1,
-0.2450059, -0.4927755, -2.119299, 0, 1, 0.4431373, 1,
-0.2421093, 1.072612, -2.217602, 0, 1, 0.4470588, 1,
-0.2412313, -1.108826, -2.834516, 0, 1, 0.454902, 1,
-0.2385798, -0.3062871, -2.787623, 0, 1, 0.4588235, 1,
-0.2380216, -0.5549412, -3.413118, 0, 1, 0.4666667, 1,
-0.2377836, -2.436932, -3.28485, 0, 1, 0.4705882, 1,
-0.2328234, 0.6097769, 1.302729, 0, 1, 0.4784314, 1,
-0.2301946, -1.610747, -1.185217, 0, 1, 0.4823529, 1,
-0.2298335, -0.01850285, -3.081254, 0, 1, 0.4901961, 1,
-0.2258651, 0.3617611, -0.3482607, 0, 1, 0.4941176, 1,
-0.2237257, -1.289536, -4.308126, 0, 1, 0.5019608, 1,
-0.2171493, 0.2070185, -0.7706622, 0, 1, 0.509804, 1,
-0.2026325, -2.344086, -3.019691, 0, 1, 0.5137255, 1,
-0.2008352, 0.02330463, -2.021202, 0, 1, 0.5215687, 1,
-0.1878845, 0.3806612, -0.6819912, 0, 1, 0.5254902, 1,
-0.1824437, 1.115934, 0.2357343, 0, 1, 0.5333334, 1,
-0.1823997, 1.233425, -1.316232, 0, 1, 0.5372549, 1,
-0.1727364, 1.545465, 0.7914257, 0, 1, 0.5450981, 1,
-0.1722333, 0.8348525, 1.009452, 0, 1, 0.5490196, 1,
-0.1646701, -0.6431856, -1.685967, 0, 1, 0.5568628, 1,
-0.1597656, -0.7393271, -2.072603, 0, 1, 0.5607843, 1,
-0.1565001, -0.004688485, -2.743511, 0, 1, 0.5686275, 1,
-0.1540922, -1.685622, -0.05113347, 0, 1, 0.572549, 1,
-0.1523265, -1.093104, -3.638993, 0, 1, 0.5803922, 1,
-0.1513282, -0.5881854, -3.465488, 0, 1, 0.5843138, 1,
-0.1482805, 1.772372, -0.08796839, 0, 1, 0.5921569, 1,
-0.1446051, 0.471962, -1.225026, 0, 1, 0.5960785, 1,
-0.1423431, -1.054211, -2.982502, 0, 1, 0.6039216, 1,
-0.1391717, -0.01930949, -4.031371, 0, 1, 0.6117647, 1,
-0.1319946, 0.310174, -0.3879976, 0, 1, 0.6156863, 1,
-0.1314749, -0.1594595, -1.290079, 0, 1, 0.6235294, 1,
-0.1299145, -0.305131, -6.483729, 0, 1, 0.627451, 1,
-0.1296396, 0.6769997, -0.9235286, 0, 1, 0.6352941, 1,
-0.1271259, 1.459034, 0.9065805, 0, 1, 0.6392157, 1,
-0.1242945, -1.603028, -2.359595, 0, 1, 0.6470588, 1,
-0.123486, -0.1771175, -3.698301, 0, 1, 0.6509804, 1,
-0.1232388, 0.4091981, -1.605308, 0, 1, 0.6588235, 1,
-0.120484, 0.4740331, -1.805928, 0, 1, 0.6627451, 1,
-0.1124343, 0.3372919, 0.7013718, 0, 1, 0.6705883, 1,
-0.1121583, -0.5819652, -3.130517, 0, 1, 0.6745098, 1,
-0.111527, -0.5171806, -4.422797, 0, 1, 0.682353, 1,
-0.1096717, -0.07999598, -1.04311, 0, 1, 0.6862745, 1,
-0.1095154, 1.139318, -0.3356543, 0, 1, 0.6941177, 1,
-0.1084047, 1.950709, -0.4333594, 0, 1, 0.7019608, 1,
-0.1056001, 0.2991588, 1.315701, 0, 1, 0.7058824, 1,
-0.101292, -1.108722, -1.543154, 0, 1, 0.7137255, 1,
-0.09659804, 1.97692, -1.148279, 0, 1, 0.7176471, 1,
-0.09448098, 1.055928, -0.683481, 0, 1, 0.7254902, 1,
-0.08993387, 0.6181697, 0.5206856, 0, 1, 0.7294118, 1,
-0.08944257, 2.702522, -0.7358853, 0, 1, 0.7372549, 1,
-0.08747723, 0.1747431, -0.3269415, 0, 1, 0.7411765, 1,
-0.08730586, -1.494916, -2.210234, 0, 1, 0.7490196, 1,
-0.08671741, -1.26068, -2.175166, 0, 1, 0.7529412, 1,
-0.08585865, -0.6331748, -2.718328, 0, 1, 0.7607843, 1,
-0.08165408, -0.7986227, -3.597693, 0, 1, 0.7647059, 1,
-0.08066019, 1.581946, 0.2113538, 0, 1, 0.772549, 1,
-0.07931205, -0.4671097, -2.51734, 0, 1, 0.7764706, 1,
-0.07647859, -0.1882531, -3.53016, 0, 1, 0.7843137, 1,
-0.07627696, 0.2081038, -0.5323647, 0, 1, 0.7882353, 1,
-0.07066135, 0.04755453, -1.980434, 0, 1, 0.7960784, 1,
-0.06923876, 1.25381, -1.192399, 0, 1, 0.8039216, 1,
-0.06697517, 0.2138534, 0.677052, 0, 1, 0.8078431, 1,
-0.06500205, 0.4191659, -0.9140396, 0, 1, 0.8156863, 1,
-0.06416059, 0.3139264, -0.2163406, 0, 1, 0.8196079, 1,
-0.06091958, 0.8367552, 0.3857669, 0, 1, 0.827451, 1,
-0.05429449, -0.07242742, -2.69446, 0, 1, 0.8313726, 1,
-0.05033628, 2.652966, -0.1532674, 0, 1, 0.8392157, 1,
-0.04923962, -0.492619, -4.54037, 0, 1, 0.8431373, 1,
-0.04697017, -0.393314, -1.075539, 0, 1, 0.8509804, 1,
-0.04351875, -0.2810819, -3.451791, 0, 1, 0.854902, 1,
-0.04316738, 2.226194, 0.1949942, 0, 1, 0.8627451, 1,
-0.03872018, 0.7775502, -0.5678836, 0, 1, 0.8666667, 1,
-0.03499076, -1.809086, -2.802415, 0, 1, 0.8745098, 1,
-0.03374452, 0.1292141, 0.1390939, 0, 1, 0.8784314, 1,
-0.02728488, -0.1838357, -2.536252, 0, 1, 0.8862745, 1,
-0.02687612, -0.1899716, -2.054668, 0, 1, 0.8901961, 1,
-0.02619191, 2.16076, -0.006281213, 0, 1, 0.8980392, 1,
-0.02592682, -0.1703724, -4.810664, 0, 1, 0.9058824, 1,
-0.02564472, -0.5591082, -4.20642, 0, 1, 0.9098039, 1,
-0.02395139, 0.1814199, -0.5368851, 0, 1, 0.9176471, 1,
-0.01399258, -0.4140415, -3.354548, 0, 1, 0.9215686, 1,
-0.01132329, 1.008297, -0.647725, 0, 1, 0.9294118, 1,
-0.01026448, -1.059295, -2.400764, 0, 1, 0.9333333, 1,
-0.005766905, -1.079422, -3.874946, 0, 1, 0.9411765, 1,
-0.004793643, -0.6542525, -3.110122, 0, 1, 0.945098, 1,
-0.004565252, 0.3657051, 1.061836, 0, 1, 0.9529412, 1,
0.00442681, -0.3308488, 3.265726, 0, 1, 0.9568627, 1,
0.004542051, 1.075332, -1.430625, 0, 1, 0.9647059, 1,
0.004553871, 0.4607331, 1.531525, 0, 1, 0.9686275, 1,
0.005253973, -1.476634, 3.955778, 0, 1, 0.9764706, 1,
0.005862585, -0.04577444, 3.227011, 0, 1, 0.9803922, 1,
0.006001992, -0.4946515, 3.440755, 0, 1, 0.9882353, 1,
0.009131712, 0.4065612, -0.3157516, 0, 1, 0.9921569, 1,
0.01847826, -0.7610416, 1.913843, 0, 1, 1, 1,
0.023722, 1.737887, 0.3770953, 0, 0.9921569, 1, 1,
0.02633926, -0.5006695, 3.818486, 0, 0.9882353, 1, 1,
0.02931479, -0.1860814, 2.407802, 0, 0.9803922, 1, 1,
0.03473083, -0.3531295, 4.477386, 0, 0.9764706, 1, 1,
0.03660897, 1.53455, -1.796369, 0, 0.9686275, 1, 1,
0.03901731, -0.3061338, 3.052705, 0, 0.9647059, 1, 1,
0.04007652, -0.7229154, 3.255431, 0, 0.9568627, 1, 1,
0.04627949, 0.7175621, 0.2702645, 0, 0.9529412, 1, 1,
0.05551346, -0.6927516, 3.856275, 0, 0.945098, 1, 1,
0.06100451, -0.009178115, 1.766002, 0, 0.9411765, 1, 1,
0.06193678, -0.3980339, 0.1743438, 0, 0.9333333, 1, 1,
0.06438146, 0.8465812, 1.299655, 0, 0.9294118, 1, 1,
0.06841998, 0.2586976, -0.5640025, 0, 0.9215686, 1, 1,
0.06904069, -0.3272347, 2.1602, 0, 0.9176471, 1, 1,
0.06975558, 1.433312, 1.578015, 0, 0.9098039, 1, 1,
0.07602099, 2.068447, -2.650973, 0, 0.9058824, 1, 1,
0.07692024, -0.339534, 3.891448, 0, 0.8980392, 1, 1,
0.07968418, 0.5206244, 0.8454853, 0, 0.8901961, 1, 1,
0.08226156, 0.1876427, 1.499785, 0, 0.8862745, 1, 1,
0.08235044, 1.186586, -0.8250102, 0, 0.8784314, 1, 1,
0.08353129, -1.356384, 3.889551, 0, 0.8745098, 1, 1,
0.09207134, -0.6130061, 2.259875, 0, 0.8666667, 1, 1,
0.09277239, -1.282967, 4.50189, 0, 0.8627451, 1, 1,
0.09795579, -1.352221, 3.141661, 0, 0.854902, 1, 1,
0.09901626, -0.6032055, 2.652583, 0, 0.8509804, 1, 1,
0.1067563, 0.5332537, -1.052124, 0, 0.8431373, 1, 1,
0.1096603, 0.6816457, -1.048808, 0, 0.8392157, 1, 1,
0.1104178, 0.9999744, 0.1857923, 0, 0.8313726, 1, 1,
0.1129936, -1.126461, 4.137802, 0, 0.827451, 1, 1,
0.1142223, -0.06333991, 2.003447, 0, 0.8196079, 1, 1,
0.1144363, -0.2692634, 3.156892, 0, 0.8156863, 1, 1,
0.1165855, -0.1615058, 1.78269, 0, 0.8078431, 1, 1,
0.1194468, 0.6553307, 1.305789, 0, 0.8039216, 1, 1,
0.1281276, -1.028274, 2.41474, 0, 0.7960784, 1, 1,
0.1286738, 0.1870204, 0.9209362, 0, 0.7882353, 1, 1,
0.1321498, -0.09545317, 2.729229, 0, 0.7843137, 1, 1,
0.1327042, -0.8316575, 4.029638, 0, 0.7764706, 1, 1,
0.1345885, -1.323693, 3.045532, 0, 0.772549, 1, 1,
0.1434691, 1.091658, -1.190213, 0, 0.7647059, 1, 1,
0.146264, 0.4345447, 2.075805, 0, 0.7607843, 1, 1,
0.1506501, -1.903678, 3.642852, 0, 0.7529412, 1, 1,
0.1514695, -0.5638371, 2.817535, 0, 0.7490196, 1, 1,
0.1538437, 0.9785735, 2.127197, 0, 0.7411765, 1, 1,
0.1552588, 1.425861, -0.7592635, 0, 0.7372549, 1, 1,
0.1561754, 0.9094759, 0.04093232, 0, 0.7294118, 1, 1,
0.1572331, 0.7297481, -1.158568, 0, 0.7254902, 1, 1,
0.157433, 0.02529552, 2.681669, 0, 0.7176471, 1, 1,
0.1577438, -1.209614, 3.011722, 0, 0.7137255, 1, 1,
0.1596179, 1.417112, 0.2750489, 0, 0.7058824, 1, 1,
0.1719034, 1.473864, 0.9795631, 0, 0.6980392, 1, 1,
0.1780999, -0.994323, 3.178577, 0, 0.6941177, 1, 1,
0.1795178, 0.08786193, 0.90825, 0, 0.6862745, 1, 1,
0.1804357, -0.00386256, 2.333216, 0, 0.682353, 1, 1,
0.1809655, -2.14472, 2.388757, 0, 0.6745098, 1, 1,
0.1823384, 0.7038744, 0.391662, 0, 0.6705883, 1, 1,
0.1829786, -0.06625433, 2.142176, 0, 0.6627451, 1, 1,
0.1836105, -0.130396, 4.944213, 0, 0.6588235, 1, 1,
0.1897793, -0.1380222, 3.241282, 0, 0.6509804, 1, 1,
0.1919641, -0.5408707, 1.649222, 0, 0.6470588, 1, 1,
0.1929823, -0.008546788, 0.306182, 0, 0.6392157, 1, 1,
0.1971361, -0.6145197, 0.7385881, 0, 0.6352941, 1, 1,
0.2003612, -0.9742813, 3.256128, 0, 0.627451, 1, 1,
0.200725, -1.567086, 3.07713, 0, 0.6235294, 1, 1,
0.2046233, -1.341724, 1.939313, 0, 0.6156863, 1, 1,
0.2047916, -0.7003567, 2.041843, 0, 0.6117647, 1, 1,
0.2075248, 0.7619493, -0.4700749, 0, 0.6039216, 1, 1,
0.2090252, 1.225293, -0.3082816, 0, 0.5960785, 1, 1,
0.2115121, 0.7081505, -1.417442, 0, 0.5921569, 1, 1,
0.2178052, 0.6133663, 0.8238813, 0, 0.5843138, 1, 1,
0.2191272, 0.8973376, -0.240259, 0, 0.5803922, 1, 1,
0.2192151, -0.547496, 1.740128, 0, 0.572549, 1, 1,
0.2229352, -0.003005647, 2.336752, 0, 0.5686275, 1, 1,
0.2237871, 0.1506384, 0.335137, 0, 0.5607843, 1, 1,
0.2263358, -1.278962, 1.931729, 0, 0.5568628, 1, 1,
0.2266773, -0.5870134, 2.546237, 0, 0.5490196, 1, 1,
0.2308944, 0.5291605, 0.0920262, 0, 0.5450981, 1, 1,
0.2316894, 1.495299, 1.595064, 0, 0.5372549, 1, 1,
0.2383144, -0.4851638, 2.622956, 0, 0.5333334, 1, 1,
0.2394636, -0.8486097, 1.763755, 0, 0.5254902, 1, 1,
0.2410109, 0.04753032, 0.06008784, 0, 0.5215687, 1, 1,
0.2423367, -0.7703753, 3.118957, 0, 0.5137255, 1, 1,
0.243739, -0.1722607, 1.204944, 0, 0.509804, 1, 1,
0.2533438, -0.6920011, 1.215692, 0, 0.5019608, 1, 1,
0.2546577, 0.6778952, 0.3130899, 0, 0.4941176, 1, 1,
0.2634751, -0.1111482, 2.658946, 0, 0.4901961, 1, 1,
0.2655652, -1.913775, 2.654986, 0, 0.4823529, 1, 1,
0.2659113, 1.032377, 0.4144143, 0, 0.4784314, 1, 1,
0.2660067, -1.810781, 1.60423, 0, 0.4705882, 1, 1,
0.2665722, 1.320425, -1.45461, 0, 0.4666667, 1, 1,
0.2677936, 0.5379847, -2.141135, 0, 0.4588235, 1, 1,
0.2690715, -0.7675874, 3.123377, 0, 0.454902, 1, 1,
0.2756583, 0.5957955, 1.180852, 0, 0.4470588, 1, 1,
0.2762058, -0.7852377, 3.449099, 0, 0.4431373, 1, 1,
0.2775361, 0.8647534, -0.005066835, 0, 0.4352941, 1, 1,
0.2817116, 1.243464, -0.727779, 0, 0.4313726, 1, 1,
0.284058, -1.565882, 2.610705, 0, 0.4235294, 1, 1,
0.2855797, 0.5611001, -1.987028, 0, 0.4196078, 1, 1,
0.2875611, -0.4212047, 2.310464, 0, 0.4117647, 1, 1,
0.2887415, -0.202697, 2.437758, 0, 0.4078431, 1, 1,
0.2938029, 1.719076, 0.9042262, 0, 0.4, 1, 1,
0.2947346, 0.4273795, 0.01118759, 0, 0.3921569, 1, 1,
0.2978457, 1.545476, 1.194656, 0, 0.3882353, 1, 1,
0.3003928, 2.200414, 0.04084227, 0, 0.3803922, 1, 1,
0.3061715, -0.2512059, 0.4048023, 0, 0.3764706, 1, 1,
0.3063578, 0.372545, 0.8140969, 0, 0.3686275, 1, 1,
0.3156689, -0.8706329, 2.253106, 0, 0.3647059, 1, 1,
0.3165911, 0.0361074, 1.938009, 0, 0.3568628, 1, 1,
0.3166575, -0.7248212, 3.666554, 0, 0.3529412, 1, 1,
0.3180116, -1.056015, 3.267833, 0, 0.345098, 1, 1,
0.3181197, -0.08641928, 3.273498, 0, 0.3411765, 1, 1,
0.3194113, 0.7034311, 1.439311, 0, 0.3333333, 1, 1,
0.3207465, -1.481479, 4.477522, 0, 0.3294118, 1, 1,
0.3212838, 0.3620361, 3.082819, 0, 0.3215686, 1, 1,
0.3239708, 0.4521602, 0.7231495, 0, 0.3176471, 1, 1,
0.3257385, -0.630774, 3.122723, 0, 0.3098039, 1, 1,
0.3297302, -0.7108516, 2.671482, 0, 0.3058824, 1, 1,
0.3339608, 1.69442, 0.9580832, 0, 0.2980392, 1, 1,
0.3360832, -0.594606, 2.760941, 0, 0.2901961, 1, 1,
0.3365073, -0.3558878, 1.413797, 0, 0.2862745, 1, 1,
0.3375102, 1.085936, 1.790144, 0, 0.2784314, 1, 1,
0.3386606, 0.8297495, 0.2125384, 0, 0.2745098, 1, 1,
0.3434507, 0.4824014, 1.636147, 0, 0.2666667, 1, 1,
0.3462403, 0.2922096, 1.406031, 0, 0.2627451, 1, 1,
0.346502, 0.5631282, 1.610544, 0, 0.254902, 1, 1,
0.3483935, 0.2780985, 0.9381413, 0, 0.2509804, 1, 1,
0.3486954, 1.496153, 0.1616031, 0, 0.2431373, 1, 1,
0.3487246, -0.2960858, 0.902709, 0, 0.2392157, 1, 1,
0.3492767, -0.5228238, 3.13007, 0, 0.2313726, 1, 1,
0.3517022, -3.129876, 2.366806, 0, 0.227451, 1, 1,
0.3549705, 0.4517613, 0.7143541, 0, 0.2196078, 1, 1,
0.3555167, 0.8555254, 0.09966201, 0, 0.2156863, 1, 1,
0.3644532, 0.3805295, 1.591185, 0, 0.2078431, 1, 1,
0.3704966, -0.03160133, 2.617814, 0, 0.2039216, 1, 1,
0.3730775, -0.570488, 3.995068, 0, 0.1960784, 1, 1,
0.3735396, 0.9341865, 0.7839284, 0, 0.1882353, 1, 1,
0.3762808, -0.6753929, 2.315113, 0, 0.1843137, 1, 1,
0.3791295, 0.563892, -0.8424495, 0, 0.1764706, 1, 1,
0.3828215, -0.6872498, 1.387022, 0, 0.172549, 1, 1,
0.3862076, -0.7599598, 2.989477, 0, 0.1647059, 1, 1,
0.39135, 0.02694923, 1.965441, 0, 0.1607843, 1, 1,
0.39507, 0.5362653, -0.2432504, 0, 0.1529412, 1, 1,
0.395363, -1.364204, 2.991392, 0, 0.1490196, 1, 1,
0.3954381, -0.8406218, 3.381426, 0, 0.1411765, 1, 1,
0.396596, -0.5474194, 2.863394, 0, 0.1372549, 1, 1,
0.3966028, 1.1359, -0.9404302, 0, 0.1294118, 1, 1,
0.397806, 0.3588147, 1.693712, 0, 0.1254902, 1, 1,
0.3996469, 0.4302624, 0.1544341, 0, 0.1176471, 1, 1,
0.4021794, -0.8798394, 2.391226, 0, 0.1137255, 1, 1,
0.404066, -0.6495898, 2.96916, 0, 0.1058824, 1, 1,
0.4061342, -1.986533, 3.208297, 0, 0.09803922, 1, 1,
0.4133295, -1.935384, 1.697993, 0, 0.09411765, 1, 1,
0.4141134, -0.7576223, 3.913612, 0, 0.08627451, 1, 1,
0.4150947, 0.2480726, -0.958543, 0, 0.08235294, 1, 1,
0.416348, -1.570995, 4.066331, 0, 0.07450981, 1, 1,
0.4197543, 0.6778376, 0.09940636, 0, 0.07058824, 1, 1,
0.4280348, 2.086722, 0.6097438, 0, 0.0627451, 1, 1,
0.4281021, 0.3702386, 0.2635379, 0, 0.05882353, 1, 1,
0.4318508, 0.3779695, 0.5573751, 0, 0.05098039, 1, 1,
0.4319658, -0.718292, 2.618708, 0, 0.04705882, 1, 1,
0.4325823, -1.206728, 2.066193, 0, 0.03921569, 1, 1,
0.4354199, 0.3846739, 1.486392, 0, 0.03529412, 1, 1,
0.4379954, 0.4010908, 1.06783, 0, 0.02745098, 1, 1,
0.438267, -1.104765, 0.7523428, 0, 0.02352941, 1, 1,
0.4406236, 0.09701374, 1.234285, 0, 0.01568628, 1, 1,
0.4424798, 0.6343776, -0.2437333, 0, 0.01176471, 1, 1,
0.4456934, -1.246115, 2.412862, 0, 0.003921569, 1, 1,
0.4501304, 1.488204, 0.01216871, 0.003921569, 0, 1, 1,
0.4518265, 1.345197, 0.2585378, 0.007843138, 0, 1, 1,
0.4541034, 0.1874595, 0.2347949, 0.01568628, 0, 1, 1,
0.458031, -0.865209, 1.996233, 0.01960784, 0, 1, 1,
0.4593, 0.4635375, 1.194211, 0.02745098, 0, 1, 1,
0.4635202, 0.6722264, -0.07451127, 0.03137255, 0, 1, 1,
0.4692589, 0.07987509, 0.5865996, 0.03921569, 0, 1, 1,
0.4693107, -0.03721923, -0.3971863, 0.04313726, 0, 1, 1,
0.4729611, 0.3491694, 1.156826, 0.05098039, 0, 1, 1,
0.4729728, 0.6596463, 0.5581962, 0.05490196, 0, 1, 1,
0.4741443, -0.8919134, 3.145811, 0.0627451, 0, 1, 1,
0.4742588, 0.2890028, 1.230772, 0.06666667, 0, 1, 1,
0.4758042, -0.1439635, 2.050881, 0.07450981, 0, 1, 1,
0.4762899, 0.8690165, -0.1638171, 0.07843138, 0, 1, 1,
0.4805149, 0.4561046, 1.812253, 0.08627451, 0, 1, 1,
0.4832383, -1.510894, 2.383623, 0.09019608, 0, 1, 1,
0.4837077, 1.486383, 0.4914201, 0.09803922, 0, 1, 1,
0.4849754, 2.47957, 1.040391, 0.1058824, 0, 1, 1,
0.4880913, -0.2259647, 2.938201, 0.1098039, 0, 1, 1,
0.4888822, 0.2725042, -1.011881, 0.1176471, 0, 1, 1,
0.4898097, 0.8796654, 0.6844686, 0.1215686, 0, 1, 1,
0.4905616, -0.2705968, 2.224458, 0.1294118, 0, 1, 1,
0.4918734, -2.095855, 3.431465, 0.1333333, 0, 1, 1,
0.4975207, -0.4336712, 3.235927, 0.1411765, 0, 1, 1,
0.4985221, -0.7141088, 3.87189, 0.145098, 0, 1, 1,
0.4991201, 0.633578, -0.304957, 0.1529412, 0, 1, 1,
0.5024117, 0.414541, 2.093813, 0.1568628, 0, 1, 1,
0.5056958, -0.4198147, 2.844512, 0.1647059, 0, 1, 1,
0.5066487, 0.3468691, 1.331529, 0.1686275, 0, 1, 1,
0.5089069, -0.7921181, 4.042422, 0.1764706, 0, 1, 1,
0.5096575, -0.0309589, 0.5460837, 0.1803922, 0, 1, 1,
0.5117193, 1.684744, 1.022411, 0.1882353, 0, 1, 1,
0.5138259, 0.2475996, -0.1614009, 0.1921569, 0, 1, 1,
0.5153099, 0.8976579, 1.17334, 0.2, 0, 1, 1,
0.5187766, 0.352195, -0.3269744, 0.2078431, 0, 1, 1,
0.5194646, -0.5676172, 2.627742, 0.2117647, 0, 1, 1,
0.5215885, -0.4183738, 1.022751, 0.2196078, 0, 1, 1,
0.5237782, 1.006281, 1.334166, 0.2235294, 0, 1, 1,
0.5251743, 0.927215, 1.141724, 0.2313726, 0, 1, 1,
0.5258652, 0.4243788, 0.1764059, 0.2352941, 0, 1, 1,
0.529614, 0.2819027, 2.074249, 0.2431373, 0, 1, 1,
0.5303978, 1.371948, -0.6987106, 0.2470588, 0, 1, 1,
0.5311275, 0.6584696, 1.338902, 0.254902, 0, 1, 1,
0.5345624, 0.3483965, 0.7213149, 0.2588235, 0, 1, 1,
0.5346025, -0.7212979, 4.146659, 0.2666667, 0, 1, 1,
0.5365875, -0.8947246, 0.445325, 0.2705882, 0, 1, 1,
0.539214, 1.339164, 2.108806, 0.2784314, 0, 1, 1,
0.5415782, 0.5130852, 1.502285, 0.282353, 0, 1, 1,
0.5427339, 1.22091, 1.456724, 0.2901961, 0, 1, 1,
0.5435563, 0.5776063, -0.5677077, 0.2941177, 0, 1, 1,
0.5454852, 0.9900718, 1.00802, 0.3019608, 0, 1, 1,
0.549269, 2.017429, -0.3726854, 0.3098039, 0, 1, 1,
0.549744, -1.224192, 5.016248, 0.3137255, 0, 1, 1,
0.5526146, -0.906782, 2.825274, 0.3215686, 0, 1, 1,
0.552805, 0.3077277, -0.1078784, 0.3254902, 0, 1, 1,
0.5528346, 0.4634589, 0.2748052, 0.3333333, 0, 1, 1,
0.5554231, -0.7789405, 1.443267, 0.3372549, 0, 1, 1,
0.5556475, -0.5095494, 1.811291, 0.345098, 0, 1, 1,
0.5587437, 0.103117, 0.3702412, 0.3490196, 0, 1, 1,
0.5637387, -0.7280486, 1.824119, 0.3568628, 0, 1, 1,
0.564514, 0.9691627, 0.1343509, 0.3607843, 0, 1, 1,
0.5669106, -0.3905664, 2.068103, 0.3686275, 0, 1, 1,
0.5685596, 0.7145636, 0.5779105, 0.372549, 0, 1, 1,
0.5685837, 0.009071867, 1.904952, 0.3803922, 0, 1, 1,
0.5694144, -1.100236, 0.8912731, 0.3843137, 0, 1, 1,
0.5701439, 0.299689, 0.64898, 0.3921569, 0, 1, 1,
0.5745112, -2.100263, 4.340641, 0.3960784, 0, 1, 1,
0.5764077, 0.1811584, 0.2276212, 0.4039216, 0, 1, 1,
0.579443, -1.249303, 0.5725121, 0.4117647, 0, 1, 1,
0.5812787, 0.6940224, -0.06914179, 0.4156863, 0, 1, 1,
0.5832987, -0.3969476, 2.038539, 0.4235294, 0, 1, 1,
0.5843236, -1.511552, 2.255892, 0.427451, 0, 1, 1,
0.5863101, 0.6640557, 0.4242943, 0.4352941, 0, 1, 1,
0.5957019, -0.8062787, 2.342562, 0.4392157, 0, 1, 1,
0.6021463, -0.03224565, 1.60461, 0.4470588, 0, 1, 1,
0.6079308, 1.403038, 0.1713203, 0.4509804, 0, 1, 1,
0.617559, -0.2196729, 1.663441, 0.4588235, 0, 1, 1,
0.6194046, 0.5411299, 0.6500045, 0.4627451, 0, 1, 1,
0.6267507, -0.190393, 0.9560087, 0.4705882, 0, 1, 1,
0.6275663, 0.8486606, 2.310494, 0.4745098, 0, 1, 1,
0.6344696, -1.03356, 3.065469, 0.4823529, 0, 1, 1,
0.6360847, 0.3465372, 2.137467, 0.4862745, 0, 1, 1,
0.6377763, 0.5853837, 0.5798267, 0.4941176, 0, 1, 1,
0.6433209, 0.02689034, 0.1479904, 0.5019608, 0, 1, 1,
0.6434186, -1.435139, 3.521273, 0.5058824, 0, 1, 1,
0.645043, -1.501823, 2.860449, 0.5137255, 0, 1, 1,
0.6471434, -0.8486095, 2.048776, 0.5176471, 0, 1, 1,
0.6472996, 1.613065, 1.280325, 0.5254902, 0, 1, 1,
0.6481264, -0.03623063, 0.8147245, 0.5294118, 0, 1, 1,
0.6514626, 1.866121, -0.1530804, 0.5372549, 0, 1, 1,
0.6537787, -0.3513531, 1.464858, 0.5411765, 0, 1, 1,
0.6545623, 1.364431, 1.679834, 0.5490196, 0, 1, 1,
0.6578213, 1.94324, -0.3510866, 0.5529412, 0, 1, 1,
0.6600928, -0.170548, 1.566884, 0.5607843, 0, 1, 1,
0.6632324, 1.689233, 1.657262, 0.5647059, 0, 1, 1,
0.6679205, 1.774387, -0.6924328, 0.572549, 0, 1, 1,
0.6776014, -1.036974, 2.651245, 0.5764706, 0, 1, 1,
0.6777496, 1.177421, -0.07499623, 0.5843138, 0, 1, 1,
0.6853575, -0.8288692, 2.412797, 0.5882353, 0, 1, 1,
0.6862048, -0.7252031, 3.225785, 0.5960785, 0, 1, 1,
0.6906627, 0.1457647, 1.782026, 0.6039216, 0, 1, 1,
0.6952813, 0.6147318, 0.6356887, 0.6078432, 0, 1, 1,
0.6971938, 0.5284407, 0.5502579, 0.6156863, 0, 1, 1,
0.7020122, -0.5906174, 1.624921, 0.6196079, 0, 1, 1,
0.7058303, -0.9915296, 3.406426, 0.627451, 0, 1, 1,
0.7078516, -0.1062549, 1.679408, 0.6313726, 0, 1, 1,
0.7094448, -0.2561319, 1.828792, 0.6392157, 0, 1, 1,
0.7115511, -0.2506873, -0.07418621, 0.6431373, 0, 1, 1,
0.7166409, -1.038756, 0.6730276, 0.6509804, 0, 1, 1,
0.7251871, -0.2926635, 2.865226, 0.654902, 0, 1, 1,
0.7289172, -1.0404, 1.778452, 0.6627451, 0, 1, 1,
0.7290418, 1.083041, 1.828747, 0.6666667, 0, 1, 1,
0.7339302, -0.9243594, 2.437685, 0.6745098, 0, 1, 1,
0.7364355, -1.178009, 2.070137, 0.6784314, 0, 1, 1,
0.7365304, 0.1045947, 3.636443, 0.6862745, 0, 1, 1,
0.7389029, -0.4601707, 1.917609, 0.6901961, 0, 1, 1,
0.7403648, -0.9007657, 2.765158, 0.6980392, 0, 1, 1,
0.742017, 0.4481643, 1.031001, 0.7058824, 0, 1, 1,
0.7428395, 0.1480778, 0.7618213, 0.7098039, 0, 1, 1,
0.7429582, 0.2138206, 0.4089996, 0.7176471, 0, 1, 1,
0.7441168, 0.6858737, 0.1553835, 0.7215686, 0, 1, 1,
0.7444212, 1.882424, -0.07697283, 0.7294118, 0, 1, 1,
0.7497671, -1.05866, 3.766031, 0.7333333, 0, 1, 1,
0.7526073, 0.6853507, 0.7712386, 0.7411765, 0, 1, 1,
0.7591463, 0.3651321, 1.71125, 0.7450981, 0, 1, 1,
0.7667838, 0.5291739, -0.1540642, 0.7529412, 0, 1, 1,
0.7706735, -0.05129783, 3.118757, 0.7568628, 0, 1, 1,
0.7724285, 3.395022, 0.3950742, 0.7647059, 0, 1, 1,
0.7819828, -0.1595429, 1.401325, 0.7686275, 0, 1, 1,
0.7867061, -2.335317, 2.776858, 0.7764706, 0, 1, 1,
0.7878724, 0.3104735, 0.2583774, 0.7803922, 0, 1, 1,
0.7938625, 0.4234517, 1.536444, 0.7882353, 0, 1, 1,
0.7969348, 1.125632, 1.538535, 0.7921569, 0, 1, 1,
0.8017971, -0.9282369, 2.874993, 0.8, 0, 1, 1,
0.8048456, 0.05455741, 2.654075, 0.8078431, 0, 1, 1,
0.817978, 1.297731, 1.199071, 0.8117647, 0, 1, 1,
0.8210328, 0.136969, 1.509285, 0.8196079, 0, 1, 1,
0.8215464, 0.2213821, 0.3173264, 0.8235294, 0, 1, 1,
0.8232915, -2.090285, 1.366882, 0.8313726, 0, 1, 1,
0.8268632, 1.426702, -0.9494873, 0.8352941, 0, 1, 1,
0.827749, -0.2485949, 2.640815, 0.8431373, 0, 1, 1,
0.8308716, -0.7706565, 2.315777, 0.8470588, 0, 1, 1,
0.8376086, -0.5879973, 2.818505, 0.854902, 0, 1, 1,
0.8386424, -0.6082122, 3.186155, 0.8588235, 0, 1, 1,
0.8466815, 1.075688, 0.3705098, 0.8666667, 0, 1, 1,
0.8537893, 2.58748, 1.630925, 0.8705882, 0, 1, 1,
0.8601924, 0.0480241, 2.781509, 0.8784314, 0, 1, 1,
0.8812292, 0.9415641, -0.06792243, 0.8823529, 0, 1, 1,
0.887216, -2.239584, 2.11538, 0.8901961, 0, 1, 1,
0.9053866, 0.07562694, 2.942892, 0.8941177, 0, 1, 1,
0.9103467, -0.02530661, -0.08781276, 0.9019608, 0, 1, 1,
0.9130179, 0.8162276, 0.4531384, 0.9098039, 0, 1, 1,
0.9149282, 1.234436, 1.192286, 0.9137255, 0, 1, 1,
0.9152904, -0.6276269, 3.984589, 0.9215686, 0, 1, 1,
0.918643, 0.2309226, 1.306271, 0.9254902, 0, 1, 1,
0.9214761, 0.1921999, 2.422581, 0.9333333, 0, 1, 1,
0.9218895, -0.2603904, 2.131322, 0.9372549, 0, 1, 1,
0.9246109, -0.9808149, 2.721439, 0.945098, 0, 1, 1,
0.9262989, -0.06769526, 0.2326377, 0.9490196, 0, 1, 1,
0.9277057, 0.2958394, 0.2489134, 0.9568627, 0, 1, 1,
0.9337226, 1.539654, 1.809632, 0.9607843, 0, 1, 1,
0.9381494, -1.124806, 2.167632, 0.9686275, 0, 1, 1,
0.9434502, 0.6478624, 1.65987, 0.972549, 0, 1, 1,
0.9436041, 0.402915, 1.337258, 0.9803922, 0, 1, 1,
0.945667, -0.3375073, 0.438179, 0.9843137, 0, 1, 1,
0.9484851, 0.6828671, 0.3794995, 0.9921569, 0, 1, 1,
0.9506032, 0.7839112, 1.499296, 0.9960784, 0, 1, 1,
0.9550698, -3.091027, 2.991163, 1, 0, 0.9960784, 1,
0.9607285, 0.3464628, 0.3562772, 1, 0, 0.9882353, 1,
0.961001, -1.085015, 1.228145, 1, 0, 0.9843137, 1,
0.9669853, -0.4047649, 1.653498, 1, 0, 0.9764706, 1,
0.9829776, 0.8077291, 0.5330116, 1, 0, 0.972549, 1,
0.9838809, 1.456251, -1.066445, 1, 0, 0.9647059, 1,
0.987833, 0.9046633, 3.128375, 1, 0, 0.9607843, 1,
0.988445, -0.3777282, 2.48496, 1, 0, 0.9529412, 1,
0.9925906, 0.5799059, -0.4823606, 1, 0, 0.9490196, 1,
0.9969298, 0.0769378, 0.008695819, 1, 0, 0.9411765, 1,
1.002462, -1.086945, 1.572374, 1, 0, 0.9372549, 1,
1.006359, 0.3117189, 2.066556, 1, 0, 0.9294118, 1,
1.009787, -0.5211498, 0.7808918, 1, 0, 0.9254902, 1,
1.010249, -0.3210225, 1.051198, 1, 0, 0.9176471, 1,
1.019524, -0.1483301, 1.981847, 1, 0, 0.9137255, 1,
1.020182, -2.340368, 2.095553, 1, 0, 0.9058824, 1,
1.023524, -1.955883, 1.765386, 1, 0, 0.9019608, 1,
1.02365, 0.6787596, 1.480666, 1, 0, 0.8941177, 1,
1.027737, 1.48698, -1.298147, 1, 0, 0.8862745, 1,
1.030966, 0.03617353, 1.228855, 1, 0, 0.8823529, 1,
1.031137, 2.615637, 0.5461614, 1, 0, 0.8745098, 1,
1.033992, 0.445332, 2.550226, 1, 0, 0.8705882, 1,
1.037218, -0.8777261, 3.635291, 1, 0, 0.8627451, 1,
1.040877, 0.2300933, 2.060494, 1, 0, 0.8588235, 1,
1.042251, -1.198776, 0.1578154, 1, 0, 0.8509804, 1,
1.04359, 1.357431, 2.19887, 1, 0, 0.8470588, 1,
1.047212, 3.357099, -0.3660206, 1, 0, 0.8392157, 1,
1.049477, 1.293095, 2.378893, 1, 0, 0.8352941, 1,
1.053842, -1.472441, 1.62618, 1, 0, 0.827451, 1,
1.05637, -1.507113, 2.528915, 1, 0, 0.8235294, 1,
1.059644, -1.350048, 2.962195, 1, 0, 0.8156863, 1,
1.066685, 0.6957149, 0.311372, 1, 0, 0.8117647, 1,
1.06733, 0.317925, 1.26756, 1, 0, 0.8039216, 1,
1.073823, 0.4852742, 1.326041, 1, 0, 0.7960784, 1,
1.077317, -0.6596758, 2.775712, 1, 0, 0.7921569, 1,
1.078362, -0.3907669, 2.236171, 1, 0, 0.7843137, 1,
1.083832, -0.969577, 2.762101, 1, 0, 0.7803922, 1,
1.090132, 0.5181128, 0.7467664, 1, 0, 0.772549, 1,
1.097014, -0.3301286, 1.933231, 1, 0, 0.7686275, 1,
1.100436, 0.1179345, -0.1122746, 1, 0, 0.7607843, 1,
1.118052, 1.150931, -1.23318, 1, 0, 0.7568628, 1,
1.118333, -2.230607, 2.386806, 1, 0, 0.7490196, 1,
1.120359, 0.02931115, 0.09983282, 1, 0, 0.7450981, 1,
1.122542, 1.489917, 0.5575651, 1, 0, 0.7372549, 1,
1.137471, -0.7083504, 1.257804, 1, 0, 0.7333333, 1,
1.143262, 0.5344906, 1.820442, 1, 0, 0.7254902, 1,
1.156958, -1.065046, 2.037731, 1, 0, 0.7215686, 1,
1.158603, -1.263372, 2.372661, 1, 0, 0.7137255, 1,
1.159067, -0.4790868, 1.339816, 1, 0, 0.7098039, 1,
1.161672, 0.9169433, 1.354231, 1, 0, 0.7019608, 1,
1.162667, 0.2672012, 0.7256929, 1, 0, 0.6941177, 1,
1.175533, 0.4998665, 0.5813656, 1, 0, 0.6901961, 1,
1.178772, -0.8944558, 1.94578, 1, 0, 0.682353, 1,
1.190057, -0.6841398, 2.692404, 1, 0, 0.6784314, 1,
1.191526, -0.3709312, 1.832812, 1, 0, 0.6705883, 1,
1.195527, -0.4710533, 1.991228, 1, 0, 0.6666667, 1,
1.197936, 0.8961727, 2.727482, 1, 0, 0.6588235, 1,
1.199208, 1.429688, -0.1350133, 1, 0, 0.654902, 1,
1.208048, 0.05910096, 1.741513, 1, 0, 0.6470588, 1,
1.208975, 1.521993, -0.308785, 1, 0, 0.6431373, 1,
1.21426, 0.6165659, 0.8933139, 1, 0, 0.6352941, 1,
1.216767, -0.9808673, 3.107295, 1, 0, 0.6313726, 1,
1.225863, -1.8972, 2.697223, 1, 0, 0.6235294, 1,
1.225928, -0.3493838, 2.044993, 1, 0, 0.6196079, 1,
1.226661, 0.6002189, -0.002883039, 1, 0, 0.6117647, 1,
1.228316, -1.722939, 0.5418212, 1, 0, 0.6078432, 1,
1.237667, -1.065671, 3.3696, 1, 0, 0.6, 1,
1.243361, 0.7564023, -0.5930076, 1, 0, 0.5921569, 1,
1.244011, -1.502639, 3.012825, 1, 0, 0.5882353, 1,
1.248459, -1.392279, 2.427586, 1, 0, 0.5803922, 1,
1.255823, -0.001273595, 2.005153, 1, 0, 0.5764706, 1,
1.262185, -1.354946, 2.284895, 1, 0, 0.5686275, 1,
1.262264, 1.591903, -0.2719814, 1, 0, 0.5647059, 1,
1.271909, -1.633892, 1.699265, 1, 0, 0.5568628, 1,
1.272934, 0.6229013, 1.086016, 1, 0, 0.5529412, 1,
1.281588, 0.3343358, -0.6656909, 1, 0, 0.5450981, 1,
1.299328, -0.760794, 1.895667, 1, 0, 0.5411765, 1,
1.303095, -0.1149965, 0.2663166, 1, 0, 0.5333334, 1,
1.308831, -0.09262057, 1.339115, 1, 0, 0.5294118, 1,
1.309055, 0.2452863, 2.546907, 1, 0, 0.5215687, 1,
1.312001, -0.9872936, 3.209903, 1, 0, 0.5176471, 1,
1.328028, -1.329042, 1.566101, 1, 0, 0.509804, 1,
1.329843, 0.890613, 1.186298, 1, 0, 0.5058824, 1,
1.335203, -0.8559971, 2.019454, 1, 0, 0.4980392, 1,
1.340109, 0.4394685, 0.8348916, 1, 0, 0.4901961, 1,
1.342872, -0.819259, 2.849165, 1, 0, 0.4862745, 1,
1.34536, -0.528726, 2.717145, 1, 0, 0.4784314, 1,
1.346586, 0.64518, -0.1595924, 1, 0, 0.4745098, 1,
1.357561, 0.8931186, -1.366432, 1, 0, 0.4666667, 1,
1.363604, 0.2526824, 1.580456, 1, 0, 0.4627451, 1,
1.376453, -0.3224623, 3.189147, 1, 0, 0.454902, 1,
1.38268, 0.8503673, 0.3469896, 1, 0, 0.4509804, 1,
1.38385, -0.5115335, 2.898117, 1, 0, 0.4431373, 1,
1.388473, -0.05451153, 0.8066688, 1, 0, 0.4392157, 1,
1.406364, -0.1168148, -0.3458264, 1, 0, 0.4313726, 1,
1.408213, 0.7448546, 2.709194, 1, 0, 0.427451, 1,
1.422713, -1.818552, 3.388675, 1, 0, 0.4196078, 1,
1.425387, 0.5112861, 1.781763, 1, 0, 0.4156863, 1,
1.441255, 0.8714608, 1.186005, 1, 0, 0.4078431, 1,
1.452357, -0.08056239, 1.317265, 1, 0, 0.4039216, 1,
1.459939, 0.1896749, 1.08266, 1, 0, 0.3960784, 1,
1.463316, -0.3803492, 2.437249, 1, 0, 0.3882353, 1,
1.465121, 0.419237, 0.03189845, 1, 0, 0.3843137, 1,
1.471131, -1.373475, 2.561924, 1, 0, 0.3764706, 1,
1.49366, -0.7028807, 1.494505, 1, 0, 0.372549, 1,
1.501385, 0.5927293, 1.24426, 1, 0, 0.3647059, 1,
1.504038, 1.698674, -0.4260719, 1, 0, 0.3607843, 1,
1.504601, 1.831988, 0.638662, 1, 0, 0.3529412, 1,
1.504897, -0.5452736, 0.9411047, 1, 0, 0.3490196, 1,
1.513312, -0.5580024, 1.190577, 1, 0, 0.3411765, 1,
1.541229, 0.5914901, 0.8732428, 1, 0, 0.3372549, 1,
1.544393, -0.1011288, 0.7750401, 1, 0, 0.3294118, 1,
1.545986, 1.939496, 1.143427, 1, 0, 0.3254902, 1,
1.546241, 0.4521455, 2.076215, 1, 0, 0.3176471, 1,
1.546404, -0.6559398, 2.946397, 1, 0, 0.3137255, 1,
1.559884, 0.7239458, 1.373919, 1, 0, 0.3058824, 1,
1.5624, -0.4174471, 1.92442, 1, 0, 0.2980392, 1,
1.574519, 0.5427177, 1.572635, 1, 0, 0.2941177, 1,
1.593479, -0.6764616, 2.132712, 1, 0, 0.2862745, 1,
1.613362, -0.5425576, 4.698401, 1, 0, 0.282353, 1,
1.634443, 2.078233, 0.7805684, 1, 0, 0.2745098, 1,
1.634971, -0.2623007, 1.1275, 1, 0, 0.2705882, 1,
1.639311, 0.9613292, 2.391659, 1, 0, 0.2627451, 1,
1.6589, 0.6642967, 1.937492, 1, 0, 0.2588235, 1,
1.669562, -0.5479814, 2.617726, 1, 0, 0.2509804, 1,
1.686023, -1.128718, 1.28235, 1, 0, 0.2470588, 1,
1.691817, 1.123745, 1.750124, 1, 0, 0.2392157, 1,
1.692283, 1.896233, 0.938311, 1, 0, 0.2352941, 1,
1.703784, 0.9541103, 2.263256, 1, 0, 0.227451, 1,
1.705568, 0.127234, 1.850904, 1, 0, 0.2235294, 1,
1.706655, -0.5833744, 1.852054, 1, 0, 0.2156863, 1,
1.713577, 0.9307831, 0.3321975, 1, 0, 0.2117647, 1,
1.724256, 1.211721, 1.387814, 1, 0, 0.2039216, 1,
1.748525, 2.017372, 1.391784, 1, 0, 0.1960784, 1,
1.749271, -0.7281843, 1.092591, 1, 0, 0.1921569, 1,
1.749832, -0.5777108, 1.049332, 1, 0, 0.1843137, 1,
1.755852, 0.6268426, 3.08228, 1, 0, 0.1803922, 1,
1.776973, -0.4970149, 3.389854, 1, 0, 0.172549, 1,
1.819942, 0.8296385, 0.6172034, 1, 0, 0.1686275, 1,
1.850845, 0.1276721, 1.588336, 1, 0, 0.1607843, 1,
1.856756, 1.430477, 0.6311842, 1, 0, 0.1568628, 1,
1.883742, 0.9615983, 3.030957, 1, 0, 0.1490196, 1,
1.891152, -0.5796226, 1.952953, 1, 0, 0.145098, 1,
1.89473, 0.1978259, 1.35262, 1, 0, 0.1372549, 1,
1.95207, 0.1149694, 1.578172, 1, 0, 0.1333333, 1,
1.958486, -0.518446, 0.9860151, 1, 0, 0.1254902, 1,
1.976043, 2.003407, 1.447497, 1, 0, 0.1215686, 1,
1.990251, -0.9499092, 1.52546, 1, 0, 0.1137255, 1,
2.002385, 1.084141, 1.807784, 1, 0, 0.1098039, 1,
2.064468, -0.1405187, 2.428041, 1, 0, 0.1019608, 1,
2.075726, -0.4458717, 1.754349, 1, 0, 0.09411765, 1,
2.10224, 1.120378, 2.178429, 1, 0, 0.09019608, 1,
2.128265, 0.710054, 0.3157122, 1, 0, 0.08235294, 1,
2.22134, -0.6753803, 0.6521968, 1, 0, 0.07843138, 1,
2.318882, 0.2224916, 1.046974, 1, 0, 0.07058824, 1,
2.332871, -1.690722, 4.426841, 1, 0, 0.06666667, 1,
2.364275, -0.5940421, 2.370274, 1, 0, 0.05882353, 1,
2.364872, 0.2593057, 1.742897, 1, 0, 0.05490196, 1,
2.378115, 1.085315, 0.7031015, 1, 0, 0.04705882, 1,
2.439743, -1.012249, 1.290524, 1, 0, 0.04313726, 1,
2.604244, -0.2115739, 1.039413, 1, 0, 0.03529412, 1,
2.621761, -0.3841865, 0.8097418, 1, 0, 0.03137255, 1,
2.663886, 2.998674, 0.9841279, 1, 0, 0.02352941, 1,
2.683774, 0.9849704, 0.2881746, 1, 0, 0.01960784, 1,
2.728131, -1.932271, 1.98277, 1, 0, 0.01176471, 1,
3.305081, -0.8776242, 0.4290926, 1, 0, 0.007843138, 1
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
-0.007758498, -4.235847, -8.432975, 0, -0.5, 0.5, 0.5,
-0.007758498, -4.235847, -8.432975, 1, -0.5, 0.5, 0.5,
-0.007758498, -4.235847, -8.432975, 1, 1.5, 0.5, 0.5,
-0.007758498, -4.235847, -8.432975, 0, 1.5, 0.5, 0.5
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
-4.44365, 0.1325731, -8.432975, 0, -0.5, 0.5, 0.5,
-4.44365, 0.1325731, -8.432975, 1, -0.5, 0.5, 0.5,
-4.44365, 0.1325731, -8.432975, 1, 1.5, 0.5, 0.5,
-4.44365, 0.1325731, -8.432975, 0, 1.5, 0.5, 0.5
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
-4.44365, -4.235847, -0.7337403, 0, -0.5, 0.5, 0.5,
-4.44365, -4.235847, -0.7337403, 1, -0.5, 0.5, 0.5,
-4.44365, -4.235847, -0.7337403, 1, 1.5, 0.5, 0.5,
-4.44365, -4.235847, -0.7337403, 0, 1.5, 0.5, 0.5
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
-3, -3.22775, -6.656229,
3, -3.22775, -6.656229,
-3, -3.22775, -6.656229,
-3, -3.395766, -6.952353,
-2, -3.22775, -6.656229,
-2, -3.395766, -6.952353,
-1, -3.22775, -6.656229,
-1, -3.395766, -6.952353,
0, -3.22775, -6.656229,
0, -3.395766, -6.952353,
1, -3.22775, -6.656229,
1, -3.395766, -6.952353,
2, -3.22775, -6.656229,
2, -3.395766, -6.952353,
3, -3.22775, -6.656229,
3, -3.395766, -6.952353
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
-3, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
-3, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
-3, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
-3, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
-2, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
-2, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
-2, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
-2, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
-1, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
-1, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
-1, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
-1, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
0, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
0, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
0, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
0, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
1, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
1, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
1, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
1, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
2, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
2, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
2, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
2, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5,
3, -3.731798, -7.544602, 0, -0.5, 0.5, 0.5,
3, -3.731798, -7.544602, 1, -0.5, 0.5, 0.5,
3, -3.731798, -7.544602, 1, 1.5, 0.5, 0.5,
3, -3.731798, -7.544602, 0, 1.5, 0.5, 0.5
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
-3.419983, -3, -6.656229,
-3.419983, 3, -6.656229,
-3.419983, -3, -6.656229,
-3.590594, -3, -6.952353,
-3.419983, -2, -6.656229,
-3.590594, -2, -6.952353,
-3.419983, -1, -6.656229,
-3.590594, -1, -6.952353,
-3.419983, 0, -6.656229,
-3.590594, 0, -6.952353,
-3.419983, 1, -6.656229,
-3.590594, 1, -6.952353,
-3.419983, 2, -6.656229,
-3.590594, 2, -6.952353,
-3.419983, 3, -6.656229,
-3.590594, 3, -6.952353
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
-3.931817, -3, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, -3, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, -3, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, -3, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, -2, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, -2, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, -2, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, -2, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, -1, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, -1, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, -1, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, -1, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, 0, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, 0, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, 0, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, 0, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, 1, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, 1, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, 1, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, 1, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, 2, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, 2, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, 2, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, 2, -7.544602, 0, 1.5, 0.5, 0.5,
-3.931817, 3, -7.544602, 0, -0.5, 0.5, 0.5,
-3.931817, 3, -7.544602, 1, -0.5, 0.5, 0.5,
-3.931817, 3, -7.544602, 1, 1.5, 0.5, 0.5,
-3.931817, 3, -7.544602, 0, 1.5, 0.5, 0.5
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
-3.419983, -3.22775, -6,
-3.419983, -3.22775, 4,
-3.419983, -3.22775, -6,
-3.590594, -3.395766, -6,
-3.419983, -3.22775, -4,
-3.590594, -3.395766, -4,
-3.419983, -3.22775, -2,
-3.590594, -3.395766, -2,
-3.419983, -3.22775, 0,
-3.590594, -3.395766, 0,
-3.419983, -3.22775, 2,
-3.590594, -3.395766, 2,
-3.419983, -3.22775, 4,
-3.590594, -3.395766, 4
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
-3.931817, -3.731798, -6, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -6, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -6, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, -6, 0, 1.5, 0.5, 0.5,
-3.931817, -3.731798, -4, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -4, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -4, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, -4, 0, 1.5, 0.5, 0.5,
-3.931817, -3.731798, -2, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -2, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, -2, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, -2, 0, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 0, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 0, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 0, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 0, 0, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 2, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 2, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 2, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 2, 0, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 4, 0, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 4, 1, -0.5, 0.5, 0.5,
-3.931817, -3.731798, 4, 1, 1.5, 0.5, 0.5,
-3.931817, -3.731798, 4, 0, 1.5, 0.5, 0.5
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
-3.419983, -3.22775, -6.656229,
-3.419983, 3.492896, -6.656229,
-3.419983, -3.22775, 5.188748,
-3.419983, 3.492896, 5.188748,
-3.419983, -3.22775, -6.656229,
-3.419983, -3.22775, 5.188748,
-3.419983, 3.492896, -6.656229,
-3.419983, 3.492896, 5.188748,
-3.419983, -3.22775, -6.656229,
3.404466, -3.22775, -6.656229,
-3.419983, -3.22775, 5.188748,
3.404466, -3.22775, 5.188748,
-3.419983, 3.492896, -6.656229,
3.404466, 3.492896, -6.656229,
-3.419983, 3.492896, 5.188748,
3.404466, 3.492896, 5.188748,
3.404466, -3.22775, -6.656229,
3.404466, 3.492896, -6.656229,
3.404466, -3.22775, 5.188748,
3.404466, 3.492896, 5.188748,
3.404466, -3.22775, -6.656229,
3.404466, -3.22775, 5.188748,
3.404466, 3.492896, -6.656229,
3.404466, 3.492896, 5.188748
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
var radius = 8.134115;
var distance = 36.1896;
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
mvMatrix.translate( 0.007758498, -0.1325731, 0.7337403 );
mvMatrix.scale( 1.288714, 1.308619, 0.742489 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.1896);
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
piperophos<-read.table("piperophos.xyz")
```

```
## Error in read.table("piperophos.xyz"): no lines available in input
```

```r
x<-piperophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
```

```r
y<-piperophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
```

```r
z<-piperophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
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
-3.320598, -0.3309994, -2.197134, 0, 0, 1, 1, 1,
-3.171666, -1.963187, -2.083681, 1, 0, 0, 1, 1,
-3.169017, -0.6591741, -1.908842, 1, 0, 0, 1, 1,
-2.990881, 0.1028435, -0.9049429, 1, 0, 0, 1, 1,
-2.810765, 0.2487002, -1.6671, 1, 0, 0, 1, 1,
-2.582374, -0.6221191, -2.895775, 1, 0, 0, 1, 1,
-2.54809, -0.467082, -0.6283152, 0, 0, 0, 1, 1,
-2.493705, 0.8698228, -1.903185, 0, 0, 0, 1, 1,
-2.409768, 0.2250702, -2.397932, 0, 0, 0, 1, 1,
-2.297698, 0.429116, -2.92225, 0, 0, 0, 1, 1,
-2.202918, -0.9759893, -0.7929392, 0, 0, 0, 1, 1,
-2.159246, -0.8430833, -0.6188376, 0, 0, 0, 1, 1,
-2.157771, -1.353793, -2.698681, 0, 0, 0, 1, 1,
-2.146785, 0.9738111, -1.807505, 1, 1, 1, 1, 1,
-2.131453, -0.1944957, -1.38697, 1, 1, 1, 1, 1,
-2.123557, 0.3030135, -2.596376, 1, 1, 1, 1, 1,
-2.111724, -0.05531788, -0.9065155, 1, 1, 1, 1, 1,
-2.110665, 0.3017284, -1.440706, 1, 1, 1, 1, 1,
-2.090305, 0.9378554, -0.3618952, 1, 1, 1, 1, 1,
-2.085615, -0.1184929, -0.9800193, 1, 1, 1, 1, 1,
-2.080633, -0.3936337, -3.33592, 1, 1, 1, 1, 1,
-2.068899, -0.2869954, -2.315209, 1, 1, 1, 1, 1,
-2.039061, -0.2682912, -2.430841, 1, 1, 1, 1, 1,
-2.007883, -0.457846, -1.237917, 1, 1, 1, 1, 1,
-1.945023, 0.2454984, -0.2971416, 1, 1, 1, 1, 1,
-1.916501, -0.01433607, -2.15473, 1, 1, 1, 1, 1,
-1.912569, -0.1469035, -1.035567, 1, 1, 1, 1, 1,
-1.896075, -0.4051055, -1.319936, 1, 1, 1, 1, 1,
-1.882624, -0.1119094, -1.697074, 0, 0, 1, 1, 1,
-1.862896, -1.058929, -3.208137, 1, 0, 0, 1, 1,
-1.856359, 1.19378, -1.678513, 1, 0, 0, 1, 1,
-1.847169, 0.2858381, -2.162794, 1, 0, 0, 1, 1,
-1.845081, 0.6372029, -1.501032, 1, 0, 0, 1, 1,
-1.836603, -0.4262811, -0.6390824, 1, 0, 0, 1, 1,
-1.824347, -1.759096, -3.472293, 0, 0, 0, 1, 1,
-1.817464, 0.7587199, -1.544438, 0, 0, 0, 1, 1,
-1.815789, -0.0535745, -1.763172, 0, 0, 0, 1, 1,
-1.771002, -0.4301787, -2.002481, 0, 0, 0, 1, 1,
-1.764083, 0.1971135, -3.229825, 0, 0, 0, 1, 1,
-1.747677, 0.3383813, -2.884793, 0, 0, 0, 1, 1,
-1.736273, -2.065057, -1.880283, 0, 0, 0, 1, 1,
-1.7299, -1.506608, -1.674609, 1, 1, 1, 1, 1,
-1.71885, -0.2933105, -0.8165742, 1, 1, 1, 1, 1,
-1.705505, 0.6007443, -1.045485, 1, 1, 1, 1, 1,
-1.70074, -0.1053675, -0.9427193, 1, 1, 1, 1, 1,
-1.686097, 0.6126702, -1.013397, 1, 1, 1, 1, 1,
-1.679981, -0.8318745, -0.6405235, 1, 1, 1, 1, 1,
-1.678886, 2.253114, -0.6129675, 1, 1, 1, 1, 1,
-1.653426, -1.132099, -2.053906, 1, 1, 1, 1, 1,
-1.631918, -0.3491049, -1.293137, 1, 1, 1, 1, 1,
-1.602038, -0.2506697, -1.429557, 1, 1, 1, 1, 1,
-1.593933, -0.5798315, -2.466983, 1, 1, 1, 1, 1,
-1.593435, -1.237421, -1.881243, 1, 1, 1, 1, 1,
-1.593089, -2.112314, -0.9629625, 1, 1, 1, 1, 1,
-1.590306, 1.244644, -2.423548, 1, 1, 1, 1, 1,
-1.582505, -1.213507, -0.5426647, 1, 1, 1, 1, 1,
-1.580084, -1.958669, -2.524727, 0, 0, 1, 1, 1,
-1.565588, -1.194688, -1.161938, 1, 0, 0, 1, 1,
-1.559142, 0.7693952, 0.4120655, 1, 0, 0, 1, 1,
-1.549368, 1.864776, -1.635081, 1, 0, 0, 1, 1,
-1.546178, -0.4888264, -1.437273, 1, 0, 0, 1, 1,
-1.544272, -0.3716333, -2.47896, 1, 0, 0, 1, 1,
-1.544229, 0.2971623, 0.8871737, 0, 0, 0, 1, 1,
-1.521717, 0.4577902, -1.641634, 0, 0, 0, 1, 1,
-1.520197, 0.1992791, 0.06637448, 0, 0, 0, 1, 1,
-1.517091, -0.4745457, -1.182892, 0, 0, 0, 1, 1,
-1.515886, -1.97904, -1.997575, 0, 0, 0, 1, 1,
-1.512464, -0.8371258, -1.30303, 0, 0, 0, 1, 1,
-1.497896, 2.517044, -0.9512131, 0, 0, 0, 1, 1,
-1.49142, -0.6013439, -3.107184, 1, 1, 1, 1, 1,
-1.481885, -1.297415, -1.564489, 1, 1, 1, 1, 1,
-1.474684, -0.1925402, -1.511848, 1, 1, 1, 1, 1,
-1.457945, 1.163312, -0.2552829, 1, 1, 1, 1, 1,
-1.455517, -0.08735078, -3.330512, 1, 1, 1, 1, 1,
-1.455174, 1.669612, 0.04796692, 1, 1, 1, 1, 1,
-1.425252, -0.831677, -2.874816, 1, 1, 1, 1, 1,
-1.420675, -0.9205643, -2.2718, 1, 1, 1, 1, 1,
-1.407312, -0.7956191, -2.029027, 1, 1, 1, 1, 1,
-1.390121, 1.063419, 0.07012681, 1, 1, 1, 1, 1,
-1.389842, 0.09632687, -0.009757102, 1, 1, 1, 1, 1,
-1.381876, -0.8102142, -1.456841, 1, 1, 1, 1, 1,
-1.377477, 1.32876, -1.095899, 1, 1, 1, 1, 1,
-1.374236, -0.2579505, -1.950563, 1, 1, 1, 1, 1,
-1.372913, -0.7916875, -1.75545, 1, 1, 1, 1, 1,
-1.372427, -0.648617, -0.991026, 0, 0, 1, 1, 1,
-1.368416, -2.424027, -2.024389, 1, 0, 0, 1, 1,
-1.362566, -1.360101, -3.071514, 1, 0, 0, 1, 1,
-1.359973, -0.1644588, -2.099844, 1, 0, 0, 1, 1,
-1.35237, -1.92159, -0.9861284, 1, 0, 0, 1, 1,
-1.345384, -2.039419, -2.808038, 1, 0, 0, 1, 1,
-1.333168, -0.1948964, -1.352768, 0, 0, 0, 1, 1,
-1.319683, 0.4184772, -2.244315, 0, 0, 0, 1, 1,
-1.301573, 0.6462323, -0.9725206, 0, 0, 0, 1, 1,
-1.296909, 1.800478, -1.972876, 0, 0, 0, 1, 1,
-1.25898, -0.5977059, -3.114354, 0, 0, 0, 1, 1,
-1.257128, 1.154387, -1.164788, 0, 0, 0, 1, 1,
-1.247654, -1.115667, -1.610829, 0, 0, 0, 1, 1,
-1.24551, -0.005993304, -0.4346777, 1, 1, 1, 1, 1,
-1.233793, -0.8379794, -2.87786, 1, 1, 1, 1, 1,
-1.229263, 0.01165169, -1.642072, 1, 1, 1, 1, 1,
-1.222185, 0.8865468, -0.8805979, 1, 1, 1, 1, 1,
-1.217847, 1.330204, -0.2355028, 1, 1, 1, 1, 1,
-1.217439, 2.219399, 1.938246, 1, 1, 1, 1, 1,
-1.21482, 1.324949, 0.1515002, 1, 1, 1, 1, 1,
-1.205825, 0.1315372, 0.250189, 1, 1, 1, 1, 1,
-1.187334, 1.184351, -2.384252, 1, 1, 1, 1, 1,
-1.182727, 1.11919, -2.089302, 1, 1, 1, 1, 1,
-1.176989, 0.9326316, -1.028245, 1, 1, 1, 1, 1,
-1.175337, 0.06871116, -1.003251, 1, 1, 1, 1, 1,
-1.173385, 1.175874, -0.1808111, 1, 1, 1, 1, 1,
-1.171713, -0.3275132, -2.610081, 1, 1, 1, 1, 1,
-1.163248, 0.5893992, -2.009226, 1, 1, 1, 1, 1,
-1.160207, -0.9539659, -0.8411525, 0, 0, 1, 1, 1,
-1.156098, 0.08020328, -0.1613865, 1, 0, 0, 1, 1,
-1.155844, 0.8923619, -0.09739745, 1, 0, 0, 1, 1,
-1.155621, -1.959017, -4.123465, 1, 0, 0, 1, 1,
-1.154472, -1.176173, -1.128687, 1, 0, 0, 1, 1,
-1.150611, -0.8768679, -0.3123677, 1, 0, 0, 1, 1,
-1.150355, 0.5063055, -2.414371, 0, 0, 0, 1, 1,
-1.146461, -1.380932, -3.145026, 0, 0, 0, 1, 1,
-1.143163, 1.488669, -0.2726617, 0, 0, 0, 1, 1,
-1.140184, 0.1191626, -2.19501, 0, 0, 0, 1, 1,
-1.139614, -0.6264355, -1.921438, 0, 0, 0, 1, 1,
-1.134623, -0.2515396, -1.556087, 0, 0, 0, 1, 1,
-1.131939, -0.3865327, -1.392815, 0, 0, 0, 1, 1,
-1.13124, -0.6933051, -2.310224, 1, 1, 1, 1, 1,
-1.130512, -0.5630068, -3.414798, 1, 1, 1, 1, 1,
-1.123632, 0.7724094, -0.4416386, 1, 1, 1, 1, 1,
-1.122685, -0.4211954, -1.793471, 1, 1, 1, 1, 1,
-1.120348, -1.227146, -1.636812, 1, 1, 1, 1, 1,
-1.11302, 0.7819327, 0.08202464, 1, 1, 1, 1, 1,
-1.112449, -0.4204787, -0.5854796, 1, 1, 1, 1, 1,
-1.112226, -0.7061083, -2.753104, 1, 1, 1, 1, 1,
-1.111664, -0.2091595, -1.919593, 1, 1, 1, 1, 1,
-1.107903, -0.910413, -1.226978, 1, 1, 1, 1, 1,
-1.106828, -1.515618, -2.5504, 1, 1, 1, 1, 1,
-1.10566, 0.986917, -0.1483593, 1, 1, 1, 1, 1,
-1.103339, -1.950213, -2.609423, 1, 1, 1, 1, 1,
-1.1008, 1.240547, -2.763256, 1, 1, 1, 1, 1,
-1.098737, -0.2283276, -1.395177, 1, 1, 1, 1, 1,
-1.098559, -0.9619728, -2.220376, 0, 0, 1, 1, 1,
-1.082448, 0.8592464, -0.6825113, 1, 0, 0, 1, 1,
-1.072154, -1.067311, -2.424281, 1, 0, 0, 1, 1,
-1.070448, 0.4457059, -2.709999, 1, 0, 0, 1, 1,
-1.068222, 1.356158, -1.314186, 1, 0, 0, 1, 1,
-1.06627, 1.340722, -1.095054, 1, 0, 0, 1, 1,
-1.064379, 0.1193488, -1.295711, 0, 0, 0, 1, 1,
-1.063222, -2.309425, -2.199307, 0, 0, 0, 1, 1,
-1.06035, -1.606501, -1.143927, 0, 0, 0, 1, 1,
-1.055339, -0.3853903, -3.458047, 0, 0, 0, 1, 1,
-1.054781, -0.2221971, -1.085763, 0, 0, 0, 1, 1,
-1.054475, 0.4255708, -1.110466, 0, 0, 0, 1, 1,
-1.051648, -0.5112752, -0.3806689, 0, 0, 0, 1, 1,
-1.051362, -2.002875, -2.018456, 1, 1, 1, 1, 1,
-1.046059, 0.4970645, -3.287386, 1, 1, 1, 1, 1,
-1.03563, -1.307487, -2.006846, 1, 1, 1, 1, 1,
-1.035377, 0.8718587, -1.006836, 1, 1, 1, 1, 1,
-1.027271, 1.077334, -1.203326, 1, 1, 1, 1, 1,
-1.022318, 1.149705, -0.5691155, 1, 1, 1, 1, 1,
-1.021692, 1.090361, 0.1866469, 1, 1, 1, 1, 1,
-1.019141, -1.153794, -2.554646, 1, 1, 1, 1, 1,
-1.013732, 0.03195698, -0.5214261, 1, 1, 1, 1, 1,
-1.007897, -0.9970711, -1.934336, 1, 1, 1, 1, 1,
-1.004774, 0.9680334, -0.6788181, 1, 1, 1, 1, 1,
-1.000442, -1.046829, -3.309874, 1, 1, 1, 1, 1,
-0.9995776, -0.7277308, -2.981473, 1, 1, 1, 1, 1,
-0.9938439, 0.5490007, -1.790221, 1, 1, 1, 1, 1,
-0.9856831, -1.576645, -2.247581, 1, 1, 1, 1, 1,
-0.9856415, 0.1945633, -0.4719228, 0, 0, 1, 1, 1,
-0.9777032, -2.011425, -4.60783, 1, 0, 0, 1, 1,
-0.9730541, -0.1329189, -2.489379, 1, 0, 0, 1, 1,
-0.9648377, -1.010238, -3.796013, 1, 0, 0, 1, 1,
-0.964189, -0.426838, -2.573591, 1, 0, 0, 1, 1,
-0.9526637, -1.433782, -2.757356, 1, 0, 0, 1, 1,
-0.9512229, -0.02009727, -1.97313, 0, 0, 0, 1, 1,
-0.9437684, 0.5277244, -1.132079, 0, 0, 0, 1, 1,
-0.9391319, 0.490127, -0.00167846, 0, 0, 0, 1, 1,
-0.9159884, 0.2233072, -0.8823431, 0, 0, 0, 1, 1,
-0.9097888, 2.877982, -0.630748, 0, 0, 0, 1, 1,
-0.9085585, 1.137132, 0.2397434, 0, 0, 0, 1, 1,
-0.8988189, -0.09661224, -1.787337, 0, 0, 0, 1, 1,
-0.8888135, -0.3496368, -1.203224, 1, 1, 1, 1, 1,
-0.8875864, -1.047799, -2.385727, 1, 1, 1, 1, 1,
-0.8856212, 0.4598196, -3.102886, 1, 1, 1, 1, 1,
-0.8841968, -0.4279978, -1.616363, 1, 1, 1, 1, 1,
-0.8826007, -0.7045424, -1.757926, 1, 1, 1, 1, 1,
-0.8784801, -0.1009184, -1.530768, 1, 1, 1, 1, 1,
-0.8623703, 0.07955646, -1.523039, 1, 1, 1, 1, 1,
-0.861236, -0.8378327, -1.998424, 1, 1, 1, 1, 1,
-0.8605548, -0.9000012, -2.158078, 1, 1, 1, 1, 1,
-0.8526738, 2.466307, 1.513949, 1, 1, 1, 1, 1,
-0.8410951, 0.8755517, -1.913145, 1, 1, 1, 1, 1,
-0.8358899, 0.5559281, -1.67887, 1, 1, 1, 1, 1,
-0.8341178, 0.440723, -1.548089, 1, 1, 1, 1, 1,
-0.8310735, 1.217343, 0.2232474, 1, 1, 1, 1, 1,
-0.821817, 0.3725039, -2.423118, 1, 1, 1, 1, 1,
-0.8212615, 0.9145384, -1.559978, 0, 0, 1, 1, 1,
-0.8171731, -1.831448, -3.572306, 1, 0, 0, 1, 1,
-0.8101076, -0.6695342, -1.83913, 1, 0, 0, 1, 1,
-0.8100586, 0.1998713, 0.710304, 1, 0, 0, 1, 1,
-0.8083141, 0.890406, -1.172116, 1, 0, 0, 1, 1,
-0.8077552, 0.9552388, -2.878426, 1, 0, 0, 1, 1,
-0.8067515, -0.2572562, -1.342565, 0, 0, 0, 1, 1,
-0.806513, 0.3605861, 0.04255534, 0, 0, 0, 1, 1,
-0.8045088, 0.0300658, -1.88477, 0, 0, 0, 1, 1,
-0.8042829, -0.1028671, -2.644563, 0, 0, 0, 1, 1,
-0.8037194, -0.277062, -2.016107, 0, 0, 0, 1, 1,
-0.8031346, -1.588024, -3.711473, 0, 0, 0, 1, 1,
-0.797428, 0.2549815, -0.6161276, 0, 0, 0, 1, 1,
-0.7959768, -0.3916597, -0.775044, 1, 1, 1, 1, 1,
-0.7927307, -0.5534968, -2.630107, 1, 1, 1, 1, 1,
-0.7922711, 0.2053726, -0.4058984, 1, 1, 1, 1, 1,
-0.7871211, -0.09943024, -1.278844, 1, 1, 1, 1, 1,
-0.7838909, -1.222692, -3.731682, 1, 1, 1, 1, 1,
-0.7778907, 0.2085589, -0.9354093, 1, 1, 1, 1, 1,
-0.7734228, 1.581459, -1.808913, 1, 1, 1, 1, 1,
-0.7719769, 0.1538801, -3.769418, 1, 1, 1, 1, 1,
-0.7691267, 0.545575, -1.001202, 1, 1, 1, 1, 1,
-0.769025, -0.9428583, -2.975157, 1, 1, 1, 1, 1,
-0.7646621, -1.040889, -1.354225, 1, 1, 1, 1, 1,
-0.7613505, 1.730169, -1.365567, 1, 1, 1, 1, 1,
-0.7519156, -1.155235, -1.412812, 1, 1, 1, 1, 1,
-0.7516604, -0.4455561, -4.143934, 1, 1, 1, 1, 1,
-0.749653, 0.6329534, -1.903866, 1, 1, 1, 1, 1,
-0.7453434, -0.7087354, -2.856363, 0, 0, 1, 1, 1,
-0.7449522, 0.03057596, -2.430609, 1, 0, 0, 1, 1,
-0.7441957, -2.199749, -1.949538, 1, 0, 0, 1, 1,
-0.7376006, -0.6387074, -2.631411, 1, 0, 0, 1, 1,
-0.7367871, 1.1029, -1.186847, 1, 0, 0, 1, 1,
-0.7363456, -0.7395822, -3.969245, 1, 0, 0, 1, 1,
-0.7358977, -2.543311, -4.863922, 0, 0, 0, 1, 1,
-0.7338071, 0.6103792, -0.4697088, 0, 0, 0, 1, 1,
-0.730376, -0.7606265, -2.776306, 0, 0, 0, 1, 1,
-0.7271703, -0.8167602, -0.6006333, 0, 0, 0, 1, 1,
-0.7261069, -0.3187714, -1.826946, 0, 0, 0, 1, 1,
-0.724631, 0.9350649, -0.8437449, 0, 0, 0, 1, 1,
-0.7237201, 0.09897795, -0.01295086, 0, 0, 0, 1, 1,
-0.7224368, -0.5081874, -1.486495, 1, 1, 1, 1, 1,
-0.7217081, 0.9967801, -1.376302, 1, 1, 1, 1, 1,
-0.7181764, 0.1248737, -2.432575, 1, 1, 1, 1, 1,
-0.7167533, 1.137402, -0.916559, 1, 1, 1, 1, 1,
-0.715859, 0.1001244, -1.447968, 1, 1, 1, 1, 1,
-0.713053, 1.489747, -0.5850657, 1, 1, 1, 1, 1,
-0.7062403, -2.190773, -4.027439, 1, 1, 1, 1, 1,
-0.7025305, 0.6612253, -1.934065, 1, 1, 1, 1, 1,
-0.7008975, -0.9766983, -3.404333, 1, 1, 1, 1, 1,
-0.6931946, 0.3774924, -1.029876, 1, 1, 1, 1, 1,
-0.6931905, -0.7353659, -1.740258, 1, 1, 1, 1, 1,
-0.6879877, 1.227164, -1.004485, 1, 1, 1, 1, 1,
-0.6866428, 2.193734, -0.001847749, 1, 1, 1, 1, 1,
-0.6865798, 0.09851087, -1.623464, 1, 1, 1, 1, 1,
-0.6842991, 1.022563, -1.366664, 1, 1, 1, 1, 1,
-0.6835588, 0.1585677, -0.4385126, 0, 0, 1, 1, 1,
-0.6799176, -0.7205097, -2.993444, 1, 0, 0, 1, 1,
-0.6745653, 0.5517575, -1.357092, 1, 0, 0, 1, 1,
-0.6719105, 0.6210234, -1.801463, 1, 0, 0, 1, 1,
-0.6714873, 0.3004146, -1.268743, 1, 0, 0, 1, 1,
-0.6712306, 0.6605297, -0.9575178, 1, 0, 0, 1, 1,
-0.6707409, -1.099237, -3.076751, 0, 0, 0, 1, 1,
-0.6687495, 0.6978214, -1.783978, 0, 0, 0, 1, 1,
-0.6635262, 0.6286204, -1.259602, 0, 0, 0, 1, 1,
-0.6591933, 0.6731989, -2.795142, 0, 0, 0, 1, 1,
-0.6535316, 2.541179, -0.3640387, 0, 0, 0, 1, 1,
-0.6508347, -2.461418, -3.625885, 0, 0, 0, 1, 1,
-0.6481428, 0.04386126, -1.716523, 0, 0, 0, 1, 1,
-0.646222, 2.040313, -2.717616, 1, 1, 1, 1, 1,
-0.6425585, 1.491874, -0.2410342, 1, 1, 1, 1, 1,
-0.6385084, -0.3558698, -1.333115, 1, 1, 1, 1, 1,
-0.6366, 1.166881, -0.6571523, 1, 1, 1, 1, 1,
-0.6336986, 0.2641446, -1.889732, 1, 1, 1, 1, 1,
-0.6322696, -0.6320945, -1.370105, 1, 1, 1, 1, 1,
-0.629185, -0.7665874, -0.5305911, 1, 1, 1, 1, 1,
-0.6202617, 0.9095193, -0.499723, 1, 1, 1, 1, 1,
-0.6191465, 1.015281, -0.3601916, 1, 1, 1, 1, 1,
-0.616142, 0.613978, -1.603182, 1, 1, 1, 1, 1,
-0.6087053, -1.135994, -3.024892, 1, 1, 1, 1, 1,
-0.605452, -1.639605, -1.266137, 1, 1, 1, 1, 1,
-0.6034967, -0.7287391, -0.9024, 1, 1, 1, 1, 1,
-0.5986585, 1.206705, -0.4241928, 1, 1, 1, 1, 1,
-0.5979089, 2.085843, -0.1373608, 1, 1, 1, 1, 1,
-0.5968453, -0.5711761, -0.9802608, 0, 0, 1, 1, 1,
-0.5964482, -0.05323242, -2.079561, 1, 0, 0, 1, 1,
-0.5962572, -1.041747, -2.732473, 1, 0, 0, 1, 1,
-0.5938464, -2.583697, -2.99109, 1, 0, 0, 1, 1,
-0.5915754, 0.8008754, -1.102503, 1, 0, 0, 1, 1,
-0.5866458, 1.557478, -1.654697, 1, 0, 0, 1, 1,
-0.582674, 1.407376, -1.678776, 0, 0, 0, 1, 1,
-0.5792542, -0.5848813, -3.284746, 0, 0, 0, 1, 1,
-0.5743037, -0.6494415, -2.694622, 0, 0, 0, 1, 1,
-0.5721226, -2.700741, -2.326832, 0, 0, 0, 1, 1,
-0.5697522, -0.3153213, -1.857928, 0, 0, 0, 1, 1,
-0.5602101, -0.2870681, -2.423828, 0, 0, 0, 1, 1,
-0.5558471, -0.9249233, -2.026128, 0, 0, 0, 1, 1,
-0.5552313, -0.6588708, -2.408338, 1, 1, 1, 1, 1,
-0.5490055, 0.9014996, -1.622677, 1, 1, 1, 1, 1,
-0.5476107, -0.3675311, -1.595052, 1, 1, 1, 1, 1,
-0.5471298, 0.06905237, -1.622695, 1, 1, 1, 1, 1,
-0.5448073, 0.7553109, -2.028705, 1, 1, 1, 1, 1,
-0.5440724, -0.2334527, -1.674166, 1, 1, 1, 1, 1,
-0.5425931, -0.2296826, -1.224352, 1, 1, 1, 1, 1,
-0.5410423, -1.463157, -3.011146, 1, 1, 1, 1, 1,
-0.5387422, 0.6370668, -1.202575, 1, 1, 1, 1, 1,
-0.5370398, 0.2061415, -1.4216, 1, 1, 1, 1, 1,
-0.5335777, 0.3835652, -1.558659, 1, 1, 1, 1, 1,
-0.5218828, -2.440701, -2.051538, 1, 1, 1, 1, 1,
-0.5193639, 0.2959405, -1.174278, 1, 1, 1, 1, 1,
-0.5092378, -0.286441, -2.464601, 1, 1, 1, 1, 1,
-0.5053877, 0.4898024, -1.30422, 1, 1, 1, 1, 1,
-0.4996997, -2.445801, -2.761817, 0, 0, 1, 1, 1,
-0.4990366, 0.2573719, 0.1779081, 1, 0, 0, 1, 1,
-0.498161, 0.7644683, 0.08616304, 1, 0, 0, 1, 1,
-0.4979585, 0.5036256, -1.335018, 1, 0, 0, 1, 1,
-0.4976243, 1.0782, 0.1608613, 1, 0, 0, 1, 1,
-0.4971555, -0.483188, -2.696778, 1, 0, 0, 1, 1,
-0.4969578, 1.071074, -0.2564539, 0, 0, 0, 1, 1,
-0.4915134, -0.2803736, -3.197977, 0, 0, 0, 1, 1,
-0.4913969, 0.6278264, 0.7253423, 0, 0, 0, 1, 1,
-0.4888601, 2.481139, -1.021592, 0, 0, 0, 1, 1,
-0.4838203, -1.078041, -3.913758, 0, 0, 0, 1, 1,
-0.4831376, 1.576753, -0.3045607, 0, 0, 0, 1, 1,
-0.4822027, -0.02973629, -2.330703, 0, 0, 0, 1, 1,
-0.4810555, 0.2485983, -0.7490644, 1, 1, 1, 1, 1,
-0.4771167, 0.1208025, -2.460785, 1, 1, 1, 1, 1,
-0.4748936, -0.3355605, -1.449291, 1, 1, 1, 1, 1,
-0.4733921, -1.246693, -1.230881, 1, 1, 1, 1, 1,
-0.4725536, -0.3878008, -4.193804, 1, 1, 1, 1, 1,
-0.4714882, 2.211155, -0.8519089, 1, 1, 1, 1, 1,
-0.471439, 2.0622, -1.114037, 1, 1, 1, 1, 1,
-0.4644824, -1.295377, -2.293257, 1, 1, 1, 1, 1,
-0.4634147, -0.974662, -3.673455, 1, 1, 1, 1, 1,
-0.4621451, -0.4013268, -1.46707, 1, 1, 1, 1, 1,
-0.4599606, -0.5525875, -2.105933, 1, 1, 1, 1, 1,
-0.459701, 0.7768887, 2.05735, 1, 1, 1, 1, 1,
-0.4592859, 0.8597981, 1.826605, 1, 1, 1, 1, 1,
-0.4584336, -0.1680465, -2.484926, 1, 1, 1, 1, 1,
-0.4581421, -0.06913742, -1.171405, 1, 1, 1, 1, 1,
-0.457756, 2.122512, -0.395261, 0, 0, 1, 1, 1,
-0.4562534, -1.012891, -2.640117, 1, 0, 0, 1, 1,
-0.4498497, 0.7072883, -1.833514, 1, 0, 0, 1, 1,
-0.4475536, -1.123575, -3.369328, 1, 0, 0, 1, 1,
-0.4447404, 1.204436, -2.509979, 1, 0, 0, 1, 1,
-0.4388929, 0.8106387, 0.3803888, 1, 0, 0, 1, 1,
-0.4304218, -0.4376451, -2.335706, 0, 0, 0, 1, 1,
-0.4302806, -1.352883, -3.148329, 0, 0, 0, 1, 1,
-0.4301324, -0.02626671, -1.334511, 0, 0, 0, 1, 1,
-0.4289179, 0.02162838, -1.36483, 0, 0, 0, 1, 1,
-0.4278577, 1.085437, 0.8050855, 0, 0, 0, 1, 1,
-0.4262986, -0.7584623, -2.411364, 0, 0, 0, 1, 1,
-0.424873, -0.6778301, -2.72038, 0, 0, 0, 1, 1,
-0.4217319, 0.1320629, 0.5464481, 1, 1, 1, 1, 1,
-0.4190337, -1.84638, -2.417625, 1, 1, 1, 1, 1,
-0.4139673, -0.9079449, -2.151693, 1, 1, 1, 1, 1,
-0.4133279, -1.243126, -2.075689, 1, 1, 1, 1, 1,
-0.4099086, 0.9448999, 0.05634896, 1, 1, 1, 1, 1,
-0.4087977, -1.841241, -2.274211, 1, 1, 1, 1, 1,
-0.4087729, -0.2934278, -1.965708, 1, 1, 1, 1, 1,
-0.4069182, -0.518398, -3.388863, 1, 1, 1, 1, 1,
-0.4054164, -0.8026651, -2.647904, 1, 1, 1, 1, 1,
-0.4034414, -1.365123, -2.801244, 1, 1, 1, 1, 1,
-0.4011563, 1.005169, 1.222641, 1, 1, 1, 1, 1,
-0.3996535, 0.725728, -0.3318249, 1, 1, 1, 1, 1,
-0.3993216, -1.493422, -2.960804, 1, 1, 1, 1, 1,
-0.3990296, 0.883127, -0.2843187, 1, 1, 1, 1, 1,
-0.3982576, 0.5434482, -1.080244, 1, 1, 1, 1, 1,
-0.3978292, 0.1758451, -0.2555583, 0, 0, 1, 1, 1,
-0.3947345, -0.1669144, -2.383251, 1, 0, 0, 1, 1,
-0.3876975, -0.1100183, -2.837381, 1, 0, 0, 1, 1,
-0.3804575, -0.597511, -2.174532, 1, 0, 0, 1, 1,
-0.3765433, -1.759093, -3.744301, 1, 0, 0, 1, 1,
-0.3741606, 1.423035, -1.011298, 1, 0, 0, 1, 1,
-0.3712743, 1.908839, -0.4869852, 0, 0, 0, 1, 1,
-0.3703979, 0.6490351, -2.229838, 0, 0, 0, 1, 1,
-0.3627972, -0.1009884, -1.442956, 0, 0, 0, 1, 1,
-0.3589514, -0.9501321, -2.891323, 0, 0, 0, 1, 1,
-0.355281, 0.5077326, -0.23924, 0, 0, 0, 1, 1,
-0.3511588, 0.05770073, -0.7986857, 0, 0, 0, 1, 1,
-0.3507994, 0.747184, -1.505443, 0, 0, 0, 1, 1,
-0.350707, -0.9371063, -2.897042, 1, 1, 1, 1, 1,
-0.3450084, 1.302547, 0.5485689, 1, 1, 1, 1, 1,
-0.3446212, -1.086948, -3.673836, 1, 1, 1, 1, 1,
-0.3320407, -0.4068708, -3.613969, 1, 1, 1, 1, 1,
-0.3317642, -1.084032, -2.683631, 1, 1, 1, 1, 1,
-0.3308276, 0.6488956, 0.1506698, 1, 1, 1, 1, 1,
-0.3297558, 0.1196159, -1.312818, 1, 1, 1, 1, 1,
-0.3231481, 0.152385, -0.3490324, 1, 1, 1, 1, 1,
-0.3194705, 0.9626873, -0.01575178, 1, 1, 1, 1, 1,
-0.3143339, 1.989336, -0.411653, 1, 1, 1, 1, 1,
-0.3073442, 0.1340092, 0.1417554, 1, 1, 1, 1, 1,
-0.307154, 0.1501358, 0.04304521, 1, 1, 1, 1, 1,
-0.3065877, -0.2265163, -3.278685, 1, 1, 1, 1, 1,
-0.3009714, 0.6709325, -0.7329992, 1, 1, 1, 1, 1,
-0.2956078, 0.2288469, -0.7661415, 1, 1, 1, 1, 1,
-0.292252, -1.568333, -2.299063, 0, 0, 1, 1, 1,
-0.2917106, 0.5050588, -0.6333282, 1, 0, 0, 1, 1,
-0.2911751, -0.1240896, -0.04555078, 1, 0, 0, 1, 1,
-0.2822823, -0.3227838, -1.515813, 1, 0, 0, 1, 1,
-0.2784521, -0.5034931, -1.670964, 1, 0, 0, 1, 1,
-0.273298, -0.5925898, -2.337986, 1, 0, 0, 1, 1,
-0.2727325, -0.85677, -3.46025, 0, 0, 0, 1, 1,
-0.2699075, 0.7710171, -1.3892, 0, 0, 0, 1, 1,
-0.2659835, 1.003526, 0.1471922, 0, 0, 0, 1, 1,
-0.2656974, 1.598422, -0.4599509, 0, 0, 0, 1, 1,
-0.2646052, 1.053862, 0.723515, 0, 0, 0, 1, 1,
-0.2587102, 0.6839105, -1.131833, 0, 0, 0, 1, 1,
-0.2559317, -0.457855, -2.780766, 0, 0, 0, 1, 1,
-0.248694, -0.4543537, -2.567426, 1, 1, 1, 1, 1,
-0.2470391, 0.7091084, -1.346519, 1, 1, 1, 1, 1,
-0.2450059, -0.4927755, -2.119299, 1, 1, 1, 1, 1,
-0.2421093, 1.072612, -2.217602, 1, 1, 1, 1, 1,
-0.2412313, -1.108826, -2.834516, 1, 1, 1, 1, 1,
-0.2385798, -0.3062871, -2.787623, 1, 1, 1, 1, 1,
-0.2380216, -0.5549412, -3.413118, 1, 1, 1, 1, 1,
-0.2377836, -2.436932, -3.28485, 1, 1, 1, 1, 1,
-0.2328234, 0.6097769, 1.302729, 1, 1, 1, 1, 1,
-0.2301946, -1.610747, -1.185217, 1, 1, 1, 1, 1,
-0.2298335, -0.01850285, -3.081254, 1, 1, 1, 1, 1,
-0.2258651, 0.3617611, -0.3482607, 1, 1, 1, 1, 1,
-0.2237257, -1.289536, -4.308126, 1, 1, 1, 1, 1,
-0.2171493, 0.2070185, -0.7706622, 1, 1, 1, 1, 1,
-0.2026325, -2.344086, -3.019691, 1, 1, 1, 1, 1,
-0.2008352, 0.02330463, -2.021202, 0, 0, 1, 1, 1,
-0.1878845, 0.3806612, -0.6819912, 1, 0, 0, 1, 1,
-0.1824437, 1.115934, 0.2357343, 1, 0, 0, 1, 1,
-0.1823997, 1.233425, -1.316232, 1, 0, 0, 1, 1,
-0.1727364, 1.545465, 0.7914257, 1, 0, 0, 1, 1,
-0.1722333, 0.8348525, 1.009452, 1, 0, 0, 1, 1,
-0.1646701, -0.6431856, -1.685967, 0, 0, 0, 1, 1,
-0.1597656, -0.7393271, -2.072603, 0, 0, 0, 1, 1,
-0.1565001, -0.004688485, -2.743511, 0, 0, 0, 1, 1,
-0.1540922, -1.685622, -0.05113347, 0, 0, 0, 1, 1,
-0.1523265, -1.093104, -3.638993, 0, 0, 0, 1, 1,
-0.1513282, -0.5881854, -3.465488, 0, 0, 0, 1, 1,
-0.1482805, 1.772372, -0.08796839, 0, 0, 0, 1, 1,
-0.1446051, 0.471962, -1.225026, 1, 1, 1, 1, 1,
-0.1423431, -1.054211, -2.982502, 1, 1, 1, 1, 1,
-0.1391717, -0.01930949, -4.031371, 1, 1, 1, 1, 1,
-0.1319946, 0.310174, -0.3879976, 1, 1, 1, 1, 1,
-0.1314749, -0.1594595, -1.290079, 1, 1, 1, 1, 1,
-0.1299145, -0.305131, -6.483729, 1, 1, 1, 1, 1,
-0.1296396, 0.6769997, -0.9235286, 1, 1, 1, 1, 1,
-0.1271259, 1.459034, 0.9065805, 1, 1, 1, 1, 1,
-0.1242945, -1.603028, -2.359595, 1, 1, 1, 1, 1,
-0.123486, -0.1771175, -3.698301, 1, 1, 1, 1, 1,
-0.1232388, 0.4091981, -1.605308, 1, 1, 1, 1, 1,
-0.120484, 0.4740331, -1.805928, 1, 1, 1, 1, 1,
-0.1124343, 0.3372919, 0.7013718, 1, 1, 1, 1, 1,
-0.1121583, -0.5819652, -3.130517, 1, 1, 1, 1, 1,
-0.111527, -0.5171806, -4.422797, 1, 1, 1, 1, 1,
-0.1096717, -0.07999598, -1.04311, 0, 0, 1, 1, 1,
-0.1095154, 1.139318, -0.3356543, 1, 0, 0, 1, 1,
-0.1084047, 1.950709, -0.4333594, 1, 0, 0, 1, 1,
-0.1056001, 0.2991588, 1.315701, 1, 0, 0, 1, 1,
-0.101292, -1.108722, -1.543154, 1, 0, 0, 1, 1,
-0.09659804, 1.97692, -1.148279, 1, 0, 0, 1, 1,
-0.09448098, 1.055928, -0.683481, 0, 0, 0, 1, 1,
-0.08993387, 0.6181697, 0.5206856, 0, 0, 0, 1, 1,
-0.08944257, 2.702522, -0.7358853, 0, 0, 0, 1, 1,
-0.08747723, 0.1747431, -0.3269415, 0, 0, 0, 1, 1,
-0.08730586, -1.494916, -2.210234, 0, 0, 0, 1, 1,
-0.08671741, -1.26068, -2.175166, 0, 0, 0, 1, 1,
-0.08585865, -0.6331748, -2.718328, 0, 0, 0, 1, 1,
-0.08165408, -0.7986227, -3.597693, 1, 1, 1, 1, 1,
-0.08066019, 1.581946, 0.2113538, 1, 1, 1, 1, 1,
-0.07931205, -0.4671097, -2.51734, 1, 1, 1, 1, 1,
-0.07647859, -0.1882531, -3.53016, 1, 1, 1, 1, 1,
-0.07627696, 0.2081038, -0.5323647, 1, 1, 1, 1, 1,
-0.07066135, 0.04755453, -1.980434, 1, 1, 1, 1, 1,
-0.06923876, 1.25381, -1.192399, 1, 1, 1, 1, 1,
-0.06697517, 0.2138534, 0.677052, 1, 1, 1, 1, 1,
-0.06500205, 0.4191659, -0.9140396, 1, 1, 1, 1, 1,
-0.06416059, 0.3139264, -0.2163406, 1, 1, 1, 1, 1,
-0.06091958, 0.8367552, 0.3857669, 1, 1, 1, 1, 1,
-0.05429449, -0.07242742, -2.69446, 1, 1, 1, 1, 1,
-0.05033628, 2.652966, -0.1532674, 1, 1, 1, 1, 1,
-0.04923962, -0.492619, -4.54037, 1, 1, 1, 1, 1,
-0.04697017, -0.393314, -1.075539, 1, 1, 1, 1, 1,
-0.04351875, -0.2810819, -3.451791, 0, 0, 1, 1, 1,
-0.04316738, 2.226194, 0.1949942, 1, 0, 0, 1, 1,
-0.03872018, 0.7775502, -0.5678836, 1, 0, 0, 1, 1,
-0.03499076, -1.809086, -2.802415, 1, 0, 0, 1, 1,
-0.03374452, 0.1292141, 0.1390939, 1, 0, 0, 1, 1,
-0.02728488, -0.1838357, -2.536252, 1, 0, 0, 1, 1,
-0.02687612, -0.1899716, -2.054668, 0, 0, 0, 1, 1,
-0.02619191, 2.16076, -0.006281213, 0, 0, 0, 1, 1,
-0.02592682, -0.1703724, -4.810664, 0, 0, 0, 1, 1,
-0.02564472, -0.5591082, -4.20642, 0, 0, 0, 1, 1,
-0.02395139, 0.1814199, -0.5368851, 0, 0, 0, 1, 1,
-0.01399258, -0.4140415, -3.354548, 0, 0, 0, 1, 1,
-0.01132329, 1.008297, -0.647725, 0, 0, 0, 1, 1,
-0.01026448, -1.059295, -2.400764, 1, 1, 1, 1, 1,
-0.005766905, -1.079422, -3.874946, 1, 1, 1, 1, 1,
-0.004793643, -0.6542525, -3.110122, 1, 1, 1, 1, 1,
-0.004565252, 0.3657051, 1.061836, 1, 1, 1, 1, 1,
0.00442681, -0.3308488, 3.265726, 1, 1, 1, 1, 1,
0.004542051, 1.075332, -1.430625, 1, 1, 1, 1, 1,
0.004553871, 0.4607331, 1.531525, 1, 1, 1, 1, 1,
0.005253973, -1.476634, 3.955778, 1, 1, 1, 1, 1,
0.005862585, -0.04577444, 3.227011, 1, 1, 1, 1, 1,
0.006001992, -0.4946515, 3.440755, 1, 1, 1, 1, 1,
0.009131712, 0.4065612, -0.3157516, 1, 1, 1, 1, 1,
0.01847826, -0.7610416, 1.913843, 1, 1, 1, 1, 1,
0.023722, 1.737887, 0.3770953, 1, 1, 1, 1, 1,
0.02633926, -0.5006695, 3.818486, 1, 1, 1, 1, 1,
0.02931479, -0.1860814, 2.407802, 1, 1, 1, 1, 1,
0.03473083, -0.3531295, 4.477386, 0, 0, 1, 1, 1,
0.03660897, 1.53455, -1.796369, 1, 0, 0, 1, 1,
0.03901731, -0.3061338, 3.052705, 1, 0, 0, 1, 1,
0.04007652, -0.7229154, 3.255431, 1, 0, 0, 1, 1,
0.04627949, 0.7175621, 0.2702645, 1, 0, 0, 1, 1,
0.05551346, -0.6927516, 3.856275, 1, 0, 0, 1, 1,
0.06100451, -0.009178115, 1.766002, 0, 0, 0, 1, 1,
0.06193678, -0.3980339, 0.1743438, 0, 0, 0, 1, 1,
0.06438146, 0.8465812, 1.299655, 0, 0, 0, 1, 1,
0.06841998, 0.2586976, -0.5640025, 0, 0, 0, 1, 1,
0.06904069, -0.3272347, 2.1602, 0, 0, 0, 1, 1,
0.06975558, 1.433312, 1.578015, 0, 0, 0, 1, 1,
0.07602099, 2.068447, -2.650973, 0, 0, 0, 1, 1,
0.07692024, -0.339534, 3.891448, 1, 1, 1, 1, 1,
0.07968418, 0.5206244, 0.8454853, 1, 1, 1, 1, 1,
0.08226156, 0.1876427, 1.499785, 1, 1, 1, 1, 1,
0.08235044, 1.186586, -0.8250102, 1, 1, 1, 1, 1,
0.08353129, -1.356384, 3.889551, 1, 1, 1, 1, 1,
0.09207134, -0.6130061, 2.259875, 1, 1, 1, 1, 1,
0.09277239, -1.282967, 4.50189, 1, 1, 1, 1, 1,
0.09795579, -1.352221, 3.141661, 1, 1, 1, 1, 1,
0.09901626, -0.6032055, 2.652583, 1, 1, 1, 1, 1,
0.1067563, 0.5332537, -1.052124, 1, 1, 1, 1, 1,
0.1096603, 0.6816457, -1.048808, 1, 1, 1, 1, 1,
0.1104178, 0.9999744, 0.1857923, 1, 1, 1, 1, 1,
0.1129936, -1.126461, 4.137802, 1, 1, 1, 1, 1,
0.1142223, -0.06333991, 2.003447, 1, 1, 1, 1, 1,
0.1144363, -0.2692634, 3.156892, 1, 1, 1, 1, 1,
0.1165855, -0.1615058, 1.78269, 0, 0, 1, 1, 1,
0.1194468, 0.6553307, 1.305789, 1, 0, 0, 1, 1,
0.1281276, -1.028274, 2.41474, 1, 0, 0, 1, 1,
0.1286738, 0.1870204, 0.9209362, 1, 0, 0, 1, 1,
0.1321498, -0.09545317, 2.729229, 1, 0, 0, 1, 1,
0.1327042, -0.8316575, 4.029638, 1, 0, 0, 1, 1,
0.1345885, -1.323693, 3.045532, 0, 0, 0, 1, 1,
0.1434691, 1.091658, -1.190213, 0, 0, 0, 1, 1,
0.146264, 0.4345447, 2.075805, 0, 0, 0, 1, 1,
0.1506501, -1.903678, 3.642852, 0, 0, 0, 1, 1,
0.1514695, -0.5638371, 2.817535, 0, 0, 0, 1, 1,
0.1538437, 0.9785735, 2.127197, 0, 0, 0, 1, 1,
0.1552588, 1.425861, -0.7592635, 0, 0, 0, 1, 1,
0.1561754, 0.9094759, 0.04093232, 1, 1, 1, 1, 1,
0.1572331, 0.7297481, -1.158568, 1, 1, 1, 1, 1,
0.157433, 0.02529552, 2.681669, 1, 1, 1, 1, 1,
0.1577438, -1.209614, 3.011722, 1, 1, 1, 1, 1,
0.1596179, 1.417112, 0.2750489, 1, 1, 1, 1, 1,
0.1719034, 1.473864, 0.9795631, 1, 1, 1, 1, 1,
0.1780999, -0.994323, 3.178577, 1, 1, 1, 1, 1,
0.1795178, 0.08786193, 0.90825, 1, 1, 1, 1, 1,
0.1804357, -0.00386256, 2.333216, 1, 1, 1, 1, 1,
0.1809655, -2.14472, 2.388757, 1, 1, 1, 1, 1,
0.1823384, 0.7038744, 0.391662, 1, 1, 1, 1, 1,
0.1829786, -0.06625433, 2.142176, 1, 1, 1, 1, 1,
0.1836105, -0.130396, 4.944213, 1, 1, 1, 1, 1,
0.1897793, -0.1380222, 3.241282, 1, 1, 1, 1, 1,
0.1919641, -0.5408707, 1.649222, 1, 1, 1, 1, 1,
0.1929823, -0.008546788, 0.306182, 0, 0, 1, 1, 1,
0.1971361, -0.6145197, 0.7385881, 1, 0, 0, 1, 1,
0.2003612, -0.9742813, 3.256128, 1, 0, 0, 1, 1,
0.200725, -1.567086, 3.07713, 1, 0, 0, 1, 1,
0.2046233, -1.341724, 1.939313, 1, 0, 0, 1, 1,
0.2047916, -0.7003567, 2.041843, 1, 0, 0, 1, 1,
0.2075248, 0.7619493, -0.4700749, 0, 0, 0, 1, 1,
0.2090252, 1.225293, -0.3082816, 0, 0, 0, 1, 1,
0.2115121, 0.7081505, -1.417442, 0, 0, 0, 1, 1,
0.2178052, 0.6133663, 0.8238813, 0, 0, 0, 1, 1,
0.2191272, 0.8973376, -0.240259, 0, 0, 0, 1, 1,
0.2192151, -0.547496, 1.740128, 0, 0, 0, 1, 1,
0.2229352, -0.003005647, 2.336752, 0, 0, 0, 1, 1,
0.2237871, 0.1506384, 0.335137, 1, 1, 1, 1, 1,
0.2263358, -1.278962, 1.931729, 1, 1, 1, 1, 1,
0.2266773, -0.5870134, 2.546237, 1, 1, 1, 1, 1,
0.2308944, 0.5291605, 0.0920262, 1, 1, 1, 1, 1,
0.2316894, 1.495299, 1.595064, 1, 1, 1, 1, 1,
0.2383144, -0.4851638, 2.622956, 1, 1, 1, 1, 1,
0.2394636, -0.8486097, 1.763755, 1, 1, 1, 1, 1,
0.2410109, 0.04753032, 0.06008784, 1, 1, 1, 1, 1,
0.2423367, -0.7703753, 3.118957, 1, 1, 1, 1, 1,
0.243739, -0.1722607, 1.204944, 1, 1, 1, 1, 1,
0.2533438, -0.6920011, 1.215692, 1, 1, 1, 1, 1,
0.2546577, 0.6778952, 0.3130899, 1, 1, 1, 1, 1,
0.2634751, -0.1111482, 2.658946, 1, 1, 1, 1, 1,
0.2655652, -1.913775, 2.654986, 1, 1, 1, 1, 1,
0.2659113, 1.032377, 0.4144143, 1, 1, 1, 1, 1,
0.2660067, -1.810781, 1.60423, 0, 0, 1, 1, 1,
0.2665722, 1.320425, -1.45461, 1, 0, 0, 1, 1,
0.2677936, 0.5379847, -2.141135, 1, 0, 0, 1, 1,
0.2690715, -0.7675874, 3.123377, 1, 0, 0, 1, 1,
0.2756583, 0.5957955, 1.180852, 1, 0, 0, 1, 1,
0.2762058, -0.7852377, 3.449099, 1, 0, 0, 1, 1,
0.2775361, 0.8647534, -0.005066835, 0, 0, 0, 1, 1,
0.2817116, 1.243464, -0.727779, 0, 0, 0, 1, 1,
0.284058, -1.565882, 2.610705, 0, 0, 0, 1, 1,
0.2855797, 0.5611001, -1.987028, 0, 0, 0, 1, 1,
0.2875611, -0.4212047, 2.310464, 0, 0, 0, 1, 1,
0.2887415, -0.202697, 2.437758, 0, 0, 0, 1, 1,
0.2938029, 1.719076, 0.9042262, 0, 0, 0, 1, 1,
0.2947346, 0.4273795, 0.01118759, 1, 1, 1, 1, 1,
0.2978457, 1.545476, 1.194656, 1, 1, 1, 1, 1,
0.3003928, 2.200414, 0.04084227, 1, 1, 1, 1, 1,
0.3061715, -0.2512059, 0.4048023, 1, 1, 1, 1, 1,
0.3063578, 0.372545, 0.8140969, 1, 1, 1, 1, 1,
0.3156689, -0.8706329, 2.253106, 1, 1, 1, 1, 1,
0.3165911, 0.0361074, 1.938009, 1, 1, 1, 1, 1,
0.3166575, -0.7248212, 3.666554, 1, 1, 1, 1, 1,
0.3180116, -1.056015, 3.267833, 1, 1, 1, 1, 1,
0.3181197, -0.08641928, 3.273498, 1, 1, 1, 1, 1,
0.3194113, 0.7034311, 1.439311, 1, 1, 1, 1, 1,
0.3207465, -1.481479, 4.477522, 1, 1, 1, 1, 1,
0.3212838, 0.3620361, 3.082819, 1, 1, 1, 1, 1,
0.3239708, 0.4521602, 0.7231495, 1, 1, 1, 1, 1,
0.3257385, -0.630774, 3.122723, 1, 1, 1, 1, 1,
0.3297302, -0.7108516, 2.671482, 0, 0, 1, 1, 1,
0.3339608, 1.69442, 0.9580832, 1, 0, 0, 1, 1,
0.3360832, -0.594606, 2.760941, 1, 0, 0, 1, 1,
0.3365073, -0.3558878, 1.413797, 1, 0, 0, 1, 1,
0.3375102, 1.085936, 1.790144, 1, 0, 0, 1, 1,
0.3386606, 0.8297495, 0.2125384, 1, 0, 0, 1, 1,
0.3434507, 0.4824014, 1.636147, 0, 0, 0, 1, 1,
0.3462403, 0.2922096, 1.406031, 0, 0, 0, 1, 1,
0.346502, 0.5631282, 1.610544, 0, 0, 0, 1, 1,
0.3483935, 0.2780985, 0.9381413, 0, 0, 0, 1, 1,
0.3486954, 1.496153, 0.1616031, 0, 0, 0, 1, 1,
0.3487246, -0.2960858, 0.902709, 0, 0, 0, 1, 1,
0.3492767, -0.5228238, 3.13007, 0, 0, 0, 1, 1,
0.3517022, -3.129876, 2.366806, 1, 1, 1, 1, 1,
0.3549705, 0.4517613, 0.7143541, 1, 1, 1, 1, 1,
0.3555167, 0.8555254, 0.09966201, 1, 1, 1, 1, 1,
0.3644532, 0.3805295, 1.591185, 1, 1, 1, 1, 1,
0.3704966, -0.03160133, 2.617814, 1, 1, 1, 1, 1,
0.3730775, -0.570488, 3.995068, 1, 1, 1, 1, 1,
0.3735396, 0.9341865, 0.7839284, 1, 1, 1, 1, 1,
0.3762808, -0.6753929, 2.315113, 1, 1, 1, 1, 1,
0.3791295, 0.563892, -0.8424495, 1, 1, 1, 1, 1,
0.3828215, -0.6872498, 1.387022, 1, 1, 1, 1, 1,
0.3862076, -0.7599598, 2.989477, 1, 1, 1, 1, 1,
0.39135, 0.02694923, 1.965441, 1, 1, 1, 1, 1,
0.39507, 0.5362653, -0.2432504, 1, 1, 1, 1, 1,
0.395363, -1.364204, 2.991392, 1, 1, 1, 1, 1,
0.3954381, -0.8406218, 3.381426, 1, 1, 1, 1, 1,
0.396596, -0.5474194, 2.863394, 0, 0, 1, 1, 1,
0.3966028, 1.1359, -0.9404302, 1, 0, 0, 1, 1,
0.397806, 0.3588147, 1.693712, 1, 0, 0, 1, 1,
0.3996469, 0.4302624, 0.1544341, 1, 0, 0, 1, 1,
0.4021794, -0.8798394, 2.391226, 1, 0, 0, 1, 1,
0.404066, -0.6495898, 2.96916, 1, 0, 0, 1, 1,
0.4061342, -1.986533, 3.208297, 0, 0, 0, 1, 1,
0.4133295, -1.935384, 1.697993, 0, 0, 0, 1, 1,
0.4141134, -0.7576223, 3.913612, 0, 0, 0, 1, 1,
0.4150947, 0.2480726, -0.958543, 0, 0, 0, 1, 1,
0.416348, -1.570995, 4.066331, 0, 0, 0, 1, 1,
0.4197543, 0.6778376, 0.09940636, 0, 0, 0, 1, 1,
0.4280348, 2.086722, 0.6097438, 0, 0, 0, 1, 1,
0.4281021, 0.3702386, 0.2635379, 1, 1, 1, 1, 1,
0.4318508, 0.3779695, 0.5573751, 1, 1, 1, 1, 1,
0.4319658, -0.718292, 2.618708, 1, 1, 1, 1, 1,
0.4325823, -1.206728, 2.066193, 1, 1, 1, 1, 1,
0.4354199, 0.3846739, 1.486392, 1, 1, 1, 1, 1,
0.4379954, 0.4010908, 1.06783, 1, 1, 1, 1, 1,
0.438267, -1.104765, 0.7523428, 1, 1, 1, 1, 1,
0.4406236, 0.09701374, 1.234285, 1, 1, 1, 1, 1,
0.4424798, 0.6343776, -0.2437333, 1, 1, 1, 1, 1,
0.4456934, -1.246115, 2.412862, 1, 1, 1, 1, 1,
0.4501304, 1.488204, 0.01216871, 1, 1, 1, 1, 1,
0.4518265, 1.345197, 0.2585378, 1, 1, 1, 1, 1,
0.4541034, 0.1874595, 0.2347949, 1, 1, 1, 1, 1,
0.458031, -0.865209, 1.996233, 1, 1, 1, 1, 1,
0.4593, 0.4635375, 1.194211, 1, 1, 1, 1, 1,
0.4635202, 0.6722264, -0.07451127, 0, 0, 1, 1, 1,
0.4692589, 0.07987509, 0.5865996, 1, 0, 0, 1, 1,
0.4693107, -0.03721923, -0.3971863, 1, 0, 0, 1, 1,
0.4729611, 0.3491694, 1.156826, 1, 0, 0, 1, 1,
0.4729728, 0.6596463, 0.5581962, 1, 0, 0, 1, 1,
0.4741443, -0.8919134, 3.145811, 1, 0, 0, 1, 1,
0.4742588, 0.2890028, 1.230772, 0, 0, 0, 1, 1,
0.4758042, -0.1439635, 2.050881, 0, 0, 0, 1, 1,
0.4762899, 0.8690165, -0.1638171, 0, 0, 0, 1, 1,
0.4805149, 0.4561046, 1.812253, 0, 0, 0, 1, 1,
0.4832383, -1.510894, 2.383623, 0, 0, 0, 1, 1,
0.4837077, 1.486383, 0.4914201, 0, 0, 0, 1, 1,
0.4849754, 2.47957, 1.040391, 0, 0, 0, 1, 1,
0.4880913, -0.2259647, 2.938201, 1, 1, 1, 1, 1,
0.4888822, 0.2725042, -1.011881, 1, 1, 1, 1, 1,
0.4898097, 0.8796654, 0.6844686, 1, 1, 1, 1, 1,
0.4905616, -0.2705968, 2.224458, 1, 1, 1, 1, 1,
0.4918734, -2.095855, 3.431465, 1, 1, 1, 1, 1,
0.4975207, -0.4336712, 3.235927, 1, 1, 1, 1, 1,
0.4985221, -0.7141088, 3.87189, 1, 1, 1, 1, 1,
0.4991201, 0.633578, -0.304957, 1, 1, 1, 1, 1,
0.5024117, 0.414541, 2.093813, 1, 1, 1, 1, 1,
0.5056958, -0.4198147, 2.844512, 1, 1, 1, 1, 1,
0.5066487, 0.3468691, 1.331529, 1, 1, 1, 1, 1,
0.5089069, -0.7921181, 4.042422, 1, 1, 1, 1, 1,
0.5096575, -0.0309589, 0.5460837, 1, 1, 1, 1, 1,
0.5117193, 1.684744, 1.022411, 1, 1, 1, 1, 1,
0.5138259, 0.2475996, -0.1614009, 1, 1, 1, 1, 1,
0.5153099, 0.8976579, 1.17334, 0, 0, 1, 1, 1,
0.5187766, 0.352195, -0.3269744, 1, 0, 0, 1, 1,
0.5194646, -0.5676172, 2.627742, 1, 0, 0, 1, 1,
0.5215885, -0.4183738, 1.022751, 1, 0, 0, 1, 1,
0.5237782, 1.006281, 1.334166, 1, 0, 0, 1, 1,
0.5251743, 0.927215, 1.141724, 1, 0, 0, 1, 1,
0.5258652, 0.4243788, 0.1764059, 0, 0, 0, 1, 1,
0.529614, 0.2819027, 2.074249, 0, 0, 0, 1, 1,
0.5303978, 1.371948, -0.6987106, 0, 0, 0, 1, 1,
0.5311275, 0.6584696, 1.338902, 0, 0, 0, 1, 1,
0.5345624, 0.3483965, 0.7213149, 0, 0, 0, 1, 1,
0.5346025, -0.7212979, 4.146659, 0, 0, 0, 1, 1,
0.5365875, -0.8947246, 0.445325, 0, 0, 0, 1, 1,
0.539214, 1.339164, 2.108806, 1, 1, 1, 1, 1,
0.5415782, 0.5130852, 1.502285, 1, 1, 1, 1, 1,
0.5427339, 1.22091, 1.456724, 1, 1, 1, 1, 1,
0.5435563, 0.5776063, -0.5677077, 1, 1, 1, 1, 1,
0.5454852, 0.9900718, 1.00802, 1, 1, 1, 1, 1,
0.549269, 2.017429, -0.3726854, 1, 1, 1, 1, 1,
0.549744, -1.224192, 5.016248, 1, 1, 1, 1, 1,
0.5526146, -0.906782, 2.825274, 1, 1, 1, 1, 1,
0.552805, 0.3077277, -0.1078784, 1, 1, 1, 1, 1,
0.5528346, 0.4634589, 0.2748052, 1, 1, 1, 1, 1,
0.5554231, -0.7789405, 1.443267, 1, 1, 1, 1, 1,
0.5556475, -0.5095494, 1.811291, 1, 1, 1, 1, 1,
0.5587437, 0.103117, 0.3702412, 1, 1, 1, 1, 1,
0.5637387, -0.7280486, 1.824119, 1, 1, 1, 1, 1,
0.564514, 0.9691627, 0.1343509, 1, 1, 1, 1, 1,
0.5669106, -0.3905664, 2.068103, 0, 0, 1, 1, 1,
0.5685596, 0.7145636, 0.5779105, 1, 0, 0, 1, 1,
0.5685837, 0.009071867, 1.904952, 1, 0, 0, 1, 1,
0.5694144, -1.100236, 0.8912731, 1, 0, 0, 1, 1,
0.5701439, 0.299689, 0.64898, 1, 0, 0, 1, 1,
0.5745112, -2.100263, 4.340641, 1, 0, 0, 1, 1,
0.5764077, 0.1811584, 0.2276212, 0, 0, 0, 1, 1,
0.579443, -1.249303, 0.5725121, 0, 0, 0, 1, 1,
0.5812787, 0.6940224, -0.06914179, 0, 0, 0, 1, 1,
0.5832987, -0.3969476, 2.038539, 0, 0, 0, 1, 1,
0.5843236, -1.511552, 2.255892, 0, 0, 0, 1, 1,
0.5863101, 0.6640557, 0.4242943, 0, 0, 0, 1, 1,
0.5957019, -0.8062787, 2.342562, 0, 0, 0, 1, 1,
0.6021463, -0.03224565, 1.60461, 1, 1, 1, 1, 1,
0.6079308, 1.403038, 0.1713203, 1, 1, 1, 1, 1,
0.617559, -0.2196729, 1.663441, 1, 1, 1, 1, 1,
0.6194046, 0.5411299, 0.6500045, 1, 1, 1, 1, 1,
0.6267507, -0.190393, 0.9560087, 1, 1, 1, 1, 1,
0.6275663, 0.8486606, 2.310494, 1, 1, 1, 1, 1,
0.6344696, -1.03356, 3.065469, 1, 1, 1, 1, 1,
0.6360847, 0.3465372, 2.137467, 1, 1, 1, 1, 1,
0.6377763, 0.5853837, 0.5798267, 1, 1, 1, 1, 1,
0.6433209, 0.02689034, 0.1479904, 1, 1, 1, 1, 1,
0.6434186, -1.435139, 3.521273, 1, 1, 1, 1, 1,
0.645043, -1.501823, 2.860449, 1, 1, 1, 1, 1,
0.6471434, -0.8486095, 2.048776, 1, 1, 1, 1, 1,
0.6472996, 1.613065, 1.280325, 1, 1, 1, 1, 1,
0.6481264, -0.03623063, 0.8147245, 1, 1, 1, 1, 1,
0.6514626, 1.866121, -0.1530804, 0, 0, 1, 1, 1,
0.6537787, -0.3513531, 1.464858, 1, 0, 0, 1, 1,
0.6545623, 1.364431, 1.679834, 1, 0, 0, 1, 1,
0.6578213, 1.94324, -0.3510866, 1, 0, 0, 1, 1,
0.6600928, -0.170548, 1.566884, 1, 0, 0, 1, 1,
0.6632324, 1.689233, 1.657262, 1, 0, 0, 1, 1,
0.6679205, 1.774387, -0.6924328, 0, 0, 0, 1, 1,
0.6776014, -1.036974, 2.651245, 0, 0, 0, 1, 1,
0.6777496, 1.177421, -0.07499623, 0, 0, 0, 1, 1,
0.6853575, -0.8288692, 2.412797, 0, 0, 0, 1, 1,
0.6862048, -0.7252031, 3.225785, 0, 0, 0, 1, 1,
0.6906627, 0.1457647, 1.782026, 0, 0, 0, 1, 1,
0.6952813, 0.6147318, 0.6356887, 0, 0, 0, 1, 1,
0.6971938, 0.5284407, 0.5502579, 1, 1, 1, 1, 1,
0.7020122, -0.5906174, 1.624921, 1, 1, 1, 1, 1,
0.7058303, -0.9915296, 3.406426, 1, 1, 1, 1, 1,
0.7078516, -0.1062549, 1.679408, 1, 1, 1, 1, 1,
0.7094448, -0.2561319, 1.828792, 1, 1, 1, 1, 1,
0.7115511, -0.2506873, -0.07418621, 1, 1, 1, 1, 1,
0.7166409, -1.038756, 0.6730276, 1, 1, 1, 1, 1,
0.7251871, -0.2926635, 2.865226, 1, 1, 1, 1, 1,
0.7289172, -1.0404, 1.778452, 1, 1, 1, 1, 1,
0.7290418, 1.083041, 1.828747, 1, 1, 1, 1, 1,
0.7339302, -0.9243594, 2.437685, 1, 1, 1, 1, 1,
0.7364355, -1.178009, 2.070137, 1, 1, 1, 1, 1,
0.7365304, 0.1045947, 3.636443, 1, 1, 1, 1, 1,
0.7389029, -0.4601707, 1.917609, 1, 1, 1, 1, 1,
0.7403648, -0.9007657, 2.765158, 1, 1, 1, 1, 1,
0.742017, 0.4481643, 1.031001, 0, 0, 1, 1, 1,
0.7428395, 0.1480778, 0.7618213, 1, 0, 0, 1, 1,
0.7429582, 0.2138206, 0.4089996, 1, 0, 0, 1, 1,
0.7441168, 0.6858737, 0.1553835, 1, 0, 0, 1, 1,
0.7444212, 1.882424, -0.07697283, 1, 0, 0, 1, 1,
0.7497671, -1.05866, 3.766031, 1, 0, 0, 1, 1,
0.7526073, 0.6853507, 0.7712386, 0, 0, 0, 1, 1,
0.7591463, 0.3651321, 1.71125, 0, 0, 0, 1, 1,
0.7667838, 0.5291739, -0.1540642, 0, 0, 0, 1, 1,
0.7706735, -0.05129783, 3.118757, 0, 0, 0, 1, 1,
0.7724285, 3.395022, 0.3950742, 0, 0, 0, 1, 1,
0.7819828, -0.1595429, 1.401325, 0, 0, 0, 1, 1,
0.7867061, -2.335317, 2.776858, 0, 0, 0, 1, 1,
0.7878724, 0.3104735, 0.2583774, 1, 1, 1, 1, 1,
0.7938625, 0.4234517, 1.536444, 1, 1, 1, 1, 1,
0.7969348, 1.125632, 1.538535, 1, 1, 1, 1, 1,
0.8017971, -0.9282369, 2.874993, 1, 1, 1, 1, 1,
0.8048456, 0.05455741, 2.654075, 1, 1, 1, 1, 1,
0.817978, 1.297731, 1.199071, 1, 1, 1, 1, 1,
0.8210328, 0.136969, 1.509285, 1, 1, 1, 1, 1,
0.8215464, 0.2213821, 0.3173264, 1, 1, 1, 1, 1,
0.8232915, -2.090285, 1.366882, 1, 1, 1, 1, 1,
0.8268632, 1.426702, -0.9494873, 1, 1, 1, 1, 1,
0.827749, -0.2485949, 2.640815, 1, 1, 1, 1, 1,
0.8308716, -0.7706565, 2.315777, 1, 1, 1, 1, 1,
0.8376086, -0.5879973, 2.818505, 1, 1, 1, 1, 1,
0.8386424, -0.6082122, 3.186155, 1, 1, 1, 1, 1,
0.8466815, 1.075688, 0.3705098, 1, 1, 1, 1, 1,
0.8537893, 2.58748, 1.630925, 0, 0, 1, 1, 1,
0.8601924, 0.0480241, 2.781509, 1, 0, 0, 1, 1,
0.8812292, 0.9415641, -0.06792243, 1, 0, 0, 1, 1,
0.887216, -2.239584, 2.11538, 1, 0, 0, 1, 1,
0.9053866, 0.07562694, 2.942892, 1, 0, 0, 1, 1,
0.9103467, -0.02530661, -0.08781276, 1, 0, 0, 1, 1,
0.9130179, 0.8162276, 0.4531384, 0, 0, 0, 1, 1,
0.9149282, 1.234436, 1.192286, 0, 0, 0, 1, 1,
0.9152904, -0.6276269, 3.984589, 0, 0, 0, 1, 1,
0.918643, 0.2309226, 1.306271, 0, 0, 0, 1, 1,
0.9214761, 0.1921999, 2.422581, 0, 0, 0, 1, 1,
0.9218895, -0.2603904, 2.131322, 0, 0, 0, 1, 1,
0.9246109, -0.9808149, 2.721439, 0, 0, 0, 1, 1,
0.9262989, -0.06769526, 0.2326377, 1, 1, 1, 1, 1,
0.9277057, 0.2958394, 0.2489134, 1, 1, 1, 1, 1,
0.9337226, 1.539654, 1.809632, 1, 1, 1, 1, 1,
0.9381494, -1.124806, 2.167632, 1, 1, 1, 1, 1,
0.9434502, 0.6478624, 1.65987, 1, 1, 1, 1, 1,
0.9436041, 0.402915, 1.337258, 1, 1, 1, 1, 1,
0.945667, -0.3375073, 0.438179, 1, 1, 1, 1, 1,
0.9484851, 0.6828671, 0.3794995, 1, 1, 1, 1, 1,
0.9506032, 0.7839112, 1.499296, 1, 1, 1, 1, 1,
0.9550698, -3.091027, 2.991163, 1, 1, 1, 1, 1,
0.9607285, 0.3464628, 0.3562772, 1, 1, 1, 1, 1,
0.961001, -1.085015, 1.228145, 1, 1, 1, 1, 1,
0.9669853, -0.4047649, 1.653498, 1, 1, 1, 1, 1,
0.9829776, 0.8077291, 0.5330116, 1, 1, 1, 1, 1,
0.9838809, 1.456251, -1.066445, 1, 1, 1, 1, 1,
0.987833, 0.9046633, 3.128375, 0, 0, 1, 1, 1,
0.988445, -0.3777282, 2.48496, 1, 0, 0, 1, 1,
0.9925906, 0.5799059, -0.4823606, 1, 0, 0, 1, 1,
0.9969298, 0.0769378, 0.008695819, 1, 0, 0, 1, 1,
1.002462, -1.086945, 1.572374, 1, 0, 0, 1, 1,
1.006359, 0.3117189, 2.066556, 1, 0, 0, 1, 1,
1.009787, -0.5211498, 0.7808918, 0, 0, 0, 1, 1,
1.010249, -0.3210225, 1.051198, 0, 0, 0, 1, 1,
1.019524, -0.1483301, 1.981847, 0, 0, 0, 1, 1,
1.020182, -2.340368, 2.095553, 0, 0, 0, 1, 1,
1.023524, -1.955883, 1.765386, 0, 0, 0, 1, 1,
1.02365, 0.6787596, 1.480666, 0, 0, 0, 1, 1,
1.027737, 1.48698, -1.298147, 0, 0, 0, 1, 1,
1.030966, 0.03617353, 1.228855, 1, 1, 1, 1, 1,
1.031137, 2.615637, 0.5461614, 1, 1, 1, 1, 1,
1.033992, 0.445332, 2.550226, 1, 1, 1, 1, 1,
1.037218, -0.8777261, 3.635291, 1, 1, 1, 1, 1,
1.040877, 0.2300933, 2.060494, 1, 1, 1, 1, 1,
1.042251, -1.198776, 0.1578154, 1, 1, 1, 1, 1,
1.04359, 1.357431, 2.19887, 1, 1, 1, 1, 1,
1.047212, 3.357099, -0.3660206, 1, 1, 1, 1, 1,
1.049477, 1.293095, 2.378893, 1, 1, 1, 1, 1,
1.053842, -1.472441, 1.62618, 1, 1, 1, 1, 1,
1.05637, -1.507113, 2.528915, 1, 1, 1, 1, 1,
1.059644, -1.350048, 2.962195, 1, 1, 1, 1, 1,
1.066685, 0.6957149, 0.311372, 1, 1, 1, 1, 1,
1.06733, 0.317925, 1.26756, 1, 1, 1, 1, 1,
1.073823, 0.4852742, 1.326041, 1, 1, 1, 1, 1,
1.077317, -0.6596758, 2.775712, 0, 0, 1, 1, 1,
1.078362, -0.3907669, 2.236171, 1, 0, 0, 1, 1,
1.083832, -0.969577, 2.762101, 1, 0, 0, 1, 1,
1.090132, 0.5181128, 0.7467664, 1, 0, 0, 1, 1,
1.097014, -0.3301286, 1.933231, 1, 0, 0, 1, 1,
1.100436, 0.1179345, -0.1122746, 1, 0, 0, 1, 1,
1.118052, 1.150931, -1.23318, 0, 0, 0, 1, 1,
1.118333, -2.230607, 2.386806, 0, 0, 0, 1, 1,
1.120359, 0.02931115, 0.09983282, 0, 0, 0, 1, 1,
1.122542, 1.489917, 0.5575651, 0, 0, 0, 1, 1,
1.137471, -0.7083504, 1.257804, 0, 0, 0, 1, 1,
1.143262, 0.5344906, 1.820442, 0, 0, 0, 1, 1,
1.156958, -1.065046, 2.037731, 0, 0, 0, 1, 1,
1.158603, -1.263372, 2.372661, 1, 1, 1, 1, 1,
1.159067, -0.4790868, 1.339816, 1, 1, 1, 1, 1,
1.161672, 0.9169433, 1.354231, 1, 1, 1, 1, 1,
1.162667, 0.2672012, 0.7256929, 1, 1, 1, 1, 1,
1.175533, 0.4998665, 0.5813656, 1, 1, 1, 1, 1,
1.178772, -0.8944558, 1.94578, 1, 1, 1, 1, 1,
1.190057, -0.6841398, 2.692404, 1, 1, 1, 1, 1,
1.191526, -0.3709312, 1.832812, 1, 1, 1, 1, 1,
1.195527, -0.4710533, 1.991228, 1, 1, 1, 1, 1,
1.197936, 0.8961727, 2.727482, 1, 1, 1, 1, 1,
1.199208, 1.429688, -0.1350133, 1, 1, 1, 1, 1,
1.208048, 0.05910096, 1.741513, 1, 1, 1, 1, 1,
1.208975, 1.521993, -0.308785, 1, 1, 1, 1, 1,
1.21426, 0.6165659, 0.8933139, 1, 1, 1, 1, 1,
1.216767, -0.9808673, 3.107295, 1, 1, 1, 1, 1,
1.225863, -1.8972, 2.697223, 0, 0, 1, 1, 1,
1.225928, -0.3493838, 2.044993, 1, 0, 0, 1, 1,
1.226661, 0.6002189, -0.002883039, 1, 0, 0, 1, 1,
1.228316, -1.722939, 0.5418212, 1, 0, 0, 1, 1,
1.237667, -1.065671, 3.3696, 1, 0, 0, 1, 1,
1.243361, 0.7564023, -0.5930076, 1, 0, 0, 1, 1,
1.244011, -1.502639, 3.012825, 0, 0, 0, 1, 1,
1.248459, -1.392279, 2.427586, 0, 0, 0, 1, 1,
1.255823, -0.001273595, 2.005153, 0, 0, 0, 1, 1,
1.262185, -1.354946, 2.284895, 0, 0, 0, 1, 1,
1.262264, 1.591903, -0.2719814, 0, 0, 0, 1, 1,
1.271909, -1.633892, 1.699265, 0, 0, 0, 1, 1,
1.272934, 0.6229013, 1.086016, 0, 0, 0, 1, 1,
1.281588, 0.3343358, -0.6656909, 1, 1, 1, 1, 1,
1.299328, -0.760794, 1.895667, 1, 1, 1, 1, 1,
1.303095, -0.1149965, 0.2663166, 1, 1, 1, 1, 1,
1.308831, -0.09262057, 1.339115, 1, 1, 1, 1, 1,
1.309055, 0.2452863, 2.546907, 1, 1, 1, 1, 1,
1.312001, -0.9872936, 3.209903, 1, 1, 1, 1, 1,
1.328028, -1.329042, 1.566101, 1, 1, 1, 1, 1,
1.329843, 0.890613, 1.186298, 1, 1, 1, 1, 1,
1.335203, -0.8559971, 2.019454, 1, 1, 1, 1, 1,
1.340109, 0.4394685, 0.8348916, 1, 1, 1, 1, 1,
1.342872, -0.819259, 2.849165, 1, 1, 1, 1, 1,
1.34536, -0.528726, 2.717145, 1, 1, 1, 1, 1,
1.346586, 0.64518, -0.1595924, 1, 1, 1, 1, 1,
1.357561, 0.8931186, -1.366432, 1, 1, 1, 1, 1,
1.363604, 0.2526824, 1.580456, 1, 1, 1, 1, 1,
1.376453, -0.3224623, 3.189147, 0, 0, 1, 1, 1,
1.38268, 0.8503673, 0.3469896, 1, 0, 0, 1, 1,
1.38385, -0.5115335, 2.898117, 1, 0, 0, 1, 1,
1.388473, -0.05451153, 0.8066688, 1, 0, 0, 1, 1,
1.406364, -0.1168148, -0.3458264, 1, 0, 0, 1, 1,
1.408213, 0.7448546, 2.709194, 1, 0, 0, 1, 1,
1.422713, -1.818552, 3.388675, 0, 0, 0, 1, 1,
1.425387, 0.5112861, 1.781763, 0, 0, 0, 1, 1,
1.441255, 0.8714608, 1.186005, 0, 0, 0, 1, 1,
1.452357, -0.08056239, 1.317265, 0, 0, 0, 1, 1,
1.459939, 0.1896749, 1.08266, 0, 0, 0, 1, 1,
1.463316, -0.3803492, 2.437249, 0, 0, 0, 1, 1,
1.465121, 0.419237, 0.03189845, 0, 0, 0, 1, 1,
1.471131, -1.373475, 2.561924, 1, 1, 1, 1, 1,
1.49366, -0.7028807, 1.494505, 1, 1, 1, 1, 1,
1.501385, 0.5927293, 1.24426, 1, 1, 1, 1, 1,
1.504038, 1.698674, -0.4260719, 1, 1, 1, 1, 1,
1.504601, 1.831988, 0.638662, 1, 1, 1, 1, 1,
1.504897, -0.5452736, 0.9411047, 1, 1, 1, 1, 1,
1.513312, -0.5580024, 1.190577, 1, 1, 1, 1, 1,
1.541229, 0.5914901, 0.8732428, 1, 1, 1, 1, 1,
1.544393, -0.1011288, 0.7750401, 1, 1, 1, 1, 1,
1.545986, 1.939496, 1.143427, 1, 1, 1, 1, 1,
1.546241, 0.4521455, 2.076215, 1, 1, 1, 1, 1,
1.546404, -0.6559398, 2.946397, 1, 1, 1, 1, 1,
1.559884, 0.7239458, 1.373919, 1, 1, 1, 1, 1,
1.5624, -0.4174471, 1.92442, 1, 1, 1, 1, 1,
1.574519, 0.5427177, 1.572635, 1, 1, 1, 1, 1,
1.593479, -0.6764616, 2.132712, 0, 0, 1, 1, 1,
1.613362, -0.5425576, 4.698401, 1, 0, 0, 1, 1,
1.634443, 2.078233, 0.7805684, 1, 0, 0, 1, 1,
1.634971, -0.2623007, 1.1275, 1, 0, 0, 1, 1,
1.639311, 0.9613292, 2.391659, 1, 0, 0, 1, 1,
1.6589, 0.6642967, 1.937492, 1, 0, 0, 1, 1,
1.669562, -0.5479814, 2.617726, 0, 0, 0, 1, 1,
1.686023, -1.128718, 1.28235, 0, 0, 0, 1, 1,
1.691817, 1.123745, 1.750124, 0, 0, 0, 1, 1,
1.692283, 1.896233, 0.938311, 0, 0, 0, 1, 1,
1.703784, 0.9541103, 2.263256, 0, 0, 0, 1, 1,
1.705568, 0.127234, 1.850904, 0, 0, 0, 1, 1,
1.706655, -0.5833744, 1.852054, 0, 0, 0, 1, 1,
1.713577, 0.9307831, 0.3321975, 1, 1, 1, 1, 1,
1.724256, 1.211721, 1.387814, 1, 1, 1, 1, 1,
1.748525, 2.017372, 1.391784, 1, 1, 1, 1, 1,
1.749271, -0.7281843, 1.092591, 1, 1, 1, 1, 1,
1.749832, -0.5777108, 1.049332, 1, 1, 1, 1, 1,
1.755852, 0.6268426, 3.08228, 1, 1, 1, 1, 1,
1.776973, -0.4970149, 3.389854, 1, 1, 1, 1, 1,
1.819942, 0.8296385, 0.6172034, 1, 1, 1, 1, 1,
1.850845, 0.1276721, 1.588336, 1, 1, 1, 1, 1,
1.856756, 1.430477, 0.6311842, 1, 1, 1, 1, 1,
1.883742, 0.9615983, 3.030957, 1, 1, 1, 1, 1,
1.891152, -0.5796226, 1.952953, 1, 1, 1, 1, 1,
1.89473, 0.1978259, 1.35262, 1, 1, 1, 1, 1,
1.95207, 0.1149694, 1.578172, 1, 1, 1, 1, 1,
1.958486, -0.518446, 0.9860151, 1, 1, 1, 1, 1,
1.976043, 2.003407, 1.447497, 0, 0, 1, 1, 1,
1.990251, -0.9499092, 1.52546, 1, 0, 0, 1, 1,
2.002385, 1.084141, 1.807784, 1, 0, 0, 1, 1,
2.064468, -0.1405187, 2.428041, 1, 0, 0, 1, 1,
2.075726, -0.4458717, 1.754349, 1, 0, 0, 1, 1,
2.10224, 1.120378, 2.178429, 1, 0, 0, 1, 1,
2.128265, 0.710054, 0.3157122, 0, 0, 0, 1, 1,
2.22134, -0.6753803, 0.6521968, 0, 0, 0, 1, 1,
2.318882, 0.2224916, 1.046974, 0, 0, 0, 1, 1,
2.332871, -1.690722, 4.426841, 0, 0, 0, 1, 1,
2.364275, -0.5940421, 2.370274, 0, 0, 0, 1, 1,
2.364872, 0.2593057, 1.742897, 0, 0, 0, 1, 1,
2.378115, 1.085315, 0.7031015, 0, 0, 0, 1, 1,
2.439743, -1.012249, 1.290524, 1, 1, 1, 1, 1,
2.604244, -0.2115739, 1.039413, 1, 1, 1, 1, 1,
2.621761, -0.3841865, 0.8097418, 1, 1, 1, 1, 1,
2.663886, 2.998674, 0.9841279, 1, 1, 1, 1, 1,
2.683774, 0.9849704, 0.2881746, 1, 1, 1, 1, 1,
2.728131, -1.932271, 1.98277, 1, 1, 1, 1, 1,
3.305081, -0.8776242, 0.4290926, 1, 1, 1, 1, 1
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
var radius = 9.981032;
var distance = 35.05795;
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
mvMatrix.translate( 0.007758379, -0.1325731, 0.7337403 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05795);
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
