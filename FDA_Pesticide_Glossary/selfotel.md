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
-2.938703, 0.5294818, -0.6340026, 1, 0, 0, 1,
-2.917693, -0.6575518, -0.5995837, 1, 0.007843138, 0, 1,
-2.855417, 0.1008285, -1.139461, 1, 0.01176471, 0, 1,
-2.737094, -1.302285, -0.7108741, 1, 0.01960784, 0, 1,
-2.696868, -0.1586846, -1.533576, 1, 0.02352941, 0, 1,
-2.666791, 1.104669, -1.850393, 1, 0.03137255, 0, 1,
-2.624161, -0.7748122, -1.480476, 1, 0.03529412, 0, 1,
-2.597333, -0.6999696, 0.4311478, 1, 0.04313726, 0, 1,
-2.579583, -0.7835419, -2.168856, 1, 0.04705882, 0, 1,
-2.567986, -1.564679, -5.177174, 1, 0.05490196, 0, 1,
-2.549085, 1.164688, 0.06708354, 1, 0.05882353, 0, 1,
-2.435615, -0.9889675, -2.277448, 1, 0.06666667, 0, 1,
-2.348953, -0.3643182, -2.934932, 1, 0.07058824, 0, 1,
-2.348098, -0.02727981, -2.859924, 1, 0.07843138, 0, 1,
-2.250149, 2.302741, -1.666955, 1, 0.08235294, 0, 1,
-2.242522, -1.023031, -3.411386, 1, 0.09019608, 0, 1,
-2.19963, 0.4782107, -3.850139, 1, 0.09411765, 0, 1,
-2.177637, -0.7263125, -1.869742, 1, 0.1019608, 0, 1,
-2.159797, 0.7325801, -0.8321964, 1, 0.1098039, 0, 1,
-2.151945, -0.5695177, -1.164207, 1, 0.1137255, 0, 1,
-2.115388, -1.060027, -2.604951, 1, 0.1215686, 0, 1,
-2.105206, 0.03145778, -3.353913, 1, 0.1254902, 0, 1,
-2.034426, 0.9088697, -1.892828, 1, 0.1333333, 0, 1,
-2.031041, -0.6196846, -0.2810557, 1, 0.1372549, 0, 1,
-2.029824, -0.247331, -0.6517773, 1, 0.145098, 0, 1,
-2.008691, -0.1264894, -2.150846, 1, 0.1490196, 0, 1,
-2.000874, -0.7880215, -2.296757, 1, 0.1568628, 0, 1,
-1.999304, -0.5202404, -3.988872, 1, 0.1607843, 0, 1,
-1.998543, 0.05956679, -1.946059, 1, 0.1686275, 0, 1,
-1.996019, 0.1020534, 0.2667345, 1, 0.172549, 0, 1,
-1.995375, -0.0634861, -0.1618218, 1, 0.1803922, 0, 1,
-1.993383, 1.614869, -2.466462, 1, 0.1843137, 0, 1,
-1.988602, 1.03051, -0.4197379, 1, 0.1921569, 0, 1,
-1.975916, -1.175204, -4.34244, 1, 0.1960784, 0, 1,
-1.957613, -0.4203158, -1.613436, 1, 0.2039216, 0, 1,
-1.953673, 1.75607, -2.121518, 1, 0.2117647, 0, 1,
-1.945355, -0.04933195, -1.523434, 1, 0.2156863, 0, 1,
-1.92424, 0.74942, -1.533422, 1, 0.2235294, 0, 1,
-1.920422, -0.2772636, -1.990177, 1, 0.227451, 0, 1,
-1.89185, 1.599669, 1.354414, 1, 0.2352941, 0, 1,
-1.885824, -0.4179283, -0.8253505, 1, 0.2392157, 0, 1,
-1.882806, -0.7083082, -1.866487, 1, 0.2470588, 0, 1,
-1.872392, -2.545548, -0.8956669, 1, 0.2509804, 0, 1,
-1.826767, -0.5496503, -2.078238, 1, 0.2588235, 0, 1,
-1.816277, 0.08561531, -0.8086158, 1, 0.2627451, 0, 1,
-1.799012, -0.9134853, -1.523493, 1, 0.2705882, 0, 1,
-1.791732, 0.0170026, -2.386804, 1, 0.2745098, 0, 1,
-1.761222, -1.706169, -2.20342, 1, 0.282353, 0, 1,
-1.730069, 0.6324365, -2.190776, 1, 0.2862745, 0, 1,
-1.729233, 0.1931573, 0.4656428, 1, 0.2941177, 0, 1,
-1.684581, -1.551596, -2.03144, 1, 0.3019608, 0, 1,
-1.671262, -0.6959182, -1.458779, 1, 0.3058824, 0, 1,
-1.654924, 0.6220448, 0.5194448, 1, 0.3137255, 0, 1,
-1.636112, 0.06845217, -1.413037, 1, 0.3176471, 0, 1,
-1.624371, -0.2317472, -2.290058, 1, 0.3254902, 0, 1,
-1.623688, -0.358588, -1.773106, 1, 0.3294118, 0, 1,
-1.621096, 0.5327104, -0.186308, 1, 0.3372549, 0, 1,
-1.608008, 0.4823289, -2.615841, 1, 0.3411765, 0, 1,
-1.586756, -0.01069924, -0.6162379, 1, 0.3490196, 0, 1,
-1.575387, 0.7078347, -0.4766574, 1, 0.3529412, 0, 1,
-1.569303, 0.9233319, -0.5302018, 1, 0.3607843, 0, 1,
-1.561403, 1.423139, -1.751262, 1, 0.3647059, 0, 1,
-1.55882, 1.006472, -0.8663779, 1, 0.372549, 0, 1,
-1.545618, -0.9363481, -0.6032408, 1, 0.3764706, 0, 1,
-1.524393, 0.809863, 0.8373563, 1, 0.3843137, 0, 1,
-1.498496, 0.2627946, -1.864596, 1, 0.3882353, 0, 1,
-1.491415, 0.4283418, -1.466267, 1, 0.3960784, 0, 1,
-1.48109, 0.8335498, -1.298744, 1, 0.4039216, 0, 1,
-1.47337, -1.021543, -1.815008, 1, 0.4078431, 0, 1,
-1.472584, 0.6330032, -1.208624, 1, 0.4156863, 0, 1,
-1.46664, -0.5634843, -0.2787208, 1, 0.4196078, 0, 1,
-1.462903, 0.04979743, -0.9280089, 1, 0.427451, 0, 1,
-1.456429, 0.7288994, -1.16511, 1, 0.4313726, 0, 1,
-1.450591, 0.6267812, -0.3162019, 1, 0.4392157, 0, 1,
-1.429797, -0.6343299, -2.608643, 1, 0.4431373, 0, 1,
-1.42943, -1.355247, -2.390088, 1, 0.4509804, 0, 1,
-1.418353, -0.5750256, -2.614856, 1, 0.454902, 0, 1,
-1.414276, 0.4108014, -0.9928074, 1, 0.4627451, 0, 1,
-1.405074, -0.1402337, -1.913458, 1, 0.4666667, 0, 1,
-1.394408, 0.58437, 0.4186738, 1, 0.4745098, 0, 1,
-1.389999, 2.110347, -0.822548, 1, 0.4784314, 0, 1,
-1.385322, 0.05849007, -0.4573206, 1, 0.4862745, 0, 1,
-1.384047, -0.4814721, -2.63685, 1, 0.4901961, 0, 1,
-1.376716, 0.4089947, -1.077013, 1, 0.4980392, 0, 1,
-1.356437, -0.4345051, -2.25964, 1, 0.5058824, 0, 1,
-1.353276, -1.058779, -3.764384, 1, 0.509804, 0, 1,
-1.349601, -0.6555457, -3.305442, 1, 0.5176471, 0, 1,
-1.347707, 0.37958, -0.8059239, 1, 0.5215687, 0, 1,
-1.334486, -1.623444, -2.220621, 1, 0.5294118, 0, 1,
-1.33382, -0.08655825, -1.265144, 1, 0.5333334, 0, 1,
-1.328525, -0.3377099, -2.297436, 1, 0.5411765, 0, 1,
-1.312153, -0.01148023, -1.268006, 1, 0.5450981, 0, 1,
-1.303398, 0.001662146, -1.053246, 1, 0.5529412, 0, 1,
-1.292144, 2.081186, 0.9805118, 1, 0.5568628, 0, 1,
-1.278113, -0.6648497, -1.5016, 1, 0.5647059, 0, 1,
-1.275493, -0.9237993, -3.562833, 1, 0.5686275, 0, 1,
-1.270715, -0.7785029, -2.967016, 1, 0.5764706, 0, 1,
-1.26861, -1.301344, -2.109813, 1, 0.5803922, 0, 1,
-1.267781, -0.02053061, -3.337347, 1, 0.5882353, 0, 1,
-1.261377, -0.3338781, -2.814042, 1, 0.5921569, 0, 1,
-1.248717, -1.329347, -0.3831918, 1, 0.6, 0, 1,
-1.246201, 0.9887243, -0.01671697, 1, 0.6078432, 0, 1,
-1.229262, 1.019948, -0.4903506, 1, 0.6117647, 0, 1,
-1.225741, 0.2228451, -1.621843, 1, 0.6196079, 0, 1,
-1.222821, 0.3470869, -1.271276, 1, 0.6235294, 0, 1,
-1.212754, 0.07641621, -0.120474, 1, 0.6313726, 0, 1,
-1.201894, -1.188628, -0.6368715, 1, 0.6352941, 0, 1,
-1.200516, -0.62039, -2.694847, 1, 0.6431373, 0, 1,
-1.184612, -0.8795066, -2.62866, 1, 0.6470588, 0, 1,
-1.183922, -0.1720396, -1.835698, 1, 0.654902, 0, 1,
-1.180886, -0.5175983, -0.9112482, 1, 0.6588235, 0, 1,
-1.17909, 0.6951137, -2.169187, 1, 0.6666667, 0, 1,
-1.164953, 1.085495, 0.2513908, 1, 0.6705883, 0, 1,
-1.160831, 0.9918691, 0.499115, 1, 0.6784314, 0, 1,
-1.152684, -0.6415511, -1.958867, 1, 0.682353, 0, 1,
-1.150604, -0.3590963, -0.6272874, 1, 0.6901961, 0, 1,
-1.14793, 0.3392012, -0.5972461, 1, 0.6941177, 0, 1,
-1.143638, -1.537133, -1.850646, 1, 0.7019608, 0, 1,
-1.136665, 0.6463163, -0.1996558, 1, 0.7098039, 0, 1,
-1.13165, 0.7375376, -2.720536, 1, 0.7137255, 0, 1,
-1.124761, -1.844028, -0.936332, 1, 0.7215686, 0, 1,
-1.12274, 0.9780398, 0.107142, 1, 0.7254902, 0, 1,
-1.11795, 1.216372, -1.238827, 1, 0.7333333, 0, 1,
-1.106964, 0.9419919, -0.7472613, 1, 0.7372549, 0, 1,
-1.097486, 0.337902, -2.230198, 1, 0.7450981, 0, 1,
-1.088386, 0.09388711, -2.643354, 1, 0.7490196, 0, 1,
-1.088124, -1.158291, -2.576082, 1, 0.7568628, 0, 1,
-1.085152, 0.6797673, -1.94022, 1, 0.7607843, 0, 1,
-1.073307, -0.2121872, -1.285461, 1, 0.7686275, 0, 1,
-1.071868, 0.9167611, -1.364656, 1, 0.772549, 0, 1,
-1.06664, 0.406281, 1.084135, 1, 0.7803922, 0, 1,
-1.065162, -0.9070567, -1.695634, 1, 0.7843137, 0, 1,
-1.058854, 1.250824, 0.8951203, 1, 0.7921569, 0, 1,
-1.058706, -0.6160732, -2.629941, 1, 0.7960784, 0, 1,
-1.058369, -0.227142, -1.132767, 1, 0.8039216, 0, 1,
-1.055395, -1.991775, -2.379539, 1, 0.8117647, 0, 1,
-1.046615, -0.9896481, -4.936236, 1, 0.8156863, 0, 1,
-1.035628, -0.863848, -3.207666, 1, 0.8235294, 0, 1,
-1.028459, -1.58892, -4.027362, 1, 0.827451, 0, 1,
-1.023984, 0.2778599, -1.764729, 1, 0.8352941, 0, 1,
-1.013984, 0.8998924, -1.906343, 1, 0.8392157, 0, 1,
-1.01332, 0.8403856, -0.8800811, 1, 0.8470588, 0, 1,
-1.009309, 0.5061159, -0.5656567, 1, 0.8509804, 0, 1,
-1.002907, 0.1863207, -1.136853, 1, 0.8588235, 0, 1,
-1.001877, -0.08496673, -1.931744, 1, 0.8627451, 0, 1,
-0.9931527, -0.5916962, -1.250017, 1, 0.8705882, 0, 1,
-0.9859717, -2.477831, -0.8363858, 1, 0.8745098, 0, 1,
-0.981939, 0.1993002, -2.007083, 1, 0.8823529, 0, 1,
-0.9798113, -1.609174, -3.262298, 1, 0.8862745, 0, 1,
-0.976127, 1.084385, -0.2726721, 1, 0.8941177, 0, 1,
-0.9759212, -1.008893, -2.164369, 1, 0.8980392, 0, 1,
-0.9753233, 1.584621, -0.4514276, 1, 0.9058824, 0, 1,
-0.9719563, 1.652766, -0.2495971, 1, 0.9137255, 0, 1,
-0.9711953, -0.1626035, -1.790845, 1, 0.9176471, 0, 1,
-0.968439, 0.6403838, -2.632648, 1, 0.9254902, 0, 1,
-0.9611985, 1.593995, -1.748316, 1, 0.9294118, 0, 1,
-0.9605267, -0.2431546, -2.084237, 1, 0.9372549, 0, 1,
-0.957332, 1.284895, 0.06813612, 1, 0.9411765, 0, 1,
-0.9547381, -0.3115851, -0.927866, 1, 0.9490196, 0, 1,
-0.9406972, -1.752514, -2.971576, 1, 0.9529412, 0, 1,
-0.9344192, -1.156894, -1.7152, 1, 0.9607843, 0, 1,
-0.9315418, 0.9255433, -1.87468, 1, 0.9647059, 0, 1,
-0.9283176, -0.7185719, -1.517843, 1, 0.972549, 0, 1,
-0.9226348, -1.861882, -3.575926, 1, 0.9764706, 0, 1,
-0.9197773, 1.122162, 0.4803261, 1, 0.9843137, 0, 1,
-0.9160274, 1.312301, -1.319062, 1, 0.9882353, 0, 1,
-0.9125686, 0.7992335, -0.9764747, 1, 0.9960784, 0, 1,
-0.9114473, -1.643291, -2.010141, 0.9960784, 1, 0, 1,
-0.9099297, 1.43367, -0.5769048, 0.9921569, 1, 0, 1,
-0.8992822, -0.9613305, -1.745709, 0.9843137, 1, 0, 1,
-0.8984843, 0.3325087, -0.6488078, 0.9803922, 1, 0, 1,
-0.8975784, -0.4202564, -1.947558, 0.972549, 1, 0, 1,
-0.8972337, 1.028177, 1.250614, 0.9686275, 1, 0, 1,
-0.8946288, 0.4596839, -0.5530825, 0.9607843, 1, 0, 1,
-0.8939193, -0.6873441, -0.832384, 0.9568627, 1, 0, 1,
-0.8937867, 0.2831601, -3.498125, 0.9490196, 1, 0, 1,
-0.8905788, -0.04730045, -1.170881, 0.945098, 1, 0, 1,
-0.8896481, 0.4221331, -1.729256, 0.9372549, 1, 0, 1,
-0.885973, -0.5739582, -2.861129, 0.9333333, 1, 0, 1,
-0.8789772, 0.3144959, -0.7192932, 0.9254902, 1, 0, 1,
-0.8768274, 0.8411452, -0.948, 0.9215686, 1, 0, 1,
-0.8677094, 0.1758304, 1.012862, 0.9137255, 1, 0, 1,
-0.8676211, 1.814873, -1.485189, 0.9098039, 1, 0, 1,
-0.8636411, -0.6225843, -1.287982, 0.9019608, 1, 0, 1,
-0.8627266, 1.272658, -1.483031, 0.8941177, 1, 0, 1,
-0.8617924, -1.645354, -1.602505, 0.8901961, 1, 0, 1,
-0.8582998, -0.6023965, -1.752359, 0.8823529, 1, 0, 1,
-0.8491477, 0.8267778, 0.1271305, 0.8784314, 1, 0, 1,
-0.8487275, 0.7660024, -0.5696977, 0.8705882, 1, 0, 1,
-0.8487063, 0.286816, -0.164019, 0.8666667, 1, 0, 1,
-0.8425633, 0.2157543, -1.072151, 0.8588235, 1, 0, 1,
-0.8401905, 0.2772228, 0.06331868, 0.854902, 1, 0, 1,
-0.8382483, -1.052836, -0.3281396, 0.8470588, 1, 0, 1,
-0.8378739, -2.462154, -2.639525, 0.8431373, 1, 0, 1,
-0.8377305, 2.25859, -0.08183926, 0.8352941, 1, 0, 1,
-0.8360007, 0.8505805, -0.3457062, 0.8313726, 1, 0, 1,
-0.8349198, -0.2879036, -1.746223, 0.8235294, 1, 0, 1,
-0.8314564, -0.6162454, -3.036106, 0.8196079, 1, 0, 1,
-0.8306695, 0.2753381, -1.243281, 0.8117647, 1, 0, 1,
-0.8235421, 1.175834, -1.304471, 0.8078431, 1, 0, 1,
-0.823024, 1.158696, -2.139175, 0.8, 1, 0, 1,
-0.813489, -0.9848756, -3.122452, 0.7921569, 1, 0, 1,
-0.8108007, -0.0695018, -1.256819, 0.7882353, 1, 0, 1,
-0.8094533, -1.042814, -2.019957, 0.7803922, 1, 0, 1,
-0.8078152, -1.169933, -2.804195, 0.7764706, 1, 0, 1,
-0.798813, -0.3704927, -1.802392, 0.7686275, 1, 0, 1,
-0.798552, 0.8299416, -0.15686, 0.7647059, 1, 0, 1,
-0.7956382, -0.4006472, -2.556537, 0.7568628, 1, 0, 1,
-0.7945783, -1.058514, -2.592713, 0.7529412, 1, 0, 1,
-0.7920092, -0.9106529, -3.354842, 0.7450981, 1, 0, 1,
-0.7848939, 0.2319313, -1.732876, 0.7411765, 1, 0, 1,
-0.7839301, -0.6365545, -1.726835, 0.7333333, 1, 0, 1,
-0.7825893, -0.7892452, -2.28146, 0.7294118, 1, 0, 1,
-0.7791367, -0.1032767, -1.270568, 0.7215686, 1, 0, 1,
-0.7790975, 1.80648, -1.381435, 0.7176471, 1, 0, 1,
-0.7754549, -1.677464, -4.160712, 0.7098039, 1, 0, 1,
-0.7725065, 0.939348, 0.03773273, 0.7058824, 1, 0, 1,
-0.7584589, -1.810306, -2.290593, 0.6980392, 1, 0, 1,
-0.7576005, 1.555694, -0.9525383, 0.6901961, 1, 0, 1,
-0.7558823, -1.482546, -3.142924, 0.6862745, 1, 0, 1,
-0.7453547, 1.940155, 1.017177, 0.6784314, 1, 0, 1,
-0.7418722, -0.2308337, -1.492326, 0.6745098, 1, 0, 1,
-0.7382191, -1.070231, -2.240822, 0.6666667, 1, 0, 1,
-0.7373327, 0.9696656, -0.6121457, 0.6627451, 1, 0, 1,
-0.7341549, -0.08326954, -1.343943, 0.654902, 1, 0, 1,
-0.7327051, 0.02060696, -2.809827, 0.6509804, 1, 0, 1,
-0.7308913, 0.187502, -0.635644, 0.6431373, 1, 0, 1,
-0.724116, -1.268624, -3.635669, 0.6392157, 1, 0, 1,
-0.7228296, -0.2849979, -0.1373507, 0.6313726, 1, 0, 1,
-0.7217751, -0.6955448, -2.802981, 0.627451, 1, 0, 1,
-0.71639, -2.288543, -0.641262, 0.6196079, 1, 0, 1,
-0.7099816, 1.491639, -0.5698245, 0.6156863, 1, 0, 1,
-0.7078115, 0.5508822, -0.9632613, 0.6078432, 1, 0, 1,
-0.6970802, -0.2098711, -3.268335, 0.6039216, 1, 0, 1,
-0.6918063, -2.172873, -2.144329, 0.5960785, 1, 0, 1,
-0.6858889, 0.9274279, -0.1871719, 0.5882353, 1, 0, 1,
-0.6852622, -0.8925851, -2.931458, 0.5843138, 1, 0, 1,
-0.685129, -1.938892, -2.908897, 0.5764706, 1, 0, 1,
-0.6835988, 0.5063621, 0.7589183, 0.572549, 1, 0, 1,
-0.6791471, 0.02957048, -0.6284898, 0.5647059, 1, 0, 1,
-0.6729963, -0.02063618, -1.373812, 0.5607843, 1, 0, 1,
-0.6663957, 0.4589966, -0.4622816, 0.5529412, 1, 0, 1,
-0.6637494, 1.47133, 0.3916765, 0.5490196, 1, 0, 1,
-0.6603873, 1.036285, -0.4832404, 0.5411765, 1, 0, 1,
-0.6576802, -0.3526637, 1.261153, 0.5372549, 1, 0, 1,
-0.6547878, 1.123092, -0.2186831, 0.5294118, 1, 0, 1,
-0.6499321, 1.142962, -0.6037416, 0.5254902, 1, 0, 1,
-0.6488786, -2.085129, -1.55799, 0.5176471, 1, 0, 1,
-0.6380624, -1.115206, -4.545194, 0.5137255, 1, 0, 1,
-0.6365705, 0.2808803, -0.5124869, 0.5058824, 1, 0, 1,
-0.6333441, 0.8342068, -1.641702, 0.5019608, 1, 0, 1,
-0.6325158, -0.5103737, -2.208454, 0.4941176, 1, 0, 1,
-0.6320894, -0.7423012, -1.900612, 0.4862745, 1, 0, 1,
-0.6216249, 2.005882, -1.31656, 0.4823529, 1, 0, 1,
-0.6187285, -0.08740839, -0.3909703, 0.4745098, 1, 0, 1,
-0.6165392, 0.8267102, 0.083113, 0.4705882, 1, 0, 1,
-0.6039423, -0.8994333, -1.847179, 0.4627451, 1, 0, 1,
-0.6033306, -0.3225161, -3.279975, 0.4588235, 1, 0, 1,
-0.6015717, -1.453086, -3.309258, 0.4509804, 1, 0, 1,
-0.6005323, -1.301899, -2.72782, 0.4470588, 1, 0, 1,
-0.5984333, -0.3973153, -3.580159, 0.4392157, 1, 0, 1,
-0.5982749, 0.5066544, 0.7619408, 0.4352941, 1, 0, 1,
-0.5981544, -0.01720062, -2.082385, 0.427451, 1, 0, 1,
-0.5969365, -1.651838, -3.587271, 0.4235294, 1, 0, 1,
-0.5962027, 0.3050642, 0.1243558, 0.4156863, 1, 0, 1,
-0.5955919, 0.01148356, 0.4489528, 0.4117647, 1, 0, 1,
-0.592603, -0.2195069, -3.889445, 0.4039216, 1, 0, 1,
-0.5865544, -0.910131, -1.74483, 0.3960784, 1, 0, 1,
-0.5856898, 0.8831933, -0.3240255, 0.3921569, 1, 0, 1,
-0.5769885, 1.1547, 0.6876336, 0.3843137, 1, 0, 1,
-0.5694488, 0.5645162, 1.397538, 0.3803922, 1, 0, 1,
-0.569296, 0.489761, -1.181381, 0.372549, 1, 0, 1,
-0.5639001, 1.278529, -0.6984971, 0.3686275, 1, 0, 1,
-0.5635033, -0.2836694, -2.104274, 0.3607843, 1, 0, 1,
-0.5615677, 0.8268343, 0.7918756, 0.3568628, 1, 0, 1,
-0.5610576, 0.583492, 1.433399, 0.3490196, 1, 0, 1,
-0.5610411, -1.52433, -1.778906, 0.345098, 1, 0, 1,
-0.5582789, -1.680065, -2.5399, 0.3372549, 1, 0, 1,
-0.5561708, -1.114249, -2.65546, 0.3333333, 1, 0, 1,
-0.554809, -0.4041365, -2.832123, 0.3254902, 1, 0, 1,
-0.5526344, -0.6892307, -1.119122, 0.3215686, 1, 0, 1,
-0.5509045, -0.9595401, -3.088398, 0.3137255, 1, 0, 1,
-0.5484576, -0.6383097, -1.859342, 0.3098039, 1, 0, 1,
-0.5459854, -0.1503785, -2.337805, 0.3019608, 1, 0, 1,
-0.5420629, 2.245964, -0.7412484, 0.2941177, 1, 0, 1,
-0.5396184, 0.5202838, -0.2178221, 0.2901961, 1, 0, 1,
-0.5374507, -0.3888778, -1.654794, 0.282353, 1, 0, 1,
-0.5369546, 2.297264, -1.4024, 0.2784314, 1, 0, 1,
-0.5329974, -1.031171, -3.478998, 0.2705882, 1, 0, 1,
-0.5275897, 1.412462, -0.4579211, 0.2666667, 1, 0, 1,
-0.5248703, -0.1632158, -1.840364, 0.2588235, 1, 0, 1,
-0.5237459, 0.8167877, -1.400605, 0.254902, 1, 0, 1,
-0.5208431, 1.343223, -0.2883976, 0.2470588, 1, 0, 1,
-0.5195562, -1.636974, -3.142309, 0.2431373, 1, 0, 1,
-0.5178127, -0.3567122, -3.895221, 0.2352941, 1, 0, 1,
-0.5164209, 1.667616, -1.918782, 0.2313726, 1, 0, 1,
-0.5158671, -0.7509383, -2.622965, 0.2235294, 1, 0, 1,
-0.5090035, 1.288094, 0.776513, 0.2196078, 1, 0, 1,
-0.5067047, -0.839937, -3.110011, 0.2117647, 1, 0, 1,
-0.5020963, 0.4401685, 0.7551306, 0.2078431, 1, 0, 1,
-0.4927258, -0.23119, -1.581531, 0.2, 1, 0, 1,
-0.4910046, 1.220572, -0.5705059, 0.1921569, 1, 0, 1,
-0.4867868, 0.9273652, -1.359922, 0.1882353, 1, 0, 1,
-0.4837065, 0.1709578, 0.07689746, 0.1803922, 1, 0, 1,
-0.4794881, 0.6370505, -1.033555, 0.1764706, 1, 0, 1,
-0.4734347, -0.3277394, -3.864976, 0.1686275, 1, 0, 1,
-0.4700917, 0.2786631, -0.02221969, 0.1647059, 1, 0, 1,
-0.4616362, -1.041582, -4.464592, 0.1568628, 1, 0, 1,
-0.4537615, -0.8571148, -2.496547, 0.1529412, 1, 0, 1,
-0.4530532, -1.708023, -3.59067, 0.145098, 1, 0, 1,
-0.4498652, 0.9567746, -0.06893886, 0.1411765, 1, 0, 1,
-0.4452024, -0.1308536, -1.875952, 0.1333333, 1, 0, 1,
-0.4448192, 1.439718, -0.2624476, 0.1294118, 1, 0, 1,
-0.4379719, 1.945668, -1.2788, 0.1215686, 1, 0, 1,
-0.4333219, 2.414566, 0.3811688, 0.1176471, 1, 0, 1,
-0.4321782, -0.665058, -1.905582, 0.1098039, 1, 0, 1,
-0.4300368, 2.074332, -2.339873, 0.1058824, 1, 0, 1,
-0.4253948, 1.150781, -1.136384, 0.09803922, 1, 0, 1,
-0.4243466, 0.6302527, -0.7046361, 0.09019608, 1, 0, 1,
-0.4194725, 0.358854, -0.07341371, 0.08627451, 1, 0, 1,
-0.4189916, -0.6568801, -1.256747, 0.07843138, 1, 0, 1,
-0.4181016, -0.3868473, 0.8082404, 0.07450981, 1, 0, 1,
-0.4177795, 0.7949719, -0.6475491, 0.06666667, 1, 0, 1,
-0.4173984, 0.4744179, 0.07181106, 0.0627451, 1, 0, 1,
-0.4168599, 1.512697, 0.6529611, 0.05490196, 1, 0, 1,
-0.4165076, -0.7330917, -2.746758, 0.05098039, 1, 0, 1,
-0.4152701, -1.246561, -1.628739, 0.04313726, 1, 0, 1,
-0.408827, -0.2943752, -2.672672, 0.03921569, 1, 0, 1,
-0.4087741, 0.8636646, -0.2278719, 0.03137255, 1, 0, 1,
-0.4062974, -1.036915, -2.444722, 0.02745098, 1, 0, 1,
-0.3998232, 1.702643, -1.031857, 0.01960784, 1, 0, 1,
-0.396395, 2.017876, -1.658223, 0.01568628, 1, 0, 1,
-0.3899962, -0.05974358, -0.04162941, 0.007843138, 1, 0, 1,
-0.3886234, -1.814752, -2.7119, 0.003921569, 1, 0, 1,
-0.3866594, 1.841848, -1.494383, 0, 1, 0.003921569, 1,
-0.3709078, 0.854687, 0.0263959, 0, 1, 0.01176471, 1,
-0.3692584, -0.3617313, -2.033299, 0, 1, 0.01568628, 1,
-0.3631458, -1.376954, -2.157473, 0, 1, 0.02352941, 1,
-0.3614281, -1.334689, -1.751123, 0, 1, 0.02745098, 1,
-0.361178, 0.3130628, -2.127582, 0, 1, 0.03529412, 1,
-0.3578236, -1.761283, -3.279335, 0, 1, 0.03921569, 1,
-0.3573496, -2.723979, -2.971764, 0, 1, 0.04705882, 1,
-0.353282, -0.6439647, -1.541375, 0, 1, 0.05098039, 1,
-0.3511715, -0.2907072, -1.724234, 0, 1, 0.05882353, 1,
-0.3511222, -0.7237417, -2.309224, 0, 1, 0.0627451, 1,
-0.3482909, 0.5481796, -1.813033, 0, 1, 0.07058824, 1,
-0.3466082, 1.737602, -1.734135, 0, 1, 0.07450981, 1,
-0.3443648, -0.8568762, -3.046582, 0, 1, 0.08235294, 1,
-0.3430752, -0.2010132, -2.082386, 0, 1, 0.08627451, 1,
-0.3373361, -1.181483, -3.129322, 0, 1, 0.09411765, 1,
-0.3354979, 0.2597215, 1.221444, 0, 1, 0.1019608, 1,
-0.3334009, 0.7352633, -0.6401585, 0, 1, 0.1058824, 1,
-0.3312916, 0.8169574, -1.15921, 0, 1, 0.1137255, 1,
-0.329249, 1.449274, -2.26557, 0, 1, 0.1176471, 1,
-0.3250665, 1.799772, 0.1455121, 0, 1, 0.1254902, 1,
-0.3218624, -0.6534858, -2.08686, 0, 1, 0.1294118, 1,
-0.3209607, -0.1385278, -1.750623, 0, 1, 0.1372549, 1,
-0.3204511, -1.606166, -2.789032, 0, 1, 0.1411765, 1,
-0.3192397, 0.07277461, -1.579045, 0, 1, 0.1490196, 1,
-0.3187267, -0.4438704, -2.582054, 0, 1, 0.1529412, 1,
-0.3156657, -1.576387, -2.273882, 0, 1, 0.1607843, 1,
-0.3156272, -0.03717225, -1.097367, 0, 1, 0.1647059, 1,
-0.3115059, -1.412361, -2.68999, 0, 1, 0.172549, 1,
-0.3070326, -0.1963576, -1.405464, 0, 1, 0.1764706, 1,
-0.3049015, 0.5247572, -1.398693, 0, 1, 0.1843137, 1,
-0.2952869, -0.5868289, -1.980566, 0, 1, 0.1882353, 1,
-0.2939249, -0.6506245, -2.492023, 0, 1, 0.1960784, 1,
-0.2904342, -0.9205232, -2.613215, 0, 1, 0.2039216, 1,
-0.2895114, -1.162381, -2.12693, 0, 1, 0.2078431, 1,
-0.2801057, -0.4598426, -2.82471, 0, 1, 0.2156863, 1,
-0.2797371, 0.7812784, 0.4009551, 0, 1, 0.2196078, 1,
-0.2789116, 0.2792006, -1.243639, 0, 1, 0.227451, 1,
-0.2784724, -1.296897, -2.180545, 0, 1, 0.2313726, 1,
-0.2758557, -0.663868, -1.890768, 0, 1, 0.2392157, 1,
-0.2756516, 0.2573759, -0.2893333, 0, 1, 0.2431373, 1,
-0.2747658, -0.4538456, -0.7338116, 0, 1, 0.2509804, 1,
-0.265012, 0.606122, -0.6424623, 0, 1, 0.254902, 1,
-0.2644959, 0.1970888, -1.269477, 0, 1, 0.2627451, 1,
-0.2614262, 0.7557786, -0.558248, 0, 1, 0.2666667, 1,
-0.2612286, -0.1812061, -3.423959, 0, 1, 0.2745098, 1,
-0.2564942, -0.2048491, -1.940921, 0, 1, 0.2784314, 1,
-0.2560926, -0.01985333, -1.90755, 0, 1, 0.2862745, 1,
-0.2507464, -0.5747146, -3.201794, 0, 1, 0.2901961, 1,
-0.242403, -0.2065208, -1.08575, 0, 1, 0.2980392, 1,
-0.2422279, 0.315028, -0.9952579, 0, 1, 0.3058824, 1,
-0.2416652, 0.5073491, -1.581039, 0, 1, 0.3098039, 1,
-0.240888, 0.4021141, -1.956831, 0, 1, 0.3176471, 1,
-0.2394328, -0.06226316, -2.108567, 0, 1, 0.3215686, 1,
-0.2389888, -0.7365481, -0.2797904, 0, 1, 0.3294118, 1,
-0.2381455, 0.7111545, -1.70983, 0, 1, 0.3333333, 1,
-0.2371127, -0.7323964, -3.222742, 0, 1, 0.3411765, 1,
-0.2370634, -1.168116, -3.740911, 0, 1, 0.345098, 1,
-0.2368642, -1.14014, -1.806699, 0, 1, 0.3529412, 1,
-0.2358263, 1.265721, 0.0124004, 0, 1, 0.3568628, 1,
-0.2344271, -1.068091, -3.46045, 0, 1, 0.3647059, 1,
-0.2322779, 0.7307649, -0.6085036, 0, 1, 0.3686275, 1,
-0.2321553, -0.2532384, -2.605744, 0, 1, 0.3764706, 1,
-0.2291379, -0.8605127, -4.504834, 0, 1, 0.3803922, 1,
-0.2215022, 0.4738217, -1.740317, 0, 1, 0.3882353, 1,
-0.2198667, -0.1189704, -0.8857045, 0, 1, 0.3921569, 1,
-0.219446, 0.4322735, -1.187307, 0, 1, 0.4, 1,
-0.2181751, -0.430663, -4.196227, 0, 1, 0.4078431, 1,
-0.2146438, -0.6868346, -3.365322, 0, 1, 0.4117647, 1,
-0.2105474, 0.3230166, -1.073075, 0, 1, 0.4196078, 1,
-0.2076045, 0.307016, -0.1143644, 0, 1, 0.4235294, 1,
-0.2055089, -1.566096, -1.2608, 0, 1, 0.4313726, 1,
-0.2036309, -0.04797504, -1.697297, 0, 1, 0.4352941, 1,
-0.2013622, 0.2329588, -0.1291093, 0, 1, 0.4431373, 1,
-0.2011835, 1.196203, 1.758261, 0, 1, 0.4470588, 1,
-0.1979149, 1.354575, -0.3788427, 0, 1, 0.454902, 1,
-0.1970137, 0.6361759, -1.488555, 0, 1, 0.4588235, 1,
-0.19698, -0.04960122, -1.797615, 0, 1, 0.4666667, 1,
-0.1967342, 1.06375, -0.8442675, 0, 1, 0.4705882, 1,
-0.192932, 0.0815586, -1.38083, 0, 1, 0.4784314, 1,
-0.190835, 0.3566078, 0.4485024, 0, 1, 0.4823529, 1,
-0.189266, 0.0397576, -0.3235843, 0, 1, 0.4901961, 1,
-0.1878252, 0.09591832, -1.218765, 0, 1, 0.4941176, 1,
-0.1816296, 0.8965557, -0.5289971, 0, 1, 0.5019608, 1,
-0.181139, -1.127304, -4.235044, 0, 1, 0.509804, 1,
-0.1787542, 1.486634, -0.1954609, 0, 1, 0.5137255, 1,
-0.1786539, -1.491249, -4.487297, 0, 1, 0.5215687, 1,
-0.1783323, 0.756218, -0.4419242, 0, 1, 0.5254902, 1,
-0.1783281, -0.02325007, -0.2602754, 0, 1, 0.5333334, 1,
-0.1776206, 0.7786112, -0.8513129, 0, 1, 0.5372549, 1,
-0.1734766, 1.319257, 0.09322484, 0, 1, 0.5450981, 1,
-0.1722559, 1.866248, -0.5164647, 0, 1, 0.5490196, 1,
-0.1675888, 0.3980359, -0.05908797, 0, 1, 0.5568628, 1,
-0.1634595, 1.01128, -0.7770463, 0, 1, 0.5607843, 1,
-0.1607014, -7.246247e-05, -1.472904, 0, 1, 0.5686275, 1,
-0.1590775, 0.5121605, -1.927201, 0, 1, 0.572549, 1,
-0.1552881, 0.7896613, -1.679523, 0, 1, 0.5803922, 1,
-0.1545917, -0.1293706, -2.288387, 0, 1, 0.5843138, 1,
-0.1545203, -0.8062556, -1.62008, 0, 1, 0.5921569, 1,
-0.1450327, 0.6199324, -0.603801, 0, 1, 0.5960785, 1,
-0.1424735, 1.555324, -1.320192, 0, 1, 0.6039216, 1,
-0.1387076, -0.4915937, -1.887303, 0, 1, 0.6117647, 1,
-0.1371524, 2.401618, 0.8180183, 0, 1, 0.6156863, 1,
-0.1326752, 2.112988, 0.9110205, 0, 1, 0.6235294, 1,
-0.1304804, -0.7246284, -4.528171, 0, 1, 0.627451, 1,
-0.1257444, -0.5828791, -3.174454, 0, 1, 0.6352941, 1,
-0.1255574, -0.7711475, -1.209895, 0, 1, 0.6392157, 1,
-0.1254258, -1.150944, -2.623196, 0, 1, 0.6470588, 1,
-0.1219754, -1.735717, -2.946518, 0, 1, 0.6509804, 1,
-0.1198561, 2.726007, 1.326641, 0, 1, 0.6588235, 1,
-0.1175841, -0.7876149, -6.320109, 0, 1, 0.6627451, 1,
-0.1119453, 0.2881892, 0.2592461, 0, 1, 0.6705883, 1,
-0.1114414, -2.450609, -3.583059, 0, 1, 0.6745098, 1,
-0.1110069, -0.0690346, -2.011711, 0, 1, 0.682353, 1,
-0.1091409, -0.04406771, -1.744748, 0, 1, 0.6862745, 1,
-0.1043203, 0.2893085, 0.3603973, 0, 1, 0.6941177, 1,
-0.1024444, 1.005159, -0.2222766, 0, 1, 0.7019608, 1,
-0.1018739, -0.7972761, -2.981056, 0, 1, 0.7058824, 1,
-0.1003181, -0.5638394, -4.318119, 0, 1, 0.7137255, 1,
-0.09882806, -0.2574843, -2.975765, 0, 1, 0.7176471, 1,
-0.0939004, -0.8260016, -1.576327, 0, 1, 0.7254902, 1,
-0.09282482, -0.5137072, -2.880722, 0, 1, 0.7294118, 1,
-0.09229416, 0.1029383, 0.1836297, 0, 1, 0.7372549, 1,
-0.09191041, 0.3379034, -0.6560736, 0, 1, 0.7411765, 1,
-0.09046861, 0.09099621, -1.029609, 0, 1, 0.7490196, 1,
-0.08641376, 0.9686375, 0.1195829, 0, 1, 0.7529412, 1,
-0.07913931, -1.954892, -3.500062, 0, 1, 0.7607843, 1,
-0.06915232, -0.1962926, -1.086524, 0, 1, 0.7647059, 1,
-0.06177226, 0.5808707, 0.2150175, 0, 1, 0.772549, 1,
-0.06125402, 0.6632343, -0.7071003, 0, 1, 0.7764706, 1,
-0.06001207, 0.3320107, 0.4477412, 0, 1, 0.7843137, 1,
-0.05759337, -0.4921409, -3.625926, 0, 1, 0.7882353, 1,
-0.05361703, 0.9282146, -0.4963156, 0, 1, 0.7960784, 1,
-0.04614147, -0.1537146, -3.325596, 0, 1, 0.8039216, 1,
-0.04491559, 0.4188391, -1.389485, 0, 1, 0.8078431, 1,
-0.04224361, -0.5974086, -3.101869, 0, 1, 0.8156863, 1,
-0.0393936, 0.7808089, 0.06640227, 0, 1, 0.8196079, 1,
-0.03588089, 0.8695278, 0.6026061, 0, 1, 0.827451, 1,
-0.03538691, 0.1930532, 1.268832, 0, 1, 0.8313726, 1,
-0.0348319, 1.271882, 0.6660778, 0, 1, 0.8392157, 1,
-0.03293307, -0.009616579, -0.7266641, 0, 1, 0.8431373, 1,
-0.03258153, -0.1934255, -4.262598, 0, 1, 0.8509804, 1,
-0.03194367, 1.403024, 0.8633155, 0, 1, 0.854902, 1,
-0.02673646, -0.6351104, -4.365053, 0, 1, 0.8627451, 1,
-0.02492274, -0.797534, -2.902031, 0, 1, 0.8666667, 1,
-0.02353346, -1.029762, -3.832064, 0, 1, 0.8745098, 1,
-0.0217505, -0.3277385, -3.243012, 0, 1, 0.8784314, 1,
-0.02145802, -0.9270598, -0.2190764, 0, 1, 0.8862745, 1,
-0.01899036, 0.5318818, 0.4444428, 0, 1, 0.8901961, 1,
-0.01855343, -0.2733846, -3.517629, 0, 1, 0.8980392, 1,
-0.01760674, 0.9035066, -0.9755179, 0, 1, 0.9058824, 1,
-0.01638718, -0.02261666, -2.232743, 0, 1, 0.9098039, 1,
-0.01573251, -0.1316674, -5.259679, 0, 1, 0.9176471, 1,
-0.01398198, -0.7834591, -4.965433, 0, 1, 0.9215686, 1,
-0.009258622, -0.0483069, -2.329942, 0, 1, 0.9294118, 1,
-0.007643305, 0.6624433, -1.657574, 0, 1, 0.9333333, 1,
-0.007109115, 0.6028658, 1.227164, 0, 1, 0.9411765, 1,
-0.006861038, 0.6813765, -0.5588049, 0, 1, 0.945098, 1,
-0.005845305, 0.5996543, -0.525814, 0, 1, 0.9529412, 1,
-0.005287628, 1.41202, 1.210989, 0, 1, 0.9568627, 1,
-0.00275474, 0.05425833, 0.9292641, 0, 1, 0.9647059, 1,
0.0005065462, 1.367536, -0.7371307, 0, 1, 0.9686275, 1,
0.005213194, -1.249504, 3.950097, 0, 1, 0.9764706, 1,
0.007091159, 0.4856711, 1.503014, 0, 1, 0.9803922, 1,
0.01010136, 0.4689579, -0.4279325, 0, 1, 0.9882353, 1,
0.01194013, 1.733064, -1.685113, 0, 1, 0.9921569, 1,
0.01244021, 0.5392047, 0.2201398, 0, 1, 1, 1,
0.0131677, -1.328567, 3.411255, 0, 0.9921569, 1, 1,
0.01368489, 0.04449992, 0.5140269, 0, 0.9882353, 1, 1,
0.01751181, -0.7698022, 5.534329, 0, 0.9803922, 1, 1,
0.01947629, 0.7672182, 0.1079791, 0, 0.9764706, 1, 1,
0.01951381, -1.268768, 0.9745117, 0, 0.9686275, 1, 1,
0.02076694, -0.3455195, 2.06586, 0, 0.9647059, 1, 1,
0.02325281, -0.5262052, 3.251622, 0, 0.9568627, 1, 1,
0.02792133, 0.3808385, 2.199668, 0, 0.9529412, 1, 1,
0.0318139, 0.1515815, -0.05691433, 0, 0.945098, 1, 1,
0.03544242, 0.2562412, 0.5888497, 0, 0.9411765, 1, 1,
0.03689473, 0.4824029, -0.5669705, 0, 0.9333333, 1, 1,
0.0388598, -0.7363427, 4.053835, 0, 0.9294118, 1, 1,
0.03959833, -1.048669, 2.509151, 0, 0.9215686, 1, 1,
0.04265705, -0.316303, 2.890519, 0, 0.9176471, 1, 1,
0.04652075, -1.927485, 2.930308, 0, 0.9098039, 1, 1,
0.05061871, -0.86266, 3.341425, 0, 0.9058824, 1, 1,
0.05588311, -1.288804, 2.730222, 0, 0.8980392, 1, 1,
0.0575666, 1.727435, 0.8929892, 0, 0.8901961, 1, 1,
0.0585505, -1.702871, 2.444288, 0, 0.8862745, 1, 1,
0.06242133, 0.5310407, 0.3231667, 0, 0.8784314, 1, 1,
0.06857552, 0.07845849, 1.369343, 0, 0.8745098, 1, 1,
0.06873889, 0.1395969, 1.673261, 0, 0.8666667, 1, 1,
0.06896932, -0.5979353, 2.414688, 0, 0.8627451, 1, 1,
0.07025523, 0.5625086, 2.443555, 0, 0.854902, 1, 1,
0.07711665, -0.4845255, 3.215824, 0, 0.8509804, 1, 1,
0.07745402, -0.7893081, 2.228719, 0, 0.8431373, 1, 1,
0.07866072, -0.4018901, 3.985328, 0, 0.8392157, 1, 1,
0.0790057, 1.549826, 0.5229771, 0, 0.8313726, 1, 1,
0.07935056, 0.9871404, 0.5740392, 0, 0.827451, 1, 1,
0.08122292, 0.4063256, -1.609955, 0, 0.8196079, 1, 1,
0.08146231, -0.6467637, 0.2344, 0, 0.8156863, 1, 1,
0.08532709, -1.112004, 2.817063, 0, 0.8078431, 1, 1,
0.09478321, -0.4689727, 2.669838, 0, 0.8039216, 1, 1,
0.09845645, -0.7206448, 2.137851, 0, 0.7960784, 1, 1,
0.1038216, -0.435674, 3.852752, 0, 0.7882353, 1, 1,
0.1045459, 1.071481, -0.09003812, 0, 0.7843137, 1, 1,
0.1050894, 1.068261, 0.7293233, 0, 0.7764706, 1, 1,
0.106665, -0.9908377, 3.912188, 0, 0.772549, 1, 1,
0.1068932, 0.189855, 1.694386, 0, 0.7647059, 1, 1,
0.1095819, 0.4130067, 0.610585, 0, 0.7607843, 1, 1,
0.1101662, 1.34883, -0.02207809, 0, 0.7529412, 1, 1,
0.113313, -0.4038914, 4.275349, 0, 0.7490196, 1, 1,
0.1133503, -2.958623, 3.870755, 0, 0.7411765, 1, 1,
0.1203613, 0.5703657, -0.0189668, 0, 0.7372549, 1, 1,
0.1208507, -1.078656, 4.530878, 0, 0.7294118, 1, 1,
0.1240718, -0.2320096, 2.468818, 0, 0.7254902, 1, 1,
0.1310695, 1.562063, 0.3350406, 0, 0.7176471, 1, 1,
0.1343241, -1.543025, 3.874585, 0, 0.7137255, 1, 1,
0.1376787, 0.6691467, 1.378312, 0, 0.7058824, 1, 1,
0.1388573, 0.1866667, 0.0330633, 0, 0.6980392, 1, 1,
0.1396805, 0.9143826, 0.3797219, 0, 0.6941177, 1, 1,
0.1454433, 0.253085, -0.9434057, 0, 0.6862745, 1, 1,
0.1487177, 1.188274, 0.09695798, 0, 0.682353, 1, 1,
0.1500226, -0.4136936, 2.076914, 0, 0.6745098, 1, 1,
0.1504302, -1.422195, 3.651211, 0, 0.6705883, 1, 1,
0.1512269, 0.7951405, -0.07993405, 0, 0.6627451, 1, 1,
0.1528237, 1.911742, -0.9586116, 0, 0.6588235, 1, 1,
0.1562209, 0.6087763, 1.261356, 0, 0.6509804, 1, 1,
0.1617669, -1.558555, 4.397853, 0, 0.6470588, 1, 1,
0.1657905, -1.763136, 3.885967, 0, 0.6392157, 1, 1,
0.1661322, -3.305592, 3.582798, 0, 0.6352941, 1, 1,
0.1673768, -0.6433566, 2.912539, 0, 0.627451, 1, 1,
0.1702374, -0.2761085, 3.572417, 0, 0.6235294, 1, 1,
0.1762754, -1.628932, 3.54006, 0, 0.6156863, 1, 1,
0.1795203, -0.6086282, 2.247861, 0, 0.6117647, 1, 1,
0.1795538, 0.485786, 1.422786, 0, 0.6039216, 1, 1,
0.1797172, -0.2002995, 4.097543, 0, 0.5960785, 1, 1,
0.1831288, -0.1426458, 2.160405, 0, 0.5921569, 1, 1,
0.1866697, 0.3731219, 2.871633, 0, 0.5843138, 1, 1,
0.1870302, 0.3012522, 0.6416603, 0, 0.5803922, 1, 1,
0.2000669, 0.4552043, -0.5449345, 0, 0.572549, 1, 1,
0.2010125, 0.6703171, -0.4558323, 0, 0.5686275, 1, 1,
0.2045821, 0.7434983, -0.2755476, 0, 0.5607843, 1, 1,
0.2067642, -0.08479983, 3.031103, 0, 0.5568628, 1, 1,
0.2070877, -0.5923667, 4.664044, 0, 0.5490196, 1, 1,
0.208258, -1.434071, 1.550595, 0, 0.5450981, 1, 1,
0.2110958, -0.5908665, 3.546109, 0, 0.5372549, 1, 1,
0.216833, 1.346593, -2.51303, 0, 0.5333334, 1, 1,
0.2267594, 0.1895048, 0.8820872, 0, 0.5254902, 1, 1,
0.2278022, 0.9939204, 0.677643, 0, 0.5215687, 1, 1,
0.2282574, 0.3560802, 0.2170752, 0, 0.5137255, 1, 1,
0.2290685, 0.3581037, 2.136645, 0, 0.509804, 1, 1,
0.2296556, 1.904948, -0.3539615, 0, 0.5019608, 1, 1,
0.2299842, -1.506306, 0.8387513, 0, 0.4941176, 1, 1,
0.2362056, -1.54974, 4.206344, 0, 0.4901961, 1, 1,
0.2404272, -0.8860135, 3.821233, 0, 0.4823529, 1, 1,
0.2404934, 0.1452728, 0.5588273, 0, 0.4784314, 1, 1,
0.2477779, 0.7656658, 0.8815287, 0, 0.4705882, 1, 1,
0.2481802, -0.8965054, 1.758229, 0, 0.4666667, 1, 1,
0.2482507, -2.505143, 3.382576, 0, 0.4588235, 1, 1,
0.2498258, -1.263477, 2.649311, 0, 0.454902, 1, 1,
0.2508651, -1.426836, 1.883802, 0, 0.4470588, 1, 1,
0.2520881, 0.3034303, -0.1407726, 0, 0.4431373, 1, 1,
0.254691, -0.6027423, 4.780262, 0, 0.4352941, 1, 1,
0.2557486, 2.195972, -0.9269797, 0, 0.4313726, 1, 1,
0.2564234, -0.2821233, 1.878902, 0, 0.4235294, 1, 1,
0.2650375, -1.848717, 2.237805, 0, 0.4196078, 1, 1,
0.2655069, 1.000507, -0.006537249, 0, 0.4117647, 1, 1,
0.2657267, -0.402675, 3.479015, 0, 0.4078431, 1, 1,
0.2658521, -0.2924499, 1.529904, 0, 0.4, 1, 1,
0.2701886, -1.299722, 3.330299, 0, 0.3921569, 1, 1,
0.2706788, -0.4046526, 4.080692, 0, 0.3882353, 1, 1,
0.2707963, 2.365584, 1.103248, 0, 0.3803922, 1, 1,
0.2776878, 0.380328, 2.02918, 0, 0.3764706, 1, 1,
0.2793548, -0.1146837, 1.508455, 0, 0.3686275, 1, 1,
0.2802805, 0.1539217, 0.9288254, 0, 0.3647059, 1, 1,
0.2803078, -0.7926589, 3.692364, 0, 0.3568628, 1, 1,
0.2839159, -0.46182, 1.628267, 0, 0.3529412, 1, 1,
0.284948, -1.039747, 1.974792, 0, 0.345098, 1, 1,
0.2854939, -0.86069, 2.872607, 0, 0.3411765, 1, 1,
0.2857563, 1.004964, 0.4056854, 0, 0.3333333, 1, 1,
0.2884369, 0.5785142, 1.523671, 0, 0.3294118, 1, 1,
0.2904944, 0.05737168, -0.1635967, 0, 0.3215686, 1, 1,
0.2909484, -1.016487, 3.909539, 0, 0.3176471, 1, 1,
0.291286, -0.274023, 4.344517, 0, 0.3098039, 1, 1,
0.2951728, -0.6516193, 3.230828, 0, 0.3058824, 1, 1,
0.2987179, -0.07184626, 2.171005, 0, 0.2980392, 1, 1,
0.3017018, -0.801446, 2.663051, 0, 0.2901961, 1, 1,
0.3073768, 0.9127398, -0.6847773, 0, 0.2862745, 1, 1,
0.3080591, -0.02313819, 0.7687272, 0, 0.2784314, 1, 1,
0.3088732, -1.254794, 3.742521, 0, 0.2745098, 1, 1,
0.3152473, -1.146608, 2.528668, 0, 0.2666667, 1, 1,
0.3173537, 0.389908, 0.425991, 0, 0.2627451, 1, 1,
0.3201181, -2.376518, 3.529811, 0, 0.254902, 1, 1,
0.3230476, 1.427948, 0.2237391, 0, 0.2509804, 1, 1,
0.3254555, -1.040952, 2.857017, 0, 0.2431373, 1, 1,
0.3303253, 1.207579, 0.09514905, 0, 0.2392157, 1, 1,
0.3334014, 1.342515, 2.469325, 0, 0.2313726, 1, 1,
0.3365119, -0.2996547, 2.30307, 0, 0.227451, 1, 1,
0.3403042, 0.5598575, 0.2624829, 0, 0.2196078, 1, 1,
0.3417199, 0.6759135, -0.7736071, 0, 0.2156863, 1, 1,
0.3454697, 0.9030845, -0.9914691, 0, 0.2078431, 1, 1,
0.3465236, 0.2676074, -1.175939, 0, 0.2039216, 1, 1,
0.3597874, -0.05904767, 1.917749, 0, 0.1960784, 1, 1,
0.3611317, 0.6577808, 1.9078, 0, 0.1882353, 1, 1,
0.3659121, 0.01852446, 0.1675524, 0, 0.1843137, 1, 1,
0.3677075, -0.3901574, 3.920745, 0, 0.1764706, 1, 1,
0.3698244, -1.243269, 3.058339, 0, 0.172549, 1, 1,
0.3698914, -0.2945456, 3.174023, 0, 0.1647059, 1, 1,
0.3705623, 0.9536517, 1.757363, 0, 0.1607843, 1, 1,
0.3759746, 1.420241, 2.042449, 0, 0.1529412, 1, 1,
0.3814704, 1.307861, -0.1178874, 0, 0.1490196, 1, 1,
0.3853925, 0.2531254, 1.173298, 0, 0.1411765, 1, 1,
0.3878179, -1.817494, 4.008512, 0, 0.1372549, 1, 1,
0.3913636, 1.196209, -0.07028597, 0, 0.1294118, 1, 1,
0.3917039, -0.3724679, 1.105357, 0, 0.1254902, 1, 1,
0.3992973, -1.45932, 3.39868, 0, 0.1176471, 1, 1,
0.4014138, -0.9341782, 3.858871, 0, 0.1137255, 1, 1,
0.4030882, -0.0209991, 0.1793108, 0, 0.1058824, 1, 1,
0.4052505, -0.6024692, 2.212094, 0, 0.09803922, 1, 1,
0.4089586, -0.02155262, 2.678823, 0, 0.09411765, 1, 1,
0.4105839, -0.1175904, 0.3598314, 0, 0.08627451, 1, 1,
0.4160957, -1.682719, 3.828165, 0, 0.08235294, 1, 1,
0.4169547, -0.5826293, 3.813469, 0, 0.07450981, 1, 1,
0.4177885, -0.4511994, 2.895992, 0, 0.07058824, 1, 1,
0.4187584, -1.929448, 2.783959, 0, 0.0627451, 1, 1,
0.4195338, 0.8688102, 2.21593, 0, 0.05882353, 1, 1,
0.4221656, 0.3672708, -0.01115876, 0, 0.05098039, 1, 1,
0.4303983, 0.1883315, -0.5036342, 0, 0.04705882, 1, 1,
0.4428376, -1.648382, 2.143929, 0, 0.03921569, 1, 1,
0.4433008, 0.5966815, -0.1215201, 0, 0.03529412, 1, 1,
0.4447637, -0.02678071, 2.748085, 0, 0.02745098, 1, 1,
0.4458948, -0.07880533, 2.570141, 0, 0.02352941, 1, 1,
0.4458991, -0.3417762, 1.235679, 0, 0.01568628, 1, 1,
0.4461291, 1.461169, -0.415818, 0, 0.01176471, 1, 1,
0.4512214, 0.7457622, 1.291507, 0, 0.003921569, 1, 1,
0.4521863, -0.290778, -0.3487042, 0.003921569, 0, 1, 1,
0.4530892, 0.8996999, 1.466177, 0.007843138, 0, 1, 1,
0.4571878, -0.06547479, 1.612222, 0.01568628, 0, 1, 1,
0.4585442, 0.942933, -0.271447, 0.01960784, 0, 1, 1,
0.4588027, -0.9200245, 2.877578, 0.02745098, 0, 1, 1,
0.4602084, 0.5203082, -0.9051756, 0.03137255, 0, 1, 1,
0.4617341, -0.0694537, 1.559986, 0.03921569, 0, 1, 1,
0.4629214, -0.134127, 0.4225833, 0.04313726, 0, 1, 1,
0.4669752, 0.3295922, -0.1460929, 0.05098039, 0, 1, 1,
0.4671754, 0.6028512, -0.1630113, 0.05490196, 0, 1, 1,
0.4684713, 0.8403018, 0.4818249, 0.0627451, 0, 1, 1,
0.4695921, 0.7841094, -1.389076, 0.06666667, 0, 1, 1,
0.4709293, -0.754669, 2.001709, 0.07450981, 0, 1, 1,
0.474526, -0.2225936, 4.594982, 0.07843138, 0, 1, 1,
0.4797977, -1.647804, 3.528905, 0.08627451, 0, 1, 1,
0.4855097, -0.2448771, 2.638238, 0.09019608, 0, 1, 1,
0.4872623, -1.232518, 2.298561, 0.09803922, 0, 1, 1,
0.4901678, -0.8616157, 2.676856, 0.1058824, 0, 1, 1,
0.4915896, -2.555628, 1.171743, 0.1098039, 0, 1, 1,
0.4935541, 1.354568, 1.80227, 0.1176471, 0, 1, 1,
0.50395, -1.024719, 2.312869, 0.1215686, 0, 1, 1,
0.506387, 0.3302998, 1.688749, 0.1294118, 0, 1, 1,
0.5068933, -1.576828, 0.933704, 0.1333333, 0, 1, 1,
0.5078627, -0.09010553, 2.090815, 0.1411765, 0, 1, 1,
0.5091285, -0.2440621, 1.727728, 0.145098, 0, 1, 1,
0.5111199, 1.050482, 0.918655, 0.1529412, 0, 1, 1,
0.5225791, 0.7843891, 0.5507982, 0.1568628, 0, 1, 1,
0.523321, 0.2655988, 1.920655, 0.1647059, 0, 1, 1,
0.5260766, 1.108778, 1.237029, 0.1686275, 0, 1, 1,
0.5291186, -1.061089, 2.502563, 0.1764706, 0, 1, 1,
0.5302262, -0.4948307, 3.371902, 0.1803922, 0, 1, 1,
0.5360801, -1.471343, 3.409817, 0.1882353, 0, 1, 1,
0.5373747, 0.2414182, 0.5013863, 0.1921569, 0, 1, 1,
0.5381191, -2.073037, 3.888068, 0.2, 0, 1, 1,
0.5450835, -0.4916368, 3.078803, 0.2078431, 0, 1, 1,
0.5532615, 1.226846, 0.02109124, 0.2117647, 0, 1, 1,
0.5543123, -0.8345188, 1.308859, 0.2196078, 0, 1, 1,
0.5556049, -1.031048, 4.145319, 0.2235294, 0, 1, 1,
0.5566779, 3.235842, 0.1397394, 0.2313726, 0, 1, 1,
0.5708283, -1.120159, 1.506252, 0.2352941, 0, 1, 1,
0.5762904, -0.792381, 4.021905, 0.2431373, 0, 1, 1,
0.577776, -0.4075192, 1.637766, 0.2470588, 0, 1, 1,
0.5803312, 0.3022037, 1.253491, 0.254902, 0, 1, 1,
0.5848185, -0.4455774, 0.7448065, 0.2588235, 0, 1, 1,
0.5858324, 0.1080198, 2.185374, 0.2666667, 0, 1, 1,
0.5885229, 0.5118358, -0.3602577, 0.2705882, 0, 1, 1,
0.5906356, 0.242248, 1.850174, 0.2784314, 0, 1, 1,
0.5928484, 0.9419321, 0.7823434, 0.282353, 0, 1, 1,
0.592968, -0.5237845, 3.850221, 0.2901961, 0, 1, 1,
0.5955895, 1.121348, 2.34707, 0.2941177, 0, 1, 1,
0.5993974, -1.685364, 2.824135, 0.3019608, 0, 1, 1,
0.6003004, 0.7080869, -0.4724483, 0.3098039, 0, 1, 1,
0.6005061, 1.236121, -0.3540054, 0.3137255, 0, 1, 1,
0.6010886, 0.4779329, 1.448333, 0.3215686, 0, 1, 1,
0.6040078, -0.2806603, 1.553927, 0.3254902, 0, 1, 1,
0.606947, 1.366442, -0.1334525, 0.3333333, 0, 1, 1,
0.6074986, -1.484355, 2.777509, 0.3372549, 0, 1, 1,
0.6126268, 2.515966, 0.1081726, 0.345098, 0, 1, 1,
0.6132629, 0.3370376, 2.530858, 0.3490196, 0, 1, 1,
0.6156299, 2.008871, 0.01023415, 0.3568628, 0, 1, 1,
0.6190614, 0.5689434, 0.6133469, 0.3607843, 0, 1, 1,
0.6204178, 0.0856317, 2.579109, 0.3686275, 0, 1, 1,
0.6263902, -0.6916826, 2.741696, 0.372549, 0, 1, 1,
0.6267539, -1.288492, 4.020262, 0.3803922, 0, 1, 1,
0.6346835, 0.4465333, 1.535232, 0.3843137, 0, 1, 1,
0.638535, -0.9609292, 2.090886, 0.3921569, 0, 1, 1,
0.641768, 0.6914349, 1.003677, 0.3960784, 0, 1, 1,
0.6429414, 0.6851711, 2.40618, 0.4039216, 0, 1, 1,
0.647462, -0.3505256, 1.752445, 0.4117647, 0, 1, 1,
0.6475136, 1.732011, 0.4775823, 0.4156863, 0, 1, 1,
0.6510375, 1.863094, 0.1748628, 0.4235294, 0, 1, 1,
0.662531, 1.018476, 0.4665621, 0.427451, 0, 1, 1,
0.6687568, 0.3639314, 0.7578913, 0.4352941, 0, 1, 1,
0.6715568, 0.8527889, 0.2767659, 0.4392157, 0, 1, 1,
0.6725661, 0.05419984, 0.6170442, 0.4470588, 0, 1, 1,
0.6793689, 0.371101, 1.57414, 0.4509804, 0, 1, 1,
0.6906626, 1.721845, 1.067919, 0.4588235, 0, 1, 1,
0.6935232, -0.8750865, 1.776827, 0.4627451, 0, 1, 1,
0.694341, 0.6777116, 1.25149, 0.4705882, 0, 1, 1,
0.6982961, -0.7057148, 1.808802, 0.4745098, 0, 1, 1,
0.7058412, 0.8534358, 0.5689441, 0.4823529, 0, 1, 1,
0.7065086, -1.045926, 3.488776, 0.4862745, 0, 1, 1,
0.7080688, 1.370927, 1.151191, 0.4941176, 0, 1, 1,
0.7082602, 0.4843971, 1.229855, 0.5019608, 0, 1, 1,
0.7084598, -1.069832, 4.367874, 0.5058824, 0, 1, 1,
0.7087754, -0.1701578, 2.307508, 0.5137255, 0, 1, 1,
0.7087888, 2.169904, 2.898513, 0.5176471, 0, 1, 1,
0.7117246, 0.4888683, 0.7991809, 0.5254902, 0, 1, 1,
0.711789, 0.1786711, 1.470405, 0.5294118, 0, 1, 1,
0.7133716, -1.097876, 2.743379, 0.5372549, 0, 1, 1,
0.7158453, 0.6544414, -0.3724064, 0.5411765, 0, 1, 1,
0.7165152, -1.015589, 2.343983, 0.5490196, 0, 1, 1,
0.718533, 0.2250256, 0.7488738, 0.5529412, 0, 1, 1,
0.7205553, 1.148351, 0.5894703, 0.5607843, 0, 1, 1,
0.7207623, -0.1378279, 2.110415, 0.5647059, 0, 1, 1,
0.7267115, -0.9793721, 2.578248, 0.572549, 0, 1, 1,
0.7313622, -0.4699208, 1.026291, 0.5764706, 0, 1, 1,
0.7325416, 0.2121354, 3.101018, 0.5843138, 0, 1, 1,
0.7332246, -0.6301414, 1.829738, 0.5882353, 0, 1, 1,
0.7336814, 0.9110033, 0.8520731, 0.5960785, 0, 1, 1,
0.738068, 0.7859985, 1.274188, 0.6039216, 0, 1, 1,
0.7406517, 1.280819, 0.8684084, 0.6078432, 0, 1, 1,
0.7420702, 0.07072333, 3.083622, 0.6156863, 0, 1, 1,
0.7427654, -0.148116, 2.360213, 0.6196079, 0, 1, 1,
0.7431547, -0.7430078, 1.350235, 0.627451, 0, 1, 1,
0.7467374, 0.3643441, 0.7838149, 0.6313726, 0, 1, 1,
0.7468069, 0.7947479, -0.4803775, 0.6392157, 0, 1, 1,
0.7471787, -0.7010524, 2.944934, 0.6431373, 0, 1, 1,
0.7472881, -1.827691, 2.499915, 0.6509804, 0, 1, 1,
0.7476623, 0.5878991, 1.092732, 0.654902, 0, 1, 1,
0.7542074, 0.9056273, -0.3393722, 0.6627451, 0, 1, 1,
0.7566664, -0.8097454, 2.486914, 0.6666667, 0, 1, 1,
0.7604392, 0.7631046, 1.330613, 0.6745098, 0, 1, 1,
0.7618318, -1.004237, 2.630454, 0.6784314, 0, 1, 1,
0.7635653, 0.4374211, 1.954479, 0.6862745, 0, 1, 1,
0.7690901, 0.1265541, 1.724576, 0.6901961, 0, 1, 1,
0.7724527, -0.00457952, 0.4150743, 0.6980392, 0, 1, 1,
0.7772354, 0.07484729, 1.893121, 0.7058824, 0, 1, 1,
0.7797021, -0.3734711, 1.579839, 0.7098039, 0, 1, 1,
0.7804545, -0.2026558, 1.855318, 0.7176471, 0, 1, 1,
0.7843664, 1.182707, 0.2396285, 0.7215686, 0, 1, 1,
0.7845329, -0.4301387, 2.750109, 0.7294118, 0, 1, 1,
0.7856803, 0.01727927, 1.831166, 0.7333333, 0, 1, 1,
0.786089, -1.117378, 0.8556717, 0.7411765, 0, 1, 1,
0.790017, -0.839519, 2.178093, 0.7450981, 0, 1, 1,
0.7911394, -1.143197, 3.748427, 0.7529412, 0, 1, 1,
0.7936624, 0.09991309, 1.920635, 0.7568628, 0, 1, 1,
0.795262, -1.197958, 4.391706, 0.7647059, 0, 1, 1,
0.8001132, 1.549029, -0.7053748, 0.7686275, 0, 1, 1,
0.8134378, 1.799435, -1.336814, 0.7764706, 0, 1, 1,
0.815199, -1.457533, 2.48674, 0.7803922, 0, 1, 1,
0.8196878, 1.660764, 0.02471679, 0.7882353, 0, 1, 1,
0.8198239, -0.4555532, 0.1610629, 0.7921569, 0, 1, 1,
0.8349308, -1.075259, 2.710962, 0.8, 0, 1, 1,
0.8414488, -0.1142119, 2.225451, 0.8078431, 0, 1, 1,
0.841478, 0.8556965, 1.444305, 0.8117647, 0, 1, 1,
0.8424312, -0.4072274, 2.989386, 0.8196079, 0, 1, 1,
0.8442196, 0.1046322, 0.6186969, 0.8235294, 0, 1, 1,
0.8495609, 0.3272781, -1.188084, 0.8313726, 0, 1, 1,
0.861178, -1.392214, 2.862292, 0.8352941, 0, 1, 1,
0.8616566, -0.4322781, 1.859721, 0.8431373, 0, 1, 1,
0.8692905, 0.4938019, 1.021389, 0.8470588, 0, 1, 1,
0.8729575, -0.4626326, 0.7716959, 0.854902, 0, 1, 1,
0.879243, 0.3604409, 0.5342693, 0.8588235, 0, 1, 1,
0.8829399, -0.6531118, 4.394959, 0.8666667, 0, 1, 1,
0.884489, -0.1595358, 0.2714839, 0.8705882, 0, 1, 1,
0.8881638, -0.3621748, 1.842193, 0.8784314, 0, 1, 1,
0.8888278, 0.7318441, -0.1415208, 0.8823529, 0, 1, 1,
0.89057, -1.19392, 4.021539, 0.8901961, 0, 1, 1,
0.9067012, 0.1861251, 1.043647, 0.8941177, 0, 1, 1,
0.9123794, -0.1383767, 1.028212, 0.9019608, 0, 1, 1,
0.9130934, -0.4039404, 1.997261, 0.9098039, 0, 1, 1,
0.9200097, 2.477307, 1.111172, 0.9137255, 0, 1, 1,
0.9205213, -0.6262214, 2.506742, 0.9215686, 0, 1, 1,
0.9217819, 0.3806444, 0.1125952, 0.9254902, 0, 1, 1,
0.9246011, -1.225399, 2.478644, 0.9333333, 0, 1, 1,
0.9299898, -1.128692, 2.988873, 0.9372549, 0, 1, 1,
0.9309919, 0.6093893, 2.155492, 0.945098, 0, 1, 1,
0.9318283, 1.107006, 1.772918, 0.9490196, 0, 1, 1,
0.9332852, -1.355725, 2.789849, 0.9568627, 0, 1, 1,
0.9461059, -0.6810576, 0.1266555, 0.9607843, 0, 1, 1,
0.9462408, -1.474235, 2.346911, 0.9686275, 0, 1, 1,
0.9477686, 1.230507, 1.783592, 0.972549, 0, 1, 1,
0.9481215, -0.1974676, 2.262264, 0.9803922, 0, 1, 1,
0.9484812, -0.6046013, 1.408218, 0.9843137, 0, 1, 1,
0.9488339, -2.069807, 4.849384, 0.9921569, 0, 1, 1,
0.9535912, -0.06242745, 1.050337, 0.9960784, 0, 1, 1,
0.9549491, -0.1506746, 1.408542, 1, 0, 0.9960784, 1,
0.9573605, 0.4271702, 1.934679, 1, 0, 0.9882353, 1,
0.9575583, 1.602045, 0.9874312, 1, 0, 0.9843137, 1,
0.9676718, -0.01972686, 1.226483, 1, 0, 0.9764706, 1,
0.9720835, 0.5559123, 3.753591, 1, 0, 0.972549, 1,
0.976796, 1.086344, 0.832126, 1, 0, 0.9647059, 1,
0.9782325, -0.5023259, 2.08623, 1, 0, 0.9607843, 1,
0.9798808, -1.296164, 2.268192, 1, 0, 0.9529412, 1,
0.9806241, 1.089621, 0.6757842, 1, 0, 0.9490196, 1,
0.9842628, -0.7185734, 0.8478622, 1, 0, 0.9411765, 1,
0.9846775, -0.7698618, 2.774715, 1, 0, 0.9372549, 1,
0.9981369, 0.6985976, -0.843736, 1, 0, 0.9294118, 1,
1.00006, -0.7086592, 3.306066, 1, 0, 0.9254902, 1,
1.000489, 0.3721511, 1.897362, 1, 0, 0.9176471, 1,
1.01255, 2.263604, -0.9730963, 1, 0, 0.9137255, 1,
1.013311, -0.9122349, 1.52628, 1, 0, 0.9058824, 1,
1.0169, 0.7548918, 0.686989, 1, 0, 0.9019608, 1,
1.037153, 1.021298, 0.5184411, 1, 0, 0.8941177, 1,
1.040342, 1.934432, 0.110861, 1, 0, 0.8862745, 1,
1.040564, 0.1282866, -0.1041951, 1, 0, 0.8823529, 1,
1.042104, 0.9995114, 1.727146, 1, 0, 0.8745098, 1,
1.047303, -0.3906824, 2.102529, 1, 0, 0.8705882, 1,
1.054437, -0.3737824, 0.7495732, 1, 0, 0.8627451, 1,
1.05516, -1.221229, 3.364875, 1, 0, 0.8588235, 1,
1.055187, 0.5328525, 2.052073, 1, 0, 0.8509804, 1,
1.055877, 0.5169752, -0.7099922, 1, 0, 0.8470588, 1,
1.062245, -0.2242614, 2.084557, 1, 0, 0.8392157, 1,
1.062804, 1.106589, 1.680168, 1, 0, 0.8352941, 1,
1.066522, -2.995172, 3.521869, 1, 0, 0.827451, 1,
1.066817, 1.737487, 1.431991, 1, 0, 0.8235294, 1,
1.06928, -0.2160678, 3.524364, 1, 0, 0.8156863, 1,
1.076232, 1.854284, 1.004525, 1, 0, 0.8117647, 1,
1.081058, 1.426184, 0.4768197, 1, 0, 0.8039216, 1,
1.082397, 0.9100878, 1.486343, 1, 0, 0.7960784, 1,
1.082464, 2.030597, 2.507494, 1, 0, 0.7921569, 1,
1.082554, 0.1003793, 0.05427028, 1, 0, 0.7843137, 1,
1.084123, -0.1024887, 2.070345, 1, 0, 0.7803922, 1,
1.084397, -0.05877258, 1.728916, 1, 0, 0.772549, 1,
1.085987, 0.4686489, -0.2491175, 1, 0, 0.7686275, 1,
1.096313, 0.2951326, -0.562287, 1, 0, 0.7607843, 1,
1.100911, -0.2590105, 2.254514, 1, 0, 0.7568628, 1,
1.10329, -0.5317765, 1.884022, 1, 0, 0.7490196, 1,
1.10557, -0.282803, 2.614593, 1, 0, 0.7450981, 1,
1.109333, 0.7682807, 0.003354551, 1, 0, 0.7372549, 1,
1.124082, -0.5008923, 2.153752, 1, 0, 0.7333333, 1,
1.124612, -0.4263529, 1.033412, 1, 0, 0.7254902, 1,
1.142951, 0.6434524, 0.9783158, 1, 0, 0.7215686, 1,
1.143576, -0.003627073, 1.756303, 1, 0, 0.7137255, 1,
1.149677, -1.133803, 3.09732, 1, 0, 0.7098039, 1,
1.150506, 0.6820438, 0.7765368, 1, 0, 0.7019608, 1,
1.15205, -0.9910482, 1.813421, 1, 0, 0.6941177, 1,
1.154491, -1.587156, 3.907642, 1, 0, 0.6901961, 1,
1.155053, -0.9326461, 2.394319, 1, 0, 0.682353, 1,
1.155598, -0.3160157, 1.497859, 1, 0, 0.6784314, 1,
1.158053, 0.5747068, 0.05328774, 1, 0, 0.6705883, 1,
1.160907, 0.002970082, 1.821671, 1, 0, 0.6666667, 1,
1.174576, 0.0762651, 0.9317794, 1, 0, 0.6588235, 1,
1.176408, 0.4196602, 1.070168, 1, 0, 0.654902, 1,
1.17726, -1.308638, 3.06227, 1, 0, 0.6470588, 1,
1.180179, 0.02646126, 2.283985, 1, 0, 0.6431373, 1,
1.184712, 0.2469548, 1.396385, 1, 0, 0.6352941, 1,
1.186191, 0.3104924, 0.1616533, 1, 0, 0.6313726, 1,
1.186857, -0.9835879, 2.20099, 1, 0, 0.6235294, 1,
1.20919, 0.7501737, 0.9299382, 1, 0, 0.6196079, 1,
1.226189, -0.7063178, 2.511641, 1, 0, 0.6117647, 1,
1.229236, -0.4438488, 0.9755382, 1, 0, 0.6078432, 1,
1.23107, -1.253303, 0.7030557, 1, 0, 0.6, 1,
1.231494, 2.06116, 0.2108537, 1, 0, 0.5921569, 1,
1.233157, -0.2285099, 1.697877, 1, 0, 0.5882353, 1,
1.238954, 1.162587, -1.108421, 1, 0, 0.5803922, 1,
1.245458, 0.2070682, 0.5629876, 1, 0, 0.5764706, 1,
1.256987, -0.07934471, 0.7660807, 1, 0, 0.5686275, 1,
1.261547, 0.303874, 2.32246, 1, 0, 0.5647059, 1,
1.269486, -1.219382, 2.582393, 1, 0, 0.5568628, 1,
1.271799, -0.6910551, 0.2935865, 1, 0, 0.5529412, 1,
1.272914, 0.6367169, 0.5514039, 1, 0, 0.5450981, 1,
1.29185, -0.3495126, 1.020107, 1, 0, 0.5411765, 1,
1.301603, 0.5162165, -0.2336892, 1, 0, 0.5333334, 1,
1.305366, -0.08885399, 0.6259382, 1, 0, 0.5294118, 1,
1.307262, -0.7278666, 3.811985, 1, 0, 0.5215687, 1,
1.315058, -0.4995632, 1.602147, 1, 0, 0.5176471, 1,
1.316364, -0.7884361, 1.16217, 1, 0, 0.509804, 1,
1.317786, 1.210444, 0.4286334, 1, 0, 0.5058824, 1,
1.320637, 1.004306, -0.9017073, 1, 0, 0.4980392, 1,
1.328949, -2.296008, 2.33042, 1, 0, 0.4901961, 1,
1.336394, -0.1456946, 1.818775, 1, 0, 0.4862745, 1,
1.337607, 0.929637, 1.940845, 1, 0, 0.4784314, 1,
1.341372, -0.9297263, -0.6239555, 1, 0, 0.4745098, 1,
1.344039, 0.2012314, -0.2318424, 1, 0, 0.4666667, 1,
1.350768, 1.322742, 2.337915, 1, 0, 0.4627451, 1,
1.36816, 0.108397, 0.09121439, 1, 0, 0.454902, 1,
1.369783, -1.02511, 2.575168, 1, 0, 0.4509804, 1,
1.372029, 0.2694255, 0.9283349, 1, 0, 0.4431373, 1,
1.37364, -0.84141, 4.294974, 1, 0, 0.4392157, 1,
1.379705, 0.6749486, 0.7951953, 1, 0, 0.4313726, 1,
1.385259, 1.190649, 1.447752, 1, 0, 0.427451, 1,
1.392731, 0.1859862, 1.926953, 1, 0, 0.4196078, 1,
1.396536, 0.3799285, 1.786396, 1, 0, 0.4156863, 1,
1.401189, -0.01747623, 1.78762, 1, 0, 0.4078431, 1,
1.401916, 0.9293432, -0.7383264, 1, 0, 0.4039216, 1,
1.407565, 0.7972432, 0.2841419, 1, 0, 0.3960784, 1,
1.418674, -2.534801, 2.046297, 1, 0, 0.3882353, 1,
1.420597, -0.4498963, 3.155421, 1, 0, 0.3843137, 1,
1.425159, -0.9376357, 1.807399, 1, 0, 0.3764706, 1,
1.433331, -1.120109, 0.4940285, 1, 0, 0.372549, 1,
1.433814, -1.163038, 1.983593, 1, 0, 0.3647059, 1,
1.455657, -0.6498235, 0.5974619, 1, 0, 0.3607843, 1,
1.461718, 1.790103, 4.535849, 1, 0, 0.3529412, 1,
1.469994, 1.186146, 1.087084, 1, 0, 0.3490196, 1,
1.472588, -0.5815253, 2.300202, 1, 0, 0.3411765, 1,
1.475455, 1.081951, 0.4755887, 1, 0, 0.3372549, 1,
1.476691, -0.6753422, 1.284513, 1, 0, 0.3294118, 1,
1.477143, 1.527842, 0.3939641, 1, 0, 0.3254902, 1,
1.494251, -0.1075731, 2.71515, 1, 0, 0.3176471, 1,
1.501731, 0.6409743, 1.714887, 1, 0, 0.3137255, 1,
1.513808, 1.322168, 2.123659, 1, 0, 0.3058824, 1,
1.529358, 0.1891718, 1.738401, 1, 0, 0.2980392, 1,
1.543114, 0.1546711, 1.927204, 1, 0, 0.2941177, 1,
1.549681, 0.8788156, 0.2956614, 1, 0, 0.2862745, 1,
1.552094, 1.491432, 0.9868248, 1, 0, 0.282353, 1,
1.564453, 1.575294, 1.737528, 1, 0, 0.2745098, 1,
1.574911, -0.5806124, 2.476658, 1, 0, 0.2705882, 1,
1.57696, 0.6602682, 1.67758, 1, 0, 0.2627451, 1,
1.578441, 0.5169538, 1.750127, 1, 0, 0.2588235, 1,
1.585625, 0.6295586, 2.56793, 1, 0, 0.2509804, 1,
1.59235, 1.387624, 0.7127265, 1, 0, 0.2470588, 1,
1.601792, -0.02790822, 1.513145, 1, 0, 0.2392157, 1,
1.630641, 0.7998626, 2.624237, 1, 0, 0.2352941, 1,
1.638072, -0.1524542, 2.228425, 1, 0, 0.227451, 1,
1.654241, -0.4063289, 1.688147, 1, 0, 0.2235294, 1,
1.726043, -0.4606258, 1.018659, 1, 0, 0.2156863, 1,
1.733238, 2.357826, -0.2015306, 1, 0, 0.2117647, 1,
1.760137, -0.3749024, 2.006447, 1, 0, 0.2039216, 1,
1.772214, -0.5775765, 1.180114, 1, 0, 0.1960784, 1,
1.782713, 0.585018, 1.81817, 1, 0, 0.1921569, 1,
1.785511, -1.90232, 3.022556, 1, 0, 0.1843137, 1,
1.828494, -0.1136911, 3.506705, 1, 0, 0.1803922, 1,
1.868365, 2.040312, 1.006093, 1, 0, 0.172549, 1,
1.869522, -1.483942, 3.223163, 1, 0, 0.1686275, 1,
1.872578, 0.9704806, 1.825849, 1, 0, 0.1607843, 1,
1.873912, -1.674928, 2.8948, 1, 0, 0.1568628, 1,
1.874155, -0.294668, 1.527687, 1, 0, 0.1490196, 1,
1.895605, 1.191445, 0.6465, 1, 0, 0.145098, 1,
1.921338, 1.210875, 1.137162, 1, 0, 0.1372549, 1,
1.930517, -0.3572508, -0.364703, 1, 0, 0.1333333, 1,
1.932459, -0.8731095, 1.396919, 1, 0, 0.1254902, 1,
1.945089, 0.385039, 2.150637, 1, 0, 0.1215686, 1,
1.988441, -1.487908, 2.52839, 1, 0, 0.1137255, 1,
2.003569, 0.3921575, 0.8505698, 1, 0, 0.1098039, 1,
2.011254, 0.06699276, 0.9106509, 1, 0, 0.1019608, 1,
2.088331, 0.08752308, 2.361781, 1, 0, 0.09411765, 1,
2.099725, 1.707064, 0.3846729, 1, 0, 0.09019608, 1,
2.114605, -0.626507, 2.234824, 1, 0, 0.08235294, 1,
2.130762, 0.7445011, 2.300961, 1, 0, 0.07843138, 1,
2.156302, 0.2169499, 1.390455, 1, 0, 0.07058824, 1,
2.159707, 0.3086371, 2.751743, 1, 0, 0.06666667, 1,
2.175571, 0.3040711, 2.764986, 1, 0, 0.05882353, 1,
2.193007, -1.143061, 2.626697, 1, 0, 0.05490196, 1,
2.200154, 0.3229251, 2.200489, 1, 0, 0.04705882, 1,
2.209711, 0.3134286, 1.943476, 1, 0, 0.04313726, 1,
2.488684, -0.2758879, 2.783101, 1, 0, 0.03529412, 1,
2.701038, -0.4996696, 1.640627, 1, 0, 0.03137255, 1,
2.714323, 0.1844095, 1.70947, 1, 0, 0.02352941, 1,
2.748317, 0.03974271, -0.6092045, 1, 0, 0.01960784, 1,
2.80077, -1.508737, 2.585701, 1, 0, 0.01176471, 1,
2.873315, -0.9295891, 0.9876249, 1, 0, 0.007843138, 1
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
-0.03269386, -4.414365, -8.329436, 0, -0.5, 0.5, 0.5,
-0.03269386, -4.414365, -8.329436, 1, -0.5, 0.5, 0.5,
-0.03269386, -4.414365, -8.329436, 1, 1.5, 0.5, 0.5,
-0.03269386, -4.414365, -8.329436, 0, 1.5, 0.5, 0.5
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
-3.92384, -0.0348748, -8.329436, 0, -0.5, 0.5, 0.5,
-3.92384, -0.0348748, -8.329436, 1, -0.5, 0.5, 0.5,
-3.92384, -0.0348748, -8.329436, 1, 1.5, 0.5, 0.5,
-3.92384, -0.0348748, -8.329436, 0, 1.5, 0.5, 0.5
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
-3.92384, -4.414365, -0.39289, 0, -0.5, 0.5, 0.5,
-3.92384, -4.414365, -0.39289, 1, -0.5, 0.5, 0.5,
-3.92384, -4.414365, -0.39289, 1, 1.5, 0.5, 0.5,
-3.92384, -4.414365, -0.39289, 0, 1.5, 0.5, 0.5
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
-2, -3.403713, -6.497925,
2, -3.403713, -6.497925,
-2, -3.403713, -6.497925,
-2, -3.572155, -6.803177,
-1, -3.403713, -6.497925,
-1, -3.572155, -6.803177,
0, -3.403713, -6.497925,
0, -3.572155, -6.803177,
1, -3.403713, -6.497925,
1, -3.572155, -6.803177,
2, -3.403713, -6.497925,
2, -3.572155, -6.803177
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
-2, -3.909039, -7.413681, 0, -0.5, 0.5, 0.5,
-2, -3.909039, -7.413681, 1, -0.5, 0.5, 0.5,
-2, -3.909039, -7.413681, 1, 1.5, 0.5, 0.5,
-2, -3.909039, -7.413681, 0, 1.5, 0.5, 0.5,
-1, -3.909039, -7.413681, 0, -0.5, 0.5, 0.5,
-1, -3.909039, -7.413681, 1, -0.5, 0.5, 0.5,
-1, -3.909039, -7.413681, 1, 1.5, 0.5, 0.5,
-1, -3.909039, -7.413681, 0, 1.5, 0.5, 0.5,
0, -3.909039, -7.413681, 0, -0.5, 0.5, 0.5,
0, -3.909039, -7.413681, 1, -0.5, 0.5, 0.5,
0, -3.909039, -7.413681, 1, 1.5, 0.5, 0.5,
0, -3.909039, -7.413681, 0, 1.5, 0.5, 0.5,
1, -3.909039, -7.413681, 0, -0.5, 0.5, 0.5,
1, -3.909039, -7.413681, 1, -0.5, 0.5, 0.5,
1, -3.909039, -7.413681, 1, 1.5, 0.5, 0.5,
1, -3.909039, -7.413681, 0, 1.5, 0.5, 0.5,
2, -3.909039, -7.413681, 0, -0.5, 0.5, 0.5,
2, -3.909039, -7.413681, 1, -0.5, 0.5, 0.5,
2, -3.909039, -7.413681, 1, 1.5, 0.5, 0.5,
2, -3.909039, -7.413681, 0, 1.5, 0.5, 0.5
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
-3.025883, -3, -6.497925,
-3.025883, 3, -6.497925,
-3.025883, -3, -6.497925,
-3.175542, -3, -6.803177,
-3.025883, -2, -6.497925,
-3.175542, -2, -6.803177,
-3.025883, -1, -6.497925,
-3.175542, -1, -6.803177,
-3.025883, 0, -6.497925,
-3.175542, 0, -6.803177,
-3.025883, 1, -6.497925,
-3.175542, 1, -6.803177,
-3.025883, 2, -6.497925,
-3.175542, 2, -6.803177,
-3.025883, 3, -6.497925,
-3.175542, 3, -6.803177
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
-3.474861, -3, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, -3, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, -3, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, -3, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, -2, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, -2, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, -2, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, -2, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, -1, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, -1, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, -1, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, -1, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, 0, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, 0, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, 0, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, 0, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, 1, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, 1, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, 1, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, 1, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, 2, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, 2, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, 2, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, 2, -7.413681, 0, 1.5, 0.5, 0.5,
-3.474861, 3, -7.413681, 0, -0.5, 0.5, 0.5,
-3.474861, 3, -7.413681, 1, -0.5, 0.5, 0.5,
-3.474861, 3, -7.413681, 1, 1.5, 0.5, 0.5,
-3.474861, 3, -7.413681, 0, 1.5, 0.5, 0.5
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
-3.025883, -3.403713, -6,
-3.025883, -3.403713, 4,
-3.025883, -3.403713, -6,
-3.175542, -3.572155, -6,
-3.025883, -3.403713, -4,
-3.175542, -3.572155, -4,
-3.025883, -3.403713, -2,
-3.175542, -3.572155, -2,
-3.025883, -3.403713, 0,
-3.175542, -3.572155, 0,
-3.025883, -3.403713, 2,
-3.175542, -3.572155, 2,
-3.025883, -3.403713, 4,
-3.175542, -3.572155, 4
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
-3.474861, -3.909039, -6, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -6, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -6, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, -6, 0, 1.5, 0.5, 0.5,
-3.474861, -3.909039, -4, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -4, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -4, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, -4, 0, 1.5, 0.5, 0.5,
-3.474861, -3.909039, -2, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -2, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, -2, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, -2, 0, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 0, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 0, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 0, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 0, 0, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 2, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 2, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 2, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 2, 0, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 4, 0, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 4, 1, -0.5, 0.5, 0.5,
-3.474861, -3.909039, 4, 1, 1.5, 0.5, 0.5,
-3.474861, -3.909039, 4, 0, 1.5, 0.5, 0.5
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
-3.025883, -3.403713, -6.497925,
-3.025883, 3.333964, -6.497925,
-3.025883, -3.403713, 5.712145,
-3.025883, 3.333964, 5.712145,
-3.025883, -3.403713, -6.497925,
-3.025883, -3.403713, 5.712145,
-3.025883, 3.333964, -6.497925,
-3.025883, 3.333964, 5.712145,
-3.025883, -3.403713, -6.497925,
2.960495, -3.403713, -6.497925,
-3.025883, -3.403713, 5.712145,
2.960495, -3.403713, 5.712145,
-3.025883, 3.333964, -6.497925,
2.960495, 3.333964, -6.497925,
-3.025883, 3.333964, 5.712145,
2.960495, 3.333964, 5.712145,
2.960495, -3.403713, -6.497925,
2.960495, 3.333964, -6.497925,
2.960495, -3.403713, 5.712145,
2.960495, 3.333964, 5.712145,
2.960495, -3.403713, -6.497925,
2.960495, -3.403713, 5.712145,
2.960495, 3.333964, -6.497925,
2.960495, 3.333964, 5.712145
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
var radius = 8.103828;
var distance = 36.05484;
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
mvMatrix.translate( 0.03269386, 0.0348748, 0.39289 );
mvMatrix.scale( 1.463659, 1.300451, 0.7176058 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.05484);
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
selfotel<-read.table("selfotel.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-selfotel$V2
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
y<-selfotel$V3
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
z<-selfotel$V4
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
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
-2.938703, 0.5294818, -0.6340026, 0, 0, 1, 1, 1,
-2.917693, -0.6575518, -0.5995837, 1, 0, 0, 1, 1,
-2.855417, 0.1008285, -1.139461, 1, 0, 0, 1, 1,
-2.737094, -1.302285, -0.7108741, 1, 0, 0, 1, 1,
-2.696868, -0.1586846, -1.533576, 1, 0, 0, 1, 1,
-2.666791, 1.104669, -1.850393, 1, 0, 0, 1, 1,
-2.624161, -0.7748122, -1.480476, 0, 0, 0, 1, 1,
-2.597333, -0.6999696, 0.4311478, 0, 0, 0, 1, 1,
-2.579583, -0.7835419, -2.168856, 0, 0, 0, 1, 1,
-2.567986, -1.564679, -5.177174, 0, 0, 0, 1, 1,
-2.549085, 1.164688, 0.06708354, 0, 0, 0, 1, 1,
-2.435615, -0.9889675, -2.277448, 0, 0, 0, 1, 1,
-2.348953, -0.3643182, -2.934932, 0, 0, 0, 1, 1,
-2.348098, -0.02727981, -2.859924, 1, 1, 1, 1, 1,
-2.250149, 2.302741, -1.666955, 1, 1, 1, 1, 1,
-2.242522, -1.023031, -3.411386, 1, 1, 1, 1, 1,
-2.19963, 0.4782107, -3.850139, 1, 1, 1, 1, 1,
-2.177637, -0.7263125, -1.869742, 1, 1, 1, 1, 1,
-2.159797, 0.7325801, -0.8321964, 1, 1, 1, 1, 1,
-2.151945, -0.5695177, -1.164207, 1, 1, 1, 1, 1,
-2.115388, -1.060027, -2.604951, 1, 1, 1, 1, 1,
-2.105206, 0.03145778, -3.353913, 1, 1, 1, 1, 1,
-2.034426, 0.9088697, -1.892828, 1, 1, 1, 1, 1,
-2.031041, -0.6196846, -0.2810557, 1, 1, 1, 1, 1,
-2.029824, -0.247331, -0.6517773, 1, 1, 1, 1, 1,
-2.008691, -0.1264894, -2.150846, 1, 1, 1, 1, 1,
-2.000874, -0.7880215, -2.296757, 1, 1, 1, 1, 1,
-1.999304, -0.5202404, -3.988872, 1, 1, 1, 1, 1,
-1.998543, 0.05956679, -1.946059, 0, 0, 1, 1, 1,
-1.996019, 0.1020534, 0.2667345, 1, 0, 0, 1, 1,
-1.995375, -0.0634861, -0.1618218, 1, 0, 0, 1, 1,
-1.993383, 1.614869, -2.466462, 1, 0, 0, 1, 1,
-1.988602, 1.03051, -0.4197379, 1, 0, 0, 1, 1,
-1.975916, -1.175204, -4.34244, 1, 0, 0, 1, 1,
-1.957613, -0.4203158, -1.613436, 0, 0, 0, 1, 1,
-1.953673, 1.75607, -2.121518, 0, 0, 0, 1, 1,
-1.945355, -0.04933195, -1.523434, 0, 0, 0, 1, 1,
-1.92424, 0.74942, -1.533422, 0, 0, 0, 1, 1,
-1.920422, -0.2772636, -1.990177, 0, 0, 0, 1, 1,
-1.89185, 1.599669, 1.354414, 0, 0, 0, 1, 1,
-1.885824, -0.4179283, -0.8253505, 0, 0, 0, 1, 1,
-1.882806, -0.7083082, -1.866487, 1, 1, 1, 1, 1,
-1.872392, -2.545548, -0.8956669, 1, 1, 1, 1, 1,
-1.826767, -0.5496503, -2.078238, 1, 1, 1, 1, 1,
-1.816277, 0.08561531, -0.8086158, 1, 1, 1, 1, 1,
-1.799012, -0.9134853, -1.523493, 1, 1, 1, 1, 1,
-1.791732, 0.0170026, -2.386804, 1, 1, 1, 1, 1,
-1.761222, -1.706169, -2.20342, 1, 1, 1, 1, 1,
-1.730069, 0.6324365, -2.190776, 1, 1, 1, 1, 1,
-1.729233, 0.1931573, 0.4656428, 1, 1, 1, 1, 1,
-1.684581, -1.551596, -2.03144, 1, 1, 1, 1, 1,
-1.671262, -0.6959182, -1.458779, 1, 1, 1, 1, 1,
-1.654924, 0.6220448, 0.5194448, 1, 1, 1, 1, 1,
-1.636112, 0.06845217, -1.413037, 1, 1, 1, 1, 1,
-1.624371, -0.2317472, -2.290058, 1, 1, 1, 1, 1,
-1.623688, -0.358588, -1.773106, 1, 1, 1, 1, 1,
-1.621096, 0.5327104, -0.186308, 0, 0, 1, 1, 1,
-1.608008, 0.4823289, -2.615841, 1, 0, 0, 1, 1,
-1.586756, -0.01069924, -0.6162379, 1, 0, 0, 1, 1,
-1.575387, 0.7078347, -0.4766574, 1, 0, 0, 1, 1,
-1.569303, 0.9233319, -0.5302018, 1, 0, 0, 1, 1,
-1.561403, 1.423139, -1.751262, 1, 0, 0, 1, 1,
-1.55882, 1.006472, -0.8663779, 0, 0, 0, 1, 1,
-1.545618, -0.9363481, -0.6032408, 0, 0, 0, 1, 1,
-1.524393, 0.809863, 0.8373563, 0, 0, 0, 1, 1,
-1.498496, 0.2627946, -1.864596, 0, 0, 0, 1, 1,
-1.491415, 0.4283418, -1.466267, 0, 0, 0, 1, 1,
-1.48109, 0.8335498, -1.298744, 0, 0, 0, 1, 1,
-1.47337, -1.021543, -1.815008, 0, 0, 0, 1, 1,
-1.472584, 0.6330032, -1.208624, 1, 1, 1, 1, 1,
-1.46664, -0.5634843, -0.2787208, 1, 1, 1, 1, 1,
-1.462903, 0.04979743, -0.9280089, 1, 1, 1, 1, 1,
-1.456429, 0.7288994, -1.16511, 1, 1, 1, 1, 1,
-1.450591, 0.6267812, -0.3162019, 1, 1, 1, 1, 1,
-1.429797, -0.6343299, -2.608643, 1, 1, 1, 1, 1,
-1.42943, -1.355247, -2.390088, 1, 1, 1, 1, 1,
-1.418353, -0.5750256, -2.614856, 1, 1, 1, 1, 1,
-1.414276, 0.4108014, -0.9928074, 1, 1, 1, 1, 1,
-1.405074, -0.1402337, -1.913458, 1, 1, 1, 1, 1,
-1.394408, 0.58437, 0.4186738, 1, 1, 1, 1, 1,
-1.389999, 2.110347, -0.822548, 1, 1, 1, 1, 1,
-1.385322, 0.05849007, -0.4573206, 1, 1, 1, 1, 1,
-1.384047, -0.4814721, -2.63685, 1, 1, 1, 1, 1,
-1.376716, 0.4089947, -1.077013, 1, 1, 1, 1, 1,
-1.356437, -0.4345051, -2.25964, 0, 0, 1, 1, 1,
-1.353276, -1.058779, -3.764384, 1, 0, 0, 1, 1,
-1.349601, -0.6555457, -3.305442, 1, 0, 0, 1, 1,
-1.347707, 0.37958, -0.8059239, 1, 0, 0, 1, 1,
-1.334486, -1.623444, -2.220621, 1, 0, 0, 1, 1,
-1.33382, -0.08655825, -1.265144, 1, 0, 0, 1, 1,
-1.328525, -0.3377099, -2.297436, 0, 0, 0, 1, 1,
-1.312153, -0.01148023, -1.268006, 0, 0, 0, 1, 1,
-1.303398, 0.001662146, -1.053246, 0, 0, 0, 1, 1,
-1.292144, 2.081186, 0.9805118, 0, 0, 0, 1, 1,
-1.278113, -0.6648497, -1.5016, 0, 0, 0, 1, 1,
-1.275493, -0.9237993, -3.562833, 0, 0, 0, 1, 1,
-1.270715, -0.7785029, -2.967016, 0, 0, 0, 1, 1,
-1.26861, -1.301344, -2.109813, 1, 1, 1, 1, 1,
-1.267781, -0.02053061, -3.337347, 1, 1, 1, 1, 1,
-1.261377, -0.3338781, -2.814042, 1, 1, 1, 1, 1,
-1.248717, -1.329347, -0.3831918, 1, 1, 1, 1, 1,
-1.246201, 0.9887243, -0.01671697, 1, 1, 1, 1, 1,
-1.229262, 1.019948, -0.4903506, 1, 1, 1, 1, 1,
-1.225741, 0.2228451, -1.621843, 1, 1, 1, 1, 1,
-1.222821, 0.3470869, -1.271276, 1, 1, 1, 1, 1,
-1.212754, 0.07641621, -0.120474, 1, 1, 1, 1, 1,
-1.201894, -1.188628, -0.6368715, 1, 1, 1, 1, 1,
-1.200516, -0.62039, -2.694847, 1, 1, 1, 1, 1,
-1.184612, -0.8795066, -2.62866, 1, 1, 1, 1, 1,
-1.183922, -0.1720396, -1.835698, 1, 1, 1, 1, 1,
-1.180886, -0.5175983, -0.9112482, 1, 1, 1, 1, 1,
-1.17909, 0.6951137, -2.169187, 1, 1, 1, 1, 1,
-1.164953, 1.085495, 0.2513908, 0, 0, 1, 1, 1,
-1.160831, 0.9918691, 0.499115, 1, 0, 0, 1, 1,
-1.152684, -0.6415511, -1.958867, 1, 0, 0, 1, 1,
-1.150604, -0.3590963, -0.6272874, 1, 0, 0, 1, 1,
-1.14793, 0.3392012, -0.5972461, 1, 0, 0, 1, 1,
-1.143638, -1.537133, -1.850646, 1, 0, 0, 1, 1,
-1.136665, 0.6463163, -0.1996558, 0, 0, 0, 1, 1,
-1.13165, 0.7375376, -2.720536, 0, 0, 0, 1, 1,
-1.124761, -1.844028, -0.936332, 0, 0, 0, 1, 1,
-1.12274, 0.9780398, 0.107142, 0, 0, 0, 1, 1,
-1.11795, 1.216372, -1.238827, 0, 0, 0, 1, 1,
-1.106964, 0.9419919, -0.7472613, 0, 0, 0, 1, 1,
-1.097486, 0.337902, -2.230198, 0, 0, 0, 1, 1,
-1.088386, 0.09388711, -2.643354, 1, 1, 1, 1, 1,
-1.088124, -1.158291, -2.576082, 1, 1, 1, 1, 1,
-1.085152, 0.6797673, -1.94022, 1, 1, 1, 1, 1,
-1.073307, -0.2121872, -1.285461, 1, 1, 1, 1, 1,
-1.071868, 0.9167611, -1.364656, 1, 1, 1, 1, 1,
-1.06664, 0.406281, 1.084135, 1, 1, 1, 1, 1,
-1.065162, -0.9070567, -1.695634, 1, 1, 1, 1, 1,
-1.058854, 1.250824, 0.8951203, 1, 1, 1, 1, 1,
-1.058706, -0.6160732, -2.629941, 1, 1, 1, 1, 1,
-1.058369, -0.227142, -1.132767, 1, 1, 1, 1, 1,
-1.055395, -1.991775, -2.379539, 1, 1, 1, 1, 1,
-1.046615, -0.9896481, -4.936236, 1, 1, 1, 1, 1,
-1.035628, -0.863848, -3.207666, 1, 1, 1, 1, 1,
-1.028459, -1.58892, -4.027362, 1, 1, 1, 1, 1,
-1.023984, 0.2778599, -1.764729, 1, 1, 1, 1, 1,
-1.013984, 0.8998924, -1.906343, 0, 0, 1, 1, 1,
-1.01332, 0.8403856, -0.8800811, 1, 0, 0, 1, 1,
-1.009309, 0.5061159, -0.5656567, 1, 0, 0, 1, 1,
-1.002907, 0.1863207, -1.136853, 1, 0, 0, 1, 1,
-1.001877, -0.08496673, -1.931744, 1, 0, 0, 1, 1,
-0.9931527, -0.5916962, -1.250017, 1, 0, 0, 1, 1,
-0.9859717, -2.477831, -0.8363858, 0, 0, 0, 1, 1,
-0.981939, 0.1993002, -2.007083, 0, 0, 0, 1, 1,
-0.9798113, -1.609174, -3.262298, 0, 0, 0, 1, 1,
-0.976127, 1.084385, -0.2726721, 0, 0, 0, 1, 1,
-0.9759212, -1.008893, -2.164369, 0, 0, 0, 1, 1,
-0.9753233, 1.584621, -0.4514276, 0, 0, 0, 1, 1,
-0.9719563, 1.652766, -0.2495971, 0, 0, 0, 1, 1,
-0.9711953, -0.1626035, -1.790845, 1, 1, 1, 1, 1,
-0.968439, 0.6403838, -2.632648, 1, 1, 1, 1, 1,
-0.9611985, 1.593995, -1.748316, 1, 1, 1, 1, 1,
-0.9605267, -0.2431546, -2.084237, 1, 1, 1, 1, 1,
-0.957332, 1.284895, 0.06813612, 1, 1, 1, 1, 1,
-0.9547381, -0.3115851, -0.927866, 1, 1, 1, 1, 1,
-0.9406972, -1.752514, -2.971576, 1, 1, 1, 1, 1,
-0.9344192, -1.156894, -1.7152, 1, 1, 1, 1, 1,
-0.9315418, 0.9255433, -1.87468, 1, 1, 1, 1, 1,
-0.9283176, -0.7185719, -1.517843, 1, 1, 1, 1, 1,
-0.9226348, -1.861882, -3.575926, 1, 1, 1, 1, 1,
-0.9197773, 1.122162, 0.4803261, 1, 1, 1, 1, 1,
-0.9160274, 1.312301, -1.319062, 1, 1, 1, 1, 1,
-0.9125686, 0.7992335, -0.9764747, 1, 1, 1, 1, 1,
-0.9114473, -1.643291, -2.010141, 1, 1, 1, 1, 1,
-0.9099297, 1.43367, -0.5769048, 0, 0, 1, 1, 1,
-0.8992822, -0.9613305, -1.745709, 1, 0, 0, 1, 1,
-0.8984843, 0.3325087, -0.6488078, 1, 0, 0, 1, 1,
-0.8975784, -0.4202564, -1.947558, 1, 0, 0, 1, 1,
-0.8972337, 1.028177, 1.250614, 1, 0, 0, 1, 1,
-0.8946288, 0.4596839, -0.5530825, 1, 0, 0, 1, 1,
-0.8939193, -0.6873441, -0.832384, 0, 0, 0, 1, 1,
-0.8937867, 0.2831601, -3.498125, 0, 0, 0, 1, 1,
-0.8905788, -0.04730045, -1.170881, 0, 0, 0, 1, 1,
-0.8896481, 0.4221331, -1.729256, 0, 0, 0, 1, 1,
-0.885973, -0.5739582, -2.861129, 0, 0, 0, 1, 1,
-0.8789772, 0.3144959, -0.7192932, 0, 0, 0, 1, 1,
-0.8768274, 0.8411452, -0.948, 0, 0, 0, 1, 1,
-0.8677094, 0.1758304, 1.012862, 1, 1, 1, 1, 1,
-0.8676211, 1.814873, -1.485189, 1, 1, 1, 1, 1,
-0.8636411, -0.6225843, -1.287982, 1, 1, 1, 1, 1,
-0.8627266, 1.272658, -1.483031, 1, 1, 1, 1, 1,
-0.8617924, -1.645354, -1.602505, 1, 1, 1, 1, 1,
-0.8582998, -0.6023965, -1.752359, 1, 1, 1, 1, 1,
-0.8491477, 0.8267778, 0.1271305, 1, 1, 1, 1, 1,
-0.8487275, 0.7660024, -0.5696977, 1, 1, 1, 1, 1,
-0.8487063, 0.286816, -0.164019, 1, 1, 1, 1, 1,
-0.8425633, 0.2157543, -1.072151, 1, 1, 1, 1, 1,
-0.8401905, 0.2772228, 0.06331868, 1, 1, 1, 1, 1,
-0.8382483, -1.052836, -0.3281396, 1, 1, 1, 1, 1,
-0.8378739, -2.462154, -2.639525, 1, 1, 1, 1, 1,
-0.8377305, 2.25859, -0.08183926, 1, 1, 1, 1, 1,
-0.8360007, 0.8505805, -0.3457062, 1, 1, 1, 1, 1,
-0.8349198, -0.2879036, -1.746223, 0, 0, 1, 1, 1,
-0.8314564, -0.6162454, -3.036106, 1, 0, 0, 1, 1,
-0.8306695, 0.2753381, -1.243281, 1, 0, 0, 1, 1,
-0.8235421, 1.175834, -1.304471, 1, 0, 0, 1, 1,
-0.823024, 1.158696, -2.139175, 1, 0, 0, 1, 1,
-0.813489, -0.9848756, -3.122452, 1, 0, 0, 1, 1,
-0.8108007, -0.0695018, -1.256819, 0, 0, 0, 1, 1,
-0.8094533, -1.042814, -2.019957, 0, 0, 0, 1, 1,
-0.8078152, -1.169933, -2.804195, 0, 0, 0, 1, 1,
-0.798813, -0.3704927, -1.802392, 0, 0, 0, 1, 1,
-0.798552, 0.8299416, -0.15686, 0, 0, 0, 1, 1,
-0.7956382, -0.4006472, -2.556537, 0, 0, 0, 1, 1,
-0.7945783, -1.058514, -2.592713, 0, 0, 0, 1, 1,
-0.7920092, -0.9106529, -3.354842, 1, 1, 1, 1, 1,
-0.7848939, 0.2319313, -1.732876, 1, 1, 1, 1, 1,
-0.7839301, -0.6365545, -1.726835, 1, 1, 1, 1, 1,
-0.7825893, -0.7892452, -2.28146, 1, 1, 1, 1, 1,
-0.7791367, -0.1032767, -1.270568, 1, 1, 1, 1, 1,
-0.7790975, 1.80648, -1.381435, 1, 1, 1, 1, 1,
-0.7754549, -1.677464, -4.160712, 1, 1, 1, 1, 1,
-0.7725065, 0.939348, 0.03773273, 1, 1, 1, 1, 1,
-0.7584589, -1.810306, -2.290593, 1, 1, 1, 1, 1,
-0.7576005, 1.555694, -0.9525383, 1, 1, 1, 1, 1,
-0.7558823, -1.482546, -3.142924, 1, 1, 1, 1, 1,
-0.7453547, 1.940155, 1.017177, 1, 1, 1, 1, 1,
-0.7418722, -0.2308337, -1.492326, 1, 1, 1, 1, 1,
-0.7382191, -1.070231, -2.240822, 1, 1, 1, 1, 1,
-0.7373327, 0.9696656, -0.6121457, 1, 1, 1, 1, 1,
-0.7341549, -0.08326954, -1.343943, 0, 0, 1, 1, 1,
-0.7327051, 0.02060696, -2.809827, 1, 0, 0, 1, 1,
-0.7308913, 0.187502, -0.635644, 1, 0, 0, 1, 1,
-0.724116, -1.268624, -3.635669, 1, 0, 0, 1, 1,
-0.7228296, -0.2849979, -0.1373507, 1, 0, 0, 1, 1,
-0.7217751, -0.6955448, -2.802981, 1, 0, 0, 1, 1,
-0.71639, -2.288543, -0.641262, 0, 0, 0, 1, 1,
-0.7099816, 1.491639, -0.5698245, 0, 0, 0, 1, 1,
-0.7078115, 0.5508822, -0.9632613, 0, 0, 0, 1, 1,
-0.6970802, -0.2098711, -3.268335, 0, 0, 0, 1, 1,
-0.6918063, -2.172873, -2.144329, 0, 0, 0, 1, 1,
-0.6858889, 0.9274279, -0.1871719, 0, 0, 0, 1, 1,
-0.6852622, -0.8925851, -2.931458, 0, 0, 0, 1, 1,
-0.685129, -1.938892, -2.908897, 1, 1, 1, 1, 1,
-0.6835988, 0.5063621, 0.7589183, 1, 1, 1, 1, 1,
-0.6791471, 0.02957048, -0.6284898, 1, 1, 1, 1, 1,
-0.6729963, -0.02063618, -1.373812, 1, 1, 1, 1, 1,
-0.6663957, 0.4589966, -0.4622816, 1, 1, 1, 1, 1,
-0.6637494, 1.47133, 0.3916765, 1, 1, 1, 1, 1,
-0.6603873, 1.036285, -0.4832404, 1, 1, 1, 1, 1,
-0.6576802, -0.3526637, 1.261153, 1, 1, 1, 1, 1,
-0.6547878, 1.123092, -0.2186831, 1, 1, 1, 1, 1,
-0.6499321, 1.142962, -0.6037416, 1, 1, 1, 1, 1,
-0.6488786, -2.085129, -1.55799, 1, 1, 1, 1, 1,
-0.6380624, -1.115206, -4.545194, 1, 1, 1, 1, 1,
-0.6365705, 0.2808803, -0.5124869, 1, 1, 1, 1, 1,
-0.6333441, 0.8342068, -1.641702, 1, 1, 1, 1, 1,
-0.6325158, -0.5103737, -2.208454, 1, 1, 1, 1, 1,
-0.6320894, -0.7423012, -1.900612, 0, 0, 1, 1, 1,
-0.6216249, 2.005882, -1.31656, 1, 0, 0, 1, 1,
-0.6187285, -0.08740839, -0.3909703, 1, 0, 0, 1, 1,
-0.6165392, 0.8267102, 0.083113, 1, 0, 0, 1, 1,
-0.6039423, -0.8994333, -1.847179, 1, 0, 0, 1, 1,
-0.6033306, -0.3225161, -3.279975, 1, 0, 0, 1, 1,
-0.6015717, -1.453086, -3.309258, 0, 0, 0, 1, 1,
-0.6005323, -1.301899, -2.72782, 0, 0, 0, 1, 1,
-0.5984333, -0.3973153, -3.580159, 0, 0, 0, 1, 1,
-0.5982749, 0.5066544, 0.7619408, 0, 0, 0, 1, 1,
-0.5981544, -0.01720062, -2.082385, 0, 0, 0, 1, 1,
-0.5969365, -1.651838, -3.587271, 0, 0, 0, 1, 1,
-0.5962027, 0.3050642, 0.1243558, 0, 0, 0, 1, 1,
-0.5955919, 0.01148356, 0.4489528, 1, 1, 1, 1, 1,
-0.592603, -0.2195069, -3.889445, 1, 1, 1, 1, 1,
-0.5865544, -0.910131, -1.74483, 1, 1, 1, 1, 1,
-0.5856898, 0.8831933, -0.3240255, 1, 1, 1, 1, 1,
-0.5769885, 1.1547, 0.6876336, 1, 1, 1, 1, 1,
-0.5694488, 0.5645162, 1.397538, 1, 1, 1, 1, 1,
-0.569296, 0.489761, -1.181381, 1, 1, 1, 1, 1,
-0.5639001, 1.278529, -0.6984971, 1, 1, 1, 1, 1,
-0.5635033, -0.2836694, -2.104274, 1, 1, 1, 1, 1,
-0.5615677, 0.8268343, 0.7918756, 1, 1, 1, 1, 1,
-0.5610576, 0.583492, 1.433399, 1, 1, 1, 1, 1,
-0.5610411, -1.52433, -1.778906, 1, 1, 1, 1, 1,
-0.5582789, -1.680065, -2.5399, 1, 1, 1, 1, 1,
-0.5561708, -1.114249, -2.65546, 1, 1, 1, 1, 1,
-0.554809, -0.4041365, -2.832123, 1, 1, 1, 1, 1,
-0.5526344, -0.6892307, -1.119122, 0, 0, 1, 1, 1,
-0.5509045, -0.9595401, -3.088398, 1, 0, 0, 1, 1,
-0.5484576, -0.6383097, -1.859342, 1, 0, 0, 1, 1,
-0.5459854, -0.1503785, -2.337805, 1, 0, 0, 1, 1,
-0.5420629, 2.245964, -0.7412484, 1, 0, 0, 1, 1,
-0.5396184, 0.5202838, -0.2178221, 1, 0, 0, 1, 1,
-0.5374507, -0.3888778, -1.654794, 0, 0, 0, 1, 1,
-0.5369546, 2.297264, -1.4024, 0, 0, 0, 1, 1,
-0.5329974, -1.031171, -3.478998, 0, 0, 0, 1, 1,
-0.5275897, 1.412462, -0.4579211, 0, 0, 0, 1, 1,
-0.5248703, -0.1632158, -1.840364, 0, 0, 0, 1, 1,
-0.5237459, 0.8167877, -1.400605, 0, 0, 0, 1, 1,
-0.5208431, 1.343223, -0.2883976, 0, 0, 0, 1, 1,
-0.5195562, -1.636974, -3.142309, 1, 1, 1, 1, 1,
-0.5178127, -0.3567122, -3.895221, 1, 1, 1, 1, 1,
-0.5164209, 1.667616, -1.918782, 1, 1, 1, 1, 1,
-0.5158671, -0.7509383, -2.622965, 1, 1, 1, 1, 1,
-0.5090035, 1.288094, 0.776513, 1, 1, 1, 1, 1,
-0.5067047, -0.839937, -3.110011, 1, 1, 1, 1, 1,
-0.5020963, 0.4401685, 0.7551306, 1, 1, 1, 1, 1,
-0.4927258, -0.23119, -1.581531, 1, 1, 1, 1, 1,
-0.4910046, 1.220572, -0.5705059, 1, 1, 1, 1, 1,
-0.4867868, 0.9273652, -1.359922, 1, 1, 1, 1, 1,
-0.4837065, 0.1709578, 0.07689746, 1, 1, 1, 1, 1,
-0.4794881, 0.6370505, -1.033555, 1, 1, 1, 1, 1,
-0.4734347, -0.3277394, -3.864976, 1, 1, 1, 1, 1,
-0.4700917, 0.2786631, -0.02221969, 1, 1, 1, 1, 1,
-0.4616362, -1.041582, -4.464592, 1, 1, 1, 1, 1,
-0.4537615, -0.8571148, -2.496547, 0, 0, 1, 1, 1,
-0.4530532, -1.708023, -3.59067, 1, 0, 0, 1, 1,
-0.4498652, 0.9567746, -0.06893886, 1, 0, 0, 1, 1,
-0.4452024, -0.1308536, -1.875952, 1, 0, 0, 1, 1,
-0.4448192, 1.439718, -0.2624476, 1, 0, 0, 1, 1,
-0.4379719, 1.945668, -1.2788, 1, 0, 0, 1, 1,
-0.4333219, 2.414566, 0.3811688, 0, 0, 0, 1, 1,
-0.4321782, -0.665058, -1.905582, 0, 0, 0, 1, 1,
-0.4300368, 2.074332, -2.339873, 0, 0, 0, 1, 1,
-0.4253948, 1.150781, -1.136384, 0, 0, 0, 1, 1,
-0.4243466, 0.6302527, -0.7046361, 0, 0, 0, 1, 1,
-0.4194725, 0.358854, -0.07341371, 0, 0, 0, 1, 1,
-0.4189916, -0.6568801, -1.256747, 0, 0, 0, 1, 1,
-0.4181016, -0.3868473, 0.8082404, 1, 1, 1, 1, 1,
-0.4177795, 0.7949719, -0.6475491, 1, 1, 1, 1, 1,
-0.4173984, 0.4744179, 0.07181106, 1, 1, 1, 1, 1,
-0.4168599, 1.512697, 0.6529611, 1, 1, 1, 1, 1,
-0.4165076, -0.7330917, -2.746758, 1, 1, 1, 1, 1,
-0.4152701, -1.246561, -1.628739, 1, 1, 1, 1, 1,
-0.408827, -0.2943752, -2.672672, 1, 1, 1, 1, 1,
-0.4087741, 0.8636646, -0.2278719, 1, 1, 1, 1, 1,
-0.4062974, -1.036915, -2.444722, 1, 1, 1, 1, 1,
-0.3998232, 1.702643, -1.031857, 1, 1, 1, 1, 1,
-0.396395, 2.017876, -1.658223, 1, 1, 1, 1, 1,
-0.3899962, -0.05974358, -0.04162941, 1, 1, 1, 1, 1,
-0.3886234, -1.814752, -2.7119, 1, 1, 1, 1, 1,
-0.3866594, 1.841848, -1.494383, 1, 1, 1, 1, 1,
-0.3709078, 0.854687, 0.0263959, 1, 1, 1, 1, 1,
-0.3692584, -0.3617313, -2.033299, 0, 0, 1, 1, 1,
-0.3631458, -1.376954, -2.157473, 1, 0, 0, 1, 1,
-0.3614281, -1.334689, -1.751123, 1, 0, 0, 1, 1,
-0.361178, 0.3130628, -2.127582, 1, 0, 0, 1, 1,
-0.3578236, -1.761283, -3.279335, 1, 0, 0, 1, 1,
-0.3573496, -2.723979, -2.971764, 1, 0, 0, 1, 1,
-0.353282, -0.6439647, -1.541375, 0, 0, 0, 1, 1,
-0.3511715, -0.2907072, -1.724234, 0, 0, 0, 1, 1,
-0.3511222, -0.7237417, -2.309224, 0, 0, 0, 1, 1,
-0.3482909, 0.5481796, -1.813033, 0, 0, 0, 1, 1,
-0.3466082, 1.737602, -1.734135, 0, 0, 0, 1, 1,
-0.3443648, -0.8568762, -3.046582, 0, 0, 0, 1, 1,
-0.3430752, -0.2010132, -2.082386, 0, 0, 0, 1, 1,
-0.3373361, -1.181483, -3.129322, 1, 1, 1, 1, 1,
-0.3354979, 0.2597215, 1.221444, 1, 1, 1, 1, 1,
-0.3334009, 0.7352633, -0.6401585, 1, 1, 1, 1, 1,
-0.3312916, 0.8169574, -1.15921, 1, 1, 1, 1, 1,
-0.329249, 1.449274, -2.26557, 1, 1, 1, 1, 1,
-0.3250665, 1.799772, 0.1455121, 1, 1, 1, 1, 1,
-0.3218624, -0.6534858, -2.08686, 1, 1, 1, 1, 1,
-0.3209607, -0.1385278, -1.750623, 1, 1, 1, 1, 1,
-0.3204511, -1.606166, -2.789032, 1, 1, 1, 1, 1,
-0.3192397, 0.07277461, -1.579045, 1, 1, 1, 1, 1,
-0.3187267, -0.4438704, -2.582054, 1, 1, 1, 1, 1,
-0.3156657, -1.576387, -2.273882, 1, 1, 1, 1, 1,
-0.3156272, -0.03717225, -1.097367, 1, 1, 1, 1, 1,
-0.3115059, -1.412361, -2.68999, 1, 1, 1, 1, 1,
-0.3070326, -0.1963576, -1.405464, 1, 1, 1, 1, 1,
-0.3049015, 0.5247572, -1.398693, 0, 0, 1, 1, 1,
-0.2952869, -0.5868289, -1.980566, 1, 0, 0, 1, 1,
-0.2939249, -0.6506245, -2.492023, 1, 0, 0, 1, 1,
-0.2904342, -0.9205232, -2.613215, 1, 0, 0, 1, 1,
-0.2895114, -1.162381, -2.12693, 1, 0, 0, 1, 1,
-0.2801057, -0.4598426, -2.82471, 1, 0, 0, 1, 1,
-0.2797371, 0.7812784, 0.4009551, 0, 0, 0, 1, 1,
-0.2789116, 0.2792006, -1.243639, 0, 0, 0, 1, 1,
-0.2784724, -1.296897, -2.180545, 0, 0, 0, 1, 1,
-0.2758557, -0.663868, -1.890768, 0, 0, 0, 1, 1,
-0.2756516, 0.2573759, -0.2893333, 0, 0, 0, 1, 1,
-0.2747658, -0.4538456, -0.7338116, 0, 0, 0, 1, 1,
-0.265012, 0.606122, -0.6424623, 0, 0, 0, 1, 1,
-0.2644959, 0.1970888, -1.269477, 1, 1, 1, 1, 1,
-0.2614262, 0.7557786, -0.558248, 1, 1, 1, 1, 1,
-0.2612286, -0.1812061, -3.423959, 1, 1, 1, 1, 1,
-0.2564942, -0.2048491, -1.940921, 1, 1, 1, 1, 1,
-0.2560926, -0.01985333, -1.90755, 1, 1, 1, 1, 1,
-0.2507464, -0.5747146, -3.201794, 1, 1, 1, 1, 1,
-0.242403, -0.2065208, -1.08575, 1, 1, 1, 1, 1,
-0.2422279, 0.315028, -0.9952579, 1, 1, 1, 1, 1,
-0.2416652, 0.5073491, -1.581039, 1, 1, 1, 1, 1,
-0.240888, 0.4021141, -1.956831, 1, 1, 1, 1, 1,
-0.2394328, -0.06226316, -2.108567, 1, 1, 1, 1, 1,
-0.2389888, -0.7365481, -0.2797904, 1, 1, 1, 1, 1,
-0.2381455, 0.7111545, -1.70983, 1, 1, 1, 1, 1,
-0.2371127, -0.7323964, -3.222742, 1, 1, 1, 1, 1,
-0.2370634, -1.168116, -3.740911, 1, 1, 1, 1, 1,
-0.2368642, -1.14014, -1.806699, 0, 0, 1, 1, 1,
-0.2358263, 1.265721, 0.0124004, 1, 0, 0, 1, 1,
-0.2344271, -1.068091, -3.46045, 1, 0, 0, 1, 1,
-0.2322779, 0.7307649, -0.6085036, 1, 0, 0, 1, 1,
-0.2321553, -0.2532384, -2.605744, 1, 0, 0, 1, 1,
-0.2291379, -0.8605127, -4.504834, 1, 0, 0, 1, 1,
-0.2215022, 0.4738217, -1.740317, 0, 0, 0, 1, 1,
-0.2198667, -0.1189704, -0.8857045, 0, 0, 0, 1, 1,
-0.219446, 0.4322735, -1.187307, 0, 0, 0, 1, 1,
-0.2181751, -0.430663, -4.196227, 0, 0, 0, 1, 1,
-0.2146438, -0.6868346, -3.365322, 0, 0, 0, 1, 1,
-0.2105474, 0.3230166, -1.073075, 0, 0, 0, 1, 1,
-0.2076045, 0.307016, -0.1143644, 0, 0, 0, 1, 1,
-0.2055089, -1.566096, -1.2608, 1, 1, 1, 1, 1,
-0.2036309, -0.04797504, -1.697297, 1, 1, 1, 1, 1,
-0.2013622, 0.2329588, -0.1291093, 1, 1, 1, 1, 1,
-0.2011835, 1.196203, 1.758261, 1, 1, 1, 1, 1,
-0.1979149, 1.354575, -0.3788427, 1, 1, 1, 1, 1,
-0.1970137, 0.6361759, -1.488555, 1, 1, 1, 1, 1,
-0.19698, -0.04960122, -1.797615, 1, 1, 1, 1, 1,
-0.1967342, 1.06375, -0.8442675, 1, 1, 1, 1, 1,
-0.192932, 0.0815586, -1.38083, 1, 1, 1, 1, 1,
-0.190835, 0.3566078, 0.4485024, 1, 1, 1, 1, 1,
-0.189266, 0.0397576, -0.3235843, 1, 1, 1, 1, 1,
-0.1878252, 0.09591832, -1.218765, 1, 1, 1, 1, 1,
-0.1816296, 0.8965557, -0.5289971, 1, 1, 1, 1, 1,
-0.181139, -1.127304, -4.235044, 1, 1, 1, 1, 1,
-0.1787542, 1.486634, -0.1954609, 1, 1, 1, 1, 1,
-0.1786539, -1.491249, -4.487297, 0, 0, 1, 1, 1,
-0.1783323, 0.756218, -0.4419242, 1, 0, 0, 1, 1,
-0.1783281, -0.02325007, -0.2602754, 1, 0, 0, 1, 1,
-0.1776206, 0.7786112, -0.8513129, 1, 0, 0, 1, 1,
-0.1734766, 1.319257, 0.09322484, 1, 0, 0, 1, 1,
-0.1722559, 1.866248, -0.5164647, 1, 0, 0, 1, 1,
-0.1675888, 0.3980359, -0.05908797, 0, 0, 0, 1, 1,
-0.1634595, 1.01128, -0.7770463, 0, 0, 0, 1, 1,
-0.1607014, -7.246247e-05, -1.472904, 0, 0, 0, 1, 1,
-0.1590775, 0.5121605, -1.927201, 0, 0, 0, 1, 1,
-0.1552881, 0.7896613, -1.679523, 0, 0, 0, 1, 1,
-0.1545917, -0.1293706, -2.288387, 0, 0, 0, 1, 1,
-0.1545203, -0.8062556, -1.62008, 0, 0, 0, 1, 1,
-0.1450327, 0.6199324, -0.603801, 1, 1, 1, 1, 1,
-0.1424735, 1.555324, -1.320192, 1, 1, 1, 1, 1,
-0.1387076, -0.4915937, -1.887303, 1, 1, 1, 1, 1,
-0.1371524, 2.401618, 0.8180183, 1, 1, 1, 1, 1,
-0.1326752, 2.112988, 0.9110205, 1, 1, 1, 1, 1,
-0.1304804, -0.7246284, -4.528171, 1, 1, 1, 1, 1,
-0.1257444, -0.5828791, -3.174454, 1, 1, 1, 1, 1,
-0.1255574, -0.7711475, -1.209895, 1, 1, 1, 1, 1,
-0.1254258, -1.150944, -2.623196, 1, 1, 1, 1, 1,
-0.1219754, -1.735717, -2.946518, 1, 1, 1, 1, 1,
-0.1198561, 2.726007, 1.326641, 1, 1, 1, 1, 1,
-0.1175841, -0.7876149, -6.320109, 1, 1, 1, 1, 1,
-0.1119453, 0.2881892, 0.2592461, 1, 1, 1, 1, 1,
-0.1114414, -2.450609, -3.583059, 1, 1, 1, 1, 1,
-0.1110069, -0.0690346, -2.011711, 1, 1, 1, 1, 1,
-0.1091409, -0.04406771, -1.744748, 0, 0, 1, 1, 1,
-0.1043203, 0.2893085, 0.3603973, 1, 0, 0, 1, 1,
-0.1024444, 1.005159, -0.2222766, 1, 0, 0, 1, 1,
-0.1018739, -0.7972761, -2.981056, 1, 0, 0, 1, 1,
-0.1003181, -0.5638394, -4.318119, 1, 0, 0, 1, 1,
-0.09882806, -0.2574843, -2.975765, 1, 0, 0, 1, 1,
-0.0939004, -0.8260016, -1.576327, 0, 0, 0, 1, 1,
-0.09282482, -0.5137072, -2.880722, 0, 0, 0, 1, 1,
-0.09229416, 0.1029383, 0.1836297, 0, 0, 0, 1, 1,
-0.09191041, 0.3379034, -0.6560736, 0, 0, 0, 1, 1,
-0.09046861, 0.09099621, -1.029609, 0, 0, 0, 1, 1,
-0.08641376, 0.9686375, 0.1195829, 0, 0, 0, 1, 1,
-0.07913931, -1.954892, -3.500062, 0, 0, 0, 1, 1,
-0.06915232, -0.1962926, -1.086524, 1, 1, 1, 1, 1,
-0.06177226, 0.5808707, 0.2150175, 1, 1, 1, 1, 1,
-0.06125402, 0.6632343, -0.7071003, 1, 1, 1, 1, 1,
-0.06001207, 0.3320107, 0.4477412, 1, 1, 1, 1, 1,
-0.05759337, -0.4921409, -3.625926, 1, 1, 1, 1, 1,
-0.05361703, 0.9282146, -0.4963156, 1, 1, 1, 1, 1,
-0.04614147, -0.1537146, -3.325596, 1, 1, 1, 1, 1,
-0.04491559, 0.4188391, -1.389485, 1, 1, 1, 1, 1,
-0.04224361, -0.5974086, -3.101869, 1, 1, 1, 1, 1,
-0.0393936, 0.7808089, 0.06640227, 1, 1, 1, 1, 1,
-0.03588089, 0.8695278, 0.6026061, 1, 1, 1, 1, 1,
-0.03538691, 0.1930532, 1.268832, 1, 1, 1, 1, 1,
-0.0348319, 1.271882, 0.6660778, 1, 1, 1, 1, 1,
-0.03293307, -0.009616579, -0.7266641, 1, 1, 1, 1, 1,
-0.03258153, -0.1934255, -4.262598, 1, 1, 1, 1, 1,
-0.03194367, 1.403024, 0.8633155, 0, 0, 1, 1, 1,
-0.02673646, -0.6351104, -4.365053, 1, 0, 0, 1, 1,
-0.02492274, -0.797534, -2.902031, 1, 0, 0, 1, 1,
-0.02353346, -1.029762, -3.832064, 1, 0, 0, 1, 1,
-0.0217505, -0.3277385, -3.243012, 1, 0, 0, 1, 1,
-0.02145802, -0.9270598, -0.2190764, 1, 0, 0, 1, 1,
-0.01899036, 0.5318818, 0.4444428, 0, 0, 0, 1, 1,
-0.01855343, -0.2733846, -3.517629, 0, 0, 0, 1, 1,
-0.01760674, 0.9035066, -0.9755179, 0, 0, 0, 1, 1,
-0.01638718, -0.02261666, -2.232743, 0, 0, 0, 1, 1,
-0.01573251, -0.1316674, -5.259679, 0, 0, 0, 1, 1,
-0.01398198, -0.7834591, -4.965433, 0, 0, 0, 1, 1,
-0.009258622, -0.0483069, -2.329942, 0, 0, 0, 1, 1,
-0.007643305, 0.6624433, -1.657574, 1, 1, 1, 1, 1,
-0.007109115, 0.6028658, 1.227164, 1, 1, 1, 1, 1,
-0.006861038, 0.6813765, -0.5588049, 1, 1, 1, 1, 1,
-0.005845305, 0.5996543, -0.525814, 1, 1, 1, 1, 1,
-0.005287628, 1.41202, 1.210989, 1, 1, 1, 1, 1,
-0.00275474, 0.05425833, 0.9292641, 1, 1, 1, 1, 1,
0.0005065462, 1.367536, -0.7371307, 1, 1, 1, 1, 1,
0.005213194, -1.249504, 3.950097, 1, 1, 1, 1, 1,
0.007091159, 0.4856711, 1.503014, 1, 1, 1, 1, 1,
0.01010136, 0.4689579, -0.4279325, 1, 1, 1, 1, 1,
0.01194013, 1.733064, -1.685113, 1, 1, 1, 1, 1,
0.01244021, 0.5392047, 0.2201398, 1, 1, 1, 1, 1,
0.0131677, -1.328567, 3.411255, 1, 1, 1, 1, 1,
0.01368489, 0.04449992, 0.5140269, 1, 1, 1, 1, 1,
0.01751181, -0.7698022, 5.534329, 1, 1, 1, 1, 1,
0.01947629, 0.7672182, 0.1079791, 0, 0, 1, 1, 1,
0.01951381, -1.268768, 0.9745117, 1, 0, 0, 1, 1,
0.02076694, -0.3455195, 2.06586, 1, 0, 0, 1, 1,
0.02325281, -0.5262052, 3.251622, 1, 0, 0, 1, 1,
0.02792133, 0.3808385, 2.199668, 1, 0, 0, 1, 1,
0.0318139, 0.1515815, -0.05691433, 1, 0, 0, 1, 1,
0.03544242, 0.2562412, 0.5888497, 0, 0, 0, 1, 1,
0.03689473, 0.4824029, -0.5669705, 0, 0, 0, 1, 1,
0.0388598, -0.7363427, 4.053835, 0, 0, 0, 1, 1,
0.03959833, -1.048669, 2.509151, 0, 0, 0, 1, 1,
0.04265705, -0.316303, 2.890519, 0, 0, 0, 1, 1,
0.04652075, -1.927485, 2.930308, 0, 0, 0, 1, 1,
0.05061871, -0.86266, 3.341425, 0, 0, 0, 1, 1,
0.05588311, -1.288804, 2.730222, 1, 1, 1, 1, 1,
0.0575666, 1.727435, 0.8929892, 1, 1, 1, 1, 1,
0.0585505, -1.702871, 2.444288, 1, 1, 1, 1, 1,
0.06242133, 0.5310407, 0.3231667, 1, 1, 1, 1, 1,
0.06857552, 0.07845849, 1.369343, 1, 1, 1, 1, 1,
0.06873889, 0.1395969, 1.673261, 1, 1, 1, 1, 1,
0.06896932, -0.5979353, 2.414688, 1, 1, 1, 1, 1,
0.07025523, 0.5625086, 2.443555, 1, 1, 1, 1, 1,
0.07711665, -0.4845255, 3.215824, 1, 1, 1, 1, 1,
0.07745402, -0.7893081, 2.228719, 1, 1, 1, 1, 1,
0.07866072, -0.4018901, 3.985328, 1, 1, 1, 1, 1,
0.0790057, 1.549826, 0.5229771, 1, 1, 1, 1, 1,
0.07935056, 0.9871404, 0.5740392, 1, 1, 1, 1, 1,
0.08122292, 0.4063256, -1.609955, 1, 1, 1, 1, 1,
0.08146231, -0.6467637, 0.2344, 1, 1, 1, 1, 1,
0.08532709, -1.112004, 2.817063, 0, 0, 1, 1, 1,
0.09478321, -0.4689727, 2.669838, 1, 0, 0, 1, 1,
0.09845645, -0.7206448, 2.137851, 1, 0, 0, 1, 1,
0.1038216, -0.435674, 3.852752, 1, 0, 0, 1, 1,
0.1045459, 1.071481, -0.09003812, 1, 0, 0, 1, 1,
0.1050894, 1.068261, 0.7293233, 1, 0, 0, 1, 1,
0.106665, -0.9908377, 3.912188, 0, 0, 0, 1, 1,
0.1068932, 0.189855, 1.694386, 0, 0, 0, 1, 1,
0.1095819, 0.4130067, 0.610585, 0, 0, 0, 1, 1,
0.1101662, 1.34883, -0.02207809, 0, 0, 0, 1, 1,
0.113313, -0.4038914, 4.275349, 0, 0, 0, 1, 1,
0.1133503, -2.958623, 3.870755, 0, 0, 0, 1, 1,
0.1203613, 0.5703657, -0.0189668, 0, 0, 0, 1, 1,
0.1208507, -1.078656, 4.530878, 1, 1, 1, 1, 1,
0.1240718, -0.2320096, 2.468818, 1, 1, 1, 1, 1,
0.1310695, 1.562063, 0.3350406, 1, 1, 1, 1, 1,
0.1343241, -1.543025, 3.874585, 1, 1, 1, 1, 1,
0.1376787, 0.6691467, 1.378312, 1, 1, 1, 1, 1,
0.1388573, 0.1866667, 0.0330633, 1, 1, 1, 1, 1,
0.1396805, 0.9143826, 0.3797219, 1, 1, 1, 1, 1,
0.1454433, 0.253085, -0.9434057, 1, 1, 1, 1, 1,
0.1487177, 1.188274, 0.09695798, 1, 1, 1, 1, 1,
0.1500226, -0.4136936, 2.076914, 1, 1, 1, 1, 1,
0.1504302, -1.422195, 3.651211, 1, 1, 1, 1, 1,
0.1512269, 0.7951405, -0.07993405, 1, 1, 1, 1, 1,
0.1528237, 1.911742, -0.9586116, 1, 1, 1, 1, 1,
0.1562209, 0.6087763, 1.261356, 1, 1, 1, 1, 1,
0.1617669, -1.558555, 4.397853, 1, 1, 1, 1, 1,
0.1657905, -1.763136, 3.885967, 0, 0, 1, 1, 1,
0.1661322, -3.305592, 3.582798, 1, 0, 0, 1, 1,
0.1673768, -0.6433566, 2.912539, 1, 0, 0, 1, 1,
0.1702374, -0.2761085, 3.572417, 1, 0, 0, 1, 1,
0.1762754, -1.628932, 3.54006, 1, 0, 0, 1, 1,
0.1795203, -0.6086282, 2.247861, 1, 0, 0, 1, 1,
0.1795538, 0.485786, 1.422786, 0, 0, 0, 1, 1,
0.1797172, -0.2002995, 4.097543, 0, 0, 0, 1, 1,
0.1831288, -0.1426458, 2.160405, 0, 0, 0, 1, 1,
0.1866697, 0.3731219, 2.871633, 0, 0, 0, 1, 1,
0.1870302, 0.3012522, 0.6416603, 0, 0, 0, 1, 1,
0.2000669, 0.4552043, -0.5449345, 0, 0, 0, 1, 1,
0.2010125, 0.6703171, -0.4558323, 0, 0, 0, 1, 1,
0.2045821, 0.7434983, -0.2755476, 1, 1, 1, 1, 1,
0.2067642, -0.08479983, 3.031103, 1, 1, 1, 1, 1,
0.2070877, -0.5923667, 4.664044, 1, 1, 1, 1, 1,
0.208258, -1.434071, 1.550595, 1, 1, 1, 1, 1,
0.2110958, -0.5908665, 3.546109, 1, 1, 1, 1, 1,
0.216833, 1.346593, -2.51303, 1, 1, 1, 1, 1,
0.2267594, 0.1895048, 0.8820872, 1, 1, 1, 1, 1,
0.2278022, 0.9939204, 0.677643, 1, 1, 1, 1, 1,
0.2282574, 0.3560802, 0.2170752, 1, 1, 1, 1, 1,
0.2290685, 0.3581037, 2.136645, 1, 1, 1, 1, 1,
0.2296556, 1.904948, -0.3539615, 1, 1, 1, 1, 1,
0.2299842, -1.506306, 0.8387513, 1, 1, 1, 1, 1,
0.2362056, -1.54974, 4.206344, 1, 1, 1, 1, 1,
0.2404272, -0.8860135, 3.821233, 1, 1, 1, 1, 1,
0.2404934, 0.1452728, 0.5588273, 1, 1, 1, 1, 1,
0.2477779, 0.7656658, 0.8815287, 0, 0, 1, 1, 1,
0.2481802, -0.8965054, 1.758229, 1, 0, 0, 1, 1,
0.2482507, -2.505143, 3.382576, 1, 0, 0, 1, 1,
0.2498258, -1.263477, 2.649311, 1, 0, 0, 1, 1,
0.2508651, -1.426836, 1.883802, 1, 0, 0, 1, 1,
0.2520881, 0.3034303, -0.1407726, 1, 0, 0, 1, 1,
0.254691, -0.6027423, 4.780262, 0, 0, 0, 1, 1,
0.2557486, 2.195972, -0.9269797, 0, 0, 0, 1, 1,
0.2564234, -0.2821233, 1.878902, 0, 0, 0, 1, 1,
0.2650375, -1.848717, 2.237805, 0, 0, 0, 1, 1,
0.2655069, 1.000507, -0.006537249, 0, 0, 0, 1, 1,
0.2657267, -0.402675, 3.479015, 0, 0, 0, 1, 1,
0.2658521, -0.2924499, 1.529904, 0, 0, 0, 1, 1,
0.2701886, -1.299722, 3.330299, 1, 1, 1, 1, 1,
0.2706788, -0.4046526, 4.080692, 1, 1, 1, 1, 1,
0.2707963, 2.365584, 1.103248, 1, 1, 1, 1, 1,
0.2776878, 0.380328, 2.02918, 1, 1, 1, 1, 1,
0.2793548, -0.1146837, 1.508455, 1, 1, 1, 1, 1,
0.2802805, 0.1539217, 0.9288254, 1, 1, 1, 1, 1,
0.2803078, -0.7926589, 3.692364, 1, 1, 1, 1, 1,
0.2839159, -0.46182, 1.628267, 1, 1, 1, 1, 1,
0.284948, -1.039747, 1.974792, 1, 1, 1, 1, 1,
0.2854939, -0.86069, 2.872607, 1, 1, 1, 1, 1,
0.2857563, 1.004964, 0.4056854, 1, 1, 1, 1, 1,
0.2884369, 0.5785142, 1.523671, 1, 1, 1, 1, 1,
0.2904944, 0.05737168, -0.1635967, 1, 1, 1, 1, 1,
0.2909484, -1.016487, 3.909539, 1, 1, 1, 1, 1,
0.291286, -0.274023, 4.344517, 1, 1, 1, 1, 1,
0.2951728, -0.6516193, 3.230828, 0, 0, 1, 1, 1,
0.2987179, -0.07184626, 2.171005, 1, 0, 0, 1, 1,
0.3017018, -0.801446, 2.663051, 1, 0, 0, 1, 1,
0.3073768, 0.9127398, -0.6847773, 1, 0, 0, 1, 1,
0.3080591, -0.02313819, 0.7687272, 1, 0, 0, 1, 1,
0.3088732, -1.254794, 3.742521, 1, 0, 0, 1, 1,
0.3152473, -1.146608, 2.528668, 0, 0, 0, 1, 1,
0.3173537, 0.389908, 0.425991, 0, 0, 0, 1, 1,
0.3201181, -2.376518, 3.529811, 0, 0, 0, 1, 1,
0.3230476, 1.427948, 0.2237391, 0, 0, 0, 1, 1,
0.3254555, -1.040952, 2.857017, 0, 0, 0, 1, 1,
0.3303253, 1.207579, 0.09514905, 0, 0, 0, 1, 1,
0.3334014, 1.342515, 2.469325, 0, 0, 0, 1, 1,
0.3365119, -0.2996547, 2.30307, 1, 1, 1, 1, 1,
0.3403042, 0.5598575, 0.2624829, 1, 1, 1, 1, 1,
0.3417199, 0.6759135, -0.7736071, 1, 1, 1, 1, 1,
0.3454697, 0.9030845, -0.9914691, 1, 1, 1, 1, 1,
0.3465236, 0.2676074, -1.175939, 1, 1, 1, 1, 1,
0.3597874, -0.05904767, 1.917749, 1, 1, 1, 1, 1,
0.3611317, 0.6577808, 1.9078, 1, 1, 1, 1, 1,
0.3659121, 0.01852446, 0.1675524, 1, 1, 1, 1, 1,
0.3677075, -0.3901574, 3.920745, 1, 1, 1, 1, 1,
0.3698244, -1.243269, 3.058339, 1, 1, 1, 1, 1,
0.3698914, -0.2945456, 3.174023, 1, 1, 1, 1, 1,
0.3705623, 0.9536517, 1.757363, 1, 1, 1, 1, 1,
0.3759746, 1.420241, 2.042449, 1, 1, 1, 1, 1,
0.3814704, 1.307861, -0.1178874, 1, 1, 1, 1, 1,
0.3853925, 0.2531254, 1.173298, 1, 1, 1, 1, 1,
0.3878179, -1.817494, 4.008512, 0, 0, 1, 1, 1,
0.3913636, 1.196209, -0.07028597, 1, 0, 0, 1, 1,
0.3917039, -0.3724679, 1.105357, 1, 0, 0, 1, 1,
0.3992973, -1.45932, 3.39868, 1, 0, 0, 1, 1,
0.4014138, -0.9341782, 3.858871, 1, 0, 0, 1, 1,
0.4030882, -0.0209991, 0.1793108, 1, 0, 0, 1, 1,
0.4052505, -0.6024692, 2.212094, 0, 0, 0, 1, 1,
0.4089586, -0.02155262, 2.678823, 0, 0, 0, 1, 1,
0.4105839, -0.1175904, 0.3598314, 0, 0, 0, 1, 1,
0.4160957, -1.682719, 3.828165, 0, 0, 0, 1, 1,
0.4169547, -0.5826293, 3.813469, 0, 0, 0, 1, 1,
0.4177885, -0.4511994, 2.895992, 0, 0, 0, 1, 1,
0.4187584, -1.929448, 2.783959, 0, 0, 0, 1, 1,
0.4195338, 0.8688102, 2.21593, 1, 1, 1, 1, 1,
0.4221656, 0.3672708, -0.01115876, 1, 1, 1, 1, 1,
0.4303983, 0.1883315, -0.5036342, 1, 1, 1, 1, 1,
0.4428376, -1.648382, 2.143929, 1, 1, 1, 1, 1,
0.4433008, 0.5966815, -0.1215201, 1, 1, 1, 1, 1,
0.4447637, -0.02678071, 2.748085, 1, 1, 1, 1, 1,
0.4458948, -0.07880533, 2.570141, 1, 1, 1, 1, 1,
0.4458991, -0.3417762, 1.235679, 1, 1, 1, 1, 1,
0.4461291, 1.461169, -0.415818, 1, 1, 1, 1, 1,
0.4512214, 0.7457622, 1.291507, 1, 1, 1, 1, 1,
0.4521863, -0.290778, -0.3487042, 1, 1, 1, 1, 1,
0.4530892, 0.8996999, 1.466177, 1, 1, 1, 1, 1,
0.4571878, -0.06547479, 1.612222, 1, 1, 1, 1, 1,
0.4585442, 0.942933, -0.271447, 1, 1, 1, 1, 1,
0.4588027, -0.9200245, 2.877578, 1, 1, 1, 1, 1,
0.4602084, 0.5203082, -0.9051756, 0, 0, 1, 1, 1,
0.4617341, -0.0694537, 1.559986, 1, 0, 0, 1, 1,
0.4629214, -0.134127, 0.4225833, 1, 0, 0, 1, 1,
0.4669752, 0.3295922, -0.1460929, 1, 0, 0, 1, 1,
0.4671754, 0.6028512, -0.1630113, 1, 0, 0, 1, 1,
0.4684713, 0.8403018, 0.4818249, 1, 0, 0, 1, 1,
0.4695921, 0.7841094, -1.389076, 0, 0, 0, 1, 1,
0.4709293, -0.754669, 2.001709, 0, 0, 0, 1, 1,
0.474526, -0.2225936, 4.594982, 0, 0, 0, 1, 1,
0.4797977, -1.647804, 3.528905, 0, 0, 0, 1, 1,
0.4855097, -0.2448771, 2.638238, 0, 0, 0, 1, 1,
0.4872623, -1.232518, 2.298561, 0, 0, 0, 1, 1,
0.4901678, -0.8616157, 2.676856, 0, 0, 0, 1, 1,
0.4915896, -2.555628, 1.171743, 1, 1, 1, 1, 1,
0.4935541, 1.354568, 1.80227, 1, 1, 1, 1, 1,
0.50395, -1.024719, 2.312869, 1, 1, 1, 1, 1,
0.506387, 0.3302998, 1.688749, 1, 1, 1, 1, 1,
0.5068933, -1.576828, 0.933704, 1, 1, 1, 1, 1,
0.5078627, -0.09010553, 2.090815, 1, 1, 1, 1, 1,
0.5091285, -0.2440621, 1.727728, 1, 1, 1, 1, 1,
0.5111199, 1.050482, 0.918655, 1, 1, 1, 1, 1,
0.5225791, 0.7843891, 0.5507982, 1, 1, 1, 1, 1,
0.523321, 0.2655988, 1.920655, 1, 1, 1, 1, 1,
0.5260766, 1.108778, 1.237029, 1, 1, 1, 1, 1,
0.5291186, -1.061089, 2.502563, 1, 1, 1, 1, 1,
0.5302262, -0.4948307, 3.371902, 1, 1, 1, 1, 1,
0.5360801, -1.471343, 3.409817, 1, 1, 1, 1, 1,
0.5373747, 0.2414182, 0.5013863, 1, 1, 1, 1, 1,
0.5381191, -2.073037, 3.888068, 0, 0, 1, 1, 1,
0.5450835, -0.4916368, 3.078803, 1, 0, 0, 1, 1,
0.5532615, 1.226846, 0.02109124, 1, 0, 0, 1, 1,
0.5543123, -0.8345188, 1.308859, 1, 0, 0, 1, 1,
0.5556049, -1.031048, 4.145319, 1, 0, 0, 1, 1,
0.5566779, 3.235842, 0.1397394, 1, 0, 0, 1, 1,
0.5708283, -1.120159, 1.506252, 0, 0, 0, 1, 1,
0.5762904, -0.792381, 4.021905, 0, 0, 0, 1, 1,
0.577776, -0.4075192, 1.637766, 0, 0, 0, 1, 1,
0.5803312, 0.3022037, 1.253491, 0, 0, 0, 1, 1,
0.5848185, -0.4455774, 0.7448065, 0, 0, 0, 1, 1,
0.5858324, 0.1080198, 2.185374, 0, 0, 0, 1, 1,
0.5885229, 0.5118358, -0.3602577, 0, 0, 0, 1, 1,
0.5906356, 0.242248, 1.850174, 1, 1, 1, 1, 1,
0.5928484, 0.9419321, 0.7823434, 1, 1, 1, 1, 1,
0.592968, -0.5237845, 3.850221, 1, 1, 1, 1, 1,
0.5955895, 1.121348, 2.34707, 1, 1, 1, 1, 1,
0.5993974, -1.685364, 2.824135, 1, 1, 1, 1, 1,
0.6003004, 0.7080869, -0.4724483, 1, 1, 1, 1, 1,
0.6005061, 1.236121, -0.3540054, 1, 1, 1, 1, 1,
0.6010886, 0.4779329, 1.448333, 1, 1, 1, 1, 1,
0.6040078, -0.2806603, 1.553927, 1, 1, 1, 1, 1,
0.606947, 1.366442, -0.1334525, 1, 1, 1, 1, 1,
0.6074986, -1.484355, 2.777509, 1, 1, 1, 1, 1,
0.6126268, 2.515966, 0.1081726, 1, 1, 1, 1, 1,
0.6132629, 0.3370376, 2.530858, 1, 1, 1, 1, 1,
0.6156299, 2.008871, 0.01023415, 1, 1, 1, 1, 1,
0.6190614, 0.5689434, 0.6133469, 1, 1, 1, 1, 1,
0.6204178, 0.0856317, 2.579109, 0, 0, 1, 1, 1,
0.6263902, -0.6916826, 2.741696, 1, 0, 0, 1, 1,
0.6267539, -1.288492, 4.020262, 1, 0, 0, 1, 1,
0.6346835, 0.4465333, 1.535232, 1, 0, 0, 1, 1,
0.638535, -0.9609292, 2.090886, 1, 0, 0, 1, 1,
0.641768, 0.6914349, 1.003677, 1, 0, 0, 1, 1,
0.6429414, 0.6851711, 2.40618, 0, 0, 0, 1, 1,
0.647462, -0.3505256, 1.752445, 0, 0, 0, 1, 1,
0.6475136, 1.732011, 0.4775823, 0, 0, 0, 1, 1,
0.6510375, 1.863094, 0.1748628, 0, 0, 0, 1, 1,
0.662531, 1.018476, 0.4665621, 0, 0, 0, 1, 1,
0.6687568, 0.3639314, 0.7578913, 0, 0, 0, 1, 1,
0.6715568, 0.8527889, 0.2767659, 0, 0, 0, 1, 1,
0.6725661, 0.05419984, 0.6170442, 1, 1, 1, 1, 1,
0.6793689, 0.371101, 1.57414, 1, 1, 1, 1, 1,
0.6906626, 1.721845, 1.067919, 1, 1, 1, 1, 1,
0.6935232, -0.8750865, 1.776827, 1, 1, 1, 1, 1,
0.694341, 0.6777116, 1.25149, 1, 1, 1, 1, 1,
0.6982961, -0.7057148, 1.808802, 1, 1, 1, 1, 1,
0.7058412, 0.8534358, 0.5689441, 1, 1, 1, 1, 1,
0.7065086, -1.045926, 3.488776, 1, 1, 1, 1, 1,
0.7080688, 1.370927, 1.151191, 1, 1, 1, 1, 1,
0.7082602, 0.4843971, 1.229855, 1, 1, 1, 1, 1,
0.7084598, -1.069832, 4.367874, 1, 1, 1, 1, 1,
0.7087754, -0.1701578, 2.307508, 1, 1, 1, 1, 1,
0.7087888, 2.169904, 2.898513, 1, 1, 1, 1, 1,
0.7117246, 0.4888683, 0.7991809, 1, 1, 1, 1, 1,
0.711789, 0.1786711, 1.470405, 1, 1, 1, 1, 1,
0.7133716, -1.097876, 2.743379, 0, 0, 1, 1, 1,
0.7158453, 0.6544414, -0.3724064, 1, 0, 0, 1, 1,
0.7165152, -1.015589, 2.343983, 1, 0, 0, 1, 1,
0.718533, 0.2250256, 0.7488738, 1, 0, 0, 1, 1,
0.7205553, 1.148351, 0.5894703, 1, 0, 0, 1, 1,
0.7207623, -0.1378279, 2.110415, 1, 0, 0, 1, 1,
0.7267115, -0.9793721, 2.578248, 0, 0, 0, 1, 1,
0.7313622, -0.4699208, 1.026291, 0, 0, 0, 1, 1,
0.7325416, 0.2121354, 3.101018, 0, 0, 0, 1, 1,
0.7332246, -0.6301414, 1.829738, 0, 0, 0, 1, 1,
0.7336814, 0.9110033, 0.8520731, 0, 0, 0, 1, 1,
0.738068, 0.7859985, 1.274188, 0, 0, 0, 1, 1,
0.7406517, 1.280819, 0.8684084, 0, 0, 0, 1, 1,
0.7420702, 0.07072333, 3.083622, 1, 1, 1, 1, 1,
0.7427654, -0.148116, 2.360213, 1, 1, 1, 1, 1,
0.7431547, -0.7430078, 1.350235, 1, 1, 1, 1, 1,
0.7467374, 0.3643441, 0.7838149, 1, 1, 1, 1, 1,
0.7468069, 0.7947479, -0.4803775, 1, 1, 1, 1, 1,
0.7471787, -0.7010524, 2.944934, 1, 1, 1, 1, 1,
0.7472881, -1.827691, 2.499915, 1, 1, 1, 1, 1,
0.7476623, 0.5878991, 1.092732, 1, 1, 1, 1, 1,
0.7542074, 0.9056273, -0.3393722, 1, 1, 1, 1, 1,
0.7566664, -0.8097454, 2.486914, 1, 1, 1, 1, 1,
0.7604392, 0.7631046, 1.330613, 1, 1, 1, 1, 1,
0.7618318, -1.004237, 2.630454, 1, 1, 1, 1, 1,
0.7635653, 0.4374211, 1.954479, 1, 1, 1, 1, 1,
0.7690901, 0.1265541, 1.724576, 1, 1, 1, 1, 1,
0.7724527, -0.00457952, 0.4150743, 1, 1, 1, 1, 1,
0.7772354, 0.07484729, 1.893121, 0, 0, 1, 1, 1,
0.7797021, -0.3734711, 1.579839, 1, 0, 0, 1, 1,
0.7804545, -0.2026558, 1.855318, 1, 0, 0, 1, 1,
0.7843664, 1.182707, 0.2396285, 1, 0, 0, 1, 1,
0.7845329, -0.4301387, 2.750109, 1, 0, 0, 1, 1,
0.7856803, 0.01727927, 1.831166, 1, 0, 0, 1, 1,
0.786089, -1.117378, 0.8556717, 0, 0, 0, 1, 1,
0.790017, -0.839519, 2.178093, 0, 0, 0, 1, 1,
0.7911394, -1.143197, 3.748427, 0, 0, 0, 1, 1,
0.7936624, 0.09991309, 1.920635, 0, 0, 0, 1, 1,
0.795262, -1.197958, 4.391706, 0, 0, 0, 1, 1,
0.8001132, 1.549029, -0.7053748, 0, 0, 0, 1, 1,
0.8134378, 1.799435, -1.336814, 0, 0, 0, 1, 1,
0.815199, -1.457533, 2.48674, 1, 1, 1, 1, 1,
0.8196878, 1.660764, 0.02471679, 1, 1, 1, 1, 1,
0.8198239, -0.4555532, 0.1610629, 1, 1, 1, 1, 1,
0.8349308, -1.075259, 2.710962, 1, 1, 1, 1, 1,
0.8414488, -0.1142119, 2.225451, 1, 1, 1, 1, 1,
0.841478, 0.8556965, 1.444305, 1, 1, 1, 1, 1,
0.8424312, -0.4072274, 2.989386, 1, 1, 1, 1, 1,
0.8442196, 0.1046322, 0.6186969, 1, 1, 1, 1, 1,
0.8495609, 0.3272781, -1.188084, 1, 1, 1, 1, 1,
0.861178, -1.392214, 2.862292, 1, 1, 1, 1, 1,
0.8616566, -0.4322781, 1.859721, 1, 1, 1, 1, 1,
0.8692905, 0.4938019, 1.021389, 1, 1, 1, 1, 1,
0.8729575, -0.4626326, 0.7716959, 1, 1, 1, 1, 1,
0.879243, 0.3604409, 0.5342693, 1, 1, 1, 1, 1,
0.8829399, -0.6531118, 4.394959, 1, 1, 1, 1, 1,
0.884489, -0.1595358, 0.2714839, 0, 0, 1, 1, 1,
0.8881638, -0.3621748, 1.842193, 1, 0, 0, 1, 1,
0.8888278, 0.7318441, -0.1415208, 1, 0, 0, 1, 1,
0.89057, -1.19392, 4.021539, 1, 0, 0, 1, 1,
0.9067012, 0.1861251, 1.043647, 1, 0, 0, 1, 1,
0.9123794, -0.1383767, 1.028212, 1, 0, 0, 1, 1,
0.9130934, -0.4039404, 1.997261, 0, 0, 0, 1, 1,
0.9200097, 2.477307, 1.111172, 0, 0, 0, 1, 1,
0.9205213, -0.6262214, 2.506742, 0, 0, 0, 1, 1,
0.9217819, 0.3806444, 0.1125952, 0, 0, 0, 1, 1,
0.9246011, -1.225399, 2.478644, 0, 0, 0, 1, 1,
0.9299898, -1.128692, 2.988873, 0, 0, 0, 1, 1,
0.9309919, 0.6093893, 2.155492, 0, 0, 0, 1, 1,
0.9318283, 1.107006, 1.772918, 1, 1, 1, 1, 1,
0.9332852, -1.355725, 2.789849, 1, 1, 1, 1, 1,
0.9461059, -0.6810576, 0.1266555, 1, 1, 1, 1, 1,
0.9462408, -1.474235, 2.346911, 1, 1, 1, 1, 1,
0.9477686, 1.230507, 1.783592, 1, 1, 1, 1, 1,
0.9481215, -0.1974676, 2.262264, 1, 1, 1, 1, 1,
0.9484812, -0.6046013, 1.408218, 1, 1, 1, 1, 1,
0.9488339, -2.069807, 4.849384, 1, 1, 1, 1, 1,
0.9535912, -0.06242745, 1.050337, 1, 1, 1, 1, 1,
0.9549491, -0.1506746, 1.408542, 1, 1, 1, 1, 1,
0.9573605, 0.4271702, 1.934679, 1, 1, 1, 1, 1,
0.9575583, 1.602045, 0.9874312, 1, 1, 1, 1, 1,
0.9676718, -0.01972686, 1.226483, 1, 1, 1, 1, 1,
0.9720835, 0.5559123, 3.753591, 1, 1, 1, 1, 1,
0.976796, 1.086344, 0.832126, 1, 1, 1, 1, 1,
0.9782325, -0.5023259, 2.08623, 0, 0, 1, 1, 1,
0.9798808, -1.296164, 2.268192, 1, 0, 0, 1, 1,
0.9806241, 1.089621, 0.6757842, 1, 0, 0, 1, 1,
0.9842628, -0.7185734, 0.8478622, 1, 0, 0, 1, 1,
0.9846775, -0.7698618, 2.774715, 1, 0, 0, 1, 1,
0.9981369, 0.6985976, -0.843736, 1, 0, 0, 1, 1,
1.00006, -0.7086592, 3.306066, 0, 0, 0, 1, 1,
1.000489, 0.3721511, 1.897362, 0, 0, 0, 1, 1,
1.01255, 2.263604, -0.9730963, 0, 0, 0, 1, 1,
1.013311, -0.9122349, 1.52628, 0, 0, 0, 1, 1,
1.0169, 0.7548918, 0.686989, 0, 0, 0, 1, 1,
1.037153, 1.021298, 0.5184411, 0, 0, 0, 1, 1,
1.040342, 1.934432, 0.110861, 0, 0, 0, 1, 1,
1.040564, 0.1282866, -0.1041951, 1, 1, 1, 1, 1,
1.042104, 0.9995114, 1.727146, 1, 1, 1, 1, 1,
1.047303, -0.3906824, 2.102529, 1, 1, 1, 1, 1,
1.054437, -0.3737824, 0.7495732, 1, 1, 1, 1, 1,
1.05516, -1.221229, 3.364875, 1, 1, 1, 1, 1,
1.055187, 0.5328525, 2.052073, 1, 1, 1, 1, 1,
1.055877, 0.5169752, -0.7099922, 1, 1, 1, 1, 1,
1.062245, -0.2242614, 2.084557, 1, 1, 1, 1, 1,
1.062804, 1.106589, 1.680168, 1, 1, 1, 1, 1,
1.066522, -2.995172, 3.521869, 1, 1, 1, 1, 1,
1.066817, 1.737487, 1.431991, 1, 1, 1, 1, 1,
1.06928, -0.2160678, 3.524364, 1, 1, 1, 1, 1,
1.076232, 1.854284, 1.004525, 1, 1, 1, 1, 1,
1.081058, 1.426184, 0.4768197, 1, 1, 1, 1, 1,
1.082397, 0.9100878, 1.486343, 1, 1, 1, 1, 1,
1.082464, 2.030597, 2.507494, 0, 0, 1, 1, 1,
1.082554, 0.1003793, 0.05427028, 1, 0, 0, 1, 1,
1.084123, -0.1024887, 2.070345, 1, 0, 0, 1, 1,
1.084397, -0.05877258, 1.728916, 1, 0, 0, 1, 1,
1.085987, 0.4686489, -0.2491175, 1, 0, 0, 1, 1,
1.096313, 0.2951326, -0.562287, 1, 0, 0, 1, 1,
1.100911, -0.2590105, 2.254514, 0, 0, 0, 1, 1,
1.10329, -0.5317765, 1.884022, 0, 0, 0, 1, 1,
1.10557, -0.282803, 2.614593, 0, 0, 0, 1, 1,
1.109333, 0.7682807, 0.003354551, 0, 0, 0, 1, 1,
1.124082, -0.5008923, 2.153752, 0, 0, 0, 1, 1,
1.124612, -0.4263529, 1.033412, 0, 0, 0, 1, 1,
1.142951, 0.6434524, 0.9783158, 0, 0, 0, 1, 1,
1.143576, -0.003627073, 1.756303, 1, 1, 1, 1, 1,
1.149677, -1.133803, 3.09732, 1, 1, 1, 1, 1,
1.150506, 0.6820438, 0.7765368, 1, 1, 1, 1, 1,
1.15205, -0.9910482, 1.813421, 1, 1, 1, 1, 1,
1.154491, -1.587156, 3.907642, 1, 1, 1, 1, 1,
1.155053, -0.9326461, 2.394319, 1, 1, 1, 1, 1,
1.155598, -0.3160157, 1.497859, 1, 1, 1, 1, 1,
1.158053, 0.5747068, 0.05328774, 1, 1, 1, 1, 1,
1.160907, 0.002970082, 1.821671, 1, 1, 1, 1, 1,
1.174576, 0.0762651, 0.9317794, 1, 1, 1, 1, 1,
1.176408, 0.4196602, 1.070168, 1, 1, 1, 1, 1,
1.17726, -1.308638, 3.06227, 1, 1, 1, 1, 1,
1.180179, 0.02646126, 2.283985, 1, 1, 1, 1, 1,
1.184712, 0.2469548, 1.396385, 1, 1, 1, 1, 1,
1.186191, 0.3104924, 0.1616533, 1, 1, 1, 1, 1,
1.186857, -0.9835879, 2.20099, 0, 0, 1, 1, 1,
1.20919, 0.7501737, 0.9299382, 1, 0, 0, 1, 1,
1.226189, -0.7063178, 2.511641, 1, 0, 0, 1, 1,
1.229236, -0.4438488, 0.9755382, 1, 0, 0, 1, 1,
1.23107, -1.253303, 0.7030557, 1, 0, 0, 1, 1,
1.231494, 2.06116, 0.2108537, 1, 0, 0, 1, 1,
1.233157, -0.2285099, 1.697877, 0, 0, 0, 1, 1,
1.238954, 1.162587, -1.108421, 0, 0, 0, 1, 1,
1.245458, 0.2070682, 0.5629876, 0, 0, 0, 1, 1,
1.256987, -0.07934471, 0.7660807, 0, 0, 0, 1, 1,
1.261547, 0.303874, 2.32246, 0, 0, 0, 1, 1,
1.269486, -1.219382, 2.582393, 0, 0, 0, 1, 1,
1.271799, -0.6910551, 0.2935865, 0, 0, 0, 1, 1,
1.272914, 0.6367169, 0.5514039, 1, 1, 1, 1, 1,
1.29185, -0.3495126, 1.020107, 1, 1, 1, 1, 1,
1.301603, 0.5162165, -0.2336892, 1, 1, 1, 1, 1,
1.305366, -0.08885399, 0.6259382, 1, 1, 1, 1, 1,
1.307262, -0.7278666, 3.811985, 1, 1, 1, 1, 1,
1.315058, -0.4995632, 1.602147, 1, 1, 1, 1, 1,
1.316364, -0.7884361, 1.16217, 1, 1, 1, 1, 1,
1.317786, 1.210444, 0.4286334, 1, 1, 1, 1, 1,
1.320637, 1.004306, -0.9017073, 1, 1, 1, 1, 1,
1.328949, -2.296008, 2.33042, 1, 1, 1, 1, 1,
1.336394, -0.1456946, 1.818775, 1, 1, 1, 1, 1,
1.337607, 0.929637, 1.940845, 1, 1, 1, 1, 1,
1.341372, -0.9297263, -0.6239555, 1, 1, 1, 1, 1,
1.344039, 0.2012314, -0.2318424, 1, 1, 1, 1, 1,
1.350768, 1.322742, 2.337915, 1, 1, 1, 1, 1,
1.36816, 0.108397, 0.09121439, 0, 0, 1, 1, 1,
1.369783, -1.02511, 2.575168, 1, 0, 0, 1, 1,
1.372029, 0.2694255, 0.9283349, 1, 0, 0, 1, 1,
1.37364, -0.84141, 4.294974, 1, 0, 0, 1, 1,
1.379705, 0.6749486, 0.7951953, 1, 0, 0, 1, 1,
1.385259, 1.190649, 1.447752, 1, 0, 0, 1, 1,
1.392731, 0.1859862, 1.926953, 0, 0, 0, 1, 1,
1.396536, 0.3799285, 1.786396, 0, 0, 0, 1, 1,
1.401189, -0.01747623, 1.78762, 0, 0, 0, 1, 1,
1.401916, 0.9293432, -0.7383264, 0, 0, 0, 1, 1,
1.407565, 0.7972432, 0.2841419, 0, 0, 0, 1, 1,
1.418674, -2.534801, 2.046297, 0, 0, 0, 1, 1,
1.420597, -0.4498963, 3.155421, 0, 0, 0, 1, 1,
1.425159, -0.9376357, 1.807399, 1, 1, 1, 1, 1,
1.433331, -1.120109, 0.4940285, 1, 1, 1, 1, 1,
1.433814, -1.163038, 1.983593, 1, 1, 1, 1, 1,
1.455657, -0.6498235, 0.5974619, 1, 1, 1, 1, 1,
1.461718, 1.790103, 4.535849, 1, 1, 1, 1, 1,
1.469994, 1.186146, 1.087084, 1, 1, 1, 1, 1,
1.472588, -0.5815253, 2.300202, 1, 1, 1, 1, 1,
1.475455, 1.081951, 0.4755887, 1, 1, 1, 1, 1,
1.476691, -0.6753422, 1.284513, 1, 1, 1, 1, 1,
1.477143, 1.527842, 0.3939641, 1, 1, 1, 1, 1,
1.494251, -0.1075731, 2.71515, 1, 1, 1, 1, 1,
1.501731, 0.6409743, 1.714887, 1, 1, 1, 1, 1,
1.513808, 1.322168, 2.123659, 1, 1, 1, 1, 1,
1.529358, 0.1891718, 1.738401, 1, 1, 1, 1, 1,
1.543114, 0.1546711, 1.927204, 1, 1, 1, 1, 1,
1.549681, 0.8788156, 0.2956614, 0, 0, 1, 1, 1,
1.552094, 1.491432, 0.9868248, 1, 0, 0, 1, 1,
1.564453, 1.575294, 1.737528, 1, 0, 0, 1, 1,
1.574911, -0.5806124, 2.476658, 1, 0, 0, 1, 1,
1.57696, 0.6602682, 1.67758, 1, 0, 0, 1, 1,
1.578441, 0.5169538, 1.750127, 1, 0, 0, 1, 1,
1.585625, 0.6295586, 2.56793, 0, 0, 0, 1, 1,
1.59235, 1.387624, 0.7127265, 0, 0, 0, 1, 1,
1.601792, -0.02790822, 1.513145, 0, 0, 0, 1, 1,
1.630641, 0.7998626, 2.624237, 0, 0, 0, 1, 1,
1.638072, -0.1524542, 2.228425, 0, 0, 0, 1, 1,
1.654241, -0.4063289, 1.688147, 0, 0, 0, 1, 1,
1.726043, -0.4606258, 1.018659, 0, 0, 0, 1, 1,
1.733238, 2.357826, -0.2015306, 1, 1, 1, 1, 1,
1.760137, -0.3749024, 2.006447, 1, 1, 1, 1, 1,
1.772214, -0.5775765, 1.180114, 1, 1, 1, 1, 1,
1.782713, 0.585018, 1.81817, 1, 1, 1, 1, 1,
1.785511, -1.90232, 3.022556, 1, 1, 1, 1, 1,
1.828494, -0.1136911, 3.506705, 1, 1, 1, 1, 1,
1.868365, 2.040312, 1.006093, 1, 1, 1, 1, 1,
1.869522, -1.483942, 3.223163, 1, 1, 1, 1, 1,
1.872578, 0.9704806, 1.825849, 1, 1, 1, 1, 1,
1.873912, -1.674928, 2.8948, 1, 1, 1, 1, 1,
1.874155, -0.294668, 1.527687, 1, 1, 1, 1, 1,
1.895605, 1.191445, 0.6465, 1, 1, 1, 1, 1,
1.921338, 1.210875, 1.137162, 1, 1, 1, 1, 1,
1.930517, -0.3572508, -0.364703, 1, 1, 1, 1, 1,
1.932459, -0.8731095, 1.396919, 1, 1, 1, 1, 1,
1.945089, 0.385039, 2.150637, 0, 0, 1, 1, 1,
1.988441, -1.487908, 2.52839, 1, 0, 0, 1, 1,
2.003569, 0.3921575, 0.8505698, 1, 0, 0, 1, 1,
2.011254, 0.06699276, 0.9106509, 1, 0, 0, 1, 1,
2.088331, 0.08752308, 2.361781, 1, 0, 0, 1, 1,
2.099725, 1.707064, 0.3846729, 1, 0, 0, 1, 1,
2.114605, -0.626507, 2.234824, 0, 0, 0, 1, 1,
2.130762, 0.7445011, 2.300961, 0, 0, 0, 1, 1,
2.156302, 0.2169499, 1.390455, 0, 0, 0, 1, 1,
2.159707, 0.3086371, 2.751743, 0, 0, 0, 1, 1,
2.175571, 0.3040711, 2.764986, 0, 0, 0, 1, 1,
2.193007, -1.143061, 2.626697, 0, 0, 0, 1, 1,
2.200154, 0.3229251, 2.200489, 0, 0, 0, 1, 1,
2.209711, 0.3134286, 1.943476, 1, 1, 1, 1, 1,
2.488684, -0.2758879, 2.783101, 1, 1, 1, 1, 1,
2.701038, -0.4996696, 1.640627, 1, 1, 1, 1, 1,
2.714323, 0.1844095, 1.70947, 1, 1, 1, 1, 1,
2.748317, 0.03974271, -0.6092045, 1, 1, 1, 1, 1,
2.80077, -1.508737, 2.585701, 1, 1, 1, 1, 1,
2.873315, -0.9295891, 0.9876249, 1, 1, 1, 1, 1
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
var radius = 9.929429;
var distance = 34.8767;
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
mvMatrix.translate( 0.03269386, 0.03487468, 0.39289 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8767);
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
