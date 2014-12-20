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
-3.316778, 0.3508828, -1.641861, 1, 0, 0, 1,
-2.990188, -0.987039, -2.00874, 1, 0.007843138, 0, 1,
-2.938077, -0.1261523, -1.772464, 1, 0.01176471, 0, 1,
-2.785217, 0.5285254, -0.5115367, 1, 0.01960784, 0, 1,
-2.618032, 0.375214, -2.102301, 1, 0.02352941, 0, 1,
-2.570159, 1.321344, -2.969711, 1, 0.03137255, 0, 1,
-2.545389, 0.4481455, -1.711941, 1, 0.03529412, 0, 1,
-2.502796, -1.750678, -2.645842, 1, 0.04313726, 0, 1,
-2.38044, -0.5439861, -2.340922, 1, 0.04705882, 0, 1,
-2.309385, -0.407608, -2.634905, 1, 0.05490196, 0, 1,
-2.290644, -0.6186034, 0.3350186, 1, 0.05882353, 0, 1,
-2.279486, 0.04370907, -1.819684, 1, 0.06666667, 0, 1,
-2.263655, 0.2153166, -0.3607156, 1, 0.07058824, 0, 1,
-2.207402, 1.100044, -2.001047, 1, 0.07843138, 0, 1,
-2.192318, 0.1762753, -0.6110574, 1, 0.08235294, 0, 1,
-2.18479, -0.8985492, -0.7938156, 1, 0.09019608, 0, 1,
-2.157704, -0.02362612, -3.570498, 1, 0.09411765, 0, 1,
-2.12501, 0.5804198, -1.192806, 1, 0.1019608, 0, 1,
-2.06712, -1.42891, -1.901339, 1, 0.1098039, 0, 1,
-1.994711, 1.730384, -1.088407, 1, 0.1137255, 0, 1,
-1.972563, 0.2351217, -2.264155, 1, 0.1215686, 0, 1,
-1.969179, -1.500852, -2.044093, 1, 0.1254902, 0, 1,
-1.96865, -1.284353, -0.6638836, 1, 0.1333333, 0, 1,
-1.936692, -0.1216281, -3.285691, 1, 0.1372549, 0, 1,
-1.930978, 0.1937388, -1.929745, 1, 0.145098, 0, 1,
-1.919814, -0.3124894, -3.266061, 1, 0.1490196, 0, 1,
-1.917846, 1.509989, -1.418155, 1, 0.1568628, 0, 1,
-1.857272, 2.653678, -0.4778509, 1, 0.1607843, 0, 1,
-1.837205, -1.050181, -1.371912, 1, 0.1686275, 0, 1,
-1.833713, 1.936949, -1.366653, 1, 0.172549, 0, 1,
-1.816347, 1.83534, -1.101473, 1, 0.1803922, 0, 1,
-1.816281, -1.191684, -1.426895, 1, 0.1843137, 0, 1,
-1.808022, -0.426038, 0.2883452, 1, 0.1921569, 0, 1,
-1.790277, 0.2361347, -0.8534929, 1, 0.1960784, 0, 1,
-1.773061, -1.089397, -1.964927, 1, 0.2039216, 0, 1,
-1.769665, -1.608229, -1.988346, 1, 0.2117647, 0, 1,
-1.766548, 1.17956, -1.935216, 1, 0.2156863, 0, 1,
-1.758012, -0.3800092, -2.911553, 1, 0.2235294, 0, 1,
-1.756231, -0.8243462, -1.347853, 1, 0.227451, 0, 1,
-1.75311, -0.1800803, -3.011849, 1, 0.2352941, 0, 1,
-1.743602, 0.4927276, -1.054205, 1, 0.2392157, 0, 1,
-1.738101, 0.5555522, -0.5379524, 1, 0.2470588, 0, 1,
-1.727483, 0.1391768, -1.7227, 1, 0.2509804, 0, 1,
-1.72743, 2.175553, -2.468252, 1, 0.2588235, 0, 1,
-1.71971, 0.2013167, -2.976905, 1, 0.2627451, 0, 1,
-1.69574, 0.6801683, -1.982987, 1, 0.2705882, 0, 1,
-1.691319, 1.168824, 0.08186003, 1, 0.2745098, 0, 1,
-1.683931, 2.082065, -1.493526, 1, 0.282353, 0, 1,
-1.683887, 2.234092, -0.1659116, 1, 0.2862745, 0, 1,
-1.67718, -0.7255526, -2.982142, 1, 0.2941177, 0, 1,
-1.671795, -0.329166, -1.952898, 1, 0.3019608, 0, 1,
-1.666333, 0.2433632, -0.1183203, 1, 0.3058824, 0, 1,
-1.648935, 0.2558116, -2.695345, 1, 0.3137255, 0, 1,
-1.642477, -0.7778371, -2.830436, 1, 0.3176471, 0, 1,
-1.638762, -0.02014319, -2.203022, 1, 0.3254902, 0, 1,
-1.635852, -0.007152607, 0.2905871, 1, 0.3294118, 0, 1,
-1.629107, -0.1161195, -2.16354, 1, 0.3372549, 0, 1,
-1.588522, -1.956837, -1.768158, 1, 0.3411765, 0, 1,
-1.559797, 1.642696, 0.7100202, 1, 0.3490196, 0, 1,
-1.55332, 0.4590115, -1.751882, 1, 0.3529412, 0, 1,
-1.543725, -0.01096175, -0.2229111, 1, 0.3607843, 0, 1,
-1.538326, 0.3791219, -0.7355595, 1, 0.3647059, 0, 1,
-1.52008, 1.569433, -1.230278, 1, 0.372549, 0, 1,
-1.513146, -0.5113391, -2.387914, 1, 0.3764706, 0, 1,
-1.50812, -0.9954765, -2.560601, 1, 0.3843137, 0, 1,
-1.502399, 0.6654273, -1.542164, 1, 0.3882353, 0, 1,
-1.50019, 0.4082065, 0.3817635, 1, 0.3960784, 0, 1,
-1.499944, -1.260094, -3.220281, 1, 0.4039216, 0, 1,
-1.49771, 0.2633392, -0.9425057, 1, 0.4078431, 0, 1,
-1.493939, 1.185214, 0.2597063, 1, 0.4156863, 0, 1,
-1.489662, -2.138017, -1.530999, 1, 0.4196078, 0, 1,
-1.485987, -1.173179, -4.267189, 1, 0.427451, 0, 1,
-1.48534, 0.5962146, -0.1815523, 1, 0.4313726, 0, 1,
-1.484807, -1.935319, -2.918136, 1, 0.4392157, 0, 1,
-1.469828, 0.6444507, -1.092573, 1, 0.4431373, 0, 1,
-1.467474, 0.01679041, -0.2785634, 1, 0.4509804, 0, 1,
-1.445866, -0.364439, -2.12752, 1, 0.454902, 0, 1,
-1.4305, 1.215884, -0.9798163, 1, 0.4627451, 0, 1,
-1.42169, 0.4231725, -2.211345, 1, 0.4666667, 0, 1,
-1.417002, -0.1933323, -1.949431, 1, 0.4745098, 0, 1,
-1.409169, -0.04034405, -0.679192, 1, 0.4784314, 0, 1,
-1.409088, 1.939827, -0.5013633, 1, 0.4862745, 0, 1,
-1.400746, -0.05890642, -1.032682, 1, 0.4901961, 0, 1,
-1.396972, 2.16847, -0.07585012, 1, 0.4980392, 0, 1,
-1.394041, -1.1839, -2.951509, 1, 0.5058824, 0, 1,
-1.386497, -1.545389, -2.327831, 1, 0.509804, 0, 1,
-1.382242, 0.03579947, -0.8196907, 1, 0.5176471, 0, 1,
-1.381711, 0.775206, 0.07452633, 1, 0.5215687, 0, 1,
-1.378783, -0.5237211, -1.529709, 1, 0.5294118, 0, 1,
-1.376513, -0.188265, -0.7372162, 1, 0.5333334, 0, 1,
-1.356934, -0.9410273, -3.026072, 1, 0.5411765, 0, 1,
-1.353752, -0.9668602, -1.661765, 1, 0.5450981, 0, 1,
-1.349957, -2.125459, -2.667275, 1, 0.5529412, 0, 1,
-1.344535, -1.901115, -2.365474, 1, 0.5568628, 0, 1,
-1.338842, 0.7408273, -3.317661, 1, 0.5647059, 0, 1,
-1.337441, -1.050355, -3.259007, 1, 0.5686275, 0, 1,
-1.316161, -1.080594, -3.492512, 1, 0.5764706, 0, 1,
-1.313344, -0.1796964, -2.880774, 1, 0.5803922, 0, 1,
-1.298131, -0.1258912, -1.976695, 1, 0.5882353, 0, 1,
-1.296044, -0.1085936, -2.429976, 1, 0.5921569, 0, 1,
-1.286408, 0.5669568, -2.423002, 1, 0.6, 0, 1,
-1.274307, -0.3723127, -3.072994, 1, 0.6078432, 0, 1,
-1.267744, -0.5484918, -2.48473, 1, 0.6117647, 0, 1,
-1.266064, 0.3882671, -1.3653, 1, 0.6196079, 0, 1,
-1.257452, -0.1640149, -3.336703, 1, 0.6235294, 0, 1,
-1.24463, 0.7647632, 0.09357166, 1, 0.6313726, 0, 1,
-1.244181, -0.2901383, -2.653001, 1, 0.6352941, 0, 1,
-1.235852, 1.009741, 0.1128796, 1, 0.6431373, 0, 1,
-1.233752, -1.552577, -2.759553, 1, 0.6470588, 0, 1,
-1.232188, 1.237943, -1.299881, 1, 0.654902, 0, 1,
-1.22902, 0.6152188, -0.6506861, 1, 0.6588235, 0, 1,
-1.219643, 1.574308, -1.185537, 1, 0.6666667, 0, 1,
-1.21938, 0.1693798, -3.365567, 1, 0.6705883, 0, 1,
-1.217608, 0.8123941, -2.326121, 1, 0.6784314, 0, 1,
-1.217284, -1.071139, -2.486802, 1, 0.682353, 0, 1,
-1.211522, -0.2494624, -2.521075, 1, 0.6901961, 0, 1,
-1.196289, -0.5114346, -1.305518, 1, 0.6941177, 0, 1,
-1.195399, 1.683414, -2.369778, 1, 0.7019608, 0, 1,
-1.194551, -0.9203613, -2.534261, 1, 0.7098039, 0, 1,
-1.187492, -0.7275923, -1.746644, 1, 0.7137255, 0, 1,
-1.186677, -0.3618738, -2.598352, 1, 0.7215686, 0, 1,
-1.182582, -0.7173339, -2.554925, 1, 0.7254902, 0, 1,
-1.180125, 0.4801612, -1.807373, 1, 0.7333333, 0, 1,
-1.161884, -0.3961459, -2.188826, 1, 0.7372549, 0, 1,
-1.161443, 0.008419611, -2.017942, 1, 0.7450981, 0, 1,
-1.153821, -1.37083, -2.255481, 1, 0.7490196, 0, 1,
-1.139966, -1.02794, -1.047769, 1, 0.7568628, 0, 1,
-1.134781, -1.571043, -2.26183, 1, 0.7607843, 0, 1,
-1.127385, 0.3344456, -1.905328, 1, 0.7686275, 0, 1,
-1.122533, 2.3041, -2.860401, 1, 0.772549, 0, 1,
-1.117152, -0.6081727, -1.676824, 1, 0.7803922, 0, 1,
-1.113335, 0.4704565, -1.274407, 1, 0.7843137, 0, 1,
-1.106513, -0.365316, -2.275623, 1, 0.7921569, 0, 1,
-1.101273, 0.1699782, -4.082135, 1, 0.7960784, 0, 1,
-1.087832, 1.041371, 0.941832, 1, 0.8039216, 0, 1,
-1.081124, -0.1446707, -2.771151, 1, 0.8117647, 0, 1,
-1.080025, 0.1721001, -2.218663, 1, 0.8156863, 0, 1,
-1.07715, -0.07285883, -1.135425, 1, 0.8235294, 0, 1,
-1.076141, 1.19317, -0.7988967, 1, 0.827451, 0, 1,
-1.073741, -1.690423, -3.30803, 1, 0.8352941, 0, 1,
-1.070163, 0.2500223, 0.167125, 1, 0.8392157, 0, 1,
-1.063025, 0.4693454, 0.5946162, 1, 0.8470588, 0, 1,
-1.06027, -1.073281, -1.735894, 1, 0.8509804, 0, 1,
-1.059512, -0.5419263, -2.73664, 1, 0.8588235, 0, 1,
-1.057304, 0.688193, -1.905906, 1, 0.8627451, 0, 1,
-1.050595, -0.441391, -0.681083, 1, 0.8705882, 0, 1,
-1.0292, -0.7835071, -3.577116, 1, 0.8745098, 0, 1,
-1.021194, 0.674903, -1.014661, 1, 0.8823529, 0, 1,
-1.012892, 0.8218077, -2.99296, 1, 0.8862745, 0, 1,
-1.010442, 0.08127395, 0.05931001, 1, 0.8941177, 0, 1,
-1.00992, -0.3559892, -1.577048, 1, 0.8980392, 0, 1,
-1.009758, -1.070028, -1.141899, 1, 0.9058824, 0, 1,
-1.006257, 1.242301, 0.09450475, 1, 0.9137255, 0, 1,
-1.000792, 1.078847, -2.069765, 1, 0.9176471, 0, 1,
-0.9915629, -0.446837, -2.617759, 1, 0.9254902, 0, 1,
-0.9834668, 0.4306885, 0.1808973, 1, 0.9294118, 0, 1,
-0.9814954, 0.4387102, -3.250653, 1, 0.9372549, 0, 1,
-0.9751535, -1.560758, -3.184061, 1, 0.9411765, 0, 1,
-0.9715242, -0.9456844, -3.390029, 1, 0.9490196, 0, 1,
-0.9630878, -0.1185936, -1.709163, 1, 0.9529412, 0, 1,
-0.956318, -1.369722, -2.617904, 1, 0.9607843, 0, 1,
-0.9554346, -0.332249, -0.834857, 1, 0.9647059, 0, 1,
-0.950847, 0.1508096, -0.396852, 1, 0.972549, 0, 1,
-0.9446023, 0.8149818, -0.2943928, 1, 0.9764706, 0, 1,
-0.9443673, 1.17649, -0.9312268, 1, 0.9843137, 0, 1,
-0.9406338, -1.002711, -3.704557, 1, 0.9882353, 0, 1,
-0.9363822, -1.174554, -2.768862, 1, 0.9960784, 0, 1,
-0.9313707, 1.494039, -1.29213, 0.9960784, 1, 0, 1,
-0.9266276, -0.6212917, -1.372366, 0.9921569, 1, 0, 1,
-0.9160612, 1.090335, -0.8423315, 0.9843137, 1, 0, 1,
-0.9160496, 0.08132151, -2.236622, 0.9803922, 1, 0, 1,
-0.9143593, -0.68893, -0.7588876, 0.972549, 1, 0, 1,
-0.9077546, 0.5749734, -1.014812, 0.9686275, 1, 0, 1,
-0.904426, -0.5355271, -2.050797, 0.9607843, 1, 0, 1,
-0.9036748, 0.3016184, -1.755977, 0.9568627, 1, 0, 1,
-0.8945958, 0.4697348, -1.2373, 0.9490196, 1, 0, 1,
-0.8931279, 0.7843536, -2.156634, 0.945098, 1, 0, 1,
-0.8860965, 2.489405, 1.730813, 0.9372549, 1, 0, 1,
-0.8790106, -0.3252415, -2.004821, 0.9333333, 1, 0, 1,
-0.8783513, -0.6149758, -0.7719675, 0.9254902, 1, 0, 1,
-0.8766413, 0.3181027, -1.858975, 0.9215686, 1, 0, 1,
-0.8757161, -0.7107581, -2.420886, 0.9137255, 1, 0, 1,
-0.8736072, 0.3719047, -3.515381, 0.9098039, 1, 0, 1,
-0.8650246, 1.762328, -0.2804183, 0.9019608, 1, 0, 1,
-0.8610886, 0.4107125, -0.33114, 0.8941177, 1, 0, 1,
-0.8503015, -2.669831, -2.251381, 0.8901961, 1, 0, 1,
-0.8406634, 1.376914, -1.713781, 0.8823529, 1, 0, 1,
-0.8278023, 2.568655, 0.4687711, 0.8784314, 1, 0, 1,
-0.8257803, -0.5251353, -1.553343, 0.8705882, 1, 0, 1,
-0.8190624, 1.863789, -0.5123559, 0.8666667, 1, 0, 1,
-0.8079247, 1.829648, -1.206145, 0.8588235, 1, 0, 1,
-0.8040923, -0.9342429, -2.736229, 0.854902, 1, 0, 1,
-0.8039277, -1.044672, -3.106637, 0.8470588, 1, 0, 1,
-0.8000559, 0.5884219, 0.6036394, 0.8431373, 1, 0, 1,
-0.7914694, 1.19631, -2.335143, 0.8352941, 1, 0, 1,
-0.7886181, 0.8805091, -1.375514, 0.8313726, 1, 0, 1,
-0.7871109, 0.5336378, -1.497432, 0.8235294, 1, 0, 1,
-0.786438, 1.104123, -1.559515, 0.8196079, 1, 0, 1,
-0.7830893, -1.435789, -2.783953, 0.8117647, 1, 0, 1,
-0.7681575, -0.8723572, -2.857447, 0.8078431, 1, 0, 1,
-0.7672611, 0.07972571, -2.025848, 0.8, 1, 0, 1,
-0.7637612, 0.8608084, -2.048824, 0.7921569, 1, 0, 1,
-0.7586823, -1.150385, -2.551286, 0.7882353, 1, 0, 1,
-0.7529936, -0.1551244, -1.163019, 0.7803922, 1, 0, 1,
-0.7468448, 0.1631529, -0.201004, 0.7764706, 1, 0, 1,
-0.745284, 0.003848596, -1.716565, 0.7686275, 1, 0, 1,
-0.7409917, 1.166171, 1.117675, 0.7647059, 1, 0, 1,
-0.7382477, 0.8153644, 1.054598, 0.7568628, 1, 0, 1,
-0.7326599, 0.5349147, -0.9646316, 0.7529412, 1, 0, 1,
-0.7292977, -0.9522976, -3.216872, 0.7450981, 1, 0, 1,
-0.7271278, -1.289029, -4.608287, 0.7411765, 1, 0, 1,
-0.7217963, -1.249842, -0.7790681, 0.7333333, 1, 0, 1,
-0.7213591, -0.090857, -1.220058, 0.7294118, 1, 0, 1,
-0.7166067, -1.122661, -3.928279, 0.7215686, 1, 0, 1,
-0.716397, 2.222451, -1.8631, 0.7176471, 1, 0, 1,
-0.7144046, -1.601943, -3.325363, 0.7098039, 1, 0, 1,
-0.7124749, -0.1783318, -1.470989, 0.7058824, 1, 0, 1,
-0.708141, 1.471707, -0.64058, 0.6980392, 1, 0, 1,
-0.705635, -2.232609, -2.877696, 0.6901961, 1, 0, 1,
-0.7021563, 0.1247702, -2.555018, 0.6862745, 1, 0, 1,
-0.7006212, -1.340776, -3.03313, 0.6784314, 1, 0, 1,
-0.6999925, -1.477173, -2.416747, 0.6745098, 1, 0, 1,
-0.6954956, 0.0513469, -1.771865, 0.6666667, 1, 0, 1,
-0.694236, -1.238643, -2.654577, 0.6627451, 1, 0, 1,
-0.6941419, 1.912021, -1.684605, 0.654902, 1, 0, 1,
-0.6835577, 0.06860287, -1.115206, 0.6509804, 1, 0, 1,
-0.682507, 0.8850761, -0.341664, 0.6431373, 1, 0, 1,
-0.6782101, 1.282885, 0.7861395, 0.6392157, 1, 0, 1,
-0.6781264, -1.913241, -3.990588, 0.6313726, 1, 0, 1,
-0.6773155, -1.183059, -2.835185, 0.627451, 1, 0, 1,
-0.6765473, -0.3517209, -1.72728, 0.6196079, 1, 0, 1,
-0.6748354, 0.6820288, 0.8405203, 0.6156863, 1, 0, 1,
-0.6730973, 0.1294112, -1.021144, 0.6078432, 1, 0, 1,
-0.6707171, -0.6150647, -2.282825, 0.6039216, 1, 0, 1,
-0.6682925, -0.8302246, -1.402812, 0.5960785, 1, 0, 1,
-0.666654, -0.4550967, -2.122411, 0.5882353, 1, 0, 1,
-0.6631981, 0.2148721, -1.345658, 0.5843138, 1, 0, 1,
-0.6625925, -1.792928, -4.559025, 0.5764706, 1, 0, 1,
-0.662012, 0.5866826, -1.076979, 0.572549, 1, 0, 1,
-0.6606884, 0.9415725, -0.9619279, 0.5647059, 1, 0, 1,
-0.6606017, -1.179865, -2.565307, 0.5607843, 1, 0, 1,
-0.6603366, -0.4167826, -1.558804, 0.5529412, 1, 0, 1,
-0.6583372, 1.439408, -0.03790516, 0.5490196, 1, 0, 1,
-0.6575664, 0.1451779, -2.039268, 0.5411765, 1, 0, 1,
-0.6547999, 0.3915077, -2.340268, 0.5372549, 1, 0, 1,
-0.6493404, -0.07936546, -1.023751, 0.5294118, 1, 0, 1,
-0.6428552, -1.65389, -2.057028, 0.5254902, 1, 0, 1,
-0.6427632, 0.9787412, 0.3917132, 0.5176471, 1, 0, 1,
-0.6364228, -1.754091, -3.735095, 0.5137255, 1, 0, 1,
-0.6329801, 0.9642799, -0.1165922, 0.5058824, 1, 0, 1,
-0.62743, -0.9676749, -2.049958, 0.5019608, 1, 0, 1,
-0.6268561, 1.052169, -0.5597081, 0.4941176, 1, 0, 1,
-0.618629, -1.151919, -1.668362, 0.4862745, 1, 0, 1,
-0.6161384, 0.4489568, -0.989026, 0.4823529, 1, 0, 1,
-0.6120534, 1.428925, -0.5596801, 0.4745098, 1, 0, 1,
-0.6092802, 0.6749039, -0.8727645, 0.4705882, 1, 0, 1,
-0.6053681, -1.494205, -3.040101, 0.4627451, 1, 0, 1,
-0.6031768, 1.381481, 1.779476, 0.4588235, 1, 0, 1,
-0.6027909, 1.044807, 0.01697305, 0.4509804, 1, 0, 1,
-0.6019374, 1.085356, -1.358219, 0.4470588, 1, 0, 1,
-0.6008429, 0.9858732, -0.4814277, 0.4392157, 1, 0, 1,
-0.5995106, 0.7176228, -0.744293, 0.4352941, 1, 0, 1,
-0.5984701, -0.6504123, -1.761724, 0.427451, 1, 0, 1,
-0.5984391, -0.8955521, -1.864442, 0.4235294, 1, 0, 1,
-0.5947886, 0.9336944, 0.7970439, 0.4156863, 1, 0, 1,
-0.5935352, 0.06024706, -3.52299, 0.4117647, 1, 0, 1,
-0.5900626, 0.6435078, -2.508942, 0.4039216, 1, 0, 1,
-0.5891158, -0.2454389, -1.846163, 0.3960784, 1, 0, 1,
-0.5843022, 1.306465, -0.9233248, 0.3921569, 1, 0, 1,
-0.5831739, 0.2703537, -1.136715, 0.3843137, 1, 0, 1,
-0.5801046, 0.001882047, -0.9143555, 0.3803922, 1, 0, 1,
-0.5760472, -0.2567817, -2.116008, 0.372549, 1, 0, 1,
-0.5756406, 1.104999, -1.714468, 0.3686275, 1, 0, 1,
-0.5730643, 2.272568, -1.729349, 0.3607843, 1, 0, 1,
-0.5725688, -0.3850891, 0.0357834, 0.3568628, 1, 0, 1,
-0.5723989, -0.6354533, -2.913257, 0.3490196, 1, 0, 1,
-0.5695887, -0.1965552, -1.563265, 0.345098, 1, 0, 1,
-0.5693671, 1.090219, 1.256483, 0.3372549, 1, 0, 1,
-0.566944, -0.494401, -1.729959, 0.3333333, 1, 0, 1,
-0.5661745, 0.469342, -0.3911725, 0.3254902, 1, 0, 1,
-0.5650284, -0.6641574, -2.100137, 0.3215686, 1, 0, 1,
-0.5620185, 0.04964091, -1.418093, 0.3137255, 1, 0, 1,
-0.5619082, 1.71065, -0.914754, 0.3098039, 1, 0, 1,
-0.5578533, 0.6938584, -0.1497522, 0.3019608, 1, 0, 1,
-0.5494483, 0.4942651, -0.7865097, 0.2941177, 1, 0, 1,
-0.5468883, 0.3263946, -1.841973, 0.2901961, 1, 0, 1,
-0.5345559, 1.390989, -0.485263, 0.282353, 1, 0, 1,
-0.5267354, 1.71145, -1.638233, 0.2784314, 1, 0, 1,
-0.5251265, -2.023895, -3.218434, 0.2705882, 1, 0, 1,
-0.5209273, 1.313141, 0.618891, 0.2666667, 1, 0, 1,
-0.516285, 0.1428109, -1.800349, 0.2588235, 1, 0, 1,
-0.5129594, -1.785638, -3.032609, 0.254902, 1, 0, 1,
-0.5085084, -1.088959, -3.739274, 0.2470588, 1, 0, 1,
-0.5042363, -1.419698, -2.905882, 0.2431373, 1, 0, 1,
-0.4952106, -1.19659, -3.485593, 0.2352941, 1, 0, 1,
-0.4933544, -0.5199561, -3.043408, 0.2313726, 1, 0, 1,
-0.4907601, 1.308403, -0.2303109, 0.2235294, 1, 0, 1,
-0.4901271, 0.4020819, -1.774511, 0.2196078, 1, 0, 1,
-0.4882719, -0.6186855, -2.598814, 0.2117647, 1, 0, 1,
-0.4809572, -0.7819263, -2.607889, 0.2078431, 1, 0, 1,
-0.479648, -1.023106, -3.214747, 0.2, 1, 0, 1,
-0.4784338, 0.8986868, -1.418552, 0.1921569, 1, 0, 1,
-0.4753422, -0.04321494, -0.6767185, 0.1882353, 1, 0, 1,
-0.4752566, -0.5911703, -2.527691, 0.1803922, 1, 0, 1,
-0.4718684, 0.409823, -0.8047255, 0.1764706, 1, 0, 1,
-0.4679485, -1.326026, -3.168727, 0.1686275, 1, 0, 1,
-0.4665139, -0.3398455, -1.691757, 0.1647059, 1, 0, 1,
-0.4578148, -0.8262346, -2.256121, 0.1568628, 1, 0, 1,
-0.4555162, -2.094108, -4.646104, 0.1529412, 1, 0, 1,
-0.4548532, 0.2778017, -0.8578928, 0.145098, 1, 0, 1,
-0.4478192, -0.0365892, -1.827607, 0.1411765, 1, 0, 1,
-0.4432751, 0.2394136, 0.5985269, 0.1333333, 1, 0, 1,
-0.441332, 0.2923303, -2.048921, 0.1294118, 1, 0, 1,
-0.4390201, -0.4506192, -2.078321, 0.1215686, 1, 0, 1,
-0.4380172, -0.1316358, -1.065912, 0.1176471, 1, 0, 1,
-0.4313231, 0.01569493, 0.171731, 0.1098039, 1, 0, 1,
-0.4281306, 0.3608116, -2.401489, 0.1058824, 1, 0, 1,
-0.4212994, 0.8559894, -0.28001, 0.09803922, 1, 0, 1,
-0.4192656, -1.055359, -3.421861, 0.09019608, 1, 0, 1,
-0.4108174, 0.7758827, 0.1457186, 0.08627451, 1, 0, 1,
-0.409972, 1.33764, -0.3360196, 0.07843138, 1, 0, 1,
-0.4085557, 0.6602225, -0.8111942, 0.07450981, 1, 0, 1,
-0.405666, 0.7030377, -0.6683913, 0.06666667, 1, 0, 1,
-0.40281, -0.2427436, 0.2272533, 0.0627451, 1, 0, 1,
-0.402378, 1.553548, 2.970153, 0.05490196, 1, 0, 1,
-0.3993976, 0.7677146, -0.2747255, 0.05098039, 1, 0, 1,
-0.3987659, 0.853802, 0.766193, 0.04313726, 1, 0, 1,
-0.3976824, -0.5915016, -2.000824, 0.03921569, 1, 0, 1,
-0.3958869, -1.166339, -2.619833, 0.03137255, 1, 0, 1,
-0.3928571, 0.4545524, -1.19259, 0.02745098, 1, 0, 1,
-0.3918694, -2.28075, -3.531186, 0.01960784, 1, 0, 1,
-0.3910817, 1.162456, -1.360027, 0.01568628, 1, 0, 1,
-0.3843084, -1.795816, -3.52822, 0.007843138, 1, 0, 1,
-0.3820011, 1.089161, 0.763207, 0.003921569, 1, 0, 1,
-0.3785993, -0.3718676, -2.966639, 0, 1, 0.003921569, 1,
-0.3784956, -2.466316, -4.145743, 0, 1, 0.01176471, 1,
-0.3746123, 0.1294595, 0.5145964, 0, 1, 0.01568628, 1,
-0.3738826, -0.7913569, -3.986027, 0, 1, 0.02352941, 1,
-0.3716926, -0.7893672, -0.5068752, 0, 1, 0.02745098, 1,
-0.3697731, 0.08103298, -0.2242196, 0, 1, 0.03529412, 1,
-0.3654277, 1.330087, 0.5246251, 0, 1, 0.03921569, 1,
-0.356788, 1.94094, 0.3235957, 0, 1, 0.04705882, 1,
-0.3537425, -0.8382622, -3.570068, 0, 1, 0.05098039, 1,
-0.3497761, 1.492839, -0.1339361, 0, 1, 0.05882353, 1,
-0.3450674, 2.875234, -1.670291, 0, 1, 0.0627451, 1,
-0.3440534, -0.2355895, -2.983876, 0, 1, 0.07058824, 1,
-0.342018, -1.585794, -2.572144, 0, 1, 0.07450981, 1,
-0.3406913, -0.1753416, -2.243466, 0, 1, 0.08235294, 1,
-0.3373305, 0.2292837, -2.500083, 0, 1, 0.08627451, 1,
-0.3360439, 0.2238038, -1.602395, 0, 1, 0.09411765, 1,
-0.3349094, 0.4241489, 0.5744897, 0, 1, 0.1019608, 1,
-0.3322639, -1.447752, -1.71337, 0, 1, 0.1058824, 1,
-0.3238637, 0.2340189, 0.4367903, 0, 1, 0.1137255, 1,
-0.3187118, 1.683252, 0.7253385, 0, 1, 0.1176471, 1,
-0.3173203, -1.686335, -2.377367, 0, 1, 0.1254902, 1,
-0.3118424, -0.3354366, -3.683204, 0, 1, 0.1294118, 1,
-0.3106194, -0.1987774, -3.313745, 0, 1, 0.1372549, 1,
-0.3050305, 0.1395182, -1.159779, 0, 1, 0.1411765, 1,
-0.3034167, -2.087768, -2.088068, 0, 1, 0.1490196, 1,
-0.2985053, -0.676007, -1.002986, 0, 1, 0.1529412, 1,
-0.2978559, 1.245282, 0.2081866, 0, 1, 0.1607843, 1,
-0.2978289, -0.2340404, -2.529386, 0, 1, 0.1647059, 1,
-0.2960511, -0.3026596, -0.05811767, 0, 1, 0.172549, 1,
-0.2921588, 0.6440091, 0.6080119, 0, 1, 0.1764706, 1,
-0.2896519, 1.491917, 1.134985, 0, 1, 0.1843137, 1,
-0.282853, 0.3659634, -1.483384, 0, 1, 0.1882353, 1,
-0.2805606, 0.602448, -2.28991, 0, 1, 0.1960784, 1,
-0.2795688, -2.20326, -2.823308, 0, 1, 0.2039216, 1,
-0.2792509, 0.05339229, 0.3359255, 0, 1, 0.2078431, 1,
-0.2740099, 1.184154, -0.2474571, 0, 1, 0.2156863, 1,
-0.271798, -0.7733881, -1.924058, 0, 1, 0.2196078, 1,
-0.2712246, -0.1884829, -3.537854, 0, 1, 0.227451, 1,
-0.2687854, -0.3538939, -2.071533, 0, 1, 0.2313726, 1,
-0.2663106, 0.8797839, 1.336307, 0, 1, 0.2392157, 1,
-0.2605691, -1.102757, -3.32207, 0, 1, 0.2431373, 1,
-0.2543359, 0.1319201, -2.28256, 0, 1, 0.2509804, 1,
-0.2513783, -1.391705, -1.318035, 0, 1, 0.254902, 1,
-0.2475984, 1.016197, 0.4072886, 0, 1, 0.2627451, 1,
-0.2452014, 0.5540627, -0.7675221, 0, 1, 0.2666667, 1,
-0.2447017, -0.6023195, -2.399953, 0, 1, 0.2745098, 1,
-0.2419261, 0.3086607, -0.5878681, 0, 1, 0.2784314, 1,
-0.2418086, -1.611222, -3.96785, 0, 1, 0.2862745, 1,
-0.2411844, 0.1838122, -2.049345, 0, 1, 0.2901961, 1,
-0.2391997, -0.756887, -1.791489, 0, 1, 0.2980392, 1,
-0.2380261, 0.1567068, 0.3429118, 0, 1, 0.3058824, 1,
-0.2368609, 0.403989, 0.1793982, 0, 1, 0.3098039, 1,
-0.2367536, -0.2654043, -2.49902, 0, 1, 0.3176471, 1,
-0.2365604, 0.4184069, 1.672208, 0, 1, 0.3215686, 1,
-0.2344786, -0.5663469, -1.326623, 0, 1, 0.3294118, 1,
-0.2344572, 0.0187764, -1.043352, 0, 1, 0.3333333, 1,
-0.2304964, -0.7867294, -1.724076, 0, 1, 0.3411765, 1,
-0.2302334, 0.2059233, -0.5132355, 0, 1, 0.345098, 1,
-0.2279633, 0.06467033, 0.4125059, 0, 1, 0.3529412, 1,
-0.2260847, 0.2255519, -2.824761, 0, 1, 0.3568628, 1,
-0.2237139, -0.2643855, -3.118252, 0, 1, 0.3647059, 1,
-0.2235945, -0.2036448, -2.901692, 0, 1, 0.3686275, 1,
-0.2149526, 0.5881404, 0.425634, 0, 1, 0.3764706, 1,
-0.21321, -0.3440472, -1.008169, 0, 1, 0.3803922, 1,
-0.207425, -0.5462193, -2.698807, 0, 1, 0.3882353, 1,
-0.2047482, 0.5424712, -0.4421319, 0, 1, 0.3921569, 1,
-0.2025182, 0.8056594, -0.7080733, 0, 1, 0.4, 1,
-0.201495, -0.9526857, -3.014894, 0, 1, 0.4078431, 1,
-0.1969759, 0.2797878, -0.8357826, 0, 1, 0.4117647, 1,
-0.1962369, 0.292041, -0.21349, 0, 1, 0.4196078, 1,
-0.1929953, 1.353282, 2.183785, 0, 1, 0.4235294, 1,
-0.1913492, -0.6237439, -2.519319, 0, 1, 0.4313726, 1,
-0.1905769, 0.01774455, -1.440294, 0, 1, 0.4352941, 1,
-0.1900484, -1.112433, -2.475034, 0, 1, 0.4431373, 1,
-0.1868362, 0.810764, 0.9869294, 0, 1, 0.4470588, 1,
-0.1801295, -0.1343898, -1.626566, 0, 1, 0.454902, 1,
-0.1797671, 0.6768116, 1.617345, 0, 1, 0.4588235, 1,
-0.1784292, -0.9244033, -2.701449, 0, 1, 0.4666667, 1,
-0.1779238, -0.5413441, -3.052336, 0, 1, 0.4705882, 1,
-0.1774468, 0.2476083, -1.95546, 0, 1, 0.4784314, 1,
-0.1767409, 0.3662825, -0.2133664, 0, 1, 0.4823529, 1,
-0.1761867, 0.2705423, 0.103739, 0, 1, 0.4901961, 1,
-0.174078, 0.3006054, -1.166181, 0, 1, 0.4941176, 1,
-0.168037, 0.8773547, -0.5311043, 0, 1, 0.5019608, 1,
-0.1661896, 0.1731222, -1.148989, 0, 1, 0.509804, 1,
-0.1568624, 0.9856973, -1.042472, 0, 1, 0.5137255, 1,
-0.1550779, 1.252998, -0.515524, 0, 1, 0.5215687, 1,
-0.1521364, -1.903563, -1.814558, 0, 1, 0.5254902, 1,
-0.1488714, 0.9013137, 0.3097961, 0, 1, 0.5333334, 1,
-0.1488102, 0.7348679, -0.210225, 0, 1, 0.5372549, 1,
-0.1476832, -1.189701, -4.094271, 0, 1, 0.5450981, 1,
-0.1446324, 0.3163116, -0.9329289, 0, 1, 0.5490196, 1,
-0.1429349, 0.453145, -1.813387, 0, 1, 0.5568628, 1,
-0.139734, -0.5458378, -2.187711, 0, 1, 0.5607843, 1,
-0.1343563, -0.2366298, -2.303679, 0, 1, 0.5686275, 1,
-0.1301425, -0.5867419, -4.745764, 0, 1, 0.572549, 1,
-0.1298234, 0.1655387, -1.930978, 0, 1, 0.5803922, 1,
-0.1250975, -0.1925097, -2.289598, 0, 1, 0.5843138, 1,
-0.1184275, -0.2277172, -3.48285, 0, 1, 0.5921569, 1,
-0.1179573, -0.1874409, -0.9307385, 0, 1, 0.5960785, 1,
-0.1174603, 1.751456, 0.5487522, 0, 1, 0.6039216, 1,
-0.1140128, -1.377498, -1.886204, 0, 1, 0.6117647, 1,
-0.1131161, -0.2148422, -2.105909, 0, 1, 0.6156863, 1,
-0.1083047, -0.3774342, -4.794855, 0, 1, 0.6235294, 1,
-0.1080256, -0.1061387, -2.911506, 0, 1, 0.627451, 1,
-0.09787249, 0.6578465, -0.4769376, 0, 1, 0.6352941, 1,
-0.09563754, -2.338147, -2.985586, 0, 1, 0.6392157, 1,
-0.09299462, -0.5631716, -3.011503, 0, 1, 0.6470588, 1,
-0.09283824, 0.2115856, -0.7707552, 0, 1, 0.6509804, 1,
-0.09180848, 1.38061, 0.5386193, 0, 1, 0.6588235, 1,
-0.08908253, 0.9063209, -0.6174766, 0, 1, 0.6627451, 1,
-0.08604018, -1.089575, -1.853429, 0, 1, 0.6705883, 1,
-0.08577824, -0.01119631, -3.221568, 0, 1, 0.6745098, 1,
-0.08458138, -0.5107668, -3.295591, 0, 1, 0.682353, 1,
-0.08306958, 0.8911406, -1.526004, 0, 1, 0.6862745, 1,
-0.08224908, 0.9419822, -0.0689039, 0, 1, 0.6941177, 1,
-0.08184682, -2.08988, -3.049801, 0, 1, 0.7019608, 1,
-0.07397398, 1.401796, -0.1158233, 0, 1, 0.7058824, 1,
-0.0708185, 0.07065456, -2.465091, 0, 1, 0.7137255, 1,
-0.07081622, 0.7414981, -0.1649651, 0, 1, 0.7176471, 1,
-0.07065281, 1.41011, 1.397958, 0, 1, 0.7254902, 1,
-0.06993216, -0.3378103, -4.56572, 0, 1, 0.7294118, 1,
-0.0665058, -0.09676767, -2.831888, 0, 1, 0.7372549, 1,
-0.06192126, -0.3603562, -3.267544, 0, 1, 0.7411765, 1,
-0.05440034, 0.607999, 0.7115812, 0, 1, 0.7490196, 1,
-0.0485062, -0.726839, -2.873105, 0, 1, 0.7529412, 1,
-0.04734976, -0.5743551, -2.37071, 0, 1, 0.7607843, 1,
-0.04050487, -0.3256675, -4.828644, 0, 1, 0.7647059, 1,
-0.03823797, -0.1015938, 0.9972501, 0, 1, 0.772549, 1,
-0.03328015, -1.082087, -3.323494, 0, 1, 0.7764706, 1,
-0.03130589, -0.03251415, -2.956244, 0, 1, 0.7843137, 1,
-0.02926539, -0.5180399, -4.711665, 0, 1, 0.7882353, 1,
-0.02780449, -1.255928, -1.805489, 0, 1, 0.7960784, 1,
-0.02653302, 1.277589, 0.1033724, 0, 1, 0.8039216, 1,
-0.0217436, 3.382861, 0.4011461, 0, 1, 0.8078431, 1,
-0.02084897, 0.788507, -2.079439, 0, 1, 0.8156863, 1,
-0.0151622, -1.105927, -2.589977, 0, 1, 0.8196079, 1,
-0.0135394, 1.025638, -1.083267, 0, 1, 0.827451, 1,
-0.0109332, -0.8242142, -2.543269, 0, 1, 0.8313726, 1,
-0.01001478, -0.8808497, -3.395576, 0, 1, 0.8392157, 1,
-0.009031593, -0.2294503, -2.960398, 0, 1, 0.8431373, 1,
-0.007330212, -0.5193617, -3.628217, 0, 1, 0.8509804, 1,
-0.005851344, -0.3162032, -2.505427, 0, 1, 0.854902, 1,
-0.004145226, 2.013153, 0.7050411, 0, 1, 0.8627451, 1,
-0.0014711, 0.3494934, 0.334953, 0, 1, 0.8666667, 1,
0.002026207, -1.04331, 3.654083, 0, 1, 0.8745098, 1,
0.004038679, 0.1268151, 0.6651748, 0, 1, 0.8784314, 1,
0.007784203, 2.33435, -0.8392053, 0, 1, 0.8862745, 1,
0.009626399, 0.2844371, 0.6190408, 0, 1, 0.8901961, 1,
0.02072591, 1.137454, 1.467048, 0, 1, 0.8980392, 1,
0.02074032, -1.181506, 3.000796, 0, 1, 0.9058824, 1,
0.02327359, -1.475436, 4.597999, 0, 1, 0.9098039, 1,
0.02486289, -0.03890209, 2.804099, 0, 1, 0.9176471, 1,
0.03257201, 0.01325267, 2.645755, 0, 1, 0.9215686, 1,
0.03317886, 0.8604853, 0.717432, 0, 1, 0.9294118, 1,
0.03486027, -0.1332946, 2.27285, 0, 1, 0.9333333, 1,
0.03516082, 0.1829546, 1.5047, 0, 1, 0.9411765, 1,
0.04035144, 0.5416723, 1.070631, 0, 1, 0.945098, 1,
0.04415463, 0.5605055, 0.3812754, 0, 1, 0.9529412, 1,
0.04667371, -1.370806, 2.730336, 0, 1, 0.9568627, 1,
0.05273994, -1.371276, 2.912164, 0, 1, 0.9647059, 1,
0.05285317, 0.9344519, 0.8112039, 0, 1, 0.9686275, 1,
0.05705285, 0.2335864, 1.620418, 0, 1, 0.9764706, 1,
0.05721536, -0.6233491, 2.84292, 0, 1, 0.9803922, 1,
0.06218923, -0.07111585, 2.63535, 0, 1, 0.9882353, 1,
0.06481086, 0.4835941, 0.4727799, 0, 1, 0.9921569, 1,
0.06628038, 0.8442983, -0.4605012, 0, 1, 1, 1,
0.07207789, -1.000889, 4.90995, 0, 0.9921569, 1, 1,
0.07378581, 1.332694, 0.2696868, 0, 0.9882353, 1, 1,
0.07419668, -0.1156808, 0.9878602, 0, 0.9803922, 1, 1,
0.07425502, 1.319328, 1.889788, 0, 0.9764706, 1, 1,
0.074588, -0.9643319, 2.500436, 0, 0.9686275, 1, 1,
0.07694479, -0.2568392, 1.106843, 0, 0.9647059, 1, 1,
0.08035467, -0.3909387, 1.625648, 0, 0.9568627, 1, 1,
0.08152165, -0.2499093, 0.3840541, 0, 0.9529412, 1, 1,
0.08315492, 1.046013, 1.213592, 0, 0.945098, 1, 1,
0.08523405, 0.6573406, -0.4122895, 0, 0.9411765, 1, 1,
0.08655883, 1.164078, -0.7527627, 0, 0.9333333, 1, 1,
0.08771393, 0.501287, 0.2710643, 0, 0.9294118, 1, 1,
0.09069852, -0.2892263, 1.777476, 0, 0.9215686, 1, 1,
0.09145287, 0.07662188, -1.273231, 0, 0.9176471, 1, 1,
0.09300845, 1.378947, 0.2409364, 0, 0.9098039, 1, 1,
0.0995601, -0.6982332, 4.327405, 0, 0.9058824, 1, 1,
0.09964318, 1.331635, -0.4339437, 0, 0.8980392, 1, 1,
0.1019336, -0.7855825, 3.241424, 0, 0.8901961, 1, 1,
0.1021944, -0.8023233, 4.754376, 0, 0.8862745, 1, 1,
0.1068018, -1.131364, 3.538523, 0, 0.8784314, 1, 1,
0.1088584, -1.319514, 3.500255, 0, 0.8745098, 1, 1,
0.1129448, -0.8067276, 2.677314, 0, 0.8666667, 1, 1,
0.113607, 0.1403071, 1.822439, 0, 0.8627451, 1, 1,
0.1138722, 1.201321, 1.776255, 0, 0.854902, 1, 1,
0.1152465, -0.9008739, 2.989125, 0, 0.8509804, 1, 1,
0.123944, -1.439302, 2.54898, 0, 0.8431373, 1, 1,
0.1267533, -1.092255, 2.76243, 0, 0.8392157, 1, 1,
0.1272055, 0.6297053, 0.8624206, 0, 0.8313726, 1, 1,
0.1342944, -0.924822, 2.099525, 0, 0.827451, 1, 1,
0.1354302, -0.494743, 3.249081, 0, 0.8196079, 1, 1,
0.138054, -0.2081745, 2.891426, 0, 0.8156863, 1, 1,
0.1472587, -0.6884606, 2.904215, 0, 0.8078431, 1, 1,
0.1488873, 0.8760188, 2.465817, 0, 0.8039216, 1, 1,
0.1499792, -0.1506785, 2.144405, 0, 0.7960784, 1, 1,
0.1503722, -0.07000483, 2.765546, 0, 0.7882353, 1, 1,
0.1577531, -0.2423405, 2.704002, 0, 0.7843137, 1, 1,
0.1579732, 0.2843661, 0.1902096, 0, 0.7764706, 1, 1,
0.1608146, 1.206707, -1.853813, 0, 0.772549, 1, 1,
0.1609979, 0.4209973, 1.0593, 0, 0.7647059, 1, 1,
0.1727396, 0.1707627, 1.761332, 0, 0.7607843, 1, 1,
0.1738096, -0.7975786, 4.215227, 0, 0.7529412, 1, 1,
0.1791054, 1.392496, 0.1516361, 0, 0.7490196, 1, 1,
0.1810191, -0.3466833, 1.854301, 0, 0.7411765, 1, 1,
0.1817062, 0.8036295, -0.8921322, 0, 0.7372549, 1, 1,
0.186165, 0.5897731, 1.13028, 0, 0.7294118, 1, 1,
0.1862617, 1.378261, -0.473023, 0, 0.7254902, 1, 1,
0.1874478, -0.4457092, 3.012172, 0, 0.7176471, 1, 1,
0.1875372, -1.695423, 4.174928, 0, 0.7137255, 1, 1,
0.1921282, 0.1305604, 0.7882602, 0, 0.7058824, 1, 1,
0.1941878, 0.4750066, 0.185855, 0, 0.6980392, 1, 1,
0.2004744, -0.792233, 3.764428, 0, 0.6941177, 1, 1,
0.2016597, -1.7207, 1.847933, 0, 0.6862745, 1, 1,
0.201835, -1.526495, 3.475074, 0, 0.682353, 1, 1,
0.2037175, 1.285767, 1.785305, 0, 0.6745098, 1, 1,
0.2042987, -0.2542366, 2.681527, 0, 0.6705883, 1, 1,
0.2085176, -1.01603, 2.24506, 0, 0.6627451, 1, 1,
0.2090102, -1.646632, 2.568659, 0, 0.6588235, 1, 1,
0.2161342, -0.2310203, 3.695316, 0, 0.6509804, 1, 1,
0.2161441, 1.347585, 2.738827, 0, 0.6470588, 1, 1,
0.2189507, -0.4713639, 3.661868, 0, 0.6392157, 1, 1,
0.2198762, 1.47055, 1.08958, 0, 0.6352941, 1, 1,
0.2259072, -0.6987072, 1.452373, 0, 0.627451, 1, 1,
0.2352951, 0.4418629, 2.458825, 0, 0.6235294, 1, 1,
0.235604, -0.08686116, 1.370099, 0, 0.6156863, 1, 1,
0.235708, -0.2234768, 3.077473, 0, 0.6117647, 1, 1,
0.2357428, 0.7269806, -0.2510411, 0, 0.6039216, 1, 1,
0.2402853, -0.1712095, 2.699437, 0, 0.5960785, 1, 1,
0.2414685, 0.08874983, 0.01276784, 0, 0.5921569, 1, 1,
0.2425445, -0.7219045, 3.266402, 0, 0.5843138, 1, 1,
0.2425789, -0.3281283, 3.812394, 0, 0.5803922, 1, 1,
0.2459975, -0.07296132, 0.2246738, 0, 0.572549, 1, 1,
0.2466958, -0.9553382, 2.606614, 0, 0.5686275, 1, 1,
0.2477489, -2.361605, 1.336738, 0, 0.5607843, 1, 1,
0.2486129, 0.1000036, 1.024379, 0, 0.5568628, 1, 1,
0.2523943, 0.2770439, 1.870195, 0, 0.5490196, 1, 1,
0.253807, 0.5263636, -0.7437395, 0, 0.5450981, 1, 1,
0.2549503, 1.590849, 1.057889, 0, 0.5372549, 1, 1,
0.257053, -2.280771, 2.655504, 0, 0.5333334, 1, 1,
0.2594672, 1.176722, -0.2154068, 0, 0.5254902, 1, 1,
0.2599954, -1.055435, 4.302154, 0, 0.5215687, 1, 1,
0.261517, -1.462061, 2.282226, 0, 0.5137255, 1, 1,
0.2618238, -1.699456, 4.427633, 0, 0.509804, 1, 1,
0.2625794, -0.5941081, 1.419123, 0, 0.5019608, 1, 1,
0.2712537, -2.162223, 3.086822, 0, 0.4941176, 1, 1,
0.2717171, -1.67873, 2.644043, 0, 0.4901961, 1, 1,
0.2764181, 1.429637, -0.7751768, 0, 0.4823529, 1, 1,
0.2778699, 0.8938305, -0.4624109, 0, 0.4784314, 1, 1,
0.2786503, 1.848781, 0.430464, 0, 0.4705882, 1, 1,
0.2797492, -0.2452385, 3.054076, 0, 0.4666667, 1, 1,
0.2826633, 0.9042834, -0.1281307, 0, 0.4588235, 1, 1,
0.2847002, 1.001183, 0.2111979, 0, 0.454902, 1, 1,
0.2849563, -0.5916584, 2.655112, 0, 0.4470588, 1, 1,
0.2869999, -1.049807, 2.541898, 0, 0.4431373, 1, 1,
0.2905802, -0.3445386, 2.335416, 0, 0.4352941, 1, 1,
0.2973327, 1.060349, 0.5949739, 0, 0.4313726, 1, 1,
0.2999046, -0.05801427, 1.614637, 0, 0.4235294, 1, 1,
0.3066431, 0.4698971, 1.163035, 0, 0.4196078, 1, 1,
0.3095596, -0.4217632, 2.311562, 0, 0.4117647, 1, 1,
0.3149659, -0.6079391, 2.226695, 0, 0.4078431, 1, 1,
0.3169122, 0.1119958, -0.8272337, 0, 0.4, 1, 1,
0.3219718, -0.1799422, 1.031288, 0, 0.3921569, 1, 1,
0.3249297, 0.691078, 1.515961, 0, 0.3882353, 1, 1,
0.3265314, -1.531033, 5.941312, 0, 0.3803922, 1, 1,
0.3266118, -0.0787872, 2.826601, 0, 0.3764706, 1, 1,
0.3266529, 0.6342762, 1.014707, 0, 0.3686275, 1, 1,
0.3277681, -0.4121343, 2.553537, 0, 0.3647059, 1, 1,
0.3330983, -0.8607059, 2.646791, 0, 0.3568628, 1, 1,
0.3341273, -0.3642404, 3.359876, 0, 0.3529412, 1, 1,
0.3362669, 0.4959961, 1.370754, 0, 0.345098, 1, 1,
0.3392627, -0.3735823, 2.568407, 0, 0.3411765, 1, 1,
0.3411987, -0.3579476, 3.323336, 0, 0.3333333, 1, 1,
0.3442274, -0.3763212, 2.958805, 0, 0.3294118, 1, 1,
0.3443066, 0.8067924, 0.01106184, 0, 0.3215686, 1, 1,
0.3464472, 0.8573737, 1.248519, 0, 0.3176471, 1, 1,
0.3478848, 0.5351658, 0.9238801, 0, 0.3098039, 1, 1,
0.3506678, 0.8098596, 0.08739047, 0, 0.3058824, 1, 1,
0.3514102, -0.6462542, 2.728447, 0, 0.2980392, 1, 1,
0.3529296, -0.422312, 2.416123, 0, 0.2901961, 1, 1,
0.354959, -0.681283, 0.8168532, 0, 0.2862745, 1, 1,
0.3562063, 1.248553, 0.842672, 0, 0.2784314, 1, 1,
0.3605235, -0.2577894, 0.5024698, 0, 0.2745098, 1, 1,
0.3613218, -1.425027, 3.171644, 0, 0.2666667, 1, 1,
0.3619761, 0.3264106, 2.71867, 0, 0.2627451, 1, 1,
0.3622487, -0.7991028, 4.251028, 0, 0.254902, 1, 1,
0.3635239, 0.4688153, 0.8482305, 0, 0.2509804, 1, 1,
0.3661638, -0.5387616, 1.803105, 0, 0.2431373, 1, 1,
0.3664693, -0.703154, 3.525278, 0, 0.2392157, 1, 1,
0.3714437, 1.199133, -1.061431, 0, 0.2313726, 1, 1,
0.3735942, -0.4754148, 1.649857, 0, 0.227451, 1, 1,
0.3757678, 1.035186, -2.332939, 0, 0.2196078, 1, 1,
0.3757889, -0.3516071, 0.7395539, 0, 0.2156863, 1, 1,
0.3768953, -0.4953012, 2.933113, 0, 0.2078431, 1, 1,
0.3802803, -0.1532242, 2.828284, 0, 0.2039216, 1, 1,
0.388132, -1.16104, 3.980191, 0, 0.1960784, 1, 1,
0.3897966, 0.3464924, 0.2590153, 0, 0.1882353, 1, 1,
0.3931179, 0.6517344, 0.0247054, 0, 0.1843137, 1, 1,
0.3937955, -0.772962, 3.905164, 0, 0.1764706, 1, 1,
0.394933, 0.03045798, -0.2612466, 0, 0.172549, 1, 1,
0.3981923, -1.513044, 3.408767, 0, 0.1647059, 1, 1,
0.4084646, 2.003862, 0.7593559, 0, 0.1607843, 1, 1,
0.4096605, 0.8018543, 1.726579, 0, 0.1529412, 1, 1,
0.4119827, 0.5381559, -2.346363, 0, 0.1490196, 1, 1,
0.4122085, 2.434999, -0.6467368, 0, 0.1411765, 1, 1,
0.4140691, -0.48862, 1.925503, 0, 0.1372549, 1, 1,
0.4165989, -0.4018982, 4.678575, 0, 0.1294118, 1, 1,
0.4196585, 0.939461, 0.3865039, 0, 0.1254902, 1, 1,
0.4257734, 0.7353361, -0.4407668, 0, 0.1176471, 1, 1,
0.4303598, 1.737109, 0.9925488, 0, 0.1137255, 1, 1,
0.4365179, -0.6683508, 1.875575, 0, 0.1058824, 1, 1,
0.4374824, 0.2931047, 1.014185, 0, 0.09803922, 1, 1,
0.4390062, -2.55654, 2.907174, 0, 0.09411765, 1, 1,
0.4398267, 0.6539357, 0.6849552, 0, 0.08627451, 1, 1,
0.4410214, 0.658249, 1.431589, 0, 0.08235294, 1, 1,
0.442588, 0.5849682, 0.0837004, 0, 0.07450981, 1, 1,
0.443424, 0.9878002, 0.2213177, 0, 0.07058824, 1, 1,
0.4502681, 0.3640176, -0.1332003, 0, 0.0627451, 1, 1,
0.4506786, 0.2861308, 0.9165331, 0, 0.05882353, 1, 1,
0.4532254, -0.2583902, 2.613129, 0, 0.05098039, 1, 1,
0.4557801, 2.067693, 0.3095863, 0, 0.04705882, 1, 1,
0.4585627, -0.4881725, 1.096963, 0, 0.03921569, 1, 1,
0.4615513, 1.029199, -0.05738632, 0, 0.03529412, 1, 1,
0.4615553, 0.8393561, 1.324437, 0, 0.02745098, 1, 1,
0.4631878, -1.176137, 2.459621, 0, 0.02352941, 1, 1,
0.4653855, 0.7319541, 1.197506, 0, 0.01568628, 1, 1,
0.4676664, 0.7342969, 1.711863, 0, 0.01176471, 1, 1,
0.4677969, 0.137249, 1.402865, 0, 0.003921569, 1, 1,
0.4695101, -1.185924, 2.384582, 0.003921569, 0, 1, 1,
0.4725859, 0.2986068, 1.140174, 0.007843138, 0, 1, 1,
0.4802835, -0.5918934, 3.796784, 0.01568628, 0, 1, 1,
0.4859162, -0.7630159, 2.180698, 0.01960784, 0, 1, 1,
0.4905569, -1.218857, 2.191828, 0.02745098, 0, 1, 1,
0.498873, 1.326292, 0.4095974, 0.03137255, 0, 1, 1,
0.5015023, -0.8443793, 3.533062, 0.03921569, 0, 1, 1,
0.5031049, 1.485374, 0.9632458, 0.04313726, 0, 1, 1,
0.5037515, -1.516816, 5.576304, 0.05098039, 0, 1, 1,
0.5082462, 0.4304626, 1.660828, 0.05490196, 0, 1, 1,
0.5096603, -0.5579494, 0.9788018, 0.0627451, 0, 1, 1,
0.5104271, 1.268455, -0.8564433, 0.06666667, 0, 1, 1,
0.5118231, 0.5368432, -0.08476551, 0.07450981, 0, 1, 1,
0.5125356, 0.9560527, 0.734499, 0.07843138, 0, 1, 1,
0.5145533, -0.256728, 2.115967, 0.08627451, 0, 1, 1,
0.5182416, -0.2198954, 2.600857, 0.09019608, 0, 1, 1,
0.5200405, 0.69081, -0.9677318, 0.09803922, 0, 1, 1,
0.5207064, 0.7728179, -0.303975, 0.1058824, 0, 1, 1,
0.5295262, 1.511158, -0.1265459, 0.1098039, 0, 1, 1,
0.5333852, 0.5682412, 1.970547, 0.1176471, 0, 1, 1,
0.5379953, 1.677151, -0.1968837, 0.1215686, 0, 1, 1,
0.5401599, 1.272535, 3.589798, 0.1294118, 0, 1, 1,
0.5416418, 1.098377, -0.004604543, 0.1333333, 0, 1, 1,
0.5449178, -1.089303, 2.252815, 0.1411765, 0, 1, 1,
0.5450628, 0.1317119, 1.184146, 0.145098, 0, 1, 1,
0.5523716, -1.758953, 3.348811, 0.1529412, 0, 1, 1,
0.5525633, -1.73799, 4.669329, 0.1568628, 0, 1, 1,
0.5548375, -0.3901672, 1.184419, 0.1647059, 0, 1, 1,
0.5572342, 1.791515, 0.5431511, 0.1686275, 0, 1, 1,
0.5575494, -0.0907913, 2.484727, 0.1764706, 0, 1, 1,
0.558513, -2.9898, 3.085173, 0.1803922, 0, 1, 1,
0.5623602, 0.4785338, 0.2211276, 0.1882353, 0, 1, 1,
0.5643295, -1.227103, 3.143324, 0.1921569, 0, 1, 1,
0.5680506, 0.271406, 0.8632454, 0.2, 0, 1, 1,
0.5688748, 1.976212, 0.1550439, 0.2078431, 0, 1, 1,
0.5777703, 0.766008, 1.8541, 0.2117647, 0, 1, 1,
0.579347, 0.635816, 0.9659715, 0.2196078, 0, 1, 1,
0.5873429, 1.34815, -2.49761, 0.2235294, 0, 1, 1,
0.5874022, 2.851373, 0.7922784, 0.2313726, 0, 1, 1,
0.5914545, 0.0490433, -0.02665635, 0.2352941, 0, 1, 1,
0.5918738, -1.790688, 1.315264, 0.2431373, 0, 1, 1,
0.5961977, 0.7343463, 0.02945995, 0.2470588, 0, 1, 1,
0.5980995, -0.2269061, 1.564312, 0.254902, 0, 1, 1,
0.5988901, -0.8372371, 1.873056, 0.2588235, 0, 1, 1,
0.6077852, 0.9065766, 1.116235, 0.2666667, 0, 1, 1,
0.6134744, -1.527638, 2.241681, 0.2705882, 0, 1, 1,
0.6237417, -1.995154, 3.941163, 0.2784314, 0, 1, 1,
0.629585, 0.0556639, 0.4264292, 0.282353, 0, 1, 1,
0.6300292, -0.1529322, 0.5778005, 0.2901961, 0, 1, 1,
0.6309155, -1.013883, 3.105549, 0.2941177, 0, 1, 1,
0.6309449, 1.143563, -0.008016312, 0.3019608, 0, 1, 1,
0.6454655, -1.581301, 2.791999, 0.3098039, 0, 1, 1,
0.6469314, 1.541603, 0.6788086, 0.3137255, 0, 1, 1,
0.648561, -1.013438, 2.264148, 0.3215686, 0, 1, 1,
0.6514775, -0.4306314, 1.792149, 0.3254902, 0, 1, 1,
0.6531933, 0.04930209, 2.656055, 0.3333333, 0, 1, 1,
0.6546292, -0.8416949, 3.827554, 0.3372549, 0, 1, 1,
0.6636186, 0.7114663, 1.942818, 0.345098, 0, 1, 1,
0.6636695, 0.7929609, 0.6440663, 0.3490196, 0, 1, 1,
0.6641141, -0.8927985, 2.723645, 0.3568628, 0, 1, 1,
0.6643073, 0.004607552, 0.289316, 0.3607843, 0, 1, 1,
0.6647602, -0.4292192, 2.322179, 0.3686275, 0, 1, 1,
0.6681605, 0.05745229, 1.388211, 0.372549, 0, 1, 1,
0.6701712, -1.115902, 2.118833, 0.3803922, 0, 1, 1,
0.6707555, -0.1755828, 0.2969302, 0.3843137, 0, 1, 1,
0.6722305, -2.087454, 2.25216, 0.3921569, 0, 1, 1,
0.6726463, 0.624667, 0.1446036, 0.3960784, 0, 1, 1,
0.6732806, 0.7227479, 0.8152509, 0.4039216, 0, 1, 1,
0.6738566, 1.21327, -1.012589, 0.4117647, 0, 1, 1,
0.676263, 0.5530502, 1.010482, 0.4156863, 0, 1, 1,
0.6779274, 0.9120207, 0.9232398, 0.4235294, 0, 1, 1,
0.6799695, -0.09409403, 3.717015, 0.427451, 0, 1, 1,
0.682447, 1.177406, 1.943929, 0.4352941, 0, 1, 1,
0.6850768, -0.4014153, 2.20531, 0.4392157, 0, 1, 1,
0.6886018, 0.07516656, 1.098857, 0.4470588, 0, 1, 1,
0.6924943, 1.479837, 0.7678685, 0.4509804, 0, 1, 1,
0.6962528, -1.174781, 3.751501, 0.4588235, 0, 1, 1,
0.6993749, -0.4563874, 3.530731, 0.4627451, 0, 1, 1,
0.6998641, -0.9459122, 1.739484, 0.4705882, 0, 1, 1,
0.7003137, 1.972351, 1.061965, 0.4745098, 0, 1, 1,
0.7017096, -0.4529904, 1.320187, 0.4823529, 0, 1, 1,
0.7030985, -0.1863214, 2.555981, 0.4862745, 0, 1, 1,
0.703351, 0.1332191, 1.686163, 0.4941176, 0, 1, 1,
0.7046437, -0.3402497, 2.179924, 0.5019608, 0, 1, 1,
0.7104688, 0.4458462, 0.8692006, 0.5058824, 0, 1, 1,
0.7110456, 0.1469249, 1.083884, 0.5137255, 0, 1, 1,
0.7152262, -1.864617, 2.991412, 0.5176471, 0, 1, 1,
0.7168333, -0.5922612, 1.80492, 0.5254902, 0, 1, 1,
0.7186768, -0.09726055, 2.795025, 0.5294118, 0, 1, 1,
0.7207876, -0.679437, 2.902665, 0.5372549, 0, 1, 1,
0.7240233, -1.313109, 3.487462, 0.5411765, 0, 1, 1,
0.7291805, -1.792039, 0.8190739, 0.5490196, 0, 1, 1,
0.7347506, -2.517572, 2.909166, 0.5529412, 0, 1, 1,
0.7380916, 0.05630551, 2.890263, 0.5607843, 0, 1, 1,
0.7385808, -2.074097, 2.390671, 0.5647059, 0, 1, 1,
0.7402737, -0.9510321, 2.295749, 0.572549, 0, 1, 1,
0.7535177, -0.5289739, 1.161975, 0.5764706, 0, 1, 1,
0.759419, -0.08772068, 1.407714, 0.5843138, 0, 1, 1,
0.7601271, 0.3645308, -0.3179914, 0.5882353, 0, 1, 1,
0.780603, 0.6474416, 0.2228846, 0.5960785, 0, 1, 1,
0.7834697, 0.9769154, -1.295934, 0.6039216, 0, 1, 1,
0.7851731, -0.5932655, 3.662917, 0.6078432, 0, 1, 1,
0.7855043, 0.8112139, 0.2935139, 0.6156863, 0, 1, 1,
0.7858902, 0.4346063, -0.007705551, 0.6196079, 0, 1, 1,
0.7904195, 1.618007, 0.8110777, 0.627451, 0, 1, 1,
0.8061116, 1.114133, 1.426253, 0.6313726, 0, 1, 1,
0.8077242, 1.831633, 0.8278447, 0.6392157, 0, 1, 1,
0.8116509, 0.007687084, 2.405886, 0.6431373, 0, 1, 1,
0.8124818, -0.7717728, 2.263686, 0.6509804, 0, 1, 1,
0.8171751, 0.5883194, 0.7883491, 0.654902, 0, 1, 1,
0.8173195, 0.8368511, -0.4241964, 0.6627451, 0, 1, 1,
0.8272073, 0.1686586, 1.485112, 0.6666667, 0, 1, 1,
0.8284929, 3.28255, 0.9783311, 0.6745098, 0, 1, 1,
0.8299024, -0.7695819, 4.887473, 0.6784314, 0, 1, 1,
0.8314211, -0.07028512, 0.1106008, 0.6862745, 0, 1, 1,
0.8486406, -0.8990701, 3.272646, 0.6901961, 0, 1, 1,
0.850112, -0.2939639, 0.8668726, 0.6980392, 0, 1, 1,
0.8502497, 0.298145, 0.9793126, 0.7058824, 0, 1, 1,
0.8538911, -0.5535344, 1.899497, 0.7098039, 0, 1, 1,
0.8543414, -0.05403145, 2.788198, 0.7176471, 0, 1, 1,
0.8562948, 0.1064357, 2.247323, 0.7215686, 0, 1, 1,
0.8582218, 0.737532, 1.839141, 0.7294118, 0, 1, 1,
0.863717, 2.02871, 0.5262064, 0.7333333, 0, 1, 1,
0.8653412, 1.788944, -0.5765305, 0.7411765, 0, 1, 1,
0.8712673, -0.2300452, 2.976281, 0.7450981, 0, 1, 1,
0.8745613, 1.262499, 0.2206461, 0.7529412, 0, 1, 1,
0.8747321, -0.4091817, 2.032074, 0.7568628, 0, 1, 1,
0.8782371, -0.3923564, 0.711848, 0.7647059, 0, 1, 1,
0.8834569, -0.6348884, 1.191826, 0.7686275, 0, 1, 1,
0.8842141, 0.2860737, 1.738273, 0.7764706, 0, 1, 1,
0.8847433, -3.043025, 3.269569, 0.7803922, 0, 1, 1,
0.8971534, -0.7231344, 3.27161, 0.7882353, 0, 1, 1,
0.9021035, -1.254611, 3.093575, 0.7921569, 0, 1, 1,
0.902715, -0.2885944, 1.832262, 0.8, 0, 1, 1,
0.9052944, -1.282173, 3.214674, 0.8078431, 0, 1, 1,
0.9077314, 0.6149265, 2.830756, 0.8117647, 0, 1, 1,
0.9078874, 2.110265, 0.5369901, 0.8196079, 0, 1, 1,
0.9087607, -1.653453, 3.241684, 0.8235294, 0, 1, 1,
0.9134887, -1.730804, 3.948825, 0.8313726, 0, 1, 1,
0.9158283, 0.007391702, 0.8005909, 0.8352941, 0, 1, 1,
0.9248043, -0.1657177, 1.339907, 0.8431373, 0, 1, 1,
0.9289674, -1.513705, 3.605265, 0.8470588, 0, 1, 1,
0.9315706, -1.013102, 2.53497, 0.854902, 0, 1, 1,
0.9346449, 1.112801, 0.1938286, 0.8588235, 0, 1, 1,
0.9349238, -0.4368138, 2.849268, 0.8666667, 0, 1, 1,
0.9433149, -0.8530372, 4.185759, 0.8705882, 0, 1, 1,
0.9498484, 2.026308, 0.774674, 0.8784314, 0, 1, 1,
0.9605359, -0.4422784, 1.427583, 0.8823529, 0, 1, 1,
0.9610534, 2.247674, 0.0413222, 0.8901961, 0, 1, 1,
0.9612879, 0.07281116, 1.650086, 0.8941177, 0, 1, 1,
0.9690465, -0.7447413, 2.410733, 0.9019608, 0, 1, 1,
0.9738125, -0.4237605, 0.9962904, 0.9098039, 0, 1, 1,
0.9824775, -1.101909, 2.093792, 0.9137255, 0, 1, 1,
1.002831, 0.1072882, 2.629356, 0.9215686, 0, 1, 1,
1.003076, -0.8619125, 3.823267, 0.9254902, 0, 1, 1,
1.005802, -1.986238, 2.767023, 0.9333333, 0, 1, 1,
1.006984, -1.413933, 2.575569, 0.9372549, 0, 1, 1,
1.008329, -0.2345424, 0.6885262, 0.945098, 0, 1, 1,
1.013927, 0.02473226, 3.003395, 0.9490196, 0, 1, 1,
1.022343, -0.9519897, 2.702483, 0.9568627, 0, 1, 1,
1.024361, -0.9735505, 2.423774, 0.9607843, 0, 1, 1,
1.026744, 1.149361, 1.835848, 0.9686275, 0, 1, 1,
1.02802, 0.8269203, 0.2626833, 0.972549, 0, 1, 1,
1.031493, -0.3976179, 2.330729, 0.9803922, 0, 1, 1,
1.032138, -0.1421434, 2.319824, 0.9843137, 0, 1, 1,
1.038335, 1.097151, 1.938961, 0.9921569, 0, 1, 1,
1.046934, 0.1740835, 0.1666263, 0.9960784, 0, 1, 1,
1.057861, -0.2014829, 2.004546, 1, 0, 0.9960784, 1,
1.058396, 0.965224, 1.463514, 1, 0, 0.9882353, 1,
1.059466, -1.841909, 3.392734, 1, 0, 0.9843137, 1,
1.06065, -0.01825205, 2.505403, 1, 0, 0.9764706, 1,
1.064288, 0.4595052, 2.375881, 1, 0, 0.972549, 1,
1.064523, 0.5702222, -0.6063795, 1, 0, 0.9647059, 1,
1.068639, -2.962147, 4.254822, 1, 0, 0.9607843, 1,
1.069313, 0.8313752, 1.033332, 1, 0, 0.9529412, 1,
1.069961, 1.624627, -0.5802284, 1, 0, 0.9490196, 1,
1.074924, -1.095083, 2.936113, 1, 0, 0.9411765, 1,
1.075752, 0.6865497, 0.9416516, 1, 0, 0.9372549, 1,
1.076722, -0.3008019, 2.992849, 1, 0, 0.9294118, 1,
1.079871, 0.616661, 1.121572, 1, 0, 0.9254902, 1,
1.081001, 0.1270018, 2.258418, 1, 0, 0.9176471, 1,
1.08661, 1.493389, 2.138502, 1, 0, 0.9137255, 1,
1.095708, 1.071693, 0.4187129, 1, 0, 0.9058824, 1,
1.099873, -0.9957967, 1.14265, 1, 0, 0.9019608, 1,
1.109929, -1.571825, 3.59259, 1, 0, 0.8941177, 1,
1.123717, 1.761317, 0.524342, 1, 0, 0.8862745, 1,
1.131389, -1.45334, 1.456228, 1, 0, 0.8823529, 1,
1.137731, 1.057372, 0.515022, 1, 0, 0.8745098, 1,
1.139906, 1.337035, 1.341291, 1, 0, 0.8705882, 1,
1.142365, -2.065564, 2.039755, 1, 0, 0.8627451, 1,
1.15465, -0.6332381, 1.488736, 1, 0, 0.8588235, 1,
1.167583, -0.03206589, 2.416857, 1, 0, 0.8509804, 1,
1.173707, 1.99147, -0.8667492, 1, 0, 0.8470588, 1,
1.174197, 1.782212, 1.048937, 1, 0, 0.8392157, 1,
1.175164, -0.1990006, 3.788717, 1, 0, 0.8352941, 1,
1.180936, -0.09815497, 2.254989, 1, 0, 0.827451, 1,
1.184114, 1.675563, 0.917134, 1, 0, 0.8235294, 1,
1.188114, 0.4482816, 1.064269, 1, 0, 0.8156863, 1,
1.200495, -1.027699, 1.506837, 1, 0, 0.8117647, 1,
1.208215, 0.350337, 3.638672, 1, 0, 0.8039216, 1,
1.213656, -0.4095379, 1.769668, 1, 0, 0.7960784, 1,
1.219925, 1.219965, 2.381885, 1, 0, 0.7921569, 1,
1.225507, -0.009885957, 2.218786, 1, 0, 0.7843137, 1,
1.22633, -0.2010777, 1.047593, 1, 0, 0.7803922, 1,
1.229361, 0.3437736, 1.241732, 1, 0, 0.772549, 1,
1.232013, -0.1291068, 1.224915, 1, 0, 0.7686275, 1,
1.236158, 1.13721, -0.1718797, 1, 0, 0.7607843, 1,
1.237194, -0.851927, 2.548656, 1, 0, 0.7568628, 1,
1.241033, -0.5119734, 2.712075, 1, 0, 0.7490196, 1,
1.241574, 2.224022, 0.352695, 1, 0, 0.7450981, 1,
1.24301, -0.6739992, 2.691782, 1, 0, 0.7372549, 1,
1.246648, 0.2424272, -0.39069, 1, 0, 0.7333333, 1,
1.248447, -1.240901, 1.263673, 1, 0, 0.7254902, 1,
1.251115, -0.2062024, 2.247919, 1, 0, 0.7215686, 1,
1.2537, 0.7081233, 0.5677234, 1, 0, 0.7137255, 1,
1.259794, -0.6370308, 1.984997, 1, 0, 0.7098039, 1,
1.266318, 0.839811, 0.9469358, 1, 0, 0.7019608, 1,
1.272777, 0.350233, 2.019565, 1, 0, 0.6941177, 1,
1.275574, -0.4775013, 2.317688, 1, 0, 0.6901961, 1,
1.275824, -1.052795, 2.755606, 1, 0, 0.682353, 1,
1.288029, -0.3934295, 1.50455, 1, 0, 0.6784314, 1,
1.294995, -1.24445, 0.8371738, 1, 0, 0.6705883, 1,
1.30422, -2.962318, 2.432621, 1, 0, 0.6666667, 1,
1.32385, -2.312017, 1.605478, 1, 0, 0.6588235, 1,
1.327348, 1.10122, 0.8516523, 1, 0, 0.654902, 1,
1.333063, 0.7293116, 0.1278014, 1, 0, 0.6470588, 1,
1.341985, -1.028179, 2.948448, 1, 0, 0.6431373, 1,
1.349202, 0.3851997, 1.471974, 1, 0, 0.6352941, 1,
1.349915, -1.141156, 1.931312, 1, 0, 0.6313726, 1,
1.350311, -1.886609, 1.031827, 1, 0, 0.6235294, 1,
1.35122, -0.3352873, 2.589059, 1, 0, 0.6196079, 1,
1.361039, 0.2920062, 2.390588, 1, 0, 0.6117647, 1,
1.37232, -0.8329378, 2.873263, 1, 0, 0.6078432, 1,
1.373241, -1.085576, 1.503656, 1, 0, 0.6, 1,
1.378715, 0.5145353, 2.016045, 1, 0, 0.5921569, 1,
1.380927, 0.1356035, 1.277429, 1, 0, 0.5882353, 1,
1.385043, -0.2203179, 2.606751, 1, 0, 0.5803922, 1,
1.389206, 0.1567501, 1.533862, 1, 0, 0.5764706, 1,
1.390752, 0.659227, 0.5349858, 1, 0, 0.5686275, 1,
1.396031, -0.03107801, 2.296008, 1, 0, 0.5647059, 1,
1.421206, 1.267335, 0.170639, 1, 0, 0.5568628, 1,
1.431357, 0.1788404, 2.420735, 1, 0, 0.5529412, 1,
1.442272, -1.279978, 2.790628, 1, 0, 0.5450981, 1,
1.453734, 0.9109992, 1.957288, 1, 0, 0.5411765, 1,
1.469951, 0.9140493, 1.532926, 1, 0, 0.5333334, 1,
1.475656, -0.3371845, 1.925048, 1, 0, 0.5294118, 1,
1.481112, 1.867851, 0.3406675, 1, 0, 0.5215687, 1,
1.482164, 0.3155749, 2.092995, 1, 0, 0.5176471, 1,
1.490895, 0.3562626, 2.027463, 1, 0, 0.509804, 1,
1.493001, -1.608698, 2.589678, 1, 0, 0.5058824, 1,
1.495411, 1.848858, 0.04695144, 1, 0, 0.4980392, 1,
1.502461, 0.7241485, -0.2102095, 1, 0, 0.4901961, 1,
1.50387, -0.1926457, 2.971915, 1, 0, 0.4862745, 1,
1.524705, 1.503033, 0.230346, 1, 0, 0.4784314, 1,
1.526589, 1.06731, 0.6846308, 1, 0, 0.4745098, 1,
1.530506, -0.1479427, 1.699465, 1, 0, 0.4666667, 1,
1.532508, 0.2863526, 1.24283, 1, 0, 0.4627451, 1,
1.538362, 2.107341, 1.210395, 1, 0, 0.454902, 1,
1.541885, -0.1539369, 0.04812909, 1, 0, 0.4509804, 1,
1.543062, 0.1166595, 1.440238, 1, 0, 0.4431373, 1,
1.544638, 0.6091601, 1.072844, 1, 0, 0.4392157, 1,
1.545886, -1.163225, 1.107082, 1, 0, 0.4313726, 1,
1.553309, -0.6337573, 2.753451, 1, 0, 0.427451, 1,
1.555917, -0.2625647, 0.01479171, 1, 0, 0.4196078, 1,
1.556711, -1.138947, 2.882386, 1, 0, 0.4156863, 1,
1.562522, 0.6995021, 2.482384, 1, 0, 0.4078431, 1,
1.584309, 0.5385651, 1.413385, 1, 0, 0.4039216, 1,
1.593561, 0.07195473, 1.618337, 1, 0, 0.3960784, 1,
1.60353, -0.5198937, 0.8790345, 1, 0, 0.3882353, 1,
1.607859, 0.9563562, 0.6197863, 1, 0, 0.3843137, 1,
1.61569, -0.7660061, 0.6585429, 1, 0, 0.3764706, 1,
1.631662, 0.7115645, 0.609547, 1, 0, 0.372549, 1,
1.634567, 1.087849, -0.7794967, 1, 0, 0.3647059, 1,
1.638961, -1.202017, 2.543574, 1, 0, 0.3607843, 1,
1.646725, -1.084451, 2.162609, 1, 0, 0.3529412, 1,
1.651698, 0.8514717, 1.776371, 1, 0, 0.3490196, 1,
1.665895, -0.1206601, 0.8373039, 1, 0, 0.3411765, 1,
1.666099, -0.3066351, 1.143127, 1, 0, 0.3372549, 1,
1.667685, -1.220443, 1.606108, 1, 0, 0.3294118, 1,
1.69397, -0.1322247, 1.075922, 1, 0, 0.3254902, 1,
1.694976, 0.6430138, 1.391474, 1, 0, 0.3176471, 1,
1.700865, -1.632479, 3.218029, 1, 0, 0.3137255, 1,
1.703033, 0.9881862, 1.270433, 1, 0, 0.3058824, 1,
1.721401, 0.1400251, 1.481448, 1, 0, 0.2980392, 1,
1.723096, 0.7872127, 2.61519, 1, 0, 0.2941177, 1,
1.724445, -0.1692638, 5.334856, 1, 0, 0.2862745, 1,
1.73349, 0.04562664, 3.144946, 1, 0, 0.282353, 1,
1.750074, 1.334505, 1.641275, 1, 0, 0.2745098, 1,
1.751611, 1.001362, 0.436573, 1, 0, 0.2705882, 1,
1.761652, -0.3428327, 1.939425, 1, 0, 0.2627451, 1,
1.764126, -1.503185, 1.452604, 1, 0, 0.2588235, 1,
1.793712, -1.159232, 2.470172, 1, 0, 0.2509804, 1,
1.814336, 1.641812, 1.405137, 1, 0, 0.2470588, 1,
1.817091, 0.2823393, 1.317762, 1, 0, 0.2392157, 1,
1.840237, -0.2160698, 2.871277, 1, 0, 0.2352941, 1,
1.906224, -0.5699418, 1.653538, 1, 0, 0.227451, 1,
1.915148, -0.6379431, 1.377438, 1, 0, 0.2235294, 1,
1.936613, 1.986383, -0.1160157, 1, 0, 0.2156863, 1,
1.945909, -0.008408136, 1.640601, 1, 0, 0.2117647, 1,
1.95119, -0.3742246, 2.32456, 1, 0, 0.2039216, 1,
1.956749, 0.09216241, 1.735511, 1, 0, 0.1960784, 1,
1.963874, 1.561169, 0.9891318, 1, 0, 0.1921569, 1,
1.971778, 0.05315454, 1.617765, 1, 0, 0.1843137, 1,
1.988239, -2.985506, 3.193656, 1, 0, 0.1803922, 1,
2.03421, -0.4482374, 0.3262388, 1, 0, 0.172549, 1,
2.047583, -2.321193, 3.745109, 1, 0, 0.1686275, 1,
2.059151, 0.287625, 1.589778, 1, 0, 0.1607843, 1,
2.067258, 0.6915749, 2.915137, 1, 0, 0.1568628, 1,
2.074509, -0.07165442, 2.651264, 1, 0, 0.1490196, 1,
2.10985, 0.8803909, -0.1605542, 1, 0, 0.145098, 1,
2.1294, 1.742477, 1.837954, 1, 0, 0.1372549, 1,
2.163518, 0.836631, 2.830801, 1, 0, 0.1333333, 1,
2.19589, -2.763726, 0.2190871, 1, 0, 0.1254902, 1,
2.251692, 0.9088134, 1.864277, 1, 0, 0.1215686, 1,
2.263674, -0.3223214, 0.8585724, 1, 0, 0.1137255, 1,
2.268784, 1.319537, 0.6306612, 1, 0, 0.1098039, 1,
2.296501, 0.8768964, 1.40605, 1, 0, 0.1019608, 1,
2.311351, -1.231819, 2.599843, 1, 0, 0.09411765, 1,
2.326642, 0.5913476, 0.495784, 1, 0, 0.09019608, 1,
2.349208, 0.5191069, 1.982108, 1, 0, 0.08235294, 1,
2.392203, -0.7720817, 2.620321, 1, 0, 0.07843138, 1,
2.436338, -0.630381, 1.583739, 1, 0, 0.07058824, 1,
2.446013, -0.1168064, 3.960654, 1, 0, 0.06666667, 1,
2.458843, -0.2513862, 4.343797, 1, 0, 0.05882353, 1,
2.468306, -0.9905038, -0.04128088, 1, 0, 0.05490196, 1,
2.686218, -0.8660867, 0.4561925, 1, 0, 0.04705882, 1,
2.699984, 0.6980969, 2.27071, 1, 0, 0.04313726, 1,
2.700388, -0.6365382, 2.514115, 1, 0, 0.03529412, 1,
2.747345, 0.5320693, 1.749658, 1, 0, 0.03137255, 1,
2.779728, -2.309514, 1.155328, 1, 0, 0.02352941, 1,
2.824205, 2.308964, 2.949427, 1, 0, 0.01960784, 1,
3.140505, -0.4922548, 2.82333, 1, 0, 0.01176471, 1,
3.43675, -0.3902369, 2.269955, 1, 0, 0.007843138, 1
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
0.05998588, -4.132213, -6.654152, 0, -0.5, 0.5, 0.5,
0.05998588, -4.132213, -6.654152, 1, -0.5, 0.5, 0.5,
0.05998588, -4.132213, -6.654152, 1, 1.5, 0.5, 0.5,
0.05998588, -4.132213, -6.654152, 0, 1.5, 0.5, 0.5
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
-4.461501, 0.1699183, -6.654152, 0, -0.5, 0.5, 0.5,
-4.461501, 0.1699183, -6.654152, 1, -0.5, 0.5, 0.5,
-4.461501, 0.1699183, -6.654152, 1, 1.5, 0.5, 0.5,
-4.461501, 0.1699183, -6.654152, 0, 1.5, 0.5, 0.5
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
-4.461501, -4.132213, 0.556334, 0, -0.5, 0.5, 0.5,
-4.461501, -4.132213, 0.556334, 1, -0.5, 0.5, 0.5,
-4.461501, -4.132213, 0.556334, 1, 1.5, 0.5, 0.5,
-4.461501, -4.132213, 0.556334, 0, 1.5, 0.5, 0.5
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
-3, -3.139413, -4.990194,
3, -3.139413, -4.990194,
-3, -3.139413, -4.990194,
-3, -3.30488, -5.26752,
-2, -3.139413, -4.990194,
-2, -3.30488, -5.26752,
-1, -3.139413, -4.990194,
-1, -3.30488, -5.26752,
0, -3.139413, -4.990194,
0, -3.30488, -5.26752,
1, -3.139413, -4.990194,
1, -3.30488, -5.26752,
2, -3.139413, -4.990194,
2, -3.30488, -5.26752,
3, -3.139413, -4.990194,
3, -3.30488, -5.26752
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
-3, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
-3, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
-3, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
-3, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
-2, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
-2, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
-2, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
-2, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
-1, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
-1, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
-1, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
-1, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
0, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
0, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
0, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
0, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
1, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
1, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
1, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
1, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
2, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
2, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
2, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
2, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5,
3, -3.635813, -5.822173, 0, -0.5, 0.5, 0.5,
3, -3.635813, -5.822173, 1, -0.5, 0.5, 0.5,
3, -3.635813, -5.822173, 1, 1.5, 0.5, 0.5,
3, -3.635813, -5.822173, 0, 1.5, 0.5, 0.5
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
-3.418081, -3, -4.990194,
-3.418081, 3, -4.990194,
-3.418081, -3, -4.990194,
-3.591985, -3, -5.26752,
-3.418081, -2, -4.990194,
-3.591985, -2, -5.26752,
-3.418081, -1, -4.990194,
-3.591985, -1, -5.26752,
-3.418081, 0, -4.990194,
-3.591985, 0, -5.26752,
-3.418081, 1, -4.990194,
-3.591985, 1, -5.26752,
-3.418081, 2, -4.990194,
-3.591985, 2, -5.26752,
-3.418081, 3, -4.990194,
-3.591985, 3, -5.26752
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
-3.939791, -3, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, -3, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, -3, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, -3, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, -2, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, -2, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, -2, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, -2, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, -1, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, -1, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, -1, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, -1, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, 0, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, 0, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, 0, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, 0, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, 1, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, 1, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, 1, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, 1, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, 2, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, 2, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, 2, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, 2, -5.822173, 0, 1.5, 0.5, 0.5,
-3.939791, 3, -5.822173, 0, -0.5, 0.5, 0.5,
-3.939791, 3, -5.822173, 1, -0.5, 0.5, 0.5,
-3.939791, 3, -5.822173, 1, 1.5, 0.5, 0.5,
-3.939791, 3, -5.822173, 0, 1.5, 0.5, 0.5
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
-3.418081, -3.139413, -4,
-3.418081, -3.139413, 4,
-3.418081, -3.139413, -4,
-3.591985, -3.30488, -4,
-3.418081, -3.139413, -2,
-3.591985, -3.30488, -2,
-3.418081, -3.139413, 0,
-3.591985, -3.30488, 0,
-3.418081, -3.139413, 2,
-3.591985, -3.30488, 2,
-3.418081, -3.139413, 4,
-3.591985, -3.30488, 4
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
-3.939791, -3.635813, -4, 0, -0.5, 0.5, 0.5,
-3.939791, -3.635813, -4, 1, -0.5, 0.5, 0.5,
-3.939791, -3.635813, -4, 1, 1.5, 0.5, 0.5,
-3.939791, -3.635813, -4, 0, 1.5, 0.5, 0.5,
-3.939791, -3.635813, -2, 0, -0.5, 0.5, 0.5,
-3.939791, -3.635813, -2, 1, -0.5, 0.5, 0.5,
-3.939791, -3.635813, -2, 1, 1.5, 0.5, 0.5,
-3.939791, -3.635813, -2, 0, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 0, 0, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 0, 1, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 0, 1, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 0, 0, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 2, 0, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 2, 1, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 2, 1, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 2, 0, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 4, 0, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 4, 1, -0.5, 0.5, 0.5,
-3.939791, -3.635813, 4, 1, 1.5, 0.5, 0.5,
-3.939791, -3.635813, 4, 0, 1.5, 0.5, 0.5
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
-3.418081, -3.139413, -4.990194,
-3.418081, 3.47925, -4.990194,
-3.418081, -3.139413, 6.102862,
-3.418081, 3.47925, 6.102862,
-3.418081, -3.139413, -4.990194,
-3.418081, -3.139413, 6.102862,
-3.418081, 3.47925, -4.990194,
-3.418081, 3.47925, 6.102862,
-3.418081, -3.139413, -4.990194,
3.538053, -3.139413, -4.990194,
-3.418081, -3.139413, 6.102862,
3.538053, -3.139413, 6.102862,
-3.418081, 3.47925, -4.990194,
3.538053, 3.47925, -4.990194,
-3.418081, 3.47925, 6.102862,
3.538053, 3.47925, 6.102862,
3.538053, -3.139413, -4.990194,
3.538053, 3.47925, -4.990194,
3.538053, -3.139413, 6.102862,
3.538053, 3.47925, 6.102862,
3.538053, -3.139413, -4.990194,
3.538053, -3.139413, 6.102862,
3.538053, 3.47925, -4.990194,
3.538053, 3.47925, 6.102862
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
var radius = 7.83425;
var distance = 34.85546;
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
mvMatrix.translate( -0.05998588, -0.1699183, -0.556334 );
mvMatrix.scale( 1.217709, 1.279797, 0.7635899 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.85546);
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
puromycin_aminonucle<-read.table("puromycin_aminonucle.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-puromycin_aminonucle$V2
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
y<-puromycin_aminonucle$V3
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
z<-puromycin_aminonucle$V4
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
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
-3.316778, 0.3508828, -1.641861, 0, 0, 1, 1, 1,
-2.990188, -0.987039, -2.00874, 1, 0, 0, 1, 1,
-2.938077, -0.1261523, -1.772464, 1, 0, 0, 1, 1,
-2.785217, 0.5285254, -0.5115367, 1, 0, 0, 1, 1,
-2.618032, 0.375214, -2.102301, 1, 0, 0, 1, 1,
-2.570159, 1.321344, -2.969711, 1, 0, 0, 1, 1,
-2.545389, 0.4481455, -1.711941, 0, 0, 0, 1, 1,
-2.502796, -1.750678, -2.645842, 0, 0, 0, 1, 1,
-2.38044, -0.5439861, -2.340922, 0, 0, 0, 1, 1,
-2.309385, -0.407608, -2.634905, 0, 0, 0, 1, 1,
-2.290644, -0.6186034, 0.3350186, 0, 0, 0, 1, 1,
-2.279486, 0.04370907, -1.819684, 0, 0, 0, 1, 1,
-2.263655, 0.2153166, -0.3607156, 0, 0, 0, 1, 1,
-2.207402, 1.100044, -2.001047, 1, 1, 1, 1, 1,
-2.192318, 0.1762753, -0.6110574, 1, 1, 1, 1, 1,
-2.18479, -0.8985492, -0.7938156, 1, 1, 1, 1, 1,
-2.157704, -0.02362612, -3.570498, 1, 1, 1, 1, 1,
-2.12501, 0.5804198, -1.192806, 1, 1, 1, 1, 1,
-2.06712, -1.42891, -1.901339, 1, 1, 1, 1, 1,
-1.994711, 1.730384, -1.088407, 1, 1, 1, 1, 1,
-1.972563, 0.2351217, -2.264155, 1, 1, 1, 1, 1,
-1.969179, -1.500852, -2.044093, 1, 1, 1, 1, 1,
-1.96865, -1.284353, -0.6638836, 1, 1, 1, 1, 1,
-1.936692, -0.1216281, -3.285691, 1, 1, 1, 1, 1,
-1.930978, 0.1937388, -1.929745, 1, 1, 1, 1, 1,
-1.919814, -0.3124894, -3.266061, 1, 1, 1, 1, 1,
-1.917846, 1.509989, -1.418155, 1, 1, 1, 1, 1,
-1.857272, 2.653678, -0.4778509, 1, 1, 1, 1, 1,
-1.837205, -1.050181, -1.371912, 0, 0, 1, 1, 1,
-1.833713, 1.936949, -1.366653, 1, 0, 0, 1, 1,
-1.816347, 1.83534, -1.101473, 1, 0, 0, 1, 1,
-1.816281, -1.191684, -1.426895, 1, 0, 0, 1, 1,
-1.808022, -0.426038, 0.2883452, 1, 0, 0, 1, 1,
-1.790277, 0.2361347, -0.8534929, 1, 0, 0, 1, 1,
-1.773061, -1.089397, -1.964927, 0, 0, 0, 1, 1,
-1.769665, -1.608229, -1.988346, 0, 0, 0, 1, 1,
-1.766548, 1.17956, -1.935216, 0, 0, 0, 1, 1,
-1.758012, -0.3800092, -2.911553, 0, 0, 0, 1, 1,
-1.756231, -0.8243462, -1.347853, 0, 0, 0, 1, 1,
-1.75311, -0.1800803, -3.011849, 0, 0, 0, 1, 1,
-1.743602, 0.4927276, -1.054205, 0, 0, 0, 1, 1,
-1.738101, 0.5555522, -0.5379524, 1, 1, 1, 1, 1,
-1.727483, 0.1391768, -1.7227, 1, 1, 1, 1, 1,
-1.72743, 2.175553, -2.468252, 1, 1, 1, 1, 1,
-1.71971, 0.2013167, -2.976905, 1, 1, 1, 1, 1,
-1.69574, 0.6801683, -1.982987, 1, 1, 1, 1, 1,
-1.691319, 1.168824, 0.08186003, 1, 1, 1, 1, 1,
-1.683931, 2.082065, -1.493526, 1, 1, 1, 1, 1,
-1.683887, 2.234092, -0.1659116, 1, 1, 1, 1, 1,
-1.67718, -0.7255526, -2.982142, 1, 1, 1, 1, 1,
-1.671795, -0.329166, -1.952898, 1, 1, 1, 1, 1,
-1.666333, 0.2433632, -0.1183203, 1, 1, 1, 1, 1,
-1.648935, 0.2558116, -2.695345, 1, 1, 1, 1, 1,
-1.642477, -0.7778371, -2.830436, 1, 1, 1, 1, 1,
-1.638762, -0.02014319, -2.203022, 1, 1, 1, 1, 1,
-1.635852, -0.007152607, 0.2905871, 1, 1, 1, 1, 1,
-1.629107, -0.1161195, -2.16354, 0, 0, 1, 1, 1,
-1.588522, -1.956837, -1.768158, 1, 0, 0, 1, 1,
-1.559797, 1.642696, 0.7100202, 1, 0, 0, 1, 1,
-1.55332, 0.4590115, -1.751882, 1, 0, 0, 1, 1,
-1.543725, -0.01096175, -0.2229111, 1, 0, 0, 1, 1,
-1.538326, 0.3791219, -0.7355595, 1, 0, 0, 1, 1,
-1.52008, 1.569433, -1.230278, 0, 0, 0, 1, 1,
-1.513146, -0.5113391, -2.387914, 0, 0, 0, 1, 1,
-1.50812, -0.9954765, -2.560601, 0, 0, 0, 1, 1,
-1.502399, 0.6654273, -1.542164, 0, 0, 0, 1, 1,
-1.50019, 0.4082065, 0.3817635, 0, 0, 0, 1, 1,
-1.499944, -1.260094, -3.220281, 0, 0, 0, 1, 1,
-1.49771, 0.2633392, -0.9425057, 0, 0, 0, 1, 1,
-1.493939, 1.185214, 0.2597063, 1, 1, 1, 1, 1,
-1.489662, -2.138017, -1.530999, 1, 1, 1, 1, 1,
-1.485987, -1.173179, -4.267189, 1, 1, 1, 1, 1,
-1.48534, 0.5962146, -0.1815523, 1, 1, 1, 1, 1,
-1.484807, -1.935319, -2.918136, 1, 1, 1, 1, 1,
-1.469828, 0.6444507, -1.092573, 1, 1, 1, 1, 1,
-1.467474, 0.01679041, -0.2785634, 1, 1, 1, 1, 1,
-1.445866, -0.364439, -2.12752, 1, 1, 1, 1, 1,
-1.4305, 1.215884, -0.9798163, 1, 1, 1, 1, 1,
-1.42169, 0.4231725, -2.211345, 1, 1, 1, 1, 1,
-1.417002, -0.1933323, -1.949431, 1, 1, 1, 1, 1,
-1.409169, -0.04034405, -0.679192, 1, 1, 1, 1, 1,
-1.409088, 1.939827, -0.5013633, 1, 1, 1, 1, 1,
-1.400746, -0.05890642, -1.032682, 1, 1, 1, 1, 1,
-1.396972, 2.16847, -0.07585012, 1, 1, 1, 1, 1,
-1.394041, -1.1839, -2.951509, 0, 0, 1, 1, 1,
-1.386497, -1.545389, -2.327831, 1, 0, 0, 1, 1,
-1.382242, 0.03579947, -0.8196907, 1, 0, 0, 1, 1,
-1.381711, 0.775206, 0.07452633, 1, 0, 0, 1, 1,
-1.378783, -0.5237211, -1.529709, 1, 0, 0, 1, 1,
-1.376513, -0.188265, -0.7372162, 1, 0, 0, 1, 1,
-1.356934, -0.9410273, -3.026072, 0, 0, 0, 1, 1,
-1.353752, -0.9668602, -1.661765, 0, 0, 0, 1, 1,
-1.349957, -2.125459, -2.667275, 0, 0, 0, 1, 1,
-1.344535, -1.901115, -2.365474, 0, 0, 0, 1, 1,
-1.338842, 0.7408273, -3.317661, 0, 0, 0, 1, 1,
-1.337441, -1.050355, -3.259007, 0, 0, 0, 1, 1,
-1.316161, -1.080594, -3.492512, 0, 0, 0, 1, 1,
-1.313344, -0.1796964, -2.880774, 1, 1, 1, 1, 1,
-1.298131, -0.1258912, -1.976695, 1, 1, 1, 1, 1,
-1.296044, -0.1085936, -2.429976, 1, 1, 1, 1, 1,
-1.286408, 0.5669568, -2.423002, 1, 1, 1, 1, 1,
-1.274307, -0.3723127, -3.072994, 1, 1, 1, 1, 1,
-1.267744, -0.5484918, -2.48473, 1, 1, 1, 1, 1,
-1.266064, 0.3882671, -1.3653, 1, 1, 1, 1, 1,
-1.257452, -0.1640149, -3.336703, 1, 1, 1, 1, 1,
-1.24463, 0.7647632, 0.09357166, 1, 1, 1, 1, 1,
-1.244181, -0.2901383, -2.653001, 1, 1, 1, 1, 1,
-1.235852, 1.009741, 0.1128796, 1, 1, 1, 1, 1,
-1.233752, -1.552577, -2.759553, 1, 1, 1, 1, 1,
-1.232188, 1.237943, -1.299881, 1, 1, 1, 1, 1,
-1.22902, 0.6152188, -0.6506861, 1, 1, 1, 1, 1,
-1.219643, 1.574308, -1.185537, 1, 1, 1, 1, 1,
-1.21938, 0.1693798, -3.365567, 0, 0, 1, 1, 1,
-1.217608, 0.8123941, -2.326121, 1, 0, 0, 1, 1,
-1.217284, -1.071139, -2.486802, 1, 0, 0, 1, 1,
-1.211522, -0.2494624, -2.521075, 1, 0, 0, 1, 1,
-1.196289, -0.5114346, -1.305518, 1, 0, 0, 1, 1,
-1.195399, 1.683414, -2.369778, 1, 0, 0, 1, 1,
-1.194551, -0.9203613, -2.534261, 0, 0, 0, 1, 1,
-1.187492, -0.7275923, -1.746644, 0, 0, 0, 1, 1,
-1.186677, -0.3618738, -2.598352, 0, 0, 0, 1, 1,
-1.182582, -0.7173339, -2.554925, 0, 0, 0, 1, 1,
-1.180125, 0.4801612, -1.807373, 0, 0, 0, 1, 1,
-1.161884, -0.3961459, -2.188826, 0, 0, 0, 1, 1,
-1.161443, 0.008419611, -2.017942, 0, 0, 0, 1, 1,
-1.153821, -1.37083, -2.255481, 1, 1, 1, 1, 1,
-1.139966, -1.02794, -1.047769, 1, 1, 1, 1, 1,
-1.134781, -1.571043, -2.26183, 1, 1, 1, 1, 1,
-1.127385, 0.3344456, -1.905328, 1, 1, 1, 1, 1,
-1.122533, 2.3041, -2.860401, 1, 1, 1, 1, 1,
-1.117152, -0.6081727, -1.676824, 1, 1, 1, 1, 1,
-1.113335, 0.4704565, -1.274407, 1, 1, 1, 1, 1,
-1.106513, -0.365316, -2.275623, 1, 1, 1, 1, 1,
-1.101273, 0.1699782, -4.082135, 1, 1, 1, 1, 1,
-1.087832, 1.041371, 0.941832, 1, 1, 1, 1, 1,
-1.081124, -0.1446707, -2.771151, 1, 1, 1, 1, 1,
-1.080025, 0.1721001, -2.218663, 1, 1, 1, 1, 1,
-1.07715, -0.07285883, -1.135425, 1, 1, 1, 1, 1,
-1.076141, 1.19317, -0.7988967, 1, 1, 1, 1, 1,
-1.073741, -1.690423, -3.30803, 1, 1, 1, 1, 1,
-1.070163, 0.2500223, 0.167125, 0, 0, 1, 1, 1,
-1.063025, 0.4693454, 0.5946162, 1, 0, 0, 1, 1,
-1.06027, -1.073281, -1.735894, 1, 0, 0, 1, 1,
-1.059512, -0.5419263, -2.73664, 1, 0, 0, 1, 1,
-1.057304, 0.688193, -1.905906, 1, 0, 0, 1, 1,
-1.050595, -0.441391, -0.681083, 1, 0, 0, 1, 1,
-1.0292, -0.7835071, -3.577116, 0, 0, 0, 1, 1,
-1.021194, 0.674903, -1.014661, 0, 0, 0, 1, 1,
-1.012892, 0.8218077, -2.99296, 0, 0, 0, 1, 1,
-1.010442, 0.08127395, 0.05931001, 0, 0, 0, 1, 1,
-1.00992, -0.3559892, -1.577048, 0, 0, 0, 1, 1,
-1.009758, -1.070028, -1.141899, 0, 0, 0, 1, 1,
-1.006257, 1.242301, 0.09450475, 0, 0, 0, 1, 1,
-1.000792, 1.078847, -2.069765, 1, 1, 1, 1, 1,
-0.9915629, -0.446837, -2.617759, 1, 1, 1, 1, 1,
-0.9834668, 0.4306885, 0.1808973, 1, 1, 1, 1, 1,
-0.9814954, 0.4387102, -3.250653, 1, 1, 1, 1, 1,
-0.9751535, -1.560758, -3.184061, 1, 1, 1, 1, 1,
-0.9715242, -0.9456844, -3.390029, 1, 1, 1, 1, 1,
-0.9630878, -0.1185936, -1.709163, 1, 1, 1, 1, 1,
-0.956318, -1.369722, -2.617904, 1, 1, 1, 1, 1,
-0.9554346, -0.332249, -0.834857, 1, 1, 1, 1, 1,
-0.950847, 0.1508096, -0.396852, 1, 1, 1, 1, 1,
-0.9446023, 0.8149818, -0.2943928, 1, 1, 1, 1, 1,
-0.9443673, 1.17649, -0.9312268, 1, 1, 1, 1, 1,
-0.9406338, -1.002711, -3.704557, 1, 1, 1, 1, 1,
-0.9363822, -1.174554, -2.768862, 1, 1, 1, 1, 1,
-0.9313707, 1.494039, -1.29213, 1, 1, 1, 1, 1,
-0.9266276, -0.6212917, -1.372366, 0, 0, 1, 1, 1,
-0.9160612, 1.090335, -0.8423315, 1, 0, 0, 1, 1,
-0.9160496, 0.08132151, -2.236622, 1, 0, 0, 1, 1,
-0.9143593, -0.68893, -0.7588876, 1, 0, 0, 1, 1,
-0.9077546, 0.5749734, -1.014812, 1, 0, 0, 1, 1,
-0.904426, -0.5355271, -2.050797, 1, 0, 0, 1, 1,
-0.9036748, 0.3016184, -1.755977, 0, 0, 0, 1, 1,
-0.8945958, 0.4697348, -1.2373, 0, 0, 0, 1, 1,
-0.8931279, 0.7843536, -2.156634, 0, 0, 0, 1, 1,
-0.8860965, 2.489405, 1.730813, 0, 0, 0, 1, 1,
-0.8790106, -0.3252415, -2.004821, 0, 0, 0, 1, 1,
-0.8783513, -0.6149758, -0.7719675, 0, 0, 0, 1, 1,
-0.8766413, 0.3181027, -1.858975, 0, 0, 0, 1, 1,
-0.8757161, -0.7107581, -2.420886, 1, 1, 1, 1, 1,
-0.8736072, 0.3719047, -3.515381, 1, 1, 1, 1, 1,
-0.8650246, 1.762328, -0.2804183, 1, 1, 1, 1, 1,
-0.8610886, 0.4107125, -0.33114, 1, 1, 1, 1, 1,
-0.8503015, -2.669831, -2.251381, 1, 1, 1, 1, 1,
-0.8406634, 1.376914, -1.713781, 1, 1, 1, 1, 1,
-0.8278023, 2.568655, 0.4687711, 1, 1, 1, 1, 1,
-0.8257803, -0.5251353, -1.553343, 1, 1, 1, 1, 1,
-0.8190624, 1.863789, -0.5123559, 1, 1, 1, 1, 1,
-0.8079247, 1.829648, -1.206145, 1, 1, 1, 1, 1,
-0.8040923, -0.9342429, -2.736229, 1, 1, 1, 1, 1,
-0.8039277, -1.044672, -3.106637, 1, 1, 1, 1, 1,
-0.8000559, 0.5884219, 0.6036394, 1, 1, 1, 1, 1,
-0.7914694, 1.19631, -2.335143, 1, 1, 1, 1, 1,
-0.7886181, 0.8805091, -1.375514, 1, 1, 1, 1, 1,
-0.7871109, 0.5336378, -1.497432, 0, 0, 1, 1, 1,
-0.786438, 1.104123, -1.559515, 1, 0, 0, 1, 1,
-0.7830893, -1.435789, -2.783953, 1, 0, 0, 1, 1,
-0.7681575, -0.8723572, -2.857447, 1, 0, 0, 1, 1,
-0.7672611, 0.07972571, -2.025848, 1, 0, 0, 1, 1,
-0.7637612, 0.8608084, -2.048824, 1, 0, 0, 1, 1,
-0.7586823, -1.150385, -2.551286, 0, 0, 0, 1, 1,
-0.7529936, -0.1551244, -1.163019, 0, 0, 0, 1, 1,
-0.7468448, 0.1631529, -0.201004, 0, 0, 0, 1, 1,
-0.745284, 0.003848596, -1.716565, 0, 0, 0, 1, 1,
-0.7409917, 1.166171, 1.117675, 0, 0, 0, 1, 1,
-0.7382477, 0.8153644, 1.054598, 0, 0, 0, 1, 1,
-0.7326599, 0.5349147, -0.9646316, 0, 0, 0, 1, 1,
-0.7292977, -0.9522976, -3.216872, 1, 1, 1, 1, 1,
-0.7271278, -1.289029, -4.608287, 1, 1, 1, 1, 1,
-0.7217963, -1.249842, -0.7790681, 1, 1, 1, 1, 1,
-0.7213591, -0.090857, -1.220058, 1, 1, 1, 1, 1,
-0.7166067, -1.122661, -3.928279, 1, 1, 1, 1, 1,
-0.716397, 2.222451, -1.8631, 1, 1, 1, 1, 1,
-0.7144046, -1.601943, -3.325363, 1, 1, 1, 1, 1,
-0.7124749, -0.1783318, -1.470989, 1, 1, 1, 1, 1,
-0.708141, 1.471707, -0.64058, 1, 1, 1, 1, 1,
-0.705635, -2.232609, -2.877696, 1, 1, 1, 1, 1,
-0.7021563, 0.1247702, -2.555018, 1, 1, 1, 1, 1,
-0.7006212, -1.340776, -3.03313, 1, 1, 1, 1, 1,
-0.6999925, -1.477173, -2.416747, 1, 1, 1, 1, 1,
-0.6954956, 0.0513469, -1.771865, 1, 1, 1, 1, 1,
-0.694236, -1.238643, -2.654577, 1, 1, 1, 1, 1,
-0.6941419, 1.912021, -1.684605, 0, 0, 1, 1, 1,
-0.6835577, 0.06860287, -1.115206, 1, 0, 0, 1, 1,
-0.682507, 0.8850761, -0.341664, 1, 0, 0, 1, 1,
-0.6782101, 1.282885, 0.7861395, 1, 0, 0, 1, 1,
-0.6781264, -1.913241, -3.990588, 1, 0, 0, 1, 1,
-0.6773155, -1.183059, -2.835185, 1, 0, 0, 1, 1,
-0.6765473, -0.3517209, -1.72728, 0, 0, 0, 1, 1,
-0.6748354, 0.6820288, 0.8405203, 0, 0, 0, 1, 1,
-0.6730973, 0.1294112, -1.021144, 0, 0, 0, 1, 1,
-0.6707171, -0.6150647, -2.282825, 0, 0, 0, 1, 1,
-0.6682925, -0.8302246, -1.402812, 0, 0, 0, 1, 1,
-0.666654, -0.4550967, -2.122411, 0, 0, 0, 1, 1,
-0.6631981, 0.2148721, -1.345658, 0, 0, 0, 1, 1,
-0.6625925, -1.792928, -4.559025, 1, 1, 1, 1, 1,
-0.662012, 0.5866826, -1.076979, 1, 1, 1, 1, 1,
-0.6606884, 0.9415725, -0.9619279, 1, 1, 1, 1, 1,
-0.6606017, -1.179865, -2.565307, 1, 1, 1, 1, 1,
-0.6603366, -0.4167826, -1.558804, 1, 1, 1, 1, 1,
-0.6583372, 1.439408, -0.03790516, 1, 1, 1, 1, 1,
-0.6575664, 0.1451779, -2.039268, 1, 1, 1, 1, 1,
-0.6547999, 0.3915077, -2.340268, 1, 1, 1, 1, 1,
-0.6493404, -0.07936546, -1.023751, 1, 1, 1, 1, 1,
-0.6428552, -1.65389, -2.057028, 1, 1, 1, 1, 1,
-0.6427632, 0.9787412, 0.3917132, 1, 1, 1, 1, 1,
-0.6364228, -1.754091, -3.735095, 1, 1, 1, 1, 1,
-0.6329801, 0.9642799, -0.1165922, 1, 1, 1, 1, 1,
-0.62743, -0.9676749, -2.049958, 1, 1, 1, 1, 1,
-0.6268561, 1.052169, -0.5597081, 1, 1, 1, 1, 1,
-0.618629, -1.151919, -1.668362, 0, 0, 1, 1, 1,
-0.6161384, 0.4489568, -0.989026, 1, 0, 0, 1, 1,
-0.6120534, 1.428925, -0.5596801, 1, 0, 0, 1, 1,
-0.6092802, 0.6749039, -0.8727645, 1, 0, 0, 1, 1,
-0.6053681, -1.494205, -3.040101, 1, 0, 0, 1, 1,
-0.6031768, 1.381481, 1.779476, 1, 0, 0, 1, 1,
-0.6027909, 1.044807, 0.01697305, 0, 0, 0, 1, 1,
-0.6019374, 1.085356, -1.358219, 0, 0, 0, 1, 1,
-0.6008429, 0.9858732, -0.4814277, 0, 0, 0, 1, 1,
-0.5995106, 0.7176228, -0.744293, 0, 0, 0, 1, 1,
-0.5984701, -0.6504123, -1.761724, 0, 0, 0, 1, 1,
-0.5984391, -0.8955521, -1.864442, 0, 0, 0, 1, 1,
-0.5947886, 0.9336944, 0.7970439, 0, 0, 0, 1, 1,
-0.5935352, 0.06024706, -3.52299, 1, 1, 1, 1, 1,
-0.5900626, 0.6435078, -2.508942, 1, 1, 1, 1, 1,
-0.5891158, -0.2454389, -1.846163, 1, 1, 1, 1, 1,
-0.5843022, 1.306465, -0.9233248, 1, 1, 1, 1, 1,
-0.5831739, 0.2703537, -1.136715, 1, 1, 1, 1, 1,
-0.5801046, 0.001882047, -0.9143555, 1, 1, 1, 1, 1,
-0.5760472, -0.2567817, -2.116008, 1, 1, 1, 1, 1,
-0.5756406, 1.104999, -1.714468, 1, 1, 1, 1, 1,
-0.5730643, 2.272568, -1.729349, 1, 1, 1, 1, 1,
-0.5725688, -0.3850891, 0.0357834, 1, 1, 1, 1, 1,
-0.5723989, -0.6354533, -2.913257, 1, 1, 1, 1, 1,
-0.5695887, -0.1965552, -1.563265, 1, 1, 1, 1, 1,
-0.5693671, 1.090219, 1.256483, 1, 1, 1, 1, 1,
-0.566944, -0.494401, -1.729959, 1, 1, 1, 1, 1,
-0.5661745, 0.469342, -0.3911725, 1, 1, 1, 1, 1,
-0.5650284, -0.6641574, -2.100137, 0, 0, 1, 1, 1,
-0.5620185, 0.04964091, -1.418093, 1, 0, 0, 1, 1,
-0.5619082, 1.71065, -0.914754, 1, 0, 0, 1, 1,
-0.5578533, 0.6938584, -0.1497522, 1, 0, 0, 1, 1,
-0.5494483, 0.4942651, -0.7865097, 1, 0, 0, 1, 1,
-0.5468883, 0.3263946, -1.841973, 1, 0, 0, 1, 1,
-0.5345559, 1.390989, -0.485263, 0, 0, 0, 1, 1,
-0.5267354, 1.71145, -1.638233, 0, 0, 0, 1, 1,
-0.5251265, -2.023895, -3.218434, 0, 0, 0, 1, 1,
-0.5209273, 1.313141, 0.618891, 0, 0, 0, 1, 1,
-0.516285, 0.1428109, -1.800349, 0, 0, 0, 1, 1,
-0.5129594, -1.785638, -3.032609, 0, 0, 0, 1, 1,
-0.5085084, -1.088959, -3.739274, 0, 0, 0, 1, 1,
-0.5042363, -1.419698, -2.905882, 1, 1, 1, 1, 1,
-0.4952106, -1.19659, -3.485593, 1, 1, 1, 1, 1,
-0.4933544, -0.5199561, -3.043408, 1, 1, 1, 1, 1,
-0.4907601, 1.308403, -0.2303109, 1, 1, 1, 1, 1,
-0.4901271, 0.4020819, -1.774511, 1, 1, 1, 1, 1,
-0.4882719, -0.6186855, -2.598814, 1, 1, 1, 1, 1,
-0.4809572, -0.7819263, -2.607889, 1, 1, 1, 1, 1,
-0.479648, -1.023106, -3.214747, 1, 1, 1, 1, 1,
-0.4784338, 0.8986868, -1.418552, 1, 1, 1, 1, 1,
-0.4753422, -0.04321494, -0.6767185, 1, 1, 1, 1, 1,
-0.4752566, -0.5911703, -2.527691, 1, 1, 1, 1, 1,
-0.4718684, 0.409823, -0.8047255, 1, 1, 1, 1, 1,
-0.4679485, -1.326026, -3.168727, 1, 1, 1, 1, 1,
-0.4665139, -0.3398455, -1.691757, 1, 1, 1, 1, 1,
-0.4578148, -0.8262346, -2.256121, 1, 1, 1, 1, 1,
-0.4555162, -2.094108, -4.646104, 0, 0, 1, 1, 1,
-0.4548532, 0.2778017, -0.8578928, 1, 0, 0, 1, 1,
-0.4478192, -0.0365892, -1.827607, 1, 0, 0, 1, 1,
-0.4432751, 0.2394136, 0.5985269, 1, 0, 0, 1, 1,
-0.441332, 0.2923303, -2.048921, 1, 0, 0, 1, 1,
-0.4390201, -0.4506192, -2.078321, 1, 0, 0, 1, 1,
-0.4380172, -0.1316358, -1.065912, 0, 0, 0, 1, 1,
-0.4313231, 0.01569493, 0.171731, 0, 0, 0, 1, 1,
-0.4281306, 0.3608116, -2.401489, 0, 0, 0, 1, 1,
-0.4212994, 0.8559894, -0.28001, 0, 0, 0, 1, 1,
-0.4192656, -1.055359, -3.421861, 0, 0, 0, 1, 1,
-0.4108174, 0.7758827, 0.1457186, 0, 0, 0, 1, 1,
-0.409972, 1.33764, -0.3360196, 0, 0, 0, 1, 1,
-0.4085557, 0.6602225, -0.8111942, 1, 1, 1, 1, 1,
-0.405666, 0.7030377, -0.6683913, 1, 1, 1, 1, 1,
-0.40281, -0.2427436, 0.2272533, 1, 1, 1, 1, 1,
-0.402378, 1.553548, 2.970153, 1, 1, 1, 1, 1,
-0.3993976, 0.7677146, -0.2747255, 1, 1, 1, 1, 1,
-0.3987659, 0.853802, 0.766193, 1, 1, 1, 1, 1,
-0.3976824, -0.5915016, -2.000824, 1, 1, 1, 1, 1,
-0.3958869, -1.166339, -2.619833, 1, 1, 1, 1, 1,
-0.3928571, 0.4545524, -1.19259, 1, 1, 1, 1, 1,
-0.3918694, -2.28075, -3.531186, 1, 1, 1, 1, 1,
-0.3910817, 1.162456, -1.360027, 1, 1, 1, 1, 1,
-0.3843084, -1.795816, -3.52822, 1, 1, 1, 1, 1,
-0.3820011, 1.089161, 0.763207, 1, 1, 1, 1, 1,
-0.3785993, -0.3718676, -2.966639, 1, 1, 1, 1, 1,
-0.3784956, -2.466316, -4.145743, 1, 1, 1, 1, 1,
-0.3746123, 0.1294595, 0.5145964, 0, 0, 1, 1, 1,
-0.3738826, -0.7913569, -3.986027, 1, 0, 0, 1, 1,
-0.3716926, -0.7893672, -0.5068752, 1, 0, 0, 1, 1,
-0.3697731, 0.08103298, -0.2242196, 1, 0, 0, 1, 1,
-0.3654277, 1.330087, 0.5246251, 1, 0, 0, 1, 1,
-0.356788, 1.94094, 0.3235957, 1, 0, 0, 1, 1,
-0.3537425, -0.8382622, -3.570068, 0, 0, 0, 1, 1,
-0.3497761, 1.492839, -0.1339361, 0, 0, 0, 1, 1,
-0.3450674, 2.875234, -1.670291, 0, 0, 0, 1, 1,
-0.3440534, -0.2355895, -2.983876, 0, 0, 0, 1, 1,
-0.342018, -1.585794, -2.572144, 0, 0, 0, 1, 1,
-0.3406913, -0.1753416, -2.243466, 0, 0, 0, 1, 1,
-0.3373305, 0.2292837, -2.500083, 0, 0, 0, 1, 1,
-0.3360439, 0.2238038, -1.602395, 1, 1, 1, 1, 1,
-0.3349094, 0.4241489, 0.5744897, 1, 1, 1, 1, 1,
-0.3322639, -1.447752, -1.71337, 1, 1, 1, 1, 1,
-0.3238637, 0.2340189, 0.4367903, 1, 1, 1, 1, 1,
-0.3187118, 1.683252, 0.7253385, 1, 1, 1, 1, 1,
-0.3173203, -1.686335, -2.377367, 1, 1, 1, 1, 1,
-0.3118424, -0.3354366, -3.683204, 1, 1, 1, 1, 1,
-0.3106194, -0.1987774, -3.313745, 1, 1, 1, 1, 1,
-0.3050305, 0.1395182, -1.159779, 1, 1, 1, 1, 1,
-0.3034167, -2.087768, -2.088068, 1, 1, 1, 1, 1,
-0.2985053, -0.676007, -1.002986, 1, 1, 1, 1, 1,
-0.2978559, 1.245282, 0.2081866, 1, 1, 1, 1, 1,
-0.2978289, -0.2340404, -2.529386, 1, 1, 1, 1, 1,
-0.2960511, -0.3026596, -0.05811767, 1, 1, 1, 1, 1,
-0.2921588, 0.6440091, 0.6080119, 1, 1, 1, 1, 1,
-0.2896519, 1.491917, 1.134985, 0, 0, 1, 1, 1,
-0.282853, 0.3659634, -1.483384, 1, 0, 0, 1, 1,
-0.2805606, 0.602448, -2.28991, 1, 0, 0, 1, 1,
-0.2795688, -2.20326, -2.823308, 1, 0, 0, 1, 1,
-0.2792509, 0.05339229, 0.3359255, 1, 0, 0, 1, 1,
-0.2740099, 1.184154, -0.2474571, 1, 0, 0, 1, 1,
-0.271798, -0.7733881, -1.924058, 0, 0, 0, 1, 1,
-0.2712246, -0.1884829, -3.537854, 0, 0, 0, 1, 1,
-0.2687854, -0.3538939, -2.071533, 0, 0, 0, 1, 1,
-0.2663106, 0.8797839, 1.336307, 0, 0, 0, 1, 1,
-0.2605691, -1.102757, -3.32207, 0, 0, 0, 1, 1,
-0.2543359, 0.1319201, -2.28256, 0, 0, 0, 1, 1,
-0.2513783, -1.391705, -1.318035, 0, 0, 0, 1, 1,
-0.2475984, 1.016197, 0.4072886, 1, 1, 1, 1, 1,
-0.2452014, 0.5540627, -0.7675221, 1, 1, 1, 1, 1,
-0.2447017, -0.6023195, -2.399953, 1, 1, 1, 1, 1,
-0.2419261, 0.3086607, -0.5878681, 1, 1, 1, 1, 1,
-0.2418086, -1.611222, -3.96785, 1, 1, 1, 1, 1,
-0.2411844, 0.1838122, -2.049345, 1, 1, 1, 1, 1,
-0.2391997, -0.756887, -1.791489, 1, 1, 1, 1, 1,
-0.2380261, 0.1567068, 0.3429118, 1, 1, 1, 1, 1,
-0.2368609, 0.403989, 0.1793982, 1, 1, 1, 1, 1,
-0.2367536, -0.2654043, -2.49902, 1, 1, 1, 1, 1,
-0.2365604, 0.4184069, 1.672208, 1, 1, 1, 1, 1,
-0.2344786, -0.5663469, -1.326623, 1, 1, 1, 1, 1,
-0.2344572, 0.0187764, -1.043352, 1, 1, 1, 1, 1,
-0.2304964, -0.7867294, -1.724076, 1, 1, 1, 1, 1,
-0.2302334, 0.2059233, -0.5132355, 1, 1, 1, 1, 1,
-0.2279633, 0.06467033, 0.4125059, 0, 0, 1, 1, 1,
-0.2260847, 0.2255519, -2.824761, 1, 0, 0, 1, 1,
-0.2237139, -0.2643855, -3.118252, 1, 0, 0, 1, 1,
-0.2235945, -0.2036448, -2.901692, 1, 0, 0, 1, 1,
-0.2149526, 0.5881404, 0.425634, 1, 0, 0, 1, 1,
-0.21321, -0.3440472, -1.008169, 1, 0, 0, 1, 1,
-0.207425, -0.5462193, -2.698807, 0, 0, 0, 1, 1,
-0.2047482, 0.5424712, -0.4421319, 0, 0, 0, 1, 1,
-0.2025182, 0.8056594, -0.7080733, 0, 0, 0, 1, 1,
-0.201495, -0.9526857, -3.014894, 0, 0, 0, 1, 1,
-0.1969759, 0.2797878, -0.8357826, 0, 0, 0, 1, 1,
-0.1962369, 0.292041, -0.21349, 0, 0, 0, 1, 1,
-0.1929953, 1.353282, 2.183785, 0, 0, 0, 1, 1,
-0.1913492, -0.6237439, -2.519319, 1, 1, 1, 1, 1,
-0.1905769, 0.01774455, -1.440294, 1, 1, 1, 1, 1,
-0.1900484, -1.112433, -2.475034, 1, 1, 1, 1, 1,
-0.1868362, 0.810764, 0.9869294, 1, 1, 1, 1, 1,
-0.1801295, -0.1343898, -1.626566, 1, 1, 1, 1, 1,
-0.1797671, 0.6768116, 1.617345, 1, 1, 1, 1, 1,
-0.1784292, -0.9244033, -2.701449, 1, 1, 1, 1, 1,
-0.1779238, -0.5413441, -3.052336, 1, 1, 1, 1, 1,
-0.1774468, 0.2476083, -1.95546, 1, 1, 1, 1, 1,
-0.1767409, 0.3662825, -0.2133664, 1, 1, 1, 1, 1,
-0.1761867, 0.2705423, 0.103739, 1, 1, 1, 1, 1,
-0.174078, 0.3006054, -1.166181, 1, 1, 1, 1, 1,
-0.168037, 0.8773547, -0.5311043, 1, 1, 1, 1, 1,
-0.1661896, 0.1731222, -1.148989, 1, 1, 1, 1, 1,
-0.1568624, 0.9856973, -1.042472, 1, 1, 1, 1, 1,
-0.1550779, 1.252998, -0.515524, 0, 0, 1, 1, 1,
-0.1521364, -1.903563, -1.814558, 1, 0, 0, 1, 1,
-0.1488714, 0.9013137, 0.3097961, 1, 0, 0, 1, 1,
-0.1488102, 0.7348679, -0.210225, 1, 0, 0, 1, 1,
-0.1476832, -1.189701, -4.094271, 1, 0, 0, 1, 1,
-0.1446324, 0.3163116, -0.9329289, 1, 0, 0, 1, 1,
-0.1429349, 0.453145, -1.813387, 0, 0, 0, 1, 1,
-0.139734, -0.5458378, -2.187711, 0, 0, 0, 1, 1,
-0.1343563, -0.2366298, -2.303679, 0, 0, 0, 1, 1,
-0.1301425, -0.5867419, -4.745764, 0, 0, 0, 1, 1,
-0.1298234, 0.1655387, -1.930978, 0, 0, 0, 1, 1,
-0.1250975, -0.1925097, -2.289598, 0, 0, 0, 1, 1,
-0.1184275, -0.2277172, -3.48285, 0, 0, 0, 1, 1,
-0.1179573, -0.1874409, -0.9307385, 1, 1, 1, 1, 1,
-0.1174603, 1.751456, 0.5487522, 1, 1, 1, 1, 1,
-0.1140128, -1.377498, -1.886204, 1, 1, 1, 1, 1,
-0.1131161, -0.2148422, -2.105909, 1, 1, 1, 1, 1,
-0.1083047, -0.3774342, -4.794855, 1, 1, 1, 1, 1,
-0.1080256, -0.1061387, -2.911506, 1, 1, 1, 1, 1,
-0.09787249, 0.6578465, -0.4769376, 1, 1, 1, 1, 1,
-0.09563754, -2.338147, -2.985586, 1, 1, 1, 1, 1,
-0.09299462, -0.5631716, -3.011503, 1, 1, 1, 1, 1,
-0.09283824, 0.2115856, -0.7707552, 1, 1, 1, 1, 1,
-0.09180848, 1.38061, 0.5386193, 1, 1, 1, 1, 1,
-0.08908253, 0.9063209, -0.6174766, 1, 1, 1, 1, 1,
-0.08604018, -1.089575, -1.853429, 1, 1, 1, 1, 1,
-0.08577824, -0.01119631, -3.221568, 1, 1, 1, 1, 1,
-0.08458138, -0.5107668, -3.295591, 1, 1, 1, 1, 1,
-0.08306958, 0.8911406, -1.526004, 0, 0, 1, 1, 1,
-0.08224908, 0.9419822, -0.0689039, 1, 0, 0, 1, 1,
-0.08184682, -2.08988, -3.049801, 1, 0, 0, 1, 1,
-0.07397398, 1.401796, -0.1158233, 1, 0, 0, 1, 1,
-0.0708185, 0.07065456, -2.465091, 1, 0, 0, 1, 1,
-0.07081622, 0.7414981, -0.1649651, 1, 0, 0, 1, 1,
-0.07065281, 1.41011, 1.397958, 0, 0, 0, 1, 1,
-0.06993216, -0.3378103, -4.56572, 0, 0, 0, 1, 1,
-0.0665058, -0.09676767, -2.831888, 0, 0, 0, 1, 1,
-0.06192126, -0.3603562, -3.267544, 0, 0, 0, 1, 1,
-0.05440034, 0.607999, 0.7115812, 0, 0, 0, 1, 1,
-0.0485062, -0.726839, -2.873105, 0, 0, 0, 1, 1,
-0.04734976, -0.5743551, -2.37071, 0, 0, 0, 1, 1,
-0.04050487, -0.3256675, -4.828644, 1, 1, 1, 1, 1,
-0.03823797, -0.1015938, 0.9972501, 1, 1, 1, 1, 1,
-0.03328015, -1.082087, -3.323494, 1, 1, 1, 1, 1,
-0.03130589, -0.03251415, -2.956244, 1, 1, 1, 1, 1,
-0.02926539, -0.5180399, -4.711665, 1, 1, 1, 1, 1,
-0.02780449, -1.255928, -1.805489, 1, 1, 1, 1, 1,
-0.02653302, 1.277589, 0.1033724, 1, 1, 1, 1, 1,
-0.0217436, 3.382861, 0.4011461, 1, 1, 1, 1, 1,
-0.02084897, 0.788507, -2.079439, 1, 1, 1, 1, 1,
-0.0151622, -1.105927, -2.589977, 1, 1, 1, 1, 1,
-0.0135394, 1.025638, -1.083267, 1, 1, 1, 1, 1,
-0.0109332, -0.8242142, -2.543269, 1, 1, 1, 1, 1,
-0.01001478, -0.8808497, -3.395576, 1, 1, 1, 1, 1,
-0.009031593, -0.2294503, -2.960398, 1, 1, 1, 1, 1,
-0.007330212, -0.5193617, -3.628217, 1, 1, 1, 1, 1,
-0.005851344, -0.3162032, -2.505427, 0, 0, 1, 1, 1,
-0.004145226, 2.013153, 0.7050411, 1, 0, 0, 1, 1,
-0.0014711, 0.3494934, 0.334953, 1, 0, 0, 1, 1,
0.002026207, -1.04331, 3.654083, 1, 0, 0, 1, 1,
0.004038679, 0.1268151, 0.6651748, 1, 0, 0, 1, 1,
0.007784203, 2.33435, -0.8392053, 1, 0, 0, 1, 1,
0.009626399, 0.2844371, 0.6190408, 0, 0, 0, 1, 1,
0.02072591, 1.137454, 1.467048, 0, 0, 0, 1, 1,
0.02074032, -1.181506, 3.000796, 0, 0, 0, 1, 1,
0.02327359, -1.475436, 4.597999, 0, 0, 0, 1, 1,
0.02486289, -0.03890209, 2.804099, 0, 0, 0, 1, 1,
0.03257201, 0.01325267, 2.645755, 0, 0, 0, 1, 1,
0.03317886, 0.8604853, 0.717432, 0, 0, 0, 1, 1,
0.03486027, -0.1332946, 2.27285, 1, 1, 1, 1, 1,
0.03516082, 0.1829546, 1.5047, 1, 1, 1, 1, 1,
0.04035144, 0.5416723, 1.070631, 1, 1, 1, 1, 1,
0.04415463, 0.5605055, 0.3812754, 1, 1, 1, 1, 1,
0.04667371, -1.370806, 2.730336, 1, 1, 1, 1, 1,
0.05273994, -1.371276, 2.912164, 1, 1, 1, 1, 1,
0.05285317, 0.9344519, 0.8112039, 1, 1, 1, 1, 1,
0.05705285, 0.2335864, 1.620418, 1, 1, 1, 1, 1,
0.05721536, -0.6233491, 2.84292, 1, 1, 1, 1, 1,
0.06218923, -0.07111585, 2.63535, 1, 1, 1, 1, 1,
0.06481086, 0.4835941, 0.4727799, 1, 1, 1, 1, 1,
0.06628038, 0.8442983, -0.4605012, 1, 1, 1, 1, 1,
0.07207789, -1.000889, 4.90995, 1, 1, 1, 1, 1,
0.07378581, 1.332694, 0.2696868, 1, 1, 1, 1, 1,
0.07419668, -0.1156808, 0.9878602, 1, 1, 1, 1, 1,
0.07425502, 1.319328, 1.889788, 0, 0, 1, 1, 1,
0.074588, -0.9643319, 2.500436, 1, 0, 0, 1, 1,
0.07694479, -0.2568392, 1.106843, 1, 0, 0, 1, 1,
0.08035467, -0.3909387, 1.625648, 1, 0, 0, 1, 1,
0.08152165, -0.2499093, 0.3840541, 1, 0, 0, 1, 1,
0.08315492, 1.046013, 1.213592, 1, 0, 0, 1, 1,
0.08523405, 0.6573406, -0.4122895, 0, 0, 0, 1, 1,
0.08655883, 1.164078, -0.7527627, 0, 0, 0, 1, 1,
0.08771393, 0.501287, 0.2710643, 0, 0, 0, 1, 1,
0.09069852, -0.2892263, 1.777476, 0, 0, 0, 1, 1,
0.09145287, 0.07662188, -1.273231, 0, 0, 0, 1, 1,
0.09300845, 1.378947, 0.2409364, 0, 0, 0, 1, 1,
0.0995601, -0.6982332, 4.327405, 0, 0, 0, 1, 1,
0.09964318, 1.331635, -0.4339437, 1, 1, 1, 1, 1,
0.1019336, -0.7855825, 3.241424, 1, 1, 1, 1, 1,
0.1021944, -0.8023233, 4.754376, 1, 1, 1, 1, 1,
0.1068018, -1.131364, 3.538523, 1, 1, 1, 1, 1,
0.1088584, -1.319514, 3.500255, 1, 1, 1, 1, 1,
0.1129448, -0.8067276, 2.677314, 1, 1, 1, 1, 1,
0.113607, 0.1403071, 1.822439, 1, 1, 1, 1, 1,
0.1138722, 1.201321, 1.776255, 1, 1, 1, 1, 1,
0.1152465, -0.9008739, 2.989125, 1, 1, 1, 1, 1,
0.123944, -1.439302, 2.54898, 1, 1, 1, 1, 1,
0.1267533, -1.092255, 2.76243, 1, 1, 1, 1, 1,
0.1272055, 0.6297053, 0.8624206, 1, 1, 1, 1, 1,
0.1342944, -0.924822, 2.099525, 1, 1, 1, 1, 1,
0.1354302, -0.494743, 3.249081, 1, 1, 1, 1, 1,
0.138054, -0.2081745, 2.891426, 1, 1, 1, 1, 1,
0.1472587, -0.6884606, 2.904215, 0, 0, 1, 1, 1,
0.1488873, 0.8760188, 2.465817, 1, 0, 0, 1, 1,
0.1499792, -0.1506785, 2.144405, 1, 0, 0, 1, 1,
0.1503722, -0.07000483, 2.765546, 1, 0, 0, 1, 1,
0.1577531, -0.2423405, 2.704002, 1, 0, 0, 1, 1,
0.1579732, 0.2843661, 0.1902096, 1, 0, 0, 1, 1,
0.1608146, 1.206707, -1.853813, 0, 0, 0, 1, 1,
0.1609979, 0.4209973, 1.0593, 0, 0, 0, 1, 1,
0.1727396, 0.1707627, 1.761332, 0, 0, 0, 1, 1,
0.1738096, -0.7975786, 4.215227, 0, 0, 0, 1, 1,
0.1791054, 1.392496, 0.1516361, 0, 0, 0, 1, 1,
0.1810191, -0.3466833, 1.854301, 0, 0, 0, 1, 1,
0.1817062, 0.8036295, -0.8921322, 0, 0, 0, 1, 1,
0.186165, 0.5897731, 1.13028, 1, 1, 1, 1, 1,
0.1862617, 1.378261, -0.473023, 1, 1, 1, 1, 1,
0.1874478, -0.4457092, 3.012172, 1, 1, 1, 1, 1,
0.1875372, -1.695423, 4.174928, 1, 1, 1, 1, 1,
0.1921282, 0.1305604, 0.7882602, 1, 1, 1, 1, 1,
0.1941878, 0.4750066, 0.185855, 1, 1, 1, 1, 1,
0.2004744, -0.792233, 3.764428, 1, 1, 1, 1, 1,
0.2016597, -1.7207, 1.847933, 1, 1, 1, 1, 1,
0.201835, -1.526495, 3.475074, 1, 1, 1, 1, 1,
0.2037175, 1.285767, 1.785305, 1, 1, 1, 1, 1,
0.2042987, -0.2542366, 2.681527, 1, 1, 1, 1, 1,
0.2085176, -1.01603, 2.24506, 1, 1, 1, 1, 1,
0.2090102, -1.646632, 2.568659, 1, 1, 1, 1, 1,
0.2161342, -0.2310203, 3.695316, 1, 1, 1, 1, 1,
0.2161441, 1.347585, 2.738827, 1, 1, 1, 1, 1,
0.2189507, -0.4713639, 3.661868, 0, 0, 1, 1, 1,
0.2198762, 1.47055, 1.08958, 1, 0, 0, 1, 1,
0.2259072, -0.6987072, 1.452373, 1, 0, 0, 1, 1,
0.2352951, 0.4418629, 2.458825, 1, 0, 0, 1, 1,
0.235604, -0.08686116, 1.370099, 1, 0, 0, 1, 1,
0.235708, -0.2234768, 3.077473, 1, 0, 0, 1, 1,
0.2357428, 0.7269806, -0.2510411, 0, 0, 0, 1, 1,
0.2402853, -0.1712095, 2.699437, 0, 0, 0, 1, 1,
0.2414685, 0.08874983, 0.01276784, 0, 0, 0, 1, 1,
0.2425445, -0.7219045, 3.266402, 0, 0, 0, 1, 1,
0.2425789, -0.3281283, 3.812394, 0, 0, 0, 1, 1,
0.2459975, -0.07296132, 0.2246738, 0, 0, 0, 1, 1,
0.2466958, -0.9553382, 2.606614, 0, 0, 0, 1, 1,
0.2477489, -2.361605, 1.336738, 1, 1, 1, 1, 1,
0.2486129, 0.1000036, 1.024379, 1, 1, 1, 1, 1,
0.2523943, 0.2770439, 1.870195, 1, 1, 1, 1, 1,
0.253807, 0.5263636, -0.7437395, 1, 1, 1, 1, 1,
0.2549503, 1.590849, 1.057889, 1, 1, 1, 1, 1,
0.257053, -2.280771, 2.655504, 1, 1, 1, 1, 1,
0.2594672, 1.176722, -0.2154068, 1, 1, 1, 1, 1,
0.2599954, -1.055435, 4.302154, 1, 1, 1, 1, 1,
0.261517, -1.462061, 2.282226, 1, 1, 1, 1, 1,
0.2618238, -1.699456, 4.427633, 1, 1, 1, 1, 1,
0.2625794, -0.5941081, 1.419123, 1, 1, 1, 1, 1,
0.2712537, -2.162223, 3.086822, 1, 1, 1, 1, 1,
0.2717171, -1.67873, 2.644043, 1, 1, 1, 1, 1,
0.2764181, 1.429637, -0.7751768, 1, 1, 1, 1, 1,
0.2778699, 0.8938305, -0.4624109, 1, 1, 1, 1, 1,
0.2786503, 1.848781, 0.430464, 0, 0, 1, 1, 1,
0.2797492, -0.2452385, 3.054076, 1, 0, 0, 1, 1,
0.2826633, 0.9042834, -0.1281307, 1, 0, 0, 1, 1,
0.2847002, 1.001183, 0.2111979, 1, 0, 0, 1, 1,
0.2849563, -0.5916584, 2.655112, 1, 0, 0, 1, 1,
0.2869999, -1.049807, 2.541898, 1, 0, 0, 1, 1,
0.2905802, -0.3445386, 2.335416, 0, 0, 0, 1, 1,
0.2973327, 1.060349, 0.5949739, 0, 0, 0, 1, 1,
0.2999046, -0.05801427, 1.614637, 0, 0, 0, 1, 1,
0.3066431, 0.4698971, 1.163035, 0, 0, 0, 1, 1,
0.3095596, -0.4217632, 2.311562, 0, 0, 0, 1, 1,
0.3149659, -0.6079391, 2.226695, 0, 0, 0, 1, 1,
0.3169122, 0.1119958, -0.8272337, 0, 0, 0, 1, 1,
0.3219718, -0.1799422, 1.031288, 1, 1, 1, 1, 1,
0.3249297, 0.691078, 1.515961, 1, 1, 1, 1, 1,
0.3265314, -1.531033, 5.941312, 1, 1, 1, 1, 1,
0.3266118, -0.0787872, 2.826601, 1, 1, 1, 1, 1,
0.3266529, 0.6342762, 1.014707, 1, 1, 1, 1, 1,
0.3277681, -0.4121343, 2.553537, 1, 1, 1, 1, 1,
0.3330983, -0.8607059, 2.646791, 1, 1, 1, 1, 1,
0.3341273, -0.3642404, 3.359876, 1, 1, 1, 1, 1,
0.3362669, 0.4959961, 1.370754, 1, 1, 1, 1, 1,
0.3392627, -0.3735823, 2.568407, 1, 1, 1, 1, 1,
0.3411987, -0.3579476, 3.323336, 1, 1, 1, 1, 1,
0.3442274, -0.3763212, 2.958805, 1, 1, 1, 1, 1,
0.3443066, 0.8067924, 0.01106184, 1, 1, 1, 1, 1,
0.3464472, 0.8573737, 1.248519, 1, 1, 1, 1, 1,
0.3478848, 0.5351658, 0.9238801, 1, 1, 1, 1, 1,
0.3506678, 0.8098596, 0.08739047, 0, 0, 1, 1, 1,
0.3514102, -0.6462542, 2.728447, 1, 0, 0, 1, 1,
0.3529296, -0.422312, 2.416123, 1, 0, 0, 1, 1,
0.354959, -0.681283, 0.8168532, 1, 0, 0, 1, 1,
0.3562063, 1.248553, 0.842672, 1, 0, 0, 1, 1,
0.3605235, -0.2577894, 0.5024698, 1, 0, 0, 1, 1,
0.3613218, -1.425027, 3.171644, 0, 0, 0, 1, 1,
0.3619761, 0.3264106, 2.71867, 0, 0, 0, 1, 1,
0.3622487, -0.7991028, 4.251028, 0, 0, 0, 1, 1,
0.3635239, 0.4688153, 0.8482305, 0, 0, 0, 1, 1,
0.3661638, -0.5387616, 1.803105, 0, 0, 0, 1, 1,
0.3664693, -0.703154, 3.525278, 0, 0, 0, 1, 1,
0.3714437, 1.199133, -1.061431, 0, 0, 0, 1, 1,
0.3735942, -0.4754148, 1.649857, 1, 1, 1, 1, 1,
0.3757678, 1.035186, -2.332939, 1, 1, 1, 1, 1,
0.3757889, -0.3516071, 0.7395539, 1, 1, 1, 1, 1,
0.3768953, -0.4953012, 2.933113, 1, 1, 1, 1, 1,
0.3802803, -0.1532242, 2.828284, 1, 1, 1, 1, 1,
0.388132, -1.16104, 3.980191, 1, 1, 1, 1, 1,
0.3897966, 0.3464924, 0.2590153, 1, 1, 1, 1, 1,
0.3931179, 0.6517344, 0.0247054, 1, 1, 1, 1, 1,
0.3937955, -0.772962, 3.905164, 1, 1, 1, 1, 1,
0.394933, 0.03045798, -0.2612466, 1, 1, 1, 1, 1,
0.3981923, -1.513044, 3.408767, 1, 1, 1, 1, 1,
0.4084646, 2.003862, 0.7593559, 1, 1, 1, 1, 1,
0.4096605, 0.8018543, 1.726579, 1, 1, 1, 1, 1,
0.4119827, 0.5381559, -2.346363, 1, 1, 1, 1, 1,
0.4122085, 2.434999, -0.6467368, 1, 1, 1, 1, 1,
0.4140691, -0.48862, 1.925503, 0, 0, 1, 1, 1,
0.4165989, -0.4018982, 4.678575, 1, 0, 0, 1, 1,
0.4196585, 0.939461, 0.3865039, 1, 0, 0, 1, 1,
0.4257734, 0.7353361, -0.4407668, 1, 0, 0, 1, 1,
0.4303598, 1.737109, 0.9925488, 1, 0, 0, 1, 1,
0.4365179, -0.6683508, 1.875575, 1, 0, 0, 1, 1,
0.4374824, 0.2931047, 1.014185, 0, 0, 0, 1, 1,
0.4390062, -2.55654, 2.907174, 0, 0, 0, 1, 1,
0.4398267, 0.6539357, 0.6849552, 0, 0, 0, 1, 1,
0.4410214, 0.658249, 1.431589, 0, 0, 0, 1, 1,
0.442588, 0.5849682, 0.0837004, 0, 0, 0, 1, 1,
0.443424, 0.9878002, 0.2213177, 0, 0, 0, 1, 1,
0.4502681, 0.3640176, -0.1332003, 0, 0, 0, 1, 1,
0.4506786, 0.2861308, 0.9165331, 1, 1, 1, 1, 1,
0.4532254, -0.2583902, 2.613129, 1, 1, 1, 1, 1,
0.4557801, 2.067693, 0.3095863, 1, 1, 1, 1, 1,
0.4585627, -0.4881725, 1.096963, 1, 1, 1, 1, 1,
0.4615513, 1.029199, -0.05738632, 1, 1, 1, 1, 1,
0.4615553, 0.8393561, 1.324437, 1, 1, 1, 1, 1,
0.4631878, -1.176137, 2.459621, 1, 1, 1, 1, 1,
0.4653855, 0.7319541, 1.197506, 1, 1, 1, 1, 1,
0.4676664, 0.7342969, 1.711863, 1, 1, 1, 1, 1,
0.4677969, 0.137249, 1.402865, 1, 1, 1, 1, 1,
0.4695101, -1.185924, 2.384582, 1, 1, 1, 1, 1,
0.4725859, 0.2986068, 1.140174, 1, 1, 1, 1, 1,
0.4802835, -0.5918934, 3.796784, 1, 1, 1, 1, 1,
0.4859162, -0.7630159, 2.180698, 1, 1, 1, 1, 1,
0.4905569, -1.218857, 2.191828, 1, 1, 1, 1, 1,
0.498873, 1.326292, 0.4095974, 0, 0, 1, 1, 1,
0.5015023, -0.8443793, 3.533062, 1, 0, 0, 1, 1,
0.5031049, 1.485374, 0.9632458, 1, 0, 0, 1, 1,
0.5037515, -1.516816, 5.576304, 1, 0, 0, 1, 1,
0.5082462, 0.4304626, 1.660828, 1, 0, 0, 1, 1,
0.5096603, -0.5579494, 0.9788018, 1, 0, 0, 1, 1,
0.5104271, 1.268455, -0.8564433, 0, 0, 0, 1, 1,
0.5118231, 0.5368432, -0.08476551, 0, 0, 0, 1, 1,
0.5125356, 0.9560527, 0.734499, 0, 0, 0, 1, 1,
0.5145533, -0.256728, 2.115967, 0, 0, 0, 1, 1,
0.5182416, -0.2198954, 2.600857, 0, 0, 0, 1, 1,
0.5200405, 0.69081, -0.9677318, 0, 0, 0, 1, 1,
0.5207064, 0.7728179, -0.303975, 0, 0, 0, 1, 1,
0.5295262, 1.511158, -0.1265459, 1, 1, 1, 1, 1,
0.5333852, 0.5682412, 1.970547, 1, 1, 1, 1, 1,
0.5379953, 1.677151, -0.1968837, 1, 1, 1, 1, 1,
0.5401599, 1.272535, 3.589798, 1, 1, 1, 1, 1,
0.5416418, 1.098377, -0.004604543, 1, 1, 1, 1, 1,
0.5449178, -1.089303, 2.252815, 1, 1, 1, 1, 1,
0.5450628, 0.1317119, 1.184146, 1, 1, 1, 1, 1,
0.5523716, -1.758953, 3.348811, 1, 1, 1, 1, 1,
0.5525633, -1.73799, 4.669329, 1, 1, 1, 1, 1,
0.5548375, -0.3901672, 1.184419, 1, 1, 1, 1, 1,
0.5572342, 1.791515, 0.5431511, 1, 1, 1, 1, 1,
0.5575494, -0.0907913, 2.484727, 1, 1, 1, 1, 1,
0.558513, -2.9898, 3.085173, 1, 1, 1, 1, 1,
0.5623602, 0.4785338, 0.2211276, 1, 1, 1, 1, 1,
0.5643295, -1.227103, 3.143324, 1, 1, 1, 1, 1,
0.5680506, 0.271406, 0.8632454, 0, 0, 1, 1, 1,
0.5688748, 1.976212, 0.1550439, 1, 0, 0, 1, 1,
0.5777703, 0.766008, 1.8541, 1, 0, 0, 1, 1,
0.579347, 0.635816, 0.9659715, 1, 0, 0, 1, 1,
0.5873429, 1.34815, -2.49761, 1, 0, 0, 1, 1,
0.5874022, 2.851373, 0.7922784, 1, 0, 0, 1, 1,
0.5914545, 0.0490433, -0.02665635, 0, 0, 0, 1, 1,
0.5918738, -1.790688, 1.315264, 0, 0, 0, 1, 1,
0.5961977, 0.7343463, 0.02945995, 0, 0, 0, 1, 1,
0.5980995, -0.2269061, 1.564312, 0, 0, 0, 1, 1,
0.5988901, -0.8372371, 1.873056, 0, 0, 0, 1, 1,
0.6077852, 0.9065766, 1.116235, 0, 0, 0, 1, 1,
0.6134744, -1.527638, 2.241681, 0, 0, 0, 1, 1,
0.6237417, -1.995154, 3.941163, 1, 1, 1, 1, 1,
0.629585, 0.0556639, 0.4264292, 1, 1, 1, 1, 1,
0.6300292, -0.1529322, 0.5778005, 1, 1, 1, 1, 1,
0.6309155, -1.013883, 3.105549, 1, 1, 1, 1, 1,
0.6309449, 1.143563, -0.008016312, 1, 1, 1, 1, 1,
0.6454655, -1.581301, 2.791999, 1, 1, 1, 1, 1,
0.6469314, 1.541603, 0.6788086, 1, 1, 1, 1, 1,
0.648561, -1.013438, 2.264148, 1, 1, 1, 1, 1,
0.6514775, -0.4306314, 1.792149, 1, 1, 1, 1, 1,
0.6531933, 0.04930209, 2.656055, 1, 1, 1, 1, 1,
0.6546292, -0.8416949, 3.827554, 1, 1, 1, 1, 1,
0.6636186, 0.7114663, 1.942818, 1, 1, 1, 1, 1,
0.6636695, 0.7929609, 0.6440663, 1, 1, 1, 1, 1,
0.6641141, -0.8927985, 2.723645, 1, 1, 1, 1, 1,
0.6643073, 0.004607552, 0.289316, 1, 1, 1, 1, 1,
0.6647602, -0.4292192, 2.322179, 0, 0, 1, 1, 1,
0.6681605, 0.05745229, 1.388211, 1, 0, 0, 1, 1,
0.6701712, -1.115902, 2.118833, 1, 0, 0, 1, 1,
0.6707555, -0.1755828, 0.2969302, 1, 0, 0, 1, 1,
0.6722305, -2.087454, 2.25216, 1, 0, 0, 1, 1,
0.6726463, 0.624667, 0.1446036, 1, 0, 0, 1, 1,
0.6732806, 0.7227479, 0.8152509, 0, 0, 0, 1, 1,
0.6738566, 1.21327, -1.012589, 0, 0, 0, 1, 1,
0.676263, 0.5530502, 1.010482, 0, 0, 0, 1, 1,
0.6779274, 0.9120207, 0.9232398, 0, 0, 0, 1, 1,
0.6799695, -0.09409403, 3.717015, 0, 0, 0, 1, 1,
0.682447, 1.177406, 1.943929, 0, 0, 0, 1, 1,
0.6850768, -0.4014153, 2.20531, 0, 0, 0, 1, 1,
0.6886018, 0.07516656, 1.098857, 1, 1, 1, 1, 1,
0.6924943, 1.479837, 0.7678685, 1, 1, 1, 1, 1,
0.6962528, -1.174781, 3.751501, 1, 1, 1, 1, 1,
0.6993749, -0.4563874, 3.530731, 1, 1, 1, 1, 1,
0.6998641, -0.9459122, 1.739484, 1, 1, 1, 1, 1,
0.7003137, 1.972351, 1.061965, 1, 1, 1, 1, 1,
0.7017096, -0.4529904, 1.320187, 1, 1, 1, 1, 1,
0.7030985, -0.1863214, 2.555981, 1, 1, 1, 1, 1,
0.703351, 0.1332191, 1.686163, 1, 1, 1, 1, 1,
0.7046437, -0.3402497, 2.179924, 1, 1, 1, 1, 1,
0.7104688, 0.4458462, 0.8692006, 1, 1, 1, 1, 1,
0.7110456, 0.1469249, 1.083884, 1, 1, 1, 1, 1,
0.7152262, -1.864617, 2.991412, 1, 1, 1, 1, 1,
0.7168333, -0.5922612, 1.80492, 1, 1, 1, 1, 1,
0.7186768, -0.09726055, 2.795025, 1, 1, 1, 1, 1,
0.7207876, -0.679437, 2.902665, 0, 0, 1, 1, 1,
0.7240233, -1.313109, 3.487462, 1, 0, 0, 1, 1,
0.7291805, -1.792039, 0.8190739, 1, 0, 0, 1, 1,
0.7347506, -2.517572, 2.909166, 1, 0, 0, 1, 1,
0.7380916, 0.05630551, 2.890263, 1, 0, 0, 1, 1,
0.7385808, -2.074097, 2.390671, 1, 0, 0, 1, 1,
0.7402737, -0.9510321, 2.295749, 0, 0, 0, 1, 1,
0.7535177, -0.5289739, 1.161975, 0, 0, 0, 1, 1,
0.759419, -0.08772068, 1.407714, 0, 0, 0, 1, 1,
0.7601271, 0.3645308, -0.3179914, 0, 0, 0, 1, 1,
0.780603, 0.6474416, 0.2228846, 0, 0, 0, 1, 1,
0.7834697, 0.9769154, -1.295934, 0, 0, 0, 1, 1,
0.7851731, -0.5932655, 3.662917, 0, 0, 0, 1, 1,
0.7855043, 0.8112139, 0.2935139, 1, 1, 1, 1, 1,
0.7858902, 0.4346063, -0.007705551, 1, 1, 1, 1, 1,
0.7904195, 1.618007, 0.8110777, 1, 1, 1, 1, 1,
0.8061116, 1.114133, 1.426253, 1, 1, 1, 1, 1,
0.8077242, 1.831633, 0.8278447, 1, 1, 1, 1, 1,
0.8116509, 0.007687084, 2.405886, 1, 1, 1, 1, 1,
0.8124818, -0.7717728, 2.263686, 1, 1, 1, 1, 1,
0.8171751, 0.5883194, 0.7883491, 1, 1, 1, 1, 1,
0.8173195, 0.8368511, -0.4241964, 1, 1, 1, 1, 1,
0.8272073, 0.1686586, 1.485112, 1, 1, 1, 1, 1,
0.8284929, 3.28255, 0.9783311, 1, 1, 1, 1, 1,
0.8299024, -0.7695819, 4.887473, 1, 1, 1, 1, 1,
0.8314211, -0.07028512, 0.1106008, 1, 1, 1, 1, 1,
0.8486406, -0.8990701, 3.272646, 1, 1, 1, 1, 1,
0.850112, -0.2939639, 0.8668726, 1, 1, 1, 1, 1,
0.8502497, 0.298145, 0.9793126, 0, 0, 1, 1, 1,
0.8538911, -0.5535344, 1.899497, 1, 0, 0, 1, 1,
0.8543414, -0.05403145, 2.788198, 1, 0, 0, 1, 1,
0.8562948, 0.1064357, 2.247323, 1, 0, 0, 1, 1,
0.8582218, 0.737532, 1.839141, 1, 0, 0, 1, 1,
0.863717, 2.02871, 0.5262064, 1, 0, 0, 1, 1,
0.8653412, 1.788944, -0.5765305, 0, 0, 0, 1, 1,
0.8712673, -0.2300452, 2.976281, 0, 0, 0, 1, 1,
0.8745613, 1.262499, 0.2206461, 0, 0, 0, 1, 1,
0.8747321, -0.4091817, 2.032074, 0, 0, 0, 1, 1,
0.8782371, -0.3923564, 0.711848, 0, 0, 0, 1, 1,
0.8834569, -0.6348884, 1.191826, 0, 0, 0, 1, 1,
0.8842141, 0.2860737, 1.738273, 0, 0, 0, 1, 1,
0.8847433, -3.043025, 3.269569, 1, 1, 1, 1, 1,
0.8971534, -0.7231344, 3.27161, 1, 1, 1, 1, 1,
0.9021035, -1.254611, 3.093575, 1, 1, 1, 1, 1,
0.902715, -0.2885944, 1.832262, 1, 1, 1, 1, 1,
0.9052944, -1.282173, 3.214674, 1, 1, 1, 1, 1,
0.9077314, 0.6149265, 2.830756, 1, 1, 1, 1, 1,
0.9078874, 2.110265, 0.5369901, 1, 1, 1, 1, 1,
0.9087607, -1.653453, 3.241684, 1, 1, 1, 1, 1,
0.9134887, -1.730804, 3.948825, 1, 1, 1, 1, 1,
0.9158283, 0.007391702, 0.8005909, 1, 1, 1, 1, 1,
0.9248043, -0.1657177, 1.339907, 1, 1, 1, 1, 1,
0.9289674, -1.513705, 3.605265, 1, 1, 1, 1, 1,
0.9315706, -1.013102, 2.53497, 1, 1, 1, 1, 1,
0.9346449, 1.112801, 0.1938286, 1, 1, 1, 1, 1,
0.9349238, -0.4368138, 2.849268, 1, 1, 1, 1, 1,
0.9433149, -0.8530372, 4.185759, 0, 0, 1, 1, 1,
0.9498484, 2.026308, 0.774674, 1, 0, 0, 1, 1,
0.9605359, -0.4422784, 1.427583, 1, 0, 0, 1, 1,
0.9610534, 2.247674, 0.0413222, 1, 0, 0, 1, 1,
0.9612879, 0.07281116, 1.650086, 1, 0, 0, 1, 1,
0.9690465, -0.7447413, 2.410733, 1, 0, 0, 1, 1,
0.9738125, -0.4237605, 0.9962904, 0, 0, 0, 1, 1,
0.9824775, -1.101909, 2.093792, 0, 0, 0, 1, 1,
1.002831, 0.1072882, 2.629356, 0, 0, 0, 1, 1,
1.003076, -0.8619125, 3.823267, 0, 0, 0, 1, 1,
1.005802, -1.986238, 2.767023, 0, 0, 0, 1, 1,
1.006984, -1.413933, 2.575569, 0, 0, 0, 1, 1,
1.008329, -0.2345424, 0.6885262, 0, 0, 0, 1, 1,
1.013927, 0.02473226, 3.003395, 1, 1, 1, 1, 1,
1.022343, -0.9519897, 2.702483, 1, 1, 1, 1, 1,
1.024361, -0.9735505, 2.423774, 1, 1, 1, 1, 1,
1.026744, 1.149361, 1.835848, 1, 1, 1, 1, 1,
1.02802, 0.8269203, 0.2626833, 1, 1, 1, 1, 1,
1.031493, -0.3976179, 2.330729, 1, 1, 1, 1, 1,
1.032138, -0.1421434, 2.319824, 1, 1, 1, 1, 1,
1.038335, 1.097151, 1.938961, 1, 1, 1, 1, 1,
1.046934, 0.1740835, 0.1666263, 1, 1, 1, 1, 1,
1.057861, -0.2014829, 2.004546, 1, 1, 1, 1, 1,
1.058396, 0.965224, 1.463514, 1, 1, 1, 1, 1,
1.059466, -1.841909, 3.392734, 1, 1, 1, 1, 1,
1.06065, -0.01825205, 2.505403, 1, 1, 1, 1, 1,
1.064288, 0.4595052, 2.375881, 1, 1, 1, 1, 1,
1.064523, 0.5702222, -0.6063795, 1, 1, 1, 1, 1,
1.068639, -2.962147, 4.254822, 0, 0, 1, 1, 1,
1.069313, 0.8313752, 1.033332, 1, 0, 0, 1, 1,
1.069961, 1.624627, -0.5802284, 1, 0, 0, 1, 1,
1.074924, -1.095083, 2.936113, 1, 0, 0, 1, 1,
1.075752, 0.6865497, 0.9416516, 1, 0, 0, 1, 1,
1.076722, -0.3008019, 2.992849, 1, 0, 0, 1, 1,
1.079871, 0.616661, 1.121572, 0, 0, 0, 1, 1,
1.081001, 0.1270018, 2.258418, 0, 0, 0, 1, 1,
1.08661, 1.493389, 2.138502, 0, 0, 0, 1, 1,
1.095708, 1.071693, 0.4187129, 0, 0, 0, 1, 1,
1.099873, -0.9957967, 1.14265, 0, 0, 0, 1, 1,
1.109929, -1.571825, 3.59259, 0, 0, 0, 1, 1,
1.123717, 1.761317, 0.524342, 0, 0, 0, 1, 1,
1.131389, -1.45334, 1.456228, 1, 1, 1, 1, 1,
1.137731, 1.057372, 0.515022, 1, 1, 1, 1, 1,
1.139906, 1.337035, 1.341291, 1, 1, 1, 1, 1,
1.142365, -2.065564, 2.039755, 1, 1, 1, 1, 1,
1.15465, -0.6332381, 1.488736, 1, 1, 1, 1, 1,
1.167583, -0.03206589, 2.416857, 1, 1, 1, 1, 1,
1.173707, 1.99147, -0.8667492, 1, 1, 1, 1, 1,
1.174197, 1.782212, 1.048937, 1, 1, 1, 1, 1,
1.175164, -0.1990006, 3.788717, 1, 1, 1, 1, 1,
1.180936, -0.09815497, 2.254989, 1, 1, 1, 1, 1,
1.184114, 1.675563, 0.917134, 1, 1, 1, 1, 1,
1.188114, 0.4482816, 1.064269, 1, 1, 1, 1, 1,
1.200495, -1.027699, 1.506837, 1, 1, 1, 1, 1,
1.208215, 0.350337, 3.638672, 1, 1, 1, 1, 1,
1.213656, -0.4095379, 1.769668, 1, 1, 1, 1, 1,
1.219925, 1.219965, 2.381885, 0, 0, 1, 1, 1,
1.225507, -0.009885957, 2.218786, 1, 0, 0, 1, 1,
1.22633, -0.2010777, 1.047593, 1, 0, 0, 1, 1,
1.229361, 0.3437736, 1.241732, 1, 0, 0, 1, 1,
1.232013, -0.1291068, 1.224915, 1, 0, 0, 1, 1,
1.236158, 1.13721, -0.1718797, 1, 0, 0, 1, 1,
1.237194, -0.851927, 2.548656, 0, 0, 0, 1, 1,
1.241033, -0.5119734, 2.712075, 0, 0, 0, 1, 1,
1.241574, 2.224022, 0.352695, 0, 0, 0, 1, 1,
1.24301, -0.6739992, 2.691782, 0, 0, 0, 1, 1,
1.246648, 0.2424272, -0.39069, 0, 0, 0, 1, 1,
1.248447, -1.240901, 1.263673, 0, 0, 0, 1, 1,
1.251115, -0.2062024, 2.247919, 0, 0, 0, 1, 1,
1.2537, 0.7081233, 0.5677234, 1, 1, 1, 1, 1,
1.259794, -0.6370308, 1.984997, 1, 1, 1, 1, 1,
1.266318, 0.839811, 0.9469358, 1, 1, 1, 1, 1,
1.272777, 0.350233, 2.019565, 1, 1, 1, 1, 1,
1.275574, -0.4775013, 2.317688, 1, 1, 1, 1, 1,
1.275824, -1.052795, 2.755606, 1, 1, 1, 1, 1,
1.288029, -0.3934295, 1.50455, 1, 1, 1, 1, 1,
1.294995, -1.24445, 0.8371738, 1, 1, 1, 1, 1,
1.30422, -2.962318, 2.432621, 1, 1, 1, 1, 1,
1.32385, -2.312017, 1.605478, 1, 1, 1, 1, 1,
1.327348, 1.10122, 0.8516523, 1, 1, 1, 1, 1,
1.333063, 0.7293116, 0.1278014, 1, 1, 1, 1, 1,
1.341985, -1.028179, 2.948448, 1, 1, 1, 1, 1,
1.349202, 0.3851997, 1.471974, 1, 1, 1, 1, 1,
1.349915, -1.141156, 1.931312, 1, 1, 1, 1, 1,
1.350311, -1.886609, 1.031827, 0, 0, 1, 1, 1,
1.35122, -0.3352873, 2.589059, 1, 0, 0, 1, 1,
1.361039, 0.2920062, 2.390588, 1, 0, 0, 1, 1,
1.37232, -0.8329378, 2.873263, 1, 0, 0, 1, 1,
1.373241, -1.085576, 1.503656, 1, 0, 0, 1, 1,
1.378715, 0.5145353, 2.016045, 1, 0, 0, 1, 1,
1.380927, 0.1356035, 1.277429, 0, 0, 0, 1, 1,
1.385043, -0.2203179, 2.606751, 0, 0, 0, 1, 1,
1.389206, 0.1567501, 1.533862, 0, 0, 0, 1, 1,
1.390752, 0.659227, 0.5349858, 0, 0, 0, 1, 1,
1.396031, -0.03107801, 2.296008, 0, 0, 0, 1, 1,
1.421206, 1.267335, 0.170639, 0, 0, 0, 1, 1,
1.431357, 0.1788404, 2.420735, 0, 0, 0, 1, 1,
1.442272, -1.279978, 2.790628, 1, 1, 1, 1, 1,
1.453734, 0.9109992, 1.957288, 1, 1, 1, 1, 1,
1.469951, 0.9140493, 1.532926, 1, 1, 1, 1, 1,
1.475656, -0.3371845, 1.925048, 1, 1, 1, 1, 1,
1.481112, 1.867851, 0.3406675, 1, 1, 1, 1, 1,
1.482164, 0.3155749, 2.092995, 1, 1, 1, 1, 1,
1.490895, 0.3562626, 2.027463, 1, 1, 1, 1, 1,
1.493001, -1.608698, 2.589678, 1, 1, 1, 1, 1,
1.495411, 1.848858, 0.04695144, 1, 1, 1, 1, 1,
1.502461, 0.7241485, -0.2102095, 1, 1, 1, 1, 1,
1.50387, -0.1926457, 2.971915, 1, 1, 1, 1, 1,
1.524705, 1.503033, 0.230346, 1, 1, 1, 1, 1,
1.526589, 1.06731, 0.6846308, 1, 1, 1, 1, 1,
1.530506, -0.1479427, 1.699465, 1, 1, 1, 1, 1,
1.532508, 0.2863526, 1.24283, 1, 1, 1, 1, 1,
1.538362, 2.107341, 1.210395, 0, 0, 1, 1, 1,
1.541885, -0.1539369, 0.04812909, 1, 0, 0, 1, 1,
1.543062, 0.1166595, 1.440238, 1, 0, 0, 1, 1,
1.544638, 0.6091601, 1.072844, 1, 0, 0, 1, 1,
1.545886, -1.163225, 1.107082, 1, 0, 0, 1, 1,
1.553309, -0.6337573, 2.753451, 1, 0, 0, 1, 1,
1.555917, -0.2625647, 0.01479171, 0, 0, 0, 1, 1,
1.556711, -1.138947, 2.882386, 0, 0, 0, 1, 1,
1.562522, 0.6995021, 2.482384, 0, 0, 0, 1, 1,
1.584309, 0.5385651, 1.413385, 0, 0, 0, 1, 1,
1.593561, 0.07195473, 1.618337, 0, 0, 0, 1, 1,
1.60353, -0.5198937, 0.8790345, 0, 0, 0, 1, 1,
1.607859, 0.9563562, 0.6197863, 0, 0, 0, 1, 1,
1.61569, -0.7660061, 0.6585429, 1, 1, 1, 1, 1,
1.631662, 0.7115645, 0.609547, 1, 1, 1, 1, 1,
1.634567, 1.087849, -0.7794967, 1, 1, 1, 1, 1,
1.638961, -1.202017, 2.543574, 1, 1, 1, 1, 1,
1.646725, -1.084451, 2.162609, 1, 1, 1, 1, 1,
1.651698, 0.8514717, 1.776371, 1, 1, 1, 1, 1,
1.665895, -0.1206601, 0.8373039, 1, 1, 1, 1, 1,
1.666099, -0.3066351, 1.143127, 1, 1, 1, 1, 1,
1.667685, -1.220443, 1.606108, 1, 1, 1, 1, 1,
1.69397, -0.1322247, 1.075922, 1, 1, 1, 1, 1,
1.694976, 0.6430138, 1.391474, 1, 1, 1, 1, 1,
1.700865, -1.632479, 3.218029, 1, 1, 1, 1, 1,
1.703033, 0.9881862, 1.270433, 1, 1, 1, 1, 1,
1.721401, 0.1400251, 1.481448, 1, 1, 1, 1, 1,
1.723096, 0.7872127, 2.61519, 1, 1, 1, 1, 1,
1.724445, -0.1692638, 5.334856, 0, 0, 1, 1, 1,
1.73349, 0.04562664, 3.144946, 1, 0, 0, 1, 1,
1.750074, 1.334505, 1.641275, 1, 0, 0, 1, 1,
1.751611, 1.001362, 0.436573, 1, 0, 0, 1, 1,
1.761652, -0.3428327, 1.939425, 1, 0, 0, 1, 1,
1.764126, -1.503185, 1.452604, 1, 0, 0, 1, 1,
1.793712, -1.159232, 2.470172, 0, 0, 0, 1, 1,
1.814336, 1.641812, 1.405137, 0, 0, 0, 1, 1,
1.817091, 0.2823393, 1.317762, 0, 0, 0, 1, 1,
1.840237, -0.2160698, 2.871277, 0, 0, 0, 1, 1,
1.906224, -0.5699418, 1.653538, 0, 0, 0, 1, 1,
1.915148, -0.6379431, 1.377438, 0, 0, 0, 1, 1,
1.936613, 1.986383, -0.1160157, 0, 0, 0, 1, 1,
1.945909, -0.008408136, 1.640601, 1, 1, 1, 1, 1,
1.95119, -0.3742246, 2.32456, 1, 1, 1, 1, 1,
1.956749, 0.09216241, 1.735511, 1, 1, 1, 1, 1,
1.963874, 1.561169, 0.9891318, 1, 1, 1, 1, 1,
1.971778, 0.05315454, 1.617765, 1, 1, 1, 1, 1,
1.988239, -2.985506, 3.193656, 1, 1, 1, 1, 1,
2.03421, -0.4482374, 0.3262388, 1, 1, 1, 1, 1,
2.047583, -2.321193, 3.745109, 1, 1, 1, 1, 1,
2.059151, 0.287625, 1.589778, 1, 1, 1, 1, 1,
2.067258, 0.6915749, 2.915137, 1, 1, 1, 1, 1,
2.074509, -0.07165442, 2.651264, 1, 1, 1, 1, 1,
2.10985, 0.8803909, -0.1605542, 1, 1, 1, 1, 1,
2.1294, 1.742477, 1.837954, 1, 1, 1, 1, 1,
2.163518, 0.836631, 2.830801, 1, 1, 1, 1, 1,
2.19589, -2.763726, 0.2190871, 1, 1, 1, 1, 1,
2.251692, 0.9088134, 1.864277, 0, 0, 1, 1, 1,
2.263674, -0.3223214, 0.8585724, 1, 0, 0, 1, 1,
2.268784, 1.319537, 0.6306612, 1, 0, 0, 1, 1,
2.296501, 0.8768964, 1.40605, 1, 0, 0, 1, 1,
2.311351, -1.231819, 2.599843, 1, 0, 0, 1, 1,
2.326642, 0.5913476, 0.495784, 1, 0, 0, 1, 1,
2.349208, 0.5191069, 1.982108, 0, 0, 0, 1, 1,
2.392203, -0.7720817, 2.620321, 0, 0, 0, 1, 1,
2.436338, -0.630381, 1.583739, 0, 0, 0, 1, 1,
2.446013, -0.1168064, 3.960654, 0, 0, 0, 1, 1,
2.458843, -0.2513862, 4.343797, 0, 0, 0, 1, 1,
2.468306, -0.9905038, -0.04128088, 0, 0, 0, 1, 1,
2.686218, -0.8660867, 0.4561925, 0, 0, 0, 1, 1,
2.699984, 0.6980969, 2.27071, 1, 1, 1, 1, 1,
2.700388, -0.6365382, 2.514115, 1, 1, 1, 1, 1,
2.747345, 0.5320693, 1.749658, 1, 1, 1, 1, 1,
2.779728, -2.309514, 1.155328, 1, 1, 1, 1, 1,
2.824205, 2.308964, 2.949427, 1, 1, 1, 1, 1,
3.140505, -0.4922548, 2.82333, 1, 1, 1, 1, 1,
3.43675, -0.3902369, 2.269955, 1, 1, 1, 1, 1
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
var radius = 9.694545;
var distance = 34.05168;
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
mvMatrix.translate( -0.05998588, -0.1699181, -0.556334 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05168);
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
