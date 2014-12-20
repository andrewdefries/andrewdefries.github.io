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
-3.397823, 2.605211, 0.1359836, 1, 0, 0, 1,
-2.671994, 0.4576876, -1.34093, 1, 0.007843138, 0, 1,
-2.660661, 0.9370843, -1.336993, 1, 0.01176471, 0, 1,
-2.534608, 1.119986, -0.697096, 1, 0.01960784, 0, 1,
-2.473252, -1.000881, -1.957851, 1, 0.02352941, 0, 1,
-2.415379, -0.4085382, -0.4048693, 1, 0.03137255, 0, 1,
-2.360595, -0.2505575, -0.2545055, 1, 0.03529412, 0, 1,
-2.337807, -0.8805399, -1.698511, 1, 0.04313726, 0, 1,
-2.332667, -0.7508371, 0.2461153, 1, 0.04705882, 0, 1,
-2.317927, 0.1105436, -2.117335, 1, 0.05490196, 0, 1,
-2.296623, 1.86027, 0.2560301, 1, 0.05882353, 0, 1,
-2.286988, -0.412113, -2.418159, 1, 0.06666667, 0, 1,
-2.25273, -1.010205, -3.523953, 1, 0.07058824, 0, 1,
-2.248323, -0.2942371, -2.486992, 1, 0.07843138, 0, 1,
-2.161436, 0.347742, -2.021628, 1, 0.08235294, 0, 1,
-2.158052, 0.373623, -1.529125, 1, 0.09019608, 0, 1,
-2.139112, 0.5160549, -1.961025, 1, 0.09411765, 0, 1,
-2.129876, 0.2935074, -1.9382, 1, 0.1019608, 0, 1,
-2.097919, -0.8962941, -2.324899, 1, 0.1098039, 0, 1,
-2.090228, -0.8877146, -0.3209128, 1, 0.1137255, 0, 1,
-2.069818, -0.6071762, -1.667764, 1, 0.1215686, 0, 1,
-2.039381, -0.5942022, -1.688756, 1, 0.1254902, 0, 1,
-2.015636, -0.7778578, -1.831214, 1, 0.1333333, 0, 1,
-2.011493, -2.14127, -2.400372, 1, 0.1372549, 0, 1,
-1.998346, 1.01963, -1.584885, 1, 0.145098, 0, 1,
-1.983603, 0.4102629, -1.19934, 1, 0.1490196, 0, 1,
-1.967207, 0.8841165, -1.182718, 1, 0.1568628, 0, 1,
-1.958231, -1.115695, -1.544724, 1, 0.1607843, 0, 1,
-1.955711, -0.2646433, -0.2908692, 1, 0.1686275, 0, 1,
-1.944679, 0.5095863, -0.4293267, 1, 0.172549, 0, 1,
-1.93195, 0.4360678, -0.4110734, 1, 0.1803922, 0, 1,
-1.924187, 0.2193334, -0.7684941, 1, 0.1843137, 0, 1,
-1.924178, -0.07534119, -0.9527263, 1, 0.1921569, 0, 1,
-1.921202, 0.09589183, -1.418843, 1, 0.1960784, 0, 1,
-1.912926, 0.3270648, -2.236269, 1, 0.2039216, 0, 1,
-1.89496, -1.324839, -2.595347, 1, 0.2117647, 0, 1,
-1.870721, 0.7456438, -0.6326754, 1, 0.2156863, 0, 1,
-1.853935, -0.5132968, -1.574683, 1, 0.2235294, 0, 1,
-1.840773, 2.002736, -1.983627, 1, 0.227451, 0, 1,
-1.834175, -1.120955, -2.600333, 1, 0.2352941, 0, 1,
-1.82768, -0.9752761, -3.514227, 1, 0.2392157, 0, 1,
-1.81471, -0.04131619, 0.001531841, 1, 0.2470588, 0, 1,
-1.792959, -0.2138659, -2.217844, 1, 0.2509804, 0, 1,
-1.758089, 0.9658898, 0.3954092, 1, 0.2588235, 0, 1,
-1.749816, 0.5508783, -1.324832, 1, 0.2627451, 0, 1,
-1.745367, 2.283958, -0.7938942, 1, 0.2705882, 0, 1,
-1.715907, 1.162269, -1.502355, 1, 0.2745098, 0, 1,
-1.714432, -2.463428, -2.590318, 1, 0.282353, 0, 1,
-1.709937, -0.09794159, -1.771719, 1, 0.2862745, 0, 1,
-1.699911, -0.7589771, -2.024589, 1, 0.2941177, 0, 1,
-1.697883, 0.1220161, -2.56681, 1, 0.3019608, 0, 1,
-1.69603, 0.4173107, -2.314274, 1, 0.3058824, 0, 1,
-1.695071, -1.100502, -3.587424, 1, 0.3137255, 0, 1,
-1.691803, 1.362972, -1.466858, 1, 0.3176471, 0, 1,
-1.686996, 0.1540799, -0.4130045, 1, 0.3254902, 0, 1,
-1.682482, -0.8680304, -3.233152, 1, 0.3294118, 0, 1,
-1.676975, 0.667873, -2.480365, 1, 0.3372549, 0, 1,
-1.641254, 1.187692, 1.198155, 1, 0.3411765, 0, 1,
-1.629862, 1.043022, -0.8340425, 1, 0.3490196, 0, 1,
-1.623701, -1.697424, -2.424395, 1, 0.3529412, 0, 1,
-1.610476, -0.8830103, -1.249638, 1, 0.3607843, 0, 1,
-1.602297, 0.1073587, -2.670854, 1, 0.3647059, 0, 1,
-1.599975, 0.8929312, -2.631767, 1, 0.372549, 0, 1,
-1.590827, 1.071431, -1.349115, 1, 0.3764706, 0, 1,
-1.585286, -0.2782306, -1.270646, 1, 0.3843137, 0, 1,
-1.583543, -1.269264, -1.014048, 1, 0.3882353, 0, 1,
-1.581748, 1.494334, -0.9106568, 1, 0.3960784, 0, 1,
-1.580684, 1.038157, 0.7216226, 1, 0.4039216, 0, 1,
-1.578672, 0.710665, -1.793265, 1, 0.4078431, 0, 1,
-1.557235, 1.425186, -1.175665, 1, 0.4156863, 0, 1,
-1.55349, 0.4637504, -0.9932835, 1, 0.4196078, 0, 1,
-1.552332, 0.8674598, 0.03535768, 1, 0.427451, 0, 1,
-1.543874, -1.254981, -2.333271, 1, 0.4313726, 0, 1,
-1.537351, -0.1944837, -2.26181, 1, 0.4392157, 0, 1,
-1.533251, 0.9332355, -0.8749382, 1, 0.4431373, 0, 1,
-1.527495, 0.345771, -2.603415, 1, 0.4509804, 0, 1,
-1.526473, -0.09825892, -2.356153, 1, 0.454902, 0, 1,
-1.522202, 0.1467886, -1.574127, 1, 0.4627451, 0, 1,
-1.521343, 0.2314124, -3.253909, 1, 0.4666667, 0, 1,
-1.519142, -1.106686, -2.40179, 1, 0.4745098, 0, 1,
-1.512972, 0.9182249, -1.168823, 1, 0.4784314, 0, 1,
-1.512845, 0.3876148, -1.192892, 1, 0.4862745, 0, 1,
-1.510681, 1.298113, -2.459353, 1, 0.4901961, 0, 1,
-1.495073, -0.5675738, -2.447378, 1, 0.4980392, 0, 1,
-1.494896, 0.4927263, -2.218787, 1, 0.5058824, 0, 1,
-1.487969, 2.221767, 0.1344475, 1, 0.509804, 0, 1,
-1.487436, -0.7092729, -2.056855, 1, 0.5176471, 0, 1,
-1.451028, -1.586233, -2.130884, 1, 0.5215687, 0, 1,
-1.441718, -0.5153351, -0.4720867, 1, 0.5294118, 0, 1,
-1.419674, 0.2502662, -2.394669, 1, 0.5333334, 0, 1,
-1.416909, -0.598738, -1.737657, 1, 0.5411765, 0, 1,
-1.416152, 1.378577, -0.879457, 1, 0.5450981, 0, 1,
-1.401702, -0.08985881, -1.806162, 1, 0.5529412, 0, 1,
-1.399752, -1.566772, -1.048834, 1, 0.5568628, 0, 1,
-1.391791, -0.0185317, -1.176805, 1, 0.5647059, 0, 1,
-1.380473, -1.044794, -4.443008, 1, 0.5686275, 0, 1,
-1.378441, 0.7482632, -1.861699, 1, 0.5764706, 0, 1,
-1.370525, 1.005016, -3.36548, 1, 0.5803922, 0, 1,
-1.352252, 2.068051, 0.6328433, 1, 0.5882353, 0, 1,
-1.349365, 0.4793005, -0.9890754, 1, 0.5921569, 0, 1,
-1.339568, -0.7110686, -1.532847, 1, 0.6, 0, 1,
-1.336656, -0.004010653, -3.463052, 1, 0.6078432, 0, 1,
-1.335814, -0.708169, -1.982013, 1, 0.6117647, 0, 1,
-1.331241, -1.619116, -1.742398, 1, 0.6196079, 0, 1,
-1.319074, 0.4007074, 0.7047512, 1, 0.6235294, 0, 1,
-1.314435, -2.113602, -3.381199, 1, 0.6313726, 0, 1,
-1.309985, -2.080312, -2.109397, 1, 0.6352941, 0, 1,
-1.30666, -1.032907, -4.037474, 1, 0.6431373, 0, 1,
-1.298511, -1.431828, -1.428962, 1, 0.6470588, 0, 1,
-1.293334, 1.037924, 1.484483, 1, 0.654902, 0, 1,
-1.287314, 0.5869697, -0.3440883, 1, 0.6588235, 0, 1,
-1.284475, 0.6468284, -0.1754647, 1, 0.6666667, 0, 1,
-1.28125, -2.196423, -2.987985, 1, 0.6705883, 0, 1,
-1.272886, -0.8457489, -2.266527, 1, 0.6784314, 0, 1,
-1.272671, 1.801922, -0.5339487, 1, 0.682353, 0, 1,
-1.264709, 1.069201, -0.5131781, 1, 0.6901961, 0, 1,
-1.263592, 2.392553, -0.6017203, 1, 0.6941177, 0, 1,
-1.250095, -1.129013, -1.934748, 1, 0.7019608, 0, 1,
-1.249198, -1.409229, -4.06285, 1, 0.7098039, 0, 1,
-1.242008, -1.884158, -2.350396, 1, 0.7137255, 0, 1,
-1.221019, 0.8236657, -2.472091, 1, 0.7215686, 0, 1,
-1.219279, -0.4448862, -2.346744, 1, 0.7254902, 0, 1,
-1.216632, 1.436853, -2.410823, 1, 0.7333333, 0, 1,
-1.2005, -0.1891785, -0.5120132, 1, 0.7372549, 0, 1,
-1.195735, -0.320499, -1.789625, 1, 0.7450981, 0, 1,
-1.178184, -1.509501, -1.746352, 1, 0.7490196, 0, 1,
-1.176944, -2.067019, -2.650625, 1, 0.7568628, 0, 1,
-1.166404, -0.6730763, -3.234706, 1, 0.7607843, 0, 1,
-1.151439, -0.9471961, -2.501744, 1, 0.7686275, 0, 1,
-1.146356, 0.4250815, -2.551027, 1, 0.772549, 0, 1,
-1.144959, 0.002400819, -1.772601, 1, 0.7803922, 0, 1,
-1.137255, -2.497266, -2.554606, 1, 0.7843137, 0, 1,
-1.134058, -0.953508, -0.8832892, 1, 0.7921569, 0, 1,
-1.132148, 0.898657, -1.99857, 1, 0.7960784, 0, 1,
-1.114677, -0.08353159, -0.8633853, 1, 0.8039216, 0, 1,
-1.097079, 0.7488854, -0.8826587, 1, 0.8117647, 0, 1,
-1.095428, 0.7608833, -1.892214, 1, 0.8156863, 0, 1,
-1.091737, 1.373416, 0.1851452, 1, 0.8235294, 0, 1,
-1.091025, 1.597939, 0.1939186, 1, 0.827451, 0, 1,
-1.090978, 1.115137, 0.3447151, 1, 0.8352941, 0, 1,
-1.084823, -1.116752, -1.844434, 1, 0.8392157, 0, 1,
-1.084238, 0.3032333, -1.711427, 1, 0.8470588, 0, 1,
-1.08364, -0.3638481, -2.924506, 1, 0.8509804, 0, 1,
-1.078356, 2.508711, -1.018672, 1, 0.8588235, 0, 1,
-1.074335, -1.342073, -1.770927, 1, 0.8627451, 0, 1,
-1.073751, 0.4651687, -1.661924, 1, 0.8705882, 0, 1,
-1.069349, 1.129599, -1.721973, 1, 0.8745098, 0, 1,
-1.06863, 0.6912097, 0.6171379, 1, 0.8823529, 0, 1,
-1.065865, 0.4252824, -3.934558, 1, 0.8862745, 0, 1,
-1.062312, 0.3577287, -2.753456, 1, 0.8941177, 0, 1,
-1.057524, -0.191359, -1.169861, 1, 0.8980392, 0, 1,
-1.055932, -0.2689139, -1.701325, 1, 0.9058824, 0, 1,
-1.044824, -0.8201081, -1.794679, 1, 0.9137255, 0, 1,
-1.043807, -1.083305, -4.017377, 1, 0.9176471, 0, 1,
-1.043017, -1.264378, -1.885119, 1, 0.9254902, 0, 1,
-1.040295, 1.137271, -0.4478306, 1, 0.9294118, 0, 1,
-1.038633, -0.409908, -1.931625, 1, 0.9372549, 0, 1,
-1.033286, -0.3038919, -2.412944, 1, 0.9411765, 0, 1,
-1.027822, -0.4236148, -1.993896, 1, 0.9490196, 0, 1,
-1.023856, -0.5783812, -3.585462, 1, 0.9529412, 0, 1,
-1.018959, -0.9799676, -2.406356, 1, 0.9607843, 0, 1,
-1.016487, -1.455418, -2.8502, 1, 0.9647059, 0, 1,
-1.015999, -0.2421533, -3.60496, 1, 0.972549, 0, 1,
-1.014666, -0.4524397, -1.967957, 1, 0.9764706, 0, 1,
-1.011196, 0.1907614, -1.008622, 1, 0.9843137, 0, 1,
-1.009903, 0.07060346, -2.035451, 1, 0.9882353, 0, 1,
-1.006714, -1.206167, -3.222787, 1, 0.9960784, 0, 1,
-1.005429, 0.2527404, -1.56986, 0.9960784, 1, 0, 1,
-1.001238, 0.4901521, -1.236357, 0.9921569, 1, 0, 1,
-0.9904395, -1.303127, -0.4657819, 0.9843137, 1, 0, 1,
-0.9782789, -0.2713998, -1.381908, 0.9803922, 1, 0, 1,
-0.9740468, -0.3009102, -1.205605, 0.972549, 1, 0, 1,
-0.9735698, -0.3092832, -2.637782, 0.9686275, 1, 0, 1,
-0.9681196, -0.2091542, -1.152957, 0.9607843, 1, 0, 1,
-0.9571145, 1.843623, -1.867105, 0.9568627, 1, 0, 1,
-0.9570307, 0.03401968, -2.001851, 0.9490196, 1, 0, 1,
-0.9541495, -1.878403, -1.29005, 0.945098, 1, 0, 1,
-0.9513115, -0.4283542, -1.504494, 0.9372549, 1, 0, 1,
-0.9470511, 1.927585, -0.3531086, 0.9333333, 1, 0, 1,
-0.9435763, -1.10753, -2.662423, 0.9254902, 1, 0, 1,
-0.9425101, -1.444883, -2.749582, 0.9215686, 1, 0, 1,
-0.939356, 1.063341, -1.370452, 0.9137255, 1, 0, 1,
-0.9377773, 0.4760247, -0.3087759, 0.9098039, 1, 0, 1,
-0.9364867, 0.1194272, -2.771144, 0.9019608, 1, 0, 1,
-0.9352984, -2.220001, -3.025514, 0.8941177, 1, 0, 1,
-0.9346225, 0.7353449, -2.456753, 0.8901961, 1, 0, 1,
-0.9344051, -0.2030699, -1.196151, 0.8823529, 1, 0, 1,
-0.9301951, -1.773928, -2.093083, 0.8784314, 1, 0, 1,
-0.9213532, 0.4235269, 1.058309, 0.8705882, 1, 0, 1,
-0.9182611, 1.503131, -0.5947767, 0.8666667, 1, 0, 1,
-0.915225, -0.54915, -2.28222, 0.8588235, 1, 0, 1,
-0.914331, -0.1843547, -2.140762, 0.854902, 1, 0, 1,
-0.9141171, 1.25687, 0.08910047, 0.8470588, 1, 0, 1,
-0.9043849, -0.5970867, -1.389917, 0.8431373, 1, 0, 1,
-0.9020942, -1.391368, -3.322658, 0.8352941, 1, 0, 1,
-0.8961489, 0.3195186, -1.259829, 0.8313726, 1, 0, 1,
-0.8952832, 0.4365726, -0.5723621, 0.8235294, 1, 0, 1,
-0.8939224, -0.3964213, -0.2309217, 0.8196079, 1, 0, 1,
-0.8877501, 0.3907856, -1.661764, 0.8117647, 1, 0, 1,
-0.8828962, 0.7857906, 1.472239, 0.8078431, 1, 0, 1,
-0.8820084, 0.01184301, -0.5731356, 0.8, 1, 0, 1,
-0.8659794, -0.5354128, -1.494959, 0.7921569, 1, 0, 1,
-0.8635654, -0.6312746, -1.217217, 0.7882353, 1, 0, 1,
-0.860847, -1.183089, -1.054554, 0.7803922, 1, 0, 1,
-0.8579065, 0.3236327, -0.148508, 0.7764706, 1, 0, 1,
-0.8548876, -0.5658279, -1.37307, 0.7686275, 1, 0, 1,
-0.8464683, 0.06236789, -1.939117, 0.7647059, 1, 0, 1,
-0.8456706, -1.003077, -2.149289, 0.7568628, 1, 0, 1,
-0.8402103, -0.2972105, -0.902219, 0.7529412, 1, 0, 1,
-0.838135, -0.288709, -1.230065, 0.7450981, 1, 0, 1,
-0.8373648, -0.743409, -3.150795, 0.7411765, 1, 0, 1,
-0.8358212, -0.7006266, -1.186746, 0.7333333, 1, 0, 1,
-0.8334541, -0.7416109, -2.238478, 0.7294118, 1, 0, 1,
-0.8292486, -0.4438299, -2.501656, 0.7215686, 1, 0, 1,
-0.8203783, -1.234922, -1.587454, 0.7176471, 1, 0, 1,
-0.815468, 0.2615768, -0.6407789, 0.7098039, 1, 0, 1,
-0.815026, 0.670201, -1.136031, 0.7058824, 1, 0, 1,
-0.8146971, 0.8885878, 0.1049019, 0.6980392, 1, 0, 1,
-0.8054031, 0.03310397, -1.138473, 0.6901961, 1, 0, 1,
-0.7997272, 0.5453163, -0.888568, 0.6862745, 1, 0, 1,
-0.798706, 1.265247, -2.119627, 0.6784314, 1, 0, 1,
-0.796977, 0.2168208, -1.178109, 0.6745098, 1, 0, 1,
-0.7951616, -0.2493681, -2.540227, 0.6666667, 1, 0, 1,
-0.7916586, -0.05661747, -2.239238, 0.6627451, 1, 0, 1,
-0.787613, -0.41934, -1.056709, 0.654902, 1, 0, 1,
-0.7862673, -0.9014569, -4.561106, 0.6509804, 1, 0, 1,
-0.7861316, -0.5905263, -3.103789, 0.6431373, 1, 0, 1,
-0.781182, -1.096614, -3.583348, 0.6392157, 1, 0, 1,
-0.780673, 0.9154785, -0.3104466, 0.6313726, 1, 0, 1,
-0.7806485, -0.4550702, -2.69588, 0.627451, 1, 0, 1,
-0.7778956, 1.021001, 0.9872825, 0.6196079, 1, 0, 1,
-0.7760276, -0.5059649, -1.097154, 0.6156863, 1, 0, 1,
-0.7723064, 0.3179228, -1.676144, 0.6078432, 1, 0, 1,
-0.7656658, 0.3054857, -0.9070588, 0.6039216, 1, 0, 1,
-0.7654883, 0.5020978, -1.411434, 0.5960785, 1, 0, 1,
-0.7650218, 0.04053111, -0.5759397, 0.5882353, 1, 0, 1,
-0.762261, 0.45177, -1.341313, 0.5843138, 1, 0, 1,
-0.7616645, -0.05289061, -2.199229, 0.5764706, 1, 0, 1,
-0.7600719, 0.2490825, -1.441803, 0.572549, 1, 0, 1,
-0.7580836, -2.016529, -3.414319, 0.5647059, 1, 0, 1,
-0.7568707, -0.2241792, -1.426194, 0.5607843, 1, 0, 1,
-0.7521408, 2.788493, -1.529877, 0.5529412, 1, 0, 1,
-0.7512383, 0.1635066, -2.922196, 0.5490196, 1, 0, 1,
-0.7429368, 0.3541335, -1.07594, 0.5411765, 1, 0, 1,
-0.7419763, -0.5414776, -2.417727, 0.5372549, 1, 0, 1,
-0.7338771, -0.366518, -0.6099615, 0.5294118, 1, 0, 1,
-0.7317398, 0.4531284, -1.860224, 0.5254902, 1, 0, 1,
-0.7313237, -0.7849094, -2.651529, 0.5176471, 1, 0, 1,
-0.7237769, 0.2730891, -1.653882, 0.5137255, 1, 0, 1,
-0.7227377, 0.01884758, -3.097251, 0.5058824, 1, 0, 1,
-0.7221591, 1.87058, -0.6406671, 0.5019608, 1, 0, 1,
-0.7212309, 1.506704, -1.634385, 0.4941176, 1, 0, 1,
-0.7209316, 0.0599813, -0.3240787, 0.4862745, 1, 0, 1,
-0.7197115, -0.7320494, -0.3046959, 0.4823529, 1, 0, 1,
-0.7097971, 0.4169079, -0.6581383, 0.4745098, 1, 0, 1,
-0.7073362, 0.342248, -0.7880153, 0.4705882, 1, 0, 1,
-0.7056577, 0.7746578, 0.04439863, 0.4627451, 1, 0, 1,
-0.7053067, 1.320461, -1.307466, 0.4588235, 1, 0, 1,
-0.7028028, -0.5930323, -0.8317415, 0.4509804, 1, 0, 1,
-0.7010068, -0.5137148, -3.341489, 0.4470588, 1, 0, 1,
-0.6995279, 0.1374173, -3.475795, 0.4392157, 1, 0, 1,
-0.6986434, 0.2969482, -0.5991707, 0.4352941, 1, 0, 1,
-0.6982514, 0.4100374, -0.9937423, 0.427451, 1, 0, 1,
-0.6873175, 0.4271406, -1.583172, 0.4235294, 1, 0, 1,
-0.6838048, -0.7345216, -0.631223, 0.4156863, 1, 0, 1,
-0.6795359, -0.4130931, -4.363708, 0.4117647, 1, 0, 1,
-0.6783594, -0.8283655, -2.656663, 0.4039216, 1, 0, 1,
-0.6740171, 0.1361725, -1.085788, 0.3960784, 1, 0, 1,
-0.6712077, 0.3840575, -0.6536273, 0.3921569, 1, 0, 1,
-0.6572029, -0.5492522, -3.489024, 0.3843137, 1, 0, 1,
-0.6534268, -1.468645, -1.767781, 0.3803922, 1, 0, 1,
-0.6525788, 2.128204, -0.4469799, 0.372549, 1, 0, 1,
-0.6519787, -0.9487645, -4.859363, 0.3686275, 1, 0, 1,
-0.651552, 0.3095366, -2.843552, 0.3607843, 1, 0, 1,
-0.6510408, 0.3717278, -1.617097, 0.3568628, 1, 0, 1,
-0.6430188, -1.871838, -5.075489, 0.3490196, 1, 0, 1,
-0.6419794, 2.56354, -1.700423, 0.345098, 1, 0, 1,
-0.6372483, 1.502239, -0.5240753, 0.3372549, 1, 0, 1,
-0.6367915, -1.061765, -3.265222, 0.3333333, 1, 0, 1,
-0.6358915, 0.1807343, -1.879483, 0.3254902, 1, 0, 1,
-0.6344379, 0.4030375, -1.411063, 0.3215686, 1, 0, 1,
-0.6334614, 1.462615, -1.137666, 0.3137255, 1, 0, 1,
-0.6329538, -0.6864259, -3.121485, 0.3098039, 1, 0, 1,
-0.6300424, -1.499806, -2.885231, 0.3019608, 1, 0, 1,
-0.6292426, 1.021236, 0.06091674, 0.2941177, 1, 0, 1,
-0.6257735, -0.8354793, -0.1980052, 0.2901961, 1, 0, 1,
-0.6207734, -1.381843, -1.665716, 0.282353, 1, 0, 1,
-0.6170368, 2.186505, 1.42006, 0.2784314, 1, 0, 1,
-0.6158086, 0.2792657, -1.900612, 0.2705882, 1, 0, 1,
-0.6153544, 1.458115, 0.3187515, 0.2666667, 1, 0, 1,
-0.6137419, 0.09256102, -1.023542, 0.2588235, 1, 0, 1,
-0.6133671, 0.6070217, 0.5077521, 0.254902, 1, 0, 1,
-0.6131148, -2.307292, -2.481313, 0.2470588, 1, 0, 1,
-0.6005427, -2.87634, -2.585736, 0.2431373, 1, 0, 1,
-0.5998631, 1.210487, 0.06964172, 0.2352941, 1, 0, 1,
-0.5978362, -1.003806, -2.420612, 0.2313726, 1, 0, 1,
-0.5939116, 1.449501, 0.7907113, 0.2235294, 1, 0, 1,
-0.5930256, -1.545743, -3.204198, 0.2196078, 1, 0, 1,
-0.5885678, 0.8507101, -0.250903, 0.2117647, 1, 0, 1,
-0.5765164, -2.001668, -1.963736, 0.2078431, 1, 0, 1,
-0.5710125, -2.078985, -4.198113, 0.2, 1, 0, 1,
-0.5653927, -0.2711792, -0.3869123, 0.1921569, 1, 0, 1,
-0.5591097, -2.291995, -1.664708, 0.1882353, 1, 0, 1,
-0.5589328, 0.6431633, -1.347483, 0.1803922, 1, 0, 1,
-0.5588967, -0.1592586, -2.598639, 0.1764706, 1, 0, 1,
-0.5575787, 1.868466, 1.711368, 0.1686275, 1, 0, 1,
-0.5426139, 0.6458259, -1.031617, 0.1647059, 1, 0, 1,
-0.5424579, -0.8675481, -4.660067, 0.1568628, 1, 0, 1,
-0.5401612, 0.4178101, -1.138853, 0.1529412, 1, 0, 1,
-0.5393507, 1.467332, -0.1494408, 0.145098, 1, 0, 1,
-0.5392237, 0.1380309, -0.2889123, 0.1411765, 1, 0, 1,
-0.5390052, 0.4469615, -1.396672, 0.1333333, 1, 0, 1,
-0.5382781, 0.8514747, -0.7473745, 0.1294118, 1, 0, 1,
-0.5372952, 0.1177877, 0.5263506, 0.1215686, 1, 0, 1,
-0.5334107, -1.079046, -4.138855, 0.1176471, 1, 0, 1,
-0.5299798, -0.5874325, -2.288055, 0.1098039, 1, 0, 1,
-0.5254893, 1.783471, 0.9934779, 0.1058824, 1, 0, 1,
-0.5249998, -1.205644, -3.763944, 0.09803922, 1, 0, 1,
-0.5243077, 1.240534, -0.9388253, 0.09019608, 1, 0, 1,
-0.5229077, -1.714905, -1.12661, 0.08627451, 1, 0, 1,
-0.5227796, 1.920001, -1.063175, 0.07843138, 1, 0, 1,
-0.5226191, 0.2404729, -0.6404064, 0.07450981, 1, 0, 1,
-0.5201158, -1.711784, -2.178238, 0.06666667, 1, 0, 1,
-0.5194029, -0.3581855, -1.899948, 0.0627451, 1, 0, 1,
-0.51398, -0.3630319, -1.138082, 0.05490196, 1, 0, 1,
-0.5093842, 0.1461203, -1.042914, 0.05098039, 1, 0, 1,
-0.5071579, -0.9521599, -0.3539269, 0.04313726, 1, 0, 1,
-0.5061713, -0.5092872, -2.196496, 0.03921569, 1, 0, 1,
-0.501896, 0.4565929, -0.7207081, 0.03137255, 1, 0, 1,
-0.5015361, -0.1634934, -1.065375, 0.02745098, 1, 0, 1,
-0.4988601, 0.8657138, 0.5006263, 0.01960784, 1, 0, 1,
-0.4970992, 1.058647, 0.03060208, 0.01568628, 1, 0, 1,
-0.4921016, -1.324262, -2.450768, 0.007843138, 1, 0, 1,
-0.490864, 1.519518, 0.5704362, 0.003921569, 1, 0, 1,
-0.4904429, -0.2153244, -1.411553, 0, 1, 0.003921569, 1,
-0.4887837, -0.4429404, -3.244126, 0, 1, 0.01176471, 1,
-0.4882455, 0.7010586, -1.488346, 0, 1, 0.01568628, 1,
-0.4866785, -0.7407037, -3.402452, 0, 1, 0.02352941, 1,
-0.4844639, -0.8098438, -3.323751, 0, 1, 0.02745098, 1,
-0.4824003, 1.932862, 0.3288125, 0, 1, 0.03529412, 1,
-0.4811925, 1.692695, -1.340284, 0, 1, 0.03921569, 1,
-0.4811891, 0.3657279, -2.184888, 0, 1, 0.04705882, 1,
-0.4789418, -0.2324464, -2.808995, 0, 1, 0.05098039, 1,
-0.4696826, 0.5870536, -2.160674, 0, 1, 0.05882353, 1,
-0.4693813, 0.1901432, -1.872394, 0, 1, 0.0627451, 1,
-0.4652667, -1.628706, -3.633708, 0, 1, 0.07058824, 1,
-0.463721, -0.8227499, -3.340631, 0, 1, 0.07450981, 1,
-0.4628879, -0.1443897, -0.2269697, 0, 1, 0.08235294, 1,
-0.4591732, -0.3706365, -3.94646, 0, 1, 0.08627451, 1,
-0.4523226, -0.4049153, -3.53638, 0, 1, 0.09411765, 1,
-0.4435991, 0.5054255, -1.827115, 0, 1, 0.1019608, 1,
-0.4387326, -1.745416, -1.856047, 0, 1, 0.1058824, 1,
-0.4370833, -1.077019, -2.814558, 0, 1, 0.1137255, 1,
-0.4359118, -0.03632133, -2.649087, 0, 1, 0.1176471, 1,
-0.4345523, -0.6808662, -1.855594, 0, 1, 0.1254902, 1,
-0.4335802, 0.1058462, 0.1015352, 0, 1, 0.1294118, 1,
-0.4314286, 0.2443885, -2.032696, 0, 1, 0.1372549, 1,
-0.428483, -1.690733, -3.181866, 0, 1, 0.1411765, 1,
-0.4279058, 1.021922, -0.4058465, 0, 1, 0.1490196, 1,
-0.4270247, 1.487158, -0.3953634, 0, 1, 0.1529412, 1,
-0.4220442, -0.9201733, -2.613444, 0, 1, 0.1607843, 1,
-0.417203, -1.466732, -2.596853, 0, 1, 0.1647059, 1,
-0.4150834, 0.8256557, -1.185551, 0, 1, 0.172549, 1,
-0.4135339, -1.478006, -4.41876, 0, 1, 0.1764706, 1,
-0.4115463, -0.3213577, -3.699268, 0, 1, 0.1843137, 1,
-0.411035, -0.5632678, -2.642899, 0, 1, 0.1882353, 1,
-0.4104861, -0.9329559, -1.930405, 0, 1, 0.1960784, 1,
-0.4103712, -0.5403751, -1.736786, 0, 1, 0.2039216, 1,
-0.4098265, -0.05737613, -1.263552, 0, 1, 0.2078431, 1,
-0.4091806, -0.8202521, -2.284607, 0, 1, 0.2156863, 1,
-0.4059415, -0.543401, -1.135083, 0, 1, 0.2196078, 1,
-0.3970514, 0.3584337, -0.6616676, 0, 1, 0.227451, 1,
-0.3904822, 1.409977, 0.1042157, 0, 1, 0.2313726, 1,
-0.3833893, -0.3563008, -4.07111, 0, 1, 0.2392157, 1,
-0.3828515, -0.8096083, -3.046662, 0, 1, 0.2431373, 1,
-0.3826331, -0.8224277, -1.292733, 0, 1, 0.2509804, 1,
-0.377288, -0.6305959, -3.228383, 0, 1, 0.254902, 1,
-0.3761754, 0.2400621, -0.1659087, 0, 1, 0.2627451, 1,
-0.3614188, 0.7930169, 1.638544, 0, 1, 0.2666667, 1,
-0.3597744, -0.7137179, -2.996262, 0, 1, 0.2745098, 1,
-0.3587486, -1.523759, -3.318302, 0, 1, 0.2784314, 1,
-0.3576697, -1.50757, -2.076678, 0, 1, 0.2862745, 1,
-0.3574183, 0.8881796, -0.4144236, 0, 1, 0.2901961, 1,
-0.3561614, -1.066031, -3.338115, 0, 1, 0.2980392, 1,
-0.3448926, 0.7797328, -0.4786177, 0, 1, 0.3058824, 1,
-0.3413693, -0.1767814, -4.276407, 0, 1, 0.3098039, 1,
-0.3301832, -0.5267663, -1.8311, 0, 1, 0.3176471, 1,
-0.3257765, -2.03989, -3.023879, 0, 1, 0.3215686, 1,
-0.3228831, 0.07912487, -0.9551449, 0, 1, 0.3294118, 1,
-0.3226344, 1.777728, -0.2482503, 0, 1, 0.3333333, 1,
-0.3218355, 0.855312, -1.347427, 0, 1, 0.3411765, 1,
-0.3194412, 0.1778762, -1.65714, 0, 1, 0.345098, 1,
-0.3167287, -2.217655, -2.693828, 0, 1, 0.3529412, 1,
-0.3161912, 0.2818601, -1.552735, 0, 1, 0.3568628, 1,
-0.3116624, 0.1304473, -0.7992437, 0, 1, 0.3647059, 1,
-0.3110955, -1.013776, -2.978407, 0, 1, 0.3686275, 1,
-0.3102819, 0.0883716, -2.54151, 0, 1, 0.3764706, 1,
-0.3087357, -1.478375, -1.06282, 0, 1, 0.3803922, 1,
-0.3042753, -1.363836, -3.194817, 0, 1, 0.3882353, 1,
-0.3023559, -1.562459, -2.682922, 0, 1, 0.3921569, 1,
-0.302093, -1.781743, -3.008694, 0, 1, 0.4, 1,
-0.301798, 3.499787, 0.5143518, 0, 1, 0.4078431, 1,
-0.2994934, 1.543931, 0.2746669, 0, 1, 0.4117647, 1,
-0.2955463, -0.5498303, -2.603679, 0, 1, 0.4196078, 1,
-0.2953048, -2.412676, -3.427093, 0, 1, 0.4235294, 1,
-0.2916203, -1.068935, -1.28474, 0, 1, 0.4313726, 1,
-0.2844017, 1.105746, 0.428729, 0, 1, 0.4352941, 1,
-0.2815992, -0.8321309, -1.08407, 0, 1, 0.4431373, 1,
-0.2790022, -1.736307, -3.784798, 0, 1, 0.4470588, 1,
-0.2739945, -0.941758, -2.11663, 0, 1, 0.454902, 1,
-0.2687649, -0.6561733, -0.8781884, 0, 1, 0.4588235, 1,
-0.2661728, 0.261728, -1.090882, 0, 1, 0.4666667, 1,
-0.265359, 0.07816974, -0.427568, 0, 1, 0.4705882, 1,
-0.264468, 0.3557437, 0.8609408, 0, 1, 0.4784314, 1,
-0.2624568, -0.3218496, -2.252071, 0, 1, 0.4823529, 1,
-0.2619791, -0.5817803, -0.908024, 0, 1, 0.4901961, 1,
-0.2611082, 0.2357098, -1.151593, 0, 1, 0.4941176, 1,
-0.2608408, -0.5926899, -3.06461, 0, 1, 0.5019608, 1,
-0.2604942, 0.9680505, -2.343899, 0, 1, 0.509804, 1,
-0.2597759, 1.812744, 0.5728776, 0, 1, 0.5137255, 1,
-0.2571187, -0.05279171, -2.145413, 0, 1, 0.5215687, 1,
-0.2570147, -0.325605, -2.099097, 0, 1, 0.5254902, 1,
-0.2564606, -0.7909903, -3.622003, 0, 1, 0.5333334, 1,
-0.2562236, -0.9822116, -0.4295251, 0, 1, 0.5372549, 1,
-0.2560327, -1.456377, -1.888621, 0, 1, 0.5450981, 1,
-0.2522991, 0.04827335, -2.141989, 0, 1, 0.5490196, 1,
-0.2467287, 1.434846, 0.9954877, 0, 1, 0.5568628, 1,
-0.2416102, -0.4174563, -2.238966, 0, 1, 0.5607843, 1,
-0.2371554, 1.739475, -0.4291053, 0, 1, 0.5686275, 1,
-0.2337298, 1.047544, -0.7361936, 0, 1, 0.572549, 1,
-0.2298121, -1.540804, -0.7475995, 0, 1, 0.5803922, 1,
-0.2277113, 1.165196, -0.3426343, 0, 1, 0.5843138, 1,
-0.2264877, 1.638972, -0.3492896, 0, 1, 0.5921569, 1,
-0.2256198, 0.7616885, -0.7267069, 0, 1, 0.5960785, 1,
-0.224214, 1.261567, -0.3140216, 0, 1, 0.6039216, 1,
-0.2205424, -0.1027386, -2.563628, 0, 1, 0.6117647, 1,
-0.2198689, 1.630448, 0.5089767, 0, 1, 0.6156863, 1,
-0.219484, -1.241229, -3.485289, 0, 1, 0.6235294, 1,
-0.2182066, 1.204465, 0.3488402, 0, 1, 0.627451, 1,
-0.2137256, 1.21662, -0.3095227, 0, 1, 0.6352941, 1,
-0.2128556, -1.368965, -4.093221, 0, 1, 0.6392157, 1,
-0.2119287, -0.954972, -3.194419, 0, 1, 0.6470588, 1,
-0.203212, 1.143742, -0.8102405, 0, 1, 0.6509804, 1,
-0.2024478, 0.3258402, -0.9625229, 0, 1, 0.6588235, 1,
-0.2006783, -0.08035825, -2.040661, 0, 1, 0.6627451, 1,
-0.200305, -2.052255, -2.342614, 0, 1, 0.6705883, 1,
-0.198781, 0.3251507, -0.7769884, 0, 1, 0.6745098, 1,
-0.1906266, 0.7308816, -0.3917217, 0, 1, 0.682353, 1,
-0.1902495, 0.3734055, 1.719898, 0, 1, 0.6862745, 1,
-0.1889338, 0.7338057, 0.3713185, 0, 1, 0.6941177, 1,
-0.1846275, -0.9543985, -3.721285, 0, 1, 0.7019608, 1,
-0.176064, -1.004015, -1.225192, 0, 1, 0.7058824, 1,
-0.1729434, -0.8277928, -1.975646, 0, 1, 0.7137255, 1,
-0.1720727, -1.629474, -2.229863, 0, 1, 0.7176471, 1,
-0.1672677, -1.46546, -3.840344, 0, 1, 0.7254902, 1,
-0.1666885, -0.9648725, 0.34172, 0, 1, 0.7294118, 1,
-0.1665909, 0.6129364, 0.1768093, 0, 1, 0.7372549, 1,
-0.1657531, -0.08310375, -1.808738, 0, 1, 0.7411765, 1,
-0.162176, -0.1232394, -2.376744, 0, 1, 0.7490196, 1,
-0.1599526, -1.25721, -4.025598, 0, 1, 0.7529412, 1,
-0.158442, -0.1631666, -0.09074558, 0, 1, 0.7607843, 1,
-0.1549621, 1.263391, -0.6715024, 0, 1, 0.7647059, 1,
-0.1385278, -0.034418, 0.2916768, 0, 1, 0.772549, 1,
-0.1339081, -0.03364151, -0.4497346, 0, 1, 0.7764706, 1,
-0.1303815, 0.08424208, -2.485425, 0, 1, 0.7843137, 1,
-0.1299617, -0.05958637, -1.773438, 0, 1, 0.7882353, 1,
-0.1291763, 0.08119235, -1.252613, 0, 1, 0.7960784, 1,
-0.1278514, 0.4080014, -0.8046572, 0, 1, 0.8039216, 1,
-0.1276582, 0.6615261, 0.5722972, 0, 1, 0.8078431, 1,
-0.1239111, 1.0559, 0.009375117, 0, 1, 0.8156863, 1,
-0.1224842, 0.2541148, -0.9661614, 0, 1, 0.8196079, 1,
-0.1194587, 1.929145, -0.8466682, 0, 1, 0.827451, 1,
-0.1142633, 0.7664154, -0.3409477, 0, 1, 0.8313726, 1,
-0.1110766, -0.8764623, -2.703123, 0, 1, 0.8392157, 1,
-0.1104308, 1.540814, 0.5949577, 0, 1, 0.8431373, 1,
-0.1089335, -0.1051521, -2.911879, 0, 1, 0.8509804, 1,
-0.101788, 0.2380106, -0.5010439, 0, 1, 0.854902, 1,
-0.09821109, 0.1262931, 1.466408, 0, 1, 0.8627451, 1,
-0.09234052, 1.755335, 0.361335, 0, 1, 0.8666667, 1,
-0.08375196, 1.6907, -0.953338, 0, 1, 0.8745098, 1,
-0.08370602, -0.6473862, -2.49829, 0, 1, 0.8784314, 1,
-0.0822708, 0.5672362, -1.493731, 0, 1, 0.8862745, 1,
-0.08182377, -0.8611508, -4.443268, 0, 1, 0.8901961, 1,
-0.08131974, 0.9349232, -0.919351, 0, 1, 0.8980392, 1,
-0.08122072, 1.305286, 0.0485008, 0, 1, 0.9058824, 1,
-0.07953101, -0.1735963, -1.0766, 0, 1, 0.9098039, 1,
-0.07799079, -0.4568936, -3.862666, 0, 1, 0.9176471, 1,
-0.07405002, -0.6669583, -4.026285, 0, 1, 0.9215686, 1,
-0.07273928, -0.2287848, -0.8106712, 0, 1, 0.9294118, 1,
-0.07272375, -0.5294208, -2.796616, 0, 1, 0.9333333, 1,
-0.06816976, -0.6021769, -1.412031, 0, 1, 0.9411765, 1,
-0.06511662, 0.1596544, 0.4509143, 0, 1, 0.945098, 1,
-0.06169197, 0.3609571, 0.20933, 0, 1, 0.9529412, 1,
-0.05295181, 0.469436, 0.7780031, 0, 1, 0.9568627, 1,
-0.05208309, -0.9553196, -3.685277, 0, 1, 0.9647059, 1,
-0.05200564, -0.04305498, -1.541082, 0, 1, 0.9686275, 1,
-0.05172623, 1.3462, -1.54983, 0, 1, 0.9764706, 1,
-0.05130342, 1.267526, -0.5291408, 0, 1, 0.9803922, 1,
-0.05001448, 1.045735, 0.1776687, 0, 1, 0.9882353, 1,
-0.04948526, -0.345861, -2.893121, 0, 1, 0.9921569, 1,
-0.04839952, -1.411404, -2.541424, 0, 1, 1, 1,
-0.04661417, -2.666289, -1.407222, 0, 0.9921569, 1, 1,
-0.04246292, 1.223901, 0.5040891, 0, 0.9882353, 1, 1,
-0.04184077, -0.8409579, -3.060383, 0, 0.9803922, 1, 1,
-0.02750842, -0.8183063, -3.203494, 0, 0.9764706, 1, 1,
-0.02700516, 0.211211, 0.7921974, 0, 0.9686275, 1, 1,
-0.02697009, -0.9929628, -3.06431, 0, 0.9647059, 1, 1,
-0.02686771, -0.2795365, -2.925135, 0, 0.9568627, 1, 1,
-0.02659923, -0.2361056, -3.210403, 0, 0.9529412, 1, 1,
-0.02030091, 1.626397, 1.863417, 0, 0.945098, 1, 1,
-0.02026555, -1.522247, -3.642276, 0, 0.9411765, 1, 1,
-0.0149597, 0.7981627, 0.4059646, 0, 0.9333333, 1, 1,
-0.0126387, -0.285754, -2.676704, 0, 0.9294118, 1, 1,
-0.008622769, 0.08734368, -1.340949, 0, 0.9215686, 1, 1,
-0.008017181, 0.7197161, 0.6688979, 0, 0.9176471, 1, 1,
-0.007203327, 0.7614338, 0.9053672, 0, 0.9098039, 1, 1,
-0.004805617, 0.01702518, -0.626205, 0, 0.9058824, 1, 1,
-0.004281739, 1.471333, -1.557008, 0, 0.8980392, 1, 1,
-0.003191631, -0.523816, -2.898253, 0, 0.8901961, 1, 1,
-0.002257936, -0.09884862, -2.325596, 0, 0.8862745, 1, 1,
-0.0002415189, -1.139601, -2.242206, 0, 0.8784314, 1, 1,
0.003894221, 0.1539455, 0.9229806, 0, 0.8745098, 1, 1,
0.004863285, -0.315393, 4.169075, 0, 0.8666667, 1, 1,
0.005526766, 0.2619785, -0.259572, 0, 0.8627451, 1, 1,
0.006074512, -0.915816, 2.456206, 0, 0.854902, 1, 1,
0.007423461, 0.6361362, -0.2106648, 0, 0.8509804, 1, 1,
0.01168906, -0.1966665, 3.117125, 0, 0.8431373, 1, 1,
0.0132308, 0.1785588, -1.720953, 0, 0.8392157, 1, 1,
0.01965708, 0.7375028, -0.9780725, 0, 0.8313726, 1, 1,
0.0202355, -2.721323, 3.417939, 0, 0.827451, 1, 1,
0.02444564, -1.006216, 2.834786, 0, 0.8196079, 1, 1,
0.02537531, -1.372146, 4.988494, 0, 0.8156863, 1, 1,
0.02724208, -0.1636197, 3.802305, 0, 0.8078431, 1, 1,
0.02954665, -0.5921769, 3.708147, 0, 0.8039216, 1, 1,
0.02968148, -0.6640256, 3.529901, 0, 0.7960784, 1, 1,
0.03112293, -1.558666, 3.320801, 0, 0.7882353, 1, 1,
0.03169072, -0.557663, 3.670841, 0, 0.7843137, 1, 1,
0.03383448, -1.819287, 1.396957, 0, 0.7764706, 1, 1,
0.03628257, -0.8264585, 2.176206, 0, 0.772549, 1, 1,
0.03917381, -1.462233, 2.955508, 0, 0.7647059, 1, 1,
0.03956971, -0.8920288, 2.536789, 0, 0.7607843, 1, 1,
0.04299937, 1.423275, -1.568256, 0, 0.7529412, 1, 1,
0.04410817, -0.5000119, 2.122802, 0, 0.7490196, 1, 1,
0.04444511, 0.9529513, -0.3085709, 0, 0.7411765, 1, 1,
0.04650662, 0.6067604, -0.02438442, 0, 0.7372549, 1, 1,
0.04884377, -0.4437925, 2.47567, 0, 0.7294118, 1, 1,
0.05012491, -2.002058, 3.801799, 0, 0.7254902, 1, 1,
0.05132397, 0.391177, -1.416038, 0, 0.7176471, 1, 1,
0.05893129, -0.8659718, 1.898368, 0, 0.7137255, 1, 1,
0.05912192, 0.5363283, 1.228437, 0, 0.7058824, 1, 1,
0.06000362, -0.5873059, 2.623392, 0, 0.6980392, 1, 1,
0.06042614, -0.3392467, 2.025127, 0, 0.6941177, 1, 1,
0.06468581, -0.8981184, 2.654424, 0, 0.6862745, 1, 1,
0.06502516, -0.6236587, 3.135162, 0, 0.682353, 1, 1,
0.06557573, 0.9288676, -1.389921, 0, 0.6745098, 1, 1,
0.07269619, 1.865504, 0.6508459, 0, 0.6705883, 1, 1,
0.07475586, -0.9819604, 3.533128, 0, 0.6627451, 1, 1,
0.07646561, 0.1956716, 2.580018, 0, 0.6588235, 1, 1,
0.07848736, 0.1669432, 0.7518781, 0, 0.6509804, 1, 1,
0.0804026, -0.2209456, 4.154218, 0, 0.6470588, 1, 1,
0.08232836, -1.020735, 2.938655, 0, 0.6392157, 1, 1,
0.08276298, -0.9944557, 2.59786, 0, 0.6352941, 1, 1,
0.0892098, -0.01729829, 1.787136, 0, 0.627451, 1, 1,
0.09005552, 0.9822072, 1.157887, 0, 0.6235294, 1, 1,
0.09148734, 0.8548198, 0.5252628, 0, 0.6156863, 1, 1,
0.1022151, -0.6703286, 3.599479, 0, 0.6117647, 1, 1,
0.1040395, 0.768041, 1.562846, 0, 0.6039216, 1, 1,
0.1043433, -0.08768971, 1.677191, 0, 0.5960785, 1, 1,
0.1074461, -0.4441973, 3.856619, 0, 0.5921569, 1, 1,
0.1086018, -0.972091, 3.399491, 0, 0.5843138, 1, 1,
0.111744, -0.6482702, 4.047945, 0, 0.5803922, 1, 1,
0.1136664, 0.4993578, -0.1956448, 0, 0.572549, 1, 1,
0.115245, -0.3813574, 2.101847, 0, 0.5686275, 1, 1,
0.1181549, 0.4593573, -0.07570463, 0, 0.5607843, 1, 1,
0.1229537, -0.5111654, 2.167357, 0, 0.5568628, 1, 1,
0.1248675, -0.8518248, 3.204782, 0, 0.5490196, 1, 1,
0.1251431, 1.869772, 0.2734274, 0, 0.5450981, 1, 1,
0.1276281, -1.508839, 3.079226, 0, 0.5372549, 1, 1,
0.1276293, -0.6421591, 2.005227, 0, 0.5333334, 1, 1,
0.1332948, -0.4709304, 4.560874, 0, 0.5254902, 1, 1,
0.1336786, -0.4726164, 3.845832, 0, 0.5215687, 1, 1,
0.1340234, -0.8497876, 3.769376, 0, 0.5137255, 1, 1,
0.1341265, -1.761017, 3.275426, 0, 0.509804, 1, 1,
0.1359124, 1.436526, -0.08907735, 0, 0.5019608, 1, 1,
0.1412078, 1.02342, -1.223544, 0, 0.4941176, 1, 1,
0.1423575, -1.204669, 1.89168, 0, 0.4901961, 1, 1,
0.1463442, -1.40247, 3.636531, 0, 0.4823529, 1, 1,
0.1513875, -0.3094061, 1.80389, 0, 0.4784314, 1, 1,
0.1514939, 1.151148, -0.3409064, 0, 0.4705882, 1, 1,
0.1553726, 0.3616232, 1.614814, 0, 0.4666667, 1, 1,
0.1577188, -0.4948723, 0.9570561, 0, 0.4588235, 1, 1,
0.1579001, -0.3309273, 3.437176, 0, 0.454902, 1, 1,
0.1662742, 0.3184948, -0.9219354, 0, 0.4470588, 1, 1,
0.1746333, -0.8969905, 2.175874, 0, 0.4431373, 1, 1,
0.1759318, -0.6374598, 3.676721, 0, 0.4352941, 1, 1,
0.1780179, 0.8422841, 2.511742, 0, 0.4313726, 1, 1,
0.1781926, 0.7229923, 0.08963794, 0, 0.4235294, 1, 1,
0.1791883, 0.1832912, 1.030871, 0, 0.4196078, 1, 1,
0.1799758, 0.7911656, -3.387964, 0, 0.4117647, 1, 1,
0.1840178, 0.4119852, 1.114652, 0, 0.4078431, 1, 1,
0.1858461, -0.1564464, 2.695118, 0, 0.4, 1, 1,
0.1870806, 0.6827874, 0.6460825, 0, 0.3921569, 1, 1,
0.1872342, 0.6987931, 0.8893963, 0, 0.3882353, 1, 1,
0.1872992, -0.1368831, 1.433126, 0, 0.3803922, 1, 1,
0.1884559, -1.16053, 3.402272, 0, 0.3764706, 1, 1,
0.1919868, -1.379357, 3.665826, 0, 0.3686275, 1, 1,
0.1921918, 0.7410243, -0.1379499, 0, 0.3647059, 1, 1,
0.1937734, -1.115958, 2.455839, 0, 0.3568628, 1, 1,
0.1949637, 0.8292746, 0.7157863, 0, 0.3529412, 1, 1,
0.1986158, 0.3464493, -0.4866633, 0, 0.345098, 1, 1,
0.2015175, -0.4364223, 1.961459, 0, 0.3411765, 1, 1,
0.2029586, -0.1565902, 0.9742104, 0, 0.3333333, 1, 1,
0.2043717, 0.7082234, -1.88528, 0, 0.3294118, 1, 1,
0.2105878, 1.543117, 1.214832, 0, 0.3215686, 1, 1,
0.2195352, -0.1336446, 2.961127, 0, 0.3176471, 1, 1,
0.2203789, 0.3659936, -0.5657514, 0, 0.3098039, 1, 1,
0.2204815, -0.6721596, 1.97976, 0, 0.3058824, 1, 1,
0.2225916, -0.6579884, 4.032015, 0, 0.2980392, 1, 1,
0.2226256, 0.1507228, 1.662474, 0, 0.2901961, 1, 1,
0.2226653, -0.141969, 1.731046, 0, 0.2862745, 1, 1,
0.2263122, -0.8492453, 1.178449, 0, 0.2784314, 1, 1,
0.2299491, 1.293831, 1.014452, 0, 0.2745098, 1, 1,
0.2340377, -0.3560925, -0.08235873, 0, 0.2666667, 1, 1,
0.2388858, 0.5697375, -0.8674069, 0, 0.2627451, 1, 1,
0.2416622, 1.15372, -0.1548161, 0, 0.254902, 1, 1,
0.2422875, 0.8313522, -0.09756944, 0, 0.2509804, 1, 1,
0.2425614, 1.550032, -0.6315715, 0, 0.2431373, 1, 1,
0.2455026, 0.4388697, 0.6739986, 0, 0.2392157, 1, 1,
0.2458892, -1.043115, 2.217116, 0, 0.2313726, 1, 1,
0.2460557, -0.09249831, 3.026039, 0, 0.227451, 1, 1,
0.2489512, -1.818628, 4.296759, 0, 0.2196078, 1, 1,
0.2563724, -0.3503882, 2.338974, 0, 0.2156863, 1, 1,
0.2575321, 1.089394, 0.8689808, 0, 0.2078431, 1, 1,
0.2579238, 0.6249319, -2.102828, 0, 0.2039216, 1, 1,
0.2621829, 1.611576, 1.075391, 0, 0.1960784, 1, 1,
0.2634982, -0.3425527, 1.840573, 0, 0.1882353, 1, 1,
0.2672713, 0.234462, 2.413736, 0, 0.1843137, 1, 1,
0.268308, -0.6618942, 3.391174, 0, 0.1764706, 1, 1,
0.271562, -0.1312674, 1.853415, 0, 0.172549, 1, 1,
0.2726218, 0.03564826, 0.2217291, 0, 0.1647059, 1, 1,
0.2732442, 0.9598797, 0.06420065, 0, 0.1607843, 1, 1,
0.2772883, 1.16396, -1.455579, 0, 0.1529412, 1, 1,
0.2799007, 0.6460321, 0.6284043, 0, 0.1490196, 1, 1,
0.2854981, -0.8289378, 2.497638, 0, 0.1411765, 1, 1,
0.2883747, -0.5173657, 4.333896, 0, 0.1372549, 1, 1,
0.2899881, 0.4207616, -0.664817, 0, 0.1294118, 1, 1,
0.2973974, 0.4772386, -0.8920901, 0, 0.1254902, 1, 1,
0.3008964, -0.06653007, 1.008897, 0, 0.1176471, 1, 1,
0.3018239, 0.8168882, -1.139152, 0, 0.1137255, 1, 1,
0.302376, 0.1295901, 0.7408413, 0, 0.1058824, 1, 1,
0.3029099, -0.7530635, 3.099263, 0, 0.09803922, 1, 1,
0.3042996, -1.2516, 1.947063, 0, 0.09411765, 1, 1,
0.3061406, 0.4213206, 0.2820397, 0, 0.08627451, 1, 1,
0.3193105, 1.414156, -0.2579789, 0, 0.08235294, 1, 1,
0.3194731, -0.7987437, 3.826351, 0, 0.07450981, 1, 1,
0.3196001, 1.40869, 1.959234, 0, 0.07058824, 1, 1,
0.3249578, 0.4399892, -0.6351374, 0, 0.0627451, 1, 1,
0.3270575, 1.313176, -1.296807, 0, 0.05882353, 1, 1,
0.3364844, 0.8199599, -0.2051462, 0, 0.05098039, 1, 1,
0.3428778, 0.3458785, 0.2146181, 0, 0.04705882, 1, 1,
0.3433975, -0.5829977, 4.53867, 0, 0.03921569, 1, 1,
0.3495206, -1.172801, 3.694324, 0, 0.03529412, 1, 1,
0.352014, 1.181107, -0.3666088, 0, 0.02745098, 1, 1,
0.3531631, 1.39044, 0.2914858, 0, 0.02352941, 1, 1,
0.3544554, 0.2296399, 1.312967, 0, 0.01568628, 1, 1,
0.3636746, 2.286271, -1.90436, 0, 0.01176471, 1, 1,
0.3655763, -1.484972, 4.192963, 0, 0.003921569, 1, 1,
0.3700143, -1.242423, 2.736702, 0.003921569, 0, 1, 1,
0.3714987, 0.6084302, -0.06179574, 0.007843138, 0, 1, 1,
0.3798524, 0.8142434, 0.2302883, 0.01568628, 0, 1, 1,
0.3800631, -0.9849473, 2.837165, 0.01960784, 0, 1, 1,
0.3824066, 1.39504, -0.01664175, 0.02745098, 0, 1, 1,
0.3838511, 0.709613, -0.4906701, 0.03137255, 0, 1, 1,
0.3886831, -1.440218, 4.581307, 0.03921569, 0, 1, 1,
0.3905434, 1.212265, -0.1046874, 0.04313726, 0, 1, 1,
0.3909329, 1.255432, 2.235124, 0.05098039, 0, 1, 1,
0.392583, -0.512517, 3.218348, 0.05490196, 0, 1, 1,
0.3958996, -0.1659344, 0.7884088, 0.0627451, 0, 1, 1,
0.3959952, -0.6354744, 1.293285, 0.06666667, 0, 1, 1,
0.3965368, 0.8110207, 0.8946751, 0.07450981, 0, 1, 1,
0.3987912, -0.8466098, 3.558162, 0.07843138, 0, 1, 1,
0.4025472, 1.468064, 0.1702495, 0.08627451, 0, 1, 1,
0.4045902, 0.3515407, 2.005112, 0.09019608, 0, 1, 1,
0.405334, -1.356276, 3.857159, 0.09803922, 0, 1, 1,
0.4056631, -1.074714, 2.652615, 0.1058824, 0, 1, 1,
0.4071761, 0.9369545, 0.3043363, 0.1098039, 0, 1, 1,
0.4136196, 1.197524, 0.03922813, 0.1176471, 0, 1, 1,
0.4138204, 0.550906, -1.799468, 0.1215686, 0, 1, 1,
0.418197, -0.3849761, 1.081054, 0.1294118, 0, 1, 1,
0.4188351, -1.460587, 5.060689, 0.1333333, 0, 1, 1,
0.4200006, 0.6034832, 0.2514488, 0.1411765, 0, 1, 1,
0.4213298, 1.571489, 0.3140883, 0.145098, 0, 1, 1,
0.4242577, -2.095067, 2.125441, 0.1529412, 0, 1, 1,
0.4248259, -0.2349535, 2.111724, 0.1568628, 0, 1, 1,
0.4260151, -1.761518, 2.165665, 0.1647059, 0, 1, 1,
0.4282342, 0.4597262, 0.04420524, 0.1686275, 0, 1, 1,
0.4302088, -0.5138593, 2.37841, 0.1764706, 0, 1, 1,
0.4307957, -0.8996315, 2.925009, 0.1803922, 0, 1, 1,
0.43828, -1.443272, 3.719619, 0.1882353, 0, 1, 1,
0.4388283, 1.008791, -1.499625, 0.1921569, 0, 1, 1,
0.4437001, -0.7950916, 2.498099, 0.2, 0, 1, 1,
0.4446956, 0.8641546, 0.495424, 0.2078431, 0, 1, 1,
0.4575399, -1.379609, 3.680741, 0.2117647, 0, 1, 1,
0.4587443, -1.614787, 1.331768, 0.2196078, 0, 1, 1,
0.4743778, -0.1140815, 2.315492, 0.2235294, 0, 1, 1,
0.474741, 2.204003, 0.3993471, 0.2313726, 0, 1, 1,
0.4788855, -1.047887, 2.16207, 0.2352941, 0, 1, 1,
0.4812729, -0.1361472, 1.053829, 0.2431373, 0, 1, 1,
0.4832585, 0.7685758, 3.172609, 0.2470588, 0, 1, 1,
0.4833743, -0.1816069, 2.183995, 0.254902, 0, 1, 1,
0.4864981, -0.9088348, 2.386336, 0.2588235, 0, 1, 1,
0.4891701, 0.4144221, 3.667064, 0.2666667, 0, 1, 1,
0.4914696, -0.1602648, 0.5811969, 0.2705882, 0, 1, 1,
0.4932787, 0.9547669, -0.1329324, 0.2784314, 0, 1, 1,
0.4940466, -0.7811509, 2.854021, 0.282353, 0, 1, 1,
0.4981505, 0.175331, 1.337937, 0.2901961, 0, 1, 1,
0.4999957, 1.335179, 0.7609524, 0.2941177, 0, 1, 1,
0.5019864, 0.9615484, 0.4597821, 0.3019608, 0, 1, 1,
0.5054795, 0.7375175, 1.135117, 0.3098039, 0, 1, 1,
0.5124624, -0.8255181, 4.363551, 0.3137255, 0, 1, 1,
0.5151209, -1.633408, 1.309032, 0.3215686, 0, 1, 1,
0.5161983, -0.6397606, 2.572904, 0.3254902, 0, 1, 1,
0.5211095, -0.3049939, 1.728625, 0.3333333, 0, 1, 1,
0.5232098, -1.237992, 4.006657, 0.3372549, 0, 1, 1,
0.524895, -0.8711872, 1.036481, 0.345098, 0, 1, 1,
0.5252877, 0.04325144, 1.831832, 0.3490196, 0, 1, 1,
0.528906, -1.495098, 3.652154, 0.3568628, 0, 1, 1,
0.5301379, -0.8740942, 0.8395221, 0.3607843, 0, 1, 1,
0.533697, 1.930868, 0.09349921, 0.3686275, 0, 1, 1,
0.5351459, 0.4605628, 1.078543, 0.372549, 0, 1, 1,
0.5421401, 0.02249733, 0.9502884, 0.3803922, 0, 1, 1,
0.5472199, 0.5590656, 0.7762995, 0.3843137, 0, 1, 1,
0.5475357, -0.5706735, 4.02, 0.3921569, 0, 1, 1,
0.5537788, -0.7457041, 0.1413725, 0.3960784, 0, 1, 1,
0.554066, 0.4176744, 0.2966594, 0.4039216, 0, 1, 1,
0.5563419, 0.8666078, 1.829913, 0.4117647, 0, 1, 1,
0.5639448, -1.384968, 2.485937, 0.4156863, 0, 1, 1,
0.5648166, -0.9539845, 3.200348, 0.4235294, 0, 1, 1,
0.5678865, -1.269768, 5.196812, 0.427451, 0, 1, 1,
0.5689917, 0.4057254, 0.01605262, 0.4352941, 0, 1, 1,
0.5696405, 1.92834, -1.175198, 0.4392157, 0, 1, 1,
0.5764291, -0.9580243, 3.341996, 0.4470588, 0, 1, 1,
0.5841094, 0.4307727, -1.495998, 0.4509804, 0, 1, 1,
0.5870175, -0.02420108, 0.6988857, 0.4588235, 0, 1, 1,
0.5870554, -0.1554177, 1.973491, 0.4627451, 0, 1, 1,
0.59046, -0.2436208, 1.772503, 0.4705882, 0, 1, 1,
0.5908759, 1.306039, 1.794032, 0.4745098, 0, 1, 1,
0.6052489, -0.4268695, 3.21858, 0.4823529, 0, 1, 1,
0.6076126, 1.257738, 1.566472, 0.4862745, 0, 1, 1,
0.6089188, -0.8087882, 3.242456, 0.4941176, 0, 1, 1,
0.609426, 0.6359793, 1.515933, 0.5019608, 0, 1, 1,
0.6110278, 0.3129624, 0.9175811, 0.5058824, 0, 1, 1,
0.6218168, -0.6341645, 0.2408306, 0.5137255, 0, 1, 1,
0.6235436, 1.759036, -0.3059876, 0.5176471, 0, 1, 1,
0.6361256, 0.2788885, 2.735835, 0.5254902, 0, 1, 1,
0.6458106, 1.731031, -0.7708051, 0.5294118, 0, 1, 1,
0.6466376, 1.429225, 0.7584432, 0.5372549, 0, 1, 1,
0.6530949, 0.6162881, 1.850887, 0.5411765, 0, 1, 1,
0.654013, -0.3907347, 1.161389, 0.5490196, 0, 1, 1,
0.6551129, 1.797998, -0.4045271, 0.5529412, 0, 1, 1,
0.6720564, 0.5446411, 2.241604, 0.5607843, 0, 1, 1,
0.6803365, -0.5255402, 2.567807, 0.5647059, 0, 1, 1,
0.6811098, -1.126233, 3.86447, 0.572549, 0, 1, 1,
0.6816661, -0.3112134, 1.30643, 0.5764706, 0, 1, 1,
0.6847438, 1.218009, -1.5327, 0.5843138, 0, 1, 1,
0.6852173, -0.2213058, -0.2912972, 0.5882353, 0, 1, 1,
0.6865701, -0.3783719, 2.956581, 0.5960785, 0, 1, 1,
0.6882551, -0.06188427, 2.331278, 0.6039216, 0, 1, 1,
0.6921628, 1.574565, 0.138239, 0.6078432, 0, 1, 1,
0.6926678, -0.6061723, 2.863216, 0.6156863, 0, 1, 1,
0.6946983, 0.9572623, 1.385459, 0.6196079, 0, 1, 1,
0.6983984, -0.3046796, 2.337065, 0.627451, 0, 1, 1,
0.7007172, 1.160043, 2.022625, 0.6313726, 0, 1, 1,
0.7021108, -1.663608, 2.256822, 0.6392157, 0, 1, 1,
0.7024984, 0.3785354, 2.033628, 0.6431373, 0, 1, 1,
0.7056693, 1.189415, 0.7536613, 0.6509804, 0, 1, 1,
0.7061853, 1.60486, -0.04287068, 0.654902, 0, 1, 1,
0.7075452, 0.7092876, 1.17399, 0.6627451, 0, 1, 1,
0.7116416, -0.5703068, 3.328501, 0.6666667, 0, 1, 1,
0.7124677, 0.9567821, 0.1205466, 0.6745098, 0, 1, 1,
0.7143719, 0.3579987, 0.8312362, 0.6784314, 0, 1, 1,
0.7143845, 0.7241788, 0.1736019, 0.6862745, 0, 1, 1,
0.7208177, -1.561061, 2.730736, 0.6901961, 0, 1, 1,
0.7225403, 2.441125, -1.264965, 0.6980392, 0, 1, 1,
0.7270061, -0.2216112, 2.930657, 0.7058824, 0, 1, 1,
0.7311043, -1.480481, 0.9977026, 0.7098039, 0, 1, 1,
0.732128, -0.138448, 0.1007487, 0.7176471, 0, 1, 1,
0.7383946, -0.1655757, 1.6122, 0.7215686, 0, 1, 1,
0.7504981, -0.009158256, 0.6807445, 0.7294118, 0, 1, 1,
0.7538313, -1.256906, 2.267651, 0.7333333, 0, 1, 1,
0.755142, 0.6200034, -0.7077697, 0.7411765, 0, 1, 1,
0.7619065, 1.009112, 2.280672, 0.7450981, 0, 1, 1,
0.7709118, 2.396116, 0.07594074, 0.7529412, 0, 1, 1,
0.7715005, 0.1923492, 3.86968, 0.7568628, 0, 1, 1,
0.7767882, -1.02461, 2.073819, 0.7647059, 0, 1, 1,
0.7816194, 1.059781, 2.261207, 0.7686275, 0, 1, 1,
0.7827793, 1.537429, 1.181684, 0.7764706, 0, 1, 1,
0.783619, 0.3418008, -0.2577097, 0.7803922, 0, 1, 1,
0.7965627, 0.2651132, 2.317745, 0.7882353, 0, 1, 1,
0.7986466, 0.3934664, 0.005268528, 0.7921569, 0, 1, 1,
0.8011161, -0.2928678, 2.373919, 0.8, 0, 1, 1,
0.8021286, 0.9793602, 0.9428216, 0.8078431, 0, 1, 1,
0.8034217, 0.3172925, 0.08349039, 0.8117647, 0, 1, 1,
0.8049898, -0.3584665, 3.044809, 0.8196079, 0, 1, 1,
0.8127198, -1.086261, 3.450938, 0.8235294, 0, 1, 1,
0.8168865, -1.583012, 3.34355, 0.8313726, 0, 1, 1,
0.8177568, -1.319192, 3.189453, 0.8352941, 0, 1, 1,
0.8224015, 0.6864807, 0.0732031, 0.8431373, 0, 1, 1,
0.8256096, -0.4210625, 2.105082, 0.8470588, 0, 1, 1,
0.828878, 0.3632967, 2.085312, 0.854902, 0, 1, 1,
0.8294681, -0.9786526, 1.844172, 0.8588235, 0, 1, 1,
0.8456759, 0.5612361, -1.045781, 0.8666667, 0, 1, 1,
0.8502519, -0.0231046, 0.6606333, 0.8705882, 0, 1, 1,
0.8527165, -0.1356246, 1.395741, 0.8784314, 0, 1, 1,
0.8533772, -3.450864, 1.995568, 0.8823529, 0, 1, 1,
0.8539041, 0.8957549, 0.9915918, 0.8901961, 0, 1, 1,
0.8617176, -1.406509, 3.144819, 0.8941177, 0, 1, 1,
0.8732957, 0.1224627, 0.701049, 0.9019608, 0, 1, 1,
0.8759871, 0.5651201, 1.720198, 0.9098039, 0, 1, 1,
0.8833371, -0.3233315, 1.451686, 0.9137255, 0, 1, 1,
0.8901015, -0.9019904, 1.322938, 0.9215686, 0, 1, 1,
0.8947272, 2.035018, 1.163537, 0.9254902, 0, 1, 1,
0.8949341, -1.160536, 1.358211, 0.9333333, 0, 1, 1,
0.8969905, 0.04067574, -2.039538, 0.9372549, 0, 1, 1,
0.9051375, 0.1969844, 2.636978, 0.945098, 0, 1, 1,
0.9105857, -2.013494, 1.157465, 0.9490196, 0, 1, 1,
0.9110523, -2.307165, 4.090882, 0.9568627, 0, 1, 1,
0.9111997, 0.01225145, 1.779727, 0.9607843, 0, 1, 1,
0.9113159, -0.4382042, 5.07723, 0.9686275, 0, 1, 1,
0.9274118, 0.4834544, 2.81716, 0.972549, 0, 1, 1,
0.9320697, 1.378275, 0.2265386, 0.9803922, 0, 1, 1,
0.9488212, -2.624919, 3.757349, 0.9843137, 0, 1, 1,
0.9556181, -0.7103581, 1.366223, 0.9921569, 0, 1, 1,
0.9593462, -0.6987059, 2.704144, 0.9960784, 0, 1, 1,
0.9711452, -0.2633161, 1.706748, 1, 0, 0.9960784, 1,
0.9731923, 1.757236, 1.614985, 1, 0, 0.9882353, 1,
0.9776288, -1.124133, 1.878243, 1, 0, 0.9843137, 1,
0.9788787, 0.582981, 2.410854, 1, 0, 0.9764706, 1,
0.9854348, -0.0673113, 2.465153, 1, 0, 0.972549, 1,
0.9856324, 0.1222808, 1.994705, 1, 0, 0.9647059, 1,
1.00745, -0.2916833, 3.622875, 1, 0, 0.9607843, 1,
1.010412, 2.214404, 0.6912819, 1, 0, 0.9529412, 1,
1.01405, -0.6355399, 1.447692, 1, 0, 0.9490196, 1,
1.014699, -0.1760827, 0.4460401, 1, 0, 0.9411765, 1,
1.015055, -0.1166465, 1.281142, 1, 0, 0.9372549, 1,
1.017592, 0.1658388, 2.494123, 1, 0, 0.9294118, 1,
1.02471, -0.1806378, 2.456101, 1, 0, 0.9254902, 1,
1.026109, 1.384098, 2.349852, 1, 0, 0.9176471, 1,
1.027041, 0.002651838, 0.673307, 1, 0, 0.9137255, 1,
1.031032, -0.9386026, 1.248923, 1, 0, 0.9058824, 1,
1.045403, -0.06081906, 3.596979, 1, 0, 0.9019608, 1,
1.047737, -0.04831279, 1.61522, 1, 0, 0.8941177, 1,
1.050022, -0.6395691, 0.9209122, 1, 0, 0.8862745, 1,
1.051115, -0.4345883, 1.517807, 1, 0, 0.8823529, 1,
1.055299, -0.5148016, 2.19704, 1, 0, 0.8745098, 1,
1.059068, 0.4126326, -0.03579379, 1, 0, 0.8705882, 1,
1.061495, -0.8944241, 3.607915, 1, 0, 0.8627451, 1,
1.065576, 1.166268, 0.7446725, 1, 0, 0.8588235, 1,
1.078766, -1.327269, 2.69786, 1, 0, 0.8509804, 1,
1.08422, -0.5931205, 2.527166, 1, 0, 0.8470588, 1,
1.088019, -1.89722, 2.727951, 1, 0, 0.8392157, 1,
1.089436, -0.5651194, 1.760179, 1, 0, 0.8352941, 1,
1.093506, 0.4139927, 0.8369323, 1, 0, 0.827451, 1,
1.101088, 1.244051, -0.4399578, 1, 0, 0.8235294, 1,
1.105385, 0.2466276, 2.448544, 1, 0, 0.8156863, 1,
1.109071, 0.7810982, -0.02493392, 1, 0, 0.8117647, 1,
1.110124, 0.5089291, 1.82565, 1, 0, 0.8039216, 1,
1.11087, 0.02937633, 1.868161, 1, 0, 0.7960784, 1,
1.113635, 0.7511703, -0.669993, 1, 0, 0.7921569, 1,
1.117428, -1.406869, 2.393856, 1, 0, 0.7843137, 1,
1.117689, -0.05054057, 1.867898, 1, 0, 0.7803922, 1,
1.118428, -0.3647397, 0.8692796, 1, 0, 0.772549, 1,
1.119084, 0.37626, 1.495721, 1, 0, 0.7686275, 1,
1.120142, 0.06589728, 0.1581794, 1, 0, 0.7607843, 1,
1.120441, -0.4016267, 2.127664, 1, 0, 0.7568628, 1,
1.120991, -0.7758966, 2.363508, 1, 0, 0.7490196, 1,
1.125124, 0.3863247, 0.5465891, 1, 0, 0.7450981, 1,
1.127207, 0.8319913, 1.328221, 1, 0, 0.7372549, 1,
1.128193, -1.049577, 3.171182, 1, 0, 0.7333333, 1,
1.136062, 0.4453076, -0.6775741, 1, 0, 0.7254902, 1,
1.136464, 0.3623934, 1.259954, 1, 0, 0.7215686, 1,
1.136484, 1.318856, 0.2733932, 1, 0, 0.7137255, 1,
1.136737, -0.6352882, 3.141027, 1, 0, 0.7098039, 1,
1.136874, 0.7713322, 0.9786596, 1, 0, 0.7019608, 1,
1.140882, 0.6275706, -0.5570401, 1, 0, 0.6941177, 1,
1.143016, 0.4983182, -0.8354412, 1, 0, 0.6901961, 1,
1.148931, -0.4320806, 3.368405, 1, 0, 0.682353, 1,
1.159559, 1.429069, 0.7940983, 1, 0, 0.6784314, 1,
1.16327, -0.03487902, 1.642522, 1, 0, 0.6705883, 1,
1.166972, -0.1023898, 3.022979, 1, 0, 0.6666667, 1,
1.172317, -0.1535396, 1.584079, 1, 0, 0.6588235, 1,
1.182142, 1.131173, 1.817025, 1, 0, 0.654902, 1,
1.189255, -2.196344, 2.247772, 1, 0, 0.6470588, 1,
1.197499, -0.1916723, 0.7895037, 1, 0, 0.6431373, 1,
1.199962, -1.144522, 3.318517, 1, 0, 0.6352941, 1,
1.211741, -0.05513394, 0.6506315, 1, 0, 0.6313726, 1,
1.215466, 0.8320891, 0.7529828, 1, 0, 0.6235294, 1,
1.221075, 0.5477849, 1.657461, 1, 0, 0.6196079, 1,
1.226073, -0.1478454, 1.57858, 1, 0, 0.6117647, 1,
1.234932, 0.06015148, 2.221545, 1, 0, 0.6078432, 1,
1.236661, -0.1807749, 2.5677, 1, 0, 0.6, 1,
1.239799, -0.6623661, 3.729422, 1, 0, 0.5921569, 1,
1.244227, -0.1945402, 1.471659, 1, 0, 0.5882353, 1,
1.249375, 0.8835624, 0.5611892, 1, 0, 0.5803922, 1,
1.256136, -0.4366291, 2.699581, 1, 0, 0.5764706, 1,
1.256393, 2.16358, 2.159874, 1, 0, 0.5686275, 1,
1.25745, -0.1497476, -0.5021104, 1, 0, 0.5647059, 1,
1.260726, 0.71934, 1.675406, 1, 0, 0.5568628, 1,
1.261286, -0.03257551, 0.2346814, 1, 0, 0.5529412, 1,
1.264594, 0.5138913, 0.7573397, 1, 0, 0.5450981, 1,
1.276953, -0.1366461, 2.213473, 1, 0, 0.5411765, 1,
1.280658, -0.5976883, 3.262383, 1, 0, 0.5333334, 1,
1.2824, -0.1924589, 2.526467, 1, 0, 0.5294118, 1,
1.295271, -0.6750351, 1.311536, 1, 0, 0.5215687, 1,
1.311647, 0.06562509, 1.009214, 1, 0, 0.5176471, 1,
1.314259, 0.4007593, 2.685869, 1, 0, 0.509804, 1,
1.333397, 2.472651, -2.390962, 1, 0, 0.5058824, 1,
1.338982, -0.3705091, 1.874594, 1, 0, 0.4980392, 1,
1.355335, -1.082963, 2.594136, 1, 0, 0.4901961, 1,
1.356305, 0.2269112, 0.8495593, 1, 0, 0.4862745, 1,
1.356531, 0.491689, 1.288338, 1, 0, 0.4784314, 1,
1.371168, -1.372561, 2.738044, 1, 0, 0.4745098, 1,
1.380472, 1.926062, -0.7018666, 1, 0, 0.4666667, 1,
1.381136, -0.9947228, 2.234749, 1, 0, 0.4627451, 1,
1.385564, 1.051181, 2.956268, 1, 0, 0.454902, 1,
1.42323, -0.5206444, 1.210942, 1, 0, 0.4509804, 1,
1.440657, -0.3599482, 2.537003, 1, 0, 0.4431373, 1,
1.463505, -0.4882943, 1.081024, 1, 0, 0.4392157, 1,
1.46707, -0.6558086, 1.813072, 1, 0, 0.4313726, 1,
1.480581, -1.195323, 2.036603, 1, 0, 0.427451, 1,
1.49175, 1.04183, -0.1888866, 1, 0, 0.4196078, 1,
1.497374, -0.9883742, 2.360691, 1, 0, 0.4156863, 1,
1.499136, -1.388568, 3.47848, 1, 0, 0.4078431, 1,
1.505885, 1.659095, 0.1184238, 1, 0, 0.4039216, 1,
1.522858, 1.470149, 0.6461877, 1, 0, 0.3960784, 1,
1.533012, -1.165675, 2.339162, 1, 0, 0.3882353, 1,
1.534602, -0.7848091, 3.460601, 1, 0, 0.3843137, 1,
1.551275, -0.4108957, 2.376658, 1, 0, 0.3764706, 1,
1.551811, -0.9258768, 2.210142, 1, 0, 0.372549, 1,
1.555359, 1.500812, -0.7702617, 1, 0, 0.3647059, 1,
1.5598, -1.049406, 3.113836, 1, 0, 0.3607843, 1,
1.560691, -0.9479682, 1.733981, 1, 0, 0.3529412, 1,
1.583006, -1.116191, 1.291875, 1, 0, 0.3490196, 1,
1.584446, 0.5243366, 1.564116, 1, 0, 0.3411765, 1,
1.589647, 0.07100758, 0.6706446, 1, 0, 0.3372549, 1,
1.590348, -0.3228357, 1.698601, 1, 0, 0.3294118, 1,
1.590444, 1.339197, -0.1457738, 1, 0, 0.3254902, 1,
1.593557, -0.1962312, 0.8708782, 1, 0, 0.3176471, 1,
1.599282, -0.07972353, 0.4803334, 1, 0, 0.3137255, 1,
1.606485, -1.072636, 1.301085, 1, 0, 0.3058824, 1,
1.610786, 1.648979, -0.09662052, 1, 0, 0.2980392, 1,
1.613627, -0.6571496, 1.081343, 1, 0, 0.2941177, 1,
1.617001, -0.5319309, 1.405189, 1, 0, 0.2862745, 1,
1.627698, 2.682704, 0.137901, 1, 0, 0.282353, 1,
1.64855, 0.852688, 2.876647, 1, 0, 0.2745098, 1,
1.650479, -0.3327487, 2.759146, 1, 0, 0.2705882, 1,
1.657066, 0.7408113, 2.808711, 1, 0, 0.2627451, 1,
1.663319, -1.003425, 3.442231, 1, 0, 0.2588235, 1,
1.664856, -1.106298, 3.025353, 1, 0, 0.2509804, 1,
1.669915, 1.185123, 1.352934, 1, 0, 0.2470588, 1,
1.687103, -0.02286574, 0.7157701, 1, 0, 0.2392157, 1,
1.69775, -1.599153, 1.65405, 1, 0, 0.2352941, 1,
1.733415, -0.4864607, 2.025244, 1, 0, 0.227451, 1,
1.740554, 1.655343, 0.5136796, 1, 0, 0.2235294, 1,
1.741498, 0.6346207, 1.304066, 1, 0, 0.2156863, 1,
1.788408, -0.1311731, 1.843665, 1, 0, 0.2117647, 1,
1.820564, -1.515079, 2.988852, 1, 0, 0.2039216, 1,
1.823225, 0.5477773, 1.144976, 1, 0, 0.1960784, 1,
1.867709, -0.5866619, 0.639699, 1, 0, 0.1921569, 1,
1.881724, -0.06506727, 1.222101, 1, 0, 0.1843137, 1,
1.884369, 0.4734065, -0.5464513, 1, 0, 0.1803922, 1,
1.933557, 1.122777, -0.05061261, 1, 0, 0.172549, 1,
1.963133, -0.07895667, 1.926132, 1, 0, 0.1686275, 1,
1.967236, -0.8228068, 2.559288, 1, 0, 0.1607843, 1,
1.988198, 0.6989245, -1.690797, 1, 0, 0.1568628, 1,
2.017045, -1.597139, 3.193402, 1, 0, 0.1490196, 1,
2.02663, -2.609334, 2.017395, 1, 0, 0.145098, 1,
2.033225, 0.2498646, 1.757646, 1, 0, 0.1372549, 1,
2.104047, 0.6666033, 0.251507, 1, 0, 0.1333333, 1,
2.122947, -1.009975, 1.403122, 1, 0, 0.1254902, 1,
2.141251, -0.4201529, 3.167104, 1, 0, 0.1215686, 1,
2.151207, 0.2915899, 2.560039, 1, 0, 0.1137255, 1,
2.160592, -2.214867, 1.124292, 1, 0, 0.1098039, 1,
2.187459, 0.718812, 0.3993776, 1, 0, 0.1019608, 1,
2.209483, 0.3993649, 1.706653, 1, 0, 0.09411765, 1,
2.22185, -0.701106, 1.217963, 1, 0, 0.09019608, 1,
2.223804, 1.48661, 1.739949, 1, 0, 0.08235294, 1,
2.246298, -0.2216315, 1.446288, 1, 0, 0.07843138, 1,
2.25993, 4.150189, 3.047225, 1, 0, 0.07058824, 1,
2.262668, 2.271191, 0.3812304, 1, 0, 0.06666667, 1,
2.332559, -0.3234205, 0.7374888, 1, 0, 0.05882353, 1,
2.542832, -0.7433118, 2.031185, 1, 0, 0.05490196, 1,
2.547737, 1.596587, 0.1902986, 1, 0, 0.04705882, 1,
2.824173, 1.152639, 1.675185, 1, 0, 0.04313726, 1,
2.83977, 0.2012721, 0.8656854, 1, 0, 0.03529412, 1,
3.053438, 1.611996, 2.308807, 1, 0, 0.03137255, 1,
3.10609, 1.24149, 0.5191775, 1, 0, 0.02352941, 1,
3.336204, 0.5460622, 2.966567, 1, 0, 0.01960784, 1,
3.339172, 0.3026584, -0.3634667, 1, 0, 0.01176471, 1,
3.377321, 0.2185479, 2.401459, 1, 0, 0.007843138, 1
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
-0.01025105, -4.739243, -6.816644, 0, -0.5, 0.5, 0.5,
-0.01025105, -4.739243, -6.816644, 1, -0.5, 0.5, 0.5,
-0.01025105, -4.739243, -6.816644, 1, 1.5, 0.5, 0.5,
-0.01025105, -4.739243, -6.816644, 0, 1.5, 0.5, 0.5
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
-4.54621, 0.3496623, -6.816644, 0, -0.5, 0.5, 0.5,
-4.54621, 0.3496623, -6.816644, 1, -0.5, 0.5, 0.5,
-4.54621, 0.3496623, -6.816644, 1, 1.5, 0.5, 0.5,
-4.54621, 0.3496623, -6.816644, 0, 1.5, 0.5, 0.5
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
-4.54621, -4.739243, 0.06066132, 0, -0.5, 0.5, 0.5,
-4.54621, -4.739243, 0.06066132, 1, -0.5, 0.5, 0.5,
-4.54621, -4.739243, 0.06066132, 1, 1.5, 0.5, 0.5,
-4.54621, -4.739243, 0.06066132, 0, 1.5, 0.5, 0.5
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
-3, -3.56488, -5.229574,
3, -3.56488, -5.229574,
-3, -3.56488, -5.229574,
-3, -3.760607, -5.494085,
-2, -3.56488, -5.229574,
-2, -3.760607, -5.494085,
-1, -3.56488, -5.229574,
-1, -3.760607, -5.494085,
0, -3.56488, -5.229574,
0, -3.760607, -5.494085,
1, -3.56488, -5.229574,
1, -3.760607, -5.494085,
2, -3.56488, -5.229574,
2, -3.760607, -5.494085,
3, -3.56488, -5.229574,
3, -3.760607, -5.494085
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
-3, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
-3, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
-3, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
-3, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
-2, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
-2, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
-2, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
-2, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
-1, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
-1, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
-1, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
-1, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
0, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
0, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
0, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
0, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
1, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
1, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
1, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
1, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
2, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
2, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
2, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
2, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5,
3, -4.152061, -6.023109, 0, -0.5, 0.5, 0.5,
3, -4.152061, -6.023109, 1, -0.5, 0.5, 0.5,
3, -4.152061, -6.023109, 1, 1.5, 0.5, 0.5,
3, -4.152061, -6.023109, 0, 1.5, 0.5, 0.5
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
-3.49945, -2, -5.229574,
-3.49945, 4, -5.229574,
-3.49945, -2, -5.229574,
-3.67391, -2, -5.494085,
-3.49945, 0, -5.229574,
-3.67391, 0, -5.494085,
-3.49945, 2, -5.229574,
-3.67391, 2, -5.494085,
-3.49945, 4, -5.229574,
-3.67391, 4, -5.494085
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
"2",
"4"
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
-4.02283, -2, -6.023109, 0, -0.5, 0.5, 0.5,
-4.02283, -2, -6.023109, 1, -0.5, 0.5, 0.5,
-4.02283, -2, -6.023109, 1, 1.5, 0.5, 0.5,
-4.02283, -2, -6.023109, 0, 1.5, 0.5, 0.5,
-4.02283, 0, -6.023109, 0, -0.5, 0.5, 0.5,
-4.02283, 0, -6.023109, 1, -0.5, 0.5, 0.5,
-4.02283, 0, -6.023109, 1, 1.5, 0.5, 0.5,
-4.02283, 0, -6.023109, 0, 1.5, 0.5, 0.5,
-4.02283, 2, -6.023109, 0, -0.5, 0.5, 0.5,
-4.02283, 2, -6.023109, 1, -0.5, 0.5, 0.5,
-4.02283, 2, -6.023109, 1, 1.5, 0.5, 0.5,
-4.02283, 2, -6.023109, 0, 1.5, 0.5, 0.5,
-4.02283, 4, -6.023109, 0, -0.5, 0.5, 0.5,
-4.02283, 4, -6.023109, 1, -0.5, 0.5, 0.5,
-4.02283, 4, -6.023109, 1, 1.5, 0.5, 0.5,
-4.02283, 4, -6.023109, 0, 1.5, 0.5, 0.5
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
-3.49945, -3.56488, -4,
-3.49945, -3.56488, 4,
-3.49945, -3.56488, -4,
-3.67391, -3.760607, -4,
-3.49945, -3.56488, -2,
-3.67391, -3.760607, -2,
-3.49945, -3.56488, 0,
-3.67391, -3.760607, 0,
-3.49945, -3.56488, 2,
-3.67391, -3.760607, 2,
-3.49945, -3.56488, 4,
-3.67391, -3.760607, 4
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
-4.02283, -4.152061, -4, 0, -0.5, 0.5, 0.5,
-4.02283, -4.152061, -4, 1, -0.5, 0.5, 0.5,
-4.02283, -4.152061, -4, 1, 1.5, 0.5, 0.5,
-4.02283, -4.152061, -4, 0, 1.5, 0.5, 0.5,
-4.02283, -4.152061, -2, 0, -0.5, 0.5, 0.5,
-4.02283, -4.152061, -2, 1, -0.5, 0.5, 0.5,
-4.02283, -4.152061, -2, 1, 1.5, 0.5, 0.5,
-4.02283, -4.152061, -2, 0, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 0, 0, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 0, 1, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 0, 1, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 0, 0, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 2, 0, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 2, 1, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 2, 1, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 2, 0, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 4, 0, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 4, 1, -0.5, 0.5, 0.5,
-4.02283, -4.152061, 4, 1, 1.5, 0.5, 0.5,
-4.02283, -4.152061, 4, 0, 1.5, 0.5, 0.5
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
-3.49945, -3.56488, -5.229574,
-3.49945, 4.264205, -5.229574,
-3.49945, -3.56488, 5.350896,
-3.49945, 4.264205, 5.350896,
-3.49945, -3.56488, -5.229574,
-3.49945, -3.56488, 5.350896,
-3.49945, 4.264205, -5.229574,
-3.49945, 4.264205, 5.350896,
-3.49945, -3.56488, -5.229574,
3.478948, -3.56488, -5.229574,
-3.49945, -3.56488, 5.350896,
3.478948, -3.56488, 5.350896,
-3.49945, 4.264205, -5.229574,
3.478948, 4.264205, -5.229574,
-3.49945, 4.264205, 5.350896,
3.478948, 4.264205, 5.350896,
3.478948, -3.56488, -5.229574,
3.478948, 4.264205, -5.229574,
3.478948, -3.56488, 5.350896,
3.478948, 4.264205, 5.350896,
3.478948, -3.56488, -5.229574,
3.478948, -3.56488, 5.350896,
3.478948, 4.264205, -5.229574,
3.478948, 4.264205, 5.350896
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
var radius = 7.955038;
var distance = 35.39286;
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
mvMatrix.translate( 0.01025105, -0.3496623, -0.06066132 );
mvMatrix.scale( 1.232538, 1.098614, 0.8129264 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.39286);
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
pronamide<-read.table("pronamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pronamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
```

```r
y<-pronamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
```

```r
z<-pronamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
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
-3.397823, 2.605211, 0.1359836, 0, 0, 1, 1, 1,
-2.671994, 0.4576876, -1.34093, 1, 0, 0, 1, 1,
-2.660661, 0.9370843, -1.336993, 1, 0, 0, 1, 1,
-2.534608, 1.119986, -0.697096, 1, 0, 0, 1, 1,
-2.473252, -1.000881, -1.957851, 1, 0, 0, 1, 1,
-2.415379, -0.4085382, -0.4048693, 1, 0, 0, 1, 1,
-2.360595, -0.2505575, -0.2545055, 0, 0, 0, 1, 1,
-2.337807, -0.8805399, -1.698511, 0, 0, 0, 1, 1,
-2.332667, -0.7508371, 0.2461153, 0, 0, 0, 1, 1,
-2.317927, 0.1105436, -2.117335, 0, 0, 0, 1, 1,
-2.296623, 1.86027, 0.2560301, 0, 0, 0, 1, 1,
-2.286988, -0.412113, -2.418159, 0, 0, 0, 1, 1,
-2.25273, -1.010205, -3.523953, 0, 0, 0, 1, 1,
-2.248323, -0.2942371, -2.486992, 1, 1, 1, 1, 1,
-2.161436, 0.347742, -2.021628, 1, 1, 1, 1, 1,
-2.158052, 0.373623, -1.529125, 1, 1, 1, 1, 1,
-2.139112, 0.5160549, -1.961025, 1, 1, 1, 1, 1,
-2.129876, 0.2935074, -1.9382, 1, 1, 1, 1, 1,
-2.097919, -0.8962941, -2.324899, 1, 1, 1, 1, 1,
-2.090228, -0.8877146, -0.3209128, 1, 1, 1, 1, 1,
-2.069818, -0.6071762, -1.667764, 1, 1, 1, 1, 1,
-2.039381, -0.5942022, -1.688756, 1, 1, 1, 1, 1,
-2.015636, -0.7778578, -1.831214, 1, 1, 1, 1, 1,
-2.011493, -2.14127, -2.400372, 1, 1, 1, 1, 1,
-1.998346, 1.01963, -1.584885, 1, 1, 1, 1, 1,
-1.983603, 0.4102629, -1.19934, 1, 1, 1, 1, 1,
-1.967207, 0.8841165, -1.182718, 1, 1, 1, 1, 1,
-1.958231, -1.115695, -1.544724, 1, 1, 1, 1, 1,
-1.955711, -0.2646433, -0.2908692, 0, 0, 1, 1, 1,
-1.944679, 0.5095863, -0.4293267, 1, 0, 0, 1, 1,
-1.93195, 0.4360678, -0.4110734, 1, 0, 0, 1, 1,
-1.924187, 0.2193334, -0.7684941, 1, 0, 0, 1, 1,
-1.924178, -0.07534119, -0.9527263, 1, 0, 0, 1, 1,
-1.921202, 0.09589183, -1.418843, 1, 0, 0, 1, 1,
-1.912926, 0.3270648, -2.236269, 0, 0, 0, 1, 1,
-1.89496, -1.324839, -2.595347, 0, 0, 0, 1, 1,
-1.870721, 0.7456438, -0.6326754, 0, 0, 0, 1, 1,
-1.853935, -0.5132968, -1.574683, 0, 0, 0, 1, 1,
-1.840773, 2.002736, -1.983627, 0, 0, 0, 1, 1,
-1.834175, -1.120955, -2.600333, 0, 0, 0, 1, 1,
-1.82768, -0.9752761, -3.514227, 0, 0, 0, 1, 1,
-1.81471, -0.04131619, 0.001531841, 1, 1, 1, 1, 1,
-1.792959, -0.2138659, -2.217844, 1, 1, 1, 1, 1,
-1.758089, 0.9658898, 0.3954092, 1, 1, 1, 1, 1,
-1.749816, 0.5508783, -1.324832, 1, 1, 1, 1, 1,
-1.745367, 2.283958, -0.7938942, 1, 1, 1, 1, 1,
-1.715907, 1.162269, -1.502355, 1, 1, 1, 1, 1,
-1.714432, -2.463428, -2.590318, 1, 1, 1, 1, 1,
-1.709937, -0.09794159, -1.771719, 1, 1, 1, 1, 1,
-1.699911, -0.7589771, -2.024589, 1, 1, 1, 1, 1,
-1.697883, 0.1220161, -2.56681, 1, 1, 1, 1, 1,
-1.69603, 0.4173107, -2.314274, 1, 1, 1, 1, 1,
-1.695071, -1.100502, -3.587424, 1, 1, 1, 1, 1,
-1.691803, 1.362972, -1.466858, 1, 1, 1, 1, 1,
-1.686996, 0.1540799, -0.4130045, 1, 1, 1, 1, 1,
-1.682482, -0.8680304, -3.233152, 1, 1, 1, 1, 1,
-1.676975, 0.667873, -2.480365, 0, 0, 1, 1, 1,
-1.641254, 1.187692, 1.198155, 1, 0, 0, 1, 1,
-1.629862, 1.043022, -0.8340425, 1, 0, 0, 1, 1,
-1.623701, -1.697424, -2.424395, 1, 0, 0, 1, 1,
-1.610476, -0.8830103, -1.249638, 1, 0, 0, 1, 1,
-1.602297, 0.1073587, -2.670854, 1, 0, 0, 1, 1,
-1.599975, 0.8929312, -2.631767, 0, 0, 0, 1, 1,
-1.590827, 1.071431, -1.349115, 0, 0, 0, 1, 1,
-1.585286, -0.2782306, -1.270646, 0, 0, 0, 1, 1,
-1.583543, -1.269264, -1.014048, 0, 0, 0, 1, 1,
-1.581748, 1.494334, -0.9106568, 0, 0, 0, 1, 1,
-1.580684, 1.038157, 0.7216226, 0, 0, 0, 1, 1,
-1.578672, 0.710665, -1.793265, 0, 0, 0, 1, 1,
-1.557235, 1.425186, -1.175665, 1, 1, 1, 1, 1,
-1.55349, 0.4637504, -0.9932835, 1, 1, 1, 1, 1,
-1.552332, 0.8674598, 0.03535768, 1, 1, 1, 1, 1,
-1.543874, -1.254981, -2.333271, 1, 1, 1, 1, 1,
-1.537351, -0.1944837, -2.26181, 1, 1, 1, 1, 1,
-1.533251, 0.9332355, -0.8749382, 1, 1, 1, 1, 1,
-1.527495, 0.345771, -2.603415, 1, 1, 1, 1, 1,
-1.526473, -0.09825892, -2.356153, 1, 1, 1, 1, 1,
-1.522202, 0.1467886, -1.574127, 1, 1, 1, 1, 1,
-1.521343, 0.2314124, -3.253909, 1, 1, 1, 1, 1,
-1.519142, -1.106686, -2.40179, 1, 1, 1, 1, 1,
-1.512972, 0.9182249, -1.168823, 1, 1, 1, 1, 1,
-1.512845, 0.3876148, -1.192892, 1, 1, 1, 1, 1,
-1.510681, 1.298113, -2.459353, 1, 1, 1, 1, 1,
-1.495073, -0.5675738, -2.447378, 1, 1, 1, 1, 1,
-1.494896, 0.4927263, -2.218787, 0, 0, 1, 1, 1,
-1.487969, 2.221767, 0.1344475, 1, 0, 0, 1, 1,
-1.487436, -0.7092729, -2.056855, 1, 0, 0, 1, 1,
-1.451028, -1.586233, -2.130884, 1, 0, 0, 1, 1,
-1.441718, -0.5153351, -0.4720867, 1, 0, 0, 1, 1,
-1.419674, 0.2502662, -2.394669, 1, 0, 0, 1, 1,
-1.416909, -0.598738, -1.737657, 0, 0, 0, 1, 1,
-1.416152, 1.378577, -0.879457, 0, 0, 0, 1, 1,
-1.401702, -0.08985881, -1.806162, 0, 0, 0, 1, 1,
-1.399752, -1.566772, -1.048834, 0, 0, 0, 1, 1,
-1.391791, -0.0185317, -1.176805, 0, 0, 0, 1, 1,
-1.380473, -1.044794, -4.443008, 0, 0, 0, 1, 1,
-1.378441, 0.7482632, -1.861699, 0, 0, 0, 1, 1,
-1.370525, 1.005016, -3.36548, 1, 1, 1, 1, 1,
-1.352252, 2.068051, 0.6328433, 1, 1, 1, 1, 1,
-1.349365, 0.4793005, -0.9890754, 1, 1, 1, 1, 1,
-1.339568, -0.7110686, -1.532847, 1, 1, 1, 1, 1,
-1.336656, -0.004010653, -3.463052, 1, 1, 1, 1, 1,
-1.335814, -0.708169, -1.982013, 1, 1, 1, 1, 1,
-1.331241, -1.619116, -1.742398, 1, 1, 1, 1, 1,
-1.319074, 0.4007074, 0.7047512, 1, 1, 1, 1, 1,
-1.314435, -2.113602, -3.381199, 1, 1, 1, 1, 1,
-1.309985, -2.080312, -2.109397, 1, 1, 1, 1, 1,
-1.30666, -1.032907, -4.037474, 1, 1, 1, 1, 1,
-1.298511, -1.431828, -1.428962, 1, 1, 1, 1, 1,
-1.293334, 1.037924, 1.484483, 1, 1, 1, 1, 1,
-1.287314, 0.5869697, -0.3440883, 1, 1, 1, 1, 1,
-1.284475, 0.6468284, -0.1754647, 1, 1, 1, 1, 1,
-1.28125, -2.196423, -2.987985, 0, 0, 1, 1, 1,
-1.272886, -0.8457489, -2.266527, 1, 0, 0, 1, 1,
-1.272671, 1.801922, -0.5339487, 1, 0, 0, 1, 1,
-1.264709, 1.069201, -0.5131781, 1, 0, 0, 1, 1,
-1.263592, 2.392553, -0.6017203, 1, 0, 0, 1, 1,
-1.250095, -1.129013, -1.934748, 1, 0, 0, 1, 1,
-1.249198, -1.409229, -4.06285, 0, 0, 0, 1, 1,
-1.242008, -1.884158, -2.350396, 0, 0, 0, 1, 1,
-1.221019, 0.8236657, -2.472091, 0, 0, 0, 1, 1,
-1.219279, -0.4448862, -2.346744, 0, 0, 0, 1, 1,
-1.216632, 1.436853, -2.410823, 0, 0, 0, 1, 1,
-1.2005, -0.1891785, -0.5120132, 0, 0, 0, 1, 1,
-1.195735, -0.320499, -1.789625, 0, 0, 0, 1, 1,
-1.178184, -1.509501, -1.746352, 1, 1, 1, 1, 1,
-1.176944, -2.067019, -2.650625, 1, 1, 1, 1, 1,
-1.166404, -0.6730763, -3.234706, 1, 1, 1, 1, 1,
-1.151439, -0.9471961, -2.501744, 1, 1, 1, 1, 1,
-1.146356, 0.4250815, -2.551027, 1, 1, 1, 1, 1,
-1.144959, 0.002400819, -1.772601, 1, 1, 1, 1, 1,
-1.137255, -2.497266, -2.554606, 1, 1, 1, 1, 1,
-1.134058, -0.953508, -0.8832892, 1, 1, 1, 1, 1,
-1.132148, 0.898657, -1.99857, 1, 1, 1, 1, 1,
-1.114677, -0.08353159, -0.8633853, 1, 1, 1, 1, 1,
-1.097079, 0.7488854, -0.8826587, 1, 1, 1, 1, 1,
-1.095428, 0.7608833, -1.892214, 1, 1, 1, 1, 1,
-1.091737, 1.373416, 0.1851452, 1, 1, 1, 1, 1,
-1.091025, 1.597939, 0.1939186, 1, 1, 1, 1, 1,
-1.090978, 1.115137, 0.3447151, 1, 1, 1, 1, 1,
-1.084823, -1.116752, -1.844434, 0, 0, 1, 1, 1,
-1.084238, 0.3032333, -1.711427, 1, 0, 0, 1, 1,
-1.08364, -0.3638481, -2.924506, 1, 0, 0, 1, 1,
-1.078356, 2.508711, -1.018672, 1, 0, 0, 1, 1,
-1.074335, -1.342073, -1.770927, 1, 0, 0, 1, 1,
-1.073751, 0.4651687, -1.661924, 1, 0, 0, 1, 1,
-1.069349, 1.129599, -1.721973, 0, 0, 0, 1, 1,
-1.06863, 0.6912097, 0.6171379, 0, 0, 0, 1, 1,
-1.065865, 0.4252824, -3.934558, 0, 0, 0, 1, 1,
-1.062312, 0.3577287, -2.753456, 0, 0, 0, 1, 1,
-1.057524, -0.191359, -1.169861, 0, 0, 0, 1, 1,
-1.055932, -0.2689139, -1.701325, 0, 0, 0, 1, 1,
-1.044824, -0.8201081, -1.794679, 0, 0, 0, 1, 1,
-1.043807, -1.083305, -4.017377, 1, 1, 1, 1, 1,
-1.043017, -1.264378, -1.885119, 1, 1, 1, 1, 1,
-1.040295, 1.137271, -0.4478306, 1, 1, 1, 1, 1,
-1.038633, -0.409908, -1.931625, 1, 1, 1, 1, 1,
-1.033286, -0.3038919, -2.412944, 1, 1, 1, 1, 1,
-1.027822, -0.4236148, -1.993896, 1, 1, 1, 1, 1,
-1.023856, -0.5783812, -3.585462, 1, 1, 1, 1, 1,
-1.018959, -0.9799676, -2.406356, 1, 1, 1, 1, 1,
-1.016487, -1.455418, -2.8502, 1, 1, 1, 1, 1,
-1.015999, -0.2421533, -3.60496, 1, 1, 1, 1, 1,
-1.014666, -0.4524397, -1.967957, 1, 1, 1, 1, 1,
-1.011196, 0.1907614, -1.008622, 1, 1, 1, 1, 1,
-1.009903, 0.07060346, -2.035451, 1, 1, 1, 1, 1,
-1.006714, -1.206167, -3.222787, 1, 1, 1, 1, 1,
-1.005429, 0.2527404, -1.56986, 1, 1, 1, 1, 1,
-1.001238, 0.4901521, -1.236357, 0, 0, 1, 1, 1,
-0.9904395, -1.303127, -0.4657819, 1, 0, 0, 1, 1,
-0.9782789, -0.2713998, -1.381908, 1, 0, 0, 1, 1,
-0.9740468, -0.3009102, -1.205605, 1, 0, 0, 1, 1,
-0.9735698, -0.3092832, -2.637782, 1, 0, 0, 1, 1,
-0.9681196, -0.2091542, -1.152957, 1, 0, 0, 1, 1,
-0.9571145, 1.843623, -1.867105, 0, 0, 0, 1, 1,
-0.9570307, 0.03401968, -2.001851, 0, 0, 0, 1, 1,
-0.9541495, -1.878403, -1.29005, 0, 0, 0, 1, 1,
-0.9513115, -0.4283542, -1.504494, 0, 0, 0, 1, 1,
-0.9470511, 1.927585, -0.3531086, 0, 0, 0, 1, 1,
-0.9435763, -1.10753, -2.662423, 0, 0, 0, 1, 1,
-0.9425101, -1.444883, -2.749582, 0, 0, 0, 1, 1,
-0.939356, 1.063341, -1.370452, 1, 1, 1, 1, 1,
-0.9377773, 0.4760247, -0.3087759, 1, 1, 1, 1, 1,
-0.9364867, 0.1194272, -2.771144, 1, 1, 1, 1, 1,
-0.9352984, -2.220001, -3.025514, 1, 1, 1, 1, 1,
-0.9346225, 0.7353449, -2.456753, 1, 1, 1, 1, 1,
-0.9344051, -0.2030699, -1.196151, 1, 1, 1, 1, 1,
-0.9301951, -1.773928, -2.093083, 1, 1, 1, 1, 1,
-0.9213532, 0.4235269, 1.058309, 1, 1, 1, 1, 1,
-0.9182611, 1.503131, -0.5947767, 1, 1, 1, 1, 1,
-0.915225, -0.54915, -2.28222, 1, 1, 1, 1, 1,
-0.914331, -0.1843547, -2.140762, 1, 1, 1, 1, 1,
-0.9141171, 1.25687, 0.08910047, 1, 1, 1, 1, 1,
-0.9043849, -0.5970867, -1.389917, 1, 1, 1, 1, 1,
-0.9020942, -1.391368, -3.322658, 1, 1, 1, 1, 1,
-0.8961489, 0.3195186, -1.259829, 1, 1, 1, 1, 1,
-0.8952832, 0.4365726, -0.5723621, 0, 0, 1, 1, 1,
-0.8939224, -0.3964213, -0.2309217, 1, 0, 0, 1, 1,
-0.8877501, 0.3907856, -1.661764, 1, 0, 0, 1, 1,
-0.8828962, 0.7857906, 1.472239, 1, 0, 0, 1, 1,
-0.8820084, 0.01184301, -0.5731356, 1, 0, 0, 1, 1,
-0.8659794, -0.5354128, -1.494959, 1, 0, 0, 1, 1,
-0.8635654, -0.6312746, -1.217217, 0, 0, 0, 1, 1,
-0.860847, -1.183089, -1.054554, 0, 0, 0, 1, 1,
-0.8579065, 0.3236327, -0.148508, 0, 0, 0, 1, 1,
-0.8548876, -0.5658279, -1.37307, 0, 0, 0, 1, 1,
-0.8464683, 0.06236789, -1.939117, 0, 0, 0, 1, 1,
-0.8456706, -1.003077, -2.149289, 0, 0, 0, 1, 1,
-0.8402103, -0.2972105, -0.902219, 0, 0, 0, 1, 1,
-0.838135, -0.288709, -1.230065, 1, 1, 1, 1, 1,
-0.8373648, -0.743409, -3.150795, 1, 1, 1, 1, 1,
-0.8358212, -0.7006266, -1.186746, 1, 1, 1, 1, 1,
-0.8334541, -0.7416109, -2.238478, 1, 1, 1, 1, 1,
-0.8292486, -0.4438299, -2.501656, 1, 1, 1, 1, 1,
-0.8203783, -1.234922, -1.587454, 1, 1, 1, 1, 1,
-0.815468, 0.2615768, -0.6407789, 1, 1, 1, 1, 1,
-0.815026, 0.670201, -1.136031, 1, 1, 1, 1, 1,
-0.8146971, 0.8885878, 0.1049019, 1, 1, 1, 1, 1,
-0.8054031, 0.03310397, -1.138473, 1, 1, 1, 1, 1,
-0.7997272, 0.5453163, -0.888568, 1, 1, 1, 1, 1,
-0.798706, 1.265247, -2.119627, 1, 1, 1, 1, 1,
-0.796977, 0.2168208, -1.178109, 1, 1, 1, 1, 1,
-0.7951616, -0.2493681, -2.540227, 1, 1, 1, 1, 1,
-0.7916586, -0.05661747, -2.239238, 1, 1, 1, 1, 1,
-0.787613, -0.41934, -1.056709, 0, 0, 1, 1, 1,
-0.7862673, -0.9014569, -4.561106, 1, 0, 0, 1, 1,
-0.7861316, -0.5905263, -3.103789, 1, 0, 0, 1, 1,
-0.781182, -1.096614, -3.583348, 1, 0, 0, 1, 1,
-0.780673, 0.9154785, -0.3104466, 1, 0, 0, 1, 1,
-0.7806485, -0.4550702, -2.69588, 1, 0, 0, 1, 1,
-0.7778956, 1.021001, 0.9872825, 0, 0, 0, 1, 1,
-0.7760276, -0.5059649, -1.097154, 0, 0, 0, 1, 1,
-0.7723064, 0.3179228, -1.676144, 0, 0, 0, 1, 1,
-0.7656658, 0.3054857, -0.9070588, 0, 0, 0, 1, 1,
-0.7654883, 0.5020978, -1.411434, 0, 0, 0, 1, 1,
-0.7650218, 0.04053111, -0.5759397, 0, 0, 0, 1, 1,
-0.762261, 0.45177, -1.341313, 0, 0, 0, 1, 1,
-0.7616645, -0.05289061, -2.199229, 1, 1, 1, 1, 1,
-0.7600719, 0.2490825, -1.441803, 1, 1, 1, 1, 1,
-0.7580836, -2.016529, -3.414319, 1, 1, 1, 1, 1,
-0.7568707, -0.2241792, -1.426194, 1, 1, 1, 1, 1,
-0.7521408, 2.788493, -1.529877, 1, 1, 1, 1, 1,
-0.7512383, 0.1635066, -2.922196, 1, 1, 1, 1, 1,
-0.7429368, 0.3541335, -1.07594, 1, 1, 1, 1, 1,
-0.7419763, -0.5414776, -2.417727, 1, 1, 1, 1, 1,
-0.7338771, -0.366518, -0.6099615, 1, 1, 1, 1, 1,
-0.7317398, 0.4531284, -1.860224, 1, 1, 1, 1, 1,
-0.7313237, -0.7849094, -2.651529, 1, 1, 1, 1, 1,
-0.7237769, 0.2730891, -1.653882, 1, 1, 1, 1, 1,
-0.7227377, 0.01884758, -3.097251, 1, 1, 1, 1, 1,
-0.7221591, 1.87058, -0.6406671, 1, 1, 1, 1, 1,
-0.7212309, 1.506704, -1.634385, 1, 1, 1, 1, 1,
-0.7209316, 0.0599813, -0.3240787, 0, 0, 1, 1, 1,
-0.7197115, -0.7320494, -0.3046959, 1, 0, 0, 1, 1,
-0.7097971, 0.4169079, -0.6581383, 1, 0, 0, 1, 1,
-0.7073362, 0.342248, -0.7880153, 1, 0, 0, 1, 1,
-0.7056577, 0.7746578, 0.04439863, 1, 0, 0, 1, 1,
-0.7053067, 1.320461, -1.307466, 1, 0, 0, 1, 1,
-0.7028028, -0.5930323, -0.8317415, 0, 0, 0, 1, 1,
-0.7010068, -0.5137148, -3.341489, 0, 0, 0, 1, 1,
-0.6995279, 0.1374173, -3.475795, 0, 0, 0, 1, 1,
-0.6986434, 0.2969482, -0.5991707, 0, 0, 0, 1, 1,
-0.6982514, 0.4100374, -0.9937423, 0, 0, 0, 1, 1,
-0.6873175, 0.4271406, -1.583172, 0, 0, 0, 1, 1,
-0.6838048, -0.7345216, -0.631223, 0, 0, 0, 1, 1,
-0.6795359, -0.4130931, -4.363708, 1, 1, 1, 1, 1,
-0.6783594, -0.8283655, -2.656663, 1, 1, 1, 1, 1,
-0.6740171, 0.1361725, -1.085788, 1, 1, 1, 1, 1,
-0.6712077, 0.3840575, -0.6536273, 1, 1, 1, 1, 1,
-0.6572029, -0.5492522, -3.489024, 1, 1, 1, 1, 1,
-0.6534268, -1.468645, -1.767781, 1, 1, 1, 1, 1,
-0.6525788, 2.128204, -0.4469799, 1, 1, 1, 1, 1,
-0.6519787, -0.9487645, -4.859363, 1, 1, 1, 1, 1,
-0.651552, 0.3095366, -2.843552, 1, 1, 1, 1, 1,
-0.6510408, 0.3717278, -1.617097, 1, 1, 1, 1, 1,
-0.6430188, -1.871838, -5.075489, 1, 1, 1, 1, 1,
-0.6419794, 2.56354, -1.700423, 1, 1, 1, 1, 1,
-0.6372483, 1.502239, -0.5240753, 1, 1, 1, 1, 1,
-0.6367915, -1.061765, -3.265222, 1, 1, 1, 1, 1,
-0.6358915, 0.1807343, -1.879483, 1, 1, 1, 1, 1,
-0.6344379, 0.4030375, -1.411063, 0, 0, 1, 1, 1,
-0.6334614, 1.462615, -1.137666, 1, 0, 0, 1, 1,
-0.6329538, -0.6864259, -3.121485, 1, 0, 0, 1, 1,
-0.6300424, -1.499806, -2.885231, 1, 0, 0, 1, 1,
-0.6292426, 1.021236, 0.06091674, 1, 0, 0, 1, 1,
-0.6257735, -0.8354793, -0.1980052, 1, 0, 0, 1, 1,
-0.6207734, -1.381843, -1.665716, 0, 0, 0, 1, 1,
-0.6170368, 2.186505, 1.42006, 0, 0, 0, 1, 1,
-0.6158086, 0.2792657, -1.900612, 0, 0, 0, 1, 1,
-0.6153544, 1.458115, 0.3187515, 0, 0, 0, 1, 1,
-0.6137419, 0.09256102, -1.023542, 0, 0, 0, 1, 1,
-0.6133671, 0.6070217, 0.5077521, 0, 0, 0, 1, 1,
-0.6131148, -2.307292, -2.481313, 0, 0, 0, 1, 1,
-0.6005427, -2.87634, -2.585736, 1, 1, 1, 1, 1,
-0.5998631, 1.210487, 0.06964172, 1, 1, 1, 1, 1,
-0.5978362, -1.003806, -2.420612, 1, 1, 1, 1, 1,
-0.5939116, 1.449501, 0.7907113, 1, 1, 1, 1, 1,
-0.5930256, -1.545743, -3.204198, 1, 1, 1, 1, 1,
-0.5885678, 0.8507101, -0.250903, 1, 1, 1, 1, 1,
-0.5765164, -2.001668, -1.963736, 1, 1, 1, 1, 1,
-0.5710125, -2.078985, -4.198113, 1, 1, 1, 1, 1,
-0.5653927, -0.2711792, -0.3869123, 1, 1, 1, 1, 1,
-0.5591097, -2.291995, -1.664708, 1, 1, 1, 1, 1,
-0.5589328, 0.6431633, -1.347483, 1, 1, 1, 1, 1,
-0.5588967, -0.1592586, -2.598639, 1, 1, 1, 1, 1,
-0.5575787, 1.868466, 1.711368, 1, 1, 1, 1, 1,
-0.5426139, 0.6458259, -1.031617, 1, 1, 1, 1, 1,
-0.5424579, -0.8675481, -4.660067, 1, 1, 1, 1, 1,
-0.5401612, 0.4178101, -1.138853, 0, 0, 1, 1, 1,
-0.5393507, 1.467332, -0.1494408, 1, 0, 0, 1, 1,
-0.5392237, 0.1380309, -0.2889123, 1, 0, 0, 1, 1,
-0.5390052, 0.4469615, -1.396672, 1, 0, 0, 1, 1,
-0.5382781, 0.8514747, -0.7473745, 1, 0, 0, 1, 1,
-0.5372952, 0.1177877, 0.5263506, 1, 0, 0, 1, 1,
-0.5334107, -1.079046, -4.138855, 0, 0, 0, 1, 1,
-0.5299798, -0.5874325, -2.288055, 0, 0, 0, 1, 1,
-0.5254893, 1.783471, 0.9934779, 0, 0, 0, 1, 1,
-0.5249998, -1.205644, -3.763944, 0, 0, 0, 1, 1,
-0.5243077, 1.240534, -0.9388253, 0, 0, 0, 1, 1,
-0.5229077, -1.714905, -1.12661, 0, 0, 0, 1, 1,
-0.5227796, 1.920001, -1.063175, 0, 0, 0, 1, 1,
-0.5226191, 0.2404729, -0.6404064, 1, 1, 1, 1, 1,
-0.5201158, -1.711784, -2.178238, 1, 1, 1, 1, 1,
-0.5194029, -0.3581855, -1.899948, 1, 1, 1, 1, 1,
-0.51398, -0.3630319, -1.138082, 1, 1, 1, 1, 1,
-0.5093842, 0.1461203, -1.042914, 1, 1, 1, 1, 1,
-0.5071579, -0.9521599, -0.3539269, 1, 1, 1, 1, 1,
-0.5061713, -0.5092872, -2.196496, 1, 1, 1, 1, 1,
-0.501896, 0.4565929, -0.7207081, 1, 1, 1, 1, 1,
-0.5015361, -0.1634934, -1.065375, 1, 1, 1, 1, 1,
-0.4988601, 0.8657138, 0.5006263, 1, 1, 1, 1, 1,
-0.4970992, 1.058647, 0.03060208, 1, 1, 1, 1, 1,
-0.4921016, -1.324262, -2.450768, 1, 1, 1, 1, 1,
-0.490864, 1.519518, 0.5704362, 1, 1, 1, 1, 1,
-0.4904429, -0.2153244, -1.411553, 1, 1, 1, 1, 1,
-0.4887837, -0.4429404, -3.244126, 1, 1, 1, 1, 1,
-0.4882455, 0.7010586, -1.488346, 0, 0, 1, 1, 1,
-0.4866785, -0.7407037, -3.402452, 1, 0, 0, 1, 1,
-0.4844639, -0.8098438, -3.323751, 1, 0, 0, 1, 1,
-0.4824003, 1.932862, 0.3288125, 1, 0, 0, 1, 1,
-0.4811925, 1.692695, -1.340284, 1, 0, 0, 1, 1,
-0.4811891, 0.3657279, -2.184888, 1, 0, 0, 1, 1,
-0.4789418, -0.2324464, -2.808995, 0, 0, 0, 1, 1,
-0.4696826, 0.5870536, -2.160674, 0, 0, 0, 1, 1,
-0.4693813, 0.1901432, -1.872394, 0, 0, 0, 1, 1,
-0.4652667, -1.628706, -3.633708, 0, 0, 0, 1, 1,
-0.463721, -0.8227499, -3.340631, 0, 0, 0, 1, 1,
-0.4628879, -0.1443897, -0.2269697, 0, 0, 0, 1, 1,
-0.4591732, -0.3706365, -3.94646, 0, 0, 0, 1, 1,
-0.4523226, -0.4049153, -3.53638, 1, 1, 1, 1, 1,
-0.4435991, 0.5054255, -1.827115, 1, 1, 1, 1, 1,
-0.4387326, -1.745416, -1.856047, 1, 1, 1, 1, 1,
-0.4370833, -1.077019, -2.814558, 1, 1, 1, 1, 1,
-0.4359118, -0.03632133, -2.649087, 1, 1, 1, 1, 1,
-0.4345523, -0.6808662, -1.855594, 1, 1, 1, 1, 1,
-0.4335802, 0.1058462, 0.1015352, 1, 1, 1, 1, 1,
-0.4314286, 0.2443885, -2.032696, 1, 1, 1, 1, 1,
-0.428483, -1.690733, -3.181866, 1, 1, 1, 1, 1,
-0.4279058, 1.021922, -0.4058465, 1, 1, 1, 1, 1,
-0.4270247, 1.487158, -0.3953634, 1, 1, 1, 1, 1,
-0.4220442, -0.9201733, -2.613444, 1, 1, 1, 1, 1,
-0.417203, -1.466732, -2.596853, 1, 1, 1, 1, 1,
-0.4150834, 0.8256557, -1.185551, 1, 1, 1, 1, 1,
-0.4135339, -1.478006, -4.41876, 1, 1, 1, 1, 1,
-0.4115463, -0.3213577, -3.699268, 0, 0, 1, 1, 1,
-0.411035, -0.5632678, -2.642899, 1, 0, 0, 1, 1,
-0.4104861, -0.9329559, -1.930405, 1, 0, 0, 1, 1,
-0.4103712, -0.5403751, -1.736786, 1, 0, 0, 1, 1,
-0.4098265, -0.05737613, -1.263552, 1, 0, 0, 1, 1,
-0.4091806, -0.8202521, -2.284607, 1, 0, 0, 1, 1,
-0.4059415, -0.543401, -1.135083, 0, 0, 0, 1, 1,
-0.3970514, 0.3584337, -0.6616676, 0, 0, 0, 1, 1,
-0.3904822, 1.409977, 0.1042157, 0, 0, 0, 1, 1,
-0.3833893, -0.3563008, -4.07111, 0, 0, 0, 1, 1,
-0.3828515, -0.8096083, -3.046662, 0, 0, 0, 1, 1,
-0.3826331, -0.8224277, -1.292733, 0, 0, 0, 1, 1,
-0.377288, -0.6305959, -3.228383, 0, 0, 0, 1, 1,
-0.3761754, 0.2400621, -0.1659087, 1, 1, 1, 1, 1,
-0.3614188, 0.7930169, 1.638544, 1, 1, 1, 1, 1,
-0.3597744, -0.7137179, -2.996262, 1, 1, 1, 1, 1,
-0.3587486, -1.523759, -3.318302, 1, 1, 1, 1, 1,
-0.3576697, -1.50757, -2.076678, 1, 1, 1, 1, 1,
-0.3574183, 0.8881796, -0.4144236, 1, 1, 1, 1, 1,
-0.3561614, -1.066031, -3.338115, 1, 1, 1, 1, 1,
-0.3448926, 0.7797328, -0.4786177, 1, 1, 1, 1, 1,
-0.3413693, -0.1767814, -4.276407, 1, 1, 1, 1, 1,
-0.3301832, -0.5267663, -1.8311, 1, 1, 1, 1, 1,
-0.3257765, -2.03989, -3.023879, 1, 1, 1, 1, 1,
-0.3228831, 0.07912487, -0.9551449, 1, 1, 1, 1, 1,
-0.3226344, 1.777728, -0.2482503, 1, 1, 1, 1, 1,
-0.3218355, 0.855312, -1.347427, 1, 1, 1, 1, 1,
-0.3194412, 0.1778762, -1.65714, 1, 1, 1, 1, 1,
-0.3167287, -2.217655, -2.693828, 0, 0, 1, 1, 1,
-0.3161912, 0.2818601, -1.552735, 1, 0, 0, 1, 1,
-0.3116624, 0.1304473, -0.7992437, 1, 0, 0, 1, 1,
-0.3110955, -1.013776, -2.978407, 1, 0, 0, 1, 1,
-0.3102819, 0.0883716, -2.54151, 1, 0, 0, 1, 1,
-0.3087357, -1.478375, -1.06282, 1, 0, 0, 1, 1,
-0.3042753, -1.363836, -3.194817, 0, 0, 0, 1, 1,
-0.3023559, -1.562459, -2.682922, 0, 0, 0, 1, 1,
-0.302093, -1.781743, -3.008694, 0, 0, 0, 1, 1,
-0.301798, 3.499787, 0.5143518, 0, 0, 0, 1, 1,
-0.2994934, 1.543931, 0.2746669, 0, 0, 0, 1, 1,
-0.2955463, -0.5498303, -2.603679, 0, 0, 0, 1, 1,
-0.2953048, -2.412676, -3.427093, 0, 0, 0, 1, 1,
-0.2916203, -1.068935, -1.28474, 1, 1, 1, 1, 1,
-0.2844017, 1.105746, 0.428729, 1, 1, 1, 1, 1,
-0.2815992, -0.8321309, -1.08407, 1, 1, 1, 1, 1,
-0.2790022, -1.736307, -3.784798, 1, 1, 1, 1, 1,
-0.2739945, -0.941758, -2.11663, 1, 1, 1, 1, 1,
-0.2687649, -0.6561733, -0.8781884, 1, 1, 1, 1, 1,
-0.2661728, 0.261728, -1.090882, 1, 1, 1, 1, 1,
-0.265359, 0.07816974, -0.427568, 1, 1, 1, 1, 1,
-0.264468, 0.3557437, 0.8609408, 1, 1, 1, 1, 1,
-0.2624568, -0.3218496, -2.252071, 1, 1, 1, 1, 1,
-0.2619791, -0.5817803, -0.908024, 1, 1, 1, 1, 1,
-0.2611082, 0.2357098, -1.151593, 1, 1, 1, 1, 1,
-0.2608408, -0.5926899, -3.06461, 1, 1, 1, 1, 1,
-0.2604942, 0.9680505, -2.343899, 1, 1, 1, 1, 1,
-0.2597759, 1.812744, 0.5728776, 1, 1, 1, 1, 1,
-0.2571187, -0.05279171, -2.145413, 0, 0, 1, 1, 1,
-0.2570147, -0.325605, -2.099097, 1, 0, 0, 1, 1,
-0.2564606, -0.7909903, -3.622003, 1, 0, 0, 1, 1,
-0.2562236, -0.9822116, -0.4295251, 1, 0, 0, 1, 1,
-0.2560327, -1.456377, -1.888621, 1, 0, 0, 1, 1,
-0.2522991, 0.04827335, -2.141989, 1, 0, 0, 1, 1,
-0.2467287, 1.434846, 0.9954877, 0, 0, 0, 1, 1,
-0.2416102, -0.4174563, -2.238966, 0, 0, 0, 1, 1,
-0.2371554, 1.739475, -0.4291053, 0, 0, 0, 1, 1,
-0.2337298, 1.047544, -0.7361936, 0, 0, 0, 1, 1,
-0.2298121, -1.540804, -0.7475995, 0, 0, 0, 1, 1,
-0.2277113, 1.165196, -0.3426343, 0, 0, 0, 1, 1,
-0.2264877, 1.638972, -0.3492896, 0, 0, 0, 1, 1,
-0.2256198, 0.7616885, -0.7267069, 1, 1, 1, 1, 1,
-0.224214, 1.261567, -0.3140216, 1, 1, 1, 1, 1,
-0.2205424, -0.1027386, -2.563628, 1, 1, 1, 1, 1,
-0.2198689, 1.630448, 0.5089767, 1, 1, 1, 1, 1,
-0.219484, -1.241229, -3.485289, 1, 1, 1, 1, 1,
-0.2182066, 1.204465, 0.3488402, 1, 1, 1, 1, 1,
-0.2137256, 1.21662, -0.3095227, 1, 1, 1, 1, 1,
-0.2128556, -1.368965, -4.093221, 1, 1, 1, 1, 1,
-0.2119287, -0.954972, -3.194419, 1, 1, 1, 1, 1,
-0.203212, 1.143742, -0.8102405, 1, 1, 1, 1, 1,
-0.2024478, 0.3258402, -0.9625229, 1, 1, 1, 1, 1,
-0.2006783, -0.08035825, -2.040661, 1, 1, 1, 1, 1,
-0.200305, -2.052255, -2.342614, 1, 1, 1, 1, 1,
-0.198781, 0.3251507, -0.7769884, 1, 1, 1, 1, 1,
-0.1906266, 0.7308816, -0.3917217, 1, 1, 1, 1, 1,
-0.1902495, 0.3734055, 1.719898, 0, 0, 1, 1, 1,
-0.1889338, 0.7338057, 0.3713185, 1, 0, 0, 1, 1,
-0.1846275, -0.9543985, -3.721285, 1, 0, 0, 1, 1,
-0.176064, -1.004015, -1.225192, 1, 0, 0, 1, 1,
-0.1729434, -0.8277928, -1.975646, 1, 0, 0, 1, 1,
-0.1720727, -1.629474, -2.229863, 1, 0, 0, 1, 1,
-0.1672677, -1.46546, -3.840344, 0, 0, 0, 1, 1,
-0.1666885, -0.9648725, 0.34172, 0, 0, 0, 1, 1,
-0.1665909, 0.6129364, 0.1768093, 0, 0, 0, 1, 1,
-0.1657531, -0.08310375, -1.808738, 0, 0, 0, 1, 1,
-0.162176, -0.1232394, -2.376744, 0, 0, 0, 1, 1,
-0.1599526, -1.25721, -4.025598, 0, 0, 0, 1, 1,
-0.158442, -0.1631666, -0.09074558, 0, 0, 0, 1, 1,
-0.1549621, 1.263391, -0.6715024, 1, 1, 1, 1, 1,
-0.1385278, -0.034418, 0.2916768, 1, 1, 1, 1, 1,
-0.1339081, -0.03364151, -0.4497346, 1, 1, 1, 1, 1,
-0.1303815, 0.08424208, -2.485425, 1, 1, 1, 1, 1,
-0.1299617, -0.05958637, -1.773438, 1, 1, 1, 1, 1,
-0.1291763, 0.08119235, -1.252613, 1, 1, 1, 1, 1,
-0.1278514, 0.4080014, -0.8046572, 1, 1, 1, 1, 1,
-0.1276582, 0.6615261, 0.5722972, 1, 1, 1, 1, 1,
-0.1239111, 1.0559, 0.009375117, 1, 1, 1, 1, 1,
-0.1224842, 0.2541148, -0.9661614, 1, 1, 1, 1, 1,
-0.1194587, 1.929145, -0.8466682, 1, 1, 1, 1, 1,
-0.1142633, 0.7664154, -0.3409477, 1, 1, 1, 1, 1,
-0.1110766, -0.8764623, -2.703123, 1, 1, 1, 1, 1,
-0.1104308, 1.540814, 0.5949577, 1, 1, 1, 1, 1,
-0.1089335, -0.1051521, -2.911879, 1, 1, 1, 1, 1,
-0.101788, 0.2380106, -0.5010439, 0, 0, 1, 1, 1,
-0.09821109, 0.1262931, 1.466408, 1, 0, 0, 1, 1,
-0.09234052, 1.755335, 0.361335, 1, 0, 0, 1, 1,
-0.08375196, 1.6907, -0.953338, 1, 0, 0, 1, 1,
-0.08370602, -0.6473862, -2.49829, 1, 0, 0, 1, 1,
-0.0822708, 0.5672362, -1.493731, 1, 0, 0, 1, 1,
-0.08182377, -0.8611508, -4.443268, 0, 0, 0, 1, 1,
-0.08131974, 0.9349232, -0.919351, 0, 0, 0, 1, 1,
-0.08122072, 1.305286, 0.0485008, 0, 0, 0, 1, 1,
-0.07953101, -0.1735963, -1.0766, 0, 0, 0, 1, 1,
-0.07799079, -0.4568936, -3.862666, 0, 0, 0, 1, 1,
-0.07405002, -0.6669583, -4.026285, 0, 0, 0, 1, 1,
-0.07273928, -0.2287848, -0.8106712, 0, 0, 0, 1, 1,
-0.07272375, -0.5294208, -2.796616, 1, 1, 1, 1, 1,
-0.06816976, -0.6021769, -1.412031, 1, 1, 1, 1, 1,
-0.06511662, 0.1596544, 0.4509143, 1, 1, 1, 1, 1,
-0.06169197, 0.3609571, 0.20933, 1, 1, 1, 1, 1,
-0.05295181, 0.469436, 0.7780031, 1, 1, 1, 1, 1,
-0.05208309, -0.9553196, -3.685277, 1, 1, 1, 1, 1,
-0.05200564, -0.04305498, -1.541082, 1, 1, 1, 1, 1,
-0.05172623, 1.3462, -1.54983, 1, 1, 1, 1, 1,
-0.05130342, 1.267526, -0.5291408, 1, 1, 1, 1, 1,
-0.05001448, 1.045735, 0.1776687, 1, 1, 1, 1, 1,
-0.04948526, -0.345861, -2.893121, 1, 1, 1, 1, 1,
-0.04839952, -1.411404, -2.541424, 1, 1, 1, 1, 1,
-0.04661417, -2.666289, -1.407222, 1, 1, 1, 1, 1,
-0.04246292, 1.223901, 0.5040891, 1, 1, 1, 1, 1,
-0.04184077, -0.8409579, -3.060383, 1, 1, 1, 1, 1,
-0.02750842, -0.8183063, -3.203494, 0, 0, 1, 1, 1,
-0.02700516, 0.211211, 0.7921974, 1, 0, 0, 1, 1,
-0.02697009, -0.9929628, -3.06431, 1, 0, 0, 1, 1,
-0.02686771, -0.2795365, -2.925135, 1, 0, 0, 1, 1,
-0.02659923, -0.2361056, -3.210403, 1, 0, 0, 1, 1,
-0.02030091, 1.626397, 1.863417, 1, 0, 0, 1, 1,
-0.02026555, -1.522247, -3.642276, 0, 0, 0, 1, 1,
-0.0149597, 0.7981627, 0.4059646, 0, 0, 0, 1, 1,
-0.0126387, -0.285754, -2.676704, 0, 0, 0, 1, 1,
-0.008622769, 0.08734368, -1.340949, 0, 0, 0, 1, 1,
-0.008017181, 0.7197161, 0.6688979, 0, 0, 0, 1, 1,
-0.007203327, 0.7614338, 0.9053672, 0, 0, 0, 1, 1,
-0.004805617, 0.01702518, -0.626205, 0, 0, 0, 1, 1,
-0.004281739, 1.471333, -1.557008, 1, 1, 1, 1, 1,
-0.003191631, -0.523816, -2.898253, 1, 1, 1, 1, 1,
-0.002257936, -0.09884862, -2.325596, 1, 1, 1, 1, 1,
-0.0002415189, -1.139601, -2.242206, 1, 1, 1, 1, 1,
0.003894221, 0.1539455, 0.9229806, 1, 1, 1, 1, 1,
0.004863285, -0.315393, 4.169075, 1, 1, 1, 1, 1,
0.005526766, 0.2619785, -0.259572, 1, 1, 1, 1, 1,
0.006074512, -0.915816, 2.456206, 1, 1, 1, 1, 1,
0.007423461, 0.6361362, -0.2106648, 1, 1, 1, 1, 1,
0.01168906, -0.1966665, 3.117125, 1, 1, 1, 1, 1,
0.0132308, 0.1785588, -1.720953, 1, 1, 1, 1, 1,
0.01965708, 0.7375028, -0.9780725, 1, 1, 1, 1, 1,
0.0202355, -2.721323, 3.417939, 1, 1, 1, 1, 1,
0.02444564, -1.006216, 2.834786, 1, 1, 1, 1, 1,
0.02537531, -1.372146, 4.988494, 1, 1, 1, 1, 1,
0.02724208, -0.1636197, 3.802305, 0, 0, 1, 1, 1,
0.02954665, -0.5921769, 3.708147, 1, 0, 0, 1, 1,
0.02968148, -0.6640256, 3.529901, 1, 0, 0, 1, 1,
0.03112293, -1.558666, 3.320801, 1, 0, 0, 1, 1,
0.03169072, -0.557663, 3.670841, 1, 0, 0, 1, 1,
0.03383448, -1.819287, 1.396957, 1, 0, 0, 1, 1,
0.03628257, -0.8264585, 2.176206, 0, 0, 0, 1, 1,
0.03917381, -1.462233, 2.955508, 0, 0, 0, 1, 1,
0.03956971, -0.8920288, 2.536789, 0, 0, 0, 1, 1,
0.04299937, 1.423275, -1.568256, 0, 0, 0, 1, 1,
0.04410817, -0.5000119, 2.122802, 0, 0, 0, 1, 1,
0.04444511, 0.9529513, -0.3085709, 0, 0, 0, 1, 1,
0.04650662, 0.6067604, -0.02438442, 0, 0, 0, 1, 1,
0.04884377, -0.4437925, 2.47567, 1, 1, 1, 1, 1,
0.05012491, -2.002058, 3.801799, 1, 1, 1, 1, 1,
0.05132397, 0.391177, -1.416038, 1, 1, 1, 1, 1,
0.05893129, -0.8659718, 1.898368, 1, 1, 1, 1, 1,
0.05912192, 0.5363283, 1.228437, 1, 1, 1, 1, 1,
0.06000362, -0.5873059, 2.623392, 1, 1, 1, 1, 1,
0.06042614, -0.3392467, 2.025127, 1, 1, 1, 1, 1,
0.06468581, -0.8981184, 2.654424, 1, 1, 1, 1, 1,
0.06502516, -0.6236587, 3.135162, 1, 1, 1, 1, 1,
0.06557573, 0.9288676, -1.389921, 1, 1, 1, 1, 1,
0.07269619, 1.865504, 0.6508459, 1, 1, 1, 1, 1,
0.07475586, -0.9819604, 3.533128, 1, 1, 1, 1, 1,
0.07646561, 0.1956716, 2.580018, 1, 1, 1, 1, 1,
0.07848736, 0.1669432, 0.7518781, 1, 1, 1, 1, 1,
0.0804026, -0.2209456, 4.154218, 1, 1, 1, 1, 1,
0.08232836, -1.020735, 2.938655, 0, 0, 1, 1, 1,
0.08276298, -0.9944557, 2.59786, 1, 0, 0, 1, 1,
0.0892098, -0.01729829, 1.787136, 1, 0, 0, 1, 1,
0.09005552, 0.9822072, 1.157887, 1, 0, 0, 1, 1,
0.09148734, 0.8548198, 0.5252628, 1, 0, 0, 1, 1,
0.1022151, -0.6703286, 3.599479, 1, 0, 0, 1, 1,
0.1040395, 0.768041, 1.562846, 0, 0, 0, 1, 1,
0.1043433, -0.08768971, 1.677191, 0, 0, 0, 1, 1,
0.1074461, -0.4441973, 3.856619, 0, 0, 0, 1, 1,
0.1086018, -0.972091, 3.399491, 0, 0, 0, 1, 1,
0.111744, -0.6482702, 4.047945, 0, 0, 0, 1, 1,
0.1136664, 0.4993578, -0.1956448, 0, 0, 0, 1, 1,
0.115245, -0.3813574, 2.101847, 0, 0, 0, 1, 1,
0.1181549, 0.4593573, -0.07570463, 1, 1, 1, 1, 1,
0.1229537, -0.5111654, 2.167357, 1, 1, 1, 1, 1,
0.1248675, -0.8518248, 3.204782, 1, 1, 1, 1, 1,
0.1251431, 1.869772, 0.2734274, 1, 1, 1, 1, 1,
0.1276281, -1.508839, 3.079226, 1, 1, 1, 1, 1,
0.1276293, -0.6421591, 2.005227, 1, 1, 1, 1, 1,
0.1332948, -0.4709304, 4.560874, 1, 1, 1, 1, 1,
0.1336786, -0.4726164, 3.845832, 1, 1, 1, 1, 1,
0.1340234, -0.8497876, 3.769376, 1, 1, 1, 1, 1,
0.1341265, -1.761017, 3.275426, 1, 1, 1, 1, 1,
0.1359124, 1.436526, -0.08907735, 1, 1, 1, 1, 1,
0.1412078, 1.02342, -1.223544, 1, 1, 1, 1, 1,
0.1423575, -1.204669, 1.89168, 1, 1, 1, 1, 1,
0.1463442, -1.40247, 3.636531, 1, 1, 1, 1, 1,
0.1513875, -0.3094061, 1.80389, 1, 1, 1, 1, 1,
0.1514939, 1.151148, -0.3409064, 0, 0, 1, 1, 1,
0.1553726, 0.3616232, 1.614814, 1, 0, 0, 1, 1,
0.1577188, -0.4948723, 0.9570561, 1, 0, 0, 1, 1,
0.1579001, -0.3309273, 3.437176, 1, 0, 0, 1, 1,
0.1662742, 0.3184948, -0.9219354, 1, 0, 0, 1, 1,
0.1746333, -0.8969905, 2.175874, 1, 0, 0, 1, 1,
0.1759318, -0.6374598, 3.676721, 0, 0, 0, 1, 1,
0.1780179, 0.8422841, 2.511742, 0, 0, 0, 1, 1,
0.1781926, 0.7229923, 0.08963794, 0, 0, 0, 1, 1,
0.1791883, 0.1832912, 1.030871, 0, 0, 0, 1, 1,
0.1799758, 0.7911656, -3.387964, 0, 0, 0, 1, 1,
0.1840178, 0.4119852, 1.114652, 0, 0, 0, 1, 1,
0.1858461, -0.1564464, 2.695118, 0, 0, 0, 1, 1,
0.1870806, 0.6827874, 0.6460825, 1, 1, 1, 1, 1,
0.1872342, 0.6987931, 0.8893963, 1, 1, 1, 1, 1,
0.1872992, -0.1368831, 1.433126, 1, 1, 1, 1, 1,
0.1884559, -1.16053, 3.402272, 1, 1, 1, 1, 1,
0.1919868, -1.379357, 3.665826, 1, 1, 1, 1, 1,
0.1921918, 0.7410243, -0.1379499, 1, 1, 1, 1, 1,
0.1937734, -1.115958, 2.455839, 1, 1, 1, 1, 1,
0.1949637, 0.8292746, 0.7157863, 1, 1, 1, 1, 1,
0.1986158, 0.3464493, -0.4866633, 1, 1, 1, 1, 1,
0.2015175, -0.4364223, 1.961459, 1, 1, 1, 1, 1,
0.2029586, -0.1565902, 0.9742104, 1, 1, 1, 1, 1,
0.2043717, 0.7082234, -1.88528, 1, 1, 1, 1, 1,
0.2105878, 1.543117, 1.214832, 1, 1, 1, 1, 1,
0.2195352, -0.1336446, 2.961127, 1, 1, 1, 1, 1,
0.2203789, 0.3659936, -0.5657514, 1, 1, 1, 1, 1,
0.2204815, -0.6721596, 1.97976, 0, 0, 1, 1, 1,
0.2225916, -0.6579884, 4.032015, 1, 0, 0, 1, 1,
0.2226256, 0.1507228, 1.662474, 1, 0, 0, 1, 1,
0.2226653, -0.141969, 1.731046, 1, 0, 0, 1, 1,
0.2263122, -0.8492453, 1.178449, 1, 0, 0, 1, 1,
0.2299491, 1.293831, 1.014452, 1, 0, 0, 1, 1,
0.2340377, -0.3560925, -0.08235873, 0, 0, 0, 1, 1,
0.2388858, 0.5697375, -0.8674069, 0, 0, 0, 1, 1,
0.2416622, 1.15372, -0.1548161, 0, 0, 0, 1, 1,
0.2422875, 0.8313522, -0.09756944, 0, 0, 0, 1, 1,
0.2425614, 1.550032, -0.6315715, 0, 0, 0, 1, 1,
0.2455026, 0.4388697, 0.6739986, 0, 0, 0, 1, 1,
0.2458892, -1.043115, 2.217116, 0, 0, 0, 1, 1,
0.2460557, -0.09249831, 3.026039, 1, 1, 1, 1, 1,
0.2489512, -1.818628, 4.296759, 1, 1, 1, 1, 1,
0.2563724, -0.3503882, 2.338974, 1, 1, 1, 1, 1,
0.2575321, 1.089394, 0.8689808, 1, 1, 1, 1, 1,
0.2579238, 0.6249319, -2.102828, 1, 1, 1, 1, 1,
0.2621829, 1.611576, 1.075391, 1, 1, 1, 1, 1,
0.2634982, -0.3425527, 1.840573, 1, 1, 1, 1, 1,
0.2672713, 0.234462, 2.413736, 1, 1, 1, 1, 1,
0.268308, -0.6618942, 3.391174, 1, 1, 1, 1, 1,
0.271562, -0.1312674, 1.853415, 1, 1, 1, 1, 1,
0.2726218, 0.03564826, 0.2217291, 1, 1, 1, 1, 1,
0.2732442, 0.9598797, 0.06420065, 1, 1, 1, 1, 1,
0.2772883, 1.16396, -1.455579, 1, 1, 1, 1, 1,
0.2799007, 0.6460321, 0.6284043, 1, 1, 1, 1, 1,
0.2854981, -0.8289378, 2.497638, 1, 1, 1, 1, 1,
0.2883747, -0.5173657, 4.333896, 0, 0, 1, 1, 1,
0.2899881, 0.4207616, -0.664817, 1, 0, 0, 1, 1,
0.2973974, 0.4772386, -0.8920901, 1, 0, 0, 1, 1,
0.3008964, -0.06653007, 1.008897, 1, 0, 0, 1, 1,
0.3018239, 0.8168882, -1.139152, 1, 0, 0, 1, 1,
0.302376, 0.1295901, 0.7408413, 1, 0, 0, 1, 1,
0.3029099, -0.7530635, 3.099263, 0, 0, 0, 1, 1,
0.3042996, -1.2516, 1.947063, 0, 0, 0, 1, 1,
0.3061406, 0.4213206, 0.2820397, 0, 0, 0, 1, 1,
0.3193105, 1.414156, -0.2579789, 0, 0, 0, 1, 1,
0.3194731, -0.7987437, 3.826351, 0, 0, 0, 1, 1,
0.3196001, 1.40869, 1.959234, 0, 0, 0, 1, 1,
0.3249578, 0.4399892, -0.6351374, 0, 0, 0, 1, 1,
0.3270575, 1.313176, -1.296807, 1, 1, 1, 1, 1,
0.3364844, 0.8199599, -0.2051462, 1, 1, 1, 1, 1,
0.3428778, 0.3458785, 0.2146181, 1, 1, 1, 1, 1,
0.3433975, -0.5829977, 4.53867, 1, 1, 1, 1, 1,
0.3495206, -1.172801, 3.694324, 1, 1, 1, 1, 1,
0.352014, 1.181107, -0.3666088, 1, 1, 1, 1, 1,
0.3531631, 1.39044, 0.2914858, 1, 1, 1, 1, 1,
0.3544554, 0.2296399, 1.312967, 1, 1, 1, 1, 1,
0.3636746, 2.286271, -1.90436, 1, 1, 1, 1, 1,
0.3655763, -1.484972, 4.192963, 1, 1, 1, 1, 1,
0.3700143, -1.242423, 2.736702, 1, 1, 1, 1, 1,
0.3714987, 0.6084302, -0.06179574, 1, 1, 1, 1, 1,
0.3798524, 0.8142434, 0.2302883, 1, 1, 1, 1, 1,
0.3800631, -0.9849473, 2.837165, 1, 1, 1, 1, 1,
0.3824066, 1.39504, -0.01664175, 1, 1, 1, 1, 1,
0.3838511, 0.709613, -0.4906701, 0, 0, 1, 1, 1,
0.3886831, -1.440218, 4.581307, 1, 0, 0, 1, 1,
0.3905434, 1.212265, -0.1046874, 1, 0, 0, 1, 1,
0.3909329, 1.255432, 2.235124, 1, 0, 0, 1, 1,
0.392583, -0.512517, 3.218348, 1, 0, 0, 1, 1,
0.3958996, -0.1659344, 0.7884088, 1, 0, 0, 1, 1,
0.3959952, -0.6354744, 1.293285, 0, 0, 0, 1, 1,
0.3965368, 0.8110207, 0.8946751, 0, 0, 0, 1, 1,
0.3987912, -0.8466098, 3.558162, 0, 0, 0, 1, 1,
0.4025472, 1.468064, 0.1702495, 0, 0, 0, 1, 1,
0.4045902, 0.3515407, 2.005112, 0, 0, 0, 1, 1,
0.405334, -1.356276, 3.857159, 0, 0, 0, 1, 1,
0.4056631, -1.074714, 2.652615, 0, 0, 0, 1, 1,
0.4071761, 0.9369545, 0.3043363, 1, 1, 1, 1, 1,
0.4136196, 1.197524, 0.03922813, 1, 1, 1, 1, 1,
0.4138204, 0.550906, -1.799468, 1, 1, 1, 1, 1,
0.418197, -0.3849761, 1.081054, 1, 1, 1, 1, 1,
0.4188351, -1.460587, 5.060689, 1, 1, 1, 1, 1,
0.4200006, 0.6034832, 0.2514488, 1, 1, 1, 1, 1,
0.4213298, 1.571489, 0.3140883, 1, 1, 1, 1, 1,
0.4242577, -2.095067, 2.125441, 1, 1, 1, 1, 1,
0.4248259, -0.2349535, 2.111724, 1, 1, 1, 1, 1,
0.4260151, -1.761518, 2.165665, 1, 1, 1, 1, 1,
0.4282342, 0.4597262, 0.04420524, 1, 1, 1, 1, 1,
0.4302088, -0.5138593, 2.37841, 1, 1, 1, 1, 1,
0.4307957, -0.8996315, 2.925009, 1, 1, 1, 1, 1,
0.43828, -1.443272, 3.719619, 1, 1, 1, 1, 1,
0.4388283, 1.008791, -1.499625, 1, 1, 1, 1, 1,
0.4437001, -0.7950916, 2.498099, 0, 0, 1, 1, 1,
0.4446956, 0.8641546, 0.495424, 1, 0, 0, 1, 1,
0.4575399, -1.379609, 3.680741, 1, 0, 0, 1, 1,
0.4587443, -1.614787, 1.331768, 1, 0, 0, 1, 1,
0.4743778, -0.1140815, 2.315492, 1, 0, 0, 1, 1,
0.474741, 2.204003, 0.3993471, 1, 0, 0, 1, 1,
0.4788855, -1.047887, 2.16207, 0, 0, 0, 1, 1,
0.4812729, -0.1361472, 1.053829, 0, 0, 0, 1, 1,
0.4832585, 0.7685758, 3.172609, 0, 0, 0, 1, 1,
0.4833743, -0.1816069, 2.183995, 0, 0, 0, 1, 1,
0.4864981, -0.9088348, 2.386336, 0, 0, 0, 1, 1,
0.4891701, 0.4144221, 3.667064, 0, 0, 0, 1, 1,
0.4914696, -0.1602648, 0.5811969, 0, 0, 0, 1, 1,
0.4932787, 0.9547669, -0.1329324, 1, 1, 1, 1, 1,
0.4940466, -0.7811509, 2.854021, 1, 1, 1, 1, 1,
0.4981505, 0.175331, 1.337937, 1, 1, 1, 1, 1,
0.4999957, 1.335179, 0.7609524, 1, 1, 1, 1, 1,
0.5019864, 0.9615484, 0.4597821, 1, 1, 1, 1, 1,
0.5054795, 0.7375175, 1.135117, 1, 1, 1, 1, 1,
0.5124624, -0.8255181, 4.363551, 1, 1, 1, 1, 1,
0.5151209, -1.633408, 1.309032, 1, 1, 1, 1, 1,
0.5161983, -0.6397606, 2.572904, 1, 1, 1, 1, 1,
0.5211095, -0.3049939, 1.728625, 1, 1, 1, 1, 1,
0.5232098, -1.237992, 4.006657, 1, 1, 1, 1, 1,
0.524895, -0.8711872, 1.036481, 1, 1, 1, 1, 1,
0.5252877, 0.04325144, 1.831832, 1, 1, 1, 1, 1,
0.528906, -1.495098, 3.652154, 1, 1, 1, 1, 1,
0.5301379, -0.8740942, 0.8395221, 1, 1, 1, 1, 1,
0.533697, 1.930868, 0.09349921, 0, 0, 1, 1, 1,
0.5351459, 0.4605628, 1.078543, 1, 0, 0, 1, 1,
0.5421401, 0.02249733, 0.9502884, 1, 0, 0, 1, 1,
0.5472199, 0.5590656, 0.7762995, 1, 0, 0, 1, 1,
0.5475357, -0.5706735, 4.02, 1, 0, 0, 1, 1,
0.5537788, -0.7457041, 0.1413725, 1, 0, 0, 1, 1,
0.554066, 0.4176744, 0.2966594, 0, 0, 0, 1, 1,
0.5563419, 0.8666078, 1.829913, 0, 0, 0, 1, 1,
0.5639448, -1.384968, 2.485937, 0, 0, 0, 1, 1,
0.5648166, -0.9539845, 3.200348, 0, 0, 0, 1, 1,
0.5678865, -1.269768, 5.196812, 0, 0, 0, 1, 1,
0.5689917, 0.4057254, 0.01605262, 0, 0, 0, 1, 1,
0.5696405, 1.92834, -1.175198, 0, 0, 0, 1, 1,
0.5764291, -0.9580243, 3.341996, 1, 1, 1, 1, 1,
0.5841094, 0.4307727, -1.495998, 1, 1, 1, 1, 1,
0.5870175, -0.02420108, 0.6988857, 1, 1, 1, 1, 1,
0.5870554, -0.1554177, 1.973491, 1, 1, 1, 1, 1,
0.59046, -0.2436208, 1.772503, 1, 1, 1, 1, 1,
0.5908759, 1.306039, 1.794032, 1, 1, 1, 1, 1,
0.6052489, -0.4268695, 3.21858, 1, 1, 1, 1, 1,
0.6076126, 1.257738, 1.566472, 1, 1, 1, 1, 1,
0.6089188, -0.8087882, 3.242456, 1, 1, 1, 1, 1,
0.609426, 0.6359793, 1.515933, 1, 1, 1, 1, 1,
0.6110278, 0.3129624, 0.9175811, 1, 1, 1, 1, 1,
0.6218168, -0.6341645, 0.2408306, 1, 1, 1, 1, 1,
0.6235436, 1.759036, -0.3059876, 1, 1, 1, 1, 1,
0.6361256, 0.2788885, 2.735835, 1, 1, 1, 1, 1,
0.6458106, 1.731031, -0.7708051, 1, 1, 1, 1, 1,
0.6466376, 1.429225, 0.7584432, 0, 0, 1, 1, 1,
0.6530949, 0.6162881, 1.850887, 1, 0, 0, 1, 1,
0.654013, -0.3907347, 1.161389, 1, 0, 0, 1, 1,
0.6551129, 1.797998, -0.4045271, 1, 0, 0, 1, 1,
0.6720564, 0.5446411, 2.241604, 1, 0, 0, 1, 1,
0.6803365, -0.5255402, 2.567807, 1, 0, 0, 1, 1,
0.6811098, -1.126233, 3.86447, 0, 0, 0, 1, 1,
0.6816661, -0.3112134, 1.30643, 0, 0, 0, 1, 1,
0.6847438, 1.218009, -1.5327, 0, 0, 0, 1, 1,
0.6852173, -0.2213058, -0.2912972, 0, 0, 0, 1, 1,
0.6865701, -0.3783719, 2.956581, 0, 0, 0, 1, 1,
0.6882551, -0.06188427, 2.331278, 0, 0, 0, 1, 1,
0.6921628, 1.574565, 0.138239, 0, 0, 0, 1, 1,
0.6926678, -0.6061723, 2.863216, 1, 1, 1, 1, 1,
0.6946983, 0.9572623, 1.385459, 1, 1, 1, 1, 1,
0.6983984, -0.3046796, 2.337065, 1, 1, 1, 1, 1,
0.7007172, 1.160043, 2.022625, 1, 1, 1, 1, 1,
0.7021108, -1.663608, 2.256822, 1, 1, 1, 1, 1,
0.7024984, 0.3785354, 2.033628, 1, 1, 1, 1, 1,
0.7056693, 1.189415, 0.7536613, 1, 1, 1, 1, 1,
0.7061853, 1.60486, -0.04287068, 1, 1, 1, 1, 1,
0.7075452, 0.7092876, 1.17399, 1, 1, 1, 1, 1,
0.7116416, -0.5703068, 3.328501, 1, 1, 1, 1, 1,
0.7124677, 0.9567821, 0.1205466, 1, 1, 1, 1, 1,
0.7143719, 0.3579987, 0.8312362, 1, 1, 1, 1, 1,
0.7143845, 0.7241788, 0.1736019, 1, 1, 1, 1, 1,
0.7208177, -1.561061, 2.730736, 1, 1, 1, 1, 1,
0.7225403, 2.441125, -1.264965, 1, 1, 1, 1, 1,
0.7270061, -0.2216112, 2.930657, 0, 0, 1, 1, 1,
0.7311043, -1.480481, 0.9977026, 1, 0, 0, 1, 1,
0.732128, -0.138448, 0.1007487, 1, 0, 0, 1, 1,
0.7383946, -0.1655757, 1.6122, 1, 0, 0, 1, 1,
0.7504981, -0.009158256, 0.6807445, 1, 0, 0, 1, 1,
0.7538313, -1.256906, 2.267651, 1, 0, 0, 1, 1,
0.755142, 0.6200034, -0.7077697, 0, 0, 0, 1, 1,
0.7619065, 1.009112, 2.280672, 0, 0, 0, 1, 1,
0.7709118, 2.396116, 0.07594074, 0, 0, 0, 1, 1,
0.7715005, 0.1923492, 3.86968, 0, 0, 0, 1, 1,
0.7767882, -1.02461, 2.073819, 0, 0, 0, 1, 1,
0.7816194, 1.059781, 2.261207, 0, 0, 0, 1, 1,
0.7827793, 1.537429, 1.181684, 0, 0, 0, 1, 1,
0.783619, 0.3418008, -0.2577097, 1, 1, 1, 1, 1,
0.7965627, 0.2651132, 2.317745, 1, 1, 1, 1, 1,
0.7986466, 0.3934664, 0.005268528, 1, 1, 1, 1, 1,
0.8011161, -0.2928678, 2.373919, 1, 1, 1, 1, 1,
0.8021286, 0.9793602, 0.9428216, 1, 1, 1, 1, 1,
0.8034217, 0.3172925, 0.08349039, 1, 1, 1, 1, 1,
0.8049898, -0.3584665, 3.044809, 1, 1, 1, 1, 1,
0.8127198, -1.086261, 3.450938, 1, 1, 1, 1, 1,
0.8168865, -1.583012, 3.34355, 1, 1, 1, 1, 1,
0.8177568, -1.319192, 3.189453, 1, 1, 1, 1, 1,
0.8224015, 0.6864807, 0.0732031, 1, 1, 1, 1, 1,
0.8256096, -0.4210625, 2.105082, 1, 1, 1, 1, 1,
0.828878, 0.3632967, 2.085312, 1, 1, 1, 1, 1,
0.8294681, -0.9786526, 1.844172, 1, 1, 1, 1, 1,
0.8456759, 0.5612361, -1.045781, 1, 1, 1, 1, 1,
0.8502519, -0.0231046, 0.6606333, 0, 0, 1, 1, 1,
0.8527165, -0.1356246, 1.395741, 1, 0, 0, 1, 1,
0.8533772, -3.450864, 1.995568, 1, 0, 0, 1, 1,
0.8539041, 0.8957549, 0.9915918, 1, 0, 0, 1, 1,
0.8617176, -1.406509, 3.144819, 1, 0, 0, 1, 1,
0.8732957, 0.1224627, 0.701049, 1, 0, 0, 1, 1,
0.8759871, 0.5651201, 1.720198, 0, 0, 0, 1, 1,
0.8833371, -0.3233315, 1.451686, 0, 0, 0, 1, 1,
0.8901015, -0.9019904, 1.322938, 0, 0, 0, 1, 1,
0.8947272, 2.035018, 1.163537, 0, 0, 0, 1, 1,
0.8949341, -1.160536, 1.358211, 0, 0, 0, 1, 1,
0.8969905, 0.04067574, -2.039538, 0, 0, 0, 1, 1,
0.9051375, 0.1969844, 2.636978, 0, 0, 0, 1, 1,
0.9105857, -2.013494, 1.157465, 1, 1, 1, 1, 1,
0.9110523, -2.307165, 4.090882, 1, 1, 1, 1, 1,
0.9111997, 0.01225145, 1.779727, 1, 1, 1, 1, 1,
0.9113159, -0.4382042, 5.07723, 1, 1, 1, 1, 1,
0.9274118, 0.4834544, 2.81716, 1, 1, 1, 1, 1,
0.9320697, 1.378275, 0.2265386, 1, 1, 1, 1, 1,
0.9488212, -2.624919, 3.757349, 1, 1, 1, 1, 1,
0.9556181, -0.7103581, 1.366223, 1, 1, 1, 1, 1,
0.9593462, -0.6987059, 2.704144, 1, 1, 1, 1, 1,
0.9711452, -0.2633161, 1.706748, 1, 1, 1, 1, 1,
0.9731923, 1.757236, 1.614985, 1, 1, 1, 1, 1,
0.9776288, -1.124133, 1.878243, 1, 1, 1, 1, 1,
0.9788787, 0.582981, 2.410854, 1, 1, 1, 1, 1,
0.9854348, -0.0673113, 2.465153, 1, 1, 1, 1, 1,
0.9856324, 0.1222808, 1.994705, 1, 1, 1, 1, 1,
1.00745, -0.2916833, 3.622875, 0, 0, 1, 1, 1,
1.010412, 2.214404, 0.6912819, 1, 0, 0, 1, 1,
1.01405, -0.6355399, 1.447692, 1, 0, 0, 1, 1,
1.014699, -0.1760827, 0.4460401, 1, 0, 0, 1, 1,
1.015055, -0.1166465, 1.281142, 1, 0, 0, 1, 1,
1.017592, 0.1658388, 2.494123, 1, 0, 0, 1, 1,
1.02471, -0.1806378, 2.456101, 0, 0, 0, 1, 1,
1.026109, 1.384098, 2.349852, 0, 0, 0, 1, 1,
1.027041, 0.002651838, 0.673307, 0, 0, 0, 1, 1,
1.031032, -0.9386026, 1.248923, 0, 0, 0, 1, 1,
1.045403, -0.06081906, 3.596979, 0, 0, 0, 1, 1,
1.047737, -0.04831279, 1.61522, 0, 0, 0, 1, 1,
1.050022, -0.6395691, 0.9209122, 0, 0, 0, 1, 1,
1.051115, -0.4345883, 1.517807, 1, 1, 1, 1, 1,
1.055299, -0.5148016, 2.19704, 1, 1, 1, 1, 1,
1.059068, 0.4126326, -0.03579379, 1, 1, 1, 1, 1,
1.061495, -0.8944241, 3.607915, 1, 1, 1, 1, 1,
1.065576, 1.166268, 0.7446725, 1, 1, 1, 1, 1,
1.078766, -1.327269, 2.69786, 1, 1, 1, 1, 1,
1.08422, -0.5931205, 2.527166, 1, 1, 1, 1, 1,
1.088019, -1.89722, 2.727951, 1, 1, 1, 1, 1,
1.089436, -0.5651194, 1.760179, 1, 1, 1, 1, 1,
1.093506, 0.4139927, 0.8369323, 1, 1, 1, 1, 1,
1.101088, 1.244051, -0.4399578, 1, 1, 1, 1, 1,
1.105385, 0.2466276, 2.448544, 1, 1, 1, 1, 1,
1.109071, 0.7810982, -0.02493392, 1, 1, 1, 1, 1,
1.110124, 0.5089291, 1.82565, 1, 1, 1, 1, 1,
1.11087, 0.02937633, 1.868161, 1, 1, 1, 1, 1,
1.113635, 0.7511703, -0.669993, 0, 0, 1, 1, 1,
1.117428, -1.406869, 2.393856, 1, 0, 0, 1, 1,
1.117689, -0.05054057, 1.867898, 1, 0, 0, 1, 1,
1.118428, -0.3647397, 0.8692796, 1, 0, 0, 1, 1,
1.119084, 0.37626, 1.495721, 1, 0, 0, 1, 1,
1.120142, 0.06589728, 0.1581794, 1, 0, 0, 1, 1,
1.120441, -0.4016267, 2.127664, 0, 0, 0, 1, 1,
1.120991, -0.7758966, 2.363508, 0, 0, 0, 1, 1,
1.125124, 0.3863247, 0.5465891, 0, 0, 0, 1, 1,
1.127207, 0.8319913, 1.328221, 0, 0, 0, 1, 1,
1.128193, -1.049577, 3.171182, 0, 0, 0, 1, 1,
1.136062, 0.4453076, -0.6775741, 0, 0, 0, 1, 1,
1.136464, 0.3623934, 1.259954, 0, 0, 0, 1, 1,
1.136484, 1.318856, 0.2733932, 1, 1, 1, 1, 1,
1.136737, -0.6352882, 3.141027, 1, 1, 1, 1, 1,
1.136874, 0.7713322, 0.9786596, 1, 1, 1, 1, 1,
1.140882, 0.6275706, -0.5570401, 1, 1, 1, 1, 1,
1.143016, 0.4983182, -0.8354412, 1, 1, 1, 1, 1,
1.148931, -0.4320806, 3.368405, 1, 1, 1, 1, 1,
1.159559, 1.429069, 0.7940983, 1, 1, 1, 1, 1,
1.16327, -0.03487902, 1.642522, 1, 1, 1, 1, 1,
1.166972, -0.1023898, 3.022979, 1, 1, 1, 1, 1,
1.172317, -0.1535396, 1.584079, 1, 1, 1, 1, 1,
1.182142, 1.131173, 1.817025, 1, 1, 1, 1, 1,
1.189255, -2.196344, 2.247772, 1, 1, 1, 1, 1,
1.197499, -0.1916723, 0.7895037, 1, 1, 1, 1, 1,
1.199962, -1.144522, 3.318517, 1, 1, 1, 1, 1,
1.211741, -0.05513394, 0.6506315, 1, 1, 1, 1, 1,
1.215466, 0.8320891, 0.7529828, 0, 0, 1, 1, 1,
1.221075, 0.5477849, 1.657461, 1, 0, 0, 1, 1,
1.226073, -0.1478454, 1.57858, 1, 0, 0, 1, 1,
1.234932, 0.06015148, 2.221545, 1, 0, 0, 1, 1,
1.236661, -0.1807749, 2.5677, 1, 0, 0, 1, 1,
1.239799, -0.6623661, 3.729422, 1, 0, 0, 1, 1,
1.244227, -0.1945402, 1.471659, 0, 0, 0, 1, 1,
1.249375, 0.8835624, 0.5611892, 0, 0, 0, 1, 1,
1.256136, -0.4366291, 2.699581, 0, 0, 0, 1, 1,
1.256393, 2.16358, 2.159874, 0, 0, 0, 1, 1,
1.25745, -0.1497476, -0.5021104, 0, 0, 0, 1, 1,
1.260726, 0.71934, 1.675406, 0, 0, 0, 1, 1,
1.261286, -0.03257551, 0.2346814, 0, 0, 0, 1, 1,
1.264594, 0.5138913, 0.7573397, 1, 1, 1, 1, 1,
1.276953, -0.1366461, 2.213473, 1, 1, 1, 1, 1,
1.280658, -0.5976883, 3.262383, 1, 1, 1, 1, 1,
1.2824, -0.1924589, 2.526467, 1, 1, 1, 1, 1,
1.295271, -0.6750351, 1.311536, 1, 1, 1, 1, 1,
1.311647, 0.06562509, 1.009214, 1, 1, 1, 1, 1,
1.314259, 0.4007593, 2.685869, 1, 1, 1, 1, 1,
1.333397, 2.472651, -2.390962, 1, 1, 1, 1, 1,
1.338982, -0.3705091, 1.874594, 1, 1, 1, 1, 1,
1.355335, -1.082963, 2.594136, 1, 1, 1, 1, 1,
1.356305, 0.2269112, 0.8495593, 1, 1, 1, 1, 1,
1.356531, 0.491689, 1.288338, 1, 1, 1, 1, 1,
1.371168, -1.372561, 2.738044, 1, 1, 1, 1, 1,
1.380472, 1.926062, -0.7018666, 1, 1, 1, 1, 1,
1.381136, -0.9947228, 2.234749, 1, 1, 1, 1, 1,
1.385564, 1.051181, 2.956268, 0, 0, 1, 1, 1,
1.42323, -0.5206444, 1.210942, 1, 0, 0, 1, 1,
1.440657, -0.3599482, 2.537003, 1, 0, 0, 1, 1,
1.463505, -0.4882943, 1.081024, 1, 0, 0, 1, 1,
1.46707, -0.6558086, 1.813072, 1, 0, 0, 1, 1,
1.480581, -1.195323, 2.036603, 1, 0, 0, 1, 1,
1.49175, 1.04183, -0.1888866, 0, 0, 0, 1, 1,
1.497374, -0.9883742, 2.360691, 0, 0, 0, 1, 1,
1.499136, -1.388568, 3.47848, 0, 0, 0, 1, 1,
1.505885, 1.659095, 0.1184238, 0, 0, 0, 1, 1,
1.522858, 1.470149, 0.6461877, 0, 0, 0, 1, 1,
1.533012, -1.165675, 2.339162, 0, 0, 0, 1, 1,
1.534602, -0.7848091, 3.460601, 0, 0, 0, 1, 1,
1.551275, -0.4108957, 2.376658, 1, 1, 1, 1, 1,
1.551811, -0.9258768, 2.210142, 1, 1, 1, 1, 1,
1.555359, 1.500812, -0.7702617, 1, 1, 1, 1, 1,
1.5598, -1.049406, 3.113836, 1, 1, 1, 1, 1,
1.560691, -0.9479682, 1.733981, 1, 1, 1, 1, 1,
1.583006, -1.116191, 1.291875, 1, 1, 1, 1, 1,
1.584446, 0.5243366, 1.564116, 1, 1, 1, 1, 1,
1.589647, 0.07100758, 0.6706446, 1, 1, 1, 1, 1,
1.590348, -0.3228357, 1.698601, 1, 1, 1, 1, 1,
1.590444, 1.339197, -0.1457738, 1, 1, 1, 1, 1,
1.593557, -0.1962312, 0.8708782, 1, 1, 1, 1, 1,
1.599282, -0.07972353, 0.4803334, 1, 1, 1, 1, 1,
1.606485, -1.072636, 1.301085, 1, 1, 1, 1, 1,
1.610786, 1.648979, -0.09662052, 1, 1, 1, 1, 1,
1.613627, -0.6571496, 1.081343, 1, 1, 1, 1, 1,
1.617001, -0.5319309, 1.405189, 0, 0, 1, 1, 1,
1.627698, 2.682704, 0.137901, 1, 0, 0, 1, 1,
1.64855, 0.852688, 2.876647, 1, 0, 0, 1, 1,
1.650479, -0.3327487, 2.759146, 1, 0, 0, 1, 1,
1.657066, 0.7408113, 2.808711, 1, 0, 0, 1, 1,
1.663319, -1.003425, 3.442231, 1, 0, 0, 1, 1,
1.664856, -1.106298, 3.025353, 0, 0, 0, 1, 1,
1.669915, 1.185123, 1.352934, 0, 0, 0, 1, 1,
1.687103, -0.02286574, 0.7157701, 0, 0, 0, 1, 1,
1.69775, -1.599153, 1.65405, 0, 0, 0, 1, 1,
1.733415, -0.4864607, 2.025244, 0, 0, 0, 1, 1,
1.740554, 1.655343, 0.5136796, 0, 0, 0, 1, 1,
1.741498, 0.6346207, 1.304066, 0, 0, 0, 1, 1,
1.788408, -0.1311731, 1.843665, 1, 1, 1, 1, 1,
1.820564, -1.515079, 2.988852, 1, 1, 1, 1, 1,
1.823225, 0.5477773, 1.144976, 1, 1, 1, 1, 1,
1.867709, -0.5866619, 0.639699, 1, 1, 1, 1, 1,
1.881724, -0.06506727, 1.222101, 1, 1, 1, 1, 1,
1.884369, 0.4734065, -0.5464513, 1, 1, 1, 1, 1,
1.933557, 1.122777, -0.05061261, 1, 1, 1, 1, 1,
1.963133, -0.07895667, 1.926132, 1, 1, 1, 1, 1,
1.967236, -0.8228068, 2.559288, 1, 1, 1, 1, 1,
1.988198, 0.6989245, -1.690797, 1, 1, 1, 1, 1,
2.017045, -1.597139, 3.193402, 1, 1, 1, 1, 1,
2.02663, -2.609334, 2.017395, 1, 1, 1, 1, 1,
2.033225, 0.2498646, 1.757646, 1, 1, 1, 1, 1,
2.104047, 0.6666033, 0.251507, 1, 1, 1, 1, 1,
2.122947, -1.009975, 1.403122, 1, 1, 1, 1, 1,
2.141251, -0.4201529, 3.167104, 0, 0, 1, 1, 1,
2.151207, 0.2915899, 2.560039, 1, 0, 0, 1, 1,
2.160592, -2.214867, 1.124292, 1, 0, 0, 1, 1,
2.187459, 0.718812, 0.3993776, 1, 0, 0, 1, 1,
2.209483, 0.3993649, 1.706653, 1, 0, 0, 1, 1,
2.22185, -0.701106, 1.217963, 1, 0, 0, 1, 1,
2.223804, 1.48661, 1.739949, 0, 0, 0, 1, 1,
2.246298, -0.2216315, 1.446288, 0, 0, 0, 1, 1,
2.25993, 4.150189, 3.047225, 0, 0, 0, 1, 1,
2.262668, 2.271191, 0.3812304, 0, 0, 0, 1, 1,
2.332559, -0.3234205, 0.7374888, 0, 0, 0, 1, 1,
2.542832, -0.7433118, 2.031185, 0, 0, 0, 1, 1,
2.547737, 1.596587, 0.1902986, 0, 0, 0, 1, 1,
2.824173, 1.152639, 1.675185, 1, 1, 1, 1, 1,
2.83977, 0.2012721, 0.8656854, 1, 1, 1, 1, 1,
3.053438, 1.611996, 2.308807, 1, 1, 1, 1, 1,
3.10609, 1.24149, 0.5191775, 1, 1, 1, 1, 1,
3.336204, 0.5460622, 2.966567, 1, 1, 1, 1, 1,
3.339172, 0.3026584, -0.3634667, 1, 1, 1, 1, 1,
3.377321, 0.2185479, 2.401459, 1, 1, 1, 1, 1
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
var radius = 9.835513;
var distance = 34.54682;
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
mvMatrix.translate( 0.01025105, -0.3496623, -0.06066132 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.54682);
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
