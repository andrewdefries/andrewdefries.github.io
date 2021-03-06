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
-2.842631, -0.2559453, -2.867352, 1, 0, 0, 1,
-2.79772, 1.024637, -3.446432, 1, 0.007843138, 0, 1,
-2.752457, 0.2896788, -1.052238, 1, 0.01176471, 0, 1,
-2.746724, 0.1694735, -1.608861, 1, 0.01960784, 0, 1,
-2.739475, -2.120218, -1.782435, 1, 0.02352941, 0, 1,
-2.702367, -0.8415017, -2.453997, 1, 0.03137255, 0, 1,
-2.603981, -1.736668, -3.604692, 1, 0.03529412, 0, 1,
-2.559272, 1.234072, -0.9049227, 1, 0.04313726, 0, 1,
-2.495692, 0.07122275, 1.085078, 1, 0.04705882, 0, 1,
-2.419572, 1.789672, -1.942679, 1, 0.05490196, 0, 1,
-2.370708, -0.2993105, -2.42335, 1, 0.05882353, 0, 1,
-2.322418, -0.5478659, -1.239435, 1, 0.06666667, 0, 1,
-2.320458, -0.1880263, -1.256388, 1, 0.07058824, 0, 1,
-2.313877, 0.3274485, -1.311588, 1, 0.07843138, 0, 1,
-2.284566, -0.934315, -3.029006, 1, 0.08235294, 0, 1,
-2.229664, 0.3640685, -2.235744, 1, 0.09019608, 0, 1,
-2.166183, -0.7439713, -1.802299, 1, 0.09411765, 0, 1,
-2.151705, -1.030144, -2.098774, 1, 0.1019608, 0, 1,
-2.067539, -0.4492869, -1.501389, 1, 0.1098039, 0, 1,
-2.050836, -0.3937137, -2.62543, 1, 0.1137255, 0, 1,
-2.032906, -0.1660867, -1.902058, 1, 0.1215686, 0, 1,
-2.003463, -1.398962, -2.740315, 1, 0.1254902, 0, 1,
-1.949169, -0.8461189, -2.27131, 1, 0.1333333, 0, 1,
-1.946282, -2.491261, -2.117756, 1, 0.1372549, 0, 1,
-1.929368, 1.030537, -2.063738, 1, 0.145098, 0, 1,
-1.895426, -0.9984002, -1.771038, 1, 0.1490196, 0, 1,
-1.876887, 0.5500461, -1.559891, 1, 0.1568628, 0, 1,
-1.853804, -0.4775545, 1.380999, 1, 0.1607843, 0, 1,
-1.838382, 0.357103, -2.316831, 1, 0.1686275, 0, 1,
-1.833431, 1.810929, -1.143283, 1, 0.172549, 0, 1,
-1.815834, 0.4106097, -1.160244, 1, 0.1803922, 0, 1,
-1.790172, -1.570878, -1.500495, 1, 0.1843137, 0, 1,
-1.774445, 0.6039228, -0.09522229, 1, 0.1921569, 0, 1,
-1.76492, -0.330403, -1.758775, 1, 0.1960784, 0, 1,
-1.764158, 1.783691, 0.02808561, 1, 0.2039216, 0, 1,
-1.754255, 0.1442806, -2.515783, 1, 0.2117647, 0, 1,
-1.753002, -0.8965108, -1.316715, 1, 0.2156863, 0, 1,
-1.747538, 1.027022, -1.523988, 1, 0.2235294, 0, 1,
-1.738907, -0.1609971, -1.949331, 1, 0.227451, 0, 1,
-1.732889, 1.301149, -2.398043, 1, 0.2352941, 0, 1,
-1.729692, -0.3170526, -0.8190027, 1, 0.2392157, 0, 1,
-1.722102, 0.9006649, -0.3072389, 1, 0.2470588, 0, 1,
-1.702387, -0.5004409, -0.8979824, 1, 0.2509804, 0, 1,
-1.690327, -0.1873587, -2.100818, 1, 0.2588235, 0, 1,
-1.648384, -0.312245, -1.210058, 1, 0.2627451, 0, 1,
-1.641029, 0.3507805, -0.7966713, 1, 0.2705882, 0, 1,
-1.63769, -0.2482407, -1.365395, 1, 0.2745098, 0, 1,
-1.630662, -0.2052554, -1.747766, 1, 0.282353, 0, 1,
-1.628775, -0.7831007, -2.011305, 1, 0.2862745, 0, 1,
-1.625359, 1.491281, -1.948802, 1, 0.2941177, 0, 1,
-1.618905, -0.6836952, -2.242951, 1, 0.3019608, 0, 1,
-1.610236, -0.1111066, -0.2193862, 1, 0.3058824, 0, 1,
-1.607658, -1.511711, -0.2012966, 1, 0.3137255, 0, 1,
-1.59983, -1.049115, -1.926582, 1, 0.3176471, 0, 1,
-1.588265, 1.427866, 1.172902, 1, 0.3254902, 0, 1,
-1.582244, 0.899448, -0.542846, 1, 0.3294118, 0, 1,
-1.555311, 0.112398, -1.272931, 1, 0.3372549, 0, 1,
-1.553033, 1.733341, -0.1676846, 1, 0.3411765, 0, 1,
-1.549086, -0.9990761, -2.895307, 1, 0.3490196, 0, 1,
-1.545981, -1.255434, -2.565794, 1, 0.3529412, 0, 1,
-1.532409, 0.5859836, -0.8986277, 1, 0.3607843, 0, 1,
-1.531321, -1.312133, -2.982902, 1, 0.3647059, 0, 1,
-1.528026, 1.93547, 0.6445441, 1, 0.372549, 0, 1,
-1.520553, -2.07795, -2.484112, 1, 0.3764706, 0, 1,
-1.5126, 0.5598966, -0.5975757, 1, 0.3843137, 0, 1,
-1.505425, -0.9945243, -3.307492, 1, 0.3882353, 0, 1,
-1.503293, -1.289862, -0.3422468, 1, 0.3960784, 0, 1,
-1.501373, 0.08581626, -1.741437, 1, 0.4039216, 0, 1,
-1.500509, -0.08311366, 0.2075974, 1, 0.4078431, 0, 1,
-1.476196, 0.2756694, -1.767455, 1, 0.4156863, 0, 1,
-1.475407, 0.3202128, -1.58967, 1, 0.4196078, 0, 1,
-1.472976, -1.324142, -1.700885, 1, 0.427451, 0, 1,
-1.46414, -1.28708, 0.4031386, 1, 0.4313726, 0, 1,
-1.462701, 0.3473071, -2.779621, 1, 0.4392157, 0, 1,
-1.458683, -0.129252, -3.349651, 1, 0.4431373, 0, 1,
-1.451672, -0.6331545, -2.103336, 1, 0.4509804, 0, 1,
-1.447794, 0.5010421, -0.3580456, 1, 0.454902, 0, 1,
-1.445517, 0.9980926, 0.1513885, 1, 0.4627451, 0, 1,
-1.43911, 0.827148, -1.253833, 1, 0.4666667, 0, 1,
-1.436438, 1.342836, 0.3208964, 1, 0.4745098, 0, 1,
-1.433604, 0.3949181, -0.6819085, 1, 0.4784314, 0, 1,
-1.420171, -0.419507, -3.443156, 1, 0.4862745, 0, 1,
-1.409436, -1.424817, -0.5884769, 1, 0.4901961, 0, 1,
-1.389618, -0.09991879, -0.6554374, 1, 0.4980392, 0, 1,
-1.386566, -1.327616, -1.537853, 1, 0.5058824, 0, 1,
-1.383167, -0.5300492, -2.506493, 1, 0.509804, 0, 1,
-1.378343, -0.4634261, -2.640374, 1, 0.5176471, 0, 1,
-1.377718, 0.1832949, -2.043862, 1, 0.5215687, 0, 1,
-1.348647, 0.418806, -0.4992364, 1, 0.5294118, 0, 1,
-1.347662, -0.6968881, -2.289254, 1, 0.5333334, 0, 1,
-1.343383, 0.3112938, -2.073063, 1, 0.5411765, 0, 1,
-1.322692, 1.131844, 1.453, 1, 0.5450981, 0, 1,
-1.315257, -1.594114, -3.282814, 1, 0.5529412, 0, 1,
-1.313947, -0.7659355, -0.3638193, 1, 0.5568628, 0, 1,
-1.292608, 1.545714, 0.9171611, 1, 0.5647059, 0, 1,
-1.287577, -1.054483, -1.955864, 1, 0.5686275, 0, 1,
-1.285237, 1.486626, -1.771609, 1, 0.5764706, 0, 1,
-1.280208, -0.7167093, -2.286927, 1, 0.5803922, 0, 1,
-1.263756, -0.5108702, -2.756629, 1, 0.5882353, 0, 1,
-1.26255, 0.5212734, -1.363002, 1, 0.5921569, 0, 1,
-1.259566, 0.7999963, -0.1054908, 1, 0.6, 0, 1,
-1.256596, -0.8964831, -2.735484, 1, 0.6078432, 0, 1,
-1.250281, -0.02283127, -1.153477, 1, 0.6117647, 0, 1,
-1.246383, -1.013649, -2.842042, 1, 0.6196079, 0, 1,
-1.245606, -0.4345358, -2.562021, 1, 0.6235294, 0, 1,
-1.243466, -0.4897958, -3.277658, 1, 0.6313726, 0, 1,
-1.240225, -1.191365, -0.8757003, 1, 0.6352941, 0, 1,
-1.23788, -0.4178483, -2.432213, 1, 0.6431373, 0, 1,
-1.237361, -2.224466, -4.340584, 1, 0.6470588, 0, 1,
-1.23596, -0.2112638, -1.726963, 1, 0.654902, 0, 1,
-1.233446, 0.6962212, -0.2283291, 1, 0.6588235, 0, 1,
-1.229992, 1.039835, -0.4874709, 1, 0.6666667, 0, 1,
-1.224504, 1.523642, -0.2480707, 1, 0.6705883, 0, 1,
-1.22258, -1.43628, -3.017727, 1, 0.6784314, 0, 1,
-1.217965, 1.326632, -1.117742, 1, 0.682353, 0, 1,
-1.217612, -0.4044876, -1.231204, 1, 0.6901961, 0, 1,
-1.216873, 0.4281099, -0.3988886, 1, 0.6941177, 0, 1,
-1.214757, -1.164513, -2.335133, 1, 0.7019608, 0, 1,
-1.205196, -1.201961, -2.715934, 1, 0.7098039, 0, 1,
-1.197829, 0.821225, -1.179582, 1, 0.7137255, 0, 1,
-1.194719, -0.6637962, -2.728346, 1, 0.7215686, 0, 1,
-1.188351, -2.229539, -4.979799, 1, 0.7254902, 0, 1,
-1.179869, -0.05846752, -1.53613, 1, 0.7333333, 0, 1,
-1.176346, 0.04329488, -1.245615, 1, 0.7372549, 0, 1,
-1.173446, 0.3156016, -1.826667, 1, 0.7450981, 0, 1,
-1.156368, 1.168646, -0.5180586, 1, 0.7490196, 0, 1,
-1.1522, 0.2168934, -1.141246, 1, 0.7568628, 0, 1,
-1.145188, -0.2461663, -3.258193, 1, 0.7607843, 0, 1,
-1.138801, 0.9237779, -2.551499, 1, 0.7686275, 0, 1,
-1.136369, 1.76678, -0.2389281, 1, 0.772549, 0, 1,
-1.130989, -0.7962043, -1.847989, 1, 0.7803922, 0, 1,
-1.12837, -0.5847321, -3.582749, 1, 0.7843137, 0, 1,
-1.113433, -0.2968307, -1.866381, 1, 0.7921569, 0, 1,
-1.112483, 1.053503, -1.488344, 1, 0.7960784, 0, 1,
-1.101504, -0.2940457, -2.87424, 1, 0.8039216, 0, 1,
-1.096147, 0.9845901, -0.6211317, 1, 0.8117647, 0, 1,
-1.093992, -0.09580575, -3.784227, 1, 0.8156863, 0, 1,
-1.091482, -0.2172963, -2.89696, 1, 0.8235294, 0, 1,
-1.089111, 0.09092347, -2.422588, 1, 0.827451, 0, 1,
-1.086636, 0.8493381, -2.603885, 1, 0.8352941, 0, 1,
-1.086366, -0.1869221, -1.616823, 1, 0.8392157, 0, 1,
-1.081895, -1.416976, -3.347409, 1, 0.8470588, 0, 1,
-1.081432, 0.3131013, -0.8470821, 1, 0.8509804, 0, 1,
-1.079904, -0.1923997, -1.230498, 1, 0.8588235, 0, 1,
-1.078958, -0.3137655, -2.564436, 1, 0.8627451, 0, 1,
-1.064917, -0.1432553, -3.27317, 1, 0.8705882, 0, 1,
-1.062019, -2.218155, -2.455395, 1, 0.8745098, 0, 1,
-1.05134, -1.432176, -1.854584, 1, 0.8823529, 0, 1,
-1.049624, 0.4986336, -1.07566, 1, 0.8862745, 0, 1,
-1.037614, 1.26345, -0.8986241, 1, 0.8941177, 0, 1,
-1.03537, -0.7130727, -1.370152, 1, 0.8980392, 0, 1,
-1.030434, 0.2795933, -1.380319, 1, 0.9058824, 0, 1,
-1.026308, 2.196468, -1.795633, 1, 0.9137255, 0, 1,
-1.02404, -0.01223917, -2.237531, 1, 0.9176471, 0, 1,
-1.019011, -0.6698228, -2.912387, 1, 0.9254902, 0, 1,
-1.01466, -0.400835, -0.5260795, 1, 0.9294118, 0, 1,
-1.009991, -0.52547, -2.793583, 1, 0.9372549, 0, 1,
-1.008762, 0.136048, -0.7234659, 1, 0.9411765, 0, 1,
-1.00438, -1.204806, -3.679491, 1, 0.9490196, 0, 1,
-1.002872, -0.9733013, -3.130959, 1, 0.9529412, 0, 1,
-1.00006, 0.3952462, -2.801239, 1, 0.9607843, 0, 1,
-0.9855853, -0.6170836, -0.8840292, 1, 0.9647059, 0, 1,
-0.9850737, -0.6311997, -2.012277, 1, 0.972549, 0, 1,
-0.9843874, 0.8584276, -1.262866, 1, 0.9764706, 0, 1,
-0.9843404, 0.6570852, -1.670663, 1, 0.9843137, 0, 1,
-0.9711419, -1.112048, -3.063903, 1, 0.9882353, 0, 1,
-0.9626182, 0.8684139, -1.631804, 1, 0.9960784, 0, 1,
-0.9591384, -0.1014738, -1.358397, 0.9960784, 1, 0, 1,
-0.9565763, -1.912088, -1.942757, 0.9921569, 1, 0, 1,
-0.9514735, 0.8503674, -0.8739977, 0.9843137, 1, 0, 1,
-0.9503393, 0.4121106, 1.092526, 0.9803922, 1, 0, 1,
-0.949429, -1.052221, -3.214976, 0.972549, 1, 0, 1,
-0.948034, 0.9945853, -1.252576, 0.9686275, 1, 0, 1,
-0.9443435, -0.3060545, -0.1662433, 0.9607843, 1, 0, 1,
-0.9441894, -0.530643, -1.337884, 0.9568627, 1, 0, 1,
-0.9396867, 0.3193331, -0.3586612, 0.9490196, 1, 0, 1,
-0.9395276, 0.431364, 0.766716, 0.945098, 1, 0, 1,
-0.9389203, 0.8316779, -1.413787, 0.9372549, 1, 0, 1,
-0.9368638, 0.4701582, 1.128492, 0.9333333, 1, 0, 1,
-0.9364071, -0.8516269, -2.769098, 0.9254902, 1, 0, 1,
-0.9351594, 2.671067, -1.24807, 0.9215686, 1, 0, 1,
-0.9304928, -0.5177939, -4.030172, 0.9137255, 1, 0, 1,
-0.9201624, -0.7743999, -2.392277, 0.9098039, 1, 0, 1,
-0.9048133, -0.1399067, -2.107871, 0.9019608, 1, 0, 1,
-0.9042578, -0.578445, -3.668013, 0.8941177, 1, 0, 1,
-0.9016173, 0.6138335, 1.433231, 0.8901961, 1, 0, 1,
-0.9014585, 0.8672051, -0.2586466, 0.8823529, 1, 0, 1,
-0.9009818, -0.4050964, -1.722378, 0.8784314, 1, 0, 1,
-0.8994368, 1.275591, -1.43766, 0.8705882, 1, 0, 1,
-0.8856074, 1.943753, -0.2813766, 0.8666667, 1, 0, 1,
-0.8851426, 1.527573, -2.293258, 0.8588235, 1, 0, 1,
-0.8810322, -1.097961, -0.7925454, 0.854902, 1, 0, 1,
-0.8804581, -0.9069701, -1.611858, 0.8470588, 1, 0, 1,
-0.8799039, -0.2621558, -1.097173, 0.8431373, 1, 0, 1,
-0.8765599, 0.2160957, -1.557914, 0.8352941, 1, 0, 1,
-0.8764648, 0.4028093, -3.819468, 0.8313726, 1, 0, 1,
-0.8717911, -0.972452, -3.742448, 0.8235294, 1, 0, 1,
-0.8675326, 1.326789, -1.022935, 0.8196079, 1, 0, 1,
-0.8549938, -0.4572479, -1.399736, 0.8117647, 1, 0, 1,
-0.8428232, 0.5500249, -0.02044414, 0.8078431, 1, 0, 1,
-0.8346773, 0.3988634, -0.1774938, 0.8, 1, 0, 1,
-0.8280803, -0.6561771, -2.340851, 0.7921569, 1, 0, 1,
-0.8278566, 1.552343, -0.7905346, 0.7882353, 1, 0, 1,
-0.8138981, -0.4212282, -0.6685237, 0.7803922, 1, 0, 1,
-0.8134617, -0.157145, -5.269666, 0.7764706, 1, 0, 1,
-0.8127114, 0.5411023, -1.636911, 0.7686275, 1, 0, 1,
-0.8081837, 2.305959, -0.3332256, 0.7647059, 1, 0, 1,
-0.8047606, 1.259301, -1.535753, 0.7568628, 1, 0, 1,
-0.8032732, -1.35843, -1.180849, 0.7529412, 1, 0, 1,
-0.8026059, 0.4310159, -1.86936, 0.7450981, 1, 0, 1,
-0.8010909, 0.4224433, -1.871868, 0.7411765, 1, 0, 1,
-0.7954986, -0.7568968, -2.077246, 0.7333333, 1, 0, 1,
-0.7912137, -0.1939447, -1.140956, 0.7294118, 1, 0, 1,
-0.7905718, 0.1699734, 0.09833074, 0.7215686, 1, 0, 1,
-0.7901011, -0.4921056, -1.49084, 0.7176471, 1, 0, 1,
-0.7865155, -1.42072, -2.124674, 0.7098039, 1, 0, 1,
-0.7815281, -2.028972, -3.634535, 0.7058824, 1, 0, 1,
-0.7815175, -0.8492107, -4.126346, 0.6980392, 1, 0, 1,
-0.7750584, -0.173259, -1.078215, 0.6901961, 1, 0, 1,
-0.7743665, -1.382825, -3.138237, 0.6862745, 1, 0, 1,
-0.7692996, -0.9116253, -3.21902, 0.6784314, 1, 0, 1,
-0.7500672, 0.5054443, -3.096618, 0.6745098, 1, 0, 1,
-0.7489037, -1.331311, -1.319418, 0.6666667, 1, 0, 1,
-0.7441308, -0.2610284, -1.436544, 0.6627451, 1, 0, 1,
-0.7360405, 0.8150393, 0.4264499, 0.654902, 1, 0, 1,
-0.734457, -0.3386547, -1.806021, 0.6509804, 1, 0, 1,
-0.72917, -1.142821, -2.670287, 0.6431373, 1, 0, 1,
-0.7281427, 0.5723667, -0.4225543, 0.6392157, 1, 0, 1,
-0.7260237, 1.800962, 3.081353, 0.6313726, 1, 0, 1,
-0.7253183, 2.036392, -0.7578995, 0.627451, 1, 0, 1,
-0.7239253, 0.9188887, -1.628511, 0.6196079, 1, 0, 1,
-0.7234082, -0.8899159, -1.891782, 0.6156863, 1, 0, 1,
-0.7137327, -0.8746315, -4.112437, 0.6078432, 1, 0, 1,
-0.7137088, -0.7258022, 0.09623466, 0.6039216, 1, 0, 1,
-0.7085043, 0.3792169, -0.2949981, 0.5960785, 1, 0, 1,
-0.7060642, 0.07954229, -0.7909597, 0.5882353, 1, 0, 1,
-0.7033812, -0.6153899, -1.542735, 0.5843138, 1, 0, 1,
-0.691636, -0.2069708, -0.6745239, 0.5764706, 1, 0, 1,
-0.691178, 0.8328148, 0.7339192, 0.572549, 1, 0, 1,
-0.6906353, -2.405848, -2.58316, 0.5647059, 1, 0, 1,
-0.6850919, 0.2415573, -0.8341535, 0.5607843, 1, 0, 1,
-0.6847953, -0.1886631, -1.503938, 0.5529412, 1, 0, 1,
-0.6844512, -0.3905841, -2.22489, 0.5490196, 1, 0, 1,
-0.6786224, 0.732677, -0.5355544, 0.5411765, 1, 0, 1,
-0.678387, 0.2353978, -1.737401, 0.5372549, 1, 0, 1,
-0.6781642, 0.7818433, -1.659935, 0.5294118, 1, 0, 1,
-0.6743924, -0.5707518, -3.872041, 0.5254902, 1, 0, 1,
-0.6697907, 0.6984385, -1.523244, 0.5176471, 1, 0, 1,
-0.6694887, -0.1258513, -0.1295039, 0.5137255, 1, 0, 1,
-0.6664344, -0.3767332, -1.715118, 0.5058824, 1, 0, 1,
-0.6642931, 1.235258, -0.3358748, 0.5019608, 1, 0, 1,
-0.661099, -0.2230496, -2.360727, 0.4941176, 1, 0, 1,
-0.6606383, -1.499915, -0.9944861, 0.4862745, 1, 0, 1,
-0.6566297, 0.6706904, -2.127124, 0.4823529, 1, 0, 1,
-0.6555201, -2.081927, -2.88303, 0.4745098, 1, 0, 1,
-0.6551989, 0.2150535, -2.187061, 0.4705882, 1, 0, 1,
-0.6496967, -0.7013432, -2.668232, 0.4627451, 1, 0, 1,
-0.6487672, 0.5800526, -0.5326787, 0.4588235, 1, 0, 1,
-0.6485731, -0.5709659, -2.214597, 0.4509804, 1, 0, 1,
-0.6456475, -0.9417419, -2.093851, 0.4470588, 1, 0, 1,
-0.6441447, -0.228976, -0.3313251, 0.4392157, 1, 0, 1,
-0.6421172, -0.6300007, -2.216959, 0.4352941, 1, 0, 1,
-0.6401082, -0.1526361, -2.635332, 0.427451, 1, 0, 1,
-0.6334461, 1.074088, -0.9027237, 0.4235294, 1, 0, 1,
-0.6276388, 0.04292853, -1.204798, 0.4156863, 1, 0, 1,
-0.6273062, -0.4447106, -2.830498, 0.4117647, 1, 0, 1,
-0.6271467, 1.399308, -0.3977979, 0.4039216, 1, 0, 1,
-0.6212294, 0.1560438, -0.6853994, 0.3960784, 1, 0, 1,
-0.6211287, -0.1114885, -1.956074, 0.3921569, 1, 0, 1,
-0.6114274, 0.4885958, -0.3768432, 0.3843137, 1, 0, 1,
-0.6075834, 0.0565707, -0.382471, 0.3803922, 1, 0, 1,
-0.6016781, 0.4186313, 0.261393, 0.372549, 1, 0, 1,
-0.5984595, 2.238073, 0.677964, 0.3686275, 1, 0, 1,
-0.5980205, -1.315575, -2.393595, 0.3607843, 1, 0, 1,
-0.5951832, -0.8345929, -0.3017636, 0.3568628, 1, 0, 1,
-0.5930142, -0.2365831, -3.170622, 0.3490196, 1, 0, 1,
-0.58831, -0.2548789, -1.850323, 0.345098, 1, 0, 1,
-0.5868855, 0.9184642, 0.3728922, 0.3372549, 1, 0, 1,
-0.5840409, -0.2647869, -1.364186, 0.3333333, 1, 0, 1,
-0.5839292, 1.020991, 0.4957522, 0.3254902, 1, 0, 1,
-0.5826012, -0.5130419, -2.298163, 0.3215686, 1, 0, 1,
-0.5797728, 0.5847012, -0.6561722, 0.3137255, 1, 0, 1,
-0.5757136, -0.8761611, -4.358862, 0.3098039, 1, 0, 1,
-0.5755023, 0.4127688, -2.325895, 0.3019608, 1, 0, 1,
-0.5704048, 0.911458, -0.4579749, 0.2941177, 1, 0, 1,
-0.5702736, -0.2414186, -2.576652, 0.2901961, 1, 0, 1,
-0.5673434, -1.099368, -1.972434, 0.282353, 1, 0, 1,
-0.5667059, 0.7600539, 1.213488, 0.2784314, 1, 0, 1,
-0.5593489, -0.4079959, -2.205005, 0.2705882, 1, 0, 1,
-0.5506749, 1.097912, -0.6057885, 0.2666667, 1, 0, 1,
-0.5496939, -1.219803, -2.963867, 0.2588235, 1, 0, 1,
-0.5366422, -0.06000997, -1.74597, 0.254902, 1, 0, 1,
-0.5326422, 1.13328, -0.4804644, 0.2470588, 1, 0, 1,
-0.5315568, -1.042903, -1.500891, 0.2431373, 1, 0, 1,
-0.5285059, 1.110829, -1.409509, 0.2352941, 1, 0, 1,
-0.5248247, 0.1849236, -1.194592, 0.2313726, 1, 0, 1,
-0.5182573, -0.6374213, -2.959807, 0.2235294, 1, 0, 1,
-0.5152526, 0.9270819, -0.9955485, 0.2196078, 1, 0, 1,
-0.5136584, 0.05746049, -1.430315, 0.2117647, 1, 0, 1,
-0.5104012, 0.2133118, -1.696037, 0.2078431, 1, 0, 1,
-0.5093622, -0.2128205, -4.051383, 0.2, 1, 0, 1,
-0.5070496, 1.633911, 0.7419662, 0.1921569, 1, 0, 1,
-0.5035374, 0.07765855, -1.630996, 0.1882353, 1, 0, 1,
-0.5030201, 0.9262297, -0.7484046, 0.1803922, 1, 0, 1,
-0.494559, 1.12376, -1.833133, 0.1764706, 1, 0, 1,
-0.4890729, 0.2582458, -1.3019, 0.1686275, 1, 0, 1,
-0.4877969, 1.300458, -0.180246, 0.1647059, 1, 0, 1,
-0.4877521, 1.176233, -1.391365, 0.1568628, 1, 0, 1,
-0.4845901, -0.9156899, -1.940153, 0.1529412, 1, 0, 1,
-0.4840324, -0.05348417, -0.427611, 0.145098, 1, 0, 1,
-0.481288, -0.2465407, -2.965981, 0.1411765, 1, 0, 1,
-0.4791067, 1.285115, 0.08979363, 0.1333333, 1, 0, 1,
-0.4756942, -0.2651989, -1.953975, 0.1294118, 1, 0, 1,
-0.4714536, 1.854355, -3.182846, 0.1215686, 1, 0, 1,
-0.4694629, 0.1848463, -2.43263, 0.1176471, 1, 0, 1,
-0.4649019, 0.1102796, -0.7220679, 0.1098039, 1, 0, 1,
-0.4640353, -0.5677514, -1.948728, 0.1058824, 1, 0, 1,
-0.461738, 0.5083455, -1.71699, 0.09803922, 1, 0, 1,
-0.4612036, 0.07953677, -2.387043, 0.09019608, 1, 0, 1,
-0.4574594, -0.261443, -4.237244, 0.08627451, 1, 0, 1,
-0.4546997, -1.306383, -1.881823, 0.07843138, 1, 0, 1,
-0.4541501, 0.3865299, -0.4225771, 0.07450981, 1, 0, 1,
-0.4512375, 0.02633817, -1.258375, 0.06666667, 1, 0, 1,
-0.4476599, -1.036925, -3.903625, 0.0627451, 1, 0, 1,
-0.4463141, 0.1456784, -1.203597, 0.05490196, 1, 0, 1,
-0.4462306, 0.9206578, -0.009490768, 0.05098039, 1, 0, 1,
-0.4457583, -1.663799, -3.792312, 0.04313726, 1, 0, 1,
-0.4448563, -0.1859409, -1.513208, 0.03921569, 1, 0, 1,
-0.4419096, -0.8263316, -2.94898, 0.03137255, 1, 0, 1,
-0.4414757, -0.6575722, -3.291872, 0.02745098, 1, 0, 1,
-0.4391836, 0.08419687, -0.5282417, 0.01960784, 1, 0, 1,
-0.4387586, 0.2821859, -1.72672, 0.01568628, 1, 0, 1,
-0.4375891, 0.664835, -1.163806, 0.007843138, 1, 0, 1,
-0.4369821, 0.8064648, -0.1970565, 0.003921569, 1, 0, 1,
-0.4361912, -0.3492514, -2.107866, 0, 1, 0.003921569, 1,
-0.4346084, 0.7179931, -0.9912079, 0, 1, 0.01176471, 1,
-0.4345351, 0.3145404, -1.114006, 0, 1, 0.01568628, 1,
-0.4285058, -0.628245, -1.519613, 0, 1, 0.02352941, 1,
-0.4266234, 0.2469326, -2.237891, 0, 1, 0.02745098, 1,
-0.4256462, 0.3797046, -1.436578, 0, 1, 0.03529412, 1,
-0.4244436, -0.8079866, -5.797381, 0, 1, 0.03921569, 1,
-0.4093238, 1.117767, -1.799133, 0, 1, 0.04705882, 1,
-0.4049836, 0.05915387, -1.871306, 0, 1, 0.05098039, 1,
-0.403904, 0.4193338, 1.481423, 0, 1, 0.05882353, 1,
-0.4022511, -0.2082635, -1.911616, 0, 1, 0.0627451, 1,
-0.3996121, 1.672223, -0.3322462, 0, 1, 0.07058824, 1,
-0.3935589, 1.455199, -1.343361, 0, 1, 0.07450981, 1,
-0.3932853, 1.541877, 0.8523174, 0, 1, 0.08235294, 1,
-0.3926091, -0.2942951, -0.9810176, 0, 1, 0.08627451, 1,
-0.3921537, -0.1160123, -1.191877, 0, 1, 0.09411765, 1,
-0.391603, -0.8454515, -1.533495, 0, 1, 0.1019608, 1,
-0.3885648, -1.266703, -1.331342, 0, 1, 0.1058824, 1,
-0.3866678, 1.259608, -0.05061892, 0, 1, 0.1137255, 1,
-0.3862601, -0.3532558, 0.242233, 0, 1, 0.1176471, 1,
-0.3859784, -1.472737, -2.482885, 0, 1, 0.1254902, 1,
-0.3839276, 1.868893, -1.818063, 0, 1, 0.1294118, 1,
-0.3824906, 0.263787, -0.8454775, 0, 1, 0.1372549, 1,
-0.3790911, 0.9585891, 0.2868033, 0, 1, 0.1411765, 1,
-0.373852, 0.9040383, -0.4839031, 0, 1, 0.1490196, 1,
-0.3727583, -0.7768937, -1.932543, 0, 1, 0.1529412, 1,
-0.3696162, 1.455416, 0.325642, 0, 1, 0.1607843, 1,
-0.3671807, 0.2964093, -0.5345693, 0, 1, 0.1647059, 1,
-0.3637515, -0.9065459, -0.9500512, 0, 1, 0.172549, 1,
-0.3634987, -0.1821431, -1.837748, 0, 1, 0.1764706, 1,
-0.36125, 0.2964562, 0.3714811, 0, 1, 0.1843137, 1,
-0.3574451, 0.2453539, 0.206505, 0, 1, 0.1882353, 1,
-0.3551684, -0.3274667, -0.7127163, 0, 1, 0.1960784, 1,
-0.3483053, -0.6601849, -3.654989, 0, 1, 0.2039216, 1,
-0.3464555, 0.494156, 0.8332708, 0, 1, 0.2078431, 1,
-0.3458707, 1.504492, 0.7743758, 0, 1, 0.2156863, 1,
-0.3451942, 0.004681252, -1.816653, 0, 1, 0.2196078, 1,
-0.3399507, -0.1093388, 0.191429, 0, 1, 0.227451, 1,
-0.3380481, -3.119921, -4.554803, 0, 1, 0.2313726, 1,
-0.3368111, -0.9637452, -2.872327, 0, 1, 0.2392157, 1,
-0.3338959, 0.2798774, -0.8645881, 0, 1, 0.2431373, 1,
-0.333842, 0.1923863, -0.08239023, 0, 1, 0.2509804, 1,
-0.3297239, 0.6111717, -1.345853, 0, 1, 0.254902, 1,
-0.3271996, 0.3037263, -1.997759, 0, 1, 0.2627451, 1,
-0.3256281, -0.364797, -3.345042, 0, 1, 0.2666667, 1,
-0.3236902, 0.8878923, -0.1306901, 0, 1, 0.2745098, 1,
-0.3234232, 0.5507144, 1.008499, 0, 1, 0.2784314, 1,
-0.3221348, 0.0870555, -0.08817481, 0, 1, 0.2862745, 1,
-0.3213979, -0.9570007, -1.914892, 0, 1, 0.2901961, 1,
-0.3197909, -0.277002, -2.702237, 0, 1, 0.2980392, 1,
-0.3189204, 0.6744075, 0.8908933, 0, 1, 0.3058824, 1,
-0.3180817, 0.6484805, -1.510546, 0, 1, 0.3098039, 1,
-0.3179794, 0.830526, -1.02246, 0, 1, 0.3176471, 1,
-0.309322, 1.083178, -0.4232906, 0, 1, 0.3215686, 1,
-0.3089903, -0.5840713, -2.96262, 0, 1, 0.3294118, 1,
-0.3083365, -0.7911159, -2.134204, 0, 1, 0.3333333, 1,
-0.3029558, -0.5066983, -0.6295686, 0, 1, 0.3411765, 1,
-0.3007059, 0.9372835, 0.3107386, 0, 1, 0.345098, 1,
-0.2990032, 0.881628, -2.453112, 0, 1, 0.3529412, 1,
-0.2981658, 0.8724406, 1.363746, 0, 1, 0.3568628, 1,
-0.2963061, 0.8594355, 0.6507362, 0, 1, 0.3647059, 1,
-0.2955742, -0.4070279, -1.832994, 0, 1, 0.3686275, 1,
-0.2952647, -1.012453, -3.43228, 0, 1, 0.3764706, 1,
-0.2909548, -0.6520015, -3.013278, 0, 1, 0.3803922, 1,
-0.2899907, 1.741307, -0.5743654, 0, 1, 0.3882353, 1,
-0.2866622, -2.553013, -3.292355, 0, 1, 0.3921569, 1,
-0.2815346, -1.006563, -1.199955, 0, 1, 0.4, 1,
-0.280451, -2.090866, -3.758645, 0, 1, 0.4078431, 1,
-0.2791519, 0.05994441, -2.006665, 0, 1, 0.4117647, 1,
-0.2740018, 0.4775028, -0.821901, 0, 1, 0.4196078, 1,
-0.2706731, -0.07490054, -2.099507, 0, 1, 0.4235294, 1,
-0.2649652, -0.1780105, -3.357693, 0, 1, 0.4313726, 1,
-0.2626902, 0.5791638, -0.3944324, 0, 1, 0.4352941, 1,
-0.261604, -0.6238706, -2.405334, 0, 1, 0.4431373, 1,
-0.2614722, 1.01222, -0.1937892, 0, 1, 0.4470588, 1,
-0.2571062, 0.04623736, -1.785647, 0, 1, 0.454902, 1,
-0.2563402, 0.6866122, -1.190283, 0, 1, 0.4588235, 1,
-0.2551784, -0.4499455, -1.464836, 0, 1, 0.4666667, 1,
-0.2549166, 1.133779, -1.236411, 0, 1, 0.4705882, 1,
-0.253622, 0.2495516, -1.869093, 0, 1, 0.4784314, 1,
-0.2524196, -1.370295, -3.902505, 0, 1, 0.4823529, 1,
-0.2508651, 1.273615, 0.265643, 0, 1, 0.4901961, 1,
-0.2458263, 0.0420902, -1.295267, 0, 1, 0.4941176, 1,
-0.2444476, -1.015974, -1.742804, 0, 1, 0.5019608, 1,
-0.2440804, 1.020938, -0.881969, 0, 1, 0.509804, 1,
-0.2417405, -1.679369, -1.978105, 0, 1, 0.5137255, 1,
-0.2414826, 0.3376745, 0.7293739, 0, 1, 0.5215687, 1,
-0.221183, 1.696839, 0.2011515, 0, 1, 0.5254902, 1,
-0.2178076, -0.1857249, -1.855346, 0, 1, 0.5333334, 1,
-0.2013154, -0.6137235, -3.36405, 0, 1, 0.5372549, 1,
-0.1983207, 0.377711, -0.04070123, 0, 1, 0.5450981, 1,
-0.1963728, 0.3153026, -1.636037, 0, 1, 0.5490196, 1,
-0.195081, 0.1332031, -1.24658, 0, 1, 0.5568628, 1,
-0.1866471, 0.1192112, 0.09896021, 0, 1, 0.5607843, 1,
-0.1865821, 0.1907927, -0.3741365, 0, 1, 0.5686275, 1,
-0.1777379, 0.5449604, 0.5742729, 0, 1, 0.572549, 1,
-0.1769642, -0.4781141, -2.468753, 0, 1, 0.5803922, 1,
-0.1744389, -2.079865, -2.151191, 0, 1, 0.5843138, 1,
-0.174101, -0.09710403, -1.458297, 0, 1, 0.5921569, 1,
-0.1739243, -1.042488, -5.179013, 0, 1, 0.5960785, 1,
-0.1700254, -0.4285071, -3.806062, 0, 1, 0.6039216, 1,
-0.1662973, 0.7531801, 1.05596, 0, 1, 0.6117647, 1,
-0.1641682, -0.7805731, -2.611809, 0, 1, 0.6156863, 1,
-0.1632481, -1.662658, -2.532554, 0, 1, 0.6235294, 1,
-0.1506042, -1.358205, -3.994349, 0, 1, 0.627451, 1,
-0.1489301, 1.412618, -0.839146, 0, 1, 0.6352941, 1,
-0.1483664, 1.559127, -1.726316, 0, 1, 0.6392157, 1,
-0.1462352, 0.005676778, -2.081843, 0, 1, 0.6470588, 1,
-0.145833, 0.9936404, -0.04693783, 0, 1, 0.6509804, 1,
-0.144698, -0.2894084, -2.479128, 0, 1, 0.6588235, 1,
-0.1372754, -0.4491778, -3.022925, 0, 1, 0.6627451, 1,
-0.1372082, -1.586909, -4.547463, 0, 1, 0.6705883, 1,
-0.1371454, 1.26249, 0.3716812, 0, 1, 0.6745098, 1,
-0.1342783, -1.367097, -3.206735, 0, 1, 0.682353, 1,
-0.1338745, -1.618008, -2.607743, 0, 1, 0.6862745, 1,
-0.1337999, -0.1060931, -2.203478, 0, 1, 0.6941177, 1,
-0.133424, -0.3062712, -3.394879, 0, 1, 0.7019608, 1,
-0.1304772, -1.435077, -3.75886, 0, 1, 0.7058824, 1,
-0.1283754, -0.837195, -1.675345, 0, 1, 0.7137255, 1,
-0.1241842, 1.295097, 0.1490622, 0, 1, 0.7176471, 1,
-0.1235088, -0.3999022, -1.874899, 0, 1, 0.7254902, 1,
-0.1234795, 0.7229988, -1.082508, 0, 1, 0.7294118, 1,
-0.1183299, -0.2283214, -2.891859, 0, 1, 0.7372549, 1,
-0.1123374, 0.5732663, 1.035122, 0, 1, 0.7411765, 1,
-0.1118097, -0.06737866, -0.6945269, 0, 1, 0.7490196, 1,
-0.1115525, -1.003718, -2.402211, 0, 1, 0.7529412, 1,
-0.1112289, 0.538663, -0.439005, 0, 1, 0.7607843, 1,
-0.1105974, -0.2931164, -1.836211, 0, 1, 0.7647059, 1,
-0.1102626, 0.8806784, 0.4278465, 0, 1, 0.772549, 1,
-0.1090397, -0.9657577, -2.800258, 0, 1, 0.7764706, 1,
-0.1026056, -0.1260747, -2.708295, 0, 1, 0.7843137, 1,
-0.1025604, 0.1818036, -0.238215, 0, 1, 0.7882353, 1,
-0.1011555, -0.7591221, -4.220202, 0, 1, 0.7960784, 1,
-0.09814923, 0.03984801, -1.756359, 0, 1, 0.8039216, 1,
-0.09688533, 0.3631769, -1.855872, 0, 1, 0.8078431, 1,
-0.09437254, -1.27186, -3.524429, 0, 1, 0.8156863, 1,
-0.08986455, 0.6048675, 0.9570561, 0, 1, 0.8196079, 1,
-0.08849417, 0.08614359, -1.568385, 0, 1, 0.827451, 1,
-0.08821265, -0.6092857, -2.124257, 0, 1, 0.8313726, 1,
-0.08526769, -0.9795069, -1.905731, 0, 1, 0.8392157, 1,
-0.08428273, 0.0008991711, -3.230529, 0, 1, 0.8431373, 1,
-0.08375338, 0.2295947, -0.3186878, 0, 1, 0.8509804, 1,
-0.08193265, 0.2911124, -0.4070677, 0, 1, 0.854902, 1,
-0.08186998, 1.161887, 0.9781435, 0, 1, 0.8627451, 1,
-0.07747212, 8.42725e-05, -2.223186, 0, 1, 0.8666667, 1,
-0.0774489, -0.1616593, -0.9436812, 0, 1, 0.8745098, 1,
-0.07282748, 0.1619029, 0.01316131, 0, 1, 0.8784314, 1,
-0.0703439, -1.395971, -4.580623, 0, 1, 0.8862745, 1,
-0.06197765, 1.815611, -1.457397, 0, 1, 0.8901961, 1,
-0.06011468, 0.8770737, -0.3916229, 0, 1, 0.8980392, 1,
-0.0598915, -1.02604, -3.382486, 0, 1, 0.9058824, 1,
-0.05981374, -0.4475056, -2.179761, 0, 1, 0.9098039, 1,
-0.05940374, 0.08882455, -0.9812987, 0, 1, 0.9176471, 1,
-0.05875183, -0.07210181, -1.618123, 0, 1, 0.9215686, 1,
-0.05494733, 0.6899559, 0.5095537, 0, 1, 0.9294118, 1,
-0.05193866, -0.8333892, -3.701059, 0, 1, 0.9333333, 1,
-0.04941388, -0.3496011, -2.664052, 0, 1, 0.9411765, 1,
-0.04709751, 0.7211779, -1.466825, 0, 1, 0.945098, 1,
-0.04029551, -0.3149713, -0.708426, 0, 1, 0.9529412, 1,
-0.03987952, -1.024106, -4.840043, 0, 1, 0.9568627, 1,
-0.03883802, 0.6208069, 0.6932935, 0, 1, 0.9647059, 1,
-0.03711033, 1.0513, -1.601684, 0, 1, 0.9686275, 1,
-0.03384523, 0.8940988, -0.01658702, 0, 1, 0.9764706, 1,
-0.03303858, -0.2009572, -3.949452, 0, 1, 0.9803922, 1,
-0.03052123, 0.01771459, -1.822769, 0, 1, 0.9882353, 1,
-0.02449083, 1.576755, -0.7169279, 0, 1, 0.9921569, 1,
-0.02351749, 0.4444939, -0.749297, 0, 1, 1, 1,
-0.01978577, 0.3448355, -0.7471201, 0, 0.9921569, 1, 1,
-0.01818267, 1.622217, -1.44393, 0, 0.9882353, 1, 1,
-0.01689308, 0.3406855, 2.149619, 0, 0.9803922, 1, 1,
-0.01586711, 0.5636272, -2.111406, 0, 0.9764706, 1, 1,
-0.01276446, -0.9359896, -2.767348, 0, 0.9686275, 1, 1,
-0.006402274, -2.488783, -1.918247, 0, 0.9647059, 1, 1,
-2.706736e-05, -0.4650813, -4.583406, 0, 0.9568627, 1, 1,
0.001868186, -0.007380334, 1.215721, 0, 0.9529412, 1, 1,
0.002113624, -0.709872, 4.708015, 0, 0.945098, 1, 1,
0.008283579, -1.543445, 3.694045, 0, 0.9411765, 1, 1,
0.0102042, -0.9107734, 1.823013, 0, 0.9333333, 1, 1,
0.02005908, 2.962703, -0.9396753, 0, 0.9294118, 1, 1,
0.02739501, 1.755534, 0.4935602, 0, 0.9215686, 1, 1,
0.02960703, -0.1837061, 4.714545, 0, 0.9176471, 1, 1,
0.02970173, 0.9100848, 0.2290533, 0, 0.9098039, 1, 1,
0.03163509, 0.411465, -0.3981822, 0, 0.9058824, 1, 1,
0.03259496, -0.5889912, 1.861241, 0, 0.8980392, 1, 1,
0.03372312, 2.798449, -0.366317, 0, 0.8901961, 1, 1,
0.03806837, -0.5125524, 4.139721, 0, 0.8862745, 1, 1,
0.0382743, -1.557092, 1.564268, 0, 0.8784314, 1, 1,
0.03899789, 1.252279, -1.013063, 0, 0.8745098, 1, 1,
0.03907552, 2.169455, 0.3066085, 0, 0.8666667, 1, 1,
0.04403728, 1.348928, 1.048981, 0, 0.8627451, 1, 1,
0.04543829, 0.8575556, -0.8563031, 0, 0.854902, 1, 1,
0.04886829, 0.3262289, 1.397887, 0, 0.8509804, 1, 1,
0.05361433, -1.151265, 4.175387, 0, 0.8431373, 1, 1,
0.05392098, -1.275281, 4.083754, 0, 0.8392157, 1, 1,
0.05468195, 1.184806, -1.515134, 0, 0.8313726, 1, 1,
0.05594214, -0.008866773, 0.5439169, 0, 0.827451, 1, 1,
0.05631654, -1.211547, 2.69587, 0, 0.8196079, 1, 1,
0.06047135, -0.856925, 2.96919, 0, 0.8156863, 1, 1,
0.06218781, -0.1777011, 4.633727, 0, 0.8078431, 1, 1,
0.06400248, 0.1852727, -0.6832718, 0, 0.8039216, 1, 1,
0.06657472, 0.5533568, 1.414137, 0, 0.7960784, 1, 1,
0.07177847, 0.01241277, -0.1831237, 0, 0.7882353, 1, 1,
0.07444248, 0.3096675, 0.8806784, 0, 0.7843137, 1, 1,
0.08494885, -0.09237159, 3.874923, 0, 0.7764706, 1, 1,
0.08761003, 0.3035916, -0.4967971, 0, 0.772549, 1, 1,
0.0877924, -1.191357, 1.33671, 0, 0.7647059, 1, 1,
0.08801144, -0.1135013, 1.17083, 0, 0.7607843, 1, 1,
0.09030402, 1.398479, 0.2408036, 0, 0.7529412, 1, 1,
0.09595673, -0.3190294, 3.118824, 0, 0.7490196, 1, 1,
0.09724942, -0.5975404, 2.689342, 0, 0.7411765, 1, 1,
0.09920704, 1.247325, -2.086655, 0, 0.7372549, 1, 1,
0.1029169, 0.05142663, 2.02851, 0, 0.7294118, 1, 1,
0.1092326, -1.408415, 4.263938, 0, 0.7254902, 1, 1,
0.1107138, -0.3479454, 1.481217, 0, 0.7176471, 1, 1,
0.1142415, 1.213189, -0.8804438, 0, 0.7137255, 1, 1,
0.1231096, 0.6321673, -1.314061, 0, 0.7058824, 1, 1,
0.1251177, -0.04380503, 2.35409, 0, 0.6980392, 1, 1,
0.1305076, -1.434849, 3.387367, 0, 0.6941177, 1, 1,
0.1309998, 0.4032831, 2.100563, 0, 0.6862745, 1, 1,
0.1313152, 0.1651092, -1.628186, 0, 0.682353, 1, 1,
0.1317063, 0.275878, 0.9921687, 0, 0.6745098, 1, 1,
0.132857, -0.4519992, 1.746693, 0, 0.6705883, 1, 1,
0.1345685, -0.6706891, 3.84798, 0, 0.6627451, 1, 1,
0.135685, -0.06213374, 1.490369, 0, 0.6588235, 1, 1,
0.1389076, -1.177713, 3.779806, 0, 0.6509804, 1, 1,
0.1421515, -0.343439, 2.748372, 0, 0.6470588, 1, 1,
0.1472881, -0.3952773, 1.989818, 0, 0.6392157, 1, 1,
0.147947, -0.689535, 2.675452, 0, 0.6352941, 1, 1,
0.1501762, 0.6191379, 1.853334, 0, 0.627451, 1, 1,
0.1566862, 1.135124, -0.8916892, 0, 0.6235294, 1, 1,
0.1639098, -2.36403, 2.820259, 0, 0.6156863, 1, 1,
0.1674494, 0.9403321, -0.1320023, 0, 0.6117647, 1, 1,
0.1674671, 0.9598552, 1.440461, 0, 0.6039216, 1, 1,
0.1686578, -1.415519, 2.811502, 0, 0.5960785, 1, 1,
0.1704533, -0.1330054, 1.079363, 0, 0.5921569, 1, 1,
0.172369, -1.633228, 3.486365, 0, 0.5843138, 1, 1,
0.1761245, 0.3349128, 0.1799335, 0, 0.5803922, 1, 1,
0.1827978, 0.6796454, 0.3846107, 0, 0.572549, 1, 1,
0.1834693, -1.283027, 2.897425, 0, 0.5686275, 1, 1,
0.1837422, -0.4643344, 2.428663, 0, 0.5607843, 1, 1,
0.1852858, -1.740785, 2.477642, 0, 0.5568628, 1, 1,
0.1872073, -0.2181661, 3.340532, 0, 0.5490196, 1, 1,
0.1882577, -1.240752, 3.388924, 0, 0.5450981, 1, 1,
0.1900427, 0.3731582, -0.255452, 0, 0.5372549, 1, 1,
0.1915883, 0.4173215, 0.4714155, 0, 0.5333334, 1, 1,
0.1918096, -1.302368, 4.023067, 0, 0.5254902, 1, 1,
0.1921294, 0.2620942, -0.7112942, 0, 0.5215687, 1, 1,
0.1988006, -0.5100709, 4.532729, 0, 0.5137255, 1, 1,
0.2007638, 1.724092, 1.458346, 0, 0.509804, 1, 1,
0.2017033, 0.1164748, 1.614014, 0, 0.5019608, 1, 1,
0.2047391, -1.332234, 3.980357, 0, 0.4941176, 1, 1,
0.208313, 0.5752881, 0.91113, 0, 0.4901961, 1, 1,
0.2096356, -1.263556, 3.67985, 0, 0.4823529, 1, 1,
0.2098438, -1.128125, 1.682358, 0, 0.4784314, 1, 1,
0.2098721, 0.4833357, 1.699927, 0, 0.4705882, 1, 1,
0.2106561, -0.9993041, 3.440326, 0, 0.4666667, 1, 1,
0.2131801, -0.2401732, 2.231226, 0, 0.4588235, 1, 1,
0.2140159, -0.2214667, 2.752829, 0, 0.454902, 1, 1,
0.214475, -0.3199691, 4.155877, 0, 0.4470588, 1, 1,
0.2164228, -0.7359725, 4.911546, 0, 0.4431373, 1, 1,
0.2167923, -0.3997343, 1.214537, 0, 0.4352941, 1, 1,
0.2168536, 0.9610021, 0.4229672, 0, 0.4313726, 1, 1,
0.219251, -0.536172, 2.780561, 0, 0.4235294, 1, 1,
0.2198241, -0.09167651, 1.510503, 0, 0.4196078, 1, 1,
0.2245841, 1.775175, 0.2070907, 0, 0.4117647, 1, 1,
0.2259929, -1.461962, 3.394369, 0, 0.4078431, 1, 1,
0.2273612, 1.833895, -0.09010584, 0, 0.4, 1, 1,
0.2306575, -0.5691476, 1.36758, 0, 0.3921569, 1, 1,
0.2356398, -0.6926979, 3.374556, 0, 0.3882353, 1, 1,
0.2364277, 2.874086, -1.849395, 0, 0.3803922, 1, 1,
0.2403382, -1.091027, 2.086669, 0, 0.3764706, 1, 1,
0.2450607, -0.3594592, 2.253456, 0, 0.3686275, 1, 1,
0.2454018, -0.7287924, 1.727538, 0, 0.3647059, 1, 1,
0.2462051, 0.3785641, 1.203224, 0, 0.3568628, 1, 1,
0.2507656, -1.620638, 3.097313, 0, 0.3529412, 1, 1,
0.2546374, 1.827532, 0.7787664, 0, 0.345098, 1, 1,
0.2548036, 1.720222, 1.139942, 0, 0.3411765, 1, 1,
0.2552469, -0.9807857, 4.009892, 0, 0.3333333, 1, 1,
0.2579324, -0.9398352, 2.13375, 0, 0.3294118, 1, 1,
0.258877, 0.4683473, -1.093652, 0, 0.3215686, 1, 1,
0.2659278, -0.956839, 2.50781, 0, 0.3176471, 1, 1,
0.266346, 0.3714067, 1.780998, 0, 0.3098039, 1, 1,
0.2673379, 1.859395, 0.6172597, 0, 0.3058824, 1, 1,
0.2696646, -0.2291541, 2.304649, 0, 0.2980392, 1, 1,
0.2701203, 0.2956316, 1.09481, 0, 0.2901961, 1, 1,
0.2723691, -0.2117261, 0.8503459, 0, 0.2862745, 1, 1,
0.2737966, -2.266693, 3.975421, 0, 0.2784314, 1, 1,
0.2763662, 0.9274939, -0.5577201, 0, 0.2745098, 1, 1,
0.2781153, -0.1274676, 2.524148, 0, 0.2666667, 1, 1,
0.2802886, -1.090521, 0.7048994, 0, 0.2627451, 1, 1,
0.2819955, 0.8155182, 2.849728, 0, 0.254902, 1, 1,
0.2839472, 1.006317, 1.306909, 0, 0.2509804, 1, 1,
0.2942782, 0.1585198, -0.2923522, 0, 0.2431373, 1, 1,
0.2968685, -1.563583, 2.815818, 0, 0.2392157, 1, 1,
0.2988418, 0.8449341, 1.25547, 0, 0.2313726, 1, 1,
0.300317, 0.7084801, 0.987781, 0, 0.227451, 1, 1,
0.3009213, 0.1156264, -0.07847841, 0, 0.2196078, 1, 1,
0.3020335, -0.08692656, 3.893312, 0, 0.2156863, 1, 1,
0.3046985, -0.1140509, 4.08852, 0, 0.2078431, 1, 1,
0.3091469, -1.025466, 1.961564, 0, 0.2039216, 1, 1,
0.3109435, -2.695379, 4.85589, 0, 0.1960784, 1, 1,
0.3168229, 1.149684, -1.052377, 0, 0.1882353, 1, 1,
0.3170851, 1.451576, -1.251696, 0, 0.1843137, 1, 1,
0.3221906, -1.739573, 2.427316, 0, 0.1764706, 1, 1,
0.3276622, 0.09113657, 2.294665, 0, 0.172549, 1, 1,
0.3397172, 0.3469399, 1.557322, 0, 0.1647059, 1, 1,
0.3418455, 1.104589, -0.07883316, 0, 0.1607843, 1, 1,
0.3423932, 0.9291924, -0.2589934, 0, 0.1529412, 1, 1,
0.3503173, 0.5225584, 1.475624, 0, 0.1490196, 1, 1,
0.354005, 1.833471, -0.8649086, 0, 0.1411765, 1, 1,
0.3545783, -0.1996361, 1.591386, 0, 0.1372549, 1, 1,
0.3577179, 0.4650501, 0.0712263, 0, 0.1294118, 1, 1,
0.3578286, -0.5756829, 3.85625, 0, 0.1254902, 1, 1,
0.359472, 0.1718243, 1.077169, 0, 0.1176471, 1, 1,
0.3617345, -0.1769277, 2.418983, 0, 0.1137255, 1, 1,
0.3688816, -0.5001061, 2.128324, 0, 0.1058824, 1, 1,
0.3733904, -0.1431548, 1.607139, 0, 0.09803922, 1, 1,
0.3745676, -0.5968454, 2.77128, 0, 0.09411765, 1, 1,
0.3755526, 0.9625317, 1.315484, 0, 0.08627451, 1, 1,
0.3770645, -1.841216, 2.985177, 0, 0.08235294, 1, 1,
0.3833939, -1.18854, 3.160203, 0, 0.07450981, 1, 1,
0.3848969, -0.2596045, 2.571628, 0, 0.07058824, 1, 1,
0.3863279, -1.910369, 4.651693, 0, 0.0627451, 1, 1,
0.3868464, -0.4498467, 4.426007, 0, 0.05882353, 1, 1,
0.3880667, -1.39664, 2.195626, 0, 0.05098039, 1, 1,
0.3962324, 0.9118184, 0.1715006, 0, 0.04705882, 1, 1,
0.3977631, -0.2135947, 2.743114, 0, 0.03921569, 1, 1,
0.3984305, 0.6502832, -1.364333, 0, 0.03529412, 1, 1,
0.3985046, -1.423972, 2.708629, 0, 0.02745098, 1, 1,
0.4003523, 2.045042, 0.4384674, 0, 0.02352941, 1, 1,
0.40087, 1.648506, 0.4919739, 0, 0.01568628, 1, 1,
0.4017543, -0.1417351, 0.2374755, 0, 0.01176471, 1, 1,
0.4041609, -0.4554316, 1.385736, 0, 0.003921569, 1, 1,
0.404498, -0.4468024, 2.244253, 0.003921569, 0, 1, 1,
0.4118699, 1.66795, 1.163165, 0.007843138, 0, 1, 1,
0.4126982, 2.203898, -0.1056109, 0.01568628, 0, 1, 1,
0.4153203, 0.2801381, 1.820429, 0.01960784, 0, 1, 1,
0.417973, -0.1751056, 1.749688, 0.02745098, 0, 1, 1,
0.4189528, 0.9227487, 0.5622753, 0.03137255, 0, 1, 1,
0.4266171, 0.6455873, -0.2995851, 0.03921569, 0, 1, 1,
0.4303044, 0.2458922, -0.2551018, 0.04313726, 0, 1, 1,
0.4305381, 2.181545, 0.5586932, 0.05098039, 0, 1, 1,
0.4374178, -0.3622213, 2.993262, 0.05490196, 0, 1, 1,
0.4431276, -0.3292981, 1.609514, 0.0627451, 0, 1, 1,
0.4453745, 0.6231774, -1.23024, 0.06666667, 0, 1, 1,
0.4482114, -0.221197, 3.166497, 0.07450981, 0, 1, 1,
0.4487743, -0.4090858, 1.453095, 0.07843138, 0, 1, 1,
0.4491846, -1.88427, 2.502717, 0.08627451, 0, 1, 1,
0.4510209, 0.3707758, 0.08450704, 0.09019608, 0, 1, 1,
0.454671, 0.2134382, 1.45027, 0.09803922, 0, 1, 1,
0.456775, 0.1305426, -0.4488991, 0.1058824, 0, 1, 1,
0.4582434, 2.418043, 0.829549, 0.1098039, 0, 1, 1,
0.4591473, 0.8889505, -0.1667752, 0.1176471, 0, 1, 1,
0.4592997, 0.0186754, 2.566043, 0.1215686, 0, 1, 1,
0.463636, -0.4650272, 1.841304, 0.1294118, 0, 1, 1,
0.4679173, -0.7834423, 2.498923, 0.1333333, 0, 1, 1,
0.4690714, -1.141527, 1.545978, 0.1411765, 0, 1, 1,
0.4707987, -1.10875, 3.334834, 0.145098, 0, 1, 1,
0.4835072, -0.1413736, 0.7555264, 0.1529412, 0, 1, 1,
0.4908639, -1.862658, 3.860472, 0.1568628, 0, 1, 1,
0.4919606, -0.7888321, 1.648058, 0.1647059, 0, 1, 1,
0.4926291, -0.1639002, 1.213888, 0.1686275, 0, 1, 1,
0.4931734, 1.112479, -1.583974, 0.1764706, 0, 1, 1,
0.4933409, 1.037684, 1.590506, 0.1803922, 0, 1, 1,
0.4948058, -0.9716757, 2.799073, 0.1882353, 0, 1, 1,
0.4997442, -2.085726, 2.224757, 0.1921569, 0, 1, 1,
0.50144, -0.9126679, 3.165232, 0.2, 0, 1, 1,
0.5033769, -0.05854916, 0.1963774, 0.2078431, 0, 1, 1,
0.5043822, 2.094597, 0.4309336, 0.2117647, 0, 1, 1,
0.507282, -0.8000702, 2.287794, 0.2196078, 0, 1, 1,
0.5080264, 0.875097, 1.405891, 0.2235294, 0, 1, 1,
0.5081703, -0.08446198, 1.536997, 0.2313726, 0, 1, 1,
0.5096546, -0.7028275, 2.1514, 0.2352941, 0, 1, 1,
0.5143729, -0.09355819, 1.041227, 0.2431373, 0, 1, 1,
0.5149383, -0.8427443, 2.6062, 0.2470588, 0, 1, 1,
0.5223088, 0.7562234, 0.4518054, 0.254902, 0, 1, 1,
0.524901, 0.8784763, 0.6702858, 0.2588235, 0, 1, 1,
0.5279279, 0.2885103, 3.403622, 0.2666667, 0, 1, 1,
0.5283496, -1.386555, 2.187307, 0.2705882, 0, 1, 1,
0.5293463, -0.3135043, 3.269798, 0.2784314, 0, 1, 1,
0.5316713, -1.225983, 4.726781, 0.282353, 0, 1, 1,
0.532747, 0.1571064, 1.226855, 0.2901961, 0, 1, 1,
0.5334535, 1.190915, 0.3814385, 0.2941177, 0, 1, 1,
0.5346558, 0.6095456, -0.2296639, 0.3019608, 0, 1, 1,
0.5358692, 0.8582361, 1.67419, 0.3098039, 0, 1, 1,
0.5369906, 1.513913, -0.1067803, 0.3137255, 0, 1, 1,
0.5384173, 0.02793605, 2.826608, 0.3215686, 0, 1, 1,
0.5419402, -1.674351, 1.838769, 0.3254902, 0, 1, 1,
0.5424798, -0.02525358, 1.845028, 0.3333333, 0, 1, 1,
0.5438175, 0.1744404, 3.536703, 0.3372549, 0, 1, 1,
0.5502789, -0.5728953, 2.381769, 0.345098, 0, 1, 1,
0.5532043, 0.006077032, 1.168189, 0.3490196, 0, 1, 1,
0.5538765, 0.9466565, 1.468882, 0.3568628, 0, 1, 1,
0.5548094, 0.05404304, 0.8479397, 0.3607843, 0, 1, 1,
0.5595279, -0.2547946, 2.518312, 0.3686275, 0, 1, 1,
0.5703303, 1.039488, 1.587186, 0.372549, 0, 1, 1,
0.5715767, -0.06280207, 0.8476875, 0.3803922, 0, 1, 1,
0.5844988, -0.3155858, 2.356194, 0.3843137, 0, 1, 1,
0.5854421, 0.8413522, 0.447905, 0.3921569, 0, 1, 1,
0.5863841, 0.773201, 2.005579, 0.3960784, 0, 1, 1,
0.5881709, -0.0005567102, 3.139874, 0.4039216, 0, 1, 1,
0.5896068, 0.8000668, -1.814343, 0.4117647, 0, 1, 1,
0.5948346, -0.8433855, 3.618466, 0.4156863, 0, 1, 1,
0.6052082, 0.9165184, 0.897078, 0.4235294, 0, 1, 1,
0.60541, -0.03423511, 4.75229, 0.427451, 0, 1, 1,
0.6090448, 0.5954251, 2.842178, 0.4352941, 0, 1, 1,
0.6106482, 0.8661171, 1.863728, 0.4392157, 0, 1, 1,
0.6136022, 0.08148994, 1.773593, 0.4470588, 0, 1, 1,
0.6139011, -3.478591, 4.508337, 0.4509804, 0, 1, 1,
0.6145861, -0.6225196, 0.2248084, 0.4588235, 0, 1, 1,
0.6177652, -0.4918335, 2.068356, 0.4627451, 0, 1, 1,
0.6289022, -1.402183, 3.383943, 0.4705882, 0, 1, 1,
0.6294093, 0.04198982, 1.421076, 0.4745098, 0, 1, 1,
0.6300489, 0.9308972, -0.7527991, 0.4823529, 0, 1, 1,
0.631476, 0.2436523, 0.7946837, 0.4862745, 0, 1, 1,
0.634472, -0.6654339, 2.75741, 0.4941176, 0, 1, 1,
0.6464971, 1.276781, 0.7189777, 0.5019608, 0, 1, 1,
0.6500053, -1.109509, 3.842083, 0.5058824, 0, 1, 1,
0.6507017, 0.5321151, 1.040692, 0.5137255, 0, 1, 1,
0.6512086, 0.1706866, 0.5352642, 0.5176471, 0, 1, 1,
0.6580086, -0.9446836, 0.6455399, 0.5254902, 0, 1, 1,
0.6598619, 1.364389, 1.47037, 0.5294118, 0, 1, 1,
0.6609157, -1.647399, 3.320881, 0.5372549, 0, 1, 1,
0.6641905, 1.630182, 2.844378, 0.5411765, 0, 1, 1,
0.6669565, 0.6613227, 2.711941, 0.5490196, 0, 1, 1,
0.6670797, 2.074201, 1.000962, 0.5529412, 0, 1, 1,
0.6708698, 1.335625, 0.9899894, 0.5607843, 0, 1, 1,
0.6759056, 0.4929416, -0.1151705, 0.5647059, 0, 1, 1,
0.6776225, 1.404125, 1.178576, 0.572549, 0, 1, 1,
0.680128, -0.5278345, 2.052984, 0.5764706, 0, 1, 1,
0.683887, 0.472645, 1.488199, 0.5843138, 0, 1, 1,
0.691767, -0.9125897, 3.381871, 0.5882353, 0, 1, 1,
0.7002591, 0.3684599, 0.8442515, 0.5960785, 0, 1, 1,
0.7033009, -0.3990563, 2.411143, 0.6039216, 0, 1, 1,
0.7099243, 0.7167827, 0.4475682, 0.6078432, 0, 1, 1,
0.7224024, 2.578762, 0.9780846, 0.6156863, 0, 1, 1,
0.7236168, 1.162531, -0.5586849, 0.6196079, 0, 1, 1,
0.7249025, 0.3203141, 1.070381, 0.627451, 0, 1, 1,
0.7249062, 0.8647771, 2.8559, 0.6313726, 0, 1, 1,
0.7304284, -0.4203497, 2.914446, 0.6392157, 0, 1, 1,
0.7337216, -0.8644283, 3.488645, 0.6431373, 0, 1, 1,
0.7436233, 0.552177, 1.549161, 0.6509804, 0, 1, 1,
0.7478672, -0.6244356, 3.062877, 0.654902, 0, 1, 1,
0.748287, -0.9634048, 4.792372, 0.6627451, 0, 1, 1,
0.7495042, -1.077849, 2.067697, 0.6666667, 0, 1, 1,
0.7567629, 2.883118, -0.3879207, 0.6745098, 0, 1, 1,
0.7592154, -1.818876, 2.369471, 0.6784314, 0, 1, 1,
0.7608632, 1.297877, -0.866504, 0.6862745, 0, 1, 1,
0.7625309, 0.2336179, 1.424027, 0.6901961, 0, 1, 1,
0.7649258, -0.641191, 1.375097, 0.6980392, 0, 1, 1,
0.7681122, -0.1833076, 2.392977, 0.7058824, 0, 1, 1,
0.7684007, 0.005363631, 1.099756, 0.7098039, 0, 1, 1,
0.7733397, -1.880733, 3.277416, 0.7176471, 0, 1, 1,
0.7781699, -0.6122793, 2.503376, 0.7215686, 0, 1, 1,
0.7858627, 1.993374, 0.9294092, 0.7294118, 0, 1, 1,
0.7952813, -0.7349198, 1.16819, 0.7333333, 0, 1, 1,
0.7971826, 0.7116413, 1.365471, 0.7411765, 0, 1, 1,
0.8056756, 1.014349, 1.494048, 0.7450981, 0, 1, 1,
0.8126175, -0.1010268, 3.090713, 0.7529412, 0, 1, 1,
0.8184196, -0.01372803, 1.728995, 0.7568628, 0, 1, 1,
0.8212954, 0.7298697, -1.273487, 0.7647059, 0, 1, 1,
0.8222747, 1.408656, -0.4882832, 0.7686275, 0, 1, 1,
0.8255382, -0.5051503, 1.431884, 0.7764706, 0, 1, 1,
0.8293303, -0.9829017, 1.065633, 0.7803922, 0, 1, 1,
0.8304189, -0.3876216, 2.864711, 0.7882353, 0, 1, 1,
0.8366075, -0.6424566, 1.715463, 0.7921569, 0, 1, 1,
0.8426806, -1.240245, 3.247029, 0.8, 0, 1, 1,
0.844046, -1.690474, 4.824182, 0.8078431, 0, 1, 1,
0.8496847, 0.08408254, 2.263264, 0.8117647, 0, 1, 1,
0.849717, 0.8344523, 3.304695, 0.8196079, 0, 1, 1,
0.849897, 0.02072491, 0.4673464, 0.8235294, 0, 1, 1,
0.8508949, 0.8634918, 0.7018427, 0.8313726, 0, 1, 1,
0.8523351, 0.7236639, 0.5807751, 0.8352941, 0, 1, 1,
0.8660941, 0.4485554, 0.6720999, 0.8431373, 0, 1, 1,
0.8678741, -0.7096108, 1.894953, 0.8470588, 0, 1, 1,
0.8694939, 0.3202041, 1.727776, 0.854902, 0, 1, 1,
0.8710802, -1.443451, 4.451761, 0.8588235, 0, 1, 1,
0.8762848, -0.2816435, 3.088658, 0.8666667, 0, 1, 1,
0.8789165, -0.3441909, 2.58655, 0.8705882, 0, 1, 1,
0.8794479, 1.788124, -1.930228, 0.8784314, 0, 1, 1,
0.8960837, 1.051871, 1.123314, 0.8823529, 0, 1, 1,
0.9026106, 0.4048128, 0.2098202, 0.8901961, 0, 1, 1,
0.9036882, -0.2062882, 3.206977, 0.8941177, 0, 1, 1,
0.9071388, 0.9640252, -2.04435, 0.9019608, 0, 1, 1,
0.9114034, -0.6160824, 3.311842, 0.9098039, 0, 1, 1,
0.9124515, 0.7640892, 2.348244, 0.9137255, 0, 1, 1,
0.9299163, 0.4142689, 1.36694, 0.9215686, 0, 1, 1,
0.9412423, -0.2504739, 0.7193506, 0.9254902, 0, 1, 1,
0.9446958, 0.6491901, 1.15007, 0.9333333, 0, 1, 1,
0.9448694, -1.713535, 1.928289, 0.9372549, 0, 1, 1,
0.9547263, -0.3578533, 2.727956, 0.945098, 0, 1, 1,
0.9578885, 0.4684807, 1.007143, 0.9490196, 0, 1, 1,
0.9649267, -0.8408153, 1.360101, 0.9568627, 0, 1, 1,
0.9658419, -1.046928, 2.962705, 0.9607843, 0, 1, 1,
0.9703352, -0.2753958, 1.914116, 0.9686275, 0, 1, 1,
0.9714267, 0.2787175, 1.553325, 0.972549, 0, 1, 1,
0.9751916, -0.5599815, 3.164167, 0.9803922, 0, 1, 1,
0.9780882, 1.020682, 1.140255, 0.9843137, 0, 1, 1,
0.9883837, 1.862349, 0.5683607, 0.9921569, 0, 1, 1,
1.000711, -0.8030457, 4.142529, 0.9960784, 0, 1, 1,
1.007643, 2.307499, 0.8030387, 1, 0, 0.9960784, 1,
1.010146, 0.796541, 0.4676434, 1, 0, 0.9882353, 1,
1.011499, 0.4620437, 1.739547, 1, 0, 0.9843137, 1,
1.013958, -1.077715, 3.627515, 1, 0, 0.9764706, 1,
1.017512, -0.05290163, 1.659523, 1, 0, 0.972549, 1,
1.020251, 0.08776794, 1.135264, 1, 0, 0.9647059, 1,
1.021734, -0.7236632, 2.001019, 1, 0, 0.9607843, 1,
1.021818, -0.2449303, 3.721399, 1, 0, 0.9529412, 1,
1.023133, -0.2437014, 0.5405582, 1, 0, 0.9490196, 1,
1.028265, 0.4195508, 1.296261, 1, 0, 0.9411765, 1,
1.029937, -0.3280689, 3.784497, 1, 0, 0.9372549, 1,
1.03446, -0.8732515, 1.324266, 1, 0, 0.9294118, 1,
1.041649, -0.002576901, 1.677974, 1, 0, 0.9254902, 1,
1.044194, -1.796534, 0.10315, 1, 0, 0.9176471, 1,
1.045845, 0.1994444, 0.2535232, 1, 0, 0.9137255, 1,
1.046792, -0.09482098, 1.305235, 1, 0, 0.9058824, 1,
1.047741, -0.6655487, 2.551667, 1, 0, 0.9019608, 1,
1.055724, 1.730574, -0.08024845, 1, 0, 0.8941177, 1,
1.056042, -0.7209751, 3.253287, 1, 0, 0.8862745, 1,
1.062269, 0.08360044, 0.9665876, 1, 0, 0.8823529, 1,
1.062928, -1.2753, 2.587216, 1, 0, 0.8745098, 1,
1.069035, -1.551132, 1.585536, 1, 0, 0.8705882, 1,
1.084799, 1.851409, 1.950554, 1, 0, 0.8627451, 1,
1.086433, -2.148371, 2.531695, 1, 0, 0.8588235, 1,
1.0868, -0.3269726, 1.394744, 1, 0, 0.8509804, 1,
1.097549, 0.6496245, 1.778098, 1, 0, 0.8470588, 1,
1.104731, -0.912757, 2.601607, 1, 0, 0.8392157, 1,
1.117829, -0.09434477, 1.056487, 1, 0, 0.8352941, 1,
1.118484, -2.071187, 3.806256, 1, 0, 0.827451, 1,
1.124831, 2.65641, 0.8874359, 1, 0, 0.8235294, 1,
1.136961, 1.821868, -0.2907602, 1, 0, 0.8156863, 1,
1.141424, -1.898725, 2.22656, 1, 0, 0.8117647, 1,
1.149576, -0.2719084, 2.616101, 1, 0, 0.8039216, 1,
1.151936, -1.171244, 2.704336, 1, 0, 0.7960784, 1,
1.154586, 0.3739868, 1.989766, 1, 0, 0.7921569, 1,
1.158121, 0.300106, 1.619074, 1, 0, 0.7843137, 1,
1.169436, -0.7675682, 1.01225, 1, 0, 0.7803922, 1,
1.171168, -1.218557, 0.9765531, 1, 0, 0.772549, 1,
1.175808, 1.581009, 1.651683, 1, 0, 0.7686275, 1,
1.181942, -1.350296, 2.870142, 1, 0, 0.7607843, 1,
1.184049, 1.391521, -0.7511285, 1, 0, 0.7568628, 1,
1.196452, -0.7771468, 0.1841949, 1, 0, 0.7490196, 1,
1.198528, -1.236902, 2.099706, 1, 0, 0.7450981, 1,
1.20345, 0.02102572, 0.870608, 1, 0, 0.7372549, 1,
1.210234, -0.1706348, 2.165501, 1, 0, 0.7333333, 1,
1.213692, 0.5176541, 1.736049, 1, 0, 0.7254902, 1,
1.215206, 0.2405482, -0.0761044, 1, 0, 0.7215686, 1,
1.230013, 0.07886382, 2.687099, 1, 0, 0.7137255, 1,
1.234107, 0.381864, 2.507186, 1, 0, 0.7098039, 1,
1.238884, -0.5430655, 2.29192, 1, 0, 0.7019608, 1,
1.240218, 0.6209465, 1.043701, 1, 0, 0.6941177, 1,
1.240573, -1.560786, 3.812606, 1, 0, 0.6901961, 1,
1.243688, 1.165192, 1.000699, 1, 0, 0.682353, 1,
1.245517, -0.5166647, 1.044915, 1, 0, 0.6784314, 1,
1.252885, -1.908925, 2.749922, 1, 0, 0.6705883, 1,
1.256817, 0.1550447, 2.470265, 1, 0, 0.6666667, 1,
1.26311, -0.3929325, 1.491179, 1, 0, 0.6588235, 1,
1.265615, 0.03145483, 2.742185, 1, 0, 0.654902, 1,
1.266531, -0.3786969, 1.395484, 1, 0, 0.6470588, 1,
1.268652, 0.7689291, 1.46424, 1, 0, 0.6431373, 1,
1.279852, 0.7348596, 0.2321896, 1, 0, 0.6352941, 1,
1.281618, -0.9070441, 0.7218551, 1, 0, 0.6313726, 1,
1.284808, 1.299092, 2.592093, 1, 0, 0.6235294, 1,
1.290794, 0.2283767, 1.38456, 1, 0, 0.6196079, 1,
1.292727, 0.261754, 1.645453, 1, 0, 0.6117647, 1,
1.301336, 0.5967575, 1.190392, 1, 0, 0.6078432, 1,
1.303245, -1.221626, 3.462816, 1, 0, 0.6, 1,
1.304034, 0.9183324, 0.1227786, 1, 0, 0.5921569, 1,
1.304989, 1.376435, -0.8970534, 1, 0, 0.5882353, 1,
1.307537, 0.3248591, 1.715026, 1, 0, 0.5803922, 1,
1.309199, 1.299308, 2.313836, 1, 0, 0.5764706, 1,
1.316539, -0.1722709, 3.582315, 1, 0, 0.5686275, 1,
1.329339, -2.075876, 4.128824, 1, 0, 0.5647059, 1,
1.346844, 0.4372385, 0.5608706, 1, 0, 0.5568628, 1,
1.357495, -1.555388, 3.27706, 1, 0, 0.5529412, 1,
1.360512, -2.019235, 2.621826, 1, 0, 0.5450981, 1,
1.365244, 1.000674, 0.6350499, 1, 0, 0.5411765, 1,
1.37318, -1.071776, 1.38722, 1, 0, 0.5333334, 1,
1.381297, -0.328562, 2.034916, 1, 0, 0.5294118, 1,
1.38945, -0.4701129, 0.8717765, 1, 0, 0.5215687, 1,
1.41965, 0.4534549, -0.6545727, 1, 0, 0.5176471, 1,
1.420016, 0.5964437, 3.02939, 1, 0, 0.509804, 1,
1.422747, 0.8565575, -0.2523945, 1, 0, 0.5058824, 1,
1.428152, -0.7998413, 0.925712, 1, 0, 0.4980392, 1,
1.434276, -1.104766, 2.823454, 1, 0, 0.4901961, 1,
1.436542, -0.5881819, 1.905663, 1, 0, 0.4862745, 1,
1.439808, 0.8120397, 3.1067, 1, 0, 0.4784314, 1,
1.43998, -0.0190032, 1.287328, 1, 0, 0.4745098, 1,
1.444101, -0.1913794, 1.721327, 1, 0, 0.4666667, 1,
1.446975, -0.2591166, 2.331343, 1, 0, 0.4627451, 1,
1.455733, -0.8228145, 1.554993, 1, 0, 0.454902, 1,
1.459491, -0.4036644, 1.310367, 1, 0, 0.4509804, 1,
1.460463, -0.6882004, 1.488301, 1, 0, 0.4431373, 1,
1.485092, 2.213584, 0.2453311, 1, 0, 0.4392157, 1,
1.515389, 0.6522485, 0.6296515, 1, 0, 0.4313726, 1,
1.517007, -0.4601624, 1.288376, 1, 0, 0.427451, 1,
1.518373, -1.950555, 2.394302, 1, 0, 0.4196078, 1,
1.531007, -1.08829, 1.332155, 1, 0, 0.4156863, 1,
1.531854, -0.4066892, 1.837196, 1, 0, 0.4078431, 1,
1.539922, 0.6626414, 1.424375, 1, 0, 0.4039216, 1,
1.540479, 0.1590659, 2.523701, 1, 0, 0.3960784, 1,
1.544097, 0.3984698, 1.548698, 1, 0, 0.3882353, 1,
1.549871, -0.05428218, 3.842446, 1, 0, 0.3843137, 1,
1.554158, 0.9385606, -0.09039875, 1, 0, 0.3764706, 1,
1.563587, -0.7435595, 0.949387, 1, 0, 0.372549, 1,
1.566263, -1.04605, 1.942816, 1, 0, 0.3647059, 1,
1.587803, 0.6651158, 0.6265053, 1, 0, 0.3607843, 1,
1.596283, 0.7221708, 0.3963022, 1, 0, 0.3529412, 1,
1.626692, -0.5758715, 1.013374, 1, 0, 0.3490196, 1,
1.626899, -1.045996, 3.391659, 1, 0, 0.3411765, 1,
1.629218, -0.5560717, 2.517728, 1, 0, 0.3372549, 1,
1.630025, 0.5377461, 0.2947214, 1, 0, 0.3294118, 1,
1.632727, -1.14596, 2.155838, 1, 0, 0.3254902, 1,
1.635733, 0.2918615, 1.016776, 1, 0, 0.3176471, 1,
1.651437, -0.8290874, 2.158413, 1, 0, 0.3137255, 1,
1.656413, -0.8481244, 2.618407, 1, 0, 0.3058824, 1,
1.687203, 1.420638, 1.476502, 1, 0, 0.2980392, 1,
1.702026, 0.4959541, 2.957991, 1, 0, 0.2941177, 1,
1.711533, -0.3862918, 1.479341, 1, 0, 0.2862745, 1,
1.730977, -0.9997406, 3.472494, 1, 0, 0.282353, 1,
1.732357, 0.6347821, -1.34368, 1, 0, 0.2745098, 1,
1.737368, -0.6446308, 1.050792, 1, 0, 0.2705882, 1,
1.753885, -1.373376, 1.15979, 1, 0, 0.2627451, 1,
1.76362, -0.3173483, 4.92166, 1, 0, 0.2588235, 1,
1.77003, -0.1385344, 1.509518, 1, 0, 0.2509804, 1,
1.791613, -0.2617952, 2.987757, 1, 0, 0.2470588, 1,
1.794031, 0.01741689, 1.288877, 1, 0, 0.2392157, 1,
1.798486, -0.9573604, 0.7492416, 1, 0, 0.2352941, 1,
1.805533, -1.265382, 1.893706, 1, 0, 0.227451, 1,
1.806062, -0.3930154, 1.152697, 1, 0, 0.2235294, 1,
1.81146, -0.3744646, 0.7984024, 1, 0, 0.2156863, 1,
1.83466, -0.2095488, 1.510209, 1, 0, 0.2117647, 1,
1.850808, -0.02627536, -0.1949119, 1, 0, 0.2039216, 1,
1.864443, 2.058654, -0.3088633, 1, 0, 0.1960784, 1,
1.894177, -0.5758519, 2.879627, 1, 0, 0.1921569, 1,
1.909226, 0.2351316, -1.007572, 1, 0, 0.1843137, 1,
1.909351, -0.2780755, 3.675867, 1, 0, 0.1803922, 1,
1.920625, 2.97805, 1.936121, 1, 0, 0.172549, 1,
1.936604, 0.6997965, 0.8502437, 1, 0, 0.1686275, 1,
1.965342, 0.2180286, 2.77247, 1, 0, 0.1607843, 1,
1.973089, -1.813278, 2.233694, 1, 0, 0.1568628, 1,
2.029525, 1.406349, 2.060529, 1, 0, 0.1490196, 1,
2.05186, 0.2283384, 2.868084, 1, 0, 0.145098, 1,
2.053282, 2.101609, -0.391822, 1, 0, 0.1372549, 1,
2.061344, 1.227419, 1.359016, 1, 0, 0.1333333, 1,
2.1216, 1.86884, 0.3242475, 1, 0, 0.1254902, 1,
2.125893, 2.236808, -0.114903, 1, 0, 0.1215686, 1,
2.129281, 0.5574323, 0.7046005, 1, 0, 0.1137255, 1,
2.146175, -0.1012317, 2.645709, 1, 0, 0.1098039, 1,
2.157708, -1.013023, 2.22005, 1, 0, 0.1019608, 1,
2.173343, 1.647375, -0.4423807, 1, 0, 0.09411765, 1,
2.186569, 0.07958128, 1.121769, 1, 0, 0.09019608, 1,
2.263831, -0.07408124, 1.878698, 1, 0, 0.08235294, 1,
2.263858, 1.419683, 1.093845, 1, 0, 0.07843138, 1,
2.37212, -0.08409527, 2.396182, 1, 0, 0.07058824, 1,
2.382616, -2.1034, 3.583824, 1, 0, 0.06666667, 1,
2.403679, 1.185256, 0.7392641, 1, 0, 0.05882353, 1,
2.426512, -2.202725, 2.960789, 1, 0, 0.05490196, 1,
2.437618, -0.3200699, 2.245953, 1, 0, 0.04705882, 1,
2.584286, -0.2122945, 1.66077, 1, 0, 0.04313726, 1,
2.636731, -0.08401105, 0.7596777, 1, 0, 0.03529412, 1,
2.741539, -0.08272983, 0.9931677, 1, 0, 0.03137255, 1,
2.858691, 0.9699529, -0.0851317, 1, 0, 0.02352941, 1,
2.967862, 0.3958868, 0.8662297, 1, 0, 0.01960784, 1,
3.011533, -0.5606214, 1.749711, 1, 0, 0.01176471, 1,
3.284965, -0.1758466, 3.811954, 1, 0, 0.007843138, 1
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
0.221167, -4.572992, -7.614259, 0, -0.5, 0.5, 0.5,
0.221167, -4.572992, -7.614259, 1, -0.5, 0.5, 0.5,
0.221167, -4.572992, -7.614259, 1, 1.5, 0.5, 0.5,
0.221167, -4.572992, -7.614259, 0, 1.5, 0.5, 0.5
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
-3.881259, -0.2502706, -7.614259, 0, -0.5, 0.5, 0.5,
-3.881259, -0.2502706, -7.614259, 1, -0.5, 0.5, 0.5,
-3.881259, -0.2502706, -7.614259, 1, 1.5, 0.5, 0.5,
-3.881259, -0.2502706, -7.614259, 0, 1.5, 0.5, 0.5
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
-3.881259, -4.572992, -0.4378605, 0, -0.5, 0.5, 0.5,
-3.881259, -4.572992, -0.4378605, 1, -0.5, 0.5, 0.5,
-3.881259, -4.572992, -0.4378605, 1, 1.5, 0.5, 0.5,
-3.881259, -4.572992, -0.4378605, 0, 1.5, 0.5, 0.5
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
-2, -3.575441, -5.958167,
3, -3.575441, -5.958167,
-2, -3.575441, -5.958167,
-2, -3.7417, -6.234182,
-1, -3.575441, -5.958167,
-1, -3.7417, -6.234182,
0, -3.575441, -5.958167,
0, -3.7417, -6.234182,
1, -3.575441, -5.958167,
1, -3.7417, -6.234182,
2, -3.575441, -5.958167,
2, -3.7417, -6.234182,
3, -3.575441, -5.958167,
3, -3.7417, -6.234182
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
-2, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
-2, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
-2, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
-2, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5,
-1, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
-1, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
-1, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
-1, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5,
0, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
0, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
0, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
0, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5,
1, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
1, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
1, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
1, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5,
2, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
2, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
2, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
2, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5,
3, -4.074217, -6.786213, 0, -0.5, 0.5, 0.5,
3, -4.074217, -6.786213, 1, -0.5, 0.5, 0.5,
3, -4.074217, -6.786213, 1, 1.5, 0.5, 0.5,
3, -4.074217, -6.786213, 0, 1.5, 0.5, 0.5
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
-2.934545, -3, -5.958167,
-2.934545, 2, -5.958167,
-2.934545, -3, -5.958167,
-3.092331, -3, -6.234182,
-2.934545, -2, -5.958167,
-3.092331, -2, -6.234182,
-2.934545, -1, -5.958167,
-3.092331, -1, -6.234182,
-2.934545, 0, -5.958167,
-3.092331, 0, -6.234182,
-2.934545, 1, -5.958167,
-3.092331, 1, -6.234182,
-2.934545, 2, -5.958167,
-3.092331, 2, -6.234182
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
-3.407902, -3, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, -3, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, -3, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, -3, -6.786213, 0, 1.5, 0.5, 0.5,
-3.407902, -2, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, -2, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, -2, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, -2, -6.786213, 0, 1.5, 0.5, 0.5,
-3.407902, -1, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, -1, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, -1, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, -1, -6.786213, 0, 1.5, 0.5, 0.5,
-3.407902, 0, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, 0, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, 0, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, 0, -6.786213, 0, 1.5, 0.5, 0.5,
-3.407902, 1, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, 1, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, 1, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, 1, -6.786213, 0, 1.5, 0.5, 0.5,
-3.407902, 2, -6.786213, 0, -0.5, 0.5, 0.5,
-3.407902, 2, -6.786213, 1, -0.5, 0.5, 0.5,
-3.407902, 2, -6.786213, 1, 1.5, 0.5, 0.5,
-3.407902, 2, -6.786213, 0, 1.5, 0.5, 0.5
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
-2.934545, -3.575441, -4,
-2.934545, -3.575441, 4,
-2.934545, -3.575441, -4,
-3.092331, -3.7417, -4,
-2.934545, -3.575441, -2,
-3.092331, -3.7417, -2,
-2.934545, -3.575441, 0,
-3.092331, -3.7417, 0,
-2.934545, -3.575441, 2,
-3.092331, -3.7417, 2,
-2.934545, -3.575441, 4,
-3.092331, -3.7417, 4
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
-3.407902, -4.074217, -4, 0, -0.5, 0.5, 0.5,
-3.407902, -4.074217, -4, 1, -0.5, 0.5, 0.5,
-3.407902, -4.074217, -4, 1, 1.5, 0.5, 0.5,
-3.407902, -4.074217, -4, 0, 1.5, 0.5, 0.5,
-3.407902, -4.074217, -2, 0, -0.5, 0.5, 0.5,
-3.407902, -4.074217, -2, 1, -0.5, 0.5, 0.5,
-3.407902, -4.074217, -2, 1, 1.5, 0.5, 0.5,
-3.407902, -4.074217, -2, 0, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 0, 0, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 0, 1, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 0, 1, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 0, 0, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 2, 0, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 2, 1, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 2, 1, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 2, 0, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 4, 0, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 4, 1, -0.5, 0.5, 0.5,
-3.407902, -4.074217, 4, 1, 1.5, 0.5, 0.5,
-3.407902, -4.074217, 4, 0, 1.5, 0.5, 0.5
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
-2.934545, -3.575441, -5.958167,
-2.934545, 3.0749, -5.958167,
-2.934545, -3.575441, 5.082446,
-2.934545, 3.0749, 5.082446,
-2.934545, -3.575441, -5.958167,
-2.934545, -3.575441, 5.082446,
-2.934545, 3.0749, -5.958167,
-2.934545, 3.0749, 5.082446,
-2.934545, -3.575441, -5.958167,
3.376879, -3.575441, -5.958167,
-2.934545, -3.575441, 5.082446,
3.376879, -3.575441, 5.082446,
-2.934545, 3.0749, -5.958167,
3.376879, 3.0749, -5.958167,
-2.934545, 3.0749, 5.082446,
3.376879, 3.0749, 5.082446,
3.376879, -3.575441, -5.958167,
3.376879, 3.0749, -5.958167,
3.376879, -3.575441, 5.082446,
3.376879, 3.0749, 5.082446,
3.376879, -3.575441, -5.958167,
3.376879, -3.575441, 5.082446,
3.376879, 3.0749, -5.958167,
3.376879, 3.0749, 5.082446
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
var radius = 7.663249;
var distance = 34.09467;
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
mvMatrix.translate( -0.221167, 0.2502706, 0.4378605 );
mvMatrix.scale( 1.312803, 1.245899, 0.7504706 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.09467);
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
quinazoline<-read.table("quinazoline.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinazoline$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
```

```r
y<-quinazoline$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
```

```r
z<-quinazoline$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
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
-2.842631, -0.2559453, -2.867352, 0, 0, 1, 1, 1,
-2.79772, 1.024637, -3.446432, 1, 0, 0, 1, 1,
-2.752457, 0.2896788, -1.052238, 1, 0, 0, 1, 1,
-2.746724, 0.1694735, -1.608861, 1, 0, 0, 1, 1,
-2.739475, -2.120218, -1.782435, 1, 0, 0, 1, 1,
-2.702367, -0.8415017, -2.453997, 1, 0, 0, 1, 1,
-2.603981, -1.736668, -3.604692, 0, 0, 0, 1, 1,
-2.559272, 1.234072, -0.9049227, 0, 0, 0, 1, 1,
-2.495692, 0.07122275, 1.085078, 0, 0, 0, 1, 1,
-2.419572, 1.789672, -1.942679, 0, 0, 0, 1, 1,
-2.370708, -0.2993105, -2.42335, 0, 0, 0, 1, 1,
-2.322418, -0.5478659, -1.239435, 0, 0, 0, 1, 1,
-2.320458, -0.1880263, -1.256388, 0, 0, 0, 1, 1,
-2.313877, 0.3274485, -1.311588, 1, 1, 1, 1, 1,
-2.284566, -0.934315, -3.029006, 1, 1, 1, 1, 1,
-2.229664, 0.3640685, -2.235744, 1, 1, 1, 1, 1,
-2.166183, -0.7439713, -1.802299, 1, 1, 1, 1, 1,
-2.151705, -1.030144, -2.098774, 1, 1, 1, 1, 1,
-2.067539, -0.4492869, -1.501389, 1, 1, 1, 1, 1,
-2.050836, -0.3937137, -2.62543, 1, 1, 1, 1, 1,
-2.032906, -0.1660867, -1.902058, 1, 1, 1, 1, 1,
-2.003463, -1.398962, -2.740315, 1, 1, 1, 1, 1,
-1.949169, -0.8461189, -2.27131, 1, 1, 1, 1, 1,
-1.946282, -2.491261, -2.117756, 1, 1, 1, 1, 1,
-1.929368, 1.030537, -2.063738, 1, 1, 1, 1, 1,
-1.895426, -0.9984002, -1.771038, 1, 1, 1, 1, 1,
-1.876887, 0.5500461, -1.559891, 1, 1, 1, 1, 1,
-1.853804, -0.4775545, 1.380999, 1, 1, 1, 1, 1,
-1.838382, 0.357103, -2.316831, 0, 0, 1, 1, 1,
-1.833431, 1.810929, -1.143283, 1, 0, 0, 1, 1,
-1.815834, 0.4106097, -1.160244, 1, 0, 0, 1, 1,
-1.790172, -1.570878, -1.500495, 1, 0, 0, 1, 1,
-1.774445, 0.6039228, -0.09522229, 1, 0, 0, 1, 1,
-1.76492, -0.330403, -1.758775, 1, 0, 0, 1, 1,
-1.764158, 1.783691, 0.02808561, 0, 0, 0, 1, 1,
-1.754255, 0.1442806, -2.515783, 0, 0, 0, 1, 1,
-1.753002, -0.8965108, -1.316715, 0, 0, 0, 1, 1,
-1.747538, 1.027022, -1.523988, 0, 0, 0, 1, 1,
-1.738907, -0.1609971, -1.949331, 0, 0, 0, 1, 1,
-1.732889, 1.301149, -2.398043, 0, 0, 0, 1, 1,
-1.729692, -0.3170526, -0.8190027, 0, 0, 0, 1, 1,
-1.722102, 0.9006649, -0.3072389, 1, 1, 1, 1, 1,
-1.702387, -0.5004409, -0.8979824, 1, 1, 1, 1, 1,
-1.690327, -0.1873587, -2.100818, 1, 1, 1, 1, 1,
-1.648384, -0.312245, -1.210058, 1, 1, 1, 1, 1,
-1.641029, 0.3507805, -0.7966713, 1, 1, 1, 1, 1,
-1.63769, -0.2482407, -1.365395, 1, 1, 1, 1, 1,
-1.630662, -0.2052554, -1.747766, 1, 1, 1, 1, 1,
-1.628775, -0.7831007, -2.011305, 1, 1, 1, 1, 1,
-1.625359, 1.491281, -1.948802, 1, 1, 1, 1, 1,
-1.618905, -0.6836952, -2.242951, 1, 1, 1, 1, 1,
-1.610236, -0.1111066, -0.2193862, 1, 1, 1, 1, 1,
-1.607658, -1.511711, -0.2012966, 1, 1, 1, 1, 1,
-1.59983, -1.049115, -1.926582, 1, 1, 1, 1, 1,
-1.588265, 1.427866, 1.172902, 1, 1, 1, 1, 1,
-1.582244, 0.899448, -0.542846, 1, 1, 1, 1, 1,
-1.555311, 0.112398, -1.272931, 0, 0, 1, 1, 1,
-1.553033, 1.733341, -0.1676846, 1, 0, 0, 1, 1,
-1.549086, -0.9990761, -2.895307, 1, 0, 0, 1, 1,
-1.545981, -1.255434, -2.565794, 1, 0, 0, 1, 1,
-1.532409, 0.5859836, -0.8986277, 1, 0, 0, 1, 1,
-1.531321, -1.312133, -2.982902, 1, 0, 0, 1, 1,
-1.528026, 1.93547, 0.6445441, 0, 0, 0, 1, 1,
-1.520553, -2.07795, -2.484112, 0, 0, 0, 1, 1,
-1.5126, 0.5598966, -0.5975757, 0, 0, 0, 1, 1,
-1.505425, -0.9945243, -3.307492, 0, 0, 0, 1, 1,
-1.503293, -1.289862, -0.3422468, 0, 0, 0, 1, 1,
-1.501373, 0.08581626, -1.741437, 0, 0, 0, 1, 1,
-1.500509, -0.08311366, 0.2075974, 0, 0, 0, 1, 1,
-1.476196, 0.2756694, -1.767455, 1, 1, 1, 1, 1,
-1.475407, 0.3202128, -1.58967, 1, 1, 1, 1, 1,
-1.472976, -1.324142, -1.700885, 1, 1, 1, 1, 1,
-1.46414, -1.28708, 0.4031386, 1, 1, 1, 1, 1,
-1.462701, 0.3473071, -2.779621, 1, 1, 1, 1, 1,
-1.458683, -0.129252, -3.349651, 1, 1, 1, 1, 1,
-1.451672, -0.6331545, -2.103336, 1, 1, 1, 1, 1,
-1.447794, 0.5010421, -0.3580456, 1, 1, 1, 1, 1,
-1.445517, 0.9980926, 0.1513885, 1, 1, 1, 1, 1,
-1.43911, 0.827148, -1.253833, 1, 1, 1, 1, 1,
-1.436438, 1.342836, 0.3208964, 1, 1, 1, 1, 1,
-1.433604, 0.3949181, -0.6819085, 1, 1, 1, 1, 1,
-1.420171, -0.419507, -3.443156, 1, 1, 1, 1, 1,
-1.409436, -1.424817, -0.5884769, 1, 1, 1, 1, 1,
-1.389618, -0.09991879, -0.6554374, 1, 1, 1, 1, 1,
-1.386566, -1.327616, -1.537853, 0, 0, 1, 1, 1,
-1.383167, -0.5300492, -2.506493, 1, 0, 0, 1, 1,
-1.378343, -0.4634261, -2.640374, 1, 0, 0, 1, 1,
-1.377718, 0.1832949, -2.043862, 1, 0, 0, 1, 1,
-1.348647, 0.418806, -0.4992364, 1, 0, 0, 1, 1,
-1.347662, -0.6968881, -2.289254, 1, 0, 0, 1, 1,
-1.343383, 0.3112938, -2.073063, 0, 0, 0, 1, 1,
-1.322692, 1.131844, 1.453, 0, 0, 0, 1, 1,
-1.315257, -1.594114, -3.282814, 0, 0, 0, 1, 1,
-1.313947, -0.7659355, -0.3638193, 0, 0, 0, 1, 1,
-1.292608, 1.545714, 0.9171611, 0, 0, 0, 1, 1,
-1.287577, -1.054483, -1.955864, 0, 0, 0, 1, 1,
-1.285237, 1.486626, -1.771609, 0, 0, 0, 1, 1,
-1.280208, -0.7167093, -2.286927, 1, 1, 1, 1, 1,
-1.263756, -0.5108702, -2.756629, 1, 1, 1, 1, 1,
-1.26255, 0.5212734, -1.363002, 1, 1, 1, 1, 1,
-1.259566, 0.7999963, -0.1054908, 1, 1, 1, 1, 1,
-1.256596, -0.8964831, -2.735484, 1, 1, 1, 1, 1,
-1.250281, -0.02283127, -1.153477, 1, 1, 1, 1, 1,
-1.246383, -1.013649, -2.842042, 1, 1, 1, 1, 1,
-1.245606, -0.4345358, -2.562021, 1, 1, 1, 1, 1,
-1.243466, -0.4897958, -3.277658, 1, 1, 1, 1, 1,
-1.240225, -1.191365, -0.8757003, 1, 1, 1, 1, 1,
-1.23788, -0.4178483, -2.432213, 1, 1, 1, 1, 1,
-1.237361, -2.224466, -4.340584, 1, 1, 1, 1, 1,
-1.23596, -0.2112638, -1.726963, 1, 1, 1, 1, 1,
-1.233446, 0.6962212, -0.2283291, 1, 1, 1, 1, 1,
-1.229992, 1.039835, -0.4874709, 1, 1, 1, 1, 1,
-1.224504, 1.523642, -0.2480707, 0, 0, 1, 1, 1,
-1.22258, -1.43628, -3.017727, 1, 0, 0, 1, 1,
-1.217965, 1.326632, -1.117742, 1, 0, 0, 1, 1,
-1.217612, -0.4044876, -1.231204, 1, 0, 0, 1, 1,
-1.216873, 0.4281099, -0.3988886, 1, 0, 0, 1, 1,
-1.214757, -1.164513, -2.335133, 1, 0, 0, 1, 1,
-1.205196, -1.201961, -2.715934, 0, 0, 0, 1, 1,
-1.197829, 0.821225, -1.179582, 0, 0, 0, 1, 1,
-1.194719, -0.6637962, -2.728346, 0, 0, 0, 1, 1,
-1.188351, -2.229539, -4.979799, 0, 0, 0, 1, 1,
-1.179869, -0.05846752, -1.53613, 0, 0, 0, 1, 1,
-1.176346, 0.04329488, -1.245615, 0, 0, 0, 1, 1,
-1.173446, 0.3156016, -1.826667, 0, 0, 0, 1, 1,
-1.156368, 1.168646, -0.5180586, 1, 1, 1, 1, 1,
-1.1522, 0.2168934, -1.141246, 1, 1, 1, 1, 1,
-1.145188, -0.2461663, -3.258193, 1, 1, 1, 1, 1,
-1.138801, 0.9237779, -2.551499, 1, 1, 1, 1, 1,
-1.136369, 1.76678, -0.2389281, 1, 1, 1, 1, 1,
-1.130989, -0.7962043, -1.847989, 1, 1, 1, 1, 1,
-1.12837, -0.5847321, -3.582749, 1, 1, 1, 1, 1,
-1.113433, -0.2968307, -1.866381, 1, 1, 1, 1, 1,
-1.112483, 1.053503, -1.488344, 1, 1, 1, 1, 1,
-1.101504, -0.2940457, -2.87424, 1, 1, 1, 1, 1,
-1.096147, 0.9845901, -0.6211317, 1, 1, 1, 1, 1,
-1.093992, -0.09580575, -3.784227, 1, 1, 1, 1, 1,
-1.091482, -0.2172963, -2.89696, 1, 1, 1, 1, 1,
-1.089111, 0.09092347, -2.422588, 1, 1, 1, 1, 1,
-1.086636, 0.8493381, -2.603885, 1, 1, 1, 1, 1,
-1.086366, -0.1869221, -1.616823, 0, 0, 1, 1, 1,
-1.081895, -1.416976, -3.347409, 1, 0, 0, 1, 1,
-1.081432, 0.3131013, -0.8470821, 1, 0, 0, 1, 1,
-1.079904, -0.1923997, -1.230498, 1, 0, 0, 1, 1,
-1.078958, -0.3137655, -2.564436, 1, 0, 0, 1, 1,
-1.064917, -0.1432553, -3.27317, 1, 0, 0, 1, 1,
-1.062019, -2.218155, -2.455395, 0, 0, 0, 1, 1,
-1.05134, -1.432176, -1.854584, 0, 0, 0, 1, 1,
-1.049624, 0.4986336, -1.07566, 0, 0, 0, 1, 1,
-1.037614, 1.26345, -0.8986241, 0, 0, 0, 1, 1,
-1.03537, -0.7130727, -1.370152, 0, 0, 0, 1, 1,
-1.030434, 0.2795933, -1.380319, 0, 0, 0, 1, 1,
-1.026308, 2.196468, -1.795633, 0, 0, 0, 1, 1,
-1.02404, -0.01223917, -2.237531, 1, 1, 1, 1, 1,
-1.019011, -0.6698228, -2.912387, 1, 1, 1, 1, 1,
-1.01466, -0.400835, -0.5260795, 1, 1, 1, 1, 1,
-1.009991, -0.52547, -2.793583, 1, 1, 1, 1, 1,
-1.008762, 0.136048, -0.7234659, 1, 1, 1, 1, 1,
-1.00438, -1.204806, -3.679491, 1, 1, 1, 1, 1,
-1.002872, -0.9733013, -3.130959, 1, 1, 1, 1, 1,
-1.00006, 0.3952462, -2.801239, 1, 1, 1, 1, 1,
-0.9855853, -0.6170836, -0.8840292, 1, 1, 1, 1, 1,
-0.9850737, -0.6311997, -2.012277, 1, 1, 1, 1, 1,
-0.9843874, 0.8584276, -1.262866, 1, 1, 1, 1, 1,
-0.9843404, 0.6570852, -1.670663, 1, 1, 1, 1, 1,
-0.9711419, -1.112048, -3.063903, 1, 1, 1, 1, 1,
-0.9626182, 0.8684139, -1.631804, 1, 1, 1, 1, 1,
-0.9591384, -0.1014738, -1.358397, 1, 1, 1, 1, 1,
-0.9565763, -1.912088, -1.942757, 0, 0, 1, 1, 1,
-0.9514735, 0.8503674, -0.8739977, 1, 0, 0, 1, 1,
-0.9503393, 0.4121106, 1.092526, 1, 0, 0, 1, 1,
-0.949429, -1.052221, -3.214976, 1, 0, 0, 1, 1,
-0.948034, 0.9945853, -1.252576, 1, 0, 0, 1, 1,
-0.9443435, -0.3060545, -0.1662433, 1, 0, 0, 1, 1,
-0.9441894, -0.530643, -1.337884, 0, 0, 0, 1, 1,
-0.9396867, 0.3193331, -0.3586612, 0, 0, 0, 1, 1,
-0.9395276, 0.431364, 0.766716, 0, 0, 0, 1, 1,
-0.9389203, 0.8316779, -1.413787, 0, 0, 0, 1, 1,
-0.9368638, 0.4701582, 1.128492, 0, 0, 0, 1, 1,
-0.9364071, -0.8516269, -2.769098, 0, 0, 0, 1, 1,
-0.9351594, 2.671067, -1.24807, 0, 0, 0, 1, 1,
-0.9304928, -0.5177939, -4.030172, 1, 1, 1, 1, 1,
-0.9201624, -0.7743999, -2.392277, 1, 1, 1, 1, 1,
-0.9048133, -0.1399067, -2.107871, 1, 1, 1, 1, 1,
-0.9042578, -0.578445, -3.668013, 1, 1, 1, 1, 1,
-0.9016173, 0.6138335, 1.433231, 1, 1, 1, 1, 1,
-0.9014585, 0.8672051, -0.2586466, 1, 1, 1, 1, 1,
-0.9009818, -0.4050964, -1.722378, 1, 1, 1, 1, 1,
-0.8994368, 1.275591, -1.43766, 1, 1, 1, 1, 1,
-0.8856074, 1.943753, -0.2813766, 1, 1, 1, 1, 1,
-0.8851426, 1.527573, -2.293258, 1, 1, 1, 1, 1,
-0.8810322, -1.097961, -0.7925454, 1, 1, 1, 1, 1,
-0.8804581, -0.9069701, -1.611858, 1, 1, 1, 1, 1,
-0.8799039, -0.2621558, -1.097173, 1, 1, 1, 1, 1,
-0.8765599, 0.2160957, -1.557914, 1, 1, 1, 1, 1,
-0.8764648, 0.4028093, -3.819468, 1, 1, 1, 1, 1,
-0.8717911, -0.972452, -3.742448, 0, 0, 1, 1, 1,
-0.8675326, 1.326789, -1.022935, 1, 0, 0, 1, 1,
-0.8549938, -0.4572479, -1.399736, 1, 0, 0, 1, 1,
-0.8428232, 0.5500249, -0.02044414, 1, 0, 0, 1, 1,
-0.8346773, 0.3988634, -0.1774938, 1, 0, 0, 1, 1,
-0.8280803, -0.6561771, -2.340851, 1, 0, 0, 1, 1,
-0.8278566, 1.552343, -0.7905346, 0, 0, 0, 1, 1,
-0.8138981, -0.4212282, -0.6685237, 0, 0, 0, 1, 1,
-0.8134617, -0.157145, -5.269666, 0, 0, 0, 1, 1,
-0.8127114, 0.5411023, -1.636911, 0, 0, 0, 1, 1,
-0.8081837, 2.305959, -0.3332256, 0, 0, 0, 1, 1,
-0.8047606, 1.259301, -1.535753, 0, 0, 0, 1, 1,
-0.8032732, -1.35843, -1.180849, 0, 0, 0, 1, 1,
-0.8026059, 0.4310159, -1.86936, 1, 1, 1, 1, 1,
-0.8010909, 0.4224433, -1.871868, 1, 1, 1, 1, 1,
-0.7954986, -0.7568968, -2.077246, 1, 1, 1, 1, 1,
-0.7912137, -0.1939447, -1.140956, 1, 1, 1, 1, 1,
-0.7905718, 0.1699734, 0.09833074, 1, 1, 1, 1, 1,
-0.7901011, -0.4921056, -1.49084, 1, 1, 1, 1, 1,
-0.7865155, -1.42072, -2.124674, 1, 1, 1, 1, 1,
-0.7815281, -2.028972, -3.634535, 1, 1, 1, 1, 1,
-0.7815175, -0.8492107, -4.126346, 1, 1, 1, 1, 1,
-0.7750584, -0.173259, -1.078215, 1, 1, 1, 1, 1,
-0.7743665, -1.382825, -3.138237, 1, 1, 1, 1, 1,
-0.7692996, -0.9116253, -3.21902, 1, 1, 1, 1, 1,
-0.7500672, 0.5054443, -3.096618, 1, 1, 1, 1, 1,
-0.7489037, -1.331311, -1.319418, 1, 1, 1, 1, 1,
-0.7441308, -0.2610284, -1.436544, 1, 1, 1, 1, 1,
-0.7360405, 0.8150393, 0.4264499, 0, 0, 1, 1, 1,
-0.734457, -0.3386547, -1.806021, 1, 0, 0, 1, 1,
-0.72917, -1.142821, -2.670287, 1, 0, 0, 1, 1,
-0.7281427, 0.5723667, -0.4225543, 1, 0, 0, 1, 1,
-0.7260237, 1.800962, 3.081353, 1, 0, 0, 1, 1,
-0.7253183, 2.036392, -0.7578995, 1, 0, 0, 1, 1,
-0.7239253, 0.9188887, -1.628511, 0, 0, 0, 1, 1,
-0.7234082, -0.8899159, -1.891782, 0, 0, 0, 1, 1,
-0.7137327, -0.8746315, -4.112437, 0, 0, 0, 1, 1,
-0.7137088, -0.7258022, 0.09623466, 0, 0, 0, 1, 1,
-0.7085043, 0.3792169, -0.2949981, 0, 0, 0, 1, 1,
-0.7060642, 0.07954229, -0.7909597, 0, 0, 0, 1, 1,
-0.7033812, -0.6153899, -1.542735, 0, 0, 0, 1, 1,
-0.691636, -0.2069708, -0.6745239, 1, 1, 1, 1, 1,
-0.691178, 0.8328148, 0.7339192, 1, 1, 1, 1, 1,
-0.6906353, -2.405848, -2.58316, 1, 1, 1, 1, 1,
-0.6850919, 0.2415573, -0.8341535, 1, 1, 1, 1, 1,
-0.6847953, -0.1886631, -1.503938, 1, 1, 1, 1, 1,
-0.6844512, -0.3905841, -2.22489, 1, 1, 1, 1, 1,
-0.6786224, 0.732677, -0.5355544, 1, 1, 1, 1, 1,
-0.678387, 0.2353978, -1.737401, 1, 1, 1, 1, 1,
-0.6781642, 0.7818433, -1.659935, 1, 1, 1, 1, 1,
-0.6743924, -0.5707518, -3.872041, 1, 1, 1, 1, 1,
-0.6697907, 0.6984385, -1.523244, 1, 1, 1, 1, 1,
-0.6694887, -0.1258513, -0.1295039, 1, 1, 1, 1, 1,
-0.6664344, -0.3767332, -1.715118, 1, 1, 1, 1, 1,
-0.6642931, 1.235258, -0.3358748, 1, 1, 1, 1, 1,
-0.661099, -0.2230496, -2.360727, 1, 1, 1, 1, 1,
-0.6606383, -1.499915, -0.9944861, 0, 0, 1, 1, 1,
-0.6566297, 0.6706904, -2.127124, 1, 0, 0, 1, 1,
-0.6555201, -2.081927, -2.88303, 1, 0, 0, 1, 1,
-0.6551989, 0.2150535, -2.187061, 1, 0, 0, 1, 1,
-0.6496967, -0.7013432, -2.668232, 1, 0, 0, 1, 1,
-0.6487672, 0.5800526, -0.5326787, 1, 0, 0, 1, 1,
-0.6485731, -0.5709659, -2.214597, 0, 0, 0, 1, 1,
-0.6456475, -0.9417419, -2.093851, 0, 0, 0, 1, 1,
-0.6441447, -0.228976, -0.3313251, 0, 0, 0, 1, 1,
-0.6421172, -0.6300007, -2.216959, 0, 0, 0, 1, 1,
-0.6401082, -0.1526361, -2.635332, 0, 0, 0, 1, 1,
-0.6334461, 1.074088, -0.9027237, 0, 0, 0, 1, 1,
-0.6276388, 0.04292853, -1.204798, 0, 0, 0, 1, 1,
-0.6273062, -0.4447106, -2.830498, 1, 1, 1, 1, 1,
-0.6271467, 1.399308, -0.3977979, 1, 1, 1, 1, 1,
-0.6212294, 0.1560438, -0.6853994, 1, 1, 1, 1, 1,
-0.6211287, -0.1114885, -1.956074, 1, 1, 1, 1, 1,
-0.6114274, 0.4885958, -0.3768432, 1, 1, 1, 1, 1,
-0.6075834, 0.0565707, -0.382471, 1, 1, 1, 1, 1,
-0.6016781, 0.4186313, 0.261393, 1, 1, 1, 1, 1,
-0.5984595, 2.238073, 0.677964, 1, 1, 1, 1, 1,
-0.5980205, -1.315575, -2.393595, 1, 1, 1, 1, 1,
-0.5951832, -0.8345929, -0.3017636, 1, 1, 1, 1, 1,
-0.5930142, -0.2365831, -3.170622, 1, 1, 1, 1, 1,
-0.58831, -0.2548789, -1.850323, 1, 1, 1, 1, 1,
-0.5868855, 0.9184642, 0.3728922, 1, 1, 1, 1, 1,
-0.5840409, -0.2647869, -1.364186, 1, 1, 1, 1, 1,
-0.5839292, 1.020991, 0.4957522, 1, 1, 1, 1, 1,
-0.5826012, -0.5130419, -2.298163, 0, 0, 1, 1, 1,
-0.5797728, 0.5847012, -0.6561722, 1, 0, 0, 1, 1,
-0.5757136, -0.8761611, -4.358862, 1, 0, 0, 1, 1,
-0.5755023, 0.4127688, -2.325895, 1, 0, 0, 1, 1,
-0.5704048, 0.911458, -0.4579749, 1, 0, 0, 1, 1,
-0.5702736, -0.2414186, -2.576652, 1, 0, 0, 1, 1,
-0.5673434, -1.099368, -1.972434, 0, 0, 0, 1, 1,
-0.5667059, 0.7600539, 1.213488, 0, 0, 0, 1, 1,
-0.5593489, -0.4079959, -2.205005, 0, 0, 0, 1, 1,
-0.5506749, 1.097912, -0.6057885, 0, 0, 0, 1, 1,
-0.5496939, -1.219803, -2.963867, 0, 0, 0, 1, 1,
-0.5366422, -0.06000997, -1.74597, 0, 0, 0, 1, 1,
-0.5326422, 1.13328, -0.4804644, 0, 0, 0, 1, 1,
-0.5315568, -1.042903, -1.500891, 1, 1, 1, 1, 1,
-0.5285059, 1.110829, -1.409509, 1, 1, 1, 1, 1,
-0.5248247, 0.1849236, -1.194592, 1, 1, 1, 1, 1,
-0.5182573, -0.6374213, -2.959807, 1, 1, 1, 1, 1,
-0.5152526, 0.9270819, -0.9955485, 1, 1, 1, 1, 1,
-0.5136584, 0.05746049, -1.430315, 1, 1, 1, 1, 1,
-0.5104012, 0.2133118, -1.696037, 1, 1, 1, 1, 1,
-0.5093622, -0.2128205, -4.051383, 1, 1, 1, 1, 1,
-0.5070496, 1.633911, 0.7419662, 1, 1, 1, 1, 1,
-0.5035374, 0.07765855, -1.630996, 1, 1, 1, 1, 1,
-0.5030201, 0.9262297, -0.7484046, 1, 1, 1, 1, 1,
-0.494559, 1.12376, -1.833133, 1, 1, 1, 1, 1,
-0.4890729, 0.2582458, -1.3019, 1, 1, 1, 1, 1,
-0.4877969, 1.300458, -0.180246, 1, 1, 1, 1, 1,
-0.4877521, 1.176233, -1.391365, 1, 1, 1, 1, 1,
-0.4845901, -0.9156899, -1.940153, 0, 0, 1, 1, 1,
-0.4840324, -0.05348417, -0.427611, 1, 0, 0, 1, 1,
-0.481288, -0.2465407, -2.965981, 1, 0, 0, 1, 1,
-0.4791067, 1.285115, 0.08979363, 1, 0, 0, 1, 1,
-0.4756942, -0.2651989, -1.953975, 1, 0, 0, 1, 1,
-0.4714536, 1.854355, -3.182846, 1, 0, 0, 1, 1,
-0.4694629, 0.1848463, -2.43263, 0, 0, 0, 1, 1,
-0.4649019, 0.1102796, -0.7220679, 0, 0, 0, 1, 1,
-0.4640353, -0.5677514, -1.948728, 0, 0, 0, 1, 1,
-0.461738, 0.5083455, -1.71699, 0, 0, 0, 1, 1,
-0.4612036, 0.07953677, -2.387043, 0, 0, 0, 1, 1,
-0.4574594, -0.261443, -4.237244, 0, 0, 0, 1, 1,
-0.4546997, -1.306383, -1.881823, 0, 0, 0, 1, 1,
-0.4541501, 0.3865299, -0.4225771, 1, 1, 1, 1, 1,
-0.4512375, 0.02633817, -1.258375, 1, 1, 1, 1, 1,
-0.4476599, -1.036925, -3.903625, 1, 1, 1, 1, 1,
-0.4463141, 0.1456784, -1.203597, 1, 1, 1, 1, 1,
-0.4462306, 0.9206578, -0.009490768, 1, 1, 1, 1, 1,
-0.4457583, -1.663799, -3.792312, 1, 1, 1, 1, 1,
-0.4448563, -0.1859409, -1.513208, 1, 1, 1, 1, 1,
-0.4419096, -0.8263316, -2.94898, 1, 1, 1, 1, 1,
-0.4414757, -0.6575722, -3.291872, 1, 1, 1, 1, 1,
-0.4391836, 0.08419687, -0.5282417, 1, 1, 1, 1, 1,
-0.4387586, 0.2821859, -1.72672, 1, 1, 1, 1, 1,
-0.4375891, 0.664835, -1.163806, 1, 1, 1, 1, 1,
-0.4369821, 0.8064648, -0.1970565, 1, 1, 1, 1, 1,
-0.4361912, -0.3492514, -2.107866, 1, 1, 1, 1, 1,
-0.4346084, 0.7179931, -0.9912079, 1, 1, 1, 1, 1,
-0.4345351, 0.3145404, -1.114006, 0, 0, 1, 1, 1,
-0.4285058, -0.628245, -1.519613, 1, 0, 0, 1, 1,
-0.4266234, 0.2469326, -2.237891, 1, 0, 0, 1, 1,
-0.4256462, 0.3797046, -1.436578, 1, 0, 0, 1, 1,
-0.4244436, -0.8079866, -5.797381, 1, 0, 0, 1, 1,
-0.4093238, 1.117767, -1.799133, 1, 0, 0, 1, 1,
-0.4049836, 0.05915387, -1.871306, 0, 0, 0, 1, 1,
-0.403904, 0.4193338, 1.481423, 0, 0, 0, 1, 1,
-0.4022511, -0.2082635, -1.911616, 0, 0, 0, 1, 1,
-0.3996121, 1.672223, -0.3322462, 0, 0, 0, 1, 1,
-0.3935589, 1.455199, -1.343361, 0, 0, 0, 1, 1,
-0.3932853, 1.541877, 0.8523174, 0, 0, 0, 1, 1,
-0.3926091, -0.2942951, -0.9810176, 0, 0, 0, 1, 1,
-0.3921537, -0.1160123, -1.191877, 1, 1, 1, 1, 1,
-0.391603, -0.8454515, -1.533495, 1, 1, 1, 1, 1,
-0.3885648, -1.266703, -1.331342, 1, 1, 1, 1, 1,
-0.3866678, 1.259608, -0.05061892, 1, 1, 1, 1, 1,
-0.3862601, -0.3532558, 0.242233, 1, 1, 1, 1, 1,
-0.3859784, -1.472737, -2.482885, 1, 1, 1, 1, 1,
-0.3839276, 1.868893, -1.818063, 1, 1, 1, 1, 1,
-0.3824906, 0.263787, -0.8454775, 1, 1, 1, 1, 1,
-0.3790911, 0.9585891, 0.2868033, 1, 1, 1, 1, 1,
-0.373852, 0.9040383, -0.4839031, 1, 1, 1, 1, 1,
-0.3727583, -0.7768937, -1.932543, 1, 1, 1, 1, 1,
-0.3696162, 1.455416, 0.325642, 1, 1, 1, 1, 1,
-0.3671807, 0.2964093, -0.5345693, 1, 1, 1, 1, 1,
-0.3637515, -0.9065459, -0.9500512, 1, 1, 1, 1, 1,
-0.3634987, -0.1821431, -1.837748, 1, 1, 1, 1, 1,
-0.36125, 0.2964562, 0.3714811, 0, 0, 1, 1, 1,
-0.3574451, 0.2453539, 0.206505, 1, 0, 0, 1, 1,
-0.3551684, -0.3274667, -0.7127163, 1, 0, 0, 1, 1,
-0.3483053, -0.6601849, -3.654989, 1, 0, 0, 1, 1,
-0.3464555, 0.494156, 0.8332708, 1, 0, 0, 1, 1,
-0.3458707, 1.504492, 0.7743758, 1, 0, 0, 1, 1,
-0.3451942, 0.004681252, -1.816653, 0, 0, 0, 1, 1,
-0.3399507, -0.1093388, 0.191429, 0, 0, 0, 1, 1,
-0.3380481, -3.119921, -4.554803, 0, 0, 0, 1, 1,
-0.3368111, -0.9637452, -2.872327, 0, 0, 0, 1, 1,
-0.3338959, 0.2798774, -0.8645881, 0, 0, 0, 1, 1,
-0.333842, 0.1923863, -0.08239023, 0, 0, 0, 1, 1,
-0.3297239, 0.6111717, -1.345853, 0, 0, 0, 1, 1,
-0.3271996, 0.3037263, -1.997759, 1, 1, 1, 1, 1,
-0.3256281, -0.364797, -3.345042, 1, 1, 1, 1, 1,
-0.3236902, 0.8878923, -0.1306901, 1, 1, 1, 1, 1,
-0.3234232, 0.5507144, 1.008499, 1, 1, 1, 1, 1,
-0.3221348, 0.0870555, -0.08817481, 1, 1, 1, 1, 1,
-0.3213979, -0.9570007, -1.914892, 1, 1, 1, 1, 1,
-0.3197909, -0.277002, -2.702237, 1, 1, 1, 1, 1,
-0.3189204, 0.6744075, 0.8908933, 1, 1, 1, 1, 1,
-0.3180817, 0.6484805, -1.510546, 1, 1, 1, 1, 1,
-0.3179794, 0.830526, -1.02246, 1, 1, 1, 1, 1,
-0.309322, 1.083178, -0.4232906, 1, 1, 1, 1, 1,
-0.3089903, -0.5840713, -2.96262, 1, 1, 1, 1, 1,
-0.3083365, -0.7911159, -2.134204, 1, 1, 1, 1, 1,
-0.3029558, -0.5066983, -0.6295686, 1, 1, 1, 1, 1,
-0.3007059, 0.9372835, 0.3107386, 1, 1, 1, 1, 1,
-0.2990032, 0.881628, -2.453112, 0, 0, 1, 1, 1,
-0.2981658, 0.8724406, 1.363746, 1, 0, 0, 1, 1,
-0.2963061, 0.8594355, 0.6507362, 1, 0, 0, 1, 1,
-0.2955742, -0.4070279, -1.832994, 1, 0, 0, 1, 1,
-0.2952647, -1.012453, -3.43228, 1, 0, 0, 1, 1,
-0.2909548, -0.6520015, -3.013278, 1, 0, 0, 1, 1,
-0.2899907, 1.741307, -0.5743654, 0, 0, 0, 1, 1,
-0.2866622, -2.553013, -3.292355, 0, 0, 0, 1, 1,
-0.2815346, -1.006563, -1.199955, 0, 0, 0, 1, 1,
-0.280451, -2.090866, -3.758645, 0, 0, 0, 1, 1,
-0.2791519, 0.05994441, -2.006665, 0, 0, 0, 1, 1,
-0.2740018, 0.4775028, -0.821901, 0, 0, 0, 1, 1,
-0.2706731, -0.07490054, -2.099507, 0, 0, 0, 1, 1,
-0.2649652, -0.1780105, -3.357693, 1, 1, 1, 1, 1,
-0.2626902, 0.5791638, -0.3944324, 1, 1, 1, 1, 1,
-0.261604, -0.6238706, -2.405334, 1, 1, 1, 1, 1,
-0.2614722, 1.01222, -0.1937892, 1, 1, 1, 1, 1,
-0.2571062, 0.04623736, -1.785647, 1, 1, 1, 1, 1,
-0.2563402, 0.6866122, -1.190283, 1, 1, 1, 1, 1,
-0.2551784, -0.4499455, -1.464836, 1, 1, 1, 1, 1,
-0.2549166, 1.133779, -1.236411, 1, 1, 1, 1, 1,
-0.253622, 0.2495516, -1.869093, 1, 1, 1, 1, 1,
-0.2524196, -1.370295, -3.902505, 1, 1, 1, 1, 1,
-0.2508651, 1.273615, 0.265643, 1, 1, 1, 1, 1,
-0.2458263, 0.0420902, -1.295267, 1, 1, 1, 1, 1,
-0.2444476, -1.015974, -1.742804, 1, 1, 1, 1, 1,
-0.2440804, 1.020938, -0.881969, 1, 1, 1, 1, 1,
-0.2417405, -1.679369, -1.978105, 1, 1, 1, 1, 1,
-0.2414826, 0.3376745, 0.7293739, 0, 0, 1, 1, 1,
-0.221183, 1.696839, 0.2011515, 1, 0, 0, 1, 1,
-0.2178076, -0.1857249, -1.855346, 1, 0, 0, 1, 1,
-0.2013154, -0.6137235, -3.36405, 1, 0, 0, 1, 1,
-0.1983207, 0.377711, -0.04070123, 1, 0, 0, 1, 1,
-0.1963728, 0.3153026, -1.636037, 1, 0, 0, 1, 1,
-0.195081, 0.1332031, -1.24658, 0, 0, 0, 1, 1,
-0.1866471, 0.1192112, 0.09896021, 0, 0, 0, 1, 1,
-0.1865821, 0.1907927, -0.3741365, 0, 0, 0, 1, 1,
-0.1777379, 0.5449604, 0.5742729, 0, 0, 0, 1, 1,
-0.1769642, -0.4781141, -2.468753, 0, 0, 0, 1, 1,
-0.1744389, -2.079865, -2.151191, 0, 0, 0, 1, 1,
-0.174101, -0.09710403, -1.458297, 0, 0, 0, 1, 1,
-0.1739243, -1.042488, -5.179013, 1, 1, 1, 1, 1,
-0.1700254, -0.4285071, -3.806062, 1, 1, 1, 1, 1,
-0.1662973, 0.7531801, 1.05596, 1, 1, 1, 1, 1,
-0.1641682, -0.7805731, -2.611809, 1, 1, 1, 1, 1,
-0.1632481, -1.662658, -2.532554, 1, 1, 1, 1, 1,
-0.1506042, -1.358205, -3.994349, 1, 1, 1, 1, 1,
-0.1489301, 1.412618, -0.839146, 1, 1, 1, 1, 1,
-0.1483664, 1.559127, -1.726316, 1, 1, 1, 1, 1,
-0.1462352, 0.005676778, -2.081843, 1, 1, 1, 1, 1,
-0.145833, 0.9936404, -0.04693783, 1, 1, 1, 1, 1,
-0.144698, -0.2894084, -2.479128, 1, 1, 1, 1, 1,
-0.1372754, -0.4491778, -3.022925, 1, 1, 1, 1, 1,
-0.1372082, -1.586909, -4.547463, 1, 1, 1, 1, 1,
-0.1371454, 1.26249, 0.3716812, 1, 1, 1, 1, 1,
-0.1342783, -1.367097, -3.206735, 1, 1, 1, 1, 1,
-0.1338745, -1.618008, -2.607743, 0, 0, 1, 1, 1,
-0.1337999, -0.1060931, -2.203478, 1, 0, 0, 1, 1,
-0.133424, -0.3062712, -3.394879, 1, 0, 0, 1, 1,
-0.1304772, -1.435077, -3.75886, 1, 0, 0, 1, 1,
-0.1283754, -0.837195, -1.675345, 1, 0, 0, 1, 1,
-0.1241842, 1.295097, 0.1490622, 1, 0, 0, 1, 1,
-0.1235088, -0.3999022, -1.874899, 0, 0, 0, 1, 1,
-0.1234795, 0.7229988, -1.082508, 0, 0, 0, 1, 1,
-0.1183299, -0.2283214, -2.891859, 0, 0, 0, 1, 1,
-0.1123374, 0.5732663, 1.035122, 0, 0, 0, 1, 1,
-0.1118097, -0.06737866, -0.6945269, 0, 0, 0, 1, 1,
-0.1115525, -1.003718, -2.402211, 0, 0, 0, 1, 1,
-0.1112289, 0.538663, -0.439005, 0, 0, 0, 1, 1,
-0.1105974, -0.2931164, -1.836211, 1, 1, 1, 1, 1,
-0.1102626, 0.8806784, 0.4278465, 1, 1, 1, 1, 1,
-0.1090397, -0.9657577, -2.800258, 1, 1, 1, 1, 1,
-0.1026056, -0.1260747, -2.708295, 1, 1, 1, 1, 1,
-0.1025604, 0.1818036, -0.238215, 1, 1, 1, 1, 1,
-0.1011555, -0.7591221, -4.220202, 1, 1, 1, 1, 1,
-0.09814923, 0.03984801, -1.756359, 1, 1, 1, 1, 1,
-0.09688533, 0.3631769, -1.855872, 1, 1, 1, 1, 1,
-0.09437254, -1.27186, -3.524429, 1, 1, 1, 1, 1,
-0.08986455, 0.6048675, 0.9570561, 1, 1, 1, 1, 1,
-0.08849417, 0.08614359, -1.568385, 1, 1, 1, 1, 1,
-0.08821265, -0.6092857, -2.124257, 1, 1, 1, 1, 1,
-0.08526769, -0.9795069, -1.905731, 1, 1, 1, 1, 1,
-0.08428273, 0.0008991711, -3.230529, 1, 1, 1, 1, 1,
-0.08375338, 0.2295947, -0.3186878, 1, 1, 1, 1, 1,
-0.08193265, 0.2911124, -0.4070677, 0, 0, 1, 1, 1,
-0.08186998, 1.161887, 0.9781435, 1, 0, 0, 1, 1,
-0.07747212, 8.42725e-05, -2.223186, 1, 0, 0, 1, 1,
-0.0774489, -0.1616593, -0.9436812, 1, 0, 0, 1, 1,
-0.07282748, 0.1619029, 0.01316131, 1, 0, 0, 1, 1,
-0.0703439, -1.395971, -4.580623, 1, 0, 0, 1, 1,
-0.06197765, 1.815611, -1.457397, 0, 0, 0, 1, 1,
-0.06011468, 0.8770737, -0.3916229, 0, 0, 0, 1, 1,
-0.0598915, -1.02604, -3.382486, 0, 0, 0, 1, 1,
-0.05981374, -0.4475056, -2.179761, 0, 0, 0, 1, 1,
-0.05940374, 0.08882455, -0.9812987, 0, 0, 0, 1, 1,
-0.05875183, -0.07210181, -1.618123, 0, 0, 0, 1, 1,
-0.05494733, 0.6899559, 0.5095537, 0, 0, 0, 1, 1,
-0.05193866, -0.8333892, -3.701059, 1, 1, 1, 1, 1,
-0.04941388, -0.3496011, -2.664052, 1, 1, 1, 1, 1,
-0.04709751, 0.7211779, -1.466825, 1, 1, 1, 1, 1,
-0.04029551, -0.3149713, -0.708426, 1, 1, 1, 1, 1,
-0.03987952, -1.024106, -4.840043, 1, 1, 1, 1, 1,
-0.03883802, 0.6208069, 0.6932935, 1, 1, 1, 1, 1,
-0.03711033, 1.0513, -1.601684, 1, 1, 1, 1, 1,
-0.03384523, 0.8940988, -0.01658702, 1, 1, 1, 1, 1,
-0.03303858, -0.2009572, -3.949452, 1, 1, 1, 1, 1,
-0.03052123, 0.01771459, -1.822769, 1, 1, 1, 1, 1,
-0.02449083, 1.576755, -0.7169279, 1, 1, 1, 1, 1,
-0.02351749, 0.4444939, -0.749297, 1, 1, 1, 1, 1,
-0.01978577, 0.3448355, -0.7471201, 1, 1, 1, 1, 1,
-0.01818267, 1.622217, -1.44393, 1, 1, 1, 1, 1,
-0.01689308, 0.3406855, 2.149619, 1, 1, 1, 1, 1,
-0.01586711, 0.5636272, -2.111406, 0, 0, 1, 1, 1,
-0.01276446, -0.9359896, -2.767348, 1, 0, 0, 1, 1,
-0.006402274, -2.488783, -1.918247, 1, 0, 0, 1, 1,
-2.706736e-05, -0.4650813, -4.583406, 1, 0, 0, 1, 1,
0.001868186, -0.007380334, 1.215721, 1, 0, 0, 1, 1,
0.002113624, -0.709872, 4.708015, 1, 0, 0, 1, 1,
0.008283579, -1.543445, 3.694045, 0, 0, 0, 1, 1,
0.0102042, -0.9107734, 1.823013, 0, 0, 0, 1, 1,
0.02005908, 2.962703, -0.9396753, 0, 0, 0, 1, 1,
0.02739501, 1.755534, 0.4935602, 0, 0, 0, 1, 1,
0.02960703, -0.1837061, 4.714545, 0, 0, 0, 1, 1,
0.02970173, 0.9100848, 0.2290533, 0, 0, 0, 1, 1,
0.03163509, 0.411465, -0.3981822, 0, 0, 0, 1, 1,
0.03259496, -0.5889912, 1.861241, 1, 1, 1, 1, 1,
0.03372312, 2.798449, -0.366317, 1, 1, 1, 1, 1,
0.03806837, -0.5125524, 4.139721, 1, 1, 1, 1, 1,
0.0382743, -1.557092, 1.564268, 1, 1, 1, 1, 1,
0.03899789, 1.252279, -1.013063, 1, 1, 1, 1, 1,
0.03907552, 2.169455, 0.3066085, 1, 1, 1, 1, 1,
0.04403728, 1.348928, 1.048981, 1, 1, 1, 1, 1,
0.04543829, 0.8575556, -0.8563031, 1, 1, 1, 1, 1,
0.04886829, 0.3262289, 1.397887, 1, 1, 1, 1, 1,
0.05361433, -1.151265, 4.175387, 1, 1, 1, 1, 1,
0.05392098, -1.275281, 4.083754, 1, 1, 1, 1, 1,
0.05468195, 1.184806, -1.515134, 1, 1, 1, 1, 1,
0.05594214, -0.008866773, 0.5439169, 1, 1, 1, 1, 1,
0.05631654, -1.211547, 2.69587, 1, 1, 1, 1, 1,
0.06047135, -0.856925, 2.96919, 1, 1, 1, 1, 1,
0.06218781, -0.1777011, 4.633727, 0, 0, 1, 1, 1,
0.06400248, 0.1852727, -0.6832718, 1, 0, 0, 1, 1,
0.06657472, 0.5533568, 1.414137, 1, 0, 0, 1, 1,
0.07177847, 0.01241277, -0.1831237, 1, 0, 0, 1, 1,
0.07444248, 0.3096675, 0.8806784, 1, 0, 0, 1, 1,
0.08494885, -0.09237159, 3.874923, 1, 0, 0, 1, 1,
0.08761003, 0.3035916, -0.4967971, 0, 0, 0, 1, 1,
0.0877924, -1.191357, 1.33671, 0, 0, 0, 1, 1,
0.08801144, -0.1135013, 1.17083, 0, 0, 0, 1, 1,
0.09030402, 1.398479, 0.2408036, 0, 0, 0, 1, 1,
0.09595673, -0.3190294, 3.118824, 0, 0, 0, 1, 1,
0.09724942, -0.5975404, 2.689342, 0, 0, 0, 1, 1,
0.09920704, 1.247325, -2.086655, 0, 0, 0, 1, 1,
0.1029169, 0.05142663, 2.02851, 1, 1, 1, 1, 1,
0.1092326, -1.408415, 4.263938, 1, 1, 1, 1, 1,
0.1107138, -0.3479454, 1.481217, 1, 1, 1, 1, 1,
0.1142415, 1.213189, -0.8804438, 1, 1, 1, 1, 1,
0.1231096, 0.6321673, -1.314061, 1, 1, 1, 1, 1,
0.1251177, -0.04380503, 2.35409, 1, 1, 1, 1, 1,
0.1305076, -1.434849, 3.387367, 1, 1, 1, 1, 1,
0.1309998, 0.4032831, 2.100563, 1, 1, 1, 1, 1,
0.1313152, 0.1651092, -1.628186, 1, 1, 1, 1, 1,
0.1317063, 0.275878, 0.9921687, 1, 1, 1, 1, 1,
0.132857, -0.4519992, 1.746693, 1, 1, 1, 1, 1,
0.1345685, -0.6706891, 3.84798, 1, 1, 1, 1, 1,
0.135685, -0.06213374, 1.490369, 1, 1, 1, 1, 1,
0.1389076, -1.177713, 3.779806, 1, 1, 1, 1, 1,
0.1421515, -0.343439, 2.748372, 1, 1, 1, 1, 1,
0.1472881, -0.3952773, 1.989818, 0, 0, 1, 1, 1,
0.147947, -0.689535, 2.675452, 1, 0, 0, 1, 1,
0.1501762, 0.6191379, 1.853334, 1, 0, 0, 1, 1,
0.1566862, 1.135124, -0.8916892, 1, 0, 0, 1, 1,
0.1639098, -2.36403, 2.820259, 1, 0, 0, 1, 1,
0.1674494, 0.9403321, -0.1320023, 1, 0, 0, 1, 1,
0.1674671, 0.9598552, 1.440461, 0, 0, 0, 1, 1,
0.1686578, -1.415519, 2.811502, 0, 0, 0, 1, 1,
0.1704533, -0.1330054, 1.079363, 0, 0, 0, 1, 1,
0.172369, -1.633228, 3.486365, 0, 0, 0, 1, 1,
0.1761245, 0.3349128, 0.1799335, 0, 0, 0, 1, 1,
0.1827978, 0.6796454, 0.3846107, 0, 0, 0, 1, 1,
0.1834693, -1.283027, 2.897425, 0, 0, 0, 1, 1,
0.1837422, -0.4643344, 2.428663, 1, 1, 1, 1, 1,
0.1852858, -1.740785, 2.477642, 1, 1, 1, 1, 1,
0.1872073, -0.2181661, 3.340532, 1, 1, 1, 1, 1,
0.1882577, -1.240752, 3.388924, 1, 1, 1, 1, 1,
0.1900427, 0.3731582, -0.255452, 1, 1, 1, 1, 1,
0.1915883, 0.4173215, 0.4714155, 1, 1, 1, 1, 1,
0.1918096, -1.302368, 4.023067, 1, 1, 1, 1, 1,
0.1921294, 0.2620942, -0.7112942, 1, 1, 1, 1, 1,
0.1988006, -0.5100709, 4.532729, 1, 1, 1, 1, 1,
0.2007638, 1.724092, 1.458346, 1, 1, 1, 1, 1,
0.2017033, 0.1164748, 1.614014, 1, 1, 1, 1, 1,
0.2047391, -1.332234, 3.980357, 1, 1, 1, 1, 1,
0.208313, 0.5752881, 0.91113, 1, 1, 1, 1, 1,
0.2096356, -1.263556, 3.67985, 1, 1, 1, 1, 1,
0.2098438, -1.128125, 1.682358, 1, 1, 1, 1, 1,
0.2098721, 0.4833357, 1.699927, 0, 0, 1, 1, 1,
0.2106561, -0.9993041, 3.440326, 1, 0, 0, 1, 1,
0.2131801, -0.2401732, 2.231226, 1, 0, 0, 1, 1,
0.2140159, -0.2214667, 2.752829, 1, 0, 0, 1, 1,
0.214475, -0.3199691, 4.155877, 1, 0, 0, 1, 1,
0.2164228, -0.7359725, 4.911546, 1, 0, 0, 1, 1,
0.2167923, -0.3997343, 1.214537, 0, 0, 0, 1, 1,
0.2168536, 0.9610021, 0.4229672, 0, 0, 0, 1, 1,
0.219251, -0.536172, 2.780561, 0, 0, 0, 1, 1,
0.2198241, -0.09167651, 1.510503, 0, 0, 0, 1, 1,
0.2245841, 1.775175, 0.2070907, 0, 0, 0, 1, 1,
0.2259929, -1.461962, 3.394369, 0, 0, 0, 1, 1,
0.2273612, 1.833895, -0.09010584, 0, 0, 0, 1, 1,
0.2306575, -0.5691476, 1.36758, 1, 1, 1, 1, 1,
0.2356398, -0.6926979, 3.374556, 1, 1, 1, 1, 1,
0.2364277, 2.874086, -1.849395, 1, 1, 1, 1, 1,
0.2403382, -1.091027, 2.086669, 1, 1, 1, 1, 1,
0.2450607, -0.3594592, 2.253456, 1, 1, 1, 1, 1,
0.2454018, -0.7287924, 1.727538, 1, 1, 1, 1, 1,
0.2462051, 0.3785641, 1.203224, 1, 1, 1, 1, 1,
0.2507656, -1.620638, 3.097313, 1, 1, 1, 1, 1,
0.2546374, 1.827532, 0.7787664, 1, 1, 1, 1, 1,
0.2548036, 1.720222, 1.139942, 1, 1, 1, 1, 1,
0.2552469, -0.9807857, 4.009892, 1, 1, 1, 1, 1,
0.2579324, -0.9398352, 2.13375, 1, 1, 1, 1, 1,
0.258877, 0.4683473, -1.093652, 1, 1, 1, 1, 1,
0.2659278, -0.956839, 2.50781, 1, 1, 1, 1, 1,
0.266346, 0.3714067, 1.780998, 1, 1, 1, 1, 1,
0.2673379, 1.859395, 0.6172597, 0, 0, 1, 1, 1,
0.2696646, -0.2291541, 2.304649, 1, 0, 0, 1, 1,
0.2701203, 0.2956316, 1.09481, 1, 0, 0, 1, 1,
0.2723691, -0.2117261, 0.8503459, 1, 0, 0, 1, 1,
0.2737966, -2.266693, 3.975421, 1, 0, 0, 1, 1,
0.2763662, 0.9274939, -0.5577201, 1, 0, 0, 1, 1,
0.2781153, -0.1274676, 2.524148, 0, 0, 0, 1, 1,
0.2802886, -1.090521, 0.7048994, 0, 0, 0, 1, 1,
0.2819955, 0.8155182, 2.849728, 0, 0, 0, 1, 1,
0.2839472, 1.006317, 1.306909, 0, 0, 0, 1, 1,
0.2942782, 0.1585198, -0.2923522, 0, 0, 0, 1, 1,
0.2968685, -1.563583, 2.815818, 0, 0, 0, 1, 1,
0.2988418, 0.8449341, 1.25547, 0, 0, 0, 1, 1,
0.300317, 0.7084801, 0.987781, 1, 1, 1, 1, 1,
0.3009213, 0.1156264, -0.07847841, 1, 1, 1, 1, 1,
0.3020335, -0.08692656, 3.893312, 1, 1, 1, 1, 1,
0.3046985, -0.1140509, 4.08852, 1, 1, 1, 1, 1,
0.3091469, -1.025466, 1.961564, 1, 1, 1, 1, 1,
0.3109435, -2.695379, 4.85589, 1, 1, 1, 1, 1,
0.3168229, 1.149684, -1.052377, 1, 1, 1, 1, 1,
0.3170851, 1.451576, -1.251696, 1, 1, 1, 1, 1,
0.3221906, -1.739573, 2.427316, 1, 1, 1, 1, 1,
0.3276622, 0.09113657, 2.294665, 1, 1, 1, 1, 1,
0.3397172, 0.3469399, 1.557322, 1, 1, 1, 1, 1,
0.3418455, 1.104589, -0.07883316, 1, 1, 1, 1, 1,
0.3423932, 0.9291924, -0.2589934, 1, 1, 1, 1, 1,
0.3503173, 0.5225584, 1.475624, 1, 1, 1, 1, 1,
0.354005, 1.833471, -0.8649086, 1, 1, 1, 1, 1,
0.3545783, -0.1996361, 1.591386, 0, 0, 1, 1, 1,
0.3577179, 0.4650501, 0.0712263, 1, 0, 0, 1, 1,
0.3578286, -0.5756829, 3.85625, 1, 0, 0, 1, 1,
0.359472, 0.1718243, 1.077169, 1, 0, 0, 1, 1,
0.3617345, -0.1769277, 2.418983, 1, 0, 0, 1, 1,
0.3688816, -0.5001061, 2.128324, 1, 0, 0, 1, 1,
0.3733904, -0.1431548, 1.607139, 0, 0, 0, 1, 1,
0.3745676, -0.5968454, 2.77128, 0, 0, 0, 1, 1,
0.3755526, 0.9625317, 1.315484, 0, 0, 0, 1, 1,
0.3770645, -1.841216, 2.985177, 0, 0, 0, 1, 1,
0.3833939, -1.18854, 3.160203, 0, 0, 0, 1, 1,
0.3848969, -0.2596045, 2.571628, 0, 0, 0, 1, 1,
0.3863279, -1.910369, 4.651693, 0, 0, 0, 1, 1,
0.3868464, -0.4498467, 4.426007, 1, 1, 1, 1, 1,
0.3880667, -1.39664, 2.195626, 1, 1, 1, 1, 1,
0.3962324, 0.9118184, 0.1715006, 1, 1, 1, 1, 1,
0.3977631, -0.2135947, 2.743114, 1, 1, 1, 1, 1,
0.3984305, 0.6502832, -1.364333, 1, 1, 1, 1, 1,
0.3985046, -1.423972, 2.708629, 1, 1, 1, 1, 1,
0.4003523, 2.045042, 0.4384674, 1, 1, 1, 1, 1,
0.40087, 1.648506, 0.4919739, 1, 1, 1, 1, 1,
0.4017543, -0.1417351, 0.2374755, 1, 1, 1, 1, 1,
0.4041609, -0.4554316, 1.385736, 1, 1, 1, 1, 1,
0.404498, -0.4468024, 2.244253, 1, 1, 1, 1, 1,
0.4118699, 1.66795, 1.163165, 1, 1, 1, 1, 1,
0.4126982, 2.203898, -0.1056109, 1, 1, 1, 1, 1,
0.4153203, 0.2801381, 1.820429, 1, 1, 1, 1, 1,
0.417973, -0.1751056, 1.749688, 1, 1, 1, 1, 1,
0.4189528, 0.9227487, 0.5622753, 0, 0, 1, 1, 1,
0.4266171, 0.6455873, -0.2995851, 1, 0, 0, 1, 1,
0.4303044, 0.2458922, -0.2551018, 1, 0, 0, 1, 1,
0.4305381, 2.181545, 0.5586932, 1, 0, 0, 1, 1,
0.4374178, -0.3622213, 2.993262, 1, 0, 0, 1, 1,
0.4431276, -0.3292981, 1.609514, 1, 0, 0, 1, 1,
0.4453745, 0.6231774, -1.23024, 0, 0, 0, 1, 1,
0.4482114, -0.221197, 3.166497, 0, 0, 0, 1, 1,
0.4487743, -0.4090858, 1.453095, 0, 0, 0, 1, 1,
0.4491846, -1.88427, 2.502717, 0, 0, 0, 1, 1,
0.4510209, 0.3707758, 0.08450704, 0, 0, 0, 1, 1,
0.454671, 0.2134382, 1.45027, 0, 0, 0, 1, 1,
0.456775, 0.1305426, -0.4488991, 0, 0, 0, 1, 1,
0.4582434, 2.418043, 0.829549, 1, 1, 1, 1, 1,
0.4591473, 0.8889505, -0.1667752, 1, 1, 1, 1, 1,
0.4592997, 0.0186754, 2.566043, 1, 1, 1, 1, 1,
0.463636, -0.4650272, 1.841304, 1, 1, 1, 1, 1,
0.4679173, -0.7834423, 2.498923, 1, 1, 1, 1, 1,
0.4690714, -1.141527, 1.545978, 1, 1, 1, 1, 1,
0.4707987, -1.10875, 3.334834, 1, 1, 1, 1, 1,
0.4835072, -0.1413736, 0.7555264, 1, 1, 1, 1, 1,
0.4908639, -1.862658, 3.860472, 1, 1, 1, 1, 1,
0.4919606, -0.7888321, 1.648058, 1, 1, 1, 1, 1,
0.4926291, -0.1639002, 1.213888, 1, 1, 1, 1, 1,
0.4931734, 1.112479, -1.583974, 1, 1, 1, 1, 1,
0.4933409, 1.037684, 1.590506, 1, 1, 1, 1, 1,
0.4948058, -0.9716757, 2.799073, 1, 1, 1, 1, 1,
0.4997442, -2.085726, 2.224757, 1, 1, 1, 1, 1,
0.50144, -0.9126679, 3.165232, 0, 0, 1, 1, 1,
0.5033769, -0.05854916, 0.1963774, 1, 0, 0, 1, 1,
0.5043822, 2.094597, 0.4309336, 1, 0, 0, 1, 1,
0.507282, -0.8000702, 2.287794, 1, 0, 0, 1, 1,
0.5080264, 0.875097, 1.405891, 1, 0, 0, 1, 1,
0.5081703, -0.08446198, 1.536997, 1, 0, 0, 1, 1,
0.5096546, -0.7028275, 2.1514, 0, 0, 0, 1, 1,
0.5143729, -0.09355819, 1.041227, 0, 0, 0, 1, 1,
0.5149383, -0.8427443, 2.6062, 0, 0, 0, 1, 1,
0.5223088, 0.7562234, 0.4518054, 0, 0, 0, 1, 1,
0.524901, 0.8784763, 0.6702858, 0, 0, 0, 1, 1,
0.5279279, 0.2885103, 3.403622, 0, 0, 0, 1, 1,
0.5283496, -1.386555, 2.187307, 0, 0, 0, 1, 1,
0.5293463, -0.3135043, 3.269798, 1, 1, 1, 1, 1,
0.5316713, -1.225983, 4.726781, 1, 1, 1, 1, 1,
0.532747, 0.1571064, 1.226855, 1, 1, 1, 1, 1,
0.5334535, 1.190915, 0.3814385, 1, 1, 1, 1, 1,
0.5346558, 0.6095456, -0.2296639, 1, 1, 1, 1, 1,
0.5358692, 0.8582361, 1.67419, 1, 1, 1, 1, 1,
0.5369906, 1.513913, -0.1067803, 1, 1, 1, 1, 1,
0.5384173, 0.02793605, 2.826608, 1, 1, 1, 1, 1,
0.5419402, -1.674351, 1.838769, 1, 1, 1, 1, 1,
0.5424798, -0.02525358, 1.845028, 1, 1, 1, 1, 1,
0.5438175, 0.1744404, 3.536703, 1, 1, 1, 1, 1,
0.5502789, -0.5728953, 2.381769, 1, 1, 1, 1, 1,
0.5532043, 0.006077032, 1.168189, 1, 1, 1, 1, 1,
0.5538765, 0.9466565, 1.468882, 1, 1, 1, 1, 1,
0.5548094, 0.05404304, 0.8479397, 1, 1, 1, 1, 1,
0.5595279, -0.2547946, 2.518312, 0, 0, 1, 1, 1,
0.5703303, 1.039488, 1.587186, 1, 0, 0, 1, 1,
0.5715767, -0.06280207, 0.8476875, 1, 0, 0, 1, 1,
0.5844988, -0.3155858, 2.356194, 1, 0, 0, 1, 1,
0.5854421, 0.8413522, 0.447905, 1, 0, 0, 1, 1,
0.5863841, 0.773201, 2.005579, 1, 0, 0, 1, 1,
0.5881709, -0.0005567102, 3.139874, 0, 0, 0, 1, 1,
0.5896068, 0.8000668, -1.814343, 0, 0, 0, 1, 1,
0.5948346, -0.8433855, 3.618466, 0, 0, 0, 1, 1,
0.6052082, 0.9165184, 0.897078, 0, 0, 0, 1, 1,
0.60541, -0.03423511, 4.75229, 0, 0, 0, 1, 1,
0.6090448, 0.5954251, 2.842178, 0, 0, 0, 1, 1,
0.6106482, 0.8661171, 1.863728, 0, 0, 0, 1, 1,
0.6136022, 0.08148994, 1.773593, 1, 1, 1, 1, 1,
0.6139011, -3.478591, 4.508337, 1, 1, 1, 1, 1,
0.6145861, -0.6225196, 0.2248084, 1, 1, 1, 1, 1,
0.6177652, -0.4918335, 2.068356, 1, 1, 1, 1, 1,
0.6289022, -1.402183, 3.383943, 1, 1, 1, 1, 1,
0.6294093, 0.04198982, 1.421076, 1, 1, 1, 1, 1,
0.6300489, 0.9308972, -0.7527991, 1, 1, 1, 1, 1,
0.631476, 0.2436523, 0.7946837, 1, 1, 1, 1, 1,
0.634472, -0.6654339, 2.75741, 1, 1, 1, 1, 1,
0.6464971, 1.276781, 0.7189777, 1, 1, 1, 1, 1,
0.6500053, -1.109509, 3.842083, 1, 1, 1, 1, 1,
0.6507017, 0.5321151, 1.040692, 1, 1, 1, 1, 1,
0.6512086, 0.1706866, 0.5352642, 1, 1, 1, 1, 1,
0.6580086, -0.9446836, 0.6455399, 1, 1, 1, 1, 1,
0.6598619, 1.364389, 1.47037, 1, 1, 1, 1, 1,
0.6609157, -1.647399, 3.320881, 0, 0, 1, 1, 1,
0.6641905, 1.630182, 2.844378, 1, 0, 0, 1, 1,
0.6669565, 0.6613227, 2.711941, 1, 0, 0, 1, 1,
0.6670797, 2.074201, 1.000962, 1, 0, 0, 1, 1,
0.6708698, 1.335625, 0.9899894, 1, 0, 0, 1, 1,
0.6759056, 0.4929416, -0.1151705, 1, 0, 0, 1, 1,
0.6776225, 1.404125, 1.178576, 0, 0, 0, 1, 1,
0.680128, -0.5278345, 2.052984, 0, 0, 0, 1, 1,
0.683887, 0.472645, 1.488199, 0, 0, 0, 1, 1,
0.691767, -0.9125897, 3.381871, 0, 0, 0, 1, 1,
0.7002591, 0.3684599, 0.8442515, 0, 0, 0, 1, 1,
0.7033009, -0.3990563, 2.411143, 0, 0, 0, 1, 1,
0.7099243, 0.7167827, 0.4475682, 0, 0, 0, 1, 1,
0.7224024, 2.578762, 0.9780846, 1, 1, 1, 1, 1,
0.7236168, 1.162531, -0.5586849, 1, 1, 1, 1, 1,
0.7249025, 0.3203141, 1.070381, 1, 1, 1, 1, 1,
0.7249062, 0.8647771, 2.8559, 1, 1, 1, 1, 1,
0.7304284, -0.4203497, 2.914446, 1, 1, 1, 1, 1,
0.7337216, -0.8644283, 3.488645, 1, 1, 1, 1, 1,
0.7436233, 0.552177, 1.549161, 1, 1, 1, 1, 1,
0.7478672, -0.6244356, 3.062877, 1, 1, 1, 1, 1,
0.748287, -0.9634048, 4.792372, 1, 1, 1, 1, 1,
0.7495042, -1.077849, 2.067697, 1, 1, 1, 1, 1,
0.7567629, 2.883118, -0.3879207, 1, 1, 1, 1, 1,
0.7592154, -1.818876, 2.369471, 1, 1, 1, 1, 1,
0.7608632, 1.297877, -0.866504, 1, 1, 1, 1, 1,
0.7625309, 0.2336179, 1.424027, 1, 1, 1, 1, 1,
0.7649258, -0.641191, 1.375097, 1, 1, 1, 1, 1,
0.7681122, -0.1833076, 2.392977, 0, 0, 1, 1, 1,
0.7684007, 0.005363631, 1.099756, 1, 0, 0, 1, 1,
0.7733397, -1.880733, 3.277416, 1, 0, 0, 1, 1,
0.7781699, -0.6122793, 2.503376, 1, 0, 0, 1, 1,
0.7858627, 1.993374, 0.9294092, 1, 0, 0, 1, 1,
0.7952813, -0.7349198, 1.16819, 1, 0, 0, 1, 1,
0.7971826, 0.7116413, 1.365471, 0, 0, 0, 1, 1,
0.8056756, 1.014349, 1.494048, 0, 0, 0, 1, 1,
0.8126175, -0.1010268, 3.090713, 0, 0, 0, 1, 1,
0.8184196, -0.01372803, 1.728995, 0, 0, 0, 1, 1,
0.8212954, 0.7298697, -1.273487, 0, 0, 0, 1, 1,
0.8222747, 1.408656, -0.4882832, 0, 0, 0, 1, 1,
0.8255382, -0.5051503, 1.431884, 0, 0, 0, 1, 1,
0.8293303, -0.9829017, 1.065633, 1, 1, 1, 1, 1,
0.8304189, -0.3876216, 2.864711, 1, 1, 1, 1, 1,
0.8366075, -0.6424566, 1.715463, 1, 1, 1, 1, 1,
0.8426806, -1.240245, 3.247029, 1, 1, 1, 1, 1,
0.844046, -1.690474, 4.824182, 1, 1, 1, 1, 1,
0.8496847, 0.08408254, 2.263264, 1, 1, 1, 1, 1,
0.849717, 0.8344523, 3.304695, 1, 1, 1, 1, 1,
0.849897, 0.02072491, 0.4673464, 1, 1, 1, 1, 1,
0.8508949, 0.8634918, 0.7018427, 1, 1, 1, 1, 1,
0.8523351, 0.7236639, 0.5807751, 1, 1, 1, 1, 1,
0.8660941, 0.4485554, 0.6720999, 1, 1, 1, 1, 1,
0.8678741, -0.7096108, 1.894953, 1, 1, 1, 1, 1,
0.8694939, 0.3202041, 1.727776, 1, 1, 1, 1, 1,
0.8710802, -1.443451, 4.451761, 1, 1, 1, 1, 1,
0.8762848, -0.2816435, 3.088658, 1, 1, 1, 1, 1,
0.8789165, -0.3441909, 2.58655, 0, 0, 1, 1, 1,
0.8794479, 1.788124, -1.930228, 1, 0, 0, 1, 1,
0.8960837, 1.051871, 1.123314, 1, 0, 0, 1, 1,
0.9026106, 0.4048128, 0.2098202, 1, 0, 0, 1, 1,
0.9036882, -0.2062882, 3.206977, 1, 0, 0, 1, 1,
0.9071388, 0.9640252, -2.04435, 1, 0, 0, 1, 1,
0.9114034, -0.6160824, 3.311842, 0, 0, 0, 1, 1,
0.9124515, 0.7640892, 2.348244, 0, 0, 0, 1, 1,
0.9299163, 0.4142689, 1.36694, 0, 0, 0, 1, 1,
0.9412423, -0.2504739, 0.7193506, 0, 0, 0, 1, 1,
0.9446958, 0.6491901, 1.15007, 0, 0, 0, 1, 1,
0.9448694, -1.713535, 1.928289, 0, 0, 0, 1, 1,
0.9547263, -0.3578533, 2.727956, 0, 0, 0, 1, 1,
0.9578885, 0.4684807, 1.007143, 1, 1, 1, 1, 1,
0.9649267, -0.8408153, 1.360101, 1, 1, 1, 1, 1,
0.9658419, -1.046928, 2.962705, 1, 1, 1, 1, 1,
0.9703352, -0.2753958, 1.914116, 1, 1, 1, 1, 1,
0.9714267, 0.2787175, 1.553325, 1, 1, 1, 1, 1,
0.9751916, -0.5599815, 3.164167, 1, 1, 1, 1, 1,
0.9780882, 1.020682, 1.140255, 1, 1, 1, 1, 1,
0.9883837, 1.862349, 0.5683607, 1, 1, 1, 1, 1,
1.000711, -0.8030457, 4.142529, 1, 1, 1, 1, 1,
1.007643, 2.307499, 0.8030387, 1, 1, 1, 1, 1,
1.010146, 0.796541, 0.4676434, 1, 1, 1, 1, 1,
1.011499, 0.4620437, 1.739547, 1, 1, 1, 1, 1,
1.013958, -1.077715, 3.627515, 1, 1, 1, 1, 1,
1.017512, -0.05290163, 1.659523, 1, 1, 1, 1, 1,
1.020251, 0.08776794, 1.135264, 1, 1, 1, 1, 1,
1.021734, -0.7236632, 2.001019, 0, 0, 1, 1, 1,
1.021818, -0.2449303, 3.721399, 1, 0, 0, 1, 1,
1.023133, -0.2437014, 0.5405582, 1, 0, 0, 1, 1,
1.028265, 0.4195508, 1.296261, 1, 0, 0, 1, 1,
1.029937, -0.3280689, 3.784497, 1, 0, 0, 1, 1,
1.03446, -0.8732515, 1.324266, 1, 0, 0, 1, 1,
1.041649, -0.002576901, 1.677974, 0, 0, 0, 1, 1,
1.044194, -1.796534, 0.10315, 0, 0, 0, 1, 1,
1.045845, 0.1994444, 0.2535232, 0, 0, 0, 1, 1,
1.046792, -0.09482098, 1.305235, 0, 0, 0, 1, 1,
1.047741, -0.6655487, 2.551667, 0, 0, 0, 1, 1,
1.055724, 1.730574, -0.08024845, 0, 0, 0, 1, 1,
1.056042, -0.7209751, 3.253287, 0, 0, 0, 1, 1,
1.062269, 0.08360044, 0.9665876, 1, 1, 1, 1, 1,
1.062928, -1.2753, 2.587216, 1, 1, 1, 1, 1,
1.069035, -1.551132, 1.585536, 1, 1, 1, 1, 1,
1.084799, 1.851409, 1.950554, 1, 1, 1, 1, 1,
1.086433, -2.148371, 2.531695, 1, 1, 1, 1, 1,
1.0868, -0.3269726, 1.394744, 1, 1, 1, 1, 1,
1.097549, 0.6496245, 1.778098, 1, 1, 1, 1, 1,
1.104731, -0.912757, 2.601607, 1, 1, 1, 1, 1,
1.117829, -0.09434477, 1.056487, 1, 1, 1, 1, 1,
1.118484, -2.071187, 3.806256, 1, 1, 1, 1, 1,
1.124831, 2.65641, 0.8874359, 1, 1, 1, 1, 1,
1.136961, 1.821868, -0.2907602, 1, 1, 1, 1, 1,
1.141424, -1.898725, 2.22656, 1, 1, 1, 1, 1,
1.149576, -0.2719084, 2.616101, 1, 1, 1, 1, 1,
1.151936, -1.171244, 2.704336, 1, 1, 1, 1, 1,
1.154586, 0.3739868, 1.989766, 0, 0, 1, 1, 1,
1.158121, 0.300106, 1.619074, 1, 0, 0, 1, 1,
1.169436, -0.7675682, 1.01225, 1, 0, 0, 1, 1,
1.171168, -1.218557, 0.9765531, 1, 0, 0, 1, 1,
1.175808, 1.581009, 1.651683, 1, 0, 0, 1, 1,
1.181942, -1.350296, 2.870142, 1, 0, 0, 1, 1,
1.184049, 1.391521, -0.7511285, 0, 0, 0, 1, 1,
1.196452, -0.7771468, 0.1841949, 0, 0, 0, 1, 1,
1.198528, -1.236902, 2.099706, 0, 0, 0, 1, 1,
1.20345, 0.02102572, 0.870608, 0, 0, 0, 1, 1,
1.210234, -0.1706348, 2.165501, 0, 0, 0, 1, 1,
1.213692, 0.5176541, 1.736049, 0, 0, 0, 1, 1,
1.215206, 0.2405482, -0.0761044, 0, 0, 0, 1, 1,
1.230013, 0.07886382, 2.687099, 1, 1, 1, 1, 1,
1.234107, 0.381864, 2.507186, 1, 1, 1, 1, 1,
1.238884, -0.5430655, 2.29192, 1, 1, 1, 1, 1,
1.240218, 0.6209465, 1.043701, 1, 1, 1, 1, 1,
1.240573, -1.560786, 3.812606, 1, 1, 1, 1, 1,
1.243688, 1.165192, 1.000699, 1, 1, 1, 1, 1,
1.245517, -0.5166647, 1.044915, 1, 1, 1, 1, 1,
1.252885, -1.908925, 2.749922, 1, 1, 1, 1, 1,
1.256817, 0.1550447, 2.470265, 1, 1, 1, 1, 1,
1.26311, -0.3929325, 1.491179, 1, 1, 1, 1, 1,
1.265615, 0.03145483, 2.742185, 1, 1, 1, 1, 1,
1.266531, -0.3786969, 1.395484, 1, 1, 1, 1, 1,
1.268652, 0.7689291, 1.46424, 1, 1, 1, 1, 1,
1.279852, 0.7348596, 0.2321896, 1, 1, 1, 1, 1,
1.281618, -0.9070441, 0.7218551, 1, 1, 1, 1, 1,
1.284808, 1.299092, 2.592093, 0, 0, 1, 1, 1,
1.290794, 0.2283767, 1.38456, 1, 0, 0, 1, 1,
1.292727, 0.261754, 1.645453, 1, 0, 0, 1, 1,
1.301336, 0.5967575, 1.190392, 1, 0, 0, 1, 1,
1.303245, -1.221626, 3.462816, 1, 0, 0, 1, 1,
1.304034, 0.9183324, 0.1227786, 1, 0, 0, 1, 1,
1.304989, 1.376435, -0.8970534, 0, 0, 0, 1, 1,
1.307537, 0.3248591, 1.715026, 0, 0, 0, 1, 1,
1.309199, 1.299308, 2.313836, 0, 0, 0, 1, 1,
1.316539, -0.1722709, 3.582315, 0, 0, 0, 1, 1,
1.329339, -2.075876, 4.128824, 0, 0, 0, 1, 1,
1.346844, 0.4372385, 0.5608706, 0, 0, 0, 1, 1,
1.357495, -1.555388, 3.27706, 0, 0, 0, 1, 1,
1.360512, -2.019235, 2.621826, 1, 1, 1, 1, 1,
1.365244, 1.000674, 0.6350499, 1, 1, 1, 1, 1,
1.37318, -1.071776, 1.38722, 1, 1, 1, 1, 1,
1.381297, -0.328562, 2.034916, 1, 1, 1, 1, 1,
1.38945, -0.4701129, 0.8717765, 1, 1, 1, 1, 1,
1.41965, 0.4534549, -0.6545727, 1, 1, 1, 1, 1,
1.420016, 0.5964437, 3.02939, 1, 1, 1, 1, 1,
1.422747, 0.8565575, -0.2523945, 1, 1, 1, 1, 1,
1.428152, -0.7998413, 0.925712, 1, 1, 1, 1, 1,
1.434276, -1.104766, 2.823454, 1, 1, 1, 1, 1,
1.436542, -0.5881819, 1.905663, 1, 1, 1, 1, 1,
1.439808, 0.8120397, 3.1067, 1, 1, 1, 1, 1,
1.43998, -0.0190032, 1.287328, 1, 1, 1, 1, 1,
1.444101, -0.1913794, 1.721327, 1, 1, 1, 1, 1,
1.446975, -0.2591166, 2.331343, 1, 1, 1, 1, 1,
1.455733, -0.8228145, 1.554993, 0, 0, 1, 1, 1,
1.459491, -0.4036644, 1.310367, 1, 0, 0, 1, 1,
1.460463, -0.6882004, 1.488301, 1, 0, 0, 1, 1,
1.485092, 2.213584, 0.2453311, 1, 0, 0, 1, 1,
1.515389, 0.6522485, 0.6296515, 1, 0, 0, 1, 1,
1.517007, -0.4601624, 1.288376, 1, 0, 0, 1, 1,
1.518373, -1.950555, 2.394302, 0, 0, 0, 1, 1,
1.531007, -1.08829, 1.332155, 0, 0, 0, 1, 1,
1.531854, -0.4066892, 1.837196, 0, 0, 0, 1, 1,
1.539922, 0.6626414, 1.424375, 0, 0, 0, 1, 1,
1.540479, 0.1590659, 2.523701, 0, 0, 0, 1, 1,
1.544097, 0.3984698, 1.548698, 0, 0, 0, 1, 1,
1.549871, -0.05428218, 3.842446, 0, 0, 0, 1, 1,
1.554158, 0.9385606, -0.09039875, 1, 1, 1, 1, 1,
1.563587, -0.7435595, 0.949387, 1, 1, 1, 1, 1,
1.566263, -1.04605, 1.942816, 1, 1, 1, 1, 1,
1.587803, 0.6651158, 0.6265053, 1, 1, 1, 1, 1,
1.596283, 0.7221708, 0.3963022, 1, 1, 1, 1, 1,
1.626692, -0.5758715, 1.013374, 1, 1, 1, 1, 1,
1.626899, -1.045996, 3.391659, 1, 1, 1, 1, 1,
1.629218, -0.5560717, 2.517728, 1, 1, 1, 1, 1,
1.630025, 0.5377461, 0.2947214, 1, 1, 1, 1, 1,
1.632727, -1.14596, 2.155838, 1, 1, 1, 1, 1,
1.635733, 0.2918615, 1.016776, 1, 1, 1, 1, 1,
1.651437, -0.8290874, 2.158413, 1, 1, 1, 1, 1,
1.656413, -0.8481244, 2.618407, 1, 1, 1, 1, 1,
1.687203, 1.420638, 1.476502, 1, 1, 1, 1, 1,
1.702026, 0.4959541, 2.957991, 1, 1, 1, 1, 1,
1.711533, -0.3862918, 1.479341, 0, 0, 1, 1, 1,
1.730977, -0.9997406, 3.472494, 1, 0, 0, 1, 1,
1.732357, 0.6347821, -1.34368, 1, 0, 0, 1, 1,
1.737368, -0.6446308, 1.050792, 1, 0, 0, 1, 1,
1.753885, -1.373376, 1.15979, 1, 0, 0, 1, 1,
1.76362, -0.3173483, 4.92166, 1, 0, 0, 1, 1,
1.77003, -0.1385344, 1.509518, 0, 0, 0, 1, 1,
1.791613, -0.2617952, 2.987757, 0, 0, 0, 1, 1,
1.794031, 0.01741689, 1.288877, 0, 0, 0, 1, 1,
1.798486, -0.9573604, 0.7492416, 0, 0, 0, 1, 1,
1.805533, -1.265382, 1.893706, 0, 0, 0, 1, 1,
1.806062, -0.3930154, 1.152697, 0, 0, 0, 1, 1,
1.81146, -0.3744646, 0.7984024, 0, 0, 0, 1, 1,
1.83466, -0.2095488, 1.510209, 1, 1, 1, 1, 1,
1.850808, -0.02627536, -0.1949119, 1, 1, 1, 1, 1,
1.864443, 2.058654, -0.3088633, 1, 1, 1, 1, 1,
1.894177, -0.5758519, 2.879627, 1, 1, 1, 1, 1,
1.909226, 0.2351316, -1.007572, 1, 1, 1, 1, 1,
1.909351, -0.2780755, 3.675867, 1, 1, 1, 1, 1,
1.920625, 2.97805, 1.936121, 1, 1, 1, 1, 1,
1.936604, 0.6997965, 0.8502437, 1, 1, 1, 1, 1,
1.965342, 0.2180286, 2.77247, 1, 1, 1, 1, 1,
1.973089, -1.813278, 2.233694, 1, 1, 1, 1, 1,
2.029525, 1.406349, 2.060529, 1, 1, 1, 1, 1,
2.05186, 0.2283384, 2.868084, 1, 1, 1, 1, 1,
2.053282, 2.101609, -0.391822, 1, 1, 1, 1, 1,
2.061344, 1.227419, 1.359016, 1, 1, 1, 1, 1,
2.1216, 1.86884, 0.3242475, 1, 1, 1, 1, 1,
2.125893, 2.236808, -0.114903, 0, 0, 1, 1, 1,
2.129281, 0.5574323, 0.7046005, 1, 0, 0, 1, 1,
2.146175, -0.1012317, 2.645709, 1, 0, 0, 1, 1,
2.157708, -1.013023, 2.22005, 1, 0, 0, 1, 1,
2.173343, 1.647375, -0.4423807, 1, 0, 0, 1, 1,
2.186569, 0.07958128, 1.121769, 1, 0, 0, 1, 1,
2.263831, -0.07408124, 1.878698, 0, 0, 0, 1, 1,
2.263858, 1.419683, 1.093845, 0, 0, 0, 1, 1,
2.37212, -0.08409527, 2.396182, 0, 0, 0, 1, 1,
2.382616, -2.1034, 3.583824, 0, 0, 0, 1, 1,
2.403679, 1.185256, 0.7392641, 0, 0, 0, 1, 1,
2.426512, -2.202725, 2.960789, 0, 0, 0, 1, 1,
2.437618, -0.3200699, 2.245953, 0, 0, 0, 1, 1,
2.584286, -0.2122945, 1.66077, 1, 1, 1, 1, 1,
2.636731, -0.08401105, 0.7596777, 1, 1, 1, 1, 1,
2.741539, -0.08272983, 0.9931677, 1, 1, 1, 1, 1,
2.858691, 0.9699529, -0.0851317, 1, 1, 1, 1, 1,
2.967862, 0.3958868, 0.8662297, 1, 1, 1, 1, 1,
3.011533, -0.5606214, 1.749711, 1, 1, 1, 1, 1,
3.284965, -0.1758466, 3.811954, 1, 1, 1, 1, 1
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
var radius = 9.5159;
var distance = 33.4242;
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
mvMatrix.translate( -0.2211671, 0.2502706, 0.4378605 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4242);
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
