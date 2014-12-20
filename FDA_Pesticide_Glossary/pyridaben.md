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
-2.75064, -1.149682, -3.067782, 1, 0, 0, 1,
-2.616248, 1.315707, -3.232018, 1, 0.007843138, 0, 1,
-2.548664, 1.164034, -1.186288, 1, 0.01176471, 0, 1,
-2.543241, -2.338469, -0.7428621, 1, 0.01960784, 0, 1,
-2.512298, -1.199211, -2.41977, 1, 0.02352941, 0, 1,
-2.460164, 0.07264009, 0.461484, 1, 0.03137255, 0, 1,
-2.395697, -0.0573558, 0.4133274, 1, 0.03529412, 0, 1,
-2.395238, -0.8882978, -1.801593, 1, 0.04313726, 0, 1,
-2.373172, 0.117074, -2.354689, 1, 0.04705882, 0, 1,
-2.358245, 1.227366, -0.4660293, 1, 0.05490196, 0, 1,
-2.326147, -1.104184, -3.15856, 1, 0.05882353, 0, 1,
-2.213827, 0.5723492, -1.226515, 1, 0.06666667, 0, 1,
-2.21083, 0.7074065, -1.477176, 1, 0.07058824, 0, 1,
-2.163943, 0.9889355, 1.270726, 1, 0.07843138, 0, 1,
-2.154012, 0.6899025, -2.031431, 1, 0.08235294, 0, 1,
-2.140709, 0.091028, -1.917691, 1, 0.09019608, 0, 1,
-2.121701, 0.9117616, -0.4876073, 1, 0.09411765, 0, 1,
-2.080823, -1.106936, -2.75398, 1, 0.1019608, 0, 1,
-2.067625, -1.259112, -0.4150265, 1, 0.1098039, 0, 1,
-2.022536, 0.8751753, -0.9960837, 1, 0.1137255, 0, 1,
-2.022481, -1.966033, -3.681567, 1, 0.1215686, 0, 1,
-2.002018, 0.9655462, -3.65454, 1, 0.1254902, 0, 1,
-1.951539, -0.1955483, -1.995355, 1, 0.1333333, 0, 1,
-1.906232, 1.777117, -1.750226, 1, 0.1372549, 0, 1,
-1.891721, -0.06307819, -1.948896, 1, 0.145098, 0, 1,
-1.856996, -1.672376, -0.2307955, 1, 0.1490196, 0, 1,
-1.854108, 1.30088, -1.658404, 1, 0.1568628, 0, 1,
-1.846423, 0.5991905, -0.7643893, 1, 0.1607843, 0, 1,
-1.838736, 1.254837, -1.495366, 1, 0.1686275, 0, 1,
-1.821945, -1.704746, -0.8777939, 1, 0.172549, 0, 1,
-1.819592, -0.5067535, -1.900335, 1, 0.1803922, 0, 1,
-1.802206, 2.212824, 0.6951135, 1, 0.1843137, 0, 1,
-1.788746, -0.1477015, -2.488765, 1, 0.1921569, 0, 1,
-1.785303, -0.9854187, -1.009978, 1, 0.1960784, 0, 1,
-1.782984, 1.815801, -2.675354, 1, 0.2039216, 0, 1,
-1.757843, -1.091813, -3.22561, 1, 0.2117647, 0, 1,
-1.753138, 0.4764189, -2.327816, 1, 0.2156863, 0, 1,
-1.725213, 0.08573896, -1.056335, 1, 0.2235294, 0, 1,
-1.721581, -0.1392093, -1.372136, 1, 0.227451, 0, 1,
-1.713554, 0.383635, -0.8757939, 1, 0.2352941, 0, 1,
-1.700377, 0.4465335, -0.9175566, 1, 0.2392157, 0, 1,
-1.692601, 2.141216, -0.3652725, 1, 0.2470588, 0, 1,
-1.688351, 1.727141, 0.3713776, 1, 0.2509804, 0, 1,
-1.68041, -0.2021808, 0.05778303, 1, 0.2588235, 0, 1,
-1.68035, 0.1867201, -1.230755, 1, 0.2627451, 0, 1,
-1.672785, 1.443079, -1.305048, 1, 0.2705882, 0, 1,
-1.657758, 1.282625, -0.9631823, 1, 0.2745098, 0, 1,
-1.643617, 0.6855496, 0.3575267, 1, 0.282353, 0, 1,
-1.640784, 0.5338218, -1.421373, 1, 0.2862745, 0, 1,
-1.639883, 0.8297909, -3.510537, 1, 0.2941177, 0, 1,
-1.622185, -1.057595, -2.49464, 1, 0.3019608, 0, 1,
-1.620975, 0.3383936, -1.327101, 1, 0.3058824, 0, 1,
-1.612763, -2.446836, -2.519659, 1, 0.3137255, 0, 1,
-1.608057, -0.7714439, -1.385867, 1, 0.3176471, 0, 1,
-1.595372, 0.4796921, -1.646678, 1, 0.3254902, 0, 1,
-1.591414, -0.4270952, -2.115464, 1, 0.3294118, 0, 1,
-1.589893, 0.8202045, -0.8003736, 1, 0.3372549, 0, 1,
-1.582262, -0.5463882, -1.822729, 1, 0.3411765, 0, 1,
-1.57489, 0.688059, -1.239726, 1, 0.3490196, 0, 1,
-1.574504, -0.1951116, -1.634565, 1, 0.3529412, 0, 1,
-1.56118, 0.4310245, 0.4264247, 1, 0.3607843, 0, 1,
-1.559911, 0.6056833, -0.2010598, 1, 0.3647059, 0, 1,
-1.556432, 0.9510504, -2.055118, 1, 0.372549, 0, 1,
-1.548692, 1.109692, -2.215371, 1, 0.3764706, 0, 1,
-1.543784, -1.636894, -1.750072, 1, 0.3843137, 0, 1,
-1.534404, 0.6215786, -2.380987, 1, 0.3882353, 0, 1,
-1.530107, 0.2370578, -1.994159, 1, 0.3960784, 0, 1,
-1.52914, 0.714456, -3.164881, 1, 0.4039216, 0, 1,
-1.524795, -0.06693326, -1.245212, 1, 0.4078431, 0, 1,
-1.514726, 1.952012, -1.894851, 1, 0.4156863, 0, 1,
-1.514105, -1.224233, -4.405151, 1, 0.4196078, 0, 1,
-1.502338, 1.282649, -0.9770281, 1, 0.427451, 0, 1,
-1.500883, 0.3766374, -1.562668, 1, 0.4313726, 0, 1,
-1.493963, -0.7430376, -1.292447, 1, 0.4392157, 0, 1,
-1.483952, 0.06340136, -0.87858, 1, 0.4431373, 0, 1,
-1.47289, -1.632555, -3.424858, 1, 0.4509804, 0, 1,
-1.470955, 1.602437, -0.182891, 1, 0.454902, 0, 1,
-1.468483, 0.3985191, -1.678489, 1, 0.4627451, 0, 1,
-1.464926, 0.3687069, -2.564295, 1, 0.4666667, 0, 1,
-1.428246, -0.4355196, -2.126552, 1, 0.4745098, 0, 1,
-1.418885, 0.3263337, -1.94536, 1, 0.4784314, 0, 1,
-1.412265, 1.341972, -0.3291898, 1, 0.4862745, 0, 1,
-1.40192, -1.488271, -0.769767, 1, 0.4901961, 0, 1,
-1.391655, -0.006091053, -3.273234, 1, 0.4980392, 0, 1,
-1.388324, -0.5150695, -1.383665, 1, 0.5058824, 0, 1,
-1.386103, -0.9868038, -1.765241, 1, 0.509804, 0, 1,
-1.371538, 0.8597314, -1.641309, 1, 0.5176471, 0, 1,
-1.356825, 1.077791, -1.22631, 1, 0.5215687, 0, 1,
-1.355114, 1.172524, -0.3110355, 1, 0.5294118, 0, 1,
-1.354812, -0.5194661, -5.443773, 1, 0.5333334, 0, 1,
-1.350023, -1.380253, -2.638543, 1, 0.5411765, 0, 1,
-1.344151, 0.5278154, -0.5574601, 1, 0.5450981, 0, 1,
-1.34286, 0.8171034, -1.938182, 1, 0.5529412, 0, 1,
-1.339776, -0.3442034, -0.4722238, 1, 0.5568628, 0, 1,
-1.337873, 0.02011205, -1.77236, 1, 0.5647059, 0, 1,
-1.332915, -0.5622839, -3.347375, 1, 0.5686275, 0, 1,
-1.330471, -0.7447269, -2.062588, 1, 0.5764706, 0, 1,
-1.323197, 0.03798817, -0.3852662, 1, 0.5803922, 0, 1,
-1.321416, 0.2296494, -0.01123164, 1, 0.5882353, 0, 1,
-1.317932, -1.018114, -0.9371515, 1, 0.5921569, 0, 1,
-1.313981, -0.278378, -1.437192, 1, 0.6, 0, 1,
-1.304291, 0.9982148, -1.070616, 1, 0.6078432, 0, 1,
-1.295288, -0.7015998, -1.807062, 1, 0.6117647, 0, 1,
-1.290369, 1.159679, -1.718191, 1, 0.6196079, 0, 1,
-1.285896, -2.622867, -2.273952, 1, 0.6235294, 0, 1,
-1.282906, -2.043714, -2.50191, 1, 0.6313726, 0, 1,
-1.259843, 1.005836, -0.9786208, 1, 0.6352941, 0, 1,
-1.245432, 0.7746854, -0.5175195, 1, 0.6431373, 0, 1,
-1.240518, -1.113916, -2.353503, 1, 0.6470588, 0, 1,
-1.229364, -0.3618512, -2.114061, 1, 0.654902, 0, 1,
-1.221208, 0.6843529, -1.753602, 1, 0.6588235, 0, 1,
-1.220607, 0.8415269, -0.9623453, 1, 0.6666667, 0, 1,
-1.217008, -0.3038757, -3.205458, 1, 0.6705883, 0, 1,
-1.216521, -1.333475, -2.533618, 1, 0.6784314, 0, 1,
-1.201686, 1.244495, -2.052432, 1, 0.682353, 0, 1,
-1.195796, -0.6918877, -1.485501, 1, 0.6901961, 0, 1,
-1.189611, 2.057444, -0.4053558, 1, 0.6941177, 0, 1,
-1.187447, -0.005390007, -0.8870713, 1, 0.7019608, 0, 1,
-1.184047, -0.1737997, -1.61039, 1, 0.7098039, 0, 1,
-1.183008, 0.1992295, -2.702248, 1, 0.7137255, 0, 1,
-1.16218, 0.8532176, 0.2360581, 1, 0.7215686, 0, 1,
-1.153683, -0.4996629, -0.6968601, 1, 0.7254902, 0, 1,
-1.147272, 0.756229, 0.1287747, 1, 0.7333333, 0, 1,
-1.145959, -0.8296114, -2.158853, 1, 0.7372549, 0, 1,
-1.143332, 0.05923747, -2.727975, 1, 0.7450981, 0, 1,
-1.141852, 0.4478588, -0.7697933, 1, 0.7490196, 0, 1,
-1.139058, -1.6582, -1.919869, 1, 0.7568628, 0, 1,
-1.138818, -0.7726002, -1.447249, 1, 0.7607843, 0, 1,
-1.137276, -0.6259595, -2.101377, 1, 0.7686275, 0, 1,
-1.136672, -0.02197914, 0.2328795, 1, 0.772549, 0, 1,
-1.135038, -2.410819, -2.782942, 1, 0.7803922, 0, 1,
-1.13093, 0.5049984, -2.385541, 1, 0.7843137, 0, 1,
-1.130357, -0.9628698, -0.9640643, 1, 0.7921569, 0, 1,
-1.122944, -0.9146338, -3.552577, 1, 0.7960784, 0, 1,
-1.113789, 0.9626286, -2.40523, 1, 0.8039216, 0, 1,
-1.111491, -0.3834206, -2.769156, 1, 0.8117647, 0, 1,
-1.110179, -0.924897, -1.34135, 1, 0.8156863, 0, 1,
-1.108473, -2.320259, -1.638513, 1, 0.8235294, 0, 1,
-1.10471, -0.2546878, -3.042968, 1, 0.827451, 0, 1,
-1.096002, -1.652322, -2.655554, 1, 0.8352941, 0, 1,
-1.092532, -0.4652632, -3.353585, 1, 0.8392157, 0, 1,
-1.083113, 0.03899604, -1.826966, 1, 0.8470588, 0, 1,
-1.070513, -0.564701, -3.022187, 1, 0.8509804, 0, 1,
-1.070117, -0.4092943, -2.222694, 1, 0.8588235, 0, 1,
-1.069587, 0.1523896, -2.299215, 1, 0.8627451, 0, 1,
-1.067466, -0.5851493, -1.977245, 1, 0.8705882, 0, 1,
-1.062691, -0.8545116, -2.521775, 1, 0.8745098, 0, 1,
-1.059839, 0.6107052, -1.686267, 1, 0.8823529, 0, 1,
-1.058399, -1.205349, -2.096955, 1, 0.8862745, 0, 1,
-1.05707, 0.4454803, -0.03469367, 1, 0.8941177, 0, 1,
-1.049606, 0.8847666, 0.1982299, 1, 0.8980392, 0, 1,
-1.049526, 0.8340085, -0.6661554, 1, 0.9058824, 0, 1,
-1.036946, 1.369065, -0.9138902, 1, 0.9137255, 0, 1,
-1.035743, 1.600947, -2.861058, 1, 0.9176471, 0, 1,
-1.033975, -0.3269059, -0.440511, 1, 0.9254902, 0, 1,
-1.033471, 1.096933, -1.216166, 1, 0.9294118, 0, 1,
-1.031312, -1.522876, -2.579136, 1, 0.9372549, 0, 1,
-1.030882, -0.7400479, -1.049089, 1, 0.9411765, 0, 1,
-1.028053, 0.7475266, -0.8120467, 1, 0.9490196, 0, 1,
-1.022172, -0.8594842, -2.127706, 1, 0.9529412, 0, 1,
-1.020999, 0.7208827, -1.989551, 1, 0.9607843, 0, 1,
-1.01136, -0.365802, -2.65609, 1, 0.9647059, 0, 1,
-1.01116, -1.00871, -1.957982, 1, 0.972549, 0, 1,
-1.007792, 0.8171459, -0.3005403, 1, 0.9764706, 0, 1,
-1.007766, -0.3986638, -2.135078, 1, 0.9843137, 0, 1,
-0.991104, 1.480003, -0.2687544, 1, 0.9882353, 0, 1,
-0.9892983, -0.633863, -3.591254, 1, 0.9960784, 0, 1,
-0.9760299, 0.7611198, -1.919966, 0.9960784, 1, 0, 1,
-0.9719362, 2.013514, 0.7032067, 0.9921569, 1, 0, 1,
-0.9691874, 1.549597, -0.9983091, 0.9843137, 1, 0, 1,
-0.9439747, -0.2928287, -1.470012, 0.9803922, 1, 0, 1,
-0.932153, -0.3765799, -2.571167, 0.972549, 1, 0, 1,
-0.918442, -2.120487, -2.482167, 0.9686275, 1, 0, 1,
-0.9077314, 0.01705835, -2.508761, 0.9607843, 1, 0, 1,
-0.9034415, 0.08636759, -1.444374, 0.9568627, 1, 0, 1,
-0.897421, 0.1468606, -1.526719, 0.9490196, 1, 0, 1,
-0.8878492, -0.07203016, -1.486569, 0.945098, 1, 0, 1,
-0.883624, 1.433917, -0.1299237, 0.9372549, 1, 0, 1,
-0.8747424, -0.1062011, -2.741677, 0.9333333, 1, 0, 1,
-0.8740724, -0.963429, -1.341471, 0.9254902, 1, 0, 1,
-0.8729929, -0.322275, -1.229089, 0.9215686, 1, 0, 1,
-0.8723797, -0.7483414, -1.858964, 0.9137255, 1, 0, 1,
-0.8574814, 1.034237, 0.9127979, 0.9098039, 1, 0, 1,
-0.8470241, 0.6720625, 0.6266544, 0.9019608, 1, 0, 1,
-0.841813, -1.27171, -0.8347864, 0.8941177, 1, 0, 1,
-0.8397635, 0.7896882, -0.8980189, 0.8901961, 1, 0, 1,
-0.834798, 0.1124122, -0.9468422, 0.8823529, 1, 0, 1,
-0.8298348, -0.6234887, 0.03811813, 0.8784314, 1, 0, 1,
-0.8190826, 0.2026851, -1.727315, 0.8705882, 1, 0, 1,
-0.8177876, -0.07926717, -0.6682363, 0.8666667, 1, 0, 1,
-0.816874, -0.4478878, -1.967988, 0.8588235, 1, 0, 1,
-0.8140278, 0.2270351, -1.505131, 0.854902, 1, 0, 1,
-0.8074384, -1.500873, -3.2016, 0.8470588, 1, 0, 1,
-0.8035407, -0.3634135, -1.807532, 0.8431373, 1, 0, 1,
-0.8014143, 0.7933902, 0.9284443, 0.8352941, 1, 0, 1,
-0.7912145, 0.7510309, -0.6964735, 0.8313726, 1, 0, 1,
-0.7911811, -0.7885026, -2.480556, 0.8235294, 1, 0, 1,
-0.7843153, -0.2019351, -3.840158, 0.8196079, 1, 0, 1,
-0.783086, -0.6861432, -3.587896, 0.8117647, 1, 0, 1,
-0.782968, -0.027757, -1.380287, 0.8078431, 1, 0, 1,
-0.7792322, 0.02924559, -2.516546, 0.8, 1, 0, 1,
-0.7772083, 0.330497, -0.3098583, 0.7921569, 1, 0, 1,
-0.7767156, -0.2740152, -2.743338, 0.7882353, 1, 0, 1,
-0.7766667, 0.9637591, 0.5393674, 0.7803922, 1, 0, 1,
-0.7725641, 0.8909526, 0.7525882, 0.7764706, 1, 0, 1,
-0.7688931, -0.7656524, -4.271277, 0.7686275, 1, 0, 1,
-0.7675744, 0.6023824, -2.318728, 0.7647059, 1, 0, 1,
-0.745824, 0.4851514, -2.550797, 0.7568628, 1, 0, 1,
-0.7454798, -1.443389, -2.278797, 0.7529412, 1, 0, 1,
-0.7429309, 0.3757734, -1.110777, 0.7450981, 1, 0, 1,
-0.7395707, -1.335721, -2.875047, 0.7411765, 1, 0, 1,
-0.7232007, -1.418893, -1.517192, 0.7333333, 1, 0, 1,
-0.7227223, -0.3156653, -1.815391, 0.7294118, 1, 0, 1,
-0.7181422, -0.8606603, -3.463632, 0.7215686, 1, 0, 1,
-0.7176297, -0.2091995, -0.6320946, 0.7176471, 1, 0, 1,
-0.7175459, 1.929668, -0.1994345, 0.7098039, 1, 0, 1,
-0.7157931, 1.072669, -0.8302259, 0.7058824, 1, 0, 1,
-0.7123678, -0.3000156, -1.893423, 0.6980392, 1, 0, 1,
-0.6979821, -0.1942523, -0.6675965, 0.6901961, 1, 0, 1,
-0.6919043, 1.146576, -1.059605, 0.6862745, 1, 0, 1,
-0.6910533, 1.602575, -0.815655, 0.6784314, 1, 0, 1,
-0.6838082, 1.284995, -1.016143, 0.6745098, 1, 0, 1,
-0.6824903, -1.388088, -2.577626, 0.6666667, 1, 0, 1,
-0.6778138, 0.8339018, -1.049368, 0.6627451, 1, 0, 1,
-0.6747735, -0.5944452, -2.600153, 0.654902, 1, 0, 1,
-0.6744406, 1.218863, -1.333126, 0.6509804, 1, 0, 1,
-0.6737324, -0.735245, -4.195355, 0.6431373, 1, 0, 1,
-0.667996, -0.520198, -0.575257, 0.6392157, 1, 0, 1,
-0.6678523, 0.44713, -0.781857, 0.6313726, 1, 0, 1,
-0.6674834, 1.86539, -0.6023929, 0.627451, 1, 0, 1,
-0.666653, -0.9342585, -2.200925, 0.6196079, 1, 0, 1,
-0.6618229, 0.3012144, -1.452142, 0.6156863, 1, 0, 1,
-0.659773, -0.2304909, -2.202682, 0.6078432, 1, 0, 1,
-0.6589263, 1.533527, 0.5781343, 0.6039216, 1, 0, 1,
-0.6488634, 0.5058903, -0.2580295, 0.5960785, 1, 0, 1,
-0.6468496, -1.24605, -4.231589, 0.5882353, 1, 0, 1,
-0.6439339, 2.330685, 0.3647963, 0.5843138, 1, 0, 1,
-0.6428789, 0.1059729, -1.398271, 0.5764706, 1, 0, 1,
-0.6410905, -0.1737451, -3.430996, 0.572549, 1, 0, 1,
-0.6330271, 0.3627771, -1.45738, 0.5647059, 1, 0, 1,
-0.6289816, -0.8034626, -2.71717, 0.5607843, 1, 0, 1,
-0.6256369, -0.3081321, -3.849624, 0.5529412, 1, 0, 1,
-0.6198509, 0.9582394, -1.362282, 0.5490196, 1, 0, 1,
-0.6130398, 0.4760444, -1.164892, 0.5411765, 1, 0, 1,
-0.6106026, -0.6006767, -1.631182, 0.5372549, 1, 0, 1,
-0.6103288, 0.9283265, 0.6260446, 0.5294118, 1, 0, 1,
-0.6024252, 0.9476827, -1.253656, 0.5254902, 1, 0, 1,
-0.601039, 0.9637671, -2.031694, 0.5176471, 1, 0, 1,
-0.594672, 0.05540448, -0.2452129, 0.5137255, 1, 0, 1,
-0.5945178, -0.7139962, -2.191592, 0.5058824, 1, 0, 1,
-0.5937864, 0.8168318, -1.177925, 0.5019608, 1, 0, 1,
-0.5889537, -1.313849, -2.109835, 0.4941176, 1, 0, 1,
-0.5863184, -0.6511245, -1.355213, 0.4862745, 1, 0, 1,
-0.5833942, 0.2987765, -1.229481, 0.4823529, 1, 0, 1,
-0.582949, 1.2399, -1.451651, 0.4745098, 1, 0, 1,
-0.5791906, -1.240265, -2.197314, 0.4705882, 1, 0, 1,
-0.5743039, 0.8697261, -0.1558303, 0.4627451, 1, 0, 1,
-0.5732355, -0.4684117, -1.906304, 0.4588235, 1, 0, 1,
-0.5721434, -1.376044, -2.561916, 0.4509804, 1, 0, 1,
-0.571018, -0.3695796, -2.612795, 0.4470588, 1, 0, 1,
-0.5702456, -1.279501, -2.60594, 0.4392157, 1, 0, 1,
-0.565524, -1.189712, -4.3442, 0.4352941, 1, 0, 1,
-0.5643663, 0.2042716, -0.01021727, 0.427451, 1, 0, 1,
-0.5588465, -1.331998, -1.046797, 0.4235294, 1, 0, 1,
-0.5544729, -0.5958918, -1.554174, 0.4156863, 1, 0, 1,
-0.5541821, 0.6134524, -1.490604, 0.4117647, 1, 0, 1,
-0.551055, 0.4326004, -0.7249181, 0.4039216, 1, 0, 1,
-0.5501614, 1.579765, -0.6039848, 0.3960784, 1, 0, 1,
-0.5442445, 0.6758407, -0.1869063, 0.3921569, 1, 0, 1,
-0.5440536, -0.04471856, -1.026168, 0.3843137, 1, 0, 1,
-0.5377943, -1.374279, -1.939344, 0.3803922, 1, 0, 1,
-0.5368982, 0.1720529, 0.1048693, 0.372549, 1, 0, 1,
-0.5339159, 0.005070218, 0.6332162, 0.3686275, 1, 0, 1,
-0.530811, 0.004153394, -1.524257, 0.3607843, 1, 0, 1,
-0.530775, -0.6168721, -2.938678, 0.3568628, 1, 0, 1,
-0.5303041, -0.6539621, -1.85342, 0.3490196, 1, 0, 1,
-0.5291834, -0.3388183, -1.127704, 0.345098, 1, 0, 1,
-0.5274616, 2.254746, -1.723836, 0.3372549, 1, 0, 1,
-0.526208, 1.57316, -0.3281277, 0.3333333, 1, 0, 1,
-0.5228689, 0.2757505, -1.899375, 0.3254902, 1, 0, 1,
-0.5216404, -0.08146467, -2.842525, 0.3215686, 1, 0, 1,
-0.5169339, -0.3297069, -2.625919, 0.3137255, 1, 0, 1,
-0.5095142, -0.7981673, -4.013219, 0.3098039, 1, 0, 1,
-0.5087053, 1.142931, -0.4673766, 0.3019608, 1, 0, 1,
-0.5080471, -0.1107241, -1.968342, 0.2941177, 1, 0, 1,
-0.5072822, 0.06722426, -2.731836, 0.2901961, 1, 0, 1,
-0.5049389, -0.05301936, -1.702198, 0.282353, 1, 0, 1,
-0.5040073, 0.6641746, -0.3221346, 0.2784314, 1, 0, 1,
-0.500854, 0.9778621, 0.4839224, 0.2705882, 1, 0, 1,
-0.49987, -0.7262961, -2.245982, 0.2666667, 1, 0, 1,
-0.4954589, 2.404116, -0.2219481, 0.2588235, 1, 0, 1,
-0.4883092, -1.346174, -3.568648, 0.254902, 1, 0, 1,
-0.4882635, 2.405642, -0.6909974, 0.2470588, 1, 0, 1,
-0.4881058, 0.2475043, -1.696174, 0.2431373, 1, 0, 1,
-0.4847608, -0.8386936, -1.977479, 0.2352941, 1, 0, 1,
-0.4776173, 1.346893, -2.257845, 0.2313726, 1, 0, 1,
-0.4772654, -0.7125775, -3.287228, 0.2235294, 1, 0, 1,
-0.4709158, 0.442599, -1.537146, 0.2196078, 1, 0, 1,
-0.4691895, -1.011078, -3.08465, 0.2117647, 1, 0, 1,
-0.4687998, 0.9578557, -0.8886673, 0.2078431, 1, 0, 1,
-0.467771, -1.025598, -1.358332, 0.2, 1, 0, 1,
-0.4670451, -1.467429, -2.647093, 0.1921569, 1, 0, 1,
-0.4660106, 0.2279975, -0.9778232, 0.1882353, 1, 0, 1,
-0.4600212, -0.5825056, -1.820026, 0.1803922, 1, 0, 1,
-0.4584867, -0.3223035, -3.485312, 0.1764706, 1, 0, 1,
-0.4554784, -0.07398129, -1.697584, 0.1686275, 1, 0, 1,
-0.4535231, 0.4128546, -1.489422, 0.1647059, 1, 0, 1,
-0.4534622, -1.159451, -3.60022, 0.1568628, 1, 0, 1,
-0.4443061, -1.614206, -1.422401, 0.1529412, 1, 0, 1,
-0.4441052, 1.478329, -0.06735693, 0.145098, 1, 0, 1,
-0.4394206, 1.305815, -1.645077, 0.1411765, 1, 0, 1,
-0.4367555, -0.1598002, -2.134113, 0.1333333, 1, 0, 1,
-0.4348271, 0.7966012, 0.4050245, 0.1294118, 1, 0, 1,
-0.4335469, 0.9068561, -1.085592, 0.1215686, 1, 0, 1,
-0.4242755, 1.176686, -1.061696, 0.1176471, 1, 0, 1,
-0.422597, 0.1946095, -2.211408, 0.1098039, 1, 0, 1,
-0.4224805, -0.1972837, -3.50899, 0.1058824, 1, 0, 1,
-0.4189265, -0.3521084, -1.841324, 0.09803922, 1, 0, 1,
-0.4175197, 0.3859209, -0.6230884, 0.09019608, 1, 0, 1,
-0.4173654, -1.438204, -2.569712, 0.08627451, 1, 0, 1,
-0.4162351, 2.70724, 0.06400103, 0.07843138, 1, 0, 1,
-0.4120124, 0.9848738, -0.7691063, 0.07450981, 1, 0, 1,
-0.4083031, 1.686409, 0.9593911, 0.06666667, 1, 0, 1,
-0.4064447, 0.2640375, -2.7429, 0.0627451, 1, 0, 1,
-0.406373, -0.3460778, -1.889145, 0.05490196, 1, 0, 1,
-0.402683, -0.9697368, -0.8095255, 0.05098039, 1, 0, 1,
-0.4014663, -0.5326184, -3.13211, 0.04313726, 1, 0, 1,
-0.400796, -0.9505287, -3.444673, 0.03921569, 1, 0, 1,
-0.391813, -1.034671, -3.053465, 0.03137255, 1, 0, 1,
-0.3917013, -0.9876123, -2.583131, 0.02745098, 1, 0, 1,
-0.3910432, -0.1872928, -4.806202, 0.01960784, 1, 0, 1,
-0.3905802, -0.2436829, -2.956679, 0.01568628, 1, 0, 1,
-0.3896904, 1.137189, -0.7110889, 0.007843138, 1, 0, 1,
-0.3875357, -0.3526527, -3.158284, 0.003921569, 1, 0, 1,
-0.3873435, 1.26122, -0.05714153, 0, 1, 0.003921569, 1,
-0.3868089, -2.396744, -1.412708, 0, 1, 0.01176471, 1,
-0.3825924, 0.7263343, 1.355437, 0, 1, 0.01568628, 1,
-0.382014, 0.349093, -0.9244551, 0, 1, 0.02352941, 1,
-0.3794982, -2.031719, -2.541671, 0, 1, 0.02745098, 1,
-0.3789416, 1.531527, 0.3266465, 0, 1, 0.03529412, 1,
-0.3736242, -0.6757142, -2.381903, 0, 1, 0.03921569, 1,
-0.3703549, 0.09018778, -1.356327, 0, 1, 0.04705882, 1,
-0.3680825, 0.3536317, -1.01361, 0, 1, 0.05098039, 1,
-0.3668533, 0.7178878, 0.0528673, 0, 1, 0.05882353, 1,
-0.3620787, 0.2742363, -0.9529881, 0, 1, 0.0627451, 1,
-0.3581456, -1.492656, -4.028543, 0, 1, 0.07058824, 1,
-0.3569392, -0.6490742, -2.878527, 0, 1, 0.07450981, 1,
-0.3508696, -0.6301222, -2.093402, 0, 1, 0.08235294, 1,
-0.3503582, -1.14756, -4.002017, 0, 1, 0.08627451, 1,
-0.3488437, -1.395691, -2.552443, 0, 1, 0.09411765, 1,
-0.3455568, 1.373607, -0.2294634, 0, 1, 0.1019608, 1,
-0.344943, 0.9419727, 0.1127377, 0, 1, 0.1058824, 1,
-0.3421003, -2.065648, -4.799356, 0, 1, 0.1137255, 1,
-0.337512, 1.277838, 2.730084, 0, 1, 0.1176471, 1,
-0.3349411, 0.1667265, -2.027755, 0, 1, 0.1254902, 1,
-0.3346287, 0.3028124, -0.8701777, 0, 1, 0.1294118, 1,
-0.3333519, -0.5012367, -3.849973, 0, 1, 0.1372549, 1,
-0.3333503, 0.8915488, -0.0378955, 0, 1, 0.1411765, 1,
-0.3318809, -0.372471, -4.2334, 0, 1, 0.1490196, 1,
-0.3318415, -1.44645, -1.998291, 0, 1, 0.1529412, 1,
-0.3314898, -1.780134, -3.425575, 0, 1, 0.1607843, 1,
-0.3310307, -0.05694824, -1.2056, 0, 1, 0.1647059, 1,
-0.3283652, 0.5286474, -0.2357769, 0, 1, 0.172549, 1,
-0.3276951, -0.6972814, -3.780192, 0, 1, 0.1764706, 1,
-0.326979, -0.1926579, -1.676467, 0, 1, 0.1843137, 1,
-0.3264006, -0.4597946, -2.395576, 0, 1, 0.1882353, 1,
-0.3247353, 0.05534092, -1.462169, 0, 1, 0.1960784, 1,
-0.3225949, 0.5010931, 0.3154137, 0, 1, 0.2039216, 1,
-0.3211079, 0.1101154, -0.3062611, 0, 1, 0.2078431, 1,
-0.3188515, 0.3117723, -2.481596, 0, 1, 0.2156863, 1,
-0.3171726, 0.7544085, -1.454877, 0, 1, 0.2196078, 1,
-0.3103498, 0.5472051, -0.01820945, 0, 1, 0.227451, 1,
-0.3080903, -0.6513126, -3.243895, 0, 1, 0.2313726, 1,
-0.3045144, -0.3304384, -1.566649, 0, 1, 0.2392157, 1,
-0.3020645, 0.9542328, -0.5075442, 0, 1, 0.2431373, 1,
-0.3012796, -0.1530859, -3.13789, 0, 1, 0.2509804, 1,
-0.2964777, 0.5291991, -1.210771, 0, 1, 0.254902, 1,
-0.2906704, -0.7605441, -2.911288, 0, 1, 0.2627451, 1,
-0.28947, 0.733771, -0.2492079, 0, 1, 0.2666667, 1,
-0.2885517, -0.8158155, -4.332907, 0, 1, 0.2745098, 1,
-0.2880009, -1.306803, -3.201765, 0, 1, 0.2784314, 1,
-0.2855454, 1.026398, 0.563617, 0, 1, 0.2862745, 1,
-0.2830871, 1.266559, -2.329005, 0, 1, 0.2901961, 1,
-0.2826168, 0.9460457, 1.665474, 0, 1, 0.2980392, 1,
-0.2782582, -1.266966, -2.218105, 0, 1, 0.3058824, 1,
-0.2771168, -2.097773, -3.028001, 0, 1, 0.3098039, 1,
-0.2769579, -1.265174, -2.559946, 0, 1, 0.3176471, 1,
-0.2747363, -0.6203215, -1.678006, 0, 1, 0.3215686, 1,
-0.2713538, -1.03955, -2.48029, 0, 1, 0.3294118, 1,
-0.2586522, 0.1302705, 0.4571623, 0, 1, 0.3333333, 1,
-0.2570272, -0.1440932, -1.403938, 0, 1, 0.3411765, 1,
-0.256088, 1.391677, 0.1522929, 0, 1, 0.345098, 1,
-0.2555236, 0.4053432, 0.2106086, 0, 1, 0.3529412, 1,
-0.2481809, -0.6484135, -1.685568, 0, 1, 0.3568628, 1,
-0.2463069, -0.6671914, -4.321404, 0, 1, 0.3647059, 1,
-0.2459689, -1.536314, -3.616314, 0, 1, 0.3686275, 1,
-0.2457428, -0.765441, -2.075094, 0, 1, 0.3764706, 1,
-0.2432989, 0.3177071, -1.230755, 0, 1, 0.3803922, 1,
-0.2392361, 0.01595513, -2.909656, 0, 1, 0.3882353, 1,
-0.2353086, 0.6401831, -0.9095756, 0, 1, 0.3921569, 1,
-0.2277855, -0.6797, -3.506665, 0, 1, 0.4, 1,
-0.2273522, -1.023164, -1.97042, 0, 1, 0.4078431, 1,
-0.2272704, -0.3271163, -0.8355839, 0, 1, 0.4117647, 1,
-0.2271567, -2.183464, -2.984479, 0, 1, 0.4196078, 1,
-0.2161554, 1.318536, 1.048111, 0, 1, 0.4235294, 1,
-0.215571, 0.3527333, 0.2894853, 0, 1, 0.4313726, 1,
-0.2155445, -1.043463, -2.780359, 0, 1, 0.4352941, 1,
-0.209799, 0.3454823, 0.4658398, 0, 1, 0.4431373, 1,
-0.2084921, -0.1823492, 0.0168385, 0, 1, 0.4470588, 1,
-0.2076866, 1.127843, 0.460416, 0, 1, 0.454902, 1,
-0.2034332, 1.356286, 0.07378446, 0, 1, 0.4588235, 1,
-0.200843, -0.2552341, -2.100515, 0, 1, 0.4666667, 1,
-0.1985212, 0.334658, 0.7275913, 0, 1, 0.4705882, 1,
-0.1980469, -1.022095, -4.61007, 0, 1, 0.4784314, 1,
-0.1940148, -0.9734981, -3.225338, 0, 1, 0.4823529, 1,
-0.193405, 0.105327, -0.263191, 0, 1, 0.4901961, 1,
-0.1917555, -0.6338921, -2.541754, 0, 1, 0.4941176, 1,
-0.190684, -0.9896075, -1.665702, 0, 1, 0.5019608, 1,
-0.1902287, 0.2816062, 0.9709564, 0, 1, 0.509804, 1,
-0.1894413, 1.862786, -0.9615114, 0, 1, 0.5137255, 1,
-0.1892488, 0.5326511, -1.131097, 0, 1, 0.5215687, 1,
-0.1889179, 0.003056116, -2.667867, 0, 1, 0.5254902, 1,
-0.1878154, 0.4269826, -2.037497, 0, 1, 0.5333334, 1,
-0.1873493, 1.126233, -0.5494791, 0, 1, 0.5372549, 1,
-0.1843678, -0.9601064, -3.061107, 0, 1, 0.5450981, 1,
-0.1830452, 0.2893587, -0.3074092, 0, 1, 0.5490196, 1,
-0.1824259, 1.353595, -0.6177225, 0, 1, 0.5568628, 1,
-0.1817445, -0.05238095, -1.447945, 0, 1, 0.5607843, 1,
-0.1800932, 0.5732437, -0.8518878, 0, 1, 0.5686275, 1,
-0.1780412, -0.7953983, -4.146446, 0, 1, 0.572549, 1,
-0.1726159, -0.7872692, -2.67592, 0, 1, 0.5803922, 1,
-0.1688029, 1.802497, -0.5879341, 0, 1, 0.5843138, 1,
-0.166159, -0.08941448, -1.748718, 0, 1, 0.5921569, 1,
-0.1660021, -0.05064864, -3.815312, 0, 1, 0.5960785, 1,
-0.1646555, -0.7984513, -2.788898, 0, 1, 0.6039216, 1,
-0.1642662, 0.8027091, -0.6293089, 0, 1, 0.6117647, 1,
-0.1620427, -1.127754, -2.704887, 0, 1, 0.6156863, 1,
-0.159025, 0.8637666, 0.02942709, 0, 1, 0.6235294, 1,
-0.1539238, -0.03575186, -3.093843, 0, 1, 0.627451, 1,
-0.1491981, 1.100346, 0.566727, 0, 1, 0.6352941, 1,
-0.1488639, -0.1551777, -4.182168, 0, 1, 0.6392157, 1,
-0.1441201, 0.6990096, -0.9403641, 0, 1, 0.6470588, 1,
-0.1412122, 1.31756, -0.8517008, 0, 1, 0.6509804, 1,
-0.1378255, -0.7854958, -1.718133, 0, 1, 0.6588235, 1,
-0.1344235, -0.5513425, -2.839076, 0, 1, 0.6627451, 1,
-0.1314139, -0.6586534, -3.494653, 0, 1, 0.6705883, 1,
-0.1286627, -0.05815846, -2.365372, 0, 1, 0.6745098, 1,
-0.127612, 0.3579531, -0.3632173, 0, 1, 0.682353, 1,
-0.1231526, 0.06412482, -1.868199, 0, 1, 0.6862745, 1,
-0.1211827, 1.196478, -1.457149, 0, 1, 0.6941177, 1,
-0.1206645, -2.168712, -3.158318, 0, 1, 0.7019608, 1,
-0.1198914, -1.762176, -3.503656, 0, 1, 0.7058824, 1,
-0.1196822, -0.03894381, -2.948744, 0, 1, 0.7137255, 1,
-0.1183967, 1.083377, 0.1003783, 0, 1, 0.7176471, 1,
-0.1132098, -1.829641, -3.969841, 0, 1, 0.7254902, 1,
-0.1126554, -0.5376002, -2.699421, 0, 1, 0.7294118, 1,
-0.1123494, -0.4594289, -3.200479, 0, 1, 0.7372549, 1,
-0.1111901, -0.4988502, -1.823073, 0, 1, 0.7411765, 1,
-0.1093167, -0.540146, -4.304895, 0, 1, 0.7490196, 1,
-0.1083074, 0.8034734, -1.10973, 0, 1, 0.7529412, 1,
-0.1080117, 0.5452627, -0.07622351, 0, 1, 0.7607843, 1,
-0.1051254, 0.4479586, -1.21621, 0, 1, 0.7647059, 1,
-0.1038716, -1.525966, -0.7213942, 0, 1, 0.772549, 1,
-0.1020191, -1.959149, -1.428383, 0, 1, 0.7764706, 1,
-0.1001004, -1.920958, -4.008297, 0, 1, 0.7843137, 1,
-0.09620009, 1.453391, 0.7133881, 0, 1, 0.7882353, 1,
-0.09533008, -1.144356, -3.931875, 0, 1, 0.7960784, 1,
-0.09432546, -0.5539905, -4.841866, 0, 1, 0.8039216, 1,
-0.08797945, 1.924172, -0.8716797, 0, 1, 0.8078431, 1,
-0.08536421, 0.264342, 0.173445, 0, 1, 0.8156863, 1,
-0.07621571, 2.301863, 1.120834, 0, 1, 0.8196079, 1,
-0.07336909, -1.400899, -2.986565, 0, 1, 0.827451, 1,
-0.07217216, 1.242599, -0.6651862, 0, 1, 0.8313726, 1,
-0.06847237, 0.1601515, -0.6198221, 0, 1, 0.8392157, 1,
-0.06477755, 0.1382654, 0.2499768, 0, 1, 0.8431373, 1,
-0.0563163, 0.6088965, 0.2441999, 0, 1, 0.8509804, 1,
-0.0553983, 0.2589177, 0.8957422, 0, 1, 0.854902, 1,
-0.05392082, 0.2943652, -1.131382, 0, 1, 0.8627451, 1,
-0.05156795, -0.233432, -2.790709, 0, 1, 0.8666667, 1,
-0.05023727, -0.7682493, -6.316915, 0, 1, 0.8745098, 1,
-0.04849338, -0.7954874, -3.354181, 0, 1, 0.8784314, 1,
-0.04839074, 1.443768, -0.512462, 0, 1, 0.8862745, 1,
-0.04339352, 0.6935216, -0.1915732, 0, 1, 0.8901961, 1,
-0.04087216, 0.3509581, -0.6724663, 0, 1, 0.8980392, 1,
-0.04065063, 0.4836367, 0.7561094, 0, 1, 0.9058824, 1,
-0.039627, -0.2708074, -4.390855, 0, 1, 0.9098039, 1,
-0.03883255, 0.8957936, 0.3005227, 0, 1, 0.9176471, 1,
-0.0383733, 0.8725078, -2.473517, 0, 1, 0.9215686, 1,
-0.03836897, -1.339853, -0.4289879, 0, 1, 0.9294118, 1,
-0.03647859, -0.5294988, -4.882075, 0, 1, 0.9333333, 1,
-0.03406688, -0.5091174, -2.913152, 0, 1, 0.9411765, 1,
-0.03167554, -1.377557, -2.127907, 0, 1, 0.945098, 1,
-0.02285633, -1.884274, -2.672626, 0, 1, 0.9529412, 1,
-0.02185793, -0.4601962, -2.870871, 0, 1, 0.9568627, 1,
-0.02156434, 1.011044, 0.06296649, 0, 1, 0.9647059, 1,
-0.02023884, -1.034622, -3.449864, 0, 1, 0.9686275, 1,
-0.01863541, -2.474269, -4.667, 0, 1, 0.9764706, 1,
-0.01539197, 1.26874, 1.38046, 0, 1, 0.9803922, 1,
-0.003357504, 1.110672, -0.7102438, 0, 1, 0.9882353, 1,
-0.001919412, 0.2482888, -1.700914, 0, 1, 0.9921569, 1,
0.001698799, -2.565584, 3.773839, 0, 1, 1, 1,
0.006035275, -1.167759, 2.750181, 0, 0.9921569, 1, 1,
0.007386638, -2.013796, 2.953614, 0, 0.9882353, 1, 1,
0.007976942, -1.493724, 1.555893, 0, 0.9803922, 1, 1,
0.008167144, -0.2767219, 1.477889, 0, 0.9764706, 1, 1,
0.008253608, 0.2654087, 0.07584646, 0, 0.9686275, 1, 1,
0.00827907, 0.7523142, 0.5534059, 0, 0.9647059, 1, 1,
0.01116119, 0.7328441, -0.3316713, 0, 0.9568627, 1, 1,
0.01245927, -1.079748, 2.327519, 0, 0.9529412, 1, 1,
0.014123, -0.7054065, 1.765418, 0, 0.945098, 1, 1,
0.01441695, -0.7527684, 1.554853, 0, 0.9411765, 1, 1,
0.01507519, -0.6936175, 2.731983, 0, 0.9333333, 1, 1,
0.02183991, -0.7288848, 3.350643, 0, 0.9294118, 1, 1,
0.02349502, 1.456076, -0.1268225, 0, 0.9215686, 1, 1,
0.02477033, -0.6331517, 4.464986, 0, 0.9176471, 1, 1,
0.02495391, -1.509745, 2.143592, 0, 0.9098039, 1, 1,
0.02687857, -1.035011, 2.265052, 0, 0.9058824, 1, 1,
0.02721152, 0.3867489, 1.49343, 0, 0.8980392, 1, 1,
0.03306652, -0.09932194, 2.635079, 0, 0.8901961, 1, 1,
0.03484252, 1.036597, 0.0106992, 0, 0.8862745, 1, 1,
0.03695758, 0.9243018, -1.871587, 0, 0.8784314, 1, 1,
0.03695887, 1.016913, -0.1805167, 0, 0.8745098, 1, 1,
0.0370224, 1.249141, 0.9808785, 0, 0.8666667, 1, 1,
0.03886255, 2.852381, -1.442104, 0, 0.8627451, 1, 1,
0.04287459, -1.088539, 3.578694, 0, 0.854902, 1, 1,
0.05205591, 1.28073, 1.399905, 0, 0.8509804, 1, 1,
0.05527338, 1.226764, -2.058604, 0, 0.8431373, 1, 1,
0.05995463, 1.226624, 0.9685134, 0, 0.8392157, 1, 1,
0.06321568, 0.9816226, -2.231083, 0, 0.8313726, 1, 1,
0.06461206, 0.3143316, 0.06663911, 0, 0.827451, 1, 1,
0.06863979, -0.1560785, 5.396159, 0, 0.8196079, 1, 1,
0.0687116, 0.5361878, -2.254466, 0, 0.8156863, 1, 1,
0.0715913, -0.701407, 2.542216, 0, 0.8078431, 1, 1,
0.07161276, -0.9607953, 4.536047, 0, 0.8039216, 1, 1,
0.07601648, 0.349271, 1.387884, 0, 0.7960784, 1, 1,
0.07932661, 0.1993782, -0.2488113, 0, 0.7882353, 1, 1,
0.08081252, 0.5827435, 0.6890373, 0, 0.7843137, 1, 1,
0.08123346, -0.6970991, 3.901494, 0, 0.7764706, 1, 1,
0.08205701, 0.6355057, -0.4914652, 0, 0.772549, 1, 1,
0.08798544, 0.6376948, 0.00116124, 0, 0.7647059, 1, 1,
0.08823902, 0.2278847, 1.481112, 0, 0.7607843, 1, 1,
0.09056341, -0.3292121, 3.513501, 0, 0.7529412, 1, 1,
0.09470716, 1.114855, 0.5527369, 0, 0.7490196, 1, 1,
0.09765594, -0.1138745, 3.052612, 0, 0.7411765, 1, 1,
0.09945239, -0.03260883, 1.406152, 0, 0.7372549, 1, 1,
0.106457, -2.665652, 1.37093, 0, 0.7294118, 1, 1,
0.1071828, -1.052511, 4.092563, 0, 0.7254902, 1, 1,
0.1088794, 1.301552, 0.5075811, 0, 0.7176471, 1, 1,
0.1105178, 0.858766, 0.1632091, 0, 0.7137255, 1, 1,
0.1105922, -0.02150775, 1.600239, 0, 0.7058824, 1, 1,
0.1226624, 0.2165962, 1.540645, 0, 0.6980392, 1, 1,
0.1249246, 0.3622025, -0.3354232, 0, 0.6941177, 1, 1,
0.1274144, 0.07971645, 0.1777004, 0, 0.6862745, 1, 1,
0.1284882, -0.9472151, 1.525181, 0, 0.682353, 1, 1,
0.1315103, -0.5378057, 2.781708, 0, 0.6745098, 1, 1,
0.1337842, -0.01275566, 1.846287, 0, 0.6705883, 1, 1,
0.1443437, 0.5111677, 0.02414172, 0, 0.6627451, 1, 1,
0.1490508, -0.5624254, 4.459135, 0, 0.6588235, 1, 1,
0.1528607, -0.4399138, 4.282835, 0, 0.6509804, 1, 1,
0.1545744, 1.357595, -0.5734532, 0, 0.6470588, 1, 1,
0.1547582, -0.1694327, 1.203157, 0, 0.6392157, 1, 1,
0.1593993, -0.557881, 4.537058, 0, 0.6352941, 1, 1,
0.1600046, -1.203856, 5.529261, 0, 0.627451, 1, 1,
0.1632624, 0.2998852, 0.9879754, 0, 0.6235294, 1, 1,
0.1651091, -1.604925, 2.715281, 0, 0.6156863, 1, 1,
0.1679763, -0.2669006, 2.348558, 0, 0.6117647, 1, 1,
0.1742437, 0.1700832, 0.9195008, 0, 0.6039216, 1, 1,
0.1752584, 0.6657197, 0.2476121, 0, 0.5960785, 1, 1,
0.1784819, -1.673112, 3.293113, 0, 0.5921569, 1, 1,
0.1816785, -1.489855, 2.984068, 0, 0.5843138, 1, 1,
0.1831006, 0.3831894, 1.966776, 0, 0.5803922, 1, 1,
0.1844017, 0.770376, -0.9612882, 0, 0.572549, 1, 1,
0.185116, 1.930712, -0.2510034, 0, 0.5686275, 1, 1,
0.1864535, -0.6144137, 4.082641, 0, 0.5607843, 1, 1,
0.1895238, 0.2936116, 0.5198326, 0, 0.5568628, 1, 1,
0.1903164, -1.208997, 4.483658, 0, 0.5490196, 1, 1,
0.1903342, -0.03755571, 1.161091, 0, 0.5450981, 1, 1,
0.1915133, 0.6052479, 0.6127439, 0, 0.5372549, 1, 1,
0.1932349, 0.5320668, 0.3486621, 0, 0.5333334, 1, 1,
0.1968402, 1.106456, 0.4873114, 0, 0.5254902, 1, 1,
0.1978683, 1.228119, 1.114285, 0, 0.5215687, 1, 1,
0.1989404, 0.1732851, 1.760032, 0, 0.5137255, 1, 1,
0.2011627, 0.7104247, -2.107768, 0, 0.509804, 1, 1,
0.2013956, -0.361049, 1.485342, 0, 0.5019608, 1, 1,
0.2020951, -1.554062, 2.26438, 0, 0.4941176, 1, 1,
0.2026023, -0.2614721, 1.001495, 0, 0.4901961, 1, 1,
0.2042578, 2.137162, -2.52571, 0, 0.4823529, 1, 1,
0.2068948, 1.220879, -0.8883342, 0, 0.4784314, 1, 1,
0.2073192, 0.02676469, 2.357419, 0, 0.4705882, 1, 1,
0.2101274, 0.3432336, 1.717405, 0, 0.4666667, 1, 1,
0.2178053, 0.7143443, -0.318777, 0, 0.4588235, 1, 1,
0.2221261, 1.22868, 0.4261323, 0, 0.454902, 1, 1,
0.2262957, -1.057012, 3.666946, 0, 0.4470588, 1, 1,
0.2285933, 1.223021, 0.4893416, 0, 0.4431373, 1, 1,
0.2307061, -3.010409, 2.664544, 0, 0.4352941, 1, 1,
0.2309283, 1.480268, 0.914671, 0, 0.4313726, 1, 1,
0.2322533, -0.2676193, 4.298403, 0, 0.4235294, 1, 1,
0.2331868, -0.624855, 3.926001, 0, 0.4196078, 1, 1,
0.2347291, -0.2439826, 2.096476, 0, 0.4117647, 1, 1,
0.2358847, 0.6038083, -0.4182176, 0, 0.4078431, 1, 1,
0.2365413, 1.73436, -0.9497204, 0, 0.4, 1, 1,
0.2368658, -0.6139846, 1.863081, 0, 0.3921569, 1, 1,
0.2368751, -0.9299374, 2.607282, 0, 0.3882353, 1, 1,
0.2375414, 0.2801133, 2.160789, 0, 0.3803922, 1, 1,
0.23884, -1.396585, 2.492108, 0, 0.3764706, 1, 1,
0.2417802, -0.1585296, 2.940619, 0, 0.3686275, 1, 1,
0.2444531, -0.6563928, 1.879259, 0, 0.3647059, 1, 1,
0.248774, -0.9373512, 2.878641, 0, 0.3568628, 1, 1,
0.249857, 0.8337688, -0.6090098, 0, 0.3529412, 1, 1,
0.255628, 1.261653, 1.029118, 0, 0.345098, 1, 1,
0.2564526, 0.3620638, 1.966353, 0, 0.3411765, 1, 1,
0.2643896, 0.02981108, 1.190593, 0, 0.3333333, 1, 1,
0.2667621, 1.707727, -4.544423, 0, 0.3294118, 1, 1,
0.2764293, 1.168699, 0.5576365, 0, 0.3215686, 1, 1,
0.2791669, -0.4494913, 3.108225, 0, 0.3176471, 1, 1,
0.279236, 0.1925541, 0.6539366, 0, 0.3098039, 1, 1,
0.2798983, 0.1220302, 1.056844, 0, 0.3058824, 1, 1,
0.2894917, -0.2434396, 2.963429, 0, 0.2980392, 1, 1,
0.2903907, 4.211158, -0.7541009, 0, 0.2901961, 1, 1,
0.2932741, -0.2943017, 4.632764, 0, 0.2862745, 1, 1,
0.294676, -0.9150985, 3.305332, 0, 0.2784314, 1, 1,
0.2962198, -0.1052989, 2.589191, 0, 0.2745098, 1, 1,
0.305163, 0.2776702, 1.589988, 0, 0.2666667, 1, 1,
0.3077634, 0.824181, 0.4917933, 0, 0.2627451, 1, 1,
0.3082712, -1.390505, 3.416117, 0, 0.254902, 1, 1,
0.308284, -1.093296, 4.204811, 0, 0.2509804, 1, 1,
0.3088171, -0.2780517, 3.888732, 0, 0.2431373, 1, 1,
0.3106715, -1.882965, 2.361362, 0, 0.2392157, 1, 1,
0.313771, 1.439043, 0.5365282, 0, 0.2313726, 1, 1,
0.3153995, -0.533896, 1.579169, 0, 0.227451, 1, 1,
0.3207581, 0.7331219, -0.9242149, 0, 0.2196078, 1, 1,
0.3224242, 0.1581909, 1.410095, 0, 0.2156863, 1, 1,
0.325691, -0.005836063, 2.192168, 0, 0.2078431, 1, 1,
0.3318976, 0.2122151, -0.2650827, 0, 0.2039216, 1, 1,
0.3321573, -1.094562, 2.898974, 0, 0.1960784, 1, 1,
0.3350239, -0.08302019, 1.117041, 0, 0.1882353, 1, 1,
0.3388289, -0.5412441, 3.644711, 0, 0.1843137, 1, 1,
0.3395239, -0.2096064, 2.83084, 0, 0.1764706, 1, 1,
0.3408122, -0.5488359, 3.424158, 0, 0.172549, 1, 1,
0.3471349, -0.1482488, 1.15278, 0, 0.1647059, 1, 1,
0.3476043, -0.8899978, 3.635731, 0, 0.1607843, 1, 1,
0.3486586, -0.9868907, 2.962223, 0, 0.1529412, 1, 1,
0.3487651, -1.745259, 4.590854, 0, 0.1490196, 1, 1,
0.3505608, 0.3348812, 0.8980115, 0, 0.1411765, 1, 1,
0.3537063, 0.8657001, 2.949181, 0, 0.1372549, 1, 1,
0.3579944, -1.856649, 3.246712, 0, 0.1294118, 1, 1,
0.3596981, 1.490827, -0.7550029, 0, 0.1254902, 1, 1,
0.3617519, 1.134809, 1.536288, 0, 0.1176471, 1, 1,
0.3618756, -0.04537157, 1.575296, 0, 0.1137255, 1, 1,
0.3627286, 0.4008698, 1.542038, 0, 0.1058824, 1, 1,
0.3634327, 1.021037, -0.6644173, 0, 0.09803922, 1, 1,
0.3651838, -0.06988265, 0.5011876, 0, 0.09411765, 1, 1,
0.3661143, 1.056641, 0.8874613, 0, 0.08627451, 1, 1,
0.3691706, -0.2568025, 3.444291, 0, 0.08235294, 1, 1,
0.3698942, 1.133736, 0.6480016, 0, 0.07450981, 1, 1,
0.3706801, 1.346637, 0.6718721, 0, 0.07058824, 1, 1,
0.3815314, -1.63958, 3.214869, 0, 0.0627451, 1, 1,
0.3855951, -0.9614192, 3.005205, 0, 0.05882353, 1, 1,
0.3863168, -0.8912482, 3.332773, 0, 0.05098039, 1, 1,
0.3876835, -1.047617, 1.920708, 0, 0.04705882, 1, 1,
0.3882542, -0.9904735, 1.005603, 0, 0.03921569, 1, 1,
0.3915657, 1.187633, 0.5718652, 0, 0.03529412, 1, 1,
0.3985955, -0.421546, 2.760808, 0, 0.02745098, 1, 1,
0.4052783, 1.069959, 3.029672, 0, 0.02352941, 1, 1,
0.4120682, -0.2704777, 1.595681, 0, 0.01568628, 1, 1,
0.4129341, -0.9270684, 3.011777, 0, 0.01176471, 1, 1,
0.4194913, 0.3895009, 1.200582, 0, 0.003921569, 1, 1,
0.4255678, -0.2370073, 3.410258, 0.003921569, 0, 1, 1,
0.4268128, -0.05274064, 2.219997, 0.007843138, 0, 1, 1,
0.4289367, 0.9665701, -1.295544, 0.01568628, 0, 1, 1,
0.4323017, -0.2781239, 1.566224, 0.01960784, 0, 1, 1,
0.4391615, 1.361816, -1.311961, 0.02745098, 0, 1, 1,
0.4430169, 0.5750707, 1.279975, 0.03137255, 0, 1, 1,
0.4504112, -0.7303004, 2.330979, 0.03921569, 0, 1, 1,
0.4518442, 0.983242, 1.618719, 0.04313726, 0, 1, 1,
0.4583282, -0.6980471, 2.750288, 0.05098039, 0, 1, 1,
0.461101, -0.5139616, 2.79656, 0.05490196, 0, 1, 1,
0.4620197, -0.6554393, 0.5339598, 0.0627451, 0, 1, 1,
0.463848, 0.2865248, 1.514203, 0.06666667, 0, 1, 1,
0.4640641, -0.1437764, 3.83592, 0.07450981, 0, 1, 1,
0.4656501, 0.318904, 1.199381, 0.07843138, 0, 1, 1,
0.4671645, 0.5168476, 1.733428, 0.08627451, 0, 1, 1,
0.4695916, 0.31862, -0.4013653, 0.09019608, 0, 1, 1,
0.4772995, -1.680261, 1.151254, 0.09803922, 0, 1, 1,
0.4788349, -0.4656583, 3.679853, 0.1058824, 0, 1, 1,
0.4801246, -1.649151, 4.992511, 0.1098039, 0, 1, 1,
0.4809327, -0.7630745, 1.687472, 0.1176471, 0, 1, 1,
0.4813163, 0.9767935, 1.096789, 0.1215686, 0, 1, 1,
0.4913123, -1.691184, 3.006882, 0.1294118, 0, 1, 1,
0.4970825, 1.075181, 0.2910269, 0.1333333, 0, 1, 1,
0.4979736, -0.1263921, 1.717952, 0.1411765, 0, 1, 1,
0.4990311, 0.8767883, 0.2647361, 0.145098, 0, 1, 1,
0.4999624, 0.7750004, 0.9919276, 0.1529412, 0, 1, 1,
0.5025894, 0.1592585, 0.2121741, 0.1568628, 0, 1, 1,
0.5039263, 0.1357565, -0.716499, 0.1647059, 0, 1, 1,
0.5041257, 0.508843, 2.458134, 0.1686275, 0, 1, 1,
0.5053524, 1.09284, 0.5629852, 0.1764706, 0, 1, 1,
0.5059709, 0.6549241, -0.1345061, 0.1803922, 0, 1, 1,
0.5064076, -1.693443, 1.760089, 0.1882353, 0, 1, 1,
0.5094014, 1.015609, 1.000416, 0.1921569, 0, 1, 1,
0.5107659, -0.1017874, 3.085831, 0.2, 0, 1, 1,
0.5109208, 0.2317787, 1.268931, 0.2078431, 0, 1, 1,
0.5117094, -0.09493399, 0.867502, 0.2117647, 0, 1, 1,
0.5154891, 1.646998, 1.15547, 0.2196078, 0, 1, 1,
0.5183598, 1.337547, -0.2237469, 0.2235294, 0, 1, 1,
0.5204829, 0.7185593, 1.07931, 0.2313726, 0, 1, 1,
0.5244859, 0.3038384, 0.5231037, 0.2352941, 0, 1, 1,
0.526387, 0.2295722, 1.281209, 0.2431373, 0, 1, 1,
0.5303196, -0.233307, 0.2520391, 0.2470588, 0, 1, 1,
0.5303218, 1.677491, -1.126712, 0.254902, 0, 1, 1,
0.5305204, -2.123256, 5.177099, 0.2588235, 0, 1, 1,
0.5321854, 0.594869, 0.79886, 0.2666667, 0, 1, 1,
0.5339782, 0.07598127, 1.824321, 0.2705882, 0, 1, 1,
0.5370483, 0.5376045, -0.2842385, 0.2784314, 0, 1, 1,
0.5413098, -1.252931, 3.486927, 0.282353, 0, 1, 1,
0.5426559, -0.7955488, 2.695926, 0.2901961, 0, 1, 1,
0.5551317, -0.3447224, 2.062737, 0.2941177, 0, 1, 1,
0.5602164, -0.8807377, 3.277231, 0.3019608, 0, 1, 1,
0.564351, 0.5493223, 3.091731, 0.3098039, 0, 1, 1,
0.5698368, 0.6915885, -0.2581723, 0.3137255, 0, 1, 1,
0.5702251, 0.06732581, 2.225337, 0.3215686, 0, 1, 1,
0.5704195, -0.6406116, 0.8237563, 0.3254902, 0, 1, 1,
0.5810688, -0.1644236, -0.1519247, 0.3333333, 0, 1, 1,
0.582942, -1.371271, 1.919051, 0.3372549, 0, 1, 1,
0.5947004, 0.9875742, -0.03320156, 0.345098, 0, 1, 1,
0.5982906, -1.363295, 2.581975, 0.3490196, 0, 1, 1,
0.6006821, 0.6350792, 0.3429375, 0.3568628, 0, 1, 1,
0.6052443, -1.095513, 3.364394, 0.3607843, 0, 1, 1,
0.6085735, -0.710829, 3.003495, 0.3686275, 0, 1, 1,
0.6097919, 2.003475, -1.662955, 0.372549, 0, 1, 1,
0.6100999, 1.563424, -0.5743016, 0.3803922, 0, 1, 1,
0.6129277, 0.6453062, 1.088277, 0.3843137, 0, 1, 1,
0.6146768, 1.694233, 1.890289, 0.3921569, 0, 1, 1,
0.6190441, -0.4569954, 1.939051, 0.3960784, 0, 1, 1,
0.6214578, -2.17624, 3.40215, 0.4039216, 0, 1, 1,
0.6218772, -0.3242857, 2.171473, 0.4117647, 0, 1, 1,
0.6240884, -0.1582029, 3.383943, 0.4156863, 0, 1, 1,
0.6354041, 0.005154934, -0.652772, 0.4235294, 0, 1, 1,
0.638466, -1.098038, 1.580067, 0.427451, 0, 1, 1,
0.6393779, 1.248809, -1.436359, 0.4352941, 0, 1, 1,
0.640784, 0.3614423, 2.11603, 0.4392157, 0, 1, 1,
0.6442569, -0.2881709, 1.938617, 0.4470588, 0, 1, 1,
0.6457462, 1.751059, 0.08278778, 0.4509804, 0, 1, 1,
0.6491798, 1.632007, 1.093407, 0.4588235, 0, 1, 1,
0.6569595, -0.7777336, 2.325844, 0.4627451, 0, 1, 1,
0.6578578, -0.05821946, 1.573829, 0.4705882, 0, 1, 1,
0.6579321, -1.388739, 2.960527, 0.4745098, 0, 1, 1,
0.6629663, -0.1186128, 0.9214159, 0.4823529, 0, 1, 1,
0.6670416, 1.733634, 0.06179307, 0.4862745, 0, 1, 1,
0.6697307, 0.1849141, 1.780756, 0.4941176, 0, 1, 1,
0.6712428, -0.6234736, 1.271223, 0.5019608, 0, 1, 1,
0.6760416, -0.1605213, 2.247265, 0.5058824, 0, 1, 1,
0.6785758, 0.8829844, 0.454803, 0.5137255, 0, 1, 1,
0.6793827, -1.587287, 2.783174, 0.5176471, 0, 1, 1,
0.6832953, 0.8844913, 0.3769519, 0.5254902, 0, 1, 1,
0.6862496, -1.19187, 3.427743, 0.5294118, 0, 1, 1,
0.6877524, -0.8274528, 1.716542, 0.5372549, 0, 1, 1,
0.6881781, -0.2907232, 1.38682, 0.5411765, 0, 1, 1,
0.6945257, -1.379713, 1.846867, 0.5490196, 0, 1, 1,
0.7021795, 0.2043562, 1.366871, 0.5529412, 0, 1, 1,
0.7057519, 0.9800261, -1.427165, 0.5607843, 0, 1, 1,
0.7108653, 1.615988, -0.07224288, 0.5647059, 0, 1, 1,
0.715346, 0.3916158, 1.655276, 0.572549, 0, 1, 1,
0.7216184, 0.4846815, -0.00816762, 0.5764706, 0, 1, 1,
0.7286073, -0.2114867, 1.798593, 0.5843138, 0, 1, 1,
0.7298645, 1.229798, 1.694543, 0.5882353, 0, 1, 1,
0.7424895, -1.106259, 3.327091, 0.5960785, 0, 1, 1,
0.7429565, 1.026454, -0.5179356, 0.6039216, 0, 1, 1,
0.7523923, 0.3154319, 0.7910991, 0.6078432, 0, 1, 1,
0.7579884, 1.705808, 1.206788, 0.6156863, 0, 1, 1,
0.7594453, -0.5601226, 3.060437, 0.6196079, 0, 1, 1,
0.7644356, -0.6705774, 1.061184, 0.627451, 0, 1, 1,
0.7652026, 1.115412, 0.1927176, 0.6313726, 0, 1, 1,
0.7670338, -0.5980699, 0.8111652, 0.6392157, 0, 1, 1,
0.7685009, -0.001533214, 0.4615264, 0.6431373, 0, 1, 1,
0.7705446, -0.5480977, 2.662406, 0.6509804, 0, 1, 1,
0.7734916, -0.3004677, 2.411736, 0.654902, 0, 1, 1,
0.7781102, 0.7531716, 0.3849326, 0.6627451, 0, 1, 1,
0.7836161, -1.066966, 2.255637, 0.6666667, 0, 1, 1,
0.7874987, 0.5079677, 3.384172, 0.6745098, 0, 1, 1,
0.7877815, -0.8466962, 0.7742599, 0.6784314, 0, 1, 1,
0.7910383, -1.961292, 0.4233721, 0.6862745, 0, 1, 1,
0.7946713, 0.8715823, 0.2636663, 0.6901961, 0, 1, 1,
0.7988747, 0.5975203, -0.09945864, 0.6980392, 0, 1, 1,
0.8094273, 0.01398434, 2.357422, 0.7058824, 0, 1, 1,
0.8110555, 0.3542269, 0.7621965, 0.7098039, 0, 1, 1,
0.8160455, 0.4601469, 1.719545, 0.7176471, 0, 1, 1,
0.817717, 0.4656111, 0.01080561, 0.7215686, 0, 1, 1,
0.818541, 0.8206177, 0.9286709, 0.7294118, 0, 1, 1,
0.8185603, 0.6831447, 1.310721, 0.7333333, 0, 1, 1,
0.8217237, -0.3937941, 0.8786018, 0.7411765, 0, 1, 1,
0.8249777, -0.6622366, 3.023919, 0.7450981, 0, 1, 1,
0.8274761, -0.4262954, 0.529491, 0.7529412, 0, 1, 1,
0.8317816, -1.236616, 4.252374, 0.7568628, 0, 1, 1,
0.8318033, 0.01695582, 2.456412, 0.7647059, 0, 1, 1,
0.8373588, 1.510537, 0.6257721, 0.7686275, 0, 1, 1,
0.8413429, 0.1796326, 2.582597, 0.7764706, 0, 1, 1,
0.842146, -0.9615958, 3.003911, 0.7803922, 0, 1, 1,
0.8479559, 0.6036304, 0.1998441, 0.7882353, 0, 1, 1,
0.8501517, 2.603435, -0.3892276, 0.7921569, 0, 1, 1,
0.8502091, -0.7411535, 2.502131, 0.8, 0, 1, 1,
0.8517592, -1.480312, 2.61063, 0.8078431, 0, 1, 1,
0.8519709, -1.371075, 4.103704, 0.8117647, 0, 1, 1,
0.8526286, -0.2220664, 0.7028454, 0.8196079, 0, 1, 1,
0.8541374, -0.7815847, 2.669925, 0.8235294, 0, 1, 1,
0.8712869, 1.101257, 1.157387, 0.8313726, 0, 1, 1,
0.8748945, 0.05285908, -0.1987197, 0.8352941, 0, 1, 1,
0.8765028, -0.9490985, 4.311936, 0.8431373, 0, 1, 1,
0.8785771, -0.2473313, 2.206069, 0.8470588, 0, 1, 1,
0.8801315, -0.7734277, 3.19436, 0.854902, 0, 1, 1,
0.8823907, -1.058642, 0.004491603, 0.8588235, 0, 1, 1,
0.8848714, 0.3441682, 1.58695, 0.8666667, 0, 1, 1,
0.8873199, 1.151255, 1.714917, 0.8705882, 0, 1, 1,
0.8900417, 1.270372, 0.2539603, 0.8784314, 0, 1, 1,
0.8910983, 0.3963459, 1.247506, 0.8823529, 0, 1, 1,
0.8954843, -0.008265058, 0.4440308, 0.8901961, 0, 1, 1,
0.8989641, -0.8742116, 1.536096, 0.8941177, 0, 1, 1,
0.8996964, 0.2842211, 1.219018, 0.9019608, 0, 1, 1,
0.9030629, 0.5328957, 0.2622307, 0.9098039, 0, 1, 1,
0.9049364, 0.9817718, 1.612875, 0.9137255, 0, 1, 1,
0.914147, -0.1486614, 2.779578, 0.9215686, 0, 1, 1,
0.9163398, -0.7166812, 2.001253, 0.9254902, 0, 1, 1,
0.918616, -0.6985629, 3.131713, 0.9333333, 0, 1, 1,
0.9230737, 1.595991, -0.5682028, 0.9372549, 0, 1, 1,
0.9237342, -0.8576014, 1.31925, 0.945098, 0, 1, 1,
0.9241891, 0.4845833, 1.261758, 0.9490196, 0, 1, 1,
0.9263617, 1.24889, -0.2011153, 0.9568627, 0, 1, 1,
0.9367456, 0.101208, 0.8791142, 0.9607843, 0, 1, 1,
0.9386448, 0.4546889, 0.5611143, 0.9686275, 0, 1, 1,
0.9403238, -1.591101, 0.8997756, 0.972549, 0, 1, 1,
0.9478208, -0.4185345, 3.279544, 0.9803922, 0, 1, 1,
0.9494705, -0.08786477, 1.62152, 0.9843137, 0, 1, 1,
0.9497631, -0.3719286, 1.607675, 0.9921569, 0, 1, 1,
0.9499306, -1.351255, 3.012361, 0.9960784, 0, 1, 1,
0.9685723, 2.11328, 1.057172, 1, 0, 0.9960784, 1,
0.9737289, 1.511859, -0.6688337, 1, 0, 0.9882353, 1,
0.9846038, -1.797804, 2.083733, 1, 0, 0.9843137, 1,
0.9864325, -0.7226778, 2.676936, 1, 0, 0.9764706, 1,
0.9956951, 0.7307482, 1.568494, 1, 0, 0.972549, 1,
1.004145, -0.1090159, 0.5900536, 1, 0, 0.9647059, 1,
1.023174, 0.1734482, 0.6237524, 1, 0, 0.9607843, 1,
1.023322, -1.309952, 3.982049, 1, 0, 0.9529412, 1,
1.028764, 0.581476, 2.021301, 1, 0, 0.9490196, 1,
1.032814, -0.176475, 2.133033, 1, 0, 0.9411765, 1,
1.035555, -0.7662007, 3.451498, 1, 0, 0.9372549, 1,
1.037339, -0.6035838, 1.047197, 1, 0, 0.9294118, 1,
1.038059, 0.3952945, -0.1525062, 1, 0, 0.9254902, 1,
1.040076, -0.2800375, 0.67081, 1, 0, 0.9176471, 1,
1.052015, -0.3587216, 2.337713, 1, 0, 0.9137255, 1,
1.052186, -0.2353431, 1.995682, 1, 0, 0.9058824, 1,
1.055806, -0.9716402, 3.455259, 1, 0, 0.9019608, 1,
1.059206, -1.287999, 2.354959, 1, 0, 0.8941177, 1,
1.059508, -0.2363223, 2.299436, 1, 0, 0.8862745, 1,
1.060052, 0.3264291, 0.0612071, 1, 0, 0.8823529, 1,
1.066836, -0.2298504, 3.258016, 1, 0, 0.8745098, 1,
1.068058, -0.03366062, 1.911271, 1, 0, 0.8705882, 1,
1.06875, 0.1008907, 1.083976, 1, 0, 0.8627451, 1,
1.072943, -2.036349, 1.718555, 1, 0, 0.8588235, 1,
1.077702, 2.984739, 0.207048, 1, 0, 0.8509804, 1,
1.083528, 1.407663, 0.46929, 1, 0, 0.8470588, 1,
1.084585, 1.289429, 0.6541341, 1, 0, 0.8392157, 1,
1.084686, 0.2141447, 1.620208, 1, 0, 0.8352941, 1,
1.0974, 0.4373027, -0.6148258, 1, 0, 0.827451, 1,
1.109592, 1.023874, 1.290659, 1, 0, 0.8235294, 1,
1.120521, -1.736933, 1.101665, 1, 0, 0.8156863, 1,
1.124165, -0.1401861, 1.082763, 1, 0, 0.8117647, 1,
1.131318, 0.8518489, 0.2188833, 1, 0, 0.8039216, 1,
1.131626, 0.1391778, 2.852181, 1, 0, 0.7960784, 1,
1.138226, 0.6381985, 1.076628, 1, 0, 0.7921569, 1,
1.144447, -0.1048878, 2.128932, 1, 0, 0.7843137, 1,
1.150794, 0.2266931, 2.618089, 1, 0, 0.7803922, 1,
1.156412, -0.6945971, 3.252288, 1, 0, 0.772549, 1,
1.160735, -0.1365517, 1.67601, 1, 0, 0.7686275, 1,
1.164912, 0.3420906, 3.074789, 1, 0, 0.7607843, 1,
1.169396, 0.02786033, 2.076878, 1, 0, 0.7568628, 1,
1.170197, 0.03482366, 2.587959, 1, 0, 0.7490196, 1,
1.172079, -0.6755002, 1.788827, 1, 0, 0.7450981, 1,
1.177622, 1.859049, 0.2424914, 1, 0, 0.7372549, 1,
1.179419, 1.11756, 1.647646, 1, 0, 0.7333333, 1,
1.182454, 0.367853, 1.428426, 1, 0, 0.7254902, 1,
1.182481, 1.273639, 0.2375142, 1, 0, 0.7215686, 1,
1.189546, -0.6333183, 3.42439, 1, 0, 0.7137255, 1,
1.190808, -0.2348995, 0.3421888, 1, 0, 0.7098039, 1,
1.195919, -0.1571723, 0.03351761, 1, 0, 0.7019608, 1,
1.209994, -0.9371228, 4.038523, 1, 0, 0.6941177, 1,
1.214678, -1.175532, 2.062187, 1, 0, 0.6901961, 1,
1.223709, -0.9619397, 0.5073416, 1, 0, 0.682353, 1,
1.225006, -0.6995458, 2.542732, 1, 0, 0.6784314, 1,
1.231917, 0.6282476, 1.629147, 1, 0, 0.6705883, 1,
1.237316, 0.5963612, 1.887951, 1, 0, 0.6666667, 1,
1.242962, 0.9539571, -0.791858, 1, 0, 0.6588235, 1,
1.245083, 1.029436, 0.531326, 1, 0, 0.654902, 1,
1.263031, -0.2214325, -0.5495692, 1, 0, 0.6470588, 1,
1.26512, -0.629935, 2.939895, 1, 0, 0.6431373, 1,
1.27678, 0.7205926, -0.1222007, 1, 0, 0.6352941, 1,
1.299147, 0.292615, 3.327413, 1, 0, 0.6313726, 1,
1.299326, -0.2889198, 2.716106, 1, 0, 0.6235294, 1,
1.299704, 0.7516657, 0.1354161, 1, 0, 0.6196079, 1,
1.303778, -0.6635196, 2.450747, 1, 0, 0.6117647, 1,
1.303852, 1.259105, -0.851407, 1, 0, 0.6078432, 1,
1.308012, 1.859195, 1.652627, 1, 0, 0.6, 1,
1.319279, -0.4059631, 1.954755, 1, 0, 0.5921569, 1,
1.330077, -2.177902, 4.951348, 1, 0, 0.5882353, 1,
1.338049, 2.196523, 0.6096025, 1, 0, 0.5803922, 1,
1.341645, -1.746213, 2.504944, 1, 0, 0.5764706, 1,
1.351757, 0.1514598, 0.9683161, 1, 0, 0.5686275, 1,
1.351917, -0.02400079, 0.9645392, 1, 0, 0.5647059, 1,
1.356755, 0.5940682, -1.229784, 1, 0, 0.5568628, 1,
1.362976, -0.7634512, 1.841817, 1, 0, 0.5529412, 1,
1.365048, 0.6736644, 1.324876, 1, 0, 0.5450981, 1,
1.365719, 0.1165176, 0.2968737, 1, 0, 0.5411765, 1,
1.374687, -0.3161647, 1.711326, 1, 0, 0.5333334, 1,
1.379581, -1.151367, 3.678327, 1, 0, 0.5294118, 1,
1.380645, 0.9689096, -1.47478, 1, 0, 0.5215687, 1,
1.392006, 0.1274019, 1.648893, 1, 0, 0.5176471, 1,
1.417374, 1.039621, 0.8796404, 1, 0, 0.509804, 1,
1.418827, -0.8318327, 2.437068, 1, 0, 0.5058824, 1,
1.431644, 0.7465784, 1.734608, 1, 0, 0.4980392, 1,
1.432479, -1.217914, 2.590248, 1, 0, 0.4901961, 1,
1.433479, -0.5159804, 0.831592, 1, 0, 0.4862745, 1,
1.436882, 1.079237, 0.4435558, 1, 0, 0.4784314, 1,
1.447289, 0.112912, 1.508516, 1, 0, 0.4745098, 1,
1.450885, 1.597153, -0.05830908, 1, 0, 0.4666667, 1,
1.463993, -0.550262, 1.810049, 1, 0, 0.4627451, 1,
1.464326, -0.6429489, 1.294502, 1, 0, 0.454902, 1,
1.467269, -1.253851, 3.324098, 1, 0, 0.4509804, 1,
1.46775, 0.3018829, 0.03187762, 1, 0, 0.4431373, 1,
1.483309, -1.578711, 2.509417, 1, 0, 0.4392157, 1,
1.487305, 0.08162507, 0.02258687, 1, 0, 0.4313726, 1,
1.510215, 0.2457483, 1.456549, 1, 0, 0.427451, 1,
1.524914, 0.5477657, 1.577455, 1, 0, 0.4196078, 1,
1.532655, 0.4946623, 0.9500635, 1, 0, 0.4156863, 1,
1.53539, -1.020833, 2.751549, 1, 0, 0.4078431, 1,
1.553651, -0.5326612, 2.945481, 1, 0, 0.4039216, 1,
1.560812, -0.6303622, 2.700435, 1, 0, 0.3960784, 1,
1.592581, 1.118675, 0.7854688, 1, 0, 0.3882353, 1,
1.592772, -0.6378596, 2.603505, 1, 0, 0.3843137, 1,
1.599415, -1.002618, 1.937939, 1, 0, 0.3764706, 1,
1.599638, 0.5508794, 2.203248, 1, 0, 0.372549, 1,
1.601969, 0.4451472, 2.507698, 1, 0, 0.3647059, 1,
1.602088, 0.3819658, 0.5067697, 1, 0, 0.3607843, 1,
1.603827, 0.6885348, 1.114145, 1, 0, 0.3529412, 1,
1.606237, -1.158919, 3.040653, 1, 0, 0.3490196, 1,
1.609069, -0.3122807, 2.373601, 1, 0, 0.3411765, 1,
1.631386, 0.6790845, 1.402933, 1, 0, 0.3372549, 1,
1.652857, 0.8378171, 0.2130652, 1, 0, 0.3294118, 1,
1.65694, 1.083185, 2.415396, 1, 0, 0.3254902, 1,
1.694199, 0.9193949, 1.071645, 1, 0, 0.3176471, 1,
1.704263, -0.4210295, 2.096946, 1, 0, 0.3137255, 1,
1.707824, -0.4052584, 1.64158, 1, 0, 0.3058824, 1,
1.730913, -0.460473, 3.000911, 1, 0, 0.2980392, 1,
1.749212, 0.9298851, 2.265217, 1, 0, 0.2941177, 1,
1.751752, -0.9920989, 2.264933, 1, 0, 0.2862745, 1,
1.75697, 0.9925348, -0.1177144, 1, 0, 0.282353, 1,
1.759507, 0.7140523, -0.01739465, 1, 0, 0.2745098, 1,
1.763277, -1.692038, 1.92779, 1, 0, 0.2705882, 1,
1.767383, -0.5014128, 1.622916, 1, 0, 0.2627451, 1,
1.817613, 0.6293989, 0.615271, 1, 0, 0.2588235, 1,
1.82811, -1.761777, 1.677321, 1, 0, 0.2509804, 1,
1.852894, -0.427953, 2.607858, 1, 0, 0.2470588, 1,
1.866478, 0.67704, 3.465776, 1, 0, 0.2392157, 1,
1.880366, -1.563216, 4.302981, 1, 0, 0.2352941, 1,
1.893194, 0.2986685, 1.312096, 1, 0, 0.227451, 1,
1.913358, 0.0372576, 1.175762, 1, 0, 0.2235294, 1,
1.915794, -0.9529966, 2.024145, 1, 0, 0.2156863, 1,
1.927263, -0.2542847, 1.376264, 1, 0, 0.2117647, 1,
1.931116, 0.7943743, 3.48914, 1, 0, 0.2039216, 1,
1.932361, -0.5735428, 2.024443, 1, 0, 0.1960784, 1,
1.945989, -0.0007347955, 2.314195, 1, 0, 0.1921569, 1,
1.961024, -2.160252, 2.242079, 1, 0, 0.1843137, 1,
1.972775, -0.2503474, -0.1606752, 1, 0, 0.1803922, 1,
2.004326, -0.04233995, 1.542959, 1, 0, 0.172549, 1,
2.005865, 1.784816, 0.265056, 1, 0, 0.1686275, 1,
2.049413, -0.4366792, 2.502889, 1, 0, 0.1607843, 1,
2.053402, 0.2073082, 0.3916153, 1, 0, 0.1568628, 1,
2.06562, -0.6995671, 2.701911, 1, 0, 0.1490196, 1,
2.088381, 1.288618, 1.741475, 1, 0, 0.145098, 1,
2.113936, 0.6774084, 0.9078338, 1, 0, 0.1372549, 1,
2.123097, -0.6800131, 0.6670617, 1, 0, 0.1333333, 1,
2.132917, 0.9725929, 1.426056, 1, 0, 0.1254902, 1,
2.169791, -0.8770657, 1.314006, 1, 0, 0.1215686, 1,
2.184762, 0.01159211, 2.187442, 1, 0, 0.1137255, 1,
2.236243, -0.2863671, 0.3027651, 1, 0, 0.1098039, 1,
2.24513, 0.5771455, 2.586437, 1, 0, 0.1019608, 1,
2.255996, 0.4273863, 1.38099, 1, 0, 0.09411765, 1,
2.258603, -0.3842018, 2.049102, 1, 0, 0.09019608, 1,
2.299248, 1.105791, 0.6119965, 1, 0, 0.08235294, 1,
2.32873, -0.9651635, 2.590428, 1, 0, 0.07843138, 1,
2.342421, -0.09884924, 0.3018908, 1, 0, 0.07058824, 1,
2.354593, 1.173762, 0.5831539, 1, 0, 0.06666667, 1,
2.454213, -0.9720395, 0.6620002, 1, 0, 0.05882353, 1,
2.46799, -0.4577239, 0.8935628, 1, 0, 0.05490196, 1,
2.620517, 0.1552433, 0.9160507, 1, 0, 0.04705882, 1,
2.687338, 1.329579, 1.27666, 1, 0, 0.04313726, 1,
2.729584, 0.1985988, 1.250776, 1, 0, 0.03529412, 1,
2.766101, -2.950489, 2.03352, 1, 0, 0.03137255, 1,
2.90517, 0.4465604, 2.040223, 1, 0, 0.02352941, 1,
3.178332, 0.4967794, 0.7452381, 1, 0, 0.01960784, 1,
3.214507, 0.5436081, -1.033817, 1, 0, 0.01176471, 1,
3.287941, 0.2307322, 1.928498, 1, 0, 0.007843138, 1
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
0.2686503, -4.234465, -8.324841, 0, -0.5, 0.5, 0.5,
0.2686503, -4.234465, -8.324841, 1, -0.5, 0.5, 0.5,
0.2686503, -4.234465, -8.324841, 1, 1.5, 0.5, 0.5,
0.2686503, -4.234465, -8.324841, 0, 1.5, 0.5, 0.5
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
-3.77418, 0.6003746, -8.324841, 0, -0.5, 0.5, 0.5,
-3.77418, 0.6003746, -8.324841, 1, -0.5, 0.5, 0.5,
-3.77418, 0.6003746, -8.324841, 1, 1.5, 0.5, 0.5,
-3.77418, 0.6003746, -8.324841, 0, 1.5, 0.5, 0.5
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
-3.77418, -4.234465, -0.3938272, 0, -0.5, 0.5, 0.5,
-3.77418, -4.234465, -0.3938272, 1, -0.5, 0.5, 0.5,
-3.77418, -4.234465, -0.3938272, 1, 1.5, 0.5, 0.5,
-3.77418, -4.234465, -0.3938272, 0, 1.5, 0.5, 0.5
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
-2, -3.118733, -6.494607,
3, -3.118733, -6.494607,
-2, -3.118733, -6.494607,
-2, -3.304688, -6.799647,
-1, -3.118733, -6.494607,
-1, -3.304688, -6.799647,
0, -3.118733, -6.494607,
0, -3.304688, -6.799647,
1, -3.118733, -6.494607,
1, -3.304688, -6.799647,
2, -3.118733, -6.494607,
2, -3.304688, -6.799647,
3, -3.118733, -6.494607,
3, -3.304688, -6.799647
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
-2, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
-2, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
-2, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
-2, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5,
-1, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
-1, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
-1, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
-1, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5,
0, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
0, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
0, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
0, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5,
1, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
1, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
1, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
1, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5,
2, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
2, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
2, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
2, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5,
3, -3.676599, -7.409725, 0, -0.5, 0.5, 0.5,
3, -3.676599, -7.409725, 1, -0.5, 0.5, 0.5,
3, -3.676599, -7.409725, 1, 1.5, 0.5, 0.5,
3, -3.676599, -7.409725, 0, 1.5, 0.5, 0.5
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
-2.841219, -2, -6.494607,
-2.841219, 4, -6.494607,
-2.841219, -2, -6.494607,
-2.996713, -2, -6.799647,
-2.841219, 0, -6.494607,
-2.996713, 0, -6.799647,
-2.841219, 2, -6.494607,
-2.996713, 2, -6.799647,
-2.841219, 4, -6.494607,
-2.996713, 4, -6.799647
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
-3.307699, -2, -7.409725, 0, -0.5, 0.5, 0.5,
-3.307699, -2, -7.409725, 1, -0.5, 0.5, 0.5,
-3.307699, -2, -7.409725, 1, 1.5, 0.5, 0.5,
-3.307699, -2, -7.409725, 0, 1.5, 0.5, 0.5,
-3.307699, 0, -7.409725, 0, -0.5, 0.5, 0.5,
-3.307699, 0, -7.409725, 1, -0.5, 0.5, 0.5,
-3.307699, 0, -7.409725, 1, 1.5, 0.5, 0.5,
-3.307699, 0, -7.409725, 0, 1.5, 0.5, 0.5,
-3.307699, 2, -7.409725, 0, -0.5, 0.5, 0.5,
-3.307699, 2, -7.409725, 1, -0.5, 0.5, 0.5,
-3.307699, 2, -7.409725, 1, 1.5, 0.5, 0.5,
-3.307699, 2, -7.409725, 0, 1.5, 0.5, 0.5,
-3.307699, 4, -7.409725, 0, -0.5, 0.5, 0.5,
-3.307699, 4, -7.409725, 1, -0.5, 0.5, 0.5,
-3.307699, 4, -7.409725, 1, 1.5, 0.5, 0.5,
-3.307699, 4, -7.409725, 0, 1.5, 0.5, 0.5
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
-2.841219, -3.118733, -6,
-2.841219, -3.118733, 4,
-2.841219, -3.118733, -6,
-2.996713, -3.304688, -6,
-2.841219, -3.118733, -4,
-2.996713, -3.304688, -4,
-2.841219, -3.118733, -2,
-2.996713, -3.304688, -2,
-2.841219, -3.118733, 0,
-2.996713, -3.304688, 0,
-2.841219, -3.118733, 2,
-2.996713, -3.304688, 2,
-2.841219, -3.118733, 4,
-2.996713, -3.304688, 4
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
-3.307699, -3.676599, -6, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -6, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -6, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, -6, 0, 1.5, 0.5, 0.5,
-3.307699, -3.676599, -4, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -4, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -4, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, -4, 0, 1.5, 0.5, 0.5,
-3.307699, -3.676599, -2, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -2, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, -2, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, -2, 0, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 0, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 0, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 0, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 0, 0, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 2, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 2, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 2, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 2, 0, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 4, 0, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 4, 1, -0.5, 0.5, 0.5,
-3.307699, -3.676599, 4, 1, 1.5, 0.5, 0.5,
-3.307699, -3.676599, 4, 0, 1.5, 0.5, 0.5
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
-2.841219, -3.118733, -6.494607,
-2.841219, 4.319482, -6.494607,
-2.841219, -3.118733, 5.706953,
-2.841219, 4.319482, 5.706953,
-2.841219, -3.118733, -6.494607,
-2.841219, -3.118733, 5.706953,
-2.841219, 4.319482, -6.494607,
-2.841219, 4.319482, 5.706953,
-2.841219, -3.118733, -6.494607,
3.37852, -3.118733, -6.494607,
-2.841219, -3.118733, 5.706953,
3.37852, -3.118733, 5.706953,
-2.841219, 4.319482, -6.494607,
3.37852, 4.319482, -6.494607,
-2.841219, 4.319482, 5.706953,
3.37852, 4.319482, 5.706953,
3.37852, -3.118733, -6.494607,
3.37852, 4.319482, -6.494607,
3.37852, -3.118733, 5.706953,
3.37852, 4.319482, 5.706953,
3.37852, -3.118733, -6.494607,
3.37852, -3.118733, 5.706953,
3.37852, 4.319482, -6.494607,
3.37852, 4.319482, 5.706953
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
var radius = 8.322054;
var distance = 37.02576;
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
mvMatrix.translate( -0.2686503, -0.6003746, 0.3938272 );
mvMatrix.scale( 1.446679, 1.209695, 0.737444 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.02576);
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
pyridaben<-read.table("pyridaben.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridaben$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
```

```r
y<-pyridaben$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
```

```r
z<-pyridaben$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
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
-2.75064, -1.149682, -3.067782, 0, 0, 1, 1, 1,
-2.616248, 1.315707, -3.232018, 1, 0, 0, 1, 1,
-2.548664, 1.164034, -1.186288, 1, 0, 0, 1, 1,
-2.543241, -2.338469, -0.7428621, 1, 0, 0, 1, 1,
-2.512298, -1.199211, -2.41977, 1, 0, 0, 1, 1,
-2.460164, 0.07264009, 0.461484, 1, 0, 0, 1, 1,
-2.395697, -0.0573558, 0.4133274, 0, 0, 0, 1, 1,
-2.395238, -0.8882978, -1.801593, 0, 0, 0, 1, 1,
-2.373172, 0.117074, -2.354689, 0, 0, 0, 1, 1,
-2.358245, 1.227366, -0.4660293, 0, 0, 0, 1, 1,
-2.326147, -1.104184, -3.15856, 0, 0, 0, 1, 1,
-2.213827, 0.5723492, -1.226515, 0, 0, 0, 1, 1,
-2.21083, 0.7074065, -1.477176, 0, 0, 0, 1, 1,
-2.163943, 0.9889355, 1.270726, 1, 1, 1, 1, 1,
-2.154012, 0.6899025, -2.031431, 1, 1, 1, 1, 1,
-2.140709, 0.091028, -1.917691, 1, 1, 1, 1, 1,
-2.121701, 0.9117616, -0.4876073, 1, 1, 1, 1, 1,
-2.080823, -1.106936, -2.75398, 1, 1, 1, 1, 1,
-2.067625, -1.259112, -0.4150265, 1, 1, 1, 1, 1,
-2.022536, 0.8751753, -0.9960837, 1, 1, 1, 1, 1,
-2.022481, -1.966033, -3.681567, 1, 1, 1, 1, 1,
-2.002018, 0.9655462, -3.65454, 1, 1, 1, 1, 1,
-1.951539, -0.1955483, -1.995355, 1, 1, 1, 1, 1,
-1.906232, 1.777117, -1.750226, 1, 1, 1, 1, 1,
-1.891721, -0.06307819, -1.948896, 1, 1, 1, 1, 1,
-1.856996, -1.672376, -0.2307955, 1, 1, 1, 1, 1,
-1.854108, 1.30088, -1.658404, 1, 1, 1, 1, 1,
-1.846423, 0.5991905, -0.7643893, 1, 1, 1, 1, 1,
-1.838736, 1.254837, -1.495366, 0, 0, 1, 1, 1,
-1.821945, -1.704746, -0.8777939, 1, 0, 0, 1, 1,
-1.819592, -0.5067535, -1.900335, 1, 0, 0, 1, 1,
-1.802206, 2.212824, 0.6951135, 1, 0, 0, 1, 1,
-1.788746, -0.1477015, -2.488765, 1, 0, 0, 1, 1,
-1.785303, -0.9854187, -1.009978, 1, 0, 0, 1, 1,
-1.782984, 1.815801, -2.675354, 0, 0, 0, 1, 1,
-1.757843, -1.091813, -3.22561, 0, 0, 0, 1, 1,
-1.753138, 0.4764189, -2.327816, 0, 0, 0, 1, 1,
-1.725213, 0.08573896, -1.056335, 0, 0, 0, 1, 1,
-1.721581, -0.1392093, -1.372136, 0, 0, 0, 1, 1,
-1.713554, 0.383635, -0.8757939, 0, 0, 0, 1, 1,
-1.700377, 0.4465335, -0.9175566, 0, 0, 0, 1, 1,
-1.692601, 2.141216, -0.3652725, 1, 1, 1, 1, 1,
-1.688351, 1.727141, 0.3713776, 1, 1, 1, 1, 1,
-1.68041, -0.2021808, 0.05778303, 1, 1, 1, 1, 1,
-1.68035, 0.1867201, -1.230755, 1, 1, 1, 1, 1,
-1.672785, 1.443079, -1.305048, 1, 1, 1, 1, 1,
-1.657758, 1.282625, -0.9631823, 1, 1, 1, 1, 1,
-1.643617, 0.6855496, 0.3575267, 1, 1, 1, 1, 1,
-1.640784, 0.5338218, -1.421373, 1, 1, 1, 1, 1,
-1.639883, 0.8297909, -3.510537, 1, 1, 1, 1, 1,
-1.622185, -1.057595, -2.49464, 1, 1, 1, 1, 1,
-1.620975, 0.3383936, -1.327101, 1, 1, 1, 1, 1,
-1.612763, -2.446836, -2.519659, 1, 1, 1, 1, 1,
-1.608057, -0.7714439, -1.385867, 1, 1, 1, 1, 1,
-1.595372, 0.4796921, -1.646678, 1, 1, 1, 1, 1,
-1.591414, -0.4270952, -2.115464, 1, 1, 1, 1, 1,
-1.589893, 0.8202045, -0.8003736, 0, 0, 1, 1, 1,
-1.582262, -0.5463882, -1.822729, 1, 0, 0, 1, 1,
-1.57489, 0.688059, -1.239726, 1, 0, 0, 1, 1,
-1.574504, -0.1951116, -1.634565, 1, 0, 0, 1, 1,
-1.56118, 0.4310245, 0.4264247, 1, 0, 0, 1, 1,
-1.559911, 0.6056833, -0.2010598, 1, 0, 0, 1, 1,
-1.556432, 0.9510504, -2.055118, 0, 0, 0, 1, 1,
-1.548692, 1.109692, -2.215371, 0, 0, 0, 1, 1,
-1.543784, -1.636894, -1.750072, 0, 0, 0, 1, 1,
-1.534404, 0.6215786, -2.380987, 0, 0, 0, 1, 1,
-1.530107, 0.2370578, -1.994159, 0, 0, 0, 1, 1,
-1.52914, 0.714456, -3.164881, 0, 0, 0, 1, 1,
-1.524795, -0.06693326, -1.245212, 0, 0, 0, 1, 1,
-1.514726, 1.952012, -1.894851, 1, 1, 1, 1, 1,
-1.514105, -1.224233, -4.405151, 1, 1, 1, 1, 1,
-1.502338, 1.282649, -0.9770281, 1, 1, 1, 1, 1,
-1.500883, 0.3766374, -1.562668, 1, 1, 1, 1, 1,
-1.493963, -0.7430376, -1.292447, 1, 1, 1, 1, 1,
-1.483952, 0.06340136, -0.87858, 1, 1, 1, 1, 1,
-1.47289, -1.632555, -3.424858, 1, 1, 1, 1, 1,
-1.470955, 1.602437, -0.182891, 1, 1, 1, 1, 1,
-1.468483, 0.3985191, -1.678489, 1, 1, 1, 1, 1,
-1.464926, 0.3687069, -2.564295, 1, 1, 1, 1, 1,
-1.428246, -0.4355196, -2.126552, 1, 1, 1, 1, 1,
-1.418885, 0.3263337, -1.94536, 1, 1, 1, 1, 1,
-1.412265, 1.341972, -0.3291898, 1, 1, 1, 1, 1,
-1.40192, -1.488271, -0.769767, 1, 1, 1, 1, 1,
-1.391655, -0.006091053, -3.273234, 1, 1, 1, 1, 1,
-1.388324, -0.5150695, -1.383665, 0, 0, 1, 1, 1,
-1.386103, -0.9868038, -1.765241, 1, 0, 0, 1, 1,
-1.371538, 0.8597314, -1.641309, 1, 0, 0, 1, 1,
-1.356825, 1.077791, -1.22631, 1, 0, 0, 1, 1,
-1.355114, 1.172524, -0.3110355, 1, 0, 0, 1, 1,
-1.354812, -0.5194661, -5.443773, 1, 0, 0, 1, 1,
-1.350023, -1.380253, -2.638543, 0, 0, 0, 1, 1,
-1.344151, 0.5278154, -0.5574601, 0, 0, 0, 1, 1,
-1.34286, 0.8171034, -1.938182, 0, 0, 0, 1, 1,
-1.339776, -0.3442034, -0.4722238, 0, 0, 0, 1, 1,
-1.337873, 0.02011205, -1.77236, 0, 0, 0, 1, 1,
-1.332915, -0.5622839, -3.347375, 0, 0, 0, 1, 1,
-1.330471, -0.7447269, -2.062588, 0, 0, 0, 1, 1,
-1.323197, 0.03798817, -0.3852662, 1, 1, 1, 1, 1,
-1.321416, 0.2296494, -0.01123164, 1, 1, 1, 1, 1,
-1.317932, -1.018114, -0.9371515, 1, 1, 1, 1, 1,
-1.313981, -0.278378, -1.437192, 1, 1, 1, 1, 1,
-1.304291, 0.9982148, -1.070616, 1, 1, 1, 1, 1,
-1.295288, -0.7015998, -1.807062, 1, 1, 1, 1, 1,
-1.290369, 1.159679, -1.718191, 1, 1, 1, 1, 1,
-1.285896, -2.622867, -2.273952, 1, 1, 1, 1, 1,
-1.282906, -2.043714, -2.50191, 1, 1, 1, 1, 1,
-1.259843, 1.005836, -0.9786208, 1, 1, 1, 1, 1,
-1.245432, 0.7746854, -0.5175195, 1, 1, 1, 1, 1,
-1.240518, -1.113916, -2.353503, 1, 1, 1, 1, 1,
-1.229364, -0.3618512, -2.114061, 1, 1, 1, 1, 1,
-1.221208, 0.6843529, -1.753602, 1, 1, 1, 1, 1,
-1.220607, 0.8415269, -0.9623453, 1, 1, 1, 1, 1,
-1.217008, -0.3038757, -3.205458, 0, 0, 1, 1, 1,
-1.216521, -1.333475, -2.533618, 1, 0, 0, 1, 1,
-1.201686, 1.244495, -2.052432, 1, 0, 0, 1, 1,
-1.195796, -0.6918877, -1.485501, 1, 0, 0, 1, 1,
-1.189611, 2.057444, -0.4053558, 1, 0, 0, 1, 1,
-1.187447, -0.005390007, -0.8870713, 1, 0, 0, 1, 1,
-1.184047, -0.1737997, -1.61039, 0, 0, 0, 1, 1,
-1.183008, 0.1992295, -2.702248, 0, 0, 0, 1, 1,
-1.16218, 0.8532176, 0.2360581, 0, 0, 0, 1, 1,
-1.153683, -0.4996629, -0.6968601, 0, 0, 0, 1, 1,
-1.147272, 0.756229, 0.1287747, 0, 0, 0, 1, 1,
-1.145959, -0.8296114, -2.158853, 0, 0, 0, 1, 1,
-1.143332, 0.05923747, -2.727975, 0, 0, 0, 1, 1,
-1.141852, 0.4478588, -0.7697933, 1, 1, 1, 1, 1,
-1.139058, -1.6582, -1.919869, 1, 1, 1, 1, 1,
-1.138818, -0.7726002, -1.447249, 1, 1, 1, 1, 1,
-1.137276, -0.6259595, -2.101377, 1, 1, 1, 1, 1,
-1.136672, -0.02197914, 0.2328795, 1, 1, 1, 1, 1,
-1.135038, -2.410819, -2.782942, 1, 1, 1, 1, 1,
-1.13093, 0.5049984, -2.385541, 1, 1, 1, 1, 1,
-1.130357, -0.9628698, -0.9640643, 1, 1, 1, 1, 1,
-1.122944, -0.9146338, -3.552577, 1, 1, 1, 1, 1,
-1.113789, 0.9626286, -2.40523, 1, 1, 1, 1, 1,
-1.111491, -0.3834206, -2.769156, 1, 1, 1, 1, 1,
-1.110179, -0.924897, -1.34135, 1, 1, 1, 1, 1,
-1.108473, -2.320259, -1.638513, 1, 1, 1, 1, 1,
-1.10471, -0.2546878, -3.042968, 1, 1, 1, 1, 1,
-1.096002, -1.652322, -2.655554, 1, 1, 1, 1, 1,
-1.092532, -0.4652632, -3.353585, 0, 0, 1, 1, 1,
-1.083113, 0.03899604, -1.826966, 1, 0, 0, 1, 1,
-1.070513, -0.564701, -3.022187, 1, 0, 0, 1, 1,
-1.070117, -0.4092943, -2.222694, 1, 0, 0, 1, 1,
-1.069587, 0.1523896, -2.299215, 1, 0, 0, 1, 1,
-1.067466, -0.5851493, -1.977245, 1, 0, 0, 1, 1,
-1.062691, -0.8545116, -2.521775, 0, 0, 0, 1, 1,
-1.059839, 0.6107052, -1.686267, 0, 0, 0, 1, 1,
-1.058399, -1.205349, -2.096955, 0, 0, 0, 1, 1,
-1.05707, 0.4454803, -0.03469367, 0, 0, 0, 1, 1,
-1.049606, 0.8847666, 0.1982299, 0, 0, 0, 1, 1,
-1.049526, 0.8340085, -0.6661554, 0, 0, 0, 1, 1,
-1.036946, 1.369065, -0.9138902, 0, 0, 0, 1, 1,
-1.035743, 1.600947, -2.861058, 1, 1, 1, 1, 1,
-1.033975, -0.3269059, -0.440511, 1, 1, 1, 1, 1,
-1.033471, 1.096933, -1.216166, 1, 1, 1, 1, 1,
-1.031312, -1.522876, -2.579136, 1, 1, 1, 1, 1,
-1.030882, -0.7400479, -1.049089, 1, 1, 1, 1, 1,
-1.028053, 0.7475266, -0.8120467, 1, 1, 1, 1, 1,
-1.022172, -0.8594842, -2.127706, 1, 1, 1, 1, 1,
-1.020999, 0.7208827, -1.989551, 1, 1, 1, 1, 1,
-1.01136, -0.365802, -2.65609, 1, 1, 1, 1, 1,
-1.01116, -1.00871, -1.957982, 1, 1, 1, 1, 1,
-1.007792, 0.8171459, -0.3005403, 1, 1, 1, 1, 1,
-1.007766, -0.3986638, -2.135078, 1, 1, 1, 1, 1,
-0.991104, 1.480003, -0.2687544, 1, 1, 1, 1, 1,
-0.9892983, -0.633863, -3.591254, 1, 1, 1, 1, 1,
-0.9760299, 0.7611198, -1.919966, 1, 1, 1, 1, 1,
-0.9719362, 2.013514, 0.7032067, 0, 0, 1, 1, 1,
-0.9691874, 1.549597, -0.9983091, 1, 0, 0, 1, 1,
-0.9439747, -0.2928287, -1.470012, 1, 0, 0, 1, 1,
-0.932153, -0.3765799, -2.571167, 1, 0, 0, 1, 1,
-0.918442, -2.120487, -2.482167, 1, 0, 0, 1, 1,
-0.9077314, 0.01705835, -2.508761, 1, 0, 0, 1, 1,
-0.9034415, 0.08636759, -1.444374, 0, 0, 0, 1, 1,
-0.897421, 0.1468606, -1.526719, 0, 0, 0, 1, 1,
-0.8878492, -0.07203016, -1.486569, 0, 0, 0, 1, 1,
-0.883624, 1.433917, -0.1299237, 0, 0, 0, 1, 1,
-0.8747424, -0.1062011, -2.741677, 0, 0, 0, 1, 1,
-0.8740724, -0.963429, -1.341471, 0, 0, 0, 1, 1,
-0.8729929, -0.322275, -1.229089, 0, 0, 0, 1, 1,
-0.8723797, -0.7483414, -1.858964, 1, 1, 1, 1, 1,
-0.8574814, 1.034237, 0.9127979, 1, 1, 1, 1, 1,
-0.8470241, 0.6720625, 0.6266544, 1, 1, 1, 1, 1,
-0.841813, -1.27171, -0.8347864, 1, 1, 1, 1, 1,
-0.8397635, 0.7896882, -0.8980189, 1, 1, 1, 1, 1,
-0.834798, 0.1124122, -0.9468422, 1, 1, 1, 1, 1,
-0.8298348, -0.6234887, 0.03811813, 1, 1, 1, 1, 1,
-0.8190826, 0.2026851, -1.727315, 1, 1, 1, 1, 1,
-0.8177876, -0.07926717, -0.6682363, 1, 1, 1, 1, 1,
-0.816874, -0.4478878, -1.967988, 1, 1, 1, 1, 1,
-0.8140278, 0.2270351, -1.505131, 1, 1, 1, 1, 1,
-0.8074384, -1.500873, -3.2016, 1, 1, 1, 1, 1,
-0.8035407, -0.3634135, -1.807532, 1, 1, 1, 1, 1,
-0.8014143, 0.7933902, 0.9284443, 1, 1, 1, 1, 1,
-0.7912145, 0.7510309, -0.6964735, 1, 1, 1, 1, 1,
-0.7911811, -0.7885026, -2.480556, 0, 0, 1, 1, 1,
-0.7843153, -0.2019351, -3.840158, 1, 0, 0, 1, 1,
-0.783086, -0.6861432, -3.587896, 1, 0, 0, 1, 1,
-0.782968, -0.027757, -1.380287, 1, 0, 0, 1, 1,
-0.7792322, 0.02924559, -2.516546, 1, 0, 0, 1, 1,
-0.7772083, 0.330497, -0.3098583, 1, 0, 0, 1, 1,
-0.7767156, -0.2740152, -2.743338, 0, 0, 0, 1, 1,
-0.7766667, 0.9637591, 0.5393674, 0, 0, 0, 1, 1,
-0.7725641, 0.8909526, 0.7525882, 0, 0, 0, 1, 1,
-0.7688931, -0.7656524, -4.271277, 0, 0, 0, 1, 1,
-0.7675744, 0.6023824, -2.318728, 0, 0, 0, 1, 1,
-0.745824, 0.4851514, -2.550797, 0, 0, 0, 1, 1,
-0.7454798, -1.443389, -2.278797, 0, 0, 0, 1, 1,
-0.7429309, 0.3757734, -1.110777, 1, 1, 1, 1, 1,
-0.7395707, -1.335721, -2.875047, 1, 1, 1, 1, 1,
-0.7232007, -1.418893, -1.517192, 1, 1, 1, 1, 1,
-0.7227223, -0.3156653, -1.815391, 1, 1, 1, 1, 1,
-0.7181422, -0.8606603, -3.463632, 1, 1, 1, 1, 1,
-0.7176297, -0.2091995, -0.6320946, 1, 1, 1, 1, 1,
-0.7175459, 1.929668, -0.1994345, 1, 1, 1, 1, 1,
-0.7157931, 1.072669, -0.8302259, 1, 1, 1, 1, 1,
-0.7123678, -0.3000156, -1.893423, 1, 1, 1, 1, 1,
-0.6979821, -0.1942523, -0.6675965, 1, 1, 1, 1, 1,
-0.6919043, 1.146576, -1.059605, 1, 1, 1, 1, 1,
-0.6910533, 1.602575, -0.815655, 1, 1, 1, 1, 1,
-0.6838082, 1.284995, -1.016143, 1, 1, 1, 1, 1,
-0.6824903, -1.388088, -2.577626, 1, 1, 1, 1, 1,
-0.6778138, 0.8339018, -1.049368, 1, 1, 1, 1, 1,
-0.6747735, -0.5944452, -2.600153, 0, 0, 1, 1, 1,
-0.6744406, 1.218863, -1.333126, 1, 0, 0, 1, 1,
-0.6737324, -0.735245, -4.195355, 1, 0, 0, 1, 1,
-0.667996, -0.520198, -0.575257, 1, 0, 0, 1, 1,
-0.6678523, 0.44713, -0.781857, 1, 0, 0, 1, 1,
-0.6674834, 1.86539, -0.6023929, 1, 0, 0, 1, 1,
-0.666653, -0.9342585, -2.200925, 0, 0, 0, 1, 1,
-0.6618229, 0.3012144, -1.452142, 0, 0, 0, 1, 1,
-0.659773, -0.2304909, -2.202682, 0, 0, 0, 1, 1,
-0.6589263, 1.533527, 0.5781343, 0, 0, 0, 1, 1,
-0.6488634, 0.5058903, -0.2580295, 0, 0, 0, 1, 1,
-0.6468496, -1.24605, -4.231589, 0, 0, 0, 1, 1,
-0.6439339, 2.330685, 0.3647963, 0, 0, 0, 1, 1,
-0.6428789, 0.1059729, -1.398271, 1, 1, 1, 1, 1,
-0.6410905, -0.1737451, -3.430996, 1, 1, 1, 1, 1,
-0.6330271, 0.3627771, -1.45738, 1, 1, 1, 1, 1,
-0.6289816, -0.8034626, -2.71717, 1, 1, 1, 1, 1,
-0.6256369, -0.3081321, -3.849624, 1, 1, 1, 1, 1,
-0.6198509, 0.9582394, -1.362282, 1, 1, 1, 1, 1,
-0.6130398, 0.4760444, -1.164892, 1, 1, 1, 1, 1,
-0.6106026, -0.6006767, -1.631182, 1, 1, 1, 1, 1,
-0.6103288, 0.9283265, 0.6260446, 1, 1, 1, 1, 1,
-0.6024252, 0.9476827, -1.253656, 1, 1, 1, 1, 1,
-0.601039, 0.9637671, -2.031694, 1, 1, 1, 1, 1,
-0.594672, 0.05540448, -0.2452129, 1, 1, 1, 1, 1,
-0.5945178, -0.7139962, -2.191592, 1, 1, 1, 1, 1,
-0.5937864, 0.8168318, -1.177925, 1, 1, 1, 1, 1,
-0.5889537, -1.313849, -2.109835, 1, 1, 1, 1, 1,
-0.5863184, -0.6511245, -1.355213, 0, 0, 1, 1, 1,
-0.5833942, 0.2987765, -1.229481, 1, 0, 0, 1, 1,
-0.582949, 1.2399, -1.451651, 1, 0, 0, 1, 1,
-0.5791906, -1.240265, -2.197314, 1, 0, 0, 1, 1,
-0.5743039, 0.8697261, -0.1558303, 1, 0, 0, 1, 1,
-0.5732355, -0.4684117, -1.906304, 1, 0, 0, 1, 1,
-0.5721434, -1.376044, -2.561916, 0, 0, 0, 1, 1,
-0.571018, -0.3695796, -2.612795, 0, 0, 0, 1, 1,
-0.5702456, -1.279501, -2.60594, 0, 0, 0, 1, 1,
-0.565524, -1.189712, -4.3442, 0, 0, 0, 1, 1,
-0.5643663, 0.2042716, -0.01021727, 0, 0, 0, 1, 1,
-0.5588465, -1.331998, -1.046797, 0, 0, 0, 1, 1,
-0.5544729, -0.5958918, -1.554174, 0, 0, 0, 1, 1,
-0.5541821, 0.6134524, -1.490604, 1, 1, 1, 1, 1,
-0.551055, 0.4326004, -0.7249181, 1, 1, 1, 1, 1,
-0.5501614, 1.579765, -0.6039848, 1, 1, 1, 1, 1,
-0.5442445, 0.6758407, -0.1869063, 1, 1, 1, 1, 1,
-0.5440536, -0.04471856, -1.026168, 1, 1, 1, 1, 1,
-0.5377943, -1.374279, -1.939344, 1, 1, 1, 1, 1,
-0.5368982, 0.1720529, 0.1048693, 1, 1, 1, 1, 1,
-0.5339159, 0.005070218, 0.6332162, 1, 1, 1, 1, 1,
-0.530811, 0.004153394, -1.524257, 1, 1, 1, 1, 1,
-0.530775, -0.6168721, -2.938678, 1, 1, 1, 1, 1,
-0.5303041, -0.6539621, -1.85342, 1, 1, 1, 1, 1,
-0.5291834, -0.3388183, -1.127704, 1, 1, 1, 1, 1,
-0.5274616, 2.254746, -1.723836, 1, 1, 1, 1, 1,
-0.526208, 1.57316, -0.3281277, 1, 1, 1, 1, 1,
-0.5228689, 0.2757505, -1.899375, 1, 1, 1, 1, 1,
-0.5216404, -0.08146467, -2.842525, 0, 0, 1, 1, 1,
-0.5169339, -0.3297069, -2.625919, 1, 0, 0, 1, 1,
-0.5095142, -0.7981673, -4.013219, 1, 0, 0, 1, 1,
-0.5087053, 1.142931, -0.4673766, 1, 0, 0, 1, 1,
-0.5080471, -0.1107241, -1.968342, 1, 0, 0, 1, 1,
-0.5072822, 0.06722426, -2.731836, 1, 0, 0, 1, 1,
-0.5049389, -0.05301936, -1.702198, 0, 0, 0, 1, 1,
-0.5040073, 0.6641746, -0.3221346, 0, 0, 0, 1, 1,
-0.500854, 0.9778621, 0.4839224, 0, 0, 0, 1, 1,
-0.49987, -0.7262961, -2.245982, 0, 0, 0, 1, 1,
-0.4954589, 2.404116, -0.2219481, 0, 0, 0, 1, 1,
-0.4883092, -1.346174, -3.568648, 0, 0, 0, 1, 1,
-0.4882635, 2.405642, -0.6909974, 0, 0, 0, 1, 1,
-0.4881058, 0.2475043, -1.696174, 1, 1, 1, 1, 1,
-0.4847608, -0.8386936, -1.977479, 1, 1, 1, 1, 1,
-0.4776173, 1.346893, -2.257845, 1, 1, 1, 1, 1,
-0.4772654, -0.7125775, -3.287228, 1, 1, 1, 1, 1,
-0.4709158, 0.442599, -1.537146, 1, 1, 1, 1, 1,
-0.4691895, -1.011078, -3.08465, 1, 1, 1, 1, 1,
-0.4687998, 0.9578557, -0.8886673, 1, 1, 1, 1, 1,
-0.467771, -1.025598, -1.358332, 1, 1, 1, 1, 1,
-0.4670451, -1.467429, -2.647093, 1, 1, 1, 1, 1,
-0.4660106, 0.2279975, -0.9778232, 1, 1, 1, 1, 1,
-0.4600212, -0.5825056, -1.820026, 1, 1, 1, 1, 1,
-0.4584867, -0.3223035, -3.485312, 1, 1, 1, 1, 1,
-0.4554784, -0.07398129, -1.697584, 1, 1, 1, 1, 1,
-0.4535231, 0.4128546, -1.489422, 1, 1, 1, 1, 1,
-0.4534622, -1.159451, -3.60022, 1, 1, 1, 1, 1,
-0.4443061, -1.614206, -1.422401, 0, 0, 1, 1, 1,
-0.4441052, 1.478329, -0.06735693, 1, 0, 0, 1, 1,
-0.4394206, 1.305815, -1.645077, 1, 0, 0, 1, 1,
-0.4367555, -0.1598002, -2.134113, 1, 0, 0, 1, 1,
-0.4348271, 0.7966012, 0.4050245, 1, 0, 0, 1, 1,
-0.4335469, 0.9068561, -1.085592, 1, 0, 0, 1, 1,
-0.4242755, 1.176686, -1.061696, 0, 0, 0, 1, 1,
-0.422597, 0.1946095, -2.211408, 0, 0, 0, 1, 1,
-0.4224805, -0.1972837, -3.50899, 0, 0, 0, 1, 1,
-0.4189265, -0.3521084, -1.841324, 0, 0, 0, 1, 1,
-0.4175197, 0.3859209, -0.6230884, 0, 0, 0, 1, 1,
-0.4173654, -1.438204, -2.569712, 0, 0, 0, 1, 1,
-0.4162351, 2.70724, 0.06400103, 0, 0, 0, 1, 1,
-0.4120124, 0.9848738, -0.7691063, 1, 1, 1, 1, 1,
-0.4083031, 1.686409, 0.9593911, 1, 1, 1, 1, 1,
-0.4064447, 0.2640375, -2.7429, 1, 1, 1, 1, 1,
-0.406373, -0.3460778, -1.889145, 1, 1, 1, 1, 1,
-0.402683, -0.9697368, -0.8095255, 1, 1, 1, 1, 1,
-0.4014663, -0.5326184, -3.13211, 1, 1, 1, 1, 1,
-0.400796, -0.9505287, -3.444673, 1, 1, 1, 1, 1,
-0.391813, -1.034671, -3.053465, 1, 1, 1, 1, 1,
-0.3917013, -0.9876123, -2.583131, 1, 1, 1, 1, 1,
-0.3910432, -0.1872928, -4.806202, 1, 1, 1, 1, 1,
-0.3905802, -0.2436829, -2.956679, 1, 1, 1, 1, 1,
-0.3896904, 1.137189, -0.7110889, 1, 1, 1, 1, 1,
-0.3875357, -0.3526527, -3.158284, 1, 1, 1, 1, 1,
-0.3873435, 1.26122, -0.05714153, 1, 1, 1, 1, 1,
-0.3868089, -2.396744, -1.412708, 1, 1, 1, 1, 1,
-0.3825924, 0.7263343, 1.355437, 0, 0, 1, 1, 1,
-0.382014, 0.349093, -0.9244551, 1, 0, 0, 1, 1,
-0.3794982, -2.031719, -2.541671, 1, 0, 0, 1, 1,
-0.3789416, 1.531527, 0.3266465, 1, 0, 0, 1, 1,
-0.3736242, -0.6757142, -2.381903, 1, 0, 0, 1, 1,
-0.3703549, 0.09018778, -1.356327, 1, 0, 0, 1, 1,
-0.3680825, 0.3536317, -1.01361, 0, 0, 0, 1, 1,
-0.3668533, 0.7178878, 0.0528673, 0, 0, 0, 1, 1,
-0.3620787, 0.2742363, -0.9529881, 0, 0, 0, 1, 1,
-0.3581456, -1.492656, -4.028543, 0, 0, 0, 1, 1,
-0.3569392, -0.6490742, -2.878527, 0, 0, 0, 1, 1,
-0.3508696, -0.6301222, -2.093402, 0, 0, 0, 1, 1,
-0.3503582, -1.14756, -4.002017, 0, 0, 0, 1, 1,
-0.3488437, -1.395691, -2.552443, 1, 1, 1, 1, 1,
-0.3455568, 1.373607, -0.2294634, 1, 1, 1, 1, 1,
-0.344943, 0.9419727, 0.1127377, 1, 1, 1, 1, 1,
-0.3421003, -2.065648, -4.799356, 1, 1, 1, 1, 1,
-0.337512, 1.277838, 2.730084, 1, 1, 1, 1, 1,
-0.3349411, 0.1667265, -2.027755, 1, 1, 1, 1, 1,
-0.3346287, 0.3028124, -0.8701777, 1, 1, 1, 1, 1,
-0.3333519, -0.5012367, -3.849973, 1, 1, 1, 1, 1,
-0.3333503, 0.8915488, -0.0378955, 1, 1, 1, 1, 1,
-0.3318809, -0.372471, -4.2334, 1, 1, 1, 1, 1,
-0.3318415, -1.44645, -1.998291, 1, 1, 1, 1, 1,
-0.3314898, -1.780134, -3.425575, 1, 1, 1, 1, 1,
-0.3310307, -0.05694824, -1.2056, 1, 1, 1, 1, 1,
-0.3283652, 0.5286474, -0.2357769, 1, 1, 1, 1, 1,
-0.3276951, -0.6972814, -3.780192, 1, 1, 1, 1, 1,
-0.326979, -0.1926579, -1.676467, 0, 0, 1, 1, 1,
-0.3264006, -0.4597946, -2.395576, 1, 0, 0, 1, 1,
-0.3247353, 0.05534092, -1.462169, 1, 0, 0, 1, 1,
-0.3225949, 0.5010931, 0.3154137, 1, 0, 0, 1, 1,
-0.3211079, 0.1101154, -0.3062611, 1, 0, 0, 1, 1,
-0.3188515, 0.3117723, -2.481596, 1, 0, 0, 1, 1,
-0.3171726, 0.7544085, -1.454877, 0, 0, 0, 1, 1,
-0.3103498, 0.5472051, -0.01820945, 0, 0, 0, 1, 1,
-0.3080903, -0.6513126, -3.243895, 0, 0, 0, 1, 1,
-0.3045144, -0.3304384, -1.566649, 0, 0, 0, 1, 1,
-0.3020645, 0.9542328, -0.5075442, 0, 0, 0, 1, 1,
-0.3012796, -0.1530859, -3.13789, 0, 0, 0, 1, 1,
-0.2964777, 0.5291991, -1.210771, 0, 0, 0, 1, 1,
-0.2906704, -0.7605441, -2.911288, 1, 1, 1, 1, 1,
-0.28947, 0.733771, -0.2492079, 1, 1, 1, 1, 1,
-0.2885517, -0.8158155, -4.332907, 1, 1, 1, 1, 1,
-0.2880009, -1.306803, -3.201765, 1, 1, 1, 1, 1,
-0.2855454, 1.026398, 0.563617, 1, 1, 1, 1, 1,
-0.2830871, 1.266559, -2.329005, 1, 1, 1, 1, 1,
-0.2826168, 0.9460457, 1.665474, 1, 1, 1, 1, 1,
-0.2782582, -1.266966, -2.218105, 1, 1, 1, 1, 1,
-0.2771168, -2.097773, -3.028001, 1, 1, 1, 1, 1,
-0.2769579, -1.265174, -2.559946, 1, 1, 1, 1, 1,
-0.2747363, -0.6203215, -1.678006, 1, 1, 1, 1, 1,
-0.2713538, -1.03955, -2.48029, 1, 1, 1, 1, 1,
-0.2586522, 0.1302705, 0.4571623, 1, 1, 1, 1, 1,
-0.2570272, -0.1440932, -1.403938, 1, 1, 1, 1, 1,
-0.256088, 1.391677, 0.1522929, 1, 1, 1, 1, 1,
-0.2555236, 0.4053432, 0.2106086, 0, 0, 1, 1, 1,
-0.2481809, -0.6484135, -1.685568, 1, 0, 0, 1, 1,
-0.2463069, -0.6671914, -4.321404, 1, 0, 0, 1, 1,
-0.2459689, -1.536314, -3.616314, 1, 0, 0, 1, 1,
-0.2457428, -0.765441, -2.075094, 1, 0, 0, 1, 1,
-0.2432989, 0.3177071, -1.230755, 1, 0, 0, 1, 1,
-0.2392361, 0.01595513, -2.909656, 0, 0, 0, 1, 1,
-0.2353086, 0.6401831, -0.9095756, 0, 0, 0, 1, 1,
-0.2277855, -0.6797, -3.506665, 0, 0, 0, 1, 1,
-0.2273522, -1.023164, -1.97042, 0, 0, 0, 1, 1,
-0.2272704, -0.3271163, -0.8355839, 0, 0, 0, 1, 1,
-0.2271567, -2.183464, -2.984479, 0, 0, 0, 1, 1,
-0.2161554, 1.318536, 1.048111, 0, 0, 0, 1, 1,
-0.215571, 0.3527333, 0.2894853, 1, 1, 1, 1, 1,
-0.2155445, -1.043463, -2.780359, 1, 1, 1, 1, 1,
-0.209799, 0.3454823, 0.4658398, 1, 1, 1, 1, 1,
-0.2084921, -0.1823492, 0.0168385, 1, 1, 1, 1, 1,
-0.2076866, 1.127843, 0.460416, 1, 1, 1, 1, 1,
-0.2034332, 1.356286, 0.07378446, 1, 1, 1, 1, 1,
-0.200843, -0.2552341, -2.100515, 1, 1, 1, 1, 1,
-0.1985212, 0.334658, 0.7275913, 1, 1, 1, 1, 1,
-0.1980469, -1.022095, -4.61007, 1, 1, 1, 1, 1,
-0.1940148, -0.9734981, -3.225338, 1, 1, 1, 1, 1,
-0.193405, 0.105327, -0.263191, 1, 1, 1, 1, 1,
-0.1917555, -0.6338921, -2.541754, 1, 1, 1, 1, 1,
-0.190684, -0.9896075, -1.665702, 1, 1, 1, 1, 1,
-0.1902287, 0.2816062, 0.9709564, 1, 1, 1, 1, 1,
-0.1894413, 1.862786, -0.9615114, 1, 1, 1, 1, 1,
-0.1892488, 0.5326511, -1.131097, 0, 0, 1, 1, 1,
-0.1889179, 0.003056116, -2.667867, 1, 0, 0, 1, 1,
-0.1878154, 0.4269826, -2.037497, 1, 0, 0, 1, 1,
-0.1873493, 1.126233, -0.5494791, 1, 0, 0, 1, 1,
-0.1843678, -0.9601064, -3.061107, 1, 0, 0, 1, 1,
-0.1830452, 0.2893587, -0.3074092, 1, 0, 0, 1, 1,
-0.1824259, 1.353595, -0.6177225, 0, 0, 0, 1, 1,
-0.1817445, -0.05238095, -1.447945, 0, 0, 0, 1, 1,
-0.1800932, 0.5732437, -0.8518878, 0, 0, 0, 1, 1,
-0.1780412, -0.7953983, -4.146446, 0, 0, 0, 1, 1,
-0.1726159, -0.7872692, -2.67592, 0, 0, 0, 1, 1,
-0.1688029, 1.802497, -0.5879341, 0, 0, 0, 1, 1,
-0.166159, -0.08941448, -1.748718, 0, 0, 0, 1, 1,
-0.1660021, -0.05064864, -3.815312, 1, 1, 1, 1, 1,
-0.1646555, -0.7984513, -2.788898, 1, 1, 1, 1, 1,
-0.1642662, 0.8027091, -0.6293089, 1, 1, 1, 1, 1,
-0.1620427, -1.127754, -2.704887, 1, 1, 1, 1, 1,
-0.159025, 0.8637666, 0.02942709, 1, 1, 1, 1, 1,
-0.1539238, -0.03575186, -3.093843, 1, 1, 1, 1, 1,
-0.1491981, 1.100346, 0.566727, 1, 1, 1, 1, 1,
-0.1488639, -0.1551777, -4.182168, 1, 1, 1, 1, 1,
-0.1441201, 0.6990096, -0.9403641, 1, 1, 1, 1, 1,
-0.1412122, 1.31756, -0.8517008, 1, 1, 1, 1, 1,
-0.1378255, -0.7854958, -1.718133, 1, 1, 1, 1, 1,
-0.1344235, -0.5513425, -2.839076, 1, 1, 1, 1, 1,
-0.1314139, -0.6586534, -3.494653, 1, 1, 1, 1, 1,
-0.1286627, -0.05815846, -2.365372, 1, 1, 1, 1, 1,
-0.127612, 0.3579531, -0.3632173, 1, 1, 1, 1, 1,
-0.1231526, 0.06412482, -1.868199, 0, 0, 1, 1, 1,
-0.1211827, 1.196478, -1.457149, 1, 0, 0, 1, 1,
-0.1206645, -2.168712, -3.158318, 1, 0, 0, 1, 1,
-0.1198914, -1.762176, -3.503656, 1, 0, 0, 1, 1,
-0.1196822, -0.03894381, -2.948744, 1, 0, 0, 1, 1,
-0.1183967, 1.083377, 0.1003783, 1, 0, 0, 1, 1,
-0.1132098, -1.829641, -3.969841, 0, 0, 0, 1, 1,
-0.1126554, -0.5376002, -2.699421, 0, 0, 0, 1, 1,
-0.1123494, -0.4594289, -3.200479, 0, 0, 0, 1, 1,
-0.1111901, -0.4988502, -1.823073, 0, 0, 0, 1, 1,
-0.1093167, -0.540146, -4.304895, 0, 0, 0, 1, 1,
-0.1083074, 0.8034734, -1.10973, 0, 0, 0, 1, 1,
-0.1080117, 0.5452627, -0.07622351, 0, 0, 0, 1, 1,
-0.1051254, 0.4479586, -1.21621, 1, 1, 1, 1, 1,
-0.1038716, -1.525966, -0.7213942, 1, 1, 1, 1, 1,
-0.1020191, -1.959149, -1.428383, 1, 1, 1, 1, 1,
-0.1001004, -1.920958, -4.008297, 1, 1, 1, 1, 1,
-0.09620009, 1.453391, 0.7133881, 1, 1, 1, 1, 1,
-0.09533008, -1.144356, -3.931875, 1, 1, 1, 1, 1,
-0.09432546, -0.5539905, -4.841866, 1, 1, 1, 1, 1,
-0.08797945, 1.924172, -0.8716797, 1, 1, 1, 1, 1,
-0.08536421, 0.264342, 0.173445, 1, 1, 1, 1, 1,
-0.07621571, 2.301863, 1.120834, 1, 1, 1, 1, 1,
-0.07336909, -1.400899, -2.986565, 1, 1, 1, 1, 1,
-0.07217216, 1.242599, -0.6651862, 1, 1, 1, 1, 1,
-0.06847237, 0.1601515, -0.6198221, 1, 1, 1, 1, 1,
-0.06477755, 0.1382654, 0.2499768, 1, 1, 1, 1, 1,
-0.0563163, 0.6088965, 0.2441999, 1, 1, 1, 1, 1,
-0.0553983, 0.2589177, 0.8957422, 0, 0, 1, 1, 1,
-0.05392082, 0.2943652, -1.131382, 1, 0, 0, 1, 1,
-0.05156795, -0.233432, -2.790709, 1, 0, 0, 1, 1,
-0.05023727, -0.7682493, -6.316915, 1, 0, 0, 1, 1,
-0.04849338, -0.7954874, -3.354181, 1, 0, 0, 1, 1,
-0.04839074, 1.443768, -0.512462, 1, 0, 0, 1, 1,
-0.04339352, 0.6935216, -0.1915732, 0, 0, 0, 1, 1,
-0.04087216, 0.3509581, -0.6724663, 0, 0, 0, 1, 1,
-0.04065063, 0.4836367, 0.7561094, 0, 0, 0, 1, 1,
-0.039627, -0.2708074, -4.390855, 0, 0, 0, 1, 1,
-0.03883255, 0.8957936, 0.3005227, 0, 0, 0, 1, 1,
-0.0383733, 0.8725078, -2.473517, 0, 0, 0, 1, 1,
-0.03836897, -1.339853, -0.4289879, 0, 0, 0, 1, 1,
-0.03647859, -0.5294988, -4.882075, 1, 1, 1, 1, 1,
-0.03406688, -0.5091174, -2.913152, 1, 1, 1, 1, 1,
-0.03167554, -1.377557, -2.127907, 1, 1, 1, 1, 1,
-0.02285633, -1.884274, -2.672626, 1, 1, 1, 1, 1,
-0.02185793, -0.4601962, -2.870871, 1, 1, 1, 1, 1,
-0.02156434, 1.011044, 0.06296649, 1, 1, 1, 1, 1,
-0.02023884, -1.034622, -3.449864, 1, 1, 1, 1, 1,
-0.01863541, -2.474269, -4.667, 1, 1, 1, 1, 1,
-0.01539197, 1.26874, 1.38046, 1, 1, 1, 1, 1,
-0.003357504, 1.110672, -0.7102438, 1, 1, 1, 1, 1,
-0.001919412, 0.2482888, -1.700914, 1, 1, 1, 1, 1,
0.001698799, -2.565584, 3.773839, 1, 1, 1, 1, 1,
0.006035275, -1.167759, 2.750181, 1, 1, 1, 1, 1,
0.007386638, -2.013796, 2.953614, 1, 1, 1, 1, 1,
0.007976942, -1.493724, 1.555893, 1, 1, 1, 1, 1,
0.008167144, -0.2767219, 1.477889, 0, 0, 1, 1, 1,
0.008253608, 0.2654087, 0.07584646, 1, 0, 0, 1, 1,
0.00827907, 0.7523142, 0.5534059, 1, 0, 0, 1, 1,
0.01116119, 0.7328441, -0.3316713, 1, 0, 0, 1, 1,
0.01245927, -1.079748, 2.327519, 1, 0, 0, 1, 1,
0.014123, -0.7054065, 1.765418, 1, 0, 0, 1, 1,
0.01441695, -0.7527684, 1.554853, 0, 0, 0, 1, 1,
0.01507519, -0.6936175, 2.731983, 0, 0, 0, 1, 1,
0.02183991, -0.7288848, 3.350643, 0, 0, 0, 1, 1,
0.02349502, 1.456076, -0.1268225, 0, 0, 0, 1, 1,
0.02477033, -0.6331517, 4.464986, 0, 0, 0, 1, 1,
0.02495391, -1.509745, 2.143592, 0, 0, 0, 1, 1,
0.02687857, -1.035011, 2.265052, 0, 0, 0, 1, 1,
0.02721152, 0.3867489, 1.49343, 1, 1, 1, 1, 1,
0.03306652, -0.09932194, 2.635079, 1, 1, 1, 1, 1,
0.03484252, 1.036597, 0.0106992, 1, 1, 1, 1, 1,
0.03695758, 0.9243018, -1.871587, 1, 1, 1, 1, 1,
0.03695887, 1.016913, -0.1805167, 1, 1, 1, 1, 1,
0.0370224, 1.249141, 0.9808785, 1, 1, 1, 1, 1,
0.03886255, 2.852381, -1.442104, 1, 1, 1, 1, 1,
0.04287459, -1.088539, 3.578694, 1, 1, 1, 1, 1,
0.05205591, 1.28073, 1.399905, 1, 1, 1, 1, 1,
0.05527338, 1.226764, -2.058604, 1, 1, 1, 1, 1,
0.05995463, 1.226624, 0.9685134, 1, 1, 1, 1, 1,
0.06321568, 0.9816226, -2.231083, 1, 1, 1, 1, 1,
0.06461206, 0.3143316, 0.06663911, 1, 1, 1, 1, 1,
0.06863979, -0.1560785, 5.396159, 1, 1, 1, 1, 1,
0.0687116, 0.5361878, -2.254466, 1, 1, 1, 1, 1,
0.0715913, -0.701407, 2.542216, 0, 0, 1, 1, 1,
0.07161276, -0.9607953, 4.536047, 1, 0, 0, 1, 1,
0.07601648, 0.349271, 1.387884, 1, 0, 0, 1, 1,
0.07932661, 0.1993782, -0.2488113, 1, 0, 0, 1, 1,
0.08081252, 0.5827435, 0.6890373, 1, 0, 0, 1, 1,
0.08123346, -0.6970991, 3.901494, 1, 0, 0, 1, 1,
0.08205701, 0.6355057, -0.4914652, 0, 0, 0, 1, 1,
0.08798544, 0.6376948, 0.00116124, 0, 0, 0, 1, 1,
0.08823902, 0.2278847, 1.481112, 0, 0, 0, 1, 1,
0.09056341, -0.3292121, 3.513501, 0, 0, 0, 1, 1,
0.09470716, 1.114855, 0.5527369, 0, 0, 0, 1, 1,
0.09765594, -0.1138745, 3.052612, 0, 0, 0, 1, 1,
0.09945239, -0.03260883, 1.406152, 0, 0, 0, 1, 1,
0.106457, -2.665652, 1.37093, 1, 1, 1, 1, 1,
0.1071828, -1.052511, 4.092563, 1, 1, 1, 1, 1,
0.1088794, 1.301552, 0.5075811, 1, 1, 1, 1, 1,
0.1105178, 0.858766, 0.1632091, 1, 1, 1, 1, 1,
0.1105922, -0.02150775, 1.600239, 1, 1, 1, 1, 1,
0.1226624, 0.2165962, 1.540645, 1, 1, 1, 1, 1,
0.1249246, 0.3622025, -0.3354232, 1, 1, 1, 1, 1,
0.1274144, 0.07971645, 0.1777004, 1, 1, 1, 1, 1,
0.1284882, -0.9472151, 1.525181, 1, 1, 1, 1, 1,
0.1315103, -0.5378057, 2.781708, 1, 1, 1, 1, 1,
0.1337842, -0.01275566, 1.846287, 1, 1, 1, 1, 1,
0.1443437, 0.5111677, 0.02414172, 1, 1, 1, 1, 1,
0.1490508, -0.5624254, 4.459135, 1, 1, 1, 1, 1,
0.1528607, -0.4399138, 4.282835, 1, 1, 1, 1, 1,
0.1545744, 1.357595, -0.5734532, 1, 1, 1, 1, 1,
0.1547582, -0.1694327, 1.203157, 0, 0, 1, 1, 1,
0.1593993, -0.557881, 4.537058, 1, 0, 0, 1, 1,
0.1600046, -1.203856, 5.529261, 1, 0, 0, 1, 1,
0.1632624, 0.2998852, 0.9879754, 1, 0, 0, 1, 1,
0.1651091, -1.604925, 2.715281, 1, 0, 0, 1, 1,
0.1679763, -0.2669006, 2.348558, 1, 0, 0, 1, 1,
0.1742437, 0.1700832, 0.9195008, 0, 0, 0, 1, 1,
0.1752584, 0.6657197, 0.2476121, 0, 0, 0, 1, 1,
0.1784819, -1.673112, 3.293113, 0, 0, 0, 1, 1,
0.1816785, -1.489855, 2.984068, 0, 0, 0, 1, 1,
0.1831006, 0.3831894, 1.966776, 0, 0, 0, 1, 1,
0.1844017, 0.770376, -0.9612882, 0, 0, 0, 1, 1,
0.185116, 1.930712, -0.2510034, 0, 0, 0, 1, 1,
0.1864535, -0.6144137, 4.082641, 1, 1, 1, 1, 1,
0.1895238, 0.2936116, 0.5198326, 1, 1, 1, 1, 1,
0.1903164, -1.208997, 4.483658, 1, 1, 1, 1, 1,
0.1903342, -0.03755571, 1.161091, 1, 1, 1, 1, 1,
0.1915133, 0.6052479, 0.6127439, 1, 1, 1, 1, 1,
0.1932349, 0.5320668, 0.3486621, 1, 1, 1, 1, 1,
0.1968402, 1.106456, 0.4873114, 1, 1, 1, 1, 1,
0.1978683, 1.228119, 1.114285, 1, 1, 1, 1, 1,
0.1989404, 0.1732851, 1.760032, 1, 1, 1, 1, 1,
0.2011627, 0.7104247, -2.107768, 1, 1, 1, 1, 1,
0.2013956, -0.361049, 1.485342, 1, 1, 1, 1, 1,
0.2020951, -1.554062, 2.26438, 1, 1, 1, 1, 1,
0.2026023, -0.2614721, 1.001495, 1, 1, 1, 1, 1,
0.2042578, 2.137162, -2.52571, 1, 1, 1, 1, 1,
0.2068948, 1.220879, -0.8883342, 1, 1, 1, 1, 1,
0.2073192, 0.02676469, 2.357419, 0, 0, 1, 1, 1,
0.2101274, 0.3432336, 1.717405, 1, 0, 0, 1, 1,
0.2178053, 0.7143443, -0.318777, 1, 0, 0, 1, 1,
0.2221261, 1.22868, 0.4261323, 1, 0, 0, 1, 1,
0.2262957, -1.057012, 3.666946, 1, 0, 0, 1, 1,
0.2285933, 1.223021, 0.4893416, 1, 0, 0, 1, 1,
0.2307061, -3.010409, 2.664544, 0, 0, 0, 1, 1,
0.2309283, 1.480268, 0.914671, 0, 0, 0, 1, 1,
0.2322533, -0.2676193, 4.298403, 0, 0, 0, 1, 1,
0.2331868, -0.624855, 3.926001, 0, 0, 0, 1, 1,
0.2347291, -0.2439826, 2.096476, 0, 0, 0, 1, 1,
0.2358847, 0.6038083, -0.4182176, 0, 0, 0, 1, 1,
0.2365413, 1.73436, -0.9497204, 0, 0, 0, 1, 1,
0.2368658, -0.6139846, 1.863081, 1, 1, 1, 1, 1,
0.2368751, -0.9299374, 2.607282, 1, 1, 1, 1, 1,
0.2375414, 0.2801133, 2.160789, 1, 1, 1, 1, 1,
0.23884, -1.396585, 2.492108, 1, 1, 1, 1, 1,
0.2417802, -0.1585296, 2.940619, 1, 1, 1, 1, 1,
0.2444531, -0.6563928, 1.879259, 1, 1, 1, 1, 1,
0.248774, -0.9373512, 2.878641, 1, 1, 1, 1, 1,
0.249857, 0.8337688, -0.6090098, 1, 1, 1, 1, 1,
0.255628, 1.261653, 1.029118, 1, 1, 1, 1, 1,
0.2564526, 0.3620638, 1.966353, 1, 1, 1, 1, 1,
0.2643896, 0.02981108, 1.190593, 1, 1, 1, 1, 1,
0.2667621, 1.707727, -4.544423, 1, 1, 1, 1, 1,
0.2764293, 1.168699, 0.5576365, 1, 1, 1, 1, 1,
0.2791669, -0.4494913, 3.108225, 1, 1, 1, 1, 1,
0.279236, 0.1925541, 0.6539366, 1, 1, 1, 1, 1,
0.2798983, 0.1220302, 1.056844, 0, 0, 1, 1, 1,
0.2894917, -0.2434396, 2.963429, 1, 0, 0, 1, 1,
0.2903907, 4.211158, -0.7541009, 1, 0, 0, 1, 1,
0.2932741, -0.2943017, 4.632764, 1, 0, 0, 1, 1,
0.294676, -0.9150985, 3.305332, 1, 0, 0, 1, 1,
0.2962198, -0.1052989, 2.589191, 1, 0, 0, 1, 1,
0.305163, 0.2776702, 1.589988, 0, 0, 0, 1, 1,
0.3077634, 0.824181, 0.4917933, 0, 0, 0, 1, 1,
0.3082712, -1.390505, 3.416117, 0, 0, 0, 1, 1,
0.308284, -1.093296, 4.204811, 0, 0, 0, 1, 1,
0.3088171, -0.2780517, 3.888732, 0, 0, 0, 1, 1,
0.3106715, -1.882965, 2.361362, 0, 0, 0, 1, 1,
0.313771, 1.439043, 0.5365282, 0, 0, 0, 1, 1,
0.3153995, -0.533896, 1.579169, 1, 1, 1, 1, 1,
0.3207581, 0.7331219, -0.9242149, 1, 1, 1, 1, 1,
0.3224242, 0.1581909, 1.410095, 1, 1, 1, 1, 1,
0.325691, -0.005836063, 2.192168, 1, 1, 1, 1, 1,
0.3318976, 0.2122151, -0.2650827, 1, 1, 1, 1, 1,
0.3321573, -1.094562, 2.898974, 1, 1, 1, 1, 1,
0.3350239, -0.08302019, 1.117041, 1, 1, 1, 1, 1,
0.3388289, -0.5412441, 3.644711, 1, 1, 1, 1, 1,
0.3395239, -0.2096064, 2.83084, 1, 1, 1, 1, 1,
0.3408122, -0.5488359, 3.424158, 1, 1, 1, 1, 1,
0.3471349, -0.1482488, 1.15278, 1, 1, 1, 1, 1,
0.3476043, -0.8899978, 3.635731, 1, 1, 1, 1, 1,
0.3486586, -0.9868907, 2.962223, 1, 1, 1, 1, 1,
0.3487651, -1.745259, 4.590854, 1, 1, 1, 1, 1,
0.3505608, 0.3348812, 0.8980115, 1, 1, 1, 1, 1,
0.3537063, 0.8657001, 2.949181, 0, 0, 1, 1, 1,
0.3579944, -1.856649, 3.246712, 1, 0, 0, 1, 1,
0.3596981, 1.490827, -0.7550029, 1, 0, 0, 1, 1,
0.3617519, 1.134809, 1.536288, 1, 0, 0, 1, 1,
0.3618756, -0.04537157, 1.575296, 1, 0, 0, 1, 1,
0.3627286, 0.4008698, 1.542038, 1, 0, 0, 1, 1,
0.3634327, 1.021037, -0.6644173, 0, 0, 0, 1, 1,
0.3651838, -0.06988265, 0.5011876, 0, 0, 0, 1, 1,
0.3661143, 1.056641, 0.8874613, 0, 0, 0, 1, 1,
0.3691706, -0.2568025, 3.444291, 0, 0, 0, 1, 1,
0.3698942, 1.133736, 0.6480016, 0, 0, 0, 1, 1,
0.3706801, 1.346637, 0.6718721, 0, 0, 0, 1, 1,
0.3815314, -1.63958, 3.214869, 0, 0, 0, 1, 1,
0.3855951, -0.9614192, 3.005205, 1, 1, 1, 1, 1,
0.3863168, -0.8912482, 3.332773, 1, 1, 1, 1, 1,
0.3876835, -1.047617, 1.920708, 1, 1, 1, 1, 1,
0.3882542, -0.9904735, 1.005603, 1, 1, 1, 1, 1,
0.3915657, 1.187633, 0.5718652, 1, 1, 1, 1, 1,
0.3985955, -0.421546, 2.760808, 1, 1, 1, 1, 1,
0.4052783, 1.069959, 3.029672, 1, 1, 1, 1, 1,
0.4120682, -0.2704777, 1.595681, 1, 1, 1, 1, 1,
0.4129341, -0.9270684, 3.011777, 1, 1, 1, 1, 1,
0.4194913, 0.3895009, 1.200582, 1, 1, 1, 1, 1,
0.4255678, -0.2370073, 3.410258, 1, 1, 1, 1, 1,
0.4268128, -0.05274064, 2.219997, 1, 1, 1, 1, 1,
0.4289367, 0.9665701, -1.295544, 1, 1, 1, 1, 1,
0.4323017, -0.2781239, 1.566224, 1, 1, 1, 1, 1,
0.4391615, 1.361816, -1.311961, 1, 1, 1, 1, 1,
0.4430169, 0.5750707, 1.279975, 0, 0, 1, 1, 1,
0.4504112, -0.7303004, 2.330979, 1, 0, 0, 1, 1,
0.4518442, 0.983242, 1.618719, 1, 0, 0, 1, 1,
0.4583282, -0.6980471, 2.750288, 1, 0, 0, 1, 1,
0.461101, -0.5139616, 2.79656, 1, 0, 0, 1, 1,
0.4620197, -0.6554393, 0.5339598, 1, 0, 0, 1, 1,
0.463848, 0.2865248, 1.514203, 0, 0, 0, 1, 1,
0.4640641, -0.1437764, 3.83592, 0, 0, 0, 1, 1,
0.4656501, 0.318904, 1.199381, 0, 0, 0, 1, 1,
0.4671645, 0.5168476, 1.733428, 0, 0, 0, 1, 1,
0.4695916, 0.31862, -0.4013653, 0, 0, 0, 1, 1,
0.4772995, -1.680261, 1.151254, 0, 0, 0, 1, 1,
0.4788349, -0.4656583, 3.679853, 0, 0, 0, 1, 1,
0.4801246, -1.649151, 4.992511, 1, 1, 1, 1, 1,
0.4809327, -0.7630745, 1.687472, 1, 1, 1, 1, 1,
0.4813163, 0.9767935, 1.096789, 1, 1, 1, 1, 1,
0.4913123, -1.691184, 3.006882, 1, 1, 1, 1, 1,
0.4970825, 1.075181, 0.2910269, 1, 1, 1, 1, 1,
0.4979736, -0.1263921, 1.717952, 1, 1, 1, 1, 1,
0.4990311, 0.8767883, 0.2647361, 1, 1, 1, 1, 1,
0.4999624, 0.7750004, 0.9919276, 1, 1, 1, 1, 1,
0.5025894, 0.1592585, 0.2121741, 1, 1, 1, 1, 1,
0.5039263, 0.1357565, -0.716499, 1, 1, 1, 1, 1,
0.5041257, 0.508843, 2.458134, 1, 1, 1, 1, 1,
0.5053524, 1.09284, 0.5629852, 1, 1, 1, 1, 1,
0.5059709, 0.6549241, -0.1345061, 1, 1, 1, 1, 1,
0.5064076, -1.693443, 1.760089, 1, 1, 1, 1, 1,
0.5094014, 1.015609, 1.000416, 1, 1, 1, 1, 1,
0.5107659, -0.1017874, 3.085831, 0, 0, 1, 1, 1,
0.5109208, 0.2317787, 1.268931, 1, 0, 0, 1, 1,
0.5117094, -0.09493399, 0.867502, 1, 0, 0, 1, 1,
0.5154891, 1.646998, 1.15547, 1, 0, 0, 1, 1,
0.5183598, 1.337547, -0.2237469, 1, 0, 0, 1, 1,
0.5204829, 0.7185593, 1.07931, 1, 0, 0, 1, 1,
0.5244859, 0.3038384, 0.5231037, 0, 0, 0, 1, 1,
0.526387, 0.2295722, 1.281209, 0, 0, 0, 1, 1,
0.5303196, -0.233307, 0.2520391, 0, 0, 0, 1, 1,
0.5303218, 1.677491, -1.126712, 0, 0, 0, 1, 1,
0.5305204, -2.123256, 5.177099, 0, 0, 0, 1, 1,
0.5321854, 0.594869, 0.79886, 0, 0, 0, 1, 1,
0.5339782, 0.07598127, 1.824321, 0, 0, 0, 1, 1,
0.5370483, 0.5376045, -0.2842385, 1, 1, 1, 1, 1,
0.5413098, -1.252931, 3.486927, 1, 1, 1, 1, 1,
0.5426559, -0.7955488, 2.695926, 1, 1, 1, 1, 1,
0.5551317, -0.3447224, 2.062737, 1, 1, 1, 1, 1,
0.5602164, -0.8807377, 3.277231, 1, 1, 1, 1, 1,
0.564351, 0.5493223, 3.091731, 1, 1, 1, 1, 1,
0.5698368, 0.6915885, -0.2581723, 1, 1, 1, 1, 1,
0.5702251, 0.06732581, 2.225337, 1, 1, 1, 1, 1,
0.5704195, -0.6406116, 0.8237563, 1, 1, 1, 1, 1,
0.5810688, -0.1644236, -0.1519247, 1, 1, 1, 1, 1,
0.582942, -1.371271, 1.919051, 1, 1, 1, 1, 1,
0.5947004, 0.9875742, -0.03320156, 1, 1, 1, 1, 1,
0.5982906, -1.363295, 2.581975, 1, 1, 1, 1, 1,
0.6006821, 0.6350792, 0.3429375, 1, 1, 1, 1, 1,
0.6052443, -1.095513, 3.364394, 1, 1, 1, 1, 1,
0.6085735, -0.710829, 3.003495, 0, 0, 1, 1, 1,
0.6097919, 2.003475, -1.662955, 1, 0, 0, 1, 1,
0.6100999, 1.563424, -0.5743016, 1, 0, 0, 1, 1,
0.6129277, 0.6453062, 1.088277, 1, 0, 0, 1, 1,
0.6146768, 1.694233, 1.890289, 1, 0, 0, 1, 1,
0.6190441, -0.4569954, 1.939051, 1, 0, 0, 1, 1,
0.6214578, -2.17624, 3.40215, 0, 0, 0, 1, 1,
0.6218772, -0.3242857, 2.171473, 0, 0, 0, 1, 1,
0.6240884, -0.1582029, 3.383943, 0, 0, 0, 1, 1,
0.6354041, 0.005154934, -0.652772, 0, 0, 0, 1, 1,
0.638466, -1.098038, 1.580067, 0, 0, 0, 1, 1,
0.6393779, 1.248809, -1.436359, 0, 0, 0, 1, 1,
0.640784, 0.3614423, 2.11603, 0, 0, 0, 1, 1,
0.6442569, -0.2881709, 1.938617, 1, 1, 1, 1, 1,
0.6457462, 1.751059, 0.08278778, 1, 1, 1, 1, 1,
0.6491798, 1.632007, 1.093407, 1, 1, 1, 1, 1,
0.6569595, -0.7777336, 2.325844, 1, 1, 1, 1, 1,
0.6578578, -0.05821946, 1.573829, 1, 1, 1, 1, 1,
0.6579321, -1.388739, 2.960527, 1, 1, 1, 1, 1,
0.6629663, -0.1186128, 0.9214159, 1, 1, 1, 1, 1,
0.6670416, 1.733634, 0.06179307, 1, 1, 1, 1, 1,
0.6697307, 0.1849141, 1.780756, 1, 1, 1, 1, 1,
0.6712428, -0.6234736, 1.271223, 1, 1, 1, 1, 1,
0.6760416, -0.1605213, 2.247265, 1, 1, 1, 1, 1,
0.6785758, 0.8829844, 0.454803, 1, 1, 1, 1, 1,
0.6793827, -1.587287, 2.783174, 1, 1, 1, 1, 1,
0.6832953, 0.8844913, 0.3769519, 1, 1, 1, 1, 1,
0.6862496, -1.19187, 3.427743, 1, 1, 1, 1, 1,
0.6877524, -0.8274528, 1.716542, 0, 0, 1, 1, 1,
0.6881781, -0.2907232, 1.38682, 1, 0, 0, 1, 1,
0.6945257, -1.379713, 1.846867, 1, 0, 0, 1, 1,
0.7021795, 0.2043562, 1.366871, 1, 0, 0, 1, 1,
0.7057519, 0.9800261, -1.427165, 1, 0, 0, 1, 1,
0.7108653, 1.615988, -0.07224288, 1, 0, 0, 1, 1,
0.715346, 0.3916158, 1.655276, 0, 0, 0, 1, 1,
0.7216184, 0.4846815, -0.00816762, 0, 0, 0, 1, 1,
0.7286073, -0.2114867, 1.798593, 0, 0, 0, 1, 1,
0.7298645, 1.229798, 1.694543, 0, 0, 0, 1, 1,
0.7424895, -1.106259, 3.327091, 0, 0, 0, 1, 1,
0.7429565, 1.026454, -0.5179356, 0, 0, 0, 1, 1,
0.7523923, 0.3154319, 0.7910991, 0, 0, 0, 1, 1,
0.7579884, 1.705808, 1.206788, 1, 1, 1, 1, 1,
0.7594453, -0.5601226, 3.060437, 1, 1, 1, 1, 1,
0.7644356, -0.6705774, 1.061184, 1, 1, 1, 1, 1,
0.7652026, 1.115412, 0.1927176, 1, 1, 1, 1, 1,
0.7670338, -0.5980699, 0.8111652, 1, 1, 1, 1, 1,
0.7685009, -0.001533214, 0.4615264, 1, 1, 1, 1, 1,
0.7705446, -0.5480977, 2.662406, 1, 1, 1, 1, 1,
0.7734916, -0.3004677, 2.411736, 1, 1, 1, 1, 1,
0.7781102, 0.7531716, 0.3849326, 1, 1, 1, 1, 1,
0.7836161, -1.066966, 2.255637, 1, 1, 1, 1, 1,
0.7874987, 0.5079677, 3.384172, 1, 1, 1, 1, 1,
0.7877815, -0.8466962, 0.7742599, 1, 1, 1, 1, 1,
0.7910383, -1.961292, 0.4233721, 1, 1, 1, 1, 1,
0.7946713, 0.8715823, 0.2636663, 1, 1, 1, 1, 1,
0.7988747, 0.5975203, -0.09945864, 1, 1, 1, 1, 1,
0.8094273, 0.01398434, 2.357422, 0, 0, 1, 1, 1,
0.8110555, 0.3542269, 0.7621965, 1, 0, 0, 1, 1,
0.8160455, 0.4601469, 1.719545, 1, 0, 0, 1, 1,
0.817717, 0.4656111, 0.01080561, 1, 0, 0, 1, 1,
0.818541, 0.8206177, 0.9286709, 1, 0, 0, 1, 1,
0.8185603, 0.6831447, 1.310721, 1, 0, 0, 1, 1,
0.8217237, -0.3937941, 0.8786018, 0, 0, 0, 1, 1,
0.8249777, -0.6622366, 3.023919, 0, 0, 0, 1, 1,
0.8274761, -0.4262954, 0.529491, 0, 0, 0, 1, 1,
0.8317816, -1.236616, 4.252374, 0, 0, 0, 1, 1,
0.8318033, 0.01695582, 2.456412, 0, 0, 0, 1, 1,
0.8373588, 1.510537, 0.6257721, 0, 0, 0, 1, 1,
0.8413429, 0.1796326, 2.582597, 0, 0, 0, 1, 1,
0.842146, -0.9615958, 3.003911, 1, 1, 1, 1, 1,
0.8479559, 0.6036304, 0.1998441, 1, 1, 1, 1, 1,
0.8501517, 2.603435, -0.3892276, 1, 1, 1, 1, 1,
0.8502091, -0.7411535, 2.502131, 1, 1, 1, 1, 1,
0.8517592, -1.480312, 2.61063, 1, 1, 1, 1, 1,
0.8519709, -1.371075, 4.103704, 1, 1, 1, 1, 1,
0.8526286, -0.2220664, 0.7028454, 1, 1, 1, 1, 1,
0.8541374, -0.7815847, 2.669925, 1, 1, 1, 1, 1,
0.8712869, 1.101257, 1.157387, 1, 1, 1, 1, 1,
0.8748945, 0.05285908, -0.1987197, 1, 1, 1, 1, 1,
0.8765028, -0.9490985, 4.311936, 1, 1, 1, 1, 1,
0.8785771, -0.2473313, 2.206069, 1, 1, 1, 1, 1,
0.8801315, -0.7734277, 3.19436, 1, 1, 1, 1, 1,
0.8823907, -1.058642, 0.004491603, 1, 1, 1, 1, 1,
0.8848714, 0.3441682, 1.58695, 1, 1, 1, 1, 1,
0.8873199, 1.151255, 1.714917, 0, 0, 1, 1, 1,
0.8900417, 1.270372, 0.2539603, 1, 0, 0, 1, 1,
0.8910983, 0.3963459, 1.247506, 1, 0, 0, 1, 1,
0.8954843, -0.008265058, 0.4440308, 1, 0, 0, 1, 1,
0.8989641, -0.8742116, 1.536096, 1, 0, 0, 1, 1,
0.8996964, 0.2842211, 1.219018, 1, 0, 0, 1, 1,
0.9030629, 0.5328957, 0.2622307, 0, 0, 0, 1, 1,
0.9049364, 0.9817718, 1.612875, 0, 0, 0, 1, 1,
0.914147, -0.1486614, 2.779578, 0, 0, 0, 1, 1,
0.9163398, -0.7166812, 2.001253, 0, 0, 0, 1, 1,
0.918616, -0.6985629, 3.131713, 0, 0, 0, 1, 1,
0.9230737, 1.595991, -0.5682028, 0, 0, 0, 1, 1,
0.9237342, -0.8576014, 1.31925, 0, 0, 0, 1, 1,
0.9241891, 0.4845833, 1.261758, 1, 1, 1, 1, 1,
0.9263617, 1.24889, -0.2011153, 1, 1, 1, 1, 1,
0.9367456, 0.101208, 0.8791142, 1, 1, 1, 1, 1,
0.9386448, 0.4546889, 0.5611143, 1, 1, 1, 1, 1,
0.9403238, -1.591101, 0.8997756, 1, 1, 1, 1, 1,
0.9478208, -0.4185345, 3.279544, 1, 1, 1, 1, 1,
0.9494705, -0.08786477, 1.62152, 1, 1, 1, 1, 1,
0.9497631, -0.3719286, 1.607675, 1, 1, 1, 1, 1,
0.9499306, -1.351255, 3.012361, 1, 1, 1, 1, 1,
0.9685723, 2.11328, 1.057172, 1, 1, 1, 1, 1,
0.9737289, 1.511859, -0.6688337, 1, 1, 1, 1, 1,
0.9846038, -1.797804, 2.083733, 1, 1, 1, 1, 1,
0.9864325, -0.7226778, 2.676936, 1, 1, 1, 1, 1,
0.9956951, 0.7307482, 1.568494, 1, 1, 1, 1, 1,
1.004145, -0.1090159, 0.5900536, 1, 1, 1, 1, 1,
1.023174, 0.1734482, 0.6237524, 0, 0, 1, 1, 1,
1.023322, -1.309952, 3.982049, 1, 0, 0, 1, 1,
1.028764, 0.581476, 2.021301, 1, 0, 0, 1, 1,
1.032814, -0.176475, 2.133033, 1, 0, 0, 1, 1,
1.035555, -0.7662007, 3.451498, 1, 0, 0, 1, 1,
1.037339, -0.6035838, 1.047197, 1, 0, 0, 1, 1,
1.038059, 0.3952945, -0.1525062, 0, 0, 0, 1, 1,
1.040076, -0.2800375, 0.67081, 0, 0, 0, 1, 1,
1.052015, -0.3587216, 2.337713, 0, 0, 0, 1, 1,
1.052186, -0.2353431, 1.995682, 0, 0, 0, 1, 1,
1.055806, -0.9716402, 3.455259, 0, 0, 0, 1, 1,
1.059206, -1.287999, 2.354959, 0, 0, 0, 1, 1,
1.059508, -0.2363223, 2.299436, 0, 0, 0, 1, 1,
1.060052, 0.3264291, 0.0612071, 1, 1, 1, 1, 1,
1.066836, -0.2298504, 3.258016, 1, 1, 1, 1, 1,
1.068058, -0.03366062, 1.911271, 1, 1, 1, 1, 1,
1.06875, 0.1008907, 1.083976, 1, 1, 1, 1, 1,
1.072943, -2.036349, 1.718555, 1, 1, 1, 1, 1,
1.077702, 2.984739, 0.207048, 1, 1, 1, 1, 1,
1.083528, 1.407663, 0.46929, 1, 1, 1, 1, 1,
1.084585, 1.289429, 0.6541341, 1, 1, 1, 1, 1,
1.084686, 0.2141447, 1.620208, 1, 1, 1, 1, 1,
1.0974, 0.4373027, -0.6148258, 1, 1, 1, 1, 1,
1.109592, 1.023874, 1.290659, 1, 1, 1, 1, 1,
1.120521, -1.736933, 1.101665, 1, 1, 1, 1, 1,
1.124165, -0.1401861, 1.082763, 1, 1, 1, 1, 1,
1.131318, 0.8518489, 0.2188833, 1, 1, 1, 1, 1,
1.131626, 0.1391778, 2.852181, 1, 1, 1, 1, 1,
1.138226, 0.6381985, 1.076628, 0, 0, 1, 1, 1,
1.144447, -0.1048878, 2.128932, 1, 0, 0, 1, 1,
1.150794, 0.2266931, 2.618089, 1, 0, 0, 1, 1,
1.156412, -0.6945971, 3.252288, 1, 0, 0, 1, 1,
1.160735, -0.1365517, 1.67601, 1, 0, 0, 1, 1,
1.164912, 0.3420906, 3.074789, 1, 0, 0, 1, 1,
1.169396, 0.02786033, 2.076878, 0, 0, 0, 1, 1,
1.170197, 0.03482366, 2.587959, 0, 0, 0, 1, 1,
1.172079, -0.6755002, 1.788827, 0, 0, 0, 1, 1,
1.177622, 1.859049, 0.2424914, 0, 0, 0, 1, 1,
1.179419, 1.11756, 1.647646, 0, 0, 0, 1, 1,
1.182454, 0.367853, 1.428426, 0, 0, 0, 1, 1,
1.182481, 1.273639, 0.2375142, 0, 0, 0, 1, 1,
1.189546, -0.6333183, 3.42439, 1, 1, 1, 1, 1,
1.190808, -0.2348995, 0.3421888, 1, 1, 1, 1, 1,
1.195919, -0.1571723, 0.03351761, 1, 1, 1, 1, 1,
1.209994, -0.9371228, 4.038523, 1, 1, 1, 1, 1,
1.214678, -1.175532, 2.062187, 1, 1, 1, 1, 1,
1.223709, -0.9619397, 0.5073416, 1, 1, 1, 1, 1,
1.225006, -0.6995458, 2.542732, 1, 1, 1, 1, 1,
1.231917, 0.6282476, 1.629147, 1, 1, 1, 1, 1,
1.237316, 0.5963612, 1.887951, 1, 1, 1, 1, 1,
1.242962, 0.9539571, -0.791858, 1, 1, 1, 1, 1,
1.245083, 1.029436, 0.531326, 1, 1, 1, 1, 1,
1.263031, -0.2214325, -0.5495692, 1, 1, 1, 1, 1,
1.26512, -0.629935, 2.939895, 1, 1, 1, 1, 1,
1.27678, 0.7205926, -0.1222007, 1, 1, 1, 1, 1,
1.299147, 0.292615, 3.327413, 1, 1, 1, 1, 1,
1.299326, -0.2889198, 2.716106, 0, 0, 1, 1, 1,
1.299704, 0.7516657, 0.1354161, 1, 0, 0, 1, 1,
1.303778, -0.6635196, 2.450747, 1, 0, 0, 1, 1,
1.303852, 1.259105, -0.851407, 1, 0, 0, 1, 1,
1.308012, 1.859195, 1.652627, 1, 0, 0, 1, 1,
1.319279, -0.4059631, 1.954755, 1, 0, 0, 1, 1,
1.330077, -2.177902, 4.951348, 0, 0, 0, 1, 1,
1.338049, 2.196523, 0.6096025, 0, 0, 0, 1, 1,
1.341645, -1.746213, 2.504944, 0, 0, 0, 1, 1,
1.351757, 0.1514598, 0.9683161, 0, 0, 0, 1, 1,
1.351917, -0.02400079, 0.9645392, 0, 0, 0, 1, 1,
1.356755, 0.5940682, -1.229784, 0, 0, 0, 1, 1,
1.362976, -0.7634512, 1.841817, 0, 0, 0, 1, 1,
1.365048, 0.6736644, 1.324876, 1, 1, 1, 1, 1,
1.365719, 0.1165176, 0.2968737, 1, 1, 1, 1, 1,
1.374687, -0.3161647, 1.711326, 1, 1, 1, 1, 1,
1.379581, -1.151367, 3.678327, 1, 1, 1, 1, 1,
1.380645, 0.9689096, -1.47478, 1, 1, 1, 1, 1,
1.392006, 0.1274019, 1.648893, 1, 1, 1, 1, 1,
1.417374, 1.039621, 0.8796404, 1, 1, 1, 1, 1,
1.418827, -0.8318327, 2.437068, 1, 1, 1, 1, 1,
1.431644, 0.7465784, 1.734608, 1, 1, 1, 1, 1,
1.432479, -1.217914, 2.590248, 1, 1, 1, 1, 1,
1.433479, -0.5159804, 0.831592, 1, 1, 1, 1, 1,
1.436882, 1.079237, 0.4435558, 1, 1, 1, 1, 1,
1.447289, 0.112912, 1.508516, 1, 1, 1, 1, 1,
1.450885, 1.597153, -0.05830908, 1, 1, 1, 1, 1,
1.463993, -0.550262, 1.810049, 1, 1, 1, 1, 1,
1.464326, -0.6429489, 1.294502, 0, 0, 1, 1, 1,
1.467269, -1.253851, 3.324098, 1, 0, 0, 1, 1,
1.46775, 0.3018829, 0.03187762, 1, 0, 0, 1, 1,
1.483309, -1.578711, 2.509417, 1, 0, 0, 1, 1,
1.487305, 0.08162507, 0.02258687, 1, 0, 0, 1, 1,
1.510215, 0.2457483, 1.456549, 1, 0, 0, 1, 1,
1.524914, 0.5477657, 1.577455, 0, 0, 0, 1, 1,
1.532655, 0.4946623, 0.9500635, 0, 0, 0, 1, 1,
1.53539, -1.020833, 2.751549, 0, 0, 0, 1, 1,
1.553651, -0.5326612, 2.945481, 0, 0, 0, 1, 1,
1.560812, -0.6303622, 2.700435, 0, 0, 0, 1, 1,
1.592581, 1.118675, 0.7854688, 0, 0, 0, 1, 1,
1.592772, -0.6378596, 2.603505, 0, 0, 0, 1, 1,
1.599415, -1.002618, 1.937939, 1, 1, 1, 1, 1,
1.599638, 0.5508794, 2.203248, 1, 1, 1, 1, 1,
1.601969, 0.4451472, 2.507698, 1, 1, 1, 1, 1,
1.602088, 0.3819658, 0.5067697, 1, 1, 1, 1, 1,
1.603827, 0.6885348, 1.114145, 1, 1, 1, 1, 1,
1.606237, -1.158919, 3.040653, 1, 1, 1, 1, 1,
1.609069, -0.3122807, 2.373601, 1, 1, 1, 1, 1,
1.631386, 0.6790845, 1.402933, 1, 1, 1, 1, 1,
1.652857, 0.8378171, 0.2130652, 1, 1, 1, 1, 1,
1.65694, 1.083185, 2.415396, 1, 1, 1, 1, 1,
1.694199, 0.9193949, 1.071645, 1, 1, 1, 1, 1,
1.704263, -0.4210295, 2.096946, 1, 1, 1, 1, 1,
1.707824, -0.4052584, 1.64158, 1, 1, 1, 1, 1,
1.730913, -0.460473, 3.000911, 1, 1, 1, 1, 1,
1.749212, 0.9298851, 2.265217, 1, 1, 1, 1, 1,
1.751752, -0.9920989, 2.264933, 0, 0, 1, 1, 1,
1.75697, 0.9925348, -0.1177144, 1, 0, 0, 1, 1,
1.759507, 0.7140523, -0.01739465, 1, 0, 0, 1, 1,
1.763277, -1.692038, 1.92779, 1, 0, 0, 1, 1,
1.767383, -0.5014128, 1.622916, 1, 0, 0, 1, 1,
1.817613, 0.6293989, 0.615271, 1, 0, 0, 1, 1,
1.82811, -1.761777, 1.677321, 0, 0, 0, 1, 1,
1.852894, -0.427953, 2.607858, 0, 0, 0, 1, 1,
1.866478, 0.67704, 3.465776, 0, 0, 0, 1, 1,
1.880366, -1.563216, 4.302981, 0, 0, 0, 1, 1,
1.893194, 0.2986685, 1.312096, 0, 0, 0, 1, 1,
1.913358, 0.0372576, 1.175762, 0, 0, 0, 1, 1,
1.915794, -0.9529966, 2.024145, 0, 0, 0, 1, 1,
1.927263, -0.2542847, 1.376264, 1, 1, 1, 1, 1,
1.931116, 0.7943743, 3.48914, 1, 1, 1, 1, 1,
1.932361, -0.5735428, 2.024443, 1, 1, 1, 1, 1,
1.945989, -0.0007347955, 2.314195, 1, 1, 1, 1, 1,
1.961024, -2.160252, 2.242079, 1, 1, 1, 1, 1,
1.972775, -0.2503474, -0.1606752, 1, 1, 1, 1, 1,
2.004326, -0.04233995, 1.542959, 1, 1, 1, 1, 1,
2.005865, 1.784816, 0.265056, 1, 1, 1, 1, 1,
2.049413, -0.4366792, 2.502889, 1, 1, 1, 1, 1,
2.053402, 0.2073082, 0.3916153, 1, 1, 1, 1, 1,
2.06562, -0.6995671, 2.701911, 1, 1, 1, 1, 1,
2.088381, 1.288618, 1.741475, 1, 1, 1, 1, 1,
2.113936, 0.6774084, 0.9078338, 1, 1, 1, 1, 1,
2.123097, -0.6800131, 0.6670617, 1, 1, 1, 1, 1,
2.132917, 0.9725929, 1.426056, 1, 1, 1, 1, 1,
2.169791, -0.8770657, 1.314006, 0, 0, 1, 1, 1,
2.184762, 0.01159211, 2.187442, 1, 0, 0, 1, 1,
2.236243, -0.2863671, 0.3027651, 1, 0, 0, 1, 1,
2.24513, 0.5771455, 2.586437, 1, 0, 0, 1, 1,
2.255996, 0.4273863, 1.38099, 1, 0, 0, 1, 1,
2.258603, -0.3842018, 2.049102, 1, 0, 0, 1, 1,
2.299248, 1.105791, 0.6119965, 0, 0, 0, 1, 1,
2.32873, -0.9651635, 2.590428, 0, 0, 0, 1, 1,
2.342421, -0.09884924, 0.3018908, 0, 0, 0, 1, 1,
2.354593, 1.173762, 0.5831539, 0, 0, 0, 1, 1,
2.454213, -0.9720395, 0.6620002, 0, 0, 0, 1, 1,
2.46799, -0.4577239, 0.8935628, 0, 0, 0, 1, 1,
2.620517, 0.1552433, 0.9160507, 0, 0, 0, 1, 1,
2.687338, 1.329579, 1.27666, 1, 1, 1, 1, 1,
2.729584, 0.1985988, 1.250776, 1, 1, 1, 1, 1,
2.766101, -2.950489, 2.03352, 1, 1, 1, 1, 1,
2.90517, 0.4465604, 2.040223, 1, 1, 1, 1, 1,
3.178332, 0.4967794, 0.7452381, 1, 1, 1, 1, 1,
3.214507, 0.5436081, -1.033817, 1, 1, 1, 1, 1,
3.287941, 0.2307322, 1.928498, 1, 1, 1, 1, 1
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
var radius = 10.16195;
var distance = 35.69342;
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
mvMatrix.translate( -0.2686503, -0.6003745, 0.3938272 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.69342);
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
